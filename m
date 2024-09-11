Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD249EE01F4
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 00:09:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F94410E2D7;
	Wed, 11 Sep 2024 00:09:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DSmur/TN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE2F810E2D7
 for <Intel-Xe@lists.freedesktop.org>; Wed, 11 Sep 2024 00:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726013382; x=1757549382;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=/oQ/khmTYNIf6hrWoU19NLf4L3pe7kLaRmyuurcgylM=;
 b=DSmur/TNuiojp40tjlr20GGRy2Tz1PkBVrWLAO0RndwKcVgLEbarqcaW
 1WVmv7nZQJ8gzk26Tigq4Y5JVsTg+CAgDcQ69j9jQ/PZEYkYO6XIDpNjD
 iQ5TZrK+EKqI5I8S1r3IcraCbkGF1PV0aQ/YZH6ljAzJYi4wUpA3Wgf2c
 jm/Ors3iwyz1YCK4xbuXE4IINIH8I9UCY/1dMO3Xiwz+YLV4bXcmIWdyc
 rJ0vaPw/vklYjtQjeDKbcXqLlammdrevKS7babGyOm2jxQLxIGHIVYdTn
 XZD9J9xJSGTYgYNmvSIk4QFQAK55kNO6g/RZWQqhw5gVi8hiX0qBtZp0S w==;
X-CSE-ConnectionGUID: BQNdKRdLQgmYkiY1+aimzg==
X-CSE-MsgGUID: po5EeZzpSvCEJQ/4ZfufyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="28531823"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="28531823"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 17:09:41 -0700
X-CSE-ConnectionGUID: 3xJmrsdZSMyg5b284G6Spg==
X-CSE-MsgGUID: m7V/K1GrTAykhm8483BKwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="67702464"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 17:09:42 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 17:09:41 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 17:09:41 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 17:09:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vJmcLpQBi33T/uzaDgwRA2DtpaH3Ab0IgkNnJjhgMYKg32UySUJ/DCazQ/l6fp91JgQy+Z1VB/L1c6OltvaS50dSUT38lS5XKNLpHMa9nNFAiCs07E6CtyuYFAu5D+RK329IvP2tJtYvHBg2E7w32ljHjKuO+XkszuGtKraomtyT5l/I+OfzZY5pkDeT0oQyXLV7JFWWEIbriwUX4Eyev3lKf1Q4KA57bkUDAIxAdSrfPTw/k5mUUlfUFW59BqRAQuLU+t9jhy01rXtwhO5c9qyWb6xHvpLDskPp04/8hxeipReS/8dkLnqfv8EySiqj50fz35jLVYxu1Qs1LniUUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dmZV233ShXH4efd8my74P7xfzaEmZKSuTAKfi9LTjfA=;
 b=SuiRpMThcNXqH5uQmEN/6sEz4Sp9/lgzXoBV7mMcBKYjezJFxRya4RwNPfLZ+63q7lkNZ+RL5gEbq2tePjysoIhCgClCMj8f6J9KVcZggVc8ODSvHC9feDgiCTbmPRJH+YuG+NXFc6fJ4MExXIlVH2PJQcpE2t6YGQsgA2oUh9JG1Dcsq3snaQCxlqMFD9osp4k6X5ow/2ZjyKDXdgDOsXNsKZUlnLJq5k+H4mrITwSDb/FQncxmB4KMi/kXKcOcJZr9hxTON9p9nWk6u99l/a+HI4PVl8COi9ydavsX5zlCp5iVdlMjgeRlCEqw62q8hKCoyx1yeY+8eeifdvmTfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by SJ2PR11MB7620.namprd11.prod.outlook.com (2603:10b6:a03:4d1::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Wed, 11 Sep
 2024 00:09:38 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%7]) with mapi id 15.20.7918.024; Wed, 11 Sep 2024
 00:09:37 +0000
Message-ID: <86d3b041-3233-4a01-9186-9caf741161bc@intel.com>
Date: Tue, 10 Sep 2024 17:09:34 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 07/10] drm/xe/guc: Dead CT helper
To: <Intel-Xe@Lists.FreeDesktop.Org>
References: <20240905205106.1063091-1-John.C.Harrison@Intel.com>
 <20240905205106.1063091-8-John.C.Harrison@Intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240905205106.1063091-8-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR08CA0048.namprd08.prod.outlook.com
 (2603:10b6:a03:117::25) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|SJ2PR11MB7620:EE_
X-MS-Office365-Filtering-Correlation-Id: 822c01b6-1d31-46cc-8f18-08dcd1f60630
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eHdqa05ZdXFpdExQQzh3TmZNRHAwU0FzcjFMV0lpMERlaUVzTFltek93RzBv?=
 =?utf-8?B?TUw2cDdVbGtiS2Q3RzAzZXVLNTJXSnVrZXk3LzJDbkQ5MUJqdzFSNUt0dFdj?=
 =?utf-8?B?MnFscFpSN0xpYXBYMk0xSVAwMEpjeHZuYnpYTnFIbE5UTnRyVWozUGRmV3RZ?=
 =?utf-8?B?K1FZeStmMTFKeERjN2JmdzNYcUUvZzVZY0trcTRlWVpqL0pvQWM2cEVRcU04?=
 =?utf-8?B?ellzWVVqZFNOcktuY0dwQ1B3c3VZcXlHVlFPQ29nRWxTZU9KYVIrbFlkRkh5?=
 =?utf-8?B?V2xhcGdFekZrOHFtVmRWK1FsaHZXcDhtL0NBUkpBYjdxZXBqdWhQUXVObWRW?=
 =?utf-8?B?NSt0LzhLd2JmNlVZRElIUEUyOTc0eFArbC9UWm9MMjZ6ZXd3Uko2cE0vaHh3?=
 =?utf-8?B?L1JoOWhyNHp0UmpoR3BreGI0TWZFdml2QkFzblJqeFAzZ01lbzZsN2VqdGFC?=
 =?utf-8?B?QzhJZWo4VStaalltd0JhMUxZdHhQKzlLc1dKem1XMmIwdjBmN1FGSG82UEFO?=
 =?utf-8?B?dDNENG90QnlJbnp2LzFiQ0lRczdXSnFQeWs4Y3YrdDBUdFlxdDlKWFNzUG16?=
 =?utf-8?B?ZUlCL3FmcEM1ZDB3L1JmeHpNM0hEVU9TVlJ4WUkwSUhNWVlRVEZHUDhqWjFo?=
 =?utf-8?B?bUg4NW5LNjdVN29EMTNVd1AwTzJaVWNFWk85RUFUOTAxc0lRS3RFVjkrN1Rn?=
 =?utf-8?B?VGFjZEQ1N1hGRWt3ZUsrOTdBd1FRdW5MYUMrTVZiM2oySlkwd1pYMTVOcnpn?=
 =?utf-8?B?MnlBdGdFdXRGWjJ5YW1nTklZWlhqTXBhM3ZQb2JpbHBpOEFhYzUvTzFFcldG?=
 =?utf-8?B?UkU5Sk5BdmRwUm82YmsxK3lWWE9uUHBSSlZjSmRXYmhiLzJ3SXNEbEhTRUxE?=
 =?utf-8?B?T2pmamthanNKWU9XcCtlZVJFbzQ3M0cvVVJzUEdJY2FGQUtQaXVUVzV3d082?=
 =?utf-8?B?UFhxM3RUbFV2ME9oTUg4T3phNmw3YnM3OXFKRzlYaUVITkM4Q3FkNDhkeS9j?=
 =?utf-8?B?TGY4UWw5MVBlV2lZYVVXZDhLMlhhcTcwTktFNU5TWjZtTnlUeUg0SWtnQjg3?=
 =?utf-8?B?TVJYYWJKRlhKcUJqMi8yYzlEREpZOW1Dcy9CNjltbzE1NG9yOFJPTk4xOGVY?=
 =?utf-8?B?Tmg3Yy9KY0gwaXRSMG1RRlhIaXkzZ2VNaXZJV1N0RjZ1NlR0RnZsSzQ4UFUx?=
 =?utf-8?B?bjlINDlQQ2NDZllQVmtmR3l2UmVUNFdGSEtWVzR5YUliVjE0M09nUWpqc2Z6?=
 =?utf-8?B?SXVHbElEc2M3RHpDbmgrQjdxeG1sazY1Tm5tSkx0RXk5NEx1cm4zMmxTVFJU?=
 =?utf-8?B?UFlRWDdHUndnakdIRjFiekRjZWVhY3V3d0hXYnpFVVVHRzRuWVRETStpWFZ0?=
 =?utf-8?B?R3hvK0JMTmRaYlovRDBxbjVLRkFPbmgzOG0wQmJMSUZTWmU0SlV0cmx5YUZz?=
 =?utf-8?B?cWtWMTdLUkxEWHh5NjZFUm5ENXl5WTZQYzdUSWVSaWpUYzhzMlkwMFpGcHEz?=
 =?utf-8?B?YzBWS1UrRGVBMlYzQWdyenF1SlhWTmY0VGNpd1JmTUh1eHNGOW9udzVxZktL?=
 =?utf-8?B?ajFQY2FVYUhDRHhaa0tBOXZKYVB2a2NneGpEOTBZcUxUUGYxY3pmRFRMNldI?=
 =?utf-8?B?bUlmK3M4TzVoODduQjY2Rkdta0o0SkJFaTJTZXY1Tnkza210VjNOWFYzRjRL?=
 =?utf-8?B?MmVHZUFac0FkUEF2Rm5hWXp2OHNid1dCeXVhRHNxK2FWRk8xMXN6bVF3R3pp?=
 =?utf-8?B?QkV4QTkreitMQytXRXErRU93bTErT0lwQm8wSnZkbUQyUlBvZGt1YTcyY3pq?=
 =?utf-8?B?RXNHYXhUMFVaN3VvYjFLdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1N2aWlRVFk2UTdNTlRvSHZyYzlaUnZqWDkvMzhrdE9iZExNdVJoVkpEMjZk?=
 =?utf-8?B?UEdUeVFZZm1tZFJnckZqU3NIcmNPSnZjaHpVSzg3UDZPa2xyVmJnNlFreFI4?=
 =?utf-8?B?Z3dYTmV2VkJUVHZxbWVBOUQ3UHNnOHJqMTRJbk1SekFsODN1dlhxWUJQdCs4?=
 =?utf-8?B?MjA3MTFpcU9OUDJkK2lPZmszQ2drMnQ3T01xaHIybDltVG5tMUpraFNKbHVx?=
 =?utf-8?B?cjZ3Ylhwd3RYRXduYzVwdGJYL2xSeDNkbE92R0ViNFV6TlVWRmNrVUJ3dkt6?=
 =?utf-8?B?V29uY1I0L1JLQWFjK0hyV1V2bThBdWtTWFBrclBmRHg0eWlhSVJLa3RZM3Rs?=
 =?utf-8?B?b3hjN2VhbXdnY0ZteWZaZTlZcU94OHFHQ0lPTjRkUFQrQklZK1FGejhiNGhC?=
 =?utf-8?B?d00wV0JYQ1ZwYTR5dTJnNW52WFNUQVdjTGU3RTVzZFlkT01vMEhEcTZJdWFi?=
 =?utf-8?B?ZU03U0xJTXEvOHhrQUFWb3VoQjZvd09mTEZUM3JzYm1uVU82a3IrRjJoSWtX?=
 =?utf-8?B?TzNIUlZrSzNYemx3REpET0ZrRllkOFpoemtxWFprWlUrOE83OG5oSkRUeGdK?=
 =?utf-8?B?dGQ3YmczOGVZSWdHQjhPMlgxdW5XQUhtaGpKNE9MeWVoYVg2UmI2RGpRQXN5?=
 =?utf-8?B?TzAwbFhyTEttVVpDMDVvN1hEVzM2ZjAwcnlxMUxZN0IvcjNMK3lCM2Y4MHNS?=
 =?utf-8?B?S3NhZ3E1blBWU2t6L1RybXVmYi9xdUpJc2ZmbEFsTjJKTkJhNFJBYmxGTDBU?=
 =?utf-8?B?UjZGeFl2aUdNdUtQbWNuM2plZkxPdHJ5c2FTcURsajJzbUZDK0pndkhSNlI0?=
 =?utf-8?B?YldyMk84NFJwZWV3NDBxUklpTm5QTnhDaVlTNTk0UU84akRhQ21ka0R2L1hN?=
 =?utf-8?B?NFBmMnl5MThzd1RrKzBlaFRBTTRHbURrL1hXWUpvYkR6Qy93aHU1UE9oMjZk?=
 =?utf-8?B?TTZqL0R5ZjlMQUJDTUZNaXlBMU93MkhHdjFBaG1IN093U0pSbE1FaFk1YXNF?=
 =?utf-8?B?OUtrVjJoSGZVREU1VlVHQlorMEhCM3JlV1hpUXVFbkp1Nm9aRnF0cm5QQXVI?=
 =?utf-8?B?WElVdGVkMTJDK21GaXpTR1RFeUNwM1lWeEppQmRRL3plMDNvSlpOc1c1eWVt?=
 =?utf-8?B?WkwybEZNWFJNQlJ3QVVMUmlsWjF3YkRRdUkwS1cwYlRjeUtZUlJpOTJJSUNm?=
 =?utf-8?B?emFDbGhMV3ZDajkyZ2djMDRsUmNjQ2IyRjJuQWxnNEY4NkVOaElSUi9TWTdQ?=
 =?utf-8?B?czN5L0VEMEp2ai9aM0tYSWZoMTd6QXRycHEvZmhXb3pURUZmZ2lqMCtOWGtX?=
 =?utf-8?B?RWtoV1VkRHZnQUJ4cjdSNG9hQ2FZVmY3TytXYUFQdFNWZjFTdkpTdDJQdCtl?=
 =?utf-8?B?R0ZlV2c4eFBKbG5JYkdHU3FhcVNzem55UTJHUWtDQUpZTkl1RWo5SWxXYUxG?=
 =?utf-8?B?VzVQU0s2bmxGZnhqM0gxQ0wwSWVjdHJCMS9PL1JPZlh6UlUwc1pjSjRqZXVW?=
 =?utf-8?B?YjVUY3cxTnM5Tzd0c1ZzU1JDQmZOVCt4c3d3bEg2VXdxUzhzc1A1OURuTVNO?=
 =?utf-8?B?OFM3dVE1UVNiUzVpK3l5MHlleVBPUUQ3QTRNQWJzQ2wwYzRySkd3MThHRm4v?=
 =?utf-8?B?TUZ1SEVXRDAxVThqc1U4MHRPTVg4OTJ4dVpnSDk1T3dic2s1ZFVzN3hJdFZh?=
 =?utf-8?B?YVF0YllGdGhGSEUrc3RBN0ppZUlvN2RHZ1dYOEFvdGFlUEpHS2IxdXlZd2lw?=
 =?utf-8?B?bmNBM3VJVThDZUJxUXFwMnQxNGs1NXU0dERFclRneGh2S1l0MjFkdlVCL090?=
 =?utf-8?B?SSswSjVtNHY4NnpSbnNRQUt0Q1lRWDh4b2RmSGw5SUlHeGlzWnQ1QWRhOU9I?=
 =?utf-8?B?N3RVSnQzcjdSK05ZMEFxZWtIZGJldFNidWxsTDNBT0FpS2ZWcjl1blgvSkFZ?=
 =?utf-8?B?Y2kzYlc4UVpUeE01TmFMSm13MForWG43REdwRmZGQTltbzd6TW5jRlNCM1hD?=
 =?utf-8?B?OTNYYzdRc2tOMjBkaTkwU2orMWg2UmFOL3B2Mm1kZFIrZjd5alkrVlFvTDA3?=
 =?utf-8?B?UkErd1FmZzd1V25LUjlFajlBVkhTNndOQ3puNCs5ZEhvSjZSbGF1d2FXY0Nn?=
 =?utf-8?B?ckZEMGJKRWJCZ2UxMVovUTlxd1JPM21LcktSMm9IY1NIUFNLQjlvditHZ0dX?=
 =?utf-8?B?OGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 822c01b6-1d31-46cc-8f18-08dcd1f60630
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 00:09:37.7366 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OrUulrDBIdM9N9uiheDyYjqXwA/QZXgCQt8gd4WrlmEbYrg+JBgU67TYlXf4y9fl+1Jxx6hpnJegchBEV1zbIPXfEk4EDHKmb1CuDcPO/8c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7620
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 9/5/2024 13:51, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> Add a worker function helper for asynchronously dumping state when an
> internal/fatal error is detected in CT processing. Being asynchronous
> is required to avoid deadlocks and scheduling-while-atomic or
> process-stalled-for-too-long issues. Also check for a bunch more error
> conditions and improve the handling of some existing checks.
>
> v2: Use compile time CONFIG check for new (but not directly CT_DEAD
> related) checks and use unsigned int for a bitmask, rename
> CT_DEAD_RESET to CT_DEAD_REARM and add some explaining comments,
> rename 'hxg' macro parameter to 'ctb' - review feedback from Michal W.
> Drop CT_DEAD_ALIVE as no need for a bitfield define to just set the
> entire mask to zero.
> v3: Fix kerneldoc
> v4: Nullify some floating pointers after free.
> v5: Add section headings and device info to make the state dump look
> more like a devcoredump to allow parsing by the same tools (eventual
> aim is to just call the devcoredump code itself, but that currently
> requires an xe_sched_job, which is not available in the CT code).
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   .../drm/xe/abi/guc_communication_ctb_abi.h    |   1 +
>   drivers/gpu/drm/xe/xe_guc.c                   |   2 +-
>   drivers/gpu/drm/xe/xe_guc_ct.c                | 280 ++++++++++++++++--
>   drivers/gpu/drm/xe/xe_guc_ct.h                |   2 +-
>   drivers/gpu/drm/xe/xe_guc_ct_types.h          |  23 ++
>   5 files changed, 280 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h b/drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h
> index 8f86a16dc577..f58198cf2cf6 100644
> --- a/drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h
> @@ -52,6 +52,7 @@ struct guc_ct_buffer_desc {
>   #define GUC_CTB_STATUS_OVERFLOW				(1 << 0)
>   #define GUC_CTB_STATUS_UNDERFLOW			(1 << 1)
>   #define GUC_CTB_STATUS_MISMATCH				(1 << 2)
> +#define GUC_CTB_STATUS_DISABLED				(1 << 3)
>   	u32 reserved[13];
>   } __packed;
>   static_assert(sizeof(struct guc_ct_buffer_desc) == 64);
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 34cdb08b6e27..3fef24c965c4 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1176,7 +1176,7 @@ void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
>   
>   	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>   
> -	xe_guc_ct_print(&guc->ct, p, false);
> +	xe_guc_ct_print(&guc->ct, p);
>   	xe_guc_submit_print(guc, p);
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index a63fe0a9077a..e31b1f0b855f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -25,12 +25,57 @@
>   #include "xe_gt_sriov_pf_monitor.h"
>   #include "xe_gt_tlb_invalidation.h"
>   #include "xe_guc.h"
> +#include "xe_guc_log.h"
>   #include "xe_guc_relay.h"
>   #include "xe_guc_submit.h"
>   #include "xe_map.h"
>   #include "xe_pm.h"
>   #include "xe_trace_guc.h"
>   
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> +enum {
> +	CT_DEAD_REARM,				/* 0x0001 - not an error condition */
> +	CT_DEAD_SETUP,				/* 0x0002 */
> +	CT_DEAD_H2G_WRITE,			/* 0x0004 */
> +	CT_DEAD_H2G_HAS_ROOM,			/* 0x0008 */
> +	CT_DEAD_G2H_READ,			/* 0x0010 */
> +	CT_DEAD_G2H_RECV,			/* 0x0020 */
> +	CT_DEAD_G2H_RELEASE,			/* 0x0040 */
> +	CT_DEAD_DEADLOCK,			/* 0x0080 */
> +	CT_DEAD_PROCESS_FAILED,			/* 0x0100 */
> +	CT_DEAD_FAST_G2H,			/* 0x0200 */
> +	CT_DEAD_PARSE_G2H_RESPONSE,		/* 0x0400 */
> +	CT_DEAD_PARSE_G2H_UNKNOWN,		/* 0x0800 */
> +	CT_DEAD_PARSE_G2H_ORIGIN,		/* 0x1000 */
> +	CT_DEAD_PARSE_G2H_TYPE,			/* 0x2000 */
> +};
> +
> +static void ct_dead_worker_func(struct work_struct *w);
> +
> +#define CT_DEAD(ct, ctb, reason_code)								\
> +	do {											\
> +		struct guc_ctb *_ctb = (ctb);							\
> +		if (_ctb)									\
> +			_ctb->info.broken = true;						\
> +		if (!(ct)->dead.reported) {							\
> +			struct xe_guc *guc = ct_to_guc(ct);					\
> +			spin_lock_irq(&ct->dead.lock);						\
This needs to be spin_lock_irqsave because CT_DEAD can be called inside 
an ISR. Without the save/restore, it will explicitly enable interrupts 
again and, as seen in the CI failure, that causes a WARNING:
     irq 210 handler dg1_irq_handler+0x0/0x240 [xe] enabled interrupts

John.


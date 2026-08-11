Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C68EC5CFCF
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 09:03:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3A7310E240;
	Tue, 11 Aug 2026 09:03:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BNrQOsLC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13A1A10E240
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Aug 2026 09:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786438980; x=1817974980;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=6gnOeStcsIVIkb/3VQQKbkAQXLA8NojPSkvUjvTcV/o=;
 b=BNrQOsLCV7CQIjCXC84QtgfkBKm0E7SwHlUmxWqO1PfOBTpZovTM9wQH
 yLAzQ5gdAdd7IKZ4+W8iRGdXlQ5hl5yMQuOdrr+IfTBXSrr+tfcMQ58Lb
 wv8i8nEsoI+dvoSoGGCRD1M/nebd4yBw6AFjkYgeawsFh9vTWyQFGfrG6
 Mhxvz8cS+ZuUMA8k4HnLy/FmW2ZEq2LEqWD8OoYzhTVHhhooyk0a4HezN
 8izjwF6BRo1zk1nH19IlkSiGR8SJ9dsRihm3eU57N4rc9RL+UNG+1bt3B
 RkwBNgqnjxWkA/f/YmApYTsqXIwtHHuN1p9bQr/Pa9ulpemg19v9K3i5m A==;
X-CSE-ConnectionGUID: 0sRpOZ3BQc6uDh6i73amtA==
X-CSE-MsgGUID: P8uttQ9kSjKvb4u5wR6iEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="112510206"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="112510206"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 02:02:59 -0700
X-CSE-ConnectionGUID: 5VSvOsFDQWKRsf+f0tnK7A==
X-CSE-MsgGUID: XCAGtEsETXKnU/AwZmBbJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="261971941"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 02:03:00 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 02:02:59 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 11 Aug 2026 02:02:59 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.71)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 02:02:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gv3CiGeo3qvJhjn0mLysDMWvs2cS7pV0Xgsu7cXBwmVmxOetTN0aXF8eYdxOybeZVz0txOFwSSaGdUwXWhSbGOJ5dZXb6eqPaGPSfRgUaVQVeOBJBDZoT7WFXrTrxYLaka/432ZwYC0ysk2EzhX+JXlfDqrTYg3xjfjykTR7TOcOL1oPor3ztww6qufTbcYsqb5v160+oLIcWhYtvKkAjY1Ky/36RGQqy9IP8JLmQ6pgSdlWF+J0IRj9lppZqnuTo3ImzG5kwutNUnXFrLUj/BFuawTaLDH1/FKEvCQ4zUnY6aM01hNsu6iNVo43JoModH3vBTZolwu+5pl+BnaeAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R15SsJvFkQT9UnUS5dRqDkHq6x3j+uk90B7RR0xjuXs=;
 b=yuN5TOK6cvXLBGbpsMPldL4/B/rZOpRXfVWss+eoe741Ok8GVly3UL851wdAR6y0pTxFJz+Uxx0jdo3T5XSYpJa78xnSKswBVxLoBlNY13Y8TrZQHLAa7n6w2EVKWhuqgnd41kQGUcItUI5oj3kR5ns8ays97CTylEmrAVo81022/M9oV0aLbz6nHewqI+HcBznfPKgivlmWYSFXq17vFwkMHHb8dCGZN9GFvh43NXMDOIy15BMHrYkh4Z953ndlSYUNhkSN+iE7dbLhzbWj7cHBo1T+7A9xZW8+b0OnKzvXvqrYe5lwhZpu8vO2YhiOMKXlMqc0jR0XPDIJtGV+MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by IA1PR11MB6268.namprd11.prod.outlook.com (2603:10b6:208:3e4::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 09:02:55 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 09:02:55 +0000
Message-ID: <2a2b00af-e895-40d8-9345-47904a9bc34a@intel.com>
Date: Tue, 11 Aug 2026 11:02:51 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/6] drm/xe/vf: Split submission config query helpers
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260810101428.1009573-8-satyanarayana.k.v.p@intel.com>
 <20260810101428.1009573-10-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260810101428.1009573-10-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0019.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::23) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|IA1PR11MB6268:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ef77a21-f623-4db2-7cdd-08def787554e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|6133799003|10067099003|4143699003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: orl1ggFyrPSvlrRUjGDKDG+BZDhFVmPeNa4nAgLSbAms5P0sWdFpSJdILHkgOYvHO4wi7BIDnAjBw+dQRMke7dD7peUFF02PaKHUkhBgqsFnDj8dOM43/ICTvbeipr1vNPBvKk+KufviVeT5NHZmj340EktD++pl4UhAjhyD4ejsJJpbrsbutXkHSuzeJeKu/u/YYtPuuPObmi2RUJAJKmXkq4ITGbHlewbGt1flPpr4fVqOkBLhuIbX/k8ykFqzF4BPcchXuvjnbtz3yjQVeMe08TO80BgtiI4QezqdFxMZA4CmDgRlQK2thWZaoyRpZjGSMrSXgImFGqG9SEdjLLw1SF2jiYMPiwLVyYq8/lnRspz2VxNmD9HFuhiKolm6NX2RuXrKAvbkkEPbume1hUF5godR4gPdBkAEH5QM/x2EKJ9UrCCO0WCo1MdwxRlRi7jYgkBi75N5Ik5NWQclEtfxZSvcSMmWAkH29yxq0Iwc3x9bUp8xELKif3w0TtaM7mCHJ/9f17s7RNn8E5zRFPh0c3eeTRmq+M3ySxZiv0AGWi7rTxVxDhiFSBPkZC+1eLB8RfY9JR2Q7RZnRMARO1fe0HC/Y9Rwlecc5AodMZEOO+ey32gkheiwbtV2a07M444WGa08dhcGMuD7fCJ3B3Pz8Ui5De1CVWd0rIqF+sw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(6133799003)(10067099003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VldXdE5BcHEraHcxYWU5OWxDZTJxeC9TWUFsOEI5aFdydjVQQW5XTVRqSEE3?=
 =?utf-8?B?NWxsNE5YUnFqSGh2RTV5NGk2V0Y4dkw5SWpBbW8wRjFsSy9LejVCNkE1aENu?=
 =?utf-8?B?cWNkS2h0ZHA2OFQwR2pBOWc5UER0L0hySUZBOSs3d213U2F6NnMvTUZmNmI3?=
 =?utf-8?B?NzFTSEFQWEdVT0orcVVmTjVkMVBwak1NYzhXMmFDdjdOT2FqWDVKQTZESG0r?=
 =?utf-8?B?TWh1SitQcnk0a0ppNGFlVmxvUzRQNnkrdk1EZGU3Sk9OekxrM1dsR2Q1Y2ND?=
 =?utf-8?B?STlqTE1peXQ2b2lDTW8zakJaUXZ4Y3RCVGpDL1hDU1BlNzR3Z011ZHJrcy96?=
 =?utf-8?B?eVprSVhlSlBUdDFGY1E5WVUwMlRUc1lBN1IvNWo4OERhZDRNZFFmaGl5Z0dZ?=
 =?utf-8?B?R0g0TE5KT24yQ0o5YitBeVk1VXl0VHQxOXFUdCtUbVRsSVhLcVNSeGo5V0Vq?=
 =?utf-8?B?YWtEV0lZanJicGRydU40LzgyeVhRTFU4em91NWpLUEdjOW1WM1hTMy83STNU?=
 =?utf-8?B?K3E5WXFRYW1NVFU4WUFBZXYzTUdmQ011azh3YmVTSlhzcEZ3QjVRWWFwUUJj?=
 =?utf-8?B?ZGJjcG5aaEtNVGlMNDNKRlJ6aUJTOFpBYWJsWGJaMEVXQVNxcjc0cXJVQjZF?=
 =?utf-8?B?a1hodHhYb3B4Qms0RGhCRnV1VWZLNlpsNFpCUFNUSWk4MXRITyt3TWpXZ2lZ?=
 =?utf-8?B?QzU5bWRldTRMUUZldnZpQWpyTzY5L3RwY1pRNXhKU2pOR0R0T2h2ejc1Wi9U?=
 =?utf-8?B?UGNtWGNRcXJmWnhYbWVSTUlWOUVaei84L2s4Z2FqWkVNR0Y4eVhrU0laMnJs?=
 =?utf-8?B?TWpyZkpOM1FTTks0d25Ucm5qemdLWk1pdFQ5UUpJTXhldXNUc21Cc2RoeXla?=
 =?utf-8?B?ZXdISlRwQldvZjVQT0RlWm5TK1A1VUdCWUxtalc2YUZXVkYyZFRmU0huNlZK?=
 =?utf-8?B?TkJvdVhBRlFvdjVLNG5mT0tMMUw0OHJiR1NIQm9LMWU4RmdLZWQrOWEzRElT?=
 =?utf-8?B?anJzeWJhaHpCcDZGUHUzY1lEeklpb2VBNFBhK3hWam45eE5SVmVGOUFSZXZO?=
 =?utf-8?B?OUtkRU0zTWQvTC8zY204VVU1bEJndWlzay9BZTU4MmN4WjJyVWcvaTZJQXVO?=
 =?utf-8?B?NnNLN1ducC9jK2UvRlkxVjloalJIUHZXWDhEcWUyUmpmSElkQ1pGQzJCa1o3?=
 =?utf-8?B?UmsvazRNd3ZJM3hqc2F3c2YwbFJsZkVHRi9iRS90RHpOWFh3cUNNUjF0WW56?=
 =?utf-8?B?L1VGS3RwNmowSy9icW11RlJZaVpBZmczSWRRMmlNeTJucVk1V0RZWm04R2Ji?=
 =?utf-8?B?S1QzNFFaNzhaRDNRUXdSbGgzK0RmaDlzekxXZ3BZMDFFam9vL1l4dHg3akRz?=
 =?utf-8?B?YTZjVmFiZUhtaUhrRXBlUlZqa3RWMGxPQWwwMGk0OU9LdFczdG8zWkJKYXVW?=
 =?utf-8?B?OWx5WlcwZHY0NFI2cnB3NmdKbTNFak5PYkcvZGk1a3lWSlVRcWt2Yi9uanNa?=
 =?utf-8?B?d3I5YVlqTVhEcG5QK2dCTUxVeGh4eXpMRGs3ME1NUk1JM3lJM21ySHQrcDNk?=
 =?utf-8?B?SFRTeUJqV3FybXRtL2VoL2VqOXlJNzBMeDVudlF3eHJsRTNxb3NKNDZjeStw?=
 =?utf-8?B?QU9hMzZDMGdYM3M2Mm9HTWc3cUF5NnJtY2xMQlJsamVTenZ3Tm5nczgveUpj?=
 =?utf-8?B?aFlJNVZFUGxoVVgyUnIwT1NScTdXdU5xZW82OHc4dllLWGJkbXlYRGdLdUlJ?=
 =?utf-8?B?Q3E0YWU5V0NnMjVYMnZxYWt6RldyVEY1STNjTmxNRVdncy9FSE9qZWhZTzlG?=
 =?utf-8?B?amRTci9YZzRkcS8wTzRMM091anZaL3crb3FJYkRjbmpFaHJJbTZLdDFwS3V1?=
 =?utf-8?B?N3BMMWgvT1BuMHFWWjNMNG9IUFZaN0J4UUUycnNwMVJHUVBkdmRrNlkrenNM?=
 =?utf-8?B?aFkrUzRoSnFoQnhJQi84MWZmV3dOUGR1L0FhR25KOVVyVUtxcExZcXhCTkd0?=
 =?utf-8?B?aXByMlYxS2krNkpjQ0lnREZrSkZ5TzV3MkljTURuSXZ6Qk1pU2s1L09ZS2Vs?=
 =?utf-8?B?NlY1Wm9ONFlZK3NZUTgzeExnbzAyN2dWcE1yeGl1TTFPaW80UEREaGs3akdG?=
 =?utf-8?B?b2pwZlJ0QkxGTU9yZ08zV29keU9naVVEa1FwblJwbkZPVlQweW1qSXYremJF?=
 =?utf-8?B?aFZxN3FMVUV6dDRXZ1hkYXpOSUhPOC9mbVR5UWhmREFsQlpJVzZocFJRMXNj?=
 =?utf-8?B?WGE2VTdUSmpaRnh5Q2tzaC9XRkN2QzhCUitEd0lBekdaNjZvY2JWdExPUWN4?=
 =?utf-8?B?ZE0vYjhVRGRrWEN0dkhkVXpDNG1mRGNCK3F2S05pOHJZUU5MMTAyREtZeHox?=
 =?utf-8?Q?qdNnfqMAHo2YHtkg=3D?=
X-Exchange-RoutingPolicyChecked: Wcgt0nIWjIaHT/6NHwB02a8D1tqym8mB5sidsG3vSDDZSlNyGvSwW5nulYeYKVvZJctELyyKmD6pWOrOoJ7BdvVt5pfDMxIs5mY3Vv/lJasiKE8Y0WEy+0ydPF3WB/r+uNOfP/fsOpiRx9Ni1YZ0yG0xqAWYulSEQWh4hrfYSE0ay0a1DzE0JSdDDS+WS4F6EL4ZdnCqloU9dK7Y70T5aQzIIrHjchp/3uflENn4Xlcbs0+wNzf+6Dncw9MWK+kMOeFSpbP8q8KEKzR6b8mTufuFMcsulakb04B3YId7juOB90jKSWvZ7V8YYnOaaDDaDAn4zcP2tlWT4GtQETL94A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ef77a21-f623-4db2-7cdd-08def787554e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 09:02:55.8478 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R5PF/2IfJX9mWAcKNEkbiH66u44sCrPfDtjC5kud/BG7VBU4Y/fiEfeik0J/ArlM26C21O68ZxxjsHtBnldavm2qkd4a5p+BmU4mYUGXxFo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6268
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



On 8/10/2026 12:14 PM, Satyanarayana K V P wrote:
> Refactor vf_get_submission_cfg() into separate vf_get_ctxs_cfg()
> and vf_get_dbs_cfg() functions which allows independent error
> handling and validation for each resource, and improves testability.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

with small nit below

> ---
> V4 -> V5:
> - Allow zero DBs are valid configuration (Michal W).
> 
> V3 -> V4:
> - Removed coverage for more error scenarios. (Michal W).
> - Updated fucntion names. (Michal W)
> - Added error scenarios in new commit.
> - Updated commit message.
> 
> V2 -> V3:
> - Added coverage for more error scenarios.
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 49 +++++++++++++++++++++++------
>  1 file changed, 40 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 37899fcf5b22..339ea0d3344c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -568,11 +568,11 @@ static int vf_get_lmem_info(struct xe_gt *gt)
>  	return size ? 0 : -ENODATA;
>  }
>  
> -static int vf_get_submission_cfg(struct xe_gt *gt)
> +static int vf_get_ctxs_cfg(struct xe_gt *gt)
>  {
>  	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
>  	struct xe_guc *guc = &gt->uc.guc;
> -	u32 num_ctxs, num_dbs;
> +	u32 num_ctxs;
>  	int err;
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> @@ -581,27 +581,58 @@ static int vf_get_submission_cfg(struct xe_gt *gt)
>  	if (unlikely(err))
>  		return err;
>  
> -	err = guc_action_query_single_klv32(guc, GUC_KLV_VF_CFG_NUM_DOORBELLS_KEY, &num_dbs);
> -	if (unlikely(err))
> -		return err;
> -
>  	if (config->num_ctxs && config->num_ctxs != num_ctxs) {
>  		xe_gt_sriov_err(gt, "Unexpected CTXs reassignment: %u != %u\n",
>  				num_ctxs, config->num_ctxs);
>  		return -EREMCHG;
>  	}
> +
> +	xe_gt_sriov_dbg_verbose(gt, "CTXs %u\n", num_ctxs);
> +
> +	config->num_ctxs = num_ctxs;
> +
> +	return config->num_ctxs ? 0 : -ENODATA;

nit: we can now code all this as:

	if (!num_ctxs) {
		xe_gt_sriov_err(gt, "No CTXs assigned!\n");
		return -ENODATA;
	}
	xe_gt_sriov_dbg_verbose(gt, "CTXs %u\n", num_ctxs);
	config->num_ctxs = num_ctxs;
	return 0;

but we can postpone that until we will be forced to switch to SIGID
> +}
> +
> +static int vf_get_dbs_cfg(struct xe_gt *gt)
> +{
> +	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> +	struct xe_guc *guc = &gt->uc.guc;
> +	u32 num_dbs;
> +	int err;
> +
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +
> +	err = guc_action_query_single_klv32(guc, GUC_KLV_VF_CFG_NUM_DOORBELLS_KEY, &num_dbs);
> +	if (unlikely(err))
> +		return err;
> +
>  	if (config->num_dbs && config->num_dbs != num_dbs) {
>  		xe_gt_sriov_err(gt, "Unexpected DBs reassignment: %u != %u\n",
>  				num_dbs, config->num_dbs);
>  		return -EREMCHG;
>  	}
>  
> -	xe_gt_sriov_dbg_verbose(gt, "CTXs %u DBs %u\n", num_ctxs, num_dbs);
> +	xe_gt_sriov_dbg_verbose(gt, "DBs %u\n", num_dbs);
>  
> -	config->num_ctxs = num_ctxs;
>  	config->num_dbs = num_dbs;
>  
> -	return config->num_ctxs ? 0 : -ENODATA;
> +	return 0;
> +}
> +
> +static int vf_get_submission_cfg(struct xe_gt *gt)
> +{
> +	int err;
> +
> +	err = vf_get_ctxs_cfg(gt);
> +	if (unlikely(err))
> +		return err;
> +
> +	err = vf_get_dbs_cfg(gt);
> +	if (unlikely(err))
> +		return err;
> +
> +	return 0;
>  }
>  
>  static void vf_cache_gmdid(struct xe_gt *gt)


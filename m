Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 749A9D64097
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 23:51:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C0CE10E2A5;
	Fri,  8 Nov 2024 23:51:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gyaa3XnH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B426210E027
 for <Intel-Xe@lists.freedesktop.org>; Fri,  8 Nov 2024 23:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731109884; x=1762645884;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qSJgnjd6ufWJof0HW4e5UhXHRMscYkb2hXOPSnmf+jo=;
 b=gyaa3XnHiGPpqu0ZaPHvQYlMh+1G6BLdG1FxV9BQ1m0jlltgg7MCa3gJ
 WW1NtqsezA8mApOILv5xVQQrgt5cu20eEtPFRZTCa9nr7RDQwjuyPky9P
 PNZ6XLwY9eo8dHhzD1IcuvZbervNmxBJuSQXdMgFQn9UjjgOLF51Ce75X
 8KHzx293f8l2hEbkA49Q7tzbItcPwNgQieLwLiv8Mgv06/6ZM2qryCCpz
 OIlEpkQx8ibkgvuKbXLvaPeeWPfUianUTd5JnrXy51F+sR5Ek9qQVRs55
 1IOh7RLdqu8XQWhADtDuHp7tB+sRMIyurRMzM68fwevq/fCKHLycIkk24 Q==;
X-CSE-ConnectionGUID: egzXSH08R/KV6/NM2iSJnA==
X-CSE-MsgGUID: 6xQZRM0gT3avQ2eG5OXwIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="31233890"
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="31233890"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 15:51:23 -0800
X-CSE-ConnectionGUID: BgJ5mL5GR3me/vbg9oSknw==
X-CSE-MsgGUID: qc3iO/lBRYeiOdXkmbRtKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="85787323"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2024 15:51:24 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 8 Nov 2024 15:51:22 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 8 Nov 2024 15:51:22 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 8 Nov 2024 15:51:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AeRABeKdbu/nH+9iFvmuqEMJKocE1jbPIBPTsIxDalYBb+cJfQisV99rB5UjhtyXGPdUdk/pE3KTUIe+FPaytwF8Nt78rOfh4y7MdEikui6m8eolphQUUAAHhEGdOFfhQbBpFtqukr9KD0Esx+ik9F7BSyFtFO0RR3wVShvl0TaQOYqLpba5Q8QeHy83vd5JT9o2MjFSgr31ZXG1K4EWROtiIM553sh/N6q7bF35yMPWsBCpSSlIV8x+ZQeZHnr/Moh1LYQhP8itYUyU6tCSMO96m756PX5efGigEuwJvM+Olt5sXXVjb3hz6lYjDbyMbFWxKhIdr3npQ8g5m6Iyaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HVUCo6/5siAt9S3Wwo5fqYGlLxAD2VroeKL+RBWfiTw=;
 b=mcjZm9T2kMd5cQtlRlm/LfOD029VsUxpw62azcTMatY9VtWvBPbHA1XEoC+xUMwUyuRsnhIjO194OXfErYBzkuvqS8cebf1cGeBLBRr2MOWVqq/o5bNOj0nDmW3JYe3vOAMsdMCdec1tovanQFAE9WoEGaiEloBRu6wIDFSKHYkWE/Zelt98/EjDvrorYer8vUhNoiBtEauQE8cD4f07Wdu/uqIwdx3ItYNwmbzLiXm3Oj8tel/aJ5jxAZ0hmttk1zypdlzjX2xZPsFN1zSRA1EeyZLSYM+GnypKHsoHeUAElHrU3r1geiZ6YJQphM5rsfuE9s1vvZhOQDV70W2/PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by SN7PR11MB6799.namprd11.prod.outlook.com (2603:10b6:806:261::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.21; Fri, 8 Nov
 2024 23:51:15 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%3]) with mapi id 15.20.8137.019; Fri, 8 Nov 2024
 23:51:15 +0000
Message-ID: <22a9423e-53b0-4541-91eb-f743f0cd3de1@intel.com>
Date: Fri, 8 Nov 2024 15:51:12 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/guc: Support crash dump notification from GuC
To: Matthew Brost <matthew.brost@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
References: <20241108212737.2044007-1-John.C.Harrison@Intel.com>
 <20241108212737.2044007-3-John.C.Harrison@Intel.com>
 <Zy6gNqJ4B7urZsj/@lstrano-desk.jf.intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <Zy6gNqJ4B7urZsj/@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0208.namprd04.prod.outlook.com
 (2603:10b6:303:86::33) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|SN7PR11MB6799:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bf7791e-e76b-490e-2d5b-08dd00503b4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UFVjRG9NdXR3ZVd4M3huOW5BT0x0NnRUWVhkWHZSL2t5a2d2TWlxUlhsKzg4?=
 =?utf-8?B?WVpFRFkwbVlsZ2s4UVJtT0MxVnpndCtIbVYra3BqbEhaWXh5L3FLSFJBYits?=
 =?utf-8?B?aUI5bytxdGpYZ3d3aElaYUVjVXNDa3lOQndBVG9MS3NGVVZuWExtS1FDK091?=
 =?utf-8?B?SW1qV1BSOFpQMEZFQ1c0YWR2RkVMcjNWN0plZ0p0WXlpYVBJZVlaZkZPc05S?=
 =?utf-8?B?MkFTR2xQdzd1NjgvQjBML2dpOTRFSlhYZEl1NkNHYjB3ZnJEVVJKVFhwdStI?=
 =?utf-8?B?T05pd2xocno0NkduYVFjeDVURGRqeHRsdGo1M2RDMXczUlJsT0lETVQ2bkxo?=
 =?utf-8?B?TzN1STJ0a3oxTjdSMTUyVTFlajM2Q0NnSW1BQ0pZWVdBK2ZzUXlJN0JEaW4w?=
 =?utf-8?B?aERDQlAveFd1cFYxZFNXeFJwMDdJL2JjRSszYVJCRFNOMDdlUm5iUVZNQ3Ew?=
 =?utf-8?B?bzM0TmtyblJqUDlIbHVtWng4S0xlanh3cEE0cjJodmpZK3ljRzd0SzlzTkRS?=
 =?utf-8?B?d2pyN2xLMDBXbWd1SytWck5TVnVEVkVNWVh4anhrWnJiWTRBVENQYUlwOFdo?=
 =?utf-8?B?TkVzbjRlc0pkZStySTJFTGtid0E4amQzeE1ZSTRMMEdQU2FPNVRHR2xpQUJQ?=
 =?utf-8?B?cmszMk8wV0g1L05UMCtKUVI4eEFwNDEwRitrdEtqTFZEZEpCYTZVQXhkU29z?=
 =?utf-8?B?aWcxUlU5UU52NTFYaFFrTVo0Y3R3T2xiNVIrRHZrZFQwQm11ZGZKODdJTzlQ?=
 =?utf-8?B?UHhWVHFnRGFydEh4WHdJeW5MZ0ZmaU42UGlGU1MwTmhLcGt4Y0hDb3Y3RTFW?=
 =?utf-8?B?d1prclgxb2dVWW1WVmRNeUVkYXR5N0IySGxNWmlqTjFvRDRNWERjMlNMdTlr?=
 =?utf-8?B?alNCZWtjYXhTM0xkSmlzdUtUcmxRWll4YS9GK0VlUmRwWUtKN0lkS3FJZDJ1?=
 =?utf-8?B?RXpOYUJabVFuY2phNjBaYXZDaU00anZ1T2E4VXkyY01oL3ljMWxyazMxUXVW?=
 =?utf-8?B?d0xSM29MdWlwYXA1TUVtMjJEYWNLcXVsdGFTQk9BZmd4dDAyL05RR2VwUmV6?=
 =?utf-8?B?MS9MWEI4NVlNVkVhUlp1MXQ0czI2TDNuQmJuNzZxbjcvSE1RTlB0UW15TTBS?=
 =?utf-8?B?WjY3Z2MwaVJ6Ym1lMjU2ZjBTdFo5R0pTU0RVcXBUNTBZcE1vdXJkYWRza08w?=
 =?utf-8?B?UkZseDF0L1E5MDdkVUtjbzVGMmNnQ20xTkFwZ1JLTFZaVy9LWWduZGlTWkpy?=
 =?utf-8?B?NDRuM2xGMnQ1MVNuRVY3dDNDeDMzMk5UbGpQbEM1UGVDa3V6SG8rM0UyMDdH?=
 =?utf-8?B?NHh6WVVmUXI4OGlyZDhXSk9CeWwyYmRrTlpLMGFHdmxFeStaMjRvQ05Gc3lr?=
 =?utf-8?B?aVFVZitjNWI1LzZaZWNraFFJME9YcnRqdUhrRWRSMEkxNHJuK3lEU0lReTZE?=
 =?utf-8?B?dk1NbnZjaVBJVklSVVhCTGEweU9qYkEzRWRDRjFiNU9mR01EV2RVZ3EvZjRB?=
 =?utf-8?B?Rnp0ZlByUWF5ZDNtWXo2MnN5VTY0OHhuSTVoZFpKUGtMa2JpUTd3czNoZUJj?=
 =?utf-8?B?VkI4eUNsQmVWMlB2ZUdqRTBKRDNQQUROZFZybFQ0UmpLZ2lJMVRQTXdvRTlR?=
 =?utf-8?B?S1ZNRUQxaVhrME9MVG9ObzR2WUY0MUo0cjhkODZ3YjBJU0JNN25FV01LU0sv?=
 =?utf-8?B?SW43UEszNUlkcDdxNmg1VEMxQ2RHM3hyWUFWZkNNYzhpb0d0Y3lhMEp1ampE?=
 =?utf-8?Q?HUFX4W9Xc507p3cbJKBOD3/dVE7BAt6ma1KAtxU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHBoaUpXU29tbmhOUUozai9TUDJzYWdQbkRzTmZEZWVZekUyMjJkeDYzMGZC?=
 =?utf-8?B?OWNuYkZ3bmdoeWZhOVg2T0xpYyttRXRnYno5TTU5UDF4UWpvOHYraHRGOEtN?=
 =?utf-8?B?Qi9OZUh3RnRuaFB6dVVMSm03c2tjMnV5RUp2S3I3bGZQYkdNT1BnbG4rNERB?=
 =?utf-8?B?a0hwdE1IUzg4K0hMUWVmcUxHcitCZjFSemlOeW1iYmdvODVZMHBNaTQrbHlU?=
 =?utf-8?B?NmRhUURON1BKVVByNEtNQTVEN05yMlVtRHZmUEt0ZzltV29VSGN3NXNlaXhr?=
 =?utf-8?B?QUZpUllMbEtWUC9OeVlxK1FJcGFWRS80ZXNCSlI4cE1qemIzWkNkVkltSkMx?=
 =?utf-8?B?Y08vZnE2dENTV2lxaUIrUjhacHZzUlMwNDd1dFJkMVFpU3JWNVk3d1hCSGV0?=
 =?utf-8?B?czRhOWJaUk0xb1VMVCt5NUd0RWdub2l1N3hMOVBxMUk2d2VhZGE1WW02Qm5Q?=
 =?utf-8?B?SGJ4R3ozRTYxRTlyYTBtV3gwTmN4TGE0RkoxUHhlTVFad056VUFPWDR1R1pP?=
 =?utf-8?B?NW9mcU53VVFlTmRDQWFKNmpRR1lFWHpCejJXODg2YXBEZU5JdEpsd2toY2wx?=
 =?utf-8?B?UG1wMnZaL05RZFE1UHphLzB6bW5qUHB1eVNDVnY2Ukl1ZTMyMkVzZWc2bDRW?=
 =?utf-8?B?d010SVZ6bjF6MU1FajRxVlNhdGRkR0pSdFV1M2p6amRkdnhUOGxaZVNjL1l6?=
 =?utf-8?B?TUdCck9sczZqTDNNcUpSOUU5OFlodENKeDNmZTJQcGVyMlA1UDNvdXhKVmdU?=
 =?utf-8?B?Yi9lOVNGTm0xcER1UWtqbW9ZK1dmdmVOZm1lQXhOc1p2bEU5TkxqMllMMEhP?=
 =?utf-8?B?SWxHV2VlcXY3M29wbWExcDZTYzFYazFrczM0YnMvdzhlM2RaK3BvZGY4ajNM?=
 =?utf-8?B?RGk0b3BuVThMdkdDK1MrdEJpTFVCVFNnM2NrWEVZU1pWQ0VjYyt3bi9UcEpt?=
 =?utf-8?B?cDl2Q3FzYW1wYjVCQmFSKzhHWXVkUk9qQnRtSUMzZ3k0N1YzL2tyS2xpZklu?=
 =?utf-8?B?NGE0WFZxQmFpYTZGRkFiVmxyRGlRczFTVEdIOFo3S1ZvcTBPZ0tIakNRa2tE?=
 =?utf-8?B?bFc5ZHJuTkhLaFFueWwxK3lYQlAzUXFTZjJoSnI4bGYwbXBvd2FEMkpXRTRM?=
 =?utf-8?B?dzlPaUtXNExTa1BscVVDMDA5SHBRR1QxT1NvWk5tVFhNQzVZZ3JtRHJhbk44?=
 =?utf-8?B?TFZuZGVsOWtoNmtZZndSTzNtcVB3NHVZRGlFSkZCRnpZZFpscExOME50ME9J?=
 =?utf-8?B?WU1WL0tRQlVYL21nV2JNSkgvRXh2a3czZWtoQk1OSmxoL2ZndDE3ZFh5bnZB?=
 =?utf-8?B?eHdKeGpqNjhxNVduSWxaQjBTMENUblZ6bUVkdkRwVVFxYjgvY20zY2tJQ3NI?=
 =?utf-8?B?ci8rR3dKSG1VTGJVdTdoMTREc1VObHBjZUU1UkxwT1FmcTBoeGFyaEh6N2xl?=
 =?utf-8?B?RjY0WU90c2Myd2pHQmg5U0NjMHZOSUdLbnl2bzd3WURibDdkdVdwMVZVYmti?=
 =?utf-8?B?S3BDNndadUNZbUlqMUMvTy92dDI1bWk0NytHUWFWVWx4VWJRME1jSmJEbTQ5?=
 =?utf-8?B?dkgveTlnQS8zY2VCZ3FtU2tzNWZyQkJZc1h3U2g3dkEzektMZkxTbjRFdDZX?=
 =?utf-8?B?UW9UdFBNdk9UZ2VFa0pPS3J6eFA1MjJBK1V1Nzd0Kzc4RkdrLzhTYWNmaFRY?=
 =?utf-8?B?TG9VOG5lMmhKSjBJZitSMDJsL0dOODNOWExzLzNHQWVlTml4dk5MWUFOS1Fh?=
 =?utf-8?B?LzZWNU5WQ2FIZ2xabm51ZmFCb0hITFVQa2FNclpWdzNwQzB2MmJuVGoxOXVD?=
 =?utf-8?B?MXNGREUyTXNTV0V5L29jMTVpRDVwZHBiaDJZbmVjRlNKYUcycUxjSDQwNi8y?=
 =?utf-8?B?T2RFd2Jmb1RFRG9XdTlQY0Y2N3FhbERvMmxJYnVSOVo3by8zNit3Umt1N0lt?=
 =?utf-8?B?NkNCWEE3VUt1bjBnVzZaa1ljSGZXN1liSy9uYndWWmZGMzR1cmVpWXBXMCs1?=
 =?utf-8?B?cGhMS3FBSDI1MHRuRStwcG5TSTlrNTRpM1Fzc1Jxb2ZhS1F2czBHQi8zdmhZ?=
 =?utf-8?B?ZmJiVkJYL2laZFBWc2dkdkFJdmlUWkhYS09mOVE5ZG8yYWpoL0VaVlF3UCsx?=
 =?utf-8?B?NVdPZ2tJVTFPcGVRM2pjSHNqMzRTVVlvTVB5SUI2QlJ1YXpsRkkrZ0lDMHd1?=
 =?utf-8?B?ekE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bf7791e-e76b-490e-2d5b-08dd00503b4d
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 23:51:15.0307 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1vDurIMnZpzFJIuFFlCD39K3lLjsUv45iHM3U60aOejAzpuL50k3Wvvo8YgpNwkJOuUOcekMkwfNYgeMrkK4t/ApAkRRqXV20kVQ63WNpu8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6799
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

On 11/8/2024 15:35, Matthew Brost wrote:
> On Fri, Nov 08, 2024 at 01:27:37PM -0800, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> Add support for the two crash dump notifications from GuC. Either one
>> means GuC is toast, so just capture state trigger a reset.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_ct.c | 23 +++++++++++++++++++++++
>>   1 file changed, 23 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index 63bd91963eb1..7eb175a0b874 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -54,6 +54,7 @@ enum {
>>   	CT_DEAD_PARSE_G2H_UNKNOWN,		/* 0x1000 */
>>   	CT_DEAD_PARSE_G2H_ORIGIN,		/* 0x2000 */
>>   	CT_DEAD_PARSE_G2H_TYPE,			/* 0x4000 */
>> +	CT_DEAD_CRASH,				/* 0x8000 */
>>   };
>>   
>>   static void ct_dead_worker_func(struct work_struct *w);
>> @@ -1120,6 +1121,24 @@ static int parse_g2h_event(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>   	return 0;
>>   }
>>   
>> +static int guc_crash_process_msg(struct xe_guc_ct *ct, u32 action)
>> +{
>> +	struct xe_gt *gt = ct_to_gt(ct);
>> +
>> +	if (action == XE_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED)
>> +		xe_gt_err(gt, "GuC Crash dump notification\n");
>> +	else if (action == XE_GUC_ACTION_NOTIFY_EXCEPTION)
>> +		xe_gt_err(gt, "GuC Exception notification\n");
>> +	else
>> +		xe_gt_err(gt, "Unknown GuC crash notification: 0x%04X\n", action);
>> +
>> +	CT_DEAD(ct, NULL, CRASH);
>> +
>> +	kick_reset(ct);
> Side note, we may want to wire a devcoredump to a GT reset too.
I have a work-in-progress series to allow creating a devcoredump without 
a scheduler job. I assume that would be a re-requisite to creating one 
from an arbitrary GT reset. Certainly coming in from an async event such 
as this, there is no scheduler job to use. Hoping to post that soon. 
Should be easy enough to connect it to the GT reset then.

John.

>
> Anyways this patch LGTM. With that:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>
>> +
>> +	return 0;
>> +}
>> +
>>   static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>   {
>>   	struct xe_gt *gt =  ct_to_gt(ct);
>> @@ -1294,6 +1313,10 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>   	case GUC_ACTION_GUC2PF_ADVERSE_EVENT:
>>   		ret = xe_gt_sriov_pf_monitor_process_guc2pf(gt, hxg, hxg_len);
>>   		break;
>> +	case XE_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED:
>> +	case XE_GUC_ACTION_NOTIFY_EXCEPTION:
>> +		ret = guc_crash_process_msg(ct, action);
>> +		break;
>>   	default:
>>   		xe_gt_err(gt, "unexpected G2H action 0x%04x\n", action);
>>   	}
>> -- 
>> 2.47.0
>>


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E13CCD5BD2
	for <intel-xe@archiver.kernel.org>; Fri, 29 May 2026 06:19:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5590810F94A;
	Fri, 29 May 2026 06:19:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f6L2Ve1m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 251F510F94A
 for <intel-xe@lists.freedesktop.org>; Fri, 29 May 2026 06:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780035585; x=1811571585;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VGBvBi9BxVH7qJYa67tjZ1veAbob7w8mikcG5IgqSds=;
 b=f6L2Ve1mhCGFKbdXvRn41NaCYF0XGwihXTuDRviHaS2MjTMSezf4TZ4H
 md401F5I4vcHlS0rTd9tQZIvzAlSDdvY6v3l6ygJ/VP1N+jCB6ez0tfOh
 m0XKc1KLr0aMyJqXh2j6HTrowV6/oVOjxlSCtNbDS82JL3Xsj5vCDWvbh
 DK8VXr/8lc2nt0PhsdSHuEVZ+1LK/KPqBAIIFHgpC/Z752h/o4lnuCI0E
 9oQXz7MVZMAafIkAdBTC3w00KTeDBCFHvpxQHqLSEgFaHjkaqBgS3KmUV
 ACO3ucGekpEai332O9VowJ9LHPINS2IcBGT+5+GpnKukMZvDs3eRE2sDB A==;
X-CSE-ConnectionGUID: PLLJ44a/QCS4bymcQho+dA==
X-CSE-MsgGUID: gSetpcw9SRGIVKqrZGFQYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="98300056"
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; d="scan'208";a="98300056"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 23:19:44 -0700
X-CSE-ConnectionGUID: azgqEXphSNuwb8JP4GNXiA==
X-CSE-MsgGUID: 8Y61fvzoT/ywKbqqhL/kiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; d="scan'208";a="241945842"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 23:19:45 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 28 May 2026 23:19:43 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 28 May 2026 23:19:43 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.62) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 28 May 2026 23:19:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y9P/BGSJF9snfjoc0sBTssY3GRN+I/Ebw/e2UvGkf+eg1iIXrW5CbnsB4J1rQPXBOpF8IsEl/dSN7yuK0jevGVoslyUmw+CXXoED6S5OwQUdviYhDyUGvWm9ZI8OTe+G+kOJkA159Nq1KOolZybsuF/jAMtA3Tiwj6sT4EUGPFI9XAx6Iphbl6qdyKlKw2j7NX0n6/OqT+nRkEpp4GTewP8NZr8W3cHAX8LLAkNmXitGTl6jKQSb024IGI/GAciJA2NEHdHrfDJ6oQh2p+lF334gxZ3kLqWMuGkZUSIyZyWAtK3B2sY1nv72zRC1PTP6Zbhmr9vhl4c9Yi/TwtTfrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R1ePjr+SE27zT/5WseZyI/6N5G6OAeHKTWVLQAOhMlE=;
 b=hONHLJJhyoNeHUVpbYok1XE+NhD1QB0MWzyX1RQEMtkG3LZ0laYrYuAH+klUKFzNuTFXgYOje05RU0T2yu1oGb9RJNXxjKCoTESLbJWnznhJfxlOk8O4ipUEenzLAb35T3bVuCbnDsew9JK4ltuUv1+rTEzbmosCgl5fUzmBEMUvtuGvXV0qZLjN0ajZI2BF/3qIjO3N01HBuitFaXYRxvSeId1ocBb7m9TRc3dTPEiyaEngKhGwOdTbU42pEOEyMudISAdsA/C7DU5cLiYiNkKJp2l4p1buvRVbRbW5jBqdsxwJWiHgx2LTn0BuI9EhYwGnNa/rWVPy5xytWP7rCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6209.namprd11.prod.outlook.com (2603:10b6:930:27::16)
 by BL1PR11MB5319.namprd11.prod.outlook.com (2603:10b6:208:31b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 06:19:39 +0000
Received: from CY5PR11MB6209.namprd11.prod.outlook.com
 ([fe80::a805:a5ac:cf5c:8671]) by CY5PR11MB6209.namprd11.prod.outlook.com
 ([fe80::a805:a5ac:cf5c:8671%5]) with mapi id 15.21.0071.011; Fri, 29 May 2026
 06:19:38 +0000
Message-ID: <dcb937ee-41e8-45f1-ae03-d18a750f3190@intel.com>
Date: Fri, 29 May 2026 11:49:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/15] drm/xe/xe_sysctrl: Make sysctrl flood limit
 reusable
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <soham.purkait@intel.com>
References: <20260525100619.3155663-17-riana.tauro@intel.com>
 <20260525100619.3155663-19-riana.tauro@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260525100619.3155663-19-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0205.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b0::14) To CY5PR11MB6209.namprd11.prod.outlook.com
 (2603:10b6:930:27::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6209:EE_|BL1PR11MB5319:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f6d9967-1e75-4cec-26c5-08debd4a4281
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|18002099003|3023799007|4143699003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: is/1kjnPYcCquIuSnE5rN1xoAzbxCyghAr4sjPqYt/7RRyzJ0CgTrvbUdPtqGV26b1NLA5Ol7/l1TwylUWDzLVjqw9BstX7CXsWwuVA2uBBKhAKZwJ+y5MrWq3yCC9BFcHHYuB9Ts8UvKRVrJW8INfCesii9pRz6wB8o53wJwn4yRXN+/qT7zJFdJsmaXM1iRfo5NRFzxayGDE7kkK0rBA0Kx6zaBYv6/K8gXY9TbZXs7Yf3gNXfLaiVVpf3TYBgk02FoKUeBUAdv1sQge09izUuAdxIfQAVag/vtiun7/0VIBGO2yj5S++F0RXj64Mg71ntKdJ7PS35YK8mzXgDIuu8wL/Sk6is3YVQwPprRgVH/sutQC4kib0zMZCAK6gox93AW5IC8qOM8otz85tYu2HRW8JV0dh1L1cvOP2J4tU5MZljO6rvEFz4b6fT/lrE7OX/6Z5OdmBtDqK63gJeJGmTFdo3vbOktbUiFvdco7SVqpUxarJbWZaCbWvsmRDNFXAGp7tloccADxUESvuryWrsSBG0y+6ZzFzIkxec1A3gKlPVj8LQIaBdmR7c0TSqUCxx2UR8zXYVcLJYHPx+3PKrqeGetHnPbyu2vBKNT4VljRYQNGS8c1y8Zsxt9GPzvECAy36X90rm6S6dTqhS6o0ZMuE5fZ1OGw3B01pE5h/0tQ3qmeUrxj1KH5D8qFsvegAwzMLfD6wLVE2qqTlsOQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6209.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(3023799007)(4143699003)(22082099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmhkVHdjSVh3U0d4QmJrYnJjeEpUZDd4WUwxNmNVZTc1b0YwQzdpL2dNTTcz?=
 =?utf-8?B?K3B0T0lSU1UwcW82Yi9KbHplZXFrUlhxbm5MdEdrQlYway9mZmp4MlBoYm5I?=
 =?utf-8?B?YlB2Z3BZb0tRMHhkUGpXSUVxZW9qOHBCdlgrdEJRTHVZVkE5TGRWSnI2eU55?=
 =?utf-8?B?UWFUNFhuZ0dZc1NRdzJsN2YyMUUrS1pnVFQ1Mjd5TlFMdjExN294WEdBMzdt?=
 =?utf-8?B?bUc2Q3JhanUyaVcwWElOWURHZk5PRy93VU90V2k4bWVXS0pWdjNJRlpXYVhp?=
 =?utf-8?B?SUU4U0hxQmJnWTB4azFwZkQ0aGhIekFlY0xvYUFXUXJRYkxCNjhNSXhsVnZJ?=
 =?utf-8?B?ZGtlVTlGU215VEErcFgvUmQrbTFGaSsrQTZrZ05PTXliU3M4eW9RaDlrbzB3?=
 =?utf-8?B?NXVSQmdOY1Juc2kvN0pvTzhoS08yRUdVWVVMRzlzZllpNlhkVFU3OUJyaEZL?=
 =?utf-8?B?bFRFbXlGTnQ5TUhYSFBvNzJXVWtpUFZvc04zOUhRK0RQcWdPYVpVSTRPTDA4?=
 =?utf-8?B?Qm5MTFg1NlJhOUdrM1NXa1docWRqUXhDa05LR0dBaGYwQ2FhL0t2aTJJdlRq?=
 =?utf-8?B?U2FiZXhFTlU0OE1OTDIzRTEycnZkVVhEOVkxUzZpQ3N5dXExcUdPcWRQMzZn?=
 =?utf-8?B?dk9vSXFsMy9iUlMzZjlLWTFJU01wMDEzNS9rMXF3eUY5cTlWRnowOER5SHgx?=
 =?utf-8?B?TVQ3T3l4NmFNWEtUQ0tIZGZxcjBZSTdocFlyZWhXMldnb1JTUGxiTG1IZWRF?=
 =?utf-8?B?WmFKSFhYUitWQi9BWEZ4akRqOG5Fa2IwbEZrRGhyTmdnSWVJbjNVWWt4cEVJ?=
 =?utf-8?B?bXIrdDV3VU5LZFpaV000QzZTRDkyYyswemFiN1I3QTZKdkE1MkY3VXJ6N0w2?=
 =?utf-8?B?YXJwSk82dEZDSVpXSHN4bm53L1hlOStJT2d1VVNUL3llanhHYVJlR1VLVWhS?=
 =?utf-8?B?L29kR01yQ3NSOXJvTURSVVp1NFZPM1dSbzNEVHN1QmdWRnBDYWhOZjkxdm1l?=
 =?utf-8?B?NlVmSFMrRUhVK0JTUElvMHVFMG9KQmdEYUdCSEdjbmJQeVB5Ulc1bWVQSk1r?=
 =?utf-8?B?Wlg3Wi9tSk9oejVRL2VJT3NtYmE2cVNnaGF2SU4xaHVwNzhMNmc2RVBFdUcy?=
 =?utf-8?B?N2lMTFRQdjZxNWNnQTJzRzcwUFhIbUwrdWladjZQVlBqRXBLa09ibnBxRTh2?=
 =?utf-8?B?Sm40M1l3azRvbkdPdDVyOGVydnordC84MVVmWEZUc2krQnhXenJxTEx1VWdp?=
 =?utf-8?B?bUFtcWlCRGhueEE0UFlpb3U1ZWx2amljVlBqenBKRHgrb1l6bnBySkNMdTl1?=
 =?utf-8?B?SWNZMWpXRnk0REU3eCtjNlFXT0x2bUgxQTAzdnVrT1BESmpCcVArcmJvREo2?=
 =?utf-8?B?eC9LNjJLbndXQW1YaEd3M1QwWnMrU3BqZTRVTFpQMlBnK1JwN0xTK3Rlc1BN?=
 =?utf-8?B?U0RYeG5oSXd4T28yTnl5VTQ3RlF3QnJUVitrUE5xVGxDemJUN3F5UVN0WGF0?=
 =?utf-8?B?VzB3SG5yeXZ5WDRxRk5WcTh1Vm4vdkhZS1NaeWg1ZnppRVVwaW5pTXMrbmE4?=
 =?utf-8?B?dVIyZVdZRGNmNERQRTNrV0RUNDR6M2ppWDNuSTVZWEFFZnNZQXM3OXVKVUlr?=
 =?utf-8?B?UDJaZGlmRWhQQUtlbDlFNU5lMHVhODFrdXYwbHp4MjFIakx0VlB5aGRMbmo4?=
 =?utf-8?B?bVpqTlRpQm1Ba3BoejFEZE9NNDh2TjMvUncyOURKQVNhK2NwUWp0SDR1a2NV?=
 =?utf-8?B?RHhmRXpkN0xHd0t0cFFucDdVa0FYMllpN0QzRnhMaGkwQ1NpcjdGT0xEeCs5?=
 =?utf-8?B?ZEFmNWx5bG9NNHA0NFN2SlA0a0swTUE2Y3kyeEsyd0E0V1VHUkE5K2RqK2x3?=
 =?utf-8?B?Nmt1NkhJNzZHL1htNFFvRmMzbXNhTytDektMamgrZCtYNEtLMCt3Z1dZRWdN?=
 =?utf-8?B?OFVRdjA5TTNuM2FLNldWTEZNd1N3THpNakhCTHhnbFV6R2RKa2JOM3ArRit6?=
 =?utf-8?B?ZldFbTREdGwvWko0dUs1RkhhSzBKRU5sekp6R2RGb0o4YVhrb0tZNVNSN2l2?=
 =?utf-8?B?bEk3RkV2MTlkTUQzcHcvaFZDb2FFUDhIUlg2S1I1djlzRThreHBFODVrS0Yr?=
 =?utf-8?B?a3l4MDhEd3UzSkU3ZnlxVzZmRWo1d1hZYndJdUhGTzJ2U1FuOVdrZHVSM05X?=
 =?utf-8?B?OVVoYjVEYmtnSHFXako0eVVrb1pvOWJ0TktBb05nMjlEVnFCMkMydzdQYkFQ?=
 =?utf-8?B?bmlFN1EzMUpqTnZNQXBNV3hTZVMrM3IzSXlRQU03ZC9aUWNCd1BxZGlSSkdu?=
 =?utf-8?B?UVNiUmgvdUVkUXhHU2NLRDZQdUpKaStXZnFMMVhNT3AwV3MwWGtxc0hSYjBi?=
 =?utf-8?Q?UOrfWkYMFn5GUchM=3D?=
X-Exchange-RoutingPolicyChecked: VNPBFrVYZnBX/UXOQFBmxJ00fCBpoOrUg4VrIO04nMKJ/nAQ5qh/O3TLK9tu3kAuQlKHwN7V3FGuvggawaCW/b94oEmqvrqUUIdQHlZVyc3oABl6G+AV0vqBMzAldqgAq8/cweeCXaluO6fCYZ6PHJ9cEiO489+LI4713qcuXY0XkPha9Gmgf2aDfvwFnlbh4r0ts57vuhnKNoLDC8+j69sSatRZn8vJhdR8U6AMzcHD5KHkj7hUJk38rgSs8O77K8z+tKLBiI1fXD3W9G/i5LNOctRXCquT0VSme1/tHS9M8Gqi93VTRtnJJYfevw6rej4ZTg+y73sVzKyZZ4NOhw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f6d9967-1e75-4cec-26c5-08debd4a4281
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6209.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 06:19:38.0261 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gS+qcEq7OLi+Rpw2mjTYpkNgY5W0i+s1pPfHIE2hQ4mluq0Dv27MKAANY6MtOCPj2fksQAfQRR8ncLV7a4UmVOJ0X1Ed7nunB9AIPnn0DMU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5319
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


On 25-05-2026 03:36 pm, Riana Tauro wrote:
> The sysctrl command flood limit was defined in an event specific header,
> restricting its usage to event handling. Move it to the shared header
> with a generic name so it can be re-used across all files
nit: Please wrap it correctly.
> using system controller commands.
>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
> v2: remove duplicate (Raag, Mallesh)
> ---
>   drivers/gpu/drm/xe/xe_sysctrl_event.c         | 2 +-
>   drivers/gpu/drm/xe/xe_sysctrl_event_types.h   | 3 ---
>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h | 3 +++
>   3 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event.c b/drivers/gpu/drm/xe/xe_sysctrl_event.c
> index b4d17329af6c..faf6ba89ce98 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_event.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_event.c
> @@ -16,7 +16,7 @@ static void get_pending_event(struct xe_sysctrl *sc, struct xe_sysctrl_mailbox_c
>   {
>   	struct xe_sysctrl_event_response *response = command->data_out;
>   	struct xe_device *xe = sc_to_xe(sc);
> -	u32 count = XE_SYSCTRL_EVENT_FLOOD;
> +	u32 count = XE_SYSCTRL_FLOOD;
>   	size_t len;
>   	int ret;
>   
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event_types.h b/drivers/gpu/drm/xe/xe_sysctrl_event_types.h
> index c16c66b9fa7f..348768ca454a 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_event_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_event_types.h
> @@ -10,9 +10,6 @@
>   
>   #define XE_SYSCTRL_EVENT_DATA_LEN		59
>   
> -/* Modify as needed */
> -#define XE_SYSCTRL_EVENT_FLOOD			16
> -
>   /**
>    * enum xe_sysctrl_event - Events reported by System Controller
>    *
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> index 84d7c647e743..0fa786a9e8c8 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> @@ -48,6 +48,9 @@ struct xe_sysctrl_mailbox_command {
>   	size_t data_out_len;
>   };
>   
> +/* Modify as needed */
> +#define XE_SYSCTRL_FLOOD			16

nit: Name doesn't convey what is being limited (events, iteration  or 
cmd), so please add the _LIMIT suffix would read more naturally.

with that

Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

> +
>   #define XE_SYSCTRL_MB_FRAME_SIZE	16
>   #define XE_SYSCTRL_MB_MAX_FRAMES	64
>   #define XE_SYSCTRL_MB_MAX_MESSAGE_SIZE	\

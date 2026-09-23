Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2031C982EA
	for <intel-xe@archiver.kernel.org>; Wed, 23 Sep 2026 04:55:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C3EC10E7D7;
	Wed, 23 Sep 2026 04:55:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nqTL1NbT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C00CC10E7D7
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Sep 2026 04:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790139299; x=1821675299;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=j8Q/ExFvTW8mEBXJocna1XiclxNan7ftQoR2CjIC5Hg=;
 b=nqTL1NbTMpTtaXKMOFUsTI/AoJKg4agTqQHZGPRLODIj+lNYFx1vtx2q
 rpTn4l+R72OPcJvdbeyHvhTJln2D0cl27lhKFtd/5odJ+24yhxaS0ZhsB
 f36V66wj3xY7BT3YS6pJ6M8E5cRdywgmoxIo2NK4T8ua+iVSphY1XFnOs
 iMqWZ/IdDJksAWud+Zfxwujglg+lVFfqxNNXGEybZ+u9kYj67k+4D5eAl
 gvsjwejeTLKgI5ntIoa+/bEwpX7MeOvM9VKX7UqPuhmnf+Ca9nhZF0bQl
 5AvjUrvZbKpvCbT6Fcdyth4sODnJDkSCluOLehnrAjcKfUxAH9WwrL5Qu g==;
X-CSE-ConnectionGUID: TEvYjrS1Rk2wGO7evBPtAg==
X-CSE-MsgGUID: a7aIZVSiSWONHK0v/w0Rzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="108296183"
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; d="scan'208";a="108296183"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 21:54:59 -0700
X-CSE-ConnectionGUID: WuJtCzBmRrqgAf0VcBHgBw==
X-CSE-MsgGUID: PBhpxROVQzKuhYhsOvCYEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; d="scan'208";a="273620967"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 21:54:59 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 21:54:59 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 22 Sep 2026 21:54:59 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.63) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 21:54:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QKchhyc0+buJs7pnYUdVgQ7e+edihY4WIjVF4+eeHpqtLosoXEhZOVSFTIrAsq65XPnJMaTmr9tBsG28D0yiMYNfdfTWIpyzvt/eMiVmH5tdqzV1J6M+5uK7Yd5gPMQw4VitcdUMiZ4UAUQma/cJCNVAiDyLU+xdbdo8Lqkd2kTKHLuGtknmaXrSbAZUZGcsJuVTCBdl2RsxiPY4VcQhP1BQskgYINBKiWtcR5/gqpFT/QdQvr4xKcHULroy9vzmrLnKjP7p5DsgI+x3JgfWdTPZupOK6EYuXMw0BEBr9mE5uDhgx5+RPytJq7Yr+zaXISWL2UTiniZSkIh0yEILTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D5cD3jmrLr4v6Zl1JItBhcJ7UPL4LIc1suRRiivZMrY=;
 b=ctkEEiYdqc+qKT4E9G9enU4AJmH6MCL27JYmm3bGhOzcj389ceo8t40zPIIQ7/ku5ECVDOFzQFowh2/eMtmgoFZleZ2/GJ3pGExfM1JDuERjo3O618BhDAywWYNAVsDqFNBco+ewz1VI6CT1J/viOLro0lgwUun3KqvFV6K2XMf2/asJWn0Dlsbv0SF4rgKMFz0gNyAqvpJdn7/eBQk6Zp83iMuH7QWZH9OjJu7f2lzGIOj8qPWiOIyac+e+2aifyqJ450LtONi31WG+1w2QO4RofuOJjtGs6nRfsYbTScXiFDwJnhoSEMu9uzmXIswok3rbujFo8rhAthOwKuH+lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by DS6PR11MB952534.namprd11.prod.outlook.com (2603:10b6:8:528::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 04:54:50 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%4]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 04:54:49 +0000
Message-ID: <3f51f83e-95ac-455a-80b7-b0ab6cd437a3@intel.com>
Date: Wed, 23 Sep 2026 10:24:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/13] drm/xe/pat: Report missing PAT table using
 structured xe_log API
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260908104550.1283933-1-dnyaneshwar.bhadane@intel.com>
 <20260908104550.1283933-10-dnyaneshwar.bhadane@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260908104550.1283933-10-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0179.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::22) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|DS6PR11MB952534:EE_
X-MS-Office365-Filtering-Correlation-Id: c00500e3-f945-4f9b-a24a-08df192ecc69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|4143699003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: szANCjEwirqGGWT/pPuZsaYJKK0IvgmbiA7aT2aY5kEjVQ87rwAVVkuy1CFhiRxaGocxU61sT07OArDQM3HTztvztPe0MLKgAP7O+tTX8zXV8lLJ5V/hEH/FREIAunQTol9eUZSvi+jXr8zpLFNQouA35MudxovwTNhZzL2vu3yWlXBP4FC+2ho7+Yq7g9sS83f4zP98J03WZfli7hVU2kjBRKDY6o0ss5i+ZKjWRSxO01DnFhdpxH7rKy1Dzj0ApD2mjht2Kxfpu4mCuMS7yzU6uEzsdBYp+hAngGXmkMPiXNuSylNytfl0dH3TbDUXDbvRMRKh/J+ISFCE0v0pRRBzY+dNZ4+x0depg+filga6rUw4iQi7Z0K3MxCkfrcQcXnv+X3JQhWyV44t5sTTl7NmRxIsLO9NKTK4cYvVIh5249Wsk0JD33XIbzVsLGTvjQ5gdnhXdRaF4/tv2Rrs9mPPMyfE3Y0JzCXKwutpGq+KtFv8RWDwRPvNIR+hkTtfijq0pztyg5Y0wPRNVDfqS5TBNqrVX2flxetKg6qNTbPcDw1kU6faM7qDhBzKhMPgsSKmJ7f2URfum1jeh5o/Lg4TsGAbPgkltZ3DRphzuZ8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(4143699003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXpYb3VZdXdZbWZ4OHl4S1RkMkxlYm1jY0pzbzZHN3BXdkNmbGhjbVJTVlZv?=
 =?utf-8?B?V25iR0s0S3VON1hmemRyV3FHSHNqa2twazIwZlZDTkJ5U09NZUFXYlR5a3ZP?=
 =?utf-8?B?OGk0RkVQakR6bVBCRjZzeFlKeXNjVnlSV0FUWDF5c1Z5aVF5aGhYZC83REI1?=
 =?utf-8?B?c1Fwd0RmSFFkc1dWRVM2dmd3UVpqRVNrVGt0c0ZCcGRxOXhwWTJyUWVtOGJw?=
 =?utf-8?B?cjVyV21UMUpaS0FOcnV0OEx4NGNJZGowQlNONnJrSzgvNGJzdlhncmlDdFR6?=
 =?utf-8?B?Vzl2VDVram5rNG1iOXNBbTRKRzdrM01uKytSeHJCRU1QY2hjMittR0w1N0t3?=
 =?utf-8?B?bFNDWDlKNmExNTZVMFR1MUVFQ0czeWRISURqbDNKbTd3MWM2eEtocCtWM1Qx?=
 =?utf-8?B?bFVrdXgwcUg2dk92R1paWlg0OU9xR3c0VjZCZmRoZ3JjZkRPMmtRem9SSzJy?=
 =?utf-8?B?cVBUdGEzd2hSMkJiRFNlL1E3cGJ4ejFZZUhNMUc4dEVWZW5WMnpxc3Y5QmE5?=
 =?utf-8?B?SEpUbE1EUTBJdFBPZ3huNDJoUmJ3aDF0a3YxRjkyV3BqNUM2bkRnQmdHTlhm?=
 =?utf-8?B?a1VMZVNVbEY0RjRueUR5YjJCcm40ODRvdHh2R3VGR2VxbXg1Z3RDeGZPTFNr?=
 =?utf-8?B?eFdpWEJJT1ZnUHNwN0dLTkN1QmFhbDdvRVRwQmR6Ulp6UFdtRUw0eDNRZEg4?=
 =?utf-8?B?R3lSeEhvdzVDeWNTS0s2UU5ZME81QVROamxCOVRHVG51VVdPYTMzbnhRVjZm?=
 =?utf-8?B?cU04WnNkbGoyN2Znck1UL21CMTNjQ29UeDNFZTJPTXozRm54WkxTTjJ0ckJY?=
 =?utf-8?B?WkdMcFZ0UmhTdDJCT2k4UDVRNytTVmwzTzJFRk1aNmhVc0NzZXBDczQwa3Yw?=
 =?utf-8?B?Q0E1QzhyZUh0VUpXTE85VTIrcjllbGpQZUU2ZHpDaEk2ODdXOUcrRDFPY2hU?=
 =?utf-8?B?eEFiNWhseDhpbHZLRndueTdkZVdkOFZHTkhvenBGQlJwY09iQVIyY2NTeVlO?=
 =?utf-8?B?SGFEdzVnZVVWSG1XU3ZwT1R4Q2grS09qbUhtS2VzTHAwMHR3Q2tDY05pdlkw?=
 =?utf-8?B?TlRHVnNxMFNmSXFGT0ROZ2p0U09DdlYrVnBZeDhJa3R5aTM1REt3T0tmUGVa?=
 =?utf-8?B?TDdsTU1ybVJsVXIvZEIzaUloQkZyNWtSNEJGU0x3NE85dVpILzlBU0EvQldk?=
 =?utf-8?B?RlhwdEV5SUIrUDlESkFpMTVyVUpqaHc0cXpsamIrL21hUm5yN2NSd0l0bUFh?=
 =?utf-8?B?Nm1pdTBIejdkRjVaVUdFMFJaY0tNNkdubUg3TVZsV3U4KzBhNkJoNDR3eHZL?=
 =?utf-8?B?OXBlcHk5Uk42MXVnTm5UUXNYTUdRaE9yL0FhYUJQZG5OVUN2M1gvTlU3bjl1?=
 =?utf-8?B?RmozN2s0QUE3OGRtM2pzUVF3cjgzc1g5cm9zcGNCbnJyL045a3dHejdVZkN0?=
 =?utf-8?B?Q1hxa2o4YTVQMEFYSjg2cHRGNExJSHVMRUU3TnNRYmVySk12cTRUYjNBbzlU?=
 =?utf-8?B?KzBWLzZ2U1NLOHNDZkhUL0VPem5ycGdLOXgwK1FVL2hNNjQzQnozdVd0a2hk?=
 =?utf-8?B?NW9XaExobXZDUlJEZEI3R0FEVjVQUFdocGpGR0JmVnB3Y3JteVZwU3kwektV?=
 =?utf-8?B?M2VabTAyK2k4dGJGZDRZME9aek9uQUE2MHk3amdqUnpPVVhGaHZnZkpyVVZo?=
 =?utf-8?B?bkJKbCs3YzVPMUtGOFQ0YnhHQW9RUDNlNERQUHIrWlI1alJpQ3ZvRmhacVdP?=
 =?utf-8?B?ZkJWSnM1RU9OVStBdVIxOG5POGk4M2hES0FEYlBxREluY3RNZDNCd05HWFBT?=
 =?utf-8?B?RWxPUVJ0akVYSnZmWDF6SXI1cmZHKzIrYjF1Q012NktPdEdNckx3UjFISEJT?=
 =?utf-8?B?MWdVZWtwekxmNHJUNHBtTmpEamdGZzBJdEYwY1o1ZVU1NkFNY0lVcm90UXZp?=
 =?utf-8?B?Mk50YStmL2o5T3VjSnpUUzZJTGgwalNHSWlTMkNycHdISjdwZmdnbW9QK0Zy?=
 =?utf-8?B?SnFmYUdaVHZVTVpsQlQ0ekpSN0hxcWRNajMvRG51S2l5SStEZ1ZaWnZBb2th?=
 =?utf-8?B?N2FoanViYXpEcnBnZkhjeWU0Y2F6OWNjbUwzaXBGTGw4ZUNRZnFReGR6K1I3?=
 =?utf-8?B?bTdHeXVaWjhQYVRyb1huZzRqTHdITGlPZzFiODNHaHIvRjB3ekd1SGJ5MWNm?=
 =?utf-8?B?aUJ1R2pFYVk2cnlPT2VjYm8xanBJcUxTdDZzZC9jSy9HUU4wWm4xeFN4cS9N?=
 =?utf-8?B?MGZ3cTJ3YjlVTFlKR081TFNQc3pVb21IOVJWbzlveDhpa1ByVVg4L2tSVTIw?=
 =?utf-8?B?aFUrS3h6OWJKQjBxa1ZBYUdweEhoamtoS0M4WndFSGFSVnN5a2VPYVBQR0dk?=
 =?utf-8?Q?wagFAXRHBmIYbfqA=3D?=
X-Exchange-RoutingPolicyChecked: n4vfTNlHtiNOrnAaaau/WeKb9favHTicvJ0/vjKGgiDEwG9dYn6Zno0o03YJgq2PH+xnxE/mCt3t+TjVpOZIQJsWMuuLctHfnY8/FqQY+9113UpiGA29lNkpFFPoasXJ7Q4ZTU4z3Wzc0ecZDOKQjvjDSpwtOPcGpCD9ZqMbOJgyKhIaxN9s/dc1NZ2dCMv8Jv9YUxVexQofuVYNbFo0O26RxZj7zAmpql7GPpLr4Nb9SLNtGETGHqI0Bdg8RxzsmFbXn3me8CJvkU+iIwKv+yNTs1iBZ7UXnM7JCNsK22Wq1nWxCzS9sQZ70HFDpCoDcQSteix+6uON9ORxxkRiwQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: c00500e3-f945-4f9b-a24a-08df192ecc69
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 04:54:49.9711 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vVPKWJyjCD+pmIoPPokLteeWdn7/qi78EBxKf4AJn4C3hBbHLjY4NQbR/l0a5KPLfncah6OhRPNIKHILCZRSl6JKBoxv1DEU3A57WKtp1I4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB952534
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


On 08-09-2026 04:15 pm, Dnyaneshwar Bhadane wrote:
> Replace drm_err() with xe_log_err() using the PAT component tag
> when a platform has no matching PAT table entry.
>
> v2:
> - correction in the error code.(shashiko)

Move to v2: portion under --- like patch:

https://patchwork.freedesktop.org/patch/746476/?series=171022&rev=5

> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
With that
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pat.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index 8af92e3c4c17..1deecfd80f30 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -16,6 +16,7 @@
>   #include "xe_force_wake.h"
>   #include "xe_gt.h"
>   #include "xe_gt_mcr.h"
> +#include "xe_log.h"
>   #include "xe_mmio.h"
>   #include "xe_sriov.h"
>   #include "xe_wa.h"
> @@ -678,8 +679,9 @@ int xe_pat_init_early(struct xe_device *xe)
>   		xe->pat.idx[XE_CACHE_WT] = 2;
>   		xe->pat.idx[XE_CACHE_WB] = 0;
>   	} else {
> -		drm_err(&xe->drm, "Missing PAT table for platform with graphics version %d.%02d!\n",
> -			GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
> +		xe_log_err(xe, PAT, -ENODATA,
> +			   "Missing PAT table for platform with graphics version %d.%02d!\n",
> +			   GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
>   		return -ENODATA;
>   
>   	}

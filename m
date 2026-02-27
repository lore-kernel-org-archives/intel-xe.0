Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD95FEFB78
	for <intel-xe@archiver.kernel.org>; Fri, 27 Feb 2026 18:37:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD4B310E126;
	Fri, 27 Feb 2026 18:37:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f+vBR6r8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D77210E126
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Feb 2026 18:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772217477; x=1803753477;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=1yYGpqei4bHyVA/lofUbdsAbCi0fVlNCA04VlEXMtRw=;
 b=f+vBR6r8BUOTiId4P2zWToPh9ctexChDqH+oVGzs/8UpVb0c6nrrmoh8
 OIvV8aXVHvwC3fVY9LiwWydCnDECTuOdX3Xa0ywFOLMy1JFduR1FcRk1q
 cXmCJbRHn0wCif2crijHfvpRye90ulFhvIxAdsm0rBUTIWlnGMGF3f9fG
 hms39LrG1+MujYiT5Xj1IQEaZpEI2uGDEBe+a1sJnDXJNfZC9Pkx6vIVp
 HihgqNyhzYmDt7qm/2DyGDCKoV+QaLUIb7QJBjjTdVReBibqlrf6+5hsB
 qS5t6TqN/LCIsrQyFeeYCRJl/3ugXn0iSSAqRHYj3eGZnmwFXBoehtgts A==;
X-CSE-ConnectionGUID: oKhcMIxARFWJnfbXLXfm7Q==
X-CSE-MsgGUID: anZ7UZ9NRB27lFLcEujdyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="98775283"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="98775283"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 10:37:57 -0800
X-CSE-ConnectionGUID: FgDOekL4RUmgj35JiQWw4w==
X-CSE-MsgGUID: RtA1XUmzRIOYQpir0sdtHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="217003413"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 10:37:56 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 10:37:56 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Feb 2026 10:37:56 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.4) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 10:37:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qnOz/vcmdAXBsMK9WFjxrzUp/i0jLro1ARKRdfhD55gC4kOgIUgTHL84OIMvRPmCW3stErjrchHXmfs+D+rqQIOcGWgtUOOTCni0CMhIXt5gyoQiFCe6FLIi4XGczxfFabLngmM9JVtzJXdfrL49vS2UoT/2wt/3E+OhFa7swfsoZsiQm6jjZcB1Cx8LcHie9U/twjQ6TlEdE6OXvxaEow86yNMe2HH+Axo5P2zsHWbZSfwV2TrcZt21dLK3ELjViFkJWQUE0Q0AA7ET9nUVATJmqf7XGczkgjMtamglpE2bRSgqd9cpUUn9RzWTvxGA0imniX9HvzcPpfXtBelr4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5y+0nf+6jl6nUAmFcyqprcUE1PiFFO0WJ49DzV7xt84=;
 b=JP6ql3bbLNj/Uzj4trXjs0+xS9gmBfqNX19akgZG6yfaVqUBGY6VzdDkfJZsjb3miieJ4GOfdLNdEbOLdCag3bKYcJH2JFGgY8iH/DKXCPYo45F2O8mVTXgk4aq/lv0s+6Ia96ob/Rkacu7FEsxBdhdrhYAdENcjySSnlARpTLbFeEQisoFKHjy0QZcLcAOxX1ECWMnzZsdNH3XvbdEBodkoog676CwvblgO8/ymhLHvkpximM2eQzrXZrKOrFl8OHpEFXMIX0x7Qi5kGgQWVY/FH73ZKSJo5UvKh3Fsap8vRA3g7TBRXIliFRxzvtAMiE3H40gyqcOdJb1L0/qKwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DM4PR11MB6117.namprd11.prod.outlook.com (2603:10b6:8:b3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Fri, 27 Feb
 2026 18:37:54 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::efd5:501b:c890:26b0]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::efd5:501b:c890:26b0%6]) with mapi id 15.20.9654.015; Fri, 27 Feb 2026
 18:37:53 +0000
Date: Fri, 27 Feb 2026 19:37:51 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] drm/xe/tests: Change TEST_VRAM to work with 32-bit
 resource_size_t
Message-ID: <20260227183751.4hlng27qiyok4ng5@intel.com>
References: <20260227160010.12425-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260227160010.12425-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: DUZPR01CA0048.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::17) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DM4PR11MB6117:EE_
X-MS-Office365-Filtering-Correlation-Id: c5e42b01-7397-4471-8459-08de762f51a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: tk5eUKHjn5TmA9d3F4VhT5ljY9ZKgZ54Hlz9EPdM7ijn7HmGe+dmo3ZDNvv2eWtkFN2w3S9K3DEyjf4BEtVzsCYj1YapVzwfK6XYpcg56dndofrpAzg6RYxGGeSQ0a+z5QQWfy9GcaZX0uwkTpFUsYovxjPwY8zxJdeL2dM9iiRqLEyfGVzQ444JsmCcFGnxufRCM1Ty0Rlb90YxEy9Tjeq1zlakJ1EzLIK5FU/yLBV+EQEVe12rCkbe/71RGkCUtG6reXmvH6ARx0hCgtrGnRBukSX8DEOpRn5Mvkq3VoOwyOec5nfNFVU+W3nNywWhezNj3uRAc51Gne6P0oPCyvbBvbDvFPHhzILTZtq3tfBQBfOi+QDraPGuF87tT2LhPq78oLC2aXEpk3MAakcvf0EXqeND663ckyY2s4gnwcPKsC5EuA5vBVh127mGtscrZwTwjaHVH0SoHsEb2hUzaTX2bEc9WCmgF4PUEqrorJpBUJKfwFevSSJa74WQImGzkCFtZntkGfNQfFEjZTJCuj805HdgYT7EMORrB1RO2tUDXe8rstae0wPwsZssEmEObISh+icRIOLpxmpqjRekUO7i80wdYxdkisH390yBYqI9H4nWUCOxIhp4SaYEnXKm9MLuzWBaVwAcqYpfEP3NijJ8uHlKuPpv80+LRVVQeR4NHqlICijBTkoZc8OhJUuh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTF5bFlQMUpHbFg2alAzUmJyNUhTRHJzaTVmZjFMUXkxUEx1UG0vcUZhK28w?=
 =?utf-8?B?MzhwYm0vSzhaRjhBMzFvLzFaT2J4WVdZM3BDaXJTSzZ3RE5salVqRllCZEVU?=
 =?utf-8?B?UGo5M1ZCaTBXMGVVbkZlTHlyaUE0VUsrSlRzUnNvZmV1TEpSQUFkdXJ0UGNG?=
 =?utf-8?B?WEpPTW5NUmxQS09JMks5bERFckhUVGFBdVI1bEVMOUpqY3lTN1EyekNJWUgv?=
 =?utf-8?B?d2pXcGZGK0RYMjhiYjJSTG9uWEMvd094VWs2eHQrbytRaGFFR0tLUVc3dlhK?=
 =?utf-8?B?WEp1TkV0NjRJQk15TkltcG4zWjBTdnJwek8xMUlOeXlLWGx4SFBZMHo4MHl4?=
 =?utf-8?B?eEZFY1I1Mnc3S2tjbitNNGVVQmd2YXBCdkQ4MmRXNkVRbEFOQWR1N3h5TUt4?=
 =?utf-8?B?WTVEOG1kblBYWVBPdm1lODdpRm1oWnRHdFZVbERXSlRzRHl6WkZzTTdKQUZw?=
 =?utf-8?B?Z3l4bmN3U2lXczVTS3c0QmdPY2xwblQvZFZ4a3VscUxMd3R4Tlp4Y0NzeFJh?=
 =?utf-8?B?Z2RTUjBRbUJYZ1grOGdHQ3hnczVEcThXeVdDakZxSTNDVlB6WUZpSWczWjVS?=
 =?utf-8?B?N0J0U0ZWRUwzM1E3UC9nSjd1OXBJeGk0VGtYcEFlSTNWK0YxS1dsNkF2RjVy?=
 =?utf-8?B?c1FHajBuRmJHdmdnQS90RnZhcEhycjUrSjJSSWtlVXgwSTJKQWo0cWZjSVZL?=
 =?utf-8?B?VWJVK09zYzBPcktqcTVPcGl1aFZxczRuNy9uNVhRU3pZUlRkQ25mSkJwVWpk?=
 =?utf-8?B?NFFaWUszV081UlZnUk8vWFVFU2dRQkZ1TS93N01GWmtuQU93Vy81bjFrenJW?=
 =?utf-8?B?R25FMWY5M3VPZENXcVR6aVdVYk81WiszVUVCUHROUm9vZTBXSkNpWmIvQlpZ?=
 =?utf-8?B?UnN3ZWRvcysyckNPY09aNTZiZHZJbUgrRnIvQURwS1J3a1dadGZ0cmZxdFFq?=
 =?utf-8?B?Mktnb0dteHhXRXZDNk9lbnVtY2hJTmRlZ1lHNFlneDdBekp6Kysrd2crUTRn?=
 =?utf-8?B?V2JhSzlpUi9jTEJJWnRWR05TSHNqU2JXb0liOVo3UlZQQUtaVUFHMEdnaGRW?=
 =?utf-8?B?aXhseERlbmJjNDEwcXE0cUc2VG11aE1HeU1INm0vRncxMlNCc1ljRElHakZa?=
 =?utf-8?B?eHFEd0cvdFFCQUEwRlkwQ1J0RkFMUWdlSmhlc1VsMnNhNkVNWkNwTmtLcHN2?=
 =?utf-8?B?bGErQUJCNTYwUU1HTFpmSmo3RnZyNGovWWY5dUZleXFwZE9uWXNFWFN2UW95?=
 =?utf-8?B?MEhyQXR3Wk4zM0VHd0IzRFJ2R0RUdThHSVdRSGpvWUpmcnM1cllhWk1hZTA0?=
 =?utf-8?B?TzdldmowUEdlRXFCRGxrUDY3MGk2VDdaaU94YXZuSmJ3ekx2bFU4L3p2K2dq?=
 =?utf-8?B?U09lbXczU0NLblNIVlJySGVDSU9id2R6OVRHYTNzc2lVa1A3eWx2dC9vM1ht?=
 =?utf-8?B?VDAwUkg1TFhiZnkvYkdpVkR6Tm1SeitGZEpDcHprSm9zdnlaVzBKUENFeHpG?=
 =?utf-8?B?czI0bElTY2JCT2VmN0R6bk5CYUZDdWNNREd0b25mVmoxTWhmZXQ5cDNVQ292?=
 =?utf-8?B?dzFKeGRQY1hwUFp2dE1kMEhkM1dJa1FyQlFLSUk3VlVoOW5Ea3h2SFo5NHlP?=
 =?utf-8?B?bUpLZ0dHTXlSbDdZZE1yWDB0RzVDRVhvNmwybkowT1FDUW1DbkZTWS8wekIz?=
 =?utf-8?B?QVhDVGdBUmtVbFZFRFM2clFPa1NsZnlGemVJRGRheVlQM2Fja3Y1R2lXSVF4?=
 =?utf-8?B?OURuK1R2b1dqUEFWc3orVllmSmlDbGMrU0VVRCs1OTZ5SEphTlZBRFNzd1Nh?=
 =?utf-8?B?emYwQWFSbU0vbmgvZmJqWG1aMyt5UmtKSklUcHBRZDJuWU42Q2U4VXExaXR1?=
 =?utf-8?B?OWFxWlVSR0lIRFArY29tSWtVT21pbFl4eENDWHBwM2hmUHE0T0o0c0N1dC9N?=
 =?utf-8?B?bnBWVHhOSCtIaXdMY1NFQlc2dFp4bS8vaWxXWlh2TkMrbE9xVXVqWnNrc0Ex?=
 =?utf-8?B?NVFicHlrSlh6bHZ5RU1uUVE0dXJlOWxiTzI4L0ZjUVl4Yk1FK3NhSTVRU3lT?=
 =?utf-8?B?eEd0dm8zQWlrNlRKSjd1QzlSMGg1eUFTZFZ1K1lpeElxb0I0aitRTjcxSzlF?=
 =?utf-8?B?ZVMyTjU5dXhZV2h6ZGQ5b3AraGFmaXlPSng4djNEenJ0azlodmtvYmdxUSt2?=
 =?utf-8?B?a0FDV2s0RFFZcWkyKytzUjQzZzRQWHAxNDZQTjhDMTQrS0oxVGMxQ1Ztc2Vt?=
 =?utf-8?B?R3RjVythc04wMkpIOEk5aS83bDQ0ZjZXRnJqYWIraXlNYTVaNGlQVjJNZXdk?=
 =?utf-8?B?cWxUbDk0NkxaN1VXZVNFMjNtVWZwRW1FVmdtcjhsTnlPTnV6bjFsb1o5TDdo?=
 =?utf-8?Q?yAlUtcYRMnaFJc7o=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c5e42b01-7397-4471-8459-08de762f51a1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 18:37:53.9235 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F2Byxmwjj5Z5dlMgdhT+wXBtGv5NXBsFkNNLsmEXRxzsVRUxXLVsK4a2sYcLALhbLhooWdxbvOk7CnYQJIiLLBRvAco7aq1G/i7IkASbWfI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6117
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pią [2026-lut-27 17:00:10 +0100]:
> We've picked the value of TEST_VRAM to match real VRAM size as found
> on the machines used by the CI, but that didn't work well on kernels
> that have 32-bit resource_size_t. Use smaller value instead.
> 
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Closes: https://lore.kernel.org/intel-xe/20260227011639.GA1683727@ax162/
> Fixes: cbe29da6f7c0 ("drm/xe/tests: Add KUnit tests for new VRAM fair provisioning")
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
> index 305dbd4e5d1a..efa8963ec248 100644
> --- a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
> +++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
> @@ -11,7 +11,7 @@
>  #include "xe_pci_test.h"
>  
>  #define TEST_MAX_VFS	63
> -#define TEST_VRAM	0x37a800000ull
> +#define TEST_VRAM	0x7a800000ull	/* random size that works on 32-bit */
>  
>  static void pf_set_admin_mode(struct xe_device *xe, bool enable)
LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

>  {
> -- 
> 2.47.1
> 

-- 

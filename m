Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 459DFCD4F54
	for <intel-xe@archiver.kernel.org>; Fri, 29 May 2026 18:33:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F34151123BF;
	Fri, 29 May 2026 18:33:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nfwufAPP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DDBE1123BF
 for <intel-xe@lists.freedesktop.org>; Fri, 29 May 2026 18:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780079637; x=1811615637;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sqW9ovishC5kCXj8uAyAg5d+3siY0BWQtFflg40MOsY=;
 b=nfwufAPPF6ILsPBjXg+27SkurRInmv8MNlC9oxIPzoHvzMr+4eWFdzoR
 O/+4/3wCMYXYmPjXBUV266Hq8QK7UOEGL/AC3ttZY3BaSKZhk5seTEbym
 cGLM/Bl+qacWkN+iZnU9q67P2l/gba/dCE4PNF/Oor7A8MfHawYlsA9QG
 1haYshcjyfeY/RBH+ezIDYGu/RRpDHriQ1HkK2DiB0p7Cjcscp25aQYQp
 n0uKPnhkFAXiYJfSTxjN0waJeHD5cZriYUBGjyJqF5CKyz6qVaIAZS0v0
 WuBVU9Qd4cFTdhC496BkGC7qoVTEeV0bbFn9GkjDyjru15cX28u9IA3R7 w==;
X-CSE-ConnectionGUID: 5SUUi9zJQIiw+aWXL2+lTQ==
X-CSE-MsgGUID: aa8LyAnbQwe3eTbL4CqBFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="98512464"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="98512464"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 11:33:56 -0700
X-CSE-ConnectionGUID: OwzA2LFbTFSoqYUK1ATd6Q==
X-CSE-MsgGUID: lUPclJTaSIC2Xi2EVQI5VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="243014579"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 11:33:56 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 29 May 2026 11:33:54 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 29 May 2026 11:33:54 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.70) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 29 May 2026 11:33:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GO9UlM1k69a5YRmE6MvZaELp9j6pr+Zm/fA60efutKcHXqOceiNjHYeVeEELN7UfW0j960tO8fPYkrkOPbF/7knLmuV84JRIFQQUiE/tDrJSaxwH15NKqXke1Lv+L6m+Tqxy1LTTTWN0UYgr1GyJ7jeX5ShLqHDwJCs+qhnZj894BOzk9n/OHWDgkgwKFanjJ1WD4D+EfnrlhhT2Itc29WwZ6aTu6wEP3AV0L11ru/NlAKAVFcw/B216RNlXYlTh8+3npVk2ojv8USKO4+DkmRxzIrXNV+pL3k5NYVTd95AhTa8iCvkeu5cPU1cFVo4fLL54Qule+0//0+sMRoYOGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tTmVAHh8I7B5mQ/4wVNbo3dOG4kHZeQVz50aa+UYjd8=;
 b=Nck9ziBv4oey1EtexU5emfeknvzo6j5FHzfguASTFDmlipM0zEk3XkMaXwRsezNwceDRfv3ZhUnLTXxc3fLJmlpmRrGr3D5Vr0sCpoqJHWnnkIfJCBXwz7kyaGu0pH4EufUHzGpcvpN/L9ZqABl+mjMTwh2BrVZqoWM6s2GfKbKhXTX2VcNLf/+9WP+gg1gmW9dXy9Ghp/0Hqrc+RiXk19wwXeo8bze8ZcsqkVLFpbFhORIi2kXTfV35QsP9wOxSUHuGV03axm1LqyKCsiD3NdP1Qu1w+XRnuXosnzbChtxm+dDRT217BsbHvy8H8pwmLVS7JIw6MnDWtQ9eNeXizw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CH3PR11MB7273.namprd11.prod.outlook.com (2603:10b6:610:141::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 18:33:47 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0071.011; Fri, 29 May 2026
 18:33:47 +0000
Date: Fri, 29 May 2026 11:33:44 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 6/9] drm/xe/rtp: Toggle 'deny' bit to (de-)whitelist OA
 regs
Message-ID: <ahncCCoLPIclMR0P@soc-5CG1426VCC.clients.intel.com>
References: <20260518234716.1540123-1-ashutosh.dixit@intel.com>
 <20260518234716.1540123-7-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260518234716.1540123-7-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0251.namprd03.prod.outlook.com
 (2603:10b6:303:b4::16) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CH3PR11MB7273:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c6c7779-3c3c-42fe-3994-08debdb0d21f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: H2qcBcGld+Su7YCZzRRx+UuiWXR+ymWOGfiZ81gcyTMz153bG16O6Me9/hcTvaP1eRkPRiVZMtkut5z8zAbWHfrb/SsRTdWLpVv/vWu4/Qo73KYtosiLwM7Hy0D/PvQAW2/v1Sg3aSKqKyhrdrOOoLRIpLprwtXkzPhJvZFpxCbPNL0MNUOQSHxDe+u1qBVtWXAldnvoIGDYC7OmfneXwiLsoVNKjcrMJw9ZL8K6zLVoNuW3x8P0MjlJAeM75KUYOZ85jRNGpDBuoZPSGjYe1lt9cPk40nUJVg9rcoOTVD1f++RLaAjuGWR7EpR5PquTFEFy7d2nTwQxYOHTf62pHaWt4ZzklxlucZCjRFa66RZDKrV7ZxLQdxfCgo4dyGhKrcBSfaI3Q54WEcpVH9ePsfQD9SWlKw4mKWoswvKW1b3jiAE9fM3ipSMkgblwFEQ4HVEW+YGvmLFV5uxeDH5996oulAZ1Qjf1/XbVej3Lh1U9xFc1rhYA5/p4PLT+YeenIboNj/1WAkYzyIO+H7PPPMzo0sWQhMvLqxcawuwghwrdodwr7SuujFXDzlpOICB7yUd6cTD0heGJVD6337Jh0Pywr84aX1hRqdPnt6Vy6GLk9akf5RugK3xlnBMj/5N3apB0GNbcT/r2bogOlYpLlkfEMUfDTV4DluH6Sv8B89nfHv0FP1Egy18wquAQyj7p
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnNMdTgxUnlVUWVSQjU4dGc0b0o3U2hzcmZ2TjNTZTJQUEp5RVUrS0V2ZUNQ?=
 =?utf-8?B?ZWRqd28xek9LR3o3VzFHUnppc0MrRE5aYVhGTVBTbUNMbmhsdnNoNHBCcDJx?=
 =?utf-8?B?Mkh0Q3lhRHc0d3FpendWdURoSWJtNXNqaXR3UFp5SCtwMjlHRVgwOEY1VUtw?=
 =?utf-8?B?WjJlUnNjNyswZ2d3bmdVdm5xeWdDdU5NcDdyOFpxeUVwZkFMTGllSzBLakhS?=
 =?utf-8?B?SHh1cVA2RHBYaGhOaFBWUTNESG9CNFJPTUlGMTdYTkhINjlXbmR1M2dyazR4?=
 =?utf-8?B?VGxzWThaYm1FTnplVnJDMFhrRWtrM01hZDlFdVhPMUFNanZVM0pBUVF5RUdH?=
 =?utf-8?B?VVJJOE1nM1VpMnRsaStGeG10OGNDN051d0U3TEtIQTQvcHFjc1RPaFZ0a3ZZ?=
 =?utf-8?B?SnIzQWVwdnR4bHI4cG9uT1JzMFhrLzQwOFJGWi8wTUh5Y2dINHh6V1RtSTMz?=
 =?utf-8?B?OHBIaFNrWE81bjhMdm90ZjN5UXcwcm8xVkY1NFdybzdaRTI1WldWSkpHNVVp?=
 =?utf-8?B?N3oxNEMzbXVXdkpKK0ZLZG4zbnE4Q1p6NXkyK3dUK01oWFVFUnNXNnhzUWZ5?=
 =?utf-8?B?TFVOWDNLZHBVTEVlTlVkZjFOL0FudHNYWnNMUHpsTy8yaEY4RnFjRW5xSG9Z?=
 =?utf-8?B?cWZwR2xtT1phOVlyTndBejRiaEhSN0t0UElnMk1aamVLcGJrOW5RQVEwS2Js?=
 =?utf-8?B?azJVd0ZMK3lxVjlzNnEyNUV1QVRZZDNoOEZqblRkd1ROcTR4TW9BRTJCc2FV?=
 =?utf-8?B?MUYrK0xwaktybGJnR0ZnV3NlN0xTYmcvdy9ocStGNjhoTmh0cFZhemVKbnNk?=
 =?utf-8?B?SnN0RlBCZDQxMDBGWWFXQ3JQTnovbGdCMUp0UjBIbmlON0FKNjJPeWJkWUp6?=
 =?utf-8?B?N0FDaGR6NlBEMC8wTlNIbUVoS2lNaEVia3BLTVNJTTByRWVTSlhtTWkzUExh?=
 =?utf-8?B?L1IyelhVekVDZk01OEcva1ZKS3BpdjVhZ1JxQi9MVG1TMWIreURwZ3R1K3dZ?=
 =?utf-8?B?NVJkS1MyejgwK2grS3VuTnBtZVZDUWF5T0xwSmJVd1REQzNWVjMwN28wSlo4?=
 =?utf-8?B?Z2lzL3A2TnpPTkFqalIyMWUrTG12Y0YwMjRFclIxbFgrOXdiZStXaXgrLytF?=
 =?utf-8?B?VDJKR3h1NDlNMDRNYTc3L2crc2ZZU3J3VDFDTXlUK2QzYmdMQmplU2F5K0h0?=
 =?utf-8?B?RmpYVVV6a1haMC83bnQ5amltSi9nYUE0QUJqMFlWS2JZQ2IrMkdhWkhqSTNK?=
 =?utf-8?B?SHdETW5SclpXdGJEd3NVait5QmN3dkhMTVBoc3Zyak1KckNDRW9pdzFOT3k4?=
 =?utf-8?B?bU9IL1JWUjdhT1hDaGtWbjZQODJUQmxaYjg4YlFmU1ZJSnlxRFgvVWhWVGdR?=
 =?utf-8?B?alFFVVlIMmkvZEJ5UGtKdUp6Qk1lekF2NGFnQlQ4d2NRYVZUalRJWlpCZGRZ?=
 =?utf-8?B?TklaZlhOVWEvVjZHV0U2NEJwUG8yWmZuL3VscHNSUUQvMjBVWkJ4eFZibUIv?=
 =?utf-8?B?aWVMSHhwV2ZDQlU4a2lKL0IxMVhRSUhZbzRjNXZkdGNtTHd3cjFabVUrOTZM?=
 =?utf-8?B?c2JWVFlMWkUzMnJ0SUVCUDhqOUZmdVhWZDBUQ1BieHNxVFBQNlBCeWU4eGFH?=
 =?utf-8?B?bE12QjNWMGMyZ09tSktsb01FYVF1ODdDWVV2UnlVRnBaK21MSC9BaWZGOHpS?=
 =?utf-8?B?bzhRdUc2WW8rQ1JzL2ZvMy9YTmhCenFqRXh0VnFCVkR0Ykk4a00zY1c4aXFU?=
 =?utf-8?B?dnI5S2xsaGc4ZjdWOWtlcHp6Q1NjZTBmSnNiRkV2QmM0aUR2N0lwUEZnTGMy?=
 =?utf-8?B?ZXZuclpEMFhicEord095VjRmSzU4YncwZmJVVUFkdWV1UFZwcHVsN1NNNGw3?=
 =?utf-8?B?VTlkUmowZzNjbjVrQWtJeUdVdTBPaXZ2eUp4Yi8vMVlOVHpORHdQeFVkeHYw?=
 =?utf-8?B?emtyK2l0d1hwMTM0N29FSnN2RFljZjVZa2dtNU9OQ2l0aTlxdGNjckF1L25k?=
 =?utf-8?B?R2N3akJKMzNoU0txMnZrQ1gzaVhMN1lwRExFOVU3S3FWVDc0Z2ZraWUxVERQ?=
 =?utf-8?B?MVdPVE0rK0FEK1ZrMTB0bGlMN01hdXhjbUxIWlduN2pySy83N2NEOVFjTFNB?=
 =?utf-8?B?SVVXcVNpd2dmejJaanVVeGxEVXJPRG9VTkZzWmdzN1ZTWmlxU21TTFJEK0Rp?=
 =?utf-8?B?cFpUVHhUZGdOTXJYYmZmYkFBbWdncURBVkdFN0MzYy84Wlh2RGxrUVgvRkxu?=
 =?utf-8?B?VEY4dWtxcnF1YkVOeUNRS0dJQU84Z21JWW5FZXdrV3phZ1R6ell1MXE5ZjVZ?=
 =?utf-8?B?SEtFd283UkRQZjBBL3h5M1dyaG5BL1VaSHcxSzM3Z2FyTW1iQ0hCRVZPbDI3?=
 =?utf-8?Q?rmKYV+mglS6A5cE4=3D?=
X-Exchange-RoutingPolicyChecked: gLxd1w/Hu1EkCX4X2VggtO1EEArGiO0TDjsff9qZ45AXnp6Me7QJtVQ5rfe9f+xToBpfA1fo6OWpziYbiEwzSurIvAVnA7qJJwbZk34AXc3quJ9OkN0zhugKZFT/QimMq5g4kBXL7frCahTg7gut9NfCgz2FsBtfyHWXJewLeHmYIVhIH2HbTLV1jOKkDSJwdMV3U9YnBIkg4XwvW50JstxJzgBEm5h4+8NyEA/ee188qua8YpjNliMFAapezyuGFe0HyzBy3m/VhYtVFB3SkXQb+CF70XcuoLV9Fj4ssK+3dbYBSXUrog495xl8qnUM5TbWBOqSHuU89EOzSl4qGg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c6c7779-3c3c-42fe-3994-08debdb0d21f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 18:33:47.1172 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /VxLvlY/q85swl+4PwW+NaHgqQaYFn0W0MYqC+c1c6Hx8pTDi9yN5PNiuI5XJHr2ws40KPP1watVmo/mSTd0a3+XfwHY4oRr0ce1AU9OwN8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7273
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

On Mon, May 18, 2026 at 04:47:13PM -0700, Ashutosh Dixit wrote:
>Whitelist or de-whitelist OA registers by setting or resetting the 'deny'
>bit in OA nonpriv registers and writing new register values to HW.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

LGTM

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> drivers/gpu/drm/xe/xe_reg_whitelist.c | 15 +++++++++++++++
> 1 file changed, 15 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>index 18053582a6afa..0d2cf3d964a51 100644
>--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
>+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>@@ -229,6 +229,21 @@ void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe)
> 	whitelist_apply_to_hwe(hwe, &hwe->oa_whitelist, &hwe->reg_sr, nonpriv_slots);
> }
>
>+__maybe_unused static void __whitelist_oa_regs(struct xe_hw_engine *hwe, bool whitelist)
>+{
>+	struct xe_reg_sr_entry *entry;
>+	unsigned long reg;
>+
>+	xa_for_each(&hwe->oa_sr.xa, reg, entry) {
>+		if (whitelist)
>+			entry->set_bits &= ~RING_FORCE_TO_NONPRIV_DENY;
>+		else
>+			entry->set_bits |= RING_FORCE_TO_NONPRIV_DENY;
>+	}
>+
>+	xe_reg_sr_apply_mmio(&hwe->oa_sr, hwe->gt);
>+}
>+
> /**
>  * xe_reg_whitelist_print_entry - print one whitelist entry
>  * @p: DRM printer
>-- 
>2.54.0
>

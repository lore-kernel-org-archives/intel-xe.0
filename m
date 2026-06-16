Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1324BCD98E1
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 19:50:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C452C10ED03;
	Tue, 16 Jun 2026 19:50:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NgYdhswO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0220E10ED19
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jun 2026 19:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781639443; x=1813175443;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+h4UKHPNhxcDhlVH3Fc+DC1EIE+aB7iY3hiwOp+elYI=;
 b=NgYdhswObhW4KJwNGXjv+sFngXiOOiK34Z66s5KjSpeTFuaH8HouYdeN
 2PA/EXugjctaOKqF7QsYmN9GMeHj8rxT3ax8XCPDQ5pbpw1rL3RdSrBAQ
 hneIhob85o3EQTAv6ciY05FcyTzGQnHvBXURK8EYlW6ddv7pJeQTGLzlX
 dbN0gaGlCD2yXWHrvsZlG5lrLI0jnFefZGv76gaTnLo5WmkgSpoCfUDvs
 xG41IBYlmPRRmksVQkDwxok/rsfKzKT/6XKTSSk+2wynGDSBQJDrGusw2
 AwXn2DCuCHb/5/gmaOR9Y3Gka5Ob3Kk+K/SukGjexBpaRO3AJKJTwzAuK Q==;
X-CSE-ConnectionGUID: UBSBej3PTlSCV3afYokllw==
X-CSE-MsgGUID: EvW59DiqRIO1BVsB2KHH6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="86254181"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="86254181"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 12:50:43 -0700
X-CSE-ConnectionGUID: sZWOZZswRdWdEFLxd2eiFA==
X-CSE-MsgGUID: nwV1FRQNR4SYBGpfGVgTAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="271574078"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 12:50:42 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 12:50:42 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 16 Jun 2026 12:50:42 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.59) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 12:50:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pqKkG4clIr0dz0PI1UqNoeVHBma3JMTS4QP8CLv61Dxvj9FGKMJgkFEy08zoXBg6nn8YPXjgIEaj5wtbYBqAhlsT/ew8ojTrrmtZgBsepNKa74tXya1ehjoC3McQnIufMauqGqqct8hGMBYysOwbHG4HpeV75sYKSZ0M48UNVBqgQ5EgDZdCyKShjs94hCFbtMEos8VjQSirzJWj6IllQnpZVqK/gsnf5ZCKJiz/C5eUk/cqtzKDArZ1YOdRZvEskIGCsYV84yUd2NEEGn1svE1FgpxImtjsaiogtWaGC60lqy5oh42YNnCegP4nmkoi+W2B0nI2S8qGjCEnDVA28Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sWcj0oFkgJJAybdhfqo8m0c6g+1YpYel46j0fkw95Bc=;
 b=SvnMScsejGkl4549sYfnc5mhqUVzqt5h/gPlDA9KuRLMwIfYQOFBV+3EdPWuoTY3EkjHtfXYUQ5KdjvxOijEX/Q1k/wA9zZd/t29AR7nL29OtvNwmu613Ch+SykBTG+r8xR/SfU45OL0ZDsz3Lt6UL1fgu4ZtAvrQXEBWnD2uG/2WFkZ3hjb1GSctGcN0RzOsiRnEJTMi8eMMGhJRmvMSToxuBr6HqUt3+lqcf16WehBLsHNryH9tYW/HinV8ziCe/y4d/e3etJ4Cr/rls/405JZY1MX3nK7WI1UGh5ZeFtjfj2dpclBlL5OtKQ004E2zvtgMPoS72Klgwj2zRONtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8284.namprd11.prod.outlook.com (2603:10b6:806:268::21)
 by IA1PR11MB6466.namprd11.prod.outlook.com (2603:10b6:208:3a6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 19:50:34 +0000
Received: from SN7PR11MB8284.namprd11.prod.outlook.com
 ([fe80::65e5:898b:2231:bf65]) by SN7PR11MB8284.namprd11.prod.outlook.com
 ([fe80::65e5:898b:2231:bf65%4]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 19:50:34 +0000
Date: Tue, 16 Jun 2026 12:50:21 -0700
From: Violet Monti <violet.monti@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 5/9] drm/xe: Add platform-level step info to xe_probed_info
Message-ID: <ajGo_dZWsZXaW2hO@vmonti-desk>
References: <20260609-xe-probe-info-v1-0-21e83e188e60@intel.com>
 <20260609-xe-probe-info-v1-5-21e83e188e60@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260609-xe-probe-info-v1-5-21e83e188e60@intel.com>
X-ClientProxiedBy: SJ0PR03CA0065.namprd03.prod.outlook.com
 (2603:10b6:a03:331::10) To SN7PR11MB8284.namprd11.prod.outlook.com
 (2603:10b6:806:268::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8284:EE_|IA1PR11MB6466:EE_
X-MS-Office365-Filtering-Correlation-Id: c22f59d7-e606-4b1e-da86-08decbe087a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: h5yUtETKUmhQjGaEfDejYzIpFSbuYwC+IWYkqgdkrDjm585xKwu9TYlhuZIocmcxea93JCaBrpV2GoRQM52Wt60asXMPyzaulcHmB6Wc4lR8CxOHqLn/etvz3riiIoymHfiYy30uYGmUSShYIMGM4BxTI639przojbWicDi7Uo9crTSgUptatmz2cwIPsAYZA1z7nLnVC3AJGvesKCQX9UkkeSBroHQ8vDq58jwkm4bgzjHaxScjMK4myAYLarAM22J5Eb2bF7yFguqfxirzvLBj5xQk21ts/VmBwqPGdRKdMqvCZ8Y9dTpuJmFp4fLMkF7wCxorNIIiJ41H+uX1duC9nXA11i8pqDeudKPHMhrWo/ZkPMspY3BpTFmUH5ph12VEy6/JN0DLsUe6ouEnCDZVQPmBIi+Os4Ky4qYq/Ctsj/sPjPFxbk5dWtF8sY23VTZxFHfcbATejdq7GVHnwpsqQI2yEtlw989LXzBJZSPqls5/NGewP/yGivy++jbTFvoDEZukfvvTO8hCvNd8JlqGOZSGluEjaWm5hcdXIStOl4Ktjxx+yJo6gwFioY1JIYGo11LJ1891wpoRfzE2UYtALGz2gZcVWR48oIKIpB7Da+pxQvAcNren8efDwIfPyEpFf/bH33TUivLprbnuPDLwwNRBx5S/iR4LYhIlVZ52+KyL9naPoitEXTAtQNmM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8284.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1pQrbcVARDL1RijO9Xv028kDi40wCbJ3Tp2ZaIj93k3uIkH6feyWd6e6NTHj?=
 =?us-ascii?Q?Bse4QCmtc+r4yEqyWU3W6FHSh/YJmK/j+KKX0ZsjMkTR0PdP84xuzWk+rhFY?=
 =?us-ascii?Q?4Bk7MONpEDCEGD1etZRECSloQZk3QRH3Y4io8VV4uuyc1TdfLg6AuAu6NQW7?=
 =?us-ascii?Q?hT4sxWHIRbvOwdY/XUhmRDvbvhOqt1YocGVye/peTv0zuJ3SqHXseIT+KH4o?=
 =?us-ascii?Q?YaKYTHev7el1T215zzW6RgpslVox16cXXWQKTq4FyBw563JOv09NJae9bQ3q?=
 =?us-ascii?Q?0M39i6WiM/mTplrM+Ml80HEDBwuyRFhaYfFWOeNvtBucQJTmwcP4DkenNSXp?=
 =?us-ascii?Q?34DPEd6zl2ezUgR5nCepgvsqRBMW3urxCXtdcmV/kkqvZeIM4LJwR3Nl+VXQ?=
 =?us-ascii?Q?3auHM4mRZRC/i119lFItP9vRkaflPXy8GbfSgsd/Pb+L94swBMrrWThT/6tl?=
 =?us-ascii?Q?2cKQ/UbyE9iPk416Cvr/NO6EW3jLDr5MiK/OlCL8QN94eoe9fD4WG3oAg8aX?=
 =?us-ascii?Q?5wY0Psh2ft5mR7mnexQQFCK5hgg5lSU4Vk/XcVJJbBh/w1qhtZA3i0k6/lPi?=
 =?us-ascii?Q?bKcVeVP9bWN2J3+PYUs6M1d2u2rQ9v2VSz6esDRonrVfCfE+A8M7u9KW+yxd?=
 =?us-ascii?Q?qa/WIK9nUvuU4VZMZX/E/oOkYORKLgXmEeL8TPIATGfm65s0WusfizsfLvuI?=
 =?us-ascii?Q?i0ItXMK/Dmjb5sFItA3aQ+TbU2Cq7iYqg7+4TVzr7nSh99RdKp2NaOEekunW?=
 =?us-ascii?Q?brMs/tI1+T1GNJHJbWmWmw8r+7pZQ3zIC07Rf9+A/bASgjHp3KQPzXcoBp0A?=
 =?us-ascii?Q?g7xepql8/ql9U+qWqmQLgQlZgmMbfipQigbEbyk7b4v7HQgSag7K+828gxtU?=
 =?us-ascii?Q?llbYafTZckbFFYnNhfrG4qwzx2uUgj4w7ckGRY/H6Q1G/Az2mwy9faK39VpN?=
 =?us-ascii?Q?lFd/l/n29XK8hCD41OD5woDXZZLVn4ZMl79TbA8QvuUkSeGv+IPkEOQp5Oyl?=
 =?us-ascii?Q?3+10a04/g+AGjN+1yp3uI7xzVOUsXYP9JpMxollX8LFvywWONK1IcS+18nEi?=
 =?us-ascii?Q?l4xuER1MZD9kT7kekSd2sqovzew5QeapmDN9xvjjyAgRSfv4YIK1Hj96rOJs?=
 =?us-ascii?Q?B11ZVBzboRgyxBGc1sg9bpLflsZXfSGeEMdrZopF47Rb4Vft0Goe6J4/AN6M?=
 =?us-ascii?Q?JLBPSmd349h2VHRthO8IJeivVLXQGL3uRPWjaidZUIGpPrty4fCt7fIe3//O?=
 =?us-ascii?Q?0WvKFidef5KfjcWarSsxQ5Y7PqNKKv5xizK1aTvExvlWopidp0LZcIFIZg2Q?=
 =?us-ascii?Q?bplRl/L5jEowCJM7kzerwKvONvWwoH3KHSANu0GMwdJS7RqyZRY8J4eiOROs?=
 =?us-ascii?Q?40g9ShXcjYSvpSdShY/MjJ9+bDHkh/Z97Hn3Cvb5mqLiJjcwTj57eD1aX2G2?=
 =?us-ascii?Q?Tcak2xWn7UV/yYcktKXmoTpkn+g9cBPO5J1Rw8+mu1crq+Qyo637u1fkmsxf?=
 =?us-ascii?Q?m8xRQKcN3UOAf0B6iJvEDvTnlQwL4kqTdW4JqsHhiEdI7x4qQF8mu+qEuqDZ?=
 =?us-ascii?Q?fNEHMGVkAvWUTN7GFuYHbh+FafhQx7bvOL6x6INXkeHnTFgI23UpIza9lMMa?=
 =?us-ascii?Q?zj+evCdu4jMJ6KW0fUfoLaiuuafwQ8WVEFZ3rQFb90ePvVgiYTkcWr6ucmC3?=
 =?us-ascii?Q?RFBUFFXbc+8bLl12zVWFXIdPf/OBeqPGefWwk724aJRiGzFeHHOdaNHpMYho?=
 =?us-ascii?Q?ROK8Zu0s8Q=3D=3D?=
X-Exchange-RoutingPolicyChecked: f+lkmdYRl7ZwL2PgFLC7sz0eb82InD7LkgSoVOwGlhuOyLVvr9MBCAQMUF3QxkuBNLMPNH/QV0O+t+iagucmSQAeqMqYdi/Ch7dvhT6DuPJV9NN2celv9IYEnYY+9aHXwTt8WgZdqYIFrnj5lwO1y61yIc/fcqQMoxrN0MISLbqF20Hf/tEEjxUJgGVDFcJca6phcq5NlQBjGuccjF3cv4c9wnB4kvqRcYDp2bDYw/0+gwyHlf03jsSmSV6QV02OP2ilZ/mcgEhZFcCJ+pyoxL7Xqrd6ie/rHXH/JdPV5f8Btm9EyADlbLJ8Z0VuJ8Gjm1M2BxQXEKbqn9FAaHmjtQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: c22f59d7-e606-4b1e-da86-08decbe087a0
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8284.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 19:50:34.3078 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AOSNtQYBUcd88oDXuphJUy3LT0biBkyDrMyjOZzwaX70CWfFrZ9fDjdONtORgSpiKvdrAeJp+LEbnc+k6NAmoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6466
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

On Tue, Jun 09, 2026 at 05:17:37PM -0300, Gustavo Sousa wrote:
> The platform-level step information depends on the PCI revid and, as
> such, should be probed in xe_probe_info_early() instead of
> xe_info_init_early().  Move the code accordingly.
> 
> Note that we currently only update probed_info->step.platform as part
> of this change.  We will deal with the other fields of
> probed_info->step as a follow-up change, which will be tied to the
> probing of graphics and media IPs.
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Reviewed-by: Violet Monti <violet.monti@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pci.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index c5c75fbfa0e2..1c53a25442a9 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -730,12 +730,14 @@ static int handle_gmdid(struct xe_device *xe,
>  struct xe_probed_info {
>  	u16 devid;
>  	u8 revid;
> +	struct xe_step_info step;
>  };
>  
>  /*
>   * Probe from the hardware the info required by xe_info_init_early().
>   */
>  static int xe_probe_info_early(struct xe_device *xe,
> +			       const struct xe_device_desc *desc,
>  			       struct xe_probed_info *probed_info)
>  {
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> @@ -743,6 +745,8 @@ static int xe_probe_info_early(struct xe_device *xe,
>  	probed_info->devid = pdev->device;
>  	probed_info->revid = pdev->revision;
>  
> +	xe_step_platform_get(desc->platform, probed_info->revid, &probed_info->step);
> +
>  	return 0;
>  }
>  
> @@ -759,6 +763,7 @@ static int xe_info_init_early(struct xe_device *xe,
>  
>  	xe->info.devid = probed_info->devid;
>  	xe->info.revid = probed_info->revid;
> +	xe->info.step.platform = probed_info->step.platform;
>  
>  	xe->info.platform_name = desc->platform_name;
>  	xe->info.platform = desc->platform;
> @@ -808,8 +813,6 @@ static int xe_info_init_early(struct xe_device *xe,
>  	xe->info.max_gt_per_tile = desc->max_gt_per_tile;
>  	xe->info.tile_count = 1 + desc->max_remote_tiles;
>  
> -	xe_step_platform_get(xe->info.platform, xe->info.revid, &xe->info.step);
> -
>  	err = xe_tile_init_early(xe_device_get_root_tile(xe), xe, 0);
>  	if (err)
>  		return err;
> @@ -1139,7 +1142,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  
>  	pci_set_master(pdev);
>  
> -	err = xe_probe_info_early(xe, &probed_info);
> +	err = xe_probe_info_early(xe, desc, &probed_info);
>  	if (err)
>  		return err;
>  
> 
> -- 
> 2.53.0
> 

-- 
--
Violet Monti

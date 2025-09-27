Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F31E3CAC5BD
	for <intel-xe@archiver.kernel.org>; Sat, 27 Sep 2025 22:56:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4C2010E1D1;
	Sat, 27 Sep 2025 22:56:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IxRqBO9b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B380010E1D1
 for <intel-xe@lists.freedesktop.org>; Sat, 27 Sep 2025 22:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759013782; x=1790549782;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+hO8xyHHh0PInq7ubW9U6wyjB6/Tr1zqT33vxysLzNQ=;
 b=IxRqBO9bW++Ny1ai/pNdPD1kJUuacis8NRPJOyb0gzZvvWXLt3VANc2F
 UTbTPA+N/OEZc3xtRrATY+ANJaEaux++p5o7w7MKKAxhpKPCFu0Y7Ufmv
 6xU8+AGNVSgf2Os607uY+IThlIu5lMPpe9tD8HeuKTLAr/RLThdvhHuBl
 F4I0MB+DEpSjr/8hDH7w6gaWRQI3yLZV9nqJTg+AezUDagY6BhzHnYeHc
 wGF/nau0OK1hr0XDTq5VGh38IW0yy82O9oxlJ4CQZEKiOcmtpH1soza2n
 ItGNjRFEXJvpgMsEpaWZlrhP5cVlo5d9mOk6V6W4kHuCz14O0AmKDHS/C Q==;
X-CSE-ConnectionGUID: zydrfiYgSBKs0NOh2OKgmA==
X-CSE-MsgGUID: DFZiYKOeTquTGdpdVC9etg==
X-IronPort-AV: E=McAfee;i="6800,10657,11566"; a="64935567"
X-IronPort-AV: E=Sophos;i="6.18,298,1751266800"; d="scan'208";a="64935567"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2025 15:56:21 -0700
X-CSE-ConnectionGUID: DEj+in+kRXGgmJHgSP5gog==
X-CSE-MsgGUID: 0ALsARjcRYm3s++d1ivDVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,298,1751266800"; d="scan'208";a="178299259"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2025 15:56:20 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 27 Sep 2025 15:56:19 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 27 Sep 2025 15:56:19 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.18) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 27 Sep 2025 15:56:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xHB+eL0zErl9aaqBVZuqeHaYwkGgQAXiL8QlnJhJWAf94ys2qB82sU/UjYca5RBZWnnSxKGoXJ5gO2XVGa8ZiKzVWZLs/DROI4Ol5Ih6R65530uSzrPtaSLLnvUr+DPD143V7pHFwqC27RyYWCBeSzIAdaskoNsbnAI/WAm4M7TFSI7rOF44t4fDjbUZ02RGQL8PiY0dzAEe4lPy2Zu5z3ZFsoaobzxcXaTBIQfeBwosp8W1OnIR08EYlAXaPIqanKn61vQaBqwUeJj9B+a8lBKJSveQwnWSQ0S4djWkCacBNw4bepqpBNSoOYCRN6tUpbDYWlCKWZesIdGzQZKCfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cm24aKp/pdRIvFyKeyngHIJj+vrlOB0wGkKJw1x1AW8=;
 b=Pf2QOoUtlPRXndf5/CwFKxBodjoof54PSRu4I5M+VPfK4erlstdJixHDzd2/mMdqU39nW9ecxYgMVgs5HnSQkASaGWW2Cuuhcaxu9CgUuHouiQTDfhfd3ykS8JryP0rG1BDDPyAPUm+fOZv3tRdqM8Of6TMyAjZBtPOI1Il30PeYD73EQynu6AIkLqDmzrg21gJs0iIX8p6gIE/xNDbfl2SpV0OoieM9AtwShDP7ks3vDJFLVP/fL7UtWm+pdmnzhDpRpS92ZhW0K4WMMqX8B34NpG4C55vCsr/yT/F4JiKm4GaUHgEvi8UuhrmeQn6XDyQd0rzZdDPIn9vW+kEuvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB7668.namprd11.prod.outlook.com (2603:10b6:806:341::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.14; Sat, 27 Sep
 2025 22:56:12 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9137.018; Sat, 27 Sep 2025
 22:56:12 +0000
Date: Sat, 27 Sep 2025 15:56:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 19/34] drm/xe/vf: Extra debug on GGTT shift
Message-ID: <aNhriWflRoNXV3rv@lstrano-desk.jf.intel.com>
References: <20250924011601.888293-1-matthew.brost@intel.com>
 <20250924011601.888293-20-matthew.brost@intel.com>
 <0ad445fe-8679-4e8d-bd00-ce27e78f6544@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <0ad445fe-8679-4e8d-bd00-ce27e78f6544@intel.com>
X-ClientProxiedBy: MW4PR04CA0153.namprd04.prod.outlook.com
 (2603:10b6:303:85::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB7668:EE_
X-MS-Office365-Filtering-Correlation-Id: 86a80f71-8d37-46fb-3998-08ddfe190e55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wquZTHTbSTcUZHo6FEPOUnCpm8fItBuDbdGbI+AJNoGyYAotVN71YU++rkn2?=
 =?us-ascii?Q?wgU0dV5QQ0pNz95Nx2Lt1ngtWMQD7GHXv/WsUvLMyN0utPiSzgLqiilOFTZ+?=
 =?us-ascii?Q?tJ40QhcQuBNeX0bygbVx8UGfh0OQBemy80I6tjNq0MDmbuC6RKefIv5zCBvJ?=
 =?us-ascii?Q?a1sxhFFRQA+tTiufsCyNvKYUS75acmpQXYVee20wPPxKeOtVJQk03Ii3/vpn?=
 =?us-ascii?Q?Sk2gki4Kv2yc9GhLYUhu4Hi919D2bPgMV9/Z9ExCol4cbkhtl8y73XFTxxiA?=
 =?us-ascii?Q?85ExS606XmTKQMAd6uw5NehglGbtiOqnNio0nipESIgNJCpOk9vQ2pM0dzsW?=
 =?us-ascii?Q?EwuyXgCD0ZdhcvHqdWQ19+UI/Y1pp4iTWwWSCvjQyiZCsm/gbVNLtL2v4EPA?=
 =?us-ascii?Q?XWoxWXOsZ8jOS9hZwo1/GXjmO8Us/n5ygOgdMtJX4Sw1xzzkbHeD/Bn4GQM6?=
 =?us-ascii?Q?Jke5jKkD6hGZ0BuNph88RiCN/Qz5qDYVw5L1UkFhXLmE10C6utyQTcaD8rhB?=
 =?us-ascii?Q?5JOIbnjfilsIfJRS+DHXoSE82GYi3mi67cX/kIv08SAK7NfWOGtFz7xPNYh8?=
 =?us-ascii?Q?69VMJXEyfxg1Vnc8Y/Nof0lIkkJx8nUdg3R4vSph0V6xdOtllXR0Me6cWUcb?=
 =?us-ascii?Q?yvq0Eiih6+wFuAw7woIqw3TmEszhU4AZGB4h3Fnqc0tBkkVSdMZ/JByavTlt?=
 =?us-ascii?Q?fNugeSykmfqCA4j1RNh33p8Kep1rptljS3ogRDR5EuxGVr9qZ0Jn1dlAddQX?=
 =?us-ascii?Q?+4naO7elaYz+ZWE9oMio+bhwb6xTV3IIYFGTqc9s8uHkGRc+Y+zkfgI5lvd6?=
 =?us-ascii?Q?mcAKGPnCjElulDaKe6Bep7LDjsx8PyBnSZzqaEFiZ5113BocSqAf8exn0uaG?=
 =?us-ascii?Q?SGO4LKrHvUIN8JOehyF/7D8itPG63psXSyKIzwjGIep0zPx5wdNOniTAZQ2k?=
 =?us-ascii?Q?bkXk30uilVHlfyI8xAFmqO9YujoyUqwsv62Y6GXM1Nd8ZHjtMr9vV7hfjejX?=
 =?us-ascii?Q?BgniUe/rvORkbRtqIgUYeytDlHUkORHqHVVVkAuO80fuCmjE/HUF/RS8sF/X?=
 =?us-ascii?Q?qQHgtsXBlLAkrnrexfVP1o/1I+uuHa0RAeR1ZxULo55h0+j+wmjN2tNqpkcj?=
 =?us-ascii?Q?ujuXiy/ADDJn6vEKYNQ6Rpee9We4+9stLJ1xwRvG88c86/dDSUIn+w2zvnMe?=
 =?us-ascii?Q?lW+aUpnTeqFFUcgYLBCuypM8M4YJ6H2DIIb+18Vx6RyRq3lKeLoASAdGVLMF?=
 =?us-ascii?Q?TuGQ76tq2VMNDOXUe5MPgyjp6hLyCeSHVskIOIVHDgQa8UtnZ9JxedOy30Bh?=
 =?us-ascii?Q?9b0ZSovUH8M7UQLTP3p9ZrdvtsH5DVmYzH6lbrfBx/Rw8sULnPGuOvzXLADu?=
 =?us-ascii?Q?CVD5bglgcai3Q5ztU+t2VG2dR3rwoQbJ1aGFom83ngxGHfuVJtHNwV0hFoJ5?=
 =?us-ascii?Q?Sg2/GdUI4lB3O66FaJp2z3fA4MqPG0q7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PVlQl4qFlgCn5XdXqFKn1P/VvlMIXACaS6o5ZQsBPLJS5eT4hqJUPTsprpLi?=
 =?us-ascii?Q?5Pc8Uos0I2jNZ24RH41cQYJoY3t7qohvqWFWF6KL2cNVk+t8XhoWRV3YZhZB?=
 =?us-ascii?Q?mhjxAqATw2WGioViH4uDFvK1+86RlkhuG/rq+SPquEhoR6dfKwUWZRvaPU9u?=
 =?us-ascii?Q?ClgtNQ49k0mXmoJUuWaTq80DZQRpODgYzZ2ODXFWYqjRHIIkjZiwdWA4kY2a?=
 =?us-ascii?Q?vKB7R804h/QrswKOxqoYupOt1gpjEHbE/jUVmEWafNfOuz8CZfEMjM8hmDP4?=
 =?us-ascii?Q?jl/Tv9ae6hxEHMPUieFrqBhWo8iCO13FabMLOIxiEQUdK1HLiFCTFKeb+Icl?=
 =?us-ascii?Q?iTcQRfz9uupcAyWiAeL+dv2Wf336cpeZqTyKJ8iSb1Lgon4+vVsAYDdGOfNR?=
 =?us-ascii?Q?JI9nhN0Z4B4tFH7S9OvbdkM5vqawhdrgvTn3vVU5D+ju8/GTjaEfIkirludn?=
 =?us-ascii?Q?hdWhfBzUHwSULubxnUiSa6/pkEeNHwuLPtDJfXETdZOsQbm3svCvpski4fRO?=
 =?us-ascii?Q?2UahTEJtR6OSDm93c6hmHty74wGWqrGM8Cc90DiLP7CLYZVEamGhVtiWj4Z0?=
 =?us-ascii?Q?NmoRV7rAuJGfvyi/VQt4eDBJsm8d9htIGiZDHZgdFIITsEQCv3JbsWhOKN3g?=
 =?us-ascii?Q?zYe6hs9fOqP8skhpWYMTMDmzg0asIYtkMGKhLu+6k+AFGrXjUcRilvjhGFb1?=
 =?us-ascii?Q?mzCg4vGick49Tad1cr7Xi3cQLU+ujMm5dtVMTAFgTNj0iUM9PlRxwDeVygSz?=
 =?us-ascii?Q?K9a/aXjKLP9p2KiDCPzsrIkOzsZA3I60qAm8X+CqThrKkupYxS331OhrJbdS?=
 =?us-ascii?Q?8qQizcVLsarVg4sbhnZRW2wzOHuPMRzMHiS4QkRw5ELRvty7O6Abv80JfOC0?=
 =?us-ascii?Q?dY/0DNE6WzqevxEz1Xxx/I/dcRWf+qHydebqewtTZ5XMTFK3+982P2ufkZMA?=
 =?us-ascii?Q?5O/jaY1WKroTqTj2My/1gJCxu7KzecJh/wczWla5RZenfgtND5uqOuAfMc/V?=
 =?us-ascii?Q?8T8I1B605qYdn5v0oo5aRVT7dFoQF0bnzmp3bdYxAxcvxPzLyA5vTWlAV3c4?=
 =?us-ascii?Q?rhRMbeRJwvctVXSXXtTBMKhTIrSF/KQhjNYdOrAFx01EUigJIRE7GBg6/zcW?=
 =?us-ascii?Q?DWws9VRB9/ytPLzHZcGBHNHENfTC1CDJo6Y4sKpa3RdASQGr9iC/czSlBrJ8?=
 =?us-ascii?Q?G8j9qoFiTwQA6G+81hiZsx8aaRbvUCBr7JXNdfUMWS/SS8P9teJ86IckSmC0?=
 =?us-ascii?Q?qwIaSVduJeOQBUTtRkVUtfaR7eeeIbHKkqp1Sq9FKgaHDmF+Exoce8qCaZbh?=
 =?us-ascii?Q?kYdb++31EEFioHJEaylsx+46cK3XaWRz9b7mG3htQ1IfIUXstXbSyjMrqDOL?=
 =?us-ascii?Q?Fs/CdN+T+Xt90iZhWLIbJVC/Z79YggyuZqc9J/+VRTfFVzSXAbWADSvZ5Sb3?=
 =?us-ascii?Q?Glbhy+sQEL/2bTRyTZw4iZlEB/kpTQ28gViRm/p4TjK+NT+u/1p/m8jkuw+I?=
 =?us-ascii?Q?O6n0Smq+1e1t+7fzwlZN2cvDkEKYVFQZDpXkME4TqGNsyXlDUX+YO1Rvd6NO?=
 =?us-ascii?Q?rm0cWRF4sBRvJbSgSlmZnMjI7QjgYqDrGKICnObc5RJjEHdcD37hfA+4zpfm?=
 =?us-ascii?Q?cA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 86a80f71-8d37-46fb-3998-08ddfe190e55
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2025 22:56:12.5978 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ii2Qf8RwfvDh0B+1Js5dYLuBdl/kUVea8qt9bmHpUktZOfoCSit2p8BoIG7bs9W3wN7EBQTPuxIGuy0Yc3ZZgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7668
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

On Sat, Sep 27, 2025 at 01:06:32PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 9/24/2025 3:15 AM, Matthew Brost wrote:
> > A little extra debug on GGTT shift printing the GGT shift value is
> 
> s/GGT/GGTT
> 

Yes.

> and maybe consider some rewording as I'm not sure it's right
> 

Let me reword this.

> > helpful for VF post-migration recovery.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > index a96e0dd65bc1..e79ab4a2a273 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > @@ -475,8 +475,11 @@ static int vf_get_ggtt_info(struct xe_gt *gt, bool recovery)
> >  		primary_config->ggtt_base = start;
> >  	err = config->ggtt_size ? 0 : -ENODATA;
> >  
> > -	if (!err && shift && recovery)
> > +	if (!err && shift && recovery) {
> > +		xe_gt_sriov_info(gt, "Shifting GGTT %lld -> 0x%016llx\n",
> > +				 shift, config->ggtt_base);
> 
> since this is "info" level message, maybe we can make it as:
> 
> 		"Shifting GGTT base by %lld to 0x%016llx\n"
> 

Sure.

> >  		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);
> 
> and print this from within this tile based function, where we could
> use tile-based printk function (instead of currently used GT-based)
> 

Not sure about this one. It is helpful to see which GT is performing the
shift which manually can be used to verify either GT doing the shift.

Matt

> > +	}
> >  out:
> >  	up_write(config->lock);
> >  	return err;
> 

Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68EE2606A321
	for <intel-xe@archiver.kernel.org>; Mon,  9 Nov 2026 23:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iJHGJrbV
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DD8210E211;
	Mon,  9 Nov 2026 23:50:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8E4410E211
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Nov 2026 23:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794268245; x=1825804245;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=b1WmF2UJJCkXhrMCF+Kc6D5VMIfCioKxGRikyOxp9vE=;
 b=iJHGJrbVUgThoYrlSwLlW30pQ52cULSukUCvsAzyrLa7O3/EULbroNob
 IvlSYe7/LtHLCB3R59G4v5EBGrEA3e2XxFZ1GOru/7lKOkO6qzd8bfJYk
 pOaa4gIgDHNwjhnPxTWe4+sEruHeozQuOur+9dNkEE2f31p2ISBtxKoNT
 5bSCwC+V6ycLTQPkjdQqXashWxQI5QpVILq3++2ta6xsA4YnykCVQLx3e
 DY1zOUGZtTVf/il+2Y4DgDSmw9PENHFynOQO28W48Q7PSP+MvOshJM/ge
 IjQeNvsTUi/Zg+me6RbxYhpWP5/5gshJbPAwx7A+n51vHZQJBCgB98FNz Q==;
X-CSE-ConnectionGUID: xU7xISO+SwyYC9PUG9I41g==
X-CSE-MsgGUID: jrkOVHZ5TJqIEBORoF92IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2890756"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="2890756"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 15:50:45 -0800
X-CSE-ConnectionGUID: rY9hN8L+T6OonBneWMLfPA==
X-CSE-MsgGUID: 095FoKcvSb2+TAm6Q6A+4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="8574954"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 15:50:45 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 15:50:45 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 9 Nov 2026 15:50:45 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.2) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 15:50:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F7zLUjkkPASLW4vNowgQWtLwdksG+Egt+EteFaiKxlVj2Gg9mKjjK6zeiyk2Zt4PA3L0Kdh3KaBsqmkVayTv7O9IYDNnpb8FpCUpR+hNDpNEG2HADxgzNmCceyAvO5k5+5XLRqdH5zphy8/cLnlYrrxDaGvIYYKBB1Sw8hNFKnRgxGw1DVYTLTyAM0lf2yAEcLKpXnfIdo4xND2PBzx6J8kEZhMnZU+fCFZbAQhfYDMja2CpJbzlqmCbX0u/vJmG+BnNPVO5H+F+BFybg2vPfbOBrOadiyKpZDUi3V3TMX8SLyHQsqXRe2ovozO3VnIqETQlv9/IWDTg4gE1wbq86Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bkncX7TwB6tLfEiovT3FYCdKWPupHY6H72hLyLMlwFk=;
 b=m1HaN8I8TT/wBsNBrxuT3Niclz9yhQ5OiZYdJC9uKJyXQAHXGc7dcS7ZY/LmXcMbY+3F86VMYa8xu2l87wkHyFj3Ete3Eb0BWU+ZaLtyBGDkz1qrGAvDqcfxdf2AtFA8U2ZpLCsiyd6LJvULSHcJ4djJp69WwU+f8gWqPzUVufS8LCquh0/AbG9eYfQEX11sUGfd78vALUFdNn/xFTBV0VQXRVX4mAtT3ZmryKcMx68ri8BoMywXNxugfG/tUUzKg3SsR1tahw0FzJyljWyDGcT/Xmpjl6mCy5o12LyIlyfJnVLA1ppMqD7UIkL4/cy+Q+W2qWf7s4mcnqA7fDWZGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5095.namprd11.prod.outlook.com (2603:10b6:510:3b::14)
 by DS0PR11MB7767.namprd11.prod.outlook.com (2603:10b6:8:138::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 9 Nov
 2026 23:50:42 +0000
Received: from PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded]) by PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded%3]) with mapi id 15.21.0592.012; Mon, 9 Nov 2026
 23:50:36 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Matt Atwood <matthew.s.atwood@intel.com>, Dnyaneshwar Bhadane
 <dnyaneshwar.bhadane@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>
Subject: Re: [PATCH v3 00/10] drm/xe: Clean up adjust_idledly() and
 implement Wa_16031259911
In-Reply-To: <20261105-wa_16031259911-v3-0-da6ec790aa29@intel.com>
References: <20261105-wa_16031259911-v3-0-da6ec790aa29@intel.com>
Date: Mon, 9 Nov 2026 20:50:30 -0300
Message-ID: <871p8t36pl.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0028.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::38) To PH0PR11MB5095.namprd11.prod.outlook.com
 (2603:10b6:510:3b::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5095:EE_|DS0PR11MB7767:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c2e24ae-2e69-4e22-29ee-08df3ebc4026
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|18002099003|10067099003|261102123227099003|22082099003|261009223027099003|261022105027099003|11063799006|261028144727099003|261021123027099003|261022075727099003|56012099006|261021121427099003|261026140227099003|260925021311599003|260925022911599003|260925021911599003;
X-Microsoft-Antispam-Message-Info: xU2/rPNMrAXm06vBo9YwIFDtcZV5QtMbjxNmdJZ5+c4d+ZctdfXSX9cWiJY3rAEck2kzwrvHV8jZliA52rd1llqxkzIOtO19mcdGsO6dGtMBNItVE+Y7eP7+dmjfmjd1tYK3yvMVfAHbi8K3FFuiiMwRNQjLF7Oexyl0OGiNTQqMImTKsBR+ogaJreOADHWfC/F5HmzNJV86FDpV+9z68PM1LQpzFY6kIWXQEz0irDtbh+8AiRvpe9KavoWehnJat1VgcMAYX1Sc0YymuWTOrtCWm7frPcds91y4K3UmZ/C9H6La2Xdxvq7ByggGTA5ZvYBZMzmee779tcAGVkqcojuwAclJ9wf5K5nVdGMdvI4/5r8yasjPDGbiraX9kXITvM9u+OG1psb+gMdde+LpNKjX76f5YRIhBX7WpNhOkIkmdE0u6CYDQmsrHpkL2YoB5YArK5aICYLsEj+0Cc/3NYaO86oL9aFdQeej6e1bPAik+4o8ei4yCRrPBa8LB9PPcsT0dDxezaLuP6m5hamq3Xq/CdsO9pkFhPEeRuQ9cDljc7hS42UWhXZjCejJm0Y3dGjAF3But4AQhr4Un4ecjiuKvNL+2lgJobFngGX7VkIsuKK/SlISUp+BwNPfPo48
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5095.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(18002099003)(10067099003)(261102123227099003)(22082099003)(261009223027099003)(261022105027099003)(11063799006)(261028144727099003)(261021123027099003)(261022075727099003)(56012099006)(261021121427099003)(261026140227099003)(260925021311599003)(260925022911599003)(260925021911599003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NJRLYk7NGsBQviQcEaR2CzWRpCZfljIr7dUL4UIc+nT8yQIndP0ZsTmAWdtP?=
 =?us-ascii?Q?GJa6Wl3VhmcqCH7hblhWn8u/QTHNFT7LR/p9GckXze+QX+aJj9N5eXOWIi5Q?=
 =?us-ascii?Q?XVHUYV3nqjLSojLwcoUmbwHx7MIsCRPHZcL1/R5Y5SLz6/j81zsxyJTtMW+x?=
 =?us-ascii?Q?S6aYU5INEpt4HR4Z6m9pefClFILmTNQnLGFVYoePTTQj42BFblRNor4irQ3Z?=
 =?us-ascii?Q?fgdMkDEbofL3ImrXhxrz8Gny/+963WtrrpeZ7ae+VNVB8ZVHFGOtDEfTF/q1?=
 =?us-ascii?Q?38SqiKUSrP570x2sllpsct7UMdEHmIH43BB+UkwaBPaeVVy+R35xZwt8clKr?=
 =?us-ascii?Q?oWmGT3DzF5ZFqUAJyuUWeU7tC212TcoP0T7HgpFb8ChilNPnY1XeXY+7ZQWM?=
 =?us-ascii?Q?fH36kFqy7PKKl/wwCdEN4QOut9cvutReImsxiyC8JfkP4BzIxKDJ4fUfpMQt?=
 =?us-ascii?Q?hWg8BNf31DsSmUZuuApENnaZdarqNC2fePDynXBB8ezQQAOAv2Cr3acBwAtw?=
 =?us-ascii?Q?GQOfsfMG/6/BxLr+iNUtvx/H6Z+Bx0XZq4rNPylv2vQegTA4v0rFwXCBfu1j?=
 =?us-ascii?Q?VbxjmISDAMuXPtH9C4YxuRnb/IFU86VLNT/nU2YrRivAFchr0uaeKixHx3lR?=
 =?us-ascii?Q?74gXq1GbHSL1AcHi397YtkJ9AVTIPdd7+JXzzvqIbtcfAKCu4FwkpWLQd1RH?=
 =?us-ascii?Q?2GZMy0Bw62Edm4thZSysPWeBy/4S0UpDSvJZPde1iHApJ6sMS0ZhXd6SYKIe?=
 =?us-ascii?Q?nc2ej3Yn6gpcv5QpkWL0EOkUJ2XjzSoC2QTq2h3jh8F1qRKPTdrmE3NWswe1?=
 =?us-ascii?Q?JfNtoadWW/PYmckj+gCFJx55AKQNZyZsEjKhwxzlTZlYCjYy6J5Zt5cK1pWF?=
 =?us-ascii?Q?D5WZu6fJ6UN5POKb5iIuQkWYe6C/POiSMHqk2hO8zIQbgys3k9ez0mPAnf5O?=
 =?us-ascii?Q?ArS/ssFeSUbVdV1dWd9cE9Fpl9YBt9O6m0OeHZEVOAvhVXaYhFPNrPnt4640?=
 =?us-ascii?Q?XYbOnODGXonF3PI5VPcEPtRTulasa2kBhNjkVqtq7eO5GLYQOSHenwaDFv4T?=
 =?us-ascii?Q?G20b+6rjijNtjmBZA1vYwTjOZeMGS0HTcc/PzdIz2JBVI9LtP5EpsN0ob+k5?=
 =?us-ascii?Q?a/fjHSK+dREjp9wSvYQRf4NzsmJfH3GKzyq82DGAxJI6Iv2r6OVWQ9piugV2?=
 =?us-ascii?Q?nXccjHE1OmFQE+ea8RxYC5xrUWGqGQTnXVeKGTxD9xWaPjyCblOPZU9gQXOt?=
 =?us-ascii?Q?cKa3eezJpiZucwaP2oAKIdW2jQiAMRapPSNv3ln0rVXKhHCli+wtmOxb8n9b?=
 =?us-ascii?Q?F2McYIP943dvlCX2SwU2XzhKNYicr61vIqajVQio/6YjpQVqKDRIiWsKJ5JH?=
 =?us-ascii?Q?LAverDUfrnwUwBY0UT0BvMUZINYkNv7eY7x10Hvva7p7VKR1EMXM8nCVxQan?=
 =?us-ascii?Q?LYHbu9ePxalqw0Pv89cTUvKQv2A04hWPBR0MDfBn1Npe1idrwXNtTob/gFz8?=
 =?us-ascii?Q?vUwmPPXjzDTcDnbQLx/CMALEazMeC+qxQp2FV6X/NaaqDRh6yT/H36g3bxg1?=
 =?us-ascii?Q?xYkpl5q90VGD90O0s+hxOjxi7Slyj38eVPHYl3RppN59vCnJbn3PlZx6HWI8?=
 =?us-ascii?Q?8kFK2iwz/7LkFHTsRGDWKjHUrDE5tVHBoHONW2A/zSjPUwscsK1AL/haF/cZ?=
 =?us-ascii?Q?60itgnoq0fG2q7GM1FttZbEygh/TgZmtU9LAp+nENCYV0PO4oDIaA2MvoSf3?=
 =?us-ascii?Q?ALPDoCpqxw=3D=3D?=
X-Exchange-RoutingPolicyChecked: wtFB/ceSrianfDPXPwHis1vXGkVlxxW4Z1vusjvSnVz+6E9bgcLEurZYH6LyPtysM28/5AvLD8PJuRZlZwFajUCX/R98mdSQwjQo7UasiagA5elAYF7+Sum/12rB3Zq3adu/bFHFf3kZeIKALWz3bCjwWsjG3QmoBFHapQXm56mykj5EGOugOP1G/skcZvHA5+WzBypu7i8uoow9Z2dojA/r6owA6d2H1NwQSkz46WzoTOAoE6p9Q86/OBA9lBIin0EklRtROWHkoQMvqCiyqagXfl0QfzxaXS3AHjWO+CSM0dVN83HFRnt66qUoTct95KD8sN0sIBE2Kr4EcnyXYg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c2e24ae-2e69-4e22-29ee-08df3ebc4026
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5095.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 23:50:36.2478 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OCLiiBmDzrJTwnfz3TALREnf9BKI4X+IVRPHf3B0MSgTrDdrUPAdovgvcNSRsJ8f1igiuR1Vhl2YhPEKBCNCHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7767
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Gustavo Sousa <gustavo.sousa@intel.com> writes:

> There is a new workaround, namely Wa_16031259911, to be added to the
> xe driver that applies to graphics IP versions 35.10 and 35.11.  The
> workaround is similar to existing ones that apply adjustments to
> RING_IDLEDLY.
>
> The current implementation can be improved though: adjust_idledly()
> can be cleaned up and refactored to make the code easier to follow
> sequentially as well as to add new workarounds (such as
> Wa_16031259911); the GuC ADS regset accounting has a subtle issue
> where the addition of RING_IDLEDLY is not accounted for.
>
> This series addresses those issues first and then adds the
> implementation of Wa_16031259911 as the final step.
>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
> Changes in v3:
> - Rebased on top of drm-tip to fix a conflict and resending for fresh
>   CI results. 
> - Link to v2: https://patch.msgid.link/20261030-wa_16031259911-v2-0-919fa1c27070@intel.com

Added MattA's r-b from v2 to the equivalent patch in v3 that was missing
a r-b and applied to drm-xe-next.

Thanks MattA and Bala for the reviews!

--
Gustavo Sousa

>
> Changes in v2:
> - Change idledly_units_ps and maxcnt_units_ps to u64 in adjust_idledly()
>   to avoid 32-bit multiplication overflow. (Sashiko, Matt)
> - Replace the call-site comment for adjust_idledly() with a comment at
>   the function definition instead of just dropping it. (Matt)
> - Link to v1: https://patch.msgid.link/20261023-wa_16031259911-v1-0-b0453f79c4e1@intel.com
>
> ---
> Gustavo Sousa (10):
>       drm/xe: Bail from adjust_idledly() if in VF mode
>       drm/xe: Sync Wa_16023105232 in xe_was to match OOB rule
>       drm/xe: Use picosecond as common unit in adjust_idledly()
>       drm/xe: Factor out {min,max}_idledly_ps in adjust_idledly()
>       drm/xe: Bail from adjust_idledly() if no applicable workaround
>       drm/xe: Drop early and redundant workaround checks in adjust_idledly()
>       drm/xe: Replace MAXCNT comment with a comment on adjust_idledly()
>       drm/xe/guc: Increment regset size for Wa_1607983814 inside hwe loop
>       drm/xe/guc: Increment regset size for RING_IDLEDLY workarounds
>       drm/xe: Implement Wa_16031259911
>
>  drivers/gpu/drm/xe/xe_guc_ads.c    |  16 ++--
>  drivers/gpu/drm/xe/xe_hw_engine.c  | 158 ++++++++++++++++++-------------------
>  drivers/gpu/drm/xe/xe_wa.c         |   5 +-
>  drivers/gpu/drm/xe/xe_wa_oob.rules |   6 +-
>  4 files changed, 93 insertions(+), 92 deletions(-)
> ---
> base-commit: be7a4fe8d1795219f7d033830ec4cf6e8ca1ecdb
> change-id: 20261021-wa_16031259911-3a83c69d8570
>
> Best regards,
> --  
> Gustavo Sousa <gustavo.sousa@intel.com>

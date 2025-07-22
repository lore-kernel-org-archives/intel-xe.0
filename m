Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC25CC83F1A
	for <intel-xe@archiver.kernel.org>; Tue, 22 Jul 2025 18:56:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91BA010E6F2;
	Tue, 22 Jul 2025 18:56:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l1I3K0Ga";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 203D710E6F2
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Jul 2025 18:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753210619; x=1784746619;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BgMxF+GT+jsxRPKPPrViOTBelFCyWagAO32hkarFLnU=;
 b=l1I3K0GaTHyx0UomDHbTz0OUvXpNPqOx/z8EKhvYoBVtH1l8wLsPAe1e
 vm627dg0ctaB+WgykuXtjcVMg0ewNvmeLHnaC0wJQfx9m6os246O/OKpX
 TTvZm5ItzNoa9mc760eQOzdnfL5ts1y8vSl+1RA39vVpT03YTgibeNXWT
 QQSSZDaT0YXQW7fqto5dbhhcj61GnEnGV92bl4DZz08xbnmg0OVdSRLp/
 SIlJ7C2OKUJcz+9WfQvtxOx6oYbIJAFwhAHCpvNwJDdO/jK0cVXBmE2C5
 +SpUhvVeIAEcdxzU3oYRZVVSXFUfHY945LCcRxU7jgBAdVVxmKiLZKSim Q==;
X-CSE-ConnectionGUID: i49wBk6xTROFg9NlQyqBqw==
X-CSE-MsgGUID: MPa1GpukTYWIXFzjlYOung==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="66048869"
X-IronPort-AV: E=Sophos;i="6.16,332,1744095600"; d="scan'208";a="66048869"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 11:56:51 -0700
X-CSE-ConnectionGUID: OGVhh9loQFiRDPYSgOWe8Q==
X-CSE-MsgGUID: 2K1sE4U7T/qHZ+7UIQRaTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,332,1744095600"; d="scan'208";a="158520105"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 11:56:51 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 22 Jul 2025 11:56:50 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 22 Jul 2025 11:56:50 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.60)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 22 Jul 2025 11:56:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DtLuzJLQjm5s6OdevayzbZNcPgZWOI39Ub/1yVw5MPAnRfA/NzEsZ2FJAOVJnXgkALmPRlgrTRs8XXZfcEpmY4DBo11QpmqNbNVHW9UyJJCtACdAGjqLE2aRi1NR9sjvgwusU05CuTFA/rHRKYENTsmIFft4TOiOKpwcbsYOH1TCnQeJ9dWd+yuowQZgUsEgkG96Lfin/2ifCKksguLJaECWcuQ8pHQqkpoA3uSDAkKhZTSZun76cYMJarPERNrNL8uPmWi/MHrhjlm+u5riz3Yvn5yoNkxXpCw1lmWNyRLnJKUJQ82u6bBqZ7rHaaHO5CpVm4nvGto5byljSwSvfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BgMxF+GT+jsxRPKPPrViOTBelFCyWagAO32hkarFLnU=;
 b=FP0PJvwO+OOTfGCQHLbFF/thu/94dJuy0G4+dlcLeOeIcyJ/9w4JGrI3512RKvgA3yBH6LzGKOJlKNhjkg3Me+MNaj7BwPrP4w9sAGUFNmjCCK7sq2R0etXYBKNFVLW71ME0SMwh3Sq1VoxtEwaJFqs4Fin7H0Nd1FL/L9bJs2VvJlWhXYmEE1i+rRyCniw+0aFl/rXdEnpXI8vpuC9hMQEsMQXISoo/PIfuLwtOlPH4hJGIe5DWBlo/XQz07l3b5lnQ68RQGhVBT5wvzlxUISVCjDm1DhJZs8coqwr0g4qF//1PN/faZ916vdPv3Zwvq15eXW0YeYH05dRg4wXOqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB5060.namprd11.prod.outlook.com (2603:10b6:303:93::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 18:56:48 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8943.029; Tue, 22 Jul 2025
 18:56:48 +0000
Date: Tue, 22 Jul 2025 15:56:42 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 4/4] drm/xe: Enable SR-IOV for TGL
Message-ID: <i3x7ahykzvt6ab6r34jthymxtli4niwyad7qbdedb3h5mu7m33@gwkb43mjslxv>
References: <20250722182618.30811-1-michal.wajdeczko@intel.com>
 <20250722182618.30811-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250722182618.30811-5-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY5PR20CA0010.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB5060:EE_
X-MS-Office365-Filtering-Correlation-Id: 80df0833-bbb1-4acd-9da8-08ddc9518258
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iPa8Og+fgulqOrRvHKialn1W9NAUUYowIfiztDVf8o0Ix8Eb3KzG30Go1g0u?=
 =?us-ascii?Q?JCEhCGAedKe0vj2Mtn78wkkPn1vIawBv7M0A4PJl2mgz8JgHJ+CIS9bUQnny?=
 =?us-ascii?Q?4AAFjIhOnGK3hsZumHsWgE8Br7KPTfi8IobyImS/7iXZu/4LzhJ/aKhwP4Zl?=
 =?us-ascii?Q?HDXI/WP/cBiDi6fqiKbTG16JZmXygz6/0K3gvJYfzsVskPG6ACR7Xe3PxXtn?=
 =?us-ascii?Q?tShEJE00fban5ie5pRiSZUJX9wHKzLFddXP6lbCnCdhkXuvJSHBGkEK8jQ/V?=
 =?us-ascii?Q?cHsyX/p7/GQRTv4jUYLxD5tNpyzZpb+I6M/sutpbu9qOY01JSn80izh1wlM5?=
 =?us-ascii?Q?dBoLIwPMtgbzhU/+dpRarQKeULpLcBne2oujafuNHxWvtILuiRTixXXzHd6Y?=
 =?us-ascii?Q?rKU9Dl+2XWETgY8D21Vbyh7NqCufCt6Bfi2v3LfcQYxCNMGQ3h7pte22p5qQ?=
 =?us-ascii?Q?/nnKQQP6spk+bSmkXVyhHt7BbIsjDb8UMnFU7cpcGC/yFZS0aunyNT36e9B5?=
 =?us-ascii?Q?SJDHH+2mIEvHCjqCEudv+2vzmRv/Zygj1ndj5ug5/g0JzVBKHIZnNn6KkZPr?=
 =?us-ascii?Q?TpzmcXBvhuImdAPPGFTl832ceCizcoJed4w+D/DwgPVncD/ghGjk1r6QI/Mj?=
 =?us-ascii?Q?clhirWYKd0Ojc5g4sdX/IKhp0zOdYEQhD2FVPevyt3TGgeemE/JLJCcPhn3k?=
 =?us-ascii?Q?WMp512ji7k4NVebrqugUXwKbv6zQL0o/s0XvAbavzm2zshY0PelJQ5f59zci?=
 =?us-ascii?Q?T0bUon4wJ0/GuM2wUHnoES180jauy54flkteXUS5NrD9fcWfUV9OixLyE9oT?=
 =?us-ascii?Q?LTNPoJpbH9RARDOWhO6QLeIMkIBXsB7tgNv85xxjekkGE+QfFCu1uVS/Fgqg?=
 =?us-ascii?Q?DSBrG5Qu88xboozxm+lFo1tVvbz6/HZfuun8clo9vzYwd4TWdUrhS0AB6kv6?=
 =?us-ascii?Q?1xWUj8AOOpSy9+POAXOF0y7z6dNv9iSW8WNsmdENnE8Xy46dG6BWXVKwhgra?=
 =?us-ascii?Q?CQjufRBeMNbFS0x3lca46ayQEGiqH4ozUrcSd5yxo6Q//s7mgCMVsDeymspB?=
 =?us-ascii?Q?iyB8vbsCmJrCD/w1SWmpZ13KTZArLsaw0n23fSD+pDnkcdKbDCrwA17wljzx?=
 =?us-ascii?Q?u+YGZDV5gfzf2tOEOINXyoMU8dksykAU2ivH8Ygexi5mSr946NrowQRugGqN?=
 =?us-ascii?Q?AcaDC9PlRml9UTpiW3zpiQuh00NCD3Py5WzGxuq7PRnHoTC1sSWR4SINP5mb?=
 =?us-ascii?Q?o2HHfSg5sYPgoebx+VNphWLvfIXaYLqn/+sUexF3CqcgE/DfiJZy6KTXaZAF?=
 =?us-ascii?Q?qIqUfoNOGZDgJn2494KY0lmpC68dbK0gGpCKVq9xNvAMIQrwbJIroqlUUpWJ?=
 =?us-ascii?Q?hbi1G+o5wO5juaE5QHZfY1wuSzEn6SsY6f4ouGho4JTmOM827q3AKNfv+xtn?=
 =?us-ascii?Q?jGP+AMYrxDQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GCW8KWfxjYemrdZAYhYTwllabmS7l9WIqfl6dGbzMrFtJaLmMpKQn5FFFMU0?=
 =?us-ascii?Q?yFnOdJBKEKzfVfEIHPasKzr0INcyTN3QOGcth5i956bsELVaFkNrY5NQmCVj?=
 =?us-ascii?Q?wgGhRKt9WA4W0wjJ98j85PRduG0sUl8TrxzfADwqn/sl2a8WlLCFBo1D3n70?=
 =?us-ascii?Q?FWhrYaOqYT60bQ8ZW5uPnCsFJdxRh2JGyIj1lojLV2AKpcfau7h27TNTYZPf?=
 =?us-ascii?Q?bNiAfG+ZDD9YvPHZ5rrWclXenVZdwcnAryK1NEzGbXF8jKBriwXMpjfFtdQo?=
 =?us-ascii?Q?+C471ti5OXfoz/x9FR2Xo+5KJFHUYnB/TG3IExbdWMk5e10ycwki9W6aYOoy?=
 =?us-ascii?Q?1HdC0iL0y2rSN0uDpmPN7ilWIY5vLvyo/pMMxkNYtq7k4R35qPBQ898g77d7?=
 =?us-ascii?Q?+gTE5umaTKIPnGE1IwTXH5Ef0/KbDQWDtNqpswjTCenELlrczpm1IG3DzJiJ?=
 =?us-ascii?Q?1p402EbhB+9ZniRKezDO7pUSHahQsElCAhEjG2i3RiJQo57PHBnDN8O46KJ2?=
 =?us-ascii?Q?B6LWzXEpnqBe5IC2+J3/gQMBEMEuqjHiSqIRywqiJTxt20ONyYYkYFH8jasM?=
 =?us-ascii?Q?OFI/R9DVQ5EEybEZke/hxYY1RPwUHCfRPq5zR6Cvk6ciQT3p7dPSeKuHUkY5?=
 =?us-ascii?Q?xAkrrNpmuVwnBqTreePRoza7bsOz/HYeFyM+l7sAAeBO0J+q9W87n+s1xp5Z?=
 =?us-ascii?Q?UYUmEC6+LBhoyHklyBsPPciuGvMyQUG7HsKFWgXUlg7AoZJVZH3v1CaGqkFw?=
 =?us-ascii?Q?rmp0cN9Kb3V/oEDHXStIwGXNlCxgvhiB4TYOhssoPVMRBz4t8a7jq454teqI?=
 =?us-ascii?Q?1oLhag2p9Te0YVIvh1z1TSR8S76q+ESBVfwfuJAGkhMpsl9TJwo3xFdiSxCV?=
 =?us-ascii?Q?1Dj0oSmw3FZdUfjvFffv9CiGWtuyGLsMqL/kC4ebf/FrIQOrVTPBlnBp4hCl?=
 =?us-ascii?Q?XWr5WONG+Tw7Utc8HuV9ww6RiRmB/hpoxAB3Iua7HP5Zcu9H8x26PR8kT+2n?=
 =?us-ascii?Q?3h2Jxsseh9mAvuKWJ1z6445OV8Mv7xVAPuVZ/QQ1Y0zIq3HBsW26dlo8esv/?=
 =?us-ascii?Q?UL5JpqbLPPM1LmcSW1VkuSM3NV9BrkX5i/P5GhiowqQ6WBE4OBzFoj9rO1Qc?=
 =?us-ascii?Q?CBa1g78GHmxMV6zOs8pPIAAE3Zf+mXjYayC/29QW0Wk9QLwpZLwpfJ3AIiV4?=
 =?us-ascii?Q?k4uNxJ6ZFgcratpJ7Q7iNSqnBfdTW5r9rrCsmGMaM//FOKQWXTlx/KPndhPi?=
 =?us-ascii?Q?wV9Z2sgjJdztT47SzrpkPTUXVTzvv359CWxKoIL2RdsL3kDTbV5tztPFqt86?=
 =?us-ascii?Q?8mtJSZg5kjnWxe0FoXdhAkNA+L+265OQUI8doE/PwJ+DRxPhodrbKBJXA/bv?=
 =?us-ascii?Q?uf4GE+VVGwTJZnfadwQQKSrRKamNwXdaC0bf0+20T+hOGE3jeq5BbZCNAKh5?=
 =?us-ascii?Q?fXbtPKkLa0zJ2NofsY1sZec1SlBPT43Gw5cN6KP7pAecrkPqqgsvRESGzaF2?=
 =?us-ascii?Q?qAJnRAtNVmBpdb0Vaa5lDD1K7qeaFaiTli6db1Z7HlgPNBqstxFcIcvJWNu0?=
 =?us-ascii?Q?GMv1Xb6/uVtlTtwyh/EB6qQYTA6QnRhEEPbGo95KlaML8LwWrRMtW8QQak4b?=
 =?us-ascii?Q?fA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 80df0833-bbb1-4acd-9da8-08ddc9518258
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 18:56:47.9704 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BtaOEhsgvu7UaEzd/8oXBH5kNtFs2XbU1gvkE4zBlwyMAPLP4IoRrzUzheS/OPgeY2gWGyh58DiBNDbLGR4sJ2BJneyJMXleVGAtkIncimM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5060
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

On Tue, Jul 22, 2025 at 08:26:18PM +0200, Michal Wajdeczko wrote:
>While we don't have official CI SR-IOV coverage for the Tigerlake
>platforms, we were using this platform for the feature enabling
>and Xe driver already has all required changes to support it.
>
>Since TGL platforms are guarded by the xe.require_force_probe flag
>enable SR-IOV feature on them, like we recently did for ADL/ATSM.
>
>Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96378CFD2F9
	for <intel-xe@archiver.kernel.org>; Sat, 22 Nov 2025 21:55:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4293F10E011;
	Sat, 22 Nov 2025 21:55:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FbGk4N3o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4769410E011
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Nov 2025 21:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763848549; x=1795384549;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=zMbX0wsNkodfczlOr7Por/9uXyvo+X8nqCCWDnm6nxA=;
 b=FbGk4N3oyZk7DuW2+kfTG6XLCohXNai5zJE9mbv7/CdjHSzohgdxWNX/
 NGOUfTY45RkbuYVlo/PbA256UMDOnL2ohBTjC4QBO4y6V26jGj3LtHAVy
 O/Gz00QIpdmoG16N6R/JhdNuMzamb0erPGO0syKxA3sRBIqilDz79BpDu
 Oz5XAw2FixSkWNBy9m4HERzt0qXPv/DUtd19cW9++rkXUWwd0kNLafkea
 BhA5Rx9W8oc7MiE/L6l6rS2pD+q/13Ddso7AEkWVwaPnvYTecADFkeZtU
 BVsAS1mdvE2YPpzDaE27o+Fu5AquDn1MgWtPRk12/y7zbXUOCY4f0iPIY A==;
X-CSE-ConnectionGUID: E+xq7tQdQy+PTwSJwNkxDw==
X-CSE-MsgGUID: TWwWQAkaQAG4+9HEs9DD5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="77266889"
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; d="scan'208";a="77266889"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2025 13:55:49 -0800
X-CSE-ConnectionGUID: tYTh2sQbT02r61PjGDnXFg==
X-CSE-MsgGUID: ukB6SQqBQkClr/UtF4o1Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; d="scan'208";a="192766112"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2025 13:55:49 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 22 Nov 2025 13:55:48 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 22 Nov 2025 13:55:48 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.12) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 22 Nov 2025 13:55:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NbUfOCmzXyJM+h6e/79x1isetBeZaTlGeh4NvT7+ifFGHIxaA1g/nsY9mWr3FJBzAjm1SqrBAV00hI/EbrkFXaEhJ+Qw7hcGHkyWtmDnpkVGZSw6zhyLwDS3PWsHarclWnN2aDJqE/TIc0w9FMXamii0+Zcq9Qhs4OI2n4zaRemQuMpfNFJBw9Y0GBSsF57y01C4bUeR7rFnPyNMwCTeWiKH7pSA2+O7eu6yGLfuSyX53yTyCIMtRqEMdYaWFtaemgDEkuwxYhfIxFg83GwLc+r6wLxPNck5rwJlTFdNdsAoSr30Kjh3/EucbEc3BslyZCZcYCkFdp302Taznz0grw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9mJvckPnXoLyhClzV9XV8uOCUJVPenMN1wQvdiruAU4=;
 b=AXnRsDGFWKBUAQUNxgtYMJH9GTEceGUqBHU4oARiObXLO5yRYhPX6Tl8iwgZH00QgZ7nOkEjmPurvaSjyPhK6zzIQnDlDy84wKnBRNCYwdXPVN1Ma8YqE4OsngI8alZAaaEiftm00gBx3U9h6S+vWd4ae3SeTRGEULdgYLufXvrVTnIa02CsBoAHhWPpr12glRAhV2C2GMWPG0mLcQa7oOLu/53mOqzALvPocIdx98e35oS24icLhF+aVbF/bpcGHT5efbYtIjVbZyPIysYDbbVmVp0vhpdBpSRp2Q28sHwa4EEH1EmxSs/9/KZ3o2lidval3DEI62fs3e/NiWTyDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA4PR11MB8889.namprd11.prod.outlook.com (2603:10b6:208:565::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.12; Sat, 22 Nov
 2025 21:55:46 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9343.011; Sat, 22 Nov 2025
 21:55:46 +0000
Date: Sat, 22 Nov 2025 13:55:44 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v4 2/5] drm/xe: Merge adjacent default-attribute VMAs
 during garbage collection
Message-ID: <aSIxYK1AAgE0atwb@lstrano-desk.jf.intel.com>
References: <20251103060957.957760-1-himal.prasad.ghimiray@intel.com>
 <20251103060957.957760-3-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251103060957.957760-3-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR03CA0030.namprd03.prod.outlook.com
 (2603:10b6:303:8f::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA4PR11MB8889:EE_
X-MS-Office365-Filtering-Correlation-Id: b2a911d6-01f7-4adc-cfdc-08de2a11e410
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?nx9pWGDRxQ+SflpDkiJ3KiJag0iCD+vRaTU795VQvL3BoZtj1pF72mpTON?=
 =?iso-8859-1?Q?OLQ80BX6mFYmdttSGDpDBPN0hep0fGOuzL2AB6r206te7SAK77DbiyTwP9?=
 =?iso-8859-1?Q?2Jji0qSmhY02QVUi8whDyBI39hXU2Cl+rAW02/vVaKSglpOl7gMon5kzwV?=
 =?iso-8859-1?Q?nX9C64Qk7+z3wIcKed5aamGMjOufwgZ97MQQ/t4fT1P5SqdwDAkgLolxuo?=
 =?iso-8859-1?Q?z7tI11/SB1OE3LnDiq2OhVHNvwqIEAF7rObO0Pda7Arpiwb9QITVlr0KQs?=
 =?iso-8859-1?Q?dGMqLaKCsUFma+ab1KO46N64D60oW75JSyqM470S9SC/cSjR7G+WiCFefO?=
 =?iso-8859-1?Q?frv3Lr8ICRfb2yF0SOEWkra33Wk2NisNXuisfgG09AgQzE4Al43jYPEXgB?=
 =?iso-8859-1?Q?Nfx2Cvu6ancmU71GF4xxLE594oKIEYoKs+PYbSURzyzu5LefLHRmFGM8tX?=
 =?iso-8859-1?Q?LpFmcZHyZFLSGqOczR3CBgZjHwDH/8klKl+fD/nUEwgeFZ5St0VGe4Nsni?=
 =?iso-8859-1?Q?QiQKqDBX7gx/iOvlIdh9MKcjidR1ModIYHqa9qnf3SOOylKyX6owNByTJA?=
 =?iso-8859-1?Q?sKfcz1THrST7L5Gml+ypcHw98XZr6BhClPzsGFEDkyLW+XtBrC37YFidC0?=
 =?iso-8859-1?Q?BbimYhL+TQByGtn95+uIoRxkC0nI6nNNUikiCPp0WxkmEgP58Z/QnN+2cE?=
 =?iso-8859-1?Q?BpQZvHpn4fwNAH/StufPvTOZLIpXeqm09pP8w4ASIb6lqDbTu7xJa64KMN?=
 =?iso-8859-1?Q?Bh58Vpu/zaxCz6almbGdvmyRTGmUotsQiroTA3IxyzQGlLpcQx8F07mA9t?=
 =?iso-8859-1?Q?pmwoVyFqVky7aeemuQ6QEJqSBreYnafYKLcawA3fziEuoC16Bl9CMJbQMF?=
 =?iso-8859-1?Q?HPVJ1+nAVrW+PcqmdYn86ScNI35Uib+qfwsSdakGf3m1ed0IcnrkFVutc+?=
 =?iso-8859-1?Q?9qRgYEdSSAm7qdQpaYhaGux2EXxtBITOgob3tzMBBGjgmRj2PtVDZP1l7q?=
 =?iso-8859-1?Q?VRlj5BpCyOiEzVQXeKD/MXWuylgHC0M7o/q0hUI4FiyjhNStueoT8KzTE2?=
 =?iso-8859-1?Q?wuEhXYZX6t5ns4ZWax3FB2msas475qevtjLI9S6o5tZtgeui2CwagCCZ2l?=
 =?iso-8859-1?Q?hv0K9IPcHf5QElKPMEbWwdwjSyVqWEYABj0Excnc2h58QuLCgNSKZw1+ZL?=
 =?iso-8859-1?Q?z0uPrAM9By9ujVarwuD6+f/l8jV+ZLm/ciifWGBDlwntK78fkFUf7uhBH+?=
 =?iso-8859-1?Q?ogMyTvYVNWPYqJwvxu5SK9c4nLjpVbac3K1I9UBfKuBAhcY1j0vchYkmos?=
 =?iso-8859-1?Q?zrTS8W8AWH2ER5oeIKq9UIz6bF6zXpHxcyIkb+BN1FxM3HCS4BcUoxphCF?=
 =?iso-8859-1?Q?Xf+IsiPxS2X7cOlmorlldtItrRBig5G/byYe86CXHG1A4MuJxg76VyMoZE?=
 =?iso-8859-1?Q?42WzIe4ucul5/iFT6efoviUZ9DVQx3xMDturSuLF/geo8HACfl9KhSlHIJ?=
 =?iso-8859-1?Q?QAvoCd3haR2vcLgLbWrh/5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Nc/CXRsKvBUwMziRda4WpRvLNkXe51cipDWwFUgETW4c51FQKwxXcAwuD8?=
 =?iso-8859-1?Q?pNqwtv6vqVyQORoa7FWnmsVt4TIFfITcsjNNKIYMCqpUHY6bfWui+UcDnF?=
 =?iso-8859-1?Q?nGI1kS5aujUZNDhZFRDZPwsAtJwrhvDULxfaIuUzOpJ8c2ij4Wlv2iNJ7S?=
 =?iso-8859-1?Q?xbk6cZrcLkafsbol/Arla+DdcIQJ90v+zGin3r8G+szQloVhEMqtXTlQGi?=
 =?iso-8859-1?Q?Uk8BVeJQ8G8RbNYb919zpuYBOxQ6ZnY3XZha/u6Qpdu6k4HEhdv65va4IR?=
 =?iso-8859-1?Q?XYpbMaa54dpPocDUh35+00Oiw1/FsHNoJbtDUeloe5qO3OJiX6+B7HJzou?=
 =?iso-8859-1?Q?QHnxcXNpMiz3xYEFZkg4kyDKrtvYk8CK2H73nvsYVWJJn4xHFLmsACTlTs?=
 =?iso-8859-1?Q?Em3uLtD92pT15LR+Q9nfi3L57W6lon0lamXUxYv9QLta3M01NFmkM/Nnjg?=
 =?iso-8859-1?Q?bQCFL3lQQ+nEdjYeHPrUq7/+W64g5puRBbhYsDuk4wrGyZxuTFz1YrXxjl?=
 =?iso-8859-1?Q?EgvElAgTC+DG8390ePXTUMnmhK5l7wYKx6izYQuFpmW8/wipgesMRkTvBQ?=
 =?iso-8859-1?Q?s7hXQ6m1+dr/VqpDeLYBmtSeAlRr+GIKAhzGODDEmwE4mkZq7C71YFeYQl?=
 =?iso-8859-1?Q?IpZp/kAYO9dO/hv1ULAFLtRpvCyKIkSizil6DyXLm+LHSgBvmMx9iVIDfb?=
 =?iso-8859-1?Q?UIeE3UGBlpGpbhF0QzGnC4GJD861qMX2gWBYHT9SgV3KNFro/Wcjdn7INd?=
 =?iso-8859-1?Q?G3pt83Nj5iT24YJE9KK2V/DsbrEZtTCYOVA60KzcP9ksFrN5NnplHnKxrG?=
 =?iso-8859-1?Q?kjbegwdJA6koYiW3UJNf5e+cLqcfW5KaBpOTuH+Xj5nCVNYOtB3kZHwn4Q?=
 =?iso-8859-1?Q?223Juwl5AcQEWdHyekZvDSD6jDh5rPYLvBBT72sUpCr0vhoKhehZ3sHkAK?=
 =?iso-8859-1?Q?x0fAvQ1zsdYAMczTgNL7zUEVd88NrkKdMCGmykMAzw8yFWVivxF7TsjlOv?=
 =?iso-8859-1?Q?JKCgAou+u5cwDifbNRSI/F4bmJgSmmLeuKHgCf1iCNXfAhYvAfeXV3WLl+?=
 =?iso-8859-1?Q?omrQNubo/SacjFCcoiy/tOvYB8ypOHmn10+eRBzruh+pUgkaY0iQupkk67?=
 =?iso-8859-1?Q?/xT9lGOTZF7cZ1v9Fmkr54zDDh86LSw0yjkKJ5DXuw4Dn4wUk+/UsFjiEj?=
 =?iso-8859-1?Q?eli7JSRnnujDvBC0Ebo1agYoULn/WAC6tGWz5Jvj2WwdM+ZyEWConucPBd?=
 =?iso-8859-1?Q?voD97t6V63pmArGQ9ByoS4q1uUCh+ZtDPS1DN56lkJ6gWb82SAxZ8Sb1Xy?=
 =?iso-8859-1?Q?60NS8pZ2qHRcoy2ZQcwLrNj9vv7Rmnj2Ins1CONnzDuxmYxBNdH5KQunJi?=
 =?iso-8859-1?Q?Nz2cRzKv5HQL82y4VLDDvMpcdyP2/ExWU9CT8fWnjmceCbAxXFLVeZsa1N?=
 =?iso-8859-1?Q?kk11wZC9O9XPksXAtiPOf+/EwG1lhhdlJfddxjfwfCT8HTQxa+8N8It2N9?=
 =?iso-8859-1?Q?FYcHgaad1AFeKi8zWB2yMNbVhiRAR5gUphsuMJBK0iTAelrE8aULQd+MjV?=
 =?iso-8859-1?Q?XpjK4R8Kq3aNcfY71HYElHrGR/ZvjULQkSSjzAhfcJGZyInysjok0CI+6S?=
 =?iso-8859-1?Q?7moCOyqO5KgfstcMqXVF78L+yCptddZsW/2PxvaVuNdTg2n4T8fogA+g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b2a911d6-01f7-4adc-cfdc-08de2a11e410
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2025 21:55:46.3828 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bvpzSHHRWTMarDO5p5xz3yA62pt1gLi9waOBSO2AgEt4UiC5+SjYXQ+Co8SEJcdk+hubkTr1xqkTrzzwGDHwNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8889
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

On Mon, Nov 03, 2025 at 11:39:54AM +0530, Himal Prasad Ghimiray wrote:
> While restoring default memory attributes for VMAs during garbage
> collection, extend the target range by checking neighboring VMAs. If
> adjacent VMAs are CPU-address-mirrored and have default attributes,
> include them in the mergeable range to reduce fragmentation and improve
> VMA reuse.
> 
> v2
> -Rebase
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_svm.c | 62 +++++++++++++++++++++----------------
>  1 file changed, 36 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 13af589715a7..585e3eccc876 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -286,19 +286,21 @@ static int __xe_svm_garbage_collector(struct xe_vm *vm,
>  	return 0;
>  }
>  
> -static int xe_svm_range_set_default_attr(struct xe_vm *vm, u64 range_start, u64 range_end)
> +static void xe_vma_set_default_attributes(struct xe_vma *vma)
> +{
> +	vma->attr.preferred_loc.devmem_fd = DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE;
> +	vma->attr.preferred_loc.migration_policy = DRM_XE_MIGRATE_ALL_PAGES;
> +	vma->attr.pat_index = vma->attr.default_pat_index;
> +	vma->attr.atomic_access = DRM_XE_ATOMIC_UNDEFINED;
> +}
> +
> +static int xe_svm_range_set_default_attr(struct xe_vm *vm, u64 start, u64 end)
>  {
>  	struct xe_vma *vma;
> -	struct xe_vma_mem_attr default_attr = {
> -		.preferred_loc = {
> -			.devmem_fd = DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE,
> -			.migration_policy = DRM_XE_MIGRATE_ALL_PAGES,
> -		},
> -		.atomic_access = DRM_XE_ATOMIC_UNDEFINED,
> -	};
> -	int err = 0;
> +	bool has_default_attr;
> +	int err;
>  
> -	vma = xe_vm_find_vma_by_addr(vm, range_start);
> +	vma = xe_vm_find_vma_by_addr(vm, start);
>  	if (!vma)
>  		return -EINVAL;
>  
> @@ -307,25 +309,33 @@ static int xe_svm_range_set_default_attr(struct xe_vm *vm, u64 range_start, u64
>  		return 0;
>  	}
>  
> -	if (xe_vma_has_default_mem_attrs(vma))
> -		return 0;
> -
>  	vm_dbg(&vm->xe->drm, "Existing VMA start=0x%016llx, vma_end=0x%016llx",
>  	       xe_vma_start(vma), xe_vma_end(vma));
>  
> -	if (xe_vma_start(vma) == range_start && xe_vma_end(vma) == range_end) {
> -		default_attr.pat_index = vma->attr.default_pat_index;
> -		default_attr.default_pat_index  = vma->attr.default_pat_index;
> -		vma->attr = default_attr;
> -	} else {
> -		vm_dbg(&vm->xe->drm, "Split VMA start=0x%016llx, vma_end=0x%016llx",
> -		       range_start, range_end);
> -		err = xe_vm_alloc_cpu_addr_mirror_vma(vm, range_start, range_end - range_start);
> -		if (err) {
> -			drm_warn(&vm->xe->drm, "VMA SPLIT failed: %pe\n", ERR_PTR(err));
> -			xe_vm_kill(vm, true);
> -			return err;
> -		}
> +	has_default_attr = xe_vma_has_default_mem_attrs(vma);
> +
> +	if (has_default_attr) {
> +		if (xe_svm_has_mapping(vm, xe_vma_start(vma), xe_vma_end(vma)))
> +			return 0;

Like patch 1, I'm confused why it matter if SVM ranges are still mapped
here? Maybe I'm missing something? 

Matt

> +
> +		start = xe_vma_start(vma);
> +		end = xe_vma_end(vma);
> +	} else if (xe_vma_start(vma) == start && xe_vma_end(vma) == end) {
> +		xe_vma_set_default_attributes(vma);
> +	}
> +
> +	xe_vm_find_cpu_addr_mirror_vma_range(vm, &start, &end);
> +
> +	if (xe_vma_start(vma) == start && xe_vma_end(vma) == end && has_default_attr)
> +		return 0;
> +
> +	vm_dbg(&vm->xe->drm, "New VMA start=0x%016llx, vma_end=0x%016llx",  start, end);
> +
> +	err = xe_vm_alloc_cpu_addr_mirror_vma(vm, start, end - start);
> +	if (err) {
> +		drm_warn(&vm->xe->drm, "New VMA MAP failed: %pe\n", ERR_PTR(err));
> +		xe_vm_kill(vm, true);
> +		return err;
>  	}
>  
>  	/*
> -- 
> 2.34.1
> 

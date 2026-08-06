Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F7D3C56205
	for <intel-xe@archiver.kernel.org>; Thu,  6 Aug 2026 17:24:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE3B610E360;
	Thu,  6 Aug 2026 17:23:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cRTorpeT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F3F610E360
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Aug 2026 17:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786037038; x=1817573038;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RzdBta5dD29846FHY2GJHdm/6c1i2at3O4c6wAcNbXE=;
 b=cRTorpeTO+AGR3e778iWyKrqQtO58l+wu3v6Xium0B9a75uCa+DZTged
 7Jxba+lnmAyTfYuJe3BrgJUeUOPaiLwn1euUvjnVE3nVHlGnOOv4E6iBI
 rx1PACHxLy6qpWHhGnuBlxjz4wsyIVeRY6oG6P6rEujHuAYICU4mOBRAe
 PBUGYB7hCZ06AmKPAmgzlapijQsymJMS5ORSXtHebWj1MMliBe3Ziwz1k
 oH9mUZ0engbgJ9Ccxbv2SUXKKpPtPr77rKzdhSDygufSe9HQ8D+zEFOIo
 YWs1L4W8gk8YTf9ypOWxhHnZAUKNgAUrAg7QHRXfsoOfUvMNmEZO8+w8u A==;
X-CSE-ConnectionGUID: hWUzA2niRF6STWc+UgTYmg==
X-CSE-MsgGUID: uiXkVzomQc+6I6vnhP0Q+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="96993061"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="96993061"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 10:23:57 -0700
X-CSE-ConnectionGUID: ky1B0agvRuebbucoycAyjw==
X-CSE-MsgGUID: cA7ImDsOS1mAlF8iGKIMCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="285536631"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 10:23:57 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 6 Aug 2026 10:23:56 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 6 Aug 2026 10:23:56 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.10) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 6 Aug 2026 10:23:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w1jnTAuFTTgVUaPq9teKaNFLdpBFx5a6/lCMUVhVK0wZgsIP5GXwSM36r1Odyk2xmNKyKWQZc/RuMFNuXDwySwLzYbc21kbOuPESC65dKLS2x0GZbMQYx3/AnhimxWYgE386HNK301/puUo2rvHYZox2bj4r0Yf4X/Y6acgNL7iCG8fUqREo/8R2DOd1UjYh8ZOQZvxpsJF3DdsrKB4KMZNakj7liknc+kyTuYkWP1KfNDpclNiLtG3CyfVJMAxm8BsWTR31VHO0akQRyG/HCZCIawfDqS+f/zA6SUX8/P7bHmQN4XACor2fPkgIgEuxhXdMKC/XCy8ZhCYStBbTrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b+ql+XgAT0PCroD6QbChYOgNDaT7WQhIKOEP8j057gA=;
 b=AHy9tBMUBeTNuB9qkDmiwQuA8YuDB50pgXjjgsUekEXhE9DAqgmo6sfql0abKtLPwlF9gS5VgUrcnVJOdpZGKVQJgjYW5p/1RTB/KPqzQ2uldhOVdhqyN7dJMB21F5/whrh/v/fpG7ManGzU3tc1GvYcqt/FMXOwp+9RFx62b7/2CjvvSFZZOcEs5exL2xxGAXoNjdXFnXG/G+HMd/UzQmrW1MpH40EUg44esxHVHz5t6zNgGSY7MZirTtrt2iZ1EQLoTttc1QMEFH5UomdOdx7ZnIwcgkWbKglzcNFYAEbq2evUM3V+dy9zbUF4YDyTVicb18/JKO1iwXpU916n5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by IA1PR11MB8198.namprd11.prod.outlook.com (2603:10b6:208:453::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Thu, 6 Aug
 2026 17:23:54 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%7]) with mapi id 15.21.0292.013; Thu, 6 Aug 2026
 17:23:53 +0000
Date: Thu, 6 Aug 2026 13:23:49 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>, <michael.j.ruhl@intel.com>
Subject: Re: [PATCH] drm/xe/xe_debugfs: Expose G-State and PCIe link state
 debugfs for CRI
Message-ID: <anTDJb2uaydZzxD_@intel.com>
References: <20260805102226.1764-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260805102226.1764-1-karthik.poosa@intel.com>
X-ClientProxiedBy: SJ0PR05CA0064.namprd05.prod.outlook.com
 (2603:10b6:a03:332::9) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|IA1PR11MB8198:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c580559-bcf4-4005-94d8-08def3df7d0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|22082099003|18002099003|11063799006|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: h+GaMhkj4APtOorXbFijybd+8IDBQG4I5O1/XVjHOSnRLitBQnbudEkc3PBAkMa4CnuO1mKaqV+s7FMuza3ZWdyjO2jI92hDodvVa35XU7GRYEy/M02AHwfHAZ1C6F4u69ohNnL9184t585Glp3HN0whj0VjcEFqWST0OvoUc0UZC/j9+LjCzLYLqR1OoHiCtHgmMzkJr+OVLp+VtIOYQ6phjDuG7IwReJkQcf1MEnQFR/viZ0R5YdHTrW8p1UIdzuLO/rlUXA+P67MlykiruhF2OyHDSuqUk0jZ4pNW/eG4iYcXjHzdfmqZnJ6zFzKf0YPa8GmB03+OtKWCc4CK7KX91CKF0CZyu/n4UCGbSRnLhq93ftL4ld9SBb8iZziYEBQXV7Z7dUDp+dFf32Z3FpY7+TB+Qv0KWR+bI74E4h/Aeuqh6DXwEQwFNIYYZEO4wExbOsbuZngZvoJMXl1BoHIxLNGDp7twP7Z1IsQQKDXkLID2ou4BEdxMrLbN8qXATS5xPJzYNORGfgwx7nCHXbqf0sDyuxmx/sPQTSdiDZlgcS/3oaNv64N0tJgwMvnghg+4ale74hDgWFA+0rOAh1MA64umaAtu5cbeSeV/nm8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006)(6133799003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eBs2ruBojRcpwgO4sWrt2oqxDhE37O5KlZNgW0zDi9Ee3oPKiAiinPYyDQDc?=
 =?us-ascii?Q?VzugbhZKe5/t3blJY67+wSJ0sGH91CO+b/PXy/9oQYVJ8Lr/0nUUOQdS5zVN?=
 =?us-ascii?Q?S45hhT9IkQDlxYRe18nL2aD6GIFsAujidBtVDy7Z/SA/ab+M3RrkB4EBYWtf?=
 =?us-ascii?Q?osj2Sfi3SVPQUkLt+lfPk6NYbJcoGgin/Mc5uGeLacZJo7tkcycinz2DDBob?=
 =?us-ascii?Q?iA+mVa3OxDDiEVjMuArQBAyUeH2O95EKtv8F6vmIXcXVmKUHMh58g7Hp2/Gm?=
 =?us-ascii?Q?z6i/iOR80VSsg7QJ2hs0g6ETq7CMA2BKLCx+GlP18a4B6Spl61jEGUGM/evl?=
 =?us-ascii?Q?tpMjiUfRSxgaLaYTz9kFlHTMpxqv88tH/wyPvf3ZERhZjlbM/4zeF69Tz4/3?=
 =?us-ascii?Q?+ZX/02n6+Lbf//nC8Jy+XQrIrQzbBbM7c8nU8BjK63FnnmUYZh4H5uUqqobh?=
 =?us-ascii?Q?sW5QjkbIxoDjCtxJGmmGerZuguoIphm28OhSO/v/NBOfpiLHh27EbDpLAPmJ?=
 =?us-ascii?Q?MO+MOzwDDNXI9ClJaXTcFqqpy0FdOdD06SP2306U2PU5ZN7YVoUwlOSAtYc6?=
 =?us-ascii?Q?RwuW1GnDITaLDWtdzTqpbkwEN935tQuLBVQv0kooMoHXlyaLlpBBQIxaG1U+?=
 =?us-ascii?Q?5hFOFvyUIbjY0W5NGqjXxFatJq7FMR/oCjL+8PTf3qtaTv//dCK3yLz0GF58?=
 =?us-ascii?Q?w1vOmAzTiOVGHHEUzJpgupMwLTSSyA/SxE/3jsMzqUrbb7DWkp5KaaDzWwFc?=
 =?us-ascii?Q?qeTM513N3WJyr6Akx4hHrtPP/dXpKdi5FqgdZQD+HEV+i0vsaNVwD1Rm0Aj7?=
 =?us-ascii?Q?ek9c5x6U6P+GHxeP4jPP3GiAeMwoy/zhs8CVzzigl9rJLNc9UxiMx1dycoE0?=
 =?us-ascii?Q?s2UfnY4RXOUmoFbHlpbiMHPFspMR+lnSj2Y5/DEfkm0q3eXJCvekyw2yvO57?=
 =?us-ascii?Q?bppO59tRrUP2+hlHdlRIgttZPKSWtKRdi/TbLKHCYzM2kD/P9lDCeIN0V6Ls?=
 =?us-ascii?Q?15P7VG7KImTsIwBDlZHmwwpRApcuKAqbqP6XOAVLhl11QqeAQStsJTEpqP52?=
 =?us-ascii?Q?vEMBqxDEKKugpP2/NKxVwbDUVKLpF+JDlD+0/SYKT1H43cHHiEA+n/OiLShR?=
 =?us-ascii?Q?+KnAOawhy0DceZYzd4Bz2+ceLh+Hu363TZZ0bDulN1ZnyAOmD4Zqt+ELdfQ/?=
 =?us-ascii?Q?WNz3L0qRVr2PWQymO3j3jv35J3BgflgQJbR4Ran6g2eLjDaMP9jW5+hli8l9?=
 =?us-ascii?Q?LF7/724Af8eDgi6V0Z1omFUt37riPR2ndhAxKEScVBN7LaTG1ouK9Qr0zwei?=
 =?us-ascii?Q?nWUBkENxy36aLBI6BOTuI++AE7RR/dGzMKQQhinLv7k/dNFawDCVoLLtkdFP?=
 =?us-ascii?Q?cuI5ASc1eWXRP9tQGYV8abgcTdZhS7MxQSVPXdaOYYKduA/DIL7yQIjhICvZ?=
 =?us-ascii?Q?Bf6OS1XtoMgGfACwtkz6w90PQJ9fr39iL7HqzUDTFk9wJH28TN+EWLmGYINf?=
 =?us-ascii?Q?CVANJ79c/eEYU4rptDjUPbJpgmklybl6t2CR7/W2nUvVrKZVmjarLCZgQfYw?=
 =?us-ascii?Q?sgnOl3X//z111H3jyxVxihWmkGbfEVLewFBwd46sPiKv1kuWw5nuzy8zHBzS?=
 =?us-ascii?Q?Th9MPPGclQlbE2zr9uXYVNeKgdER5BOsETaSPDSDUoVOnZRdhDfeqv0UCIDa?=
 =?us-ascii?Q?bEmiV9T0FWyAaTFFh8GPEWT4IBGMmNhLBHVE+EWWETLLpzLfcE5QhWQLPhtC?=
 =?us-ascii?Q?uRZCjVs+yQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: oqlE8YWH/qzy5TP8MlNYIgSLA0Zm79FmN8r+jwItTbwIEFPNR49Hr6SdNC5lJj8QPyGfPBM26VNI+WOOo4z4MMAfewtHuCGASSUHO4mxzzGrEaTR6B13WZRr4KeqaO5amAIvK0qQidKmO1jo2SIfDqT1K1jV1cNdJb0la4aNIyleKiiDP09CYVYZuM7bTNf+aXkNQsn8X9oBtTS2ECg9L+rd6XIQjmi9WgojuUeed5xPrLQucdTKCo0/foPiPDXXr71RyVaWJaOyMiM3IGplt0qzXzkBa9Acp4bNvUri7tJVKEJ4YTB3263TzJWNZlNQ398BExQHYKHMpBgMz0ho/g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c580559-bcf4-4005-94d8-08def3df7d0f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 17:23:53.7381 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /RtT8P7AFir3ENV7Ui6uoM/fFoI1loU4xqt4V3mfEHWLR+yEypE0eib87Y8u6l1Uql2lCDCvmjzXTWw/V/RfQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8198
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

On Wed, Aug 05, 2026 at 03:52:26PM +0530, Karthik Poosa wrote:
> Expose G-State and PCIe link state through debugfs for CRI. The PMT
> offsets for these metrics are identical to those used on BMG, so
> remove the BMG_ prefix from the corresponding offset macros to make
> them platform-agnostic.
> 
> Also enable these debugfs support on all dGPU platforms from BMG onward.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_pmt.h | 20 ++++++++++----------
>  drivers/gpu/drm/xe/xe_debugfs.c  | 20 ++++++++++----------
>  2 files changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/xe_pmt.h
> index a62ab05c6b4c..54df1c8a9f8f 100644
> --- a/drivers/gpu/drm/xe/regs/xe_pmt.h
> +++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
> @@ -20,15 +20,15 @@
>  #define BMG_TELEMETRY_BASE_OFFSET	0xE0000
>  #define BMG_TELEMETRY_OFFSET		(SOC_BASE + BMG_TELEMETRY_BASE_OFFSET)
>  
> -#define BMG_MODS_RESIDENCY_OFFSET		(0x4D0)
> -#define BMG_G2_RESIDENCY_OFFSET		(0x530)
> -#define BMG_G6_RESIDENCY_OFFSET		(0x538)
> -#define BMG_G7_RESIDENCY_OFFSET		(0x4B0)
> -#define BMG_G8_RESIDENCY_OFFSET		(0x540)
> -#define BMG_G10_RESIDENCY_OFFSET		(0x548)
> -
> -#define BMG_PCIE_LINK_L0_RESIDENCY_OFFSET	(0x570)
> -#define BMG_PCIE_LINK_L1_RESIDENCY_OFFSET	(0x578)
> -#define BMG_PCIE_LINK_L1_2_RESIDENCY_OFFSET	(0x580)
> +#define MODS_RESIDENCY_OFFSET		(0x4D0)
> +#define G2_RESIDENCY_OFFSET		(0x530)
> +#define G6_RESIDENCY_OFFSET		(0x538)
> +#define G7_RESIDENCY_OFFSET		(0x4B0)
> +#define G8_RESIDENCY_OFFSET		(0x540)
> +#define G10_RESIDENCY_OFFSET		(0x548)
> +
> +#define PCIE_LINK_L0_RESIDENCY_OFFSET	(0x570)
> +#define PCIE_LINK_L1_RESIDENCY_OFFSET	(0x578)
> +#define PCIE_LINK_L1_2_RESIDENCY_OFFSET	(0x580)
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 8de78cd0aa03..9cc104046756 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -241,12 +241,12 @@ static int dgfx_pkg_residencies_show(struct seq_file *m, void *data)
>  		u32 offset;
>  		const char *name;
>  	} residencies[] = {
> -		{BMG_G2_RESIDENCY_OFFSET, "Package G2"},
> -		{BMG_G6_RESIDENCY_OFFSET, "Package G6"},
> -		{BMG_G7_RESIDENCY_OFFSET, "Package G7"},
> -		{BMG_G8_RESIDENCY_OFFSET, "Package G8"},
> -		{BMG_G10_RESIDENCY_OFFSET, "Package G10"},
> -		{BMG_MODS_RESIDENCY_OFFSET, "Package ModS"}
> +		{G2_RESIDENCY_OFFSET, "Package G2"},
> +		{G6_RESIDENCY_OFFSET, "Package G6"},
> +		{G7_RESIDENCY_OFFSET, "Package G7"},
> +		{G8_RESIDENCY_OFFSET, "Package G8"},
> +		{G10_RESIDENCY_OFFSET, "Package G10"},
> +		{MODS_RESIDENCY_OFFSET, "Package ModS"}
>  	};
>  
>  	for (int i = 0; i < ARRAY_SIZE(residencies); i++)
> @@ -270,9 +270,9 @@ static int dgfx_pcie_link_residencies_show(struct seq_file *m, void *data)
>  		u32 offset;
>  		const char *name;
>  	} residencies[] = {
> -		{BMG_PCIE_LINK_L0_RESIDENCY_OFFSET, "PCIE LINK L0 RESIDENCY"},
> -		{BMG_PCIE_LINK_L1_RESIDENCY_OFFSET, "PCIE LINK L1 RESIDENCY"},
> -		{BMG_PCIE_LINK_L1_2_RESIDENCY_OFFSET, "PCIE LINK L1.2 RESIDENCY"}
> +		{PCIE_LINK_L0_RESIDENCY_OFFSET, "PCIE LINK L0 RESIDENCY"},
> +		{PCIE_LINK_L1_RESIDENCY_OFFSET, "PCIE LINK L1 RESIDENCY"},
> +		{PCIE_LINK_L1_2_RESIDENCY_OFFSET, "PCIE LINK L1.2 RESIDENCY"}
>  	};
>  
>  	for (int i = 0; i < ARRAY_SIZE(residencies); i++)
> @@ -695,7 +695,7 @@ void xe_debugfs_register(struct xe_device *xe)
>  				 ARRAY_SIZE(debugfs_list),
>  				 root, minor);
>  
> -	if (xe->info.platform == XE_BATTLEMAGE && !IS_SRIOV_VF(xe)) {
> +	if (IS_DGFX(xe) && xe->info.platform >= XE_BATTLEMAGE && !IS_SRIOV_VF(xe)) {

nit, can we have a if VF return separate clause before this dgfx && > bmg?

Perhaps we should have a .has_g_states in the platform flags so if the next
platform changes we would already be protected. Even Sashiko knows that :)

https://sashiko.dev/#/patchset/20260805102226.1764-1-karthik.poosa%40intel.com

>  		drm_debugfs_create_files(debugfs_residencies,
>  					 ARRAY_SIZE(debugfs_residencies),
>  					 root, minor);
> -- 
> 2.25.1
> 

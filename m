Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20399CCA470
	for <intel-xe@archiver.kernel.org>; Wed,  1 Oct 2025 20:15:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A227B10E004;
	Wed,  1 Oct 2025 20:15:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RojKCQHc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA06010E004
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Oct 2025 20:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759349721; x=1790885721;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gzEdkflI+MOBiveU3favlHzQbOrsoPK5VIUkx8uMb98=;
 b=RojKCQHcvtUt2bbbqp6edZ/tRdJufaIsJ16vqflHjXREzibmC4j4AvYS
 kdXK1wnDqPZ2aOxZWkJxmtIGzT122zseV+Ko81+jEBDaFu+8ZoImBey/6
 1phX4QAaD+GQNjv5iZGCLSW0N5CDmWTg37NEBOqyMD38pMYH+lo/2wRcT
 HOyL6o/H1r3Zzd+hXjIulCHYmOQtftqE5thpIWOyFDJKSz5wv/GIISztv
 701VtlamvgVCmVfaancMajHq8q40jzj6TNkQPzMX1CXHtYk9idQQqF6h6
 blddV86oKoeT8g5TC3mfi1p0OmICJDOOTGV8rWiqPtqrqJI2cnQU5c7cR Q==;
X-CSE-ConnectionGUID: /dxZMnkOTk25Nu+wicAY3Q==
X-CSE-MsgGUID: iLJmxfXRSoO3zSba7wrHIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="61546231"
X-IronPort-AV: E=Sophos;i="6.18,307,1751266800"; d="scan'208";a="61546231"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 13:15:20 -0700
X-CSE-ConnectionGUID: s+iqky0uRAKjenioVNrohQ==
X-CSE-MsgGUID: +khBq55GR92+dOga5JhNvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,307,1751266800"; d="scan'208";a="184059849"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 13:15:19 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 13:15:19 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 1 Oct 2025 13:15:19 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.17) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 13:15:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BVUWX2gp5Twbsj5JpLuLtHtlCTwm4PHXcbhnBWC+vl+ZEtoqydSTUrH250GoDoEqt9CBpKsX6aoTOQ2Rtgn//Dp61XAam9JvNAhqHz1ioea40xh1S8QfLS8mlc3HkzUVCIDY4/XHDiKdNYwwL6gb79Yr69rjQVPtD4O2Fy4xQVSX0IJVZcyW72c6NKuT0y8B4nn8wOi0HYlg+AIBNQpsYlmlZWnNCkddcO03GcYKBB2VMvO02fEb6GHmZljFokTMBOcq5GvI1+2Wfd1t7WWPYBPgdZeMQJd7pOfLSQq/E2iWuXOz8MgR2Tg/HYL8/wEUvEOKsZQQpr5pczPmMiLJFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cUd7DkCzcSH+KUlEVmrSZjH9B70YYzDSER2pngw514E=;
 b=Tpcv+s1/pV5cm9wdsbJmOm9fbMpPl2sf0nC6Fz3bstIEHLHwDWBeaV/Kmu/6163AoeEqwsIk3HDrRDUMbKaxSYsgSI+wTzsuBiJnLiwptoa71nRsGJc8LEil41LELdxsnjDy0xZfXnbB1GfBCl7tkQB2sr6GAKQUYQt8d5BFP+PHLXSjuFj5bCWHXcweKd2jPJc3vqshGDwN8E6lQSDnq8TbZ0kZn3Xchk/XPN/dXwd6/cLUWMy9TZRgzRrTAJEM3pkHDjs4vrmtBEkSLBEoleVYGCanvteNOn/antqLSEPluWPes7aURXEarMr+K64mTX6wHP6vpoOxYHCcQLDSjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5021.namprd11.prod.outlook.com (2603:10b6:a03:2dc::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Wed, 1 Oct
 2025 20:15:16 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9160.017; Wed, 1 Oct 2025
 20:15:16 +0000
Date: Wed, 1 Oct 2025 15:15:14 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <fei.yang@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/1] drm/xe: TileAddrRange registers are being deprecated.
Message-ID: <v6n2utoszshbmafm2feeghgbyte34ackrurhogrvlgqooobd35@rapdbux7fc3k>
References: <20250930232645.600251-1-fei.yang@intel.com>
 <20250930232645.600251-2-fei.yang@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250930232645.600251-2-fei.yang@intel.com>
X-ClientProxiedBy: BYAPR08CA0054.namprd08.prod.outlook.com
 (2603:10b6:a03:117::31) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5021:EE_
X-MS-Office365-Filtering-Correlation-Id: 52202c09-e362-4543-429f-08de01273c80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?m9MWnFz/CgSpeMI4waUNJSLksOZkc0+9DfcBr/yqzJHBYsJ7O/oqBm5Ne69+?=
 =?us-ascii?Q?ueACYGqjehNghr7uHaUg8qOnM6YgWxbkVMmr2fIuPjzVKYuX3FLvNVNmCaar?=
 =?us-ascii?Q?F1aXTGBO9ZP8aN59zuY+6dRL7kyoG9R6nZoLNVhbyqEK0joTduKisuDoTsi4?=
 =?us-ascii?Q?Td5G5EjUFiD3U1voIcED9zSZlqxeXk7mkC4i7iwlzCwI2PHmMx6R1RumQMrg?=
 =?us-ascii?Q?B3EEVHkNCd/U5/fyxsmOXCgNQJI1Tbn2pw1hj0Mg4zoK07Bt7k+wp6kGwaE+?=
 =?us-ascii?Q?JkqEmaQYvst6qcU3+IoXHH5qyLjKNkszHE62Ydikx9ATivTYDJE8OMrnP36b?=
 =?us-ascii?Q?l185yViO4UvsjUS2uJ6p2GYGowfL8SDeD1OtrkaIAvyuMxNlpB9yACLvxE3A?=
 =?us-ascii?Q?4O2WVYakLnAwk3YZj7+a3R3zRn39ZEvVdOHkiaDy/0opMymlWISFLKPp5QPi?=
 =?us-ascii?Q?TJtrkAxQKPG0Fnova87gProWDcNNqY8tuuJD32klbwUKNmPZ6lXvvN+gR6ct?=
 =?us-ascii?Q?+b3aZ70S5EVw0g4k6/AcplUGv3e68waQ6tkhiF2GLrEWiOe2rAFV9kg0Qq6M?=
 =?us-ascii?Q?qL6I0JV1OVQFyVN7SiFP2DiblZSckKcy2XUrWPAdMm9Xy1fncBfbiVOTPyGY?=
 =?us-ascii?Q?JKSwug1sDEu1PPf22CMoftEwoaHmarJShNzWMMz2j+XwusadHW/k+ZIvkmIU?=
 =?us-ascii?Q?m6Mzn61EkMBTMuyHoiWuiLo08rXRwbij0RBdnVr6mi+gFYiT7GIX59MwL/19?=
 =?us-ascii?Q?4z8M8VC1n35d/cy3jM4bh4PfWn6uyFYjkkse7x8EkzXo8LwwxcVfCMmxFLBI?=
 =?us-ascii?Q?djtZwnUXT5ejoV2JlvPYTWqc+IfSC7t9O3lMm9jEiagy4LtQE1xaDMoA31gg?=
 =?us-ascii?Q?g6FmlWGbwRJ0JLrT0rNcJn5Jm3kmaQSgdewQmEl+0QCwzx5abM6PF2bHrgIW?=
 =?us-ascii?Q?L5H9xPL4prdNqxEq6onVR44GOyt2h5e7M1vkQUL8ZP8bDOCic40kIVBjkHzH?=
 =?us-ascii?Q?eq3p8j4+V+BxrCa6feIg0DNUrcvgGMjqRr4ZzIXvNAIpaCySl++AlkPgHT1/?=
 =?us-ascii?Q?giYjG1ONzlP6X4+2nTQ51lKDaofGwiBMHwL3nsYxPpiXLz/eudgrlkggVvU5?=
 =?us-ascii?Q?bkA550kcyvOt6b/U2jMhzUhFDk3pLziKOsFWF++QY3+Sns5OY37snNsDNtGo?=
 =?us-ascii?Q?tYzE+ZDMhrZzwW0LL3357I4XITO9F6EezMCbWtpEL5wqxUp3D/GB8N34vaSN?=
 =?us-ascii?Q?PuzUrcy7uC21Wg1YGG4XlO5YnpBqkVkLVrcgUfQ/+0690K/c010n1/OlSRzq?=
 =?us-ascii?Q?qMqXwh+fylnOjIx2D79jcr2bhT1sax+kJCYTf+Q1D6o2dOwXV6tMKg+x5e3n?=
 =?us-ascii?Q?afQO6TZFOUCT/5APGorejm/0g+evbJVR4ITzjr+cneMyyAi0RpSusJd5GGu6?=
 =?us-ascii?Q?DwVt9Bnkts6KXwHzOCykv8DLEgiBKKsq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UVH1AuATTzHJe9zICPnVJPLe2a0r/XCakbeHrmsYkgfE5lTM4xj7pTzCpGnL?=
 =?us-ascii?Q?T85tzAooVWmad/BnpqfB14Iyp4024WlYbSt3pc5dwk8llDqNeON+BYNryJRl?=
 =?us-ascii?Q?YuuitGPCmuu0s9F9pg9Wi+8duSlDvLv1XZLOD/GPlbXvEIHRQGMw9Yexj77T?=
 =?us-ascii?Q?xFaJL7SnMnMyFznvf00loRGK0UPknkqNFMiBOGKv/ZZemj5rjSzf0j4YgaxS?=
 =?us-ascii?Q?xLdY3hTUXoSxUVvsqQbubBY+ZDX8Pq5pNqYPVBvJ1IjLqErzDCB4nIMkQ274?=
 =?us-ascii?Q?BXm+ThcrkxbJOC+P/CJgAYN7tnBitG0SZZtylv0D+0jbGTj58KBFR0LRBiD+?=
 =?us-ascii?Q?hCpfsGlw2TdJuSzpxhIZBFo7FtoXJ8K/ijzmc4fkF3bJBo66r7ogKM2tfiXd?=
 =?us-ascii?Q?VpfiABRdwY5/+e9k+hu9b3SzzXNmSrOprSxVjSrWVzLsSawVnoIH/B+xloQE?=
 =?us-ascii?Q?UjOlpCuFc6+QIooDAkTgMkHMYka2/PrHR3arwNb8gkGPIA5Nav703Z6jlcEB?=
 =?us-ascii?Q?6vOmCfK+SHm+My9zje6HD8pJea4kNaAqTJzY3MzrvIsMsUj02SvXbyJnqLdQ?=
 =?us-ascii?Q?uViGPZmw3TTERjvNZMLNssbWWRk2dXo4q5nj9irgh3pKtB/JjNhCjhOTlSCz?=
 =?us-ascii?Q?k/d6YQhIMgZOTlqP4tELaz6b2+k0nQfbWLj3kjA1gw6FQoHU8dXfWye48Wmg?=
 =?us-ascii?Q?RQAN8QgO76GnAlm5xTfjancKhCT+w+XyjRpZwWpeRQbW2AXCMqf3FAFTF1Uc?=
 =?us-ascii?Q?bEhRAgtKJyqxQmHPOPMoGd1Br54T0fUefrs5AwmmGFIE0Qw8EVDf/cFMyjH+?=
 =?us-ascii?Q?WlAHlTSnXYSNADJqjJ/pO5HwgI600lvMiTaf3Q+IIhm4yzwMuP6eHhHtX49N?=
 =?us-ascii?Q?XbhVesaZZTElMzb/419uxX7HpfWKgvgXOE5iRGw60GcxFoNVJ9Z3+CgWJAdO?=
 =?us-ascii?Q?Exzv4CH171cFufqkAzopwbF3QUoaO63FzpFkDMDdT8k+8m+j9OInMk+fmdV1?=
 =?us-ascii?Q?K7H56uEzPdSvWeuaegO8i7ZOe+jRl7BQw5mQY6GY7v5+XaWLmPGMSDFVpYH1?=
 =?us-ascii?Q?c/KZYv/3fRbb/FbtFouCdDHYHIk28DVBOZtsuzBikCi6KWKhI6hermKNEly1?=
 =?us-ascii?Q?089KqU+KbM7JZ16tT9aquorELonxioDzsmklXBvpmEeNLfGDuYm7qSNCpZyn?=
 =?us-ascii?Q?GuHjm0ycnfx1Ta2htNfVDjKJNkNGM2oug5lbWzbN7dwzP+kOPVv1ilcIw3Th?=
 =?us-ascii?Q?ERXLdd9YPEbR1xzj/5smu1aT/fXniswgWPelIh+awU1nm7VFIJBCXrqv5PKV?=
 =?us-ascii?Q?WYpHnVywclVtVAkcvjwepyh2b+wj0NCp1RDLOPYkDM3hQSP8pnDt6Fm+de1W?=
 =?us-ascii?Q?J76NlUXb38pZgiCyPifoCIv56XNNAC2bOu6+Kd58zTOtBGeuvvWPLrXkZuF1?=
 =?us-ascii?Q?aqCXcpKfWBdrh5Hs/FHw1Ht/GByRjCBYbc7y6mz5B7enlecKNLXYu7bdO8tL?=
 =?us-ascii?Q?DeTtBLR/JUzU0gIMZRfoBqzoDkyhmYiv6pYpnsG51Sq/U055kQTKGX8mc46Q?=
 =?us-ascii?Q?ZRfjZ8ucQsxHFI95irYgtwJ//ayUf3WgpQn4BYRfUpu+79C+tk3G9pUd/bqG?=
 =?us-ascii?Q?KA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 52202c09-e362-4543-429f-08de01273c80
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 20:15:16.5819 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fc+pz8OCFsZRaXl/AQxwrlussNt+ZXOwV+C/4ROva6uBgAJlgfH/ltHzl1E/zHh3/ehKGcDQ+h2wiCw0A9h4gNVGHdMb1kRMkGfZAFIV8bo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5021
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

On Tue, Sep 30, 2025 at 04:26:45PM -0700, fei.yang@intel.com wrote:
>From: Fei Yang <fei.yang@intel.com>
>
>Quoting BSpec: 59353, "The TILEx_ADDR_RANGE registers no longer have any
>impact on HW behavior. They now function only as scratch registers for
>communication between SoC FW and the GPU driver, and will eventually be
>replaced by equivalent registers within SoC MMIO space. At that point,
>these registers can be deprecated from XeTLB.".
>While the transition is ongoing, the SGAddrRangeforTile continues to be
>valid and works on all platforms supported by xe, reading that instead
>to avoid potential breakage.
>
>BSpec: 59353, 54991
>Signed-off-by: Fei Yang <fei.yang@intel.com>
>Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> drivers/gpu/drm/xe/regs/xe_gt_regs.h | 3 ++-
> drivers/gpu/drm/xe/xe_vram.c         | 2 +-
> 2 files changed, 3 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>index 06cb6b02ec64..484598d81cce 100644
>--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>@@ -95,10 +95,11 @@
>
> #define XE2_LMEM_CFG				XE_REG(0x48b0)
>
>-#define XEHP_TILE_ADDR_RANGE(_idx)		XE_REG_MCR(0x4900 + (_idx) * 4)
> #define XEHP_FLAT_CCS_BASE_ADDR			XE_REG_MCR(0x4910)
> #define XEHP_FLAT_CCS_PTR			REG_GENMASK(31, 8)
>
>+#define XEHP_SG_TILE_ADDR_RANGE(_idx)		XE_REG(0x1083a0 + (_idx) * 4)

so... this is not a GT reg, it shouldn't be in xe_gt_regs.h
No need for arch/platform prefix neither as we will always use it.

Adding this diff as a fixup:


diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 484598d81cce4..28df6dbbf0d31 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -98,8 +98,6 @@
  #define XEHP_FLAT_CCS_BASE_ADDR			XE_REG_MCR(0x4910)
  #define XEHP_FLAT_CCS_PTR			REG_GENMASK(31, 8)
  
-#define XEHP_SG_TILE_ADDR_RANGE(_idx)		XE_REG(0x1083a0 + (_idx) * 4)
-
  #define WM_CHICKEN3				XE_REG_MCR(0x5588, XE_REG_OPTION_MASKED)
  #define   HIZ_PLANE_COMPRESSION_DIS		REG_BIT(10)
  
diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
index 1926b4044314e..ad93c57edd17c 100644
--- a/drivers/gpu/drm/xe/regs/xe_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
@@ -40,6 +40,8 @@
  #define STOLEN_RESERVED				XE_REG(0x1082c0)
  #define   WOPCM_SIZE_MASK			REG_GENMASK64(9, 7)
  
+#define SG_TILE_ADDR_RANGE(_idx)		XE_REG(0x1083a0 + (_idx) * 4)
+
  #define MTL_RP_STATE_CAP			XE_REG(0x138000)
  
  #define MTL_GT_RPA_FREQUENCY			XE_REG(0x138008)
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index 74cc04412abc5..4c35c41c91c73 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -255,7 +255,7 @@ static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
  		*tile_size = pci_resource_len(to_pci_dev(xe->drm.dev), LMEM_BAR);
  		*tile_offset = 0;
  	} else {
-		reg = xe_mmio_read32(&tile->mmio, XEHP_SG_TILE_ADDR_RANGE(tile->id));
+		reg = xe_mmio_read32(&tile->mmio, SG_TILE_ADDR_RANGE(tile->id));
  		*tile_size = (u64)REG_FIELD_GET(GENMASK(14, 8), reg) * SZ_1G;
  		*tile_offset = (u64)REG_FIELD_GET(GENMASK(7, 1), reg) * SZ_1G;
  	}

Lucas De Marchi

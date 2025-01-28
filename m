Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F154C0218A
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jan 2025 22:47:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A84CB10E714;
	Tue, 28 Jan 2025 22:47:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EGixTULT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 730EE10E714
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jan 2025 22:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738104459; x=1769640459;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=9sQkCNvy0XL2v977CvOaC+/Ke2ZdsvbOBTCI9QS1H+A=;
 b=EGixTULTXQ0db3p90A/VQHgveOnsiaIbVH/MALC91V/Nvu/vg0YT+Gtf
 6Z9mbZyPaaQQavFmvYYXsOf0b1Wk7ghkERqFaE9pHJuA7g4MfMqgV4WNe
 IWednMmc8uC9EBP7Gavrz/gLXn/cUcD1UAsC1hFzigFHYSYS4lYiy86An
 iq9W9ggZ8dcTDA7olZI2x4qdJJkRaQ6fC4I9E7kjWSlYhSUG6qitpmNR4
 AywCTMRnnlGcS+ik80DFFmvSsBrx3yyDyOAU6Nxw4HMw7KzljpbaWXOue
 D8QmiZvtEwBiV/nfeF7I6PQMO9InqLuTcSkCPM/BUKf26MyzAEQqWGiDX Q==;
X-CSE-ConnectionGUID: +sK50jt/TJ2nmbaJaKfFtw==
X-CSE-MsgGUID: cLwtX+JDR9W1sj8akKuZjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="41444119"
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; d="scan'208";a="41444119"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 14:47:39 -0800
X-CSE-ConnectionGUID: PmYTUU1BTTC/44ePbvHWeQ==
X-CSE-MsgGUID: LEIphyPKT/ms2mDyL3D06Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; d="scan'208";a="109397297"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jan 2025 14:47:39 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 28 Jan 2025 14:47:38 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 28 Jan 2025 14:47:38 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 28 Jan 2025 14:47:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iP8PK9d7XSUOfeUmWEx/YwJYNw1p+QI07vf3KxL+atlaACKlj5l8P6xOyRFQlAdxUKtejpggXk+KiD/w3jtBLMp2iw2+QOf9LY+ctx5BdjmAI+ocw21lt9c7o0jh587gNhjUmtCGkBpe5e6SSqZHraF/dKoKIfSupfwXp4IsxEXL1HL2iR2kalYLWpoWo+r96c7bgkmrO/vsso+9ktyCQN4Uy4OwIR6f139DZ2Y/aHHst+RM+4dXOoLmdgfhp84ClboYN7mB8PTnuq3TZ7m265+IDtcOmugbobPyxbjkwLisTCEMmqDEthx4+hZWmKFPvv/nWk4T0noW5bZgsq4lIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m23VLzWghPccYkkqg72HxkbVH0wCAyNHMN/fv6sXaqw=;
 b=NxWlc9/HC7yRBzPz2NZ1Ymc8pztHvwcjhShwq2qgAmddhCUPDmCPxGzMHS66ry3uM2irrji8s0CHkRcPS0ZRan3mUCmrcwWvh06en0SGae9m/aAMFaj+1PoqD2zdOLhzq4VMd4Gqcu8jpJolNg1BtpAe4oxZEhPSJaFo28UWkcbLJwEEUnfn0fdboiIHW7cTPkTaZ1bkHd6jxVRV8Q7/3YNMHzNeeklzVOhuYQOWKy934tH1M3UJCbjVzvc9PYvrCqO5oJoQnKef/FIaMnYi4iSV6cUt9NZoMAuPOeiJ7t9GO1+p1P9NVHzAyUW3z2aelguN7jb5wnZjYn3mc/yCZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by CH3PR11MB7250.namprd11.prod.outlook.com (2603:10b6:610:149::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Tue, 28 Jan
 2025 22:47:08 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8377.021; Tue, 28 Jan 2025
 22:47:08 +0000
Date: Tue, 28 Jan 2025 17:47:04 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?iso-8859-1?Q?Jos=E9?= Roberto de Souza
 <jose.souza@intel.com>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] drm/xe/guc: Fix size_t print format
Message-ID: <Z5leaJep24NycG_l@intel.com>
References: <20250128154242.3371687-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250128154242.3371687-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4P220CA0016.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::21) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|CH3PR11MB7250:EE_
X-MS-Office365-Filtering-Correlation-Id: aa92d7fd-dd8c-494e-a4b9-08dd3fedb1e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?dLLWZhbMmXlPLan4i+xtChyyUjg2XPpXwF5W8Bi5W9DVz8E7MqN+Jb7PXe?=
 =?iso-8859-1?Q?8SqVueIyYlIVs4IGRZivEgJxFeCWWmzVGO7kiZlS1ymQOxmU7JKzbQkRnE?=
 =?iso-8859-1?Q?5DBkts0iD/CGh0r6GidGuWlpdwBDHzFlZd++O8hZuQlF/u96doOJIlSNSB?=
 =?iso-8859-1?Q?0sr1AVUgLQFRktmIck5kj/N4cI+pXXZG9jJvAZPAe01/0AYg7/oE2pJC0i?=
 =?iso-8859-1?Q?pN65PKaJ4pxvFI6HfJUbeFy9IrI5H0SVGqfZ+XNuxWgBCDSeO/JJEuhwlE?=
 =?iso-8859-1?Q?eOoMIeBm2cAMe7E4adsVW/JNFWZ/9NUCePHtcBiqwhBfzAiL+W05exHFB+?=
 =?iso-8859-1?Q?g6DtMxI1NagUNqbsHa7Xb8YC91gQ3fqFivQbZ7G3tMu9iBqoOeUHDsWSPU?=
 =?iso-8859-1?Q?ShhGBPPWp3tcoy1FQ2w6wbcL4IEflM3KxQlq42Mn0MO2RF62FfaIY95/Ix?=
 =?iso-8859-1?Q?fetWXKzQbW95+Yb1q+mvc7TjAk6HYJsmW2dYF80Cp1f2TL6pXhmEnw4FO3?=
 =?iso-8859-1?Q?ofVJOpZODJVac/4qZVZ1oXFiyuqNDCNobN4bUZYs0rNUtgaUXFBbcVD/yt?=
 =?iso-8859-1?Q?vvU7KJ9+Qz9hv9Flc2ZsToaOXGgV8wGwJwdX3B5aRqYqsnSxKdj/w1uW7L?=
 =?iso-8859-1?Q?fOBDWEtJU03AQADRLQSPn8I/zwqqMGs9NMoqtB/6Q2t0Lnr0uQsmfGQ0VO?=
 =?iso-8859-1?Q?cocRS017SwGamvy1ZRF2mz6xlmKgiC8ALdvWmf4l68+gUPp6rq0fDItZm6?=
 =?iso-8859-1?Q?PDDJTdCE3HQbSZx7zpZFSrpi5SH64G4VlVpIDzobJD9akEGywdHdEcBPWM?=
 =?iso-8859-1?Q?iGTXfKCYboWm4OXoS+Su2oiGNQAhzmIsOHo8YgaVmqBz5HkLzfFjstAi1x?=
 =?iso-8859-1?Q?QX8nHx6mpXLUT7LBhF2ugDXWAZE4GT+nEzQyw/DuXGRCJr0wH2EVSVvNlX?=
 =?iso-8859-1?Q?Bw6xzg4JctIQuz26s3rJIRbPMNKsFti6mvd7DfbpVw+hlNgQ9dAB3JejwN?=
 =?iso-8859-1?Q?iHdl32g7I7XaYPc1DZZMtHQB1I29dDlHj+isAz9U+LVjNzaZMY+zldDTRh?=
 =?iso-8859-1?Q?14Gxwxt5gJL1a9RM4Y8uk/vzutbEuEn2DfFKx1/y7d1vs9zuERmDDHDukS?=
 =?iso-8859-1?Q?B8B4nZfiP9hWt9vhu12/peg1kkrj3msM0zabVdjwSPIdJhyZp+fQBCdQA+?=
 =?iso-8859-1?Q?Rlq54EiiVmLFRgdMvGGLb+n4g2zvvK+XB8PMNRGU3IIclTXQraoQrM6Uu4?=
 =?iso-8859-1?Q?oG4zEdQee0epg/rTWITKk3ZbfcDVcpIX31w5EDqJL1HfxuUJGCg/Du2rK2?=
 =?iso-8859-1?Q?+m0G1kiFR68hXw0+tFNcodN/7Yp+vng1B5n5vWkE5ll5UHjh5NIFO9ws9P?=
 =?iso-8859-1?Q?xGBOUQUFVd/9NnoJl1rVjbMFSPd2oq1c1NQFgwbVxF1CZD5LGOLwV66SEL?=
 =?iso-8859-1?Q?AOvPw+uUnSnI3sZT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?/OWapxoc4+aZv3Aukpxj1cGhxvGe/8jrteiC5aPIfueUeexqEO1h8zgJRh?=
 =?iso-8859-1?Q?we+csmnpX+sihDz8JwZEcou0WqUlqgf/LgnGjUZnIo6de5/tDYHzsk1wzi?=
 =?iso-8859-1?Q?wemtBjPtDv3X+xzHlySE19x7Fi71s2jxtUyWsiSyFS/IMvGGGz0Ci7vcpp?=
 =?iso-8859-1?Q?c9iNcHteBsFhN82HwJFhJTnTMb19sza9l3wJa2m1LiW6fzXzHXi/c17aBs?=
 =?iso-8859-1?Q?H7BOZxdfcKnqkdvtghOwUGc2BqyGgUWQi21YBv2wluRYto+a6ZWn6j9UnY?=
 =?iso-8859-1?Q?zni2/Mj1spNRvMA5vpklNo12cgokrPg1XYkwxNb1RzrMenvnSEj9Eu9S7L?=
 =?iso-8859-1?Q?iHpOA6EnwDlG4qzJxggl12C2BABVDepc1Ge4VMZc7heaoFcovQBysVNPgO?=
 =?iso-8859-1?Q?/lAtZiDLv0lNLUR2nBYo/f40xjM++3DMmsMU3vuSxdQlieXpYyuYJqma4p?=
 =?iso-8859-1?Q?jJampsrfNOp5UNM0pnwPGhuF8ERqoe2VtZS8lWY/e6zyYCHGbLN05BzVnh?=
 =?iso-8859-1?Q?ujwNqCBZfNjIlfwZ3jh793TCNqbg9ZaCB73IMZCjJmWDuB8koR3vNF33Vs?=
 =?iso-8859-1?Q?Rqm4T7J5LYLZHB0fG80DiDwxMkpZThSspnnkgL1ruMTjjuCtM0/Ren1Sxd?=
 =?iso-8859-1?Q?csJ3Z60ZbC7/3VPh8+CHfviXGhnIM0ri/USXvxPHSig7EDUuVPd2zDvokt?=
 =?iso-8859-1?Q?oskEycI0NzsJQpRm0jkUS3DZtHR0UaTzDWlT/DI0HS2B6F8pLmuDDyk/2i?=
 =?iso-8859-1?Q?KhWcWRwezyXUI2zz9HuVs+EZpK6pN4vBDGWxAvg+VTIHDlpvn4l/QDOmXF?=
 =?iso-8859-1?Q?t66qCSEmuI/Dg2Ir7VhnN03LYKxFleDn20wg1Hea+xEoMBp0FjyWrDGa3v?=
 =?iso-8859-1?Q?QD0kdGWhoLdstk0R3ihBhZdab/4U5OEzz3RvxAus9DhEds4iJVuZxC+reG?=
 =?iso-8859-1?Q?H1WyqdLKppgSvt3wEEDlRXiHHg7bjf9q4etI7vIhI47v5fUNqqh2Lb6ryq?=
 =?iso-8859-1?Q?z7UHIeQY0c08hthpDIpHOiu9NBN9fbwKCobeqh1x+WkaeGyavZ4kr3fGvM?=
 =?iso-8859-1?Q?vk6/Zcxog0PyR2/iBHeUkw5Fb4Dkv+W21+Vg6Nf0hs67s0eZwoTP+/PT6+?=
 =?iso-8859-1?Q?eX+vKV2ZpSgYHHeCZJ19O6dyzodzQoVBj93K1p972hMfg/IdDvmw54GxAF?=
 =?iso-8859-1?Q?vjIWUz2lukIsJwr1M3cPB5QyhXd2LnzHSLY5VFZL3abo2oIsYwWc3G9Cvh?=
 =?iso-8859-1?Q?G3WN6dUTmPAPB0zRP4Qu4o1ljTIixL6TdH7ay6SEJCUsnhWN+LSf7wtl+Y?=
 =?iso-8859-1?Q?RMHVvoZBoa+K698vCBMUi35qxhcoeL6YUsR321wtr7mOTeLol31rs7N9nv?=
 =?iso-8859-1?Q?iUPgpNidY23ZlI1XxlEUcvIisrIdPEEklEJLo6uOsJdoUYBFaBlk9yJkc8?=
 =?iso-8859-1?Q?kls6hUj0cnvRQlTG3xA3eq5yTawpsW8z8Ci8NYfPTBbdfkh0UqyzObip9V?=
 =?iso-8859-1?Q?xplCgkaak5Lb44prqQm2Pg1pdWXMhlXbmGP1wYcErRHbFyfflF2PRfo2La?=
 =?iso-8859-1?Q?GT31tgRQpuYnB8xJIRDYPFod8MTQw7ULEsh0s+JWhK+oPoXeFp2TsdfLGA?=
 =?iso-8859-1?Q?AjmKiEbcSkKJWprX1yQcw6t9W5T3AmJFsvG/DYQor/zmgs0w+c/ve2PA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aa92d7fd-dd8c-494e-a4b9-08dd3fedb1e5
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 22:47:08.4411 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JuCbX3Jp2DGlRF82YJ7ZzgHlAj9NYzSVlwrkYGhR5P7AP//kCOrXqUzmaART0g/bledvYIWMlECkWy82iks6FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7250
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

On Tue, Jan 28, 2025 at 07:42:42AM -0800, Lucas De Marchi wrote:
> Use %zx format to print size_t to remove the following warning when
> building for i386:
> 
>    include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
>      518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
>          |                               ~~~~~~~~~~~ ^ ~~~
> >> drivers/gpu/drm/xe/xe_guc_ct.c:1727:43: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
>     1727 |                         drm_printf(p, "[CTB].length: 0x%lx\n", snapshot->ctb_size);
>          |                                                        ~~~     ^~~~~~~~~~~~~~~~~~
>          |                                                        %zx
> 
> Cc: José Roberto de Souza <jose.souza@intel.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202501281627.H6nj184e-lkp@intel.com/
> Fixes: cb1f868ca137 ("drm/xe: Make GUC binaries dump consistent with other binaries in devcoredump")
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c  | 2 +-
>  drivers/gpu/drm/xe/xe_guc_log.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 497036675a38c..72ad576fc18eb 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1724,7 +1724,7 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
>  			   snapshot->g2h_outstanding);
>  
>  		if (snapshot->ctb) {
> -			drm_printf(p, "[CTB].length: 0x%lx\n", snapshot->ctb_size);
> +			drm_printf(p, "[CTB].length: 0x%zx\n", snapshot->ctb_size);
>  			xe_print_blob_ascii85(p, "[CTB].data", '\n',
>  					      snapshot->ctb, 0, snapshot->ctb_size);
>  		}
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> index ab97ac728d7a8..80514a446ba28 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.c
> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> @@ -204,7 +204,7 @@ void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_
>  	drm_printf(p, "GuC timestamp: 0x%08llX [%llu]\n", snapshot->stamp, snapshot->stamp);
>  	drm_printf(p, "Log level: %u\n", snapshot->level);
>  
> -	drm_printf(p, "[LOG].length: 0x%lx\n", snapshot->size);
> +	drm_printf(p, "[LOG].length: 0x%zx\n", snapshot->size);
>  	remain = snapshot->size;
>  	for (i = 0; i < snapshot->num_chunks; i++) {
>  		size_t size = min(GUC_LOG_CHUNK_SIZE, remain);
> -- 
> 2.48.0
> 

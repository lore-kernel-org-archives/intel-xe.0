Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6813CCA470
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 22:03:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96FA610E70B;
	Tue,  7 Oct 2025 22:03:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iRWULjyb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E57410E70B
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 22:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759874613; x=1791410613;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1757Rys+dHWjhGYGjpRogjF8f8kzqB+bJMb4UkQ37TU=;
 b=iRWULjyb3WxRX079yUouQ2t7NLs7J9M1PnP/EGAUFmm0Z29xdc8WhZun
 Jhfx+atbbE0/RYDipEp/iqLLgY4iVdDubzBW1eUtURc5WX8ko8JJU3Io0
 PjQqXZ1DiBH40wqCKZVmuIEsCDEYO67i77hADtjPM2gspCcP096EDdgsE
 j4RIzchtLCYVhnrkTfwfojJnOarThQU2hsYQYj9sd7MUiq9HHSL0+otPE
 rN4r0+cGh5mYjXEtXt/v6zqaUXvI18U/s0A5kDJLhA0QhDYBCyMtOeK+L
 hWpfZBgrjYGypGXi4aJaoTVA6VdV0NeCezTWlO8XUy4RKwDvs4U156q3y A==;
X-CSE-ConnectionGUID: bArkl2p7Rbes0QhhuraV7A==
X-CSE-MsgGUID: LCW2hlZ7TxK23DEU90iI8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="61772274"
X-IronPort-AV: E=Sophos;i="6.18,322,1751266800"; d="scan'208";a="61772274"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 15:03:32 -0700
X-CSE-ConnectionGUID: wwah+LW7SK2+TBxSvj8PmQ==
X-CSE-MsgGUID: EDqK49/bQgWYZ5pKftfkEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,322,1751266800"; d="scan'208";a="211227631"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 15:03:31 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 15:03:31 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 7 Oct 2025 15:03:31 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.71) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 15:03:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z1CrdgLIPcoTrqznhiSuUZ89LFDIS027MW2oOg12pH/uSAVpIISSmb9sEATokZ/Pj+rmBQ1g4wr3DYNhHEA3RVB25oyf67BI6XPnqSiHd6386/ZzNJgD+D6jNLKpJqeO3Dnwtn9qiZ1/b2ny//FpMDnYCQ+9qiRhZVFNE0WBcVw1iu+SCW4+6VxRyEhNm7BWBU/1O2eMMPQ3aJcqOsEb7ECP+570+0kOn8vBG9pA1sgC4oX681s9dzxox9BPQRQB3ySdU8Ll2tllKLhVPyxYL2VtTThGyMVANXncNowlC/XhyWFH+jT7ai3sRVRH6HTtyAe/6ZruJamD4jjCjW+59g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+bwhCea3XLdhD5e65ubt2U9Gdy14gfkTLsedq+bzOyg=;
 b=V9Bsu4ZcVbgx0CCBcdYTkb2Fqnyg+ZM1WMqkHQSbCD1UwTxe/XpntESTA9t93WFIia9vS7ExMVWGHDC8JAAbYX9+XS36WMVZXsjodvN2DHzFP5uHfK+Upq2KPILnp8zgO7wmCjKjb4FIYcBEEzgnEhlPyA1fZk83kV6l3DMcj/UwEGYjXEh8aTq4orp9CDIHoNFc4X6P33/5Ub93yE5sYCIBMAadWEHPPLvagqPECFqM/I7wLnSZ26BeifdJQ6WdVIeKTI+GkQBquirbi5wj8mGqIFjSO4ww3GQUk7XsH6n4+Z8bGJOydjF61VO3BQ8FiZ9iK21ynH5nKJ8qTKja0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7193.namprd11.prod.outlook.com (2603:10b6:930:91::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 22:03:05 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 22:03:04 +0000
Date: Tue, 7 Oct 2025 17:02:57 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v4 03/23] drm/xe: Move 'va_bits' flag back to platform
 descriptor
Message-ID: <zovx5tsl5jbxl46r7dd6xhf7o2364fmszcnowp4tyo33zwy4to@akwerhv2x7un>
References: <20251007204829.1468209-25-matthew.d.roper@intel.com>
 <20251007204829.1468209-28-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251007204829.1468209-28-matthew.d.roper@intel.com>
X-ClientProxiedBy: BYAPR11CA0052.namprd11.prod.outlook.com
 (2603:10b6:a03:80::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7193:EE_
X-MS-Office365-Filtering-Correlation-Id: 80160c19-57a1-4691-4fa7-08de05ed4a6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OZsfxWuTLku0/ekwsy8XDLaXA3hLHz5hplDjAwEW+Eu+fJ8iM40Q4H1IZvXl?=
 =?us-ascii?Q?QSrFDVTCoAWVjU9fYjZUdqfPfNx09mhCay3dMlfKK3o1kpBnMAwHS8EML1Sg?=
 =?us-ascii?Q?m9UKQL6MKYyuYWO/Q6UD3yzT7KWidXb0NleQgL5sApaRlaF8YeeshNfaONPy?=
 =?us-ascii?Q?Gg9gHMYMGG1JJEPhkPDvVhz+vgFauVx8zpidBvetyhtcjJV7k2fObt9gnoCb?=
 =?us-ascii?Q?T3T+FCmyYKBlUSb6/gd4kfE8Djd4YjwNeVwtQ3l3Yl9i+I/GiIQAFFRT/BnH?=
 =?us-ascii?Q?TdYHYBQwNVqnFfgYGLfk/Abm+KjpwOlls6lq/N1jPRcaPy40bQDk8uRdO/xO?=
 =?us-ascii?Q?rzvabXIdRDJkDvVd8idpsOxnj5mSyqXPGCZN5b9X7DLisF+eUsJxGEP1vYv2?=
 =?us-ascii?Q?i9ARsbShuUUf00Ws/vE4LZOOpaOAAJLp2gm30irJU5FWXqUQeTt7gfNX0pk5?=
 =?us-ascii?Q?xQkYpSYDFj7SOI7VfLDjLhTbQzSwM/8u1psHQo+JrBg+rpWgN9VNykpmX+CZ?=
 =?us-ascii?Q?eo0u9tcPlwvhyZebHFN4Pzusg9tRZDlxjMKjtmVX7bGWffYGr3dHylFdrKO5?=
 =?us-ascii?Q?3iZ4zO2eb52I/HQ+rwMJ9wQxs8v+D70V9QwQxa3/iltpFrGIcvInv4CjJwA8?=
 =?us-ascii?Q?Ov5ExibyvBnnw/l1xX6T3/xFqDNQixvDb049UPEbjnfimybSHabUxefOYoRb?=
 =?us-ascii?Q?AO7SDttadVgVfTBxG/fCtNVEVLrQ/89x3mz9DFqeDKxVU9iIj8dz/ALVTlkF?=
 =?us-ascii?Q?oDAWWP2DUeDYQKm428SHaqSWqzB23K6N4NyJxMiEpC36rZCNqIZoEVZtfGaO?=
 =?us-ascii?Q?7liX+YvHnG1aQmRcf1BDNlrxDt+yyo2jIcGqaWHczhPJEjpQkq5yKMGbv0Jo?=
 =?us-ascii?Q?9IiTUMgkVgP2dGpn45QhDYHkX+r9iE+0TDqVXMXyuihyAS740QVXwDgy0DBr?=
 =?us-ascii?Q?oauVnv2laIeOaHOC7E5Ps0lICPImp9JGkq2scyr4O1QB39DGmSM5sPcYYqR2?=
 =?us-ascii?Q?A+Q0aw2iSNJw7k11LC0KyQxO6kYxAGtntNNsvGUdjvX6EhDRFdvpMjQ1PcoT?=
 =?us-ascii?Q?Y9VpbfMgZA4cK2ydv+L0OVn9Hor7v6lS1FlhSc+ydthia4G6UeEIZ7wdzAdv?=
 =?us-ascii?Q?OUQJ+BgRbPcnEDOmJP7pKNFYf/lDLifE+UL8t55zBoTY92iMTQLRrCN1D53o?=
 =?us-ascii?Q?uCzCRWbcdxFjg8XUSrvrmgjFxUYKPLy8UlUD9JG8ATX6sCV8IMzqXpkE+6pj?=
 =?us-ascii?Q?WJE30x5OH0b5rIsoNbgeZ/e6YYKF4lv8DKlVF2q40x98Jgqm0UxcMzOkwQZk?=
 =?us-ascii?Q?rzYUE37L+8VKhzu+2A6mpPyTAzUGTySUdYlQs3PzvQUhVNZ0LvAAr8IlBHit?=
 =?us-ascii?Q?iNtgDKzrOLHPbxVLFpE9sI37pIUAWSbQJf7kMBNjTNNSXftTMZsCCeotfHtU?=
 =?us-ascii?Q?KNZ9Hj2SVPvdGEYQ7b4ZFwPaqyOflDO9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n0Q+m6ix/uibui6cdPy1Z/L5pk2GZBC6EEIpiqidB1I4eJiosv1egt4yy6lI?=
 =?us-ascii?Q?QSoi5edjTkynuFKBLuVSpUMfcQj+HZQrmjNmdQS6eG23qMkexMS6fQ8ttBoO?=
 =?us-ascii?Q?IzoQ1NdnTA9siDVWbT+Z7DGbZtk4no7FXitU+C8l6DCZLYC5G84BsZ2uthZF?=
 =?us-ascii?Q?5tJB6Pys5lkRVCQMcaZfaxOR7ZS70SI3WgmZ++1+CEmY78CYwxu5809GjTno?=
 =?us-ascii?Q?l9sq/AgpFLrfR3wJGdM/b8KO83UAE7eGXZkXQIZk92y+2/AjdI6rwGYDfPhf?=
 =?us-ascii?Q?V+rDbZ79jZhUuGF9PvldD3NcWoZgt2z7tOYduD2DsRfPBbT8HrGuA7kZBPOx?=
 =?us-ascii?Q?wpjtl7sfI+O6gOhS627rdzrXVQw9hhvGubFUk1uYIfZjq8qThxVdqO5qWuqX?=
 =?us-ascii?Q?Xp1MoqxL8kgtW9gt04SBCI96yI0MUR/TSfnB6Vrhu72ho3UIkIhvbbGYFNHQ?=
 =?us-ascii?Q?yQ4pL6JedmG2qZC6XdLT7c1mt5NqoUraHyuBbeyT/5PFvupvrmN27QNBRlsQ?=
 =?us-ascii?Q?kz/b9lb/uyicYzCK4kz/G1efyyWHgqlrI74eHqFzEepZzZK4Itnp68ApEIUE?=
 =?us-ascii?Q?YhoNNlHNZcy1DhdIn2qKGaZfs/EcpOlc2HWiKA+tR0sA9yOgx2UyaVCCkJlQ?=
 =?us-ascii?Q?xyyJWvOD5A9Ppk3vDyJmX53ZdshLcRvP7Uosw+g5YmxS73h6J2yfvpZf3J4P?=
 =?us-ascii?Q?LwnXHwoXMzCdslFU18i9KzzC5j4RYtoGEepZPj8bid8X7IDP21LgSNBkS6Eq?=
 =?us-ascii?Q?Yt2nSLrFNx8qm1/Z5TneTMtUpsyJ2O9Bel31bxXWXUhGEoG458ghtEkFv9Jc?=
 =?us-ascii?Q?N91C+J1LM1yln8eodwHTDTYsRDVylbFePQVfL6siizaHPcUb9481Sqeweage?=
 =?us-ascii?Q?u3GEp8tX5BP3Lzeyb4xqSg942WTkx5lmDdVtPQofZM/34NAwDCBU+LImUjF1?=
 =?us-ascii?Q?sNHOP0qsCyEAbyjVRbfujpTn25aTc347pUvS9ixT1c9ZY0rgjRD8Gp3hcBtf?=
 =?us-ascii?Q?aEeXeZdpT3O3Q2L+Bog12AAUiy8j44ioVrgTMQ2TreKuFBzxc5sM1c6fzxFC?=
 =?us-ascii?Q?C9vJqMLfBaScCEc5KqSq+3IQMqJ1pDBNHBd1rtHy1rSMBL3CfXbrM7q2hJp1?=
 =?us-ascii?Q?4AsDgRRNSxTgzUX0fTtIw+yhsPPRLaIKeDsPOyr0r4Bruq2QfRFXry0Cz2at?=
 =?us-ascii?Q?U8/KEHMnntSLfk1mQhVjsHhjXYvQ8hkv2tsYyXAAaQYTUwJQW90Pyi0uYJAa?=
 =?us-ascii?Q?TcTx+FsReIzb6fRdhkKuvSUHT4Dvcdub/OGzZSj3jEU/cNwSXf/1++wDJpRj?=
 =?us-ascii?Q?pEzDFt4Hkg4ZFJgyUJ9HZ5xecKMYAxoOoqyS0T0SlROnWYh0os8Fdfqlha5u?=
 =?us-ascii?Q?72lggl1f10uMPK2Fjwa0b1bg0zOTRNscybc5DYquuEIXz9JCDuWmuwvsR1KA?=
 =?us-ascii?Q?eoYMlwDjjttDgskrSUog+VIGcpyn2TYzKphlecv/42W9pNMLbtQJwfThrD7A?=
 =?us-ascii?Q?u6TVbaRKwInN0BXmkh+KcfKE8sWo5rJa943N/C3FX+bXc6AeMXVGZkaOKZUs?=
 =?us-ascii?Q?Ded2Jb1RpytLkQZ+DIYVUaDXeYNnmu4oE7o4Ex1eGBP8QpHzmhDM1e6CbUgp?=
 =?us-ascii?Q?iw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 80160c19-57a1-4691-4fa7-08de05ed4a6b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 22:03:04.8692 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9gdC0wi9YNuteZap5y24dOf0l14EoT4LlnYNeVTo+zMcazKn8fwLNCRakaeLE4B7Xw4teDVAeVNdIDHEbkfLE6N3d1bU8YmUks1JGj9gcpM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7193
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

On Tue, Oct 07, 2025 at 01:48:33PM -0700, Matt Roper wrote:
>The number of virtual address bits is something that should be tracked
>at the platform level rather than the IP level.  Even when mixing and
>matching various graphics, media, and display IP blocks, the platform as
>a whole has to have consistent page table handling.  This is also a
>trait that should be tied to the platform even if the graphics IP itself
>is not present (e.g., if we disable the primary GT via configfs).
>
>v2:
> - Drop the default value of 48 and explicitly set it in each relevant
>   descriptor.  (Lucas, Michal)
>v3:
> - Drop an outdated comment about default value.  (Michal)
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_pci.c       | 21 +++++++++++++++------
> drivers/gpu/drm/xe/xe_pci_types.h |  2 +-
> 2 files changed, 16 insertions(+), 7 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 3f42b91efa28..69ed987fef67 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -52,13 +52,11 @@ __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
> static const struct xe_graphics_desc graphics_xelp = {
> 	.hw_engine_mask = BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0),
>
>-	.va_bits = 48,
> 	.vm_max_level = 3,
> };
>
> #define XE_HP_FEATURES \
> 	.has_range_tlb_inval = true, \
>-	.va_bits = 48, \
> 	.vm_max_level = 3
>
> static const struct xe_graphics_desc graphics_xehpg = {
>@@ -84,7 +82,6 @@ static const struct xe_graphics_desc graphics_xehpc = {
> 		BIT(XE_HW_ENGINE_CCS2) | BIT(XE_HW_ENGINE_CCS3),
>
> 	XE_HP_FEATURES,
>-	.va_bits = 57,
> 	.vm_max_level = 4,
> 	.vram_flags = XE_VRAM_FLAGS_NEED64K,
>
>@@ -108,7 +105,6 @@ static const struct xe_graphics_desc graphics_xelpg = {
> 	.has_range_tlb_inval = 1, \
> 	.has_usm = 1, \
> 	.has_64bit_timestamp = 1, \
>-	.va_bits = 48, \
> 	.vm_max_level = 4, \
> 	.hw_engine_mask = \
> 		BIT(XE_HW_ENGINE_RCS0) | \
>@@ -174,6 +170,7 @@ static const struct xe_device_desc tgl_desc = {
> 	.has_sriov = true,
> 	.max_gt_per_tile = 1,
> 	.require_force_probe = true,
>+	.va_bits = 48,
> };
>
> static const struct xe_device_desc rkl_desc = {
>@@ -185,6 +182,7 @@ static const struct xe_device_desc rkl_desc = {
> 	.has_llc = true,
> 	.max_gt_per_tile = 1,
> 	.require_force_probe = true,
>+	.va_bits = 48,
> };
>
> static const u16 adls_rpls_ids[] = { INTEL_RPLS_IDS(NOP), 0 };
>@@ -203,6 +201,7 @@ static const struct xe_device_desc adl_s_desc = {
> 		{ XE_SUBPLATFORM_ALDERLAKE_S_RPLS, "RPLS", adls_rpls_ids },
> 		{},
> 	},
>+	.va_bits = 48,
> };
>
> static const u16 adlp_rplu_ids[] = { INTEL_RPLU_IDS(NOP), 0 };
>@@ -221,6 +220,7 @@ static const struct xe_device_desc adl_p_desc = {
> 		{ XE_SUBPLATFORM_ALDERLAKE_P_RPLU, "RPLU", adlp_rplu_ids },
> 		{},
> 	},
>+	.va_bits = 48,
> };
>
> static const struct xe_device_desc adl_n_desc = {
>@@ -233,6 +233,7 @@ static const struct xe_device_desc adl_n_desc = {
> 	.has_sriov = true,
> 	.max_gt_per_tile = 1,
> 	.require_force_probe = true,
>+	.va_bits = 48,
> };
>
> #define DGFX_FEATURES \
>@@ -249,6 +250,7 @@ static const struct xe_device_desc dg1_desc = {
> 	.has_heci_gscfi = 1,
> 	.max_gt_per_tile = 1,
> 	.require_force_probe = true,
>+	.va_bits = 48,
> };
>
> static const u16 dg2_g10_ids[] = { INTEL_DG2_G10_IDS(NOP), INTEL_ATS_M150_IDS(NOP), 0 };
>@@ -265,7 +267,8 @@ static const u16 dg2_g12_ids[] = { INTEL_DG2_G12_IDS(NOP), 0 };
> 		{ XE_SUBPLATFORM_DG2_G11, "G11", dg2_g11_ids }, \
> 		{ XE_SUBPLATFORM_DG2_G12, "G12", dg2_g12_ids }, \
> 		{ } \
>-	}
>+	}, \
>+	.va_bits = 48
>
> static const struct xe_device_desc ats_m_desc = {
> 	.pre_gmdid_graphics_ip = &graphics_ip_xehpg,
>@@ -303,6 +306,7 @@ static const __maybe_unused struct xe_device_desc pvc_desc = {
> 	.max_gt_per_tile = 1,
> 	.max_remote_tiles = 1,
> 	.require_force_probe = true,
>+	.va_bits = 57,
> 	.has_mbx_power_limits = false,
> };
>
>@@ -314,6 +318,7 @@ static const struct xe_device_desc mtl_desc = {
> 	.has_display = true,
> 	.has_pxp = true,
> 	.max_gt_per_tile = 2,
>+	.va_bits = 48,
> };
>
> static const struct xe_device_desc lnl_desc = {
>@@ -323,6 +328,7 @@ static const struct xe_device_desc lnl_desc = {
> 	.has_pxp = true,
> 	.max_gt_per_tile = 2,
> 	.needs_scratch = true,
>+	.va_bits = 48,

as a follow up, maybe do a s/dma_mask_size/pa_bits/, so it's easy for
people enabling new platforms to reference e.g. bspec 70817 where they
are noted as "Virtual Address Range" and "Physical Address Range".


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

> };
>
> static const struct xe_device_desc bmg_desc = {
>@@ -338,6 +344,7 @@ static const struct xe_device_desc bmg_desc = {
> 	.has_sriov = true,
> 	.max_gt_per_tile = 2,
> 	.needs_scratch = true,
>+	.va_bits = 48,
> };
>
> static const struct xe_device_desc ptl_desc = {
>@@ -347,6 +354,7 @@ static const struct xe_device_desc ptl_desc = {
> 	.has_sriov = true,
> 	.max_gt_per_tile = 2,
> 	.needs_scratch = true,
>+	.va_bits = 48,
> };
>
> #undef PLATFORM
>@@ -584,6 +592,8 @@ static int xe_info_init_early(struct xe_device *xe,
> 		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
>
> 	xe->info.dma_mask_size = desc->dma_mask_size;
>+	xe->info.va_bits = desc->va_bits;
>+
> 	xe->info.is_dgfx = desc->is_dgfx;
> 	xe->info.has_fan_control = desc->has_fan_control;
> 	xe->info.has_mbx_power_limits = desc->has_mbx_power_limits;
>@@ -713,7 +723,6 @@ static int xe_info_init(struct xe_device *xe,
> 	}
>
> 	xe->info.vram_flags = graphics_desc->vram_flags;
>-	xe->info.va_bits = graphics_desc->va_bits;
> 	xe->info.vm_max_level = graphics_desc->vm_max_level;
> 	xe->info.has_asid = graphics_desc->has_asid;
> 	xe->info.has_atomic_enable_pte_bit = graphics_desc->has_atomic_enable_pte_bit;
>diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
>index 9b9766a3baa3..796439571abe 100644
>--- a/drivers/gpu/drm/xe/xe_pci_types.h
>+++ b/drivers/gpu/drm/xe/xe_pci_types.h
>@@ -30,6 +30,7 @@ struct xe_device_desc {
> 	u8 dma_mask_size;
> 	u8 max_remote_tiles:2;
> 	u8 max_gt_per_tile:2;
>+	u8 va_bits;
>
> 	u8 require_force_probe:1;
> 	u8 is_dgfx:1;
>@@ -51,7 +52,6 @@ struct xe_device_desc {
> };
>
> struct xe_graphics_desc {
>-	u8 va_bits;
> 	u8 vm_max_level;
> 	u8 vram_flags;
>
>-- 
>2.51.0
>

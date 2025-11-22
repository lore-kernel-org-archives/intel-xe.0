Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A91ACFD2F3
	for <intel-xe@archiver.kernel.org>; Sat, 22 Nov 2025 21:48:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A857A10E0AB;
	Sat, 22 Nov 2025 21:48:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YAG7VPhR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C2C410E011
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Nov 2025 21:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763848116; x=1795384116;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=YoAvIElGa1R8vISec+upJa3GNxXs7JPfrbKyXsCCDV0=;
 b=YAG7VPhRhf64Zzv2qZoj3GXkcYM6VwFqg7WFJdHj1LlGQMWzKij9YnXP
 nqEIdwPZzEKp1yq+tSwKELidShqx334PlP9jbxaFmZinUppDi01+ytwET
 X1x1fphW1mSEy43YapiMXTx4tDr5spUHEKVlkqL26nG8m87wC5RioZSWV
 DdJrbKtoyFhtIgV+t5zFrZvyq8SYV3m/d8+gSr5p8ZTxg3crQhWXPQNoG
 Qpb+3ola8K08BXMBWSTQKwmTVL6BoTo8b/Mlrte1uWo2LuAYhdkDZXXGT
 Tdb41ZWuVWL81YmFcMb1JmGMgXF0KRuq2BXLha649lB/p7Xf1PfWcBjoJ A==;
X-CSE-ConnectionGUID: WvqhI/sASzGokN1fz4W+kg==
X-CSE-MsgGUID: SHEEu9g7TJaDDkvqdSHJag==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="64907289"
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; d="scan'208";a="64907289"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2025 13:48:35 -0800
X-CSE-ConnectionGUID: /R4R9+MnTnyQzTDl4AbkFA==
X-CSE-MsgGUID: d/4LeaznTCaiHUfn52blvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; d="scan'208";a="196276122"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2025 13:48:35 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 22 Nov 2025 13:48:34 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 22 Nov 2025 13:48:34 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.15) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 22 Nov 2025 13:48:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nBtzlK1uKwJdP8ognSbbgDLTIMAqBGyV4OLOYVm1dXlGj3YHluBiDGppb77hUB6udlhDW5K0db2NGjLnUoiGsuwVGrI4t+q/HoAvVrIvvd101s7sRySv2JCmzg4ZPigx32BH9MTTY5sNd2MKZpFs2e/1LT8x5FWE++s97FrmvoL5+AzZgHdnfz7dVj2pU1i3R0zYc5Y7Ev6+IYOJtsrvYI3fb0+HV2PIrgH52PVrpxzfnFkpQvwIaajP0Yx2ce7xxHpVpI2Rn/Lpm03MkgK6URvF+C4x597yuF8S8y2PHGvgm7iQiEHAGFMDoyXhCOMQuZisvFRUu0wYep2wmQCyHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ij2Y50Io42UW+gFVTX9+QPhzElq15a9fjMk4rBmFKBQ=;
 b=MrMI3mpyU3Ay5UwYlfzmBW8Dt61GmVTj+hwQpFDQ9Vp1FnsxhbQPP1JN4p+kbTUvApeXS9zmNq3+f6J6Jf4FXDtz0Jh+iIU0gJ1aBpcYk6s1brw3CCcDBDxNIGO+3I4hNWPhLyfmF4anbdCWjhs0ZcHcrRKzbB7PazNKi6Xt+SG0jaQO1vUeL0zvHfwAOCk86xwTLHzIYGHRc6BiRfZggOY01EQrKNry74BBit/DU8ATPOpFrIyHGqiqyVj6+3CGtPwJNhLTuR4cRplGQB5dz4EYps4oNYrC1kOJa4HnF4+l/gngiu3tDOlGjG/Pv5KOWJYM2OfFhOXaHVwxmHg/rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6286.namprd11.prod.outlook.com (2603:10b6:8:a7::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.15; Sat, 22 Nov 2025 21:48:30 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9343.011; Sat, 22 Nov 2025
 21:48:30 +0000
Date: Sat, 22 Nov 2025 13:48:27 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v4 1/5] drm/xe: Add helper to extend CPU-mirrored VMA
 range for merge
Message-ID: <aSIvq36LRavT9+Ba@lstrano-desk.jf.intel.com>
References: <20251103060957.957760-1-himal.prasad.ghimiray@intel.com>
 <20251103060957.957760-2-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251103060957.957760-2-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR03CA0219.namprd03.prod.outlook.com
 (2603:10b6:303:b9::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6286:EE_
X-MS-Office365-Filtering-Correlation-Id: b9a204bb-a6e4-407f-bbc9-08de2a10e00f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?yTh6YaIzv/8WTASOszmBZpQ3OYlXTSkKFYeyB7aUxrO6Q/izpPcvG8R/z8?=
 =?iso-8859-1?Q?nsdeHzpH9Rko/p5NXrGbgcnflLL3O4jcGxI38p4UL7kKIu/xZE04p0vbih?=
 =?iso-8859-1?Q?hb0feyRRpCl8oLZ67Rz+4638gQ+1ss0htugYvMz4QkNjVRlEHBRgZx0GMX?=
 =?iso-8859-1?Q?V80uue5E9Bu4rpQCNaZi6gDfsR0Et2LsNLr3GAMMmCk7vB+Iq3hmvHQYTv?=
 =?iso-8859-1?Q?jvQKP8xDoTVuB1aNVnGdYvFJ0rfoUTEc+rxMmORJoxrc4y1JwvGj2GUlww?=
 =?iso-8859-1?Q?PEQFtQXTHkuVdBPKdpHu+j+PUH8dycNXJS82fmAQQp0Ox3wliInU7qGK7K?=
 =?iso-8859-1?Q?fCxoJlUWXFlf1JtudfjLr+WEEQdXCh1GEmrLs2+MPVX4CBIce8rmA15DcW?=
 =?iso-8859-1?Q?qsBgU6sApI0DHixZC/OCo2k6bJZAM8iYZOyx9iAcdNsKrQ0nMZcZBaDdx+?=
 =?iso-8859-1?Q?8kwmFZEbAXktvH40aHvM0kr8QYxm1Yv3L35Tys7l0YdWClAnIYz39hLNkr?=
 =?iso-8859-1?Q?oKSbVkSSbLs1FkDS0BbIvDeAlQkekgS5CIkRBszDdjUcFEOfWJ3HM3o9Hb?=
 =?iso-8859-1?Q?ZBdBr+zTaO8VRBBPAERJRgmoYGkG2CACEjnkBM87CyYk/hXA8lxfXHqUVp?=
 =?iso-8859-1?Q?j0rTByzqxKu0DQy9WuQlbwA+5XE20jtjrsq1gAVJW3uPGZHuD5j0EcAJAs?=
 =?iso-8859-1?Q?mbn8rnKesQR5wxsPaG/kC5fon1AFzACBK4XspkHvzheIPngYOheNePRMqh?=
 =?iso-8859-1?Q?DgjJskcSRTnWX2Wrk2/uTp6j54BfyX3NGo+oUNQYEh3jcMcINv6JQLh5LC?=
 =?iso-8859-1?Q?Nu7b7qKA5Juss/w9q23En8ogUcF5Wr3McYTTmRFPx4FBXYpKqYAKG/O12S?=
 =?iso-8859-1?Q?BWvgIORvvF9YBGR0NqQAInhuD54rj+C0O40H0mhHj+nhR/ENygwvdjMmn0?=
 =?iso-8859-1?Q?LIoLumX3d1kHvIYTZLm3nYd2i3CjzPkwm53CFD/s7q0LiLpEQ594cnMF+w?=
 =?iso-8859-1?Q?TAt3ZlXYDgNPT7hpj/vEhXUHGTSPyNyUrUXWO/lhaPrjQVom2x/5QX+V0V?=
 =?iso-8859-1?Q?wYGiKqxN0VF+RHGCW30G14VwT83m3oXhWq3zRQEA5hKueSgROVTCPs4A1F?=
 =?iso-8859-1?Q?RHk1Knap12znWos/haTHDLklT1Uzdc8jxUQ1TC9uFeTvtzZdc1YpVARw/7?=
 =?iso-8859-1?Q?NySkcyTCL79DG4OoESgWaz6YUK17VnHvf/uL1j7AMmbQ3pPYfxMlb2H1Kw?=
 =?iso-8859-1?Q?e25D+9uKe2PSmYrnLn52hqWkk2rz+dPlq19Jne6+i5dyldRjJrfSbIU2lD?=
 =?iso-8859-1?Q?T9ajdLb2SBfkyqQQBjB4ZHN4BepTxTU54pqthLWSeZTHXbZB02NqZv3hwZ?=
 =?iso-8859-1?Q?4SGQ6iQZN+y3v0zjnd1cOB4nTHmzt5WS4W2b1hLlp3/Qj3HEvSDO3aJlxO?=
 =?iso-8859-1?Q?Al//4wq4k0h2U5E4enF6NpVE/gnrT7xQb5v8+uZQLkxHSlfB+E5UkulTGl?=
 =?iso-8859-1?Q?Tx9ribjWe+1m2ZCF0m0f0y?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Rb32boCKtlfvYbnGQ8XURZIsWcIszc8yYln2YXqKTbWvTZ2Gf8tSly7QuN?=
 =?iso-8859-1?Q?qr2zimvtXmZj1GkF/wMurfFLVyjdoj8847nUc85mYkf1/sbiZ9Idlgq9iR?=
 =?iso-8859-1?Q?4BReCa8GdJTqSkwlH4CiFlu2E/wtI0KTpQhzRvsIsd3mIIy+5SBqBpHbUA?=
 =?iso-8859-1?Q?H/WsRM6p7w7N/twJXmrXQuXw3PZXCEK6HOk+YiWL6RERoVlyMScaOz9kbJ?=
 =?iso-8859-1?Q?7+cTThZCsbFiXRtqLOlkCZmTUu5rGVwuSQHHpkmRTWRLzdl/ogyccsbIoo?=
 =?iso-8859-1?Q?dIupQsZyLJIX/d8NabNA5Wn+2BOovZdQxvvenF0VXulx2apMvLjieMeesV?=
 =?iso-8859-1?Q?R5fQ3gJrTTF94IOXtWZJ8RvpBAp7YBKE0kiwWwVpAhGw9Lv4FErc+x6E4u?=
 =?iso-8859-1?Q?4dqtBR3nk2Z7oagxw5MH41pYWZSfSVGTmLp76TbT1DLPtfuUCqmVXRW9NM?=
 =?iso-8859-1?Q?n9IB/jaNHJBIzXCn0MwxZ0TfXqX3cRIkD+NjPn5NaqtA7y1Xna+DLU5Pgl?=
 =?iso-8859-1?Q?i7QHoOQ3sYT4idNzvI5VqIeuW62d9QCSKhg+fvWKQSk5wGKozvYalx5xo2?=
 =?iso-8859-1?Q?B/t5S7XTMKpvxzwOXmzaQ5bsXaVpdi5HOQwQ77t73YWMgYEKRb5czx9Zpv?=
 =?iso-8859-1?Q?ak3N8xXflw1SU1dIjpblzEh2iNA2LcZjmItFzF1df3y47aO4T0mgjABTBz?=
 =?iso-8859-1?Q?OlIEduW2bsEDf8FNk31XAzTu9PL79n3x74ME8XXJY6npPQWgOxMGEcBedm?=
 =?iso-8859-1?Q?e+NOwZexaYMqfZsZUKpO3/7XPgyGjFqX7wkkdgZKFeRaSNjUKzjrrPDSaD?=
 =?iso-8859-1?Q?RtGhNVRe9NGfhYYp98VlPJxcK+k5RvauqGQliGfdTv4Q3lU+HXs15iQ19b?=
 =?iso-8859-1?Q?fzj2RMUrUbo4Ox76fDgsvxYGPTsVXEA/gyDdq1sQDgNnUWQaXQ8gFQPCmD?=
 =?iso-8859-1?Q?yrJI1bXchAuPHlJsJuTN2xfofANJ1MLFWmeiCnIAsQwanF92toudqz11Ea?=
 =?iso-8859-1?Q?Eg1v8SvlIVjBQq5dCf/EUXzK7D8aboWiYbB2uN1Of2qXLlWeteNh1R7Agn?=
 =?iso-8859-1?Q?/DISwIvQr9PAbgT4UMwRu98H6ZIBrnmOw9rVz/3FMgRgHezmx2EqJH43dg?=
 =?iso-8859-1?Q?Ya4F9wf8bv3IBrZK9Im2MS7cii+pkMXzzYABDNtlncuH2cLl6fNRk6BpvJ?=
 =?iso-8859-1?Q?gpY2XodxF2lBKnO9h05BKEP3S5hB0FP4l5Impyr8tDuaACzaKElaIjvfxP?=
 =?iso-8859-1?Q?OolRKnN+uGUeQ7mHNOGto4GEU1f9fzx5zUuSk8V9D+Qsrt6mYs9smUHOeS?=
 =?iso-8859-1?Q?fDLrkTOOS/ZzF1VHTcqBPmlCfliiu30olcvrvCRPLfj6asIgAFEb/u0IxI?=
 =?iso-8859-1?Q?p83KbUiFtSPuBCdT96NCSj8hh5ltU8ZzplWDFbINaltgNhlkNZUsoDOusA?=
 =?iso-8859-1?Q?NrVFsJOSSD1q8vMiQV3EPSMWSkO0APNn2IJfToL7uljzOmMtWzHEy11Ld3?=
 =?iso-8859-1?Q?r+IA45dXwbm2FNEZeF93iGhipdyZoD6gx8APQ0FqmgyhAjcAzMTmlbta+j?=
 =?iso-8859-1?Q?KlDB3Y7a59T7EMOyhzpNlx1K6LTYldIgHJ9b4bzSLwHajC1k3V50o63CY4?=
 =?iso-8859-1?Q?DYEfA0GCRmNH0UrJhNMHJWUzW9Om1/w/aKnjh7Ti98jQkocLTCsJav8Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b9a204bb-a6e4-407f-bbc9-08de2a10e00f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2025 21:48:30.2540 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l92x5/7JDm4XUYaUCv2UlhRXt+MO/HHLJXGeKUHRs3S9eYIMYLxOjAi9jpj5dk8as0KAS6eEabaYacNiq3AJ/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6286
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

On Mon, Nov 03, 2025 at 11:39:53AM +0530, Himal Prasad Ghimiray wrote:
> Introduce xe_vm_find_cpu_addr_mirror_vma_range(), which computes an
> extended range around a given range by including adjacent VMAs that are
> CPU-address-mirrored and have default memory attributes. This helper is
> useful for determining mergeable range without performing the actual merge.
> 
> v2
> - Add assert
> - Move unmap check to this patch
> 
> v3
> - Decrease offset to check by SZ_4K to avoid wrong vma return in fast
>   lookup path
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 41 ++++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm.h |  3 +++
>  2 files changed, 44 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 00f3520dec38..944eb35bb2b8 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -4363,6 +4363,47 @@ int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
>  	return xe_vm_alloc_vma(vm, &map_req, true);
>  }
>  
> +static bool is_cpu_addr_vma_with_default_attr(struct xe_vma *vma)
> +{
> +	return vma && xe_vma_is_cpu_addr_mirror(vma) &&
> +	       !xe_svm_has_mapping(xe_vma_vm(vma), xe_vma_start(vma), xe_vma_end(vma)) &&

Why do we need the xe_svm_has_mapping check? I think it ok to merge to
VMAs even if they have SVM ranges within the VMA as VMA should be fully
disconnected from the SVM ranges.



> +	       xe_vma_has_default_mem_attrs(vma);
> +}
> +
> +/**
> + * xe_vm_find_cpu_addr_mirror_vma_range - Extend a VMA range to include adjacent CPU-mirrored VMAs
> + * @vm: VM to search within
> + * @start: Input/output pointer to the starting address of the range
> + * @end: Input/output pointer to the end address of the range
> + *
> + * Given a range defined by @start and @range, this function checks the VMAs
> + * immediately before and after the range. If those neighboring VMAs are
> + * CPU-address-mirrored and have default memory attributes, the function
> + * updates @start and @range to include them. This extended range can then
> + * be used for merging or other operations that require a unified VMA.
> + *
> + * The function does not perform the merge itself; it only computes the
> + * mergeable boundaries.
> + */
> +void xe_vm_find_cpu_addr_mirror_vma_range(struct xe_vm *vm, u64 *start, u64 *end)
> +{
> +	struct xe_vma *prev, *next;
> +
> +	lockdep_assert_held(&vm->lock);
> +
> +	if (*start > SZ_4K) {

*start >= SZ_4K

Matt

> +		prev = xe_vm_find_vma_by_addr(vm, *start - SZ_4K);
> +		if (is_cpu_addr_vma_with_default_attr(prev))
> +			*start = xe_vma_start(prev);
> +	}
> +
> +	if (*end < vm->size) {
> +		next = xe_vm_find_vma_by_addr(vm, *end + 1);
> +		if (is_cpu_addr_vma_with_default_attr(next))
> +			*end = xe_vma_end(next);
> +	}
> +}
> +
>  /**
>   * xe_vm_alloc_cpu_addr_mirror_vma - Allocate CPU addr mirror vma
>   * @vm: Pointer to the xe_vm structure
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index ef8a5019574e..361f10b3c453 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -68,6 +68,9 @@ xe_vm_find_overlapping_vma(struct xe_vm *vm, u64 start, u64 range);
>  
>  bool xe_vma_has_default_mem_attrs(struct xe_vma *vma);
>  
> +void xe_vm_find_cpu_addr_mirror_vma_range(struct xe_vm *vm,
> +					  u64 *start,
> +					  u64 *end);
>  /**
>   * xe_vm_has_scratch() - Whether the vm is configured for scratch PTEs
>   * @vm: The vm
> -- 
> 2.34.1
> 

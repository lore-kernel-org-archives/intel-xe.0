Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C0FCFD2E3
	for <intel-xe@archiver.kernel.org>; Sat, 22 Nov 2025 18:31:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E4BC10E04F;
	Sat, 22 Nov 2025 18:31:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JdOb9zLE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EABC310E04F
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Nov 2025 18:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763836287; x=1795372287;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zQDYEIS/20UpTJGsyboKzlGuFHu1ayBRg/2g2t03Gto=;
 b=JdOb9zLEWsITbcLZm+vbuX2eZ+huvfr4JB0A8LBp0YAQpexDJABjrWVu
 fCah6Mu4TUGOd1mz0ZzQv0X6WokHjS+aB1hsYG9rtQlJOIMdPAe4O44F9
 hZP6EmmU6FQ8tfNMKfDnncG/jjw/fwovIcIKNkqe4lpQyVe47XWg5zCDy
 CwOkh5Loxv5+cWy7gzepnGKsYFbAPjHpbLd9S1nYJ9v5XBSPXXSchfxkW
 3nz28VGlTPp8B8ESCa8FBMcDBDMGMTEqeqzjP1np/3ZixU4I8Qgz+xCHV
 mFjUGkr1Vbog6tC4JRbVifIppcYZFpsV+vBkeSCSZBuc9K/OLyB826ZO6 Q==;
X-CSE-ConnectionGUID: A+nmzyLtQWSd/eTHTczDjA==
X-CSE-MsgGUID: 8laQgwIOQ2GEwdeO6ogI5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="65943091"
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; d="scan'208";a="65943091"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2025 10:31:26 -0800
X-CSE-ConnectionGUID: 32G57bTYQW2iXVZ7oFVsxQ==
X-CSE-MsgGUID: 90XkJt/HQAqnpUEsng9J2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; d="scan'208";a="196125900"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2025 10:31:27 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 22 Nov 2025 10:31:25 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 22 Nov 2025 10:31:25 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.15) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 22 Nov 2025 10:31:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D7yZSKttrq/I493ahMutiapK0gCLDX1PtK0LhZic7qLOum8GTfWb5qSaYXjgd8498GJ5mfaGUUoj3kQr1hfAqHEp14wAnG2gV9mbG8BH5pB6HhHsDN9rBAKDjpQqm7W1ke92xmDnJrBc6dsNCDYAnjk0ZluqD2XptOlirBO78QGim595N2cfiA3tlw2POhMnyxlItaWyF1gRlY2YxIzwA8kScylJ/Lo4EPdNdwI2OykMsungwHXbMsR9GIsda1/rh+muLQHfwKlTcPHlfpfZlU6ZR/jMoCCNYafXKbJ0aeU5PAm1TofB7nQCCX3pUNmo8h9KB/u44Pmulz7zltpk3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3lNJagSrup/V+jb7myryIxBrE6E38cMQ73kyJUhelKw=;
 b=eAbjRqfULVrdIhTDbFhB6+tcK3nRGRREVlbBS63Vn3vVkBtvu0Qvi+HR7fiYW10LKeNQFQYiC0bP+JS/FOt2EjkhgzX5pDkyqZ397hYcnLs9hppeuoC8uar62qGcDSnew9e+EPvBDTXI4L2KKKLRUzyJpKdj2R8iIntX4K+0yQtoL2SE2jbAUtO9uZF6HthTEvYQtort4GzgEng3iDxDAf9btekocyd6nP0Ykc3hKAvcng/IKUydXaaiD4FbwjkS8fS9R6wgRDVhkYhihlMsX70eqSVmCf7FWsOuqOz0Q+aqkOJpMlrBd8muKGgvLZpkf2MHdhQDYdjAErMGCTWu7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM6PR11MB4674.namprd11.prod.outlook.com (2603:10b6:5:2a0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.15; Sat, 22 Nov
 2025 18:31:24 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9343.011; Sat, 22 Nov 2025
 18:31:24 +0000
Date: Sat, 22 Nov 2025 10:31:21 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Brian Nguyen <brian3.nguyen@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <tejas.upadhyay@intel.com>,
 <shuicheng.lin@intel.com>, <stuart.summers@intel.com>, Oak Zeng
 <oak.zeng@intel.com>
Subject: Re: [PATCH 04/11] drm/xe: Add page reclamation info to device info
Message-ID: <aSIBeYBaUkyHUG6a@lstrano-desk.jf.intel.com>
References: <20251118090552.246243-1-brian3.nguyen@intel.com>
 <20251118090552.246243-5-brian3.nguyen@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251118090552.246243-5-brian3.nguyen@intel.com>
X-ClientProxiedBy: MW4PR03CA0186.namprd03.prod.outlook.com
 (2603:10b6:303:b8::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM6PR11MB4674:EE_
X-MS-Office365-Filtering-Correlation-Id: d8cf1c69-1ce6-4b3c-093b-08de29f55712
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?51IuWI5jLTJFC4XxmmaPDRdmliK4xPvhRx2Us7rjN5Ozoz4FpKRVNILU0rbz?=
 =?us-ascii?Q?RLjd20Fz8PxEeIAcLHxL2vYIubMjEsGJwzB8H1ekkuTHl0nm+j8cZNMzaVHp?=
 =?us-ascii?Q?FDdEcg57FIdbK6ME/MxcjKYM+350sVMUx2ZVew/A/wbTlUxv7Sb9ubPPrQEm?=
 =?us-ascii?Q?twPP/1ntN66ngQoqPUJvlQEs8PJrI5qSx7bsPP6duN41LEW9Dkeq7fuTwT/m?=
 =?us-ascii?Q?Kw3gw+wTt4SH7f131IBltmf+3QwzqGO9ArUs4NQPQBFcfRvczrQo+IV7IlYD?=
 =?us-ascii?Q?bT6xyN3wfzGu2PDtHUePkte47PmMDmDkY7biiYea4JJwiMKtL5l90XAIQH8y?=
 =?us-ascii?Q?cQG5uswCOjBSItSzOVDET2e1Q0Dq8tPFPJdTTiimj8TvSdgZKEuS1lZ3xUmt?=
 =?us-ascii?Q?c/bpXatTSPUmK5DyxJqepftunEylr8znebYxA8Pw9rvPN5w9/RQrJJGILbtY?=
 =?us-ascii?Q?N4bHUJ9IhB3YciCXI+bOh7dcppdJ1HpA4jx3a2JYFCAdYRufO/EnOCXohzLs?=
 =?us-ascii?Q?PENowB9dQIuoPm4vCD/nBaZJ81Ex3rQhQOg+e3xo76vtLetKmMI0upu0s6Tz?=
 =?us-ascii?Q?sKW3keQr/qYeYdrYQzhpYOTBvZAiaQdYfDnOWQfA5nemJLentl5BTz6lXvLP?=
 =?us-ascii?Q?HNXvMg2obXM98i0AZrHxTtcxkpQzRbbu/bJPH5pmqG1oqNYuQBBOnoBlwHsW?=
 =?us-ascii?Q?d+ASnIW5Gjirfl1isXVyz3qT0+RGuZvjBU6xJy0cymozotn1Jpz5nhwYCjlg?=
 =?us-ascii?Q?gC8y6MMw7zAF+x3tCdBbEBdhM3Cdc8s3F6a1SlayqQfsLSEGK62bTir2JZdq?=
 =?us-ascii?Q?d6hrhDyDaMmHeCde3pes+spx9zqWcKtAH7Adu9GsVOthHxAdxhwHCoFox931?=
 =?us-ascii?Q?4U67dlSVaKJZdu0nPIiIMKX/rxKsqeepfeEJ3I9X993gmCRl8OeHFz3eklKi?=
 =?us-ascii?Q?nGPjU9YPQ8K7o17V9jFthY0o4VYjf9RXs8XU1un6H6BdHGjCsiV86kt8kg/4?=
 =?us-ascii?Q?xC3PkpSLBr0XA97AkLW9k0+4f1goj5hjOrzh/kDVucV6YOxd69NqAJJPiGLR?=
 =?us-ascii?Q?1JU5OagUb7QgexDXgiO/y8iiU3p5X+znLlPSJnhE+YZC4LZe5cNZJMMUco5H?=
 =?us-ascii?Q?p9Mze+cAsPK4dDsO+jklKLsOcS81+fqFPOeWjWTVCg3SkaPdzlt3OcbMzvv1?=
 =?us-ascii?Q?IuxR3ct4oh1UJd1Fz/SBLmoJgAl/Kap1Ed0tim6IdOVAvQdcQW4GB2uA5Amb?=
 =?us-ascii?Q?rYYYf7kuq6jIVjXwz3IuPKa3mMlYTowiBoaUA8eiqpxENuOY1z8Ce36TSaHk?=
 =?us-ascii?Q?Meb9re3q8Vp4BlIkdhzb9fbRmNNpmZBWEw2QL7Hku0qmw5vmUiHprcMrWaUB?=
 =?us-ascii?Q?01mjg4Y4D9bRU/yRTRAYUfE4kq7kzZkXPZ4KTGr2nZaUlGseMpcRPevzOvvi?=
 =?us-ascii?Q?L5g9kslwB+KOX4QHKaf0zC1BiuZsZO1X?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YHd2MQbhFM4a0NROKU0g4248hMJIJ8Xgj05ZDxPyf+npYdUG+/RyPs51yKKB?=
 =?us-ascii?Q?7QiMt/YqSPx8/NCuKGFQCdY3pMIZiM6Ye2gj9VkiecedO674rL/holqBidKd?=
 =?us-ascii?Q?BxVwLIM72qL/AMMk8hy5ZxJXp7nzBB+EFA/IRBJ33PSE7FP2WGck7U6kgE+1?=
 =?us-ascii?Q?+t+8HoZTCmndXg3HYrPOBv0cj3OtX0hzWOBYHcDh4FfjqdRapbCjQMLhsf6n?=
 =?us-ascii?Q?mc8BVQ0gKVVbQ7PovTwOxurKKD4NXHUxNFoyrsowX6VaeLPHjY3cRyQgyDZU?=
 =?us-ascii?Q?ag7zx5nDN02R7EX1vUTLZavLqC2oRQfmzxVU/ByNuodu+J49I/XK68Px6wQt?=
 =?us-ascii?Q?oRjTIs9P6eZ5f/t8RuTS5AdE7Y3UsZxiAYEPxJM0VNDLtG0BUwwrCOXa43le?=
 =?us-ascii?Q?h4OJJnvgEW70/ZYAepFDx90WrNcHE9D+RdWbar9dmdAZDUGLGOSbXWDuJFZO?=
 =?us-ascii?Q?BYByfF74Zqalfr31a6v7SzfM1ul4o1OawE0DjFd+kgcqXxcru+IXK6ckv1xr?=
 =?us-ascii?Q?0qrIRyoxpdooIIB3+EjgBRkT5tdyf5EHkydZfnP+UECaVknhWyCnltxgVNCN?=
 =?us-ascii?Q?moHE80s0z5OOgJaqDsu8CIlS0Lu33peSDaJ0IJRR/KrmuZqA2v7KJGHOlnmO?=
 =?us-ascii?Q?MMx/JBFNJ7/cbAlLePXVasdxImOWWU/P/IiJ0BtYAyqPOsw3bTHWpw/6U1S+?=
 =?us-ascii?Q?SPfsJWNW6hfvq66LjzlQbK0YnrVpfk5gKMVkJhp9ewUlWkf5XPBAmDruB2La?=
 =?us-ascii?Q?9huM+vym+R9mbhhKatqTcy7bCnqekOOmj/n/hcnZ1C5keYZbiGE1LGMQfgN4?=
 =?us-ascii?Q?G4BZTxJIKBLNVzjjZQahiFQbJefs8mP01LSrIz9wMOJPj3wJOitXhxdzd0Et?=
 =?us-ascii?Q?sIBjwohogJH8qBg8O3nTaxk6Bq1GVTaAznId1s7yaKYXl72gqXWfTqe51zV8?=
 =?us-ascii?Q?3PR6rwc1TCsQuybN378SM1cbPCHJpsT352rJLQ3FClYqp/fWpPS4LTufaOeu?=
 =?us-ascii?Q?STRp6LgM8NmDLWST47MoQ/UXZSFOlNzoLNlW+9mwr7CpcKF0gbRDgWMuHTh8?=
 =?us-ascii?Q?CtUjEfaVN4b56NNCY/vhMgtQF7W0SJxp8guz9jveig/aPc88ZV/pbYhkPKM2?=
 =?us-ascii?Q?au8XAacjNB1OAnQI6HhGxRrKLICvP0RmD8jhYUjA3vDWTsB5s2oFSvDXwJds?=
 =?us-ascii?Q?1jFr68R98Laqdkg7vvuna4wFi0hywK4daTbNr/wgjVmDSjdrI2WOcEipJTVW?=
 =?us-ascii?Q?bX29zQ+K6iqNzYwXrksFxjCPT+uy6+AFjMyeDZSqo6USXU5wv8CEId9zBRO/?=
 =?us-ascii?Q?LD0zjv3Pn2ZCQEct0L8z6+QF3d9Xo9DZFxWvAtSCAZted8ztPnQgMnbO6Pnn?=
 =?us-ascii?Q?fu/UMmBGwxvcs6LvElfX3qN4amhHsDOTtMmqqzDKAwMpMTAJeZYU7uQV+VGb?=
 =?us-ascii?Q?Nr/LpvDDkH7CxYD3bpGl45RNbrAgd8g1ESgJ8vvu02AhmKNCvc5Mr7AO9I7P?=
 =?us-ascii?Q?jQ156F/a3ddZoUbUbdzckngGHMbYhLQ4+j9lv7WbEX7OdePF8Vr4CSZIfhm6?=
 =?us-ascii?Q?YJ3ToszL3+8ZoMM9CrzqXLtRijEPhfMuhqKUNbOv80qlSLvFjUX2l0bp6q38?=
 =?us-ascii?Q?vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d8cf1c69-1ce6-4b3c-093b-08de29f55712
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2025 18:31:23.8953 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vSyILwemboftrvPrNtutwXrJectgM3jqX0y5xFg/KbymaP8PGH0wWRMDVr8TdPl9/iOkPxrR9wyCbJZmaHrnOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4674
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

On Tue, Nov 18, 2025 at 05:05:45PM +0800, Brian Nguyen wrote:
> From: Oak Zeng <oak.zeng@intel.com>
> 
> Starting from Xe3p, HW adds a feature assisting range based page
> reclamation. Introduce a bit in device info to indicate whether
> device has such capability.
> 
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device_types.h | 2 ++
>  drivers/gpu/drm/xe/xe_pci.c          | 1 +
>  drivers/gpu/drm/xe/xe_pci_types.h    | 1 +
>  3 files changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 0b2fa7c56d38..268c8e28601a 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -308,6 +308,8 @@ struct xe_device {
>  		u8 has_mbx_power_limits:1;
>  		/** @info.has_mem_copy_instr: Device supports MEM_COPY instruction */
>  		u8 has_mem_copy_instr:1;
> +		/** @info.has_page_reclaim_hw_assist: Device supports page reclamation feature */
> +		u8 has_page_reclaim_hw_assist:1;
>  		/** @info.has_pxp: Device has PXP support */
>  		u8 has_pxp:1;
>  		/** @info.has_range_tlb_inval: Has range based TLB invalidations */
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index cd03b4b3ebdb..43c47426313e 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -673,6 +673,7 @@ static int xe_info_init_early(struct xe_device *xe,
>  	xe->info.has_heci_cscfi = desc->has_heci_cscfi;
>  	xe->info.has_late_bind = desc->has_late_bind;
>  	xe->info.has_llc = desc->has_llc;
> +	xe->info.has_page_reclaim_hw_assist = desc->has_page_reclaim_hw_assist;
>  	xe->info.has_pxp = desc->has_pxp;
>  	xe->info.has_sriov = xe_configfs_primary_gt_allowed(to_pci_dev(xe->drm.dev)) &&
>  		desc->has_sriov;
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index 9892c063a9c5..151743d4cf72 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -47,6 +47,7 @@ struct xe_device_desc {
>  	u8 has_llc:1;
>  	u8 has_mbx_power_limits:1;
>  	u8 has_mem_copy_instr:1;
> +	u8 has_page_reclaim_hw_assist:1;
>  	u8 has_pxp:1;
>  	u8 has_sriov:1;
>  	u8 needs_scratch:1;
> -- 
> 2.51.2
> 

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E10C27C40
	for <intel-xe@archiver.kernel.org>; Thu, 24 Aug 2023 14:12:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A37B10E552;
	Thu, 24 Aug 2023 14:12:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49F4810E552
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Aug 2023 14:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692886353; x=1724422353;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=/i3OVLlt5F0gSa1PdHMuRld/p8qm4+iSgCg9Ud5sZ3E=;
 b=RDnBnGggX1jlOA8m+iFX4BIbmSIno2OPZdxmpezsVSI7e0vkzIjh8lRH
 w8s6q8vPCqmMiM3mQcmeDuMxJNZQtSfR45hNQ6CFVpmdM3DqUD7dgiCE8
 oGlCysiWVv3C6iR4vrWeI/HExGTcb/sATarSHMOzPyqm9/9JsWZPainov
 iy7dVyGQrUDEQ+3+AutfpjUYV3tPB32HRElLoqPat3PdIy7eH6Oaf72nl
 79sEiBfDNsbAAP2MWbWfSy73Fzm3vIqeiBG67PAobfvGnHvSazugcUijg
 KB0/CjJN7pTB2mXEI27EvkmXomRJMXb57o8MTtvEa0l/9snDbbhe9crS1 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="373327805"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="373327805"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 07:12:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="686893142"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="686893142"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP; 24 Aug 2023 07:12:30 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 24 Aug 2023 07:12:29 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 24 Aug 2023 07:12:29 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 24 Aug 2023 07:12:29 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 24 Aug 2023 07:12:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c6kdttCe4NfLsk7bLyFRyHsIPf3VqhIgTk0FKbFsMn2U566w+LMEH9/GVIWAOeCdbgti0msPU0GvoOw3kiNnHL+hT5YVNXnVB3HUVySR7PSD/pNEIXXNG495U4B9XQ3J71txqhkIWgvHSWr6Hct0h/CWg/GdTsZ3z5XAiCfJSPSXjSadYZLUpeWFm72NN3FOV2ZPfuQkNM1tjNaVQYtuJ2C6/cSwkCXGKXGZx6gK0T6cSOi2WMAp4Gy0sM9NpQywcUKX+rhSdLWvrwc4aMwQJGb3BOVunm4kKuBjicWI21unBR3kNehKC8SF4em5YVi1zYbpZ7kmqfExOtEtOsju6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j9LIcVGv86otCwGZRvk/o8RUrJKjthnKih9tLfWA4OI=;
 b=TuMnwrgFuC4/3xGb4IsiCwz5BwnLCosUd8GGarToAci6ztv4imo+yTWIvQZZ0gjDgt6IZo6odkzvpv/fnQv0xUJHNpjwfOKyoaCG1LC38HM0rCBlRZndRzEPryUWzSXBwMl7CuDx2XzzWM70zQx2SvoW0wUNkIy/JrORHo98AYXzT05DTxAXynWK8gJ28QwCqxe/U5sD/9DK7/akpR15PpvEJT0mBdtHB331OwbqVK4WtqylKhcrW0G3SiGItPC3mQ9FT4u+8KSBFmPRwnsV7RdqRaYspAwZXXOm2N5qEGN/NPC1fuwajF0SBfGU+yLMBISXZS3PFDllrc+SuSnKPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by LV8PR11MB8724.namprd11.prod.outlook.com (2603:10b6:408:1fd::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Thu, 24 Aug
 2023 14:12:27 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::e76d:33ce:73f1:573d]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::e76d:33ce:73f1:573d%7]) with mapi id 15.20.6699.027; Thu, 24 Aug 2023
 14:12:26 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230823003312.1356779-3-matthew.d.roper@intel.com>
References: <20230823003312.1356779-3-matthew.d.roper@intel.com>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Thu, 24 Aug 2023 11:12:20 -0300
Message-ID: <169288634031.1481.3129214891409295762@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BY5PR16CA0025.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::38) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|LV8PR11MB8724:EE_
X-MS-Office365-Filtering-Correlation-Id: 258074e2-61f0-4c77-be62-08dba4ac24a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lGJhDU8orIV12X+7Qq5slrdQ4ZHN7iBQHSavsmQxBLvLJUnxe0pWkph+MUFwqWSXllmimvAfxcJOw8ido0IlEMA39+BjjpiV3q8iBI2M1+KocfJ7VIJhPz3Ozp7nvzb1CVTTa1wchk8GpZNqPRspVwMDV4xK4Dh72OyUDlA5H4ldVauGrinW1VWaGfvim+XkiR1dzaCHaCvVBM7wifVFQBLCS5gVgm33hPlEBMjCLmuGLRLWMC/04Zu9OQiav9dCuD6NrfMCBr0fZfW02OvQfQ8a0GuieoAazeBjqJj5NOEvJ2q6o8rVVBzFt4sKsFdCBaslCF1gjB9bL16I+cnvomAq5snuGyBnL1oMvPCsJRyuqzbiXno6VLcorAdeRMGoFQjDEPuUgrAXYxsiu6vzDYKdLdRRgVing5JCjgenvgyypHJknlZHr0n5KFx5FUSfwATy2C0YXRosKSK0QMLqwoXz6Bb+E1lchEQAEvXWFrwdF8Funh3BUo1TI24lPWLTVpWmEttnVeuOIqFcYaLg33afmIOHjHSVZ+3zCi2oo34MmY/EOq6Vu9vd8Tjy4THc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(136003)(346002)(39860400002)(396003)(376002)(186009)(1800799009)(451199024)(66946007)(26005)(83380400001)(6512007)(9686003)(107886003)(41300700001)(66556008)(66476007)(2906002)(316002)(5660300002)(44832011)(8936002)(8676002)(4326008)(478600001)(6486002)(6506007)(6666004)(82960400001)(86362001)(33716001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1k1KzNLM0Z0STdlcDlsUm1Cd3FnRE5iWktCSUdjako3WGFQNkkrWjNMUGpr?=
 =?utf-8?B?WGxvb25OWm9SRVNoUDVseUlSc2xpWkVqaEwvOG52TTFFTElsUlRBck51Tm9L?=
 =?utf-8?B?cXFPLzVpNkJRTDE1QkRMQmtHdTdjVFBNaWVDeUdpWlJJM2tvOHlCeTFUa3dX?=
 =?utf-8?B?YlU1YTBZbzk2K3YwU1RWMjhwQURzZHVBVTRuQkVmVTVtNVZpNmxYYW9DT2s3?=
 =?utf-8?B?ZWlzaU44QmpSWURwenpXUmJXNlpIZllPNzlGcEFZUkZlSmx6Tis1b2NRR1ND?=
 =?utf-8?B?UjBlbzNFZnlyNFRWK3hWNE00ekdHZDd5N3FhekpqU3d3TlJUN2czWXpVbjNy?=
 =?utf-8?B?Q0VwQ0hrVUUvQk50UlM2bkNpVDNndG83QVlEdnZkc1orTlhxZkl4TXN5UTlK?=
 =?utf-8?B?SFJudWR4WFp6Z21vcS9mY253NllIdUYxZmlwbUdPbS9VT0lFZnpOUlZ5alcv?=
 =?utf-8?B?S2hQSDdrUWVoa0tHQ1hJTDJkd3VXd1FoSStGYWRTa2xaaEgrWFFRdDBPRTVR?=
 =?utf-8?B?RGRvYWpTenZja2pOYVZtbEV2MDFJZXF3UDdEYnRHdXNIaFR0Mk5FY2U1ejVD?=
 =?utf-8?B?aWdLd09RQi85UW9LWEJhcEdBcWV3cFJjWnRpQ3FTTkE4amFqNFV3MlJPWjZM?=
 =?utf-8?B?Ri8xdzN3VFJKMHlSUDJEbDI1bGtxNGxMd0RucHh6M2IyamZjQzQzbTk4dTVx?=
 =?utf-8?B?NlpscUl4bnJSVXFvSTJXZ2JWOWpFNDkvcVQ5ZlVyNEJqYlVHUWlhTk5KZ1Ez?=
 =?utf-8?B?QklEdm5PMHdjOXNDZFJlYUpZelNMWTJaYm9xU3ZKeUgzdGc1ckF5akJ6alFC?=
 =?utf-8?B?NHJOenBCNTl2aFZjRnIvRkZJRnVDOXVJaVJSMFM5dnJ5SHpZV290RDN3Wmd1?=
 =?utf-8?B?enhlcG9JNU9oZWk4OTF4V01rK2JHOXlWVmZYT1Q1OW1aSVAzUDhTcGZHNkxD?=
 =?utf-8?B?Z1FBR1U3bndMQW9Rb3F3MmpZSW9DTm5nMWU3ejFEYTNtRFRrZTJzMWQ0NHhB?=
 =?utf-8?B?S0ZYS3M4QUxiODArQU9uZ01QNWJ6dTV0QmZpQ0hUSmVlMEdDUVY2czBTWDh5?=
 =?utf-8?B?YlhocXZBVHc3R092YllBU2h3KzltM3lxUkhpWkdBYlJNakc5NU5YdSt1clFy?=
 =?utf-8?B?ekhESm5ySk02dkpJdXFkOGY1ZGplZE13MEpJcXFiZUJuZXZvaFMvYmF3dG1H?=
 =?utf-8?B?UXN4ZTE2eEhUeVVySzJmT2JEa2VZZzVKWG1QVTFLL3E2dElTeXlnRXEvd2NP?=
 =?utf-8?B?eTBtK0QzYytoNG9lL3dRTGkrVmdaeENYT2tOSGJxTnkrN1U2WjVRQkJaZ1hI?=
 =?utf-8?B?UE0ySE1oL2lZOENnbHVHUjM3bUtMeVpMbExVNmVLMWROVHUycmNLL0lwWGJN?=
 =?utf-8?B?TTJuN3JGb3FCMm9kOWdCQW03Y3B4U3hLa1pmWDNFU2F3d29YM2RnN3NycjFu?=
 =?utf-8?B?U0I3dkRVQmJYK2RGMnNmWEFpTUpQL1N5SDJTS1Bxc1ZoVGI4SXhBYUZVVlBk?=
 =?utf-8?B?TDN6OU1ENjVFMXJ2NVRrMytUeUh0WG9NRmZUT1pPSlViTmc5SkU4NW9oUHVX?=
 =?utf-8?B?eUx1dUhtVExOczlLNE8rZXMrNlhpelR5OWxWcDdKOXB3M2tTbER0SDlIZ000?=
 =?utf-8?B?a1IveEhmQ2dveVZLVDRxWlVRWHAzaUo0TlFqV0xmMUpyeFRiWGFmN2hGUFhy?=
 =?utf-8?B?RGtGLzRRWnJSL0JVZDhxTGovQWNocHlhWXJXeXcxTjVYSHJSbFQ3cHBwckd3?=
 =?utf-8?B?aHhOcFBBYWRIS3J4MnU0M0ppUElVZHZtY3ZlZVMzajFIdCt2em81bUx1YTVK?=
 =?utf-8?B?L2tzQ0xpMURwaTNYSEpPZmV3UWplT1dPUWJGNjRnMGY3MDAvRjgrbWtJVXBk?=
 =?utf-8?B?RnBlR21uWDdvVUdPZ2cwLzlhUi8wMGFRRVM2TzB2NUFmV0lGcCtsSm5BS24x?=
 =?utf-8?B?N3lVcy9TSDhIU0FFMU1vQ0sveHduTzB3dGt6N291MW90RGYxZS9wcllhUGFx?=
 =?utf-8?B?SnAxSnVQK0JKTzY3M0RJWW1hajdlcHZWTzlpcWhUSTh4YWhqbGJyMWlkd0dL?=
 =?utf-8?B?VHRNK3dCOFdXYWFabjVIUEl2dUZaQ240WDNwNkt6VUg1d29kaHdUenJ4L3hC?=
 =?utf-8?B?VUcyM1hZbUdJWTNoQVlVUTdIcEFxZjNMaGNrYlhXajNqZTNySGhrWmU3blBw?=
 =?utf-8?B?aXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 258074e2-61f0-4c77-be62-08dba4ac24a9
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 14:12:26.5834 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HN2R6+38I2Eq1O6YIyI/fiZqJmda9rtiV3f70K2W11tcfaiQDhblahavUHeOHaPYJrll7RlROEmtBteg/U1VgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8724
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/2] drm/xe: Avoid 64-bit register reads
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
Cc: matthew.d.roper@intel.com, Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Quoting Matt Roper (2023-08-22 21:33:13-03:00)
>Intel hardware officially only supports GTTMMADR register accesses of
>32-bits or less (although 64-bit accesses to device memory and PTEs in
>the GSM are fine).  Even though we do usually seem to get back
>reasonable values when performing readq() operations on registers in
>BAR0, we shouldn't rely on this violation of the spec working
>consistently.  It's likely that even when we do get proper register
>values back the hardware is internally satisfying the request via a
>non-atomic sequence of two 32-bit reads, which can be problematic for
>timestamps and counters if rollover of the lower bits is not considered.
>
>Replace xe_mmio_read64() with xe_mmio_read64_2x32() that implements
>64-bit register reads as two 32-bit reads and attempts to ensure that
>the upper dword has stabilized to avoid problematic rollovers for
>counter and timestamp registers.
>
>v2:
> - Move function from xe_mmio.h to xe_mmio.c.  (Lucas)
> - Convert comment to kerneldoc and note that it shouldn't be used on
>   registers where reads may trigger side effects.  (Lucas)
>
>Bspec: 60027
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>Reviewed-by: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>
>---
> drivers/gpu/drm/xe/xe_mmio.c           | 56 ++++++++++++++++++++++++--
> drivers/gpu/drm/xe/xe_mmio.h           | 12 +-----
> drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c |  6 +--
> 3 files changed, 58 insertions(+), 16 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>index bb6823db14d4..c2ec52eefb2e 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.c
>+++ b/drivers/gpu/drm/xe/xe_mmio.c
>@@ -228,7 +228,7 @@ int xe_mmio_tile_vram_size(struct xe_tile *tile, u64 *=
vram_size, u64 *tile_size,
>                 reg =3D xe_gt_mcr_unicast_read_any(gt, XEHP_FLAT_CCS_BASE=
_ADDR);
>                 offset =3D (u64)REG_FIELD_GET(GENMASK(31, 8), reg) * SZ_6=
4K;
>         } else {
>-                offset =3D xe_mmio_read64(gt, GSMBASE);
>+                offset =3D xe_mmio_read64_2x32(gt, GSMBASE);
>         }
>=20
>         /* remove the tile offset so we have just the available size */
>@@ -326,7 +326,7 @@ static void xe_mmio_probe_tiles(struct xe_device *xe)
>         if (xe->info.tile_count =3D=3D 1)
>                 return;
>=20
>-        mtcfg =3D xe_mmio_read64(gt, XEHP_MTCFG_ADDR);
>+        mtcfg =3D xe_mmio_read64_2x32(gt, XEHP_MTCFG_ADDR);
>         adj_tile_count =3D xe->info.tile_count =3D
>                 REG_FIELD_GET(TILE_COUNT, mtcfg) + 1;
>=20
>@@ -509,7 +509,7 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
>                         args->value =3D xe_mmio_read32(gt, reg);
>                         break;
>                 case DRM_XE_MMIO_64BIT:
>-                        args->value =3D xe_mmio_read64(gt, reg);
>+                        args->value =3D xe_mmio_read64_2x32(gt, reg);
>                         break;
>                 default:
>                         drm_dbg(&xe->drm, "Invalid MMIO bit size");
>@@ -526,3 +526,53 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
>=20
>         return ret;
> }
>+
>+/**
>+ * xe_mmio_read64_2x32() - Read a 64-bit register as two 32-bit reads
>+ * @gt: MMIO target GT
>+ * @reg: register to read value from
>+ *
>+ * Although Intel GPUs have some 64-bit registers, the hardware officiall=
y
>+ * only supports GTTMMADR register reads of 32 bits or smaller.  Even if
>+ * a readq operation may return a reasonable value, that violation of the
>+ * spec shouldn't be relied upon and all 64-bit register reads should be
>+ * performed as two 32-bit reads of the upper and lower dwords.
>+ *
>+ * When reading registers that may be changing (such as
>+ * counters), a rollover of the lower dword between the two 32-bit reads
>+ * can be problematic.  This function attempts to ensure the upper dword =
has
>+ * stabilized before returning the 64-bit value.

Sorry to be a bit late to the party here, but is this the common case? I wo=
nder
if we should rather have a specialized version of xe_mmio_read64_2x32() for
cases where then rollover is possible.

--
Gustavo Sousa

>+ *
>+ * Note that because this function may re-read the register multiple time=
s
>+ * while waiting for the value to stabilize it should not be used to read
>+ * any registers where read operations have side effects.
>+ *
>+ * Returns the value of the 64-bit register.
>+ */
>+u64 xe_mmio_read64_2x32(struct xe_gt *gt, struct xe_reg reg)
>+{
>+        struct xe_reg reg_udw =3D { .addr =3D reg.addr + 0x4 };
>+        u32 ldw, udw, oldudw, retries;
>+
>+        if (reg.addr < gt->mmio.adj_limit) {
>+                reg.addr +=3D gt->mmio.adj_offset;
>+                reg_udw.addr +=3D gt->mmio.adj_offset;
>+        }
>+
>+        oldudw =3D xe_mmio_read32(gt, reg_udw);
>+        for (retries =3D 5; retries; --retries) {
>+                ldw =3D xe_mmio_read32(gt, reg);
>+                udw =3D xe_mmio_read32(gt, reg_udw);
>+
>+                if (udw =3D=3D oldudw)
>+                        break;
>+
>+                oldudw =3D udw;
>+        }
>+
>+        xe_gt_WARN(gt, retries =3D=3D 0,
>+                   "64-bit read of %#x did not stabilize\n", reg.addr);
>+
>+        return (u64)udw << 32 | ldw;
>+}
>+
>diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
>index d24badca8677..f72c34c7d1d0 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.h
>+++ b/drivers/gpu/drm/xe/xe_mmio.h
>@@ -11,6 +11,7 @@
>=20
> #include "regs/xe_reg_defs.h"
> #include "xe_device_types.h"
>+#include "xe_gt_printk.h"
> #include "xe_gt_types.h"
>=20
> struct drm_device;
>@@ -85,16 +86,6 @@ static inline void xe_mmio_write64(struct xe_gt *gt,
>         writeq(val, tile->mmio.regs + reg.addr);
> }
>=20
>-static inline u64 xe_mmio_read64(struct xe_gt *gt, struct xe_reg reg)
>-{
>-        struct xe_tile *tile =3D gt_to_tile(gt);
>-
>-        if (reg.addr < gt->mmio.adj_limit)
>-                reg.addr +=3D gt->mmio.adj_offset;
>-
>-        return readq(tile->mmio.regs + reg.addr);
>-}
>-
> static inline int xe_mmio_write32_and_verify(struct xe_gt *gt,
>                                              struct xe_reg reg, u32 val,
>                                              u32 mask, u32 eval)
>@@ -155,5 +146,6 @@ static inline bool xe_mmio_in_range(const struct xe_mm=
io_range *range,
>=20
> int xe_mmio_probe_vram(struct xe_device *xe);
> int xe_mmio_tile_vram_size(struct xe_tile *tile, u64 *vram_size, u64 *til=
e_size, u64 *tile_base);
>+u64 xe_mmio_read64_2x32(struct xe_gt *gt, struct xe_reg reg);
>=20
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/x=
e_ttm_stolen_mgr.c
>index be0a25e23929..6ba6b1b7f34b 100644
>--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>@@ -67,7 +67,7 @@ static s64 detect_bar2_dgfx(struct xe_device *xe, struct=
 xe_ttm_stolen_mgr *mgr)
>         }
>=20
>         /* Use DSM base address instead for stolen memory */
>-        mgr->stolen_base =3D (xe_mmio_read64(mmio, DSMBASE) & BDSM_MASK) =
- tile_offset;
>+        mgr->stolen_base =3D (xe_mmio_read64_2x32(mmio, DSMBASE) & BDSM_M=
ASK) - tile_offset;
>         if (drm_WARN_ON(&xe->drm, tile_size < mgr->stolen_base))
>                 return 0;
>=20
>@@ -126,8 +126,8 @@ static u32 detect_bar2_integrated(struct xe_device *xe=
, struct xe_ttm_stolen_mgr
>=20
>         /* Carve out the top of DSM as it contains the reserved WOPCM reg=
ion */
>         wopcm_size =3D REG_FIELD_GET64(WOPCM_SIZE_MASK,
>-                                     xe_mmio_read64(xe_root_mmio_gt(xe),
>-                                                    STOLEN_RESERVED));
>+                                     xe_mmio_read64_2x32(xe_root_mmio_gt(=
xe),
>+                                                         STOLEN_RESERVED)=
);
>         stolen_size -=3D (1U << wopcm_size) * SZ_1M;
>=20
>         if (drm_WARN_ON(&xe->drm, stolen_size + SZ_8M > pci_resource_len(=
pdev, 2)))
>--=20
>2.41.0
>

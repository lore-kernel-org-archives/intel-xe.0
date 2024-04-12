Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D219C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 13:32:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3666410E041;
	Fri, 12 Apr 2024 13:32:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TJZhb9yD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCD2D10E041
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 13:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712928766; x=1744464766;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GZtUPIu42VwhJuVu0luD1maoG0b0mIrq3iJVpbPUEcM=;
 b=TJZhb9yD8M3agUk0n4B+2gyAyFHxnFQfZvcgYrhl+UqYHFoqPhJQ0An2
 +5UeeTuBBxIHhtpqrw6775IHPzWtyRPSUWP1gM6KRKIEuZ9gwA2dMBI2c
 b8OENoFINiYFkE5vNgqzbZhnv6d0qFQAvvQ0dNqlwtCftRSWc+JZd/A6l
 JlrFPkYTAh1yA08re9X8Vgphj+PtwCYzezWwAX8fQoAg21lnLcZX+D6Ek
 logvjvmi++egtus+HNSZ1UsQP3Gc67i+OQp+lKEvPJMDRqg/1MC3YiK+v
 lOcvuBnEdPyXf0q+/8Ai0ugI1wPczfLLvG+bi6YUxtEjRUGmidK6HyfHW w==;
X-CSE-ConnectionGUID: 95NRJHRuScecxigpPUopDQ==
X-CSE-MsgGUID: uH9vU/DmSd6Bx2O6aP65eA==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8489780"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; 
   d="scan'208";a="8489780"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 06:32:41 -0700
X-CSE-ConnectionGUID: YePUfMAuR4GzyGfmtqvARg==
X-CSE-MsgGUID: 6yQdX+3JQFGVsYpRDlBb+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="26044077"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Apr 2024 06:32:42 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 06:32:40 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Apr 2024 06:32:40 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Apr 2024 06:32:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z1+3DIC734Aelno6pTy6kF5DXMhvEeHAiB7kbdDUeJGLkaVEK7CaFov4hpRh+a6alQ7aBh6kf3l7MkLJN7Z3zlT2pQsDQjo2o6IqTUd0jGIA/b0lg2rZZU2MGMt30Wnk7XPQicQiMGLcjf+YCuX6zTnoM3v9WqjdN77T5X81voSjRPB18TBFyksrmCxp3StuwyEMz2J1Kb0hI6gzYxLyRVHLK6Nuqe9xqcG4RcafQpRBU1W/pmI16ykDgKNK3aL6zdPiKu4CorLT9BdfeOED47q7xUe3cKtvsWPhrkzJ0bYqrgbwtxdv9UG2OE1RNz1MutYdT8caup0V+2l9CFvJbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g7CYEtUuCMD58/j3nWKYteN+VQ9Sk0ev7BO2yyugrV4=;
 b=HnfJ+BhsGr/57TFPkphXux4Ah7WuP0IW8fYtltzUz5uXOp8kJx8nnP8c9RylwIyxITXy5ZLIlDDgk5ZHwgDv3guGf/xH12Q5duLlaRa/b1nH6Ek1CKUW+MTfVhrVdwhj7t9FjPHdjeCfOhbfcntLTlQ+zR/w/0ijKGHFLzmfWZOQKkIp6ayow1L3qnLNkDfk4k4hKhRcT4C4abzcJPd8VMTxaqhqU7qJ9/wE/gDaI/7Wk1nqaSag3TsI721qkOhwXbyWuzED78cfwl1zpWucKuFbFl2lxldWZ98LcpNRwnfxJxAbcFqJ0yyOEoFGBEJDxtymtHuMCY8PXoYpDlqE8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5039.namprd11.prod.outlook.com (2603:10b6:a03:2da::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7430.46; Fri, 12 Apr
 2024 13:32:38 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7452.019; Fri, 12 Apr 2024
 13:32:38 +0000
Date: Fri, 12 Apr 2024 08:32:36 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v3 6/7] drm/xe/tile: Abort driver load for sysfs creation
 failure
Message-ID: <6utingku2ql5achp5wf52jkvduohvngrcr7mcfitjpdbdjth6c@rn5yhmhuryze>
References: <20240412080245.1044902-1-himal.prasad.ghimiray@intel.com>
 <20240412080245.1044902-7-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240412080245.1044902-7-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: BY5PR17CA0009.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5039:EE_
X-MS-Office365-Filtering-Correlation-Id: cbed8d5a-2cab-46da-191d-08dc5af50570
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s2YJTasL3ykMxR8/uF7fQiYsukvDauEL5qw195bj+b0P31FEIHJmtrvUio50agry2Ix9t81T3iXG3kuTbkqkt/Be+uMXWdPlGwbJYfRtWWAPtUoLOzLcNXxB37/A+0amNAPDfIKw0LyzbgIO66O+LXFad0NCr2ctNAqtJgb3PmeHVOjcruzLI7/LSwxJqB6guuju6zvuzzk27lYIXrvB3bSxxcJkJ4PJD79x0vBfBSYuwxfbMLOYje9cDDwIpwYqI5wiS0cPyOlNXdrZf++Y6AuycCjcmNzchoqWuBPdOjIHrbOJP1Q4lkpxAYI7BTD6AF/ROvKWxPaIVHfUeicx+dcRRAadUCiggqHG3MVyCyiLjWcwDIRHAU/Zop/4GngqATsEpFAJI/KGex/HRwa7X+LDhCQqIZZvP3HSD3YD7iBv2U+r+DblIdOCrCHEgJDRqJtGE4CbgL8zHmNmQej4edyucDC5VNbVB5wSr5+N3naUz/YkQDo5OwEtAfCe5nG4uDbyUoJl4ykR85ECbgHFutaTd5gCveXIYOWpZIzcM29T4IFj2rHHQ4cPliPDlOkTdRtWt5iM1nax0d8Lm9cOrdRtqWCxKp0LTOYhJTp51vg085WuX6CnhbtEGpFYHAI9Ba0yKWp2Zygj+CbhQACic52OR6VK4YY6A0hjRDRW3f0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+6mS5Wn0ksCGWMOp9MJQqZWO6oGztYK+vYxLz+PLYgCJzOTalvj2fQP1Znvc?=
 =?us-ascii?Q?pxNBCjHh3SC7yZPFxZgjJHYVIagoCHUoeYNAMZEccd3m67h0fUee6hd4CWVs?=
 =?us-ascii?Q?qjFaFOMg936gkT9conp5Y2tAEDI7E9m6CNZmc2cAcXlBIHiVUtF/KXlloAID?=
 =?us-ascii?Q?KHAFAiocxYqBS8wrVqnS11P3/WT6dMTpjohIAKUyBh3lFLEas4TKjXU8w7ke?=
 =?us-ascii?Q?VZfxrbQaWF6IvpVLNJer7gQdtH7i3hd/qa/pWKsKlD/jE2EDXMqb6LDidkBS?=
 =?us-ascii?Q?rLUwbUkPMhNDcFML2YByU4HSqzbiNwPqEZ3wA1h93iZ0JiyfN6s9oCJn73jb?=
 =?us-ascii?Q?J+M3wnSv4ZhiBGrsoEnuV7l7KT5zeoJ8XsGs5f2gpgLVo3GvcQMRHn4Zsefe?=
 =?us-ascii?Q?OM3mowJ7jWbSkCAn5bSNzDAciuv9abfalgSICZDsZAgvrqb0kkLF5Cs74pG3?=
 =?us-ascii?Q?RvO2k0HBYqTT4QDqyHL2kgwikYkFnBzncjqbyTu8Xql0uv3+I/jxFPNHUf2X?=
 =?us-ascii?Q?w3HTO4+8y69Q2+nh4Banm2Opll+XfMJj/ixPr69olQmCWYEGxv+kOmwXX6uR?=
 =?us-ascii?Q?9nVXaVTdBTg8GX4hmeTWi1g4K4fGatxNBxyRvCwgl9XijVSOQBL8Oyd6GWix?=
 =?us-ascii?Q?vT3nnL1RvWR8K3T2sX1Ba0XCRmerTrkjPnHo0ZUSTe1TnFR0x317Cjbo3YqU?=
 =?us-ascii?Q?9iX4LEBhSvsNiqMjcErix/NBZ2zj1PrIQboSEN6F9EQtYai9cpBARr7XapLl?=
 =?us-ascii?Q?coiAzgoyTk38Y9o9mhcvNyiHEZ8jyXnE7QToUF95g/MBzQY4J3bcrf53MYhi?=
 =?us-ascii?Q?fQQSW26AT74qfxFdI/6+mYLR6yz1BUOTVFsNwTS3D/cFZHROWxqlZNdD3+9j?=
 =?us-ascii?Q?VpyGK1h8hbFsbJOKpS389tOZAM/q2Gp7t/eIm3IDYMV3jN0U1qQnx7jAD6EO?=
 =?us-ascii?Q?7H2tVCUePZ0iDn1PeCt64qrhKtZAjCcva7TFFoDgU/06of3S58EQC2chh1dE?=
 =?us-ascii?Q?cMNpuK6ZhEF8vnn9RvS63pS3IqopKBQmlQtQHQMOSQo6PbcTLLqOirhj4ScZ?=
 =?us-ascii?Q?tNz80+eQLVFwfUqhwJriyIS/4FHE+kU6V72oZWcaCvFFcF60R7mb/KpocS3b?=
 =?us-ascii?Q?Q4n4pQzSu4OyOqOpCE5ZN4u+5pmbtCSZiyAID1HbnP2d/rx/osZTRNObyLxo?=
 =?us-ascii?Q?JL5bHKLhhTshYlJdAAhdq5vr6HOjYXe1OpIghVNYKJA6s4cnW86vtFDbV6FS?=
 =?us-ascii?Q?vW1SweYJXU4GJXhd3m5Z5qDdwgLYxe8OQWHQLgsSfKRNrdZAbl5OkT6jV26I?=
 =?us-ascii?Q?umLjpepSLj7inZ9dCwtwHGruD3wVs4mX1M3zrdHCUGvEASUMGHHblal9LI9e?=
 =?us-ascii?Q?OvxnRrDvLtdNcf3RmvKnUfdi134YKOiLrNEiMB/l6XYz5zpaIe1LIMCrCEi8?=
 =?us-ascii?Q?TH4mfG7X2hbSrm8YM148QjLTnRX5X8b1iQcvpbNhVWzH8YZcgREFVdqfGQzE?=
 =?us-ascii?Q?O8yP2K7Fk/EotRoZpcg8uHnp2C7TdgFJonIUagLLbHRfGU6ceS2hJD3a1mGF?=
 =?us-ascii?Q?kKbxFJYpuQrA1OZQhddABGBc+cThiMFZvjDOkz+u8PbqcxG9Lv0qQNq43HG2?=
 =?us-ascii?Q?nQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cbed8d5a-2cab-46da-191d-08dc5af50570
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2024 13:32:38.5489 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aIOFMXsr75SGouX3LVbM+igCFAkZgW58NANutTZzpZgc/haJ7INYEWdw+NuzWp7YtfwJVT12qUbGbntZF9ITnMKL6mOhuF1eL2Qlfps3zmo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5039
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

On Fri, Apr 12, 2024 at 01:32:44PM +0530, Himal Prasad Ghimiray wrote:
>Ensure that the status of all tile associated sysfs entries creation is
>relayed to xe_tile_init_noalloc, leading to a driver load abort if any
>sysfs creation failures occur.
>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>---
> drivers/gpu/drm/xe/xe_tile.c       |  2 +-
> drivers/gpu/drm/xe/xe_tile_sysfs.c | 17 ++++++++---------
> drivers/gpu/drm/xe/xe_tile_sysfs.h |  2 +-
> drivers/gpu/drm/xe/xe_vram_freq.c  | 21 +++++++++------------
> drivers/gpu/drm/xe/xe_vram_freq.h  |  2 +-
> 5 files changed, 20 insertions(+), 24 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
>index 0650b2fa75ef..409cf55aa8a1 100644
>--- a/drivers/gpu/drm/xe/xe_tile.c
>+++ b/drivers/gpu/drm/xe/xe_tile.c
>@@ -173,7 +173,7 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
> 	}
> 	xe_wa_apply_tile_workarounds(tile);
>
>-	xe_tile_sysfs_init(tile);
>+	err = xe_tile_sysfs_init(tile);
>
> err_mem_access:
> 	xe_device_mem_access_put(tile_to_xe(tile));
>diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>index 237a0761d3ad..3cd340984c34 100644
>--- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>+++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>@@ -29,7 +29,7 @@ static void tile_sysfs_fini(struct drm_device *drm, void *arg)
> 	kobject_put(tile->sysfs);
> }
>
>-void xe_tile_sysfs_init(struct xe_tile *tile)
>+int  xe_tile_sysfs_init(struct xe_tile *tile)
> {
> 	struct xe_device *xe = tile_to_xe(tile);
> 	struct device *dev = xe->drm.dev;
>@@ -38,7 +38,7 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>
> 	kt = kzalloc(sizeof(*kt), GFP_KERNEL);
> 	if (!kt)
>-		return;
>+		return -ENOMEM;
>
> 	kobject_init(&kt->base, &xe_tile_sysfs_kobj_type);
> 	kt->tile = tile;
>@@ -46,16 +46,15 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
> 	err = kobject_add(&kt->base, &dev->kobj, "tile%d", tile->id);
> 	if (err) {
> 		kobject_put(&kt->base);
>-		drm_warn(&xe->drm, "failed to register TILE sysfs directory, err: %d\n", err);
>-		return;
>+		drm_err(&xe->drm, "failed to register TILE sysfs directory, err: %d\n", err);

same comments here and below as previous patch

Lucas De Marchi

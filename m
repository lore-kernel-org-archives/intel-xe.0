Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 003C0C4828D
	for <intel-xe@archiver.kernel.org>; Thu,  1 Feb 2024 17:37:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B17A610F29E;
	Thu,  1 Feb 2024 17:37:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gZd2XUu4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC0AC10F29D
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Feb 2024 17:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706809034; x=1738345034;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Q7KlloJ33deXy2RPvDk8RETzr8QEKoCxS2AQ2VwHh7c=;
 b=gZd2XUu4T0dsGTRzG/FXMdm8RoU/YgtS9TrcX2/Aihcrq9lMv8acPITi
 zKbd/5G3ClpEpn5CxyIrYU6h2inzJJSubofwDFuQXsjU/4eHBGNcnzBmD
 C9FLisIAkw1uMq3al2Ps1dy3oj8glOglYj+6LBWfyalIdyfiCJhK8e5y+
 Euh+nhGPePhCOxsbDJv9xTPg36uC/6jCjYQ4XpJg6OJY0sV6W2lpL0duT
 LsWDTwKZ36w4BFV5rIw1FKR+aYGc2blGEoZHyvoSaJTqjFIjKa+clVnvB
 RjnIiw7Ty+2j5yNbm8DoLny8mFATV38ynAkLrm8HR9K8l5uXI6N1EFS1J A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="403567183"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="403567183"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 09:37:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="932232232"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="932232232"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Feb 2024 09:37:13 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 1 Feb 2024 09:37:12 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 1 Feb 2024 09:37:12 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 1 Feb 2024 09:37:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bgBo2hBJbNjPsK4F7e/ccNtMAQLN44DK5k6zTT7X/e0ChaeIlAAh41LFctoSxdk7b6J/oJd1548Sz1sOP5lF7zxv3MA689vtRdnlHDy0Avpy1zXUkHG3DfjKkns+5HUghw8Zz14OkAUgm5sxNkkVgMjIypxW7+lKZZr4KQwZAy3BuypE/U1dZiWBomlN87st9lbjs6HFozGI505lYy8kC4zCI1aXemUCWI7XBtykfF04YC7594S/UICDEpWuctY/SzzaOuD7izcxNEipCZYzKMyR7j7InlGQilHm1NqC8aBQJqJTtk0so85s5ibPMga/g3gYLicLGXCvVTffWD8lvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=opZMDGr2edHNCuH5Lm13fmsG6k0BuPs9lgFlNCwBZK0=;
 b=HpRMuffXe7hP5PaUbct8flW59rqgMWs9u6uOEcSJyzvgLGm0jOGlTDxBj6NCRBsXoAAhAxh80FEIzDRJvz7WVfkX5Z2vRkthQ/mJFk976zUvM7YCVIVwvdvUysA1XcPBxKeEDNPGV3IcddYyuilKnKTiY6UbHsnDuk5rdvKM5kYfej2tjsF66i1Ja/Ur6FMkuOGl7EtsAGpKvMKwUtzIO7oxno/flrH6C7xAMyTL0Qa4G9Yp4x8pySOT3ool5G4g6Qtj0gl7/e372HkfrXT4/bHxJM8uH3d7VY6KuhRDBIVTE6OuyFyS/WNVuan/bAq3kxOECXWbwNiVEYK0Gw0jJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB7400.namprd11.prod.outlook.com (2603:10b6:8:100::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.29; Thu, 1 Feb
 2024 17:37:07 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7228.040; Thu, 1 Feb 2024
 17:37:07 +0000
Date: Thu, 1 Feb 2024 17:36:20 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Matt Roper <matthew.d.roper@intel.com>, Ville
 =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, Brian Welty
 <brian.welty@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 1/4] drm/xe/guc: Allocate GuC data structures in system
 memory for initial load
Message-ID: <ZbvWlEXjQz+7/iWQ@DUT025-TGLU.fm.intel.com>
References: <20240129130308.3544466-1-michal.winiarski@intel.com>
 <20240129130308.3544466-2-michal.winiarski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240129130308.3544466-2-michal.winiarski@intel.com>
X-ClientProxiedBy: BYAPR07CA0050.namprd07.prod.outlook.com
 (2603:10b6:a03:60::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB7400:EE_
X-MS-Office365-Filtering-Correlation-Id: 8aa6215b-d57f-42b3-2980-08dc234c69a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: njC/QMXML+BmERsZTZXAk1PPJCfqwHbeLqtHIPgj9JtI3uBR9bSrzSjeoYAZTmYW09Ze+S9vLdghiCTaPIxxDEWxMg6mgI0xAZX5guFOfi7B9skqiIVdb1TaXPgZhEXVMKhYeNtW00/DFz5Hx7cXIyezQfOkMPdtOLzUVUCJY5ltOMdtYQgBLz0TbP7tzuy2yW3ccN3yaMVlaUMXz2ZldrsaVALdXYXVLzzhP17pJ4mwC6TJQH/oqOIR38rWWeFknjIbaxu6DngSN/WyLsSSmQWfPhIXv+sPNOHCUSbImc0ZidjrBs8Q/qPClKQoZEL8oht5zNJmuhzHuy5/pW+pKP+lm7bCLzjXYGa5QziNGZwA4MXNsVOVtrQygzg3oHtIrjbcZ5FGV2DsOWiVYeMVkEVFt42pxrK4j47FtOCENTMryeB2fhq1raOOxa/ybaAPzkC0kxUEEGDyouzuVVtYdCg0ydQQss+R84y2BoEonFLWqrKzLrU4zncvSKu7UIN1NyJCe1dsm22lY2kU6LT1fLGcJzF+vLOthyES15mFCHMvA+is2GC43tzbbjySu/addTYtArVrBPxzUdbqHcFvJCtdF0bq1OCGSptaxHk+hKQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(376002)(366004)(39860400002)(346002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(83380400001)(6512007)(38100700002)(26005)(44832011)(5660300002)(6862004)(8676002)(8936002)(4326008)(2906002)(478600001)(6486002)(6506007)(6666004)(54906003)(66946007)(66556008)(6636002)(316002)(66476007)(82960400001)(41300700001)(86362001)(21314003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TG1DdVNJNFlBK01LemZUVG1RYzVySllMWEhuRWxJNXlYMUVOeXF3RWxVZGd6?=
 =?utf-8?B?Mi8yVk1xQXluWmt1L2NWdUpzYll5Q2c3MHpMWW11azhLM3RkMkxROC9ZT0hJ?=
 =?utf-8?B?bUlxMzVkMjVWb0ZBRGRuaTJBNjQxdi9IWjdyZWNhM1E3b1BmSUNNYU1KUXhL?=
 =?utf-8?B?N0x2MXZLbUR1MXQ0bWtYS1p5akpmcTRNTHVlbkNhSGJUUlhmRVFJcHZEbTZ4?=
 =?utf-8?B?T0U4MjF3NDFWc01SK2UrKy9OWUxhaU9tUTdQTWxiS0lWRDRHQXFpWVp6WWxZ?=
 =?utf-8?B?UFFWSkRuSERMcTFlS3h6REFyRGdIWDk0Z0dQK3Q5eDNBajB4ejVOMUcxSHRZ?=
 =?utf-8?B?UG1MNit6VHNQbmQzWUFzbHlNaGE5TkdoMUd0dk54ZVJMMW05dG1nVlRuWDBC?=
 =?utf-8?B?SWJVQ2hqWlQzUk9GTDZxUCtkVTBvMHZGNDBON0tEcmJkaFhiMTIybWxpbldW?=
 =?utf-8?B?dnZub09DdEI1WHI5Z2pROTk3a2c1dzZhdENUbnJBVmJrQklMQmg2S01FckFL?=
 =?utf-8?B?WUNaeFhZU0xWL1VmcFZ3MG0zSFdvZ296ZFljRlVxaGk5bkNxUjBYQkg5bm51?=
 =?utf-8?B?alllUVl2cTZLRlB0U0VSZ3I1ME94eitkMjhEVmszQ0krWXFKUExaMllnbVdh?=
 =?utf-8?B?YU4zaXhTWVNFQmpQQVNKaTkxbkgrMlh3SVF5cS9jbzZHYUVKaml6NkJ0ZmlT?=
 =?utf-8?B?clZ4c2FscURFbS9URDVBamxwMzNNenIrcVd0Yit3cXVHdW5IOE83Z21JbHZw?=
 =?utf-8?B?aUxGVEFGamU5ZlBkdVVZN1RZNjc2ZUV2M09nM292M0ZXNjhHWHBMN0pPUkJZ?=
 =?utf-8?B?WUd4Y29wUG5EalMzeDVMY1ZHUFRnR3dPSGkzN2RtdExSbGpIeUlCK09wOVJh?=
 =?utf-8?B?d1AwS09CWGhRbm5udUxDOGpFbXcvS3BUcEZUMFNKV2h2eTRFMEVTbFhtZldw?=
 =?utf-8?B?ejY5SnJFbUhxaTdVeUpYWU11MTN6K1VHN3l6ZUJLd0dMQnRLYzc0ZDY1SFhK?=
 =?utf-8?B?c0dwcm5YVlZVbmxvOERpelVoSytDWlpISkJ4ZGJqdUQ3dFU5ZUlGaXU5eGd5?=
 =?utf-8?B?QlNndkMzWjFiclZKTFFvVHZpd2NoNmhLL0xhMlZUSnNuV1NLODloQW5CYlJ6?=
 =?utf-8?B?ai9maVplS0lCZmtqU0x3bENiSTJUL3NVTkFsTFZ5RG44T05KTGVkSzk5RlZH?=
 =?utf-8?B?S3pRZ01NYTdOMFpzL1RaaU0rNytFbWtHQm1yMGQyL25UOW90OHVYbEtDczZY?=
 =?utf-8?B?c1VrN1pHSzErM1NXOXpWTlRRS0QwOGVNWVdyZnpkbzlCdS8zTFN6VU4rMUlI?=
 =?utf-8?B?dm11UFkvVmNWQ25JSTMrMWdXZ3BId0RDeW9SOG9uelZZVDJCWU5lZ2duUVlK?=
 =?utf-8?B?OXo5aXRUeFR1ai9GQVlMejJ4TiszSUNZRytGc0lIWkc5dUZZYnVjZFBhb1Fj?=
 =?utf-8?B?ZkgvUXNadjlHVkN2SDZoLzBhNGhDYjRnVlV4citTOFBQTHBqTkxESDFmdmhz?=
 =?utf-8?B?c0krYnJwTVY1Rk1hMEpMZjJhWFpOaXhhVDJyTzQwRXg2WTYrUXhPa040K2pm?=
 =?utf-8?B?TTB3OXVaY3VrQy9uT0Fwb3ZMK0xkNE55Q2xsNzR1Zi9yOTdUeTVPRVlMdGxD?=
 =?utf-8?B?M1p4Wmd6SEtsNWhhVm90MVJSVktBN0FkZW9mdG8ya0FiZlpkRVBsU3h1MWt5?=
 =?utf-8?B?V2lLZE04V0ZuTHcwQko4b0hLeTl1TWV0cm9pWmYvdkRqUzhXQ2p6RENHTkdH?=
 =?utf-8?B?Z1RUQ0pvMzFhRnlHT0FQS3lKc0pyWmRHMUJUV2NaaVlFUVRScUJUeWJuaEoz?=
 =?utf-8?B?WXd0a2h4a2pTRWc3eUNlbzVkbi9MUlZUeHNMTUNReGV4b1RGa3Q4R2RlTCtY?=
 =?utf-8?B?Z2RjbWoranVRaW9CRFZ3NVcvRDRrRnhGWmc0Qm81K0JycytJcUVRQWZEQjVh?=
 =?utf-8?B?cUNrQS9ES1pqU3hsZHA1aXZZYnVtV3V1V002Z2k5cXlhdnk5UzFXOSsxd29Z?=
 =?utf-8?B?ZzZpbmljVE5vUExHazFBdUNDeG1TanB6OE1oYUdJQTNaNmJTZTlPa0c3cnB0?=
 =?utf-8?B?YTFKcFdVVjZZM1lWV0dTckRITGo2bjVsWWlhVld3OW5hU01jRm8rMWd6VHpo?=
 =?utf-8?B?aW5aK1QvS0dEV2lMc2tOV21Ra1NaSWl1dXdOWjdjY2FPN0IxRDJ4ZUx1c0tw?=
 =?utf-8?B?SkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aa6215b-d57f-42b3-2980-08dc234c69a2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2024 17:37:07.7968 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HJP6f+4Xxhb+YsqD/weV55egJpeSDKFjE2L1S7T3YNkCIFP0+GoY4eML+xrOYS0Rl7bAzTS7I119/HBKXhT2EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7400
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

On Mon, Jan 29, 2024 at 02:03:05PM +0100, Michał Winiarski wrote:
> GuC load will need to happen at an earlier point in probe, where local
> memory is not yet available. Use system memory for GuC data structures
> used for initial "hwconfig" load, and realloc at a later,
> "post-hwconfig" load if needed, when local memory is available.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c           | 32 ++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_bo.h           |  1 +
>  drivers/gpu/drm/xe/xe_guc.c          | 34 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_ads.c      |  2 +-
>  drivers/gpu/drm/xe/xe_guc_ct.c       |  2 +-
>  drivers/gpu/drm/xe/xe_guc_hwconfig.c |  2 +-
>  drivers/gpu/drm/xe/xe_guc_log.c      |  2 +-
>  7 files changed, 71 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index d6a193060cc0b..7df87fbad0938 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1605,6 +1605,38 @@ struct xe_bo *xe_managed_bo_create_from_data(struct xe_device *xe, struct xe_til
>  	return bo;
>  }
>  
> +/**
> + * xe_managed_bo_reinit_in_vram
> + * @xe: xe device
> + * @tile: Tile where the new buffer will be created
> + * @src: Managed buffer object allocated in system memory
> + *
> + * Replace a managed src buffer object allocated in system memory with a new
> + * one allocated in vram, copying the data between them.
> + * Buffer object in VRAM is not going to have the same GGTT address, the caller
> + * is responsible for making sure that any old references to it are updated.
> + *
> + * Returns 0 for success, negative error code otherwise.
> + */
> +int xe_managed_bo_reinit_in_vram(struct xe_device *xe, struct xe_tile *tile, struct xe_bo **src)
> +{
> +	struct xe_bo *bo;
> +
> +	xe_assert(xe, IS_DGFX(xe));
> +	xe_assert(xe, !(*src)->vmap.is_iomem);
> +
> +	bo = xe_managed_bo_create_from_data(xe, tile, (*src)->vmap.vaddr, (*src)->size,
> +					    XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> +					    XE_BO_CREATE_GGTT_BIT);
> +	if (IS_ERR(bo))
> +		return PTR_ERR(bo);
> +
> +	drmm_release_action(&xe->drm, __xe_bo_unpin_map_no_vm, *src);

Should we not destroy / release the *src BO here?

Matt

> +	*src = bo;
> +
> +	return 0;
> +}
> +
>  /*
>   * XXX: This is in the VM bind data path, likely should calculate this once and
>   * store, with a recalculation if the BO is moved.
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index db4b2db6b0730..ff919a836d163 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -129,6 +129,7 @@ struct xe_bo *xe_managed_bo_create_pin_map(struct xe_device *xe, struct xe_tile
>  					   size_t size, u32 flags);
>  struct xe_bo *xe_managed_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
>  					     const void *data, size_t size, u32 flags);
> +int xe_managed_bo_reinit_in_vram(struct xe_device *xe, struct xe_tile *tile, struct xe_bo **src);
>  
>  int xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
>  			      u32 bo_flags);
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index fcb8a9efac704..9b9a1252f3090 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -272,6 +272,34 @@ void xe_guc_comm_init_early(struct xe_guc *guc)
>  		guc->notify_reg = GUC_HOST_INTERRUPT;
>  }
>  
> +static int xe_guc_realloc_post_hwconfig(struct xe_guc *guc)
> +{
> +	struct xe_tile *tile = gt_to_tile(guc_to_gt(guc));
> +	struct xe_device *xe = guc_to_xe(guc);
> +	int ret;
> +
> +	if (!IS_DGFX(guc_to_xe(guc)))
> +		return 0;
> +
> +	ret = xe_managed_bo_reinit_in_vram(xe, tile, &guc->fw.bo);
> +	if (ret)
> +		return ret;
> +
> +	ret = xe_managed_bo_reinit_in_vram(xe, tile, &guc->log.bo);
> +	if (ret)
> +		return ret;
> +
> +	ret = xe_managed_bo_reinit_in_vram(xe, tile, &guc->ads.bo);
> +	if (ret)
> +		return ret;
> +
> +	ret = xe_managed_bo_reinit_in_vram(xe, tile, &guc->ct.bo);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
>  int xe_guc_init(struct xe_guc *guc)
>  {
>  	struct xe_device *xe = guc_to_xe(guc);
> @@ -331,6 +359,12 @@ int xe_guc_init(struct xe_guc *guc)
>   */
>  int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>  {
> +	int ret;
> +
> +	ret = xe_guc_realloc_post_hwconfig(guc);
> +	if (ret)
> +		return ret;
> +
>  	guc_init_params_post_hwconfig(guc);
>  
>  	return xe_guc_ads_init_post_hwconfig(&guc->ads);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 390e6f1bf4e1c..6ad4c1a90a787 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -273,7 +273,7 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
>  	ads->regset_size = calculate_regset_size(gt);
>  
>  	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ads_size(ads) + MAX_GOLDEN_LRC_SIZE,
> -					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> +					  XE_BO_CREATE_SYSTEM_BIT |
>  					  XE_BO_CREATE_GGTT_BIT);
>  	if (IS_ERR(bo))
>  		return PTR_ERR(bo);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index f3d356383cedf..355edd4d758af 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -155,7 +155,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
>  	primelockdep(ct);
>  
>  	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ct_size(),
> -					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> +					  XE_BO_CREATE_SYSTEM_BIT |
>  					  XE_BO_CREATE_GGTT_BIT);
>  	if (IS_ERR(bo))
>  		return PTR_ERR(bo);
> diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> index 2a13a00917f8c..ea49f3885c108 100644
> --- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> +++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> @@ -78,7 +78,7 @@ int xe_guc_hwconfig_init(struct xe_guc *guc)
>  		return -EINVAL;
>  
>  	bo = xe_managed_bo_create_pin_map(xe, tile, PAGE_ALIGN(size),
> -					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> +					  XE_BO_CREATE_SYSTEM_BIT |
>  					  XE_BO_CREATE_GGTT_BIT);
>  	if (IS_ERR(bo))
>  		return PTR_ERR(bo);
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> index bcd2f4d34081d..45135c3520e54 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.c
> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> @@ -84,7 +84,7 @@ int xe_guc_log_init(struct xe_guc_log *log)
>  	struct xe_bo *bo;
>  
>  	bo = xe_managed_bo_create_pin_map(xe, tile, guc_log_size(),
> -					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> +					  XE_BO_CREATE_SYSTEM_BIT |
>  					  XE_BO_CREATE_GGTT_BIT);
>  	if (IS_ERR(bo))
>  		return PTR_ERR(bo);
> -- 
> 2.43.0
> 

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5646EC3DA6E
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jan 2024 17:23:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DCE310E649;
	Fri,  5 Jan 2024 17:23:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 482F510E649
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jan 2024 17:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704475405; x=1736011405;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:to:date:message-id:mime-version;
 bh=U+akvXLufzvdaw6A5rOpTkcbGRS4A3TvoKCPnTRRP2s=;
 b=ZiqMaiZZMftyr2ZqucAjt81Yr/h7uCxmM7I/KsqWAYWe7pbFsLxZIK1s
 KMDoEEafzxXzyKDyHd+laJG9Ef6FgjD8f//ZYFT/A3fwhYBtNceLJ1Smt
 vM6HSG61k5bn4ZAeNdaNNdbUQJKEKyS3jVmuhioKD7P1SGlWcVlOwwhsE
 waY2rsVHTeUnMLN2PxPOPpAZGjz2ktJzJyPOeX4I9R+W2WzzYlDAey/4L
 XuOZ8mdH52T24eyKp8cMmGb19DUiK6Y+KY9pg0bUEAGC/Tz0Qk4yo/5Ro
 KjzrNvfVvYWGWTwsm0nXPHfy3/PkogzTpLCU9mUN9O8LZTnH3JefP4pnh g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="377038592"
X-IronPort-AV: E=Sophos;i="6.04,334,1695711600"; d="scan'208";a="377038592"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 09:23:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="953999082"
X-IronPort-AV: E=Sophos;i="6.04,334,1695711600"; d="scan'208";a="953999082"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jan 2024 09:23:24 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Jan 2024 09:23:23 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 5 Jan 2024 09:23:23 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 5 Jan 2024 09:23:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hCY74cQjfKw1S3pqbxa+8bxs6pBkWhqI0bVWR05IOUzxx2JE6kfwklNss9fTnX2LUTjsnHKA0n0DggXnzA4HeT2Xn4+hscY28DlQfsxyOlEXPr0AkLcPLuc24lgF9bINSSZoX1KNdpcvFUfNRHpkIoWN4Ray091DcU0LWLZ6t39MiYP5zrMWVjhRWsI1UjEd7kbD4OV+1LbN44NnV9CJoH7JaSf7NwWkExrqVctShAuYx+zKxBg8eEb0JSyniHiiScSiNyvTATaJrWjzDjz2epfuatHfyUKKPJJEMgeNtG2zwyUNdAWKTtkHYheRHliMWNtfLxIqHRU+dRgud7PVDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gxd07Dz9AdgrlnKruJeKnYi5NvAaM7WBLzLE6Qv5+48=;
 b=aEjfYw47/nAol9cNVIYtS3arFyaehfLEWlEmb9bDfyyAVHWgLAdj0zEVIMkIXZ6HIV3VbDlt8chdVcjbOzPdznr26083tZtckDYzg1r2nBTMdUCyXY3DU19NFf8Qwd9Z5b07tDQo7nBjgu81QYlyQxqjgNnpWsVXMu1Z5XrRkpvZPLUK9F6T0BL2LoqlZ0d+WE71qzL0sQiTpvUhP2a6zhg8aXQnvf0rIbPNgeAMp//vARYlfa+VYRt8ZlW72XmAbGA2Flkth07QLcTqnzFW5BuisYxW5Br0NJ7x7AJgWjfSEb57XlTfHOo7d2mbRvJg0CiNTPoyZhCudSPIN4xv/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DS0PR11MB8230.namprd11.prod.outlook.com (2603:10b6:8:158::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.15; Fri, 5 Jan
 2024 17:23:21 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::2d19:7dae:86c0:7513]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::2d19:7dae:86c0:7513%6]) with mapi id 15.20.7159.013; Fri, 5 Jan 2024
 17:23:20 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240105164530.1328374-1-matthew.brost@intel.com>
References: <20240105164530.1328374-1-matthew.brost@intel.com>
Subject: Re: [PATCH] drm/xe: Add DRM_XE_LOW_LEVEL_TRACEPOINTS
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Fri, 5 Jan 2024 14:23:16 -0300
Message-ID: <170447539640.198519.6458162717929687417@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: SJ0PR13CA0016.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::21) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DS0PR11MB8230:EE_
X-MS-Office365-Filtering-Correlation-Id: ac84e167-813b-4d90-fcac-08dc0e130389
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /wnvtT8UDULsEaSooUkB5/f5VBhizQwyc5fwWDCCivkw19hz1Fcr+nM8G+4ddHu+7A55vbNCb5CuGhCCvmxweoofDvubRMXfGgSAUM74DFPNczwB2hHtBPOmpTOh23xQYLUIgsycB3BaWFOuDpnkUCEjyGOIgEtVt8SFolWNX5WAqriUkuLjXHFoQWTBRQX8FgOZ12wHb2SXX4h4GYML/ulaPi0NQucNnv7gvSQeU6XZNKA1qSALMJIRmot1N/MIZ1QvlbP4Kg5G6YiWXgQdTx9p5Bs/k3np5HLL32KwaOJJA4pfV8W/wtym9aKYgCexVMcPn1ZGEIFeI4/M4l8qctx0Ey+JKzVDYGjQ2/B0zYyhYgUzMKsW4Q6w2vhk/wPLELUDfkCuUwzTOre/bdxIeh67y9XBz4OlL12fHsO+ThLP/lWRjTRifOk+JDrRDOmhVVzhDeSUiX0dD4gyuGLODPR0a3RzK7p8195A84ncdKgF6C2ym76AjkE163UNaL/B8bMaZvw5IO4wKbWQHRUajx6Seza2wHc4sewoygWAYXDUlrDeHTYO+L1OrcjCKpIp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(346002)(39860400002)(366004)(136003)(376002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(66574015)(26005)(83380400001)(66556008)(82960400001)(86362001)(6486002)(6666004)(316002)(66946007)(478600001)(66476007)(6506007)(9686003)(38100700002)(6512007)(8936002)(44832011)(5660300002)(8676002)(33716001)(41300700001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enFkN1JUbXRHWDlFKzVwSW90N0NpdC9PYVozT3ZVQ3NmOExLbjM2Njl6azAv?=
 =?utf-8?B?aXprWHJuRWJJeXJXOXAzNWpQME5OcFV1VzkrUlNDUkE1MVpacndxcGt0RFhU?=
 =?utf-8?B?QnRERjVVQTdKTmtSMkdGZ25lS1FRUVVrSWdFS0VNTEo5M3Q1aUlxUEdLbUU0?=
 =?utf-8?B?dWU5SlBVS0lWMlJqTkZ3Y3hldVJUUnJnTlZPcnl0eE1lU0lJeDNnOEMyZys3?=
 =?utf-8?B?MlNDeDhOKzNiR01uWGJNTFRVdjdxVFNpbVp6bVUydmxSVDk5Z0NjYWt0dkVv?=
 =?utf-8?B?VHhINU1vRHQvQVBEV2ZNTWcrVDFkaWI4bkpGckhMa1FRc3Q0Nm5Xcy80T1Mw?=
 =?utf-8?B?c0RWd0JacWYwaFZBRE9kNFpvbXIwZ2FteUd3R291OUUyNWhML3p1TUNUNHZm?=
 =?utf-8?B?QlpWWXZ3NWxYTXBJbXZNbm9mV2tLczFIajJxZ1VwWEpHcjZRRlBlSUNaeDlF?=
 =?utf-8?B?a0p3am53R1hONXFjZ2pDUUNDTG0wTUIxeENpOHlTS2xaeHp5RnRycWxJNXp2?=
 =?utf-8?B?WVpPb2FDOWhUcUU1T3pxdW5VVGJhU3FkZXJsbU56MlhwTzFtVnlOMWw5NXA5?=
 =?utf-8?B?N1EydmJGcUVzc3pmWGMvZHhJQWlKemRVVkNTb3llNDF5ckJLZUlFclZ0cHFh?=
 =?utf-8?B?SGRSSHA3MkM0SE1RWmtPcm80M3FZMHZ5MUNMZklKSEJpTzd5STRGeFovYnpG?=
 =?utf-8?B?cm5aaE9wNnBrTEI3TGVKeUFIL1dJcFNNWmliZFh4OXBzYWg2TUYyMnJzMmdL?=
 =?utf-8?B?eWtuQS9aZ1dKbEJJODVGaVFkblFFc044QjRIUGo3R3FjaUNMckJEMnYvNDFK?=
 =?utf-8?B?dXFsMlA5QUtuRTNDMWZYUVVod2V3a3dSMnpBSW1wUVZGODlZZUNIbGZTODNL?=
 =?utf-8?B?MlBUZTN5TGF3K2FsdzQ2VGsxQndWQnN5a29XZSswaldKZjcxRDQyNm5sbTlU?=
 =?utf-8?B?eXRGcitGMi8wM01tUlQvM3FNYS84WG51L0ZiNGd1aDhQSHRuTlV4TW5mekhk?=
 =?utf-8?B?cWcwTUV4VWFtN0hDbU1DZ0xkekNxelI2UjdBWEMxZkVxY2VlM0FLRFZwVzEz?=
 =?utf-8?B?d1dPbFBEWVlHUW5CT3dlcGJNWGJGcjk4UUtaUHlwbUh2b0VtUHpXTnpYZWQz?=
 =?utf-8?B?VlNOa2lOS2p0U2RnQXJMWkRQNDBzL0U4dTJ0RHBMNFdDclA5NXZmMUhKaFU2?=
 =?utf-8?B?eU44QnFQazRyZm9OdU9zNmhlbFN0S0ZkMlcwQkkwWStxM2FQdTQwQWJFa3Fu?=
 =?utf-8?B?TTBOUHk5bTVSUkRTd2NBRVRadU9SYnl4R2gvNlJpUjM0MFV4VHdRQmx2VXY1?=
 =?utf-8?B?WjFTQ3BoT0MzaWU0QXArUk1qL0pwMmJVN1h2cDY4TnU3RXlzME5sMmNqc0Rt?=
 =?utf-8?B?RjFoUzkxOEV4UUxoWmdmUzZhM2s4cmJ3SGl2a0FrSG1xTEkzSXIwQk1OVHlL?=
 =?utf-8?B?ZDNaVFF1ditVRXowV01lN2R0VkViNitxcW1rZWFDREtMVWNtdTB2VWZ6UzA0?=
 =?utf-8?B?VkVqS3JvUjhTbXJsVnFtQnRibTYzR2tuaHNYZVd2QS9mTTZ6OGMvb09BaEZK?=
 =?utf-8?B?elNRRFpBWlNiOWNJcmo0R0VPUENpQml1UmdsUmYrM2RBUXI2SXdkQ055akxH?=
 =?utf-8?B?K2xMOXRka3ZrbFZnaTFXUTlYbnZSMVpkZFoySXF3Y1JNT1J6TkFQT3FqUFBn?=
 =?utf-8?B?dHpPMURheHhGeVZYQzdMNlVtREd5MWs2Z1ZsS0hrTk5NT1lnUGFzOCtSaHUv?=
 =?utf-8?B?M09CWUZzVXBqdk00aXVDdEdBZUo2NzJmTmcyUWJRVHZkclRhb0NGRzBXd0hY?=
 =?utf-8?B?R0dkd0ZXaVlXMjlrZ3JrNWM0R3N6Y1RIc016S3JzRllVWlZhU1RpMzZyZ2I3?=
 =?utf-8?B?YjlwZE0xMVlUaE1QbHQxV0M1Uks5eFNrZ1N3RzJiZjFwMmVmWmsyV2JpLzYx?=
 =?utf-8?B?N2hVTVg2VW9kT2dLb0doTHpZMkZQOG94TzZaTmlxTWUwNFZxTGhGelVXcm1H?=
 =?utf-8?B?R2pJcyt2aVNmZnNXYWk1OEUyWldvelhtR2VpTTF5VFRubFhqL1pPZ2xMaHlQ?=
 =?utf-8?B?eDdPbVF2QVRTL1VrazZMYlJoZTNmelg4VW03ZVNzVGlldHFOU2FMaFQ4TURr?=
 =?utf-8?B?aTBFVTJLYnlzNWtZR21ML0lnVkkyVkRYc0VwKzBvZ2xTVlhSTU1MYnBiOW5H?=
 =?utf-8?B?M2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac84e167-813b-4d90-fcac-08dc0e130389
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2024 17:23:20.9226 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FosMnZxzfClXJ5S3wHHcbqshgYw3Sw26cbJE1LQS+rWvRbiVF1IUysgI4leaQ2OjCPKHxlJoGYCvbhwsErlaiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8230
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

Quoting Matthew Brost (2024-01-05 13:45:30-03:00)
>Trace events are uABI. The Xe trace events currently implemented are
>developer only and subject to change. Hide all Xe behind
>DRM_XE_LOW_LEVEL_TRACEPOINTS so these are free to change going forward.
>
>Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>---
> drivers/gpu/drm/xe/Kconfig.debug |  10 +
> drivers/gpu/drm/xe/Makefile      |   4 +-
> drivers/gpu/drm/xe/xe_trace.h    | 339 +++++++++++++++++++++++++++++++
> 3 files changed, 352 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig=
.debug
>index 549065f57a78..a8785e71e224 100644
>--- a/drivers/gpu/drm/xe/Kconfig.debug
>+++ b/drivers/gpu/drm/xe/Kconfig.debug
>@@ -105,3 +105,13 @@ config DRM_XE_USERPTR_INVAL_INJECT
>=20
>          Recomended for driver developers only.
>          If in doubt, say "N".
>+
>+config DRM_XE_LOW_LEVEL_TRACEPOINTS
>+       bool "Enable low level trace events"
>+       default n
>+       help
>+         Choose this option to enable low level trace events.
>+
>+         Recomended for driver developers only.
>+
>+         If in doubt, say "N".
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index 53bd2a8ba1ae..9d33e6975ba0 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -129,7 +129,6 @@ xe-y +=3D xe_bb.o \
>         xe_sync.o \
>         xe_tile.o \
>         xe_tile_sysfs.o \
>-        xe_trace.o \
>         xe_ttm_sys_mgr.o \
>         xe_ttm_stolen_mgr.o \
>         xe_ttm_vram_mgr.o \
>@@ -142,6 +141,9 @@ xe-y +=3D xe_bb.o \
>         xe_wa.o \
>         xe_wopcm.o
>=20
>+# trace support
>+xe-$(CONFIG_DRM_XE_LOW_LEVEL_TRACEPOINTS) +=3D xe_trace.o
>+
> # graphics hardware monitoring (HWMON) support
> xe-$(CONFIG_HWMON) +=3D xe_hwmon.o
>=20
>diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
>index 95163c303f3e..7163ac9b8eae 100644
>--- a/drivers/gpu/drm/xe/xe_trace.h
>+++ b/drivers/gpu/drm/xe/xe_trace.h
>@@ -21,6 +21,7 @@
> #include "xe_sched_job.h"
> #include "xe_vm.h"
>=20
>+#if defined(CONFIG_DRM_XE_LOW_LEVEL_TRACEPOINTS)
> DECLARE_EVENT_CLASS(xe_gt_tlb_invalidation_fence,
>                     TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
>                     TP_ARGS(fence),
>@@ -597,6 +598,344 @@ DEFINE_EVENT_PRINT(xe_guc_ctb, xe_guc_ctb_g2h,
>                              __entry->tail, __entry->_head)
>=20
> );
>+#else
>+#if !defined(TRACE_HEADER_MULTI_READ)

I wonder if we could have XE_* variants of the macros used above so that
we do not need to declare an empty trace_* function for each event
added.

For example, here's is a foo.h file that I created to test the idea:

    #if !defined(CONFIG_DRM_XE_LOW_LEVEL_TRACEPOINTS)
    #define _XE_TP_PROTO(...) __VA_ARGS__
    #define XE_DEFINE_EVENT(__unused, __fn, __proto, ...) \
        static inline void trace_ ## __fn(_XE_ ## __proto) { }
    #else
    #define XE_DEFINE_EVENT(...) DEFINE_EVENT(__VA_ARGS__)
    #endif

    XE_DEFINE_EVENT(xe_gt_tlb_invalidation_fence, xe_gt_tlb_invalidation_fe=
nce_create,
             TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
             TP_ARGS(fence)
    );

Output of `gcc -E foo.h`:

    # 0 "/tmp/foo.h"
    # 0 "<built-in>"
    # 0 "<command-line>"
    # 1 "/usr/include/stdc-predef.h" 1 3 4
    # 0 "<command-line>" 2
    # 1 "/tmp/foo.h"
    # 9 "/tmp/foo.h"
    static inline void trace_xe_gt_tlb_invalidation_fence_create(struct xe_=
gt_tlb_invalidation_fence *fence) { }
   =20
   =20
     ;

Output of `gcc -E -DCONFIG_DRM_XE_LOW_LEVEL_TRACEPOINTS foo.h`:
    # 0 "/tmp/foo.h"
    # 0 "<built-in>"
    # 0 "<command-line>"
    # 1 "/usr/include/stdc-predef.h" 1 3 4
    # 0 "<command-line>" 2
    # 1 "/tmp/foo.h"
    # 9 "/tmp/foo.h"
    DEFINE_EVENT(xe_gt_tlb_invalidation_fence, xe_gt_tlb_invalidation_fence=
_create, TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence), TP_ARGS(fenc=
e))
   =20
   =20
     ;

Well, this is an isolated example, not sure it would work with the
kernel code. But I believe it is worth a try.

--
Gustavo Sousa

>+static inline void
>+trace_xe_gt_tlb_invalidation_fence_create(struct xe_gt_tlb_invalidation_f=
ence *fence)
>+{
>+}
>+
>+static inline void
>+trace_xe_gt_tlb_invalidation_fence_work_func(struct xe_gt_tlb_invalidatio=
n_fence *fence)
>+{
>+}
>+
>+static inline void
>+trace_xe_gt_tlb_invalidation_fence_cb(struct xe_gt_tlb_invalidation_fence=
 *fence)
>+{
>+}
>+
>+static inline void
>+trace_xe_gt_tlb_invalidation_fence_send(struct xe_gt_tlb_invalidation_fen=
ce *fence)
>+{
>+}
>+
>+static inline void
>+trace_xe_gt_tlb_invalidation_fence_recv(struct xe_gt_tlb_invalidation_fen=
ce *fence)
>+{
>+}
>+
>+static inline void
>+trace_xe_gt_tlb_invalidation_fence_signal(struct xe_gt_tlb_invalidation_f=
ence *fence)
>+{
>+}
>+
>+static inline void
>+trace_xe_gt_tlb_invalidation_fence_timeout(struct xe_gt_tlb_invalidation_=
fence *fence)
>+{
>+}
>+
>+static inline void
>+trace_xe_bo_cpu_fault(struct xe_bo *bo)
>+{
>+}
>+
>+static inline void
>+trace_xe_bo_move(struct xe_bo *bo)
>+{
>+}
>+
>+static inline void
>+trace_xe_exec_queue_create(struct xe_exec_queue *q)
>+{
>+}
>+
>+static inline void
>+trace_xe_exec_queue_supress_resume(struct xe_exec_queue *q)
>+{
>+}
>+
>+static inline void
>+trace_xe_exec_queue_submit(struct xe_exec_queue *q)
>+{
>+}
>+
>+static inline void
>+trace_xe_exec_queue_scheduling_enable(struct xe_exec_queue *q)
>+{
>+}
>+
>+static inline void
>+trace_xe_exec_queue_scheduling_disable(struct xe_exec_queue *q)
>+{
>+}
>+
>+static inline void
>+trace_xe_exec_queue_scheduling_done(struct xe_exec_queue *q)
>+{
>+}
>+
>+static inline void
>+trace_xe_exec_queue_register(struct xe_exec_queue *q)
>+{
>+}
>+
>+static inline void
>+trace_xe_exec_queue_deregister(struct xe_exec_queue *q)
>+{
>+}
>+
>+static inline void
>+trace_xe_exec_queue_deregister_done(struct xe_exec_queue *q)
>+{
>+}
>+
>+static inline void
>+trace_xe_exec_queue_close(struct xe_exec_queue *q)
>+{
>+}
>+
>+static inline void
>+trace_xe_exec_queue_kill(struct xe_exec_queue *q)
>+{
>+}
>+
>+static inline void
>+trace_xe_exec_queue_cleanup_entity(struct xe_exec_queue *q)
>+{
>+}
>+
>+static inline void
>+trace_xe_exec_queue_destroy(struct xe_exec_queue *q)
>+{
>+}
>+
>+static inline void
>+trace_xe_exec_queue_reset(struct xe_exec_queue *q)
>+{
>+}
>+
>+static inline void
>+trace_xe_exec_queue_memory_cat_error(struct xe_exec_queue *q)
>+{
>+}
>+
>+static inline void
>+trace_xe_exec_queue_stop(struct xe_exec_queue *q)
>+{
>+}
>+
>+static inline void
>+trace_xe_exec_queue_resubmit(struct xe_exec_queue *q)
>+{
>+}
>+
>+static inline void
>+trace_xe_exec_queue_lr_cleanup(struct xe_exec_queue *q)
>+{
>+}
>+
>+static inline void
>+trace_xe_sched_job_create(struct xe_sched_job *job)
>+{
>+}
>+
>+static inline void
>+trace_xe_sched_job_exec(struct xe_sched_job *job)
>+{
>+}
>+
>+static inline void
>+trace_xe_sched_job_run(struct xe_sched_job *job)
>+{
>+}
>+
>+static inline void
>+trace_xe_sched_job_free(struct xe_sched_job *job)
>+{
>+}
>+
>+static inline void
>+trace_xe_sched_job_timedout(struct xe_sched_job *job)
>+{
>+}
>+
>+static inline void
>+trace_xe_sched_job_set_error(struct xe_sched_job *job)
>+{
>+}
>+
>+static inline void
>+trace_xe_sched_job_ban(struct xe_sched_job *job)
>+{
>+}
>+
>+static inline void
>+trace_xe_sched_msg_add(struct xe_sched_msg *msg)
>+{
>+}
>+
>+static inline void
>+trace_xe_sched_msg_recv(struct xe_sched_msg *msg)
>+{
>+}
>+
>+static inline void
>+trace_xe_hw_fence_create(struct xe_hw_fence *fence)
>+{
>+}
>+
>+static inline void
>+trace_xe_hw_fence_signal(struct xe_hw_fence *fence)
>+{
>+}
>+
>+static inline void
>+trace_xe_hw_fence_try_signal(struct xe_hw_fence *fence)
>+{
>+}
>+
>+static inline void
>+trace_xe_hw_fence_free(struct xe_hw_fence *fence)
>+{
>+}
>+
>+static inline void
>+trace_xe_vma_flush(struct xe_vma *vma)
>+{
>+}
>+
>+static inline void
>+trace_xe_vma_pagefault(struct xe_vma *vma)
>+{
>+}
>+
>+static inline void
>+trace_xe_vma_acc(struct xe_vma *vma)
>+{
>+}
>+
>+static inline void
>+trace_xe_vma_fail(struct xe_vma *vma)
>+{
>+}
>+
>+static inline void
>+trace_xe_vma_bind(struct xe_vma *vma)
>+{
>+}
>+
>+static inline void
>+trace_xe_vma_pf_bind(struct xe_vma *vma)
>+{
>+}
>+
>+static inline void
>+trace_xe_vma_unbind(struct xe_vma *vma)
>+{
>+}
>+
>+static inline void
>+trace_xe_vma_userptr_rebind_worker(struct xe_vma *vma)
>+{
>+}
>+
>+static inline void
>+trace_xe_vma_userptr_rebind_exec(struct xe_vma *vma)
>+{
>+}
>+
>+static inline void
>+trace_xe_vma_rebind_worker(struct xe_vma *vma)
>+{
>+}
>+
>+static inline void
>+trace_xe_vma_rebind_exec(struct xe_vma *vma)
>+{
>+}
>+
>+static inline void
>+trace_xe_vma_userptr_invalidate(struct xe_vma *vma)
>+{
>+}
>+
>+static inline void
>+trace_xe_vma_usm_invalidate(struct xe_vma *vma)
>+{
>+}
>+
>+static inline void
>+trace_xe_vma_evict(struct xe_vma *vma)
>+{
>+}
>+
>+static inline void
>+trace_xe_vma_userptr_invalidate_complete(struct xe_vma *vma)
>+{
>+}
>+
>+static inline void
>+trace_xe_vm_kill(struct xe_vm *vm)
>+{
>+}
>+
>+static inline void
>+trace_xe_vm_create(struct xe_vm *vm)
>+{
>+}
>+
>+static inline void
>+trace_xe_vm_free(struct xe_vm *vm)
>+{
>+}
>+
>+static inline void
>+trace_xe_vm_cpu_bind(struct xe_vm *vm)
>+{
>+}
>+
>+static inline void
>+trace_xe_vm_restart(struct xe_vm *vm)
>+{
>+}
>+
>+static inline void
>+trace_xe_vm_rebind_worker_enter(struct xe_vm *vm)
>+{
>+}
>+
>+static inline void
>+trace_xe_vm_rebind_worker_retry(struct xe_vm *vm)
>+{
>+}
>+
>+static inline void
>+trace_xe_vm_rebind_worker_exit(struct xe_vm *vm)
>+{
>+}
>+
>+static inline void
>+trace_xe_guc_ct_h2g_flow_control(u32 _head, u32 _tail, u32 size, u32 spac=
e, u32 len)
>+{
>+}
>+
>+static inline void
>+trace_xe_guc_ct_g2h_flow_control(u32 _head, u32 _tail, u32 size, u32 spac=
e, u32 len)
>+{
>+}
>+
>+static inline void
>+trace_xe_guc_ctb_h2g(u8 gt_id, u32 action, u32 len, u32 _head, u32 tail)
>+{
>+}
>+
>+static inline void
>+trace_xe_guc_ctb_g2h(u8 gt_id, u32 action, u32 len, u32 _head, u32 tail)
>+{
>+}
>+#endif
>+#endif
>=20
> #endif
>=20
>--=20
>2.34.1
>

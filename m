Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 620E5C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 19 Apr 2024 03:21:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBE0010FB00;
	Fri, 19 Apr 2024 03:21:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q9cS4kVB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55ADA10FB00
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Apr 2024 03:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713496875; x=1745032875;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ls571Dxof2qcCUzNFrPgO6MkRRX2aHwJjyFaJ9UZGeY=;
 b=Q9cS4kVBYuB76nofxYscd9c92kG0b95zIEzpKt/bTXSDZPy2bcWJaYGo
 3vMaIVctKVFYkqm2Q9vJxKG+1KyG3bwJEYnMU/ejQ9hOV1KOCD9UHZnw0
 JvS+EOpKjGrsN5NMkMHSOgeRVBj++2cx27JG+xoqVmWMtdF2BTQHRi7iE
 tUPXuLwWc5xumNIc6+8AiBw18hLWrAPADk0v04yUZTH3jJKEukS3OAu3u
 2wbypSMgk+MgRQLlp8mAmie/sVyBLnGnR7bAJ+qQghC5NnMGMylvlrBJ/
 tlJgWAUTQnS/xJr+a9UOjs7L/iRHigmddb/s/pbAXG/QQwG7mGXdkOw2J Q==;
X-CSE-ConnectionGUID: stBHig2lT428jbjCmPWo1g==
X-CSE-MsgGUID: 2/KXWsZ0RluomRC3rl9cFQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="12026119"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="12026119"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 20:21:14 -0700
X-CSE-ConnectionGUID: R9mW0bl0RdWXhzWMWApCFg==
X-CSE-MsgGUID: PgqvcalmT5OH47PKoPnzyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="27975048"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Apr 2024 20:21:14 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 20:21:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 20:21:12 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Apr 2024 20:21:12 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Apr 2024 20:21:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n5ikRzVJKTR3T0fgxPE7AbwYgJ+v79a20WpYCeBqp/zJ2mGmsVvZgoKd6PRwfoLj1RmGBqqfdHAvclm0l1/MLysffYyQ3D6ZMGClkltD8+b0D2HNUi6rnT1cXD99COMXzxBZ3qHpoULHOLyfJxjg1JT22N/Q9BxKou46bYs0Ql0bLaqPayJhN8VRop7x/EjPZlGBo8K414QQumNzcQnvaF/oIBgtnVJh2OBANgHYyB3A9eijWGV/8OGc36AuMLYGMe/oZobahVjo9rdosrsbHRyYQPk2wP7DXLUnV7jeaRItbHdNq6iFG3xkyjcnm/qx6RTD7WC/7s0NCBjNAcOxHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TZWvdCqrhyzwQnJDm4WcwGk7iwU0u0W03ImkBEd4QOw=;
 b=iGBE5ugzQFnFOtJtMcRGVkHXBEqOXOkxtO940uy4Bd7eNJQPw7473Rt+ugoNp/xpmsj+0ned9tWdlC56dKC2HeF35QnR/FGGv6j6YkOisH3PzSZt91+CMA9SeQFT8aHL2V1FyaWS7t/jB7tW6auLxElAUqwaMkzRan32uPsQDoMVOEAy3kX7owTX89p7hwy9DS7qvoJS+bqkoE2NwbOGH7nZiCffHFrsZgI9+IE8efSkjL1ZKRuu5jVFOoAJsmeg3VncytbVDjkoPrHQK+Sfa5C+W7YOAlp5tiyI3PqLfP5pAS8ZEMS6z81IeClI7Vf3JsY3SL8ph3E2OqU/wXjXxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by CH3PR11MB8443.namprd11.prod.outlook.com (2603:10b6:610:1bd::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.12; Fri, 19 Apr
 2024 03:21:10 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::4b13:ba21:57e8:6da8]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::4b13:ba21:57e8:6da8%5]) with mapi id 15.20.7409.028; Fri, 19 Apr 2024
 03:21:10 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Auld, Matthew" <matthew.auld@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>
Subject: RE: [PATCH] drm/xe: Kill xe_device_mem_access_{get*,put}
Thread-Topic: [PATCH] drm/xe: Kill xe_device_mem_access_{get*,put}
Thread-Index: AQHakY9fI3bhcbaESU2L6LS6BDnXjLFuFuWAgADXDHA=
Date: Fri, 19 Apr 2024 03:21:10 +0000
Message-ID: <SN7PR11MB6750E0B7BDAC1FAFE6EEFBA2E30D2@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20240418125307.39579-1-rodrigo.vivi@intel.com>
 <20240418143049.43231-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240418143049.43231-1-rodrigo.vivi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|CH3PR11MB8443:EE_
x-ms-office365-filtering-correlation-id: c1a3fb41-4551-4eb2-f4f3-08dc601fc293
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: G07/V54vY5f62nFXuXXQQ/DexhVDN9zM8QP874HQEeR+UHTEeLclpXV1Q+t6h/k/szZIQMds5AivAJnaJx+2Y1lWujjzcC7p4bQb4UmiP4NriuCA7UcN2uBXgRNWYCXbTa0vLWE0C+9AvaEYdmfCYxJc4BkRo426SH5H4Z/dvTxSQnAYrpNDqejcUUAq1BypLrgmgYvI3j3/t03DJVj4ERBkkRGGnj1EVz4wT0fD6XcuAdDNu1dLd9xSdffrfIe8JDNDT2q3UlLTkZa5uF8dIvbr8hc1GmGT7s3388pvAcTEDk3CVwck5/yKfIGItCfE0XsbvoGl/rgbXiQ3dxe8tsya5Kteuo6LPAz5ELfoJfHGNNpk+oBKwboA/lq1Qbs9sPPEPC4PK4aCknVaNvaMlHgxKkzXyYrLs6lBzwSttEam5fidbujRC5LXcSOqFUEuSBdwLPw7aXZh+mjQ3VUOQslDfUK5f5Ah5r4QUJGayt8iQx90I6a0CIbHNQX9pG+fW9D/1OnD7WPuDqnEW7wb2CAv86qmRnMaRQPiinm0miKvcDUmcfY7fplpPMD148ye+Csky2cocQ03fh2Ni5PDactQy3ORcnfYV4FRCZSvAVj5ic+KjVKKRHUdvnSJnuKPjc09zR2aqsxc+e1ZL9D9J7wKXEjcK0LM8BUbO2KS1/4jsa03JfautM8uDeDkaFvnOKOjYTB4EVgHhEl7jLBUgA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QrvsdzwcJcgLreE4pg7WymBe6gtYOsYnHNNfMn/BVl77z2ynTcpjLyh/roZD?=
 =?us-ascii?Q?eHO9Ol5+Y+DhA53y1kzzwVtHY3+/5pW0uO28IanKmvS9tkr0DjHOYeQ0UB++?=
 =?us-ascii?Q?yLzDFrqydyHCE7TZD+JHHBjL2chWThBQyH1Nk3FmI8AxeETNMoq0XSxFVaAt?=
 =?us-ascii?Q?SnCHe7FLjH0FRdlNmIsDaAKoS//hLFSUXctlMbT5IuGia9+ApF9Ur85bTI+S?=
 =?us-ascii?Q?JAUyC3JssVyP4iKL5iCMGYn5Rzzs05kyWPE2BHeVcHrLByKHShR2KX8byKGa?=
 =?us-ascii?Q?3bxYGa2wbSIfug/6DIYDBqUlo0lGIthC229BiSL9G7ZCFAptMjKb5kRXgxn7?=
 =?us-ascii?Q?fe9jiaImXIa8PDcT4cBl1pZpKS9l+5nkS2FzKurNvi150YHYe8ytOTI+4pxh?=
 =?us-ascii?Q?wVevqM4sFA3LNMSK1/atUn5BzQ2mMgN1ELQ0+HKBUW1sycv+bmv0kSiYrp+8?=
 =?us-ascii?Q?NNVRQ9AjFOSgQP8gAauD3RxbdkhHxvNoZFXPjryJwEugvQbpUCkHnKo6KudQ?=
 =?us-ascii?Q?x2kcpWi7Ix56LbhZC27pJc/X/mRctaQSSolMrP8yE+dG/0ZCmHH5gMhGclct?=
 =?us-ascii?Q?czWGl+sXv1Ilb8yVngvIgqrcH8sLmGoKSDtQWg4Ufxxzg/06J90xBLJGkKfx?=
 =?us-ascii?Q?VAHcRF516i37oRazeUwG8AGTQPaYYvpbTa0viw7OW2DUtZ+1eP+bbg2bQhkq?=
 =?us-ascii?Q?E+HL3Dh6GeyoX1EP7GfRQIjQzEjqq5YzuBGnZFU4MACJTp2BySjTuNhKXYs9?=
 =?us-ascii?Q?KxVT8kUEOyVOMt3Qc3zxlP36gBiBlSQRO6vpRbjcJpQOm5xO0bzDsfzlVCMH?=
 =?us-ascii?Q?uVDAK39ajTh20P9DA+nVnlvtKTX/I/R0jpNzCB8obWxQaORezL8CDDXS9+AT?=
 =?us-ascii?Q?YOREs2oXE4+jTvksEP6DIGnfkSY9J7ulsrH41jXEzlB0GkgfLs4iotxWt1pO?=
 =?us-ascii?Q?PfqEoxvKaF9xq6wvoInkkZmQv3T9ZB68DQVCyzG8NyZ/PZ8PWhdocxGNSZUD?=
 =?us-ascii?Q?PYwpUuZ/2GhIQz6IpEdC+qcs9aFGvdgjYC9+hyDYECyKuqHYFCCJmg0KWcot?=
 =?us-ascii?Q?5ZMajBQNJV6UxdVlYDzDe0L8ecH6p5X0s7I+/N6327j1moXXBtTgowiHY4QQ?=
 =?us-ascii?Q?c5epAoUjgny4dmTtlFXfNBi2UuUkotyeMbhxW+sc0uhAjHGiCuJ7TglgRr3O?=
 =?us-ascii?Q?POLrA1ASMvx1j6frX2A1bhAqIt6mU2En4y2THpqEonwuffmVeusP3Rx9xVSV?=
 =?us-ascii?Q?bjnlabIJux/M0B/2FHARFM/iw6PgX5ka7mRNuMm/sehfWaMnILIuUerJcDUx?=
 =?us-ascii?Q?VeltHbLbFVdOsZAG2T59BN7CZ+N/PZdx/iST6SyvSKAWyTGiWmNjvf8pmQMs?=
 =?us-ascii?Q?KUchnC/H16UTswKqYRv7/7a8lcOoJg1JJsKINgpIhNvYA/ybsckIBUAbkJ4V?=
 =?us-ascii?Q?sRmE+RV4xhVRXpvtWOwX0JzBQSdDRF0uoxrLmwt9VlobusbDBqe317kqAo5Y?=
 =?us-ascii?Q?EHtJ5jJEomwys/mrWx6dRI2OgDjcbY/iJp13qbnpYQ3KWi4wj60SoBYmOCoz?=
 =?us-ascii?Q?WTbFIDCwVOhBJ3DUYJ5CUAqG2XyxKTOb+0R9wQKM?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1a3fb41-4551-4eb2-f4f3-08dc601fc293
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2024 03:21:10.4261 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H+yorZr5o/khwRzxVAi7eh//d5HaHpL29EMNCSUg1iHGqwbQNTBvFkbl63ySTmN0/calTgwgYuRGFr4g5gSYWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8443
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



> -----Original Message-----
> From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Sent: Thursday, April 18, 2024 8:01 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Auld, Matthew
> <matthew.auld@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>;
> Wajdeczko, Michal <Michal.Wajdeczko@intel.com>
> Subject: [PATCH] drm/xe: Kill xe_device_mem_access_{get*,put}
>=20
> Let's simply convert all the current callers towards direct xe_pm_runtime
> access and remove this extra layer of indirection.
>=20
> No functional change is expected with this patch since xe_mem_access_get
> was already using the xe_pm_runtime_get_noresume at this point.
>=20
> v2: Convert all the current callers instead of a big refactor at once.
>=20
> v3: - Rebased
>     - Squashed the GSC/HDCP
>     - Added a new case: sriov_pf_policy
>     - Improved commit message to highlight that
>       there's no functional change in this patch.
>=20

LGTM
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com> #v2
> Cc: Suraj Kandpal <suraj.kandpal@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/display/xe_fb_pin.c     |  5 +--
>  drivers/gpu/drm/xe/display/xe_hdcp_gsc.c   |  4 +--
>  drivers/gpu/drm/xe/xe_bo.c                 |  8 ++---
>  drivers/gpu/drm/xe/xe_device.c             | 36 ----------------------
>  drivers/gpu/drm/xe/xe_device.h             |  3 --
>  drivers/gpu/drm/xe/xe_device_types.h       |  3 --
>  drivers/gpu/drm/xe/xe_exec_queue.c         |  4 +--
>  drivers/gpu/drm/xe/xe_ggtt.c               |  9 +++---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c |  5 +--
>  drivers/gpu/drm/xe/xe_sched_job.c          |  5 +--
>  drivers/gpu/drm/xe/xe_vm.c                 |  6 ++--
>  11 files changed, 25 insertions(+), 63 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index 3a584bc3a0a3..3e1ae37c4c8b 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -10,6 +10,7 @@
>  #include "intel_fb_pin.h"
>  #include "xe_ggtt.h"
>  #include "xe_gt.h"
> +#include "xe_pm.h"
>=20
>  #include <drm/ttm/ttm_bo.h>
>=20
> @@ -193,7 +194,7 @@ static int __xe_pin_fb_vma_ggtt(struct
> intel_framebuffer *fb,
>  	/* TODO: Consider sharing framebuffer mapping?
>  	 * embed i915_vma inside intel_framebuffer
>  	 */
> -	xe_device_mem_access_get(tile_to_xe(ggtt->tile));
> +	xe_pm_runtime_get_noresume(tile_to_xe(ggtt->tile));
>  	ret =3D mutex_lock_interruptible(&ggtt->lock);
>  	if (ret)
>  		goto out;
> @@ -244,7 +245,7 @@ static int __xe_pin_fb_vma_ggtt(struct
> intel_framebuffer *fb,
>  out_unlock:
>  	mutex_unlock(&ggtt->lock);
>  out:
> -	xe_device_mem_access_put(tile_to_xe(ggtt->tile));
> +	xe_pm_runtime_put(tile_to_xe(ggtt->tile));
>  	return ret;
>  }
>=20
> diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> index 264b957f3639..d46f87a039f2 100644
> --- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> +++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> @@ -215,7 +215,7 @@ ssize_t intel_hdcp_gsc_msg_send(struct xe_device
> *xe, u8 *msg_in,
>  	addr_out_off =3D PAGE_SIZE;
>=20
>  	host_session_id =3D xe_gsc_create_host_session_id();
> -	xe_device_mem_access_get(xe);
> +	xe_pm_runtime_get_noresume(xe);
>  	addr_in_wr_off =3D xe_gsc_emit_header(xe, &hdcp_message->hdcp_bo-
> >vmap,
>  					    addr_in_wr_off,
> HECI_MEADDRESS_HDCP,
>  					    host_session_id, msg_in_len);
> @@ -247,6 +247,6 @@ ssize_t intel_hdcp_gsc_msg_send(struct xe_device
> *xe, u8 *msg_in,
>  			   msg_out_len);
>=20
>  out:
> -	xe_device_mem_access_put(xe);
> +	xe_pm_runtime_put(xe);
>  	return ret;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c inde=
x
> 9889adcc458b..bc1f794e3e61 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -716,7 +716,7 @@ static int xe_bo_move(struct ttm_buffer_object
> *ttm_bo, bool evict,
>=20
>  	xe_assert(xe, migrate);
>  	trace_xe_bo_move(bo, new_mem->mem_type, old_mem_type,
> move_lacks_source);
> -	xe_device_mem_access_get(xe);
> +	xe_pm_runtime_get_noresume(xe);
>=20
>  	if (xe_bo_is_pinned(bo) && !xe_bo_is_user(bo)) {
>  		/*
> @@ -740,7 +740,7 @@ static int xe_bo_move(struct ttm_buffer_object
> *ttm_bo, bool evict,
>=20
>  				if (XE_WARN_ON(new_mem->start =3D=3D
> XE_BO_INVALID_OFFSET)) {
>  					ret =3D -EINVAL;
> -					xe_device_mem_access_put(xe);
> +					xe_pm_runtime_put(xe);
>  					goto out;
>  				}
>=20
> @@ -758,7 +758,7 @@ static int xe_bo_move(struct ttm_buffer_object
> *ttm_bo, bool evict,
>  						new_mem,
> handle_system_ccs);
>  		if (IS_ERR(fence)) {
>  			ret =3D PTR_ERR(fence);
> -			xe_device_mem_access_put(xe);
> +			xe_pm_runtime_put(xe);
>  			goto out;
>  		}
>  		if (!move_lacks_source) {
> @@ -783,7 +783,7 @@ static int xe_bo_move(struct ttm_buffer_object
> *ttm_bo, bool evict,
>  		dma_fence_put(fence);
>  	}
>=20
> -	xe_device_mem_access_put(xe);
> +	xe_pm_runtime_put(xe);
>=20
>  out:
>  	return ret;
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index a7c4e4f73200..1ac910bd5115 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -733,42 +733,6 @@ void xe_device_assert_mem_access(struct xe_device
> *xe)
>  	xe_assert(xe, !xe_pm_runtime_suspended(xe));  }
>=20
> -void xe_device_mem_access_get(struct xe_device *xe) -{
> -	int ref;
> -
> -	/*
> -	 * This looks racy, but should be fine since the pm_callback_task only
> -	 * transitions from NULL -> current (and back to NULL again), during
> the
> -	 * runtime_resume() or runtime_suspend() callbacks, for which there
> can
> -	 * only be a single one running for our device. We only need to prevent
> -	 * recursively calling the runtime_get or runtime_put from those
> -	 * callbacks, as well as preventing triggering any access_ongoing
> -	 * asserts.
> -	 */
> -	if (xe_pm_read_callback_task(xe) =3D=3D current)
> -		return;
> -
> -	xe_pm_runtime_get_noresume(xe);
> -	ref =3D atomic_inc_return(&xe->mem_access.ref);
> -
> -	xe_assert(xe, ref !=3D S32_MAX);
> -
> -}
> -
> -void xe_device_mem_access_put(struct xe_device *xe) -{
> -	int ref;
> -
> -	if (xe_pm_read_callback_task(xe) =3D=3D current)
> -		return;
> -
> -	ref =3D atomic_dec_return(&xe->mem_access.ref);
> -	xe_pm_runtime_put(xe);
> -
> -	xe_assert(xe, ref >=3D 0);
> -}
> -
>  void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *=
p)  {
>  	struct xe_gt *gt;
> diff --git a/drivers/gpu/drm/xe/xe_device.h
> b/drivers/gpu/drm/xe/xe_device.h index 54490802e97b..36d4434ebccc
> 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -133,9 +133,6 @@ static inline struct xe_force_wake *gt_to_fw(struct
> xe_gt *gt)
>  	return &gt->mmio.fw;
>  }
>=20
> -void xe_device_mem_access_get(struct xe_device *xe); -void
> xe_device_mem_access_put(struct xe_device *xe);
> -
>  void xe_device_assert_mem_access(struct xe_device *xe);
>=20
>  static inline bool xe_device_in_fault_mode(struct xe_device *xe) diff --=
git
> a/drivers/gpu/drm/xe/xe_device_types.h
> b/drivers/gpu/drm/xe/xe_device_types.h
> index 60ced5f90c2b..2014d87765a2 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -384,9 +384,6 @@ struct xe_device {
>  	 * triggering additional actions when they occur.
>  	 */
>  	struct {
> -		/** @mem_access.ref: ref count of memory accesses */
> -		atomic_t ref;
> -
>  		/**
>  		 * @mem_access.vram_userfault: Encapsulate vram_userfault
>  		 * related stuff
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
> b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 50ec661116a2..395de93579fa 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -589,7 +589,7 @@ int xe_exec_queue_create_ioctl(struct drm_device
> *dev, void *data,
>  				return -EINVAL;
>=20
>  			/* The migration vm doesn't hold rpm ref */
> -			xe_device_mem_access_get(xe);
> +			xe_pm_runtime_get_noresume(xe);
>=20
>  			flags =3D EXEC_QUEUE_FLAG_VM | (id ?
> EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD : 0);
>=20
> @@ -598,7 +598,7 @@ int xe_exec_queue_create_ioctl(struct drm_device
> *dev, void *data,
>  						   args->width, hwe, flags,
>  						   args->extensions);
>=20
> -			xe_device_mem_access_put(xe); /* now held by
> engine */
> +			xe_pm_runtime_put(xe); /* now held by engine */
>=20
>  			xe_vm_put(migrate_vm);
>  			if (IS_ERR(new)) {
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 38f6c94c722d..0d541f55b4fc 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -21,6 +21,7 @@
>  #include "xe_gt_printk.h"
>  #include "xe_gt_tlb_invalidation.h"
>  #include "xe_map.h"
> +#include "xe_pm.h"
>  #include "xe_sriov.h"
>  #include "xe_wopcm.h"
>=20
> @@ -403,7 +404,7 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggt=
t,
> struct xe_bo *bo,
>  	if (err)
>  		return err;
>=20
> -	xe_device_mem_access_get(tile_to_xe(ggtt->tile));
> +	xe_pm_runtime_get_noresume(tile_to_xe(ggtt->tile));
>  	mutex_lock(&ggtt->lock);
>  	err =3D drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node,
> bo->size,
>  					  alignment, 0, start, end, 0);
> @@ -413,7 +414,7 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggt=
t,
> struct xe_bo *bo,
>=20
>  	if (!err && bo->flags & XE_BO_FLAG_GGTT_INVALIDATE)
>  		xe_ggtt_invalidate(ggtt);
> -	xe_device_mem_access_put(tile_to_xe(ggtt->tile));
> +	xe_pm_runtime_put(tile_to_xe(ggtt->tile));
>=20
>  	return err;
>  }
> @@ -432,7 +433,7 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct
> xe_bo *bo)  void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct
> drm_mm_node *node,
>  			 bool invalidate)
>  {
> -	xe_device_mem_access_get(tile_to_xe(ggtt->tile));
> +	xe_pm_runtime_get_noresume(tile_to_xe(ggtt->tile));
>=20
>  	mutex_lock(&ggtt->lock);
>  	xe_ggtt_clear(ggtt, node->start, node->size); @@ -443,7 +444,7 @@
> void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
>  	if (invalidate)
>  		xe_ggtt_invalidate(ggtt);
>=20
> -	xe_device_mem_access_put(tile_to_xe(ggtt->tile));
> +	xe_pm_runtime_put(tile_to_xe(ggtt->tile));
>  }
>=20
>  void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo) diff --gi=
t
> a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> index 3eaa17ca54fc..fae5be5a2a11 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> @@ -12,6 +12,7 @@
>  #include "xe_gt_sriov_printk.h"
>  #include "xe_guc_ct.h"
>  #include "xe_guc_klv_helpers.h"
> +#include "xe_pm.h"
>=20
>  /*
>   * Return: number of KLVs that were successfully parsed and saved, @@ -
> 368,7 +369,7 @@ int xe_gt_sriov_pf_policy_reprovision(struct xe_gt *gt, b=
ool
> reset)  {
>  	int err =3D 0;
>=20
> -	xe_device_mem_access_get(gt_to_xe(gt));
> +	xe_pm_runtime_get_noresume(gt_to_xe(gt));
>=20
>  	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
>  	if (reset)
> @@ -378,7 +379,7 @@ int xe_gt_sriov_pf_policy_reprovision(struct xe_gt
> *gt, bool reset)
>  	err |=3D pf_reprovision_sample_period(gt);
>  	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
>=20
> -	xe_device_mem_access_put(gt_to_xe(gt));
> +	xe_pm_runtime_put(gt_to_xe(gt));
>=20
>  	return err ? -ENXIO : 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c
> b/drivers/gpu/drm/xe/xe_sched_job.c
> index 80daee910ae9..cd8a2fba5438 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.c
> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> @@ -16,6 +16,7 @@
>  #include "xe_hw_fence.h"
>  #include "xe_lrc.h"
>  #include "xe_macros.h"
> +#include "xe_pm.h"
>  #include "xe_sync_types.h"
>  #include "xe_trace.h"
>  #include "xe_vm.h"
> @@ -159,7 +160,7 @@ struct xe_sched_job *xe_sched_job_create(struct
> xe_exec_queue *q,
>=20
>  	/* All other jobs require a VM to be open which has a ref */
>  	if (unlikely(q->flags & EXEC_QUEUE_FLAG_KERNEL))
> -		xe_device_mem_access_get(job_to_xe(job));
> +		xe_pm_runtime_get_noresume(job_to_xe(job));
>  	xe_device_assert_mem_access(job_to_xe(job));
>=20
>  	trace_xe_sched_job_create(job);
> @@ -192,7 +193,7 @@ void xe_sched_job_destroy(struct kref *ref)
>  		container_of(ref, struct xe_sched_job, refcount);
>=20
>  	if (unlikely(job->q->flags & EXEC_QUEUE_FLAG_KERNEL))
> -		xe_device_mem_access_put(job_to_xe(job));
> +		xe_pm_runtime_put(job_to_xe(job));
>  	xe_exec_queue_put(job->q);
>  	dma_fence_put(job->fence);
>  	drm_sched_job_cleanup(&job->drm);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c inde=
x
> 8a858b8588bd..85d6f359142d 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1266,7 +1266,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe,
> u32 flags)
>  	vm->pt_ops =3D &xelp_pt_ops;
>=20
>  	if (!(flags & XE_VM_FLAG_MIGRATION))
> -		xe_device_mem_access_get(xe);
> +		xe_pm_runtime_get_noresume(xe);
>=20
>  	vm_resv_obj =3D drm_gpuvm_resv_object_alloc(&xe->drm);
>  	if (!vm_resv_obj) {
> @@ -1376,7 +1376,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe,
> u32 flags)
>  		xe_range_fence_tree_fini(&vm->rftree[id]);
>  	kfree(vm);
>  	if (!(flags & XE_VM_FLAG_MIGRATION))
> -		xe_device_mem_access_put(xe);
> +		xe_pm_runtime_put(xe);
>  	return ERR_PTR(err);
>  }
>=20
> @@ -1507,7 +1507,7 @@ static void xe_vm_free(struct drm_gpuvm
> *gpuvm)
>  	mutex_destroy(&vm->snap_mutex);
>=20
>  	if (!(vm->flags & XE_VM_FLAG_MIGRATION))
> -		xe_device_mem_access_put(xe);
> +		xe_pm_runtime_put(xe);
>=20
>  	for_each_tile(tile, xe, id)
>  		XE_WARN_ON(vm->pt_root[id]);
> --
> 2.44.0


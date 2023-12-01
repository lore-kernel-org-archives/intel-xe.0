Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB02C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  1 Dec 2023 08:47:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34CA210E81E;
	Fri,  1 Dec 2023 08:47:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCEAD10E82D
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Dec 2023 08:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701420441; x=1732956441;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=+TSfUvDTxT36/kWzYlhmIj6GCliED3poiUNEfMjlWGU=;
 b=W0RTqyMGxP/xCY4KImYXrZT4WDYMlZjKs+2hD7r/o3eIYBlxf9I4WrJI
 U9r3xUHh6rXE6RWKiK/bxXlHVIarpKasOSAziOxemtkyYDnD5jmIrVNgx
 F6A4Adljc/R1U7y1IfPCLXIKEYwgjbYrIAZm6tWpRgPOsu5MrI3rLJzGs
 q8Omv4NvzsC05+JWxeKS2FwhGd3zxmbvheZfTq4OX5ASwNLo+oSdjxkNc
 dKbXEX6p/WBlL5KSiVwv4YUxTwuebifBJpQP+MZ+eRFx3mtgDZ7XdaPDk
 LzSMsYpDPBLw+y9AilBQnIEWpILAFil0/46h4rf9DrwHDkZgyLFxqdloo w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="397354914"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; d="scan'208";a="397354914"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2023 00:47:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="887568235"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; d="scan'208";a="887568235"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Dec 2023 00:47:21 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 1 Dec 2023 00:47:20 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 1 Dec 2023 00:47:19 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 1 Dec 2023 00:47:19 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 1 Dec 2023 00:47:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I0l5m/lNV6tvew2GoaUF122VmLqofA4M9I6t3jIQ1Zgjc99wKAztZ/1vXgDBxkKoJKsH6rWbQdEDzEemGEpT/5+dl0cD2kWh3wKy5YHf2B5yRRPrkNoWg4sc0N1DXuC7k2rzhT0jyOZf0HMSjcpp0rlX5rk1POQqBPvhuX8eTDiKwhAyR9O2QF+G6eadjeAENij7qBdCT7LHzDMXEH5vlEU2hzW5ZHo6X57X72qFx8QGZxBwPPyfl5LsIUdrxBnQw47Za2dhzmsoDGrkVnYatebumcuuiR9Ql/Mx1tS74LHlTMWwQ9sPvRby5CBBql3lIFZLfrJLK1ATApLiiollxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BxETjw9tvpSWUQSGcTN6WvuS9v45RUsBWh2GC3Mi1LA=;
 b=Wk9nOlXauqr+h2SyZsuEPKZQsj1i/Cm73V5U9s7ZAmmUFJs26kad8VGmCalc5xrnCcbSUZLoiyn7pNEDh97Q1QAKreIAyEU074TO+3nsIolDxrCNHWIRZUp290jmufDhfumlRlz6StmkNPivvPEgWlydzNQfx75u6MFLBgtqm1SkYzgY0e/3EGEO/8mGYk18Ez4ZlFs7PQ06xOtc48B482oZ641Mnfs6hftI2Cf/furWC5P4vFLmm4PYX0ajI3MXbf+iOMfIcGVmEPofGECNZNoXN1ZvDvTXSs92Cwl7oOIh7HPzKjiap3EVnT7sYi/XpWtK4ROpMBVecK4Fnc+raA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6344.namprd11.prod.outlook.com (2603:10b6:930:3b::6)
 by DS0PR11MB7444.namprd11.prod.outlook.com (2603:10b6:8:146::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.27; Fri, 1 Dec
 2023 08:47:12 +0000
Received: from CY5PR11MB6344.namprd11.prod.outlook.com
 ([fe80::d720:57b4:c6ef:ddd8]) by CY5PR11MB6344.namprd11.prod.outlook.com
 ([fe80::d720:57b4:c6ef:ddd8%4]) with mapi id 15.20.7046.015; Fri, 1 Dec 2023
 08:47:12 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Manna, Animesh" <animesh.manna@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH v2 6/6] drm/xe/dsb: DSB implementation for xe
Thread-Index: AQHaI17SYyl6hNZH6kiH747B+L4vKLCUHqAA
Date: Fri, 1 Dec 2023 08:47:12 +0000
Message-ID: <CY5PR11MB63447A414E04CD29FA46DDC6F481A@CY5PR11MB6344.namprd11.prod.outlook.com>
References: <20231130071407.606176-1-animesh.manna@intel.com>
 <20231130071407.606176-7-animesh.manna@intel.com>
In-Reply-To: <20231130071407.606176-7-animesh.manna@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6344:EE_|DS0PR11MB7444:EE_
x-ms-office365-filtering-correlation-id: 6fa8adc0-9517-4957-2b31-08dbf24a1cda
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OMwsoMPc1LmBv7LSTGMXFw2yiJhNQoQJ0jC3zMzu7fyWT7TXU+kjksJ5by0ONHTB69UyMHROQ5o+zCW3QhnaGxroOxeEOZ6wD6Eajwzk+7gJYfuxGYHwg4g7GzFMpNkrp72luG4s4/wzA7JZ+vUUeLey82GCAWOV8TcGF72JVOF+/70eJ2ISXtBsj/fZtnT0VWC4bexB3D1MkumrTtoZl+1YGdLMe590B6aVSCVcuCGpxaOzMUQGgbDCxSu1p4LH7bRxeiL3sEC2FLkLIzAdF8anS0HynkvDMwmbp+2Z9a0OoomJiJDDpolhiKQzbqyfgVoJw+Cs5DEoDWOCbO/mdazFADaDBkdJS/ylp4olXCiqPxYrJfa8lAUL5f3174zkw1UvOJ3PjNfOSKZhekw8qellgTUhldQFjRzsbTS6AJKvlLjegXxiJPIu3dYogW/LRys23SHm0X5GLihQXZ8dVjzpGHsYI3BNSZ12UZJxi1zSWkTRfv2qQByUZCRaPbsy5Jr/b90WXikUOCMQHL8x2j5Mjrct1vZ5/AT0MMBQCrx2ysilspkwHJVRNyiPIi+AJ2VLqIV82tBniAcOUcJWIGkBLDWtc8oN8CzPjNAWpzlpagIWPwjzY3bga9bVS9vs
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6344.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(376002)(136003)(396003)(39860400002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(2906002)(52536014)(8676002)(8936002)(55016003)(41300700001)(26005)(76116006)(110136005)(316002)(66476007)(64756008)(66556008)(66946007)(66446008)(5660300002)(9686003)(53546011)(6506007)(7696005)(83380400001)(122000001)(86362001)(82960400001)(38100700002)(33656002)(71200400001)(478600001)(38070700009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VpN9QxT25zWv/lhSX+EsmMn9KA+jExi+a+7rfu+FaAObzaD2BUN/RoBpuvnd?=
 =?us-ascii?Q?PIqM5asj1asAY3kuZ0g1ao3RgNjBtQbHDpWVCn0Wg5IDrkAgt0jV4fASw8RJ?=
 =?us-ascii?Q?HyrvC/D3GG5SAB6CC2d7TLNvvQJG7A+ys4SeKQN3vsSMpo2yN69CSwvFpMTe?=
 =?us-ascii?Q?A03iY+xOpLJOA2VYXQ37VO1C7Ug1S9X490PM3CyBKqEZ1kVBBy7IXLp3TYUv?=
 =?us-ascii?Q?qSOMDJeEiXKHhHkkDkOSZaZAQzt+Ib7QDKQJg68xetvzaR33zQPyrAm/cVZg?=
 =?us-ascii?Q?xz9t7jqg7/K8IsaMQ1mIqK/sJ4DFIS1bY4s2H32HcnDJnxmG/zykBo+J7dzH?=
 =?us-ascii?Q?yjPvbezO0fdBL7Qw0tPsu0a8HqwQiVlbv+nWnX1bQjg1AqP5MQeUPixP9X1j?=
 =?us-ascii?Q?CsfotWr0VZtxVXFsvPKebF8rULkr7o01p5GDfVklnI8qiR2voH4yXNp4u7mx?=
 =?us-ascii?Q?G7HUzgC1KXJs5ucSk8Xu0VgEjF/PtbKMwc7gpLb3hlkB6SCErInbrxvWzcXn?=
 =?us-ascii?Q?7t8M9kbnxUJruZ61jTRmJFWbCISWBIaXYTQ+/g9thmrD33OoYor060JdYqr4?=
 =?us-ascii?Q?n05gFgJ1hgY+zq/aRVntosaMVYhafieQeyg24SMyot9evYXC3DwzyLx25DSC?=
 =?us-ascii?Q?8dNojbvrHOjGDOvEc4YAop5LCqajZmHFs5u/0UgcDyTDJTOz85bWqrlHweWf?=
 =?us-ascii?Q?ZeKvmw7JQe0CPtlFrTQ35QDvtDczoyLiC/x0tiM8AhtS0K5YjktkE+5uvygd?=
 =?us-ascii?Q?xyYRnaavEyxM/8oFC/mSf79dmsJMCTz2YRX7NlFNV8lX3UpLVtC5UljV8vIp?=
 =?us-ascii?Q?XxJB1NdCR4fEI7wf1F/2MLbex+30TgGPwYAbyPOeRNh53d2GnVY/E/UXYZfp?=
 =?us-ascii?Q?D8M2Gu+c9mCx+keKfJboC4UQazPcRLjPCKvV0o+G0HtCJQVaOz1+crGx+/rs?=
 =?us-ascii?Q?9UPRMl2l+kNx+dG95BAwzZSPMV1Ka5S63yGFRYOrxFyHVJ1Cc/vgnOp3eWck?=
 =?us-ascii?Q?z7s3wJEZnSSphP+hPl7tMK9IxG9ZYHlLX5Rkj5lSuEg88+3TXXX15ZqMV8Ja?=
 =?us-ascii?Q?RP0Jc+rskeQmIyS7jFhPc60LAsM8Qap5K8hpK2X5Wm1YYspswVCWVH86P5QG?=
 =?us-ascii?Q?GvCae4D3oHZNk2T1A71CnxEwaa0pTPZNGKPnV0Ug5qHLQ3/EbXXJqWEBv5Jq?=
 =?us-ascii?Q?zX8wcSGuRlPdrDcn8NlgOOUSQG+MMrULN1byZoPtcrMfJbhoHS78D3g4Afvf?=
 =?us-ascii?Q?5kbCARf0aZ8sw0ZCIOxk7zmDF0bfI2nAIUq01hgdX1UcbsriVQiB/jgfUzYp?=
 =?us-ascii?Q?T4VnuHxsRszcvpTVtC8/LkbZHoXimZA0Z6qT9H6xq1/0ilkbRCqCzmt8IKne?=
 =?us-ascii?Q?U5ZFe7oWcBdjKXbuVx07nVvWowCMpTik79hsK7ZT0AVY6G9Ss7SQDiTgeQnd?=
 =?us-ascii?Q?CAna21ezIPGMkVBBPTm8+QVtnnmozHdgX3A0FKpThPk9GAZJi5PTDupWksyB?=
 =?us-ascii?Q?QXsN+dJToEPTDr+srspERvkYxBGMIxtz/ole4wyv1Xw657z4xjmeBdMJXWmK?=
 =?us-ascii?Q?H/fqcDEWYtakMrqag3U2SXgxYxTH56qQhR9r0Soq?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6344.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fa8adc0-9517-4957-2b31-08dbf24a1cda
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2023 08:47:12.8432 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5rAuB6zTjqNtTHIqx4Yh+at8mrqPasIqFupLEchPeYj5r1XHsCGOYyxnVZKYfPDLmeOkBowESiZb2FFlv9b5/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7444
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 6/6] drm/xe/dsb: DSB implementation for xe
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Anim=
esh
> Manna
> Sent: Thursday, November 30, 2023 12:44 PM
> To: intel-xe@lists.freedesktop.org
> Subject: [Intel-xe] [PATCH v2 6/6] drm/xe/dsb: DSB implementation for xe
>=20
> Add xe specific DSB buffer handling methods.
>=20
> Signed-off-by: Animesh Manna <animesh.manna@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile                |  1 +
>  drivers/gpu/drm/xe/display/xe_dsb_buffer.c | 70 ++++++++++++++++++++++
>  2 files changed, 71 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/display/xe_dsb_buffer.c
>=20
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile in=
dex
> 666024f316f6..87f3fca0c0ee 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -166,6 +166,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) +=3D \
>  	display/xe_plane_initial.o \
>  	display/xe_display_rps.o \
>  	display/xe_display_misc.o \
> +	display/xe_dsb_buffer.o \
>  	display/intel_fbdev_fb.o \
>  	display/ext/i915_irq.o \
>  	display/ext/i915_utils.o
> diff --git a/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
> b/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
> new file mode 100644
> index 000000000000..dc91eb425e0d
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
> @@ -0,0 +1,70 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright 2023, Intel Corporation.
> + */
> +
> +#include "i915_drv.h"
> +#include "i915_vma.h"
> +#include "intel_display_types.h"
> +#include "intel_dsb_buffer.h"
> +#include "xe_bo.h"
> +#include "xe_gt.h"
> +
> +u32 intel_dsb_buffer_ggtt_offset(struct intel_dsb_buffer *dsb_buf) {
> +	return xe_bo_ggtt_addr(dsb_buf->vma->bo);
> +}
> +
> +void intel_dsb_buffer_write(struct intel_dsb_buffer *dsb_buf, u32 idx,
> +u32 val) {
> +	iosys_map_wr(&dsb_buf->vma->bo->vmap, idx * 4, u32, val); }
> +
> +u32 intel_dsb_buffer_read(struct intel_dsb_buffer *dsb_buf, u32 idx) {
> +	return iosys_map_rd(&dsb_buf->vma->bo->vmap, idx * 4, u32); }
> +
> +void intel_dsb_buffer_memset(struct intel_dsb_buffer *dsb_buf, u32 idx,
> +u32 val, size_t size) {
> +	WARN_ON(idx > (dsb_buf->buf_size - size) / sizeof(*dsb_buf->cmd_buf));
> +
> +	iosys_map_memset(&dsb_buf->vma->bo->vmap, idx * 4, val, size); }
> +
> +bool intel_dsb_buffer_create(struct intel_crtc *crtc, struct
> +intel_dsb_buffer *dsb_buf, size_t size) {
> +	struct drm_i915_private *i915 =3D to_i915(crtc->base.dev);
> +	struct drm_i915_gem_object *obj;
> +	struct i915_vma *vma;
> +
> +	vma =3D kzalloc(sizeof(*vma), GFP_KERNEL);

Check for allocation success.

> +
> +	obj =3D xe_bo_create_pin_map(i915, xe_device_get_root_tile(i915),
> +				   NULL, PAGE_ALIGN(size),
> +				   ttm_bo_type_kernel,
> +
> XE_BO_CREATE_VRAM_IF_DGFX(xe_device_get_root_tile(i915)) |
> +				   XE_BO_CREATE_GGTT_BIT);
> +	if (IS_ERR(obj)) {
> +		kfree(dsb_buf->vma);
> +		return false;
> +	}
> +
> +	vma->bo =3D obj;
> +	dsb_buf->vma =3D vma;
> +	dsb_buf->buf_size =3D size;
> +
> +	return true;
> +}
> +
> +void intel_dsb_buffer_cleanup(struct intel_dsb_buffer *dsb_buf) {
> +	xe_bo_unpin_map_no_vm(dsb_buf->vma->bo);
> +	kfree(dsb_buf->vma);
> +}
> +
> +void intel_dsb_buffer_flush_map(struct intel_dsb_buffer *dsb_buf) {
> +	/* TODO: add xe specific flush_map() for dsb buffer object. */ }

Create an internal task to track this cleanup and send out a follow up chan=
ge.

With above addressed, Overall looks good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> --
> 2.29.0


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90F6BC4167B
	for <intel-xe@archiver.kernel.org>; Fri,  1 Dec 2023 09:30:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61D3610E82A;
	Fri,  1 Dec 2023 09:30:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3AAD10E82D
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Dec 2023 09:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701422998; x=1732958998;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=gO6ES4yRHuLPuFGR22B1Q7O63DtnaKragWkp9ExC7hM=;
 b=kWPm+pvd6kyPvHfP2CHI+ZyMtPbtiWAWfuxatg1HhyseBYITgGQL5ZUW
 OuyE1CJRkPY4SxcHYSg369crpa2nIjeA4ehfd/tUzrfEtgp5vmX8vIvM/
 U/XhYwrSe8zWFLONX3TKm5FftyUCb0rirrCmfFVP4fDCKk3x7Sg1Z4iGz
 TdD4diFaEsLvYfgAqtgv6udK7n0MWcMT0O6OBl6Q64KkBxTh1LnsPA8qb
 1FN1wcwHgEB38N6b53YkIKIJLryMffK/NHJps2wX2HJYsX8gXJIkI2snP
 PAn7csEuQ9zQKKC9uBYMiqSXX+sFKy4nrMVG2d213qX8ycQXt3oCkqxCw g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="365903"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="365903"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2023 01:29:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="1016988025"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; d="scan'208";a="1016988025"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Dec 2023 01:29:57 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 1 Dec 2023 01:29:56 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 1 Dec 2023 01:29:56 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 1 Dec 2023 01:29:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a6JoV4cLAZBFZJV8VqmsLrIq3wx+u9F69BLZsd0H5bW6vfngy650TsRM6+Eryci6k4TSm1CGcrcUO6y4PlqyR7SGaSKT3XSLxSYYSEBEOfozi+JIipSSyATCWuGv7+lNJvIjPB0GsJQNtcMawGKIaq0ScEIeD/8iHj8kS9K5AxuygIw+y1l+Q72t1Q/sQPGYbcZYoweDSWcaryh15TRzXT7kNtEusj7g3maeiT+OVzh+cFPMY+G4NFLiprz3I/0fzVMpm+Lz2kWEj4Oe30DMywoNBfN1CipJ0unyJ1TM1ySVXH/y1seY/14UaVzljtQx0OKYmqedZUdyJhB13S85Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qq6nbWFxGILRWtriG2XIG6OYco+VNLJyv9fAB0Irtww=;
 b=YNSWtYreTOD/flereq03oWdg2on7EEMTuQZdQCf0zlmBzIsgD/+CjDWvAmCS3LSCCZcWSxtw2ef8CIPzKhjmVs+RSJwwqf3y1QA1MTg4RvYriQNxIH3+T+dcvQK74+idwlaKqdcmM1ZWkAKQFz+lWdejMUnEe3/ApS/BKwBRh6XuTKZSYMv5K5qA619AngoBc5opv3Y4tHyxx0+eop40aZ4aRyXhNup9Om+kb4R5NOMjGJ5k2gi0LuBlHxZoEY0mDo1ZvzzX9hKUew9Y4Zo92ZHVsVjfHIMnj/3GctzDQDJZzu5pcu6V05/fizShzktoCCfVtmItOwiJQxPDOygEoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7SPRMB0049.namprd11.prod.outlook.com (2603:10b6:510:1f6::19)
 by PH7PR11MB8528.namprd11.prod.outlook.com (2603:10b6:510:2fd::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24; Fri, 1 Dec
 2023 09:29:54 +0000
Received: from PH7SPRMB0049.namprd11.prod.outlook.com
 ([fe80::682e:4013:e6de:5c66]) by PH7SPRMB0049.namprd11.prod.outlook.com
 ([fe80::682e:4013:e6de:5c66%5]) with mapi id 15.20.7046.024; Fri, 1 Dec 2023
 09:29:53 +0000
From: "Manna, Animesh" <animesh.manna@intel.com>
To: "Shankar, Uma" <uma.shankar@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH v2 6/6] drm/xe/dsb: DSB implementation for xe
Thread-Index: AQHaI16mn/oDay2AtEKujJwBqo6sWbCUHzYAgAALVeA=
Date: Fri, 1 Dec 2023 09:29:53 +0000
Message-ID: <PH7SPRMB0049A3675D9B904AB710E4E9F981A@PH7SPRMB0049.namprd11.prod.outlook.com>
References: <20231130071407.606176-1-animesh.manna@intel.com>
 <20231130071407.606176-7-animesh.manna@intel.com>
 <CY5PR11MB63447A414E04CD29FA46DDC6F481A@CY5PR11MB6344.namprd11.prod.outlook.com>
In-Reply-To: <CY5PR11MB63447A414E04CD29FA46DDC6F481A@CY5PR11MB6344.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7SPRMB0049:EE_|PH7PR11MB8528:EE_
x-ms-office365-filtering-correlation-id: 825dada3-c1f2-4fbd-7e7e-08dbf2501313
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VIv03Dk7h07SkApTOrmAqNbHPSC0OcPirTd7XcDJsrOS8QsL/5M99vZlejg9CByfoeBMmRIBGjxwum07oxa4lZasV1dKrNaWdFalCHyaL9nl7U5lKIhXFMPZOTADD67e9a2FKc6wybUQMSm5OowkRsjIwN1JjGVOG5pXahusz4/7z3Jg19jAR3c4s0MHm17I0GSarbNnxkSfzE8sYzqZzRNtgM22w5hDQfaoe7MBh2ot5MJcslQMGEWJgFVgrk1ZZAdUJMAM4xtWXPJSl8p4E2nmsRINO0IyjC3zLYsbhp9HAShzFzFs+XKzl5m9SP3ok/GZL8xnJDWu6FVgtyg2kKxkBb1bVCzQzdBZKnDaCU37n5XycNFRFxwscrKOzQ1/E9fNeaD6AmpNabmVaEdcUFqDCI6X9m+BHL0Kxc1CUXJrPg2L5BSlmuW3UvqMI3Qpoa+i/L8k52fgMTCgR5ZIrsw5pTtyhyEWAJZcT1IBXR8SOulrOp7uaf5wAlZ5Id+o+nHtQice+4YqNCWEC9Nn4VT6kGRoLHrkcWL5HfuSWR0t6gpQ7OdKR+ZdhDGdWdbmdHc1uPtusL6icNve6gWW7FfHWRy+CTe8G+OE2tVCpFnrRV/AuOVrwf54KCt4fJgb
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0049.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(346002)(396003)(39860400002)(366004)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(2906002)(5660300002)(71200400001)(7696005)(478600001)(8936002)(86362001)(8676002)(6506007)(52536014)(316002)(66476007)(66946007)(66446008)(66556008)(110136005)(76116006)(64756008)(26005)(82960400001)(33656002)(83380400001)(55016003)(9686003)(53546011)(122000001)(38100700002)(41300700001)(38070700009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?oKeopxZWBO6uCc/jNDUVadISULr9U/bQrbpJTWcPegHtPVy/tsLwXtyNIM3/?=
 =?us-ascii?Q?MKCLVjbZSub4failR73FQY6aypAiQAJv5AMSMYB6E0gxbTX+OCvTas495q/c?=
 =?us-ascii?Q?EC9OhGVNBcNXeqwIV0+ik5vFViSW6KC6lfL7/6AvkZPQwPVj+5SWJP+7/tME?=
 =?us-ascii?Q?JpuvQYDXouMBwPwha/nvy8L1P8DwgY4fi1MUd793dokE83+UxqHBHv2kn4jm?=
 =?us-ascii?Q?1Kal4DsyBOIFd33k04XbkFgaezGZzCZd1KiUu5GcyuBdLQZIOb11T1OXWKSD?=
 =?us-ascii?Q?q7iqROOvB4zhyDCk6TWQ33x0Lna+Vs5n3IQZHDj3G5CYhpqIPpgcD8mbEsnk?=
 =?us-ascii?Q?ubdzJnJZq+6Q71TJUOGMY12eQ4pxkhVhBIU+efuCBij2nDYlTC/cxyO+GKj7?=
 =?us-ascii?Q?i9sIcrCg8tesfrF0wO615zCRkr8DWq6M/uNMajEHBQJsEysShtT73p6nSL01?=
 =?us-ascii?Q?llmzox7JAedt0xBImlGnErE07ewezR+8AU4axzNaAKy9RYFqEM1EXR8n7GAn?=
 =?us-ascii?Q?XPQDeD3MPSkX1KhJKcwduAUg045eX8MTjyY01N5cL240mg2NjN7KaOjBVlz9?=
 =?us-ascii?Q?QjxKwKCbrwpzhNrapWpa0w+KqdzURPvInBbNHXf//OH7KHWZPyFYFhVMjtin?=
 =?us-ascii?Q?y18rWm5KBED9xQLUN99DzuJ3zheA4HD2faCPWyCxmgfu0B6HQQzhPdTMyXU4?=
 =?us-ascii?Q?cGUXVjZAp1E3PVavLV7vPPu1mR60fg4XLT5U5q3OS1cJPnwytTzwQeVjFw2X?=
 =?us-ascii?Q?IGrN3q7GvWuocjLsRAkr9Spa7TV1QUQoTyYOHn72nPpABUBCEy0FS9K0xAyE?=
 =?us-ascii?Q?CgJNTcAaQMIediWGrqPjwCpFfaX/k5ABn57BsoJzgwTziMpYzUrUU+SKmVsM?=
 =?us-ascii?Q?5jsVLzIlTWL71u2W5zmgcpQGrJ475ieZnW9lFwx8wo5u0xNbSOd8s7tOHE4S?=
 =?us-ascii?Q?Ih2ut34XXaCS0eojgBQ7xU9fRa3XtbKxLUEsCzhDycvLlbKfSVfgGl6Xm7PT?=
 =?us-ascii?Q?3WOsAYVKoIETJ0vxi83WeYB6T7RenHkbGdbJoJppI8NZGB09GMVdvKKsOQ6u?=
 =?us-ascii?Q?hM4K50smCETogOsAfidglcINyOjk2gRqOkEbTQGek4eGbXyGktPUKSw9ssra?=
 =?us-ascii?Q?jQCy5gulM7XVmxsrpIihOvUMsJ943kkPMMhujC3EOX4X+oUdzDGWKmx+xgYX?=
 =?us-ascii?Q?h2rq60cyZkOvEcn2Xhvijk1uX7PIXsqNcXKnlj+e8nFHsXHrCIjK6c2LKO80?=
 =?us-ascii?Q?oO/C4jGomhdoJDpWxYz5n0Alv2T+reaWUrPEIBxhWgEP7X1YCH114lj6ACtn?=
 =?us-ascii?Q?1Y8gPsFLvpTZjZCwP0behlE+0pmawSMEic/FwGWknWCm6KR5QxqrL8fbo0Us?=
 =?us-ascii?Q?NHZRDM5BUzuPzTSkTX5h6R8WMKEAlonNS/YXO+nPTW7qm/z/ytsghKrExPxd?=
 =?us-ascii?Q?457g6pq+mXksZpK5QVEb5jWRn4SlXVQgaMPSKF6G3jU9gNEOVMy3eLhZ1fOb?=
 =?us-ascii?Q?SY0BSz++a6EZ8jJSSpHMw0W0G5yBy/OhIwuy0rccoMx7aN0WiNJNxHSxH1TW?=
 =?us-ascii?Q?NkfV6mZpA6hTf6hnDR77p/8y6sBZt3rFPSE0MLbY?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0049.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 825dada3-c1f2-4fbd-7e7e-08dbf2501313
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2023 09:29:53.4175 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gPy//tdbyXC4Lha8L0VnHYSjjfoOQixHOJSvGR5bfsjfSuXSwgSmGwa8lD42mUUmKc33Yt/s+ucPIjHPHQQT0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8528
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
> From: Shankar, Uma <uma.shankar@intel.com>
> Sent: Friday, December 1, 2023 2:17 PM
> To: Manna, Animesh <animesh.manna@intel.com>; intel-
> xe@lists.freedesktop.org
> Subject: RE: [Intel-xe] [PATCH v2 6/6] drm/xe/dsb: DSB implementation for
> xe
>=20
>=20
>=20
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> > Animesh Manna
> > Sent: Thursday, November 30, 2023 12:44 PM
> > To: intel-xe@lists.freedesktop.org
> > Subject: [Intel-xe] [PATCH v2 6/6] drm/xe/dsb: DSB implementation for
> > xe
> >
> > Add xe specific DSB buffer handling methods.
> >
> > Signed-off-by: Animesh Manna <animesh.manna@intel.com>
> > ---
> >  drivers/gpu/drm/xe/Makefile                |  1 +
> >  drivers/gpu/drm/xe/display/xe_dsb_buffer.c | 70
> > ++++++++++++++++++++++
> >  2 files changed, 71 insertions(+)
> >  create mode 100644 drivers/gpu/drm/xe/display/xe_dsb_buffer.c
> >
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index 666024f316f6..87f3fca0c0ee 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -166,6 +166,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) +=3D \
> >  	display/xe_plane_initial.o \
> >  	display/xe_display_rps.o \
> >  	display/xe_display_misc.o \
> > +	display/xe_dsb_buffer.o \
> >  	display/intel_fbdev_fb.o \
> >  	display/ext/i915_irq.o \
> >  	display/ext/i915_utils.o
> > diff --git a/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
> > b/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
> > new file mode 100644
> > index 000000000000..dc91eb425e0d
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
> > @@ -0,0 +1,70 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright 2023, Intel Corporation.
> > + */
> > +
> > +#include "i915_drv.h"
> > +#include "i915_vma.h"
> > +#include "intel_display_types.h"
> > +#include "intel_dsb_buffer.h"
> > +#include "xe_bo.h"
> > +#include "xe_gt.h"
> > +
> > +u32 intel_dsb_buffer_ggtt_offset(struct intel_dsb_buffer *dsb_buf) {
> > +	return xe_bo_ggtt_addr(dsb_buf->vma->bo);
> > +}
> > +
> > +void intel_dsb_buffer_write(struct intel_dsb_buffer *dsb_buf, u32
> > +idx,
> > +u32 val) {
> > +	iosys_map_wr(&dsb_buf->vma->bo->vmap, idx * 4, u32, val); }
> > +
> > +u32 intel_dsb_buffer_read(struct intel_dsb_buffer *dsb_buf, u32 idx) {
> > +	return iosys_map_rd(&dsb_buf->vma->bo->vmap, idx * 4, u32); }
> > +
> > +void intel_dsb_buffer_memset(struct intel_dsb_buffer *dsb_buf, u32
> > +idx,
> > +u32 val, size_t size) {
> > +	WARN_ON(idx > (dsb_buf->buf_size - size) /
> > +sizeof(*dsb_buf->cmd_buf));
> > +
> > +	iosys_map_memset(&dsb_buf->vma->bo->vmap, idx * 4, val, size); }
> > +
> > +bool intel_dsb_buffer_create(struct intel_crtc *crtc, struct
> > +intel_dsb_buffer *dsb_buf, size_t size) {
> > +	struct drm_i915_private *i915 =3D to_i915(crtc->base.dev);
> > +	struct drm_i915_gem_object *obj;
> > +	struct i915_vma *vma;
> > +
> > +	vma =3D kzalloc(sizeof(*vma), GFP_KERNEL);
>=20
> Check for allocation success.
>=20
> > +
> > +	obj =3D xe_bo_create_pin_map(i915, xe_device_get_root_tile(i915),
> > +				   NULL, PAGE_ALIGN(size),
> > +				   ttm_bo_type_kernel,
> > +
> > XE_BO_CREATE_VRAM_IF_DGFX(xe_device_get_root_tile(i915)) |
> > +				   XE_BO_CREATE_GGTT_BIT);
> > +	if (IS_ERR(obj)) {
> > +		kfree(dsb_buf->vma);
> > +		return false;
> > +	}
> > +
> > +	vma->bo =3D obj;
> > +	dsb_buf->vma =3D vma;
> > +	dsb_buf->buf_size =3D size;
> > +
> > +	return true;
> > +}
> > +
> > +void intel_dsb_buffer_cleanup(struct intel_dsb_buffer *dsb_buf) {
> > +	xe_bo_unpin_map_no_vm(dsb_buf->vma->bo);
> > +	kfree(dsb_buf->vma);
> > +}
> > +
> > +void intel_dsb_buffer_flush_map(struct intel_dsb_buffer *dsb_buf) {
> > +	/* TODO: add xe specific flush_map() for dsb buffer object. */ }
>=20
> Create an internal task to track this cleanup and send out a follow up ch=
ange.
>=20
> With above addressed, Overall looks good to me.
> Reviewed-by: Uma Shankar <uma.shankar@intel.com>

Thanks for review, addressed review comments in v3.
Will create an internal task for TODO.

Regards,
Animesh

>=20
> > --
> > 2.29.0


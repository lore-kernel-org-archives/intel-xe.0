Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E21CDB482
	for <intel-xe@archiver.kernel.org>; Fri, 13 Oct 2023 07:02:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35B5E10E5BF;
	Fri, 13 Oct 2023 07:02:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6008910E5BF
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Oct 2023 07:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697180527; x=1728716527;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0Y/J+V7XYg3Ihf1m701lLJat3ocnP6LQvTJVPpcBiqM=;
 b=Ph76jDPxGFoQyZKWWyzFcRvLtSAp9czEd/u9kZNMDZHBnfvQzaIgwZ1N
 Uqj8qVtp134Spwox3rwEXj4LtyxDVsZLP3AJL1lFHBlzeGKu9+bbXfdhU
 O5Stq1+Uhn2BSn7D+4YrP10SdFyjRRdW9LiK3RGMvMPUBCJ7H3d9Hh/40
 di65Jdhin2HWSMpritj1eUjCgQdc6b1p8508vcx52hngdw0sIKyVZiYuG
 13wI/w4rSx+ddxCFGpwAxwKh+0aTihcHyu+C6OrLSvppLmz/o0tjYFdtj
 +vlNcfXX7eu2lz4RREgK9Rqm8YUKrgwU/mXL7FT3NW5PegJMOqhWgLMBL w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="384955340"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; d="scan'208";a="384955340"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 00:02:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="748247555"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; d="scan'208";a="748247555"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Oct 2023 00:02:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 13 Oct 2023 00:02:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 13 Oct 2023 00:02:02 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 13 Oct 2023 00:02:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ekCRTY8b4g+gaVvhT6/PTz6uSctt77Y/wU+acH5G4IVgyMsB/wF4tmwFGszTVox8ODsOKC/By8Ddvw1genKD9p4RJxQLINZEMQ1U3ubgEgkQaE+g8zCfBvvXnTHQkCouA0TNyBskM1mftNQbe4VHFGxVN24jwAO7O7iCapQQ5YGvUWwZ+Ca2eZSi0eczH+Siqb5CC2EXTuHN6y3SN4EtPF1/jeJ/FTPWlPaWmYC3dbh+PyWScuIEaSloIlucrWBFy1WaNs6XXLWHLM/iD0h8PXAmJSVf1SkCRFMT11z8lu+N0vEfJwZNqnAn2Kb7f4/v9tWFX43meqr6ye8zcccmIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uYXbmJ5tk4B5xsMMCCyVPunt7NQ8W5fuj8W5tMS4Ugo=;
 b=SGFx7GiJcWAzENNSS6E69TqWK+79eRaw2Nx9f95+zKNg2joJAYCFVc5viM3MCQItzvK02FtQIyKGfKyLGjvjopwYQzl71obwrIK9GSeLWlYn0NEGswl2Rgon1tIaYINDx2a0ARkz0sZo9oLjn9Fipj0qtxk17H7p3uqDw3pHNM8cN48ema5RMbRuo+JdeffFnAHdX1cbsFHjjAvWIUioIV/Bv5y02O3KJidhv+VVp5E8KZuhHrWaJl8R0FhO6XBCHXag30uRnkfg+JgLLAtKj4pN9W++xEJcU77G6G7mcPUFdeXvGosmN6902EhLwthC6pQlU9CO/Vm+/abTt2Kj4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by DM4PR11MB6431.namprd11.prod.outlook.com (2603:10b6:8:b8::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.45; Fri, 13 Oct 2023 07:02:00 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::f525:287c:b2c:81c5]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::f525:287c:b2c:81c5%7]) with mapi id 15.20.6863.043; Fri, 13 Oct 2023
 07:02:00 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
Thread-Topic: [Intel-xe] [PATCH 4/6] fixup! drm/xe/display: Implement display
 support
Thread-Index: AQHZ/Qvf7EiovOyECUik7+l5q7lwk7BGYMyAgADrWBA=
Date: Fri, 13 Oct 2023 07:02:00 +0000
Message-ID: <SJ1PR11MB6129B3744BDE5F36124EBFCAB9D2A@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20231012125410.2127337-1-chaitanya.kumar.borah@intel.com>
 <20231012125410.2127337-5-chaitanya.kumar.borah@intel.com>
 <opaijpckzlmscgltti5o552ryzuqjc24t32pqkdvfzdowagsxz@63taggrkrdjv>
In-Reply-To: <opaijpckzlmscgltti5o552ryzuqjc24t32pqkdvfzdowagsxz@63taggrkrdjv>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|DM4PR11MB6431:EE_
x-ms-office365-filtering-correlation-id: e8f0b439-28af-4684-1d87-08dbcbba4c2f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wMItp4I4jqyo4oHgYeKSz/ll/oyAFR2AZ/7B6FqFE4H5VYGjrFTm1fmleOFi1NPH2qqSpOitLGi16dDYVpe1JIvCJr2H7Ie59T/4wkv/PiUQJCF/C5lks2qaqLu8f071V5PwmryF+yGN8acz+sN6qO8/GeQjWh0hU842QOoDTI0tGZrg0Otj5eL9MtD7FC/5Yz1pZlwo3L3pBRGUvzA4WNJqqyo0E7rLSF1ec4Pypfl/wdcHvTqgKecOWRufwjR/umyA9e1DbLEb4eEwLcaLNDHI+l+LKdC+yXHWSZpN2KNfD94IXjwBSOpYx/HzAEaUcNpHGHiiTH9+ZB+DrjYilRj7EdAS1nPQL4JUubxauCuQOCDNlDzFXt00HaPv175Qnb3MrFdff9gboRBebfK+2FRljhEvDc+ywWbEQo2Alzbo4lU3QW35z+L7XPRjhKxdRxgDICEwGK6wfcGIJ13xItVKiDVLxogLCCzU6qhf9kqnYAnHBqsWbud8ytrwo9McdbApFGBmrOteRkyVg5AfZXCdXF75sZiWGReb4tGNCMjk480NWRAxKq4+oefmtoOX+ZD0G5nzRn0AbSzsCQbaxSOGnWDgE4vRR/p10gblltcjwHq378FlVEOMXUGqhgCq
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(396003)(136003)(366004)(39860400002)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(6862004)(4326008)(8936002)(8676002)(52536014)(53546011)(64756008)(66556008)(66946007)(66476007)(66446008)(76116006)(7696005)(6636002)(316002)(6506007)(9686003)(38100700002)(5660300002)(71200400001)(478600001)(26005)(41300700001)(55016003)(83380400001)(82960400001)(38070700005)(122000001)(2906002)(33656002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BFDhUHgZdWfACPboM4Q+NueXXf+vq6eQ/ou5f8ozgnVz9eteDYemYlFxnN8c?=
 =?us-ascii?Q?OG2RBabt3jY5OLvk8+CYRHfNqqGlxXcxBr+7cO5+EVpZhopki48lBq6hvc0u?=
 =?us-ascii?Q?X6Zt8FXa4cXFLgcMFX6iFp2dHplrG3n6gmFv2IRcuPBYzJ7hsFoBw5n4phhX?=
 =?us-ascii?Q?bMzVG5UuhPzG+MTdkU4l3FfRCvvRqDO8tumCLFOVvWOnUDqAXsKlCPRby1I7?=
 =?us-ascii?Q?50u24En6yorbOyvXZf1gbpIYxTkueQTRmK0iW3/z9t/vMSu4FMwdojJIO68c?=
 =?us-ascii?Q?L7szVHXh6mUntf5WZ3hUSuNDxn8EKqBT6ccAbhFF3mq1I0d8THuoMUdChs8+?=
 =?us-ascii?Q?L/9x+JHdYVWnVVvTGgqfBgLKOjQR3MMC8PoC9K2YUGPRnSDnARSYSBq0mJq8?=
 =?us-ascii?Q?/zXQP6kIcRVSEUAueR1fD39484nW10kTjC47BjrvBfmxcdON1bLdS9eQC5YF?=
 =?us-ascii?Q?00/6R2Q74sYK/SJ5ZK7Y45b3SuEWkh0WzPER4THAoHM9LXFDppGIikgzJVZ2?=
 =?us-ascii?Q?9LTFBUkiWNQ4eWRnXaNZIM9D9Uz/b46g967qzP8GS1h6XW+8sKhKPnZl7fPG?=
 =?us-ascii?Q?jv6lm3znuqSsREn/MHBndQ92PfMYuUlc81YCzr5Gj3f6e/yT2JO3Cyph9oVY?=
 =?us-ascii?Q?Tuuo+ezKc6CsEdBYRY+33kUcB7/RIU7AtZmdnckgm1jJlYhNgwxR408nw1hW?=
 =?us-ascii?Q?RbUfnixhtovkpaqzon5v+tLmP23aHbrdVB0itF47mAjKtTm1xjMTrrPUKVsx?=
 =?us-ascii?Q?ghnud9URW/eXFeY94Usa+xoOncgsTFf+j8J7xbtfo7vTqFLabc6Nik9LU85Z?=
 =?us-ascii?Q?h17JgSXs+80QcmttoUAr7/2mxh1d4N3es6rbEMQ1swqXjJLeg/XT8a8/zM8P?=
 =?us-ascii?Q?qWfnZuCC8TizcrK26KghQXYi8sDKEqHeqqPtQ7KlWRecZEYUYCaY9d1BV1cY?=
 =?us-ascii?Q?ZKwExSWn2QxrtbB2SO3/smYDm8io+e3H+R0mGkN+M7ZE+zeL0tVFCZAA/OzE?=
 =?us-ascii?Q?Kbk3MBrmb/5eAy1KxaKDoZ0nCj8gARKBIJs6/58iTmi+YdI33U7tu6QrlqRC?=
 =?us-ascii?Q?KyUizbtGR1+wBtFfBeYd6OMlcsOullUzrczxya6CGGhNAP9vtUldOi+RE20T?=
 =?us-ascii?Q?S77FZPBJ+3qvj/bnBow9KUBpaqWP10ZFquaTuQ4K2IxsO0Y6zWAfKZ61uff5?=
 =?us-ascii?Q?XWXoVTj7EUPqWMEZYngeChpUHvUt5TvceEjgJJBOsbKD+jd1r16vso0Px8OX?=
 =?us-ascii?Q?O7Onq4H4r8pvnu8iwLhTIYdqTBDPVM+ejJ9OCP34XEGTS6cQ0yT+i2Jnx7S7?=
 =?us-ascii?Q?ynd/k8bXas83sYs8+pDwBYt2Pd0wAP2hhLI4A2nSLCb8Idj3tE04BxwD65MZ?=
 =?us-ascii?Q?0S4NpHMou2QtDNTEB90VpvzWxDC8fMAVcFAd9m44JyLHFCTCv088J+oEu/o0?=
 =?us-ascii?Q?nYNzvGAKUI1C5Z0pw3f1v5xfgkt/GHAEW2eUA48AN0a1m4ddcXh/z55eWwvt?=
 =?us-ascii?Q?tFJvm5zVNvUE0zxDVgKi/tTeuDB35SEhjfnU7W3V5mNDhNlj/m6cHjpy8rN4?=
 =?us-ascii?Q?SI6C0ZMg1pJo6++POtYaqT2VVC0eOcnTT34QzxVhk6gk/o7VlG6KbdhHnwLP?=
 =?us-ascii?Q?3w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8f0b439-28af-4684-1d87-08dbcbba4c2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2023 07:02:00.5141 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7Cs+vKHSa1qtlgmEspdQfM+jIgLOg2KWes5TYi4BZ0suvQ15Zg/jYG1bP0z01czUgVg2YAHHSWrRBMk2Kh3FtOuyM6J9Li8wkP0Le7x7IEc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6431
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 4/6] fixup! drm/xe/display: Implement display
 support
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hello Lucas,

> -----Original Message-----
> From: De Marchi, Lucas <lucas.demarchi@intel.com>
> Sent: Thursday, October 12, 2023 10:29 PM
> To: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [Intel-xe] [PATCH 4/6] fixup! drm/xe/display: Implement disp=
lay
> support
>=20
> On Thu, Oct 12, 2023 at 06:24:08PM +0530, Chaitanya Kumar Borah wrote:
> >Add compatibility header with helpers to get display step name. This is
> >needed to maintain compatibility with intel_dmc code.
> >
> >Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> >---
> > .../gpu/drm/xe/compat-i915-headers/i915_drv.h |  1 +
> > .../drm/xe/compat-i915-headers/intel_step.h   | 20
> +++++++++++++++++++
> > 2 files changed, 21 insertions(+)
> > create mode 100644 drivers/gpu/drm/xe/compat-i915-
> headers/intel_step.h
> >
> >diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> >b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> >index 8f55f63ff28b..ed7c39b4f770 100644
> >--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> >+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> >@@ -20,6 +20,7 @@
> > #include "i915_reg_defs.h"
> > #include "i915_utils.h"
> > #include "intel_gt_types.h"
> >+#include "intel_step.h"
> > #include "intel_uncore.h"
> > #include "intel_runtime_pm.h"
> > #include <linux/pm_runtime.h>
> >diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_step.h
> >b/drivers/gpu/drm/xe/compat-i915-headers/intel_step.h
> >new file mode 100644
> >index 000000000000..0006ef812346
> >--- /dev/null
> >+++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_step.h
> >@@ -0,0 +1,20 @@
> >+/* SPDX-License-Identifier: MIT */
> >+/*
> >+ * Copyright (c) 2023 Intel Corporation
> >+ */
> >+
> >+#ifndef __INTEL_STEP_H__
> >+#define __INTEL_STEP_H__
>=20
> in xe we keep it consistent at using 1 underscore:
>=20
> $ git grep "#ifndef _.*H__" drivers/gpu/drm/xe/*.h $
>=20
> in compat-i915-headers there is a mix and match between 1 (used by xe) an=
d
> 2 (used by i915). Maybe we should normalize compat-i915-headers to user
> either i915 or xe style.
>=20
> $ git grep "#ifndef __.*H__" drivers/gpu/drm/xe/compat-i915-headers/*.h
> drivers/gpu/drm/xe/compat-i915-headers/i915_config.h:#ifndef
> __I915_CONFIG_H__ drivers/gpu/drm/xe/compat-i915-
> headers/i915_debugfs.h:#ifndef __I915_DEBUGFS_H__
> drivers/gpu/drm/xe/compat-i915-headers/i915_gem.h:#ifndef
> __I915_GEM_H__ drivers/gpu/drm/xe/compat-i915-
> headers/intel_pcode.h:#ifndef __INTEL_PCODE_H__
> drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h:#ifndef
> __INTEL_UNCORE_H__ $ git grep "#ifndef _[^_].*H_"
> drivers/gpu/drm/xe/compat-i915-headers/*.h
> drivers/gpu/drm/xe/compat-i915-headers/i915_active.h:#ifndef
> _I915_ACTIVE_H_ drivers/gpu/drm/xe/compat-i915-
> headers/i915_active_types.h:#ifndef _I915_ACTIVE_TYPES_H_
> drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h:#ifndef
> _XE_I915_DRV_H_ drivers/gpu/drm/xe/compat-i915-
> headers/i915_gem_stolen.h:#ifndef _I915_GEM_OBJECT_H_
> drivers/gpu/drm/xe/compat-i915-headers/i915_vgpu.h:#ifndef
> _I915_VGPU_H_ drivers/gpu/drm/xe/compat-i915-
> headers/vlv_sideband.h:#ifndef _VLV_SIDEBAND_H_
>=20

Good point! Once a standard is decided on, let's make this change.

Regards

Chaitanya

> Lucas De Marchi
>=20
>=20
> >+
> >+#include "xe_device_types.h"
> >+#include "xe_step.h"
> >+
> >+#define intel_display_step_name xe_display_step_name
> >+
> >+static inline
> >+const char *xe_display_step_name(struct xe_device *xe) {
> >+	return xe_step_name(xe->info.step.display);
> >+}
> >+
> >+#endif /* __INTEL_STEP_H__ */
> >--
> >2.25.1
> >

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C8CCDB47E
	for <intel-xe@archiver.kernel.org>; Fri, 13 Oct 2023 07:03:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E573210E5A9;
	Fri, 13 Oct 2023 07:03:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97F3210E5A9
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Oct 2023 07:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697180631; x=1728716631;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+AHmWty6dZJsLf/fvkf7UTDxNKt9dyK2LtKydU/14bQ=;
 b=lh/O93LuRCkJo1HZTBjup9Qoyw2AXI2Eh9WojIDqe2Ph26RY5viw533+
 QOu7PAbCtAd0ghmrr5gxMGHm2Se1LqSkxu3knpJz/vI9akKYSRhF3fow9
 AQPhE5WcpqHRNu9OrsOOU4SWx8BN+Ye/gFVja0MSQy3iyP++CT0eAP65d
 eQ1NAMLuyvyVEH85zq0mIZ4DhXKTMHZGBPPkHxUzNYpdTcuv8rzK7j8aj
 rcrL17IGD4fDdOWIo6laXBgkSqVLXOz0ehJGA5+aiar/AENWwiiONn3xb
 tOdCu9vKg7blMB3e4WTk9uXWzoCSvqCovgv034szNLBd73ZCCmyjyq/fp Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="451597616"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; d="scan'208";a="451597616"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 00:03:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="789751108"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; d="scan'208";a="789751108"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Oct 2023 00:03:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 13 Oct 2023 00:03:50 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 13 Oct 2023 00:03:50 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 13 Oct 2023 00:03:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L1hnH+dBBvDChzH6ChCawR0mMvDrceCqe3W08qDwh3kkdfETZnhG0kCsdHyTZz6ZEC4ux5GhXcrta25/WKmVL12i0uis2wxWS6ZahyhmpIa2hKCttNgHxDwcUXQ38Xxd8vfDRb7WQME1QkH8GTciv/1U2Mzb2frV8OQ5pDWlrsb83ijJKQaT3qVBggWdEOw7iI3xK86VwzFm57X244s4tqeXLA+oHOcNvjkkquRGQs8c5iLP6wnspiNFyDCeGGoVojSfUJZNDz3OJd0Mezerf7ixFR104Zb2Uhfb6T6D4lFXI5PGnv5d+yvWOvDHmy+14g7P5NewIxukMpuJ41XyjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xg6U63/KQ5/SEHbpjVZHK6gd1S3yTAH/cmT5GqpeNxk=;
 b=kZVWxpzBr9aMrAq4E5yDFyBFe4nfvJmL7A+EL9HZzIva9YV/+aL5Cu4JX7ZRZ2eFWpGjvRid0WUqwfLYKfk6IkTRdGdD4xcWuyEl49A2f8pgdXMZHS72okNW3/s9XIFBicdqarH7A9oI7Lh69CipgQh+vxXxTu+kczm7Yddl8tzckoYLhl54TD1j80Ctwhz8jMQdGYXIWtlYAfop4tgK/QRkQRtWRuxwtVZhtihcMBEWzNLF71dzSfaIgQPjMiZ4eCVMSeNpzi8j+a3NloNznlYimn0GpVoX6/WP52EaNHl9ryxkOPyb0sedRrhWjv/LkzWWESTqhcpUZtgz2EFKSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by DM4PR11MB6431.namprd11.prod.outlook.com (2603:10b6:8:b8::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.45; Fri, 13 Oct 2023 07:03:47 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::f525:287c:b2c:81c5]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::f525:287c:b2c:81c5%7]) with mapi id 15.20.6863.043; Fri, 13 Oct 2023
 07:03:47 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
Thread-Topic: [Intel-xe] [PATCH 6/6] fixup! drm/xe/display: Implement display
 support
Thread-Index: AQHZ/QvnD/6A8n0zJk6e6GNTdGpZL7BGXjeAgADuJzA=
Date: Fri, 13 Oct 2023 07:03:47 +0000
Message-ID: <SJ1PR11MB6129106E1ED7259AB5406700B9D2A@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20231012125410.2127337-1-chaitanya.kumar.borah@intel.com>
 <20231012125410.2127337-7-chaitanya.kumar.borah@intel.com>
 <finhh5yofvmiyiugkjf53gpjtdedg7f2gsnrwwfn6kgvt4cx3g@q3fspuyuj6fj>
In-Reply-To: <finhh5yofvmiyiugkjf53gpjtdedg7f2gsnrwwfn6kgvt4cx3g@q3fspuyuj6fj>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|DM4PR11MB6431:EE_
x-ms-office365-filtering-correlation-id: 6f878113-83e9-4958-93ee-08dbcbba8c1b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: REe82tPqYVir0bYrmsaaWpJDYPqEzbqrWJpipf6BMhqK1ed/YIn7bR7X98KBzki7pYqWyOTtmIZWKtlgwnIBkOnjiMbK2RcT4G+xUKhusNeIyHmD0EsVopgkZzaxwt0790400zz5gz8nCyNgT1OJ/RWGe2ymhHhXSThicGqLpXttlhnMYBowUT80BV7LjRBMQOKyMnVJlOE2ns0ND8pGC0KfxG907Bjcem+TlNo9KoojfNiZaj45ZmK1PfYp1EsQCO8vtz9C4Xw/Ed9cxZbN/GPqy/ySt2T8sS8PsRtcgSvTV/w6KTfF8wXUXQx8PkuDWdfMMv05c8Yh03YbfYV10DFqM2StLgYt4pwKJVCYQEhkMajLZBYgTPHlGVbDHncB0ElBkc4hXm+sJeHmdS3lY6/knmOe3R4fNu3p7xw/0x792WFJxcUTIWW5zuPhZszJJ3B3UQp7UShdCNruY1ClSARpnEPffS59ZCQuHi4JeRTflBwM6PTDrwN1FsGNYaknC3+UY1fi5bGgg5w27eaGem1N2sRE540naYSoNe4ttx9F+TTdFBR/gmKE4BCT+KHynRZdEDoH0dwmxlNzwHZG6fA0gS+8SQsI3Wf55EVZwEI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(396003)(136003)(366004)(39860400002)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(6862004)(4326008)(8936002)(8676002)(52536014)(53546011)(64756008)(66556008)(66946007)(66476007)(66446008)(76116006)(7696005)(6636002)(316002)(6506007)(9686003)(38100700002)(5660300002)(71200400001)(478600001)(26005)(41300700001)(55016003)(83380400001)(82960400001)(38070700005)(122000001)(2906002)(33656002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kti/8/aou3D55oDeNRD+6t0igiJtglWsAKGsuppHsB5YjmL5cdZ0XgZW1WYS?=
 =?us-ascii?Q?MI9kOW6lzByc25VgFCqt0d5X6V6qpANR9dVSu+MpOITcvNNrAoJm+Q2YWVx2?=
 =?us-ascii?Q?r9AwkQjrIEKfkfGxn+DiUdf1HjScFjDIcF/N1cxpWhfOcEHNPR9pxbKp/Mgz?=
 =?us-ascii?Q?LMLLwSU3fLASJINFhhz6PKkA90nj/5fzuf/+bn82oPZl6/tc/ly0l0QN8VyC?=
 =?us-ascii?Q?gyqBJHLfVamXRmwhN6rj5Xil2UKeEvbOT+Uvn4KCdzOdxzM1eXZOYY6nXACN?=
 =?us-ascii?Q?vC7fXI7pjcfwAAOMcMe2+ziQDZ2upeChY20KWGolGNo7gvMbJRXRo4mVyPcF?=
 =?us-ascii?Q?mN94ME8biRMAIT8agcPG5KftOL0OvcjtUOgMh9X4ymSGGzgghQ9CHT49J49F?=
 =?us-ascii?Q?BaM7IKyLezMcbRAuOC8BhYMT2fc2C3oGbBHL5Y67oEz8Z0ZRkDRrBastZ60c?=
 =?us-ascii?Q?FK3xHcgE3E1baOdEYu0whcb0+yBg943jYU1Lf6eY302TqxcHA+HAJn/XWWqb?=
 =?us-ascii?Q?KZp3Q0K3dMaodJ6pxHLlldAqhBVb76+mf9wka/5Z3W6naQfGEs2557V13RqY?=
 =?us-ascii?Q?0uacQzpF+fvZE9b56HHAaSXc0sQbqxGEwhZJKKRJy4ZNWFox2nrSkd+jC7aL?=
 =?us-ascii?Q?9dauhmily3g536TUYPe7aiNWpH8847u5+np5Cct0uXvZ691k7WcrKs+ivxGW?=
 =?us-ascii?Q?pbyvw0g5DaEwmnuZiLlDt9aMJlH2q5UE/EPtgqjToXqLnawmkDS9o+QWp6K7?=
 =?us-ascii?Q?fOhUrgKEgmULWR7scgizXIUHWNNK/kRsmmV6oFkErskRq9hVv1Ysh8B+ccEc?=
 =?us-ascii?Q?4/XPhcpNvnz4B8Tj3TG1IbakPgCwi8rvnVCTNs64AZJoQrunzV7splVxDrKw?=
 =?us-ascii?Q?OTLEqHCGfca8PLoTy2XKKdInwHZvKAOpZuQR2hol+829eM0j8xvKWiqcZ4ka?=
 =?us-ascii?Q?yj5KWEYmO+WRRUGnzN24yufZWxLMd86cU7UGDcAsulSp2l0Uf2JU92rzNGRs?=
 =?us-ascii?Q?or4O+e0cXDRqUioze6ishbM9PWL1BpnZr64UGE8Eye8mNitay10YhhQMOP21?=
 =?us-ascii?Q?RloPUMggr1lKJInyuHvFa/lmNWpOPR+DmPRoPZijsWEeqWlb0XZeDO3BBh5f?=
 =?us-ascii?Q?vjO5a2mAyIo+BmVPvVFJHBqf1y09D3FediiAd+harG+XXNYrQNEp5TYnkfCD?=
 =?us-ascii?Q?xfmyVSPRYAFQ7xYU7tr/vS/FUV7+6Ttf8K28Vzs47fThf5kORzyipJ1i/5tB?=
 =?us-ascii?Q?y9WhZRlt5pOUjnxYwyOnecMSK9YV4o+TH0mWzf3WbouIHOkX4XvLteM0jJ7/?=
 =?us-ascii?Q?IUsQTbB5sgoMGE9cI7So1KsFLBzUpa/0eIXX5BZSy4m9xYrxkVLxd9dnYw7X?=
 =?us-ascii?Q?WKAV7atWdXOpKzYeH2DRrPW7O640w1yfMOCA4/YJ49MisKfz1lxN2SV3THFe?=
 =?us-ascii?Q?8mhCO0nKCJX35N2xOuueJID61uaCNQ4GNgYSBy2SEbN4TONKMP4hY9kZoIWR?=
 =?us-ascii?Q?crdAGWcTalHNQ1u969IHGjOLaKhqagSghTcCMF0nWQtrNR/U35LD66xx/0Xx?=
 =?us-ascii?Q?Rxqw8IqM/uuK3tTnodD2llsvWazi35fk7OdgzhcK9k1Q0zF07NQqXtUq0BGa?=
 =?us-ascii?Q?CA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f878113-83e9-4958-93ee-08dbcbba8c1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2023 07:03:47.7828 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G8ykftb/93QJx9Jna3FhiidWu8HWXJvq5Q4sJbeQZpfGDcHXUA3zxvza/AIX3JvUc7C/YudwJXI1nNLmfwUhUJDEj7YyB6Lh1oTUEJPidYI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6431
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 6/6] fixup! drm/xe/display: Implement display
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
> Sent: Thursday, October 12, 2023 10:20 PM
> To: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [Intel-xe] [PATCH 6/6] fixup! drm/xe/display: Implement disp=
lay
> support
>=20
> On Thu, Oct 12, 2023 at 06:24:10PM +0530, Chaitanya Kumar Borah wrote:
> >Add definition for INTEL_UC_FIRMWARE_URL to maintain compatibility with
> >intel_dmc code.
> >
> >Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> >---
> > drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h    |  1 +
> > drivers/gpu/drm/xe/compat-i915-headers/intel_uc_fw.h | 11
> +++++++++++
> > 2 files changed, 12 insertions(+)
> > create mode 100644
> >drivers/gpu/drm/xe/compat-i915-headers/intel_uc_fw.h
> >
> >diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> >b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> >index 9cbe16863be2..4e922446e40e 100644
> >--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> >+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> >@@ -22,6 +22,7 @@
> > #include "i915_utils.h"
> > #include "intel_gt_types.h"
> > #include "intel_step.h"
> >+#include "intel_uc_fw.h"
> > #include "intel_uncore.h"
> > #include "intel_runtime_pm.h"
> > #include <linux/pm_runtime.h>
> >diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_uc_fw.h
> >b/drivers/gpu/drm/xe/compat-i915-headers/intel_uc_fw.h
> >new file mode 100644
> >index 000000000000..7d37bc453165
> >--- /dev/null
> >+++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_uc_fw.h
> >@@ -0,0 +1,11 @@
> >+/* SPDX-License-Identifier: MIT */
> >+/*
> >+ * Copyright (c) 2023 Intel Corporation
> >+ */
> >+
> >+#ifndef _INTEL_UC_FW_H_
> >+#define _INTEL_UC_FW_H_
> >+
> >+#define INTEL_UC_FIRMWARE_URL
> "https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-
> firmware.git/tree/i915"
>=20
> that may not be the right URL for xe. For any platform officially support=
ed by
> xe driver, the expectation is that the firmware will be in the xe/ direct=
ory. I'd
> rather just point to the repo like we are currently doing:
>=20
> drivers/gpu/drm/xe/xe_uc_fw.h:#define XE_UC_FIRMWARE_URL
> "https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-
> firmware.git"
>=20

Perils of copy paste! You are correct. I have made the change in latest pat=
ch.

Thank you for pointing out.

Regards

Chaitanya

>=20
> Lucas De Marchi
>=20
> >+
> >+#endif
> >--
> >2.25.1
> >

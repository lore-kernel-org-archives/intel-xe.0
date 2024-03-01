Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3242C5478C
	for <intel-xe@archiver.kernel.org>; Fri,  1 Mar 2024 16:09:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BCA610E830;
	Fri,  1 Mar 2024 16:09:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L3eCBkjG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5312E10E622
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Mar 2024 16:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709309362; x=1740845362;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=uSqKYlTS7psbTUwLXQd/4BLIbA5+dvcXSYI1TZgr2I0=;
 b=L3eCBkjGZw56FfZskUYgjh8JpPPX8vcrZMmQBospEmWiPiq5bxpvEfH+
 dnzhVq9CovMURt75rkiidq4sM6MWNz2ybMh4Y7mZRJ7OMSGAu9jVhNlZ5
 cINbIiuwNXdL6+6TfbdwLyVFNk4Ql9nwJntQYTf9VtkKdtHUV/qwUBGrE
 Rpf4kmyx5dcmYilPU95duDYgBHdX8hF12U17qv0z0aLxto5Ypj1goEzh8
 QZnzCWKimJhKDT82qRUYFxpg0KY+l8G6ZrkQjhlIiX0O3Lk5mrKR0SeB6
 Gqffh9hStKlgttfDqcZPi4OYM6I9IS++ERRUOfmyw9IAEi51DgYtT2sFF A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="3709660"
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; 
   d="scan'208";a="3709660"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 08:09:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; 
   d="scan'208";a="8660839"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Mar 2024 08:09:07 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 1 Mar 2024 08:09:07 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 1 Mar 2024 08:09:07 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 1 Mar 2024 08:09:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lfiTkDRh0cFIdoZD/fdn5JNbqTD+PMST5WiIezn3mp/DSwkmVGp/HxJ8vq4AoBATuZryMtoodSrYBZy5TyhayEWlE0TduwBz4pQfJlu+YtWi2DUX/CvMnadTtpf5eko4Jfeo/YbtiJgDUV1EshbDohqS5gfMhoRuRAPJme8GhJAujRb/L3Gy3brB1kic9rtDXDYdXc9OML4G9NXvSGPwVRepgDaz23LjmbPngoebrIFemEPoABMAQ/h3H9jMGDPEt2bd8qrjp6tgpFmuHpEXP12iZ+Sf+GOvPleyrM05hegq/Z6gZqU4Oy3xPhadt+qZpC1Bv3bIHkLPAAjy8DKuqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PEWQ7yAHrj0jjpahtpEgbJ1VF/SegTZMMMwQREr/cw0=;
 b=CVTruq1CRaacLJm7/HnFXY2n65lU4i1Sj9+CVsI0JJ2T4YkCJ9yZmS1JK9vfvBMdvJIdATaIe1uY8dgwRinpko3Sk98pGiXDHfl8rwWUPOz26QzBh9uwRYkQj/ZvsB7o0ZaRuUv+wlid1Ix0C7fX2CzOjgOwdCM04gNXqEck41CQnzQKm2JJ6+J1Dyt8T5zM/ZuHsEnpXlCgszy8m16rQGGDVrwI1P/ROBvkb6VwcPN3VKBsYdjpBC/ND29kSDLGeFov5OFCY+VtbOjURpsAVw3NcuvxJpU0HGyhg6YGt2VC81WKHkR0Np9r/ong1MY9VaMn6bEdYhf64+StgSk2ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by LV8PR11MB8582.namprd11.prod.outlook.com (2603:10b6:408:1f7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.25; Fri, 1 Mar
 2024 16:09:04 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::35eb:1d4b:b90f:e584]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::35eb:1d4b:b90f:e584%3]) with mapi id 15.20.7362.010; Fri, 1 Mar 2024
 16:09:04 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 2/3] drm/xe: Create a xe_pm_runtime_resume_and_get variant
 for display
Thread-Topic: [PATCH 2/3] drm/xe: Create a xe_pm_runtime_resume_and_get
 variant for display
Thread-Index: AQHaaawHmofg3gLTI0yTgBiMmNCY3rEjEg9w
Date: Fri, 1 Mar 2024 16:09:04 +0000
Message-ID: <CY5PR11MB621112DA439B7D904BC7E8AA955E2@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20240227183725.505699-1-rodrigo.vivi@intel.com>
 <20240227183725.505699-2-rodrigo.vivi@intel.com>
In-Reply-To: <20240227183725.505699-2-rodrigo.vivi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|LV8PR11MB8582:EE_
x-ms-office365-filtering-correlation-id: 0f40c52d-e1e0-4d9f-371d-08dc3a09eaac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nzyXnXP3INTMfdf3zu6APWBkZywlOfIYiewzEmGC+bll2hpv9zm0zfkEiMdKQD9tbblK5J7MaJPv4y0iYuJhx1AUUHUpSRntIVpwZbUlRmmlrJUijVIndpObkuls6CaCfEx164sBDdozAgqe+1E7AxtaEj7j5tcI8TJ3lfaxcisFEtipnseevBGoqJ7Af5ZW/E/7sSQqCrF0QOinzhomep4ACJXoGdUaxqnkEROGp01+zzRcSrnU/qAwRhGKarzCgdPOiwUMlRRlaJys/Q67BqyOZiODrV6hwKmjTa9evrSsY+Uwyb+/gTDDICpStT9FkK+0OmRSeEHG0ekSVqAQcbBwan60WMmiHeWMOLAD00ovt4v0/tH5gZtAmlSJFvYxhFCD88VDYyFvgCrIbYWgImoVmTK0oTYOxJ0hcNBWEizkbtfDCk4mOCw3XDdUzzUOtFPCCjYZzwaK+OJxpOCI2oraeq6d4m6vsG0rrLyBauoP22HyFVL58UN9NEkl7QWb6ecFb67yv5yyLXYcs4P7pzjfsYGMrRLr8LDMjDELa45rgxOkvG6WjqYvCnbYlK+O9S67BuJ75Lo93PA8+85z7NMnpZQY9d+ux4Bm6bSbROoEl1GIwpSkLj4PM5lLRDRlh6er9VL3Qf2akHx+Nhkqzbu7c3Hyku/mcwHv04CwP38rmK64pe9n1vYPb6UcCRwBF6/ettYbS/pt6ka56H55djjz1rxmV9oqUoWMIZGEKkE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DVamPe25oz1+75/G564BVpokd64+t70uymRqkOR+27UC6MSP4iEvg1olEfr3?=
 =?us-ascii?Q?1nxO2MnuMijiOocBWR0eWBMAiwZjBMbyLPZtDWylz78y77smtJmcASAi/uSu?=
 =?us-ascii?Q?YFgD3MnFM54n6eHjmJiBkhsAMqYyA8TXQ8AeUpjAviUVs7umeD7Ut+SdCxEP?=
 =?us-ascii?Q?OZgxyYXHDJEt18ueL7jidoB8KUQNUnCw3Rr/xlhSkr4rxCPeKYKRxAsRwpOi?=
 =?us-ascii?Q?iIoamZd48ikXtmIdFqHEskABN+zQbULMQFD+EeDcsAnHkIVJVZqENZLGXLDo?=
 =?us-ascii?Q?Yrkl5JEN5pZ+aTq0CsTQYd64Rth8w4u/wUrDILO8xP0o+W3UMJ9iJyuVAbDR?=
 =?us-ascii?Q?wIMb5K8XqxN68k1UPbHVetFlQZlEUvV69HOjz0HX9ACG4u2b3rsBjz87IYC9?=
 =?us-ascii?Q?ilwLXSU//fO1Sr+6fq/HfpG/fNClaMMieG564gNFX7akq7yfNQHtuuGZqDO+?=
 =?us-ascii?Q?0LVxyXHFc63o60Zdphur69c08+OQ1bHKdW6tfmlSTemer0HjHV4msc9cSQWL?=
 =?us-ascii?Q?BaAl9vt6wdoeNT7TWsISsorFaragRv+OoGmb2xRW6svOylYC6cUTDYQ6hyjj?=
 =?us-ascii?Q?4htePeHIdz+ikP9IL9giK3PFVVVqNZeW8sHDMgIiDLQGr2N84COtg2qysRP6?=
 =?us-ascii?Q?XagWxNV/ornxipyk3aXJF855fXDUhYwrh2NdPqSL8x943V11LO9oW9/1CHRF?=
 =?us-ascii?Q?G4H9tjxl47o/8RRZOvx6CQToqzDND5lSuus6l321DfxJjq0lQqbQofFRAvJ0?=
 =?us-ascii?Q?CrFzeqhpT7uj+9cCnRYHlkrQX7DRSFaP4EMfIoKZeA6SjWVqYdLP88iw5VQX?=
 =?us-ascii?Q?fMiBg8CkPUC3EzWMkykJb8AQCFItyeoxMu11cMtbTrFwU5N8krE6QwoJEm3R?=
 =?us-ascii?Q?6ell0P+5kAECGF/nAStEyLNAJJU4soyUhWOPRTCEqYTAyCaGoDlDu2H6t0zm?=
 =?us-ascii?Q?lN+K7ClP7fOHbUN6K/zCdOwD8Ta/pzZC3L3XHRTezjfrbEtoINt1WdrVJLF6?=
 =?us-ascii?Q?RSK+oehgMiftfz09EPusAaJrBKlEJxtQnGbZR2VBspvV75jDnK93EbT25wXi?=
 =?us-ascii?Q?VFoJUYuDgUcvhGpXx6xtFUXlxaaNgl7gesx9sK/dKxxFGOW43YcWPSXMIQ5l?=
 =?us-ascii?Q?IcreZ7C4ZEmJF+6AtbLTXx/ndgkfR8kaBG0rBm4gSS8YgQnK+SsShLK9OFoX?=
 =?us-ascii?Q?zuMqjkogHNHEIDBC9aOHvE+fDmSJZGxjVs6GRPiAJdQTqUSRviU1S8mDgbP9?=
 =?us-ascii?Q?+cTAA8E7KDNrwmefTcBmHwu6SDh4likbwDh3yOlGb0NHcY/sdNduGBxpFdFx?=
 =?us-ascii?Q?r17p/5+Mxb7SvVila0yAQrpqEaBY8Zus9RXEnwlMY0IXXQCTLucbhU+MQuTI?=
 =?us-ascii?Q?8x0ND5FJOrdaavVwGPBL+B72eFinfZ5Rz1xIqPiCVLorMU+lihWNdrpyZ8wU?=
 =?us-ascii?Q?5wBozXhnSOCCs2CxcrVcg/op92CAnKtAgRcPKBYe8LH3A9nLtxfy3W+IkDI9?=
 =?us-ascii?Q?1EwMnDPxzR+S1MiZHhXbEg1w79LNT29QgX27oCRblJJj/CqDwvb2e+olsBFE?=
 =?us-ascii?Q?N2SMsFzAaogCtksR8w4yLfequQ5Ob+Y7cOzCvVNb?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f40c52d-e1e0-4d9f-371d-08dc3a09eaac
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2024 16:09:04.5558 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KOb3HF/8fcOqpqYAXmynOzEKLq3sqjLStf9kqYKpZsUMIvfkTOtvoR7ZrNlJXu3Bl/Gpn7uEs39fAW8FiozdbIDO42A7N8/K/PmZvALMRD4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8582
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
> Sent: Wednesday, February 28, 2024 12:07 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>
> Subject: [PATCH 2/3] drm/xe: Create a xe_pm_runtime_resume_and_get
> variant for display
>=20
> Introduce the resume and get to fulfill the display need for checking if =
the
> device was actually resumed (or it is awake) and the reference was taken.
>=20
> Then we can convert the remaining cases to a void function and have indiv=
idual
> functions for individual cases.
>=20
> Also, already start this new function protected from the runtime recursio=
n, since
> runtime_pm will need to call for display functions for a proper D3Cold fl=
ow.
>=20
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  .../gpu/drm/xe/compat-i915-headers/i915_drv.h   |  6 +-----
>  drivers/gpu/drm/xe/xe_pm.c                      | 17 +++++++++++++++++
>  drivers/gpu/drm/xe/xe_pm.h                      |  1 +
>  3 files changed, 19 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> index ad5864d1dd74..fef969112b1d 100644
> --- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> @@ -166,11 +166,7 @@ static inline intel_wakeref_t
> intel_runtime_pm_get(struct xe_runtime_pm *pm)  {
>  	struct xe_device *xe =3D container_of(pm, struct xe_device,
> runtime_pm);
>=20
> -	if (xe_pm_runtime_get(xe) < 0) {
> -		xe_pm_runtime_put(xe);
> -		return 0;
> -	}
> -	return 1;
> +	return xe_pm_runtime_resume_and_get(xe);
>  }
>=20
>  static inline intel_wakeref_t intel_runtime_pm_get_if_in_use(struct
> xe_runtime_pm *pm) diff --git a/drivers/gpu/drm/xe/xe_pm.c
> b/drivers/gpu/drm/xe/xe_pm.c index 7d7df78f3a2f..3e13a666fcc7 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -474,6 +474,23 @@ bool xe_pm_runtime_get_if_in_use(struct xe_device
> *xe)
>  	return pm_runtime_get_if_in_use(xe->drm.dev) > 0;  }
>=20
> +/**
> + * xe_pm_runtime_resume_and_get - Resume, then get a runtime_pm ref if
> awake.
> + * @xe: xe device instance
> + *
> + * Returns: True if device is awake and the reference was taken, false
> otherwise.
> + */
> +bool xe_pm_runtime_resume_and_get(struct xe_device *xe) {
> +	if (xe_pm_read_callback_task(xe) =3D=3D current) {
> +		/* The device is awake, grab the ref and move on */
> +		pm_runtime_get_noresume(xe->drm.dev);
> +		return true;
> +	}
> +
> +	return pm_runtime_resume_and_get(xe->drm.dev) >=3D 0; }
> +
>  /**
>   * xe_pm_assert_unbounded_bridge - Disable PM on unbounded pcie parent
> bridge
>   * @xe: xe device instance
> diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h inde=
x
> bb4723a98405..29c20099a3f9 100644
> --- a/drivers/gpu/drm/xe/xe_pm.h
> +++ b/drivers/gpu/drm/xe/xe_pm.h
> @@ -31,6 +31,7 @@ int xe_pm_runtime_get_ioctl(struct xe_device *xe);  int
> xe_pm_runtime_put(struct xe_device *xe);  int
> xe_pm_runtime_get_if_active(struct xe_device *xe);  bool
> xe_pm_runtime_get_if_in_use(struct xe_device *xe);
> +bool xe_pm_runtime_resume_and_get(struct xe_device *xe);
>  void xe_pm_assert_unbounded_bridge(struct xe_device *xe);  int
> xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold);  void
> xe_pm_d3cold_allowed_toggle(struct xe_device *xe);
> --
> 2.43.2


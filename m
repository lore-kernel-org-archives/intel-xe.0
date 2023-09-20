Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C08F3CE79AD
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 07:25:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8394B10E161;
	Wed, 20 Sep 2023 07:25:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A24110E161
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 07:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695194702; x=1726730702;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=+JKF2Lm0lRvlh6AZkj5mYrPxQ7iSpZEWz8t8g1dya5A=;
 b=IT700mt0umXo7CZJoFaA+RVzabvcVot4f9FizD6blELF29EZbeQu4Xxk
 g61rLZWmbOro4xE6i2vaFxo9bHZwuiLXzc71dil9Ol1uQXXjZw03OCBo7
 YtoVWn/Rr2NjuMGf5NtslcBPQ5QdVH8cUgJTttS4zcLcdqI1umtyeeAB5
 21om//T6CwXeYkgsxMJV5+S8PAUPin9y1Z5fY8lBagyi7VPnnDluktl6Z
 Z8nwLPP5p6sV79KClsunLhg5G7HeengfGgBu9dAeUM/LJyzhhejNgod4v
 BUSCstxRMEYPorn7tR9YH741bN3EAm85B/2Yg0bTP/4dUPvBLj/04duEa w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="380049849"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; d="scan'208";a="380049849"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 00:24:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="920172225"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; d="scan'208";a="920172225"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2023 00:24:57 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 00:24:56 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 20 Sep 2023 00:24:56 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 20 Sep 2023 00:24:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RW6dalFhEZg0taD0VtHoN7XG4K/LXsQ8FlUOG15Hka8NwlrVa+adVQTy0CmHSONv9Tg+rsa/dL7TY0fX7RU/j6x7cBqcne7iytASiYS8m/yPkotMKRe+Wj5/q3IexNjG59n8Y9YeZDYZUHgGvhiLoSZ7Nxb4J4w3b7BQt4XCGHCDPin2up2Lm7EYZHcb90nGw1FR09xSvqCHsRj7oyUf6xtGjAHktK7zJAw4ND2ULE7KrlpKmLQz6JyrE+IwF66w/ms0g2K9WjNvEKzt2R+ltUbiyKkgmMOssfkvtENXCzVD/XUhIC1SKHl5HY4BOtnef+YRQZeY+UXkM3BHfJOA3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=906dl5XNpSgvKWGW5M8OR951gBAuVYmShhWhMvR2NZc=;
 b=cEljM+nwmZfcfCiGmeZaPYNtF03lQ2G2rvbNM3I/tACFVDb8vU2NmMYiNy97ElldrXkrqkL5Ew6wNOq8cpuIrcZIS5CSbpPyVh+qd/Y4kLw39QA5nxQj4CaM4L1M22oyJ8J2eLZUnYB/xXNUSHsVubl4boI/aQdgknJQZZEn8sJ3QNkBaAMUxGktvQtLowUYzh7TTIVT9MoyFUDACkTKijj7vK1GQ94ZqbX3Mx4irU+UKkkVQlNlyAy4aMr6f7ZfsvqEpZQ9LW4nZ0HiTEU8vmy5rWPx/0vMoc9DD1/hYQoik7W9QZdXPetZeAPng4gjuSaYhXRqo9uSvCd5Zg0Tng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by MN0PR11MB6255.namprd11.prod.outlook.com (2603:10b6:208:3c4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Wed, 20 Sep
 2023 07:24:54 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::f525:287c:b2c:81c5]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::f525:287c:b2c:81c5%7]) with mapi id 15.20.6792.026; Wed, 20 Sep 2023
 07:24:54 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [RFC 2/3] drm/xe: Add wrapper over intel_step_name
Thread-Index: AQHZ6ijTQFOxwx7grkeGnCPhDbuyMLAiMBqAgAEibFA=
Date: Wed, 20 Sep 2023 07:24:54 +0000
Message-ID: <SJ1PR11MB6129F3D8963B7FA459EA624BB9F9A@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20230918120229.338270-1-chaitanya.kumar.borah@intel.com>
 <20230918120229.338270-3-chaitanya.kumar.borah@intel.com>
 <87y1h2s1hs.fsf@intel.com>
In-Reply-To: <87y1h2s1hs.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|MN0PR11MB6255:EE_
x-ms-office365-filtering-correlation-id: 9930b539-7f42-4c49-6cc8-08dbb9aaaf79
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RBXyrXfxg186ZcjSJ7XsUixLLjWfWJIIKz4vlP/8qzPdfJDZJttBlM5sfy80FDXVOD6YTwp/3nq5OgEzXXBq68bs8qy0ak868NSIGoyZghF6wgFeX6wxxlsi1XFhOzG+eB26OpUqa+uUCmAqikFGiXLX8YFwawPdmauf60674+1VN0OvTe31+ogOrcvd4jGFscTKNJL3H6uY39FlIVP3Aj1UeAqCMMJsyA2oCAZ4/6uxMauNWef0knQvZi5in1UlnKXR0pPI49BvQ7KnNk72YZ8Y2qe0b9XTMrqAPRgtBL4xl2+RQZwrgk4Ku0TsDP/iUQatAjbJccUJhKqeE+NjL1FOOz//E4P+DXykeXFnVC5n0i7N//6ef1IUW1FjP3fOq1dee583xqmKE0m/u1dXl4hNZNARnyArNX2WWIuOFcT13cCNCqc8m7HZDZC/xfO3mQc04WBltKa1nz+paLUFTGZPjJad7c4c72ODItzQUTNt9CaG4lENu3l5HJG6HAc2/J/orh9JXJoMzll+3qOyoFDIfGHoUx2XZbjWj/qIuNxODDrdqeJEhQDKrtlgquXJPJMzkHplFJLJAZg9MgBFUMgTxyry/wGinpjVle3JeX4hSwNykA99rhnsGnrxR30X
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(39860400002)(366004)(136003)(396003)(451199024)(1800799009)(186009)(53546011)(55016003)(6506007)(7696005)(86362001)(41300700001)(9686003)(110136005)(66446008)(66946007)(38100700002)(66556008)(66476007)(38070700005)(64756008)(76116006)(316002)(5660300002)(71200400001)(478600001)(82960400001)(8936002)(52536014)(26005)(33656002)(2906002)(122000001)(8676002)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3A3weCYyw8yQT+Dqoc8LCHTssN4wddWEtCBSPrLzGGNr95Q+ad6/e8naoKk8?=
 =?us-ascii?Q?SM2W+VEJG8h2ED6FiwQ1wLbqnPO2V4ldW19laH6cc/ebGj73FjGpH3PJ5vSK?=
 =?us-ascii?Q?2aVvjmCTIhAk7M6JdIDfxvTDYZ/EXZuxTLJ14MF57VdA9ewJSVD7+fwyYyue?=
 =?us-ascii?Q?6P8WpZEYsK2evn3QKaGVuBLL+0JJ8+w2bgPPXWERNECqHmvKB6XLTpPk/Kt6?=
 =?us-ascii?Q?JTsXJ5dobyDfDvH1TDETQRzC2Tj6ETjyOOiLxuzGGzEilGglXjUbIeBgnVqM?=
 =?us-ascii?Q?VRaqgGlQ33VGTDLFZ+OYzCZTOwl+EBpRYTYfg2pX1ATfkE/LqxFnXoXOEgx2?=
 =?us-ascii?Q?hEcBRXwh1B0uKDfUn5JGdwlL12lCGl5a7DY/uQkakTiB4IWRhIGD01IMTG9F?=
 =?us-ascii?Q?YbetadXRINRYTk2BK6uK8z2fyG/HEt78neC80Vhpol+CEvP0D452FMzWlK6j?=
 =?us-ascii?Q?MIqEidynJ4CEfUGE+HKKvl5buBgntm/fQx2eEsOGjYXMRq+4W5BUuLG6A1vQ?=
 =?us-ascii?Q?ttx7wHYQdac5SDAggJFlTzRiomsTjI5gQM9hnJC++TO0ohvY1HK+NG2+zGsa?=
 =?us-ascii?Q?L7f3Oq9nRlOyTAJ+35uuwBzMTYD0xtaB6wPNfIGo4Vi9igaQMxqkh+QPpqHL?=
 =?us-ascii?Q?b7DO+zrKHsV8/p7en4em6B0458sKznC8hdye2vAXsf+A6o5I2EjNcUenD9ZU?=
 =?us-ascii?Q?djJX5HH4/cfDEgRQnrRIlS4Ro/g9O3cQ02Gwhbg91eY6K9NtlJxRY//b+rq5?=
 =?us-ascii?Q?5IGPTQuz7CkE5DO2FSwyp/QCKiXj4xlx7nUuvMNfJR5qZ1vClYn0lXEjkUXy?=
 =?us-ascii?Q?XpbtqJqb8IL5CAw29ZffTPtCfJQurK7WSnx5TJJHESp8NHgEbwGO9WfLqaRW?=
 =?us-ascii?Q?WP720nUBoNw61hkJD6m5hp8nomwCSNJxk4HiN/yvms7tXic90Z0GoxPL3Ji+?=
 =?us-ascii?Q?DzztOPPV777fKY4tBXSx6rev/HyJKiZJoD3WLGF64Rb3E65oXdt1utUlJBrz?=
 =?us-ascii?Q?uxOY1hfo4/6l/iQvaVdtxBRdi8ykj2ysUuKoZN+6q1H8MGPaDPk9Q2/SjKg6?=
 =?us-ascii?Q?xo3jLibz1Qu0ObhlP5dcjWbABoDdPSNE5nV2IWu5Ah2Xw+JJYmogNnkWfOFK?=
 =?us-ascii?Q?rFFX7/Ooj5YK3vW+q/6Qn9Rl32NYGhaR6RDqe9uTfAUdkzz0EtqKUqsQi/I3?=
 =?us-ascii?Q?WCw6dT/8fE8/hoVL+VEAwXlNQFCrTxUPrfky+iULCkjlJwcG6FYP2IO5RG0N?=
 =?us-ascii?Q?a+PcZ/jnaMJ56lrYH5G1CMy1jwfI7z7XShr9/eIpii/b2ibFgs0gWsJItLCe?=
 =?us-ascii?Q?Ei9a+K10k9QVeQWix9kXISuVXxyYSaEDirDFJ0ijDTjtO2KDx822mWR1C+Ie?=
 =?us-ascii?Q?4b0DviXtfCHCrKgrPWAC9m3hzgx5kZVBWd/Keuh+qphVeiZLRC4A7mdokuZl?=
 =?us-ascii?Q?4cXlB12l1wNJo4/YQ4zJ7WH1xQSpyEbWjSqhtgy6+bWC50xRjL8GJswN6oYw?=
 =?us-ascii?Q?qEOZAsI6003bLLuO5i+dPCluNuof5fYjAfAq/JJpW0JaaChr+I8+xVe+rmlz?=
 =?us-ascii?Q?t1BjrZQyc0ge3SEC/ihA5OzUWuHXC9lhurPnuCEWAIGK7vcTagV9Fmd635dz?=
 =?us-ascii?Q?Og=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9930b539-7f42-4c49-6cc8-08dbb9aaaf79
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2023 07:24:54.2284 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jEBzu7AVl0n4x2FsEpm0rDg7Qfcc+j5EtzxfCGe0PTHMxmFkfQkTMewbTfwZns69GuGieVaYd7kD11BI0Kk1FnOmaz9CxLC84otMNTsRCTo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6255
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC 2/3] drm/xe: Add wrapper over intel_step_name
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

Hello Jani,

> -----Original Message-----
> From: Jani Nikula <jani.nikula@linux.intel.com>
> Sent: Tuesday, September 19, 2023 7:35 PM
> To: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>; intel-
> xe@lists.freedesktop.org
> Subject: Re: [Intel-xe] [RFC 2/3] drm/xe: Add wrapper over intel_step_nam=
e
>=20
> On Mon, 18 Sep 2023, Chaitanya Kumar Borah
> <chaitanya.kumar.borah@intel.com> wrote:
> > To maintain compatibility between xe and i915, let's create a wrapper
> > with same name over driver specific calls made to retrieve the step
> > name.
> >
> > Signed-off-by: Chaitanya Kumar Borah
> <chaitanya.kumar.borah@intel.com>
> > Signed-off-by: Animesh Manna <animesh.manna@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_step.c | 5 +++++  drivers/gpu/drm/xe/xe_step.h
> > | 1 +
>=20
> These files must not have references to struct drm_i915_private.
>=20
> Try building with CONFIG_DRM_XE_DISPLAY=3Dn.
>=20

I did have a bad feeling about this one. Replaced it with xe_device in the =
latest revision.
Let me know your thoughts.

Regards

Chaitanya

> BR,
> Jani.
>=20
> >  2 files changed, 6 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_step.c
> > b/drivers/gpu/drm/xe/xe_step.c index 371cac951e0f..9a79451ccf52
> 100644
> > --- a/drivers/gpu/drm/xe/xe_step.c
> > +++ b/drivers/gpu/drm/xe/xe_step.c
> > @@ -254,3 +254,8 @@ const char *xe_step_name(enum xe_step step)
> >  		return "**";
> >  	}
> >  }
> > +
> > +const char *intel_get_step_name(struct drm_i915_private *i915) {
> > +	return xe_step_name(i915->info.step.display);
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_step.h
> > b/drivers/gpu/drm/xe/xe_step.h index a384b640f2af..3e78d46566a0
> 100644
> > --- a/drivers/gpu/drm/xe/xe_step.h
> > +++ b/drivers/gpu/drm/xe/xe_step.h
> > @@ -17,5 +17,6 @@ struct xe_step_info xe_step_gmdid_get(struct
> xe_device *xe,
> >  				      u32 graphics_gmdid_revid,
> >  				      u32 media_gmdid_revid);
> >  const char *xe_step_name(enum xe_step step);
> > +const char *intel_get_step_name(struct drm_i915_private *i915);
> >
> >  #endif
>=20
> --
> Jani Nikula, Intel

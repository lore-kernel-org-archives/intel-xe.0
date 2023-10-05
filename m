Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F5AE936F9
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 04:34:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBE0610E188;
	Thu,  5 Oct 2023 04:34:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B137910E188
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Oct 2023 04:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696480489; x=1728016489;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EKIzPnzmlJf91TJlxm6V0pQQlTI8lqxGgpQEvArC0hI=;
 b=N0GVaObImODcOLOQGFIu78rCw1//w9a8Zz6+O/njxSu3Un7hjQl46raV
 RlV+09v3Xp/ySxQd2QVSu8Wsg5vyoNnkktSBG6zxYmMr8oR4/8Py5P5J1
 0O3TIM+F1PrRgKPpjbe7KU6TDAa1lOcMlvQJS8tfLv8pEw9sgkLLQaj17
 cMUj/3Am2+rzjG8BEt6QIbJr1RcPpL7XFQ+Cbpxy0ek9A10EtDwgxixTf
 J4O1z6KpNa9yQkNFe0C6EmVSm5Ri1E9N41JdXt9v5Ief/1G2lSmhEG/D1
 BxW+p5mR0eESa8ESFjQzyj238jw8HAmUgvNubcq2L0Qd6Roa0lEYk26e4 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="373748744"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="373748744"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 21:34:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="925445032"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="925445032"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 21:34:49 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 21:34:48 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 21:34:48 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 21:34:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eB6LRqHtFF6i+LfURZqA6tS+7JkWuPhzwqv8JRyzeDsEAcwYb9jpOPycTFdx2GwHLkdHjr/uGmQvTrHd3F9TNAvK0wL2TqUVD5qTAoNRRHkjayLe9CJ8r2FPMC8+lD9y2D85hwJbGpOHA0eReC3DRYABOlchyEQNqGpW9Tk9BJdcENfm+Sowgrq1ayZaruKn0k8mU7k7rlHDV6pOBtjhCnKG54SqnjIP4sgeuYzbo/T1ohLEnebGwzBTFAGQzoMgvjUbfj1z9S2gDgAQ5sNanRRzjrG62u5KXnKyTrgwyx2hb6EpxWUqfAtDX7oZNxC892ECmtYbtfT7ZrlwWJbozw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+JeL5+V8AZgjczbnJs2zCc1obqfRQl0m9wpVFo6rLu4=;
 b=i5KVPr2DZ49xrYUSpkQwBcV8CR2/dVMNZfh7tSDDq3FM2JSUgdLz/DEUr97ZsUU4tIWHdn/AP6Ef5w5KbLfTuaYWK1Tm0eeFtbJxHs4G7cBI8pc0iwcavnEhFFxBQ3Sl5udJntcaIlMNhAJNU/iLhYRVFkSYHYtUzsUwOdu1n04HCFUBLyGNwEPkUPdq7QxUQ2his7GA1i+roque5C/4jog2dR5l0YF8lztlhWwhFFp/ZOi2e8msoOaAM5oFusuooRHPndsI5lGoRZBuQyXF268p2em/oo149ex3QEApceJjoK5Q2p1vwiirMzmbwrZpeW1oia7Cok3hePhXErt85Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by IA1PR11MB7870.namprd11.prod.outlook.com (2603:10b6:208:3f8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Thu, 5 Oct
 2023 04:34:41 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::f525:287c:b2c:81c5]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::f525:287c:b2c:81c5%7]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 04:34:41 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [RFC 1/3] drm/i915: Add wrapper for xe compatibility
Thread-Index: AQHZ65MsiUH6VqzZ+UqRdHCoHD7IoLAjeRmAgBc3l5A=
Date: Thu, 5 Oct 2023 04:34:41 +0000
Message-ID: <SJ1PR11MB6129A1FC40EFEAF16CBCA9BBB9CAA@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20230920071700.434195-1-chaitanya.kumar.borah@intel.com>
 <20230920071700.434195-2-chaitanya.kumar.borah@intel.com>
 <87editrx2s.fsf@intel.com>
In-Reply-To: <87editrx2s.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|IA1PR11MB7870:EE_
x-ms-office365-filtering-correlation-id: a0b624d1-93e2-47e7-90ce-08dbc55c6481
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JhljudR8YkAuIFbwb/IneUkDI5s/7ePb6LQS3RKJ4jyJySSNfjvL3BTtgKxuzJI2p/+owG+QfibxBu9lDQPVAW+MN5Vrkq29rsdvz8qBPcR0A9UNqmsLbEJpqBaH63UU42Fg930gT3VWGYvx8UOQY3gHu9BLhsbhAeSZJoB7tc93uDyuKajQqnyhHjU9BiIsOv4hRB+y1SHuygz4oJ8qu0hFrckeDOz+pKnW2qq6lWuV1aQhttfzFtdWO1naU8YCL0yLp36Md5zR0qjoY3rlam5u7lEcrCygmXisPRNyS9ZFl8X++LPF3OT1FxHOXxay+l9Qa7/4M2K7IV50FIGrzFVSyn8/wKHwyGyQvBv6uDwo3WPPuSGNVTQniJ6hKwW0+cqJzpOUY1T/gqb7gTGCHwjCeYGSMCrmlEVTIFILlTSGkfHnVxgD9TfgJnohy7vM8jNT62yjByjFktRMRQKvKKaj1UEHKQcXL7NZKao4pwK+3CjQntCPfteSQMx2kbT67WK5ttxyo1wdcjWi81Jc27GalmCIl4K8pcNCsvJk9WR4z6lfwU67sYL27Gr8IiX7Yjlvh7LNdYLzguc5IRy4LuQMV7zddNo9L912mxPO5x82Ddlsi09j2FHa5uDBTMA2
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(346002)(366004)(39860400002)(376002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(53546011)(9686003)(122000001)(82960400001)(71200400001)(966005)(83380400001)(41300700001)(38070700005)(38100700002)(64756008)(26005)(478600001)(54906003)(316002)(7696005)(6506007)(110136005)(66476007)(66446008)(76116006)(66946007)(66556008)(86362001)(52536014)(5660300002)(8936002)(8676002)(4326008)(55016003)(33656002)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rXJwED3kjgw0JKnNAmjMHx6HxZt5t/yYf3MmvQ8c79xiQyWNc886WY6PSHYe?=
 =?us-ascii?Q?N/BGAroWZ17JKu8c4jCSTpKKIugp9cP15qs7u4gUlbGuqNFpeTzJLhT66IcS?=
 =?us-ascii?Q?cqrjgRko6ZuKKgO8QeuXpo//UG5G2kATgf4WMPsi440H25G/SBFw0rT5bn9k?=
 =?us-ascii?Q?Qf+nuLysmXeKrDXA/J4flytScuQynrIOdto+nIRHGgnL2EJtoFIGzCAuHzcU?=
 =?us-ascii?Q?oO4XXX55JA2sj+6kvATteM8BmH5r1m5gHk57H2jc8q9hrN5pDbUGFBWFWNt6?=
 =?us-ascii?Q?9HmAtTVX+lYhZllGnashlusyBO4qQuqc7PqYDkUfSwsRqMFuJyoobT/Y/x3l?=
 =?us-ascii?Q?CrCIhkwwbju6nG5K+b6dKGrApowV8Jqib/kSUaj8dkqVzEoEjRFDxmIFY5nF?=
 =?us-ascii?Q?LeW6zRENIhu/UwxIfYozDZsGWaDzE6MgR3C10suR7cZQUTjvvdcLsNyso0rR?=
 =?us-ascii?Q?ZLHigMy9L/u7YCqWGpk+IEh3GiK9NRjLGpSdxWI+Um8RGL9bOd4RaBjnKOby?=
 =?us-ascii?Q?8AixKVBYsdnZOsb8YSkwICF8pOCsH1ndWF72v2DgZcO3fJ3/NbTMcAqX+dUV?=
 =?us-ascii?Q?keuhfpdt1iRZOxaNLHqgXqWdpJNsLzkRq4bL1XG+8zcEkrm7v7X0U31gmVjD?=
 =?us-ascii?Q?kB4h1H8V5ryikSWWzsFFB8xGgKDKARCzbEBPkZ9leht2cmrjxNhduqLZRJyP?=
 =?us-ascii?Q?BG4vSBrT3enEkOw6JNVHTy54XpYr65VFUF6cjpJ6ZoBIAo0AHmVisi0IvaLz?=
 =?us-ascii?Q?oW4EpsujxmjkMbOfLfpMh2QG1Q6KrstVG02SY8WqF9oqXrPlV7E1SstiBuOo?=
 =?us-ascii?Q?T5Ga9kvQvTilP6S7QhLeDXDrKocnAdSguXxcS13aC8UigTZ2fVLw7n7UJc5w?=
 =?us-ascii?Q?9wOi+zPIME1WQtJH0+upkSmqU/3gykN0URUFdQNPJ/ikBjJuCfxy7WqJ5VCa?=
 =?us-ascii?Q?f954wwNBcutjrL8WN8/II954CzttAXRQg7FHkdDKuf9wvNN4qllrwU52wnYH?=
 =?us-ascii?Q?E5zlfrSKKGQ8Kgw16lLwmVj+KqHVBuuFkb/cS8napEBrMC9ZM51SnoB8y/Jy?=
 =?us-ascii?Q?WgLZyYoiSISmDVzkeRK4+4zcRH9yjs+hNP01x1FtPzcoe7pCkW/Fnj5mEU4/?=
 =?us-ascii?Q?WKH7E5/ZGdUKWaTrXuDvEkhU+o4wgCUVOF58X9Wl5gLOkwhmsaQBEzs0CHtu?=
 =?us-ascii?Q?b993JaA9qpZ6prtp7v2h76NYIg0GwsciET+wBVda1CwLK3KD61ZB2mP6dL2X?=
 =?us-ascii?Q?38laiGJ072IlBht9QZldnjaXeUN4xSa/sr8dPMYfR4J7Ru9766NxrqFgM2Ti?=
 =?us-ascii?Q?1qMUZF9RDgX731ShM4C8jAgT5DzUUSrZc/iJFAZzvc5DXHjEdukh2HIZUQkx?=
 =?us-ascii?Q?QFMRX3dT1jIcbgSQ9KgmEvXFLCRmUyOA83RmWSmlV8dsFwMMvLkICvkaS6As?=
 =?us-ascii?Q?lkuKIw5EOBucAYHXC11/x71cJRJLxjHzHERLvnyEvX0GtY6NdRmamOMfaWou?=
 =?us-ascii?Q?LVuGMfFoiFV9ZXVnt93L++bwJD0PSGPeyJqfzFx5H52Vkzhcep0eaVYmr5Mt?=
 =?us-ascii?Q?b4158dmn7CpAx4QXpxn5YCQJXx7hLfopsZwA5D+wFkv1MdQk0KmcxnKy66dt?=
 =?us-ascii?Q?ig=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0b624d1-93e2-47e7-90ce-08dbc55c6481
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2023 04:34:41.6522 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: STRGPOQIE1ZEKP0A92kP59OYmmVEf6i8OwcL2wMXvg49sylR13caX6hveSNo0M2krd3e+AkDxdxhprFM9piVJFzm7dgVl5d4QKfrLoX0Toc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7870
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC 1/3] drm/i915: Add wrapper for xe compatibility
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
> Sent: Wednesday, September 20, 2023 3:22 PM
> To: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>; intel-
> xe@lists.freedesktop.org
> Cc: Manna, Animesh <animesh.manna@intel.com>; Borah, Chaitanya Kumar
> <chaitanya.kumar.borah@intel.com>; Shankar, Uma
> <uma.shankar@intel.com>
> Subject: Re: [RFC 1/3] drm/i915: Add wrapper for xe compatibility
>=20
> On Wed, 20 Sep 2023, Chaitanya Kumar Borah
> <chaitanya.kumar.borah@intel.com> wrote:
> > Add a wrapper around intel_step_name to maintain compatibility with xe
> > driver. The wrapper will share the same name as the one to be used by
> > xe while both drivers include different files as needed during
> > compilation.
> >
> > Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> > Signed-off-by: Animesh Manna <animesh.manna@intel.com>
> > ---
> >  drivers/gpu/drm/i915/intel_step.c | 5 +++++
> > drivers/gpu/drm/i915/intel_step.h | 1 +
> >  2 files changed, 6 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/intel_step.c
> > b/drivers/gpu/drm/i915/intel_step.c
> > index c02a6f156a00..6b62b5fcc792 100644
> > --- a/drivers/gpu/drm/i915/intel_step.c
> > +++ b/drivers/gpu/drm/i915/intel_step.c
> > @@ -352,3 +352,8 @@ const char *intel_step_name(enum intel_step step)
> >  		return "**";
> >  	}
> >  }
> > +
> > +const char *intel_get_step_name(struct drm_i915_private *i915) {
> > +	return intel_step_name(RUNTIME_INFO(i915)->step.display_step);
> > +}
>=20
> Okay, so I've mulled this back and forth. Here's the, uh, steps I think s=
hould be
> taken:
>=20
> 1) Please name this intel_display_step_name() or
>    intel_step_display_name() or something. It's about *display*
>    stepping, and just intel_get_step_name() is a misnomer.
>=20
> 2) Use this in intel_dmc.c.
>=20
> 3) Send the above to intel-gfx, based on drm-tip. Make it into a single
>    patch. Get it merged to upstream i915.
>=20
> 4) On xe, revert the FIXME patch in question.
>=20
> 5) Add a fixup to remove "#define intel_step_name xe_step_name" from
>    compat-i915-headers/i915_drv.h
>=20
> 6) Backport the upstream patch from 3) to xe.
>=20
> 7) Add xe_step_display_name() or similar, mimicking the one added to
>    i915. Don't name it the same as in i915.
>=20
> 8) In compat-i915-headers/intel_step.h, add a static inline to bridge
>    the call from intel_step_display_name() to xe_step_display_name(). Or
>    make it a #define.
>=20

Thank you for the inputs.
Please find the patch for i915 here

https://patchwork.freedesktop.org/patch/560528/?series=3D124340&rev=3D2

For the xe part, I will float once this patch is backported.

Regarding other parts of the Fixme patch, I am planning to add compatibilit=
y headers for the macro/debug function.
Let me know if you have any early comments on these.

+#ifndef _INTEL_UC_FW_H_
+#define _INTEL_UC_FW_H_
+
+#define INTEL_UC_FIRMWARE_URL "https://git.kernel.org/pub/scm/linux/kernel=
/git/firmware/linux-firmware.git/tree/i915"
+
+#endif

+#ifndef _I915_GPU_ERROR_H_
+#define _I915_GPU_ERROR_H_
+
+struct drm_i915_error_state_buf;
+
+__printf(2, 3)
+static inline void
+i915_error_printf(struct drm_i915_error_state_buf *e, const char *f, ...)
+{
+}
+
+#endif

Regards

Chaitanya

>=20
> BR,
> Jani.
>=20
>=20
>=20
> > diff --git a/drivers/gpu/drm/i915/intel_step.h
> > b/drivers/gpu/drm/i915/intel_step.h
> > index 96dfca4cba73..25a1b1948a43 100644
> > --- a/drivers/gpu/drm/i915/intel_step.h
> > +++ b/drivers/gpu/drm/i915/intel_step.h
> > @@ -78,5 +78,6 @@ enum intel_step {
> >
> >  void intel_step_init(struct drm_i915_private *i915);  const char
> > *intel_step_name(enum intel_step step);
> > +const char *intel_get_step_name(struct drm_i915_private *i915);
> >
> >  #endif /* __INTEL_STEP_H__ */
>=20
> --
> Jani Nikula, Intel

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FAE2C4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 16:58:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 031C810E78C;
	Wed,  6 Dec 2023 16:58:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A34A010E124
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 16:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701881893; x=1733417893;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6SoagiC/bvRR+9rMYaBUZbxfQ1oETsHye/E82ManeMc=;
 b=XllIMl1wi+n+/ihOyd02Ruj85I5niHEZY5OUoX8f2qJNCF86bwAtqd8U
 xmbLOacF+sI+YIrSfxvV3EoE59sm+FYd/7+m/G4CrJ1tXl9FeX/oNEH4s
 mX2PIkJGhbKMw/RUr8Gn68NULLZpO+TS/0rAAXZpMcqDPs6oYq46GzHRu
 kcZG07spDKaR6ab/Y3RKit13+j/ut0OuNx/lTf/kgRK48ZJ85OEyVGbbW
 5w2IrLrRILhcV1rQg/sI9yuUx/+eMXdpUO3wwzgUcQ2fUWRY+dBrELWdg
 QUM+Fsr/NuU/X1HrY6kEQ5B8/9WvqdsH4wUYtPR45QOBr14Mg/eD4O1RY Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="373562026"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; d="scan'208";a="373562026"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 08:58:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="764792244"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; d="scan'208";a="764792244"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2023 08:58:12 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 08:58:12 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Dec 2023 08:58:12 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Dec 2023 08:58:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NKisfGvdsgwZrSUzJgYEDuQMQVahX0YGn0e6Yx8OQmwZ2a2diOAiGXr43KSdMNATzGP8S/7UguNlyhcTkz3e+V0JBLvLynX0F7A40gMXqp6mbOpk7Z+Kty0aZrz8duNxKlF+TAANvMhthV2SY3bUUa8QC/JujaaDSUbcKnsit9tEg8rNqE2kNGZCAWbZou1/gzxffbzBBRgjRPTBFs95oV2eyIzpn/xqDsezQv0JI8f3tHvg9zqlnqo4CsmwAITQsvx+80dW6E9LmA2qGbGzFbT2Bn4i8Dri9eYb4C6SIie9mXR3CdWJXkVHhBf91rAUE/pUDoY44aJilI0aRMtvjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UhKduIJLTiXq4lZ7AZmiH+qGsX504/MqZqLCFi7q990=;
 b=Qgd/gaWRa7ANgf4XQRvGrN+Pp2nkc4dQGh553NTKVsrfvx7mMliMt3ToeFvJnmG+CPhpQKf752L3/60HUAvHGr55AUa7tX/NBITOzYUBKvYMVUv68/HbZ+RcXui2O6ua/OeUCBUMeLzzkTEEQzSlxYYkk1wximC5MfA46FR+yAMPlW0jRC/PKDPyDPYRtxcZcTX420usM4HYoelkqoNa3bKteAAmVypYnGSkzJ0gX4qF8p2/K9rDEv4jxg7b6NUe6p0k5JP7BGDu9C4LGs9Q3Fv1303t394Nw2HARkurGGVSk7eF/cP+Q6lCYpQoongL+AmfYgHdLhpcMfSW0hbu4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5293.namprd11.prod.outlook.com (2603:10b6:5:390::20)
 by CY8PR11MB7798.namprd11.prod.outlook.com (2603:10b6:930:77::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Wed, 6 Dec
 2023 16:58:09 +0000
Received: from DM4PR11MB5293.namprd11.prod.outlook.com
 ([fe80::e480:1717:8a53:1406]) by DM4PR11MB5293.namprd11.prod.outlook.com
 ([fe80::e480:1717:8a53:1406%6]) with mapi id 15.20.7068.025; Wed, 6 Dec 2023
 16:58:09 +0000
From: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>
To: "Dugast, Francois" <francois.dugast@intel.com>
Thread-Topic: [Intel-xe] [PATCH v3 1/2] drm/xe/uapi: add exec_queue_id member
 to drm_xe_wait_user_fence structure
Thread-Index: AQHaJ/bIkusnclH8gEqMSvKpxzUESrCb/7QAgABY6ACAACGmUA==
Date: Wed, 6 Dec 2023 16:58:09 +0000
Message-ID: <DM4PR11MB52931F2491C9E2ECE1AF05509D84A@DM4PR11MB5293.namprd11.prod.outlook.com>
References: <20231206034130.7897-1-krishnaiah.bommu@intel.com>
 <20231206034130.7897-2-krishnaiah.bommu@intel.com>
 <ZXBA1CJ85aUwaPvB@fdugast-desk.home> <ZXCLaNuy3fG9Od_V@fdugast-desk.home>
In-Reply-To: <ZXCLaNuy3fG9Od_V@fdugast-desk.home>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: francois.dugast@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5293:EE_|CY8PR11MB7798:EE_
x-ms-office365-filtering-correlation-id: b7d0f382-1ff4-4813-2337-08dbf67c8670
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YqODHnL8khk5GhPe4F18XT6YCVC0/BQOxbQBFSHek1RcGvNIwKfvkz6Z+GE6hTJ6NLppGLuNbnUhp/HnZlOeHGuBH+Yxub5jAu8vfPD23j98a9iLFvPk3Yn1Bdn4eWgvf3z78FN6nuaP3/baFmSOPjTZXMeIxmMdiTcmnGjzk3Fo/hkRn4xYDsMUl+z6ErCsBxlpjJ48Uqva5PSmyuXuIp71axdP3FuPM1DS39c5BfqiUxtDtEmSrxSO3zNtlKGD2UqRnofQeuEXe5HXI3mvgAyILFrUXtGUdx3wrw+8T59wVKuoiYZ6JU98qg1Q1064wALNbSrN3PD1DyUMj4htCxgSID/G2Eq9Mbo79Ida9la8hR9zme21YQBtzsno3OK7P0GQlT7dwjHys2obKTNcwHKLLd0aUKEYDzCaUAstkUehYFPUNWMPiX9Lnt4ba/LVi3vJ8Osa4uHcts8VLqNimThZMJAqBoqImu77KcUQ5JZoXHT7PayPaDsSoqEirw8Ih4NIIHJmKJ2DrwKC+wVUBjEg5JfdE7dr9KbPxJx6Q/V+nqzyTg42xHSk1V7Dz59Jd6BelXbZ+aE7gQodzq8yTzrKEqsj31BErEvAA3pzbZk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5293.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(346002)(39860400002)(396003)(376002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(107886003)(9686003)(6506007)(53546011)(83380400001)(26005)(52536014)(41300700001)(86362001)(64756008)(8936002)(6862004)(4326008)(2906002)(8676002)(33656002)(5660300002)(66476007)(66556008)(6636002)(66446008)(38070700009)(66946007)(76116006)(316002)(54906003)(7696005)(71200400001)(966005)(478600001)(55016003)(82960400001)(38100700002)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8sl/mf5ZlcU1wNn0GtVXeqkQZP4QO1do3JDqyHdgCFulTyXqxMSiQxIsRTqH?=
 =?us-ascii?Q?I4YABiCoJUTeVK0H9OJQ1ho6D5tcTT0UEtHaN05oE3sihiECfamK2t6rFeMc?=
 =?us-ascii?Q?3v/jJTSgtEX7m1m3hNc5QrqyDvTCV0wwLcViQznGdAE6g1zYTuMVOdQQ0NeH?=
 =?us-ascii?Q?740/217R0osRbJLB3vmvIqZQwPsDkbPk7znCMLhubgK8TCZy4/MV/UauEcbc?=
 =?us-ascii?Q?5HFO06Yfi8XV2L3jbX1ATRy6coLdsrjwr8ggmg3JjGWzPpX7zmxZ4k7ZXUE0?=
 =?us-ascii?Q?OK4UH+QX0ZxEoLOD4JAPQjCjz1jpTr65FBqgIFFI6PMxebEHPKIoComsrPJP?=
 =?us-ascii?Q?SV9gTKzlNb0yrHP1GJEsPj1QBVEDbA78PYRaSKNA+QjN5jYS2DxNq9mPBe5l?=
 =?us-ascii?Q?alFVw83lpmARiS5+Ck9peZMpSQ1uoybZd7Rlt89juMY2qEe0lJm4ctOrpxIy?=
 =?us-ascii?Q?i0zsW/2CyF2S6lAYCCH1Sp8Ly6BDvccyVD8gRoyFOzNF9kjX89kVoRgD8873?=
 =?us-ascii?Q?AIaCIaPjpUp8FBi2Qvl+dtmov0KXxRhwCxp1uFZhJHck/CNw4SmqIuYBxbb6?=
 =?us-ascii?Q?LgigY+afS1sNP6q6eP43oZ8E6+CPWDbYy984ixufdzWhwAbmxmNLnueo6i2d?=
 =?us-ascii?Q?LPsLNJNYQx+WtnPJ3oozJAC/JzfhT7v/0Z+UI7tzehCnTYzUvo2SL1ePpTUG?=
 =?us-ascii?Q?4mYnDnCMFo+wlhCQupwI7XK+Rva17rfvbfzrIBUig6gnmmPvpyL3Xaw8OX3l?=
 =?us-ascii?Q?rHqBKefrJRvYOygm7bQnaWYS8DKLliuNXfoFumxPka0lLPXmDm2USOj/fRSZ?=
 =?us-ascii?Q?vV/LrM8idIb1+VSoS+r0a6dbr6UnMk4m3QA2Glc5eBBCZxzp6xyqh2ggUgX7?=
 =?us-ascii?Q?9/uhl3EX/NiC4yYfQO0joZDW0fFdZ+ps7EagZKsqSml2LN4U1cPAX3ObSe4C?=
 =?us-ascii?Q?Nquy5xDhqjHvj/7aZi3VI/rwe+N1VgODgZ6kJZsgBqp1SXU90WMoXJvMgQ9B?=
 =?us-ascii?Q?pb5pjKcbaN7Q2m7R3AayGukrpoDsA57iPyrvzp4xWFbZLmoFw63ov2L+pLvp?=
 =?us-ascii?Q?Kr9ArQWX69C0a/dHQ1UbSY5RVur8S1I2kAONH3r7o+DFr+Vg3mfFfGuBhmYT?=
 =?us-ascii?Q?4nqO48ZMGiPZVDdUmYcRwYhWVmtBDUZ7LdUsqUnaGhP+u9R4EmlYDRdWtAVK?=
 =?us-ascii?Q?Wd7/0ntTSIC8X5A+SUqrDp8nGZkLFiEU0Bee3aJ7UiL5RphOy+lIdOBtlkG+?=
 =?us-ascii?Q?Kr0JZL/LSVMAZGL1yJ87jJ3ZmZWya2WGtuP+o/xReeyLEZBHSoCaO0zQxICd?=
 =?us-ascii?Q?MezfakiFrLHc66FlyN4SqUfP4RNke2M3Ra0JoEPkqV+dpnlOD6Stfre2r+rm?=
 =?us-ascii?Q?gZAAH1nyycXDj5ML7UhpwOc77UEM9+EELma7EN41AapgFac66EiQI34u1Q1x?=
 =?us-ascii?Q?cGTKGm9B2GzHYPcSd9k8xSazqYQgF08WRID1J0oB2fvi0WH4QDctH/T9gtKX?=
 =?us-ascii?Q?8XqcydR1ZY9mGNZHosnr7s7zlqELFKAPgVfy9hVNKQTSzlFxVoPxuw/dYOPH?=
 =?us-ascii?Q?Qs2E0r69m8J8fnFzJab9pmDAroxFsEPICVKR1BXA?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5293.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7d0f382-1ff4-4813-2337-08dbf67c8670
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2023 16:58:09.4657 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ey2OdpIzRzu12+cKoUMShIDFDDp4ngQFU4IbfPZwdHmCQ9kdQgdOVqhuUHeXvFuq0MqXLK+5b3y16xAw9sZ75blBMRf/I3C9eLO7kjdk9XQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7798
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 1/2] drm/xe/uapi: add exec_queue_id member
 to drm_xe_wait_user_fence structure
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Dugast, Francois <francois.dugast@intel.com>
> Sent: Wednesday, December 6, 2023 8:26 PM
> To: Bommu, Krishnaiah <krishnaiah.bommu@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Vivi, Rodrigo <rodrigo.vivi@intel.com=
>
> Subject: Re: [Intel-xe] [PATCH v3 1/2] drm/xe/uapi: add exec_queue_id mem=
ber
> to drm_xe_wait_user_fence structure
>=20
> On Wed, Dec 06, 2023 at 10:37:24AM +0100, Francois Dugast wrote:
> > Hi Bommu,
> >
> > On Wed, Dec 06, 2023 at 09:11:29AM +0530, Bommu Krishnaiah wrote:
> > > remove the num_engines/instances members from drm_xe_wait_user_fence
> > > structure and add a exec_queue_id member
> > >
> > > Right now this is only checking if the engine list is sane and
> > > nothing else. In the end every operation with this IOCTL is a soft ch=
eck.
> > > So, let's formalize that and only use this IOCTL to wait on the fence=
.
> > >
> > > exec_queue_id member will help to user space to get proper error
> > > code from kernel while in exec_queue reset
> > >
> > > Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > > Acked-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_wait_user_fence.c | 64 +----------------------=
--
> > >  include/uapi/drm/xe_drm.h               | 16 ++-----
> > >  2 files changed, 4 insertions(+), 76 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c
> > > b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> > > index 4d5c2555ce41..9f272bbaad95 100644
> > > --- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
> > > +++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> > > @@ -50,37 +50,7 @@ static int do_compare(u64 addr, u64 value, u64 mas=
k,
> u16 op)
> > >  	return passed ? 0 : 1;
> > >  }
> > >
> > > -static const enum xe_engine_class user_to_xe_engine_class[] =3D {
> > > -	[DRM_XE_ENGINE_CLASS_RENDER] =3D XE_ENGINE_CLASS_RENDER,
> > > -	[DRM_XE_ENGINE_CLASS_COPY] =3D XE_ENGINE_CLASS_COPY,
> > > -	[DRM_XE_ENGINE_CLASS_VIDEO_DECODE] =3D
> XE_ENGINE_CLASS_VIDEO_DECODE,
> > > -	[DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE] =3D
> XE_ENGINE_CLASS_VIDEO_ENHANCE,
> > > -	[DRM_XE_ENGINE_CLASS_COMPUTE] =3D XE_ENGINE_CLASS_COMPUTE,
> > > -};
> > > -
> > > -static int check_hw_engines(struct xe_device *xe,
> > > -			    struct drm_xe_engine_class_instance *eci,
> > > -			    int num_engines)
> > > -{
> > > -	int i;
> > > -
> > > -	for (i =3D 0; i < num_engines; ++i) {
> > > -		enum xe_engine_class user_class =3D
> > > -			user_to_xe_engine_class[eci[i].engine_class];
> > > -
> > > -		if (eci[i].gt_id >=3D xe->info.tile_count)
> > > -			return -EINVAL;
> > > -
> > > -		if (!xe_gt_hw_engine(xe_device_get_gt(xe, eci[i].gt_id),
> > > -				     user_class, eci[i].engine_instance, true))
> > > -			return -EINVAL;
> > > -	}
> > > -
> > > -	return 0;
> > > -}
> > > -
> > > -#define VALID_FLAGS	(DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP | \
> > > -			 DRM_XE_UFENCE_WAIT_FLAG_ABSTIME)
> > > +#define VALID_FLAGS	DRM_XE_UFENCE_WAIT_FLAG_ABSTIME
> > >  #define MAX_OP		DRM_XE_UFENCE_WAIT_OP_LTE
> > >
> > >  static long to_jiffies_timeout(struct xe_device *xe, @@ -132,12
> > > +102,8 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void
> *data,
> > >  	struct xe_device *xe =3D to_xe_device(dev);
> > >  	DEFINE_WAIT_FUNC(w_wait, woken_wake_function);
> > >  	struct drm_xe_wait_user_fence *args =3D data;
> > > -	struct drm_xe_engine_class_instance
> eci[XE_HW_ENGINE_MAX_INSTANCE];
> > > -	struct drm_xe_engine_class_instance __user *user_eci =3D
> > > -		u64_to_user_ptr(args->instances);
> > >  	u64 addr =3D args->addr;
> > >  	int err;
> > > -	bool no_engines =3D args->flags &
> DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP;
> > >  	long timeout;
> > >  	ktime_t start;
> > >
> > > @@ -151,41 +117,13 @@ int xe_wait_user_fence_ioctl(struct drm_device
> *dev, void *data,
> > >  	if (XE_IOCTL_DBG(xe, args->op > MAX_OP))
> > >  		return -EINVAL;
> > >
> > > -	if (XE_IOCTL_DBG(xe, no_engines &&
> > > -			 (args->num_engines || args->instances)))
> > > -		return -EINVAL;
> > > -
> > > -	if (XE_IOCTL_DBG(xe, !no_engines && !args->num_engines))
> > > -		return -EINVAL;
> > > -
> > >  	if (XE_IOCTL_DBG(xe, addr & 0x7))
> > >  		return -EINVAL;
> > >
> > > -	if (XE_IOCTL_DBG(xe, args->num_engines >
> XE_HW_ENGINE_MAX_INSTANCE))
> > > -		return -EINVAL;
> > > -
> > > -	if (!no_engines) {
> > > -		err =3D copy_from_user(eci, user_eci,
> > > -				     sizeof(struct drm_xe_engine_class_instance)
> *
> > > -			     args->num_engines);
> > > -		if (XE_IOCTL_DBG(xe, err))
> > > -			return -EFAULT;
> > > -
> > > -		if (XE_IOCTL_DBG(xe, check_hw_engines(xe, eci,
> > > -						      args->num_engines)))
> > > -			return -EINVAL;
> > > -	}
> > > -
> > >  	timeout =3D to_jiffies_timeout(xe, args);
> > >
> > >  	start =3D ktime_get();
> > >
> > > -	/*
> > > -	 * FIXME: Very simple implementation at the moment, single wait que=
ue
> > > -	 * for everything. Could be optimized to have a wait queue for ever=
y
> > > -	 * hardware engine. Open coding as 'do_compare' can sleep which
> doesn't
> > > -	 * work with the wait_event_* macros.
> > > -	 */
> > >  	add_wait_queue(&xe->ufence_wq, &w_wait);
> > >  	for (;;) {
> > >  		err =3D do_compare(addr, args->value, args->mask, args->op);
> diff
> > > --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h index
> > > eb03a49c17a1..d922641e11e8 100644
> > > --- a/include/uapi/drm/xe_drm.h
> > > +++ b/include/uapi/drm/xe_drm.h
> > > @@ -1030,8 +1030,7 @@ struct drm_xe_wait_user_fence {
> > >  	/** @op: wait operation (type of comparison) */
> > >  	__u16 op;
> > >
> > > -#define DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP	(1 << 0)	/* e.g. Wait
> on VM bind */
> > > -#define DRM_XE_UFENCE_WAIT_FLAG_ABSTIME	(1 << 1)
> > > +#define DRM_XE_UFENCE_WAIT_FLAG_ABSTIME	(1 << 0)
> > >  	/** @flags: wait flags */
> > >  	__u16 flags;
> > >
> > > @@ -1064,17 +1063,8 @@ struct drm_xe_wait_user_fence {
> > >  	 */
> > >  	__s64 timeout;
> > >
> > > -	/**
> > > -	 * @num_engines: number of engine instances to wait on, must be zer=
o
> > > -	 * when DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP set
> > > -	 */
> > > -	__u64 num_engines;
> > > -
> > > -	/**
> > > -	 * @instances: user pointer to array of drm_xe_engine_class_instanc=
e
> to
> > > -	 * wait on, must be NULL when
> DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP set
> > > -	 */
> > > -	__u64 instances;
> > > +	/** @exec_queue_id: exec_queue_id returned from
> xe_exec_queue_create_ioctl */
> > > +	__u32 exec_queue_id;
> >
> > This creates a misalignment. Please add a __u32 pad2. With this:
> >
> >     Reviewed-by: Francois Dugast <francois.dugast@intel.com>
> >
>=20
> The kernel doc in the header update in IGT seems incorrect:
> https://patchwork.freedesktop.org/patch/570752/?series=3D127364&rev=3D3
>=20
> Please make sure it matches the name pad2, so:
>=20
> 	/** @reserved: Reserved */
> 	__u32 pad2;
>=20
> should be:
>=20
> 	/** @pad2: MBZ */
> 	__u32 pad2;
>=20
> and just like for pad, pad2 must be zero and this must be checked:
>=20
>     XE_IOCTL_DBG(xe, args->pad2)
>=20
> Francois
>=20

Thank you @Dugast, Francois for review=20
I will update as below
root@kbommu-desk:/home/kbommu/xe_public/kernel#
root@kbommu-desk:/home/kbommu/xe_public/kernel# git diff
diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/x=
e_wait_user_fence.c
index 74f72dad2d0b..085b46ebe2f8 100644
--- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
+++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
@@ -123,6 +123,9 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, vo=
id *data,
        if (XE_IOCTL_DBG(xe, addr & 0x7))
                return -EINVAL;

+       XE_IOCTL_DBG(xe, args->pad2)
+               return -EINVAL;
+
        q =3D xe_exec_queue_lookup(xef, args->exec_queue_id);
        if (XE_IOCTL_DBG(xe, !q))
                return -ENOENT;
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index d922641e11e8..385c36e13cf2 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1066,6 +1066,9 @@ struct drm_xe_wait_user_fence {
        /** @exec_queue_id: exec_queue_id returned from xe_exec_queue_creat=
e_ioctl */
        __u32 exec_queue_id;

+       /** @pad2: MBZ */
+       __u32 pad2;
+
        /** @reserved: Reserved */
        __u64 reserved[2];
 };
root@kbommu-desk:/home/kbommu/xe_public/kernel#

> > >
> > >  	/** @reserved: Reserved */
> > >  	__u64 reserved[2];
> > > --
> > > 2.25.1
> > >

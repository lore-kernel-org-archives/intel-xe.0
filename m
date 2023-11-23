Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71119C5AD4C
	for <intel-xe@archiver.kernel.org>; Thu, 23 Nov 2023 13:45:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DB9A10E74F;
	Thu, 23 Nov 2023 13:45:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF7F610E74F
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Nov 2023 13:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700747121; x=1732283121;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NVpy96LyI3XftGlvUgDUe1AJDEt7CWIPLiNe5pOSS2A=;
 b=DZJ414TtbO+N7uZqMyL5dtczLU38XZymwAaTG4iLJzvXo8rQoS7TIsPN
 SH8EQvPmwdZwSwbi1XX+XBkJhMWT+epLHTBfH2iHuiTAG8Ac8Ow00IOAr
 eFN8zMNNK895yn17IKd35gw77R9ihrjhDheaeVGROndW0OEFgLlb4xuYE
 bcVD8CIG7uiW/ZzqPE3VPJpAC2/ImQndJztbMSPoPPBC+IkQFiDi6K+Fh
 ko1ZBfVZmbE3f7oWuxufeZbXuWZSf1ebfLdSK6I/fRBWZL7wPT5cU4G2T
 bwJh2KJ2rKE/AohEvwpkEUKzmLrZKyAMt0QKOw6/dSuWfM9Fip6eIgZiA A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="372425993"
X-IronPort-AV: E=Sophos;i="6.04,221,1695711600"; d="scan'208";a="372425993"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2023 05:45:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,221,1695711600"; 
   d="scan'208";a="8852922"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Nov 2023 05:45:21 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 23 Nov 2023 05:45:20 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 23 Nov 2023 05:45:20 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 23 Nov 2023 05:45:20 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 23 Nov 2023 05:45:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z1igBspXkjOcoeOlOcpwT0YCBAG27LxSSe49lHpsM7TGOJsitAB3IomNj4ABadXNBrEhKaczPVZRtUjbbqCLvfoN2TsZ8+nkcGM9BCiDHLS/B+pB+IW09LN/bd0gndKm+debQO1N6gl0egLD/E9hjN1SCQIRi1YbZC0weiTtUxVXKQNcdvEa1KxtCDaQJjOmuv5KX21DSWEJL3CUkf3pnaL4XnUothaQn3YsxuRORqOLchFUT3AnQa7RQ7dtCWQSdaZPQn9ZvZhQqiGtF+9VyieDxeam7j2VEn4QdklEGfHI+ViXWb9xz6vIpuFCO/tBQX86Bv8o6bI1gSjRyVuilg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sKKQptwACj9gSLl2U52NBal8e3QXGhEm+FHcvRvzmeY=;
 b=TJxYOvH42cLFDSWozAB2kzbjlFDrO/+iIoL4ZdqIsBnXjLCLmUlomS/p444FqDlok0H5STC32PHFPpadvKewTG5ejpLT6ygiYkbpC4SJEBrYSQMiX2XHyBQWpurMEo+HcZXQcPTRHCgPYCeJ/dFreghN7hViMxg+eaKIWcTn0PNBR5Bb7CNnqqU1yunSS+nPDliyyLc//v+dRiPC68FEsng4m27JHyrZl9vNBVttqHj3Ra8LvynVXgKwiygvPXqD329FAFaPfXsfcvIIZi8RFZ8zKYxzk9xp1DLGNa1zmlAhPCWFYINAs2WxZDVlTgyM9mqtpA9aQrFUgQGsBa8prw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by DM4PR11MB6336.namprd11.prod.outlook.com (2603:10b6:8:b9::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.20; Thu, 23 Nov 2023 13:44:54 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::399c:3488:d511:adef]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::399c:3488:d511:adef%7]) with mapi id 15.20.7025.020; Thu, 23 Nov 2023
 13:44:54 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
Thread-Topic: [Intel-xe] [PATCH] drm/xe/xe2: Add workaround 16020292621
Thread-Index: AQHaG52YloEA+Mi020ed87vYxVgJdrCGptSAgAFHpoA=
Date: Thu, 23 Nov 2023 13:44:54 +0000
Message-ID: <SJ1PR11MB620493CA70AE176DFD853BD481B9A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20231120104645.3570901-1-tejas.upadhyay@intel.com>
 <20231122180927.GE5757@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20231122180927.GE5757@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|DM4PR11MB6336:EE_
x-ms-office365-filtering-correlation-id: 32fdca27-4045-437b-725e-08dbec2a5fb1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i9oDpZw0o/T40Na4d6I9jza13+7SLCQm3jm/UNwZfW4HIe5kg2AZlRERsbfHLGx0j7fU5L15b+n7gAZr/aanrrWXy3Wth0II+J7VC01EAw2kDleKHxj7h2bNpEtDXN3Qbi36FTiRx/LjghM/JMgnfZJZA/SCuMX8gXP6YB+y7CUu4x5fSaAgcAuqQlSV9YPlcgzNZWZHPyUi0RzEbnOWoanf1gxwKhJMb/avz8tlTZI0LKRt7UbYQCkesNOZ1YxPo/RZM9Ru7u0kzNJpSbqg6gLBKa674nJTPP+VKotWMBvmvUWitPxAk9saE6/noxM8WIntUYTw+6CKoXc1dKmcfBhk+tEhmHNp9L2frHxbLIz8uHsBcKe5U60v487bXHJ/8gQwXOaAOXjiB+ZfCLUf74gCoKVSgkI9svkgzAvCKh2jhMGwjlrZXZRJkJBGUQKY5xlDrnfvOQK9t3WQALDVHAsN9L/xs65gAYaBblyvsv71+Yam6PTUz0qoSiHUzraPxvKRgGeu4y5Zn0h6E16eER5lJkJlLaOjrfIoxsZcyV4aq/PtKex4zmvwJq9BtyP740QVG9jjefp+GN2vrRqUbfpFlzj79qv5KpqQTxDdcUk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(376002)(136003)(39860400002)(396003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(86362001)(83380400001)(33656002)(122000001)(38100700002)(38070700009)(82960400001)(66446008)(316002)(66946007)(66476007)(66556008)(64756008)(76116006)(52536014)(4326008)(8676002)(8936002)(55016003)(2906002)(41300700001)(5660300002)(6862004)(9686003)(6636002)(71200400001)(478600001)(53546011)(6506007)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3t6yhP7UNQdITc/aA44DRh25dcaVgymbbRDm8FqKAwlSVtcsEc2Ty62C3sLI?=
 =?us-ascii?Q?m771iRbXey99zpakXaLy+onVZyOnJvLBJqhqsBYfogzVO21HyyP/z3pw/qrU?=
 =?us-ascii?Q?09mwLWk/YBIFs7zrgTn0lJyGz3c9eBhQDqUtn1Ddje28wKNmr2NqwaH0wB31?=
 =?us-ascii?Q?1IiXi5Iv5kgpPNJn4hVJ7NpCTh+sHnN1/9iz+rzkbBOFklDWtusV6mx6MQCJ?=
 =?us-ascii?Q?VXpg/C/hAyxaW/p0l15RyF+cQP+KFM648k22q6faCHx/fMqvcLNi32mUM/B7?=
 =?us-ascii?Q?/S/OLDln55bm/sX5+tsW4PknTOxTulIvGmrUYX2h9yUVZYmszHUWB0hMQrYK?=
 =?us-ascii?Q?/dv4HRjIz6+y71YnM+/jPL7kjR9zUKxd8f33uRNImlckmQG7I0t5ZQVbH4lp?=
 =?us-ascii?Q?HiNApnmd+bY5wAH6s0GNP1JnODfH3p3GSXo25ZAKNMcGhaEXsy3EQlOmo96I?=
 =?us-ascii?Q?mKt+ykyVl9RpGkKAKfjscxw2X4Q5gU+nBWDkj0B2ik6I7hx8wj74zMAbe4zU?=
 =?us-ascii?Q?YuyUDWBZ849m4lkvc02FI7N3MxCVvMUkSNh+di3iSKKdA/k7z1206rAxa0Ko?=
 =?us-ascii?Q?N/7fSxugicM9JUOEwwYi+gUaBfF2IncEjd6S7p0fkqhkkhqEkqfey+uEu0FW?=
 =?us-ascii?Q?TlMn8qWzo9kYLukBmI6iI5iF56t75yx05PVR8GiMDseV479bRlxF5rRdmZJF?=
 =?us-ascii?Q?sco4jPvtMuq5dAWUQB03pT8KAuOuCZJqEzOc6YQh0lQ0hpzmIWM/f2qUgRC/?=
 =?us-ascii?Q?VsZ21C/X+kWlLoPMY6yipwlepjtMZ0VSBMxrGfm3q40Go/yU5JPhKbuRP9Lw?=
 =?us-ascii?Q?5WN6POBtxjBqUHlfoSNcp1ijxVofCnzh1StjL7CEU5sZ+D+mYWjUOkSlu7Da?=
 =?us-ascii?Q?/ROy/JSqMmZrVIJizaY+fT263MrZbbWrdPzlNzpEGXqi1s8G0yM3ev0Rihmy?=
 =?us-ascii?Q?KdkM5A38DpPVpGIfsYwNYHTbfSRvsz0wR9cVSIduvDbWuS2n4ozgeLq1NvEv?=
 =?us-ascii?Q?BVW2SZ9XY1PzaHX8Omch6v9RcftVUhJJvhXAPTSIGvhBi8R97xtuF057e/HB?=
 =?us-ascii?Q?7zSixhmNSQP0gBQlvwX4F6NNBvUZYV8YJJxHxhbJ7pCIrwCgHzvWD/PlR7bA?=
 =?us-ascii?Q?hHTL874ulhtp7w3jda14uS6DpUVkRKlVKJb+k83ccexv8Ri6ocn9fl3XXi6i?=
 =?us-ascii?Q?oXHEa7lL0JOhhTDY9g3wiyPQYEAYD7FJpGyMDyme71gfYvP+svnEpMPbZpuc?=
 =?us-ascii?Q?p7LNxK2yDWOD/t5p+ufXTfCFS9Thxg/GPJGSrgiBxH01yXq2RjWEm3qTu1VL?=
 =?us-ascii?Q?fAHmeWkG8wXNLtdTe4QIGjfGXc+CyA/6G9Oi0VjvaJHxSdGmklc5giwrzzlk?=
 =?us-ascii?Q?nW/7sKyKS5yiHzQquET910z8p2+llFDPvDKbHIAQSCAvorTyug8PO5/ZE+QD?=
 =?us-ascii?Q?7OAhW1cEx5AZyXhzgxxGkOrIDvj1PIIB9iXTu1U2vtMDZOMJDNZDyKWd9mGD?=
 =?us-ascii?Q?8pnxB0ZZevMOqPCWEWzOWNuF+DAYMOOsAikAPIS5I/53e1ZQsUqrC6t8HjUb?=
 =?us-ascii?Q?giCLSH1I1wwa7YLM3jlW7p4WK22vS0QPKISZXSJpasOLF78JjAR0TCa+jKkQ?=
 =?us-ascii?Q?EUO+4/LtrncidDD4It4G11y9aEMPe6Sv3SVXz/Td1jsn?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32fdca27-4045-437b-725e-08dbec2a5fb1
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2023 13:44:54.0913 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r3lz9h5GecsR+NfKhGYBZ05AgcIZQ1oklsNI6N9+WB9r3lp1y86d79xKjysdXQu5JeyhU8fGpVGOPBMbFiuYyhSKYRgyYF9lAiHqOunTMJM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6336
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/xe2: Add workaround 16020292621
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



> -----Original Message-----
> From: Roper, Matthew D <matthew.d.roper@intel.com>
> Sent: Wednesday, November 22, 2023 11:39 PM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [Intel-xe] [PATCH] drm/xe/xe2: Add workaround 16020292621
>=20
> On Mon, Nov 20, 2023 at 04:16:45PM +0530, Tejas Upadhyay wrote:
> > Workaround applies to Graphics 20.00 as part of ring submission
>=20
> The Xe2_LPG graphics IP used by LNL is version 20.04, not 20.00.  And
> according to the WA database, there should be a stepping check as well si=
nce
> this only applies to A-step hardware.
>=20
> >
> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_ring_ops.c   | 22 ++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_wa_oob.rules |  1 +
> >  2 files changed, 23 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c
> > b/drivers/gpu/drm/xe/xe_ring_ops.c
> > index 59e0aa2d6a4c..42eff69dff9e 100644
> > --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> > +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> > @@ -184,6 +184,22 @@ static int emit_render_cache_flush(struct
> xe_sched_job *job, u32 *dw, int i)
> >  	return i;
> >  }
> >
> > +static int emit_stalling_pipe_control(struct xe_sched_job *job, u32
> > +*dw, int i) {
> > +	struct xe_gt *gt =3D job->q->gt;
> > +
> > +	if (XE_WA(gt, 16020292621)) {
> > +		dw[i++] =3D GFX_OP_PIPE_CONTROL(6);
> > +		dw[i++] =3D PIPE_CONTROL_CS_STALL;
>=20
> The workaround asks for a post sync LRI to NOPID which seems to be missin=
g
> from the PIPE_CONTROL generated here.

Looks like for covering both Graphics 20.00 as well 20.04 WA, need to do so=
mething like this below :

+static int emit_pipe_control(struct xe_sched_job *job, u32 *dw, int i)
+{
+       struct xe_gt *gt =3D job->q->gt;
+
+       if (XE_WA(gt, 16020292621)) {
+               struct xe_device *xe =3D gt_to_xe(gt);
+
+               dw[i++] =3D GFX_OP_PIPE_CONTROL(6);
+               dw[i++] =3D GRAPHICS_VER(xe) =3D=3D 20 ? PIPE_CONTROL_CS_ST=
ALL :
+                         PIPE_CONTROL_LRI_POST_SYNC;
+               dw[i++] =3D GRAPHICS_VER(xe) =3D=3D 20 ? 0 : RCS_NOPID.addr=
;
+               dw[i++] =3D 0;
+               dw[i++] =3D 0;
+               dw[i++] =3D 0;
+       }
+
+       return i;
+}
+
 static int emit_pipe_imm_ggtt(u32 addr, u32 value, bool stall_only, u32 *d=
w,
                              int i)
 {
@@ -342,6 +361,8 @@ static void __emit_job_gen12_render_compute(struct xe_s=
ched_job *job,

        i =3D emit_user_interrupt(dw, i);

+       i =3D emit_pipe_control(job, dw, i);
+
        xe_gt_assert(gt, i <=3D MAX_JOB_SIZE_DW);

        xe_lrc_write_ring(lrc, dw, i * sizeof(*dw));
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_=
oob.rules
index 752842d734be..6ce3a8aa900b 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -20,3 +20,4 @@
 16017236439    PLATFORM(PVC)
 22010954014    PLATFORM(DG2)
 14019821291    MEDIA_VERSION_RANGE(1300, 2000)
+16020292621    GRAPHICS_VERSION_RANGE(2000, 2004), ENGINE_CLASS(RENDER)

Agree? Or I am missing something.

Tejas
>=20
> > +		dw[i++] =3D 0;
> > +		dw[i++] =3D 0;
> > +		dw[i++] =3D 0;
> > +		dw[i++] =3D 0;
> > +	}
> > +
> > +	return i;
> > +}
> > +
> >  static int emit_pipe_imm_ggtt(u32 addr, u32 value, bool stall_only, u3=
2
> *dw,
> >  			      int i)
> >  {
> > @@ -294,6 +310,8 @@ static void __emit_job_gen12_video(struct
> > xe_sched_job *job, struct xe_lrc *lrc,
> >
> >  	i =3D emit_user_interrupt(dw, i);
> >
> > +	i =3D emit_stalling_pipe_control(job, dw, i);
>=20
> Why are we doing this for video?  I don't see anything asking us to on th=
is
> platform.
>=20
> > +
> >  	xe_gt_assert(gt, i <=3D MAX_JOB_SIZE_DW);
> >
> >  	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw)); @@ -342,6 +360,8 @@
> > static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
> >
> >  	i =3D emit_user_interrupt(dw, i);
> >
> > +	i =3D emit_stalling_pipe_control(job, dw, i);
>=20
> If we're not checking the engine type here, we should do so inside the
> function so that we don't do this on CCS engines.
>=20
> > +
> >  	xe_gt_assert(gt, i <=3D MAX_JOB_SIZE_DW);
> >
> >  	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw)); @@ -374,6 +394,8 @@
> > static void emit_migration_job_gen12(struct xe_sched_job *job,
> >
> >  	i =3D emit_user_interrupt(dw, i);
> >
> > +	i =3D emit_stalling_pipe_control(job, dw, i);
>=20
> Same here; I don't see anything asking us to do this for BCS engines.
>=20
>=20
> Matt
>=20
> > +
> >  	xe_gt_assert(job->q->gt, i <=3D MAX_JOB_SIZE_DW);
> >
> >  	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw)); diff --git
> > a/drivers/gpu/drm/xe/xe_wa_oob.rules
> > b/drivers/gpu/drm/xe/xe_wa_oob.rules
> > index 752842d734be..0b9d29f8897c 100644
> > --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> > +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> > @@ -20,3 +20,4 @@
> >  16017236439	PLATFORM(PVC)
> >  22010954014	PLATFORM(DG2)
> >  14019821291	MEDIA_VERSION_RANGE(1300, 2000)
> > +16020292621	GRAPHICS_VERSION(2000)
> > --
> > 2.25.1
> >
>=20
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation

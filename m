Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5986ACE79AC
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 09:33:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20B7410E468;
	Wed, 20 Sep 2023 09:33:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E440510E2AE
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 09:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695202388; x=1726738388;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sseNR3qZznANHJe/a/b2BqquA+U/V+BrE6hwaVI0Aqw=;
 b=I5pAhh0Lw0NMERVu1pxdvaZHisg1oTWyjZ00C1kza+aeD6TgoUlKQgXp
 lYypUqw/ljrdK6thW0iI6ld51Fe7JCBacjtFN5epq2S7CIbLe7fyFk/iY
 cxgtgVe4ocnarORLXpiyYVH32xN20gtYf2o8gnYFmi0kG8qMgjfonTsqS
 6Y6c9JWpSn2dg+Jhe4CHKwywqeVBhhupKKR5nVY2nzL/mXI/NhPtX7Q7F
 c5qw4A0PgpBTSF8ey2XdRcmz0gzDQgfoPVZRDHC+487fEhio6+bppt9Zz
 ttbnHG9eGv1cB1bawS04PzDfw3DgY/R8Nar6RaKFTALu/pEnv9uysIall g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="411116902"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; d="scan'208";a="411116902"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 02:33:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="746576825"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; d="scan'208";a="746576825"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2023 02:33:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 02:33:03 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 20 Sep 2023 02:33:03 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 20 Sep 2023 02:33:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c5sd4zxldPCH/Eq4UIvWbGu3QpFCgx2d8exchyoEwtdkIGmd3xNM+Z6suV7qw3lMBkU0o8deBBFWiXbgT5sA1uz3aee3L89ZibyQorgaDCn2eeuihUhgR/XAExX6oihXkkjVdLDOaw6zG1aegdWUYYjZFirmesx39E9YPG0MVlN88MUKTQesUb+B1ciflXszdGW/CtRPcuFLSEIHk1RmH29a3fbd7KMfuyZNbal2XFYTR07ay8bfZFOw1qkl2L3o6r7q5esPNtqCMy/PV6RCEJty9cdc+cESXVWtZjB63aglwNpC6iOurcUIsFzjlZDKzqXY204hPJnKxIHeENfMig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+uJB/ZIR4ZBfZhX402n0iWNFNYLq39WXBbiz88V4YCc=;
 b=CdHyr9iBH7HxCX5MU3xA39ngRGpzgPXmAiA7APidwC2C2dOPL1hl+XzhKirgwg8gg2MGEiR/Mpu/U6mFZ15Izvs5o1yF1PXaN6NGiLrtPV44gj5IJIPkD81S4Id284uRD+V7KR5ibMvTwb4FFyPFrnQ0OT+WcFhGphVRtCxwnPijR8Z/hx46mAbfdXkl6K9U35zSuBt9+slA2ggjb9viMiWL61xRpeyj2i4XDHWCNdsXcjnzW5938lzZRuyh0ZcsmyjGUnGm+TLV+2fUe8jNozzl/NYv92OHKF/mrXcosfBycaUUKoAnh/W8/QtPy+nZ/N2uGScBZLLaG1dbnkBgTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 DM6PR11MB4610.namprd11.prod.outlook.com (2603:10b6:5:2ab::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.20; Wed, 20 Sep 2023 09:33:01 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::42bc:8d57:e26f:ecd4]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::42bc:8d57:e26f:ecd4%3]) with mapi id 15.20.6813.017; Wed, 20 Sep 2023
 09:33:01 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH 2/3] drm/xe: Add wrapper function for VGA decode setup
Thread-Index: AQHZ6lXdhnR6bAnnAkuRArVea0TjA7Ah8+MAgAGA5iA=
Date: Wed, 20 Sep 2023 09:33:00 +0000
Message-ID: <DM4PR11MB63600D5DCF025595B46C98B9F4F9A@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20230918173711.625930-1-uma.shankar@intel.com>
 <20230918173711.625930-3-uma.shankar@intel.com> <87h6nqtpzb.fsf@intel.com>
In-Reply-To: <87h6nqtpzb.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|DM6PR11MB4610:EE_
x-ms-office365-filtering-correlation-id: a4222b22-24b4-48bf-be7a-08dbb9bc9516
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iKtZJuiZmQRTr8TjLEcHQvcBONFNchQ9oN2HiUpvWLs1hC5MipgTZ1sLu7ZdmzlEMJ41O8qE12X16GlP3N1VJbRGtz8pP8X1dMO5oaMDvVMUxQWDi94FAD+zBEilj2MuXuxFFnOSmyHQ4JwBdz2kiDkGCcnhertsFYubkDKkn+pemm2z9aOHJ6DsnmAaAViG7VccWG6e7c05ITEfAkVlO98qY+/oxCj4jlwomWWTEy76EezekImoaNcP61pD31LF73f7y2ZBYhxl/28Mp0luI0RXFs81yiiaGXiTWL+Y15K1XkDm5oGbEB8GWBhtI4vV1Qzp2MUFQ4amu80wmjgs7l2oIsZ/rKWJp9rUq1pFq52ALN6sQtj/Vl/uOWh0/72Zj9KPkuvbfEc93pqpwLtr2I3YDxhc+x02sSvZXASDuaEYNjZlYQCdepnGYkILUCtDolOSZ4Kx6UnqaoRNVYK95nyFokOPVdugxU65GL42S3dV9jK96gXJRLPc+wAb3skBIs6iREWDtHvE3AGCjgzXGfUtDF/eJyHqdENVhYevtlmbiy7RknvP1Cgb1YqM95LvN81V3ZcWP3TmwaGW3tqgakyFya1jJs+OqNaksbinPXeHOkOOZ1JzNAzuR+3ZljoL
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(376002)(39860400002)(346002)(136003)(451199024)(1800799009)(186009)(38100700002)(6506007)(7696005)(53546011)(38070700005)(33656002)(122000001)(55016003)(82960400001)(86362001)(107886003)(2906002)(26005)(71200400001)(9686003)(478600001)(83380400001)(8676002)(4326008)(5660300002)(52536014)(110136005)(41300700001)(8936002)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OL9FaQAeEYtpWauS6dTxHVASuEhi1NqmX9Nulz4DJ6zSUT30pCaYrabZxCxO?=
 =?us-ascii?Q?K/nlcQdAuBcOuWj7zSIsC2dglppUiKeWEHC6VeF72copOHHRPKGtCfE2g08r?=
 =?us-ascii?Q?ftdoc1Dmn4bPk1gcZZ/ZptlTl5hHEpiWF2ifV/0fP9VVHVKyoPVpfsebubVd?=
 =?us-ascii?Q?CrAKUVP2zevdc7lqM/De/dMgSopD7XDVbAuEALp2yB7Y+X8Tsub0gae2pxTt?=
 =?us-ascii?Q?mo/7LaWScN5pQcHiGr0TtI60TYpNI59T8EapwdFBQ5KQsBLJy7jpkk7vyWX2?=
 =?us-ascii?Q?XjI5BWsnKA1WYbwkV990tcEm47x2ZfBRavX39YnbSWVjZqqaAfuCg878sY0p?=
 =?us-ascii?Q?IcIPyxFHhoeC8z2sgKgl/U+7UZpJSUIfo9KwcsrukHjYY75+q4C8bUyOXVMI?=
 =?us-ascii?Q?hj/dIFoGODud/JBCZn4urYzXc49nbcUh+0rKgGaeQPvWnhN/j+96AyTApCvH?=
 =?us-ascii?Q?TEEManwpZvH6NhXl3H2yiD9esNbjQnZXfvejTnMMKlaXTzJs0Jc3p0h1Ldom?=
 =?us-ascii?Q?LIkWk5v8VpC09lucR8XEG/29FmKmyzSIRtVqtKvx72gWta9fDXqwAopcORHo?=
 =?us-ascii?Q?9o/0XscVoDCZtb4F2obbclVKgJ0V29vFLYk3vrk2ECTZ6YOEzMJr3S5ziMv0?=
 =?us-ascii?Q?ioae+zmDO59DB2StkICoUFSzgT1I+lEWOBc2C6MimhPUACYSc2drKGUbjKvf?=
 =?us-ascii?Q?tXwqYJkId+NYwnTkX7Bh1WbOAdP3F1QMWW2jnVlUnY4a4U5dQCFw6q6cMRWv?=
 =?us-ascii?Q?WMU+6YJXkJuwQyernH2tPCZ4Qb1gpVKbHpLthIzWdaY53PG33cgZsAdDmOkk?=
 =?us-ascii?Q?cC5gfvfzjavgVoXhLkhpNeydq0TX3in2ufE9Djd9rn2nZFVeOC4FmX6emA8G?=
 =?us-ascii?Q?JVr27D5T3lmQV7yWYP4lKPmCEr+l2dB3tXHlQorwmDXKL04JVdXtbBbctTrA?=
 =?us-ascii?Q?EDFJPPH6qrj+iJQlGhbhO69p9q60qhoDvkc1Qjb+vlcwPC2ZNfPLpuxKY7x+?=
 =?us-ascii?Q?GrnodvQ3y3RZfw4ecDuetGzju3qlss0R586P3Dae8s7di7PkFbSblFNlCY8W?=
 =?us-ascii?Q?+T/8A5BDyw58lxMpigp3M25ILWdl3K6gizwb2+qSKFgeV85DSKB1Pug+CSOq?=
 =?us-ascii?Q?WDsBh2b415FQTo7/9oAbDYq0ak9ymwmczxF8k7bf7MjxhGoihCuEaB2OFD8g?=
 =?us-ascii?Q?Ff8rATIWYUL5IrYHoWuB+dm0O3lsgkgqv0FmSOPHcUCOeP+aMc1gZYpn5u2h?=
 =?us-ascii?Q?D4wSNJiV9M530YVxJBV/6HN8VFl3e4o5GSTrbogpQoMCdb3QCdRhX0qzr1/4?=
 =?us-ascii?Q?5UiV735RCvyqCr6vbVylLPb6Abp/XH8h0LtRdzA4xCaTxVOzSEPPszs5Oa+Q?=
 =?us-ascii?Q?tg6Cbz9TY3MF0gzRKPVNc7WAMisilD3UyEnYKb1mh6Uwf9tzzd9DbSLYRwbl?=
 =?us-ascii?Q?am+pNRDFZiPm6hOaI5X5ImRlJnUUPjtWqZX47r2efXuJ+Jv+uuYOJ0jUOVyE?=
 =?us-ascii?Q?k3BJcr5oC3oVGB00nLwt13n8k8F7cyShZlpEqxWBH+JiD+VpRp2YkQQKfmn+?=
 =?us-ascii?Q?5BsZkPhcdOyeD4q2GvkOhdZx1rqEnNiPx8TNW3gX?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4222b22-24b4-48bf-be7a-08dbb9bc9516
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2023 09:33:00.8744 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AA46YJNSfNn9NLgE82l3HtfBHiP+cGK7OEvyXyTKB1qmJ2V2gSr+/6H7YEUuOeF/TCsZhEKiu0uUFx1FOqKHsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4610
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe: Add wrapper function for VGA
 decode setup
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
> From: Nikula, Jani <jani.nikula@intel.com>
> Sent: Tuesday, September 19, 2023 4:00 PM
> To: Shankar, Uma <uma.shankar@intel.com>; intel-xe@lists.freedesktop.org
> Cc: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>; Shankar, Um=
a
> <uma.shankar@intel.com>
> Subject: Re: [PATCH 2/3] drm/xe: Add wrapper function for VGA decode setu=
p
>=20
> On Mon, 18 Sep 2023, Uma Shankar <uma.shankar@intel.com> wrote:
> > Some of the VGA functionality is not needed by the Intel Xe driver.
> > Adding a wrapper function for VGA decode setup.
> >
> > Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> > ---
> >  drivers/gpu/drm/xe/display/ext/i915_utils.c | 5 +++++
> >  drivers/gpu/drm/xe/xe_display.h             | 1 +
> >  2 files changed, 6 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/display/ext/i915_utils.c
> > b/drivers/gpu/drm/xe/display/ext/i915_utils.c
> > index 981edc2788bc..aa3e9ad718c3 100644
> > --- a/drivers/gpu/drm/xe/display/ext/i915_utils.c
> > +++ b/drivers/gpu/drm/xe/display/ext/i915_utils.c
> > @@ -20,3 +20,8 @@ int __i915_inject_probe_error(struct
> > drm_i915_private *i915, int err,  {
> >  	return 0;
> >  }
> > +
> > +unsigned int intel_gmch_vga_set_decode(struct pci_dev *pdev, bool
> > +enable_decode) {
> > +	return -EIO;
> > +}
>=20
> We don't really want to add anything new to i915_utils.c. It's just tempo=
rary cruft
> that had to be taken from i915 to make the rest compile.

Hi Jani,
Thanks for the feedback.

I was looking at any good place to stack it together. There are some misc s=
tuff like this
which we may need for some other stuff as well.
Should I add a xe_disp_misc file for this or any other suggestion on file w=
hich we can use.

Regards,
Uma Shankar

> > diff --git a/drivers/gpu/drm/xe/xe_display.h
> > b/drivers/gpu/drm/xe/xe_display.h index 03b7ea9268d4..d7a200e6ec30
> > 100644
> > --- a/drivers/gpu/drm/xe/xe_display.h
> > +++ b/drivers/gpu/drm/xe/xe_display.h
> > @@ -38,6 +38,7 @@ void xe_display_pm_suspend(struct xe_device *xe);
> > void xe_display_pm_suspend_late(struct xe_device *xe);  void
> > xe_display_pm_resume_early(struct xe_device *xe);  void
> > xe_display_pm_resume(struct xe_device *xe);
> > +unsigned int intel_gmch_vga_set_decode(struct pci_dev *pdev, bool
> > +enable_decode);
>=20
> We also don't want to add random declarations in xe_display.h either...

Yeah, looking deeper seems we don't need it as compat-header is already inc=
luding the same.
Will drop this declaration.

Regards,
Uma Shankar

> BR,
> Jani.
>=20
> >
> >  #else
>=20
> --
> Jani Nikula, Intel

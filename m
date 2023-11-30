Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A4CC4167B
	for <intel-xe@archiver.kernel.org>; Thu, 30 Nov 2023 10:20:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D7A310E6DF;
	Thu, 30 Nov 2023 10:20:06 +0000 (UTC)
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Thu, 30 Nov 2023 10:20:03 UTC
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C93F110E6DF
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Nov 2023 10:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701339604; x=1732875604;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VvKLvpfMJq4E7cniBoiP/5CCrZ/E4P2Bcv5bWCOERfI=;
 b=cC0lRkKKtmY4vXoEE/pVLFn13h7Be+FSUqSVo9SJFJJVMEWjbyoarlf1
 OhHVResbAYq2IyMYlJsfypXT7e6rlNgtq9lpDAHNdClp+4web6Mv2+zgS
 Ghd06v/CbGcjGu0IM6R7s4/3byV+sdfsxqvakSFxEB2K6F4ewuAqdkKm0
 vwJ+DqSJt98oJ+4aaStKxtI1GREjVWTWzcFqYm/7lKo23/4kSuC52S3Ko
 mMM+E99OgRnPrNt7i6mRwYd6oFlwjjqMSFwmNfT6pCqZXQvsvqS30wTPt
 29xNk46USWzSyU7BhvQwiIw/sDhbeCOoa8Vr/EyfL0TJzxDGv0HAGXpp/ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="288158"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="288158"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 02:12:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="942666900"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="942666900"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Nov 2023 02:12:57 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 30 Nov 2023 02:12:56 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 30 Nov 2023 02:12:56 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 30 Nov 2023 02:12:56 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 30 Nov 2023 02:12:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bc2VkhyF2cAs2TEfykaQnQFv8bdxVXVspJn8/emgMk7R2mb8hEJ+zA0WVsi9pVYKA7P6aDmqG8XkPhURzvFzNiPPWWREAFJLWZsaLApgW4OSiZPVkVkxRaekuu2TbKwBFpE6qQO1Vm9AEcMpzmQ8T3lxEvzqnCL+TcyiiIqCRktSgeJRfs8YMQtXlIIBSniONM0+l/XRtt06p+KMTa7CHH7C5SxFeL33g4KZ+h7PJYxk0OtckGHM2dIuSNah21Ucq9+aQBstmtCoUSO3OHt0RWU/kHxwOxBJls7QCRH+yrgmauTjuiLK2UuSXP5eVAKQ2Hbt/LnpoiGERSMQH0Hmbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rLPYoaNGg3QsELfmBvV7DZcjY/1uLvWb13go4moLZfo=;
 b=d1KHqUDPB/hbkxriDnH9kuBJXdaB4sCAl08FiwoVYdwkqnSYwVUf16TJW+ZVVtEwfWqYPhShRIp6X7jc9Er3bKdMmjPRN49hS4EqzfOMojornihF8osqkC1VjC69bxqFSbWeuEgZPmC1Ww03wy26fo9D2mY3ff7NotgRkdtxvmcSasokZgioA3y4Vt4a/fYkK1PdhnCogaMwWakgtSpBXj7/GAadadNUVlli57u1UYJNs/NlEgJT8itH/MgimBb+Moll5hL9+WlnU73wofLmdFabI8621QiOhcV5mHXNVLVCVDXDmkZk9lnMXFFEYQ3WXrXEkQ3N2iimv0h8U3yw4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SA1PR11MB5873.namprd11.prod.outlook.com (2603:10b6:806:228::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.23; Thu, 30 Nov
 2023 10:12:53 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::399c:3488:d511:adef]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::399c:3488:d511:adef%7]) with mapi id 15.20.7046.023; Thu, 30 Nov 2023
 10:12:53 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
Thread-Topic: [Intel-xe] [PATCH V2] drm/xe/xe2: Add workaround 16020292621
Thread-Index: AQHaIe6zRcDVVPHpgUy19EMFN6rlarCSB7wAgACfIZA=
Date: Thu, 30 Nov 2023 10:12:53 +0000
Message-ID: <SJ1PR11MB62048292ECAEA8B6616B114F8182A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20231128114232.4057798-1-tejas.upadhyay@intel.com>
 <20231130004022.GW1327160@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20231130004022.GW1327160@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SA1PR11MB5873:EE_
x-ms-office365-filtering-correlation-id: 7e26c94b-7fa6-4298-245a-08dbf18ceaae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: msvqCx1UnjaebJ7C51KFQibyNFDfJko2NbDKukvz/M5+zySHghZRAUUnQTGpwgU0Eh1d5jRe9xm7cdJf6xJJ0cgEXIUWh+LjvOKkuBy3YJFKbuLqTOkqa6p6rc0GsOc7wiGlbbfK69WXO3L/80CEkeLeFLf4A9gweO9EEwlI0BI38WFhCyK3OsMvBVnrOqcN7dzInucLIvQ8XUECcqzzLRXvBFv1cZ1KVirTDIKe3gnbH6zjxVyobX4CxuhGeapGQNfZvGY+ZtZNt5jD59YQ+d+aEtr/fFHjiI+qhLCj5V4CN60HLjiaZhXW4l8lBmAm/AK1nPe0MMXp7Z2CIhfnBy8rsoKqv64kI9qLyqOTFk/YpC0eTsn+MWAl/49V/4p+M/y1lNB9huSs7ELjnz+F7eSSh865pER5yQaMw8MjMOX5/kjxnGnrWkdqr0HVgW6LOTSUMwvgWKnDWNwSVaRjbwlzKpiwIoJNLRZOMniYmSa1elhY1Rqk5hQYZ4g7FZt/yfvmxr/lBuJcBVfVH6aRLxbp67pXzdStWD8abwaDuLSbOw+uLZIlLURMGue676LbPIRmoYaFVEydN0lWm0+PwHhOCr2tDDdypPwOuCu9eOATlzYveRCXAtvt8IzLCSkuC8XUtXQTyeNJIK7H01TSaVAZLIkFCSoKplN49J4s7Zg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(396003)(136003)(346002)(39860400002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(6636002)(83380400001)(38070700009)(66476007)(66446008)(64756008)(66946007)(66556008)(316002)(2906002)(8676002)(52536014)(4326008)(8936002)(6862004)(86362001)(5660300002)(9686003)(41300700001)(7696005)(6506007)(71200400001)(53546011)(33656002)(478600001)(202311291699003)(76116006)(82960400001)(122000001)(55016003)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CqhYjjywacPoq591wbwIvwER4R0DqWCdkPUT7SfUfbqwVkZrLCVdP0eI4DJ9?=
 =?us-ascii?Q?paUwsF0NgN4qajYXyzF4+CSE4B8OmMwI1qCHnZkMvZNWUsv26ozxaJOvw/Z3?=
 =?us-ascii?Q?dDQvo14WgrWmZMFOpwrynXEPEjEZIXOwmkQ6UJnfppyJATGfVCCEyS461Bc/?=
 =?us-ascii?Q?S5HCYfQIEhmJEU3023MMQ/29ptKMrUrywus9ERH67bP8P5hTrveZ8KpBDA59?=
 =?us-ascii?Q?3cYHJXPixhKLUXULWEURcqsUNswYFcZtPny4AcrOO3JEWOFBb3r8/1bNSIFu?=
 =?us-ascii?Q?hLwF54SUOJb57W36N2LFEppdAVHPqRyU8z9gkLhOIVHFlheJ5BWhok+QrAMQ?=
 =?us-ascii?Q?umw8ReMaGWiEcQ9KrEvuCHjhjRCDN1bNoEIjLW4mufS9/ZbJD0o3SM5A4qU+?=
 =?us-ascii?Q?rw2BO9vsIv1KrIcPH+1qGSPz0Tpb9GWje9jhgdwKfMo5uF0VjkfowZCtmSAf?=
 =?us-ascii?Q?ZHRq8hbT7UCrZhUAzZEFi5A6v4YosfljWLArAqC54/lWtrTTY3Y++4Ceqqig?=
 =?us-ascii?Q?PwZ5l0pgVhEbLxPBP4975Hfzgk5P5th/71k2ZTA06OCMgG9SlzXTrU8XAArH?=
 =?us-ascii?Q?NLdtVrP2OhxpIBaSlKQSjn/JSatqMwBh+IPMAifw/FU6aVQs0hIKkdJ3wAfX?=
 =?us-ascii?Q?vwSSHHWB/qoRCNXMcKjnTXHvLs6PEjfhHj92FRGiWbzhDBEwjctxNKIT1jxj?=
 =?us-ascii?Q?A7U6RUr2Wm1Q7zbx+Y8KJrmG9r/GGO2BfdLNFvZqth49SNVVga3tqBa4x2Ta?=
 =?us-ascii?Q?r7EhwkELgEO4W71EHoS/e2b3Tk+IVgrbnzkMdXgFY4/m35tA4YYC7PFAhqSq?=
 =?us-ascii?Q?9c8ijZLVX+41erugkk86GYVuRl6lZiw5uWYwmC0F6C59reKyp46uPkhcjMOl?=
 =?us-ascii?Q?yROLsh/Q4zRXt5qbzXGaRPYO+1mzzVrPA2ZOknDp0pK3REPUIKNrobh9c3EK?=
 =?us-ascii?Q?e0YWA7336poESrgv9UEC+d63gq98rYeR329Bq1y/ekBmtG/Fns+ytyJBLAdl?=
 =?us-ascii?Q?L1+hKTt6dxt5lZW4StTFZV/T9LQJlK8Dnp2nI3qvkJ1oV/NDx8Ym9eW+BTiS?=
 =?us-ascii?Q?Rus7QrRpsfz9/dDo5b9l128TLNJhoP7M+tC9kEU3zZIE6g1X0fazwjKeC5DU?=
 =?us-ascii?Q?E+z7xzMgS1ufUmManDgTH4WmpoxK13pykgOTwrxwwXzZy7OsGGkQHMnjoFCL?=
 =?us-ascii?Q?z9XB3UjlqdcMFltZxmr/vmmQqMPSRuHwN1VQoMBQWQ2naMMc8i1S5oJtz70p?=
 =?us-ascii?Q?eT8bZjSXfUxubdhPYYP5k5I60IV9QDXAqWWgtz/YK05C7NiN0HM+XU5mWIGB?=
 =?us-ascii?Q?/qbfCXiyO0yg9lbz7DrPnTMcRUgo0AYnLda49TIa9kbuTQjCZiofYiFjXqIX?=
 =?us-ascii?Q?7vuZCgAqN5DHuNwi970VV9MOhYGeX1tswn4/zfh8gP3ChRH4y1o/S198YUeA?=
 =?us-ascii?Q?KSPkMpVodLiIg+VK+nLu8U9YP7EP4N1I6cJq8AsAGxoOWMFojSukB3qkL+0y?=
 =?us-ascii?Q?ZOsMPHLONBdsEkskG1Drl+Dyibrotl+Y43bM92aCrd7meNnQ955/REkpG/cf?=
 =?us-ascii?Q?FB7Wyytz47nXiKqdm7FJd6NB6auOGfBmlBuSt2bQyZDzo9e8YPI42cM9hqgt?=
 =?us-ascii?Q?7fkRqnY/3nBUOAMfdwrUlnoB3J2F73ipe04W2LjlmMUr?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e26c94b-7fa6-4298-245a-08dbf18ceaae
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2023 10:12:53.7940 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2ExqKodwOc0mrr0r63MSEAhZyZZxLPAtUW4nt54iyTOTd3qDO2JguUXU8I/D2Z8w7lOQR4hVnp4Tg+fmi+B4C+GpNqnNpLDU9VDfF0H6zLg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5873
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V2] drm/xe/xe2: Add workaround 16020292621
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
> Sent: Thursday, November 30, 2023 6:10 AM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [Intel-xe] [PATCH V2] drm/xe/xe2: Add workaround 16020292621
>=20
> On Tue, Nov 28, 2023 at 05:12:32PM +0530, Tejas Upadhyay wrote:
> > Workaround applies to Graphics 20.04 as part of ring submission
> >
> > V2:
> >   - Marking this WA for 20.04 instead of 20.00
> >
> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > ---
> >  drivers/gpu/drm/xe/regs/xe_gpu_commands.h |  1 +
> >  drivers/gpu/drm/xe/regs/xe_gt_regs.h      |  1 +
> >  drivers/gpu/drm/xe/xe_ring_ops.c          | 18 ++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_wa_oob.rules        |  2 ++
> >  4 files changed, 22 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> > b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> > index 4402f72481dc..f1c5bf203b3d 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> > @@ -48,6 +48,7 @@
> >  #define   PIPE_CONTROL_TILE_CACHE_FLUSH
> 	(1<<28)
> >  #define   PIPE_CONTROL_AMFS_FLUSH			(1<<25)
> >  #define   PIPE_CONTROL_GLOBAL_GTT_IVB			(1<<24)
> > +#define   PIPE_CONTROL_LRI_POST_SYNC			BIT(23)
> >  #define   PIPE_CONTROL_STORE_DATA_INDEX
> 	(1<<21)
> >  #define   PIPE_CONTROL_CS_STALL				(1<<20)
> >  #define   PIPE_CONTROL_GLOBAL_SNAPSHOT_RESET		(1<<19)
> > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > index 18b13224480d..efc05762556e 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > @@ -60,6 +60,7 @@
> >  #define   MTL_MCR_GROUPID			REG_GENMASK(11, 8)
> >  #define   MTL_MCR_INSTANCEID			REG_GENMASK(3, 0)
> >
> > +#define RCS_NOPID				XE_REG(0x2094)
>=20
> We already have RING_NOPID() as a parameterized macro; no need to add a
> one-off definition for the RCS-specific instance.

Ok=20

>=20
> >  #define FF_SLICE_CS_CHICKEN1			XE_REG(0x20e0,
> XE_REG_OPTION_MASKED)
> >  #define   FFSC_PERCTX_PREEMPT_CTRL		REG_BIT(14)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c
> > b/drivers/gpu/drm/xe/xe_ring_ops.c
> > index 59e0aa2d6a4c..ed161e4ac4b2 100644
> > --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> > +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> > @@ -184,6 +184,22 @@ static int emit_render_cache_flush(struct
> xe_sched_job *job, u32 *dw, int i)
> >  	return i;
> >  }
> >
> > +static int emit_pipe_control(struct xe_sched_job *job, u32 *dw, int
> > +i)
>=20
> It might be worth putting something about "end of ring" in the function n=
ame
> here to make it more obvious what kind of pipe control is being emitted h=
ere.

Ok=20

>=20
> > +{
> > +	struct xe_gt *gt =3D job->q->gt;
>=20
> Wouldn't it make more sense to pass GT or hwe as a parameter rather than
> job?
>=20
> This function is going to get called on both RCS and CCS engines, but we =
only
> need this workaround on RCS engines according to the workaround details.
> We probably want to bail out here if we're on a CCS engine.

Please see below=20

>=20
>=20
> Matt
>=20
> > +
> > +	if (XE_WA(gt, 16020292621)) {
> > +		dw[i++] =3D GFX_OP_PIPE_CONTROL(6);
> > +		dw[i++] =3D PIPE_CONTROL_LRI_POST_SYNC;
> > +		dw[i++] =3D RCS_NOPID.addr;
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
> > @@ -342,6 +358,8 @@ static void
> __emit_job_gen12_render_compute(struct
> > xe_sched_job *job,
> >
> >  	i =3D emit_user_interrupt(dw, i);
> >
> > +	i =3D emit_pipe_control(job, dw, i);
> > +
> >  	xe_gt_assert(gt, i <=3D MAX_JOB_SIZE_DW);
> >
> >  	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw)); diff --git
> > a/drivers/gpu/drm/xe/xe_wa_oob.rules
> > b/drivers/gpu/drm/xe/xe_wa_oob.rules
> > index 752842d734be..defae8259778 100644
> > --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> > +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> > @@ -20,3 +20,5 @@
> >  16017236439	PLATFORM(PVC)
> >  22010954014	PLATFORM(DG2)
> >  14019821291	MEDIA_VERSION_RANGE(1300, 2000)
> > +16020292621	GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)
> > +		ENGINE_CLASS(RENDER)

I have understanding that this provides filter of engine to XE_WA() call so=
 it should be processed for RENDER only.

Tejas
> > --
> > 2.25.1
> >
>=20
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation

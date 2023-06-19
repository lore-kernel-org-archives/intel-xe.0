Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17460EB64D9
	for <intel-xe@archiver.kernel.org>; Mon, 19 Jun 2023 11:18:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7CAA10E1E8;
	Mon, 19 Jun 2023 11:18:09 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37FB110E1E8
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Jun 2023 11:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687173487; x=1718709487;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pIj8f/cS5ti3FCMU/SASWQtgVvUQ2H1YZT+qrSbI7/4=;
 b=R2+DIEe3Kmdr/srMLR1XJ2SRdPzKkvfEEN5OYCu0D79onlTYe43HIP1T
 g+4cOhxIGyP9V/bWrQgfkfbVFPIo4rxb0WV3uplkAG33oH0UGR6X5h51Z
 CPEf9A86j+EVxIqYeJlZvx7pwspyR4MZc9Xs5lXuFD3xbtnbcdZNjxQG6
 lkHpA4vCfU0+sDuVDPp5qm9EAcZhBNTaexrkwcmh0tft6LajZq+6pQ9co
 MFvv+Ru5m1qdber9M3WHFOBjX2Bu/dSYrhRGVbO8l/AIr0MstdNJ/VIir
 xgAY4j6QEjnPubDKSHJ0pgs85AHNPy5n7j+V12N5A566sWoqP745fjtC3 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="423270493"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; d="scan'208";a="423270493"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2023 04:18:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="887898813"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; d="scan'208";a="887898813"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga005.jf.intel.com with ESMTP; 19 Jun 2023 04:18:05 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 19 Jun 2023 04:18:05 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 19 Jun 2023 04:18:05 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 19 Jun 2023 04:18:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N3I1OZp9N9+V3CA1Zsb3sc6YTQL3RK4JotQzBmYD8tAEbiS+x1OB2Ja3aTL7WIlpvS6HCrXb7AZvJrln2M7zDmC/M5AVVLz3mC0CZIlPTgIx7khAgUIXynG5Qeyh2AuXc6WB7/0lShJJRLwqCwymWIqHJ9MeKvWU8x7eOPOu3os/Vy3HyVv9nR5MXhofug8xtDLTvnszHqY1DT7aphlZGHjhJvhg8Z+qcRSnsUC5OkbHhurDZHFqVgcuO+BjmM7sr0U3DhMmR2pgWDBkJz363s8uz1+C/pF6Jil9+K46H81lSOjABzt6s9UeAbM8ZrCXaCPcNHOgCFjrlY/T3mciXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xKhy77NyROoRzyUC/mslYiiG/5mkURIZx9k4qcGRLHo=;
 b=A5xqixQ1hAtJrAZBYtgv64Y0ILnAQllgyTLXvALn8LNrJDCeOkckiZlXURlBxaAaXnY9L3yVVX2GuBz7EGqMURGviU4kByRqQJyaa5WZtdkc5ZCmj1+kfk81/ml8a0RlDlYqgIVVADQpwky5PuMjVVAh3A1ob38WiXJQHHmmK6sT4MizvOeBYPx343LWyufoxaRgmDztqc8fxKq7XL0DiSDySo2PdjsfiLXq7J5yGYeLcbnTJeS/jMt8TGbc0uP2SoAIeBQYXEduj8LA3dc7LC/UAQ3y01TtwAILtD2qiuqrkjbaB9t8oGETTud0hOwnkaqfvDtudQhJkdJaWNTsaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by MW5PR11MB5857.namprd11.prod.outlook.com (2603:10b6:303:19d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Mon, 19 Jun
 2023 11:18:03 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::3cc2:6622:cce5:cd02]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::3cc2:6622:cce5:cd02%5]) with mapi id 15.20.6500.036; Mon, 19 Jun 2023
 11:18:03 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
Thread-Topic: [PATCH 1/2] drm/xe/pm: Wrap pm_runtime_suspended with power.lock
Thread-Index: AQHZoFy0Qnp8qKjQuUiImpAmEKBuvq+N2vYAgAP+muA=
Date: Mon, 19 Jun 2023 11:18:03 +0000
Message-ID: <CY5PR11MB62115C1381F4AE8C6F0EB8BC955FA@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20230616141115.1128000-1-anshuman.gupta@intel.com>
 <20230616141115.1128000-2-anshuman.gupta@intel.com>
 <ZIzAcvfQnGQvDMb7@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZIzAcvfQnGQvDMb7@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|MW5PR11MB5857:EE_
x-ms-office365-filtering-correlation-id: baf48c24-f2e7-4c2e-58e3-08db70b6d90b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: m7kThm+j3mR3OBHh9n7kQ2gJHaqjuoUDejzy3f+6dPB4wQi8LRAUlRWUX0ei/B22C1mu1zk1p1U95AF0jf5A4k5Cf8n6QLM/KAX5qsEkRzsvjltTxsGGoIJGRr1S5CwL5bHJu+qZ7n01kdCOGvhCybcj0L5/xU1l37lLQNAVHDdzn0q755aPyKh6irbQ7ZXzJduaI31dbdgFBeFCSmKpGEsirKYFxSrpFXziL76XvHrW9GUHlCecBPPNK/Gq904cTqjwM4DApx7tTz/TaBB4YiHzyfqthK5xTRSWnqSmRAlZiWsn2krsaUAK3YX4lqWcmMzYca8RMCVRCNkKSwyixySLx3hm4yBZ9lHnE8p7GXvujZ6IfcM7nUtbPdJaOMScrl+bedt3iCvkVy1HNQlyj9fXDyOP0BI53WvDkKjATcd+p+X83Bam0U1CSBjaTSle4x+S3C3LVOEMPrGwNxkB19iYuaiJXO82wcrq/62+vWyxSDSp1unfZFfxbk2DuBaVKQOdvJJ+kvunvjzdcjiWCzKXrZfQ2s67EY9X34sgv0TGtZNPuqlW0QfG2Pa+Muq0Hk/ian3sZtl4X8Ir7+zBwIUAesOOGhgBn1wkwnv0QxJtUE3o8xmEtzt03ZtleMBHWaEH5SBXJ8zpfegJwbHC0A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(366004)(39860400002)(396003)(136003)(451199021)(186003)(478600001)(966005)(7696005)(71200400001)(9686003)(86362001)(53546011)(26005)(6506007)(54906003)(107886003)(38100700002)(316002)(82960400001)(83380400001)(76116006)(66946007)(66556008)(66446008)(64756008)(122000001)(6636002)(66476007)(4326008)(6862004)(8676002)(8936002)(5660300002)(52536014)(2906002)(41300700001)(55016003)(33656002)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3YX5OY0aBHJi1UgIvK9B25M2OpeFhaY3S/tQosSNSqweicxBzObQMruK7oOx?=
 =?us-ascii?Q?sQu9P+goihthV4mB9fvBW2OmR5Tlut9+iXjinRyUY/2HymaryQaO4Ec604S7?=
 =?us-ascii?Q?0WU/YrFfGmqkaPeonvIIm3jBJ2K4VxSLB9FfY6ohX5Qzd80lTIspK3tjnr65?=
 =?us-ascii?Q?/ZHULiOuuu09d0K1RTu9p1m45A3WpkNjSbeXH/tCQvMHUlSNci9lsMW/lSGr?=
 =?us-ascii?Q?hGIZ2LwXVqYDJ30ttlqOwH9OHyywm2W8y3zdpZrQv4rLYdkBbfwnu1F15uDI?=
 =?us-ascii?Q?/s9vRK4YA9EIcp/lr1nZqY8duwsFzarHi5Uct0blPBXZcveq0eeijQUcx+ti?=
 =?us-ascii?Q?WCMLI1Y+ZP+MOZRfvYpNbTWENoJjWyFK1x4isVtKrAy9ZWh9WMdeBYw4Yui5?=
 =?us-ascii?Q?ZcnYNVSut3R0sVYAZ4pRFZ98/E7Et7No71rjlgpzl4/1Izoge2CKHj652JwV?=
 =?us-ascii?Q?YGW6vysFcRHhfIh3RTxVSeK9hIDJ+HRWQEMIY+6ihb7f5t0BBCSmnala6XqT?=
 =?us-ascii?Q?pG+YkjaN6wW0lyLxrpkn6CoM5dgXa1OZmYTV/DBe1/B7B7ld6weq24udEgEu?=
 =?us-ascii?Q?shROKGtab4dRuqMyAdFhZYtX9kD0r2DB0CX5nbEVSzRZsZSzE8wA8mTAjPsL?=
 =?us-ascii?Q?cdX/AqcfKKyzd/XGzwSGNCAVrQWAhcFdWpFkpSXYpcHkXYCxQaq3cehc5GKr?=
 =?us-ascii?Q?+ybiNmpSVz/eszsC5FSKezmJFwQEWhtJsuEezV6vyRmaN7d02eET7lqYh/Sv?=
 =?us-ascii?Q?vpOX8kD3tm5arPVSMtdEPWgSquyf+/Z/Zw14VEfwbX4Nns10SNyzOb1tqDkM?=
 =?us-ascii?Q?e348RyHZxS6NxFwwcGHqm2NljmtH8TwXIPRNXJSp7QnB7LgQPLcyZ7a/oN7t?=
 =?us-ascii?Q?GnDInsBkbUN2r0qWR1AU0IcIPliVfOUNs635cEqPkPPFSo14cRQTJhl1AS5f?=
 =?us-ascii?Q?BBvgtdrblux5PsQSHQj6pVmbY78oukTFk6D/srq1hMVgYTlLCEH4bbKcNSW4?=
 =?us-ascii?Q?V2sA1jR7nawG/eIl+tAnmG+NMat3aEYzVNr60BhtiQ2CYeomFMMtImyop/5G?=
 =?us-ascii?Q?ms0AaWOBwIBslgJP0sMq2+Xp/Yvj8+nzrqC0t3LX9uTW2r1XIHQwYTxyIzaV?=
 =?us-ascii?Q?Hfw5dO6Wc4Eu8nWoMzXAcQvJE1aIiK0wVXYakQa46KIpNxUYllTNYNcAYTkw?=
 =?us-ascii?Q?KZytUNB8bNqPkfAZOOT+BViTTVUsNjguywDBRm0KHfExjO8EU7pxEKLNyada?=
 =?us-ascii?Q?6SpiwDHWixiObY6lpsFWl5FCeIr1E3AvxQ6ZADCGuf9fXVipmNv2f+x5gm+I?=
 =?us-ascii?Q?YJxywAExBHP/9Qq6KPwvpz/zI8rl//QJv7jShfDX2HNomwz3FKJyrsdbqrP7?=
 =?us-ascii?Q?Gf23tRNwQYOOgbJSaVqr/AoZ0zOWOVz1+Qgmf60irfAogf8k3nCjncm6/ggj?=
 =?us-ascii?Q?UYli5Cp9DA1rDsK8oRw2nhm6kCkFKt7/0HRKijGZD4+lRoriK4GDzLzS1jut?=
 =?us-ascii?Q?H7FnuWZAgjkGhYVdEBFhdyBXncHcp5CWUH5MTjT5Alho7AhpxtDubvP1acnV?=
 =?us-ascii?Q?F/cEtvoT2GXpRyahCcFMCXgt0STgXnejC9p9eE23?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baf48c24-f2e7-4c2e-58e3-08db70b6d90b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2023 11:18:03.0297 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: seOvwYmlgeTv5Ah2awbfhAzM4sbLfIL3cXkLjCoGzAOj2oxgIhUvEuTjAjPUjRzCSHw+DeHhOVtgCeiQMCJ+aVjoQLdPYDkoBloFCDP4/IQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5857
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe/pm: Wrap pm_runtime_suspended
 with power.lock
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
Cc: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Saturday, June 17, 2023 1:35 AM
> To: Gupta, Anshuman <anshuman.gupta@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Nilawar, Badal
> <badal.nilawar@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>; Tauro,
> Riana <riana.tauro@intel.com>; Sundaresan, Sujaritha
> <sujaritha.sundaresan@intel.com>
> Subject: Re: [PATCH 1/2] drm/xe/pm: Wrap pm_runtime_suspended with
> power.lock
>=20
> On Fri, Jun 16, 2023 at 07:41:14PM +0530, Anshuman Gupta wrote:
> > pm_runtime_suspended() doc has requirement to use it with PM lock of
> > @dev to get the trusted value.
> > Wrap pm_runtime_suspended within xe_pm_runtime_suspended() with
> proper
> > locking.
> >
> > Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_pm.c | 16 ++++++++++++++--
> >  1 file changed, 14 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > index b7b57f10ba25..04c5353ba870 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.c
> > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > @@ -210,11 +210,23 @@ int xe_pm_runtime_put(struct xe_device *xe)
> >  	return pm_runtime_put_autosuspend(xe->drm.dev);
> >  }
> >
> > +static bool xe_pm_runtime_suspended(struct xe_device *xe) {
> > +	unsigned long flags;
> > +	bool suspended;
> > +
> > +	spin_lock_irqsave(&xe->drm.dev->power.lock, flags);
> > +	suspended =3D pm_runtime_suspended(xe->drm.dev);
> > +	spin_unlock_irqrestore(&xe->drm.dev->power.lock, flags);
>=20
> A few things.
>=20
> First, you probably can make this spin_lock_irq / spin_unlock_irq as IRQ
> contexts are not really used in Xe it is doubtful this function would eve=
r be
> called from an unknown context.
Thanks  for review , I will fix this.
>=20
> Second, I have questions if this patch is actually doing anything useful.=
 Yes, I
> can see doc which indicates that pm_runtime_suspended can only be
> trusted if the lock is held but looking at the code paths where
> xe_pm_runtime_suspended is called unsure how this lock helps.
>=20
> e.g. How is this better?
This is helpful in case, when pm_runtime_suspended() returns status is RPM_=
SUSPENDING and it will be going to change to RPM_SUPENDED,
rpm_suspend() changes the runtime status from RPM_ACTIVE -> RPM_SUSPENDING =
-> driver->runtime_suspend() callback -> RPM_SUSPENDED
https://elixir.bootlin.com/linux/latest/source/drivers/base/power/runtime.c=
#L558
rpm_suspend() caller has already grabbed the lock and RPM status changed to=
 RPM_SUSPENDING, therefore Xe has to wait to grab the lock to get the trust=
ed value, which is RPM_SUSPENDED.
Without a proper lock, the xe driver may access the vram while the device w=
as runtime suspended, which is a violation of  PCIe specs.> if (trusted val=
ue)
> 	now the trusted value can change, do something
The other way around is if Xe has grabbed the lock first then the possible =
runtime status is either RPM_ACTIVE or RUNTIME_SUPENDED  for both Xe is inc=
reasing usage
ref count explicitly to make sure the device is in an active state.

Thanks ,
Anshuman Gupta.
>
>=20
> Than?
> if (untrusted value)
> 	do something
> Also if you look all over kernel pm_runtime_suspended is called frequentl=
y
> dev->power.lock.
>=20
> Matt
>=20
> > +
> > +	return suspended;
> > +}
> > +
> >  /* Return true if resume operation happened and usage count was
> > increased */  bool xe_pm_runtime_resume_if_suspended(struct
> xe_device
> > *xe)  {
> >  	/* In case we are suspended we need to immediately wake up */
> > -	if (pm_runtime_suspended(xe->drm.dev))
> > +	if (xe_pm_runtime_suspended(xe))
> >  		return !pm_runtime_resume_and_get(xe->drm.dev);
> >
> >  	return false;
> > @@ -222,6 +234,6 @@ bool xe_pm_runtime_resume_if_suspended(struct
> > xe_device *xe)
> >
> >  int xe_pm_runtime_get_if_active(struct xe_device *xe)  {
> > -	WARN_ON(pm_runtime_suspended(xe->drm.dev));
> > +	WARN_ON(xe_pm_runtime_suspended(xe));
> >  	return pm_runtime_get_if_active(xe->drm.dev, true);  }
> > --
> > 2.38.0
> >

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E83CE79AB
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 08:59:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C94310E467;
	Wed, 20 Sep 2023 08:59:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 875B010E468
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 08:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695200388; x=1726736388;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LrcgJVF1vCKTlYrt1zXSzwWaQVX0z4FWqg9nLabaI58=;
 b=fo4sIo0HRm4RJ9Z7Tx+P5jFmkVEEatdFlWaysuuFCr5JaC2gau/HJgTc
 QXUcubpzfD03yO9nFjimMIt3K1AnzNtkxqKJHSceKWrvDUJirE4IU++M9
 WOZfyR2f3P0Dpv2nL960PatR8b5tdDvYk4kXGN3c+4oAs7bQdeFEe+qv+
 IPEe0FmS3WkZP2g20/qaY1ccVaxQahXMBY4oVahae6UUxX5exh0Ocv+11
 1pAwjjVcc0MxGo/uwbfGBYftHKVTVQKfbavA5B1UHMiZ8CihHx6wFDHRZ
 J4tnk5F6vHZVR0e8ZZHWUWv+bBB0vv16RpfDDHLj/fkS0Xdz6yfh2Q6je g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="446639335"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; d="scan'208";a="446639335"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 01:59:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="749815723"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; d="scan'208";a="749815723"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2023 01:59:46 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 01:59:45 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 20 Sep 2023 01:59:45 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 20 Sep 2023 01:59:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TdKUJzz6+Drp8osnsEIGzIsYjBCom4sy+2YPR/ol5qCWxSN6/l+O6wqTPY6MFl1c4SsGsR+q7jYR4QXpJpmaRxy/K1YkfWX8uq9OSD64MJkIsb8dNwbP32gjQSNgOmQcamgnn3cyhiA1UBjExS8n8fqJLA/BSvZHZaUoadmRrm5jTVADTFnfF31qCOn7QvBuA0RrgqkQbqDdlfoIY0XUdoYa45k5Pl6gycqgFFmh/LdUq9Y6WPXP69LUp0olmTQ1K1CtSFa0LorQFX0dccsQCkVoxx9Gsh0snn4rpn0Fs0XDbh6K6wBs9VrVNQSEj6R9y8G3yXmklCuLCOUEY7ZNdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uQMYs7qz+pel8ZOeCWsXXV2beIL5piXpVtnOXmjO9Jk=;
 b=O9xjM7/JBw5dSp7ustv3iG0mGK1trXKWR3s0DxSilIeC7JPuXCHbgUy4NCGx7ILaoanC2BNecif5XHVa+MvalXf8pWRtF7aWggrwvtdKly9raRuDc3geHnPQcgToa6UkG71t3DBQl8cCtzFvM5Jk/pl8k8VpInfGKp7HQz0JVfJ4uwaNbP9kk+6+/cFiDezrDPp0l+QN49MLYTlCs7/wP/svoJY3oQqh67ItH0oO6ZoSkUZV9xXVvKj7AEE7EVAQh0OtUR10xSE1DHF2C+/d2LqDfB7iZ2YjVXW35vjVM/BodkcygO22cG5cclX6c/cpAfvE5+Eviavxor3hIMLZzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by CO1PR11MB5011.namprd11.prod.outlook.com (2603:10b6:303:6d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Wed, 20 Sep
 2023 08:59:44 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::f8a8:855c:2d19:9ac1]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::f8a8:855c:2d19:9ac1%6]) with mapi id 15.20.6792.026; Wed, 20 Sep 2023
 08:59:44 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Thread-Topic: [Intel-xe] [PATCH v2 3/4] drm/xe/gsc: add gsc device support
Thread-Index: AQHZ5uJbRP0g67a/70au1c8G9s9n77Agy6SAgAFwF1CAATeVsA==
Date: Wed, 20 Sep 2023 08:59:44 +0000
Message-ID: <CY5PR11MB6366C4C1A604269109E1073DEDF9A@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20230914080138.4178295-1-alexander.usyskin@intel.com>
 <20230914080138.4178295-4-alexander.usyskin@intel.com>
 <ZQh5628W52y5JkZt@intel.com>
 <CY5PR11MB6366B55F5A0EB8EABBE999BCEDFAA@CY5PR11MB6366.namprd11.prod.outlook.com>
In-Reply-To: <CY5PR11MB6366B55F5A0EB8EABBE999BCEDFAA@CY5PR11MB6366.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|CO1PR11MB5011:EE_
x-ms-office365-filtering-correlation-id: 8aa447d2-aa58-49a8-0fbb-08dbb9b7eee6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c18w7PZFPSvykdm1ZfyPhvTM+nPCLmRyrDGQlU7kNKPQDPG7HGuiT6Y8k2WoXoo2pXhf+apKQf6KaJtKhwMV1hklGInDr/orXLHpJkMIV7Bmqqtlv8CiYnPAeYe2qtIq6Pc1m01ad8+mVNEOZvrN1h7GBjlBdW8xl6dnJTCSMMP6pfPfNKu/JMZ0Gx7zBzvodF5PYDoqPPczTLx8RZggK/2lWMwuoBgA7JcPZCoQyvFsgCdQ6dzshRr354q04MrRQUrJ+2OnXO4BMzHsSQYmBz8ONVsuVN06rWp+hTPbmBiiR4cLqVD0CvK57OJ7Q7H7ovSvFbBFqdyddzDJckt4pMSfmBkorjsCUxvG+aqQTN8ARpBL01bXI5/37+/Cz6gNQQNzx302H4Izo2Hzsiw+rSfZeuCLwF1PuX+D8HJ1ZE5r+crRuD0ju30JcbzhjHzMh0d58zzO9jsbVIArJ+M0p1DdhV6ZN76YoeVgKFH+DvjDQP9Cmgvfu+huw6CjAz6Rt2TAwUd+BDb5/0Uk8BGL1Nrri9SSNAsNLJX/A8jw7AhcHm+mdyrU9xmOAqvWSB7/pAmXWVPeMaINAb+X1TFATD65oOBYyz6zgf7JkxUUd8Oyy/fvg286eeDMPEwMyIzJ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(376002)(396003)(136003)(39860400002)(186009)(1800799009)(451199024)(4744005)(2906002)(52536014)(5660300002)(6862004)(4326008)(55016003)(26005)(41300700001)(316002)(6636002)(54906003)(64756008)(76116006)(66476007)(8936002)(66556008)(66946007)(66446008)(6506007)(71200400001)(38070700005)(7696005)(478600001)(83380400001)(9686003)(8676002)(33656002)(122000001)(38100700002)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Tfwj181oHZILyM74efThAlVxnuZQWSA+vXZ+GRoZzuonYRF2GDX617LiYOnY?=
 =?us-ascii?Q?dalfJkKG4qGQfXkae+MxlmhdcGpv0uqDh0F+w+PSIeutkk11eEBZq5YDPt7X?=
 =?us-ascii?Q?o4q762NWuVnua7Zlx5qbwdL6OMJh68zJo+NIml2sPQdpoLDosuix/GidkjQq?=
 =?us-ascii?Q?Lzjq819YMM38/GR59OtpveKSnKQeb+OBXPYqRGGZB4c+Pa6yTtAP/l9KY3E4?=
 =?us-ascii?Q?UdTcRQseO4TStbbJ9NNLeHilZMmrtQJl347kbI+NfFoZflmIrKiJs242E2gD?=
 =?us-ascii?Q?RkfDnxgokxzQey+RR7RuQKW36Z+rb3vUKjZCUMRDAYThT4gzPyF/NfLX/Zqi?=
 =?us-ascii?Q?43sh0ftgBQmkaKmtqqnbcAyNw2nmLsBBWKmD8Hty7NYRMor2Lj8Ge9pk3rtY?=
 =?us-ascii?Q?u1W6PsrhrullBou2cirw8EdZsrfoIfA3AZnl6OFiI908i05pBmWPZogxOZbH?=
 =?us-ascii?Q?K6LS5OtKU+bl7aXhDIYJ2tHQklS8m0De4RCokXpfBcbyWOS820l8sx178QRD?=
 =?us-ascii?Q?TTeSXrXFAQ42tKQuS7WDgdM6UIqhqW0eRke9gaRieHQj7ojXibuSUPixHnZj?=
 =?us-ascii?Q?zS5wqz7a9sfCQlzTH2wAm/e+HVoh8N1p/nQVpzsY/KpQqmAjuq6g/ss7JdYq?=
 =?us-ascii?Q?2wdLUMdUy+6EUV+6TfDpPtS6YrW2lD4VayZvboTwwU/ChbYc5pBEr5nqHBqS?=
 =?us-ascii?Q?ca/2xjnP0lwIAIFril6CAPByC7ez2KnbfU/Or9OE7Mm1qcrD7+aDYTQC0CwA?=
 =?us-ascii?Q?nJAOGJMuaxLqUTsNhHk6HvZHAAMA7IzRNlygHa3SzjSjUSLcLg0SSGXq52Uy?=
 =?us-ascii?Q?XQkAoDROo/qjmu8Dj1oZHnNFiBpxDgVwncUQveN3YQCsZLWOjBhvzckCi3z3?=
 =?us-ascii?Q?NIff4GnfqJs9jZLeDIZ6LY70bpnrt89H75DL9MZU0DmXwot3THOZqjHmtvhk?=
 =?us-ascii?Q?U/unEpDxyxf7C9nFkkWINU+La3AiQtYbowG4vn+hMav6yS2Au/n60WN6rivE?=
 =?us-ascii?Q?DpTbX/3Dx0PE9CQzCqYlDZqrkQkTmxJif9qN21VP0reHKtFS/3E8MfphMg3r?=
 =?us-ascii?Q?+U5/RdtsexZ7hhUVD0Zx+3k6U4fBgH+d9/NhW9jIhWv7sQT3UgzUSZkjGqQL?=
 =?us-ascii?Q?rjeJvLBgI8GZGlHmS3NXPt43BDOp+KxrYkR+roUuRgBhUW1aKKQe1COBjiZQ?=
 =?us-ascii?Q?rBE17MWB48gNtktKgqPWUntSDA5exog8vQbmUXsBsfgou9DD/vpkcphY3mme?=
 =?us-ascii?Q?xDMluy9y223pYvww/tOjazinYzFNdnwe/N5RLmOUUFP0aWMTUdy+ov9DLy+k?=
 =?us-ascii?Q?ZOPiURc9DMaGLs23Ez+jOIIHTZNM0O0gQMaRVd1jl/4f62HmUM+4sTsy4Utm?=
 =?us-ascii?Q?73phRAaBKdBMU7LhKlOzRZC6+1XmVGSra4nmu1HjcRwCEZFSNqD1OETjYkvX?=
 =?us-ascii?Q?UTqjyDikQ7qVF9yeHyV8XpHVcHeuOaeRlJF9ZHg1Vcpnn09pnAzMsVidKcbU?=
 =?us-ascii?Q?AqA9YjaZYTJ9Y+j2NRPIoxAqndrOUpfHEnIUSRJR4xd0CiR2SQjUc3tLpH3d?=
 =?us-ascii?Q?L5KDITYtn8M2xZO3SsIznn/vISXIizgFMKfa7MF6iTdrg0NuC+kyidXSPP39?=
 =?us-ascii?Q?MA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aa447d2-aa58-49a8-0fbb-08dbb9b7eee6
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2023 08:59:44.1000 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yqHeNYRAVPsbDVnWyopDa+wooEpc5ww9ZLQk8PAx9rePL2D2KfTWf5RvIKz1FHB0m3AAijCqacTDlJSJNzlpL4OhW2L8SwJyw321CZgqzNo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5011
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 3/4] drm/xe/gsc: add gsc device support
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "De Marchi,
 Lucas" <lucas.demarchi@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Winkler,
 Tomas" <tomas.winkler@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

> > > diff --git a/drivers/gpu/drm/xe/xe_device.c
> > b/drivers/gpu/drm/xe/xe_device.c
> > > index d6fc06d4c9dc..4d6e2f2b281f 100644
> > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > @@ -323,6 +323,8 @@ int xe_device_probe(struct xe_device *xe)
> > >  			goto err_irq_shutdown;
> > >  	}
> > >
> > > +	xe_heci_gsc_init(xe);
> > > +
> >
> > could we place this call earlier in the flow? maybe right after setting=
 up
> mmio?
> > or maybe after pcode init where we confirmed the boot can proceed on
> > discrete?
>=20
> Right after xe_irq_install will be ok (as we need working irq to setup)?
> Will try, if this works.
>=20

Right after xe_irq_install - not working, but after xe_gt_init_early - it w=
orks, will move there in V2

> >
> > >  	err =3D xe_display_init(xe);
> > >  	if (err)
> > >  		goto err_irq_shutdown;

--=20
Thanks,
Sasha



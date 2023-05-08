Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB49CC77B75
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 10:44:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C555910E210;
	Mon,  8 May 2023 10:44:26 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5EAE10E210
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 10:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683542664; x=1715078664;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IIq/avl1B68C5vUcwxAzNhPbqAoeskQ1JiqF0Lfj2Xw=;
 b=J3xRAPDwdTdhUgDX2q+zghpxrZpV7G/JwFQjdihj5gpr7dnbublcouuf
 O1OOzaRYjj2qp/99ePbPNej4w5Yr1Wtk2bB4XKe2Rnl9D078dVHJjpFZI
 GCbDol2uUQeda4yV8o40mvRSxGELNWEHhj0rx27AalspIffJ5Pu6SwWd9
 7KV/+tsO3qlXCxrWOwQyU93keWp120h3b3BoaCSLxOPQNw3VTmDL9or+y
 gHN/rRkaqtRSv6bytEdXnw5h6bz4lDIDgOs/g9uwPoSiFVV6Nv+VsQAoP
 aqmtQ3NaOrs5E03TsTh9qGIMYtOplaedvEdocDwfZVQ4zjvdxTEHKDV/r w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="348438585"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; d="scan'208";a="348438585"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 03:44:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="763354084"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; d="scan'208";a="763354084"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 08 May 2023 03:44:07 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 03:44:05 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 03:44:05 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 8 May 2023 03:44:05 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 8 May 2023 03:44:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GBHgwiOwYi+U2njIDdREFyHbJFhad37CUUTRVbBkbz47+mv/eJleFG6347AgdQepNo1Oq6wz/IT3OlokbpVBbVAqxbKnq70tFyDa8T+Aur2QV1Q4/ioKeUqKDi8w1MJz5mHPBcfMrJ8LQrYj8iOk/o3FFTWtqz6l6nckxY2yBDcn5McIz1jDKjz3Il3G6ZnvelKTguY4VgqBy9lNpqNlsWpeqkWaPd6TZX9HpBD8GmwQ4SHT20M7LOqLPqM84JR5/qDNAZwxcJtlXFq8eiUOP7o6JdgLN5jdITumT+IGPb38ZyImbP23TST6FoghhCnG0vFF7PxtJPq3Sq78a0QSJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mIZL+s0OkkSFEsu3y9aiREy0cUgaepAPKsZaq6mE+cs=;
 b=fBMiYQoiV1KEfLJ+008opg0PbkXdXEg1DVXnv60QWQ2cPca3ltTqRQkJjAnUPmME+XiO8zJIs7n0HzBTR09xD85em4etY+Z2c5ucpjYlnpfrXX2XGm7vBVlNVfl4bu7nccRqEuDnDZzQ7ge28aH3BEuBBrXLARnVGVbp+bNixEEoyXexti64zQiUfwlbRij58FkGaVc3g5/uPZC27WmV3+/2NAKtaUCyYezrYFioV8/aR+UK+TsHK9+zLdMRX+f83R+GBZby6V9+2UIooi9sANCuDcVNHRRRSdG9eexxEG+19Uasqx8N0joI7iIc3TuS5ANDUREjVv4FqItJewEfwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by PH7PR11MB7050.namprd11.prod.outlook.com (2603:10b6:510:20d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 10:44:03 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::f6ff:ca66:f20b:bd43]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::f6ff:ca66:f20b:bd43%7]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 10:44:03 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@kernel.org>
Thread-Topic: [PATCH 3/3] drm/xe: Add sysfs entry to report per gt memory size
Thread-Index: AQHZfnnDu6tcmDiJ7EG0YpJDJ7WEya9KDzaAgAABrfCAAbFBgIAAOMcAgAQ66/A=
Date: Mon, 8 May 2023 10:44:03 +0000
Message-ID: <SJ1PR11MB6204230517BE9448425C353581719@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230504112020.300498-1-tejas.upadhyay@intel.com>
 <20230504112020.300498-4-tejas.upadhyay@intel.com>
 <7aa6147f-752b-27b1-9f4c-667a3d457b51@intel.com>
 <SJ1PR11MB6204AEC32DEE34A64BB33A7D816D9@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <ZFUVYY7vFBBsYDWr@rdvivi-mobl4> <87lei2y7st.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87lei2y7st.wl-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|PH7PR11MB7050:EE_
x-ms-office365-filtering-correlation-id: 4aefe61e-90f3-4aed-6893-08db4fb123ff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zSwCMpVI034LlU0s46c1N5KtesjynpuPh9xK+azh389kPKlULdQroCkXCY9mhN8tn/7Jb9Qc7KLLOU2X7IOPobZkgcR/gIT3edKNketm3z0a8Y8svlEd0ASijstHNlPjyxzUKKrRclg+ySduMlDBSnRaBdSsIFuPzaWnlwj8Lp5DwkS0bpXNg2DEtWwTwzlIMzqJELSzkfOApZZU9iNpelbcZbCMerCt5V0kfm0WwOXhwKYOL+F+f7VvDLtTW4Crt+2gfr0Hz1Wgkijg6Tt1vVg9a+3qvsh28QYzQuLCeyUQirn3NPn+3Vxr1CBdew701zxJi5cB0uHeSLBTCGcbgc29wXQIVnLVrgEOryoERGIE99M5agkVVlt2BFtkSQzGQtzVMiz4n8TfM4FP326r22Z+S2DhEsKLFT+MG7WlJwr/L8hHHu5Mc61MoAJDxJQt8JbgF2nVouwQqsfBX9KEsfimz6rU1RmZfOFbNt2lvq0rXP/iHXSy5Mg4RS/tEHVENKCZDN2hFeN3m1sqCDabQNIDxPzuSWs/d8xLagjY4jC6siPYVjfPZl3HYf6II1Ty/8fjX5LFryxjdlGdyHmE0hA2DPbUj7bRvVWTwVdVPFcFop65zw11kW/fx8pw2plq
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(346002)(376002)(366004)(396003)(39860400002)(451199021)(2906002)(54906003)(52536014)(478600001)(41300700001)(8676002)(8936002)(316002)(71200400001)(110136005)(4326008)(66946007)(66556008)(66476007)(66446008)(64756008)(5660300002)(76116006)(9686003)(53546011)(26005)(6506007)(107886003)(186003)(82960400001)(7696005)(55016003)(38070700005)(83380400001)(33656002)(38100700002)(86362001)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VYt2QMPjei5y+NOFAAKoXDocaMyD8B9yIkalRegZiKmWKV2xQRfvyIft8zhu?=
 =?us-ascii?Q?Y5ypvOHUkiqvq/jjaMF024YPr9+Gvhh8EMRGhAO3Eq0wNKrFAl9K9CFXlOIo?=
 =?us-ascii?Q?3XhSpOyh3ioIrHFgONDY7DRioX8mvpKfYfBvagb7H3Gg8vHVaHHy6KiUzi8O?=
 =?us-ascii?Q?QxMsF/McC7qmxT1OGr5+n11NeoPnrOS4dhA6Dt7Pl1YyjsiPkT1BbMck7Qyx?=
 =?us-ascii?Q?z0n1twvGDoK/uL6GDcAmTTn7HmMhdWlE1XpURZNgybcCIinWsMV+qOSgbOmu?=
 =?us-ascii?Q?D4gbELqoAfZiIpFLAbozd/JsajMYzv0YCLRxNyuTjkTxL5jh9y1A+vP1Rp6N?=
 =?us-ascii?Q?YWIfqLaxgO/eUEsihl3Ltwm/c3uC01BL7QI2WkpvR/qKtZjziasWCW8xccHh?=
 =?us-ascii?Q?6OMpryS1pCrZ2eO9CbwQPjsXcSvPsK6dZaFkXr8vcgC9/8VR+yrjkWR3+/jo?=
 =?us-ascii?Q?jsp3fhA2Jw+4q6SAYdVIkhefcU4GxdokCFw42njlY+1njf1HJuCaPpwlRf4J?=
 =?us-ascii?Q?9tHc+HGKi4ias3zmgYIprxoiEypAFmrd8t7eb6AWcBqnsX75mS7SDG4aU9SA?=
 =?us-ascii?Q?27TTxXv3bPZQvchCT5zXAdsc9GA4LlqUVboMtipYmjz4aeTDHinvAhCGQq8d?=
 =?us-ascii?Q?xEYXqINkXM6Y74RjF/NmnArIDflalOnaYXLM9qIRtQT27xBTF/rXuTdm47Af?=
 =?us-ascii?Q?4pY0DFw/UVSkB5AlZ5WfDD9//G+Cm2y7sgsJC8gbjZY8gYquqh4E8gAvG8og?=
 =?us-ascii?Q?y018b+YZUT9EERzXdbfp9riRlWSyA/th68yje3315tBYey4amwLZvcbXwJaq?=
 =?us-ascii?Q?3sf2VlZlu8F5ItKkvvqBFDTnz9M96VWCh9ieav4ErIZQSlujAd58a7lHM7w9?=
 =?us-ascii?Q?DEfd+fLG9Xnc7tckF6w4yAKWB2WqZ/1HdUQKjw26YiZ3T8Ghf9cG7tX+EuwO?=
 =?us-ascii?Q?7dkPr8n5ZFvhxCzlidafysD6Q+r7TAvePe0W6bdNe4H89a0VQ3HPKfQqJw59?=
 =?us-ascii?Q?fb7K0N1nlBU5jC1+xBBKlJUQXWw/gxeN9JVA89DNT3AMeuobb0d955e3UZRn?=
 =?us-ascii?Q?p5CQEMSVZ6xuE5b2yDyFjtgTYfgJxhl+rQpMpCg+RtyHo7fq3+LjmFO2KzC5?=
 =?us-ascii?Q?Rvb1899HCYuF5fz30HAYtlcr2k4S0D+x7j1ZpULy/+64lUpnulZWP9BFHISp?=
 =?us-ascii?Q?UsBZSggyAmFR2LAYjOUucfI32AxFfvUY4IrTorok7buI3Bm0bjj7T9//ANRY?=
 =?us-ascii?Q?rfAtNbyEIzHnrS3ZaaHI3Sjl5L2i+WhRfTjKxUbDk40PE0XOT+UGqs1863id?=
 =?us-ascii?Q?oaE4TBBXYWKZ8BkGmbdytAKXTYJHU0zI3VWajLFEJ4FL7vRlkv4j/7MT8dFT?=
 =?us-ascii?Q?YNpQrMP5BeugMP2QVym7d1ZwTC2wm6AXW1ODXinTx4TsZr86zKgcOVMhNIhz?=
 =?us-ascii?Q?7Xe1oXtye9rOeRImSM0A+0wmpeWhqOmZyQALHmdEnQ6F+NCScW82zy0/CUT4?=
 =?us-ascii?Q?6qAdtAUjdG0GioU8kGBMkiMFx89gFMsElSC8vKrk4eVOsrvZtsmGAkF1EpRF?=
 =?us-ascii?Q?vcKrnL6J0/80oFmUR7G0o4HeNbGF1lO8ggMC1KWy?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aefe61e-90f3-4aed-6893-08db4fb123ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2023 10:44:03.4453 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DTGYMrBkYj14O3adVlXsCTFj7EMBhfYDfYBYk/uLuvgoxTtDUkE6H+FKgoG4mUpHpJYUyVBKPi3VE48Xgzlk3KQgUI8dkQtYMcjh/+2fOMo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7050
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/3] drm/xe: Add sysfs entry to report per gt
 memory size
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
> From: Dixit, Ashutosh <ashutosh.dixit@intel.com>
> Sent: Friday, May 5, 2023 11:34 PM
> To: Rodrigo Vivi <rodrigo.vivi@kernel.org>
> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; Iddamsetty, Aravind
> <aravind.iddamsetty@intel.com>; intel-xe@lists.freedesktop.org; Vivi,
> Rodrigo <rodrigo.vivi@intel.com>
> Subject: Re: [PATCH 3/3] drm/xe: Add sysfs entry to report per gt memory
> size
>=20
> On Fri, 05 May 2023 07:40:33 -0700, Rodrigo Vivi wrote:
> >
> > > > > @@ -50,9 +114,15 @@ int xe_gt_sysfs_init(struct xe_gt *gt)
> > > > >
> > > > >		gt->sysfs =3D &kg->base;
> > > > >
> > > > > +	gt->sysfs_defaults =3D kobject_create_and_add(".defaults",
> > > > > +gt->sysfs);
> > > >
> > > > what is the use of defaults??
> > >
> > > No use. There is no use I saw in i915 as well. But may be for some
> > > future use it is kept. Or I missed something. If want to remove, can
> > > be removed on objections.
> >
> > Cc: Ashutosh
> >
> > The defaults is used in i915 so Level-0/Sysman can perform the
> > restore_defaults operation.
> >
> > I believe it is a useful feature...
>=20
> Yeah for RW sysfs attributes, i915 had the convention of exposing default
> values in /sys/class/.../.defaults (look at intel_gt_sysfs.c and
> sysfs_engines.c) so userland can restore default values if sysfs attribut=
es had
> been previously modified. Level 0 was doing this in some cases.
>=20

I looked into this little better, the entries which are going to be configu=
red through CONFIGs would be having value and importance for defaults. For =
this particular sysfs entry we only have getter method (Read only). So I th=
ink defaults not required atleast for this case.

For entries like pre-empt_timeout_ms where configs coming from CONFIG file =
will need defaults which could go in its own code file may be (something li=
ke xe_engine_sysfs.c).

Thanks,
Tejas
> For xe, we can do the same or something different I guess.
>=20
> Also, are we going to re-create sysfs as done in this series or use somet=
hing
> like hwmon (it was being debated)?
>=20
> Thanks.
> --
> Ashutosh

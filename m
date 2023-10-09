Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54663E95A8E
	for <intel-xe@archiver.kernel.org>; Mon,  9 Oct 2023 09:16:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ADE210E24C;
	Mon,  9 Oct 2023 09:16:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1814910E24C
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Oct 2023 09:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696842978; x=1728378978;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=G5sTqXXSdheB4meww66yuP64ehfJ5JaTO5mxPUI/Xyk=;
 b=GoqKex3O8Yf2cdm+oJEQCDaKjxJFAJfF3BNPsWYEM5ah4P6N/UaxBEKM
 7OVNUiwTIcYAU98C5Afk+nZHc9cJ/Dj37IuoWGgolR7ElZ1OXI2WUC/L6
 XXoAZ8cV6AnInq3bINXhU8+PgMBeMYz2LEOcj347HY0vLM4pyFSeYyb7+
 A5LqbcqRPLuRrpuSXwyBd1ytGkK41rbjzWnL4u6C35TiavZ5qN/5HKEVe
 VgFcVFkY1SDFMAxUB9zJ17JGFmTR6bowCndPRl8ofuFr76uyFUISzZCh6
 7O0yoMQori0sEGPh6CJdldiRqit93FEagNNIhxkRggaelkTtvJGdZyZ65 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="387966242"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="387966242"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 02:16:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="869168522"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="869168522"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Oct 2023 02:16:18 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 9 Oct 2023 02:16:17 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 9 Oct 2023 02:16:17 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 9 Oct 2023 02:16:17 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 9 Oct 2023 02:16:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gaMV3/Ri48IDVC9aVmzc+CEC1XIpC4pR6VB+/WcKiHOHYho24+xWswgbTGUN2xyD9AV/bQP5y2W4dmuj3aqHJBLhnl93awqL9eq/zYq+lqmO3V2Xy+Hi+Y2LZG4uk+4ZaEtpSTny8xoUITpsZziCqOsVqpUiMPudyeQgr0KxSqhEw8OPZV6ZrC6SNzUq6tjdZjIyGIiKSq7EoLR/vHwJ4TJpCEmKoJBBXKpIs0uSHyI/1Yxm1oADR4IbKxn/1PrzkHFZYyUcKH/1G0qZzY9eKw2+Ogt54LUk0oKw/nrz4lbAZMhMagobrGb6OtwhizVC396K67aWmJiYjbv64swBrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7JsPndaAf0emBHW8c03o6HnCkvgYeEqgWsLAoyeTneo=;
 b=M/rp4kxh+s5aUdY8CJZtUP8BHW/0LDeo+1ckFatEzhXP+VoVzqtXn4gYxsIRNq2C+Uurg7yfsmZk29zpxTjvIytxqdcixV/PBhbOkjM6c9o1Roifadbb+7HsE+9XoX31UyqbONWAFZB7Z22E6Bpkju9f1xBingn/JSBQBE4/ImFx+YV6bAZlpIk8hNtkSDSAcfhzLM46fs3MiUqXZzUU+SpD08tlVL1oI5PDGbc+35TNAFVwlc0ZHlkoDHshSK20Hp84JaL0FXjuI6HnhXIqasmajUYPT9SbOZoVULrlL6iLZTrzyl1Jh7aWYGyod1DFrn1dE17QA+7y0+LzL0Cgag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 MW4PR11MB5933.namprd11.prod.outlook.com (2603:10b6:303:16a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.29; Mon, 9 Oct
 2023 09:16:15 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::42bc:8d57:e26f:ecd4]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::42bc:8d57:e26f:ecd4%3]) with mapi id 15.20.6838.040; Mon, 9 Oct 2023
 09:16:15 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH 1/3] fixup! FIXME: drm/i915: xe doesn't have gsc hdcp
 interface or something
Thread-Index: AQHZ7UEmjcJQw78o+UuduLWikiAc2bBBQREwgAACFICAAASLAA==
Date: Mon, 9 Oct 2023 09:16:15 +0000
Message-ID: <DM4PR11MB63603305192D30403B16632AF4CEA@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20230922082909.334085-2-suraj.kandpal@intel.com>
 <20230922103759.346871-1-suraj.kandpal@intel.com>
 <DM4PR11MB6360DB0FA9CEECBCD3FDC8F2F4CEA@DM4PR11MB6360.namprd11.prod.outlook.com>
 <SN7PR11MB6750E95D5FB25D3E0490867DE3CEA@SN7PR11MB6750.namprd11.prod.outlook.com>
In-Reply-To: <SN7PR11MB6750E95D5FB25D3E0490867DE3CEA@SN7PR11MB6750.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|MW4PR11MB5933:EE_
x-ms-office365-filtering-correlation-id: 4c4df8a0-3227-4717-4fc7-08dbc8a86393
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fsbrykkiZQyK8LpA8mdUWmmfDSvNJmugRHb0S51enRvPvJduIMtKglnjkJJma8ZkY3d+AZpnDUygTKj8/Ag2s5iU9KOkkFl1tRk6vB/ScvRXkTOixGD7D3sVrOXKCs/2lrIhMtZeiKj/w4edgFoFSOIRWpFxKuNhDO5pyDuvp1J5rsRU+lUQI1BwR5kGy4F9YdO8lK7khciVg7JFqKFHkBIv3w23MJvHkWN4VnLs7AkCtZ7RIoMrSIBKQlneIk35r9u0royHvQzx5py133HrySYUS/6d7uIo+gN6bcXNzIzn9ZAo+1C67u9sl8cClya6xoc6K3WanHX3HWUP5X0zq01dYC/ouLhtREVwydM9EPJZxZc/nbn/teujw2V28PDcrx7dGHEkrD0Pxzg0SFHC0kayynRgie6iZ/i1TKg7noHd5jAr3++aqdU/p3FcFgU3/Pf1CR3krtHhz3RuzLxZiVz1iXk8ldxsg8cdzPW8EKZazD8CyDetLM7UGYKkKWvYRlTmKqTVie48vNe3SsLtnix+4ZQxi+/xETbHYlx5kwf/jxaL591W5aqNWVnkLUfR8nj1OxxjlwK/ROLQGfPUiRu8/IwUvAvIlSKi7icQxJB764d3WaF+3Znv2NMH6Kx4
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(346002)(366004)(376002)(136003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(86362001)(55016003)(122000001)(52536014)(5660300002)(6506007)(53546011)(38100700002)(71200400001)(33656002)(7696005)(82960400001)(9686003)(2906002)(478600001)(26005)(83380400001)(76116006)(66446008)(66946007)(66476007)(8676002)(316002)(64756008)(66556008)(110136005)(38070700005)(41300700001)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DXOV70lXvdapt5KhxGBaem/eRWm5G1CEYZp6qMRC7S0GwtfEAe2uk5yAWX/0?=
 =?us-ascii?Q?JXcNGrKfI9Or0gu7kMKTFspUB5lE/OUPiHWQcDZqlJDXIT/NU3BLDqN/sp0e?=
 =?us-ascii?Q?8wtr8pzidkJBQX/hiIraOKMfZdpO+rA0ccea6dp205tFWH0Hz/kA+vOhKrgB?=
 =?us-ascii?Q?OuNa4HHIxLxfxtVF3EkrhF4ZIY4opd3+FjXK8CjOIBgyqEBX8Sl8fGVnR/lF?=
 =?us-ascii?Q?eO9OsX5tXFx+NVN7ODyP1U97/0KjFZwVM2f8XI6UirbxsYGhRt4tdClGZ3jq?=
 =?us-ascii?Q?QCSKFD37l+V7MgqhZ+AjvQzyD37cENcBgvHD708b1Y46xh1+MrC3B9Ck1rpM?=
 =?us-ascii?Q?gxT+yHpq3pSFTkg2smgSiOgS3GLP1AhbIqiFs3Y9+DKdAqYuswMtlouglmC0?=
 =?us-ascii?Q?BShYsH5yuxvwBilj7TrG5ASiVtQzHURWuWgNBIecvg7Bi/2/Z1Qo/qNDhS7n?=
 =?us-ascii?Q?1E7GVjh+zcL5CcI+1+iiJvr5wGKYCn7bK/3khXo23uFIbILlCSiZgirC/hcc?=
 =?us-ascii?Q?xuBsLqT9I1Sk1fXEKFxAs7EepTZ/GSVYKO3ojQPbKA/bew6BS1fpnCIqkLpA?=
 =?us-ascii?Q?4VN2sbKZ+mz+dP5IuWObivH05Ax8A54EcsmkBmVMO7ai8t3x267/jFCVykM1?=
 =?us-ascii?Q?ySH0994bX1zN4y/Gf3soEwrHLVDnZJbvg7Jr3XaLUsnV1BKzPVSfDf7jTq0S?=
 =?us-ascii?Q?G/CnbW/a7njUfYzRNP0fQRA7Yb7wRljR4ka7uinnflkhGMFGBbLFppM8taNt?=
 =?us-ascii?Q?vsVA/KuyocwPUUgRBo/7OYxWKwilvjzG3ITvl37bBKg0+xzxGNEetpkYuzeD?=
 =?us-ascii?Q?8A25He1lZKytSVzeWHQ6B1P3RJhJ1hnDGuplPnAXSAV4E8EwvWtsnGEy29s6?=
 =?us-ascii?Q?FaL+v78KCXaBWS+GeSifRzquE57MUdxcevivP/9LrtOxLcyHK3IknAwY2aVB?=
 =?us-ascii?Q?rCnOjEK18RIXCJDTOWyRU/olaTkBrB0DBKJlCXj5JgxcGUgKeo9OgriihsVB?=
 =?us-ascii?Q?T0aTPmTKMK+9zmGYxepDTtDjzioWiBh5vXdlCtAFf3o1kZT3GYhsuEAEsG2K?=
 =?us-ascii?Q?ECwpc6TDTqBSNjzv6kZ/pf8A3k+ii6wh7v8Yj531cU9mN4+gnJzTOIRTRRwu?=
 =?us-ascii?Q?046bYNb2O9mwDSNIUd829Xuk+8d5VDAwhqombX3jB5OTE6ebbjv6gZ5xTcTz?=
 =?us-ascii?Q?LNCbDhn2LiyRDnszstuZ9SCXEeyOoFarIi50N1Z3K8Pjf+AVxuKfffJxs1zj?=
 =?us-ascii?Q?bkWqLjOinTuM3iNzTH/CQB1yyV69VYRzzDhVrAetrS1F3vJ/YPtLcb7qc0uF?=
 =?us-ascii?Q?5nR+syhANEOjiIJBSVIax7jw7pVvU3YmfmYxh8MPrMP8JSNgeKMKNrc/ngzI?=
 =?us-ascii?Q?GgF6rBrsFTM5sjATdMO8mWxNZMHEJdUgDf5yGQWz8XYh6wQ6eYxWhJeMyU3h?=
 =?us-ascii?Q?HAvwU6BFSYWJbSLN3qayvl4WvSSZ1lbgZn+sNsznYTF8Ox3nOI6Y2IuklZfY?=
 =?us-ascii?Q?UhX/XlKX4CWEYxHNoXyqQmJllQEkOb6WMBMgeJD7+rrmj104CxkiDBK3TXog?=
 =?us-ascii?Q?kfKb/zvHg84oF/W8rw0f41O/8aRtWvmYEMC28Hao?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c4df8a0-3227-4717-4fc7-08dbc8a86393
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2023 09:16:15.3376 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 84VzYoszKLkwx3YwKOLs27PkYdRh+uT1e45l7Cai0MR2k5Z8b8xyZcQ1RJO3QRLk2KR1YF6yuDkp93LggIxIhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5933
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/3] fixup! FIXME: drm/i915: xe doesn't have
 gsc hdcp interface or something
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

> > > -----Original Message-----
> > > From: Kandpal, Suraj <suraj.kandpal@intel.com>
> > > Sent: Friday, September 22, 2023 4:08 PM
> > > To: intel-xe@lists.freedesktop.org
> > > Cc: Shankar, Uma <uma.shankar@intel.com>; Kandpal, Suraj
> > > <suraj.kandpal@intel.com>
> > > Subject: [PATCH 1/3] fixup! FIXME: drm/i915: xe doesn't have gsc
> > > hdcp interface or something
> > >
> > > Remove stubs to clean up HDCP code
> >
> > You can mention which patch is being fixed here (one which introduced
> > the change).
> > This can later be squashed together.
>=20
> So the fixup patch mentions which patch is being fixed
> FIXME: drm/i915: xe doesn't have gsc hdcp interface or something (subject=
 the
> commit being fixed)

Yeah ok, I guess this should be enough, no need for an explicit hash.

Regards,
Uma Shankar

> Regards,
> Suraj Kandpal
>=20
> >
> > > --v3
> > > -Should be a fixup patch [Jani]
> > >
> > > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/display/intel_hdcp.c | 5 -----
> > >  1 file changed, 5 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c
> > > b/drivers/gpu/drm/i915/display/intel_hdcp.c
> > > index f617ccd206c8..a42549fa9691 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> > > @@ -174,7 +174,6 @@ bool intel_hdcp2_capable(struct intel_connector
> > > *connector)
> > >
> > >  	/* If MTL+ make sure gsc is loaded and proxy is setup */
> > >  	if (intel_hdcp_gsc_cs_required(i915)) { -#ifdef I915
> > >  		struct intel_gt *gt =3D i915->media_gt;
> > >  		struct intel_gsc_uc *gsc =3D gt ? &gt->uc.gsc : NULL;
> > >
> > > @@ -183,10 +182,6 @@ bool intel_hdcp2_capable(struct intel_connector
> > > *connector)
> > >  				    "GSC components required for HDCP2.2 are
> > not ready\n");
> > >  			return false;
> > >  		}
> > > -#else
> > > -		/* TODO */
> > > -		return false;
> > > -#endif
> > >  	}
> > >
> > >  	/* MEI/GSC interface is solid depending on which is used */
> > > --
> > > 2.25.1


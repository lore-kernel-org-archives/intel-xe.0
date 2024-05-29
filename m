Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E882C25B7C
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 20:38:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E268210E679;
	Wed, 29 May 2024 20:38:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZlN9+Vsh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 459D910E679
 for <intel-xe@lists.freedesktop.org>; Wed, 29 May 2024 20:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717015085; x=1748551085;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OQ1G4qT4v1kUByQWs7z01Xe6t495OXwvzLk+0SJV1wo=;
 b=ZlN9+VshZmXRN5ondJoEXU3Z216t2+tW0AJXun/Gjx21Qlmr6YN8EVBw
 gVAdex8dsNPPCZnHCu6/HHb7TUzJiELQiyFWmuOLqcVjHN4yGOoEIyL+6
 yZPBwp8sVi59+RB8goWHVSstDYYjU06vEFNhVpz4/KJl451IbfMKVr/R+
 WsNnBVWM2YWDuffBP7figIJwqYpZG1GMxbdVZwsyj1GdeOSh1ZkuSFyBA
 sBI00IRmlBAkU134SHSEWnBmtPwv8ohmvK/i9bkHgebRggLs04fYGrX+Z
 PmnIrEtitcTABC3XaAd8f3AWpFQ5R+Gi/ToWpRQtW0Uz6MZzUBXuNvjFe A==;
X-CSE-ConnectionGUID: d6+0Ig0BThWG0BEA0t870Q==
X-CSE-MsgGUID: RGawC5NZS/O1tjDdLKotFw==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="30973878"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="30973878"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 13:38:04 -0700
X-CSE-ConnectionGUID: UL93vbC5QwuEOOW44s6uCQ==
X-CSE-MsgGUID: ISH3c+ZiQZ2P2i/T5snVfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="40030160"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 May 2024 13:38:05 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 29 May 2024 13:38:04 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 29 May 2024 13:38:04 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 29 May 2024 13:37:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mN0drnuIQOQJ505dmkEsOv32NN9EsY7bmwLBskF1kqauV2pkAl3nHHfRriBXq2rBSV/vfQwN6aGQ7GP7x8yMqhFj8mrg+VNoTjVKeU27/F2c4XeOXpTp8KgNmRDHEUA3ukBBoIO3GmndKYyY35dMksd8KZNuO5C3XRcnXlWevvCxz4LBqK9M2af+TbP+ju6eREXC29+E1Wt9mqrJPbo7qqWPBfHMW7tgcYxk15u+uuVyVo6oo9GM4wT8UKI4XcTrmdF32aaz/Is/2yX5oe6ZvvcoiOZcQPhuv6CdGX4csNPZ4SoIM3P+dEMkTpaDjOrg2eqGtctJP2KQFMQOLOMUUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mR/JK23HHEZP+t/gvwL/X0WXeSZen+OdndtNG15W0zI=;
 b=BGYjolq83WhviDuSn0WHJ9nKSgPcOkZ8gZhnyI06ayinqNd3iePwYINPp43kVywJ9/SLJ7HmpwY+xg+xrz3EK5eaZ12O8Mmx53dW130BgtkzuZtBAJ6PReDmv4J86K0T0sosBy4aFx5ijaTMItuXqe1LTegxHpv8IheJ3MCsrA2tMWp+Orq1qEGzjT/HcRukXphWhMxcq7MAbsjPy9bS3xrlniKBbRdM3mehs19fz+cz/ZYP0oK7/h0zZMxYRc5tJb/HnVBYlmdcXZkKkxjxXLmes33M+6weIYoiG5y+I2BGZjjCFsCEsyEkWvmmh7qu7o/oGcRUgEr4d/cBdiJhEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5782.namprd11.prod.outlook.com (2603:10b6:510:147::11)
 by MW6PR11MB8409.namprd11.prod.outlook.com (2603:10b6:303:24c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.20; Wed, 29 May
 2024 20:37:06 +0000
Received: from PH0PR11MB5782.namprd11.prod.outlook.com
 ([fe80::9696:a886:f70a:4e01]) by PH0PR11MB5782.namprd11.prod.outlook.com
 ([fe80::9696:a886:f70a:4e01%3]) with mapi id 15.20.7633.018; Wed, 29 May 2024
 20:37:06 +0000
From: "Mishra, Pallavi" <pallavi.mishra@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe/xe2: Enable Priority Mem Read
Thread-Topic: [PATCH] drm/xe/xe2: Enable Priority Mem Read
Thread-Index: AQHarjwFXmtx1lVL7kerp77SnP0zurGs3XmAgAGGmvCAAA6RAIAAQKyw
Date: Wed, 29 May 2024 20:37:06 +0000
Message-ID: <PH0PR11MB5782EE1C47011C84F309BBC882F22@PH0PR11MB5782.namprd11.prod.outlook.com>
References: <20240525004933.1124012-1-pallavi.mishra@intel.com>
 <20240528163455.GD4990@mdroper-desk1.amr.corp.intel.com>
 <PH0PR11MB5782B66225A9EE3FAC59939A82F22@PH0PR11MB5782.namprd11.prod.outlook.com>
 <20240529164504.GL4990@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20240529164504.GL4990@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5782:EE_|MW6PR11MB8409:EE_
x-ms-office365-filtering-correlation-id: b669cc56-035e-4b5d-24f9-08dc801f1aeb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?/zp5Qp/l5DJsFNidQfpcSawqIH9EvWmwwp2aqCZMwuqK9hnakBOgkYa86ti+?=
 =?us-ascii?Q?t/XtZnAqJd1CCQQw7ubj+3dIjzmB6GdkPiuJME2O/YcmdZGK5NGlFBA25mdS?=
 =?us-ascii?Q?bHfHKX/aQUDP9IxRdAhZpRgBsyo8MWgbOFLaS10X6pUdrqIfabE0VGJl1WbP?=
 =?us-ascii?Q?S/IW69hsKxFhxO40vZhq4h/bxSOUlYPlUcgCN0yaVw/MujgcN3gB5RI/iMRV?=
 =?us-ascii?Q?+Vhjh/F7QDubdyn9t5z/wrgJI+UqWiosyfxBXSmJZ+7tQi0yyOv5lNf8LbIg?=
 =?us-ascii?Q?61nAvdEN4hKqdDmJYVPz9IuIY4vMNGbRVeJ7Was9IDUhtnYC3V5QUvdZ4tZh?=
 =?us-ascii?Q?r89sCE/0KAjnDygyw8ns7xP8w+q1ppTenFmokCt4KTNh9dUdpJ7Y9dqhdUAe?=
 =?us-ascii?Q?Xd2PvCM6rqfr6ojFWw2zcJj/n87073TMz5FoEvgFPZmxNAE/opebtEKLP5JA?=
 =?us-ascii?Q?b7sKvRJ8mfZneJpDoXcr310o9bYrqG7JMF677Lurv1xhvFBP390fOS/CmDBH?=
 =?us-ascii?Q?6YrhW8XsPuvDRB9l7ru0UxOEsrVGHiSy+mdX2RnVNMZ1T64+G2ZOj8+tf0uZ?=
 =?us-ascii?Q?YHCzOJZgET7sJEbanuwZYtFEnNbadvhkAcRmr5m5tiKgiCAv8F71tvJwC8c9?=
 =?us-ascii?Q?lIkjlNpAvOgo+sO9Wu3K2WppngjEfr7rAVU2NpmuEER+HGkcLjRIanV7by/l?=
 =?us-ascii?Q?sU7W2DcaaafJOf2kl9osE4s6CuZr5DmVjBNoMXCDhkBAStIevAAiBl8wJdA1?=
 =?us-ascii?Q?Wqa3yAuUPTuVNbz61fH1FZPEdPRKVYk9Db+Frg50PUsms4Jl1oZhQ7VyKdr7?=
 =?us-ascii?Q?DRFX3uqmSGZ126sRZlcdeUSAcxZiUD5Zne4rmY1E+UQf+SKaTANhML16bShD?=
 =?us-ascii?Q?wVmzYDh1M0SlcWKVvOKSpukgjJsLSDlxnDhwRip4+331jOynlrmmBV/1zBG7?=
 =?us-ascii?Q?4MEwiUvvjuZmmGNP1+k5uc6t+VuzD8Jpmnj6dGTdsl01/LncP+3k6ctFa9st?=
 =?us-ascii?Q?qrG5uE9UK52L+nIY1BJv7XQu/a/UW9VlwmMTh6hDtHwzM1EuFAr+PnhNN5m8?=
 =?us-ascii?Q?rFafp3NWFSLh78329kw3PiIIApmIfy98YTn+YDN6ep/Y+4bUKEu7gIQsRSvD?=
 =?us-ascii?Q?1e+N/YsFTecfo29NUYgClv5wNKgTR/UvWZGsUPF+ij9hwgzcCwCa+PP4Zznv?=
 =?us-ascii?Q?AEqA3c83E83grzzXJsIPuqer9KFquV25z2FSwdxwDTRpo2NITajuFC5Z5GXf?=
 =?us-ascii?Q?RYKoP37WjXsI3zVaF1I+9MIwucRc94xw+mmuUFmB5Q=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5782.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?IH2BzmZ6kE7n17dOGLI3M1Dj90p12aNtw4CxGUw6l1Xkid61gEv09uJSeK/7?=
 =?us-ascii?Q?B35CjAiGwyA3OJz6Y4vbhfHWMMr6Q1OhCS4SUkGqDvXFFsTFkWi/jgxwu/JY?=
 =?us-ascii?Q?nZNWx3MBKVnsfp/JCK1p/IvGEireMDCzYlqOPaIprP8mj0vYASFP34yOT0VL?=
 =?us-ascii?Q?JmmntRyea8LlJdEbwUnGKkBoVo1MeBwDdzgsuabFs40ckCx7DQ8u7QZK52i+?=
 =?us-ascii?Q?NSHeIKf2ZR6KkUX2aHCBIHklrXffJdER3fq86S2itk6dURt7cCRkbM6mE1Bx?=
 =?us-ascii?Q?np3Q8LtCAZneqPSnyTmhlAjc4Y+WfoXSuNm6jW/6vJAOoGIwMllUsxJrVxIP?=
 =?us-ascii?Q?uFX+nXWS5uFAyhLVvo8EaDApbCeXMrHDDkQiWAIwSOwU6SCtatnymJKlzMbe?=
 =?us-ascii?Q?B/EgNPUYk1wByfMFzx1r/JiO682FkplF18pXUu4R4QlGR6Xoso8CDbB4QqGQ?=
 =?us-ascii?Q?PNGEnm5PEx+nubTqZ8MHZiJ/g9josjVPo106iS3W6G2gDNPbNX/BN7UmX5CU?=
 =?us-ascii?Q?4dvuj+D9mnwxtGRClSZQw0eEEx+5od9twoMr5e4FbRJy4U8yxv3S4icMsm5c?=
 =?us-ascii?Q?j7Ct7HZnp72JQJPW9AG9CScaOMuZ9G1mvmgOcz5UFKJBBPcR+zHr/Kifien5?=
 =?us-ascii?Q?hNfm6qwzCXNpmguxxnP8dCxKZg2tW+Tds9gaPB5ATaLfOjKu7hAe5AjcxPxz?=
 =?us-ascii?Q?pXfoICiZNVLaQu8nc3JXyV51iS2/il5s2fWgOQXrWH2xYsKYXemby+dky7MO?=
 =?us-ascii?Q?D+QV9uJhyz+MCkqibP4H8yKA9Jaep8Ge6kCWdMHjFS0Z/uKq3UNg6Lo7NthV?=
 =?us-ascii?Q?qP4B0KAqno9sMjzg/+LvqW8xVmZKSV2dFWQAojeaiKiqT31Yu9JPFkYOlt85?=
 =?us-ascii?Q?74kcTuB4bTVCeR8kpc9H5Z9vgKVYaNQD21TuIx3sIveZWyh6iWKHWZVEJPxu?=
 =?us-ascii?Q?wHa2U2g1CQP9pum5wgtTTiln6gteQvwIJ/axBrPBeHbKJ2XRLvaBeYQNLa7/?=
 =?us-ascii?Q?AqPXQwUDYJdH/yrYWlHm3W5V8wley0Q0srMNJzzbv44pTkmwKiLPfL95YlgH?=
 =?us-ascii?Q?TGgYib13Uo/ShU3vR3nFcoHUYqVCW042iXDLgyN/lh5G8mFlyM+P+MPwvDdc?=
 =?us-ascii?Q?hjsArG5wB7sjN7Vsx9ONL3DQ1taVffqFUYCmiLLeAmCwtstMPHug4ps9rfml?=
 =?us-ascii?Q?gBFX7Uwwg5J1YUti8McG8t1kUatQLCJNMjz1wOYRc6uhJWkSv/PS9KuYKYLZ?=
 =?us-ascii?Q?hoEe3LbAb+tGpfNvjPXyorSGx9+yuOyERTNDG1FgPIQeGtWbjp2rgVmAE/fN?=
 =?us-ascii?Q?CLW69M8bAYlvi/L6ecfc/Rn73YDdXSI3O5z7YwGwpL7W90+fv1RkhdVXxSMm?=
 =?us-ascii?Q?b/YsYYe7IKD1WBQzdjXL5IjqmdLSApqVvtI92x/fbIN+6Z6qvKkG2jNguFKD?=
 =?us-ascii?Q?j6DFV3E5I/5lMEzCY109XYpsC5lmbITPc3LuFAvAb2/rpf/T51ozGOnt4hW0?=
 =?us-ascii?Q?px6iDPOR3JEWdNgjwQcUvc0mkkseLA5K/ZwxDV7d3TFd9n57wKoU2LeIoVgO?=
 =?us-ascii?Q?JhHlIloNdZkoQc4w19W1dIkLfNipHds4z6S7uTUz?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5782.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b669cc56-035e-4b5d-24f9-08dc801f1aeb
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2024 20:37:06.3628 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Npat/78dX5nzyctrP7QJlVxNSHyUGSh/dt86WbxxejZHwJqcCBxeYgY41ggOlAChjPtkVFlonXNvcY0msadSImRD+1a7aCdjyJYmqS5u/8Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8409
X-OriginatorOrg: intel.com
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
> From: Roper, Matthew D <matthew.d.roper@intel.com>
> Sent: Wednesday, May 29, 2024 9:45 AM
> To: Mishra, Pallavi <pallavi.mishra@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [PATCH] drm/xe/xe2: Enable Priority Mem Read
>=20
> On Wed, May 29, 2024 at 09:00:42AM -0700, Mishra, Pallavi wrote:
> >
> >
> > > -----Original Message-----
> > > From: Roper, Matthew D <matthew.d.roper@intel.com>
> > > Sent: Tuesday, May 28, 2024 9:35 AM
> > > To: Mishra, Pallavi <pallavi.mishra@intel.com>
> > > Cc: intel-xe@lists.freedesktop.org
> > > Subject: Re: [PATCH] drm/xe/xe2: Enable Priority Mem Read
> > >
> > > On Sat, May 25, 2024 at 06:19:33AM +0530, Pallavi Mishra wrote:
> > > > Enable feature to allow memory reads to take a priority memory path=
.
> > > > This will reduce latency on the read path, but may introduce RAW
> > > > hazards.
> > >
> > > You might want to elaborate on what "may introduce RAW hazards"
> means.
> > > I.e., it's worth noting that both kernel *and* userspace-submitted
> > > batch buffers may now be subject to read-after-write hazards if they
> > > don't use MI_MEM_FENCE in cases where there are assumptions about
> > > operations happening in-order, but where a read could potentially
> > > leapfrog a preceding write now that we've enabled this.
> > >
> > > Presumably since there aren't any other changes in this patch you've
> > > already confirmed that there's nowhere in the KMD itself that needs
> > > extra fences added to avoid read-after-write hazards...you might
> > > want to mention that in the commit message too.
> > >
> > > This could expose previously-harmless bugs in userspace drivers
> > > and/or IGT, so it will be important to make sure we land this before
> > > lifting force_probe on these platforms, otherwise the appearance of
> > > those bugs would be seen as a KMD regression, even though the bugs
> themselves live in userspace.
> > >
> > > > Bspec: 45845, 60237, 60187, 60188
> > >
> > > 45845 is a page for pre-Xe2 platforms, so I don't think that's the
> > > one you want here.  I think you want 60298 for the Xe2 equivalent
> > > page that documents the register bit.
> > >
> > > >
> > > > Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/regs/xe_engine_regs.h | 1 +
> > > >  drivers/gpu/drm/xe/xe_hw_engine.c        | 7 +++++++
> > > >  2 files changed, 8 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > > > b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > > > index 263ffc7bc2ef..4e8f9a61f0bf 100644
> > > > --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > > > +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > > > @@ -104,6 +104,7 @@
> > > >  #define CSFE_CHICKEN1(base)			XE_REG((base) +
> > > 0xd4, XE_REG_OPTION_MASKED)
> > > >  #define   GHWSP_CSB_REPORT_DIS			REG_BIT(15)
> > > >  #define   PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS	REG_BIT(14)
> > > > +#define   CS_PRIORITY_MEM_READ			REG_BIT(7)
> > > >
> > > >  #define FF_SLICE_CS_CHICKEN1(base)		XE_REG((base) +
> 0xe0,
> > > XE_REG_OPTION_MASKED)
> > > >  #define   FFSC_PERCTX_PREEMPT_CTRL		REG_BIT(14)
> > > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c
> > > > b/drivers/gpu/drm/xe/xe_hw_engine.c
> > > > index de1aefaa2335..34aa8b5270b0 100644
> > > > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> > > > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> > > > @@ -424,6 +424,13 @@ hw_engine_setup_default_state(struct
> > > xe_hw_engine *hwe)
> > > >  					   0xA,
> > > >
> > > XE_RTP_ACTION_FLAG(ENGINE_BASE)))
> > > >  		},
> > > > +		/* Enable Priority Mem Read */
> > > > +		{ XE_RTP_NAME("Priority_Mem_Read"),
> > > > +		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2000, 2004)),
> > >
> > > The current platforms that currently support this are BMG (graphics
> > > version
> > > 20.01) and LNL (20.04), so the starting point of this range should
> > > be 2001 rather than 2000.  Also, since this is a new feature rather
> > > than a workaround, the expectation is that it will (probably)
> > > continue to exist on future platforms as well, so it's best to just
> > > use XE_RTP_END_VERSION_UNDEFINED as the end point so that we don't
> > > need to keep coming back here and updating this for every new platfor=
m in
> the future.
> > >
> > > Also, RTP rules using GRAPHICS_VERSION[_RANGE] only get applied on
> > > the primary GT.  If this feature is also available on the media
> > > engines (I think it is since I don't see anything in the bspec
> > > implying it wouldn't be supported), then we'll also want a second
> > > table entry for those (i.e., pretty much a copy of what you have
> > > here, but using a MEDIA_VERSION_RANGE(1301,
> > > XE_RTP_END_VERSION_UNDEFINED) to capture the media IP.
> >
> > Thanks for the review.
> >
> > Just to update you, I see below failure
> > https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/bat-lnl-1/igt
> > @xe_module_load@load.html
>=20
> The key error there is:
>=20
>     *ERROR* GT0: illegal register in save/restore workaround list
>=20
> Looking at the other dmesg output, I think the problem is that we're some=
how
> adding the RCS engine's instance of CSFE_CHICKEN1 to each engine's save-
> restore list rather than the engine-appropriate instance of the register:
>=20
>   <7> [305.651033] xe 0000:00:02.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0:
> Applying rcs0 save-restore MMIOs
>   <7> [305.651079] xe 0000:00:02.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0:
> REG[0x20c4] =3D 0x3f7e0306
>   <7> [305.651121] xe 0000:00:02.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0:
> REG[0x20d4] =3D 0xc080c080
>   <7> [305.651164] xe 0000:00:02.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0:
> REG[0xe48c] =3D 0x02000200
>   <7> [305.651202] xe 0000:00:02.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0:
> REG[0xe49c] =3D 0x40004000
>   <7> [305.651239] xe 0000:00:02.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0:
> REG[0xe4c4] =3D 0x08000800
>   <7> [305.651276] xe 0000:00:02.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0:
> REG[0xe4f0] =3D 0x00020002
>   <7> [305.651315] xe 0000:00:02.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0:
> REG[0xe7c8] =3D 0x00002000
>   <7> [305.651351] xe 0000:00:02.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0:
> REG[0xe7cc] =3D 0x00009000
>   <7> [305.651692] xe 0000:00:02.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0:
> Applying bcs0 save-restore MMIOs
>   <7> [305.651730] xe 0000:00:02.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0:
> REG[0x20d4] =3D 0x00800080
>   <7> [305.651765] xe 0000:00:02.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0:
> REG[0x220c4] =3D 0x3f7e0306
>   <7> [305.651796] xe 0000:00:02.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0:
> REG[0x220d4] =3D 0xc080c080
>   <7> [305.652125] xe 0000:00:02.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0:
> Applying bcs8 save-restore MMIOs
>   <7> [305.652164] xe 0000:00:02.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0:
> REG[0x20d4] =3D 0x00800080
>   <7> [305.652202] xe 0000:00:02.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0:
> REG[0x220d4] =3D 0x00800080
>   <7> [305.652241] xe 0000:00:02.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0:
> REG[0x3ee0c4] =3D 0x3f7e0306
>   <7> [305.652274] xe 0000:00:02.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0:
> REG[0x3ee0d4] =3D 0xc080c080
>   <7> [305.652596] xe 0000:00:02.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0:
> Applying ccs0 save-restore MMIOs
>   <7> [305.652629] xe 0000:00:02.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0:
> REG[0x20d4] =3D 0x00800080
>   <7> [305.652662] xe 0000:00:02.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0:
> REG[0x1a0c4] =3D 0x3f7e0308
>   <7> [305.652691] xe 0000:00:02.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0:
> REG[0x1a0d4] =3D 0xc080c080
>   <7> [305.652723] xe 0000:00:02.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0:
> REG[0x220d4] =3D 0x00800080
>   <7> [305.652757] xe 0000:00:02.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0:
> REG[0x3ee0d4] =3D 0x00800080
>=20
> I.e., we're seeing 0x20d4 in the bcs0, bcs8, and ccs0 lists for some reas=
on,
> which the GuC firmware (properly) flags as invalid.
>=20
> I *think* that might be because you accidentally put the
> "XE_RTP_ACTION_FLAG(ENGINE_BASE)" outside the SET() rather than inside
> it.  The one downside of our magic macros to created nested RTP structure=
s is
> that the compiler doesn't notice when we accidentally misplace the
> parentheses, and it can lead to really strange behavior.

Yes that indeed was the problem.
>=20
>=20
> Matt
>=20
> >
> > Working on resolving this now. Will update once this is fixed and
> > patch with comments incorporated is ready for review.
> >
> > >
> > >
> > > Matt
> > >
> > > > +		  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0),
> > > > +				     CS_PRIORITY_MEM_READ)),
> > > > +		  XE_RTP_ACTION_FLAG(ENGINE_BASE),
> > > > +		},
> > > >  		{}
> > > >  	};
> > > >
> > > > --
> > > > 2.25.1
> > > >
> > >
> > > --
> > > Matt Roper
> > > Graphics Software Engineer
> > > Linux GPU Platform Enablement
> > > Intel Corporation
>=20
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation

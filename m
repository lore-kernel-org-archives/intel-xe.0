Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17694E95A82
	for <intel-xe@archiver.kernel.org>; Sun,  8 Oct 2023 08:07:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE16510E0C5;
	Sun,  8 Oct 2023 08:07:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBCF510E0C5
 for <intel-xe@lists.freedesktop.org>; Sun,  8 Oct 2023 08:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696752418; x=1728288418;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=43tOIKHasZH4vEy/AWZ12hPvZ/S2CIz/iaTkN4Mc7UI=;
 b=SLoRnL4xKfTltMew/SmI+Dn/SXISZNf0dMn0J+FM6mr5kClvf5N+OmUH
 xonZxm8TeuMPC2xDFBrdrYZnqtJMchPefOfGguvCjgAdcIELBYr2/cUSI
 ZEFv89eqcF+3WEoPp5JjCW80TzG9s11pnBd0Yw++lhzx2JGVvYHDEuEb5
 d2f/JsBVfHMTASXDMwRBuTJBLShcsM202pXNI5gXZnaHlNhrHJreEGwiI
 APpG2RcqiQ70McquSaFpWNQ7c0qY5Iao824RbabTpxy8qr1NC35VeenoR
 G7L5MNdFULrLoNDfo/CWLtM0RTogyHXfJQ1XGL88ZxIgkoLei3hyPTNHL Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10856"; a="369049683"
X-IronPort-AV: E=Sophos;i="6.03,207,1694761200"; d="scan'208";a="369049683"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2023 01:06:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10856"; a="752688443"
X-IronPort-AV: E=Sophos;i="6.03,207,1694761200"; d="scan'208";a="752688443"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Oct 2023 01:06:57 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sun, 8 Oct 2023 01:06:57 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sun, 8 Oct 2023 01:06:57 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Sun, 8 Oct 2023 01:06:57 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Sun, 8 Oct 2023 01:06:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z9Wi3vwhHsi1BKu4zw7EgrxQfETVTzzAGwAfzDNcoFA+xqzI+CpCm96xeVaX0DPrVZf+6nHrUJ9DKNGcZ19YtFwuY1muboBUuMPVqJYeEMIqunp8W8RS8QJLIv2MO6TgbZ4p50PwSHMoY/yup7jQaVwdgHg5HVjG6L9tGnOao4WOTbFwpeV6F/Zm4pRYiwwlaOUTiRfl4ATGxgDzHYPonbyaydFtSvf+LE39Zl/mJ1Na1OJRV0+xuz/fSLoXfOSTjmzmCRrTEJf52ke7nT5ozWAfFgQ9TKODsgyrRhbdkV7kzulRCaHCRgpr+cX8bouHS1Km+Zw3z8cxhnV3Wx4ZeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8zi///mJSfrrsnVwiWfHOCASnEVJ5PSE1UbTDayb55I=;
 b=NntCGzCit0kveMTXazoWZxwYmfUbj0qBxVkrNxDGipVqAKNAqzuTbycU7oxOQ4t1t1d9ybjd1VkRgRS+3rbwsEhRqCPRwaFh3euUbLWf4Oj3OTcpuYRhAz0YIRA01C9xuRgm+xnYDBpVHutOBJXCWxj/WxfJbuE2sAQ7dcC9c5asdpvjfhRAMUoaQhwjwsA0+6RrYtnyMzEW8IEJti6LhvxgZFRcUs5kWqU12SmIBV2HtTgg9DVPjMvljPck3XyXWlsRjdo7tIB9vmhJYlm/UAzHeDwETlMpmrrpgTwHy4fInEEJXlGvqdF+tHYwm5Nq1RNzYbIvHBDPpsU3Rf+ZRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5579.namprd11.prod.outlook.com (2603:10b6:510:e6::10)
 by PH7PR11MB7549.namprd11.prod.outlook.com (2603:10b6:510:27b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.25; Sun, 8 Oct
 2023 08:06:55 +0000
Received: from PH0PR11MB5579.namprd11.prod.outlook.com
 ([fe80::e64a:36b1:582f:7415]) by PH0PR11MB5579.namprd11.prod.outlook.com
 ([fe80::e64a:36b1:582f:7415%6]) with mapi id 15.20.6838.040; Sun, 8 Oct 2023
 08:06:55 +0000
From: "Zhang, Carl" <carl.zhang@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Thread-Topic: [PATCH 00/17] uAPI Alignment - take 1
Thread-Index: AQHZ6wUYBUYR0sJUYk2okSkei+ENpbAk5+HAgAJPD4CAGBjvkA==
Date: Sun, 8 Oct 2023 08:06:55 +0000
Message-ID: <PH0PR11MB557979E0DEBB178707AF118B87CFA@PH0PR11MB5579.namprd11.prod.outlook.com>
References: <20230919142504.91652-1-rodrigo.vivi@intel.com>
 <PH0PR11MB5579513043AA7308CDC8C47687F8A@PH0PR11MB5579.namprd11.prod.outlook.com>
 <ZQ3jW8OwB3M3LdDs@intel.com>
In-Reply-To: <ZQ3jW8OwB3M3LdDs@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5579:EE_|PH7PR11MB7549:EE_
x-ms-office365-filtering-correlation-id: 994f8343-ad06-4866-5e89-08dbc7d58980
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oKILkQFpO9N6FmAp/QeaU9NUf5AmeYb/CRqWCDdMgMLI6BSWkyUjxRanNzxm+RC2JlBAeKCtcmLArm9EwOwXgMsQzEaoAMyqQCYztdj/iHKF/k+070WKvCXwd/LylzA0eY5EM383qgLxK5Wv5fbo2saGap/q1+aTDDVOaFLSYBNizzWKBDUv33ISNwp5LUGEZLHvnapw+VjMl4ROJfGZawhMONnwsrF6TUFSckm8X/M+ImTLZ44Su4B+NAL/6eZmow+aLMzTn3b6uWyDCOQTGdLxvEbtAputs7bm9LoDVZqiaGuFg5XEroX2jieBJgfXykBhG9KIIq4YENReNCNxC7vU9UUTAlW5HB46WxZ5rq4hdii1gTW7fZrGZAFFLHpqdI5Q2o1kq06Vt0vLDyW18HB1ZXYPxvzt2a6qLJZnNEwmJax2OhsaDVD4RzIiujPY0LmTAq7tPVgOZcFwlXL0YjK3tVv/8n2ym9miEmYxyMH7V5aAAIe2d7IHbCeL0jURZWMHpeMiD8ObRZMFrI4ab2cX/Wezj6Yi76Bq78i2nH2Mv3Wnrrpfp7yM6eH1jJ9IK05yKqzpjEH0oXGBJWdqM7SO256PZz0IX14oBNym34BfAkTY+3vP02BisScnhJ2x9wDi2jvtNUFqRNeyijgvVQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5579.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(346002)(396003)(136003)(366004)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(9686003)(7696005)(2906002)(107886003)(66946007)(76116006)(6506007)(33656002)(82960400001)(53546011)(478600001)(66556008)(71200400001)(66476007)(4326008)(966005)(66446008)(26005)(6862004)(122000001)(38070700005)(83380400001)(54906003)(316002)(5660300002)(64756008)(6636002)(55016003)(41300700001)(52536014)(8936002)(8676002)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?r9N9Q9OoiUunf5+/70RfGLVSokdwqOHk/TvL7EP+6dgUZ9LnxTKKtSF6Z1jh?=
 =?us-ascii?Q?nQ7v5zqHObv+9ZoAF2Z/7QRoALyUXmBZyXV7zueCSVEzJXEOwTVI62C8qune?=
 =?us-ascii?Q?H13sD8Yelq41hk+DSjEUvCarJM94P+LTvqHmM6nzRXCpAiSTaxARq5f09S6C?=
 =?us-ascii?Q?wbIFb9Z7Dit1IVXyiCdeAEHOoHE34K8TyPsecp3kWaJSGPPS5//Id44rcV2j?=
 =?us-ascii?Q?OI/kTzwxZtumrfDT0hkGEzQq0t8RBoM69O490I70/W595lmp/vUJCcpGLAz4?=
 =?us-ascii?Q?cby4OHnG3DD+Ko8hDKlI/KRNBYoj/qpqk28LjVwETBtUt3ZxcULEIzGSaO2m?=
 =?us-ascii?Q?xRHVgz1sn6FGFv68+gtcqh50/dSpKpa73+XqkwVq+Pd6taNpEx2e0WjqltBn?=
 =?us-ascii?Q?ojedYALUA93peiH0sKh9r7T/RHt0Y9dR6fd5wTlwGpa2kFqnJst8SGvil9Ph?=
 =?us-ascii?Q?nFYo1cmn1rkhsBJZak9iTcfe2I9YSpcycbjKIB4GDefU3TQwN8SqzXX8hO60?=
 =?us-ascii?Q?GeT4f666b6w7879DzQGxf1mmfkhDZcTVmQw7gpWAYIFBH1LvTVsOKrXWOcPy?=
 =?us-ascii?Q?Qb5hfs6Fh/o5kD8qcAZ1KqHUnaI8bhF6F8NfPLidE32+CUkwsL1Ptmye9+hc?=
 =?us-ascii?Q?yhsw6XPHf4INS1kh+vHVkJwnYp9BsHAcAvnHsFtSvzpruCqoYz7dwIa8XAaU?=
 =?us-ascii?Q?tlwd5np9tr+p/2rx8m6COKrTMQEipycdUnjjSjB1LvcLYbDCN5o45Nar03q3?=
 =?us-ascii?Q?sXJEu9THvfTq6aeHjxRiXSpCYZTv+OrXbt2CDOkILCdKsAzIybeT1UWZIz5H?=
 =?us-ascii?Q?PlSWChEd0NXSey49gKtfXuIXhYkSucF4/9ztwS5wGW50ctR5WBoXsuBUMVM9?=
 =?us-ascii?Q?A/5DRK5AKm3sgCaZigA0uAxWWruzhGA+FAVPa3Pg+/XoGzu/mxWg3ELCk4qe?=
 =?us-ascii?Q?D9HwaR8nCUgaDcHqbHRUoesP7WlhUrAA/QjW5ZUewG4wBylqbaisi7C4qxeZ?=
 =?us-ascii?Q?p+nODJiKpk8VAz4xhG1RrcoRyPjSKtdh4EnsqqGR+nJ2c999YRkWGYO+TIiy?=
 =?us-ascii?Q?1Oyc88UVhnLDQTQlFZwPYMWa1WIJ8aaKne76NyTI3VTDl+36a0fxObLYvJHe?=
 =?us-ascii?Q?8jPINj3kH2Pi9R8LBLW/XylV+Z/AYVUS5XD957dJSCzw9in2RPwzMfIPGbX7?=
 =?us-ascii?Q?rdyhRhFidht2XnQ09zT6yBoj64tdx64W1MgJqQGKueiljMVDiU3LKgBXpSJf?=
 =?us-ascii?Q?uoKq7yrZj3WQq7kP1qpTaAooyZWzdj96hftOIJboaOJ9Mk0A5zsiA6nMevR3?=
 =?us-ascii?Q?Lb5B2IMUQ7y82uX5waTFNzNCVRxtAgt81841jym9oQIIzCBDdnhDpVONQja2?=
 =?us-ascii?Q?E2UUeu0KIchKGqONFfOtZwIhzTY38zdcjfyWNRmJwmqr2T9Y5uR1yhB6w71Q?=
 =?us-ascii?Q?UIo4w0mWh6ALd0I+vSrtrec9dGHdamkjjWv3pV3EUzHc5+79hq4WF2n9M8eF?=
 =?us-ascii?Q?I2v6pjS+5EQCqbbKK/+8qC0iIIHu0S0nilgYKQYI3KfsjfGF5Z4xOPypDs+v?=
 =?us-ascii?Q?TSGuddHlPevWD+sZ/ktZVjApme/ujOfwkH6yxwns?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5579.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 994f8343-ad06-4866-5e89-08dbc7d58980
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2023 08:06:55.1326 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 93s41TLivB5yik4SSgwLGk3zhkzU9FczEdgQd+hO30U+IqGX+pg7luJId+nop6fx0x0Z7VghwBKiwZxXR4O2gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7549
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 00/17] uAPI Alignment - take 1
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
Cc: "Kopryk, Kamil" <kamil.kopryk@intel.com>, "Hazubski,
 Filip" <filip.hazubski@intel.com>, "Chaberek,
 Jakub" <jakub.chaberek@intel.com>, "Yu, Effie" <effie.yu@intel.com>, "Dunajski,
 Bartosz" <bartosz.dunajski@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Rodrigo,=20
I checked v5,=20
About=20
[v5,14/20] drm/xe: Remove async worker and rework sync binds

-#define DRM_XE_ENGINE_CLASS_VM_BIND		5
+#define DRM_XE_ENGINE_CLASS_VM_BIND_ASYNC	5
+#define DRM_XE_ENGINE_CLASS_VM_BIND_SYNC	6


My question is: bind engine is separated to SYNC and ASYNC
Media is using default 0 as binding engine id. It is sync or async?

Thanks
Carl

> -----Original Message-----
> From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Sent: Saturday, September 23, 2023 2:56 AM
> To: Zhang, Carl <carl.zhang@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Hazubski, Filip <filip.hazubski@intel=
.com>;
> Kopryk, Kamil <kamil.kopryk@intel.com>; Chaberek, Jakub
> <jakub.chaberek@intel.com>; Dunajski, Bartosz <bartosz.dunajski@intel.com=
>;
> Souza, Jose <jose.souza@intel.com>; Yu, Effie <effie.yu@intel.com>
> Subject: Re: [PATCH 00/17] uAPI Alignment - take 1
>=20
> On Thu, Sep 21, 2023 at 11:06:24AM -0400, Zhang, Carl wrote:
> > Hi Rodrigo,
> > Have a quick review,  several questions:
> > 1. we need add pad in drm_xe_engine_class_instance, in the future, medi=
a
> may need to distinguish slim vdbox and full vdbox , or other special
> configurations.
> > So, reserve one word  should be suitable for future use. and then the
> structure length become 8 bytes.
>=20
> it makes sense. let's do that.
>=20
> >
> > 2.  no clear description about DRM_XE_DEVICE_QUERY_HWCONFIG, even we
> > know it is in intel_hwconfig_types.h
>=20
> Yes, it is that.
> We also need to make that clear.
>=20
> >
> > 3.  about query GT, if the there are multiple tile , and it is symmetri=
cal, which
> one will be MAIN, which is REMOTE?
>=20
> right now, in an hypothetical scenario where we have 2 tiles with 2 rende=
r GTs,
> we would have 2 main GTs and 2 remote GTs. Is this a problem?
>=20
> >
> > 4. no method to query HuC readiness .
>=20
> We are already discussing this and the trend is to extend the uc_fw_versi=
on
> that Jose implemented for guc to also work for huc.
>=20
> >
> > 5. XE_QUERY_CONFIG_NUM_PARAM is only used to represent the number of
> query type? And it is actually useless, no one should use it.
>=20
> I agree. Let's remove it.
>=20
> >
> > 6.
> > +/** struct drm_xe_ext_set_property - XE set property extension */
> > +struct drm_xe_ext_set_property {
> > It should be VM set property extension
> ( XE_VM_EXTENSION_SET_PROPERTY)?
>=20
> Please take a look to patch 11
> https://lore.kernel.org/all/20230920192940.135004-12-rodrigo.vivi@intel.c=
om
> It looks like a generic struct for all the possible set_property makes mo=
re sense.
>=20
> >
> > ps. I still not clear why we need extension for single bind operation.
> > :)
>=20
> Every ioctl in xe is extensible by design as documented in the xe_drm.h.
> That apparently matches the Vulkan extensibility and the desire is to mai=
ntain
> that everywhere so we minimize the changes of creating new versions of th=
e
> ioctls later.
>=20
> > may raise more question in following days.
>=20
> Thank you so much for all the review and comments so far.
>=20
> >
> > thanks
> > Carl
> >
> > > -----Original Message-----
> > > From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > > Sent: Tuesday, September 19, 2023 10:25 PM
> > > To: intel-xe@lists.freedesktop.org
> > > Cc: Hazubski, Filip <filip.hazubski@intel.com>; Kopryk, Kamil
> > > <kamil.kopryk@intel.com>; Chaberek, Jakub
> > > <jakub.chaberek@intel.com>; Dunajski, Bartosz
> > > <bartosz.dunajski@intel.com>; Souza, Jose <jose.souza@intel.com>;
> > > Yu, Effie <effie.yu@intel.com>; Zhang, Carl <carl.zhang@intel.com>;
> > > Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > > Subject: [PATCH 00/17] uAPI Alignment - take 1
> > >
> > > As a result of the uAPI review efforts started by Thomas[1], we have
> > > identified many updates on our uAPI that would lead to breakage in th=
e
> compatibility.
> > > What it is not acceptable after we are merged upstream. So, let's
> > > break it before it is too late, and start upstreaming a good, reliabl=
e and
> clean uapi.
> > >
> > > Most of this work on putting these patches together for a single
> > > shot was led by Francois.
> > >
> > > The IGT counter part of this series is available as well[2].
> > >
> > > [1] -
> > > https://lore.kernel.org/all/863bebd0c624d6fc2b38c0a06b63e468b4185128
> > > .c
> > > amel@l\
> > > inux.intel.com/
> > > [2] - https://lore.kernel.org/all/20230919142000.91363-1-
> > > rodrigo.vivi@intel.com
> > >
> > > Ashutosh Dixit (1):
> > >   drm/xe/uapi: Use common drm_xe_ext_set_property extension
> > >
> > > Francois Dugast (4):
> > >   drm/xe/uapi: Separate VM_BIND's operation and flag
> > >   drm/xe/vm: Remove VM_BIND_OP macro
> > >   drm/xe/uapi: Remove MMIO ioctl
> > >   drm/xe/uapi: Fix naming of
> > > XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY
> > >
> > > Matthew Brost (4):
> > >   drm/xe: Fix xe_exec_queue_is_idle for parallel exec queues
> > >   drm/xe: Deprecate XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE
> > >     implementation
> > >   drm/xe: Rename exec_queue_kill_compute to
> > >     xe_vm_remove_compute_exec_queue
> > >   drm/xe: Remove XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE
> from uAPI
> > >
> > > Rodrigo Vivi (5):
> > >   drm/xe: Kill XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS
> > > extension
> > >   drm/xe/uapi: Document drm_xe_query_gt
> > >   drm/xe/uapi: Replace useless 'instance' per unique gt_id
> > >   drm/xe/uapi: Remove unused field of drm_xe_query_gt
> > >   drm/xe/uapi: Rename gts to gt_list
> > >
> > > Umesh Nerlige Ramappa (3):
> > >   drm/xe: Fix array bounds check for queries
> > >   drm/xe: Set the correct type for xe_to_user_engine_class
> > >   drm/xe: Correlate engine and cpu timestamps with better accuracy
> > >
> > >  drivers/gpu/drm/xe/xe_device.c           |   1 -
> > >  drivers/gpu/drm/xe/xe_exec_queue.c       |  99 +++-----
> > >  drivers/gpu/drm/xe/xe_exec_queue_types.h |   6 +-
> > >  drivers/gpu/drm/xe/xe_gt_types.h         |   2 +-
> > >  drivers/gpu/drm/xe/xe_mmio.c             | 102 ---------
> > >  drivers/gpu/drm/xe/xe_pci.c              |   4 -
> > >  drivers/gpu/drm/xe/xe_query.c            | 187 +++++++++++++--
> > >  drivers/gpu/drm/xe/xe_vm.c               | 221 +++++-------------
> > >  drivers/gpu/drm/xe/xe_vm.h               |   1 +
> > >  include/uapi/drm/xe_drm.h                | 280 ++++++++++++---------=
--
> > >  10 files changed, 402 insertions(+), 501 deletions(-)
> > >
> > > --
> > > 2.41.0

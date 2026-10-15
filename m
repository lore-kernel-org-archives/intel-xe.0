Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0993FCC6B1C
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 04:12:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B100D10EB63;
	Thu, 15 Oct 2026 04:12:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65C2810EB63;
 Thu, 15 Oct 2026 04:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792037523; x=1823573523;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Sx594JrmXXyBqHOnjVpw/4ilG7eJwzaJJQNb0eEz4wU=;
 b=BoVmghNlRE7t+Jl82PJYlC4e8uB/uildy1S9kYjYvR5vqLX4+RLYxGCy
 CNcGu64AZzFCD9J+L49nE3Ap8bVStpVohM3NlHwCRCZZsoBvdQpR89Zie
 WikPqjB63wDFbutQ6QTmLVwifJUivPJj69spuNAcRUme5Hn+DrVpiY3/J
 XlamdJGhEfBPwVdlLD7/J6UHSDOB5qYb9bEz2lwKOxcqPWHcuNPMdF772
 DAOwvkbYMOrS0W/m3D5GuyOIcTDQUWb9y1p+Io8szwoU/K5/aEFRNa6T4
 E3S25OhTzSPcOgl4TBjCUg1IMZ796CVBT/psTslCmU91cZzsdA3xfZ9TV g==;
X-CSE-ConnectionGUID: nLXN9gScSl+gpmnzeeYDzA==
X-CSE-MsgGUID: f7Ca7jKBS6K/aIh55XC/lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="784230"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="784230"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 21:12:02 -0700
X-CSE-ConnectionGUID: 61EztEE1Rz+jGpSiW53g0w==
X-CSE-MsgGUID: liq9Llq6Tg+NAk1AW0Icrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1610881"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 21:12:02 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 21:12:01 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 14 Oct 2026 21:12:01 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.70) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 21:12:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NA+/03DqSwQcUh2zaJRXYVOIS1yx6qC6wdXRFMv7uaOHUo/o2E7gX37f0YvnSBJbdgXBQiqDjVDqLn08SoNbm1cKUTpVvkBWohFv/H8bvmi1PCJ71m5bwdy6+nZfgnvRx0tPpuH/Gciw/+O+Hjbh0C5AWFsUm5z/+XAEtUWVAQZDiFdQSJjuLip3QpYiODkVWJ22ahoy8JcrW32IWSASqCJ9BljxBPfyYa/hRX39NVxtp/1unoP4EwP+XDS+2p2eCWDCPBx6KK82qZP10odXWZQVzA+AF/+3FPYUvdbHvC0xTew0JBl8YiD1f0+QAlHMTuwcPX/rSfMiOt7kuPIy7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3/1TL7Qz+HyoIXrqt4Z3fXGPLXQrv4w7irw7hYllgKg=;
 b=D6QejA0TQJAP6PSZYXQdj2QVy8Pz2DhU2KjFuoHSl0rmoLOMgqJl5dOirGqZSCyk+RB1Wxo2YDmgUiLFLTUyE8taYnqXvvEzxhRe/u73BvmDucMDCojwZRxwYV/iVwcQdisgTWM3VntzwjfZzjUXr4ppqgSd1U1FuNzXMAw9nQZ5LNLyb18TIJ23GUHwy+CDlLTWNeYsDeD4UFZP8LfhkxJfXWNfKt6CKqLQrBxPpXh0pJiJbZM0phv9QcIMEtewcPdUx1+82XzOZBgaDsRF2cI0ZCZJ0//wBT3z5xkhIFHPMFghGwP6ZOPxI80OwAApgeReAeBdY4SvjO+tN6C4hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by SA1PR11MB5898.namprd11.prod.outlook.com
 (2603:10b6:806:229::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Thu, 15 Oct
 2026 04:11:54 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff%8]) with mapi id 15.21.0522.011; Thu, 15 Oct 2026
 04:11:54 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Kahola, Mika" <mika.kahola@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Deak, Imre" <imre.deak@intel.com>, "Kahola, Mika" <mika.kahola@intel.com>
Subject: RE: [PATCH v2 3/4] drm/i915/lt_phy: drop the unused pll argument from
 intel_lt_phy_pll_enable()
Thread-Topic: [PATCH v2 3/4] drm/i915/lt_phy: drop the unused pll argument
 from intel_lt_phy_pll_enable()
Thread-Index: AQHdW8pI9eMrUbCEHk+9nBkO1kRC27b9/uWw
Date: Thu, 15 Oct 2026 04:11:54 +0000
Message-ID: <DS4PPFE901A304F174885C52087E0E27A46E39C2@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20261014105306.2761683-1-mika.kahola@intel.com>
 <20261014105306.2761683-4-mika.kahola@intel.com>
In-Reply-To: <20261014105306.2761683-4-mika.kahola@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|SA1PR11MB5898:EE_
x-ms-office365-filtering-correlation-id: 411b263d-738d-4b7e-5f2f-08df2a727274
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|38070700021|56012099006|261009223027099003|11063799006|4143699003|22082099003|10067099003|18002099003;
x-microsoft-antispam-message-info: 6ABhEpFS/NAikH88BC821emDrnEiwmEfiQQcDqin33rdd8UB8NUIEN26SdxOd4B3frc0aRAshdQDEw0hnSFycOTxuNzf0J9ml26ncLoxfndwx1DsASSciXlt/V4JjKehd7e6hjrTcB68mySFKOQCeBBwLIY+2WEEOPDtvUnV5qOlJ/7YOVZ5NblHFU966LV+stDeUJvAby+tlZL0SAX7IOequyjt2kZ90oQyreHdqzT+5jlKBrnSDZR921wJZ9r6aFzh30GNNnz2lP4wuIsgGM2+DqoMEZpFW2fYzG6CEu6JA6XoLXv9zOnaelHEyV+SfVHss7WAoD4N2ZSIjWHp9QtRHDR92/urKcfxOlCx0QzLJEzah7RSExys1lLxTzpyN15s4QolDJy2o+LuEOr+wiT46vmoqFJiKxl3fL7+OoYmxgJHu1bEc70G61TM/jdGy1QWVb5JPS34YPKQMDP3Hu+THGqUnGTXe9Zp4d18wcgTv2b31Yqm2yjF3falGwCvNkMcPo3Zx4jNxZLZUCQspfWMx8jhnLp6ufKeQFe9QTw7L5mLzjWFdSK/nPWM8MdnM5RcMqFokGQUnZvfaplKVbONgVvNxHOJ/hpAHmlM76RmGOXMPlnYX6lfpx5sZ671tX1KTFninycxR2jDWXZLXURDPHPSDwj3MfFlwJEZfdNOVJgQMDqDqmKV7QHTtvn3bzQ3NsKqbvci7mEZLHMTlg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(38070700021)(56012099006)(261009223027099003)(11063799006)(4143699003)(22082099003)(10067099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5/EiVT1N6C/oa1BQNMlpKD5Slr7thUxW+4gWNewpGOG71uep3i/C8XN8NjIo?=
 =?us-ascii?Q?4rCL3ZhW52ysMqL8E8ebHTtX0IAsVaPTdtQ2RewUuwY8jmmUXnXyntxSPleR?=
 =?us-ascii?Q?D9hxfzOng296fPnaKcYVbYUQL27uvnBDVHNCKJi2V6K8j0KWBezzDV65svY2?=
 =?us-ascii?Q?2JIcLoSqgTr95pxh1jAl3lc/4UAClPC+94kgheda+eeLs4wPDZ9+A+679JaJ?=
 =?us-ascii?Q?BkIkqBj0F99xVdPZ/39ea5qA6gC7rh4iH0sJgUXKIrWmQMtcveb0YIw0vWa1?=
 =?us-ascii?Q?Zp/t47q7t35jjGlN93I+MTDGN6EWQuK7oQkVy7m+w2Yg+wqrTVnsdesmgKjk?=
 =?us-ascii?Q?slN4DzxZ5Mm8pCzGCRzQbnHmDj4j3znLu7sReR3UcFu0BZ01dyEXdj6hrwZx?=
 =?us-ascii?Q?xqFu7c7DVahmTorb7l8YR1mOK9+9QbyF8h2kok7GPCDW+4bOmdHcNvcw6zrX?=
 =?us-ascii?Q?kxqb7DyI1JPOyR1EJjDe932oiqvhx+T51QI+oPH6SRqAFyRrdQ30QY3YjUfb?=
 =?us-ascii?Q?fca1hZgAobZCpqUjG9pPzU/vzf+i6GEdADvvTyaQm7G45ZM8zHk3mF5jcFB6?=
 =?us-ascii?Q?zgWjsM5qx7oAfZ8H9373YYcKtUwLOGUctJAPI7M+7xSw3Mw65epJw4qSpNYR?=
 =?us-ascii?Q?HT6RglK4FsKi85+NXNg9U3gWuWp5yNHRmETnSsPv30RNPwkZmP1KS4CT0AHj?=
 =?us-ascii?Q?msGEeMIKaRNOUtDI6P+ZSj9hO4Rj8Tqy0TdOOpiJQOJzNCIvAkCyp/4VS5yl?=
 =?us-ascii?Q?Zz2FNJDeM/DB5/Zqhc+6q0FY7KanUA6e5LTGTs7loFqk5VHOfa9cgQ9/AwC9?=
 =?us-ascii?Q?dE26/cgJnpck7v1mbUcp8CCLe0AxptAJMj3KDcp/FZGhnSlP0yyco8C8/73Z?=
 =?us-ascii?Q?CjzWHCvnoBOP608LTrso7dYym4mHSBLo0prIp+gu2Bq4FL/ppt4LKVj840L5?=
 =?us-ascii?Q?EDBrI0AqPLUaO1jIr78RhOq7ZCXjj3rCcb+irUjvPxTHoQJ6qgOUxsLBEH1O?=
 =?us-ascii?Q?55KlPOv8dFFYEJb/F4Rbeheh8XpdYv2ZLNfzSivD2gq3mIPynNK9d/T3ogwD?=
 =?us-ascii?Q?HthLSe3kVTxcvffwk9EUyy78ICBRZwC2N8+LZu5xdlEBB4shoQ3VFCu20fow?=
 =?us-ascii?Q?2aogQq8xZsCklY8j0sQNP4mQ0mSZREesjxpG/2jRiYCne17ndB4YtPWDoCKL?=
 =?us-ascii?Q?aDmMDAi34NM5qoU8JUUosm10hgP9eJgRuUtueLYyDh9HwGrYHed1YP5qoWYZ?=
 =?us-ascii?Q?UzNyWmeePFYU0algAhnf0g1euqSMUqXDs/vTgJUBX5T2jdLCUMExm891zCwc?=
 =?us-ascii?Q?P5SZItCd6QC2b+NadKYbAHavxqLzc0N4fWCDOj44JBSJeg2OxZXkus65wTmE?=
 =?us-ascii?Q?cBFSK4zpPpPYPVACqIVfHNLcyqnTCADJBRlrLe9hGf4gn6LleW+Bs+yHsBtV?=
 =?us-ascii?Q?cOVxvibMrVf1hcbGADNLFqbfAalRhNj3JNjfPTUqjSJ7GcEKYLfRr2VhYyBU?=
 =?us-ascii?Q?Tj2T/2YsKsVbuWyKX5xFwOsQQoyCqZJKWAtLlWT2FG0Lh/d/4UEuyvCuxXPe?=
 =?us-ascii?Q?Qx14l9BjVaF5aDIZErQHFmC1Q4E5Jq+zQGcWkxV+n8okdziYqwxbijqRVyUO?=
 =?us-ascii?Q?KpvqQl9tDM5HwCyqC9uvK4xKaA9FIpT1lh1v17oqMzsNJMQY5zIFg4Tp5kwP?=
 =?us-ascii?Q?SxIlMlqBGC4VjVQ89kbvdDmWPP44gq1GYrV/H7ISuUwUYOZE384H1O+oc3EV?=
 =?us-ascii?Q?UsA2milzOg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: YvWVjOnCGLDVywV4VSgRV7z1qg6avyT0YBhLUrvdFGgTnO0q6w/0X7Ldcb0ZkpkSwU+wmD88P3Ag0jjtDzdn0CKlJRD0SMY0uVvGVLihW3EpF8Z3hMepRL1a00pSlLR1pc8OU6h7BNXSi3dBi33LayTykA0CZB5M3fewscdOGUcusR64lVL1ZfV8BOL7S72SBp+mv7BaKvDvuygphajEKGacCCGYZH7AA76OWtGiA90D2YkH/oVnZbih/1zuAtz0E4bErZenG15s7rpxlKbfidZhekCMGpdi6qByaXj1F1sNUBm2vC3mXW1MSvNu7KEmVteiYMhdx7p7UnFxSCi9nw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 411b263d-738d-4b7e-5f2f-08df2a727274
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2026 04:11:54.3539 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: juvpA9jRJoZuIH/OETnTLm+x5K8UV9pRDBsYQur8fuQk+ecm1yvqeL6ricDG1ePfSlNdvyJ4hYHmBgzyLVmBfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5898
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
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Mi=
ka
> Kahola
> Sent: 14 October 2026 16:23
> To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> Cc: Deak, Imre <imre.deak@intel.com>; Kahola, Mika
> <mika.kahola@intel.com>
> Subject: [PATCH v2 3/4] drm/i915/lt_phy: drop the unused pll argument fro=
m
> intel_lt_phy_pll_enable()
>=20
> intel_lt_phy_pll_enable() never looks at the pll, it is there only becaus=
e
> intel_xe3plpd_pll_enable() forwards its own arguments. Drop it so callers=
 that
> have no pll do not have to pass NULL.
>=20
> No functional change.
>=20
> Signed-off-by: Mika Kahola <mika.kahola@intel.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_lt_phy.c | 3 +--
> drivers/gpu/drm/i915/display/intel_lt_phy.h | 1 -
>  2 files changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_lt_phy.c
> b/drivers/gpu/drm/i915/display/intel_lt_phy.c
> index c626246b71f9..e05fd23b8a65 100644
> --- a/drivers/gpu/drm/i915/display/intel_lt_phy.c
> +++ b/drivers/gpu/drm/i915/display/intel_lt_phy.c
> @@ -1924,7 +1924,6 @@ intel_lt_phy_enable_disable_tx(struct intel_encoder
> *encoder,  }
>=20
>  void intel_lt_phy_pll_enable(struct intel_encoder *encoder,
> -			     struct intel_dpll *pll,
>  			     const struct intel_dpll_hw_state *dpll_hw_state)  {
>  	struct intel_display *display =3D to_intel_display(encoder); @@ -2300,7
> +2299,7 @@ void intel_xe3plpd_pll_enable(struct intel_encoder *encoder,
>  			      struct intel_dpll *pll,
>  			      const struct intel_dpll_hw_state *dpll_hw_state)  {
> -	intel_lt_phy_pll_enable(encoder, pll, dpll_hw_state);
> +	intel_lt_phy_pll_enable(encoder, dpll_hw_state);
>  }
>=20
>  void intel_xe3plpd_pll_disable(struct intel_encoder *encoder) diff --git
> a/drivers/gpu/drm/i915/display/intel_lt_phy.h
> b/drivers/gpu/drm/i915/display/intel_lt_phy.h
> index 16de39484779..368ceedb1e0a 100644
> --- a/drivers/gpu/drm/i915/display/intel_lt_phy.h
> +++ b/drivers/gpu/drm/i915/display/intel_lt_phy.h
> @@ -19,7 +19,6 @@ struct intel_crtc;
>  struct intel_lt_phy_pll_state;
>=20
>  void intel_lt_phy_pll_enable(struct intel_encoder *encoder,
> -			     struct intel_dpll *pll,
>  			     const struct intel_dpll_hw_state *dpll_hw_state);
> void intel_lt_phy_pll_disable(struct intel_encoder *encoder);  int
> --
> 2.43.0


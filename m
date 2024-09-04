Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59263CD4853
	for <intel-xe@archiver.kernel.org>; Wed,  4 Sep 2024 16:53:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14A0A10E54B;
	Wed,  4 Sep 2024 16:53:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SZuFawpn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BA7F10E54B
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Sep 2024 16:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725468807; x=1757004807;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QKnKgo47jGavsBF418hYIY1Md4yO6uP9h8pdFvBjs38=;
 b=SZuFawpnpQ0tz2xjltwtMZwEdoMAynmHLCQ7OKqlT4G008PU8dyioJb3
 A7aptgLckkWmyicQjwKWpe1WlP3ERid9c/pzd4ZbXE4oEPJqdAlGvL2BY
 O7RmOZ8hnPEZ+BLlGEvq4iRKWhENgAiFQHzuOA+IX6ZvJ/pef9tExUeVx
 NBQsc9uQO8Un5YwSAm9JoOh+hgUnrlRkz2gNf12gVid/GRa5Sq5PfcjWr
 7YlwC3Y3nxf15e4umTEFN9ffWz5hz8DAmFGx3+7CxLvKA2Pnr+iTZ5I6v
 IfbK0OAKSl0TTQ18l3CAFU9kweagQsT8baFd0KUOycmN7J+F3CUx1JF6y w==;
X-CSE-ConnectionGUID: sAVmbJoqTNOHcgPup28Kng==
X-CSE-MsgGUID: XcCxtpXHRCSt2v58aaIdNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="24304239"
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; d="scan'208";a="24304239"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 09:53:27 -0700
X-CSE-ConnectionGUID: ORdkz35pR86LDWDFC9iJYQ==
X-CSE-MsgGUID: Ly7r1ylwQUW+G97vRqRF8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; d="scan'208";a="64981720"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Sep 2024 09:53:26 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Sep 2024 09:53:26 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 4 Sep 2024 09:53:26 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 4 Sep 2024 09:53:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nhJ2ado+67+cNa9JE+cfwk0jA+J8jXpULKmsRtGsDp8darF7ICDeAsQAKLuslA463qAh+GmhrnI7jzIdxJ4HWx7ERqQEy/0KoEWZU71Gqtsco3nzqkPblsqTwWGA86zvI0GLOfum4rsda8Vyv8nEwo4qGT44GEIG4kA7l+HxmaXYEpujPi42NCnmJKakKgTEjT50xcI0etmdVgmkpV5YM3TQt41t/lwfLmUk8HniyWX4e/10oWBoGsxMoGvEEmEav1DkWkpDsb0FKU06Z4btp8EUpkjR7ApvDwsF5Gk2h5NQRk2lm73NBRJosKQSSMSEJfLEfz6DpPJq6kpOA+fJ5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CMqvZmW0P3pqT4pAsFU46+FA57wOZVTlHpng+2LBGR0=;
 b=ETwr23fb4KfUtDjByXrG1NCNgdjQC71nwDtkt46ZiAxIhDLLT9LZM0PKWYfCf89NvzB80irORiwrNJrXEWumYkf1VA9UoQNv2im/iAJLeob8QkCCUP/naEmgpZdHY2cOUesYOuvN0hwwXP/LSI6Ew6yi+o6dkSJKFjNr1+xhfVo56sUemhF9KdZhd5cWYlg2Cr63x2K2s9vgru3K7/KWPeRzI/0Skr4HNpRM1TnNxgyErQJAIncitj9A09BnjWPYt/C7s7nYpOCfwafHFzFD8uwaQxoYZU65dJ9+P5GrAQ7IWcrbuq5gS5EXdfVMuYxSmU9nMD5vZK/Jq20sOS72VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH8PR11MB7968.namprd11.prod.outlook.com (2603:10b6:510:25f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Wed, 4 Sep
 2024 16:53:22 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 16:53:18 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 2/2] drm/xe: Update runtime detection of has_flat_ccs
Thread-Topic: [PATCH 2/2] drm/xe: Update runtime detection of has_flat_ccs
Thread-Index: AQHa/ua+cPL0lJBB2EmnuKCFRqCBAbJH1k5w
Date: Wed, 4 Sep 2024 16:53:18 +0000
Message-ID: <CH0PR11MB5444120C760AE4E6114E3FEFE59C2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240904162238.2831202-1-lucas.demarchi@intel.com>
 <20240904162238.2831202-2-lucas.demarchi@intel.com>
In-Reply-To: <20240904162238.2831202-2-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH8PR11MB7968:EE_
x-ms-office365-filtering-correlation-id: d02faa5e-0df8-421c-efc7-08dccd0213e9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?DDbpf4Ov9HRfZj6Ye1asICA4aWfC8qlIsQGB+S3Xm2bczFut3W83GwXVteHr?=
 =?us-ascii?Q?Rhyc5NiaTb8jnGH7bX3xwP829Z23W1VN4rRrOSAv5Yv6a+M5cssZ5fwdSWkq?=
 =?us-ascii?Q?GlPzqIdNl3B8eiDe+37EBI/6QRF5NaZDfXYJVvzG2yRPqBylcezcfTGWCdGR?=
 =?us-ascii?Q?J9NxpVjQH1KtmMEaYU5ouuy2twQb/Kbxxhx527C6PP9ly9z5u11my/wEAPKC?=
 =?us-ascii?Q?904KPRyucsaAS8MD18VNSbQXyru/3NIcWgOqA6nmJBg7WlcF2YkYBgXdasxm?=
 =?us-ascii?Q?F/DZUSVee+R3cQmuoPj79JU28R4Se8MhFNNSWa8XIHFALac08+0k91xp+a7x?=
 =?us-ascii?Q?m9CTRDdJ1Md3JcVm78E59v0gnWszfMQOpTNqSwspyv/re7YO5Od9VZ5LZ6wo?=
 =?us-ascii?Q?tfQlAHEbQegDtAl8IlG/YFOCr1V7Aq9hbHUn6g7XgUtF05X2NCToJvvU2agb?=
 =?us-ascii?Q?zwI8qNfs0Mxhw0pcJ5tqcCtKVEcfypVnlir5ba8POnxMDkb/fRTZCiOYbVyD?=
 =?us-ascii?Q?fCtqSGs4c/cYab0E4U0LWRr2P+ZlrwlieP9CEx00j2a6TpthQZtOaTexni+t?=
 =?us-ascii?Q?+YykO5suL2HmKG/2gm6AyQWvRt9Sg0fTUMUCB9SPOBqldGadzloJ7d722p32?=
 =?us-ascii?Q?1v9UjbeBHK1RsqAFbskG4xzEVajwRmFTEOtKzBAPuqGBc0g6wwuXo4ZnMzbL?=
 =?us-ascii?Q?TP7aV+8UMOMfNkvjhBbeQI89JzELIQSnMHuR3bANavDfCsFnHu9acxKZNoBg?=
 =?us-ascii?Q?14te3J24mr+7sifOdsxQX85zLo49z4wr2aVDHX7LK222Uk+xyjqm7aoA5vlb?=
 =?us-ascii?Q?lhLYfDzvw91KI3T+xkD2Sp8waYYEyS0PiEKFytQAudPmBQol5RAsqUryGeTz?=
 =?us-ascii?Q?9mJilqGpRTxD+zXe36XSrCu6T/PuSDAm9Atop7blgSE1bnG6nShso4nUW3Ra?=
 =?us-ascii?Q?WK7wVpcTO61rUZmb6RhrBaeQ65zEJ/QkHwtwS5jjG9uveTEfGJTGr6/UH063?=
 =?us-ascii?Q?Nfa+3P5iU7+1ud01WcU2X57FfG1RKIt2Yctwya3iSoE5V7znbihfKO+2hWhO?=
 =?us-ascii?Q?mjFomynfxu8UQdh6Lr1GlM6cJIwnKuqigIOlRDgKI0+n+/rXt4m2WOboY3q2?=
 =?us-ascii?Q?6HHnf7ginPnwwexOzghkEQXLCPcyb56HKLii2Ka0CUGvXB9gBvYJiEJyhKY5?=
 =?us-ascii?Q?f2tjTauT3+kS9PwxTEAP3VlWuu+1bEHRZcnlFm9ZCUOfeYWxPkSgBHyga+mx?=
 =?us-ascii?Q?r4mUOCTSzygi8vEcWnj2x8IYh78OBKFlZrrHoShg77uz58hZMAR5lTdO/Inr?=
 =?us-ascii?Q?IOYuCQOSPnx8+b8tmsw8nvqFfbRPu2ICtsL/NueTGlAHFav9yusrbPbpgN8A?=
 =?us-ascii?Q?aeB2KuTy7kW7xUKAXw5Zo8iVvDBAohESdI4a8ys6dI8sJPdH3Q=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?t8vzjyJcojohYgGhRUYNZGWokEkheygpQ1iNveP3blpuduY+aKSxp4neorlf?=
 =?us-ascii?Q?FdR5wNMqxwvu/lD8KvQHtIbFN6qY3p3/q/JjXlvKb6PNd8KxBfYa5gJCWKXC?=
 =?us-ascii?Q?Y8GvEQk0xOpLywNbh2ZR/DtWQNkii3CDIZTOkedevpV+xRC6jTK5vwKzADKm?=
 =?us-ascii?Q?OKSwJbdOiBLs36mIg3Ex15oeJQazOzHTcZakyKWr4bffktrLWnr0VR9LBXfo?=
 =?us-ascii?Q?IHDfOqYmwIv2oEvRga5ofXlcsFb2ozOn6IK9rJartQtTZYSAQ1ifjcatelCN?=
 =?us-ascii?Q?O+sejsCBMT06qa806m9qqPuLNNNyG53YSdnXkhHoQ+kCZPnJNmZBkOB7GdLr?=
 =?us-ascii?Q?jO7LuSUwYONDEvpmfl6T6Wqg2ok5nTM70xeBg10vNtjoMMvJX3ocpgiWQcUI?=
 =?us-ascii?Q?rRxfIir3pPpxoKyYdRtXP5Gtp1E8LTIiOaR+337Z4RsxLRxN3eEIa48QCn89?=
 =?us-ascii?Q?j0X+nIViAzVdGW5JbRZkIXaD3ym5rDAj08zGy8RQr9iHAFuEi5eZK6xCCm4U?=
 =?us-ascii?Q?UM2Ilfjdu7Gwhiu9LdkAisGClgJnOE1y/0CycP9uxW4EQEuVS4KSBhn1rFlV?=
 =?us-ascii?Q?mPH+AW+keWLhlB8D8dsIWgljsmzl19oj5IB83Q5Wk1A0FV11V86FnXMkRx1M?=
 =?us-ascii?Q?A42PiP9GVy3xrdIl8eJRCHVbCD82MxNrm9ml4yLK3hBopCSrCGZ67B4XFwp2?=
 =?us-ascii?Q?9ThlW1JjFneqsb5AyDhrv5WMxvu+4ltFpYMDapbzjncOyks07debdJF6YvoX?=
 =?us-ascii?Q?XcDnvYOcKg6ZlWT8B63u7z8zVMzuv7beR6quDYsR8RfIfwJAe0Iv9VeIwZ9K?=
 =?us-ascii?Q?8FE5rnxH7sF1POMljw9fcyT/EfwmHxESteK8IE1IDtguRXLKvkNDWw7cEggN?=
 =?us-ascii?Q?ZHKKFWljm7qP28wJv/dlbUUC3OFH72EkgNKFCW/0H4cNmE49dtwJiunA74Ub?=
 =?us-ascii?Q?uEgbU58+30K+Id8rFpA4OmU/Gncz81/2VRy/Ti4Ik6xW8AWcaYjisMm+wby1?=
 =?us-ascii?Q?ohyznJ3YxKb6VmpfYS5kMFQ2McLSYx5qOlOP91AhOglZrvrYDtpnSaCO6Xax?=
 =?us-ascii?Q?c/v4cIqIR12WRCj7ZJlF6a1IKRWsZQmjatFuWrOCIRGIeG83714zwZrvENdo?=
 =?us-ascii?Q?4ZbFD2TdrTXGvoD3nxSlRQ+Hkq7TY4vRJvJejxqIkJpTIQbLEd7DnCuQjLgD?=
 =?us-ascii?Q?vx9+Oae3h6ykI4E2v3mtTloEP9HQUVipF/9klC72nWeEcxdWDQCMxZZ4wHDY?=
 =?us-ascii?Q?3SOxw/WrYP/Y3mOXYUHJQ2f1rzr0RCaTHHZFyi7ULc0br1WJWyCEPu/7T17B?=
 =?us-ascii?Q?FgZSpB8AyD55QcI7jTBGOX+yppoM3JSdZXCRlO2tKnavhqR6hUrVto/nXDLw?=
 =?us-ascii?Q?ZII7CfBjPlqvlLOt0HhnZbLMxws03KY93tDuYalK4nkuRuUhVLMuCQBjtDJ5?=
 =?us-ascii?Q?W6jvso2w8RrFUygZfZFDN8e+BwIxIPAE+98B3MA5Rf8gx7BAUH9PxlIssku0?=
 =?us-ascii?Q?R4ZCWUTSgi2bf+PvQWd1++mZKuRGIX9HgSQ4AFQAO5F1XafnJajUQdHkU+PJ?=
 =?us-ascii?Q?SZZxaI+yDWoiuQGsd0qc54DTva0w2+i7bB7pKeoV?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d02faa5e-0df8-421c-efc7-08dccd0213e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2024 16:53:18.7274 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JCYe8YPlOEKXQZxJThwz02t3+KOtuu1Yt5/MpD1TYCeq1h2TU3A1Y5ol7f1rZY4k+iUHWwTp2o3GSeELpDRJkJ3EC3CCh3mdHfFlbj8NTKA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7968
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

-----Original Message-----
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Lucas =
De Marchi
Sent: Wednesday, September 4, 2024 9:23 AM
To: intel-xe@lists.freedesktop.org
Cc: De Marchi, Lucas <lucas.demarchi@intel.com>; Ghimiray, Himal Prasad <hi=
mal.prasad.ghimiray@intel.com>; Roper, Matthew D <matthew.d.roper@intel.com=
>
Subject: [PATCH 2/2] drm/xe: Update runtime detection of has_flat_ccs
>=20
> It's confusing to have a *set* function that actually probes the
> hardware rather than receiving a parameter. Rename it to *probe* along
> with prefix removal and comment in the relevant places that the
> has_flat_ccs flag may be overridden in runtime.
>=20
> While at it, fix the mixed declaration of struct xe_gt.
>=20
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

I'm guessing the issue here is that "set" implies that we're manually
changing the value, whereas "probe" means that we're checking what
the correct value should be and adjusting it accordingly?

This is just a rhetorical question to make sure I have the nomenclature
correct, not a blocking statement.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt
 =20
> ---
>  drivers/gpu/drm/xe/xe_device.c | 8 +++++---
>  drivers/gpu/drm/xe/xe_pci.c    | 3 +++
>  2 files changed, 8 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 1a0d7fdd094b..449b85035d3a 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -588,15 +588,17 @@ int xe_device_probe_early(struct xe_device *xe)
>  	return 0;
>  }
> =20
> -static int xe_device_set_has_flat_ccs(struct  xe_device *xe)
> +static int probe_has_flat_ccs(struct xe_device *xe)
>  {
> +	struct xe_gt *gt;
>  	u32 reg;
>  	int err;
> =20
> +	/* Always enabled/disabled, no runtime check to do */
>  	if (GRAPHICS_VER(xe) < 20 || !xe->info.has_flat_ccs)
>  		return 0;
> =20
> -	struct xe_gt *gt =3D xe_root_mmio_gt(xe);
> +	gt =3D xe_root_mmio_gt(xe);
> =20
>  	err =3D xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>  	if (err)
> @@ -688,7 +690,7 @@ int xe_device_probe(struct xe_device *xe)
>  	if (err)
>  		goto err;
> =20
> -	err =3D xe_device_set_has_flat_ccs(xe);
> +	err =3D probe_has_flat_ccs(xe);
>  	if (err)
>  		goto err;
> =20
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 8642c079bc65..94856ed6686a 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -677,7 +677,10 @@ static int xe_info_init(struct xe_device *xe,
>  	xe->info.has_atomic_enable_pte_bit =3D graphics_desc->has_atomic_enable=
_pte_bit;
>  	if (xe->info.platform !=3D XE_PVC)
>  		xe->info.has_device_atomics_on_smem =3D 1;
> +
> +	/* Runtime detection may change this later */
>  	xe->info.has_flat_ccs =3D graphics_desc->has_flat_ccs;
> +
>  	xe->info.has_range_tlb_invalidation =3D graphics_desc->has_range_tlb_in=
validation;
>  	xe->info.has_usm =3D graphics_desc->has_usm;
> =20
> --=20
> 2.43.0
>=20
>=20

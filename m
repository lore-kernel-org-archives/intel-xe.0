Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 217CDC021A4
	for <intel-xe@archiver.kernel.org>; Fri, 14 Feb 2025 22:19:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAFA910E08B;
	Fri, 14 Feb 2025 22:19:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hfqwNxXP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C642010E08B
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Feb 2025 22:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739571554; x=1771107554;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oFS6D0a5bm2iKFw3acuXp0rsbMZ6jGl6lh+MoHH6Awc=;
 b=hfqwNxXPqZ/rF1jGx1LYMbjWd6r2tkz92hi/7mVMMsxzfBH5UvCmWym8
 nuo6dvhCEjnIQbBFOUkfsSiGTpa2k+zJEyRB2IXRqOjX7Ag5iI5B/aN2N
 9rGF6QDkc7iipjOiTwIWjzKY/5lakjox4LYMkY3l+x/8ZHb04JAhaYeif
 i5yBewn8NqfR/pG0I9e9tH1BYlSGdB4JdMdCe0u4WLuuNvleO2kqu7pNh
 FsfKqLTN6Cyj823KIBF4eQsSUHL6Kf5U3YLU2Q38+I7bCKbSQrTPPA4Eh
 xfQyZyVepQhSkqKF+9pZYjMwua0ooUysSDjRV9ZkdWqWhj52j34iz9cqJ g==;
X-CSE-ConnectionGUID: JPyeGnl2S6CA4WmgsLju5w==
X-CSE-MsgGUID: l9AxNfIBRACiB86f92F9WA==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="51312595"
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; d="scan'208";a="51312595"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 14:19:14 -0800
X-CSE-ConnectionGUID: jIwAcSIjSF2P6mR02gBHnA==
X-CSE-MsgGUID: Oa6I7n1bQ5iNBo1Im6uatA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; d="scan'208";a="113298823"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 14:19:14 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Fri, 14 Feb 2025 14:19:13 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 14 Feb 2025 14:19:13 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Feb 2025 14:19:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w3Dcj6nUdZVE7lKGiVezOKTzsIYtw9/59JMOj9iPttGpVVnAyVrd6Y69kvEsYWQBe1+zllYCjh9QychnnFhyV+juP3Bf5ajj1I0sMK9jz8QRyX4wHLJbwQgdeOYRJgBgw08LkSMpBu4/oKjjf2ZtAh9RKGtBwUCaGnHTAvjv4BmEH9jgYcY10II4pqphmTUQZPPInf8bhY4hSdi/i8/J7cSmSadLwPLCMWseP4EbYIh6LgPhdPCd8wHzhk8lWt4VBngOl375mNauu4HkaHTVNf7SG2xaE+Sg/OO1PYsLuByn5GidVRfHU01ZCNcfVVqUZqy9V9EfvNkRb/gDegznjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6H2VBFmCn79Iy3Kfx8Ytj0sZFYUL3U5sA8V+nmxkfVw=;
 b=b9tQ139Xi+JnZu9clxSpp1N7gyK38JDMrhqrzFup0us7T8pHi5JsXdEHBe/5hC9ARGxmBoYs6hDwwNxWCx1AaF/NaZ6KQVH+dXTcyXF2DYuDc2WkI+5NonaZuOhaL81C1ihp+4et2Ei2QdngeRuE+VTpDC/zlaWNvPyzc1UnYLyh042bT4ZT313RHGJZ377dSdNtDSvGfKrl9lR0u3WwgfYT56D5tGT+CqqC8ewvKyGSRgBljzwmbA4GpyxnndZj23Z6Y5SiMhCw/JTsrqGF6zjxxbtvYqCXb7KbPS0Szs2gVGXt+9aZCBHfeEIxfNBsgRH3+272me8VTiLDEvLxUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CO1PR11MB4804.namprd11.prod.outlook.com (2603:10b6:303:6f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.16; Fri, 14 Feb
 2025 22:19:01 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%3]) with mapi id 15.20.8445.016; Fri, 14 Feb 2025
 22:19:01 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 4/9] drm/xe: Drop remove callback support
Thread-Topic: [PATCH 4/9] drm/xe: Drop remove callback support
Thread-Index: AQHbfybV7R0R8hPP5EOBymCCea3JFLNHWD/w
Date: Fri, 14 Feb 2025 22:19:01 +0000
Message-ID: <CH0PR11MB5444BED46E59A10227C430B6E5FE2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250214212313.1767562-1-lucas.demarchi@intel.com>
 <20250214212313.1767562-5-lucas.demarchi@intel.com>
In-Reply-To: <20250214212313.1767562-5-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CO1PR11MB4804:EE_
x-ms-office365-filtering-correlation-id: e23d28e2-9020-45f0-454c-08dd4d4595b1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?6BgBtqObvP35n+ZXcpEfSUlLnqbvyqBJLL0ZjEecgCPBEyRF0z/6Ry2nmAJD?=
 =?us-ascii?Q?HadBpWQMxQYsXx/yWC201NjZAI/eC22USoTuBzGr/Ev2OB5wEFg8TgG2Lk4E?=
 =?us-ascii?Q?CkXerGmCVvUJzRNC7GClT+dj0TzjofJJBhgfA0na24e71uJCu3tzhj/tcEVa?=
 =?us-ascii?Q?+gp4AuQTDyAl2kR9CfPtg+oAseBCM62qjQtGjTmBj5OCsHcwj1jBiPDpnoN3?=
 =?us-ascii?Q?zme2su44aWgMwOPJMIX6FfAH0Mq4w8AKXWDHtQa67HR7HvTOohTG+1xdOaFf?=
 =?us-ascii?Q?s6vze5bNo2KXkrUxOJtHd2JlrfiQfNw/WhuoiYE2o0zM0MdrXmpzEHvemKg7?=
 =?us-ascii?Q?XjRKkmWr4e/F94LpRVGUjti8a0DrA4WTFy3yuBoWtq+fnbcWnYPEd7N5OEhD?=
 =?us-ascii?Q?fzGKwKHlFVAxkq4kCshZ3rffESfyEQyBE9qWQQiHAvTV9G7kXAnVFPGpiFZE?=
 =?us-ascii?Q?e8i8nGc/mabGVBmfn8sNHTgK5jwzWDOhzWJfDjbAtB9cuznZ1ARHDg2Cq49v?=
 =?us-ascii?Q?IQk6QweIcgcZ1p9wc90bDaBwOdg921a5Y3G1ZP7jqutIvPnRuzSnAlDjGDEp?=
 =?us-ascii?Q?qcesxWgQsJLQIMetjQqLDaxDJj4bxqTkZeojdLL8/Ehyqw8sq7gcazq266N8?=
 =?us-ascii?Q?jyOnw2fhVtDFgS/n+lUmseGXkkvN++uYyqpMpKG+Wu5lJsPC01oBHd3uOYP6?=
 =?us-ascii?Q?ExiIKkY5ut/kscra1FVKod4RjoErJtNd+DcwOi3U8UF29KqfFohqp8EUXMyr?=
 =?us-ascii?Q?T1cke67Jyg60AVBLM+Oy6YlTpClu6S4zqtFFTh/fEkHxHfrL6KyqcLfhmLKm?=
 =?us-ascii?Q?LyrYt6QVxLPtikSI+r+prPWPQ8/oIcTKVO+Aiv2Hge4SPbSTgbD9gAr01xMN?=
 =?us-ascii?Q?F12E/vIp88opQpZFz8PcZc7eoKKydxqbsCic0D8dq8LYcTglPrJmFzGllBEw?=
 =?us-ascii?Q?yAF+FDiIVzDKTTL786DMR3zWXC1JYaw+i4YAetS2YwbNFWlnsxAXjTgnUvlT?=
 =?us-ascii?Q?ukPTVswI/kSxeXyxUO090HLsN1MwmicDbPDXwx+9TF72N01TXyp/lOhlMMwn?=
 =?us-ascii?Q?EMgUm0AmsX/jIkbnMT9Hc9C9rR5EpWVBg7t3mPKplgE89/SouP9AitxucXzd?=
 =?us-ascii?Q?Rm9dUMo5rKOoYHNNG1yqlXban8WTs60atYmDHpVe8jKSkq4KjVjirOWFsE04?=
 =?us-ascii?Q?6pbgBfWWYL1Idst51fZ4lKHYji3nlj9awedXv9Ops5AvGU6R/bvGPcgkiJoT?=
 =?us-ascii?Q?2ALmamVqEwIsKY9yL1YSHeToYQvpcJKj6p0lQtF1KYK6j+6gq4m2OfDLTcy8?=
 =?us-ascii?Q?6CQ4VF6Z64ZU0DshwSGkkB3SBYMxgE2cc6DldbGPSCP7PvDzbZJHQ9tvKntw?=
 =?us-ascii?Q?9Msat+73bRtcrIETVy6DVaZmMjV3S8/s4DJRwMdwKoDx3ZzrKMX+H6rf1AMa?=
 =?us-ascii?Q?w+5bBWheXzF98J2Q+PKgZzuftp0ITFh9?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sPAa0V9AIfZzUB2+H0v9jXaul4whL8YIpvHuDSsMxujSvnOFCfTnywInzxBg?=
 =?us-ascii?Q?4y/tdPMjWK2m6hSGp34vfVjTRsPYfSOIz6+QZfXy/ypkdXQnIxXChlo9f3k0?=
 =?us-ascii?Q?WTAItxhzI8LG2aTewFH2s+vq02qR4Ll+ILAVpJUgoNBxwCkTgxJDd2ZUSZCa?=
 =?us-ascii?Q?k198A2+k7XwPHT9R9i+qSZOQAYvx0ZMzdOl6uUw6Vev9TeXu6ZVQ7PnSCsy7?=
 =?us-ascii?Q?gAvhwfJGYQ3rN10jXrFqx8v7MZb+L+Q79LM/hEqZAnu5OdKYCKhJjFbnFA+k?=
 =?us-ascii?Q?HqzPhdACHp1WQq7Mjos8uHsiFSYMk9xRpmD1glk9B0iiEKKT3mpM7/NFQgsy?=
 =?us-ascii?Q?juKsfP4XRksW5BOJKMQmZZP7rm6yByhPl4JfxxPOfNz+1uoYZl5N+bpN6cOf?=
 =?us-ascii?Q?edqls+32i8d/asc5hp0ejQ5WTPKKlwrK4N0jGw0fqQ4m0QLTYUgr0P02iyeu?=
 =?us-ascii?Q?WwHeaYt01uoshRWdMvIEKMWSoN8QlKdYSSQm5pDG6qpPtVkulXsJ7XGpua82?=
 =?us-ascii?Q?lwcfurKU8kkcuvazj3IotLOCikBKnMZyzwhU+UAU1aK7Rp2LjXoj9WogbuKG?=
 =?us-ascii?Q?Z6wZ21n2fI42GwVsGApxZ5eO/0UEQeyw8kjJ2wut4FBo8kKV8viIfCpANgB3?=
 =?us-ascii?Q?IbisV8+1gSY75Y2IgZhnoieSS6JgIGJb2GJ8QHVMOSgvN83ladpKrMGrVfqt?=
 =?us-ascii?Q?DXD8yPZgTCdvFXptArFIjbgZw/ctBLBMB1y+PBzSEWO/7kRugcOV5p8rhk8U?=
 =?us-ascii?Q?PHJCvPo1ybI18QwPjqqogq3n4yrzSlLsP8yi4moOjzvTir1znVLnK4pjB6Ld?=
 =?us-ascii?Q?FzpyTYBlbK2VF/+s3d0tQUYE45XGio8/H8kMnq3tJl9qd4hSQz8YWd56ud3w?=
 =?us-ascii?Q?5BeYDIr4BWhxEL9lxamPxN/SpryBAvxw+x+1ryi8uiDzUk5lBQ3zBxT/XXOJ?=
 =?us-ascii?Q?tMrhyHwKO7+fpwj73g8eSnBu0N8cQKWZiSq580JCAtHAA4Gmduu2R1Q8c6P+?=
 =?us-ascii?Q?C4yBgWwob6ipkwfFQfypb2leceyFTsRe0cyg4E++a7k8pgkbtXTgCqbtAEbn?=
 =?us-ascii?Q?U72uWS9eDhlVVkcCPrX9XeESjOlaXE8PepDIJWWpY//Oh4JnWOddNwN0df4P?=
 =?us-ascii?Q?FdgLUSgCmP6mlvZ/bO+BQOOzPtw/wXLJVn8hHY/bG7TxZlcUXlrQxxtBxZXY?=
 =?us-ascii?Q?swYSjctppNkfVma0RkCdm8hTQulDKjcWuxGQI9AwNaPhlSAMvqCN48FqdhjV?=
 =?us-ascii?Q?6bynjqsp8cT4f3iEVnJ+qknpVZUhy+r90z46Bj68DvhYgVc7wwXjEPEF37kI?=
 =?us-ascii?Q?YzdC7Vdp/fQ00YfFrNS/5S4UxZ9W0ETwh7YwhBKAP6TMZnRnrSKzul1JEEVc?=
 =?us-ascii?Q?TgUOyvESZCorMaJ9u4EfMb9TmGAGHyLsP7UdlP5elQOlLpPT39SybKg6sDMs?=
 =?us-ascii?Q?9KX1rOWE+8zy27myPQvDfmGA5DvBDuXpNZT05ICGKmLCEgMou0rrDsVRv11E?=
 =?us-ascii?Q?qPDs0j5ulY89aKUTzTOF9Qe214OLhzZ6hYYfvgsvuIzt6aIImrv5l2PIlTNF?=
 =?us-ascii?Q?PL77osKapq2g74Vpj+TwwyQFl5nshlAG4RLwPx2p?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e23d28e2-9020-45f0-454c-08dd4d4595b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2025 22:19:01.5692 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Eanq6blSCDf3MhSV+rzp3uZFS+mr+qF5CAqKRO73CWDSmi3YNUQJOKDbrlzoCeUwOMdDeCZNLGpLdHtAYSVPjEZ65dOkvUuVIwADLyQn9XQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4804
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
Sent: Friday, February 14, 2025 1:23 PM
To: intel-xe@lists.freedesktop.org
Cc: De Marchi, Lucas <lucas.demarchi@intel.com>
Subject: [PATCH 4/9] drm/xe: Drop remove callback support
>=20
> Now that devres supports component driver cleanup during driver removal
> cleanup, the xe custom support for removal callbacks is not needed
> anymore. Drop it.
>=20
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Comments from patch 3 are relevant, but otherwise:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_device.c       | 68 ----------------------------
>  drivers/gpu/drm/xe/xe_device.h       |  3 --
>  drivers/gpu/drm/xe/xe_device_types.h | 14 ------
>  drivers/gpu/drm/xe/xe_pci.c          |  4 +-
>  4 files changed, 1 insertion(+), 88 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 31013491f8d7e..89802f98c4820 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -65,12 +65,6 @@
> =20
>  #include <generated/xe_wa_oob.h>
> =20
> -struct xe_device_remove_action {
> -	struct list_head node;
> -	void (*action)(void *);
> -	void *data;
> -};
> -
>  static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>  {
>  	struct xe_device *xe =3D to_xe_device(dev);
> @@ -752,9 +746,6 @@ int xe_device_probe(struct xe_device *xe)
>  	int err;
>  	u8 id;
> =20
> -	xe->probing =3D true;
> -	INIT_LIST_HEAD(&xe->remove_action_list);
> -
>  	xe_pat_init_early(xe);
> =20
>  	err =3D xe_sriov_init(xe);
> @@ -904,8 +895,6 @@ int xe_device_probe(struct xe_device *xe)
> =20
>  	xe_vsec_init(xe);
> =20
> -	xe->probing =3D false;
> -
>  	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
> =20
>  err_unregister_display:
> @@ -916,61 +905,6 @@ int xe_device_probe(struct xe_device *xe)
>  	return err;
>  }
> =20
> -/**
> - * xe_device_call_remove_actions - Call the remove actions
> - * @xe: xe device instance
> - *
> - * This is only to be used by xe_pci and xe_device to call the remove ac=
tions
> - * while removing the driver or handling probe failures.
> - */
> -void xe_device_call_remove_actions(struct xe_device *xe)
> -{
> -	struct xe_device_remove_action *ra, *tmp;
> -
> -	list_for_each_entry_safe(ra, tmp, &xe->remove_action_list, node) {
> -		ra->action(ra->data);
> -		list_del(&ra->node);
> -		kfree(ra);
> -	}
> -
> -	xe->probing =3D false;
> -}
> -
> -/**
> - * xe_device_add_action_or_reset - Add an action to run on driver remova=
l
> - * @xe: xe device instance
> - * @action: Function that should be called on device remove
> - * @data: Pointer to data passed to @action implementation
> - *
> - * This adds a custom action to the list of remove callbacks executed on=
 device
> - * remove, before any dev or drm managed resources are removed.  This is=
 only
> - * needed if the action leads to component_del()/component_master_del() =
since
> - * that is not compatible with devres cleanup.
> - *
> - * Returns: 0 on success or a negative error code on failure, in which c=
ase
> - * @action is already called.
> - */
> -int xe_device_add_action_or_reset(struct xe_device *xe,
> -				  void (*action)(void *), void *data)
> -{
> -	struct xe_device_remove_action *ra;
> -
> -	drm_WARN_ON(&xe->drm, !xe->probing);
> -
> -	ra =3D kmalloc(sizeof(*ra), GFP_KERNEL);
> -	if (!ra) {
> -		action(data);
> -		return -ENOMEM;
> -	}
> -
> -	INIT_LIST_HEAD(&ra->node);
> -	ra->action =3D action;
> -	ra->data =3D data;
> -	list_add(&ra->node, &xe->remove_action_list);
> -
> -	return 0;
> -}
> -
>  void xe_device_remove(struct xe_device *xe)
>  {
>  	xe_display_unregister(xe);
> @@ -980,8 +914,6 @@ void xe_device_remove(struct xe_device *xe)
>  	xe_display_driver_remove(xe);
> =20
>  	xe_heci_gsc_fini(xe);
> -
> -	xe_device_call_remove_actions(xe);
>  }
> =20
>  void xe_device_shutdown(struct xe_device *xe)
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_devic=
e.h
> index 079dad32a6f53..0bc3bc8e68030 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -45,9 +45,6 @@ struct xe_device *xe_device_create(struct pci_dev *pdev=
,
>  				   const struct pci_device_id *ent);
>  int xe_device_probe_early(struct xe_device *xe);
>  int xe_device_probe(struct xe_device *xe);
> -int xe_device_add_action_or_reset(struct xe_device *xe,
> -				  void (*action)(void *), void *data);
> -void xe_device_call_remove_actions(struct xe_device *xe);
>  void xe_device_remove(struct xe_device *xe);
>  void xe_device_shutdown(struct xe_device *xe);
> =20
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe=
_device_types.h
> index 4656305dd45a6..833c29fed3a37 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -428,20 +428,6 @@ struct xe_device {
>  	/** @tiles: device tiles */
>  	struct xe_tile tiles[XE_MAX_TILES_PER_DEVICE];
> =20
> -	/**
> -	 * @remove_action_list: list of actions to execute on device remove.
> -	 * Use xe_device_add_remove_action() for that. Actions can only be adde=
d
> -	 * during probe and are executed during the call from PCI subsystem to
> -	 * remove the driver from the device.
> -	 */
> -	struct list_head remove_action_list;
> -
> -	/**
> -	 * @probing: cover the section in which @remove_action_list can be used
> -	 * to post cleaning actions
> -	 */
> -	bool probing;
> -
>  	/**
>  	 * @mem_access: keep track of memory access in the device, possibly
>  	 * triggering additional actions when they occur.
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 41ec6825b9bcc..447eacb355d7c 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -900,10 +900,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const =
struct pci_device_id *ent)
>  		return err;
> =20
>  	err =3D xe_device_probe(xe);
> -	if (err) {
> -		xe_device_call_remove_actions(xe);
> +	if (err)
>  		return err;
> -	}
> =20
>  	err =3D xe_pm_init(xe);
>  	if (err)
> --=20
> 2.48.1
>=20
>=20

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76DABCE8D5D
	for <intel-xe@archiver.kernel.org>; Thu, 19 Sep 2024 08:01:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C2B010E6A0;
	Thu, 19 Sep 2024 08:01:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AJb9NcFI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7755510E11E
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Sep 2024 08:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726732876; x=1758268876;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=N1wGvgcuafGXVhsQ7CI1G0T2UwUM7A5Ckpw3EtgT3cc=;
 b=AJb9NcFIJh2fZPC3IbOHtMPjFfZ21IuqYRvuaedX8r5/P0xY6oo7ORA/
 VPHYaOI8i2eNuD14UYlTKeZTkG3fSk/9j4MJrplRVoThTSp4g5zCuYgk2
 ugtl1mT1/j3EVmrUuTUfKskYCRea05gh4weQiryiepN8sf7owMOV+7MQ2
 6S0niwH4FAqBe5Aqp+qYJZH0KqMNg79U6Ts70fn0gSV35qVyJ7AD0YUVv
 ckyJM47X+6tPjYx24PVBj1ZF8i6ylt2AkLtOKF4NwdZdeNVLjeb+dUGy5
 9HIuHNmIaF4lp5JF3jmCpEDfPe7pc7jocQbStiXDxKTXTtceD/P326We0 g==;
X-CSE-ConnectionGUID: kFgsT4wZQJCA3syF/8mY6g==
X-CSE-MsgGUID: Ds5cnj1fTLyo10YYrhNU/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25824500"
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="25824500"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 01:00:25 -0700
X-CSE-ConnectionGUID: 7JQQdccsSfCSmxfUufJTTw==
X-CSE-MsgGUID: /Hk1DHyITuWnuZ4jXEicVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="74384847"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2024 01:00:25 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 01:00:24 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 19 Sep 2024 01:00:24 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 19 Sep 2024 01:00:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MFr12k9JNLqXj+SadRgQ0ktPVf4CaxoTxtBsLbh0uJWIKrt8kCtJWEgyzR5M5dMhp75WX83jHZIC64m160HAM5AawDTdjwxqafbIe67JFvjC8TqLadWM6zXImYnRvVwPkEP5OJVpeOEg2nYK1PLnyYt08NJ77WLnmV/A0lUnma0UUzKP5JCvT5oiiEG8KEICsctEz8e044tBz0o0YfJJpLDroTkZneRQi7FStUr9BTDPvw5szgsYl3ZiSNzYYOLyzPMsocmL0KeQtQXK2KT21DzZERGUnJsdpGW7HfimsOz3+6ROpYFIvGZHQoJ4qc1qy0xYk0wahqJeuCtXkPZHCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YYc9fayEIRS3U7H4NwguQfx2ALWWm2K05fQ+76fc0sU=;
 b=q5glrn3O/Sw7KnLaOMZkHTyYDBjzsvY4+P1ZES8mJpfXfTtDBu7izsn+sBgA8cNoOH3Tb+78nGSvPh3EHhqcFc35YhuWh9zm+yjbYpzFR/RTp3G4U7X3DAH/fzeDMxiOs+beJjsPS3sMlOPFpihkHzvozdNTS5NZh1LrleQWF/RFwRTOPbIEDnJy2YS9kG9r47HM3V3ZesVvmRohTopX0RS+ayH+IjcQEeqGpIu9Abcbuq++spNcEbrww3ctENbeezd+W3tKcpRq9eYJhij9mg0yk5qZE3Tx41fn3KXK/pQ8jErCVt1tUjJ/Xl5w5Q9PCtFb7vNi8fqG43E5Z5cF/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SN7PR11MB7116.namprd11.prod.outlook.com (2603:10b6:806:29b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Thu, 19 Sep
 2024 08:00:22 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.7962.022; Thu, 19 Sep 2024
 08:00:22 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Sousa, Gustavo" <gustavo.sousa@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH 1/3] drm/xe/xe2: Extend performance tuning to media GT
Thread-Topic: [PATCH 1/3] drm/xe/xe2: Extend performance tuning to media GT
Thread-Index: AQHbCgwxUUEpBr6zWEiJxiKlsmgeQrJevssQ
Date: Thu, 19 Sep 2024 08:00:22 +0000
Message-ID: <SJ1PR11MB6204DFF0BA690ABD5819DBE981632@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240918204830.49880-1-gustavo.sousa@intel.com>
 <20240918204830.49880-2-gustavo.sousa@intel.com>
In-Reply-To: <20240918204830.49880-2-gustavo.sousa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SN7PR11MB7116:EE_
x-ms-office365-filtering-correlation-id: 2f867531-2dc4-422c-7e5a-08dcd8811cdf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?PLoYxy5jJChCtRcHqnzLjzQ/b/zMITBqI2i/Aya2p8ZfwEGhmfXSN5zFKCcA?=
 =?us-ascii?Q?z3cY7rX01negVD93foVp0XG6Z4B2hd6gpemYPuHYVPmvDNhsRoP7idtjS1h/?=
 =?us-ascii?Q?9+zaGFWsvEISMS48CbZMKX+czDxQ6m7MySeAH7Mubki2CFTk1LRhg3svMsPV?=
 =?us-ascii?Q?xY6fb4Kcxvn9JIjmBhMaa4qkD85IwfybAf5jC7FIwXOFbvqgtp4NkJ0e2R07?=
 =?us-ascii?Q?FsO/mdUwI9xI13yLLuiVpq1krj+3ICkbr8dgLvj1WlEyxCu9pOZy1Y2S1CjP?=
 =?us-ascii?Q?/DEvOJwq6bHUtg22p7gjWe+AftWeJl6voqUUndYox703Q0PnSi7meiEpy4bK?=
 =?us-ascii?Q?uyOZwSompLiVHXZGmt5+ZIfrfFIUHUhh9Vx272WQziEl0Qlu1cpXCHqbc6co?=
 =?us-ascii?Q?BoDcjVaxpnKChfkISkotSSc/T0WeehWiSUETRrJZpsKLMzXOf4riAOGwTzF8?=
 =?us-ascii?Q?/phLQW2jlALVHMRTV8vJ4uQWOWSlTI9g5OuqulWOPYvdz8qglTWBEMOz//oZ?=
 =?us-ascii?Q?ITIxW4j2QIIt5Mq3pP9cZ8kxsboULcwyr9yo8DOEVht24lLQlhChXxIWID4V?=
 =?us-ascii?Q?IAQDNBEiPUSifI3zd2SkRYSSzQoF9NqNAbt9YemAH8wLFis+NdME6WnbMG/O?=
 =?us-ascii?Q?aPZzEgv8BPo5XvC4u5TkPTOo1po4nz3222cb3n01khVbklRrfnkcvcyaOjMm?=
 =?us-ascii?Q?UIT9UPakDAdz6s9ntFVXphmkKp8ta4KT9uJkz+6vMNO5KQVOJd881ORdOv0I?=
 =?us-ascii?Q?2FQFenv4ydixsJ9zcbzjG+gBZja6GQhylIBk3MCs1isTYvdgo/IAXQbVye8+?=
 =?us-ascii?Q?G1LFUvyb0nBhUPrXVQvJUg2dP88a3NzwfLPMc4dQVpVINgObdFAU5INTFkaH?=
 =?us-ascii?Q?lsRKftOEmQluvYUAY7KwzOnQhGC+zP/pwyckIRpgbs55/sUB7rhLKwpyqGJy?=
 =?us-ascii?Q?4QbhKPK/c4tyE2wnWkmx5T7ph/Ph47iJ6r1LYtYyGMejNnzNKfonT4ShyrWY?=
 =?us-ascii?Q?PALyRk/BPaD9O6EdRPeJS9Uql8GofwSTRibJ7z85NgyoTMPBV4BBNvS5WY3q?=
 =?us-ascii?Q?KnhIoC4xx2vne8WWseKljS4mBtAVt7yt5VifhJP2a3vVHJjJyvH6AR5yl1lF?=
 =?us-ascii?Q?iM3P7YqsQPfuh621UWw3D0kyazOfgEBaYJHRpw2gl1eYsHATm3LihRlbugaa?=
 =?us-ascii?Q?eDcLAs9dSi1GoUSa70xVDkizFBGyallkirpIntLEu5yjM7vBGQGZSqSNRGOz?=
 =?us-ascii?Q?iXDf/O46Vt0ISlhz9DmcdwF8MJ51jW+PsVedhKHWb0NJd2k3wEOcbIE9hFHF?=
 =?us-ascii?Q?mSgleR6faUErGv7yVC/KUhbuWhCT7DgPffr8+lRuU8++1T45OzFlRHg5qwjq?=
 =?us-ascii?Q?pBpLF6bjgqivvuLjsYqKEVI6eIhChoC1UU+oAhOVulIbq64AVw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?frVy71cI2bXtOoHT+0pP9vH1AjWbc3cpP2MKwXZMlrn2pBfjJzdM6OkdW21D?=
 =?us-ascii?Q?FOTinIUEzHaJ41PwW6jtz7JkWzNKCwgVXx87zCtfZeXrncoiPuRelCbTnJ1u?=
 =?us-ascii?Q?IAINkgOdZOa2jGUYK3dGpcbRGomcm6QM0R27mqPE04b8BTBJ38dZ0keFTLR3?=
 =?us-ascii?Q?AyVNtc2O3ZFyVMI4REyDaoJl267w6A/8lFwgu0+8QtaVBT6PxPJs9DygA5Mg?=
 =?us-ascii?Q?1rFR0a8phARg7+u6QIWwtEaXyTqNqez1YG7mZR5P3TuNMS5H2vKD8JlPfqCi?=
 =?us-ascii?Q?BuQ4Q+1vkzLiiAkIfykDyKDpHWRnzOrJevPhupLXU7QOvZPpChWNDC2H5NU1?=
 =?us-ascii?Q?yjftqu0nRczeu6zwqX/c6NGhmeBrCnpoenSgAY2C49bjEMzjOP6CGkU6MKLq?=
 =?us-ascii?Q?hkqHganbuQA8xt+TuD8GMxVmNmOIL+SDtGetQWeSFnz7OZRqy5M0StDh5wRk?=
 =?us-ascii?Q?bRYfWkMLDEWVlXaAl1Kre7bWDlaFmIDk8eWuD1BPv2y8/Y7mR0hMA7U/Fyld?=
 =?us-ascii?Q?JV6qo9HZ3xFv6jp4Ns2gtk8H8rmfB2fXw7dtDRJUZdkVpPgEaXG6y0PikIod?=
 =?us-ascii?Q?JK55V73f6+rU9/xjpQnJE1XczCWikd2uiNHHO+lWuASwZs2x1s+IjsL0w2Ge?=
 =?us-ascii?Q?F0ldhJrCzUHe4IVpkCkCUJ8ManjoS6NlSigGGL+K6Ji4DV+RV9xSGNNzRjxi?=
 =?us-ascii?Q?1baMBXyIe/T54g5YbkykQaQpiApk/wTFemuSRQr61EZjMl2F4W9STeSOjqSx?=
 =?us-ascii?Q?xfPKWxckUE04h1jHqO04cnNepZkazg70VdS/aKsRZCjzr3auxvO1ZHMnVNDN?=
 =?us-ascii?Q?vcd5XFT6O0BBQR/hsp0iwtpAI46U0O8Dov1ngVH37yK41zcTNGlagOpcWSJ/?=
 =?us-ascii?Q?bvmBONQiKrG6wCJz7ZABc8MKnGAdxkJDIn/wkkBNCp3D4xurtyD/9cea3jyH?=
 =?us-ascii?Q?9DObgcGxVtTzdNXlJxhJW9sUWo1BNxj0UoAz/k2ym5kxf5s6ZSrlOS87xCWU?=
 =?us-ascii?Q?SkHBkNAcA0UKjbvj/oJdfDs6blaVwH+8PHocUpS6WvPbLpTQhk2x8FXwWy5h?=
 =?us-ascii?Q?Qylwdfwg4g6Y6jiFdjcx427zxN9kugLKaVVHDR7z93FsANguLiezYTCXzjp2?=
 =?us-ascii?Q?19kMRV7bazlRifoJBb3jw+MEzl0ZlebojTQl8ErRiHKl9KitTtOj0JeBeswP?=
 =?us-ascii?Q?su3j3Z7LuwcuqvBDqSdXYllTGWN+l1WWykJH/huarhn9AQxVDOU3npcr7DxE?=
 =?us-ascii?Q?5B8EG8vGz99wj56EETx/oPFuyPw4l9ZNPoKUANAUVnKJUN9WRlqkbwCKg9fp?=
 =?us-ascii?Q?k/9QGVsh7Gjbc0+9/p1yV8gTjT3EtO6M6xfunIFqr/7ji+tBhNDDWOBAlcsX?=
 =?us-ascii?Q?4GkGazChDdam5ZdObUpyBxi7E9mUa/L1gIQWKS6busA2XmWKnNfp67CECbgD?=
 =?us-ascii?Q?Z2TYFaT2Lc1pg9XdhLhTb2w0qb3o8zpepeR2F7Lj6Ry5/OmQYG848Sn97IyJ?=
 =?us-ascii?Q?BkqQm2Ds6DpsyW+MMLGbDmQZtoKqyYoyZLTkgoWiJtqX3y+HXMvZl0eM3F0u?=
 =?us-ascii?Q?Ql7WIZ8I6eTDnHmFMRNfImQOkr5+ksi/pI5eumm8?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f867531-2dc4-422c-7e5a-08dcd8811cdf
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2024 08:00:22.6442 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +jrihvj6OwM+py7t4c6Lbx6UiRh9sRrM0TVkzb1UDwXF5Xd+7wqk+uK6PhqdSHBRK9ivVojBvpWyKBUCuqSd/e4qXsi2LAPJ3ElS8FKzLyc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7116
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Gust=
avo
> Sousa
> Sent: Thursday, September 19, 2024 2:17 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Roper, Matthew D <matthew.d.roper@intel.com>
> Subject: [PATCH 1/3] drm/xe/xe2: Extend performance tuning to media GT
>=20
> With exception of "Tuning: L3 cache - media", we are currently applying
> recommended performance tuning settings only for the primary GT. Let's al=
so
> implement them for the media GT when applicable.
>=20
> According to our spec, media GT registers CCCHKNREG1 and L3SQCREG* exist
> only in Xe2_LPM and their offsets do not match their primary GT
> counterparts. Furthermore, the range where CCCHKNREG1 belongs is not
> listed as a multicast range on the media GT. As such, we need to have
> Xe2_LPM-specific definitions for those registers and apply the setting on=
ly for
> that specific IP.
>=20
> Both Xe2_HPM and Xe2_LPM contain STATELESS_COMPRESSION_CTRL and
> the offset on the media GT matches the one on the primary one. However,
> the range that contains that register is not is not listed as a multicast=
 range, so
> we need two different entries for media.
>=20
> v2:
>   - Fix implementation with respect to multicast vs non-multicast
>     registers. (Matt)
>   - Add missing XE2LPM_CCCHKNREG1 on second action of "Tuning:
>     Compression Overfetch - media".
>=20
> Bspec: 72161
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  7 +++++++
>  drivers/gpu/drm/xe/xe_tuning.c       | 24 ++++++++++++++++++++++++
>  2 files changed, 31 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index cf21de3adca6..6ec2d2c11d77 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -80,6 +80,7 @@
>  #define   LE_CACHEABILITY_MASK			REG_GENMASK(1, 0)
>  #define   LE_CACHEABILITY(value)
> 	REG_FIELD_PREP(LE_CACHEABILITY_MASK, value)
>=20
> +#define XELPMP_STATELESS_COMPRESSION_CTRL	XE_REG(0x4148)

Were trying to say, XE2LPM_ here? Also this seems to be MCR register.

>  #define STATELESS_COMPRESSION_CTRL
> 	XE_REG_MCR(0x4148)
>  #define   UNIFIED_COMPRESSION_FORMAT		REG_GENMASK(3, 0)
>=20
> @@ -169,6 +170,8 @@
>  #define XEHP_SLICE_COMMON_ECO_CHICKEN1
> 	XE_REG_MCR(0x731c, XE_REG_OPTION_MASKED)
>  #define   MSC_MSAA_REODER_BUF_BYPASS_DISABLE	REG_BIT(14)
>=20
> +#define XE2LPM_CCCHKNREG1			XE_REG(0x82a8)
> +
>  #define VF_PREEMPTION				XE_REG(0x83a4,
> XE_REG_OPTION_MASKED)
>  #define   PREEMPTION_VERTEX_COUNT		REG_GENMASK(15, 0)
>=20
> @@ -399,6 +402,10 @@
>  #define SCRATCH1LPFC				XE_REG(0xb474)
>  #define   EN_L3_RW_CCS_CACHE_FLUSH		REG_BIT(0)
>=20
> +#define XE2LPM_L3SQCREG2			XE_REG_MCR(0xb604)
> +
> +#define XE2LPM_L3SQCREG3			XE_REG_MCR(0xb608)
> +

These are not marked MCR in bspec. Is there something I missed looking.

>  #define XE2LPM_L3SQCREG5			XE_REG_MCR(0xb658)
>=20
>  #define XE2_TDF_CTRL				XE_REG(0xb418)
> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tunin=
g.c
> index faa1bf42e50e..7a5b852af8d7 100644
> --- a/drivers/gpu/drm/xe/xe_tuning.c
> +++ b/drivers/gpu/drm/xe/xe_tuning.c
> @@ -42,20 +42,44 @@ static const struct xe_rtp_entry_sr gt_tunings[] =3D =
{
>  	  XE_RTP_ACTIONS(CLR(CCCHKNREG1, ENCOMPPERFFIX),
>  			 SET(CCCHKNREG1, L3CMPCTRL))
>  	},
> +	{ XE_RTP_NAME("Tuning: Compression Overfetch - media"),
> +	  XE_RTP_RULES(MEDIA_VERSION(2000)),
> +	  XE_RTP_ACTIONS(CLR(XE2LPM_CCCHKNREG1, ENCOMPPERFFIX),
> +			 SET(XE2LPM_CCCHKNREG1, L3CMPCTRL))
> +	},
>  	{ XE_RTP_NAME("Tuning: Enable compressible partial write overfetch
> in L3"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001,
> XE_RTP_END_VERSION_UNDEFINED)),
>  	  XE_RTP_ACTIONS(SET(L3SQCREG3, COMPPWOVERFETCHEN))
>  	},
> +	{ XE_RTP_NAME("Tuning: Enable compressible partial write overfetch
> in L3 - media"),
> +	  XE_RTP_RULES(MEDIA_VERSION(2000)),
> +	  XE_RTP_ACTIONS(SET(XE2LPM_L3SQCREG3,
> COMPPWOVERFETCHEN))
> +	},
>  	{ XE_RTP_NAME("Tuning: L2 Overfetch Compressible Only"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001,
> XE_RTP_END_VERSION_UNDEFINED)),
>  	  XE_RTP_ACTIONS(SET(L3SQCREG2,
>  			     COMPMEMRD256BOVRFETCHEN))
>  	},
> +	{ XE_RTP_NAME("Tuning: L2 Overfetch Compressible Only - media"),
> +	  XE_RTP_RULES(MEDIA_VERSION(2000)),
> +	  XE_RTP_ACTIONS(SET(XE2LPM_L3SQCREG2,
> +			     COMPMEMRD256BOVRFETCHEN))
> +	},
>  	{ XE_RTP_NAME("Tuning: Stateless compression control"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001,
> XE_RTP_END_VERSION_UNDEFINED)),
>  	  XE_RTP_ACTIONS(FIELD_SET(STATELESS_COMPRESSION_CTRL,
> UNIFIED_COMPRESSION_FORMAT,
>=20
> REG_FIELD_PREP(UNIFIED_COMPRESSION_FORMAT, 0)))
>  	},
> +	{ XE_RTP_NAME("Tuning: Stateless compression control - media"),
> +	  XE_RTP_RULES(MEDIA_VERSION(2000)),
> +	  XE_RTP_ACTIONS(FIELD_SET(STATELESS_COMPRESSION_CTRL,
> UNIFIED_COMPRESSION_FORMAT,
> +
> REG_FIELD_PREP(UNIFIED_COMPRESSION_FORMAT, 0)))
> +	},
> +	{ XE_RTP_NAME("Tuning: Stateless compression control - media
> (Xe2_HPM)"),
> +	  XE_RTP_RULES(MEDIA_VERSION(1301)),
> +
> XE_RTP_ACTIONS(FIELD_SET(XELPMP_STATELESS_COMPRESSION_CTRL,
> UNIFIED_COMPRESSION_FORMAT,
> +
> REG_FIELD_PREP(UNIFIED_COMPRESSION_FORMAT, 0)))
> +	},
>  	{}
>  };
>=20
> --
> 2.46.1


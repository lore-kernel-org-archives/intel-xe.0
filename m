Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4606C27C55
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jun 2024 16:34:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 420D110E48E;
	Mon, 10 Jun 2024 16:34:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RfybdjoQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BDA810E48E
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jun 2024 16:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718037256; x=1749573256;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZYQs/1ikJOJy88iil9u8EukpSwgROMmoc2Mi5GIq5AA=;
 b=RfybdjoQj5hamwzwD6/UveXqhORJSnBous+sC+qpiL6bZwvp7Qi8twNA
 NhcilO1EOxovmzErT4wvLoLTQdkrOc5j3egi9qsItCS7DuPKKvCyZoM4Z
 I9+45QXi1nOKBtO2UVWoJrOG7r6N8laKFbrgbxf7U1aNqz1FReh6j/9Oe
 UJ4Xoz47sbq25eV6Y/3xNwB8RI2aCOqVwQNR16YBSfnhn2YtcAHMaDl58
 tkiKx6XjQrvU0xKWf8ZIdI0i94F8YoKTb9W88vsvSuJ+F++B8tsbhHXos
 6eVcPURk2NHiuD699Ii9LKuzh2buXzSshp2/1jvHsStrfKVn6fNThf/d/ A==;
X-CSE-ConnectionGUID: JihJh3nnTTKdmNqbTOSBcg==
X-CSE-MsgGUID: /37pg86LRNOYb5JbbJp9Aw==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14830777"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="14830777"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 09:34:15 -0700
X-CSE-ConnectionGUID: KLd0raGkR5Crb397gCHDRQ==
X-CSE-MsgGUID: 9+aBfkoNQTaAZ2UcQKTwSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="62287544"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jun 2024 09:34:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 10 Jun 2024 09:34:15 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 10 Jun 2024 09:34:14 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 10 Jun 2024 09:34:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bl92zLmehR36npQOpEOZx1us11gfXFVB+4OlMd3LUniIn4zGVb/YzpyQaMAG6dk7Zd52k8Plfd2RS2f9g5mU8LJLaO7oo4r8BtcCKF+iG4ny9C/mgl/6F3w4hrR8BZYKLMoOTs95acyRJWj7xG5vA+hhZ4E2xcP6CaASqwQU8BN1Kl+nF6gREPH9VkgCp2PJ+1NFb2jkiTIH1aoXoajJcut6nN52988mHciHc3Lp7DxwgpHLOJtE7WJbXncQxzEXvGs0IsP8E7RHgj9AE8a7TaPPfMt6miGKq+caqt05mZjqTexziWlbzHuaU8iFFoDLvdSadkDcoYni+qcgPEwC5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VPeYMGmk/KxYS2HaZqVDUXDdZrQ2O6hLfQ5j3ZjXLME=;
 b=FjHOFklDysX+XED1SjakxQRCIR8jLx4t5Kn1BfH7QAPNIsdxkUZ7oJDTuRpGYXnrrue/tTG78umqhOXc9ixKxQVRLeSHT05DaNiPPkxZo8pbgtNyvUYMHoDVWZGdcyXjIdz4FIOb6WrcPah1emwcaqFw1NcAzDYyUFrwAjBfzxw01lpGSEFK1ka8qIi2rOrfFvao39dTAbAaGUbn1TzY6amYG5HC4GFHnjqMMS79QiHKMjbZI7g0xOkiBqXlsTdANhdDO1zWPHgkUJK8rNrR4P4/YZa9VAdjFxy09gI37/zvcqM6ii1joLQAfWBwNBhSDPG+OviQlelr/zIS75J+7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH0PR11MB5189.namprd11.prod.outlook.com (2603:10b6:510:3d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Mon, 10 Jun
 2024 16:34:07 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.7633.036; Mon, 10 Jun 2024
 16:34:07 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v5 05/10] drm/xe: Add xe_gt_clock_interval_to_ms helper
Thread-Topic: [PATCH v5 05/10] drm/xe: Add xe_gt_clock_interval_to_ms helper
Thread-Index: AQHau0EUbtgojOop0EeLKr6GCP5C2rHBE0Ag
Date: Mon, 10 Jun 2024 16:34:07 +0000
Message-ID: <CH0PR11MB5444CA0A965A6A39F47CA498E5C62@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240610141823.2605496-1-matthew.brost@intel.com>
 <20240610141823.2605496-6-matthew.brost@intel.com>
In-Reply-To: <20240610141823.2605496-6-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH0PR11MB5189:EE_
x-ms-office365-filtering-correlation-id: 44b5a21f-6a71-48e4-af0a-08dc896b262a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?y8FyPyM0LM4LLV3VoVB5lwUwZzDEZymm6XhJZH10w5WSawZ4Tx5u2y+s+ctd?=
 =?us-ascii?Q?4nB1c7SfOa6FHHyNX9Yg05pPzcuudBuVNWClaz3ivJf1oMzZpzOgRy8TfjZx?=
 =?us-ascii?Q?Ms/bCqg82Zy4Q54I58tG066aY8VmQp7YR5cslZ9bqL/8Z8AfiVkC1G/etKqZ?=
 =?us-ascii?Q?U7RXer7XqVTTyAK3ZSREkhPIvgK6R1AlySnBebMICw+VTmgKh59m741O6U58?=
 =?us-ascii?Q?djE0zcgGjOa5BfFSAAegWrvCEVpKU4sBXmoOccvkOILnq2rPEyBgiS4mWP1i?=
 =?us-ascii?Q?ZW48P6dfr9gIp2AhbbyqYM/oHOG4lgXo0dDRajDSdWbPaMqLUKHPDqdt81ta?=
 =?us-ascii?Q?n/ADK0dSVpNGdQhRDvL6UrB4t3v5GPrD6JdF1kjh2kiGKM98BeABRO58Ez+Q?=
 =?us-ascii?Q?8YjvJwyMpSzf0LRkjnRolQY60nTjcPIU9ubGNdF6nxInUk0H30U7pu5Pv28g?=
 =?us-ascii?Q?DkBMOIpsPeRrntdoz91v/zwVQFFp3e5H7nJ/k6ie1G1AaBWvLPs+KIrs8qpm?=
 =?us-ascii?Q?XF1DXTs5CE2MocONto0H685Q0v0xUV98pnskncxAqTHW1U9N1dB6qdlfCDcA?=
 =?us-ascii?Q?qQ89HqCYEKQusJnYnd62nzWmFyio4mfKyym8pzHCJNLOdSRgdCptUdQqGowM?=
 =?us-ascii?Q?3x3W/5VqQAN/fJLusmFTrKpALaTnyspUhfPn3yr++WXMmW8ilvbW0VJZiltK?=
 =?us-ascii?Q?EPqWlUBboRkCLzweJdyHJ6WDQgOnPRKHAGYbeLizj6KVETQZ7u+ebA965Vlf?=
 =?us-ascii?Q?HG0C7ZXDJUuXyBZrlMmWs8g0udGd9FnNcXOjANkiFaLS2FcJW860qhU9Jz/H?=
 =?us-ascii?Q?MXkBHx+vq79yCx9Rjk1Nz8GnEqrakK1uHC2KW02CoeiNhvSf4qStAt6la/18?=
 =?us-ascii?Q?NzZdWK4DVNaD3GWqb3dcCz/J55ggAeVlQyO8t3VrYV7tbnMf3XiaMl2yIO4k?=
 =?us-ascii?Q?scwlVDqiNbxY7orHKONrA1EL4ex/VA4+SeHz1c/qtC7XnJV3FD5XXapN856i?=
 =?us-ascii?Q?UPAUCK+hJzqDKdlVuIU0wekBjpEWd3MzorvfEehsYwcPLZil7PXM6WlWwdBx?=
 =?us-ascii?Q?6reZX5pEwgdADr3Zudl8C+khiEQaAIWU4kXCxRu18wT0PVx7loys/2s/s01q?=
 =?us-ascii?Q?BbTk2+EwO1Nf7/LXG1Ui1iWOVWCAj36B4KhGYMd/ETijYP+pygkhjfrwZk3v?=
 =?us-ascii?Q?yHvaRnI9E8nZI6Ai28YxasVf6lIbS1yyJA/EhBlwlAHkCe+LnnrQEqCdTXmu?=
 =?us-ascii?Q?BOP6XBk0Bb3NUfBT1iuCRevDOp7ZZzm5G04ANP54d27JoB4CE8i6Ly6KEkSt?=
 =?us-ascii?Q?Bz4hfXrX1YSGyHYWHDI+Ilanwzw3Cwozbfq/aSTRMaoYTuGdNZ+oKjO4liE1?=
 =?us-ascii?Q?8hsqOfo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?H7iGCoaofdOSWDcU5q5voLCWzXwEEDqxiSyNnUHf5z9K2OcC002csWUQqNFx?=
 =?us-ascii?Q?ug3xpdmcJqAaPvYhiLuor6TxPEN6GPi5Lex0i1jW3xcGm/XVH140JjPHv+oi?=
 =?us-ascii?Q?O6cGfT8JgCxFnt6h+lmcreNJsrOrNQt3cstVFY+kEJl1JuU3CRdooB5WDC4I?=
 =?us-ascii?Q?qfPomip3rAV9URCL5lHf5f0O9Hk72yy1GqA5Et8sL5AomY9AZ7BoCNsXYXrt?=
 =?us-ascii?Q?weckKqWuCiWb3vz3ek0lUdNDYzbhhVEP0CoBIDv7tlCOMiJljXRZNt6isdDX?=
 =?us-ascii?Q?fuSnvBI500b7tgQUtEne6Tfj2CCr9Ywnul1t7vAwsy7XZkF+Ao8jg3ppFDnl?=
 =?us-ascii?Q?z+Bky+I0L990/uHCyU3xN8ZWvU8Oc6+700uB6z/n3uPOvb1gl5vF/ngbEun0?=
 =?us-ascii?Q?xLmezSuvJKfBm0skAV2HvU2w8OYAQ6zfmRvWOsoSSWRRee5H5TVOsOR3qcFL?=
 =?us-ascii?Q?wloWMGQUL3T6qmD84WTChUxuROfrCbiA1EE4uVAltD1aqf4iaYN1zbCsi76R?=
 =?us-ascii?Q?2sfDPpMT5zuYxb+Xur6qiU8wVpt8bF/RiE7eTtMyC5YE+4cQSeo5ciu3hZJN?=
 =?us-ascii?Q?bc7xez+Hj9IExNxSNb1B4Uk2MX1aNhVk1GYoNjzEDhxebN8G+oZX8C/U1RpP?=
 =?us-ascii?Q?3jUD9uYEZo3B/LDp57njnU6AA2PF5pQs/x85ny4pAWFq9jKODCK/7FyuX5ur?=
 =?us-ascii?Q?6dUNiYajfOEdb8YAGMYTOV/TJtv6uS/atUk86ID72tIhL6/o2Fy5JEneSGIN?=
 =?us-ascii?Q?eQzxXewBeEZsgSyQTUwK5/dDAY/EFxcD3a3eG2C0P2DobAAm81/o67Ep+ksL?=
 =?us-ascii?Q?s5GCxHExt4Ck3Z5AHKoXTpui1VLnov7Cw10DsG8PbDkM0UKNhnUWjWUH7GFF?=
 =?us-ascii?Q?nB7fxusbMu6SXDaHJ+zmWMCk6Q0ee3CXOmC4/NcAW/ryKZ5buHPgCvF2LNwu?=
 =?us-ascii?Q?sDQW/p3bdqglDODzky5leznU+nLveb6DQaJc4UK0vD6q25Ufjy03uiSFYr5A?=
 =?us-ascii?Q?mipEghG65fazR3Pq4TwzFVXyRgRyVCxmif92C7FA7FO6x+C2U1hWy6x5LN40?=
 =?us-ascii?Q?fgfgfOTASuSduUNSTatc6Bt256oyFXWKQTgW/CLkiz3liu2yxHiBPdFvVyz+?=
 =?us-ascii?Q?U0DOBvFaLwqxcSNXW28p7217YZ/LlujEsL3qIc7Q/WA/HytqNoZUAChbbItd?=
 =?us-ascii?Q?T73iH+mM75nzxBam2hJfqTNKSeDFDc72d592L0+PquwADh9Sv4sQGq97MFeE?=
 =?us-ascii?Q?F4lSzbC+vJw/Tdc/smgb37zWcbYi7uGsPk9ejsEaTQP2xc0cSZyBgbdq2M2T?=
 =?us-ascii?Q?UEgcKlZo51GpP1tlePWRWvKcHS5AmZ1nyuc4XiLTl+ioAVqtTHN4fm5PcqDP?=
 =?us-ascii?Q?Vn1zkX1wIL4Ac5Cx/bBDhwRuOp2fAudf+H1FaYFvz5iSnAFbnkHeckEt31yM?=
 =?us-ascii?Q?ktifkK0kTZ3g116CX3AI1DEkmNyD+uLwzkzC30F8Pv9RNsftbtgxXIxclFnX?=
 =?us-ascii?Q?6L/qLV1uufpnGR/A7SlTs0kH3+LKqkTfBvw0opxS5k9sAcbh/QLlpTWnPGNY?=
 =?us-ascii?Q?iLroiUuSUWOnP1OCzBTnBNLa+4vM4JkbLNWGZN2E?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44b5a21f-6a71-48e4-af0a-08dc896b262a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2024 16:34:07.4356 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Nc5evDK19rCBd3Oe/waqTyHYLZXIMj7fIPZwkWZUhqPFh9oHqvZn/dww3nq4tUJmT0nYuD6HxS+kniWIaGR8AVOKHBbq7YRtmWriXaej6Xw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5189
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthe=
w Brost
Sent: Monday, June 10, 2024 7:18 AM
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 05/10] drm/xe: Add xe_gt_clock_interval_to_ms helper
>=20
> Add helper to convert GT clock ticks to msec. Useful for determining if
> timeouts occur by examing GT clock ticks.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_clock.c | 18 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_clock.h |  1 +
>  2 files changed, 19 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_=
clock.c
> index 9ff2061133df..a9392a743fd5 100644
> --- a/drivers/gpu/drm/xe/xe_gt_clock.c
> +++ b/drivers/gpu/drm/xe/xe_gt_clock.c
> @@ -79,3 +79,21 @@ int xe_gt_clock_init(struct xe_gt *gt)
>  	gt->info.reference_clock =3D freq;
>  	return 0;
>  }
> +
> +static u64 div_u64_roundup(u64 nom, u32 den)

Nit: I think this should be "num" for "numerator" instead of "nom".
Or maybe just:
static u64 div_u64_roundup(u64 n, u64 d)
If "num" for numerator would be confused for "num" as in "number".

Otherwise:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> +{
> +	return div_u64(nom + den - 1, den);
> +}
> +
> +/**
> + * xe_gt_clock_interval_to_ms - Convert sampled GT clock ticks to msec
> + *
> + * @gt: the &xe_gt
> + * @count: count of GT clock ticks
> + *
> + * Returns: time in msec
> + */
> +u64 xe_gt_clock_interval_to_ms(struct xe_gt *gt, u64 count)
> +{
> +	return div_u64_roundup(count * MSEC_PER_SEC, gt->info.reference_clock);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_clock.h b/drivers/gpu/drm/xe/xe_gt_=
clock.h
> index 44fa0371b973..3adeb7baaca4 100644
> --- a/drivers/gpu/drm/xe/xe_gt_clock.h
> +++ b/drivers/gpu/drm/xe/xe_gt_clock.h
> @@ -11,5 +11,6 @@
>  struct xe_gt;
> =20
>  int xe_gt_clock_init(struct xe_gt *gt);
> +u64 xe_gt_clock_interval_to_ms(struct xe_gt *gt, u64 count);
> =20
>  #endif
> --=20
> 2.34.1
>=20
>=20

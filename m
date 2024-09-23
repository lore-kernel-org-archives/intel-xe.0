Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E4B0CF9C6F
	for <intel-xe@archiver.kernel.org>; Mon, 23 Sep 2024 05:08:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 232ED10E379;
	Mon, 23 Sep 2024 05:08:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AirB6u8R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94FFA10E379
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Sep 2024 05:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727068095; x=1758604095;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BGfuVdpUnDf3DkbkkAAPzHr8A0g38qLc1bHofNSJhbw=;
 b=AirB6u8R12yS3Um6ClX7bd6HSBADgMbzRSB+IRKB32ReUkvqX9QWinia
 0qLbr1D2mX7yQO15cVSHj9HnKCHbLOn+0VpnlvuBrVBfldL2xj3k8MytB
 6UfnqhU14yP8da0uGScpNO3NnPiP8mvwllnglxIvclKorzwBgaztp/2OC
 Nc+PZDqjn3bpMFyMglc1dIfrOcRMTYQMHo0/vAdfe4TIxS7WnwoHw/68w
 ooSPVW6dW/MrN5fCxmwrknZ5eEznLVHK48NvG3bEvhtvqjU3Dk9eiOlHU
 sZhu19WGaCCBI7k9bijka/TLGipc0LrGr+S1ndrwzPWb88NwF5i1v7OPr w==;
X-CSE-ConnectionGUID: H9xwUzztQG2ch4r+DoZEwA==
X-CSE-MsgGUID: I6PNZHvHRp213LPkeOviLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="51417522"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="51417522"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2024 22:08:15 -0700
X-CSE-ConnectionGUID: h+gv1oCWRC20kKuTPp5nxQ==
X-CSE-MsgGUID: RkvsfDd+RgOFJWOb45M/mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="71226738"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Sep 2024 22:08:15 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 22 Sep 2024 22:08:14 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 22 Sep 2024 22:08:14 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 22 Sep 2024 22:08:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BnZesA44NcgA0qnyi0pq4aH86D+7ci0CcwktkTaraQW1chy7L+/qo+D7WyPOzT65pzT8+oJpgm91qx9S3rIKwVZqelN15FcA6La8kX5Iq93ewDfxK6EPv7hyg9sY4Ixg6k2EPmUswcbUV/vfaRiBl6CY1yfu4UpY53qA91FNdM36pFjhD72AOt2R+qe3qvAdyP6mqvPBMO2LE+lfeGni7hL3bkJMfCKTY19A5HSJDaCRMcY6P/J3LCJRqQ1P9RYNmIO2qVN3t3C81RKQ+tQgYOB+FsjAilgDPHwe41xIJRT/2wGe7S1gO5z2ZDX71uzFcyD5vHLMgsDOSn3QGgs/3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C6ou/Zw1ZD7yiJi8+01ExVEYFaKF1PenzKA3RZ5qhEQ=;
 b=RfZWqYbv2TJZNZt2B/aNAlnnzYj3r22pP90fSX230TFA8n4Z0tIH31VwiQrYkl/PDWgCfBNapAk2dDmf44hbwy5RU+YiS5Rwif8vi3b7GxOYJ4RTmp7rKY/9+Q99O1Bd1vRWbTW4ii372fkt2Qfk+F4uPQ5nAtbf0ZCdcg1wqbiiNuvifPDAG7/jlKCLInCakMUcG83CDSP5k4HleQmI+2FESY0WF18ndlZgFRjojFUptEAGy+gq7yJzW0tBVCWyc2miMzymCSnGxT/EJCvnMo3zHZX9+vVYYc14eBZ4ksfFHkGo/uewij1hAS89uRkfZhO+CZ416V+cBGQr8SO+xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SA2PR11MB5034.namprd11.prod.outlook.com (2603:10b6:806:f8::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Mon, 23 Sep
 2024 05:08:12 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.7982.022; Mon, 23 Sep 2024
 05:08:12 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Sousa, Gustavo" <gustavo.sousa@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Pottumuttu, Sai Teja"
 <sai.teja.pottumuttu@intel.com>
Subject: RE: [PATCH v3 4/4] drm/xe/xe2: Add performance tuning for L3 cache
 flushing
Thread-Topic: [PATCH v3 4/4] drm/xe/xe2: Add performance tuning for L3 cache
 flushing
Thread-Index: AQHbC6JFtc+yyk3dgUKmfd0CWRk1a7Jk1djg
Date: Mon, 23 Sep 2024 05:08:12 +0000
Message-ID: <SJ1PR11MB6204D37AAD6C7B0B68CCB147816F2@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240920211459.255181-1-gustavo.sousa@intel.com>
 <20240920211459.255181-5-gustavo.sousa@intel.com>
In-Reply-To: <20240920211459.255181-5-gustavo.sousa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SA2PR11MB5034:EE_
x-ms-office365-filtering-correlation-id: caace281-1973-4bc8-e16c-08dcdb8db975
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?D+BERhj8lw0E7EvLks0gv6W60FICENJ1oBsrewJIjV8GU9/+dGIbuWCPAdZd?=
 =?us-ascii?Q?Wez0OtxGizuAw5bIV3CGpTNrR48zIUvwtOttlun82doGUMVn52lwxoWgq9+i?=
 =?us-ascii?Q?gTrWQKtXR0mW68Q66LVemYAHv1tC3xDrEPnhKVwMXIwBQeOE1u3eV5fA/kq9?=
 =?us-ascii?Q?Lkwifr4hWZ/qp9/cHfGpWL+k/X2hMxqvvsYFQTELj4N4NVHDAtlI2DlIEC8X?=
 =?us-ascii?Q?K+BFHygTC+nc6wuzR/2ksJUdiOsNoTKhLqQ6kJxbwSoHjMvxMU5G7xO8vWVY?=
 =?us-ascii?Q?bR71zMCdZaI46/31tG7coqnCz1im+fjQVXSUGXf/x2tb92ngKE1A0FLl3FQC?=
 =?us-ascii?Q?x+1c8SRmsblici3MdhrW4uOWYhB2emFbRXmHJOlF0mgvNZM3HoRYSPgbA/L+?=
 =?us-ascii?Q?HTow7fBfYItTiHiDzfl50tlZyDxP0MKh9ssZfPhLBQt2PFfzjkBKw71xdpgJ?=
 =?us-ascii?Q?ZmEVCMx1/2/PNkL9x1Zat+yHZ/vU7vqOkVurPwhYgzWRlvB4Mb88co0xhDgR?=
 =?us-ascii?Q?+hIDsw0uIVOisqeC9FMS8q/PlwMxeNl70ZwRpiscok6Wwhd1autXWVcjQHIs?=
 =?us-ascii?Q?EKBoFD5RXEdyUuy8VV9hPsufeRQGZthkUAnYtFo6kV6qLZkGIk1j/rkFekPX?=
 =?us-ascii?Q?/qEyevKU+tSQPbTSlbyZem1bI8wmphXwQGqgJnWyYCj0zLPCkhZz1sY8lEAM?=
 =?us-ascii?Q?N2053rz9CyzJ6FUiCQpDMiUknNzyVC4AGWCQ+xR/Bi6JmUwRfQ5nV/qnlgWi?=
 =?us-ascii?Q?3KYgKZ1GQwNuG+WPSJmiZ9kN/4OY3ARqM7foOL2BbLGFgfM919epMazOrEFb?=
 =?us-ascii?Q?7xUabo4lP6WJLiV1UYKis2t0EzRB8UQ3c/8sN22Agqm2KlDgI6UCrEHEUSJ6?=
 =?us-ascii?Q?O63hIoMwlKryy1Ux+iyy3Vpd4WqKklk8C81n7s6+yOzMirFiw626w0gClVGF?=
 =?us-ascii?Q?H80ApbXf+KZ7REhw0CPhZIiBSGIcOMVx4UXuilxvlo0Mm9CrmuKrBdpqMjZq?=
 =?us-ascii?Q?RUMkW9s4cs36Rn7WOROyGpqWuJ9IX+jDRxrX+FvSw+Aj9A+8608sFQicbDTJ?=
 =?us-ascii?Q?UR0V4+e76G0Exof10Tul51r+K5NRXL4lgqVO3a2R+IRZRYM0ZXOUOle09Wi+?=
 =?us-ascii?Q?AEM7KEEaHCRWc8jVSmSh16WeralPf1SYvFkD/HYGvK0xiiimixemScf/jUys?=
 =?us-ascii?Q?fyog208P19wpXCr3L53GsP0mbTFwSifej5oc5PPfrZGamyqdPjpQCdICuR/K?=
 =?us-ascii?Q?EIUUsnM6mQWw8ZcMvHOHILeujWZI223SE8gSG4Kf3D6EPuHAe2jHALkmGnLw?=
 =?us-ascii?Q?1pOXCIc4kmH0iinZB5WvYjE2bNghrk+9+DUNiF+I5UL8vg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?44Gw+QRMuqROcNkriH29Lw0I10lNlK6BqqwHKgsFgVP9A7mRL1DLss6lZTmI?=
 =?us-ascii?Q?eOiek+be3ZHctnBWssZr6I978VQal8Ct4ynmtlehkdGsu6K4SITWcQmIacZN?=
 =?us-ascii?Q?M5RsZbmB5VAjLlNOAFTsu3+msNCq0k6acyOtQL/bjAUYIS2dVXNmaiawtib/?=
 =?us-ascii?Q?F+NPXETfmV2eKbAUJReEpa57gGqp90xz2XPx0czEttfYmcQ38FkFpy+iKmIb?=
 =?us-ascii?Q?Cs+wIktK3KF7PpQSDw8kYzdyrBxBf9oIjUjBSG73zrP2goghnjwS0EWVbJnc?=
 =?us-ascii?Q?ii+0AbEI4Rrg3BK7yzgLFb2TTARu7Rnl22gZiOBTBrctNnxu5lFpaHtudALI?=
 =?us-ascii?Q?Co/1Vll9OTvuM38qm1plUHX7zMSuk+4Y+Qdp4jG5DWpKqe7wJU/hkAuRl3aF?=
 =?us-ascii?Q?MTCS2YUMA0MiRmTxKPh0jCokKHbLYAcJP/C87QFvd2In6WFV63pxzDal9oQs?=
 =?us-ascii?Q?Z7PGRj2mkuCtjvcqZCThP4TnGf1CaapvM5PS0F3KBv8FEufeHlDDkGqCH6w8?=
 =?us-ascii?Q?l6l+23V6cbt9nsHbwe/XxNg86wWfMLvT+dQccUOZbQ5uCkmJKHlVHDDXMB1I?=
 =?us-ascii?Q?OZ0WOwypGfZZKH7iHJgv6UlQ7oo3+JU+lOUP6CjMlaoliFBWt4qVEvqBoE1d?=
 =?us-ascii?Q?pYbL69MCbQmeOhj6RyWwd9NvLkH/xNme1XzeTT5Xu+TfJCYkt7WraVORLr81?=
 =?us-ascii?Q?M1HxfCSF2qgpDYUafpuFyOypdSZthez0s6tG/Byoc5TMeYq1I2Mv2mvHQ6u+?=
 =?us-ascii?Q?XjbPQY+Ugq1npI6BUTMqDnU73K9Y48byjUTDdjj+psvl4Y3bryqE7sbdN6p2?=
 =?us-ascii?Q?SAMZcaNrDeN+uWsBH/qvOfqwFhFjd3vwzI1mWHRijnFFp0cAriNUKqu5FnP4?=
 =?us-ascii?Q?Bt+Y/8HP7+0inbOXivee9QAaVD8+9nGHT1MRlOJPopWjacag/gqfpi/Xwdvt?=
 =?us-ascii?Q?cTalLsbC12kDxN4Lccu6/eEBsDj38sVFbD+Z6Vb3IVJ2hxaFWAY0+9eKGfDl?=
 =?us-ascii?Q?OiGOxHHvUCCN9W/CA+wckWfGBRBj57lcBU//p5QfhUi7w3l3TVcAsAJNLHBQ?=
 =?us-ascii?Q?IEKXPUgcFIAJkm/aBDBg6y7mTRwhDDFoUS96c9e/lyQT+myb5dCv1Gmc9PRv?=
 =?us-ascii?Q?07sekKSts0EizN9XgR0+g604FXzQzC4ec0MpWSA3yV/HDIkb4R9L5iQgtZHV?=
 =?us-ascii?Q?XEkbDEg+aTE3EbyoE7KeEUVcjnipXRxKB0bhfiC130dLEwdu/ztp0Ud1VNt/?=
 =?us-ascii?Q?O2PCHwSwBdH66Dug/mc1PZT+Lq8JHsCGF+cVAW38F+JUazyQSnemmqHBWgFT?=
 =?us-ascii?Q?T6f5T54sREJIWiknSULOj6bbhJe0DDFH6fuzo9vqo1l2cre7HJ1TeZHpxP7v?=
 =?us-ascii?Q?EO3Ek/aLEuAX6LjUj1aQJ1t3zihKfvn/bYA81Y97SNDlHz40X7ykf3U9b/8R?=
 =?us-ascii?Q?2YZZktUTBFU1/ZE2i8QoPSVontiW3I0TGaNB2Av4Nbd0tK+tTDL0cGexpYnS?=
 =?us-ascii?Q?i2u2PE+/0k64q3AGgDvTPk2Vzm3JE0AZ9vJxxQYnMxclJ31IUz5CXS6+DEKG?=
 =?us-ascii?Q?VUa9H2AEButCbkxjpEnnU2uUatGiD4tLGY7aDvuS?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caace281-1973-4bc8-e16c-08dcdb8db975
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2024 05:08:12.7975 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vwKDz9LF+FD0rYAYUkcPsY5KuSIfVJMf81UIT5UYyleiy3OR9IeG7FjITr7+k7nkwNjDQxuRLO9194oSf6qs0b2jk9GDOg8/JZZ5rMPyGrw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5034
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
> From: Sousa, Gustavo <gustavo.sousa@intel.com>
> Sent: Saturday, September 21, 2024 2:43 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Roper, Matthew D <matthew.d.roper@intel.com>; Pottumuttu, Sai Teja
> <sai.teja.pottumuttu@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>
> Subject: [PATCH v3 4/4] drm/xe/xe2: Add performance tuning for L3 cache
> flushing
>=20
> A recommended performance tuning for LNL related to L3 cache flushing was
> recently introduced in Bspec. Implement it.
>=20
> Unlike the other existing tuning settings, we limit this one for LNL only=
, since
> there is no info about whether this would be applicable to other platform=
s
> yet. In the future we can come back and use IP version ranges if applicab=
le.
>=20
> v2:
>   - Fix reference to Bspec. (Sai Teja, Tejas)
>   - Use correct register name for "Tuning: L3 RW flush all Cache". (Sai
>     Teja)
>   - Use SCRATCH3_LBCF (with the underscore) for better readability.
> v3:
>   - Limit setting to LNL only. (Matt)
>=20
> Bspec: 72161
> Cc: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 5 +++++
>  drivers/gpu/drm/xe/xe_tuning.c       | 8 ++++++++
>  2 files changed, 13 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 07315eb72eff..8d8f6a113a86 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -388,6 +388,9 @@
>  #define L3SQCREG3				XE_REG_MCR(0xb108)
>  #define   COMPPWOVERFETCHEN			REG_BIT(28)
>=20
> +#define SCRATCH3_LBCF
> 	XE_REG_MCR(0xb154)
> +#define   RWFLUSHALLEN				REG_BIT(17)
> +
>  #define XEHP_L3SQCREG5
> 	XE_REG_MCR(0xb158)
>  #define   L3_PWM_TIMER_INIT_VAL_MASK		REG_GENMASK(9, 0)
>=20
> @@ -405,6 +408,8 @@
>=20
>  #define XE2LPM_L3SQCREG3			XE_REG_MCR(0xb608)
>=20
> +#define XE2LPM_SCRATCH3_LBCF
> 	XE_REG_MCR(0xb654)
> +
>  #define XE2LPM_L3SQCREG5			XE_REG_MCR(0xb658)
>=20
>  #define XE2_TDF_CTRL				XE_REG(0xb418)
> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tunin=
g.c
> index 230369f108ab..d449de0fb6ec 100644
> --- a/drivers/gpu/drm/xe/xe_tuning.c
> +++ b/drivers/gpu/drm/xe/xe_tuning.c
> @@ -75,6 +75,14 @@ static const struct xe_rtp_entry_sr gt_tunings[] =3D {
>  	  XE_RTP_ACTIONS(FIELD_SET(STATELESS_COMPRESSION_CTRL,
> UNIFIED_COMPRESSION_FORMAT,
>=20
> REG_FIELD_PREP(UNIFIED_COMPRESSION_FORMAT, 0)))
>  	},
> +	{ XE_RTP_NAME("Tuning: L3 RW flush all Cache"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004)),
> +	  XE_RTP_ACTIONS(SET(SCRATCH3_LBCF, RWFLUSHALLEN))
> +	},
> +	{ XE_RTP_NAME("Tuning: L3 RW flush all cache - media"),
> +	  XE_RTP_RULES(MEDIA_VERSION(2000)),
> +	  XE_RTP_ACTIONS(SET(XE2LPM_SCRATCH3_LBCF, RWFLUSHALLEN))
> +	},

Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Tejas
>=20
>  	{}
>  };
> --
> 2.46.1


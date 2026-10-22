Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FFB606A31B
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 16:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nDdKe5Xr
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 015E9112805;
	Thu, 22 Oct 2026 16:41:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 543011127C9;
 Thu, 22 Oct 2026 16:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792687282; x=1824223282;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kFO+k+MJtiqiMIPS6Me0OZFmCzmNt3rpvAdy4pnB8w4=;
 b=nDdKe5XranRtkNjryTjb71h0Wt3kQ54W3h/Bdqtcp/HJ0gHkLn0iXq7h
 F3Dtux6AyA2pgb5dUTVwPOpysz5uV6tzjzOIKxeC3hUsyVSRW+SqAcmQ/
 vY1obBvon8D5pEmLl9LFTlFivEQ+Dayr0D3Xw0HoqryiCQxrBGPpuZlqb
 hKBhSrT6Ji2Qq7N9QQ/9plnfnHAphwDtNY6LoEw0j7ZiIszSq/1E8HM+J
 wnLbO3qPesMjez3aWa7188UkvhN8xVI5YJYep18m87IOaOYysMX5VbHB2
 6+V6LBTjmTWU5ecUMkL3rh7M7G95gy21LrIEJGnTxzoF8BwOmP9RSnW9W w==;
X-CSE-ConnectionGUID: J5fvIVLYTR+Nit8UyfvC3A==
X-CSE-MsgGUID: s87kDhOHS0OHpQFt1TLQjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1444590"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1444590"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 09:41:21 -0700
X-CSE-ConnectionGUID: fEOLvdJvQQ6g8mvpkrB8aw==
X-CSE-MsgGUID: 24vrCK2oT+SqMyypsd116A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3797042"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 09:41:22 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 09:41:21 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 22 Oct 2026 09:41:21 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.32) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 09:41:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fxxyXR5KV6zHUu9x3eXbkBYG+mJbueHNPa+zWTvuZYTWSiMvgRZxHsPeqQdZwet4Ze9NAbcbqDIdVUMlsS7SHlzx8XDAK+45qZl/ecFdPl30NRN+Eq+5pzGvtBysj0HOVhE+OJD+XVp+FGsikIMks05K/AViloVA4ehwEiarEFK3mzPq66Cvnv8dKkYRXIbLgv7nizlk4WpUdQTykjxKVpHt3Dr8H7xsBZ2HwwTPf3pdbGIhDmeBp7FYIYz+W5bxZ0818xgdbfSvSkAIniU8aHqlWPdzYJpBQOdVR2a1VVr30zLUN+j2jdVomSVu0SbjvDnoI6teUmtDdj5m/VhZYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2IDYzTvwlx9eDalhiR5KwX5/Dn4g7eTSMGIKNiv/2jU=;
 b=yRd7Vqp+whTaGAdMO6NifjtPwAIMG9g3MXY36kamF5TiBkPfPkgE2+4BdqbKkX+wlUSFvTINDboShEOEo1CphMmJLmbioPiRP094MSYJTuH/ZbquACLlBlRa0U+gzNx4/bOrKbGhlL+5fEKg8NCdc275hWICvyBuW9Ai5Qf5oAkEQ9DsgrFrK/UlSC57m35l1TfNyroNl99LzH2U3E+9h97+Gllx+UVPHF2RTALb0ySr0x9Zs9en4Xa50h+I1+L8SNv+/5DMTCxAh9V+NJFjDcdjDU9Y+v8EzL1i2J325pCtloncvrAAM0RAPxQEsG1HIBtcIN0DPF8d4XNXnbD4oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB3783.namprd11.prod.outlook.com (2603:10b6:a03:f5::12)
 by BL1PR11MB5271.namprd11.prod.outlook.com (2603:10b6:208:31a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Thu, 22 Oct
 2026 16:41:17 +0000
Received: from BYAPR11MB3783.namprd11.prod.outlook.com
 ([fe80::fc32:42c6:f275:4f13]) by BYAPR11MB3783.namprd11.prod.outlook.com
 ([fe80::fc32:42c6:f275:4f13%6]) with mapi id 15.21.0496.021; Thu, 22 Oct 2026
 16:41:17 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>
Subject: RE: [PATCH v4 03/10] drm/i915/dp_mst: Limit M/N ratio for MST
Thread-Topic: [PATCH v4 03/10] drm/i915/dp_mst: Limit M/N ratio for MST
Thread-Index: AQHdRmKBPPnQz3Jb902r3ldfhtBDtLb/CEwggAifiwCAAlHhcA==
Date: Thu, 22 Oct 2026 16:41:17 +0000
Message-ID: <BYAPR11MB37839B7B483C8F26087C2A2BB2652@BYAPR11MB3783.namprd11.prod.outlook.com>
References: <20260917050649.871960-1-suraj.kandpal@intel.com>
 <20260917050649.871960-4-suraj.kandpal@intel.com>
 <BYAPR11MB37839CAA76DDB9487E2B50BDB29C2@BYAPR11MB3783.namprd11.prod.outlook.com>
 <DS4PPFE901A304F44A3DDE4BCCEDD9ED758E3662@DS4PPFE901A304F.namprd11.prod.outlook.com>
In-Reply-To: <DS4PPFE901A304F44A3DDE4BCCEDD9ED758E3662@DS4PPFE901A304F.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB3783:EE_|BL1PR11MB5271:EE_
x-ms-office365-filtering-correlation-id: 4b8d4266-2539-4a4f-10af-08df305b4b4c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|376014|23010399003|4143699003|56012099006|11063799006|38070700021|261021135927099003|261021121427099003|261009223027099003|10067099003|22082099003|18002099003|6133799003;
x-microsoft-antispam-message-info: ymdB/0WUD0xVerNvjU1w5dYbbfxHJIyhB5qDwqx0Kte2twxTzxeUepGhjCYoe1HQpwaTCnABJMqc14zb9VHQzBfGLZlbqkHyMd1ukPOEGCNb6ZumneSTepcW+uxdHc1u1Xt8J4wca/F5bCI37LSaWNQF88yz/gb5qol2g0VKvLyHA0gseRpS27kk0BwwDPwVCOvO4q/RM+7v4AxWAd1gz9K7+qDAWMSUyCCKSQGTymr5VeyxkSvbD6cT42k/zW+iw1AesnjGAHUtRik54g0XmAb8FextH+E8tiNQA+kbziXzMGAAAqvRILFv9eBagTQnnyz1dMGGUZES+3ML4+auLQBhHHxGq1X08QA5j8SSK8+hq3Uja9hIAzQSkqAmS9pIRhi+hUhV0IP2vNCPuLTPcrtkQpCl8geo6fkTNlndw9uGd0LuvJLpr5muPQPbiEcOyIwMrf73cgguxEnh7WXXzVcXC3vqyEUTuuJ9RrbbuzqU2GziwIpvJjqx33V8wH/wQLlD3XHZuIW6cINNrkCkRIwNbqM6pZP//KfOtVGqJFIaS7M7QkfD5kQHlswEsA1h0wupGCtuowOS4Hkf35oPfCorMMRm1qxCbs8hAwe7oflb4STYRr8XZ5alaWB8EkRimkzFD08C1xn/52+rjROe5coHxWReDt7K+5JcjI2Fnp82KsAQtYqQOPPbXS6NVKH9hu5MqwNfLTtphyX6rnKets7iQYLWZfeFSfBM6MVRPlE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3783.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(23010399003)(4143699003)(56012099006)(11063799006)(38070700021)(261021135927099003)(261021121427099003)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XQEx8DTRhHGRGNttWauStBr44KQh0RnWkCsljKAnAyqVtgLHZhXeVVKAG3Cg?=
 =?us-ascii?Q?wjwDL4bF+jY86iMaItnPSdiu1WyF2E3STEj02etMVGx1bcLETKsxchUiGGh5?=
 =?us-ascii?Q?OIxICMGXwl95WNtHnk9K40B71RQbMbChwARtrHpHubItJWhNe3tqBt0hA7UP?=
 =?us-ascii?Q?unZ80nMH+Jaa5mH7K/PqtA4WZXY0+56QwRXvu7dqPBvCbGmqEBlaQ8i1twvJ?=
 =?us-ascii?Q?VcMFN20a7U+hwk7tH86UBVevJpfpMFY+yITWgi110aNHjxUm9nJNRbxWpL2X?=
 =?us-ascii?Q?OWDItmiAxmrdkhamHZTy/IUEM5QEoXcH4Ov3c/zrb/fjPSj8+o+Lrp3Brmkg?=
 =?us-ascii?Q?dThiB47WqwDUoj2YR8l4JkcIwf2/0U7qUdvBNQFgy87QS18gWrzWOJirv1SN?=
 =?us-ascii?Q?UPxt1FmU/hiR9Eh9WIpDU7goyohAsxjkqkSculUX2KqvFgvSgMgHw0lVQeX8?=
 =?us-ascii?Q?5gsWVDEAgqovOndsuHzWaZv6i26BneGNAuZ/apNIi/yESnh5rTLo7kgedURr?=
 =?us-ascii?Q?3hOjDWp+hwdzy6bihYJkh9m3Di9UlTGRLhNbUYoE+LCFgvKD+AfXsLVniZOu?=
 =?us-ascii?Q?OjyNyiwZcYuIhXstFF/dQ+xXP3jiV3mLELzergs2dN6jpt80+kEfFowwKbPv?=
 =?us-ascii?Q?f0KTOWLqfAIxKmT2Ol7Y343A6GFg0cwxnTnn+eStINZLsx9ZKFj633hzm6yq?=
 =?us-ascii?Q?p/oguWxw6IB3aSDeG09n3IYl+yOm6x9E2gsg3V7cSX5F3VnNkjZq84CE4oLJ?=
 =?us-ascii?Q?9I8N59wtPpjS+mYQQPWzEgDjjsrw4nxzDUuI/qGWFBGVnb/JVO8MLW3JpegW?=
 =?us-ascii?Q?06kegYV06xrrUy00K72cqNevf8fwqvftHGCQss5KYaoEESz+ZusD36qx9EyC?=
 =?us-ascii?Q?1P+E2vlMJbrwmcREYuOR1JhtgDRYhu1uV/LHrPw0dY5GTkRAD56tE9E4GIpF?=
 =?us-ascii?Q?YC26iyLi8LfX8+JsOlBZYcr6vmKInAGaYJ3He6b4WviLOh0v6KQs1ttpsGMw?=
 =?us-ascii?Q?zG1WgSx4NZKZtmq6xU3M3o+Jn0iPhdqNXx8ZhBWVPjKT8AHI7BDgpn1IQjNo?=
 =?us-ascii?Q?vQbMnGqB283Y1JlKLf42WWhzEG4KAYuj2vFsL2glVIbBwSyHutj2eonsxawW?=
 =?us-ascii?Q?RKTWAAeKu8qDYn6bHHVrs3ldvm96Jq74asVqp7ltNr2RZixUevWCTQmD4o5u?=
 =?us-ascii?Q?v+FUPEIVe8zG95MXlgFob9R2c+bdouESV8UQWrsIckSuKvhWAWO/yHh2e24K?=
 =?us-ascii?Q?Eate0orW/gHMSumo9f1Osw63o2NI+L8uwkRVrhH78IWb/+QhAma8y5HV/Ftt?=
 =?us-ascii?Q?3yARzBwEG5P/rcYt3Qbw5winbkPQ7SyU4NXLIX9gXVki3HEXSVOMcwaej4ea?=
 =?us-ascii?Q?ZdDbGpLmQ4hlH9E14r/w4yTVXav+4G5rS8H1RD6b3VQKtLBDHy0W7lMA7g5+?=
 =?us-ascii?Q?UNfoIvb4mFf7ccgppw9NkyY9OTHAfFsS2tUJzMuLq2pJoFQvyj1nN+Qlyq7O?=
 =?us-ascii?Q?laX61tlpez0yrLpHTbB0y2IsqqDUJ0PI3CjzZCwIxvwWiAjjQrb3sb3L1t6p?=
 =?us-ascii?Q?A/qul8SPdMbX9WEs4s36o2aVC0Dk01bIUIUeeI7pl1k0j2j4/BJD4cSLhD9y?=
 =?us-ascii?Q?jSDTj0Lle0Rfo95APYxvTXcVQfji4VCEtpESWhm3N+aGtYiW7+yHQn1yk6/w?=
 =?us-ascii?Q?Mi9ALifbq5Zs+tWZzgLQL7WVUozRuJkodzG0DsMK295wLYqYhyEMbulLcy5S?=
 =?us-ascii?Q?IUAfXUBHI7O+0f8lDii3fXElpBeFREH1EiRocaSAywOraCLe+u1bcZ1Q94xP?=
x-ms-exchange-antispam-messagedata-1: I2shxgJaSHxm4e1918odAPsi+yHW8w/Xf1Q=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: YFKwS/RdA0YR+Kw5TM3+uDJJr7A93YQPWRzKN8+4uv7RKcbzrHL/RQ21imWYrubPW9oeAeJzub4yzVMm0Doa3KtE80X1shrAPnTCTIHHC6Sf6qrH424eA3U9X75OOe/rOBk4xk2/lNM69WvQwbXg5joXagPZmb9LqsT450iyNxWKcUcE4/npXgRIMq85AITXepKC0tcMRKbLyVjoPECjHGo2cILuwevmrHgDs0OgUcE8f+CgA6aA6R6QAfaLc2ofUfcpTxCwgqKXYwVIr+mWoMhlXk5iKyI9B92MkLZNjx1LiXKFpHVQvk1svIqPgDCS/w6Mq9OAWyZGCENnKCM4qg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3783.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b8d4266-2539-4a4f-10af-08df305b4b4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2026 16:41:17.2543 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tvi0sw99+IYrMFB7wScylMF9pWfilzMa4wJUSAZwXNkQZC8LNg0bsV1vpXd2QLf5kxNlFNeGHbBfBiDF0a06ZvpL3gV7Z/X/acNoPp1p7mCMzOOFsGnGLH/iirM4qgVz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5271
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



> -----Original Message-----
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: 21 October 2026 10:39
> To: Golani, Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>;
> intel-xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Murthy, Arun R
> <arun.r.murthy@intel.com>
> Subject: RE: [PATCH v4 03/10] drm/i915/dp_mst: Limit M/N ratio for MST
>=20
>=20
>=20
> > -----Original Message-----
> > From: Golani, Mitulkumar Ajitkumar
> > <mitulkumar.ajitkumar.golani@intel.com>
> > Sent: 15 October 2026 22:59
> > To: Kandpal, Suraj <suraj.kandpal@intel.com>;
> > intel-xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> > Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Murthy, Arun R
> > <arun.r.murthy@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>
> > Subject: RE: [PATCH v4 03/10] drm/i915/dp_mst: Limit M/N ratio for MST
> >
> >
> >
> > > -----Original Message-----
> > > From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf
> > > Of Suraj Kandpal
> > > Sent: 17 September 2026 10:37
> > > To: intel-xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> > > Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Murthy, Arun R
> > > <arun.r.murthy@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>
> > > Subject: [PATCH v4 03/10] drm/i915/dp_mst: Limit M/N ratio for MST
> > >
> > > From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> > >
> > > The hardware does not support DisplayPort configurations where the
> > > ceiling of the Link M/Link N ratio exceeds the limit. Enforce this
> > > constraint for MST as well.
> > >
> > > The compute config path needs no change: MST goes through
> > > intel_dp_compute_config_limits() too, so the link config filter set
> > > up there already excludes the configurations violating the ratio
> > > limit, and MST fails there if none is left.
> > >
> > > What is still missing is pruning such modes, so add the check to
> > > mst_connector_mode_valid_ctx(), reusing the helper the SST
> > > mode_valid uses. It walks the link configurations and only rejects
> > > the mode if none of them can satisfy the ratio, rather than
> > > evaluating it at a single link
> > rate.
> > >
> > > v2:
> > > -Drop the checks in the MST link config helpers, redundant now that
> > > the constraint is applied while computing the link config limits.
> > > (Imre) -Share the mode_valid helper with SST instead of evaluating
> > > the ratio at one link rate, since the link symbol clock is not
> > > monotonic in the link rate and there is no single best case configura=
tion.
> > > v3:
> > > -Now that intel_dp_mode_valid_m_n checks for all configs just call
> > > that
> > > (Sashiko)
> > >
> > > Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> > > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/display/intel_dp_mst.c | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > > b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > > index 0c362784afe4..823fe99ca0a1 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > > @@ -1565,6 +1565,11 @@ mst_connector_mode_valid_ctx(struct
> > > drm_connector *_connector,
> > >  					   min_link_bpp_x16,
> > >  					   bw_overhead_flags);
> > >
> > > +	if (!intel_dp_mode_valid_m_n(intel_dp, mode->clock)) {
> > > +		*status =3D MODE_CLOCK_HIGH;
> > > +		return 0;
> > > +	}
> >
> > Since MST appears to use only the max_bw_config for link
> > configuration, should the M/N ratio check in mode_valid also be
> > performed against that configuration's max_link_clock? Currently,
> > intel_dp_mode_valid_m_n accepts the mode if any allowed config passes
> the ratio check.
> >
> > For example, on DG2 with a UHBR10 MST link, could a ~1.3 GHz stream
> > pass the check using HBR3 but later fail during config computation
> > because MST uses UHBR10, which does not satisfy the ratio limit? If
> > so, should the validation use the same link configuration that MST will
> actually use?
>=20
> Lets start with DG2 does not have UHBR to begin with.
> Also compute doesn't actually use max_bw_config. MST goes through
> intel_dp_compute_config_limits() too, so configs that fail the ratio are =
already
> filtered out and it picks from what's left. In your example it'd just use=
 HBR3
> instead of failing (DG2 has no UHBR anyway).
> For mode_valid I didn't want to check only max_bw_config, since the symbo=
l
> clock isn't monotonic in link rate and a lower rate can pass where the ma=
x
> one fails.
> If something slips through, compute still does the exact check.
>=20
> Regards,
> Suraj Kandpal

Could we double-check the MST path here ?

My understanding is that DG2 supports UHBR, and intel_dp_compute_config_lim=
its
pins link_config_filter to the max-BW config for MST before the M/N ratio f=
iltering runs.
If that config fails the ratio check, would the stream be rejected rather t=
han falling back to HBR3 ?

Also, since mst_stream_compute_link_config uses the same max-BW config for =
port_clock,
should mode_valid check the ratio against that config as well, rather than =
accepting the mode
based on any allowed config?

>=20
> >
> > > +
> > >  	/*
> > >  	 * TODO:
> > >  	 * - Also check if compression would allow for the mode
> > > --
> > > 2.34.1


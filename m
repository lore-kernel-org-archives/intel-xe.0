Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8369E77182
	for <intel-xe@archiver.kernel.org>; Wed, 11 Dec 2024 18:57:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9343C10EBEB;
	Wed, 11 Dec 2024 18:57:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EG3uS/sZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AAB710EBEB
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Dec 2024 18:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733943444; x=1765479444;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LJh7i+7ykLWbwHKReYtTC8p6TySBGLbczqQy/Dx/sx4=;
 b=EG3uS/sZc82G+ApCFjyolqCM8lLgivpW/HXg6KHFp907s7YlB+qcXZFD
 xRrpjLONlIJ9z79zMPROo2jdRcCY6LZwFiMTFr2YAsUL4CzlSD10Cp4TS
 XjQ2bJh26iNaKZuZ+Csp+J2xDw0sLM4JzR7AHeqGxDyGpml1OB3hkqzpp
 TxIPySKtk80IpcQXclTht6KyeloOJzMJSDAJYL5vB4lo5hJLlCmc+diHp
 0epq8WijqKp7o30zWCreoUq60dY30NxSsnBv5qZLDPevRBEjhSzQZEJew
 0AnfevmJ+3dFsMsVoNBjMFYgdu+WcYwDbgfDpTmqG85IT+U8qteXnIo6u Q==;
X-CSE-ConnectionGUID: 6HzROHW1RQy64nWXHuFGwA==
X-CSE-MsgGUID: Btavb4UwTTa781VGCRJRNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34476182"
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; d="scan'208";a="34476182"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 10:57:24 -0800
X-CSE-ConnectionGUID: 4xVJfUrXRfuN2CqkZNagTg==
X-CSE-MsgGUID: wetzrcpfTv+/V4fmaD+sIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; d="scan'208";a="95776588"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2024 10:57:23 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Dec 2024 10:57:23 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Dec 2024 10:57:23 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Dec 2024 10:57:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a0ACqENmeaEiNavsP5i1gRYfYZLVKjipu/FTa3sfqRyU1z3NHqxo8JHmIAuidQBlryzHHL+EVRqK/wmrDTpbw9l0MtxP5b5LOJu18K/QfCl1iQz38AlOKJnEROJmI9zUb998FrxqpjPfOm86iw3jCgMVmpUx2DAgdQqOy7t4qSsMGydg5eLrbJVrlSB+ucDjIoyKiUcQCTl04oc0NqYLTVe/6Xe7P2w8lgwkTFt5DE2mZ2iqSjsDOnzj104El73EgUvjC/0vW3kTimXVFSrRv9ix1M22CwK2XbTTEtNsQAqsvPi36+fcujqzsH9F+Q6df8altcXs97QBinHkOS7H7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=08gcUB7jlNb8LHavEyyF5Wy+ggdnYVWJEjnZmgiF7Vw=;
 b=CSdhiBT1Qr2FM7Ta4xX9NCLcx+/qIE8iUIdnIHHGXSC8qCwfEB3Xwe0PaGyldHlWJRk9RW9gVjLUMzCMQabFDKbBGo9XYDAFxqMDVLmtwA2Eu4EIRnuN6v2+mWLhPsFnHvb3SA7D8x7gp5BAKBz/Bwnht5sVz/ITGp9chEHbfZjhQK8muK8TS4EZIhmiTKXf3sXfBYVA7kO8vhDQh/B8Ue81ydZIxz/cv9QeqG4B4bT44TfJYQ845wyOHLQF5ILdNkufOa7a6mdlkBsdQjrJ63KcimJPZMs0vqv3ZxAvn15/45h06pa65JJQm/f5ggkKO/GscTEdxmNl24Zjr0NcHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DS7PR11MB6199.namprd11.prod.outlook.com (2603:10b6:8:99::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.18; Wed, 11 Dec 2024 18:56:38 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8251.008; Wed, 11 Dec 2024
 18:56:38 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Harrison,
 John C" <john.c.harrison@intel.com>, "Narvaez, Jesus"
 <jesus.narvaez@intel.com>
Subject: RE: [PATCH] drm/xe/guc: Enable WA_DUAL_QUEUE for newer platforms
Thread-Topic: [PATCH] drm/xe/guc: Enable WA_DUAL_QUEUE for newer platforms
Thread-Index: AQHbQGlOD3JtgkfPRE6aFFhrVHQFfbLhdt6g
Date: Wed, 11 Dec 2024 18:56:38 +0000
Message-ID: <CH0PR11MB5444295F27D256C3970B419BE53E2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241127011105.1306924-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20241127011105.1306924-1-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DS7PR11MB6199:EE_
x-ms-office365-filtering-correlation-id: 91410cd6-f2f8-4b0b-e54c-08dd1a158af1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Ol7G1g2CZvb7yVOfUDZz+8JDfYKoyiHc/OTsoq8Yex6NGaPFaZ2k3vxf7cZ0?=
 =?us-ascii?Q?eHbwnKOhC+9EJF/W5a6ibuXenOyJO1HdhuNwQaY0ad4ZTBbwh77HE51MUv63?=
 =?us-ascii?Q?4ikyz17STkAF0QfEut3CsKkHtR/ePAnEeu/lsLuNKAqeock9WJVMmFFX6c2t?=
 =?us-ascii?Q?/E3P0iZHhTlORwRdB9PfAPNiL1f8F2Mslo2JfjeFXEzAJF1ATxkkFXjJjryl?=
 =?us-ascii?Q?oe/FyaxcyYGwwdPVHkscAxK+fmid4fPU88wbd+4euoztO1kPCZwaLGXUqsFd?=
 =?us-ascii?Q?XbVlNmrX+JWcC3gBomJGPegeZrlXnCt0oX1A9GafrEXG7JD3eax1pFLuitHZ?=
 =?us-ascii?Q?9e8Ht8jzfPx4jfhfPAOGpy10TKaaW5KHhmRzn6kisYtYZSOrcX0D+9gixas1?=
 =?us-ascii?Q?aJm2cU39ismy0hOP5DKprxMniOjBk+TnMkDyq9HCfNxTnPQqc0GiQ7XCHdoe?=
 =?us-ascii?Q?Z60p56eXEOdeNZuSNE1dZkyJBQd2aqUQi7UIfr/y0fyRRONb3XNrOnbNh8kW?=
 =?us-ascii?Q?pQXNrzvnRWed2zWbSSWigU3fA0N/5CPF8MFqOHXm1lTPexw7oIZr5CB3b0uX?=
 =?us-ascii?Q?3Aw9Wl8RF+REY8grpJGOR+A/gdS6Do3kaqYMzG6ZtYCXLQTE7Y8bjufntKnR?=
 =?us-ascii?Q?LKBXRrSmLnP9FDrag/pQY2qCInrqShV979Bg/9/QVn5Hzuu3gELDyksOJ++z?=
 =?us-ascii?Q?YgXIIFK6gKNBqcgSBPTw8sYfbKid6jN+ke9Ba8aFBK6nfUuNvgpP8O2sy5y1?=
 =?us-ascii?Q?dAgES+ELCeHOvI0XikghnpprhsDQ0kNZ/EDIWY/wWztJsT8keFGfbpADlSNu?=
 =?us-ascii?Q?E02l+Rp/Q+f/OB15oWO0eaRmxcurJ6rNglfXonJ5jGlCEdntxhD7Zu2Eaeyn?=
 =?us-ascii?Q?KwUnAOp8QxZJJFfQMoNTymssZwdELlOPLFBPd7VfGnfZgEQa/jLn3lO2zzT8?=
 =?us-ascii?Q?WRwnXbLf1sKdh8piyppzaqHXIJ6WmWqS/ryBm3aWHZXgn+0XV+HZFFpNSzm0?=
 =?us-ascii?Q?N9O1fnpK0CXAzbRlUQodmxOaRmS3GRNh5TMwwMZkCjwxCwk4vxKrdm50GmBk?=
 =?us-ascii?Q?U6w4w//CeSPdbO3M6ASbUnxOnQrPj/2sXWc8X82Wp04BmVgIdBVe3XOaHrNL?=
 =?us-ascii?Q?aw3gRnxroODRwta/Mq/8A9eoRAyYJ5Xj1RUi832d3xpu6CgHKYAzg1KooWbP?=
 =?us-ascii?Q?9SjzpgqeQmKYEuW2Aynd1T7M9BFoH758Z/4QBK9wCBpkJLz5xkdjyNePU0Ph?=
 =?us-ascii?Q?Vl8MLYF4v1EMrsMlOCHDuUZ8rODzbohGWRjLWANhyBMkhsYy3zQl5Qheiozb?=
 =?us-ascii?Q?w4UkH2ViXPb9LgBjCLuTyRDj9ZpiaZmb22coJ9BiAVwTkbedvqs1BVN1Nw1j?=
 =?us-ascii?Q?+l/CS02O5crBu3MvFgFaCEltt3xrYgEy1oU+nZaNa1zJAAt3iw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Pcarw6WM1Pv/zTW6g0H0T4TYdp4FK1GZKhJV2Bcpni0aZ4UkG/03yU183l8s?=
 =?us-ascii?Q?0nMozr+P2knw21c3PK1VFWoY79Y69Y8JAC9kiXmup+ATGoGlTSljx2obcszr?=
 =?us-ascii?Q?uv9O0yUlCMmUtzVdv0LffQqaIC+BxiU8hXY+KskKjeJzeEdQn5KYDwul46BM?=
 =?us-ascii?Q?vXHLmPI199UcCE0MMMkjFTosft02Q0QNI7P5SVqnJ58/flDfgPUyd9c7gY3Z?=
 =?us-ascii?Q?hkojuDNb2dqghByiF1L6SZ+q+MMnbFTij4frJ95cbV8uqo5q/PjD5B9MxD3Y?=
 =?us-ascii?Q?hg8S7DIzw3BLi1s427zJYt+PJSR+cbk7ypak/NfrXuPO0zEOqhHFvwRm7EmJ?=
 =?us-ascii?Q?N4zFzIuBPqGcoM4WHrCi5cq5bcKdUMYjRUpjg3QzWG1HBbCZiyPDHSajZ4If?=
 =?us-ascii?Q?+EMMVVAHhbvj0yhf4fXQcAxGpEVawdMOxfo+uOEVHKp7ZR5l8r7IlQtaqFDc?=
 =?us-ascii?Q?b7iG6I+E9/YRCNHQVZWxt8w8Axj51qRpoF2Ol2q5KpD9KaFPmZZtMKcOO4aM?=
 =?us-ascii?Q?5cgUH2Bf4zjYtDXEZ8cxPjqXAgP9NKjfe0c88Jx2LmxcFtEfXPHtjKJRVnv8?=
 =?us-ascii?Q?xQuCAXVhCkd91QMBPL9L0ndNkXN9VMBVsvU2kYdNFcEkjPnBOhWvsGEGlxfk?=
 =?us-ascii?Q?M/6NAwcDydBwfbmEu9LjFnzpYGTvggY4ua+V2DR4Or0p0PcN23p70YXiQ+pm?=
 =?us-ascii?Q?wfwFIQon0P6Cde/8dxg9S1dkZS8YA/v8SFiIGB1hlL8VP5kQxTFfRYi1ViUk?=
 =?us-ascii?Q?FAYE1bdkriUUyqCdthyGIkGd4s9pMLNZP6ma231dOFY2AWlYg6lv0t2BaQcr?=
 =?us-ascii?Q?NVywzLIpsRd2CIaJLTUXdHB35K/zX4i6ZgOgtDUpW+4DAkeHbm1EFrFQpE/a?=
 =?us-ascii?Q?m3NNqqpjalBP4CIVkCZ3+0KqdMpAdOjVb47onBOguvLtE+qIH1JiVmXerRYS?=
 =?us-ascii?Q?j+fs7NszPbdsiMoyYgcgjLK6Jnvn43lPSFjNfs16bgqEqa3GQSjK+evezoIX?=
 =?us-ascii?Q?NZy9NuoxCuHGg7XuxXeN5g0+GO1DAplIWTmaoJKsw8IRD+afLI7ME3Jb0er1?=
 =?us-ascii?Q?mXHTjNtP+08a/itDMvGcRmEIhhhJik4BE6TJLrCTfIBH0TPJZiaOAv1dwMko?=
 =?us-ascii?Q?Ph7xwmiL/ziPISB3a2+yBDL2Vh1+hlHzFjFijOaenQRIh3OoEy0cJswJFgRl?=
 =?us-ascii?Q?ia8L25R3m6Rt5wVrppOr5c65ch/dLjHj18DVxJsojHnXdYcXTqZhFR9Vi7h9?=
 =?us-ascii?Q?k8nUT9zxzvS4R95v6T7RGNxerzuvbcd4bziWai7swqlEdkfvb9I5mfP/EpiY?=
 =?us-ascii?Q?ExmdzfqrFwkNXqGBx03OdgxctMTFfiZRzQroQPMKHeRqIc3KRl3sq8uCapuC?=
 =?us-ascii?Q?73W28jRcUV57Jop/QVADQWWjhPX00Gs+Ob4Kpp55QfRSa6kRQojIxBR44xGY?=
 =?us-ascii?Q?OinVLn7dMN6EncKihlfIMQF0k5WzxgNTWL/1XXLP0YpehxtWPgQyViI6cAq1?=
 =?us-ascii?Q?T252ydPDz20V/ER/mMWFgpmxi3Q0AutfVIgkhFhimn3t0dKrPvzQRnsviBN9?=
 =?us-ascii?Q?wsEfG1slMWVt0iVQ5eHOCLiQaqBz8VEtZUXA7L2D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91410cd6-f2f8-4b0b-e54c-08dd1a158af1
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2024 18:56:38.4166 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hWClMpb5QS5FFfa5wxUODqB2/i1golovQHxQ0/KN8c5V5QHzJSADEYqLw3LJe0ThXJQOaEQJIBgav/wtO8nqvP+b9trgV1/UDSSeMWbsB34=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6199
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Daniel=
e Ceraolo Spurio
Sent: Tuesday, November 26, 2024 5:11 PM
To: intel-xe@lists.freedesktop.org
Cc: Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>; Harrison, Jo=
hn C <john.c.harrison@intel.com>
Subject: [PATCH] drm/xe/guc: Enable WA_DUAL_QUEUE for newer platforms
>=20
> The DUAL_QUEUE_WA tells the GuC to not allow concurrent submissions
> on RCS and CCSes with different address spaces, which on DG2 is
> required as a WA for an HW bug. On newer platforms, this block has
> been moved in HW at the CS level, by stalling the RCS/CCS context
> switch when one of the other RCS/CCSes is busy with a different
> address space. While functionally correct, having a submission
> stalled on the HW limits the GuC ability to shuffle things around and
> can cause complications if the non-stalled submission runs for a long
> time, because the GuC doesn't know that the stalled submission isn't
> actually running and might declare it as hung. Therefore, we enable
> the DUAL_QUEUE_WA on all newer platforms to move management back to
> the GuC.
>=20
> Note that the GuC specs also recommend enabling this for all platforms
> starting from MTL that have a CCS.
>=20
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index df1ba94cf4ca..ddbfbdf901b0 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -151,7 +151,21 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>  	if (XE_WA(gt, 14014475959))
>  		flags |=3D GUC_WA_HOLD_CCS_SWITCHOUT;
> =20
> -	if (XE_WA(gt, 22011391025))
> +	/*
> +	 * The DUAL_QUEUE_WA tells the GuC to not allow concurrent submissions
> +	 * on RCS and CCSes with different address spaces, which on DG2 is
> +	 * required as a WA for an HW bug. On newer platforms, this block has
> +	 * been moved in HW at the CS level, by stalling the RCS/CCS context
> +	 * switch when one of the other RCS/CCSes is busy with a different
> +	 * address space. While functionally correct, having a submission
> +	 * stalled on the HW limits the GuC ability to shuffle things around an=
d
> +	 * can cause complications if the non-stalled submission runs for a lon=
g
> +	 * time, because the GuC doesn't know that the stalled submission isn't
> +	 * actually running and might declare it as hung. Therefore, we enable
> +	 * the DUAL_QUEUE_WA on all newer platforms to move management back to
> +	 * the GuC.
> +	 */
> +	if (XE_WA(gt, 22011391025) || GRAPHICS_VERx100(xe) >=3D 1270)

This is acceptable, and preliminary testing shows that this fix will repair
several observed issues.  Though I'm a bit confused why we aren't adding
the additional graphics version check to the workaround itself?

Is it because the workaround implies a hardware problem, whereas the
additional applications we're applying it to here are not related to hardwa=
re-
specific limitations/issues?  I think it's a bit odd to make such a distinc=
tion,
but that's just my opinion I won't block on it.

Regardless of if we decide to keep this implementation or merge the check i=
nto
xe_wa_oob.rules:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

By the way, this patch was also separately reviewed by Jesus Narvaez, so
don't forget to add their RB in as well.
-Jonathan Cavitt

>  		flags |=3D GUC_WA_DUAL_QUEUE;
> =20
>  	/*
> --=20
> 2.43.0
>=20
>=20

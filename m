Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C771C0218D
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jan 2025 07:27:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4F8710E74E;
	Wed, 29 Jan 2025 07:27:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c/SRuOAz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8478610E74E
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Jan 2025 07:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738135645; x=1769671645;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hS0GS0DeYZcsjU1InkIDTzPNPkloAybcSt38iQH6YW4=;
 b=c/SRuOAzWoLwZn3zz5pHMgxUF7H/biPa6GJQpuXjTKljFAJw1TL07sss
 YGof4LXzeP0KPcYLIw4OdH49OvwJmJIM8ujaceFaWInE893ebJTG4nPyZ
 31PLvVLd3+L9CnH5S16531WWtK0Bhtamje7Z7iSnX8RWtCcuZ+Cgnw1u6
 Dxj8Y3Rm+rJkStm3i7kt6wEgkQz6lETcihaAH10wW0W+c7mJzXqWS4SAi
 CXutw7qWSTKuID2sz/NUBqsQWrBQKCnieb3ZYz9/3U0tSjYiEVgZkkIca
 dFikyxAZbvvUyREnE4BMoinp46AVwmMwd/mk3bGU982Ydv2/shfRz+N3p A==;
X-CSE-ConnectionGUID: WCwQsscfTQKEDVykpsbz2A==
X-CSE-MsgGUID: MZbG71gGTkSAmKFOrGVLdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38777088"
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; d="scan'208";a="38777088"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 23:27:19 -0800
X-CSE-ConnectionGUID: gcixOfrZSMOISAcDZvHxXg==
X-CSE-MsgGUID: 69pGYubgRWOBtY+AvNHufA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="109410393"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jan 2025 23:27:20 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 28 Jan 2025 23:27:18 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 28 Jan 2025 23:27:18 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 28 Jan 2025 23:27:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fh6PqWMyawbsq/QpiwV8B9qZiEFKS0D9KnX/IWodc4Sc74pUxAf/XTu8l4iE2SlCLjueyOZVWIeIvlOoy+MTWPtbTLJArVUhrDTGZl546wcGG/3g3fItdq1NNG79rNAEaoeQ8/1qhS7wYDguDn+LLLuvjtO/UPqTgG7s5am9EW7AbAL3I8r7hVjN3CBmq81YX+FySivGpZbs7j1Ib7dnLhZB5N3E+o5zEbXMtgNy21lPabJ1OIlCuJ2SVief8Fpr0WUsmhPJtCop1RrgE+X2CBV6UGz2fom3w/K0EMaMsNiadCu1U98AxxOAiZs4Ps8N5KwZf/IyHO6of9f+KEbEQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kf7vP88rcQ6WjMcw10u+NJf5x9fvNyK/+WseIWv+lqg=;
 b=Hqj23cHEoWat19iMBiYnSoaTWhybRpfN3W+Z1a+jvl7O0BowOdCM9mG419d89ijsNehkFnEjo9K/wvISPNaiitjrk1K6bfqc9Ryv9Gz0+XH23HLjOTvpRmP0oKUvFsaUC2n0C4sc9wgBc4UJR0P2lnH6PhVt9RO65zETS/VunN3xy8VLwxzkVmL8bFLd5DFiDi84ujJaGsFzx3yHypxSl5fRhq0WLhOat5f5o8yS8idmPAy1gBikMy8NYoevB31sIX/y/kq7sADvTVJuVB10LNn7cXUv4XfjuwPZvqeZQSfdubOyxjCKTqd8aFrTCbW3ZSu45g0eqHuEKayZuOZ5yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by CY5PR11MB6089.namprd11.prod.outlook.com (2603:10b6:930:2f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Wed, 29 Jan
 2025 07:27:15 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%4]) with mapi id 15.20.8377.021; Wed, 29 Jan 2025
 07:27:15 +0000
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Tauro, Riana" <riana.tauro@intel.com>, "Gupta, Anshuman"
 <anshuman.gupta@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "K V P, 
 Satyanarayana" <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH v6 2/3] drm/xe: Enable Boot Survivability mode
Thread-Topic: [PATCH v6 2/3] drm/xe: Enable Boot Survivability mode
Thread-Index: AQHbcWgj9JUpM5c5skCa8W0kIS57QbMtWsTA
Date: Wed, 29 Jan 2025 07:27:15 +0000
Message-ID: <LV3PR11MB8695E4F9F25BC4D3E1638459F9EE2@LV3PR11MB8695.namprd11.prod.outlook.com>
References: <20250128095632.1294722-1-riana.tauro@intel.com>
 <20250128095632.1294722-3-riana.tauro@intel.com>
In-Reply-To: <20250128095632.1294722-3-riana.tauro@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8695:EE_|CY5PR11MB6089:EE_
x-ms-office365-filtering-correlation-id: 58435164-8e13-4e1b-d2c2-08dd40365af1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|10070799003|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?AaNzQVKT+3mzHUvjn6FJZT7AQFpLx9xKXpj4nSAVaP1joXfiEKSrZqDrOwos?=
 =?us-ascii?Q?SJeIqQQPyijI8Sh+7W6SvZ3gHX/jMBCi3IjrxWwO6VKijCARbqRmbGt8ZbuG?=
 =?us-ascii?Q?Ejuh3hco3L7w75C1EAmX52MGC9W9faDbFB2tmXCFtNNzlHjTjI62lYR/MdOM?=
 =?us-ascii?Q?X/t2M2vIrZrA+Oka/qdbo2RV2kDbiDVir3IHeJATrMjX+oS62V3X50+OV4Ku?=
 =?us-ascii?Q?jGXHoPzK9axeLfk9msA62PY9h1h0wvybKOObyxl0JYcy4CfEMIM9+vxoSnrD?=
 =?us-ascii?Q?3EXDSqcZgAfLgf3/WgzfY0M0HlJhmdaRr4Gyy02kV2m10SN5wy71quMXZ1AI?=
 =?us-ascii?Q?8wChP5lyBFjYT+0k2KpwBQTawF9aiDrEtldf2Y1krCKbd+//JYjiLk8cbih3?=
 =?us-ascii?Q?Detr4M4mHCYCtsQIiDMn7/Qod7iyd56EK+yk9kvP7NZfZKlXNHpWh1CfNtFV?=
 =?us-ascii?Q?J8VsCESngbsnCIhkZKWr5d7KZJY6Y17OyPbXchQC8GUJfFFZy3vWoPytYG++?=
 =?us-ascii?Q?RzGbjx3KHhCkbE315FdMbtoOuxTjwqKthS/zDCYEfj2cUk2//WzK+eV6OD4F?=
 =?us-ascii?Q?5h0uNWX8eYuxbJOeDE4mzPYWcMuyk1ekbLoadM8+xY8/x9ZyOM1NbmLjXAKb?=
 =?us-ascii?Q?Awxi7Y4KhhQsRl4WT+IKaH0xJmtrXCxtuUp3bArwleUj7Wyz5YLNFHuLf+50?=
 =?us-ascii?Q?r54Me9XTF1rxslaS1JcoVBJuG087M4uPukfKaRJD05eyDHyQvl7OMwGwOLiy?=
 =?us-ascii?Q?MM//u83G5fmvlbf3RzfSEaligap3uulDbYx3huVKrkjdqRMVMZYX+vx+d9Uj?=
 =?us-ascii?Q?9GZst84IxeFFmKIVftej/4AIBdWVzxznnxfvNhBWRp1NU7ODV6wDzJVuqOUe?=
 =?us-ascii?Q?mzSpgn3n5VdueFPAIW6FaSuzEkC78T+4VjRHDQ1JoAfvcHAGLJbYm1dSUKGx?=
 =?us-ascii?Q?YN0Ka3ffRabIPCrW3oW+JZPYLpiikhPWhtKhZKoeJVooUedZTY4sPb/wc8+8?=
 =?us-ascii?Q?++ajn07WoCcnTUz/znqDk9NazKVE43Sg6QHVbEtTPd5UlLp1nbgvfLHc2a4u?=
 =?us-ascii?Q?dW6SlPgbJ+QNpSZjtREoCCRBBCp/t3C2g3lOAYJEZTCsjDoyUrfPG3GvIe8a?=
 =?us-ascii?Q?398CBJgAuobXh2azDltp2jpEO/yWOljLQBkch6aAcVKKMm3JbWGvEQq+A1TK?=
 =?us-ascii?Q?+O5VcxuBpgjCuSOIZ7kJp7U79BK3YvHCETux7phEGTkfx8y+mzMZXm0KlaUw?=
 =?us-ascii?Q?yJz81pzM7eL1IBZH+HSyiBGAYx29KWin14/MGgqoDuUq1m+pYrnHWYy8zHi+?=
 =?us-ascii?Q?qguOkqW2FTVSrGmIGOO9xPEl/uV0FxCoMWOQzoUrhwzjmfKLy48VV2rk921P?=
 =?us-ascii?Q?kQlrQ+SJBaIGrlD6F84NA8EFsyXh0tsL6qrWPCPljZNqy1gdZKLvMX8/xlH1?=
 =?us-ascii?Q?cfXUoPdLoVDtHzveqIoz7/v3FSVUVouG?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(10070799003)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XE+N64mGaKxf+YZt4nvQ7sHSz3gm/5v29QI4JmZAROI68DRxDO7i1AU0edYc?=
 =?us-ascii?Q?90xXKiZbXXPGoQy4Sjckn8BNVOo+fhwc8etNcxNfgJjnekt/9ACamuTc7njP?=
 =?us-ascii?Q?87Fm7lwkIA+xL2QXRQMC1ejGBRgvzNxoSDRN7OGRQjMtA2ib+ONz4/akow4T?=
 =?us-ascii?Q?yvcsd/mzWrIg207JCDSJDD9gNl+pleB41jZPsbBs+kIlBlOxeoRkEZD+ys1L?=
 =?us-ascii?Q?FXpM3HCU5bf+Q/3CdaaZZI2Rzh7YoMLlO0JZapwU6YK7ZNwXY1jZB8SJnmZS?=
 =?us-ascii?Q?ZaaAhnc5pTbmNWm5TheTBbKudfEC1zaigKMy6XIPbg8f5KXPOuD26wbvqsU4?=
 =?us-ascii?Q?gEExxLmdsZgSRO52+JEJfXMjOukP0JFnjqYFN3i43061Mg32nRmsqTcmXq4J?=
 =?us-ascii?Q?i9Otu0StfRPzEQNDC5mla5cnKAvuZuRZmWw4/FgQw/W3AT6NZQwEzleIMwUo?=
 =?us-ascii?Q?PBdZ8GUTCXMMliWMYH62DNigL4aaOK2JJjCvvz2Pxbrp7QRsuGds9KNNMy1k?=
 =?us-ascii?Q?sM2Zi5Q7R863H2aUD7j1/Y2/OHQLS7YtLVUdgoCNPBeJ1wQ5OW0ulZRMOd20?=
 =?us-ascii?Q?fCrA74w+3zBBe0TQX3hOK6lDiduqNd/SC5t+hP0FM7qHd1zr7bXhYC/2zIf+?=
 =?us-ascii?Q?i7JWTE255oWIEdBByKyfGglxIsneAmiXp4xzfsiOeT4++/tvyUeOytcXH/HS?=
 =?us-ascii?Q?jFrloBtvbRRG9KCrC/HlbFNlbOLmhXNldlrdz5OKffog6UWe58ZhmvziCZE+?=
 =?us-ascii?Q?BtJJfiadDLekiCU9NOXPfqCjvHjEsWXrzBa917qIra1oVzWxh5umUog6wK4a?=
 =?us-ascii?Q?rLC+dRQ3sM9PWQQ8aehqnHdLOw/oZARWCkVgfsGjOGwK5A+PCfUg4K/cAo2E?=
 =?us-ascii?Q?4UjRrg+EhcuGY1rQdckfQpziDYTN+g1yLSCV4QnQukoZ0cgJZ+OMLPFLawa6?=
 =?us-ascii?Q?yfYLuQiFbjUuidLUk+lrY/owBww4tE2RNirw8Gxesof2V7TdPM5My1p1WAph?=
 =?us-ascii?Q?pf8DAGBLmbNR+0ETCia5wlCunTtwWBWHQWaKzSEN3fO1Us4RsT/8hFvN5Ukv?=
 =?us-ascii?Q?d0IhcI4S4VxBkbZ7CK4T92k4t/ym1xA+/eRe6utRT8Z+d/hvcJ47MbLmjkh4?=
 =?us-ascii?Q?lcOfJ5boa1U8TXWOu9/5PIm215brqqzXXVm4F9aayxTjDz9EOCgxR8FTTQcW?=
 =?us-ascii?Q?2AyoohqxzvinOpor+xoAt7XCBaZJc3zUD5HbSl6nokLl7xQt9H6iHoOz10bl?=
 =?us-ascii?Q?bGFDUHcuEZFS39JJ48BVPHAIe1WbRjpmwrl23rKW7oVabogPBJHxV5NiNOp2?=
 =?us-ascii?Q?XhfXAkzYgzAokGaN+Lt4femhPwsfLHEVRXhnhq5O5QSJuV73PX5IwPIfWE9h?=
 =?us-ascii?Q?NOhI6D8fI1BOVUBdsSwaety2F8U8c7h6JwO7v2AUNB1yZpBPmThlgGPB89rm?=
 =?us-ascii?Q?90af766+wgxqGM37cy5geHz587GeOMKP21cNHVIw7F5+GB7quHO8ePO9iURb?=
 =?us-ascii?Q?RZkkFX+qZA3EbhsOzttQVDYVNiUxbc1I6txVZCU4zxEh1DLgMGZlHYxa5I2i?=
 =?us-ascii?Q?Rq7ASKUAVokovbMOhJoOxKIEo6+SHSK9/cXUJ8H0drSmzfh9wyMdCC78UjIh?=
 =?us-ascii?Q?ZE4tYWOzgzKTuouynlNw4BPVDLEQk2Tf8uSPL7sQ+0jLZKI/MHtWKH1cHeze?=
 =?us-ascii?Q?mi26uQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58435164-8e13-4e1b-d2c2-08dd40365af1
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2025 07:27:15.4267 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ph7od6CaI5WXZHJQr+NomyfqlLwfiXea61Hbw32r24jHOAivXShd+rH8nebGwQl9WJ5s7F7rpe/JWc9ustvr17rWmFa1zs6hv7V+6nYg5jw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6089
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

> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Rian=
a
> Tauro
> Sent: Tuesday, January 28, 2025 3:27 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Subject: [PATCH v6 2/3] drm/xe: Enable Boot Survivability mode
>=20
> Enable boot survivability mode if pcode initialization fails and
> if boot status indicates a failure. In this mode, drm card is not
> exposed and driver probe returns success after loading the bare minimum
> to allow firmware to be flashed via mei.
>=20
> v2: abstract survivability mode variable
>     add BMG check inside function (Jani, Rodrigo)
>=20
> v3: return -EBUSY during system suspend (Anshuman)
>     check survivability mode in pci probe only
>     on error
>=20
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c             |  7 ++++++-
>  drivers/gpu/drm/xe/xe_pci.c                | 23 ++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_survivability_mode.c | 16 +++++++++++++++
>  drivers/gpu/drm/xe/xe_survivability_mode.h |  1 +
>  4 files changed, 44 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index f3f754beb812..8fedc72e9db4 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -52,6 +52,7 @@
>  #include "xe_pmu.h"
>  #include "xe_query.h"
>  #include "xe_sriov.h"
> +#include "xe_survivability_mode.h"
>  #include "xe_tile.h"
>  #include "xe_ttm_stolen_mgr.h"
>  #include "xe_ttm_sys_mgr.h"
> @@ -693,8 +694,12 @@ int xe_device_probe_early(struct xe_device *xe)
>  	update_device_info(xe);
>=20
>  	err =3D xe_pcode_probe_early(xe);
> -	if (err)
> +	if (err) {
> +		if (xe_survivability_mode_required(xe))
> +			xe_survivability_mode_init(xe);
> +
>  		return err;
> +	}
>=20
>  	err =3D wait_for_lmem_ready(xe);
>  	if (err)
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index e6ad189294c1..b483c5c90132 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -30,6 +30,7 @@
>  #include "xe_pm.h"
>  #include "xe_sriov.h"
>  #include "xe_step.h"
> +#include "xe_survivability_mode.h"
>  #include "xe_tile.h"
>=20
>  enum toggle_d3cold {
> @@ -766,6 +767,9 @@ static void xe_pci_remove(struct pci_dev *pdev)
>  	if (IS_SRIOV_PF(xe))
>  		xe_pci_sriov_configure(pdev, 0);
>=20
> +	if (xe_survivability_mode_enabled(xe))
> +		return xe_survivability_mode_remove(xe);
> +
>  	xe_device_remove(xe);
>  	xe_pm_runtime_fini(xe);
>  	pci_set_drvdata(pdev, NULL);
> @@ -838,8 +842,19 @@ static int xe_pci_probe(struct pci_dev *pdev, const
> struct pci_device_id *ent)
>  		return err;
>=20
>  	err =3D xe_device_probe_early(xe);
> -	if (err)
> +
> +	/*
> +	 * In Boot Survivability mode, no drm card is exposed
> +	 * and driver is loaded with bare minimum to allow
> +	 * for firmware to be flashed through mei. Return
> +	 * success if survivability mode is enabled.
> +	 */
> +	if (err) {
> +		if (xe_survivability_mode_enabled(xe))
> +			return 0;
> +
>  		return err;
> +	}
>=20
>  	err =3D xe_info_init(xe, desc->graphics, desc->media);
>  	if (err)
> @@ -926,9 +941,13 @@ static void d3cold_toggle(struct pci_dev *pdev,
> enum toggle_d3cold toggle)
>  static int xe_pci_suspend(struct device *dev)
>  {
>  	struct pci_dev *pdev =3D to_pci_dev(dev);
> +	struct xe_device *xe =3D pdev_to_xe_device(pdev);
>  	int err;
>=20
> -	err =3D xe_pm_suspend(pdev_to_xe_device(pdev));
> +	if (xe_survivability_mode_enabled(xe))
> +		return -EBUSY;
> +
> +	err =3D xe_pm_suspend(xe);
>  	if (err)
>  		return err;
>=20
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c
> b/drivers/gpu/drm/xe/xe_survivability_mode.c
> index 9911e9f6b99b..633f5effa349 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -144,6 +144,19 @@ static void enable_survivability_mode(struct pci_dev
> *pdev)
>  	}
>  }
>=20
> +/**
> + * xe_survivability_mode_enabled - check if survivability mode is enable=
d
> + * @xe: xe device instance
> + *
> + * Returns true if in survivability mode, false otherwise
> + */
> +bool xe_survivability_mode_enabled(struct xe_device *xe)
> +{
> +	struct xe_survivability *survivability =3D &xe->survivability;
> +
> +	return survivability->mode;
> +}
> +
>  /**
>   * xe_survivability_mode_required - checks if survivability mode is requ=
ired
>   * @xe: xe device instance
> @@ -158,6 +171,9 @@ bool xe_survivability_mode_required(struct
> xe_device *xe)
>  	struct xe_mmio *mmio =3D xe_root_tile_mmio(xe);
>  	u32 data;
>=20
> +	if (!IS_DGFX(xe) || xe->info.platform < XE_BATTLEMAGE)
> +		return false;
> +

The survivability mode is not needed in case VF. Make sure to return false =
in case of VF as well.=20
if (!IS_DGFX(xe) || xe->info.platform < XE_BATTLEMAGE || IS_SRIOV_VF(xe))
	return false;

>  	data =3D xe_mmio_read32(mmio, PCODE_SCRATCH(0));
>  	survivability->boot_status =3D REG_FIELD_GET(BOOT_STATUS, data);
>=20
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.h
> b/drivers/gpu/drm/xe/xe_survivability_mode.h
> index 410e3ee5f5d1..f530507a22c6 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.h
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.h
> @@ -12,6 +12,7 @@ struct xe_device;
>=20
>  void xe_survivability_mode_init(struct xe_device *xe);
>  void xe_survivability_mode_remove(struct xe_device *xe);
> +bool xe_survivability_mode_enabled(struct xe_device *xe);
>  bool xe_survivability_mode_required(struct xe_device *xe);
>=20
>  #endif /* _XE_SURVIVABILITY_MODE_H_ */
> --
> 2.47.1


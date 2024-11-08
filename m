Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04750D64098
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 22:00:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3F7810E1DC;
	Fri,  8 Nov 2024 22:00:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JIkZYtRG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B02E310E1DC
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Nov 2024 22:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731103228; x=1762639228;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=F5DKd+2qbieLiX5cUajLGeH4vyI8BQV8y8FZPp0ae78=;
 b=JIkZYtRGHKZ3E6UwyiYT2dtstx/UDJnmNwvzCUOLehBwyalePbuBthJm
 pkJ6OTdOnGnVwk5EI+gBskz5nyzOyRpSF/cYLFQd2JJ2fN5CYyPjcw2GI
 YeCYdm8n5XaXONMPwCa+dk/0Fzw1HBdJ9ifdDdG6YiWsp5ppeuaT4Wmg1
 iLe4DOsr7QPhpskhqUHlc43EsMeZeIVvfjkXW7HpsHihFBbkkrOyZE56r
 yBT0M5ufqYzqDI1JsQXpyAB1qsQij2zpnudAxTm732p+bIEQrRrwYKzEl
 qAKIeOZ5mjZm8o4INhfpJrvhavtDYOQA/yed9xONBLEA7BoclDGFsaP29 A==;
X-CSE-ConnectionGUID: xKvPyolBQrmysk/YBvT7Kg==
X-CSE-MsgGUID: xuDtjRtzQtWjvACg7+SuPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30958662"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30958662"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 14:00:28 -0800
X-CSE-ConnectionGUID: lwkAZGEcSQOzC8rD5gi61Q==
X-CSE-MsgGUID: VKAQJK7bTqWjew/cz7/VHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="90602959"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2024 14:00:24 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 8 Nov 2024 14:00:22 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 8 Nov 2024 14:00:22 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 8 Nov 2024 14:00:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W28cFcCrgHWztAdLzlxriEKtI564v92H4MalPAnoHX1aCt+l0QkRaAluLs3IwyQF8VLToNEQ8g2Ikgf2tSiTvIs/i+JT3I65vuBKDfqeZ4vXPxDUNszrco4kaWqFzfuYiyPZUQXTQvVWlhMeq62w9EL7mDFj8ev1+l49nJpBF0ZeQcUG234JPUVGgdscQ5KEUGIM5mPzaEX3E7Cl2UaMmVdvSbXBHD7sJVfotSzdWGLNwigNNebI+eVWo7DMLnTe4wnOLFQu7aQCjg19qoMAAu4aOSV912Vcqn2QN5OXOqGmdwD0kkqUzrZAu8M54Yb7kn5JaymBxMl5UbY/54KpGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AJi7JBjKxzowbEBB/gI6fb6N2JyTL1tjv1U2z/PbcS8=;
 b=jsTBYtUcmfFXoCE5cYyW8fiA9N18Go0/8WusNkbhuqjCzq7e8WpTsk1bjKAzgrlDUUXTsKxqM+B4dUOv+S0WuzUeaAfO5d/kgMI3S8Uui7ARZgv+pD1H+dWZRnm1PCS/x3u46ge9mZPSEFx3+B/GQ9LZ17US3g3nwKOMxWwKRC9EJz2Ard8ZL80qXrHieJbTHKjNO7rxDEm1YWO4Q5Yh17TZjE8Pw/Ten7wxaz5E9PoUHkaSFDrnJ/vDvGxFRHaXcrb/6zeM422ozu950bVtaJUrANw8zvw/VMOjRA9xkxyizdUdMcses+tydtwNwZWaKGc/0RvzOVXwYB0paRqEjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by LV1PR11MB8849.namprd11.prod.outlook.com (2603:10b6:408:2b3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18; Fri, 8 Nov
 2024 22:00:16 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%5]) with mapi id 15.20.8137.019; Fri, 8 Nov 2024
 22:00:16 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>, "Dong,
 Zhanjun" <zhanjun.dong@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 1/7] drm/xe: Add xe_lrc_is_idle() helper
Thread-Topic: [PATCH 1/7] drm/xe: Add xe_lrc_is_idle() helper
Thread-Index: AQHbMgWsYqno6IogH0+4ZSdodJphqLKt7syQ
Date: Fri, 8 Nov 2024 22:00:16 +0000
Message-ID: <CH0PR11MB544480E1A2038A496ADE8932E55D2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241108174312.272792-1-matthew.brost@intel.com>
 <20241108174312.272792-2-matthew.brost@intel.com>
In-Reply-To: <20241108174312.272792-2-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|LV1PR11MB8849:EE_
x-ms-office365-filtering-correlation-id: d93ca431-60d2-431f-049a-08dd0040ba78
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?SBDi0qQoxWlcKvM72g1GrbhQ+bbGRFOmnuI6uY38b+umweqYkjnf/2dsAdH7?=
 =?us-ascii?Q?zJF2p/rotXNgSoby7omANs7kCV5AZ3EHuBbaeTZmqbaZALBT6AWhkxen9owd?=
 =?us-ascii?Q?IWkABAH9vd1uL6BPlRTRnMCEdXKmJTe1XsvIsweALdXjMY+fXgBevyEIW0kH?=
 =?us-ascii?Q?OfK1FrxsvT5mrrW46X/gIRY1WfJ+Siy1zwNgf7YnalQxjhAyyi8ta4yPn+93?=
 =?us-ascii?Q?NJiAMOUJ21gTtbySbSQVHO7fWHLJuXy/XLRVkxP1N8I0Y5Nj8znQ9N4UQcSy?=
 =?us-ascii?Q?eisCnXP22oRb71aKXa2+wzncHdeKVmRVg5z3VJqbMqtsGNu16Uf2FJfzd0LJ?=
 =?us-ascii?Q?6Ug4pVkRuxVhHEvjLL3BVXn3rl3guRYFHb5aagc7lLVoRyBl8RfdIRRXo3tX?=
 =?us-ascii?Q?ia7om/9d9RE3ZrfW3CsB/wZAJT2PKnH6GpC8+/r1EKAfFxhLVXJz1mPCXgZE?=
 =?us-ascii?Q?G5bmsgesg3MWkj+hbaQcyJS3RXz6e1GbY0hvqC1QaNPAvz5KYHzhgvKIFSry?=
 =?us-ascii?Q?rYb8YaOloAuIMR/Zys0cT8DX/0sqQTUYwxiPL3Zk+Ei/1C2cqmfr65e0s/L8?=
 =?us-ascii?Q?MPt1bolT976CQQtqNxRUmRD0yyO591iglPpIPRJy09NdkIRlC9mX3MTbNf8U?=
 =?us-ascii?Q?W2h/UuFIiTYYWk9S0z4c/coXWsyE5+I8WCSWtx3i6/H5OCnu+iEJNUAFRdV5?=
 =?us-ascii?Q?KGRZ8ppQvVH7MKmy4VLYLHyp93Hej37+SXKoHJ9geoSNcw/k5ivMYFN6ZC7r?=
 =?us-ascii?Q?Ik2QxXn1oL9dwO4yYAZq1EwnoPvpF3Uef7mfChuSD/JWaL4qtCEs/spYOZN2?=
 =?us-ascii?Q?CKSFZjLEpCR/2hy/HfjpOf69HPkzw/+KNkk3f8ijoUe9/EONbj23LxywJ8pX?=
 =?us-ascii?Q?6eCMV0JbglQeH1+gmC7aKNF5kE/INJC5kI/YluQSxmey6MxeeYy2kajrCeWF?=
 =?us-ascii?Q?7bxrJMsFoVFFaTy5DHA/RQmJALz4kTX5E7+RnYjUUzf/wqLkLAm8KCrERLbP?=
 =?us-ascii?Q?lUNvVDOOHVyn/NPLdJGkE4PWhIslAVru3bsOro/2riRtmKQk7RtHlntiEyBS?=
 =?us-ascii?Q?Uw2IkFEXSrIpPVZs7ubqYfVWuNwjZMGn3C1LrLxSKDoPnAE4iZ8Qq1budnT5?=
 =?us-ascii?Q?TuBoB1CnFwnDZJtx51iBDJOeiJgEoNdPpUrYNtLCpRPeKKu0QTNSTagNj8TF?=
 =?us-ascii?Q?a+KqU+lGEQGrlkCLlUhsazrL3OOSoZcpUIEdbIcd9XyGLWyNODToMfQaGiiC?=
 =?us-ascii?Q?yu5I8DD6nglm8EJcE5mvXHNj70aoJwRbffjZ/KEei4WY/Zwl835jQb9ia09O?=
 =?us-ascii?Q?KLcN56CcaY16RLFk39AqFadUbp0d4/pUbJ8TPfoIvmBTUgAoZ4wvpJMTjoQm?=
 =?us-ascii?Q?sdgh8wY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?b9fnADgvXgRlaFDDRVpkEolXJhxS8ww00GxdtoKGyFqXL1P3N86jNn2n9bLB?=
 =?us-ascii?Q?RFPyLZToQhN9W4z4Abuu+66Zu4u0u5+Su396o4GY/9/LdaddkIUDnduoZf/H?=
 =?us-ascii?Q?QO3Z4p8Sh9g0a/xiWMciqIzmw+pJ6OfEVKXOCCAlfUj4oVC1mNpcVVwMBH63?=
 =?us-ascii?Q?TtyqMCWrWsbW86H0vP1ew8d6WO4si2U9I5b9UI6lN+6Lc+Mzk86FtrCyJOIS?=
 =?us-ascii?Q?GcrM83e2wLFnYLNmmDe7h7yZJ17UAsgxycxSYOUMP6K2gCultYmTmzEPwLdN?=
 =?us-ascii?Q?Uw890eW0evOkNYGq4MnQhWUjPBbIAX9/nF7Q4bT5dFeF5yfCbxw81samSAJS?=
 =?us-ascii?Q?d+VqwO8cAocSNBM+/ZwNJOhhHY9lx1EpIOMExCCK3As46b8bQRWzhj/l/j8S?=
 =?us-ascii?Q?BssQQZovKIEzQyvwlG7bG9eoq+hKv9/y9WzgFzdJGiOlV0DQ9bDXB+XgFL+U?=
 =?us-ascii?Q?ltHm/RzScuF6dvJDDmeZ76+U9PBo3NP7Kj8exqERTuqYk7IWsjh4AgJXRjS/?=
 =?us-ascii?Q?ZbD5c9OueXO/4240gI866mneYdMAK2K752VoryPI8B40knjDAyDdWc8iZTvi?=
 =?us-ascii?Q?RsH/OMutdB8aDzc/XQZ23rlHD13gx/4i/2nNxSOvVh873sGoPxyikf8HJE0t?=
 =?us-ascii?Q?w5NhuBHGWCruhhUOb+6lkmjlCCDxFEcHzGHFOlDsFGGLk2T9j5ceaqPdaThU?=
 =?us-ascii?Q?tRy/Dh4EfPFoqGHnXQ722huPHOOAdIlwvL5RJS+UW5KA78H10S7BFGQ33A1r?=
 =?us-ascii?Q?J9swxAPruZD16H4yqsutHxuOL4uD8vCRpFTPxpEPceBn5jBOpkJUaMKpxY5i?=
 =?us-ascii?Q?TVonPF/89kF77F6dLxSkw+TcR6O0XPYOLxoyGn+CBUO2mXSfA37NNG6gFgbQ?=
 =?us-ascii?Q?3jasNXOMxtbByVUPug/4aOYuA2qTaBuIkGfjWpRKRPiSoIFmcnM/xRna4aqd?=
 =?us-ascii?Q?EeiM/ij03vSlholFeNPE4hcfcvAmihWdRG4TYNosdQJ1BhYH78tYPB6XkWqN?=
 =?us-ascii?Q?/VJLItog5lUStx3K7zJMXw1ge2BJQi3J00oLrw99KVrQXBSUKMlHh5RMh7C9?=
 =?us-ascii?Q?MeoEVXiGxjVwXBzz3GhxdzTwRW1B6NPAPxQ0MnnJM26rFvaTagSKpanq7h5q?=
 =?us-ascii?Q?xR//VMawn2F+itepvZkducRNi8IURc4La81e1rlVCVtck0SKSHtwUjAyOVSb?=
 =?us-ascii?Q?ns1cEkKcuQwq923mKYnWYYJcHts+l5/4XFzQFZB+pOExCUySlJOCd/VQZRXR?=
 =?us-ascii?Q?ymUL1xSUFnFoBXwjJTJmf/VjotQy70/K4mGqn9DospzeQftuJ8yzM9BrOlv4?=
 =?us-ascii?Q?1GNzsOWP32NiU4Vb+y82ZxeNLDE565TUninOtf3I1mWBIIyyDHXWGRkfeAIT?=
 =?us-ascii?Q?cSQfkPiFXUq1yR8yjR0QJRJH8DMpBISiw+yS02K2/TSGi6+ViWNDmOS/5UUe?=
 =?us-ascii?Q?0Op4U7dwmyuvkpX70aUa1xM9igZATUOAnp+BNR4xTbeW+9Dp1LFUi6p9Xe6m?=
 =?us-ascii?Q?X/N1in6zOFkZaivS566fx4V938KNzxNblXPEReBwrGjSvdE3zbY7mEbNhuc6?=
 =?us-ascii?Q?Z1K2IQTgMSwIY2Cfuls7Dyn5z8nOfHSQ7wCHse6G?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d93ca431-60d2-431f-049a-08dd0040ba78
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2024 22:00:16.2587 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LUpRFAjXV9xI8OBwOM+MkKy7FHziSnieGBlRISb/Usr/U8YhSE0njVjYVJGF7xqeX/ooNhm+zY/pJT+kdVEwz8WU5JUSEqlDbZvfUnQ+F68=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8849
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
Sent: Friday, November 8, 2024 9:43 AM
To: intel-xe@lists.freedesktop.org
Cc: Teres Alexis, Alan Previn <alan.previn.teres.alexis@intel.com>; Dong, Z=
hanjun <zhanjun.dong@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
Subject: [PATCH 1/7] drm/xe: Add xe_lrc_is_idle() helper
>=20
> Add helper to compare ring head and tail to determine if LRC is idle.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

LGTM.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c |  2 +-
>  drivers/gpu/drm/xe/xe_lrc.c        | 13 +++++++++++++
>  drivers/gpu/drm/xe/xe_lrc.h        |  2 ++
>  3 files changed, 16 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index 9e0f86f3778b..e7257c681278 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1705,7 +1705,7 @@ static void guc_exec_queue_stop(struct xe_guc *guc,=
 struct xe_exec_queue *q)
>  				ban =3D true;
>  			}
>  		} else if (xe_exec_queue_is_lr(q) &&
> -			   (xe_lrc_ring_head(q->lrc[0]) !=3D xe_lrc_ring_tail(q->lrc[0]))) {
> +			   !xe_lrc_ring_is_idle(q->lrc[0])) {
>  			ban =3D true;
>  		}
> =20
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 4b65da77c6e0..e219657535cf 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1763,3 +1763,16 @@ u32 xe_lrc_update_timestamp(struct xe_lrc *lrc, u3=
2 *old_ts)
> =20
>  	return lrc->ctx_timestamp;
>  }
> +
> +/**
> + * xe_lrc_is_idle() - LRC is idle
> + * @lrc: Pointer to the lrc.
> + *
> + * Compare LRC ring head and tail to determine if idle.
> + *
> + * Return: True is ring is idle, False otherwise
> + */
> +bool xe_lrc_ring_is_idle(struct xe_lrc *lrc)
> +{
> +	return xe_lrc_ring_head(lrc) =3D=3D xe_lrc_ring_tail(lrc);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index 40d8f6906d3e..9d64cedc4d14 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -78,6 +78,8 @@ u32 xe_lrc_ring_head(struct xe_lrc *lrc);
>  u32 xe_lrc_ring_space(struct xe_lrc *lrc);
>  void xe_lrc_write_ring(struct xe_lrc *lrc, const void *data, size_t size=
);
> =20
> +bool xe_lrc_ring_is_idle(struct xe_lrc *lrc);
> +
>  u32 xe_lrc_indirect_ring_ggtt_addr(struct xe_lrc *lrc);
>  u32 xe_lrc_ggtt_addr(struct xe_lrc *lrc);
>  u32 *xe_lrc_regs(struct xe_lrc *lrc);
> --=20
> 2.34.1
>=20
>=20

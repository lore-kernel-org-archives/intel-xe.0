Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC53D68BCE
	for <intel-xe@archiver.kernel.org>; Fri, 15 Nov 2024 17:28:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7094E10E8AC;
	Fri, 15 Nov 2024 17:28:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B28C2wCW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A775110E8AC
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Nov 2024 17:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731691717; x=1763227717;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wm6FPYg4x2g9HtXXo8uTziyHvW2eAdHxx2eN7jtJuDI=;
 b=B28C2wCWJnfaxLwD4TuFXXUqsZMVKkVX6ppsupMpmPejQoLgdabr7PoG
 LAxazFvNsEiIbU4og32/GBRN2eV02pjZ+j1ItYRkNX/yl4ymlf9q6AysZ
 C/2YD4E3U8mIIEQqfJea5v+1v9POeI5CTWDNPXjllsHerW+laWVqIXod6
 jRtK/vhEPnsk4NiJEYJazHDhTDxMFon0taPSfaxiWktwOE0OX2Naq7XUi
 GFOUF/zn3CiT6XbI4uLmgNG1LXyRXNZ/DlO9I9+yFwLr8pUhq/9EXgbXw
 RSF9pfLW5s+GkozUQlrAi78TQOp/hTW2TXHg09JeAflN/QYEzEebr7TQm A==;
X-CSE-ConnectionGUID: 49LUpnsfTYSHsA2teYi6zQ==
X-CSE-MsgGUID: /n0FSkzHQ/Wt/fozNK6d5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11257"; a="31778002"
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="31778002"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 09:28:33 -0800
X-CSE-ConnectionGUID: xV1XhSh2S5CMjvIw8Ncfrg==
X-CSE-MsgGUID: tN8ohMveQpKBidKgpkwzBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="89018389"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2024 09:28:33 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 15 Nov 2024 09:28:32 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 15 Nov 2024 09:28:32 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 15 Nov 2024 09:28:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VLJHVrHjGdKYl3rwbhTCCtjhfxfT3ehh9LML9GmUeovLjK1jTrEcR2ubNizY0KGkfPad4r5k398dOm2HnfCvEYjBTXYZ8d2o5W9ZzREe5oWhPONEoTE7NhH4wy1lpUmarMy/Te+XA9rXf79W9wZDlM7ZVwuvoY2ADcPT1NcwCjNs+alaxrYePpJbj60hS4Y+MqmFnSqQSDsbRvyi/GmUxSABAJjxIyTrNL7MnlrMJFHTDU9iULCFglLy8b7TB1gAlSG5UkF7iaxjvyZ/XZpXdfrs40or1qg9u6lE3Sv6ZXfHLHaSwsnUoh9+UPjm1grgp/jQNiqBtad3Kujdmh4MkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hy08cCGKlTPz0/2SwFBoZmR6CdZ4qY91zK/T5V16CYY=;
 b=BlZeREVL/khyDZx7kMy/JLIz/j9/zeL3DPQzw15Bw2U8RGW6QwmvS6m0+dEaUIz3dGW2ALvGgfc6A6MlBUD/1acwYvn/wDcMXUKZzOeFTozIGDQA8fNZAqDsGkq2T/iO43FqcaiawBU3/yho6yhd0/a4QZzQ5/l5ONySRYzCfbbK+QUUbesuyBxyMVbCs32uNHbYOM9DYka2H7S6U0FsZPfq5roxvAuRrpgFl9kTirXfWRkTzDVD8UjiXFidRkuwrfx0NmVWLRZcOTKemZdg192HeyI6HEsD7cF4uAImECNqcYIHUuV+G6t9KnRZAB9mpEd5NqX/B/XJN76tGUc8qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by BL1PR11MB5253.namprd11.prod.outlook.com (2603:10b6:208:310::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.19; Fri, 15 Nov
 2024 17:28:25 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8158.017; Fri, 15 Nov 2024
 17:28:25 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gupta, 
 saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "brian.welty@intel.com" <brian.welty@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "Brost, Matthew" <matthew.brost@intel.com>,
 "Harrison, John C" <john.c.harrison@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v2] drm/xe/xe_guc_ads: Add nonpriv registers to write list
Thread-Topic: [PATCH v2] drm/xe/xe_guc_ads: Add nonpriv registers to write list
Thread-Index: AQHbLKzB8AQjWmaLjkqtEx6VIJSZTrK3keCAgAEbFsA=
Date: Fri, 15 Nov 2024 17:28:25 +0000
Message-ID: <CH0PR11MB5444A7503D73D9D2B4C287C6E5242@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241101222350.108367-1-jonathan.cavitt@intel.com>
 <la7edkqhnhjs2vuy7eihivskiqwbqtm3tpnu4alyreqgi5lwn4@chzwysy5jiri>
In-Reply-To: <la7edkqhnhjs2vuy7eihivskiqwbqtm3tpnu4alyreqgi5lwn4@chzwysy5jiri>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|BL1PR11MB5253:EE_
x-ms-office365-filtering-correlation-id: deeeaf92-7257-46ec-a7b1-08dd059ae95c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?Veo4GEUc10vWwakkG6CBpvOB+wOmGuiJyjWtrp4E1oaR5wC1LUIh5v3Nd46c?=
 =?us-ascii?Q?FGci70gzB1ElHVvwEh+TuIylQch/yIMxwJXD6YeEmc1kWQw90teGgBdCUUhn?=
 =?us-ascii?Q?Ca2rAVqnY8Dn6ASzT9JPe5g0zH59eMLlMzsu5Xi68a4LKlbUgeIVv+2/UQLh?=
 =?us-ascii?Q?OH+0daV2IOUNmaKlCqmW2nfv2ynBdSQyN/Xgzcs1D6AnYCziY+BGEc3E8Jae?=
 =?us-ascii?Q?a2AVqu9O01BA3EsKcEagwgTIJVedJsFpt1rNo2MMWN0KqjnTEWAKSOhU9JEm?=
 =?us-ascii?Q?/220suZfNusMfvkG1Db7YIcCMyhjxUNI919HzYIvLPjeMV+nmQVVhp/92Lvh?=
 =?us-ascii?Q?XbVz04pRIqMaed41Oic1DjI1LFhZIwHkV0g+ynAZ6M6mlekBnZ7EscEMXyZc?=
 =?us-ascii?Q?3eUYUK5k5cwtGOGkhyeK39cBGy4CdDv1Cb5xSAic/a3tHOgXeaAROg/hqIve?=
 =?us-ascii?Q?74TX7RX7ss5wFNrO0FS1ol+vAdFD3tj900KTmn7hZC8HVqTqmPJZRPKPbwFG?=
 =?us-ascii?Q?JFUYUkfwftXrgTkEX1sgtxrWaou1Evfg2bK5hYHv7cEQ1VDnnRdOP6xuclSy?=
 =?us-ascii?Q?hzi3B43gm1YPUPqXeFWgbR8g7BCY6iQWBNfjHVUlwe0AOhEqoICHqpBUs85b?=
 =?us-ascii?Q?hh8VULPxMEioEycpRahoVQJpmQwOol1nqqPclwJ7TUap81iguvyW6/sTFm1L?=
 =?us-ascii?Q?xbABsRM7vW4zon+SPhFXGyO42jUf6yBWiJa1Sn6UiYXkWhFrtCXm8VTDpCH9?=
 =?us-ascii?Q?rzuUSbhR4jVgVgfmCL6oNkGGBrChfOZxB/LZ3AfL6HqU2BNK88oEx0CLqy2d?=
 =?us-ascii?Q?3+NnsbYSSHJDC/dkVWo0VKBPgduvEXSKfWt5YDDs/0rVyind45rGViCjgnCu?=
 =?us-ascii?Q?3mwFpnGsljc0k+lcJrdDcjFqwHC57EUCgJniufmo35blRCAfhCu4j2tIazyk?=
 =?us-ascii?Q?UUUtCb+y0BfSgJUFxE62NbjykAYk6YfL5s4W7+VB4PLcfKil2640/ac3fCqm?=
 =?us-ascii?Q?w4UkEncUW3ekZFrNe2oHXVo1MUw22fSIKmFHe4Avj63qJf7EAHM6Jnk6IO6W?=
 =?us-ascii?Q?REuTra4TzVEILvCGU96zQQ6u9hMxS7ZLE5b7k2H014vJ/fFB3exdJzgRMbR0?=
 =?us-ascii?Q?tkPb37UPg0lvXAHw1USlJVkTnfKqVigASVqdxv9P4g46kUyJS0mbsOquBNro?=
 =?us-ascii?Q?0Mm11Q9CfPaPycbLeu6W/QpWQL1qxoze5gNWjRYu8B1jM8D833l38gI0HIX8?=
 =?us-ascii?Q?oX3hoGRW0Qzd04IfeQ/aSqXgTO5rhRb5XW5b1S22KBBkXHBVf44/ZxHl+QSu?=
 =?us-ascii?Q?7Ji5Qz463ct8GscGJKUr2YU7?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YhxXyRncsVU5ZfbXtKOoDBIKz5yVnnl8iR03mqBJvxZtOIb+c3e8q+be52sR?=
 =?us-ascii?Q?rLyk5mOaNc+gnLJ5RtJtoteQuY+2DafkPRrYtSwnA3kb65iWVHsthKGTqG7O?=
 =?us-ascii?Q?vkqyVXh6Mnk4gQIxcWJa4PgJrfdYILSp4qIUUIPZHRLAHr1F1mpD1dlcB+bB?=
 =?us-ascii?Q?f8aeXOGBxnN22EYYs7cJ8uX42ce+N5XmdPQerq9I//f9UHnWzyf3bhjJMdoC?=
 =?us-ascii?Q?Ul553yelaKoFP6qRvO2cDEumkK+wRE3KpX/dkgbFzVsK8mhS6Lb4tgvqQyjc?=
 =?us-ascii?Q?oxfPBqMXdekvWlyHA8kykL6+msHuxeWI+wUr98Y9KnX53jFGHAmegFa4mq2b?=
 =?us-ascii?Q?tKKA9ZFTcvTvvPqW2tIua2BjBiSv3LXKZdKytWeFN/Ui9UpLH6982ZRROp4b?=
 =?us-ascii?Q?jpyLYy+ByTl90dBbTv/eCXuvm3XxGBdbvTELtoZSJS5brRgFeLTuyZkEKsLF?=
 =?us-ascii?Q?qgkzC9S6QZGXxjX1A0hpJa8Y3SSb/PALUzfbb/iDdMlCXYKT5BNxXq58l057?=
 =?us-ascii?Q?QGGjWgWmrtDCIygmVnAjwvGKVkxy0vT83WyGAuKDIMSV/X+EkKqCOJYfXqvV?=
 =?us-ascii?Q?BpLQZ6o7Mf+bx8IQ0BaGF/wo0QnvOX8w22PZgCVpRhlfp/UR2FyWwtdt1hTk?=
 =?us-ascii?Q?kxOsqsV7bm/IzNyjaPgnDsqjTsgjT7gJwGuro2Y7R7ffRZ+Wo5z6ub3FNkD/?=
 =?us-ascii?Q?pUr11BaeQMQDNQh638pzuuSUnLuMtMx+dg4sjlS4FBv72dszIa2SXpySrVR/?=
 =?us-ascii?Q?lXyIkK4lhbfxShFhRLijqjwXndBKVVm1Pm3NNNRrvqkhO75HDjtrUYe6HS43?=
 =?us-ascii?Q?a0UnD9aY149zm7hHTl3y5WAcke7u9bIDPdM68Hi/B1vy2HYW3ue84nB2QOkk?=
 =?us-ascii?Q?UkoNKknJLID2p8z6lZeGulQaAMZnPcL/ICTT++haXabDV7eG1/W4PLzlD/vZ?=
 =?us-ascii?Q?D6DHpBtNX2D47MjGRXTAlkX99zhFWH2tVKLGE+hGjUK+i2Xw0TC8m9hf/Uqn?=
 =?us-ascii?Q?8TAXsjRPvEiHiChu879vECfP1+KDcT5gLBDFrD3GN8rRuC02dgmxxJPkM9tT?=
 =?us-ascii?Q?NZjs7tZMXIyz89E8RDYnkBgRfox1Ml74XsMii/90bsNd3QHmoMxMhSy6alhH?=
 =?us-ascii?Q?NWD30qjU9ah/lr+uiOGYYBlkAl8uPixdEjiOCkVVMlAtPF9nLj7X7oId9/XD?=
 =?us-ascii?Q?+StRb0n3DfMNOFruKNt2IFoU0c6hPQEPtJj9pJaSzeDqXHQW8vIpiFfod/mj?=
 =?us-ascii?Q?RPeVft5+99fFTYWcGpN5tbLIh6BhiDDA817Y0Mb6pZFVXU+AgxaDCswtfeq7?=
 =?us-ascii?Q?hxj3EWwWMAtmokZQEX8xdoiYiq6fXlapASK9rgM7W9zOmQI3QwUJlG0XmHO1?=
 =?us-ascii?Q?+cBjGpQrk3XFRr58ZtghC/KSoaJTj/hU98mGINarhaAtH1/DoETc+VHB6xa0?=
 =?us-ascii?Q?PaPHscyBGan0GEDdQ7In5Bo1TjwUyC+ohX5LrNxMon78cxzoKUo3KNmQiFMs?=
 =?us-ascii?Q?lI/sJvFuNlrrDjJ74nc5j2K8WWedgEKK3bKCN4QljZgAJWfltHYX9VDEk7je?=
 =?us-ascii?Q?apTDAXb+nmsJbWEtYmYPL7uVKsDTB7y8Hm+s1tbT?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: deeeaf92-7257-46ec-a7b1-08dd059ae95c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2024 17:28:25.4117 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bos6W683ZTPVbd7mz7wgc78wx3uNE8T7c/4M3Zw3b8TOu2qPVKoKrAs/tjuMAE7A+k4lpP4DGTy28MfQ/1VE/Lz/GMAv6oiqRUHcO5LdntI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5253
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
From: De Marchi, Lucas <lucas.demarchi@intel.com>=20
Sent: Thursday, November 14, 2024 4:31 PM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org; Gupta, saurabhg <saurabhg.gupta@intel.c=
om>; Zuo, Alex <alex.zuo@intel.com>; Vishwanathapura, Niranjana <niranjana.=
vishwanathapura@intel.com>; brian.welty@intel.com; Roper, Matthew D <matthe=
w.d.roper@intel.com>; Brost, Matthew <matthew.brost@intel.com>; Harrison, J=
ohn C <john.c.harrison@intel.com>
Subject: Re: [PATCH v2] drm/xe/xe_guc_ads: Add nonpriv registers to write l=
ist
>=20
> On Fri, Nov 01, 2024 at 10:23:50PM +0000, Jonathan Cavitt wrote:
> >When performing a guc_mmio_regset_write, we add all the registers in the
> >reg_sr list to the save/restore list, but do not do the same for the
> >nonpriv registers.  Add them in.
> >
> >v2:
> >- Add all NONPRIV registers to avoid undefined behavior (Harrison)
> >- s/whitelist/nonpriv
> >
> >Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249
> >Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> >CC: Lucas de Marchi <lucas.demarchi@intel.com>
> >CC: Matt Roper <matthew.d.roper@intel.com>
> >CC: John Harrison <john.c.harrison@intel.com>
> >CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> >CC: Ashutosh Dixit <ashutosh.dixit@intel.com>
> >---
> > drivers/gpu/drm/xe/xe_guc_ads.c | 7 +++++++
> > 1 file changed, 7 insertions(+)
> >
> >diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc=
_ads.c
> >index 943146e5b460..b0afb89d9d90 100644
> >--- a/drivers/gpu/drm/xe/xe_guc_ads.c
> >+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> >@@ -243,6 +243,8 @@ static size_t calculate_regset_size(struct xe_gt *gt=
)
> > 		xa_for_each(&hwe->reg_sr.xa, sr_idx, sr_entry)
> > 			count++;
> >
> >+	count +=3D RING_MAX_NONPRIV_SLOTS * XE_NUM_HW_ENGINES;
> >+
> > 	count +=3D ADS_REGSET_EXTRA_MAX * XE_NUM_HW_ENGINES;
> >
> > 	if (XE_WA(gt, 1607983814))
> >@@ -727,6 +729,11 @@ static unsigned int guc_mmio_regset_write(struct xe=
_guc_ads *ads,
> > 	xa_for_each(&hwe->reg_sr.xa, idx, entry)
> > 		guc_mmio_regset_write_one(ads, regset_map, entry->reg, count++);
> >
> >+	for (i =3D 0; i < RING_MAX_NONPRIV_SLOTS; i++)
> >+		guc_mmio_regset_write_one(ads, regset_map,
> >+					  RING_FORCE_TO_NONPRIV(hwe->mmio_base, i),
> >+					  count++);
>=20
> I guess this fixes the issue. I'm still wondering why we are changing it
> in the ads though.
>=20
> Ideally we'd do:
>=20
> a) switch the order in hw_engine_init() so it does:
>=20
> 	xe_reg_sr_apply_whitelist(hwe);
> 	xe_reg_sr_apply_mmio(&hwe->reg_sr, gt);
>=20
> b) change xe_reg_sr_apply_whitelist() so instead of writting the
>     mmio slots by itself, it writes them to hwe->reg_sr
>=20
>=20
> I **think** it would also work and stop handling the nonpriv slots as
> snow flakes. They would also show up in debugfs/.../register-save-restore
> file.
>=20
> Can you give it a try?  If it doesn't work, feel free to
> add my
>=20
> 	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>=20
> and we can try to polish it later.

Thank you for the conditional RB.  Here's what I attempted WRT this request=
:

"""
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_e=
ngine.c
index c4b0dc3be39c..095df24c61b8 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -573,8 +573,8 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_h=
w_engine *hwe,
        xe_gt_assert(gt, id < ARRAY_SIZE(engine_infos) && engine_infos[id].=
name);
        xe_gt_assert(gt, gt->info.engine_mask & BIT(id));

-       xe_reg_sr_apply_mmio(&hwe->reg_sr, gt);
        xe_reg_sr_apply_whitelist(hwe);
+       xe_reg_sr_apply_mmio(&hwe->reg_sr, gt);

        hwe->hwsp =3D xe_managed_bo_create_pin_map(xe, tile, SZ_4K,
                                                 XE_BO_FLAG_VRAM_IF_DGFX(ti=
le) |
diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.=
c
index e1a0e27cda14..809a72767bde 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -234,6 +236,13 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hw=
e)

        p =3D drm_dbg_printer(&xe->drm, DRM_UT_DRIVER, NULL);
        xa_for_each(&sr->xa, reg, entry) {
+               struct xe_reg_sr_entry sr_entry =3D {
+                       .reg =3D RING_FORCE_TO_NONPRIV(mmio_base, slot),
+                       .clr_bits =3D entry->clr_bits,
+                       .set_bits =3D reg | entry->set_bits,
+                       .read_mask =3D entry->read_mask,
+               };
+
                if (slot =3D=3D RING_MAX_NONPRIV_SLOTS) {
                        xe_gt_err(gt,
                                  "hwe %s: maximum register whitelist slots=
 (%d) reached, refusing to add more\n",
@@ -242,16 +251,19 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *h=
we)
                }

                xe_reg_whitelist_print_entry(&p, 0, reg, entry);
-               xe_mmio_write32(&gt->mmio, RING_FORCE_TO_NONPRIV(mmio_base,=
 slot),
-                               reg | entry->set_bits);
+               xe_reg_sr_add(sr, &sr_entry, gt);
                slot++;
        }

        /* And clear the rest just in case of garbage */
        for (; slot < RING_MAX_NONPRIV_SLOTS; slot++) {
-               u32 addr =3D RING_NOPID(mmio_base).addr;
-
-               xe_mmio_write32(&gt->mmio, RING_FORCE_TO_NONPRIV(mmio_base,=
 slot), addr);
+               struct xe_reg_sr_entry sr_entry =3D {
+                       .reg =3D RING_FORCE_TO_NONPRIV(mmio_base, slot),
+                       .clr_bits =3D 0,
+                       .set_bits =3D RING_NOPID(mmio_base).addr,
+                       .read_mask =3D 0,
+               };
+               xe_reg_sr_add(sr, &sr_entry, gt);
        }

        xe_force_wake_put(gt_to_fw(gt), fw_ref);
"""
This didn't seem to have the intended effect, and xe_oa@mmio-triggered-repo=
rts test still failed
after an engine reset.  Also, we seemed to be running up against the "if (x=
a_empty(&sr->xa))" case
in xe_reg_sr_apply_whitelist, though I can't tell if that's normally what h=
appens, or if it's a result
of the hw_engine_init reordering.
-Jonathan Cavitt

>=20
> thanks
> Lucas De Marchi
>=20
> >+
> > 	for (e =3D extra_regs; e < extra_regs + ARRAY_SIZE(extra_regs); e++) {
> > 		if (e->skip)
> > 			continue;
> >--=20
> >2.43.0
> >
>=20

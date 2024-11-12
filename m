Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37AA8D42B85
	for <intel-xe@archiver.kernel.org>; Tue, 12 Nov 2024 14:48:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF7D610E062;
	Tue, 12 Nov 2024 14:48:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HCUN8Iex";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6491110E5FB
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Nov 2024 14:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731422913; x=1762958913;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JvlXW7y6LNKxzTvVEiNZNkUn1x3UMJzkXcMXCo8cET0=;
 b=HCUN8IexMuu2Yg3GwiAihFFJZthI4JHJ0phRBLVzattoCXKIlgcUuMdq
 exUf+yr5h+3aq+P+8Zo5sH+mmW8Qd2hXwx+0EPUutVr3fSt6xzRL58YBS
 4OYq+w7yULqw+Z2RZr0u/tH3fw2kjsuZShRnvM82rrhFy6mm73/facakN
 lb2KWMzzJ1u2AlYfDw5P/48cHdlFpee3PMpV1pv5kDiioEk6/EB2QGqfF
 v4gdcx1mg2nVSQboyirPTgpq8kZD6ww+M/Fik68ZtAQf5z2toDwricymQ
 LV9vpFYk6knMR8VrVVkGhaE6r3sbDs+GNydQsD6bz7Wv4JuNQEf0oCW5y Q==;
X-CSE-ConnectionGUID: 3KFxyov+RQ2FXX4HzaC3uw==
X-CSE-MsgGUID: zRkygSwnTBSckrIRnqWfdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31025608"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="31025608"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 06:48:33 -0800
X-CSE-ConnectionGUID: RObXg8ZDQTGqap8Mgf/H5w==
X-CSE-MsgGUID: WLL9dTi2SNG3YLixhZaO+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; d="scan'208";a="92574165"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Nov 2024 06:48:33 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 12 Nov 2024 06:48:32 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 12 Nov 2024 06:48:32 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 12 Nov 2024 06:48:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YJkN+mf4cYxmIr2fnyBBXn1NI0vwCWKe2Wy9qexspHY1rV5Leg9/6wZKpWJuaSPck2RfPGUyIceoPXvrWjzZfI2QQwVjcVW+UG2q4+1GhQ7wfupZ+kSfpgiTY4TA3uSlNvzJ9KAojKXiqa2Up0WV747g/8997yg8qfp5INrMxBc+hbcrnnaomL/4MI/bLV7MLZTY8ayTvniyRDBqjFuAw6bG8RpfqVBoFedOg8kdWD3FMb5Nw0WX4wtWDEOr+RRaMsUFWe12FfimR1rAddZxzjokeloI8I//7hpusy7ZhCfgONCV3T9A6kxMVTvAl66CN1fR8xjpYAVs7z5qHGh0Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lWPLdoXSoYHKLiiCNBnDCOzA+PLtpIJyxiSn8iXN54U=;
 b=PWn3f7pEpl0SuDWQJD0n7irmoJWbepTURb+vN2kA51pYOSZXUgm53QTknxwP3wAcf78ivfK8Rq7+lwJs73MjVpSzQ+w8bI6v8fxEa21ie4q+2H4XcVbHUcefeneSHeoNe7FVVeCq+2OydekwyFRk1FjbMe2/Fdz/zHa45J13FrMklsdzvwh58015mtjR5GnZU7Tgt3rca9beUp31RA68yPB8+o6SpWO0sYlJc7mILmZ/v7w7QNYpEi+4nmQJ8VqvRK+Jol4MRdIkmiR2w1FuocICrTk4ZtPpDCI1YQur5YLi9Oe2FR649ucDCi9NkjsRdVnjA3i6clIn1dMeyMJ3Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by CY5PR11MB6185.namprd11.prod.outlook.com (2603:10b6:930:27::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Tue, 12 Nov
 2024 14:48:28 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%7]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 14:48:28 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "david.e.box@linux.intel.com" <david.e.box@linux.intel.com>,
 "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: RE: [PATCH 2/2] drm/xe/vsec: Support BMG devices
Thread-Topic: [PATCH 2/2] drm/xe/vsec: Support BMG devices
Thread-Index: AQHbMhu1tZyipsrxDkqGxYs4DkvM4rKxxl6AgAH2cUA=
Date: Tue, 12 Nov 2024 14:48:28 +0000
Message-ID: <IA1PR11MB641851EF345E147FEE6FAE83C1592@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20241108201955.2048085-1-michael.j.ruhl@intel.com>
 <20241108201955.2048085-2-michael.j.ruhl@intel.com>
 <ZzHC338WnoYgVYTA@smile.fi.intel.com>
In-Reply-To: <ZzHC338WnoYgVYTA@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|CY5PR11MB6185:EE_
x-ms-office365-filtering-correlation-id: 1e3af06f-f11d-47f1-1fd4-08dd032911f7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?6k5TQ9v9CiShRp3EVtz9geuzhOYVBTN5N9qlkqBTsG8EJByTy1K70YiWs6/j?=
 =?us-ascii?Q?/4VkDMX/7WEg5AoIW+ukQCHBL2fmXzttBISPdfNZiIbYKxIqt97HKMdKVNNl?=
 =?us-ascii?Q?qKQD07WZsrPYf4+c/7XoA7XVDJB0TFtT7wJQR+EbU/JejOKZL5j45C/6DLO5?=
 =?us-ascii?Q?HXQkk2j83S6S/4X/GaIrg6mMK9051c4G+d/YHU9sZqOGDgqIxA58ccqQaCau?=
 =?us-ascii?Q?CsyNRURf/Box4ZkV3u+9sGGeqOcf1fMR4Lo32rV/we1hZaAxSsi7RNAlpKt6?=
 =?us-ascii?Q?lyVFVH7QSVfxpEktTnObm+NqpEj+eAJi+w8kV9jNvDJgmY1UvUqq40B4F/kC?=
 =?us-ascii?Q?0+9tKzUtZgsuTMS+n5DEhMaZLw+63HifUnSVOuRBTdmsxS+FRLFe+desY0vi?=
 =?us-ascii?Q?H4hyz2RtIu679toQRei6eZUPlKFMofXvUbsrNzKueuiUSnudGZzYPnY4r7rn?=
 =?us-ascii?Q?ZLmcYTIbhINUnzZ9eSu2v62aPNUs5Xei3vKVq/c1M0zXVHpKDvIWJaAUVVLH?=
 =?us-ascii?Q?AqKGo23NCtHELwG/cQbmp94nr9exew74y/IZTyUG0azrhUkXORShIV/ojOm9?=
 =?us-ascii?Q?zy2BDwcjiOBX8/56LRCtqF8Qc9dSZVPmiuV16xWOEUOrF9Px4pilsU54a3ID?=
 =?us-ascii?Q?iJnqMbE55HF9cQXXkFdv5kIX49iYLYFfQJHM9tAkK44VUiXZyCr4zE3z3voF?=
 =?us-ascii?Q?UFXDwQxJKEj4vneSTUAQ1SIEEBuo0ggb2Zst2eoHqQIG/Xq6jFVSgrl9VIMH?=
 =?us-ascii?Q?f4Z8wyDICPYjO9LWmomsSEuioncKJ+nRKZycj2+6G+5rE7u1BZydCAYfUJ/b?=
 =?us-ascii?Q?riACnnLIo5TI4yoImJD/qngR1TABVvg1L8LoOvpU0ZrXObeqZ783vdmBeqVL?=
 =?us-ascii?Q?cIlfaBJSlLoc5AqFHVGWyWNbFQoJTUCjz8UZuIVF/MDvQVpbTDO0gYcL/s1V?=
 =?us-ascii?Q?ySiH1c0xgxV/xJTcv8n4ltur+yQyQSJ30sxRYifvaiUrVFbRMzFRv/sl2gwt?=
 =?us-ascii?Q?6/TfOp95CNzDyOMwUkFGDz41tik19OoGO8pQdQmMPZiuvhfhE2tkky0bcCXU?=
 =?us-ascii?Q?rRRZqsLDixC10JJEYXSx8IRk8U8B5JCqkANPQRpjVUDBx1XYQO+W60pW2TRg?=
 =?us-ascii?Q?L6vxNQ9OJUciJmmLaVi+Y3t0hZMZuIpJjoMUkZcAT/UDnfGW09JaIE4oSaUQ?=
 =?us-ascii?Q?W0LnT+/CA+Y6ATHcjVrXhpQfoNmf+V6lwdYrU0GOsoLH4AX2A2SHPtVkFgkG?=
 =?us-ascii?Q?wYeJi+wO7ABXyIp5XeMxMOSN3nPChdc5GWfcyGMLdgzX6IPnoKZXoV9ZzfT9?=
 =?us-ascii?Q?mYLjjDpWyIhuY1gXywXVdG2NQLqd+esMJrecDSm2wxph6lXYgvOdDcmm3nGX?=
 =?us-ascii?Q?l6/HRc0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6418.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yRTixACB6VwUkJFu9oOkqEiLCKPhC/XfTK8f64V3sFLiQx40BFYE5BbpM7QM?=
 =?us-ascii?Q?1c7nLQQ0UeYybsMTbIeFiOxeCQKs2QKfUnMd0tpEtVx+qxu44RzvkBx1un90?=
 =?us-ascii?Q?SRbaqbgqVpAtLdqM/gV6PK6tyjePDeqe5l+yl6zHcxLdwpMy3ZeBS+y2An2L?=
 =?us-ascii?Q?zglj5/m22onov2i2xwlPq3AzT4Pbso09x71+9AdXT2Pln467NgKce+65se35?=
 =?us-ascii?Q?46NpD7w5H8bU7ocRuq0BmsaOuKVcATkWVPA9PlSjhZmgUg5R/40p6TOBIzOx?=
 =?us-ascii?Q?36plq/+eU1XJsTLSHxtLqVxGqgoAVzj5qhyEHXGuKQBtuusPJq2ET9ZQ3AWV?=
 =?us-ascii?Q?YPr2DIdwDjExbYynci3sSIjXZjYICDTGmCgZfRpcvrEj0kC75DmRKBLwtlg7?=
 =?us-ascii?Q?yv16sqzqgZfE06lWSu8m5oJjESkaAcD3TPE2h5VxT9b7PNI/RR7OLKOZAVog?=
 =?us-ascii?Q?HG9EVe/TSUktUfpm5i9/ste2P8ap+dMP5Jurdpud9yMeialjrYyafBY462uF?=
 =?us-ascii?Q?rTSO3+bP5kRuVZNhOcQ7njTSqHUbho6kFO/iuzqtbor6pGv7L4k341IhKQVh?=
 =?us-ascii?Q?RWcu9IEb7kKL9KSS0oxi1e35GmAFp7FZ9P8DFn6yvgdx30rSRfV1kHfv/oGo?=
 =?us-ascii?Q?GHEYBuVATi2CX3Qu/VIlOqc3ICoJ7aTY7/XdIOUaz9wLz+vdsYBXr2VZJ8ij?=
 =?us-ascii?Q?L7oCffYdd5eWptiOXrNZ3y/cJCNBzrDF2Yd4M0BkLaiNPEa0qSeSNzYmKey7?=
 =?us-ascii?Q?suI4QyYNDwvHdssBrNNvtrS9vKZfY88dPGSdOpMibp3vzXeRsaA6Tji5FsnK?=
 =?us-ascii?Q?DdKzUh0/I8UGnandSEgvp8+aYHIyPZiLupa5qURoBaEi7YdxhkKmJvSuK+2Q?=
 =?us-ascii?Q?nAwAndtAaYfW/Kkm0Dmj/mnq4yfEDJ/cqKvhi7I6CHIhMZHL/CQ91DMuQhJF?=
 =?us-ascii?Q?IMSwUx/dBlarKjnuJkQ8pPcw9neYJ7YXgvGWxBYm0qYIanIYUy/YRlvPU2de?=
 =?us-ascii?Q?lPgNd3Wkdwum/sq+nLZaty3F6JmWN0XxG/9dktqBD5lKDk51c9vYwdme8Ygr?=
 =?us-ascii?Q?dIgxiUUie1GKlMhga0SjAsUQnbJiQFRNPaphuqMJspT77+1CJ83XGDcjWPu3?=
 =?us-ascii?Q?/6GdLHMGC7Z4owqXaCVOvccyPfBMd0KBoDHZqe6TvG8zq4g96xQ/IXkrsGB1?=
 =?us-ascii?Q?hfV5i2MowCdZDi7D+TAMBx72z2nOri1epXCd6cfhWPvNaXx/nQsW/FbHDh2d?=
 =?us-ascii?Q?gUUS01FRb+JRRLTneqQS0PYyRz9OObqMyYNsgo0d3jFgxZwa3jRqO6dZy+NN?=
 =?us-ascii?Q?UC83iEs/xIDuuDqtmJta2VuCAaDzoCVxX2TtHSWllrZ60CuqNLPaJJIhUoZh?=
 =?us-ascii?Q?erBWZJaISx8oHvqjSi1/gxUuPXd6OYqc5Ct/NKQbJJ5sovG8m3TtMYqggH6z?=
 =?us-ascii?Q?hAqgN1Jf3FEqzEIz8pqGr0pWIH47bj4fOdfqoB7AmhJ1DF05utCfjgDC9YDc?=
 =?us-ascii?Q?uVAQz0ZtNWaulp3ZSfD1KprgLoNQbFw6VNBCabFJca05uaDRbWACWnWRtlF0?=
 =?us-ascii?Q?4HzJyMnZSKef2pNCI/zPRKyiryTGYF4VSp3CpGh7?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e3af06f-f11d-47f1-1fd4-08dd032911f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2024 14:48:28.5797 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SC/cAO8FRWO6liuNZWYIqASzlW9LTDDQ9oY9F9ry6hkBZ6AVL12hVsHlA09Nru3IRCS0yoMrjx31txok2U2+wFZSz9UUlPhFO+7Stvo3rfk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6185
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
> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Sent: Monday, November 11, 2024 3:40 AM
> To: Ruhl, Michael J <michael.j.ruhl@intel.com>
> Cc: intel-xe@lists.freedesktop.org; platform-driver-x86@vger.kernel.org;
> david.e.box@linux.intel.com; ilpo.jarvinen@linux.intel.com;
> hdegoede@redhat.com; Vivi, Rodrigo <rodrigo.vivi@intel.com>; De Marchi,
> Lucas <lucas.demarchi@intel.com>
> Subject: Re: [PATCH 2/2] drm/xe/vsec: Support BMG devices
>=20
> On Fri, Nov 08, 2024 at 03:19:54PM -0500, Michael J. Ruhl wrote:
> > The Battlemage (BMG) discrete graphics card supports the Platform,
> > Monitoring Technology (PMT) feature directly on the primary PCI
> > device.
> >
> > Utilize the PMT callback API to add support for the BMG devices.
>=20
> ...
>=20
> > +	drmm_mutex_init(&xe->drm, &xe->pmt.lock);
> > +
>=20
> No error checks? What's the point of the (second) 'm' then?

Umm... not sure.  I will take a look.

=20
> ...
>=20
> > +/*
> > + * Copyright (c) 2024 Intel Corporation  */
>=20
> Can be one line.
>=20
> > +#include <linux/bitfield.h>
> > +#include <linux/bits.h>
> > +#include <linux/cleanup.h>
>=20
> + errno.h
>=20
> > +#include <linux/intel_vsec.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/pci.h>
>=20
> + types.h
>=20
> > +#include "xe_device.h"
> > +#include "xe_device_types.h"
> > +#include "xe_drv.h"
> > +#include "xe_mmio.h"
> > +#include "xe_platform_types.h"
> > +#include "xe_pm.h"
> > +#include "xe_vsec.h"
>=20
> + blank line?
>=20
> > +#include "regs/xe_pmt.h"
>=20
> ...
>=20
>=20
> I would add a comment here explaining that it's not a PCI ID, while looki=
ng as
> that.

Very good point I will add a comment.

> > +#define BMG_DEVICE_ID 0xE2F8
>=20
> ...
>=20
> > +static int guid_decode(u32 guid, int *index, u32 *offset)
>=20
> xe_guid_decode() to avoid any possible churn in the future due to namespa=
ce
> collision.

Will do.
=20
> ...
>=20
> > +++ b/drivers/gpu/drm/xe/xe_vsec.h
>=20
>=20
> > +/*
> > + * Copyright (c) 2024 Intel Corporation  */
>=20
> One line?

Will do.

Thank you for your comments!.  Will get them addressed.

M

> --
> With Best Regards,
> Andy Shevchenko
>=20


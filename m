Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F5DD2A53E
	for <intel-xe@archiver.kernel.org>; Wed, 16 Oct 2024 18:50:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D696510E18D;
	Wed, 16 Oct 2024 18:50:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cFIrgHcX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD06C10E18D
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Oct 2024 18:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729104611; x=1760640611;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=J1qsHiCNFQ/Or5H6in73gN4tl2UxfvXHY03cAwtBTGs=;
 b=cFIrgHcXmUQT6dkj4lFMWjJM7l5KGR8GIVrp3z2WyCctO2+hRr1TTQWF
 aS5evRx0tia9FCQr1Z0H/8yhoTi/0ae+THa+eWpl1MNLr6w48OSpOEeVp
 9husU/u2QnNEesyA9VntIBoCZRS9ndcCHnLNuFusBVmjtUc9DHj//ps3F
 JoCD3y9PV4tvc7cDpQ2U95YREYTkvngqFzV97hOv9U9o0cFZCFcDFxIz8
 tDJfWEmPdqeVqx4LBWl6RSI9uPfuKVmmdZDl35gept5D7o8eI2Fh1TFJm
 aYDbRKmLJ6Kb7gyNb9AEN/4SBnoyClwwsbYBfkECuhWW2G2dr4FPDyjtg g==;
X-CSE-ConnectionGUID: 2iE5a+aTQo66h5Z8w1SF4w==
X-CSE-MsgGUID: 4XH9Oks3S6yyNCt4muUuEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="28660292"
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; d="scan'208";a="28660292"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 11:50:11 -0700
X-CSE-ConnectionGUID: BaTJ9WXjRHqEeMmlw1CuFQ==
X-CSE-MsgGUID: FuEIrLacTfCcNyH/urTrow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; d="scan'208";a="77970561"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Oct 2024 11:50:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 16 Oct 2024 11:50:09 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 16 Oct 2024 11:50:09 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 16 Oct 2024 11:50:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HwDQ4evJa3USPV/I34dTkvocIxliZtUfFO6kBNSPI8nwBiTvSIvTuao0wUD5ttzI08uPIqEyfXyAWslANwRk8+VmPm4aP32KhG8hbd0xPXS1vcYaCEpfhBsvJX/q3Tit2z2K7HxK37JymInuCmYgEjmgYmQMH9F47mUPNgkLBemAy8bbETWG01xRRI+IzzNhfZt2bEPbrsZf1TZoRcF2E5ykTc1jtmdsWV5kTKEYsEg/atL2dAVySUWAgZcXj5JuJXa3CBvuzigw5trvh7nbvMZmHItQdnHTvLPi2ZGgILAwpWmhvKMGlKA3vrT3HkEg3w5+h9c5WH2PRrhxkVT5NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0NpbyQ+CrNj94LTM2XoDBv+wSX2nYyObg10P2v6cWug=;
 b=GzKOsA6zV6PNi1I/AjMxxZWgao6kF6FcRv30ZH1pphhvA6nTCGNyNAHRbq/TdQeya9yvm5DcRvDEmBksvT6vukVQqx+V9sJXq5UhmwxEvi97mUkL5SR9OWzXz6oA35Xy9umGE5/61nWg5XA4kVgZeQMPho8Vc4HRLM4kRoZZqoed8rcrbHThU9p0hbrMwx7DkPCRpQABNm4kmDoM811SYDwenblqSaAX/rwsN1/MZp3Acj6Czq9y8GxRLhltm5NFI0T9lJx53SocRtKIz+S7pYGWKmIr/Jy9TwS7T+TQqdsbB02+airzKtW9guvkOcRPfxJXxV/XdFRbB0IyzigODg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB6362.namprd11.prod.outlook.com (2603:10b6:208:3b5::8)
 by CO1PR11MB5010.namprd11.prod.outlook.com (2603:10b6:303:93::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.17; Wed, 16 Oct
 2024 18:50:06 +0000
Received: from BL3PR11MB6362.namprd11.prod.outlook.com
 ([fe80::497a:383a:6d76:ec5f]) by BL3PR11MB6362.namprd11.prod.outlook.com
 ([fe80::497a:383a:6d76:ec5f%5]) with mapi id 15.20.8069.016; Wed, 16 Oct 2024
 18:50:06 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Roper, 
 Matthew D" <matthew.d.roper@intel.com>, "Harrison, John C"
 <john.c.harrison@intel.com>
Subject: RE: [PATCH 1/1] drm/xe: enable lite restore
Thread-Topic: [PATCH 1/1] drm/xe: enable lite restore
Thread-Index: AQHbGznUQjG+NeTou02de2wmP4uK47KBkbOAgAgvnBA=
Date: Wed, 16 Oct 2024 18:50:06 +0000
Message-ID: <BL3PR11MB6362CD550607AB944A5C9F559A462@BL3PR11MB6362.namprd11.prod.outlook.com>
References: <20241010173142.425498-1-fei.yang@intel.com>
 <20241010173142.425498-2-fei.yang@intel.com>
 <rp3yb6cgtawboewuaygtea7uz3ybdzpycmsodpfdlffsbsz25o@wtuxv5gj7v5h>
In-Reply-To: <rp3yb6cgtawboewuaygtea7uz3ybdzpycmsodpfdlffsbsz25o@wtuxv5gj7v5h>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB6362:EE_|CO1PR11MB5010:EE_
x-ms-office365-filtering-correlation-id: 2290828a-23d9-4c53-e46b-08dcee135a60
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?2V/BCZKhcz9byq/UhWTidIOx7aorYghpEDKTzT/23nf5k1XrAArB9Vp60Nlz?=
 =?us-ascii?Q?oHoX7KbQKxBpkpxY3YYqjEatTNBr+Pcw6r2YLf17PKL8Ybb8vz1VAKyzwUCX?=
 =?us-ascii?Q?WSqfDI5VkQzunsIdHVmUkj1KJMBx0jDc1ypl8x6+jQ7TVVPmO3/BCiNWBcy9?=
 =?us-ascii?Q?FJtLzg35Ei3YHFUkt8NwXm71Uj6wmF7LrEE5e/BWzvf/dK9bmCGYcF6ck5Ru?=
 =?us-ascii?Q?4hBJ/GAjcLrK0wxh0gFJHltwa2yuWCGYW56KcLd63qgbGFvcflFTlH5j+y+n?=
 =?us-ascii?Q?uF1j9lWFD2xDLXin5yf/XFq2GxClu+IVS8NwazkTN/kr4L0l6lwuHiepuRGE?=
 =?us-ascii?Q?l0H5nzICPwk8OxZg+WgcJboNMKoZxdIPf5SdLVYFrI9sxw7mTbVzJ+JL6pU5?=
 =?us-ascii?Q?2tUov5ns3wppGssTPT+tXisowwFTfPLoGfdSA8MXC3Ekh+/cCykvH5NsnFNI?=
 =?us-ascii?Q?mj6Dq9YQiVToHwuf/BgG/MJA3jo/JC7lunnBMboKrjHJ5F8HaEjzurYp+Kih?=
 =?us-ascii?Q?bbGT9OkYUGZ42BoF9ALQT3bMF+m6l2zAyHi5+/lkKhBOJsvCnlt1HY5X2Iq9?=
 =?us-ascii?Q?jzwhmt4jMPJn4cVcgpauL6uWP+5A1ns87H80dVSuD9eDXKPFs4kZdT9EJ5dI?=
 =?us-ascii?Q?s0zoswO2VsHYYhdClrV3wARC2lmJRAGCOH93UsNNAtDVYSAjFQTl/8/LqIeZ?=
 =?us-ascii?Q?IodWs8i4FxiVoNz5PPgbc+A2SX3S51/kh87kbzBKpXv5Ut/wkfFtwVHsZpat?=
 =?us-ascii?Q?Ql8d7p+HZTTNXY85Hw9T557NGCnhI9Tt7lopQbAXfGHFaDn+pN7XoIDLBb45?=
 =?us-ascii?Q?7IgNS6sDEqamGLIl3AQ35hGbf1+QNU+2DARrUhnEEbmu2IGrFztTvtth/75/?=
 =?us-ascii?Q?SPfmHf7LePntqQSWNxizyDxHpXKLeC0WbvegwoKe1fSH7GOA216lXqLik9oV?=
 =?us-ascii?Q?rBjyiuiFmZgYYGKDf1/9PTvyGvYQUMWmOhT1xXG/sO+v4C3ObNrZaoT+EAao?=
 =?us-ascii?Q?7E5SsKX6IYX2xDAyauW4ZzZQgHMfkg2bvp5S7QFN6EVckinmuwG+OU83QYcN?=
 =?us-ascii?Q?wQw8BbhqvGRBFK9E2hm572QvYms1qYnBQQZ8XVpwsT/i3mljBzYQPLzmLCEX?=
 =?us-ascii?Q?XROZQjIVIGwE5v+w+NhD2osx/zMZK8wALiHTxWmQCd1tDCgvhE7/outm/kVk?=
 =?us-ascii?Q?QumwdMVg7vOQvAUj+fC9gvwhFSFTLCJTc1nf68+7WCXrME//sOuVOlmXRO91?=
 =?us-ascii?Q?l+DExnL9La3t8FmPJiVj+sfphH3ZKVQ6c/2klA5A2rGjaqZ9wGkXVaL6BtWC?=
 =?us-ascii?Q?xmlyY1KpmzV98DpqBzY0up5tZn7WvaJGYAACacJidin1Fg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6362.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SIJjs5Iyxj1YpjXv+dC2HvDMhGVAHySOGCJas9DFWHp5N/shfZ9SONXUnGgf?=
 =?us-ascii?Q?5PfaJxGvoUY/QGemyU3FjR/TNPwCs1hxginp5TMhvC87z+icRBrHPJ9LEqKs?=
 =?us-ascii?Q?HyjvXDMHNmtBGVXgpN5JDBpN9Tdcdrjol/pR77Ymgv0B24afgD8e1q20lJjp?=
 =?us-ascii?Q?mX30IC7IGuUjAtUh23h5UZTsAc+vNkcaf2wwHMd77Vi283Jaqn/fMhAy7hbn?=
 =?us-ascii?Q?G41/+o0E7v5gXfePAXV76PoD74xzsX0tDjpsfAofpb14K4jQfZdsSAAbFZ6K?=
 =?us-ascii?Q?E6/S2i2Ad9bv0AB+b4PV89/q5Ide5wwO6gjXKEQyX7Jml3dH16DX+wRN6vfD?=
 =?us-ascii?Q?CYC8sAzBp3TNs+wb7+2I/JL+fuC5k7YancG4mUSM+NZ1cYkGcIYGvMSHWkpm?=
 =?us-ascii?Q?ZBL7e3osS+Vbke7MVL1w/RSc1QKCmxeamBWIhr+hN54Lk0ty81YIAwnaOMoo?=
 =?us-ascii?Q?2MCl0bB2hLHWBYk4U2XuqJx4cKFuegIQ7T7sZarq5G3X/ydlcVcgbINdJFbY?=
 =?us-ascii?Q?zPpubJzd78wG80Kkye65C72QSvUv3XPcnVfv0FP7zXhx62N3WQPLPAYAKpcu?=
 =?us-ascii?Q?2AV4C9wnTjWBGYe1z2Nt2lDGzDZ+DJwbX/KXDAFbr+mSbIKSHRT0SKYfbHcY?=
 =?us-ascii?Q?VQ4uA9xmRwLwJFuENvZPG8Oe/5K3oMW/kHlLTkJKC11PdZQ7LGJV58kArJtV?=
 =?us-ascii?Q?SyFdfL5BITahN1yA9OvT+JUUbyX+giDa3ZalfhyMnw2a9KxnhGIeRTYRSXaG?=
 =?us-ascii?Q?hEnMSoWcjghtzfonbzxpTzjqEdLS1CLVgYSQQ+UeIkDdkz3hxb0rzaLqtouU?=
 =?us-ascii?Q?50YJKmZgzjmGavK/wyBiAJTHVgHkwUjmNs7hNP5/XOhk4ezw7c1iGDsZ0l7r?=
 =?us-ascii?Q?R04AzDh9ASJ/PmdbdTP8F7OUQDCors3s08iv5nVVF6CsGfcsqBjEo4lyJLnC?=
 =?us-ascii?Q?4d6teizv9qumidCCJ/g7JeboZBhtb5LvH2vEiK1q41y+E+W7pQxF8tbdp6yi?=
 =?us-ascii?Q?w39lEUpxV6uQelO7jgY9br3oXXiNM+AsRVXb74CJMLxUXptoqPsMme0fM3s2?=
 =?us-ascii?Q?mZQgIGAsqxOmSjGjw8POcQPwKec6BQN9bsGvpr8VnSnFeIuRMaHo5srPENAk?=
 =?us-ascii?Q?6cObqG+CV7uhZf86rsEpeqsj2syicfb7n2RczNkhqmqoFwzHnhRDJoosaTmh?=
 =?us-ascii?Q?eBgEYMPTh1Xtm0BDBEYNHjPERM1xBKm4oielSdrEnyVdHz9byfbJjuDcEiLJ?=
 =?us-ascii?Q?mIBbPH0oYDEvrcjNXigjBayyXtenmf61UULmUr9vi/LCxMXkDzGJI4sXM5rD?=
 =?us-ascii?Q?sb/N1B+8sPS1L4hOWUPIIZKV32TRAKt+GlpSVNS5P4Sw/3fhI5WVnYPzKRsA?=
 =?us-ascii?Q?GBcdgVoWwdW/WDto5Uw7Z+ithsLhSOVugN6Zq6VxY3g3ZRNJ6bPE15ZChN9c?=
 =?us-ascii?Q?YW2LawHzTxEljbwsrx3929Ji3MPJck8RMcBc5xlF9Ef5Y3EmNFa1G5bv94fD?=
 =?us-ascii?Q?Ku+sAkyZsMTepOxDfPQL6+Yw1P6p9cXtoI0ss/up8ZWJPtGp6aResnclIXdc?=
 =?us-ascii?Q?2oRvSo7TbGdhKQ/ugBVeZrGxYDyO+qHJGvorAi7z?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6362.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2290828a-23d9-4c53-e46b-08dcee135a60
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2024 18:50:06.7555 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QAfm6pRZA5peIaS9/t+upfbJZM3/dxhyFQlo6SVsXwrsTkmrlYyvMh5zNgaI+GWDvMJ/2/DLJkZz9CqRr2X7ZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5010
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

> On Thu, Oct 10, 2024 at 10:31:42AM -0700, fei.yang@intel.com wrote:
>> From: Fei Yang <fei.yang@intel.com>
>>
>> The lite restore feature is supposed to be enabled by default.
>
> I think you could be a bit more verbose here and write a couple lines abo=
ut what this is... "supposed to be enabled by default", why? For what benef=
it?  Something saying this should give a faster context switch when the nex=
t context is the same would be good. At the very least a
> "Bspec: XXX" in which one can find more info.

Sorry for the late response, I will update the patch in a few minutes.

-Fei

> thanks
> Lucas De Marchi

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F22DAC531DC
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 08:07:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B979610E009;
	Fri, 16 Aug 2024 08:07:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I0Zwnk22";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B1A10E009
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Aug 2024 08:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723795666; x=1755331666;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=9wUW6OOboTLKznxXTPCCYp/8IgQn5R2SSHpkCQf8oec=;
 b=I0Zwnk22oWvwxmWoF5jHVCYLJ4roSYlFrsrfKtv84ZO5we0wiquNnJ0D
 IczS/LXZm2mVzB70FCp2Blki5oLwpBQL94TPmR7VGGRtQdowtYNVn8SQ+
 iIdGc2ujcFS5YaReUtd8oa71/y3LQ4s/XsdGJ2ZPh3drpbW0Fp1Q5OyHK
 lWOkM+dhtI4YvtQZcLjHQpuydDFu/fYsYxYO0aWzPRYwvJ8Ug4jk/sQWn
 /xsAAJ+0mH46L6iyyCGTcfuKo1wmf2nkChs72ItcQGgN/b3EOvA2uvgLv
 W91qYvc7TKG0Lyl90NWOI9C40rP8VjFcoTvfNvBMyoxx/UefFVPMLekPP w==;
X-CSE-ConnectionGUID: bOjMBPf6Tp+JYX4sBJA5ag==
X-CSE-MsgGUID: 3ODWSdyUT/mep0yXswSJfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="44603142"
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; d="scan'208";a="44603142"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 01:07:45 -0700
X-CSE-ConnectionGUID: 61eRKnajT0qvqs+vxdgeQQ==
X-CSE-MsgGUID: iLnJNb+BQdO2FFtI1HdrJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; d="scan'208";a="90324634"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Aug 2024 01:07:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 16 Aug 2024 01:07:38 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 16 Aug 2024 01:07:38 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 16 Aug 2024 01:07:38 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 16 Aug 2024 01:07:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tVi6fsQwUlmjsN/PGjCEXR9dhwF69ezzxVMKMlhpJXJepOumSgbpKxIVdK6eQAKk9Mgltt9pY0n3TXTeGww02tO1EqTSVSiUpa5EZkYCkqe1X4Vqb+ID/rzXDlrvln/1ZUTOe9z4+Ao2Z4qXZXHpUN7OrF++1EO5tse45xHRST7TUn3k8k1Wp5Mms7yzU4Ew9Uwa5HFlYjhIAen3lvLvD5dgZAq8wXGPMZ+nf1EVJl/lAMPavPq7gEZ0iXSLCZ6R87ZuX3IKmtpAQScHEAeuEcZvuf39NpwLyVRE0BVIZBSngMSZDi77V1mzMDAGo3K+b7YnLB2ky37B5nqGz9S92A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z4w3VK+HyRhhyPlyiv5yGqUIN9BnYlNRmPzqf1/NclA=;
 b=w5mbj8+c6+oSHzVirgSVwJMsCG2fYBsLDdWpPT/647qCo0/XXOVa0iWtIqOue+vGZOcBFlB9MJYzjdackIcMIjaCvW383ki5J0vkwl0pesoUcurGmEB0Nsru+w8/SWYuzxogC7Qq4gNdTIssmU05iErrNyM4BcWskeMd+xYIZS0SPooSlFARlXQuPsd5091CrLw+DYSZtdLMGzRoGnGxgrx/LkyKrmuC5XyuI5vN9atKO6YxZdb8qpNFHYWBz3n6bUmlvjLhYEMslAgQ71W8PVdqsmQTkzWhhW4ZzZ67qVtTekx7CE7iJyYp41VtVzedP6c7Nb/X/ZlDB3ZXuOmXeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB6868.namprd11.prod.outlook.com (2603:10b6:930:5c::13)
 by IA1PR11MB6243.namprd11.prod.outlook.com (2603:10b6:208:3e7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Fri, 16 Aug
 2024 08:07:35 +0000
Received: from CY8PR11MB6868.namprd11.prod.outlook.com
 ([fe80::1eb4:7d0d:53f:6923]) by CY8PR11MB6868.namprd11.prod.outlook.com
 ([fe80::1eb4:7d0d:53f:6923%6]) with mapi id 15.20.7875.018; Fri, 16 Aug 2024
 08:07:35 +0000
From: "Singh, Apoorva" <apoorva.singh@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe: Remove NULL check of lrc->bo in
 xe_lrc_snapshot_capture()
Thread-Topic: [PATCH] drm/xe: Remove NULL check of lrc->bo in
 xe_lrc_snapshot_capture()
Thread-Index: AQHa77ME52kt+MefiEejHlUAlMwf1LIph0VA
Date: Fri, 16 Aug 2024 08:07:35 +0000
Message-ID: <CY8PR11MB68689ABF6D441F31C0C22F43EE812@CY8PR11MB6868.namprd11.prod.outlook.com>
References: <20240816080355.897256-1-apoorva.singh@intel.com>
In-Reply-To: <20240816080355.897256-1-apoorva.singh@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB6868:EE_|IA1PR11MB6243:EE_
x-ms-office365-filtering-correlation-id: 18bd207f-d13d-4cb7-6a3d-08dcbdca7d0d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?IZtACiDHH7ej0WminRpBkifepJjhEBIsm6V8WwEJHxeuBaWDFCnZos013fcW?=
 =?us-ascii?Q?4ECQW8T9mAz5H8sawotkQtStMJeKQ8YCpJOtZVj4BpuQlGo+/vCvG25wCDZk?=
 =?us-ascii?Q?ILTEOOLdJFiJF8xr7Zfzi2UUa/CVqRrrd7TjxUvzNi70sBCKEgJ+NjDFMsLq?=
 =?us-ascii?Q?0aqMCP9C24KDITa8x0EVKx2rTwhHxst4zckF23zR6MVvkOX25PASz+H4f2go?=
 =?us-ascii?Q?soqUZsFKoYSkrnJAwK2jFopS+ErRZtj+HS9ti6DQzDqQG2NZbr7BaNnzrtIr?=
 =?us-ascii?Q?HPDHRwtGMT7azCgCQlKPV7qAXpr0x9RX6LvBS/QPEqwET5qlRR97tgpDJrFq?=
 =?us-ascii?Q?8Cu3x90uPYh8jnGuja5bjr0XvfUe57jggSHB+heHaP1uVXtUJSUmbf+woPp4?=
 =?us-ascii?Q?su2ilx0GsmdZV/BoNDo/L2T/bcp0ipDLflydA4MpxlA3J1EZFWNEfR06sMNt?=
 =?us-ascii?Q?7GWAIfBmdbAZoqEf/v/AoHT232oBJCnBSVcbfeZ5516NjeWOWnAuX8xhyEzz?=
 =?us-ascii?Q?beghtyLGwjPqyQozIN0tg5+lBh6wfL7freIVCFmh3CVmKRf97Q6RqnphlmjY?=
 =?us-ascii?Q?8QwKnxusUt0Bxl/+WYVBWtbb7/ThEOwBVeKHd8xhN5AroEI1cmecI26YDfKG?=
 =?us-ascii?Q?jASnEsh36/HInwF4PMBr37c4d7Qgg9wh2vpGglR0pE4vsMY8W6Kw7n+y9UqN?=
 =?us-ascii?Q?14YMku0QG+jNgUl43fVR/+W3pkqMNcmxJc4ryzFAWT8SGjC6XNoqbtsPEaQq?=
 =?us-ascii?Q?4G9Hhvw7lvkKsrfIBR1gAdQzlcWXBPp8WseJoEMA18snyzz4ICCM+aBtIL6F?=
 =?us-ascii?Q?QgjFAK0aLkDQfINUyd2twtt/w+Nf5MJ8a5HZH9/Jyt6sSx+15dQMEJv1j/hO?=
 =?us-ascii?Q?r/hifNsrTcOueG6SRf5rcM4e8EKRjVj+d2sYdX/Z3k6aTdii2abfYCTbE21P?=
 =?us-ascii?Q?N/PwdshFdIuRf5XqoYTZg+Neeonbm+TCjXV3sr/FbU0RSfSm60WWrupFUyDg?=
 =?us-ascii?Q?V3iTYmFSih4exIPxEwwSJt+EX3v4ZDHMRKKPrMZakCFkie5Ib76Ow8Ok2k2m?=
 =?us-ascii?Q?Pu74J6J+MgIpkcvsfHIYNMp2nLC8kj8u3bFPUQjIup1sBIAceeeB5BKBQQKv?=
 =?us-ascii?Q?jpTxMnhfWkHeTI/H9PwP2cJGWmU0Z7jjp2oo6ujs7trlMBGmyvRe0jMtugLT?=
 =?us-ascii?Q?ac6KSlFs/WaPspG8OfMfxleNLGjBx6UKPJzxor+fAklhy1BEQpcbDEfEhmGw?=
 =?us-ascii?Q?mWJVwCfZGZj9vA8cpg1L5yK18ewMx7jul0wMxjGCpvWBSN0xInaKZSDf9Y79?=
 =?us-ascii?Q?AVofsMQZd0AvWStvCcMHQ1sWYhC5hm6QvmHvLqTTfnvdaTUFS6huSoPEyCCY?=
 =?us-ascii?Q?QOjA2vk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6868.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+VAXS4C+ozF6uMop9lIz8nFS4uM3P8ECuJaGj7kX5p1+wqSa6H7KWYz/+xO+?=
 =?us-ascii?Q?8f2mRZddfHs1rM+5nnyIYcsjgMrPVhc/eP90GLaaDKq63eAtsm4LJy0NE7Ky?=
 =?us-ascii?Q?ySfF5+QK5CBvMY+7j4hm+mHGpEF8vqkdNZzQvv2uPqFLo55c9oKzoqRq4IN3?=
 =?us-ascii?Q?Ce+ggw3Qx1RAWXCH6qDBiTJ3FXWmVbW9ruuLN7zZ3tZsiPGAfzC/z/tJk/l0?=
 =?us-ascii?Q?KK1YjZf4dNHnG5HnnonsvCPubdIgP8jZ85MLMGDVAtyf3qpBJ7wN+R9+9bAD?=
 =?us-ascii?Q?urtJCpoqlpUQs51U9jqweKHJW3RUI0v83QzoV/2irvQl4HGmuQ4QAzt6z6KZ?=
 =?us-ascii?Q?OnEvE0QJa/8ip9vD05/l0+oU+XitLoXP4CrLfZlzdXY4/35Dyhi8mupj73j0?=
 =?us-ascii?Q?nNPO/RN0aymYcsfeo97ilO1VSN5jsqIJbU9jveBtemE5nohJOL89aX0vbvt6?=
 =?us-ascii?Q?upMlr1Wh1r19N+uVUo1mA2hKVu5ONr6EpKw19Ml4t1N93gElO2ty99+L2Ts+?=
 =?us-ascii?Q?SKYkkt5TlIwVRHiqP4eVboIn72pulkHOLdbGBIbu4UqGExloeh8iKFZGTvvF?=
 =?us-ascii?Q?Yunt18U9gdMFo6uR2sLd8KkD6T3VmHDVwGHFMkz5jElhT68ciNiUUsn3fhMu?=
 =?us-ascii?Q?ks4KuQRhgOW/Pul99l3ZHoq4XKiHHf2XzpycdosMkHu67B2dLVMVngIWxhIK?=
 =?us-ascii?Q?IFlb/9dmpfU1fq8/tVpcjMi+Or6coGf9MPwZCicmIIiJNw/64gENspWOhPnV?=
 =?us-ascii?Q?kZPUVlvwH5srR4ajYiaqFDEeWmvmuf7Fy2iooi+GTjqfyeiXndmZnrVM3SJW?=
 =?us-ascii?Q?VvtSY8KYG4jdC6/bD9rpQhIb9ve3NCd6EdPod0E8iVnts2/VUNSoBHBSSQoK?=
 =?us-ascii?Q?Z66WBbeC59NHJ2V0iweNPZOU5mBpys0jU1myc78a0dbg2hzoBVnOqJ4wjCj1?=
 =?us-ascii?Q?LjUC5Qm/ZQWPdMn3Y4H836cQgqbI6o9r7SYu9qwsPOZSA7RWOtd0ONP527b6?=
 =?us-ascii?Q?4riPUqajWpb0reBKA+UGOc1nlZc/gl6XeLndINtsvhWj5RqLsnnGVQ1T69OS?=
 =?us-ascii?Q?0fCzLvC0S82ityLmx70tzMCljSu5ZJ1PZnwBZfV+u2RMylno0+BalEi7oH6U?=
 =?us-ascii?Q?3NVkUAs2hdr6Z033LKv3P+QNGsDkxbXJpUnC58fk2yjJ7zUXmwCo6qFsGce3?=
 =?us-ascii?Q?kAVLQmF+jlttSH2svna3qBXqvFP5YtEC5XUF0TiZvbeTX9GjCTp2C10ucj7x?=
 =?us-ascii?Q?77HNWPgfP5pc8+hY2wz46fQYsFPMVsBboaIWQWnb+evjWIC+ANrHyQ8C0sLv?=
 =?us-ascii?Q?A4SK5dLp/jZQhBCL3fJ9ZMrljtiXqFX2hlSN0Mf5pXnvWwDfZ9Y5bcC8g1Yx?=
 =?us-ascii?Q?iEEPJZG4Da8DfUS0sAazUAWszJyYAfISKcc736mF5q/afU8o5jo3qozOCPfw?=
 =?us-ascii?Q?56J+dzdBiowj6OFIqaWVQUmixUxMmoqxdyA0GPJQazdtEXitl5Ds5JsYek7Z?=
 =?us-ascii?Q?MiZR+6cwNCxHoXWQ/GlzBG3+S2M3HNE55YdVoHQT4F8s+dV9NlKgCAetgxsj?=
 =?us-ascii?Q?IZw7e2FaJX6fqQVKtN5f1OmQPOUikcj2pi5tyUKp?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6868.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18bd207f-d13d-4cb7-6a3d-08dcbdca7d0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2024 08:07:35.8659 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CsN2geMfD6d9+SseEbgg/CTc91kq4jV/xsHMZyfiLOvaOA9fymSogxC/v0+wSDa1EKMQdhMnag7bInTYnZQeiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6243
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

Old series: https://patchwork.freedesktop.org/series/137289/

> -----Original Message-----
> From: Singh, Apoorva <apoorva.singh@intel.com>
> Sent: Friday, August 16, 2024 1:34 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Singh, Apoorva <apoorva.singh@intel.com>
> Subject: [PATCH] drm/xe: Remove NULL check of lrc->bo in
> xe_lrc_snapshot_capture()
>=20
> From: Apoorva Singh <apoorva.singh@intel.com>
>=20
> - lrc->bo NULL check is not needed in xe_lrc_snapshot_capture() as
>   its already been taken care of in xe_lrc_init().
>=20
> Signed-off-by: Apoorva Singh <apoorva.singh@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_lrc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c in=
dex
> 974a9cd8c379..aec7db39c061 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1649,7 +1649,7 @@ struct xe_lrc_snapshot
> *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
>  	if (!snapshot)
>  		return NULL;
>=20
> -	if (lrc->bo && lrc->bo->vm)
> +	if (lrc->bo->vm)
>  		xe_vm_get(lrc->bo->vm);
>=20
>  	snapshot->context_desc =3D xe_lrc_ggtt_addr(lrc);
> --
> 2.34.1


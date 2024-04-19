Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D01C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 19 Apr 2024 15:24:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F0BC10E460;
	Fri, 19 Apr 2024 15:24:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QxP3RX36";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 805F210E460
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Apr 2024 15:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713540263; x=1745076263;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=T8Jp0MfiSuWbcjWKiqreX0byIpJHLKIUJcm4N3MmICo=;
 b=QxP3RX36EGA+xIoZcp0KiBVH5mAtNMZ/56fjf3MUiUUNkSibfmyX8Glg
 gR0y8GoIlyTuGw9zepICEdLL0cZ1eg7ESu6kFJ84EhfhjiyVChAcAlVfh
 2zoGQns5+HRn5qh3lCnWTTBJ+BX9QnAU9WS25sJJKsmh9C7TEyAp1l+0H
 YTSeS4+Bo+C3sRN0JTaKFG/YRG8UJmg3sNzin7Hih9g185SkNj3GZwH5s
 OWoCi8VKIE9wDNGh6Fpo9l1CEbFopIB/lBnatkXqpTHmLqkD0pgoOXVpy
 6Mh8yiGlwFc5llTkUQayy4NJVJIUxJ2wYmX/pEOcwCieutxXbHoUsJGch A==;
X-CSE-ConnectionGUID: wtobkC1nQf2H4JHQEZJX9g==
X-CSE-MsgGUID: tSt/XWtxQTWOj4kF70aqLg==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="34543805"
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="34543805"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 08:24:22 -0700
X-CSE-ConnectionGUID: VHjx+ujEQRG+oVsOdigEQA==
X-CSE-MsgGUID: Hg+ztuhPS4K9oRSBPB+6/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="23348171"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Apr 2024 08:24:22 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 08:24:20 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Apr 2024 08:24:20 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Apr 2024 08:24:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GJMvr9nchm+4Z6v9Tv5nnRqsunlJip6AAv86GTvIl3fanKHhZEg8nT7syEteBLdpK7S2IeCU6tf30ZfwiNUTbEL3PqWE2FESV/UkOb+pVihfaGlNMIwFIHUEXYVF4wsGiLx0ovRRnpJESibi6d9LrV542FCNOQ1Dx+P8bej0oOp/ahSphFMEJwtLMCiB0DGpzzrALK8yaiMrI2O2Lbu6M9FTUffkVMZJhJ6cR6bZRuzyu+fDFL6DG8DDHyyuMZN6sovega9D+SMDxTgUaRXwVeOLR+7e8lRQMMLkpBMyr4B4vYsGRUzmr4/4+htykkyp54fpLFzcy9Snfh/W42bg9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xxmYQFWenL2jJ4ARc6KLT+OBQkAkuRN+1bFlAsv1kdI=;
 b=M3zbg0H+/nhi8wK6LO9Q8BXupD1MwSPeH/HUJ1iqiQjEyqlhBjzweDMK0vO695YQkpvq1xYIo5n0RFCXN21+0S9plcZMQLTiOriwkdqqqaBUQvpGMrWR5jqS5Y3YgTSsC37/EKCUh7++N0dAlqCQ/AeW2n7UCMfSveuAzNh9B36mvT00gMmVnY6deLoAz77P4zoUssPNF7K9vEl88x0R9m8cHbtpJOJWq7bDFfaEKAX34Vtraedv2ogP6QFvESn5MhvKyBARHt0+FO8uDp74USIZQCZCKA1gzmpgcRLwiwRZu4mmXrffzqtbeDAzWZDSPrx2WbJziir9+vzApIKLfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by MW4PR11MB6910.namprd11.prod.outlook.com (2603:10b6:303:225::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.16; Fri, 19 Apr
 2024 15:24:18 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7472.037; Fri, 19 Apr 2024
 15:24:18 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH 11/13] drm/xe: Move ufence add to vm_bind_ioctl_ops_fini
Thread-Topic: [PATCH 11/13] drm/xe: Move ufence add to vm_bind_ioctl_ops_fini
Thread-Index: AQHaiwmrqiRVhi9CU0iO0z3QSEVifbFvwv5w
Date: Fri, 19 Apr 2024 15:24:18 +0000
Message-ID: <SA1PR11MB699187124D07E9B753DEAA46920D2@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240410054056.478023-1-matthew.brost@intel.com>
 <20240410054056.478023-12-matthew.brost@intel.com>
In-Reply-To: <20240410054056.478023-12-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|MW4PR11MB6910:EE_
x-ms-office365-filtering-correlation-id: 6ed86875-132e-4713-bb40-08dc6084c79a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?mHJSxX4RqQu2u02mTW+D1Nz0Z3OcnH/L3GnCCwk6CTzv6U1TRpfdEWIqbzXJ?=
 =?us-ascii?Q?UIm4QhR0guwt9wsp5U3tS15G7D2aVJvygjVTZmJ98A1l90moOaARRMeAWjzQ?=
 =?us-ascii?Q?mWTx/aszuMWRaAHKTZn0d2tIrAhEmDiTiGxe96HDIWAMr3L00WIkJzzETtwX?=
 =?us-ascii?Q?vp3wgvQa7Cbq1b5/WxDlOPNt4b50BjhojRW26zEQZsvsbqFRMibcQs8L1MFH?=
 =?us-ascii?Q?nAW8DH5dTJyQwZoSU6y7Vr4bak1TFFooidMx39+y28qrdySCnIwHtb+F87Ym?=
 =?us-ascii?Q?j+Hruasmz8cRNw71A4tY60rkvKPZE8I33k6BAfYKW19PSO8+zGLizte83h8H?=
 =?us-ascii?Q?8VUBy/L7yJipGsNuHX5Dszp5JLxdxnXNJgSR/pPuMQqHTzEvUdIufL5+jDVU?=
 =?us-ascii?Q?j0EOQ4ppAly/h2J6CY8K1QadaxvyN13G7kBCCD6lts5DwKfAeL1A9z5A66oU?=
 =?us-ascii?Q?J3xLisKDd++bJYCddQB37CqXcDXKOOAaMfPdFwNpFYDsixwezzyvMfTtK+zE?=
 =?us-ascii?Q?0A2WchxjaHEB91eCF/vePfp2h05uO9jIumcg6tGjrSKiX/U2h5FjXYdWHs06?=
 =?us-ascii?Q?PrpoZapvKxZJXpiC1scwQYpb0klAIkDO8PuN3i7KDtcViu3nhUTd3P3P9G1B?=
 =?us-ascii?Q?h1buHcSNHAGYjhHLxLWkWX021rwp9pBGri8I6L6WzOP9dJj8sBw85miYFc6l?=
 =?us-ascii?Q?ruHVF8DsLodeVPnUUbv6RCJ4rk/FozuKgbZfz7gA28r6rwubtbxbw+9SIvCI?=
 =?us-ascii?Q?uopex+H7P0tZ1ijx2+XkGU4cRFHK8FoPn8sSVaXxxrF0HkF9e7zvrKVN9bkB?=
 =?us-ascii?Q?g5nlcSE6Noig7k+zFnTYq/Kt00DlF+7ct+BqRiMRv98zT1SVdFb1v7xqRJPO?=
 =?us-ascii?Q?aSgNpnMZkxqCHIGdmGT5e63WhVH6ZPXc5hsHF96K7IySlTFQtIzYGkJ1rRrp?=
 =?us-ascii?Q?FD7VUaj46lCICk6K7n3T+/J057HLeyAKQu1gtdh3Bpm8g2aKkqMwamjoo2G+?=
 =?us-ascii?Q?KV9triD4zFrWQGm2jTdNeQRWo+Hm27SDAKidppCmLZwgVBI0oWYsmmbFpByt?=
 =?us-ascii?Q?EUxFwtPA3uzvldzaRu1Y/izIWUbpMD4HIqh9fiRY8F/2se8OWnJ/BjzDw3D/?=
 =?us-ascii?Q?PhjUGHj+j/2V8+1St3VyXKvxo1qdB8KuHsM474aJy8JIEBw2u0bVk5rtKvYd?=
 =?us-ascii?Q?V5X8KKwQ5HG0K62mv0pL029gyN6o7GGUy0ZgMmvjLI8mkeRKdSpWAe7/HixU?=
 =?us-ascii?Q?3wVT6rdo6wtmYUMjMIulrERbLg5J//vGYgTR29tY668AOsxdvcVjI+6hAEoC?=
 =?us-ascii?Q?CZ9D4mFkmNGOkK9RgrtMCpNR?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iUFjcPqlX68tLqXb5prECOYjOEDIG26+FFXAmZ4WcCoZo5AnYYuNToztnkLk?=
 =?us-ascii?Q?N0wROZDJkFpmPzcPDzuYJD3l4veIpN00ueJJ1FJH2Gs3WUiqZNHoffTHyMnp?=
 =?us-ascii?Q?O7V3rJeENleQ5OGTJAQSOHjoCH6CVg2OgfZ1IbTDNJE/sbuzRLw9mbwZ3WkI?=
 =?us-ascii?Q?QNIY1njWIxEjUBpAOCDnYF6QaebLA1IKg4NtkEB5Kbyk+E83UFD8oaUZYb7J?=
 =?us-ascii?Q?PRzNf+Rn7UmXGO5Tg4TRj4APVVJHUCYd2FbXqokjSt9+VtQ33PHyVh1B1HDg?=
 =?us-ascii?Q?DiKcS74KTMn59RA6Rh+vnpoHXmTLunaw5DEL6l2gtpCgISTRGTekrQUalne0?=
 =?us-ascii?Q?eekwXdV8ETpFOhFw2fb6LHHWTSKNs8+HcyYLDYcVSQhz23GbndjXiIONrZof?=
 =?us-ascii?Q?q6cfpEP/kxV282iczPVhFiQ1n4vfYAniMuEYl3JBTSZF8vLbLxgTbBdAKlex?=
 =?us-ascii?Q?3CmDQDgI8oLfmjXiH5wM8cZNl632AywxVDhXAESSV692DgbKhltufLegLlzv?=
 =?us-ascii?Q?iTFr+LhL2Ca2JlIz11YwxwPkfHUtOa/oqFgWJKfhz2z97cJjYyIm/x6jjDGS?=
 =?us-ascii?Q?drR/jUnMkx0ztKpxw4GMsXbRVFW1Srl9OuKRnjr7IB/Hc8AL/+2WlYrU4j8q?=
 =?us-ascii?Q?Vx/Avx27lu6JD4uiuQfT5+owgc6Drhi8QhR6WNbc/20wh8wW2xNxOAKjltni?=
 =?us-ascii?Q?b67GWx7mB7UnUkhP3ZN8TxsxntyCMFYYQ3K8kBCWAqciFIsc304LByrQhGXe?=
 =?us-ascii?Q?j+CvkdGPFhmEAjM7DG6dOrXVIeCH5V6qszciDrAG9Rmues/e6wB9vWH59maN?=
 =?us-ascii?Q?uUQ/REWmiI5YMw7+c/J8UOxwxSC8NiAWAEfaT8E9Zon6inX20hJu1gkBSztT?=
 =?us-ascii?Q?iy6hlzaVpF3AuuCaAvNoIopjqdkUB5pg3nGiTe0evxeyOrinvNJQaLwsAhC/?=
 =?us-ascii?Q?AeEZM/zM8tza94pg5bgTwNa28FJ5lU1bRX2keXwrM6hnVP9SVQDlCzHUyzM1?=
 =?us-ascii?Q?+WDdqJu8KIhCPEL0kQNwTWOSUFomYkqy6jbK2KNEG48AuzVCUZ2Zi0r0CFtc?=
 =?us-ascii?Q?ITY5Gte6wMFrBF1YyaXh1iSicwAgB2Okju2Mzd/lbDnYcecD3FBcmCYtt2XT?=
 =?us-ascii?Q?xV3W9Q+7Raj3WdGZGzzjNUyBkLka5W9wT7h2Psm9MK8qUYWl5v0YqnbXqHX/?=
 =?us-ascii?Q?PZTFSrYRjTr5D6joRExG8T0HIb7kRFg48Ovcr7gSf2M7oRVXd3AvrNNApQlM?=
 =?us-ascii?Q?Yi4VbhB+yXExIMWMc4HcAp2EKF0odel5D/2F+XFMgqfE7fOR7UrUhKZT9uNP?=
 =?us-ascii?Q?hbImji5lFqyYM1vLTgBVcSUApmIQdLI4cHK3l/9CDIotGeOVq1KF94d0C/MX?=
 =?us-ascii?Q?nTFk8Z7YjPCVBEzIb9ALeTST/dyys8N2DKp8DrJ3neJrWWlufh+DlxwyepNs?=
 =?us-ascii?Q?bm7NKXvf937+gHXz+q9qjph4Kn6Ji7As7io5XrlGPGkCY1Tfuw/Hcw0A0sjN?=
 =?us-ascii?Q?u3KljsLU8ntwk0Y+fGvdVt2N+rsog3sfo1i11sqVDdD/RYVMEHPRP9svskkU?=
 =?us-ascii?Q?pkv48wPXy5KhdaRbm0U=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ed86875-132e-4713-bb40-08dc6084c79a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2024 15:24:18.0219 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M6DN5IlFWEWmySHYdBjtgC8aUNDAI23us0SF0y2N+XHW4YNxo52k8kvzvLs9T5EjwAJ+E9NoZoe7h5JuP0c8kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6910
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> Matthew Brost
> Sent: Wednesday, April 10, 2024 1:41 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Brost, Matthew <matthew.brost@intel.com>
> Subject: [PATCH 11/13] drm/xe: Move ufence add to vm_bind_ioctl_ops_fini
>=20
> Rather than adding a ufence to a VMA in the bind function, add the
> ufence to all VMAs in the IOCTL that require binds in
> vm_bind_ioctl_ops_install_fences.

This is a typo right? From the codes, it should be vm_bind_ioctl_ops_fini

I also want to make sure I understand here: so the ufence added to vma is *=
only* used to make sure last vma bind has been completed upon vma unbind ti=
me. So even though it is more natural to set ufence at bind function, it is=
 safe to set it after all operations are submitted (vm_bind_ioctl_ops_fini =
func). No vm_bind ioctl (and the vma unbind triggered by ioctl) can go thro=
ugh *before* the last vm bind ioctl's ops finish, right?

Oak



 This will help with the transition to
> job 1 per VM bind IOCTL.
>=20
> v2:
>  - Rebase
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sync.c | 15 ++++++++++++
>  drivers/gpu/drm/xe/xe_sync.h |  1 +
>  drivers/gpu/drm/xe/xe_vm.c   | 44 ++++++++++++++++++++++++++++++--
> ----
>  3 files changed, 53 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> index 65f1f1628235..2883d9aca404 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c
> @@ -338,6 +338,21 @@ xe_sync_in_fence_get(struct xe_sync_entry *sync,
> int num_sync,
>  	return ERR_PTR(-ENOMEM);
>  }
>=20
> +/**
> + * __xe_sync_ufence_get() - Get user fence from user fence
> + * @ufence: input user fence
> + *
> + * Get a user fence reference from user fence
> + *
> + * Return: xe_user_fence pointer with reference
> + */
> +struct xe_user_fence *__xe_sync_ufence_get(struct xe_user_fence
> *ufence)
> +{
> +	user_fence_get(ufence);
> +
> +	return ufence;
> +}
> +
>  /**
>   * xe_sync_ufence_get() - Get user fence from sync
>   * @sync: input sync
> diff --git a/drivers/gpu/drm/xe/xe_sync.h b/drivers/gpu/drm/xe/xe_sync.h
> index 3e03396af2c6..006dbf780793 100644
> --- a/drivers/gpu/drm/xe/xe_sync.h
> +++ b/drivers/gpu/drm/xe/xe_sync.h
> @@ -37,6 +37,7 @@ static inline bool xe_sync_is_ufence(struct
> xe_sync_entry *sync)
>  	return !!sync->ufence;
>  }
>=20
> +struct xe_user_fence *__xe_sync_ufence_get(struct xe_user_fence
> *ufence);
>  struct xe_user_fence *xe_sync_ufence_get(struct xe_sync_entry *sync);
>  void xe_sync_ufence_put(struct xe_user_fence *ufence);
>  int xe_sync_ufence_get_status(struct xe_user_fence *ufence);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 0319e70577fe..1da68a03407b 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1900,17 +1900,10 @@ xe_vm_bind(struct xe_vm *vm, struct xe_vma
> *vma, struct xe_exec_queue *q,
>  {
>  	struct dma_fence *fence;
>  	struct xe_exec_queue *wait_exec_queue =3D
> to_wait_exec_queue(vm, q);
> -	struct xe_user_fence *ufence;
>=20
>  	xe_vm_assert_held(vm);
>  	xe_bo_assert_held(bo);
>=20
> -	ufence =3D find_ufence_get(syncs, num_syncs);
> -	if (vma->ufence && ufence)
> -		xe_sync_ufence_put(vma->ufence);
> -
> -	vma->ufence =3D ufence ?: vma->ufence;
> -
>  	if (immediate) {
>  		fence =3D xe_vm_bind_vma(vma, q, syncs, num_syncs,
> tile_mask,
>  				       first_op, last_op);
> @@ -2918,20 +2911,57 @@ static struct dma_fence *ops_execute(struct
> xe_vm *vm,
>  	return fence;
>  }
>=20
> +static void vma_add_ufence(struct xe_vma *vma, struct xe_user_fence
> *ufence)
> +{
> +	if (vma->ufence)
> +		xe_sync_ufence_put(vma->ufence);
> +	vma->ufence =3D __xe_sync_ufence_get(ufence);
> +}
> +
> +static void op_add_ufence(struct xe_vm *vm, struct xe_vma_op *op,
> +			  struct xe_user_fence *ufence)
> +{
> +	switch (op->base.op) {
> +	case DRM_GPUVA_OP_MAP:
> +		vma_add_ufence(op->map.vma, ufence);
> +		break;
> +	case DRM_GPUVA_OP_REMAP:
> +		if (op->remap.prev)
> +			vma_add_ufence(op->remap.prev, ufence);
> +		if (op->remap.next)
> +			vma_add_ufence(op->remap.next, ufence);
> +		break;
> +	case DRM_GPUVA_OP_UNMAP:
> +		break;
> +	case DRM_GPUVA_OP_PREFETCH:
> +		vma_add_ufence(gpuva_to_vma(op->base.prefetch.va),
> ufence);
> +		break;
> +	default:
> +		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> +	}
> +}
> +
>  static void vm_bind_ioctl_ops_fini(struct xe_vm *vm, struct xe_vma_ops
> *vops,
>  				   struct dma_fence *fence)
>  {
>  	struct xe_exec_queue *wait_exec_queue =3D
> to_wait_exec_queue(vm, vops->q);
> +	struct xe_user_fence *ufence;
>  	struct xe_vma_op *op;
>  	int i;
>=20
> +	ufence =3D find_ufence_get(vops->syncs, vops->num_syncs);
>  	list_for_each_entry(op, &vops->list, link) {
> +		if (ufence)
> +			op_add_ufence(vm, op, ufence);
> +
>  		if (op->base.op =3D=3D DRM_GPUVA_OP_UNMAP)
>  			xe_vma_destroy(gpuva_to_vma(op-
> >base.unmap.va), fence);
>  		else if (op->base.op =3D=3D DRM_GPUVA_OP_REMAP)
>  			xe_vma_destroy(gpuva_to_vma(op-
> >base.remap.unmap->va),
>  				       fence);
>  	}
> +	if (ufence)
> +		xe_sync_ufence_put(ufence);
>  	for (i =3D 0; i < vops->num_syncs; i++)
>  		xe_sync_entry_signal(vops->syncs + i, fence);
>  	xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
> --
> 2.34.1


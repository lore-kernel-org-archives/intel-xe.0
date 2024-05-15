Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2A6FC25B75
	for <intel-xe@archiver.kernel.org>; Wed, 15 May 2024 21:29:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C79A10E340;
	Wed, 15 May 2024 21:29:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dynPkMjS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9AD110E340
 for <intel-xe@lists.freedesktop.org>; Wed, 15 May 2024 21:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715808563; x=1747344563;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ypFY50OLKTA9bvfEEj2CUe0x1uX6UrWcIAUzoprhl/k=;
 b=dynPkMjSIHfX7tIFeTV9B+Hf4RncVh5+SO6nQ7qY4TTVJE6ueNGXK3Yi
 1IQkKRZKaSO3trI/UyuG80f5uBVBOJtL4RAlOQ4g27Tb62uwRPngLF1k+
 Ewn4SQparpvhvqzgnuCOJWWMWin3VkDAwYGVJgXA0GxPzRB2puuWMn4mk
 1ZndeDri+XRnxZiyvaZvutB09DwdCWHLXu0/DARUhC6E/nGbK8Dp8k5Fd
 1LWsrgg91OgPL4R9/Knz3VZtrfzDJRfo21ygdQCOccnmlwQhcV6V91qF3
 ZqHZYFdYM+vbC/a2UeMPAag7BvMDMYigpZJt0p4gLDjNQVML/ZdaNoGpA g==;
X-CSE-ConnectionGUID: eoRRdQ43Sk+I54ZsPsO05w==
X-CSE-MsgGUID: aJIloFb+RRSi3SANuiphrg==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="15712632"
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="15712632"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 14:29:22 -0700
X-CSE-ConnectionGUID: MMovjPENRhSu5UBxAvlg5w==
X-CSE-MsgGUID: a6Un0k5KRaqBHF0aM0KsJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="31618472"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 May 2024 14:29:22 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 15 May 2024 14:29:21 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 15 May 2024 14:29:21 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 15 May 2024 14:29:21 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 15 May 2024 14:29:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GzTbphezcR8mfYAGF7K1YBiWuu+EE/56FwXPochHbTL0/10ok+lQCa2vu2o9N/3M08AyAcMhQj7511rGpOzcv7tDlb0gSK3UHA7D8WLragn1xBp/P0zEbraILwoKLTMBvgMr3lfyv+bvbUb8Q3YAUO4alZ4tYD81yep8sz3UhXSClyWYvYeogp9Z0zLxFd3ifgM7dw9LY1r0b7KMgmzXzW3u0wXpEjF6+YAY0o88Y4XcKrwy2qTlpqRQcnjHBi0Dbhy+LKcSNYmCKo5ZlBesD8sYWo1p1/xqX0IZeUvKSbqsVl47SU4RqFjJ5DF2pvXu0I4vWhvmwygri6NOjwUzlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XrC0T6yzvN33uThap9y74s7hKjOowou+ADP9cRPdcd4=;
 b=DJwedcagLjj5uUrqqVmHCXzxH+z/4f6Tzn56lnYNciviN/xB3wwkSVhoHLagKbDhwqGExQMd6gKo6sE3clvFYTUhpjwZmOK4YvHI3EaeWjkMCzuS+UztcaVJ4RYg2M+llCu5jDfp18lBVyshl/upe3zK+O+kzsrzV/zzLJsjLqZHfejEl3pnzCJCvExpGzwKRwWzEN3g9jFQ7HWcXCE8wcC42IpFEmRibWtYgx19OsK0uGCTcQjKJYO+28jP34AF24NDlz4I7//NXwCsYgc8mhERownzNKaSTDZWY2Yx6fbYBBELyOj56pbz31E73pFKhkWSVM0gw/sFbrPHwnusvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by MN2PR11MB4518.namprd11.prod.outlook.com (2603:10b6:208:24f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Wed, 15 May
 2024 21:29:19 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::f061:a0b9:4a91:b27c]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::f061:a0b9:4a91:b27c%4]) with mapi id 15.20.7587.025; Wed, 15 May 2024
 21:29:19 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Cavitt,
 Jonathan" <jonathan.cavitt@intel.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH v2 6/6] drm/xe: Add VM bind IOCTL error injection
Thread-Topic: [PATCH v2 6/6] drm/xe: Add VM bind IOCTL error injection
Thread-Index: AQHapmBvzKQ1uZ6xdEiiUveRFmT7vbGYzFQA
Date: Wed, 15 May 2024 21:29:18 +0000
Message-ID: <CH0PR11MB54442A8068E820E1A295CFDCE5EC2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240515004010.100091-1-matthew.brost@intel.com>
 <20240515004010.100091-7-matthew.brost@intel.com>
In-Reply-To: <20240515004010.100091-7-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|MN2PR11MB4518:EE_
x-ms-office365-filtering-correlation-id: 9186b58b-4049-427e-ebcb-08dc75261456
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?061NBTOKYLrNAY4UaM6c1Y4lsyM6n1IwddmSFzG9uPhIw9Z9msGkSPwLbvjd?=
 =?us-ascii?Q?3PDlIlAmX3W3N9n2GJtTVZJ8rRmcmPrTGwoIwPec1BYNx62UMN33roxJoYSm?=
 =?us-ascii?Q?xhO+9ARx4jvjl42yKw/b/2FanY0dkLR/BwSQTJjQ10WFeBOZpU9Gogw4Kg/d?=
 =?us-ascii?Q?qvTiT8TRQTj0PQrY9kNJVMnFaf2iAOHjqooNDtOlJOTASso+lsq6WGVvYUP9?=
 =?us-ascii?Q?U2pYK96SozW/1jcK2apF7S7BSPjyJ0kmUthO7n3ePsWnnzfjDqEyez3wySIB?=
 =?us-ascii?Q?8wud2hCflFKpeNDCUkVWYIk19UIrS8yr+NKmkpoJA2Hz9AGZ/Xqzy58qvdEY?=
 =?us-ascii?Q?nPWdUfvr+Y9WsDYMdJkUccA7OSRipJoN7xj7EDydXeTO5XfAgouhggX2rJf3?=
 =?us-ascii?Q?80ca12g94rcMq8cTXX9C+y1V/F8lbu7wiuM17QUUGpJANyDoHzUXplLzSy1Q?=
 =?us-ascii?Q?mtaI/rAD8QHXoqB0jIo1yJpQGJISoKA+lSOjlmgIYXkzmPxVIw43IuIfezld?=
 =?us-ascii?Q?nehfHkQtkY4SO8W7oU4TIciV1A5pfeUpTD1p2lt/Rm7B3kwCurDNbrXrOaBe?=
 =?us-ascii?Q?ERx/hXiIWto79mQWKNGZjTmWFt2vtjRnjdMQ8xzuqAWDcz1DVocGZdBL/bWu?=
 =?us-ascii?Q?S8bx4YTKL6u2KTvZRIDym0ehBsaGyC3Hk87IzDA9M3OZYfKI+/HeyfQt2b5U?=
 =?us-ascii?Q?KkRQinI56hP2OnmW73BicvZRuQ3EaBL69DEcCksp/JUjAU8xqGczR/UtrtzP?=
 =?us-ascii?Q?wobHbSyF0Gzl3pH7jTBUdTmxAe0uaF50BnGJqK/s5EUkVLFB3uVD+kHgBKbZ?=
 =?us-ascii?Q?091/HOOl9daGZyEtNx5f9RmbHjT+gqOJiCHLDrxnhVXbrFSDOqX/j6fViOrG?=
 =?us-ascii?Q?L+I/tHH92ZFVGgZjjS7YBRh1YHGV7EVsdeDUiMnXfuDs8mmTS4QkpRpO045k?=
 =?us-ascii?Q?pm5gi91vRXdUdKrjtWYzg7rAUn5Wdja3RAZCEz9GNGVX/5unxgo9OqUHjPpS?=
 =?us-ascii?Q?88WiUJCDpGIbF4g/gfhXuKiD4Q5IAcGRth9ntjrg/gEvSztXl6aH/wSuq4Lm?=
 =?us-ascii?Q?gpJDMHYff7bY3jYfQfNuztVQy4jzzcFpiYabXbnDSUdzpx5cTgKD4wCgmYpy?=
 =?us-ascii?Q?Njma4YRSsv2Q2Sb0E1MZdvrfjF1BOOQkPitggETExz1EDqzTila/w2jqG09t?=
 =?us-ascii?Q?AAQw+sY5/n5OcqgwgTJgkwxf2kaX3xP2C3aG1RwPpf/KDpIDMG10xtd1iHeg?=
 =?us-ascii?Q?nfUYbSx/Qb+H+cY2pPS5IVQIlAyK+6NpwJvHiWU+6dltM2reiXKtIZvgKxgs?=
 =?us-ascii?Q?VPKVzuOc4eBRG0qkb+WpbHZ+uqSXH+66rvJsz46BwFKzvg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?E4zV4axT+cabKSo7GBAawnL9r8z5VZz3on1F4cNir2U7rrU04gmiyFxtTHO0?=
 =?us-ascii?Q?OCI+iDz/PyLJNLuPzVvtwtWcctvBZYL8COk5MypeOgDWz0QNAiKilrXASvyj?=
 =?us-ascii?Q?U6lgPArpib5pSHOjHVomY6fuKqDlyRCcjB9PjFo8wwJB6dEVKNWHMlClWKur?=
 =?us-ascii?Q?65ATbJrZu7N4ZgbaSBa3BYFPTBr98V1QFtC4m//47ZXC2RrFZov8cA57w+Pz?=
 =?us-ascii?Q?Y8mhjnzV/2wEQFHAZqgXcRUmPCahjvFpLheW/ZAGhusrWsgkrJ9GLy01wBNL?=
 =?us-ascii?Q?kSaWDAvAv3hQJvrTnGYq5in/J4ZTWiLrj1CDFB2GmiSVxIYtsV15o9Q552df?=
 =?us-ascii?Q?6HFNjw4wSiEbQ7LV1fiwJLl7BXNZeaGyOpKV6RpLp1jsKWevBneKrLsYZifK?=
 =?us-ascii?Q?vmsVADeze5Yj1ScdGiPuh+eWZufSEaxnn9fXG/fLDTE+cXGennqV3LdTSu/v?=
 =?us-ascii?Q?Yfn6tcq6N+xeW4T6bzWZbZxBeFTQzYL8kW3XMqk2ait/MPwFYQRWQW+viidE?=
 =?us-ascii?Q?4KYsA2ywC0yKtu9HlbyE+pDALWK/VyfKmfN4NQOidfk86YvIvmogG+9xqlVn?=
 =?us-ascii?Q?SzGoasX9K+7PTS/wZMkMIpaNwQzTumFoDK+6GiDKVpglM2yFOYhCEtjbhiuc?=
 =?us-ascii?Q?fdfLnbpbRPFUdUoqFjGAgDALsS9FMAsnbn68M6J+NKHN3AML2S3/st1InzK2?=
 =?us-ascii?Q?WwV1Q1B8ZwHSTlppfFOhGMFG10IPEC9NnMWztv5OWHBbuG7kXvtJlIbcblJS?=
 =?us-ascii?Q?4KPdK3FzZfLeZ5oChiVuBCxNK75CV/tsxiVmjNS7yA9uBpqeIKB8TJe1AzOP?=
 =?us-ascii?Q?yN58NKM5xHYmWApcM3AgxAIOHImDvaHoAd267ocvz2rnD4qElR4xie5OfYle?=
 =?us-ascii?Q?X9N1SO6vrYR44VTrttHdyMz+/08heyqmf767Ir9fAqbNQvpR2E1Pbu1ZRb19?=
 =?us-ascii?Q?aGiWiSk+hNM64vAsTb0FwctNn6+K0BpA7vAWTj7zc2U+tt16WuMwY5q07Bs2?=
 =?us-ascii?Q?377T5Beus0aCNm8C1Vb67ctF7PRoDvGNCHCAeMkfzWYdbnl/+2qxT/sl5ZeK?=
 =?us-ascii?Q?VEIDRYFTAMlmdZnKeAdiivzpo/xnmKFQ7O5j3gPS/rSzUf6gljJqQ7vqfi67?=
 =?us-ascii?Q?Y+ts1zlnIN6cnxFloNx1OTPqHlYienFcrUhmy9/Fq61Paq+/B/6yW1jwfrzm?=
 =?us-ascii?Q?z1flUFwGqIqCozG+fe4dLssyHK37jJEEzcxnPsaBBdgnSesKdoyoo9OXYe79?=
 =?us-ascii?Q?V9e0bEUEjDCQ6uNBkLWHFbLQUj3LeR0i3QEOOxlKC/ShkWN/0J1WzyHpb6jN?=
 =?us-ascii?Q?o179E8qW3b1TaqclzkdWkyWV0RG5f7CKlh96OmOGjiAaPvJ+PLiFhzPOSe8k?=
 =?us-ascii?Q?HRvVOqIIhZjMfXpfMpahIdz+lF+kGXhIkXmQtjgif5FUAgn0/77+XGacFgH1?=
 =?us-ascii?Q?MyX3f+pw0X89+3+sJSEzTm75B/YgIRJljalW2mdEmD/VOVqeFBy6usPWCnF3?=
 =?us-ascii?Q?KXWlkMh2Q/V40JqN3+5EEUMe5o0Wof4Xhj/+3Fb+1zcuQbBy4vnAXAPoZ14a?=
 =?us-ascii?Q?664c9c+8h40A8hfoHAT1CaSzqstzfRt+WUIG3yzV?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9186b58b-4049-427e-ebcb-08dc75261456
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2024 21:29:18.9976 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BxVbxspjJyKgv3ZtuEL1uZlliFyW6Qjm0gK6gQ0QaM5ub29Rp+6j0PWV5w2tZ5yQZJoMnRe4tuKJhbT7wOrqUpxehPQw2uvVxAxU0L/KEVQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4518
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
Sent: Tuesday, May 14, 2024 5:40 PM
To: intel-xe@lists.freedesktop.org
Cc: Brost, Matthew <matthew.brost@intel.com>
Subject: [PATCH v2 6/6] drm/xe: Add VM bind IOCTL error injection
>=20
> Add VM bind IOCTL error injection which steals MSB of the bind flags
> field which if set injects errors at various points in the VM bind
> IOCTL. Intended to validate error paths. Enabled by CONFIG_DRM_XE_DEBUG.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

I have a minor nit lower down, but nothing worth blocking over:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device_types.h | 12 ++++++++++++
>  drivers/gpu/drm/xe/xe_pt.c           | 12 ++++++++++++
>  drivers/gpu/drm/xe/xe_vm.c           | 24 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm_types.h     | 14 ++++++++++++++
>  4 files changed, 62 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe=
_device_types.h
> index 0af739981ebf..6c8c55e9addd 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -22,6 +22,10 @@
>  #include "xe_sriov_types.h"
>  #include "xe_step_types.h"
> =20
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> +#define TEST_VM_OPS_ERROR
> +#endif
> +
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>  #include "soc/intel_pch.h"
>  #include "intel_display_core.h"
> @@ -471,6 +475,14 @@ struct xe_device {
>  		int mode;
>  	} wedged;
> =20
> +#ifdef TEST_VM_OPS_ERROR
> +	/**
> +	 * @vm_inject_error_position: inject errors at different places in VM
> +	 * bind IOCTL based on this value
> +	 */
> +	u8 vm_inject_error_position;
> +#endif
> +
>  	/* private: */
> =20
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 7f792b7feb06..0907aeaa25ed 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1865,6 +1865,12 @@ int xe_pt_update_ops_prepare(struct xe_tile *tile,=
 struct xe_vma_ops *vops)
>  	xe_tile_assert(tile, pt_update_ops->current_op <=3D
>  		       pt_update_ops->num_ops);
> =20
> +#ifdef TEST_VM_OPS_ERROR
> +	if (vops->inject_error &&
> +	    vops->vm->xe->vm_inject_error_position =3D=3D FORCE_OP_ERROR_PREPAR=
E)
> +		return -ENOSPC;
> +#endif
> +
>  	return 0;
>  }
> =20
> @@ -2005,6 +2011,12 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct =
xe_vma_ops *vops)
>  		return dma_fence_get_stub();
>  	}
> =20
> +#ifdef TEST_VM_OPS_ERROR
> +	if (vops->inject_error &&
> +	    vm->xe->vm_inject_error_position =3D=3D FORCE_OP_ERROR_RUN)
> +		return ERR_PTR(-ENOSPC);
> +#endif
> +
>  	if (pt_update_ops->needs_invalidation) {
>  		ifence =3D kzalloc(sizeof(*ifence), GFP_KERNEL);
>  		if (!ifence) {
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 7fa533902bda..2bac8539d024 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2467,6 +2467,12 @@ static int vm_bind_ioctl_ops_lock_and_prep(struct =
drm_exec *exec,
>  			return err;
>  	}
> =20
> +#ifdef TEST_VM_OPS_ERROR
> +	if (vops->inject_error &&
> +	    vm->xe->vm_inject_error_position =3D=3D FORCE_OP_ERROR_LOCK)
> +		return -ENOSPC;
> +#endif
> +
>  	return 0;
>  }
> =20
> @@ -2703,11 +2709,20 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm=
 *vm,
>  	return err;
>  }
> =20
> +#ifdef TEST_VM_OPS_ERROR
> +#define SUPPORTED_FLAGS	\
> +	(FORCE_OP_ERROR | \
> +	 DRM_XE_VM_BIND_FLAG_READONLY | \
> +	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | \
> +	 DRM_XE_VM_BIND_FLAG_NULL | \
> +	 DRM_XE_VM_BIND_FLAG_DUMPABLE)=20
> +#else
>  #define SUPPORTED_FLAGS	\
>  	(DRM_XE_VM_BIND_FLAG_READONLY | \
>  	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | \
>  	 DRM_XE_VM_BIND_FLAG_NULL | \
>  	 DRM_XE_VM_BIND_FLAG_DUMPABLE)
> +#endif


I'm aware this is basically the only correct way of doing this,
but the fact that both instances of SUPPORTED_FLAGS are
the same save for the presence or absence of
FORCE_OP_ERROR rubs me the wrong way.

I know we can't just "append" to SUPPORTED_FLAGS, but
maybe we can use a stub?  Something like:

#define SUPPORTED_FLAGS_STUB  \
	(DRM_XE_VM_BIND_FLAG_READONLY | \
 	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | \
 	 DRM_XE_VM_BIND_FLAG_NULL | \
 	 DRM_XE_VM_BIND_FLAG_DUMPABLE)
#ifdef TEST_VM_OPS_ERROR
#define SUPPORTED_FLAGS  \
	(SUPPORTED_FLAGS_STUB)
#else
#define SUPPORTED_FLAGS  \
	(SUPPORTED_FLAGS_STUB |\
	 FORCE_OP_ERROR)
#endif

Feel free to disregard this, it's just a suggestion.
-Jonathan Cavitt


>  #define XE_64K_PAGE_MASK 0xffffull
>  #define ALL_DRM_XE_SYNCS_FLAGS (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
> =20
> @@ -3055,6 +3070,15 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void =
*data, struct drm_file *file)
>  		err =3D vm_bind_ioctl_ops_parse(vm, ops[i], &vops);
>  		if (err)
>  			goto unwind_ops;
> +
> +#ifdef TEST_VM_OPS_ERROR
> +		if (flags & FORCE_OP_ERROR) {
> +			vops.inject_error =3D true;
> +			vm->xe->vm_inject_error_position =3D
> +				(vm->xe->vm_inject_error_position + 1) %
> +				FORCE_OP_ERROR_COUNT;
> +		}
> +#endif
>  	}
> =20
>  	/* Nothing to do */
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_=
types.h
> index 39bfa259c7be..2ba7d9ad5ba6 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -23,6 +23,16 @@ struct xe_user_fence;
>  struct xe_vm;
>  struct xe_vm_pgtable_update_op;
> =20
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> +#define TEST_VM_OPS_ERROR
> +#define FORCE_OP_ERROR	BIT(31)
> +
> +#define FORCE_OP_ERROR_LOCK	0
> +#define FORCE_OP_ERROR_PREPARE	1
> +#define FORCE_OP_ERROR_RUN	2
> +#define FORCE_OP_ERROR_COUNT	3
> +#endif
> +
>  #define XE_VMA_READ_ONLY	DRM_GPUVA_USERBITS
>  #define XE_VMA_DESTROYED	(DRM_GPUVA_USERBITS << 1)
>  #define XE_VMA_ATOMIC_PTE_BIT	(DRM_GPUVA_USERBITS << 2)
> @@ -361,6 +371,10 @@ struct xe_vma_ops {
>  	u32 num_syncs;
>  	/** @pt_update_ops: page table update operations */
>  	struct xe_vm_pgtable_update_ops pt_update_ops[XE_MAX_TILES_PER_DEVICE];
> +#ifdef TEST_VM_OPS_ERROR
> +	/** @inject_error: inject error to test error handling */
> +	bool inject_error;
> +#endif
>  };
> =20
>  #endif
> --=20
> 2.34.1
>=20
>=20

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35810C3601E
	for <intel-xe@archiver.kernel.org>; Thu, 10 Apr 2025 17:52:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED07410E379;
	Thu, 10 Apr 2025 17:52:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k8Omey7G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB56210E379
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Apr 2025 17:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744307533; x=1775843533;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gSRO7h5AfnyxaGVh3gqYwRWuFkNJ+6xUL5t5g7BxlvQ=;
 b=k8Omey7GLV6vhNL2QykRdu0XOiR0ZFnavmvFd0cVa/G+ovc828UiZfBN
 Jzd+vwWPqFKF24OPWTqW0z1c+bZGx/qoIlsn+2Ky+TWx30rtda+IW33LU
 GrNA6TBJ/RMkzmDBXW0GuHzAJ9+axFmfIW7g0vlzaPYFOGa6le06Y4fN1
 /q/uInljqC1EI92Mfbq952tlBGkr5I0Ob31jYY/kxBOVWniXBBLR7SQvl
 5iGjOrS2qm6o53Pnv2vSqlxcZyH0t7NZbeBulzF97jVTW9bZLVs9AmzLs
 F5feouRr/hYDw37r4XpEBmMww4+rqy97/S+YLZIjjjHAL6uQd7ndQ81L2 Q==;
X-CSE-ConnectionGUID: Xo2SuDphTl2t5msO4VTjRA==
X-CSE-MsgGUID: pmvKTY0hQN+RyL8cEtUTlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="49499299"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="49499299"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 10:52:13 -0700
X-CSE-ConnectionGUID: gGs8XYW3Sh+LE5T2zcfw4w==
X-CSE-MsgGUID: i5reC8r6SFWr0y7FVhUNQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="133083818"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 10:52:12 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 10 Apr 2025 10:52:11 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 10 Apr 2025 10:52:11 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 10 Apr 2025 10:52:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gc77sxqlIheGAob+gfK6UswKLtRhow3U1YKqXBINGVlMxofWsgLEEzvcuFG5P8RKg72PL08RlBkMg64p9A+vcBvMSvVdQMdjqv72SMzBStNKbm35zBlQsHdR/oa632gr9Wm3gPGQPjhma/PWLJ8xE3JvXaS1r04rh3U8dksSw9z6WwUrmCGPb3Cebi0YJiGNClqXApMTZRUfnXmodJ/+bSaZ+keYP8GA6lWSJcTmV2TspKZrBpx8xhNSXokYpcytE9972mnScPlupqNsMLEnlxrvFOD7++T9UiMXj9s8m40sK6cG6N6x2R4B9u1AwXZD3N8foTagn1pH14kINUWqGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xrXyICqBQ3o4i+hBSeugTA6Wl/NTHLXrDH7UQfdovJg=;
 b=Lh5qAWRjA80Ebk/lSDfj0IKlto4Mbp1DXbIF5zCTdAzSDK6wPxCNGkalpHw93mABx4RLSWAnuJ3xmqu/P+auyl6Cd0N844hFvrWfa1EtlKqHviu/cpP6FLqkPspurA8hb0jYmVLOD1PMLm7ZjO1V903mufagvCMrkoKWN2wegQDsHYDmXFjGzridZFuCAtxrnfdm4gq1ZXsTL9v+l5AR6S5D45eArpxkx0jKX1tKY/CKc95bGjIjy1Nu/QVWXB4Z9S0QxEKMpME+lpiVgU4pDGCeGA+xsiqkjeeh4QP1O/fZHaAhgCUYRliAtwJ3m2n120GtQivG7Ypao4SoOGFGBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DM4PR11MB6215.namprd11.prod.outlook.com (2603:10b6:8:a9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Thu, 10 Apr
 2025 17:52:07 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 17:52:07 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v3 3/4] drm/xe/guc: Add GuC log LFD format support
Thread-Topic: [PATCH v3 3/4] drm/xe/guc: Add GuC log LFD format support
Thread-Index: AQHbqjGdlwf3KfXuA0ihN4c3QJLsD7OdKvkw
Date: Thu, 10 Apr 2025 17:52:07 +0000
Message-ID: <CH0PR11MB544467F69F17C2632B767C90E5B72@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250410155853.574830-1-zhanjun.dong@intel.com>
 <20250410155853.574830-4-zhanjun.dong@intel.com>
In-Reply-To: <20250410155853.574830-4-zhanjun.dong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DM4PR11MB6215:EE_
x-ms-office365-filtering-correlation-id: f4c9aafc-227c-4d2d-087e-08dd78586935
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?sTX0yx6jF2ytFJETPNnPVChhxbaJ7DN4TzUBlN3pERTvzlpW0UxExhsFM2Ao?=
 =?us-ascii?Q?5vpB1URJQlTt7aGW9TI862DT3jhsZZUh6jVlpPGJcE99LTgB+Od6EcTNabze?=
 =?us-ascii?Q?BIg2oVN5a4kidcmCDw+fpLPSMVBiM5fWGn54iKnmakNGC8P6WUaporOSyqOU?=
 =?us-ascii?Q?WeenwcZXPnck6MxVlgTI1TdivbuaS42NIgdAhcsWQSjbEQB/NmBpFUBDG49t?=
 =?us-ascii?Q?ISdZ/BfZYVe+Q+PORbwZoOeamrZy72chCKcBBGeq4kjdgLOh1RaUkoDA+G7X?=
 =?us-ascii?Q?LY9u1iCOoajLd+VR7WPh5e9oXKYyCj4qNZdmc0IMO0WoeDSllMq31W/Zmnc9?=
 =?us-ascii?Q?bXxSVPE2GkP0gvpUfrr+a/psznlo+HfKTR8DpJ0jhnj0QTN4010gK9k+/x59?=
 =?us-ascii?Q?iBVMCxJn1/aMGFMiUDpqer31hiLLSv7+oxZQE++Iv2whgttPDl+wDIjXYd0m?=
 =?us-ascii?Q?JknJgNwZVy3DmcpsXSHs5fZotp6MlXtfNZ/ONcsnikWJ6hCEg5/vuSLVIiTU?=
 =?us-ascii?Q?CofEO9VddwQ4/Wxrg39SQ5RJRviOxy/079UeVVkkrxZJnwAk/D1VKwQbt50l?=
 =?us-ascii?Q?6Nwmng75ZFuSQfBCOscbalOOBGDiU3M92j/bLk+zRIP25CFv4XZTlFV/wYjJ?=
 =?us-ascii?Q?3XaH8rniMI4wZkfX4k1l3eJGvNcdBJNyd/R7VAjG3P+tS+ImP+dk+Ue9rV5r?=
 =?us-ascii?Q?IMG26p38rmZwtgo+Ab7uNDh58M6y51LrUIAa5Q8scTmaAqSpdeJ40w0cyQs+?=
 =?us-ascii?Q?XHYoupLEGFl3mxalmLg5CpS4kb47qyPNJ95y18dogTWsqWemOn5424AB5/cK?=
 =?us-ascii?Q?jq8o/zO4TDDEHRtDwkmMg/ZpLGrwVgC4oUbxngVsATrKR2ioEWVyR75P4CBr?=
 =?us-ascii?Q?fe2RLoRS/dZbb8/tOcgnoTY8RdEuKtm6spCqXwkEdFtGfhNw58DNbLWkgXdT?=
 =?us-ascii?Q?FqSV2GRDQgYyuojYxLzkYmQE6ssRUpHLUmnoKHP3egl3VWG9wKLZ8KaDhdiR?=
 =?us-ascii?Q?4h13mdUNT+4+bp4nymVMkQjyiy2roeD6ey02LgEOYjsHrwU/Ut+ETCJsLe73?=
 =?us-ascii?Q?E4OS+H1BFDwlP8Auk5Og6aAWuVyYKBYDabFMRlpjoRmAL2UAIIxLCWX4Wovb?=
 =?us-ascii?Q?L4xkqOUtw/ZY4lm3xOMFb/mU0Tk914WWxVQsQgSyQ0TGWsipKhVdHEU8EXlb?=
 =?us-ascii?Q?n03beYQxfJB/0pkTrCnF4PURzifSf/J84t9caWOhxFupwCuRM9BsSUGrj7x9?=
 =?us-ascii?Q?5la7mfRD+XG9K4x9McSDIHKstQkhRQtf/d/tA3f5gcXhTrX9Awevkxn+YVPY?=
 =?us-ascii?Q?MgJkp36e15BqI34pdf/Oybu13NvZYcHdeIUaE4ORO41v1Av0aM+KkQMrOSO+?=
 =?us-ascii?Q?JUHBgSrZA+PJDKktZC4csJxkOqSqwheZWG7gp+jYUf7fKEw8Sc6bFTCnzJcz?=
 =?us-ascii?Q?Gsd7tcZg8OwZUvz3dtOL7Jpx98B1vzk3cnxm4htIPPuJER6BEJOeLg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?F2WluuVlNim1GhhR9j116dJ1KfpPNRBv9pLjk4wKNFouR9VoXQM1mAjjlzhE?=
 =?us-ascii?Q?m3GvnOuW3fwpC2L0ftOBjB5l3MnnruSPwAb/k5bAg4lZGBYcYJtycHu8QAtS?=
 =?us-ascii?Q?wVoWbwhLDB3Yo0CUlQtJpas6nyr3bWrMenLI83S/7ld08ccYgo1SCigSuwZy?=
 =?us-ascii?Q?aUzwSUCFt8Z8JFrfYhkJPrsCeR+WNjAu+C+xrUBBZW6vF6pcbblmY3tuMuth?=
 =?us-ascii?Q?ft5dBQfjLOoMsryWPJ3bi/tKmWMzgfsnePaAivcaWepO9Tqnf6KYmhO3i8iU?=
 =?us-ascii?Q?L806WbgWWeLXKZod8s2EK4z3ad6XLptkcPBXBuXwojvMLQLY1Jiu2e3hPBwp?=
 =?us-ascii?Q?PQyTluK/5Cp7HXDpPaqSFYYDv8EGP8B0vnY41ozP5uwtwBCpGBSHLmvXD7Rq?=
 =?us-ascii?Q?4AK5e5fBJ5Sq1MVeATuioydWyeCl4fambJZkVPXLsSm475OhD0HNcy5u51dZ?=
 =?us-ascii?Q?ZrboRXcg5PTt3KN3DO2ZdNDoPs1/5Q50prsgyWYo4VfUffribPxOsb84DrEO?=
 =?us-ascii?Q?FPTYIbZuKq3VJjZdafxF8xAGnh4KWdsHaZJIJRVUqK9Nr+Dr8RMEmJ7YvvfG?=
 =?us-ascii?Q?fxyFjf8X0A04KRcmsTJkYTicno4deXn5uTUWhwewdf1SQT8gPSeODPNLBHv8?=
 =?us-ascii?Q?HyWYLXJxjByBf2ZGKlo4F/2Fu9g+BSvYRjqv21B1UhfqTRJtXPEwAV32Ca/c?=
 =?us-ascii?Q?lB0DvZCl3a96v8Sf78A7GI/lMUgdjIryHpFfoEriUDvUorBUlgXjGs8PGXjr?=
 =?us-ascii?Q?t7bH5+pETHP7wv0iatbYHMX5jB2kmOGL0oXLa89kxLgVMVXXzCfBUsasFdJu?=
 =?us-ascii?Q?IIw8trAP2CPqX60OFK136Iu4CA0xCHpwlxTfQwaSCE0/FCfiLTLErTjizN8C?=
 =?us-ascii?Q?EKIBafnHbrZ+Hi/AFO0wfT3S8NuZavf2Uw4EnR1f8TXsFILfq9WsRUjE671k?=
 =?us-ascii?Q?OKQuMzjJ0dFcjm1VCRQz+udr0tKNk5/i8YmV/KK6e+jUn7dIoC3KAg76nzvE?=
 =?us-ascii?Q?doT9XRBG/8FD50vlYwbziAgAqcCBH3cDZLvtjkkOoh73lGQR8eeObanefqrZ?=
 =?us-ascii?Q?cGECKTtEb7s1JG1i9k1kH/yaIURqHo4WdD7kb/X+60GL37cq5Zy//HjQa/BU?=
 =?us-ascii?Q?9vkToWIrCTAl2CxPSuaqDtLYoDIIXjxDruoScN/L1MtpD49ClNHhjeF3k1Fz?=
 =?us-ascii?Q?RaYf9208rwRejlX0WhxwdiBnwNp7SXffyaFqUky7sXGnNR44mgJxlqleDht3?=
 =?us-ascii?Q?K6Zuxa8hIlq1pmq5v9TCD+zfkHsLLIZ2WUwyo1dfX9kqTKOyr3FriwCnk2RM?=
 =?us-ascii?Q?Ik48gvmB5vjNFnCE+ZUVkxkrirVRnha7YgjH+zSyGcyfm5SyMOT1uCqJ3Miv?=
 =?us-ascii?Q?eLiC/fVCSS/AlpVm6jyHJxFamso4Ptkk/MrdzVB6AJistUwS3ndBluHLx38M?=
 =?us-ascii?Q?cCF0df0Axs4LaGRTfTVzF4YALMZCXNVgic8lB+6fddO6f/oQfDv1L1nQbYzs?=
 =?us-ascii?Q?qbFLNzp3eNcWoQ4OHRUcnaDbnvfJ2WNNMcv0q3EdzbTFFuHOEHJxLQzziwHl?=
 =?us-ascii?Q?HdU71gLgSIVUTOlzpe0LWTHKa0CrxOR8fQKo7/H5?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4c9aafc-227c-4d2d-087e-08dd78586935
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2025 17:52:07.3280 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4IQwKLzMtJt6RJ9n9CeSPwlKbpB3to4C4xbAt1zNkoLZkxPhROyUsHfbfXQBxUQNNfvd4PK/ldpNWmLa5YbfATnJyLLVtiSn+ADSuK2xTfY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6215
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Zhanju=
n Dong
Sent: Thursday, April 10, 2025 8:59 AM
To: intel-xe@lists.freedesktop.org
Cc: Dong, Zhanjun <zhanjun.dong@intel.com>
Subject: [PATCH v3 3/4] drm/xe/guc: Add GuC log LFD format support
>=20
> Add support to output GuC log in LFD format.
>=20
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>

A lot of this admittedly goes a bit over my head, but after reading through
the change log in the cover letter, it doesn't seem like there were any maj=
or
changes necessary in this portion of the code, so I'm going to trust that t=
he
previous reviewers were thorough enough and that this patch is correct.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt
=20
> ---
>  drivers/gpu/drm/xe/xe_guc_log.c | 344 +++++++++++++++++++++++++++++++-
>  1 file changed, 342 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_=
log.c
> index df849a0ee7e5..7cdf6bf238f3 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.c
> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> @@ -7,8 +7,10 @@
> =20
>  #include <linux/fault-inject.h>
> =20
> +#include <linux/utsname.h>
>  #include <drm/drm_managed.h>
> =20
> +#include "abi/guc_log_lfd_abi.h"
>  #include "regs/xe_guc_regs.h"
>  #include "xe_bo.h"
>  #include "xe_devcoredump.h"
> @@ -19,6 +21,57 @@
>  #include "xe_mmio.h"
>  #include "xe_module.h"
> =20
> +static struct guc_log_buffer_entry_markers {
> +	u32 key[2];
> +} const entry_markers[4] =3D {
> +	{{
> +		LFD_LOG_BUFFER_MARKER_1V2,
> +		LFD_LOG_BUFFER_MARKER_2
> +	}},
> +	{{
> +		LFD_LOG_BUFFER_MARKER_1V2,
> +		LFD_CRASH_DUMP_BUFFER_MARKER_2
> +	}},
> +	{{
> +		LFD_STATE_CAPTURE_BUFFER_MARKER_1V2,
> +		LFD_STATE_CAPTURE_BUFFER_MARKER_2
> +	}},
> +	{{
> +		GUC_LOG_INIT_CONFIG_LIC_MAGIC,
> +		((GUC_LOG_INIT_CONFIG_FORMAT_VERSION_MAJOR << 16)
> +			| GUC_LOG_INIT_CONFIG_FORMAT_VERSION_MINOR)
> +	}}
> +};
> +
> +static struct guc_log_buffer_entry_list {
> +	u32 offset;
> +	u32 rd_ptr;
> +	u32 wr_ptr;
> +	u32 buf_size;
> +} entry_list[GUC_LOG_BUFFER_STATE_HEADER_ENTRY_COUNT];
> +
> +static const struct guc_logfile_lfd_t default_guc_logfile_lfd =3D {
> +	.dw0 =3D FIELD_PREP_CONST(GUC_LOGFILE_LFD_T_MAGIC, GUC_LOGFILE_LFD_MAGI=
C)
> +};
> +
> +static const struct guc_logfile_t default_guc_logfile =3D {
> +	.magic =3D LFD_DRIVER_KEY_STREAMING,
> +	.version.dw0 =3D FIELD_PREP_CONST(GUC_LOGFILE_FMT_VER_T_MINOR_VERSION,
> +					GUC_LOG_FILE_FORMAT_VERSION_MINOR) |
> +		       FIELD_PREP_CONST(GUC_LOGFILE_FMT_VER_T_MAJOR_VERSION,
> +					GUC_LOG_FILE_FORMAT_VERSION_MAJOR)
> +};
> +
> +struct guc_log_init_config_save_t {
> +	/*
> +	 * Array of init config KLVs.
> +	 * Range from GUC_LOG_LIC_TYPE_FIRST to
> +	 * GUC_LOG_LIC_TYPE_LAST
> +	 */
> +	u32 KLV[GUC_LOG_LIC_TYPE_LAST - GUC_LOG_LIC_TYPE_FIRST];
> +	struct guc_log_buffer_state log_buf_state;
> +};
> +
>  static struct xe_guc *
>  log_to_guc(struct xe_guc_log *log)
>  {
> @@ -216,21 +269,308 @@ void xe_guc_log_snapshot_print(struct xe_guc_log_s=
napshot *snapshot, struct drm_
>  	}
>  }
> =20
> +static int xe_guc_log_add_lfd_header(char *buf, int buf_size)
> +{
> +	int len;
> +
> +	if (buf_size < sizeof(struct guc_logfile_lfd_t))
> +		return -ENOMEM;
> +
> +	len =3D sizeof(default_guc_logfile_lfd);
> +	memcpy(buf, &default_guc_logfile_lfd, len);
> +
> +	return len;
> +}
> +
> +static int xe_guc_log_add_payload(char *buf, int buf_size, u32 data_len,=
 void *data)
> +{
> +	struct guc_logfile_lfd_t *lfd =3D (struct guc_logfile_lfd_t *)buf;
> +
> +	if (buf_size < sizeof(struct guc_logfile_lfd_t) + data_len)
> +		return -ENOMEM;
> +
> +	/* make length DW aligned */
> +	lfd->desc_dw_size =3D data_len / sizeof(u32);
> +	if (data_len / sizeof(u32))
> +		lfd->desc_dw_size++;
> +
> +	if (lfd->data !=3D data)
> +		memcpy(lfd->data, data, data_len);
> +
> +	return lfd->desc_dw_size * 4;
> +}
> +
> +static int xe_guc_log_add_typed_payload(char *buf, int buf_size, u32 typ=
e,
> +					u32 data_len, void *data)
> +{
> +	int len;
> +	struct guc_logfile_lfd_t *lfd =3D (struct guc_logfile_lfd_t *)buf;
> +
> +	if (buf_size < sizeof(struct guc_logfile_lfd_t) + data_len)
> +		return -ENOMEM;
> +
> +	len =3D xe_guc_log_add_lfd_header(buf, buf_size);
> +	lfd->dw0 |=3D FIELD_PREP(GUC_LOGFILE_LFD_T_DESC_TYPE, type);
> +	len +=3D xe_guc_log_add_payload(buf, buf_size, data_len, data);
> +
> +	return len;
> +}
> +
> +static int xe_guc_log_add_os_id(char *buf, int buf_size, u32 id)
> +{
> +	char *version;
> +	int info_len;
> +	struct guc_logfile_lfd_t *lfd =3D (struct guc_logfile_lfd_t *)buf;
> +	struct guc_lfd_data_os_id_t *os_id =3D (struct guc_lfd_data_os_id_t *)l=
fd->data;
> +
> +	os_id->os_id =3D id;
> +
> +	version =3D init_utsname()->release;
> +	info_len =3D strlen(version) + 1;
> +
> +	if (buf_size < sizeof(struct guc_logfile_lfd_t) + info_len)
> +		return -ENOMEM;
> +
> +	strscpy(os_id->build_version, version, info_len);
> +
> +	return xe_guc_log_add_typed_payload(buf, buf_size, GUC_LFD_TYPE_OS_ID,
> +					   info_len + sizeof(*os_id), os_id);
> +}
> +
> +static int
> +xe_guc_log_add_log_event(char *buf, int buf_size, char *log_bin,
> +			 struct guc_log_init_config_save_t *config)
> +{
> +	int len;
> +	char *data;
> +	u32 data_len;
> +	struct guc_lfd_data_log_events_buf_t *events_buf;
> +	struct guc_logfile_lfd_t *lfd =3D (struct guc_logfile_lfd_t *)buf;
> +	struct guc_log_buffer_entry_list *entry;
> +
> +	entry =3D &entry_list[GUC_LOG_BUFFER_STATE_HEADER_ENTRY_LOG];
> +
> +	/* Skip empty log */
> +	if (entry->rd_ptr =3D=3D entry->wr_ptr)
> +		return 0;
> +
> +	len =3D xe_guc_log_add_lfd_header(buf, buf_size);
> +	if (len < 0)
> +		return len;
> +
> +	buf_size -=3D len;
> +	lfd =3D (struct guc_logfile_lfd_t *)buf;
> +
> +	lfd->dw0 |=3D FIELD_PREP(GUC_LOGFILE_LFD_T_DESC_TYPE, GUC_LFD_TYPE_LOG_=
EVENTS_BUFFER);
> +	events_buf =3D (struct guc_lfd_data_log_events_buf_t *)&lfd->data;
> +	events_buf->log_events_format_version =3D config->log_buf_state.version=
;
> +
> +	data =3D log_bin + entry->offset + entry->rd_ptr;
> +	if (entry->rd_ptr < entry->wr_ptr) {
> +		data_len =3D entry->wr_ptr - entry->rd_ptr;
> +		if (data_len <=3D buf_size) {
> +			memcpy(events_buf->log_format_buf, data, data_len);
> +			buf_size -=3D data_len;
> +		} else {
> +			return -ENOMEM;
> +		}
> +	} else {
> +		int cp_len;
> +
> +		/* Copy rd to buf end 1st */
> +		data_len =3D entry->buf_size - entry->rd_ptr;
> +		if (data_len <=3D buf_size) {
> +			memcpy(events_buf->log_format_buf, data, data_len);
> +			buf_size -=3D data_len;
> +		} else {
> +			return -ENOMEM;
> +		}
> +
> +		/* Copy buf start to wr */
> +		data =3D &log_bin[entry->offset];
> +		cp_len =3D entry->wr_ptr;
> +		if (cp_len <=3D buf_size - cp_len)
> +			memcpy(&events_buf->log_format_buf[data_len / sizeof(u32)], data, cp_=
len);
> +		else
> +			return -ENOMEM;
> +		data_len +=3D cp_len;
> +	}
> +
> +	/* make length DW aligned */
> +	lfd->desc_dw_size =3D data_len / sizeof(u32);
> +	if (data_len % sizeof(u32))
> +		lfd->desc_dw_size++;
> +
> +	/* Addup log_events_format_version size */
> +	lfd->desc_dw_size++;
> +
> +	return len + lfd->desc_dw_size * sizeof(u32);
> +}
> +
> +static inline int lic_type_to_KLV_index(u32 lic_type)
> +{
> +	XE_WARN_ON(lic_type < GUC_LOG_LIC_TYPE_FIRST || lic_type >=3D GUC_LOG_L=
IC_TYPE_LAST);
> +
> +	return lic_type - GUC_LOG_LIC_TYPE_FIRST;
> +}
> +
> +static int xe_guc_log_add_klv(char *buf, int size, u32 lic_type,
> +			      struct guc_log_init_config_save_t *config)
> +{
> +	/* LFD type must matches LIC type */
> +	BUILD_BUG_ON((int)GUC_LFD_TYPE_FW_VERSION !=3D (int)GUC_LOG_LIC_TYPE_GU=
C_SW_VERSION);
> +	BUILD_BUG_ON((int)GUC_LFD_TYPE_GUC_DEVICE_ID !=3D (int)GUC_LOG_LIC_TYPE=
_GUC_DEVICE_ID);
> +	BUILD_BUG_ON((int)GUC_LFD_TYPE_TSC_FREQUENCY !=3D (int)GUC_LOG_LIC_TYPE=
_TSC_FREQUENCY);
> +	BUILD_BUG_ON((int)GUC_LFD_TYPE_GMD_ID !=3D (int)GUC_LOG_LIC_TYPE_GMD_ID=
);
> +	BUILD_BUG_ON((int)GUC_LFD_TYPE_BUILD_PLATFORM_ID !=3D
> +		     (int)GUC_LOG_LIC_TYPE_BUILD_PLATFORM_ID);
> +
> +	return xe_guc_log_add_typed_payload(buf, size, lic_type, sizeof(u32),
> +				 &config->KLV[lic_type_to_KLV_index(lic_type)]);
> +}
> +
> +static void xe_guc_log_loop_log_init(struct guc_log_init_config_t *init,
> +				     struct guc_log_init_config_save_t *config)
> +{
> +	int i;
> +	struct guc_klv_generic_t *p =3D (struct guc_klv_generic_t *)init->lic_d=
ata;
> +
> +	for (i =3D 0; i < init->lic_dw_size;) {
> +		if (p->key < GUC_LOG_LIC_TYPE_GUC_SW_VERSION || p->key >=3D GUC_LOG_LI=
C_TYPE_LAST)
> +			break;
> +		config->KLV[lic_type_to_KLV_index(p->key)] =3D p->value[0];
> +		i +=3D p->length + 1; /* +1DW to include kev(u16) and len(u16) */
> +		p =3D (struct guc_klv_generic_t *)((u32 *)p + p->length + 1);
> +	}
> +}
> +
> +static void xe_guc_log_load_log_buffer(u32 *guc_log, struct guc_log_init=
_config_save_t *config)
> +{
> +	int i =3D 0;
> +	u32 offset =3D GUC_LOG_BUFFER_STATE_HEADER_LENGTH;
> +	struct guc_log_buffer_state *p =3D (struct guc_log_buffer_state *)guc_l=
og;
> +
> +	memset(entry_list, 0, sizeof(entry_list));
> +	while (p) {
> +		for (i =3D 0; i < GUC_LOG_BUFFER_STATE_HEADER_ENTRY_COUNT; i++) {
> +			if (p->marker[0] =3D=3D entry_markers[i].key[0] &&
> +			    p->marker[1] =3D=3D entry_markers[i].key[1]) {
> +				entry_list[i].offset =3D offset;
> +				entry_list[i].rd_ptr =3D p->read_ptr;
> +				entry_list[i].wr_ptr =3D p->write_ptr;
> +				entry_list[i].buf_size =3D p->size;
> +
> +				if (i =3D=3D GUC_LOG_BUFFER_STATE_HEADER_ENTRY_LOG)
> +					config->log_buf_state =3D *p;
> +
> +				if (i !=3D GUC_LOG_BUFFER_STATE_HEADER_ENTRY_INIT) {
> +					offset +=3D p->size;
> +					p++;
> +				} else {
> +					/* Load log init config */
> +					xe_guc_log_loop_log_init((struct guc_log_init_config_t *)p,
> +								 config);
> +
> +					/* Init config is the last */
> +					return;
> +				}
> +			}
> +		}
> +		if (i >=3D GUC_LOG_BUFFER_STATE_HEADER_ENTRY_COUNT)
> +			break;
> +	}
> +}
> +
> +static int xe_guc_log_save_to_lfd_buf(char *buf, int size, u32 *guc_log_=
bin,
> +				      struct xe_guc_log *log,
> +				      struct guc_log_init_config_save_t *config)
> +{
> +	int index =3D 0, len =3D 0;
> +	char *char_bin =3D (char *)guc_log_bin;
> +	struct guc_logfile_t *guc_logfile;
> +
> +	if (size < sizeof(struct guc_logfile_t))
> +		return -ENOMEM;
> +
> +	guc_logfile =3D (struct guc_logfile_t *)buf;
> +	*guc_logfile =3D default_guc_logfile;
> +	index =3D offsetof(struct guc_logfile_t, lfd_stream);
> +
> +	len =3D xe_guc_log_add_klv(&buf[index], size - index, GUC_LFD_TYPE_FW_V=
ERSION, config);
> +	if (len < 0)
> +		return len;
> +	index +=3D len;
> +
> +	len =3D xe_guc_log_add_klv(&buf[index], size - index, GUC_LFD_TYPE_GUC_=
DEVICE_ID, config);
> +	if (len < 0)
> +		return len;
> +	index +=3D len;
> +
> +	len =3D xe_guc_log_add_klv(&buf[index], size - index, GUC_LFD_TYPE_TSC_=
FREQUENCY, config);
> +	if (len < 0)
> +		return len;
> +	index +=3D len;
> +
> +	len =3D xe_guc_log_add_klv(&buf[index], size - index, GUC_LOG_LIC_TYPE_=
GMD_ID, config);
> +	if (len < 0)
> +		return len;
> +	index +=3D len;
> +
> +	len =3D xe_guc_log_add_klv(&buf[index], size - index, GUC_LOG_LIC_TYPE_=
BUILD_PLATFORM_ID,
> +				 config);
> +	if (len < 0)
> +		return len;
> +	index +=3D len;
> +
> +	len =3D xe_guc_log_add_os_id(&buf[index], size - index, GUC_LFD_OS_TYPE=
_OSID_LIN);
> +	if (len < 0)
> +		return len;
> +	index +=3D len;
> +
> +	len =3D xe_guc_log_add_log_event(&buf[index], size - index, char_bin, c=
onfig);
> +	if (len < 0)
> +		return len;
> +	index +=3D len;
> +
> +	return index;
> +}
> +
>  static void
>  xe_guc_log_snapshot_print_lfd(struct xe_guc_log_snapshot *snapshot, stru=
ct drm_printer *p,
>  			      struct xe_guc_log *log)
>  {
>  	size_t remain;
>  	int i;
> +	struct guc_log_init_config_save_t init_config;
> =20
>  	if (!snapshot)
>  		return;
> =20
>  	remain =3D snapshot->size;
> +	if (!remain)
> +		return;
> +
> +	drm_printf(p, "Kernel timestamp: 0x%08llX [%llu]\n", snapshot->ktime, s=
napshot->ktime);
> +	drm_printf(p, "GuC timestamp: 0x%08llX [%llu]\n", snapshot->stamp, snap=
shot->stamp);
> +	drm_printf(p, "Log level: %u\n", snapshot->level);
> +
>  	for (i =3D 0; i < snapshot->num_chunks; i++) {
> +		int len =3D 0;
>  		size_t size =3D min(GUC_LOG_CHUNK_SIZE, remain);
> -
> -		/* To be add: Output snapshot in LFD format */
> +		const char *prefix =3D i ? NULL : "[LOG].data";
> +		char suffix =3D i =3D=3D snapshot->num_chunks - 1 ? '\n' : 0;
> +		char *lfd_buf =3D kzalloc(size, GFP_KERNEL);
> +
> +		/* load from log bin */
> +		xe_guc_log_load_log_buffer(snapshot->copy[i], &init_config);
> +		/* Output to LFD format */
> +		len =3D xe_guc_log_save_to_lfd_buf(lfd_buf, size, snapshot->copy[i], l=
og,
> +						 &init_config);
> +		if (len > 0)
> +			xe_print_blob_ascii85(p, prefix, suffix, lfd_buf, 0, (size_t)len);
> +
> +		kfree(lfd_buf);
> +		XE_WARN_ON(len <=3D 0);
> =20
>  		remain -=3D size;
>  	}
> --=20
> 2.34.1
>=20
>=20

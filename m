Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1331C61DFD
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 03:27:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60BAA10E372;
	Tue,  1 Sep 2026 03:27:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LedWWfdl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C745110E372;
 Tue,  1 Sep 2026 03:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788233220; x=1819769220;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CqQeZj4+wXrqqL4mMP5oanOCxtRKuu8tZ4cueT7frfk=;
 b=LedWWfdl52dtL8k6mCwy4I+G+RYwO7Vn8UTK5Meli9ykUbqhx4vdEAxQ
 PGygdXPAZqW0vDtKtkOmHYQb3U2Xw6/TnSGf0oFB1Sevdy0bk9jMBuDmH
 pwTOGJv6mJkAbv8+AHds4g8irp8Y9x76LIBlZb4pXiApRLXHMnrwNDnmP
 B0gJ4qbwB54MpWlrvLsJoNuTGlG3Qxej+YFXmYM6QDhALVvnkiEb6UYUA
 g+LlIBpz0PRhy+V/YN4yQ4NQhGOpWQLVwsJv/BRFKSQszry95bvcoY0Ei
 OI7k8D39I86nBbhZs02syjO44NxFKPRLWok/xTgZGm+cX+Dc0Cjn1928M w==;
X-CSE-ConnectionGUID: bNJqcCz4QraI3Dar3427Ww==
X-CSE-MsgGUID: AUTysRdHTieYC6BWNckGSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="92517466"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="92517466"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 20:26:59 -0700
X-CSE-ConnectionGUID: weg4Ej58RFWEqCH8Xk5ayw==
X-CSE-MsgGUID: HI3jvit6RS2KNXHRw/QmwQ==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 20:26:59 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 20:26:58 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 31 Aug 2026 20:26:58 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.50) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 20:26:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iq45GnenLoDrozZdOgLdolut+RQpCb7JxsB3/7jX6XF5354oj1Lrq/DFlpvRhKto/JNJutjdjxNn3tKqTLf73C7XA4SuPwqItZlVc8MM9cHzOXZOmRvRbqY46fCxuY0iNwu1HJ2UpeEHe6cJq+kuFo4Q4cCoD/qFREfL7icg3cXwHjtB8FqcawLgAYq2hqkn2mj/R+qrDLkt39u7Q/AefxHQCqriGY/We41OmHLuGqGlZ0JScTRIJwgrVnDrbFM+N+JK+S6qe0OnDKCRHP/kJ9blmTjG14KZYCtQbEVSCUpWCt305HOOmBhg+gtxx9iBvQ94B9uvCibveLZXmKqJ8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Ht6AzxpOaPK4vnEuwsAtWj1Wq6IzjbhByQ6yB+B5G0=;
 b=UJrElC+vqid5dzICr+ZAMplqKLysxxPBdX+OLR4GAnKbngzDGxX1sleXJwJsVTghHBzDpMNa5KNZkXE/9qYqsquUFgs5ObbzVuUMFIYuRRq9KBbu/tylkz5VFC1j0KV+ts2/e4HitnCs4lYFA65eTh69dbKcBXgYyUFlZy/mgV08tCZ+llcEO+YC8Cn6QmP1P0YiarPox7UaC9RxUrF5/INQYLj/X6ZAwuUMNP9+ahq4mIsUdB527gIYww6NYU9+Ekt+iuTyww+X9Uvq8XAUofB9F6nyUKFH6/sxB8/1cbfE7UGImOsUcf0u/SRBQnnMqUzquoM/HvsPHFFTC5JzIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by CH3PR11MB7676.namprd11.prod.outlook.com
 (2603:10b6:610:127::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 03:26:53 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 03:26:53 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Murthy, 
 Arun R" <arun.r.murthy@intel.com>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>, "Nautiyal, Ankit K"
 <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH v4 08/12] drm/i915/display: Add HAS_COMMON_SDP_TL macro
Thread-Topic: [PATCH v4 08/12] drm/i915/display: Add HAS_COMMON_SDP_TL macro
Thread-Index: AQHc+XcmIO211MASPk6rlK7hMcf73ra5kFKA
Date: Tue, 1 Sep 2026 03:26:53 +0000
Message-ID: <DS4PPFE901A304FB6C120DD5DD887C95B74E3A82@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260611073316.1439306-1-ankit.k.nautiyal@intel.com>
 <20260611073316.1439306-9-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260611073316.1439306-9-ankit.k.nautiyal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|CH3PR11MB7676:EE_
x-ms-office365-filtering-correlation-id: dd3d60ea-8ba7-489f-9c5c-08df07d8de56
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|56012099006|38070700021|10067099003|11063799006|4143699003;
x-microsoft-antispam-message-info: 0jdVFrihZmiXdczASODkW/nFj9X3qzqGK3FdDgdPFkMi/47UnMPQUdItVWSPKS/gdpglBPb2e1wpwFohf6C6qJXGkFZKaYO/CDemsLnnMcujeNkjR5yFlgzZtWduMoBdWXThysBccs+yn2xPzy2bUr29+FTRLru5rhgfYoBs8bQhY7dc8PUjN8t+PCWg8CSdjxZ6wLS1yN/8a9m4z8o10LXHPqk1xhotHTGxXc4lyqNOxq5XElTpKDv3P+DrwF+ya4f3iOKA/l21rKBO3ur+ZVWpea+l8e9a3W+Ig4Z8IWCww8NFvm8zndAuYV5tgjELaeBWD2UnowtNUaGGYnoF2sSc2QdZOxpo/74BvNES9rC9mPRjNX5SCjnJo2aiO1MQErnRRZxm/Ayj0tEaYAg0+t7ub2e6A0CKU9rGi7q7VvIe6yxS15C1+s0Ewki7HKUpY/B4atjFp8zVcN0iOI/gXiyK25Tn8/qJwpD2HX50d9A7qlGPMnuMTYV+FtDHUJzkXNYpwhP9NI6swzqnFQUhm1d1vUJlpBL1+GGMDWsMf7L8JOnYQdPeZ7+C7WKNFK5232dmKA89dl/t9X3mgYcx6gWcOFJUb5fEnbk8un818N1xju4q44xdmvuZZ15xEH8Xy9nCcOp64W3jTRg64HLIctyl34kSy5UOoj65kWcz07E+LLQpvtumlK8/CDNRKtu7yt3bW57R+KMSGfx4K3rNfBfDYqJ7nozljO4Dbvu2XBs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(38070700021)(10067099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QyWtSVMU199TGE030Ei0tcv3irLE97OYgyhzwciMGDpdJM8wD4Oy4iEJAU/O?=
 =?us-ascii?Q?4NmAQuD9bE2I5dZAN0Iljzqjo+eovZZ1v1lpgRCq/LraszUjDHw5rEvAN+AV?=
 =?us-ascii?Q?bI540oxwFru2kDj6Ii51lIoHFG5zsDFVIprcaiK3/h6+p3ybxGOrR3XWxmJx?=
 =?us-ascii?Q?TskLyyXBim7Y5mIYmUbYZsu7U32rd0Df9j80IXHopbS+999KaS16YVpTdVFA?=
 =?us-ascii?Q?ZGNT/IM6D4c/y43yfUpJT0KneXmhPo7KLF5lrD/D60rVPJbY5b9jlkHb4jE6?=
 =?us-ascii?Q?Bok+y0TSWwwXwthQSgK4trcEsI3HmKwChw9EaLQWXvcNG706HqfUNcVYYvyF?=
 =?us-ascii?Q?oEuBBpocOjtkUkrgFuKr7TxwMG29H6Tp8Q5w/KChehO27F6a/SAzmb0Qk0TE?=
 =?us-ascii?Q?ekB0XZCANjoNZSsAGc+lr3nf2CH057IgyqD+pBXL0+EUpa1U1BCKJUjpKAOR?=
 =?us-ascii?Q?bB9bF5TmmKA7V7KZeB+MP/XBF9LBBEwE0FRz/+DPvmPQ5x3blKNrru9uDAfa?=
 =?us-ascii?Q?6Dl3T798PqWaBpiDUqk7cxFVjsJxbR2vdtDy42FyiIB0Us0ySXD/CBjiNhWS?=
 =?us-ascii?Q?U7UOYj+5eSlqIZ6VfELOMU12VNoKAYF+MQlcGDviUHuemXf/1mVHiCCwI38H?=
 =?us-ascii?Q?/AIrB6+zI/WdWpz85XcGYqXM+4KNfyXttq8cEnEQ4yMRACbApxX8GgLGwSJQ?=
 =?us-ascii?Q?bb/qSfI0Qu3PLzYu/DuN/sOTQ8Bv9qKrhgpqQlkv4lz5Oi60+0AEwhiNUUBy?=
 =?us-ascii?Q?IUpI6J6BJRRKLwvZ6PAiyR6Nhxn3axVt9KcmLI3f+UHUrWFb2J33vKbqPYdD?=
 =?us-ascii?Q?BEWJPbEkLMCB4DG/P8GBr0x0jXBYwhz3nsstX82QE/DvvcziyeOWlaa+Xbci?=
 =?us-ascii?Q?8EiE1NB22yp9NQNxUnzPHnZSyaaq6IrMzQe3h2GrTCMSn5jZuFcwpG6W1mbZ?=
 =?us-ascii?Q?qlx+DzXLvQ6/PSsPBBCnvgXXrpoylqPNjmhnLgQ7lWT+2xm09nHQPT88mxUA?=
 =?us-ascii?Q?Fy7Nw2Sq+FdTBLLSAuZ0eIFdVwJrJBqP5uMgzXraHXzTwrfjDa2eWSn/0qwS?=
 =?us-ascii?Q?M/ZXzM9TqmoqPjGGRKY8cHs9tXDJuoRIzbIO9nkdrw1sccqNvWq+rRqcIKDE?=
 =?us-ascii?Q?UGTLWUayqJ/cQu6tgC+B7cIVj5HB4FRTphthcuywFf4MdOJU6ZBBzP5dizzz?=
 =?us-ascii?Q?tKO2GefvtCC1+a9Tnb3fqviiZUwswNgMqGXLiC3z69vsThzvKnuixmTSxzqo?=
 =?us-ascii?Q?zRHjps1Xajy2Qj9v6jrniuD7qWsJXa/lOQOZyGKNShv2OONPD+I7l9kTZQ7N?=
 =?us-ascii?Q?bk0Vbc2q9vZiIlU14JgYOf6oo29TNnMDeCuiMzuJdIWgzb2aYa/6e/foAPQD?=
 =?us-ascii?Q?r1LOGN1iJFXA3Hnj1If+7KxbENzzIzRQjTh6zkA/Hw/HXgUjCu03HULaASwp?=
 =?us-ascii?Q?LDzlLRVbwC9M+jrT5ksB+MB23cVcVsZA6k5O3C+CTVM3kJaLYx+4YgwfIej7?=
 =?us-ascii?Q?EK6dFZjfCaJoiENxwFiN1jPJ9/+BUQ+lfxKJ41KXaW0zmgZh5E9JOaEngbIA?=
 =?us-ascii?Q?e+Vrv26STwtB+81dcc+IFAi3Lntg9asbuPmbnfwHZuBMDQuLpweYjEvuUMEe?=
 =?us-ascii?Q?vtFNlEsM06/ogvwWjMOhLoiFDQafRMMEHkxrSgknjUEdiHyPb6ut5rH6v/u9?=
 =?us-ascii?Q?JxgJttCsZshaEVgNLRXA2a/cKnucBhYRuRMvMQs0iY8esiSANnfmP5K2Y1+0?=
 =?us-ascii?Q?x7gc2Gwx7A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: u7wxKaH/614NpuNrb/gM1P/Spq9rle6Xho8gIOC7l9sL6/QvjOXKuXTUCYlcXLuf3jJdgQg2mZLsU775Ce+K6adO6gpZKgrZF10A6RV5YdUiXZcyaJ7lgkmx4+lv/D6htjuvgVCh/920hvOGIp3dWNJ7SyCM5T9ipaLda9I8JbJYSRnd2J/lStGflL8H4WEnEY3ih6rp3MxyGFSqa6lKa/PqsnQcSH0xK7DxTwlYiJMaxdbO8hOvLYw4Z5F/D605riYoEDSmFjVyC+V2cQt0Y8BICSAAx9+Vi/cabxUFgqIQcA7wK89s09guL2hVhMrAy8zhwKiysBlR45R+SnsNDQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd3d60ea-8ba7-489f-9c5c-08df07d8de56
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2026 03:26:53.4061 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SQpywuq3UWpaS04ONB1TZV5IY0IF8wToivFAnECCwKoKUen7f9CUvk2LPHqDcaQKqK8OAiLSE9vmBixkIc32WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7676
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

> Subject: [PATCH v4 08/12] drm/i915/display: Add HAS_COMMON_SDP_TL
> macro
>=20

Maybe drm/i915/dip

Otherwise LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> Add a helper macro to detect CMN SDP TL support on platforms with display
> version 35 and above.
>=20
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dip.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dip.h
> b/drivers/gpu/drm/i915/display/intel_dip.h
> index 600dabbf7372..e9959356226e 100644
> --- a/drivers/gpu/drm/i915/display/intel_dip.h
> +++ b/drivers/gpu/drm/i915/display/intel_dip.h
> @@ -32,6 +32,16 @@ struct intel_crtc_state;
>  #define HAS_EMP_AS_SDP_TL(__display)	(DISPLAY_VERx100(__display)
> =3D=3D 1401 || \
>  					 DISPLAY_VER(__display) >=3D 20)
>=20
> +/*
> + * CMN SDP TL: Common Secondary Data Packet Transmission Line.
> + *
> + * Xe3p_lpd introduces new register CMN_SDP_TL to program a common SDP
> + * Transmission line that will be used by the Hardware to position the
> + * SDPs. Along with this, another new register CMN_SDP_TL_STGR_CTL is
> + * also added to stagger the different SDPs.
> + */
> +#define HAS_COMMON_SDP_TL(__display)      (DISPLAY_VER(__display) >=3D 3=
5)
> +
>  u16 intel_dip_read_emp_as_sdp_tl(const struct intel_crtc_state *crtc_sta=
te);
> void intel_dip_write_emp_as_sdp_tl(const struct intel_crtc_state *crtc_st=
ate);
>=20
> --
> 2.45.2


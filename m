Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D893AC5B56A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 12:53:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B0E789919;
	Wed, 12 Aug 2026 12:53:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X5tarC57";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85BFD89919
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 12:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786539186; x=1818075186;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qJOzukb05m0YGFDk/MwM2nV26+VTlA2EIaovQgpgMiI=;
 b=X5tarC57BfSJwOoQWsl0WRCVa3gg1voQ8MSSupPplvwMmc8qxr/zJkl8
 f+QR4aX8FLeDgwoC3SVqcCdcCEl8XaLeyexDUNn09wLGwTVoHmxrRRC0i
 /dclfN3obYTJF5jurf/wX3EhdLi59IwyIZEhFfOOPzHPRKtlOqTdArOiS
 y3tp5Y2Vq7IcxqpbPPJ7L+KSozzl4iAZ7oZJNVf288QHCc5SuVDtZue8e
 RCkJlNS1IcmBZwI7KdncJkHIYuVxbgUhKcgZLQW0jZsmfz/xZfxsfYUx/
 2ykfyvg6za0Z4QjCekYek5W+AvC2ttXGu1osZnR+G7Tkxt7FU6ENVXq1m w==;
X-CSE-ConnectionGUID: vIE2RJLeSZ2VQIFDYIHKgw==
X-CSE-MsgGUID: Bw+bciCuQv28XJ41qTsYHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="104476104"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="104476104"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 05:53:05 -0700
X-CSE-ConnectionGUID: 8jt0H+8jRnuqfRwg4h070g==
X-CSE-MsgGUID: hQrKp8hNTnmlka2YFRyzgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="288393951"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 05:53:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 05:53:04 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 12 Aug 2026 05:53:04 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.46)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 05:53:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RlTaPpovg3H0oETwabtmGwUfMYDCI+f9zXTbT5WXVMAzq88ZDRe/sHpPJyFZV0/ifZzuOmsNpVpavsxUrgtOk3+XR5VOPC5fPj3p3Vc8YF/ATyA3q/Fub0XTAfzqGS9IAA0bvVPNHDJIVFmoJKhNnFHIuvUDiCCeVn+7AWTAySG3iK83bE0fHrL2N3xMuAyXMhMEOU7VtxHqyiwItBxumv9MXGvpWjTD7lviNboednG0Lhpex0r5OZSa9/r2yy/ASZuPJW9ZRRLPVPT2WnsvbQ1MeyuGRF9/+pd33yL/VwGdlNBsnhAekygx218tGBLSpvjLLZbbIoEMTjF9+zDaOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kp8usol6iAKiyXlUFTZKYaJFGuFUHVEwY62YdAAV1Fc=;
 b=oLBa6TeM/veAopSkkCiWDx5woPItxfajmHkl7vNQbF37Z5vk/Im5HL4Wc3fw5M3W5ExXj5A9O84NFGuUv6S2diJhMjnxfQg6fTJJ6FYUSGpbE4Z+/xWmc66IeO3F14AP6nC+HVt98a1xdudDNjrPzGcWO0SnkIA6WUO5y9anFWAKOWyQqALfB+lH9wSzaEho3PebYzv2hPsNV59YnlFDPdRehpJZwE5XyF4n/7W6zGRMg0QB5C2/r9ICiPelvbn9lwzw23c2OUYgnKMjv7h5TnfdakKmIZRDFpWntOcApNNCGk8AfGNNC7lh2r9Hh6g8WBcpsfe7N+eaaLzCdcgQJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5413.namprd11.prod.outlook.com (2603:10b6:208:30b::16)
 by CY5PR11MB6185.namprd11.prod.outlook.com (2603:10b6:930:27::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Wed, 12 Aug
 2026 12:53:01 +0000
Received: from BL1PR11MB5413.namprd11.prod.outlook.com
 ([fe80::9a26:cff1:9b8a:3811]) by BL1PR11MB5413.namprd11.prod.outlook.com
 ([fe80::9a26:cff1:9b8a:3811%4]) with mapi id 15.21.0315.008; Wed, 12 Aug 2026
 12:53:01 +0000
From: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
To: "Koujalagi, Mallesh" <mallesh.koujalagi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "Brost, Matthew" <matthew.brost@intel.com>
CC: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>,
 "Tauro, Riana" <riana.tauro@intel.com>, "Poosa, Karthik"
 <karthik.poosa@intel.com>, "Anirban, Sk" <sk.anirban@intel.com>, "Jadav,
 Raag" <raag.jadav@intel.com>, "Wajdeczko, Michal"
 <michal.wajdeczko@intel.com>, "aravind.iddamsetty@linux.intel.com"
 <aravind.iddamsetty@linux.intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "Kalvala, Haridhar"
 <haridhar.kalvala@intel.com>
Subject: RE: [PATCH v2 2/3] drm/xe/pcode: Improve PCODE logging using xe_log
 helper
Thread-Topic: [PATCH v2 2/3] drm/xe/pcode: Improve PCODE logging using xe_log
 helper
Thread-Index: AQHdKlcIu3PvMAAe80+CdaigOezMQ7aaXZFw
Date: Wed, 12 Aug 2026 12:53:01 +0000
Message-ID: <BL1PR11MB5413209646E3B55EC26A146FE2DC2@BL1PR11MB5413.namprd11.prod.outlook.com>
References: <20260812123449.239480-5-mallesh.koujalagi@intel.com>
 <20260812123449.239480-7-mallesh.koujalagi@intel.com>
In-Reply-To: <20260812123449.239480-7-mallesh.koujalagi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5413:EE_|CY5PR11MB6185:EE_
x-ms-office365-filtering-correlation-id: 78496dfe-bd26-4242-c2ca-08def870a467
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|10067099003|38070700021|56012099006|11063799006|4143699003|22082099003|18002099003|6133799003;
x-microsoft-antispam-message-info: KFK8E1sQstVlF4Byb+e9zYY4cmGBBRdVxFw6AzwR87NPO+MNlxFT1C94831qVh2+ygtNw6CVCm473ULBF5eyq5ootubDv54JSBX2zn+k15eJDUhfxdg9sU5RfRt0KlnWeUg+zFVBmHfoIHAAjAuw3eB1m9qoShfdcM+AsKrlox06PQzvCz8zSoYoQp2aKsQrkI3NwvaEQ8flLepzR3Jm0B0P5j94CAWCaZm5RMVrgNTtZKQzxg9xozSAFJ3RrXUQoOlzF/SexiHUxr5Pw4Xhkzt5zYFVoKD8D9Iffouufkrz/RMVoOjDYRp+Y0Mlrc4/uyN5MfCtKfzvcps3L3wUvld64OASdYicJqMYhBBxHWHSB07PSbbUqFVyvbiwFD5nGeeWGzCwozoLzmfG6NW15q3sVlzZSL23PmRdV5ycFLdjW3DZASo1t2BqMmaepN2jI6ZpYbjvUvP0AgtMgJuAbiMQIgJx6BsYjS6jP8TOCISQ3uVONJWfLJiPlQZ90X/46BwGGbwprlc/ks12rimgz73iuEbw339L4krr4DtyX+3w743f/J1T9kvekDgZUjwY6oHL4tjXY2xkBANuMV+VtyoXYkwRcTJ5TGib5yTtPlXRRWJzijbyciLC4Mojb1N5/kkSEHK4Y74TDv064hKGh1CJPZ1DSGEp5l3iAEZs/EPQy5Uq11vJpVroTWIxPwLrTveUkbm11YWiGOb+voEOcaxin4mgArgDROiC4YF6AzY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5413.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10067099003)(38070700021)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?n5iqpYwG2IhsrarieRZ1SdHWvZthYOAsuRwKvFQGws5ygyagEuruDxikRbAN?=
 =?us-ascii?Q?wZzqWSyI9fe/fNCLtO8lx807DFxUzGwyaKiRezM8QDFldEgOolGbHFTnlHSL?=
 =?us-ascii?Q?z8jkGeaeVBTd3j/+pyN+Ahvaca/QrChX1GYBh6KL4Ej86dFepzwrhOoE6WIL?=
 =?us-ascii?Q?h/FeaAWT2tRTH7cUmM4X36e312R2q4pIWGyehyu3lThR6mnZGCdwNkAcNuX9?=
 =?us-ascii?Q?FO+eVBbS0OSLaGt1t77B5YQE+HiObfu2w6xpu5KHJLq+XXTaznMgdrbz2eAL?=
 =?us-ascii?Q?RytMOcfH1n6CW8aGCVWmCQHYvOr6i1wjUBjxI3p+wrio5+4iiSr+UfvdX6S9?=
 =?us-ascii?Q?+K7yk+HqcTyP4yruHHEtUa0rrCZbisLVHKJYYxTPhvwcl4bXVVqFEqA+u46b?=
 =?us-ascii?Q?n3LgmNXLhg4i9QLPAoFcDi0DbLRE3WnPhy5JiB8HcduMYxoU0MbV5erhN5Ra?=
 =?us-ascii?Q?vt1NI42FjcZVkLZcD6bvKsTpuEr5HiosTP9Q5EXnxN/7cws9T+9HwFsp/CCg?=
 =?us-ascii?Q?uvCaeVLz7i1MkG8+Qf3yVPOMmPNF/lqopg2Fvs42G5WLM1hJa4mTXWq8+66j?=
 =?us-ascii?Q?uHrvL5OSeNHlAR9cM70/zW4kTimdtGBcCYP/mAaFfufRyPWNwjB7mWdRa4cY?=
 =?us-ascii?Q?1QaftoS9ssYW6O1oCJyQBfAfHs+mXh7/rurXfAW6DXMNOK/Y9w0neOQb6pjQ?=
 =?us-ascii?Q?zoj24RDEWFea7XkqdnEo95Wd2hCNoefoBbiDw2rv7JxSOWQyC0uq4X2A2gUQ?=
 =?us-ascii?Q?lOui/FNefj/qF+0y7mHkuhTXOsaPwev5QqOME8cpVfuUa2zltAQUoIpth5kX?=
 =?us-ascii?Q?CBGQPSNEg1RL9ZNIdR1luNvLpHR5CBfZkiE2a5GCF1J0CZYAwDPouMKw+JK5?=
 =?us-ascii?Q?6EvElSK/wSJkyXn0c6WiRr+r6NN9xcEmCBnoD8Mn/hbevEn4S36SfRZ0VniN?=
 =?us-ascii?Q?3RKeTTa2RaU9OF+9DjCeCwSPJjfOjn4jBrJy+6GyZuuR2gnzfBZ7Mpxk37Kz?=
 =?us-ascii?Q?3qf/CsIA0hXPdPn65dCzyoSkjvVAmtHVgjWKrfm5ZUgCk1KNOYL/b0YelwKf?=
 =?us-ascii?Q?dIfz9QhZQa71EmEm1TQ1yUpfYAxJ6Cs1+NaqdCr1wxv++UKq5zelg3z10NjH?=
 =?us-ascii?Q?2NPQ1Ne+yvh4ac38+3ZdFAyCNH77VX7cDB8tAYwMcvNzMvBkVOYFFgsXTKZm?=
 =?us-ascii?Q?DW31bfOQQ3AbfWfZdunzoSQErVuOdoSjPGioOYcD9VMy3YoQ3q0kABtGO1KD?=
 =?us-ascii?Q?P5aFfGjeX1WYen1xeBfvyJtQIn4pnrIl5wwhBt8eYAzljTS6nYy/Gd8ryToB?=
 =?us-ascii?Q?UK0NDSnK6SxXfxujGwvUvzZXIMixsmQfPtlay1MSMwcVU65PKRxL61xe6WDr?=
 =?us-ascii?Q?Pv66NP+Hb9Sto3ruKNMCyLxgGOW7QCcF86MJYoLKwvI6Tp12N53zyzgLVYrl?=
 =?us-ascii?Q?vo0Rc21kA7feknTf/Rbd8EWQlT2ybnGipYgAGtUSGgf1OxwMwIUsOxLl/Q0I?=
 =?us-ascii?Q?PNHSwenR4ongHoEBdRP88yr3AJQkUK8zGpOEOoh+B9ghAaITDxkUr2b9LgJ+?=
 =?us-ascii?Q?tU4LrrPd+a1hAHce1SXId0QFIY+8tNO4O0e+nZbRkmmJDy8xsdoHYJE4ztSr?=
 =?us-ascii?Q?rI76BGgmeWNlWGXeYDJagN6fLtC0n2NVJao+zoSyTQA9J2IBrs2wPatPN4+O?=
 =?us-ascii?Q?VAvvdIcPA4vm6fTZPS4+iKOIe5tTXZA8j6s2nWCRfLNdvu/z84skeOA7eUHk?=
 =?us-ascii?Q?z4qgzxFdNXPxI9HOkH6lTJbfBJTVHJ8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: FKoK2KhkrqpMtXHkOWhZY+1sNwE7O2IT8zCNul/ahn/rrNt75+H9cJ+NfyGwSYMt6gl/uGRr869448mWAVN+0i8LdTHPzYq2BufPqwaQnBgig+dpJ2lF6eJ4A5k6aGBXG09CutTLbcHdQUAZVdP/L54VGks8KblWA+d5/MDMBs/j37RSNi1Rx/njYp0qxFydNUahNf/um3nLvOgIrnEgow83667MLYa3Hs+0ApI580cI0MZNjfDhPFvCzldYZ1Jio8YiVVJ2koHl6+gGC7N9GsbfXvsuPNmL/h9Qwmf8EcfWL0hN/CD9ha7ceVgXc/KNJq1ZSl5yKvki7pB9kFEobA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5413.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78496dfe-bd26-4242-c2ca-08def870a467
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2026 12:53:01.1239 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HM+2y7YWw3si/VDAwfP1EvMjOfQFnsm30627+t1Gp8rlWtggsDhUEDnZyMoG0KefT7qxBdb+Hcgde3PBvCRR5Gt5xgBFxjiLDoIesT+KQ6Q=
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
> From: Koujalagi, Mallesh <mallesh.koujalagi@intel.com>
> Sent: Wednesday, August 12, 2026 6:05 PM
> To: intel-xe@lists.freedesktop.org; Vivi, Rodrigo <rodrigo.vivi@intel.com=
>; Brost,
> Matthew <matthew.brost@intel.com>
> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Nilawar, Badal
> <badal.nilawar@intel.com>; Belgaumkar, Vinay <vinay.belgaumkar@intel.com>=
;
> Tauro, Riana <riana.tauro@intel.com>; Poosa, Karthik
> <karthik.poosa@intel.com>; Anirban, Sk <sk.anirban@intel.com>; Jadav, Raa=
g
> <raag.jadav@intel.com>; Wajdeczko, Michal <michal.wajdeczko@intel.com>;
> aravind.iddamsetty@linux.intel.com; Nerlige Ramappa, Umesh
> <umesh.nerlige.ramappa@intel.com>; Bhadane, Dnyaneshwar
> <dnyaneshwar.bhadane@intel.com>; Koujalagi, Mallesh
> <mallesh.koujalagi@intel.com>
> Subject: [PATCH v2 2/3] drm/xe/pcode: Improve PCODE logging using xe_log
> helper
>=20
> Use xe_log helper for PCODE errors instead of drm_err(). This adds PCODE
> component tag, making issues easier to detect and track with automated to=
ols.
>=20
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
> v2:
> - s/pcode/PCODE. (Michal)
> - Drop PCODE in xe_log_err.
> ---
>  drivers/gpu/drm/xe/xe_pcode.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.=
c
> index ccc3bdeed6bb..c69440ea477b 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.c
> +++ b/drivers/gpu/drm/xe/xe_pcode.c
> @@ -14,6 +14,7 @@
>  #include "regs/xe_pmt.h"
>  #include "xe_assert.h"
>  #include "xe_device.h"
> +#include "xe_log.h"
>  #include "xe_mmio.h"
>  #include "xe_pcode_api.h"
>  #include "xe_pm.h"
> @@ -219,8 +220,8 @@ int xe_pcode_request(struct xe_tile *tile, u32 mbox, =
u32
> request,
>  	 * requests, and for any quirks of the PCODE firmware that delays
>  	 * the request completion.
>  	 */
> -	drm_err(&tile_to_xe(tile)->drm,
> -		"PCODE timeout, retrying with preemption disabled\n");
> +	xe_log_err(tile, PCODE, -ETIMEDOUT,
> +		   "Timeout, retrying with preemption disabled\n");
>  	preempt_disable();
>  	ret =3D pcode_try_request(tile, mbox, request, reply_mask, reply, &stat=
us,
>  				true, 50 * 1000, true);
> @@ -320,8 +321,8 @@ int xe_pcode_ready(struct xe_device *xe, bool locked)
>  		mutex_unlock(&tile->pcode.lock);
>=20
>  	if (ret)
> -		drm_err(&xe->drm,
> -			"PCODE initialization timedout after: 3 min\n");
> +		xe_log_err(xe, PCODE, ret,
> +			   "Initialization timedout after: 3 min\n");
>=20
>  	return ret;
>  }

Hello Mallesh,
This is one more place inside of the pcode_mailbox_status().
Could you please include that as well to this patch ?

Dnyaneshwar

> --
> 2.48.1


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D19C44529
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 08:24:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BF3310E735;
	Tue, 21 Jul 2026 08:24:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R/iehSAY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D243B10E72B;
 Tue, 21 Jul 2026 08:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784622226; x=1816158226;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=a7NLpp3rIWd01hM5euSf+4lQHtcvyYk/NERgSOEoQlo=;
 b=R/iehSAYrVbNGpTMKXRT1AV1e6UPgEwPSaZb4TGS5/Lh65mW4TczssDX
 xLZ5h1EYq1JlMWlqV/1bErnu+SexYmKSDyLRbjYHManTdBkRNjwfFZMMc
 pbx65ogNTdTCcfJOhPXTZ0lhPoOBIt7VODO5ieR8KyjY/sCZzGygbkI8K
 1dBJ/kA9q5Ne+phjS3tkSQB2doKorOkECVf8QLo1Iq3hje9LtMi0kwTm/
 bVp/9W+Gz/Bfitps7RQLSNtiviYe/9fwU9SasL5/li8afo98mQOzlUXSV
 voV/8483TRR1kA/UMkk9uS7kN9h909BG7a37Ea9FbNI/yVP1Zr2n4xGDk w==;
X-CSE-ConnectionGUID: YOwJwIa0S1SHW78APSLbRg==
X-CSE-MsgGUID: QEkRcnukTYmN6Vs8q2BlUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="85230990"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="85230990"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 01:23:45 -0700
X-CSE-ConnectionGUID: 9EEQzJ+tRvuUJCeAENSdrQ==
X-CSE-MsgGUID: AQZJJ6yHRJesH2wXr9OU3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="261971933"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 01:23:45 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 01:23:45 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 21 Jul 2026 01:23:45 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.23) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 01:23:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XRvgxlwUd9MiGuMC1CNfwU7taWP0WPUXSKy495a1EpyNROhz8Om1E2A97DsAqLwKSXRAI6lIQfCS99ZtP04VBHUmVOBrzNyPFwH4Cmskwy18a/ZAx7uGn0u97pzP1pAJjEqDu7rsbJ3zp4SnX2FuOMQMelaB+aI57dOVzCNhPiFt0riSyZSaZqTSV0rKtBz+Gq4A0EYN4E/fIbcIc8JhKeQ9JMIwhGwzhoLOrSiTjl8VmzPzC99IsjtV2HQEeTwajxu417QwaboP7c8rv7eQVfWapksYT3mbFRZJM8qO1kA5VoX315D/Q0waykjJby7fvLjRF19qAd+67Qomnlh17w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mrlo8TD3hESNJNZNUcX9JN/jUdQJKpW8ngWnk3Xgt4c=;
 b=LJCbBHoNeoewbXlb37jhpGMLMmIkm4a9FS5GPOkI3QmtNpiCdD6xZblP4HZ8inqtjGJzV0TNoaFpelWFfWCEnP5wHe0NuA5+FMP4M5U97Uj71GQsX62zNjdMOFR9IIvnolXtYKOahSVuVG5MCnCQm1ZzRpxQdbyEEP2PGBYv1Io5Q2ngEdEfG7bsep79GAY1snzSrUl9sSe0Ex5xnYYB4ACZwWJX6IKOgrY7kC+ekO1CoovjPlwoH6X5oTEcDH8cQ2Dxx89gpiW2Xp37Sup1ZAMMl0cUlvd0IdX/B3UJlkV7+e60Ihdos/uIYEtDWCAMuICrAhtnG22NFJ3n8R8b2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 SJ0PR11MB5040.namprd11.prod.outlook.com (2603:10b6:a03:2d6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 08:23:39 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::22d9:ae03:5db1:680]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::22d9:ae03:5db1:680%5]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 08:23:39 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>, "Kandpal, Suraj"
 <suraj.kandpal@intel.com>
Subject: RE: [v2 0/2] drm/i915/display: Implement Display Wa_16030862157
Thread-Topic: [v2 0/2] drm/i915/display: Implement Display Wa_16030862157
Thread-Index: AQHdFEPbeaRbxzIVT0iYqKwixwSTdLZ3q80g
Date: Tue, 21 Jul 2026 08:23:39 +0000
Message-ID: <DM4PR11MB63609EC5CDB9DD52AAC6E227F4C22@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20260715104119.4128662-1-uma.shankar@intel.com>
In-Reply-To: <20260715104119.4128662-1-uma.shankar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|SJ0PR11MB5040:EE_
x-ms-office365-filtering-correlation-id: 93428253-b4fa-450d-932b-08dee7015e3f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|6133799003|11063799006|10067099003|56012099006|38070700021|22082099003|18002099003;
x-microsoft-antispam-message-info: v4IEpAjtkiR1i9U6KuE239bKmk7CPX0O8OvJ5TN1ZHxS5VybBX1Py3qrtXUl6QKdOylNKNaSc6nbzJ4UGCEUxLZ2fFvES3lMCGbDHiN1VdD5hQeqvgO6R69E0b3OcsjlAqJ7EcI5VYa97atPWhxMLUQpge/bJdRhdUfYgJ6FYY/eqVYTg8W7v02yFdrX/+p+yThz04iIQ7xZMl3WX44ZKcmJeeYMZ7f/7LUnTy95X8AeJuyKIOf4RLf3WYIaeVaj6wEmJIJ042sWyTHYPEm5qc1J92ISZ7RGC4H89GLaMLD0UqGwF+dKtAjqC3gNEjbXTsf2qqGIKAT2QbVmkPADk1YYrzpUsL/d0x6QQp6l2ho1kF3DG0OhaT5C/lJ1TSjF7q+AVVkH+hzqefS6Vp5rz1Eqd44iiIWyQ7W3dzgfn9uILuYAUH/BJrVXG5NhGxIAhU3NMtYKnB5NnebM8eXv09NzzGC8ZZtcrZm+JhFKrhSVv5DMe7fSndMK0cO7Pfwlirk1KR4urB29onB2rPAQnEEt+AZ2O5rFlKKNLKlHCOSStcKiz+WT6lO5SCH/0OhPkKvs0BFobe7BpNIkNkjAH3EQMiPCmWw8VoxpnhqI8GJP3BvT0xMrPp2E3eGatZVrJwXNND5V4js2jHGGDepN3UrWTYiHDfPyuk/5tcVIRc8WjvtqaX1ZCRgKfATV+TPZS4FAAkWGKcbGQZxEMi11HJv1G6oFGhImmJUGv2vTP4M=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(6133799003)(11063799006)(10067099003)(56012099006)(38070700021)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2wZveQMNig+XrxnxM46RORjb+hdhFd6U2S0erNIWPG0KtAeJPUtJu6fLorTg?=
 =?us-ascii?Q?830ifQSbX28+YU1wY8dIKN9dBXuf5OL94oClYoXkxWTNMtdXKOEuSaYUlRI2?=
 =?us-ascii?Q?L20r3VibGL8wkhwIeJNrMgg9p2ZVydKaB3VAb5HyNo2u18s5ccRy7kschV6Q?=
 =?us-ascii?Q?mXok2zMX4w1Unt/Tua7LWOkBf/6/GkzfcBvfkcBBN5AyjbrTcFZNXU/3Mttl?=
 =?us-ascii?Q?VyG+4/wAktJmSTPsl2Lo9nKndrSNuXFvazlDtbnjnlPVdFnJjlBNJh4PpXb0?=
 =?us-ascii?Q?62BVhovTnxT94dvO2HebqgYK2gJAqn3pBgEW2jk8Q81qTAuoHrP5u4sBvkdQ?=
 =?us-ascii?Q?EIcu5MUtCitGDS4DlQSCe9vYBwtam7vDSzF0H9Z82gXeU8B3IUMLEIf8iqSG?=
 =?us-ascii?Q?tfubkpp8xGJrBcKWT4sI8ztDennRsuxC7OpJ+K3beJuGVguuGZ3lOhhcy+T4?=
 =?us-ascii?Q?h6gYpuc6h9v1XGx2/lKUZa2Bhnb3suzPkv3REY23TFFh8lWqzgr/t2gM+hZn?=
 =?us-ascii?Q?8xC6R5pXpda9a3QTGuQ2QGMM5N1Q8qwik65yRLVIFdY6aSEivAT1dJGkDZQM?=
 =?us-ascii?Q?I0nJC087ei16EjCR6RrLGPABen2ABb297UqLLwfFHjcEJnufxHEQpy73Be3+?=
 =?us-ascii?Q?AhVtMDx8Kz6WIdo7uw00j3eYLorXLgqO92F5uT+1DEfOYZ7+DS5NfFjGjTxR?=
 =?us-ascii?Q?IwT4OCG6jSBSLfk7EmVcze0oC1ykunm8efN9Ypad7pGS2TzSGjl2gBpdIuOG?=
 =?us-ascii?Q?BhApU2oRtITyLIId5w3Z9mktd5BoriyLjIeglup/KH6GNqO12/px2+jLwwp+?=
 =?us-ascii?Q?PKfdvEILx9xvcpH4tZmPbs3Ysk7SEe2C73ce4bKDXgp/Q7Xv4Hrbi8v+G8ry?=
 =?us-ascii?Q?Nqugbr8KsDx7ZMYHWXdJX4GFmNXQB0zWrO7J6aHYbY7SU4uxVG4y7um2TLZ9?=
 =?us-ascii?Q?c1ERbRXLjAsBJSHGlKaFmosHjlZxTIIoMNHafH3lSkDPA/ZPq06FVdPZpOQ6?=
 =?us-ascii?Q?VGRMvuQmqZWCD2zDAUIrXXm8kjpEEtb0X31i3t8XT/hMQEtSduLGl86aYpZ7?=
 =?us-ascii?Q?s2CQ6Tg7u4+60IJraK4XwuMepMw/Ib53DlGCX99giHSqviCQc9T//1e7C0EZ?=
 =?us-ascii?Q?0LJR1Sr26U6jIhs8TQmCUwQ1UUqygeFItLTyFvnkNGkM4fv4LaP2vtustq4k?=
 =?us-ascii?Q?m2JGFemLN51vpha6zcB/ppU0Rl6LAkqgjTcICC3jAYKufdvSCQpP1TCj8D25?=
 =?us-ascii?Q?SDYcdmDUmyOaIEupjKw+w8pVZec2HSBl4VpD9UqooMn0Orj+QCRiY+KKiGQD?=
 =?us-ascii?Q?kmsLAcWo9KRKsj4PnGfVlxfwkAkPdsRTE8/YZU4TLEYzzBQP9jn5bM4B5Ev9?=
 =?us-ascii?Q?lnEkzsBLC2HUYZZ0dA2nsQm0W4/1Nq3jkkZ+GpDvREJ/OL7kmahRANP7HJon?=
 =?us-ascii?Q?3m2SJPnoY9Lg9ERDjKAej0Aj+eeErheiMQNdIvOhWz1q5yt0UdBkl9jCsLmN?=
 =?us-ascii?Q?eZret2qqfnky3JndplqWcKqYuE7PU+fdAGMuQP2azfSSy74xAkeTjvrvicY+?=
 =?us-ascii?Q?2xLxGCHc8jzGUPo/uAd86OuZz/2Q2y/IeOLkyajufWwf8iNvw5upXSoHE9Li?=
 =?us-ascii?Q?sLdEBpbOZELcNwvRX2PO2JOg5BJi+BLCpxmxFBSGD1fYMZsDAZrW+W5wH7hC?=
 =?us-ascii?Q?hbOFyLX+FGLTycU1U2g57yLXL4Nt1tHW+GfdOsdaQDvA59gx?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: NAVSf7Jehy943YMXW/HW2mqjMvnLNaurimbdj3fCs8+JdfDFOMyw9lJzXRSw7vQyLkbcoJKEcC9eYmZjmrXeEa3E5e1kgV+w7A+hXxKXAN50WkBPAtYrsvTR5dkhP/ixqikti8klqZHx9CtlVBjVYiT5Lk83FYmmKuGzLgSGiyx1P0cizYuUYL2cnGsuVMlGloHczd6Okj9QkySx61ZRgoeW0v23S7MmUCZYiQ/yZgo3iAfHGpQ5rvwraWiY+PMI9W7kRiB0Nf+W+TBr37qYYjXInLbM3GXw3Nw5Ov7tH8KjePCUaWrnuwf2y1uH+oYDjdcI1EZlAmwR9/j+/cFdvw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93428253-b4fa-450d-932b-08dee7015e3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2026 08:23:39.5320 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KmzAbNg7rcEHDCFOtGnz36YPuL4MpDEvJ2BHPQC0sYYaH63onBU9lJuojg06sw6BtFq9Ny0ug0nttLxoOm0ZnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5040
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
> From: Shankar, Uma <uma.shankar@intel.com>
> Sent: Wednesday, July 15, 2026 4:11 PM
> To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> Cc: Govindapillai, Vinod <vinod.govindapillai@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>; Shankar, Uma <uma.shankar@intel.com>
> Subject: [v2 0/2] drm/i915/display: Implement Display Wa_16030862157
>=20
> Interpret 0xF populated-channel count as 16. For 16-channel configuration=
, BIOS
> programs 1111b. A programmed value of 1111b must be interpreted as 16
> channels for memory bandwidth calculations.
> This series implements the workaround in driver.

Pushed to drm-intel-next. Thanks for the reviews.

> Uma Shankar (2):
>   drm/i915/display: Add Wa_16030862157 to the display workaround list
>   drm/i915/dram: Interpret 0xF populated-channel count as 16
>=20
>  drivers/gpu/drm/i915/display/intel_bw.c       | 20 ++++++++++++++++---
>  .../gpu/drm/i915/display/intel_display_wa.c   |  2 ++
>  .../gpu/drm/i915/display/intel_display_wa.h   |  1 +
>  drivers/gpu/drm/i915/display/intel_dram.c     | 12 +++++++++++
>  4 files changed, 32 insertions(+), 3 deletions(-)
>=20
> --
> 2.50.1


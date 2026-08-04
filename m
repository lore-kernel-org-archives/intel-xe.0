Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD2ECC55822
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 15:25:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70D2310EAEA;
	Tue,  4 Aug 2026 15:25:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xo4NZ3Iv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B65110EAE9
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Aug 2026 15:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785857145; x=1817393145;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cjtv3pqCvASAngvPkLaPSX99LqbQnIkvmZXz375Q4wg=;
 b=Xo4NZ3IvRArEwBCZGMivqcZZ0iSqHYJEDWmCglgstbSMULYma9Gj1PKB
 lfXdOgeEmTOiV9r+7vqjK3VBMO5EGeac1EKM75wnVeOl4rgZcRBKCbRq3
 mQTPhzPjZSkF2g/TKq5LRn/x2vNqJJMKZDSUZWl+5+eySgb4w5XTMJmL2
 JbmY70RzfJmEWmKUeKDfA9N32mBU1uwYqvJQidy4xPbmD9SpC5wfZciNq
 jF6JGChuvL7jjTKBGGrvGGCvV/XeJ06x2uqlW0tNsfrv1GE5PTawtqpV9
 QfvXd77bSPuavTjZBS0lqke2vZJYkInq8ihSSC2vdypkk8KwxzdB7Rq2Y Q==;
X-CSE-ConnectionGUID: lGZ29LOyRiWr7iv0kE2qUA==
X-CSE-MsgGUID: Y5BqrktrRJKg+MpMbtkkdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="96770775"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="96770775"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 08:25:45 -0700
X-CSE-ConnectionGUID: NtZGDW2BRmqPuMCfzkgmIQ==
X-CSE-MsgGUID: MtEmgznkQ/OB4b+fu0b0ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="263526603"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 08:18:17 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 08:18:16 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 4 Aug 2026 08:18:16 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.42) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 08:18:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xo1bLwTob5gviEqR8pciDF8y2dQJItGtgH+0TcjS/Tfmjcdkwv1Cudd0POE8jXIgsbEl7amsWzb7kLRJeRggLhbumGq2G3Ho4eVbVrDeDkKthfCfhSQimalrwj1DN+d4Xe3CibIoh1h8pXh3qbzSLCpYza4h7m7iV6Pa9+nFR109c8fsF4rr+nadCDWf1e4J6Esu12mMA56Y8gEvLNxjEp3TECNOKqyLpMjqaNQowvNyp8mzjJmGrfyXaVcTK1dEoJTkMMMS62RYIoMFsF3QRZSqHreaXP3Peuxc/k7f70Xf0Q2vFccXWyBYLfuTjPX6I6T9XtIZaetFEU3aWoITQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w8/511tw2YdSMkwTgNThFbH6xdT/lm0w14p/CBUNUbQ=;
 b=FbSPK31Lg/naJzzX8eWIAxKSj1fLTCY9gECeJUxgIHvO9erRGOINsA9jkP1ay9DBAoVBsNnPWLpFURiMKUFPDrrz4O7ZCr5aFH83EObfsbK+5ZDtop84rlLF34Tcong06H6wzdkltg4z29CBj5Sra0ZD/tJPz6SJJfL3RMovClygpcfqsJD0fDdfW2v1XgfXPumqDSfoRiTu6qhNj79E+SAFQY9KxzNNZ9X2je5c0pXPMo/nQjIbrSFh951w2YIOjzHJa6yYEMQv4YiHDNHKyZucQRGqEtFAP9Di9/X10QWFwkhDx61b889YadbJdi8BrzVc5JHd5uAWmhnw10h6Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 CO1PR11MB5106.namprd11.prod.outlook.com (2603:10b6:303:93::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.16; Tue, 4 Aug 2026 15:18:13 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::22d9:ae03:5db1:680]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::22d9:ae03:5db1:680%5]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 15:18:13 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>
Subject: RE: [PATCH 3/3] drm/xe/display: drop redundant intel_audio_deinit()
 call
Thread-Topic: [PATCH 3/3] drm/xe/display: drop redundant intel_audio_deinit()
 call
Thread-Index: AQHdHqCCSq3LgYuMhUybmtMqYpJcMraOC32Q
Date: Tue, 4 Aug 2026 15:18:12 +0000
Message-ID: <DM4PR11MB63609009419A75CB84B5A09EF4D42@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <cover.1785250188.git.jani.nikula@intel.com>
 <b2b376f5d6f7ecb48bf9028ab5d0b9c95dbe9859.1785250188.git.jani.nikula@intel.com>
In-Reply-To: <b2b376f5d6f7ecb48bf9028ab5d0b9c95dbe9859.1785250188.git.jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|CO1PR11MB5106:EE_
x-ms-office365-filtering-correlation-id: 395364bb-1d39-46f1-6bee-08def23b99ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|38070700021|56012099006|11063799006|10067099003|4143699003|18002099003|22082099003;
x-microsoft-antispam-message-info: 6Het5WJ798+Ap724t/v8SVvPhVUSlFfqKd0kTtV9Mb8twldD9vj2ZiSfIA/nkzgc2u0OepBLEwDs3q+NjLT1UK6klY0qdnfgM1bmBfvh3lEr3AF60sq2PVpDzdQFpQvOnN9O+/sbOZAzL2RPLrjy0S68VHcrS/X/jweX8ZtZVTqXVAIGlnBGBhSZFn1iUkskJju6FSKQZxP9G6wibGwmWA8SgALqjoZnCRQLKUd+hB5/kfHm7ru7+3Nw/dYSUaVQiCziufUtBHPqfcZrfKnExL06Vw2SZnhh3yV+wIjwFIZD8zB4JXeig5KxtiHslQ/bRclxoU4piwKior6RnWt8OUu3GhBLmmW7dc5g6ZBCQ6L3pU7Q1CqQHCWpqsVmnXwGp7BSPR/RseepFMbXHSZRk4qElX2w4LoWPvhyPYkB29iZU+B7N5ifN67Zz4jFSnt7WsQIRSr5hM2UDfcjTpBm+qBU/te/VaTj69THavdsEjAsl8isdSDTHtFDC2+9OB8csq9ozfB+7vtZGHSJ7c7Z+T1PhOUV3dEu35bLWlHOETQhQPYRnzYVzGsVEjkM4sY99QnWxvA5+DKMhjHgvvW5po359ydlNPHj6W2j4TkTUpJLPKIrZ+AbK9hQZPbyTijh4hmj+l5B5cJZk4yvD3zzNKfwtQ5sCcTSjQS3U1Q8EvK0AWh//nr2YeXTcHaroE5IGOg6ggSvL9q3GjCReuplA626ixJMRswJ4lvpfGG6Ie4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(38070700021)(56012099006)(11063799006)(10067099003)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+WXoEvwvBmv03rA1K5ZQBInBL1fBP4LkPs7TmEUCz0440sn5NxEs8yKceglV?=
 =?us-ascii?Q?rghwBH1ZftskAOF9GvJyIMXHBbZ1M7IdNaTDPy/+JTA67kcOD5fI6AaekeNL?=
 =?us-ascii?Q?0OjGJz4jC60SrcSr4Fn3Rrbz/RQnktwuXjP4BOvJTLoFFpQw14p6V5Vq8ZhR?=
 =?us-ascii?Q?sjDFP4/qrmGeSh1csuZAGORB+dCtWnOaexuL6xOwgt/ZM4ZHb1kTDDFfejES?=
 =?us-ascii?Q?G12NsTljEZeC2niMBh/Iu8cvJl0MpZI05ZposV9v+5yCH0tG+Je6DN9DTE+8?=
 =?us-ascii?Q?ZAUcguscc/VxOHTRr/erDb67VwOjBpQKwLwbqaAEnX5n07giUnTQ1v48+fyj?=
 =?us-ascii?Q?bSEQC+ORA+V1bCps8PqKe1+x8y4+gM4JSBlgGf+AHPRFauLcSPDGe1f9rGWl?=
 =?us-ascii?Q?LSGgd8ePNgvCg3S5uZUePNtFqc0/2yKFp4werKvDn+cRETfQd2EbZay2QTuo?=
 =?us-ascii?Q?eKKxznq9gUzFW2T6A5iDjqFDEUT6gXn2wVQBh4qQbYysw8uUPieeM2ZQSzxI?=
 =?us-ascii?Q?N6S1WiA3eYzxhUzH3cBzPUbUh2Niv5vQRtu2g1foJaGRS+rAsU1vxrdUDy0L?=
 =?us-ascii?Q?E+xnajpmN+t5f2c8FAXYHfnM64vO2TeRsmlV+n5FPyKauw7iTGSNLvcXow+w?=
 =?us-ascii?Q?ShNgxwz7Gmm5omcImhdCZqMLDsZ5y3dfUyLGAhxOxeC6n9779tiGkeZxUmnw?=
 =?us-ascii?Q?EjCuhqkdpph+qtS3FUW97NTXipOzZoM78UzX2GJ4WnRKhzgTcN9Rk3yiiAnp?=
 =?us-ascii?Q?ulxfCJ7J7uFCOZX1FmUVIDCYQzq2yq3uWfax3sKaStFBQxh9FVZQ98IRriQu?=
 =?us-ascii?Q?or+1vT+5uKnToN7frehk6gBZYIUKxs8w0Cumo6YP14GDqV6IP11504mDlHEw?=
 =?us-ascii?Q?owfa95/CLYfMZXFvzE2nvLXnHxBZmJ0yhtqb4D6GoaDS3L0ZhEvdgOz1VCmo?=
 =?us-ascii?Q?jZY0ROcP5cmQSB7L7G6p9RJxTUvuyhqhDVZaIxwTaHWyy0E+Dbw3INhn/ruP?=
 =?us-ascii?Q?wFTUl51CKxklUU929KIxxNzPrXki+q6bvPG7gW5uKHjGDn1EjU3gA238tJHn?=
 =?us-ascii?Q?+I74lm46fKqjuo35UXgHxt4iGnj7ZgdLMoElF683buT2wgW/lEZZMwhYSIwk?=
 =?us-ascii?Q?iMY685P3W8j6lo9j5k5y3/+zctI0kqkwAsXaknKLySw7thDdjSaSOWs5Y+cV?=
 =?us-ascii?Q?KaFl5nRChBa5/iOVR+4wnOaeWNaPY7Gfl7nj13rsc59zXwilLrwYFCZGGmH5?=
 =?us-ascii?Q?/nRkoiqAqosX5mzEpJGxq+SWmFqetGs0kEupdW7rQ3EkpGV0O6E49Fl3cxio?=
 =?us-ascii?Q?NWAk7bsOGX61zeVIMip8y1i5ou0aV1XUEbxkosfC8LtZPzmypFNYFS5pj/QK?=
 =?us-ascii?Q?i0RU2pgEgc1OHUOnto7LWrFrcFQJIx6gLCvuJXgdc5ot87lPfnvt3QYlcvtZ?=
 =?us-ascii?Q?g535HG1BT13FWT0ey7x7BYXvSWWmWfpNyveZd0gJ43Sybq7CCQBhXk8N3Jjr?=
 =?us-ascii?Q?RFuG8moMNrm/vSQqOSCrqKwahnIskwMR+odNa11y2wMYHF3ixtOLA6uPEZrs?=
 =?us-ascii?Q?rEWj5OHazx71dSeU9TqaZv3BesmnCTQtUU9LtiobzDOGb7oW0ij5CcSA/haN?=
 =?us-ascii?Q?DGYZghaZUcIWgXdkVtqheRM5MIzqcnluS2/JWMfiuTPvDVFGSTv8vEIX7nDU?=
 =?us-ascii?Q?S9LcyZRVD5CAzeSIdxH7L3NnUh2bx+OYRbwlBAU/3RZTEJ6ChbEB8ovAG3Hz?=
 =?us-ascii?Q?Za02TslGww=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: YAjx0+Tuwb0PYL/EagCPYpycxwBnpOHtrc8fEzqF053XlN7KyV7tjuXZ3Anpc4CUWsxA4d7rol7qSIPrEIagmgaLgYNIdYxZiKhARtfo5fadfyAJx4boukPSqXudGvtu7T8dxe8aK6rWdQpTCT9qcNOQcozZmzbwiAo7toei4kIscamwQm0b2YmR9rGHNjQXjt93DwUzxMB5+pa7Nf0Klf1Y6Ma84gacp9EXprM2pPlSDOrb2sCnxXPbpRStIMCY/ED9YMvocqJYdRGvqgtHHXyzgtknKcXUCbqk45cjq9OBgznpGIotqFbaIMIcruYNdG9/6r0uCMAu/SrCEDa1nA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 395364bb-1d39-46f1-6bee-08def23b99ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2026 15:18:13.0024 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r4Yok/+dacx/mtOQrVT1rVzaIKOYYiK4IOpeTWYCtWoO63toqNPEPeADHc8kvmtjXYVNrwNY8c/C0VfxzyY2uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5106
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Jani=
 Nikula
> Sent: Tuesday, July 28, 2026 8:20 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Nikula, Jani <jani.nikula@intel.com>
> Subject: [PATCH 3/3] drm/xe/display: drop redundant intel_audio_deinit() =
call
>=20
> intel_audio_deinit() is already being called via xe_display_unregister()
> -> intel_display_driver_unregister(). Remove the redundant call.

Looks Good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/xe/display/xe_display.c | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c
> b/drivers/gpu/drm/xe/display/xe_display.c
> index 2fc12592627c..6800a831c76c 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -18,7 +18,6 @@
>  #include <uapi/drm/xe_drm.h>
>=20
>  #include "intel_acpi.h"
> -#include "intel_audio.h"
>  #include "intel_display.h"
>  #include "intel_display_core.h"
>  #include "intel_display_device.h"
> @@ -128,7 +127,6 @@ static void xe_display_fini(void *arg)
>  	struct xe_device *xe =3D arg;
>  	struct intel_display *display =3D xe->display;
>=20
> -	intel_audio_deinit(display);
>  	intel_display_driver_remove(display);
>  }
>=20
> --
> 2.47.3


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F084AC3DA63
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jul 2024 17:01:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0C1610E76F;
	Wed, 24 Jul 2024 17:01:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nByapxmL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D15B210E771
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jul 2024 17:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721840505; x=1753376505;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=h78rgj0iAs6pMSY2NV1xeLg/ZTTpkJ08iSH5jhbUuNQ=;
 b=nByapxmLl9o1BA/hL/s7qS49R8empaM01KzTRfiDJbuNnZ6h91U8QeNC
 0hx1nujCNzGV8vVzR27PnAopT9SNwqpxWb9bA640OxZ7dsqvRpD6c/18X
 b0v7k8M9QumseA0B+GREwB81UmBfeGlkGtkrOf4axGelKds3Gs8GehIS5
 bLwqlh4KGs4ClzDrxItS2lnJ+GGqb6ReGxtQyOK1WMQbxr/bAsEP71zyO
 7GWrLx/clYSfciwzOfuVRw6Cfdq9dSuheIjgkjouZt4nSXP8bsHgNEIWM
 4iBa90Du0eIXAG+hd6HAdat4TW9lh6ozouZqwI/TgWk2pTqtUgAXE7q7w A==;
X-CSE-ConnectionGUID: MdaF66aHTgip0/LRU+0oqw==
X-CSE-MsgGUID: Tjp8ZtkKSjubvl8yQKVoTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="22442627"
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; d="scan'208";a="22442627"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 10:01:44 -0700
X-CSE-ConnectionGUID: gD/udA8cQjanpMA+sWK+Lg==
X-CSE-MsgGUID: YlreXvVOThSmomQ6JRdgCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; d="scan'208";a="53248624"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jul 2024 10:01:45 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 24 Jul 2024 10:01:43 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 24 Jul 2024 10:01:43 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 24 Jul 2024 10:01:43 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 24 Jul 2024 10:01:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zc89ilt527BeVUbeV75vG+PqDoepZgnDU+OpZPMAu3qsfLbJP8azZUpuTerEs1B6svTXSmAnTOmaL+QSaPm3YWP4q4+VGj0GAIVzPNB2BzHYIFl0i+vifY1MI8i3WRS0uw25v/FTHzUKMawXAs8YNTmDfT6e1FkmwBWeudmXfhRscMlyD6LKFrR3Wjgt3vw5AwzBeWQq7wGWRI+dywYYK4WQ4SiyYtfahyhqkVjuvFxwSNeiSpsMp72vT+6B7wBs7V3q2Il2R2fkIP3fpCCnMShOOBG0BenECeYvtpOj9v8Ktjk1+dLHRar5rZo3uDVT9b/8r3LqTVBHzhM3zpUKrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=og4qiRSPNJApblfWFN6k0cKMcK+7ge5+bDdYWLhvKDo=;
 b=iwgvKbo9TpIxv0zp4ZCOsQ4PWR0KGxa4YshYU9ZS93hmNfsZMoF4uKucRmvZUX8wB42UHR+BiyXQGqYg7Ggrdg7epBc5lJQ++1fQ1Xf1eO/xdjv0y5HADxyonsAizIL76trH1MQo0cR3x5D86WUFSoBzFAuqW/+9dPZPNTSz6064AaojB5fcXGWKufxzOOl0MEf0szIGSe2E7Hzxjym6J7VnGIUP7NDRyGJmQTauQ9klCst+dP6onYSD3JKGeVFNbquTxqXxes5aStvqcwuYzS6z3rl+CTV0H+Mcez9od8bRLgd7tvQoFxbJm+y71dI8v2/53NNkX9Uxob6Z99gASA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by CY8PR11MB7060.namprd11.prod.outlook.com (2603:10b6:930:50::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.27; Wed, 24 Jul
 2024 17:01:40 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%3]) with mapi id 15.20.7784.016; Wed, 24 Jul 2024
 17:01:40 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Garg, Nemesa" <nemesa.garg@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Heikkila, Juha-pekka" <juha-pekka.heikkila@intel.com>, "Shankar, Uma"
 <uma.shankar@intel.com>, "Garg, Nemesa" <nemesa.garg@intel.com>
Subject: RE: [PATCH] drm/i915/display: Workaround for odd panning for planar
 yuv
Thread-Topic: [PATCH] drm/i915/display: Workaround for odd panning for planar
 yuv
Thread-Index: AQHa3cpeOsCTahR/20ygsMUYXK3FrbIGGHLA
Date: Wed, 24 Jul 2024 17:01:40 +0000
Message-ID: <SN7PR11MB6750C83CBCE7C661FD887D71E3AA2@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20240724130607.944085-1-nemesa.garg@intel.com>
In-Reply-To: <20240724130607.944085-1-nemesa.garg@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|CY8PR11MB7060:EE_
x-ms-office365-filtering-correlation-id: c0749ae1-ef59-4efc-6d56-08dcac0249cb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?XKIgNMz/rEhnl/9wq33MsJQBoRw4m3VgBYxLYg2bBVRQuP1DnVg4soV6ee8h?=
 =?us-ascii?Q?5F23gM/zno8vDe8H4CIwjuTLq7uO9qEx2iHMARnpOtnX9TykWAyrxwqZz2nd?=
 =?us-ascii?Q?uvaYgBmg5qmJg/t7ekzZyo0mxYz9q8F1bOtcdUr4ubUtAdnxYRVSj5coxqif?=
 =?us-ascii?Q?Tde+MKsmEh4Ttjr4UQSFNEEIFvqpXybt4vI6xu5vDc9QPLdfHWuMlYz1OtrQ?=
 =?us-ascii?Q?htsbxWvrFVXcXoQ/QylbO3/LB7DVYn7vw8KZN0fkmWy4FSEfby4/VPczz8yG?=
 =?us-ascii?Q?l0Ier+MXaIZD90z/GsuDqbRra3y/pgJMAwywtLwXw0CXJqHlCJNH6YVbjbMD?=
 =?us-ascii?Q?DwmX5XePc0df/sQg6Y+VuKAtWW2Jjvydxg6WhEDZrNghs3LSttqIxnyN0AzB?=
 =?us-ascii?Q?2JGSWtd4Tw/asc35z2c83LrHL6uhRxICBz8tgTQMCUY2wekAU4k3E30gkb2K?=
 =?us-ascii?Q?GRPq3L4ZKfkeYeV97GDHr1LL2+Se3NG0kaslXYtvQxmR9AfhmFm6G+2ZPJHo?=
 =?us-ascii?Q?nS3ZBJWQa3V4BrYnR6mn11jNsmgpzCppJ64OaiB4SMZIXmDId93WJDfxfhVN?=
 =?us-ascii?Q?ReqPVr2yZtDXIY9RYW3IuIadPUsaWAC70NenY3S6dS/TwNsf4wiECUGQ/ktr?=
 =?us-ascii?Q?pPAJbER4R/2ugZs/YdUEMlQW3jmOPuVJo1hRbISx/pRyhaycJkaZniP3z7DM?=
 =?us-ascii?Q?E/0LFGjcZBaPuIVHUwL+iXj3uuauX1E7CdHF8cbqmRZ1FWO+XO1qEfwj158c?=
 =?us-ascii?Q?RvFkNJXtZUXJ9Lm0xL7zY9z/LkGxSdV42M5zgZIV+8ypcOq6x1qPdJWDuuvz?=
 =?us-ascii?Q?93GlmgVsRMEY/0GD7fwV9k7WOcg52xsyoJeHN5w8vm7Cimdo9XfxUKkIp6YK?=
 =?us-ascii?Q?eawC5Rj/79ky0cV3sH1BnpMYJ7AJWyDr03Yc2Lru2H+1BGKFAkGm+WFrhEeG?=
 =?us-ascii?Q?MqnvXs+0gDtP7HnfSjlPNSNF7iMxi7W57p77DKWO0niNiDy/jjmCdkoPN2iN?=
 =?us-ascii?Q?6/AcipQ74XR1VLmi2+PFWRpwx2KeNqPuI0thC+N4ZiKyXISl7hz6hzMidkno?=
 =?us-ascii?Q?qxRZ71on3o+nZKqVG/0cMb5xDN70f+2hT+yBv2hyga4aTM6Aj1InhncJ8HP6?=
 =?us-ascii?Q?XpP1V9KD7Ru9wpwckCWbgq9CpaOAh5WyDbErnDb3f1gj/2wvBoOPwXqUxmls?=
 =?us-ascii?Q?dERv5zsu2PyobxAC/H/2cYN4a++++GymL4URPZBzPCPLPL933wEdOnoCaIHI?=
 =?us-ascii?Q?B4WM6x04dW5YHlcCI5Qds1Rg9vqw0n2WqqqGMfThOAJWL9Elf9Qh8pA0VIbW?=
 =?us-ascii?Q?K3hdZ+0EZY95jqseNSo5EXsEIsRl7qP/jjeccQHMhC5B1P9xkAFTgLH8Kd9V?=
 =?us-ascii?Q?rJ/e1OUyBwpvkB1BrfT3eTfO6Q6Kk/1G0MosLMYjpQ0nfxe8lg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?AeH0n3quKv9I+TXuF+DdZbdMgLcVezcnkffBUKYWuiRmvNDnCNqq3s230pW4?=
 =?us-ascii?Q?p23wSSsti9uT9IoBKJfAmncWNZItE19QyEOm7fs1cBMxP/LZFpvI3v+6Q9a0?=
 =?us-ascii?Q?WPYnK11Fe+DnFdG7eXRuyhRcMFYtEuLgN4Nh0z3Z5Wo7cG8cW8mR0tU+fxse?=
 =?us-ascii?Q?1nLoz5fFw4Wij4If8NogHcPD1131XZg5GLF3vhrgfRAVjL+1WPzcE81aN9Um?=
 =?us-ascii?Q?7j7OXQeofDF/DtXNJsUwYgChy2Q3xkPzigdQXS7lqMM75/bK5cBMsjLBBHVJ?=
 =?us-ascii?Q?vWGG8w/n9S3XWts3xabuNq8t8UfUd7NdqMABaEOVM+RSuhiwfWxdRdXX1fTE?=
 =?us-ascii?Q?oIJhy6TaueVLYeq9gNSJ5XcGNo6p6HpWyvYw7Fhk8dlu4xvP7rS1IuAcD/mE?=
 =?us-ascii?Q?BW2c6CnSc4PCwTNNAoLT3HlViHDo8TGZl/2ePUJODD00lgR7kaG1n3AC+77c?=
 =?us-ascii?Q?9shYpUOag1sQySLUQAgLCNvxEfGeGJhBHINY/SBD1YoC+Pky4MbLzA5qDKMN?=
 =?us-ascii?Q?0OQw2staBqoeBezjr26kEv0PD2D4rsYo30dObhwZscgMCjELHkeYuhyl1KP9?=
 =?us-ascii?Q?j8Sogiddp+tN+Eh+BWORryuG3TpBZqvVtXz4vTflbblUN+485OoAH+67itub?=
 =?us-ascii?Q?LysAHra/nEGrVrTKLA3/K5fDX2FMbAj1SX4zTAlKBfabXjL5ThEDgrYv0ZYA?=
 =?us-ascii?Q?D8PHrDWBIUIKX9neWD1+erF0L/K0HEy9IN8RYBaH53o1+RUafAqWiV73HbMi?=
 =?us-ascii?Q?Z7LIHWk+QNIj9FLLcVIpMd2t8mR7U/UvyN0SWJTbacLweDmlD6x2HOn0WZIi?=
 =?us-ascii?Q?jpgPq5cFh10Cyb0tDkGgHAJsKkOk330DIbxCt9uQRLI5HqyxtxkoTOaWXkpK?=
 =?us-ascii?Q?5Io4Zca+xulywk7MmJbogyst1xXhgUJ2fMBxlbJyFbJw39w6TfNj+nsSUkjO?=
 =?us-ascii?Q?zDrE7KuMiXf/yuEAfnEX4dgoIPrZuXy/FT7fQk4O+wNYIBsYj/G4726VSy3/?=
 =?us-ascii?Q?KNjkGsNKXGdvv7yHBFkAcUZa9+SLRp5D/Px85BaN1Yrk1pW3JbasXagqROfW?=
 =?us-ascii?Q?o8VzsosAAIZ8acX9qkZvf+XY3FhBh/0auzqLc/M+xxRJ53B04dvO2KszeLBk?=
 =?us-ascii?Q?KTNPyUjgP9acPHmrmLg93eekjGOdPPiM7rtnGcjtWpXMwLXobBMpetD6eDFh?=
 =?us-ascii?Q?LR+w95itToQOFCx+AJOAofbIPZn1AITPwVkV+URAtOJmyGdMpuC7HP6C44gU?=
 =?us-ascii?Q?mj3mT/FQ9mt3DQdjug5NuE3p8Nx34C8IT3UqSHPJ5hWF0tgORIdclAHFTlJH?=
 =?us-ascii?Q?reNSAJSDYQEUhO5mWjkS2HvlJu3pQQFTkLgL5IYkAk/5leyuQRkUmGsI2/b/?=
 =?us-ascii?Q?aLhRFZQN1gEwEhGZWDI81NlmV3cXiLJcvfIHB3Ydtm/bOwtYSqvg+fuQw0RK?=
 =?us-ascii?Q?qKFP+Oo6oesQvgjyLfpwNekcGz1rqdpnHirq8kwMwE/jyVj8fK0e0iYfw2qE?=
 =?us-ascii?Q?yJGVQFGYWtW+GjSeDA2GhzQohztl1aDVujBMykXhNYtmSi9vDYRbug6x5aIQ?=
 =?us-ascii?Q?eocRU0d1mAUP2wjue1rFjMbm3aVRTUtMi3m1WUoF?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0749ae1-ef59-4efc-6d56-08dcac0249cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2024 17:01:40.7359 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PGS3bJcQpVGwIlgx3tFNVER8QY7rEDQjwJtDKTm05VVgMat/sXvttyncEyjLrylxo8eRz/PbWJp0ocpiyvZX/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7060
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
> Nemesa Garg
> Sent: Wednesday, July 24, 2024 6:36 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Heikkila, Juha-pekka <juha-pekka.heikkila@intel.com>; Shankar, Uma
> <uma.shankar@intel.com>; Garg, Nemesa <nemesa.garg@intel.com>
> Subject: [PATCH] drm/i915/display: Workaround for odd panning for planar
> yuv
>=20
> Underrun/corruption issue is seen for NV12 format for odd panning on LNL
> due to hardware bug.
> Disable the format.

When describing the commit for a WA no need to mention what the issue is th=
at is described
In the WA number only describe what the patch is doing.

>=20
> HSD: 16024459452

Better to write this as=20
WA: 16024459452=20
>=20
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_atomic_plane.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> index e979786aa5cf..f927e6a0b28b 100644
> --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> @@ -1029,6 +1029,14 @@ int intel_plane_check_src_coordinates(struct
> intel_plane_state *plane_state)
>  		 * This allows NV12 and P0xx formats to have odd size
> and/or odd
>  		 * source coordinates on DISPLAY_VER(i915) >=3D 20
>  		 */
> +
> +		/*
> +		 * Wa_16023981245 for display version 20.
> +		 * Disable odd pan for NV12 format.
> +		 */
> +		if (DISPLAY_VER(i915) =3D=3D 20 && fb->format->format =3D=3D
> DRM_FORMAT_NV12)
> +			return 0;

Also is this the correct implementation of this WA it says to disallow odd =
xpan and disable even xsize I don't
See xsize implementation anywhere.
Next is if we disable odd xpan shouldn't we then program it to allow even x=
pan this returns without doing anything

Regards,
Suraj Kandpal
> +
>  		hsub =3D 1;
>  		vsub =3D 1;
>  	} else {
> --
> 2.25.1


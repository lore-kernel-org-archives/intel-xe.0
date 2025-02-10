Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82BF8C02198
	for <intel-xe@archiver.kernel.org>; Mon, 10 Feb 2025 18:06:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ECEB10E5DE;
	Mon, 10 Feb 2025 18:06:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SXCPxAWp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D79C10E5DE
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Feb 2025 18:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739210781; x=1770746781;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jVmT4GKG9+qFWFt44u/inSML4i35Xk6VUs8Ws0sXgwo=;
 b=SXCPxAWp86HddFUv1sfW4to44Do6E5SW6d2p2y1vD/RNHYDkUbD18TET
 uBhv7SaCBm331EA5NC7iUE2hOrKEDtXhNvKPV1Vb1z6VMkwhR248Dab5Q
 zadz0JOy1zkPNBaf3BxnUCdeg0SdywONYIPG+ttX4L7WmkuG7Tojya10C
 Rj0zTAee3kA6b4LEyu+Rwv294SVIwmuJ0iQ0UlraN0dC/4HOuE0DM5RR4
 d/Ewr51uNAPbG6XuzeexwjQZQ1eOyi5wRjFqAyJQU8t5fgaNF6gO2MpI+
 5FjN4NduDobNTLg3nuVeOGzwzqlNN3hCj19zbLC6Pv/aIjng9jB6Ioxup A==;
X-CSE-ConnectionGUID: AWI9Qd3nRWSjQ7wyADAdkw==
X-CSE-MsgGUID: gY9moP0rSQe4sI8sHymSBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="62280359"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="62280359"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 10:06:20 -0800
X-CSE-ConnectionGUID: ovnzByMjQ3ePoHuq/+7fFA==
X-CSE-MsgGUID: FFFHbyRxQomgkiOP8GQ+iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="117339963"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Feb 2025 10:06:19 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 10:06:18 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 10:06:18 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 10:06:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mrh1i0B0VAMSLnbFj+KQ2x9NtxnjOlezYSIpk/zl8jhYVhWmqKNOGBoo3nPWarFFJMPUexQrvRY/ch3nOVzU5YJlV0Tfrccv8JGKKcoTOPuM2N/na762trD07/gRMjf2wFMs1LznJyPIceoy/XXxy+sq3rQfi7dYtCyW6U1hX4CIiZi6PyJ5eVquLEAxNhV+ba59bJ3cSMGP6b8k8xpe9f9Td4T3MqwDZy4aNwq+PncS9Vukj8aNSK4ZXwMqD7xuv1Dk3oV7+mTGy6eS5lvWOqzvexPzw3h+NUKDgE47suu4wB+Afk2tFk0iH31e+WdEiVEWyDIvdkmd8u+xTqqNoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e/oAXGQUhAtqodTz+qHks6xtkT/oBU3Dtk/Sa0sErXU=;
 b=hwEBh6l2pp49PTe0EdmnbkYM/hJWO+wWq/oyk+zxGZa5vBpLgQmXZE576KLU4Op6lOvM0hcPScd3VtGueeu845LW73APOmxT4DKmrjbBKt/4QDepFgpd3n7pX+A+cd+qPKKFEoVikG3MwNRyJz9YL9H3iHdHyIT5iJkW4fLZtM78FKFs4OWLbMgYC0z9Xaed/QUO+fbi7qamtj5FGnhePS8irVdGPufRTIENsdKiYltOsCL78sx630jwXi9fJ81P3gl3xHD8IHEsELhPD29MqwD8cJvtqem9SyUJyQYf4a2iGgfoiCoLYTJAQeO0KQvRpV//v7/Hzn8TpI65rXCk+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SA1PR11MB5874.namprd11.prod.outlook.com (2603:10b6:806:229::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 18:05:49 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 18:05:48 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Das, Nirmoy" <nirmoy.das@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Das, Nirmoy" <nirmoy.das@intel.com>, "Auld, Matthew"
 <matthew.auld@intel.com>, "Brost, Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH v2 2/2] drm/xe: Add a WARN_ON for NULL job in
 xe_sync_entry_signal
Thread-Topic: [PATCH v2 2/2] drm/xe: Add a WARN_ON for NULL job in
 xe_sync_entry_signal
Thread-Index: AQHaeVVpuVGcW9oJfkiSn3WuJBbdprNC2eJg
Date: Mon, 10 Feb 2025 18:05:48 +0000
Message-ID: <SJ1PR11MB6204FD95B72316F43BF8FF7881F22@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240318164342.3094-1-nirmoy.das@intel.com>
 <20240318164342.3094-2-nirmoy.das@intel.com>
In-Reply-To: <20240318164342.3094-2-nirmoy.das@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SA1PR11MB5874:EE_
x-ms-office365-filtering-correlation-id: 15ea5edb-9279-4c84-3faf-08dd49fd8c78
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?hJ8gymrTZSZMOuE0ljoSpvAJ7ICDVTaRvLBfV7mHidd8zvpvDv4tdb4fbkGp?=
 =?us-ascii?Q?Xb6hvDddmntZupS9oQ3cNNLqQcuPxIdNIjjDaRRScNPMUwTIdk2ufcuv4bG3?=
 =?us-ascii?Q?5C7EokiczE7frlLSe51ToR20Yh2m4oL++5SQG3ylFYY652nHq5R/9kkAbPsF?=
 =?us-ascii?Q?5HSw22qbzQFvbuMV4jZ9fRURJaPxgssWA6mzN6Rj/Q0VgRdMYYgQtOoja+IS?=
 =?us-ascii?Q?ixjlxbz8H3PR6TZcG25uibWBr+fv2Z5K3A6BXyOkFC2CDNm5Wue6jt9/SKTu?=
 =?us-ascii?Q?ypOr1Yt4tj2luDq/bdLQi9LoimHG7A7eJfrz3EfZf3dLk6OkA7RVgxbhIaHv?=
 =?us-ascii?Q?W5sthqRPipO9pl53AdfujWhgSacVE3wzNjxZ7dXf+VL8EE/PP0uuz3aoYeq9?=
 =?us-ascii?Q?j6WObmYRSd4tU/ge1TmUIy3N0GgLuxn+sFDOXi3RJYpNkg/E3i0cir/g6arX?=
 =?us-ascii?Q?Oo14ZO6VlfmtT0RS2R3BZBIttJQbrzbpeDio4gi+BQYrX5FtMs/9JW8Xd7t0?=
 =?us-ascii?Q?D+umophFMGve2CypXXRwIa5H3f2eXtq/FVdqu/lfPS7rrYf/LDtANJRGuU2H?=
 =?us-ascii?Q?XqBC6n/YVP8uI1NLneDdmrWHwaAzeWonW9w+3QlX+7PVLI0ffDBVex29fxoI?=
 =?us-ascii?Q?+bT0B2+UvvpVoH7oUuYMbXpfVAKk82svG/nt/xip1Txy+pe0r7f+dDnfvrVL?=
 =?us-ascii?Q?SYnqUS3XLuAuV/y7u5Wy/E2Aj08lxFsZZDjiw0sIsvuUopkk0oID24WqeMQn?=
 =?us-ascii?Q?spUwKShO8IZgV4EpS8QL24kDDTcUqF7dQM7xAN4PrPWu20PcFFenTsm6PcDC?=
 =?us-ascii?Q?yDH9lkfgxmLIVHuMJXIlsLtCR8w9QWOt4GDvQYB/SrMVehI8Um39/DiPGzh0?=
 =?us-ascii?Q?tuG7qW7I9ZH76qzU791aStIAO96oKUnIXfdNEz83QLyww9e9d3DqrfYKs0e5?=
 =?us-ascii?Q?57D5vwVo9lp2m5W/BwlJDuF5PWjNzPiXNYHEFh3kmdQ31p6Xk2+MSFh+Q1y8?=
 =?us-ascii?Q?4C35YE4yOiIQZ1Pk2K3ie9it2JYUU+gzBCECnTIJpnSEUC6CkPz961rUpzb/?=
 =?us-ascii?Q?Vl6GGVL12HZd3kFI3RAyXi3PjEt+Wy8CdiFFPACnZfQ9xvTC9Doe2C8hz7YT?=
 =?us-ascii?Q?zR0wEgF9kDhfpiAJ45bgBNLeDU9rlWLkarTcTiADtU9VjYCpuY/T08ZqLQHm?=
 =?us-ascii?Q?gL+ZrrqEiHi2H3qbrx3X90FFMFx/NQOBGLg/GJuPXTo92yUEUynGCBTt+HGN?=
 =?us-ascii?Q?yS9cIi6BFcsb4QDN7U9CTRtcDyboJRVMexcpPqASRMtW3ntreXKDk/iuUZKH?=
 =?us-ascii?Q?x64+/HZOFnsGq3bBl/7NePEKz5yPrxZmG4qNSREg6kP9QXBPXeOkSpgAnwWl?=
 =?us-ascii?Q?Y3nrfl0deNPxQnJm2R/Tgpu+ZVG8MyxYaOt6dnihJ7+RLQcLIhN4BxVDfsPi?=
 =?us-ascii?Q?cf9CzyY6Qo8uH0TxWDbHoBLgbdEaXo3P?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kcHjrcJ1RVfeAwHTA5DlnkYWKqQTnkEuuxst/tv1/0tmcLT6QbTuqqf+Eus3?=
 =?us-ascii?Q?9ir70VCVFlQaJ2TjK92gDNFZWwnSybnEn9cTugaJB3WsEB8PYqk7GVbFVd9A?=
 =?us-ascii?Q?5Oa72s+f0ZXxC3y9shjoEACIZxrgf+ta3CZXbW51n4H1d5G0btTW+iQXAQGw?=
 =?us-ascii?Q?B4TTQeQqebH0MuaFZylL1qn8prpkmAtAPKgdO3gegFsD2HWBvaCkm7QN6I1c?=
 =?us-ascii?Q?JwumJJHAASACncE1GV6K4jZ2MNg4n58Cr3Nin0LE9dN//y4tl/3vwXy594PF?=
 =?us-ascii?Q?JjPusn3nHpSeLuamgYIvk9/amu3cnvoZlP+xTRcBuzbZXej84VNOmEFlIazZ?=
 =?us-ascii?Q?HjL8C3jZ7oPLb5ehXfMDjD4GF5AHAVgoC5x7zGGW3lD8w34ugk7icDKyZk3R?=
 =?us-ascii?Q?lwP7PiRogFkbZuh0hDvWuTdwouw6z2aqdFlEMMBe/R34U2Dzj2W3F5+CEb/x?=
 =?us-ascii?Q?ih4ollZBezLPsZt7JaZSkWz8hXwH06Q/mf4+voW3HXyRTRsKRQCvZUMFSEei?=
 =?us-ascii?Q?Zy4pC/2gSUl09j6cBGkhXEcDCSTi3+yeVaR9C5YrzLsEdPQRj3uSfGVFd/5z?=
 =?us-ascii?Q?7R5pHEKx+wiAndTKm7jseITyd4JNcDDZGar8H2In8XWPOgtvhwEx/PXtuyD1?=
 =?us-ascii?Q?VSJegDLIPkDo8f6CcYrYAyduVRaOL617PXgwJn4Gl9/N/ZQxmMgjmhKphuxD?=
 =?us-ascii?Q?Zl5LPfT8LdUXUwhXZPd1cU73Z1uwFINuYQ+yEz3VO6N1Vxyw5DQoxvyahgoD?=
 =?us-ascii?Q?TX1NRvbT4pW/VrEsSfggaRpSMgs24InOYq4qYgEpozV2IKi1W6ssH4whmjyC?=
 =?us-ascii?Q?7ca6CLblhntout9yNSA9MDm3d/+BDtMhgM6BDlBQduq/B8Iu5nQ8XtyrjMYh?=
 =?us-ascii?Q?tESkHI0z8rQ3LyS1IUoudN+EtVpzeYJ2miKVPWVGvgXlrfE7fR2sMQo/2tDw?=
 =?us-ascii?Q?+hVcZpgX4GK/ZJf1bPdXLHKirsOstevW8nLohpB70//j41pFE4bNN4TOgE8w?=
 =?us-ascii?Q?ANSK523E4UP08U6IEg/FjPY48eX+TxywovpdX3hcjdWnL1sVWCuN3vrx4AQp?=
 =?us-ascii?Q?nxxC5EfocpSnUl4JCfFehQbsR+Y02//P16fOg5hgccPOTQAmJW1Qk2rvHFB/?=
 =?us-ascii?Q?AHirhvcXAkbu/Bp6WeWnYo7iNSLKjcSi0/JB9DI6GqiMAL1lm2hfK+eHocwT?=
 =?us-ascii?Q?uQSKEH66hYfbGydxRCjOKm5C9utl7nYHKbfWY8mLRM17xLrHCDOiNIOg+yed?=
 =?us-ascii?Q?uMh/o6pCyb336bZ10A6Z7X0iymsDk/dAMCnEEScEtU4D0zEIrsE3R8mAKUDk?=
 =?us-ascii?Q?DU/NWafaBu8BIPyM6MPlad8Zp7rKyUOWMnhHAF47+b4Pq2ClWKhWXxTlaDsw?=
 =?us-ascii?Q?aLd6uqNexM5R8NQB7thl40PAy+3M8T+/wnlnOs1xOIOavoTCgoJ90lApPngz?=
 =?us-ascii?Q?s7D5PpDN1onDAv1e2YC3glJ1pxuBD75WKm294WvZjmt/CLMvQmzTtT+/4Jt/?=
 =?us-ascii?Q?2Jzpi1lLAcE+TqSClwpPuxOg2yg4qhIPL3XSmDPg75jOwLF2YV8LZh5iqS2f?=
 =?us-ascii?Q?dH5y4MiUX+gGrs7q+GkmtC9EspYCo4Ze/xFqUPPo?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15ea5edb-9279-4c84-3faf-08dd49fd8c78
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 18:05:48.8236 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3s0Xm63IRZajYR54hEB97JInPgL+LufNetVvXj6OQOfXTM2mqZeotn3xXlKxnt31dE4CMDcN9fdcNe1aCzMTKVsXN1SdB/F9Q1S2F+JT0oY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5874
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Nirm=
oy
> Das
> Sent: Monday, March 18, 2024 10:14 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Das, Nirmoy <nirmoy.das@intel.com>; Auld, Matthew
> <matthew.auld@intel.com>; Brost, Matthew <matthew.brost@intel.com>
> Subject: [PATCH v2 2/2] drm/xe: Add a WARN_ON for NULL job in
> xe_sync_entry_signal
>=20
> Add a warn for NULL job when sync->type is
> DRM_XE_SYNC_TYPE_USER_FENCE. This should be a programming error and
> should never happen so warn and let the kernel crash if that ever happens=
.
>=20
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sync.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> index 02c9577fe418..247505c3478d 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c
> @@ -255,6 +255,7 @@ void xe_sync_entry_signal(struct xe_sync_entry *sync,
> struct xe_sched_job *job,
>  			dma_fence_put(fence);
>  		}
>  	} else if (sync->type =3D=3D DRM_XE_SYNC_TYPE_USER_FENCE) {
> +		XE_WARN_ON(!job);

LGTM,
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

>  		job->user_fence.used =3D true;
>  		job->user_fence.addr =3D sync->addr;
>  		job->user_fence.value =3D sync->timeline_value;
> --
> 2.42.0


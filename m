Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD4CBC5DF81
	for <intel-xe@archiver.kernel.org>; Thu, 20 Aug 2026 23:07:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 689E710F1CE;
	Thu, 20 Aug 2026 23:07:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BJNCkCIq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B35510F1CE
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Aug 2026 23:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787267257; x=1818803257;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZPQfy/l1fw0u6l1TZJ7l3JsEG2u7hAGh21yx/M5JjAk=;
 b=BJNCkCIq9ppyVnDsDZ5TEGCdI/bDMAQye6GbOrSYQSClOiJRTNgMfLre
 U1wZw5abh6BHQ5ElcxWiljPKmXyNXqNj5OClM63He01vmsYkxKdPn29/b
 P0yHIrNrc997otroJILFR6uGavC2KNBhAwUTlwFBMxJEQaVOveobHNl8T
 r6QizWnd0IihIXObZ0j9u0USjsjsuXRrwLRW/+dOt9UY0m6ua7vX8rQvD
 KbeFTAY29u+bDfEIEAza4yOUTsPnzm5S1DZC7Gp0/k3v4yGsMloFyO+13
 E/e63gjC7pQoD99MChsb0W6Ojnsm3XXY+UK3z3nL3mKEjIvASi7KVDp1T w==;
X-CSE-ConnectionGUID: MEIB2X5XSpOBR8LIXlQZFg==
X-CSE-MsgGUID: haG84VvhSLWGQBReZMMSHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="91687911"
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; d="scan'208";a="91687911"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 16:07:37 -0700
X-CSE-ConnectionGUID: 7PHUlmjmT/emDXIiSSWZ5g==
X-CSE-MsgGUID: P1I9pB4xQhSxTt7NzKOQRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; d="scan'208";a="266230811"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 16:07:36 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 16:07:35 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 20 Aug 2026 16:07:35 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.58) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 16:07:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HtlZD7OGNNWdYiHACQxbdle2pA8ed2CWO0BHNtc25dF2dEE2PrtaIW4PyrdYnPfTmuwy570+lPT1KXGAzXgsbe+WUU8UDG5e7e7IjZPYwxvc8NYJhXlFSrGfat4ywK4cyjbVvjap9E0cOa0IVMAAbVMMv5lWJWU0VP1G6uJgd33KpiwxAGb/LOjuiplYsIxlhmcX1Dpa9WYuppJ5zBt9vykwyyuufitK1mX5WD3fqxBWpRZSzE/LjQ/zPHpfIlthQwohe0NdTC6TMC4Ig/3Zo39qJaDqdFHHraVTc5djxoIyaFuzHcFdzNWZ0qkDFebipLGt3g5Y1DXzUhEY17unug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZPWgC/zi2J207cOdBWRZwNhJnBmAG6Z2I4jsS9NnzDU=;
 b=Cjd4NdqhfxY6k0E9HdDVALbtNlH3ORq8J/C7nAX/ZyIy+4GpGHrJ3pWITnhaWPDsuEpwehcH3LALMR7N5nbfUi//0WcdXDWZmKNf83RN2l6p2bC676vmSYQVFISNzciO6qDvQ/46txs48V9gWfUvbCDYnHEXnhjjs2JHlML+Z5uS+EYvumEotlFFLP9gZliVgpLX0f1urxNydARXiM7rbP6RLzrWwlhbYnS89IWJnwwYQGFucoppkCJjXyPAcjwHdUfTUoippA95I6n7t8h96IjmzDSoUxuQVEQWopCc+ka1DosllC6k2rg1DA/bLqdKWqLRxqP5LXNLRql17iIjag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH8PR11MB8040.namprd11.prod.outlook.com (2603:10b6:510:238::11)
 by IA1PR11MB7344.namprd11.prod.outlook.com (2603:10b6:208:423::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 23:07:32 +0000
Received: from PH8PR11MB8040.namprd11.prod.outlook.com
 ([fe80::89bf:2274:1371:50c5]) by PH8PR11MB8040.namprd11.prod.outlook.com
 ([fe80::89bf:2274:1371:50c5%3]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 23:07:32 +0000
From: "Yao, Jia" <jia.yao@intel.com>
To: "Bai, Zongyao" <zongyao.bai@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH v5 2/4] drm/xe/forcewake: add delayed-release state machine
Thread-Topic: [PATCH v5 2/4] drm/xe/forcewake: add delayed-release state
 machine
Thread-Index: AQHdKrewvvnj0Gf2yEihM6QBABSrr7anm9xA
Date: Thu, 20 Aug 2026 23:07:32 +0000
Message-ID: <PH8PR11MB804039DBCA83DC40E00BB392F4A42@PH8PR11MB8040.namprd11.prod.outlook.com>
References: <20260601213804.707256-1-zongyao.bai@intel.com>
 <20260813000654.2712317-1-zongyao.bai@intel.com>
 <20260813000654.2712317-3-zongyao.bai@intel.com>
In-Reply-To: <20260813000654.2712317-3-zongyao.bai@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB8040:EE_|IA1PR11MB7344:EE_
x-ms-office365-filtering-correlation-id: 400ba9c9-af29-412c-05e2-08deff0fd0ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|42112799006|38070700021|4143699003|56012099006|10067099003|11063799006|18002099003|22082099003;
x-microsoft-antispam-message-info: V5oqg5EKInOJ/uebSW+T73A7P1Qo3PoDZRoDMjd2iFYLIHAyPzWXHH+1m+ePAc76wb86+zFR6taNeAo3errvggg/wYs3XiC7fgKY9EsEHX2N+aGnAUVEaHv8L+4xS5ReeMcWSWm4ParXldaMFGuC3Wi9XNM9iiCXqRESAlifOGlD5p1dr9qP7/bWe/e4JefnlydjMMbRxCmlvZ8FFzWrRt08EgSBl5uoWHqW7Q1ZSbSWXg6pEtcOFpWiEozx58m1EjwtDMoUaKEy/bRZKjxQ/gUjWwth8SqL6DJgXV8UQGzK6avA+rf4XGrKwLtMGTFvlRAZck8Gtavo6gOS2bsM3zyhtdRZraRIMwpmcrnnCOi+cCoEOeFA3/5zmKjfnxeEAz+OOzAqg/qhJESu3BIy0Fs1JwaRQda6d5jec4e8pU9ZyItCvIJGulhJ36kICwIb/Jctp6dhEO5hGvdflvHzQw+KHsLvoyxFvPUofY02vMQnl1O5Dbg0S8i+Sd16QPC3iqmiJCm/jIhUvMbgxIAD0c3pPmi87I3f1iP2kg4ZvPY+pLjUm08mrrnOTVp94Om3s20tOpsydn8VkDmAX2CfF5iRQ+yVsuH+1JemMx+1Ed6Zi7436feFkGcOG3XHJMfOHa0PbbrkF0jjfdVSGCSg6e7Zy2AwZ9esRb/Tmp8n2hrNjb7+sTjMaqjc7OJkV1B6tTUyrRh9B/iZLJRbW7BnFW4G5rQNjtCRZNROiiNk7yE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8040.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(42112799006)(38070700021)(4143699003)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/CXMWr6E/sKBKJMYUu+qmREUdgNWaYlk/jj32o/hfA7xbdtdfxYgezL+9r98?=
 =?us-ascii?Q?mpqyFb1Qvkbtmjj3SVSbXvlw+JoiPInQ5/HLUwGHW7W+5E4Uje/oanN/vIdJ?=
 =?us-ascii?Q?WZ21EYEtpSF4HI2E5gbmcovmQ51pAGEQOpfYuV0VVh7SO4pOskZRgpHs5Cg6?=
 =?us-ascii?Q?Zj+XpcNf4J5TLzLAIvy1uchKj+cIP7LnQv3whuZvANbF0Ygfau6UYOysvckK?=
 =?us-ascii?Q?QHMiCvmatY4K7QetmlV/hDnFXRU5LqiROBd7cNaUrckGL1X0ZV3NSdXyboIM?=
 =?us-ascii?Q?r/uV1w+1Mz1kePWwsUn8+u4peRzYMuMcsF78S8XV47B/ZtQbBZy489upGwQL?=
 =?us-ascii?Q?5sVBw6FRTIA11kHzRr/6vjiDq70oU24jqxV+fEBsVQ9dZBXv1dSsfQfl9EvG?=
 =?us-ascii?Q?Dhr8CmrzQdGegcE9n6BjUhX/YcbqvENCd3924/i59445eMQuyxC8C7mBSy+u?=
 =?us-ascii?Q?BtpVkG7cK3YNkz4G25F5fNkktaDyJ3b7rvGXx8G8M122XiWOpR+gxVB0Tk7P?=
 =?us-ascii?Q?NquQTMVEmsw8pX3cWpECOZS0lI1HYO3MrgNT2HNJtoPJcahy/qrAQZiKu3F8?=
 =?us-ascii?Q?6SXOsJQHs9aKR9xrDm5RNhZLAC2JvGDAq9NkvXkuhK3FwwXZqG42RUKAN3zn?=
 =?us-ascii?Q?AtWQy3NKhLP96rCUBh6/9aeAYxfNvvU0Z4spo4xkf0YEcQ670jiDKY3UpKBP?=
 =?us-ascii?Q?1ptVYkwyIfj7WifcYwzHU9xBZefiTUOZSAJeWZg2z40RfioIdribsu2gU4Ij?=
 =?us-ascii?Q?A+fqI60t2q5bejhwqKXD1n8I6eTKwO3pcOd/iBC+G8lV7nO2WQNvdVrNcYH0?=
 =?us-ascii?Q?Qi0IJq5mqDpg+beey0u1eQ0DKgQwVNqw366jU3rDwFuS3GQ37KrJcPKZGhXQ?=
 =?us-ascii?Q?zHtB9PbUx1MaHDbrZ8W4Ic/UV15NEjWhWalgloOxKUmcA1MTHkgAf/wICyP/?=
 =?us-ascii?Q?4WrR+fnOmXWC7eVQCVLfgMHirDnQ/5HHv3sojNv5zgLM4ctuwBlrhUrigbu5?=
 =?us-ascii?Q?bPnVoEK7yphs/Nv6johRYqcE7UwkMjGwupebPLITvxGgVJZBEmpK1C89EJZH?=
 =?us-ascii?Q?JtT4WSIWiKPEgjJNC3kjufQwYSCTxV4LMvm01T7Eu3NbdxCo5vJZeZddrLR8?=
 =?us-ascii?Q?j5dGBhZpngkZMYle5MqmZLEitIAGE5zIuNIa72FZ933D2U5NWoxwUvGPuyLT?=
 =?us-ascii?Q?IV6A6Yc2l1KAaNPs6vB0rFf+M+/y31TxyNK9MmLdF0RTmP9mH7UsyR71x/8L?=
 =?us-ascii?Q?W4PXmPig/M1t+JdQld4iOBtrpe1gchSHgVWwmYPWu2MZFQMCl3Stvg7+sOF+?=
 =?us-ascii?Q?6r5OqoFHeAWhByl9IbDNvJBmY539DIAyRQihpvcCzPqZhyWxdOnjiCggHsAt?=
 =?us-ascii?Q?L24NCOJxLW4RLl0Izm6FXDde+hdkhAmbJlcRGuF1637q3gChgfErMhNSu3G5?=
 =?us-ascii?Q?1r+hJPuvYEOEPtNxY0Rsip1dV5Qjxo/+eo53BHS8jo1nfMV4f0qx6cjXZujP?=
 =?us-ascii?Q?kOgExkUFZ33V4DJHwHCyQ2qLPPj9qs+HmJgjVIWFASBSRNgPQr+DVerjhMNv?=
 =?us-ascii?Q?5MdLo4WXO/0e/XPacYg9XJbaO+NCfBBp0Nwepoo9t4F8Bpze246dXNwFCCwf?=
 =?us-ascii?Q?a187EbC7oWPv6NL58otDmZH98sz66Xy9/bUuuhDwx/BQ/iRdPTfo5TTaY2Jj?=
 =?us-ascii?Q?+m5uNovYclV63PFa/Ziho6YsaekUgPmNniSTIhefy4ZUqYQ9?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: WGInl18aShVoiVY3/3h9y6hjqL9uQ0/xOo0B9gMdTmJ+VzyGYglbaUiEjulgx/oCsEZKokVcakAQVcCwztnmbcsGuvbDPiIQyIK5JmcrEZoH0McKYRAQlnnYn/tMZohK7bNq0m3r/4QNMZ9yUiXVu7ElEzY+DTDO9a5n+tMlM3jCzi0eKrT6oJIvOMwsfsBry9ieeWhQIt162i4XiX6nohUUtpjdb0bDtuNKl0AC2arHF0zHAcJz5aCkWGg/bmhvQ305mzgy7Ea468m/d//bKMvSaiyBqQYIE5W3TqRL2GwLalD6JvTYsjk/rBNSe6qtrQtYSWfCn/+c4A+SDrvUiA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8040.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 400ba9c9-af29-412c-05e2-08deff0fd0ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2026 23:07:32.3519 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +VHyM2y15qpLUqyLCqO/mA8zO8MyEwAoZPqw+SG/b6flGVt3CwEfRVrBwUgPYQQHnCZEhhaxes2rvBHT0mmvLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7344
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

Reviewed-by: Jia Yao <jia.yao@intel.com>

> -----Original Message-----
> From: Bai, Zongyao <zongyao.bai@intel.com>
> Sent: Wednesday, August 12, 2026 5:07 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Yao, Jia <jia.yao@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>; Bai, Zongyao <zongyao.bai@intel.com>
> Subject: [PATCH v5 2/4] drm/xe/forcewake: add delayed-release state
> machine
>=20
> Add an opt-in forcewake release path that keeps an idle domain awake for =
a
> short hold interval. A subsequent get can reuse the domain without issuin=
g
> another wake request or waiting for its ACK. Without a recorded delayed-
> release request, normal puts release immediately.
>=20
> If a delayed release is requested while other references remain, whicheve=
r put
> drops the final reference honors that request.(Matt)
>=20
> Use a per-domain hrtimer and state protected by the forcewake lock to
> preserve a newer hold interval armed while an older timer callback is run=
ning.
> Remember delayed-release requests while other references remain, and
> reconcile timer-issued sleep acknowledgments before a subsequent
> wake.(Sashiko, Matt)
>=20
> Register a devm cleanup action to synchronously cancel the timers before =
the
> forcewake state is destroyed.(Sashiko, Matt)
>=20
> This patch provides only the infrastructure; no caller opts in yet.
>=20
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Assisted-by: GitHub-Copilot:gpt-5.6-sol
> Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_defaults.h         |   1 +
>  drivers/gpu/drm/xe/xe_device.c           |   2 +
>  drivers/gpu/drm/xe/xe_device_types.h     |   3 +
>  drivers/gpu/drm/xe/xe_force_wake.c       | 166 ++++++++++++++++++++---
>  drivers/gpu/drm/xe/xe_force_wake.h       |  23 +++-
>  drivers/gpu/drm/xe/xe_force_wake_types.h |  26 +++-
>  drivers/gpu/drm/xe/xe_gt.c               |   5 +-
>  7 files changed, 204 insertions(+), 22 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_defaults.h
> b/drivers/gpu/drm/xe/xe_defaults.h
> index 0884224ef7c7..de009af8c77f 100644
> --- a/drivers/gpu/drm/xe/xe_defaults.h
> +++ b/drivers/gpu/drm/xe/xe_defaults.h
> @@ -22,6 +22,7 @@
>  #define XE_DEFAULT_WEDGED_MODE
> 	XE_WEDGED_MODE_UPON_CRITICAL_ERROR
>  #define XE_DEFAULT_WEDGED_MODE_STR		"upon-critical-error"
>  #define XE_DEFAULT_SVM_NOTIFIER_SIZE		512
> +#define XE_DEFAULT_FORCE_WAKE_HOLD_DELAY_US	100
>  #define XE_DEFAULT_NUM_PF_WORK			2
>=20
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 81b31325e581..21d02809c3a4 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -552,6 +552,8 @@ int xe_device_init_early(struct xe_device *xe)
>=20
>  	xe_device_parse_modparam(xe);
>=20
> +	xe->forcewake_hold_delay_us =3D
> XE_DEFAULT_FORCE_WAKE_HOLD_DELAY_US;
> +
>  	err =3D xe_irq_init(xe);
>  	if (err)
>  		return err;
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> b/drivers/gpu/drm/xe/xe_device_types.h
> index 180d450a6deb..4c16bb7e44bb 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -568,6 +568,9 @@ struct xe_device {
>  	/** @min_run_period_pf_ms: LR VM (page fault mode) timeslice */
>  	u32 min_run_period_pf_ms;
>=20
> +	/** @forcewake_hold_delay_us: Delayed forcewake release window in
> microseconds. */
> +	u32 forcewake_hold_delay_us;
> +
>  #ifdef TEST_VM_OPS_ERROR
>  	/**
>  	 * @vm_inject_error_position: inject errors at different places in VM
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c
> b/drivers/gpu/drm/xe/xe_force_wake.c
> index 197e2197bd0a..3f5013c7424c 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -6,12 +6,17 @@
>  #include "xe_force_wake.h"
>=20
>  #include <drm/drm_util.h>
> +#include <linux/cleanup.h>
> +#include <linux/device.h>
> +#include <linux/hrtimer.h>
>=20
>  #include "regs/xe_gt_regs.h"
>  #include "regs/xe_reg_defs.h"
> +#include "xe_device.h"
>  #include "xe_gt.h"
>  #include "xe_gt_printk.h"
>  #include "xe_mmio.h"
> +#include "xe_pm.h"
>  #include "xe_sriov.h"
>=20
>  #define XE_FORCE_WAKE_ACK_TIMEOUT_MS	50
> @@ -27,6 +32,8 @@ static void mark_domain_initialized(struct
> xe_force_wake *fw,
>  	fw->initialized_domains |=3D BIT(id);
>  }
>=20
> +static enum hrtimer_restart xe_force_wake_domain_timer(struct hrtimer
> +*timer);
> +
>  static void init_domain(struct xe_force_wake *fw,
>  			enum xe_force_wake_domain_id id,
>  			struct xe_reg reg, struct xe_reg ack) @@ -38,11
> +45,24 @@ static void init_domain(struct xe_force_wake *fw,
>  	domain->reg_ack =3D ack;
>  	domain->val =3D FORCEWAKE_MT(FORCEWAKE_KERNEL);
>  	domain->mask =3D FORCEWAKE_MT_MASK(FORCEWAKE_KERNEL);
> +	domain->fw_back =3D fw;
> +	hrtimer_setup(&domain->sleep_timer, xe_force_wake_domain_timer,
> +		      CLOCK_MONOTONIC, HRTIMER_MODE_REL);
>=20
>  	mark_domain_initialized(fw, id);
>  }
>=20
> -void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
> +static void xe_force_wake_fini(void *arg) {
> +	struct xe_force_wake *fw =3D arg;
> +	struct xe_force_wake_domain *domain;
> +	unsigned int tmp;
> +
> +	for_each_fw_domain(domain, fw, tmp)
> +		hrtimer_cancel(&domain->sleep_timer);
> +}
> +
> +int xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
>  {
>  	struct xe_device *xe =3D gt_to_xe(gt);
>=20
> @@ -58,6 +78,8 @@ void xe_force_wake_init_gt(struct xe_gt *gt, struct
> xe_force_wake *fw)
>  			    FORCEWAKE_GT,
>  			    FORCEWAKE_ACK_GT);
>  	}
> +
> +	return devm_add_action_or_reset(xe->drm.dev, xe_force_wake_fini,
> fw);
>  }
>=20
>  void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *=
fw)
> @@ -148,6 +170,59 @@ static int domain_sleep_wait(struct xe_gt *gt,
>  	return __domain_wait(gt, domain, false);  }
>=20
> +static void assert_domain_state(struct xe_force_wake *fw,
> +				struct xe_force_wake_domain *domain) {
> +	unsigned int domain_mask =3D BIT(domain->id);
> +
> +	lockdep_assert_held(&fw->lock);
> +	xe_gt_assert(fw->gt,
> +		     !domain->delayed_release_requested || domain->ref);
> +	xe_gt_assert(fw->gt,
> +		     !(fw->delayed_release_domains & domain_mask) ||
> +		     !domain->ref);
> +	xe_gt_assert(fw->gt,
> +		     !(fw->sleep_ack_pending_domains & domain_mask) ||
> +		     !domain->ref);
> +	xe_gt_assert(fw->gt,
> +		     !(fw->sleep_ack_pending_domains & domain_mask) ||
> +		     !(fw->awake_domains & domain_mask));
> +	xe_gt_assert(fw->gt,
> +		     !(fw->sleep_ack_pending_domains & domain_mask) ||
> +		     !(fw->delayed_release_domains & domain_mask)); }
> +
> +static enum hrtimer_restart xe_force_wake_domain_timer(struct hrtimer
> +*timer) {
> +	struct xe_force_wake_domain *domain =3D
> +		container_of(timer, struct xe_force_wake_domain,
> sleep_timer);
> +	struct xe_force_wake *fw =3D domain->fw_back;
> +	struct xe_gt *gt =3D fw->gt;
> +
> +	xe_gt_assert(gt, !xe_pm_runtime_suspended(gt_to_xe(gt)));
> +
> +	guard(spinlock_irqsave)(&fw->lock);
> +	assert_domain_state(fw, domain);
> +
> +	if (!(fw->delayed_release_domains & BIT(domain->id)) || domain-
> >ref)
> +		return HRTIMER_NORESTART;
> +
> +	/*
> +	 * The core dequeues an expiring timer before invoking its callback, so
> +	 * a queued timer here is a newer hold interval armed by put().
> +	 */
> +	if (hrtimer_is_queued(timer))
> +		return HRTIMER_NORESTART;
> +
> +	fw->delayed_release_domains &=3D ~BIT(domain->id);
> +	fw->sleep_ack_pending_domains |=3D BIT(domain->id);
> +	domain_sleep(gt, domain);
> +	fw->awake_domains &=3D ~BIT(domain->id);
> +	assert_domain_state(fw, domain);
> +
> +	return HRTIMER_NORESTART;
> +}
> +
>  /**
>   * xe_force_wake_get() : Increase the domain refcount
>   * @fw: struct xe_force_wake
> @@ -176,6 +251,7 @@ unsigned int __must_check xe_force_wake_get(struct
> xe_force_wake *fw,
>  	struct xe_gt *gt =3D fw->gt;
>  	struct xe_force_wake_domain *domain;
>  	unsigned int ref_incr =3D 0, awake_rqst =3D 0, awake_failed =3D 0;
> +	unsigned int sleep_failed =3D 0;
>  	unsigned int tmp, ref_rqst;
>  	unsigned long flags;
>=20
> @@ -186,11 +262,29 @@ unsigned int __must_check
> xe_force_wake_get(struct xe_force_wake *fw,
>  	ref_rqst =3D (domains =3D=3D XE_FORCEWAKE_ALL) ? fw-
> >initialized_domains : domains;
>  	spin_lock_irqsave(&fw->lock, flags);
>  	for_each_fw_domain_masked(domain, ref_rqst, fw, tmp) {
> +		assert_domain_state(fw, domain);
>  		if (!domain->ref++) {
> -			awake_rqst |=3D BIT(domain->id);
> -			domain_wake(gt, domain);
> +			if (fw->sleep_ack_pending_domains & BIT(domain-
> >id)) {
> +				if (domain_sleep_wait(gt, domain))
> +					sleep_failed |=3D BIT(domain->id);
> +				fw->sleep_ack_pending_domains &=3D
> ~BIT(domain->id);
> +				awake_rqst |=3D BIT(domain->id);
> +				domain_wake(gt, domain);
> +			} else if ((fw->awake_domains & BIT(domain->id)) &&
> +				   (fw->delayed_release_domains &
> BIT(domain->id))) {
> +				fw->delayed_release_domains &=3D
> ~BIT(domain->id);
> +				/*
> +				 * A running callback will re-check the cleared
> bit and
> +				 * nonzero reference under fw->lock before
> issuing sleep.
> +				 */
> +				hrtimer_try_to_cancel(&domain-
> >sleep_timer);
> +			} else {
> +				awake_rqst |=3D BIT(domain->id);
> +				domain_wake(gt, domain);
> +			}
>  		}
>  		ref_incr |=3D BIT(domain->id);
> +		assert_domain_state(fw, domain);
>  	}
>  	for_each_fw_domain_masked(domain, awake_rqst, fw, tmp) {
>  		if (domain_wake_wait(gt, domain) =3D=3D 0) { @@ -203,6 +297,9
> @@ unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
>  	ref_incr &=3D ~awake_failed;
>  	spin_unlock_irqrestore(&fw->lock, flags);
>=20
> +	xe_gt_WARN(gt, sleep_failed,
> +		   "Forcewake domain%s %#x failed to acknowledge pending
> sleep request\n",
> +		   str_plural(hweight_long(sleep_failed)), sleep_failed);
>  	xe_gt_WARN(gt, awake_failed, "Forcewake domain%s %#x failed to
> acknowledge awake request\n",
>  		   str_plural(hweight_long(awake_failed)), awake_failed);
>=20
> @@ -212,23 +309,14 @@ unsigned int __must_check
> xe_force_wake_get(struct xe_force_wake *fw,
>  	return ref_incr;
>  }
>=20
> -/**
> - * xe_force_wake_put - Decrement the refcount and put domain to sleep if
> refcount becomes 0
> - * @fw: Pointer to the force wake structure
> - * @fw_ref: return of xe_force_wake_get()
> - *
> - * This function reduces the reference counts for domains in fw_ref. If
> - * refcount for any of the specified domain reaches 0, it puts the domai=
n to
> sleep
> - * and waits for acknowledgment for domain to sleep within 50 milisec
> timeout.
> - * Warns in case of timeout of ack from domain.
> - */
> -void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref)
> +static void __xe_force_wake_put(struct xe_force_wake *fw, unsigned int
> fw_ref,
> +				bool delayed_release)
>  {
>  	struct xe_gt *gt =3D fw->gt;
> +	struct xe_device *xe =3D gt_to_xe(gt);
>  	struct xe_force_wake_domain *domain;
> -	unsigned int tmp, sleep =3D 0;
> +	unsigned int tmp, sleep =3D 0, ack_fail =3D 0;
>  	unsigned long flags;
> -	int ack_fail =3D 0;
>=20
>  	/*
>  	 * Avoid unnecessary lock and unlock when the function is called @@ -
> 242,12 +330,24 @@ void xe_force_wake_put(struct xe_force_wake *fw,
> unsigned int fw_ref)
>=20
>  	spin_lock_irqsave(&fw->lock, flags);
>  	for_each_fw_domain_masked(domain, fw_ref, fw, tmp) {
> +		assert_domain_state(fw, domain);
>  		xe_gt_assert(gt, domain->ref);
>=20
>  		if (!--domain->ref) {
> -			sleep |=3D BIT(domain->id);
> -			domain_sleep(gt, domain);
> +			if (delayed_release || domain-
> >delayed_release_requested) {
> +				domain->delayed_release_requested =3D false;
> +				fw->delayed_release_domains |=3D BIT(domain-
> >id);
> +				hrtimer_start(&domain->sleep_timer,
> +					      us_to_ktime(xe-
> >forcewake_hold_delay_us),
> +					      HRTIMER_MODE_REL);
> +			} else {
> +				sleep |=3D BIT(domain->id);
> +				domain_sleep(gt, domain);
> +			}
> +		} else if (delayed_release) {
> +			domain->delayed_release_requested =3D true;
>  		}
> +		assert_domain_state(fw, domain);
>  	}
>  	for_each_fw_domain_masked(domain, sleep, fw, tmp) {
>  		if (domain_sleep_wait(gt, domain) =3D=3D 0) @@ -261,6 +361,36
> @@ void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref)
>  		   str_plural(hweight_long(ack_fail)), ack_fail);  }
>=20
> +/**
> + * xe_force_wake_put - Release forcewake domains
> + * @fw: Pointer to the force wake structure
> + * @fw_ref: Result from xe_force_wake_get()
> + *
> + * Drops the referenced domains. The final put requests sleep and waits
> +for
> + * its ACK, unless a delayed release was previously recorded for the dom=
ain.
> + */
> +void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref) {
> +	__xe_force_wake_put(fw, fw_ref, false); }
> +
> +/**
> + * xe_force_wake_put_delay - Release forcewake after a delay
> + * @fw: Pointer to the force wake structure
> + * @fw_ref: Result from xe_force_wake_get()
> + *
> + * Drops references like xe_force_wake_put(), but delays the sleep
> +request
> + * when the final reference is released. A get before the timer expires
> +reuses
> + * the awake domain without forcewake MMIO; otherwise the timer requests
> sleep.
> + *
> + * If references remain, the delayed release is recorded and honored by
> +the
> + * put that releases the final reference.
> + */
> +void xe_force_wake_put_delay(struct xe_force_wake *fw, unsigned int
> +fw_ref) {
> +	__xe_force_wake_put(fw, fw_ref, true); }
> +
>  const char *xe_force_wake_domain_to_str(enum xe_force_wake_domain_id
> id)  {
>  	switch (id) {
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h
> b/drivers/gpu/drm/xe/xe_force_wake.h
> index e2721f205d6c..8da675d8db0b 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.h
> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
> @@ -11,13 +11,14 @@
>=20
>  struct xe_gt;
>=20
> -void xe_force_wake_init_gt(struct xe_gt *gt,
> -			   struct xe_force_wake *fw);
> +int xe_force_wake_init_gt(struct xe_gt *gt,
> +			  struct xe_force_wake *fw);
>  void xe_force_wake_init_engines(struct xe_gt *gt,
>  				struct xe_force_wake *fw);
>  unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
>  					    enum xe_force_wake_domains
> domains);  void xe_force_wake_put(struct xe_force_wake *fw, unsigned int
> fw_ref);
> +void xe_force_wake_put_delay(struct xe_force_wake *fw, unsigned int
> +fw_ref);
>=20
>  const char *xe_force_wake_domain_to_str(enum xe_force_wake_domain_id
> id);
>=20
> @@ -103,6 +104,24 @@ DEFINE_CLASS(xe_force_wake, struct
> xe_force_wake_ref,  #define xe_with_force_wake(ref, fw, domains) \
>  	__xe_with_force_wake(ref, fw, domains, __UNIQUE_ID(done))
>=20
> +/*
> + * Same as xe_with_force_wake(), but releases forcewake via
> + * xe_force_wake_put_delay() instead of xe_force_wake_put() on scope exi=
t.
> + * Only use this for hot paths where the caller expects forcewake to be
> + * re-acquired again shortly.
> + */
> +DEFINE_CLASS(xe_force_wake_delay, struct xe_force_wake_ref,
> +	     xe_force_wake_put_delay(_T.fw, _T.domains),
> +	     xe_force_wake_constructor(fw, domains),
> +	     struct xe_force_wake *fw, unsigned int domains);
> +
> +#define __xe_with_force_wake_delay(ref, fw, domains, done) \
> +	for (CLASS(xe_force_wake_delay, ref)(fw, domains), *(done) =3D NULL; \
> +	     !(done); (done) =3D (void *)1)
> +
> +#define xe_with_force_wake_delay(ref, fw, domains) \
> +	__xe_with_force_wake_delay(ref, fw, domains, __UNIQUE_ID(done))
> +
>  /*
>   * Used when xe_force_wake_constructor() has already been called by
> another
>   * function and the current function is responsible for releasing the fo=
rcewake
> diff --git a/drivers/gpu/drm/xe/xe_force_wake_types.h
> b/drivers/gpu/drm/xe/xe_force_wake_types.h
> index 14b7b86e801b..28c6f6dc87a3 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake_types.h
> +++ b/drivers/gpu/drm/xe/xe_force_wake_types.h
> @@ -6,6 +6,7 @@
>  #ifndef _XE_FORCE_WAKE_TYPES_H_
>  #define _XE_FORCE_WAKE_TYPES_H_
>=20
> +#include <linux/hrtimer.h>
>  #include <linux/mutex.h>
>  #include <linux/types.h>
>=20
> @@ -51,6 +52,8 @@ enum xe_force_wake_domains {
>  	XE_FORCEWAKE_ALL	=3D BIT(XE_FW_DOMAIN_ID_COUNT)
>  };
>=20
> +struct xe_force_wake;
> +
>  /**
>   * struct xe_force_wake_domain - Xe force wake power domain
>   *
> @@ -76,12 +79,23 @@ struct xe_force_wake_domain {
>  	struct xe_reg reg_ctl;
>  	/** @reg_ack: domain ack register address */
>  	struct xe_reg reg_ack;
> +	/** @sleep_timer: hrtimer for the delayed sleep request */
> +	struct hrtimer sleep_timer;
> +	/** @fw_back: back pointer to parent xe_force_wake */
> +	struct xe_force_wake *fw_back;
>  	/** @val: domain wake write value */
>  	u32 val;
>  	/** @mask: domain mask */
>  	u32 mask;
> -	/** @ref: domain reference */
> +	/** @ref: domain reference, protected by @fw_back->lock */
>  	u32 ref;
> +	/**
> +	 * @delayed_release_requested: xe_force_wake_put_delay() was
> called
> +	 * while the domain still had other references held; whichever call
> +	 * drops the last reference must honor the delayed-release request.
> +	 * Protected by @fw_back->lock.
> +	 */
> +	bool delayed_release_requested;
>  };
>=20
>  /**
> @@ -101,6 +115,16 @@ struct xe_force_wake {
>  	spinlock_t lock;
>  	/** @awake_domains: mask of all domains awake */
>  	unsigned int awake_domains;
> +	/**
> +	 * @delayed_release_domains: mask of domains in DELAYED HOLD.
> +	 * Protected by @lock.
> +	 */
> +	unsigned int delayed_release_domains;
> +	/**
> +	 * @sleep_ack_pending_domains: mask of domains in SLEEP SENT.
> +	 * Protected by @lock.
> +	 */
> +	unsigned int sleep_ack_pending_domains;
>  	/** @initialized_domains: mask of all initialized domains */
>  	unsigned int initialized_domains;
>  	/** @domains: force wake domains */
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c inde=
x
> dfdacc0f6de9..efe425dbcc85 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -512,7 +512,10 @@ int xe_gt_init_early(struct xe_gt *gt)
>=20
>  	xe_wa_process_gt_oob(gt);
>=20
> -	xe_force_wake_init_gt(gt, gt_to_fw(gt));
> +	err =3D xe_force_wake_init_gt(gt, gt_to_fw(gt));
> +	if (err)
> +		return err;
> +
>  	spin_lock_init(&gt->global_invl_lock);
>=20
>  	err =3D xe_gt_tlb_inval_init_early(gt);
> --
> 2.43.0


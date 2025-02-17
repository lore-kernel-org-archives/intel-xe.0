Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1370AC021A9
	for <intel-xe@archiver.kernel.org>; Mon, 17 Feb 2025 12:55:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 994BB10E08E;
	Mon, 17 Feb 2025 12:55:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MjjXHFVN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1EB010E08E
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Feb 2025 12:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739796948; x=1771332948;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=diFVeF20z3YkjZ5sUueFzDgetetKtSM4qruUWSNdBNw=;
 b=MjjXHFVNdnrJRg22FRGB6Nhi/G0dbmbbkU/7Q8E00rJaKeMT0H4tzBcw
 E504/VNaOFDlMGABrcECEz7joYGcxu+GJm62g169j1IvAC8U2qNYQn8tP
 MyXs1zqkTfAzYdwqfQQHz7p9I0KClkw3dnuEqtWC3d2DKJfSVk7DLOyCz
 TLYj+9dqlm1Ky0oL0Cl5uZnTQGQSauJnRigQgLCWDFDAF+RhdLopvvalR
 CFbKXoCw6KYOzuuiChxrB4vAyxzgentdj7nr4xfZxqzR37yYCRg7DwW9/
 u8I6NTLyjFT/CbHKKnaC+bUiWO036M8gyahiPnPkVNrjKu2Wv60CuxQ+d g==;
X-CSE-ConnectionGUID: bQTv1yUgSbCdSHlfuoKxJQ==
X-CSE-MsgGUID: V+Qg6L9hTiCD0AHYNA9Nlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="44405467"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; d="scan'208";a="44405467"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 04:55:47 -0800
X-CSE-ConnectionGUID: O0DP6K8jTAuKRaNwBl35TQ==
X-CSE-MsgGUID: qlLIsZ9kRY6lFSEynX7itQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; d="scan'208";a="113855152"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 04:55:47 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 17 Feb 2025 04:55:46 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 17 Feb 2025 04:55:46 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 17 Feb 2025 04:55:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gUqFM59aKxWj3fiACr7uXfkLcv8QbcGxuxqPAZu/qrRP+M4mQE7Ozwy6NgODb8k6LEvqREWZ7ySPeDwEJzmmo+kAAIXlWoPeXWfXrvU4BY5N6a4kJ/jIQshiGlejWXYjvDQyoL8G93XABK843uQVZ1Y1QNWTNu3r9c+989TSEOfWfw4glZMQc0bQ+naBi9IKJkdrSJea0ZGx/t51CtK0RIiutkYx+8EYvBPFL9L143Tuk/nrdK/ZKWYhQeo1PQ6slkdFT9Kio4AoBCmpcimGkl0U9fUOJUo8B2I4X8cSYr+0MZSBQ0MIhtShpKr2EZOUd0H97NUDp185gfqulAwShg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=07Q8YRODDU3EwF8q2GP8izcax2/uB0Jkvo6cup6GRCw=;
 b=fThTBdRJnMoku9KoEP7o1WW07zvCotZGG49Jtua59qVAJ7RSMKhe/tu5GElIRmdeX3HRM52dECNjp/9+flET/ZNNQRtVM8HHmlKwtYxdTfvYviFbcKZYyW4qeZJow0l0a81HGmelv4cpWQcONxYSEtRwByT+FVZSAS1opS/528tXVCDd63e1pvKwBVGuHhNXfr6dBQk4S4V6Za9X8cPGSdcEx2RhQq+a/LE5XJ9IsF0/BsEcXD7ebsVXeAVEj8We3Zm0lqzlrkCJqi01XrWpe+GID90+50AkzOxKilj99dbsDI8eju1wP1edsBOjKTm1CyTHZ/NLu+htmY3kvNzNvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by PH7PR11MB7477.namprd11.prod.outlook.com (2603:10b6:510:279::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.16; Mon, 17 Feb
 2025 12:55:43 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.8445.017; Mon, 17 Feb 2025
 12:55:43 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: RE: [PATCH 3/9] drm/xe: Switch from xe to devm actions
Thread-Topic: [PATCH 3/9] drm/xe: Switch from xe to devm actions
Thread-Index: AQHbfybOq12wLiuNC02H3Wr/UFZ7/LNLd+Ww
Date: Mon, 17 Feb 2025 12:55:43 +0000
Message-ID: <SJ1PR11MB620477C5192C33C1EA93DEFF81FB2@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250214212313.1767562-1-lucas.demarchi@intel.com>
 <20250214212313.1767562-4-lucas.demarchi@intel.com>
In-Reply-To: <20250214212313.1767562-4-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|PH7PR11MB7477:EE_
x-ms-office365-filtering-correlation-id: ce98dd61-4ddb-4211-f03d-08dd4f5263e9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Knotyub3pQrDU5r69PR6BCuHJSZmpYPJS266aLqogRbaXAfPgl0hWlCjj2lR?=
 =?us-ascii?Q?rey1+d7hf+rIZxJvO3xCJHv4i3a/1gQWNYWTm+cIkP7s2s3MhdHFxOrn2F2L?=
 =?us-ascii?Q?zNShR5Xyd0sZcoDXUT9I3GohoG2ukbugWcdBW85Tiribvmc28B3m267W9UgF?=
 =?us-ascii?Q?kFOlf7z7QayeyX862Z4v+rWE4o8D/QcrYiNibCMvlbWGyALaliBLhm5IqwFc?=
 =?us-ascii?Q?5QbQdwSup6iKvAUa2RI8NpOi+LSALArJfeyBfZqGbb2Gd7bd2KW2UVWpAe/i?=
 =?us-ascii?Q?56h9EELsePubKiH/mNB31lJN9tMF12x8G7kExSjLz3opDClzHJhj15GCOPsx?=
 =?us-ascii?Q?8xsqaMZKkUK/cXYDskbHgDPzY7WQ6Bf3BZJNiyb9LzBwe10MWkSjBjPM7m/S?=
 =?us-ascii?Q?mFkC1+E85rfLVXMgAzAOFP17nIZtlJ9STAjKgbsors13WFfGPnT+GeQExqjz?=
 =?us-ascii?Q?4DK18hyja2u+xv5S/mNnXabd4hYA9StBGMDQgOE77MKxcdfjpAvEXJWa2zk0?=
 =?us-ascii?Q?2qTNxKCiybOYN8RgAj2HdNL+NQ79nXsb98fYnaC7ysq/EDiat/JZ0R4TXuoM?=
 =?us-ascii?Q?+8PTuxWUTaAOy6vQlbe2K512JuM8A/r7WyJ1Nee/PyoLAN2Yqa8ZquzbbtS5?=
 =?us-ascii?Q?/ynH2ZJkYyDeI9b51WGKgJ8CJL9K8vnuJuB/GzEFN0tKLhndfgn4Ta/D0xdY?=
 =?us-ascii?Q?5/on89avU8Rb/tq0Xgiy2FQZHi0g9JTHVGdz2e8bM+fZrA2x6vldApWpEAWv?=
 =?us-ascii?Q?HFyCeCgcGUiTncgwabsiQQ/Rk2rp23NaSh+4vC+TZxm+MgbDpZagfuEfXlRH?=
 =?us-ascii?Q?G8/C3VcGV4j9hY7PMw4Z5/05iIars9xOrMKTPScr3kntib20GMHiqSWIdN4L?=
 =?us-ascii?Q?2lS7K4qqmG/shlbta4OF2rAVywAiTKzI2YCcYzw4MhjwDwNDqlvWSSEB3E5E?=
 =?us-ascii?Q?UGXZxSPSwka09xlOMhOHLE28LhgpN3dpAI9tzo9onLEyrvMZRMUYqv/pnrzq?=
 =?us-ascii?Q?y8GV+2I8QKLNGiqC1iVwXGqR9FxeTTKBWdjvqriFU6EMyqZzRbtItdyobOdS?=
 =?us-ascii?Q?uA4HLIXuxQfs7tM25d9iNsppOb/EPRksqj71ZZb/EoJEgqCiTOjgDSNozjdt?=
 =?us-ascii?Q?XF6k04o/oZvzYztOS0BmIWrT3+cXDlLvkN6FkxbTWhpbtOhIMzrzSbOeNyyN?=
 =?us-ascii?Q?V1H6cokQLAiR6+1drcKwSFpLoygkDGmE7n1AIHJgbX/wtPQLxrvtnS0tFIuX?=
 =?us-ascii?Q?Go2fP8FaVIdQU2TzQlPOpLYKk0gX8RUisk+dQt6jDWNHhbRMAklbNKdc0AyR?=
 =?us-ascii?Q?jKfXlB1sWdbvRDCa5afXYas88gKTzBw3sFC3IKX+cJ8mwrS+YD4UM78Bs9ki?=
 =?us-ascii?Q?LyR+QBMDSMiFmQEwiXQiyrJ8lCVwgqFj0Nd7Rz2ZaPEZAsL8JYgUR9h24jkp?=
 =?us-ascii?Q?YFmczfGtRuqkik8Y5g8COX1HG07qvT9k?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?aQb6D15T+PoLgWeW3uR6DRfrnhXHIWQZHd8MeEgDWUPL9QwIAMIroPVyJNTg?=
 =?us-ascii?Q?JLkTVTkRcR+tjvfFfrQxormF5WxZHXYgY74FSVuZqhmXBxg3xlcRZVfqTXLk?=
 =?us-ascii?Q?TlJKNYA0aofi0UYThaWUogmUcTAtGH/WpH90wCBS7sloeiq98U3g667T1vnc?=
 =?us-ascii?Q?jmfIU3yMgmqlYHi9tVJ8e1akv2ku2YODwJiggvVCDnYG9/p9gfQ+OtHGHAcq?=
 =?us-ascii?Q?ddtihXG6K4MURde5b9wKYNjlb+E2hFIJ1K1pB9s3eVr4lkk3l9xQ5Fpo/35K?=
 =?us-ascii?Q?OWqHt6vZilUNQGpRpvP99rOHJD7FPOsXY/flzp7F383R40gtLWUzSZyguNU3?=
 =?us-ascii?Q?kPsAFZumJowuIxaTKaf5LVz7krA5PV1sus/Gg/Xx7dPv5SvTANe35qCjyhVF?=
 =?us-ascii?Q?XBDMkq0jHbuo8UBgEKZ35ZPxEC9pSBRho0+tuafgu3kbFqqG5Za3j9jkl2ok?=
 =?us-ascii?Q?68ziX6SI2AVqvqXfwml4+pZKEusBAp22acsfTgieqeKQw5LEELCOQ9PFAbkk?=
 =?us-ascii?Q?ro+smi3iV1jtcBPBYnVtntLbS2uFcLnonx6GUtv7sdDgm7YrRZIOK63xrDob?=
 =?us-ascii?Q?wmYJetMBwSzMZzhl/NfKA2iAfQ4m9mgaNrtfcFi7FAtznzLkEeDsGvubMLMn?=
 =?us-ascii?Q?XbAtMbF6ezkmLCJJECciUPDNsvcnQC512vnARaP9mT3/LrShIj9OnCjcZw7f?=
 =?us-ascii?Q?KTWWe5WZ1BIcRZAr0ca6Xkb53jXTOZZ5xXahlhr/ZB3A3YERfYih9Y8O9WzQ?=
 =?us-ascii?Q?dxZ437HfHJDnHRwju5qLrYNz68YUkQFjp10E4Rgmv5CSRLvqkUBmHh7vhOP4?=
 =?us-ascii?Q?01jTDz0QBjLkZES2+67jjXEJju2ad0JzatX2pf1erULYt/7UNKG5YR18Rjb3?=
 =?us-ascii?Q?milBsh5FxIHyaasocT73r2nrklCZYZmElXrFxENEINEfSioB76sqdazKaYXK?=
 =?us-ascii?Q?s7/SHNTlkJnX0+0mbCEWMPi2uU8KJ7NTeO7mdeHmMv6jk9wu+lXWwNxyBZ7n?=
 =?us-ascii?Q?Y7nk13a/ZiuEYytFTx5Ga7ynbPDwolpgjJB/AHdMKm+0M3Hd5FHbFpbU0QP0?=
 =?us-ascii?Q?ZU0Q6ePRq9N7wPIZrdxZZ4f+VvS4ZakWuNd7UWm9tDQTYP0UvV+U2BjdCQL/?=
 =?us-ascii?Q?f7ToDS+T2jOSgdkNQWxaQT85Vyw7VmgHWuaS8TnRHhMPv5cPlh6OXI08jDO1?=
 =?us-ascii?Q?F+NVYU3LsUUObhuhnocKR0t9meVuVzqeEhfp5i5QPn86ZQwurqvi3TAT96Dr?=
 =?us-ascii?Q?yjucJkJJTikddQ6+QT78wEfDuIHLoQ3JD4lBIO+kDD71hj6JPb8ToT1ev3ZU?=
 =?us-ascii?Q?96Ahw0QaH4WTHF0j01iD7Q65GGbFufiooUgfKJC/Wi2QFYT4ccAP5kZHzUm9?=
 =?us-ascii?Q?y+fF+zaLta36tRtbnOQyocIZxeXrYcbCHvbhp1CQGcT9zOwY77kstSFdPiUT?=
 =?us-ascii?Q?DI/VswaMIPCUgWLsLPOC1lIn+IDD/BuORJLJT81a6Hv4fP5V/VsO/5rj99uA?=
 =?us-ascii?Q?QW4wNPkI3267vrir4EG3KoYBFlTTkyYI5S2DAPG6r0QgNP0KZNB5jFsoXcTe?=
 =?us-ascii?Q?SDwcMUFHta7ch7ZTxEIU61baKHvo/Zl9auztorWc?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce98dd61-4ddb-4211-f03d-08dd4f5263e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2025 12:55:43.8234 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wVQiH6T/y/49PWe6unDKWNAthUjXtu8A9aiSTTScNIDi019nWK4ptPlsLb0IDUTrCelSzRzERDWIJfsNBYuVp4IQQApYDCxBJ91wHlL6QC4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7477
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Luca=
s
> De Marchi
> Sent: Saturday, February 15, 2025 2:53 AM
> To: intel-xe@lists.freedesktop.org
> Cc: De Marchi, Lucas <lucas.demarchi@intel.com>
> Subject: [PATCH 3/9] drm/xe: Switch from xe to devm actions
>=20
> Now that component drivers are compatible with devm, switch to using it
> instead of our own.
>=20
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/display/xe_display.c | 2 +-
>  drivers/gpu/drm/xe/xe_gsc_proxy.c       | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c
> b/drivers/gpu/drm/xe/display/xe_display.c
> index f2064cfb55cf2..5ad2c99a9ae74 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -184,7 +184,7 @@ int xe_display_init(struct xe_device *xe)
>  	if (err)
>  		return err;
>=20
> -	return xe_device_add_action_or_reset(xe, xe_display_fini, xe);
> +	return devm_add_action_or_reset(xe->drm.dev, xe_display_fini, xe);
>  }
>=20
>  void xe_display_register(struct xe_device *xe) diff --git
> a/drivers/gpu/drm/xe/xe_gsc_proxy.c b/drivers/gpu/drm/xe/xe_gsc_proxy.c
> index 31c90577faf0b..8cf70b228ff3b 100644
> --- a/drivers/gpu/drm/xe/xe_gsc_proxy.c
> +++ b/drivers/gpu/drm/xe/xe_gsc_proxy.c
> @@ -490,7 +490,7 @@ int xe_gsc_proxy_init(struct xe_gsc *gsc)
>=20
>  	gsc->proxy.component_added =3D true;
>=20
> -	return xe_device_add_action_or_reset(xe, xe_gsc_proxy_remove,
> gsc);
> +	return devm_add_action_or_reset(xe->drm.dev,
> xe_gsc_proxy_remove,
> +gsc);=09

LGTM,
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

>  }
>=20
>  /**
> --
> 2.48.1


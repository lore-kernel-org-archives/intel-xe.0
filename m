Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721EB606A326
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 06:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YBYWJT1L;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=CzSXhvvO
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3920710F007;
	Wed, 25 Nov 2026 06:23:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C19510F079;
 Wed, 25 Nov 2026 06:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795587772; x=1827123772;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cx881kCE4FXQ0LW/wIMoeFpoqba6KPVKLgw5yHoqYU0=;
 b=YBYWJT1LNyAfJSRMgH1byttJXZ2IMK4Di9NnSG/o38o75l0SAqaqRdTW
 ZxLzrvsIsvQ2Z/Yor8UsvsxLyQ5CJalflLaLh1UmYLN+wwrcfqshRLHrF
 igg9NP0jYEHLTJUyl9VELJeePzU7EdiAwiw7G3RYN6pfTpg5nFsLnJp1w
 UXVntUvWu5iRqYx/50zq+ehG692dQStX8jd4vULbkqr2sxnlMAT8unuVG
 A7D8mJRFgoEoxxvXgBz5Kv5W6Wq9WPilTLsR+A96Cp0zTLtXvBH7Gu7BB
 vlwIrxaDl8RTt1dpCSf1TTJAF/OrJSWIT6kU7E5y7V5+qHz5VQYPH7XUe g==;
X-CSE-ConnectionGUID: iQrwoyK3TVmLzd/2uVWKhw==
X-CSE-MsgGUID: yTwdpRZAR22ZNRr66BPoUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4452604"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4452604"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 22:11:51 -0800
X-CSE-ConnectionGUID: GJgdRwHOTJuNpBg4IR5QoQ==
X-CSE-MsgGUID: wg2T0+pPQo+7Qy+dH/XU6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; d="scan'208";a="11901418"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 22:11:51 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 22:11:51 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Tue, 24 Nov 2026 22:11:51 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.10) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 22:11:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p52O9YDl4OI6V29gSiHb2tpAhpoQSiFA7gCmwb1k3dv0LCCZ+M+YvXfE43ivwrjK7IPqKS/QPhSIWR9YO14lgF6PNjJJLYsDF8rL3Zxj7WitfaJdYwhIpdOuSN2vpJKIPZQ/6R8pr7xiUk+ovIhoxdMocwxfTNI71A1is1j6GlUL55cvUEgGvpy8bMNDw32c6flRdZCCd6b6YUb1RyOFTW8m1bpu4fPIID3JnaLYAxteTeYH3enqKRPpUFpvUMYIdFXlzamlqAIoemNNmnspCncR47sNJy1nVzjXuZxLjzeEsD/12ogYH/6FGo+uZEeapuIL0KRZdnDHZgDgtZMBpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7TyAHLaHvuoyNq0oIBQgt0OflgAhGSTTQ5FE1z9+V/o=;
 b=K3HP/pjQXL89hKBuOSIRvFrdXpfxzBAj8VSV+kSgV9v3gDF9H0iXofBx7S9R5+bipq0wUwvlRJqyGCkKbQblx+fub91NEle132SNIRkTUGXwKmlpPQ9/odTGvKTw2jAuPvcrGRZPqAkeTTk9aCsygWlFB7Osei1Lm33LutY/vbLCh+SgHUiVz4UaogLpHyNF/mM6L7XmhElCyfVnIUFEi2eFBZ0+4Q/6wkFIusA/jIFWWOj1QjcA384pnhK8+jsqY+ob9C25Vef+nfZgGw/8Xt53W62MbcVY6WN8J46OL+CwKEqD7W//GZbSQx55l19UIQUIPVsQTvdZLqdcdgamfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7TyAHLaHvuoyNq0oIBQgt0OflgAhGSTTQ5FE1z9+V/o=;
 b=CzSXhvvOlNbK67S08Mxz9jCuwhDwA3PZqvn+2oqic38zzOofOj5wrW4gqEusWzxTNzEK9RUvdAsgobUZKNZ8NjgYmeBJmSkS5dpU6JiC05xLeurotC4eRd22VyCGyaTbQQoveyJizX6dou2I/VoaME7DD6bxOB+6bo/IG6K7NEI=
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by CH0PR11MB5281.namprd11.prod.outlook.com
 (2603:10b6:610:bc::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Wed, 25 Nov
 2026 06:11:47 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff%8]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 06:11:47 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>
Subject: RE: [PATCH 1/2] drm/i915/display: don't be cute about printing
 enabling/disabling
Thread-Topic: [PATCH 1/2] drm/i915/display: don't be cute about printing
 enabling/disabling
Thread-Index: AQHdfB2VObfel22NJk2sYPNuExyWnrc+T2Ag
Date: Wed, 25 Nov 2026 06:11:47 +0000
Message-ID: <DS4PPFE901A304F688DBA401DA06D3B47CFE3432@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20261124141040.1560003-1-jani.nikula@intel.com>
In-Reply-To: <20261124141040.1560003-1-jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|CH0PR11MB5281:EE_
x-ms-office365-filtering-correlation-id: 0175e1de-57c1-4e88-3734-08df4abafce3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|38070700021|10067099003|11063799006|56012099006|261021121427099003|261021123027099003|261026121527099003|261102123227099003|261009223027099003|22082099003|18002099003;
x-microsoft-antispam-message-info: fp1mQ4mdkZrp9SazEwNPY88v6l1JOD1jY+HRzkNw9qYHKb4CnCTlURkj4kN2XWKMWw6Dtcva4Ov6HQUgi/DrXSO8uXf75Clq4DDY4+6WQAEvKC9eTYR4ksfuvvz8S58T0EVoCe457GlkAFVNbWzZdvO5ZZbTb1c6ARdCVhcbdM2g5sbOqXPByXvgVHd6mOz4n5EVPBENFYlfaQqnsrPDQjZY9oimhZLthee5K8iTELyVUo/YtYr5sCNqvwF1uJTqqBBNbCjPri8MkTWBZ48k0QSCeQhftyKH+9za/SloGM+z/poLE9flM85Z77evkvTft7c7FYnFOWvlSnVLA3eOydoPyr+a79lzxswU2DYx9+dxO6sovotn8rKCYzmtYYSsef3PuWXKWtE4FItG0RMxTHb4+ghqEcwLbQu6+lGwMDg6t/N9h8Wzu58R3UOnFiK0yRn39uiuwuengDKZigUtU0wMWJ8fvaH5rPjb0x0zWIQWry7HQU8XOO4ueQi0t/iHjUiAL6gYrQvvhORMgm5XzP1zrxXT+XTONCzrfTHLO7cnsNsss+Dds4SWIjfho2g7samspk+qeH9bJKNQ/dIhLjhAJ7f9QEEMUn49BPpGoXhYqJ/6jsvNGWvCPFWdY7ICL2R68WHnbhOJEGknNlMeJ2exDDMGhydumgjwpyXMuPvWmY5OE2u2aL6WXepykyq4lvxNXCYGWPU+gh3b8xRm1vjQXw+4S0AtMhnI0iQ+xSw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(38070700021)(10067099003)(11063799006)(56012099006)(261021121427099003)(261021123027099003)(261026121527099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5adDQ2nVBPQ/Z88+hU6/4dsjibc9PLO4vt/pODxzZaU5zPWDTn55V+T1ArEO?=
 =?us-ascii?Q?ta0WhDNK3FaXfADGRqQa85lHujEnaTeRbUFSa4Ll83Mqzb/viJTq/LDQ4PU+?=
 =?us-ascii?Q?VTRElSs18gTLniNPuGFSVhCOscYb9FeB98Buv54V+jDuEouAb6MHxO9JLaOn?=
 =?us-ascii?Q?vNOzPVaC7D0xTPzuvflhR4hxszqTg0tDTtEbkIIJRQhnSqyQ56jXM7J4Fu5V?=
 =?us-ascii?Q?BOpSJJoVg+WRrj7lHwfoeoq/e2OlhKZnaTFc5IQtUavkpgWn4nnILeOLkxqi?=
 =?us-ascii?Q?nIZU/TBHG6SZVp6kUY51n8juhK0NBo8A/pMUlcJJKqc/mXLaznrUubFTbTng?=
 =?us-ascii?Q?eFeE0tghHa1LhiGM24OWFA0hE01oQORqw9DHUIda+YwRbc7KMDQEGFT26Gip?=
 =?us-ascii?Q?/nfjdYiao35jAoXN4LJ7JuDMxc0gU/aj+cz/FX42awkaKmXvQo3N0SHcDjYl?=
 =?us-ascii?Q?p/0e7i4GBPRi3YNBtS0DCnHQb96TMpzev5usBb7ywE9L9bXGzLxgdlZ0P4Er?=
 =?us-ascii?Q?zo/RSmZd7idkKElGe6FbXn9XthfhD7zYoGWeD6wJ668uAP5lZBr46h5wgwuD?=
 =?us-ascii?Q?IYD/PBPf03VpLuFCb3a+aldzi7xwdL+fJe60erba405BVAtY8W0DN2bZ49zE?=
 =?us-ascii?Q?dfhnelqGv8yw0N/9+l60XMntU+o2yx82z2ev0fakaMtT0rfNUdkKwh86Xhz4?=
 =?us-ascii?Q?NMOvGFoDRdMNqQgSZTecOpgdhi591SV0UWpOYAuMSjzQN4TpW6RxtamsT2hW?=
 =?us-ascii?Q?2tbbKkEwKNiMClG3oy0+yaaGwBdYW6lqn2s6GvxjvdfHVKVGAGW5lOtzU6Pb?=
 =?us-ascii?Q?ufJe7jwV6gHFrKkrA3Pj/vFjq0NLQkHBQU8DEENaOR911f/zz4rijB7QEwUC?=
 =?us-ascii?Q?nbl17g/QO+a07nDHMK9WotFWvnsMkCMS9Yvl4mCCeF2UEvjEPZSvB5ZUhg2A?=
 =?us-ascii?Q?4PEb48UJND0GmFt/IbhWf/Td1P8L4dq7QzoEvNtpRxa58IWVCMJGYIkNpo+T?=
 =?us-ascii?Q?vNejQIhA39GGZsUrlmUzaufy+tHhdDOV1OaDQqOpVRa9U9SGlDPFaplz3DkG?=
 =?us-ascii?Q?jA/8gHmER+8JTGME/axapiSI11e8o49UteRs3Em0Ugu5Qyr7pAN68fu+E/oL?=
 =?us-ascii?Q?BQSLXsioXxrLoPboyeqKzDoXM1c/gW4NX0czbvUrCikbhTMxtdyEY2uCA/Sc?=
 =?us-ascii?Q?FH3WyWo4niMDk9y1fB942gOazMpDMjo4h0Lob8vX7gxh9d4mBS+NGPlAWWFJ?=
 =?us-ascii?Q?GXQYQKWcIA89GYaIdfUK2Jj8/x5p1JeZLLudGJRPBwTl/V+4KIYbUd/GSfLN?=
 =?us-ascii?Q?CX2CtmpKdD/6Anzp6vkCpQ6y7pm2kXJuDxEVnqh/j/+xs7fHogXnEevyYy1e?=
 =?us-ascii?Q?RX2x5l+hHLq3tqnO2yhfwg6n92VyGPswV4bi5hIrypCFUsR5D7luvd/1O7yH?=
 =?us-ascii?Q?ruoj5qrIsq8gkeK9e5GO8nqpe7xeJKkcI/J2KKn38ifvnaFMpl+Gtcg+OrHP?=
 =?us-ascii?Q?KZxjwoaT9NYMzxFF5chYnF2vgGmbXWMAV7Pnb60/TImbnaBNCPLhI/tVFHhs?=
 =?us-ascii?Q?XaWaoZuzKlTZtFKYJ8TFu2y9LKNcYcewabJzo+CRhoOJjqyu9a1BOvHw3YDt?=
 =?us-ascii?Q?JCbaUcmKk9v97Rx+fNJrK+2YBbfpPg1Oa7I1QhHrHza3/XkP/ym7z2KFbyTV?=
 =?us-ascii?Q?ysw9KrpujoOQDipa+QSg72V5nOe4hakkXKV6MD7RrfmXFHO+XsBB6ZuPhS72?=
 =?us-ascii?Q?0NvnO0PU3w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: BLLJ5n2EGCURXGOfdZRdPMHCbqBgmNMWUMw5PL4esIwH3+ZLB1h6TWt05FjmhHHYYyKCWJUoCDF+MMc5E7O3n/zDJER+7Lf2QhZ+T47/KyGZq9C+cYbzUhSlVuKfkXr+KEecwE0jE+Z0X1vD6RtrA+ZZEAgEVouUiedvvpy39xTJ2TfRRK6iKs5SOcpnh73jYivAIy1yNBtOt1R4SZJyZXXUbyRQqbe3W07F5AJkDo+2CGRqFf5dTB3KIkdsE30ma5Se6cm/4CHgPfQyTkCzJ9WVkoWASY5UEzTR4ZkO0SPlQUpV0hkW4onbiI3wIINacy1uRHAnkV/W9p9jhCHP2Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0175e1de-57c1-4e88-3734-08df4abafce3
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2026 06:11:47.6942 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nOnyhFicxYDkJFzVBnXntkLhkCvMEHJQ8G7YQ+rob4L5I7650hIDS5MDcK5IXg9PokT3CZevMKjB/dRNQ9CR6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5281
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Jani
> Nikula
> Sent: 24 November 2026 19:41
> To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> Cc: Nikula, Jani <jani.nikula@intel.com>
> Subject: [PATCH 1/2] drm/i915/display: don't be cute about printing
> enabling/disabling
>=20
> Convert "%sabling", enable ? "en" : "dis" patterns to use str_enable_disa=
ble().
> The imperative is just fine here.
>=20
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_fdi.c     | 3 +--
>  drivers/gpu/drm/i915/display/intel_gmbus.c   | 5 ++---
>  drivers/gpu/drm/i915/display/intel_hotplug.c | 4 ++--
>  3 files changed, 5 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_fdi.c
> b/drivers/gpu/drm/i915/display/intel_fdi.c
> index c170d3104e4c..8f83762c1031 100644
> --- a/drivers/gpu/drm/i915/display/intel_fdi.c
> +++ b/drivers/gpu/drm/i915/display/intel_fdi.c
> @@ -404,8 +404,7 @@ static void cpt_set_fdi_bc_bifurcation(struct
> intel_display *display, bool enabl
>  	if (enable)
>  		temp |=3D FDI_BC_BIFURCATION_SELECT;
>=20
> -	drm_dbg_kms(display->drm, "%sabling fdi C rx\n",
> -		    enable ? "en" : "dis");
> +	drm_dbg_kms(display->drm, "%s FDI C RX\n",
> +str_enable_disable(enable));
>  	intel_de_write(display, SOUTH_CHICKEN1, temp);
>  	intel_de_posting_read(display, SOUTH_CHICKEN1);  } diff --git
> a/drivers/gpu/drm/i915/display/intel_gmbus.c
> b/drivers/gpu/drm/i915/display/intel_gmbus.c
> index d43c81d362e6..d68521588d54 100644
> --- a/drivers/gpu/drm/i915/display/intel_gmbus.c
> +++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
> @@ -1107,9 +1107,8 @@ void intel_gmbus_force_bit(struct i2c_adapter
> *adapter, bool force_bit)
>  	mutex_lock(&display->gmbus.mutex);
>=20
>  	bus->force_bit +=3D force_bit ? 1 : -1;
> -	drm_dbg_kms(display->drm,
> -		    "%sabling bit-banging on %s. force bit now %d\n",
> -		    force_bit ? "en" : "dis", adapter->name,
> +	drm_dbg_kms(display->drm, "%s bit-banging on %s. force bit now
> %d\n",
> +		    str_enable_disable(force_bit), adapter->name,
>  		    bus->force_bit);
>=20
>  	mutex_unlock(&display->gmbus.mutex);
> diff --git a/drivers/gpu/drm/i915/display/intel_hotplug.c
> b/drivers/gpu/drm/i915/display/intel_hotplug.c
> index d095eb13dc06..09f34c9a8643 100644
> --- a/drivers/gpu/drm/i915/display/intel_hotplug.c
> +++ b/drivers/gpu/drm/i915/display/intel_hotplug.c
> @@ -1309,8 +1309,8 @@ static ssize_t
> i915_hpd_short_storm_ctl_write(struct file *file,
>  	else if (kstrtobool(tmp, &new_state) !=3D 0)
>  		return -EINVAL;
>=20
> -	drm_dbg_kms(display->drm, "%sabling HPD short storm detection\n",
> -		    new_state ? "En" : "Dis");
> +	drm_dbg_kms(display->drm, "%s HPD short storm detection\n",
> +		    str_enable_disable(new_state));
>=20
>  	spin_lock_irq(&display->irq.lock);
>  	hotplug->hpd_short_storm_enabled =3D new_state;
> --
> 2.47.3


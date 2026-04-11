Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F03F5F45A1E
	for <intel-xe@archiver.kernel.org>; Sat, 11 Apr 2026 04:46:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A075C10E146;
	Sat, 11 Apr 2026 04:46:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AMJd+e7t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39C4210E146
 for <intel-xe@lists.freedesktop.org>; Sat, 11 Apr 2026 04:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775882816; x=1807418816;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8+x3LJUYlBGB9SjlNs6PZ1MbTfcHUnjPr+bO/9+WAac=;
 b=AMJd+e7tE+geuEFe3lWHZaSNOJG/R+J6264BTYp0wdjpj51whfBqygqE
 //0vA1bHeFr/F23Y4leq7p7R8253yNinSLwXZl1DyNsMbWSZzEmfr+Ekq
 SpmO8qhVRkTgXjDD/TVDYOXOx+FF7v3niLg2dGhisUUtZmpV7Opn4Ro1T
 oXpjk0DOdyoAZlQP3YLaU+l0FEX7PxzaV2ONNFb38joUClpF8HzfZIr3U
 m0BuyrZRRPM6fksQ3h3iI9ySKuDTXh8KL/4jOpSbOxj9iAzVy0S2zbz2b
 yZrVTTP6V34Kn6HfTTdHhdkQrFvq6/RsJJbbg4lA04oDrhMaixjRCJA/B w==;
X-CSE-ConnectionGUID: G+eJYotXQNmZwtiTCuMM6A==
X-CSE-MsgGUID: b4fqL5TCTpmXAhpsgUyVPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="87978699"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; d="scan'208";a="87978699"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 21:46:56 -0700
X-CSE-ConnectionGUID: k51hJzPpTiuJLCJG1FXW1Q==
X-CSE-MsgGUID: os/vhn/ITROKRZGQTCMTWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; d="scan'208";a="226557387"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 21:46:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 10 Apr 2026 21:46:54 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 10 Apr 2026 21:46:54 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.47) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 10 Apr 2026 21:46:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GsDb/Q6aUwFqOiAdPVcBQs2llAGyKMoZiFYM9nYTeS3TrER+V1mTJ9v8jsNxgql65CCjvX5pucxHh9jvMBUEvUsVBkR1Z6rYDUX6BRtKSXJukpQHzUB637t5bml2BddUIvLybEZzLDoBLGcV5oxQpGL1br5W1XX7u3qchdjEGIifTtF7RR0yBiRW1sg7wBxcNQE/Y790OcVUZRFelnrl8OdL7f86Oa1pz42yWIkFzGbUsvTlYaU8OXgvXCd4gp7LTrYwqHmdJUhIMry/Mup5dUv/ZGbQXPDRPTfxal9/musRorpIMKzltr64ZNTyEDAfhAJp43rMl+0pWl1u6GRSuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RK17VCF4i4A4O5nQm0yXmHxl3bsFg8ESNUmdmj67pdI=;
 b=mW+Rnt0DjHZDVzzMWOvqxQjOGjArECnJtizwG/dgtg9wb+Ix43cAfOqsaDhiUS2DnIeDO8dsIJsFVMwPwoMbtWScbjYEd2eGG52H73hn8y57xinKfsbrvd78vSpKzAcRwZJlLXLaM64T609dcfLtPIhJ88WvDfA7WhxLwrdWsK35Z210vsVbhHPiR2ae4p2Ft/NZi4g8fNYiWi9/sgT+9bes2VspEmhZXzlVucsb7Jzm2r0OWfvwb4rXNM2dxIW+9Ftw5kreYZSRrx2Ze7Gu8ro8XMf3TEeVF8q76Dq5FF+9+snptXyLT+elVjKENfZRLZwqp/T4JX9TAhJr3LcZSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8839.namprd11.prod.outlook.com (2603:10b6:806:467::17)
 by SA1PR11MB9614.namprd11.prod.outlook.com (2603:10b6:806:4c4::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.15; Sat, 11 Apr
 2026 04:46:53 +0000
Received: from SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::d917:ef8:5e20:14f3]) by SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::d917:ef8:5e20:14f3%4]) with mapi id 15.20.9791.032; Sat, 11 Apr 2026
 04:46:53 +0000
From: "Nguyen, Brian3" <brian3.nguyen@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Lin, Shuicheng" <shuicheng.lin@intel.com>, "Tauro, Riana"
 <riana.tauro@intel.com>
Subject: RE: [PATCH 1/2] drm/xe/ras: Fix error handling in register_nodes()
Thread-Topic: [PATCH 1/2] drm/xe/ras: Fix error handling in register_nodes()
Thread-Index: AQHcxuK98mH3RxpIa0udrlRgibfEvbXZSpZw
Date: Sat, 11 Apr 2026 04:46:52 +0000
Message-ID: <SA1PR11MB8839D98125E6279612D9FBBEAA262@SA1PR11MB8839.namprd11.prod.outlook.com>
References: <20260407225913.3397059-1-shuicheng.lin@intel.com>
 <20260407225913.3397059-2-shuicheng.lin@intel.com>
In-Reply-To: <20260407225913.3397059-2-shuicheng.lin@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8839:EE_|SA1PR11MB9614:EE_
x-ms-office365-filtering-correlation-id: c1fe55bd-e306-4c03-5b15-08de97855a01
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|56012099003|18002099003|38070700021;
x-microsoft-antispam-message-info: /9kKyGRE/eFAOkEoWnyn+Gsp3zfp/c37VuvnIFGz5AirCmEbKDVS/5ddUBbf49VimtEVBRe5afWfBua9OJ/ZQfW43tM4wKycYnNoUCmq9CxlP9nsgEcvrQIIl5bVbiB9CzhdkQiv4SxcbCF7bU5/+l5swQPNZ59h9Yvfia4XhoZmxrWtuvIe7ymOBiyITVXW+UV/BCwJgVKI3h48Zrn+gIuKZ6iv17yQAcAMLI49bXXlxkcSl0ri2gU00epJ4J6gy5xFmqE6uLc2n6dHXWqns8p//XqUNPAQLsKR/61hpneLn5L7MHNE7VpYMg1nMDwWx+0enxL4STe/rZLBsVsdsIvMP0JxEhnfN5hUkeNtm+q6XtX6DIY9lxP7U+LabmKzqhBw1rAry8bv/Ol/4N2GNQIkMUb1w+w/RcsI2hIZ0VJwB8QNEZqBz0XYbiKDv5wiceRYuuzBVXLp7vDpCB8wOL3XB2vdz9dlWfORivDJvTkP/P9fJeKWstPBDplfH8oEyJnYzjPjXQWX9pJs/y41ERQdw4Oo+PYCmQGP5EDD0aYuipgAA3cCEk79e4oaz2Wo9bKNAOOumvQENZ8KZojJla7iecvz2rnU0dKprGP/TEWs6WRX9T+s7ti4sRS2bj+TEi7tZPV3KWVctJQLWfgoEME2PMrmyFjfuHv4A99wyscXxwy5+0nLobHSfXcyMLY48Pso4vYsEQ8AeLcpJLgj6gHhF9aKN8eSez2UcaWNtRbaOoKAUyN43/7BV3dg7zOcC1XY+LPbziQG00Rth2wJlClBc1Zn5AzrpcKpoNhUfrA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8839.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(56012099003)(18002099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?k2Vu5Zg2vBHE+h2oRiMNgOfH5jpNPKTNNEPSJ1O1wD6p6/SwsXTmxh6reiDQ?=
 =?us-ascii?Q?JV2gyV9yzjHklInkj3DLq3bSkF8w6gGG6DaM2oZTMWYqgyyvDIzRYmNEEOzV?=
 =?us-ascii?Q?jpxjk5/wV/E9RNkTMKUC14Huk4s0bYA5gL5STqWIsxUfQaza2/sN+S+tj27t?=
 =?us-ascii?Q?tF0dO7p5x3z9v2TYvJUPRsAxrGX7Vl51HQwfRJ2lC12zNErbNJHrGyr8Tz6t?=
 =?us-ascii?Q?DVsj49cq0xnqiQm5Zzhn8VOYg4sv8LprYIV93jgiGb2E77ZGfiuPuFGX2LqO?=
 =?us-ascii?Q?ExpWeQA9sJDFbX+dFWz4ld83V0zGo9Kbn3/WwRMPahGRixvj7LMJiMyfoMuV?=
 =?us-ascii?Q?pBt/TVO1pi+JnIc43sQgRuh1Jw+c2u/bU41thbQ5NVp2muqeWAiKCGlMbMh7?=
 =?us-ascii?Q?2nKN7gNWr6bhbhW/vYJzHfP0yb9p6lL0RYX0lLElAX5nYIYGVKr7eAQlwQpp?=
 =?us-ascii?Q?7xc9Es7XZpmzl4kJiUh9qsyDHW1/SNd8Lxy6gQrutuA/OKZsYXvYmED1JJ1h?=
 =?us-ascii?Q?yu2lRZQ7TO2C3NsHN9jAzeelutg8LDk4Vs+AKDEGFrN5tRMr0hx+ioyw0imu?=
 =?us-ascii?Q?Nk9sN6CtuERg2V0uJseqdntWvss6gSuBqhPG3WFUfXys1MqJGFtljeosUZk5?=
 =?us-ascii?Q?1ZLFvPOHoyMj58y0hgn9CsZj042mXfvy2UyermD/CQ1nsJVKAve4lYg7ALF6?=
 =?us-ascii?Q?JQEjbEFGkfdhGJvJIxCPvEv44V5cWCGd6Lime3hRI5B2t4iduEIiqbBRLYSr?=
 =?us-ascii?Q?UvOwDEUiMY943xdfHO32LkuXVhg0AI9U/VaKXNg2ZZ0IrCTMHIBz9X+wobcd?=
 =?us-ascii?Q?JYHs/ZGpUSaBcxZ5sYKfTFpo1YzI5E4ZI3BvuZ8tbZCcKX4eoowmb1c69S90?=
 =?us-ascii?Q?IkbR5O/2yPLyB2DY6TWn87OyXQesGZukpkKExSpmsFMAcDnzutliipxl5KHl?=
 =?us-ascii?Q?zdHesUVLmqQWD22sqvm1SZZc85SMuu5MKhsSZtmd44G2gF198I1Nq3CIxdGd?=
 =?us-ascii?Q?2FnkRv7490bVSeVVz6xH4qE7EOYfNFtL+ieU4eBhBYeiyLyeOsIjOpbJu/Ck?=
 =?us-ascii?Q?Qpg8DGCyBNpja4wqbsL9xlp5mgY4/L912FMP4w5tGxwaDUfXBpkoPMgHRlMJ?=
 =?us-ascii?Q?U0A2ND4Zop3Ycy1wsJngcy1jipreffo3I2LGOsM99Y9KX3wIBxkfY7HtWuFq?=
 =?us-ascii?Q?eES0bE0V/FZLHjv+vBxNg+9l3s8v1eOV0NffdLB7CinfdgkSLqS3lh5zocQT?=
 =?us-ascii?Q?QArwbPAYwyEYQLiRo4D/o1v4zgCQQHK2z1T7sCDuvkg6PAOjK8ALfgl4qCDI?=
 =?us-ascii?Q?aR7I/dels+S0aKq+czFcd/uLz7mZoXEbR0rl+SWooGtDBvFMa9AexykMjVIO?=
 =?us-ascii?Q?c7D9/hfdT3l1bstmaw0yyrK4E/WpQ+0QyodUOLAjM2W62E+Gj/LsfsC87HZk?=
 =?us-ascii?Q?Ez68CxTsfB6wPjPlHNRtOIH5OBSXjxw0CsuDqItJyVAEL1ZKffPev6e8dxEq?=
 =?us-ascii?Q?kt7TLUuk2CWDZaumLaO238E4aSuX6gL93kyomr+isq/XioXROFGjurLVvyDe?=
 =?us-ascii?Q?E44C9/2rf2o/3CXiChOTL6Z2eqhlU3mLA6B433lJ4tpOjwxyQIMg3rsoX5Cf?=
 =?us-ascii?Q?pLO+VvOIpwoEb/hVYYdDVStiSpGMVmMqZ4bATa+NUZv91MDhtRKAMuY9RxYe?=
 =?us-ascii?Q?yeG0jRWbiV295+ugPOG1ETzzBoqxO8YomY8KAkf6kwHDF7KKpTuEYxaRFvLL?=
 =?us-ascii?Q?VX6HJ/iqyA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: N6OfjDJWsrNbw2V18L0BtTkGjbNzadBwDQXlP2/TCBh1U0L8zXYAQoe++A9PxqwaJoHVHTGhjZEjPVA5ybTfSvaBE3v6+iUbbp3ktyBkyjo6a/kO2pmTjJzaPEGmfx6M+fUbJY56C7lSBg3bRIWgb6naRzExSML/VqzrF6fAVgtx1jmvhU9a1DugXdckxiw2zZ+zxXLM5YulXzHww2BO6BlzhoZle2fZCPwU3RoW9AUmP9P9UyOmNymLIhqPZMK8WZksdYA1AkkzQsuyJQlvAJGQOcUKpxtSY/b9K7d9TzuDiFIJ0ZHyt7QVakUdkcc0/YYUU/En0+Z+gXmkobRC/Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8839.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1fe55bd-e306-4c03-5b15-08de97855a01
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2026 04:46:52.9026 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fR7q2HlGxodJemlRujl2L6zfVJckNvxQc3Hj01Hwknuf31VWU9LDzFMzJWH5imNkqM9XI1XV0OMb0lVFupZqpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB9614
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

On Tuesday, April 7, 2026 3:59 PM, Shuicheng Lin wrote:
> Fix two issues in register_nodes():
>=20
> 1. When the loop fails mid-way, previously registered nodes are not
>    cleaned up. Add goto-based error unwinding that walks backwards
>    through completed iterations.
>=20
> 2. When allocate_and_copy_counters() fails, assign_node_params()
>    leaves ras->info[severity] as an ERR_PTR and returns. The caller
>    then passes that ERR_PTR to kfree() via cleanup_node_param(),
>    causing an invalid free. Fix by making assign_node_params()
>    self-contained on error: NULL out the stale ERR_PTR and free
>    device_name before returning.
>=20
> Fixes: b40db12b542f ("drm/xe/xe_drm_ras: Add support for XE DRM RAS")
> Cc: Riana Tauro <riana.tauro@intel.com>
> Assisted-by: Claude:claude-opus-4.6
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>

Reviewed-by: Brian Nguyen <brian3.nguyen@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_drm_ras.c | 31 ++++++++++++++++++++++---------
>  1 file changed, 22 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_drm_ras.c b/drivers/gpu/drm/xe/xe_drm_=
ras.c
> index e07dc23a155e..802e4bcb731c 100644
> --- a/drivers/gpu/drm/xe/xe_drm_ras.c
> +++ b/drivers/gpu/drm/xe/xe_drm_ras.c
> @@ -73,6 +73,7 @@ static int assign_node_params(struct xe_device *xe, str=
uct drm_ras_node *node,
>  	struct pci_dev *pdev =3D to_pci_dev(xe->drm.dev);
>  	struct xe_drm_ras *ras =3D &xe->ras;
>  	const char *device_name;
> +	int ret;
>=20
>  	device_name =3D kasprintf(GFP_KERNEL, "%04x:%02x:%02x.%d",
>  				pci_domain_nr(pdev->bus), pdev->bus->number,
> @@ -89,8 +90,11 @@ static int assign_node_params(struct xe_device *xe, st=
ruct drm_ras_node *node,
>  	node->priv =3D xe;
>=20
>  	ras->info[severity] =3D allocate_and_copy_counters(xe);
> -	if (IS_ERR(ras->info[severity]))
> -		return PTR_ERR(ras->info[severity]);
> +	if (IS_ERR(ras->info[severity])) {
> +		ret =3D PTR_ERR(ras->info[severity]);
> +		ras->info[severity] =3D NULL;
> +		goto err_free_name;
> +	}
>=20
>  	if (severity =3D=3D DRM_XE_RAS_ERR_SEV_CORRECTABLE)
>  		node->query_error_counter =3D query_correctable_error_counter;
> @@ -98,6 +102,11 @@ static int assign_node_params(struct xe_device *xe, s=
truct drm_ras_node *node,
>  		node->query_error_counter =3D query_uncorrectable_error_counter;
>=20
>  	return 0;
> +
> +err_free_name:
> +	kfree(device_name);
> +	node->device_name =3D NULL;
> +	return ret;
>  }
>=20
>  static void cleanup_node_param(struct xe_drm_ras *ras, const enum drm_xe=
_ras_error_severity severity)
> @@ -114,26 +123,30 @@ static void cleanup_node_param(struct xe_drm_ras *r=
as, const enum drm_xe_ras_err
>  static int register_nodes(struct xe_device *xe)
>  {
>  	struct xe_drm_ras *ras =3D &xe->ras;
> -	int i;
> +	int i, ret;
>=20
>  	for_each_error_severity(i) {
>  		struct drm_ras_node *node =3D &ras->node[i];
> -		int ret;
>=20
>  		ret =3D assign_node_params(xe, node, i);
> -		if (ret) {
> -			cleanup_node_param(ras, i);
> -			return ret;
> -		}
> +		if (ret)
> +			goto err_unwind;
>=20
>  		ret =3D drm_ras_node_register(node);
>  		if (ret) {
>  			cleanup_node_param(ras, i);
> -			return ret;
> +			goto err_unwind;
>  		}
>  	}
>=20
>  	return 0;
> +
> +err_unwind:
> +	while (i--) {
> +		drm_ras_node_unregister(&ras->node[i]);
> +		cleanup_node_param(ras, i);
> +	}
> +	return ret;
>  }
>=20
>  static void xe_drm_ras_unregister_nodes(struct drm_device *device, void =
*arg)
> --
> 2.43.0


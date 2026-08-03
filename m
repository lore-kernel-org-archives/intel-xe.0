Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A49BC55162
	for <intel-xe@archiver.kernel.org>; Mon,  3 Aug 2026 05:23:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC79110E38E;
	Mon,  3 Aug 2026 05:23:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f4LCsm/7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A801510E38E;
 Mon,  3 Aug 2026 05:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785734620; x=1817270620;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8PwEPFhCMGRoy1i49CkwljLf0r4AgiBywDgH3rQBLWU=;
 b=f4LCsm/7eAN3b6x+zRTtZYbFzHqWRZpDMuXFZ1l2YWK6RIj5klfGSVku
 3wKGkD99q4bbT61i+tGiRItvVz8yCy0KBYn1HEFlbss76UBlYdcnvG5VL
 4AlFxsorf1VF6BmbCjr/2VhvpFUtHGwmEvKdxnaC2p877QuCsIMrWHekQ
 9QnrIPG1+8CoZven2NUpYtq/O96ZG58eRBRWBXprS+glWsPM2a0v07Hm/
 NKXL1LW81+qY4ghHRvxlSSeJ+oKZw0Vd/uBUIm5xnk6PEGfWNFKt9yebg
 /W5g0fL5jJk8TM0Q5MZFrjkuH8Ly0YCX5GVnE9mhBvUbq1pIq9cV0EqoB Q==;
X-CSE-ConnectionGUID: RDnmn8IPTtWsrgyPqjBTOQ==
X-CSE-MsgGUID: CQ9F3/tlSqKcFkTco2c+6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="73800194"
X-IronPort-AV: E=Sophos;i="6.25,201,1779174000"; d="scan'208";a="73800194"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2026 22:23:40 -0700
X-CSE-ConnectionGUID: nvEe6rtUR/GWV2JjSLUYlA==
X-CSE-MsgGUID: TymLamfoQeGlgBV4QBCidA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,201,1779174000"; d="scan'208";a="261169044"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2026 22:23:40 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 2 Aug 2026 22:23:39 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 2 Aug 2026 22:23:39 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.32) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 2 Aug 2026 22:23:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u3BGHQUPG81vNmlBNaD9u5xjnwCzGeBTrnK1eJ05twufoPk7YMuehMELv4+HA2xrgj0qkzNRq2Uj6H8Hb23ofo3B74byynbaAjGtXH2ibfT4ucaQQkbrQ+TUdOS9YqpNVamwDJno/YBghket817Tg6Yx8fVtsZepIaEJ2yz3ea3vrZMD0wuwNLpJhj4XJ9IPVl56MzV2AlZ2ZumgYq0vHMBFxu7mSvYORyE4nKThRENT6FcODC6BBHYXuzIq7ZAAzkIOkwg8Nhwo2YQjgCRTwdZt7hAyVrPvJLtpuHowcMoxbnp3utE29dZIZaQgI9CZZ/p43k2fiuJp/CamDobYgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nI8Hqqpgy7HKUVRihyg0InP1henDZ1ybm52En6UZngw=;
 b=oHTQoE5Nhanr+oN/gRHpRmGVIhLguJQ/2QSl21JBUwO7iX232JNIS2ArY35yhcU/UPg32Q2GJLR4N5zGh2307MUaxNb+TJJsa+wB1o1SiY6pL6Ge+2eGIAOx8R4q2ApCJAnE3+jP6vKJnMndKPMW9sQKSax2s217laUQG9MLr53TlwtMgpSAUeUjdv8UXhX7qU61lEC1099PqmyAnQuZZ5ezF7/0CHKnyu+uUkqHGUjNJtpwwExv+WvyFlI7uEBUQTlpUPYWbjDEY611gJPcPZ8UZb1YyE6pOMSJvCli5bnuDGzUIgjNUTbFdgMvpPqRic1JzmxpgQFaNZ4OGzF4RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by SA3PR11MB8074.namprd11.prod.outlook.com
 (2603:10b6:806:302::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 05:23:38 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0270.012; Mon, 3 Aug 2026
 05:23:37 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "alexander.kaplan@sms-medipool.de" <alexander.kaplan@sms-medipool.de>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH 08/14] drm/i915/dp: Use the common downstream bw check in
 compute_bpc
Thread-Topic: [PATCH 08/14] drm/i915/dp: Use the common downstream bw check in
 compute_bpc
Thread-Index: AQHdIBUrRYof9GAQUUymvWOO5SLp67aL0DPg
Date: Mon, 3 Aug 2026 05:23:37 +0000
Message-ID: <DS4PPFE901A304FC2263C67C39BF7E3B5E7E3D52@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260730105226.2731341-1-ankit.k.nautiyal@intel.com>
 <20260730105226.2731341-9-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260730105226.2731341-9-ankit.k.nautiyal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|SA3PR11MB8074:EE_
x-ms-office365-filtering-correlation-id: 778d066c-a1a3-4997-ee66-08def11f5f5c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|4143699003|11063799006|56012099006|10067099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: QEP7LKfsplZYAZPJhHjt8Km25LOSREffkxDBNPxSUujDvXgZcIunM3OmZxYOquj919KkbNwcy7yA0GKN52Q2iSM9Cnnojk3y1yMbHr6tsBZi8XvkYIzzZPkVR1C3pntDcY4rX13vpCb/JECv6RZiAh9tovWpm20LRBzCcD/mkiJwaHmL9wYtHvFO7HwHwlJjvoF6BgwUW1mBH40NONz5UmicPM8Ye769SSraEq4ox7iZii5K+5zG9SKmuLtR2Ay63s6Yi1myurI8uxDErqAK/gmAM8GT+nWih+FT13LAEebzc20fpbLcqlECU+6fKEfJFagN0huJKZfZ5gQmXSvjceavEczcNkPhM3RAZrZZi4WaGjd4o/aECPFqHN0f7iIArFsEtt58RoVWR90KAM5RaoYcOv8agLbbnKxtOPpBP72RvFXedJrS/rsbn9d2clSNabfUekT+J/rTWWfMSXUiGrOe1rbI51bAwp2f/aws+NOWfT+PsSESiujLstorAZcuBPIWMro0O3/J8cN3vEXDamXDf5EcprcVlpoFmOh438o73RmqIodQfUVrprEBHBpKJVqi5A3ent3igJxkZSQA4wHO80yVYMp2bkJKSkcSCSt7luRrZLy/pTt1EORFlVL2EzymGQQxhkS3G3kabYRcv1nnoVnuct/VerUpN3acW5ofTKL7Asx4b2ZGnSfpxcmvjuYSpLtSXz+qvPy+lKdWVA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(4143699003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qbFlbFwLF8twdwS1m0rS7xBH4AGufdBJn1ClZaOhx8AXDuEAS/Xc7PjnmRns?=
 =?us-ascii?Q?p+/uxY1bq/CjVxf2YFkzq8nom0M16Mm7AKe2r08nM7c5rejFnBvg8SC5qtyV?=
 =?us-ascii?Q?XqQxbphUjegYu7PqDTjN+S98jRcvTe1KKzpOQCJ5/lPVhowvFnFq3tTgx+Yy?=
 =?us-ascii?Q?qdVxHzeacrRRP75VmNAr8fPzHBaBUPHlG8UykFcttacLI8KiexozmxKOf4qO?=
 =?us-ascii?Q?/cHeslHTgGyKjcPYw/XkMv+TQ605gDk0IbodHoDArJeHnM3t9cvDMFkyL2db?=
 =?us-ascii?Q?WrOj6m4uVFT1ugy7QaAXhA2p/47nlNF1dv+x4eJ2wrOcByKMfOV9EwRnDNDi?=
 =?us-ascii?Q?A0YdeZjK70MV+UBO6cLANDpmtopclClUyW2jCA0NyygPs9cU28WLKcEUJBl5?=
 =?us-ascii?Q?xNTpJBZietdafrW1G9T183idWPJORUWQFvNzY1Ezx8nJOZZtHgvlp34R8PD+?=
 =?us-ascii?Q?j+rLhV4NvIA22guXLSBpGDK5CNOfhrcRDhUw402peGoP472e+ik7ruSoxD2C?=
 =?us-ascii?Q?a0SoI/nuG+M/K8VdwvmiiSuR5EurF/QtLP++Q+6/p2LgHE/+UhzIPEzlm95r?=
 =?us-ascii?Q?u4DqGjTpa0i1y5to1Qe3cUCxAusKZZrKK/MRKHYH2X3eVCIDU8JxxOQpQ+qU?=
 =?us-ascii?Q?8nwSPOPWS1yztCdpab8SOGumWJTiMYOd/ScYAcelWoa3+ZuFuIMnJMsaAWET?=
 =?us-ascii?Q?TrNefKisXItKtSBO4mYTiY+p9mX/AijRHI+f8Zk2s3LkSxB+I0u+/NhUMT83?=
 =?us-ascii?Q?0DOJRwDtj6zrJjSPjN1j90hF+rGKG4WEQwqzFIk2Va2Ma5sYqvt6gTYj0saw?=
 =?us-ascii?Q?qJHS3Q2NBi83kQQXaxG+UMvHU2hGGsJN9YoI0gPVgRDDCw3E0dGFlYgYRB/2?=
 =?us-ascii?Q?aohhFGZzZMR31TSunmYN2yMnfSEXpeGMknkeqQqdcPv4/+vwpbIQgurNwnLX?=
 =?us-ascii?Q?FCfXBp7Xwg1YAeT9pg/+GFAgp0SRpe8GYRsH0V4dn+QQBvCOiWxLC4QjoFEs?=
 =?us-ascii?Q?b59poylvDzHQuKnZAfWkv1yPwDo/lKdchDDEOu4MR9ZzRZQIrRefzHKHrg88?=
 =?us-ascii?Q?CkgQMtnxMBlVW4ddItj4tLcBOp10hpSBnUIKje2q6SSdU/h92DuLy43mu6Y1?=
 =?us-ascii?Q?cizbZeU3OAMjrlfOfTHKZnErTRnDJ8Mh2kgNc1mrlYAX5N9n9vrQOHotVaPe?=
 =?us-ascii?Q?We96YHEAdR6DIrEQBDuMB0s8fDJTusGxcW7bWSg3IKKy40uRPyFwpC932lNl?=
 =?us-ascii?Q?NfCDcP4hcE+qZGxK887X3rgtQllK32uZDmzg4E2IGaAg3OiukFB8aWsaufDD?=
 =?us-ascii?Q?2z612aaPvTZq2W2CgdkqsUU9o2l/7DnFR2OuGcv7O0sDNMY4sgZIst/gQT7t?=
 =?us-ascii?Q?VimWw4ACfTyH2l6fDidCVsGFDK/Nq7w19XhjBGmCax3re+m9bDRTwHIDnWko?=
 =?us-ascii?Q?gUI04cxYwQHFC7BoAx0r1nwF49ZPgOqt0W13+nvbKs2KuvYt7h4qX4b5rcKg?=
 =?us-ascii?Q?hflT8zS0OLm8mZf584yug9wa3dXFqlKjxWoXFT600z15gGcaYQyW4nblsc47?=
 =?us-ascii?Q?OOHBhBd1OcPCTr+a3imBt8aPy51yvfZa+XtJQfoFJeXXRHN5OfjN5Z6ASN1h?=
 =?us-ascii?Q?aECdsZ390MMjsOysvkIj4c7l/kfIpWODbax2WSKB28HHbeF5VKFwcnWJVjpo?=
 =?us-ascii?Q?ejsViGcmsdkDx6s4iEqriGOMwweyVtj1vJrveQhyminlROECRT30x63i4e13?=
 =?us-ascii?Q?1noxQ3xgcw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: p7HwkktX9Sh9HadRwWWYV3+SGc0DzkUfLBpO+FdKrN/EiQBw0rYZxcRjaL1sbm4tquilmVqv3pnKnSi8dAf4Jnw7NnEzvqJFyBdGdFuDp57zbHfbeYvQh3yUjodPFwdoQHYwORO8pYm0MYk1PF96iZ1eNBvHcan9UnqYCBukAm+SST5c8+AKwcxJgCW3KIDqupepzwoxx20aZhJwunNRkguDWB0kdTKOiW9pOrUuqVCKBMxjjADkhnuFopxFFkiWRa6xLuHrIReV3uX0a0RnAuDCR2TpR6WgrqRotPxvilVo7ypaoPfeqTVY1pElmlypwf/WTBwAgzk2toiBZPGT2Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 778d066c-a1a3-4997-ee66-08def11f5f5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2026 05:23:37.9244 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qyPOqUlwPWlv9yOevtizx62jp+Bw4cmpwM4SB63VtNJh/JXRSy+IUETMKEwIY16vYbcX4glqkwLSu7uGMhvwGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8074
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

> Subject: [PATCH 08/14] drm/i915/dp: Use the common downstream bw check in
> compute_bpc
>=20
> Currently the FRL bandwidth check is only added for the mode_valid phase.
> Add the check in the compute_config phase also, replacing the TMDS-only
> check with the common function that checks for both TMDS and FRL.
>=20
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index d2d330b6c39a..9396f118d154 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -1662,8 +1662,8 @@ static int intel_dp_hdmi_compute_bpc(struct
> intel_dp *intel_dp,
>  	for (; bpc >=3D 8; bpc -=3D 2) {
>  		if (intel_hdmi_bpc_possible(crtc_state, bpc,
>  					    intel_dp_has_hdmi_sink(intel_dp))
> &&
> -		    intel_dp_tmds_clock_valid(intel_dp, clock, bpc, crtc_state-
> >sink_format,
> -					      respect_downstream_limits) =3D=3D
> MODE_OK)
> +		    intel_dp_hdmi_bw_valid(intel_dp, clock, bpc, crtc_state-
> >sink_format,
> +					   respect_downstream_limits) =3D=3D
> MODE_OK)
>  			return bpc;
>  	}
>=20
> --
> 2.50.1


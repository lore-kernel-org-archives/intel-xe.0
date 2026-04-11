Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B0EF45A12
	for <intel-xe@archiver.kernel.org>; Sat, 11 Apr 2026 04:54:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 501B310E146;
	Sat, 11 Apr 2026 04:54:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="khikdk0J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD0FB10E146
 for <intel-xe@lists.freedesktop.org>; Sat, 11 Apr 2026 04:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775883272; x=1807419272;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=f/Y9GNrhPMimA/1kVEdqeq73EySoRf3jusPdnI+R2zY=;
 b=khikdk0J2nC4VnViYAX+gpTIsTcHSIFzVwCW73dxH9eFebg4xv0l0qc6
 WsjKCuQds/Wcp0wLSR1yOx/Q/XjRnAdpSKRr/ofIrUYtkZJhaXz/8QTIB
 yKYR+OSFaU6Jv9D+4mw9N9biUr/KlCZG9rxwMwOH8PcpRir3iqthgRTrN
 GgP2vjxJIOxES2K+LTX6IHvo5DL05hHx97Jg2Ve3uNAc429BRx7uOiF22
 /hay0UC87qx5dWFLA3WJIG/vOWFrSOwm9cpgm7r3Gtml46HSl5sMgMyuH
 xj4rWIOhnhITNU/Y4HPDb39bu1o/7NOqm1XV8Dt8SQiopGmsVElcOaW0j w==;
X-CSE-ConnectionGUID: SOYr3BeuRpa9MN0cOk8Szw==
X-CSE-MsgGUID: 5zpAV6iNSgKb01KSwx7oLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76919218"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; d="scan'208";a="76919218"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 21:54:32 -0700
X-CSE-ConnectionGUID: l+LWs7EiRfGaRYLABIiUsA==
X-CSE-MsgGUID: VfwV4odWS9SVldp+CKQC8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; d="scan'208";a="228431025"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 21:54:31 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 10 Apr 2026 21:54:31 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 10 Apr 2026 21:54:31 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.23) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 10 Apr 2026 21:54:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IR7tPrU8xT1rvAFMfst4HGqwIAB2s2tVRHjILHggmDhaHW5CyP/qxvkIAwS1R5dK+K8Q7UWq5IRvg3YYWinL/aXcFCrk4xIdg1Pd4+fcZ8YA3ec/kFG5HBIbXA9s9CK9pwzJhbgJnNs+DzbLVNQ4VWfnUmUuvy0Qp3LMrw2KP66K07UgTgP+5DRvtObe4c8VE3XKUwl2/bXWIUkVvBO7Bpwl+h2L3i33LrZLKxPwT2DK2dpSAi+8E3rsZ+9ORKZAWgu1FWfPbVOttN00Ql6PzRxGjLg7s3jtEHjs6HyBelrxfZ0VnwYfy66V3Zyll15GvkMDAM3KsYxbgV2KcpJBcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OeuVXPg+Je3U5iMJvHTSV3enbkJ/5mP3LS1mki/JF0k=;
 b=R88WLyyzEcIjryq/cXMy8oGtDAEjEPz3F/uGVXtnGRr7sMCRBxXmeuPcxaWHz1QTrDVkqhYNjqVwtzlBxUoJ/4Usx7AdEFL8ELS7A6bofhT4viOBpeZEJsV0LUo0KO1s0QbuQyzBpZti6xRLIBIg+Z6VoRyzfz4BPegBcM7vVty3xHxRg8kvpij31XJC1H02muS3HowoTu52K/YTo3ZUYYH+QOBgmmwM9bYbWSboNlailgGjJ0giGrrfAlFLzbifuNPGx+AI0FdBbr278T+0l8MiYx+n2tK5TRaSElFI/pVeNrZ39pP5la7RalsxthYqYg2f9E+klVn5JB/4Rk+b6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8839.namprd11.prod.outlook.com (2603:10b6:806:467::17)
 by SA1PR11MB9614.namprd11.prod.outlook.com (2603:10b6:806:4c4::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.15; Sat, 11 Apr
 2026 04:54:28 +0000
Received: from SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::d917:ef8:5e20:14f3]) by SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::d917:ef8:5e20:14f3%4]) with mapi id 15.20.9791.032; Sat, 11 Apr 2026
 04:54:28 +0000
From: "Nguyen, Brian3" <brian3.nguyen@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Lin, Shuicheng" <shuicheng.lin@intel.com>, "Tauro, Riana"
 <riana.tauro@intel.com>
Subject: RE: [PATCH 2/2] drm/xe/ras: Clean up coding style in xe_drm_ras
Thread-Topic: [PATCH 2/2] drm/xe/ras: Clean up coding style in xe_drm_ras
Thread-Index: AQHcxuLFm+IiV7vW60+a6iarzM5XAbXZTq7A
Date: Sat, 11 Apr 2026 04:54:27 +0000
Message-ID: <SA1PR11MB8839B6A60B4934022AC2F0FEAA262@SA1PR11MB8839.namprd11.prod.outlook.com>
References: <20260407225913.3397059-1-shuicheng.lin@intel.com>
 <20260407225913.3397059-3-shuicheng.lin@intel.com>
In-Reply-To: <20260407225913.3397059-3-shuicheng.lin@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8839:EE_|SA1PR11MB9614:EE_
x-ms-office365-filtering-correlation-id: 329a0156-7051-4941-eff1-08de97866924
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|56012099003|18002099003|38070700021;
x-microsoft-antispam-message-info: ssJTHPy4C6p/z3CldJh88M4KrGqsA2R8wLSDf9ufrXrqHGmvypZifrvNtsvCf4kYrjkZz8gfSOzN//h3Ik8kywqCNnmIrP228LDAls9VGpJ2D4EUT/UGLaji/TuQt/dPVGd+49Kw3zjhgjKf2s8ShbbkdBcAsweKiyksS3KiKi+QDitiQEZV6j2wgScBxxeXle8usgbT4TpFwdwRTX/XKycUB+8mMvYCTd4Cqh+0J7PUKwuCmMtmlSut3IZfnK6hNR8YPlwwK/h6fEnKwujs2Ckk34K4A0Ce51rLC/DvdVXQgRCWXxDaty+7WKS+lofUqKjrVBq3DYrwf9kWY9a+x+ttfEs6sVDVwUg9MgfmYbHstVguK/+cW7oZaRXIw/4uQw4X/lwHuEJF5B9hSsIcrmHPnlTagFOydNOkIwa3QwEKN8hDyOGi+uIjvgrDhycIpWKta4AYGjhTaJhhaiT/wEa0hMYvzbGqqDsCXmKbFCuOvsPwBpCu89RVF85OBqxE16O2qcq3N4+AoKD2jR2Wehkst7/dm5jpncGcnH3WfrSia/EFTOAOo9FSTGtRD+lItV2vos/U1NfNBokGe1CtI2y3kNCtTaoNskI9cawoTbTS5uzVGTO5bw6kfXZD2Up2UHzv6GSLSrY6Frs7Jx8HBF2cwSU0wUM+ejBcJRSGr5bPy4YWiVaFva+lepd5Fwert2fZGDLo0LNgkyN5FCjDGE0ZmBXbcEAJ5s21CsONCXiOZtP7YrjOCnEM3eFLery37xVacAfBYPAbb9fdEOBOgZwCylIS/Y6Y/lJP8KJ33j0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8839.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(56012099003)(18002099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MSIuOa0JV27nQ0z1Or8VrZTYbm/SczYM7M8aVsCZe/S3Ek/818N4X1zRg7Wx?=
 =?us-ascii?Q?zzhQNVmuGRc1KLzcH9dakwFLTxQI0gGjnKnb/sYi//sy1rpXwIKoq1FRLP0S?=
 =?us-ascii?Q?lXQs3+lPZyXGWAHA1Mt4OlW6TTjFMWEXdPesnkxZwb9y1L8x8TOVCI+thxn8?=
 =?us-ascii?Q?3QUpTea6BKoMyxpY98FojxJLdZaogapiYTLcPqCpURaZFDju1QN5n3sPHn7C?=
 =?us-ascii?Q?7OoPj8YhEcUOO0D9+Vz9u2M60D/uWW3QPf0pk5/WfsatDaB/9XKh4TC6SH1P?=
 =?us-ascii?Q?oaCou0dkrPXe5Tz8Uf3qNzw6YJki6CWOgP6tpVwqlRMD+cHzdRA7BMm+ni/D?=
 =?us-ascii?Q?yiks7d2CpY7CLmdHvDPxDmNidQtOOetDUf5mzJpSdTqLepmRChU+6zLgkcQw?=
 =?us-ascii?Q?knAnd/gnJ0h2Q8Yy4pLUWhiUbW7+X9Jsqda3hKCbOfHgdrtDC98AInFQdGn+?=
 =?us-ascii?Q?Iiz3MDiq2cbldLyV+QCj8KjUugxxRrAOZ7kBxSFv8M+OFIPogPFGQtiz6XPw?=
 =?us-ascii?Q?54YeJKciXj8Fr9ClgqbYzRgeoBdr2UiLBAgm4xT/C+Vc1yCJuJfjuv0ZntY1?=
 =?us-ascii?Q?i4U1iUDwcZm4oKova5OrVfM/OmHN5LEotEqt+nDZWNh99OcjD7463MyzZH4D?=
 =?us-ascii?Q?HiOxaMmhq9VXoRZb7GpomZh8OBQaU6+SuwJ7nx7o6MpCqAl7JsD/sZsyfIrF?=
 =?us-ascii?Q?+7FSH4g9bJrVvwqM8UwtRKIhy1YAYWF+zJNTYgV7uL03+HrAHMITe50Z5Ynf?=
 =?us-ascii?Q?RlUtRBKsKpntivqDlFwGyPUyFLgNodvRHGgCBeQiuCEC5EAfiKZS8B6W2EyO?=
 =?us-ascii?Q?4+bNfg6WlNTilyNvB+Dye1dpOisNBcQp9UFfVf446Ns4bz2NJG0F/hw/vBgq?=
 =?us-ascii?Q?WZPCE3WPFfQTyyCvdjK1o6xWVH1oYjXzsxjm6veHSJJoDzzBLjEsM+FUNnPM?=
 =?us-ascii?Q?3UVALvuqVrnZ4059cFOpvGmRpUKHZqOVrT/0khBU4E5UfGX9HwsWEFNfBFiH?=
 =?us-ascii?Q?7g0YY/fpa1QLQrb53IOFfI0m5X+dW4DLeRu2dm2U2Y6Ec1ckwAB3Vpt4ciR/?=
 =?us-ascii?Q?syOks8vVAuenyty5LG6MmTVjlvLFOvcZv+KiVm3Ra52gFNy6zUNp7hkJm9hH?=
 =?us-ascii?Q?TiJRHJ2OrFI8YFpJvhiUu9+UYvkFbFqS/NO9epNtj3bvOWVR8/euweDTilEW?=
 =?us-ascii?Q?Sh+3UWRhmqy29J7CFQk+WWP2PhHbjsY3J0fuyT1XcOS9rE8MwuXdaxMzRAQ9?=
 =?us-ascii?Q?xSRZTc5VYwzelE2+LxPtWM2Esci35vF385OuKCBwRnqRtkVaQCTl3pVgICfS?=
 =?us-ascii?Q?W6HpIOAnGcZqKq1c1a2CWIYoCXcK1Ji5r0OxALpgx+Ysy2VuKIG0bpXkSXT0?=
 =?us-ascii?Q?H2AshLh55j4XMLBQN6FhTRoWgl8pVW34zVnvp3mLGj/gYQ74/HEXaqLT9lxa?=
 =?us-ascii?Q?uwN/dcdZd8B8UvzjiqRE3S+yVCTq+iQv8/H+KGaz/ZV4SRyzbTF8g9IsxL79?=
 =?us-ascii?Q?CA7M5Vd0O8yqof6A9N/ylpdmZ3SaB1iitXB2v2JfDJy8zVSpJA3GiPG5IHdF?=
 =?us-ascii?Q?6+u92fAtpU6RU/W8fn/rYNKtmWrHNKphtyMQoN6ZiYoZt2R38kcRYCtzD4dy?=
 =?us-ascii?Q?nBgWFG84rAW6qv0Owwapf7cWHmDzpaDapjXbSDNF7z2Oi84QBrwqPxVFC2mn?=
 =?us-ascii?Q?X7vfBq0YMJTiYcnGb2sfgYtRSL9HSMstidNLv//4HyiPMKFG4xxUB22I/7U4?=
 =?us-ascii?Q?Ad7gNfgZfQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: INJ+tsAFzLOGYtGxRCiDp1oDnAxRd04vTrOWharVIRjGWDlqKJ2mv4QJVmuWXuUNlwEJ/X8idHgCy2iXrqBc9CFDllSSNRLbZ1TMpfmcdUA+fJpUdJffTcKuvlXoYsc4TXcsuMB81ThLNAxmWAm0vAVbfQJwUXX7BWulQCSxKiCwNnOnlmncy8M+eHHqVaTaq8+J9wB4g3MsmdUknezLn/U3dceD7vtCOA1hlA28EmVGWXheKKoXA9cwk3bsFrPaPRpIUbpJJo1RPFbJrohSuN4PL5QuaKBgMbwN863BBaP4fKqcv3FhmVOVQarKEjgKgzy+nTRyr0WB5zME8tu8eg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8839.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 329a0156-7051-4941-eff1-08de97866924
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2026 04:54:27.8478 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NOk5GPUb/PNhdKLw5AR0PiTC+TrZtXKxoWrSMN/Io05Q03GfHDQbWPEuq+YHPdFiH5ubvKmvLa2c134tS4Sd2A==
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
> - Fix long line in cleanup_node_param() signature.
> - Drop unnecessary const on pass-by-value enum parameters.
> - Simplify xe_drm_ras_init() by removing redundant local variable
>   and redundant error path.
>=20
> No functional change.
>=20
> Cc: Riana Tauro <riana.tauro@intel.com>
> Assisted-by: Claude:claude-opus-4.6
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>

Reviewed-by: Brian Nguyen <brian3.nguyen@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_drm_ras.c | 19 ++++++++-----------
>  1 file changed, 8 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_drm_ras.c b/drivers/gpu/drm/xe/xe_drm_=
ras.c
> index 802e4bcb731c..9cddad2be549 100644
> --- a/drivers/gpu/drm/xe/xe_drm_ras.c
> +++ b/drivers/gpu/drm/xe/xe_drm_ras.c
> @@ -68,7 +68,7 @@ static struct xe_drm_ras_counter *allocate_and_copy_cou=
nters(struct xe_device *x
>  }
>=20
>  static int assign_node_params(struct xe_device *xe, struct drm_ras_node =
*node,
> -			      const enum drm_xe_ras_error_severity severity)
> +			      enum drm_xe_ras_error_severity severity)
>  {
>  	struct pci_dev *pdev =3D to_pci_dev(xe->drm.dev);
>  	struct xe_drm_ras *ras =3D &xe->ras;
> @@ -109,7 +109,8 @@ static int assign_node_params(struct xe_device *xe, s=
truct drm_ras_node *node,
>  	return ret;
>  }
>=20
> -static void cleanup_node_param(struct xe_drm_ras *ras, const enum drm_xe=
_ras_error_severity severity)
> +static void cleanup_node_param(struct xe_drm_ras *ras,
> +			       enum drm_xe_ras_error_severity severity)
>  {
>  	struct drm_ras_node *node =3D &ras->node[severity];
>=20
> @@ -174,15 +175,13 @@ static void xe_drm_ras_unregister_nodes(struct drm_=
device *device, void *arg)
>  int xe_drm_ras_init(struct xe_device *xe)
>  {
>  	struct xe_drm_ras *ras =3D &xe->ras;
> -	struct drm_ras_node *node;
>  	int err;
>=20
> -	node =3D drmm_kcalloc(&xe->drm, DRM_XE_RAS_ERR_SEV_MAX, sizeof(*node), =
GFP_KERNEL);
> -	if (!node)
> +	ras->node =3D drmm_kcalloc(&xe->drm, DRM_XE_RAS_ERR_SEV_MAX,
> +				 sizeof(*ras->node), GFP_KERNEL);
> +	if (!ras->node)
>  		return -ENOMEM;
>=20
> -	ras->node =3D node;
> -
>  	err =3D register_nodes(xe);
>  	if (err) {
>  		drm_err(&xe->drm, "Failed to register DRM RAS nodes (%pe)\n", ERR_PTR(=
err));
> @@ -190,10 +189,8 @@ int xe_drm_ras_init(struct xe_device *xe)
>  	}
>=20
>  	err =3D drmm_add_action_or_reset(&xe->drm, xe_drm_ras_unregister_nodes,=
 xe);
> -	if (err) {
> +	if (err)
>  		drm_err(&xe->drm, "Failed to add action for Xe DRM RAS (%pe)\n", ERR_P=
TR(err));
> -		return err;
> -	}
>=20
> -	return 0;
> +	return err;
>  }
> --
> 2.43.0


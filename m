Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE792C55822
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 15:21:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D22E10EAE7;
	Tue,  4 Aug 2026 15:21:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cCXpJyes";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 406AE10EAE7
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Aug 2026 15:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785856895; x=1817392895;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OH3rOmpDTVU5wX8O6pGiCu89MFdzuHidvxkYfXxdl2w=;
 b=cCXpJyesguNXMPYPeviL4KSYcT1ECLHjy5UAxzhTNwXhdUhig8kamQPJ
 NkvCDCe5ue/FpM+nMFRNCz/PYL3IqGPN4JBrrxGqprM06eR0OBLZBXC0g
 jJvnUyWRIf6p/Yx5Y4W1tyhJlnI9iUSj6g12pUTeDZs9fFPkwkKG3XDwY
 YiYTybg1E37gqMvUDaqKk2CPyWx+K5LV+HBs8vQJ3tuS4L9nZW/p4BHbv
 ybzfDy4xEhOEdPvoIV6KdekWr95Q/f3Q52Kuor0/fiG32Uc+zi63NwVk0
 TrujnegbpLpny+ksI7pd3JTtQsgkbLuzkKlGM1klNJSg6QxmcaHpzclym w==;
X-CSE-ConnectionGUID: V0qp/3JgRrOtz3+yaFLyhw==
X-CSE-MsgGUID: shT4ozNdTjGsfn3PKY+wQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="96770229"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="96770229"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 08:21:34 -0700
X-CSE-ConnectionGUID: jSKuljaHRDiptRWf+5JMqw==
X-CSE-MsgGUID: 69Z5lCOPSEualOT4Hgk15A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="263526284"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 08:16:10 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 08:16:09 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 4 Aug 2026 08:16:09 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.66) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 08:16:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vn08daoG+TYNRjpmWD8PfHk3aWd4mYFh6qM37tJttO503k/vMLpcfKscS5nBV7W6ebkL63tycVcAMIuhoQKlrEwfJjysy0h4tbIH3YlC133yleuOBfSrza6G3iIwThanvuUx3akxVcJwC07tZIZw8IN8bqHfguaUapWZh1TWa9KHuMNyFaXvrE11bbBHF13SutN7DXa525W7b/3OeK5AElkSO+wuY4MEwlLEeIjZEj3hu6c9zi3XrIglrI7o1vsY3KSHkgPoFz3fsGP6e702puCvA+TtZiHQa/+/KHx4i/7ZaRhkJitWcZA85eHj8DjvNF/MC4hcolnBNwDOcXRwbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SJ6vhpVYEEy+XoWKx7gI7Qhfey8cHp/lctegpLuy8ZM=;
 b=VNs07tZQXlYd3BawM2vm9Ea4zUSM3wCeHwfjD9Q+cMiBgl9zMC5Ctk/z7IKp76g3DA6Xvnu3SzLn0zpqGLwbqoC/7aze1cHznny1P3rew7Lel1zxiuTjZjx6vhjQD5kVPdFwOA+58v9dqQv0jxa5EvxlN9AE5z2KoAmosgHiYoncAP3vh3GCwdhFhLAnp1qtNGstfAKHObSL2zI/c0pI1tdurUoRB7FZKJJ4go90So4PMYT5C0awlCUfOrtWrtqU1mbNirEqspmrv8DvcDdOUP9839jOXs6whXxeqZ3KJs2//PdzDwJQZSDJ87YJIwfefHNsAhL5iuER6ZsQ/88Wxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 PH8PR11MB8258.namprd11.prod.outlook.com (2603:10b6:510:1c1::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.15; Tue, 4 Aug 2026 15:16:05 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::22d9:ae03:5db1:680]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::22d9:ae03:5db1:680%5]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 15:16:05 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>
Subject: RE: [PATCH 1/3] drm/xe/display: drop redundant intel_hpd_poll_fini()
 call
Thread-Topic: [PATCH 1/3] drm/xe/display: drop redundant intel_hpd_poll_fini()
 call
Thread-Index: AQHdHqB64lNLXgCobUmoA8sIwA3/27aOCrVQ
Date: Tue, 4 Aug 2026 15:16:05 +0000
Message-ID: <DM4PR11MB6360EDF0058411C6CE544818F4D42@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <cover.1785250188.git.jani.nikula@intel.com>
 <6c3a537d69af2bca21e9f04cd678aaf9d72f7c8e.1785250188.git.jani.nikula@intel.com>
In-Reply-To: <6c3a537d69af2bca21e9f04cd678aaf9d72f7c8e.1785250188.git.jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|PH8PR11MB8258:EE_
x-ms-office365-filtering-correlation-id: 4431100c-686a-405c-7d79-08def23b4db3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|22082099003|18002099003|11063799006|4143699003|38070700021|10067099003|56012099006;
x-microsoft-antispam-message-info: 9azVI1qED29D/FDb0GyfK1ZyphDHvYkHL3T29nMzG8RVQuTLDkdZgqZ1wqOgodhLkjeaJgSNoyEAJ3+T/ScPhuMxyfL5XUUqR1uVi4cZ04ual++OAnbB5guu+nuXEWSP3PD9Gfe1/S+rDglpXVlqESl8tzqSyrNlYWzZqMdHFYKid0Xx80tDfGjQUNgQ577+NGmzsAYxN11MNqTl4MGAdWrpwH/88CDJJr5rNo7pCvYQBwF2LzF+h4dokxmF2VYF8eNx5guWGYXwEA1pfve198ErW4gGOibNGNsQ05JB04IrEBBsNCZThsuwt3djEBSk0NbfpirfmSf01G6J92OzgoyWzDvqmPAHTKhv60wgNZtLkcZ5WlQJd787TLaf0oH+4jKstWhxcb+WWu8aDRuE34hpe+nzp10fYIZI0VZJ661qFASaYWvNz4WvoyZl9A91zWVVsZfoByDRKIR+ehGbw0SOKiaDqurXSwO/NhALbqQA4tEm8ouzk6lhS3MvgJuqy4Er0cxMSP7X/TMpz1sYH4rjq2wuNA3FPtp8xd55mT95IR1n+691Qzjxft/tCWMRXOv0T2JFPvxePX2cAXFRNS4adUeuj/XDM8skOGyK3WceLRearJi5JGuK8cA63ZESgVBhLxmZ/CgvjZlD3D5gkT7Y+teNYqt8NGTL0pV1HB6LtAK/6TcnVzDbaJuNccc1+8qz4Q3Kwr8W8b79XZP0RdN5fShjOSJqtLhtlxQ25w8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(22082099003)(18002099003)(11063799006)(4143699003)(38070700021)(10067099003)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?T08TGPTz6OJHD8Sc2LXtKG8p/3NmJEvJJvFL9l6MGaVkseRImjK/iDwmfTO4?=
 =?us-ascii?Q?6eUv6jw/NUYXbew98N7fY5NqTXCt9bP8HbfQ6G4NZizprNYToffcesqy3JiR?=
 =?us-ascii?Q?/3TqqyPgNebiKuD3sYJay6Dvq1uzgMx7Sc1oeBhrce9IIFuAwFx6Uz681Bz+?=
 =?us-ascii?Q?mLJdJvjKEtvpB3HNocFBmWPvrgmX9LyWDhpejbSlQ9r30iXJcFywBEdC/foN?=
 =?us-ascii?Q?ie0pTJOaueOzS8KJO+hP5WsJ4vR+fn2Hcsu0XPg/HMUGG94nWl0NgrsRcRIU?=
 =?us-ascii?Q?HDfebn3E0f1GVm1lyn5QaXVRDLtQLelbd3VXDBVH+OW3Izr/EpxSBz1kfrLX?=
 =?us-ascii?Q?vtmXtnrVT0ZVcsxuGXjAOH5HkC28bYjJDrh86Ov5tenn7bQblryqA9mlHeBu?=
 =?us-ascii?Q?oQpgE4Xun7seGv65nAuxmf+F3p3tc4VNAukURIdzdKuQ9AeZLcx35x2ATNRN?=
 =?us-ascii?Q?0Eq9YoovJ8shKm3nyOqj/uNm3zNz/HJck5B+zQt5UK4gzgmPyZYnzsfajvRC?=
 =?us-ascii?Q?oA2loFHweHrNZ4kfJh8EuGoEMCBD6t9LXRohVCOKAGvGeUmkCdKB1wbq0RA2?=
 =?us-ascii?Q?q+wxjFIn/MGgAeOe+G4ksQBhyhgxi9AWaJj3T/6PVX2qXm5Dl/7JFyENjc4Q?=
 =?us-ascii?Q?2trujwR37r/fDLJJqmmLfok4/PXfm7Gi360jBMKjaaPiLee8LimHLBW2XZ5W?=
 =?us-ascii?Q?STcEJ10bBSXFT575HUdZ4dP1P0g1wDJtGI2eRJqOovOx9gLJkwl3PeaZaUxg?=
 =?us-ascii?Q?qub9RzwLsH/4o6+P0r0o6Ws8n7KLoVIDC5k8VsZrYEsbfCkDu0IjClfWuG2q?=
 =?us-ascii?Q?StQw/5Aq0cLVxpgOwwttGtscIQ7oMsu3sh5fa1FVL5kG0ym+ZWNR2PZK1uit?=
 =?us-ascii?Q?koK2/8ujx3UyWTOO0sU+6uwEXqYN0u4c9bpVWo46HV2LWDYhUjH2/e/VGWE0?=
 =?us-ascii?Q?DS9fyv/XinXqy5k7dJmpMUfD6605xjnNCBXdbWAdjN9t58/2Rq3j+IWGlF1B?=
 =?us-ascii?Q?AJOk55vl6eZ4frwod7nLYClEB241jvpjWlFBNUgJQn8SbV7UHZfP8qfihEfe?=
 =?us-ascii?Q?Sw33De+y5bXzgpTag/YOQvAQWrLSmoP5dg1aDftv7NWsL8AKPNmtoZHr8QsU?=
 =?us-ascii?Q?BAZiFlYcXIvzvqSxKVGSuldlkZ2Q0IUVIj/xoyishgbIdtIPwsqCuqsGpdDy?=
 =?us-ascii?Q?M3x3dkuicXC4dPY2/Zvp6nUQr6X/GTgog/L3gd7rJ8HA49j2jqvgiL2n5FcU?=
 =?us-ascii?Q?B6HRclC/SYE+7vhzTVTafq7QwZ+C53CKqxqpg9+lry4qzr1Z+uslJJPhrjS7?=
 =?us-ascii?Q?kgbNMRqR0M4s78+y38C4G7+Y1HjNVaEw2oPtQxtsOKLgb/1UauizkdqOYxQ5?=
 =?us-ascii?Q?KWBDYMOdPbpjkMsbbVmeaFPsv8KhT4dd0ZiZ7qz5Gz9CjOZXPyBqhgtkuvxF?=
 =?us-ascii?Q?DhqZF//cEGTJ26EVBGzz1Mdetbsh0fWEU5Nx1TGmtEHwElATh9HOxQgTgWKr?=
 =?us-ascii?Q?EgouvXmUMRApMIROxMVopBgnS9rBgKIHbztt2AWXfuLrlEKH3ZD8axubx+WM?=
 =?us-ascii?Q?uLjiP5fggvcvp7RRZa/niqZj14GpHRW9g/G+43xKRXRUbRK7QLmQEZBTaCh1?=
 =?us-ascii?Q?K3DbEABRPlegIn26luedJTwDy0WEDUtj+ljXpCEtc+Z4+XqTdQxZk5i1hVMl?=
 =?us-ascii?Q?kmu88y4xjLzeeBgWSb0SrwbxpQywxu50403nzRehIP+zYkBwV05zSlFxQV4T?=
 =?us-ascii?Q?gJ2nVjSMgw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: KQlOZ2ZJrWCrF+nnajL8EesBHtFpaCU5sEn1KnZHHx7ApK4X2P7wJ2xHiTiOdGnDtvWdk/RqlI/lMNwKz8Qp2gbE1bMHh8NoVU6l7zuZVPXDYxD+9Ttr23HO7dZA7VY/8gfESBogQfEMfBbPwADxubttfAL9xdOZtFsp0jih86j5VHe2eWseOXvy+mv4yaXeqf8umTxa6cADscyaonZo/MxgrN0fZZ5vEbMl1IW7v/6YbHJzGLeQdKKGhYlX8JivQRagFl5dp19RYnGW0j2wW4JydwOJ8GhMoyEHJIFKBm1S0HU4qSbIpw5Uw554+iP49AVCzDNZsaICIfX0v571kg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4431100c-686a-405c-7d79-08def23b4db3
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2026 15:16:05.2373 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yLks22TZpp48VGCptKtwThCRkF20bxKNc+RGvp4+4u4MHYwsu0g4betJJG0Xs1DcZ/RA75bLUkw/14iTFjBKdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8258
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
> Subject: [PATCH 1/3] drm/xe/display: drop redundant intel_hpd_poll_fini()=
 call
>=20
> intel_hpd_poll_fini() is already being called via
> xe_display_fini_early() -> intel_display_driver_remove_noirq(). Remove th=
e
> redundant call.

Looks Good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/xe/display/xe_display.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c
> b/drivers/gpu/drm/xe/display/xe_display.c
> index 8da4c457a4a0..57088e24aba2 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -129,7 +129,6 @@ static void xe_display_fini(void *arg)
>  	struct xe_device *xe =3D arg;
>  	struct intel_display *display =3D xe->display;
>=20
> -	intel_hpd_poll_fini(display);
>  	intel_hdcp_component_fini(display);
>  	intel_audio_deinit(display);
>  	intel_display_driver_remove(display);
> --
> 2.47.3


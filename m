Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F9BAC02193
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jan 2025 08:37:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE72D10E1BB;
	Fri, 31 Jan 2025 08:37:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RsEN0O1j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93E4610E1BB
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Jan 2025 08:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738312638; x=1769848638;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uPkz1orGctwukJy5YFZUJ8zC0NTz1ZDc9VoreQKQrLM=;
 b=RsEN0O1jOd84j0id1B2LVtvtgx0H/StzVYe3i5YhoETpVuQFttMhMlgq
 BJLOTqS5OvmTl3llvYRjNs6KJQJ3jStfR/nkbAo4sJTE5DGlJfFJiURe6
 4i0OzdD3GQB+ThJf+1jMa7Y2yP6II9i8U/DLuaXstv5ZLKg/TVW0/7xno
 uvoBGbJpTmyKCnq5FkOwVMsRtqoz2FgqSg5Q1ZpNqp2CtYt0uXrbO6LD8
 MGuQwo2LlaIBEIgYeQMtG+JdDaBLhnWMH4X5vzr2zoHRqLDXIXmPSCv2E
 6NAaBiuV/0Odaowv4pXHU85woeJlW39GVRJoC+tqEVKFt0Tn1s2zrpVi7 g==;
X-CSE-ConnectionGUID: AcJMI3hPRueXFH58l95FYA==
X-CSE-MsgGUID: qEjATa4+TNuqITVCn12xmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="38759736"
X-IronPort-AV: E=Sophos;i="6.13,247,1732608000"; d="scan'208";a="38759736"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 00:37:17 -0800
X-CSE-ConnectionGUID: /Gu2m9ktS+a0Z4E/cmuFZQ==
X-CSE-MsgGUID: 4Kh1uG8LSBKkpyTSS3yO7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113596458"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jan 2025 00:37:16 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 31 Jan 2025 00:37:16 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 31 Jan 2025 00:37:16 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 31 Jan 2025 00:37:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xfOGwAYpJ4IJzSA4PMjvgukTzAlfUigY7rw4xiBWGM2ZncdRAZKSuCwIV9hxjYUnIHh4Dy5ayWLcQnN9rjnpw9JSNAkRNyfvSV8LQla+5Y04izEnZSSerzldGkMdlgNE4wOUimhop3DiqecsI2F4mmcsvXvJEDvDR2vpul+XHOuJVB/TrF2phvYAwUlT5woKvO8GWKr+TvXtATvtFaQti72RL5DUJWJu7o5KAEpxDzySa/ER9jb/7Q8leznGmKiNUKtmoryw4ljxi83SsUyjdU32F+va4kZYP31HgYtwodtv2JkssscrVlMrXlJYdCh1UveQp68KUKy31VsHyQSRHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fZubCkaitpo/WLxYyrpYZhJjrXdW97lakx8zEidfovM=;
 b=i6e6qo+MMFADfKHnUAjPMGJyQRyLZFzQZDx3DzgkJZn3c2+JviKIiNaCqzFfj0y862BE7XV/fyXl6+3Jh9e+PxDIbmGTWJ9WUBrIg2X4JpFquXzld2kBbVCd7BLJKFfu7J5teugEmjdafB5BNchR2X25AzqfezytsDqPaZ9qYEEe9oSEg+NEG5h++qVblJg1iBe2MioE3FM9IkfFEN6eW1GD2KXihyurm0IJy9U9T+kbRw5k2W/FWgkX5o5rSXMVvGE2MZsM0zm0f5Ul9m8rmVMYyL8S/0wliLdlBVmVQy7OrRcDLmScfgqEuzNCh2irKTeAyGVZJqSZ3krB1IBjjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by SN7PR11MB6774.namprd11.prod.outlook.com (2603:10b6:806:265::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Fri, 31 Jan
 2025 08:37:14 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%5]) with mapi id 15.20.8398.018; Fri, 31 Jan 2025
 08:37:14 +0000
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH] drm/xe: Skip survivability mode for VF
Thread-Topic: [PATCH] drm/xe: Skip survivability mode for VF
Thread-Index: AQHbc7QPON45xeIYEECMd/xoufmExLMwjw3w
Date: Fri, 31 Jan 2025 08:37:14 +0000
Message-ID: <LV3PR11MB86955F5650261C62E14F5C94F9E82@LV3PR11MB8695.namprd11.prod.outlook.com>
References: <20250131080527.2256475-1-riana.tauro@intel.com>
In-Reply-To: <20250131080527.2256475-1-riana.tauro@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8695:EE_|SN7PR11MB6774:EE_
x-ms-office365-filtering-correlation-id: a2eefb44-7fd4-4f9c-67db-08dd41d27682
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?X8NkmWZ4OHKGAZHaWOpT9H4TH9gVEYcjx892yGgDiMG0mNQOhJQ1Uu6UgeJF?=
 =?us-ascii?Q?ApGZEcHKZNRADqY24Y+DQbJvrEPtPqt6Ppn9OzrT8LePI2HxuIQc/1F0A5X4?=
 =?us-ascii?Q?au/C9izGy/fW2ZpGAXJJeAB/idmNBycZ19pHJ4QtjeWb+qb/cnc9OcMWg1jN?=
 =?us-ascii?Q?x1NUAO9WHFB4XnjoJYzYMeivByF3sXE2TIRV8XwfH2eDkiqgZQs8rH7sNNwv?=
 =?us-ascii?Q?XTxgjVJuwhWZoJwcWmLTPXguuVRdHhSFASjFxKS2DQVSlT7dXnkZapAmqOfA?=
 =?us-ascii?Q?wP5FxonWduI3N4dmoOyMP9g7tNbXv4azUThkGeN7iTeEEq+0emjTnTpj0Jgk?=
 =?us-ascii?Q?CqCJBJeukJULuNdx5jLmiah0t6n+tkkgcqNEZ0hpdsOFBxnpGLLt0TMnlqIV?=
 =?us-ascii?Q?SwqVYkJFUzOSH3O4LStnsECJdfHNWAbapZ31BoqKHkB/9RBUGyFiiw5ZCuh7?=
 =?us-ascii?Q?OIA34Ks8LrXMgKsLn4IMxVAW1uH09464zXohxVtMX9/ePbcD6zo5HicADl2N?=
 =?us-ascii?Q?KyTx9idCi9Kz25cE7tT8uq6E25TDLx75AW8S695FPqIiV4Q2okAdJ72BcXL9?=
 =?us-ascii?Q?iKYuW19+SetXbsglDVclj9PCdFbyzlIGlFKGPU/kt9V2GQyCfMObpx7J9EIY?=
 =?us-ascii?Q?8vr6vNC2u4MeUm64thZkhtZCdCRuIRkGgufbqF+fGd2Qd8JMlT2/aADyNEmu?=
 =?us-ascii?Q?C+wHKvqbesPxzWy3A7ryw+fsG6CvHa5HdxXejZ4JEy57lxYyWwoRCUVeuzTQ?=
 =?us-ascii?Q?kFUhPVHjDQT1g5+zv5HZQcfAs3HOJQaj9irt1otomZHmVWWlJfam0nW5w3bw?=
 =?us-ascii?Q?8tD6UdfwUTEcCDAsGnI5I1tqUah/IOCPc5+0ib5oktNpV7+PMRUhot7u/ks5?=
 =?us-ascii?Q?1BYXNkXf8i4tRfI7T/rQUxJ3GSqmiPQ6nZa1pHremjUYCriiuSD2amJ2nERI?=
 =?us-ascii?Q?UK7DXIIJrFT/KsmN6wecK/8e3WaNRhQJcc6GqDkxQiNhJzbZT8mOXXakEslv?=
 =?us-ascii?Q?jR4CQNZVV0DTytMANzWNty/+I5WCfdPF8nr3a/i3GdWDXxHru6Pcty8fH0dJ?=
 =?us-ascii?Q?folvdOFH4RQvV4kJOHwYNoyXwzLia418JvLE952Z7sOzcDi3kbMgVeWFBACW?=
 =?us-ascii?Q?MIMo+x2UggTR8pHDAFeJCrGisWh4Qzgkq41Mva0gTpmyyGZ/0In3HxmfaLfN?=
 =?us-ascii?Q?+DLQTw2+JHglnwyLeHdNV/6khOP6xJMMqTWm8+N+fuhHud/cmm6H/31NNjFz?=
 =?us-ascii?Q?9qHE6o7/eg5slvIji2RCoPA509RGFmMwFZ9fzTsmViOsghHLp3MfjkyBshq8?=
 =?us-ascii?Q?js88jPYICDnY+JhQwpnsxel9zRl0JA2bPyXw+gCYoBLOFPWxBawXzdGNkEy8?=
 =?us-ascii?Q?Omc+OrocCId0VxyALAtgvUA8xrH3Ltp+sCI7fnW81XH/x/TpvCp6NUj+trVV?=
 =?us-ascii?Q?jeF2aljl8K5hGtLolHOItcwEux4vMBCr?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NS4IUk+HyMWXhvf6I3ZvCzH+LmTBg3js/P//hB9cNwXrEnp28c501Ccr2cqP?=
 =?us-ascii?Q?t39RSwBebHy7L2WM92cf7FSBW7o186Z043Td42GK1PWeFOmzpZsBv9AqgFnP?=
 =?us-ascii?Q?czOlmeI8eqEOQh1SIaejFyKqUGlYTLt5JVXuMJxCc17+c3Jc5F/YsZzvXIHw?=
 =?us-ascii?Q?TmHdUiqqB2oih+e2a/i5ynvzFDvChDHAKX/A4hd8qJLTeu2MFxk0CAMy7k3k?=
 =?us-ascii?Q?T+huBPyH2XlkWBmIoF7+QTUpFFOtQAUSdysnyN+Q8SsJzhftTwi9zWKKpulP?=
 =?us-ascii?Q?/lUEfx46sfk/Dkd3bsiSlXVt3Ci4K9ab8oj/EnEHt71C4S2G/D1wKWTjzuQn?=
 =?us-ascii?Q?FAo14htC707Ktw+bQLbFSGbLhVkyuQMKj94I1G++g46QctMbzzoDmuxuuhEY?=
 =?us-ascii?Q?eKBFFuUJW9hr57qI9KarO62C6zsSPdIdhVcUaz2AZnMD6dzgVHwhqAkxsl/L?=
 =?us-ascii?Q?R4V9EM8q9sn8VhY88uBvmRvdV0qVHLNBeF8mBZU6/my0i9Gn67qFU/ABB9Ve?=
 =?us-ascii?Q?BS3eI+JLvfwJejMTN5ipqmRke6gSbUj5CNiUHjBQG5jy0mPoaHjQl1EiUnuO?=
 =?us-ascii?Q?Ovw7CakL1cgA9BNu0kckRcR1+gNIvf2AKn5nauszdy0wfqv8wNgEq0P/Ff0p?=
 =?us-ascii?Q?wBOfSMsCfRlqZuQ8nIGLrtU7rr/vLWw3+XA0gC0sUjezta/dQVm5+XodFeV5?=
 =?us-ascii?Q?ZURpLlarNVKtKuFsb7g/Pr6uXOigyssZNa0cfPlUVyH4BA4c8THCrywJoFcD?=
 =?us-ascii?Q?wjwR5E2VI3pBE2bxA5cyMq7+2ZY8PXcxVGMPghcPch3FT4oAnerKCMWQwZgi?=
 =?us-ascii?Q?qP++lBSydbnL/OrXtg6s4Cv6bg22qiiOU352NFiCmtfcKQtf3YH4HEEhqeXC?=
 =?us-ascii?Q?WMVDnwxOhatujzZ3qYMXWB/goRZf5qXfcTbzvucH/6kFOxU176Xaaw3xQnne?=
 =?us-ascii?Q?Z4tz3HL4Su7FiTIwM0HrG5ygVmSA1WGcNcuuunWdszV/Tdg29qUaFqU2Xkyx?=
 =?us-ascii?Q?sffLbd/AWmhqFayVm7HazcTHVzavew4EotuVOQ3bcIuE3bvQQEpCDyojJCbr?=
 =?us-ascii?Q?2t9xNvnbidX6ioy0FV4+irxJzp9ChUMaYTtGqpcW3Cc+03w/VlVERL4IG3ZH?=
 =?us-ascii?Q?6e6Yk1bTfc/StZqPKEIseufdPLGthUXBQHezxuwoHiRiCV6redTsBvXHBZuP?=
 =?us-ascii?Q?Zmu9sDgOqy7sdkqsleeTHI3PBulQx2Ai81jhKCrpF6hQAvDnIazBYST2mGEU?=
 =?us-ascii?Q?OTfovpyY6m1Ok94O1TZweFfRtRGNcpA+S2Aixu8TGvnHS/RwMtq6px0FTlPP?=
 =?us-ascii?Q?77eYdFyh6b0kYWsy5m2W4xKOvt7qKwTzU0ayJwvCrWd4RkgGaeYCWcZCnsHm?=
 =?us-ascii?Q?IMYlUDnsZMEFfRDZr/ejfOoEI9hqXOaneY9nvR8lF7tunR/lIrBGiUXt87Uy?=
 =?us-ascii?Q?b9oqbjjJJm7Kju0NjGvWFz9GwzRAhpoyW7j5SLTHKiEWRtzaO+Ci5xFkNMeb?=
 =?us-ascii?Q?/+dfHkti6fPT1twI/W6QeZEAsyvz3nGUtlpgfVcbB8VqiBjruxiX5ipNv9WK?=
 =?us-ascii?Q?XSpEBif+GX3ZsWrpT9YKsRHApGzVjC0GGEOhYY+tT5Vdka7gcqjFDBQr54Ad?=
 =?us-ascii?Q?zQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2eefb44-7fd4-4f9c-67db-08dd41d27682
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2025 08:37:14.3411 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z+b9qusSWTSEKHNtrE1cCGnL26NLVgezKhOGv1q5BbuCulLixgPbUK5b5r3nt2jZawUFdQfVoXJa3wKT67PjkAqj+bwaV5/8xeGI1xMcKo8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6774
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

Hi
> -----Original Message-----
> From: Tauro, Riana <riana.tauro@intel.com>
> Sent: Friday, January 31, 2025 1:35 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>; K V P=
,
> Satyanarayana <satyanarayana.k.v.p@intel.com>
> Subject: [PATCH] drm/xe: Skip survivability mode for VF
>=20
> Follow the probe flow in case of VF and do not enter survivability mode
> in case of pcode init failure.
>=20
> Fixes: 5e940312a2ac ("drm/xe: Add functions and sysfs for boot
> survivability")
> Suggested-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_survivability_mode.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c
> b/drivers/gpu/drm/xe/xe_survivability_mode.c
> index c619560af74f..02b4eadf8407 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -177,7 +177,7 @@ bool xe_survivability_mode_required(struct
> xe_device *xe)
>  	struct xe_mmio *mmio =3D xe_root_tile_mmio(xe);
>  	u32 data;
>=20
> -	if (!IS_DGFX(xe) || xe->info.platform < XE_BATTLEMAGE)
> +	if (!IS_DGFX(xe) || xe->info.platform < XE_BATTLEMAGE ||
> IS_SRIOV_VF(xe))
>  		return false;
>=20
LGTM.
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>  	data =3D xe_mmio_read32(mmio, PCODE_SCRATCH(0));
> --
> 2.47.1


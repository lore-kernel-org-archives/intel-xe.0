Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2660ECCA470
	for <intel-xe@archiver.kernel.org>; Thu,  9 Oct 2025 05:29:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B90410E1F0;
	Thu,  9 Oct 2025 05:29:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QaJJ9S1c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0431310E1F0
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Oct 2025 05:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759987751; x=1791523751;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pk6NgzWaYEMd4yv6DCSfBU9A1U8bU4VbmBK/R/9EyxI=;
 b=QaJJ9S1cJSRXG36PleGYszqgmWTq6RRNq/vmvr0f7viY+o/i8b60aiUP
 u00Ed7FClRbjtVyEtlJIjYgAwbiOT+Z3tPapqOvaQ79GlHTAozwcJRiRW
 nvPQD+6DEt3ul72zAQ/XGAVIVK0I0NCiQcV3o1aekGeX431JQRGk8VWhl
 VYi21HCZWHXOZ6J4l3DkxEtcdoIfzjVFJs1sNBjMJwHBm6NJO2n1y5vNf
 VAxFax4fxErZ2pS8ye6zPD2BLahXP0Oo3wf8q1ZjZg1s5A6JE0uuWYTAG
 vuzCC4uqPZYrisnrMM+edwEzxLeYCmXDvUYOdX8HtiVKmRJaPw2rfWT47 Q==;
X-CSE-ConnectionGUID: wvQQ5/2ETrGiYeB0GrjbyA==
X-CSE-MsgGUID: G0VrRuQDR0mO73skl3LZuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="62095748"
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; d="scan'208";a="62095748"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 22:29:10 -0700
X-CSE-ConnectionGUID: o1bhsGaeTb6bxY/IbtDZIA==
X-CSE-MsgGUID: rfRC4pa3TLOAyRXKmmr9YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; d="scan'208";a="179875633"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 22:29:10 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 22:29:09 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 8 Oct 2025 22:29:09 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.47) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 22:29:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UsJtqJhYTlsd9jeBcGItvF/zhmGKn4HPrYHFeHuCz2j3TWH9e/FrX+5ermSX3zaSwcrJf17U9KPRuDJVfa7bPIceYfJa0KLU8Ij+88J9a3lwAKuu+IL79/aDG7ogM7wtl0w5qPV1pU4uuQ3p/XYUjjpU9OIZx4jSm55L5HSSugo7UqwWJQSlzbDb/SptHiiISt2g43vvCoe7u9CU0gmJdsUW0U6PMY84DTWWVdnK3xZX8C+1x/avN1RJZr2BEAG6pkEC4PGlYHdV4JKHQhZvv4rfh2SIyh/TjcSfu7r5Ru9TaG0kDs+NNMOPaKZotcCeOIeInujUvc/2F0t/E9sQdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ky89NODBPBNZAYKG+Q+WfnCC7wgCRvDwzsRrFJBEGso=;
 b=WAstQk68j+bavGDrtrJPWkZO89u2JWqc8fhONLzX2bGwO6jmqJiFLeJ2UStwGVUXhCIoNoCvmIBVvyQbBN8dZfj0GUNHjIlFQqHzQdk/l/QXJ73Ch474mQ6nb4MQDMGXcPo/PyOiJahVqhk3/oanc2e45+gxyVSybDpYqCS0N3GAQO5vUKSKRIlZlUg5I/P4l569BeyrR0Wo472MqGJ+N5xAUkaLjRKwhVd6OTy8VwbZ5aRbk5/QDmwTrdlbDgLCSFvxr3BwRc94UaijfI0sxoDAPzhpUThBNUdREbKFE9/vMIRhdDhbEBOeBkYyQmWcb/gvcVjAdQWxfUoEJilIwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by SJ2PR11MB7517.namprd11.prod.outlook.com (2603:10b6:a03:4cb::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Thu, 9 Oct
 2025 05:29:07 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%4]) with mapi id 15.20.9203.007; Thu, 9 Oct 2025
 05:29:07 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Lis, Tomasz"
 <tomasz.lis@intel.com>, "Summers, Stuart" <stuart.summers@intel.com>
Subject: RE: [PATCH] tests/intel/xe_exec_compute_mode: Remove non-block section
Thread-Topic: [PATCH] tests/intel/xe_exec_compute_mode: Remove non-block
 section
Thread-Index: AQHcDZIUOsvG1ggVzUyz8/qLFFc3p7S5n7kQ
Date: Thu, 9 Oct 2025 05:29:07 +0000
Message-ID: <CH3PR11MB8434B9D6E594F20EF6491D918DEEA@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20250815030936.2387322-1-matthew.brost@intel.com>
In-Reply-To: <20250815030936.2387322-1-matthew.brost@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|SJ2PR11MB7517:EE_
x-ms-office365-filtering-correlation-id: 2b98e434-18ed-4c2d-c3d7-08de06f4c4aa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?a6DyWM+0d9LGEsvgL6FXpJbb1ouSLKj1APXc+RSwH4Oj68S3O2SSUo3Zw2TB?=
 =?us-ascii?Q?N3VWNW4efwcVj7lZQxRGavTVX1vKq8MjUWGb43i4qeTmACO6+h8nxMvr6BqO?=
 =?us-ascii?Q?/gucRyXTq0xG8xaFbuJ4NTKKvkGItT+s2eZLrpztQ7N0G4smRWcTvG/vkpMn?=
 =?us-ascii?Q?RJi+1wG5uW2Dk2ADxb7J4KRUre7thanY+K3sCBaeq5xjX+ZCfObSjr9quX8g?=
 =?us-ascii?Q?+nMF4qmEQ8mFykyTKx4nXzFVSDkyRzYm/DvK9W1lAuHgB/HowH8RcCjGXYf/?=
 =?us-ascii?Q?iAuHPh53v419E5RAEQsCukMHv3K+Xdjs55Sn7uA2oi8FVN2ZMsu/LZSNtxqi?=
 =?us-ascii?Q?UyWphCjiKEyHKAL9gvCKEf3IUqzuhr89WP3OurdZtqr0q6wrmz/v65jh8ZFs?=
 =?us-ascii?Q?1mu2JLNGh/qUD3fVq/GunGt4OnWw4/rE+cq1BhxXpIl9dehFo84mDo9Wrb16?=
 =?us-ascii?Q?jqWsFFYk2986JLhvKgqRGLbii4jbKW9qrT2L/oHWElshmt1vo6mgMtCfhljJ?=
 =?us-ascii?Q?HB8/BQHKbgc5XfFIJ60TE1iQrZL+zFG2LNza4QnGCS1/hpWIkAPUjsiF6TXr?=
 =?us-ascii?Q?DJrGjqtwvItJ6RcC4bhSIP+XIzd4iKUHQEK/XGtbVAsbjmjf/wOnvbHZ8a9G?=
 =?us-ascii?Q?/nDuCi1U0kmxtI+yQMBrBkc7pSKzFBvL42Rok2pyWuiuWkD2Rc/evK6v0O6x?=
 =?us-ascii?Q?hrl4nr177xoVdISSWrHBiE7Si48Vv/H32y44eH7lHSSrR6N5UxJLuClPycZG?=
 =?us-ascii?Q?8rJtteNrevTP45dBfdWvKT/GAFrQe4XaKD5yU1Z3bfQOiOYtpZKClCdMBInq?=
 =?us-ascii?Q?RACdz+ga6FnOwpDEHOeUDDXi2+LGPcJOnLpEDIMRYeZehpWx3hP15ccQd9RL?=
 =?us-ascii?Q?gtBBG3uQz1YHNZloUKYIJEmhqwDHAguBck7YlDTas+F/VAHMHsZNGssszFCW?=
 =?us-ascii?Q?FaCn35gORaV1Va+YAtoAt7BahHgxcpyc8EN/h2bZO9hFDSBbXxJPRnhSG1R9?=
 =?us-ascii?Q?ORWzvgbw+CQYfjV2JY5Ut/cNzDvsp1Tka9oy04+Cx5LIeSRA7ziH8cDeXz35?=
 =?us-ascii?Q?YoXmXA39g4M0svjtbeEh9Rw5EuPZvwDBwUK3BPm8BU6GV/Gwg3NBEHy2L17R?=
 =?us-ascii?Q?ClIzXYuhxVDWLf/wrvHBY/TcdHfAr2aG83S6bC12kpnU1y1E+uCaYG/9Pq7s?=
 =?us-ascii?Q?m2r+/uiH/RNV7QZ+SHEkNaQbUGvtpS+/ERT0MlEUvXMMpQy6xpvEde0RR4yC?=
 =?us-ascii?Q?Lz3jsciRVJjPwjUtNPgTASkiu/yhnu5RTRgegsOw6k7m9vR0o2zsEB6BsF1a?=
 =?us-ascii?Q?/RyzsF1RvZO8bkkyxoqH2OdC0AiCLrweSbbdtE3kYT7epYPhNX4l9SVPJ1ez?=
 =?us-ascii?Q?JUZHRrFqs2T6guGiw5jt6iY0GJDy2WmF/99Az23UmLjALcU0Dv5a4oVsXfDQ?=
 =?us-ascii?Q?9K7XqaR9YVJBMhMx1/2D2OeMHIdJwve5zeiKFRgsR6YHQLCoRXf5QSnO6osa?=
 =?us-ascii?Q?a53VvLc3VHkuF59MeEaYBkAq+lGDwqSyFI58?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BZmIfsHjIwYwfnt1yGgSIe3tMFrtE0z7JaisFwkZPykxJHYTavAS0T7rJkR6?=
 =?us-ascii?Q?eFO9QfIMpBTIF42yyoZr3yS0sWH33UPmtaGV0+FLd9NUGptb126NrlwhG1bA?=
 =?us-ascii?Q?DM9Cv/YNVPvcDnGu7zAa/wUI9Yjdl/CsV7fTUuYcd1a6aeCyY75Ul5/W32AB?=
 =?us-ascii?Q?xRpBzink1yoY3+mmNfMVja5AeCend8ykIJuyP7kqCEnFdYQlPZyD0cvWemR+?=
 =?us-ascii?Q?F0BQm3jCkENxtHIe+nY+uaGwnKdYuIcFHUoWEGjS/wTcu2sIbQ7LMuSXoDVI?=
 =?us-ascii?Q?3d3EqK8sti6mEhMpztqOWAJiftmeqVz3qUQ1XibBYFoQ0z7daZxoUz8QTFN1?=
 =?us-ascii?Q?wHr7E30KxtEzru81zpM2awWA44eEIU5shaI6N03oQuiEZ3pc7VjLXyPqGnSm?=
 =?us-ascii?Q?zrS6oHbPsYmETQCVbZmhd+zYi2Wtx6wzcgev2UkQ5XVO70JL0B0Eb/NDBVVo?=
 =?us-ascii?Q?bLPOAvxLqAaZadnVFGScY/Ww88WCjWY0pChQ6zxwIteONgVx+z8LD7LHdDT5?=
 =?us-ascii?Q?OU1YPZgpDfmWEDmvKH0YShRoLWCBC4AUgBjKJaLqgCOg8oAADnhRVNDfGiE2?=
 =?us-ascii?Q?QSsbYzwtRAnj6vyjjmuuWFeria0RNIDN4TEyz+Q6uyaMrhqa0kwjjT4+gK0c?=
 =?us-ascii?Q?vnGgtVzXvlRKmmvrnpuPHIxS/Ce196xaTcWeVx1FQzKjGi2vyBrM/7S659G1?=
 =?us-ascii?Q?ylP7KWDmCfuBnE5fVW2f26gzwgUXLeXOB0iFdL5Pu63waBVBH08nhGDGvR2F?=
 =?us-ascii?Q?J8UFcLdu6rsJLgeqjOAy6tE0t8J3kciGsfKAKpkBNp+yL9G1MfJtSXIpZnXt?=
 =?us-ascii?Q?5UOP3nGn6M3vtqkaRC5b3xG/5U5ZtPGAYyod6A5J+W0BmrknlkMrCETH1suL?=
 =?us-ascii?Q?JxIETRCtExjM1d+ghzo/38ath9AN5MZDGFb3Rpn8oLCsuK67AmUYxfPGGvg0?=
 =?us-ascii?Q?YEHSEs2cYVyNu3O2q2LmuPpiuhE2G0LFRwb+V5QPbp+ovQHv3NqdK5aef5o4?=
 =?us-ascii?Q?K5+abqAtuwounU8rDfadOYQL/V4iiCxCFIlhnF9zjXe2wRA02bJ9tgtzIstF?=
 =?us-ascii?Q?2unCUdESSzKbVl5bSbDFGFI3HtAjTznBK/DaAZ1QyTm8f4LgTgnY2tcGJ5iP?=
 =?us-ascii?Q?9SbhBO3UkwhsrQK5Zr7cNdaah1klFWy27KyG5A3RtqnPrOrlbFt4Tw0QhDl1?=
 =?us-ascii?Q?3IbJmAt7ky3EqfJZUz+5G8HouRPAS2jam7okJqnapaBdZafxE2qsPwlqZ2kZ?=
 =?us-ascii?Q?L2hTCOKvvOiHwD35DBFDQQCC6i/ksObjSsP8l3jZ9lfve2DLMDtX843xMRYw?=
 =?us-ascii?Q?mBgzyzKHIUi0b8wEYnWfprGae2qQGF0b47oN0BslQJfFLjlGGcYkbV4WnzAt?=
 =?us-ascii?Q?HhNPWjcnVzGn/QQvheOtXfcF0HnaBn6LVwopMbLuVVoFH3KPZP7e1o8gPMuR?=
 =?us-ascii?Q?dzVLLZQWjbkKUljbJEzuZMmuV6RqR4aa4LQYva+Iwo5PThcX1Wi0PW/Oe3Gq?=
 =?us-ascii?Q?EZwVFGy/g9Ncg2CZcz8R2xmBue9VUoF/phIzF2ARXTSSZ4CIq8n2ZNdqZL3G?=
 =?us-ascii?Q?w13ZcNPAOzGP90jFAQXSzxGoR3XelmTGMPre5tYt2TY8M/DcJSMasfJR/rMN?=
 =?us-ascii?Q?TQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b98e434-18ed-4c2d-c3d7-08de06f4c4aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2025 05:29:07.4158 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZoUz6RK1G6Ff7lgbnEnZMNW3TWYvLSISljUSPOGvY8IH7S1e31xv8SZny4DPZ0ZRRl+qXDv7EE84BO5mRdqL5FXWld2J9WddsSeALnVX+6w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7517
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
> Matthew Brost
> Sent: 15 August 2025 08:40 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Lis, Tomasz
> <tomasz.lis@intel.com>; Summers, Stuart <stuart.summers@intel.com>
> Subject: [PATCH] tests/intel/xe_exec_compute_mode: Remove non-block
> section
>=20
> The non-block will become invalid and hang until the test exhausts all me=
mory
> when LR jobs are tracked in the DRM scheduler.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  tests/intel/xe_exec_compute_mode.c | 113 -----------------------------
>  1 file changed, 113 deletions(-)
>=20
> diff --git a/tests/intel/xe_exec_compute_mode.c
> b/tests/intel/xe_exec_compute_mode.c
> index b904dc76b4..316f7322c1 100644
> --- a/tests/intel/xe_exec_compute_mode.c
> +++ b/tests/intel/xe_exec_compute_mode.c
> @@ -320,116 +320,6 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  		close(map_fd);
>  }
>=20
> -/**
> - * SUBTEST: non-blocking
> - * Description: Fill the ring and check we get expected errors.
> - * Test category: functionality test
> - */
> -#define VM_DATA		0
> -#define SPIN_DATA	1
> -#define EXEC_DATA	2
> -#define DATA_COUNT	3
> -static void non_block(int fd, int expect) -{
> -	uint64_t addr =3D 0x1a0000;
> -	struct drm_xe_sync sync[1] =3D {
> -		{ .type =3D DRM_XE_SYNC_TYPE_USER_FENCE,
> -		  .flags =3D DRM_XE_SYNC_FLAG_SIGNAL,
> -		  .timeline_value =3D USER_FENCE_VALUE},
> -	};
> -	struct drm_xe_exec exec =3D {
> -		.num_batch_buffer =3D 1,
> -		.num_syncs =3D 1,
> -		.syncs =3D to_user_pointer(&sync),
> -	};
> -	struct {
> -		struct xe_spin spin;
> -		uint32_t batch[16];
> -		uint64_t vm_sync;
> -		uint32_t data;
> -		uint64_t exec_sync;
> -	} *data =3D NULL;
> -	struct xe_spin_opts spin_opts =3D { .preempt =3D false };
> -	struct drm_xe_engine *engine;
> -	uint64_t batch_offset =3D (char *)&data[EXEC_DATA].batch - (char
> *)data;
> -	uint64_t batch_addr =3D addr + batch_offset;
> -	uint64_t sdi_offset =3D (char *)&data[EXEC_DATA].data - (char *)data;
> -	uint64_t sdi_addr =3D addr + sdi_offset;
> -	size_t bo_size;
> -	uint32_t vm;
> -	uint32_t exec_queue;
> -	int value =3D 0x123456;
> -	uint32_t bo =3D 0;
> -	int b, err;
> -
> -	vm =3D xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
> -	bo_size =3D sizeof(*data) * DATA_COUNT;
> -	bo_size =3D xe_bb_size(fd, bo_size);
> -
> -	engine =3D xe_engine(fd, 1);
> -	bo =3D xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, engine-
> >instance.gt_id),
> -
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> -
> -	data =3D xe_bo_map(fd, bo, bo_size);
> -	memset(data, 0, bo_size);
> -	exec_queue =3D xe_exec_queue_create(fd, vm, &engine->instance, 0);
> -
> -	sync[0].addr =3D to_user_pointer(&data[VM_DATA].vm_sync);
> -	xe_vm_bind_async(fd, vm, engine->instance.gt_id, bo, 0,
> -			       addr, bo_size, sync, 1);
> -	xe_wait_ufence(fd, &data[VM_DATA].vm_sync, USER_FENCE_VALUE,
> 0, NSEC_PER_SEC);
> -	data[VM_DATA].vm_sync =3D 0;
> -
> -	spin_opts.addr =3D addr + (char *)&data[SPIN_DATA].spin - (char *)data;
> -	xe_spin_init(&data[SPIN_DATA].spin, &spin_opts);
> -	sync[0].addr =3D addr + (char *)&data[SPIN_DATA].exec_sync - (char
> *)data;
> -	exec.exec_queue_id =3D exec_queue;
> -	exec.address =3D spin_opts.addr;
> -	xe_exec(fd, &exec);
> -	xe_spin_wait_started(&data[SPIN_DATA].spin);
> -
> -	b =3D 0;
> -	data[EXEC_DATA].batch[b++] =3D MI_STORE_DWORD_IMM_GEN4;
> -	data[EXEC_DATA].batch[b++] =3D sdi_addr;
> -	data[EXEC_DATA].batch[b++] =3D sdi_addr >> 32;
> -	data[EXEC_DATA].batch[b++] =3D value;
> -	data[EXEC_DATA].batch[b++] =3D MI_BATCH_BUFFER_END;
> -	igt_assert(b <=3D ARRAY_SIZE(data[EXEC_DATA].batch));
> -
> -	sync[0].addr =3D addr + (char *)&data[EXEC_DATA].exec_sync - (char
> *)data;
> -	exec.num_syncs =3D 0;
> -	exec.exec_queue_id =3D exec_queue;
> -	exec.address =3D batch_addr;
> -
> -	while (1) {
> -
> -		err =3D ioctl(fd, DRM_IOCTL_XE_EXEC, &exec);
> -
> -		if (err =3D=3D -1 && errno =3D=3D EWOULDBLOCK)
> -			break;
> -
> -		igt_assert_eq(err, 0);
> -	}
> -	igt_assert_eq(errno, expect);
> -
> -	xe_spin_end(&data[SPIN_DATA].spin);
> -	xe_wait_ufence(fd, &data[SPIN_DATA].exec_sync,
> USER_FENCE_VALUE, 0, NSEC_PER_SEC);
> -	usleep(50000);
> -
> -	exec.num_syncs =3D 1;
> -	xe_exec(fd, &exec);
> -	xe_wait_ufence(fd, &data[EXEC_DATA].exec_sync,
> USER_FENCE_VALUE, 0, NSEC_PER_SEC);
> -
> -	sync[0].addr =3D to_user_pointer(&data[VM_DATA].vm_sync);
> -	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
> -	xe_wait_ufence(fd, &data[VM_DATA].vm_sync, USER_FENCE_VALUE,
> 0, NSEC_PER_SEC);
> -	munmap(data, bo_size);
> -	gem_close(fd, bo);
> -
> -	xe_exec_queue_destroy(fd, exec_queue);
> -	xe_vm_destroy(fd, vm);
> -}
> -
>  #define LR_SPINNER_TIME 30
>  /**
>   * SUBTEST: lr-mode-workload
> @@ -570,9 +460,6 @@ igt_main
>  					  s->flags);
>  	}
>=20
> -	igt_subtest("non-blocking")
> -		non_block(fd, EWOULDBLOCK);
> -
>  	igt_subtest("lr-mode-workload")
>  		lr_mode_workload(fd);
>=20
I see this test will be not required due to changes in DRM scheduler.
LGTM,
Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> --
> 2.34.1


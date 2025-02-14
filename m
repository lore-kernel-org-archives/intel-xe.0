Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC472C02198
	for <intel-xe@archiver.kernel.org>; Fri, 14 Feb 2025 10:04:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DDBC10E273;
	Fri, 14 Feb 2025 10:04:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eea9q0J4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6559F10E273
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Feb 2025 10:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739527497; x=1771063497;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AEDCyyBuBKPhq0jv0mGWJ8wzdERMuTTk8gThemoemW0=;
 b=eea9q0J4EHAFXlJgT3u9gNQh7AvkU1hVfgG4XcJjTSosAm2QFx9CrHFb
 2kG2OjlHqDEFOa1afOUchfsx8u6ycEQYqUEFecIwULAadfewTdSzBOy31
 35yKq/bG1FuSrQBTcBJkSmnG6w9/MLvHqz0BcsKf8PKppS/Guw8S46aJa
 gss6sOONlIzY+amqGiayJc+Er6bXlIq55NSoc1SyTv0n/DOWEGou4P4sh
 2ppbLw//SPFulwUEkspPmxtPLNhN1jBjRxYqeOCLS6yhEC/upecEiBH/t
 lP/pwNB5CelsjVu6+CZ1izopaT6Y+EBTwCto0NagQj1IXso5oMBFzQ3Vw w==;
X-CSE-ConnectionGUID: wXhQY7a3QMqFh+hSKfmTUA==
X-CSE-MsgGUID: 3KgH5DyRSaCicLqd5a3Zmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="57678152"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; d="scan'208";a="57678152"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 02:04:57 -0800
X-CSE-ConnectionGUID: jatEpM7hThmFWaA+zV/9hg==
X-CSE-MsgGUID: EhdnmREcSkO4J5KFZIdrQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; d="scan'208";a="114058507"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 02:04:55 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 14 Feb 2025 02:04:54 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 14 Feb 2025 02:04:54 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Feb 2025 02:04:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DnguYkrGsCm9qGXanb9CVDAeHOpMqI6J+gGAZfG5FmSNAAzF6Tm78W34f8MyhNmhPojMdloT4DzaQaWucLGPdMdgmv5wCOmrliCd7ry0+e8lPD3t/IzY01t1pBR0HK9nqyfm7LjxW/5IHLEm6iLGjU3DSNIj5BNC2efyAZwXE9w0SKaqwIfMGoe8lZFyHDce+g9l3qmITpfimWTJand1bC1qU/wq6RE3rngqNVQJ7tg+9tNaPiiwNpOgwTk5L+o82L/TfXnj12QTEE7yjr1kWDSgH9JW8JeiJedyTlMruNrHElvgknZV3elhkegJF7YG1FEYkZGUlk6DDOC8leM7UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v/s+cEED4sJ16Q9LeDjSjK5MF5ayjU5VBc7XOnuOEPM=;
 b=g3X7a+qxboC6RVuc1k+XUjrGAzMZd6vttpf+J4NBdPf9AtyLlofk7mUWVogI+M9phdmDmdfMdj7nf8xM+ZFL1eFWFcAzJdYzuVFqDHb4Vf1fD7A6CEHbc4VgCBJArYuXF6DBEb0HcfNM7tOH3McLzhCQZmSATqU3REPWbTz+Vukc585sg2vVCI2uyqZKtqNqZaZb50qxAPJmTJ8hSPk5VPdjOdqBicJNn/vlvHN0YsgW96t5Zj/VPnWofkNvHY2DDKNftq4544Dv4uKvlj8Cch2lREhhnWdEOualT85qv5ISh5o8NjNMFXoZ0/4Z/P1VGQFzht5vu6yGAE3Kr9GvbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by PH7PR11MB6651.namprd11.prod.outlook.com (2603:10b6:510:1a9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Fri, 14 Feb
 2025 10:04:37 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%6]) with mapi id 15.20.8445.015; Fri, 14 Feb 2025
 10:04:36 +0000
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH] drm/xe: Fix typo in xe_job_ptrs
Thread-Topic: [PATCH] drm/xe: Fix typo in xe_job_ptrs
Thread-Index: AQHbfdzaGxgRJeDzOE20ZKOcriHLNrNGk9HQ
Date: Fri, 14 Feb 2025 10:04:36 +0000
Message-ID: <LV3PR11MB8695447D47F7A2C01601B0E9F9FE2@LV3PR11MB8695.namprd11.prod.outlook.com>
References: <20250213060838.32493-1-tejas.upadhyay@intel.com>
In-Reply-To: <20250213060838.32493-1-tejas.upadhyay@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8695:EE_|PH7PR11MB6651:EE_
x-ms-office365-filtering-correlation-id: 5f246809-4f2f-4588-cdae-08dd4cdefcc2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?QufPO0V5kAub8BHHLtmeGBgP5EazpEtVRnjLGUjx4WEKcw5rsO51TumNA+nm?=
 =?us-ascii?Q?F/1dkRqarfq9L7gxQvVmPDUuO1E//SpDKLYRNQl7n4u7g7910SocxOQ2qGfS?=
 =?us-ascii?Q?huxmULX6ukmj8OFbTQpLGfrK6pacw3L2lJutcw3/X5Fzj4fpyWVnG+xKk7SA?=
 =?us-ascii?Q?kLQ4QMjDTkXfas5mnBiPtKUtux0sjQIwxq6YMlPKGH8kTsO8JCxaXZKL5bpe?=
 =?us-ascii?Q?/+Pc1g/KaGIrlPGEFiMZMRkBFaD6M7wjxx0II8NSDSou6kjIqMpNSAwhwTcX?=
 =?us-ascii?Q?TAk+W27x4/Sv1YN6PT2bn0WpbZp0rY3jOXgPsJ9rinvwIjSFdimE58iyr0I2?=
 =?us-ascii?Q?9SprpRc9AmiJ1u+zvFARoqB5pongQOjrCpS2wE6aeV4BhWa9p+qEMXQNTsoc?=
 =?us-ascii?Q?1fwq03zNGq3nf1RUGhvheGcjXLYZI4oAiM73BGHNIxA3h5IuEjKm2k+VEsXy?=
 =?us-ascii?Q?kcRQRwgwCeL1M2kATnAEIcjJs4Ycn6Xv7ivPlu+JU4E/TJqnM0WkkzLN/8yr?=
 =?us-ascii?Q?mVhbRCxhi8awUC6gO7PKeLS27BAto+AmaTNQzHMP+JS00RijeDa/L1hzBFW9?=
 =?us-ascii?Q?4XA0UxLpl6TkFWxQKTn0U6asQtyHZg/FVbeJwsajgg9/VF+YsBg8I2PDMV2h?=
 =?us-ascii?Q?JpU04WmC1A4BUthhCiEnBKE4QeabYastQIE6GWcL4Q0mghqWSvuTRURMB7ge?=
 =?us-ascii?Q?jHRlyrL5qxQlSj56a5lPy+7Lc1fFXSGPVG/iegHupQVTXpi0bLhPx3rmGXYK?=
 =?us-ascii?Q?BPScTlu/uwl1J4Y9EoiqdwD6khkBy8f8G46EeqFtVoCLjzJpODFNvyNnC1Ic?=
 =?us-ascii?Q?hVD9KDUcr4Q2dNP6r/SWK+b9ElMEST9bRNkUj74Otgs1jrl1DuSTf2lVXAP1?=
 =?us-ascii?Q?e4iFYIQBDCA1R8bat19l6rLCHlRr0ywNw5Pf7LZHuky1LUtxUTKinENVldk8?=
 =?us-ascii?Q?A5E/gpNxrU2Lp/FfJXRI9vbhMnZvuTvejlvmz+Wb+i1+e9P8domSz8OGNSBv?=
 =?us-ascii?Q?jfRaNbdD/mCcPlR2nMAjXyDA1F3w7FVgRB0gKpR/+02VsNTKoce3kqt8Du9/?=
 =?us-ascii?Q?eKLkBHM4x378uIyPykBZzFSCFiEQN4y9uky9Lof4Ky748p6C4Bzo/mHu6Cqn?=
 =?us-ascii?Q?EzX0aC3t1w57iiMwMEyXyo/GoH9FQnjbIXhfXttAjKtq75NnXb3XvuRQrQLH?=
 =?us-ascii?Q?JEXpkYfavWiVr1VkqBSZY36EhqnSXvP4+274+P+PLv6ERf77EqbarTGLlM1S?=
 =?us-ascii?Q?fb8qSTUBVyXEXrs9pUuQEfdbcadhJb8VUvCmmu3zyhX/UmBeEO5iM5KumQTv?=
 =?us-ascii?Q?lbV2y8PZSQNHEtc4xAESSecBh0veVZfg41mVu6/TIjOP0qFtHJQpyHqE6fb+?=
 =?us-ascii?Q?t74X+K9NIRITP/UE9Cy53Xt+D/BGO7j/O4luBFgKUPmpN0Egj2EcqO9tV7qy?=
 =?us-ascii?Q?jSfhxJx8j4B3moLukmjPA360SJQ075Ng?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Ff0k2ZuUqXiEdDdhjIMKiDu55BCxZIUOr7B++kyNIGaVkYZvSZjc6FJC/OjS?=
 =?us-ascii?Q?LjfkFU2KxPc8ca600m9gefXQP8kgHJ7fFv6Eeqyi02g7lQwrqzzBMJX/MBdO?=
 =?us-ascii?Q?NQiDxItAWucOooRBsKbsb0jmVdd50HfjY+G5k67Cf9L7PFT0T2HhMdLvy7iK?=
 =?us-ascii?Q?D7XPM+hYMXuPZ+JBiantFRkLaHk4Ky8CSik0QT2Xua27w0ODekEaC7Vz0Axt?=
 =?us-ascii?Q?XVgfxm3lGmqFd+JJv/ZNdpzL0z3wV8EEZiX0Rrl/qmY8uJzft7CjcnrSbDAL?=
 =?us-ascii?Q?wAakf/g2EvpjHuntiix1aN234BcoxW/2AfilqVImoofsrogW66clDAcvi5oj?=
 =?us-ascii?Q?d2PTQ5gUppUKhGLYMSEUWxyilVAnHSFyOIwANvOcPgNkRr7dyGkrs9Hlbpkr?=
 =?us-ascii?Q?mgbNLjQYJsTM9TP384BLEdsEbtbeKM8KQRXz2h/fU40F3Sjb/8xrIKpIaG46?=
 =?us-ascii?Q?xtiBiYK6dQEbAO+BBZ1UhHlmkwvxKfBlrC4A1lhjZvd6nlessXjPRuQ8AGoZ?=
 =?us-ascii?Q?oVJAFcw8UZSKheM4w4syevi3Z4aXILzNKn3JfHXnP54eqozJXDV/M8V7R/DV?=
 =?us-ascii?Q?sSeifeu7AwB1QpCRmc2YO5aJrII0CVAxCRYCCAukvkqU2cOsgham7pxVgbhk?=
 =?us-ascii?Q?OUJNd+XiubPuZzMmzrVgzRYc+2FCq1/LavrozH///Dsg21+TowrRRAl4Hhhg?=
 =?us-ascii?Q?flmeO9uJ1GmVqe+9HGehw/+wOWI4n1b6G+xTiy3QQHyX2TRQxHFSmA+CUJAG?=
 =?us-ascii?Q?2moY3gzVKAqKljeJ/xtRRX6oedgDp/ASpYcGm9SZqyOvTchWkvUp61kLxfPa?=
 =?us-ascii?Q?s/foEbWZ1mLiagYjVeTiQGvOSBudOTmbhuhgOWaHYp6z5KL20UV6Y6lqn//y?=
 =?us-ascii?Q?cX8qy9iqeyK5kIHbSiqbAWSYrs9DmLTqxXLv5ChA92/XK4IZohh5FWH2EoKO?=
 =?us-ascii?Q?2oArWDrD+j8IRuv8rD+pvI7bQgPeVydltZU7pgrnsZX7muex2EnSjrNplncQ?=
 =?us-ascii?Q?ohCNUEDYCsgKAgxDzQ7ikQJsYRoVb1n7kPjpf47/FY5sU7AdjpQ60Yqal0zJ?=
 =?us-ascii?Q?PPAzs23F53vnGA8vytpVnYSK0chapTGOJQmUficRJvAaE541jKCdh+H26m0n?=
 =?us-ascii?Q?0gSYtbnepOmrvILRLXg0VmqMFAoMV9mvajZ6rBM3mFMeUZpepMApacFbGbOB?=
 =?us-ascii?Q?1hKixfpV7gZwozBl13aw8cS3ErdfZfpVBhnQTK6JgwXVvKV3UrPzMx/xaKgK?=
 =?us-ascii?Q?eoX1ubYBJU+Za9Nr94Ydz8dlpLThUtkD0hk5JFN3cWJJ4CQICb/At7f1v8Rt?=
 =?us-ascii?Q?4jUSYRSXZdtdQKJWtGnrafF5xa9xEie5avg630OEWiGCZ6/GOg3VMGP/Y3Zm?=
 =?us-ascii?Q?gZEdiCcVj9wpYfG/cEnsekyxrRnKoQXVQDW1EZmaLyD09oTnidUdpUjmUseq?=
 =?us-ascii?Q?WAXdUhVqxo4Lrv9fsnoTcqEgYbTFzIV3vCxidm5pmAt0Z6kwiRmzlmpjdgre?=
 =?us-ascii?Q?F7ZHw/p75k+5+pANvuPd3TbNsjgP2oMcFukxzOMQSKgJlJEFWmpCqp3Ib7iT?=
 =?us-ascii?Q?tEKSzQ5wUjZEBAiW6CgNNQBOlWYtY1dqLU4gFsZ4MhfqTgc617uT+JR7GaX6?=
 =?us-ascii?Q?EA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f246809-4f2f-4588-cdae-08dd4cdefcc2
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2025 10:04:36.3225 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mGW1u0yoEsutx3jx0bsZpUOUOeiI1AvGKFQ+fbtu+av/Noel1AkFHcRmkzIVmVVLg8xAMpH0PcIr5O5H4k/cUuR6r5pwfm9KFAMC8qP27gE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6651
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

Hi.
> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Teja=
s
> Upadhyay
> Sent: Thursday, February 13, 2025 11:39 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Subject: [PATCH] drm/xe: Fix typo in xe_job_ptrs
>=20
> %s/uinitialized/uninitialized/gc
>=20
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
LGTM.
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>  drivers/gpu/drm/xe/xe_sched_job_types.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h
> b/drivers/gpu/drm/xe/xe_sched_job_types.h
> index d942b20a9f29..dbf260dded8d 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job_types.h
> +++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
> @@ -18,9 +18,9 @@ struct dma_fence_chain;
>   * struct xe_job_ptrs - Per hw engine instance data
>   */
>  struct xe_job_ptrs {
> -	/** @lrc_fence: Pre-allocated uinitialized lrc fence.*/
> +	/** @lrc_fence: Pre-allocated uninitialized lrc fence.*/
>  	struct dma_fence *lrc_fence;
> -	/** @chain_fence: Pre-allocated ninitialized fence chain node. */
> +	/** @chain_fence: Pre-allocated uninitialized fence chain node. */
>  	struct dma_fence_chain *chain_fence;
>  	/** @batch_addr: Batch buffer address. */
>  	u64 batch_addr;
> --
> 2.34.1


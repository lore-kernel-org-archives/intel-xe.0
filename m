Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 150D0F327AB
	for <intel-xe@archiver.kernel.org>; Tue, 21 Apr 2026 06:20:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A512410E7E2;
	Tue, 21 Apr 2026 06:20:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g7JctOnQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7DE310E7D8
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Apr 2026 06:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776752410; x=1808288410;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WytAW2t6mADvQJ45AVVJBhc00bh00kdL2hB+82WDbdg=;
 b=g7JctOnQPCwZkK2KgQwf8pw2rXs76dVtUL9yAgyTy+VeFHH8UvlkcPOA
 tdO188zURx6NnQ9CBDpvenX7tR8c0FiM+M67cuO3LrfM6U7EgkkK0DefC
 the7mmfrm5c67Hhm7q1QMWnk+9hQqEHzj2X9Nv3VWFS+C+oEWRohUsjoM
 fBBMyHluOR2tm7a5Axflo0kinZxVtA5/zMj+/s6K6Z1WHq+AnHT1dfgR4
 RTP7JO5YiP+C6dnO+9y57KYYvwR+6OWPes8IbFbTOBVFHPe8jybghsTkQ
 LapRofBPvjeiTsJKPjlMmBvxPXZrERB/gR1MIHSTOm1wFfsOXi+6m71XK A==;
X-CSE-ConnectionGUID: Jud6zRBdT22eRUzSdRc/EA==
X-CSE-MsgGUID: Qrx2gmTGQ2CcZN7azeKSMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="89148675"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208";a="89148675"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 23:20:10 -0700
X-CSE-ConnectionGUID: F99Wi7BaTFangQf7Ia/XWA==
X-CSE-MsgGUID: oB5IfKqKRz6qxkNLn1qewg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208";a="236930158"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 23:20:10 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 20 Apr 2026 23:20:08 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 20 Apr 2026 23:20:08 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.25) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 20 Apr 2026 23:20:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FYAiX2rcv2H8tmGajwMGe8bkTl6ZOs2bvZwNxt0o+pIZaQFNKMhR19IJuH87ucYz1hcSGA1yIHVGfwxDhSqKj4Wuc71U+LWOKbHVFkLruEBbUHGET6SuDsNKESpvKOLw6YSUxzYAvT8pZtO8I1YEDnYaMzccY5FPqIfAIyVm5nQ/XoNuA/6Yh3s1p8icvwVWt8z4fLRHb0HiI3wAAeV7PnjkBfNyssF/2csPRlOI4Yoe+r/gD3UenYrPBrCmIhN0gBBvY/SSMCo8/o0q+bf0Rw2+yrJC5NjQEu04fTUvOXbv1vWRS1+ugZhtGiL7Jwgl8GM3gsa909XCWb9qDqDEcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZpJ0dQIOJLwA59GK59W8KHVF1HOCFl1F79jDsjghfK4=;
 b=lzOQKX7YA5mXY+W+jdrzuveMC5QmY8JG8RfJUZxL8VvCFS5HrhKf7uMTm4+HW/vDWmogIvQyZdTRhPFojNvuAXYKNY2SJZrP73HEs9mxCEPPrA6+6l3JSeXVaC1TeBy7s+Sze+TVQU29NeDTFSgunbHswvLnn7aDJUSbLwUu4ctIxPIxlQhKWFHqMyWjoMmWarQTozMvl+e+nILI8z4qxIhcNq5K0DPl6GB3QOqyYOkd4p+7KJwDTw1HM9wLj4dZ9rdCb7KNq1fu1yBXrTsr8jOx93fIhBC1Kwla/b//tduLyWVBMNIAabv6DSFTd5LWiR8PnjHucY1PgP8Q+/PHSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN6PR11MB3232.namprd11.prod.outlook.com (2603:10b6:805:be::14)
 by MW3PR11MB4761.namprd11.prod.outlook.com (2603:10b6:303:53::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Tue, 21 Apr
 2026 06:19:59 +0000
Received: from SN6PR11MB3232.namprd11.prod.outlook.com
 ([fe80::bf74:5777:8849:5c00]) by SN6PR11MB3232.namprd11.prod.outlook.com
 ([fe80::bf74:5777:8849:5c00%6]) with mapi id 15.20.9846.014; Tue, 21 Apr 2026
 06:19:58 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "aravind.iddamsetty@linux.intel.com"
 <aravind.iddamsetty@linux.intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Jadav, Raag" <raag.jadav@intel.com>,
 "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>, "Koujalagi, 
 Mallesh" <mallesh.koujalagi@intel.com>, "Purkait, Soham"
 <soham.purkait@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH v4 11/13] drm/xe/xe_ras: Add support for page offline list
 and queue commands
Thread-Topic: [PATCH v4 11/13] drm/xe/xe_ras: Add support for page offline
 list and queue commands
Thread-Index: AQHczkPh79YWnBeS4EGOEQsY9ar4iLXpEM4w
Date: Tue, 21 Apr 2026 06:19:58 +0000
Message-ID: <SN6PR11MB3232A9B11E2C9B9E2E492DCF812C2@SN6PR11MB3232.namprd11.prod.outlook.com>
References: <20260417085812.4013309-15-riana.tauro@intel.com>
 <20260417085812.4013309-26-riana.tauro@intel.com>
In-Reply-To: <20260417085812.4013309-26-riana.tauro@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR11MB3232:EE_|MW3PR11MB4761:EE_
x-ms-office365-filtering-correlation-id: bb7b810f-193c-4bb6-11fa-08de9f6e039a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|18002099003|56012099003|38070700021;
x-microsoft-antispam-message-info: 78H79Zy62u/JZwK+bLzB4xlU0fJNWTi4WCJpenR5TIitlWyW0B0uKu9Rx/oX3+ZDt998QM3WbSxhe+yiw5uqiVFZLDBEtEMgxs4k0rQh2nAcZG8N359HGBkQhes83am59UZzFaSXcMSKDCo7hejdS8e6mRrUtEfubSIedaCfPd46djqzLHT91CsF3mkKwAUKmY6t6Tnx0q5uf/DeGf4SIWY1ASppzj4Bduw0xOx7VPZopQ2cLQ57ylvB5Lg6I72RrNdGEklsFmsAdhhYK2euSzTA8scAbeYGUWwPcC12hcBACA7R92Z/2gXMZE3nt8cMLDWvnGTp094cX5z9VBOmCvouoahBdSyijfGmJHj4UeJkrAeI+b5HkFu5vDlOjy9NQpfUt07cUSNNeIrIzgEz+WVrupNQju0Ql8/a7zhxEYPZcexabyEHL/kWnczrwqkVjaQJm5eTmj9EaOSes4PD4H9QC7AkJI/1DKFtviD4cTwKB6L2EuSo3x35LZbDznI2oyyJW6teWbIVcGxEQYTOJ1a7SX6AR5AtfI0QJc61UPgV3r+6uyy2qk4GPJDizklyMY8seQzE/r/XAD+Ct91wz9acLhC877GtHIGsKBnyST9g56lNuNHHXGoKlnX6371cmBrKFp4keyzipsKNGvjjPQzXny7YHBagmbn9soB3/tHYvnLvZk6cJNZUxWg+BEi9QygoKdXc3Ejpa6a2PCTRZxWSZ+sA5M0C9gqkO24aA6JbYUJ0qyr/wtUYRHicRhRFKYrGKU6VXzDFK9cA0goHVC8v1lRKyX+TOhsqPhFLHwA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB3232.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?R5RHMTyV6EPlv0wJtvWouLMB+sgzUvy///3w0Bk0yqlGltmlX3ZrpBdmJqPt?=
 =?us-ascii?Q?DuyJnxZl6UjA0MjSytw0go9Dcxfau2RmQfbMaNH6Z1Xm0KlvHHiI0rYzbpqF?=
 =?us-ascii?Q?E/nzxJ9NlMSTweTJ6+w/gWRMTg6kmREqdJviXb2xpR3xWkcEw2Y5GLvvVrld?=
 =?us-ascii?Q?XjkV8j5hAxNUqQKodpILRq+DPdSUaeYjikn8AvbRE8qDxW5WKCYkf2j0O1vc?=
 =?us-ascii?Q?oCAW70a9rWXYKRvtDwJcfi/NcdsNw7aKFs2CwmmxGbfXkEBrf3Q6hnZWbpGQ?=
 =?us-ascii?Q?Xikqa4UN9tx2xqIQMaccPA6UQqUt554ZBNa+I8/m96Zbt9N0dChFUeamQ5BP?=
 =?us-ascii?Q?7yQ3fTFFzxxIq+AksNwn7xjvN0SdT4Xj8CsYCl7dy3Qkp2htx3hQK3D//L2T?=
 =?us-ascii?Q?DTQUkzyaNEC5OsUOyCuCM1seQsyDmc0Aat1+qI1NtHAULHS0rG43XCkFzNQT?=
 =?us-ascii?Q?R/0ojRCjYKrOZpt34fJ3j6wYa7D0zezAixw2tvrSuiGldHKRF/K+MnpB/lzX?=
 =?us-ascii?Q?zXk9X/gN4wFJPkRsgq3vUxx1D39cGEHA0mFTSWv9Lk8aNT5lY6ye/vBGEqA4?=
 =?us-ascii?Q?OY3xNtQIXv8YxhrmEIPWMIAoUBcWWDDw26mYaBCnX8X74uIi4ibOe6a6gnFM?=
 =?us-ascii?Q?JL8J3toRuZ9+kukRKTZq7N/wjvvjIvWCDP3NbDdUTNSNnr0hggY4g5t9/9ed?=
 =?us-ascii?Q?NvQzAf6zjOVqWk4m6ufG9TaVWF/G2Ozq1kuq7t7E/tuFcQZi2b/9ozIo0mN2?=
 =?us-ascii?Q?EdvT7vWtL8mfY/YKpWSYsbXUA3B+lTPh5MbCNCVIf0AkPVfS3jcPwqOHqy52?=
 =?us-ascii?Q?jDTG+X2BRtz0WLDKcfKWRn/IhOMUTqxrhEfqJCJpODb33R7qejprsU0dqqUz?=
 =?us-ascii?Q?4oKRa+c3Q49xSj167QCcp/s07dkziTs7sPPwqJ/lW55LDRzJcDUEhkiaEQXL?=
 =?us-ascii?Q?0p4CAFj/AWDAqWCupWRPu3p4HISNFZ6MdZ93XPwX6Fz6hDguZ9VvDCB0GjYR?=
 =?us-ascii?Q?EL4toTRN4k3VuDbQ6fbwYY8JXeueSkQ5egW4/pUBvUmQvdUkN6k6dTYl28b3?=
 =?us-ascii?Q?a1WnDeYV2Gvmk/hHn9Bwa3BN1/pqVkcd47gLilgjpfivP58K3UVGWhTpntxM?=
 =?us-ascii?Q?zPTF2kK1EfaOR6T8rwr/o7AMVWovGlyyGcQz3RUa+3/pa0mLMpA2vEvDZ+oe?=
 =?us-ascii?Q?6diFdyYH9b4cBDLa7gg8/TnHOSwPlivhQZM2F6JU7tkrd0+ZZ2JRaMV3r+xF?=
 =?us-ascii?Q?VikKockdmcJ99FY8nBYjsSbwuGtb+aHxks8zz3M0ZL6AA0mYmpkDZF/fBC5q?=
 =?us-ascii?Q?AB8kWBTeCW80X8cxbmu/IMQrOoMXLh6wtWn61K0KTB5KCPaeKjBISP/JHBJh?=
 =?us-ascii?Q?ZKsE+NX7Ron3H9x8wynmh410vf2MCVf0ZyECCLUadLWvg2cehtyA3DTIPy5A?=
 =?us-ascii?Q?ci9GH9SSiRiwKjdudVOpd2nD3X4L7Ngr/EhlfsV4n6/BkwB9VR/kuCq+8sAg?=
 =?us-ascii?Q?kpF77pqjYkt5AjnzvFMguaMDn+h52ieGJk5VY4wwmBd3vwdAFz6/ENedswes?=
 =?us-ascii?Q?GESBRGdtZQeWiYGPlz0EqFXeU9KPy6WXE705uHgrtessqLzmTtUbJis1fsAC?=
 =?us-ascii?Q?8/8mnCbYknUN+/AkLS5d5AxEdffTZ0fsCUwXA4VfkI5y2OBp7uQyJ8vMJJQ3?=
 =?us-ascii?Q?GzOIdPva8PLMKrgA+io4ircuYiDjpO8fPUwVgS541PhUkRNF0uhDRzaOn3Jm?=
 =?us-ascii?Q?c3013OWFyA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ZITXYQebLZfSlLmtODu1tWAYE65cP8d+4xK0uGDrWslcQ1/ENnDjoIQmSwqgGeF2ZXBbZnGwkS2BEv2o1tNFiyqzYuPQVDCS9MiaE4BmFSsRvx4kTb3yGkAbnvm/3zVk6sWFgbypV9IN31LeaqDWI7VrnmXWfcrufjHhGjVr5J49+ihAy5MXtagPgmNHlUUlenKKHKIab2h5DLRkQf86h6diHY/lnfQYO5XldjH45zkeH2dSft1UrFzV1BquCg8uakJBvIJWKMd21HHCiQwZAmsPHtGTp2Ck5t7d6ufafZRSwwO/jtT+2HqTPf3CUyy7+oS6shxDcp3GtjLxHWz8BA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3232.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb7b810f-193c-4bb6-11fa-08de9f6e039a
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2026 06:19:58.8807 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ArAF0d8MQb8c6hrxTXxuAj/NtIESpqgBbL7MnOEAAVfyXuZtXYS57cUU5p/dMl5PLg6jaNJAaKNUjS79tIAI6PZ8n6gRZlMSWZGWE9w7mE4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4761
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
> From: Tauro, Riana <riana.tauro@intel.com>
> Sent: 17 April 2026 14:28
> To: intel-xe@lists.freedesktop.org
> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
> aravind.iddamsetty@linux.intel.com; Nilawar, Badal
> <badal.nilawar@intel.com>; Jadav, Raag <raag.jadav@intel.com>;
> Koppuravuri, Ravi Kishore <ravi.kishore.koppuravuri@intel.com>; Koujalagi=
,
> Mallesh <mallesh.koujalagi@intel.com>; Purkait, Soham
> <soham.purkait@intel.com>; Upadhyay, Tejas <tejas.upadhyay@intel.com>;
> Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> Subject: [PATCH v4 11/13] drm/xe/xe_ras: Add support for page offline lis=
t
> and queue commands
>=20
> Add handling for page offline list and queue sysctrl commands. The page
> offline list command retrieves pages that are already offlined by the fir=
mware.
> The page offline queue command retrieves the pages pending to be offlined=
 by
> the firmware.
>=20
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ras.c                   | 85 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_ras_types.h             | 39 +++++++++
>  drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  6 +-
>  3 files changed, 129 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c in=
dex
> cd1ac6441b92..42ec27c05e9a 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -319,6 +319,87 @@ int xe_ras_page_offline(struct xe_device *xe, enum
> xe_ras_page_action action, u6
>  	return 0;
>  }
>=20
> +static void get_queued_pages(struct xe_device *xe) {
> +	struct xe_sysctrl_mailbox_command command =3D {0};
> +	struct xe_ras_page_offline_queue response =3D {0};
> +	u32 count =3D 0;
> +	size_t rlen;
> +	int ret;
> +
> +	/* Supported only on platforms with system controller */
> +	if (!xe->info.has_sysctrl)
> +		return;
> +
> +	prepare_sysctrl_command(&command,
> XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE, NULL, 0,
> +				&response, sizeof(response));
> +
> +	do {
> +		memset(&response, 0, sizeof(response));
> +
> +		ret =3D xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> +		if (ret) {
> +			xe_err(xe, "[RAS]: sysctrl: error ret %d\n", ret);
> +			return;
> +		}
> +
> +		if (rlen !=3D sizeof(response)) {
> +			xe_err(xe, "[RAS]: sysctrl: response size mismatch.
> Expected %zu, got %zu\n",
> +			       sizeof(response), rlen);
> +			return;
> +		}
> +
> +		/* TODO: Process pages and offline them */
> +
> +		count +=3D response.pages_returned;
> +		if (count > response.total_pages) {
> +			xe_err(xe, "[RAS]: sysctrl: Pages returned exceed total
> pages %u, returned %u\n",
> +			       response.total_pages, count);
> +			return;
> +		}
> +	} while (response.additional_data);
> +}
> +
> +static void get_offlined_list(struct xe_device *xe) {
> +	struct xe_sysctrl_mailbox_command command =3D {0};
> +	struct xe_ras_page_offline_list response =3D {0};
> +	int ret, count =3D 0;
> +	size_t rlen;
> +
> +	/* Supported only on platforms with system controller */
> +	if (!xe->info.has_sysctrl)
> +		return;
> +
> +	prepare_sysctrl_command(&command,
> XE_SYSCTRL_CMD_GET_OFFLINE_LIST, NULL, 0,
> +				&response, sizeof(response));
> +
> +	do {
> +		memset(&response, 0, sizeof(response));
> +
> +		ret =3D xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> +		if (ret) {
> +			xe_err(xe, "[RAS]: sysctrl: error ret %d\n", ret);
> +			return;
> +		}
> +
> +		if (rlen !=3D sizeof(response)) {
> +			xe_err(xe, "[RAS]: sysctrl: response size mismatch.
> Expected %zu, got %zu\n",
> +			       sizeof(response), rlen);
> +			return;
> +		}
> +
> +		/* TODO: Process pages and offline them */
> +
> +		count +=3D response.pages_returned;
> +		if (count > response.total_pages) {
> +			xe_err(xe, "[RAS]: sysctrl: Pages returned exceed total
> pages %u, returned %u\n",
> +			       response.total_pages, count);
> +			return;
> +		}
> +	} while (response.additional_data);
> +}
> +
>  #ifdef CONFIG_PCIEAER
>  static void aer_unmask_and_downgrade_internal_error(struct xe_device *xe=
)
> { @@ -394,4 +475,8 @@ void xe_ras_init(struct xe_device *xe)  #ifdef
> CONFIG_PCIEAER
>  	aer_unmask_and_downgrade_internal_error(xe);
>  #endif
> +
> +	/* Get any pages that need to be offlined from firmware and reserve
> them */

Should be executed only on CRI, right?

Tejas
> +	get_offlined_list(xe);
> +	get_queued_pages(xe);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h
> b/drivers/gpu/drm/xe/xe_ras_types.h
> index d76310866da5..1a5de6cd16a1 100644
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -10,6 +10,7 @@
>=20
>  #define XE_RAS_NUM_ERROR_ARR		3
>  #define XE_RAS_MAX_ERROR_DETAILS	16
> +#define XE_RAS_NUM_PAGES		25
>  #define XE_RAS_IEH_PUNIT_ERROR		BIT(1)
>=20
>  /**
> @@ -297,4 +298,42 @@ struct xe_ras_page_offline_response {
>  	/** @reserved: Reserved for future use */
>  	u32 reserved;
>  } __packed;
> +
> +/**
> + * struct xe_ras_page_offline_list - Response from get offline list
> +command
> + *
> + * This structure provides the details of offlined pages from flash.
> + */
> +struct xe_ras_page_offline_list {
> +	/** @max_entries: Total no of pages that can be stored in flash */
> +	u32 max_entries;
> +	/** @total_pages: Total number of permanently offlined pages */
> +	u32 total_pages;
> +	/** @pages_returned: Number of pages returned in this response */
> +	u32 pages_returned;
> +	/** @page_addresses: Array of permanently offlined page addresses
> (4KB aligned) */
> +	u64 page_addresses[XE_RAS_NUM_PAGES];
> +	/** @additional_data: Indicates if more data is available */
> +	u8 additional_data;
> +	/** @reserved: Reserved for future use */
> +	u8 reserved[3];
> +} __packed;
> +
> +/**
> + * struct xe_ras_page_offline_queue - Response from get offline queue
> +command
> + *
> + * This structure provides the details of queued offlined pages from fir=
mware.
> + */
> +struct xe_ras_page_offline_queue {
> +	/** @total_pages: Total number of queued pages */
> +	u32 total_pages;
> +	/** @pages_returned: Number of pages returned in this response */
> +	u32 pages_returned;
> +	/** @page_addresses: Array of offlined page addresses (4KB aligned)
> */
> +	u64 page_addresses[XE_RAS_NUM_PAGES];
> +	/** @additional_data: Indicates if more data is available */
> +	u8 additional_data;
> +	/** @reserved: Reserved for future use */
> +	u8 reserved[3];
> +} __packed;
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> index 2cafa8a14cc3..b6139ac0eaca 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> @@ -15,10 +15,14 @@
>   *
>   * @XE_SYSCTRL_CMD_GET_SOC_ERROR: Get basic error information
>   * @XE_SYSCTRL_CMD_PAGE_OFFLINE: Instruct firmware to offline/decline a
> page
> + * @XE_SYSCTRL_CMD_GET_OFFLINE_LIST: Get list of all offlined pages
> + from flash
> + * @XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE: Get list of offlined queued
> pages
> + from firmware
>   */
>  enum xe_sysctrl_mailbox_command_id {
>  	XE_SYSCTRL_CMD_GET_SOC_ERROR		=3D 0x01,
> -	XE_SYSCTRL_CMD_PAGE_OFFLINE		=3D 0x08
> +	XE_SYSCTRL_CMD_PAGE_OFFLINE		=3D 0x08,
> +	XE_SYSCTRL_CMD_GET_OFFLINE_LIST		=3D 0x09,
> +	XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE	=3D 0x0A
>  };
>=20
>  enum xe_sysctrl_group {
> --
> 2.47.1


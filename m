Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3457C3DA64
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 20:37:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 831AA10E0C2;
	Thu,  1 Aug 2024 20:37:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V6zGZfAI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0407910E0C2
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Aug 2024 20:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722544654; x=1754080654;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WS1XgrfdwouH+8xP+kWrwRonlnGi9Vgg/TO5SYV0NrY=;
 b=V6zGZfAIiaMrsRsNjZlzM95igxQUXfLapjuRv0uRbl8C5CwywdgvUmzj
 cAqY1+XM7pRy8MPxFGM6RsEXhiEsSaQ0qwDFyuoKwjqyzhl7ABMms3EcZ
 5j3HUjp866apxMPKuPGMmTVATK1ra1MQXOPh1g+/df6OfSN7MYblRUeZb
 FSD0pcj6woq/2hnD/qCL0KqqlFlAbucG2Ld7prGK6PkeDXiAHG9pqfU2A
 CH6fagOFF7DZdS9X4XIv7UxShE+hV1UniALn/IuKf+5wGpXuyrNpOMt5u
 ZmVVN6zhzpaSCkAbLUKQLoXb5HyUxJLyCqVr7nVVTyPQALDAaVbSAo5Nz w==;
X-CSE-ConnectionGUID: o5SupGjcTgmKlWYSXgV44g==
X-CSE-MsgGUID: Furk4bRcQ9S91hmXH7XSgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="37994388"
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="37994388"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 13:37:33 -0700
X-CSE-ConnectionGUID: QtaYC4NJTx2jvK4zZkkbKA==
X-CSE-MsgGUID: 3sgf2JvOQGaQ2ZI5ZNP+sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="55082147"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Aug 2024 13:37:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 13:37:33 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 1 Aug 2024 13:37:33 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 1 Aug 2024 13:37:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BLYxwGlgGzUUyXXv7mISDngo5CmZbhuhi573tXD0mXS2dEOAkXTxPal58sXKXFYWb/HfVIQPr9LvmoO9z4cArecLu6xglqIUyACm43d1qUFtP4y5nWlDjlFbNHlOQHNj/O1SeaPJvnuKIj4iuD2/Y5wzRGg0tyJo2mu9uJXqcunlGKGLv8YnFURdFxf86Ru036737SEbxTL3+mJAVRR2Kyjf2olwm1R4O5JU+ZrIY1rkwLg1HoLq0pp9Ke5aJC6KPdJYEtBd7mFHdB0eacvfY/ndu2eHvCBXhYABbreQfoUyDDeyDUtHeUcPnjKwuWD2leltoSdrRAX/GbMALxKmAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w1AQbXQ7+jBhWJQ3fOyjNfHD2dxkqVFfWvAVaf0wEh4=;
 b=EVy4D7kdduCwRDbmHjX358zTeMmyNNQoMUdGYpwQKbE8pxQmtYD9D1e8FuJ/TsvJa2UHasR1i4jSheza0B8Ez/QmkUBfCaFHVcjn1Pf6nOF061M4yaLwYNpZQCvI1+kmWrfUeerG2oV+DZT5yiK869LjgcJbbUGaLeV3L76KBOcXwX1UNbFVMBxaOVlZP2nvmv8W0dCX2d1Z3EQuBDHk7TlxmTdy2wyK24JwdnxJBfNdmQkTD+spZ4EnyH6Zr8ljbPeRJXFNLFQWyZDvcFYgB1eZNXj0H9jCuZsSziau2YnXVCVic1jhiSCEDDuNspZbl4e61aUOrLe+M/DnrU1RPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SA1PR11MB6757.namprd11.prod.outlook.com (2603:10b6:806:25c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17; Thu, 1 Aug
 2024 20:37:29 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.7828.021; Thu, 1 Aug 2024
 20:37:28 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Filipchuk, Julia" <julia.filipchuk@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Harrison, John C" <john.c.harrison@intel.com>, "Filipchuk, Julia"
 <julia.filipchuk@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH xe-for-ci 3/3] drm/xe/guc: Pick for-ci GuC firmware for PVC
Thread-Topic: [PATCH xe-for-ci 3/3] drm/xe/guc: Pick for-ci GuC firmware for
 PVC
Thread-Index: AQHa5FJFID2iYcwTDUWqX/BM/L/Hs7IS3HLw
Date: Thu, 1 Aug 2024 20:37:28 +0000
Message-ID: <CH0PR11MB54440A019200D6DD8E67AFCCE5B22@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240801203341.3042386-1-julia.filipchuk@intel.com>
 <20240801203341.3042386-3-julia.filipchuk@intel.com>
In-Reply-To: <20240801203341.3042386-3-julia.filipchuk@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SA1PR11MB6757:EE_
x-ms-office365-filtering-correlation-id: 2a4faf53-6cf3-4981-66ae-08dcb269c2be
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?+4arwh0Z4ceR3p97TFQKXmuvDrAfYQK4bapTURbfKlN9xXoy7hddvaWwwF1H?=
 =?us-ascii?Q?Xl9e+F+KuXDhxifV2zeglFy023VnSUyWHN4dqJmFUPaC5EowZtrkLHOExfcs?=
 =?us-ascii?Q?WKl4RCUrGQTbL1KwV+5W3v+ZIIw5wo4Sk7iIcUmtxD0hAsFMx3osIqNeV5XH?=
 =?us-ascii?Q?pjqgvWY1dJimaUQ+nruGAsgeqPB6dsf9ObSIKKZLU2JKOAbzCACFepGk5cda?=
 =?us-ascii?Q?F26JYpcs3dqyFgYVBigTtRvj4iT1oKxEgzqVOFNUytKBZvPNhqEP9lSKvEqk?=
 =?us-ascii?Q?Wzs6QlpCypb7UM9sHXE89oKnsDu8M8ygfQbYLip4XuObclmoF456KMf0DnjF?=
 =?us-ascii?Q?3Af3/+OJQ8k/lTPFzz3BxReQXVcjpnx9s2G0EQ6LVNXVvT6TUT2B9eWy5mxb?=
 =?us-ascii?Q?4SWmcHhz6qfRxr6xQTFpiR8MJznF06PlB+YvcC/w8J2CSs3PpZcLno2xg0ES?=
 =?us-ascii?Q?16NDqmqDyGprXQXqMBygOXaXLGuykt37NuiSQzGlc3aCZQqU5OAN1C/tR1Sl?=
 =?us-ascii?Q?3Ln4j5rTHD5/K+jpdnfdkndxwvaQ/0XU920NnX3+VhBCbJfc3FBk7xkpxn8b?=
 =?us-ascii?Q?9wJAjA4BWS8jYIHG82VImvWySJpMHady+IiSNvYbn3fSTeH/PK75fBtjwj75?=
 =?us-ascii?Q?uBuw98TyJKj03XOrwJl5CPulcITMIGooyGe8kDkT+Rgu3zUXC7uFJ6LvlPBR?=
 =?us-ascii?Q?wpyzzg9IZttpuz0d6CpKoaW9W95spcWr70cRS+Namq5Q5Adl031FMZuvVLcv?=
 =?us-ascii?Q?yH5C8K8XiQ1rDkIFr8ULu8CRywClwT2YEcvf2L2yiXybAy+grqK5VN6A/Hus?=
 =?us-ascii?Q?96WOKsBErE5zNJkLrvJYSLh/PQivoKIAqGRZ0C93kPO1vuEZ4HreIeBbjmEX?=
 =?us-ascii?Q?dorf7NL4jJsDf3GpWdZwBZWNdlRsZYtfcgMpOTm9F/PInICIvZaLrSb9vyJW?=
 =?us-ascii?Q?1ErEOiWcDpGlvjU/qyb2UwWTnHdC+JMSE0aW/wfqktlfKiJ7o/S+MLVqHb6q?=
 =?us-ascii?Q?9hARhSu7yLEc6/MzXOsnVwS98uaEVh8IF7moDusasq+RmmhjYyBkUoYZPojQ?=
 =?us-ascii?Q?gPwkE5B010UBnuElqJdqX947Ppw9/FxAj//qgJqeDV9+Kazp0yF4bdonqa/e?=
 =?us-ascii?Q?2sQyMk23xDq1jgHzUA/45B1KD9GJm9NWy8hdLQGmVo1LAOEfvI6I972krr80?=
 =?us-ascii?Q?sUHU2BaCjGTph6nJ1Iouk+cxGejTn0tVLarBJwJ/IQBVOU4YY5U5ru5sFOhh?=
 =?us-ascii?Q?ksnlc6N2wLg4jVSUpTQwuSqt6EnDcLLhYFY4TBe6IuRF/MaRnr1ilBFj0eg5?=
 =?us-ascii?Q?zZ9/CLgfHxQq/xFXpV20ClmzBVB1rBo+X66XttOfdTxB2JJXTkXYlS5Becd9?=
 =?us-ascii?Q?zL1I54Z8w+2SP9kXNN9V9NNmBCB3RvdLSJybbDPFC8kh2di2tg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9XFP4p4zdXHDO21A/F391qsVmVk35Vg4vwl1ghIU99rsGTcilsrFuSfruHUr?=
 =?us-ascii?Q?Rxqt8Y9e5vmgQcUuJIdju272xsDlmGZwyemh7/XTv5ihhls9brLit1kmIA4N?=
 =?us-ascii?Q?UmGobfZgVaGZF4bQLqqhFpzD4MZx8bNEkMmFC0RYgtMzespgnvd0UoQh9/ad?=
 =?us-ascii?Q?OmMdOPtGB9jQYD6y7qOjx4aG5Pq02IDuIYG108ppfQKArcM4UJx1hxyuFXdX?=
 =?us-ascii?Q?+BqRWRurb7fZizHdGGmNSQ+n1taKUmpZb2iSDbE5YsbDtQIz1F/A18tdkI9T?=
 =?us-ascii?Q?ry3bPGwz0Pz582stG2C+5ERGhYHeXGyYMLBXbp1WT6xHQyShz26VjAMDOMsW?=
 =?us-ascii?Q?j9L5TW1j1QMse6LdjxXwVJj2vYg5cwnJGA9aRi1o616TVh/RJM3e0YDi19vQ?=
 =?us-ascii?Q?rZhstjjJ7bKxUwsmUTWy7LlQlZo0zI3H/MCPBIA3wpJYBDv+caXIEz1AHLZ/?=
 =?us-ascii?Q?BopvRIK00fNj8Dxn7jhlyz5BOkY/aQUj9Da0bSl4OSc5b/PQoQAbyLng7cyg?=
 =?us-ascii?Q?dH4Ls+eBDCV40OOvxqHtXYJ1Jl11U4XpBd+xIjPZL7NQk5K5B9eGq8LM4yGi?=
 =?us-ascii?Q?74pP0LGVTbIA5qQ8vmtTVm2n3Et7GbdA0+kI53NT69d7h6PMIc1Tbr1rD7V3?=
 =?us-ascii?Q?mQfYpSG/AJbjXjdxDHZw/H/wKV5kweKpROgzgWPAmoio1SPrxIrvgfiQ03NO?=
 =?us-ascii?Q?U1NtbHnN/ifTSyxUWjZjjSqVbjMY8f8q8HAmDbcYDcjM3gw/zIuaildU2T5q?=
 =?us-ascii?Q?m6KmFg+uVl+y3WdFyTi+mPmewfTKt+Y/F9EcwbAAZsSLNPiX4E83M8+CtoEc?=
 =?us-ascii?Q?EHWo2IGNhzQ53tH0L793epzYwLTiylu4NDpka7MdswZTqbmMGYft1gY4zkvT?=
 =?us-ascii?Q?FJ+K4YNUqdDLVJb700cLp+eEKQEc5JEuTT3h34BGE9wOCYiPfxt668MwgHEs?=
 =?us-ascii?Q?7ckCuRYwBIh+bVtJ30rUMw4QqRbznLNsgwCmq+3NFvH0LIQmCkxQioDspLBJ?=
 =?us-ascii?Q?0oZEL3Q+/sTQLYNRPaNUpG9bDyF0kAe74ZdZ2WP2FSxEh1UxtKgIQGtyFw40?=
 =?us-ascii?Q?8CUIPQLQCAYYes+UMKWurNvKaMGwjNUZaQ1VQDGujVxUz/fpHdz/cbXw+m+s?=
 =?us-ascii?Q?k6hhT558xgT2GPSkKDUSkxqofjaW7BRB4P5ga28wXDZrgUNycTE5PvAMrF6n?=
 =?us-ascii?Q?iM9e/qRV1MSqafD9IKNCio44+LFc5mADganXN7jDvHSFaYy/PDP1Z/GsSUl8?=
 =?us-ascii?Q?ycz4CyRGo7VSGkV+rG071B+Zb4JdlBzFXp1GY2yyew/A41hJHw7j1G8k3XtG?=
 =?us-ascii?Q?8LKc1Fzj96Rd2NNdi1yTErE1DH+wcY8MUyhkCf6ezvLlfXUQOMaoXrN12IuV?=
 =?us-ascii?Q?3OAh/gY45g4V2Fb8s6lLXrBy9coob4hjzc96/O60RKicujpNawEmXeLMJTgq?=
 =?us-ascii?Q?ehtPHWS7B8hFw5Da7vkxBDdkiyt8KDdrofMUFA48sm+z37K3Pa9QKIgX9YjK?=
 =?us-ascii?Q?K5zcz3nPfnq5KGEpDsZmOk9wDWgxkcHtUut6ioDWOLZjxZ5Vai+Yxvl6brxd?=
 =?us-ascii?Q?79B9GKk3DqCjiBuqteP6WO/LAgYZfk5T5uOzQgvjMxkTm327YJBDYYnqGcZh?=
 =?us-ascii?Q?+A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a4faf53-6cf3-4981-66ae-08dcb269c2be
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2024 20:37:28.7823 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eTdMus9NRFIWlICXZzEPYbI9ZzzQkk1jeECjR+1En+ytc9tmJu4oICvjS/KMKG0pYPbmnQAuURE+ZdpTcNIT3hnU6xKcC34fhzacXQdG94c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6757
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

-----Original Message-----
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Julia =
Filipchuk
Sent: Thursday, August 1, 2024 1:34 PM
To: intel-xe@lists.freedesktop.org
Cc: Harrison, John C <john.c.harrison@intel.com>; Filipchuk, Julia <julia.f=
ilipchuk@intel.com>
Subject: [PATCH xe-for-ci 3/3] drm/xe/guc: Pick for-ci GuC firmware for PVC
>=20
> From: John Harrison <John.C.Harrison@Intel.com>
>=20
> UAPI version 1.10.2.
>=20
> Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>

LGTM
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.=
c
> index 89bea1461d20..e1d91fa07f5a 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -109,6 +109,7 @@ struct fw_blobs_by_type {
>  	fw_def(BATTLEMAGE,	major_ver(xe,	guc,	bmg,	70, 29, 2))	\
>  	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 29, 2))	\
>  	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 19, 2))	\
> +	fw_def(PVC,		mmp_ver(intel-ci/xe, guc, pvc,	70, 24, 0))	\
>  	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 19, 2))	\
>  	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 19, 2))	\
>  	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 19, 2))	\
> --=20
> 2.45.2
>=20
>=20

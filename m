Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E567C369A9
	for <intel-xe@archiver.kernel.org>; Thu, 10 Apr 2025 17:51:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01F9B10E37C;
	Thu, 10 Apr 2025 17:51:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ChyQ6gqK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3331F10E379
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Apr 2025 17:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744307467; x=1775843467;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Zj1zvxUOKpTNqfFit+yunU/aLuZJkJfXrccD4fF90+M=;
 b=ChyQ6gqKSyw5bxgzyuzU8RgPT9Fqgx3uxNvcPVCn82b/d7WXzPBWsQwX
 uPXrDO8PpKpJxasFiVHCzcW3aACBGjnjyGw9YJ+6/k1u61Dgs5wCfbyVO
 gXZLzc/UmBCqbBhNn3MaAnfUB41KVc1RkbQp+rDrKRe0mGu61hfFyeUvw
 4fRbo2NyBV5G87iQOjH8ocEvEhU+QKwbitfZt/80HiVNWQe6LV3MktktP
 ha5qa6unqnKnSYn7EsxUK9J8qQM1RIggZd2hjrtGlBzyzGmEdn7WZVfSA
 2/A8Xo8pYcYFRGmjdrlK4u3DnOZsMmaFJWXUgunLZtlGOr4dSIeLOdr5m w==;
X-CSE-ConnectionGUID: vmzffiI7S6qyu6Ff3vMYOw==
X-CSE-MsgGUID: ocRFshZISESGhzWsTmNDNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45936789"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="45936789"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 10:51:05 -0700
X-CSE-ConnectionGUID: Fvfyfd5cRwmF2+H+HbWprw==
X-CSE-MsgGUID: xtSn5xoFQuGjo4LnRfmtpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="129813689"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 10:51:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 10 Apr 2025 10:51:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 10 Apr 2025 10:51:04 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 10 Apr 2025 10:51:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cB6yus4EUjoO6OBkXjwZLxlBIUWhCeCTAkrsthRRtpbNoZpO4Bg+pUTEgaJs8xfsM5cWY55KlwkIeBVmBFibuNxLGHuTCA0zyrrVnWOGeaIUBAEoU/fdVUcNjx/Led1LAsLgnkMj1i1mDMDDOkrbXyXWmUd833iep9trqap42qoizZ4aKN8stQWNfYwvclhQKS62jayFWcra1U7EZcrMUe+DRWoRZhtJNKQP5ao8Anv3YyCoUb25asLmKN/z3ua8HJlXn30KseBQsadV6VgQh0mnJLYveS01peMqzsqkxH8RI56lB6st8FU/8KDXEirM9U8RQ1cdN7rJw4BNBQjpuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XGdwVNvTyfSELL3BuqoasU+Dk7i5ShQXxAL+bwL8BZ8=;
 b=Bvp9e/VeVrcC9ZmualD54/Ute0YQu5ogAHCKXxeZYkUzqzFL3zm+oxiV6GOH+Qt2xV0tACQo0+0uiaH3Kl1hVqUwkpe2/zkP/wliedpOLCbALzAqpM+OPlBqXzXlkXgNjVTbaTjQAeIAHYZ9O4lAp8AchtfBuYbJyq4+SPKTlihuYsCIECYlYiZNbvlqHbDkusaac7+phRMBQSx/bwYbqAl9tCK5I0MYvpruyHGfztBsAHT0sbqlzNcp3nN2yfl2Ur/jVaEbiRkvAvuJuNRVH0ibUVYFfD3f3rzfQI1xQFTjy8NGn2cYLPRv3M6XMyk+9tCYcvU7EdL8ZXqxbVEgPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by IA1PR11MB6265.namprd11.prod.outlook.com (2603:10b6:208:3e7::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.23; Thu, 10 Apr
 2025 17:50:19 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 17:50:18 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>
CC: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v3 1/4] drm/xe/guc: Add LFD related abi definitions
Thread-Topic: [PATCH v3 1/4] drm/xe/guc: Add LFD related abi definitions
Thread-Index: AQHbqjGdhaddeNYYZE6d2gId6sQabbOdEOig
Date: Thu, 10 Apr 2025 17:50:18 +0000
Message-ID: <CH0PR11MB5444634E5911E9E199D30C8CE5B72@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250410155853.574830-1-zhanjun.dong@intel.com>
 <20250410155853.574830-2-zhanjun.dong@intel.com>
In-Reply-To: <20250410155853.574830-2-zhanjun.dong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: Michal.Wajdeczko@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|IA1PR11MB6265:EE_
x-ms-office365-filtering-correlation-id: 29696a21-e83e-4726-dace-08dd7858288b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?uUxfD5ddWRYampMOIuGBTovL1HX0uC1q0NNfLUmvktrdpUVeQZbGANuDNsGz?=
 =?us-ascii?Q?TIhZGQqxBn/ouLuEWgVbnjKHQf2Ezsrb4u4hgCyo5qV33//RvPWJR3iO1THV?=
 =?us-ascii?Q?VCZPLPNoJytZUpBLaXfb42BLx9RhuEmSjK+oGvhtGV7n0i1cBKRLIGSE2NjO?=
 =?us-ascii?Q?nfETdUwK9VQoOX2R13s8pvuTmVx13iXpQmX5u12jf57yAiSS6q/hBPghwIoM?=
 =?us-ascii?Q?/6d8PeE3ymn+g4xrnRLI65XV0NyPSQ7Q0k/jCpH0mt23A79yHsEVTlnnSxqK?=
 =?us-ascii?Q?cqM7binFQ0pzU1lFvkvqqIUGXR3+dimPuO9cs7eiG0fY9ODwkSI12v3jd9c6?=
 =?us-ascii?Q?rRn/OeU88m8aR6K1B9BxjAC+G1qczX0It98vJHGZzmIo9nTO1tTKKSlcS9Fu?=
 =?us-ascii?Q?oYEF+KY0n+apmWp6MEYSC6SHMqIlZ0QrO9zHqp5JWRoy4ujYAdUa46vO8zqN?=
 =?us-ascii?Q?6/Pc+mcsA3IASqCEM0IAuP3Oh2UnTW7ZutIATH2jTIyri7R5j1mTJgsql4wv?=
 =?us-ascii?Q?nuHcd9obTFGtBCSFUCvf5Juy9yjdnh40FLFBumh/KD5XpI4NC3njMRb+WTI/?=
 =?us-ascii?Q?bm7B80GNlkqtFAkVOCz2vLkWBzr/UQmYABzMWa/r7NmSN0AqgJbT/xZe3bvl?=
 =?us-ascii?Q?howNmd/kwNliX4PK+SOSarykaXin4dp96UGGKtzwrs6GL+7Y4Fqy43hXaTRw?=
 =?us-ascii?Q?jSbgq3R2aVYO2KUPAbnAFr2gjP5LWwATlcLOIZImZ9HKimaBWr1TF7QzxV6u?=
 =?us-ascii?Q?E/lsR9ZTRPPwhReUi1g7HDA8OhYY1opEb6YctF9ccKjlSK18qnsjDlfBGiz5?=
 =?us-ascii?Q?r2/GfpVKi9IJ959TWiDh4K9ag21ZXjWIurngnYtm/E/pKfRmkAbfmEnvLtt4?=
 =?us-ascii?Q?SDugiq/Z4CoyZd7xgeEyysKJdJchd3G9Y4yXrnAzcFUQJdwbTUudM5s7x8rA?=
 =?us-ascii?Q?8WITJF+MgwmxudonHW0UNVMu05/487TdDxp8sy0Z4FDRzkChMPKbzMyz7bZD?=
 =?us-ascii?Q?pHiBsOWqaPzAL7NuYhaKpFWlXiUpiedd2CSfB0sTjmyCSSbLkbrJMfkig5vl?=
 =?us-ascii?Q?4lqQfPz0HyPHktnwgNcWP6/aW3TQw++3EZOVz9eYjCS2qZpu1qKugVYWBJxZ?=
 =?us-ascii?Q?oXIVwN44YxEUbFo/57NALITR2ePgOQlR8hC+eTndih5aUmfsekRUtP6a+JYY?=
 =?us-ascii?Q?EgH/M+1oKs1/k7w+K+wx4nwrjbmUVoZC7Fzi2+yZ4Ti5jW1ak0b0jOWVL2Xn?=
 =?us-ascii?Q?yiNHMI3RQD4LZ1JzMO233K1K7LWDGw0aKPaNtW80BWvUHFc2s54/VvZF4PYT?=
 =?us-ascii?Q?Vrysfcx8mAZAQo4rcBWlcWmIF9CbuAZlVqa1Y/BDGbIy3cjdkAxIKCOUJ8wE?=
 =?us-ascii?Q?UUbzCN5LzwOmm2iqq6dIyvKmIi7BkngcPbEdQ+mrUyACjDqmGX8vlmxsM0/Y?=
 =?us-ascii?Q?5dmiNtjk/g+BSIBtW1nd3C2hB+Nx/mG4c26qBHxaga5LkamZXZGOLKDn1DjM?=
 =?us-ascii?Q?JQvLbLvmuXOMxmk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HZepXCkgzwVQrIY6O7Swv4owl1ZYHYGsiToHGNzn2e9Fu1pooJ+VRvv4Qluz?=
 =?us-ascii?Q?7KEp2ipQkK3q1bMBf9AsyKZIb/K84O8G03ksCmmTB3ACrFyQ/VIuwdSgudDQ?=
 =?us-ascii?Q?yNCZs/X7xhLEFxWKYUYt9FfWi8A9Z2gYQhkJoUNuJUHCO12UEtmRCVd9c5bh?=
 =?us-ascii?Q?rDFTNkG/hUt152WlX5l0OctA11MOGF9Hjl8AYlU5WWqCEmEaf+l3FMBn2WT0?=
 =?us-ascii?Q?T14/8GYylzVRfE6ACw1eo7LOpyE7FngY2e89Xnb3IoNNHqouEEwLfEbR7kGM?=
 =?us-ascii?Q?Xm76nP+iT7U4R/x8yrs9TxJzUYM13R4pqUYlBSKBUvm3eE5UNUup42Gnib24?=
 =?us-ascii?Q?vKOMIDp7Ky4QnwTtx1Rk98D7wwOR/mECI1AwLfoK+/CHC8OtL4EPhPms81bV?=
 =?us-ascii?Q?o1eUq6QGeS+JDAIwdGn+BxRd9Qat2s7aAI1l8W3C1ni1Vni0GS89RlhkC6M/?=
 =?us-ascii?Q?dSSy5e6KsvOgc1kgx3J6XcqtoTA65kHSLRrhOtRgmx/ELPN3PlqVEpr+tsVM?=
 =?us-ascii?Q?IB2SNdos2UMqPD4iuABK7GyO9DZIBbSvvbAO1ckLXsfLCqxZrtzc6fdGaAJq?=
 =?us-ascii?Q?2lJSpZkxW4apRgL4GtE1euATLBeWH03rgeqQU3QTqXFmsyuKteN4BHc58HlN?=
 =?us-ascii?Q?5uwBSTBMvh1uCjV/+Ok9JzaNa+3vdHl9niNuUNLcv+nbcDRznqO+CqNW02yf?=
 =?us-ascii?Q?tSZihYJRBN7Uq4DDxV6N1sda6Akz45w8a7esotUkCylw2dwnfBth7ptrd9k2?=
 =?us-ascii?Q?cMI9XzlFjWddhizeEzW1OG7noZm/3BhOeaAHxwU8qz3uE4K7NRYckBZaytHh?=
 =?us-ascii?Q?CTnUojiHSaGn21QRftpA9nwQOQACrj66+QHW4j2vUdkId0OEAb1Y69h9GBP3?=
 =?us-ascii?Q?Mq+MGndTxShB7CbAklP+BwGlpN+BWQ3Mx2MundOUM5ND5sMrVSXi3rpJiWDL?=
 =?us-ascii?Q?xm9s4HFC8wMggEV2Elkzd+xozxTcIulXa1j2FRBDYTTRFbnqizHAtXYAU7rw?=
 =?us-ascii?Q?ELgDspiS+b7oBDjUb6Y7/+lJ9uGrLofhhKCQISeuS2DrkiGA4V5nGO4LMxUN?=
 =?us-ascii?Q?KTCzvUDH+wmHO+rL1uQqP3ynWKxxY7U2BE8yn2IwR0RlU0Fwdlw8iq+qr6hJ?=
 =?us-ascii?Q?uGvU6AwSBrWDaqx/qJJ8r+w0fwTw5gCqhuETFu0niZNxSpgV8Wuw6308phgx?=
 =?us-ascii?Q?qrGIH6b8X8iD49cyYH1ScjOB1Z5HQJSAQSo+YTovqJF5fLpwdcCZayjY/N5t?=
 =?us-ascii?Q?9kDA9RbCiKcoRcFKeT66jCDTqZGH0O+xHj/jFMDfW7QmLV5BllUyrueRy4WS?=
 =?us-ascii?Q?P8suAox0gyq27MFzAutjqoHPv/C5IrepanCfa+sx+p+voKEXPedlpqmFSjCB?=
 =?us-ascii?Q?zWVZy/X0kte3GWRihFLKwPso18wCwVJ9WgzkCJKMQPwl1wxgW3CP05qD/4Zd?=
 =?us-ascii?Q?4p5LOj/foIDCGEw5OkBh90bC95+TfrwNZOX1M5hDP+EMyREDgyiq1us8gFgu?=
 =?us-ascii?Q?KGCyTz1gWy04GcS+1Mg38oJcO5yj2pE3b3wpuUl8B/+TIxX+YLxa+zQkkRDm?=
 =?us-ascii?Q?RGCbGlYG5KbtBn0n0EBevj7s894l4y3z2+5e9A7S?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29696a21-e83e-4726-dace-08dd7858288b
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2025 17:50:18.8978 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w5esxCbJnpphR2TG7mFmyEgxrcf3jaMm5sQzOUBqIlSarDe3Zn4h7MltHyQWtmkcD9ZaVEJoX54HspWu1IRzcYG/atPUOGI09lK9mYrsC+g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6265
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Zhanju=
n Dong
Sent: Thursday, April 10, 2025 8:59 AM
To: intel-xe@lists.freedesktop.org
Cc: Dong, Zhanjun <zhanjun.dong@intel.com>
Subject: [PATCH v3 1/4] drm/xe/guc: Add LFD related abi definitions
>=20
> Add GuC LFD(Log Format Descriptors) related ABI definition.
> Add GuC log init config(LIC) ABI definition.
>=20
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>

This probably needs a second opinion, but I'm willing to tentatively
provide my RB for this patch.  Just don't apply the series quite yet and
wait for additional reviews.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

> ---
>  drivers/gpu/drm/xe/abi/guc_log_abi.h     | 116 ++++++++++
>  drivers/gpu/drm/xe/abi/guc_log_lfd_abi.h | 265 +++++++++++++++++++++++
>  2 files changed, 381 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/abi/guc_log_lfd_abi.h
>=20
> diff --git a/drivers/gpu/drm/xe/abi/guc_log_abi.h b/drivers/gpu/drm/xe/ab=
i/guc_log_abi.h
> index 554630b7ccd9..0b0c5631da93 100644
> --- a/drivers/gpu/drm/xe/abi/guc_log_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_log_abi.h
> @@ -17,6 +17,122 @@ enum guc_log_buffer_type {
> =20
>  #define GUC_LOG_BUFFER_TYPE_MAX		3
> =20
> +#define GUC_LOG_BUFFER_STATE_HEADER_LENGTH		4096
> +#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_LOG		0
> +#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_CRASH		1
> +#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_CAPTURE	2
> +#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_INIT		3
> +#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_COUNT		4
> +
> +#define GUC_LOG_INIT_CONFIG_LIC_MAGIC			0x8086900D
> +#define GUC_LOG_INIT_CONFIG_FORMAT_VERSION_MAJOR	0x0001
> +#define GUC_LOG_INIT_CONFIG_FORMAT_VERSION_MINOR	0x0000
> +
> +/** Log Init Config KLV IDs. */
> +enum guc_log_lic_type_t {
> +	/**
> +	 * GuC firmware version. Value is a 32 bit number represented by
> +	 * guc_sw_version_t.
> +	 */
> +	GUC_LOG_LIC_TYPE_GUC_SW_VERSION =3D 0x1,
> +	/**
> +	 * GuC device id. Value is a 32 bit. Refer BSpec symbol
> +	 * GUC_DEVICEID
> +	 */
> +	GUC_LOG_LIC_TYPE_GUC_DEVICE_ID =3D 0x2,
> +	/**
> +	 * GuC timestamp counter frequency. Value is a 32 bit number
> +	 * representing frequency in kilohertz. This timestamp is utilized
> +	 * in log entries, timer and for engine utilization tracking.
> +	 */
> +	GUC_LOG_LIC_TYPE_TSC_FREQUENCY =3D 0x3,
> +	/**
> +	 * HW GMD ID. Value is a 32 bit number representing graphics,
> +	 * media and display HW architecture IDs.
> +	 */
> +	GUC_LOG_LIC_TYPE_GMD_ID =3D 0x4,
> +	/** GuC build platform ID. Value is 32 bits. */
> +	GUC_LOG_LIC_TYPE_BUILD_PLATFORM_ID =3D 0x5,
> +};
> +
> +#define GUC_LOG_LIC_TYPE_FIRST	(GUC_LOG_LIC_TYPE_GUC_SW_VERSION)
> +#define GUC_LOG_LIC_TYPE_LAST	(GUC_LOG_LIC_TYPE_BUILD_PLATFORM_ID + 1)
> +
> +/** struct guc_klv_generic_t - KLV with multiple DWs in an array */
> +struct guc_klv_generic_t {
> +	/** @length: Length in Dwords of data. */
> +	u16		length;
> +	/** @key: Key value */
> +	u16		key;
> +	/** @value: Value for this key */
> +	u32		value[] __counted_by(length);
> +} __packed;
> +
> +/**
> + * struct guc_sw_version_t - This structure describes the full version o=
f
> + * a software component.
> + */
> +struct guc_sw_version_t {
> +	/** @dw0: A 32 bits dword, contains multiple bit fields */
> +	u32		dw0;
> +	/* BR[7:0]  Patch version */
> +	#define GUC_SW_VERSION_T_PATCH_VERSION		GENMASK(7, 0)
> +	/* BR[15:8]  Minor version */
> +	#define GUC_SW_VERSION_T_MINOR_VERSION		GENMASK(15, 8)
> +	/* BR[23:16]  Major version */
> +	#define GUC_SW_VERSION_T_MAJOR_VERSION		GENMASK(23, 16)
> +	/* BR[31:24]  Branch ID */
> +	#define GUC_SW_VERSION_T_BRANCH_ID		GENMASK(31, 24)

Non-blocking:
Perhaps we should split the dw0 into the 4 components
it's comprised of?  Say:
"""
#define GUC_SW_VERSION_T_PATCH_VERSION		GENMASK(7, 0)
#define GUC_SW_VERSION_T_MINIOR_VERSION	GENMASK(15,8)
#define GUC_SW_VERSION_T_MAJOR_VERSION		GENMASK(23, 16)
#define GUC_SW_VERSION_T_BRANCH_ID		GENMASK(31, 24)
struct guc_sw_version_t {
	/** @patch_version: Patch version */
	u8	patch_version;
	/** @minor_version: Minor version */
	u8	minor_version;
	/** @major_version: Major version */
	u8	major_version;
	/** @branch_id: branch ID */
	u8	branch_id;
} __packed;
"""
Or is that not possible due to some architectural reason?

Same logic above applies to guc_lic_format_version_t, guc_logfile_lfd_t, an=
d
guc_logfile_fmt_ver_t below.

> +} __packed;
> +
> +/**
> + * struct guc_lic_format_version_t - Log Init Config Structure Version.
> + * Major-Minor is not a fractional number (i.e. Ver 1.3 would be older
> + * than 1.12)
> + */
> +struct guc_lic_format_version_t {
> +	/** @dw0: A 32 bits dword, contains multiple bit fields */
> +	u32		dw0;
> +	/*
> +	 * BR[15:0]  Log-Init-Config structure minor version. Must be
> +	 * GUC_LOG_INIT_CONFIG_FORMAT_VERSION_MINOR
> +	 */
> +	#define GUC_LIC_FORMAT_VERSION_T_MINOR_VERSION		GENMASK(15, 0)
> +	/*
> +	 * BR[31:16]  Log-Init-Config structure major version. Must be
> +	 * GUC_LOG_INIT_CONFIG_FORMAT_VERSION_MAJOR
> +	 */
> +	#define GUC_LIC_FORMAT_VERSION_T_MAJOR_VERSION		GENMASK(31, 16)
> +} __packed;
> +
> +/**
> + * struct guc_log_init_config_t - GuC Log-Init-Config structure.
> + * This is populated by the GUC at log init time and is located in the l=
og
> + * buffer as per the Log Buffer Layout (In Memory). The array of guc log
> + * buffer states plus this structure must not exceed 4KB
> + */
> +struct guc_log_init_config_t {
> +	/**
> +	 * @lic_magic: A magic number set by GuC to identify that this
> +	 * structure contains valid information: lic_magic =3D 0x8086900D.
> +	 * Used to verify the information in this structure is valid.
> +	 */
> +	u32		lic_magic;
> +	/**
> +	 * @lic_ver: The version of the this structure. Detail description
> +	 * is guc_lic_format_version_t
> +	 */
> +	struct guc_lic_format_version_t	lic_ver;
> +	/** @lic_dw_size: Number of Dws the `lic_data` array contains. */
> +	u32		lic_dw_size;
> +	/**
> +	 * @lic_data: Array of dwords representing a list of LIC KLVs of
> +	 * type guc_klv_generic_t with keys represented by
> +	 * guc_log_lic_type_t
> +	 */
> +	u32		lic_data[] __counted_by(desc_dw_size);
> +} __packed;
> +
>  /**
>   * struct guc_log_buffer_state - GuC log buffer state
>   *
> diff --git a/drivers/gpu/drm/xe/abi/guc_log_lfd_abi.h b/drivers/gpu/drm/x=
e/abi/guc_log_lfd_abi.h
> new file mode 100644
> index 000000000000..b4002f099fd5
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/abi/guc_log_lfd_abi.h
> @@ -0,0 +1,265 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright (c) 2025 Intel Corporation
> + */
> +
> +#ifndef _ABI_GUC_LOG_LFD_ABI_H_
> +#define _ABI_GUC_LOG_LFD_ABI_H_
> +
> +#include <linux/types.h>
> +
> +#include "abi/guc_log_abi.h"
> +
> +/* Magic keys define */
> +#define LFD_DRIVER_KEY_STREAMING		0x8086AAAA474C5346
> +#define LFD_LOG_BUFFER_MARKER_2			0xDEADFEED
> +#define LFD_CRASH_DUMP_BUFFER_MARKER_2		0x8086DEAD

Non-blocking:
These two magic keys should probably be aligned with the other keys below,
but I'm willing to concede that they may be out of alignment because of my
choice in mail viewer and not because they're also out of alignment in the
code itself.

> +#define LFD_STATE_CAPTURE_BUFFER_MARKER_2	0xBEEFFEED
> +#define LFD_LOG_BUFFER_MARKER_1V2		0xCABBA9E6
> +#define LFD_STATE_CAPTURE_BUFFER_MARKER_1V2	0xCABBA9F7
> +
> +#define GUC_LOGFILE_LFD_MAGIC	upper_16_bits(LFD_CRASH_DUMP_BUFFER_MARKER=
_2)
> +
> +/** The current major version of GuC-Log-File format. */
> +#define GUC_LOG_FILE_FORMAT_VERSION_MAJOR	0x0001
> +/** The current minor version of GuC-Log-File format. */
> +#define GUC_LOG_FILE_FORMAT_VERSION_MINOR	0x0000
> +
> +/** Log format descriptor type */
> +enum guc_lfd_type_t {
> +	/** Start of range for required LFDs from GuC */
> +	GUC_LFD_TYPE_FW_REQUIRED_RANGE_START =3D 0x1,
> +	/**
> +	 * GuC Firmware Version structure. LFDs payload is
> +	 * guc_lfd_data_fw_version_t
> +	 */
> +	GUC_LFD_TYPE_FW_VERSION =3D 0x1,

Non-blocking:
Enum values don't generally repeat themselves.  You might
want to convert this into a series of defines, instead of trying
to fit this into an enum list.

Same with guc_lfd_os_type to a lesser extent, as well as all the
other enums in this patch.

> +	/**
> +	 * GuC microcontroller device ID. LFDs payload is
> +	 * guc_lfd_data_guc_devid_t
> +	 */
> +	GUC_LFD_TYPE_GUC_DEVICE_ID =3D 0x2,
> +	/**
> +	 * Frequency of GuC timestamps. LFDs payload is
> +	 * guc_lfd_data_tsc_freq_t
> +	 */
> +	GUC_LFD_TYPE_TSC_FREQUENCY =3D 0x3,
> +	/** HW GMD ID. LFDs payload is guc_lfd_data_gmdid_t */
> +	GUC_LFD_TYPE_GMD_ID =3D 0x4,
> +	/**
> +	 * GuC build platform ID. LFDs payload is
> +	 * guc_lfd_data_build_platformid_t
> +	 */
> +	GUC_LFD_TYPE_BUILD_PLATFORM_ID =3D 0x5,
> +	/** End of this range */
> +	GUC_LFD_TYPE_FW_REQUIRED_RANGE_END =3D 0x1FFF,
> +	/** Start of range for required LFDs from GuC */
> +	GUC_LFD_TYPE_FW_OPTIONAL_RANGE_START =3D 0x2000,
> +	/**
> +	 * Log-event-entries buffer. LFDs payload is
> +	 * guc_lfd_data_log_events_buf_t
> +	 */
> +	GUC_LFD_TYPE_LOG_EVENTS_BUFFER =3D 0x2000,
> +	/**
> +	 * GuC generated crash-dump blob. LFDs payload is
> +	 * guc_lfd_data_fw_crashdump_t
> +	 */
> +	GUC_LFD_TYPE_FW_CRASH_DUMP =3D 0x2001,
> +	/** End of this range */
> +	GUC_LFD_TYPE_FW_OPTIONAL_RANGE_END =3D 0x3FFF,
> +	/** Start of range for required KMD LFDs */
> +	GUC_LFD_TYPE_KMD_REQUIRED_RANGE_START =3D 0x4000,
> +	/**
> +	 * An identifier for the OS. LFDs payload is guc_lfd_data_os_id_t
> +	 */
> +	GUC_LFD_TYPE_OS_ID =3D 0x4000,
> +	/** End of this range */
> +	GUC_LFD_TYPE_KMD_REQUIRED_RANGE_END =3D 0x5FFF,
> +	/** Start of range for optional KMD LFDs */
> +	GUC_LFD_TYPE_KMD_OPTIONAL_RANGE_START =3D 0x6000,
> +	/**
> +	 * Binary representation of GuC log-events schema. LFDs TLV
> +	 * payload is guc_lfd_data_binary_schema_t
> +	 */
> +	GUC_LFD_TYPE_BINARY_SCHEMA_FORMAT =3D 0x6000,
> +	/**
> +	 * ASCII string containing comments from the host/KMD. LFDs TLV
> +	 * payload is guc_lfd_data_host_comment_t
> +	 */
> +	GUC_LFD_TYPE_HOST_COMMENT =3D 0x6001,
> +	/** End of this range */
> +	GUC_LFD_TYPE_KMD_OPTIONAL_RANGE_END =3D 0x7FFF,
> +	/** Start of reserved range */
> +	GUC_LFD_TYPE_RESERVED_RANGE_START =3D 0x8000,
> +	/** End of this range */
> +	GUC_LFD_TYPE_RESERVED_RANGE_END =3D 0xFFFF,
> +};
> +
> +/** OS Type LFD-ID */
> +enum guc_lfd_os_type_t {
> +	/** Windows OS */
> +	GUC_LFD_OS_TYPE_OSID_WIN =3D 0x1,
> +	/** Linux OS */
> +	GUC_LFD_OS_TYPE_OSID_LIN =3D 0x2,
> +	/** VMWare OS */
> +	GUC_LFD_OS_TYPE_OSID_VMW =3D 0x3,
> +	/** Other */
> +	GUC_LFD_OS_TYPE_OSID_OTHER =3D 0x4,
> +};

All of the above defines and enums should probably be a part
of a separate xe/reg file.  Say, xe_guc_log_lfd_desc.h?

Though I'd recommend getting a second opinion on this, as I
just recall it being a requirement for something I was working
on earlier.  Though it might be a different case?

@Wajdeczko, Michal might be a better authority on this.

-Jonathan Cavitt

> +
> +/**
> + * struct guc_logfile_lfd_t - Log format descriptor (LFD).
> + * A type of KLV with custom field-sizes + magic numbers.
> + */
> +struct guc_logfile_lfd_t {
> +	/** @dw0: A 32 bits dword, contains multiple bit fields */
> +	u32		dw0;
> +	/*
> +	 * BR[15:0]  Expected value: 0x8086. Helpful in detecting file
> +	 * errors.
> +	 */
> +	#define GUC_LOGFILE_LFD_T_MAGIC		GENMASK(15, 0)
> +	/*
> +	 * BR[31:16]  File descriptor type (the 'T' in TLV) is used to
> +	 * identify how to interpret `data` below. For the range of types,
> +	 * see guc_lfd_type_t
> +	 */
> +	#define GUC_LOGFILE_LFD_T_DESC_TYPE		GENMASK(31, 16)
> +	/** @desc_dw_size: Number of dwords the `data` field contains. */
> +	u32		desc_dw_size;
> +	/** @data: Data defined by File descriptor type. */
> +	u32		data[] __counted_by(desc_dw_size);
> +} __packed;
> +
> +/**
> + * struct guc_logfile_fmt_ver_t - GuC Log File Format Version.
> + * Major-Minor is not a fractional number (i.e. Ver 1.3 would be older
> + * than 1.12)
> + */
> +struct guc_logfile_fmt_ver_t {
> +	/** @dw0: A 32 bits dword, contains multiple bit fields */
> +	u32		dw0;
> +	/*
> +	 * BR[15:0]  Guc-Log-File Format minor version. Must be
> +	 * GUC_LOG_FILE_FORMAT_VERSION_MINOR
> +	 */
> +	#define GUC_LOGFILE_FMT_VER_T_MINOR_VERSION		GENMASK(15, 0)
> +	/*
> +	 * BR[31:16]  Guc-Log-File Format major version. Must be
> +	 * GUC_LOG_FILE_FORMAT_VERSION_MAJOR
> +	 */
> +	#define GUC_LOGFILE_FMT_VER_T_MAJOR_VERSION		GENMASK(31, 16)
> +} __packed;
> +
> +/**
> + * struct guc_lfd_data_guc_devid_t - GuC Device ID.
> + * This is mandatory fw LFD data
> + */
> +struct guc_lfd_data_guc_devid_t {
> +	/**
> +	 * @guc_devid: GuC microcontroller device ID defined as described
> +	 * in GUC_LOG_LIC_TYPE_GUC_DEVICE_ID
> +	 */
> +	u32		guc_devid;
> +} __packed;
> +
> +/**
> + * struct guc_lfd_data_tsc_freq_t - GuC TSC Fequency.
> + * This is mandatory fw LFD data
> + */
> +struct guc_lfd_data_tsc_freq_t {
> +	/**
> +	 * @tsc_freq: GuC timestamp counter frequency as described in
> +	 * GUC_LOG_LIC_TYPE_TSC_FREQUENCY
> +	 */
> +	u32		tsc_freq;
> +} __packed;
> +
> +/** struct guc_lfd_data_gmdid_t - GMD ID. */
> +struct guc_lfd_data_gmdid_t {
> +	/** @gmd_id: GMD ID as described in GUC_LOG_LIC_TYPE_GMD_ID */
> +	u32		gmd_id;
> +} __packed;
> +
> +/** struct guc_lfd_data_build_platformid_t - GuC build platform ID. */
> +struct guc_lfd_data_build_platformid_t {
> +	/**
> +	 * @platform_build_id: GuC build platform ID as described in
> +	 * GUC_LOG_LIC_TYPE_BUILD_PLATFORM_ID
> +	 */
> +	u32		platform_build_id;
> +} __packed;
> +
> +/**
> + * struct guc_lfd_data_log_events_buf_t - GuC Log Events Buffer.
> + * This is optional fw LFD data
> + */
> +struct guc_lfd_data_log_events_buf_t {
> +	/**
> +	 * @log_events_format_version: version of GuC log format of buffer
> +	 */
> +	u32		log_events_format_version;
> +	/**
> +	 * @log_format_buf: If `log_format_version` =3D=3D 1, array of
> +	 * guc_log_format_version_1_t. If `log_format_version` =3D=3D 2, array
> +	 * of guc_log_format_version_2_t. Dword size determined by
> +	 * guc_logfile_lfd_t.`desc_dw_size` - 1
> +	 */
> +	u32		log_format_buf[];
> +} __packed;
> +
> +/**
> + * struct guc_lfd_data_os_id_t - OS Version Information.
> + * This is mandatory host LFD data
> + */
> +struct guc_lfd_data_os_id_t {
> +	/**
> +	 * @os_id: enum values to identify the OS brand (1=3DWindows,
> +	 * 2=3DLinux, etc..). See guc_lfd_os_type_t for the range of types
> +	 */
> +	u32		os_id;
> +	/**
> +	 * @build_version: ASCII string containing OS build version
> +	 * information based on os_id. String is padded with null
> +	 * characters to ensure its DWORD aligned. Dword size determined
> +	 * by guc_logfile_lfd_t.`desc_dw_size` - 1
> +	 */
> +	char		build_version[];
> +} __packed;
> +
> +/**
> + * struct guc_logfile_t - GuC Log Streaming-LFD-File Format.
> + * This structure encapsulates the layout of the guc-log-file format
> + */
> +struct guc_logfile_t {
> +	/**
> +	 * @magic: A magic number set by producer of a GuC log file to
> +	 * identify that file is a valid guc-log-file containing a stream
> +	 * of LFDs: Expected value: 0x8086AAAA474C5346.
> +	 */
> +	u64		magic;
> +	/**
> +	 * @version: Version of this file format layout as per
> +	 * guc_logfile_fmt_ver_t
> +	 */
> +	struct guc_logfile_fmt_ver_t	version;
> +	/**
> +	 * @lfd_stream: A stream of one or more guc_logfile_lfd_t LFD data
> +	 */
> +	struct guc_logfile_lfd_t	lfd_stream;
> +} __packed;
> +
> +/**
> + * struct guc_lfd_data_fw_version_t - GuC FW Version.
> + * This is mandatory fw LFD data
> + */
> +struct guc_lfd_data_fw_version_t {
> +	/**
> +	 * @guc_sw_version: The full version of the GuC microkernel that
> +	 * generated the logs as described in
> +	 * GUC_LOG_LIC_TYPE_GUC_SW_VERSION.
> +	 */
> +	struct guc_sw_version_t	guc_sw_version;
> +} __packed;
> +
> +#endif
> --=20
> 2.34.1
>=20
>=20

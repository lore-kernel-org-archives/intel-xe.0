Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2354CD4857
	for <intel-xe@archiver.kernel.org>; Wed,  4 Sep 2024 16:46:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD5ED10E3FF;
	Wed,  4 Sep 2024 16:46:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lcq52fFI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 863F710E3FF
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Sep 2024 16:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725468370; x=1757004370;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=04s/wuElzCVVFfibe840yNX3BCVqGMiqGLh6PoU5rzI=;
 b=Lcq52fFIJUk9d6avbhvil2ob6lcFipZWkFwRQ/gPs+oZ7zdi7xTxnhi7
 8S9keTxXNh7+xGY11MMG09gLhyQI/qxcMXZCcj8kEWdJuSv0a/HszCTLA
 Y7/tCFUv2iGXHXO0uGD/hd4a/ieqLJ9W+j9RFYcwNx+2KUKL+KSEbtNKB
 46CcPw4UHjVzPo3Ai2Qj+8dzCwKi0tn9nad0CRAgwxUgCmd+sVzFY88gw
 on+49q2T+sLlccDKj/6rWOAK+s98wSQeRtZEY3B7DVEs6QRWm12X73Go8
 jxNzQJydlByIhoL4aDqRWY3oqUFY2P2fv+npEZ6UkwL6k4QpHNPzs99Bt w==;
X-CSE-ConnectionGUID: fdwFf9aLTa2jOsfWEK5/4A==
X-CSE-MsgGUID: 1hPO36BCQBaYVnzrLSDhSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="34743901"
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; d="scan'208";a="34743901"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 09:46:04 -0700
X-CSE-ConnectionGUID: ZHq9CpEjSEyB7HR8v4gFwQ==
X-CSE-MsgGUID: jkjjPLooQk2CL1PEph6ybg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; d="scan'208";a="70222260"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Sep 2024 09:46:04 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Sep 2024 09:46:03 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Sep 2024 09:46:03 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 4 Sep 2024 09:46:03 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 4 Sep 2024 09:46:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LNC+JD5mz+zPQR3FOjFf/yEi0ek2XVQ+8ptFSQF+PH8onxmGDUh0s0g+5Mg3LIG40/aHW13o3aa7lKYVsDTYDbX+KGv9AWoA2rUjF+aW6fy7Nnyq0BvtE+3oS6wWW/jLJltaMhZKmWjyvaSoA3/CpTrEAl2i0P7hR74BiFAIW1CrObKehm8e3WZZlh6Yl511D/NzVZJQ3Zgx7r3FFEZK1ECB8qR1WmXR2UNW8e1Nc9RcHK45y7WxoXrDIXJjAfk825wHBVcabOmqZOH3qAI5XBQaY81ObbEUVNoxfqUP+w6voYCn2DbrvfHgAjktrsur2HWgjBDr1ZZX3ntZqtr7WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lKOp7jrGtPEcO4OXsYS7vb95DEBs1USna+GbpHHvaz4=;
 b=bg3Bc8w+XpTIs8uOqFrAmZ9OU3FHVCK+bj2QWNaxqnIXsx+0n4XXh6G4iWZAW/l940b2PyxdD/iGaYGQIgwbw0g2wmZlJe18K3X0hc06q4Ds3zYUGAg4BuPDEqRTgrVmfLv3oBn+S5G3yM+HgYmMT9wy30HdnkjJTu9T8TYFopvRQbZmg5BK9zTMR/WG/+8kKe/9a+sovgwSfsveWQ7V4e1CQHVSU7f7teU9Aa+JoqMqWkj3WdXHtdq3bXaL4/AtuGoE0ZUkBNv4eNDfAhVEKPBJSgkJM3ARrS9XrzEHu/gHC1dKtenLVv9psQ1rIunCg4TFnBELwLseC30eRmFMDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH8PR11MB7968.namprd11.prod.outlook.com (2603:10b6:510:25f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Wed, 4 Sep
 2024 16:46:00 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 16:46:00 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
Subject: RE: [PATCH 1/2] drm/xe: Cleanup has_flat_ccs handling
Thread-Topic: [PATCH 1/2] drm/xe: Cleanup has_flat_ccs handling
Thread-Index: AQHa/ubHuZXwAdpr70+f5YJE2hvjO7JH1dCQ
Date: Wed, 4 Sep 2024 16:46:00 +0000
Message-ID: <CH0PR11MB5444810A98F968EA05100953E59C2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240904162238.2831202-1-lucas.demarchi@intel.com>
In-Reply-To: <20240904162238.2831202-1-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH8PR11MB7968:EE_
x-ms-office365-filtering-correlation-id: 35ca9d0a-7dcb-4c4d-29fb-08dccd010e9c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?2Pq52qQP+fuPHXck4gU+TfgXp886OQwav6gIo4+beDDA7UAhm/JQH01LLrG2?=
 =?us-ascii?Q?zmle6qNFJBimuEZsiL7HA3pxpea4O90A+osPSlIXyaMhETno4jhufT+3t6Ux?=
 =?us-ascii?Q?34wpoTAwYZI1PiCh2DQemy7NuI771gNF5iMfhSnt2uTcfLY+y3PtW98RpdJs?=
 =?us-ascii?Q?ReKt5/CwKXVYxuAd3/TQh1Gqw5UgFq5OlObT/2A4XruPC+MOpZaG3RzDgdW8?=
 =?us-ascii?Q?sTUgZ9tlLUht2N2xw5m5IXMZ0zItr005X76SvBTjwic0dG41q0A4UcFKywi5?=
 =?us-ascii?Q?gjrwRaC9HwUpbUEldQMB3PjnIa78OfZsJCgY6K7fo5CR+1wdhQXLp5/SgF6O?=
 =?us-ascii?Q?nJZoZirq0X+yWf3y9PvpKml5yq909Iu/SNI9LMSkb44H8XpiorEe0Q3OzfnQ?=
 =?us-ascii?Q?rtP2NqHQh4p30mGqNvzkI1TkurdG/N4A3YqsyCBfgq1W9uF9dpeY0MltWNXw?=
 =?us-ascii?Q?C8h8Ri+OfqcPEK91fmmcDmcrkNZrG5KFMhWFcPXPkUhS5bzZTxioS0TdQtY2?=
 =?us-ascii?Q?WNXUYEUrlP48WgbF1WqYf9FFGEr71K8Aw60n5GQCWOxVSfMe2dk/lRXHTb4V?=
 =?us-ascii?Q?q+gKdtLH5ikqltC1mWJ+f5IiOYSH6IcqVW9hoSlCQr/qwf/U6RDNzMnlFLRg?=
 =?us-ascii?Q?GeoIlxeGH6YHRUGnfQhpO2j/W/CdUoRLttOaTpuftBaqLO/zwRnYMC3UyZM/?=
 =?us-ascii?Q?VgaF6MJKaCxkMIz4U1JM5mFG5GyDCMudxkxEbm8tTr9tiU9Y8525bLCvUnwy?=
 =?us-ascii?Q?+vu6+Oh9Ez1VVye81gmShYvDBeGXdzB2tlhO2/p8s3pwpjpnPGsowWI1gmM+?=
 =?us-ascii?Q?IP+SaQrJVjoHW6JPTdxgVGxGL5eLgfCwXKUjJc0nhzx6KN1HbZ9YsjrVFdWi?=
 =?us-ascii?Q?JFpJPaVIj4HmI3gMPNAMBGHXIEydUkC+AXCkxPBrk+DA/LarFRjRRt30WxvT?=
 =?us-ascii?Q?3xEaIJdl/dDQUHaj5Tkhg0UdWQYUHCaQtsEANudU/Ycgi6T+wn/iU2UE9d9e?=
 =?us-ascii?Q?Od1DVG0j78uND255CQM+oeC34CblSER7q0DxMo8Hm5BSybEFV6bn46H/TF34?=
 =?us-ascii?Q?mScnPOjZCCnKxzRCvWLH//ZUQ0+Seym9kNnl9iBykW5udXM9kFU6O3CF18q5?=
 =?us-ascii?Q?ntaS6mVm+saRNSP1KqpPH7t+6pMYFmK2tjNdrTUUR/PT+1e+AoDp3AR2S3ve?=
 =?us-ascii?Q?zZrk9UIX4mSxZVeJOPE9NTccZenEqxSHj6wBFKkQwRKx+gMSvB6j7Ma2IN7/?=
 =?us-ascii?Q?rtsanrTNoRhCgaWG42vFqV82u/cD/MVX5/TE5JqDKE2k/ps8BuV5JCc53a/N?=
 =?us-ascii?Q?XlTEkHG0uRmzeNAnZISUe8GSjp+e/JXq+zBnLV8Dc7KWBSx3detm+ZEfdXtx?=
 =?us-ascii?Q?1o2SdyrZvZ0IosMOVlDZZsSZqx/SQi4RGZx7HpgvmcTVwXZFcQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kKLJlP9ZSYNyGtC98J0AvgJk9sy5gBDZ/ucdfsyd2aEt4ptAbEPRDxSfemvc?=
 =?us-ascii?Q?8EkvPvzjArn2RhdNpPssh2hmQ/pmRb0J+kOLqmEN3Dy5UGybmrP25FEvmCzU?=
 =?us-ascii?Q?p90MkLqAh/z+7oYZOyJDW5B3OCDs8QIrHYpZlmJz1uSdF+E83l5BjOceK+Ln?=
 =?us-ascii?Q?qTfCRPxlHbkVwbrLZJk61zDTeJ0U4liCgnZ+v/cyEKcn+dh2/BgJlIqz3J6J?=
 =?us-ascii?Q?PH4zzPExvrtGKwbyNBT/S+tUrQ5NyVJXYYxgkelnpY/lm6uV+uYvIPVh32HI?=
 =?us-ascii?Q?UnGcCzMBY6G0VtepWZPf6N6HsFZvLcc8fKcUHwabRpeO10MwrNue2pIsJ9uI?=
 =?us-ascii?Q?q1nr5k5csFjHxKmjTSTKhmoH0lS0EcWi3qc5xByOLHuq3vHZApWI3IEk78Ai?=
 =?us-ascii?Q?7uX057WiU+8TZMYFuOQ2QrsMsWVIZhs29JS4Mbt5Xu+hBKvkBUWqPLc450I8?=
 =?us-ascii?Q?QWwo3IoxydU2hgr9R4m+Z9v/NPiM/ftlujqGpO3TZ9RrjI9E6++5Vm0gWOtl?=
 =?us-ascii?Q?udXCeVacms1Hxv0InFTsAhNESrhLq1cZNqUIXkRsvwPUTr3LlBh/gn4Uailw?=
 =?us-ascii?Q?kEdnf9uXnv/RLqhaP75J1DEFx4CDpbcff7jvo+cFnDxYcd7BIB7FR1mmCvR8?=
 =?us-ascii?Q?GB5a/GSQDnY1MHw2GrTY6EXXTT7xN3obGlewk3pkPeS+WJf1UOJQipIXdJ9A?=
 =?us-ascii?Q?Q5hDBpml+L/EKcUNB8YoGUTQzHc5X4lWxJtw4zRnRAhHa6reDthA2xCllpO+?=
 =?us-ascii?Q?WH4+dvrmuoGfuTkoLNFbN9ozIATgByYHZ8EPnsoPQOU8xVBOKOesKzPWudQM?=
 =?us-ascii?Q?pJs1JicGv4McG8syNAeEA+EtFPYZo6luVzqnY/rH/JxJlWrEzXYPUtMMjROM?=
 =?us-ascii?Q?fZEmuHu6hpYR51z18t5HXWfkUGDSEfTI8Br9X0OyNtZiNeXTfUXB4casFpj0?=
 =?us-ascii?Q?SbMKCqt/HCyKK48X9lLRDcT5BMX4aAD/1WICDVPyf6TB1q2F0BlQmJ+D2jfI?=
 =?us-ascii?Q?vqMhjLIkGeTk7TCv8T3MOZAiNO3t3+bBfbnmwJbyHFReQe1IsBVXa6pPq6RY?=
 =?us-ascii?Q?Y19kkbmE/J2x8beJ9q3p+5ntF15I7Wn5etcacldGHKQmI5wv5HeqD0bXdip1?=
 =?us-ascii?Q?SABPk3v9MhUtit7LcnL6UUAN2VSbycu4gXIITc3AdF++/4CgeubPceZh8y61?=
 =?us-ascii?Q?H6woagoXVCHkX9mgjC+8h09yrGHJQhOTHZOdwkjVkCT10JXdCLXiISd62p8b?=
 =?us-ascii?Q?NScWZHdzTcPaTn/x+9n9yXPlxvybmGfC0cqKbdBVqaYQBjbwDOmWgC2UUuky?=
 =?us-ascii?Q?ElVUy2yy+pyi7OXXikoGSzIalPyI0hWkrnASUdTUNrBi7AUn4eTggJKx7pHB?=
 =?us-ascii?Q?tT2uKGLHp+7Ef3Y2VEcJSAJdVITKwZlbWZucJKvYQOYYV56vNkDcKGUt3vmF?=
 =?us-ascii?Q?x4Ra93YMv4NKPtBhXUhUiZz/V5V6SIVGDtdSbD0HGjhW0foRv765EU9uca/m?=
 =?us-ascii?Q?ok5Ib5FYIMHcsAoKIxjhZMDnbpNTtO76v+2NnIDcpmH2M2r3B75XJ1+Wh1sW?=
 =?us-ascii?Q?ThB7EWdGdgvqzCmcqkzOALa36hN+8FJ17h0Sjsgm?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35ca9d0a-7dcb-4c4d-29fb-08dccd010e9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2024 16:46:00.3390 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P0Wod4TXddh1dAd8tXDih8gRmEGQtSMxfO8F4zycpdR9qTaOw7GECwdiU53v7D0HmsBBt6Fo5GHMiDNGsnape2SBJodDvi1kH3iDzgprRLI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7968
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Lucas =
De Marchi
Sent: Wednesday, September 4, 2024 9:23 AM
To: intel-xe@lists.freedesktop.org
Cc: De Marchi, Lucas <lucas.demarchi@intel.com>; Ghimiray, Himal Prasad <hi=
mal.prasad.ghimiray@intel.com>; Roper, Matthew D <matthew.d.roper@intel.com=
>
Subject: [PATCH 1/2] drm/xe: Cleanup has_flat_ccs handling
>=20
> The flag is set in XE_HP_FEATURES, but then overridden in all but one
> xe_graphics_desc. Make it set only where needed.
>=20
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

LGTM.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_pci.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 7eb00a87b786..8642c079bc65 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -103,7 +103,6 @@ static const struct xe_graphics_desc graphics_xelpp =
=3D {
> =20
>  #define XE_HP_FEATURES \
>  	.has_range_tlb_invalidation =3D true, \
> -	.has_flat_ccs =3D true, \
>  	.dma_mask_size =3D 46, \
>  	.va_bits =3D 48, \
>  	.vm_max_level =3D 3
> @@ -120,6 +119,8 @@ static const struct xe_graphics_desc graphics_xehpg =
=3D {
> =20
>  	XE_HP_FEATURES,
>  	.vram_flags =3D XE_VRAM_FLAGS_NEED64K,
> +
> +	.has_flat_ccs =3D 1,
>  };
> =20
>  static const struct xe_graphics_desc graphics_xehpc =3D {
> @@ -145,7 +146,6 @@ static const struct xe_graphics_desc graphics_xehpc =
=3D {
> =20
>  	.has_asid =3D 1,
>  	.has_atomic_enable_pte_bit =3D 1,
> -	.has_flat_ccs =3D 0,
>  	.has_usm =3D 1,
>  };
> =20
> @@ -156,7 +156,6 @@ static const struct xe_graphics_desc graphics_xelpg =
=3D {
>  		BIT(XE_HW_ENGINE_CCS0),
> =20
>  	XE_HP_FEATURES,
> -	.has_flat_ccs =3D 0,
>  };
> =20
>  #define XE2_GFX_FEATURES \
> --=20
> 2.43.0
>=20
>=20

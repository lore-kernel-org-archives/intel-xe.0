Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99289CAC5AE
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 05:50:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54D7410E325;
	Fri, 26 Sep 2025 05:50:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jtZur2gV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9974C10E325
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Sep 2025 05:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758865822; x=1790401822;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DXIHl8ImndqBohaM8njNYjqEwTCQhjtTlQrIh2my/Bk=;
 b=jtZur2gVxuVPNc+hoZnsXlVKrI7GWAooxi2lrX/K/Ux0VIJR1SpFImUh
 DbRvzv+ogfqPVbHIWQ2zldn9bY+aX4lsnIfPKzL1Nce86UZQMHKPkvYoY
 grbjr0slosok5sSvICiwI15JIaXAQ4sbGqVlbKKMMWIKuO8KXMqnSRZS1
 ijbR8c/XZyYefgwvTqcd3d7/7n4ySYI/iFgQRIISH3Bahv64K8ZmHst3M
 sHIaHJsfWjkd2LmKCtZISUNrALj2hsuM3QE6PEh3k7oj6k2i0/K89zRH/
 CVTyHCv7cz3IjrVaRsECcmwmHtxfncZHowTM0j5oIoLz9dycSj3SvQCXq A==;
X-CSE-ConnectionGUID: iYj014xVQhitcCujzH6bZA==
X-CSE-MsgGUID: Dhk4XQgyT5KKo5PHYZwp6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="72293650"
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="72293650"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 22:50:22 -0700
X-CSE-ConnectionGUID: oceLnexHSl+FSmKWnUXheQ==
X-CSE-MsgGUID: jRgC+Ca0TSGEpI1EDP4T8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="182678639"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 22:50:22 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 25 Sep 2025 22:50:20 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 25 Sep 2025 22:50:20 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.19) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 25 Sep 2025 22:50:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H0OvHYVDhfxujYmQd9rOJSB6ELiSRotMEhiemlmcKFrcsRmXnJy3iYGxkgw0TeW6Tut2Hu1MGtRivBjhXWPoSHH+uhhA82tYPQfmPQ+gZU07+VJjecpYxeO9R/Bl+FuQ08TKg9QBRL1Ne2MR2/ipoy5hah/JEMoIKkE6Yv9qAIeEsVhdS79V8GUHvbAPZXZJ7rFH7KS3xCdgu9Nm9WhoUH3pzvC0GjzYaa3oiItFnaNse8w+A8Ufh6kVkBx4eAitOh2NEsG9Zo58PdQPTLnl7O1fV3atCa48xgBIZKbZMJDtllk9DmEjwVdmtfG0Sl2LZqGJr/mzCuoQouu3yIC+aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9IjnRbmt8VctHRIcj4dIcKvMP5ayc2ijNB8a1McUT18=;
 b=MAoSmTQvIvEoOS1JAZu40bLtCCcf/dFDZrzS0gBqwHUlyoPdw6TGadtuMVlsluFbpF92WTXaGGSP6nY2nzs2lMgddP/pAhp0wmEgjgJQ+dXFWV8Eou8Xt8FKD62I0URQ1E6HVppd7rffv2mFonkiGnmoUF40QYe1Zruv3SYpB8WMFVwTNbCa3e1m0zZdc7WsexBgDJi70zegrHIPbCBuKXmdPSddgnDzIl0LAysu5nfg5xpKVA1PTNlPBZvZXLaCs4NE1DJa3lJzRlquQKdBncNGEzXuS1VkKrac+6g1/XsD+Bb8gHbSXEzWWk5/7mlrCoEhOKzRBlsNKD96NMBg6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SJ0PR11MB5771.namprd11.prod.outlook.com (2603:10b6:a03:424::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Fri, 26 Sep
 2025 05:50:18 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.9160.008; Fri, 26 Sep 2025
 05:50:18 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH v2 08/22] drm/xe: Skip L2 / TDF cache flushes if primary
 GT is disabled
Thread-Topic: [PATCH v2 08/22] drm/xe: Skip L2 / TDF cache flushes if primary
 GT is disabled
Thread-Index: AQHcLna4YtohRulY80CFQI9utytB2bSk9YQQ
Date: Fri, 26 Sep 2025 05:50:18 +0000
Message-ID: <SJ1PR11MB6204A152184AE9D2C4A0C5D2811EA@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250925234628.2112163-24-matthew.d.roper@intel.com>
 <20250925234628.2112163-32-matthew.d.roper@intel.com>
In-Reply-To: <20250925234628.2112163-32-matthew.d.roper@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SJ0PR11MB5771:EE_
x-ms-office365-filtering-correlation-id: b32cd594-20c7-4ee4-ffc3-08ddfcc092b2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?JVFrjDuCZNdhzQpqzXCkAf9PSocaCGpAZjMpZTCmSUhjtom/481lwDot7oAr?=
 =?us-ascii?Q?JVeHuDxv6xgUFPDFgE0/6/No5adJZiZgabqJs5pn2cyVkm+07ZTEPSk17AqA?=
 =?us-ascii?Q?FHNVq54cTN3TsAFgawmOZrNhz6K4wOxPNq/Na21eE302zMpCdNPQVAQ8niQc?=
 =?us-ascii?Q?Su8jjmWHYtO3DVbRQ3iKzNLF1IUJd0PPh7smHteJlFcz9SsImjrZimQxBMCc?=
 =?us-ascii?Q?O/spOiDbs/j3sPRoBf+oCYSvmGU6H2O5lLoJUZ+royl5qWH7d0hircJItmDA?=
 =?us-ascii?Q?N/dE1TQPB1yjrvhfqZ4j/i2tdhiOoUIwejVDW4wOCM5QHOJfs52sFUC+l1Db?=
 =?us-ascii?Q?jzlswe18ovNTC0GMUNhjC02M9ZzaarWDI/coPVL3fdTGAlUfnJqGX8ffyQre?=
 =?us-ascii?Q?uINlNHu3UDIWK/ycRHAerqnvZfGVqGNo8JC1Az8IRH+8yKEY/8YLsxWE38/2?=
 =?us-ascii?Q?u7ehdtrxW+nNev+lGaGjtaMyXyMRmxXjCId5LEu9ddqbl4/KKIBX91KHqAUl?=
 =?us-ascii?Q?cSfewGBPbeAGWWG/SSJh417dOWMcZNHNFXdJCSA7LpxowVeuK0SrohCRPXVD?=
 =?us-ascii?Q?k26oSsb5J4AcleOnJQMJcu1XWJZje60vLOL3uJdP0JzgpKbRfyRsWE+0WTnj?=
 =?us-ascii?Q?TLMfOdNz10xjBQs3Owtfse7jpZMl9Je9ixYho6sDla/8mHDeZin498MjXRg8?=
 =?us-ascii?Q?DwyXRw/cKsmXdwv/PkFs2cjAwuChqfhxHM5dzBPa2Un5XeSI6wso3HkuQiKN?=
 =?us-ascii?Q?1NnXEme3jO/kqhIR88OAzhUL7pRiXMM0+UXIcG2WX0Jt1q95ARzRCLxc6IGc?=
 =?us-ascii?Q?Z2MfaXje/s4Y0jVXiG5G393XUF+zefzZKDpBHKUOjDZ9id/ff9JF99k/SMBb?=
 =?us-ascii?Q?R1eDodaz6nKLofaWV7huuEqpU/R322uJ5E8L15NzfXPWgtnA1AWT7rHQaRxb?=
 =?us-ascii?Q?aYfhShb0AhQ2+x8ZVPVLlPu4bmpihKSaEtzhL+BtIf0KyctpfVilpDlyLjIq?=
 =?us-ascii?Q?FPG0nimTNl6pQdz1Nivqc0rV7Z01fryc4p7I4EyRoFFJDmu90R3GXGai/EPR?=
 =?us-ascii?Q?xY5DOp5Oc7q6YKN2Hc2BdOQjcRi/sCOXUx6dZ66wJHSCH05uhDIaBT+ohCJi?=
 =?us-ascii?Q?Kjsltb/DXMyETjeZTKMu5MLThnCHyCzU4ur2ECfDRwowThnW1f4bwDeekFpu?=
 =?us-ascii?Q?emeXKVnceCJTtr0rBsnM6X+p8b+hChmL+6I+f/KRVbZzQCNKSNmDJNul2KZ5?=
 =?us-ascii?Q?HogHqZk+QnUpDh4yiFTKE1WuL+DR1a/e84wbExDAfmDwpd0EUf8Kg+n7s5gF?=
 =?us-ascii?Q?npH9qze3Jtq70bB9OrDlob3ei4hsSptCGB49I0fyAIFcai/Tii08RIEwbj66?=
 =?us-ascii?Q?tvyUSoJ2AEycVQF2rd+qArSjS9oDps7vy7JZt3F8naO1woBrA1z1fZWJQ24P?=
 =?us-ascii?Q?AwSjQFrS4IjpwHlm8EqGZ/WbWm0cvejxsmGwiOd4AAJCf9yFbVr3ZRVQo+bi?=
 =?us-ascii?Q?e/6YCR3qiRM/zWbhnFgdtgWrqOGFCvYOcVWj?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/ssW/iWURAUB9ybJLmlZAgShakEPK6Modt14kX+1YxDLuD9wqZdMnOei78zi?=
 =?us-ascii?Q?gy09tr9ngfk0SXMhgpP0CJanSpWHV1CGMohQ/TBH7zA2IHJOK2t3guFZ1m6k?=
 =?us-ascii?Q?nB2romPjUS20LYwpwIBa/KTURY7V+TCGk9GA1/EHgeosAWei8EVAdcUdwwHQ?=
 =?us-ascii?Q?19wLBx0D0Q5+9x3ZAMZHJMb7I1P0BuSiD0kw0dT0FRimsGpa14wj4neJ635D?=
 =?us-ascii?Q?EToJuX9KDXJF9bgO795kIEfJCeT7e90c+WGJe+UicgFwyNg6Z9M/gzrqE8FV?=
 =?us-ascii?Q?QdAZR8XDOPkDNiL1Q9esmBrScc0KzneWpPNRrVs+lh3zTglALrbNFdKKDJGo?=
 =?us-ascii?Q?i5ZD6r/ER3EHe/AduchgRHFvhMsdK/yWJQYxIwfK+xNe45DvlMis/4vbT0oa?=
 =?us-ascii?Q?NEChkHgQFLSVH0uPgOGUhnB5wxg33K5fiEg4jFeDaGeJEN+VpvyrDr9ZCT9I?=
 =?us-ascii?Q?C2M/9z1kkwlibu16ZTqJnnDI6Z0tCkIIBuMNmOVNpfAtI65mfvIpKtLvEGpW?=
 =?us-ascii?Q?byUx6XpaU22t/fwenjUAdI9wgeiouWh3Qq/jUXe0fi7Qe/OJlMSqK8waiMUM?=
 =?us-ascii?Q?zj6B34q1bU0ZaivpkPYRNdncDm1NwDbmNFIBAm83vT8Sbd4MWrK+hFE4zT38?=
 =?us-ascii?Q?e/rUWA12D64HjCPLXzu8YU6Gunsl3AiUzVBxCfNVIDpyIsmXuA4FdjXD98LH?=
 =?us-ascii?Q?gWNtYlNI5Ar4eOJdweXmO9m4Y9+lJAEq6/OajQ6JAjooEdJeoayC4Kvx8iSZ?=
 =?us-ascii?Q?1Hx3j3og8KreLHXj3uBHOHCkpYVkRFnBTACpH4ZF2t/QCyOhAhzDnTvOSogh?=
 =?us-ascii?Q?ncjzMHoqHHRHjxU8iLEEbvdpw+Fx0kOgo7oJBHbQExPG6drvC2RHCiz2gVi5?=
 =?us-ascii?Q?ZLtjCuz87j9PKccbWf4TShtsPsT8PmXFgYgAnqe4VPT8rITDcazi49g6q9f9?=
 =?us-ascii?Q?B30NFz6sRYelPngbWh/+sbAfO8N19R4PzLP15Kznt/IVI1r7KitbZLXBJbMx?=
 =?us-ascii?Q?tGllGsj7tUTxcjb/qJMa+II3GRJhIrZFHg9N/u6m+ABospp0JwSNkcDDSHil?=
 =?us-ascii?Q?tR47Zp3p7dqgm7vYKIN63skM9qvn1MO1R1uBJlXYENjaRNtmCjff1bgAzfdE?=
 =?us-ascii?Q?QnYojVzaEqBq9uq2I6dORFGDkzJRaLzqmWO40ehuL224kY4USCzxcNBfiRnq?=
 =?us-ascii?Q?veR2aEr1QWYwhn+BUzW7u622oB3g0MW/WUdXyRxcTVJNjgf3hHlMr4n0oyVz?=
 =?us-ascii?Q?36gLm4OTACNH2cmBXgzYfREKoyWuZRfQ7xMtQpSveawV0GxoBCvCyk1JIPWR?=
 =?us-ascii?Q?tAECmdETQgqlOTYx6MnhpsdhbdUAG45cUXVKuu429+Sb3PF4Rqw5MBin9eGQ?=
 =?us-ascii?Q?Sx1oca5kcI19CcACmh7+WjW1elJl1DNYu0UUEHU6+2+Y0ARiTRHsDlzmlu1Q?=
 =?us-ascii?Q?WZ3Ldp4Mye+ScairMmIQcYs2b9vu6NbWiMKMji0rHfO6SUYK4F9LGViAdXYh?=
 =?us-ascii?Q?HS5EySEgWXFSpbL2AJsLtImTQHn1oW50jajUXAIoCWkvSRR1mzvmDlwg69RZ?=
 =?us-ascii?Q?XQ88xUMwoiwy9Q5p5DUCaqX06wlRikXy3VvY4z3S?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b32cd594-20c7-4ee4-ffc3-08ddfcc092b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2025 05:50:18.1329 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wbgyxVMR3xY8EDsTPBSdNmtJhL3UHZj97qKsQLjm2h0YOT9lj3aZw5A0MoJrFD7I7sAaZLnNMNXasaPBi4AaM2D019rw4pCQ5Tl3qtqZN80=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5771
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matt
> Roper
> Sent: 26 September 2025 05:17
> To: intel-xe@lists.freedesktop.org
> Cc: Roper, Matthew D <matthew.d.roper@intel.com>
> Subject: [PATCH v2 08/22] drm/xe: Skip L2 / TDF cache flushes if primary =
GT is
> disabled
>=20
> If the primary GT is disabled via configfs, GT-side L2 and TD cache flush=
es are
> unnecessary since nothing is using/filling these caches.

Is it because PPC/render engine is on primary GT only? And its going to be =
same way always!

Tejas
>=20
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 09f8a66c9728..bf99792e772c 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1061,6 +1061,8 @@ void xe_device_l2_flush(struct xe_device *xe)
>  	unsigned int fw_ref;
>=20
>  	gt =3D xe_root_mmio_gt(xe);
> +	if (!gt)
> +		return;
>=20
>  	if (!XE_GT_WA(gt, 16023588340))
>  		return;
> @@ -1106,6 +1108,9 @@ void xe_device_td_flush(struct xe_device *xe)
>  		return;
>=20
>  	root_gt =3D xe_root_mmio_gt(xe);
> +	if (!root_gt)
> +		return;
> +
>  	if (XE_GT_WA(root_gt, 16023588340)) {
>  		/* A transient flush is not sufficient: flush the L2 */
>  		xe_device_l2_flush(xe);
> --
> 2.51.0


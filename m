Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 580F5C35FFC
	for <intel-xe@archiver.kernel.org>; Tue, 25 Mar 2025 10:06:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1713510E392;
	Tue, 25 Mar 2025 10:06:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gx0qKo29";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B9B510E392
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Mar 2025 10:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742897168; x=1774433168;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bN2/rloXfmdET7U7iAoLd2gUk2iGS+P4XeEsxmlAuyo=;
 b=gx0qKo29cFav3yqrajgoBqfGHblB9CL9/fIZEIRwpI9sWEfEzJkT/AYT
 NihX3nkwsd2v9bYZrn14kpVtrqURZyZz/qGndAgtDdLFjv5ENuI56NIUU
 Qgv1sawXz1/N8ZUPWHn9PSx0K9gr1ZdADOq3eDr6YKM5FfqbPEljssYgA
 oMl/MuzN+rXUw5V/E0VbysOLmfdu0VV8O0bjjqxEuPgLEbfykFwRJsRVc
 473Xpa1qe09LzjNqq/ktJy8b//YU0alfWXOoSdJz6drtF2ZZ1jd4dG1iQ
 817cDwEG3ocFSxvqPBKwXLBgze7VQ4V7iomH9J5V+BCwB95F0TDD2SM1l A==;
X-CSE-ConnectionGUID: 0IqKw2RPTGKCSe6jSJ66dw==
X-CSE-MsgGUID: gRStyF05SlKwn0Sf19Wh7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="47790334"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="47790334"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 03:06:08 -0700
X-CSE-ConnectionGUID: JTE5nnXWQlifD77rdbLYEA==
X-CSE-MsgGUID: 7G63Iyo0SMKVcsQ4nv2oIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="161540581"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2025 03:06:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 25 Mar 2025 03:06:06 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Mar 2025 03:06:06 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Mar 2025 03:06:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sapeqme6x14/lD1qbyX/bM4/gCquZRamChTBDA8QtVvGrw4qzw3McpigRRF8UWFpJYSIdBZLKjaWyzx/wlkvAtS/aKlPleSeVT+JpVE/gQyOChSAlr61psjr3MNr9GAmo2JRI8cE8Zm0lrIxX2P7lKL0PsaJoP+k6qM4KB2LEsyzfnidJYo//jV4FO0YhML79xajyaGPayStwoRaJBmlE/ok9AL4z4YOhGLCf9A5HQ7FPR99w5Fyoi9VkUmh+/MBwS11J5SsdqNYKXmxgMo/A4f3LFS1cLs5S6vsW8tmoDJcIghzmCD1pNSeh3OsBFv8QCANize5C7gT88y8Ntpqzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uqaq8U55t/2HpAAf//JydQWXYEMUZE9ns2mA5coO8ro=;
 b=IT9v+3aaRWVhNgfN/pvNn0VI/2fthzrNpNJSLk44e4BaoHrHjI8GlYiMiYsuRgrIjbfMVOYW+qk6BuTiR7fc11LNsZuEDlL7hvCE5suZSKn9zTsZ52I5z9poUmFbqVB0AgZ2PHyFHB5nD/HYYyVKilnAzZ8+44IhPbGqp3YmVXGJ+LWYxCO4xMdT4VMuxbAPdgnT2gjbashWiGVo8ClxBjmFbN2DxGPdYhcl9cDeQzR5XI1ltal4yPy7+R8P69zCntuuXCfPxrtB8KcGB7N4CySjxQ6iIIFTq82VLFRmpaOrMsSSRiZnsrxXujXTidDfViWDiDFpO2Jv/8f2lEr16w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by IA1PR11MB8175.namprd11.prod.outlook.com (2603:10b6:208:44f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 10:05:37 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%6]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 10:05:36 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Filipchuk, Julia" <julia.filipchuk@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Filipchuk, Julia" <julia.filipchuk@intel.com>
Subject: RE: [PATCH] drm/xe/ptl: Apply Wa_14022293748, Wa_22019794406
Thread-Topic: [PATCH] drm/xe/ptl: Apply Wa_14022293748, Wa_22019794406
Thread-Index: AQHbnQzazoRpvxBu/0e7i0aNy29HHLODoCbQ
Date: Tue, 25 Mar 2025 10:05:36 +0000
Message-ID: <SJ1PR11MB6204E0814172411A84ACF70881A72@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250324223347.1433491-1-julia.filipchuk@intel.com>
In-Reply-To: <20250324223347.1433491-1-julia.filipchuk@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|IA1PR11MB8175:EE_
x-ms-office365-filtering-correlation-id: 0e5e3a9d-f2d4-405f-06ff-08dd6b8496ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?6vQEVnEFT9uPIkUMomR8wxpuPC1YpQU8Pt8OY9+pdXzwHbut8L7gzlVCXMKA?=
 =?us-ascii?Q?IGPNFuYrRF6Lq/+EmF+ZSzQGU27tomL9ok7rgEUzW1b3LBCukKld61OZ/qo0?=
 =?us-ascii?Q?YyA163Xy8W6E0+w9z9BVsLK7Q6MgZ/6E+h3WHEYxYo8so87h50EqoeEfBBGr?=
 =?us-ascii?Q?6PtrrFmt4c71M1+Kb5aMh603V5W4GWUXt7Wtke+f+qZ3XsUzJg5w/RuXS+t7?=
 =?us-ascii?Q?6mR0JcCqkmsxRJ4mq6WMVc9ciXFpR+y5LD+rCno6VaKRNciqEsbmH9CvkYOy?=
 =?us-ascii?Q?JiwW2Cy/hI9Sy0Euz3kEoF+b9bhNUroeYH+whs3sbTBtMeDGVWSzH2xOeQEw?=
 =?us-ascii?Q?JCujupkKJ+cCczsp4tikbv4KjIYIIEZqcyCgZ3bmSr/SQUMIrTVWmLdaGmvF?=
 =?us-ascii?Q?XS6otlDlL2XfZEq4HihOsvDS1YYnczLgwbzzrzxAJupqLVxz4FwHOx2CAp8+?=
 =?us-ascii?Q?e2YHsi4xO9H6gc+cQKhGnafBD+tH/DCEK7tZu4jDRgzcgItUkC3PUa/87eFR?=
 =?us-ascii?Q?2gyTpf/MFYZTA7SDKTldET0wKm/bpPVPFUFW69Zr/L6UHi4djaySteLuao+U?=
 =?us-ascii?Q?cH4tYs+/ZuPUhKmBEAq0Jkp3+gRuwxVcZELiWIFY0d7WwTyRaLuGbtecL80Y?=
 =?us-ascii?Q?IgkmnM6z189O95WETJ2AZZlaCepOHrOsZMLzPYloxgwNYqnQKvUF8LrQ7LRr?=
 =?us-ascii?Q?wKChdRvN58JZ/uNIn0xsqBQhVgFJdo443+8mYPKrlX4tG3R6xDCcwBfW5Jjs?=
 =?us-ascii?Q?eRAHyf8cMKGD+agj1DyG/Hkq0V1sJQrVHnNu8VbGwKIeyp0a1AwL9JZ9GAbX?=
 =?us-ascii?Q?DJCQZWcRotbhnKFNXnhaDYSbZ1Pvg9CjUL3gt4hcWJA3vsxNqOt4AdG0dhf8?=
 =?us-ascii?Q?jYls+BevrMxgVMMOwquSfBs97kDC3UIBgt2tyo9UDKyDWSwy8mIEE5PSfc8e?=
 =?us-ascii?Q?oG0IW6GrmRciy1MlGDDMrWhr8PvRtMUZI8zStGWDdEhRRNgMgjN/nQN/RgVQ?=
 =?us-ascii?Q?iffWtfbFinxRYZ8JfMjljF5VOnmLjpvtQiOd7e47BBneXd86yIRH0hYZfZAR?=
 =?us-ascii?Q?AhA/T7xXjkR6O+rn1ZOaOSriJQulkq+KUUul/Z9qspzc0bfD8w8mNsffPHr4?=
 =?us-ascii?Q?JqvbNsN8GZ399pg2FWDaGkjOnXzd2jQTwSzL35OgNe+NignSBdTab9j14wq8?=
 =?us-ascii?Q?Q60rBIeKmijlYmgxdxquxEUl1+CVXSi6I63LKOV1lhx4qrh/Xi+OwFRbJVNX?=
 =?us-ascii?Q?CjIvh7vHsaeKul7HcF5y3PoV5ViykfkavUOxsqsYk3YND/t2MZgQCH2KME4J?=
 =?us-ascii?Q?CX0qoQULXj1VC6IGAJgich/7MV3al9cXyee/6OgWrYWLDXutiYlRGDSvvhUr?=
 =?us-ascii?Q?Do/Nhkr7nIGaVAmGe9Q8m0KfACJwmKfNAOWV1OFyHGWhMRhS2s2H7bvxOpnq?=
 =?us-ascii?Q?g057MAZGCItbpB7LaYN2Oz3gjFbtl5N8?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sJvi3d/RbywgdxtlDteJn+3meIprzm0UAk1wsqOh57dcxyprIcJGaPt6pjMd?=
 =?us-ascii?Q?v9A1Pk7lnuCIFNE4ywmIuNWZPBQemF4whg6M55azxxLKLoEnuZtzaQtoJfiu?=
 =?us-ascii?Q?Ov+hudV21MNSTAYvi9MGbelR+m/zaJHq1/ifKuzTsNgdZG+6V4IRE66mHfXv?=
 =?us-ascii?Q?vRM2JK9ZvPBI0by98Du1F/Zm3e9FZpSV4u6iV1t9no+jiSZ+ZMiyHnp5wmvN?=
 =?us-ascii?Q?CvIIdx1mhK+LcXlK6vxI1Qow7bz2l0l06WE4gSnuS7MmraBe8zuCws2u900f?=
 =?us-ascii?Q?93kag6HJTSD5v6OyRs10BlyB36X4NEDlguhCR3VWkoHIAWgqjYWSGC7PdT61?=
 =?us-ascii?Q?i3ov4rR4sw/9MmQf7PdJgrLOvlAoyf75FqCZ6laI61blfB8Pj4KGyoK+7hDf?=
 =?us-ascii?Q?IMQf2K9uTnkNwiHjzvIGYA7g/+xAYyhpAIUAIXsd9BIX3La7w8JS7K5e7k6I?=
 =?us-ascii?Q?vqqQfyqSbXe0hvf/oqxCL263JQ8dlWnZoqkYjcQM71UmRkFDzv553wmKML0I?=
 =?us-ascii?Q?ANNnI6ab9yyqgJHAFzzLmTEVLJ736dIby8ZC5nFvXxKGEpfWICpoYvSHWb5Y?=
 =?us-ascii?Q?nt1tJVtKRiCfFlnILKUI3MQtZeQKWrlwSziye/U3LFJ4EuywfCVPZQAOQSr1?=
 =?us-ascii?Q?s55+Bm5V7GogMc+HD6XL9rDTT7BLOa/xAdwqzEvl3DaROLPpDc3g06jDLZlh?=
 =?us-ascii?Q?iK5ta3atBP6F6zSbkGLD+Ahoo57t7C86r11S8Ydqe+Vxibz0j+e0YjoBT60E?=
 =?us-ascii?Q?tsEwWa8VH32RKQ+JFCz7ahH1f+zSDHnQQoaQL5i6CgedAYem6Sk/aLFDlZRy?=
 =?us-ascii?Q?GN+dcVibc0PE5ar8YEvUajm/iy6tqqZt4t023xVzmgGV2qVMyWiqMCLGn1cb?=
 =?us-ascii?Q?EXoMJTDvaCcJuOrpL7nqnUwkvfEJl0Ueh7vhpNJatScotNsgjJ7YBQoncrLy?=
 =?us-ascii?Q?SI0/6wvOG9oVfrtBt9ULDhjX253uBE36Baq10S6MiqOXFKJS0T7mfzeTM9rA?=
 =?us-ascii?Q?ipnTCUlI3SKcCSEX/zxi0e/W6ojcxWb1GvoncLfp1IOzjJu0DteZPXwbI/cf?=
 =?us-ascii?Q?eP4FxWf3yi4EEVbCB9eW5h6HE+aMRUBnZsVX5rRo8oQ4yDmSuom3BfOsbQJK?=
 =?us-ascii?Q?2oNH9ntmfZSmcahFXrvNWcOC5Psn+/iV1BhaiXHjuSBn7ozM6pr9HQPWAd8O?=
 =?us-ascii?Q?NKEboPooIp1KqzvJAD0kQmlxcKlfWGPnN31xCEdZMzLQFWnxPkJgDGF1yytP?=
 =?us-ascii?Q?YoXm+sJQLP5onplNHMsrMARLeShUUsTYmF+6qrfywiInV5kehX9Bp3lZdH1Y?=
 =?us-ascii?Q?12Zo3g7+CAxepnElgIXTsPloM/z5rJnLI6kZ4JoIKjFQh5B8mu5X3YXnZzf2?=
 =?us-ascii?Q?hpV2KFtx3bgHAnxqClHjk2k2Bw3glG0i0+paRK1n2GOPF78ptJvNBIDoae07?=
 =?us-ascii?Q?qthmomevSNHP51XuivekVTXJGemw7Kl0EDlib2HSQi3ilBU6kw+knRnneVqH?=
 =?us-ascii?Q?EiCzozC2dM0bnpIAAl37nqGplIFKw2OBJQIZ9B9yWpZnARSE2EQ/CvsW8vbJ?=
 =?us-ascii?Q?RlO52GM1lbsVBhqP5G9v0ypAb2HcQvkf10SOTAsf?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e5e3a9d-f2d4-405f-06ff-08dd6b8496ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2025 10:05:36.8156 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1PVo71f4D5MjnP5d4/38Etazw0W/hYdUrUyePwzOu/egkv2zWFzwW7ozJvgmAKnCdH4/fs0dtf2PxtBDeh6b6Tf3sWIQzk5EUAQfWRAL58w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8175
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Juli=
a
> Filipchuk
> Sent: Tuesday, March 25, 2025 4:04 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Filipchuk, Julia <julia.filipchuk@intel.com>
> Subject: [PATCH] drm/xe/ptl: Apply Wa_14022293748, Wa_22019794406
>=20
> Extend Wa_14022293748, Wa_22019794406 to PTL
>=20
> Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_wa_oob.rules | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules
> b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 0c738af24f7c..9b9e176992a8 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -32,8 +32,10 @@
>  		GRAPHICS_VERSION(3001)
>  14022293748	GRAPHICS_VERSION(2001)
>  		GRAPHICS_VERSION(2004)
> +		GRAPHICS_VERSION_RANGE(3000, 3001)
>  22019794406	GRAPHICS_VERSION(2001)
>  		GRAPHICS_VERSION(2004)
> +		GRAPHICS_VERSION_RANGE(3000, 3001)

LGTM,
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>


>  22019338487	MEDIA_VERSION(2000)
>  		GRAPHICS_VERSION(2001)
>  		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0),
> FUNC(xe_rtp_match_not_sriov_vf)
> --
> 2.48.1


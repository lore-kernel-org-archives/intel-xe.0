Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B71AC27C55
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jun 2024 16:40:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D162510E18B;
	Mon, 10 Jun 2024 16:40:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C9qgXj5D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8E5610E18B
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jun 2024 16:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718037639; x=1749573639;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=WFPjVMiFxqcuk/L2Q7mBkhG4Av4NsCqgEACdAAiysag=;
 b=C9qgXj5DzwHe68yV4hUql4sh8jWJcx4mOeXvSJB1EOPy8uopzbiOazgZ
 cVTKRE/gmXWPQBaTE0VI246K7PbhRKso9kgQSAAgR6NfKtbzMrhb7H698
 TBrLSZ5QGiT+nbcfAm0myGEsj5G525w0+8wYV7s77Jo8yuL8f54fA6bez
 gWfVT21X3kTSoDxHdNdvMa47V86gOhWaV2vhp6jNXBj6G/PEDJ641P/wm
 XRw7/4yNLTa1NRh0FxQLSAzA63zCBUx0N2ymCkYRJMcaQ70JkCxv2Jk5N
 9uP67YfWC84awb2KMBw5JUytXM3m6nLAt+7U098wrT1RaZYly5TjGKiKC w==;
X-CSE-ConnectionGUID: +sVr5PejTXyLZntAHZfuaA==
X-CSE-MsgGUID: 8cZGqMAqR2612qmCutNXvw==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="25283727"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="25283727"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 09:40:39 -0700
X-CSE-ConnectionGUID: MyUGdF9RRai1hgvv7lH8tg==
X-CSE-MsgGUID: uPwOwoLvTzOK3lAt/AE1gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="38963368"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jun 2024 09:40:39 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 10 Jun 2024 09:40:38 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 10 Jun 2024 09:40:38 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 10 Jun 2024 09:40:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DXZAa+M7I9MNH7med7QcqCOWwQPqrpOapguDQap3vzjDgaEU3YofPkbP8aTtDJluyAT1lEfLIMlwXlsNCyF9z2uM9pzYiJxoY0++bDYZXyca01jgMjeKIqzURBkxQSzrNYCbM0dxjPd5rAdnaLiYhxl1kYIt9O+Op8ye0e/Q5cLzHZBmn9pCDNUVto7dXSksT9gsI1CbMqqdqPttP/r/moCpDSsQQtVNqPjG5Tp+6HUgLvV3LFR74UoxBPzWtqc0OxqbF7NXGsVBly9m5ujbXfbtOm2Khep7JVjI5o2KHqCL10Oqe6y2cKt20bwNea7GdEc0T2c8mqiv6udO+nTH7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PelNOFf9hbNhNnV1NTkkIJBzUppuLLNxhLdz2n7QvNY=;
 b=LhiGvHteDFCs3H+CZYXj2pnCIlgEub/RpDlKBYJOJFU2+gG5gUbMPbrMGk+Yd1do2IQ+ix8nAQXIZuuW3eCWcusnzVz3Ddmadns7q37U28XY4ENqe9O80MOhVncNTGomWh/ySJZgB3+5W7QQSdP0Qs4ED6MSJO8ysGpTaxYIs9G4FXiR0Yb0J1kmrsVsAeUI9AsIaOUqdXpzvF2mR9yHR1YuFeEwujzFsruBFMjoEmJwfVVszVhysvfiP+XN/a8I0ZTNe9B14FMxWu6DTjTogUVDZNCW9XIwmGVOrPKI1kZ+ZbB3FVAZDaxxlxRrmeGFgLjkvwZg6988DKPkd7ZsDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SA2PR11MB4780.namprd11.prod.outlook.com (2603:10b6:806:11d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Mon, 10 Jun
 2024 16:40:31 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.7633.036; Mon, 10 Jun 2024
 16:40:30 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v5 04/10] drm/xe: Add ctx timestamp to LRC snapshot
Thread-Topic: [PATCH v5 04/10] drm/xe: Add ctx timestamp to LRC snapshot
Thread-Index: AQHau0EZLAdcAVdmmke7VxcLDeCsNbHBMyCA
Date: Mon, 10 Jun 2024 16:40:30 +0000
Message-ID: <CH0PR11MB54441B5AC49DB3DC9FEA60B6E5C62@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240610141823.2605496-1-matthew.brost@intel.com>
 <20240610141823.2605496-5-matthew.brost@intel.com>
In-Reply-To: <20240610141823.2605496-5-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SA2PR11MB4780:EE_
x-ms-office365-filtering-correlation-id: 7fbed6f9-c3fa-453c-434e-08dc896c0aa8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?VRSIaKxi5cJyDiqd4UrsjSnppWmuaml2EVKlr2CtnwmYSkpeSuuY8vGd3UFi?=
 =?us-ascii?Q?sPp6YLBd36pAnn9jPllP1g+fwtXqm9IwDBkP97/JR/r6g0szb7BB/KbShoF9?=
 =?us-ascii?Q?l88vSTX5zzv6MiWDr4QCKJ/lUaN13NPpgLC4lO2F5E380KgbzEuQPn8jHZpO?=
 =?us-ascii?Q?HyvHibC+m69iVe3slq7sA8kQSXUuJjv5lHKPDNo914KGmziD+Zz3MwceFFzp?=
 =?us-ascii?Q?ImoQR8VSZo6FpNbWAnKqexqQ9citHLcMIC6Ql4rHqNsOPa1K9CzXblm6fL+t?=
 =?us-ascii?Q?G1CY58VJdXXazmSykH1KmCa4PFvXSyOSz2JCP2yFHoCsCzo+NgBvM+P75j1q?=
 =?us-ascii?Q?Tqu36lAtzv6KUKZcjfwc3GH7n44+sOWt9v3dgSoq96PrHPmMgihM/bv03P5t?=
 =?us-ascii?Q?nlXo7ojyXi5p6zoJE5Q/4oD2KEkBuM6bKm1xYoRydmCIBdGW2gtA+O0U+wHO?=
 =?us-ascii?Q?j9rCweFzZid3hnrs4v5Sd3ZXKmdG9X9nbBpSVKTxxWXV5cTz32SmOcZKJiCI?=
 =?us-ascii?Q?ZsWYV+kRYdfkyK3y5tr0Q/l3vuCaDtR5hS1thPkAkNi7mBbz+mlVUUUOTE4P?=
 =?us-ascii?Q?a+07FYEuhvUYSjTbqa4ZX3eSyEzBvHtW1V6RjSKLWvuStXsQiujMpFvJ0GTr?=
 =?us-ascii?Q?6y9nzMWMABG83k3s7XvTIhpG+XJFE/WWUTSCp29DegwUyaKK+aST0CU/Qzkc?=
 =?us-ascii?Q?M4CvayPOz5xHPgNnPQmE9MHDzpSAHA/EEqkhkzdcbXd8nFDf5pFpFZk8g2x+?=
 =?us-ascii?Q?TutWOBjxC5mXUglWkaNgBnwes9mWfZDpRwOWDhxfrsBfmB6/RFV35sqwoj0H?=
 =?us-ascii?Q?WuRqbFeCCBPH9hpWBQWt4KSdHzrW99hueYIlAsGzbI7B15dZBo1ZIR5/tzxY?=
 =?us-ascii?Q?wF2cKxVUtLokgezzounwK8xFqF/31tCgttq7vqXdnWXIjYioh5ITM5EljjAy?=
 =?us-ascii?Q?otATDR6gtv+vq5e3Ru+fshvI9nB+T6Hda/cUQEwHfDzdRcOg0tUwCMwlgvhm?=
 =?us-ascii?Q?s/3Glf2gdBIXy/MBqLq95Ar8dc3L/OSNOwbZMPgI/hKHPMZ5vNVk+DmZEruQ?=
 =?us-ascii?Q?eOqA0ss5b8tTJMKTK3PpaCqmRiP67X3E8Z1ZxwQcsV0CU63xVj03jguuVeOK?=
 =?us-ascii?Q?TsP3ixYnp9TzPNtaPzFHEP5TpI7ezheTqezmM3cVzJH4ogsCX9zYm4gl4SRA?=
 =?us-ascii?Q?J4bhNBMWeaMf2cIEzbdM1baaPl4gmtn6/EjHq6NXNb0tkB5QZ67Qvsu50+M5?=
 =?us-ascii?Q?G0kgVkhCZ36snvQqaPVR1mLAJafb1KIbca7QJBRCY9/Rgz8IL2eQMR8XR8sE?=
 =?us-ascii?Q?Xfp1NP24SwWbX8eEQnoTwzfedo3gosWW40twZR1CcDnR4pqY7kA2yxt00/2F?=
 =?us-ascii?Q?mPJdFQc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Zojwr7TRoiw/AyKQv7Ojd9B/DN2okHPmYONnp1/aMHdY4auMeGMbkACgdQbl?=
 =?us-ascii?Q?6WpJyoM4KW2/rJY5HL5qHs5U+0CC27WHHJI3pQEdcf2BJkBWNHzJahPPB+L/?=
 =?us-ascii?Q?koxNk7FLsM/yQDCERxbMVIEm3XrdNTvZFi7igj2bxHTmlyVfZ0C6E8TMXuc3?=
 =?us-ascii?Q?EkoYo/m0FaY0BLtk8DstUN5H12zB8I3irL+Vw/+7sjY7Zhna7Bdipp5vEuvh?=
 =?us-ascii?Q?9h49oSp7DVTJpVfTjgSxa3nAjvS0zXB9jo5syLcbI8QmytA5sB5ghCu0Zrrc?=
 =?us-ascii?Q?ADdxfPPHU42r99xoyDFz+IfRTdtk0mS9jLwtP2r/MM9RgfLH7ImIKHu+ORAZ?=
 =?us-ascii?Q?95kwZzi+9hpHkEUjve9+qwJPEHKefr3rCuVzWhuuKaoirh5jy3Xe8RGs9zUe?=
 =?us-ascii?Q?DyhEWz3KQ70fvzoj1eNZfITdFsWxKb4De6cK0tn2l9a2VyfttiGn9vn1ju+W?=
 =?us-ascii?Q?2VSXE/zT7uZ/QjquCTsIBXByYE3E7NFJWsZ31Sr+PN1Ey0yLUBsdwgPX0eEt?=
 =?us-ascii?Q?UlyVN31gw0Oo2HKu18WNl/q5NHxPNAUTCQ+YqiFvbqGKyeah8iZeklagaxi8?=
 =?us-ascii?Q?8enhUmVOMBoHodFRXxI1w5n3tnJd0Bxziqc6itq1QKxRWYWWGJWczolnOGil?=
 =?us-ascii?Q?Yo7dy4cOQSVluO+Yr34ZoaYSRnZQVw2o8VPSHI22vtDWUtVZXZ5n79OKjrRe?=
 =?us-ascii?Q?mrXeRV2hUPPyWKpEbqREiJr9gcPbqxj/ubpwhT2eTjoOGfVEKBqiQjQNSL1Y?=
 =?us-ascii?Q?nPWghPoRZ5lMxHTe85ASYxejrpb7TSo0ddtezVPizTZNfnBoYJEytiLzHT6b?=
 =?us-ascii?Q?cBIWg47A4XzNxHd8eq+XOiOjRt93J0PS0yCJxfXmX+ZWftIHG5MpVqdmGq/5?=
 =?us-ascii?Q?X/9vSrijtjT2LUFev6oHuyNU5MMz6FdvXGRsGScChvEr5/EjasyaGCFWNAqu?=
 =?us-ascii?Q?O0xXqwFwIGUwVCy7QfOxfcX6jFagPLWtZIfLe39VpvQNdGB+UA7be3XRMpGu?=
 =?us-ascii?Q?oJzbfa6Uaw01+DWtlU7mHioIcFxYF1mIHO8QGz1Apk1Jl8bLzYUbh71vObEy?=
 =?us-ascii?Q?0ZiKhtBKRcdB6z4TcL7Zt6v9qRGopLbR2dbuv6SmbgFbO9jJ6gNNUy05NqU4?=
 =?us-ascii?Q?AEmf1MzD5c28NyVJdDuo+HIwCHjLvhuIB7qIjan1Cl0up1NRLuiO0qWe4fK+?=
 =?us-ascii?Q?trVOHV1CM3NCp1S1QlNRIiBI9q5321OXrN1ifKnGd90X3lG3uhV5tiGAGs3L?=
 =?us-ascii?Q?idIquAgFCJV0mQEVROTYNMLkY5VA1BZ9K6rdLs0MrWXHUlicmwOZEN4LMmk9?=
 =?us-ascii?Q?qYTwli8MOWc/TnjH1R/PEyPPLP597dgUjQzd6M3uwSJRT9wsdA347JfC+fGe?=
 =?us-ascii?Q?rmY1HTlC2UJL7yDlNLEvHI90LIVtRGxxeGRWGOzQUr/0uUSSjAaK4y3eLMSy?=
 =?us-ascii?Q?d1TcY4A+rM7ryuMks7qvLms8pnBYCV7yOh5mcy8Gij78dKhAuwP4uVb9CtIr?=
 =?us-ascii?Q?5ARfRFGGkwGgIABtcfAvquzyWXAlb9eV11O6VBm6TRWQTlez8fvI+nqx6SFm?=
 =?us-ascii?Q?PKyB2hnapBRk9nga8UjgahDFno8vd6Jw++NBcyzO?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fbed6f9-c3fa-453c-434e-08dc896c0aa8
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2024 16:40:30.7652 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 86URxuyvXRRA9QPQNnSZZlxcACoYhaN2izjAKjTHOi/USbT1cdLc1KlH88EaYmbNYW4fR6fMGa86epBMsrF3L2AfteYiTUqydpaRlhnB3J8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4780
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthe=
w Brost
Sent: Monday, June 10, 2024 7:18 AM
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 04/10] drm/xe: Add ctx timestamp to LRC snapshot
>=20
> The ctx timestamp is useful information, add to LRC snapshot.
>=20
> v2:
>   - s/ctx_timestamp_job/ctx_job_timestamp
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

LGTM
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_lrc.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 0fef354c6489..f3d77aa1750d 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -49,6 +49,8 @@ struct xe_lrc_snapshot {
>  	} tail;
>  	u32 start_seqno;
>  	u32 seqno;
> +	u32 ctx_timestamp;
> +	u32 ctx_job_timestamp;
>  };
> =20
>  static struct xe_device *
> @@ -1642,6 +1644,8 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(str=
uct xe_lrc *lrc)
>  	snapshot->lrc_offset =3D xe_lrc_pphwsp_offset(lrc);
>  	snapshot->lrc_size =3D lrc->bo->size - snapshot->lrc_offset;
>  	snapshot->lrc_snapshot =3D NULL;
> +	snapshot->ctx_timestamp =3D xe_lrc_ctx_timestamp(lrc);
> +	snapshot->ctx_job_timestamp =3D xe_lrc_ctx_job_timestamp(lrc);
>  	return snapshot;
>  }
> =20
> @@ -1690,6 +1694,8 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapshot *=
snapshot, struct drm_printer
>  		   snapshot->tail.internal, snapshot->tail.memory);
>  	drm_printf(p, "\tStart seqno: (memory) %d\n", snapshot->start_seqno);
>  	drm_printf(p, "\tSeqno: (memory) %d\n", snapshot->seqno);
> +	drm_printf(p, "\tTimestamp: 0x%08x\n", snapshot->ctx_timestamp);
> +	drm_printf(p, "\tJob Timestamp: 0x%08x\n", snapshot->ctx_job_timestamp)=
;
> =20
>  	if (!snapshot->lrc_snapshot)
>  		return;
> --=20
> 2.34.1
>=20
>=20

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C51EDEEE241
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 19:48:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9270E10EC0E;
	Thu, 12 Sep 2024 19:48:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LOlRyQIw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F0D810EC0E
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Sep 2024 19:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726170483; x=1757706483;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JauRGuns+xpLWWDfu3AXiiL0nwmIAjCunh+YpP6RuqI=;
 b=LOlRyQIw6K7LRXpzd3vrd8dJxrT+ABcgvoIZcDqWSgT6kr4U/6+jOjWH
 9HmQ/cltNLmM6XVsouHKnEX73Fc6jFfOTH+DHpPFTGnWugae+8woYjjIi
 hycrm5Iw8v3u3lP13qwqzZlVb4wlWmdtHcOWygFsUqfff3O6I3EXWYxR6
 qNFYiCu2B4VcwvviAuPGOTaH1U1nSwTMUQndNHMkIErUXlRgu7IPpIXT+
 t8HhaoMrW6FmBaWV8tkMLq6DAMCcKdxGsYve0U7R4GGj1l4KxuAfHBrdR
 s2YD3X3cOJW6DZBn7iQSDLCwJVbUfF+83F+bGZ8zqxQ0mlM8iFOBnvnW3 w==;
X-CSE-ConnectionGUID: eES+IJj8S/GANU+w+sorHA==
X-CSE-MsgGUID: ag06zWwLSp6gBqAvTz0UIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="28829766"
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; d="scan'208";a="28829766"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 12:48:03 -0700
X-CSE-ConnectionGUID: /exqZoErSoSVdnGBgIIZMA==
X-CSE-MsgGUID: FNhHDTYBRwq1IRA19b6R9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; d="scan'208";a="91062840"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Sep 2024 12:48:02 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 12 Sep 2024 12:48:01 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 12 Sep 2024 12:48:01 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Sep 2024 12:48:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fM4LglenUOdwKv8pMWkB0Vmmn1Vha2w9wN+xQ82iDafXIDPwRNpzCsUkbZxAYJOjMhQhcU4gnFhqv1y6+dYjrHVXiCAQ+iBHyjI7N7/fzqll81t9EkkgNkSmtngQCciuDN7Qzel+eOfl1QXCOKCGATZOEWVu4swu1ySQ2uy7UlZopdqqJE5fKFH+wU7HvnvY0u5VphsD0xcOCjKjGW+i21zasGLxsE9Rmdgu2g7qk1qx9fT4TUsEaWQ9L8SDOd5+otkz25qHOecG9lCQdxI0d5IdQDTZdWYo+ZpziClziuZIylQvyJW70N9X5J/aJAXqEPd4Ntur6KFatVuje+AGbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/6gAwfT8yNKRDnI79RxxiHncvmR+l2h7N79Tk1RoypU=;
 b=tX25IIsgxTzHD3dyZejWZtkq3TA6Qg7z7ktLPdpSskzK1NpszySrJVuJ8wnx/sg/HpRU6pzsnAD22nMhWRdAq5kPqA0E/Nzel1r6VoFZrluiGyEXUa3Nu52/+Ecubrk3OwXe8Wo3e0O6Pu0bT5n0Q3yXdvxjZ69Vv35jitcuagNmtO81Ja4Sqz7mRqzfHbUoGKepz8EKFYVRdQlxYI4nTfEOKJDPx9EJiPYW1ekzhxtOTTcXs9CNZznwD+8/u3D0cIopAQGAnObejlEZpIIdq1KhKIu1aB38UItT8yG618pkhnPLvqJiv7RO0tjyxlU14XGuTQME+IYFRFt4uzw5jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SJ2PR11MB7501.namprd11.prod.outlook.com (2603:10b6:a03:4d2::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Thu, 12 Sep
 2024 19:47:51 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.7939.025; Thu, 12 Sep 2024
 19:47:50 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe: Restore pci state upon resume
Thread-Topic: [PATCH] drm/xe: Restore pci state upon resume
Thread-Index: AQHbBUbLsfeKLqtSiEGYM5N9hVZQb7JUjo4A
Date: Thu, 12 Sep 2024 19:47:50 +0000
Message-ID: <CH0PR11MB54449778E67BCA2A908D3F9AE5642@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240912190530.435976-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240912190530.435976-1-rodrigo.vivi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SJ2PR11MB7501:EE_
x-ms-office365-filtering-correlation-id: 3e129f6b-6b4a-4ce8-ade4-08dcd363c90a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?AkK8dd7LWtkwISnGCF+gUFnX9qQ16ask0+2lqWfV5KJMOaEdzaSQvN4XldlQ?=
 =?us-ascii?Q?5rfRoT7H615a+jXifKN/0mURFWRiZCHGG9h5QLJdWrDjYuu77BGmBNMPf2xB?=
 =?us-ascii?Q?zqD2AXOOp87u1BfyF/WoTpSJv1Y+XqLJZIomXFxTfToLigKXtLJ0gzc4G8YX?=
 =?us-ascii?Q?xple+jxj/oMVls1EhAeNgq5JAYorT7nPAkjZKosEEVRMgnajG6e1d3mFwMag?=
 =?us-ascii?Q?W1ncVvdaRwq26oK/68tqCscXSoHLvJG3TJcgc/h75EhbfgAXD954TblyaTqn?=
 =?us-ascii?Q?AwollGjM5FcP+hSwgzx1PUUBrJpxUqO4r4S9kFl4ZZfbnrA0A2N1vKznAmzR?=
 =?us-ascii?Q?tjkZQnUEq11ym2Tr/hUgDkv9jbAVgbKfryqbnBxc+fTFUoHn/VhC8D5+dM/T?=
 =?us-ascii?Q?qya50dugfWOVdhyv5SGnSASBSDIxnqCCrEX+Ger36Qz8bCwtc9w+BQfHFGi2?=
 =?us-ascii?Q?ZKtZqMudZduu/a3fMXEo4u2vkmIdUkcR7W6XUQggagZ9TkuiMUiPjOYxF3fx?=
 =?us-ascii?Q?DMT4VhH21sCRcrRVArtuLgkz4hADjmnnqh94cNTIMUNYGf8Hp4maIaOW1k0q?=
 =?us-ascii?Q?blcVxLDerCeDxsCCTSS9pBNwSJQ4vyY+0/Xbaak+veotOfmb97il2BtpvosN?=
 =?us-ascii?Q?R8r4lxp4sQ9Yjp3AtiwD9iLdO/n3Uu9gqyFUrwtpyg58fngzSHR9Ye5aLDMa?=
 =?us-ascii?Q?Yv3xnmjHjG80makCMo/vuetCEdppnMNayvsWFDTZliYddIyF4iYfRvTi7IvX?=
 =?us-ascii?Q?45/f2ETX3LTGuPOdikkDJrQpOMBAKnTmBjPT7hlC2cj3hpYoOJ/nxLThBh7K?=
 =?us-ascii?Q?O6E7Bx1jya21xYdRJ+dYc4D3re4dl7AnpaIh5Y3dWixxAneLAFSjSsLP03K4?=
 =?us-ascii?Q?ccNaTek+BhWtXAWaFVcTcDLA4HXMgdTdgYIR/7MmwEOkq2x+oIQW2x+jKuxL?=
 =?us-ascii?Q?TPG2kF848GJA2GHmOs+y+dbftM6TZoM8mGaPtF8n+WrM9tQyjXRmQreX+/++?=
 =?us-ascii?Q?l+p4dRCJ27olOB3NB5XHgT8BciPFKzy59ut9/8eybOb+DbI7JaVlvntNfUM+?=
 =?us-ascii?Q?TIzxRsJuUESO0o2MGlbAXgTYmSj5S3zlGr+MMuPiXWuQkaLBwYjUbAVmPxuX?=
 =?us-ascii?Q?WWJH9E6QVyrApJCywCOQjNBdOAAmVgAZlLcfmSF4RtQL55u3JY8itM+RAzPo?=
 =?us-ascii?Q?rURdHyI0xVmvsL1CA+Hc1bWwALjDBK5F4ubfZ28GNJsTdPgNzERDKUGPt2DT?=
 =?us-ascii?Q?pwn9F0uyKVFYp7/hLIAyafVBPDWVkplR9jJDU0ULovieN5tz+0XpO25sTUwf?=
 =?us-ascii?Q?ymEIsSeeL/a/rE8LBat1gZAhA21S0Xo1C5rSuHX8gr5QP+kDpiv3AG5+HMYi?=
 =?us-ascii?Q?Af74ANyQ+zcCRIZbUA9EjUCgYXdxjfAxnEjwwtVZzW5fN2UBfg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?c8qqSWYDuWy1uNwb6sy3EtADJlDC8SUSa3swBpBmUAF0QSia13qmbVmd3UHW?=
 =?us-ascii?Q?DjT5J24jYyxcNLUuJRSy1wmb9yjh3BD0WnG3TQl+krsplgVMeO52sPdyl714?=
 =?us-ascii?Q?qxxeZsWeObDIL8SR43W+mzYfDLVgK0ndQoZHNJWd/tTUdqC9z34+5awLAJiN?=
 =?us-ascii?Q?I3RzVUqoaV4GAugkrWKgHIoI9xN3DA1x+88BPCfCBebf1KqtIPwAEbRxwasl?=
 =?us-ascii?Q?4ienWBory8Fs1X4/DMqDgiTd7gUVLHy3HJRb5Ra+gsikQr7/4mWCCQq5i0lU?=
 =?us-ascii?Q?5JYZvUh29P4zIxyTsssk2/B90RrEqqW9pof3sVPH1bYh+Z6bPXdbBWHNHB/6?=
 =?us-ascii?Q?WWO0d7o7q5n9yVn0b5msIyviS82JqAZiy1lNYMv+n6vU/qfgMZIfkrnZ9Fcz?=
 =?us-ascii?Q?PnapfFc645R+f3V7TxB7NH8NT2LoPmuAcBz3MdiQCPZlIKWjixGwyaJKPPEw?=
 =?us-ascii?Q?XvLsbMslLuKtl68M3K3ZX2zMkqyVMlcP7ImTIN1sxH+Bwt7BB4wfNkSfhgU1?=
 =?us-ascii?Q?288Lc+6EvSgh1sEd+TPPHn8BH5RW41IPegbeOvUzo8E9z2s2rGzvwQj5xX0k?=
 =?us-ascii?Q?iWR9n8U+Zf0mvXBKkX8J+l5rbfThAmido9TaDs824Za1oVGW74mMUtTse/dQ?=
 =?us-ascii?Q?UbTFrKPjfVCX0FBcOAZwam/L95fwr7khJf0KsSUEWIP4y8+HPEbqpOStE/ge?=
 =?us-ascii?Q?IaJdZ0xkRfhw2ODIcixvQLoPXhvhPAShMUrIq8ljl6eSOixH/gXpiyMcjxjj?=
 =?us-ascii?Q?UOA9Mcj6/Af5H9fIuQPnF0QGte5l1k5XEdRzwIoeBLwP+bzti9m37ShxKrQs?=
 =?us-ascii?Q?utZvEPKUJLT/z50Wp1RgBegE48iIRWPfPqY2bCHL9QCPw6Jz2MTru2xilTU3?=
 =?us-ascii?Q?NcptSSUeIl40nDRUQwdr5y5/i3ZKH7q5R92aDsQq8MZXXMzD4m24PO7cpaGR?=
 =?us-ascii?Q?sFFLuixkqe01/8NoYbAG9//9CXJxFrZRt0HBo78ZrdKpUpVP3PD78cuCmZe6?=
 =?us-ascii?Q?aOkimaE+MLC09U7KvxjGRA2MEMVISiv6jkxFImLAK47NU82jEvJjGgHLdMyS?=
 =?us-ascii?Q?/b7/oMmGfxoU+Yk3TeDXcqyUlrPAUWyd94cEHnymlL3QHeP3ppb42DfdW1k6?=
 =?us-ascii?Q?UVxaYxIElzYP9PAZFN/t6Ckz4sggEn52f4M2tU4CJLBg56qzVQCokCxfpSwI?=
 =?us-ascii?Q?pqdNqaiZiP46UDAUyigqbjaBdOXQb5VUJF8BJymTNTahWOIRul+2+cn6NEtl?=
 =?us-ascii?Q?zN18EOre7Hywlz/QvzyoXGqMITySivcLkpPuGIhOu8xZCxCXxUK7RwbEy6wF?=
 =?us-ascii?Q?04yMVY3nPrK5zFb2UsWJWSW7nCotUjSBy5JS5ABkhlyjFcGGHfGhqyYEKT57?=
 =?us-ascii?Q?c9of+HygGI1MBvpY/gztJXknKqITQ2EKRoG9lKKgL09UyxN4JgknZSik8z7w?=
 =?us-ascii?Q?2LhYRwtR8RH3lmIFtHVHJ/61ZGD+riYCHArQKTx/QQKYf50T5v0++C9xGCDv?=
 =?us-ascii?Q?WTWenv+qPwzNHAwjFNRAwmAAlsk6xj9vlLjH4F++ipkPcQZQtFBtn4pJMj4/?=
 =?us-ascii?Q?sYEnu+pDOGapzSVbYMB0omZgdzfagZby20OxSJtj?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e129f6b-6b4a-4ce8-ade4-08dcd363c90a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2024 19:47:50.7732 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hfkvUUJK8XILm5q4049DdxpcSE/QZkwthXbp65OlAWIaY6HNBo6pOHobQvrRXSmi1E0WKyU7luOvUMGYr4gLy/iqJPNzouChM87uV4f/PLw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7501
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Rodrig=
o Vivi
Sent: Thursday, September 12, 2024 12:06 PM
To: intel-xe@lists.freedesktop.org
Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/xe: Restore pci state upon resume
>=20
> The pci state was saved, but not restored. Restore
> right after the power state transition request like
> every other driver.
>=20
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

LGTM.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_pci.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 5ba4ec229494..6d29ef4b396f 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -949,6 +949,8 @@ static int xe_pci_resume(struct device *dev)
>  	if (err)
>  		return err;
> =20
> +	pci_restore_state(pdev);
> +
>  	err =3D pci_enable_device(pdev);
>  	if (err)
>  		return err;
> --=20
> 2.46.0
>=20
>=20

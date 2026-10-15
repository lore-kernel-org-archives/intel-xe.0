Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A98CC6B33
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 13:29:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A7CB10EBCD;
	Thu, 15 Oct 2026 13:29:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3688610EBB5
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 13:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792070980; x=1823606980;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xfE8RgnQxuzi9FkyK+iGxnRJVNAaEfru0SBueOkRqJA=;
 b=Vtf6Vn7R5jH1UFTp7iLw6+Q88XCXxeGL8oVrxhTtlIp7e+dE80RdfTet
 TrKGnh2naOM/v7VjsDXNHB1ds268ahrIAk6AVDwHQ12eSYZ4Nb2hOpeLm
 NQvvyVyYDQOYheSg3de8feARZROEWtHpSD50mfFnVNXXNNZyVrTTapJDi
 wQxno3u5PlrZIx5chiZDSgA6Y0Nqya1YCfxS4Nq3V81Z7O4fGb5SlktB0
 cZH0QOLmRsdogH5hm9UhaJS4b4/qaJXIoTZOUWxvp0mzJZMNgo5tsPXhx
 dp83g8Uj2pdjWrsaZpcpdLYMB9AzYc54rkj+Orl0xuZOObalMHNLE9b6R A==;
X-CSE-ConnectionGUID: U9eLh9wTS8mKfVU61uGGmw==
X-CSE-MsgGUID: sITgX5GJQsyfeTNknbMNXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="835656"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="835656"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 06:29:39 -0700
X-CSE-ConnectionGUID: MglRu5RbSS6QUmWlVRwPgg==
X-CSE-MsgGUID: +4h1Rf5WTG+Kw/b2JmqTWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="2049115"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 06:29:38 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 06:29:37 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 15 Oct 2026 06:29:37 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.13) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 06:29:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n/DlftMERfBK5Cn+zGw45jujQwFiMKggiiCduzCxj5cCrY7W2vsUtuSdb+odY7sKn+x/jN5QGzGcSCHRM2NEMuZdf/S1eu65IiBGN6vQhyiccDLAa0kJeoXhNSm2W9/c+gxWCQovc7xEu6pfs/MM9ZHKXzpncMReUVIBR5wnLwfIGOMR/9xkBmc3T8u3KMe+gPszp0THBTX4kds1HxgXmeCEkR4dBDzCLlhKxOgvHlJ03bv0cfEvtVIaWhDhkFn8TKKKjvgz7T6yVDaHIrg83FJ99SmSO/4GEEGIZvrcfH2GGWPXv9USRPF7EDfUk41BK2xNeX/fAGGZvV7anCgLSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iGcJi3pYikn2eCx+ruAFx7STGT5Wqgx7fMaWJs9nJBc=;
 b=ubh2ueRy/HzDGo8kCl83Qoxhgb4ijpgvtkHM7PQjAU/EB+pRhivE08Ku5t/O1hduPNqEyiX0AH/bvMumm8H/TAKzgCw/Yh0ieUbPSDl+Va4SrZ+ZzQ8CvBVD/XJVo0GwDqq+nJezOutAz0aIlxgBiJOEYlX8oWKqRlYxJDWURWiJl9A9F0gzblabkVBJvtE4/XYneR4LkpvDoiMQX1JI1XIFG5rD01f9VCGV8hNczRt92mUNYsmhrdNji9r6z6qSdlTGW4Pq/v3llFn4zBY/O1TyNmTd+h/UvFGLXxEbXxIJyToNULx/Gk6aI1w7cbkKmw8auDukQTYWFmmWARoOGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by IA3PR11MB817020.namprd11.prod.outlook.com (2603:10b6:208:548::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Thu, 15 Oct
 2026 13:29:34 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0496.021; Thu, 15 Oct 2026
 13:29:34 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
Subject: RE: [PATCH 1/2] drm/xe/pat: initialise pat.valid everywhere
Thread-Topic: [PATCH 1/2] drm/xe/pat: initialise pat.valid everywhere
Thread-Index: AQHdXItfsSMIW4pyrU+fNQDBzUQUjLb+mU1g
Date: Thu, 15 Oct 2026 13:29:34 +0000
Message-ID: <DS0PR11MB871886B3D98B3448AC2345C0819C2@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20261015095516.403932-4-matthew.auld@intel.com>
 <20261015095516.403932-5-matthew.auld@intel.com>
In-Reply-To: <20261015095516.403932-5-matthew.auld@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|IA3PR11MB817020:EE_
x-ms-office365-filtering-correlation-id: 8592ec27-0c35-4279-736b-08df2ac05a1c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|38070700021|56012099006|4143699003|11063799006|261009223027099003|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info: ZhboblTRNCsVaq/tF0NQQfpF2yfkxf0ES1st52z7AQ6SrOQm7ODVx86WV+HzDfrQUcH9cecrctxM21oE706nSnyQo8s3oPNDVgxhkI9IBWapUB8+aVnwmf8Pa6pUAAseAAco1TSxtMftNskNe/x9VFtMJYyemJZ07IM0AeDl/GYIs6PhGybtjC125TBFZ7dEEmn009mFzBYoFV07BmLQOP3N7BPwL5gF1BaxhpJ89oz1T4MZd07wRiG1kJvb7EHnCIpWGjW8DCxGYi0ul9KDwlnBCz0VQWZ1mPSbJh4T7EPPxrS2bgwhL0eI+WyqS7KPLCgtIo8ECwxa47FHHg5bMU9Cat+ntBpa1BUPIo5v/H73Khu1ir5M4aZ0oTy59igoLOrrCIzAUn0V3X54r1iW1PjWWylVbVsrTbvQmeJJxdO57HVobqh6CD0dyXKQSN7c0HPolqI2F5nuSYmsPtlCOqGlJSKe5FgKxR7FmV0qnfFUeEoyEmj3+Kj8qypUZdD0XS0OKxmFqz5GgMsdj1S9lI2Gx02oC1LmOPK9+IjmT8gaeyI6JG+4gmPTNjeWDY1tJOx9jeULZzcUGtgswteY1Vx7POpZ5raGNVl4SizkF28uwMhQ/fnZ765f7Lr2QbRsnuhI3izy/LAkw4OpscvGCSFBn/MFg5LeSzyHQ+Nf1J8XAsnJBbsJMdGwFTH4gFxkZTSnF4xcEerxX6ua0v5mmw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(38070700021)(56012099006)(4143699003)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xnQF/gqiW/3Rma3i2tmmn2nr3yHDhff3ekNx9OqX2PPTM32VldzAhi0Hfxnm?=
 =?us-ascii?Q?Y8d8nmMkwW7gQl5zHUf74uPT0NzX8otk0K83tzlxUAK4flRv6XGls4UiR+8m?=
 =?us-ascii?Q?lLVYMSVn0ZQHWSsASUuHgtZKuh0VJxuwZV7vl5BNMYVStgXD+AQisUWkePrP?=
 =?us-ascii?Q?Ea2FyBgX8SLsYUq4sidTyZLfPIzs+O3d0ccw+V1u7578mS8MZHhhrOlWAV1w?=
 =?us-ascii?Q?ZgAlLngPE8NNBSCR7alOq5ofESIIEqV0zzNMnOl9iIIwLWg63cLJF8mYXDuT?=
 =?us-ascii?Q?vTaNx8Xo+slOXC2eaiWFSboZEyIJm0WS/K3AnlCpfAHZPnt49eiKmNRrqyhc?=
 =?us-ascii?Q?N47j86BhUxdJUr7fFtrE5DDMu2os7M3bwEEOnM+HVDQbQL9vaLLt8je69Li/?=
 =?us-ascii?Q?z3mfuyCJzz9nBFcPxC/L68AgQjlVtEVK+XsmeFdcMEnbwKQuVMQJpHn7Omur?=
 =?us-ascii?Q?4Zu1XHU30b8d0uEisW2oVM125xBURZdQCMFxYTG7tETYGLLZ3nspYDwRGcir?=
 =?us-ascii?Q?UuS06X/zm3ug4odKFWGNsARiWMdoL59jcXUh+wcx4OvkfTz8aX2rQBW41YIH?=
 =?us-ascii?Q?ajpnK/jRioGv6nyRVWlMmNiQwXJ8TW/9GH3v9mjzJGm6iXOtZNzk2AshXP9o?=
 =?us-ascii?Q?zVxvmCQRvu73r+ZigmDIPtsIHRDb3ZHEd+VYILBxFMVbRaXUe0QZSWePa5G/?=
 =?us-ascii?Q?NjVtrkJxQm5WxyhhJWmrasmCobRetBVI2kLAY4cUfTGFPxcHrnug34OuaoFh?=
 =?us-ascii?Q?3yacm9qQVteF++5HbUcvjMqzD/BQD6Sy4rV1ydk/SL593Ms/onCpwvO9e7BO?=
 =?us-ascii?Q?dUZVQALyKQCfsyz1p9P1I4T7gU06r5xfCOm3kRhr35jGRyradcHjaxczan/I?=
 =?us-ascii?Q?+PUh5QGZCMtkF/+sK5Gt3NCO/K/MFdoNF5ALvnGfrwLYk3yGAluhiTDi5ibj?=
 =?us-ascii?Q?r/1bZhFVBMRBegieAaso2pn9pG7U0VZWp+6yvxY4FsWJW2BVdLNYjPN1d8o9?=
 =?us-ascii?Q?CLCt9AcjpJVKKgB12h/gtIH8kG0BQQUMMu0W77CcF4Q/ELunpktm/UPtO3CP?=
 =?us-ascii?Q?yMID1BUoGsPJMNaZXuqHmmFgPKARUTqzMBZKaoTYOKVi19UaK0Lr+N9ysGD/?=
 =?us-ascii?Q?A5DOhs1FspQI+VS2B4bjvhLq3gvT94N2CwOAy3EYrQR8OzLSxPxzaxv/B5Qm?=
 =?us-ascii?Q?APIjTNQRx4PwR3bMN7J+8WV/WiOkFF8ftPzWoONeKFY3r2E5u25pdWpHhLWX?=
 =?us-ascii?Q?zY02WSb56tJzWHFBxoh2hQ2rOBNVcTnnTt7sbNRrz/scIQLd6SqJs0m8jgEk?=
 =?us-ascii?Q?q3llpSH+/CuXSS8nR0O6x7fw6NCbSv0NbWZBSoJlWIF2PUqksawGGzhjNAUJ?=
 =?us-ascii?Q?4AswILh99U0YqJtg4sGTZKxTndo/82Lk/orfL7vO/g7acqnxyF4xkW5zqWdc?=
 =?us-ascii?Q?6ta3oRnf3O7Sglk739hUXQmP5TnW6u8B8e2Jyt8mde8vTWcN8PxAfqEHAKNT?=
 =?us-ascii?Q?/Dw0R96DMK0FyxK96MCIFMy5qskl8qKYv4+4Es3yPgUkd8Bwnnv3HiUC0O1F?=
 =?us-ascii?Q?M8JWoyKphFrevDbbULel07qBhUX6FdF6BPBCEzyaHCVU+nxjCIkCSfTsGiqB?=
 =?us-ascii?Q?9nSOapMqN0r3DlTXzCnGiDC9ljo5WTtfVV3NLs/zuu9oXaF3n7cmnd51MnNZ?=
 =?us-ascii?Q?vqsn2uhwaRFpobgbt6zMvEc8OODIhIGlY9j7ZmNVHOEHY/Z/Buyw5VJGyKvR?=
 =?us-ascii?Q?wokvjvznzg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: XYASllJMUwpPZ1KeDYaO4bW4stSbHtECP7mfPxDwPSpI9w1ndrwa0I5JnCNt4+D3+d3qRKmNq1NfS1Oxe3aVK3purJavQFFxCyEBxA2kFJsB3g4NKJhtY8w9iJLFfki6itqxuuPeJb09VLthvAWp1lWBWQclDRhUO+smur/VH7f5Tj6s04TK1Y7kCXya6dJKLX+d5D16+QdVk9bo7HOPXlqYOuyRZsiwlMKmNTTRM6ap2GMSg2t6qEQIJqGQOKxGatKLryG5txGXE+125zDYIlp0iV3+vdjGv+gWJIlxL8mbFwNQfFLJvPgwBy1A4bF6LnzFm+ezETCR+FpBIWf6rA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8592ec27-0c35-4279-736b-08df2ac05a1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2026 13:29:34.3618 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q2YmVZtGLYbo2bCNg0ShGXqckJabBpn/2959MlffToO5Xc7uLFXkjMjmqKiSyoZ75C/hTqU18opi9ZcsAXwRUirG4X8WHAvsPJHw0dT8OaQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB817020
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
> From: Auld, Matthew <matthew.auld@intel.com>
> Sent: 15 October 2026 15:25
> To: intel-xe@lists.freedesktop.org
> Cc: Teres Alexis, Alan Previn <alan.previn.teres.alexis@intel.com>; Upadh=
yay,
> Tejas <tejas.upadhyay@intel.com>
> Subject: [PATCH 1/2] drm/xe/pat: initialise pat.valid everywhere
>=20
> We were only doing this for xe2+. However, having a central way to determ=
ine
> if any index is reserved/valid will be useful later.
> Currently we abuse checking coh_mode, which is a bit of a hack and can be
> confusing.
>=20
> Assisted-by: LLM
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pat.c | 34 +++++++++++++++++-----------------
>  1 file changed, 17 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c in=
dex
> 3dfcd364ac67..d1ba2325d9e2 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -94,29 +94,29 @@ struct xe_pat_ops {
>  };
>=20
>  static const struct xe_pat_table_entry xelp_pat_table[] =3D {
> -	[0] =3D { XELP_PAT_WB, XE_COH_1WAY },
> -	[1] =3D { XELP_PAT_WC, XE_COH_NONE },
> -	[2] =3D { XELP_PAT_WT, XE_COH_NONE },
> -	[3] =3D { XELP_PAT_UC, XE_COH_NONE },
> +	[0] =3D { XELP_PAT_WB, XE_COH_1WAY, 1 },
> +	[1] =3D { XELP_PAT_WC, XE_COH_NONE, 1 },
> +	[2] =3D { XELP_PAT_WT, XE_COH_NONE, 1 },
> +	[3] =3D { XELP_PAT_UC, XE_COH_NONE, 1 },
>  };
>=20
>  static const struct xe_pat_table_entry xehpc_pat_table[] =3D {
> -	[0] =3D { XELP_PAT_UC, XE_COH_NONE },
> -	[1] =3D { XELP_PAT_WC, XE_COH_NONE },
> -	[2] =3D { XELP_PAT_WT, XE_COH_NONE },
> -	[3] =3D { XELP_PAT_WB, XE_COH_1WAY },
> -	[4] =3D { XEHPC_PAT_CLOS(1) | XELP_PAT_WT, XE_COH_NONE },
> -	[5] =3D { XEHPC_PAT_CLOS(1) | XELP_PAT_WB, XE_COH_1WAY },
> -	[6] =3D { XEHPC_PAT_CLOS(2) | XELP_PAT_WT, XE_COH_NONE },
> -	[7] =3D { XEHPC_PAT_CLOS(2) | XELP_PAT_WB, XE_COH_1WAY },
> +	[0] =3D { XELP_PAT_UC, XE_COH_NONE, 1 },
> +	[1] =3D { XELP_PAT_WC, XE_COH_NONE, 1 },
> +	[2] =3D { XELP_PAT_WT, XE_COH_NONE, 1 },
> +	[3] =3D { XELP_PAT_WB, XE_COH_1WAY, 1 },
> +	[4] =3D { XEHPC_PAT_CLOS(1) | XELP_PAT_WT, XE_COH_NONE, 1 },
> +	[5] =3D { XEHPC_PAT_CLOS(1) | XELP_PAT_WB, XE_COH_1WAY, 1 },
> +	[6] =3D { XEHPC_PAT_CLOS(2) | XELP_PAT_WT, XE_COH_NONE, 1 },
> +	[7] =3D { XEHPC_PAT_CLOS(2) | XELP_PAT_WB, XE_COH_1WAY, 1 },
>  };
>=20
>  static const struct xe_pat_table_entry xelpg_pat_table[] =3D {
> -	[0] =3D { XELPG_PAT_0_WB, XE_COH_NONE },
> -	[1] =3D { XELPG_PAT_1_WT, XE_COH_NONE },
> -	[2] =3D { XELPG_PAT_3_UC, XE_COH_NONE },
> -	[3] =3D { XELPG_PAT_0_WB | XELPG_2_COH_1W, XE_COH_1WAY },
> -	[4] =3D { XELPG_PAT_0_WB | XELPG_3_COH_2W, XE_COH_2WAY },
> +	[0] =3D { XELPG_PAT_0_WB, XE_COH_NONE, 1 },
> +	[1] =3D { XELPG_PAT_1_WT, XE_COH_NONE, 1 },
> +	[2] =3D { XELPG_PAT_3_UC, XE_COH_NONE, 1 },
> +	[3] =3D { XELPG_PAT_0_WB | XELPG_2_COH_1W, XE_COH_1WAY, 1 },
> +	[4] =3D { XELPG_PAT_0_WB | XELPG_3_COH_2W, XE_COH_2WAY, 1 },

LGTM,
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Tejas

>  };
>=20
>  /*
> --
> 2.56.0


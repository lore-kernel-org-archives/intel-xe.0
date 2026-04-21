Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35DE0F327A9
	for <intel-xe@archiver.kernel.org>; Tue, 21 Apr 2026 06:09:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78CEF10E72B;
	Tue, 21 Apr 2026 06:09:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ErqYRcOS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8009E10E72B
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Apr 2026 06:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776751743; x=1808287743;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4OIkvdXP9TbwZuIxDnnummQpjS38tprbA7V9ZnnUwv8=;
 b=ErqYRcOSgwfUbcTstl2qPqmmz/PJCwiONo9XHfiTg+WIgrNvzNMShdtA
 6tcl+bT/cGjEF2UbwiEy0xhzbI/Px303oQd/4AmT0icLgMybUARtUWce7
 KUBqvqM3DZqLpbh5ncJHlqFr6dz5iqQ+F+qa7eaoYSDF24dP0ZRo0YRi/
 ANdyl9aasjHDXMSQmvWS7+K5fPZ773FeAyZQSlwHZOHvszMH4RRNPGKAW
 xXCBujD4UtuS852xCFfCRiZDAcuhkRNhg41r012+6UcuMDHgl25M8qo2L
 nMpe6qfUA50/PqzsI4nG69lSvkUSND6bYmB6gLnRHkRsVUUvRIyqnEHHL A==;
X-CSE-ConnectionGUID: m5cns0NgSOuS25GXFEZ9yQ==
X-CSE-MsgGUID: TbXhai7HRaSx8pXZwegt0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="89147589"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208";a="89147589"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 23:09:02 -0700
X-CSE-ConnectionGUID: 2iMJGqUJTkaLS+W9s9dnlQ==
X-CSE-MsgGUID: MoyaFKZVS0aduWwos8p0ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208";a="232218377"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 23:09:03 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 20 Apr 2026 23:09:01 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 20 Apr 2026 23:09:01 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.55) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 20 Apr 2026 23:09:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GBadxLRv2RmV0dI4aLt6XQsojKv31KyZifX66F93X+Bw3smPbnmxooLSmjcSPoi4DDI+kgNAWd5VFWIoe0fNryrQrVW6CTauXfbm/H2XgNvxsdFgh/YaS+vPsV5ND0qk9p+zTYLM3L0xDG1yyKjO1tC4+5c3d3Nb6due7CXldshFEREkonhI60omF5gs8Ijdknv0xlCGbkLBLPPUMTpGMcnFRMv+qxFqwuh/xcCbtlu+p276a+KSx6rIzHu5WHKK1q92kfmxYedyZgvriOGNmymOUJs8i8BCXGSgTuUivzSTMscV3wtGXgdUppT4rSbqSlHtzFuOX5VnLtRiWMyMUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lZILDfRh5wV3f8THr0x0AFO5oIQ8beDt0jiCFKt5FtI=;
 b=Ok5M+V7QJL6u2f3wqkiigR/ZCTMijXR3Ml/se+HKZ8JJ4VjUNm6JqUs0Mk5f7pRcOYtaUxijW8yoCBHc+7ew6yDYzQDAip4H4bnEgQ+eTAWUrirpP7b1qwgG5lUfHXxU+TV/zLpQ/81JHTLPCdvVU+YyLFdqVzPj8nskRKbaZWmfhRq8dgk1PfypQHmnJmKe6xj0HrcwYXHYFdp2zW2ajw2w62rGoSWIeqB7x4DAa8wgWHEIdSlwky7I7zLnAy+vLP+ADtHsLG4ie1ySrPrbNZWt6Qtn+/Wxdc0flL/un0s6IqCoGUWW985cWbC4+WO++Yf8nMJoL7GhOsD3UYDcCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN6PR11MB3232.namprd11.prod.outlook.com (2603:10b6:805:be::14)
 by DS3PR11MB9817.namprd11.prod.outlook.com (2603:10b6:8:365::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Tue, 21 Apr
 2026 06:08:59 +0000
Received: from SN6PR11MB3232.namprd11.prod.outlook.com
 ([fe80::bf74:5777:8849:5c00]) by SN6PR11MB3232.namprd11.prod.outlook.com
 ([fe80::bf74:5777:8849:5c00%6]) with mapi id 15.20.9846.014; Tue, 21 Apr 2026
 06:08:58 +0000
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
Subject: RE: [PATCH v4 09/13] drm/xe/xe_ras: Handle uncorrectable device
 memory errors
Thread-Topic: [PATCH v4 09/13] drm/xe/xe_ras: Handle uncorrectable device
 memory errors
Thread-Index: AQHczkPe3JLnvJN1q0y3kQ6O70S+ErXpDIMQ
Date: Tue, 21 Apr 2026 06:08:58 +0000
Message-ID: <SN6PR11MB3232AC3177251C7384108B53812C2@SN6PR11MB3232.namprd11.prod.outlook.com>
References: <20260417085812.4013309-15-riana.tauro@intel.com>
 <20260417085812.4013309-24-riana.tauro@intel.com>
In-Reply-To: <20260417085812.4013309-24-riana.tauro@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR11MB3232:EE_|DS3PR11MB9817:EE_
x-ms-office365-filtering-correlation-id: c2fed894-406d-4410-bcdf-08de9f6c7a36
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|18002099003|22082099003|38070700021|56012099003;
x-microsoft-antispam-message-info: Vu6692l9cNYqcHQDkiNyGBhaVTx2Dp9pKntZjSJEPQ/YA9h2Lv8iYM86vJxq7zp1NR80dJ/yJtrSeEJ5XOXcBpC4oEH1YJ1lzFSOkfkSGZs/y+VozuKGl5gfivICgENxuZWnOYf80JOOV4Nw8+OXjw9V8z79jmbpSdgBVtjgD8NtzEKLrLFvP/hq9870vNS8KrdDAQUisUyrYbQdz7VQtdm/ZL00ScTLbXuDe6+NibGROS8CouEF23MbtxB3FrYbF8QYacE4OE1IVj1X2lorMfUi0Ns+smhNhbDvk6Qy3lp0u65jF+aXbGEoPvFgrwpBoGNaTLLYlbq8hXSpb7dniIQl/P61rNlVYl+2QF0Nyk0+VALJxhJXbTGLiVCU7vl9AtDy4VwZ0BsOQC1VKLjXKfCaj9Z+0wNdNJzxwDmCMPIMoKB89CBlmtFHwjNDecS2kxYX3PdKqR0RuOwzsuYM4Qlp3/wmye71X3K+w3c3dTpm0GQxoNP6X4tiy40frFq44eXwmeXlZ5K4Guv8hNJnj5lkS7cM9cnV9xAvClKf5FrlcL95Q4NcO9bT4X8aEX4K+yEdsRmrzkK6aTLHvKtClVpvm+5UNbBTnoCcD5kPR94GFoLSWSXAko2m2q0faKmSihrvL3p7aTKJDzJEyCt9/XbC7qfSLP2UQDbec5S46MbyYx+wYPd5QGf4hM5YQhcQKwKq9a2PkIvn6nSExEUN3s4+sJkXy3aXTLQha0/Ylo+/iaWBztr8CYQYKitjEBxe
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB3232.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(22082099003)(38070700021)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MaHWSTM2tV2DP+Bu7gviN8neHLcnUGEcYVUcrgrZy0Us4T+4nz70kuEjBU8p?=
 =?us-ascii?Q?LakYWHDrrHJvD4JrYSBjxubLkuxYCm7Ha7VEfqUiuCegUnBGXMfEojgBmJQY?=
 =?us-ascii?Q?GA7OnE/l61ADuEqzR368DNXYCvZHWAfGcQQOwtWKE1tYY1jp2eRr+NXsk0gj?=
 =?us-ascii?Q?+FJkRGi077RV/oqPgfG5WCx84isGC2MXlltiMEqE1uTNlQbRDh1RegZxDbVC?=
 =?us-ascii?Q?ncQlzs7dbBalahOrpMjyu0CpiExQzjrDWCUKQFyW/C4neT4LrwwCklEPwHRe?=
 =?us-ascii?Q?7UNVhCw1fG5Y289yu36tuLupu79lxcCGjO+bXONcBjoxuN/7x1fQ9YV9KiAY?=
 =?us-ascii?Q?iyyTca3OC4t90zGVu8fsYn9zLrNlGn2ujJm/SOIxjraRMjIGPkyta9PDTMAQ?=
 =?us-ascii?Q?rxmEDLXHXQhJ2oTAm5rS9oBJ7J/x3QDDwJKF7S8v1WbuW7odl+RZtwynm8V3?=
 =?us-ascii?Q?qMpgqk4sZtx5z6CtEY49QFChtj3tPioONn51MDqrpBajldU9Yk3j8t0G+dmQ?=
 =?us-ascii?Q?FboqJ+DlYxlC6+PiAFu19KKuiK5c30MJ8Q4BH5OGLT8c9TlnalZRN81T9sBx?=
 =?us-ascii?Q?MCQopk6mWFork/A9Bv1W/d2c5CECmuJUAWpx6XhABcUk8+51vBpj7uyM9giv?=
 =?us-ascii?Q?DdCQGBEws1NY+rTLaiF/D7LKsEYFGlQ8qh5AjeE/ZYGkYuAeJHIKQcrZVqCH?=
 =?us-ascii?Q?BbQpsA43/5MKot+LGa5J0PBvIH9gHVC5PI6yPCFQMr3QRbEDN2N1GKWhO2vN?=
 =?us-ascii?Q?7PT/0kxUkB/LWu07kW+uLNTqRXZndpKo5h7VphiU5Dth+5xdJGilflJgzXk6?=
 =?us-ascii?Q?cbqq9f37ATDjws0SqaVEeBSMiQG3sVG2rGk2xtcCYSdrxe+wWd6OIEKswoeM?=
 =?us-ascii?Q?f7mkYiXWEnR8/V7YY4ROCtlcbMUwhRknPpCPnyleyhthu0W0XXo3+TUMCT6r?=
 =?us-ascii?Q?U2nu6YgKylUWt4xoJiBT+UGXgbP0TV8ob5PL9/bba+j+UeFKO+2Ub9yLayop?=
 =?us-ascii?Q?Q+wiCJ4gEzfJvRm3XhCKfEDB9GguqdZZHIYWdKiBpalqVhz3Yd6ks0zsEkDZ?=
 =?us-ascii?Q?XlLZqrGk8cwg8Kuouo6+ycqwc5d6JtzohtHW4PClQxU1rWNp3k0n6fsxOZLe?=
 =?us-ascii?Q?gY1vCh46UE1ANBszoJD8dmtYJngb6C1d4w5FUFP6eVnWIXzY/TN1jW5NS6md?=
 =?us-ascii?Q?20Yx8zCwgZtMTq9ekpYvZpXflKNPSfYjBQZbWRIIEKI7ll2r08Bu8UFnOpaj?=
 =?us-ascii?Q?PrUWMR8ysZbi443uMyvCMfYbJ3s7flO5Wiif86gitcQHeVAXYCXCa5g5aCzu?=
 =?us-ascii?Q?R1N7kf0HbdPa+IsyslQDqvd138SGgVKQ78wk57Uqyg9VyUm4wylLA0Fx5R94?=
 =?us-ascii?Q?wVnpxPnlUxFAdfT76kTymFK2AQVNBqN+202V2+GIwxuCV3v8LVctEGdJQLxM?=
 =?us-ascii?Q?MykumD6tJ3h7gJcX3BwMpwN4TDtLftnXw6bAz2+g2lLDjluYgiuarR72rY32?=
 =?us-ascii?Q?EfarpEdQLjmYH1wilYqoaQrDB62Gz2O0AFhZNQtyditKmdV3wsAaPPgaAXDF?=
 =?us-ascii?Q?6teNP3CipKS3rHPGJN3B848P2Gf0Q0Dcy22+L2R/phQ2IuMfmZzXGcpKcWri?=
 =?us-ascii?Q?tTtISJjaY1ICI/86EbgTm8tfD77Bg1cwuV8XRnne8yqwzFfC9KEPk8J4Cxv9?=
 =?us-ascii?Q?Cw/PoZX9u7NRE4lFDNTq590NuRYRoJpjfE1LXY/7KyySN9aNKYY0Fh0isvfb?=
 =?us-ascii?Q?IrKgizr1OA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: NZQFscUbDj8KIP0jU84hwBEr/OPM9+nWyypMkvaIvAgik5+XNJBQScnZyCIjP0CWzJ6h723SWoqcEfHi+6heo5BvbRhrVin13xsn7sbLLYBiV/c3rjG+sXChseuZwNKxqQ4mK1rOLUYiykgEJfuf45p1gn6zxRHL/uEhZecOHh4w2GdaRuGr1dKM1c2GF5JXdxEN95KPnaVIpKw7jgci2ZLfWEdH/mlAYITFlMHiG9rFCq2SZuNeuYtio2H5/BfkI/wc2d75CwL6XsQ6TFML7ewG1NCamfwJiCXXyevow0tn/Ng/b83WZ9b0r9pz1aEozSPAmx+Jm7+UEJ07oR4sSQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3232.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2fed894-406d-4410-bcdf-08de9f6c7a36
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2026 06:08:58.8331 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7aMQUwI29+BVNN/b0cOmnnlcS+iPvdecRae6wgMh4cRqUh/LlYwCRvLzijiBbAl6IjcRFib49nNNVpjfK/keTmkbWnVFHWwwQkVk6Hf8E+8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR11MB9817
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
> Subject: [PATCH v4 09/13] drm/xe/xe_ras: Handle uncorrectable device
> memory errors
>=20
> Add support to handle uncorrectable device memory errors. Double bit ECC
> (Error Correcting Code) errors are logged. These will be handled using Pa=
ge
> offlining in a later patch. The other memory error categories require a
> Secondary bus reset (SBR) to recover.
>=20
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
> Memory offlining patch will be integrated once
> https://patchwork.freedesktop.org/series/161473/ is merged.
> ---
>  drivers/gpu/drm/xe/xe_ras.c       | 23 ++++++++++++
>  drivers/gpu/drm/xe/xe_ras_types.h | 61
> +++++++++++++++++++++++++++++++
>  2 files changed, 84 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c in=
dex
> 5010cf6211ea..347844b3d2bf 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -138,6 +138,26 @@ static enum xe_ras_recovery_action
> handle_soc_internal_errors(struct xe_device *
>  	return XE_RAS_RECOVERY_ACTION_RESET;
>  }
>=20
> +static enum xe_ras_recovery_action handle_memory_errors(struct xe_device
> *xe,
> +							struct
> xe_ras_error_array *arr)
> +{
> +	struct xe_ras_memory_error *error_info =3D (struct
> xe_ras_memory_error *)arr->error_details;
> +	struct xe_ras_error_category category =3D error_info->category;
> +	struct xe_ras_error_common common =3D arr->error_class.common;
> +
> +	xe_err(xe, "[RAS]: %s %s Error detected", severity_to_str(xe,
> common.severity),
> +	       comp_to_str(xe, common.component));

don't need \n?

> +
> +	if (category.ecc_error) {
> +		xe_err(xe, "[RAS]: Double bit ECC error detected at sw address
> 0x%llx\n",
> +		       (unsigned long long)error_info->sw_address);
> +		/* TODO: page offline handling for 2-bit ECC errors and return
> accordingly */
> +	}
> +
> +	/* Request a RESET for other device memory error categories */
> +	return XE_RAS_RECOVERY_ACTION_RESET;
> +}
> +
>  static void prepare_sysctrl_command(struct xe_sysctrl_mailbox_command
> *command,
>  				    u32 cmd_mask, void *request, size_t
> request_len,
>  				    void *response, size_t response_len) @@ -
> 217,6 +237,9 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct
> xe_device *xe)
>  			case XE_RAS_COMPONENT_SOC_INTERNAL:
>  				action =3D handle_soc_internal_errors(xe, &arr);
>  				break;
> +			case XE_RAS_COMPONENT_DEVICE_MEMORY:
> +				action =3D handle_memory_errors(xe, &arr);
> +				break;
>  			default:
>  				xe_err(xe, "[RAS]: Unknown error component
> %u\n", component);
>  				action =3D XE_RAS_RECOVERY_ACTION_RESET;
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h
> b/drivers/gpu/drm/xe/xe_ras_types.h
> index 4f640124f38f..020e3f92a057 100644
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -199,4 +199,65 @@ struct xe_ras_ieh_error {
>  	/** @additional_info: Additional information */
>  	u32 additional_info[10];
>  } __packed;
> +
> +/**
> + * struct xe_ras_hardware_address - Device memory hardware address
> +details
> + *
> + * Hardware physical address structure for device memory error reporting=
.
> + */
> +struct xe_ras_hardware_address {
> +	/** @column: Column address */
> +	u64 column:6;
> +	/** @bank: Bank */
> +	u64 bank:2;
> +	/** @bank_group: Bank group */
> +	u64 bank_group:2;
> +	/** @row: Row address */
> +	u64 row:16;
> +	/** @channel: Memory Channel */
> +	u64 channel:8;
> +	/** @msu: MSU index */
> +	u64 msu:8;
> +	/** @reserved: Reserved for future use */
> +	u64 reserved:22;
> +} __packed;
> +
> +/**
> + * struct xe_ras_error_category - Device memory error category details
> +*/ struct xe_ras_error_category {
> +	/** @pma_error: PMA (Power Management Agent) error */
> +	u8 pma_error:1;
> +	/** @ecc_error: Double bit ECC error */
> +	u8 ecc_error:1;
> +	/** @poison_detected: Write poison detected */
> +	u8 poison_detected:1;
> +	/** @parity_error: Parity error */
> +	u8 parity_error:1;
> +	/** @phy_error: PHY error */
> +	u8 phy_error:1;
> +	/** @reserved: Reserved for future use */
> +	u8 reserved:3;
> +} __packed;
> +
> +/**
> + * struct xe_ras_memory_error - Device memory error details
> + *
> + * This structure provides detailed information about a device memory er=
ror.
> + * Cast from error_details array for device memory errors.
> + */
> +struct xe_ras_memory_error {
> +	/** @category: Device memory error category */
> +	struct xe_ras_error_category category;
> +	/** @reserved: Reserved for future use */
> +	u8 reserved[7];
> +	/** @hw_address: Memory hardware physical address */
> +	struct xe_ras_hardware_address hw_address;
> +	/** @sw_address: Software address where error occurred */

Introduced but not used, can be moved to next patch?

Tejas
> +	u64 sw_address;
> +	/** @log_array: Error syndromes associated with the error */
> +	u32 log_array[8];
> +	/** @reserved2: Reserved for future use */
> +	u32 reserved2[2];
> +} __packed;
>  #endif
> --
> 2.47.1


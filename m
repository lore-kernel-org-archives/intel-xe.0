Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF4C5C25B75
	for <intel-xe@archiver.kernel.org>; Tue, 14 May 2024 14:32:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49DD010EA0C;
	Tue, 14 May 2024 14:32:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h177I5XS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0DB910EA2D
 for <intel-xe@lists.freedesktop.org>; Tue, 14 May 2024 14:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715697147; x=1747233147;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=+dvyDi+apfIGGcmthEjE1c7GtWquv/ArY3ex14QCSeo=;
 b=h177I5XSssXWCDHZfthXfS6PjsKoQqXEC9wEw8+HzTBsezElK3QRIA+M
 ejEgdvzM+2VuR6wx/wql//nUY/NR6k1/Z2KrKnpBpS+sH63dpN+MlR+D2
 2KovPSzDKhWvsb71flb0LhMeWxadh4HQHxY0Sj+uhMQ5Ho1iHSX6tcGzb
 4MMFiOXm4MBF5MT8bk22kxSUVHiunKEtFMxzXBRL7mSNGFLx5HGZn1SnD
 JLzN91rxiGszBu4SY3M2DOhE3oP6KovhHb55d/xmh05USNUGluLw830hh
 aTnuqbAXHn63Tt0kXkBR1G9MqaZ94Kit+rmfA6BcG+N7qc8bx/4veIGLq g==;
X-CSE-ConnectionGUID: /sIh3NQMQE2gnni6h22scw==
X-CSE-MsgGUID: HP7weOsLQZiOkMfHmTVH0g==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="11850636"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="11850636"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 07:32:27 -0700
X-CSE-ConnectionGUID: imuamqK0Rci11QrjGzagzA==
X-CSE-MsgGUID: m2rjTVPfQH6H2p6Nlukpog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="30649035"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 May 2024 07:32:27 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 14 May 2024 07:32:26 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 14 May 2024 07:32:26 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 14 May 2024 07:32:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ECMyypoaPgMscFvFXb5LdxF0K0Q04+pPKDKwT28tuRAt9CWxTHaNd2H1FV6RWfZ1cMfVscIXzu187056IHH2BK6AhSJUoEZYcXwGfEzKUYIAADNTb7gZJrMMYZ7cCJos0isjolyc/nJjnKg6I+fThAjmOXsPAaspeZIePT4dkXjKisbLHK+6tFNVvr6bgWvff/1jSheLcjSmUCWQ7ZZdaVcmEXw+Ou5L3khYJ0GRJkbdZySwB+lDe9ptKV4pxKv+d38xrnSI0+i5sJwkXkB2FQhqWRCTz5qNY8xss/rYnK5J+LOSade8OId/rjEBiMdRobt9g1NSVEKLewIQKQrVdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XqgkKtjXarI+aP8/Z+YOwQOGQxC99NBL1bBCU6mDXp4=;
 b=filcqHutBynML/rfIydwKg+XFdMHY3Itw/zVPgxQGmN9ss9IVpB9hYkRlSSFobZCYEUKyckFPdNsm+v57d2SYPuz8m7dXcB4dJR67G2mgMCxO5eCXkTdFPIOJVzxnHD76iuUfIff1ONsBuXREEE/KetsEW24DTe0Xktq/Z1jd/xK+jxq388SbNaZMvsmp5hZQ414b5NzXLBNoiMSUg8ohTGZI6fRK/D0MzWcm0q2noEDi6qg2nEODXAScMefvxsHVEU8gCVoxW69wCAQCvMPJ6cVnCKqoROtmKg1Yh+t1vq45dA3GjsltkCkOiMbXGKgxsVTCNIWGXokhKFh9PycnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by LV3PR11MB8555.namprd11.prod.outlook.com (2603:10b6:408:1b0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.25; Tue, 14 May
 2024 14:32:20 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93%3]) with mapi id 15.20.7587.025; Tue, 14 May 2024
 14:32:20 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "Welty, Brian" <brian.welty@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Brost, Matthew" <matthew.brost@intel.com>, 
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe: Use distinct error code in VM_CREATE for device
 fault mode checks
Thread-Topic: [PATCH] drm/xe: Use distinct error code in VM_CREATE for device
 fault mode checks
Thread-Index: AQHaldiZx5K1d94NUE67st/UyAgrR7GW6wDw
Date: Tue, 14 May 2024 14:32:20 +0000
Message-ID: <MW4PR11MB7056BE62A0ED6EDA912E0EC4B3E32@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20240423234707.6587-1-brian.welty@intel.com>
In-Reply-To: <20240423234707.6587-1-brian.welty@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: jonathan.cavitt@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|LV3PR11MB8555:EE_
x-ms-office365-filtering-correlation-id: 495a204a-9fd6-4a49-d5c3-08dc7422a9a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?rQLGzseB0lx+dZpjS03b/O9uVCPGTZoI6TFYWZh64rLg+wSyu+W6FSpQ9loZ?=
 =?us-ascii?Q?vhKbOlHZu7YcfHwlK/4seCs6cjYh6u6hbVigsW6Vik6IwCDB/NBraTH0CU74?=
 =?us-ascii?Q?JKknK6VOqrVXdTRPt1AwmR8VHNVG6Nz9BwNHAHaE4KfoYfkRCNHeTL9AOiiH?=
 =?us-ascii?Q?Pyd8YPoSrDffjRqc8/lmgU3YgMaEV5KDf+tY80K+A2ooo7qcb+cuzs2TWLAL?=
 =?us-ascii?Q?aOMt8CcfkFENFMSEE+quXPqitoeoLLpFe3hCOK+mMqXMAiHMx4MVSkc9Q3Pu?=
 =?us-ascii?Q?zw49HaSOAgX4es3eDcBu5tvDasndcsJ5P6vC9/60G7g/MRWGccbyY7y4dBKJ?=
 =?us-ascii?Q?zqA1fcA5pIRYw8iehO6+P8J7MfsxHNvRPasSuBN1YLjWHNmZZ83MeWc7EiCp?=
 =?us-ascii?Q?dckSHfjAan37dC7Atqar6nZQkOoaE301l1Gpn5hrebvWGsm/x51u4neLe3jY?=
 =?us-ascii?Q?W9TBdMhRqmvnwq+j/+1iq6SC4KKkeUU9tfHDuoPAdMufjb8N4mE1BfPZIHqk?=
 =?us-ascii?Q?KRiaAW/giNVOzddQBhmoCRJWGA+n0RX/Z+3Q7K0A5qXXbgwsK9dxnKW71TS5?=
 =?us-ascii?Q?/ImvEa2P+Cd9LzumXH23DAWzaYTN/2MSDnovn+5eCPT7DS+8hKloahWGKwvV?=
 =?us-ascii?Q?wq2SRun+rRR7uGfbpdHp0Wlbv/0TMOTL82dzasdfmuKGKd3/FLsie+BuVZIe?=
 =?us-ascii?Q?ugWWdEENVFVa5Z2S//H+WBHae5kJ9t/o7ovz13icNos16Lt8kLLHsbrKmll5?=
 =?us-ascii?Q?J1DKDUjCm5zJ+g2CtQcXhJwKOkAz7aK7YY17+SivKVKcAF3GhKfdwAjK4Q3S?=
 =?us-ascii?Q?d5uSQSp12otvgrrvWJAzKJwQBuiwkalNWkYQ5ETP+CMxFLS4XY5Q5iSOq6/3?=
 =?us-ascii?Q?+72s6hl5Vqt3wYYYJyNBOq11xI8gMJECNGgQ7oaKZFgVA3+BNm8M63JayBwr?=
 =?us-ascii?Q?UfmONXeJRS8rcnv50InLH17tbKFEjO/IKteTnIYmldTy43o5t5603CrNaRoA?=
 =?us-ascii?Q?upd3QrD8g05IgWi8cu0VIKaw6oyw3RY6uQM4IXD23vvRILGS5tYO1LYs2Ie4?=
 =?us-ascii?Q?9VsmAg3ksKzigKvKoMXchUTvs1wWGClyJFO2/rLd4ZvwnMDIqFgDd4l8LmZ8?=
 =?us-ascii?Q?A3F9Cx+ansG/WF2pIPM3K5+IwRrQyhxwUNrLb0IDLO42+pNSAMWnUDnx3UXl?=
 =?us-ascii?Q?wVK7UIA+ez7gPXUyBZY4ZIOfQpO2CYl29HoKzF/m1Q+W5oX3zHFKKRFZnIpJ?=
 =?us-ascii?Q?64bti1YJhR8ZjV2grI7/sZxEP4cU3tmrLxJvFEirlSHcoIYyN7kWbK2qTGXH?=
 =?us-ascii?Q?kNG13e1S0tscvsiBpPj234i2Tfvc2Wmc6KH8iICnOjxMsA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Bga0gQ3Ir7LuhUdOhTeqf9v/Tfc0TvxYNO3inqdP6m2Lnn2Za3n1pETaFTsI?=
 =?us-ascii?Q?Ku/3CFc/OBrrXJg66XfQoGMHmxvJR60XHTXcOd/bKo4AsVAAOS+rRNY5z+fD?=
 =?us-ascii?Q?QTf7oEl3VPFlduDCFoy9d6f6fL0havBk1/65luJMVvO0/hWzWbgYH8pe6QEC?=
 =?us-ascii?Q?W/xnLp8vCqI2MrMydMTkvzhxILic/snXh4cyRbAHwhZF/6xbysyzMGecBoYG?=
 =?us-ascii?Q?6PGsdqb4a4tuAiUTleqmpIeG8qucfYKuLrWiKsOwea8J0AMzI7Dgl2RwcmkZ?=
 =?us-ascii?Q?G1d5wgWalpmQHzDDMA7YNnd14OBkfJ766z453z7MZeIFN6Z/Cd8vttH4MA56?=
 =?us-ascii?Q?a6gpBAo0ecif7XXZDWHdT52qUQnA0FtyapN5dgAg46/Ka0S9E2UFbGcfM9ts?=
 =?us-ascii?Q?Q8PkroTvTp/L3ukt12PIK4ClywR5Rp195XEmx9ExzROX5338nRUB9P0m7YrN?=
 =?us-ascii?Q?vvqKipeECE9e195riEpd8ErrSiv+BCHjDcPCv0fYLuBhb0Y8pO8n22CdUgKM?=
 =?us-ascii?Q?cscsjEOFprr3QtdtZ0XPV9xp2G4/8wRexnrOKiAEOx9FkRH22x4kS/32+f7t?=
 =?us-ascii?Q?73VknA8+n6Fimy+CAAwXJIJ1TKCucTvwWl7n9uWsACypyjF1plEkiYafVZiT?=
 =?us-ascii?Q?udhagf982oAUtqnv+t0GMfLXkYuDL/rNh/Db4uWdnw62litMAZZzob+LD5yj?=
 =?us-ascii?Q?PKUuOE0SHaYcnkNRU42bnK/d53mNpv+VRcdvNNvnPPeb7v4STiPQVujgL0hg?=
 =?us-ascii?Q?tPfx6DKIuWoU4XEnu7yAOoq08ZkQw8sSnmqBOC/pu+ZL012kKKggcA9UiqSz?=
 =?us-ascii?Q?IGmIsF0a2frMDaoQZs1I7v70sSOvNUnmP3vyXnbTEAQiffxpiYQ0C0qsQYHH?=
 =?us-ascii?Q?zQ4nFQqtPksD3FkyWSSqzAt+9uCn/gdVaBK/BSJSQOsOyQ3Vm45Jx/Uimvx7?=
 =?us-ascii?Q?EETJSnu4ZFzUua8yvaR5VrXn7cIetjolQE4k8KEZpFiMTlAdw0yyC4kVvuv/?=
 =?us-ascii?Q?DciXE4a0o6VKcm1xwoBsQ6f5nLjtOP0VF6giCWu+yNZfFOZlaMqBXoHIHogc?=
 =?us-ascii?Q?Sx8pByKeFCcqSHnbE2/zRDrhrvSu+QAQka5v3KON0Bn7tw2iSNps/6dNHWUa?=
 =?us-ascii?Q?P/6z1kLvknf0vQYM632clPiV8o+pepKd1qvfmx+tgwD9OTWtQHr0951MILAL?=
 =?us-ascii?Q?JtRzfyfUTavD34+5hpIBHDGf/QV5dvPo7ot3IUcYvGfbPTknsU4TH+bLTxXj?=
 =?us-ascii?Q?YOPyBQIwrioBxmg7ml552uPIQMU+gIrr0erVpjKhj9eeizYNeiSjkznHtTiV?=
 =?us-ascii?Q?BCw7SVjjlwsOWMBI1TkusCdjfBczMnwajIMVsB1QQNXz4/TgUNiqMM7Yud8E?=
 =?us-ascii?Q?rpeeUinQIaTdqmgpHHFnaj4FRkCzhtvKPQlXcIzQc8kuJMehQfZSA7GNxKSM?=
 =?us-ascii?Q?Kju/lr/oL+eoiR8aXuC+eTCjIoiYL5tWk1FufwZSHFK3zHyGeJIx7fkx3otw?=
 =?us-ascii?Q?xXTsoHIERq4Uu7G8z7unHp9SDEkT0UvNZhao8u3WJNwlzIV82JEHIXirX3JD?=
 =?us-ascii?Q?YIOZ2N8l3JQuyGWl5tDyHDRZh+tsxTokTenaLwW2dOrht5XzK6hscWxCZkMs?=
 =?us-ascii?Q?/A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 495a204a-9fd6-4a49-d5c3-08dc7422a9a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2024 14:32:20.3165 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MAXSYIGjfKTWmeVgCLfeaNdjFm7aHLx6i8L8+zpckwG2xZGJfr1gQyabHqkm/zILJUxsT5zX/wXnbHP3Crmpn8HfIWA6gF99yKXLfQ+Rmis=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8555
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

Cc: @Cavitt, Jonathan
> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Bria=
n
> Welty
> Sent: 24 April 2024 05:17
> To: intel-xe@lists.freedesktop.org; Brost, Matthew
> <matthew.brost@intel.com>
> Subject: [PATCH] drm/xe: Use distinct error code in VM_CREATE for device =
fault
> mode checks
>=20
> vm_create_ioctl doesn't allow creating new VM in fault_mode while existin=
g
> VMs are in non-fault mode, and vice-versa.
> This is not necessarily the user doing anything wrong if others are shari=
ng the
> system. Instead of returning -EINVAL which suggests the user provided a b=
ad
> argument, return distinct error code of -EBUSY for this class of errors s=
o the user
> knows they can retry the vm_create when system is idle.
>=20
> Signed-off-by: Brian Welty <brian.welty@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c inde=
x
> 85d6f359142d..e8628a982db6 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1840,16 +1840,16 @@ int xe_vm_create_ioctl(struct drm_device *dev,
> void *data,
>  			 args->flags &
> DRM_XE_VM_CREATE_FLAG_FAULT_MODE))
>  		return -EINVAL;
>=20
> +	if (XE_IOCTL_DBG(xe, args->extensions))
> +		return -EINVAL;
> +
>  	if (XE_IOCTL_DBG(xe, args->flags &
> DRM_XE_VM_CREATE_FLAG_FAULT_MODE &&
>  			 xe_device_in_non_fault_mode(xe)))
> -		return -EINVAL;
> +		return -EBUSY;
>=20
>  	if (XE_IOCTL_DBG(xe, !(args->flags &
> DRM_XE_VM_CREATE_FLAG_FAULT_MODE) &&
>  			 xe_device_in_fault_mode(xe)))
> -		return -EINVAL;
> -
> -	if (XE_IOCTL_DBG(xe, args->extensions))
> -		return -EINVAL;
> +		return -EBUSY;
>=20
>  	if (args->flags & DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE)
>  		flags |=3D XE_VM_FLAG_SCRATCH_PAGE;
> --
> 2.43.0


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95AF0EB64D9
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jul 2023 06:04:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39A7F10E078;
	Tue,  4 Jul 2023 06:04:52 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 645E910E078
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jul 2023 06:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688450690; x=1719986690;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=DM5Nz0LLa9ICtseFi+MB6i3Q6csaHPU5xWvM5Tm+/9w=;
 b=D+5teHCb28pz0JHp58A/fEQSQht4UzEoUBl8/Y40b8ec4rZHfc9Dcswc
 z3QRkUl79dcb4fqnY+Qb5Ljutw6wIkkaBBF+aEUs59tBkgYuAv5eQUiNA
 YbM/M05I7bA/utB3VET+PmJeG5sxGNSWTvDPBgnnxYLgoS/xfTpTTjC49
 aPb9L2qJuINQeYKaiSSHBFlJvAI8/eS/MXmvLO9+8osUPEE34pRHuGVbX
 QgmMpPtpzh5+3+JYMM4k5AATQ0RjJL3el9fG6B7sCL60SYexaa93vMOWD
 nxybEAOQ6jta/KT31kizdKeQPxFrjX0IvrTk7wJFpkGuZzi+WC1taf3MW Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="361905820"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="361905820"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2023 23:04:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="1049280480"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="1049280480"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 03 Jul 2023 23:04:49 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 3 Jul 2023 23:04:48 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 3 Jul 2023 23:04:48 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.102)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 3 Jul 2023 23:04:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GmyTSeEtk+YAGTCwD9MtybD5/CzmMgT6rWTuc1tKWDF5rSknEj5ABxjLNMtOqyeD4Ms18Pw9rZ9UGy8F+NB70G2dVbMhVtCgxfiSQ4STV0ReepnjV+oO0TKrIVgPnBLdIl1UCjfPhpMp2vngUvC9zdaLZuRWueQdmtdpn1a2//GElLhlFWZK+zMRv71+HyXgmklaazgDrSl3Xde5xzCKZfTqZ89TUyAuQBsjBBhqapTWvHvYbAv9gi/M2ehw9gcGtkm0LiGLpMaUTmY4EaBjMxfsnUClPy1jyh0f7/c/CHwqLN8xtoSmV2C3JO9QlKuvRfW4x9z79MXHxVAOmIJm+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x1TtaRKV5XhN07qaSOlB+1YglosvCrNYA6oyVHG5ozE=;
 b=Y6+yrRkzC12jD81c5lMcXXBYHgYigLJPSZiVRbhU5vMzXQCIE38ji9NSf+o9usH9Q2i0eiiYc6fww7mz999yDX1P/eR339VrJezwWDgx3zSmVL/pdDXjCZPFLFr5HFOxZUDifUe1OJUTeoTf8sex1gUTIpWlm/zmPchoq7R3PnnClAiEtInhRKed2EF6gPz0LjXoAAgIVNXn7zPP/8AJDmWQG0EiK2zKmjEnzDSeNonWR6nCybiCeok2yN9sEnCoE8zXbQ3s1Qnttiqr1DvXXeGkHt7GOIihnMs0GnBDRNpmtH6+JVo2L85GCcN4Oiwxuh4mhAS+H507tdEDbtKFnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SJ0PR11MB5789.namprd11.prod.outlook.com (2603:10b6:a03:424::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 06:04:46 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::fa3:7378:70b7:a21b]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::fa3:7378:70b7:a21b%4]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 06:04:46 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH 2/2] drm/xe: make GT sysfs init return void
Thread-Index: AQHZrY6v3YuFuiRbmUm+ilRsT9Qnca+pHkEQ
Date: Tue, 4 Jul 2023 06:04:46 +0000
Message-ID: <MW4PR11MB70566E98014B9C9CE174881AB32EA@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20230703091933.3832500-1-tejas.upadhyay@intel.com>
 <20230703091933.3832500-2-tejas.upadhyay@intel.com>
In-Reply-To: <20230703091933.3832500-2-tejas.upadhyay@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|SJ0PR11MB5789:EE_
x-ms-office365-filtering-correlation-id: fba1718d-a558-4ebc-3089-08db7c549169
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gbGj06KxTozgaw5YwsoPG1COpOJWIvoLxw75DBXGewajQDn87zYm/CKhz5UBDS5UhBFhOC05giheB0Ype8SXi1uV1J/ZBKTK/ZQY2QEGoxccdNFSnFEH9/l6IdHffFC5o7QxaNyuJk8kd0vaVP42fXwKPXrF2lZmnIH9m2a+vjnbYF1gKdHjMN09f3qoJl7wBnnmcbkDhU+/h8Dh7hX1K5hbssgwWbfO0mDhtUMAWSc9vkQj9HwhJSNvSifGvzBfuo1cymJTMRwLzhhyljIueY8CLRd35AALJRLQYQ5LdQcrgnxiRS9MWxiZgT0fFAqx6Nx0lj2l5yA/waHfAm3DeQfY5Q4PfPhz4LwDjPqcwGXxjVf9oONW/y1Vd6QpqJ4bGpLK9d/Xb80q3TJ+mA7mWX1J7vTOE6V+/c3uNq98X9h2zeajOU7EjWUxMhUHE+/vGtYQBZmxOfne68CqpexufUIxn6ry6RsKcy1jy1gZSzNu8Cf9PgVdZPErzwa7a4E5/5AyDGQ+L5pVnITEpNjYQ0q1OhacW6BYd1YYz31tFSctKl+RZLT70tpmBkHRlHQ6jeBH6SROtcl4r+jJl9nOa0vvz5kqQSo8bF6pjhgvOAbmwMd2+umgPbarZBnZKTun
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(39860400002)(376002)(136003)(346002)(366004)(451199021)(38100700002)(71200400001)(33656002)(2906002)(7696005)(38070700005)(8936002)(8676002)(110136005)(55016003)(41300700001)(5660300002)(52536014)(478600001)(76116006)(9686003)(64756008)(66946007)(66556008)(186003)(86362001)(53546011)(6506007)(66476007)(66446008)(26005)(316002)(122000001)(83380400001)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3t2+W2/7pFZyP9aRJ6KRgsuA0LP2VceF8Oh7eenJ5l440B8sPRH5nKPyS1E2?=
 =?us-ascii?Q?PtBgibokZoRzRaFp8ZHLqRjxRJ+5Qgo7UPXXs8wcfVuo9TARVdY/BhkmdwfX?=
 =?us-ascii?Q?UbMNKA+iMpT3cNHrIyqqnj2jgCs/UIp4M6RhAYhjSnTEQJpE2aW0dQhrgErN?=
 =?us-ascii?Q?CPSU9a121/au+gF+bLadXMuE4nuVdcbmG9UXB+DI9Vs7PTAyU3Z4a5oCIfYZ?=
 =?us-ascii?Q?Oia99zA3aba708U9Os8F4YVmF/NuUDZFnbE8dUl67n0jVdL1dc3CzMWpB5sn?=
 =?us-ascii?Q?0gKOXDMrUNO3MHZgxj7V1Vnve9bF84KrW43yI1AP40TZvQX58OoXh3ulRVn2?=
 =?us-ascii?Q?iCPgbywb9oPUqN27VTPGf3Mk7Lm9dOW0HjxrG+lDQx6K11zkaccGy8CLdW89?=
 =?us-ascii?Q?EE1kzUV2DDnFzZxPP3nOxzTL9h4yGARLvt5b2tIQSlJicEY5vm2VN4M2gRvX?=
 =?us-ascii?Q?5xRUi1mkOx9VCBucyr6r6dWlIrIl2hfi9owzMEISRNVcKWtXvBjaNmQ/HC6J?=
 =?us-ascii?Q?b8R9tlBii6Hp0mzPACQ6S87RVHccnpxIn2hPH1zkUHenefnRdxXqN6gd/0Kr?=
 =?us-ascii?Q?chRAWUqTRm/5zdQy0Z+NOamqgZxFu6wNqin52ronnWWptkQu7Af6R29OeOg1?=
 =?us-ascii?Q?XFEXpJBC9BaZe+lqe8Lj3j5FazLWh/PsHU2E2KBenw5HvObPuxTpInoSYoI/?=
 =?us-ascii?Q?sgtnKP4Sl1sD8uemQBzINl/8fuggKjXFSxdc9s5ysSBScSmeDG/lXl0e7cjh?=
 =?us-ascii?Q?ILlb+Fop9wWQlz0PwTOG9sHQjmmRlg3oucoji7vHlUpDiRvTdkx+p/XULT9m?=
 =?us-ascii?Q?a8Qdlh0soLyt6SapBeUfhyb2pVYJA9Yoca8HFe5dYaJ9Vp9qrN9lDL3mhgmF?=
 =?us-ascii?Q?tUkStkuNMwK2BXH/Y73ESNEJ7UgU2MKk61F53v3paapqGKKNXhFOfQwvcDX3?=
 =?us-ascii?Q?1+wLFZuPCPD5/9F7iFLLHKZYMauMYcSgEuHv2h3U20ae2MSOEEU1Z2AGLhc+?=
 =?us-ascii?Q?6xJMIv0rARD8P5o5atrT7MsSCR2H5zfRWbZOvzTCirTbroAstJTl+vuZL/oW?=
 =?us-ascii?Q?yfpkMHbkPbKcwLgJrMZ28ZNmHWkNeLsf5WP0L2BBH9h15aBbCMKGpJL2nQE9?=
 =?us-ascii?Q?NhOm+NeQCkojvqkvVPHjqTB11FtecIWylFK3Vqqdx5w5ACHNlW57O+4mSh9u?=
 =?us-ascii?Q?TiUErler8MuCkfwOsR3GSflCtDdHaa2QMBFjcC5L47LezhDtuQFBHvi8vLGy?=
 =?us-ascii?Q?+hnzLr9koY5WJ8jMW4SuqfM7ztTM6PC9V5xKYJGkzXj0wpCn48JJymQInpzY?=
 =?us-ascii?Q?qAWxTwpXOJ1At+DIQS05jDKZZ1+odfggErf0l8AKG99UIBfzLpjhHJ04M6L+?=
 =?us-ascii?Q?vC5DZJcMRA2Tq54bBremArTXoK64GHGturAmbjo8s/vIlUQ2zOabEbC99Myn?=
 =?us-ascii?Q?mjtY12Mw0aF3o8xke+No2sat+IsAQk75zHl1zkyUgIA1ThFSagjg/pRimUGf?=
 =?us-ascii?Q?XTyl+u5s/nIdt65iQ0oWq5L8ZTH+TJbqq01uV8DT43M2G66LxExOBzltG+LY?=
 =?us-ascii?Q?Z9u3NL1fCvat9mBscB9zvWsYgAHNGY6TNmgHd/8lh5Lxt1C1g1qkQlS452ll?=
 =?us-ascii?Q?Cg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fba1718d-a558-4ebc-3089-08db7c549169
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2023 06:04:46.1540 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LSeDx4NB5ezLrVF5NydXb8KRpw/tOh93YBGeqFQb04VMlmpzS2g7hnXGCw5E+4wIe5V1kKalLNz+xAMvudbf0Bzzcqg/cCZjjqG6xhcaDaM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5789
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: make GT sysfs init return void
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

Hi Tejas,

> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Teja=
s
> Upadhyay
> Sent: 03 July 2023 14:50
> To: intel-xe@lists.freedesktop.org
> Subject: [Intel-xe] [PATCH 2/2] drm/xe: make GT sysfs init return void
>=20
> As we dont use return from xe_gt_sysfs_init, we should make it return voi=
d
> to make it proper return type.

In case of failures add drm_warn with possible reasons explore strerror.
Don't return silently.

With above changes LGTM.
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

BR
Himal=20
>=20
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sysfs.c | 10 ++++------
> drivers/gpu/drm/xe/xe_gt_sysfs.h |  2 +-
>  2 files changed, 5 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c
> b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> index 2c47059bef42..4ecbd972e6a1 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> @@ -29,7 +29,7 @@ static void gt_sysfs_fini(struct drm_device *drm, void
> *arg)
>  	kobject_put(gt->sysfs);
>  }
>=20
> -int xe_gt_sysfs_init(struct xe_gt *gt)
> +void xe_gt_sysfs_init(struct xe_gt *gt)
>  {
>  	struct xe_tile *tile =3D gt_to_tile(gt);
>  	struct kobj_gt *kg;
> @@ -37,7 +37,7 @@ int xe_gt_sysfs_init(struct xe_gt *gt)
>=20
>  	kg =3D kzalloc(sizeof(*kg), GFP_KERNEL);
>  	if (!kg)
> -		return -ENOMEM;
drm_warn due to OOM.
> +		return;
>=20
>  	kobject_init(&kg->base, &xe_gt_sysfs_kobj_type);
>  	kg->gt =3D gt;
> @@ -45,14 +45,12 @@ int xe_gt_sysfs_init(struct xe_gt *gt)
>  	err =3D kobject_add(&kg->base, tile->sysfs, "gt%d", gt->info.id);
>  	if (err) {
>  		kobject_put(&kg->base);
> -		return err;
> +		return;
>  	}
>=20
>  	gt->sysfs =3D &kg->base;
>=20
>  	err =3D drmm_add_action_or_reset(&gt_to_xe(gt)->drm,
> gt_sysfs_fini, gt);
>  	if (err)
> -		return err;
> -
> -	return 0;
> +		return;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.h
> b/drivers/gpu/drm/xe/xe_gt_sysfs.h
> index ecbfcc5c7d42..e3ec278ca0be 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sysfs.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sysfs.h
> @@ -8,7 +8,7 @@
>=20
>  #include "xe_gt_sysfs_types.h"
>=20
> -int xe_gt_sysfs_init(struct xe_gt *gt);
> +void xe_gt_sysfs_init(struct xe_gt *gt);
>=20
>  static inline struct xe_gt *
>  kobj_to_gt(struct kobject *kobj)
> --
> 2.25.1


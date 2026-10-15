Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B77CC6B38
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 16:48:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFEEC10E040;
	Thu, 15 Oct 2026 16:48:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FEA910E040
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 16:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792082910; x=1823618910;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gD3U4k5AOHDuspIsqCnmNcp/Xv/Np6qW6x6v7bRJf+A=;
 b=mlmBPtY4vW0g3ct2HEr5U9eNjYWmslKvm+0tL6S2z/tUoUYYRTmZmOOz
 l/dIEzuiqc2ae3FbDEHYUb3XC+dZhDWj4HP+aesCv9sGe4kNPyYLFlGJG
 hfdYHZEMuMI28Qb379JaTWwRPQ+12Vn+DEIjRq9CzSL2zcMCIolDsS0W+
 C61jHe0+ROYDkW1MLGWKHGj2lTzXZhtUX/jd7sTVmVBTKmrmhRI7xx0KR
 w6W0izOI2bWHWXmuLGI+/z8h9J35fpCZbe77mbgtDKuQplGB6AVQZigew
 DFkQveehiqVrw06tRq9h6CJkxYNsAH35mmksgVif9HujJo5x8wFGlakCu w==;
X-CSE-ConnectionGUID: wFgr8z/VQ0a7SzxbGq8prQ==
X-CSE-MsgGUID: OXvK/+AVQ06yMdDiP1Rebg==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="870992"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="870992"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 09:48:29 -0700
X-CSE-ConnectionGUID: fv0ykeS6RRipXuWA4etqdA==
X-CSE-MsgGUID: mF9ijp9gQrWoHyoqIkQsvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="1981807"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 09:48:29 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 09:48:29 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 15 Oct 2026 09:48:29 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.30) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 09:48:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QOO5Rf3RpTiPzNdRw3Tw+HkSk+wHMKKGzIp/Qn7sGL+fdqKlMZryR87TVSeGp8g2kO0bPyhDVqk73vNnLrAwMzAGCEd4TUcLdPylZyA6U2HmqBDHs42u+U7owYmOXwb58Bp6ld2xrBGyatPJKOdlvJydFfo2YT+2C1ZNyCjubsA1pGntx9MBS/GV0dMxvQUSClPu0CGeGXhBosERYOe4q33e+Yk2qlxYNphqFazNTJzQQXepaPqbgsXmLYsED3hSt+EHkuv2f/oR7sRf4Fq6YklXoBlTC+3fEBbNkQ2hKuBdDdR3U/O0nl9PG/sBkHcGDc2ww3dtzWCRJMtn+tyB0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bMq5Ls07/Wy5muQ3jx0LJa2m20VRi+gLBs0FnrvIINg=;
 b=oF1UtHK13CBc7tkQ1rHeY9SHjf4lm2HwHh8QmFRRTwii8UAkfb95QNIc89UCqn7Dg3SQO8wz/WZ8f8zpfTv4rXYL9d5NDb4VeatZPe7C0OA1XcHe5r0qkhCi5JQEuvpomA3JpydsM9y4hHV/rmuY6FF+wugxvoE1gmlykKTHgA6OE6YxtoFKDiePhCDumpr0gKQbBf2qJkEk0m3KrTlRAuFbY9LYLi3RK+QZk7KBjFxxstU35SGsuWlZvC90xwrfgHuCciwN94vOqLKPkuPVvZpoquZ39AmFNpwWuUpjF/sS5+o3JgtunzpCP8ImNYXu0KIYCq7uSdzdLd7AhKoSbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by SA3PR11MB7528.namprd11.prod.outlook.com (2603:10b6:806:317::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.24; Thu, 15 Oct
 2026 16:48:20 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0496.021; Thu, 15 Oct 2026
 16:48:18 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: Sashiko <sashiko-bot@kernel.org>, "Teres Alexis, Alan Previn"
 <alan.previn.teres.alexis@intel.com>
Subject: RE: [PATCH] drm/xe/madvise: use already clamped pat_index
Thread-Topic: [PATCH] drm/xe/madvise: use already clamped pat_index
Thread-Index: AQHdXJDFNWyhogTM6kOzG7Ayju+Id7b+0KAQ
Date: Thu, 15 Oct 2026 16:48:18 +0000
Message-ID: <DS0PR11MB8718F3C304AC8E4B162F6F29819C2@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20261015103415.442931-2-matthew.auld@intel.com>
In-Reply-To: <20261015103415.442931-2-matthew.auld@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|SA3PR11MB7528:EE_
x-ms-office365-filtering-correlation-id: a2d1c20e-5680-46da-d4eb-08df2adc1d9f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|10067099003|18002099003|22082099003|11063799006|261009223027099003|38070700021|56012099006;
x-microsoft-antispam-message-info: VtnldMg2UqcjS9CgsaK/ZbWAlC2UAtV3+cmYLUK4Xq+OjpjQ8YJckppMPYX+fRk4n99KFew7iiHMq83LMw9JnAmC9tUpcJ3pmXz51mp9cdaj11ECUtQnV5XFOLpKLB4lLuBG++Gy+pUeI0TceNIZCFPv7TcKdhGjduJqWGip1CB+wErdMYq1vLZU5nM8Zi/Koc3VsPss4yCOHdfRK7SrHoqGhnEn1usmR6DeGEKOVaYfpBkJu/Cuc21zJvAbs8pt1f4vQt/jfx4bL0wO9T1gcjU6XMt0VjEoIhKUHuXsVi7UQQs+Oh/0jzz0IWkCtW32oNPDi0/ELC/ogLg+xvY3el4xvkuLUlSPRm4L4rE7bzlW7aj/85Xqwaoipk2kdp1UBRPuo6Fx9iBOPPUeuzQt3Q/1oIfRauF+J8wnOO09X57wdkUmQFmfvkU3YxyGyXZaMaRJLzoeVS1if0N/IeFfebQP/R9fGMvY65rpBLzQE5P0IAqZPisdfEb79KQBLM7RLGF2ua6tqAZgYOlms3ovVOM33dbJ1xPopl0YX5teVJ2Dy+XkAD3UDXw2CFVTw2TzRPsPKT5XJjjRedy7zqwXCFxHiqW9IbcEOOOUFuMn3HMN6/ir7lSoH5H4FH2+VYbSAuHAcDK6fYCZIFzKnTf9aS+thURP2wwrLIfHe/TMvMk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(18002099003)(22082099003)(11063799006)(261009223027099003)(38070700021)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qP42P3747ZT/lT/qYKChjlXXx2jIk20oF4odD/Hjvao3Bj05XMJPHI5ZRYU7?=
 =?us-ascii?Q?p3wW0EpHtTHTZzshcPZbVOiko2ZnpJ+4mjHo4K2gtp0GUcXrluRyvZ9JRnnV?=
 =?us-ascii?Q?XEogSFzZ5t05SdCzxRpO+ZQvIAJvVziallU/tRWpJszF8XDT1iDGCASKMQGV?=
 =?us-ascii?Q?1yALqvCXeYAoXwfuvsUeAjP8mN0qcv6JpUfOEgmkt9z9BVpoTv/LFUQCrTJ7?=
 =?us-ascii?Q?6Wfd/yiKk3cw5luC0WeMcssDYWmmlzGgZn7l3xzTnvP+ItwKLuVHyvkuL3OQ?=
 =?us-ascii?Q?grgsHYgP4UgAn1y4YikMMmRJxMHtarrNVlqQWvmrSAxxliFzM+xQVsKQleNR?=
 =?us-ascii?Q?DQwcF9eRxQJAe/fGOtEmrBSYVel/JK1ynZ/w3F4w9w241+3GMYoi9ASCVZrj?=
 =?us-ascii?Q?/3eCYJPe9OT3MwTZ8KO+cUEN1H+mpx/9nZcAOY12yqI3eqH1V2BotW+sP58q?=
 =?us-ascii?Q?cJWz5FVqxtjwNhU7rWNCddlIh6ahw7hj71wG8BXirf1dItJX2lK4z4Xuwud6?=
 =?us-ascii?Q?KvIfvG71DSnh1u/n4Tw1pscNeNaADXxTm4cRRN2lgi2Ym4WAwdwQmzlRM6AX?=
 =?us-ascii?Q?TbuGHYoZgwFDNH8gcVqrRz6fKrL0mKC7Pj5DPsIFwAUpYNL83E0Gdj1sdYUB?=
 =?us-ascii?Q?eikzYYTFFl33+YL5Yems6R4bnltDTSb5M0xAeHCGVhT5b3FPK+Qj9jXG7nUd?=
 =?us-ascii?Q?0Hi/6h3d7GPLRjNPRzB/2luYtqSqs2dqVFbuBtZDHOYsJTsLAZ2QKnFyNn9Y?=
 =?us-ascii?Q?Wi7mVxJ0JNH6YS/uEO+OEuEOL7mx6V8MC8ut7EEL8Y6S0AoctpOBY0fqTjTm?=
 =?us-ascii?Q?sqYd/GEn/Y7CxCUkaTHlfhw6ISGnHJxQaQIuZeTPVWrWMJm5E+ReBHhFqLuB?=
 =?us-ascii?Q?3rlLsYQw+PjVvK5ITTWV8wffxKEAOmdJrHf0e9UrTDxvdSrMAkCHoIDvQrhL?=
 =?us-ascii?Q?SthDejGfblZ0tsT16vpDwMEdwZ+vQSxLXXS/5T87E1kpi2/WKpzXtPjj+QNg?=
 =?us-ascii?Q?MplNH3vrpc/PYhk8cynk25BTPoAp3vBxlDXc+bE1lBFDhziS6d7r7uVmVjaE?=
 =?us-ascii?Q?crodx39FgMTVi4qqBLJsE/z6aQkYat7Ot5x8RTabzW5dDnS7o8Q1XlXIS6ti?=
 =?us-ascii?Q?0kjCJICJdof/70SUSavJgYrFrGxz09ouAWwA+D0nPIDUOjRgiKfFdnSEIGk6?=
 =?us-ascii?Q?o2M0Nmx2k0YePVkvZSI/JVq0ndVWYHc0TiDE5RHYBDEoRYBsRr1pOnIcLTDl?=
 =?us-ascii?Q?3TcP7tLKZAGUO2RwmYPveXr9BBhJ4kt3suCGCFi8YDHQ64OD4bvCI1IY4k+7?=
 =?us-ascii?Q?J7HuVKaG0/BVrvZCB9ti7QumBAxFLi8wBgBUC/H/Ndf39f/E9Fpk8FzEsTtu?=
 =?us-ascii?Q?HKDa8mO/VlyuCXzD9lz0rEGKEnfAt1BZZM2DRpMMCgNWr7kjbC6owWtW8jYl?=
 =?us-ascii?Q?9AFDOjc8TZjDb2NOGOoiUwfmVZ1HSCeYVn0z3qY56Z9+DQoHjvaoe3dNdzKP?=
 =?us-ascii?Q?e7d5sBEGpnJ98Rh4uJ6JJ7tfh2pdglEKzb10jufqEZrgclUhchpWBIv1TfBZ?=
 =?us-ascii?Q?HXjXnZnu8I8km/IkxdGh7xyEQ2naJ5Ub1dKenrjOa2vf4gbdMKGmFS476K2t?=
 =?us-ascii?Q?SWCI28IChakcxXAb629zqOQhHL/OzZNV7DLQVTYDANiocOoUA/T5ftG+8MeR?=
 =?us-ascii?Q?Njc+TI+LRBudjNRpzSfaPrvj6Q4XkFKdU1ejpW+8jjzcXF4oZ1laxJp8K8yP?=
 =?us-ascii?Q?Mw+9yuhjjQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 0LeaCSHVTwOc/yJPDELfmZYbLkrLUbNd7UA2+Br21YGQ2RqiT7GjqxCWwwlZtgmmOQwkZfgVkWkeU7tHkGZ8IHONYCk373BkjaYTJFl9jVAP+3dhdfE/OL57hn569ncd5Iqc5jjCn4RBes86MqoZY2cL/quIgQNH2ic9Pi4JF5GBaJ0vNHjOStDiIvOwodWBUsR+zlH1W95MOyw2Q7NhxS4vooQqQpP/eUa2BUb7TqRg95I/QS5sGV94SstA3JP/WuU4hwnGAteMDKYEUJ4+LScw5n31EJwWaTlju1SDDYveqggkHjnMJDMkJ7+wx97r8Ljg6UTylGHXAAc9KRO8SQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2d1c20e-5680-46da-d4eb-08df2adc1d9f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2026 16:48:18.7618 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XegcEdb6tJjnlx6xheBwVN3Sn4slvTQjijzjjB8yVM6nP+A4noP+mVlUlcYkOPODE/isJYlrJjFA/zrqXxrjhCw01o/2EMrugJVF6UHrl2c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7528
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
> Sent: 15 October 2026 16:04
> To: intel-xe@lists.freedesktop.org
> Cc: Sashiko <sashiko-bot@kernel.org>; Teres Alexis, Alan Previn
> <alan.previn.teres.alexis@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>
> Subject: [PATCH] drm/xe/madvise: use already clamped pat_index
>=20
> Pass the nospec-clamped pat_index to check_pat_args_are_sane() instead of
> the raw args->pat_index.val, and fold into the preceding
> DRM_XE_MEM_RANGE_ATTR_PAT block.
>=20
> Assisted-by: LLM
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/message/sashiko-outbox-
> 172627%40kernel.org
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm_madvise.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c
> b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index 5c7aefc641ee..a835cc55658f 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -659,11 +659,8 @@ int xe_vm_madvise_ioctl(struct drm_device *dev,
> void *data, struct drm_file *fil
>  			err =3D -EINVAL;
>  			goto free_vmas;
>  		}
> -	}
>=20
> -	if (args->type =3D=3D DRM_XE_MEM_RANGE_ATTR_PAT) {
> -		if (!check_pat_args_are_sane(xe, &madvise_range,
> -					     args->pat_index.val)) {
> +		if (!check_pat_args_are_sane(xe, &madvise_range,

LGTM,
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Tejas
> pat_index)) {
>  			err =3D -EINVAL;
>  			goto free_vmas;
>  		}
> --
> 2.56.0


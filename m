Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD766C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 21:39:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9465E10E821;
	Thu,  8 Aug 2024 21:39:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fmvFtiIg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F104F10E821
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 21:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723153157; x=1754689157;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IDRAnm/GOVpxk53cXdes/uXEib7FnEKctjf3H267tz4=;
 b=fmvFtiIgMYbr+5aMTFPLGA4MlQDgaGbKCTXBFVCOStHuuZ5rHiKuthhJ
 vIBczgoh+bavmIOB0O4qUEfQw1Gz39Mdre3MamzbHqvDO+MSTWrw5EJuo
 eIwRYB/i/lhJ5uyOgL8j6nRHiz8r1iMrNNAqUhKl6z1G1BpgGgiF9N/In
 eUU6m/wllR0yvpaOCZ0pTpybHkFKAQe9C/H7pEAZ2FrgpD9YViHXVCKD5
 74ndVAujkyS9qLTddRVhWLC9Jdgv4XcgfMdzBEbUfoGoan5E2lj+fyXVp
 BhzUuD2761EaEHdv5uFuu66xm+UjDfVIrWTI23gcZ9uY3TfqQY5EHuCjo Q==;
X-CSE-ConnectionGUID: Q1RXfELtQVOHY2T24fugsA==
X-CSE-MsgGUID: vWlyQiioTP2ys8OjRUeM4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="32714088"
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; d="scan'208";a="32714088"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 14:39:17 -0700
X-CSE-ConnectionGUID: /Y+8hh6cRpmIWHEB4NBEZw==
X-CSE-MsgGUID: UD3ZKcVxQoa4GnDOYWrz+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; d="scan'208";a="57269550"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Aug 2024 14:39:16 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 14:39:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 14:39:15 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 8 Aug 2024 14:39:15 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 8 Aug 2024 14:39:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wf4maMEqPJUbuDJ531cXgr7pq18F4pAASo+qwdM1rj+BNYUCdkIMeq38V6e59Dlbmf7+5vm3gnhmxtwcJDPVcEeqRteOMmyWj/z66MRWOdQGYRZEmqZ26ocKWPC7Yhax0etX8+qwkyUxJ2MvSckURa6ldJUVA+eUd3yZXJi6mnXxKc5QHMI8WAVyKmOQRXHtyMRH1u3sixPIAKSamJuOtVZlQ0Xv/EDqd/KTe2jmCum2ULK7OQ35j+yaKuDa74uJxDSqHJAi7egDfQ0sNie0eDiVD6rvlups63o/NIM4ZJ3N4OMAb74DP/QI3d7Dy2p7oxAAj3pscbWa5cBdHYkBaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AbyUmsvkuomAYXG4mqFXtZS91U+1Q5vfAm/ifn7oyHw=;
 b=XGeTiV+mDeqXh9RBjDA+N5bcV+GySErtHYxQApI885MN9aoO9gILplJ6pt6VWG9PF+j5M+E3SwVt9lx7o6c8+nJDC61U9D/7J++yZw8TAwmpzlu6kijHzv/T+kqAaOKTUgaF1kb5BcUIA5cYhrUp8g9sifj/S1KCoigxTufUbDafx+uLynNHPgova+UEt7OS+bAxhk7WgZxEuHDh47/bAet70/RVbgTfhEDtke8Qm1Pii5V4AFX6dL1xucKC3u6IhZ2UBQCow2AlXq49yRfWAWClHlkeFdzm2yMdpTketXm33rVrR7bwQOa6jFLsbjrGGvPMKUXldMewF1c6oF6Zqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CYXPR11MB8755.namprd11.prod.outlook.com (2603:10b6:930:e3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Thu, 8 Aug
 2024 21:39:12 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.7828.023; Thu, 8 Aug 2024
 21:39:12 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, "Souza, Jose"
 <jose.souza@intel.com>, "Landwerlin, Lionel G"
 <lionel.g.landwerlin@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 7/8] drm/xe/oa: Add syncs support to OA config ioctl
Thread-Topic: [PATCH 7/8] drm/xe/oa: Add syncs support to OA config ioctl
Thread-Index: AQHa6bpMUN3FBXzJh0StaGi+ppKWlLId3ZQQ
Date: Thu, 8 Aug 2024 21:39:12 +0000
Message-ID: <CH0PR11MB544473F8360B2C1F033674B6E5B92@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240808174139.4027534-1-ashutosh.dixit@intel.com>
 <20240808174139.4027534-8-ashutosh.dixit@intel.com>
In-Reply-To: <20240808174139.4027534-8-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CYXPR11MB8755:EE_
x-ms-office365-filtering-correlation-id: 9a118b02-02a6-4feb-e596-08dcb7f28b4a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?BHTePpNjQdTethBLf719X7aFJZdZpzdW/hWEdLKjNb3DWsymlFv04Op0fl1H?=
 =?us-ascii?Q?aTcOWz4HY6vvPZxXZ3aXx3/KnvQBsUuDMlFU7vGuyrTEfgY+A7jOgB/8KYK6?=
 =?us-ascii?Q?dmGSmb4eij8nmcB8hcB1SGYrJIttYZBwpSbRKQPosfXksULtJMqHNm+k/itc?=
 =?us-ascii?Q?qXw9Sf9yNGZ9UUbs8k/vz8v6JgXXaELJ3qujM+FOzk+X9emxzZ4A+QYZ6sQf?=
 =?us-ascii?Q?7JDYVgWdvmx6x5FhtTqB9pgqD4Y5n+6CJeCqKT5jpaRWdQ3FZWT8K1yywiic?=
 =?us-ascii?Q?Lz1GGBwHilPSm4oZ9NKQpjENQv51T7OCq0t8bFLAxW5nEeXvBJhgldSZCgHR?=
 =?us-ascii?Q?cgyC22OSIVK/Nz2Q24kAfNpzdwFkD/Gt9raYKw4Me+lfEE0v2FD7q4/hvikS?=
 =?us-ascii?Q?0TuaUG2cOC5Eo9tbMIGxeqZlcmav5UIvmt+9RflbKRDmRyWn5k/DP9mPgYgA?=
 =?us-ascii?Q?jrYzuqQO1PkYUPoFmoH6jku0sSUN/XdyvDv4RHyRFyJOplbDTKd5ocF6HIj0?=
 =?us-ascii?Q?o3mk+safsEDM7EKKWOSJaOIef98n5Tarebrr4W3CLZkAZG14y57Ajtow11+7?=
 =?us-ascii?Q?OSi44KE1aupa5R7XL1fff2UmKXBKXtjL5so9pMnnKwOy95Nfhibkh23hV6pc?=
 =?us-ascii?Q?d80Fk5Lh+d0HFi6Cxx78gQwEe+RBAPhI92X5aE7G/Rsl3msEG2T/jis5bPJw?=
 =?us-ascii?Q?rE5G/got4bVG4VXzMeDql9Uf9Jc834/NJ8IRvkgoM+dYnVbhUF+nh/arWnrg?=
 =?us-ascii?Q?lycOdXAmObg4MYpRkffxNjG+UmZG4vJtonUfdD6+b+RzYQ2qZv3wLCUK3yjh?=
 =?us-ascii?Q?OogzeUhqlJTp+HKlq8ynjmrrDZJFj+fdDAzE+uoinly/LmaEo8wJp0yfPPp3?=
 =?us-ascii?Q?YTV1tCD/2Feu3yoFQ3kN7ViVRItPIX4nmomiROlTKcWm3bcKLBUshm9AWWN+?=
 =?us-ascii?Q?aESO1zzZJYMyFG5i9dSwyNm4oXs0NQJtPA/QsT0lSzvzM0oqOaiEV3EMimMQ?=
 =?us-ascii?Q?uu6+OlUU4CqjT6M8apd35hAJwC6gYutgKKsdlrM8jP+Yd9L5gSrrsEE3Gplt?=
 =?us-ascii?Q?kUaKOb7QiLRMFpIOwmc42ZD/L1e72cHFvXPPKGZYTj85cx6P2ORgIDwEzv/4?=
 =?us-ascii?Q?YnJSW5UYukz3eiU33zJmo2jcWnW0bSQeBHGX25ip4YY/Q3Rfu/fMYYCRysSg?=
 =?us-ascii?Q?3s80CPzfsiKWYj2n6FjVtIEqB8M+mnDOdtXd+fnrIjq2hPOLvJqubs8SOfUf?=
 =?us-ascii?Q?fW6ie/BN3kqY9MWnbGBPZxGclCgxWHzwfMdckdK/w+62BchRGUpHV6nSe8/g?=
 =?us-ascii?Q?l5oZmeFpZvUvm4upx7Zouy6NwrzBJpsjJ2gPKfYFqbYvn0QfRJ3ap5SWiR3R?=
 =?us-ascii?Q?P0Up3xW6Zs3lVIT1KFP05im0rJoL8awWDFB7Lt7Bl4uztfuEQQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0Hy0OjY2NBXz2Yoqvq8Vhoic5DjjFV1vArq8ty5h7eneRB97+pJiTzz2DxpA?=
 =?us-ascii?Q?lodQLjpGSs4hVi+NHkNbcI4Dlhk7FCzJFGVJNhCF8DB4x6sA9d+h5sihQEXV?=
 =?us-ascii?Q?7hlRaN6zxznRsUg+o3AgAW9VHYBAde9pI3Zmjch/otmkLHAgq9UIGaRsPvG+?=
 =?us-ascii?Q?g59ga9VAQdJWLa1MOs75J4ENazKYzAeCfWAz63SscwDHLW0s2tXlzZWMXzWL?=
 =?us-ascii?Q?8z09P0Uvc0KQcYqvIjLfu69A5p3lA2t8vjNVb/uLi0PgpNYBrDmBg3A/oagf?=
 =?us-ascii?Q?OFtbCg8hgggRrH3OuFMz0PAhwau0xNiR7HM/SDQ9xEciDyZGKmcDeJ3NSvPP?=
 =?us-ascii?Q?DDXP9i0Ohyce+5W7lTna6VRrjgyzn0y7ECDhCWyGWBkdXIUoKJeVyPtpjxG2?=
 =?us-ascii?Q?RVNHS0T6Iz4Wzh5jwvvit9SlM74S8ZbMMeruuzGQaqvdJnkzxwgJcJROVcQS?=
 =?us-ascii?Q?obtxD4pAx8ccBMJF7oyD2PI0L4qMav9tlYo2i9E688fAZRqM5tq94OU0USCz?=
 =?us-ascii?Q?+7bZvCOamPhySwkAAHRKItoh36r6ToEalx4xnWtVVqxu2psV1LRedFA23iWT?=
 =?us-ascii?Q?Ea0v0jwpPfEuWVPjiJtUl1i5VoFbFZ4eeBNWXXvO4J7safEL3+E0aT8dbUyd?=
 =?us-ascii?Q?8f+XIyFnGWJqH9j0Y2gMmnL696mJpfI5fdoY3hNUXK3KtmdVNGGaAR0qx+X+?=
 =?us-ascii?Q?OHg/pJckF20L7qHvafFpq809yt9apkATk1HfwGUwaUD4X6Jqh6O8OBA8yeXR?=
 =?us-ascii?Q?YCfIYXmOc/cdxi2sx4kLe7CfFFuJ1RwEoWQL+XGGsf9X5C2/hMt3RIwyKrAe?=
 =?us-ascii?Q?LdHUk90AT+2g6pRLvxNwuHQ6ZUmyFNJYRkMAzBIW9rnEW+DoPWsCl0ZcflhD?=
 =?us-ascii?Q?7OgaXqLfdMh8KFqq8QZ+mjuYVUlTl/ZH8XbbbFqVfIWD0gUOXMfaqwVDWiV4?=
 =?us-ascii?Q?ZBuTEtP3bCYH/XVDavg17LUNmxg6LxlNltyBwzSIbbZ52YgueOYN24G6UMuh?=
 =?us-ascii?Q?+p7InsE/GkiPOdn4+5Dt4DUep4wP4HROcIVKUIPPSroqsTnGaJSO+0G0eqrm?=
 =?us-ascii?Q?Hi8TBXdkEXPXRp+CjTquZNZntEmUpt8fIwzu4FO4DUx1aOQE4vP+4sid/Wf0?=
 =?us-ascii?Q?/RkfCvrf8vaBoMDcfWs4XkXqKcrJ7HUJlL4hsOGIzqm6QBGvHWkFGkC9gJxe?=
 =?us-ascii?Q?7CnXUUA573Sek5Or4YLsUENCIMJIg76yuE4yb/o/GvmXPiVhP522CRB2reaa?=
 =?us-ascii?Q?pmRComcahhajk94pYF+iXHNukqtfT773GjBviByjIjZXVxluqPXLh68SoM8X?=
 =?us-ascii?Q?U/930TSJQPKe/eJcay+ToeNjDFSqBqkc1qanPuJecrxbAYMpQbkdei7agyyz?=
 =?us-ascii?Q?pZavmQ9cgVTJWFVJqae5jT+5wIGZgAsAsO3zoR5Er2aMrW+iJPB+IuHJBmgO?=
 =?us-ascii?Q?WwmI1ssnNZUO2AdHD1AjcXWWg/8X6zFy3f/ROgtpusfdf3pVD1DLrgTfnDFj?=
 =?us-ascii?Q?PsGZzEPKBeZqABgUiKJ1pyZc3pSb2l8EsMESVX/DPnoF/VqqbTkDlgFnMq4F?=
 =?us-ascii?Q?UAwYlm0fTrNjTElxzo7W2yyUDXFo1bBHajh1ZQwL?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a118b02-02a6-4feb-e596-08dcb7f28b4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2024 21:39:12.6562 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BYYi33Ys8mpTLGT2OvyrtAGO2ryWILbq+OP06akPHnnjMdtURl1wHy1vfDt5YESKMgeqIYEUpZNZhCzP/PoOd58WUKwRbtJT0iCUMGrKPP4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8755
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Ashuto=
sh Dixit
Sent: Thursday, August 8, 2024 10:42 AM
To: intel-xe@lists.freedesktop.org
Cc: Nerlige Ramappa, Umesh <umesh.nerlige.ramappa@intel.com>; Souza, Jose <=
jose.souza@intel.com>; Landwerlin, Lionel G <lionel.g.landwerlin@intel.com>
Subject: [PATCH 7/8] drm/xe/oa: Add syncs support to OA config ioctl
>=20
> In addition to stream open, add xe_sync support to the OA config ioctl,
> where it is even more useful. This allows e.g. Mesa to replay a workload
> repeatedly on the GPU, each time with a different OA configuration, while
> precisely controlling (at batch buffer granularity) the workload segment
> for which a particular OA configuration is active, without introducing
> stalls in the userspace pipeline.
>=20
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_oa.c       | 32 ++++++++++++++++++--------------
>  drivers/gpu/drm/xe/xe_oa_types.h |  3 +++
>  2 files changed, 21 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index 5520208a46b2c..c9f77f0342b60 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -867,6 +867,7 @@ static void xe_oa_stream_destroy(struct xe_oa_stream =
*stream)
>  		xe_gt_WARN_ON(gt, xe_guc_pc_unset_gucrc_mode(&gt->uc.guc.pc));
> =20
>  	xe_oa_free_configs(stream);
> +	xe_file_put(stream->xef);
>  }
> =20
>  static int xe_oa_alloc_oa_buffer(struct xe_oa_stream *stream)
> @@ -1433,36 +1434,37 @@ static int xe_oa_disable_locked(struct xe_oa_stre=
am *stream)
> =20
>  static long xe_oa_config_locked(struct xe_oa_stream *stream, u64 arg)
>  {
> -	struct drm_xe_ext_set_property ext;
> +	struct xe_oa_open_param param =3D {};
>  	long ret =3D stream->oa_config->id;
>  	struct xe_oa_config *config;
>  	int err;
> =20
> -	err =3D __copy_from_user(&ext, u64_to_user_ptr(arg), sizeof(ext));
> -	if (XE_IOCTL_DBG(stream->oa->xe, err))
> -		return -EFAULT;
> -
> -	if (XE_IOCTL_DBG(stream->oa->xe, ext.pad) ||
> -	    XE_IOCTL_DBG(stream->oa->xe, ext.base.name !=3D DRM_XE_OA_EXTENSION=
_SET_PROPERTY) ||
> -	    XE_IOCTL_DBG(stream->oa->xe, ext.base.next_extension) ||
> -	    XE_IOCTL_DBG(stream->oa->xe, ext.property !=3D DRM_XE_OA_PROPERTY_O=
A_METRIC_SET))
> -		return -EINVAL;

I take it these conditions originally blocked batch buffer granular OA conf=
iguration
changes, which we now support due to xe_oa_parse_syncs down below?

At any rate, this all looks fine to me.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> +	err =3D xe_oa_user_extensions(stream->oa, arg, 0, &param);
> +	if (err)
> +		return err;
> =20
> -	config =3D xe_oa_get_oa_config(stream->oa, ext.value);
> +	config =3D xe_oa_get_oa_config(stream->oa, param.metric_set);
>  	if (!config)
>  		return -ENODEV;
> =20
>  	if (config !=3D stream->oa_config) {
> +		param.xef =3D stream->xef;
> +		err =3D xe_oa_parse_syncs(stream->oa, &param);
> +		if (err)
> +			goto err_config_put;
> +
> +		stream->num_syncs =3D param.num_syncs;
> +		stream->syncs =3D param.syncs;
> +
>  		err =3D xe_oa_emit_oa_config(stream, config);
>  		if (!err)
>  			config =3D xchg(&stream->oa_config, config);
> -		else
> -			ret =3D err;
>  	}
> =20
> +err_config_put:
>  	xe_oa_config_put(config);
> =20
> -	return ret;
> +	return err ?: ret;
>  }
> =20
>  static long xe_oa_status_locked(struct xe_oa_stream *stream, unsigned lo=
ng arg)
> @@ -1705,6 +1707,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *s=
tream,
>  	stream->period_exponent =3D param->period_exponent;
>  	stream->no_preempt =3D param->no_preempt;
> =20
> +	stream->xef =3D xe_file_get(param->xef);
>  	stream->num_syncs =3D param->num_syncs;
>  	stream->syncs =3D param->syncs;
> =20
> @@ -1804,6 +1807,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *s=
tream,
>  err_free_configs:
>  	xe_oa_free_configs(stream);
>  exit:
> +	xe_file_put(stream->xef);
>  	return ret;
>  }
> =20
> diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_=
types.h
> index c1ca960af9305..303e2e8f2a918 100644
> --- a/drivers/gpu/drm/xe/xe_oa_types.h
> +++ b/drivers/gpu/drm/xe/xe_oa_types.h
> @@ -239,6 +239,9 @@ struct xe_oa_stream {
>  	/** @no_preempt: Whether preemption and timeslicing is disabled for str=
eam exec_q */
>  	u32 no_preempt;
> =20
> +	/** @xef: xe_file with which the stream was opened */
> +	struct xe_file *xef;
> +
>  	/** @num_syncs: size of @syncs array */
>  	u32 num_syncs;
> =20
> --=20
> 2.41.0
>=20
>=20

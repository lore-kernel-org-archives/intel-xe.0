Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C3AD3E76E
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 18:25:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51DFF10E797;
	Wed, 10 Dec 2025 18:25:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KUGJtBJk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6195B10E797
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 18:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765391147; x=1796927147;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tXZ2LZVqXbJJ5zJvCyBI8NBc8xvw7uO6M1HtLHUP42A=;
 b=KUGJtBJk0c3vC75U/XmHwN041yZTwZbcRMwlfJU3RBWWJCAQ0y7c/pbF
 PupjDYzExSF6PE1yahHQdeOhk/2novlyPyTfMiqvOtzyNdtq+Lr9zON/f
 3OJycZAAU+W/I9K8Wa8IA1IebIWxchXF7LMBQaLoEed9C4iW2Snh/bsGu
 CeB8ZWNwZ5HY0ckz2pvdU1h7WOPDOy7u9Ep+cNhq1pvd9NhHPZdGUf8j2
 thM7lBTzFNRwAnLI9bgTlC/vbjrXgNMKsX73uVVVF2JnhcoXOka3wkHpQ
 VvedsEUHQRVCj4XVFcuFASOkVcjSIm3G9yX6WHaxiQulA8tkveXdWhxBE Q==;
X-CSE-ConnectionGUID: Qb5iq5zWT+OO+/E6dERCDA==
X-CSE-MsgGUID: YwDZtFpDQzmmFJa2dOetaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="78067050"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; d="scan'208";a="78067050"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 10:25:47 -0800
X-CSE-ConnectionGUID: jKZFAwSlT9m+Nf7iTtkqSA==
X-CSE-MsgGUID: PumoLYgWR3Om8VPrOKMEaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; d="scan'208";a="195853979"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 10:25:47 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 10 Dec 2025 10:25:46 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 10 Dec 2025 10:25:46 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.4) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 10 Dec 2025 10:25:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PQfTAN5mKmLFPeKsyAScoYK8I1IX3kY8W+fHzT7flhy5VyJh2sYqwHia2MmlZKscp7Fin8NroIVAubh0NcLF2lRP0HzeUGCAHk5pTE7xQpi3MkqmHitR/+LUM1mA/Ipk0nLTjRC9bVAFIHP/c4GH3jqpAMmowwgICY82UZK5DSsKs9gHREWtBmrArv4PpAsO8FMQNdWKEv/oc9FpbIYkTvgfjIns06QfCMlSnkqt1kuHLGOa7x2Wwn9cDSGvf5EUo71bc2cyQahhoFj+HPb9vwr+lgaNs3Bur1l+NyKJAA8UgOmEW/dIqe+Mo3FxSh6V2KdI+3kVgp5HFDBkzkqmNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xAdq0IIaOR6AVFQ4/QgpcKmksjLNCXPmwkM2L4M9Xt8=;
 b=XSFugMiLl/jTLDI2pG5+IrdNAphusJyBri5pdnto+dxWYMSCBjm3R+uHUpHWbTKqEnHZ6T8h2JKL4FKtvxIm/SxEVy8wRy8o2yzPgMqHrfsDYCshsoPsSZ5m+PgZJCiw5H8c2qR9irPxhDgqUUsviAXt5OylBRTKHoAQxAQ1RX4A8TnbUZzXgKiOD7j9Jd4VaY5EN26h060SNm16At8dXQBLmF8ifuJsj0hsR/CNuRyEAQhDsz+BuJFICSp4ch0NMMCx+XQAqAADqXpXeUXFoFu8ce7GbiOuteVJlE5YZNZJoZklSn+OOSENJsfJCWk+RhlqAhs+8ZEfDUFfaM5h+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH3PPFD9C09B4A7.namprd11.prod.outlook.com (2603:10b6:518:1::d54)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Wed, 10 Dec
 2025 18:25:43 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e%5]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 18:25:43 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Maslak, Jan" <jan.maslak@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Patelczyk, Maciej" <maciej.patelczyk@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, "Brost,
 Matthew" <matthew.brost@intel.com>, "Maslak, Jan" <jan.maslak@intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 1/1] drm/xe: Restore engine registers before restarting
 schedulers after GT reset
Thread-Topic: [PATCH 1/1] drm/xe: Restore engine registers before restarting
 schedulers after GT reset
Thread-Index: AQHcaeVmYAKBvBUWbEqw4+vP108SPLUbMD2A
Date: Wed, 10 Dec 2025 18:25:43 +0000
Message-ID: <CH0PR11MB54448758C46AF56B5C81C089E5A0A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20251210145618.169625-1-jan.maslak@intel.com>
 <20251210145618.169625-2-jan.maslak@intel.com>
In-Reply-To: <20251210145618.169625-2-jan.maslak@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH3PPFD9C09B4A7:EE_
x-ms-office365-filtering-correlation-id: d7fde2d2-eda3-49c6-247e-08de38198785
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|10070799003|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Svp6N0ZGJeLxCynB9bgR8b/l3WgtyZAh/5uCB+KnUeNvEMxodpXKEWn77J+B?=
 =?us-ascii?Q?/2QMTMOgO6UQWhFOQfSQFY4HucshqdWwZPiruxNdNHmIq01NGlso6PSofSQB?=
 =?us-ascii?Q?+azInl56jwwNKAWv/US/iUnXDA0Lk82BEI4ovvtC2o9/2g6uXPQO+EHSIgi9?=
 =?us-ascii?Q?JPLtrrt+5WEo8ckoirBFLoJkqyhQsxmYrK2mDf9+CkiwzfcttYv8SLUntqfB?=
 =?us-ascii?Q?xLjDV9d9fqkmQ48jOPlSZGtRXYALU4eBQNv0lCw41pgM3Kk8uhGvP9SIlBMP?=
 =?us-ascii?Q?VW7a8pv2bYbn563YST9euAe5BfPT+9hrkPozAN4mw/58Wel/nEHeQz5Eiyco?=
 =?us-ascii?Q?CkehHJuIU3tBWFhyKaUUeesdeLmi7Ist5Aikq52QJUgbxXjXiB7iXnD40I+K?=
 =?us-ascii?Q?gq4Z+l5c0yihNXLr+/ND85G3LL9i3622XZ03iY3hhQQrSl0ya/os/GIalbaM?=
 =?us-ascii?Q?j5Z7YUwriUZcggt9XmXkLGTZpW+64ItK7UMVh4OpY0m4hN0E2vGcSW5+pRAo?=
 =?us-ascii?Q?NytfNx2v+hvfi/teAeZx4y2BUG9kGOpoQYKyNEbxFeVG57LnhXHbNG26vVVA?=
 =?us-ascii?Q?f/RJT6PYVSDfVaHmCj8y6Qiw+9KQ8jyFbwPGbu8W55PLnnXBE7VWXpe2Icf/?=
 =?us-ascii?Q?vDgCJNo9nsphVuEOWi5y23mcNj/OYRjtpBD5zdCzE3g8bdvRPlKVSlH0W791?=
 =?us-ascii?Q?NPIUv6yJ5QFuzIBPVn3+iB8b9Zp6caXHkj429ERTJZGCKcmweaf5pBeJ/4Ft?=
 =?us-ascii?Q?TbaH/bTVH6KpTetIVqpJj1d1YzlkIdYMkb7AmcAQONKCVXXrF+/5YIMWxker?=
 =?us-ascii?Q?NW7dQ3MMHVXfSTiumruDMv4A1OEWk0atcKbc6d/ej0B39l2mQe/0vpIw5kMd?=
 =?us-ascii?Q?/8ekbSsU9WoEAvIqT21GABFmqN5Z5GlYKYTilCj9RYjOknZdB9K9OQAQL9dY?=
 =?us-ascii?Q?G6iLHJKN2uuTY+0iH3/Hbi7kh/zDd3eAtaa/WT3uzrVK4OMIHyy6rk6oCf+f?=
 =?us-ascii?Q?5LYR7BKD2CrCvAEB7WOCh8JIMzDCLqJUxV15c0KNs/AlGw19+UXdnqEfdxys?=
 =?us-ascii?Q?dlvrbF2p08CGs39YEYZ+V2cDL87Vg62BS9m26MzVHbuzaypOKGJRRcuJBvoy?=
 =?us-ascii?Q?0BqRjCjhrq344mPu9/H6dC/EaKOTKpAt2uJDRJOX1Jjj1XkXo4HaZ/fZr4jT?=
 =?us-ascii?Q?01QJkJNmIe/HY0VWpWiDgKn4e3ehMyxqT2L1e1Xh+eyK0k0XMERgnAlmgz/X?=
 =?us-ascii?Q?lZkO4uLtIrtAQ+RDV1PtGHBcCG2r5YPayXzmkfhbIdl/2RC+I2a5VjXKCNdP?=
 =?us-ascii?Q?lP5yKlUBRavpbUCBmK4HzuYn4m7fhpd8GanOcU8LyUYDtrMe7OCff/qrggVV?=
 =?us-ascii?Q?Flbs//Wbkx2o1FiwpfOFf+cC3DZX+D4TPhvA0UcVqY9IdEEa0tWW6UGV126U?=
 =?us-ascii?Q?wUyoTDDccJjfEnrjyFYvR0ZgZXvdPYdqdy7pfCyupddT26F9BJLKCOfK4xz0?=
 =?us-ascii?Q?YTMnPXdXHwdA2xzLzirS/4RnEX5lyxyEVfIW?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?EB3ZFH1sEWCiCc6NQUxoF+ruduskjQ2rXP+COr2bRArYTHY+KQv3kJn73jmL?=
 =?us-ascii?Q?aXXea96llJkBmQXxDqY3b86oRWKuJqamnmOgR/6T11r+cQ+5mDsHs04nSGUT?=
 =?us-ascii?Q?bBS0uCo0z8ka2qoNA7NVGp3KTOpX0YNzwuB7JTqp00Bu7A0S4fNHs+LmFJwk?=
 =?us-ascii?Q?fAfPtJ4ISMDLQNJAp6d0Qge18QPCfihTejPZHrtUxLxhYmrq10fquBRnTkHM?=
 =?us-ascii?Q?kEsJ9GfHisSJY81CAwNqQslqJ5b+XMAtkxi8bxA+rT3+rPwKlie6YskD6VX2?=
 =?us-ascii?Q?+rjhP7WlheOrWJioK3O1BteI7ATykk8RTBuUYzssNzOoehdYP0LgJwrkEGVv?=
 =?us-ascii?Q?8bqu/5XNqbMqFSWk8KxPemVdG5XqptBKUVBUOQCq/bySItYFu9eiMWTpx+3j?=
 =?us-ascii?Q?nsHO5RXvnEoQCD5hqj607dn45np5S7xYq96BG4vpjfcAInWQdrbAGpOtKsVW?=
 =?us-ascii?Q?BzdDKqJsaydgvxG0z08rOi78CIJ76WYufx+/lqExu5iXVUhfj/RuQ5RKppOs?=
 =?us-ascii?Q?a+3GHtY4wP4Gbjjhro5uJ1p2vSCQO/75IZEeUmHzuTu208SL8mA4SYZnIV6N?=
 =?us-ascii?Q?PMbniUZUVU1ILqRDkwP/2KYm9bGsswFrzr2OKTRis/hZ93ZH1ZhP3FyA47YG?=
 =?us-ascii?Q?kYdo6vkQQbWwVd5XWfZZk9/Dc0QiBu2jSy5TTipvxB6FWcTjU/08MPtqeFeE?=
 =?us-ascii?Q?ci/frfyq6MRiMo1GkdsTUuQ0uOgdiDy7wrWoLFuv8ZWWEiYeXJ9U7W656n6S?=
 =?us-ascii?Q?mmNUjx5ZcZAK1LCesw186ot9uINfZmedsYs0R3osDbfsd0HvbbycLPiZK5bb?=
 =?us-ascii?Q?WnvqlzlEbD3vx71KN3UEnmeT4C8py/CRhqJtmCgwP3oncAeYnGDDAwc7RTU4?=
 =?us-ascii?Q?XoNtD+meVFr4aySKlHWRz0J68/jz7riO2zILXlpBoIlZlB7K5xmX5v1wJ0yN?=
 =?us-ascii?Q?UXhS65os3V7a66Lbs8hxJ8jIBzai6Ey/QzhV/7CxbHFkixayw8S73MBKFCBF?=
 =?us-ascii?Q?UAqUY7duURvpYuZic5UWRF35kjqxnR6MavYK2hDMiJZf01mdKOUG3Zcb75Cm?=
 =?us-ascii?Q?L1/K/50oD9ONv6fYHaXE5qg6u5+EvFl0+GKOjR+Ja4iVNZAQHP8IUcFgeDPT?=
 =?us-ascii?Q?mQJYDx1ZwiiIdsvW+cIuw5YJHBAKeNpI1yH5Uph+EDF0ZYAvFNqFNG504C7t?=
 =?us-ascii?Q?HhCsoCWBM+7bfVx86qKgj6pEGq2+8eg0mkOL3qI2ZgYPskWDonPXCRIj+I7k?=
 =?us-ascii?Q?ebfwzJbqmcQnKSNiDaSlhXJc3qS4Hv7tXPBV3jZXz4QjK9gRaDz3vgM4Bysx?=
 =?us-ascii?Q?+YbwNfQLrhzohsKbVhxGnhPdqKDEz1Mz+HaZK6Jxxd29fwbgvM1sC+9XSooX?=
 =?us-ascii?Q?PQWe2wjAZGMZdYypKdhRArragOr5lJw7vMxkZZ7sDtzcW2n3VSdAbd3XHQzu?=
 =?us-ascii?Q?9gkmR5f/iFIU5kx+b8o0tHrhNonBaFfmis2NflDBQIgemBYXhnRPy/fDV2SE?=
 =?us-ascii?Q?us/e2UKGB+PC6oMnG9o54Sn7PEB7QtcS4e+h2LzMFE/1cI7N1Zx1xRR9MW5W?=
 =?us-ascii?Q?VuQB+NxFBcEAmc4rezn+sPPgJbExQWk+PuLQdu3hyIS/j/jFaJ7Hqo2OM3Q9?=
 =?us-ascii?Q?yC8+L0eR7b1UtGHct0wTD2aK/L3yxsjPuE93zxWHxjGF?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7fde2d2-eda3-49c6-247e-08de38198785
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2025 18:25:43.1156 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E+rJdHDcl8j3R3fBJWJsTY8UseXe27aKpVF9+uZy/qjvwA03PiFeQbPHJu29GuGlCRxBulSN/kZkof+8zeBgfMGp1QhtXyI7zhOWTj0+7QI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFD9C09B4A7
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Jan Ma=
slak
Sent: Wednesday, December 10, 2025 6:56 AM
To: intel-xe@lists.freedesktop.org
Cc: Patelczyk, Maciej <maciej.patelczyk@intel.com>; joonas.lahtinen@linux.i=
ntel.com; Brost, Matthew <matthew.brost@intel.com>; Maslak, Jan <jan.maslak=
@intel.com>
Subject: [PATCH 1/1] drm/xe: Restore engine registers before restarting sch=
edulers after GT reset
>=20
> During GT reset recovery in do_gt_restart(), xe_uc_start() was called
> before xe_reg_sr_apply_mmio() restored engine-specific registers. This
> created a race window where the scheduler could run jobs before hardware
> state was fully restored.
>=20
> This caused failures in eudebug tests (xe_exec_sip_eudebug@breakpoint-
> waitsip-*) where TD_CTL register (containing TD_CTL_GLOBAL_DEBUG_ENABLE)
> wasn't restored before jobs started executing. Breakpoints would fail to
> trigger SIP entry because the debug enable bit wasn't set yet.
>=20
> Fix by moving xe_uc_start() after all MMIO register restoration,
> including engine registers and CCS mode configuration, ensuring all
> hardware state is fully restored before any jobs can be scheduled.
>=20
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Signed-off-by: Jan Maslak <jan.maslak@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 7caf781ba9e8..313ce83ab0e5 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -771,9 +771,6 @@ static int do_gt_restart(struct xe_gt *gt)
>  		xe_gt_sriov_pf_init_hw(gt);
> =20
>  	xe_mocs_init(gt);
> -	err =3D xe_uc_start(&gt->uc);
> -	if (err)
> -		return err;
> =20
>  	for_each_hw_engine(hwe, gt, id)
>  		xe_reg_sr_apply_mmio(&hwe->reg_sr, gt);
> @@ -781,6 +778,10 @@ static int do_gt_restart(struct xe_gt *gt)
>  	/* Get CCS mode in sync between sw/hw */
>  	xe_gt_apply_ccs_mode(gt);
> =20
> +	err =3D xe_uc_start(&gt->uc);
> +	if (err)
> +		return err;
> +

This probably doesn't need to go after xe_gt_sanitize_freq (or, in other
words, this is probably the correct place to move this to), so:

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

-Jonathan Cavitt

>  	/* Restore GT freq to expected values */
>  	xe_gt_sanitize_freq(gt);
> =20
> --=20
> 2.34.1
>=20
>=20

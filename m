Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B35C3DA59
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jul 2024 18:27:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49CC710EC91;
	Fri, 19 Jul 2024 18:27:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m7dXjeS4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D95D910EC91
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jul 2024 18:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721413663; x=1752949663;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FLrjMiMNuXvDylcw2RheqX3bd1T2EkgwuRrcmyv0qig=;
 b=m7dXjeS4VlNvTAZf/vSQ/wdPvOb3w7ZOqVn+pnAzuYxlPfgAAbIC2mnp
 6eFkktEPILDciQsSoR6aj/1tMYqk2r8/wx/fluOVU+p6MHv8BA3+42AfU
 6ONUYSA+WurQlx/rv/XxE4MAc2wcslgaVZBBJahYo4mxTHTlxyXQm7Dyc
 tB5kNotVcCNVKRHvRvi1HVq3/An3rt78p0dnNZIh8U+lI+CfwF6DYXKeI
 FEQ7veF+19u6tS1+1GGWQ62bnP7rsroXXkibOkA0/B2Ph0+rKcJPhPgiu
 uqkWSnKTN+eaKpqPx76o/zujwKoVWcKo9Wi1xVMt32MYLE1ku4lc5UQJ2 g==;
X-CSE-ConnectionGUID: asceIYFlRSeHLpBadh9z6g==
X-CSE-MsgGUID: Zvxk1ydUQNyuXhRLyBHS8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="12623823"
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="12623823"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 11:27:42 -0700
X-CSE-ConnectionGUID: tBUdr4hXR7OYLAkfAQu5VQ==
X-CSE-MsgGUID: lL9gMT0WTYuC8tsFD/WFsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="55491528"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jul 2024 11:27:43 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 19 Jul 2024 11:27:42 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 19 Jul 2024 11:27:42 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 19 Jul 2024 11:27:42 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 19 Jul 2024 11:27:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wp+BNv6u0CDFZW02UHibhxGfA/UMU5w76azgMjeg74+w9CI3+0UQ2ROWkghAfW1MfDefgoZ132R+a0NAXKXzpW8uBj73jEzUc+b0XKjYzD09N+urZc5MIKvoz551XY0izk4XBW4hmauAS+z4DNNzxMv20JJDwxb6Rnrph28k4X99fsfdbu4NwjRWIvGK5ahagVH9SYqDzoAB0hQY3ePsQ3d0Y2chlAU0tyMHegpxIb53dB2dwKZeIhjJ+rwyceBxYUOkwMvUQznNSFaiKOEr329Wwq8zWketVdTBxX+K5Kit+C+dXb1XpJGkm/w5OLpWkTQi5NRr0+eCmM8qJMbADA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bfTt0b55r6s82d/W96Q54RBk886tE2jwmmz6YDS6rPw=;
 b=G8jJ1yrvihgPlfLhTNEtQ9JuF5hHzKB44JsdUl0Ueu7mqInRp4CHoZJoMPxmC8DBzYUATPaiPW7a0cNufiCfy191giqnK5CG2KCBfvWC3UDpUbfl7QCeBCBvxYnP9wT3XBPjX8aRshi3C0iUhM7Yj5kYxPvpXUkP1VA5XOOT/pSr26D6vZbtsL2zAT56C+dsn6Or/eGQOOr6kOORlpJkuQh+JCNmNpPuR3pAw0A8+7th11f4cdBpZ44sOJwLiEzNy46ows29ikhaH/nGnsOOWQobNEJVCVyu8/EbWK72XLqITsOxPzrJTvmv8QGsN/izhSObuaFhqDDGHECPnhYjcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SJ0PR11MB6744.namprd11.prod.outlook.com (2603:10b6:a03:47d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Fri, 19 Jul
 2024 18:27:39 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.7784.016; Fri, 19 Jul 2024
 18:27:39 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe: Return -ENOBUFS if a kmalloc fails which is tied
 to an array of binds
Thread-Topic: [PATCH] drm/xe: Return -ENOBUFS if a kmalloc fails which is tied
 to an array of binds
Thread-Index: AQHa2gBUk5TUNNx9n0O1u+NFEuq8trH+WYRQ
Date: Fri, 19 Jul 2024 18:27:39 +0000
Message-ID: <CH0PR11MB5444190326D4257C288DAA67E5AD2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240719172334.1527484-1-matthew.brost@intel.com>
In-Reply-To: <20240719172334.1527484-1-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SJ0PR11MB6744:EE_
x-ms-office365-filtering-correlation-id: b6b0fb53-2c5a-4735-8072-08dca820788f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?4QrwMWGZDr8l35vP5oUkIieSrqTbyftjG9WcfUWTlnF0Mrra4HrpmXqdpYYD?=
 =?us-ascii?Q?XOAwV48MA38C59J538F7pdI/fkNvSK9Yjb9QNIvDzvPSpj0xb50EmBX3q6li?=
 =?us-ascii?Q?l+cGp0MupTZhWgir/bLTKCCfZa2xL1s22uFW8jZiTP4zYU0fRaf/Jq88g3BW?=
 =?us-ascii?Q?qShOCU+8ZfcxIX1+li6lRzDJzESW2shZ2PHM137/OdbCudDUDv2HqqeNahnd?=
 =?us-ascii?Q?ZYNAeFPbcZuBhefNbI/jXY1qyW6Gj1FXwldigphzk8RY2Wzeq/6RVsU8vxJz?=
 =?us-ascii?Q?YkY5Ike2VG0gddDYr1T0tmypR4a9h6SRyUNllSa+4y15dWV3v23xWdkb8FLA?=
 =?us-ascii?Q?gG5AgaisPRcf3pgjTi1Wl7PUapShaCvU7vFwqIt/xNMmcITKuBcMRXpR41k5?=
 =?us-ascii?Q?TsfAMxP3JDxvqM/wzgiKDWsgcuMrqjQ+QVgzEhRl23cnkZK2vBAv3k3K/JCn?=
 =?us-ascii?Q?GBhgfxCLNilxEKH9zj797WTPJCZwWKYTy28aRVGNbtYE+RQLBn8UzUaVBFOC?=
 =?us-ascii?Q?kPUvTmQs2PoDAI2MMfWF1rV7qAKFOCOyFc7yxrjceJs/AnxAStkrG+G2yIDR?=
 =?us-ascii?Q?tKI4bh53NOVME5MSlXKJtmhMPa27BEc4SjKQjgsuVDArZclHR6gPt6YoxSRW?=
 =?us-ascii?Q?Vk8ZfrIPLVYSsJv9gG4EPPU7yfR43O3B7+vnie0PJgvWSJgRg9kyEu7NoNiD?=
 =?us-ascii?Q?SW9WBhpQk/1uTfpn7nBIwVV1tpeNyWJS2G/FXNhZBFAxzyl6+WXUYA2t9kwJ?=
 =?us-ascii?Q?j8m27fANRWb8vIE/kNIHGv2d4BHrgdJuJ13w8Pw6p4lmYKu4LjEpbmTaLhct?=
 =?us-ascii?Q?eA2U9E5GymyqyRcas0HJcLT+a8Wr1qOvPLotQEAcjRMJoWGhrh0Tu09aBLeP?=
 =?us-ascii?Q?J+aChpJxupZ1X14GLpj9g2uHipo+xaOYfFQevGunx/xMWVKMw5fywA4iZpaC?=
 =?us-ascii?Q?bhB/hf3T1R2/xsmVQxi8U0rLRm2kRYIsHAiP5iWpH9zbA3qNz5kZcMKuYUmh?=
 =?us-ascii?Q?wZVUTBk67EpMovRHLXB+DT4Gk1WA3zrrU6n1octZr2Vlfci2PF9Z/odpUrjg?=
 =?us-ascii?Q?0Or7VRYw/G5hrS5coAZDn8UrgeUqW1iuVvlXTw11qTwvkwi52G5AHT9r9zWa?=
 =?us-ascii?Q?LMLjJuqGVPR6+BvH5VOV2m+m3MQSbxiWVPbmi8zmaj0Qmfq6DcVssulTcaMC?=
 =?us-ascii?Q?81qon96HdIBUQ7VMJAW86LMqWhPF4GCe9tds44SjwkRkM/6dP6Ldg/VUsUhs?=
 =?us-ascii?Q?I5Anzt2MaVXSjC0MQ0ojV0BsbyOJTOCQgU0xTAVv3wg3xkUb1gJqcHPsKKJD?=
 =?us-ascii?Q?IJrWI0oZOEyAie08M+sdKuHEzC161Dxle4j9WTydwEvg5cIjUfaty5gWWomy?=
 =?us-ascii?Q?LZzNdAWckmRL29irP939mOACWG5dp4DtXaWsojpFuTYvd31LtA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mu0kZtOiGxZTqblZhvkWciuCULfMoGXift9JWEAmjsTQU+cMDOgPbj8nwcz1?=
 =?us-ascii?Q?JCcPW91mIe98xAd/yGwgrIY2klYh6/14vQeiGgD/i1rCJOpOrbsTna/bXqIK?=
 =?us-ascii?Q?DH7RQlzWED2ikdWXXy+QvvKw1c61+ZMdbAxhN4vj/pvBV8wSVbYSwoh4a7lB?=
 =?us-ascii?Q?EdC2po6CifWVKxalebI7V63CIDdAohS+bQ3JQsJRvpHqlRTgWwtuAbdXCkyD?=
 =?us-ascii?Q?AVlP1eDxXTKVchzUyvsfODHGn1mg6CM3icznqUXofTgyoxC4Yk261s4SIgxg?=
 =?us-ascii?Q?pNy0MbmHR296+z2Le1pfuM3uGUgTdbraXzqrsegDu9yBf3tMj0lnJQwDbhix?=
 =?us-ascii?Q?Q/6r04lsv+iUZ7qi+T8pOPIvFIH751J6lHzfhgJ0OLsqoSTGCNR/oYoGFMgL?=
 =?us-ascii?Q?V/yTUSBE+XSl0xg+OeHUFqAUUtrtsfG5CtIA/22eAeaLCABxS7I/vR9owTD0?=
 =?us-ascii?Q?KWa8NrEocNCo4DAogtJpgm6/mfrrWEU7G0aPuFkMMBEhYMjP3WQ6ufOaKnte?=
 =?us-ascii?Q?PhdSudmzmUzpB0amTL+WoQ+CW/Sae6MN4MqoTzojNO3aKY13G4rO55C6yNh/?=
 =?us-ascii?Q?6KDKawGkfk7gV/TRuzPsIY8LBN0fndvYb6NiMkQY6Y5i9XnyZX+9qw8xM+Hc?=
 =?us-ascii?Q?8SylYHWYS73afz2osWLwoWkS+PgpW1f3YEyTtTpGAZWvBLS9Mo4HG4cSecF5?=
 =?us-ascii?Q?MiTysnESZ56OHfkmzFDT38RVkyH4sYn4eTQKNAdLhTmtF8MQukJ4mpypai2s?=
 =?us-ascii?Q?LPOBvthJOxxtiP7Y9drA1M4xy2OIYOyAeXxa0Xfj535RYBBa4dMMHsx7Its3?=
 =?us-ascii?Q?wkSTEOLwib9/0SjgEj+oBFF3EjzvGku/5MPT8fpK/5eKUjDqWDnKNpTPY879?=
 =?us-ascii?Q?nnmf1tZbgajMXZb24CCNDYVggab5MJpWSkgMx6wgE0qTCLbSVezHm/OMufRp?=
 =?us-ascii?Q?g+U/SXjDhva32iPhWdoXwZm/vk3QL/zZRNyFUbJi14uPDCfGGOcHUaYghxlu?=
 =?us-ascii?Q?kvjwbFHOiNZkuE9K9ooYBWD9RaTXxc/dwRc87MkOPz5qkNMMvxHV6pi/lWYZ?=
 =?us-ascii?Q?iSL6kU2qf1Fv4eHR98uRXXT6tVZekETAidn2pii9tL0VBI9EMR9EgpI8jzWY?=
 =?us-ascii?Q?PpNyM9gaRpg3450sAfas6InQeF3dKc56I6FSVDXfWSI7NATrajW3H0RriZO/?=
 =?us-ascii?Q?FsKaWyV6qMoHez3km47Ace20fO0RzDz7JXHvHfo7krTLuk6QWFye+RXpvgWV?=
 =?us-ascii?Q?tDje/7tGX8APCwtLtlc/LG5CJUnA3nJrh2pEPf0SWC3EvFTBlx+UazFDC1Dw?=
 =?us-ascii?Q?4wUaATN9BFx0zm+Zd/vBCaiO1ds8fVaUaG0kOv7K4PuDEShals/4idcpy8qD?=
 =?us-ascii?Q?VbLFr4RhBpUnKwnh/naU8o+DIyP0xtatCYoLle6xHQqTBvzzzHpjxw+ynZnq?=
 =?us-ascii?Q?8hJhSNpuFSRCog02mOKR6qFWBIajTux1ztuOFe1izU9m06ZQwbX60a1a8OP0?=
 =?us-ascii?Q?vi9FZGyB9XqVYtBBy2LtxrwniSJpkJSMgqkrWeptFs2uok6H5Tx60bEKxl4n?=
 =?us-ascii?Q?IyeV2Qhi5d7EC+ZX9CRatWBx+PIPNBhBiBojMwkI?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6b0fb53-2c5a-4735-8072-08dca820788f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2024 18:27:39.4514 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c3SoVg1SHEsJDH1m3Qs89nEvc10DWFr9Yj5Z8TWRbJDfEDqo/cjdgvmtyR7AIb/2kQObwiSTjt9SarjzaBA25teUL0nyVIjGI8vyvqIdSA0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6744
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
Sent: Friday, July 19, 2024 10:24 AM
To: intel-xe@lists.freedesktop.org
Cc: Zanoni, Paulo R <paulo.r.zanoni@intel.com>
Subject: [PATCH] drm/xe: Return -ENOBUFS if a kmalloc fails which is tied t=
o an array of binds
>=20
> The size of an array of binds is directly tied to several kmalloc in the
> KMD, thus making these kmalloc more likely to fail. Return -ENOBUFS in
> the case of these failures.
>=20
> The expected UMD behavior upon returning -ENOBUFS is to split an array
> of binds into a series of single binds.
>=20
> Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

LGTM.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_vm.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 3fde2c8292ad..b715883f40d8 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -718,7 +718,7 @@ int xe_vm_userptr_check_repin(struct xe_vm *vm)
>  		list_empty_careful(&vm->userptr.invalidated)) ? 0 : -EAGAIN;
>  }
> =20
> -static int xe_vma_ops_alloc(struct xe_vma_ops *vops)
> +static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_binds=
)
>  {
>  	int i;
> =20
> @@ -731,7 +731,7 @@ static int xe_vma_ops_alloc(struct xe_vma_ops *vops)
>  				      sizeof(*vops->pt_update_ops[i].ops),
>  				      GFP_KERNEL);
>  		if (!vops->pt_update_ops[i].ops)
> -			return -ENOMEM;
> +			return array_of_binds ? -ENOBUFS : -ENOMEM;
>  	}
> =20
>  	return 0;
> @@ -824,7 +824,7 @@ int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker=
)
>  			goto free_ops;
>  	}
> =20
> -	err =3D xe_vma_ops_alloc(&vops);
> +	err =3D xe_vma_ops_alloc(&vops, false);
>  	if (err)
>  		goto free_ops;
> =20
> @@ -871,7 +871,7 @@ struct dma_fence *xe_vma_rebind(struct xe_vm *vm, str=
uct xe_vma *vma, u8 tile_ma
>  	if (err)
>  		return ERR_PTR(err);
> =20
> -	err =3D xe_vma_ops_alloc(&vops);
> +	err =3D xe_vma_ops_alloc(&vops, false);
>  	if (err) {
>  		fence =3D ERR_PTR(err);
>  		goto free_ops;
> @@ -2765,7 +2765,7 @@ static int vm_bind_ioctl_check_args(struct xe_devic=
e *xe,
>  					   sizeof(struct drm_xe_vm_bind_op),
>  					   GFP_KERNEL | __GFP_ACCOUNT);
>  		if (!*bind_ops)
> -			return -ENOMEM;
> +			return args->num_binds > 1 ? -ENOBUFS : -ENOMEM;
> =20
>  		err =3D __copy_from_user(*bind_ops, bind_user,
>  				       sizeof(struct drm_xe_vm_bind_op) *
> @@ -3104,7 +3104,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *=
data, struct drm_file *file)
>  		goto unwind_ops;
>  	}
> =20
> -	err =3D xe_vma_ops_alloc(&vops);
> +	err =3D xe_vma_ops_alloc(&vops, args->num_binds > 1);
>  	if (err)
>  		goto unwind_ops;
> =20
> --=20
> 2.34.1
>=20
>=20

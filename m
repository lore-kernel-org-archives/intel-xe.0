Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E21DCA0EDC
	for <intel-xe@archiver.kernel.org>; Thu, 14 Aug 2025 21:31:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BE1B10E120;
	Thu, 14 Aug 2025 21:31:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cs4n7B22";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F47810E120
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Aug 2025 21:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755207096; x=1786743096;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NzFwJkvCTjEqZfZqEMowzwYGxHfOzdRXb31MtvSfUWA=;
 b=Cs4n7B22evazpdQueknOC0eUm0vsreT8CsiQ8tb+xg8An6kuZXn/dddW
 O+1WDumKJb1fuugtrWux3FcLCeZxsm0GBRYNmF8oJNPQQsnlBQ2suQ7+g
 8qW6tnRUm5nyzRLLd8W904k02jblQM+fD8m7me64sIvgf4zB8vRrlGdyg
 ZjhrdqWYyT+nFNJyCdU5Zhn/pONVyjHosQokfRgCMFStOeU9Qx5oUuXns
 r1axQTAEC04v+ubMJSkV3z/xqyjJC//0vtQ0RaLHH5TDp9asFvXrJ4gAK
 iJmcgdkqLoUZ7Hg5ER4JGIvdPEn8InZ/TvD3L3KO/IGpK9wW7CHrYO5ft w==;
X-CSE-ConnectionGUID: JZojr6TwR96poafOEyNRVA==
X-CSE-MsgGUID: Pt2dJfonSEKSazv9+sY0cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="56742882"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="56742882"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 14:31:36 -0700
X-CSE-ConnectionGUID: YnMI9ZNCQf6SW4a1OuFRMA==
X-CSE-MsgGUID: 8CUrd2uaRmmtlnE+Iz2Aqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="197855205"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 14:31:36 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 14:31:35 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 14 Aug 2025 14:31:35 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.82)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 14:31:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E7WUJMqnWYnRo69lcVeyI+NWZklszbCX5RH5SajoQmS10sgHnSuA9flfz9VhwWsLCEN3EKdyyNMaouiMPFRR7DCLmiQRiYd7NhKOLeXASV/2pNqZNl7iUzoGDpDVHRkNuRV5vB29HI+scUwauFlCPuy9kfJwXFbJjR37Sj2lVq6x6EPa6T83Imz9b40Eb++mVUhlyTAemjuYJ7gnt69KXHm1ObRtwLEbDiChC2r9wHRa1iqp4ygCvZN0juHoRDJMej29GAlfOdWz7XRv1A3GpnqEX/oaI32Rwf+evKrgijJiV+zJN1O8SCePE7LbPJ6NGWu/NcB61SEhFarZMMxgmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q/26jR/2/ttgDjYSlwQw3oeIkWB58kNjPu5IcZc9GVo=;
 b=Ixmt7E7LSSLGSrrObkLwW/t4Z8Na1rc/NZWOLJVrCVNFxieGCGE+0yoE5w9mz+b+pntODgtAxfZ5yGuQyNTz3JBfOjtZla/30oXC61PyTgQFhX3Xon/4xTdfBjzQUdeyqYFh3mP4JNTSkjBwTnxu3fWqW9ucP/IcxIp7c+tCBcZZdimlCBCb6Expprk/qoAWEPW4HfZzRMqRKgf0hgVB+zPi8CcSvCWmJ4/53TUWNnou0PhMx5ov6hAR3mwueczxcHzQ7HQOVAh7GMjfI7Ljkr6gOCvsElmzrRV+MOXN5HfBhyGe6f/+WxAvMKjnfL68fhxrNzJekPV/mJZ7mXRe3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6266.namprd11.prod.outlook.com (2603:10b6:208:3e6::12)
 by IA0PR11MB8303.namprd11.prod.outlook.com (2603:10b6:208:487::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.16; Thu, 14 Aug
 2025 21:31:31 +0000
Received: from IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::eda2:e570:4314:8720]) by IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::eda2:e570:4314:8720%6]) with mapi id 15.20.9031.014; Thu, 14 Aug 2025
 21:31:31 +0000
From: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Kumar, Prashanth" <prashanth.kumar@intel.com>
Subject: RE: [PATCH v3 10/13] drm/xe/configfs: Use tree-like output in
 documentation
Thread-Topic: [PATCH v3 10/13] drm/xe/configfs: Use tree-like output in
 documentation
Thread-Index: AQHcCIoh9+iovcrm2keauD3u9WxV6LRiWWZA
Date: Thu, 14 Aug 2025 21:31:31 +0000
Message-ID: <IA1PR11MB62667EC98F74A86A6EA78B91E235A@IA1PR11MB6266.namprd11.prod.outlook.com>
References: <20250808-psmi-v3-0-a111e9f1e4b7@intel.com>
 <20250808-psmi-v3-10-a111e9f1e4b7@intel.com>
In-Reply-To: <20250808-psmi-v3-10-a111e9f1e4b7@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6266:EE_|IA0PR11MB8303:EE_
x-ms-office365-filtering-correlation-id: 1f0af013-6549-480e-99b2-08dddb79ef96
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?koi8-r?Q?IX4vjWhBFWRI2XtgMMH22t4uMvl2ZpEih3+q5HhUOFf4iA+EObhgaF7/CkycpF?=
 =?koi8-r?Q?1vD/oaYsh/RCC0pa+TS2LCvcdRMno5fa7V6zyU7VGqd6L1ISCrGF/k/lLxM+n8?=
 =?koi8-r?Q?iNSUVOTgyq5g4ATsp+Mlyyxnuw/posJJx2uNeKO9dcEIcBBmO+9TTyAdlXn62J?=
 =?koi8-r?Q?2KjSAvBwsF+Cvlc9FigPTx/33yJCO9bJ8RZK/B2GzOHtlQ42PPN0IjLzUxlFeO?=
 =?koi8-r?Q?iyfPpBxLGiwh952e2VtroM/E4+6sOdAXe8tqLovlIrGmvxG+QtBPuiim4h+OzO?=
 =?koi8-r?Q?vErzVgil2sBcZOpo3MPhDqJRRfZyQPG4IFs6s5L6SgK4KZNVxkjA9mXwYy9/1S?=
 =?koi8-r?Q?lTuCenG3JPVJ5IN/MkSMgLd1FYETuJJh5VXrqoyha+bhQFVs5MzbuV/bPoTFbx?=
 =?koi8-r?Q?xBBClm0iV7pNk4Bp5g8tLQtBTlZ1SZRGhiL/IpyKt9iYvZGK6ZiPaUKWQDy17/?=
 =?koi8-r?Q?E/5gjJMd7Nk+RLZVZMVMKkNRr0KA4cCQW+KNqJgteGZoXqzWJeqobZNmQlkTi5?=
 =?koi8-r?Q?jrdgsh1dSRLKTLyCAsEllJ6RrZ/m8DU5IWvI4N1iczOnbAjmIpScREm2v+2mKO?=
 =?koi8-r?Q?TeJqkaXJW/vXLwKfT3rM4al5oF9rf2ewN9Mvrf+2TdpxBlRDkwav2MQTpcz+4n?=
 =?koi8-r?Q?bLwAJ5iokamOpPxI8O5br1w3tImGjU7Tv+RuXvasJNufX2CuwbytELiE7mc5fl?=
 =?koi8-r?Q?1A13Ka4XeLZIb26yI0HGn0jaRpu+fGAN1bBvrB+Uk4gdMleYlKTk3RVEykREIS?=
 =?koi8-r?Q?8X4xEkrYNgdE1poCu+UKTpIi1jJ0AJz3svfbRGtExM+wxnOpX74JfNQwpun1o6?=
 =?koi8-r?Q?l9p+kRpSwJ4lZUKo9c0MzPB1L80VrurZBDW0MoRrBVfbpqrTUSSGMRQ+6gNE/L?=
 =?koi8-r?Q?FJpm7XuapxPl7y3XBfbj35ujDTWpPbocniAL+5L1p7IYmhvp13egZ6MR2z8s5f?=
 =?koi8-r?Q?Z8aPwfRuf1Tf6nZRIe6AiD168CgOdGRY3VZQVwlSDpI2zfybDZdqVkYSAuND9I?=
 =?koi8-r?Q?RdehHpX4O4nRWRjpvh86wBvgTbFJZ97XJ0t6jQoY6fwbulf6UqWLuUQy2G3WXq?=
 =?koi8-r?Q?zlhv3TW5EBkod93vT23BhGft4Wo828MvotivtWjJUPtDAycR7NvxIfrjanZPRQ?=
 =?koi8-r?Q?12+GRR4BE6JQ3FYV/chQARI48WYZCz+8sL05rLmY85E1tjLe3s+XE53oDrJdFr?=
 =?koi8-r?Q?TTT7BssNPKuyLvZmqUypIvWzcRCoZFb1Cwt6Jeuh7q9k3ZqGeoDw1qlE/g3is7?=
 =?koi8-r?Q?zdvciVtfsDDJynmgH0IXIeh8Hfdqon55S95fA5Q1Ri6x3/vxWLEJCFcsW17/ez?=
 =?koi8-r?Q?aJLdCoZjgtUUFyFgjh6GaI4cLjqh/oG4nTagrMfJVx2azGqcZm/Lz7JJSnu4C9?=
 =?koi8-r?Q?0JPZtgeyps7OP5XcbquKZlPjWq506YAoso37m6uuUoKmKIgbYXnu9DfDn4SrW9?=
 =?koi8-r?Q?oX0UdfKINb1FXB3ALjgAL8RKi1E=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6266.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?koi8-r?Q?+ZZkyxSy18P4lL/liiqHtsUEmvzuXx5+MBWGyWki6FPE+2lEYgrWEkP6axeMAO?=
 =?koi8-r?Q?PbWZ5KlV3K6E4CpVtWmzpewRzw2aSzZ1L7SZfoXHsRrM6Y/h17a4SBfcKW0HnL?=
 =?koi8-r?Q?JvosrsfRtD0Xf/V6njLhgcYPNeM4GPSCQfuSUdY3R7n36rmVwONnIbHi4iFC9h?=
 =?koi8-r?Q?vCDVrGvd2XqSg6U+CZSfWkyJ2Kf/L6tjHhcNdy8hpAUMIHrPyizm/IVNCrt2D7?=
 =?koi8-r?Q?aZ40BqDgI5exB6c+kJQhehxHPmKS2+0jNYIwIUBZm919hCD/tQCtARYhR8Rc1e?=
 =?koi8-r?Q?fu3JDPKlAtS/HmXpQIVu08x0bsj0b6Ix8abHVg8qwFcNXylLRH4mIoWBUqsPB6?=
 =?koi8-r?Q?ljrp8SVegHpdfMW2YfI6DZn5aL1Us9zGwYWD7dOK5QXZ3nXNo7ntRv1EQZ2ITl?=
 =?koi8-r?Q?Ai4ewktuynOilED46gjnYdc3CzVy+zZPE8E3uryJkGN3I1tPqpW9ZeLdirhpcw?=
 =?koi8-r?Q?Ty/zvd4eK1HFQCGOFn7ErQF5vDxAijs5ryMs4u5K7vjhBihD/J2BJ+J9yeWqdj?=
 =?koi8-r?Q?5K60ioziudTPS1M435jxlU48EgEEXD3eD0xLHTQvpkBMkELMKFxOy8IUxdZioF?=
 =?koi8-r?Q?0Re7OJjbn5pg0wbePMinnJBvpgs3wxM/apq16/rSKUDm97GtR9qDbv/1HGNhFf?=
 =?koi8-r?Q?oAdEABKIfR3WX7Nrh7KJq2DCEraql+usTC7U4ycrC/YOSac8hrZ8i9tYMOn3DH?=
 =?koi8-r?Q?QIhRUzH2nD0CvkcZjQitoyKotjJk20LWf++L714/pro3STY9LKSVHfY2Tnck62?=
 =?koi8-r?Q?KesgN9X4r+1dLb3ThMdZYQnkczK/aGPfMwuct1RbhPFrs1G7LsX30nQVUOFuJj?=
 =?koi8-r?Q?qv6VpnkACQ07kq6PuZmp2vZlrGSpRnp3cl+zeu8QN319Yj8XSmhnHMn7oDp9oF?=
 =?koi8-r?Q?zsuwMeqyxY6ScgnPn9l4/PJCFQIv9ioDWRjdf70gq2ffkR2lbdmRGCBgMSOPeU?=
 =?koi8-r?Q?yuAAtyIM6/wswK48mX4G22DWON8mLKms84AJLLdA5sMvmyF4jvbxb9SkKKCWlq?=
 =?koi8-r?Q?8Ik/MGh7YrD/i9aXlK7oNaoCY30tjteJfbb4/b2Y3d/s4DQPx9ENHp/0G2tBwn?=
 =?koi8-r?Q?FXTh50lrb2MKABzviHt0JRPTOknk6Kol1SFaHu+h79RiEPDCcoCjWu+YKNiDrA?=
 =?koi8-r?Q?IX3S75y8WnaB3yDToxkExCr95YrCjKQRa2+f831eiX/Gg7QMV+S9tt6dboba+m?=
 =?koi8-r?Q?EvY7CssfQOZ9YuZPOs5iry/aoJC0WVzeqRpHULF9nxeABbt1O/EFcHzO14XgRZ?=
 =?koi8-r?Q?4DjBsV1LhA9P+j7vmz2q8moC+XuwLQj8s1avaaEWPy7cFzxjO+UaYCjIibaUAO?=
 =?koi8-r?Q?d6l9K1++T9oTpXcwrIRJnvBnAnIuD3aIYlWfopcSRrIhvYyTE0YMWDLL7LK2ni?=
 =?koi8-r?Q?R4mgFWJo00PlHIuHrSgP6Rav7Rv8CEFCzeiOU2KFyApGG2xUtVFVwLgGaDVbb5?=
 =?koi8-r?Q?7ajphJhgGba89//+59PiyR07pR73A43BfoYUhSr1edtm57fbMH8Oh1KLwoc185?=
 =?koi8-r?Q?Q7D3Fdg5OdsyXs4TSb3nYTE7Kt1e8oLZYT7yw+K9NFumt+rNaXVSPoW0OOFKoJ?=
 =?koi8-r?Q?YdmAcu0pcA=3D=3D?=
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6266.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f0af013-6549-480e-99b2-08dddb79ef96
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2025 21:31:31.3549 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kBqw6ngkTeNIlvx80/21FMTp2BzFAiYx6x/Dzf19hKfGN8E34neuACAf4FolwhdEAJoOYq+O6PsNBZcYviuf+GURBRD8I+ZmCgX+Y7aldas=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8303
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
> From: De Marchi, Lucas <lucas.demarchi@intel.com>
> Sent: Friday, August 8, 2025 11:00 PM
> To: intel-xe@lists.freedesktop.org
> Cc: De Marchi, Lucas <lucas.demarchi@intel.com>; Kumar, Prashanth
> <prashanth.kumar@intel.com>; Bhadane, Dnyaneshwar
> <dnyaneshwar.bhadane@intel.com>
> Subject: [PATCH v3 10/13] drm/xe/configfs: Use tree-like output in
> documentation
>=20
> When documenting the directories, use an output similar to the `tree`
> command and add VFs and missing attributes.
>=20
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
LGTM,
Reviewed-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>


>  drivers/gpu/drm/xe/xe_configfs.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c
> b/drivers/gpu/drm/xe/xe_configfs.c
> index 489c5c67001dc..7c92d293ba733 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -39,8 +39,16 @@
>   * used to configure it::
>   *
>   *	/sys/kernel/config/xe/
> - *		.. 0000:03:00.0/
> - *			... survivability_mode
> + *	=86=80=80 0000:00:02.0
> + *	=81=9A=9A =84=80=80 ...
> + *	=86=80=80 0000:00:02.1
> + *	=81=9A=9A =84=80=80 ...
> + *	:
> + *	=84=80=80 0000:03:00.0
> + *	    =86=80=80 survivability_mode
> + *	    =86=80=80 engines_allowed
> + *	    =84=80=80 enable_psmi
> + *
>   *
>   * Configure Attributes
>   * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> --
> 2.50.1


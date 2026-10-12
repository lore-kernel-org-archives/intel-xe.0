Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DAC4CA9ED5
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 05:12:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0182D10E03A;
	Mon, 12 Oct 2026 05:12:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 462EB10E03A
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 05:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791781950; x=1823317950;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=h41Be8+j3S8WgpJNHbppTANGEhKL6npGc2pDCd3GbG8=;
 b=CuPdSDIb/LnZvNr+ci06CM0aWXh/6o0dhXK/PV4oebeR5u24l0rxUF+a
 UB4fG048psJenmqqcoAUxy+axsp+Y+/mUy4tXqSzpp68YIvHVHDmfqNqf
 ZyY+d6pN4JoqFRsrcDvBFWH5BECu7T6+shI04a9phPUNjoovLnXFjUFxl
 ehrUFcHsABiqTKOga/rP3nbulj49eLM6MzkNNfqb0HpYog4lx6ppTsfAo
 2qggFDPWX7SbijuqwsZmzY0pLXwB2ttwMQeZSZQf8H/TLSyRCBbLs8Nlb
 lghkHaZ7ywKMHBIxhYL8TSRccAGmV6d5a0htRPKQYiaj0sakYtKfzQA1L Q==;
X-CSE-ConnectionGUID: 1QRQ7gFDRHqPLNBteurNEA==
X-CSE-MsgGUID: LwU5Skr3R9m0SX5vYH0/ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="473569"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="473569"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2026 22:12:29 -0700
X-CSE-ConnectionGUID: F8yvqiPEQo+1FzP+e2kWPQ==
X-CSE-MsgGUID: 0wCw2LC3RVmK9WqPFdfO3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="765657"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2026 22:12:29 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 11 Oct 2026 22:12:28 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Sun, 11 Oct 2026 22:12:28 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.39) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 11 Oct 2026 22:12:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=clJu2af7bKV0Z5KT/wa0LfTPVHR0p14K9A5vuVhUOd5d2lxr2bZ9I+HO6IUOmHnmRf/NSN8jsKJXu8+MkZ0B9NpTJw5shVCdw7w1tfriIVA1WefT9WOKNsjTSXCFhHlPe3B2ZSXbFvwIUbxy+REATnwK0Q4SrIFzlBO7QbhbP2yLWxIVaKb0bKz9yBXPCgZUz9nTTFLHSttzb8gyzgJOOjceXyBfMQXEM0IrpMsbX36mkFtMY0sqh8f3nPzX5YUs/EF+s4/T1LVCTUBrYiSMbZK98y/hgz2n+ujPEgDHDxY+AueZFk3r2TjVy53A6MfNBVw2UiQSPu5qWNs78fZ7tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=71WJ82gICf9zIOvHyUBgC5MDLxFZazpOQZTixu1Frv4=;
 b=D0qVfQ5rWsJicW+UV/Fs+IOlwM80bp/7/gO+c7wQ9/nNFIsfgkgoC9JWJQw8m49PdZD/OGwnBskPQmGQh3gjP5Hy6cygGa9fH9Ur1vjFV/aNMSRARXelxUG94d1G+jL+M4VGKos7ekqnyv2/l6Cc1izjU/1ozKB6Togt3xQf2ImEgkFtEwmuEF7tLOqt11drT/VH6CMgcu7DTI3HeA3ZXcmahzWQ5VCezKRtSO9ZG5INznaX579/6+0zxRTt5TI/YTiyEdWyYdPDDlqPqWlfh7GSZnRti/hugOAiyhwaABvTxKhjT1jNP7tTmVIkSo+kWJYRwhf1j6XyD657i2z9mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by SN7PR11MB7116.namprd11.prod.outlook.com (2603:10b6:806:29b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Mon, 12 Oct
 2026 05:12:25 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 05:12:25 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Gupta, Varun" <varun.gupta@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Tauro, Riana" <riana.tauro@intel.com>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>
Subject: RE: [PATCH v2] drm/xe: Add wa_14028434957 to Graphics Version 35.11
Thread-Topic: [PATCH v2] drm/xe: Add wa_14028434957 to Graphics Version 35.11
Thread-Index: AQHdV8MyxxZxI64SiEeeug2uhsQ97Lb5X7Ow
Date: Mon, 12 Oct 2026 05:12:25 +0000
Message-ID: <DS0PR11MB871877C3D61FED9F74533E83819F2@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20261009075224.1316885-2-varun.gupta@intel.com>
In-Reply-To: <20261009075224.1316885-2-varun.gupta@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: riana.tauro@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|SN7PR11MB7116:EE_
x-ms-office365-filtering-correlation-id: 03bd1499-9545-44c7-49c2-08df281f6761
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|38070700021|56012099006|260925021911599003|261009223027099003|10067099003|11063799006|260925022911599003|260925021311599003|22082099003|18002099003|6133799003;
x-microsoft-antispam-message-info: fEPjn5URI46+UWTFcV1nQll4TV44CydT8AuYMslS3pzz/ZIksfh8HkdBFMVWhomUH1F+bmfpKgfqPo6ckCeOQrkCQj2vrn2Ke3WlkiTbXKBnqU0Zh08O5aRzp7q3E1kxwZ41MMxYfFGwAlkIQsMG5BcNtuyB/0TAj0mVIsEMskcCWkrgzTDj/qtOnEGTxx2MqRYMqZJ8nJZu2LvwIKTyarPGFpIEo6qCdCiE46ZeVZNQ4vCXuw6+rami1/bz+6bMeGy5rEA4TJYv4gBN/BAVpJHv3PPAyZPrM5Lz0FUnbyEwc95jLJv1YsfxzrXqXroubz8U6Dp7pARomkCGgY5BdTwiCVaxoIH+ROmzLyFF09iHYFypGmR9Sc5amK8IHLVFHdl4qWN5POfVl1nC3uegLkm4pRtz2J0aMrDuMoBKNF2Q7dbcDXPa/xMzHhSeLoMO/EhN6crwrokEy5J8HVRb+aAkx4Q4UWgyCSf72mTJNBpN7gqe9kfz4gA5u+wKWiUgIgqqHEtn0m7zCjNyDt1HiulNE/Jf/OeHWCsarSMiHNQIIIPRXlClEYGG5VpDtc2IvZaUqeN2pSPGKSWpNt4dm8YPGdDJj0l9Id/fKP82s3dVwl269/2+F3X7FbZ6ve3NzxvRW9wNKeLrF78HL9ov9mn/TRicSgJDc0uB/BKoBzF4cHWBygEa2F5CyOfmLkT3d3rNFRJAEENhrarGDnqif/c3L4CcYX7eZY6RUuXmHU8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(38070700021)(56012099006)(260925021911599003)(261009223027099003)(10067099003)(11063799006)(260925022911599003)(260925021311599003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dUf+pMQ8zZE8TsglheFBRa8ZXBxrx5XO6n+UwxEYbEvuTBV1Meh/fPa5LDp1?=
 =?us-ascii?Q?vaKiEawKXyf/+6KsW3wpm2+g544UptJsq/q4mXd+yjVGQWz8sNZK/RPFnBr7?=
 =?us-ascii?Q?KlV768VLKElHAyYiWPib6olYDT/CPKROhb/QbwSDC3YBDUJlNwajUqVSIv17?=
 =?us-ascii?Q?u1JYMCKV3bC/ey0apAu7FJ4rOjTkMSxy4hL29nxKP+wJ/+1BxICIXimDzBew?=
 =?us-ascii?Q?XclAS3h1qs4e3sad2PkoGX9aDE78U9VreU6YCFBzv2vy3eWjYsQsDrAh1F+p?=
 =?us-ascii?Q?tDUOjFghVApcjGqQm+k052re1Dh5QWeFibjOWKbZFHyg+Very94asqo6hfUV?=
 =?us-ascii?Q?U3HvvWEJRGQuD/lr/DmXivn98dFgDphfXmTjScrSHxMR4ghzfDd7fHXtbWBM?=
 =?us-ascii?Q?DTTRg1PAQfX5EKPZmwf3xU6f+50R1EUmPNni0I5g0zwdl4e9HWakzNvlJZG2?=
 =?us-ascii?Q?3KTNgdaTQO9I1HXa/pB0N13ZF6gkgHXsfZegG1LQTIDuNRxwvxXsjBEZIIKl?=
 =?us-ascii?Q?hGNbFv1i+2j8TLzck67JAekg7KnfNQPGLSTlo7DUNEbRjVBunYm8F75w57nC?=
 =?us-ascii?Q?jWdXZZB9lcgIuXhuZV0518btyxdm01vV+D30oZqdK/jy9PoXMJUYw9KdCSdd?=
 =?us-ascii?Q?Hk/YZ7aKE2nRLPPxOlReJ0DHmSu3KFFSqiOVyqcICI8hRrSPCEc6RsmAiFrS?=
 =?us-ascii?Q?prruU9dAxgJYvly8ZNgdwZtXbJZSD7v6jrAY4NC85Lm7TVqVixvin4J01qC1?=
 =?us-ascii?Q?VyDkU2Ye2d/YYWk/ptzBAzqmCWxs2d3EqWsrhYumBKkkEubMOHPlV4ty7VhJ?=
 =?us-ascii?Q?7015vU/37D4ft0fgTHnlugtAxEGcVvi10Rsh1gUfycnZEg+lYLZWeW+SFfpe?=
 =?us-ascii?Q?RIz17MKGDtzaWhOdVx59uR9VfPqZhfGD5eyb75T0EPGt1tPpravjwpny0kOt?=
 =?us-ascii?Q?579CkNslWPaHGaZwAgTW35dlwhG+0hlZNGweNnUH8sRbdKLOI/skNBfBsD7S?=
 =?us-ascii?Q?WqHcb4y2p4EqWhbKt3+kSNikC3Pa+PMrX12n1rkvhlnMbOy5UeK9TmP9RkEo?=
 =?us-ascii?Q?isnZ6HkpFFiK8Q/iurzqBZdP1FpcZFZMtmng+tpb8cp5AEKuC6XL5bsYxdKw?=
 =?us-ascii?Q?E5KO3y9PBHH0qRBa1yZlDd9xYh2njGbH/ygmxL2AB8khf/YZa3zxu3EVsioH?=
 =?us-ascii?Q?sc2Tl7PPYbhpUkqAjACRDQXKeepZVO0H7RA+164BPvKxMjCX+vfWPYETyUp4?=
 =?us-ascii?Q?XqP+5Twb/6UHswNyEd7iH8gpUsZ+O1M2BHe8410mbcIrbLcV8HLl7l3wymEE?=
 =?us-ascii?Q?PM5uzF5zrU9Hj6/FlqIQkEAlDNl/g5zBxOKJ48Q1dZ0z+p5AFk5I4eXNo0Tf?=
 =?us-ascii?Q?pNlYxada189AneLX01K/FUgLL8OY1dZgmqAyi/twU4wbXYMr8DsOAaWEA1dW?=
 =?us-ascii?Q?kzR8y9XJ6OaEFnV4NRqz4UDymIWxCVwG/G6ykeeSPyXrNA1cP9Lo/X6Ku/Rn?=
 =?us-ascii?Q?f8KogKpZ5oLxFxZyZHV+3zsgs9YRW1G5rgQ2Bs7/4QdLaZxrHe3zsp87AmFF?=
 =?us-ascii?Q?/BJxyDC5hQI7cyvTHQKM0ZdIeUTgD9bYtu5eU+dZMSbDNIHcakgxqyCrHfLh?=
 =?us-ascii?Q?gP2s/byAurR/UjrTs7mKasRjPDkEiTHCoKUU1YqTI0BpmjEDYJCeK2xKAr+B?=
 =?us-ascii?Q?M6GxFlEJoQmlaEQMvMYPnxMb93lsvRyNbrpk9tqChTiAnpzlwgya+S//N6gz?=
 =?us-ascii?Q?KOMJpchdtQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: oJf4NqEWNhYQVfCQKlaAe24vJuPQxi6lhKYjomDiNKcHqxJseXQLJtqzSnJDyC09wWzLe/8FInD/4iw9Wq8Z+OtLrJV4DdFUbOFoWBqitARwJ6is0oqwB1uZNKtgnht+ueLXWyYdqrZLdgwXwpFk6R0t2WgC91Dt+2kJNtX+ToLLS0BNbTfo0C0gHICytLtS6x+eBIBVK/AguGhqdl1xGM+6dQKXLBH3YG5p7Y+/EeADiMdjzBrdjyNoaHWmYOFMb4e0GTYLksT1/wbw9TWUzbfOqi7NTOMomc1b/tXZs8zQnuW1F6R8CGeFnhfAqdIFpWG7XTteLsQoQFbtKq8daA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03bd1499-9545-44c7-49c2-08df281f6761
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2026 05:12:25.3301 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SZP/Wf9Ok+avL5ZpF3aX+zk0qI00CGE+uMdr2WbZfikTb1y9YgGiCuATwuuL/sHJWK3wIt1I9m+kXnRzw+qcNzbbnTY+j9I1KRpcncWodZs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7116
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
> From: Gupta, Varun <varun.gupta@intel.com>
> Sent: 09 October 2026 13:22
> To: intel-xe@lists.freedesktop.org
> Cc: Roper, Matthew D <matthew.d.roper@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Subject: [PATCH v2] drm/xe: Add wa_14028434957 to Graphics Version
> 35.11
>=20
> Prevent the SNIB AER latch from swallowing back-to-back uncorrectable non=
-
> fatal errors.
>=20
> Firmware bypasses the faulty AER path by routing these errors directly vi=
a
> MSI. This patch intercepts the MSI and reuses the existing GFSP error
> containment logic.
>=20
> Because GFSP mailbox queries can sleep, handling is deferred to a workque=
ue
> (nonfatal_msi_work) to ensure hardirq safety. If a reset is required, the=
 device
> is wedged (a stopgap until VR driver quiescing support allows for an actu=
al
> Secondary Bus Reset).
>=20
> v2:
>  - Return 'int' from xe_hw_error_init() to propagate failures.(Sashiko)
>  - Use devm_add_action_or_reset() for teardown to prevent MMIO faults
>    during PCI unbind.(Sashiko)
>  - Add xe_pm_runtime guard in the worker thread.(Sashiko)
>=20
> Assisted-by: LLM
> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_wa_oob.rules |  2 +
>  drivers/gpu/drm/xe/xe_drm_ras_types.h     |  5 +++
>  drivers/gpu/drm/xe/xe_hw_error.c          | 52 ++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_hw_error.h          |  2 +-
>  drivers/gpu/drm/xe/xe_irq.c               |  4 +-
>  5 files changed, 61 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device_wa_oob.rules
> b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
> index d8dc41851425..29a7d96a5666 100644
> --- a/drivers/gpu/drm/xe/xe_device_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
> @@ -7,3 +7,5 @@
>  14026633728	PLATFORM(CRESCENTISLAND)
>  14026746987	PLATFORM(CRESCENTISLAND)
>  14026779378	PLATFORM(CRESCENTISLAND)
> +14028434957	PLATFORM(CRESCENTISLAND)
> +
> diff --git a/drivers/gpu/drm/xe/xe_drm_ras_types.h
> b/drivers/gpu/drm/xe/xe_drm_ras_types.h
> index 0be218ba2db7..7a35390a9ffd 100644
> --- a/drivers/gpu/drm/xe/xe_drm_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_drm_ras_types.h
> @@ -9,6 +9,8 @@
>  #include <linux/atomic.h>
>  #include <drm/xe_drm.h>
>=20
> +#include <linux/workqueue.h>
> +
>  struct drm_ras_node;
>=20
>  /* Error categories reported by hardware */ @@ -46,6 +48,9 @@ struct
> xe_drm_ras {
>=20
>  	/** @disable_vram_page_offline: cached configfs policy, immutable
> after init */
>  	bool disable_vram_page_offline;
> +
> +	/** @nonfatal_msi_work: Worker to process uncorrectable non-fatal
> errors */
> +	struct work_struct nonfatal_msi_work;
>  };
>=20
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c
> b/drivers/gpu/drm/xe/xe_hw_error.c
> index 5f2abc9485ff..bde707a3fb64 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> @@ -5,6 +5,8 @@
>=20
>  #include <linux/bitmap.h>
>=20
> +#include <generated/xe_device_wa_oob.h>
> +
>  #include "regs/xe_gsc_regs.h"
>  #include "regs/xe_hw_error_regs.h"
>  #include "regs/xe_irq_regs.h"
> @@ -14,7 +16,10 @@
>  #include "xe_drm_ras.h"
>  #include "xe_hw_error.h"
>  #include "xe_mmio.h"
> +#include "xe_pm.h"
> +#include "xe_ras.h"
>  #include "xe_survivability_mode.h"
> +#include "xe_wa.h"
>=20
>  #define GT_HW_ERROR_MAX_ERR_BITS		16
>  #define HEC_UNCORR_FW_ERR_BITS			4
> @@ -173,6 +178,29 @@ static void csc_hw_error_work(struct work_struct
> *work)
>  	xe_survivability_mode_runtime_enable(xe);
>  }
>=20
> +static void nonfatal_msi_work(struct work_struct *work) {
> +	struct xe_drm_ras *ras =3D container_of(work, typeof(*ras),
> nonfatal_msi_work);
> +	struct xe_device *xe =3D container_of(ras, typeof(*xe), ras);
> +
> +	guard(xe_pm_runtime)(xe);
> +	enum xe_ras_recovery_action action =3D xe_ras_process_errors(xe);
> +
> +	/*
> +	 * TODO: Request an SBR instead of wedging, once VR driver
> +	 * quiescing support is in place.
> +	 */
> +	if (action !=3D XE_RAS_RECOVERY_ACTION_RECOVERED)
> +		xe_device_declare_wedged(xe);
> +}
> +
> +static void hw_error_fini(void *arg)
> +{
> +	struct xe_device *xe =3D arg;
> +
> +	cancel_work_sync(&xe->ras.nonfatal_msi_work);
> +}
> +
>  static void csc_hw_error_handler(struct xe_tile *tile, const enum
> hardware_error hw_err)  {
>  	const enum drm_xe_ras_error_severity severity =3D
> hw_err_to_severity(hw_err); @@ -436,6 +464,15 @@ static void
> hw_error_source_handler(struct xe_tile *tile, const enum hardware_er
>  	 * here for those platforms.
>  	 */
>  	if (xe->info.has_sysctrl) {
> +		/*
> +		 * Defer non-fatal MSI handling to process context because the
> GFSP
> +		 * query can sleep.
> +		 */
> +		if (hw_err =3D=3D HARDWARE_ERROR_NONFATAL &&
> XE_DEVICE_WA(xe, 14028434957)) {
> +			schedule_work(&xe->ras.nonfatal_msi_work);
> +			return;
> +		}
> +
>  		drm_err_ratelimited(&xe->drm, HW_ERR "Invalid error
> routing\n");
>  		return;
>  	}
> @@ -541,15 +578,26 @@ static void process_hw_errors(struct xe_device
> *xe)
>   *
>   * Initialize and check for errors that occurred during boot
>   * prior to driver load
> + *
> + * Return: 0 on success, negative error code on failure.
>   */
> -void xe_hw_error_init(struct xe_device *xe)
> +int xe_hw_error_init(struct xe_device *xe)
>  {
>  	struct xe_tile *tile =3D xe_device_get_root_tile(xe);
> +	int err;
> +
> +	INIT_WORK(&xe->ras.nonfatal_msi_work, nonfatal_msi_work);
> +
> +	err =3D devm_add_action_or_reset(xe->drm.dev, hw_error_fini, xe);
> +	if (err)
> +		return err;
>=20
>  	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
> -		return;
> +		return 0;
Should this not be first check in this init? Everything that follows.  With=
 that addressed, LGTM,
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

@Tauro, Riana do you see any concerns? I think for now it is planned to han=
dle this way!

Tejas
>=20
>  	INIT_WORK(&tile->csc_hw_error_work, csc_hw_error_work);
>=20
>  	process_hw_errors(xe);
> +
> +	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.h
> b/drivers/gpu/drm/xe/xe_hw_error.h
> index 5e3a11424108..a9af4c947d77 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.h
> +++ b/drivers/gpu/drm/xe/xe_hw_error.h
> @@ -11,5 +11,5 @@ struct xe_tile;
>  struct xe_device;
>=20
>  void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl)=
; -void
> xe_hw_error_init(struct xe_device *xe);
> +int xe_hw_error_init(struct xe_device *xe);
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c in=
dex
> 9e49e2241da4..5ea50d203db1 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -811,7 +811,9 @@ int xe_irq_install(struct xe_device *xe)
>  	int nvec =3D 1;
>  	int err;
>=20
> -	xe_hw_error_init(xe);
> +	err =3D xe_hw_error_init(xe);
> +	if (err)
> +		return err;
>=20
>  	xe_irq_reset(xe);
>=20
> --
> 2.43.0


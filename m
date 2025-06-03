Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67CF0C5AE59
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 08:50:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A7AA10E6D2;
	Tue,  3 Jun 2025 08:50:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NnpP9sRU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB87610E6D2
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Jun 2025 08:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748940626; x=1780476626;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Dj6hQkZyDLJlm3nximnyXDoXfYwftPfNkRPdeCT/2W0=;
 b=NnpP9sRU21H0gVfLHUEQ5jwugdSGu+6V2Z1uckGix1T/B68D8ZQYxq3X
 Y/YXlBUPDSAQC5TjJnRwFF0bj7gVjAii8iABu5qhX5rY+zzKopMGAcmY5
 RmlokOuJKJWq5bIEb370wb1WEjTmTcoKAdn3FDgnrZpCKmveuCm6fmdsY
 LWdi4fmSGIYNOy/6czNQiCOX588PUzkQ1oDD1azrsNj990xEX9DRFGFt5
 XGrTSF5NHMk1i8es32hr6z3nNugjPdyxI37rFQvIxNVTo57aRSJRkBcTZ
 UGwm8M4TS8IgiWy6odEBtlNPlrSnbd6CMD4IjvQjj9Ts+Hkj1tYSHk1tw Q==;
X-CSE-ConnectionGUID: FBAeGXKmROybic0RNVgZvQ==
X-CSE-MsgGUID: eTTEH056QbS+52N+/af1pA==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="50887920"
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; d="scan'208";a="50887920"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 01:50:24 -0700
X-CSE-ConnectionGUID: 52IFFxa1QNmryruOoeodSA==
X-CSE-MsgGUID: O0fmYZGDRtaDBx9EcTPFqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; d="scan'208";a="149953912"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 01:50:20 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 3 Jun 2025 01:50:19 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 3 Jun 2025 01:50:19 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.45)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 3 Jun 2025 01:50:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t1v+zAZb/pf5WsjUucXn6R0rigyDArB3KyeJ5TuHwbClVgCgLQj9o/zFTwEDw90LeJ/kO/u2RwgCSalM3s1EBZI+yp9bjJhAauFit8xirFs3sRE3qxXfA29Y5e/z6ksMyGswdD5b5AEX06EXOxZetxN2ckFUCORyUEacxUaLDcI8p2DPPsn9SF0cvHSu7CrbRy38jkWexA55KpOOIXCGTdxWlxf0jrwbt+o86j90aKaQHJnLYK/t2zlUCtV5WB69/PatMLiiV91Cblf5K9yOFIBb9H6mc3WlvHyGc90BpMdCtM0xsNGzqFxmHZPPX0k8sJF57MXLdt/+grMxPdKTDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XafFvbekJNYZz7kOxES7/2WWNdcAQu9CDlLqzoC4rk8=;
 b=u2gxIlsAGXM9bXyPmSFcMv7AKhTJSCiGXhBgUypYXjCRjz/GT16+9AsaT8PbVfcKEf+LJvwXTov/u8anRakq2UZ1giIKVTrIU6dGcEBfo4htsHzs+/FohXTEH490+neuodQRWTA2C0STtFquICmNPGI5WsNCh6Nk0pqBENpPIIJvrCM7j2MKTAxwDV4CkLQVyJXsn0W3b5ReEe3xjswcQX7oMdXF3pqMdRNIqWmfqAg0VB0edNt99h7rDfQxqcrPf9Q8SHvpFfnaZ95p0wuygF68OO3fIG8OGZBiKRhf5wq3tNaDzYB/9HOOYQidsno0Ql/Rvw/WLy5PKCQqtAgy4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by CH3PR11MB8344.namprd11.prod.outlook.com (2603:10b6:610:17f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Tue, 3 Jun
 2025 08:49:30 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%5]) with mapi id 15.20.8792.033; Tue, 3 Jun 2025
 08:49:29 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Summers,
 Stuart" <stuart.summers@intel.com>
Subject: RE: [PATCH] drm/xe: Add ASID to range invalidation feature flag
Thread-Topic: [PATCH] drm/xe: Add ASID to range invalidation feature flag
Thread-Index: AQHbur+ippUzLv0l80G3f3GWxodQDLPxUuog
Date: Tue, 3 Jun 2025 08:49:29 +0000
Message-ID: <SJ1PR11MB6204AC486F6787E80A78BD30816DA@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250501173626.64481-1-stuart.summers@intel.com>
In-Reply-To: <20250501173626.64481-1-stuart.summers@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|CH3PR11MB8344:EE_
x-ms-office365-filtering-correlation-id: 04578ad2-2ba0-49f8-3729-08dda27b8dba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|10070799003|366016|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?8KEgxl+/7lx2o/WFffZBBADaaXUunkHGFijf18uJpz+IB9BqdrLoUmNrFZMm?=
 =?us-ascii?Q?EdQ+uLAl5n7e0E638kJFle230Q4qpjXLNVdNpGmShucerrIBSL9OHpysVNyp?=
 =?us-ascii?Q?PQTkVsfxRC51Gv+to8nK0dr2USsETm6ElWDKF4rgc+jCvbAC0YSolq1BmFE6?=
 =?us-ascii?Q?P/0by/wdVF9apyFiXVeOAzf70KTD3QWLY/EkPops6RV/VXkL9e1n/6ugwM76?=
 =?us-ascii?Q?xVLrI3FaleoEhhlspff6mfR7XiDFzfrx0IZHsAGN6TpsnqW7b2Dg6/doVrW7?=
 =?us-ascii?Q?4tKLjrjYbiOGAFVbgf4G8Rw7N3sVMRVoA5ZEKbZwthGO6opUP+9/K76eEoZq?=
 =?us-ascii?Q?xegjcy4OnJT64EAcFzfGZXPIuJe8HDTXBTSUfhszot3J3Snb6MbBlYDARGjZ?=
 =?us-ascii?Q?ajHDQSD1Cabfa7+BSl7MOyWqOPqvbP5qS4qjJlWN+56i5sHZRQnsIY4L7jjT?=
 =?us-ascii?Q?PGXK5nl15uuUSFyonzvSseMYVf4J6LXFpKzc23xSUw7Lbf8PEJA3dv+mq6iC?=
 =?us-ascii?Q?kel9DDMVG/8Bv3Z0oAlCX2R09yQSzNSCdfpXAGKDJzAYxt0shbeV117Aax6u?=
 =?us-ascii?Q?OPZUYllTUu5TyDZP6aMf49w2CLYnWtlPMQwA5Um/5rOgHOXn6xg31werCGc4?=
 =?us-ascii?Q?CqymqIvow1gYHJ66RpJWJLTdGIgahOD1GSC66BetBjpYgu+YxTVe9NGWuzcx?=
 =?us-ascii?Q?hfzkYTnlbLkFxNjiFqQa/HMqUw6Dm5+nmwY+pzn37lKyrhUXX5qgWz6xaOW7?=
 =?us-ascii?Q?A/0DMKt2A2HOjngjaioPs/I4qh04W1HbgjH457X+iYXMy50mgRb9YB6Q0wC+?=
 =?us-ascii?Q?Mfo6dQhzbti253Q0HWigtuzt/q2o2P5B9Vpi7YF3ovHvF7HqaVFgmFc+5v+3?=
 =?us-ascii?Q?xB8EhM2vpRjGZ3XVeoaN5F0w88XeoM1TDouUXxicwG25G589n4qNU2E9CfFk?=
 =?us-ascii?Q?E7yOoOcsSAJZaa4c0w7LF7AHs/tId9kafkOdUwAFInyUb11iIVq0aXv9q8OV?=
 =?us-ascii?Q?wJcn/Zsktq+iTg1bjg+3kfC7ShKmPcUaSfDbcMGkD1foPDycFSGEQPnB6ZW4?=
 =?us-ascii?Q?5ypJs04jrh+R2Wc0DFjoFbvavxbRFUlw6jlHO1kuKw2bU+WXHms3ul4E4QPs?=
 =?us-ascii?Q?Ugyo8zdulJC1/W0ZgFv4tgrtxB8JRaCdCDR20WW+FDcJSrpssZ9pV7LXpJ2J?=
 =?us-ascii?Q?L8s5hZMn1EtiRII+IBNpLTzcp2lZtoIbxvzBeCPcTrI1Up4qXxwHMn9W8Dqq?=
 =?us-ascii?Q?m815RfFvgw3nLSKDhq66xHZqxcJGhj+Ww1jjzjkANZea8/hPcIIhBtW1U9z4?=
 =?us-ascii?Q?OVW8Aiul1bG92r90ZKYtBAWYASrBTc1AdD6s7J40Y2FpMvlTEe6qq/hKLD2U?=
 =?us-ascii?Q?+JseRoPyJ0e5qlDjPSn48Mw7tbeqG0s9FpYseLaarqZYm9qIxeI6cb44WHM6?=
 =?us-ascii?Q?Axaannh0xDJrb6R3IDq9FxEcTb5FOkyP2/qT0aBdQc35p3E02sBruIb7fqqk?=
 =?us-ascii?Q?I7EcIfEbupvl6dE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(366016)(1800799024)(38070700018)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?H7HGwkigwhAyIEFKDvQa5j5LZClHiWOJ2WRRN4mwfoCtX6cVkUuwnG7lJXzi?=
 =?us-ascii?Q?X2IXSr+XWc0m8jknEu7yznb/zIYgwWGrx4x24jZRqrUyhMNaBccrA/h2s6/F?=
 =?us-ascii?Q?QI6XVXz1RrlL/aig5iFfselZSdzz9+f6nZZRqlRFGwdOt1tih9GUadkC1yDH?=
 =?us-ascii?Q?CetLaQuOP/N+zLezXLfzQNmQaUOxNkTUOaKa2778ma0zNUml9wmbhvQ/zyai?=
 =?us-ascii?Q?pEqJSYHUOxBJ6fH6uVN94clgd9JGugY8fpjG/zWKitLUwsun1GE11oyoIieX?=
 =?us-ascii?Q?Bt7IAXfrzmoEwikq9anWK6i0W9U+IsgvL6136I8EkGSiP8JfLwqntP7p6Hxf?=
 =?us-ascii?Q?ePc0bPO9GI8fBjDE5sJW2xy4ZY6QYNTylmLH9r6ScJcmpIfO4SdGLFVBmfFr?=
 =?us-ascii?Q?1HyCL3imTVSDVarmA+9raBctSOpVbyj/MTbaEQcMe2H5HJAFvXM4KisHbphG?=
 =?us-ascii?Q?OVVjl6tvNXlPHEWcTnvSV1hjpURyhszcFvvO9p5juhr6t4u3luoUVmmBAT/Q?=
 =?us-ascii?Q?UNmfeme0D/Wh57/WIzQ3Q7uZRXLTE4Z0ba9EZCT7OVQxNHY00fVciiAlvdnf?=
 =?us-ascii?Q?X1P2iSoZj+iJrR641jY5IlH5YvDOEnQGvoR9VKycJ1vW1UU7I0MR/iLn7nih?=
 =?us-ascii?Q?T3cr+6Y8Bthn16fNZGezcFEySAw1JKx7it0Gh5m96wr9fjyp0h5E8R60PIXT?=
 =?us-ascii?Q?vGsB9hl4jLdSdJQWB/QWYer/yCCiPZhdRjZUqHrydOf+Uyrgtv4V3mUKjWTo?=
 =?us-ascii?Q?ULGgPwgzsofxgrD0WFt72VPLtrIFYNmh32ooDsdGHjDy7UF5X0BPtt7wg1Vd?=
 =?us-ascii?Q?QPjFLYmd9xMlGAAEGIYSrm/vHFe0sANoS8rY1PQdaF0GqzZJ70FlZHGTQ7Xq?=
 =?us-ascii?Q?LF9cKPF5fCSyr/92FweKFUp7B1T8HykpfOY7YYnCSqJ56lleJfr4FaFplBAd?=
 =?us-ascii?Q?J0GVJpnl+9lHsT56di+U8Y/PjQdEdB5ZmRgi6bhfgAOAC3GpTSDBqrpSku93?=
 =?us-ascii?Q?33oZevCEkL5n97Xa/vy4+bGRBcXBj1A/08ch+ouHefwq7NnTi/Fn7bnKWiUo?=
 =?us-ascii?Q?o7SfmTCN94osrhv28ZCe0ocpXHRLsSmF7/lnM86SAdIftwppjdME5RlZZlb5?=
 =?us-ascii?Q?B3FT+GpWkfc+RIonEjHA6wXpZ9Fr7sfOczaCw549nsLLqKDSBREC4hQR6y8I?=
 =?us-ascii?Q?W/mC2qIkiNoE/6M98zzwy/g0xz3ZA2hNlcKaF/LIX6VAFZFBKt2lhAZd1wDd?=
 =?us-ascii?Q?lf7gEY18vMHB2hE7Kg5PkBQqCUldG3sXeC33iu1D3coARLwijFYVa0YOYIdq?=
 =?us-ascii?Q?NnGIXjjgD/Ea8JKfukbQZNAyxJmEPTuDPtsP7fjlvoQxQQnzv+H7436gMPvC?=
 =?us-ascii?Q?/Y3Xi8hag5A5MXhDc/PxDBNO9FlEXOwzcQmmI3lW8OpSMmUYqBhM7Q7dacwT?=
 =?us-ascii?Q?KBOiHbS7uBIsbeQJZSNzMruOTGru+0lQ5aWRV7/pJyDRTkH1PFKIYrLNbzg5?=
 =?us-ascii?Q?wgq5EH/SSt53mA9HuUSt24vz3SuW+0lNR9ziLWNu/cpVj2E/hE6Q7q23T1wn?=
 =?us-ascii?Q?jdIsJjmGhrvTfcUIFVFDwtfXYFFS+e2K3jkq46kraZGnudmoc0H1A9xawq4+?=
 =?us-ascii?Q?gjWVyrXgH4sXfcNP41aNN4Wpsn8wTQb0x0K1dcAHtM5l?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04578ad2-2ba0-49f8-3729-08dda27b8dba
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2025 08:49:29.8774 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b/IFunTzxoxXJ57EYxb1Y1TJOxC4xQlIJDh9c0S6k7ZwfYDgU0/EEhJnGft2N04Ksp2en86PodLBa2x/XX8J8AJw2zArOFIep/O/FjN2+1U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8344
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Stua=
rt
> Summers
> Sent: 01 May 2025 23:06
> Cc: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>;
> intel-xe@lists.freedesktop.org; Summers, Stuart <stuart.summers@intel.com=
>
> Subject: [PATCH] drm/xe: Add ASID to range invalidation feature flag
>=20
> Make it explicit that the ASID is used to identify a VM when issuing a ra=
nged-
> based TLB invalidation.
>=20
> /s/has_range_tlb_invalidation/has_range_tlb_invalidation_asid/

While the patch looks ok, what is the motivation, is that guc doing asid ba=
sed invalidation now so changing flag name?

Tejas
>=20
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h        | 4 ++--
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 2 +-
>  drivers/gpu/drm/xe/xe_pci.c                 | 6 +++---
>  drivers/gpu/drm/xe/xe_pci_types.h           | 2 +-
>  4 files changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> b/drivers/gpu/drm/xe/xe_device_types.h
> index 06c65dace026..3e49b88a8a62 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -327,8 +327,8 @@ struct xe_device {
>  		u8 has_llc:1;
>  		/** @info.has_pxp: Device has PXP support */
>  		u8 has_pxp:1;
> -		/** @info.has_range_tlb_invalidation: Has range based TLB
> invalidations */
> -		u8 has_range_tlb_invalidation:1;
> +		/** @info.has_range_tlb_invalidation_asid: Has range based
> TLB invalidations */
> +		u8 has_range_tlb_invalidation_asid:1;
>  		/** @info.has_sriov: Supports SR-IOV */
>  		u8 has_sriov:1;
>  		/** @info.has_usm: Device has unified shared memory
> support */ diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index 084cbdeba8ea..c68f7cc8e175 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -366,7 +366,7 @@ int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
>=20
>  	action[len++] =3D XE_GUC_ACTION_TLB_INVALIDATION;
>  	action[len++] =3D 0; /* seqno, replaced in send_tlb_invalidation */
> -	if (!xe->info.has_range_tlb_invalidation ||
> +	if (!xe->info.has_range_tlb_invalidation_asid ||
>  	    length > MAX_RANGE_TLB_INVALIDATION_LENGTH) {
>  		action[len++] =3D MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL);
>  	} else {
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c in=
dex
> a4caa6222b6f..cfafcfcbbbc6 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -91,7 +91,7 @@ static const struct xe_graphics_desc graphics_xelp =3D =
{  };
>=20
>  #define XE_HP_FEATURES \
> -	.has_range_tlb_invalidation =3D true, \
> +	.has_range_tlb_invalidation_asid =3D true, \
>  	.va_bits =3D 48, \
>  	.vm_max_level =3D 3
>=20
> @@ -140,7 +140,7 @@ static const struct xe_graphics_desc graphics_xelpg =
=3D {
>  	.has_atomic_enable_pte_bit =3D 1, \
>  	.has_flat_ccs =3D 1, \
>  	.has_indirect_ring_state =3D 1, \
> -	.has_range_tlb_invalidation =3D 1, \
> +	.has_range_tlb_invalidation_asid =3D 1, \
>  	.has_usm =3D 1, \
>  	.va_bits =3D 48, \
>  	.vm_max_level =3D 4, \
> @@ -680,7 +680,7 @@ static int xe_info_init(struct xe_device *xe,
>  	/* Runtime detection may change this later */
>  	xe->info.has_flat_ccs =3D graphics_desc->has_flat_ccs;
>=20
> -	xe->info.has_range_tlb_invalidation =3D graphics_desc-
> >has_range_tlb_invalidation;
> +	xe->info.has_range_tlb_invalidation_asid =3D
> +graphics_desc->has_range_tlb_invalidation_asid;
>  	xe->info.has_usm =3D graphics_desc->has_usm;
>=20
>  	for_each_remote_tile(tile, xe, id) {
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h
> b/drivers/gpu/drm/xe/xe_pci_types.h
> index e9b9bbc138d3..3d1c745de2ac 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -19,7 +19,7 @@ struct xe_graphics_desc {
>  	u8 has_atomic_enable_pte_bit:1;
>  	u8 has_flat_ccs:1;
>  	u8 has_indirect_ring_state:1;
> -	u8 has_range_tlb_invalidation:1;
> +	u8 has_range_tlb_invalidation_asid:1;
>  	u8 has_usm:1;
>  };
>=20
> --
> 2.34.1


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6579C10F1A
	for <intel-xe@archiver.kernel.org>; Thu,  9 May 2024 19:11:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7241C10F018;
	Thu,  9 May 2024 19:11:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K3WISTo1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49FB410F018
 for <intel-xe@lists.freedesktop.org>; Thu,  9 May 2024 19:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715281886; x=1746817886;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=b1QA+COutXaRirVTYAFr24OK4cneoac1c8Fop6bAM6Y=;
 b=K3WISTo1CZfAToFaorScAuRVsXSK6+qViU44dzdOZHqHGy/0fNRkzbbq
 rbwPRlTgvEUtiu9uHtE2SriC1OmACk6uU+Mf9hv/WHI54EvSDlPC8Pn8M
 j7cGwfVhForad81kzQAVLi9sNHdE0tURkp2CK5Di/XpJ6n/XnItFCH05y
 r43EdrxD77LQtQ639F+YhMXUevb3XyWVSZSqfZwLh1VuiLI6tWGZUBgUk
 NKAIW2g7tii9cfkuKNYkJdqDAP558FZpUIh6LL9FBT+gKLEtfU3IAFvbj
 OuvwN7YoJedalQvxn+5GGNEQPPGRMgzDRiOTY2BLHmvC/ol9kRD/WX6jU Q==;
X-CSE-ConnectionGUID: ZlbDAysJRXOHGRaN8DQSzw==
X-CSE-MsgGUID: r7SkZeaVRsygfApa7zF/rg==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="21898676"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; d="scan'208";a="21898676"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 12:11:25 -0700
X-CSE-ConnectionGUID: CW6Sw0B8R2+g8aZPe5AcQQ==
X-CSE-MsgGUID: NkQw236BSfa3qYe9Fr4D5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; d="scan'208";a="33872029"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 May 2024 12:11:25 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 12:11:24 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 9 May 2024 12:11:24 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 9 May 2024 12:11:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mAA/Y6Sr9IUsM2LEYjRlcYgiZltIJgHra5bJ17ZAZPoCvtM5td3yYjkhxK4+RMzDNxiCgy3yjZ+ziZJmmV4eSXlmk0ONOCEH0zoz+IVThkqm8gDGIJv4pQ71kK1fKQnGuh43/ftGMdgwprfCfTTjGg46KmGNAgw59o1ey9hl+fZO5S42r+t6bumDOmtpq1JaB7ZBXgyEsnxU3GCJgX6U3+3LEPCI8Y/66PbrsT7eywsq0+AoScrWvpwWNXhcnNIdKfi2Yav6dcR9cWVjpMVj+/IvsoZX7FuXxAnVvk90ZwSTGffFDvZLC2QPQYmmX3W8fG5pqCW9Rg3yh8ND3wl6yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jvzcOYOrcRN3anEkBuL4H21kANyIJ4LF04BSJ+jyWXQ=;
 b=SNTKhnN6hBBi5mdM5R+weAkW66DJfD7QfnsPrvMQW0/0V5MLu1+miAYhGcmDGyqSRwAnZwinD8uJHPzuwambNJ4z2rIK62G52e/XNpHSqG/Dlw9aZkwSZ4CK3Wv8EtTwiNSlEMWCvTjOeGFDiNNACT8cTnaPrUSGcKJC0otPRl648aTQ280rEvRmsXmxwv/3OLrbuCu+Zbnuuxg5PRyp1GjvWzQxcXdhPUIRySE1Re/80+79voREevc6AsQ44i/gcPfYe7QwuTLbinZobqRWdKX4ukDTgnHf8QhRJat06lBZq3PWe+JoXkNAm5F/GMZBqHHEhiFDVmFGCrr2vZsyVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SA0PR11MB4542.namprd11.prod.outlook.com (2603:10b6:806:9f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.47; Thu, 9 May
 2024 19:11:22 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::f061:a0b9:4a91:b27c]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::f061:a0b9:4a91:b27c%4]) with mapi id 15.20.7544.046; Thu, 9 May 2024
 19:11:22 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Vishwanathapura, Niranjana"
 <niranjana.vishwanathapura@intel.com>, "Welty, Brian"
 <brian.welty@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>, "Harrison, John C"
 <john.c.harrison@intel.com>, "Summers, Stuart" <stuart.summers@intel.com>
Subject: RE: [PATCH v6 1/4] drm/xe/lrc: Add xe lrc ring tail function
 definitions
Thread-Topic: [PATCH v6 1/4] drm/xe/lrc: Add xe lrc ring tail function
 definitions
Thread-Index: AQHaj4EfGn5FTWontE2Qt/wI4GP8VrGPaQyw
Date: Thu, 9 May 2024 19:11:22 +0000
Message-ID: <CH0PR11MB5444DF53C2F9C176B664BBEBE5E62@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240415215012.2978778-1-jonathan.cavitt@intel.com>
In-Reply-To: <20240415215012.2978778-1-jonathan.cavitt@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SA0PR11MB4542:EE_
x-ms-office365-filtering-correlation-id: 7cbefea3-03ad-4b0e-5aef-08dc705bd0b9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?Fet+t2L8nw84lOe8Kn7X8kzDPZex4O7uTi/uIf4zFDFVUgSeP1Bi2oI+s7Kl?=
 =?us-ascii?Q?S6ZudFOKQEDf6zKUzHG6oygblRFvucn0Ynp3HDzw0KKlHkIZk5dhf0OoNZpN?=
 =?us-ascii?Q?9PXLkn/dOkFlpLCg5RjXXuGuwiFsgzX8BGwuhhCrU0VkWwfLbhZCGbQfp+34?=
 =?us-ascii?Q?jC/2v7FTv2GmqcxzypFfD3rAz6o7Lf+rSbaCtKiHxuttBeVmDlnDnwmzANfP?=
 =?us-ascii?Q?FjGIerZ6ujmfxE32os9hE/9ExKBIvn2HGkFumNJLotxRXaZnM3OKywqMBmkz?=
 =?us-ascii?Q?b/3xqEehHxE8F4M7sctxzeHXgh8o0qm6VHLGRU5PYMlfhkAn75Ai85UVAxiT?=
 =?us-ascii?Q?E1RsKy7A7zkE+iUjJ9N0P6Zfo8UMUfsY2nlbWy1vnWSpX72sRQRI21YZllYq?=
 =?us-ascii?Q?aEtTjJVAIOC63S9FQJTJJljCFSSx93o1XZK0aPrj7KqOv3YGqScRH2GSI4VX?=
 =?us-ascii?Q?LfRzZk7QBA45OKZFt6dj8mQajkBVlGGcHBLao8ecpImwg++4g3BVUscOZNdC?=
 =?us-ascii?Q?VJjfKEGWDtku5rlDMD2+Kdx9Fn1p98Rp3+0Vmj5v/gO1vtq8k5AyJQ/a4hGw?=
 =?us-ascii?Q?sQoV2Bosi8Qx0zMFjV2LUp0a0enY8f+ScnQ28wQlRNM9aYi7+qGtmmO2XQ95?=
 =?us-ascii?Q?m5qiRm8GyXVDHthPT0ByATs0nh09ys6wqbm+nkgKn/IxpryPev+UYgh6DbhI?=
 =?us-ascii?Q?CNrC3CBgpb2mCKpkR6Qat85YGCxxUAcEJzQ08LlDaP6l8IGfeEeZ5kYln6qd?=
 =?us-ascii?Q?d7CBSe0+EOca19ZcmeIPwF6P1EYGbP1cLIBMqyPgmYFvQxZgbhj4uRuCJXqC?=
 =?us-ascii?Q?bo4OMlnAs2EkAJWBjCuH1McyON66L3h0HorSoNumeGeK2Qk8xzWtT7MMx6B4?=
 =?us-ascii?Q?smHg2vErCTS8OhnbSdUmUie0dl40BEZsy6KXXrcuUpkS4jIXlzpfS+mJk59N?=
 =?us-ascii?Q?TahqSjaIUM3fEygOjektIdvOJjEBvX5qozk13ukX4NuqX74ncUaqxtKZbPUS?=
 =?us-ascii?Q?+vOFvT0yBv2x43/hAwzoTSlfDKRUa9WgSRFWM1t84I4e3QMcTuFbHVqOsPm0?=
 =?us-ascii?Q?twz+7/lXWn+990F45N6h09Rm8VtP9l2ANajDId/FJzOe+8FIB6wA5+HLZmrS?=
 =?us-ascii?Q?tzOfVSrZqCFkSZ3TePNTi65T5qjHLqm/m5sYhVrBO4fG1s9ljKE67+OD/Ej2?=
 =?us-ascii?Q?iXXMdFJG1qgneKw37ukxIOt8BN2Tes6ihKBvvSUeMKCXqs0IOs1SV1XZIPQC?=
 =?us-ascii?Q?HZ3MgCDC4oUPQajbnN1dt6p+7ccHSpjuFi3nHZhHNrEFINBzPe1SRHQgr3Vi?=
 =?us-ascii?Q?OUHVWyDA2cBAR31O0CeHky/XlhdjC9jCBOMNls7ZNpt76Q=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?U738kzdO2i57rkAwruquIk5eTzEK5m+RyxHRtf+L+oztCkAU9+rvhOPXn3sy?=
 =?us-ascii?Q?enkWcvf61pZk4PCYu2mVgfbYJqL1IKcvgG2DD66RUBnnXV3kSLnHTYRpjhNP?=
 =?us-ascii?Q?u+C9azCfx8LzD8vv8PqGfmjk3J3Gjs9Ow0L3sH2+cs/sxnBPGNznAfvViN9h?=
 =?us-ascii?Q?Dbec9+cQVTuHzMmOsKP4T4UG09xo5UwQosYSulkRstvE1N+sxF5wIegugBG1?=
 =?us-ascii?Q?bFd55w5kx/XcAEqulHA5+ltt5XEmdRMGMqYfRcvnTSiEew7hZ8fB2g80kDyR?=
 =?us-ascii?Q?sdmnRzMrjFWj8fcbsBHyVpr6nUIvLuyvxTRTbffKnNmFBoGqIgKCurFESb0W?=
 =?us-ascii?Q?8i0w3XvX5Tyc1ozYCNAcS9fQ3nYa6WbuH5p3DEgWl0dLMV5HoUlna28m3ZG0?=
 =?us-ascii?Q?4/WjOrBp3nqqRaUP/lGUJsw6kR2jqj1SyXXt6H5kwlG/Mc7nK83G/X7hmQ1w?=
 =?us-ascii?Q?d9tB1tf2gcKJGo74sqTwotDyQLqlo/6KRIPaFHASwWYMcZRq0d1h7StqPtUv?=
 =?us-ascii?Q?eZm40v5r9X90sbgDasJ1EFcsatOS8H5rDyQns0+yop+YMGcL4+xckhbcC4dw?=
 =?us-ascii?Q?gHyBNtA2mZTkzUZb/UdmX4g2vbSqh+hXOoyK6jhZaphKXAN5HCnadBDosvsZ?=
 =?us-ascii?Q?wUc4PmdW6qfeuwkGa53gxHLv8H0pPr6r6NVBGSawxVsl9TGOxuM0V1expf3v?=
 =?us-ascii?Q?l6G1UWbScQPIDZwXZTo+DlJQYL1NTjv5Za3hlVWI6QIsvilmBQ7nUcERMxV3?=
 =?us-ascii?Q?b5aN+G0ai29kOxQkHcIgDQmBgaDLDtzC5CIwMgAh5Lo+xca8+R87XA6jz4K0?=
 =?us-ascii?Q?JBsI2NQlGG2ahacBDyQVgHRfHboBw14CYA6pzPSuO+sX6CSwAYbAgy7NQ7pL?=
 =?us-ascii?Q?IL25cp1o2ZibmBA8WxsSxT0ezOlq04+HdOVb6ggcIosD9Sl2uDKO3HAZ8B+1?=
 =?us-ascii?Q?IrXG7kdrPDMNsiahTod9iaqo4OkGhOQE3MxuuWypnvLZUWTLYv5J87OPnDmz?=
 =?us-ascii?Q?V1ReWnGOrPPEwTqI2IHsI3/twsIgBbDTPFC6UqaBsHCmtN3Ce8xbEK5UE0/X?=
 =?us-ascii?Q?GKNHuNLfPKejPUNW9bBxhWrjE2vqOXfTWLmxS1T3sze2WDtgumBceysps4CX?=
 =?us-ascii?Q?OHV3+OMUBdeKJPjSaCPX5gFcnDL/3nYHMf7vjvtMWu8NtRNX9QC4+PeTLdKQ?=
 =?us-ascii?Q?X/2hKx6JdhSsp5JOM8WKHMjM6SyShzr47Oxud33q0VMzFZ+kZ5d5U25D3Ss0?=
 =?us-ascii?Q?1euMElvtNCIFN6mI5ktwDi1/U9AG3R54/AGG/PTEi9yj5bMNvTvcvOFlzWkw?=
 =?us-ascii?Q?mXQNF9VCK+7rPXrwYLedaeuGQ1PJV9bGexmrtrC1dRnuMewygdNL83zHQskD?=
 =?us-ascii?Q?bS6tbAfgxfdmKywu30GZrsxXPVXAFvBKFcy0AnCdA016gMxuDvfUBho5u5qE?=
 =?us-ascii?Q?MPJxgNEjzr79NNn7iO6/V1/XDhKn1zhG3OnMz8CguNl3ZP/+rpt8b8t9ptFI?=
 =?us-ascii?Q?fJo65ey3YE6/KCjCvOvufaChmuvnFmRhn8tyFJ3Ech0xY8eu7XllLrs5n6Ec?=
 =?us-ascii?Q?icWv12KEHpbgo/GkkrM/7j0ILdoixBrbElVKtG3XLhMBap2+gUpJCPEaI+g4?=
 =?us-ascii?Q?PA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cbefea3-03ad-4b0e-5aef-08dc705bd0b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2024 19:11:22.5477 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JgjxsCBNIgtIjoEmUs0wNuiiC7IxdvgfS12A54fqKCfdfRiC0FALNMKb+1Bu2CJu3tY6AdcIJn8JCj/Nhp/SNAd8A6wzcwbIfK95Gfn1WFU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4542
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

Rebased recently.  This patch is no longer required, AFAICT.  The rest of t=
he series is still valid, though.
-Jonathan Cavitt

-----Original Message-----
From: Cavitt, Jonathan <jonathan.cavitt@intel.com>=20
Sent: Monday, April 15, 2024 2:50 PM
To: intel-xe@lists.freedesktop.org
Cc: Cavitt, Jonathan <jonathan.cavitt@intel.com>; Gupta, saurabhg <saurabhg=
.gupta@intel.com>; Vishwanathapura, Niranjana <niranjana.vishwanathapura@in=
tel.com>; Welty, Brian <brian.welty@intel.com>; Roper, Matthew D <matthew.d=
.roper@intel.com>; Brost, Matthew <matthew.brost@intel.com>; Harrison, John=
 C <john.c.harrison@intel.com>
Subject: [PATCH v6 1/4] drm/xe/lrc: Add xe lrc ring tail function definitio=
ns
>=20
> Add defintions for the functions xe_lrc_set_ring_tail and
> xe_lrc_ring_tail to match the definitions for xe_lrc_set_ring_head and
> xe_lrc_ring_head, respectively, except tarting the lrc tail.
>=20
> These new declarations can be put to immediate use in various places,
> such as when initializing the lrc, creating snapshots, and submitting
> exec queues.
>=20
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> CC: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> CC: Brian Welty <brian.welty@intel.com>
> CC: Matt Roper <matthew.d.roper@intel.com>
> ---
>=20
> v2: Use new functions in various places.
>=20
>  drivers/gpu/drm/xe/xe_execlist.c   |  2 +-
>  drivers/gpu/drm/xe/xe_guc_submit.c |  2 +-
>  drivers/gpu/drm/xe/xe_lrc.c        | 18 ++++++++++++++----
>  drivers/gpu/drm/xe/xe_lrc.h        |  2 ++
>  4 files changed, 18 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_exe=
clist.c
> index dece2785933c0..e46519ad683c6 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -62,7 +62,7 @@ static void __start_lrc(struct xe_hw_engine *hwe, struc=
t xe_lrc *lrc,
>  		xe_mmio_write32(hwe->gt, RCU_MODE,
>  				_MASKED_BIT_ENABLE(RCU_MODE_CCS_ENABLE));
> =20
> -	xe_lrc_write_ctx_reg(lrc, CTX_RING_TAIL, lrc->ring.tail);
> +	xe_lrc_set_ring_tail(lrc, lrc->ring.tail);
>  	lrc->ring.old_tail =3D lrc->ring.tail;
> =20
>  	/*
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index c7d38469fb469..ecd1085619b30 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -658,7 +658,7 @@ static void submit_exec_queue(struct xe_exec_queue *q=
)
>  	if (xe_exec_queue_is_parallel(q))
>  		wq_item_append(q);
>  	else
> -		xe_lrc_write_ctx_reg(lrc, CTX_RING_TAIL, lrc->ring.tail);
> +		xe_lrc_set_ring_tail(lrc, lrc->ring.tail);
> =20
>  	if (exec_queue_suspended(q) && !xe_exec_queue_is_parallel(q))
>  		return;
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 615bbc372ac62..7b8997cff74eb 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -787,8 +787,8 @@ int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engi=
ne *hwe,
>  	}
> =20
>  	xe_lrc_write_ctx_reg(lrc, CTX_RING_START, __xe_lrc_ring_ggtt_addr(lrc))=
;
> -	xe_lrc_write_ctx_reg(lrc, CTX_RING_HEAD, 0);
> -	xe_lrc_write_ctx_reg(lrc, CTX_RING_TAIL, lrc->ring.tail);
> +	xe_lrc_set_ring_head(lrc, 0);
> +	xe_lrc_set_ring_tail(lrc, lrc->ring.tail);
>  	xe_lrc_write_ctx_reg(lrc, CTX_RING_CTL,
>  			     RING_CTL_SIZE(lrc->ring.size) | RING_VALID);
>  	if (xe->info.has_asid && vm)
> @@ -834,6 +834,16 @@ void xe_lrc_finish(struct xe_lrc *lrc)
>  	xe_bo_put(lrc->bo);
>  }
> =20
> +void xe_lrc_set_ring_tail(struct xe_lrc *lrc, u32 tail)
> +{
> +	xe_lrc_write_ctx_reg(lrc, CTX_RING_TAIL, tail);
> +}
> +
> +u32 xe_lrc_ring_tail(struct xe_lrc *lrc)
> +{
> +	return xe_lrc_read_ctx_reg(lrc, CTX_RING_TAIL) & TAIL_ADDR;
> +}
> +
>  void xe_lrc_set_ring_head(struct xe_lrc *lrc, u32 head)
>  {
>  	xe_lrc_write_ctx_reg(lrc, CTX_RING_HEAD, head);
> @@ -847,7 +857,7 @@ u32 xe_lrc_ring_head(struct xe_lrc *lrc)
>  u32 xe_lrc_ring_space(struct xe_lrc *lrc)
>  {
>  	const u32 head =3D xe_lrc_ring_head(lrc);
> -	const u32 tail =3D lrc->ring.tail;
> +	const u32 tail =3D xe_lrc_ring_tail(lrc);
>  	const u32 size =3D lrc->ring.size;
> =20
>  	return ((head - tail - 1) & (size - 1)) + 1;
> @@ -1357,7 +1367,7 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(str=
uct xe_lrc *lrc)
>  	snapshot->context_desc =3D lower_32_bits(xe_lrc_ggtt_addr(lrc));
>  	snapshot->head =3D xe_lrc_ring_head(lrc);
>  	snapshot->tail.internal =3D lrc->ring.tail;
> -	snapshot->tail.memory =3D xe_lrc_read_ctx_reg(lrc, CTX_RING_TAIL);
> +	snapshot->tail.memory =3D xe_lrc_ring_tail(lrc);
>  	snapshot->start_seqno =3D xe_lrc_start_seqno(lrc);
>  	snapshot->seqno =3D xe_lrc_seqno(lrc);
>  	snapshot->lrc_bo =3D xe_bo_get(lrc->bo);
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index d32fa31faa2cf..f355b0eeb5658 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -24,6 +24,8 @@ void xe_lrc_finish(struct xe_lrc *lrc);
>  size_t xe_lrc_size(struct xe_device *xe, enum xe_engine_class class);
>  u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc);
> =20
> +void xe_lrc_set_ring_tail(struct xe_lrc *lrc, u32 tail);
> +u32 xe_lrc_ring_tail(struct xe_lrc *lrc);
>  void xe_lrc_set_ring_head(struct xe_lrc *lrc, u32 head);
>  u32 xe_lrc_ring_head(struct xe_lrc *lrc);
>  u32 xe_lrc_ring_space(struct xe_lrc *lrc);
> --=20
> 2.25.1
>=20
>=20

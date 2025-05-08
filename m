Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1605C3ABC6
	for <intel-xe@archiver.kernel.org>; Thu,  8 May 2025 19:47:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 149CA10E968;
	Thu,  8 May 2025 19:47:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EB30EeFY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66FEF10E968
 for <intel-xe@lists.freedesktop.org>; Thu,  8 May 2025 19:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746733621; x=1778269621;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=H2u2Z7AeC37waC2wzmwjgv+K7gRCUkreCOw2N/EQ6V8=;
 b=EB30EeFYVtzTnjTkEGlij6xSYmxvStz9LS6FfeyDHNEcRoQv5frYCY9A
 VxgZYG3yheaWGLzSyDzREUPuKPG8/OaEyF/LL4kiFdE0TMU7nPehlSlhG
 Iti9hxd7JBli5rbHHd5ifDq/1t4SQhq0v7p/xM4eqWqDVeGhGLWqvj3CF
 kKc2U7fVPNsMe1bagUXdJeDB6u8I4xBg0qU7UDcGn64caebHv+ByN2Mi4
 UKwIJ31ZAPzZt6wRKRYQ72VjCA6g/dU6dcIg9cjSNdrI68J8uY04OwgfU
 6xUf8xlR52MtF8cDwpAtdPawwnH5i/wYn/CSuDNs5/zsgOHXpM0Flv6Qm w==;
X-CSE-ConnectionGUID: KHThohQQQ4uVf1zm0PQ13A==
X-CSE-MsgGUID: M1ZP9cf9Riq6WT8MyHE+PA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48653320"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; d="scan'208";a="48653320"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 12:47:01 -0700
X-CSE-ConnectionGUID: O6WJXOvrQs6QxkCqMB6N2A==
X-CSE-MsgGUID: 2KAzEw1RTveQBlWgru9Xmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; d="scan'208";a="136910868"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 12:47:01 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 8 May 2025 12:47:00 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 8 May 2025 12:47:00 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 8 May 2025 12:47:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lrr9/rLL2H/6eftbye/v5zSuU6dbCFyg0ecwvlfa6+6LM4gzWwapiQH6H8ggKMLaH3suieAmQ6IKMcj5rbZopsUm/c8T8LoAhCPwdrYuHqpyT8F92SFi5PO51RcO6kTD7ZcQLzHFfE+hN7vvQ8TMELJhbDa5iFKgLwy97D4wSkriJ0xD2icQntdDRWC8USVMCrp+RgPhS01wu72u+7orGoESc7RF9CpdpmrLwnup/PBdXEatw/+RmMWNbdwUpMz3PTVrnn49gdFxcXqfu67aqnp4T4UYIgDgi9vDmXf/+XYSUzYhhs6EEG5zTivQHroIYo7fFZjuHtfT5Q5thN24kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vurV7nuH1ldzrXxY2IseDZ57tdq08bUoxPUGjAONBik=;
 b=ZR7ytqACbGUOSXgY9ujw8iL7xZBMygWChEY3dPFGkppx/sNvTIfzuYtoISCMiLxX+RzZKFcdF2Z2KE5XbZan4c0E2ZzQ6nhBhcFOEFToej/Gt05fjh+1PLcR7d6SaX1fdXj4byMrGuG1BkT69iXlu3U5mTVDiYAfDHwIc2HhJhSI5iPbfVHOnrZKt9ziNvORJ2ZowjNQ4jS7//ujlbe9ON/QTJ/52kI+P2u8pvxLVPtyL1NLVbB77bUY2LCcKazh8mBuSE6Oqx4EIGSbOuC2ObHtax4baKeg0PcYVrvKQi7B9DwI39q5uOgX7zSKTAqhmssROeN11qI0jkFYncaa3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by SN7PR11MB6726.namprd11.prod.outlook.com (2603:10b6:806:266::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Thu, 8 May
 2025 19:46:54 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%3]) with mapi id 15.20.8699.022; Thu, 8 May 2025
 19:46:52 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Johnstone, Nicholas" <nicholas.johnstone@intel.com>, "Box, David E"
 <david.e.box@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: RE: [PATCH v2] drm/xe/vsec: Allow for kernel context access
Thread-Topic: [PATCH v2] drm/xe/vsec: Allow for kernel context access
Thread-Index: AQHbv4elhz3UP+BPZ0id1hst90bz4rPHkksAgAEgbHCAAD6mAIAAMmjw
Date: Thu, 8 May 2025 19:46:52 +0000
Message-ID: <IA1PR11MB6418DF71628D4D963C37DB3AC18BA@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20250507193811.268719-1-michael.j.ruhl@intel.com>
 <gbcppvon5jrqdbplqzlg3lyqjd3p7s4uv36calvetvnnn3ghxj@elaaiqz2j37e>
 <IA1PR11MB6418919523DE73706B405790C18BA@IA1PR11MB6418.namprd11.prod.outlook.com>
 <szurq5e5iqu6gc3nxogabkz2ko6qasiaes4vbvyxsec4bxpk5e@mjwurftr5wsu>
In-Reply-To: <szurq5e5iqu6gc3nxogabkz2ko6qasiaes4vbvyxsec4bxpk5e@mjwurftr5wsu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|SN7PR11MB6726:EE_
x-ms-office365-filtering-correlation-id: 7f62d664-b8d4-484e-c0fb-08dd8e6914a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?uu9JovlB1Aiz9+2cpiR5OVhi+8HmFu2Q5nnnZYd+maVQEZQdCXlNHzsTNkLC?=
 =?us-ascii?Q?T2J9eICyVKvQK4PVrm0pPE7Fpu2KOT1r5fEb3lNRODk4ohVwXd/57lYARIdG?=
 =?us-ascii?Q?6uB004uep7mANYFg5vmrkJEZDGalBLeJsL/06jY+TvmON87j4B4drCeisXRP?=
 =?us-ascii?Q?yY+5sv1kj35HpELEeAU1F2jmvNbVS8okBiaz28+ZQHMuQRq7T6f71eyA8ZT4?=
 =?us-ascii?Q?EUq3ev45O6hLxaY9BfJbRfZ5mCdMLplu15MEKQMuCoNVKct79oT17ebgKTyG?=
 =?us-ascii?Q?btzsLtnRwIMskX3tybrBbxiYD3cff6aoTrqKpwBlbQGzHGy8HthsXAWDoeCv?=
 =?us-ascii?Q?GBC8F3vRYpt//KTOuxCQPaX9jv63XY1hcKtTw2NxhBu7p0pedHIHFpavbrJ7?=
 =?us-ascii?Q?GuAqLYKkyMUJEyb6243rhu5mbgCOLwcI7xiS4+k2cyj3r31PODLuQdA5oeVT?=
 =?us-ascii?Q?jHb1+Wm81qEWtW/a2kRPWUlpueGKk10KB33eB4JpuF9PT8Xo4yjPTWs5fFFc?=
 =?us-ascii?Q?+kkzOuAtbg7zN7zPyJEpk+Z7llz+hxCbCqH/9pIraj3scSa1hlk7TPkDeEyR?=
 =?us-ascii?Q?nJRILQF4tNCDheRiMLbYfh2zMJpBXii6ddxxbjAo/6WaDLdHelYyNhH5q529?=
 =?us-ascii?Q?4FHbIfBlrRPHzTaL9Ry7Wv94OibvO2/Zwt5sRnIo7sHCk30pF6k33PI8MnWO?=
 =?us-ascii?Q?EEKe24IEx3GPeABez4Sbjiv7i7VNQ41+U2hSX/Q5HASw9b6O/2qkkt4UBL0V?=
 =?us-ascii?Q?cpogwmKWOj9M043OUMwZUp99kvv3g13aRb20krAkUDF+H2oqYPwNo0d7G1wV?=
 =?us-ascii?Q?r2Ps2EvM3pWNgUULuVn36O3gTUF/duPeP+O+JufIiFnPiKKAU0o/ybjWflvK?=
 =?us-ascii?Q?SHfUuiVVoHwzbjFCIwKSuRjYbfO8m64jg5qATi1pMHHyqWpp+qTarqwkltkY?=
 =?us-ascii?Q?7Vbg2dms8g0/afQZZW7Owll1ASuLzgH/w6ktdFMYaT+BR0I3/Zp/TTwXRw3i?=
 =?us-ascii?Q?CGYqPY4POxljg7XVuu6wwSzO+7JhCxGrhbATO4AfViI889utSzRabY4VxR1u?=
 =?us-ascii?Q?rwQPKl2ldUC+USIZo01ciI4YfAnXr0LrngoPxA4+/Q0TLTS728FElTqOcMbX?=
 =?us-ascii?Q?fqMqoextDdVcHXXmai63MU6f1ytWfLGlpTF0lB53+PnSBLoJuBfSiR88t+VD?=
 =?us-ascii?Q?4u1GUdpztqDPszEexfaVxiOBIa01sVkCpqOHyUTik25XaMxmfebaHy4GtjEE?=
 =?us-ascii?Q?3saKdyOx8f00RWezl/7FY/8jjR8CBvADmUGWOf/8Bu2Hm0BQvOo5PMDJabOr?=
 =?us-ascii?Q?qomSCnjnKBNqJw/46WndGfkLxpZMAeyznGrJFnHiZwKbGN9Dqby29qcVkcBm?=
 =?us-ascii?Q?7jPoHZoneMpSWWTH2zzldOKTYBac2VmfmfWDnl5Bci5pSEJ7BpEhnFESB0Ds?=
 =?us-ascii?Q?p09dD3dHRpXPaEbXpU1xPgqbNM93673DxcB27VegerY75RIyYbsYwEWtzWxO?=
 =?us-ascii?Q?eD+dBncRNenQxYo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6418.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QupF+cBWH1uOL80uZAXfX33XgR82s07Y9vrHWhZyqQgkfUYCYDMqK23fO3pW?=
 =?us-ascii?Q?XDPOsSstJbucSpvnK0gqybYBmzzYmucOxq34Z92kV2UQZ+ssgxiIPidfZUQx?=
 =?us-ascii?Q?eyo6JRnt8D9Ay8Fvyt/k8fAMhXZ6Dh91YSPHi96D5Fbii/es8fVJG74UoeDV?=
 =?us-ascii?Q?+YM5bfWeQZqA8hqfVjEbCAnwIYgvwhj/PIdhi+myJSBH4Klm8AeuObzRY93j?=
 =?us-ascii?Q?NT+NZQQkJ4pn78Hy8vIaKSTlEumItHLoTWz3qjFqaRT5M8hLnCucyTcspNll?=
 =?us-ascii?Q?TSYdgitwK+CGzVKxk/839Q8lvS9p7jNtqHwz9QhFzLPmUCClwDqIjTvMwgLq?=
 =?us-ascii?Q?RjqNntZfYZr74kLjTTM/vayobkzfbsVTSixmDCvor0uA6Mm9Xi9WMJTrwsZv?=
 =?us-ascii?Q?6AyA0q36tz2Q4GxWdUWeCRK/1OE/odKBSjl3KLlly7PkUj9tXlDsIKaNsxe3?=
 =?us-ascii?Q?aTIuJ3lprxWXCAIzJSnTNU8mbd5AyoAFIryFZb0yTDi8DoUqWJXONgLZw5AY?=
 =?us-ascii?Q?Zod8LQ63MbIEXXsTX+JNy53TrtvaNToXj+p1dMdK62eYCWAn6/bVLMCSZtd9?=
 =?us-ascii?Q?9DSeJe7Tb6niwzEaFzbdNy1VjvUZTiFdZBGmw6F3S83eDWLdsFMo+JY+T0Op?=
 =?us-ascii?Q?gdfu7d298SLH4Bzhj1x56Moj7KaPsRgEwLHWKsOixceUta9ja3rPl25DA4Xd?=
 =?us-ascii?Q?iG8n4236/treeIAmUwxLYIMqHYRF7HK+hY7osYx6Y3Ugjg/FnnsAKaDPy3GB?=
 =?us-ascii?Q?Ha69xgLu+8PqVq/C3WLwS6Mlrawal1Eh2IPtW+QxfFnCXfpPNOy3S9kxpsrA?=
 =?us-ascii?Q?usRZi4UJTDaJF0P8XwpTkwO6dsHP1TwhZFP1e9iLjbc3mAvXrXj9UWAgfCMS?=
 =?us-ascii?Q?atHBSho2TvgoX6b4ekFqhQHHS54/UN9EhaMtqvs58288nnz4U1uuawkc0yRe?=
 =?us-ascii?Q?vrxG4ZAUR4J9MAdf5gm7VJN+HNHLmT1CEM5GkL6V0nCtLBIK6MvNaiv6GWFA?=
 =?us-ascii?Q?BiTgKoXmrsLz8xCP1A1G19w6/OIWC+0uKHMwTrkgxUTYd9+yzeqcAR8cuVDt?=
 =?us-ascii?Q?RNBwTCUBTAQ1qs6CCKENhs+xA/MsiCxEHRivG66LvOSr+SWUIbf4geQ2k0jh?=
 =?us-ascii?Q?FJDLuHonIHcVPXEgzko1Qf+SosL2gxXlIyALi35Kn7QnQXAy8lt5mHf5D9pZ?=
 =?us-ascii?Q?1+CNv///knMuLdxUS6Tu3bdlsoqPXZ5mZ7j/0yqDLFHCMZBkMQYrCCPnH5X8?=
 =?us-ascii?Q?NDWc8drD16w0Mv9gL1yYQ1pkvPak+igzLsyu7P1Ky2wtKci0Lcwzj/9I5h/y?=
 =?us-ascii?Q?GWuKu9+kn4a6xTR6d4YE2yvcRg2Pk1b/jFIxZUpuAoJj3lf0ort24t0tmaL8?=
 =?us-ascii?Q?8U+runbkPVLO7sd/JxpHUuu3vcGUVyhypLSZhhhgfddV3vdantIJIe9ITIfA?=
 =?us-ascii?Q?9UE6xQiwhAPguX3p9JsSQIDz8POw52cnRJxCSvHKlbp6wnOIWgbNbHtqFbQI?=
 =?us-ascii?Q?J/J/oOBwvrn36mKVWKiE3x6yOTcaTtKCQIBLGqPfxyuQUU2LGbQZWALkwa60?=
 =?us-ascii?Q?xcSV5AsRureaIHAMBw53+8l3bVjkopUircOgfY+r?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f62d664-b8d4-484e-c0fb-08dd8e6914a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2025 19:46:52.5098 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nTxZ4qjYUoXvkXZ4MnfaVsc8671kdBHdofBCh8Tm9jFHyOAh/wGB3U1s1/ObeP3Y2yVnvxSWmS1fUyAsYxUGYD6qoIpNp4AUvyvIrcHEblk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6726
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

>-----Original Message-----
>From: De Marchi, Lucas <lucas.demarchi@intel.com>
>Sent: Thursday, May 8, 2025 12:43 PM
>To: Ruhl, Michael J <michael.j.ruhl@intel.com>
>Cc: intel-xe@lists.freedesktop.org; Johnstone, Nicholas
><nicholas.johnstone@intel.com>; Box, David E <david.e.box@intel.com>; Vivi=
,
>Rodrigo <rodrigo.vivi@intel.com>
>Subject: Re: [PATCH v2] drm/xe/vsec: Allow for kernel context access
>
>On Thu, May 08, 2025 at 01:09:06PM +0000, Ruhl, Michael J wrote:
>>>-----Original Message-----
>>>From: De Marchi, Lucas <lucas.demarchi@intel.com>
>>>Sent: Wednesday, May 7, 2025 3:46 PM
>>>To: Ruhl, Michael J <michael.j.ruhl@intel.com>
>>>Cc: intel-xe@lists.freedesktop.org; Johnstone, Nicholas
>>><nicholas.johnstone@intel.com>; Box, David E <david.e.box@intel.com>;
>Vivi,
>>>Rodrigo <rodrigo.vivi@intel.com>
>>>Subject: Re: [PATCH v2] drm/xe/vsec: Allow for kernel context access
>>>
>>>On Wed, May 07, 2025 at 03:37:40PM -0400, Michael J. Ruhl wrote:
>>>>The PMT driver API allows kernel level access to device
>>>
>>>ahn? What's that supposed to mean? what's the context that is calling
>>>this ?
>>
>>Hi Lucas,
>>
>>The PMT exports the pmt_telem_read_mmio() function which accesses HW
>registers
>>for telemetry information.
>>
>>In this use case the SOCwatch kernel driver is accessing the API trying t=
o read
>telemetry
>>information.
>>
>>Since is happening from kernel level rather than user level, the mutex th=
rows
>the
>>"might sleep" context error.
>>
>>I tried to distill this the above comment...  Does adding the content abo=
ve
>explain this
>>enough, or should I be more expansive (what details do you need?)?
>
>being called from another kernel module doesn't explain anything
>regarding being allowed to sleep or not. Also depending on the context a
>spinlock may not even be sufficient as it may sleep. Without knowing the
>caller we can't even know if it should be a spinlock or a raw_spinlock.

Hmm, I am not sure how I can identify the caller.  The PMT code provides an=
d API for kernel use.

With that in mind, it seems like the only answer is to use raw_spinlock, or=
 if I am understanding
the spinlock_types.h

#if !CONFIG_PREEMPT_RT
	spinlock_t;
#else
	struct raw_spinlock
#end

?

Thanks,

M

>Lucas De Marchi

Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205B1606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 09:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=e9ptBzHQ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB9DC10ECDE;
	Mon, 26 Oct 2026 09:15:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E31D610ECDE
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Oct 2026 09:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793006109; x=1824542109;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=aIRfkoWtKGveDg8RgO/4rKM/a03T/od/2dWoZ6QjrTQ=;
 b=e9ptBzHQhWTMT0npmP35M3jggzrSj2z2Pcea7VVOWytkYbPA+LfYNMWh
 5/SUgT0lGazR5TOyDyHoD8f9stPRVwwNtxinHhzd/rEnc5dVdgjN+hm5X
 EV4jl6nYR5ZIR0R6lQo19Od5DrzPcLBPs9Hl5ZSbEctPUpZNgTXXZuhpm
 3FpbR2RJXexGgPB9F2GRRRwNeHRg1M0SizPWH8dJfCTU1GlZ0GMta5DEG
 UN980l2IsIDdwTmMxN0n013ERhNu8doZnuXtEu0dRBuVUNCFRpqmilSj8
 IG4OzGCbF65oyg7NB8YyR3YHLCZWoqySURh52dWWP5jVTHFYclGxgl+OH g==;
X-CSE-ConnectionGUID: Q6w3qP+/S/+ITFUrRjvHUg==
X-CSE-MsgGUID: 4T9n+W2gRhOkW4KGksVw3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1655803"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1655803"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 02:15:09 -0700
X-CSE-ConnectionGUID: izX+p/p+Sg+xD5SmK+zWKg==
X-CSE-MsgGUID: ALYqZ9TkTdaKCiIlH/Mliw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4331304"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 02:15:08 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 02:15:07 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 26 Oct 2026 02:15:07 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.48) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 02:15:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CQx07Bbf6OJRXvAOBSVlMR2IqbVrMVgUMRr/X17qD5/xUYPGDAGB/s9VF7okgQKQ5dK0O6fDlJPhBquR8OA0i3lQZqeqevfwEGVKnsFSUYt2W5z7ww1/roeIK4vDAJl4LTZS9ozqrA/Db3KAdzjWE6B4qgi29VEvo+VuMZ5dH7rx+FNtHrPb6NqOWbrvm5VEGc3RDg4jm2ZOKNE5Ke8bPDvvXc3CzXcoSMzC6lohfXUaHIYNaGEXscq6+N28vXZMiqtw/8gOclG1HyC41wWiKm0wPmNU1xa5ncBemV252wTl3JaDJo1yScg7wjzYSbLvtytYEEAlaGAmbAUBZEMPYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6U30BdeUQIhrAN9u3MqRp0jEbCCH9V1vDqsri0shZMM=;
 b=RfvXxMPwxbexLlKyRJR0HnEfokRFn4nIPnXln+7RHJJFnTmkrSP9fOXzqI2WUgWIbwneh0e6KMQj7kBvx00JljVeaUOOoLQf39CGGm4thGPdpvda1Oy+JkBV2uqd0O5L7XscbbaXVOGF0YdV8emtHHVtGrnLf8saSkB5jFCcRx6pCI7lLhGmgnV2Jd48V6uz+TGkQCdbPGOv09gQra+OqXG1xtrRYF/PnzK6v1y8zQUuHFz8Dcn4mm1xbik8HHAAgjgE4aCeeAQIlrULDx2tzIZ3Z68jzHzqZOjGvXzpYbKVRAxYhbWaHxyUJDXjiwoHbz2YJjJGYpBDPvEcJ74B3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by IA3PR11MB794841.namprd11.prod.outlook.com (2603:10b6:208:54a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 09:15:05 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 09:15:05 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Kumar G, Naresh" <naresh.kumar.g@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v5 7/7] drm/xe/guc: capture additional engine state
 registers
Thread-Topic: [PATCH v5 7/7] drm/xe/guc: capture additional engine state
 registers
Thread-Index: AQHdYrTzRd7IkLlFMU+R7nTe/+WpvrcPjteA
Date: Mon, 26 Oct 2026 09:15:05 +0000
Message-ID: <DS0PR11MB8718A6AACD1364B21EAB3ADD81612@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20261023060554.2643515-1-naresh.kumar.g@intel.com>
 <20261023060554.2643515-8-naresh.kumar.g@intel.com>
In-Reply-To: <20261023060554.2643515-8-naresh.kumar.g@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|IA3PR11MB794841:EE_
x-ms-office365-filtering-correlation-id: 95ac7dac-0242-4591-2fae-08df33419f76
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|10070799003|366016|1800799024|23010399003|38070700021|4143699003|11063799006|56012099006|261021121427099003|261022105027099003|261022075727099003|261021123027099003|261022113327099003|261009223027099003|10067099003|18002099003|22082099003|6133799003|3023799007;
x-microsoft-antispam-message-info: /EfJeQ6j5MVYEnDchDM3xfprFBINe8vEfUJCNcPeV1mOTx3Mh2JWRAcSKVUEkLUZ2SZbwLge87G+D7ylX5v+j+2Y+DIHKhS2T6RNZbIOMpyGkTgHmrgYUzppGlMfXBKnVF0SLiWqggNzFClL6qvIhdYIrrzTB5Tj4/gyVXONIsizrSrrOSpwB5pZ12PNXkXBr5/XcLDAIzAzy3h64f/DPQNd4Mwk3q20fXTh9T//BtO+Ss0YUVwCarJrvxNfkH2eW77NJxL79mIvzx1iKrLaUJOQlWyrvI7qU/iSuCVzGckeXG84V9TQ+45OAgqot4nutsCdb1gcT7f52mEs0CJIsi+QYJevdKEXybSfC66yUDP9Es9RwWlXL0KpIRmNDUA1El65htzsN4C9Qgx2MowyIgQIsjJCrTCldC09P5bzuIzOpWt/JE6XFF9R9MW/4RRymUtOv1iAK2K1AiBzM3coHp5GASiGpX7sl8kRorQAGjUwK/n+Jx2iVIVu7DPDRsKKbTHdnbSPKi9rT7Rav6qIEdAh2sUl8eemrap/gbaHLr9Rh8wnslZOHIZdkjBk90NZz2VAK+HrYH7tnkvFxVcmfL8LUab24a1v8QiVpNS6PVIqA7mG9KxmRBSy3WgX4nhNmwxLCqXy3IYIxzrRf1QYi5fGnkfm7fTJsfyWwHDsPESnNo3efjUPFKEp27Qu8S1blS5OfKzM/Hlz3T+IR5Jzc4v53rhQM+n3MG0/K4G6ftU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(366016)(1800799024)(23010399003)(38070700021)(4143699003)(11063799006)(56012099006)(261021121427099003)(261022105027099003)(261022075727099003)(261021123027099003)(261022113327099003)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lYz0vjmLnFhazfVP0nzGIjJ5L4FtxCkcWSPBEWQ44cqzij/sTi8RjIaeHd6m?=
 =?us-ascii?Q?gDhw6RmSHAWsqvOOKpUF/xUxz6It33UHEOG/5/milDGZZ15lTXzrcBYyAvlA?=
 =?us-ascii?Q?yPcHIyCQHh5F2bfv34NRoy66uJ+8J+jbXGKsfvKzYcG60NCqdXbKwIzW+fUN?=
 =?us-ascii?Q?6nuBWoG1R8jns+8f/phZlIRjIM7blEx77C9rkOVWhA3thJE1OuC3pzhLE1Hd?=
 =?us-ascii?Q?exK8NJfsE0lA14BLlSw3OSkqZT8ZFyqi+61fRsepkpfrT2Cng+HXnx7igjgm?=
 =?us-ascii?Q?uy4ZSQLloa5oS0ngbgPnmjqf+ZidhjY1HFJcQOsillmp4Ot23bzNIU13j5jE?=
 =?us-ascii?Q?KiJIy05fbihpWyE3DHgKZF54Az/W5bANKuHevpvwI785jGUsx27PygmZEpN4?=
 =?us-ascii?Q?H28pPwhoLl8UBywx70qHHVCcWz7wSVkbw8mEpDudZSxN90xIFUaSxinCz/Vb?=
 =?us-ascii?Q?2mmGwDreAMCrkslI21n0uMrk6t91vyESSiAKl7nY36FevL6SHAFYJog5Q10Z?=
 =?us-ascii?Q?5VfZ/H+Ht0JUU8X4n+zaFSttxoWYFLuF1fGEzOvMMcTjA6PeiVpLccdS9mLo?=
 =?us-ascii?Q?7wiVPaCSRc9wHdaR91rP8q2d4/z5CtVmVPy5WH5hBZyadW5D7XZRcTClZdAn?=
 =?us-ascii?Q?X6U8aSlVjG6ZfLDzG36wuGG59aew6tQ69jEHVyGvRwM8gvLfrMO4imkcC0+s?=
 =?us-ascii?Q?znSh8Dyws80rLPXzUZ7QkQJ9aFA9m3WCtWPpQgJN/VaytHZKoDz9U0Irjj09?=
 =?us-ascii?Q?M23GuwsJ1E/HmWgv2/oVguuA9IC+OSYdVBaqfLJD0hXEAaCuUjkGZwbs8fTD?=
 =?us-ascii?Q?UJ3v8TJBim+KtXsNcL7vgwlaThZbUCTdWouUAJ1VNZkbeY2tftVdy+hELMo8?=
 =?us-ascii?Q?WF7uUfiY6rKF6HDVx2QmD/+7U/fm2ED8grbI84rdABadTYSQPC86j7uipnys?=
 =?us-ascii?Q?h1KnYJM95/li3nokrV+pf5XzswsYnK5iWpAQV+RAmkyJMomrYXr4xA2mU7QG?=
 =?us-ascii?Q?mtmV1pbrc4epgIhPOMHGnFYaiwvoiV/FVPVPoNY92o1cCMedYRj1Fvroe5iT?=
 =?us-ascii?Q?8duI4m5pYAsEjGFqBJp3g1TYHA50Kte5FoEziMp2OKfFJuhXiVs6azDo0cPs?=
 =?us-ascii?Q?P3O8kBp1GZ8a7tKpknY4tjZiSL91Oa0hKAIjLLc2Bkv4PEgXuV5Jz5+2tsCh?=
 =?us-ascii?Q?opm2MFhlyUn1OvUv2lAYLegDaXOgEw4GvST115oYLk4BPRiZZFP2VKu8mGLw?=
 =?us-ascii?Q?N1De1raXoumOUVAOVkda4NMnVHkkxWtr2g8A05IjiqtRcR3qyp+j5YTlGrTJ?=
 =?us-ascii?Q?9Z9VZW2WRWOilOXd7Wp9hPtDfWMAB4ePxlL9X4/3Nv3kFHT7eXt5gcW1JLx6?=
 =?us-ascii?Q?d8Bxv0SIuWTPqz1mqdBimSVN6GCRXrvYPYzbZhpAVRWd+uLszxeZFR/7l3Yr?=
 =?us-ascii?Q?TBlTykqoDrO2Y+0AOU3hSbt1PQNIbdiEVDoCGsyRLAiVA/2m4GLsnZJ/f8gw?=
 =?us-ascii?Q?i/WZt9JufAfzMK/lxZVsftqJ98OdRERYRJJzQuI4ZX7k7L0a9/2uDImu34/F?=
 =?us-ascii?Q?+btIzc79dBQaq3IqvrttiR+AjNuxUYm7QtUK9Fu/5uMSM+La05gw5xZ0vSn2?=
 =?us-ascii?Q?MgWF+Oebhcw9EFJevMF7IGYBZM0lRRMvn29tFaiAV11hyyI6Rfvd2yvwJywF?=
 =?us-ascii?Q?FNdt4Rjh8tUz5IB1/Mw4EiWRb12yNlGvjsowF+PTFClAVkrI0360n5qi4kEa?=
 =?us-ascii?Q?h7iq1ItzmodS8i08fbtryDuAu9rtlZPudyzWpiNQ9z0tE+H0kVX++hpL8xHv?=
x-ms-exchange-antispam-messagedata-1: Xk7ePiLbgt6vgQ==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Iu2ZMIr1XkGzAecm49X1VYm81322ZrGQlaQ2sZEfPTS/nIwJcvanehd5gXZiz1QJ7wWQOKqIbrp1hDNtMxX8lSnSZimpCfj8Vl/Kn8cSG5LI9rTQk9ipyY4zGIUyqrMNfOoDJmyKU5pru0l/73rgZwbh02xG9c1crvYhjZR40NXrXD2NtBFyszo8mU7flqIglxM4ArZf98adXzQqn4O4MQTdi2hNzVt2wnSIF+uUMFCWGR8pEJskZoA7ecy5Wj4MGmYPueHzd3ehXawiyl3blPIw0SfzgLhNIbsdXqnbPu2Xc5TnEBYnGxmib+QEIgEdm15oJT2D9AhrgHF50JUfxg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95ac7dac-0242-4591-2fae-08df33419f76
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2026 09:15:05.0849 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K7dJ2uGBmSpDp2YgL0CjYGGp6ieBHck3ue7RrKsQaeE75L+XS0CIF8/EJlHEmIVvIOKBMAWxMIAvUuzvp9sUPfF99uL6Xk+pm5TYR0S58sg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB794841
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



> -----Original Message-----
> From: Kumar G, Naresh <naresh.kumar.g@intel.com>
> Sent: 23 October 2026 11:36
> To: intel-xe@lists.freedesktop.org
> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; Kumar G, Naresh
> <naresh.kumar.g@intel.com>
> Subject: [PATCH v5 7/7] drm/xe/guc: capture additional engine state regis=
ters
>=20
> Add a wider set of engine state registers to GuC error capture to improve=
 post-
> mortem debugging of engine hangs and reset-related failures.
>=20
> Define the missing register offsets in xe_engine_regs.h and include them =
in the
> GuC capture list. The additional registers cover reset state, front-end a=
nd back-
> end FSM state, power state, batch buffer state, instruction state, preemp=
tion
> status, and related chicken/debug controls.
>=20
> This provides more complete engine context in capture dumps, which should
> help root-cause analysis when investigating GuC-reported engine failures.
>=20
> v3:(Sashiko)
> - Move FF_SLICE_CS_CHICKEN1/2 out of
> COMMON_BASE_ENGINE_INSTANCE
> - Add XE3P_RC_SLICE_INSTANCE and include it only in xe3p_rc_inst_regs[]
> - Add XE_BCS_RCS_ENGINE_INSTANCE for registers shared only by
>   BCS/RCS paths
> - Include XE_BCS_RCS_ENGINE_INSTANCE only in
>   xe_blt_inst_regs[] and xe3p_rc_inst_regs[]
> - Keep COMMON_BASE_ENGINE_INSTANCE limited to registers
>   valid across all engine classes
>=20
> v5:(Sashiko)
> - Keep RING_EXECLIST_* in COMMON_BASE_ENGINE_INSTANCE
> - Drop XE_BCS_RCS_ENGINE_INSTANCE
> - BCS_SWCTRL only on xe3p_blt_inst_regs
> - CS_DEBUG_MODE1/CS_CHICKEN1/CS_PREEMPTION_STATUS only on
> xe3p_rc_inst_regs
>=20
> Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h | 22 +++++++++
>  drivers/gpu/drm/xe/xe_guc_capture.c      | 57 ++++++++++++++++++++++--
>  2 files changed, 76 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index 94033982e694..9f328b1b18f5 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -60,6 +60,8 @@
>=20

Can you check below, I see they are missed :
1. 0xe4 (FF_SLICE_CS_CHICKEN2) is defined but not wired
2. Ring buffer section: 0x14c is missing
3. BB registers section: 0x150 and 0x170 are both missing
4. Also double check mcr/non-mcr, just for double verification.

Tejas

>  #define RING_START_UDW(base)			XE_REG((base) +
> 0x48)
>=20
> +#define RING_CSFE_GLB_CHICKEN3(base)		XE_REG((base) +
> 0x4c)
> +
>  #define RING_PSMI_CTL(base)			XE_REG((base) + 0x50,
> XE_REG_OPTION_MASKED)
>  #define   RC_SEMA_IDLE_MSG_DISABLE		REG_BIT(12)
>  #define   WAIT_FOR_EVENT_POWER_DOWN_DISABLE	REG_BIT(7)
> @@ -72,6 +74,7 @@
>  #define RING_DMA_FADD_UDW(base)			XE_REG((base) +
> 0x60)
>  #define RING_IPEHR(base)			XE_REG((base) + 0x68)
>  #define RING_INSTDONE(base)			XE_REG((base) +
> 0x6c)
> +#define RING_INSTPS(base)			XE_REG((base) + 0x70)
>  #define RING_ACTHD(base)			XE_REG((base) + 0x74)
>  #define RING_DMA_FADD(base)			XE_REG((base) +
> 0x78)
>  #define RING_HWS_PGA(base)			XE_REG((base) + 0x80)
> @@ -102,6 +105,8 @@
>  #define   SELECTIVE_READ_GROUP			REG_GENMASK(29,
> 23)
>  #define   SELECTIVE_READ_INSTANCE		REG_GENMASK(22, 16)
>=20
> +#define RESET_CTRL(base)			XE_REG((base) + 0xd0)
> +
>  /*
>   * CMD_CCTL read/write fields take a MOCS value and _not_ a table index.
>   * The lsb of each can be considered a separate enabling bit for encrypt=
ion.
> @@ -123,15 +128,21 @@
>  #define FF_SLICE_CS_CHICKEN1(base)		XE_REG((base) + 0xe0,
> XE_REG_OPTION_MASKED)
>  #define   FFSC_PERCTX_PREEMPT_CTRL		REG_BIT(14)
>=20
> +#define FF_SLICE_CS_CHICKEN2(base)		XE_REG((base) + 0xe4,
> XE_REG_OPTION_MASKED)
> +
>  #define CS_DEBUG_MODE1(base)			XE_REG((base) + 0xec,
> XE_REG_OPTION_MASKED)
>  #define   FF_DOP_CLOCK_GATE_DISABLE		REG_BIT(1)
>  #define   REPLAY_MODE_GRANULARITY		REG_BIT(0)
>=20
>  #define INDIRECT_RING_STATE(base)		XE_REG((base) + 0x108)
>=20
> +#define RING_BB_STATE(base)			XE_REG((base) + 0x110)
> +
>  #define RING_BBADDR(base)			XE_REG((base) + 0x140)
>  #define RING_BBADDR_UDW(base)			XE_REG((base) +
> 0x168)
>=20
> +#define RING_BB_ADDR_DIFF(base)			XE_REG((base) +
> 0x154)
> +
>  #define PR_CTR_CTRL(base)			XE_REG((base) + 0x178)
>  #define   CTR_COUNT_SELECT_FF			REG_BIT(31)
>  #define   CTR_LOGIC_OP_MASK			REG_GENMASK(30,
> 0)
> @@ -148,6 +159,8 @@
>  #define   BLIT_CCTL_DST_MOCS_MASK		REG_GENMASK(14, 9)
>  #define   BLIT_CCTL_SRC_MOCS_MASK		REG_GENMASK(6, 1)
>=20
> +#define RING_CSBEFSM3(base)			XE_REG((base) +
> 0x224)
> +
>  #define RING_EXECLIST_STATUS_LO(base)		XE_REG((base) +
> 0x234)
>  #define RING_EXECLIST_STATUS_HI(base)		XE_REG((base) +
> 0x234 + 4)
>=20
> @@ -169,9 +182,16 @@
>  #define   GFX_MSIX_INTERRUPT_ENABLE		REG_BIT(13)
>  #define   GFX_DISABLE_LEGACY_MODE		REG_BIT(3)
>=20
> +#define RING_CSFESM(base)			XE_REG((base) + 0x2a0)
> +#define RING_CSFESM2(base)			XE_REG((base) + 0x2a4)
> +#define RING_CSFESM3(base)			XE_REG((base) + 0x2a8)
> +#define RING_CSPWRFSM(base)			XE_REG((base) +
> 0x2ac)
> +
>  #define RING_CSMQDEBUG(base)			XE_REG((base) +
> 0x2b0)
>  #define   CURRENT_ACTIVE_QUEUE_ID_MASK		REG_GENMASK(7, 0)
>=20
> +#define RING_CSBEFSM(base)			XE_REG((base) + 0x2bc)
> +
>  #define RING_QUEUE_TIMESTAMP(base)		XE_REG((base) +
> 0x4c0)
>  #define RING_QUEUE_TIMESTAMP_UDW(base)
> 	XE_REG((base) + 0x4c0 + 4)
>=20
> @@ -217,6 +237,8 @@
>  #define   PREEMPT_GPGPU_LEVEL_MASK
> 	PREEMPT_GPGPU_LEVEL(1, 1)
>  #define   PREEMPT_3D_OBJECT_LEVEL		REG_BIT(0)
>=20
> +#define CS_PREEMPTION_STATUS(base)		XE_REG((base) +
> 0x5ac)
> +
>  #define CS_GPR_DATA(base, n)			XE_REG((base) + 0x600 + (n) *
> 4)
>  #define CS_GPR_REG(base, n)			CS_GPR_DATA((base), (n) * 2)
>  #define CS_GPR_REG_UDW(base, n)			CS_GPR_DATA((base),
> (n) * 2 + 1)
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c
> b/drivers/gpu/drm/xe/xe_guc_capture.c
> index 6a20eab0f820..2e13df97e106 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -150,6 +150,33 @@ struct __guc_capture_parsed_output {  #define
> XE3P_BASE_ENGINE_INSTANCE \
>  	{ RING_CSMQDEBUG(0),		REG_32BIT,	0,	0,
> 	0,	"CSMQDEBUG"}
>=20
> +#define XE3P_CS_DEBUG_INSTANCE \
> +	{ RESET_CTRL(0),		REG_32BIT,	0,	0,	0,
> 	"RESET_CTRL"}, \
> +	{ RING_CSBEFSM3(0),		REG_32BIT,	0,	0,	0,
> 	"RING_CSBEFSM3"}, \
> +	{ RING_CSFESM(0),		REG_32BIT,	0,	0,	0,
> 	"RING_CSFESM"}, \
> +	{ RING_CSFESM2(0),		REG_32BIT,	0,	0,	0,
> 	"RING_CSFESM2"}, \
> +	{ RING_CSFESM3(0),		REG_32BIT,	0,	0,	0,
> 	"RING_CSFESM3"}, \
> +	{ RING_CSPWRFSM(0),		REG_32BIT,	0,	0,	0,
> 	"RING_CSPWRFSM"}, \
> +	{ RING_CSBEFSM(0),		REG_32BIT,	0,	0,	0,
> 	"RING_CSBEFSM"}, \
> +	{ RING_CSFE_GLB_CHICKEN3(0),	REG_32BIT,	0,	0,
> 	0,	"RING_CSFE_GLB_CHICKEN3"}, \
> +	{ RING_PSMI_CTL(0),		REG_32BIT,	0,	0,	0,
> 	"RING_PSMI_CTL"}, \
> +	{ RING_INSTPS(0),		REG_32BIT,	0,	0,	0,
> 	"RING_INSTPS"}, \
> +	{ RING_BB_ADDR_DIFF(0),		REG_32BIT,	0,	0,
> 	0,	"RING_BB_ADDR_DIFF"}, \
> +	{ RING_BB_STATE(0),		REG_32BIT,	0,	0,	0,
> 	"RING_BB_STATE"}
> +
> +/*
> + * CS_CHICKEN1 has GPGPU/3D preempt bits; keep with RCS/CCS only.
> + * RCS+CCS share GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE, so these
> cannot
> + * be RCS-only.
> + */
> +#define XE3P_RC_CS_PREEMPT_INSTANCE \
> +	{ CS_DEBUG_MODE1(0),		REG_32BIT,	0,	0,
> 	0,	"CS_DEBUG_MODE1"}, \
> +	{ CS_CHICKEN1(0),		REG_32BIT,	0,	0,	0,
> 	"CS_CHICKEN1"}, \
> +	{ CS_PREEMPTION_STATUS(0),	REG_32BIT,	0,	0,	0,
> 	"CS_PREEMPTION_STATUS"}
> +
> +#define XE3P_BCS_ONLY_INSTANCE \
> +	{ BCS_SWCTRL(0),		REG_32BIT,	0,	0,	0,
> 	"BCS_SWCTRL"}
> +
>  /* XE_LP Global */
>  static const struct __guc_mmio_reg_descr xe_lp_global_regs[] =3D {
>  	COMMON_XELP_BASE_GLOBAL,
> @@ -186,9 +213,12 @@ static const struct __guc_mmio_reg_descr
> xe_vec_inst_regs[] =3D {
>  	COMMON_BASE_ENGINE_INSTANCE,
>  };
>=20
> +#define XE_BLT_INST_REGS \
> +	COMMON_BASE_ENGINE_INSTANCE
> +
>  /* Blitter Per-Engine-Instance */
>  static const struct __guc_mmio_reg_descr xe_blt_inst_regs[] =3D {
> -	COMMON_BASE_ENGINE_INSTANCE,
> +	XE_BLT_INST_REGS,
>  };
>=20
>  /* XE_LP - GSC Per-Engine-Instance */
> @@ -200,6 +230,15 @@ static const struct __guc_mmio_reg_descr
> xe_lp_gsc_inst_regs[] =3D {  static const struct __guc_mmio_reg_descr
> xe3p_rc_inst_regs[] =3D {
>  	COMMON_BASE_ENGINE_INSTANCE,
>  	XE3P_BASE_ENGINE_INSTANCE,
> +	XE3P_CS_DEBUG_INSTANCE,
> +	XE3P_RC_CS_PREEMPT_INSTANCE,
> +};
> +
> +/* Xe3p Blitter Per-Engine-Instance */
> +static const struct __guc_mmio_reg_descr xe3p_blt_inst_regs[] =3D {
> +	XE_BLT_INST_REGS,
> +	XE3P_CS_DEBUG_INSTANCE,
> +	XE3P_BCS_ONLY_INSTANCE,
>  };
>=20
>  /*
> @@ -264,7 +303,7 @@ static const struct __guc_mmio_reg_descr_group
> xe3p_lists[] =3D {
>  	MAKE_REGLIST(xe_vec_class_regs, PF, ENGINE_CLASS,
> GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE),
>  	MAKE_REGLIST(xe_vec_inst_regs, PF, ENGINE_INSTANCE,
> GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE),
>  	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS,
> GUC_CAPTURE_LIST_CLASS_BLITTER),
> -	MAKE_REGLIST(xe_blt_inst_regs, PF, ENGINE_INSTANCE,
> GUC_CAPTURE_LIST_CLASS_BLITTER),
> +	MAKE_REGLIST(xe3p_blt_inst_regs, PF, ENGINE_INSTANCE,
> +GUC_CAPTURE_LIST_CLASS_BLITTER),
>  	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS,
> GUC_CAPTURE_LIST_CLASS_GSC_OTHER),
>  	MAKE_REGLIST(xe_lp_gsc_inst_regs, PF, ENGINE_INSTANCE,
> GUC_CAPTURE_LIST_CLASS_GSC_OTHER),
>  	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS,
> GUC_CAPTURE_LIST_CLASS_PAGING), @@ -377,9 +416,12 @@ static const
> struct __ext_steer_reg xehpg_extregs[] =3D {
>  	{"SC_INSTDONE_EXTRA",
> 	XEHPG_SC_INSTDONE_EXTRA},
>  	{"SC_INSTDONE_EXTRA2",
> 	XEHPG_SC_INSTDONE_EXTRA2},
>  	{"INSTDONE_GEOM_SVGUNIT",
> 	XEHPG_INSTDONE_GEOM_SVGUNIT},
> +};
> +
> +static const struct __ext_steer_reg xe2_extregs[] =3D {
>  	{"ROW_INSTDONE_TDL_GFX",	ROW_INSTDONE_TDL_GFX},
>  	{"SS_LSC_HDC_IDLE_TDL_GFX",	SS_LSC_HDC_IDLE_TDL_GFX},
> -	{"SLICE_ARB_STATUS",		SLICE_ARB_STATUS}
> +	{"SLICE_ARB_STATUS",		SLICE_ARB_STATUS},
>  };
>=20
>  static void __fill_ext_reg(struct __guc_mmio_reg_descr *ext, @@ -422,6
> +464,8 @@ static int guc_capture_get_steer_reg_num(struct xe_device *xe)
>=20
>  	if (GRAPHICS_VERx100(xe) >=3D 1255)
>  		num +=3D ARRAY_SIZE(xehpg_extregs);
> +	if (GRAPHICS_VER(xe) >=3D 20)
> +		num +=3D ARRAY_SIZE(xe2_extregs);
>=20
>  	return num;
>  }
> @@ -434,6 +478,7 @@ static void guc_capture_alloc_steered_lists(struct
> xe_guc *guc)
>  	const struct __guc_mmio_reg_descr_group *lists =3D guc->capture-
> >reglists;
>  	const struct __guc_mmio_reg_descr_group *list;
>  	struct __guc_mmio_reg_descr_group *extlists;
> +	bool has_xe2_extregs =3D GRAPHICS_VER(gt_to_xe(gt)) >=3D 20;
>  	struct __guc_mmio_reg_descr *extarray;
>  	bool has_xehpg_extregs =3D GRAPHICS_VERx100(gt_to_xe(gt)) >=3D 1255;
>  	struct drm_device *drm =3D &gt_to_xe(gt)->drm; @@ -504,6 +549,12
> @@ static void guc_capture_alloc_steered_lists(struct xe_guc *guc)
>  				__fill_ext_reg(extarray, &xehpg_extregs[i],
> dss, slice, subslice);
>  				++extarray;
>  			}
> +
> +		if (has_xe2_extregs)
> +			for (i =3D 0; i < ARRAY_SIZE(xe2_extregs); ++i) {
> +				__fill_ext_reg(extarray, &xe2_extregs[i], dss,
> slice, subslice);
> +				++extarray;
> +			}
>  	}
>=20
>  	extlists[0].num_regs =3D total;
> --
> 2.43.0


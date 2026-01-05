Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C1A1C79FA8
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jan 2026 17:17:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E070810E04E;
	Mon,  5 Jan 2026 17:17:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IWJifTxo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5651810E04E
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Jan 2026 17:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767633446; x=1799169446;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aJ9XoCfTqe5Vu4KSQ7+Ycf7nbq2cbtFB9aais5Ajg98=;
 b=IWJifTxoHfJP25j+Ylfs+FXfL7vgGNRMiI9kJWzBSJKWll8HpMBHjflD
 9e1ZSRPQRrm8hSosk21ruh44n/VeIpTD6N1Ft8mCC76+M3MVE8pks+Oz5
 KGTbqqQhlojD/egyEpx/95kBpdrMc3wHUcHjQ3iwOE9aMUEreGXD7DF/W
 w1l6tHguGrZs3Yzz1fEIKLdcuUPIDlHoHh1LlTBOZttwHtdIbQUj90crq
 flih8ddvrGASeRUTa4DUNlo6GMQ6A2zrryPvCNLHWbGi1fFXOWM57cVqg
 v4ydA3qAeQ0MeQbWLI+/sggADFO0zGAwEF6sljrouq7ClbAP2jtF1QUuY Q==;
X-CSE-ConnectionGUID: V1s+ugzERNa+B+/q91Y8XQ==
X-CSE-MsgGUID: pfnzwKbfTq2KBHETvxes5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="80450181"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="80450181"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 09:17:26 -0800
X-CSE-ConnectionGUID: CQsevgbdQa6CAfjtHw7vpw==
X-CSE-MsgGUID: fFGNgHYBRXi64HsVwLapXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="207325945"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 09:17:25 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 09:17:25 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 5 Jan 2026 09:17:25 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.33) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 09:17:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tg3wuzBDRz14NyluXjxQVHgBUhJ4+dlAAvke0s3JHPP3jHoAkQSZY3185mrFb6w2pQsSRvQZwurzu6Rfb7szAmXspuUKAKZshy/E6+bcICddTV5TFaYnHzCUxAUsi8Cy+G8lES8GF3CWdwtTPIMn2z/WEnq9t+A0ivL0acJesE9Lyswr2vEBziKAaUnndRap+LjrtxcLuD2l+STG7sVD8AJqgeV599Www40h1/OJPVc7dpSQIKvpAABatE/o6POlq0im2KXs06s35YYaSahHaNUNvf1bZwgtb645B4CSWkltBoNvOtax4QZ+MrSBHiNgESuMwPDV6a381rQzlcyn9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=axu7I+xmDmjuWNyCjBWHNhg2dCu1nDXRPrU/fFseAsU=;
 b=DmBo2pSWRTOVvfTkuBFEo7/4GCSrNQyB1W1jzDxH1Cop9i6mKl+I58rfSnWwx81h+3Nu1oS3FmdLcg0QvXIA1IkCiu3juhviCx2KxfOVNCdRiMRaApk5eeIy1NX19wT62a/XLydxXUQIp5v+eYP8n/4Ar+cBleHc+SE+kAfWeXAgcbfxNwpTtoHRLI9IPbDf1fkK7LqXsHoXlKgAzSdAetaX1RMiD8jp0XxDcB3gvX4963IurOCznR3Qg2yHdtnI+V4At+lkQXT5OBGFTTTnyjL95LxrdrxrO1rjKqucczdqqBZSFPe02YTpPTcd3oh0PFozlbQHOdg9WmNtTh6HMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8839.namprd11.prod.outlook.com (2603:10b6:806:467::17)
 by SJ2PR11MB8401.namprd11.prod.outlook.com (2603:10b6:a03:539::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 17:17:20 +0000
Received: from SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::ce6c:3c7f:92ef:1394]) by SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::ce6c:3c7f:92ef:1394%5]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 17:17:18 +0000
From: "Nguyen, Brian3" <brian3.nguyen@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 2/2] drm/xe: Add page reclamation related stats
Thread-Topic: [PATCH 2/2] drm/xe: Add page reclamation related stats
Thread-Index: AQHcdS40H+OoQBsgS0WW4775yUO2ZrVD1c2AgAAN4BA=
Date: Mon, 5 Jan 2026 17:17:17 +0000
Message-ID: <SA1PR11MB8839AF75710D7E60FE139E8FAA86A@SA1PR11MB8839.namprd11.prod.outlook.com>
References: <20251224233638.1535283-4-brian3.nguyen@intel.com>
 <20251224233638.1535283-6-brian3.nguyen@intel.com>
 <aVvmRcMNMytX6SSH@lstrano-desk.jf.intel.com>
In-Reply-To: <aVvmRcMNMytX6SSH@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8839:EE_|SJ2PR11MB8401:EE_
x-ms-office365-filtering-correlation-id: 012d36b8-2a65-490d-bc9e-08de4c7e4756
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?O2QBb0vmK92q3bmw9aak0XGv4YXk5R1WbvOD1YIj2+Anw7omwXxMhZ1fuAve?=
 =?us-ascii?Q?fjh+14SrB+exRREQRu1aWXwkc3QwNavixyz+o7YsFZ3FZiJ+MBAOO/eTKMQD?=
 =?us-ascii?Q?ehNNYQd0i7+2XezOBC+DVFB9yfLLdoDuop2o7AerrjrbWzOfO3HbrFctIGPk?=
 =?us-ascii?Q?+t7BhuWmycKz1D0uVb2SkK66UvAsWZ+Bmi7zmnyJphmyvcmYM5Eo5gaJ66sa?=
 =?us-ascii?Q?K2q3ywMMZjlqS+aIrVCSXBUckOZ+wnlJFr3+WMsnO7xxDIfGfr41jrPLomex?=
 =?us-ascii?Q?/XKWXDM+/QeNUK4f/LBgP6Dyir30FZ98fDfaJ7GYYoiMjOVCVQLKCR/3vu0a?=
 =?us-ascii?Q?S2sQwULSaR/+PKUGBhL0P/la2dbTm7MsBOM1Cq/sj4HZjhzHo0ISwotC5dF/?=
 =?us-ascii?Q?toyZodCoink6kkYJkNbx1W2hGf6r4BSV/6fai5Qj4xCS6LtCBXyyf2+97522?=
 =?us-ascii?Q?BE8RshEdBCPK+VAaarCpF/n5uzCCyjDX9LGUI9NZwbn3/Lzuq6g+yPNiSf91?=
 =?us-ascii?Q?91XI8E/+L0/YJ3o7lt5Qw/wUqHdUpOW/CTh0SQD4AlV+iJNmWWnAy0lOfBZt?=
 =?us-ascii?Q?elLjcX6dhIP2BX6JS6OF3zEK42C6c+6hgx33gAb+O3jP3UYI7BJH7pGWDmWL?=
 =?us-ascii?Q?H6RfyTRYwyKqSsB3HaStXkCHysmOSU8I3I7ZFLx//TQPleXP/5Al6ww+++HZ?=
 =?us-ascii?Q?B/bPMceJXKpBIIiCyeJ3d+sOXiLZtMxgvKQsL1SwPzKMdzD5KbZBqnQTv+Bk?=
 =?us-ascii?Q?5JWcSuyLOt+UsYM2N74D6qxABN2rm3i0Kmwiz/qXb+gpcXYBSy5dCLAUZDqN?=
 =?us-ascii?Q?vAvwPWbdLm4voWIto4uswYpZRkKwITXVlGFV6CFiUgQYoo3KritLyojLZsKj?=
 =?us-ascii?Q?9JRATGxHbiq/49zyxfxutBiP7pJMZ+IIaznazEGTd7opzVAC7SYa9O2tOrrk?=
 =?us-ascii?Q?JVCF5iSEhLVcZlqLkgOPvZHEc/7eyzeD5HHWjujKig2nLpNH+JND3JPlqDEQ?=
 =?us-ascii?Q?mLnU3gSoPw96mHPt6blbP6mCynUWYQ9UtoPz41wCZViG8d9oG72h0/oBmRpu?=
 =?us-ascii?Q?boKSpaEgdrkemrPwGyGcPwVaAhfZ/S7BVnxBaEnAp7IDK0ZwZw4Vc5N8pSLL?=
 =?us-ascii?Q?5x75ewtWm1Ij/9oirx+GCX5iNttosCwEHGNSCL2ond1wVEYFYVuc0zQlrP6b?=
 =?us-ascii?Q?5l891tb9dtAq14keA7vDViYdhqokg8nq2QrDBTVVH2SXWa6xbPbLjiq8vWeN?=
 =?us-ascii?Q?Yh51TKu25UBxRl9c2Tnt/l7bTDAsQgUcYIfizgVe3lcJwpuD5srdWDSpi5qb?=
 =?us-ascii?Q?dtrYc7+8k35G5l+CUQ098ehB2q0TcPEgpKFhfEAOM7ukkfkAFdJkZG6TT6g3?=
 =?us-ascii?Q?8FYwzkuZsxdkDknGVuJpjRxmeWGgj9DOk5YTeOIkC3SPOeN3HoOHkJx6+tPm?=
 =?us-ascii?Q?hY1mDEefHr80jL9pb3WAaW1jBQ/PO9Xbii3M5jW0qW2QBaFUjWD/o4LtbafX?=
 =?us-ascii?Q?1GdIVZhbv4iigpMJK1qd0gMENlKTQHUP6FKt?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8839.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ad+y3zR/DDWi+h9OoQamSHI8LK/aAvmmQqpRUF7ZzEZ1ufvsNohA3t8gThvp?=
 =?us-ascii?Q?Dlby83Yd+ZqNZQYdXWnF8mpeMO0kBWV8ySGsTgHNQYzZKzp+9nhQ2tp1CG3A?=
 =?us-ascii?Q?f+620l/AK5y+1WgJOoksjF2Ohrufg8RowqWg0JlNTc9kjkQ4UyQuNr9BX1g5?=
 =?us-ascii?Q?fdZ1myh/S2ZsXYbkodnB/4uA/r1zVRug/+6phI/NzZfda882i/SEw7nL7c8X?=
 =?us-ascii?Q?smZdiZ6T7Tx/zljgLTO03wpWDYduHNbjBsf7/sxeEzt0y8OfsakxLSbXBJZg?=
 =?us-ascii?Q?ge51t2GgjJGAOWAcVOiKUjHCHWX3ck/CC1q8KdWfdqOlj5/EZKJ4wMwyYG2p?=
 =?us-ascii?Q?MUqjRZ88B68j3JeUukehOA9ESQiLoJyk3HV3jwvR874ovi+lJqfhARN6ncIF?=
 =?us-ascii?Q?fvGGeic6H75wO1a6myvHOBp0uNBbw9bmfBHjDzjNlt3QZSNJ6U/Er3iHPnRG?=
 =?us-ascii?Q?HFZCMoCxPO2WK7J0HzOxdJ+KzsIgxh8LGfKTqFjItkXEBMaFhXhoHBTwI2Vr?=
 =?us-ascii?Q?EGGotrlY7ApaiWJT1PF53tF/oe4gCuBAwZbLOkGaSJTDHSWSvph5+qHtfaqn?=
 =?us-ascii?Q?J6Elp7u3FwB7gt45/DNsnDFTUENByOYo18M5ysPwd5ay568KEwAGG+lOhLZb?=
 =?us-ascii?Q?p4/Orp4vrV74JxyiY8zpFNt2C/U7Z5iA9lSIz2FDAkN/NfXonDWKVQBA9GlA?=
 =?us-ascii?Q?/+v1TGn5G/ZQL+GuUwihwGhCoQDCY4zRDxvfRDPeBNh4iiSvF9oEvWxQeGDz?=
 =?us-ascii?Q?PHabNm66s/sMZH8w0mnyhIZH/hIQyVkRSywVJICET3MNnoUnvHdt1s+vVaM2?=
 =?us-ascii?Q?jIq5+cH1//6aEwjDDbI0+IvS2fJ0ZcbodrI4PV3zY/XnZ2aD5im01nC9n0y7?=
 =?us-ascii?Q?xeq9ge8kIJ3qSO8WNt4lJ+8A4l6gTeTHNFIR4QA3pixMZLqfG4Wl5BzBeWk/?=
 =?us-ascii?Q?Ny8QoZXC9hAa+CDsiozQvPp+Rr+gIWfbAmp0Orn1+dvmXYBFGqclYMDKl110?=
 =?us-ascii?Q?kjhrbZPeU8t+oqttz5Smc0TxFa8BY02QF9bQu9SOvHWw4mnQUvo8sM5wdeT8?=
 =?us-ascii?Q?5BGol24y4CvkUKnuVzdJKvwhvcUNfqp2eLHTCFr99IBpv9gLyzuGqRFqHAA7?=
 =?us-ascii?Q?qe393m2KzM0Lj+doSnwpRxv+ijUzbFD+xYIyiPmS+90IEdPRTEsPrJtA8+RO?=
 =?us-ascii?Q?oSYkVTWw6kvQeRvEHcMgqwHKf7ErL8+TnLkZmBCIPPkEg+xbCFNmUsNhXXAs?=
 =?us-ascii?Q?OqWAZ08yJYSJVsmMpvCLqZKRRKXI7zppxsUJUIBl0WkYhbd8x5KC1Q1FLoQF?=
 =?us-ascii?Q?cDgtpkIG1VrXajEybrIZS/Bvh7Ijsy2eNUs5bB3uLQpCbWItV1xhOgxlYTnB?=
 =?us-ascii?Q?ux1O41bbaY1gcd8V6d0w8jJgkUl8aztKtDmaNu/6K8bExmpZoQ046h6goPBW?=
 =?us-ascii?Q?v4BFnnUavRAEgO43sCLSMfEu0RCNxaZPGfVJkltfWXLkRw2Ob2QYlfKoGbEz?=
 =?us-ascii?Q?5LLlLcmePFzVWCLfQnK6CelfZZso4mfpcD9nEpseJAm8dhz0uxaKyafUnWaI?=
 =?us-ascii?Q?N9KnBYJvb1qUd6g90BhXayY1iBKWuCahrzt5bI2JPZOs1Rag/fH51DwE+Hb7?=
 =?us-ascii?Q?xNnxZQCe3MoReNpT5yImkRpF3Vf+hiqDXb25lgl6NMfbOnk8JHF3/phM2rlG?=
 =?us-ascii?Q?fEBixOf85bUGOrsp2d8g+WcA6JrPBC8hNVAdEgEZtptudgVEj7OQ5NjmzH3W?=
 =?us-ascii?Q?MX8HSIUr2Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8839.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 012d36b8-2a65-490d-bc9e-08de4c7e4756
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2026 17:17:17.6414 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2snPVzQhxOhKB5kZTQ4YgX3mdRDnv1HCbsWRiRV8ZFoDrKTN81DHFE3goI8KkMH0xzjoTjeHS/UGDHAWHDnn1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8401
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

On Monday, January 5, 2026 8:27 AM, Matthew Brost wrote:
> On Thu, Dec 25, 2025 at 07:36:41AM +0800, Brian Nguyen wrote:
> > Add page reclaim list (PRL) related stats to GT stats to assist in
> > debugging and tuning of page reclaim related actions. Include counters
> > of page sizes added to PRL and if PRL action is issued.
> >
> > Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_stats.c       | 4 ++++
> >  drivers/gpu/drm/xe/xe_gt_stats_types.h | 4 ++++
> > drivers/gpu/drm/xe/xe_guc_tlb_inval.c  | 3 +++
> >  drivers/gpu/drm/xe/xe_pt.c             | 5 +++++
> >  4 files changed, 16 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c
> > b/drivers/gpu/drm/xe/xe_gt_stats.c
> > index fb2904bd0abd..ab61d2579e87 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_stats.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_stats.c
> > @@ -76,6 +76,10 @@ static const char *const stat_description[__XE_GT_ST=
ATS_NUM_IDS] =3D {
> >  		     "hw_engine_group_suspend_lr_queue_us"),
> >  	DEF_STAT_STR(HW_ENGINE_GROUP_WAIT_DMA_QUEUE_US,
> >  		     "hw_engine_group_wait_dma_queue_us"),
> > +	DEF_STAT_STR(PRL_4K_ENTRY_COUNT, "prl_4k_entry_count"),
> > +	DEF_STAT_STR(PRL_64K_ENTRY_COUNT, "prl_64k_entry_count"),
> > +	DEF_STAT_STR(PRL_2M_ENTRY_COUNT, "prl_2m_entry_count"),
> > +	DEF_STAT_STR(PRL_ISSUED_COUNT, "prl_issued_count"),
> >  };
> >
> >  /**
> > diff --git a/drivers/gpu/drm/xe/xe_gt_stats_types.h
> > b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> > index b92d013091d5..424eb8ec9c09 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_stats_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> > @@ -49,6 +49,10 @@ enum xe_gt_stats_id {
> >  	XE_GT_STATS_ID_HW_ENGINE_GROUP_WAIT_DMA_QUEUE_COUNT,
> >  	XE_GT_STATS_ID_HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_US,
> >  	XE_GT_STATS_ID_HW_ENGINE_GROUP_WAIT_DMA_QUEUE_US,
> > +	XE_GT_STATS_ID_PRL_4K_ENTRY_COUNT,
> > +	XE_GT_STATS_ID_PRL_64K_ENTRY_COUNT,
> > +	XE_GT_STATS_ID_PRL_2M_ENTRY_COUNT,
> > +	XE_GT_STATS_ID_PRL_ISSUED_COUNT,
>=20
> Can we get a PRL_ABORTED_COUNT stats too?
>=20

Makes sense, added.

Brian

> Matt
>=20
> >  	/* must be the last entry */
> >  	__XE_GT_STATS_NUM_IDS,
> >  };
> > diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > index 6532a88d51e2..774467befbb9 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > @@ -97,6 +97,7 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inval
> > *tlb_inval, u32 seqno)  static int send_page_reclaim(struct xe_guc *guc=
, u32 seqno,
> >  			     u64 gpu_addr)
> >  {
> > +	struct xe_gt *gt =3D guc_to_gt(guc);
> >  	u32 action[] =3D {
> >  		XE_GUC_ACTION_PAGE_RECLAMATION,
> >  		seqno,
> > @@ -104,6 +105,8 @@ static int send_page_reclaim(struct xe_guc *guc, u3=
2 seqno,
> >  		upper_32_bits(gpu_addr),
> >  	};
> >
> > +	xe_gt_stats_incr(gt, XE_GT_STATS_ID_PRL_ISSUED_COUNT, 1);
> > +
> >  	return xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> >  			      G2H_LEN_DW_PAGE_RECLAMATION, 1);  } diff --git
> > a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c index
> > a79734079ef3..e83bc4503e5b 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -11,6 +11,7 @@
> >  #include "xe_drm_client.h"
> >  #include "xe_exec_queue.h"
> >  #include "xe_gt.h"
> > +#include "xe_gt_stats.h"
> >  #include "xe_migrate.h"
> >  #include "xe_page_reclaim.h"
> >  #include "xe_pt_types.h"
> > @@ -1587,6 +1588,7 @@ static int generate_reclaim_entry(struct xe_tile =
*tile,
> >  				  struct xe_page_reclaim_list *prl,
> >  				  u64 pte, struct xe_pt *xe_child)  {
> > +	struct xe_gt *gt =3D tile->primary_gt;
> >  	struct xe_guc_page_reclaim_entry *reclaim_entries =3D prl->entries;
> >  	u64 phys_addr =3D pte & XE_PTE_ADDR_MASK;
> >  	u64 phys_page =3D phys_addr >> XE_PTE_SHIFT; @@ -1607,12 +1609,15 @@
> > static int generate_reclaim_entry(struct xe_tile *tile,
> >  	 * Only 4K, 64K (level 0), and 2M pages are supported by hardware for=
 page reclaim
> >  	 */
> >  	if (xe_child->level =3D=3D 0 && !(pte & XE_PTE_PS64)) {
> > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_PRL_4K_ENTRY_COUNT, 1);
> >  		reclamation_size =3D COMPUTE_RECLAIM_ADDRESS_MASK(SZ_4K);  /* reclam=
ation_size =3D 0 */
> >  		xe_tile_assert(tile, phys_addr % SZ_4K =3D=3D 0);
> >  	} else if (xe_child->level =3D=3D 0) {
> > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_PRL_64K_ENTRY_COUNT, 1);
> >  		reclamation_size =3D COMPUTE_RECLAIM_ADDRESS_MASK(SZ_64K); /* reclam=
ation_size =3D 4 */
> >  		xe_tile_assert(tile, phys_addr % SZ_64K =3D=3D 0);
> >  	} else if (xe_child->level =3D=3D 1 && pte & XE_PDE_PS_2M) {
> > +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_PRL_2M_ENTRY_COUNT, 1);
> >  		reclamation_size =3D COMPUTE_RECLAIM_ADDRESS_MASK(SZ_2M);  /* reclam=
ation_size =3D 9 */
> >  		xe_tile_assert(tile, phys_addr % SZ_2M =3D=3D 0);
> >  	} else {
> > --
> > 2.52.0
> >

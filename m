Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAAA6C3064D
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jul 2024 05:34:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49D9910E269;
	Tue,  2 Jul 2024 05:34:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q0wzru23";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E31F110E358
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Jul 2024 05:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719898458; x=1751434458;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dOLVAN7RuZOAtUcdFUwK5YjN454zSVUJxF8i55PJ6/4=;
 b=Q0wzru2319FVH8J9wpUJWqzuED4ra/ruYAusC4MYBiH9bgBrQNCEIfrI
 LVp99Q/97CgJb/fCt4Vc+I4jAskqqWJO3eNrCuAzvh3ymoaw3jYJB276n
 7aqOJPbXbq2v5wmzzCYIKkWlE1zyRqK7aIxqshWk+QiWzpmjwB4fARVQo
 gxfeXjeR4BglDS3PbkMsFGhWb/JC/VlNa6icoqipHI4Y54h1PGoF7f/8v
 KJMtNpRpjD5MWzCRMqeIPKst/iIoRgwDu3pqWr8YZcrYOhR7ohTZjctpq
 bhNqScW3+F3VE0Erc87SnuZ66ybDhXKK+7qBDXv9cCgCp+tiW9wRYR29h w==;
X-CSE-ConnectionGUID: JJoplnuCS2ixVWvfkUmMNg==
X-CSE-MsgGUID: XlUPkKAGRAyhgXgMeo0UIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11120"; a="27732681"
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; d="scan'208";a="27732681"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2024 22:34:18 -0700
X-CSE-ConnectionGUID: G2FNQ4PGSKOVVf3Vjgf01g==
X-CSE-MsgGUID: XfoD1uCAQMWLZBtSE/bVAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; d="scan'208";a="45844795"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Jul 2024 22:34:17 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 1 Jul 2024 22:34:16 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 1 Jul 2024 22:34:16 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 1 Jul 2024 22:34:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WjTQraq7xODS0gpFZPxja+IU8n0KCWPGmBM3/lJHad5Od1aeOHqSf0Gy2ywjWSI3Yqa4ju1hBNxSYP88bIYMi7d/zEGBpXEtWp5T9PKCpU6Y++EWPZWbPPrshypYwv3eOBYkKGwsfE9hk6f8xKdDtuRxrWGav/q/OpAuX6RjVUMMXzdZVfkIv+TVjsSA/qv/ZuP71aO+gxDcwl0vCCtCyi+aX5oV28rGNutwDTezYDtRlbKXHBya4hxFI85t1Sl0rP5y307Bb9Ui7GUAQlXNBrJIulhCZ4UlLWLFcPBJ/su8yWCumxr5AD2GPWX9qFPHVpBF9AQuJDZy9JsS4b7H2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IbK98yAzf/Yd1ZlB5g6Sb4yP9J0NKOMD34YcZ56OFcg=;
 b=RNaYHlK6nC2lKZyRbw69YMqKUZw3VjS5IeUiw6zcgZn5U8QaHNTi0j7rzSffbkZPFr5qRpru5Whey9x+ta9L1Uc5XKpbKBEjwSVcKLRyRhD4xRBT0q2r2ePCeGkupgOz9+6WvpTafh5QV/x4X5O7UsKMDmIwHyJg9SWyQ3ZB5SzU+SyMqmQ0eLc/oSJh+g8HnWPMnCIE95mdJw/Qorf5imU3m3kXMs7iNx0Fw4qCOCIDEwk5rn6Hr8URMd0gAiKJlNxr/amZMyAS+ckBXz/TblozHrWIxy4GtYvzGxvI7tuMHwW5kHhNYtPhwTwLcc+0Y9LgIq3Vql1Kq0IKWWttSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by DS0PR11MB7580.namprd11.prod.outlook.com (2603:10b6:8:148::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Tue, 2 Jul
 2024 05:34:09 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.7719.022; Tue, 2 Jul 2024
 05:34:09 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe/xe2lpm: Add Wa_15015404425
Thread-Topic: [PATCH] drm/xe/xe2lpm: Add Wa_15015404425
Thread-Index: AQHaraQkIbgiNoBS90KzjpdH8HAyj7GtSzuAgAB9kcCAAOJZAIA0e96Q
Date: Tue, 2 Jul 2024 05:34:09 +0000
Message-ID: <SJ1PR11MB6204FDFDBEC917F7B0749A5881DC2@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240524063228.127423-1-tejas.upadhyay@intel.com>
 <20240528230331.GK4990@mdroper-desk1.amr.corp.intel.com>
 <SJ1PR11MB620437AE652A03AC1C7827D881F22@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <20240529200304.GO4990@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20240529200304.GO4990@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|DS0PR11MB7580:EE_
x-ms-office365-filtering-correlation-id: e1c46e9d-8789-4772-7bb6-08dc9a5898e7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?EPGzQ+0MPRXi1ecJ1tFsypcxsYFNNL/385Tl37w/HBpkTsyUQfHPAfH0ZSuh?=
 =?us-ascii?Q?9i+qVDZiLka4dEaYctHv3P1Bu4L7sf5C9xk3UzLZ7splp0VV/qXh10n7N2GJ?=
 =?us-ascii?Q?MSeDkyXCyRLUc3ReEsSZJruXetci+/VfJ4BKcDVm/Yr2WLWrR+5PXgwTPhtv?=
 =?us-ascii?Q?baOnxBvG7/CLPleuF0VIYGVUm2NVSGsdEg1PNo6cgMnsxwCH5qbq9rY5HATj?=
 =?us-ascii?Q?v45iJWmvx4DX2V1aWZ/XnQI8KXPDRoEvDgHwCvHhGFQhifP71T6qTwbW3S4N?=
 =?us-ascii?Q?+vT+nZYsMO+EcwXMW9cFlIDUtEtiiuXNNtDKRvqea3I19Jz3tzTfHmfvtPMe?=
 =?us-ascii?Q?mhTl70BvtpQ2lh6VQs9C9USgVuTghG6svLg7SQRjEcDeiiZkgCSkc0QhZ6dA?=
 =?us-ascii?Q?x5hliAOqGnQnYlQo6FhcH7ucOuvlieiLGeHOMkDteAGVpF8cTiE8Y1Bh1MZG?=
 =?us-ascii?Q?OBfb9SRddTqeyTB1i/0zr9TDMEz8qsnI+sODjhqw3skxNhkcpB7BKZ0VAS3m?=
 =?us-ascii?Q?Fj+4BHluSG9FUDzTLnlegDzEzQvoHsz8DRAkakNlOjJ1Q8eL9OWPdIZzgh9l?=
 =?us-ascii?Q?9JnqJM5IOGbF3Q9SC9g24O7/tCsRIEmnXzWJf0ksOze5LY9/aR6a2p2N3V0F?=
 =?us-ascii?Q?jJHtUbG5voURPRXR8yJzPQqgf7vWmspeX+B3HRrsbLNFxNwf2wB94cpp0v3K?=
 =?us-ascii?Q?MNvIzjMixqisNOn4S83eLh/dm2p/Yi1sIgtkb9oWIrTNSo8ULiz6VLf5Lory?=
 =?us-ascii?Q?AdPSnF+qPUT/kHFdBDf65VAYWhpsqtgpwPGT9t3Si7Z+LVnaWRDqyEQei8ZA?=
 =?us-ascii?Q?NzCe72y6p2MIyH+z4cUAmeH7LvMgFh8mlVdO1W1AKQzQkQPcDFIbIaZpOzbE?=
 =?us-ascii?Q?0baN+6OxoAd7kynv9d6JqLJtkMwvAdbdClUnFgX6dTK1iDYbRSiAvlfc5M2J?=
 =?us-ascii?Q?Mgl5S0AU8aQXMlos+2bBxmps25d1tScbs15ryKlhtF2xTI86VLDjFlEKDFKB?=
 =?us-ascii?Q?oVROpXqrQHTZU37qOVAwN6sZ7qDy3oDsFtX6XLDLETtbUjqYxMcZVrDmjQ+k?=
 =?us-ascii?Q?ySztW81HH/tPeKPbBzhIc6v07rS52gsXgjWrKxwH0a72tit+TRofbGZdDwoB?=
 =?us-ascii?Q?eV8ZhQcGC2LAlJihJUx/MmYDBM1P43VuZ6a1DxeXmY4lrTkViEVoPc1hwef2?=
 =?us-ascii?Q?hJaOQbSpUiXBQK19+ILpZlBKv/lz2/hsTUWKt0BYWl2/ftpbJGnR1p9wVKhO?=
 =?us-ascii?Q?7b5J/jI3+0ittOJ3WrHVj6fcQ31/quqnFAdmgfzPPPpek4pIHh25OFL8sozA?=
 =?us-ascii?Q?b2K2UqFl7lGHSUkcNAxMYDYf77rAPCs3Rg7VCW3TnE3kOQmdnLTSkqeZTO/8?=
 =?us-ascii?Q?HF+WFDOXCzQo5ZPuaKmQ6YjK7ryGKCgdaa8/cAB6yLFjj21wmw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?o5pZKKmvspYvWKhM1Pg3DSOSetelS2R1wU32x50SSAmsncebOghUjLFiOO6g?=
 =?us-ascii?Q?/niF+mjamuA312qX7Hs3FOT+NC4rxR4brRJgV6he4giapWksSXDG97do+Fw7?=
 =?us-ascii?Q?Wj1sABOFwjQxA8ZeddROLnBLVWT1qnd5iQgz0h0bZA0dW416VbTtmAtlhki6?=
 =?us-ascii?Q?3j5hjQ5D6wWa/rB2uENe0tXvlAhGbTcK67cTzDVCa0r66YbZfTrLpMnB2+m6?=
 =?us-ascii?Q?aVdq7Qme/gN8h/U9Br6Dxa1Ow9+hmcLlPQ8sg5yzlAMUGtTlTw5RVpnnTRnM?=
 =?us-ascii?Q?R6nRRrS+hPA/XaaUXtPCp8DmHN4d38egREnVKdLSK9oJ+W2wmf0eoex2JmdY?=
 =?us-ascii?Q?fucDffo9GanioQIlj5wCRObACramNak8i9A95sZwzlhid4w+40g/wCTHiXOS?=
 =?us-ascii?Q?Hwf+nHB1wMGg8aZSmYvVqJ7fTsdRHBvydRoTpDOWBySeRodPTFfPgSWbCxvo?=
 =?us-ascii?Q?eqmPNwGEQmzRT2FwdQs/8FFwlX6ZU+WNRlZYcB2IV8Gc7/BhxrEO+xWdBMUe?=
 =?us-ascii?Q?LGt9kPcaiquzqqDXLrcnyVaXBsIhK3BaMpe39+LVdl2M+VF7HGzhl/rgXpBb?=
 =?us-ascii?Q?RjBpMUwZHzkXYbVEBZWzvKfS2ifg7cHTLkJdbOrYXOQw3lfAGg9k9xgFGM+Z?=
 =?us-ascii?Q?Iyj4nmXmRkngl9e3/r5YvdLQdq1ERPvnhtuSRRV3RqGbJ/eMPvwIJA+wFbQP?=
 =?us-ascii?Q?PwsmkEZZMQ3guW2+ik0/wmlqhMHlKGrF6xbrzm6AMA/TimC5j6xHqFYUCo/A?=
 =?us-ascii?Q?xp/czTEbW2PJwlwoIZfIqmyQrR01WEH5jaenSq3VlXVviyVz28qQfk3su017?=
 =?us-ascii?Q?C4QcRR63YpN+l94ey2v0m5r7lUYDA6fQNl4/lMhDR+ojB9/EkNak3NUo2NAp?=
 =?us-ascii?Q?vLrv6YCzztOJOhKRkEaZOdXgjOv+jSHA11QMqJigsf2G0GN4//Gl3LxFT2dp?=
 =?us-ascii?Q?Avt+nTkQgdgqmGksG4ELlBA0mv/ADrcC47v82hxhvBTOVLGoBtlQYSovnZKj?=
 =?us-ascii?Q?dxjiHwM2Rej8vOMtKFRVQ/BfF4PtPSQa7qNCspibazWHT6oP90v4HtYCxY3m?=
 =?us-ascii?Q?4/g/i6jfWtU+dX9X0L6UTfPi0nViyNKhxR9S6R6Xr5GKGhsPHrsKuFKTJ0wc?=
 =?us-ascii?Q?dbebRXRUM8mtX2EkAGXtr4KaAwXNxHD+hlAcLVr3dsa8X8QXpIw0rYmA21bG?=
 =?us-ascii?Q?szvXHsat2/pFME2N541BzTJ8NNMKo+clfW1qeLt12ozYnNrjoXsQ1yecrsDK?=
 =?us-ascii?Q?T/+8SdUpgrMXRcqMnhxD9hMbMAYoqZnJV26rvCE8qlbrybv175rS+z7gT30b?=
 =?us-ascii?Q?L2yjvemgxyvvLIAoOTocMjNDHSnlkP62ckyvnRaLmeDDEwxlYq7Jz+6cz5g2?=
 =?us-ascii?Q?12SxrEeooHgTXjzbnUSqhsjKl2Y0/BK4lGTWTiIqLOV/d+h09OmfChdzNhS3?=
 =?us-ascii?Q?tlOTKVSTh5gsm4KzvCt8YqVMFrDEwgcdlRSKkolN0iRemTTWADkvE/xamMBg?=
 =?us-ascii?Q?n3xn8muntk/gSQQ0aJhCeEAZsZkegQoBZDtg8shMlmflfBbXsSsXUYN7asEi?=
 =?us-ascii?Q?xdXG1XMSQnZRKNfZpR0fblOw96qP6K6mgJI8uJiX?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1c46e9d-8789-4772-7bb6-08dc9a5898e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2024 05:34:09.2667 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UH0SYoVaXFjyDRM8BGroVpuds08FHDSqX1m4hToBnwqAtBR6GiDtW+vdT2FO9brduKyfH3ZURDIb9Oi2qYXta+lxEoGEyR2pkqNi4+WLQ+I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7580
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
> From: Roper, Matthew D <matthew.d.roper@intel.com>
> Sent: Thursday, May 30, 2024 1:33 AM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [PATCH] drm/xe/xe2lpm: Add Wa_15015404425
>=20
> On Tue, May 28, 2024 at 11:39:09PM -0700, Upadhyay, Tejas wrote:
> >
> >
> > > -----Original Message-----
> > > From: Roper, Matthew D <matthew.d.roper@intel.com>
> > > Sent: Wednesday, May 29, 2024 4:34 AM
> > > To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> > > Cc: intel-xe@lists.freedesktop.org
> > > Subject: Re: [PATCH] drm/xe/xe2lpm: Add Wa_15015404425
> > >
> > > On Fri, May 24, 2024 at 12:02:28PM +0530, Tejas Upadhyay wrote:
> > > > Wa_15015404425 applies to xe2_lpm all steppings
> > > >
> > > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/regs/xe_regs.h |  1 +
> > > >  drivers/gpu/drm/xe/xe_mmio.c      | 18 ++++++++++++++++++
> > > >  2 files changed, 19 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h
> > > > b/drivers/gpu/drm/xe/regs/xe_regs.h
> > > > index 722fb6dbb72e..07c8a23bd7c2 100644
> > > > --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> > > > +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> > > > @@ -42,6 +42,7 @@
> > > >  #define STOLEN_RESERVED
> 	XE_REG(0x1082c0)
> > > >  #define   WOPCM_SIZE_MASK			REG_GENMASK64(9,
> > > 7)
> > > >
> > > > +#define MEDIA_DUMMY_REG
> > > 	XE_REG(0x138000)
> > >
> > > The workaround description recommended using 0x130030 as the target
> > > offset.  Is there a reason you're using 0x138000 (which is a real
> > > RP_STATE_CAP register that you'll probably be clobbering if you write=
 to
> it)?
> >
> > Yes, I missed it, while solving checkpatch erros. I will add correct ad=
dress
> back.
> >
> > >
> > > >  #define MTL_RP_STATE_CAP			XE_REG(0x138000)
> > > >
> > > >  #define MTL_GT_RPE_FREQUENCY
> 	XE_REG(0x13800c)
> > > > diff --git a/drivers/gpu/drm/xe/xe_mmio.c
> > > > b/drivers/gpu/drm/xe/xe_mmio.c index ff7a7cf99530..e1dc87078387
> > > 100644
> > > > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > > > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > > > @@ -450,6 +450,21 @@ int xe_mmio_init(struct xe_device *xe)
> > > >  	return devm_add_action_or_reset(xe->drm.dev, mmio_fini, xe);  }
> > > >
> > > > +static void mmio_flush_pending_writes(struct xe_gt *gt) {
> > > > +	struct xe_device *xe =3D gt_to_xe(gt);
> > > > +
> > > > +	if (!(xe->info.platform =3D=3D XE_LUNARLAKE))
> > > > +		return;
> > >
> > > This workaround is a bit strange; it's tagged as only applying to
> > > Xe2_LPM, but the description indicates that it actually lies within
> > > the SoC fabric.  Our usual graphics/media workaround database
> > > doesn't always capture SoC workarounds very well...have you
> > > confirmed that this applies to all SoC steppings (which is different =
from the
> graphics/media steppings)?
> > >
> > > > +
> > > > +	if (xe_gt_is_media_type(gt) &&  MEDIA_VER(xe) =3D=3D 20) {
> > >
> > > The description also notes that we need to apply this workaround
> > > before issuing a "read to Gfx GTTMMADR BAR."  So even though this is
> > > tagged as Xe2_LPM (probably because they didn't have a good way to
> > > express SoC details in our usual workaround database), it sounds
> > > like this workaround is probably needed for any reads through the
> > > PCI BAR, not just the ones targetting media offsets.  In fact from
> > > the description it sounds like it would also probably apply to any
> > > reads of the GSM through the GTTMMADR BAR as well, not just the
> registers.
> >
> > Details suggests "These dummy writes are not needed for PCI CFG space
> > access (those are always NP). ". Also by the way we apply it in all
>=20
> PCI CFG space is the kind of stuff you see when you run lspci.  Anything =
that's
> inside a BAR (i.e., either registers or GGTT entries if we're talking abo=
ut BAR0)
> isn't considered part of the config space.
>=20
> > reads which are 32bit, its just that we check here media version 2000
> > is present on SoC. As per my understanding we don't need this WA if
> > media 2000 is not present. Should we correct this understanding?
>=20
> I think we should probably confirm directly with the hardware team.  The
> workaround database that we look at for 99% of the stuff in our driver is
> really specific to graphics/media issues.  In cases where there are issue=
s
> outside the graphics/media itself (e.g., in the SoC) that happen to impac=
t the
> operation of graphics/media, the handling and tracking of those can be a =
bit
> inconsistent so it's best to double check offline as to exactly what the =
scope
> and limits of the workaround need to be.  It might turn out to be somethi=
ng
> like "any media stepping can be impacted, but only if the SoC stepping is=
 in
> the range [X, Y)."  And since the text refers to BAR access (and doesn't =
seem
> to actually be specific to media), it seems like the fact that this is on=
ly marked
> as Xe2_LPM might be a mistake.  Definitely good to double check.

I got response from hardware team as follows :
" This WA applies to ANY CPU read to GFx MMIO (GTTMMADR BAR).  It applies n=
ot just on driver load, it applies throughout driver execution - e.g. ANY T=
IME code running on the CPU (e.g. driver) wants to do a CPU initiated MMIO =
read of registers in the gfx MMIO BAR toward ANY offset (Gunit, Display, Me=
dia, GT, Punit mailbox...), it should first do 4 dummy writes to ensure tha=
t any prior real write issued by the CPU is properly ordered/flushed out of=
 the C2C unit and thus ordered ahead of the real read that driver is about =
to issue.   Technically it would only be required to do the dummy writes if=
 there was a possibility of a prior write that had not already been fenced =
before... but implementing that optimization is probably more trouble than =
it is worth."

So I think I would need to remove media check, just a platform check should=
 suffice to apply WA in all reads. Any comments?

>=20
> >
> > >
> > > > +		int itr =3D 4;
> > > > +		/* 4 dummy writes */
> > > > +		while (itr--)
> > > > +			xe_mmio_write32(gt, MEDIA_DUMMY_REG, 0);
> > > > +	}
> > > > +}
> > > > +
> > > >  u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)  {
> > > >  	struct xe_tile *tile =3D gt_to_tile(gt); @@ -479,6 +494,9 @@ u32
> > > > xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
> > > >  	struct xe_tile *tile =3D gt_to_tile(gt);
> > > >  	u32 addr =3D xe_mmio_adjusted_addr(gt, reg.addr);
> > > >
> > > > +	/* Wa_15015404425 */
> > > > +	mmio_flush_pending_writes(gt);
> > >
> > > There aren't a whole lot of them, but technically 8-bit and 16-bit
> > > reads probably need this workaround as well.
> >
> > Ok, I will double check this. I noted this, but I thought it will not b=
e right
> thing to write32 inside read8 and read16, isn't it?
>=20
> It sounds like the goal of this workaround is to flush through any previo=
us PCI
> writes by performing additional dummy writes before a read happens.  In
> that case, I don't think the size of the read 8/16/32 really matters.
>=20
> Although I do wonder if we'll need to perform some synchronization to
> handle cases where multiple threads are performing MMIO access at the
> same time.  i915 had an 'uncore lock' that prevented concurrent access, b=
ut
> Xe doesn't have anything like that, so is it going to cause a problem if =
we have
> a situation like this after implementing the workaround?
>=20
>         Thread 1        Thread 2
>         =3D=3D=3D=3D=3D=3D=3D=3D        =3D=3D=3D=3D=3D=3D=3D=3D
>         Dummy Write 1
>         Dummy Write 2
>         Dummy Write 3
>                         Real Write
>         Dummy Write 4
>         Real Read
>=20
> I.e., do we need to make sure the sequence of dummy writes and its
> following read are uninterrupted by other threads?

Discussing with HW team, if we need such sync. Will keep updated.

Thanks,
Tejas=20
>=20
>=20
> Matt
>=20
> >
> > Thanks,
> > Tejas
> > >
> > >
> > > Matt
> > >
> > > > +
> > > >  	return readl((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) +
> > > > addr);  }
> > > >
> > > > --
> > > > 2.25.1
> > > >
> > >
> > > --
> > > Matt Roper
> > > Graphics Software Engineer
> > > Linux GPU Platform Enablement
> > > Intel Corporation
>=20
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation

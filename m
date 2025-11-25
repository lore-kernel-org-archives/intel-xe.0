Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E14D0E6C7
	for <intel-xe@archiver.kernel.org>; Tue, 25 Nov 2025 11:20:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD69F10E3B6;
	Tue, 25 Nov 2025 11:20:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ekEpDRSH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7451B10E3B6
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Nov 2025 11:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764069612; x=1795605612;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UJGY6qUxqX2SkZ/Qn3PbKL/Ux+J2EHfALlfB1J9HPC0=;
 b=ekEpDRSHt8t5f/cF9u7NbinEmRsrjbXXEaDL5gfaPZ6sd5pGOYQ80mON
 MuuOUeH7xruSvYgMT+qae1cnQCZxUVfey4Q9J7mACbSHDTjdOXg2n+lJh
 WtxJ7VE1i/7NUb2ZFzfVLsWmLPu1Z5RiEEkspmFzp5deM9Q3rrwe/PFLT
 Kw/3Ba59AnaYXfT8t6X36abVcq/KiS/UXOUlUu/6CaOjnHb/1pnTp4Lh1
 y7EVPBZfOvdCcCQb2ZNZwzv1+iqK7zYOPgcRyzwDXrMzwqr3nyOZoSS67
 XDITYuurfEyMANGoTOpX9DRrWUb2r0oO8irZwjYFFRHqM2msrbE71OaGW g==;
X-CSE-ConnectionGUID: ldN6wXzvRDeGBwWZgGI7Qg==
X-CSE-MsgGUID: AEjmZ6XmQB+lvEbcZYtyZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="65268929"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="65268929"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 03:20:12 -0800
X-CSE-ConnectionGUID: +GU3hAo3QfaL/BwgW4PT9A==
X-CSE-MsgGUID: PYtCDd27TwK+rMmuQgO76g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="193044107"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 03:20:12 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 03:20:11 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 25 Nov 2025 03:20:11 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.1) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 03:20:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x7KmkczTna9q1nTJZCxly/lJhxfE99mSI4t1Flkp3Pke8LE0TE2+KOyke06HLhL4yjW5GAdALWo37FpI7sTt6jKlCeA684OQCN4Rkp9xTc8xb8ukhR5nwsLO8DhMKLAQiMhG74ucfmAzkLOEwfyonh8NegULjhTlDSfbEuvip7H+TSmjb17ONSjyT6Tkrs7dvsCxGOtYydX/AB45bIAkutSpz6jf+WXc/bNQuKJmBUWlmwdCU6kk43rVgTPWDdnFqpX+3ctGQny7XhwhSw4BzEO07Znx0ePke6vEe/npA3dFVTAMECGwTMEadPo+lFUuphNpsbiFLP5xQITaJVuMHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lurDP6L4KSuI/8TpO4Ug9HgS34FwrWhga2Mi9EEuVzs=;
 b=VwKnugscwWq5Y1uEBUo8Yy1JDDyRJgKhObu7TEiK2F+AEctcR2npSHHj6FFj1lhL8JDSz27QU4SQ1WoKvvB0CnxyC+ljz1/DYL11ZhnQM27uLi1z6yYFvptMdpb4dapJbHo/s2TESwMFi0EpjG0M8XPiEDNkem9LjK5tcfDeYdv5NnFpQEF+8r0C6lsFjItT+e+F7dUFUCCP1KNutHhtQEyQUIMMIXD6zyGh+bAqGyNOQNjOft/tiLOcQ+VgyJPXBRFE/v6oxiU0zqVKar/KKKI+uJxMcRcZIwlmwCWUmmgyxm5FpUB7+kmIfJAuMmKB7jhArw39GwAHc8diBc5kNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8839.namprd11.prod.outlook.com (2603:10b6:806:467::17)
 by IA4PR11MB9371.namprd11.prod.outlook.com (2603:10b6:208:56a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 11:20:09 +0000
Received: from SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::ce6c:3c7f:92ef:1394]) by SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::ce6c:3c7f:92ef:1394%5]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 11:20:09 +0000
From: "Nguyen, Brian3" <brian3.nguyen@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>, "Summers, Stuart" <stuart.summers@intel.com>
Subject: RE: [PATCH 07/11] drm/xe: Suballocate BO for page reclaim
Thread-Topic: [PATCH 07/11] drm/xe: Suballocate BO for page reclaim
Thread-Index: AQHcWGqc3yhQEYycfE+gLXfNC7dQJ7T/H36AgANfTjA=
Date: Tue, 25 Nov 2025 11:20:09 +0000
Message-ID: <SA1PR11MB883920AF23102AE1211C034DAAD1A@SA1PR11MB8839.namprd11.prod.outlook.com>
References: <20251118090552.246243-1-brian3.nguyen@intel.com>
 <20251118090552.246243-8-brian3.nguyen@intel.com>
 <aSISMU58l2MPAFcd@lstrano-desk.jf.intel.com>
In-Reply-To: <aSISMU58l2MPAFcd@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8839:EE_|IA4PR11MB9371:EE_
x-ms-office365-filtering-correlation-id: 14f69e13-46cb-47b0-5e15-08de2c1497db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|10070799003|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?HVSQZy1Yq0FSD78SXNrYNJ0uJX75vR44qVzPyOD6J5/RjAk8/zUtsWZRYYiS?=
 =?us-ascii?Q?zVNaHtxsLo7YTbS0RcsynSU5Idlrqw5/LftoSXb6esRFY5N17qjJEITBfynH?=
 =?us-ascii?Q?GzgxXPTs61Y1noE3NAeKJhdInlk8u03i/WJlR8EuE0HKAf+gcPA/5TYKE4yF?=
 =?us-ascii?Q?TLQiDga76BHpBoR/+2CUVkiU5RY9Mh+LlDY7wMwIlCWOzKRc4/jMa8wJvCMX?=
 =?us-ascii?Q?z6NcZsLlMz3kD38g26E/ihjxNZODxT4UScMNORkCsEUM+c/RftX3t02pSU4F?=
 =?us-ascii?Q?q/x7ejl8zxQPzTJsmXm+rQbOKLlO6XGktsU3ZiSQHILmfjcfX3i57l10nCX1?=
 =?us-ascii?Q?CgjUoWBEUpRsujWRJ0MDlKnpO4IbMWnFYHMEbZGHtM9anKBBbVth7ve98Ndh?=
 =?us-ascii?Q?Eds/MbXJB1xYp9uOLydvpxXfT3ArGO8FG2koqrh//ohhafFnyMaoqd0+OiiC?=
 =?us-ascii?Q?XHPF/Tv8mHHadqLV/6TVVyEHczn4IxARCNxL0jTN4tiU3zirGCsJKH+QHR9f?=
 =?us-ascii?Q?59hkvVAqO1213T7n+5HZVzggWCvBVFec7Ctl8SyTqV3mGyh6XvESCKJc2Pne?=
 =?us-ascii?Q?lcHhDfqgiyZa2T7duZoCUxdhgO7+2Z68ArbYX0kvD1snXNhP4HY0C8mHA6hV?=
 =?us-ascii?Q?h4uT4GAu5RIiKom85lRVPTNH3J0dqv2Q3mV5oRshvwzOd83WuzzcorSVJZtB?=
 =?us-ascii?Q?BjJhp/fmDaFMm8+q7pbV/tJPFMPqsPUD44007B2qvUyMo57/ClnoOtHb7KqE?=
 =?us-ascii?Q?FCinkDCX2ltXIeryUDmUU3GsodKfWarOpETs4JNlfnSG9On43r81OGGbRi6A?=
 =?us-ascii?Q?zSAaCbzGgKRyK0PyuOwQVcQHsdFlc0vm4+8fupRn8jLqJO4lMbk0Ow1I37k1?=
 =?us-ascii?Q?Xlr4CR3KklbBV2V9zMFIDKEey3iIQok5eytikj0HaW3o/pImZiPqQqcydPDY?=
 =?us-ascii?Q?HoGkJpDUqbsv/zBbetNmewoxQ0SkWYddsbNCDFBsfkrfkbJNiFpqqYp4u7vt?=
 =?us-ascii?Q?OAT5eCpq5Qstn1MYoHK9c7MMzt962mboVB8D38Fu3XmbnmZwjZSRjlBIsfmP?=
 =?us-ascii?Q?w8Mpf02u6nR9e6v2azpgvuKQ4mgvf8KAXlQRn4sO5yK321HNONo/QDCumfGt?=
 =?us-ascii?Q?Sg++XGWUChI46cyxTtJrPOyZ76y410oXRQ3jH8SORvTWUtK73g6qrZbrk7UE?=
 =?us-ascii?Q?Te8xhWYVCoQSy8YBXEDjDHySmAN0Pf0P1aMuJ0waDQHFtvBX+EHG3peHNrTl?=
 =?us-ascii?Q?tgtMNIBdAfrafH0YFveO36L2TvBwu0p4k05YnYYHqSz/isziXo2v6Qr43ijo?=
 =?us-ascii?Q?x1d+aG8jJD7wwfY1drMv6uF1FVB4Mupj2hdfm1NGmHpGxQ+KhkU2wQHMF12i?=
 =?us-ascii?Q?mdbi4J5Xsb0rfIl3ar4ZAvzksK2CABtAaH8sEFYn18aPpu9jazK64eQbXkJK?=
 =?us-ascii?Q?UeohcD83ryMjEOMD+l0QWu+xQzskte1xRjfaz4dBh/6URD2aVjLQ3g=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8839.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(10070799003)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?T4nym15jlp8Ce3jbejYNm2r5PPtNpQY5y+Hf1hu1l9f80BGD3G1jI49HvBQw?=
 =?us-ascii?Q?PL934Di48k5+n927cJXx+vC6JBIvu5nUjdoLnJWuRQwuNh0IDuiwxb9GdZrw?=
 =?us-ascii?Q?G6P0Md66Z616gSqO96KWlEma3rK4rCM75maH7x2U+HRzWTjR3UvsW5THcjhD?=
 =?us-ascii?Q?Zj9cRthE3q10vya1DcyjQMukWB57ztyQNudjgFxYVhX28Zk2wtfd4U3OtQlq?=
 =?us-ascii?Q?25DX+dC0/5XzAxl7DEFH/6XwvPqBkj/g7V6b57J1cZZRrDkQB7+qhOzC7Ai2?=
 =?us-ascii?Q?DJ4W8vUqrZx0yQR22JTHzWGRzSjciidUbZDZqKpe4BO4wPipVAJjgYeGLS45?=
 =?us-ascii?Q?30PlbAwweMxKNXbcPxf+/rb9VQp1Nacll/1RzOJfIvv/fbDpC6mfTxWYPTD5?=
 =?us-ascii?Q?/3gcYqnCyFInP3qz58yAdQ4JRAMJU7pcEy1SOqPmawU1GhqSTg8vTevXb1mr?=
 =?us-ascii?Q?XBJRcPUlKPvwyETkgbKd7/+8MgYJ0oe8ABCcpy0n04zBNpyP4n2u2CyEseW1?=
 =?us-ascii?Q?p7G1wE20YMz1v7n+qIKstv98mRtwdBOJR7qP5Frmq95FaS6LHXwv18Pw0I0w?=
 =?us-ascii?Q?9Ig8lJMfoj1d2dO4RhZS6f2O3MAgG4PmqTj1sB4ErtsdD+hFtrpAVtLHS8GD?=
 =?us-ascii?Q?Xf+lV2i+jLYG9bAupjCCDp8j82xnLlY4nWcRxQM6bunGp57JsY/tvCpvxL7M?=
 =?us-ascii?Q?dwruAXPO+FBLKSw9c6l2FAgNZMIy6EnIlTqSZGAQkJvj5Euxm2Bs6GmaV5pX?=
 =?us-ascii?Q?isxbrUGLgSP1WyZIiJ3iuoCKMK4SpOla3kyudQZQmoqeuvnBqWotj5G6qqeM?=
 =?us-ascii?Q?VXcSulf08UnBKvWldlze4ZAEccvJiBWct9Px9I114xhDGfij6QK3cqN2cD8J?=
 =?us-ascii?Q?nsENx/KqM7b/FlVZrF73JWUyt727naHcLsPR5EWR4oz++DSM4xPqXMuI2ivR?=
 =?us-ascii?Q?wh9Vf9FnSBbfpq9RSJRse66pA+tWOwVQezI5NgGpPjDa/CNhl/HK2nTCzYxe?=
 =?us-ascii?Q?CIoG+GOFjNhA4pEsxF+DwbjUvSBCt+2l5m2c/h/67/g/J5WWxQNA9Mff5ehV?=
 =?us-ascii?Q?spaAaCaxdiqPEbj4XunOzIWYvA/i/t9hMnPLFngChgp/R1ggczlEofs5qM4B?=
 =?us-ascii?Q?n0lAQQee4eGA6bhm/r06Virzpd0JYwCdwE5tl3uSsGSRYwkNrxd7OYAj79wa?=
 =?us-ascii?Q?Q7F8gfgvBglaw1mWyQ5tyR8FP9tv+vuPvLtw5Wvz15nGY0BMdvQAdt5h5VJh?=
 =?us-ascii?Q?TZpodMDH2XIVa6SD3LStoSQGMH8+ZWYW8IFEgcdE3Fz+TvYmdzpVGsIP1mbI?=
 =?us-ascii?Q?6+nfqgKgXDo5XNd+Y4U6GMIwmKJGSLSe+rGsQWS/IkCvf8YmsGRZFLIKtCFz?=
 =?us-ascii?Q?rWcuAf69ilcFvZTLA42/uEIGRPVTMhYQZJJ3BBQ7s11WKVFS1kCpkVLM3oAH?=
 =?us-ascii?Q?z9beIvdVRLND8Vw1wHl/d1JB0yLcTmb6hY4plTGv5KHIryN20YkgUJY18rel?=
 =?us-ascii?Q?GbUF0u29h2ZJoJGtf4PBaj1c1mHZcMB68JYc2pqPsCJlEywS5iTqMW6FjUdN?=
 =?us-ascii?Q?TqAR/yIi1elzAIwbUYXq4GistGB2NaxZmwpb12zP3MLy5GIlP/OpmUFg/RiE?=
 =?us-ascii?Q?+lOu2UdTrqBBovZKW368cmPUv/vP/12qvHUnIMyQMkeZ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8839.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14f69e13-46cb-47b0-5e15-08de2c1497db
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2025 11:20:09.1721 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RFBDfD8vJOHNbDI4JMgILMZGMPx2ZO37rhVXxTLqhgeAF+s+Trb4bTaSjm1D7/GsrNk2+rFES3NG2JY9dKf9Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9371
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

On Saturday, November 22, 2025 11:43 AM, Matthew Brost wrote:
> On Tue, Nov 18, 2025 at 05:05:48PM +0800, Brian Nguyen wrote:
> > Page reclamation feature needs the PRL to be suballocated into a
> > GGTT-mapped BO. On allocation failure, fallback to default tlb
> > invalidation with full PPC flush.
> >
> > PRL's BO allocation is managed in separate pool to ensure 4K alignment
> > for proper GGTT address.
> >
> > With BO, pass into TLB invalidation backend and modify fence to
> > accomadate accordingly.
> >
> > Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> > Suggested-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device_types.h    |  7 ++++++
> >  drivers/gpu/drm/xe/xe_page_reclaim.c    | 33 +++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_page_reclaim.h    |  4 +++
> >  drivers/gpu/drm/xe/xe_tile.c            |  5 ++++
> >  drivers/gpu/drm/xe/xe_tlb_inval.c       | 18 ++++++++++++--
> >  drivers/gpu/drm/xe/xe_tlb_inval_types.h |  5 ++++
> >  6 files changed, 70 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> > b/drivers/gpu/drm/xe/xe_device_types.h
> > index 268c8e28601a..057df3f9dc1d 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -184,6 +184,13 @@ struct xe_tile {
> >  		 * Media GT shares a pool with its primary GT.
> >  		 */
> >  		struct xe_sa_manager *kernel_bb_pool;
> > +
> > +		/**
> > +		 * @mem.reclaim_pool: Pool for PRLs allocated.
> > +		 *
> > +		 * Only main GT has page reclaim list allocations.
> > +		 */
> > +		struct xe_sa_manager *reclaim_pool;
> >  	} mem;
> >
> >  	/** @sriov: tile level virtualization data */ diff --git
> > a/drivers/gpu/drm/xe/xe_page_reclaim.c
> > b/drivers/gpu/drm/xe/xe_page_reclaim.c
> > index a0d15efff58c..801a7f1731c0 100644
> > --- a/drivers/gpu/drm/xe/xe_page_reclaim.c
> > +++ b/drivers/gpu/drm/xe/xe_page_reclaim.c
> > @@ -13,6 +13,39 @@
> >  #include "regs/xe_gt_regs.h"
> >  #include "xe_assert.h"
> >  #include "xe_macros.h"
> > +#include "xe_sa.h"
> > +#include "xe_tlb_inval_types.h"
> > +
> > +/**
> > + * xe_page_reclaim_create_prl_bo() - Back a PRL with a suballocated
> > +GGTT BO
> > + * @tlb_inval: TLB invalidation frontend associated with the request
> > + * @fence: Fence carrying the PRL metadata
> > + *
> > + * Suballocates a 4K BO out of the tile reclaim pool, copies the PRL
> > +CPU
> > + * copy into the BO and queues the buffer for release when @fence sign=
als.
> > + *
> > + * Return: 0 on success or -ENOMEM if the suballocation fails.
> > + */
> > +int xe_page_reclaim_create_prl_bo(struct xe_tlb_inval *tlb_inval,
> > +struct xe_tlb_inval_fence *fence)
>=20
> As discussed here [1] let's try to avoid storing anything in related to P=
RL in "struct
> xe_tlb_inval_fence". So I think reclaim_entries + number entries should b=
e
> argumen to this function and return "struct
> drm_subaloc*) or ERR_PTR here.
>=20
> [1] https://patchwork.freedesktop.org/patch/689042/?series=3D157698&rev=
=3D1#comment_1267062
>=20

Got it. Will remove the PRL from the tlb fence and adjust funcs accordingly=
.

> > +{
> > +	struct xe_gt *gt =3D container_of(tlb_inval, struct xe_gt, tlb_inval)=
;
> > +	struct xe_tile *tile =3D gt_to_tile(gt);
> > +
> > +	/* Maximum size of PRL is 1 4K-page */
> > +	fence->prl_sa =3D __xe_sa_bo_new(tile->mem.reclaim_pool,
> > +				       XE_PAGE_RECLAIM_LIST_MAX_SIZE,
> GFP_ATOMIC);
>=20
> Any reason we can't pass in the number of entries for better suballocatio=
n? Or
> does PRL in GuC interface need to be page aligned?
>=20

Looked at the spec again and for PRL, a full zeroed out page_reclaim_entry
is enough to indicate the end of the list, so I will adjust to a (num_entri=
es + 1)
allocation.

PRL in GuC interface requires address to be 4K aligned, but I believe that =
will
be taken care of by the bo manager of reclaim_pool.

> > +	if (IS_ERR(fence->prl_sa))
> > +		return -ENOMEM;
> > +
> > +	memcpy(xe_sa_bo_cpu_addr(fence->prl_sa), fence->reclaim_entries,
> > +	       XE_PAGE_RECLAIM_LIST_MAX_SIZE);
>=20
> If we had the number of entries we could save a few instructions on the m=
emory
> copy too.
>=20

Agreed, updating now to the same (num_entries + 1) change.

> > +	xe_sa_bo_flush_write(fence->prl_sa);
> > +
> > +	/* Queue up sa_bo_free on fence signal */
> > +	xe_sa_bo_free(fence->prl_sa, &fence->base);
> > +
> > +	return 0;
> > +}
> >
> >  /**
> >   * xe_page_reclaim_list_invalidate() - Mark a PRL as invalid diff
> > --git a/drivers/gpu/drm/xe/xe_page_reclaim.h
> > b/drivers/gpu/drm/xe/xe_page_reclaim.h
> > index d066d7d97f79..f82b4d0865e0 100644
> > --- a/drivers/gpu/drm/xe/xe_page_reclaim.h
> > +++ b/drivers/gpu/drm/xe/xe_page_reclaim.h
> > @@ -15,6 +15,9 @@
> >  #define XE_PAGE_RECLAIM_MAX_ENTRIES	512
> >  #define XE_PAGE_RECLAIM_LIST_MAX_SIZE	SZ_4K
> >
> > +struct xe_tlb_inval;
> > +struct xe_tlb_inval_fence;
> > +
> >  struct xe_guc_page_reclaim_entry {
> >  	u32 valid:1;
> >  	u32 reclamation_size:6;
> > @@ -32,6 +35,7 @@ struct xe_page_reclaim_list {
> >  #define XE_PAGE_RECLAIM_INVALID_LIST	-1
> >  };
> >
> > +int xe_page_reclaim_create_prl_bo(struct xe_tlb_inval *tlb_inval,
> > +struct xe_tlb_inval_fence *fence);
> >  void xe_page_reclaim_list_invalidate(struct xe_page_reclaim_list
> > *prl);  int xe_page_reclaim_list_alloc_entries(struct
> > xe_page_reclaim_list *prl);  static inline void
> > xe_page_reclaim_entries_get(struct xe_guc_page_reclaim_entry *entries)
> > diff --git a/drivers/gpu/drm/xe/xe_tile.c
> > b/drivers/gpu/drm/xe/xe_tile.c index 4f4f9a5c43af..63c060c2ea5c 100644
> > --- a/drivers/gpu/drm/xe/xe_tile.c
> > +++ b/drivers/gpu/drm/xe/xe_tile.c
> > @@ -209,6 +209,11 @@ int xe_tile_init(struct xe_tile *tile)
> >  	if (IS_ERR(tile->mem.kernel_bb_pool))
> >  		return PTR_ERR(tile->mem.kernel_bb_pool);
> >
> > +	/* Optimistically anticipate at most 256 TLB fences with PRL */
> > +	tile->mem.reclaim_pool =3D xe_sa_bo_manager_init(tile, SZ_1M, XE_PAGE=
_RECLAIM_LIST_MAX_SIZE);
> > +	if (IS_ERR(tile->mem.reclaim_pool))
> > +		return PTR_ERR(tile->mem.reclaim_pool);
> > +
> >  	return 0;
> >  }
> >  void xe_tile_migrate_wait(struct xe_tile *tile) diff --git
> > a/drivers/gpu/drm/xe/xe_tlb_inval.c
> > b/drivers/gpu/drm/xe/xe_tlb_inval.c
> > index de275759743c..67a047521165 100644
> > --- a/drivers/gpu/drm/xe/xe_tlb_inval.c
> > +++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
> > @@ -15,6 +15,7 @@
> >  #include "xe_guc_ct.h"
> >  #include "xe_guc_tlb_inval.h"
> >  #include "xe_mmio.h"
> > +#include "xe_page_reclaim.h"
> >  #include "xe_pm.h"
> >  #include "xe_tlb_inval.h"
> >  #include "xe_trace.h"
> > @@ -326,8 +327,19 @@ int xe_tlb_inval_range(struct xe_tlb_inval *tlb_in=
val,
> >  		       struct xe_tlb_inval_fence *fence, u64 start, u64 end,
> >  		       u32 asid, bool flush_cache)
> >  {
> > -	return xe_tlb_inval_issue(tlb_inval, fence, tlb_inval->ops->ppgtt,
> > -				  start, end, asid, flush_cache);
> > +	int err;
> > +
> > +	if (fence->reclaim_entries) {
> > +		err =3D xe_page_reclaim_create_prl_bo(tlb_inval, fence);
> > +		if (err) {
> > +			flush_cache =3D true;
> > +			fence->prl_sa =3D NULL;
> > +		}
> > +	}
>=20
> Should we do the above step in run_job of the TLB invalidation job? I thi=
nk that
> might be cleaner wrt to layering and make it clear only TLB invalidation =
jobs can
> use PRL. I don't see an easy way to implement non-job based TLB invalidat=
ions
> with a PRL as those are typically in the path of reclaim (no memory alloc=
ations).
>=20

Sure! I was previously considering other TLB invalidation flows but it does=
 seem
like only the tlb_inval_jobs will make use of this feature. I'll move the P=
RL
allocations to the tlb_inval_job related functions.

> > +	err =3D xe_tlb_inval_issue(tlb_inval, fence, tlb_inval->ops->ppgtt,
> > +				 start, end, asid, flush_cache);
> > +
> > +	return err;
> >  }
> >
> >  /**
> > @@ -461,4 +473,6 @@ void xe_tlb_inval_fence_init(struct xe_tlb_inval *t=
lb_inval,
> >  		dma_fence_get(&fence->base);
> >  	fence->tlb_inval =3D tlb_inval;
> >  	fence->flush_cache =3D true;
> > +	fence->reclaim_entries =3D NULL;
> > +	fence->prl_sa =3D NULL;
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> > b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> > index c3c3943fb07e..7cf741e6a0c7 100644
> > --- a/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> > +++ b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> > @@ -9,6 +9,7 @@
> >  #include <linux/workqueue.h>
> >  #include <linux/dma-fence.h>
> >
> > +struct xe_guc_page_reclaim_entry;
> >  struct xe_tlb_inval;
> >
> >  /** struct xe_tlb_inval_ops - TLB invalidation ops (backend) */ @@
> > -129,6 +130,10 @@ struct xe_tlb_inval_fence {
> >  	ktime_t inval_time;
> >  	/** @flush_cache: bool for PPC flush, default is true */
> >  	bool flush_cache;
> > +	/** @reclaim_entries: list of pages to reclaim */
> > +	struct xe_guc_page_reclaim_entry *reclaim_entries;
> > +	/** @prl_sa: BO allocation for page reclaim list */
> > +	struct drm_suballoc *prl_sa;
>=20
> Again, let's try to hard move all of these things out the fence (store th=
em in the
> job if needed).
>=20
> Matt
>=20

Got it, as stated in above reply, I'll remove these modifications to the fe=
nce, and
continue accordingly.

Brian

> >  };
> >
> >  #endif
> > --
> > 2.51.2
> >

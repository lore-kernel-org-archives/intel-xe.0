Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D928C5AD49
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 09:16:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3699A10E5BD;
	Wed, 28 May 2025 09:16:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Av+bTLjt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB6F110E5A4
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 09:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748423777; x=1779959777;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MW5FRKvZ109zJ3tlRgkvXmfSNoLVX/MRnE1+PVZqygs=;
 b=Av+bTLjtbNs/AX0g3OrlrzASPqPwPor04sQF+ic3ylab+7J4i26PLxUS
 pk704nttoHrJgcqCoPv+FSJ6iQy5KphS/Rl7duyNfpud+UVe7bySICizX
 HeQVueNkFItr8rxJVN06KYhl0/6vU5qZ9j7whB+Ly/IRXhIK6dxavgZfD
 nIXch7rnbuKJXt1hxbJdBaiaCmo8DWD1sI7u8q4VrNTA2C5qzoL0vg8ei
 qWgkUr2yit5le/ImTzIzNcUeoGmTgdauBeV13/lSs0LatICrb6Syxk+fv
 r8ZV7o3hkqQGTurrlQZ83XIKZmDhzPoiWqqfZ9wvKqLsoAqiK5F33qrpg A==;
X-CSE-ConnectionGUID: QOoQOxVcQBqeKW8c3LB5lg==
X-CSE-MsgGUID: qe0MCUOmTfKxecZJ4IFkiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="49688776"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="49688776"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 02:16:16 -0700
X-CSE-ConnectionGUID: bsEx3FzyQnqrWqYlAnVl2g==
X-CSE-MsgGUID: oehHRo0BRMSwlctBTLpikQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="143527859"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 02:16:16 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 02:16:15 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 02:16:15 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.43)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 02:16:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NZvDBw1wANzkquAUiCL4WHZNX0fKSRIaDTNjKLdLF8d7Mphkf/NMUrdWFNY6Tdq5TJAhll/RULSAGnLLZtgOW2JwzIG8Jx9n4Mc9WoKIFfcTrNJFR1cd4qSo3ag8ifnsdp3Zv1KG8vPAjl5vOGXVfi3MVdx0ecCyLdYdmMTk0sfzuHp8Etv+6XL9WI4QWJbKZaKW73R7i+dQbMpuzkTc6mMFj7ozKbXpEFwTnvGQ+q3IZRn+Pf985m+tkehONgwTy2/h0PCc1+WpAXB0vJ7/Yjfx6vnWqEvROfsqiRyPQ/9WKYxglDOpmJ0xXrk2wi2W1jxRIXURCprTk25t5BFOwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IlbtchT9C1eSBn7FfafDTZyyUeflXWzShqpSC59RUOE=;
 b=ym079GDWcY0q5y/oOkw64uo3cI142FJCSUIDXUmv+4y/xk9fxRz44iL11Vp4tK41hNpn0VWkkE8Nye+UCvH32dzviaTGvBOlBPBf31P9fYcmSOdTBPA++s1J/VWHMbbs4JOULu4gL+PBpZjkxOcpIPaKUuB2y6AuKoOeKtHzfqo4UxbykXjjiOnW4usyc3NIlj3Vqw606VQz5ZsXj7vISH1iu6svhMKS+jIB3U2swrG052gm2CfOM477OF4W3CWX/QEcPPNHZmLPOB+eat/LxvU5kIgcI6HsQv6uEE6T0hBzgYbxR1hXHPMl0mGU8oOWh1gKDBOvbAQe9DBlKIpNSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by PH3PPF6B7063D92.namprd11.prod.outlook.com (2603:10b6:518:1::d2a)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Wed, 28 May
 2025 09:15:58 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%6]) with mapi id 15.20.8769.019; Wed, 28 May 2025
 09:15:57 +0000
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH] drm/xe/guc: Resend potentially lost H2G MMIO request
Thread-Topic: [PATCH] drm/xe/guc: Resend potentially lost H2G MMIO request
Thread-Index: AQHbz68yxNhs3xdRpkOKRr6MPEzxR7PnwqFA
Date: Wed, 28 May 2025 09:15:57 +0000
Message-ID: <LV3PR11MB8695EC1EEC3DED180ADCD4ABF967A@LV3PR11MB8695.namprd11.prod.outlook.com>
References: <20250528090021.329-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250528090021.329-1-michal.wajdeczko@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8695:EE_|PH3PPF6B7063D92:EE_
x-ms-office365-filtering-correlation-id: 671126f0-384f-4809-f0e7-08dd9dc84199
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?mIXFH/JJ+jsAEggrAZDeEmAppIm3EGmeWm0oy0bW2amIqyu9Ui90NoACeReO?=
 =?us-ascii?Q?6JR6lUzj7KCLtHIxW2x1Ll3OWpd9e+C0b5XEwOc4qM7buYypNkuFxuWeYY79?=
 =?us-ascii?Q?+whd9zlelPv06Byb7gI/jeiLb0JYKmkydssvCg++A6PHDpb3lU0WzEIMrB79?=
 =?us-ascii?Q?G9W/dDKqutxlTCFIM5H1hfrfX02KE3P/dKRnD72gDLJYk4u+FrK1yHszqZee?=
 =?us-ascii?Q?zi2gW5U7rRNdRIAj/08UB7GL/EcQ9geRsnR16XGv8SK7pwNhr/5W2EKA8xmj?=
 =?us-ascii?Q?Noyzy96yimeLzBIT9o1HQhGhUTa773Oj236oijiOqdKO+Kgi0PpDH0hzbqSP?=
 =?us-ascii?Q?YDL7WE6pOquYWHh17bViQoHm+PkEiG6evk8W/hYuS0bRkYU5XH19L2YhtzbC?=
 =?us-ascii?Q?XEZuso5AuRRcwI+l1Ps4vE9yMvw0LBoZfOfcpRWLdsuERbJCR2GoUECgJ5QC?=
 =?us-ascii?Q?czAAeo79Nl0zlDhTh0npHDfCWR0c+tAtxblNqUX19zcdK5P0RWn7AkYaJBCK?=
 =?us-ascii?Q?HggRsDxUQwhBDh7zKiTFkMrk8yUO5h5/nEtqIVEoyQblaq8MkRnohgxSqvfJ?=
 =?us-ascii?Q?FwXqI9XcXlRAeQ7MO1BQ7U5YAcVKjIymjb2VaENlOGwfGbuorCC4qO9n0H1Z?=
 =?us-ascii?Q?zgECdJkvZywfqHoYQ3fGErrneaD4hYaJYt4802ZUzfR3DGx1BZmdkZO42JRR?=
 =?us-ascii?Q?tEj9BwzNhChqyKdDKU7KGYnV2yPVvmoZrcQAU1LSFb/rCa+08AwNkUk8SAhz?=
 =?us-ascii?Q?2c0VoFpBnTL+M+DNLl5Xn5pw/btkqn/xfhvfJOVGCMoNiOOPbVr7wM/bfNn5?=
 =?us-ascii?Q?6/UKumEeCkawe3xM68F/Xcixo3YB09BWtNb2Gneleh+D07tOLb7vPk0Dd5ec?=
 =?us-ascii?Q?1xovsO8Sq4fVe09/ZrymKef7I83RrZHFNSROikugOm6NKWW39Y/4hgsDmdEq?=
 =?us-ascii?Q?Bgbr4mYpw9Pd5mGombitcXBrHEFyplgIlo58HCly9+uKWysE85TWc6SpaeqV?=
 =?us-ascii?Q?gFR6GKrFIxvp4ttwtPGSDPl7a0FhiRwh2X0Iw0s6wXpoikge9cAAWy81trlJ?=
 =?us-ascii?Q?N2AvlgioxMQWHeZ3aiMiMwTx6Y0ost2Qpw+zqJyW5JkKHY1BwFRpfX24b4Y0?=
 =?us-ascii?Q?U6pcxtkOHNYd+BJYrh4A45jXVKli7u36182DSj8Tho0ahbnZ86PMTcKjS1IU?=
 =?us-ascii?Q?PZ2YP488X4jo/DD71szRgOQpINhv1MBoOai5H2zWzouyvxiP/cHR6eJnuV0j?=
 =?us-ascii?Q?vwdFySQY0epscYD0qbw0DxJgTN2oU18Cq2NDdx4L3kiH6letvobdR2EDAmtw?=
 =?us-ascii?Q?ExkvZAjAW85uizJcXBNx8RA0wc2CGhLEg2/7/iaB/glN6D9UlOtH9qBE63/a?=
 =?us-ascii?Q?ziqDKzJAJG6v9kLgLHWpHa7ggFvCYhlax1n9JTbpLVt97WuUgr3t/pGQbOqn?=
 =?us-ascii?Q?+9lvwQwAMf5tBUS1oWz/DLBiiOeM/sHp0rmfncZM/CY1om5ql+7w+pnfmjGC?=
 =?us-ascii?Q?9xRVHGUgt1D/o+I=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BiUNn5uJC/Z+UKMJaW8v87Rgg4dT3UY0drbG9pCt5q7ilksJcO9FiGpCF/Go?=
 =?us-ascii?Q?X4oMKx85Z1iaryg9iprVhcaxo3bLa10mSm3ZgycxLCIwCj4CBKfuDJMRZPeL?=
 =?us-ascii?Q?pPYF4KRLQyYzsW5kKsv3zeZsxqJdZtQFX2qE3XQOFGJDUZ9NON14rfq8Wqc6?=
 =?us-ascii?Q?aKIZQGBn/zMGqjCvioQei/76g0eh9fu+xBTghAcg59KS1JXAEJkI8QYWOvYO?=
 =?us-ascii?Q?hgdIilFcjUKf92e/AwNTuMRmTfmSNpY32rGrS102JPt+3mtcdcbwP7tNza90?=
 =?us-ascii?Q?avrEsVTBjLB47ebOS+th/DCGFMT253WctLyk4ZKb77/kX87jlennCDM56p2F?=
 =?us-ascii?Q?EwWaZMQhkBwVKl24C8LwxiQvh5X0gUdmVwTB3o3o0uZOOE0rJIRJTokOnFjp?=
 =?us-ascii?Q?SpTMyxC2z6ZpWDke2ahHv07alflc+CbyozbosZ+znuKZQKe/gBwXxhdXGyq+?=
 =?us-ascii?Q?sukrkAdXKROqCxg9VyoujTBTSzwERlnYqy1evAFtMdK0QrXh0UL3Rqkauw4l?=
 =?us-ascii?Q?YdpSEcGwKpaPCN710zqUS/61IYaYpb3OoL2kMcrcH523zx8EQD7S9suIun6h?=
 =?us-ascii?Q?ToTzTWBUCTHB6+8Vr6CQ0drx3O1zdlWucPQYRQorbJY0LfFMgfazePbhsz8J?=
 =?us-ascii?Q?XHF/8dHdbuX60WgMnuu+ms4+/7N+64bNZ81kAHJ93WO6RKcoUMRRI5lYGhKu?=
 =?us-ascii?Q?0R8oeKsOohdVKMrpLD449OXeIHjlzC2HxwkKMuyU1YGjcsg3R4f8CXsx2S18?=
 =?us-ascii?Q?xwxbEw0QaSQF/+UY46tXIPayYOl5QR8ujJ9RK78+sD+M/iqNbyK7KXrXDh2R?=
 =?us-ascii?Q?3e5WibnazLRW3ODqfn6pnAGjIyqMwL4gS0nWbCjgCBukf4+cHVVNoK1EAeXw?=
 =?us-ascii?Q?9YmyuVrNJx5S5fd6CyLmytXqPQUHeEslZHuwXfwPo/fpzd/4q+76ZeRLFNl/?=
 =?us-ascii?Q?gxtYxF7poK2a/CBoJvo/a3Hsb4/rGNydl49KJ74uUYtm4fVnl+EHunczj8Aq?=
 =?us-ascii?Q?ExtaLviwqxlIJ8oYC8iqdpw+GXl4khRVWAmnlkBNLS7IGmyk6vEzemORBHGl?=
 =?us-ascii?Q?TQnZxfF32Z8gST+NY+vO4s8wL0gaZyY2XcM94MLItozZXfvUHY2YvrwYtTKI?=
 =?us-ascii?Q?yCc615K5WmzEdXzvF6EPs0Fxne/F0Hs64xQPVBC+OSWj4puU3jQNLSv3W7BH?=
 =?us-ascii?Q?cruXMFTGVtCzskQb9OjfyU6PzAoKfhRUW3bErmHKAexirfTYgwUhjyRYWeS5?=
 =?us-ascii?Q?aoNp447J3oHhwXicFTs3HWV88yyqAkHLiZcxrgZQ70DpKIXut4uUfe8CBocb?=
 =?us-ascii?Q?dJ0X13rDsdEe0UsfJWh4eH5FgMqjNb8dy/cXgm2/Zgc7dY7/q1LJ9YCK0aUY?=
 =?us-ascii?Q?WG4R6+s83VK1ZViaZrdrVHG3b8eaAgbq53Dap+6VdnG5MWObYNtCbLCht5kY?=
 =?us-ascii?Q?yv10JQgZ2BunMhux6gmPrlk1RAKt31NjQpn7H/8jjjLnycgXe1iS2N2oTCNg?=
 =?us-ascii?Q?iDTbTM55nbiu55OYQtxJN/f7KikCBs7pKH55T+6rGVRhIZsxWDtp9toNmT+Q?=
 =?us-ascii?Q?GToIsPm7g58hyyxSLKnskiSjN+gQ8GirF3seUNiuAPfqma8l/hKgVQUFoWCX?=
 =?us-ascii?Q?LA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 671126f0-384f-4809-f0e7-08dd9dc84199
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2025 09:15:57.5937 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gn8RhhaAIZHMHXPNjWtvTrhKFnf1qr7Hz/LSLSyePBhMuYme4gKk5BckYC1z77vFTyBbF61P4rZwvNo94EmxAk2ZZTPB06b+/Lj1NhPaHQY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF6B7063D92
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

Hi.
> -----Original Message-----
> From: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>
> Sent: Wednesday, May 28, 2025 2:30 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; K V P, Satyanarayana
> <satyanarayana.k.v.p@intel.com>
> Subject: [PATCH] drm/xe/guc: Resend potentially lost H2G MMIO request
>=20
> There could be a scenario where the VF driver is resuming faster
> than the driver PF is able to complete the VF FLR sequence which
> includes reset of the VF scratch registers.  This may result in
> deletion of the ongoing HXG message (it could be either a host
> request or a GuC response).
>=20
> When we detect that HXG message was likey lost (scratch register
> with HXG header was zeroed) try to send this request once more
> before giving up.
>=20
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 350434a8b953..52453845d1bd 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1289,6 +1289,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc,
> const u32 *request,
>  	struct xe_reg reply_reg =3D xe_gt_is_media_type(gt) ?
>  		MED_VF_SW_FLAG(0) : VF_SW_FLAG(0);
>  	const u32 LAST_INDEX =3D VF_SW_FLAG_COUNT - 1;
> +	bool lost =3D false;
>  	int ret;
>  	int i;
>=20
> @@ -1322,6 +1323,12 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc,
> const u32 *request,
>  			     FIELD_PREP(GUC_HXG_MSG_0_ORIGIN,
> GUC_HXG_ORIGIN_GUC),
>  			     50000, &reply, false);
>  	if (ret) {
> +		/* scratch registers might be cleared during FLR, try once more
> */
> +		if (!reply && !lost) {
> +			xe_gt_dbg(gt, "GuC mmio request %#x: lost, trying
> again\n", request[0]);
> +			lost =3D true;
> +			goto retry;
> +		}
>  timeout:
>  		xe_gt_err(gt, "GuC mmio request %#x: no reply %#x\n",
>  			  request[0], reply);
LGTM.
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> --
> 2.47.1


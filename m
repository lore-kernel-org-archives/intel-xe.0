Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECCD7E77188
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jan 2025 20:32:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9F5310E482;
	Tue, 14 Jan 2025 20:32:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SR6+j53r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F38B10E482
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jan 2025 20:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736886750; x=1768422750;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=s8N78AjM90GjvXek2101udQt20869s/YUrPedONbIro=;
 b=SR6+j53rTQLuTzUcarBfB8D1hajWtHpxeWg+ivfxpXBu7ClzTyiwWYgA
 JNYgP+QvPdOW7JL+ktAQXkZOi9k7rDVBqJuWJFsQdUGtN9Ph/S0T/pKsU
 SpdktS/5Ic9loJhMUkGwiMHO2thZ8ZGWbpyIYMYtAFSoWc3HSzVwZNLev
 0CbPMTCzbQo4s48+Iu7dGrAqqN4bkdaUpcvsYaftso/hVuyoZtkRlJE8A
 lcyFJXLRI722s8i3b64WvE2cE/afXtUIi6WkUGdiD+8nTIhYbsISy5AU5
 7bxlK1N3qPilU25fN5cc35rfrAXrhR1mimPRJVQhW4y8Lw/u91HfaIE8I g==;
X-CSE-ConnectionGUID: Dt0MoYOFRmO6LcBZIyEZdQ==
X-CSE-MsgGUID: CbYTMZG+SEiPd/+PowjmVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="47693201"
X-IronPort-AV: E=Sophos;i="6.12,315,1728975600"; d="scan'208";a="47693201"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 12:32:30 -0800
X-CSE-ConnectionGUID: 0eDXVTt4RO21pakefeAXqA==
X-CSE-MsgGUID: nQ8gndqLT2W+zdbRIFgmtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,315,1728975600"; d="scan'208";a="105445274"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Jan 2025 12:32:29 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 14 Jan 2025 12:32:28 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 14 Jan 2025 12:32:28 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 14 Jan 2025 12:32:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=slcXMTdcNVLQDzub1UdS1PqGho1PIfN2JWh7odCuxjmSJwWJ9edlWWJzy7jaBQGhckQfg8ZtDvDcGk0n0TtBlEsnz0bCxiPpyYKABpLbPfN187/JNTUZCs3FQ5OxyJ4VLufB90a0co9MLnj6EE/ZF6DBoEd/GMNngVmeLLJwtGttSuSfps9X3UYaeP6DFLidy1pQ2nN9gqvAKAgNUWkaQy9+h94IJq20mnouyG7QywIxf1njOwx2pILKBN/+qz8Mnxfoz3AtVmcJvgQ9uE9WMNj6AMN7wUP4hNK7/WrfileTUFqhwBiOg8tAbib/OxYcXrOl7BDqpK6mMReoqUeacQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c5dWamJCK8/ZpkHmUMepES1+Mk9DJ03lrLI6j9UHjZc=;
 b=NC0tnGJaEgHcFgu5FKGgeS0LKGBHj2O6gRIjuwtrHLLlhxqVYOPQPVSxp+sMqtPqw1b2bGccEcQmephoYQybt45QhVVSA3SeBgWSXQkhq61njfjneZy827oyAtS2rno8yvAaLllApj5q6HviBVCiKRMSoiNKi5QRSkO+AJjCdbzk6lHTsuL+z/ID/HhL9p4Ymn14tjsB08Fb8Gc/uJ/W6TPdm2ynhAM7xoC9tBI21XveOnyPN3A1bO5pGKxR/3qLPCYMhVjFYmSdMYwPWaNFbndpKKS+4yNokqmMwbhhUjxl6VeZmlDpaDfT8Iiy++5l+CCvnnW8B6NhGcK5RmDl6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5782.namprd11.prod.outlook.com (2603:10b6:510:147::11)
 by IA0PR11MB7282.namprd11.prod.outlook.com (2603:10b6:208:43a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 20:32:25 +0000
Received: from PH0PR11MB5782.namprd11.prod.outlook.com
 ([fe80::9696:a886:f70a:4e01]) by PH0PR11MB5782.namprd11.prod.outlook.com
 ([fe80::9696:a886:f70a:4e01%7]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 20:32:25 +0000
From: "Mishra, Pallavi" <pallavi.mishra@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH] drm/xe/mtl: Add Wa_22018931422
Thread-Topic: [PATCH] drm/xe/mtl: Add Wa_22018931422
Thread-Index: AQHbZrb9agjm1KuQN0yxNy33yuGAcLMWuJsQ
Date: Tue, 14 Jan 2025 20:32:25 +0000
Message-ID: <PH0PR11MB5782C53735F70CA0B3AB2B0A82182@PH0PR11MB5782.namprd11.prod.outlook.com>
References: <20250114190242.2026743-2-matthew.d.roper@intel.com>
In-Reply-To: <20250114190242.2026743-2-matthew.d.roper@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5782:EE_|IA0PR11MB7282:EE_
x-ms-office365-filtering-correlation-id: 4a636c69-f6c1-4f43-2cd7-08dd34da8e67
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|10070799003|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?XLt2V9YA0GdZwdJp0D0vNY50aagZLEkJFbdrii5o4rOZhPKdN+78FUO5szQw?=
 =?us-ascii?Q?bwJ9Xh3kUCW6+LVbSeQFd7X6lnJGRehBCsmPREuwYhOeT0UN7EmvCFCI9PoR?=
 =?us-ascii?Q?fn6l9EOLjn4FoY2v70PaVEaeZdHf7fmohf8+5k3ESYunAkgtUIEPwF9/wbva?=
 =?us-ascii?Q?THaLdllTdBCOjshtzsRapPuqQoCiX/QiLcjkycgy1RDdmNmGDGrEa3mEYYrW?=
 =?us-ascii?Q?lnP+rqik1kqIOhISQV7BFLqrtiVy3HsBHvyc0daQS+6FazW0y8OshZVfDkL0?=
 =?us-ascii?Q?uL/PrBq3FbOoDmd3Z5A9DDFZQQaCYojfSbukQWj5msougbTTRqGQ5awds5yR?=
 =?us-ascii?Q?gMmCiopDShLo2vEeZsDI3N29s5yS+lPgCHftwQIFQEQVoSRFCg7iOEg5WYA9?=
 =?us-ascii?Q?Mmd2KZAsYsZER9YLE1J33BEeFEYLq4VhjD0s7wh/nZiilvoUZ5LrrfF2Dkqb?=
 =?us-ascii?Q?niasfOGYGBu1yxGDkIWl7KbCQUHC9Y/z1gTbPF5yEaz3Xgu3eherG2ZyupRc?=
 =?us-ascii?Q?Mnn1HplEsqhxA8PTb8GlAxvMg2H5qnlHyQePLReZ00ODF0GsMsIcstq+jOOq?=
 =?us-ascii?Q?VSUoLnIrs060B1y7TXsokrfbBB6G4QvFbWFd4wfCoFVOKs7ZgiHpAuL8BzQi?=
 =?us-ascii?Q?EMXUDQo3g3rX3OhmzoFLN2t+L7YgRep50MH+mZAdDZczMnCqGqRX4Esngoe/?=
 =?us-ascii?Q?tznLh27H0YH2ZZr6AapBUPTBcGiAmQyVCQl0WJWuGFo9ZGghb84M69ESymOh?=
 =?us-ascii?Q?u7tXLV4RZqXytXmTkw/pIJ+xTUEjGPmYXivt4QPFFjRklicwoqmAoDKAD7rl?=
 =?us-ascii?Q?VAeHdJfG/gYL9PtnFQr1rQhP92OuhpxPc4vFyzGaTMU1at4EE5AXT3yo0MtU?=
 =?us-ascii?Q?o4ZpXepXogu/cv3ZZAS1j2joX9s1KfeRut6yNhZ1dptbRV+ii0ZkVtbwppke?=
 =?us-ascii?Q?LNo+IxysbuK1B5Ftjso4+k0ctbMjniqKbSKJ4QeWNOf30S9aDyRMPlDDzV8r?=
 =?us-ascii?Q?0NIZ0ymJ86QwJsknJwXXw0r5ump7JoMaUjtAz4j8v/b0PL51+hlWXGTQSpgt?=
 =?us-ascii?Q?T71r9jZFGkKsKhEQYk5kT70jyAIjj0H/SbPsk8/+4weR0Y8Hr8DaJPb+lUW7?=
 =?us-ascii?Q?UrS/vBqpCb9VWRmxpyYTaA8ZoL+dNcLyfozeofNR7QmSYm/uki+XcDeT4yYk?=
 =?us-ascii?Q?3i9P7T48kY3zY2RgbeS7sRNoPAVvM0IX1976hRzcpNiZjk5iQuyJLWqpg3kn?=
 =?us-ascii?Q?uZznvpsWLNMdnQorpAKn2pYJtbERrZ2emrpCsFtncAuXTkF2Wa1CcDR07Qus?=
 =?us-ascii?Q?ySm0T++QUFNZ52qO5ybgEfA/fivXGxzV4h1RjO/nsvR3YohVTJJtp11GchSw?=
 =?us-ascii?Q?/6361NO7ZuevSyRzavcvKb7XEPsIVrUB6rePgOyD3E1YDyBHHA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5782.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(10070799003)(366016)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7kyhz3MYEEyS5VCApNwHGxjwwXLo0KkEOl1uXTq5z4E6l/fa2dFIWrlT4JTH?=
 =?us-ascii?Q?FEmh1SKJYB9Jie9ykceT/+wX89mw50mF/QS9lNuJnjvm4fnYNcu5h8jVluW0?=
 =?us-ascii?Q?b4ME9uUeE69kxWn7lfOd6r2aaT04NX4Zvmq78PKgmYePOT5+q8nBajcgV0Ky?=
 =?us-ascii?Q?7Zsi559SubPiqG0BuldzmUrWS0n2A5VoDYhdwcEFZqschcgLZ7qbmi17HYTN?=
 =?us-ascii?Q?9tQTvlKD0iMaAqpsitoOPlyCx9DWo5sAPVcYDv1fKZWTtP3P6F1YGWFyR6Q7?=
 =?us-ascii?Q?SyGclBMVbJ9WTbTTIxk29491dVGKM+DdPyzQKJ+mjBu6c7IH6+JMCUR3Alhz?=
 =?us-ascii?Q?fEVv3TBH/xaCHb5PB/6WDtKx5B/pR8YVbSraEzUFYnXZUoZDW6xa3LiXUHuX?=
 =?us-ascii?Q?keSoForWnkv83WtFlXqz/EBAYFn0P4fP1iMwJd4l+X8J4aCrCpfJr1h0wC9U?=
 =?us-ascii?Q?BgtU/G8elNNYokI4wNWWhiyG9DbQnTcCTGxVdgJPFgEzUe3s/eerjaLPAgRg?=
 =?us-ascii?Q?vkLlRw72NCJ43xZIFTi3cbGzZzktQ93GgQ4HFf7WFv110hQRlofpQfENd8xT?=
 =?us-ascii?Q?8t+yArpx7On7cLynrSSQN8CvqpMT2B9dmWwBQY0/0G0SiNKFVlREou/bIXz5?=
 =?us-ascii?Q?WoiSyST6WnzgnNfGILvTqGVBctKyad1kPO6EZIfRMiuCdYXKtx7JAn3DEpAK?=
 =?us-ascii?Q?r0wixrJzzZv1dy4hchVGfwU0ewvuS4wxfOtCJfVeAQgtva1umZfAcGNQUlCy?=
 =?us-ascii?Q?tK6r1QirB4FKP3BARsR8LFd6gFmZs5dxdEI35AYE/seJLtboqoxicHkae5x/?=
 =?us-ascii?Q?kqkabfZTRNZCeOlph7+8Z2BbFld3r9YzL29NDluFFvEa1PwLYJYE6Tqnf4x2?=
 =?us-ascii?Q?o5B9GrK0dPyNo/3iXDohHGjqtcLjIxgB/gunV/+rNEHzO0KoyhNTJOVtUZbR?=
 =?us-ascii?Q?UpzSMpEf6Vgobg0pOoKVYHBk+kSnzbKuU9RYtK31HI33zwWObRl9MeLo/NSb?=
 =?us-ascii?Q?8tuuWzMGMuO/X9r14OXjnQI+NlNTehnfN2wjJMc7sSRLUrXGqk/9iUmVEAE2?=
 =?us-ascii?Q?A+aIf8fspFWn9lmFbgDI7tfZIs8VWMUb53qzS2dE/9uJSpfK2SsIl3xTq1kr?=
 =?us-ascii?Q?T3VRCbteI/z+MnEhmnq9dZYpk+5spNzlbF7LwBCM7M3v5zelixDNRX8a+U5y?=
 =?us-ascii?Q?JkhED6tuKgJEDOz3hgc2dQFv39PFPfWygDCEczfXb+ArCzFSagw5QiapvSKW?=
 =?us-ascii?Q?9lx9XztXClBjtI0CxAfMAjR2ClThszlxpdnTAG8xuZVfc6UX2rU/+awOSvJG?=
 =?us-ascii?Q?UbeTNighl5sG12ukQ16AV/ers8DFsHEdvhs++BNTfzJsfAOyKFHgP/G4UYjI?=
 =?us-ascii?Q?CtBPH0B2WHRpGZfpjUhYg38OE2uqJGZ55KHUJEZT+RCggLo+LZK3+O8oYWoR?=
 =?us-ascii?Q?ellB7/taUsgWZ+zi1zOnQpZL5Fdj1jd9ZMIMZRubJ9gCjCFoVGlEFUOBefkx?=
 =?us-ascii?Q?2nie0+SMVeg5G28GZP/pfinfo+qR2gM1ACpTjlNDcsTXGZQaEqqv/qGUMucw?=
 =?us-ascii?Q?PmcCxLDYQxzwWog/MVgaVDO6U+VTz+WDckugjMtnGeg7OtQQ1DOylaylQhhQ?=
 =?us-ascii?Q?0Om0P4TStEHG/1Frq5KWeSswdecLUQKGDPLPoeXbaSgz?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5782.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a636c69-f6c1-4f43-2cd7-08dd34da8e67
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2025 20:32:25.2623 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rY+/pAhR+qc7BkQQb4HcTPbFaY7vYEdFzx0tj0xc/G++fjb7iMaqBH4EFTC65kZVq5GnfSN45kuZmfklC3xIHKBbGUSWB4EOyUsnqQ05FKY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7282
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matt
> Roper
> Sent: Tuesday, January 14, 2025 11:03 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Roper, Matthew D <matthew.d.roper@intel.com>
> Subject: [PATCH] drm/xe/mtl: Add Wa_22018931422
>=20
> Although Wa_22018931422 still isn't fully documented in the hardware
> database, it's been implemented in i915 for over a year and has been
> successful at fixing MCR lock timeout issues.  Bring the same workaround
> over to the Xe driver.
>=20
> Since the official documentation for this workaround still isn't fully co=
mplete,
> there isn't clear guidance on exactly which platform(s) are/aren't impact=
ed,
> but our belief is that this should be applied to the graphics and media I=
Ps
> used by MTL and ARL platforms.  Offline discussion with the hardware team=
s
> indicated that this should not be relevant to any Xe2 or later platforms.
>=20
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4059
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Pallavi Mishra <pallavi.mishra@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_mcr.c     | 27 ++++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_gt_types.h   |  6 ++++++
>  drivers/gpu/drm/xe/xe_wa_oob.rules |  2 ++
>  3 files changed, 34 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mc=
r.c
> index a1676b787fdc..f2699ac9a4f6 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -5,8 +5,11 @@
>=20
>  #include "xe_gt_mcr.h"
>=20
> +#include <generated/xe_wa_oob.h>
> +
>  #include "regs/xe_gt_regs.h"
>  #include "xe_assert.h"
> +#include "xe_force_wake.h"
>  #include "xe_gt.h"
>  #include "xe_gt_printk.h"
>  #include "xe_gt_topology.h"
> @@ -14,6 +17,7 @@
>  #include "xe_guc_hwconfig.h"
>  #include "xe_mmio.h"
>  #include "xe_sriov.h"
> +#include "xe_wa.h"
>=20
>  /**
>   * DOC: GT Multicast/Replicated (MCR) Register Support @@ -607,9 +611,27
> @@ static void mcr_lock(struct xe_gt *gt) __acquires(&gt->mcr_lock)
>  	 * shares the same steering control register. The semaphore is
> obtained
>  	 * when a read to the relevant register returns 1.
>  	 */
> -	if (GRAPHICS_VERx100(xe) >=3D 1270)
> +	if (GRAPHICS_VERx100(xe) >=3D 1270) {
> +		/*
> +		 * The steering control and semaphore registers are inside an
> +		 * "always on" power domain with respect to RC6.  However
> there
> +		 * are some issues if higher-level platform sleep states are
> +		 * entering/exiting at the same time these registers are
> +		 * accessed.  Grabbing GT forcewake and holding it over the
> +		 * entire lock/steer/unlock cycle ensures that those sleep
> +		 * states have been fully exited before we access these
> +		 * registers.  This wakeref will be released in the unlock
> +		 * routine.
> +		 */
> +		if (XE_WA(gt, 22018931422)) {
> +			gt->mcr_fw =3D xe_force_wake_get(gt_to_fw(gt),
> XE_FW_GT);
> +			xe_gt_WARN(gt, !gt->mcr_fw,
> +				   "Could not grab forcewake during MCR
> steering\n");
> +		}
> +
>  		ret =3D xe_mmio_wait32(&gt->mmio, STEER_SEMAPHORE, 0x1,
> 0x1, 10, NULL,
>  				     true);
> +	}
>=20
>  	drm_WARN_ON_ONCE(&xe->drm, ret =3D=3D -ETIMEDOUT);  } @@ -620,6
> +642,9 @@ static void mcr_unlock(struct xe_gt *gt) __releases(&gt-
> >mcr_lock)
>  	if (GRAPHICS_VERx100(gt_to_xe(gt)) >=3D 1270)
>  		xe_mmio_write32(&gt->mmio, STEER_SEMAPHORE, 0x1);
>=20
> +	if (XE_WA(gt, 22018931422))
> +		xe_force_wake_put(gt_to_fw(gt), gt->mcr_fw);
> +
>  	spin_unlock(&gt->mcr_lock);
>  }
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h
> b/drivers/gpu/drm/xe/xe_gt_types.h
> index 6e66bf0e8b3f..2e0c138599de 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -389,6 +389,12 @@ struct xe_gt {
>  	 */
>  	spinlock_t mcr_lock;
>=20
> +	/**
> +	 * @mcr_fw: Forcewake reference during MCR steering (only used
> when
> +	 *    Wa_22018931422 is in effect).
> +	 */
> +	unsigned int mcr_fw;
> +
>  	/**
>  	 * @global_invl_lock: protects the register for the duration
>  	 *    of a global invalidation of l2 cache
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules
> b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 40438c3d9b72..92a922bad630 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -42,3 +42,5 @@
>  no_media_l3	MEDIA_VERSION(3000)
>  14022866841	GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0)
>  		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0)
> +22018931422	GRAPHICS_VERSION_RANGE(1270, 1274)
> +		MEDIA_VERSION(1300)
> --
> 2.47.1


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC183D64097
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 23:39:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7247710E027;
	Fri,  8 Nov 2024 23:39:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OnhOKraC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8833D10E027
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Nov 2024 23:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731109142; x=1762645142;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ek7zUSO3hymtvKtonXRpH/ShUr47H9HVJGf25Sn1GTE=;
 b=OnhOKraCQ1t64weH9/niDvwVw/59JPSjo5fE8CFerDKV+c9IkuKyNQpb
 CR2FWZEOmRwsfUSld+t+yf9Fdt0aRblfEs9kwluod5YH7enjXao+6Ho8E
 tguo5YrY8wGoo9A1p/WDXCz4oSQTo5N5tdgEOyz23f7P5DslWhpIYJqVs
 ELP6yBHlvWsnZiZ3rk3yEBlCeRYIhfe/MHeeLM4KR8db+f6yqnawctn/m
 C1KXPJh7QYzixGuiWk6KJU+nANv1l4MRAhOSra8P48lEGa/VgD4mOWQAI
 bcxezcnG1/Fp+u3DuZdRSbgF+jpPGzT9NerAb0h4kNFKIMgelLMA+EW0x A==;
X-CSE-ConnectionGUID: wCGubefATUyKp6zqXGsY+g==
X-CSE-MsgGUID: oWT7oKQ8Qp6TGWEb9VPqeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30775230"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30775230"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 15:39:02 -0800
X-CSE-ConnectionGUID: OPEpEK2iQHaoHqpyF1JjvA==
X-CSE-MsgGUID: mtaPeY33QtebC0kAaUeaUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="85915273"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2024 15:39:02 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 8 Nov 2024 15:39:01 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 8 Nov 2024 15:39:01 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 8 Nov 2024 15:39:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FfRjtn70U7qfNvHr5Dbt12M6GJLziNRyBtLnZ3iibsEI22rIRYZcDJrRmF6wvEJAF1P0jvnMW48vXyiQ0XXkrIy6+1gqwKD1kDTWuMjznXq9aFDZ9lCELw84m7p8paREwqnMXmKUN6UoUU9fZHqN3Vcr1Bvjpm7GLADoJK7xxpzcQ8NIKrW3KZshpb1l4AtaMfiRjNPbohd07RZvvMYJ8WqLxDGpR2/yD2y3TpdLoucUwrfN6AZqYhfzp0Da2UZB8Do3bo5D67DFWu2AydLCFM1+N8lxecitILAPHDcK/iz4MEDObOgSDtUbb8kMgqDfVjuVy+eb/KhMxcabE/Kx6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qNoyAtQWZ0XQmHtBmslORkey1S0RnO5wmFF8PfQdNOQ=;
 b=dwp4YY5t5hlIovTCZreLvSpya+jUZho9AAw37fp7eJCQCBSF4XVs37aSzh0BJcOeTk0Q1hWGw9xmZuykK6CrqaeOkF3GLpNK49ZgLbZ6pvVdv7uJQg+2rVQeJWSBmmC0ZuaoIDCPCUCa1+a4gBOVKHudVreTCzaBnQnSgcocZ3oN4lNAELuq+nQUQAngBO3xhf3/3J7sqWnAranSBhhu8UnM8gFyTCKxTSUoEzmwH5C+eXEgQ1BfvCgl5SEJ2Y+HBnOrrXSHHuIWP0eckaTBbNrz1p/8tzu3KTMO7jTcVyct9/cmbFtqw54ZWhCobxTgbtDOzoRriAJvGo9zon5IMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DS7PR11MB8855.namprd11.prod.outlook.com (2603:10b6:8:257::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Fri, 8 Nov
 2024 23:38:59 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%5]) with mapi id 15.20.8137.019; Fri, 8 Nov 2024
 23:38:59 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, "Cavitt,
 Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 1/2] drm/xe/oa: Disallow OA from being enabled on active
 exec_queue's
Thread-Topic: [PATCH 1/2] drm/xe/oa: Disallow OA from being enabled on active
 exec_queue's
Thread-Index: AQHbMjLW3k1WwZxZ0Ui0INoFng7T3rKuCfgg
Date: Fri, 8 Nov 2024 23:38:59 +0000
Message-ID: <CH0PR11MB544444D4C41B0977047D88FDE55D2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241108230602.2984959-1-ashutosh.dixit@intel.com>
 <20241108230602.2984959-2-ashutosh.dixit@intel.com>
In-Reply-To: <20241108230602.2984959-2-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DS7PR11MB8855:EE_
x-ms-office365-filtering-correlation-id: ecebd8a0-9174-4bf0-6c31-08dd004e84bc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?KI8zXwu/G1qv9DQP5eaMn6kzhRwBFi5QCvT1wo90hZ1tJQF22C3C3tiIl3gL?=
 =?us-ascii?Q?cSLjFL7f29oqjx2TXS4r3fb3nuwPuBrGpQE6kw2CVgfMLYiBJSaxOeRPHfps?=
 =?us-ascii?Q?FN/x7gmZnMgoN9k5RU5M3lcc6NlRBDJXLgvO0s35vFqJOC/go6F6I4UBYCMB?=
 =?us-ascii?Q?5CAVtsVIDUeiTNVcqmGob+u0yuLvqg637Ts2O58fmgvLZojGXcmMfQ1PXPpm?=
 =?us-ascii?Q?mduM7Vr8vRq96Z6g/OLZq+vt6gHEFMe7X4zVCUE+2U+NeQIg5vlSt/oAUgdG?=
 =?us-ascii?Q?xXdNv1Pm79uOsVGy0kLCCL6Wxqnf5dKbe8H6tmCFRYZGmjs2PF9ma4xtwEQu?=
 =?us-ascii?Q?u3RHK7e/42cqGPtNHw5kcfWEGoJgFV9aHPdXAierl0Vk4kHM4KnwjwXrw4g5?=
 =?us-ascii?Q?KjkGJYUAuXQMJ3yB2IWh+pKYeaon/KtQ8pgqz5vuEi1M8x44FsJVg+IkasqE?=
 =?us-ascii?Q?GKQWu1S4NFr019H3H/lrNWzYICoOfLUCTCYULpclc/55iiPYBqcLWsu9p6HF?=
 =?us-ascii?Q?g1G9l8q0FF/M1/ebTK230Atgj3BrgwJ4kV5exa71coyHoOY0IBJKt0hmRK4M?=
 =?us-ascii?Q?xqEN86NaNOCLReJCNdCLpBQY23hUrgXU8RqUhNp2aP9JblDvxvpI4qqRpW2Q?=
 =?us-ascii?Q?jizMs61Iu5oF1iz61M65G5rOdYtlHic1RQDwdzHFAaLTt5oUk7kzchfKS4zl?=
 =?us-ascii?Q?Z05OK02EBDn8C9RGA1KyUiy3vtZXE5Tz11eNW6QniukXIm3ue8CT9IOxc5S2?=
 =?us-ascii?Q?b/tm6+Hazyd2f2teOx3JE9gK/ml5+jUzAOnpLaYrK2+48A6pu2qagyuvLXuK?=
 =?us-ascii?Q?Yu4aKDsgf5M3Dc9MD9JsdBZVBxHPrnSWgEX8fuQET2PgckIi/fCROn/95hte?=
 =?us-ascii?Q?+ORAoH5rzhDBVNaa383UvvucAeBM5EeEN0Fg8hrvRBWRjFanfi4zgDSXYQ21?=
 =?us-ascii?Q?uTtELfTWisOFyi/43KPkvkIMp/68BJfvswsRvuDCDJb1jzPeL1eJRrXuuWnd?=
 =?us-ascii?Q?lExvGP4qhPldEeSd9cAadbGdbgQCC/b6EkBY/6v883y9Pm0/v/pzV2IlOgKN?=
 =?us-ascii?Q?8DhS43Wkg8gG55hdvK4TWWppx9ds1zyv8L5iQNQrzpfNbT64Dc5NpxP7i4Io?=
 =?us-ascii?Q?uOhHEc5UKin84J2cqYNgx+Rozpp6hDboDlVemjDhdBHiwlPTz+M3CuxGvzeY?=
 =?us-ascii?Q?POfK7yLnk5rQ5nMurid9C3KKFd82ngxOJ58BlowjsfZ++YB9G6ejZD3RHpWt?=
 =?us-ascii?Q?OLfMXRZKn/tCnCADgK4eIimvpgM8PvtfUhhD6weNNpTwUittKQ1reDnCQqua?=
 =?us-ascii?Q?FUMqvW4arHT4iaY4tVncNvr7/XFBjV8Ctpg6ERsEVAwSUFDdDeURgD0/JuMx?=
 =?us-ascii?Q?p9tjuCI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?s4if9scqY8WIsi9OrldMohxHHqyCDBS9dFJO/PWhrXj8M1hIqgKoWLGHPIEx?=
 =?us-ascii?Q?9AcTgXiqy6CRVUTD1C54NMIBCIVcxx0sYO7uip5jSgmDFmKaEYioc7YULDgM?=
 =?us-ascii?Q?Z30mNxSWYJMuiHJU5VCJH+H9hjafIE0hR6vcTEKOQnIFlJW8xZHk4JchAGqy?=
 =?us-ascii?Q?Cu1FCt/pojotHjknJNg5qLTSMGedpC3c7iy8Ld99X0KeS0YW/5EcgRzQwYgX?=
 =?us-ascii?Q?dQZzTJJ7D8IzhWYhoaimeo8FNXyG0Qd2KSUN5YjawMWK6hYw1Fs159gWQTMY?=
 =?us-ascii?Q?+4MBgB291sEdwdsBOITrKHXX+iTY+T2bfR+lGDEKhuj5Vys9YqgVXEl9ca0o?=
 =?us-ascii?Q?r/qeeDkfitz7zyYbpoYfiJmIzas+ZJxd7KK3RiXEQ9iD2AQ97Au67qIjbw9C?=
 =?us-ascii?Q?m2THKVkJssdVry8WKJ27aw4ziaEbIwovP3nd4fRNZAPy/iOlIJwx6ZDtm5MR?=
 =?us-ascii?Q?s46sutMBgvPtwB5YtNqNXpkaq3PRIFuI2UUUu+5J4FBuvSqdoMqPCZZN8nW4?=
 =?us-ascii?Q?1L0MSlBg0fv610NmNQuyEZB+5txzKXuFasdmQRRLL5Gz0p5HibCAx6zSTLBm?=
 =?us-ascii?Q?o/FR0rYsn/1s1JCX10Dq3F/Bw/1nnZOJskwuLXOUuhQiy4AdzAYqSZSUDeUM?=
 =?us-ascii?Q?8s19wWMEm4obY5aHFEQMC+0nsrsyAMkqQWefRhyvZ1FU+qi8BEhQghSd3UMq?=
 =?us-ascii?Q?Qg3bmmJrSGpSC94u5SIqz0tQqcZo2yv92ssq0+igiSurz6ZcIoo070BX8iZH?=
 =?us-ascii?Q?E/qTAXxENAmj/OhTshxuPGzZyf30AoZuY8v1wIUpmlxPwEjM3JDXTeoKVKph?=
 =?us-ascii?Q?wCPBSnrJm5lhTXZX+IoFs33IX8bslPEb04AS7YyPj4DajxxzTMOJ0tnNb9Tv?=
 =?us-ascii?Q?gYHQ5HJjsscKTb3oKFcks4XHCuuLAYdt/3NC1gCJqpmYlvCXoyAmWvTR6AHP?=
 =?us-ascii?Q?viRe55Hz0MEE30T1entBZFFEZu9EZvk28NJREInITOiLC/+ZeeqIVJmUmZNO?=
 =?us-ascii?Q?8Cgip7BuLWs27V2p/hmR/piRAAOURBW2XJ5CGF+p39yfl2bfaq2cyBiTEsHu?=
 =?us-ascii?Q?B1R4jjJMLw84oV/aZDDZJd38COcLtpzxVCBS94guzgkD8PvRoLUj2wGn7jDB?=
 =?us-ascii?Q?ygjarDqpigwSowNbhrvt4VMr/IAPu3cTh14DMA+WKnAD38gwUVor4w3TcAbA?=
 =?us-ascii?Q?Dpm0XT3oGyo38CQHN97j8o+Gg29O/3g5xbKAJAB2sLcxWMO3tnOA0OCGtPg4?=
 =?us-ascii?Q?9KMXSNuxehu2yCZl/hoDNtXGPcN5ZGSRVyP9iFWZ+t6jg+3ZS0SWesACn8Tc?=
 =?us-ascii?Q?i6jnRJlpiHEzFNmsme1iUm3DeewqCOQmLuanPK2Zh+uVLbLfbNURb9QSEXD0?=
 =?us-ascii?Q?kXK1hppnJlexKKbIcoC0BTa9M/H3tJA683R/cO1Ff5MmVM5MmmjdKTR72IbU?=
 =?us-ascii?Q?SlLdTpXej6ocR1eMwyqwpsTDHNqchkn+x7ezdR/Z1IznMJ9C/dPSo08/KOw3?=
 =?us-ascii?Q?+wPdEpzXbqBMLWJud+mPF+aHcMQuPhswj2A/+XHAL8slGYC/Nnb5CL8uFPbV?=
 =?us-ascii?Q?FHIlJHiE/pC3SzcCTPRygrqhpPPyG7/XUZgNF3HYrfv1pOAhIPQazJJK7/Za?=
 =?us-ascii?Q?Xw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecebd8a0-9174-4bf0-6c31-08dd004e84bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2024 23:38:59.0410 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /U/LEvSARPq7QlsRCbxJ69NaI464n5HMNpV6enSHyVkPmWiDTrhi1YHXDeoEoyVmGFuodgzRUT4A9hcPMgiQH3s1CdXiQ6SipnO617EszCk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8855
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

-----Original Message-----
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Ashuto=
sh Dixit
Sent: Friday, November 8, 2024 3:06 PM
To: intel-xe@lists.freedesktop.org
Cc: Nerlige Ramappa, Umesh <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 1/2] drm/xe/oa: Disallow OA from being enabled on active ex=
ec_queue's
>=20
> Enabling OA on an exec_queue toggles the OAC_CONTEXT_ENABLE bit in
> CTXT_SR_CTL register. Toggling this bit changes the size and layout of th=
e
> underlying HW context image. Therefore, enabling OA on an already active
> exec_queue (as currently implemented in xe) is an invalid operation and c=
an
> cause hangs. Therefore, disallow OA from being enabled on active
> exec_queue's (here by active we mean a context on which submissions have
> previously happened).
>=20
> Transition from 1 -> 0 for this bit was disallowed in
> '0c8650b09a36 ("drm/xe/oa: Don't reset OAC_CONTEXT_ENABLE on OA stream
> close")'. Here we disallow the 0 -> 1 transition on active contexts.
>=20
> Bspec: 60314
> Fixes: 2f4a730fcd2d ("drm/xe/oa: Add OAR support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

I'm worried this might have a negative impact on our current OA tests in IG=
T.
But if it doesn't:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c |  2 +-
>  drivers/gpu/drm/xe/xe_guc_submit.h |  1 +
>  drivers/gpu/drm/xe/xe_oa.c         | 11 +++++++++++
>  3 files changed, 13 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index 9e0f86f3778b2..5c285d966fd5c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -83,7 +83,7 @@ static void clear_exec_queue_registered(struct xe_exec_=
queue *q)
>  	atomic_and(~EXEC_QUEUE_STATE_REGISTERED, &q->guc->state);
>  }
> =20
> -static bool exec_queue_enabled(struct xe_exec_queue *q)
> +bool exec_queue_enabled(struct xe_exec_queue *q)
>  {
>  	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_ENABLED;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_g=
uc_submit.h
> index 9b71a986c6ca6..a3bde061dd53c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -12,6 +12,7 @@ struct drm_printer;
>  struct xe_exec_queue;
>  struct xe_guc;
> =20
> +bool exec_queue_enabled(struct xe_exec_queue *q);
>  int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids);
> =20
>  int xe_guc_submit_reset_prepare(struct xe_guc *guc);
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index fd2ffe8df1561..b0692b8ca0a3d 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -28,6 +28,7 @@
>  #include "xe_gt_mcr.h"
>  #include "xe_gt_printk.h"
>  #include "xe_guc_pc.h"
> +#include "xe_guc_submit.h"
>  #include "xe_lrc.h"
>  #include "xe_macros.h"
>  #include "xe_mmio.h"
> @@ -2064,6 +2065,16 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev=
, u64 data, struct drm_file *f
>  		if (XE_IOCTL_DBG(oa->xe, !param.exec_q))
>  			return -ENOENT;
> =20
> +		/*
> +		 * Disallow OA from being enabled on active exec_queue's. Enabling OA =
toggles
> +		 * the OAC_CONTEXT_ENABLE bit in CTXT_SR_CTL register, which changes t=
he size
> +		 * and layout of the underlying HW context image and can cause hangs.
> +		 */
> +		if (XE_IOCTL_DBG(oa->xe, exec_queue_enabled(param.exec_q))) {
> +			ret =3D -EADDRINUSE;
> +			goto err_exec_q;
> +		}
> +
>  		if (param.exec_q->width > 1)
>  			drm_dbg(&oa->xe->drm, "exec_q->width > 1, programming only exec_q->lr=
c[0]\n");
>  	}
> --=20
> 2.41.0
>=20
>=20

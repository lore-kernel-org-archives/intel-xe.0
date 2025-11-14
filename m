Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80FEDCE8D79
	for <intel-xe@archiver.kernel.org>; Fri, 14 Nov 2025 19:07:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F72A10E25B;
	Fri, 14 Nov 2025 19:07:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Go3w3Uqr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D66310E25B
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Nov 2025 19:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763147219; x=1794683219;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DJL74xWh8hZGUKX1CSG70R8ngpW1F91nlIBGwL2W4jM=;
 b=Go3w3Uqr5gZ7DCW7hFE+Uc+5RZ+2OP9LR7SHo7/MwXCQ+aWLDg1Dh6kj
 aZz98L/jLrHvOVH8Ul/9HJo0eI4LgTsnb7DO9ZreGdug8d9qbnrB2W7tF
 UTHK74jHgKgLaaiNrIpGiisZhZBqTPNbFHmkSbtQ5d2MY2PCn/SZEzf7j
 +b8fcTEnu3hQpMSwFnTo8cVpoRB4BfIMa08fRILuyOiPvn/IR7q3YhdIG
 OI8Z3TjP3tHZEs5bezi3csfn/JtTnR8x6AYyqxyV5Jo1uUNggCcCX9taR
 6W33YZ4HjXxZD8EC2NJRAp2J1EtJSTTITRmPbSaovxCbkv6Q+pXyWM2FG A==;
X-CSE-ConnectionGUID: jR/v0pDmS4Wh5Cdm+B8z7Q==
X-CSE-MsgGUID: e977cX3xS1mJSSxozk9r4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="76712376"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="76712376"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 11:06:59 -0800
X-CSE-ConnectionGUID: D7WM8/jeSEOeeqon+qVP9w==
X-CSE-MsgGUID: TDAnuefNTZSDdMwPQIDD1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="227198254"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 11:06:59 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 11:06:58 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 14 Nov 2025 11:06:58 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.23) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 11:06:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WZm6Wztt6f/ZEzFQqni4ateAHzGPD+yVT4M5TbMlOcAL9DlR64XbmKNkeoebZrRJ7vrPc+ZcnSI1F2FnBMg3yVQRtdzeYzGQ4h+QcCv1806Qs4ufGbHcua7lkq5WVG5BTE3dj1XRxSdfoiMhTvhagYBIv1/dE07DPwXgreSdjo3wu4Rj8VDUcnvUO+uh0a+IDaCbSJF59vMqpFb3NJTAGGCvkDP/GZ5NFlF9L+VWUk6PBY5XPXxjURTI9iR1lfzV2jKssUm3QF2M5ztgAPC0evE32KUwl1DNy31nOWxvkLu/agadQfutMICxucQPBXGPDYdCngeUNcrzUEZPsu8WWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EhIfZLMhHmkSU13Ai001Ta83xxd4t0EyV+6frbMU/sw=;
 b=Nrlbe7aAm1q84TB1gaETcZKeZXIjKwWAsJIlDmrSce27GUov9oOUu0JuquVQ0L7oI1dccxEnhKM7KK2fHv2ImwmRKWBkrr9osXHccf9xBbGf9DQYhKbJpcvSpExG6cUTySlD23GWQvDBSMxOhIvzbsxFCx7t4kegA3NtNHTji9wBQZt+mVxVeR4IPjGw9IdUUUqllfA0dBS0m6+gBvoYYZ6gfVfgkLBSmXShsdlHJ/s/dTHsZjwsVLm6WyrTj48CclWJzc/gz4y14weHMaqBFQcoU1FHH7zpjhM9ssLNPB8YjVDfg26n4mlN5u2FR7MbWKPbcl+zLiAGmwjYOMhhQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by BL1PR11MB5272.namprd11.prod.outlook.com (2603:10b6:208:30a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 19:06:52 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c%4]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 19:06:52 +0000
From: "Wang, X" <x.wang@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Lin, Shuicheng" <shuicheng.lin@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH] drm/xe: expose PAT software table via debugfs
Thread-Topic: [PATCH] drm/xe: expose PAT software table via debugfs
Thread-Index: AQHcVTOFbU/vTReMYU6+GeATlFYmWLTxvbYggAC7j4CAAA8g4A==
Date: Fri, 14 Nov 2025 19:06:52 +0000
Message-ID: <SA3PR11MB804637B91432CEBA00D390CC86CAA@SA3PR11MB8046.namprd11.prod.outlook.com>
References: <20251114065409.132230-1-x.wang@intel.com>
 <SA3PR11MB804680A5B5BEF6E60AF58AE786CAA@SA3PR11MB8046.namprd11.prod.outlook.com>
 <CH0PR11MB544477F08A904473098991D5E5CAA@CH0PR11MB5444.namprd11.prod.outlook.com>
In-Reply-To: <CH0PR11MB544477F08A904473098991D5E5CAA@CH0PR11MB5444.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8046:EE_|BL1PR11MB5272:EE_
x-ms-office365-filtering-correlation-id: a32ad184-e9f9-49b5-22a1-08de23b0f8b4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|42112799006|376014|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?p6zvimZ0RogQrHZaphsDYAOcwrA4mCKMpJ7q35d3pfF6Op7I4lIDiviiPdWZ?=
 =?us-ascii?Q?mwgN+gq0bVNZ80pac5/ybDVNRqFMZSwmfq+CNFMgsyfwbQpfdznU1NE975Fv?=
 =?us-ascii?Q?8vE2v2q0Gj5UI1LcBPi7Zrl/21Za5ruvcURKSCLeCtBsO/LMyFnzcuDiK4md?=
 =?us-ascii?Q?hkBSF4GEGH4Ap4yR+25c+0wnpAwVi1wcXyYZtqiXS2V+zH364N278FNT8TZq?=
 =?us-ascii?Q?gKa2T+seK5RgReMUcAE2lXxADUtFrXQ18AoQCp16JfYxPBWlzmsFiJhgofun?=
 =?us-ascii?Q?xNn0JCag53W3IA8Dg8+X6Yf0vQveq4z7TgXorDQ1E4k2IJqyn9fpx5aKsawP?=
 =?us-ascii?Q?Z4seEZU/snIGgXePBoIJ+QfXCs2TYbzqbVMOGE5TSzkRGcjHPDBuCaRIA5yI?=
 =?us-ascii?Q?PdY2rEJcGBwlx7etpTeteXCfeklOW190lUGR5yUqN5ItXt+V7nF1eCc3nsUM?=
 =?us-ascii?Q?1VjHF7vvFISQwzmXfriefloSd7O3oiPucILeld/sazlb/2y5V/lVzVr+8YBL?=
 =?us-ascii?Q?n4O4zsf9bWwuXvB1iWsWunyzDfdfuZ+hOQiMCFsTbyUv9dbK8U4ekRsQxEI6?=
 =?us-ascii?Q?aV1VjZSj8ClcOqrBDf9arpbZiwCaSTrG0VVwTgSwahKKZI464+nJNSc/Bm/V?=
 =?us-ascii?Q?/CP6ztCqQObpOS4t+P5Z+wlObwnwl3ZY7Wav/917yXJn64dFVqdQqDCGru8i?=
 =?us-ascii?Q?kdmSn6a9S1GAyxkJac01Q7ucPdVFi3sO4U9+Kj55J+XKkRn5cX/sKPyvW7qZ?=
 =?us-ascii?Q?8Vlyi+posyg3jOH9fvIHAMNP2auDb/2xQ0IU7BmcXRFkpGwCbD9iTlKW3TsI?=
 =?us-ascii?Q?5H6uKXwqIhrMqAn1kVFCnSM9FuJaYI0xywFIDtO6Sn9sZD7+82WQt6FP/ozn?=
 =?us-ascii?Q?sO5dLe6Ut1+/10tV8FTEqu41ISeowZILTik4a8pjZJg8aV98jXYvlO88Sp8a?=
 =?us-ascii?Q?JSdV1y2mng+qa1mcNlx5X4c/ljtFQaHmSeUK1H2ts5d0ibKrJ4PPUu2Ets3l?=
 =?us-ascii?Q?D95bEKMF/MHabTUHhxaZQVC6F/I5Conpy0KF9/oIxqg7PybWeRNyysyagYTd?=
 =?us-ascii?Q?6gHg3Je3omxBpsVhlPR9j5D9zc+Q29TtFW5nD5jez/YPkGW+qCdKBDjpcyQY?=
 =?us-ascii?Q?CIec7pnqQwFklzBWJR8e4i+X+opBLLChO+NNEUtssM2ocl8zePteTkjnnyE1?=
 =?us-ascii?Q?bxyIGpGG6ct1lf5ytbofgVM0Z19+pbYFTVGVPIDpKOhbKccmVoSaLVaI/bKo?=
 =?us-ascii?Q?BFz+ZM6XhGf6C/6xx/QgMt6NeenfqFPiAZVBTXycXRyWEgQlXfOG6zVKmuRc?=
 =?us-ascii?Q?Pyd2xU+twBEbQFyUsK2lORxWJ3o3ymDaHiIDLZkjUFPXj+Q7hHKvV/NNDwhu?=
 =?us-ascii?Q?Ht9XqRhndQf7LP/Sgg+X3n9+c133pWmcLzyIsuzyBI6XC0Xpu3/b+z3vSQ18?=
 =?us-ascii?Q?+kOmpsOIHD89O9qcpwGC5CRLw092eNrasL/MZ1qoPSKY7VvS4IIOUf3Wyx91?=
 =?us-ascii?Q?XLlhipjTXVaczCRpx6OX1iGA5ec6RvvkK7jZ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(42112799006)(376014)(1800799024)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?EKB9mAbpjvRdIP7yPo6oGM5HHSCZN/vDpM5dMihk3WVqSKL3cbwMFKYzVSxD?=
 =?us-ascii?Q?o8+nJ3yst0g6InH+uwoHjqN9fCvCCzxdKigFvR0IaRyxnpzB9DyshH5Y9XxP?=
 =?us-ascii?Q?Yvi4+2737enXGTAYHR4PiS6g9yYABUZ3PJILDZJQg2CqE4Hdve1DaxbqiiAa?=
 =?us-ascii?Q?x3l31i+lXo/Hf0EsfHgnCeyxgpohTo3GAXT6eyoKqwRE8HpM+3n5fCQsaVH2?=
 =?us-ascii?Q?Q/jpFXqQC7aq69spE8pMQa31hfjRTh6hNFLtQy4SKAY5hPZc9yv5ni4Qajua?=
 =?us-ascii?Q?mZGXfZcFKwAr2hYNf162Fl27SHRMnmm3rSgUk5cguPnEuBJ5Ken1X+ESyYRj?=
 =?us-ascii?Q?klSjElTIeV8CfFNVWXA9nCC51lgeVs4f3fg1ilCYdFmruJPHIzD9FSFaVAl7?=
 =?us-ascii?Q?c4G0kFR8dfd3Vg6rtwCFvJdXJZNZG019O0uG9Y3iY8rpm/RbgTLYyQEsH6+d?=
 =?us-ascii?Q?a3oZD5y9TiglhIcPDd2qBNGb5/4D5fO3owINJVdxbyKDiuXRRBABl7Jo92hl?=
 =?us-ascii?Q?yISM6XyS/f8yDgiV5Bl0hOjbuOC6CkQJbkNhjiNibyP4kpd9R6nJRb/ekhOo?=
 =?us-ascii?Q?XlPS6RbKCL5/UcQlmrVViZ8w4sxOjXAfYnumzgH5NkI4GsNvSH7C0MEB61l3?=
 =?us-ascii?Q?t2vz49UJLMf96IBLjGGJFUndJXwS9ug5mj2ai40rhPZOw2/Si9QeD+1tJp4p?=
 =?us-ascii?Q?rpIR0mdJ06Q+hQz9ZI57DtE+eyXhJQZ4uwak5j6oXWAWuooKuwfn0ImhG4X/?=
 =?us-ascii?Q?cNLMQjZe/r4aZiRUKqlRNOtI+PaKtNLxZVN6BkkiIfSGNUStTzWWq6UPIFfw?=
 =?us-ascii?Q?XyxsT9B+Uk4E+B7nthxtA2vOkeUpS1JJ4jZL1O8pCClAtW02xqckQ5PAe27P?=
 =?us-ascii?Q?x1hf49fSze4PYY+z9F1OOEplYG01Yf3Tqztiy46IS96exYAhV42tRk7/KupL?=
 =?us-ascii?Q?kiEqEvCF8Vp9px8WXnx3yyFtJZfzdscZXN80thxZPkSQWuO8PLvFiSbAgYDS?=
 =?us-ascii?Q?cDWd2k4ahIWM41iouuOTsOQFsfhzFYmMcvRZSvjs3L5uk1R+hQ8ozyZAaPmw?=
 =?us-ascii?Q?yLlKtVQvmEPw9NDzGg/mUezSe5NAM4WEAcH/Du2LYq0GNY2Gi47ZRjzj37Dt?=
 =?us-ascii?Q?eklr+1ESSgKm2iwDFOsSNOt+RRQ3csCHEqhY271zBSUDSfZtmedEbrnGRKX/?=
 =?us-ascii?Q?NPPGs5WW+Ohz6In4BXCoiyG3hd3oXl7vkjRnkz/NnBYOCbDpYmyTStHa7J3D?=
 =?us-ascii?Q?pfRxSnxFIBL3InPZJ73Lnu5hSI8uOd8tPtk3FGAaf3Xz6GWPZCr7DcmCWD1j?=
 =?us-ascii?Q?wFXpr6Un06xU0FaDfFD+G/KoNDGMxh7Pnnl7plM71rbodWp8xJpLpHEFHPr/?=
 =?us-ascii?Q?UNf1cWYHWZBlU3BOg8tV3q4n/Bqu/Ybn6gxVXlx85uylghMYNlh/Uzf7sHCg?=
 =?us-ascii?Q?b5MzJL0igJypTbO2LtSwWArarH4c2Awl8dlkKjP/RnyXmw3XT7tMRyYQg3Bk?=
 =?us-ascii?Q?b+Uqd3SELvfz8i7b1K/v+msSWoyZYDdu+EcwVZKrKetlP1NuZYT+Bs0xTkzl?=
 =?us-ascii?Q?Q5x6Hr0nGhJMFvrIyKM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a32ad184-e9f9-49b5-22a1-08de23b0f8b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2025 19:06:52.6599 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r1WZzdi0cCOk0k4Cy/igpP4Z8706Ncrwtj/zWjcfnFANfg7Jv4+dikmd+Q9JZr8B2b+fqf4oGdLmgroAR7pafA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5272
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

Hi Jonathan,

Thanks for the review! I've updated the patch to only show the reserved ent=
ry note on Xe2+ and added the helper macro to share the PTA/ATS formatting,=
 then resent it as v2.

Thanks,
Xin
> -----Original Message-----
> From: Cavitt, Jonathan <jonathan.cavitt@intel.com>
> Sent: Friday, November 14, 2025 10:10
> To: Wang, X <x.wang@intel.com>; intel-xe@lists.freedesktop.org
> Cc: Lin, Shuicheng <shuicheng.lin@intel.com>; Zuo, Alex
> <alex.zuo@intel.com>; Roper, Matthew D <matthew.d.roper@intel.com>;
> Cavitt, Jonathan <jonathan.cavitt@intel.com>
> Subject: RE: [PATCH] drm/xe: expose PAT software table via debugfs
>=20
> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Wang=
, X
> Sent: Thursday, November 13, 2025 11:00 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Lin, Shuicheng <shuicheng.lin@intel.com>; Zuo, Alex
> <alex.zuo@intel.com>; Roper, Matthew D <matthew.d.roper@intel.com>
> Subject: RE: [PATCH] drm/xe: expose PAT software table via debugfs
> >
> > Here is the dump data from BMG
> >
> > /sys/kernel/debug/dri/0/gt0# cat pat_sw_config PAT table: (* =3D
> > reserved entry)
> > PAT[ 0] =3D [ 0, 0, 0, 0, 3, 0 ]  (     0xc)
> > PAT[ 1] =3D [ 0, 0, 0, 0, 3, 2 ]  (     0xe)
> > PAT[ 2] =3D [ 0, 0, 0, 0, 3, 3 ]  (     0xf)
> > PAT[ 3] =3D [ 0, 0, 0, 3, 3, 0 ]  (    0x3c)
> > PAT[ 4] =3D [ 0, 0, 0, 3, 0, 2 ]  (    0x32)
> > PAT[ 5] =3D [ 0, 0, 0, 3, 3, 2 ]  (    0x3e)
> > PAT[ 6] =3D [ 1, 0, 0, 1, 3, 0 ]  (   0x41c)
> > PAT[ 7] =3D [ 0, 0, 0, 3, 0, 3 ]  (    0x33)
> > PAT[ 8] =3D [ 0, 0, 0, 3, 0, 0 ]  (    0x30)
> > PAT[ 9] =3D [ 0, 1, 0, 0, 3, 0 ]  (   0x20c)
> > PAT[10] =3D [ 0, 1, 0, 3, 0, 0 ]  (   0x230)
> > PAT[11] =3D [ 1, 1, 0, 1, 3, 0 ]  (   0x61c)
> > PAT[12] =3D [ 0, 1, 0, 3, 3, 0 ]  (   0x23c)
> > PAT[13] =3D [ 0, 0, 0, 0, 0, 0 ]  (     0x0)
> > PAT[14] =3D [ 0, 1, 0, 0, 0, 0 ]  (   0x200)
> > PAT[15] =3D [ 1, 1, 0, 1, 1, 0 ]  (   0x614)
> > PAT[16] =3D [ 0, 0, 0, 0, 0, 0 ]  (     0x0) *
> > PAT[17] =3D [ 0, 0, 0, 0, 0, 0 ]  (     0x0) *
> > PAT[18] =3D [ 0, 0, 0, 0, 0, 0 ]  (     0x0) *
> > PAT[19] =3D [ 0, 0, 0, 0, 0, 0 ]  (     0x0) *
> > PAT[20] =3D [ 0, 0, 1, 0, 3, 0 ]  (    0x4c)
> > PAT[21] =3D [ 0, 1, 1, 0, 3, 0 ]  (   0x24c)
> > PAT[22] =3D [ 0, 0, 1, 0, 3, 2 ]  (    0x4e)
> > PAT[23] =3D [ 0, 0, 1, 0, 3, 3 ]  (    0x4f)
> > PAT[24] =3D [ 0, 0, 2, 0, 3, 0 ]  (    0x8c)
> > PAT[25] =3D [ 0, 1, 2, 0, 3, 0 ]  (   0x28c)
> > PAT[26] =3D [ 0, 0, 2, 0, 3, 2 ]  (    0x8e)
> > PAT[27] =3D [ 0, 0, 2, 0, 3, 3 ]  (    0x8f)
> > PAT[28] =3D [ 0, 0, 3, 0, 3, 0 ]  (    0xcc)
> > PAT[29] =3D [ 0, 1, 3, 0, 3, 0 ]  (   0x2cc)
> > PAT[30] =3D [ 0, 0, 3, 0, 3, 2 ]  (    0xce)
> > PAT[31] =3D [ 0, 0, 3, 0, 3, 3 ]  (    0xcf)
> > Page Table Access:
> > PTA_MODE=3D [ 0, 0, 0, 0, 3, 0 ]  (     0xc)
> > PCIe ATS response:
> > ATS_MODE=3D [ 0, 0, 0, 0, 3, 3 ]  (     0xf)
> > Cache Level:
> > IDX[XE_CACHE_NONE] =3D 3
> > IDX[XE_CACHE_WT] =3D 15
> > IDX[XE_CACHE_WB] =3D 2
> > IDX[XE_CACHE_NONE_COMPRESSION] =3D 12
> >
> >
> > > -----Original Message-----
> > > From: Wang, X <x.wang@intel.com>
> > > Sent: Thursday, November 13, 2025 22:54
> > > To: intel-xe@lists.freedesktop.org
> > > Cc: Lin, Shuicheng <shuicheng.lin@intel.com>; Zuo, Alex
> > > <alex.zuo@intel.com>; Wang, X <x.wang@intel.com>; Roper, Matthew D
> > > <matthew.d.roper@intel.com>
> > > Subject: [PATCH] drm/xe: expose PAT software table via debugfs
> > >
> > > The existing "pat" debugfs node dumps the live PAT registers. Under
> > > SR-IOV the VF cannot touch those registers, so the file vanishes and
> > > users lose all PAT visibility. Add a VF-safe "pat_sw_config" entry
> > > to the VF-safe debugfs list. It prints the cached PAT table the
> > > driver programmed, rather than poking HW, so PF and VF instances
> present the same view.
> > >
> > > This lets IGT and other tools query the PAT configuration without
> > > carrying platform-specific tables or mirroring kernel logic.
> > >
> > > Suggested-by: Matt Roper <matthew.d.roper@intel.com>
> > > Signed-off-by: Xin Wang <x.wang@intel.com>
>=20
> Non-blocking nits below.  But I otherwise have no reason to block this, s=
o:
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com> -Jonathan Cavitt
>=20
> > > ---
> > >  drivers/gpu/drm/xe/xe_gt_debugfs.c |  1 +
> > >  drivers/gpu/drm/xe/xe_pat.c        | 90
> ++++++++++++++++++++++++++++++
> > >  drivers/gpu/drm/xe/xe_pat.h        |  1 +
> > >  3 files changed, 92 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > > b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > > index e4fd632f43cf..ec279f005b10 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > > @@ -220,6 +220,7 @@ static const struct drm_info_list
> > > vf_safe_debugfs_list[] =3D {
> > >  	{ "default_lrc_vcs", .show =3D xe_gt_debugfs_show_with_rpm, .data =
=3D
> > > vcs_default_lrc },
> > >  	{ "default_lrc_vecs", .show =3D xe_gt_debugfs_show_with_rpm, .data =
=3D
> > > vecs_default_lrc },
> > >  	{ "hwconfig", .show =3D xe_gt_debugfs_show_with_rpm, .data =3D
> > > hwconfig },
> > > +	{ "pat_sw_config", .show =3D xe_gt_debugfs_simple_show, .data =3D
> > > +xe_pat_dump_sw_config },
> > >  };
> > >
> > >  /* everything else should be added here */ diff --git
> > > a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c index
> > > 68171cceea18..599fd8e0feea 100644
> > > --- a/drivers/gpu/drm/xe/xe_pat.c
> > > +++ b/drivers/gpu/drm/xe/xe_pat.c
> > > @@ -578,3 +578,93 @@ int xe_pat_dump(struct xe_gt *gt, struct
> > > drm_printer
> > > *p)
> > >
> > >  	return xe->pat.ops->dump(gt, p);
> > >  }
> > > +
> > > +/**
> > > + * xe_pat_dump_sw_config() - Dump the software-configured GT PAT
> > > +table
> > > into a drm printer.
> > > + * @gt: the &xe_gt
> > > + * @p: the &drm_printer
> > > + *
> > > + * Return: 0 on success or a negative error code on failure.
> > > + */
> > > +int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p) {
> > > +	struct xe_device *xe =3D gt_to_xe(gt);
> > > +
> > > +	if (!xe->pat.table || !xe->pat.n_entries)
> > > +		return -EOPNOTSUPP;
> > > +
> > > +	drm_printf(p, "PAT table: (* =3D reserved entry)\n");
>=20
> NIT:
> I don't know if it makes much sense to announce the possible presence of
> reserved entries to users where reserved entries do not exist.  Maybe:
>=20
> """
> drm_printf(p, "PAT table:%s\n", GRAPHICS_VER(xe) >=3D 20 ?
> 	      " (* =3D reserved entry)" : "");
> """
>=20
> This isn't a mandatory change, as leaving this information present in all=
 cases
> doesn't hurt.
>=20
> > > +	for (u32 i =3D 0; i < xe->pat.n_entries; i++) {
> > > +		u32 pat =3D xe->pat.table[i].value;
> > > +
> > > +		if (GRAPHICS_VER(xe) >=3D 20) {
> > > +			drm_printf(p, "PAT[%2d] =3D
> [ %u, %u, %u, %u, %u, %u ]
> > > (%#8x)%s\n", i,
> > > +				   !!(pat & XE2_NO_PROMOTE),
> > > +				   !!(pat & XE2_COMP_EN),
> > > +				   REG_FIELD_GET(XE2_L3_CLOS, pat),
> > > +				   REG_FIELD_GET(XE2_L3_POLICY, pat),
> > > +				   REG_FIELD_GET(XE2_L4_POLICY, pat),
> > > +				   REG_FIELD_GET(XE2_COH_MODE, pat),
> > > +				   pat, xe->pat.table[i].valid ? "" : " *");
> > > +		} else if (xe->info.platform =3D=3D XE_METEORLAKE) {
> > > +			drm_printf(p, "PAT[%2d] =3D [ %u, %u ] (%#8x)\n", i,
> > > +				   REG_FIELD_GET(XELPG_L4_POLICY_MASK,
> > > pat),
> > > +
> > > REG_FIELD_GET(XELPG_INDEX_COH_MODE_MASK, pat), pat);
> > > +		} else if (xe->info.platform =3D=3D XE_PVC) {
> > > +			drm_printf(p, "PAT[%2d] =3D [ %u, %u ] (%#8x)\n", i,
> > > +				   REG_FIELD_GET(XELP_MEM_TYPE_MASK,
> > > pat),
> > > +				   REG_FIELD_GET(XEHPC_CLOS_LEVEL_MASK,
> > > pat), pat);
> > > +		} else if (xe->info.platform =3D=3D XE_DG2) {
> > > +			u8 mem_type =3D
> > > REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat);
> > > +
> > > +			drm_printf(p, "PAT[%2d] =3D %s (%#8x)\n", i,
> > > +				   XELP_MEM_TYPE_STR_MAP[mem_type],
> > > pat);
> > > +		} else if (GRAPHICS_VERx100(xe) <=3D 1210) {
> > > +			u8 mem_type =3D
> > > REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat);
> > > +
> > > +			drm_printf(p, "PAT[%2d] =3D %s (%#8x)\n", i,
> > > +				   XELP_MEM_TYPE_STR_MAP[mem_type],
> > > pat);
> > > +		} else {
> > > +			return -EOPNOTSUPP;
>=20
> Aside:
> It's annoying that we need to check the XE version every iteration, but I=
 can't
> think of a better way of handling this, and it's not like performance is =
an issue
> here, so it's fine.
>=20
> > > +		}
> > > +	}
> > > +
> > > +	if (xe->pat.pat_pta) {
> > > +		u32 pat =3D xe->pat.pat_pta->value;
> > > +
> > > +		drm_printf(p, "Page Table Access:\n");
> > > +		drm_printf(p, "PTA_MODE=3D [ %u, %u, %u, %u, %u, %u ]
> > > (%#8x)\n",
> > > +			   !!(pat & XE2_NO_PROMOTE),
> > > +			   !!(pat & XE2_COMP_EN),
> > > +			   REG_FIELD_GET(XE2_L3_CLOS, pat),
> > > +			   REG_FIELD_GET(XE2_L3_POLICY, pat),
> > > +			   REG_FIELD_GET(XE2_L4_POLICY, pat),
> > > +			   REG_FIELD_GET(XE2_COH_MODE, pat),
> > > +			   pat);
> > > +	}
> > > +
> > > +	if (xe->pat.pat_ats) {
> > > +		u32 pat =3D xe->pat.pat_ats->value;
> > > +
> > > +		drm_printf(p, "PCIe ATS response:\n");
> > > +		drm_printf(p, "ATS_MODE=3D [ %u, %u, %u, %u, %u, %u ]
> > > (%#8x)\n",
> > > +			   !!(pat & XE2_NO_PROMOTE),
> > > +			   !!(pat & XE2_COMP_EN),
> > > +			   REG_FIELD_GET(XE2_L3_CLOS, pat),
> > > +			   REG_FIELD_GET(XE2_L3_POLICY, pat),
> > > +			   REG_FIELD_GET(XE2_L4_POLICY, pat),
> > > +			   REG_FIELD_GET(XE2_COH_MODE, pat),
> > > +			   pat);
> > > +	}
>=20
>=20
> NIT:
> Hmm... It looks like we're doing the same thing twice in a row, but with =
slightly
> different params.  Maybe that could become a helper function?
>=20
> Something like:
> """
> static void
> xe_pat_dump_pat_mode(struct drm_printer *p, char *preamble,
> 		     char *name, u32 pat)
> {
> 	if (!pat)
> 		return;
>=20
> 	drm_printf(p, "%s:\n", preamble);
> 	drm_printf(p, "%s=3D [ %u, %u, %u, %u, %u, %u ] (%#8x)\n",
> 			   !!(pat & XE2_NO_PROMOTE),
> 			   !!(pat & XE2_COMP_EN),
> 			   REG_FIELD_GET(XE2_L3_CLOS, pat),
> 			   REG_FIELD_GET(XE2_L3_POLICY, pat),
> 			   REG_FIELD_GET(XE2_L4_POLICY, pat),
> 			   REG_FIELD_GET(XE2_COH_MODE, pat),
> 			   pat);
> }
> """
>=20
>=20
> Then, in xe_pat_dump_sw_config, we'd have:
> """
> ...
> 		} else {
> 			return -EOPNOTSUPP;
> 		}
> 	}
>=20
> 	xe_pat_dump_pat_mode(p, "Page Table Access",
> 			     "PTA_MODE", xe->pat.pat_pta);
> 	xe_pat_dump_pat_mode(p, "PCIe ATS response",
> 			     "ATS_MODE", xe->pat.pat_ats);
>=20
> 	drm_printf(p, "Cache Level:\n");
> ...
> """
>=20
>=20
> I guess with some further modifications and some careful usage of the spr=
intf
> function, you could also use xe_pat_dump_pat_mode for the per-pat-entry
> GRAPHICS_VER(xe) >=3D 20 case.  I guess it would have to be renamed to
> something like "xe_pat_dump_[INSERT_XE_VERSION_NAME_HERE]_print"
> if that route was taken.
>=20
> I won't require this because having written it out, I can admit it doesn'=
t look
> any better or worse than what's already present.
>=20
> -Jonathan Cavitt
>=20
> > > +
> > > +	drm_printf(p, "Cache Level:\n");
> > > +	drm_printf(p, "IDX[XE_CACHE_NONE] =3D %d\n", xe-
> > > >pat.idx[XE_CACHE_NONE]);
> > > +	drm_printf(p, "IDX[XE_CACHE_WT] =3D %d\n", xe-
> > > >pat.idx[XE_CACHE_WT]);
> > > +	drm_printf(p, "IDX[XE_CACHE_WB] =3D %d\n", xe-
> > > >pat.idx[XE_CACHE_WB]);
> > > +	if (GRAPHICS_VER(xe) =3D=3D 30 || GRAPHICS_VER(xe) =3D=3D 20) {
> > > +		drm_printf(p, "IDX[XE_CACHE_NONE_COMPRESSION]
> > > =3D %d\n",
> > > +			   xe->pat.idx[XE_CACHE_NONE_COMPRESSION]);
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > diff --git a/drivers/gpu/drm/xe/xe_pat.h
> > > b/drivers/gpu/drm/xe/xe_pat.h index 05dae03a5f54..4a3045f74bfe
> > > 100644
> > > --- a/drivers/gpu/drm/xe/xe_pat.h
> > > +++ b/drivers/gpu/drm/xe/xe_pat.h
> > > @@ -49,6 +49,7 @@ void xe_pat_init_early(struct xe_device *xe);
> > > void xe_pat_init(struct xe_gt *gt);
> > >
> > >  int xe_pat_dump(struct xe_gt *gt, struct drm_printer *p);
> > > +int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p);
> > >
> > >  /**
> > >   * xe_pat_index_get_coh_mode - Extract the coherency mode for the
> > > given
> > > --
> > > 2.43.0
> >
> >

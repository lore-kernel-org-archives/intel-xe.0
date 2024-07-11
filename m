Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83ED9C3DA45
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 18:43:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DE9B10EB61;
	Thu, 11 Jul 2024 18:43:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q8fzTh0K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D73810EB61
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 18:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720723411; x=1752259411;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8vPdp7F6uB1xuFVkH1s4S/G8bFv9wYsq4LCrypGTA9M=;
 b=Q8fzTh0KCAY5hcTAVEDpPEQMvr/v2Vx8uInbQVzCinj9BcC0bqSEX6Fg
 ik88CgYqj6tVVrcMgYwXk8RIq7aq50CyHZbHk08mhWiEsfAd6Qjgg6lc5
 NX+eU3czGOQtGx99plSEv7iECvoGVT/M//GA2gX9r7P/OCsZoseW1MtEr
 LNt/O/u6w6Yhzi1wOwXeTWf3yO7G8A6wd9Nub+kR8Fa5wlQ3zYVb8zyZK
 jkOWzQCImq0m6s6cwdwiO1ZtSIU5DHZ/CZH9xHpV6Em34OuuqsCr80K8T
 Hho4yomT3GAX84rrf7YyHkNchEqyMw4Tbdl1fnFgOvEiN0GfmURJad6Up g==;
X-CSE-ConnectionGUID: ha6Nyjq3RUuJF9fTcyJZRA==
X-CSE-MsgGUID: qCyDSEUDSbe/zrLAcCbfyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="17750829"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="17750829"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 11:43:23 -0700
X-CSE-ConnectionGUID: c8Rpp1W0R/GLefgsVlpO9Q==
X-CSE-MsgGUID: XdNLTMINS4uHd2Tfe20ksw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="79352441"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 11:43:23 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 11:43:21 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 11:43:21 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 11:43:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W6k3MetxYQUNRLhG2JigFtKJvOCCtqpdBK1lr/7tnRbfrDwzdKOYMIvaMqNm/sePhBHQ40dhMJUZUZhkunpNoz+LiR0vkjEsU0dO0Rwz2qh7dvihlnHvrURk/41JrPgTkCcAkrmhTFgPb5ZmUvM/oDNEiT3R/7PlAUaxNm71scBm8ghUZd9tOL59IYxN5NkgKHARo+juyGmGGSN4ceo7C75XXsKKpQgm97Sv+64r3HzPohaz9L7ypWd7u88LBSOupeGoY+7/1DXhIKGTaJhfyWjHkwOftivnzpYiQrPJ5jWAnMCY0+xsWB/nmywDegoHgYZgrfezunpA2UU041/6ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dan/jd9Yto13Uq9G9zQgFwEkmcd1QgccuEri6Y4l7GU=;
 b=lF5kNya8eCu8Dj8SzMVDU+46gh1C14+Dw+c8V0VX4ungTZQB5hlhJNVcrai8aqDKMa2ComDam9Ia69jh7V3Gpt+bRk7VdsTSSw/nfFsLqnDVCBNJM+C845Uba9KzQMkFcHQS58XfKaGGyg2NYXaURH/TNMUJl5DKWRBKX3nJXxJhv2ojyseoRI4bIwdcFMjpLvzVxgKjWRf1+Dr5lFTg7xeXbjOduooTuXX35UQ41N3rJZ9azJVqABoc3KOwzIMhyqAD9NMKxaTk/xVWrYHRuIxf92dbHIPepSMT+4Vc9377D4L00t8fPbvRlpvoxWweASuiGLKa7JUalEWFnPI1dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SA1PR11MB6614.namprd11.prod.outlook.com (2603:10b6:806:255::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Thu, 11 Jul
 2024 18:43:16 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%5]) with mapi id 15.20.7762.020; Thu, 11 Jul 2024
 18:43:16 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 09/12] drm/xe: Introduce xe_ggtt_print_holes
Thread-Topic: [PATCH 09/12] drm/xe: Introduce xe_ggtt_print_holes
Thread-Index: AQHa07WeL6kcMkd0eUKfQiJ+l97Fv7Hx3JGw
Date: Thu, 11 Jul 2024 18:43:16 +0000
Message-ID: <CH0PR11MB54444B77E1B7D93CBD4FE151E5A52@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240711171155.173717-1-rodrigo.vivi@intel.com>
 <20240711171155.173717-9-rodrigo.vivi@intel.com>
In-Reply-To: <20240711171155.173717-9-rodrigo.vivi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SA1PR11MB6614:EE_
x-ms-office365-filtering-correlation-id: 343ec84c-0554-47aa-d321-08dca1d9539b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?aqGpB5DlgqvKbn+J0kuW++3j/VAacBp0dhXT5zgzBs2EtUR2yP7O2ahY9Qan?=
 =?us-ascii?Q?6EYM39dVRYymYVC6p1lvYNbI4on2Gl64HzB/x86o0dSVWjEsbqVOTFvvqc94?=
 =?us-ascii?Q?GR7SHkQ8fznUsxOARbitWyjuuIvh5D+TdKaHqz2BuaKLg9Gp8DLXvX2UImui?=
 =?us-ascii?Q?jfhsq8b04OPH85j6+LIGD2Pmdrjmd4kLWZdqXe9QaVgD8Xs4+ZjQuxK+wTTu?=
 =?us-ascii?Q?4u6LegZKQv/LqC5fsmgSVds59rANwidEpeVZbAEBXFPDS5hY3J5Vwbs1N7jS?=
 =?us-ascii?Q?oAUGmPcF1+Yte/cv3xH3qbTep0WpOJAHRa2olyUEy3pmwNu3izXQPdZPMGYy?=
 =?us-ascii?Q?antubHEaLpBgMok3liMuBBd3B+ZmRsBef+vFj1a0WMnN8aHcSxvpptH/d75l?=
 =?us-ascii?Q?D8usqe2cLiDmCixLxzBhhyy4rv6ZcDWx3Cww+i/UNy7y1JskshvAnc0ZzUu+?=
 =?us-ascii?Q?YHTihu/HFl7Nb5sinOKYg8mGXOXHRzPKYll+/ZAsHVrtIO20mmj/Pjaw19GC?=
 =?us-ascii?Q?UiDHgfliPpnaOw6V5vgexALc2Ji3lCOwqdS37UBCg2AOeiYslSpzWUC2tVar?=
 =?us-ascii?Q?cWodXCatgarseg6aAXnIXzIDCukUhGV2k6YQFAqrffQy0tiLNHbz27kVfU0r?=
 =?us-ascii?Q?ZQmoD8EdZBUmqBuM30f3FEvH5/xmu7nTd+msEjxXTGldjDxESAwX2rQunIVG?=
 =?us-ascii?Q?vUAaEGEmZru7iHjnP1EgjxOFY96Sx4y4Znr/hIez2DbgrsPjZ95cwXMgADhV?=
 =?us-ascii?Q?os0fxXVsetl9hEOKsEXECmrMd//zbaGHkHgwdzEfzgLTcwR+UgPBEfO+/u3E?=
 =?us-ascii?Q?x7lQyM3UkkS7W0CB8ntp24IkNXRMz6Lkk8pv/2zQdgzv+1AtN/jpOaaxykl1?=
 =?us-ascii?Q?ytSPsGC/HB7QTT0Mzkd/euitK58QzEZtIdlCho0Uyp/LJkt5ZK1N31Z9b6nm?=
 =?us-ascii?Q?eX8dbFsSqlBAV9A3QQaIX2eBF2OOtYiCxQw4DKBtXiT7WJXRTXSgJG5VHpdi?=
 =?us-ascii?Q?ZNeOjqXr3ChOglwDCvfC/kUHxCF6XzR04oE7QSGtSU4y5fPm7bX7VTvUdSrQ?=
 =?us-ascii?Q?4EIi89mWWdB/nfLOYzn6p9YZzsu6bgRf2iQz7hafhetIAhYl+Vu+gQKDFI5J?=
 =?us-ascii?Q?NbIy02LcRlV9DrQKOyTCzE/7mUUPasMn09J2ugkFCsbBWdPc1GHeoSpXdEe7?=
 =?us-ascii?Q?XbsI3lJ8Zvar/VjmU9IYsHfGPipsz8QFK6ahaQ44kikn6jMJyu8hrrsymopa?=
 =?us-ascii?Q?r9RnfzC90WtdVW5hcKR/U1DTD7z7L55FkCbQLN6Fse7Ty6enMjtv52sqOjHM?=
 =?us-ascii?Q?Bv1Oc4ZBA0opi1BiMIQdtkuWGlisqgRBYcUi/9n95AhG+V2SE1KtjNUuG2YO?=
 =?us-ascii?Q?WvlYRQtcgSYGiQp2aHG5rdC5nYjC74aVaBB8sFLFfOFqj+m5lw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mGo5LDTn7H7G3OjtwVvwVeklMrOxIlSo+1auxbttFHRyg4oKuQmsTLyWbJiF?=
 =?us-ascii?Q?yF9y14ra9mrhgaeI7dQGWtoOt+8grvT4lNgtv0vWKIxUffpW9hz3uxwTGfNe?=
 =?us-ascii?Q?x8cVfR6u4aJ9whkNFI1/jYAetR8RXjk0o+67nZLmJsvWvHqILUVzMQ09eebt?=
 =?us-ascii?Q?ZGErs9r4i52WHHbYM3QvQU6056JE3I3i1z72FxyfIXyoQz30+VeXf4P58L3r?=
 =?us-ascii?Q?3o0fQ+/f/lJjhyEDIA8jUs/He9TMHaUgNaAkOwR6kCuGsHSL2aUiIRMSEONW?=
 =?us-ascii?Q?f95+eiMwtWf1o0kbxN166hU70cCJwz6PHB5zrwXPqSHcBUHF/kVO/2JkbC50?=
 =?us-ascii?Q?cqTU7NZAMIZlzpgXQp/Ip99YJLH2wgFBPgmFViRPWf+XZGrDf9EW1twJx+Du?=
 =?us-ascii?Q?+Sf9xdUk7BxcSwbU8V4LivkKtM+Ipvizj1k9XW780LlPUBTutuzuvIks7C8s?=
 =?us-ascii?Q?vwwMEILJf1JEv0HJ+WV3HF2yk89OrjzRm1wYBUGSjPrqcZWGfhDCnzE6EXwr?=
 =?us-ascii?Q?koFdu61juHnJzudtIjE/bBHhu+RqM8B5WumYAjfDvu881YUEkOTtt4lo9XQl?=
 =?us-ascii?Q?DY8VzOIPrFWJVrEbUVF2+Px+fa8601akSwx7uZkydHAmlvf8ownrJPrfR8ii?=
 =?us-ascii?Q?OZa4P0qyHctakWLfIhXdDZle7FdKphgnENqEg8p19diIUQukSfFmMTZKeoOh?=
 =?us-ascii?Q?lmIyu+FY47CjloxWppT4bQBnhm/kik2wJgxRrw4Arq5DL5QIf7c7/TYbJgYW?=
 =?us-ascii?Q?sRwpRJeO014gJIHCep0Oi6Jv5W/UOb/ZYysqPTx4nrEfT3WjSHh8UkOdNSw7?=
 =?us-ascii?Q?iKAykcf23QGrrZw848a5aUO78HOJHLSOZlj2f/C1+40ftOy9z8McaERgVd6i?=
 =?us-ascii?Q?phvN/fFO+W+J9S8q/x90hJs2ct5/p2ZNd3WDoWT2tYKdU50adtEGSRQ89KMc?=
 =?us-ascii?Q?X//wkKNciRjGiPKeCWfp7glsiLO5GYi7ONh50Bl09P/QpQ224/EZv6M78wuL?=
 =?us-ascii?Q?Jv1eUhEg9ZI33t+qe8PbM9u7a/l3iCw5LpKCl4lLfPfr/l+BGGjDzZoi2M/6?=
 =?us-ascii?Q?GQO0zeMoj+uV46qTsNdu0uRFD+xeZKN3jdmMxoFhalHQ3PzOfFquiPj3EAKE?=
 =?us-ascii?Q?vMf5PZ/slZZkcz6K30heMH4ERjuhLOyiXXS1c9VsC/Xabg1M2kH9RhtvZIl3?=
 =?us-ascii?Q?cdRj/BCvwDQKYm956lQPEev6cdn7m5WHcE5DRqExY+YTo9OABoEivHxQ7RjX?=
 =?us-ascii?Q?WcTQRg9DxLYHlF20+FQD+LyYJpdPv0ZUjmvYczAN00ywBZwa3udfk2pRtGVV?=
 =?us-ascii?Q?bLJPNw8lrxkb/JhmAAzU8dF/SQ30136G82hVTiwHrXsQkTkul3Dt7twLvYUk?=
 =?us-ascii?Q?ns2fZxgISayU7yz22payDhK+LInMSxA7X8uEBfRLVNFzzFJjgXI6p3BPBzdp?=
 =?us-ascii?Q?hBp6Ctv4vvT+5vXTYV4lQeBR0NgSsWPYJVvGoHqMoJ1NMus9tCaDyC3WRJLj?=
 =?us-ascii?Q?QVBfUq4gMZVuVFW4S7JvB19n2j6CeJRIumUwIpK1wJxLRtIWw6I9VeUVrEZq?=
 =?us-ascii?Q?avmmz3IlTX3+bpklzcC3fwzWp6glXwitXIsJAYNqhDYVVUdD86gQbvYHwIYn?=
 =?us-ascii?Q?TA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 343ec84c-0554-47aa-d321-08dca1d9539b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2024 18:43:16.2109 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IftxNMcHfR6u9IRm1DCGQJDcPr35r9i1BrU5LqpEzp2Ab0TX/NhSujq89SJtIbE4tz/1XA4GtyBeHGFNI+Yx+NxEwQcLc4WO9NI7qLQgOp4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6614
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Rodrig=
o Vivi
Sent: Thursday, July 11, 2024 10:12 AM
To: intel-xe@lists.freedesktop.org
Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Wajdeczko, Michal <Michal.Wajde=
czko@intel.com>
Subject: [PATCH 09/12] drm/xe: Introduce xe_ggtt_print_holes
>=20
> Introduce a new xe_ggtt_print_holes helper that attends the SRIOV
> demand and finishes the goal of limiting drm_mm access to xe_ggtt.
>=20
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

LGTM.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_ggtt.c               | 40 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_ggtt.h               |  1 +
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 25 +-------------
>  3 files changed, 42 insertions(+), 24 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index dbaf1ce87fb4..5b51753fe1ba 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -682,3 +682,43 @@ int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_pr=
inter *p)
>  	mutex_unlock(&ggtt->lock);
>  	return err;
>  }
> +
> +/**
> + * xe_ggtt_print_holes - Print holes
> + * @ggtt: the &xe_ggtt to be inspected
> + * @alignment: min alignment
> + * @p: the &drm_printer
> + *
> + * Print GGTT ranges that are available and return total size available.
> + *
> + * Return: Total available size.
> + */
> +u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_=
printer *p)
> +{
> +	const struct drm_mm *mm =3D &ggtt->mm;
> +	const struct drm_mm_node *entry;
> +	u64 hole_min_start =3D xe_wopcm_size(tile_to_xe(ggtt->tile));
> +	u64 hole_start, hole_end, hole_size;
> +	u64 total;
> +	char buf[10];
> +
> +	mutex_lock(&ggtt->lock);
> +
> +	drm_mm_for_each_hole(entry, mm, hole_start, hole_end) {
> +		hole_start =3D max(hole_start, hole_min_start);
> +		hole_start =3D ALIGN(hole_start, alignment);
> +		hole_end =3D ALIGN_DOWN(hole_end, alignment);
> +		if (hole_start >=3D hole_end)
> +			continue;
> +		hole_size =3D hole_end - hole_start;
> +		total +=3D hole_size;
> +
> +		string_get_size(hole_size, 1, STRING_UNITS_2, buf, sizeof(buf));
> +		drm_printf(p, "range:\t%#llx-%#llx\t(%s)\n",
> +			   hole_start, hole_end - 1, buf);
> +	}
> +
> +	mutex_unlock(&ggtt->lock);
> +
> +	return total;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> index 31060fe7644b..67ae5f1602a3 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> @@ -32,6 +32,7 @@ void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_=
bo *bo);
>  u64 xe_ggtt_largest_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare=
);
> =20
>  int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p);
> +u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_=
printer *p);
> =20
>  #ifdef CONFIG_PCI_IOV
>  void xe_ggtt_assign(struct xe_ggtt *ggtt, const struct xe_ggtt_node *nod=
e, u16 vfid);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm=
/xe/xe_gt_sriov_pf_config.c
> index 1d17c34fe5a4..d0995680f53f 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -6,9 +6,6 @@
>  #include <linux/string_choices.h>
>  #include <linux/wordpart.h>
> =20
> -/* FIXME: remove this after encapsulating all drm_mm_node access into xe=
_ggtt */
> -#include <drm/drm_mm.h>
> -
>  #include "abi/guc_actions_sriov_abi.h"
>  #include "abi/guc_klvs_abi.h"
> =20
> @@ -2096,11 +2093,7 @@ int xe_gt_sriov_pf_config_print_dbs(struct xe_gt *=
gt, struct drm_printer *p)
>  int xe_gt_sriov_pf_config_print_available_ggtt(struct xe_gt *gt, struct =
drm_printer *p)
>  {
>  	struct xe_ggtt *ggtt =3D gt_to_tile(gt)->mem.ggtt;
> -	const struct drm_mm *mm =3D &ggtt->mm;
> -	const struct drm_mm_node *entry;
>  	u64 alignment =3D pf_get_ggtt_alignment(gt);
> -	u64 hole_min_start =3D xe_wopcm_size(gt_to_xe(gt));
> -	u64 hole_start, hole_end, hole_size;
>  	u64 spare, avail, total =3D 0;
>  	char buf[10];
> =20
> @@ -2109,24 +2102,8 @@ int xe_gt_sriov_pf_config_print_available_ggtt(str=
uct xe_gt *gt, struct drm_prin
>  	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> =20
>  	spare =3D pf_get_spare_ggtt(gt);
> +	total =3D xe_ggtt_print_holes(ggtt, alignment, p);
> =20
> -	mutex_lock(&ggtt->lock);
> -
> -	drm_mm_for_each_hole(entry, mm, hole_start, hole_end) {
> -		hole_start =3D max(hole_start, hole_min_start);
> -		hole_start =3D ALIGN(hole_start, alignment);
> -		hole_end =3D ALIGN_DOWN(hole_end, alignment);
> -		if (hole_start >=3D hole_end)
> -			continue;
> -		hole_size =3D hole_end - hole_start;
> -		total +=3D hole_size;
> -
> -		string_get_size(hole_size, 1, STRING_UNITS_2, buf, sizeof(buf));
> -		drm_printf(p, "range:\t%#llx-%#llx\t(%s)\n",
> -			   hole_start, hole_end - 1, buf);
> -	}
> -
> -	mutex_unlock(&ggtt->lock);
>  	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> =20
>  	string_get_size(total, 1, STRING_UNITS_2, buf, sizeof(buf));
> --=20
> 2.45.2
>=20
>=20

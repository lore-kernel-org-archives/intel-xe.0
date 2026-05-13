Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2BA0CD4F21
	for <intel-xe@archiver.kernel.org>; Wed, 13 May 2026 23:14:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8224910F0C2;
	Wed, 13 May 2026 23:14:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JZLGb6pR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3016010F0C2
 for <intel-xe@lists.freedesktop.org>; Wed, 13 May 2026 23:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778714063; x=1810250063;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=j9HIX50tnbjMZ0+rRyeI7JU40gfSnJoeY9ckiJ6+pGc=;
 b=JZLGb6pRKQI5J/+r84y5/ah6yOxse0M4Szzkm5SleyG8BCgn49zCtYfj
 2QMfumHTq1AzjXJYNc/vR/x84xdl1SweyOOdkt/CUDbI5G6cFMvFMCBR4
 Yc5ntkAmP0tBvhiislihfbdKU+3YjNxRK9VUFsdO0Sx7MEidAb+oLMJHp
 mhiYFJsPDIe/pR1qr2cNTBiyhPMCaxOPYcnkQeq4x3DRO4Njh+C+IKvO2
 KUaWlqZqjPunn1v4ZSZLk0hE0sXavABUI3RAOFjMDWiT6OGmjY8+1TneM
 m8NYESFaNpNxI8KZ35srZYthMG3FAh3UrXy8bowT64bMOMB8Ict5K+cPn w==;
X-CSE-ConnectionGUID: acyLRCA/RRitnfOHu3KiRQ==
X-CSE-MsgGUID: 9pQfx3iQTCq41WgEm+0oug==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79366597"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; d="scan'208";a="79366597"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 16:14:23 -0700
X-CSE-ConnectionGUID: OyJdj5LXR2O1Z1MDvAp17g==
X-CSE-MsgGUID: sfCi/2UZSgmmp9e7kbjEkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; d="scan'208";a="276313700"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 16:14:23 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 16:14:22 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 13 May 2026 16:14:22 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.9) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 16:14:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xtyi9DG/y+rmLgWFv22GUGS4Nx6cQoYuoP8h6gghjC6oBXdl2sKVXjHW4Zb09LjkL23bndutgClFnZhvlpKBm+F77w0QINnVG0FKMgO3/UsDRaT0YB+4pu5VcDo7xdoQA+U2xUVAPHjvbs6tFM7mdODY1moU0DnzwUgxC0MBUvYdjQrRqFJCzjM9zPk9V4S/3o32EGLth4cSrdk6dUU6XBEfVjkrAK/se0bmZ0QwzWa2qvT6ZjQmebnFk/WaQpwQBsUvwSHaDrSdJYKacxaB+ecnGRNxwTPSDu7eZKIvI2K6WD3Yzw+xVYtqGza8NxdHRX8YyDLF+YbUUx5MKA0R4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xBURk/LMQnSuIr2AwPTPNYPxJ00p2qjNd2JMisluTAY=;
 b=KyN/zOtI37jDbeqftvF/JrYTZJ1vuGSa3qXw6mqWDZa6lRvtdssSNUfSzTWg8UtGIQBX3F78c+3lCSiESpxjwW30PxrUnFNgR2ek/6qBDe/OaFKeCZX0+nLfGfjyHBaNN3kKdtsS2UDiJiTzCcdgpFCBC3gv6ZckGJ+d+Yv5npnWgCYoRqjLFZF7jfTgA9S8jHdOybCnlquM3TohhLG5WsgdbxQxOZrnQlXrH+HDA4JREEW+vzEYE+vOw/4a1Lr8FWs8ddb/2hyhrOn3Yml8FebOZfEnR5XxbPirXurdK7ENwoj+wkDC1eSRRPADLewM54W7nJpnaY6Of1OrxZqu4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA3PR11MB9464.namprd11.prod.outlook.com (2603:10b6:806:464::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 23:14:14 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 23:14:14 +0000
Date: Wed, 13 May 2026 16:14:12 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 6/7] drm/xe/rtp: Fully parse the ruleset
Message-ID: <20260513231412.GG2131374@mdroper-desk1.amr.corp.intel.com>
References: <20260430-rtp-rule-parser-v2-0-157e98b4ab51@intel.com>
 <20260430-rtp-rule-parser-v2-6-157e98b4ab51@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260430-rtp-rule-parser-v2-6-157e98b4ab51@intel.com>
X-ClientProxiedBy: BYAPR08CA0020.namprd08.prod.outlook.com
 (2603:10b6:a03:100::33) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA3PR11MB9464:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a1a660a-1a41-43ce-4e82-08deb145598a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|11063799003|18002099003|22082099003|56012099003|4143699003;
X-Microsoft-Antispam-Message-Info: 4lSLkzkEyND9MrJTsnYzPyzlsD2amfdMTK4UczPIydKMuZunGiUXNHgb277dr2F8AJ3Ml/+sTlucXlzHQpoJeXSAc/UuR2fiUQYcifGdlUBjMWsGWHa5MgJzTgfuZe8+/csuvsPdSJSvPLk4Fusg8Ax+uWViYPJSlPQdnUy5GReQpSjiIvX1F4lQG7jaACvQ7KotTnSdtqhyXdwKnCxoqwovRVLpdf7REWTNEg8R9j8XrIvDongaNnW5Y/ed57gja5CZIK8oOe/3NQV+9OesYqJtkx/e1tmi+vQL/uoNPRMT8v5iDHVI48JGMYz5jbzVxRzTV7Q7YND/XSgeSvbrA9JmY1rfz2I5sWC0fLwU8i7QAEyLv/HeRHax9Gx+PM+qiCivagpFdsL1Dmph8/6I4j7H1HxTdlNpIoT87aXGJ15Uh8VuuU9CNu9T7baA0sn01p2D4rHdpWtjXKBvtBcD7ICPwICtwQdhN4zvENy1wU2tWkpGUD5xF9WSW/zQMqhwQokFrqqmMGbCnBnnLzsobNHqvl/GkK633/AAZoq40mwxR5biPjAr157ow/rUtz2PQ6O7DQ+eSYL2XiwbDhSDj7Asq8YToCW+nZdwKbgT0lGP9OZFLo8oPN+BdKxpv0OlPhJr4rEdpoXUVzOykQW61zCSGxe0Ftxjf5uy7hknBeVW6vPzTJodj3gWrOhZLv7T
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(11063799003)(18002099003)(22082099003)(56012099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BTo+0J51V6jlp4S9meeNa5bQkOPn9idC+zFq5vXqE0ydbQvv8TIRaBN8SvUU?=
 =?us-ascii?Q?WuXeFu1zErWSpRBqWWeTGVQNjtzn2PmF8DN5pysyPESdA8pqspmvyFNkF7+V?=
 =?us-ascii?Q?b+mDMCdRe4EKPSNNXAuFdunPgX0+GDX5eNYo+GIIDLKceQAAbqy9wL5Z4Gxg?=
 =?us-ascii?Q?yTOxn0Gj1HKTdAoQoHBdCFd9A8bLhAk/gv3uuzzm9hZlqjzdsRGRPTUA7jPf?=
 =?us-ascii?Q?tD+pIqBt13Xr4Qzfk8YDxsqb9D0u+vy7p1GztWhLUXanxxPFkwUgxErfezKZ?=
 =?us-ascii?Q?NQSulwCS1AidNHFIxh3eXjqJKsratdbn9JQEcUumhVMsIa/0nqPHt3AvMO11?=
 =?us-ascii?Q?g7KQRouGPmxUdzuiG8PsgtEpjZ+Y79JWttiNcY0XeTSt7HIaz/gThwZEBas1?=
 =?us-ascii?Q?LjYjYaWr7N83c/8EHLvJNdzNgg4VlQINYJNIYmCFjodITjsqlcMXHC4pCffI?=
 =?us-ascii?Q?kvj8Qj6I5Nieu3sOpxs8IcKBEUy2zH4o+cS0OvTGT6Uhiw+/dKC4ZNlGRnJc?=
 =?us-ascii?Q?f+SkD+fhqqkJW2nzLTZkvoZqYNn3WfXUt1uF3WtrQzdkqOR8QQxMPSo+89bZ?=
 =?us-ascii?Q?mSGTYqJmQhbc0oV2z7Rpu3bs15j1YtoTSSBh7Sen2+imTHnjvUcpjPghFmW3?=
 =?us-ascii?Q?YbqViqntdXuvdPlEIUwyAW8gK0FSXFjHEuQj6PeY/Va5SKOMPf6Eq6YGkvcj?=
 =?us-ascii?Q?qQb7iWCthYR18VW2HH9kCFHyG542LqYPBPqXu1lQXZw2+UaAAFvzIXflynuc?=
 =?us-ascii?Q?SDx8CtWlX+O8aYQNh8PYOQvcz0emyzP1rFjWmVdvsMOaUJPSZMuT94UrHLU+?=
 =?us-ascii?Q?rUjYeT5A4j2VwBaawUt61mcMLvR8X8rCTCq2NSc2WoUvUusSkWGPJtUGEAnU?=
 =?us-ascii?Q?1n0kAiGQHkbjF5JTOPbeBusboMmK/8xYETL27LDpb2B2xjXZyuvapMwdjsKO?=
 =?us-ascii?Q?ffS3tEnZNCTSfS0Gd10tACtIiaonKHJuBNTBmj9uazuiq7ydqzFh02fPIwmJ?=
 =?us-ascii?Q?TxaVl1+8Zd4+5LYZDAWtIbcpYrPS78Woa6DM/Czfurhnq0G3D5NXqR1yKTkV?=
 =?us-ascii?Q?1sOBO5Z3RfhUz29INv2dev9OMwwBaZF3+i7X4sCNz8moL3yufiunqxicrZ8l?=
 =?us-ascii?Q?bQTg96baDSkIENeYTh9TSOfUbZmIT5O+oBYh53O9NK7WM2dsQYeikt2FuJCE?=
 =?us-ascii?Q?SzzGIVSN9Bwdi3rzQz/AJoJXDzh3piSpbPRdr1Pk3QqXJTIPATLjNJP8diYO?=
 =?us-ascii?Q?JUQo2Ib5m1Hs6EZLzINZnDwr0JjXcGGrjOjZ56/Tr/0fyTJxUXrPjJXqvOrZ?=
 =?us-ascii?Q?9ug2iN9cJhwAWQFcHOS0ogYaEcFy0Yat4rS+dYhv1Hv6MIVHhbTWMeVLZ0Ej?=
 =?us-ascii?Q?iJ0gED006/w+tP05EznpYM58gKi3zy1twnP0r5DtjSKPfyngdMpuG0i+JaPJ?=
 =?us-ascii?Q?Z3K6pULJ1SWcG7bqI59X+czrXiKWaC42gniEhNZdOnfWBNA4SdHp3x0kGgGU?=
 =?us-ascii?Q?BvrAIF1awwA8Jn7M3fqdtNjk74JDIPumtqPMVXQm5DuoJUuCz6gJLjboSD/3?=
 =?us-ascii?Q?IqupIfW0trdqJDvcR1VXPakJ0oflYqdZXtbxSig0IQGp6wSd4k6BgZjLpASY?=
 =?us-ascii?Q?Q2szBPs0gvFsMBYD2WMcWQfmSNFwgEq3MTPWd2jobmgif2TIf9r+spmGNDrJ?=
 =?us-ascii?Q?lM7MJ0/lBlZoTx8w1b7iJDO8Ec84ZFSficOX3yR0/o91iV2Z7i+itcPyKVJo?=
 =?us-ascii?Q?9XL9XhBoJ1Bl5mspcTmBtPKx6ZOAZLg=3D?=
X-Exchange-RoutingPolicyChecked: I5dtFxj0obHy8iNvc/s6CmqluJ/Iq941I0v4UQs3i8niYgQ7/OP5NytljekjRCHDQCSIOX9eyTJHk3scQw0qB/+9iFJljy99Ohf2a5k/2UNfwfESVDuk9SCizzsQZ+XgT8y5NAOz9K96vDnuEmbRGzqkK6mrMkqiajp9UlDm4OL1kI92sjydPC13qsQ+XtfIc/4mTrioYsaVnowKwuzqEqdCR93vlcZPaZbXVXJhPAVW8u7Qh/IDrCkMCcq29D+4940BgkS7xNzvZsuT1JQTZA3seWOp/LP9yEhGv75/FVRMtYP69+M67oXB6IgFexLiL7efjDV32U6GLM7XUDbOug==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a1a660a-1a41-43ce-4e82-08deb145598a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 23:14:14.7545 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RXi4dS4QaPjweJl1Ovt97hBYfPJEb4PnSd041vETpPRPiBa+wOb+e+psMnDW4JhgE7saUZ4mhukeBenFl/5D3G5Af8xj/C3i3PKBhYhBAcI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB9464
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

On Thu, Apr 30, 2026 at 05:20:07PM -0300, Gustavo Sousa wrote:
> The function rule_matches() short-circuits evaluation of the implicit
> conjunctions (each substring of rules not containing OR) and the
> explicit disjunctions (implicit conjunctions joined by OR). In other
> words:
> 
>   - in a conjunction, once a rule evaluate to false, we skip to the next
>     OR (if any) to evaluate the next conjunction;
>   - in a disjunction, once a conjunction evaluates to true, we return
>     true and skip evaluating all the remaining rules.
> 
> While this behavior results in a correct logical value, due to how the
> "OR" short-circuiting is implemented, it has the side-effect that rule
> set does not get fully "parsed", allowing incomplete constructs like
> (rule1, OR) to evaluate to true when rule1 is true.  We should treat
> such constructs as invalid and treat them the same way we do for stuff
> like (OR, rule1).
> 
> As such, update rule_matches() to "parse" the whole rule set, and that
> while keeping the short-circuit aspect of evaluation.  With that, we can
> fix the FIXME test cases that cover that behavior.
> 
> v2:
>   - Do not change short-circuit *evaluation* behavior. (Matt)
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/tests/xe_rtp_test.c |  6 ++----
>  drivers/gpu/drm/xe/xe_rtp.c            | 26 +++++++++++++-------------
>  2 files changed, 15 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> index e009c1243b7c..3429c5d1b5b6 100644
> --- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> @@ -186,8 +186,7 @@ static const struct rtp_rules_test_case rtp_rules_cases[] = {
>  	{
>  		.name = "yes-or",
>  		.expected_match = true,
> -		/* FIXME: The parser should raise an error here. */
> -		.expected_err = 0,
> +		.expected_err = -EINVAL,
>  		XE_RTP_RULES(FUNC(match_yes), OR),
>  	},
>  	{
> @@ -205,8 +204,7 @@ static const struct rtp_rules_test_case rtp_rules_cases[] = {
>  	{
>  		.name = "yes-or-or-no",
>  		.expected_match = true,
> -		/* FIXME: The parser should raise an error here. */
> -		.expected_err = 0,
> +		.expected_err = -EINVAL,
>  		XE_RTP_RULES(FUNC(match_yes), OR, OR, FUNC(match_no)),
>  	},
>  	{
> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> index c49f80f398af..976a2e1f5592 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.c
> +++ b/drivers/gpu/drm/xe/xe_rtp.c
> @@ -129,6 +129,7 @@ static bool rule_matches_with_err(const struct xe_device *xe,
>  {
>  	const struct xe_rtp_rule *r;
>  	unsigned int i, rcount = 0;
> +	bool short_circuit_or = false;
>  
>  	if (err)
>  		*err = 0;
> @@ -143,13 +144,16 @@ static bool rule_matches_with_err(const struct xe_device *xe,
>  
>  			/*
>  			 * This is only reached if a complete conjunction of
> -			 * rules passed, in which case we shortcut the other
> -			 * rules and return true.
> +			 * rules passed, in which case we short-circuit rule
> +			 * evaluation, but still keep parsing to find any syntax
> +			 * errors.
>  			 */
> -			return true;
> +			short_circuit_or = true;
> +			rcount = 0;
> +			continue;
>  		}
>  
> -		if (rule_match_item(xe, gt, hwe, r)) {
> +		if (short_circuit_or || rule_match_item(xe, gt, hwe, r)) {
>  			rcount++;
>  		} else {
>  			/*
> @@ -166,16 +170,12 @@ static bool rule_matches_with_err(const struct xe_device *xe,
>  		}
>  	}
>  
> -	if (drm_WARN_ON(&xe->drm, !rcount))
> -		goto error;
> -
> -	return true;
> -
> -error:
> -	if (err)
> -		*err = -EINVAL;
> +	if (drm_WARN_ON(&xe->drm, !rcount)) {
> +		if (err)
> +			*err = -EINVAL;
> +	}
>  
> -	return false;
> +	return short_circuit_or || rcount;
>  }
>  
>  static bool rule_matches(const struct xe_device *xe,
> 
> -- 
> 2.53.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

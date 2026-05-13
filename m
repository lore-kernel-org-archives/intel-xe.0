Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DFB6CD37AC
	for <intel-xe@archiver.kernel.org>; Wed, 13 May 2026 21:52:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CA6010E13D;
	Wed, 13 May 2026 21:52:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ftcqd/6f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59BB910E13D
 for <intel-xe@lists.freedesktop.org>; Wed, 13 May 2026 21:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778709152; x=1810245152;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7s2kfJ82Gc/RgoLowVpdNe2Gn9tzCzkN9KrpoOrGXfE=;
 b=ftcqd/6fKRjRQfGTHq/y++3orQ8U80B6B0706c8domiq1mAYCQVnbaM6
 dgX/wqHyGUOOaEOzCxlHydV8OBW2Esw91gtMz/VglPSfb2k6u8zgbcJPT
 yWEmtAEMmgAFnuSTtFdhNODU+vUnwYD70Rtf1BV9x0kGDlcAd1VkdYh08
 A9INyhbeYEos/rXP3mG98TTzhWByiTPDdDXvt5UQbeNFfUusaSrB9lZq7
 JEQfHA2CZ1gnuKNZRAx75ZAAlq6Kh1dS5sZpCHe/1MUp4RVzS/TfBPbxt
 0eJjF9XlRZ+HdP62Zu67K4eh/EYaFW8oQ465/DJmhtBv66pqJyA0lUUmc w==;
X-CSE-ConnectionGUID: SWZFTvz8QdueyGd3MEFhqQ==
X-CSE-MsgGUID: MsGRk1jcTCiH2fw22FuFpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="97073894"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; d="scan'208";a="97073894"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 14:52:31 -0700
X-CSE-ConnectionGUID: kzt7zZ3DTby6bqpgCG9wOQ==
X-CSE-MsgGUID: Zmmdn5k1Q2yxhn+ESpaREQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; d="scan'208";a="242200272"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 14:52:30 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 14:52:30 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 13 May 2026 14:52:30 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.12)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 14:52:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XgLP/sh06BFGsSNLYD0OYaETPW8uypkn6y1dsmbnTFYO8apYtdD2m7u40HtIHANH6E4bJXtSZtRQzWeMuQqvPaQJaVdscMPPIqSnwHbD2YqCDHWzBRF40kCTjmxp2hE+SK/e0vvSO3Mqd4yC2V0gY1GDHh3nU+BmjPiJKtwD1sFQ7oZh1RQUsT88VGv0OqVyDyRGMFVFMouG48K1RJhBylv3kgSFkchuP0Qo/fUvNfyHsR0bFXRPvj4SzDP4+L50J0XDNOtOmN4gdZm1nMfwy2ATepulAVUTO9mvgaI6nDAnT1lA5J4nTYo0350twEchAn4BoHQFK3JgZfBCbGiFPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m3bYnuPyjA+UyNq6b431fScugaY1uru0CorlHZKBaN8=;
 b=JW70DtuDTzywWxHrZ6Lf07XUeq05GWAhlcTrpZT+RAuUxUVY/99d2dA3PxRiOWYG14qNURmhrY8a3dwbM/LKOz1pUrLYOz36eW1IaGwP5BkwcuOiUaxjg7/3XMXa1gf2OC6eJvCicG/V5BsiTvyJrCXZY9e8FqIZwIWBFW+SY9sT9Qg32UzICknLMQvw8+bLw57cxyJUbdYLyeKDnMu+ZXxjML8RiSmcWeC/iopUkHifcQ92X0YTKOJJT2JaMWqKUm/oBo+q2gqu90Z1QpL+6UrsAjeSUYku19KFZUwdLb58lP3QnDUVbJyZxt64BnszC+Ko4tmMDYk2JlORx4xnZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8284.namprd11.prod.outlook.com (2603:10b6:806:268::21)
 by IA1PR11MB6074.namprd11.prod.outlook.com (2603:10b6:208:3d6::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Wed, 13 May
 2026 21:52:28 +0000
Received: from SN7PR11MB8284.namprd11.prod.outlook.com
 ([fe80::65e5:898b:2231:bf65]) by SN7PR11MB8284.namprd11.prod.outlook.com
 ([fe80::65e5:898b:2231:bf65%6]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 21:52:27 +0000
Date: Wed, 13 May 2026 14:52:46 -0700
From: Violet Monti <violet.monti@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v2 3/7] drm/xe/rtp: Don't short-circuit to false in
 or-yes case
Message-ID: <agTyrk6EjLeFVEp6@vmonti-desk>
References: <20260430-rtp-rule-parser-v2-0-157e98b4ab51@intel.com>
 <20260430-rtp-rule-parser-v2-3-157e98b4ab51@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260430-rtp-rule-parser-v2-3-157e98b4ab51@intel.com>
X-ClientProxiedBy: MW4PR03CA0242.namprd03.prod.outlook.com
 (2603:10b6:303:b4::7) To SN7PR11MB8284.namprd11.prod.outlook.com
 (2603:10b6:806:268::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8284:EE_|IA1PR11MB6074:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c7ddc5b-cc43-4db7-d924-08deb139ec96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|56012099003|18002099003|22082099003|4143699003|11063799003;
X-Microsoft-Antispam-Message-Info: nZsMieAQPvCbehpXW2abelU2RdfEaOqKPyq6cQGFIM869UYD9KLx4vBrrvyfNsmnrPXuOIb6am9W13oOaGJa6U56mdc1we5cSQP+01pIbcw6FQBG2ZETd7n/7U1p9/TIsUWLbdiDUE1W+1WCHVgz64LYFdlLDbuHKHfhz2+018FIHYXlBq7UG7CbIK6NbAd3732xF8tAQhOKg4VGL6C42LiEZWFx9DPBuzX+ZbrZ9slD8eF4ONF2g3BnYLqOrYNWInL16VXgZ2Gm2LckAP8D4If4I+g7bpUManQs5wzsYY6+R/XrqVdgdIaomz2ZzyaOeaCys+uZyifWiLEaY52eDBx28Z2DudLy5KkAYcpPAu4JjgLZaZVLOFwztBPQlk5MphNd799ZhXPsq62Wr7eFKqS4n/uvHSvmEy/KrcHOvhg8edk1Widro5/uvOp60+pExMRWem28H8DvwcBRPGJbFpyhguX5yWzkQG2iqcGFjvDFy8F9wpwqJFt/a6xcASzvmC9qPcJ5IcRv0oMcetQ1ctZSpeNhJIZCnVjDS1KN74Nsz+PPJyWWCrFRnvVit2e0jaMBDvT9eTsBQ+ZkW2+qK3L7RR3FsgfM9TnCA9/yqv+L/m02JO+8Hm2WSOdaIddCwK7JYUdjfmNQ60jfEAd5ywh5NN0F2FMBsGtVUkuIpQFbXeJZ9Od/DG55SglR0gBJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8284.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(18002099003)(22082099003)(4143699003)(11063799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l8/OO8hZlVPInja48qPHbv4sKrUayeruD98krJLBVIVeFIsc76AdrcyJxjsP?=
 =?us-ascii?Q?XNi91uU/d0wyiHiukDpO2Tk9ODBimZf8cS5Rl83pSjuqY3rSovESz21k1Czt?=
 =?us-ascii?Q?dnne99QgteFI7/CNSX0InD3po030OleKktlvfLcohFmO4sUtub9hhZUJxPxY?=
 =?us-ascii?Q?0OMZoCXLS1d/0H7/ab1OnTPyaPLktVjObJV4qaD/2eio6GGDMHZ8e18A1bR4?=
 =?us-ascii?Q?fxLgSO5rOBscr+oCTgfPOLtCdgLDwWE4oR1AzBJkvpr64kG3nO1wvSTBRxQ0?=
 =?us-ascii?Q?tEzS/pkyipwtetAmCy6RG59bemaaHT1mLQx6Z8Wkqo/AFeL5MISeGwCJJbiK?=
 =?us-ascii?Q?0okFi9OYC79+fiXSldSaRHAwRD7hZmel2RnOXcvBxOFanjuqL6vxkRno0om/?=
 =?us-ascii?Q?ViYdAceOE09KyMkaatc7LUDMOcRiEazDR3GDIA13/05/Kgr7XlCkFQYBUOBA?=
 =?us-ascii?Q?u0RodDFORGO2VbubQ/VqJklqV2PIyN/JakHdvfCWHnKfrFeJn4uj2mr2bAhP?=
 =?us-ascii?Q?Mtjz0TUukFlUB6Bbk7r/KVx8EhNXi9Ty3P+182JKMi2oZdkTGNhoGtVOhTgq?=
 =?us-ascii?Q?9gM8sT8y+gIjt3VItIEzRFKVPsk/AI3sHuZ1giozN6z3APmdGOFyoy+pT0O6?=
 =?us-ascii?Q?Hlcv7x4y0Q5nrXLPcYSSwkVsCt1DCZPsVmXGvcANUq+CyPwC/OFAHqOaNzti?=
 =?us-ascii?Q?mgmHcy3HMLUHpFPRoIpRxmhTeLI5Ma29AwnbtZBAeLYRuj2rs+LfTg9ORJEW?=
 =?us-ascii?Q?dJOlFEYK1+uExQWw70t+91/nrU0cnR4xSnO7fzd7MopuMXDXOR1iaQ5TiZBH?=
 =?us-ascii?Q?TLjCkcn85Ro0iG/yXn2t0fr0pZ52Bz0Lfn/LjdWCdRw5Xfg3k26oj755+L7m?=
 =?us-ascii?Q?Hxq4x+wo4nP6p/DpG9ZKuObv0g/uqzn4sOLz5o8iiwcCr7/akMQ+Lk4ltiMW?=
 =?us-ascii?Q?lIaGKyNPKYyaEAqmwL+UBfE57jjrVCrKU5VWfJ3p81vLHn8n9C3RJh+C3oIh?=
 =?us-ascii?Q?kqM0h2B9oP/TqkZXQwPpdSke+NMI6jLRoadrCd/dy4IwZppYcb1tij3JbV0L?=
 =?us-ascii?Q?tZgbXq29l2gij3Ok9w2koM7lch87WnZ5DdW8dw7dZciMqFY1WEr1kHfv7SOO?=
 =?us-ascii?Q?AidVfuH8/xbtK5ZGdH9XhD18tg+mHXMUxjlrJrPhSJwbd0wYWE1S3ApV7n86?=
 =?us-ascii?Q?EX3xoUF5vSGtmN/fLb2JxlwX1YP7WghXkWULqcHL4KpGhQ+aV32wyPppukSO?=
 =?us-ascii?Q?h4JJItXxbfevWR0Xa6Y0QhGHfQ4fUnSPv6ZA6zmxqkuK1BXr28iBDZy+FZ9Y?=
 =?us-ascii?Q?mI4FmazT0J5z5AL5Y8jh24lcck+oubgFWempmt7mmKXWOSiTrYIE3p3LTliX?=
 =?us-ascii?Q?qO+OH1V1D/pk7O/TUwmFrREXK+A/zQSMZ/4/K2uMJFupGHZftJL7pPpL5Juh?=
 =?us-ascii?Q?lqZoa+POQ81PhwBSkpH1HwKfiWuGS2neIXO/QsE3QwVlfv+UL+u2olhlhXks?=
 =?us-ascii?Q?SUPqXVhKJ72925532nc4mFR1krB06NKgoWpRYA2eAwxnzdjKcxDt1MWjfB4d?=
 =?us-ascii?Q?CnEuBRvzBS8CmtWTABpq7GOkxjGX8xeDU253u43v/vUZVU8QseMGMvRlJX72?=
 =?us-ascii?Q?c9P7TQOQJISIDNemmkfzJY1VOOKiySbbgeMW3JFXoKaRQDcpH4asTuUsPGJt?=
 =?us-ascii?Q?0zGD6ieWdvyDIGgG9Jp3r1h7RCOVnuMwZIOnjZQ5xIh04FqqeN94JJZ9BVoL?=
 =?us-ascii?Q?2NzxgPJQmA=3D=3D?=
X-Exchange-RoutingPolicyChecked: J9yi+ok+xoKirIXGbGExDTvENmZUOJ9L9iNQdAutnurG++bY6QXjbRTsqAk3ZBfygv1248L8QfHA467Ozg7px8OAnuSRKXCAaFRIvjQeRJPURyUswgfnqU0mx02HIEaT65p6ZZLI/n3Hu75/scgNwf1qNNEXIIPY25DqaYdUpJqZ4ZEkeyYZGdJ5yE2v1d66PThIT8wC8m+Gn5Y6aTnaZB5e6jpdYQC8wdSg8gG/ycDJ2y3CaItHqW2yUQupmERz2ZpwoU6IMEaJ39G0ST4OxVH3wItHJ1DzHWcbby4OMk2V+alVRq6gj+ERZyyefBdtFScfVy3WrLngxsFd+RdcAQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c7ddc5b-cc43-4db7-d924-08deb139ec96
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8284.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 21:52:27.5252 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bA65HhSvVO5qoQnHeSUt0K7sq8B0UXn5wMiIjG3BshFACHSdhfULhzUb8S0+v1sQMME6O0CUUs80dNrBsW+baw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6074
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

On Thu, Apr 30, 2026 at 05:20:04PM -0300, Gustavo Sousa wrote:
> While RTP processing evaluates true on the "yes-or" case (i.e. a
> conjunction of rules that evaluate to true followed by an "OR" without
> the right hand operand), it does not on the "or-yes" one.
> 
> Both cases are considered malformed and could be a result of someone
> dropping checks deemed not necessary anymore and forgetting to drop the
> superfluous "OR".  Nevertheless, we should aim for consistency, and
> having the "or-yes" case also evaluating to true while also causing a
> warning seems reasonable.  So let's do that.
> 
> The "or-yes" pattern being evaluated to false comes from the fact that
> that we unconditionally short-circuit upon finding XE_RTP_MATCH_OR on
> the outer loop.  We should only do that if the preceding conjunction of
> rules evaluated to true (meaning that rcount must be non-zero) and
> continue the evaluation otherwise.
> 
> Do that and also add extra test cases to validate the short-circuiting
> behavior.
> 
> Notice that some of the new test cases have a "FIXME" comment, which
> comes from the fact that we are unable to detect syntax errors after the
> short-circuit point.  That is going to be fixed in a follow-up change.
> 
> Link: https://lore.kernel.org/intel-xe/871pfw4lo9.fsf@intel.com/
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Reviewed-by: Violet Monti <violet.monti@intel.com>

> ---
>  drivers/gpu/drm/xe/tests/xe_rtp_test.c | 42 ++++++++++++++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_rtp.c            | 15 ++++++++----
>  2 files changed, 50 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> index 7dce699991a1..5e0afde9eab4 100644
> --- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> @@ -172,11 +172,49 @@ static const struct rtp_rules_test_case rtp_rules_cases[] = {
>  		XE_RTP_RULES(OR),
>  	},
>  	{
> -		.name = "or-anything",
> -		.expected_match = false,
> +		.name = "or-yes",
> +		.expected_match = true,
>  		.expected_err = -EINVAL,
>  		XE_RTP_RULES(OR, FUNC(match_yes)),
>  	},
> +	{
> +		.name = "or-no",
> +		.expected_match = false,
> +		.expected_err = -EINVAL,
> +		XE_RTP_RULES(OR, FUNC(match_no)),
> +	},
> +	{
> +		.name = "yes-or",
> +		.expected_match = true,
> +		/* FIXME: The parser should raise an error here. */
> +		.expected_err = 0,
> +		XE_RTP_RULES(FUNC(match_yes), OR),
> +	},
> +	{
> +		.name = "no-or",
> +		.expected_match = false,
> +		.expected_err = -EINVAL,
> +		XE_RTP_RULES(FUNC(match_no), OR),
> +	},
> +	{
> +		.name = "no-or-or-yes",
> +		.expected_match = true,
> +		.expected_err = -EINVAL,
> +		XE_RTP_RULES(FUNC(match_no), OR, OR, FUNC(match_yes)),
> +	},
> +	{
> +		.name = "yes-or-or-no",
> +		.expected_match = true,
> +		/* FIXME: The parser should raise an error here. */
> +		.expected_err = 0,
> +		XE_RTP_RULES(FUNC(match_yes), OR, OR, FUNC(match_no)),
> +	},
> +	{
> +		.name = "no-or-or-no",
> +		.expected_match = false,
> +		.expected_err = -EINVAL,
> +		XE_RTP_RULES(FUNC(match_no), OR, OR, FUNC(match_no)),
> +	},
>  };
>  
>  static void xe_rtp_rules_tests(struct kunit *test)
> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> index 0e1adf07e4e7..299fa4209a26 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.c
> +++ b/drivers/gpu/drm/xe/xe_rtp.c
> @@ -47,12 +47,18 @@ static bool rule_matches_with_err(const struct xe_device *xe,
>  	for (r = rules, i = 0; i < n_rules; r = &rules[++i]) {
>  		switch (r->match_type) {
>  		case XE_RTP_MATCH_OR:
> +			if (drm_WARN_ON(&xe->drm, !rcount)) {
> +				if (err)
> +					*err = -EINVAL;
> +				continue;
> +			}
> +
>  			/*
> -			 * This is only reached if a complete set of
> -			 * rules passed or none were evaluated. For both cases,
> -			 * shortcut the other rules and return the proper value.
> +			 * This is only reached if a complete conjunction of
> +			 * rules passed, in which case we shortcut the other
> +			 * rules and return true.
>  			 */
> -			goto done;
> +			return true;
>  		case XE_RTP_MATCH_PLATFORM:
>  			match = xe->info.platform == r->platform;
>  			break;
> @@ -169,7 +175,6 @@ static bool rule_matches_with_err(const struct xe_device *xe,
>  		}
>  	}
>  
> -done:
>  	if (drm_WARN_ON(&xe->drm, !rcount))
>  		goto error;
>  
> 
> -- 
> 2.53.0
> 

-- 
--
Violet Monti

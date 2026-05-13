Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9162DCD37AC
	for <intel-xe@archiver.kernel.org>; Wed, 13 May 2026 22:09:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5296210E0DB;
	Wed, 13 May 2026 22:09:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lhQhtX0P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F70F10E0DB
 for <intel-xe@lists.freedesktop.org>; Wed, 13 May 2026 22:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778710180; x=1810246180;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5MP+lVCMPfp1aqx1rnrPokwAt3mxb6KSQOWJa7LVDhI=;
 b=lhQhtX0PdFVsCQF+g9zH2lM4XIT+AY/0Z1vMfjLWK97vATNcmBnGsj69
 z98pYDlk9WkLnqK3ToyhFElrxvNcQgj8U3IKVQ0jzIqFiu14jegum9uVg
 fXDOewUJCQmd6cB5D789GrhwNcpjZwviAwWW5uYsDlHxX9Y2B5XBc0vxa
 48MLgJT+Fseq2IYdrZUmZ/uiTyAlOo13HuAf2Ak1aggVmImRFnwixubok
 fcEjMnZASyfs956Q75oD14l14f0wgyxUzD/hRno6D/vM+nfc2JhcEubTS
 7+dGlzEFgyG6q1UofDc6oXqON016UV02qXOB0gMonyjhp5IRTdfNXcXB9 w==;
X-CSE-ConnectionGUID: MYCDPbsNS3SzyDV9DhU2SQ==
X-CSE-MsgGUID: Qtfglne/Rb6+4jfu90rbxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79544751"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; d="scan'208";a="79544751"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 15:09:39 -0700
X-CSE-ConnectionGUID: EsWEGxjnShW88/i715gA2Q==
X-CSE-MsgGUID: u+GZCX03SjO7qaQX16ai6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; d="scan'208";a="238323027"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 15:09:39 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 15:09:38 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 13 May 2026 15:09:38 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.37) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 15:09:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NvuXwEAAjoNqnZldBe98emOfvQYU3Eytmggns0T8ckBdeF4qvF9uQlZX+wAfl076DnO/BjhUQw1LLemBqCAFYv1IFKYBN/jSlpHdRRhnuUeqbZfS/5DhpL41jgAItrGZR9aHjpFc7bWy3HwdZbFz1EOx0gJMBmklEnwymKhkEuFovo+8/EV+eAH60hcmql2jqmH6c5BonlR2X3OBmEBpeJ0234XyfPihVb9zkRJBFcbtb0ydlXtCZ+2pKqzjpkKXB6hkO5EDmWgi6+q5v29WZMTwGxjOzIWv3fLA+itq4TGIe1rchFWhZWR2iKL4g1VoUf07EszjNbsOx/hpHAEs+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UhBfTdxX7jDO0uG6oBWc39nn73ZuvSHzAz0G40q3jc0=;
 b=ZneVQBviK48HQktSS03buofIZNUG/htc7HjssEcakkqsXwSEybkanWDBKhYoHuCv4YS3sys2MfMgPLrn2kjAOekYlx0oQlajddLoPFIPuigsiKGb2ABoYt9niWGNl1ZDMDxLfCo6O/wvfv4dsLJPg/jdXzQavN00NTqmvDm9bDlU5Q+YSy2ZP44SWUjGhK8PxZoBQAm1405eOl4znwBK+OxT7lPYh76vdKyokuZjXZurS7NOoWOD14v498UmFr0JkXzrI/SaM0LXIJSifbD+CAghOxarNDLBc1d/dvc5UavkxN/oWyLKz/xIiLkaZlQLMWgrh4QG6V5v78Bg/7lTEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8284.namprd11.prod.outlook.com (2603:10b6:806:268::21)
 by DS4PPF1DFB73954.namprd11.prod.outlook.com (2603:10b6:f:fc02::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 22:09:35 +0000
Received: from SN7PR11MB8284.namprd11.prod.outlook.com
 ([fe80::65e5:898b:2231:bf65]) by SN7PR11MB8284.namprd11.prod.outlook.com
 ([fe80::65e5:898b:2231:bf65%6]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 22:09:35 +0000
Date: Wed, 13 May 2026 15:09:54 -0700
From: Violet Monti <violet.monti@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 7/7] drm/xe/rtp: Implement a structured parser for
 rule matching
Message-ID: <agT2snJgv7HCsR_b@vmonti-desk>
References: <20260430-rtp-rule-parser-v2-0-157e98b4ab51@intel.com>
 <20260430-rtp-rule-parser-v2-7-157e98b4ab51@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260430-rtp-rule-parser-v2-7-157e98b4ab51@intel.com>
X-ClientProxiedBy: MW4PR03CA0322.namprd03.prod.outlook.com
 (2603:10b6:303:dd::27) To SN7PR11MB8284.namprd11.prod.outlook.com
 (2603:10b6:806:268::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8284:EE_|DS4PPF1DFB73954:EE_
X-MS-Office365-Filtering-Correlation-Id: 69144eed-1a5c-4ba8-9206-08deb13c5142
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|4143699003|56012099003|22082099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info: lEvQj6EDTVAF9Qvss/JaU31129pLrTAZT8IKkcujp11C7oPDSQ2j9VYfA6RzpiGmYDeSWq2k2q0h/tlNvcUOQbAGD/69Wkva/ID4o2ajZgMbbbq8p7tBxforfZVYsYXdAxRVWf0kxaMSprfYYh4b3Dm5RkT9n5lnbWDVCeRdYXn6zzl7q4fcogmBYyA9zjvuz4Gd/F3DXx2D/PcQPcKLHfQkDqzJy3ZB5IoRAqH1JFIgtZSmJkgV3h7KSPYEMCHPwWbEEUPSlcjpQvr7VihgGoJR0Hcmizha7RvVapq/80dy1orxkalxnCZ8oJK4aIMXwWBIT1ZdJXchcJ/fLuG80C+an+Pe+MhrHG3dQFq66tDKmnvrwbHHaEv6lOsQUMRQ8IvY3bW4cexzDdJNjBwl7+MyHAlANOb82VZujeUg1RFXo/NyIExE1l4SIkbVaOAoMkGS4gulMo7Yh4aznOr1yr9vOQS8tjryWpafqlrGXg+O4fZKzw74uvkgumUVCSTkXug6rEu4K2GCl5Q9QIDk829LEymukyWCuPZxgOdi0ESiT3D/D42Yre1nn74QYucmhLGXj2wKYkB1xACWuFclfZoC4WglK+OuMasRvJR7OqXmsWRHRUtAYQxwRJGzzcbHtVMDwSwCfc0K5uFAKzOmOKjC7UuzZEKLG/8f3JylMyHG8m+T0oWpZhpHJf9Fh0+5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8284.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(4143699003)(56012099003)(22082099003)(18002099003)(11063799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PK1Zr8TMCFpXW7gQ9+onZcdQKoG3YFF23OZkk7K0Dyv4J9rWgNFUpB7lNKri?=
 =?us-ascii?Q?fJSsNfOJnHKLhRB8vp76g/8hQ99m1fWb1dhJlQjVKxV0wQSBX9CU2qT+lPXg?=
 =?us-ascii?Q?1krPhN+wyoeLbzCeK2NCRM24BCCJCdavm0TUdgSOSXr9cE9F8W04TK6c3Dnj?=
 =?us-ascii?Q?U7ds6ZqmBXEyoeIucQm+9UWw1woUjWTw/aeF+cfcZLztRlAyVsEJP4Qtp3Dd?=
 =?us-ascii?Q?e2SDQcg91ijfw79wS3zEI8bfVE8cjzjCOBQujveFFAy5FrdGPu/yq48btVKa?=
 =?us-ascii?Q?9dmRFFNkU1V1tV4++FPq5xKGlP1cGmZbu8pGOcq2ZhYhyl+2f912UEzCIgEC?=
 =?us-ascii?Q?5jdD8zcwF0o9h93/s3OV0wCwLyXv1p39ili1ex/EAmr98mYMI5kZUyfOwNQE?=
 =?us-ascii?Q?G2Nz4Y5VSW8afPgaivD2wwJ++DyGy7//Mn5M2dR0cfIaP9n//IgG2FOY5Mu0?=
 =?us-ascii?Q?wN5GJYHhoSpa0Hd/nWjeCQrcokclQpDQdQNumebMOQk9F7m4eaaMBdUWcZYu?=
 =?us-ascii?Q?RYi0vUDvyG7n8x782ozKpVoRpwlp66mino4/JiSfag8H7OQBwxOd/kEAANwd?=
 =?us-ascii?Q?+QXg4JXyzdhKQ7JL8GR5fKrNzDUY9fR4yVIcKE/82CJ0a6qQ/dJaWG8jf1Yv?=
 =?us-ascii?Q?0YBZNuYWhQFzlKXOaw2/LPRKafLjWYLWp2HDDRkierK0/2cEvLZW3xo1tbnf?=
 =?us-ascii?Q?CapCcup8qxtVsOO0K/jHg8AVn+Cc+bukOJAFRn5/fsUl8W3rvcAiy04B/y+U?=
 =?us-ascii?Q?Y/unj0ko+EVtJQCnAagVmLUNVo5BJaJsRKgxpNCIOO4Z1T4dBvAASbCxGgj/?=
 =?us-ascii?Q?3BKpL79Ebyu/cJlho09m52jPx5tSfY9ICplYCZFUVLOvAMG9pPrI8nqpIGu+?=
 =?us-ascii?Q?VWlm/m2Q9J0Q6/J2SxkyiIocY8f2C/sVfE0Luhi0ADB3XxtQC+LtoFC+/3+H?=
 =?us-ascii?Q?s2810In6DVQ4OQxmrW88K2CKvzdsgBaAIqnVxj7JRL6IFI05e77jq2jlbq/7?=
 =?us-ascii?Q?iVhkt7BdPqeII0tlk74714ERs/0dZQbwO0xxZcN0qjckEMF2FfTwtz0UdQsp?=
 =?us-ascii?Q?4DEMsRUn4u4dcA35WjB1vT2NaWQuvUzIkShFE+j+WVpCqOsSHGdfRFhp89QQ?=
 =?us-ascii?Q?7Q7of85qynh5cSRrQe/mCKCsVNoCLeVXQ9IMuhAXzSXkMcZPlnpRuJEj1hK5?=
 =?us-ascii?Q?SwUvWTXfRyFfGMkBXUYK++bebFs2G4e5M4Dc7c98mC9IyXdNdC5hiH5F2JAr?=
 =?us-ascii?Q?Ooa8dVBWr6NlZ6PQf+KErS8sBsO7YU3hhuHr4+WKXUvUtAAf/MhS4IJsWWN1?=
 =?us-ascii?Q?pyn3RcaACNMOWzSQxSEmmQ01+o0BYNLkvgVMfqkXdIPlZr7H3DZZELn72hrT?=
 =?us-ascii?Q?4Nxu0MFwWaTothwNDngb0iMC3+3DoChtlfO+ByZg5UkOKD4+x5rgjYhhc5Sr?=
 =?us-ascii?Q?41+KC1ezSXBTg7Ytro6FjjSRZpo8VSpXIOkOhF0fQJL2NvvkZqEgADDrxyFu?=
 =?us-ascii?Q?GtIPDW3UxwTo66G/zgevnTKeORQMvqj9uExoSMFhrNpYNZwbnvzXdPxUs+QR?=
 =?us-ascii?Q?Y7X5/I6/7QdlI0rRR0tvG/Q4QL+GGLmymcTFCyNoQJ5ZoVI8WkLmbummGQeh?=
 =?us-ascii?Q?MwYUWAc+fO+TTRroe9sgU0gaJZ1IpmU6bb2vC1ryaeoA+eVouZS/0t5a9zPK?=
 =?us-ascii?Q?2XRuA+bWbCAiTvs1tSfO+/kr1b1d4xnZyNsGGr4JI1hBDAjUmgiQJykAnkmX?=
 =?us-ascii?Q?+mCU4KoL+Q=3D=3D?=
X-Exchange-RoutingPolicyChecked: q1st35LJOcfVYrKAafbuz9Kcpg05N7MHVd4WVKO4l3whdQ491YI+dxD+b2z6Ow+bIClxCFna145z5OfpoTQjhnnIkjA55t+PLduiCvoI7CZVjg/MunK1ehpDROPGuFKKRGWmWlcoFI0CrZ+VI7+tW8FCGoFxVgeb/jMVdmVoin9E0IlvHMI+KUrdDAbri54xYKHCEPw+uWY8RV/nj+0GQtC0KMEVrB9IU8ODqkZT5ALC3EW6BMcdo+oRdMa+gJUVD7YPdsEUpJdiX8EuZbJzyGbpRER7YytiBclwN7i3EeDPckhJiM9jn0yZdhLW17ggfno8ZmbUWfT2cWC+raTuNw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 69144eed-1a5c-4ba8-9206-08deb13c5142
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8284.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 22:09:35.3898 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SCXHXdl83Mc8aKsx93Vyb039VZQU0ShA8mKhVAHgndxxU+/i1iDbQNwiq4fBfcAO90zZG23R6REpgQTaR48HGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF1DFB73954
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

On Thu, Apr 30, 2026 at 05:20:08PM -0300, Gustavo Sousa wrote:
> The current unwritten grammar for RTP rules is as follows:
> 
>           rules = disjunction;
>     disjunction = conjunction { "OR" conjunction };
>     conjunction = single_rule { single_rule }
>                               /* AND operator is implicit */;
>     single_rule = ? GRAPHICS_VERSION(...), MEDIA_VERSION(...),
>                      FUNC(...), etc ?;
> 
> While rule_matches() currently works for the grammar above, it doesn't
> easily resemble it.  Let's replace it with an implementation that is
> structured in a way to resemble the grammar.
> 
> Such a new implementation, although a bit more verbose, is arguably
> easier to reason about and to adapt to any extension we do to the
> grammer in the future.
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Reviewed-by: Violet Monti <violet.monti@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_rtp.c | 138 ++++++++++++++++++++++++++++----------------
>  1 file changed, 88 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> index 976a2e1f5592..dec9d94e6fb0 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.c
> +++ b/drivers/gpu/drm/xe/xe_rtp.c
> @@ -30,11 +30,28 @@ static bool has_samedia(const struct xe_device *xe)
>  	return xe->info.media_verx100 >= 1300;
>  }
>  
> -static bool rule_match_item(const struct xe_device *xe,
> -			    struct xe_gt *gt,
> -			    struct xe_hw_engine *hwe,
> -			    const struct xe_rtp_rule *r)
> +struct rule_match_ctx {
> +	const struct xe_device *xe;
> +	struct xe_gt *gt;
> +	struct xe_hw_engine *hwe;
> +	const struct xe_rtp_rule *rules;
> +	const unsigned int n_rules;
> +	unsigned int head;
> +	int err;
> +};
> +
> +static bool rule_is_item(const struct xe_rtp_rule *r)
> +{
> +	return r->match_type != XE_RTP_MATCH_OR;
> +}
> +
> +static bool rule_match_item(struct rule_match_ctx *match_ctx)
>  {
> +	const struct xe_device *xe = match_ctx->xe;
> +	struct xe_gt *gt = match_ctx->gt;
> +	struct xe_hw_engine *hwe = match_ctx->hwe;
> +	const struct xe_rtp_rule *r = &match_ctx->rules[match_ctx->head];
> +
>  	switch (r->match_type) {
>  	case XE_RTP_MATCH_PLATFORM:
>  		return xe->info.platform == r->platform;
> @@ -120,6 +137,63 @@ static bool rule_match_item(const struct xe_device *xe,
>  	}
>  }
>  
> +/*
> + * Match a conjunctive set of rules (rules joined by an implicit "AND").
> + *
> + * Once one item evaluates to false, the remaining items are not evaluated
> + * anymore.  Nevetheless, all rules are consumed to allow detecting syntax
> + * errors.
> + */
> +static bool rule_match_and(struct rule_match_ctx *match_ctx, bool parse_only)
> +{
> +	bool match = true;
> +	unsigned int count = 0;
> +
> +	while (match_ctx->head < match_ctx->n_rules &&
> +	       rule_is_item(&match_ctx->rules[match_ctx->head])) {
> +		if (!parse_only)
> +			match = rule_match_item(match_ctx);
> +
> +		if (!match)
> +			parse_only = true;
> +
> +		match_ctx->head++;
> +		count++;
> +	}
> +
> +	if (drm_WARN_ON(&match_ctx->xe->drm, !count)) {
> +		match_ctx->err = -EINVAL;
> +
> +		if (!parse_only)
> +			match = false;
> +	}
> +
> +	return match;
> +}
> +
> +/*
> + * Match a disjunctive set of rules (subset of rules joined by
> + * "XE_RTP_MATCH_OR").
> + *
> + * Once one subset evaluates to true, the remaining items are not evaluated
> + * anymore. Nevetheless, all rules are consumed to allow detecting syntax
> + * errors.
> + */
> +static bool rule_match_or(struct rule_match_ctx *match_ctx)
> +{
> +	bool match = rule_match_and(match_ctx, false);
> +
> +	while (match_ctx->head < match_ctx->n_rules &&
> +	       match_ctx->rules[match_ctx->head].match_type == XE_RTP_MATCH_OR) {
> +		/* Consume XE_RTP_MATCH_OR. */
> +		match_ctx->head++;
> +
> +		match = rule_match_and(match_ctx, match);
> +	}
> +
> +	return match;
> +}
> +
>  static bool rule_matches_with_err(const struct xe_device *xe,
>  				  struct xe_gt *gt,
>  				  struct xe_hw_engine *hwe,
> @@ -127,55 +201,19 @@ static bool rule_matches_with_err(const struct xe_device *xe,
>  				  unsigned int n_rules,
>  				  int *err)
>  {
> -	const struct xe_rtp_rule *r;
> -	unsigned int i, rcount = 0;
> -	bool short_circuit_or = false;
> +	struct rule_match_ctx match_ctx = {
> +		.xe = xe,
> +		.gt = gt,
> +		.hwe = hwe,
> +		.rules = rules,
> +		.n_rules = n_rules,
> +	};
> +	bool match = rule_match_or(&match_ctx);
>  
>  	if (err)
> -		*err = 0;
> -
> -	for (r = rules, i = 0; i < n_rules; r = &rules[++i]) {
> -		if (r->match_type == XE_RTP_MATCH_OR) {
> -			if (drm_WARN_ON(&xe->drm, !rcount)) {
> -				if (err)
> -					*err = -EINVAL;
> -				continue;
> -			}
> -
> -			/*
> -			 * This is only reached if a complete conjunction of
> -			 * rules passed, in which case we short-circuit rule
> -			 * evaluation, but still keep parsing to find any syntax
> -			 * errors.
> -			 */
> -			short_circuit_or = true;
> -			rcount = 0;
> -			continue;
> -		}
> -
> -		if (short_circuit_or || rule_match_item(xe, gt, hwe, r)) {
> -			rcount++;
> -		} else {
> -			/*
> -			 * Advance rules until we find XE_RTP_MATCH_OR to check
> -			 * if there's another set of conditions to check
> -			 */
> -			while (++i < n_rules && rules[i].match_type != XE_RTP_MATCH_OR)
> -				;
> -
> -			if (i >= n_rules)
> -				return false;
> -
> -			rcount = 0;
> -		}
> -	}
> -
> -	if (drm_WARN_ON(&xe->drm, !rcount)) {
> -		if (err)
> -			*err = -EINVAL;
> -	}
> +		*err = match_ctx.err;
>  
> -	return short_circuit_or || rcount;
> +	return match;
>  }
>  
>  static bool rule_matches(const struct xe_device *xe,
> 
> -- 
> 2.53.0
> 

-- 
--
Violet Monti

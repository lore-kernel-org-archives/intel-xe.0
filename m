Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC03C79FAD
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 11:19:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2549B10F0CA;
	Wed,  9 Sep 2026 11:19:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RGIiVO0K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7373C10E147;
 Wed,  9 Sep 2026 11:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788952783; x=1820488783;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 in-reply-to:mime-version;
 bh=nAOZJuCbAhBXmNC7D9Fhpcp281uPiWKgW3/lTVqZaxQ=;
 b=RGIiVO0KjiJRJLoCaqdC/g+005m5cxWsE3jamf0K2zz/ZTSyQkpMBUwL
 3k8TDRrTRpL93hp82zSF1QVFwIqvOGo5LqxcTrLu429y8HQCv3kM244P6
 1nCY6m55Q9V8g6MeAd2BpL96+psJ4TwHSyWIJgrfnNLcxb2KYZyBsYzvd
 AwKXz6jQHwEbdgiXF6hooMyFYQor04+DOPMJr2qjLh0jtOLOLkafbaBLz
 A5GMjvBBPQRh8jhsSWD8SM8S3hmF5AX87QfKn5O6H7sXeGubIDZccXtkb
 OaeC9ee1zBYxPrDkhD7qe0oLdUBBZvr5eNKX0y2KVs8q/5VkVCTxc1Mc8 A==;
X-CSE-ConnectionGUID: VF3d7/dYQMy26KLqHnov1w==
X-CSE-MsgGUID: BlUxkhLwRKi2VS6HLkVmRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="114919669"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="114919669"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 04:19:43 -0700
X-CSE-ConnectionGUID: SAfzWvN2QMSwYo47RNaZZw==
X-CSE-MsgGUID: aExg4v7aTfKHmemgp4wu0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="269958730"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 04:19:43 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 04:19:42 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 9 Sep 2026 04:19:42 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.6) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 04:19:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cTKJ35rmc4Jtr+qkqkB88Ib4pNKHqbO68cfDG5EHze8ZfKYDORQX26kQqrlo4IVpWBfaLfJkAZrsMQo8ZGWn8Uy5VxjrwgST2UTn5E56s6aVreu8gJ8oPa+N5kjGAMaa8pKDCjjZ28VUo/hjzh3Aiag+yaLhJoQWlR1jWp3xpn05XiDXWDGer6PO50QRvNE3Xz84nPcRHqwFxg2HgTH5HWv5O16AayGhQLIhlaojErJjYe+uhFkUt013foHZe2MXtFR9BHAUjW4od079JejXvOSnBsOvXfUjHup7eg2Nw3JXlsNF3W4QxhnqoqvzLC1W3uyni4sxz2h1cH+sDDtkCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gELqtMrI98PCFZxGutF3xYlXN8xRI7w8HexC5M74iLo=;
 b=CWoAYWUAPXvIQ/+Syze6GopuNGZIAi8HeNFKl8D2guhgK2pJOVkfbKNSRtyLzXl70Y8lxh3bwHcpbCQL11szdYmvnwF0OLDQOKggm74FNqgY4KXK4js6JNczRxPdT/g225WZsG6QugVNmmPLEx4EwbZjBuhNC2+nV0y8Hue+RXe1puJWut2QyDsRkvCb4hrh56uBE9+HF4JXOCdQJNvUT7o68rzdtxzDFVlPbGsMSAWxdeKTRod4F8cgJWdFgO4bPZ300juitDnY/QhUvXbH9WEjQMCwBUH1yy5qFenLnwlY9gaJrQbzzyBigeiDzqelqceUG924SPviGrm+23gTSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3SPRMB0045.namprd11.prod.outlook.com (2603:10b6:208:57f::14)
 by PH3PPF1618AF7BB.namprd11.prod.outlook.com (2603:10b6:518:1::d0a)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Wed, 9 Sep
 2026 11:19:35 +0000
Received: from IA3SPRMB0045.namprd11.prod.outlook.com
 ([fe80::28ac:4593:a748:4b56]) by IA3SPRMB0045.namprd11.prod.outlook.com
 ([fe80::28ac:4593:a748:4b56%5]) with mapi id 15.21.0406.007; Wed, 9 Sep 2026
 11:19:35 +0000
Date: Wed, 9 Sep 2026 14:19:29 +0300
From: Imre Deak <imre.deak@intel.com>
To: Luca Coelho <luciano.coelho@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915/display: check configuration index before
 shifting
Message-ID: <aqFAwUzmDE00rpie@ideak-desk.lan>
References: <20260908100659.113555-1-luciano.coelho@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260908100659.113555-1-luciano.coelho@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
X-ClientProxiedBy: GVZP280CA0047.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:273::8) To DS4PPF69AE895C5.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2b)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3SPRMB0045:EE_|PH3PPF1618AF7BB:EE_
X-MS-Office365-Filtering-Correlation-Id: b9efed1c-afd1-410c-af8a-08df0e643a0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|10067099003|6133799003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: eK4J8ry9xii+j7h9MNX+nhBkEZjPyZ6c5gd+mUGQ7TqfKVAS9HxDp8BDVeqksFUPYljoTxSFdfqXVs/QisjZG8Zpn7QAiEOEIlGWhXvpIS+SBNjrvwCMf80hJGQU0zDtQBzzdtvwAbh4AHW1NdlmEozWzNJJY2qM9Hvbj2ZxC3oj/p4B1ap1+xRy13c3bZPgfgJmzcu1OicHSA6RRdxTaoV1SqmKfeOOH9hu+BpFba92VW2WnoBHYUVhAbowrjVSKN5IOfWu2KmBhevAAYNpbK6RSwqyHeQUh/uZSqIxB8YYRLvsUhSgfMNUCnu7xMOT4eJBcXI6wbJquPpnbaL+ucEpI9zeanl86nTTrNDk20C9jdV20gdSW7HoS9pWXhfwg/iajgt8QHt7ybc7I12dgHX/GExkFLT36siqTiYzYtu45o5FzQieT2uOgK+njLD4UFpw955DcfUqQ1kYGqOadI6+ckk6ksrdLu+kzzRQFsUNT/e5Vx3cGkS20RuQsVgniXNatPwzMgXytZ2Rs95FylPALvc7T0viSu6wS7SphcsX/pVGmkrOsz2yiJQZ6+evR1V6Wz+0Ly8ZxB1DYLYVLbrWakiO+JibW8AvKCZRe6nrshLIceYnr1ZmK6cDj0Or7y3kxBWFObkA3X7MfFsoZwrjfWk2HaD7N9VRQIrMdEQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3SPRMB0045.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?I8VwhnC7myAzH7F6ZYQggSnIsFppCKD+ZBVRxuSCrjiSfDilYKaIau374rld?=
 =?us-ascii?Q?A3zrMN3r70XtTJtvWHP8EPV98cvvquQqnevn5ZMRC4RCVbko0nnNAshv8+Nn?=
 =?us-ascii?Q?ON705HAQlg7vnZo54cn++q9F7rhHgeu9c7cPMQ0xcXnDld8TITqSiLSMHamF?=
 =?us-ascii?Q?est93wujaJ5475sYzV1QJWHZCjDRdV1dzZHb3fJMUwRtTmGTnPtkFDL11yjQ?=
 =?us-ascii?Q?jr9hpy/opEiSQOIfspQS0FTd97cUAe1FcC9J70T21OrYRPZuNPwYIZRBH1q+?=
 =?us-ascii?Q?Rqr8i1RD7EcI0BialVEEFjw3yK1YQCA3KM6xh1kgtsClq9CLyD0D0UNQjVtb?=
 =?us-ascii?Q?IqnvzFnnbN2lVFhtd7xKUup6pJgQesX4/BT/gFiAlmWFjI+sDlT9A7LR0DYI?=
 =?us-ascii?Q?jp7qgNz94pE+nXVG6qovZL9bSQjPAWevgA0WWwIk7B/NkWCr4B8KY4Zrwpxv?=
 =?us-ascii?Q?ZJ/71OOSdVT7wsh+23NV0WljVzKI9+RvthKWtwmlmbLkQi/VeQD8bHPo7TGY?=
 =?us-ascii?Q?erTPQlrbHdiFYyxwNLCXWU/P3qLhmmysJ9KQC8MtuA1SgmncRskqtu48UpWV?=
 =?us-ascii?Q?t0+G/8mgskg/kgYy/PAqy2n0HE7Th94IJqhSzBUDP61nkzHtRED4IKuaIWs9?=
 =?us-ascii?Q?ebCE0vrJZ1VKJ9/N5Jl34zepC+cAcgmNpd/MlZSMedGjM7+a2H4GRL5C56TI?=
 =?us-ascii?Q?nrh/tWLP3ruEcSvL31icpK31JP+mG+i2+L47OWtbL5DsqglthXtYGM5rdGxu?=
 =?us-ascii?Q?PYDqioLOXinkeC1KoBJRXjcJqBIAy8R6A4yRJbOrTAmC9KgOTlV9MXhNp8Ca?=
 =?us-ascii?Q?LGB2hmwAdlaEpes1UsSL6WEjhCZEJQQ9KXzs8dmHbekyk7TL5q7756MK6zdv?=
 =?us-ascii?Q?gwy8XPaUSU/Bb8SEce7YGh1CPsj6A6QIhVZFV/gkUfGb4pVmzpqJgddrdiJP?=
 =?us-ascii?Q?suiXr51v0sl4QHLDDXAbmg5NjKNnIJ5MRTctaZ4nqnPOc3tV9KGfeRq6v8n5?=
 =?us-ascii?Q?Jrql5hBl3o2+S9eRR0Cq/KKRKE8n+LMSpGSELekr8GKpwc2niqMsiJ1hIrY7?=
 =?us-ascii?Q?ADQHP9L0jYfpU8cTgr+ndcJtwxN3DdGC760bFumtdAqmKYCqH8IGbHFZL94E?=
 =?us-ascii?Q?0E8zISWgVJb63qd0u8LIev2HGqnPMK7aqbX8mBFE1Uoal5OJsSGHSDLcRWQi?=
 =?us-ascii?Q?Kaonp+UyZhmx6VdL2qAaVjenUra6ANZU/gC4cf2Wf4zrIRMhJRZYHkxefbdP?=
 =?us-ascii?Q?BA/hmgoIXfA/UIZQpS2VMd6t6CFrQ/IPAy4RxktnMn5o5Y4MjqzxWTeJGF86?=
 =?us-ascii?Q?m8YE9HtzjFv7ebiUniLteGY06Jh4F7OaJQ3kVWjFHJbEtIojQUHafKdO7+p7?=
 =?us-ascii?Q?M7/v4Bn4uBTTVwtgTrR6bq11awJoINj1fuyrmEG8WxT2LwQQYl8GwdbE7Hsc?=
 =?us-ascii?Q?B4Kjo4Pn3KxT/JcK0SnEdJymNqCAW2gKdV1m50eRUNHj/ATS0c1sMgu9pyMk?=
 =?us-ascii?Q?GULtPTTDw2zoA0AbyMI8KAUrLZ7KESU64Pi/bIjjefRD4QgB4YYzzkffR97T?=
 =?us-ascii?Q?/R9niGNADvAAr7evj9a5P4j3zKEOc7kPH///Zh7By/T3MnUVYTTIObUJVkeM?=
 =?us-ascii?Q?G++gRCqTiLay0eGpRq1mOuTf/8ephvz4DW3M+pwExRzPeBDhp04rXMJd/Fe/?=
 =?us-ascii?Q?QoGnBm9v2vmRG6IPJMrAkyLhP+zi+HjBv+/FLglx+KUXSr1gvtXRt1cF9cPp?=
 =?us-ascii?Q?GV9FVPQKBw=3D=3D?=
X-Exchange-RoutingPolicyChecked: tstOrd1ix3DVLszOO6sNg/6le4BX++UECXmyzU7yP6R5Mc408BFwGDLjY4jXpVXNLyJcdz+HVsJbgtImdi6QVnxVDwHVHnLdXxK2ul4JN9idPtUYuvLUbBeONTmaOimtp+opB3f1N/SgH4T600j6nM4vWw4bJ1JskETAsKUd5odQn8V+rPlO1+P8GGKh1qis9UfO8fUBv7HX0GxhVT/agMg2Xmf3CdfaHnFK74kqzF4PdxIzSzE0bxgT/wZ5EG/KO4PcDetUXp5W4qSJMPbLGKe4+cxp1i8exhpvZ2eVNTHcXBzDer8IV8V/S+Ih8KUGT+PLA3mwRRvWKSG1jz16mA==
X-MS-Exchange-CrossTenant-Network-Message-Id: b9efed1c-afd1-410c-af8a-08df0e643a0c
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF69AE895C5.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 11:19:35.0621 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NxNyYMdXXLV4n02EIWkqQujv3S6NG3+QZKbnHOvLZBdc4OMWg5W/J28Tw9NDeTFF7HeGtoDZNPS8Lf++UAvWMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF1618AF7BB
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
Reply-To: imre.deak@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Sep 08, 2026 at 01:06:51PM +0300, Luca Coelho wrote:
> The calc_allowed_config_filter() function passes the return value of
> iter_pos_to_idx() directly to BIT(), but the helper can return -1 for
> an invalid iterator.
> 
> The iterator already rejects negative indices before doing a
> configuration, so this should not matter in normal flows.  In any
> case, for robustness, check the index explicitly and warn if it is
> negative, avoiding an undefined shift.
> 
> Fixes: 39e30bdf2f92 ("drm/i915/dp_link_caps: Add link configuration iterator")
> Signed-off-by: Luca Coelho <luciano.coelho@intel.com>

Reviewed-by: Imre Deak <imre.deak@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dp_link_caps.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_caps.c b/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
> index 7b6cc6055da8..98657aa4d3d5 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
> @@ -426,12 +426,15 @@ calc_allowed_config_filter(struct intel_dp_link_caps *link_caps,
>  			   const struct intel_dp_link_config *forced_params)
>  {
>  	struct intel_dp_link_caps_filter allowed_configs = INTEL_DP_LINK_CAPS_FILTER_NONE;
> +	struct intel_display *display = to_intel_display(link_caps->dp);
>  	struct intel_dp_link_caps_order order = bw_desc_config_order();
>  	struct intel_dp_link_caps_iter iter;
>  	struct intel_dp_link_config config;
>  
>  	iter_start(&iter, link_caps, order, enabled_configs);
>  	for_each_dp_link_config(&iter, &config) {
> +		int config_idx;
> +
>  		if (forced_params->rate &&
>  		    forced_params->rate != config.rate)
>  			continue;
> @@ -446,7 +449,11 @@ calc_allowed_config_filter(struct intel_dp_link_caps *link_caps,
>  		if (config.lane_count > max_limits->lane_count)
>  			continue;
>  
> -		allowed_configs.config_mask |= BIT(iter_pos_to_idx(link_caps, order, iter.pos));
> +		config_idx = iter_pos_to_idx(link_caps, order, iter.pos);
> +		if (drm_WARN_ON(display->drm, config_idx < 0))
> +			continue;
> +
> +		allowed_configs.config_mask |= BIT(config_idx);
>  	}
>  	intel_dp_link_caps_iter_end(&iter);
>  
> -- 
> 2.53.0
> 

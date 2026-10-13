Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F07DCC6B12
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 19:08:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B1BC10E9AD;
	Tue, 13 Oct 2026 19:08:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C6F810E8DD
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 19:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791918502; x=1823454502;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=J9DskHfWHX3Cs3BA5JF90rpKfpUFq8gIMTlPaoMj8Sk=;
 b=KoeCIM6L/IBw0AOy/ybkFed6K4HVBkFoozvyofUe4de18tQYA8jE5/RD
 AIJfMJFJKFU07UmForRm1bo8dwIDJaiJZWuWKcgqIlA66+MNNVcPKMyN+
 Syc+IRm3z5yhUzDKERsZCTQytrWeQvAvDkdC6+alOKdAXPvlJNXJUPn5B
 tGOp0qrSKrWvk78vqb3JTPbO5Nr0voi7bAUPtEuAZ4rdsSKeEHmJVCLUe
 MVuB/qPHWcG97ZC60nsglfuzL+E19NkffgZNpAeU93qu0WoiK6pU3DnEr
 LQXvAURmNEbkLz6tTN1hjs7bmzUKe46WNrrvX9/4u9J3T5cyL5u84AxfL w==;
X-CSE-ConnectionGUID: c2gY1C7aQ1azdFxhVfuM2A==
X-CSE-MsgGUID: lq2YFO9xSfq6W8s5qlpnkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="751419"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="751419"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 12:08:22 -0700
X-CSE-ConnectionGUID: 4FCLymtcTPOTDzkHtIG/ZA==
X-CSE-MsgGUID: Td4gyEDzTtmj/IHrnpbNbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1201495"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 12:08:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 12:08:21 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 13 Oct 2026 12:08:21 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.23) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 12:08:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DCvnAJLLK3BMdshqNEp3UTpQcuaTX3nil4W1r72GZS9tmdpvLsvXas2Fl3ldSZsfN1oKvOth4j3frj0lEphOPtYf24A7/9Id35JFyXzmvO9iNDplAxkjRf9afJefDjrjcmK3OAan7qhKLqhEjGPl5GP8ZNyXkvGZEP86YHvQ2dyccxyc6rj4tm16pLCvhiDp0CTFn797YhSYX9kgIqCK8+HqJdAa7tc3U6p71nZUa7vDsc7v/KJ13tjC0I/M6kIcgHgW8+ISCHuUOAozf0Xlr68NkFMtZBXTv+wZyOksGkcMZz/h0vNxdejVgF4RzL3crw2itj5F1S2gBomymIco0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WBc45I64RPNTpQDqMAlq738WJUaMNJ708zwhGkW63W0=;
 b=qJ4pZ8pPgqQ4zlBfHhdQZtwWS/3Xh6+56f1MYoJagdCFSb6oQx1/dd3zNZzKCVsl64klAyZl8mNw7muRD46IxBOU5PWsJb26Cj/ofATqxlia1vju1SU5xtQgiTolXkhckhwCvY74nGyfCyVctiPkM9caegzkpu/1dHDjEIuJc1OW1pt5AKs+PemjDbPA0D/ItCYvnitDxIXhAcu9ADtH3GQTosyc7R32De2XkMiWXHuE2+dRHREx9RwMjrppOPtYMtVFK4dh1UQUUE8x2X6EYiGGrfye0uQVdx2A2FGXHdTMr3MwRQ+Wvn3t50TiMdnOEwvqD185/Iga1LVrxNypvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7192.namprd11.prod.outlook.com (2603:10b6:8:13a::22)
 by LVXPR11MB9753.namprd11.prod.outlook.com (2603:10b6:408:387::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 19:08:18 +0000
Received: from DS0PR11MB7192.namprd11.prod.outlook.com
 ([fe80::c747:a502:4a7f:f5bb]) by DS0PR11MB7192.namprd11.prod.outlook.com
 ([fe80::c747:a502:4a7f:f5bb%4]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 19:08:18 +0000
Date: Tue, 13 Oct 2026 15:08:00 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <gustavo.sousa@intel.com>,
 <matthew.d.roper@intel.com>, <daniele.ceraolospurio@intel.com>,
 <shuicheng.lin@intel.com>
Subject: Re: [PATCH 02/15] drm/xe/configfs: Fix out-of-bounds read in
 parse_wa_bb_lines()
Message-ID: <as6BkCZ3jUpkpTd6@intel.com>
References: <20261005220636.602826-17-stuart.summers@intel.com>
 <20261005220636.602826-19-stuart.summers@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261005220636.602826-19-stuart.summers@intel.com>
X-ClientProxiedBy: SI2PR01CA0022.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::14) To DS0PR11MB7192.namprd11.prod.outlook.com
 (2603:10b6:8:13a::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7192:EE_|LVXPR11MB9753:EE_
X-MS-Office365-Filtering-Correlation-Id: 4046fc90-9f65-4bfd-8e76-08df295d5731
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|18002099003|22082099003|10067099003|4143699003|56012099006|11063799006|261009223027099003;
X-Microsoft-Antispam-Message-Info: AhQenIvlahx78uTkg4RoYROj24y29lmDLxYomxzxybzQwpVaYL7t+bXoWJcsVp8pDsNjezhIa1zw+dUpoIrCzgdHKe4g+8B/rNME9JF38Y4VglMa6bSoZkOn9RFb3Ztoxfsa5fSe45mhIce9oLik7Gj/D+Muv2l9T+ccyqPzBwrqRQJ7nzaUPFEogXh4tMskmRJusx2syJ8JJlsrcQNiZ3TqeithONyA99O/Jbnbv2HIAbQUyDA8OESqa4rK5FLurnxZxIPiKPscjbx3viNXoqlTUEWvne5lIq3g+nI/MSOFfxw4zTKcZMxikxZ4CEoPFaqqIbmK9kA7CCvkoroMd6iMXrZV6gqVqUNegKm2wPT8k/KRDUJAio8nqB2HLbgAINohtPLY3vicEVu0164m7T2xX8X8O6LK9/Vud/zFjF2BCPPf5bZzQICCwcGBO152fMEdm5gFgn4qvHkjXVUhNi2l90Z8DzEGxyDpbx59rm3IaA/JzvfW4TwQZUm5UjlhABvTYCXwCyoah2PQNHafnWZJ5KrPEV1dhPNiWeQakEzEDrerKHr4gXHt/4nWH1aqGeSGgEA6YmvrR15ZXZA4AtzHe6cW2YrSK6GxZJ+uGA8msnkExRgNvRgo3MoqQthbZmxLfpTIKen2TcK6z0QvrEX7gTdlY5aVlXU3R06WDyc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7192.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(18002099003)(22082099003)(10067099003)(4143699003)(56012099006)(11063799006)(261009223027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7jR1PAgvV0kNRPW82kX/dvdDuM0Lpfh8wS4xeVCkMq+CEEF2CbSwtBpNcZm/?=
 =?us-ascii?Q?uP+gQf1oUiXIdGVlsMQ+vWz6Xu85PWfomsBQhBMyjyDnj+6M8JgfG6f84KDn?=
 =?us-ascii?Q?cT9j2M84IYttSMk3FkSFQhNq3oQAQm5GmOIz5Ov6B4CLX8TtXQH9tvufAsJL?=
 =?us-ascii?Q?p2qDQW5YTxaLja98JoKcia+F0DgY8NK3wf5AwPqdUP9tmJ+znIsp9UI+D6Ia?=
 =?us-ascii?Q?m6YUsd4++eRX2RMPi4RBeDnmiylLl4h6096LVVO7FxnTLnLEEjdek+8e2VF/?=
 =?us-ascii?Q?cKolbhdWeyH5xcoP/iENfDidjC/2AShWqEeLuXrrmOHsYCQzqDe2owCXqsaW?=
 =?us-ascii?Q?aOqlVsZjT5sshesHO4zzGBpismO0nJ5torwp/agYtEtPX0gv1w+UlkWNs9JO?=
 =?us-ascii?Q?3EGvZSwTb6/Q/RUXx3tsQBTJiEjHAeRRf8DgHD+ihRqP+hbMfI7TVoxXtpMG?=
 =?us-ascii?Q?hg1ugG2TsMyucq2A62L+qJf1ub3tKxEzeVA2qa5ECRi4/bdrtrf9y6wkwEKB?=
 =?us-ascii?Q?642den+kclzG99mqPM6OPUpxdTuPPBzc/Y5DmkiFvNqGgODWBFbuN22K2Fkr?=
 =?us-ascii?Q?qQK6PeHbFx2yB+FuDvzOW6gV1gvTgVbBawucjckBncK/yF0umZMk2Fnjn+Gy?=
 =?us-ascii?Q?cAGrvn2jOcGq53PqnsOTWKFUv78CgYGqhudu9P4Si3OxDRUsgwplED1BNz0e?=
 =?us-ascii?Q?8Iuv+0amoGiYAJ9zHCiQ4u0mxhbE/SHSrbuiydjAuE0CT/niq13xIB1QtNxF?=
 =?us-ascii?Q?80DpjaKAhYQAiZHcVoIxyP9bNF+UqVRy+gbk99bZlg7jMwIj2O+X5RyptLED?=
 =?us-ascii?Q?1vwyouzjm2S5gVUrklxQ+RB2HYhfjqbxCCjDrdXs965lBIqUlpt0tfbICUtq?=
 =?us-ascii?Q?KZ9Rm1Rdk2rbFo509O0VLB/rSwpZNVlgw/NfPlbGYXHfAWlVqF7DdUkjMTT0?=
 =?us-ascii?Q?AMx/6IP48Jc2INZ9wWVxnFisd+anRV6YUqPcXjvH/DHNslI2swrTeaOBqWo6?=
 =?us-ascii?Q?y2yxuUhxj/YDDGbQrGRX4ziQWCkTRVguYXoZkGhXiLYb1nRUziCNnVrJEd5o?=
 =?us-ascii?Q?RPRCCau47mUVATT98IeR5xjIRWM1reZDYiOXPTrgG4bSCXNxiHDxsnIlvsfp?=
 =?us-ascii?Q?JasT3ZY/RaB9HmoDdV+mIB4PJS4My0XV14krDcADEC0bZLv9//4vPTVb/MHt?=
 =?us-ascii?Q?wLTLpne+0smwL8b3G55b063eP4QKxPMX4kMbRj/+WDlyRaf+U4dI8XAx8f9v?=
 =?us-ascii?Q?+Hy0aNpTfV2jcDKLlsisULRdC3Eld/CBFwMZ9/58A6FM79SDv+KXF+YWI4VJ?=
 =?us-ascii?Q?8S0JnsLBdTIUQxhuwfro3mGPQKl0J0eritRCYiFtArSrR853NKB+tPMoofUG?=
 =?us-ascii?Q?pcVbyzQpk8qeVFhRZ+ym70N2Mf27qsR2N0Pd2ti/iO8KNzV1JZsre02RZRtq?=
 =?us-ascii?Q?sIELbsl7cJcofszi+88pgf/Whq7DFkrFiMt240hXSJ5zkjLK4DT6uro5SNS0?=
 =?us-ascii?Q?V0No5AcPwj5a14D6PTRb+KF4P+KyQtl+CxhKEFaW/T00Xbumf23E/+7OFL6P?=
 =?us-ascii?Q?0hAJhPBy/h4j4JyupIckU6lNMREGtmjY9G+v0aRDjmLMZ9iO0OAB7G+zhY9B?=
 =?us-ascii?Q?ygXkJR9mkzXKnzHtuoE/4GioKaZuHJXXkUBCGwGJYshGBwzAXnEYbbIGnXW2?=
 =?us-ascii?Q?gY6l58IutP+rLWUEqpJ6Vezr9SBACCRDNuqyLK+uWGl4Mh4f1zKE4X6D3ot5?=
 =?us-ascii?Q?nCM122vbZa2gzpXk8mZCg49JuksW0yA=3D?=
X-Exchange-RoutingPolicyChecked: JNm+zC9A3u92Luu3/48vbXi4MVQANyi82xK7z+QjXE/g/yegfKKfX+nqheYJRze64CanEiTT65RU9nqeSyaUEbdIwDZgZfSklD9iioIWomFUIfjmVmSVVJDlEzB+gcnTJXmybqi42bQYv55TqshtJcdNVp/vhdfDDIU51bGD6XqzFZAKgvi/WQ6Q3s5DL5zPSlEA3QOAKAjFTyTfXsnv33A0TDXCQQvrjEQtCHVSOTGQJ2mB2Wlb9RqSUds6D/3SQwbkyXuWzphIjEzjKP/lRuJ34TyWSGmrnmno846ZleDX9g4iFawvl5J9Ado1EYKFYN9B8ILttGcWaENMbY9mew==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4046fc90-9f65-4bfd-8e76-08df295d5731
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7192.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 19:08:18.7155 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VlUY9oq18fscsGEW2PwkRxkCaf3+18+s5YpbDJjmhpjwBmTjwYrKJpt/JYBA75tpA0wgIbPVvvRYgcFkjg6QHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVXPR11MB9753
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

On Mon, Oct 05, 2026 at 10:06:38PM +0000, Stuart Summers wrote:
> The outer loop advances the cursor unconditionally at the end of each
> iteration. When the last token of a line is terminated by the NUL rather
> than by whitespace, e.g. "echo -n 'rcs cmd 1'", the cursor is already on
> the NUL and the increment steps past the end of the buffer, so the loop
> condition reads out of bounds. The leading strspn(p, " \t\n") already
> skips the line separators, and every iteration consumes at least the
> engine class token, so dropping the increment keeps the loop making
> progress.
> 
> Fixes: 39ac06f70062 ("drm/xe/configfs: Add post context restore bb")
> 
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> Assisted-by: LLM

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_configfs.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index e1cf5af958bc..1c7a096aa046 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -820,7 +820,11 @@ static ssize_t parse_wa_bb_lines(const char *lines,
>  	ssize_t dwords = 0, ret;
>  	const char *p;
>  
> -	for (p = lines; *p; p++) {
> +	/*
> +	 * Each iteration consumes at least the engine class token if it doesn't
> +	 * error out, so the loop always makes progress without advancing @p.
> +	 */
> +	for (p = lines; *p;) {
>  		const struct engine_info *info = NULL;
>  		u32 val, val2;
>  
> -- 
> 2.43.0
> 

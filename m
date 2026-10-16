Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5042CCCA46C
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 14:27:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D37C510E10B;
	Fri, 16 Oct 2026 14:26:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5312310E10B
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 14:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792160812; x=1823696812;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ikKwyW7Ev06mHTDNl/Kwz20OFpXAyR25spiPD7uat0M=;
 b=GVeCK7TITuqw3G/04JDGAFgaESkkfL/h6mxPHy5Rsw9+OFkMy2s+QEzU
 /+C46B3/Sb+w896QePXyfKLJiu+slfO0RrIB0cPkZCZl1eyNbJRzPiO9D
 bAoJz1lyImi8LpwgbnNXVl7fF3rDbooXIbBfqo5ScNyuc6yuXZIdJ/Tkt
 WO8kybhyC3un9KwYInPI0XsuyNJDmMpHEew7ulS9/6IVW/0U+HIFMZNbK
 FwzzOileayhEMB1eXyuWJdnraFrLpzjrkEbWXVcJ3Y2U99sin8TE114z+
 R3HbYycIxPjoiz5pbjRpvWVDR3SoZBYHi5A9lTlobPrqQD1J2kfJtN4Rq A==;
X-CSE-ConnectionGUID: AXNKgjruQ4GeRIBhmov69A==
X-CSE-MsgGUID: dbIHAGBqQGKy04rju9NFOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="940896"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="940896"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 07:26:51 -0700
X-CSE-ConnectionGUID: j6ZbqQ6bQCKBV2jKHpjuCA==
X-CSE-MsgGUID: TJ9iqdxKQ828JQZRO/Km/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1932229"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 07:26:51 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 07:26:50 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 16 Oct 2026 07:26:50 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.43) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 07:26:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E597atgVrxWPFjZ6cfH2SiE1qiPYvgzCJPFHw5nrlVh7ZUPu228+8xSmWAQq4b4hvQFNAtEOn+fC1yXJ3sWTWvxRfQTmXI+fIrzrODPmOzGS8xpLN2IHRScP0m7dbkHX6e38Dza/v4pdK3HzzqjuNLizpNPT6/x9jp8I/eWj8N9gpltZUtZIPW6rQ/PIfUI6Kcr5RcWSLMMojz7J8kyuvtAVLLBMrxcUs1NDigQ1DHoikCpTY3dc66MuHlJmUX29ydhnDRoZY1wfBKCECVxcPIUd51qZBUhWbZQBu++NIsHif8wrBgG1CBTydYTuvgcKBw1o6E/KX3WeOnUiXIGBUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dZ4x79uaa/THVbIDOUCMu0kB6Z5yWookKyMMgAEYVRk=;
 b=yOZuf44/uiV7LPAz0HaPzYtPtBMDeHtn210FQL+j/VAhDeymSkgmDcdlGSwUWDmvfLdxrU+3q4NneAfSt6TyNqJStTPCRcNuWpWt+QCthWOXm4u9H2PJilqVA/5tw+gT7Dj+dhvIAaytqXVhm2ASTbNd8RqOlgc2jrMY46lwO0RsBXe67iE7UlTft1Q053JfMVrYnnH4Riy0O/YTgOelYszg9Y8Yd3kVfdf7u6saLTmMqSla1qgNRyezGrAH84bkuvMedYkFQaYqgYhkIoSU2kjqWteOz+7D4zGd+8PQwfAKCmLRKiuxw1f6ZZG3OjUibzEVBnmTDl95QGHtgKH/Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by IA1PR11MB6171.namprd11.prod.outlook.com (2603:10b6:208:3e9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 14:26:47 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 14:26:47 +0000
Date: Fri, 16 Oct 2026 07:26:45 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v4 2/4] drm/xe: Track number of populated ttm_tts in the
 shrinker
Message-ID: <atI0JfNpFytgqmzt@gsse-cloud1.jf.intel.com>
References: <20261016133523.3622-1-thomas.hellstrom@linux.intel.com>
 <20261016133523.3622-3-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261016133523.3622-3-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0238.namprd04.prod.outlook.com
 (2603:10b6:303:87::33) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|IA1PR11MB6171:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ae2b35e-490d-4a14-5155-08df2b9182b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|22082099003|10067099003|18002099003|4143699003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: 1Bv8LGlzJAb+F1cg5JRj5OjGUXi9DL4dUMULqQIdYEp8Be5+zxBGjiPR1CWp/Y/wGJCDW+HVaHAK9fuorQhrIIf5Vn5BLjL6wOKMKA5ME16LpU3jKqd1x1CuEscC4b18VJcY5/506KRDTYTZpVGdfcQftrX5fMruKdCceMojkqjkjGwdGAff9QG5oLSYZa0uLjTovW/XZOlK0Dd2d8WRhEFFq9VuZjb0c7SY304EsDzwphbkwmh0CHUhBNcI0LW9nm8Nj2Q8wOuPTuZhoUtEzDsciCnNrcjN6vOrm0k0Jt/BBzhzv6ava71Cye2PKNj8wpwMwhD1t8gzYjhfDHx0aOgRt+AhTDGCGLMRTWZKEaihfZu9ZgWvE8LEaDUi4Jd02WPj1fSRyoMaWCEoKy/l5lmj+h6sdSaFfqav51XmC9JMUQpUvhflfnT0axhwyRyxm17JD/+CXtC2Uf/1XG494rHlLUUx+svowX9cDzfgA2PERSTU/ny4ruBlBHZmYvpyrtIgayEr64oRcpbNCF9wPNRlx8HOL3cKtjNa5tnSfwPqmFhigaCRxgs0vpt+E1y5rDe85gefpRyoG8Vtw6xUCopyFZzlOc+S67m+bQ3PYx7SctD8g70MEC2hzQgn+aJBWCQTM4N5DiIgHV4+3AjJO0NGkD3aAo+FH+CCh1SWOzg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(22082099003)(10067099003)(18002099003)(4143699003)(11063799006)(261009223027099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ccnWxUw3Ex96Juv31fRdTxf93dhN1FBB0ReEW3Nx7GV+XdTiTf/vhfroYS?=
 =?iso-8859-1?Q?0t9OmHGpSgSJq75hBDY3uADXtLD90gx5r2/8o8tisA+lZ8TlN7r7988a73?=
 =?iso-8859-1?Q?61TCabKUfvwg+ybHTOWsq7imYak3vzanTLdFNXV4D6UtqzT/TshHA3mgQ3?=
 =?iso-8859-1?Q?GnbeGMoyyuiDkKDrXNhSl39gcUYk0BrB+qfZlQ67F9+6y0BGjwIQefykxf?=
 =?iso-8859-1?Q?+TV0ZYD+axyZkl6fdVxRQUgVaCyJhc+dCjbJnpLR8l8VrVcbMcn3UKlmA+?=
 =?iso-8859-1?Q?zAe8SYCQqEe5OQNaRADXUMfO8woAP3RBStQzE39NIqh9uRG+OruuDM9693?=
 =?iso-8859-1?Q?bdnDf1n5dKmjQWtfDxvNybul/MbfSpuHMZfkpCEgaLV8QVhqoDSGFFwk2a?=
 =?iso-8859-1?Q?4h/VwqtXaMes3SmTnJj+k6sqrbBOFlRtctHqqdyirOZJsvUrf56NXrh6r9?=
 =?iso-8859-1?Q?Rp8fTbu3korEXL8W9nO7ssbQMjZPEOO2BEas107GHy9iPbpPKjKmw2bh4p?=
 =?iso-8859-1?Q?DV3KK4Ce2/uvEI7MUPIdb4At0F60oFSyDZwbiZwNVQ4R2p8pU/oOXgsjki?=
 =?iso-8859-1?Q?r12qQCwpyhQ3Ku6rAKZRs547U9R5PLS6PhiMyexOD1Zf8+CNwoJHaBqCdV?=
 =?iso-8859-1?Q?pJ+wvh0qwNip3VYM6s0dsLlMwseC9ASYtB8klv5AhPi3eZlAfVGKBABFur?=
 =?iso-8859-1?Q?CeCqgCq7zCky+IsWiQrPsnsH1FgjinNpGu25SqzuNtbCHYfX6dBRaXATLA?=
 =?iso-8859-1?Q?c0L22AXas60c8eXaFFdvI2PA/7Rb4T4cHtDhBgK4lc0CO4lIa+igmd0GBx?=
 =?iso-8859-1?Q?VC29HgQ1fEp/M/suOJxgfKWV/4OHOER11Ndae+UsIFZMk8A34Z9cRdbRCD?=
 =?iso-8859-1?Q?TI5ukGGCOD9ym07sqsOq3idMfRBwv9PvOlWV0p200At+InEL+GJYdbFJEW?=
 =?iso-8859-1?Q?itJoPne8SBT91iDgMBJYp2TDPkU7p3TObu/+MhHTQHiLGHmAS9vPO/ynFh?=
 =?iso-8859-1?Q?XxRmvvtNY3QczioTbxY5klBYNT9m6H8GQr7wSk4GnHnjuKZc0A52mABiIf?=
 =?iso-8859-1?Q?rJP1Nv502CectsMVtWCwhzsv2av7vqtg1HtaHvtmKMqIfvV+0/Gk1N0uLz?=
 =?iso-8859-1?Q?hwpHnk+FhGMW6GGvnc9Paex1karIyDlNj66uPt1Cl7tJ+lvUDWpLdNFAVS?=
 =?iso-8859-1?Q?FIpeisefFPdNdc1YwT9nSyyNj61tcf0XVcFo4qE28JWU4dgZcD+gX1BeqR?=
 =?iso-8859-1?Q?6q/E7b+vwlWiVNcC72Mw1ukQ7FK/FF8hkTVqjxVuZEg5XglajxVFhJXZGR?=
 =?iso-8859-1?Q?dtpmF4lCxrOyDBAfbjtK7RKtDhVQjD3EnCIh8MxDLQYc1bEA5LRtII09Ar?=
 =?iso-8859-1?Q?F/czpRfm6OlqnxkP3lvsKLGHk2LDBSvgm7ptI4p0bg0lBFr2y4wF327Noh?=
 =?iso-8859-1?Q?o0GCo4E+iXeBTRxSfsOr01UgYhEXF0XLeGJxjIzh5QhJ7pXecORt1lQoPG?=
 =?iso-8859-1?Q?AtaX2r+ijBTBrSY+3APkkysBk4yq45XcyYwj+UJ8/WINMJADdiAbU78jz5?=
 =?iso-8859-1?Q?Rr3+idR6plKCNTzmOHzquerNBz8KN0kQfo+3zYr2qEf92OWsCEJrav1vSr?=
 =?iso-8859-1?Q?FKA69BQybFd50gd4vUsWcVlQ+c+vvstWyXnr114iBFnyQezxfzPn91zYlD?=
 =?iso-8859-1?Q?YSwjMSKPoODUEADrbwYwEfnGVOC+Z2wwEUuJYBArhqeoHo9WpMZvEaQYI5?=
 =?iso-8859-1?Q?wdd5UmMPQIx6ZHo6hYb3bahTyivBDVo4DNGruCp7zeBK+nG1jz1BMqw5UA?=
 =?iso-8859-1?Q?MwzVrTf0CA=3D=3D?=
X-Exchange-RoutingPolicyChecked: pdAnvQz2VdFh5Ih/KywSKHUg8+KZgBRuSwG/zi/sJfOTU9QwJL9H1ovYPhqBo9WyGGLZnPLIgEUmC0SfdZfXxzdInk1EhRT82uSY2533RtCs9QC3slGNcF3HqD+jFv7S3iyJ0ZjxoUZ75QXcaXvKA4dTBvnZ12gYtkotn0oXJGQW5NnjKqK1i7xk3Y3ywfrZf6vNxlDPSqO6SwDjKcAAQTdiUb71GMcR3gExH4cWOO6kYFQJMJd2OV007fPER3EubLxY2CbWfJzTdPgp3n1ZX8/rK2iqOVPRNoR5nCILgV+k7Aisu1GXILnMMFJN2FZYSp69gJtU9LUFkI4Wf/8mPg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ae2b35e-490d-4a14-5155-08df2b9182b7
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 14:26:47.5067 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u/vtnwhPo3cgnXloJv4BCdLx6VLV3+fPKopwiPxjwX0aZknIqiBgs8UwhPZ1tFSD65+xydcPVe8uJTTwH3j7zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6171
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

On Fri, Oct 16, 2026 at 03:35:21PM +0200, Thomas Hellström wrote:
> Add a populated_tts counter to struct xe_shrinker to track how many
> ttm_tts are currently populated and on the LRU (i.e., shrinkable or
> purgeable). This mirrors the existing per-pages accounting but counts
> objects rather than pages.
> 
> The counter is incremented in xe_ttm_tt_account_add() and decremented
> in xe_ttm_tt_account_subtract(), which are already called at the exact
> points where pages enter and leave the shrinker's jurisdiction (populate,
> unpopulate, pin, and unpin). Purgeable state transfers, which move pages
> between the shrinkable and purgeable buckets without changing the total
> object count, pass tts=0.
> 
> Extend xe_shrinker_mod_pages() with a tts delta parameter so that page
> and object accounting can be updated atomically under the same lock.
> 
> Assert that populated_tts reaches zero at device teardown, alongside
> the existing assertions for shrinkable_pages and purgeable_pages.
> 
> No functional change intended; the new field is unused until a follow-up
> commit wires it into shrinker batch sizing.
> 
> Assisted-by: LLM
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_bo.c       | 12 ++++++------
>  drivers/gpu/drm/xe/xe_shrinker.c | 15 +++++++++++----
>  drivers/gpu/drm/xe/xe_shrinker.h |  3 ++-
>  3 files changed, 19 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 12e523c61c1f..1b74331b15ec 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -456,9 +456,9 @@ static void xe_ttm_tt_account_add(struct xe_device *xe, struct ttm_tt *tt)
>  	struct xe_ttm_tt *xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
>  
>  	if (xe_tt->purgeable)
> -		xe_shrinker_mod_pages(xe->mem.shrinker, 0, tt->num_pages);
> +		xe_shrinker_mod_pages(xe->mem.shrinker, 0, tt->num_pages, 1);
>  	else
> -		xe_shrinker_mod_pages(xe->mem.shrinker, tt->num_pages, 0);
> +		xe_shrinker_mod_pages(xe->mem.shrinker, tt->num_pages, 0, 1);
>  }
>  
>  static void xe_ttm_tt_account_subtract(struct xe_device *xe, struct ttm_tt *tt)
> @@ -466,9 +466,9 @@ static void xe_ttm_tt_account_subtract(struct xe_device *xe, struct ttm_tt *tt)
>  	struct xe_ttm_tt *xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
>  
>  	if (xe_tt->purgeable)
> -		xe_shrinker_mod_pages(xe->mem.shrinker, 0, -(long)tt->num_pages);
> +		xe_shrinker_mod_pages(xe->mem.shrinker, 0, -(long)tt->num_pages, -1);
>  	else
> -		xe_shrinker_mod_pages(xe->mem.shrinker, -(long)tt->num_pages, 0);
> +		xe_shrinker_mod_pages(xe->mem.shrinker, -(long)tt->num_pages, 0, -1);
>  }
>  
>  static bool xe_ttm_bo_is_imported(struct ttm_buffer_object *tbo)
> @@ -984,11 +984,11 @@ static void xe_bo_set_purgeable_shrinker(struct xe_bo *bo,
>  	if (!xe_tt->purgeable && new_state == XE_MADV_PURGEABLE_DONTNEED) {
>  		xe_tt->purgeable = true;
>  		/* Transfer pages from shrinkable to purgeable count */
> -		xe_shrinker_mod_pages(xe->mem.shrinker, -tt_pages, tt_pages);
> +		xe_shrinker_mod_pages(xe->mem.shrinker, -tt_pages, tt_pages, 0);
>  	} else if (xe_tt->purgeable && new_state == XE_MADV_PURGEABLE_WILLNEED) {
>  		xe_tt->purgeable = false;
>  		/* Transfer pages from purgeable to shrinkable count */
> -		xe_shrinker_mod_pages(xe->mem.shrinker, tt_pages, -tt_pages);
> +		xe_shrinker_mod_pages(xe->mem.shrinker, tt_pages, -tt_pages, 0);
>  	}
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_shrinker.c b/drivers/gpu/drm/xe/xe_shrinker.c
> index 4e4da76936f4..378022c37a57 100644
> --- a/drivers/gpu/drm/xe/xe_shrinker.c
> +++ b/drivers/gpu/drm/xe/xe_shrinker.c
> @@ -20,6 +20,7 @@
>   * @lock: Lock protecting accounting.
>   * @shrinkable_pages: Number of pages that are currently shrinkable.
>   * @purgeable_pages: Number of pages that are currently purgeable.
> + * @populated_tts: Number of populated ttm_tts currently shrinkable or purgeable.
>   * @shrink: Pointer to the mm shrinker.
>   * @pm_worker: Worker to wake up the device if required.
>   */
> @@ -28,6 +29,7 @@ struct xe_shrinker {
>  	rwlock_t lock;
>  	long shrinkable_pages;
>  	long purgeable_pages;
> +	long populated_tts;
>  	struct shrinker *shrink;
>  	struct work_struct pm_worker;
>  };
> @@ -38,19 +40,23 @@ static struct xe_shrinker *to_xe_shrinker(struct shrinker *shrink)
>  }
>  
>  /**
> - * xe_shrinker_mod_pages() - Modify shrinker page accounting
> + * xe_shrinker_mod_pages() - Modify shrinker page and object accounting
>   * @shrinker: Pointer to the struct xe_shrinker.
>   * @shrinkable: Shrinkable pages delta. May be negative.
> - * @purgeable: Purgeable page delta. May be negative.
> + * @purgeable: Purgeable pages delta. May be negative.
> + * @tts: Populated ttm_tt count delta. May be negative.
>   *
> - * Modifies the shrinkable and purgeable pages accounting.
> + * Updates the shrinkable and purgeable page counts and the populated
> + * ttm_tt count.
>   */
>  void
> -xe_shrinker_mod_pages(struct xe_shrinker *shrinker, long shrinkable, long purgeable)
> +xe_shrinker_mod_pages(struct xe_shrinker *shrinker, long shrinkable, long purgeable,
> +		      long tts)
>  {
>  	write_lock(&shrinker->lock);
>  	shrinker->shrinkable_pages += shrinkable;
>  	shrinker->purgeable_pages += purgeable;
> +	shrinker->populated_tts += tts;
>  	write_unlock(&shrinker->lock);
>  }
>  
> @@ -286,6 +292,7 @@ static void xe_shrinker_fini(struct drm_device *drm, void *arg)
>  
>  	xe_assert(shrinker->xe, !shrinker->shrinkable_pages);
>  	xe_assert(shrinker->xe, !shrinker->purgeable_pages);
> +	xe_assert(shrinker->xe, !shrinker->populated_tts);
>  	shrinker_free(shrinker->shrink);
>  	flush_work(&shrinker->pm_worker);
>  	kfree(shrinker);
> diff --git a/drivers/gpu/drm/xe/xe_shrinker.h b/drivers/gpu/drm/xe/xe_shrinker.h
> index 5132ae5192e1..9c63e22b3b73 100644
> --- a/drivers/gpu/drm/xe/xe_shrinker.h
> +++ b/drivers/gpu/drm/xe/xe_shrinker.h
> @@ -9,7 +9,8 @@
>  struct xe_shrinker;
>  struct xe_device;
>  
> -void xe_shrinker_mod_pages(struct xe_shrinker *shrinker, long shrinkable, long purgeable);
> +void xe_shrinker_mod_pages(struct xe_shrinker *shrinker, long shrinkable, long purgeable,
> +			   long tts);
>  
>  int xe_shrinker_create(struct xe_device *xe);
>  
> -- 
> 2.56.0
> 

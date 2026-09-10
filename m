Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F238C79FB6
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 00:00:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC0A610E16D;
	Thu, 10 Sep 2026 00:00:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XIoMp9MV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 871EF10E16D
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Sep 2026 00:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788998437; x=1820534437;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yRT9VfwJisN+KoA+Ya8WWJrog+PJUUlYX3hPLNLl4WM=;
 b=XIoMp9MVm2AXlUKcO0MExjQsv4ve+01oXMp9N89qPbXkuU31Wp91+H2c
 +QFlbAoOQgs1hO6QGMbCFOiy4AkNsPV075dIpR5jwe+YZAyyykCpq2Px4
 2hYIS0Q0xOwIGofuEi/9VgCQvHXS1HKMduQSkqhtMrmP9Sj7FD5tLa6aL
 htc8jyeeDgNbefUiVdDvc32K5/2H4Aa+S+2eQ97Koy1D5GnNuWr6vWCdB
 p8sdfa9Qo7d6waEv0DOqW3ns0i1Dt9+5yOwjUsBLCEszCIQYOWEoY1niv
 0+01JeX0j9GHmAsTGyTQbu1jKxJRsvhaD5ccPA1xNf9wrMW3kTnFkCG8G w==;
X-CSE-ConnectionGUID: gpqFdaE6RduBM83QFt3+Dw==
X-CSE-MsgGUID: cqjXUfoCT8GxV1OBUsbTfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89470901"
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; d="scan'208";a="89470901"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 17:00:36 -0700
X-CSE-ConnectionGUID: N6RfiF9IThyunGsyhJUMEA==
X-CSE-MsgGUID: BojLEJyXR+OO11R0Fw7/oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; d="scan'208";a="275607649"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 17:00:37 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 17:00:35 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 9 Sep 2026 17:00:35 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.59)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 17:00:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R0ihKCufvSIhx1uEVBGEGqF68zenjNRhClV2Pk4o16ZxsmPoJvONj8DVNPVCE9NDr23O0yEC8ChQAMyof6cfo7c9PnX9Odb/ontvg9n38qP0x5OtO4AAaS6oK0fZCvkc1eJmbTPB477WX3Tl0ZNvjdas4M6BsPhV9oipvaDsIE6oebbKQT/UXVcDjmM4IABf6LqL49hRaN0ApS68hRLpsOukz+KJPNLw6cj9nzXuXYbBC7Cf7Ywja1ZPVE8s32DfHJXJFo8YTnvl6lL4phYchhQf0v86va6xGRkPzoSuQUdLyOUXQ4pAEDJJOdGITby6PxXH79qL1MVPCRPEfpBX3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Wp1J8MudNR5I8NO6syukgjRPlcYNKhodIGR0tXqO98=;
 b=Po1zFrYJdROxnqDAbPL9pQrGIh9qxN4wbg9UPE8yJBwqsDBCUTAc4gs01CACABFzN7PH2bFNtPLkP0so/NiY0wNyhb+Z4C+8QZdhyicuEkcftYDg7fAMfgdRB1mys3vvUtV9ra9truUtcPuGmWY0wn1hqhQdTs/KMkiPmvMjDYGbOynz6Gok3Ms6EJk847KbmLNONl2tdF0si5hTJB+0TBhde3y980zhnyNYLjqSfsk1XtBngRJ1rUHXl+XK/buYco6tuUrQ/x1o6ffwf7NhzKvVcY1mJjbUc5qnIr8T0c5esfM99n6Y22pNyFTUZ8+VTcdxiQEgzILwuMYfUmvpcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by CH3PR11MB015790.namprd11.prod.outlook.com (2603:10b6:610:349::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Thu, 10 Sep
 2026 00:00:33 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%3]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 00:00:32 +0000
Date: Wed, 9 Sep 2026 17:00:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Jakub Legowski <jakub.legowski@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <maciej.patelczyk@intel.com>
Subject: Re: [PATCH v2 1/1] drm/xe/guc: Fix wake_up race in handle_sched_done
Message-ID: <aqHzHnFFoDUQezQk@gsse-cloud1.jf.intel.com>
References: <20260909070825.228551-1-jakub.legowski@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260909070825.228551-1-jakub.legowski@intel.com>
X-ClientProxiedBy: SJ0PR03CA0355.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::30) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|CH3PR11MB015790:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e0cc406-6b8d-4d20-623d-08df0ece8847
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|6133799003|22082099003|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: Q/fwj7avlh0fYMQVwshMwPVGSzW3syXOyulsUXg7uxaA9dVGGKyw5SvZqeklKom4Ab0Z6NVA1hSfKGMPFGanIZoGq5mhcD1zyQOyZ6H2a/ouOWpGrcatwaGqoENfgMq49PxPpcj2RmR8qbA17cwALcby8uM1GEkkB4XHtZHEqKFQOoX5vmazu2bB8P1DxR529zmMhtbKsuMIV5F6Rbq/y9B9BwHEyJPmxqrasjIPAmJQcZh89TYnW8Y+7dXUoi3TeSgR8DTNElzDdiWIvEO9HdYBBrtPS261GStywjrUKWS+3FbceXH/i+e9cyws07w8618shAK2G2yL0N8uhRIRP0bgJvIh2hmY0FJM/aSzMVg2ghPecq1VC1i4YUsngxylKpY2cUi/DyDYE7oSHS/4yTd00G5rqN09lebMC4yJJLIsxdoOWJrFPy59hjey+YwLOECKUEGM3Mf+/RG8VifVivTYmwM8qUt9DPqigQI91IEQFAsGWGpAIlPPt5PIfUIkwu1W3BdAnbCCG7TxV2ur6Cc+NMH77t0HVHoCweJ0i+kCfgTVlBadZezszAongbOBUCq3KPWHSNEknWiNnK/gehzXN2FF5pELrO0nktBzjJmEf3BuuuxJYSS4f+lxdwCQ7Z3OeVblc/84CiW02NKfZVD7N2c56YxCWqwIayUGxE4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(6133799003)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hhQXB9nf8x7vFqTeOhgDFyEALHPqCoFRRaUTQ5OqmVqkxeYlaHxp2G0Vmr1x?=
 =?us-ascii?Q?FZf9bvmcxHrgHWvGMwA35phRyiq1dYtf5Q4K9eXRdwMNxAzqRX88hrYfwcgW?=
 =?us-ascii?Q?Kb6WK3GA67vwO6DXWZ8B3IH5oxF6kCoFGWlz1HLpY7Ie12DA4k1OGj0reXks?=
 =?us-ascii?Q?TeIkW/V/4Yy3nWKeutSPWUipYPxj9D06dRMq3Xg3yUMsu4dpPjIkKeSCjpH7?=
 =?us-ascii?Q?lRPqMyvLaviLuA8H5r5Jk1OpbTnjWp1TWZFr5XaSu+rwkC9dVUFJ3kJMrgZA?=
 =?us-ascii?Q?69si319SPPRZ/E1c7yYBPObojWJxZkiErg/8WNMtXIv0L5/+QDbNKltMaUQv?=
 =?us-ascii?Q?8iXyxhaC5jv+B99MVHH0W45DXKjV/ROah5Q0/Cfavy+dWIG8XfsiZtzjwM8m?=
 =?us-ascii?Q?t1zvhzDgfR7JU+tGgDpX++eMHtxyvot0SPS/UdZaEUehDA2jG9C/ojIlfYtA?=
 =?us-ascii?Q?gX+KKl34ARex5DYLsLkCQiGM925hUOJue5GSqRBfrqeAooaByHGI87NjG3Jb?=
 =?us-ascii?Q?tQ5f/nRPyXr+fxHNGsG7FELIqygLLCfN57aOdYUmc3xx101j0AxB4cXLcoFb?=
 =?us-ascii?Q?3i0kVKOvCPPntdJhHUbWw3eDyvsRBvwoG0SKfaPWofDnLPCzf+ZAO5vmW6Cq?=
 =?us-ascii?Q?rkjFfHG8/JioHO/uvDe2DhKx038ioAs111oS0Hx3xenQexFZViek3BqCz70n?=
 =?us-ascii?Q?fPLeiQvXAAuJWBnHgQAgNvP5EPhLR/o4TBIHMo569mSJoqe9zHGIDWA2YcTW?=
 =?us-ascii?Q?GwEuVqOgNissz7wyQ9NNLHM57wMDKGn8qmHG+rAPgcgWKvMPr4CWRBCTRdgp?=
 =?us-ascii?Q?EZPDVEMCIRebn6TcRhcfq3ObQOPievjpFGQtCfJ5bqJSIHJuQqvA5i/lNaiX?=
 =?us-ascii?Q?yUr6d6N8Nr99o/0rMlvHWoFtLe5y8zD/imQzeExWa4MLX8Z8F2dzT2JTLGaM?=
 =?us-ascii?Q?1UdRWUNmfMPuAZctFG3pKc9ILDualuzLiC1QXD0xVlRPnnZN+heqdHvD/bzA?=
 =?us-ascii?Q?4vab2Dj9uuYfpeMjT9JxP/gVc9pcJq5TbO2MgMGLwzGM3hkE8bZb0koAW2H1?=
 =?us-ascii?Q?svrB3qKEbIwNwalXrF+ycFM7head4prp4JLYeBT1su0ymFPWDlOJGwt5Wi46?=
 =?us-ascii?Q?eThkAAEqNiehzXFruqukUWpBhbCFxWP82PJ0eB1PwvKbAQV3aRRgOxcmjSZI?=
 =?us-ascii?Q?OlMpXgbRDyBWBPVwCzNQRCSc2VqY929lfwK/GjCaBL57+rvJAXIlJGwEwaOE?=
 =?us-ascii?Q?9hzsbHrdN0b0QHK8fXMewfuAtp/BFVer/ynwXtUvYfkXsFSw057HlcN04rsv?=
 =?us-ascii?Q?V9a7DUMW1J1HFmmvlY7RtBvDJ78v1QK/TfoCEfM8xV3NPZAa0eUYcqcYwVqu?=
 =?us-ascii?Q?eqBm9G8YiCJDR3YNRYCDx5e/Z9XRdib5itLqysuyc8XN2If1FRErHTSvHNnC?=
 =?us-ascii?Q?XbMwL0ZgMMNy9kJOlIfmSbfJJI+CP1BbZkmUKZNZYUrDD/MqZz1ZZwlZHbl0?=
 =?us-ascii?Q?IlMYesZkw5G8jOwcgC92by7ghOylQ9KPQpApxT1YeJfzkEvO5kEZe10Eqr8X?=
 =?us-ascii?Q?o68RLDVsSJDK+OE6KZMxAKjryjj49AK488FClL9u+t6D3c7fcEzhG1liQJRj?=
 =?us-ascii?Q?KrxINXgwwrOgXISOktPeXaj6Jb9ykjU2klxLQdVYsCzhiWXHg4HzWh0uCZhr?=
 =?us-ascii?Q?tDeuM1bO+YTzNumqaEMIA33Esg4Xod7Bxhp67XrHTeeYRfXRuuWkHRCKb34X?=
 =?us-ascii?Q?6xBnZIwVDuN7AaeS056z5qUojhgAMyg=3D?=
X-Exchange-RoutingPolicyChecked: sBcn13ppyjYQ3/Lg8Aju/AB6HKnE+TUmvDii6ZI14aO7H2yoTZv7WmQxidSN8zizq+/ykrtIf1nPGwC/WQfvkBy7jRuZOzb4usCxC8CP4y0jaiHwocHWMG01oJrYfCW6VicqDcMeNUcFwG+39B3gCMrs7uXaDjWFTa/SsCqmgOvk969fWP7UuPJ2GJ9BgdyM4KkK7diZvIqveWc0xmjcS4h2yUBPTj4YhsEoDR/7M2VPBVCoXjZRdYEYXLXuHCkq5a7GpCrxoPVFFhWPmNqKRqOrTs0s7mW5FbA6m+I0jKOfNVUvT7+GhJtYbzhU+KktXDJFyXxSFsfFyYviYyqleQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e0cc406-6b8d-4d20-623d-08df0ece8847
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 00:00:32.5895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zMv+tx8jclLrnhGDeTY3uQEYPF8zMvqIwKEwiOG1AL52tkQC3E4hoV38OOlWgHJAX1D1SzeGb3RVh6gAmBAmmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB015790
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

On Wed, Sep 09, 2026 at 09:08:25AM +0200, Jakub Legowski wrote:
> Move wake_up_all() after clear_exec_queue_pending_disable()
> 
> When a SCHED_DONE G2H arrives for a banned exec queue,
> handle_sched_done() calls wake_up_all() before
> clear_exec_queue_pending_disable(). This creates a race with the
> wait_event_timeout() in guc_exec_queue_timedout_job() that waits
> for pending_disable to be cleared:
> 
>     smp_rmb();
>     ret = wait_event_timeout(guc->ct.wq,
>                  ...
>                  ...);
> 
> This was observed as:
> [drm:guc_exec_queue_timedout_job [xe]] Tile0: GT0: Check job timeout: seqno=4294967169, lrc_seqno=4294967169, guc_id=4, running_time_ms=0, timeout_ms=5000, diff=0x00000001

Wrap this around in the commit message?

> 
> Moving the wake_up_all() (along with its smp_wmb())
> after all paths that clear pending_disable, ensuring that waiters
> always observe the updated state when woken.
> 
> Same as for runnable_state == 1 in the beginning of
> handle_sched_done().
> 

Fixes + stable?

Logic looks sounds. Sashiko is complaining about some pre-existing
things, ignore those and I'll look to see if these are valid and create
a follow up if they are indeed valid.

With an update commit message:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Jakub Legowski <jakub.legowski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 30 ++++++++++++++++--------------
>  1 file changed, 16 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 99d8c807ff05..a181b5042293 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -3239,25 +3239,27 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
>  			clear_exec_queue_pending_disable(q);
>  			suspend_fence_signal(q);
>  		} else {
> +			bool destroyed = exec_queue_destroyed(q);
> +
> +			/*
> +			 * Make sure to clear the pending_disable only
> +			 * after sampling the destroyed state. We want
> +			 * to ensure we don't trigger the unregister too
> +			 * early with something intending to only
> +			 * disable scheduling. The caller doing the
> +			 * destroy must wait for an ongoing
> +			 * pending_disable before marking as destroyed.
> +			 */
> +			clear_exec_queue_pending_disable(q);
> +
>  			if (exec_queue_banned(q)) {
> +				/* Pairs with smp_rmb in guc_exec_queue_timedout_job */
>  				smp_wmb();
>  				wake_up_all(&guc->ct.wq);
>  			}
> -			if (exec_queue_destroyed(q)) {
> -				/*
> -				 * Make sure to clear the pending_disable only
> -				 * after sampling the destroyed state. We want
> -				 * to ensure we don't trigger the unregister too
> -				 * early with something intending to only
> -				 * disable scheduling. The caller doing the
> -				 * destroy must wait for an ongoing
> -				 * pending_disable before marking as destroyed.
> -				 */
> -				clear_exec_queue_pending_disable(q);
> +
> +			if (destroyed)
>  				deregister_exec_queue(guc, q);
> -			} else {
> -				clear_exec_queue_pending_disable(q);
> -			}
>  		}
>  	}
>  }
> -- 
> 2.48.1
> 

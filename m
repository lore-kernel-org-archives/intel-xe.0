Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D189FC001B0
	for <intel-xe@archiver.kernel.org>; Wed,  9 Aug 2023 18:29:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98E5910E492;
	Wed,  9 Aug 2023 18:29:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79D8E10E492
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Aug 2023 18:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691605794; x=1723141794;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=V/bzCRXdPQLV34gP0E9DQc9xthq6wNYLluTt6ciMPYk=;
 b=U1hp1EhEVQYfQ/Jx1l4KqGeuORBRwbZgwoxUsRo7vme22l/DuI9bOAiQ
 8Dju46uphcVHa1eMa6D1DaxUNcuYwiDL916mZ8xby31y44SLXxG115oNU
 0pJ/Q66LmiJVt+3hOrfV/CBt4/rv/aQmU2EsdYQSGHanxosgSW+JhiOZE
 Hj5TVBBEEyGm4/knjhoB8bai/ux6WBjDyI99lmPGbG9gSA2CWM3E6HnKK
 nSe6kFtH+/gpgzmtkwj8eyM0sXswve5oIQ8Sqe6o/2dJx43nbvHYCwvVK
 XdHQmfnVfFvUjrW7DbTMnRGuPfKKzXL/3YUjbvnc5sDPmDxEM84/VwcKv w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="361331791"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="361331791"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 11:29:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="905758236"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="905758236"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga005.jf.intel.com with ESMTP; 09 Aug 2023 11:29:53 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 9 Aug 2023 11:29:53 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 9 Aug 2023 11:29:53 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 9 Aug 2023 11:29:53 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.49) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 9 Aug 2023 11:29:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RwbflIhK47hEDV3WvS7UX1XkJYxFU+ahWct8L4Mh7qXNT8hBj2V4A9fEYqxMhoXgPCSYDp7Dy5O0UJDQkvRoK9ZxwNYyTGCb1vIKGM1C0A/QOXTNZi4huqPD+PfB4sF+acERJAijNIK1shtdwWeFqkuDbrbQ6GOftSACTl//gSTCz/g0WPNuoxwW2ywc5dir3uPUCxaPJl+JFNHldYYOcGhFzu7XeBq/gPujWgZsqWjzsrMJSDGqmisoqBNFyRjdoQH0O/C5mYh/3hY72r29bDSp0gzw/moJmNdt7dLwxDrvmnrQLrx0JoiGIc3vXFOuGcXTjk8D3Pm3lflV+qO+kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OCJq5S0F1ZaACLXXyXAQ5DZQu0/jvWlAYqMjKCubQf4=;
 b=bGD4R9qkTyXlDhk+l4Bcl6TuL4eq4rLJovCPBi55yxPNfYKy9OXr7VlobgTAPeJykO64jKtUv1EmX8oMfpWypNjQuh8CKYGxpTrEhFZgVdrXUs8/PrFjYxORDL16SVfznA8WOfkvS7V7iV7nS37DIpbCMAi0zqOY9m9OKjwJwheoxYC3nKqb7vS39zS3/7kMDBzQ710MxnxuKlTSPVOEOmQ7ChkorTvZ33Ktgvn0404jemreeKiwMGufaxePwzEBfzo8/avfvxVDYmYYHlT2JZcizXrTKTkyu94kLeh98ZegPgsjic5FXgljR0Ae5XFmS/M83oT0eGIp7YaVnKY+rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB6325.namprd11.prod.outlook.com (2603:10b6:8:cf::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Wed, 9 Aug
 2023 18:29:50 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522%4]) with mapi id 15.20.6652.026; Wed, 9 Aug 2023
 18:29:50 +0000
Date: Wed, 9 Aug 2023 18:29:00 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZNPa7N87ipQ4G3C0@DUT025-TGLU.fm.intel.com>
References: <20230809081617.181257-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230809081617.181257-2-matthew.auld@intel.com>
X-ClientProxiedBy: BYAPR05CA0090.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB6325:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d342272-13b9-41c4-30b6-08db99069dc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dUObV+h+TXDHJkSYUQfuj+gq1SrBn2nEezdzpYwJ9uk6UHp0PWF9uwAlAowWI+0IT8tjsy2faQf1lQbnt2Um9TNSxovy4xZT2waAp+o4SBYqStNENl1rJIboqwvKXFNcuBoRmV/OjH4nYGVy7FLlpJ8mG5WpiZPO48G65u9z91DJXARuiHubgThk8rQJVlkcPRSnArdCqWVnkhvN1BT6hYho3ek8JO9n2eI5K8Fki9fePFcy68wWkQyVX3tYkJgmcNGBaaEShRIpOyj8M7EZJAOJ42m8ZZ8tQ5PVmXXLE5i5pjgpdDhmKox+3PL/dcFC1KPnvXvWIfV079hEYBQCauJbUFWlwdCjnsJRiYGoCXh+XfWRxM60MzOzN1zJnJ+VX78NcAuWq4n4iagf6OpEowhrGQCZSyxi9UeZMhb9JG4xoHeZJ/ebFwItsAFt+tyYAfUttsHu4//lL7Cm7M4dRXB/g2nfhA7o1v6G84r3rXVec9OxdxVkwHc2wyUa00sOE78lOnru4B/1Yq+MUKz2jR0cZv9TAJYZoLt8DNAjtMOYemXC8xIDPwwmc9bBhrA/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(366004)(346002)(376002)(396003)(451199021)(186006)(1800799006)(38100700002)(26005)(66556008)(6506007)(83380400001)(82960400001)(2906002)(8676002)(6862004)(44832011)(5660300002)(66476007)(478600001)(86362001)(6512007)(316002)(6486002)(4326008)(41300700001)(8936002)(6666004)(6636002)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zOqUigSHdWIpqqcuwh5aj8xpZfennOjrWJGsZ6QtW0Eh+8H5vNYvrYAO8ocT?=
 =?us-ascii?Q?rDGmt7ygKgg4ho0+GpmAEP7q69K2xghZDL0V5UoNtCIafrsVDJ4ggXevVViw?=
 =?us-ascii?Q?n5ZxbLMLSdaHlFpLJ24Hde+1/uYTjCxtcp4IzX+ygg9g/2pfZW6CHsGw59Zm?=
 =?us-ascii?Q?Bq0HBlq7zOf9Rb2qrnifM6U37vnbaS86yM7ogV5gue7A/4soDBLCdL3rF+Kv?=
 =?us-ascii?Q?A94ncM3q+ch8ia3H4AiYDJCe/iIUwiGiMbrbOK878Ok76lS6Qa4B0RB9UmQf?=
 =?us-ascii?Q?hppWPxCRfvedUPTXo8Lb++Kuk4nrPZ7nWSoUR8oUWYZMWDc5wZA4Aaozhknb?=
 =?us-ascii?Q?bePR3fXMGSC6evCjus/tJ5AvD3altzuQdKNpXGbpO/d4AGB/lubPchJRtGJ1?=
 =?us-ascii?Q?LPGznd0yocQV3FvIdogIiXcsaYFfwyJXX1Axd8tWYiQJ+tydF6f9O1hn5r4K?=
 =?us-ascii?Q?brQ8Y+qbIp0ezaQDTLFq/4vx6sH/06Qy9onltK0oE/zLPNw5MRaWzQqTyKDo?=
 =?us-ascii?Q?b6atAebXfP8u/C+0g1qCPRBzHNJvwmg9gGPYKwRfSWC78sYR3CHMB6DlOtCJ?=
 =?us-ascii?Q?mSjMMy+Uxvza+GoEkW/XADjmMEXGhHvHXl8MsgYrjeUP2Kqrzt95OTL/sPaA?=
 =?us-ascii?Q?7/axheXS1FEuWFQ+fa34z2Zg3fZKlYHRV6P6px2/rwmB9bwcWE/kWNKHsEz+?=
 =?us-ascii?Q?o+54lpFU9/eYSnF5W6ObW2hDXK9/7NPLswXesz+kjzEHLlbkd8hlVqgC3ntq?=
 =?us-ascii?Q?lfAez9PssPTL4WEI5tI79eprW7Z/CPmj+LjeyOuV+l2dQrxKw5oilMpkCU/a?=
 =?us-ascii?Q?z92yfhMDPR2JIV3AvyqXwDqdvVHxkJt9+EezbcyNU+0Rwg6iolyZuV444xCD?=
 =?us-ascii?Q?YxeA9MYDMThdtmRkFZ5Xc38fkELtyecYFOzY4sqf17B5gxt2ZmW7aPdJXcJI?=
 =?us-ascii?Q?Q5OwM4JoX9AlANsba//l0pk8dL7dNAiCxEvQ3unZc3l5/XeONC8v5//eay95?=
 =?us-ascii?Q?TgMIIdc8y/Q7bAbxbSHoGFm+GL6jI+pMJ8JWyIy+MDjkbpkOoegUgsVooabO?=
 =?us-ascii?Q?4P6J41brBHFXopikoG615bVP3Nfl7emLNnMau+Lt/gIrxHvEQWPRSYF8J7cr?=
 =?us-ascii?Q?Jxc5BqhP/SSinXcblRoWOfF+d/31oXHzMkPpdQY2XGxzDey8i6j0XL1xx9lN?=
 =?us-ascii?Q?Xls4uB7ejkdxj6J7O1Xhhkre6wY+rUkgYYjLjl+or9XMKcbxZB6ZfyzGrvP7?=
 =?us-ascii?Q?hHsYg0U03kM/wzTQeFOs8wlWN7+JuvR4//xvGoIj0haYiJISVyzLuKHJliqe?=
 =?us-ascii?Q?HO8z6TX5Y7ihXsbd52MCJDYzxTVUJAs7Wl5qLkh4x1I4CNwc2072umQ9F7qt?=
 =?us-ascii?Q?XOmWPJHVFIdrRI1aYg8edU3eBgDZPKkqzrYFunzSLYCA1eDU4ZL3kXG5wZ7q?=
 =?us-ascii?Q?RVXiCvGKOVGGeGApkzdMTfNheAjwwScnVTP9bmjiKUque2a3hXyl5GMoqK/1?=
 =?us-ascii?Q?rjJIYWUqh+XcDqtM/vcGRlHJTs1pIEBKnYSiBSGOplG9i2wZC3UkyNGyBhlD?=
 =?us-ascii?Q?5c+WzE69gviRxy+DEHFv8iRKGLPKOuX1slTN0ygyKEbm1XkVrHd3SgiiqSa5?=
 =?us-ascii?Q?VQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d342272-13b9-41c4-30b6-08db99069dc5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2023 18:29:50.5826 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zcB4DzzminT1hGOqHXodw9x0G0iCRBFzaEglKHZ+PHXs6S7SU1hrBIwsIJIrVEJefeCZJe8GkOoSBx2o7Ln3gA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6325
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3] drm/xe/guc_submit: fixup deregister in
 job timeout
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Aug 09, 2023 at 09:16:18AM +0100, Matthew Auld wrote:
> Rather check if the engine is still registered before proceeding with
> deregister steps. Also the engine being marked as disabled doesn't mean
> the engine has been disabled or deregistered from GuC pov, and here we
> are signalling fences so we need to be sure GuC is not still using this
> context.
> 
> v2:
>  - Drop the read_stopped() for this path. Since we are signalling
>    fences on error here, best play it safe and wait for the GT reset to
>    mark the engine as disabled, rather than it just being queued.
> v3 (Matt Brost):
>  - Keep the read_stopped() on the wait event, since there is no need to
>    wait for an already scheduled GT reset. If it is set we can then just
>    bail without signalling anything.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 52c61f78b083..90ed47cb509b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -881,15 +881,17 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	}
>  
>  	/* Engine state now stable, disable scheduling if needed */
> -	if (exec_queue_enabled(q)) {
> +	if (exec_queue_registered(q)) {
>  		struct xe_guc *guc = exec_queue_to_guc(q);
>  		int ret;
>  
>  		if (exec_queue_reset(q))
>  			err = -EIO;
>  		set_exec_queue_banned(q);
> -		xe_exec_queue_get(q);
> -		disable_scheduling_deregister(guc, q);
> +		if (!exec_queue_destroyed(q)) {
> +			xe_exec_queue_get(q);
> +			disable_scheduling_deregister(guc, q);
> +		}
>  
>  		/*
>  		 * Must wait for scheduling to be disabled before signalling
> @@ -903,7 +905,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  		ret = wait_event_timeout(guc->ct.wq,
>  					 !exec_queue_pending_disable(q) ||
>  					 guc_read_stopped(guc), HZ * 5);
> -		if (!ret) {
> +		if (!ret || guc_read_stopped(guc)) {
>  			XE_WARN_ON("Schedule disable failed to respond");
>  			sched->timeout = MIN_SCHED_TIMEOUT;
>  			list_add(&drm_job->list, &sched->pending_list);
> -- 
> 2.41.0
> 

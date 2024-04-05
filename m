Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 767A8CD1284
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 02:16:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 178F11137C0;
	Fri,  5 Apr 2024 02:16:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IYwV7QZi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A58E1137C1
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Apr 2024 02:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712283390; x=1743819390;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MaOmyMBxBxKYwxGpfnRMp0ZIH6XIIFEY8maKrvshPW0=;
 b=IYwV7QZis0AbrC3CWHJWsHeopAxiWDENR/M2uIqr8l7BLgtH7edu9oXk
 Ap5WmCSAmje19+2lBdhvue+Ocu7LrEdkniy0AjMtEHKrxi3B/8pQu/wSD
 +xfRBI2elM74FrLRxae3W+DYB+Zx+qcSLmfjkz22D/JIalfQvwqmp9Qk6
 HQxqJxsT5k0WA5ud0+J48hUX7G3JpDH7bbZ1mar4eASEqkM4oozv50KC7
 bQ9FyKovL7Zrl1sGlFzsMcJYNRzmWKMoqOYRLiCfdOtdVynOJqj9ef+P4
 Av2c80Ju++A4XMmcmxDfw3V7VR4WciyAX9pcWjh9+hiYKk+j0k58Myw+M g==;
X-CSE-ConnectionGUID: 40RGNGtHR4KuHB4yL7H8YA==
X-CSE-MsgGUID: kGkLjU8cSI+Rlmvxbl0H/w==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7447420"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="7447420"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 19:16:29 -0700
X-CSE-ConnectionGUID: zphmfVMkQMyH9S6zjm53rQ==
X-CSE-MsgGUID: A2msdKazTuC5JnUM+GuFOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="19575375"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Apr 2024 19:16:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 19:16:25 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 19:16:24 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Apr 2024 19:16:24 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Apr 2024 19:16:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c3Dn6Jj4JvTpWrYDGkoiUdPJx3qVamH7Nwunf862K29nKvpypQ4IPHXQc/xR6zMpLJmNukmVaX/F1D0thiwJI7ZrlRvocZ85RP0041ORZGfuSeaP088PQFr34usx8lwBm59Yf9JQY494upvB7PysyqUS45ax4bf4lfDgMv/udWGwm6V4QsG/tN87HgrZRuA8cmQB1YwgZAUpG0lCxBLynXoPwAlZDpBdct6/fmjdsSr/w0lQjsx3kjmT9ZQHA6YoTLnG1LEdbdKhjuDKG1NidzrHov9o9E2fI3Ske+nYTKunOWXKJGr+l131fQT9wRXDR6c4GjZmaYdeDiGTLwJbxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4aobpzlTmXoVzC+VNIdmVJEyrY88q/VhcbC72vL6SJE=;
 b=AynsgmidqVvSpFrbLRwSzZvA0CKIszTr0IigluFhLBN2csdeWUixJGQG/O6brBg0fbHCiF5MOwRunzPkvuM2rIHyDKD8/OklxZal/qSQFThX8HK+QPAr0f4noDmUxALqr+FQXaoEF70wG9UrnsdfsJE3Xlht+two5gfp8eAhEveABAvGOnjx+x62OopWUSph7tCtvgDmDtfz4RK1wHiiBqXkCEJNdtIDdRhQNcM991EkWsTRhUNicq1kuQ+h+D6wSVpNTNRXQr+MiJeFAtw3i/bGceqY83X4eNexChhSWhOgtJqOYcLefX0MZCkM9XRKN57tiGdRUULdpvLn1DjaNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6905.namprd11.prod.outlook.com (2603:10b6:510:201::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Fri, 5 Apr
 2024 02:16:22 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7452.019; Fri, 5 Apr 2024
 02:16:22 +0000
Date: Fri, 5 Apr 2024 02:17:05 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <john.c.harrison@intel.com>
Subject: Re: [PATCH v2 2/3] drm/xe/xe_guc_submit: Allow lr exec queues to be
 banned
Message-ID: <Zg9fISDBZFPvWAPe@DUT025-TGLU.fm.intel.com>
References: <20240403191950.242642-1-jonathan.cavitt@intel.com>
 <20240403191950.242642-2-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240403191950.242642-2-jonathan.cavitt@intel.com>
X-ClientProxiedBy: BYAPR05CA0069.namprd05.prod.outlook.com
 (2603:10b6:a03:74::46) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6905:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x4OzzChzbM9W6k4lBzMA6zZu2nisT9RjperCsM6/Eh4ElgFd8rc8W1kOzaNB9KjNdyDb4IezdrBBMrjwp5U6CJCsUXE2a2C/QU/dLJ3wVhdYFadXTNSDysDnJO5sIch3B6M5qjugQdbanCPtzd5mH9d3olqM2yB1wbrauqHXrJe+LkjX6f/J7otq741689UxAlidzl8B2hdWKtCeFVItNGumu4K+Ejw/fWEqL4bxtfVF9Psc0wJjSBxPj2zHpBOTh7jI27YI3hmbVh3M8l5drSg5hih+IPDKQAYv3QZ4hQAApYzMVgWYZl2X8YTEu5mSYLwhMmNM0aJNbrdDvvJ6WDpz2xmglLEZvYOjLhvn823FpwFoHHLdO9wTHguCXpTfWk5SBBkZnnxymyfdtYCQ7VDI1jqQAHk3UDtoAdqIG6s2aRL48cV2ZJ7QczWHATeiZvPjwMp9e3GESGDZd2LaVTaEEd7lAUvk5KTS+hkLgfOAH+07VWb6eK9vayv2GO0etA4JE444ZnRhFArLYPTt8sCBTHgK46RNZGwTLDHWJt+jeD0dUZTO0IjCqRXh9ig4FHvWersBfc4HCbYsKalzDmcBVaAN3dEr3j3nq1V9XlhOpdWJjwC886cbGdH25UKF0bhrs7JTyEeG1ZwtCMGDTchYOIBAFhTvbLMpDOL9gd8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0ADY0pS4cmYr2Ms/gJ3KaEkt6vsy9O7ZPMMVq3no2E3hK+u0S2xVits93/Ne?=
 =?us-ascii?Q?uChoaYowqn3hrtjWlHbKFR7c10g9GxueRW6ju1kFynutukiIsf+F/bhtHkBr?=
 =?us-ascii?Q?PIsEPUeyVap1NtY9wH+vmd+95og1mjRmcg3TZ694nWLjX5dW+C0qOFe+YlaT?=
 =?us-ascii?Q?XvSP+usA1BEfgxNMGR/KJeIl70Ir07eFVvsOD/erYlaSWYeMI+Hvk2PejUP5?=
 =?us-ascii?Q?wWwcEEX0XGzhKY14MjalyntSht3M5OuI7ZfBPWCIMBiwCthJXYjGWAQpIdG8?=
 =?us-ascii?Q?IPyqJp40AdbcEjJPQvbe9w9ThFWlTzND+0kkvvbpkSoBRuZUZ0M1+ewCaRXw?=
 =?us-ascii?Q?V8P3nZI+bWM7aOVztIJqQ8IGvHspRU7hcjIcni9BcbPGuOWrfAsm5Cltb7Ve?=
 =?us-ascii?Q?lR3yugYegWMqr9X3FR2yk7xx0Bh8enQ8f+XsUSk5e6nMLvNm+a1BvCE8KXKX?=
 =?us-ascii?Q?bFs11oTBK6N2NQCQ848a+eRxdSsZecj1eMUePvDT8PkDIX1/0WnfSmooqSbK?=
 =?us-ascii?Q?0B1nF6nNYruIy5k/dAlX2IliK3CxmiU0oBYCFLBmrFIc1lhIZbhIJ2RATIzm?=
 =?us-ascii?Q?rwpCgT067NxyfYuxPMUDfzbrcTFVdcAprUCOIYtA2lSOwmC4Q8LUh9F5/maS?=
 =?us-ascii?Q?zEjdxCTTZunKg9oppQZsnblplb1EdZ6GJ7HaTTllgjByg2vvbuof3M9Rx8R9?=
 =?us-ascii?Q?wliMsnBC2HKOuS0UKLvHOIEJmZsq+E8STZ3Oo9bvSHjv8RIoNdixjSEyq0H5?=
 =?us-ascii?Q?aMY2NygwXEu7DEUUMVb/AtSlogkQbHO0DGJIK5YZRjbtcRBZNOPQzm927J0d?=
 =?us-ascii?Q?aDTz9tm9Uj/4VxkcSVeSZu6xot0dRSNYxBAswq01Vc6SDlF4ZCmOIh4lr9d1?=
 =?us-ascii?Q?HT8YSKunf6VD9Nsca6Q/vvwnMpi96LOMZJH+ijccoBz8YbPOjbeHhuRC9rY6?=
 =?us-ascii?Q?4GXYWDAleaPGEU3Y8P1htFlCQyx93pzdhQLVs8pkxwyhbUdNTMtoNzqan1zf?=
 =?us-ascii?Q?dmv+oIMIGMggnGs7Oi8xeIfBeKgBIvMktf6rxsrgsD9KYyGLiHR90tc72Say?=
 =?us-ascii?Q?KuvenZVT47zGhHfMQsqTo74lIs6vUNf699dsLTUWAxG4X9IvkLgxNSIugOpR?=
 =?us-ascii?Q?D1vPPvMoEm6GpeBK+o8Gh5SjmcNEYkdRj9ZAJZY1kY7uuQWpmYn2aKNRycHB?=
 =?us-ascii?Q?oPfQyWl8uz/6Y73O6ZDALOaV3yFZX5Vq56UjWGHKOJjPA9u1rijkuXBSj1lO?=
 =?us-ascii?Q?fQWQDgo1N7i++aLZbfIAewAZi6oc4h4Orq3FmNpw4+jgqDis8uXkFID6SXhV?=
 =?us-ascii?Q?DzRAOPwbKRMW2VVDm6QJRA6SzFhoxlzVVi1CCn/lXx/aHJgmN9ecHnamgl0b?=
 =?us-ascii?Q?lTb7PQyQ6RFgb+gd0dBlPbuVqU0tnkkN1ENmLEyNmTN04QBfK/Th1VAB8qDo?=
 =?us-ascii?Q?FRReLgsfMXvEMSbYs7NmPuoZnmR5g+L0py8L4SXO2lSIZKpCpm8PDMjX0/A5?=
 =?us-ascii?Q?mO/Se0XVrVAMDUtFOfNzeZeMbQ/hgcV+12fWzMovGdL5LorV0MC4Xdo5fKya?=
 =?us-ascii?Q?DfKU4GYlcQ3w6qtdLwQCYkL6B/d6D61RjZ0vN/bS88ARcOloRrK+QWVTGqmf?=
 =?us-ascii?Q?Og=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e8db3764-5926-4dba-8931-08dc55166360
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2024 02:16:22.6562 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CqezMzHP6rL5FQ94zH5O7989sF/VwEdKDzvZVwAB4LwesQgrCdgWvv4wG4EkIlgv9LRPcyzQJt78SxwQRe1yug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6905
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

On Wed, Apr 03, 2024 at 12:19:49PM -0700, Jonathan Cavitt wrote:
> LR queues currently don't get banned during a GT/GuC reset because they
> lack a job.  Though they don't have a job to detect the reset status of,
> it's still possible to tell when they should be banned by looking at the
> LRC: if the LRC head and tail don't match, then the exec queue should be
> banned and cleaned up.
> 
> This also requires swapping the usage of xe_sched_tdr_queue_imm with
> xe_guc_exec_queue_trigger_cleanup, as the former is specific to non-lr
> exec queues.
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> ---
> 
> v2:
> - Fix Subject line
> - Modify change slightly to remove need for "ban" boolean

I prefer the previous version to this version.

Matt

> 
>  drivers/gpu/drm/xe/xe_guc_submit.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 294f40ab6aaf1..c93ba4bc611b8 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1428,12 +1428,16 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
>  		if (job) {
>  			if ((xe_sched_job_started(job) &&
>  			    !xe_sched_job_completed(job)) ||
> -			    xe_sched_invalidate_job(job, 2)) {
> +			    xe_sched_invalidate_job(job, 2))
>  				trace_xe_sched_job_ban(job);
> -				set_exec_queue_banned(q);
> -				xe_sched_tdr_queue_imm(&q->guc->sched);
> -			}
> +			else
> +				return;
> +		} else if (!xe_exec_queue_is_lr(q) ||
> +			   (xe_lrc_ring_head(q->lrc) == q->lrc->ring.tail)) {
> +			return;
>  		}
> +		set_exec_queue_banned(q);
> +		xe_guc_exec_queue_trigger_cleanup(q);
>  	}
>  }
>  
> -- 
> 2.25.1
> 

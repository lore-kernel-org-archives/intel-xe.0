Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B73C001B0
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jul 2023 19:42:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D99910E4FF;
	Wed, 19 Jul 2023 19:42:05 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37E4910E4FF
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jul 2023 19:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689795723; x=1721331723;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YHtwDCyonbSyLyIbSH+r7Wgz0lARRcBaTILZxVUacLs=;
 b=fFzIDw0viKkURVdf8GVqu5JiZ1kA6mVbvZICdT2xTB9YFlHUuWmCG80X
 vk3pNpaz22L+hRJJWC8k2Y4+dsdkcvxwhYy1leDGFuT/h4WpvboeA3n9Z
 EwznJxmFBD1dxujkIxsWlzuBTExrgujox4FWJHBa6o2Qvj5M+3sikYD0S
 v2GNUgrVuf3zpA0tz9tPzrCAxzowuEO+1Rblo/sGS9bXBWq8WIWH4Rhxk
 EV0wCUZ6vcs+XlpNufY+xb/cSkR+JVKe+bXwoE8+5Ir4u9rx1CD7+ckkZ
 AUFGoEjHFbKJLnWyI8UaLBoMPMo3+rUXbnb/yx+DDKVsys1d9ayHHVp9H g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="364016672"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="364016672"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 12:42:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="848158292"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="848158292"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP; 19 Jul 2023 12:42:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 19 Jul 2023 12:42:01 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 19 Jul 2023 12:42:01 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 19 Jul 2023 12:42:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CcwHBfX1QPNDnWf4WsAmxepEkUbU5FVSBDbFK8Aqsy/Px591QTk79JuqnSgVeJhnQ4h/zjITCw9QAYCeMU9Iyg5NNTG7PIJE/mo89oxPhRbqrVmOrF0VCtcfrzDZsm/IbgfVyYMRP92eL2xuMkmQQON0R4fpuhhZvvtT+adkpkSJLAqmRhfAbZrBlK2kgsG7kDZQvolKQGKLtNpCLB+7nnAY8RYD6fRc+Nv3a4o05uZYP8NKe7gkDIxwCzC5mfqKFu95az7tZk/8KYYydg8KqP1T7c3azZB21FCnG1c2LmTuFA6OAU5vcfVZienH7VocUjVDSMyJV1Brx+BZ+UH3BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yb97SPgv3z0aoBXyntkzg+xg9rJoPYWN/+sVoMwKp+A=;
 b=QqR1uDdFNeicBHkqF0nvVo+fitQ4CGavLw5M+z6DcliODsagPtBAOm4oKjAAoWCpC+PVsEhaHzIM9uaRscTP6K63WlaXYyxgoCKOq/OoKlamLppNL1Xz7Xs33wrt+8pAnxwNc5ftbjvEVgIjyGVBlu2fOoatYvzTeqhJ6+xJzARwa++I/IJ7ei4KKR9dVotf0XsAt486V7YO/+vnlntU6CgVPZkQgsQyUyWnLki4yqZbRib/5NZyxeDHQH6Fu7UKaBdVAWYWhQdrNsHj5hQuU0sgKiTn5xZEQvvCaoQ6cjh0lTEpTVN5sw5TKAv64LjGk2NPZrdy5ZjPw4Iydzxa5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by PH7PR11MB5984.namprd11.prod.outlook.com (2603:10b6:510:1e3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Wed, 19 Jul
 2023 19:42:00 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9fed:e45:5a2a:6932]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9fed:e45:5a2a:6932%4]) with mapi id 15.20.6609.024; Wed, 19 Jul 2023
 19:42:00 +0000
Date: Wed, 19 Jul 2023 15:41:57 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ZLg8hRnlu7p2VWn7@intel.com>
References: <20230719185707.6-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230719185707.6-1-francois.dugast@intel.com>
X-ClientProxiedBy: BYAPR05CA0056.namprd05.prod.outlook.com
 (2603:10b6:a03:74::33) To PH7PR11MB6053.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6053:EE_|PH7PR11MB5984:EE_
X-MS-Office365-Filtering-Correlation-Id: 414de6dc-54a8-41d1-1760-08db88903811
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xbPfPfRK6vBsWm89bfleLaM5KjMAfsXjlOqb6afh5dkEQY3XasrtADEKo/VDtGsi3dKOtTEClKD11PVP066V6XL8uD9vtKe8Vm+x4dBeR9FlHhjvcausJEvCuBl9G69MsR73Zhv6bEP6BCKJqz0aMJDMAR2gZkDdCC4I/GZNhGv4LBhcV9E+hz4Eud1PPfyp/nrz2kP1TwCfBsu/MQfZ+AYVs9enf3RqjCFNVrPcB+WYF6Ssn4FkbV8zsEg67FXvbr/411C2tPOt75eqnaB56DgCL7OW/AN2qwM6+29LlVgd9seh+o8q64mpDWY/5a2YX8AmT5o0rk9O+ZnZB1BpTVmB0mKW2Xsn/9dbydabu52lIq2l2fjD4kia13dGB9sDNCy7yZy5ZgzyWt0wWYby2SKg7qL7xUW0FdOH69pC7HOp6ARTq22XsXM8iQJgtNcyC/5R2IV6+4dt1WFAhSc4k2ksqY+Eu2vZIkQeg58Qg164uADXjvsGI+bJssC6CNqNGg/SJvwpL8kbQWIo1Dz9kfzwNZl4fi6tpTJTSaYQUzHNstlhM0CdJt+JIyMJg2+l
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(346002)(136003)(376002)(39860400002)(451199021)(478600001)(2906002)(6486002)(6666004)(8676002)(36756003)(44832011)(4326008)(316002)(66556008)(66476007)(66946007)(8936002)(41300700001)(6636002)(82960400001)(83380400001)(2616005)(38100700002)(37006003)(6512007)(186003)(6862004)(86362001)(6506007)(5660300002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qGIbYc2W0fw0rwApDJWn/x/gDunZXz7/aQn48oUAjNnu81Ol9GyYG2SjNkQA?=
 =?us-ascii?Q?bsNOGNhDQc3sRFoxyichs5slK8E9imY/Wrvmxs0L26qllzss5AECOz3qMZ7c?=
 =?us-ascii?Q?7et/wX2qtphyRo1axpb7JuTt/FnzWyhe9jDvdA8sEueDZID2KUxuNMcAWO9Z?=
 =?us-ascii?Q?gAOS3M6ECm+qPXYQ1wPs+oIp9YTSx9SOqLcGx5h3oOHChotTLCyj+tWZpGDz?=
 =?us-ascii?Q?+UbsB5t5qz3wBGp4B5EnZNf591/5L6YsLMPxGMq/+cOLndmEl+u12m2mXPXW?=
 =?us-ascii?Q?H1qh1asiwmnYxYEHPx2WlnovN7ZfHNE4GKztndf/o9/1XwDOlAaUIxMrhgpn?=
 =?us-ascii?Q?Dfwl5qAm9kh1KX5SBmVYggUxRyJwiDwv8cl1O1YDt48dPdDmXbW4kyQpgEVU?=
 =?us-ascii?Q?MHQXfw6SOMS8TzgV1BhLIWZpvRpmBJmJbCvz+6umIfUsvMnxuUCULDW1cMv2?=
 =?us-ascii?Q?xUo4eAugUtn8C9eo7NRUDcNWBQeoWij5WVAocbP/COK/X9ja5b8n1UYx4qmE?=
 =?us-ascii?Q?Lcl7WE/pVinLlHvkb7Mo6zx22/tgQ1zLJQSgM932cVSrasRwwFuQLWrO/MF0?=
 =?us-ascii?Q?3bWUbuHXHmmxsCwSBuue+TbEF+wWMT35G4EYZ4AdQ+TQVHvoICZhHdHgCdpj?=
 =?us-ascii?Q?lGtMR2qCNZS4LQMvVYjsbSarJAmtFqzPeSVFYNiLEZ9T9UrzN7IdPN0yleyH?=
 =?us-ascii?Q?PGBDHe7TZQdG3RfUbVbqpk93L68APEnzdjj1GO1F7gna2GZi1448in/yoc5v?=
 =?us-ascii?Q?WwPOHyqECPTeUW7amZIblTZqeOhileetmzWOk8p6P0CYe+3iY2q1FrsF4yoP?=
 =?us-ascii?Q?afmkn+LyFnZLxRV9k//nYRtQjJB2UL5ACR+v6j/W1n3QnRra+TkXeeY7e1Wb?=
 =?us-ascii?Q?FuTSSiSJ99HLC4VQ22mXHu+a6Q2YQ358pFCtcJhl3rTiRnth/PPcgGO71jhD?=
 =?us-ascii?Q?RGqTOAlC5xh3btmbDnPYe2b7BhmOAax3gCvSCxwTjijteql8oaEWXPuLUeFI?=
 =?us-ascii?Q?+/CpXPK2S6O+CO5dLqgVCs25lHbyPYouovstWDGui9Fq+S2ayPALlGfJfNRb?=
 =?us-ascii?Q?EXlhhFaCQUPdvkzS+8sr1drV9qCyDkOxLcLVL7a1cKaptKeszsOE7KWWMRdO?=
 =?us-ascii?Q?A5dVeJ7UaeXPlkblWpY8Uggg/gw1U7IxHDHHcdpfh9xV5gDYwwzIuRvzuBMJ?=
 =?us-ascii?Q?pLK+3DyIULLaD03S1JDcgvhLnQ2iWjU0Y+2g5OMPzfpcVujHF7htSwpuU47m?=
 =?us-ascii?Q?k06Fs5Q3y2fKXxpinB/1IIJFLjUWDgTQa386jGVu0IREKBYu96rS2/sl96gP?=
 =?us-ascii?Q?X8Ghg4F478IYlid1nAaJGZTU1VlqRFpfwSqBrrzQd9E1Sxe8cX8jVYHxbeiO?=
 =?us-ascii?Q?FbHQPYYg0Ns07hp0QwZs5+WTi+qxvSOo7Nx+teHqurMVZRQXU+jxYLVnIWsJ?=
 =?us-ascii?Q?XEwKqN35YJANJnxR3LejsPK58TGTdwSyBnTA9YNPcj4thnLiCvapZdp2WJPu?=
 =?us-ascii?Q?cjQraTTsz+o6Fpqm6Hd9ui23FOhiSCJlfnjk3B27E1uNXGheLIdaK7bpyQtD?=
 =?us-ascii?Q?VftcCQy5zs/XpKWp5uDG94Mt64GsSIeMHJh5EEsN/YLqDepF+Rslrv85+vG4?=
 =?us-ascii?Q?jw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 414de6dc-54a8-41d1-1760-08db88903811
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 19:42:00.3803 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2iwD8Uxqz9UV1KzYi62pX7uHgbXZ9J6xjQEsZlmqsC1sl3+tml4qhkZaxoA5p7dXrqpVROIZ9B7IeLbJwcznGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5984
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/execlist: Log when using execlist
 submission
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

On Wed, Jul 19, 2023 at 06:57:07PM +0000, Francois Dugast wrote:
> Make explicit in the log that execlist submission is used to prevent from
> silently using it over GuC submission.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_execlist.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index 3aec37985f32..541f82387bb5 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -318,9 +318,12 @@ static int execlist_engine_init(struct xe_engine *e)
>  {
>  	struct drm_gpu_scheduler *sched;
>  	struct xe_execlist_engine *exl;
> +	struct xe_device *xe = gt_to_xe(e->gt);
>  	int err;
>  
> -	XE_BUG_ON(xe_device_guc_submission_enabled(gt_to_xe(e->gt)));
> +	XE_BUG_ON(xe_device_guc_submission_enabled(xe));

this bug_on shouldn't be here. if we have this bizarre case where we are trying
to enable execlist bug guc submission is enabled, we should put an error message
and exit gracefully, without knocking the system out. (Same for every other BUG_ONs)

But not part of this patch goal, I know...

> +
> +	drm_info(&xe->drm, "Enabling execlist submission (GuC submission disabled)\n");


Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

>  
>  	exl = kzalloc(sizeof(*exl), GFP_KERNEL);
>  	if (!exl)
> -- 
> 2.34.1
> 

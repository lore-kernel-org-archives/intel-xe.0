Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BECBEB64DC
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jul 2023 14:25:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 505AE10E88C;
	Fri, 14 Jul 2023 14:25:53 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF28910E88C
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jul 2023 14:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689344750; x=1720880750;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XTe7vaLWpgJZ+6A8ysloqg+cjIlyysRzPjAXgn0q+os=;
 b=NU78mDzBHQ6TUPxgLu+D0HFvcO1UjTfnXpEMuBC6RgU9ZI3ScbBWrHYO
 FLOCo11z7Wdb/uedJMbD7lwFAZqSVl4I0VN3gaWENQnkCPYBN8LJxf/Ag
 vCx50EKooFCUzGBBuRkZvZJdgtfs7baLyLtSm0Y7WRgA4Jmb8kjBmPEtn
 m+SmG2MIUrBPHTm4nmy3izkKcwC7i6WnqdHQsHEvX8ZFdcfh8ogfkOPll
 r7zo7oJzb/I3L6FEA2o+F6Mwrt0YDkrTnpdJj0OyT+P0MH324K/ampH40
 S+c0dDkYZJqt9uwRALq+O84btVSACmmRNhogQ1gpPOXgpxnNvXIohJ8sj g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="345799089"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; d="scan'208";a="345799089"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2023 07:25:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="896426080"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; d="scan'208";a="896426080"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga005.jf.intel.com with ESMTP; 14 Jul 2023 07:25:47 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 14 Jul 2023 07:25:47 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 14 Jul 2023 07:25:47 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 14 Jul 2023 07:25:47 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 14 Jul 2023 07:25:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N7EA8w4/Zh2bcY76ojt1tJR5EXToHCKQ9WQPlGqjpW092FF3yRp1XWWwDGb526BF4dFVHXhqTsEdMhUc/SekDfDlej061kfX6oUj+NURj4PvFDlss9PZUEdurPMR9YQDmqnpfNg6iDAfRt8qluT7juIITXVOfeEAUZ5eBLeG9tRGQq94khgHjWjj7heesYK5DNf2g3tVAqY8ncmiXQcUZuCMVvB1X6AyICRdlDEFAEsJa9d+dqYR3UkCIfLYhdmBKElUTq/b7o8V8DK14iDBGNp582oIGPCaz7gVUHW1wqncjnW4lX9dth2ptPmDAbCtU7jcOoNVhOT7W4dp0jhtLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IXK8ovfd8NoQSFOa/3+SVqOtzdt+GLv0XuazzAaUuts=;
 b=n4hByPJPI4H/cdXCaqyeAgqjxrJBe+nBfVE6ObUM5vCabpvtdd364lRl/VNZTFKU13XK+u10snC1g/8ElKfqDq0vP+oIQm83WSl9S+LnIoqf7X7OHmllZTJYl95lbIJMx5I24zr3Uh9GYpXM0e/SXZ+zD9ovTTNcMb+GHSe7MdVKxmS4dXOR0Mwww7A1Hy/7J5XfaSA5bzrmoL76ltgtEEEv3zxI/aLp1riXRt0k+cCyCZko1OhEtAxB9Mo0CQRvbAo1+ps08LAKM9UzLGSsUbeZkuTCVKW1eIVj0ROBC/BXMT9BCt4OiavW0qw3oUxlue5NLxwY1kOO9ScWiqyBUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6401.namprd11.prod.outlook.com (2603:10b6:510:1fb::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 14:25:44 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5%4]) with mapi id 15.20.6565.028; Fri, 14 Jul 2023
 14:25:44 +0000
Date: Fri, 14 Jul 2023 14:24:54 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ZLFatnjHFXQlNUGz@DUT025-TGLU>
References: <20230713150611.7-1-francois.dugast@intel.com>
 <20230713150611.7-7-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230713150611.7-7-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR13CA0113.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6401:EE_
X-MS-Office365-Filtering-Correlation-Id: 51a11973-b577-4266-ea66-08db847635b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9RmHemPbkw74tu13Kqwe1OR8W2m2s8krbG1OtMgSRo7RWc61lpzt7wRon17vcOVgUPp+eNaVFwhIcuJQE4fgmiC8TxfPmxX0vIW7yNun9k57u9G+tW8Mq7BxnyhGC3QEKnX1/T0698Bw3RA8uZ0Xbd0BO0YX4eG4EHg0p1Skbv6UZk/WKNP+C43gEBWdhR4fT+7Nc4IBaxMll+11FlnK3+oHMlsGVpPPhscqivDl9b/MD8lLG9jE0ZFepV0IDIJR+9mnM5ZQN7hWbjzgozTkSXgWxgxb6/5AI0Afec6Q6FtJ8VoWQMNsR49aBHkNIZH0IRDSKpIGpE0e+w+nULWH5/H3Zc+vqD/2GJC2Fr9Uf9wSBpO1TwUQKJLfmsc2CDTCFsxkSOSdjdM4XV4RThKF5PK4w/DPyaHTWsPDOqXusn/Obyd8uL0eSXvatQBQKzK/qvCcf6u2SXBJjPw/hijE0E4UVtbYVDFkWo1ch7y+i/UhkkGUpWYgaLcu3od6SUNLnw+F1nSvI6mWy4Qc9HxpdL9AJVDpcBWS6A3LzaPc0oYRcn3s2mMUWBe8muudnltI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(396003)(136003)(376002)(366004)(39860400002)(346002)(451199021)(478600001)(6486002)(6666004)(186003)(6506007)(26005)(9686003)(6512007)(2906002)(33716001)(316002)(41300700001)(66946007)(66556008)(66476007)(4326008)(6636002)(5660300002)(44832011)(8936002)(8676002)(6862004)(38100700002)(82960400001)(86362001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Azm2UoKCpkSLDKYfc7wlRpjHbKXxH7R9RMTjW0BGkr253YqH4AFPN/f8S2Wo?=
 =?us-ascii?Q?vEyGpCGHUib2f/OD37UNeNU9n8o9EDa3EhkFhwBb/EsTtOiILMvENpmwP1Wg?=
 =?us-ascii?Q?tn1Rl4J++DfeiLJtA8P4qG8xyYWt+5dBm4+mHC6JlbkIP+O9EC6a+KaOEDXL?=
 =?us-ascii?Q?vCvhwIV76fWBgxOleULuoW1DwkDm8rYsHKtz/UDsadTDB4Duz+e/N8Mp5UvR?=
 =?us-ascii?Q?LdYLsDtWrFC6JcsL29j1hMInhzCVnA8Ywfk8bKofAkY1cwSem3Cm3saDrddA?=
 =?us-ascii?Q?uxkwwWYm+m50RbHpapWggQh9kYTAKZJ8mTyms7H6o0bXJonWuZUEFv/i349G?=
 =?us-ascii?Q?2vh8ovaWpRHvILd8t502FVEBDil3dlWuk7mrlaodU4kgMp5ulCceXdX4qSky?=
 =?us-ascii?Q?knKmJ4z+BSq7dVqa+3YtLxssJl8w6wj/KyfRoLqBbkhoST2g4oRE5G1+B2Su?=
 =?us-ascii?Q?m4O8NOVX71qIRfN+tdahmPgxLo+5dWwr0k9CKnvVxSQl9R6iBpqG6/EncMhn?=
 =?us-ascii?Q?gi30RDoAakF1pC+XD4hohgOU0H9Xg/D9ZBm39D2QybQm1IUZCdJS2s+zTU2e?=
 =?us-ascii?Q?NRPg3VL2hAKg/rzpGx0fJiDmf95ZVI4KwMWc5cytpGNdc/4S7gJ45igMx64v?=
 =?us-ascii?Q?TypUjzrQVFerYiMnNK3uSh17GwQp5fVxAE5PwY7cTBp+GILDf6ZGdVAJS4Eb?=
 =?us-ascii?Q?iGkQ9kAQuXUE1ZEG8UFRVx8KAJJV9S1yyamGRRe7q23wD7fH5F60GYKrQXhu?=
 =?us-ascii?Q?Rc+GXc2/rUCV75Oxxagalt97skWEHHfWRhAXFnKG8OUsdG2Ku1Wrn0b+9YPf?=
 =?us-ascii?Q?5jgFsaIXsYpAO+GPMr5sDaQeq0PpxYwfwFTb2qWJdqr2Tnz5qwdIPJiYkHBc?=
 =?us-ascii?Q?9Cu1VEANJoyAGDOY9gCrOT5LGnf200Zq/vhLs0OkrzxNgo+FD9JIKy8QBNFH?=
 =?us-ascii?Q?8XsC/p8uTlTaV4Nh+MwQzFXPkMKZj5/Eb1jtyXf1S2KB2ronJUOXODc6lEqA?=
 =?us-ascii?Q?TaOz4nIDyP6fxTL7mawDzQ7bfDIvD1lw9tuFWLFg3Etp5A8UyicLVbI7SC3a?=
 =?us-ascii?Q?OE+ho4jpAD89Yi/7+01ou55hY7MB2M/6IzITTQcz+3D8cTqfA3Hep4RNH8NR?=
 =?us-ascii?Q?U7HOxOdkGMC3WrOUzmuG1vkRCjN+fqnZL9ABC+JHEuZfCkDtLevM44AV+PnR?=
 =?us-ascii?Q?tb3C29W7GZy10+Jur1EupQJoXbfP1qJCzoYK/mtQ+eUnnSIenqXEWDBwaO+J?=
 =?us-ascii?Q?nJ0sZqqSCfnkjkj1LAuMn3fZTb6mEmlcBf/8nv6ZySoZc91IPI2LUH0NJUu/?=
 =?us-ascii?Q?8iYuk/WcGtZHy5k15qd27jD6YQUw/adz4XSS7unZ5QKZNryje7wX2WeP7rw+?=
 =?us-ascii?Q?ufjow26KGK8ymq7Moa+ieZPl1JiW6SdonIqAz92k75K4O57OF+ttaZ35omBQ?=
 =?us-ascii?Q?Mon8ohHEdsAEZ8tD398aC+5W89sMwvoya3SmPqaXtaUnuN8JCSBakkK8ivJj?=
 =?us-ascii?Q?rVtIzF1GGmNMuD5mAhp/cH2Ce6Owbqag4a45X4mv9tt4FOzePRgxxubnJxHv?=
 =?us-ascii?Q?L/96IL7PQbYrna1gGLRsGPcy7N4uZaMlg6u7ZO8ujlEYRwc//u61gPKZUXdI?=
 =?us-ascii?Q?xw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 51a11973-b577-4266-ea66-08db847635b8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 14:25:44.6681 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: raEbUFDCwdGDByXurzGsBccP5DBwbQcJmwOoCewdjQpTFlHSVf/5CokzBp5mm8dphV8hK7zY4sqi6g5T37okfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6401
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 6/7] drm/xe: Cleanup COMPLEX_MACRO style
 issues
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

On Thu, Jul 13, 2023 at 03:06:10PM +0000, Francois Dugast wrote:
> Remove some style issues of type COMPLEX_MACRO reported by checkpatch.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_debugfs.c  | 2 +-
>  drivers/gpu/drm/xe/xe_guc_debugfs.c | 2 +-
>  drivers/gpu/drm/xe/xe_huc_debugfs.c | 2 +-
>  drivers/gpu/drm/xe/xe_lrc.c         | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index b5a5538ae630..d0092d714ffe 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -171,7 +171,7 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
>  	 * entry and drm_debugfs_create_files just references the drm_info_list
>  	 * passed in (e.g. can't define this on the stack).
>  	 */
> -#define DEBUGFS_SIZE	ARRAY_SIZE(debugfs_list) * sizeof(struct drm_info_list)
> +#define DEBUGFS_SIZE	(ARRAY_SIZE(debugfs_list) * sizeof(struct drm_info_list))
>  	local = drmm_kmalloc(&gt_to_xe(gt)->drm, DEBUGFS_SIZE, GFP_KERNEL);
>  	if (!local) {
>  		XE_WARN_ON("Couldn't allocate memory");
> diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c b/drivers/gpu/drm/xe/xe_guc_debugfs.c
> index 6b72db4d5bb2..0178b1a2d367 100644
> --- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
> @@ -87,7 +87,7 @@ void xe_guc_debugfs_register(struct xe_guc *guc, struct dentry *parent)
>  	struct drm_info_list *local;
>  	int i;
>  
> -#define DEBUGFS_SIZE	ARRAY_SIZE(debugfs_list) * sizeof(struct drm_info_list)
> +#define DEBUGFS_SIZE	(ARRAY_SIZE(debugfs_list) * sizeof(struct drm_info_list))
>  	local = drmm_kmalloc(&guc_to_xe(guc)->drm, DEBUGFS_SIZE, GFP_KERNEL);
>  	if (!local) {
>  		XE_WARN_ON("Couldn't allocate memory");
> diff --git a/drivers/gpu/drm/xe/xe_huc_debugfs.c b/drivers/gpu/drm/xe/xe_huc_debugfs.c
> index ee3d8315036a..ae3c21315d59 100644
> --- a/drivers/gpu/drm/xe/xe_huc_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_huc_debugfs.c
> @@ -53,7 +53,7 @@ void xe_huc_debugfs_register(struct xe_huc *huc, struct dentry *parent)
>  	struct drm_info_list *local;
>  	int i;
>  
> -#define DEBUGFS_SIZE	ARRAY_SIZE(debugfs_list) * sizeof(struct drm_info_list)
> +#define DEBUGFS_SIZE	(ARRAY_SIZE(debugfs_list) * sizeof(struct drm_info_list))
>  	local = drmm_kmalloc(&huc_to_xe(huc)->drm, DEBUGFS_SIZE, GFP_KERNEL);
>  	if (!local) {
>  		XE_WARN_ON("Couldn't allocate memory");
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index ddb1b1d6d00d..d5f782f8d2a6 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -483,7 +483,7 @@ u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc)
>  #define __xe_lrc_pphwsp_offset xe_lrc_pphwsp_offset
>  
>  #define LRC_SEQNO_PPHWSP_OFFSET 512
> -#define LRC_START_SEQNO_PPHWSP_OFFSET LRC_SEQNO_PPHWSP_OFFSET + 8
> +#define LRC_START_SEQNO_PPHWSP_OFFSET (LRC_SEQNO_PPHWSP_OFFSET + 8)
>  #define LRC_PARALLEL_PPHWSP_OFFSET 2048
>  #define LRC_PPHWSP_SIZE SZ_4K
>  
> -- 
> 2.34.1
> 

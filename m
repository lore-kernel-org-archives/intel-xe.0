Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C91BDC4332F
	for <intel-xe@archiver.kernel.org>; Mon, 11 Dec 2023 21:25:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80E5010E513;
	Mon, 11 Dec 2023 21:25:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57C1310E512
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Dec 2023 21:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702329899; x=1733865899;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4pouop8Z+NfsXfqI+KJQwbNIfgqGfS1rghP3B8y0HbY=;
 b=WzFlODYZF07yPNERBRkoAud56qBXbkGoDAZzwBa9DSKm/c0MAuikJeYw
 IafDfZ4+mUslsC+StEhwBd7rc/k4B39c3XF21tYEpWXr17KafgXouJWiG
 2IvTbIoMi5Ty/fXd4bxHXOjIqhRWUfzxH0iKLf1hcPWHDfGUEx7OvBAXz
 VfopMC2WJe3XDlfbusl+rBICM30g5ve5opVJYURw6Fqv+rFvS2Hm7wGcI
 rROr6e6+sCaoGSnEYDn2hPZv0rQNQx6WU1JRDGOrLxyuL0RRsR/e6AK26
 vGurAlEn9CLDbQgCKDJkT/X+dweXwNbR4PjnQ+nZb0MJUwsZYSTG8Av0i w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="379709225"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="379709225"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 13:24:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="749450355"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="749450355"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2023 13:24:58 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 13:24:58 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 13:24:58 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 13:24:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EUAb0nDyIkYFgdKAmPiK90btVKfeOw5NcbgIdnkLpCkbiNq25BGxPp2h0Nmy+EbwlKM96dJxb0jOd+oIaFvP/qGaJQPQANTr8+WzCXSDQ6BZEokmCV1ZxXeHj+CJvPEan8rH80symYfPV4d3yyx+wn3jQMHAgRdpK51o90lp4WLWevdwGb2biug7UTKpxJ1p/cK5NLwngsCuuq9gXlw/n66V7KrvjN9xIAx6i87WFTSTunvQREaHZLv1WDBQCbSUfNit79LyrnBoFTTigZql+uhPFENap8hkvkjnP7pbjCsIsGURScdQuS137BPxV8wbQ5sjnK5Rig2KfE0SwlZ2hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dRm9XAArk8v3K64T1bcwcLj+HQ8NuwgOReAK5aF7Md4=;
 b=M6XuWISZMjYj3jQVvvRyvx3rGYPDQOgyQlh2EsWtHk66oyJlH9JSeUYbzyjelbqoHqO457I/UC5NtUFDxzTuYJCaQ7vcu8yNe8exft+qkXzzJVRtuC0fTNP+fEvH/d7fC3EBc/WcyYyC45GFAKKPcKJ66OTD7RCY8r8Gto4l7sN0C+B5TTE7ZbhU7VCu238zL59IuwKbSB7roO5tWR1QEboGpW6GjtZKo6lphiYsCoice6emPjFj5SEkzLNiD4JYx8JBIgpXtjXzckCL8kxYeJDttLycHyvGlTsVuIa+3ctrobFb0GYMEP8SneMr56/xjE1EyWKkZuLUDEPWRYfWgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO6PR11MB5652.namprd11.prod.outlook.com (2603:10b6:5:35e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Mon, 11 Dec
 2023 21:24:54 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 21:24:53 +0000
Date: Mon, 11 Dec 2023 21:25:07 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 13/13] fixup! drm/xe: Introduce a new DRM driver for
 Intel GPUs
Message-ID: <ZXd+M+PhvXJYSSfv@DUT025-TGLU.fm.intel.com>
References: <20231211191306.1069362-1-rodrigo.vivi@intel.com>
 <20231211191306.1069362-13-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231211191306.1069362-13-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0091.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO6PR11MB5652:EE_
X-MS-Office365-Filtering-Correlation-Id: df2be372-f5fd-48ed-f09f-08dbfa8f9dc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NXlVqifUVRxZbUitswMAuNewiPpX42awqEhc4Pzo/qtavN4XgHMKbqQQx0q2Twf+6TUal04rI1xrbNpL6HtwOuI7jClzZnsBZz7dE7WVGnAcRlqZRC7FRjAwYvyBWgT8di8//B9I5SIcka/HtJgOhYxeRGaJbb48xBkKbZZVCvox7gKUiZPcRdFjB0bol7DH9yA1p7+au31tl4UftUB0n8AO/f/cbKmUhdeqOZsb4X3WLGwGIapn9iIAwPbfpkphwxu0ndfFIObHj080e08vZnx+Wdzkl6QgIp0KsFwbHhbUvGaUbuIIEzIVssfmINOqxKItN9MS/W/50LWdVEushQqp1P9XP7VulBxk4g320fufDdChPxNlfP/pqUR9WtyVDX0Wxh7yO/IgozC2sv5HhjqYVGjQcOmwTwWtQ2H2Cyc9bk+C+iq2EMMQXmGub0nG2LEjjYUKhip+rTd4Nb/xKUo9kNICY2f/AQPHquwKR+Uw7vuevVJO/NYtcjXDdHdW4O1ngE20lv8sXVVcVB8g4TJABt9ZkWvU+WoBprlAFcah9g+Fh5kkEDaWAP8z7Rsn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(136003)(366004)(39860400002)(346002)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(38100700002)(86362001)(316002)(82960400001)(6636002)(66556008)(66476007)(41300700001)(26005)(83380400001)(6486002)(6512007)(6506007)(6666004)(2906002)(478600001)(66946007)(8936002)(4326008)(6862004)(44832011)(8676002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+FggtMeelHbz9Lg4lGN5bmAfB1ISLZ+OYoi8qe2Flk4q6HMhDxffCJm+GKwq?=
 =?us-ascii?Q?8CJR73xtZnQm9CFxI6xLRc8YsAPY5ixMhmOqmQr4ikOKd/L4ProQV4xHYh3Z?=
 =?us-ascii?Q?k3BaS6GAqayVK34DjJ23vFLDAQUi+vEPcaLnzSNxEHRcgp7XXGHm+MatrVR1?=
 =?us-ascii?Q?oU3XlXrci6xNO7K4fiVOEZdQMDKlJbrUwOE1VTNXAiLLKKyeQjeMZcaL4mY1?=
 =?us-ascii?Q?FbOmvzssp6ZQU+F6ZjYWXw3ieUgmnDL1zc0xeWB2hitknE7sfbyiOTT+1DGZ?=
 =?us-ascii?Q?IT1OPXBvaacfgItFQqmFY0uvUFqbVwM5PtXPpAt3JhNay0hY+hVujASPMvZz?=
 =?us-ascii?Q?xSk3UcqzfdQI5/dYMZFdDx2QgIjNQlMI0vtCyAlFUPJweYg65bf7KK7ZsZci?=
 =?us-ascii?Q?Z/6RQMZxjxQbH/XUc5FrRCk8HIdmtHe8xAM703DL4iD8OPojI47YdMrYBog4?=
 =?us-ascii?Q?su/kmdJZ/9RpaZasYVk8YubuXg5rIofMvLH9VjH78UkKb/tc/Tg2ryqWIbMc?=
 =?us-ascii?Q?nn+yDDbQak8AhBmxxKlKXcyJv0mDT56fP09JPJJMZtknBuHoVwNul3gWZ8Ir?=
 =?us-ascii?Q?6khWSmbLZBKzebuxzjfjmsrMSJCNfF/M+7hd2SbLdfCwJbVLUuz0e1JO0pLf?=
 =?us-ascii?Q?XLQyBfpPnZ7YNcPrAl8pgopVzGuAaLDM8Oq1F0B4+bAWNV18U4xfwP8brxGc?=
 =?us-ascii?Q?+UykBqs3K7gWsPko5dYibaq1gOHB/0ei57hQ2NJm4sB2yX9RUnA76LYTtp3r?=
 =?us-ascii?Q?Gl/G+lhuWEbxrDMo6rTPf24jDKYOW8ZcjuDA0JRdngtBZd/RcCFGyRuJZQIk?=
 =?us-ascii?Q?YgZTpnK4FYcD90sBU95BciXZcAzN026kwhBvAd7UoSxAJ3H12VYtrNufdtrp?=
 =?us-ascii?Q?QqV7DzI7DbGkgPZgmy8IBs6KYPuzf/CcP8MFvpBUuemN1MJ2zUPrefOQC1bj?=
 =?us-ascii?Q?uCUdSQORAaR76RXR6IfWewSfDzL04DzzsMu3AOvFtehywhuuNMO2V1SqFS97?=
 =?us-ascii?Q?O5bj8+GAMeqynqtYOCOgX7+SbFwex09lD7eyo3eXGbTzpPfx0qSyNAs5zy+3?=
 =?us-ascii?Q?GWds0Ty8crj0jr0n7RXHi//uAZ+7GbQwpXA9DAhKnCFSvmr5RSjyLRj7kSf9?=
 =?us-ascii?Q?R0GSrZ47Az7sTotSfyOz5u1O9syPCzwOTzMQmg+F03rNFGNuvtwI7IZ3QEzp?=
 =?us-ascii?Q?hMOoVS7wGheU8zJ7ML+DgdQhhEHY2wtamsqNjOWmd+LfPSM0/UHOhujY5e25?=
 =?us-ascii?Q?yOTCf0QBMtWwGzi3cRxWKEVKVXqmXqUZkIs8Vva+jvRRSwvM1vSbCTW4JlsR?=
 =?us-ascii?Q?xlJlW+Klroi+55gwbMfUgoEVpSF6JyKuvV4X5U7mNnIvzs3rN4Apls1B3fzo?=
 =?us-ascii?Q?ekb/fSrzGL/9RJ/zuB6HIUhcbx0bVHP8EXcmEBI9/a1g51weDUsM4X7tZ8hO?=
 =?us-ascii?Q?KD6vyWLrLYAizfgbvrpUiWv/4oOzrun3lk+Y8n8cOJh+7m/U8NqJpH+qgM+F?=
 =?us-ascii?Q?Usxn2694RuEUtSR910O0ysro5sq0ed50isH3s+t78DKg02RBRgt+zs0vBAwH?=
 =?us-ascii?Q?r7UD38taXWas+3+1s3ExLfimViTcSDTGQoVJpzqoXQP7ffGgkBVYsoYHqkYb?=
 =?us-ascii?Q?YA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: df2be372-f5fd-48ed-f09f-08dbfa8f9dc0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 21:24:53.8144 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MdbiF2HJt4e1IhNLGcoDqr4FQ5uonnoxrXZN9kweP6yeeSkcpp77iObkMEsuIk8p40BI4gX8n813NGh98qpFOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5652
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Dec 11, 2023 at 02:13:06PM -0500, Rodrigo Vivi wrote:
> Adjust to recent drm-scheduler changes that already landed in drm-next
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c          |  6 +++---
>  drivers/gpu/drm/xe/xe_execlist.c            |  3 +--
>  drivers/gpu/drm/xe/xe_execlist_types.h      |  4 ++--
>  drivers/gpu/drm/xe/xe_gpu_scheduler.h       |  2 +-
>  drivers/gpu/drm/xe/xe_gpu_scheduler_types.h |  6 ++++++
>  drivers/gpu/drm/xe/xe_guc_submit.c          | 10 +++++-----
>  drivers/gpu/drm/xe/xe_migrate.c             |  2 +-
>  drivers/gpu/drm/xe/xe_sched_job.c           |  2 +-
>  8 files changed, 20 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 91d67f4da2cc..3cf7f5d3d5e3 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -222,14 +222,14 @@ struct xe_exec_queue *xe_exec_queue_lookup(struct xe_file *xef, u32 id)
>  enum drm_sched_priority
>  xe_exec_queue_device_get_max_priority(struct xe_device *xe)
>  {
> -	return capable(CAP_SYS_NICE) ? DRM_SCHED_PRIORITY_HIGH :
> -				       DRM_SCHED_PRIORITY_NORMAL;
> +	return capable(CAP_SYS_NICE) ? XE_SCHED_PRIORITY_HIGH :
> +				       XE_SCHED_PRIORITY_NORMAL;
>  }
>  
>  static int exec_queue_set_priority(struct xe_device *xe, struct xe_exec_queue *q,
>  				   u64 value, bool create)
>  {
> -	if (XE_IOCTL_DBG(xe, value > DRM_SCHED_PRIORITY_HIGH))
> +	if (XE_IOCTL_DBG(xe, value > XE_SCHED_PRIORITY_HIGH))
>  		return -EINVAL;
>  
>  	if (XE_IOCTL_DBG(xe, value > xe_exec_queue_device_get_max_priority(xe)))
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index e8754adfc52a..e6a94d884115 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -344,8 +344,7 @@ static int execlist_exec_queue_init(struct xe_exec_queue *q)
>  		goto err_free;
>  
>  	sched = &exl->sched;
> -	err = drm_sched_entity_init(&exl->entity, DRM_SCHED_PRIORITY_MIN,
> -				    &sched, 1, NULL);
> +	err = drm_sched_entity_init(&exl->entity, 0, &sched, 1, NULL);
>  	if (err)
>  		goto err_sched;
>  
> diff --git a/drivers/gpu/drm/xe/xe_execlist_types.h b/drivers/gpu/drm/xe/xe_execlist_types.h
> index ee1fccd4ee8b..38bb6f0709c6 100644
> --- a/drivers/gpu/drm/xe/xe_execlist_types.h
> +++ b/drivers/gpu/drm/xe/xe_execlist_types.h
> @@ -10,7 +10,7 @@
>  #include <linux/spinlock.h>
>  #include <linux/workqueue.h>
>  
> -#include <drm/gpu_scheduler.h>
> +#include <xe_gpu_scheduler_types.h>
>  
>  struct xe_hw_engine;
>  struct xe_execlist_exec_queue;
> @@ -20,7 +20,7 @@ struct xe_execlist_port {
>  
>  	spinlock_t lock;
>  
> -	struct list_head active[DRM_SCHED_PRIORITY_COUNT];
> +	struct list_head active[XE_SCHED_PRIORITY_COUNT];
>  
>  	u32 last_ctx_id;
>  
> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> index ea785bcd3eb2..10c6bb9c9386 100644
> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> @@ -63,7 +63,7 @@ static inline int
>  xe_sched_entity_init(struct xe_sched_entity *entity,
>  		     struct xe_gpu_scheduler *sched)
>  {
> -	return drm_sched_entity_init(entity, DRM_SCHED_PRIORITY_MIN,
> +	return drm_sched_entity_init(entity, 0,
>  				     (struct drm_gpu_scheduler **)&sched,
>  				     1, NULL);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
> index 86133835d4d1..941a360af2f5 100644
> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
> @@ -8,6 +8,12 @@
>  
>  #include <drm/gpu_scheduler.h>
>  
> +#define XE_SCHED_PRIORITY_LOW		0
> +#define XE_SCHED_PRIORITY_NORMAL	1
> +#define XE_SCHED_PRIORITY_HIGH		2
> +#define XE_SCHED_PRIORITY_KERNEL	3
> +#define XE_SCHED_PRIORITY_COUNT		3

XE_SCHED_PRIORITY_COUNT should be 4.

Maybe I screw that up when I sent this over?

Matt

> +
>  /**
>   * struct xe_sched_msg - an in-band (relative to GPU scheduler run queue)
>   * message
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 46b132ee1d3a..bfa8fb710cdf 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -411,10 +411,10 @@ MAKE_EXEC_QUEUE_POLICY_ADD(priority, SCHEDULING_PRIORITY)
>  #undef MAKE_EXEC_QUEUE_POLICY_ADD
>  
>  static const int xe_sched_prio_to_guc[] = {
> -	[DRM_SCHED_PRIORITY_MIN] = GUC_CLIENT_PRIORITY_NORMAL,
> -	[DRM_SCHED_PRIORITY_NORMAL] = GUC_CLIENT_PRIORITY_KMD_NORMAL,
> -	[DRM_SCHED_PRIORITY_HIGH] = GUC_CLIENT_PRIORITY_HIGH,
> -	[DRM_SCHED_PRIORITY_KERNEL] = GUC_CLIENT_PRIORITY_KMD_HIGH,
> +	[XE_SCHED_PRIORITY_LOW] = GUC_CLIENT_PRIORITY_NORMAL,
> +	[XE_SCHED_PRIORITY_NORMAL] = GUC_CLIENT_PRIORITY_KMD_NORMAL,
> +	[XE_SCHED_PRIORITY_HIGH] = GUC_CLIENT_PRIORITY_HIGH,
> +	[XE_SCHED_PRIORITY_KERNEL] = GUC_CLIENT_PRIORITY_KMD_HIGH,
>  };
>  
>  static void init_policies(struct xe_guc *guc, struct xe_exec_queue *q)
> @@ -1227,7 +1227,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>  	err = xe_sched_entity_init(&ge->entity, sched);
>  	if (err)
>  		goto err_sched;
> -	q->priority = DRM_SCHED_PRIORITY_NORMAL;
> +	q->priority = XE_SCHED_PRIORITY_NORMAL;
>  
>  	if (xe_exec_queue_is_lr(q))
>  		INIT_WORK(&q->guc->lr_tdr, xe_guc_exec_queue_lr_cleanup);
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index be2a92dee52c..1d22aac57478 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -398,7 +398,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
>  		return ERR_CAST(m->q);
>  	}
>  	if (xe->info.has_usm)
> -		m->q->priority = DRM_SCHED_PRIORITY_KERNEL;
> +		m->q->priority = XE_SCHED_PRIORITY_KERNEL;
>  
>  	mutex_init(&m->job_mutex);
>  
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> index b467d5bfa4ac..a9c7ae815bec 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.c
> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> @@ -104,7 +104,7 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
>  	kref_init(&job->refcount);
>  	xe_exec_queue_get(job->q);
>  
> -	err = drm_sched_job_init(&job->drm, q->entity, NULL);
> +	err = drm_sched_job_init(&job->drm, q->entity, 1, NULL);
>  	if (err)
>  		goto err_free;
>  
> -- 
> 2.43.0
> 

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19BD7C27C42
	for <intel-xe@archiver.kernel.org>; Wed, 16 Aug 2023 22:31:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2FE310E3E5;
	Wed, 16 Aug 2023 22:31:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 027F910E3E3
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Aug 2023 22:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692225074; x=1723761074;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YhQ6ocugdjlYca0Nhgot4V9ruToc710sX4WGRRmUCgM=;
 b=Yy8yiDfgn1ZpUAHQx4YAopISqAzsKQYirlS1Mk0/BZubZ1BY8DhL02Ht
 66c+LGiPPzCKds0R7N/rXdW8nJP9abErrxwMrNiOjpUwfPYcHX4UtSce/
 Is6DcQgESHnzXJ1cjZZV6BwKPKp4wqsFJgFFlQt92GMMwcnDfBHFhVvHQ
 /kyvKPQDvoIsCWJQd5Cob1NBO1GifqnzeR9bdojKeepn0ylfT5jdqOwWX
 ggOn3GQnQGiOliIpBs8WJJp717o4JoQfoIF/Xu3RtaMMH1ZQHUUYjWc7G
 k+wCRBj897/CDKPBClLekE4XWwgb+BsGg97bc85fnT3bbatAd69GrXf6E Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="459012132"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; d="scan'208";a="459012132"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2023 15:31:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="799776873"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; d="scan'208";a="799776873"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP; 16 Aug 2023 15:31:12 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 16 Aug 2023 15:31:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 16 Aug 2023 15:31:12 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 16 Aug 2023 15:31:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i7DdBJxOL4u1PnuIMc53079qKE5eXDdf7n8nb4/EvJy4H4hisPT/yB2CIiTeHV0eCBs8KfvfBEJTk03Zhw2TMNMohjyAqeS7Sfd5JLDGJWjLn512I8rowE78+JwBDUbf1lKSdxJRVoTbhg6sBkr6IGspSLISrqaTZd4DrXD1lKeC/eOatVb3i2OTmwnManBKJNkQb0jr+OT5UeSbAjO8gjGPyiSOLCqs0ZH4xoW8pEfxcYBgkct/X8IOR5PaK9f1ECc1weQeXschXBm1fFpgMO1Uk8r+JwU5azzaOmS3C/iBOE4AZumEsGD67VIXR5mnMNZaOiGhsV0F1L6C37J35w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PwfuAMeJUpVQFgb8hNl8jiRceqL3R+6LgZuluuDXLSk=;
 b=bF9CiDvDCxIJU7YXvu90qbjhz3oghgtZqSzSyoQPccG1Bs0Ha49ehBR/Fqr/67i9tUMiXilplUDUyZOoDNwJABUOlsoAKDmlo1X8W5XHGy9/o45fVQnIIb9JQgkSbBBGwo9FygKrJdVxa2vs/TVBpr0rQ22cXNOQhy/hIs96K03On8/+GHQgHD7UHArqROfn/kGFqmTISX3sTzJsUKUfJRJnnrzuSSgqMADHgLDl7s1CX+bqgIDfUh43H/pNZaskUjlp9fhf/LpDVDwBUwOACEHEA2FHuqKT8Ri5hwaK9QuNTJmOTtiIF3+M0faiAKBKUXgE5KZYEPgp+FZ0qgokPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 MW3PR11MB4553.namprd11.prod.outlook.com (2603:10b6:303:2c::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6678.30; Wed, 16 Aug 2023 22:31:10 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41%5]) with mapi id 15.20.6678.025; Wed, 16 Aug 2023
 22:31:09 +0000
Date: Wed, 16 Aug 2023 15:31:06 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <20230816223106.GV3375865@mdroper-desk1.amr.corp.intel.com>
References: <20230816180425.1481448-1-daniele.ceraolospurio@intel.com>
 <20230816180425.1481448-2-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230816180425.1481448-2-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: BYAPR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::26) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|MW3PR11MB4553:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e30b8a6-2343-45a7-5153-08db9ea87ce2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nvWwUSeBe/0D+DclxpWu6kZFlG3neS4T7mdBtZdjcdh6QqkNpIupiewx6E4RUsFosuEeUTiDRRVgQAd+LBtO2VE+ed/9QIc/qtEE88sUlijQfOY/8sNo+kfyKeQMTPZF2aEbIKIf+B6n4p0DLn5aKcY8S+vohORGsqlLpYvz/YWR9AIc7p4sATGgc6vGp0hKBkKvwmlj2FXY+idYP0fMgFrXrkfitsqgMhB60Lr7s+yImL207Mqs2q6vx2Ae3/efghSonEJZO9fKs90HI4pJQvy2lMmhWAhUOrMzKunIsdEN3+dpkfCt8lvWMfKmZS3ZJJ7495YL9DlAyoX1sQW5tyBm9L0QGAmpUEafyAfkuyNkx236kJ5YDr+N5ug2CQCu7EQYqgeDl+Al0zHRtklfkWfODtCfhgtCOi3Dy4ZThjrImo2HsXu7hEgbYorD53k7zaimNh5/OhYqfWv+z0HR4IPg9dbOzDY79CA+U6iCZr2Er2gYYVlelpQ6SfhoK6er4znL7VET3aGqSlOhCsK8J6i5TOVPTDb6tT9eDYSjfUscjHawizHJjn7IvzjBxeYQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(136003)(346002)(366004)(376002)(451199024)(1800799009)(186009)(316002)(6636002)(66946007)(66556008)(66476007)(5660300002)(41300700001)(38100700002)(8676002)(6862004)(4326008)(8936002)(82960400001)(2906002)(83380400001)(26005)(478600001)(86362001)(6512007)(33656002)(6506007)(6666004)(1076003)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TV83QqOvkRhI30rn9GDDiXspWK1GMTlHVk5K2HgFrot3M35HGTi5D91wN+tf?=
 =?us-ascii?Q?y+ToEibXhrYrRPJ6oL44NgeIFRm2tbQp8Zb5q6CUxBxWKBWqY+XYa94SXu5/?=
 =?us-ascii?Q?si7ybJjHh337r22HTs0TxJf0GBXrXzCmrqqiWy9sh7QULZD9Oxl6WrVc2sZL?=
 =?us-ascii?Q?9wzFSPBHegHj4gPNZRnhQ3Skc/XIDl7TdAuKtI5uHEWCSxi6uIJEKfHv/f+S?=
 =?us-ascii?Q?/8d0IWh8lGVzevvvRk8GJr7hxq6DoqFvuA12S1AVYhLCc+Fi95qlRBxZTj+Z?=
 =?us-ascii?Q?l5BMAjq2+AL9JbGi9c6RNoUOX8VCThH5VyJr3axcoqARid9NSahE5Q3v8s8s?=
 =?us-ascii?Q?1ddIr8CEQsXZBtJXd1bJK2cV7LHj+iL2PzDENaxEQHa4HNUHHJ8AKE4T//uG?=
 =?us-ascii?Q?8WT+h4L0FU2Hg3CoDI2EXNr3w7IbSlwsKolPZwNVPv5Jg8o47JylfRAuaWpM?=
 =?us-ascii?Q?h61qdX8Hmrj9ZVQ7lyVTmzMwvbzrYuJquiX7+CNePmluM0H1zsHYp7AM29EV?=
 =?us-ascii?Q?5llZrnYThS/x9eotxNZOuK9fgnwe/K70z0vuZa1Iur8W8QkGDEoVJgLOOiiW?=
 =?us-ascii?Q?4TRzMuFJc2eAIwCMrKdHI5L1syuDl/7Q0vwnY8SwCPJ3e1rKXrgZTKS8DgW6?=
 =?us-ascii?Q?UMXGkk/fsjOhwYt/UkipNSIYToPAQXVYz7XxrEZ6yGBh5xFX78MX19a7QTH/?=
 =?us-ascii?Q?ZxHdziigMef9eEiNMbwfzd39VBYsk51uHJgZO+ziUqFlzNUPeY8UYl4F6oke?=
 =?us-ascii?Q?lx6Li65gCkWYhF3aA2gs7Q+r51RL7hBmyxA5QCcnYtGe0aFHJG87LIrafdAa?=
 =?us-ascii?Q?qSwAbuThG7RpX2g9xRdgzWOlx8iP/ZXl6hMJnkHQyHiRP4m3SOJyKEojrgRf?=
 =?us-ascii?Q?OwMvwJV9ZZBPmOWgbKRxt9WyqD59uEzR11YAtLd4J8qfSRjUuwRzaALNrsbP?=
 =?us-ascii?Q?DWRJ/by+oad4w0FQW1/U5+Bx1EYS1iEobyiH6lEPqPLJEdnPqVKEPTkC0gYW?=
 =?us-ascii?Q?19SwQzg78PGamW1bfrTsgfoPVlq+dRU+CHqn4Kj59ycxNK4CRiKS3e3tgdql?=
 =?us-ascii?Q?cgwb8dDuvh7LxDyOH0V7tmDsXBslnMtz0ewyOQhHSwVLNr3k2JFFE4aonhr3?=
 =?us-ascii?Q?QEn96itpKvVGwvBXzeslb66XPtb2+rcVtWnShZ9/9/VMLw8luE4W3hIu7r2Y?=
 =?us-ascii?Q?a5+VVDrVmBMQCQ4LZ2PUpVl5TNUNoDg8tyuxxdviYP1uf9VeQAQkFxVnsXHX?=
 =?us-ascii?Q?Uwh4i3RxFeElcEr6LkJxmsa/gu6KT5mMKABiFmABW4pfpxAFN70XicEL0ulc?=
 =?us-ascii?Q?sizv6YsU8dVbZm5P5xWMCo6UyD9wkM2s/UwRS5ej3lY9ys4plSBWNdjpYydD?=
 =?us-ascii?Q?EJGrtqvAGRfQVFr9qrB6MFAQOxrlXIBQE/iily2BijgXuAUsZDEC2lnO44b5?=
 =?us-ascii?Q?67DC3N+HTcHYad5rJi+pZNxVNTV9LLOHIEleffTiQ8QmWMcCYO3Q/NJ13NYu?=
 =?us-ascii?Q?WNtl1onRZ4QA757K2tW7gv0AvPkTjvpQUI2h7+THaKU3rMOiiZvYqKhctn3E?=
 =?us-ascii?Q?DUV7MUnu4ds1z0Gfz6DMV00oemvgEOR1bLPYUVVvRpsCtF6hqk+zoPkAdhv9?=
 =?us-ascii?Q?KA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e30b8a6-2343-45a7-5153-08db9ea87ce2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 22:31:09.3169 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hnIkvNDobMVTtAH0zJBhSMRfuRuuqydljkUicDNGVC99Voj5gBmVfSBYJxb7rztNmfEy+K5B63sZoiU3xxXD1BO/J4ymCHhqwiGrXYCXc4M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4553
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/6] drm/xe: common function to assign queue
 name
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

On Wed, Aug 16, 2023 at 11:04:20AM -0700, Daniele Ceraolo Spurio wrote:
> The queue name assignment is identical in both GuC and execlists
> backends, so we can move it to a common function. This will make adding
> a new entry in the next patch slightly cleaner.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c | 23 +++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_exec_queue.h |  1 +
>  drivers/gpu/drm/xe/xe_execlist.c   | 20 +-------------------
>  drivers/gpu/drm/xe/xe_guc_submit.c | 20 +-------------------
>  4 files changed, 26 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 382a572746ad..bf40154ddd6f 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -177,6 +177,29 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
>  	kfree(q);
>  }
>  
> +void xe_exec_queue_assign_name(struct xe_exec_queue *q, u32 instance)
> +{
> +	switch (q->class) {
> +	case XE_ENGINE_CLASS_RENDER:
> +		sprintf(q->name, "rcs%d", instance);
> +		break;
> +	case XE_ENGINE_CLASS_VIDEO_DECODE:
> +		sprintf(q->name, "vcs%d", instance);
> +		break;
> +	case XE_ENGINE_CLASS_VIDEO_ENHANCE:
> +		sprintf(q->name, "vecs%d", instance);
> +		break;
> +	case XE_ENGINE_CLASS_COPY:
> +		sprintf(q->name, "bcs%d", instance);
> +		break;
> +	case XE_ENGINE_CLASS_COMPUTE:
> +		sprintf(q->name, "ccs%d", instance);
> +		break;
> +	default:
> +		XE_WARN_ON(q->class);
> +	}
> +}
> +
>  struct xe_exec_queue *xe_exec_queue_lookup(struct xe_file *xef, u32 id)
>  {
>  	struct xe_exec_queue *q;
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
> index 024bc26a7006..ce1ec2243b6a 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> @@ -23,6 +23,7 @@ struct xe_exec_queue *xe_exec_queue_create_class(struct xe_device *xe, struct xe
>  
>  void xe_exec_queue_fini(struct xe_exec_queue *q);
>  void xe_exec_queue_destroy(struct kref *ref);
> +void xe_exec_queue_assign_name(struct xe_exec_queue *q, u32 instance);
>  
>  struct xe_exec_queue *xe_exec_queue_lookup(struct xe_file *xef, u32 id);
>  
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index 8ef98c7fd8e2..a4757817b1ac 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -352,25 +352,7 @@ static int execlist_exec_queue_init(struct xe_exec_queue *q)
>  	q->execlist = exl;
>  	q->entity = &exl->entity;
>  
> -	switch (q->class) {
> -	case XE_ENGINE_CLASS_RENDER:
> -		sprintf(q->name, "rcs%d", ffs(q->logical_mask) - 1);
> -		break;
> -	case XE_ENGINE_CLASS_VIDEO_DECODE:
> -		sprintf(q->name, "vcs%d", ffs(q->logical_mask) - 1);
> -		break;
> -	case XE_ENGINE_CLASS_VIDEO_ENHANCE:
> -		sprintf(q->name, "vecs%d", ffs(q->logical_mask) - 1);
> -		break;
> -	case XE_ENGINE_CLASS_COPY:
> -		sprintf(q->name, "bcs%d", ffs(q->logical_mask) - 1);
> -		break;
> -	case XE_ENGINE_CLASS_COMPUTE:
> -		sprintf(q->name, "ccs%d", ffs(q->logical_mask) - 1);
> -		break;
> -	default:
> -		XE_WARN_ON(q->class);
> -	}
> +	xe_exec_queue_assign_name(q, ffs(q->logical_mask) - 1);
>  
>  	return 0;
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index a1e1f2c86912..8f64b164987a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1165,25 +1165,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>  
>  	mutex_unlock(&guc->submission_state.lock);
>  
> -	switch (q->class) {
> -	case XE_ENGINE_CLASS_RENDER:
> -		sprintf(q->name, "rcs%d", q->guc->id);
> -		break;
> -	case XE_ENGINE_CLASS_VIDEO_DECODE:
> -		sprintf(q->name, "vcs%d", q->guc->id);
> -		break;
> -	case XE_ENGINE_CLASS_VIDEO_ENHANCE:
> -		sprintf(q->name, "vecs%d", q->guc->id);
> -		break;
> -	case XE_ENGINE_CLASS_COPY:
> -		sprintf(q->name, "bcs%d", q->guc->id);
> -		break;
> -	case XE_ENGINE_CLASS_COMPUTE:
> -		sprintf(q->name, "ccs%d", q->guc->id);
> -		break;
> -	default:
> -		XE_WARN_ON(q->class);
> -	}
> +	xe_exec_queue_assign_name(q, q->guc->id);
>  
>  	trace_xe_exec_queue_create(q);
>  
> -- 
> 2.41.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

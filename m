Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7CE1C6FD1D
	for <intel-xe@archiver.kernel.org>; Fri, 17 Mar 2023 23:41:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D8FD10E434;
	Fri, 17 Mar 2023 23:41:23 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF4A210E434
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Mar 2023 23:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679096482; x=1710632482;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YfX9To2d6tW+DVw+LPW0x88Pb4X4khZ3fvthnKfzKmo=;
 b=FDsMW8cbzuj7z7DOCgPJFFp5VQ47SNl+GKLdsXQkHjIfxvCngRqZs5Xt
 4y1PObiAsKjUoYDZEgksChetIHruX5mWpmlBrFbIt+A7l8Jps5IwxB79O
 +7IR9RKzEEL8TxiR7h7AS+VgcSOogx3HQiZ6wkg7rDFzq2UHGphIkrsxu
 Gf9tBsZ2XmejQwfp51DLbn4/Gx+x2qkcIsq/20PfC4TmF58weleuwSrhx
 2fvL/pcyMKHnHL5Y6/gLt7eH5eskhwcO/+DDl1Bi8ZzSJh+c18vp7/N7d
 5Jyrzc0nTvnnKkLpgW4+IvXshXkyo0pUt6QgyajSu6ozIgM3o8ZyzWYxG A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="322233322"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; d="scan'208";a="322233322"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2023 16:41:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="1009834544"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; d="scan'208";a="1009834544"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 17 Mar 2023 16:41:20 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 17 Mar 2023 16:41:20 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 17 Mar 2023 16:41:20 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 17 Mar 2023 16:41:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KZ6Mt82HZ12rOLXHa/0vtuc5iBiqbIfk+HI68KHGMax0CNimukGes8tDfLxaaTk6rKVmlvla+vnE4KSXbvVPI0rAZpUBf2O32CgZ/Q2G293zF0UP9vc+olR+wr8atuIEd3hZj1fxpw+Fsl5fqg4QHOrIHQoE0RgJ5lsgyLrPl8jlUGJZbjmvy2jRFDg0zCr5EAyh52tbSytgQhtRahpXcDPPb8V2Ydt+GGycY0lGsj4jJbKgwu3YtBG52Ka7q+kHpVXBsUCpwaDrKbkXSJPZDXO/M9fDEiWXFlKWWFotc/MXaRnTvSCLznzsKTj/HaIgHH4DyiR9879KXuJKbsIzGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KZ2QDtOWlYtHlqVynCrES52W2pCuRbmwCPWvbbJrv3c=;
 b=OFo7dqqC0dCn2GbYSVua6RZ5sZUGM2EVb8LEipeEzef1sS9AwG/BWA3v6deuO0RjUO7h2j2QVUArsMy1fdjLLij9y+8kT+70DMSCxdqUWQfT9tRMwOSDEegt5Mv7AdNPbR0xtwb8BXfTNNuKKwM9paOMQR9jurqgJ9rvgcsl2hYtv+bQbqy5IO+xa73fVepySFKgCLrmING8nSJBSGm53Ildd8qAFIsmo9G9Jf0GS1y1m2HRc9oyRu6IVQYhyl2zBtbbIFWyOOgpJfRjYH+BEfiyQ6owiSrTExQwuG8zdN2a8HA7DcnCdBkwxpo5OJWc6sUhF14nUGe84+msURJOmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB7347.namprd11.prod.outlook.com (2603:10b6:610:14f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.35; Fri, 17 Mar
 2023 23:41:13 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::fc88:c65f:4ef5:c3da]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::fc88:c65f:4ef5:c3da%5]) with mapi id 15.20.6178.025; Fri, 17 Mar 2023
 23:41:13 +0000
Date: Fri, 17 Mar 2023 23:40:37 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <ZBT6dVTadakDwcRi@DUT025-TGLU.fm.intel.com>
References: <20230228101730.63294-1-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230228101730.63294-1-maarten.lankhorst@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0166.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB7347:EE_
X-MS-Office365-Filtering-Correlation-Id: ac38d504-35e2-4afc-b514-08db2741179e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xlMg+chZGWm6HJZTws/WMVLXTQGyiJqC+//j3AMBUsdsj3W4YYMfPaSoj+BqACTnP967wBCJ2y+XqLlK/0hjk2lKGH42VCVvnJpm8pBw6a1VfOaKsTmvCyURfDEw6psIpkPdHb7Nle9DkB+82uobqvAHlmIa9hE73m1OD0p8/b2Xk9Qy06alhKA/fCd7gsw9bwwmI1BaNcv9Ra5YVLiPN3RpUJJd0BmBWKdem98RZvyDFXnJK5VaI/a50rCK+LwxdqVKrO2OynCjjTPSngyTZadHnR0Vgx1zlm0LxrviMhwWTqU1IalH8DllsnrYesIcw6DPGoybcASt51kjfkXp1TEbcwaHEvYp3Q+OVPdFHH1xnjSm8z6112+dGwX2NUBLwpAztrvvGukci+BJjITPRl5dy9UsuHqbm3zFy33OHGoGEhr3mRFlb0zC2clJTULCnm0NSYppjh8Jwddb5NLk4J+GaGjSBSEjVGPiplpDvk1PYleSHHzbJuSTl8P42NuZEqVM19J0ICGK8bsJ0Mu29sId8B3tr4fCnHABM/nMWLCyoz9l7wIcOIGqfZL19P74C5yLiScA6Ia/8b7M/j4b1VWnCoKsjaPKzPkxhHueW7E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(366004)(346002)(39860400002)(136003)(376002)(451199018)(83380400001)(966005)(6486002)(478600001)(6666004)(5660300002)(6506007)(186003)(26005)(6512007)(316002)(2906002)(38100700002)(86362001)(8936002)(66476007)(6916009)(8676002)(4326008)(41300700001)(82960400001)(66946007)(44832011)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?93K4AHRFTPLZQZHI/rWIsXZ009xg5m4KGU6wmX/7mqsbP43f9mI0f8/juhwr?=
 =?us-ascii?Q?bJ8D2xgPWSRM8zK6Yjmxp/JmjGvli6567U47EYNEImYrE6GBfh9tNPhsGvE3?=
 =?us-ascii?Q?UHW6XUnnsjeFz7+/unW+wKhwSQKimFKvawm+R5ORxlVyd5h11KfXyjiuGe8C?=
 =?us-ascii?Q?5nOlU+rNJT1qWGPoHGjg5v2erT0NusM2HwldJSJq8RpOS33/f8MF/Yee0VTi?=
 =?us-ascii?Q?kSVJuxq8iuQZDLWgcc2yTiGuIJkdW95YHXT0AerC3HJf13eI06nFznvPP8/Y?=
 =?us-ascii?Q?viyBi8Q3/8pQhIvGwOgN+EKK6d6K16j0WG7W4qSIMvwaUu2Dw2ldSxF19Tug?=
 =?us-ascii?Q?++EOh/02Jgoa4hcXcqReQtXQvJUtffHuYHZOBGKX6WWJ3PsBtqKQpe6fiH92?=
 =?us-ascii?Q?ChSsJfJbDbqEdWJIJB6sBB/ktDMhgjA6oeqUSkHOP+nd+SpS/UOsqw4HFVi5?=
 =?us-ascii?Q?2pOLguXqYtT1UEQxknD07a6Ek6lhDFx/gvqDI+HTUVOZJohhfuE84jKa0xum?=
 =?us-ascii?Q?ItxI24qD97X1E3nI94exLfSoo9XwJBEiMqMzRwlil3MyAofYMscQBUcXGbDC?=
 =?us-ascii?Q?PJnkkYqgHQgtEZqsFPRT9fL7PKXeeCfWOrxIfbeboI4gad6HQIUSHqvZXumP?=
 =?us-ascii?Q?C9kk6mMFdAZOq0EcS3Qt3+T/G5KL2SbYdn7lB52pOA6Kqs5yNZfIN6lJqfVP?=
 =?us-ascii?Q?e1LIrEVapOtMzZxTBGvvTwv40XcJOUbGfJNcsKOlF3BhgOe/VA4DPYgqY61w?=
 =?us-ascii?Q?d81vDBFRcdkZ1KiyMyZp3d7ulGo0dk/4Pv598gvTDm+oJygb9vcFHCUySJbx?=
 =?us-ascii?Q?PwVQ2pw2h9U6fKAeQd2/vn+tZzcEQQ4ZSyDATTBR7Pa9YLWrfF+WMeYRunH3?=
 =?us-ascii?Q?huLXbZI/ceJnj+phTrqzkUmmiJprCHYo2cDwHCC1KbBxdWCqaRjfImazsZyc?=
 =?us-ascii?Q?Nl5syk1k6GbQdm6bTAnrZhQ+JOPSrpXB4wEGwno62CF4YAQnZ5dfnRwxzpUZ?=
 =?us-ascii?Q?wB67i5mUdMEaT6TSNbZMqz4CKMkYfMrgQb0Pm0c8hwKAcpMetGfwwyDqzJJo?=
 =?us-ascii?Q?l+nfEFYn9l7/NDcnCMYA/Y3CwWN9DUsJeyN56V0sF5k0+G/3yPqpzHEHPNIw?=
 =?us-ascii?Q?icEqD6dHgWZIJqwXMcJte5M14YHmAGmFSWxefrDWUxIixorESZYZMzuS0YCX?=
 =?us-ascii?Q?xfJZa03BbvybQMfYsXIkzRCqZpsPVqgdYV/hjts5EaFivN7SkHaF+XyRc70i?=
 =?us-ascii?Q?CtRsDMaKkFcNBbXVOfY5QuZk9tZl7kUpDjnKyapu+dorMLhj19jvaQVbPVB1?=
 =?us-ascii?Q?swaYBwv/p7ICUL6YVWIGSODj0BRODeqYalqX6Np3PQZPZsrVJytiKQ4j3njY?=
 =?us-ascii?Q?qZfqaZ/3zPH9Nu7/d/A8GVNc5/GNxMtn4tZIhKf5GOAh8TimUHFz1udJH0Qg?=
 =?us-ascii?Q?r9rynEtzesIBPiIXAVa4ky+4/nVCdwV85hVRw8MMVWy2GtXFG724S+At2DyM?=
 =?us-ascii?Q?tmeRZOUDsSRPaotLqQdaVFlP7EKwdCI89W9rfA1cYdj8j9i+p+B5DUb1OZI6?=
 =?us-ascii?Q?CuCuFy/Qu9s0zxnwUWYZIbwa7ttqB9T0QVJ5v7hScGtfDhe6xqTMYVJvbZ7n?=
 =?us-ascii?Q?0w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac38d504-35e2-4afc-b514-08db2741179e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 23:41:12.7410 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: STKxIjJMWoX6OW/AfYN5Mo4uc8WuOx8nidCvxxZ8kjT0ibR7XHIX6T72C98SPeYtQU8nhTNzwLrcI/IofbJVdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7347
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Use atomic instead of mutex for
 xe_device_mem_access_ongoing
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

On Tue, Feb 28, 2023 at 11:17:30AM +0100, Maarten Lankhorst wrote:
> xe_guc_ct_fast_path() is called from an irq context, and cannot lock
> the mutex used by xe_device_mem_access_ongoing().
> 
> Fortunately it is easy to fix, and the atomic guarantees are good enough
> to ensure xe->mem_access.hold_rpm is set before last ref is dropped.
> 
> As far as I can tell, the runtime ref in device access should be
> killable, but don't dare to do it yet.
> 
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

I think this a better fix:
https://patchwork.freedesktop.org/series/115301/

Matt

> ---
>  drivers/gpu/drm/xe/xe_device.c       | 17 ++++++++---------
>  drivers/gpu/drm/xe/xe_device.h       | 14 ++++----------
>  drivers/gpu/drm/xe/xe_device_types.h |  4 +---
>  3 files changed, 13 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 4eb6786b11f0..ab179b1e24c1 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -237,7 +237,6 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>  	if (err)
>  		goto err;
>  
> -	mutex_init(&xe->mem_access.lock);
>  	return xe;
>  
>  err_put:
> @@ -424,25 +423,25 @@ u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)
>  void xe_device_mem_access_get(struct xe_device *xe)
>  {
>  	bool resumed = xe_pm_runtime_resume_if_suspended(xe);
> +	int ref = atomic_inc_return(&xe->mem_access.ref);
>  
> -	mutex_lock(&xe->mem_access.lock);
> -	if (xe->mem_access.ref++ == 0)
> +	if (ref == 1)
>  		xe->mem_access.hold_rpm = xe_pm_runtime_get_if_active(xe);
> -	mutex_unlock(&xe->mem_access.lock);
>  
>  	/* The usage counter increased if device was immediately resumed */
>  	if (resumed)
>  		xe_pm_runtime_put(xe);
>  
> -	XE_WARN_ON(xe->mem_access.ref == S32_MAX);
> +	XE_WARN_ON(ref == S32_MAX);
>  }
>  
>  void xe_device_mem_access_put(struct xe_device *xe)
>  {
> -	mutex_lock(&xe->mem_access.lock);
> -	if (--xe->mem_access.ref == 0 && xe->mem_access.hold_rpm)
> +	bool hold = xe->mem_access.hold_rpm;
> +	int ref = atomic_dec_return(&xe->mem_access.ref);
> +
> +	if (!ref && hold)
>  		xe_pm_runtime_put(xe);
> -	mutex_unlock(&xe->mem_access.lock);
>  
> -	XE_WARN_ON(xe->mem_access.ref < 0);
> +	XE_WARN_ON(ref < 0);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 263620953c3b..96b4f3d7969e 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -90,20 +90,14 @@ static inline struct xe_force_wake * gt_to_fw(struct xe_gt *gt)
>  void xe_device_mem_access_get(struct xe_device *xe);
>  void xe_device_mem_access_put(struct xe_device *xe);
>  
> -static inline void xe_device_assert_mem_access(struct xe_device *xe)
> +static inline bool xe_device_mem_access_ongoing(struct xe_device *xe)
>  {
> -	XE_WARN_ON(!xe->mem_access.ref);
> +	return atomic_read(&xe->mem_access.ref);
>  }
>  
> -static inline bool xe_device_mem_access_ongoing(struct xe_device *xe)
> +static inline void xe_device_assert_mem_access(struct xe_device *xe)
>  {
> -	bool ret;
> -
> -	mutex_lock(&xe->mem_access.lock);
> -	ret = xe->mem_access.ref;
> -	mutex_unlock(&xe->mem_access.lock);
> -
> -	return ret;
> +	XE_WARN_ON(!xe_device_mem_access_ongoing(xe));
>  }
>  
>  static inline bool xe_device_in_fault_mode(struct xe_device *xe)
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 9743987fc883..0b8c4ee0ad48 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -230,10 +230,8 @@ struct xe_device {
>  	 * triggering additional actions when they occur.
>  	 */
>  	struct {
> -		/** @lock: protect the ref count */
> -		struct mutex lock;
>  		/** @ref: ref count of memory accesses */
> -		s32 ref;
> +		atomic_t ref;
>  		/** @hold_rpm: need to put rpm ref back at the end */
>  		bool hold_rpm;
>  	} mem_access;
> -- 
> 2.34.1
> 

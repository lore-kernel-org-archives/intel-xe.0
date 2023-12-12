Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 448CBC4332F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 00:55:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AC4F10E539;
	Tue, 12 Dec 2023 00:55:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3113E10E539
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 00:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702342545; x=1733878545;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9ed8l6f1XD3Klkc+wkfmi1P7phrXgD1yeGU7KMujWXg=;
 b=M+xYK3j21ukzAmR8zJYVv6v4K4vbL/PblJmRKKxCwu/46OVFBQ3R3zFd
 oDvvSOoerAir5s7SXvxAlm5BwWurZkayOLO1Vg1kONGWd4KkBUfNqhvTg
 htMfXdreUK1LUb4FOpjZEBlL8yJ90ynBincDtymZ2SY0DnisGxvH4VTja
 5+WruYFo8UV2wpbX3fbKlbgN1b8yLmPU0c9ttz81U/adqyFM1yxXAzZ6O
 unAO3l+2/nmnfXuCdlTsKqWwM0vi/XTKKFdOBhUBC000G9EEsJKPqRkSi
 0cUOdVae1lowTb87zMsm7XyhgHpRT8i2vCI4EOhWwKCJb7m/HzE+nCgDQ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="425858439"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; d="scan'208";a="425858439"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 16:55:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; d="scan'208";a="21303897"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2023 16:55:43 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 16:55:42 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 16:55:42 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 16:55:42 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 16:55:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=faOiB2BJ6IqpUunGrUvIAaX0sGGS/s2+xNKrVRxjk3az3+TnswRlahH+LRhgK/45iPgxWOaz1jOjToI9Lixl3fb94pAp3RTcs1QubL4yxRfimGFhQaZsACz7GDVxuRb22UgUuZ1s3eEHH3x8exfO8SfjtcX0UEOQRxUw0pvbVpIg00ehrxOzhEsGbtEmpL3PIh2+Ms0Z8MO5z7zITrOZFXbcpS8bQ9DZm26kTOx5AAxbY364Q/h0/Iv/VRR35EfNAfqg3VxCfIBz9pYoS7MwNJSHkhTQOnAPNhqQjpu+1VGuQSoR6lxJDolbiXX7iVFzg3VjB1b52+TwtiEMEGy6cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WmqhEEo2xrQBhl9ddcuHxRhAyed/Drv3sFSdiZo3Cb4=;
 b=PFYgrvNm2RfhmZB+FmjyIz/dz1RNF21CmOEmJK9nLhbumdoBObD9rDEpRoDO2WDNdJlmlWVL6uBKLle8xZOzjzLi4+QZnbSpNUxLJIdROhDZUtmje0CEin8cPohSZxJDchlKlasY8qvGTFGh5STum6BqrV3MrjfWtaPmlECpyUCqsQfyt0N7sunyH9DLBbR9ah6zr2Q4ey9DPJ9i2sTyarAuufl3oVLkeNOW5zaNPut0A1BDmDDLlF1TNj9ozIWs83UR4EGu4KjzOp2b0JlfIy1dacFGYjBkr2b3YOaiNLRR3r5pYHQT7uXv1kfxGyGRdpQGPOq1QcyK3i/31iLwJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB7154.namprd11.prod.outlook.com (2603:10b6:a03:48d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Tue, 12 Dec
 2023 00:55:33 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7068.031; Tue, 12 Dec 2023
 00:55:33 +0000
Date: Tue, 12 Dec 2023 00:55:46 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 13/13] fixup! drm/xe: Introduce a new DRM driver for
 Intel GPUs
Message-ID: <ZXevkl91lcXdwkWA@DUT025-TGLU.fm.intel.com>
References: <20231212001045.1099517-1-rodrigo.vivi@intel.com>
 <20231212001045.1099517-13-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231212001045.1099517-13-rodrigo.vivi@intel.com>
X-ClientProxiedBy: BYAPR05CA0089.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB7154:EE_
X-MS-Office365-Filtering-Correlation-Id: 40ea8c9e-ee98-4747-eb89-08dbfaad0b4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yceHmG85nK3EQwHpaBzeM+CqxA4vuWsZ3T9PDErXNdioV52mAkiOfMHgPmdduYhRcuwi8BoKzR4O22v6HpMe2z04P7mt83omqySMnSSqO/iKDvDy+CNKYw6hCpQfqIukRDLdbMBCRWslIbeFk1ZB0D6/HaTHlnWbSdA7dz+1hTLGu577ORdf5c+ffspn4AsPH9OPdAsQiGtl+GskmD7bvgHo8AjGdZVM3t1PrSDLT4BOgfReqr6dgyGfKTG2PXQLywU2kN+WNtaJpvoWbA6L0yWUwQZ6atAWWu1C3qtOizzb/bGi+o5K27Iz9JazCKkqTuJBdCQ2iMUKlGu0S+OU3+wj7125SheosqwQcxKHqfeHn6XfEO89IRfJkWTbCTUXp5eZA34YlgQMB+qUMx7jEmYPV42024TxluJM+czj5Xkqns1RvVxZu7AXav5/Sfrw2dTiDp6STmm2Apx7UgRpie17avFggtIyBIjc3Joi3E47bcVsT2c0dMjZWuVjFxcm1jN3CUS60oGvlOpB90DEhixeJYKPc+RjXtBiPyIvEwUuQMqDr7TJyb5ysrJnco4b
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(346002)(39860400002)(396003)(366004)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(41300700001)(26005)(83380400001)(82960400001)(86362001)(38100700002)(5660300002)(316002)(8936002)(6862004)(4326008)(8676002)(2906002)(30864003)(6666004)(6512007)(6506007)(6636002)(44832011)(66476007)(66556008)(66946007)(478600001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L+Zt/Dbv2ar28a/hxKAL/CN5rQ/O6/gBC+f3+m5RzYHyYnUyQrKyU636TEEN?=
 =?us-ascii?Q?K8TvsOV/pkRiBNPeuiB7DKkwLgqzW0cGNcsdbc6Sn9B/IK+u74JlV1Wy0mtv?=
 =?us-ascii?Q?nLQzZyUIOCJycjGSGaUqk7K/2711Qf9DIcxbtOOiN6/pFwl0S2WZk+4LxVgL?=
 =?us-ascii?Q?5PWA9WBfN8tfu0FRAN2VYASjeKoWeKc2VE/hd5l190JZJqmwI78kWEQHkJ/Z?=
 =?us-ascii?Q?pR0HOPwmcx7j0veotSUiUSJrD+aSs5N7jdd0CmgnZs7ssZac2I1c6HsfmrK3?=
 =?us-ascii?Q?Sdi6Gg06rS1ACAHFy43cjZaerONbza/s11Ce7p/t9faCNKROaErl4SQkBT4D?=
 =?us-ascii?Q?cN5U0yQlIy+i7ywF2qKJVRJQbF0008NDl6TPtTMousQm7u0K1iRshqnJIi0I?=
 =?us-ascii?Q?/pri18TUB9Nn5eskuc19qKMPCVmUb5tR2kujVmVgAIX+e2tMT0GOTWJi9wLY?=
 =?us-ascii?Q?W1LPZj+id/yC10aOxNn2raZqyKJYr/0QWiChEMDcucqVUfKegS1kCo3Uz8jG?=
 =?us-ascii?Q?OVqDnx7gVABEky88i6KyVY64KymxN/W0okO/1NbrMTo9r8vvehZ8Ysq6vdyH?=
 =?us-ascii?Q?I0AbxW/kO56YblKEo1BAygjGGWYhOVeYN2PWmr6I/2Hpjgehubv42Tun6Ahi?=
 =?us-ascii?Q?UuMikjP5C/w+VBO0yG0YI0taJ41iHAVSZd2MpD/67Pax6IjmrH22NIxupLXV?=
 =?us-ascii?Q?o3Z9GG0bk+Ojr5T8+GHnsjOU0dcRF9M7iJ18sJAbl6M2ty4ccS85dmCdfE/W?=
 =?us-ascii?Q?DA3oQJR1b2sMiuIIPgfLuLDV9/7Bh3kvatjauisTI/6FAglZ7AK0HHZ2PBv4?=
 =?us-ascii?Q?Z7x/wsY2U/ocHfgK/F7fUc9iVMfvin6/vq9UWamaEyVS4bJCoZO7+h4aW7Mn?=
 =?us-ascii?Q?twLOny2DaC1awozI+/kPdQikfVK3vjjoxum/muSNpoqHBsMqcSfGL+R+ujPP?=
 =?us-ascii?Q?VRxrAInchCyxb4yfxJf1iCw+9zZC5mjjIbhujcY9OGxHMIPY0Glq4lVv34J0?=
 =?us-ascii?Q?61OoZpC9R6vTTHNigLI/hF1/9mIDfd3sh0/3OzTsPe0NjXemvF3RJLlGz/aB?=
 =?us-ascii?Q?G/RFoNtKTczdrUh0b3xPMxZacnITwbmyN36tEMgGSWFiOoFyVzgk4VxlReh1?=
 =?us-ascii?Q?Zc4hl7Ekj8Etat+gX3vGHcCVBjSpwAdtdjKr2pXBkv90ZSEo4bTaPuRNOjgA?=
 =?us-ascii?Q?ssmFQw7gyFlq318x76Pd1VTagd3VN6fUr6IlKIMKlEs8rqV3k8eB7ZqtQuPR?=
 =?us-ascii?Q?04EEkDYNvHTbwbpkRhLKCwAfTZYLpx36BNAujzjioCIZgLqUgp2ix4R1CjXv?=
 =?us-ascii?Q?Kyv1T8UrhxDol7HsQFOJHbfAIUp5GPMkg88BgFxfDChlOj3tFo4/KGLw8qUK?=
 =?us-ascii?Q?wiNKPcug3pAqmlyvHtfVSJLU+ZKYa5XtGYA1ANOdRzjx2ohrOuGuZVxZoJqY?=
 =?us-ascii?Q?4X8WkIYq6EOyxEwOGyVRV3Rwp1TPs4aCqisHmZ8FAvUU9Y/TyxsfvOfe+Ga5?=
 =?us-ascii?Q?4bbiwXT4mVjOiiOEypaxdS+KY47zNDBXFTw5f6f9AcwWZq0lfcCkotEPY1mZ?=
 =?us-ascii?Q?AhDZDSui5I683U9ZemThoVb4rE0eS9C+IHpYEq+ugtLSlsHiWmyXyNhI6DHD?=
 =?us-ascii?Q?Kw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 40ea8c9e-ee98-4747-eb89-08dbfaad0b4a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 00:55:33.0229 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KUNFHEDCGPUX4W6Z9MyejESbwQyzrXqbun6JI0kSt99h1FCEvYb8Y71E5qGjIms9Ldat5GLAXOyIcstZattJJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7154
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

On Mon, Dec 11, 2023 at 07:10:45PM -0500, Rodrigo Vivi wrote:
> Adjust to recent drm-scheduler changes that already landed in drm-next
> 
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c          |  8 +++----
>  drivers/gpu/drm/xe/xe_exec_queue.h          |  2 +-
>  drivers/gpu/drm/xe/xe_exec_queue_types.h    | 14 ++++++++++--
>  drivers/gpu/drm/xe/xe_execlist.c            | 25 +++++++++------------
>  drivers/gpu/drm/xe/xe_execlist_types.h      |  6 ++---
>  drivers/gpu/drm/xe/xe_gpu_scheduler.h       |  2 +-
>  drivers/gpu/drm/xe/xe_gpu_scheduler_types.h |  1 -
>  drivers/gpu/drm/xe/xe_guc_submit.c          | 18 +++++++--------
>  drivers/gpu/drm/xe/xe_migrate.c             |  2 +-
>  drivers/gpu/drm/xe/xe_sched_job.c           |  2 +-
>  10 files changed, 43 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 91d67f4da2cc..85bc25fe99ed 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -219,17 +219,17 @@ struct xe_exec_queue *xe_exec_queue_lookup(struct xe_file *xef, u32 id)
>  	return q;
>  }
>  
> -enum drm_sched_priority
> +enum xe_exec_queue_priority
>  xe_exec_queue_device_get_max_priority(struct xe_device *xe)
>  {
> -	return capable(CAP_SYS_NICE) ? DRM_SCHED_PRIORITY_HIGH :
> -				       DRM_SCHED_PRIORITY_NORMAL;
> +	return capable(CAP_SYS_NICE) ? XE_EXEC_QUEUE_PRIORITY_HIGH :
> +				       XE_EXEC_QUEUE_PRIORITY_NORMAL;
>  }
>  
>  static int exec_queue_set_priority(struct xe_device *xe, struct xe_exec_queue *q,
>  				   u64 value, bool create)
>  {
> -	if (XE_IOCTL_DBG(xe, value > DRM_SCHED_PRIORITY_HIGH))
> +	if (XE_IOCTL_DBG(xe, value > XE_EXEC_QUEUE_PRIORITY_HIGH))
>  		return -EINVAL;
>  
>  	if (XE_IOCTL_DBG(xe, value > xe_exec_queue_device_get_max_priority(xe)))
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
> index 8b587d1b2c2c..d959cc4a1a82 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> @@ -57,7 +57,7 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
>  				struct drm_file *file);
>  int xe_exec_queue_get_property_ioctl(struct drm_device *dev, void *data,
>  				     struct drm_file *file);
> -enum drm_sched_priority xe_exec_queue_device_get_max_priority(struct xe_device *xe);
> +enum xe_exec_queue_priority xe_exec_queue_device_get_max_priority(struct xe_device *xe);
>  
>  void xe_exec_queue_last_fence_put(struct xe_exec_queue *e, struct xe_vm *vm);
>  void xe_exec_queue_last_fence_put_unlocked(struct xe_exec_queue *e);
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 5ba47a5cfdbd..6826feb650f3 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -21,6 +21,16 @@ struct xe_guc_exec_queue;
>  struct xe_hw_engine;
>  struct xe_vm;
>  
> +enum xe_exec_queue_priority {
> +	XE_EXEC_QUEUE_PRIORITY_UNSET = -2, /* For execlist usage only */
> +	XE_EXEC_QUEUE_PRIORITY_LOW = 0,
> +	XE_EXEC_QUEUE_PRIORITY_NORMAL,
> +	XE_EXEC_QUEUE_PRIORITY_HIGH,
> +	XE_EXEC_QUEUE_PRIORITY_KERNEL,
> +
> +	XE_EXEC_QUEUE_PRIORITY_COUNT
> +};
> +
>  /**
>   * struct xe_exec_queue - Execution queue
>   *
> @@ -43,7 +53,7 @@ struct xe_exec_queue {
>  	/** @class: class of this exec queue */
>  	enum xe_engine_class class;
>  	/** @priority: priority of this exec queue */
> -	enum xe_sched_priority priority;
> +	enum xe_exec_queue_priority priority;
>  	/**
>  	 * @logical_mask: logical mask of where job submitted to exec queue can run
>  	 */
> @@ -182,7 +192,7 @@ struct xe_exec_queue_ops {
>  	void (*fini)(struct xe_exec_queue *q);
>  	/** @set_priority: Set priority for exec queue */
>  	int (*set_priority)(struct xe_exec_queue *q,
> -			    enum drm_sched_priority priority);
> +			    enum xe_exec_queue_priority priority);
>  	/** @set_timeslice: Set timeslice for exec queue */
>  	int (*set_timeslice)(struct xe_exec_queue *q, u32 timeslice_us);
>  	/** @set_preempt_timeout: Set preemption timeout for exec queue */
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index e8754adfc52a..d82b50de144e 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -33,8 +33,6 @@
>  #define XEHP_SW_CTX_ID_SHIFT  39
>  #define XEHP_SW_CTX_ID_WIDTH  16
>  
> -#define XE_SCHED_PRIORITY_UNSET -2
> -
>  #define SW_CTX_ID \
>  	GENMASK_ULL(SW_CTX_ID_WIDTH + SW_CTX_ID_SHIFT - 1, \
>  		    SW_CTX_ID_SHIFT)
> @@ -154,7 +152,7 @@ static void __xe_execlist_port_start_next_active(struct xe_execlist_port *port)
>  			list_del(&exl->active_link);
>  
>  			if (xe_execlist_is_idle(exl)) {
> -				exl->active_priority = XE_SCHED_PRIORITY_UNSET;
> +				exl->active_priority = XE_EXEC_QUEUE_PRIORITY_UNSET;
>  				continue;
>  			}
>  
> @@ -202,7 +200,7 @@ static void xe_execlist_port_irq_handler(struct xe_hw_engine *hwe,
>  }
>  
>  static void xe_execlist_port_wake_locked(struct xe_execlist_port *port,
> -					 enum drm_sched_priority priority)
> +					 enum xe_exec_queue_priority priority)
>  {
>  	xe_execlist_port_assert_held(port);
>  
> @@ -215,22 +213,22 @@ static void xe_execlist_port_wake_locked(struct xe_execlist_port *port,
>  static void xe_execlist_make_active(struct xe_execlist_exec_queue *exl)
>  {
>  	struct xe_execlist_port *port = exl->port;
> -	enum drm_sched_priority priority = exl->entity.priority;
> +	enum xe_exec_queue_priority priority = exl->active_priority;
>  
> -	XE_WARN_ON(priority == XE_SCHED_PRIORITY_UNSET);
> +	XE_WARN_ON(priority == XE_EXEC_QUEUE_PRIORITY_UNSET);
>  	XE_WARN_ON(priority < 0);
>  	XE_WARN_ON(priority >= ARRAY_SIZE(exl->port->active));
>  
>  	spin_lock_irq(&port->lock);
>  
>  	if (exl->active_priority != priority &&
> -	    exl->active_priority != XE_SCHED_PRIORITY_UNSET) {
> +	    exl->active_priority != XE_EXEC_QUEUE_PRIORITY_UNSET) {
>  		/* Priority changed, move it to the right list */
>  		list_del(&exl->active_link);
> -		exl->active_priority = XE_SCHED_PRIORITY_UNSET;
> +		exl->active_priority = XE_EXEC_QUEUE_PRIORITY_UNSET;
>  	}
>  
> -	if (exl->active_priority == XE_SCHED_PRIORITY_UNSET) {
> +	if (exl->active_priority == XE_EXEC_QUEUE_PRIORITY_UNSET) {
>  		exl->active_priority = priority;
>  		list_add_tail(&exl->active_link, &port->active[priority]);
>  	}
> @@ -344,14 +342,13 @@ static int execlist_exec_queue_init(struct xe_exec_queue *q)
>  		goto err_free;
>  
>  	sched = &exl->sched;
> -	err = drm_sched_entity_init(&exl->entity, DRM_SCHED_PRIORITY_MIN,
> -				    &sched, 1, NULL);
> +	err = drm_sched_entity_init(&exl->entity, 0, &sched, 1, NULL);
>  	if (err)
>  		goto err_sched;
>  
>  	exl->port = q->hwe->exl_port;
>  	exl->has_run = false;
> -	exl->active_priority = XE_SCHED_PRIORITY_UNSET;
> +	exl->active_priority = XE_EXEC_QUEUE_PRIORITY_UNSET;
>  	q->execlist = exl;
>  	q->entity = &exl->entity;
>  
> @@ -378,7 +375,7 @@ static void execlist_exec_queue_fini_async(struct work_struct *w)
>  	xe_assert(xe, !xe_device_uc_enabled(xe));
>  
>  	spin_lock_irqsave(&exl->port->lock, flags);
> -	if (WARN_ON(exl->active_priority != XE_SCHED_PRIORITY_UNSET))
> +	if (WARN_ON(exl->active_priority != XE_EXEC_QUEUE_PRIORITY_UNSET))
>  		list_del(&exl->active_link);
>  	spin_unlock_irqrestore(&exl->port->lock, flags);
>  
> @@ -403,7 +400,7 @@ static void execlist_exec_queue_fini(struct xe_exec_queue *q)
>  }
>  
>  static int execlist_exec_queue_set_priority(struct xe_exec_queue *q,
> -					    enum drm_sched_priority priority)
> +					    enum xe_exec_queue_priority priority)
>  {
>  	/* NIY */
>  	return 0;
> diff --git a/drivers/gpu/drm/xe/xe_execlist_types.h b/drivers/gpu/drm/xe/xe_execlist_types.h
> index ee1fccd4ee8b..f94bbf4c53e4 100644
> --- a/drivers/gpu/drm/xe/xe_execlist_types.h
> +++ b/drivers/gpu/drm/xe/xe_execlist_types.h
> @@ -10,7 +10,7 @@
>  #include <linux/spinlock.h>
>  #include <linux/workqueue.h>
>  
> -#include <drm/gpu_scheduler.h>
> +#include "xe_exec_queue_types.h"
>  
>  struct xe_hw_engine;
>  struct xe_execlist_exec_queue;
> @@ -20,7 +20,7 @@ struct xe_execlist_port {
>  
>  	spinlock_t lock;
>  
> -	struct list_head active[DRM_SCHED_PRIORITY_COUNT];
> +	struct list_head active[XE_EXEC_QUEUE_PRIORITY_COUNT];
>  
>  	u32 last_ctx_id;
>  
> @@ -42,7 +42,7 @@ struct xe_execlist_exec_queue {
>  
>  	struct work_struct fini_async;
>  
> -	enum drm_sched_priority active_priority;
> +	enum xe_exec_queue_priority active_priority;
>  	struct list_head active_link;
>  };
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
> index 86133835d4d1..6731b13da8bb 100644
> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
> @@ -53,6 +53,5 @@ struct xe_gpu_scheduler {
>  
>  #define xe_sched_entity		drm_sched_entity
>  #define xe_sched_policy		drm_sched_policy
> -#define xe_sched_priority	drm_sched_priority
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 46b132ee1d3a..ad5e19ecd33c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -410,25 +410,25 @@ MAKE_EXEC_QUEUE_POLICY_ADD(preemption_timeout, PREEMPTION_TIMEOUT)
>  MAKE_EXEC_QUEUE_POLICY_ADD(priority, SCHEDULING_PRIORITY)
>  #undef MAKE_EXEC_QUEUE_POLICY_ADD
>  
> -static const int xe_sched_prio_to_guc[] = {
> -	[DRM_SCHED_PRIORITY_MIN] = GUC_CLIENT_PRIORITY_NORMAL,
> -	[DRM_SCHED_PRIORITY_NORMAL] = GUC_CLIENT_PRIORITY_KMD_NORMAL,
> -	[DRM_SCHED_PRIORITY_HIGH] = GUC_CLIENT_PRIORITY_HIGH,
> -	[DRM_SCHED_PRIORITY_KERNEL] = GUC_CLIENT_PRIORITY_KMD_HIGH,
> +static const int xe_exec_queue_prio_to_guc[] = {
> +	[XE_EXEC_QUEUE_PRIORITY_LOW] = GUC_CLIENT_PRIORITY_NORMAL,
> +	[XE_EXEC_QUEUE_PRIORITY_NORMAL] = GUC_CLIENT_PRIORITY_KMD_NORMAL,
> +	[XE_EXEC_QUEUE_PRIORITY_HIGH] = GUC_CLIENT_PRIORITY_HIGH,
> +	[XE_EXEC_QUEUE_PRIORITY_KERNEL] = GUC_CLIENT_PRIORITY_KMD_HIGH,
>  };
>  
>  static void init_policies(struct xe_guc *guc, struct xe_exec_queue *q)
>  {
>  	struct exec_queue_policy policy;
>  	struct xe_device *xe = guc_to_xe(guc);
> -	enum xe_sched_priority prio = q->priority;
> +	enum xe_exec_queue_priority prio = q->priority;
>  	u32 timeslice_us = q->sched_props.timeslice_us;
>  	u32 preempt_timeout_us = q->sched_props.preempt_timeout_us;
>  
>  	xe_assert(xe, exec_queue_registered(q));
>  
>  	__guc_exec_queue_policy_start_klv(&policy, q->guc->id);
> -	__guc_exec_queue_policy_add_priority(&policy, xe_sched_prio_to_guc[prio]);
> +	__guc_exec_queue_policy_add_priority(&policy, xe_exec_queue_prio_to_guc[prio]);
>  	__guc_exec_queue_policy_add_execution_quantum(&policy, timeslice_us);
>  	__guc_exec_queue_policy_add_preemption_timeout(&policy, preempt_timeout_us);
>  
> @@ -1227,7 +1227,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>  	err = xe_sched_entity_init(&ge->entity, sched);
>  	if (err)
>  		goto err_sched;
> -	q->priority = DRM_SCHED_PRIORITY_NORMAL;
> +	q->priority = XE_EXEC_QUEUE_PRIORITY_NORMAL;
>  
>  	if (xe_exec_queue_is_lr(q))
>  		INIT_WORK(&q->guc->lr_tdr, xe_guc_exec_queue_lr_cleanup);
> @@ -1293,7 +1293,7 @@ static void guc_exec_queue_fini(struct xe_exec_queue *q)
>  }
>  
>  static int guc_exec_queue_set_priority(struct xe_exec_queue *q,
> -				       enum xe_sched_priority priority)
> +				       enum xe_exec_queue_priority priority)
>  {
>  	struct xe_sched_msg *msg;
>  
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index be2a92dee52c..2ca927f3fb2a 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -398,7 +398,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
>  		return ERR_CAST(m->q);
>  	}
>  	if (xe->info.has_usm)
> -		m->q->priority = DRM_SCHED_PRIORITY_KERNEL;
> +		m->q->priority = XE_EXEC_QUEUE_PRIORITY_KERNEL;
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

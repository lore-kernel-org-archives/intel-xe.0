Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B7DFEE0204
	for <intel-xe@archiver.kernel.org>; Wed, 13 Sep 2023 21:37:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4E1E10E0FB;
	Wed, 13 Sep 2023 21:37:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C557210E119
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Sep 2023 21:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694641074; x=1726177074;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uvqDT+TE9qEseqFQSXjiKuWNnRGDyj1LatX/j+scEFU=;
 b=MfW3IlqrsNSYd4MVNmsi7Wt/p6hAyd61iSdrAGrxA0hj35wvw7wlveV4
 PdnqVyqshL0LJxN5RA5oiaNe3RZhNoTVa4fIU3Jq3ditjfFlttAMX0rE0
 g54wUy/tBTo9M1b5C+Ch6sB90u4ZEUavqwdWm2Z1YTa1LUtuwWL47xE92
 xoNzuElZH8qczaJ/sY4391T7pQyxHXEVe57Xs9x6Tbxa7XyQd5Fc5Rg3X
 Mb+pWDN/wqPtg4f4uIf9lUGqvM1pN0mbOhYs6THZpJDaHqc8N8dvhLAH9
 lwV0U/ZGTQxHFQSMG5bbegCAzduACszCYHSYCcxIkwM36759BtJKJ04XU A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="378715915"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; d="scan'208";a="378715915"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 14:37:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="747484637"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; d="scan'208";a="747484637"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Sep 2023 14:37:54 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 13 Sep 2023 14:37:53 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 13 Sep 2023 14:37:53 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 13 Sep 2023 14:37:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i0LV/6FMvmI02HhwEjCG8qWa0MNKl/6XLPUecuA+lvQFONWbh2GCB9ToXf6XrfftOlDkL96KFDBvfYQZVxLkbblTiFjcYLtvA+jYXx5q3h9Rhgw5RzyvCZ0cky+XPgds/Y+o+tX7Ldwkhs2ZxUkq32h0Cey0wvqGrT7RUwE0SLZm9NWSG4BhiSR2Fx+G9ZbAveoQCYXvEPKLsaxX2DwdiGy+4c1+UhLLBMA600m1FwwDZQ02gQkhC8Hc4RSKerkhq7m3kah/gd3GIoz20KTImkokFV3g4F8vs0sOk4H/Cnohf/qpoEDvqGZybt2OCVGjBrwEjcpo5G7cBmB5O9834w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dutUyvfKN4CjTr9rw8rmgWMhN26pmkPsxPVBCT5H3bU=;
 b=Er6AEnd5oVzdddyyvkUYQEqmlp/Dt07wziRYuWB/+OEk1ag45rJZk4R1FUeepnQ9Mi23ZYRZz9gYKWvKcih+nEzCbzyybJi60ieeJbV4CAYsD193zZSOd+ob2WRzZ3UFJxIHScOB44QpQbao+5l1M7M59jykU0pqWd0c+9w6XVmPVe9HyMBgXNZLsfMv3jCft5MaYt4peGiHECqo8YHXfDQRExmpxs1XVZWiPylLQq8nl+cpyrKLqH/x5uTK5K9NGo2LSle1jdlUhz8jqnEhx+gkwWo7u/N+NZ5EhCFhjPngx02T74RTZHWGESEAadFSWXDMIzE44/FWSC3+tKg6lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by CH3PR11MB7939.namprd11.prod.outlook.com (2603:10b6:610:131::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19; Wed, 13 Sep
 2023 21:37:51 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::25ea:ab9f:da46:2ce5]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::25ea:ab9f:da46:2ce5%4]) with mapi id 15.20.6792.019; Wed, 13 Sep 2023
 21:37:51 +0000
Date: Wed, 13 Sep 2023 14:37:48 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZQIrrP+qYHEDR1+0@nvishwa1-DESK>
References: <20230912235159.2111118-1-matthew.brost@intel.com>
 <20230912235159.2111118-3-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230912235159.2111118-3-matthew.brost@intel.com>
X-ClientProxiedBy: BYAPR07CA0104.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::45) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|CH3PR11MB7939:EE_
X-MS-Office365-Filtering-Correlation-Id: 4708ea86-a3f1-4458-8bfe-08dbb4a1ae7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PsCmy13dCmRNkfS6IUE56XQtOdmnmUdH3fwWgO6YTjZORUyNI2y9KBqvY0pW+9PRu6ivjGIFbusCm6u3prxHKr6L4rTPVLCb2L/kgtJG9Ude0WnV8fK2EykrlJdn2RRnLG0QLCzyMdxVrVImHRvfkQ9N4IPGD/qeVInfJEsU26bxw6tAOz857vbyUNmw7vIsUO7El57P5F7Vzf1ABT8Z/TERTeGV8N7ljxZBAKeuu1nTIPyQfHC+PnHuhusARGG9p9VFVMbI8U1Va4QQekVzTJKSH00H4Xr39CHmQVgxmd/BUdkKKK7dv1FnM2CJB7z4hTs4wWN0Yc9SEl6WR3q5QhYfZq34EgzYyLgcqw10UUL1HWHEFc8+5JRPfBHIPbfrzqA0mFp7J6LsCCyodpMBCvBl0pPDVedjsz/Xg3GOcTs69uFYNYIsFAjljVQtwUXoxLLZs4K05KcoROpY3a/CVs6LCSiFrJmHKekR+KvmnKyCzFB2jmJH+SDtHLirO8N3naYvHY0ObNf6D7hkAQLh7yZy6PZuQjtLS/GfBfe/1J8ZCICy8CdBt6xa+K6SKEZj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(396003)(366004)(376002)(39860400002)(346002)(186009)(1800799009)(451199024)(33716001)(5660300002)(83380400001)(8936002)(86362001)(4326008)(6862004)(8676002)(41300700001)(6486002)(6512007)(6666004)(44832011)(6506007)(26005)(9686003)(2906002)(82960400001)(66946007)(38100700002)(66556008)(6636002)(478600001)(66476007)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gzfDd1YujGIFLVZ8WmexAevieZzWM5zkRSFE4jIjmvo3i19hlVEvuP2hgAxo?=
 =?us-ascii?Q?NcqTI2vVYKx/Toyp9RnhyPewadLKtalvCX+WSaPK8SZCoSZU8yA/xpXIanQV?=
 =?us-ascii?Q?BFFlio3A8lSOWhT0sX7aldwcdODZUR31uqaKgY1Ii1dV0LJrfLPKQlwrMXxP?=
 =?us-ascii?Q?8DHFeyfZQv3oHGZPfawpE+ZfWlm/qhGN+rYfML0FD2ZIB/EMkiqgWg/UPz4E?=
 =?us-ascii?Q?cSKqwLMp1wPTC5diS2S02VS36IpiBbQqDNbdi19zjYoO7pk2o7C4gL714oD9?=
 =?us-ascii?Q?kN91DMvewL5KwGyDZzIkUjso2uCNDHMRTCQkxiDbxJCWSqYEbcQ1rRatAQMz?=
 =?us-ascii?Q?tfJHVGJJcdtiPu03JV01X2939uXnm6fYfXDR4fYtbhGFlFyf2x/DavJGijAC?=
 =?us-ascii?Q?SrneMnG3VpY9QKK6pOvfDTdCLu6cvBESZ2tioqjAXUDW36k0jZaiHG50rsgF?=
 =?us-ascii?Q?ZALztNZmPTmIhQxqr8A+5UDLDKbU/o8vTtqnPBqvQDzd9nuWdRE6dyvi3wyx?=
 =?us-ascii?Q?z2U+7v34v1mnRxO1sjSFvITnozTtTdhmA2RhB/NtYac2Ym57l2SKZUmAAVUb?=
 =?us-ascii?Q?4wvbERjxC/GxdbtoNjuQDnJegcr8eCjVCUx/aW0wdhTogtf30NXyfTvvf2Dj?=
 =?us-ascii?Q?3c/whSwtWxxDsn6kAjRJtX3gbu47lY5w0jU3hoksId77HKJJIn46bjB4KCia?=
 =?us-ascii?Q?TSmSh3TxAyvbmeggRHRO2PUsESMFz/UuJgJOpNfTVJkmfgW0s0R0/gf9QBA2?=
 =?us-ascii?Q?jcoDHeP0JgYXgK16s9awvSV2LWtkQlx8nMh7RDqSlDygaJQeyC2k+mIYdnVS?=
 =?us-ascii?Q?ozCKVZZxuNqaT52pDjR8RNyURulxHp466mhhRNGy4CjiiVmS6rAfSSOZj16P?=
 =?us-ascii?Q?GqOXZw3c8ddbsq6GGKXbe0CD2Z1hA7p6gUv/IxFzIAS7pLiqZN9HZrN3Xjji?=
 =?us-ascii?Q?y7t+1rqHbLlJepMiZnFd1OjJ+597lal1cs9u/GuJhVBi1PDKoiUKfqdew6Uk?=
 =?us-ascii?Q?JTjo6QOGYNTPhcbvajAQVbI3U5SioGBt61xKcDwQ3ATz9QvSldxZjvOjf4N6?=
 =?us-ascii?Q?2p3mPxCiYjWDUUmYTJ3Ty4OwmWd+lEzoRYUOSn16Fb0ysa4VlP71YXi53Bwv?=
 =?us-ascii?Q?RBIaWHbMkq58gny6oc6SVhA1lcbaJ74PfJLD7Ig6dbl7gSTzhI/RyQ03TpMV?=
 =?us-ascii?Q?gCMM5zGg4N70zammvK87xeqCJ2S0qGgwED1o9MDtQHQHbL9N2FBMv2Uf1TSU?=
 =?us-ascii?Q?v6rGEKz1jMJqvzKJtxrAZ/d6mZuCgR8wBAs3j3Ct++giHYbAHzZCABjvCRhG?=
 =?us-ascii?Q?efm9ZMrjLrFdMw9akO8KUl8M1hnWMS0yesy4XPqGWDmI/J9kaSOJB7X0Zo1T?=
 =?us-ascii?Q?e5XdGoAzE3i1M5KwIOrnXN/dJyRbDEStH5xU6495bwAykVjr6p9a9nXv7le6?=
 =?us-ascii?Q?sv33xVdMaI6CldrLg6gZ7KRsdbPZHk0R8vIlMMaD7aChJce7Rfl3f5KVjiVf?=
 =?us-ascii?Q?O4CNw2t/Evay7JmxGy+u3d3z9wv428xf/VXdvgLWnWgSTjjw4CnQDJu9sr0D?=
 =?us-ascii?Q?9F9hGWriB0z44Nsevhbc1Jqw9KI1vydikwDzYKC55bkN1nHoQ12HZbiC29Zx?=
 =?us-ascii?Q?n8sGto/4G4HWk7JngcJvIPA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4708ea86-a3f1-4458-8bfe-08dbb4a1ae7e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 21:37:51.4500 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ERGDhvsBkkAldkjetAC136bWiWXMjtOdCd/+L1khUH0HXFjA7RaLtbzdF3cpB2nS0EuLzTGHKVy9246DmvtwORPji2SQOUEE1pDjrGW1EjI79bk7PYQGMLCSo52WeKX7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7939
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Remove
 XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE from uAPI
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

On Tue, Sep 12, 2023 at 04:51:59PM -0700, Matthew Brost wrote:
>Functionality of XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE deprecate in
>previous patch, drop from uAPI.

Probably should mention why it is being done.

>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>---
> drivers/gpu/drm/xe/xe_exec_queue.c |  7 -------
> include/uapi/drm/xe_drm.h          | 19 ++++++-------------
> 2 files changed, 6 insertions(+), 20 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>index ac392bcf7bc8..c0c0e799b278 100644
>--- a/drivers/gpu/drm/xe/xe_exec_queue.c
>+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>@@ -320,12 +320,6 @@ static int exec_queue_set_preemption_timeout(struct xe_device *xe,
> 	return q->ops->set_preempt_timeout(q, value);
> }
>
>-static int exec_queue_set_compute_mode(struct xe_device *xe, struct xe_exec_queue *q,
>-				       u64 value, bool create)
>-{
>-	return 0;
>-}
>-
> static int exec_queue_set_persistence(struct xe_device *xe, struct xe_exec_queue *q,
> 				      u64 value, bool create)
> {
>@@ -411,7 +405,6 @@ static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
> 	[XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY] = exec_queue_set_priority,
> 	[XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE] = exec_queue_set_timeslice,
> 	[XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT] = exec_queue_set_preemption_timeout,
>-	[XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE] = exec_queue_set_compute_mode,
> 	[XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE] = exec_queue_set_persistence,
> 	[XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT] = exec_queue_set_job_timeout,
> 	[XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER] = exec_queue_set_acc_trigger,
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index 00d5cb4ef85e..8b05573cecfd 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -707,21 +707,14 @@ struct drm_xe_exec_queue_set_property {
> 	/** @exec_queue_id: Exec queue ID */
> 	__u32 exec_queue_id;
>
>-#define XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY			0
>+#define XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
> #define XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
> #define XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT	2
>-	/*
>-	 * Long running or ULLS engine mode. DMA fences not allowed in this
>-	 * mode. Must match the value of DRM_XE_VM_CREATE_COMPUTE_MODE, serves
>-	 * as a sanity check the UMD knows what it is doing. Can only be set at
>-	 * engine create time.
>-	 */
>-#define XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE		3
>-#define XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE		4
>-#define XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT		5
>-#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		6
>-#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		7
>-#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY		8
>+#define XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE		3
>+#define XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT		4
>+#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		5
>+#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		6
>+#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY	7

I know the driver is not in upstream kernel yet, but wondering
whether we should add some kind of abi versioning here until then?

Niranjana

> 	/** @property: property to set */
> 	__u32 property;
>
>-- 
>2.34.1
>

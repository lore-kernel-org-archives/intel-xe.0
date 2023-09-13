Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53680EE020F
	for <intel-xe@archiver.kernel.org>; Wed, 13 Sep 2023 22:09:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A9DB10E117;
	Wed, 13 Sep 2023 22:09:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DFFF10E117
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Sep 2023 22:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694642963; x=1726178963;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IbYGFNqlRLcp2UrlIGdLw2ddDiAZ7zEg7uTGPMtyzvE=;
 b=hGaJ1dzM8flyUihwRH1EkczC25d5lI3D2TSt0Jv+YuPS2WZVfyswM+58
 YV3F8a6naAieip8oqVbPcu1tLHrrshq7+qkl4MbnzR++0K6qgPrg1SpVI
 rVC+4LgG8+ce9DYVnjEtzOYY82ULqtthQIi1xSIUgx8j6N8hQ/icJZRId
 NXhZ4HWLsV2LEWof+WhRm2ZVF8DjLSoDM7a1Al8U996LZP+uCsFbB9g39
 eaJLu2sW+qSxC4isJKExmDL6kO4rpCc038qsXe4eD8qvRpEPO/uYY2vmj
 OZP3jbzmxshtTzskWzZp1N/t1Lvmj6skhopJ2e1V7EzAPIHBR8RYLD6Xk A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="465168751"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; d="scan'208";a="465168751"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 15:09:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="779385553"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; d="scan'208";a="779385553"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Sep 2023 15:09:22 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 13 Sep 2023 15:09:21 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 13 Sep 2023 15:09:21 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 13 Sep 2023 15:09:21 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 13 Sep 2023 15:09:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qzja0Vu8jZVdZZskuZo0tR7kdlqczav9QxR8HJ2xtoqmjPR7aNIEdOiIbxrNaTdvJAqnXcIp6OS4RXOEgrqxV7Zt/Pyi1A5sjvKEVoUhbGJRUHG/lg1BqasKcEqDKLiVanoM8eIVxQgLWBEtt+InbZqAZACJ1s3ZXRCkpikq5VB15FO4uqx0+dTMBkdd8oLam03q9mlsDLEPfyjqIhO7UPPe5ImJNMn9C/0lKHT/4NoaYeNRhJV/TMZp+0Vu+0JqGzRR8e094Q/TEZyJk/dN+Y40qehBrCe+pka+zG8RuTEM8TNa2G1PBPpyLP6Zh1zioIzlyFPn7g14UxZ164TLBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wlCqweNOmkBJ5gwVQ/DnK+otg9mDa9/ZD/S68Be6hMU=;
 b=FBrbghrMYmyQFK5QX3L/j7z9IVHQyynTsH8K3rHvmadwbgJ3GXzhlkONe1idTc3CdvLLwrGBJWMLaixBJRe22gXk9Ei27GAfVDo5Ht8UQbw7qoek8CuDNduWtGCQBZ0Ts4/VkDwTOa7J5uybeYq1mDwzLzeRyY90DxUXgVtQWsbMrq5uYDrp/9ioWphg/Y9KzWHXi5XzoiF3hcg/rj6dKyPFPsJy7FyhhqgNHBiA2lsnKiQOza0XFwd4KWva0QPrf2Z8lPU33+JD4zZAJ9GpRcXLjDsM8pl8kmR6kk1u1K4psRvpqJr+Mg0DUqvNvPx6aiVfkz016RWlqEf4H+48qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA0PR11MB4575.namprd11.prod.outlook.com (2603:10b6:806:9b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20; Wed, 13 Sep
 2023 22:09:18 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b%3]) with mapi id 15.20.6745.035; Wed, 13 Sep 2023
 22:09:18 +0000
Date: Wed, 13 Sep 2023 22:08:15 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Message-ID: <ZQIyz5d9PpVYtbXP@DUT025-TGLU.fm.intel.com>
References: <20230912235159.2111118-1-matthew.brost@intel.com>
 <20230912235159.2111118-3-matthew.brost@intel.com>
 <ZQIrrP+qYHEDR1+0@nvishwa1-DESK>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZQIrrP+qYHEDR1+0@nvishwa1-DESK>
X-ClientProxiedBy: SJ0PR13CA0151.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA0PR11MB4575:EE_
X-MS-Office365-Filtering-Correlation-Id: 78dc6c01-867c-4564-53e9-08dbb4a61343
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YBC9JjinxE8ih3i4LbCFX4G0pkzasM/I8aCOX7iaJAX+N4QCRkF1jCkSGmJF8ROh0v+yd4WbXA+swmN/Q+OzkNoQPDLQGUmqXoByJIeft6B+Wn4tGgXHNDvrE03t+HSwBEDVOlsICtoklOugZN4x1oZRX2IL7DECFTS25loyXH6Rkt6C22Gn/a6sjJuAic8KTyaG8fgzcEu0fOF4dVhlcBwA+9wyIKcBaG0wBqqtKaCt0wZzTNBw/4bgm5wuW2YzYnDRx+0C6RrmBcHaGZM8EsIEJN746lkM/ahGUqhbgpBXBGq32O/8eHmgnsVNNRQj5IVjAXuhaFFq7BpkOhFaBx0MiP0aRM5fCCof5y7Rf2SpOKOIixSnVxFP2GzfkaYyZxOfco/V8pvxzapgnn0YfQj3P6jxejQAQwk6i7fEtfjxDeQvCmBPEIt53UYsMP9D7u+ErvVk1TJhr9AzIAjrr/DwdcndxeCXGWBttxQqI2kWPgFFN2AlzBkF3CJaRcdFf6W/V68KjkqdmsnZWCfcJVOMoEC880e+p2JBI3kaSYrckToiarKPtd07mLycJOd7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(376002)(346002)(396003)(366004)(186009)(451199024)(1800799009)(5660300002)(8676002)(8936002)(4326008)(6506007)(6862004)(6486002)(44832011)(41300700001)(316002)(478600001)(66476007)(66556008)(66946007)(6666004)(2906002)(6636002)(6512007)(26005)(83380400001)(82960400001)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FvoWT/AZE2fFrKkvcavOCvFsbCFcxaE3HhOsZHoyBb752MboJghV8IRfGYGH?=
 =?us-ascii?Q?gHCd6nCuObDPnOzVNKi4m5OVret4Si9bJW/FSof/QoVwNaBiRoUyiq6oGTrf?=
 =?us-ascii?Q?0rwgfCBJbiJBgD2WzSUpo8BoJM7s9pp/lDySYhGySQ7G2WHv1s1CKv5OkleC?=
 =?us-ascii?Q?nlDvB8Ia85VbdcvRv0PCKc4PlGTVqAU3pLt/hoVtqFwTSfNB7GOMVg1Ofg+Z?=
 =?us-ascii?Q?T8z8hguyDTVfQHw4HtXfNJ+gbmcBWhXJtQNyYAdK4hTGRt+o+4I0YULB/cfA?=
 =?us-ascii?Q?0JDT8GntCLDOsdxub/+858nzQGGZ9eOjWh5vL+ZQZSry2OR1XU8egSDBffyI?=
 =?us-ascii?Q?eEBZd1OfDL50aqFLeVYw9nAcHfH+ZoHlTs7eg8RdpvUFPLUKxJgArsOlMteN?=
 =?us-ascii?Q?hXZCUynPKBmOsLrWHXVbAbiqLcSU2D5Rjuv8IdZSlCTCClfaP3geYdIISX17?=
 =?us-ascii?Q?4KpnW1c2q09pM/3fGD55xFpZtSKJsLwGLD2B1aOD1dN1khEYItz9kGkJEty9?=
 =?us-ascii?Q?C6vbj+s5GY2ercfixR7CsFbJeoyzU+OL7VwfT2hjcdXfJ0cInA5YlwAh511r?=
 =?us-ascii?Q?VfZvOh0+fD3mKxV2joLn1EkIFyQMLFa7PaVmeCaLd2umnLsN3XS2ntd3HULS?=
 =?us-ascii?Q?k6rd2klELuqi7V5ThDzOblkPdDnxy9dWLSdDY9Fxtb44I3tc8HW7V0qZAOSF?=
 =?us-ascii?Q?C50Tr5fxnoQWSME8b9Rbm/WT9DiVv9PRQfIbYTRX77nhvrhZegBpe8wgETed?=
 =?us-ascii?Q?l/tuZV/JausOWz0cAfiHYX03K2fVe3Z7/QCqFdNN4KmwOisGT4Q3kjkdLy+0?=
 =?us-ascii?Q?1CbmKJ2fNlj0CYgez3w1/wOsibYU5NnudOGVE21nomr/tBi5fgWMYwzEqhbU?=
 =?us-ascii?Q?gpOJUtv4v1PtXUBASknCOjGtmHXdv97TVyLmIsW7i7a1OqlDZVRXfwXegzr6?=
 =?us-ascii?Q?fVnlDPWLxSMlAhiFRvJKb6txFhXLi6gqc2WZOahOZlFB22tYGsIRMejIYIVm?=
 =?us-ascii?Q?60iiMdqZi2uuzt/X6FJfX0nOaPFNnoqxBcVPJpUoKv8ERgmxmw+HLFdspvIq?=
 =?us-ascii?Q?MHbtRa+3jHHOjRQIPwjd7gQmqv9ZIMWu1tgfI8MpEvn9DpY45sX9dlE8Oa9B?=
 =?us-ascii?Q?XP7reIshV6xg2bWoG2k9zjoDfMF54oerLeC2GBf0lEvhEgWW8wywnPi3yUiH?=
 =?us-ascii?Q?FRaMZ6fX0YglikncurJm3uj2cwFK/ja+OJRa9dcj6lxjvOSqk0ivXRg/7v3x?=
 =?us-ascii?Q?/C+WHeIU+AqXF++FXTcBucCJzUgI1uWvSCoP5t1CD+y39DWx8N/DS+nvjCbQ?=
 =?us-ascii?Q?RkIqSLmzBRI+Y1OidQOggq/u3X/sfFi4Mjw9pWh7X3D+7aQEZ3+uxyALEI2U?=
 =?us-ascii?Q?taKgmlN7ZPKrHxh2tJDDB8Sw7HAoF84/iK2H9DJXNzYGfqky4vzkiiAhleNX?=
 =?us-ascii?Q?Zezos2nQrh84gwNFzhZqRFw3Hg7eWuAEdFbBZOldEW8e3qgA+COuy+DLYubC?=
 =?us-ascii?Q?577W2PhDY4V/P8h9g94uSDk1allrVpDAG8Xhfdl+nAdx7Ae7Y8wtlgyWPODh?=
 =?us-ascii?Q?KJavYfCMa3VI+syNMjKnrqsHgVFMK6Bh7m6dmn/uIp0jUjSLO4bqzmEUi4IE?=
 =?us-ascii?Q?yQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 78dc6c01-867c-4564-53e9-08dbb4a61343
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 22:09:18.5208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uKwKbLxFnxP6lt5Vb7E7W4pQt27usL7idT4/k3LsJynv9tysUa1c3A7jYD9xuujYpifh1vH4KMsDi7N3rSqS4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4575
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

On Wed, Sep 13, 2023 at 02:37:48PM -0700, Niranjana Vishwanathapura wrote:
> On Tue, Sep 12, 2023 at 04:51:59PM -0700, Matthew Brost wrote:
> > Functionality of XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE deprecate in
> > previous patch, drop from uAPI.
> 
> Probably should mention why it is being done.
> 

Will do.

> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_exec_queue.c |  7 -------
> > include/uapi/drm/xe_drm.h          | 19 ++++++-------------
> > 2 files changed, 6 insertions(+), 20 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > index ac392bcf7bc8..c0c0e799b278 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > @@ -320,12 +320,6 @@ static int exec_queue_set_preemption_timeout(struct xe_device *xe,
> > 	return q->ops->set_preempt_timeout(q, value);
> > }
> > 
> > -static int exec_queue_set_compute_mode(struct xe_device *xe, struct xe_exec_queue *q,
> > -				       u64 value, bool create)
> > -{
> > -	return 0;
> > -}
> > -
> > static int exec_queue_set_persistence(struct xe_device *xe, struct xe_exec_queue *q,
> > 				      u64 value, bool create)
> > {
> > @@ -411,7 +405,6 @@ static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
> > 	[XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY] = exec_queue_set_priority,
> > 	[XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE] = exec_queue_set_timeslice,
> > 	[XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT] = exec_queue_set_preemption_timeout,
> > -	[XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE] = exec_queue_set_compute_mode,
> > 	[XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE] = exec_queue_set_persistence,
> > 	[XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT] = exec_queue_set_job_timeout,
> > 	[XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER] = exec_queue_set_acc_trigger,
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index 00d5cb4ef85e..8b05573cecfd 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -707,21 +707,14 @@ struct drm_xe_exec_queue_set_property {
> > 	/** @exec_queue_id: Exec queue ID */
> > 	__u32 exec_queue_id;
> > 
> > -#define XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY			0
> > +#define XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
> > #define XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
> > #define XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT	2
> > -	/*
> > -	 * Long running or ULLS engine mode. DMA fences not allowed in this
> > -	 * mode. Must match the value of DRM_XE_VM_CREATE_COMPUTE_MODE, serves
> > -	 * as a sanity check the UMD knows what it is doing. Can only be set at
> > -	 * engine create time.
> > -	 */
> > -#define XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE		3
> > -#define XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE		4
> > -#define XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT		5
> > -#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		6
> > -#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		7
> > -#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY		8
> > +#define XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE		3
> > +#define XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT		4
> > +#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		5
> > +#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		6
> > +#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY	7
> 
> I know the driver is not in upstream kernel yet, but wondering
> whether we should add some kind of abi versioning here until then?
> 

This is going upstream fairly soon, not sure this is worth the effort.

Matt

> Niranjana
> 
> > 	/** @property: property to set */
> > 	__u32 property;
> > 
> > -- 
> > 2.34.1
> > 

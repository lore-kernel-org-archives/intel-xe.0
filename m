Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4936AEE49B4
	for <intel-xe@archiver.kernel.org>; Wed, 23 Aug 2023 11:51:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3B4710E410;
	Wed, 23 Aug 2023 11:51:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCE8A10E41D
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Aug 2023 11:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692791472; x=1724327472;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Z5lpCM1VOnu3O9iybN9XKsYp1qpTEFWiHXq8r17IqFg=;
 b=NtTktYa7UTza95dL7qH/0glqJaUu/ekY6lhBjBbbIU3n/BCCv1DxY81A
 1K6dFwTIhZ0w8mjIgaVuVDvNzi0G/kVJTJaE5u+s8eCdC/PNcomNO9yk9
 PBHkDj/AT9hswk3cZk7Rjw1NEftiTW4lSI6FetLHWqqTELd6oMviAICDK
 kySaAYB/X29BlOqKWsT65ILfwxMWPeMLglgoo0uvUa4++l/DsPEtzDjqu
 XGN1FQTGuddcfgZI+wqfSkjdxPZvwqGuAvz8HsYKJ5rW8kCppetmfPU9u
 BP7YKvBa+2VeuH4pK529FcoEZNgV7WBxr8yCnEOkoCeLnPYG42VZRvPgi Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="359125159"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="359125159"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 04:51:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="771696529"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="771696529"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP; 23 Aug 2023 04:51:12 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 23 Aug 2023 04:51:12 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 23 Aug 2023 04:51:11 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 23 Aug 2023 04:51:11 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 23 Aug 2023 04:51:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HkCdY8n5R70PV/vqPEv353DDQxdzHX4xSHeLWdlxAg2blGhUOPuUtiHbAYn1uNSk/KAuLlWe36EoBosk1INHTOIUN3ocd6Pasct1fVroxTIjWd4s7/YOud0Ke32knIbq+FySlyp+3+VInR5fhAB4ksCjQ1HW9BL9Y92D+RlXnsqK6qySpItGB3VG7CUcyYJpY8Cc41R59AXlrQhTz/xGPn3B6anF61eksUGZr//1/eU9/m1oDBqHfDsIuLNd6XiZB/+52CvPJ8OEoHX9VT2xd7v1a+Ah/UOrpJ+1xkOt67mf3wIDCSHNNC42BrZ9dC2B4SYqpM8aPwMzZgx3zBFxxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+a6W6NVR63/SihdQvrta6cC/18K+RiJKMKTrVseaH6A=;
 b=GWbX7TB4TOmKX/4KKLKqKTjIcSrWT9R9KRrFsaIh5gZjZBxUJLNwY8l64LWU42wdwK7DYuFIA/+Omo1uIPHYuVmFkgrGfxMYIvYb/HgTS2/9h2ElCY5GMknUGUyPoy7aJK6dF24zzaDS19KRc7mQHNNQybOfkOd/Ziil0JPFNdHM4ytZGfcqFUHeV1cE4iguRQMYtALaM/+1B/YTM6HIr+hHx07MJRUWb508488tFE/K4E1t86HKVmiLys5voTwTDH7F4qMQoDPdFUD8Hj7ThUr7xUdroS4RgJlWJEKeZ9aysDQyI06ZUXqCdy6dDJI/qyNZdJqRI3eUL/zDJTBozQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by DM4PR11MB7759.namprd11.prod.outlook.com (2603:10b6:8:101::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Wed, 23 Aug
 2023 11:51:09 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::f7ed:4327:5d1a:b8fc]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::f7ed:4327:5d1a:b8fc%4]) with mapi id 15.20.6699.022; Wed, 23 Aug 2023
 11:51:08 +0000
Date: Wed, 23 Aug 2023 04:51:06 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZOXyquFbajaRezmA@nvishwa1-DESK>
References: <20230817110352.7601-1-niranjana.vishwanathapura@intel.com>
 <20230817110352.7601-4-niranjana.vishwanathapura@intel.com>
 <20230817162906.GD3375865@mdroper-desk1.amr.corp.intel.com>
 <ZN9rFgXcrSzEUD21@nvishwa1-DESK>
 <20230818204330.GB986140@mdroper-desk1.amr.corp.intel.com>
 <5zjvepws4itjiyfr3dnprnz45cbhuo2jczbe4ekwdjqvc74ael@w3ohh7o6baf6>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <5zjvepws4itjiyfr3dnprnz45cbhuo2jczbe4ekwdjqvc74ael@w3ohh7o6baf6>
X-ClientProxiedBy: SJ0PR05CA0151.namprd05.prod.outlook.com
 (2603:10b6:a03:339::6) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|DM4PR11MB7759:EE_
X-MS-Office365-Filtering-Correlation-Id: 3109c713-29c5-4d95-583e-08dba3cf3d6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2A9BFpTpYEXUR+IILnswp3Vt3T2UO1h/9NvCCqK2iEucVgjBrnNivlKeq+a2HCdCQ8vsgbc0KQRtXJzcrFDIFql/P8TNid4kszoEyTDoSD8PO1ZPqx5PWhfvWTekiVYV83/R+7ycfDXtpvSBsB5Ml1OndELblAD8gYwGmHytM0pIkDNRvZYe3vfSxpmYrpa5s+TmhUY0DxpHaTWhnGQ8X8XaoC7Q3Y9vZsm5OW0+kdOu/312v04N8KEs2fvY7yoqLQwO4inhywKMQ0cwpoMIkLCHA6Bu5JKmBF0tG7vPeJYnNSxh0G1zdvWov7ajs8o1CnB1SMf9Ef7K6X0QxzL8SddBC0qRHP8V/9bF2LewGbe1ue82ZaL3OeoJrltDrr96cjICiNwLHU+Fe7eeOM88I4yQts918VTjaZzFvp+GwHRt4b9jJPcMJrLA2LG+wyX3WjTUlh8TN6RBvrKHEibuNuKjU9EBDjgZ4jJTrdbgSIoIWZ72HCdNJaQ/GZROFppq8laUl3RTP7m5UKmBONE4737dTz+nYuJHi6WZDSAJNgY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(366004)(396003)(346002)(136003)(39860400002)(451199024)(186009)(1800799009)(33716001)(86362001)(478600001)(8936002)(8676002)(82960400001)(38100700002)(4326008)(2906002)(26005)(6862004)(83380400001)(6512007)(44832011)(9686003)(5660300002)(6506007)(66476007)(6636002)(66946007)(316002)(6486002)(66556008)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qes7aMBhu0aE9EdAXDds1nyeJ+fuHpPmuZhtq8b0wSgJM0As0YEVvOamzJSi?=
 =?us-ascii?Q?M62b+iDIWUGfxU6v3ZIZIwnTCGZSmclif3fk8yPomY1on8BzO8hrPLQJw79r?=
 =?us-ascii?Q?6axPqEYkKBkEd7bqDkr/u69G9gnrq9sPL+kq5A6SySV3JosYm4upOXsYRUwx?=
 =?us-ascii?Q?ijCY9Ix9OaLbdasji5dzvVD4WPahXxWR0Gh4RlZbXb62wK39y+FA5wkhxAb4?=
 =?us-ascii?Q?tN1IDo1lx414rtvL6SVfbp8AAtEx4X6xM3aMO7OnOV+ebcX3twdRyKVRx2R/?=
 =?us-ascii?Q?c3/umsY1IYVKE3Bo73kByGKlL1BHKtzwT+OF+tMA3/NexcqHzRTYcbVTVGa+?=
 =?us-ascii?Q?CQafYmit9DBL5DWOKLToKvPVa/R4CLCYAiasm4TBJEBYNnRMq6QrSC2xhszl?=
 =?us-ascii?Q?d+ArWAGmcT6Qp98LcL8P8nKbqwn/lMFrSM0iNfxmBkpVEcxotg33hahXKvn7?=
 =?us-ascii?Q?JrbxpogcmXVwOxQu2mhTjLL9wOyZJpSfPE1y9IqazEdmB85M+1kfpUNjq9Hj?=
 =?us-ascii?Q?6O9fI2KzAHI4RavpHIUXRJfmZu5pmW8Dn249RcM3tH5jV96XHUuNEz17jWHU?=
 =?us-ascii?Q?lBRIm8UGxczlTqN4ZLkFMMaZqzqowMI3qMYR4bbRp5G3j4aNg2CCJ0xJbQQf?=
 =?us-ascii?Q?c3XSCy5FcLMpPB44cmmJrjrYRr0O0Z47o41tOqdQga7Ikd3clBbfu7cOOM1t?=
 =?us-ascii?Q?ScISAjMq68nLrfr/PHJAquH3XC0Cos7iHGbr3P+zYKj2qkt3aw/VGBZZUs/G?=
 =?us-ascii?Q?Oot8m4n8E4LqEokxllvXqHJzuPm9ZfP8/eZlmHBSJ3SNOuKDZyloitMkdMAa?=
 =?us-ascii?Q?izLj6uRELmhdSdfFGFIFJQedaRbjAH+6T1t3PEVofgnSXJXsgziF1wzAGKGQ?=
 =?us-ascii?Q?cHdQXKDuV6cBYnrv0UVBiH2f/2kK5rCJdN1YFtBHu9vjRbJmtlJepgSlYJGx?=
 =?us-ascii?Q?zGnBjRg2qfp0ZRWOagfqBhzFRVDl0NTWjrPCfSaKzxHDU5N2zQHfV0o+iR+F?=
 =?us-ascii?Q?g6mMH+QIib3IBPgiCpzYH9kkWfy/tzXL+dHuYrkYCyx9BiZuwl38P29l6/bv?=
 =?us-ascii?Q?5KAUTgYGyC0j7nMuvONxIYH9DsPaHSxCXd7VJXfZl7KsChPrrWzQ2lwJWanl?=
 =?us-ascii?Q?/qp5sVoDDNuDpb38RCn9psGoFxiIDe1//81Mem7ANUCrY533gapON5of/9lu?=
 =?us-ascii?Q?TIITq2D33XkZGFVO7BpSTi/QLauS3oTLNc+aGuDRgW8sgjgVKCF96z8RuoyL?=
 =?us-ascii?Q?rCLjWoquvA6EwQE9G8bRL3eBH1gzx/R10LF3SXTeO9xOkJ0jH8QoCbjMjBJt?=
 =?us-ascii?Q?rH+lUI4fHHdIoaGHXcCXE4dOb67uczwwTCLMe3RnCnJ7p5Wwg/dPw3JEguic?=
 =?us-ascii?Q?uBbFGpDOfY6KEfDC7cQDBMD77rv0uzNbuAXmVRPjXpNM6OuOMb7hQIF/HZSN?=
 =?us-ascii?Q?3XGeAoIUrMi3LcHCx5kiJH8ueOv19vkOMH7EvwQe7SZTZtMTlq/1ybv0CweH?=
 =?us-ascii?Q?NHe9sxAR9wTgsLzeaXwNaeBYku9yEwO1j+nL11VJHY2r6nYMjxqBqio+x9sS?=
 =?us-ascii?Q?m9kClNJdjxM25uL5DMntc9L97DE7shqhsDp1NpcmB7ULXlAtAx+zeshe0TJQ?=
 =?us-ascii?Q?iOcFROWZWeWQAYDylTfzprg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3109c713-29c5-4d95-583e-08dba3cf3d6f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 11:51:08.8710 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Sx4wkLoFlE+Vg2oH0X7ldOnK7ldiJL1N0It5m3y8HJB7iILpSu4jdwuCNJNwO+v3u3g18HLdiovFdfW8y54WyVvZFMUXWY1NkdFFLYREYR1DKlU1kteswNTRbQ5/sfx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7759
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 3/3] drm/xe/pvc: Use fast copy engines as
 migrate engine on PVC
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Aug 22, 2023 at 08:08:40AM -0700, Lucas De Marchi wrote:
>On Fri, Aug 18, 2023 at 01:43:30PM -0700, Matt Roper wrote:
>>On Fri, Aug 18, 2023 at 05:59:02AM -0700, Niranjana Vishwanathapura wrote:
>>>On Thu, Aug 17, 2023 at 09:29:06AM -0700, Matt Roper wrote:
>>>> On Thu, Aug 17, 2023 at 04:03:52AM -0700, Niranjana Vishwanathapura wrote:
>>>> > Some copy hardware engine instances are faster than others on PVC.
>>>> > Use a virtual engine of these plus the reserved instance for the migrate
>>>> > engine on PVC. The idea being if a fast instance is available it will be
>>>> > used and the throughput of kernel copies, clears, and pagefault
>>>> > servicing will be higher.
>>>> >
>>>> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>> > Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>>> > ---
>>>> >  drivers/gpu/drm/xe/xe_hw_engine.c | 31 +++++++++++++++++++++++++++++++
>>>> >  drivers/gpu/drm/xe/xe_hw_engine.h |  1 +
>>>> >  drivers/gpu/drm/xe/xe_migrate.c   |  7 ++++---
>>>> >  3 files changed, 36 insertions(+), 3 deletions(-)
>>>> >
>>>> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>>>> > index 4c812d04e182..00329efbd968 100644
>>>> > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>>>> > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>>>> > @@ -791,3 +791,34 @@ bool xe_hw_engine_is_reserved(struct xe_hw_engine *hwe)
>>>> >  	return xe->info.supports_usm && hwe->class == XE_ENGINE_CLASS_COPY &&
>>>> >  		hwe->instance == gt->usm.reserved_bcs_instance;
>>>> >  }
>>>> > +
>>>> > +/**
>>>> > + * xe_hw_engine_migrate_logical_mask - Return logical mask for migrate engine.
>>>> > + * @gt: gt instance
>>>> > + *
>>>> > + * On PVC, due to workaround 16017236439, odd instance hardware copy engines
>
>s/On PVC, d/D/
>
>>>> > + * are faster than even instance ones.
>>>> > + * This function returns the mask involving all faster copy engines and the
>>>> > + * reserved copy engine to be used as logical mask for migrate engine.
>>>> > + * Including the reserved copy engine is required to avoid deadlocks due to
>>>> > + * migrate jobs servicing the faults gets stuck behind the job that faulted.
>>>> > + */
>>>> > +u32 xe_hw_engine_migrate_logical_mask(struct xe_gt *gt)
>>>> > +{
>>>> > +	struct xe_device *xe = gt_to_xe(gt);
>>>> > +	u32 logical_mask = 0;
>>>> > +	struct xe_hw_engine *hwe;
>>>> > +	enum xe_hw_engine_id id;
>>>> > +
>>>> > +	/* Only support this function on PVC for now */
>>>> > +	if (XE_WARN_ON(xe->info.platform != XE_PVC))
>>>>
>>>> Here you warn if the platform isn't PVC...
>>>>
>>>> > +		return 0;
>>>> > +
>>>> > +	for_each_hw_engine(hwe, gt, id) {
>>>> > +		if (hwe->class == XE_ENGINE_CLASS_COPY &&
>>>> > +		    (hwe->instance & 1 || xe_gt_is_usm_hwe(gt, hwe)))
>>>> > +			logical_mask |= BIT(hwe->logical_instance);
>>>> > +	}
>>>> > +
>>>> > +	return logical_mask;
>>>> > +}
>>>> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
>>>> > index 71968ee2f600..edee71e26c57 100644
>>>> > --- a/drivers/gpu/drm/xe/xe_hw_engine.h
>>>> > +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
>>>> > @@ -52,6 +52,7 @@ void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec);
>>>> >  void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe);
>>>> >  u32 xe_hw_engine_mask_per_class(struct xe_gt *gt,
>>>> >  				enum xe_engine_class engine_class);
>>>> > +u32 xe_hw_engine_migrate_logical_mask(struct xe_gt *gt);
>>>> >
>>>> >  struct xe_hw_engine_snapshot *
>>>> >  xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe);
>>>> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>>>> > index 956a96b38346..cb9a82d13089 100644
>>>> > --- a/drivers/gpu/drm/xe/xe_migrate.c
>>>> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
>>>> > @@ -338,11 +338,12 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
>>>> >  							   XE_ENGINE_CLASS_COPY,
>>>> >  							   primary_gt->usm.reserved_bcs_instance,
>>>> >  							   false);
>>>> > -		if (!hwe)
>>>> > +		u32 logical_mask = xe_hw_engine_migrate_logical_mask(primary_gt);
>>>>
>>>> ...but here you call the function unconditionally on all platforms...
>>>>
>>>> > +
>>>> > +		if (!hwe || !logical_mask)
>>>> >  			return ERR_PTR(-EINVAL);
>>>> >
>>>>
>>>> ...and here we fail out if logical mask isn't set (which is will never
>>>> be on non-PVC).
>>>>
>>>
>>>This patch was derived from the below earlier work.
>>>https://patchwork.freedesktop.org/patch/528460/?series=115575&rev=2
>>>
>>>It was discussed there.
>>>
>>>We should be fine here as currently only PVC Platforms call this
>>>xe_hw_engine_migrate_logical_mask() function. The reason for having a
>>>warning there is to detect any issue while supporting any future platforms
>>>so that we fix that immediately.
>>
>>xe_hw_engine_migrate_logical_mask is called on any platform with
>>supports_usm, right?  I guess that's just PVC at the moment, but we
>>already have LNL patches pending on the mailing list which I expect to
>>eventually start setting that bit as well.  I guess we'll have to make
>>sure we remember to come back here and make some adjustments once a bit
>>of that code starts landing.
>>
>>>
>>>> I think you probably want an OOB workaround for some of this logic (see
>>>> xe_wa_oob.rules); then you can do something like
>>>>
>>>>        if (XE_WA(gt, 16017236439))
>>>>
>>>> to guard any code that should only be executed on platforms where this
>>>> workaround applies.
>>>>
>>>
>>>Hmm...the previous patch in the series adds this WA (16017236439) as a
>>>engine_was (to be moved to lrc_was). I would like to keep that as that
>>>does the register update nicely (instead of adding additional code for
>>>that).
>>>
>>>If at all we need, we need to check here whether that engine/lrc WA is
>>>active. But as you mentioned, XE_WA() only works for OOB WAs.
>>>We could add a duplicate OOB WA here (with same number 16017236439).
>>>But not sure if that is a good idea.
>>>Or, we can add a function to check if a engine/lrc WA is active by
>>>doing the name comparision (instead of XE_WA()). Third option is to
>>>support generating WA index numbering for engine/lrc WAs also (similar
>>>to OOB), so that we can use some macro similar to XE_WA().
>>
>>+cc Lucas for his thoughts.
>
>For now, just adding the workaround to oob with the same number should
>be good enough and that should take care of the other question about
>warning for !pvc too.
>
>>
>>Maybe longer term what we want is another RTP matching rule that behaves
>>as "match platform/stepping according to a specific OOB WA."  That way
>>workarounds that have both simple register programming (in lrcs_was[]
>>and such) and additional out-of-band logic can be handled in a
>>consistent way and the platform/IP matching managed in just a single
>>place.  We could accomplish the same kind of thing with an RTP "FUNC()"
>>rule and a wrapper function today, but it would be nice to avoid the
>>need to manually create a wrapper when adding new workarounds.
>
>
>yeah, that sounds good and not terribly complicated. I will add that to
>my todo list.
>
>>
>>>
>>>What do you suggest?
>>>I think we can leave the code as is for now as it gets called only
>>>for PVC.
>>
>>Since Lucas is handling the LNL enablement, I'll let him decide whether
>>he's okay leaving this as-is for now (and we'll come back and make some
>>adjustments once more of the LNL and Xe2 patches have landed) or whether
>>he'd rather see some adjustments right now.
>
>Let's use the suggested check:
>
>        if (XE_WA(gt, 16017236439))
>

Thnaks Lucas,
I noticed that OOB WA is of XE_RTP_PROCESS_TYPE_GT type and not
XE_RTP_PROCESS_TYPE_ENGINE (which the added lrc_wa is).
So, for OOB WA, we can't specify ENGINE rules. Hence we can't make
the same rule apply for both WAs here.

But for now, I don't need engine specific rules for OOB WA.
I have just set the rule to be PVC platform and posted revised
patch series.

Thanks,
Niranjana

>Lucas De Marchi
>
>>
>>
>>Matt
>>
>>>
>>>Niranjana
>>>
>>>>
>>>> Matt
>>>>
>>>> > -		m->q = xe_exec_queue_create(xe, vm,
>>>> > -					    BIT(hwe->logical_instance), 1,
>>>> > +		m->q = xe_exec_queue_create(xe, vm, logical_mask, 1,
>>>> >  					    hwe, EXEC_QUEUE_FLAG_KERNEL);
>>>> >  	} else {
>>>> >  		m->q = xe_exec_queue_create_class(xe, primary_gt, vm,
>>>> > --
>>>> > 2.21.0.rc0.32.g243a4c7e27
>>>> >
>>>>
>>>> --
>>>> Matt Roper
>>>> Graphics Software Engineer
>>>> Linux GPU Platform Enablement
>>>> Intel Corporation
>>
>>-- 
>>Matt Roper
>>Graphics Software Engineer
>>Linux GPU Platform Enablement
>>Intel Corporation

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 084B1C4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 23:19:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB99C10E7A4;
	Wed,  6 Dec 2023 23:19:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE4E810E7A4
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 23:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701904788; x=1733440788;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=a38w3dPWKOBR+fNJml7cHPro4OJgobgoKMOszGA7mHY=;
 b=ifHHzZrjnwwDGO6J15WSHYsA+P1/n1algy7Lms4XssLfCJetYYfxpqZh
 DxlMTU45Q6mOxnC7hIqiElWHVGjXnGDygmC2GpMuBRGguPf14E8orTSIL
 a/IJ4q769ceNY5Dm7tE6ldLTjjQJ+NC57x45WfTOgsJyeApdX8UseZt64
 0kB1fI6c+MXQBPYFOoJUI/uGu7mKzJPdKnqxTQAeoX5PuCmd/oT9xZhkX
 WB8XSe6QAj9rDmqd02a72nU4qK2kX2Gl3/5FS+v+4D172i6qnP2nW/U1T
 nPod8bx7qQfKdDEPZrHi9wmsB56HdnuJIa2eCyVt1WkS/aqQBgfaW408T w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="391312867"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="391312867"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 15:19:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="721246107"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="721246107"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2023 15:19:47 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 15:19:47 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 15:19:46 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Dec 2023 15:19:46 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Dec 2023 15:19:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lN2N1ShVlqWO/ls5mnUMKX2s7tLsPCf1/BpZRTWh3t8CnvEawJkBzLa8SXt35ool4oyU4kNfh77TM/vKoppdXt0gWdpQTqsbor96hEImIk5b7oJu9Ppezpso3nIqa7olINrYL4AjAzxlPp/7Cf2i7c313gjRNaywT4Mjr5AcZhix2q375N16etUEK7uCCk6LzpxA0jkKvrEQHcfmH1pah+D7eV7voPOKbekplldujIe1Y5yXCf+RsUE2CPz5Flgk3ed9aIZc+8ivfmL024dPxYofcmL/zoSJ5llatAENDBIkarAgv6+rQS+7T0cdszUEloNwjzKSYsn/JpkrW/FAAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wu4vsOanY3csBty+8VaN1enGIx4G4HwwR+wObqMxpTM=;
 b=X4AWIAh6Pv5BwAXTRd0YvBf43UDGMH5iPhZvJTQMT5LYDenu49W14xbLEpHbsn2+uloeQZuojJFypeUP5+Dj0ILD0qxpmjIcorlv4HwlLyrga6pU/Ut3dNQSE4fmVmaU2q/9Ucx+M3cR8H+1ef68ilQqdLCVPvA4r3bUh6DbDI1yrFUizWKmAzHMvRI2YGYJ9YPsjlM4yJpTKBZw/fvBh1FRqwauLpm2OXH1mFV26y3B+/zOUy9zn6lE7b2XdVBXxFAEGgsxjUKni7mzES4hfpkjrwnR5haCXozOozZ+XQfedeDjOtGksIdfpFHQ6AZKErilqlJ8Vk9iXrYgVLT+GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL1PR11MB5980.namprd11.prod.outlook.com (2603:10b6:208:387::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Wed, 6 Dec
 2023 23:19:43 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7046.033; Wed, 6 Dec 2023
 23:19:43 +0000
Date: Wed, 6 Dec 2023 17:19:41 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <6q4wwszpvvl5wacpusm6lrrzzqccnxyefz23h5wb3bcidqg3ga@dqdnxieitt4f>
References: <20231206205034.1105637-4-matthew.d.roper@intel.com>
 <20231206205034.1105637-5-matthew.d.roper@intel.com>
 <klfcmsla75h3sxdhd6vjxsrnaej2qycu3bjizntytjyxflae7t@d7dsiab2o3e5>
 <20231206230953.GX5757@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231206230953.GX5757@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR13CA0080.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::25) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL1PR11MB5980:EE_
X-MS-Office365-Filtering-Correlation-Id: 02330773-b3df-47f2-0f3a-08dbf6b1d438
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 81AOYLBhmBDYiJIfu+H9gABXshKd/6JH60IJgw1n3wlHluDnxrWrZ/wf1sMmSkMKnoI9vMWHUtYuad6q9O2kKDyZUEJRo92Q+g6wUU+Oz2A2GqEpSM7WP7wEUIwY84xKiP5JOIWsuT01j2pR3i4terUGFWhYv9ZufeghJqJPLE8x23J6Co9KxxklRUdNoDMYIwVQS1+mK7Nv9W2P9SV9ETyrZ0qpdfkRIW+9z4fEKg9evnPE8mf+It+fevAIr+HQvrrZK4nCT1XIvxiPFZEwrX+LpkNtiqll/FFsHvOjNl6ZDycuXKys3auw0AwW7Et3bqyFt3cdIYnDdG6Z1KtsVNEHGQHerPLudL/qKcPnTRf6Uvv5dEHx533JgaNVraWlDNea3a2x3P6SJ/3nmH5dZ77INx+SJFqc0pYDMvFrht4igHFpLIePIBj/Mbluh01JuHWhOYLNtj+k3Fi/uP51c2YIKGsdBhqe825O2Kc+5zQNwBjYAVOAt6EYMN/jVUwHQtjkb6jPyUbEobzcyT36vmpfft8e+aSRz73zBqjR1m1VuP9WwII5LIWerS1POIrh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(366004)(39860400002)(346002)(396003)(376002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(9686003)(33716001)(5660300002)(41300700001)(2906002)(86362001)(82960400001)(6486002)(66556008)(26005)(6506007)(6512007)(8936002)(66946007)(6862004)(66476007)(8676002)(478600001)(83380400001)(316002)(38100700002)(6636002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/ZGm6j6PyLjoRTLDH9bNWqGusH3YlqVqG2XIEuWHS7Jqsfy85dHXdppiSsqe?=
 =?us-ascii?Q?DyYF7kn/V2LSiT1NsHaNl3hpRwKUh8ySvy/9m+eXibbB/9CTZv+Zf3EAv4Iq?=
 =?us-ascii?Q?A7Sao6ZhZ1MpfuGwirjlpHDvD1UVtqfHl3SJ1qFkNzb23SbOBr5RkmuWFevV?=
 =?us-ascii?Q?QdIxGWMh0429bV6/Nmf6fAcxbgzWSdlBhAVmFFdo5vTSdqunkn6z2qYam56A?=
 =?us-ascii?Q?Moz9kTo93SYJAsFE1aUzRnhi3SVzygphA+ncjpqBLFuuM9KHGbs1vVerclzc?=
 =?us-ascii?Q?KrIH+Y/2eXiwANz/pQxxTWbRXEuulw++2lFyLs2hT5ynxDa+ZKxkt+af9ago?=
 =?us-ascii?Q?oOBZXJs58+exkJ3ff1xYWyObkXtbUeB6M79zfbZgUSI7Hial+vpJ/InFEtBw?=
 =?us-ascii?Q?Fw/XI3pGVVrJrdmZ9+CkGzJwjNOdLim/mSS6tD998xM3YSlwSUsWnzuyLY+I?=
 =?us-ascii?Q?FqzQJTkb0OPCaRdisn26lOrSKgMDripvKi72JhJrPBBPH73Lk5AwkXW2QFnP?=
 =?us-ascii?Q?tKqe8Xlc//HU+N/89Lh1uK0G9K3C7dUL0cRp4SrWSBevpOn+li9RLBKmxI5V?=
 =?us-ascii?Q?N4lZO5lh/nRjfihFQ42YAI1q8nF+sb++2VWY3lXYQBO/yBDLXNj7nWuPMlBB?=
 =?us-ascii?Q?L8A+abvI+AARPEf6ps7LBAL97o1wMLykHPdNkb7rJ5FMxFRqDuSovfsJxoH2?=
 =?us-ascii?Q?syvU4SAuVhHHFTVOVsixpMnujDEHbIrQJMWLVmWovjwbZvzlGSdW4++/yRc6?=
 =?us-ascii?Q?D6TasWqTb6QlYRGrV+qIPRSrQXJ/nZX7+2lBqBj4BpGNcXXziscM9k07aX5N?=
 =?us-ascii?Q?b5e0QC/bsD5z55uHCP3naD73yEC2g2miIykhR1wOiwJXtlhLa1ySpW3shZ3I?=
 =?us-ascii?Q?nkR4xBuQyCicaVmg41TA2dcpJkfX94WpBzeg5Pn4bHg8ZfovgEc8JD32KA60?=
 =?us-ascii?Q?HTCdAZyvAot/MVMgdNJ71v9E995NlXQKU0qs+t9FyXN9DUQKZFxM1CPV9j9V?=
 =?us-ascii?Q?jiOpPhfscuwnHVOatn+KJ7tjNK6fbUYh5Rdc5g/8VUfvh2T5RCG/tCs43D/0?=
 =?us-ascii?Q?1vEKZ2lpADo0fkNel1WHRJxi+S1iuQ0nBPy5WiKRfMCRL9L+ZR7Kfx+scnwn?=
 =?us-ascii?Q?MLpLbQVOiL9pRcX4vjCrb+DtWzJW8t93VHQ3QyCneJKueDv2erqyzJ99YIAz?=
 =?us-ascii?Q?lyR83TCWxocA1EHgZdV7r39ZUsweMIEIFFRSC+nNrXfx1gpc8t6M3PkL93KD?=
 =?us-ascii?Q?NE95hS5UoKXCFqtq01BbYUMWtaEsb8BNtUQeYT+uV7vOieFzWsfQ0AB/3TaG?=
 =?us-ascii?Q?N1DkGPHuEfHds6yVw0p9yBnUPfmjFaH5AReLY4Y1+wB4aOPvLO+/SJ43/OFH?=
 =?us-ascii?Q?sU5MJhF5Yn7THjJJacOSfylW84y/g6mQ5vUZ+mkVyuHsMYswjo5z7EonJsJi?=
 =?us-ascii?Q?oIhkpbEKKCTM9UVyMMGk0/5oBBaqn1tYZq6L02Cu9Dqp6Op2KzXHFKRzgJ3D?=
 =?us-ascii?Q?ZKa5cpHqTHvwqH6aTf0BJlGOBlbKip91BKSAX2A5hUVT85cvp1UNuSEhKbbh?=
 =?us-ascii?Q?hqJyvLLi2PKsJFqDXsoQoQYTS1sO5BZhWW6nVg+4m6FyMDH4cDVLPH7awpZT?=
 =?us-ascii?Q?ig=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 02330773-b3df-47f2-0f3a-08dbf6b1d438
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 23:19:43.5206 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xdKBlqa1gGTl1FqLwTj6Cy82et1Ry3O6kqq5nxSWjjZckDFxSDGcTDowpR4grq7AJ7Gu/Xg53kLaqLE3lVj2LEAycR4kUlnrrAnrCK/V7P0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5980
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Stash GMD_ID value in xe_gt
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

On Wed, Dec 06, 2023 at 03:09:53PM -0800, Matt Roper wrote:
>On Wed, Dec 06, 2023 at 04:55:10PM -0600, Lucas De Marchi wrote:
>> On Wed, Dec 06, 2023 at 12:50:36PM -0800, Matt Roper wrote:
>> > Although we've stored the major and minor versions for graphics/media in
>> > xe_device, it will be simpler to implement the uapi version query if we
>> > also stash the raw register value in the GT itself.
>> >
>> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>> > ---
>> > drivers/gpu/drm/xe/xe_gt.c       | 6 ++++++
>> > drivers/gpu/drm/xe/xe_gt_types.h | 2 ++
>> > 2 files changed, 8 insertions(+)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> > index 154d6c7072b9..c6f7885ffdc0 100644
>> > --- a/drivers/gpu/drm/xe/xe_gt.c
>> > +++ b/drivers/gpu/drm/xe/xe_gt.c
>> > @@ -381,6 +381,12 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>> > 	/* Initialize CCS mode sysfs after early initialization of HW engines */
>> > 	xe_gt_ccs_mode_sysfs_init(gt);
>> >
>> > +	/*
>> > +	 * Stash hardware-reported version.  Since this register does not exist
>> > +	 * on pre-MTL platforms, reading it there will (correctly) return 0.
>> > +	 */
>> > +	gt->info.gmdid = xe_mmio_read32(gt, GMD_ID);
>>
>> I was coincidentally reading the PICA_DEVICE_ID for a debug (that we
>> currently don't read) and stumbled upon this.
>>
>> I'm wondering what's the correct place to read and save the GMDIDs. We
>> already read it on xe_pci.c:handle_gmdid(). Why don't we simply stash it
>> there? With the current design, it doesn't seem we allow 2 GTs with
>> different graphics / media version since it still on the xe side
>> initialization.
>>
>> So, why don't we just stash it on xe rather than GT?
>
>I mainly did it this way because it makes the actual uapi change a bit
>simpler to actually keep this in the GT itself.  Plus it's a bit more
>future-proof in case we ever do start allowing multiple GTs of the same

I don't disagree with the uapi. We can keep the uapi gt-based.... just
wondering if we need to keep the read on the gt initialization, because
if we allow GTs of the same type with different versions, we'd already
have quite a lot to change in xe_pci.c

>type with different versions, or if we ever add new types of GTs beyond
>just primary/media.

on the other hand, we have 2 other GMDIDs that could be useful, but
aren't tied to the GT:  Display and PICA. I'm mainly concerned about
PICA for now since I'd like to print it for debug. Should I tie it to
the device while graphics and media remain on the respective GT ?

Lucas De Marchi

>
>
>Matt
>
>>
>> Lucas De Marchi
>>
>> > +
>> > 	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>> > 	XE_WARN_ON(err);
>> > 	xe_device_mem_access_put(gt_to_xe(gt));
>> > diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>> > index 4e48c4643163..4e7a4494a554 100644
>> > --- a/drivers/gpu/drm/xe/xe_gt_types.h
>> > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>> > @@ -117,6 +117,8 @@ struct xe_gt {
>> > 		 * hwconfig blob.
>> > 		 */
>> > 		u64 __engine_mask;
>> > +		/** @gmdid: raw GMD_ID value from hardware */
>> > +		u32 gmdid;
>> > 	} info;
>> >
>> > 	/**
>> > --
>> > 2.43.0
>> >
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation

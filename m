Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF75C4332F
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 18:40:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E845489070;
	Thu,  9 Nov 2023 18:40:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F3E910E912
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 18:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699555231; x=1731091231;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=npmSbSkIot6JtnNEbO4M4g/hzY09ANzbwOcXgfjkaZ8=;
 b=OjQaiUJDmMPQVbKp7BCQjt9lgvvumxVrV5rYXwDqajyrzoeCrDfvxOpu
 IdenmolZCsoz9NGkqW6HC00Pjq6cf+4C2gu7BN5RQoQWcn7V9RNbllZA4
 dopAFqAHprvwFHubS86OTzl75YzhzI/jpgfvVklHvOdVuxNN5NJgWv6BS
 09hXNOYaLcqzEOUQPFOYXyYII+sKUOr2nTOt4pT/E8ElfAcVIqzuG3Hou
 tx7fW9czPvVjqsO5hkaFgmaMnv8qrLA0fpqGBY57iyGwmqUbaRVe0Zcz1
 5a2ocKMNvk9JKV0zzlE3YGVULY2xAWzVhii8Nag0uPgvokRoIsTXPfbCt Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="3031575"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="3031575"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 10:40:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="829413473"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; d="scan'208";a="829413473"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Nov 2023 10:40:29 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 10:40:29 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 10:40:28 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 9 Nov 2023 10:40:28 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 9 Nov 2023 10:40:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KiindjVJ5IHoDypPYie5Uk0XSBAa5zRiR50dbpTtKwvn/Tn3dwtMMMR6+cxZVIhbZrt1yYb9dUtFirMykW0oUGypWD2SR2HsXqpoHPKIwy28y9umfqiHs6sXrouUsf4f4BGiGiOHUmov2Ro3VfYX+9UxXZhpS3IkM8Bew0Kgd6L7AOzGMOHQsnnN1BFfjEVlxXyQlmbPgBZTJbf7hEqXyaNm0P8h3F3GnuFvVAhgV81+LfqFW4rpXZCd9EZsmDbsc0cOLVbbNaA1TIRVTltiubdaA0YqeN81xFeNOyzgXLfP3W4EATFkAPCK+U6GPHWa/O3dWedlBEy6OgaakeMlbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7HhYZHiEmLOMTFwM+9/1R/s3ob2lXxk2th5X7B5pcw8=;
 b=DSC9N0UMiO4bqKieAkQ5PxbdEeWVI7N6ElVs9PZnHctZS80QChsPKEmOjY9lrQ2+1nC5RrdTHZSdFjqklBgBayEAgOs7taQ2a64DD3f9NAawT9vSiN4lxW4imVI+IayPFbrPG9E6H343sZalEGK3f6qM6Fcy6I+TCBhJ1nvoDE6e7LhprVgRXcMM4xPSsT8eiT1N3tFTDT38WGGBY0Y5nMt1NjT3jAHl2xZ7pHT0+9TDyADcacv0YrTnVjKmyrtQKJax7GOtJa4v8SFXRvKjNdOzrUGEcmgatj49L8j/0XoyznuVQAG604PWJAZxTjDWYaM7NNb3dXtkP7NZiyROUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Thu, 9 Nov
 2023 18:40:26 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.6977.018; Thu, 9 Nov 2023
 18:40:25 +0000
Date: Thu, 9 Nov 2023 13:40:17 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Message-ID: <ZU0nkf1t4bj9oWdq@intel.com>
References: <20231103143456.7-1-francois.dugast@intel.com>
 <20231103143456.7-39-francois.dugast@intel.com>
 <4fbb3d95917c206fc8aee356bc84b4197f9fba21.camel@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4fbb3d95917c206fc8aee356bc84b4197f9fba21.camel@intel.com>
X-ClientProxiedBy: MW4PR03CA0334.namprd03.prod.outlook.com
 (2603:10b6:303:dc::9) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH0PR11MB5690:EE_
X-MS-Office365-Filtering-Correlation-Id: e23cbe95-6ff8-49ba-1bb9-08dbe1535689
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d2QUFk7JEESmJJ1sqwoj14S6WTIhy8Z0Geu5nIJ7sEcPQdH/EL8DbyagEG1Wsg1YKwHgFX9XgaJGkd+wU/BaQwlEb9V8B7MXVv5xkSs23PWYNht4wVQqinlR7eiF3n5fqP0nwaK6w4QJ/5FtJo/6q+dZJnXHHqRFLXxFB7fmTPwEoFLiBlfWEMmAZfJN6n2JJjGTqIkGUt3XzNuzmuAZl6XKYwa0x5BEMYOSnw1LTsMOyuKnP5wLQzs/j87+7nFLlTagdfNbthJ01SUYygHzSO+rVAaHv5W2nfIir1jM0H262RbsIj3Jh0IhyhPv/Fc3cyYpj9uUe+CrBt7MVRMmvAlIMPRe9GrzrznfdI8LffN3YNtCOzHg6PuDmubFH7CpTUruLJxOW6V3RowsEO1kdUocKOtKgpZkPJTZrxmlHxP6A8L+wznqrI2iOz7ykjREY6RIvLWihN2CjWaS4Avlf91wF9D7srMN3w4yIhvFcHbx4PQkZd3pUc0ZggHTKqiLqEkBxHyhwBKmUio+xypczmEBPuE6F/7AD3F0pFCsrjkIQzZU3RkGnsikOM7x6wi5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(346002)(136003)(39860400002)(376002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(83380400001)(6666004)(6506007)(2616005)(107886003)(82960400001)(6512007)(26005)(6486002)(478600001)(38100700002)(8936002)(66946007)(37006003)(8676002)(316002)(66556008)(66476007)(54906003)(6636002)(44832011)(4326008)(5660300002)(86362001)(30864003)(2906002)(6862004)(41300700001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hoAbpRyzklz90KxFKdkaL8WVwT6qpW8Ub8r3j/1a2igUDu9wtGkvCd3VOiL5?=
 =?us-ascii?Q?iW0z8+nK09Kges05z317tGfN7EIpAHzuqVT+lIz0tuaVYjYan2LYAnFSTVdy?=
 =?us-ascii?Q?eB+MbYxJqp5w9s7vEjI69j0ek6sK8hEeR7+7gNlh93IKp+sVcL/2q3KjcYDW?=
 =?us-ascii?Q?IDqkspT0mv/J77f2CAuLMBW62R8eECu9KKzYjYTKP/5HQoEPkVWTGeiKQVJ0?=
 =?us-ascii?Q?AWz4yvK4ICLhaJQV2kiudPF7MO3mRrvqa6fRT6TkN7P4XhFxzwSYDXoNa5vJ?=
 =?us-ascii?Q?v8ACBA0bo4jP6r6IFT9+ixE+1bMDNh66WUGsYFAayHycmPUHzngfmkgXs4gQ?=
 =?us-ascii?Q?eEvx+yamF0/nBTC7/lxm4V7nDxg2GQUsuvTMRQ7oxWEpCiCPdj3tgPIFrEfK?=
 =?us-ascii?Q?Mg+DMvr5TCndYitSAzye2UeOdZvykcN1f9vwutoAKyWKQAUpZ9r55cHlnttY?=
 =?us-ascii?Q?cluHvdCHshLDRtWk/SKCEDsI3gU0aABZlTYW6lKOrfxRG8w6ciFR9Q9DM+pD?=
 =?us-ascii?Q?5jrsmoejAfIf4mViIBDyI49UY3Ii55qv6X3JdTDV3wbzd2OrZDTPzXMorAQ9?=
 =?us-ascii?Q?t2wBtgHsoqibY7ucOO9ndmGhoGrjRZ5h9Q0FYVaW3bg6Rc3CVt4wKRLlEig4?=
 =?us-ascii?Q?CwKTBoEBTTcBq9vKMsfNwE2BudTnoaQoc73iLSsmZsDdEpWJw0JNMEnXhqeg?=
 =?us-ascii?Q?KTKbzX8Lfx5Kp4ex3YWHCwEkxlsYCp/kkOzx2HrVdwPDSyL4Oc+D0K+EqfSq?=
 =?us-ascii?Q?GojKESV4p8tg084aQdZsCJpG2Di03pNKLf+FdQnaGyui0r2eZm7Zn5NNU1rZ?=
 =?us-ascii?Q?VMFBEIzsvi2Ci7IfNNHWPlBdo1UxsDFnXaOyOwsQucUqpJxX5HfJwrAYnHpR?=
 =?us-ascii?Q?laGHSAGhUxNeiCJjMTJgPCIGwpb9nxthbyHT9wuj6wo5VN1DKj138i73zSQP?=
 =?us-ascii?Q?PVd2Xk+wXjy47xqzKmbmOc86Qe9MvdXeFBiOLG3TPgQDwhGznehGIFiAwkwq?=
 =?us-ascii?Q?sTsK4RVZoG6iqPrMWB2ekvxvnyMH1y0+IMXdiHldU2Ae7UTEkRb1iMc4bori?=
 =?us-ascii?Q?B6aCd381HZ15O+aFDpzyOLEspT7mxRBfHOLii6XzduR11lTWI/X9PLr7t/IW?=
 =?us-ascii?Q?DzGrewFromY8+Sue+dpWveG97J7FG08mfk5d3Iu/NteQ4ixnxBeym+sw+cYG?=
 =?us-ascii?Q?J8vIovmMacLAKh6Qfgtz46UqLbvAxiI+2iKdz4QTWaBUqkNQ3cMu9aHhrjSC?=
 =?us-ascii?Q?4WlZ4JhxT/2SFVIFlezmw5KREnWV/e2zBiMJOlfqjZrPSfI0vvGK90F9/yyu?=
 =?us-ascii?Q?0+mdwjYPwPSd71KjH4VD8DeCeir74Ge55mM46hepxGhvmbm5czIkL+OlZwJa?=
 =?us-ascii?Q?ssuza7eCL/WyV1dJUptrQMUGjOLYvWvT4mEdFpIBmcyhWIywrlT/WIljZI8R?=
 =?us-ascii?Q?Nzm+FOCBnacTDve/de0bfXr1LUVpCJXvgMUMqT+gziYUFjHSJEXkHLz3S3Ks?=
 =?us-ascii?Q?tmZSqEyY4RlrLPkWG/NA20qzwwhdoKzDdJX4iDV2aIYm14LFV+ZsQmf0236C?=
 =?us-ascii?Q?rf5F9cwxEMT8DE6u47M+rJP3b4pvn3XKCIqaGP23FUsx8CAVEQzojYAELAnF?=
 =?us-ascii?Q?7A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e23cbe95-6ff8-49ba-1bb9-08dbe1535689
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 18:40:25.8430 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7be5D2bIIMMA5gDb4N/Fs9OWQduM/RVbVpUD0QmPXqXYXDVSpZIKxQpOaF+eCzN3+eLl8QhoF6RmstQ4kjnMUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5690
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 38/50] drm/xe/uapi: Rename couple
 exec_queue items
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
Cc: "Dugast, Francois" <francois.dugast@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Nov 09, 2023 at 05:14:17PM +0000, Souza, Jose wrote:
> On Fri, 2023-11-03 at 14:34 +0000, Francois Dugast wrote:
> > From: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > 
> > 'Placement' is no used in many terms around the memory_region selection
> > where the BO or the page table will live. Also, the job itself deserves
> > a word of more action since it is dispatched to the engine.
> 
> num_dispositions is a bad name, placement is better in my opinion.
> it says exactly what is does, in what hw engines the batch buffers can be placed.

Please take a look to the patch 43 in this series or to the new squashed
version in the take2-v3 that Francois just sent.

[PATCH v2 43/50] squash! drm/xe/uapi: Rename couple exec_queue items

I don't like the 'placement' word exactly because it is not true that
the batch buffer is 'placed' in the engine. The batch buffer is placed
in memory and we now have 'placement' variables on memory regions.
So, double confusing.
After BB is placed in the memory, then the instruction with offset
of that placement is sent to the engines so the EUs can find that.
So, let's keep placement name in the memory and use something else
for the engine. Please take a look to the final patch and then we
continue the discussion there trying to find a better naming.

Thanks,
Rodrigo.

> 
> > 
> > 'width' is so generic and in graphics world can mean many other different
> > things. Let's be more specific here on the intent of that.
> 
> This one sounds good.
> 
> > 
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_devcoredump.c      |  8 ++--
> >  drivers/gpu/drm/xe/xe_exec.c             |  4 +-
> >  drivers/gpu/drm/xe/xe_exec_queue.c       | 49 ++++++++++++------------
> >  drivers/gpu/drm/xe/xe_exec_queue.h       |  4 +-
> >  drivers/gpu/drm/xe/xe_exec_queue_types.h |  4 +-
> >  drivers/gpu/drm/xe/xe_guc_submit.c       | 32 ++++++++--------
> >  drivers/gpu/drm/xe/xe_ring_ops.c         |  8 ++--
> >  drivers/gpu/drm/xe/xe_sched_job.c        | 10 ++---
> >  drivers/gpu/drm/xe/xe_trace.h            |  8 ++--
> >  include/uapi/drm/xe_drm.h                | 20 ++++++----
> >  10 files changed, 77 insertions(+), 70 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> > index 68abc0b195be..b4e8de4903b9 100644
> > --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> > +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> > @@ -130,7 +130,7 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
> >  	struct xe_hw_engine *hwe;
> >  	enum xe_hw_engine_id id;
> >  	u32 adj_logical_mask = q->logical_mask;
> > -	u32 width_mask = (0x1 << q->width) - 1;
> > +	u32 num_bb_per_exec_mask = (0x1 << q->num_bb_per_exec) - 1;
> >  	int i;
> >  	bool cookie;
> >  
> > @@ -138,10 +138,10 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
> >  	ss->boot_time = ktime_get_boottime();
> >  
> >  	cookie = dma_fence_begin_signalling();
> > -	for (i = 0; q->width > 1 && i < XE_HW_ENGINE_MAX_INSTANCE;) {
> > +	for (i = 0; q->num_bb_per_exec > 1 && i < XE_HW_ENGINE_MAX_INSTANCE;) {
> >  		if (adj_logical_mask & BIT(i)) {
> > -			adj_logical_mask |= width_mask << i;
> > -			i += q->width;
> > +			adj_logical_mask |= num_bb_per_exec_mask << i;
> > +			i += q->num_bb_per_exec;
> >  		} else {
> >  			++i;
> >  		}
> > diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> > index 28e84a0bbeb0..ca922635db89 100644
> > --- a/drivers/gpu/drm/xe/xe_exec.c
> > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > @@ -161,7 +161,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >  	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_VM))
> >  		return -EINVAL;
> >  
> > -	if (XE_IOCTL_DBG(xe, q->width != args->num_batch_buffer))
> > +	if (XE_IOCTL_DBG(xe, q->num_bb_per_exec != args->num_batch_buffer))
> >  		return -EINVAL;
> >  
> >  	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_BANNED)) {
> > @@ -189,7 +189,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >  
> >  	if (xe_exec_queue_is_parallel(q)) {
> >  		err = __copy_from_user(addresses, addresses_user, sizeof(u64) *
> > -				       q->width);
> > +				       q->num_bb_per_exec);
> >  		if (err) {
> >  			err = -EFAULT;
> >  			goto err_syncs;
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > index 59e8d1ed34f7..849e463c4ed8 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > @@ -33,7 +33,8 @@ enum xe_exec_queue_sched_prop {
> >  static struct xe_exec_queue *__xe_exec_queue_create(struct xe_device *xe,
> >  						    struct xe_vm *vm,
> >  						    u32 logical_mask,
> > -						    u16 width, struct xe_hw_engine *hwe,
> > +						    u16 num_bb_per_exec,
> > +						    struct xe_hw_engine *hwe,
> >  						    u32 flags)
> >  {
> >  	struct xe_exec_queue *q;
> > @@ -44,7 +45,7 @@ static struct xe_exec_queue *__xe_exec_queue_create(struct xe_device *xe,
> >  	/* only kernel queues can be permanent */
> >  	XE_WARN_ON((flags & EXEC_QUEUE_FLAG_PERMANENT) && !(flags & EXEC_QUEUE_FLAG_KERNEL));
> >  
> > -	q = kzalloc(sizeof(*q) + sizeof(struct xe_lrc) * width, GFP_KERNEL);
> > +	q = kzalloc(sizeof(*q) + sizeof(struct xe_lrc) * num_bb_per_exec, GFP_KERNEL);
> >  	if (!q)
> >  		return ERR_PTR(-ENOMEM);
> >  
> > @@ -55,7 +56,7 @@ static struct xe_exec_queue *__xe_exec_queue_create(struct xe_device *xe,
> >  	if (vm)
> >  		q->vm = xe_vm_get(vm);
> >  	q->class = hwe->class;
> > -	q->width = width;
> > +	q->num_bb_per_exec = num_bb_per_exec;
> >  	q->logical_mask = logical_mask;
> >  	q->fence_irq = &gt->fence_irq[hwe->class];
> >  	q->ring_ops = gt->ring_ops[hwe->class];
> > @@ -77,7 +78,7 @@ static struct xe_exec_queue *__xe_exec_queue_create(struct xe_device *xe,
> >  		q->bind.fence_seqno = XE_FENCE_INITIAL_SEQNO;
> >  	}
> >  
> > -	for (i = 0; i < width; ++i) {
> > +	for (i = 0; i < num_bb_per_exec; ++i) {
> >  		err = xe_lrc_init(q->lrc + i, hwe, q, vm, SZ_16K);
> >  		if (err)
> >  			goto err_lrc;
> > @@ -108,7 +109,7 @@ static struct xe_exec_queue *__xe_exec_queue_create(struct xe_device *xe,
> >  }
> >  
> >  struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *vm,
> > -					   u32 logical_mask, u16 width,
> > +					   u32 logical_mask, u16 num_bb_per_exec,
> >  					   struct xe_hw_engine *hwe, u32 flags)
> >  {
> >  	struct xe_exec_queue *q;
> > @@ -119,7 +120,7 @@ struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *v
> >  		if (err)
> >  			return ERR_PTR(err);
> >  	}
> > -	q = __xe_exec_queue_create(xe, vm, logical_mask, width, hwe, flags);
> > +	q = __xe_exec_queue_create(xe, vm, logical_mask, num_bb_per_exec, hwe, flags);
> >  	if (vm)
> >  		xe_vm_unlock(vm);
> >  
> > @@ -170,7 +171,7 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
> >  {
> >  	int i;
> >  
> > -	for (i = 0; i < q->width; ++i)
> > +	for (i = 0; i < q->num_bb_per_exec; ++i)
> >  		xe_lrc_finish(q->lrc + i);
> >  	if (q->vm)
> >  		xe_vm_put(q->vm);
> > @@ -512,15 +513,15 @@ find_hw_engine(struct xe_device *xe,
> >  
> >  static u32 bind_exec_queue_logical_mask(struct xe_device *xe, struct xe_gt *gt,
> >  					struct drm_xe_engine_class_instance *eci,
> > -					u16 width, u16 num_placements)
> > +					u16 num_bb_per_exec, u16 num_dispositions)
> >  {
> >  	struct xe_hw_engine *hwe;
> >  	enum xe_hw_engine_id id;
> >  	u32 logical_mask = 0;
> >  
> > -	if (XE_IOCTL_DBG(xe, width != 1))
> > +	if (XE_IOCTL_DBG(xe, num_bb_per_exec != 1))
> >  		return 0;
> > -	if (XE_IOCTL_DBG(xe, num_placements != 1))
> > +	if (XE_IOCTL_DBG(xe, num_dispositions != 1))
> >  		return 0;
> >  	if (XE_IOCTL_DBG(xe, eci[0].engine_instance != 0))
> >  		return 0;
> > @@ -541,9 +542,9 @@ static u32 bind_exec_queue_logical_mask(struct xe_device *xe, struct xe_gt *gt,
> >  
> >  static u32 calc_validate_logical_mask(struct xe_device *xe, struct xe_gt *gt,
> >  				      struct drm_xe_engine_class_instance *eci,
> > -				      u16 width, u16 num_placements)
> > +				      u16 num_bb_per_exec, u16 num_dispositions)
> >  {
> > -	int len = width * num_placements;
> > +	int len = num_bb_per_exec * num_dispositions;
> >  	int i, j, n;
> >  	u16 class;
> >  	u16 gt_id;
> > @@ -553,13 +554,13 @@ static u32 calc_validate_logical_mask(struct xe_device *xe, struct xe_gt *gt,
> >  			 len > 1))
> >  		return 0;
> >  
> > -	for (i = 0; i < width; ++i) {
> > +	for (i = 0; i < num_bb_per_exec; ++i) {
> >  		u32 current_mask = 0;
> >  
> > -		for (j = 0; j < num_placements; ++j) {
> > +		for (j = 0; j < num_dispositions; ++j) {
> >  			struct xe_hw_engine *hwe;
> >  
> > -			n = j * width + i;
> > +			n = j * num_bb_per_exec + i;
> >  
> >  			hwe = find_hw_engine(xe, eci[n]);
> >  			if (XE_IOCTL_DBG(xe, !hwe))
> > @@ -575,7 +576,7 @@ static u32 calc_validate_logical_mask(struct xe_device *xe, struct xe_gt *gt,
> >  			class = eci[n].engine_class;
> >  			gt_id = eci[n].gt_id;
> >  
> > -			if (width == 1 || !i)
> > +			if (num_bb_per_exec == 1 || !i)
> >  				return_mask |= BIT(eci[n].engine_instance);
> >  			current_mask |= BIT(eci[n].engine_instance);
> >  		}
> > @@ -612,7 +613,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
> >  	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> >  		return -EINVAL;
> >  
> > -	len = args->width * args->num_placements;
> > +	len = args->num_bb_per_exec * args->num_dispositions;
> >  	if (XE_IOCTL_DBG(xe, !len || len > XE_HW_ENGINE_MAX_INSTANCE))
> >  		return -EINVAL;
> >  
> > @@ -637,8 +638,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
> >  
> >  			eci[0].gt_id = gt->info.id;
> >  			logical_mask = bind_exec_queue_logical_mask(xe, gt, eci,
> > -								    args->width,
> > -								    args->num_placements);
> > +								    args->num_bb_per_exec,
> > +								    args->num_dispositions);
> >  			if (XE_IOCTL_DBG(xe, !logical_mask))
> >  				return -EINVAL;
> >  
> > @@ -651,7 +652,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
> >  
> >  			migrate_vm = xe_migrate_get_vm(gt_to_tile(gt)->migrate);
> >  			new = xe_exec_queue_create(xe, migrate_vm, logical_mask,
> > -						   args->width, hwe,
> > +						   args->num_bb_per_exec, hwe,
> >  						   EXEC_QUEUE_FLAG_PERSISTENT |
> >  						   EXEC_QUEUE_FLAG_VM |
> >  						   (sync ? 0 :
> > @@ -678,8 +679,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
> >  	} else {
> >  		gt = xe_device_get_gt(xe, eci[0].gt_id);
> >  		logical_mask = calc_validate_logical_mask(xe, gt, eci,
> > -							  args->width,
> > -							  args->num_placements);
> > +							  args->num_bb_per_exec,
> > +							  args->num_dispositions);
> >  		if (XE_IOCTL_DBG(xe, !logical_mask))
> >  			return -EINVAL;
> >  
> > @@ -704,7 +705,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
> >  		}
> >  
> >  		q = xe_exec_queue_create(xe, vm, logical_mask,
> > -					 args->width, hwe,
> > +					 args->num_bb_per_exec, hwe,
> >  					 xe_vm_no_dma_fences(vm) ? 0 :
> >  					 EXEC_QUEUE_FLAG_PERSISTENT);
> >  		up_read(&vm->lock);
> > @@ -827,7 +828,7 @@ bool xe_exec_queue_is_idle(struct xe_exec_queue *q)
> >  	if (xe_exec_queue_is_parallel(q)) {
> >  		int i;
> >  
> > -		for (i = 0; i < q->width; ++i) {
> > +		for (i = 0; i < q->num_bb_per_exec; ++i) {
> >  			if (xe_lrc_seqno(&q->lrc[i]) !=
> >  			    q->lrc[i].fence_ctx.next_seqno - 1)
> >  				return false;
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
> > index 59a54bfb9a8c..6782f3ce9faf 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> > @@ -15,7 +15,7 @@ struct xe_device;
> >  struct xe_file;
> >  
> >  struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *vm,
> > -					   u32 logical_mask, u16 width,
> > +					   u32 logical_mask, u16 num_bb_per_exec,
> >  					   struct xe_hw_engine *hw_engine, u32 flags);
> >  struct xe_exec_queue *xe_exec_queue_create_class(struct xe_device *xe, struct xe_gt *gt,
> >  						 struct xe_vm *vm,
> > @@ -40,7 +40,7 @@ static inline void xe_exec_queue_put(struct xe_exec_queue *q)
> >  
> >  static inline bool xe_exec_queue_is_parallel(struct xe_exec_queue *q)
> >  {
> > -	return q->width > 1;
> > +	return q->num_bb_per_exec > 1;
> >  }
> >  
> >  bool xe_exec_queue_is_lr(struct xe_exec_queue *q);
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > index ecd761177567..eb924a3e5d98 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > @@ -47,8 +47,8 @@ struct xe_exec_queue {
> >  	u32 logical_mask;
> >  	/** @name: name of this exec queue */
> >  	char name[MAX_FENCE_NAME_LEN];
> > -	/** @width: width (number BB submitted per exec) of this exec queue */
> > -	u16 width;
> > +	/** @num_bb_per_exec: the width of this exec queue */
> > +	u16 num_bb_per_exec;
> >  	/** @fence_irq: fence IRQ used to signal job completion */
> >  	struct xe_hw_fence_irq *fence_irq;
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 870dc5c532fa..b5a41a772445 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -259,7 +259,7 @@ static void __release_guc_id(struct xe_guc *guc, struct xe_exec_queue *q, u32 xa
> >  	if (xe_exec_queue_is_parallel(q))
> >  		bitmap_release_region(guc->submission_state.guc_ids_bitmap,
> >  				      q->guc->id - GUC_ID_START_MLRC,
> > -				      order_base_2(q->width));
> > +				      order_base_2(q->num_bb_per_exec));
> >  	else
> >  		ida_simple_remove(&guc->submission_state.guc_ids, q->guc->id);
> >  }
> > @@ -283,7 +283,7 @@ static int alloc_guc_id(struct xe_guc *guc, struct xe_exec_queue *q)
> >  		void *bitmap = guc->submission_state.guc_ids_bitmap;
> >  
> >  		ret = bitmap_find_free_region(bitmap, GUC_ID_NUMBER_MLRC,
> > -					      order_base_2(q->width));
> > +					      order_base_2(q->num_bb_per_exec));
> >  	} else {
> >  		ret = ida_simple_get(&guc->submission_state.guc_ids, 0,
> >  				     GUC_ID_NUMBER_SLRC, GFP_NOWAIT);
> > @@ -295,7 +295,7 @@ static int alloc_guc_id(struct xe_guc *guc, struct xe_exec_queue *q)
> >  	if (xe_exec_queue_is_parallel(q))
> >  		q->guc->id += GUC_ID_START_MLRC;
> >  
> > -	for (i = 0; i < q->width; ++i) {
> > +	for (i = 0; i < q->num_bb_per_exec; ++i) {
> >  		ptr = xa_store(&guc->submission_state.exec_queue_lookup,
> >  			       q->guc->id + i, q, GFP_NOWAIT);
> >  		if (IS_ERR(ptr)) {
> > @@ -315,7 +315,7 @@ static int alloc_guc_id(struct xe_guc *guc, struct xe_exec_queue *q)
> >  static void release_guc_id(struct xe_guc *guc, struct xe_exec_queue *q)
> >  {
> >  	mutex_lock(&guc->submission_state.lock);
> > -	__release_guc_id(guc, q, q->width);
> > +	__release_guc_id(guc, q, q->num_bb_per_exec);
> >  	mutex_unlock(&guc->submission_state.lock);
> >  }
> >  
> > @@ -426,11 +426,11 @@ static void __register_mlrc_engine(struct xe_guc *guc,
> >  	action[len++] = info->wq_base_lo;
> >  	action[len++] = info->wq_base_hi;
> >  	action[len++] = info->wq_size;
> > -	action[len++] = q->width;
> > +	action[len++] = q->num_bb_per_exec;
> >  	action[len++] = info->hwlrca_lo;
> >  	action[len++] = info->hwlrca_hi;
> >  
> > -	for (i = 1; i < q->width; ++i) {
> > +	for (i = 1; i < q->num_bb_per_exec; ++i) {
> >  		struct xe_lrc *lrc = q->lrc + i;
> >  
> >  		action[len++] = lower_32_bits(xe_lrc_descriptor(lrc));
> > @@ -578,7 +578,7 @@ static void wq_item_append(struct xe_exec_queue *q)
> >  	struct iosys_map map = xe_lrc_parallel_map(q->lrc);
> >  #define WQ_HEADER_SIZE	4	/* Includes 1 LRC address too */
> >  	u32 wqi[XE_HW_ENGINE_MAX_INSTANCE + (WQ_HEADER_SIZE - 1)];
> > -	u32 wqi_size = (q->width + (WQ_HEADER_SIZE - 1)) * sizeof(u32);
> > +	u32 wqi_size = (q->num_bb_per_exec + (WQ_HEADER_SIZE - 1)) * sizeof(u32);
> >  	u32 len_dw = (wqi_size / sizeof(u32)) - 1;
> >  	int i = 0, j;
> >  
> > @@ -595,7 +595,7 @@ static void wq_item_append(struct xe_exec_queue *q)
> >  	wqi[i++] = FIELD_PREP(WQ_GUC_ID_MASK, q->guc->id) |
> >  		FIELD_PREP(WQ_RING_TAIL_MASK, q->lrc->ring.tail / sizeof(u64));
> >  	wqi[i++] = 0;
> > -	for (j = 1; j < q->width; ++j) {
> > +	for (j = 1; j < q->num_bb_per_exec; ++j) {
> >  		struct xe_lrc *lrc = q->lrc + j;
> >  
> >  		wqi[i++] = lrc->ring.tail / sizeof(u64);
> > @@ -766,17 +766,17 @@ static void simple_error_capture(struct xe_exec_queue *q)
> >  	struct xe_hw_engine *hwe;
> >  	enum xe_hw_engine_id id;
> >  	u32 adj_logical_mask = q->logical_mask;
> > -	u32 width_mask = (0x1 << q->width) - 1;
> > +	u32 width_mask = (0x1 << q->num_bb_per_exec) - 1;
> >  	int i;
> >  	bool cookie;
> >  
> >  	if (q->vm && !q->vm->error_capture.capture_once) {
> >  		q->vm->error_capture.capture_once = true;
> >  		cookie = dma_fence_begin_signalling();
> > -		for (i = 0; q->width > 1 && i < XE_HW_ENGINE_MAX_INSTANCE;) {
> > +		for (i = 0; q->num_bb_per_exec > 1 && i < XE_HW_ENGINE_MAX_INSTANCE;) {
> >  			if (adj_logical_mask & BIT(i)) {
> >  				adj_logical_mask |= width_mask << i;
> > -				i += q->width;
> > +				i += q->num_bb_per_exec;
> >  			} else {
> >  				++i;
> >  			}
> > @@ -1462,7 +1462,7 @@ static void guc_exec_queue_start(struct xe_exec_queue *q)
> >  		int i;
> >  
> >  		trace_xe_exec_queue_resubmit(q);
> > -		for (i = 0; i < q->width; ++i)
> > +		for (i = 0; i < q->num_bb_per_exec; ++i)
> >  			xe_lrc_set_ring_head(q->lrc + i, q->lrc[i].ring.tail);
> >  		drm_sched_resubmit_jobs(sched);
> >  	}
> > @@ -1508,7 +1508,7 @@ g2h_exec_queue_lookup(struct xe_guc *guc, u32 guc_id)
> >  	}
> >  
> >  	xe_assert(xe, guc_id >= q->guc->id);
> > -	xe_assert(xe, guc_id < (q->guc->id + q->width));
> > +	xe_assert(xe, guc_id < (q->guc->id + q->num_bb_per_exec));
> >  
> >  	return q;
> >  }
> > @@ -1768,20 +1768,20 @@ xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q)
> >  	memcpy(&snapshot->name, &q->name, sizeof(snapshot->name));
> >  	snapshot->class = q->class;
> >  	snapshot->logical_mask = q->logical_mask;
> > -	snapshot->width = q->width;
> > +	snapshot->width = q->num_bb_per_exec;
> >  	snapshot->refcount = kref_read(&q->refcount);
> >  	snapshot->sched_timeout = sched->timeout;
> >  	snapshot->sched_props.timeslice_us = q->sched_props.timeslice_us;
> >  	snapshot->sched_props.preempt_timeout_us =
> >  		q->sched_props.preempt_timeout_us;
> >  
> > -	snapshot->lrc = kmalloc_array(q->width, sizeof(struct lrc_snapshot),
> > +	snapshot->lrc = kmalloc_array(q->num_bb_per_exec, sizeof(struct lrc_snapshot),
> >  				      GFP_ATOMIC);
> >  
> >  	if (!snapshot->lrc) {
> >  		drm_err(&xe->drm, "Skipping GuC Engine LRC snapshot.\n");
> >  	} else {
> > -		for (i = 0; i < q->width; ++i) {
> > +		for (i = 0; i < q->num_bb_per_exec; ++i) {
> >  			struct xe_lrc *lrc = q->lrc + i;
> >  
> >  			snapshot->lrc[i].context_desc =
> > diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> > index 59e0aa2d6a4c..d3d671784e8e 100644
> > --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> > +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> > @@ -383,7 +383,7 @@ static void emit_job_gen12_gsc(struct xe_sched_job *job)
> >  {
> >  	struct xe_gt *gt = job->q->gt;
> >  
> > -	xe_gt_assert(gt, job->q->width <= 1); /* no parallel submission for GSCCS */
> > +	xe_gt_assert(gt, job->q->num_bb_per_exec <= 1); /* no parallel submission for GSCCS */
> >  
> >  	__emit_job_gen12_simple(job, job->q->lrc,
> >  				job->batch_addr[0],
> > @@ -400,7 +400,7 @@ static void emit_job_gen12_copy(struct xe_sched_job *job)
> >  		return;
> >  	}
> >  
> > -	for (i = 0; i < job->q->width; ++i)
> > +	for (i = 0; i < job->q->num_bb_per_exec; ++i)
> >  		__emit_job_gen12_simple(job, job->q->lrc + i,
> >  				        job->batch_addr[i],
> >  				        xe_sched_job_seqno(job));
> > @@ -411,7 +411,7 @@ static void emit_job_gen12_video(struct xe_sched_job *job)
> >  	int i;
> >  
> >  	/* FIXME: Not doing parallel handshake for now */
> > -	for (i = 0; i < job->q->width; ++i)
> > +	for (i = 0; i < job->q->num_bb_per_exec; ++i)
> >  		__emit_job_gen12_video(job, job->q->lrc + i,
> >  				       job->batch_addr[i],
> >  				       xe_sched_job_seqno(job));
> > @@ -421,7 +421,7 @@ static void emit_job_gen12_render_compute(struct xe_sched_job *job)
> >  {
> >  	int i;
> >  
> > -	for (i = 0; i < job->q->width; ++i)
> > +	for (i = 0; i < job->q->num_bb_per_exec; ++i)
> >  		__emit_job_gen12_render_compute(job, job->q->lrc + i,
> >  						job->batch_addr[i],
> >  						xe_sched_job_seqno(job));
> > diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> > index adbd82f8744e..1884b6b6b398 100644
> > --- a/drivers/gpu/drm/xe/xe_sched_job.c
> > +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> > @@ -117,13 +117,13 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
> >  	} else {
> >  		struct dma_fence_array *cf;
> >  
> > -		fences = kmalloc_array(q->width, sizeof(*fences), GFP_KERNEL);
> > +		fences = kmalloc_array(q->num_bb_per_exec, sizeof(*fences), GFP_KERNEL);
> >  		if (!fences) {
> >  			err = -ENOMEM;
> >  			goto err_sched_job;
> >  		}
> >  
> > -		for (j = 0; j < q->width; ++j) {
> > +		for (j = 0; j < q->num_bb_per_exec; ++j) {
> >  			fences[j] = xe_lrc_create_seqno_fence(q->lrc + j);
> >  			if (IS_ERR(fences[j])) {
> >  				err = PTR_ERR(fences[j]);
> > @@ -131,7 +131,7 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
> >  			}
> >  		}
> >  
> > -		cf = dma_fence_array_create(q->width, fences,
> > +		cf = dma_fence_array_create(q->num_bb_per_exec, fences,
> >  					    q->parallel.composite_fence_ctx,
> >  					    q->parallel.composite_fence_seqno++,
> >  					    false);
> > @@ -142,13 +142,13 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
> >  		}
> >  
> >  		/* Sanity check */
> > -		for (j = 0; j < q->width; ++j)
> > +		for (j = 0; j < q->num_bb_per_exec; ++j)
> >  			xe_assert(job_to_xe(job), cf->base.seqno == fences[j]->seqno);
> >  
> >  		job->fence = &cf->base;
> >  	}
> >  
> > -	width = q->width;
> > +	width = q->num_bb_per_exec;
> >  	if (is_migration)
> >  		width = 2;
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> > index d55dd1521df3..dcf28aaeb78a 100644
> > --- a/drivers/gpu/drm/xe/xe_trace.h
> > +++ b/drivers/gpu/drm/xe/xe_trace.h
> > @@ -112,7 +112,7 @@ DECLARE_EVENT_CLASS(xe_exec_queue,
> >  			     __field(enum xe_engine_class, class)
> >  			     __field(u32, logical_mask)
> >  			     __field(u8, gt_id)
> > -			     __field(u16, width)
> > +			     __field(u16, num_bb_per_exec)
> >  			     __field(u16, guc_id)
> >  			     __field(u32, guc_state)
> >  			     __field(u32, flags)
> > @@ -122,15 +122,15 @@ DECLARE_EVENT_CLASS(xe_exec_queue,
> >  			   __entry->class = q->class;
> >  			   __entry->logical_mask = q->logical_mask;
> >  			   __entry->gt_id = q->gt->info.id;
> > -			   __entry->width = q->width;
> > +			   __entry->num_bb_per_exec = q->num_bb_per_exec;
> >  			   __entry->guc_id = q->guc->id;
> >  			   __entry->guc_state = atomic_read(&q->guc->state);
> >  			   __entry->flags = q->flags;
> >  			   ),
> >  
> > -		    TP_printk("%d:0x%x, gt=%d, width=%d, guc_id=%d, guc_state=0x%x, flags=0x%x",
> > +		    TP_printk("%d:0x%x, gt=%d, num_bb_per_exec=%d, guc_id=%d, guc_state=0x%x, flags=0x%x",
> >  			      __entry->class, __entry->logical_mask,
> > -			      __entry->gt_id, __entry->width, __entry->guc_id,
> > +			      __entry->gt_id, __entry->num_bb_per_exec, __entry->guc_id,
> >  			      __entry->guc_state, __entry->flags)
> >  );
> >  
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index 2d0fb4386a69..a6c70b8697c7 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -1013,11 +1013,17 @@ struct drm_xe_exec_queue_create {
> >  	/** @extensions: Pointer to the first extension struct, if any */
> >  	__u64 extensions;
> >  
> > -	/** @width: submission width (number BB per exec) for this exec queue */
> > -	__u16 width;
> > +	/**
> > +	 * @num_bb_per_exec: Indicates a submission width for this exec queue,
> > +	 * for how many batch buffers can be submitted in parallel.
> 
> 'can' sounds like 'up to' in here, would change that to 'will'.
> 
> > +	 */
> > +	__u16 num_bb_per_exec;
> >  
> > -	/** @num_placements: number of valid placements for this exec queue */
> > -	__u16 num_placements;
> > +	/**
> > +	 * @num_dispositions: Indicates how the batch buffers will be
> > +	 * distributed to the hardware engines listed on @instance.
> > +	 */
> > +	__u16 num_dispositions;
> >  
> >  	/** @vm_id: VM to use for this exec queue */
> >  	__u32 vm_id;
> > @@ -1032,8 +1038,8 @@ struct drm_xe_exec_queue_create {
> >  	 * @instances: user pointer to a 2-d array of struct
> >  	 * drm_xe_engine_class_instance
> >  	 *
> > -	 * length = width (i) * num_placements (j)
> > -	 * index = j + i * width
> > +	 * length = num_bb_per_exec (i) * num_dispositions (j)
> > +	 * index = j + i * num_bb_per_exec
> >  	 */
> >  	__u64 instances;
> >  
> > @@ -1143,7 +1149,7 @@ struct drm_xe_exec {
> >  
> >  	/**
> >  	 * @num_batch_buffer: number of batch buffer in this exec, must match
> > -	 * the width of the engine
> > +	 * the @num_bb_per_exec of the struct drm_xe_exec_queue_create
> >  	 */
> >  	__u16 num_batch_buffer;
> >  
> 

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3DC6C77B62
	for <intel-xe@archiver.kernel.org>; Tue,  4 Apr 2023 14:56:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8099A10E6D3;
	Tue,  4 Apr 2023 14:56:37 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56F4E10E6D3
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Apr 2023 14:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680620195; x=1712156195;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=/nIn8e6Lfy9kBVqDtCUC+Eg9XFOJAB7YHUhOWzqy1A0=;
 b=XAxh1Jsdg6N5pFIfxWRmN4XXGADk1SZL7ABNXTtDwzaS5jY05WcUh/7W
 blZwdLMHQoR2fMIo68Nr1VxbYVmtldztpQUSLmYgXmLTRrBtIW3TWIIwN
 VR8vNFLda4K0Z7QI3VwvRm/cSzjoSMS8GREN9Oecx7qoHv580Akk/eweT
 hvA0N+b5ECoa11X3j+X6ig3A3oy8gX3bfqPCt2LQ6qtnF22qM6IKNY20v
 mEUh6KEwnBq7Bw8/liYxEKiGPeVSOg7ZjaW8UBwv6vt/oO7t/oDCaBZ3f
 Oet455+0V8NNC7yY9ACdrR3qkoBnLzIMQ1TQ8eMmtmhp469+tJ0BYp2H3 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="428491914"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="428491914"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 07:56:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="860626872"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="860626872"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP; 04 Apr 2023 07:56:34 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 4 Apr 2023 07:56:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 4 Apr 2023 07:56:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 4 Apr 2023 07:56:33 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 4 Apr 2023 07:56:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HspzVZuDpRJVq21u+/YAHB4AbZtTslTl4QJoJWwGHVlZh1cj6Ia+Kt8qqxYOCy+f3rwPnyey6A8CLJDWxPvOlkPVc41KSyEsSkA0awYYHHnucqaZLQ1Tu0YPvr72WffLyuRxYMwEFBwb3oqkANyg89layc3QDQfScTNX9I071C0dMeehtoVqIA+21poS1gt7IqnJeireQWqJL6MI750kDi7IhlZYnaWkhV2vCr2zMjE6pc87NLe7h0wgzAbASYjttGMFB8N6XxdGpDa/5pRpNwvI2Lx4c//ymiqSTZSAlASkEmTn4nREKAlCO9iOjBIdX0DdylvbA7REZdkg28Vk2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RnrGDYIeflB5VhsW4Qz+YmKct2V1ARc72MySpkRj6YQ=;
 b=cweIPy6E0fW94dGpi1O/cK2e856GBLPtzxfPclilOz7/58bh+ZbXXMeUYqLILkzgL7VHwwe4lmd6aFlsQJk47GQXC2YlrrFsXsXzi2bTaMl77bpmn1fHF72AiIGbmq2xI8NidtQWBYSqPzf9XB73lUUfZvJ2/OaMjCLXYLh6Z0LIRKt0x0Q9E/FwXVaNMXiWeTnc7eTMaslTjXbwum43uFXOctzEDGTlyApkouO7zjtSUv5kKDG+tG0L3hMEdKr69KNQ+4St+eO+PXM1T105ORwVd+lrcHnHjjQdNH1qGzKH8hQl7iw3mXyhGmZP+RlINR4O7UdQf7XJvHy6UOkV3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB7491.namprd11.prod.outlook.com (2603:10b6:806:349::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 14:56:29 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%9]) with mapi id 15.20.6254.033; Tue, 4 Apr 2023
 14:56:28 +0000
Date: Tue, 4 Apr 2023 14:56:21 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZCw6lTSIFd9FAaoC@DUT025-TGLU.fm.intel.com>
References: <20230404014228.3738347-1-matthew.brost@intel.com>
 <fc2de32e-9774-e5b0-3b43-e0e3eab74241@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fc2de32e-9774-e5b0-3b43-e0e3eab74241@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0165.namprd03.prod.outlook.com
 (2603:10b6:a03:338::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB7491:EE_
X-MS-Office365-Filtering-Correlation-Id: 59a35b47-008d-4f61-4d93-08db351cc522
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2JTF+09rSftftla1BIX9oEusbpC/ILHvsweyq2kbzBXZcG/J4u/gG/+vy8/bZHmyXLv0maDgCPCZA2YcIJSDJxzXtaQd/O9HtZKvTLpfVflmNaGgC+WFOm5YHLhRSWOLAlqBoxkCmhQCajJlWtktPdmCxNh+R2glFW1FUMkGRAuLcAwCd2VD3iiv/KVRzqTu9peJwOpkm2wSYHKAs7GHusY97NB73vLlz/onSSEpDvhflplVjvIW4uDfx+hIDWdIJw1Tlo6P3rnrrnNIENXSj7jf/CkG2USWOb8zQ/vp85rw/ZQD/4IPlVp/ta2PhpupqKcS8NyNvMcMNsASHow9sT/suW8jwZtH0Ml2lEOrNZA/SgaojjGKl57e6+DRCmK7kG2+uxhpQi/NzdlKGx+OWNl3hGEg1P1EYTt3ALf9mq0vWj/9vVMbUQEJFWP8x4TGXYrE75JSCWhDfP6wsEYVqsfzt8ihOyFxF9XD2VEyWLatFWaewyambHia06LnjmArbejDpV4TYq/QXYTfijOtyQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(39860400002)(366004)(376002)(136003)(346002)(451199021)(186003)(53546011)(26005)(83380400001)(41300700001)(66946007)(6506007)(8676002)(66574015)(6916009)(6512007)(4326008)(316002)(66476007)(6666004)(38100700002)(6486002)(82960400001)(2906002)(86362001)(5660300002)(66556008)(478600001)(8936002)(44832011)(966005)(66899021);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?LWKh90q/1gwPraeUSbTFBNx4xc752QGmxtpVCqnYkJ4mJnywsxIwSz44zG?=
 =?iso-8859-1?Q?5etoSLt1vaVdTwyAsuFByl3dq3LuZO4CvGBrae0G8Gdbu+mwfNUVtKbF/i?=
 =?iso-8859-1?Q?gzKunQbv9wwB3Q8U0ybx+13FgZ4v8LJoh12b9tC1NNPWmZX6iHvUSSiCy6?=
 =?iso-8859-1?Q?+KBmpFNZiuqEE05Klil/0+BbntkKC4ysrQbOObGZc9/kCY0WH9V3lQwRX3?=
 =?iso-8859-1?Q?H6Add9kp4fYKIGYrcZfs7fUrZdZbsGHOWrVK6wUwGDIdU14OwQ2hptanER?=
 =?iso-8859-1?Q?qO5wLGlKjqIKQDmlKjqTeSxiyDo+JtNmLEBaPORo0A2fZFHteeZgodwnRH?=
 =?iso-8859-1?Q?N2MYWcT+/lCMmFeFhtDYIxlsRH3LVMSLG2oMWZR7jnRbLgYvsBSUv0MJLV?=
 =?iso-8859-1?Q?ahGzRdOew9wvKg71CjSzPfnSSPlWJBZPmhN5Jqm0vmUGM6YD4US+tr3sJ+?=
 =?iso-8859-1?Q?qDyt+ipX4SateBDGE9DHFzOQOMtFJcP/9WX00uT/bv9VRV9GdO1k0hClu4?=
 =?iso-8859-1?Q?FU/CUe9E1QqiSJUe54fQCibGelGsH8h4UEQfOWUMnw3scY2cik6vikz+7v?=
 =?iso-8859-1?Q?5fk2L/gakWysBBVDJ+74IbXek5Y2sNKr+yMI2eVQeWjD5LbZv800ZU4bYG?=
 =?iso-8859-1?Q?bMMtLmL7bnTEFtDcZx2eXWW81wwjGP2/N5slc31XQCroE1/rZht/v5vqDv?=
 =?iso-8859-1?Q?7S4CdjAmeFWVsPARI2HQ3COObLxuunPVRzCjTxhXIBPi11kFV5xgC+LGbM?=
 =?iso-8859-1?Q?VvcCArqYo++p8nlsN+U8rCsxeDuhiH7IBKwxUO5grR7Llp+j9aF279P7T5?=
 =?iso-8859-1?Q?UJorqA8RHU7kxF6ZdyPpg0Cm7J0OJKBjsx0d3S/n3yPB9VEcwHtMqxFIwj?=
 =?iso-8859-1?Q?C4pdIpHhGuLY9SpJnMuiLqN9GzRT8QCj2y4/jfahHjTbHoxVQX8Z5mpJwy?=
 =?iso-8859-1?Q?Ai6p/Uvec4XphCEC3U6CZob7Cz/PBEFuU3gjD6Eg5LcW3clnOZLA8O/z4R?=
 =?iso-8859-1?Q?JW9SULun4RYVbZ7FyX0g86aMMwFdseTxInzw1+UZBhHdI9oOLdktEzR0gz?=
 =?iso-8859-1?Q?K17SSY85ID8oywKVsV4y5MKxCAruvisyC6Yie9vMxrbFYg3Ey0ii1m9mbZ?=
 =?iso-8859-1?Q?kvOZPDSZcpQSWazs9O1EHsfL349ZJtT1XTHdQU5sBBaWGd02GMm2qDmz7n?=
 =?iso-8859-1?Q?KCl+KXv6543ejWS4qunUIVwbrr56aaiqisrViP3ObOpRfomM2508lI0MEu?=
 =?iso-8859-1?Q?3ksos5n0HBGETCHaNRvoB4Hj71qdVopfXDd+4uxV8QgYfC6+f2peF0a+VB?=
 =?iso-8859-1?Q?3R9LBnR/10Rg1lQvQkAzpyRPjZ1w58Jrl8delXbXsL8Jj0cD0EfkqNEG/2?=
 =?iso-8859-1?Q?Uk3f1JDf8bFX9PPcTm3UAyo0S5z24OYZxt5XThrv57G3hsnd1YnJgDqgfK?=
 =?iso-8859-1?Q?5LzuMdRFcbhGhjehOvgLUIMUwrJ5tFVcMrd1va2l1qG1sXK6UIFOj9onxf?=
 =?iso-8859-1?Q?YK0q9S7+vHJuuJVwFzCrHIc1hVyWVr9Gg5r66Jr4sI2SfjWktwJt3a8aE9?=
 =?iso-8859-1?Q?/86gluni/vSGPCzf137TeaYwJPvIzlLHPG/vZV3fRPOEzc49CqjbO8usuR?=
 =?iso-8859-1?Q?xuqW3SQ+gg+weVaQBJ4uD9KjY0YBhO+cqUzlQbacJhGNov7xRmiH40zA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 59a35b47-008d-4f61-4d93-08db351cc522
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 14:56:28.8655 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FXr4dN/sU3YTrtUzekWL2lRPc+4mr4lbNsJt2DYFgt21sbehqCJ5NWAsw2QGh/L+gzJ/VPhlfJpyr5S5TLbk8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7491
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v5 0/8] Port Xe to use GPUVA and implement
 NULL VM binds
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

On Tue, Apr 04, 2023 at 03:20:47PM +0200, Thomas Hellström wrote:
> Hi, Matthew,
> 
> 
> On 4/4/23 03:42, Matthew Brost wrote:
> > GPUVA is common code written primarily by Danilo with the idea being a
> > common place to track GPUVAs (VMAs in Xe) within an address space (VMs
> > in Xe), track all the GPUVAs attached to GEMs, and a common way
> > implement VM binds / unbinds with MMAP / MUNMAP semantics via creating
> > operation lists. All of this adds up to a common way to implement VK
> > sparse bindings.
> > 
> > This series pulls in the GPUVA code written by Danilo plus some small
> > fixes by myself into 1 large patch. Once the GPUVA makes it upstream, we
> > can rebase and drop this patch. I believe what lands upstream should be
> > nearly identical to this patch at least from an API perspective.
> > 
> > The last three patches port Xe to GPUVA and add support for NULL VM binds
> > (writes dropped, read zero, VK sparse support). An example of the
> > semantics of this is below.
> 
> Going through thew new code in xe_vm.c I'm still concerned about our error
> handling. In the cases we attempt to handle, for example an -ENOMEM, the
> sync ioctl appears to be doing a fragile unwind whereas the async worker
> puts the VM in an error state that can only be exited by a RESTART ioctl
> (pls correct me if I'm wrong here). We could of course do the same for sync
> ioctls, but I'm still wondering what happens if, for example a MAP operation
> on a dual-gt VM fails after binding on the first gt?
> 

So sync mode we don't allow advanced binds (more than 1 map operation)
but I failed to take into account dual-gt VMs, yea that might be an
issue foe sync binds. This should just for work async though. Maybe we
depreciate the sync mode except for unbinds when in an error state.

> I think we need to clearly define the desired behaviour in the uAPI and then
> make sure we do the necessary changes with that in mind, and Even if I
> prefer the !async_worker solution this can be don orthogonally to that
> discussion. Ideally I'd see we find a way to *not* put the VM  in an error
> state like this, and I figure there are various ways to aid in this, for
> example keeping a progress cookie in the user-space data or deferring any
> failed bind operations to the next rebind worker or exec, but in the end I
> think this boils down to allocating all needed resources up-front for
> operations or groups of operations that are not allowed to fail once we
> start to modify the page-tables.
>

Agree on clearly defined uAPI behavior, I'm not sure if I have answer
for the error handling. Personally I like the stop / restart mechanism
as it essentially mean binds never can fail with a well behavied user.
wrt to Allocating up front, I think that is what Nouveau is doing? We
could study that code but allocating everything up front will be a
pretty large change.

Obviously we need to do some work here and this is one of our biggest
opens left but I don't view this as a true blocker until we remove force
probe. GPUVA regardless is a step in the right direction which will make
any changes going forward easier + enable VK to get sparse implemented.
I'd say let's get GPUVA merged and next focus on these issues you have
raised.

Also another VM bind issue we need address soon:
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/41

Matt

> Thoughts?
> 
> /Thomas
> 
> 
> 
> 
> > 
> > MAP 0x0000-0x8000 to NULL 	- 0x0000-0x8000 writes dropped + read zero
> > MAP 0x4000-0x5000 to a GEM 	- 0x0000-0x4000, 0x5000-0x8000 writes dropped + read zero; 0x4000-0x5000 mapped to a GEM
> > UNMAP 0x3000-0x6000		- 0x0000-0x3000, 0x6000-0x8000 writes dropped + read zero
> > UNMAP 0x0000-0x8000		- Nothing mapped
> > 
> > No changins to existing behavior, rather just new functionality./
> > 
> > v2: Fix CI build failure
> > v3: Export mas_preallocate, add patch to avoid rebinds
> > v5: Bug fixes, rebase, xe_vma size optimizations
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > 
> > Danilo Krummrich (2):
> >    maple_tree: split up MA_STATE() macro
> >    drm: manager to keep track of GPUs VA mappings
> > 
> > Matthew Brost (6):
> >    maple_tree: Export mas_preallocate
> >    drm/xe: Port Xe to GPUVA
> >    drm/xe: NULL binding implementation
> >    drm/xe: Avoid doing rebinds
> >    drm/xe: Reduce the number list links in xe_vma
> >    drm/xe: Optimize size of xe_vma allocation
> > 
> >   Documentation/gpu/drm-mm.rst                |   31 +
> >   drivers/gpu/drm/Makefile                    |    1 +
> >   drivers/gpu/drm/drm_debugfs.c               |   56 +
> >   drivers/gpu/drm/drm_gem.c                   |    3 +
> >   drivers/gpu/drm/drm_gpuva_mgr.c             | 1890 ++++++++++++++++++
> >   drivers/gpu/drm/xe/xe_bo.c                  |   10 +-
> >   drivers/gpu/drm/xe/xe_bo.h                  |    1 +
> >   drivers/gpu/drm/xe/xe_device.c              |    2 +-
> >   drivers/gpu/drm/xe/xe_exec.c                |    4 +-
> >   drivers/gpu/drm/xe/xe_gt_pagefault.c        |   29 +-
> >   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |   14 +-
> >   drivers/gpu/drm/xe/xe_guc_ct.c              |    6 +-
> >   drivers/gpu/drm/xe/xe_migrate.c             |    8 +-
> >   drivers/gpu/drm/xe/xe_pt.c                  |  176 +-
> >   drivers/gpu/drm/xe/xe_trace.h               |   10 +-
> >   drivers/gpu/drm/xe/xe_vm.c                  | 1947 +++++++++----------
> >   drivers/gpu/drm/xe/xe_vm.h                  |   76 +-
> >   drivers/gpu/drm/xe/xe_vm_madvise.c          |   87 +-
> >   drivers/gpu/drm/xe/xe_vm_types.h            |  276 ++-
> >   include/drm/drm_debugfs.h                   |   24 +
> >   include/drm/drm_drv.h                       |    7 +
> >   include/drm/drm_gem.h                       |   75 +
> >   include/drm/drm_gpuva_mgr.h                 |  734 +++++++
> >   include/linux/maple_tree.h                  |    7 +-
> >   include/uapi/drm/xe_drm.h                   |    8 +
> >   lib/maple_tree.c                            |    1 +
> >   26 files changed, 4203 insertions(+), 1280 deletions(-)
> >   create mode 100644 drivers/gpu/drm/drm_gpuva_mgr.c
> >   create mode 100644 include/drm/drm_gpuva_mgr.h
> > 

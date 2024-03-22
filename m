Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 988E9C47DD9
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 19:37:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4720010E69A;
	Fri, 22 Mar 2024 19:37:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HVsf0aLb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B21B10E69A
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Mar 2024 19:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711136251; x=1742672251;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Uhg7FqYKJnbdFw2n/MuI1ONr+8sIVSYvgN0MELQzF0A=;
 b=HVsf0aLbS275XVWB0vjVE8wO4znObbOL8taQJEryf6IOLkeBkaQei/Xi
 dlNMLLjMG2kM5WAsR7rgkotSZPt/c+0j07rMnsSVtMtpVY26/Rs4S9yfj
 1/h77rxwW9xBLW4laXauETfe4EEkJx3dRngkMjGpFFXzg7nFOCBpLbxWJ
 xQaB2O62YBgJPopYWZbvNIbmE4ZjzCguho/655qNwVwioG48NNYcjKvue
 yM6VogDq/o/nC3iTi3awcIeZ0IvhRiHuElYrw09PjDFZwrWL1vZFZ8jX6
 6NfDDhOHWh1/FsTtqulyu3u8KfVA5uaEIxAHTnGuuroE+/FpECIKfgf2O Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="10003125"
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; d="scan'208";a="10003125"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 12:37:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; d="scan'208";a="14991178"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Mar 2024 12:37:30 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 12:37:29 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 22 Mar 2024 12:37:29 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 22 Mar 2024 12:37:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ncshOvP7wZ6HgW1xDAWjgdcCXuGSwtkcnWzA0h13DUfmUCWQ1GqSpAc6LRC3U60jUCPT9XDKtaDj8htBIw+1zAOcUrpDv2c+rpiERNomCv9vIXxnViNxs+L1M4S6r/tlLYRDSMCM0hTy1mq5bhmUqr6wVvFMGVOOhrzh9oyYRJ4RJJaWgQECuQ/cJU972wZeMjr0A1cWZ5aUBWxjWfCOQOF3kA1nfN/4AJmvrnG7dbbbrLG8e46ArlPU+idXqrTNbGb0A5FbKmkEiL4I9rv3BqpnkAgNSLfTxPasaNcGjQZRzBFV45y6uMSrTnKKmK9k2nSjFOyTIif65PKz16TNwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fYGwgsTGAsT8GCfiWyg1YTiEUTC2WPGKn6oGTWJLK7k=;
 b=AQWsAs+y7MDcpJOsGzM5tx/tnrT2bXcntcFm9cROFnGGbP2FEQkWMM41xDxSdY77kIIXH4/hf9NwOrSgj33fl9XT+TtLQjtOwAvfAK/V/sr3S6nB6/7OSlEHG+a+n8AnZ7cH+Uy9i1z9OkdAGPdc+iJ4LgZjPbp4vgnzsbufssNLQmJIpVuQPXdsilOZbCDKM92mNRBGpto6pNVj3dvILsLoIk1JtHWzkeZeItJ+/TVzrg2mQNB+2zQcayrnpDrGnivIyevuKqU3AwVNuuXQREacBt1Gvmf+mmSSSRk8TvCBNkimik+nXtoUYx0Si2fUcGfMGcDHP+qP4s9HNm2uNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ2PR11MB7473.namprd11.prod.outlook.com (2603:10b6:a03:4d2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Fri, 22 Mar
 2024 19:37:27 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7409.023; Fri, 22 Mar 2024
 19:37:26 +0000
Date: Fri, 22 Mar 2024 15:37:22 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/xe/xe_migrate: Fix potential overflows expression
Message-ID: <Zf3d8niX22_zfvZy@intel.com>
References: <20240320101835.3266429-1-himal.prasad.ghimiray@intel.com>
 <ZftN0eDAtRN1YnsG@intel.com>
 <2bb36b66-8931-4adc-9f94-5e37958a5f25@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2bb36b66-8931-4adc-9f94-5e37958a5f25@intel.com>
X-ClientProxiedBy: BY3PR05CA0053.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::28) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ2PR11MB7473:EE_
X-MS-Office365-Filtering-Correlation-Id: a67e5ca6-ae88-43fe-79c3-08dc4aa78129
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3rVm0CmI7CpSQoY0sPG3FYA+tQUFXxwuBlNCXJCeIyEM8KknOm0YPPxYLWniL+kyjeqdpliT9xnAhgDIN00/EMJVl4fQro2AwZmkpZb6Hnt9zQ/NDKdC7UvACY3zDTbgAYtjgHp+nFr0AN8Zu5n3gaZaSkv9DqDxvHi23oDRi0oXX1MFrd3GLNL20x2jKqqK83IrwtalqQbx+b8cZu7bwKkXREwpzfIaKod3P2Q5P5RCN50K5ZrvNfkZ49jxPN+WkgtCDErjAvpUXhTm3dlbDfXaWMtVWiWxrMmuyy+zypm+5qQQ2/J5gOZDTfDFm3rceCtbjVD2sbEN6ocmjsntbSgr9GPA63qssFFO/hXA5axVwxcwuXQJpWbzbawkS4vM1FMLCSZfYWS3B4LQqw8KbsEceL/luqvUng3Gk4O9S0YvG6y0DY4+q8g1OtSTU9amy/8T7YtSFAbK2pD/8k3TvjAvNTr+0w8BPipj4SSfRYUirATrUxLF011S9uQqrqXNLRooSifT3L2WAx3kvV7QC0Jv1TEutT1L/M7b8myYSaU9s4d8Ga8/yhPf5PpcI6JhkAFZdRLdCH3NhhIDiqgV4k9+f2c1+rjQBDShj9F0LfB3mWDfY78Ar7MQN+h/4MNKkxJHlMGZyszMFygiNx+X6pL8xhLao55NDxGVyOPxdaY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4HLVUXEPT9d4LZ4/L1S067Qs1UReitgTuBrAUzYLUnJfZM7F4o77p7Ry5msQ?=
 =?us-ascii?Q?EjLPYetDnADfHFbWJkeiMIWlyFBHS9+O95s+rH2sg0huEmzH0osnHR65vFmk?=
 =?us-ascii?Q?/QKQLcanLWtIpAoctGjuw2EV7fOyqBx3miHp3f1BVO1YvfzsRDJXjl/Ve45i?=
 =?us-ascii?Q?VvqqKHDuxehQoVWtOCvd2iPu8XiFd2awqlLK72t9ccp1YplQNzvppYV54Ndn?=
 =?us-ascii?Q?UmTx4doW3Ko7hq60MWIDNinvuBW9c/qGlLdkjleKIc0h6oiUiqT1Hi6U+ifo?=
 =?us-ascii?Q?tnzvwlHWHZXO6VBqa2HYVADs6baIguZPu+DvJggGpAi7PWmUSd5hYXFiC0st?=
 =?us-ascii?Q?CYzg4yPi7wX17w1wBeAFj/03HZKbT/QcSwdvQbz/Drn364fceCmwXQ98OGt4?=
 =?us-ascii?Q?lgw97mfr+YTu3qDAwJusT+eMMy+hwU8uZCiOhXi0+PCXEEdeWGq5EFxykb6X?=
 =?us-ascii?Q?7ou+8IqZ3/buVgehESwnm3J5HhEZbXjfCNuxaCwj2HNKQgsuAW2zbalKNv07?=
 =?us-ascii?Q?KUqyufdq5DiWj1av0G/OYuLW/lggo/XiJdwxO9sswWC8Z4cLpiJ8Ch73D0ys?=
 =?us-ascii?Q?9kjQlYintW58HbEwXgcGqqJ1SkPUavQor7eIGfQXKEItMTE4IF1i0CS5vDtn?=
 =?us-ascii?Q?t64Jejt425fyRcRPQ/D82u7no+vbcOUFePuEB0w7SojvHW1PAtBUR9GZd+xt?=
 =?us-ascii?Q?7CsNoXqreo9Q0dn2DRQAVi4T62SO12HTR2nz1h+lAKK3Lnx0wUpWKvpr83vc?=
 =?us-ascii?Q?35qWW4konwkHKcI3lVbQaJUwuCmrLrZ4TDWWED6UzZ48CPBX/HfbK7AQ/1B/?=
 =?us-ascii?Q?/fXrWZrnLZE8dWDG9VW/vfUjkHqnrdrUi+A15j4/Hc7bevHkldD4g210phfy?=
 =?us-ascii?Q?DEQ/WxITtjRVKk98hG9hBSh3cbBps161F/CvrNKt6QXId8Q/JSEzX/PVJr7Q?=
 =?us-ascii?Q?SS0027HCynWIBYjpskNmSbo/Vv8+t2hVcxGwLFmgGlaMISPm9rfD3EnW+HRB?=
 =?us-ascii?Q?hQ4G4KEKmLsFs8VQ9z6A4M10fxbgeXIKzQVBfcWKVsxpaPe71LtOzwPP+kIX?=
 =?us-ascii?Q?0X0gu8kQOI84tc947hmvLCJdptmJZ98Lu3yW6MA5P56+ieLIzzkgBuN7aPeD?=
 =?us-ascii?Q?KbougKMG6597GK14sKzzfo8UpKj6vwD2HiBOpI6dD68yCKHptie4NwXEH9Ib?=
 =?us-ascii?Q?NwcuUp5GPPGvldfGDRsWLLAv8dwy7Uof3k/bC4bEeZHhafQUVXdKbCb2JMdD?=
 =?us-ascii?Q?YkW7FtASNDF9UjBuRRoHH/y5aK1l4iaa2Ukf/lfvaLXi4tEr5z8xQH114nOw?=
 =?us-ascii?Q?QQyq5isDbhWwIotEVMd66Z/Z4KPp5P1IITR0v/ItkibFdrC4pgtJFAnxzAoB?=
 =?us-ascii?Q?HaoAsgQuIQJHvzvzNNnPbpuqKTjgiCFsqZa1waFP+vn9b/0KDItrIzg0/h0V?=
 =?us-ascii?Q?s4GZvev6h9tVsg/O6TS+eduZ0+O4qbmMaZhr5md8NzXSWM7ZxAI9TbFoC79p?=
 =?us-ascii?Q?IsJ/vzhguJqNFr5w/ThKa0MgDPJZ6L6AVtUGuJD0Lb1izt+LPEzV7Wa66nfM?=
 =?us-ascii?Q?WsXN+DxmIy6GHqXId9PUMuUvKMpG7y9k3hv39Uwi1/CkzverLJz+PmBOWFNm?=
 =?us-ascii?Q?eQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a67e5ca6-ae88-43fe-79c3-08dc4aa78129
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2024 19:37:26.8818 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RwMhyeMns8lQplt62YUwsGBEcLV2dd/1Qaxf9dSPm+qiUVR17CWDf+d2S0FVjWxc1YWaD5JBOH20lZHHe/CQrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7473
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Mar 22, 2024 at 03:00:17PM +0530, Ghimiray, Himal Prasad wrote:
>    On 21-03-2024 02:27, Rodrigo Vivi wrote:                                     
>                                                                                 
>    On Wed, Mar 20, 2024 at 03:48:35PM +0530, Himal Prasad Ghimiray wrote:       
>                                                                                 
>    >Cast to proper datatypes to avoid overflows.                                
>                                                                                 
>    I'm afraid that the cast wont prevent the overflow, but mask it.             
>    probably safer to move the multiplication to some of the helpers             
>    in linux/math64.h ?!                                                         
>                                                                                 
>    Hi Rodrigo,                                                                  
>    Thank you for your response. The modifications are inspired by the inline    
>    u64 mul_u32_u32(u32 a, u32 b)                                                
>    function defined in linux/math64.h. Initially, I considered using the same   
>    approach.                                                                    
>    However, I discovered an architecture-specific implementation for            
>    mul_u32_u32.                                                                 
>    To prevent ambiguity, I opted for casting, which I observed is a standard    
>    practice throughout Linux code.                                              

afaik the cast just tells compilers and static analyzer tools that we know
what we are doing and we know that that math on the right won't exceed
the cast size. But it doesn't prevent overflow. You need to take care
and be sure that you are not overflowing the bits you have available. Always.

I doubled checked all the cases below and I'm sure we don't have any
overflow issue there. So you need to at least adjust the commit message.


Btw, (map_ofs / XE_PAGE_SIZE - NUM_KERNEL_PDE) probably deserves a separate
patch to make it to use some of the variants of DIV_ROUND macros...


>    BR                                                                           
>    Himal                                                                        
>                                                                                 
>                                                                                 
>                                                                                 
>    >Cc: Matthew Auld [1]<matthew.auld@intel.com>                                
>    >Cc: Matthew Brost [2]<matthew.brost@intel.com>                              
>    >Cc: Rodrigo Vivi [3]<rodrigo.vivi@intel.com>                                
>    >Signed-off-by: Himal Prasad Ghimiray [4]<himal.prasad.ghimiray@intel.com>   
>    >---                                                                         
>    >These errors were highlighted by Coverity. I'm uncertain whether they       
>    >require attention or if it would be more appropriate to label them as       
>    >false positives within the tool.                                            
>                                                                                 
>    >I've submitted this patch in case addressing the issues is necessary.       
>    >However, if reviewers determine that these issues should be marked as       
>    >false positives or ignored within the tool, that option is also             
>    >available                                                                   
>                                                                                 
>    > drivers/gpu/drm/xe/xe_migrate.c | 8 ++++----                               
>    > 1 file changed, 4 insertions(+), 4 deletions(-)                            
>                                                                                 
>    >diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>    >index ee1bb938c493..2ba4fb9511f6 100644                                     
>    >--- a/drivers/gpu/drm/xe/xe_migrate.c                                       
>    >+++ b/drivers/gpu/drm/xe/xe_migrate.c                                       
>    >@@ -227,7 +227,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>    >                if (vm->flags & XE_VM_FLAG_64K && level == 1)               
>    >                        flags = XE_PDE_64K;                                 
>    >                                                                            
>    >-               entry = vm->pt_ops->pde_encode_bo(bo, map_ofs + (level - 1) *
>    >+               entry = vm->pt_ops->pde_encode_bo(bo, map_ofs + (u64)(level - 1) *
>    >                                                  XE_PAGE_SIZE, pat_index); 
>    >                xe_map_wr(xe, &bo->vmap, map_ofs + XE_PAGE_SIZE * level, u64,
>    >                          entry | flags);                                   
>    >@@ -235,7 +235,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>    >                                                                            
>    >        /* Write PDE's that point to our BO. */                             
>    >        for (i = 0; i < num_entries - num_level; i++) {                     
>    >-               entry = vm->pt_ops->pde_encode_bo(bo, i * XE_PAGE_SIZE,     
>    >+               entry = vm->pt_ops->pde_encode_bo(bo, (u64)i * XE_PAGE_SIZE,
>    >                                                  pat_index);               
>    >                                                                            
>    >                xe_map_wr(xe, &bo->vmap, map_ofs + XE_PAGE_SIZE +           
>    >@@ -291,7 +291,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>    > #define VM_SA_UPDATE_UNIT_SIZE         (XE_PAGE_SIZE / NUM_VMUSA_UNIT_PER_PAGE)
>    > #define NUM_VMUSA_WRITES_PER_UNIT      (VM_SA_UPDATE_UNIT_SIZE / sizeof(u64))
>    >        drm_suballoc_manager_init(&m->vm_update_sa,                         
>    >-                                 (map_ofs / XE_PAGE_SIZE - NUM_KERNEL_PDE) *
>    >+                                 (size_t)(map_ofs / XE_PAGE_SIZE - NUM_KERNEL_PDE) *
>    >                                  NUM_VMUSA_UNIT_PER_PAGE, 0);              
>    >                                                                            
>    >        m->pt_bo = bo;                                                      
>    >@@ -490,7 +490,7 @@ static void emit_pte(struct xe_migrate *m,              
>    >        struct xe_vm *vm = m->q->vm;                                        
>    >        u16 pat_index;                                                      
>    >        u32 ptes;                                                           
>    >-       u64 ofs = at_pt * XE_PAGE_SIZE;                                     
>    >+       u64 ofs = (u64)at_pt * XE_PAGE_SIZE;                                
>    >        u64 cur_ofs;                                                        
>    >                                                                            
>    >        /* Indirect access needs compression enabled uncached PAT index */  
>    >--                                                                          
>    >2.25.1                                                                      
> 
> References
> 
>    Visible links
>    1. mailto:matthew.auld@intel.com
>    2. mailto:matthew.brost@intel.com
>    3. mailto:rodrigo.vivi@intel.com
>    4. mailto:himal.prasad.ghimiray@intel.com

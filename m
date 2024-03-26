Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE21CD11DF
	for <intel-xe@archiver.kernel.org>; Tue, 26 Mar 2024 22:56:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91BD610F47B;
	Tue, 26 Mar 2024 22:56:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PKoZKk7K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34E9D10F47B
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Mar 2024 22:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711493777; x=1743029777;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=gFO7S4w0NlOpC79+ikmIk4hUmMvmLHA6X45JeQ35ouQ=;
 b=PKoZKk7K3+KqWgKjNc4ZrvbDAunOOjvuL1FULIyv7WiIvENZBk7uikDI
 ncuW92Ae5xHgT3r17Ot2xYoavjkujJBvzxZPrXPI2ea3Q92REHzjASxmD
 HOhjKAdZK276VePfBhCNmI5u7+RWwxyERmnA3sS4mho0esYJAsTlsXxnN
 dhhvij7jygNkwZg+myIOGYFIOPTo0AbQI2fKqe73gpuY+b5Tl8darlSvO
 ven6JPb8KfYhQlgBAeX5wu4KeUw9ZLb5xy6Tqj3oPx7/7GnV5oK1rlGjY
 r3nQmsz+WtDRyji0PxZbsQfdDDs1KQk1FCkQQ0bie1N4n0nACqnulYfuI A==;
X-CSE-ConnectionGUID: U4Cfb3jQQIyPnkNXDu4WqA==
X-CSE-MsgGUID: 9YyCGvwjSky3tvyG5uYhJQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17117986"
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; d="scan'208";a="17117986"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 15:56:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; d="scan'208";a="20762444"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Mar 2024 15:56:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 15:56:17 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 15:56:16 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 26 Mar 2024 15:56:16 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 26 Mar 2024 15:56:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iaRJFZ0tuW0/e8OyP9dRz0xo7nqrgsBaJIEs/emBSsXFlPaAXcQtm/34zSvDTIgFaW9d4QSxzF6DZnPta+sNPgkQoTGuWwFcQYux3UL2y71ibIKUtX6bI2PDFokTVsUlrciryTEb798bQ/ojsy8VAg3Lr/woKqjP/PeikrBPHssSbb1qQ9OZpfykmXYBDDjaz7n9FqmJK6fW755kjr/wMBZM27v7pY4VjgStyubY0VWGBAK/omZBXCJtXx8yJqJYUqtaW/O2dzACLf3/rbegY9PZ44g7HamkTErSCKIkSD2wEct7B2ssphBWuF/O31ZYeBGUAZs1d3JGeEEvIW5zrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zp3tbuV6l7Jro/G8HhtTObWP6WYbQZslowTwdzLd40s=;
 b=KRzCyaTb3mg3AWSybnvk2MvHjZgCSMel7T4WVGfKlEI4FeWvgtBxvEsqQo/4v5vo0ljV9f3tzFKYyW/wJxal6e/tpcKi2U6se+ElAcS6J0EqIrBLXArMOxqIMKpBwUx47TnRZOAd18I7Pv1f0ySz+DfMrdiIffBi9bmWl7eOzID0MkIdGfk+taJwoqhCBVujcw5xRTvJ4GwJ6g1kOllHUOB+Dwuf4qMp4rUrN0GgEeNxUFT2lkYBt1EalP1+eK9aILqPCj2LT77OrkW5cDkxaj6ZNbnhtuU4wVZ/7z+UHvkdZD3DF5s5VTL8qR9WIx2od8yMSG8y2tnDnBbTR8lIjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB7174.namprd11.prod.outlook.com (2603:10b6:208:41a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Tue, 26 Mar
 2024 22:56:14 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7409.031; Tue, 26 Mar 2024
 22:56:14 +0000
Date: Tue, 26 Mar 2024 17:56:10 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Nirmoy Das <nirmoy.das@linux.intel.com>
CC: Nirmoy Das <nirmoy.das@intel.com>, <intel-xe@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v2] drm/xe: Create a helper function to init job's user
 fence
Message-ID: <p5orrg525ipnqq4xuj5pymekfcoisfqmmm53hxugtiiiz2g2vv@mrp7nupohvd5>
References: <20240321161142.4954-1-nirmoy.das@intel.com>
 <vgkvzpqwyku2q5lomqvytpeuz7hvybykd4rnetzkgy3siy3c57@jclsubzhsmts>
 <8c521ff9-950f-480e-911b-9c6210ff6416@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8c521ff9-950f-480e-911b-9c6210ff6416@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0162.namprd05.prod.outlook.com
 (2603:10b6:a03:339::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB7174:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N3SmO/QD2wcChwJ7D8XI0NtkZetqUqthr3qIfdAslLf5WxecGwapNzbJOZdJFMx+uxbU5GCfkM4vKX0VBWEAHHt75pUQDZ0vnRL5AZQqU3TCC5+KzEBggScx1Ty2w7SvrPhxRVU50+HD6AK22xIzee9tP0wXk5I609gPkNtGDACSmeGkiFhBO/kz1bSKdlaOiVJuV0sw0EfQsW1QN1AoVb7uJJEW755wkZO0wM0fQ3xbDh2PTwC9OMOsqQYU9Ktdvig8wv1DZKvNpI26pjnQXZ6lG6GGiTcwD9fdcPaju16L/56TctSLClfk5G/b0robBmYqrMDv/67ZCmXbzwexoSJbdoNzAmNQpzjtC4fBZE7yvhKa+BrzFXwLD8qym8Nm8BF/sWiZJFRewGrfCBreaLhJ1ofPrnhubzp8CqLdxktlctKVl+t8GZVj4X1cKKYyTbDLF4scXuQuUhQJc9RDxwKonkYfND4pTaRpHO9QMtBOld3KVUie3UMVaAwErfLf0YoaXpLcdZP3F6bz4nzGbjobtc08cqqeKEckJk3/eqdBtwo44w8/E1SeduFZdNC08UqZEh40X4da278vGRtB6xzutIqCyF7gGyOIehX4I0Fzz71sAyV0+9sEpM73khBo+7k0ivKe82mYNqryaLBcNGY203bqTopawqW/+Npws7k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?wVuyvU3p5/3TtHNcV8q81DAS/ykR6iaaOBWB3hKxu9kzZuOEtSz4FR6peu?=
 =?iso-8859-1?Q?BAPQYaHlPE1dzGyFFETsDX/gt4lxRlQXX9gkr///q8wJbi91t0v3dU4qfH?=
 =?iso-8859-1?Q?U/oP1fgYXZlkFrwMb80nJtg0jqSTDyxcmsJ5siMYo5xQOqY8nxQzl6udM4?=
 =?iso-8859-1?Q?k1YVJ8S4JAtebzVhjgZFxtzBui8C9TLWw5njadZtiJXBJ8IqgQqHItLx/F?=
 =?iso-8859-1?Q?SdRP86qzle9tqM58sWbStfcWsq/vTv8KlI0NjpfToIeiC/Wyqi07ek96Be?=
 =?iso-8859-1?Q?Cug0K5hxNdsQJ4IS4BpppQjHdO66U0P5sMkV51UfxoFUxth7iaQ20RBtpT?=
 =?iso-8859-1?Q?LfzEqrePjjeKXr9DrdDql5T/u0V3pSQ6PNKRvSYm+UO4M8S7e4sl/ch3vq?=
 =?iso-8859-1?Q?iQWjJvQG9Q3NUR29M/OK/VIW+OxHROcHZHvGVuvNqywRJjcDf1Y5rkx5fj?=
 =?iso-8859-1?Q?9+4CxlH0kmMxEUY8kN4bLS98C1/lQ+S7CaXHGpAIGCGWvPtXTLwM+HlVZs?=
 =?iso-8859-1?Q?JocAsXpQhTHom+iM2PU0kKd/R+JNyHhZ9teXpeb4XGji2uMbWwgIy0NDMB?=
 =?iso-8859-1?Q?LVEaIbyGG/R9+davE+tKulMRcHJGBnblriR60Ldw6dgQS9UAna76c4PEd4?=
 =?iso-8859-1?Q?sCSF7iXcZknIONShoGf9fmp4211r6D5v02GGuWZWurBRMONt4OQfWxcGRh?=
 =?iso-8859-1?Q?Rrm74t3lq15geGe2pf/6jbpLbgbNTDO7H+fo/tzvehjjtjnFSBH4nesuKh?=
 =?iso-8859-1?Q?McroehNXQs4DLWieO6ZZ/LiTSjE04YTEU+M/N0ZFffksbpnM1ZsCdoWz61?=
 =?iso-8859-1?Q?PVWQsQsFhtd5TGMmrXoYfMcibpy7K0/xWb/D4eSys3bbSs2GkR+t4q5JKD?=
 =?iso-8859-1?Q?bJONuTnVxaXSSGnpWivTCeg81NrSVuo44pfpR/QjAr218n366/BHSA2Rco?=
 =?iso-8859-1?Q?1xRtOX5J6ESxo67YsjpP56ZYsfNI70XFF5iBpU6h2qdfJIubGFRGkWgNET?=
 =?iso-8859-1?Q?f/wGOGtdjClAOEUxnreIqC3WiSTLixNN5N1MP0E64rdHNthqhyT74TRx47?=
 =?iso-8859-1?Q?k1aRVwoyAIGiyWrOOZGwN81/EplncA+qKGVYyjTZvD7LVfvAnmwqHYWuY9?=
 =?iso-8859-1?Q?syNJHGmk4ieaXxoZn4RYfSpWdB6u6mcuqUEz0aUUlM5omNlCLBp5x/2/K0?=
 =?iso-8859-1?Q?fzQ723+Vb92DigNXovfoR/lfNocrHXRHbZYr+TawIUa+Brnd1iwqCX+ywl?=
 =?iso-8859-1?Q?a+ueyJTEj+rfMXINRWqDbUU9IOFNLsg6dPwd9f5AKKN/4wF921/H17UJYm?=
 =?iso-8859-1?Q?L+xWYx5KD3ibWYBK+2qPX3LLllhl71HbtVVTRAQcB+7aXtp4o4Oj6Cnzsp?=
 =?iso-8859-1?Q?SGDsn+ohOO5V9JMSVQ+pxMmkDIalwRpqpKKSjecSUIkMpzcxeSKMgAYLzH?=
 =?iso-8859-1?Q?+9bgszil/R6ux8Zm54GJ5/WMk15sqBh50twphSr2qBU74f6+Xh6GKuURrR?=
 =?iso-8859-1?Q?8YCqJCQH2OzLn/w+vjbCS6w00RNsqZKH4smzhzgr9Iv1SxIUetGAsARnjJ?=
 =?iso-8859-1?Q?QMiwMgpDGrpm9PH7Kas0WO2vm1iWQOmcOmqzhewJRYYxV3fpeJ53f6uAc1?=
 =?iso-8859-1?Q?b662nGIK2BTdHioVO6rAcMPe1ZT7F/GunIKpe27ERUgucgcgHzjho2Qw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc941935-d130-4ed5-2b75-08dc4de7f071
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 22:56:14.8163 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6dww2e0jJ+GLJqF2xMeBVk1HSmTngt0x/r+0gOdWEyxNa6uW3yYpZXwDmnpds1nWVqYWnHCiDTh1ux6NsVnQIDCZrTIYAhtrT3CdkHzbZMI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7174
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

On Mon, Mar 25, 2024 at 09:54:31PM +0100, Nirmoy Das wrote:
>Hi Lucas,
>
>On 3/22/2024 5:11 PM, Lucas De Marchi wrote:
>>On Thu, Mar 21, 2024 at 05:11:42PM +0100, Nirmoy Das wrote:
>>>Refactor xe_sync_entry_signal so it doesn't have to
>>>modify xe_sched_job struct instead create a new helper function
>>>to set user fence values for a job.
>>>
>>>v2: Move the sync type check to xe_sched_job_init_user_fence(Lucas)
>>>
>>>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>Cc: Matthew Auld <matthew.auld@intel.com>
>>>Cc: Matthew Brost <matthew.brost@intel.com>
>>>Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>>---
>>>drivers/gpu/drm/xe/xe_exec.c      |  9 +++++----
>>>drivers/gpu/drm/xe/xe_sched_job.c | 18 ++++++++++++++++++
>>>drivers/gpu/drm/xe/xe_sched_job.h |  3 +++
>>>drivers/gpu/drm/xe/xe_sync.c      |  7 +------
>>>drivers/gpu/drm/xe/xe_sync.h      |  1 -
>>>drivers/gpu/drm/xe/xe_vm.c        | 10 +++++-----
>>>6 files changed, 32 insertions(+), 16 deletions(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
>>>index 7692ebfe7d47..9d53ef8c49cc 100644
>>>--- a/drivers/gpu/drm/xe/xe_exec.c
>>>+++ b/drivers/gpu/drm/xe/xe_exec.c
>>>@@ -249,7 +249,7 @@ int xe_exec_ioctl(struct drm_device *dev, void 
>>>*data, struct drm_file *file)
>>>                goto err_unlock_list;
>>>            }
>>>            for (i = 0; i < num_syncs; i++)
>>>-                xe_sync_entry_signal(&syncs[i], NULL, fence);
>>>+                xe_sync_entry_signal(&syncs[i], fence);
>>>            xe_exec_queue_last_fence_set(q, vm, fence);
>>>            dma_fence_put(fence);
>>>        }
>>>@@ -359,9 +359,10 @@ int xe_exec_ioctl(struct drm_device *dev, 
>>>void *data, struct drm_file *file)
>>>        drm_gpuvm_resv_add_fence(&vm->gpuvm, exec, 
>>>&job->drm.s_fence->finished,
>>>                     DMA_RESV_USAGE_BOOKKEEP, DMA_RESV_USAGE_WRITE);
>>>
>>>-    for (i = 0; i < num_syncs; i++)
>>>-        xe_sync_entry_signal(&syncs[i], job,
>>>-                     &job->drm.s_fence->finished);
>>>+    for (i = 0; i < num_syncs; i++) {
>>>+        xe_sync_entry_signal(&syncs[i], &job->drm.s_fence->finished);
>>>+        xe_sched_job_init_user_fence(job, &syncs[i]);
>>>+    }
>>>
>>>    if (xe_exec_queue_is_lr(q))
>>>        q->ring_ops->emit_job(job);
>>>diff --git a/drivers/gpu/drm/xe/xe_sched_job.c 
>>>b/drivers/gpu/drm/xe/xe_sched_job.c
>>>index 8151ddafb940..bfbce9b69087 100644
>>>--- a/drivers/gpu/drm/xe/xe_sched_job.c
>>>+++ b/drivers/gpu/drm/xe/xe_sched_job.c
>>>@@ -5,6 +5,7 @@
>>>
>>>#include "xe_sched_job.h"
>>>
>>>+#include <drm/xe_drm.h>
>>>#include <linux/dma-fence-array.h>
>>>#include <linux/slab.h>
>>>
>>>@@ -17,6 +18,7 @@
>>>#include "xe_macros.h"
>>>#include "xe_trace.h"
>>>#include "xe_vm.h"
>>>+#include "xe_sync_types.h"
>>
>>wrong placement, otherwise lgtm
>>
>>Feel free to carry by Reviewed-by: Lucas De Marchi 
>><lucas.demarchi@intel.com>
>>with that fixed.
>
>Could you please help me merge this patch.  I am having issue with my 
>dev machine which I use to merge patches.

Applied to drm-xe-next, thanks!

[1/1] drm/xe: Create a helper function to init job's user fence
       commit: 5dffaa1bb94a6bc75393476fbe3c8a704ff4fcf8

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>

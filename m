Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED99C47DD9
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 16:13:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25B9C1125C0;
	Fri, 22 Mar 2024 16:13:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hm11WwhG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18A581125BF
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Mar 2024 16:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711124034; x=1742660034;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QCUKBYECXo0/lOAVZmctym7Qf9pbZrxvsY61sn/+600=;
 b=hm11WwhGQclzZy8OLnYC709bBJNfosAG/M0KEav5ljcgEhpCf4UBy3mP
 7OiziBNYtPjfBCUqhfPuSkE+SMGcpRwiR5+PEYD67WD7ZT+3jVACbb6Lu
 WzKOJf7l7v62jyWol+2oDg7+71g6IRp2L0ycMRJoesv0GQY0ZWGrZXAr0
 6H7p21f4X5Y32FleePltn8WuBCS1Pu2YWQMQ22q0nmZW9/kv5+HKH5GaE
 fW8GH6pUNULX0IrJJLzaocTGFZfuvcIrZjKLbCflR9Z7EDcQYnHebGzJw
 lkxtTJqvmQT/41UwwTx0sPuTXO513huAAw9yQqjo/jB6ErQcQSadVAQN8 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="6079827"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; 
   d="scan'208";a="6079827"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 09:11:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="14989842"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Mar 2024 09:11:52 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 09:11:51 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 09:11:51 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 22 Mar 2024 09:11:51 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 22 Mar 2024 09:11:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ct7LnZ40+7lVUFWA0UtXU02qRDo3YK9Spk1sDKsQfsD2ezDPJZnrgfWJSBdJLj6SHNlKAY8olcQyo2s54mufng5zIYEmT2jnKhZ3U3FduW6IDyvQzVM/rpS8WFKx7Pnu32jdHSTDoY3zRkfLrLYh4mdwISFffPlfU3ZlheOOJoyVepMgzKDoKfrhfnrVpPXGnj/jAJSPOLdCb4h0foUZDOaQ1itLiAGLIUzW30QhQ3R46xqBW7AVLCV9m+D//rUUSba5RkboTIeU8prLr90r+vP3C33yLnzQGFiNuzONwD4iVpNz3gDDjk8rU4IVks+pwsuqRFox4/vndGPKzhuuVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y7oLvQJPXtT4pLQKe8trDu1WwH71sRtmvlBBJ93DccU=;
 b=JtgMl1uZqDui8AIzufIsKjzyEcGsnDZaEOjh/jRxB0JMxW63rFU5vDTGo526CNNZ9W8aYaSxk5Ymd/u31P6ayJv+KVYfpF7BxIzYm8LLdxiMKWgA1l/OEYjfgEveDGOomC/kOc8/vRFvAYSn4BQ8bKJGBwm4Qguhz6/OKxY1pqvL0J7EmAmCHWnmiBO5bDZ2EXENJF+neEowTGKjTqyvq2uUKayg5cATmDT20SxFTRpIKHtQV/QB4kLnQaXLYt/iGA0sVOzOJ3F16S22mlj9kM4WJN0w7zcn5DdLnUCDFDiWdzMjeE6ZNCne9dqqH4BPSsfhIC5kO+3Xmn4J3n0I1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN0PR11MB6230.namprd11.prod.outlook.com (2603:10b6:208:3c5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.23; Fri, 22 Mar
 2024 16:11:48 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7409.023; Fri, 22 Mar 2024
 16:11:48 +0000
Date: Fri, 22 Mar 2024 11:11:45 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v2] drm/xe: Create a helper function to init job's user
 fence
Message-ID: <vgkvzpqwyku2q5lomqvytpeuz7hvybykd4rnetzkgy3siy3c57@jclsubzhsmts>
References: <20240321161142.4954-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240321161142.4954-1-nirmoy.das@intel.com>
X-ClientProxiedBy: BYAPR07CA0087.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN0PR11MB6230:EE_
X-MS-Office365-Filtering-Correlation-Id: d5517882-9d92-413d-19d8-08dc4a8ac6c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F+RpZnciEtWULkKakViUZAnAoSh4cxDl749YnfDNeRIo943Dl0K2lGxg2K/hN+dECdSmiQNSENFHr08/Q3DVw3JmIkv8GeijC2QmVdUqlfG84jk67y7kak8tWe4aTqAo4Dm3JyMuGlrX/hJueMtClJL9nsb6tNohG31SwDwMy7Qb8ldrqqTVaqdX+bKSuUR49dRM+4OCOR7FTaPvygXnvrN5BktHmTW0yKEyGwu0mj9DcWKNO1uzuzI/CHYFuccF1jzSdY+Rg4HESE3U935cYbwym/BT8tUg/E/O/jaAWxRXhlqF+/4KYZb6xOq4jxXEIZlqhkGRvoyLdC8N5vEb2PqN1xFZ/JIGWQd90IX7eQRcWTLAwXhkr60dn/ycYGhPRNl6FtNLcNUQvlfpJpx3SIbIxmg5EJczOHGNWOVp5TSwFTS+8HNzQ7G7YlpC7jSXkkFlslLN+VyskQQT0hTMGCwnHEUmhzwy2qAS9pbMb1X4vPkyNuUB4tTWnmRDex44sAAqOTmhPgXEU9AWTrlpfcvUUhd+Jm5W2KeFQQ/NIC0onTAV0KbvJ+pN5NUTFIWrlY+VGX6Xeymre0iB9WAtu9Ua4oUpn2EzaWUMevnwAwu7NIV1Gbt0VD8q88YqNxuIzf3wPLbuZxuLwtePT0k0pnRiVqgLIr3TVP/K63d7ReDrbiuk7xHqPtUeBqFz5XYGkp/Bq7O2gnxpBoDmn0Sltw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(27256008); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yx5vHy22bfBEjkQGfypA7DsFzFAZw4IUHnpZ5ZbSnuLwW22b9qng+GTIsQEz?=
 =?us-ascii?Q?XJUDJokrbS6Vn0230J85fKr0JuIQjIUK2oMNdb9Dg2v9woY4owy/FamjFcj3?=
 =?us-ascii?Q?Gm1Jit8jt8Tb4gcHaAR/lCIJgRFSQm4hXbFwAVLjaX+T9fwRAtWVLcChCkzh?=
 =?us-ascii?Q?Z8UOgDR6eUm+kWc2M5kitmt930vW2Mu+s4Y6jMTJ/yzd8HhUzKPDRbK4sUzE?=
 =?us-ascii?Q?JJ7S9NzL/OkwZ8Gp8JWeHxMv1suy+/aDiJfTvIaBV5pdf4DW3KuVgnKqghfe?=
 =?us-ascii?Q?fQKDFIagaQEAofAwpyyc59txP7cFg6h7M8vvZwp/Ay6oaJV2G1PzvWmZseB4?=
 =?us-ascii?Q?1CXEuzqo+dh0pX8qsnGc7EmbsObaYlBgz6da92Wl19TlaLEPLtNesx7xChdO?=
 =?us-ascii?Q?jFNFLdplsrMiy+qu6SfVZEAx2UNI6zfV7kxEllE2z9BQLg69sscRxyU0oEay?=
 =?us-ascii?Q?dGfv3b+2wg79Exr+hZWpfPaRrA2VgDCszyhD0GHflS7aTfpaqov8MFZhusQd?=
 =?us-ascii?Q?M+G9zGwy0IdX1xMJ+XJQ4l0iujow2fWII/3NobHir0D+fpMf0m38tQ1dp4xr?=
 =?us-ascii?Q?ZsW8AqDg6QSSt9UYvV5aH/7x4mCfAjbhmd8M8GHsO8jSSVMPpxGAwl9SXoV4?=
 =?us-ascii?Q?hmGe4bLMbuja80CYvLfF6CF5J1BRFt3cW+oriwl3oyRQyQWiFvEW/OYQCU/7?=
 =?us-ascii?Q?nqdW95h7uElMnFG0czZS8H+nNYFBsrUnlJIjx8bn7j3qoCrcDqD91xplXong?=
 =?us-ascii?Q?oPdOfalEu0NW2hooedbotEBXPG/k+W/X26wDS5jgwdPY6CF9T43MbIOkt/xS?=
 =?us-ascii?Q?7cmvYcDCONXeULKalrbkvtg9urQ/rG6W8LqIb4taelSFeaBd4iH7fzdGNuHj?=
 =?us-ascii?Q?vStzs7TdX5NjpaUBmGFPSoSY8jzKg0GXW8aZOqtAH3joi+oMOoPYE+o++qYF?=
 =?us-ascii?Q?CbwkcnUtRiJmBw7mTUuGlkuifz6kpxAhV+LlRwqUW5hGSNvBwpUG9tj0oj2L?=
 =?us-ascii?Q?9E10fPW8M0Ticy/1hQIBjwBGvW5jolM79dUORgf8lxbIwXCF2AeJbHoZi+gS?=
 =?us-ascii?Q?ytjuLVQMOB9yMcUSCgVQoip6Pdz9IV/LjuOCJx789RZsqGDrMUdX6ox2rbJ9?=
 =?us-ascii?Q?qf3ECGvcYMkV6drlzEuXVtt3B/LdM59l2QxplrZUJIzs8QTkfQWY2itjuZe8?=
 =?us-ascii?Q?f1RiptS2iRAnQXm1xBccI9deRkzHMdKXZUPW6ueCnTNp33XUEePsHD8Ev+oL?=
 =?us-ascii?Q?eCBMvzLZRpEv00j1ggMlFVFHHZODXgivImHkeCwPxNCU11Vvt+RNUWjZM40J?=
 =?us-ascii?Q?P1YUSiGhTbq357F1f4s98HikwIL7XD/RP2NQwGFIWPdGlbriBTvWDcoJKdDh?=
 =?us-ascii?Q?Rx2/NFJqsU+SIOUkQxvA/XQkoLu6j5R2hp9OtiURi6TwmVVGnXp19M3Is23b?=
 =?us-ascii?Q?On5AOeWlAsxMqmByhSYGk2ISm/ZKBRxw/5ULEUIBuNGczpeXxEEl0H+f4S9e?=
 =?us-ascii?Q?eA4qeQuhnfU6yLiKqhGExfaYIo/nJDHxcizjORJnDA6EK5ES6h8U/BskEDvU?=
 =?us-ascii?Q?4grz46yd0FboFcfgUZDw00r0NAs6JTpfBe2eAw64di0eMdIKaTZuTu5okwLE?=
 =?us-ascii?Q?YQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d5517882-9d92-413d-19d8-08dc4a8ac6c6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2024 16:11:48.2396 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FRKJgrkHrxV2aV0q8cXv0XxKoT9HbqieUkL+qRuw2mNSDWOLkLXNJN7zWgXtJ8gSjcycr41qsXACBASIGSSP5zOqbGJzjjm8qFMzyLHf77M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6230
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

On Thu, Mar 21, 2024 at 05:11:42PM +0100, Nirmoy Das wrote:
>Refactor xe_sync_entry_signal so it doesn't have to
>modify xe_sched_job struct instead create a new helper function
>to set user fence values for a job.
>
>v2: Move the sync type check to xe_sched_job_init_user_fence(Lucas)
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Matthew Auld <matthew.auld@intel.com>
>Cc: Matthew Brost <matthew.brost@intel.com>
>Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>---
> drivers/gpu/drm/xe/xe_exec.c      |  9 +++++----
> drivers/gpu/drm/xe/xe_sched_job.c | 18 ++++++++++++++++++
> drivers/gpu/drm/xe/xe_sched_job.h |  3 +++
> drivers/gpu/drm/xe/xe_sync.c      |  7 +------
> drivers/gpu/drm/xe/xe_sync.h      |  1 -
> drivers/gpu/drm/xe/xe_vm.c        | 10 +++++-----
> 6 files changed, 32 insertions(+), 16 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
>index 7692ebfe7d47..9d53ef8c49cc 100644
>--- a/drivers/gpu/drm/xe/xe_exec.c
>+++ b/drivers/gpu/drm/xe/xe_exec.c
>@@ -249,7 +249,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> 				goto err_unlock_list;
> 			}
> 			for (i = 0; i < num_syncs; i++)
>-				xe_sync_entry_signal(&syncs[i], NULL, fence);
>+				xe_sync_entry_signal(&syncs[i], fence);
> 			xe_exec_queue_last_fence_set(q, vm, fence);
> 			dma_fence_put(fence);
> 		}
>@@ -359,9 +359,10 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> 		drm_gpuvm_resv_add_fence(&vm->gpuvm, exec, &job->drm.s_fence->finished,
> 					 DMA_RESV_USAGE_BOOKKEEP, DMA_RESV_USAGE_WRITE);
>
>-	for (i = 0; i < num_syncs; i++)
>-		xe_sync_entry_signal(&syncs[i], job,
>-				     &job->drm.s_fence->finished);
>+	for (i = 0; i < num_syncs; i++) {
>+		xe_sync_entry_signal(&syncs[i], &job->drm.s_fence->finished);
>+		xe_sched_job_init_user_fence(job, &syncs[i]);
>+	}
>
> 	if (xe_exec_queue_is_lr(q))
> 		q->ring_ops->emit_job(job);
>diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
>index 8151ddafb940..bfbce9b69087 100644
>--- a/drivers/gpu/drm/xe/xe_sched_job.c
>+++ b/drivers/gpu/drm/xe/xe_sched_job.c
>@@ -5,6 +5,7 @@
>
> #include "xe_sched_job.h"
>
>+#include <drm/xe_drm.h>
> #include <linux/dma-fence-array.h>
> #include <linux/slab.h>
>
>@@ -17,6 +18,7 @@
> #include "xe_macros.h"
> #include "xe_trace.h"
> #include "xe_vm.h"
>+#include "xe_sync_types.h"

wrong placement, otherwise lgtm

Feel free to carry by Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
with that fixed.

thanks
Lucas De Marchi

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB0A1C54E58
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 14:44:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D1CA10E4C7;
	Thu, 21 Mar 2024 14:44:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JYW7Pqyn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9FCF10E4C7
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Mar 2024 14:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711032242; x=1742568242;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hhwX6MikvUXl/vz5TciVkcY0R9i+hVnvUY4O6uZvxYM=;
 b=JYW7PqynXlaSVyU1suZfmKgWLmSQUID+yrtrKwvroEuHp1UxRsIncsRp
 Ze0hY/hFOPaDyLoOq3YSuFJlDXHCvL8PyNOONe3J5igCPB1z8hKU0CJem
 q/qCKhYyuqBUCRCQGG/5ruBzcq+Flo9QigtYCCg8hnjqgBdcN6W13hsHO
 LFj8oisfGEZYHMFgdCVUa2lU/yDf4UYARFMBm20iPwLjsNzlT3ymyeVIp
 QuQDltuQZ0PZMJaBcbY1Pk/M1EO1+Xn22Jt8bkA0O0XcBAyUXQY2wlydj
 4kcSCSnsIzEbaaX7MMz1mLnewo1KeXRXLAX4KP0ezmAJ+t13NLqcSZyVu A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="5874678"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; 
   d="scan'208";a="5874678"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 07:44:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="19178401"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Mar 2024 07:44:01 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Mar 2024 07:44:01 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 21 Mar 2024 07:44:01 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 21 Mar 2024 07:44:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YPAp2JxlkrryPz2AL8rZBCmdW7etnYknjoc5948TRpNY7DF2LeTX9yelteWBS/wZDmI/32cbAH+p+ik2oZ4U1qrWI9DDTes021CFa9jHvn1Z0S651+LRJ5yqR1usZxJmNXsWhXwvw1cMjPZt5LuqsAoor0Xzu2HzAeZDcm5btDcyfgUqMqOwCEwX6JUNbgkK/TcB0QHFnU6NU8eDMIapd3N1k114R3jQWbo1WnqHRc13G7mMW2GwRR4ZnaRfZK1vpOBnPROJFa2h06HfNZU7EMHyYVc+YiwLYl13Nt20+XKOh+CxclOLbWxAmFvKuul0A3NViGbHxM1lxrN/1dIIyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oL48TxoSjOykWISLNRNiiJiKz6gTD1vPz2pTJtH/VZM=;
 b=CdmCwAmXNBA6UejfLQ+6QrzVGhT7w3PZIsv81+UvnBSiZh+NP7gBg0h4BnuzaPT7p+7CS8TE/uGoyKkYuaRFID+vLsqnXEPRLI25i1pUVJK51QuQbZ5UJlqP8zJUNdGeIB6Wd0MbCvn+yyMZvF7nF9e+vnQE/qb7wDZMndzqRqYKIBVeWsT4JOJHB5eSFEsa0nIDgKjYFp+2W4JH1/PYaBOc6Tb/Cd40ckCQd9AONFHSEevSCyx0UKPurrlLUB7nvA0CF6rweFvfQtBnpuaKotQ1Mx93anYAwfIyKubNVbA4y9daBcVSxKSYj5O6NozIMB32TqkDXXOi0ClY9JB5Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL1PR11MB5304.namprd11.prod.outlook.com (2603:10b6:208:316::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Thu, 21 Mar
 2024 14:43:58 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7409.010; Thu, 21 Mar 2024
 14:43:58 +0000
Date: Thu, 21 Mar 2024 09:43:55 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH] drm/xe: Create a helper function to init job's user fence
Message-ID: <3xjcawjh2o2v524hxp3pm65l3mrrsm6dsn7vvlic5baucfzow5@ceyr5a76ex7a>
References: <20240320124556.10337-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240320124556.10337-1-nirmoy.das@intel.com>
X-ClientProxiedBy: BY5PR17CA0036.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::49) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL1PR11MB5304:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bd43e8b-660b-4d58-34bc-08dc49b5575a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s2jD/LyuaUJU8WAZHaOfzXnCrKN5zxxHxx5AxYpKBKI/wcGLECsZl/X9jjIYWJNvh0Tz9mEX5dpFvmTMeUreKj5c45Kbm4hURYAi8eTBWqRxx74cLOaM8//86nwb0ALDQMUOwGuaVzcFuKpzj6Bdwg7Zsvu9uh8AG7XqqofEiNkFbzj1eUcJBlMzppg5G/6TQgJlzYxv0w3m8djgfhtgj9mPa69854Hye0lAP4gcJ1+vX7S9E68yBlLheMinONR7O4fCl9zx5f9cbzSqP/Z2i8Lh+YN5Ou6EUl05eR3Mdn1yTFO7C+VRGodc77CWkHdXymhpHixacRkansm1mVdWZna+LThkgwOvJ2zS3WPmCpGc2xajx+UEjsNclG02Io3RNVmtBKcCnSMFM7eNfNjJ5sU4ua9tjcQhYW8z9fNPmWHvM891GeC05AtcGXnDdnU3MUoJDzoIB/gYyxuSmosXuO9Uz/rX18PSPP3tS/BgdNPlowvv7MffE9ryrcehq1bsYx1GCVPlfE62+DPXV/lnRN4XZMtpHSJn6xG2NsnwHgqO/Mqam3UqYQ3IbXAP9VDIqRhblc8qeVNjf6ksgiev62Rezacg5fkDHFvMhA+Lcf+AuLO/g5onfFiQTueEkCg47xG0C/0c8dUDlceGD+O9kpj3tX6EBNk/PYnx8DP8Ttw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BLHmzoVNx9aR1OfGz3lcMVHqbV4v9ZQfnaKjhhHcR+dyHaIsYM2lNACgFrMg?=
 =?us-ascii?Q?AgYmXcgDxd6pfe+zCKc9Ez2XSuEpBI23Gjjwu7jU1/TeK3H8wnblcDIPdS7n?=
 =?us-ascii?Q?KeNqGUA17miuCBtjybHfd3jwwkKautm6wmE0ZV3vt8U8ohZ8n2pOo8r+SHyI?=
 =?us-ascii?Q?qQGOJYOKXhwXTXZzAfOmjKoVrnHUCy0cstPJWVIIbcAZnDh3SvtxUa54+bKe?=
 =?us-ascii?Q?HMO+GNpyuhLeGc3YIhstMQD9CEjtP1KDPS2rQ+pH1nlklw8leLBggF2fSzPk?=
 =?us-ascii?Q?fmewrRdGGiQNQfRrZwkqNSKN8RU4qSJTD1rzw11RUx0qd/Wt4GiRhhDUieNY?=
 =?us-ascii?Q?Pt6X2mtugc6FKJa2NdlF0cPawmczzacjBhOd6LnDCkwZWjNYJly0BZhfXCsE?=
 =?us-ascii?Q?F2b7K5AsnetoWTFzMgF0Yj9Y32Hftitua0KfcAUUn9kaRooynY1Azvrgz9Xr?=
 =?us-ascii?Q?O0WmYP+1gCXaGt8l6IdwBnAArD9vHiR3RFDwLNpkUFjuQbPgDcFjdbn2kNzb?=
 =?us-ascii?Q?AhOhw8Cp+ccCN+P8Ed39Sq+2b3M4S5oiDzTkOdHtUJ0qmm6WrU3Bduy02sUL?=
 =?us-ascii?Q?YMkOmxk6adQwVl48V5L1Zroiniwrb4pWOaO6G2zsh7XTZ2jVo+C+SdGlNg4E?=
 =?us-ascii?Q?I4bmLlLAXU3QZdODXm9o5MAAr+LtjdKzTVgTKrVix5yfFj0ehi4i+3cGu4KU?=
 =?us-ascii?Q?+pM8uIKt4nQvxaYgpBPRUAIc2k+dmz0G0Z8x8qirUFephTQGhSRESQfJ1Sei?=
 =?us-ascii?Q?YIxk9nJRbP30H7hwAiPOi5R6JkyYg87K81idMkLmY9c2GCkmrb3DWWm4eIhT?=
 =?us-ascii?Q?5EcshwWt/vndWV0elcFR6bkzcUKF/QDQLsI2vOESKlu769tMetJ3VNBhcFJx?=
 =?us-ascii?Q?l9JTtChstrLEy6chbW4An1YFmVdTICYu+/NasNdyNR3etdk6A+sEoMCFUcV7?=
 =?us-ascii?Q?afi1BxsHe4/cHU5h2LJ0oBeZ6cMfN6hFhK66WxvIGYI92cfjU2eS7TIjDDwD?=
 =?us-ascii?Q?Nx0fFHSm1hyBALWR7ZhKJg0fb97/EPROyQi2iYGI/orUGi4J8Nd+qEzdo7Nc?=
 =?us-ascii?Q?Vomot9h4zNmUzhM2cfg9CVrdAdJNDj0ySkNm9B1RYMjc9nA/WxlSrdVNaRfQ?=
 =?us-ascii?Q?gM2+/Rda/vedy9ufzwmb6QfKInM0lWmbhOkrHajwvCqz6+ACm1baOqxFHrd6?=
 =?us-ascii?Q?5sAJadvZ+DFDUONBV4mbhfRcNFYKGxfyNvbymily0RcBOg0YNHeqwXXRgFGr?=
 =?us-ascii?Q?BcPan2wkUk6mVuuwsU4yaEdyXKYMD8yjeDP1ZNuROm6gHSADBfuv53QaSflu?=
 =?us-ascii?Q?myaXZj+TcPSK5Ko6sqvdem7QYpi4b3LM5bRMqw/iwFfMM12eZ6hc4yqfe5XD?=
 =?us-ascii?Q?VTBDG8Dzgt5k40j2BMDWEjQjz/8yM8iQQOKMytgzbyBQlRG9B6W/w75B7LQJ?=
 =?us-ascii?Q?aTwZNxL1fiE38ggF/y3hR23d/8J7vD+egpkAJe/zW4t3nb32mReE5yh8Qqul?=
 =?us-ascii?Q?eNfC13JgiDGksFMatTRFlzizsL6D/HkSeKN9RoEnTiTF0HqeUiplbIYtRnvi?=
 =?us-ascii?Q?VGdmJiRDBwiFI3rCI2jKYNXu7xxX9GrcQuJ27gN6fNrxRHR5lCPkR9sxnYFI?=
 =?us-ascii?Q?aA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bd43e8b-660b-4d58-34bc-08dc49b5575a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 14:43:58.5596 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n8zjgTM7gB2rAuFiAeprp++YkmmAiz0TWVp1LkWRdnU3xRuDGRsgBrgN2/dHot4bI1/VDxSoTNyUgH9oWId4dF+c/YLEt/alxWarv9KKxwc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5304
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

On Wed, Mar 20, 2024 at 01:45:56PM +0100, Nirmoy Das wrote:
>Refactor xe_sync_entry_signal so it doesn't have to
>modify xe_sched_job struct instead create a new helper function
>to set user fence values for a job.
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Matthew Auld <matthew.auld@intel.com>
>Cc: Matthew Brost <matthew.brost@intel.com>
>Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>---
> drivers/gpu/drm/xe/xe_exec.c      | 10 ++++++----
> drivers/gpu/drm/xe/xe_sched_job.c | 14 ++++++++++++++
> drivers/gpu/drm/xe/xe_sched_job.h |  3 +++
> drivers/gpu/drm/xe/xe_sync.c      |  7 +------
> drivers/gpu/drm/xe/xe_sync.h      |  1 -
> drivers/gpu/drm/xe/xe_vm.c        | 10 +++++-----
> 6 files changed, 29 insertions(+), 16 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
>index 7692ebfe7d47..1fb4dd4d0557 100644
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
>@@ -359,9 +359,11 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> 		drm_gpuvm_resv_add_fence(&vm->gpuvm, exec, &job->drm.s_fence->finished,
> 					 DMA_RESV_USAGE_BOOKKEEP, DMA_RESV_USAGE_WRITE);
>
>-	for (i = 0; i < num_syncs; i++)
>-		xe_sync_entry_signal(&syncs[i], job,
>-				     &job->drm.s_fence->finished);
>+	for (i = 0; i < num_syncs; i++) {
>+		xe_sync_entry_signal(&syncs[i], &job->drm.s_fence->finished);
>+		if (syncs[i].type == DRM_XE_SYNC_TYPE_USER_FENCE)
>+			xe_sched_job_init_user_fence(job, &syncs[i]);
>+	}
>
> 	if (xe_exec_queue_is_lr(q))
> 		q->ring_ops->emit_job(job);
>diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
>index 8151ddafb940..734900b9c7d2 100644
>--- a/drivers/gpu/drm/xe/xe_sched_job.c
>+++ b/drivers/gpu/drm/xe/xe_sched_job.c
>@@ -17,6 +17,7 @@
> #include "xe_macros.h"
> #include "xe_trace.h"
> #include "xe_vm.h"
>+#include "xe_sync_types.h"
>
> static struct kmem_cache *xe_sched_job_slab;
> static struct kmem_cache *xe_sched_job_parallel_slab;
>@@ -278,6 +279,19 @@ int xe_sched_job_last_fence_add_dep(struct xe_sched_job *job, struct xe_vm *vm)
> 	return drm_sched_job_add_dependency(&job->drm, fence);
> }
>
>+/**
>+ * xe_sched_job_init_user_fence - Initialize user_fence for the job
>+ * @job: job whose user_fence needs an init:w
>+ * @sync: sync to be use to init user_fence
>+ */
>+void xe_sched_job_init_user_fence(struct xe_sched_job *job,
>+				  struct xe_sync_entry *sync)
>+{

here we need either an assert that sync->type == DRM_XE_SYNC_TYPE_USER_FENCE,
or we remove the check in the caller and just silently return
if type doesn't match.

otherwise LGTM.

Lucas De Marchi

>+	job->user_fence.used = true;
>+	job->user_fence.addr = sync->addr;
>+	job->user_fence.value = sync->timeline_value;
>+}
>+
> struct xe_sched_job_snapshot *
> xe_sched_job_snapshot_capture(struct xe_sched_job *job)
> {
>diff --git a/drivers/gpu/drm/xe/xe_sched_job.h b/drivers/gpu/drm/xe/xe_sched_job.h
>index f1a660648cf0..c75018f4660d 100644
>--- a/drivers/gpu/drm/xe/xe_sched_job.h
>+++ b/drivers/gpu/drm/xe/xe_sched_job.h
>@@ -10,6 +10,7 @@
>
> struct drm_printer;
> struct xe_vm;
>+struct xe_sync_entry;
>
> #define XE_SCHED_HANG_LIMIT 1
> #define XE_SCHED_JOB_TIMEOUT LONG_MAX
>@@ -58,6 +59,8 @@ void xe_sched_job_arm(struct xe_sched_job *job);
> void xe_sched_job_push(struct xe_sched_job *job);
>
> int xe_sched_job_last_fence_add_dep(struct xe_sched_job *job, struct xe_vm *vm);
>+void xe_sched_job_init_user_fence(struct xe_sched_job *job,
>+				  struct xe_sync_entry *sync);
>
> static inline struct xe_sched_job *
> to_xe_sched_job(struct drm_sched_job *drm)
>diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
>index 02c9577fe418..65f1f1628235 100644
>--- a/drivers/gpu/drm/xe/xe_sync.c
>+++ b/drivers/gpu/drm/xe/xe_sync.c
>@@ -224,8 +224,7 @@ int xe_sync_entry_add_deps(struct xe_sync_entry *sync, struct xe_sched_job *job)
> 	return 0;
> }
>
>-void xe_sync_entry_signal(struct xe_sync_entry *sync, struct xe_sched_job *job,
>-			  struct dma_fence *fence)
>+void xe_sync_entry_signal(struct xe_sync_entry *sync, struct dma_fence *fence)
> {
> 	if (!(sync->flags & DRM_XE_SYNC_FLAG_SIGNAL))
> 		return;
>@@ -254,10 +253,6 @@ void xe_sync_entry_signal(struct xe_sync_entry *sync, struct xe_sched_job *job,
> 			user_fence_put(sync->ufence);
> 			dma_fence_put(fence);
> 		}
>-	} else if (sync->type == DRM_XE_SYNC_TYPE_USER_FENCE) {
>-		job->user_fence.used = true;
>-		job->user_fence.addr = sync->addr;
>-		job->user_fence.value = sync->timeline_value;
> 	}
> }
>
>diff --git a/drivers/gpu/drm/xe/xe_sync.h b/drivers/gpu/drm/xe/xe_sync.h
>index 0fd0d51208e6..3e03396af2c6 100644
>--- a/drivers/gpu/drm/xe/xe_sync.h
>+++ b/drivers/gpu/drm/xe/xe_sync.h
>@@ -26,7 +26,6 @@ int xe_sync_entry_wait(struct xe_sync_entry *sync);
> int xe_sync_entry_add_deps(struct xe_sync_entry *sync,
> 			   struct xe_sched_job *job);
> void xe_sync_entry_signal(struct xe_sync_entry *sync,
>-			  struct xe_sched_job *job,
> 			  struct dma_fence *fence);
> void xe_sync_entry_cleanup(struct xe_sync_entry *sync);
> struct dma_fence *
>diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>index 80d43d75b1da..497e49b867fc 100644
>--- a/drivers/gpu/drm/xe/xe_vm.c
>+++ b/drivers/gpu/drm/xe/xe_vm.c
>@@ -1696,7 +1696,7 @@ xe_vm_unbind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
> 		xe_exec_queue_last_fence_get(wait_exec_queue, vm) : fence;
> 	if (last_op) {
> 		for (i = 0; i < num_syncs; i++)
>-			xe_sync_entry_signal(&syncs[i], NULL, fence);
>+			xe_sync_entry_signal(&syncs[i], fence);
> 	}
>
> 	return fence;
>@@ -1770,7 +1770,7 @@ xe_vm_bind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
>
> 	if (last_op) {
> 		for (i = 0; i < num_syncs; i++)
>-			xe_sync_entry_signal(&syncs[i], NULL,
>+			xe_sync_entry_signal(&syncs[i],
> 					     cf ? &cf->base : fence);
> 	}
>
>@@ -1831,7 +1831,7 @@ static int __xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
> 		fence = xe_exec_queue_last_fence_get(wait_exec_queue, vm);
> 		if (last_op) {
> 			for (i = 0; i < num_syncs; i++)
>-				xe_sync_entry_signal(&syncs[i], NULL, fence);
>+				xe_sync_entry_signal(&syncs[i], fence);
> 		}
> 	}
>
>@@ -2052,7 +2052,7 @@ static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
> 				struct dma_fence *fence =
> 					xe_exec_queue_last_fence_get(wait_exec_queue, vm);
>
>-				xe_sync_entry_signal(&syncs[i], NULL, fence);
>+				xe_sync_entry_signal(&syncs[i], fence);
> 				dma_fence_put(fence);
> 			}
> 		}
>@@ -2930,7 +2930,7 @@ static int vm_bind_ioctl_signal_fences(struct xe_vm *vm,
> 		return PTR_ERR(fence);
>
> 	for (i = 0; i < num_syncs; i++)
>-		xe_sync_entry_signal(&syncs[i], NULL, fence);
>+		xe_sync_entry_signal(&syncs[i], fence);
>
> 	xe_exec_queue_last_fence_set(to_wait_exec_queue(vm, q), vm,
> 				     fence);
>-- 
>2.42.0
>

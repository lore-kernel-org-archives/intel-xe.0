Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40471C48286
	for <intel-xe@archiver.kernel.org>; Thu,  1 Feb 2024 17:07:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C71BE10E6A0;
	Thu,  1 Feb 2024 17:07:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C/m0DM4e";
	dkim-atps=neutral
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Thu, 01 Feb 2024 17:07:33 UTC
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 177F910E6A0
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Feb 2024 17:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706807253; x=1738343253;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Vxn0ainwOweth9iF8oa+QRYZ6Y5UPXBX5x/SvT9sq7s=;
 b=C/m0DM4eSjVfU7VFHFnwSlQyz9tLYFsnHmsxsnUWTFRNysivo67GnEUB
 kYGF8iibGTf/UQCNRHb/j+FQZrjHUEDYa0Fap63tA9JHQtmuvp+Z8/WJZ
 hthLxAipN4yHplAXv6FtQDU+IUrEFiWRkUK8xDGA6QpxmAWU67OFEyew1
 aQ5/08SWY4+ckB4FRXz3raB1d+XW964Vrm1D6PxHXohZT6+CHWHCrWSCf
 In7TKhrBYI8S0VYN4Kae5AbzQVbnK0CS/RZx58W3STjBtS9+IGBLEsJxq
 7rBkUpRTjTZhRNYtA8uMU7bWCf1hLA6PePKneGj9E+ubM/xXE3yAa9tmF A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="162302"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="162302"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 09:00:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="4457960"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Feb 2024 09:00:23 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 1 Feb 2024 09:00:23 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 1 Feb 2024 09:00:23 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 1 Feb 2024 09:00:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NJ/B9LjG6PQvAUGdeHWQhZ07bJdxjVCM24suenJhfCv8oq64cVrlXkcOBSCYjGf6/2Dlo5xFp/z+yVAtWA7+glzsJaDGP/deOff5+luaTTqnVNOMpn8d+RPyv4So+HSzMVwaWtp8iV25HYbBsUGgyNCFEz6Xo07FzfBDMMRHBG0wrQcmoxgPdOyWraFp+REaqZt3UzSM+34iRmm6svaq67cD14a5lpic9OZfcS2FTfJ3ZXNGv+ob7xIAyHDqGDJiJ0vjhsLL6WUb/OV1C/Yy70x1bGjOcy1rrXkX2xIvtIxaEBhoLEgYvQ1ACwvsJj//ef1MK8qOkZNxUc6OV0uZsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NwpwavoQNqIFhuCmWUgv/wdGosnB0IIzzHhmi4SRLFM=;
 b=CYZAavNuk7M0es2kbbQqCpaIMPha0eWM4fnGe3/DxPZvlJaxDmQTDLkVskVxQea6S7DSsa8ixVgdB9P9b5Iz0qPifKQ8pbFnJauWV6x7SEiEdPdmjkHzfNWsoCeQbs3mYWU0zMHKSw945VaVYZ7+q8ArFTbu/lf/5cgrXqyjN9mwnEG8Lzusn5hkeTDWR/cmqb7tFHO9ev2Ty2hzjyLnj1tH5nGAxtpAC6o3obsGtTD6inAIXLDJlFSOzrFKbl5Fc+VOE5UamZXL774hUqW6V1ggnOe/KGYBTLh8SZ3EnubR5MrhR6s+u+FuJG1xBtrRamfZj6wmm0ZxxtgGJgaHnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by SJ2PR11MB7520.namprd11.prod.outlook.com (2603:10b6:a03:4c2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.24; Thu, 1 Feb
 2024 17:00:14 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::f6ca:b25e:ebc1:10fd]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::f6ca:b25e:ebc1:10fd%4]) with mapi id 15.20.7249.017; Thu, 1 Feb 2024
 17:00:14 +0000
Date: Thu, 1 Feb 2024 09:00:12 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Francois Dugast
 <francois.dugast@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 "David Airlie" <airlied@gmail.com>
Subject: Re: [RFC PATCH] drm/xe/uapi: Remove support for persistent exec_queues
Message-ID: <ZbvOHLXfSnO2qkbK@nvishwa1-DESK>
References: <20240130125220.5517-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240130125220.5517-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BY3PR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::31) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|SJ2PR11MB7520:EE_
X-MS-Office365-Filtering-Correlation-Id: e2787c83-3836-4990-f0a6-08dc2347425d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SxxBlQ8ooE2DgoK01nm1/GI+KJ+EsCPv9QQ3EASxUoBjoTYvzy1YF4baQphRr6oj4Gc+4bvEVJDUM4ps917PBBNTK/5I64U95eycVuZdCPcRMOqTJGjoknvZsot5DmaRWYSFU6l1PZunh3cpd/I6vn1xxd0ih/5RHeVSsNZSSWldkzWFhNmzVtpk5ZPlCfp3fL4oMQXwbWmuHltFC98Q0PGHpLQjCTnmwicgoU68Nc0lMYztaTi7G43EZMMUDRfm0IAon2rmXHianYg6FZTEalgxhUm2eMaui7eKfEvI16WRKIPqC9xTIw0N/0jTuKE28vlX1v2wAZ3Pb9/7KwS35PvrD90I7PH0ztc+a+Q/zDkOKQXOKIEmXwrXQfw3lUVus7J4sfw1srBxHaOkVDaHv5boej/ZTgBknPLZTp2hD+ZSgmLSsWYZNvnAeuufBs2mYVYCFRX127IWA7BcYbqzdzlfi498NM3NbhrlDG05kX//wVgLkbfqt8SnCo6y8z7HJeDvRI8cgAN2ZSd3mcIxn7G2OqczXb+usj6e/u0hCoQt4etKup5anXU7XHe59Lnueb1sFx8AxmUimp1inRTrEqSat3m+tpyip15a0mtaOgW4EQtiRsdGg8QkvZ8ugxx8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(346002)(376002)(396003)(136003)(39860400002)(230173577357003)(230273577357003)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(33716001)(26005)(66574015)(6486002)(54906003)(9686003)(66476007)(316002)(6916009)(41300700001)(38100700002)(6506007)(478600001)(6512007)(83380400001)(82960400001)(66556008)(66946007)(8936002)(2906002)(30864003)(86362001)(8676002)(4326008)(44832011)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ciUaZDCbs/4MBU5yQuV4/B1TDE91VLuOoy6uBp+/9relAPNLzqz7yEwU0R?=
 =?iso-8859-1?Q?yXJejPO9+/MmL7bJspF0c0R6pm1SNnSq0oQ3UUM2JX8EDEhBFlR1TzCTOq?=
 =?iso-8859-1?Q?y/kmz8jcfw5LHzfOwb51s07uKARmTnoi+Y0AVHFjzzDY0qe/ny7C5H2JtE?=
 =?iso-8859-1?Q?EmTCyLGdKlfznRIZPleBCgpvyDgIndmuOtXCLSqR24sdgCKSQo6HUhlt+l?=
 =?iso-8859-1?Q?frvFtyrHNkYUIABxHsPES9vZfISucm8nHlt97BeVVVgqDjYUs+QBqgsojo?=
 =?iso-8859-1?Q?WfpeRqv8hCDfNB+YXuNcQeBn9v3MCp5WPjOcNYlu21hPcU6i7UZupeJmIO?=
 =?iso-8859-1?Q?InlOaCTOUSrHq8GaS5ReXIW7+dBLGlbgDiCk5B5dWT2fxmR7Lfj0Lwh/c/?=
 =?iso-8859-1?Q?iQN51WQatwbxYrEcansQBAmphydU37eMy0T8LN4X129/S0Wgg80F9zEZGe?=
 =?iso-8859-1?Q?ZRPOen8c3gr9PBKfJEOFupZ4DbL7sJ5ZVFewf3KN31a1pPcMe4u69gLdW0?=
 =?iso-8859-1?Q?TxrsnCnCl4ih0ztmpqrC0Lx85CoO7gYguNS6oYphLoeOnlmNZLp1IVPrrm?=
 =?iso-8859-1?Q?8EKwTbpnnJlQRrqGj4rnGz3ad2Ytr7yrH7fIclUC3oG3p636yne3HQIt0G?=
 =?iso-8859-1?Q?hjKGGMeno6KSBsI8H0t56DgCK/Vqef+9Lug/blEQ95Q5nopIMU6zs+T8f8?=
 =?iso-8859-1?Q?biRoBjjyqhCmtQTU0H/zlDlOYQTzlaHnO1WFgQq+7CrVECmPwZ4giBI75O?=
 =?iso-8859-1?Q?MN48jnS68UBm46HFDKIFdaFwK+Lu/XxC6QU72n4oIxTABwjBADsbA29VPZ?=
 =?iso-8859-1?Q?GuGPc/KOBt13rdHWNCTmRVVHtTW7HUcuVOs5IbSZaR7Ue1Ar5swWYqRmMn?=
 =?iso-8859-1?Q?xR5x2sMtF3YehzS41ErMjVdfPELIHzHF+o/6Hqb9zIDPnpa8lGnVp2YfQl?=
 =?iso-8859-1?Q?BtQmmycsztb71IoFv96aM143LcQVjXXppQ4YotnBKQ7QaBHsyMnio1mBHs?=
 =?iso-8859-1?Q?z9RIUkCMDbTRf3oCSWZrQpsjp/LSdvUosRHn95lIkBihOkGeVlV6lxx+Bp?=
 =?iso-8859-1?Q?dzNds9rC+kEvjn6zByhLsG3YYLIRMI8ENeGVZajeakvxf4OoMaYOMD9teH?=
 =?iso-8859-1?Q?2k8ADJLWho+XKFKDvor90LZ1Dz6mU69LY1tKTzQKvgDEllON5YT+xBSzdT?=
 =?iso-8859-1?Q?EutF14C3Fw2E1pdNxqCmK7HKZVHVZCXlkCvrDKzkDTBluuQ1Mc1VmnOj+1?=
 =?iso-8859-1?Q?uok0MgGqDvuOC7YdmUd7CJXJ1u7hJeeC5NiZhKnDBvNQgEHAFVy4nMy13G?=
 =?iso-8859-1?Q?UZKJ3Ry5GtA/SU/o1g0DfSpohY+x4Oi2jSDd0bBWIH8Tm5NVCIaHj+wMMZ?=
 =?iso-8859-1?Q?QQVklFM6BiStdkp31i+fr+LpGkt9ga97Nk/hMSA25LL8jO08W73tE6CGWC?=
 =?iso-8859-1?Q?wKthsM+HbCG6InS9aZ4Km3LVpKujHJLRnWhwf2HWzkpwpscQ2G8kNZkKpT?=
 =?iso-8859-1?Q?gS3B1N/ayLQZ0kR5+0hNhaJxjDgs2L5kC/yZIgeGIUqT+tnteFtJCMXvht?=
 =?iso-8859-1?Q?w2AZeuwNXbhoBT9Y+zAB82XGeGkzNrMxWAzMOM9XDppef9lH/WRFNSZLU/?=
 =?iso-8859-1?Q?eMNcIeJUiACZ3ciKUlR42lXYsF7yx/AMPu7zmgOA3MVdLD/OFet/XUmXDh?=
 =?iso-8859-1?Q?WCvXnW5T2fZXw2nI7xI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e2787c83-3836-4990-f0a6-08dc2347425d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2024 17:00:14.4388 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1CAhHl6E+4SwqkxxpW9toKrwQ8/i05ma4hpDydz9qe+YfFlSOur8uQt9QtU+h+GkSrwXOEwhSPCAEOssORxugdMRyog1NtLJJObckTS52O+RucfSI41hXu6n9NPGQKrn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7520
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

On Tue, Jan 30, 2024 at 01:52:20PM +0100, Thomas Hellström wrote:
>Persistent exec_queues delays explicit destruction of exec_queues
>until they are done executing, but destruction on process exit
>is still immediate. It turns out no UMD is relying on this
>functionality, so remove it. If there turns out to be a use-case
>in the future, let's re-add.
>
>Persistent exec_queues were never used for LR VMs
>
>Open: Should we renumber the exec_queue properties, or leave a hole
>as in this patch.
>
>Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Cc: Matthew Brost <matthew.brost@intel.com>
>Cc: David Airlie <airlied@gmail.com>
>Cc: Daniel Vetter <daniel@ffwll.ch>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Francois Dugast <francois.dugast@intel.com>
>Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>---
> drivers/gpu/drm/xe/xe_device.c       | 39 ----------------------------
> drivers/gpu/drm/xe/xe_device.h       |  4 ---
> drivers/gpu/drm/xe/xe_device_types.h |  8 ------
> drivers/gpu/drm/xe/xe_exec_queue.c   | 36 +++++--------------------
> drivers/gpu/drm/xe/xe_execlist.c     |  2 --
> drivers/gpu/drm/xe/xe_guc_submit.c   |  2 --
> include/uapi/drm/xe_drm.h            |  2 +-
> 7 files changed, 7 insertions(+), 86 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index 6faa7865b1aa..d11cdc0b3cb5 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -86,9 +86,6 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
> 	return 0;
> }
>
>-static void device_kill_persistent_exec_queues(struct xe_device *xe,
>-					       struct xe_file *xef);
>-
> static void xe_file_close(struct drm_device *dev, struct drm_file *file)
> {
> 	struct xe_device *xe = to_xe_device(dev);
>@@ -105,8 +102,6 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
> 	mutex_unlock(&xef->exec_queue.lock);
> 	xa_destroy(&xef->exec_queue.xa);
> 	mutex_destroy(&xef->exec_queue.lock);
>-	device_kill_persistent_exec_queues(xe, xef);
>-
> 	mutex_lock(&xef->vm.lock);
> 	xa_for_each(&xef->vm.xa, idx, vm)
> 		xe_vm_close_and_put(vm);
>@@ -258,9 +253,6 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
> 			xa_erase(&xe->usm.asid_to_vm, asid);
> 	}
>
>-	drmm_mutex_init(&xe->drm, &xe->persistent_engines.lock);
>-	INIT_LIST_HEAD(&xe->persistent_engines.list);
>-
> 	spin_lock_init(&xe->pinned.lock);
> 	INIT_LIST_HEAD(&xe->pinned.kernel_bo_present);
> 	INIT_LIST_HEAD(&xe->pinned.external_vram);
>@@ -599,37 +591,6 @@ void xe_device_shutdown(struct xe_device *xe)
> {
> }
>
>-void xe_device_add_persistent_exec_queues(struct xe_device *xe, struct xe_exec_queue *q)
>-{
>-	mutex_lock(&xe->persistent_engines.lock);
>-	list_add_tail(&q->persistent.link, &xe->persistent_engines.list);
>-	mutex_unlock(&xe->persistent_engines.lock);
>-}
>-
>-void xe_device_remove_persistent_exec_queues(struct xe_device *xe,
>-					     struct xe_exec_queue *q)
>-{
>-	mutex_lock(&xe->persistent_engines.lock);
>-	if (!list_empty(&q->persistent.link))
>-		list_del(&q->persistent.link);
>-	mutex_unlock(&xe->persistent_engines.lock);
>-}
>-
>-static void device_kill_persistent_exec_queues(struct xe_device *xe,
>-					       struct xe_file *xef)
>-{
>-	struct xe_exec_queue *q, *next;
>-
>-	mutex_lock(&xe->persistent_engines.lock);
>-	list_for_each_entry_safe(q, next, &xe->persistent_engines.list,
>-				 persistent.link)
>-		if (q->persistent.xef == xef) {
>-			xe_exec_queue_kill(q);
>-			list_del_init(&q->persistent.link);
>-		}
>-	mutex_unlock(&xe->persistent_engines.lock);
>-}
>-
> void xe_device_wmb(struct xe_device *xe)
> {
> 	struct xe_gt *gt = xe_root_mmio_gt(xe);
>diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>index 270124da1e00..b5236ca7fecc 100644
>--- a/drivers/gpu/drm/xe/xe_device.h
>+++ b/drivers/gpu/drm/xe/xe_device.h
>@@ -42,10 +42,6 @@ int xe_device_probe(struct xe_device *xe);
> void xe_device_remove(struct xe_device *xe);
> void xe_device_shutdown(struct xe_device *xe);
>
>-void xe_device_add_persistent_exec_queues(struct xe_device *xe, struct xe_exec_queue *q);
>-void xe_device_remove_persistent_exec_queues(struct xe_device *xe,
>-					     struct xe_exec_queue *q);
>-
> void xe_device_wmb(struct xe_device *xe);
>
> static inline struct xe_file *to_xe_file(const struct drm_file *file)
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index eb2b806a1d23..9785eef2e5a4 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -348,14 +348,6 @@ struct xe_device {
> 		struct mutex lock;
> 	} usm;
>
>-	/** @persistent_engines: engines that are closed but still running */
>-	struct {
>-		/** @persistent_engines.lock: protects persistent engines */
>-		struct mutex lock;
>-		/** @persistent_engines.list: list of persistent engines */
>-		struct list_head list;
>-	} persistent_engines;
>-
> 	/** @pinned: pinned BO state */
> 	struct {
> 		/** @pinned.lock: protected pinned BO list state */
>diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>index c0b7434e78f1..4b7b41501c92 100644
>--- a/drivers/gpu/drm/xe/xe_exec_queue.c
>+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>@@ -60,7 +60,6 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
> 	q->fence_irq = &gt->fence_irq[hwe->class];
> 	q->ring_ops = gt->ring_ops[hwe->class];
> 	q->ops = gt->exec_queue_ops;
>-	INIT_LIST_HEAD(&q->persistent.link);
> 	INIT_LIST_HEAD(&q->compute.link);
> 	INIT_LIST_HEAD(&q->multi_gt_link);
>
>@@ -379,23 +378,6 @@ static int exec_queue_set_preemption_timeout(struct xe_device *xe,
> 	return 0;
> }
>
>-static int exec_queue_set_persistence(struct xe_device *xe, struct xe_exec_queue *q,
>-				      u64 value, bool create)
>-{
>-	if (XE_IOCTL_DBG(xe, !create))
>-		return -EINVAL;
>-
>-	if (XE_IOCTL_DBG(xe, xe_vm_in_preempt_fence_mode(q->vm)))
>-		return -EINVAL;
>-
>-	if (value)
>-		q->flags |= EXEC_QUEUE_FLAG_PERSISTENT;
>-	else
>-		q->flags &= ~EXEC_QUEUE_FLAG_PERSISTENT;
>-
>-	return 0;
>-}
>-
> static int exec_queue_set_job_timeout(struct xe_device *xe, struct xe_exec_queue *q,
> 				      u64 value, bool create)
> {
>@@ -469,7 +451,6 @@ static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
> 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY] = exec_queue_set_priority,
> 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE] = exec_queue_set_timeslice,
> 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT] = exec_queue_set_preemption_timeout,
>-	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE] = exec_queue_set_persistence,
> 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT] = exec_queue_set_job_timeout,
> 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER] = exec_queue_set_acc_trigger,
> 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY] = exec_queue_set_acc_notify,
>@@ -496,6 +477,9 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
> 		return -EINVAL;
>
> 	idx = array_index_nospec(ext.property, ARRAY_SIZE(exec_queue_set_property_funcs));
>+	if (!exec_queue_set_property_funcs[idx])
>+		return -EINVAL;
>+
> 	return exec_queue_set_property_funcs[idx](xe, q, ext.value,  create);
> }
>
>@@ -707,8 +691,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
> 			/* The migration vm doesn't hold rpm ref */
> 			xe_device_mem_access_get(xe);
>
>-			flags = EXEC_QUEUE_FLAG_PERSISTENT | EXEC_QUEUE_FLAG_VM |
>-				(id ? EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD : 0);
>+			flags = EXEC_QUEUE_FLAG_VM | (id ? EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD : 0);
>
> 			migrate_vm = xe_migrate_get_vm(gt_to_tile(gt)->migrate);
> 			new = xe_exec_queue_create(xe, migrate_vm, logical_mask,
>@@ -759,9 +742,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
> 		}
>
> 		q = xe_exec_queue_create(xe, vm, logical_mask,
>-					 args->width, hwe,
>-					 xe_vm_in_lr_mode(vm) ? 0 :
>-					 EXEC_QUEUE_FLAG_PERSISTENT,
>+					 args->width, hwe, 0,
> 					 args->extensions);
> 		up_read(&vm->lock);
> 		xe_vm_put(vm);
>@@ -778,8 +759,6 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
> 		}
> 	}
>
>-	q->persistent.xef = xef;
>-

Need to remove q->persistent from xe_exec_queue_types.h

Niranjana

> 	mutex_lock(&xef->exec_queue.lock);
> 	err = xa_alloc(&xef->exec_queue.xa, &id, q, xa_limit_32b, GFP_KERNEL);
> 	mutex_unlock(&xef->exec_queue.lock);
>@@ -922,10 +901,7 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
> 	if (XE_IOCTL_DBG(xe, !q))
> 		return -ENOENT;
>
>-	if (!(q->flags & EXEC_QUEUE_FLAG_PERSISTENT))
>-		xe_exec_queue_kill(q);
>-	else
>-		xe_device_add_persistent_exec_queues(xe, q);
>+	xe_exec_queue_kill(q);
>
> 	trace_xe_exec_queue_close(q);
> 	xe_exec_queue_put(q);
>diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
>index 58dfe6a78ffe..1788e78caf5c 100644
>--- a/drivers/gpu/drm/xe/xe_execlist.c
>+++ b/drivers/gpu/drm/xe/xe_execlist.c
>@@ -378,8 +378,6 @@ static void execlist_exec_queue_fini_async(struct work_struct *w)
> 		list_del(&exl->active_link);
> 	spin_unlock_irqrestore(&exl->port->lock, flags);
>
>-	if (q->flags & EXEC_QUEUE_FLAG_PERSISTENT)
>-		xe_device_remove_persistent_exec_queues(xe, q);
> 	drm_sched_entity_fini(&exl->entity);
> 	drm_sched_fini(&exl->sched);
> 	kfree(exl);
>diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>index 2b008ec1b6de..bdbf23229b40 100644
>--- a/drivers/gpu/drm/xe/xe_guc_submit.c
>+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>@@ -1028,8 +1028,6 @@ static void __guc_exec_queue_fini_async(struct work_struct *w)
>
> 	if (xe_exec_queue_is_lr(q))
> 		cancel_work_sync(&ge->lr_tdr);
>-	if (q->flags & EXEC_QUEUE_FLAG_PERSISTENT)
>-		xe_device_remove_persistent_exec_queues(gt_to_xe(q->gt), q);
> 	release_guc_id(guc, q);
> 	xe_sched_entity_fini(&ge->entity);
> 	xe_sched_fini(&ge->sched);
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index 50bbea0992d9..4124284e4cce 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -1045,7 +1045,7 @@ struct drm_xe_exec_queue_create {
> #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
> #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
> #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT	2
>-#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE		3
>+#define   DRM_XE_EXEC_QUEUE_SET_UNUSED_1		        3
> #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT		4
> #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		5
> #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		6
>-- 
>2.43.0
>

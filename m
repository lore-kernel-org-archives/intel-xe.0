Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA84CD98E3
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 16:05:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9415F10E09D;
	Tue, 16 Jun 2026 16:05:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YLrEbpkt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97F5310E09D
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jun 2026 16:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781625927; x=1813161927;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=TjgVdyljMD8cOwrdum4E/TIC1S0OgliGNTYPddbrQx0=;
 b=YLrEbpktvhqc+PLdX9MyewmJg7LeD4ubWSRGFx4BV5TmQXRAJ0QH3JMK
 xNE3d0r42ya4AKLITGctOc2jcoPN7HBTOwnRBmDx7D03lUCIp7Z5gGjz0
 aVwL0VproLBQuJay1F3clE8riXJpgKqQdxteMsRSFFrcRmakTMq+vX1f1
 H0ZfFRBapBcCACdTP/eo2QyAqkrauOrBKcCjvECgtkUYQFGIIPm8jCa6M
 ACL0RIZ01f95KzkL8zDCLZvs/1ES/6NUcGgTmSouSyid+qzHbelhftZ8r
 gwTGv7Y3/3uaIni6IbIApETpYuE4CYahY40Y+UFaQIB5qJl+4pO4PdVku w==;
X-CSE-ConnectionGUID: /s6Bq1eQQJmcBC5v026o0g==
X-CSE-MsgGUID: nyTpiTzWTSGb3+VSm4BXNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82461371"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="82461371"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 09:05:03 -0700
X-CSE-ConnectionGUID: TifJj1FpRyimSjwHWR1Caw==
X-CSE-MsgGUID: ReUCahQsRQ6YjQVBqMXH5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="241443911"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 09:05:02 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 09:05:02 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 16 Jun 2026 09:05:02 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.4) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 09:05:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jVGpKnQqdvhElEAzdutNzWC1GHxZDPQWpFbpIoIAMAroZf///WwnMA4lKyK6faK7ktjqENhDdOoieOQB/TQhTzvddCE8BUuTGzMtrBFztlnFU/ARgy7fqP5dXWablgu7qdvRnJP+Z5m4gJlGdK3mSE44c1oLkhGQmfN31CcWyaUx3LdZsCbqU7930hiIbxqK7ug4YaobbpV7NidaGGlXsMrSuHb5/kFd6zQ/4OA4ZrSz56F2S9aEpSHvIegMoEIXKBYMZWIXeiilS/HJvLQC0IR1NXCliNKJX+i3DJlq+qpzCLesH96X2RTlAqtbx71A2nFzENV9xOS11Al96aOCJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vr8DOuRkW65pxbcIk7BzvZn41HYdfIPgKGbG9unYtn8=;
 b=wDORjK7p+OWK4F4Aypv38IwVc0GBDSwPWROAGy+Kmkw2lpxtxtOPU3nxa91D4AH3fnkPXR8Ipl3yEu52SFH4Y+gWjmgg9dTBgWyd9PxdvG01yoLgijbIyp0t95KQY0xTUi3ugV+PJv5OYeiKnEsxbzD69d7sBrmSNsuYmWMvLzd2OKIAFLeT76Wik+CE6sXe7eYQJ9z1s9ynonKNHt1JIorps6Upifsq+xrjkfgF+5nWyT+8oy+E+6aJGEmBhOGiiy4GKCRCRr7RHRJ8vdPPnO1lrNtcDma6jBQ+yILLmrb9DMLTqBbKICM66nhl7cElh31D/bXHWVedm0fRjP7UQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH8PR11MB9484.namprd11.prod.outlook.com (2603:10b6:610:2c1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.16; Tue, 16 Jun
 2026 16:04:59 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 16:04:59 +0000
Date: Tue, 16 Jun 2026 09:04:56 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <rodrigo.vivi@intel.com>,
 <tejas.upadhyay@intel.com>
Subject: Re: [PATCH v4] drm/xe/guc: Hold device ref until queue teardown
 completes
Message-ID: <ajF0KIx7MLAQqab8@gsse-cloud1.jf.intel.com>
References: <20260616094655.2511-1-arvind.yadav@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260616094655.2511-1-arvind.yadav@intel.com>
X-ClientProxiedBy: MW4PR04CA0115.namprd04.prod.outlook.com
 (2603:10b6:303:83::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH8PR11MB9484:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e88f2b6-164b-4f54-7b63-08decbc10429
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: qCqg9pgeh+XkuF9HSfP8zHH1EtcpUXnH3CiYqmVq+YivaPj3MospVeXIkqQCxxjjrahD3z/Ce4Zds7cmsQ76aRgkCFpmTH9AgQyNmw8iAvi7IaLb8zQPjCp2p/tRaNcQvMCaBLajoCg06nugQ5tD01e6LrbrgOog1jNPUxok4YznCuTmhN3vxtF+fQXeToy53GOi+YQzpzDzqBa4/z4IUUVu8Y5Pp8RQYO0MDvVl7HYyb4XTnFyJqRqvxoHXPIYNapMPV8DzqNhjbewvnjm7tanRNpOUQdVW8XdIdz/rKInMzDUXXXZJZRvqN5yfXA7/mbpVCuBHT3OeaQPazB42xS2+FiYMkHqPwEmFa99pFkvidph1gm/KJMY/bU8RBTGo6Ar1q2S/T6kWWhKS5fBTf9NRxKPTgeOLXDDCAjhgAn/YAHTbSYeR8nQLStxN9QLhdG5q5g2yXBwHR5A0i9fZ7BhaaswjNqZ1Hwdi7Y9pRyHxP+qHtiGVTaV7bz/QcnuNn15PrwqUIa0YAT8WVCf4z6h22uROt9DKIogjz0DAJxiSgTNIhj+NrNVumFvJHJ/vK4xg1XKtNjR7N0LboRIN1PF76kWeZjz1lgK2YG9h9ZCi/7pu+43AKiwRBP6InFc/HDXSIgqEuJV4zg5VSTVBA8PZekzz/KLqIJOwMmBvyR/bUu20pHIzMKJDjLoFdkA3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?jF4LmTpWN6bYOznGE9DNtyEa/h7giRZ+FCp1Z6aEcTJJPuECt4qFF4y71q?=
 =?iso-8859-1?Q?wHODpHrkO2byR3PfaX67otaXGvkaEbVN+gI0EPKccHiwCryiURn/Fhx2fc?=
 =?iso-8859-1?Q?LY7Lf4eUDAq8Y0F6v5PIeoWO6qy/jEKXM5H+BtbMfE0o8NajOKt0+gZCu/?=
 =?iso-8859-1?Q?j0qJVedYcDrmRdGdOQUQhK9Q4G0xL8mV/LYPWdHE6X3UzISxFGPrco21mF?=
 =?iso-8859-1?Q?lIjbUq3zv1Gmg252OeWl3406Crc9Tpt4De+aXFBe0o8/AQZObLyBfHWevZ?=
 =?iso-8859-1?Q?HVpG6MU4u+0EnsVZ+ZCcgY4LPCKsY/Wy9bpbC6HvzVBenCdqlPH48e7zcF?=
 =?iso-8859-1?Q?nbWw9tKDI/MrFHyT5lQrJdpMjFWP1KKUpBGC4vWkJY2yWnKaPqkpfer1Zz?=
 =?iso-8859-1?Q?U38hkRiprJ9WnhS0erUl5Ai3P2HxM+ftSwiRYPW01XoSUFQvO13/iO4+tq?=
 =?iso-8859-1?Q?JHyV8rW+dd4iToSIMouv+lwiYQxtcAH7wnVbLLwpCU5rg53CP6nStzegPt?=
 =?iso-8859-1?Q?GfC4ac+EVD1mZHD0Dh05odrzzPdVKumktD15+ouLGNzFd1bn2VnrSvKVvW?=
 =?iso-8859-1?Q?bioqdWX343Bkr+63WyE1GDWwoYhw78/e4bEX+lNL90uh757ImiTll8+q4w?=
 =?iso-8859-1?Q?1hn6kIchWIHllQMeW1MSOBw+3GApFSiQI64yTZwDfJ8ykVDNXB3H4A56i2?=
 =?iso-8859-1?Q?VzBegI8c1AjwrTZgPVWzVkMeIKFCLgfoTgEMn/Igg/LY8a7jr7veMQjJ3X?=
 =?iso-8859-1?Q?YkhGMNXrTjPpfrJKm82DhFpuCJ/BjwQmn71adA30oGcXk5sMxhv3/yFEp5?=
 =?iso-8859-1?Q?aSd7amU0ZZNFNz4mb6RigRSnE4TwjkVnhqOTUjRKYPiJ/5QsSKHLlWSvwx?=
 =?iso-8859-1?Q?Iwat4JNcH0/SyMvfbH7Ia5sNVkdHvA6jbxLuunLJuSMYGeedQePBrWZlC5?=
 =?iso-8859-1?Q?B0IRUAT6KiB/BmtzObUfN2UYUJ09RLxOVnZPWLmuozqB/D/3SFYBJyUSNH?=
 =?iso-8859-1?Q?HVed6dM+26Z446NcZoZCUbdqBdjvoXUCyKToOBgDt3tBO+kca6MTk3aamI?=
 =?iso-8859-1?Q?eIovdcKzOgOphger5ckpqzurG14mkCh/35EQnTGBAMjSk/jALhL3zeU8mD?=
 =?iso-8859-1?Q?nMo6FVPjy1F7YCbzlhaYZx157O6tlW3Mgw3sJhP8S2Wohmzs8gOz0AzO/C?=
 =?iso-8859-1?Q?6FxjZrr0pyMwtdipnWs/aiZ8oupN0J+slJGgXmEEcPZDQqJTs7Z1p/+3kS?=
 =?iso-8859-1?Q?qvOnjrM799JN3HiFeO2abIeq+bd67ThNuG3XV9G4Uh/mcz4MzgnzVigyZS?=
 =?iso-8859-1?Q?OXpel1bBHPuqEDDGGaFMRfm7Kfydyg/10mwRSWzzlZygz8e6QK3rX+lKH9?=
 =?iso-8859-1?Q?eSgeQBc4YotAHoeDjnG5QbZPD/Xx/PPq+Y863vUogQ3Gt0PYgOVnbYhFxI?=
 =?iso-8859-1?Q?+Aw0RgTa3GqPmErTrgSayLvT2b/AqtUy6gkL9blkZp5t3EF7E8yG8pgnlH?=
 =?iso-8859-1?Q?JqLuOk/qrqFyMrtvjl6CSDgyGlEq2VqdiM5dd7JZg4Z3eZrOOFpzS6vtZ1?=
 =?iso-8859-1?Q?tq65PTSGUO7WBfaHZHzqAbwr3BGUq8A3zzzu0MYA/OECYjA78+Js7jEgmp?=
 =?iso-8859-1?Q?FV1eRtkmCkVevXTCLipHibKaC4tXqdVwZOEOXBB23iGjlqGGS5wl2hOTlu?=
 =?iso-8859-1?Q?fpyDgveOtqkqe3E0jeCYKhrvAJVBykLwhz6SFALDCXPwiHQGOHiDFlbdFs?=
 =?iso-8859-1?Q?+8hUfM+neaARfcR6F4r9K9JHaGm7FwsUyxI2pHJnj291inP/x53QuEauKT?=
 =?iso-8859-1?Q?cqjZdUFZIDtSpTrj6gR8ZIfGSt55Df0=3D?=
X-Exchange-RoutingPolicyChecked: n3kP4099tsrdWZLxdELmla28yWyO+uZkjreGsJzGnsoVDh5OXKEP6zSgnKeaX8S+JOVy2rg7JsQ2jVY7v4tW1d7r2a6vEuxOIlZXURMc7K8+OF+B8ykiclxCEdpzXGWFtdZh/UQrZ6KFojpUlTDeoiK8M98nHuHKyY9Dfdq2TxYmQIrP1KVjzKR7JlO+OBhNHySaK6UnfOinKq8H1X8A0c3leZljR/sx/VBCMJZFbMMNThybC6DFE9Ks7/OmmHNoLX7AYHLVlA2XnJI0qK3oV1TOzC+E29zGmpMdQWYVk1FWxXGJnhAAljWqyt2CY/MdCdWDMGdUnPneH6gZncDLxQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e88f2b6-164b-4f54-7b63-08decbc10429
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 16:04:59.5054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Db37h7hWblPjBpPHMTP0gtn4Mix5xASxJkmY4Z8NsNBtiCWnJtpCkQi6FePDPeBDlySuPdB1rY3g9r0W8GzJfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR11MB9484
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

On Tue, Jun 16, 2026 at 03:16:55PM +0530, Arvind Yadav wrote:
> GuC exec queue destruction can run asynchronously. During queue cleanup,
> xe_exec_queue_fini() may drop the last references that eventually release
> the DRM device and run drmm cleanup actions.
> 
> guc_submit_sw_fini(), registered as a drmm action, used to drain
> xe->destroy_wq. If DRM device release happened from a worker on
> xe->destroy_wq, teardown could end up draining the same workqueue from
> within that worker, causing a self-deadlock.
> 
> Fix this by taking a drm_device reference when the queue is created and
> dropping it after queue teardown completes. This prevents drmm cleanup
> from running while queue destruction is still pending.
> 
> Since GuC queue destroy work no longer uses xe->destroy_wq, remove the
> stale drain from guc_submit_sw_fini().
> 
> With queue-held device refs, guc_submit_sw_fini() cannot run until all
> GuC IDs have been released, so replace the fini wait with an assertion
> and remove the now-unused fini_wq.
> 
> v2:
>   - Rebase
> 
> v3:
>   - Switch to queue-lifetime drm_dev_get()/drm_dev_put() model. (Matt)
>   - Queue async teardown on system_dfl_wq instead of xe->destroy_wq. (Matt)
>   - Drop separate deferred drm_dev_put worker.
>   - Remove stale drain_workqueue(xe->destroy_wq) from guc_submit_sw_fini().
> 
> v4:
>   - Replace the guc_submit_sw_fini() wait with an assertion  and remove
>     the now-unused fini_wq. (sashiko)

What about Sashiko complaining about using system_dfl_wq which is not
flushed on module unload? That seems like a valid concern. I'd move
xe->destroy_wq to static module variable initialized on module load,
drained on module unload.

Matt 

> 
> Fixes: 2d2be279f1ca ("drm/xe: fix UAF around queue destruction")
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 65 +++++++++++++++++-------------
>  drivers/gpu/drm/xe/xe_guc_types.h  |  2 -
>  2 files changed, 37 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index afe5d99cdd8b..08ad0acf06ae 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -10,6 +10,7 @@
>  #include <linux/circ_buf.h>
>  #include <linux/dma-fence-array.h>
>  
> +#include <drm/drm_drv.h>
>  #include <drm/drm_managed.h>
>  
>  #include "abi/guc_actions_abi.h"
> @@ -232,17 +233,9 @@ static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
>  static void guc_submit_sw_fini(struct drm_device *drm, void *arg)
>  {
>  	struct xe_guc *guc = arg;
> -	struct xe_device *xe = guc_to_xe(guc);
>  	struct xe_gt *gt = guc_to_gt(guc);
> -	int ret;
> -
> -	ret = wait_event_timeout(guc->submission_state.fini_wq,
> -				 xa_empty(&guc->submission_state.exec_queue_lookup),
> -				 HZ * 5);
>  
> -	drain_workqueue(xe->destroy_wq);
> -
> -	xe_gt_assert(gt, ret);
> +	xe_gt_assert(gt, xa_empty(&guc->submission_state.exec_queue_lookup));
>  
>  	xa_destroy(&guc->submission_state.exec_queue_lookup);
>  }
> @@ -319,8 +312,6 @@ int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids)
>  
>  	xa_init(&guc->submission_state.exec_queue_lookup);
>  
> -	init_waitqueue_head(&guc->submission_state.fini_wq);
> -
>  	primelockdep(guc);
>  
>  	guc->submission_state.initialized = true;
> @@ -411,9 +402,6 @@ static void __release_guc_id(struct xe_guc *guc, struct xe_exec_queue *q,
>  	xe_guc_id_mgr_release_locked(&guc->submission_state.idm,
>  				     q->guc->id, q->width);
>  
> -	if (xa_empty(&guc->submission_state.exec_queue_lookup))
> -		wake_up(&guc->submission_state.fini_wq);
> -
>  	mutex_unlock(&guc->submission_state.lock);
>  }
>  
> @@ -1685,6 +1673,7 @@ static void guc_exec_queue_fini(struct xe_exec_queue *q)
>  {
>  	struct xe_guc_exec_queue *ge = q->guc;
>  	struct xe_guc *guc = exec_queue_to_guc(q);
> +	struct drm_device *drm = &guc_to_xe(guc)->drm;
>  
>  	if (xe_exec_queue_is_multi_queue_secondary(q)) {
>  		struct xe_exec_queue_group *group = q->multi_queue.group;
> @@ -1703,36 +1692,52 @@ static void guc_exec_queue_fini(struct xe_exec_queue *q)
>  	 * (timeline name).
>  	 */
>  	kfree_rcu(ge, rcu);
> +
> +	drm_dev_put(drm);
>  }
>  
> -static void __guc_exec_queue_destroy_async(struct work_struct *w)
> +static void guc_exec_queue_do_destroy(struct xe_exec_queue *q)
>  {
> -	struct xe_guc_exec_queue *ge =
> -		container_of(w, struct xe_guc_exec_queue, destroy_async);
> -	struct xe_exec_queue *q = ge->q;
> +	struct xe_guc_exec_queue *ge = q->guc;
>  	struct xe_guc *guc = exec_queue_to_guc(q);
> +	struct xe_device *xe = guc_to_xe(guc);
> +	struct drm_device *drm = &xe->drm;
>  
> -	guard(xe_pm_runtime)(guc_to_xe(guc));
> -	trace_xe_exec_queue_destroy(q);
> +	/*
> +	 * guc_exec_queue_fini() drops the queue's drm_device ref.
> +	 * Keep the device alive until the PM-runtime guard unwinds.
> +	 */
> +	drm_dev_get(drm);
>  
> -	/* Confirm no work left behind accessing device structures */
> -	cancel_delayed_work_sync(&ge->sched.base.work_tdr);
> +	scoped_guard(xe_pm_runtime, xe) {
> +		trace_xe_exec_queue_destroy(q);
>  
> -	xe_exec_queue_fini(q);
> +		/* Confirm no work left behind accessing device structures */
> +		cancel_delayed_work_sync(&ge->sched.base.work_tdr);
> +
> +		xe_exec_queue_fini(q);
> +	}
> +
> +	drm_dev_put(drm);
>  }
>  
> -static void guc_exec_queue_destroy_async(struct xe_exec_queue *q)
> +static void __guc_exec_queue_destroy_async(struct work_struct *w)
>  {
> -	struct xe_guc *guc = exec_queue_to_guc(q);
> -	struct xe_device *xe = guc_to_xe(guc);
> +	struct xe_guc_exec_queue *ge =
> +		container_of(w, struct xe_guc_exec_queue, destroy_async);
> +
> +	guc_exec_queue_do_destroy(ge->q);
> +}
>  
> +static void guc_exec_queue_destroy_async(struct xe_exec_queue *q)
> +{
>  	INIT_WORK(&q->guc->destroy_async, __guc_exec_queue_destroy_async);
>  
>  	/* We must block on kernel engines so slabs are empty on driver unload */
>  	if (q->flags & EXEC_QUEUE_FLAG_PERMANENT || exec_queue_wedged(q))
> -		__guc_exec_queue_destroy_async(&q->guc->destroy_async);
> +		guc_exec_queue_do_destroy(q);
>  	else
> -		queue_work(xe->destroy_wq, &q->guc->destroy_async);
> +		queue_work(system_dfl_wq, &q->guc->destroy_async);
>  }
>  
>  static void __guc_exec_queue_destroy(struct xe_guc *guc, struct xe_exec_queue *q)
> @@ -1927,6 +1932,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>  {
>  	struct xe_gpu_scheduler *sched;
>  	struct xe_guc *guc = exec_queue_to_guc(q);
> +	struct drm_device *drm = &guc_to_xe(guc)->drm;
>  	struct workqueue_struct *submit_wq = NULL;
>  	struct xe_guc_exec_queue *ge;
>  	long timeout;
> @@ -1938,6 +1944,8 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>  	if (!ge)
>  		return -ENOMEM;
>  
> +	drm_dev_get(drm);
> +
>  	q->guc = ge;
>  	ge->q = q;
>  	init_rcu_head(&ge->rcu);
> @@ -2014,6 +2022,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>  	release_guc_id(guc, q);
>  err_free:
>  	kfree(ge);
> +	drm_dev_put(drm);
>  
>  	return err;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
> index c7b9642b41ba..31a2acb63ac3 100644
> --- a/drivers/gpu/drm/xe/xe_guc_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_types.h
> @@ -100,8 +100,6 @@ struct xe_guc {
>  		 * even initialized - before that not even the lock is valid
>  		 */
>  		bool initialized;
> -		/** @submission_state.fini_wq: submit fini wait queue */
> -		wait_queue_head_t fini_wq;
>  	} submission_state;
>  
>  	/** @hwconfig: Hardware config state */
> -- 
> 2.43.0
> 

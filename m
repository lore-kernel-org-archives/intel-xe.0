Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C276C54E67
	for <intel-xe@archiver.kernel.org>; Tue, 26 Mar 2024 19:18:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1353C10E255;
	Tue, 26 Mar 2024 19:18:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aFOKDjM2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADFA610E255
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Mar 2024 19:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711480718; x=1743016718;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=YhZu5CKuRS61isyLut29pI/mx/hQuoRv7I+9tsvXolg=;
 b=aFOKDjM2WbB6Pkh3qXSJl6X1YS2eCXM3pdWBr6o0ugCegyQw+//6DoZX
 IA0WSCMilvOn/MGhfcxUD5kd3AMizBGlH+KHewd5UhVJhKz9u7tPJTjyY
 laJ1sO0R7aVDPCbYd3LksTb6l+ClXsVGfQ3Ik+MMrdEhvVHbdhnlClLJR
 fKzTmadiD65fUNjh6mnEL6mO5dDFnKZ20ThexweKfwv/PapnJhX4VJx8B
 /Td7wBQPZpEzSXIoDsWSFY7KRv+9PDxyLR/2ZD2JY+aa1hrGWP9624BmC
 Xe3XqW11EC3MEd4yYkd3Lt4GYNi/twr3G3NOps18G3izX8r3djsBMIrQI g==;
X-CSE-ConnectionGUID: W/bCnv5OQHGr4xY4vq4O4g==
X-CSE-MsgGUID: VDxhwskqSxmOUljYqrCXCA==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17940516"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="17940516"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 12:18:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="16117004"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Mar 2024 12:18:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 12:18:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 26 Mar 2024 12:18:36 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 26 Mar 2024 12:18:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XNMJ+6IagT9lJE79hvUhvt3KGytgd7DtQddF6ONhKU01hfA0aPqsrEADhpk0wxycmBPu/NfkLkBZj8dnRE2jWiqSl2kLFuaSyHlEpmrt+lJ2qDIKXNf6VRNgLk4iXzb0aNhsgiFaSN/ALiZEVhI0fHZDmh0CbRemQrj9qxwYndliXoNWF3RKUMmXo4xtxQaRh+xkVpfWHAdNOPJFTPVreIaxk6Z8OjQZZhMv7R/vQtULZhtnh2P5cX0KXfEfi1VisQmnQLa/F9I5lOI0nxY6mRwh4Y2TFRHw5VwrTFjuSe03YRZ+NPVIM13Np5q8X9zmJ0j76rvyeto7xfO3bUOv1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wroTqInquk9I2rzV1p2StBYOREZFLTTqoZ8te9s810A=;
 b=RE9LjbGORDLw5sj0K2Z9D35Q8/7EXPCMkgENOrVoTkugZOBYhziJpp+d2vWCrf+Fq+fOVnFGFZ5dH3uh+pI97P/PjRwQ8MsVpEA4hI7PKTY0tyANi0WD8cBO3LqlCCKKX7d6fyu0NMtmJlwhSZvXIPI2RD3QejzkcGhTmDiWvQUUi8GQZxJ2SLJoBxUy6VbR5jALGQbb3M/NclIsdWdt0e8P47Xyvu3zjERYwsFWOIpB1GfvqVLCaFw8jD9V35noCbhPCBjgqYjjCZKG13FsoxJQ68lE4a86M+TGTG7BWvee4u9VaIoNi6UJWhKIZOZJXHglpHfwPXzt5ttuNK36pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5070.namprd11.prod.outlook.com (2603:10b6:a03:2d5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Tue, 26 Mar
 2024 19:18:34 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7409.031; Tue, 26 Mar 2024
 19:18:33 +0000
Date: Tue, 26 Mar 2024 19:17:23 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/4] drm/xe/guc: Introduce GuC context ID Manager
Message-ID: <ZgMfQ6eD1zhv53ZS@DUT025-TGLU.fm.intel.com>
References: <20240313221112.1089-1-michal.wajdeczko@intel.com>
 <20240313221112.1089-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240313221112.1089-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR06CA0068.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::45) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5070:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gCig5ULv47Yw9EYHzDpLVj3EpvFoGv3UQX8MaGlhiQ1LoH7KHnW+/FI+LW4z0QgCB5pWWrizOp8V5a1Pt4u59gvDEtCda0HBRVawPtKzJ30oqhJ53f7PienHIghmjv3YKrtpIjcsdXea/4X6Wee3irgHlmNqTdhDHBtjFvJbzGDKCxRgSkMi6fnCVLYcdzdErHMoPXHaJIojlEZ+xYvTM0py1JhXwOUBzkoTOmnCbM6Z6IAc45eHMPom+2x1d53ljsKkGKSNmzxctbHmq1eozlfvlxhZ7GVxflvAHxBTTzeiJndYkX9hK/buIMF0QDdJqmSp/N98Tfw2foSn2INc5WoYqSO1sgJQ6QvPHZ4RNgsAv1AI5ZCUweJgZ6/ZCpY/yXeTdWbJJKDPbB2OevIMH0Y5Pcd1R7GJIdWVXObD14+gGnDVz0higMdE5I2cCug2ieD7rNkmX3Rb/sY/Q2rC+ZM4AgZY+pGVhj9y5MCMK5pEteqNrfHtqnW+Ujm6zryMnMa6w3jCPrhTjOPobVhlR3RuUlaecQRxXN8qY8aCK6iOxyHl4WCbrTQAIHzNYz5s5uOUMp+r0otWhgkbvH9+d6ihx7HIoZ3ScEQV6BXA7RRPJy84SXxA0F5LDwlwTdzXSuqHJKlOZJP5anY/7iz89R+yWiapNBubU68BOwBJJJ0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?3/jGkoE6I0TeqLLZhuSQ7xMANnJgBOSrW7FFtr1q89hP+EX4MBF3FudDfi?=
 =?iso-8859-1?Q?1c9ZpuSqw91mwCnI+d8GiB/4pcG16Q7aPlEiaF3XWk+xX507eTcHD1q0pu?=
 =?iso-8859-1?Q?K8Ykvxl1qdamop3N+4ZAa78tsSzdd2OFJd2gIuCL48HLN2hZPTfpsZIPSu?=
 =?iso-8859-1?Q?2UzdYfPEVuKLIDAE2gpH0JXZMjMgBMiOLEgZk/KQQ7Hj4wnArt6XW8bMCz?=
 =?iso-8859-1?Q?qhooDO6g9rjmulHnXKa4nl9K0B/krahBaGW3CvgbNRb2su8MPvLZmYcKYk?=
 =?iso-8859-1?Q?fYExUAntO+rC7Y9XFf5M2Rxizafd3qs/+/BaW9WQLoidvmxy6VUIiL/qox?=
 =?iso-8859-1?Q?9/Lt0+3BKPeq30Fi59vUxZaF1ACbpj6i8X5Vr0nxV54YWW2HRVhokmHxa5?=
 =?iso-8859-1?Q?UnKa5bnywxb1lFoOTooV/lBdHzOxYCuaSGAmtB/QclnFVY/eOwz2/thouO?=
 =?iso-8859-1?Q?v5EnhOJDw8t0Q3IWspn7t10+2E3LIeAQC4CNROXAO/VXKcMEVO/R4QgTcD?=
 =?iso-8859-1?Q?Qf88CBVprJaQmLXZxsIIqQHSKCl3gNXwqyiX1WR/7Ur+oTSKu4yDKKwHbR?=
 =?iso-8859-1?Q?nNoOL+ATLbYclvhzMTs6nR+JufQJI0hVLxv3Mv687K5/2Ow4B6+G56UpZL?=
 =?iso-8859-1?Q?j06b0ELC2kybJHHq5Hv1J66KLEE6RP+jVmbl5mqAXpsgcyPmdI0bh6XVuK?=
 =?iso-8859-1?Q?ECn1qVfyXT/h2MYr1q1Zr3n2FsvtgZIOqnjtEpJIUro1EZpwD6SedCHw+L?=
 =?iso-8859-1?Q?CemNZeXsTNU6XCqIb0o2AQB6BJ9v9n7T4s9ROvLENrMShKFnvUjG/5GU53?=
 =?iso-8859-1?Q?3+RIQgW8UErauNn9ne2qShYjk3B7ONTZQyceGgJHMeaHlP5sEDauMim+Nf?=
 =?iso-8859-1?Q?eJgp2srdNbJEpL7Fs6SFZxSTI4HJfgPBgb6Z11mtKBiF8qsLS0OWnvi+qn?=
 =?iso-8859-1?Q?Cu1vr/je/Glje6Nq3bTTqgL3nrLSbnZFHkCdGfgMlAinZRFO6T/rqqE/6y?=
 =?iso-8859-1?Q?UHZu7mBB8mMjIGprXq+DYjqA7mCtnyov/mEDLwnsKWMwaj63kCOl4MAtvQ?=
 =?iso-8859-1?Q?WBO9pKSE+xqv3tWuld89DP1jBONZxgvv8teRdhdK8eD/bOmJkXc1gS8oNc?=
 =?iso-8859-1?Q?zFTOtKnDCujs7fOouwAHCZq9+aaKf0iK/QKgfsidU0sUtCuTEm6mC+1NyW?=
 =?iso-8859-1?Q?l2Hl2ulbxpjxHYyYvcCFE/MGhWdfMzeaHw6hEDDJDlF+NWpk7HtMPoYiAa?=
 =?iso-8859-1?Q?O05W0F1Pde1u46u5xgSWDt9C98eCLGaHV4KfzHeN/WBRIpQsZhWGGg0dxJ?=
 =?iso-8859-1?Q?kP57CiqpyYQyRqUHcKzEjESG8JBghxaTZfr2B1/7nIgpNXuQu7quWFMT5P?=
 =?iso-8859-1?Q?o8Ez/T4tS/9y/GxDK/I0AOxqv07eMKbLvva6oYgLefXIEp+IZoPb2Vl83S?=
 =?iso-8859-1?Q?cMidh6M7m6dZcjP2fwqJ8jTrQW/7+3WAzUuGpgr3W2U01Kacwdet0hpBPH?=
 =?iso-8859-1?Q?UKpngPmZY5Cf4wx3GOEEaMXBbArUOzflXoaW4IK/+NO7UwXDKvpu9nvHnw?=
 =?iso-8859-1?Q?0lkOOJaozuqqimN8cmgttdqUbG9E2/55UQVwIOCWdwaOWG7YuTj8si8Y5v?=
 =?iso-8859-1?Q?F4SFjBVjFSmPBldFcfjXzr+SJTE9/nZI+AN2+/JpaUuxsNv9xYU6XvRg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cc6749f-70c4-415c-455e-08dc4dc9878a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 19:18:33.9085 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bgQVKd3Yn7k4KcjXHZa9izTpB2VEAwn7goGUyXUZ1bgv9uVeQppxFhwjgq+bo+E06K54TOoTCK1G06Xpkd3N5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5070
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

On Wed, Mar 13, 2024 at 11:11:10PM +0100, Michal Wajdeczko wrote:
> While we are already managing GuC IDs directly in GuC submission
> code, using bitmap() for MLRC and ida() for SLRC, this code can't
> be easily extended to meet additional requirements for SR-IOV use
> cases, like limited number of IDs available on VFs, or ID range
> reservation for provisioning VFs by the PF.
> 
> Add a separate component for managing GuC IDs, that will replace
> existing ID management. Start with bitmap() based implementation
> that could be optimized later based on perf data.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
> v2: apply review comments from Matt
> ---
>  drivers/gpu/drm/xe/Makefile        |   1 +
>  drivers/gpu/drm/xe/xe_guc_id_mgr.c | 275 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_id_mgr.h |  22 +++
>  drivers/gpu/drm/xe/xe_guc_types.h  |  17 ++
>  4 files changed, 315 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_id_mgr.c
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_id_mgr.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 3c3e67885559..705c0eaf6e71 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -97,6 +97,7 @@ xe-y += xe_bb.o \
>  	xe_guc_db_mgr.o \
>  	xe_guc_debugfs.o \
>  	xe_guc_hwconfig.o \
> +	xe_guc_id_mgr.o \
>  	xe_guc_log.o \
>  	xe_guc_pc.o \
>  	xe_guc_submit.o \
> diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.c b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
> new file mode 100644
> index 000000000000..bee49bc908bb
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
> @@ -0,0 +1,275 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include <linux/bitmap.h>
> +#include <linux/mutex.h>
> +
> +#include <drm/drm_managed.h>
> +
> +#include "xe_assert.h"
> +#include "xe_gt_printk.h"
> +#include "xe_guc.h"
> +#include "xe_guc_id_mgr.h"
> +#include "xe_guc_types.h"
> +
> +static struct xe_guc *idm_to_guc(struct xe_guc_id_mgr *idm)
> +{
> +	return container_of(idm, struct xe_guc, submission_state.idm);
> +}
> +
> +static struct xe_gt *idm_to_gt(struct xe_guc_id_mgr *idm)
> +{
> +	return guc_to_gt(idm_to_guc(idm));
> +}
> +
> +static struct xe_device *idm_to_xe(struct xe_guc_id_mgr *idm)
> +{
> +	return gt_to_xe(idm_to_gt(idm));
> +}
> +
> +#define idm_assert(idm, cond)		xe_gt_assert(idm_to_gt(idm), cond)
> +#define idm_mutex(idm)			(&idm_to_guc(idm)->submission_state.lock)
> +
> +static void idm_print_locked(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent);
> +
> +static void __fini_idm(struct drm_device *drm, void *arg)
> +{
> +	struct xe_guc_id_mgr *idm = arg;
> +
> +	mutex_lock(idm_mutex(idm));
> +
> +	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
> +		unsigned int weight = bitmap_weight(idm->bitmap, idm->total);
> +
> +		if (weight) {
> +			struct drm_printer p = xe_gt_info_printer(idm_to_gt(idm));
> +
> +			xe_gt_err(idm_to_gt(idm), "GUC ID manager unclean (%u/%u)\n",
> +				  weight, idm->total);
> +			idm_print_locked(idm, &p, 1);
> +		}
> +	}
> +
> +	bitmap_free(idm->bitmap);
> +	idm->bitmap = NULL;
> +	idm->total = 0;
> +	idm->used = 0;
> +
> +	mutex_unlock(idm_mutex(idm));
> +}
> +
> +/**
> + * xe_guc_id_mgr_init() - Initialize GuC context ID Manager.
> + * @idm: the &xe_guc_id_mgr to initialize
> + * @limit: number of IDs to manage
> + *
> + * The bare-metal or PF driver can pass ~0 as &limit to indicate that all
> + * context IDs supported by the GuC firmware are available for use.
> + *
> + * Only VF drivers will have to provide explicit number of context IDs
> + * that they can use.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int limit)
> +{
> +	int ret;
> +
> +	idm_assert(idm, !idm->bitmap);
> +	idm_assert(idm, !idm->total);
> +	idm_assert(idm, !idm->used);
> +
> +	if (limit == ~0)
> +		limit = GUC_ID_MAX;
> +	else if (limit > GUC_ID_MAX)
> +		return -ERANGE;
> +	else if (!limit)
> +		return -EINVAL;
> +
> +	idm->bitmap = bitmap_zalloc(limit, GFP_KERNEL);
> +	if (!idm->bitmap)
> +		return -ENOMEM;
> +	idm->total = limit;
> +
> +	ret = drmm_add_action_or_reset(&idm_to_xe(idm)->drm, __fini_idm, idm);
> +	if (ret)
> +		return ret;
> +
> +	xe_gt_info(idm_to_gt(idm), "using %u GUC ID(s)\n", idm->total);
> +	return 0;
> +}
> +
> +static unsigned int find_last_zero_area(unsigned long *bitmap,
> +					unsigned int total,
> +					unsigned int count)
> +{
> +	unsigned int found = total;
> +	unsigned int rs, re, range;
> +
> +	for_each_clear_bitrange(rs, re, bitmap, total) {
> +		range = re - rs;
> +		if (range < count)
> +			continue;
> +		found = rs + (range - count);
> +	}
> +	return found;
> +}
> +
> +static int idm_reserve_chunk_locked(struct xe_guc_id_mgr *idm,
> +				    unsigned int count, unsigned int retain)
> +{
> +	int id;
> +
> +	idm_assert(idm, count);
> +	lockdep_assert_held(idm_mutex(idm));
> +
> +	if (!idm->total)
> +		return -ENODATA;
> +
> +	if (retain) {
> +		/*
> +		 * For IDs reservations (used on PF for VFs) we want to make
> +		 * sure there will be at least 'retain' available for the PF
> +		 */
> +		if (idm->used + count + retain > idm->total)
> +			return -EDQUOT;
> +		/*
> +		 * ... and we want to reserve highest IDs close to the end.
> +		 */
> +		id = find_last_zero_area(idm->bitmap, idm->total, count);
> +	} else {
> +		/*
> +		 * For regular IDs reservations (used by submission code)
> +		 * we start searching from the lower range of IDs.
> +		 */
> +		id = bitmap_find_next_zero_area(idm->bitmap, idm->total, 0, count, 0);
> +	}
> +	if (id >= idm->total)
> +		return -ENOSPC;
> +
> +	bitmap_set(idm->bitmap, id, count);
> +	idm->used += count;
> +
> +	return id;
> +}
> +
> +static void idm_release_chunk_locked(struct xe_guc_id_mgr *idm,
> +				     unsigned int start, unsigned int count)
> +{
> +	idm_assert(idm, count);
> +	idm_assert(idm, count <= idm->used);
> +	idm_assert(idm, start < idm->total);
> +	idm_assert(idm, start + count - 1 < idm->total);
> +	lockdep_assert_held(idm_mutex(idm));
> +
> +	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
> +		unsigned int n;
> +
> +		for (n = 0; n < count; n++)
> +			idm_assert(idm, test_bit(start + n, idm->bitmap));
> +	}
> +	bitmap_clear(idm->bitmap, start, count);
> +	idm->used -= count;
> +}
> +
> +/**
> + * xe_guc_id_mgr_reserve_locked() - Reserve one or more GuC context IDs.
> + * @idm: the &xe_guc_id_mgr
> + * @count: number of IDs to allocate (can't be 0)
> + *
> + * This function is dedicated for the use by the GuC submission code,
> + * where submission lock is already taken.
> + *
> + * Return: ID of allocated GuC context or a negative error code on failure.
> + */
> +int xe_guc_id_mgr_reserve_locked(struct xe_guc_id_mgr *idm, unsigned int count)
> +{
> +	return idm_reserve_chunk_locked(idm, count, 0);
> +}
> +
> +/**
> + * xe_guc_id_mgr_release_locked() - Release one or more GuC context IDs.
> + * @idm: the &xe_guc_id_mgr
> + * @id: the GuC context ID to release
> + * @count: number of IDs to release (can't be 0)
> + *
> + * This function is dedicated for the use by the GuC submission code,
> + * where submission lock is already taken.
> + */
> +void xe_guc_id_mgr_release_locked(struct xe_guc_id_mgr *idm, unsigned int id,
> +				  unsigned int count)
> +{
> +	return idm_release_chunk_locked(idm, id, count);
> +}
> +
> +/**
> + * xe_guc_id_mgr_reserve() - Reserve a range of GuC context IDs.
> + * @idm: the &xe_guc_id_mgr
> + * @count: number of GuC context IDs to reserve (can't be 0)
> + * @retain: number of GuC context IDs to keep available (can't be 0)
> + *
> + * This function is dedicated for the use by the PF driver which expects that
> + * reserved range of IDs will be contiguous and that there will be at least
> + * &retain IDs still available for the PF after this reservation.
> + *
> + * Return: starting ID of the allocated GuC context ID range or
> + *         a negative error code on failure.
> + */
> +int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm,
> +			  unsigned int count, unsigned int retain)
> +{
> +	int ret;
> +
> +	idm_assert(idm, count);
> +	idm_assert(idm, retain);
> +
> +	mutex_lock(idm_mutex(idm));
> +	ret = idm_reserve_chunk_locked(idm, count, retain);
> +	mutex_unlock(idm_mutex(idm));
> +
> +	return ret;
> +}
> +
> +/**
> + * xe_guc_id_mgr_release() - Release a range of GuC context IDs.
> + * @idm: the &xe_guc_id_mgr
> + * @start: the starting ID of GuC context range to release
> + * @count: number of GuC context IDs to release
> + */
> +void xe_guc_id_mgr_release(struct xe_guc_id_mgr *idm,
> +			   unsigned int start, unsigned int count)
> +{
> +	mutex_lock(idm_mutex(idm));
> +	idm_release_chunk_locked(idm, start, count);
> +	mutex_unlock(idm_mutex(idm));
> +}
> +
> +static void idm_print_locked(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent)
> +{
> +	unsigned int rs, re;
> +
> +	lockdep_assert_held(idm_mutex(idm));
> +
> +	drm_printf_indent(p, indent, "total %u\n", idm->total);
> +	if (!idm->bitmap)
> +		return;
> +
> +	drm_printf_indent(p, indent, "used %u\n", idm->used);
> +	for_each_set_bitrange(rs, re, idm->bitmap, idm->total)
> +		drm_printf_indent(p, indent, "range %u..%u (%u)\n", rs, re - 1, re - rs);
> +}
> +
> +/**
> + * xe_guc_id_mgr_print() - Print status of GuC ID Manager.
> + * @idm: the &xe_guc_id_mgr to print
> + * @p: the &drm_printer to print to
> + * @indent: tab indentation level
> + */
> +void xe_guc_id_mgr_print(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent)
> +{
> +	mutex_lock(idm_mutex(idm));
> +	idm_print_locked(idm, p, indent);
> +	mutex_unlock(idm_mutex(idm));
> +}
> diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.h b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
> new file mode 100644
> index 000000000000..368f8c80e4c7
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _XE_GUC_ID_MGR_H_
> +#define _XE_GUC_ID_MGR_H_
> +
> +struct drm_printer;
> +struct xe_guc_id_mgr;
> +
> +int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int count);
> +
> +int xe_guc_id_mgr_reserve_locked(struct xe_guc_id_mgr *idm, unsigned int count);
> +void xe_guc_id_mgr_release_locked(struct xe_guc_id_mgr *idm, unsigned int id, unsigned int count);
> +
> +int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm, unsigned int count, unsigned int retain);
> +void xe_guc_id_mgr_release(struct xe_guc_id_mgr *idm, unsigned int start, unsigned int count);
> +
> +void xe_guc_id_mgr_print(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
> index edcd1a950bd3..69be1fb83047 100644
> --- a/drivers/gpu/drm/xe/xe_guc_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_types.h
> @@ -31,6 +31,21 @@ struct xe_guc_db_mgr {
>  	unsigned long *bitmap;
>  };
>  
> +/**
> + * struct xe_guc_id_mgr - GuC context ID Manager.
> + *
> + * Note: GuC context ID Manager is relying on &xe_guc::submission_state.lock
> + * to protect its members.
> + */
> +struct xe_guc_id_mgr {
> +	/** @bitmap: bitmap to track allocated IDs */
> +	unsigned long *bitmap;
> +	/** @total: total number of IDs being managed */
> +	unsigned int total;
> +	/** @used: number of IDs currently in use */
> +	unsigned int used;
> +};
> +
>  /**
>   * struct xe_guc - Graphic micro controller
>   */
> @@ -49,6 +64,8 @@ struct xe_guc {
>  	struct xe_guc_db_mgr dbm;
>  	/** @submission_state: GuC submission state */
>  	struct {
> +		/** @submission_state.idm: GuC context ID Manager */
> +		struct xe_guc_id_mgr idm;
>  		/** @submission_state.exec_queue_lookup: Lookup an xe_engine from guc_id */
>  		struct xarray exec_queue_lookup;
>  		/** @submission_state.guc_ids: used to allocate new guc_ids, single-lrc */
> -- 
> 2.43.0
> 

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D618CD6E56
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 10:58:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF4C810FBF1;
	Wed,  3 Jun 2026 10:58:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j0koiNoU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88E9110FBE3
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jun 2026 10:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780484317; x=1812020317;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6AbMdwPxD1NoT6Xy7VzoxBtWzdTfHHeDI7AISmJBHyY=;
 b=j0koiNoUg8RNijGLUXhTl0LwR4qau7I8MVFwGNljHwy3I7LOdgqpQ2Gc
 0eUOLp1wAuKjlmq7CSswlCJUM5x769SAQuw1WKsz2sMex5fNtY5Mrz58Z
 rcmKM4+O1ZZrCnxgu/Yyy99uLL9faahjB50Chhq3S84OA2ONlg78kFXwr
 9VbkCMPyJ+cWKnb1vLiOtZSzG/Z/L2IjCqe3dWiF5aL1C1vWWBz/cpFBx
 fX+RL6HRJXOAUEHjP2/u2BNThLFzP75VnI7i+e7l0q/bMZzb3Jq/OOn3D
 9YZiLYF4gtbMkdnWmP/bAg1vQk77dCePt0V6LgnpE1UO/cxYIMhnP79gn A==;
X-CSE-ConnectionGUID: CyYNPN2fQjSvFLNiSXV0RQ==
X-CSE-MsgGUID: JP3SoXYIQeSnyWUYShn9Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81026374"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="81026374"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 03:58:37 -0700
X-CSE-ConnectionGUID: oiA9nUArTmKbD//ZF6jhBA==
X-CSE-MsgGUID: mFyI5d++SQuePyEO7J4oRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="268082820"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 03:58:36 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 03:58:34 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 3 Jun 2026 03:58:34 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.43) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 03:58:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HzakQdqjD+syPZHftk7wZmEl5LHv6KeTOgQOYqLx9vquvPbkok6cmWR4jCNlfWM5eghDJiY1Xypmmb3LoZ0jqiNs7y7db7GA451Xth0nFHSimOG4A5g+k/EPw4HG2cDVJZTg3EK1WcJn1nN1ZpnFhcUzJunEL9H67okxkdSGfNBrBeQDt8bOuejreTN1rMxGYMsMc2aBzS+5w7oI/7nbTokZxgXNWmB25fM8W0537ZUoJ/d7f9IOURS/ACLGJhFmZbS67dblD3KfRv87L161KUehaxjwNZaBxIsYNh7c1i43SMOqC2oLAPd/gSuqJGuEC/84sjzy/1aRwqTdJCyPLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wgKUz2mlGsyg6m8W24Q2C9MCBVsHYBDkAFNGNvXUcuw=;
 b=ekBveomN5EHi/ex+hMvis7iUg+Lj9S56nwOIiSOSJfbU88GM1GbvbUaKTYpXxZWFupRqdQ9TJiOL+1bSM0O9NSX5HVYhahbFi389e6v1Aq8L57YinBlcrBeICiwK7214MeyCtQhmdZAmhAfVSwcQW/iUK3bcf56leC2A23CBbx9OY7A8i/LyiO2P9EIGfawp8CAqmDQSp9IUxoEYh9r5cqsch6vRJbDyo1LPuVZfca0/i9okzDZ0HUWCSO+F9B6GGny7VqTmIM34OUnG2EfEAYZ1YEkt31hpa7tXRagn+tW78OLtspIvhxcDoNQUmeu0omYzekoMb2XWHVh2446e8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by CO1PR11MB4850.namprd11.prod.outlook.com (2603:10b6:303:9c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 10:58:33 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 10:58:32 +0000
Date: Wed, 3 Jun 2026 06:58:27 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <riana.tauro@intel.com>,
 <michal.wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <michal.winiarski@intel.com>, <matthew.auld@intel.com>, <dev@lankhorst.se>,
 <jani.nikula@intel.com>, <lukasz.laguna@intel.com>, <zhanjun.dong@intel.com>, 
 <lukas@wunner.de>, <daniele.ceraolospurio@intel.com>,
 <badal.nilawar@intel.com>
Subject: Re: [PATCH v8 07/10] drm/xe/pm: Introduce xe_device_suspend/resume()
Message-ID: <aiAI00V5x5zWNAx2@intel.com>
References: <20260603101814.916948-1-raag.jadav@intel.com>
 <20260603101814.916948-8-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260603101814.916948-8-raag.jadav@intel.com>
X-ClientProxiedBy: BYAPR21CA0029.namprd21.prod.outlook.com
 (2603:10b6:a03:114::39) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|CO1PR11MB4850:EE_
X-MS-Office365-Filtering-Correlation-Id: 442d7940-55cb-4b90-fe3a-08dec15f0d4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|56012099006|4143699003|11063799006|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: Vywii5snJ82RYtRIJeGuQQXdiAw1zqfykp8837oTrABbXbqVniyefYAppROS2V0qB8fAtq+9AGOBWWnbE9WpRn2AeivVH+YjYsltIHpvnwCh7Kh1E2Ih11uHwRUi+b3NdtQyW0WHHOvGIbh+F2yoSS44qml+oaK7GFCtzEXYDzdWbJJExutU9z9qIjYanCdSgJH856d3twZG031hoytXIsfU933q7hknVrJ0p5oJT6OF8/1HcFaTJ/iWY4PmK6/6qwXkYRfdi9IVNsMeDDlEICwoS7thaFztpwqU4O0EttmXCvbzCRHSzRTjLP9sD9WM+uWw2+jn8ENyPDM6KODJYUjb/JMlXtgYqWdXxktSb/l5kBV+cSW6JD8puJQUgiAAhNnMlZq2y34qVawACdyJb13aurYUL0l/Kc3u/b4zuNZB1l2RutlcGvhHCsOy7+uC3rOiD6mnMj7x2eqaIE64SLRRl1IkmTEploCX4Xa5esY3cRaeGf7xV6SIB9jsEBclJro/pbjU79YPs6SF+BB0W9sOQhMHZdCMEUWra18rATISqyCBi7K3wmOfF6NAU9gPT4LWPgbbSQGS5CxlDcen3tfXP/Vb4uUMCtuLBz5aRRZlcSBKDvyM51bLBNpYC1RCQhqiQpe56+NQeqPJQJXSjnlaasU59saYsO1Nfpm7BOeX95sW31+EDXQoy6fClRZ9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?k2AJLkKGZiqHOL+m0+0K9VUx3SlzheUcDADpxH9oN9r1FNs+jWxaQjnE3AoA?=
 =?us-ascii?Q?3dBd2uYw9husZadQHAKguPmhYoDUF3r1no+X2tDm3wq1/BShzZegbhQgjGsz?=
 =?us-ascii?Q?Ft5ErKAzxVBjYjFC03369+/HAb2U5K1c7uoq7Y6x9G3OEN956rheDunKQ5Vm?=
 =?us-ascii?Q?CxSzu1PKEn9pRxCILZAHgyGDKZubH0D9nOePxMA5loD3MTTC7XVwRQkR88z/?=
 =?us-ascii?Q?TWNIzaLEuxvMiqWCmzXWeM7fgRR/pLE4lsCqd0sKljxrwthbfl2WLS+brfMg?=
 =?us-ascii?Q?0A0GyICFE09JO/TVr5JHMgJHbM1ekBKl2LcmYQeJu8AF1RZQ3us8ycjlfU4W?=
 =?us-ascii?Q?pcFRZnUXfLPIoxBCYYtTzyz2vJ/Sg9t49MmE5/bwiTG2DU1BtYL5b8Z9clwk?=
 =?us-ascii?Q?ocUQDmguvhe9tjiD7eBdI6UrIlSON6bCnfdjtiHtlxDEpWYjT4UlyEJPIjJH?=
 =?us-ascii?Q?JNfSSDmqN6DQ6FsM39YVqsJRWgmm8kQQqGojQsdS+qwaBbdblK0vczPKt85x?=
 =?us-ascii?Q?oKohYUVJKlx2qnG2ckxWJhFLjI2DZwHIkpw3w8i74YmqbwTLXCC2pBUkw5bU?=
 =?us-ascii?Q?nVwxUtXRrnJ0zC2J3K0A1dQAd12i4oZJK0h3YhPVoZQX49QGpIlKrpR90W62?=
 =?us-ascii?Q?OtJVi2PPZB1tI8VZFZcfw+1E7dUJGU7cCEWJ/fxIfZ3ob+UC4pij7qFqVzka?=
 =?us-ascii?Q?4Zin9gtJu2iaul5q2GMmmKmwwgZFATDZHft3EH6wbHgIpPHko3oasQVr1ILw?=
 =?us-ascii?Q?7QhhykyvR/X1nCeBsaQhDUSWssvHvjCz/k90lvQ8HT6MvaBfhAql4g1Hlp70?=
 =?us-ascii?Q?2Hd+YVDFlKdCNmv2AMxQl7k8WwVbZSaVmC5uFs2o+vKGDmUdTmTlSwFqBWIp?=
 =?us-ascii?Q?f7A5k706DzuFR0eV066vo5Iq+q6T6L5fG4laTjnyn/HRmmCY5wxd8qhpCLZJ?=
 =?us-ascii?Q?U1pUTLTi/rn9P2q/5WyAm6dJ+Ub+hd4f2yhugCGpyChFYlBhKNsce21SVQju?=
 =?us-ascii?Q?RAM9On18hXIlBz8y1jhwosL8bL6xvkglxXoyXROZuiF/AxuGrp8HgZ+INHMs?=
 =?us-ascii?Q?hamaxsB4aezA0o3YmfaV1BD3S5hSMZylfg+vz/MFvlUKZwwUbgt+ZDR9eeaS?=
 =?us-ascii?Q?Cu9wqoscZUhGyr3AYKAK0ZgcIARCzKbO2bQYjWbSsNdxmYs0FFqux7x04Ikc?=
 =?us-ascii?Q?GLwexoRiyuEXTz9CvMROmLAg11biMfrCHwHN8UxSorLujC8bLwbXEoQ3SGdj?=
 =?us-ascii?Q?cI3XxEbRMMQbBh4Ort9yld/34sWkW89yb3/kZonL1/69pl6gb7jDyNvad4eN?=
 =?us-ascii?Q?V/n6+lOXMC143TQHDEGng++tVawjNrJJiCnvCsino/ch4XLRceeYnNC/k4lO?=
 =?us-ascii?Q?N1rKNMMIa7+geKviLPggWIY/t/sSvJUamX8AdBhJvLLZ/yE74Kli4d6LTfnl?=
 =?us-ascii?Q?fjSlp7KHNzNbCNT0lYZAdy3mss2NLWYOImsiSR6ZYJ95ple4TSD1v4anOS5P?=
 =?us-ascii?Q?RJc95TNDqJI6+CW7TVy3cIkhyD6a1j5AnpWIQUbanzS6rRFy02NSMH7padB5?=
 =?us-ascii?Q?QobCCIt9Bmed5tdoZbao3S+LchIq6rXsjPgNS/XzYtZUkB7FR2VKmjchTfWG?=
 =?us-ascii?Q?QQfY8Bnh+bffFe46O2u7mmmUc14lyjHtzUaFt88xmqxvDQn9V05bmIys6pAy?=
 =?us-ascii?Q?baKctxZ/arq6yjPEwgfjYy5gS7sUp4gjnpsnlzKMVtJ23VECtYdLQeTzRwTi?=
 =?us-ascii?Q?JGOfVBhUNA=3D=3D?=
X-Exchange-RoutingPolicyChecked: bngoiOUkIPIVFBnmztPHL7/SiaBMIh5GB9PBCoiFLLlePcB4q6O/mhF8nXa74irxzLJ/DC3vOgIybhZE+SqAtXNSFEZyEuCtEwvcxfw0u11Me8hSXNGMEAw2WoAZX15sO7K7YdtNoyjVnB7U41kOYo8CKA85/XtteMmDFCuEKKy7znl4xqrVUiA55Q9NOE5XMBi7n9b/onucM4rv9mmDxnSr2iJXHClF2ChWiFrYq/mnNtUB7XU0G5v37++gmdr9NCW/h4i0UqCw/KJm9eA2jz1sjnB2Md0VjI2BJHGAG96jHaNoXZmP69/6GoZABZTIZzMT2LX7nmRx/24jopf5vg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 442d7940-55cb-4b90-fe3a-08dec15f0d4f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 10:58:32.4328 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n60zHYjXToAIxnHyBvYTS2bw0E3NG490uZ9jilaSFQASg29L8llqtWee6ZqSKDXSKnn6z8lZWByH3ZyO+gOUSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4850
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

On Wed, Jun 03, 2026 at 03:47:07PM +0530, Raag Jadav wrote:
> PCIe FLR prepare/re-initialization flows pretty much reflect system
> suspend/resume flows with a few notable exceptions. Repurpose existing
> helpers for PCIe FLR with an explicit flag to distinguish between both
> flows.
> 
> Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

neat!

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
> v6: Repurpose system suspend/resume helpers for FLR (Daniele)
> ---
>  drivers/gpu/drm/xe/xe_device.c | 150 +++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_device.h |   2 +
>  drivers/gpu/drm/xe/xe_pm.c     | 103 ++--------------------
>  3 files changed, 160 insertions(+), 95 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index d224861b6f6f..9e0cbad8adb0 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -38,6 +38,7 @@
>  #include "xe_force_wake.h"
>  #include "xe_ggtt.h"
>  #include "xe_gt.h"
> +#include "xe_gt_idle.h"
>  #include "xe_gt_mcr.h"
>  #include "xe_gt_printk.h"
>  #include "xe_gt_sriov_vf.h"
> @@ -65,6 +66,7 @@
>  #include "xe_soc_remapper.h"
>  #include "xe_survivability_mode.h"
>  #include "xe_sriov.h"
> +#include "xe_sriov_vf_ccs.h"
>  #include "xe_svm.h"
>  #include "xe_sysctrl.h"
>  #include "xe_tile.h"
> @@ -1512,3 +1514,151 @@ struct xe_vm *xe_device_asid_to_vm(struct xe_device *xe, u32 asid)
>  
>  	return vm;
>  }
> +
> +/**
> + * xe_device_suspend() - Common helper for system suspend and FLR prepare
> + * @xe: xe device instance
> + * @flr: indicate FLR prepare
> + *
> + * Return: 0 on success, negative error code otherwise.
> + */
> +int xe_device_suspend(struct xe_device *xe, bool flr)
> +{
> +	struct xe_gt *gt;
> +	u8 id;
> +	int err;
> +
> +	err = xe_pxp_pm_suspend(xe->pxp);
> +	if (err)
> +		return err;
> +
> +	xe_late_bind_wait_for_worker_completion(&xe->late_bind);
> +
> +	for_each_gt(gt, xe, id)
> +		xe_gt_suspend_prepare(gt);
> +
> +	if (flr) {
> +		for_each_gt(gt, xe, id)
> +			xe_gt_flr_prepare(gt);
> +	} else {
> +		xe_display_pm_suspend(xe);
> +
> +		/* FIXME: Super racey... */
> +		err = xe_bo_evict_all(xe);
> +		if (err)
> +			goto err_display;
> +
> +		for_each_gt(gt, xe, id) {
> +			err = xe_gt_suspend(gt);
> +			if (err)
> +				goto err_display;
> +		}
> +	}
> +
> +	xe_irq_suspend(xe);
> +
> +	if (flr) {
> +		/* TODO: Drop all user bos */
> +		xe_bo_pci_dev_remove_pinned(xe);
> +
> +		unmap_mapping_range(xe->drm.anon_inode->i_mapping, 0, 0, 1);
> +	} else {
> +		xe_display_pm_suspend_late(xe);
> +
> +		xe_i2c_pm_suspend(xe);
> +	}
> +
> +	return 0;
> +
> +err_display:
> +	xe_display_pm_resume(xe);
> +	xe_pxp_pm_resume(xe->pxp);
> +	return err;
> +}
> +
> +/**
> + * xe_device_resume() - Common helper for System resume and re-initialization post FLR
> + * @xe: xe device instance
> + * @flr: indicate re-initialization post FLR
> + *
> + * Return: 0 on success
> + */
> +int xe_device_resume(struct xe_device *xe, bool flr)
> +{
> +	struct xe_tile *tile;
> +	struct xe_gt *gt;
> +	u8 id;
> +	int err;
> +
> +	for_each_gt(gt, xe, id)
> +		xe_gt_idle_disable_c6(gt);
> +
> +	for_each_tile(tile, xe, id)
> +		xe_wa_apply_tile_workarounds(tile);
> +
> +	err = xe_pcode_ready(xe, true);
> +	if (err)
> +		return err;
> +
> +	assert_lmem_ready(xe);
> +
> +	if (flr) {
> +		err = xe_bo_restore_map(xe);
> +		if (err)
> +			return err;
> +
> +		for_each_gt(gt, xe, id) {
> +			err = xe_gt_reinit(gt);
> +			if (err)
> +				return err;
> +		}
> +	} else {
> +		xe_display_pm_resume_early(xe);
> +
> +		/*
> +		 * This only restores pinned memory which is the memory required for the
> +		 * GT(s) to resume.
> +		 */
> +		err = xe_bo_restore_early(xe);
> +		if (err)
> +			return err;
> +	}
> +
> +	xe_i2c_pm_resume(xe, true);
> +
> +	xe_sysctrl_pm_resume(xe);
> +
> +	xe_irq_resume(xe);
> +
> +	for_each_gt(gt, xe, id) {
> +		err = xe_gt_resume(gt);
> +		if (err)
> +			break;
> +	}
> +
> +	if (flr) {
> +		if (err)
> +			return err;
> +	} else {
> +		/*
> +		 * Try to bring up display before bailing from GT resume failure,
> +		 * so we don't leave the user clueless with a blank screen.
> +		 */
> +		xe_display_pm_resume(xe);
> +		if (err)
> +			return err;
> +
> +		err = xe_bo_restore_late(xe);
> +		if (err)
> +			return err;
> +
> +		if (IS_VF_CCS_READY(xe))
> +			xe_sriov_vf_ccs_register_context(xe);
> +	}
> +
> +	xe_pxp_pm_resume(xe->pxp);
> +
> +	xe_late_bind_fw_load(&xe->late_bind);
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 975768a6a9c8..d61fdb362f91 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -48,7 +48,9 @@ int xe_device_init_early(struct xe_device *xe);
>  int xe_device_probe_early(struct xe_device *xe);
>  int xe_device_probe(struct xe_device *xe);
>  void xe_device_remove(struct xe_device *xe);
> +int xe_device_resume(struct xe_device *xe, bool flr);
>  void xe_device_shutdown(struct xe_device *xe);
> +int xe_device_suspend(struct xe_device *xe, bool flr);
>  
>  void xe_device_wmb(struct xe_device *xe);
>  
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 99562f691080..161d3f36f372 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -172,52 +172,18 @@ static void xe_rpm_lockmap_release(const struct xe_device *xe)
>   */
>  int xe_pm_suspend(struct xe_device *xe)
>  {
> -	struct xe_gt *gt;
> -	u8 id;
>  	int err;
>  
>  	drm_dbg(&xe->drm, "Suspending device\n");
>  	xe_pm_block_begin_signalling();
>  	trace_xe_pm_suspend(xe, __builtin_return_address(0));
>  
> -	err = xe_pxp_pm_suspend(xe->pxp);
> +	err = xe_device_suspend(xe, false);
>  	if (err)
> -		goto err;
> +		drm_dbg(&xe->drm, "Device suspend failed %d\n", err);
> +	else
> +		drm_dbg(&xe->drm, "Device suspended\n");
>  
> -	xe_late_bind_wait_for_worker_completion(&xe->late_bind);
> -
> -	for_each_gt(gt, xe, id)
> -		xe_gt_suspend_prepare(gt);
> -
> -	xe_display_pm_suspend(xe);
> -
> -	/* FIXME: Super racey... */
> -	err = xe_bo_evict_all(xe);
> -	if (err)
> -		goto err_display;
> -
> -	for_each_gt(gt, xe, id) {
> -		err = xe_gt_suspend(gt);
> -		if (err)
> -			goto err_display;
> -	}
> -
> -	xe_irq_suspend(xe);
> -
> -	xe_display_pm_suspend_late(xe);
> -
> -	xe_i2c_pm_suspend(xe);
> -
> -	drm_dbg(&xe->drm, "Device suspended\n");
> -	xe_pm_block_end_signalling();
> -
> -	return 0;
> -
> -err_display:
> -	xe_display_pm_resume(xe);
> -	xe_pxp_pm_resume(xe->pxp);
> -err:
> -	drm_dbg(&xe->drm, "Device suspend failed %d\n", err);
>  	xe_pm_block_end_signalling();
>  	return err;
>  }
> @@ -230,71 +196,18 @@ int xe_pm_suspend(struct xe_device *xe)
>   */
>  int xe_pm_resume(struct xe_device *xe)
>  {
> -	struct xe_tile *tile;
> -	struct xe_gt *gt;
> -	u8 id;
>  	int err;
>  
>  	xe_pm_block_begin_signalling();
>  	drm_dbg(&xe->drm, "Resuming device\n");
>  	trace_xe_pm_resume(xe, __builtin_return_address(0));
>  
> -	for_each_gt(gt, xe, id)
> -		xe_gt_idle_disable_c6(gt);
> -
> -	for_each_tile(tile, xe, id)
> -		xe_wa_apply_tile_workarounds(tile);
> -
> -	err = xe_pcode_ready(xe, true);
> -	if (err)
> -		return err;
> -
> -	xe_display_pm_resume_early(xe);
> -
> -	/*
> -	 * This only restores pinned memory which is the memory required for the
> -	 * GT(s) to resume.
> -	 */
> -	err = xe_bo_restore_early(xe);
> -	if (err)
> -		goto err;
> -
> -	xe_i2c_pm_resume(xe, true);
> -
> -	xe_sysctrl_pm_resume(xe);
> -
> -	xe_irq_resume(xe);
> -
> -	for_each_gt(gt, xe, id) {
> -		err = xe_gt_resume(gt);
> -		if (err)
> -			break;
> -	}
> -
> -	/*
> -	 * Try to bring up display before bailing from GT resume failure,
> -	 * so we don't leave the user clueless with a blank screen.
> -	 */
> -	xe_display_pm_resume(xe);
> -	if (err)
> -		goto err;
> -
> -	err = xe_bo_restore_late(xe);
> +	err = xe_device_resume(xe, false);
>  	if (err)
> -		goto err;
> -
> -	xe_pxp_pm_resume(xe->pxp);
> -
> -	if (IS_VF_CCS_READY(xe))
> -		xe_sriov_vf_ccs_register_context(xe);
> -
> -	xe_late_bind_fw_load(&xe->late_bind);
> +		drm_dbg(&xe->drm, "Device resume failed %d\n", err);
> +	else
> +		drm_dbg(&xe->drm, "Device resumed\n");
>  
> -	drm_dbg(&xe->drm, "Device resumed\n");
> -	xe_pm_block_end_signalling();
> -	return 0;
> -err:
> -	drm_dbg(&xe->drm, "Device resume failed %d\n", err);
>  	xe_pm_block_end_signalling();
>  	return err;
>  }
> -- 
> 2.43.0
> 

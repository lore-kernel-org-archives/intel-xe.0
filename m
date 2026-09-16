Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56FB9C88E5C
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 12:19:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E02D410E38D;
	Wed, 16 Sep 2026 12:19:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e/STvlky";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D2D710E38D
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Sep 2026 12:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789561194; x=1821097194;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0l6AcPUI6HK8E5Tj7Z/3AbVqjzoQavGGTCfiRE4DCok=;
 b=e/STvlkyxRVu8bvi5nFkLjN/loW3/6c2XuM8EgTgMeEAWagEpYy98urL
 1Vq6g6xZkG+OyHjUtCfL21WE77H+izgLbQtG2uv3Gqei2zGwJaUeJP25O
 98z2+GssLQeom4jkqvU+gV5Nc8u9IhVAcrMJ3jefY0kBiRcUat2c6od5Z
 6TT6nE56RfKiRH39Hy67zMnHlSFCyU1x10UQlOUL2dHFmQ52JwnrqJsZm
 rHOmrQDhgNRNNdTaGKNHfrgtczy+ATPUdAJsxPm72itpqufFeU8/6G9YD
 ssJlr/XE9lhEqsFyrTdaHqlV7A9S9XNa+tHRAgHL3BwVWcHh5h0CxZtz4 g==;
X-CSE-ConnectionGUID: fFO1PlwNRyuyBIthH1jWlQ==
X-CSE-MsgGUID: EHTVbFVtSY2kpr6EKfjOig==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93761726"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="93761726"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 05:19:54 -0700
X-CSE-ConnectionGUID: a/ljBiZbRUeLJ8Z0/aOSmw==
X-CSE-MsgGUID: 3exnx3yQT3+9C/rCOAWR8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="271868106"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 05:19:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 05:19:53 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 16 Sep 2026 05:19:53 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.27) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 05:19:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NrKuzYUSoSH81EQy6uWvzd7Ks4Bq4Cpe32VBBHxet5XRUYeay8eGfEFEUxBBP0tr7+FjnR5+Pz8ZXNXLHbUqG0hJIFbVpt5fJykce3N3HAzxbX5OWTgTho+42iFDCCb1B/rlpVbr2cH57YKclcP3klWXi2rf3DVnziwd98p0i1nrTaZ26o8ge28Lza82Xz3MiedqW5cVb44M1l4KtMFMD6C3JtjOFP6vqdOE3cNPgV82QW9MkxHY2THlLh8j370cpD28vkcJzPo+N7x0KMSkeZEZ8cRwfa1aimPG3bKBU+dUVdv2KEPiOoLzXMePtoDLWsnnGOehb3i59obct2/0DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dVKAuwpSai+ZdnMiDVG0z0oSTwJz+iu5bgb7HdnTQmk=;
 b=Qo08vGbDnaPjGYJ3+fDRr2TzN9EV9/GJC8muMGWZVl0eaN6Suu5zNQ+qxhqcwcPxnwGIbjA535876jVOMDYqcDjyfcDwLPery/1RgEuRw4T02BOcWgPetW6OTcUPvXJt6MsnI8wyVyn6jwPmYZ/9nMxc2FCo4U2bPnComg1vAPWWK6BeTfdqHOP9tM5K3smqN1UUWs+II/x9O+vUPbpc62ThHNyt+eWu8G+6DgwDrBU/WEFBoTx4bVjScv60nd2d9xt20/i4dYl7ejX/anCdO8JuF3pR9KARI0YwVV9A7S7bCLRb4a09YRDEUTsKkXUJy8LGH0mqEH0cITZ3WfFmCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by LV1PR11MB8851.namprd11.prod.outlook.com (2603:10b6:408:2b2::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Wed, 16 Sep
 2026 12:19:49 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 12:19:49 +0000
Date: Wed, 16 Sep 2026 08:19:42 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Badal Nilawar <badal.nilawar@intel.com>
Subject: Re: [PATCH v5] drm/xe: Poll GT for C6 before D3
Message-ID: <aqqJXsFuaAo0rGq5@intel.com>
References: <20260915210113.2915363-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260915210113.2915363-1-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: SCYP215CA0042.LAMP215.PROD.OUTLOOK.COM
 (2603:10d6:300:147::7) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|LV1PR11MB8851:EE_
X-MS-Office365-Filtering-Correlation-Id: 6973cc6a-041e-4a2f-0563-08df13eccda4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|6133799003|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: +n9xwqPo6u4qMx+CJQwmQTJL86ZqXlJ0j45UjJnpqVdBxFuLr9ZaLWei/RXURJm13sO3zXbBxjlyVnc5dMHujomvzGaxpRyJWuJTGLSBZjf3p67MuRNTt7dYWzJqZS1xNmqBvRTa2Ks9NEVoPWt9EAyn+J1wwqIdhEd8gT57ararFAux73aIMAlIyFaKhU2/sygm5dzOiXplrq9+51zvBlRlXS7gZPopt9GkNV17FkNuqWQCvo5so6f5QCD2RVR1wdnpIoGc7XiQuXfHCVDdJeBgQT0oUc6LVkjVMS8Um8lz5r/u0kl2EgVrmVfsJmu397dfrEJ1mivmSNHH/+lZ3+jSbcveibTg0ohxjMIoOQ3gDQFePLj1v/PlG7uQ9VRzVljcpjvdPF1ji6a/frYUhO5JitQ5f9vIHVQij7OcURh2U5qEFGTLAn1Bj9lTtsjFwmnl2kstkvlKQNXNojZe5l5WY23Vtf8ZLind81m9M2BRcdGujmgEUBPXOfka1JYmVO/qYrLXIy359grADLYSc4oNw1sGjL1eZT+on12piw+a7L1BAQiZAwDqpibDUHTE4GjeDXzCLZZrtVHixaO0gHYDh6U0A9kOqOAL8USOrlYTOU1S5dt1/QNOBThO6vfereWG+6qcdAYM0PF6YPh2xXyluxbFpbvk/lAfrgm5fjk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KmuDVM2FZhqaucn9ucFntRVeUCEVAQVP4I4diSzp+wu60sU7cDGPdKyvkI9r?=
 =?us-ascii?Q?16NAGfV0zeYztEZ/mbuTDhfNPpgd9VyoGOtErmY+RnKrolqEaXi2wmYV6EjN?=
 =?us-ascii?Q?FCniVeh5DOwNbtoQ/tzGKqvCHn+xRZdAQtQxb67XfE90pxB3CUpnDX7+w4YF?=
 =?us-ascii?Q?tQqrkepMIDU9sNwdCsVBbvVulGV0ApC45r1Z1Dwj1i/4ZrCwcwwcne9OT1pA?=
 =?us-ascii?Q?Zpp41d4KUp1Wi5zbqvnNg22aYOeXAEIW/PUxJu9BIZPOIZwnBRBqqwGV+4V3?=
 =?us-ascii?Q?lPvODoY2DUSCt5reNhaKcdDzaRl7nzhIZ3D3Clo5pUtml/YrGTgKGoKKIf2j?=
 =?us-ascii?Q?5NZFEyMZf5fm1ab4utdlFZl9BHasCtqukdlT0aORtAZc81+/jHIr5EeP7dak?=
 =?us-ascii?Q?LRi0mteM7m/l8UXe4L16NkbXXqf7M7wN2y0TOfK/yHdJajUJsu/1J1hDlb9J?=
 =?us-ascii?Q?bpW27i6Gja+32XRiR7W1wu/gY4aS/ToUeWmcMTU3tR90sAUR4SxA4UR6O6VT?=
 =?us-ascii?Q?IOXMtZFGMUdlSCafNhFwtjzq+anz19y6eCQpyjeYTJRWjeplL8hfw7GUPl7O?=
 =?us-ascii?Q?LPf54J/2aJS/AjKKE0PznxrE7+oYFsQDBFrb32mEZ4N7CqHu/M0sgNjLNOCZ?=
 =?us-ascii?Q?n36w9OuD6kzVKLsEOsfiqizxDmdem4tRfKq3kvIj7PgD21LsNmipCAxzaORZ?=
 =?us-ascii?Q?fgdItELN/kJaQe8lOHbAEO7oSGNY057YkQK5si44jR/qy2HGrD5mboTHE7/l?=
 =?us-ascii?Q?Q4xswPL/0e3BTtW3xdKg6B8F/gZRrleWQd2mk/Uep1O8yYwp9QoPnlakG+Er?=
 =?us-ascii?Q?Dv8KGhBmfT9Mzo3jPUmJdi31lC0we6eLwNPMCFKL6DGtpDz1tUS1yCjO9E7x?=
 =?us-ascii?Q?tZc7lncsHMq7Dy8t6Mm5q/JZA73OHv2h0Q9cxmFSAEOf7vgGrBxOSmQ0hZFN?=
 =?us-ascii?Q?gcsRt3vwRBO42tdeVP8qji0F4HVo8Zcb0XoiFT9IVXe1yyd01WPCyr769+NV?=
 =?us-ascii?Q?I87Qor/gBiFatv8IAXH9voyc50GgvE6IevNKvm8wo/jh2E7be5V3XGZzcfHI?=
 =?us-ascii?Q?eNvnh/V/Zyj9vrLcb34avY13OVH0MoAjQ/TqJybjFrxkEIyAY5Y9VyUnwVXA?=
 =?us-ascii?Q?NhBxqK8y8Wfd9mu2jHefNbRoET3MYXE08qGB2E0SUtayQz09Vr0Q+8+VdxpQ?=
 =?us-ascii?Q?UJT8oxpyp7kP7Qr/3y44sU6ovdP/CCNQ+dMtV6NTeJfh9qlou2/hGtRsIeW0?=
 =?us-ascii?Q?aLbFBtwK7UmczmB5TBRc+SRrAs64EGty2rjwu50YS26t8L+wLhbkjUE5dwTx?=
 =?us-ascii?Q?Av/gMLhoC5X2eft18QOieUQV089G2/lbEn43OV5Z1gsZDgxiBKo2FcHogE9t?=
 =?us-ascii?Q?crh/Z7mhCoywpt6UwX9IkxbIgB7ISQJ2CdX7/neOzU/Aw5L8ji7xPi0amKqW?=
 =?us-ascii?Q?+En+QGM8s9eEpVtWvQCyuxwduQ0DVWHhtnTKmRJZXT4gwhbHV3No1F2fpAZl?=
 =?us-ascii?Q?Ps/yzUTGqscjPsIrSrqfslFWDi3VELhUg3tJAbYjO+GaHTsbeiUSjnxUCHrR?=
 =?us-ascii?Q?2B2ldBdiHNzYArPfiHvPiaXtqematoi1dkCSEcpVQFYKVqbXFYwG9k5LE4s5?=
 =?us-ascii?Q?UAJnxtpxhrEYF1TcbOZPqBzLGk/mF/i9abzWof3ML1J5qfpuH9rkscjIvvGP?=
 =?us-ascii?Q?z0vh3FDR2pbU7i0AH+ZQmQmZERxlcGvrVfeXut0J8NbOXf6h2MBwjDsbUXRC?=
 =?us-ascii?Q?90vEv5Vh7g=3D=3D?=
X-Exchange-RoutingPolicyChecked: OYfVB1lSwUIDvsNkO6SrzVx5+Qzdd6wyd5eFsK39JI9iHlcEd/r6mPHgbMpnSHRGOCW0SsOGQRR9kR7sj1rPB6+ifCt4/H8O+UqBee3PjXx/2QtiGerPTJuCIKJR4VdLk5pMkM7XUGqSSGxoL/Ue2AIjE8ty4l2LTS5XxxiDcCZKZLAwyrraXcRXel543osntvOynQmIDL3ji+kDpEutUfK3MMTEg47YjeP3j90JwO2LqWBCR28yoDiLwMO60/2AzEY100k4Og24Znv05Qt6mVhfSrXjxoTUvAfCa3ZNdI2cJ7ANybjIPs3VfNOxCDIZv/c5yqpht0Y4DVQPZjI1xQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6973cc6a-041e-4a2f-0563-08df13eccda4
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 12:19:49.5341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QK+5w1lyLNpyrUMe9kNuthayB7fswhtfJWuZ21J4h9OzmbbdBPk5k6XU5ISKcMfMyhwnlp5Cksv8KsgZWXXz9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8851
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

On Tue, Sep 15, 2026 at 02:01:13PM -0700, Vinay Belgaumkar wrote:
> Ensure GT C6 state before D3 transition in runtime suspend flow.
> This avoids the scenario where GT is being accessed after D3 state
> is programmed. If the check for C6 fails, resume the device so it is
> not stuck in an intermediate state.
> 
> v2: Force resume when we cancel suspend due to C6 check (Sashiko)
> v3: Abort the suspend properly when idle check fails (Sashiko)
> v4: Only check for C6 during suspend (Rodrigo). Have check in
> xe_pci_runtime_suspend() instead of xe_pci_suspend().
> v5: Don't checkfor PVC (Sashiko), rename function from_device_c6
> to _device_idle
> 
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_idle.c | 36 +++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_idle.h |  1 +
>  drivers/gpu/drm/xe/xe_pci.c     | 13 +++++++++++-
>  drivers/gpu/drm/xe/xe_pm.c      | 24 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_pm.h      |  1 +
>  5 files changed, 74 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> index c208d7563e36..8242feede1dd 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> @@ -8,10 +8,12 @@
>  #include <drm/drm_managed.h>
>  
>  #include <generated/xe_wa_oob.h>
> +#include <linux/iopoll.h>
>  #include "xe_force_wake.h"
>  #include "xe_device.h"
>  #include "xe_gt.h"
>  #include "xe_gt_idle.h"
> +#include "xe_gt_printk.h"
>  #include "xe_gt_sysfs.h"
>  #include "xe_guc_pc.h"
>  #include "regs/xe_gt_regs.h"
> @@ -451,3 +453,37 @@ int xe_gt_idle_disable_c6(struct xe_gt *gt)
>  
>  	return 0;
>  }
> +
> +static int wait_for_gt_c6_state(struct xe_gt *gt, u32 timeout_ms)
> +{
> +	struct xe_guc_pc *pc = &gt->uc.guc.pc;
> +	enum xe_gt_idle_state state;
> +
> +	return poll_timeout_us(state = gt->gtidle.idle_status(pc),
> +			       state == GT_IDLE_C6,
> +			       20,
> +			       timeout_ms * USEC_PER_MSEC,
> +			       false);
> +}
> +
> +/**
> + * xe_gt_idle_wait_for_c6 - Poll for GT C6
> + * @gt: GT object
> + * @timeout_ms: wait time in ms
> + *
> + * This function waits for GT to enter C6.
> + *
> + * Return: 0 on success, -EAGAIN otherwise
> + */
> +int xe_gt_idle_wait_for_c6(struct xe_gt *gt, u32 timeout_ms)
> +{
> +	if (IS_SRIOV_VF(gt_to_xe(gt)))
> +		return 0;

Why?

And why not the PVC check right in here?

> +
> +	if (wait_for_gt_c6_state(gt, timeout_ms)) {
> +		xe_gt_dbg(gt, "GT is not in C6\n");
> +		return -EAGAIN;
> +	}
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h b/drivers/gpu/drm/xe/xe_gt_idle.h
> index 9c34a155e102..2c8e9adf4a68 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.h
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.h
> @@ -18,5 +18,6 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt);
>  void xe_gt_idle_disable_pg(struct xe_gt *gt);
>  int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p);
>  u64 xe_gt_idle_residency_msec(struct xe_gt_idle *gtidle);
> +int xe_gt_idle_wait_for_c6(struct xe_gt *gt, u32 timeout_ms);
>  
>  #endif /* _XE_GT_IDLE_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index ab4da1d9a9f1..379795ac5e7b 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -1381,7 +1381,7 @@ static int xe_pci_runtime_suspend(struct device *dev)
>  {
>  	struct pci_dev *pdev = to_pci_dev(dev);
>  	struct xe_device *xe = pdev_to_xe_device(pdev);
> -	int err;
> +	int err, ret;
>  
>  	/*
>  	 * We hold an additional reference to the runtime PM to keep PF in D0
> @@ -1396,6 +1396,17 @@ static int xe_pci_runtime_suspend(struct device *dev)
>  	if (err)
>  		return err;
>  
> +	err = xe_pm_check_device_idle(xe);

I still don't like _idle prefix in here...

> +	if (err) {
> +		drm_dbg(&xe->drm, "Resuming - Device idle check failed!");
> +		ret = xe_pm_runtime_resume(xe);
> +		if (ret) {
> +			drm_err(&xe->drm, "Resume failed after suspend was canceled");
> +			return ret;
> +		}
> +		return err;
> +	}
> +
>  	pci_save_state(pdev);
>  
>  	if (xe->d3cold.allowed) {
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index f517bf453b54..f03a463d2a05 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -1030,6 +1030,30 @@ void xe_pm_d3cold_allowed_toggle(struct xe_device *xe)
>  	mutex_unlock(&xe->d3cold.lock);
>  }
>  
> +/**
> + * xe_pm_check_device_idle() - Check if all GTs are idle.
> + * @xe: xe device instance
> + *
> + * One of the ways to do this is to check for GT C6 state. This check
> + * will fail if some component is holding a forcewake, for example.
> + *
> + * Return: 0 on success, -EAGAIN on failure
> + */
> +int xe_pm_check_device_idle(struct xe_device *xe)
> +{
> +	struct xe_gt *gt;
> +	u8 id;
> +
> +	if (xe->info.platform == XE_PVC)
> +		return 0;

PVC check belongs inside the gt_idle component,
where the RC xe decisions are made

> +
> +	for_each_gt(gt, xe, id)
> +		if (xe_gt_idle_wait_for_c6(gt, 200))
> +			return -EAGAIN;
> +
> +	return 0;
> +}

But anyway, why this indirection through xe_pm? Why can't the xe_pci call
directly the gt_idle waiting for c6 inside the runtime_suspend function?

> +
>  /**
>   * xe_pm_module_init() - Perform xe_pm specific module initialization.
>   *
> diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
> index 6d5ab09cb769..a4fdc9c5cb10 100644
> --- a/drivers/gpu/drm/xe/xe_pm.h
> +++ b/drivers/gpu/drm/xe/xe_pm.h
> @@ -36,6 +36,7 @@ void xe_pm_d3cold_allowed_toggle(struct xe_device *xe);
>  bool xe_rpm_reclaim_safe(const struct xe_device *xe);
>  struct task_struct *xe_pm_read_callback_task(struct xe_device *xe);
>  int xe_pm_block_on_suspend(struct xe_device *xe);
> +int xe_pm_check_device_idle(struct xe_device *xe);
>  void xe_pm_might_block_on_suspend(void);
>  int xe_pm_module_init(void);
>  
> -- 
> 2.38.1
> 

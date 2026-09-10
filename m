Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8BADC79FBB
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 22:24:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B1D510EDF2;
	Thu, 10 Sep 2026 22:24:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cr3wv9iO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ED1810EDF2
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Sep 2026 22:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789079046; x=1820615046;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+Mha2jksNtUpZNjJFSPbqWqoJWIRrpvKewBmOnx5uw0=;
 b=Cr3wv9iOchD308t+WxNKp8iMmtotjX0KPnrI7wZ16+BcesTfr4X2ONcv
 j3RGndZrborI2IH9XQfoq4L0OCuvQw8w3TtlzwrPQDko42LNPdZNpK8V5
 rtPEDBnthA1YD4N0nLhxCiMTPVc2eRCXgeQMRTh7x0OXkaphhhbPb9QFR
 z8Jvi2IOPfLPzX9GTLs+pUEBjekXwN6DjuOP3vrPgyUkCZkwaZzeoY7zr
 HEhI5RA1lYWaT4dZTgMXqIKsFlPc6yg/ESAGReaVrN0RDpm1UASOjVZkl
 egt+MIgCHEMioxCidvQUGQkYuCuKbGBp2FoydjhiW/nJ9s5APSuoKKZ0S A==;
X-CSE-ConnectionGUID: NA1yBiXlROe80iJSFap7tw==
X-CSE-MsgGUID: I7YVQog5RJ2LwRU0fKzGMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89753756"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="89753756"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 15:24:06 -0700
X-CSE-ConnectionGUID: lpT3SqJOTwqjvjlnimjquA==
X-CSE-MsgGUID: 5Jw/aLMRRuSv+ElCVyGceQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="275281062"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 15:24:05 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 15:24:05 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 10 Sep 2026 15:24:05 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.53) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 15:24:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dkoos8LE5UfNn8knPRZbCRHU+Zjp/OoMYaXCVdOKYOLzKbM+nNkZw7cEvQIaIE+j7uHgslhbVMpdfANAS9GSSoDOmp4zlXKj735IqBpoDvCyJJJ3L9wxIkSNi0+OcU5u/3PDE5VvGvv5tKQcRIIvruzXQOVCZMWTPLMYMT7ZhR8p2sRYI1ZqMPI9TnFF7sWmO0Vxnzp1/RHGIZGH5QcIKAsP9X1Zs/wlTnllK8J29ZqOwpR0uzgL4Vo1+Ya9PBumexRS3ZWzhKjIBqxUWGr3/i7V7lHpNxUZmvW28X1BF3zfxZ1JsIVWUabo83l63dnCgGsKwEYO3zca6WEslavZSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gQqPqCroRuKB3OdkYcW59ktgHdBemNSxySZp6XQ3YCc=;
 b=fTCllRR9OrOKrA/PYX799bg3xKunIAWGm0ZP348+seYkrcHtCD/Qb2+sJ6tu4n5CgtKEwTshuXBjiEtn7bZgvyU0cp3ppN3c5ax4mBLs9KNLHbqohlY3XusjfA3OCRyrvIoquQhM8GBXH7ZOJFJ1VPfizXYCN1lA4G+MA0Sojo9ArqZb7o7MU2GhKoCOH3vyKsCNxPIFJIUCELYDCj3OpyWJt0wLSwOHy7wcCKGZw95Ulq6LBujvq8tyJ2XswO4JgnTqidWLu6X7nCGHQ5ZrP9qjI8OgEp2JJQKiilQZMfG0acyyfCo8220Y57ic0xEEXJ+uJ1YHyh6artT8S3cOHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by MN0PR11MB6279.namprd11.prod.outlook.com (2603:10b6:208:3c1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Thu, 10 Sep
 2026 22:23:58 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0406.005; Thu, 10 Sep 2026
 22:23:57 +0000
Date: Thu, 10 Sep 2026 18:23:54 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Badal Nilawar <badal.nilawar@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe: Poll GT for C6 before D3
Message-ID: <aqMt-pHhq4T5hLhO@intel.com>
References: <20260910212823.2358362-1-vinay.belgaumkar@intel.com>
 <20260910212823.2358362-2-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260910212823.2358362-2-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: SJ0PR05CA0179.namprd05.prod.outlook.com
 (2603:10b6:a03:339::34) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|MN0PR11MB6279:EE_
X-MS-Office365-Filtering-Correlation-Id: 19cef1e0-7472-4660-08c5-08df0f8a34df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|10067099003|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 7STQIx2hoHXc+87t86iWkd3M9srV8vFsKis7t8OuYYU36olPAH/ufDT5bEZ4VRzp+wsEjPftP2xOOclaq3OqHSxsbm5ml7mEcDo5yyIDSkqE6Viz1UKLYgUCnP4t0K4z7T5x7uzDcP6jhCsyPCMb4UPM24nN2BcYC79tYy3z2STAsOzuD38pjm6Qy5Y1Y6bYzBkWrEM8hM4oNnHxeVPXcuaKhDMx2FvGwcS2I5OjQgTamal3rTvRNkgnKIh97SBvciZaS3jgMeWb0FWYUgLS5tU4hHnLRZoAzoOhKCICNRaRTNsvbLQIKYSlWsV2eZqIG/BBMd4Up0Dwv8diPrmuJmb90WfwQN2lJaaJvUDMyQDSpX7jhmhVxGc/AxswzenK/Vmcs00Uk1QL7bYTbCspg5Uz/WGc0NovNRd+KPHj3cCEwyt4XhrTkUunn+X8p6NJH+X9NeZXER0s4g3xWSnPPyE9oxMtMKVtmvDu0Hml1q4wHfqJH43bnmeIucWLv/TP01uVmu4H014E4Hg9HDey6+FEtg0/qg/1ZI99GGm1qVdPp/FPBfaZQJCn1PDwOlLE4joCbUnnnjB88fLwPDGk98kh031zJoBijOMXUPwppuFo/Z1he98QNhAu8aZy4BdJG1NoBHsBaDSMXQeGfSPgUhRI8diTcnIMlVKs0QyZSVI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rswAkxY216eDzcVrwyV8rDNMtVXOhohh4wlCdzsKJuWlDiLuYSu7p7TOBhI2?=
 =?us-ascii?Q?Wda5RTZJ1m9WNz0l23wC642HFGrAOSWi6QPpRT+hhbcVPuFpA238RXYnzks6?=
 =?us-ascii?Q?r49KT44lMkStyG27FHdgIi6cbgKYuiiuyeKVESDRC7qKTSEX2dT/sbdMBjaT?=
 =?us-ascii?Q?znDCIRNRmOwZulhDYMMInY1X4Bm2kFyjrZ+FzNZyD3wAIUWRDxlqNdUj3PoC?=
 =?us-ascii?Q?jL2Vo8+3EDRMh3M/0d7Ikt30hU+A6dTDYts9FmM0DEdyvUdn+PLrGD00eo6D?=
 =?us-ascii?Q?AKGe5CHc259M0V264C9mr2lCK6aWKvIdbhQF+fhvPymXoX2aS9GsAZ4GYAv4?=
 =?us-ascii?Q?jH3XGgIZ1ILueq5ZEHWC/F6wnv7ROFpwYsKe30s8PsSonqSx1gAjbzFI/XyL?=
 =?us-ascii?Q?2D5tmnWj782l0MCTJfEj+YSD49Jpr+/88zKxdFkUgFYfOXryC85jDgEPnNWA?=
 =?us-ascii?Q?sBfhqp9PCQbGyvHuw+2kHLoCcZnlf6SHHU6ysVWYiASeTxVrGq3iVTCGfT0E?=
 =?us-ascii?Q?Q1Td47nAdgZPJ3LvUoIf5BH+iIUQjKz/WAIap9iIc4G47G+GoJVmdoEPy4Z5?=
 =?us-ascii?Q?hiZ23ap8zA8xE8+dFe9j17NLIVaebiEPR8Zsgq/MDwadcRT+iqF9O6U4f9B/?=
 =?us-ascii?Q?M3O7ovb9QzVSZKZ8CKx1g+iBgAyOrWztfDx0nINc+M9OMuucZd5R1aZWtGdJ?=
 =?us-ascii?Q?iVlq+A7pRLQdcHWT1f24f1KBPdcB5fQwvcjz3iNUpX+Nb8GKxzXexy3lkwiG?=
 =?us-ascii?Q?RfW5jwubuBXCHLLBWGDOGBJlnLlPwUGIBFxggw8mM3niYyE+sLGQ6Z0zbDKU?=
 =?us-ascii?Q?iqcyUXplTdnhYpR2f/80pZFcBVQTvmfd9jrm8dlTNkGaul1Lf+qtE0XIKBTA?=
 =?us-ascii?Q?T5HwFXZiucY1WJZ4nNBY7VCnJCkhYD1t38JUrj3H3bCQJyVWIrpDsbEXXyXs?=
 =?us-ascii?Q?sbV3NQZ79L73AwxTp3GEDCH1/QlOfnx9crdTRHTyO9BWNdYlw0nzAT7lHk58?=
 =?us-ascii?Q?efuGZM1MqVnwcmWYsfLOcIBIdiLihdo7h998JiTUnKbsEyjWGVQCDxQf187A?=
 =?us-ascii?Q?txCKMOSnaMwHiR/ERON3VMRTwZcQrBDmo3ZUBovteq9el0CknKBbT/1+CYw2?=
 =?us-ascii?Q?ve1LFxWg0Wh7ccGhLPu7gjwjyZwhk7THPrfwXKwbsGL2Z4c37BhzAS5EEe47?=
 =?us-ascii?Q?KsoY5MS7YyglMyBfRwp6kMwxFmkDyA1kqBTGLNQBEBL8X+VbIO5E7r9AYe9C?=
 =?us-ascii?Q?6hNyg0V1cl2N7wgQ+8X4QmmBneA/7HY8Uo1W0bn0RQxkG9QAne8f/0Lrs8rQ?=
 =?us-ascii?Q?7hdEUVAJrHFw+2m2ELXOKj1wbTRjG07bd0ZBLzqK6MrnEdtP7+zHBcDI1bHA?=
 =?us-ascii?Q?33suqDj4VeqNaX76j4pvmqIL31cSFQ9kLuxpLvKS20mEydCsoLfSbjvxuXr/?=
 =?us-ascii?Q?v96cJA3opm1GLqpO4plHePtj9dDggXFJMKClb2oLbgJKHTfJGDAS7ufC5kqH?=
 =?us-ascii?Q?xgNC+r0xRyl39SmTm5jciItbLQlkdhRBr4vBs0ZNwDOPpztcYdCa3AdP5/pw?=
 =?us-ascii?Q?GhKahbgg4lD9iKhLYE2ugaBcReTSPFDg/OJSZreGNFFyMrtVZqjv5G1yEXy8?=
 =?us-ascii?Q?zWpJyY8TKnJF7qkyYdUTxzVXNjUrY7lpeQiqsY5Hhjc1mHbLwyWylyjgAMvI?=
 =?us-ascii?Q?JbVj8uildNXJUmukKeZkFJsw4sMpMFrJkMWBiz8pHQCqUuFaUq5chGgLHAs8?=
 =?us-ascii?Q?5eZRFHt5NA=3D=3D?=
X-Exchange-RoutingPolicyChecked: wi7AG0LT76hR98OFZ8PNOmMBBPpXJ3Bd/ehyt0JTHR5Sg5A9h9waafX2he79Kj2wVFmrwnZGaNd/KbMbZiZeAxT86TxEVnVdZVYCKHGmEhGlT9OEmfjOLcZYPlDvgA5QlCdnrF16UHxHy+QJMJPKkwK5P+4YwaLQgZosge45m1LNyMp8k5ftMtjYNq7lMvHkEt0UmZsvUtnhnupNj+aIShdz0v5GGZLScqQTyflhWh4dlYYqOHKXf+TQ04a/w/JP7SX4YfH0ImgXFYqvNVW+LVLt9FkI68oBSKNtNa9+vXtRzl+mgWKGxt7t8SRNiquIbKeTp5UmMUTxYLPJH86aQg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 19cef1e0-7472-4660-08c5-08df0f8a34df
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 22:23:57.8628 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zZu+R9mILeAtz0qQlHR3abNJok/fVjYMWR7tlCUQ3aG9cIHbtB/UpyxdnjLAj/s1jElf4tbqxF9KaHxKO0JKgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6279
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

On Thu, Sep 10, 2026 at 02:28:23PM -0700, Vinay Belgaumkar wrote:
> Check if GTs are in C6 before transitioning to D3. PM subsystem can
> retry if this is not the case. This ensures some component is not
> accessing the GT when D3 state is forced. This check can be added
> to the runtime idle check since it helps to check for pending
> forcewakes as well before we poll for GT C6.
> 
> v2: Force resume when we cancel suspend due to C6 check (Sashiko)
> 
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_idle.c | 37 +++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_idle.h |  1 +
>  drivers/gpu/drm/xe/xe_pci.c     |  9 ++++++++
>  drivers/gpu/drm/xe/xe_pm.c      |  4 ++++
>  4 files changed, 51 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> index c208d7563e36..e077f9a13473 100644
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
> @@ -451,3 +453,38 @@ int xe_gt_idle_disable_c6(struct xe_gt *gt)
>  
>  	return 0;
>  }
> +
> +static int wait_for_gt_c6_state(struct xe_gt *gt,
> +				u16 timeout_ms)
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
> + * This function polls for GT C6 state
> + *
> + * Return: 0 on success, -EAGAIN otherwise
> + */
> +int xe_gt_idle_wait_for_c6(struct xe_gt *gt, u16 timeout_ms)
> +{
> +	if (IS_SRIOV_VF(gt_to_xe(gt)))
> +		return 0;
> +
> +	if (wait_for_gt_c6_state(gt, timeout_ms)) {
> +		xe_gt_dbg(gt, "GT is not in C6\n");
> +		return -EAGAIN;
> +	}
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h b/drivers/gpu/drm/xe/xe_gt_idle.h
> index 9c34a155e102..74d6bd167fab 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.h
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.h
> @@ -18,5 +18,6 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt);
>  void xe_gt_idle_disable_pg(struct xe_gt *gt);
>  int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p);
>  u64 xe_gt_idle_residency_msec(struct xe_gt_idle *gtidle);
> +int xe_gt_idle_wait_for_c6(struct xe_gt *gt, u16 timeout_ms);
>  
>  #endif /* _XE_GT_IDLE_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index a79d928ad75a..ca7898cce2aa 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -1343,6 +1343,15 @@ static int xe_pci_suspend(struct device *dev)
>  	 */
>  	d3cold_toggle(pdev, D3COLD_ENABLE);
>  
> +	err = xe_pm_check_runtime_idle(xe);

I don't like the _idle inside the _suspend...
This can get messed really quickly.

Le'ts only do the wait in here, but keep the _idle only
checking for the fw bits...

> +	if (err) {
> +		err = xe_pm_runtime_resume(xe);
> +		if (err) {
> +			drm_err(&xe->drm, "Resume failed after suspend was canceled");
> +			return err;
> +		}
> +	}
> +
>  	pci_save_state(pdev);
>  	pci_disable_device(pdev);
>  	pci_set_power_state(pdev, PCI_D3cold);
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index e8d4cdbaef88..04529a242998 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -1046,6 +1046,10 @@ int xe_pm_check_runtime_idle(struct xe_device *xe)
>  		if (xe_force_wake_any_bit_set(gt_to_fw(gt), XE_FW_DOMAIN_ID_GT))
>  			return -EBUSY;
>  
> +	for_each_gt(gt, xe, id)
> +		if (xe_gt_idle_wait_for_c6(gt, 200))
> +			return -EAGAIN;
> +
>  	return 0;
>  }
>  
> -- 
> 2.38.1
> 

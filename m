Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B73E4C02193
	for <intel-xe@archiver.kernel.org>; Tue,  4 Feb 2025 22:30:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D6BF10E119;
	Tue,  4 Feb 2025 22:30:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VuBexTsE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BAE010E119
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Feb 2025 22:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738708236; x=1770244236;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aPmCcdfF77sUvfFU7Vf/iW9VStOjUfrr6hlVFrXRh48=;
 b=VuBexTsE3V2giGOkJbKm5rJbl/OLjZ56Q4X9m0S3zM5adHh3PQf+6/0d
 n+SWr62rCC7OvYl5UUjkP7ebRJwSJ+kKFERx7CqWz+5C0XSILjYPhtU/5
 +c6H5anD5xczZa2/ppFIt5I9+c6SwuYeb+yTUdB1pvPXf+UroEcFbiuit
 oHd7QHVxs3PeHXAzAsUxYQUnN7q3ofvdV/GWxuzotIWQpxIbewRAmpI/r
 /Sd2Za4JE1laErghVf29zOxOSF9rbX9s/fBnR4Ej6TsU1FBYJt1tLAG1D
 abkwmyEWl5Xm9wNu/nZecOnItgBF5UZDqUe/eDJtRPPfmchx1gM2o6qlS Q==;
X-CSE-ConnectionGUID: GwpJmphiS2+7BP8Uuo59eA==
X-CSE-MsgGUID: PzmrHIjjT/K0wmbRTDUtAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="49874682"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; d="scan'208";a="49874682"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 14:30:35 -0800
X-CSE-ConnectionGUID: I8XulFWwSi6nUzKRLSYL8Q==
X-CSE-MsgGUID: eEWBGTRgQ92qNdl7VwcwOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; d="scan'208";a="110569145"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Feb 2025 14:30:35 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 4 Feb 2025 14:30:34 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 4 Feb 2025 14:30:34 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 4 Feb 2025 14:30:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N/KrkM1+8NRK0dPCbiPTNbpBv+zIBp8Asnst/PTIUhLkJ2enGevFSH4AneK0E3AXH5om7/7IbaNAuLXKJQILPeaSpteT7sGPgA6bKFbLKMWWQC3PJY/J4Okz2DjB+1zqkIVcf8SLfYMwr4wpwFvlmW/N/MP6n+NurFr+y6ZiGw8rZq8Tj9y+0/KOZMuK2R0I0dDC6QHN9ciJh7QcMtwMsmGjTyDnI+kc38u7cJaYrqoL9gvOZSsI2z6hVZSQTerAn5kDwXN7kuDfW2mLjl1C9qsZR7/s9oaAlWTdjXfEVUgTf1U38rIKDWX/zXoPsju2paVtVv5CkPCunpk2NRVvUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xo+9wrru5ijm5CT3627/rjCaky92ddScZtP8QxY3eSU=;
 b=DwCzEnQ9H7mk25429YFLR/aycAac3Tqcn4iWd28MxluCUKxm8WROoI2neUgs896PHL1hqRT20ouG2dJoYGujzHjMEC/zqU1fCJPG4USHlmgOihPW4wZr4lW+1sjFW/Me9hij50j5dLrds/3peC2QJxj0Fi29AXl0IMH/rvpGIRMspj42Tvyqqi776L0HZ36RVgt2qAb/hWUaHRrGsLxE+slSM4+RU73+ZTxLh171fTY3CyAYEcXiBhQO/IQU2S+kNpK4UqiT9RqiKWyRTDSUC10e0+rsmNaEpz+/b9aT/ulOMAsmGN+sOx7lg7be0W63NaKu2kh4ty/x1OEZftsj2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB8527.namprd11.prod.outlook.com (2603:10b6:510:2ff::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Tue, 4 Feb
 2025 22:30:31 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 22:30:31 +0000
Date: Tue, 4 Feb 2025 16:30:27 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Riana Tauro <riana.tauro@intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe/pmu: Add event tracking
Message-ID: <tbg7365xok7b6px5rnvvnkuklln7zhbzr7ahmkmdpdpw54yoko@i7fsjxiefpul>
References: <20250204180905.1347210-1-vinay.belgaumkar@intel.com>
 <20250204180905.1347210-2-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250204180905.1347210-2-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: MW4PR02CA0014.namprd02.prod.outlook.com
 (2603:10b6:303:16d::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB8527:EE_
X-MS-Office365-Filtering-Correlation-Id: 59e1b2d8-ca4f-4969-8d63-08dd456b8852
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7NA8Yz+qgaEBwcSxrZ8VsV5Z4gT0lCYU7XyL+oLDcca0dJp9tCzJRAGTgwns?=
 =?us-ascii?Q?BM7RI+GmQHjq3W/Bw1jDSF0G7eshYsmzG0NA5q1PdD7buT2QHmEEPKRjkRps?=
 =?us-ascii?Q?j8aqu/8fTkmALBYGFEZs+BfQUMAlBoPKsS9sznE2LIBjMb21/ohmBCGy4Jrh?=
 =?us-ascii?Q?LYbCw4Pr/THVm5Qt0sYgp1e0kFhyRMC7h/V06FLtC18vCVg2JoKNuFZMPNpx?=
 =?us-ascii?Q?CjMzH1xEjxRCbHXzQeCsXjaxzyNAdc4Mz588k/A5fNP52mu4zrAeHvT6DaS9?=
 =?us-ascii?Q?1ElhkluxPad5wdRpusZhLCwFiA5A3YITfCaCq6YmiMxfIo3AiT2JMLdLC/6K?=
 =?us-ascii?Q?U62qe+vs8LcdVfYO/YMVAIew0AzEL1ypsNPQSgSxvfQQj/s80W7umy/xkYQs?=
 =?us-ascii?Q?1EZo+5bmNsxJuzAm54y8zjcfKhPp0EUVaXBn1a7JL4Pct2HwxGB86rluQwhi?=
 =?us-ascii?Q?c+eQd71ejc9al17iuUVTBZwytrDsU88GjJYgDWuMEtE1omi9MD5nt9LYWywI?=
 =?us-ascii?Q?xPPwjxpQdHnxZCc0dNBPF89jRllWlW9H3lnoMQ/USPmJm3eTmBT8vBIiVPpA?=
 =?us-ascii?Q?67zC3GMHB/+qx+uCWrswSUWB7ZAKCwaInWsyzcWSi2EncueMwBvTvNQOSFIj?=
 =?us-ascii?Q?d2bkYR+Qo9jK5GocaA2zM0Z9W+yOFjFLBO0P55yqZYDvOlAs0HSB7MytRLx7?=
 =?us-ascii?Q?S9UeUhNTlJhkqc7p2e9xB+SZdvIgiu189lYOEC4+XOql4+15jOHfr3pFdudq?=
 =?us-ascii?Q?8KzdH/bTf9BfIAGNb8y8FtcucxDzslHyIxm7aU26TJNDG0gzz9NFx4tOeP9S?=
 =?us-ascii?Q?tdhOcnN+WAeKy4H9M7LWksSmP026v61TPNzo6GIWaI8S3cbJoV2ndbuiWxW6?=
 =?us-ascii?Q?MR2UTMaNxUOq5dtpoA0dnXUWZr9nE/Gv88GcCEY5fiIgqbGP9r+e2T0kg1GC?=
 =?us-ascii?Q?DnGGKo386K+7fhW2fjZhafH2z8o1Xq0IpeS/hY6hETpyZD8R8z0h8hxupKKj?=
 =?us-ascii?Q?ex3q4CJZ29G83YdBwwXqLCXk0Kjqs/GCr8v4ABFBQnXqDligG7scUW58OXfJ?=
 =?us-ascii?Q?J7tQqLjw1C7yjZLoIwZHEqvkyd7+6IyoVkG+FTwqMjoB5VY13ZUlF5ygzIWW?=
 =?us-ascii?Q?BYUZIzWAS+U9npJ6o63xgkLJtdLI5R9Ap9ueeVWCYFzIwVNV+3M0oQ9lTm5o?=
 =?us-ascii?Q?vq94aLTj53K3SBBBm+/r9hVT7AOmTD/b3QoIEDceOaJY58SEJ/f7CSO2iJns?=
 =?us-ascii?Q?fXo7efPECiQMGNRTkEJAJ4PxGcJMp0UtMqvO8gqyFptG6Y6Lvgr1+ThhwF5d?=
 =?us-ascii?Q?+KO3yNdI5BMrU0Tm8sppJnUdPAs+2JKNZXwcDDJlvg4NU4E5oadhB3Hsw47K?=
 =?us-ascii?Q?v7xUXLoHYAo1D11v85sWi/xP6CpY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6h312t6NX2Kq30TrjM8IDg+OGy1pBO2xS7tNoYSQ37/SUYAurlx1O22alKMV?=
 =?us-ascii?Q?O31usXV0F5lgWPpnKB2bxDdAZNabWgwahVOJdGS5dBD1VeyfsRsZjkWdVi5p?=
 =?us-ascii?Q?WhCH4taxegrMdqb5WuAdPE7GDbpOY8LJj1U+kHYnxUrTwo41ZPV/RWv7Web4?=
 =?us-ascii?Q?MoQHflXkXcXAZsRw4+7MSHob/6z5V43hb+6Qttsevl3a+wmSSLWamvR5LKdK?=
 =?us-ascii?Q?+YVh/aSTAYS1g98to3s3lL02Ucov5zOjSd9fOXyEAcqJ/BEYAvu/p7PCZ57m?=
 =?us-ascii?Q?bEnonblR1mCFzKUApYogzQCtMl/9ZsGd+x7mAKKEdmec9OQr47v0Clxaw4iA?=
 =?us-ascii?Q?Cg0bhH7wBEIntx+9mAPw8TA1Oit6zMyXrXeYuvxk0107oKmI7UZ6kLO4Xi9d?=
 =?us-ascii?Q?p6Qjt5JQQ6hNoqNDnaMGi0F7HoKi/9HkMr64P5Hr+xS1dIpMyY6+LSXEGsbi?=
 =?us-ascii?Q?aBgucoukcue/RAq2J+iKMpccvdK4QSY940uSyBPGyOyWQK6B7X07PGagx4ej?=
 =?us-ascii?Q?/6oyp/CEnqFcOWEs1Ls5UVL2J2ShgWB4QaZC7Mu0gFRN2aATb70ZxfQPfQJH?=
 =?us-ascii?Q?gqbYqVWcL6PtV609coeoyjG+wcJA/qdBA+ujWAhAz+djyr8SWWj/D5m2pyqD?=
 =?us-ascii?Q?jMqrPvVmkhy5QBYrIGUVCB4fgsZCfgoyhkUpeG3wygHIbZnoqVtkDlgyH7ZE?=
 =?us-ascii?Q?zBwhI+fYlza+8PLacPWXmfLFJI2TeImiWWY1leAmLuofmshdAV7KTMlWNTOS?=
 =?us-ascii?Q?+SpMsHSWUAuWJNeXVVh3TCyouidLMTDqCJU7G7OsIhmPBieryCOp4zp8vMaT?=
 =?us-ascii?Q?/vWBPT3g1eXgsPqbKZ4P7sphfx//8udVJzuaxmEihbk8dz7j/y9lVC2Jrbqj?=
 =?us-ascii?Q?iXqlyyVMtgBalzsiBvoo6of2fQMGBBlTtc4pKcmoLIIGVi2+aYvq4cBGFYFi?=
 =?us-ascii?Q?Ht/wsngPqYXPX1B5umKlufW7v1tHXBaaPofGM027x0XPuhiA8AuhhElQSzyO?=
 =?us-ascii?Q?UOKwW4fbHzG4e1/0iwKzK/nYBX3CtlUTtuOOMYnwp5VJmVHc+gWN3U0Nu4U3?=
 =?us-ascii?Q?Skm+dqupZGIh+mxUJW4BF0L6Nh2Ogo7plhCY9fnXF9sHV9efVW/NsJEM8eGV?=
 =?us-ascii?Q?3Cko4CpXzZEXBNuBneLFqWyzgukg+pRLeNvYXr1hBtufo09LCLYJ5i4j9Gbs?=
 =?us-ascii?Q?GG5Ysa7tm/ybzjmNh6tPRwJ8iW5w/2EvOZAq3oG19B9S432Y3t6uxY+HBJ9G?=
 =?us-ascii?Q?PnwjQcCHLv9clM6DHnoChdEgApMfpNr5Ik8LnnJC1FXabV97MFALLDwTR5TI?=
 =?us-ascii?Q?zosOSVptw3uQ0FpM+PQ5EQ5EX2zezvTAHlEsPOKGP7T0CQ2cW7MHRoW2t2Su?=
 =?us-ascii?Q?1ursPj6VgUMM5igh16NvE243QSETrmzMlEZQ+r9UOn8M292LufHn2k59pgYj?=
 =?us-ascii?Q?HwMPV02nVXO2eP24nyq9wPxqedViKkbjn3gR5Cgh2pNLnm+dJWBJ8qKsfTDV?=
 =?us-ascii?Q?Wx6dQm/l4VuSP+JoW3jMsGc/0ZijawJY07XSxFzswHkXULp1j+UKwpacJRcS?=
 =?us-ascii?Q?CJr/6Qu3tsp5p/0ZhQ9bM6jgtZAYKdldTuHvXHkCrdlII7rIdZmG2teskNga?=
 =?us-ascii?Q?FQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 59e1b2d8-ca4f-4969-8d63-08dd456b8852
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 22:30:30.9254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qf8i6D4kXTGUXt3NLEM5CKvH7/bYDIl73sb1sRHwlCn57gA07TpG8DTePLA4CxjJlslcJ9ffw86T5SF520C8zJd0j1hUF0+RYTiRhpqNXSI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8527
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

On Tue, Feb 04, 2025 at 10:09:04AM -0800, Vinay Belgaumkar wrote:
>Keep track of which events are enabled and number of instances
>as preparation for the PMU frequency events. Also add locks where
>we update these structures.
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Cc: Riana Tauro <riana.tauro@intel.com>
>Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>---
> drivers/gpu/drm/xe/xe_pmu.c       | 44 ++++++++++++++++++++++++++++++-
> drivers/gpu/drm/xe/xe_pmu_types.h | 14 ++++++++++
> 2 files changed, 57 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>index 3910a82328ee..10603e7c3eff 100644
>--- a/drivers/gpu/drm/xe/xe_pmu.c
>+++ b/drivers/gpu/drm/xe/xe_pmu.c
>@@ -8,6 +8,7 @@
>
> #include "xe_device.h"
> #include "xe_gt_idle.h"
>+#include "xe_macros.h"
> #include "xe_pm.h"
> #include "xe_pmu.h"
>
>@@ -38,6 +39,11 @@
> #define XE_PMU_EVENT_GT_MASK		GENMASK_ULL(63, 60)
> #define XE_PMU_EVENT_ID_MASK		GENMASK_ULL(11, 0)
>
>+static struct xe_pmu *event_to_pmu(struct perf_event *event)
>+{
>+	return container_of(event->pmu, struct xe_pmu, base);
>+}
>+
> static unsigned int config_to_event_id(u64 config)
> {
> 	return FIELD_GET(XE_PMU_EVENT_ID_MASK, config);
>@@ -156,6 +162,21 @@ static void xe_pmu_event_read(struct perf_event *event)
>
> static void xe_pmu_enable(struct perf_event *event)
> {
>+	struct xe_pmu *pmu = event_to_pmu(event);
>+	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>+	const unsigned int event_bit = config_to_event_id(event->attr.config);
>+	unsigned long flags;
>+
>+	raw_spin_lock_irqsave(&pmu->lock, flags);
>+
>+	XE_WARN_ON(event_bit >= XE_PMU_MAX_EVENT_TYPES);

^ not compatible with raw_spin_lock... if the warn triggers you are
likely to bring the machine down. it's also called event_id, not
event_bit. 

Please do not copy and paste from i915. It's not a good reference.

>+	XE_WARN_ON(pmu->enable_count[event_bit] == ~0);
>+
>+	/* Save the event config */
>+	pmu->enable |= event->attr.config;

what does "enable" have to do with config?
we can't simply OR any event config since there are more things than the
event_id. Suppose userspace did this:

proc1:
perf_event_open(gt-c6, gt=3)

	pmu->enable = 3 << 60 | GT_C6_ID

proc2:
perf_event_open(freq, gt=1)

	pmu->enable =  1 << 60 | FREQ_ID

now when you close the fd in proc2, your pmu->enable field will have a
gt == 2.

it's not clear at all why you need to save the config. I will try to
figure out from next patch.

>+	pmu->enable_count[event_bit]++;
>+
>+	raw_spin_unlock_irqrestore(&pmu->lock, flags);
> 	/*
> 	 * Store the current counter value so we can report the correct delta
> 	 * for all listeners. Even when the event was already enabled and has
>@@ -176,15 +197,34 @@ static void xe_pmu_event_start(struct perf_event *event, int flags)
> 	event->hw.state = 0;
> }
>
>+static void xe_pmu_disable(struct perf_event *event)
>+{
>+	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
>+	struct xe_pmu *pmu = &xe->pmu;
>+	unsigned long flags;
>+	unsigned int event_bit = config_to_event_id(event->attr.config);
>+
>+	XE_WARN_ON(event_bit >= XE_PMU_MAX_EVENT_TYPES);
>+	raw_spin_lock_irqsave(&pmu->lock, flags);
>+
>+	if (--pmu->enable_count[event_bit] == 0)
>+		pmu->enable &=  ~event->attr.config;
>+
>+	raw_spin_unlock_irqrestore(&pmu->lock, flags);
>+}
>+
> static void xe_pmu_event_stop(struct perf_event *event, int flags)
> {
> 	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
> 	struct xe_pmu *pmu = &xe->pmu;
>
>-	if (pmu->registered)
>+	if (pmu->registered) {
> 		if (flags & PERF_EF_UPDATE)
> 			xe_pmu_event_update(event);
>
>+		xe_pmu_disable(event);
>+	}
>+
> 	event->hw.state = PERF_HES_STOPPED;
> }
>
>@@ -334,6 +374,8 @@ int xe_pmu_register(struct xe_pmu *pmu)
> 	if (IS_SRIOV_VF(xe))
> 		return 0;
>
>+	raw_spin_lock_init(&pmu->lock);
>+
> 	name = kasprintf(GFP_KERNEL, "xe_%s",
> 			 dev_name(xe->drm.dev));
> 	if (!name)
>diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
>index f5ba4d56622c..b15858d4d4a9 100644
>--- a/drivers/gpu/drm/xe/xe_pmu_types.h
>+++ b/drivers/gpu/drm/xe/xe_pmu_types.h
>@@ -10,6 +10,8 @@
> #include <linux/spinlock_types.h>
>
> #define XE_PMU_MAX_GT 2
>+/* Event config is defined as 0:11 */
>+#define XE_PMU_MAX_EVENT_TYPES 12
>
> /**
>  * struct xe_pmu - PMU related data per Xe device
>@@ -34,6 +36,18 @@ struct xe_pmu {
> 	 * @supported_events: Bitmap of supported events, indexed by event id
> 	 */
> 	u64 supported_events;
>+	/**
>+	 * @lock: Lock protecting enable mask and sampling
>+	 */
>+	raw_spinlock_t lock;
>+	/**
>+	 * @enable: Store requested PMU event config.
>+	 */
>+	u64 enable;
>+	/**
>+	 * @enable_count: Reference counts for the enabled events.
>+	 */
>+	unsigned int enable_count[XE_PMU_MAX_EVENT_TYPES];
> };
>
> #endif
>-- 
>2.38.1
>

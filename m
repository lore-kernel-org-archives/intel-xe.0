Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 945B7C001DC
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jul 2023 14:43:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A0C710E594;
	Thu, 27 Jul 2023 14:43:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E77BF10E594
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jul 2023 14:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690468985; x=1722004985;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=b91MbJZ1mID3HatOIR2UFtiM4G01bmell4VCqlHw5kU=;
 b=arKC5RHMki2zu+7azu989fznE+BJKK1kJG1q6l7cWqmuaKHViqAdTszq
 irpVjMfjQbARj1lySyJcTJD4uLaCy1z03GWmhghpd02epPWvxrPnsTLYU
 yF6MZgF5oz1Axa8Cj0v3hkDBGwcWMP4gCLr53FsRKnFN9HC63BMxTmnkO
 r2a7/gwcpXti8OQnGhbSnVzbqWc186W5K4UO10l14B/TUWz7388LMuX1c
 v0xYcaqs45JoDZrN0w8LTIEYLJIb35a4ZRhxUdI82/RCG7ZTNQC+b4fmD
 x+2oIbi85g+WYkYCZQ0cNy7f6FeVOnyGhZafvXFrfVkoESGOtFR8i2+qn w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="365790024"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; d="scan'208";a="365790024"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 07:42:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="840823030"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; d="scan'208";a="840823030"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP; 27 Jul 2023 07:42:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 27 Jul 2023 07:42:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 27 Jul 2023 07:42:47 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 27 Jul 2023 07:42:47 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 27 Jul 2023 07:42:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QEpkay7BwHU3K/zuk0XafQzoQJdreDEzy7cdf+oOwiQMDafiybz69zjPVYtY1FHUSciIRqbrZm+WhuQd/MQaasqQKF31Vf4CZ5IrMtnpR1K5hibP6u3Ek8BRKfShW6DU3caBMOVG2p9z391KEJfPWVoQHLIgy04rZHMal9zMjltnEc6m7tF+kBjanjWh0C7//tIDnypgZC7nbQwYqDYY6E56dK5MrBBtAqoHjJe/T6rkhTiIxzTnaFHQ0Pz2Ew35aCTz1qK/SZh2/l/jWL5Vgf1Ki8c5i1ihc1wmc/DsbdDPY6umwd/PewH6Uy2SbmJCFJpRLpdA7Exc0OOCLkV9aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3oEXrvdzA07q3ZFDvmoseBw/f39MXKCkFyVUY/uzfNc=;
 b=UvRz/I0XVGrtc//eGI4fmooMDoiPFVlrz7KdHF6iD+FJS2whYaghrgOkzayq6wZL1XtfaTRF+p4fBsAkByIgjsLLhWU7fivbSBNSlC8Ch6AD9Odw33vMjUydoYK1gUvYb6xmIZM254mT70GJhlv4NpNT50jHvN+MG7LoPthnMmP/rfpRFNGFohmZiisL8L7oAAM1gdifHRLMOvqr38HZOMn9dueG18xYf1YkuTMJtYbkyNun6cGQvIwgIMJtDlJHWFXCzDmf2kqUQ4rfg9tBEYC/FzVWsoXonkh/9C6ADhlAU5ZZGdtddKLck8nBU/z3RfOHgk8U0I1qZP6fJ9OGYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB7941.namprd11.prod.outlook.com (2603:10b6:208:3ff::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 14:42:42 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0%3]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 14:42:42 +0000
Date: Thu, 27 Jul 2023 14:41:55 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <ZMKCM9cxTq6ww/1c@DUT025-TGLU.fm.intel.com>
References: <20230727082235.905240-1-tejas.upadhyay@intel.com>
 <20230727082235.905240-2-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230727082235.905240-2-tejas.upadhyay@intel.com>
X-ClientProxiedBy: BYAPR07CA0104.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::45) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB7941:EE_
X-MS-Office365-Filtering-Correlation-Id: 34519299-89aa-44b6-5772-08db8eafbbe5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sjcL979PLm3hui9mq/RZr4HuD+QnWxWfD/ZsctB2dUjBATFotgHzooIvrHRPlYJzUUvF2Vo+lImRcUlnF54NkEWsstowCRQp5qSjth/HhYzR6jxoi3Z8xuAiZvrJivHcjdMbKps3eGoyhKkcAn4ieR1rCQZALBLsj4koWA+zX8W6eXJLCjaGKbMUARA9s9zUhjQugZnY4JHZyYWEvDWX1muCc9rlNtJOMld2yQmgn6zTsfmOxkueyLRzieWyCKlJGL3sRXkTstJZ3HDUD1UFlX26FywcaanXVB1xs8E+Ks5Kx+XHdUUgNHIDBZQ4xPYmJOeAveQI15XCRo08/fFfQPUE88+rYRPTEESHAi1JoflQs0tokXzSIQ1Q+7LOGhJyw8HR1eiUJpDU6x9ARwy87KaLLwBeNNx/xZhyTrbDTd1Ywk0W26V4r9mGsUE3GyPqqlCW7CToIS9Pgo6P+jgaKTATpplhg4WraVF08C+Ct0KH3DQoqquXMRATwiXk3tsA8jXFLbYf9x+mPAM5Ig9L1s/cyaYBRK8FH2nCMYgVL3QOfJ1kMTBkCyY6WbBp6LFC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(346002)(39860400002)(136003)(366004)(451199021)(26005)(6506007)(186003)(2906002)(6862004)(4326008)(82960400001)(8676002)(6636002)(8936002)(86362001)(6486002)(6666004)(6512007)(478600001)(107886003)(316002)(38100700002)(41300700001)(5660300002)(66476007)(66556008)(44832011)(66946007)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?KdXnfCwc2SqT8dNBvOKdqJFBR6jHWRmBDfox66jnxt2zmSXWddF3vJXAmL?=
 =?iso-8859-1?Q?6VNAsJckwjOT4X5fqreaPx0LJ16oaPJPnf8JOkafzGWPc63GXG8vX/pniz?=
 =?iso-8859-1?Q?Kmqugm75hcjJ+i7E/8DrkNLtoNVUrRnkayWhO6/yPgupTpyK8MXTAQbPuT?=
 =?iso-8859-1?Q?tGuc+j1B/qdDCjInl0u7l0GFAMsjhV0ijynmE2S19jc75hYScb8DVYvxRE?=
 =?iso-8859-1?Q?1KXq8Q+GbeccVS2DpgK6rVU8SkPMTCvezVl4/1VtD5ebyNNdGbqev9oz8c?=
 =?iso-8859-1?Q?3aQ/6oWEUl3BAU/E9HqQJP3TkVNDIJ/f7eajw9qsrasSuOEPTksNXBtW4a?=
 =?iso-8859-1?Q?W9zY/cTbE1HjRPJQWdn6e8r2BJONbquIn+CNxlbHFxNv716W3kQYPzky8+?=
 =?iso-8859-1?Q?FYDMt7P+OWIqSrsFVRLMShkE9L/8Sgs4sALqfGj0RXY7bZ+NH+5jcPWXH4?=
 =?iso-8859-1?Q?wycqLCDx1+IM93gxbKuzM6r5YBFlMu+jsbJWqoM3N39YPiFOX94eBzyalI?=
 =?iso-8859-1?Q?6PuzXXWqkkWZA67P+M48dbijs5tOE7pn9IEQ/9Y6cvADtYs2yaXKOUZ4cs?=
 =?iso-8859-1?Q?uEgiY0gyVZXTKiS2l0a8P6AFOb856Kt3yZ7LJDKewDoVsaIqxML7Y6LE4t?=
 =?iso-8859-1?Q?1m94NQ68cnmM38r6rrfJaR4ys0DtmvCrh8iR5IE6K0USaBhEWJa8N1jMCw?=
 =?iso-8859-1?Q?8hG5bdqsvNoBv2J0BfzTHE0hRhx51BqUZFr6ISNTMdSkonvX8eCtNmxdRc?=
 =?iso-8859-1?Q?Br/qaBxk4TGnm/e/5CIPoof9mOgKgNx6p89ntFFXSNLp5ycUgWtbNydUZH?=
 =?iso-8859-1?Q?U7AGx/GU7Up65sKGi1URaAw6pdu3P0J8JqPPmT9jqjAxgqflpHA6qGF7Q0?=
 =?iso-8859-1?Q?enxY7f/Lh9wATdx3lhlJ4ArPXleCjkGmVpdwWz8eV0Fp4pz1BKBdE/21tf?=
 =?iso-8859-1?Q?p+zceQjEpM4h4OZN13wf9HGaUr80ll4FbnhHrQyePm83ZPRwQpljLnJdvC?=
 =?iso-8859-1?Q?UZFKgND1Ztz+o1Sydy1kdq5DDp78R0mNQyZ/nxZ4EZHhCwL557TY+N8P8a?=
 =?iso-8859-1?Q?KzX1q4jilWaEz+yNAlp0HEy4fmt0yvbTI57KCyE9OwY+Pd7FQBCkTJW2QM?=
 =?iso-8859-1?Q?sIBTB01iAYJT0jesDQFgdoB8Vc0rxFnHEGpTfagTQivrFjZGu1cMgI2CU+?=
 =?iso-8859-1?Q?GGkoHtAlwmR9bKq8PsyrRmT9ffpSGNX5QpC70xhYxhxXIB3eWhsw6pfpiz?=
 =?iso-8859-1?Q?O9Hs57yxcSHQPbaVHUgWk1CxMfpYPgzNRVTtJOal0zdBW+CSKUI2D01OVw?=
 =?iso-8859-1?Q?zgMfQcPCaKpWjiDizSwb6UHt80fAYeeNc6wSHxToVw+VBsuF6y6HEdBgPv?=
 =?iso-8859-1?Q?BlVFqy38oAOCwMgdjKpH6OGGUp/79z8NHG8msMtIONscQvksgAS5E8sTa5?=
 =?iso-8859-1?Q?H8MaLy1BT0O5uHptyXwe0v7ZsEfDvcZ2RbulIIIXLw+qqKLM11TYYQDs4B?=
 =?iso-8859-1?Q?JtmQMseoz6KFxClm5C6ehKp5+5nb/XxPurJPr8CdbrjPTgIjzPSrqc1VRl?=
 =?iso-8859-1?Q?eJ+bronUy/+bV5J2sfkABXe/bykjMKmHLkYCrjJiVxNJnCnPIVhcXQdb2s?=
 =?iso-8859-1?Q?7FTKlbQVHF3WeESLBMqXsoXyKaKlnpqb5eusL8dlA0G5sym8MPWcaLkg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 34519299-89aa-44b6-5772-08db8eafbbe5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 14:42:42.7526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dx5Dq/lq20HwirdYnpCJcuxEGbhVAf+WFSLtIFfw0XBPvJII02lL/dbTWYjflzD65luobVEiEHYNz+/RG6/Eig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7941
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V9 1/6] drm/xe: Add sysfs entries for engines
 under its GT
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Jul 27, 2023 at 01:52:30PM +0530, Tejas Upadhyay wrote:
> Add engines sysfs directory under its GT and
> create sub directory for all engine class
> (note its not per instance) present on GT.
> 
> For example,
> DUT# cat /sys/class/drm/cardX/device/tileN/gtN/engines/
> bcs/ ccs/
> 
> V5 :
>    - replace xe_engine with xe_hw_engine - Matt
> V4 :
>    - Rebase to resolve conflicts - CI
> V3 :
>    - Move code in its own file
>    - Rename API name
> V2 :
>    - Correct class mask logic - Himal
>    - Remove extra parenthesis
> 

A couple nits, otherwise LGTM. 

> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile                   |   1 +
>  drivers/gpu/drm/xe/xe_gt.c                    |   7 ++
>  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 111 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h |  13 ++
>  4 files changed, 132 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
>  create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 4ea9e3150c20..a3099a4fd56b 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -52,6 +52,7 @@ xe-y += xe_bb.o \
>  	xe_device_sysfs.o \
>  	xe_dma_buf.o \
>  	xe_engine.o \
> +	xe_hw_engine_class_sysfs.o \

This is out of place alphabetically.

>  	xe_exec.o \
>  	xe_execlist.o \
>  	xe_force_wake.o \
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 3e32d38aeeea..d52eb45896a7 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -27,6 +27,7 @@
>  #include "xe_gt_topology.h"
>  #include "xe_guc_engine_types.h"
>  #include "xe_hw_fence.h"
> +#include "xe_hw_engine_class_sysfs.h"
>  #include "xe_irq.h"
>  #include "xe_lrc.h"
>  #include "xe_map.h"
> @@ -322,6 +323,12 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>  	if (err)
>  		goto err_force_wake;
>  
> +	err = xe_hw_engine_class_sysfs_init(gt);
> +	if (err)
> +		drm_warn(&gt_to_xe(gt)->drm,
> +			 "failed to register engines sysfs directory, err: %d\n",
> +			 err);
> +
>  	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>  	XE_WARN_ON(err);
>  	xe_device_mem_access_put(gt_to_xe(gt));
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> new file mode 100644
> index 000000000000..c2f092b54af1
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> @@ -0,0 +1,111 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include <drm/drm_managed.h>
> +#include <linux/kobject.h>
> +#include <linux/sysfs.h>
> +
> +#include "xe_hw_engine_class_sysfs.h"
> +
> +static void kobj_xe_hw_engine_release(struct kobject *kobj)
> +{
> +	kfree(kobj);
> +}
> +
> +static const struct kobj_type kobj_xe_hw_engine_type = {
> +	.release = kobj_xe_hw_engine_release,
> +	.sysfs_ops = &kobj_sysfs_ops
> +};
> +
> +static struct kobject *
> +kobj_xe_hw_engine(struct kobject *parent, char *name)
> +{
> +	struct kobject *kobj;
> +
> +	kobj = kzalloc(sizeof(*kobj), GFP_KERNEL);
> +	if (!kobj)
> +		return NULL;
> +
> +	kobject_init(kobj, &kobj_xe_hw_engine_type);
> +	if (kobject_add(kobj, parent, "%s", name)) {
> +		kobject_put(kobj);
> +		return NULL;
> +	}
> +
> +	return kobj;
> +}
> +
> +static void xe_hw_engine_sysfs_kobj_release(struct kobject *kobj)
> +{
> +	kfree(kobj);
> +}
> +
> +static const struct kobj_type xe_hw_engine_sysfs_kobj_type = {
> +	.release = xe_hw_engine_sysfs_kobj_release,
> +	.sysfs_ops = &kobj_sysfs_ops,
> +};
> +

We should have kernel doc for all non-static functions, this a WIP
across the driver but since this is new code I think we should include
kernel doc for this function.

> +int xe_hw_engine_class_sysfs_init(struct xe_gt *gt)
> +{
> +	struct xe_hw_engine *hwe;
> +	enum xe_hw_engine_id id;
> +	struct kobject *kobj;
> +	u16 class_mask = 0;
> +	int err = 0;
> +
> +	kobj = kzalloc(sizeof(*kobj), GFP_KERNEL);
> +	if (!kobj)
> +		return -ENOMEM;
> +
> +	kobject_init(kobj, &xe_hw_engine_sysfs_kobj_type);
> +
> +	err = kobject_add(kobj, gt->sysfs, "engines");
> +	if (err) {
> +		kobject_put(kobj);
> +		return err;
> +	}
> +
> +	for_each_hw_engine(hwe, gt, id) {
> +		char name[MAX_ENGINE_CLASS_NAME_LEN];
> +		struct kobject *khwe;
> +
> +		if (hwe->class == XE_ENGINE_CLASS_OTHER ||
> +		    hwe->class == XE_ENGINE_CLASS_MAX)
> +			continue;
> +
> +		if ((class_mask >> hwe->class) & 1)
> +			continue;
> +
> +		class_mask |= 1 << hwe->class;
> +
> +		switch (hwe->class) {
> +		case XE_ENGINE_CLASS_RENDER:
> +			strcpy(name, "rcs");
> +			break;
> +		case XE_ENGINE_CLASS_VIDEO_DECODE:
> +			strcpy(name, "vcs");
> +			break;
> +		case XE_ENGINE_CLASS_VIDEO_ENHANCE:
> +			strcpy(name, "vecs");
> +			break;
> +		case XE_ENGINE_CLASS_COPY:
> +			strcpy(name, "bcs");
> +			break;
> +		case XE_ENGINE_CLASS_COMPUTE:
> +			strcpy(name, "ccs");
> +			break;
> +		default:
> +			kobject_put(kobj);
> +			return -EINVAL;
> +		}
> +
> +		khwe = kobj_xe_hw_engine(kobj, name);
> +		if (!khwe) {
> +			kobject_put(kobj);
> +			return -EINVAL;
> +		}
> +	}
> +	return err;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
> new file mode 100644
> index 000000000000..c461fac717c2
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_ENGINE_CLASS_SYSFS_H_
> +#define _XE_ENGINE_CLASS_SYSFS_H__
> +
> +#include "xe_gt.h"

No need to include this, just forward declare struct xe_gt.

> +
> +#define MAX_ENGINE_CLASS_NAME_LEN    16

This doesn't need to be in the header, just define in the .c file.

> +int xe_hw_engine_class_sysfs_init(struct xe_gt *gt);

Add a newline here.

Matt

> +#endif
> -- 
> 2.25.1
> 

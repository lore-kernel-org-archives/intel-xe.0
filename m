Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10DD8E7E656
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 17:31:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B78E510E415;
	Tue, 26 Sep 2023 17:31:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0CF610E415
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 17:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695749503; x=1727285503;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=+fjzcLtf+R0x65e03Dd3JviRG+aKM9KJh4pBfUhlWwg=;
 b=U1jZK5KWoe+ECRQVs9mrti0mXJtIWoY8hZ2GZkS1E8i7scI6Lgi656kC
 vJ0uJCEj3n7z651tEikpYbGG4Be/vv7ZoL4yj+9x7hwIVbpgVD2yXRsQS
 6ruTfFwvEs3f0B8q/4d58rbNGKbrUGm8st4DG+fHQfUxu6qPdaaFNAe13
 MRz9zxQLGg6o5RKxw772sbEMS6ifOtovRDHfUjQODNeEcQz3NaQDB5qXb
 cBWvYxBmbwGCaLlhs+zFiB94+O9w8mBPGbGgEaVXRaPKWeEr1JShXjyMF
 9yW/kuSdxN4vVJf8pgMwHQuW5BtkeWlIjg3VUIIPJCAI8IC1PPocYqwnq w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="448116912"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="448116912"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 10:31:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="814559315"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="814559315"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2023 10:31:40 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 10:31:39 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 10:31:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 26 Sep 2023 10:31:39 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 26 Sep 2023 10:31:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=biL2IIa05/bEm2GVmHeB5LaGBRKo1kfKgXJB7QNboTY+2FQ5moeTLOVIMgtWAG6ixe2/RFgl/I8W7yptIqoK+BRgnMOcWlLqQx+4Q5XY5x9sDA+6YWHiVexN/zVPjNnw+U0vaAuC1DlP/JgWU5jvONTD0ExzWeQO8HYR2Ns/6hV9saeH+4+5lrrkot78r9ZV0ZYylhJTecVchyh8QM9HuPYgGpTnZcZ/bDm73ibGQVcWEVNQkUqvkJkwT8wsGXXN+EQ78n1MCZoKRl64dlHYLdSV0slWDyzPEFDnl97NIgGWDZHAvI3Zs37A+sSqsWE7k7yOTZJcmP7K2q/IiAErQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fRf8fch3VJtaKkHF8kh2j32MPrRSa1uJYSzYkeJmlZw=;
 b=Wd9bKcXYTIHx2ItKdrevV/oSdjgETZpwqSTz2Xm8RUKwsp+F/7i/cvFBzmKq7UAFDtlGHWc5coMGQ+X7PaWkjVHKAxbdmg7X1KfVtluPkJua7x6NeBkYVbsu7fdMuDdKQAnnZ/wzugUcG0thAgGhF1gXJvZGW0mb155uwv0LMh7ve5a35xj4/vmYpplcElHQtRrDPdNm1Ux5rPbpqIQHLyG9/Zyrjk6JVrcBA4t1NWFH5u6N8WqneQOKtVpoEDz+bpoHpsaO6SqXqe6i3oW3Mc6jKLA1LP+15wC4GDWmpIfrhAWtEmthu/r7d6rrqL8BWOVMq7b9M/hpkUpNucim/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 17:31:37 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6813.017; Tue, 26 Sep 2023
 17:31:37 +0000
Date: Tue, 26 Sep 2023 13:31:33 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Message-ID: <ZRMVda8E+xLJbDJp@intel.com>
References: <20230926144120.334009-1-sujaritha.sundaresan@intel.com>
 <20230926144120.334009-3-sujaritha.sundaresan@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230926144120.334009-3-sujaritha.sundaresan@intel.com>
X-ClientProxiedBy: SJ2PR07CA0015.namprd07.prod.outlook.com
 (2603:10b6:a03:505::28) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB7608:EE_
X-MS-Office365-Filtering-Correlation-Id: 981faeae-02b3-4ae0-db0a-08dbbeb66f81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n1dEtT5qnEOyZf6zFL+LoD3FCm1heOoZ6e2lJwQZgIey68sQekhFSwj9stq4wrdKwJl/q07TdmgCFEsZEfVSLAr6OuWe+0Nu/79RC0TTLn+AYjpEqBmHX5zeMZsc+mPWo79SD00Gv98CyH0CGKwhO0B3fb82dZ/9qPBKSCyMqlgPmU3VbIaIC22uvdAClv8r+hQJ+LB/dmMY/b1Mwc/Nhj+TLKPT4vQj+WEwOAFInfwniAmcMstdDmoJ7RXYf3M8oVl/No884Ba/QzZ6h7MgRdzluVZ44tzO5L+mx5Qc2l6pxq/1T5H0ZTwXYrr7NTpfwrQoUsg10SA0An69xemJon+EsJzK1ZX0W0PFuGzKju6EtLjONIL95mwc0jECGpYfhLWKCzxx8JARrgPTr/VvNMWmjCJ12vYL69sm+wV7czqyv9K6u3n6mvSUZpMl/jSD/gw/JGvLDDqAejaUioyoEhJdqzw4LP4IUuCGAnQT1pZ2XeF2L2rJ2PI9oT8UrAXjera11XABxWJFS4qbK8ChT4uw8n0zxXRRQvpIAdiTUiJAGcEb7/2NfyVJnn8OMgvCWTTW2C8U8n2VsfM7jN7rtJAtIx5VEq8JfdyJgRa/FiE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(396003)(39860400002)(136003)(366004)(230922051799003)(186009)(451199024)(1800799009)(86362001)(36756003)(6506007)(6486002)(5660300002)(26005)(6666004)(37006003)(66946007)(6512007)(66556008)(66476007)(2616005)(316002)(6862004)(44832011)(6636002)(41300700001)(478600001)(8676002)(8936002)(4326008)(2906002)(82960400001)(38100700002)(83380400001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?OhQlizP96cY5FdGlyK0Qd5cJAH0ofYnkD+AQLTxN/PX/81QF9ugnM0J/+7?=
 =?iso-8859-1?Q?9y+odAFCIBKMfldJb9btx/AMPgEEOE9ZneZt47rbM+k23pENpxpBajhe8E?=
 =?iso-8859-1?Q?kZTYWzx7q17fwH9pMJXN7AJRnjXdJhOlyU3UhX0xW15q9n+jYJxtNuXcxC?=
 =?iso-8859-1?Q?KB+wMV/x28ZjtbU6lvGn83zjPLlgaRWYPpxkT6MIFfi3+tWLEddqKpUJvi?=
 =?iso-8859-1?Q?hblouttOJ5N5nNysro47vxo0L42pOcrxpEb3TMSltDsZkm97OyIZRuOD4Z?=
 =?iso-8859-1?Q?0HXVTGNhuNYXT4ZYzuRNr/Tde7ARuYMSrq8RJ3MbC01NtXrPYyBjWBvwnP?=
 =?iso-8859-1?Q?mOoaEdRueTsQ6p6VejEVJjzLGKArYborQZOeTahtV3NfLx187rDuS97UJU?=
 =?iso-8859-1?Q?+QJTXkEDjhqusu4GXyFkXGjPKoAl3tv9wOHnIq0bCQPOVorKK9b+SzsgI7?=
 =?iso-8859-1?Q?9BxB/XVcELXK5NJHuIc5+JARS7qs1e6GjwdR2oIK9ReaO5zfwmccnJRK40?=
 =?iso-8859-1?Q?7pECXK64LEmweJFHNdvOWqhxBc9uJUrjDJN/MEE6cKfXIH6fn+d3IeVxaQ?=
 =?iso-8859-1?Q?xk9RtY2b5YqW2MYpjPBFJ6OS8zm4meVk77XNvcUjgL+OkTEpiHAKr78wZX?=
 =?iso-8859-1?Q?NTNfDFjoDhMd9bm8rQS+J2DLhJyAlE+4W2pqtCQdy0IDJQzWuy05fxSegM?=
 =?iso-8859-1?Q?NAm5M3UX0MN8N1C8ctnyBb1UgG/5l7rYd3YL2djVQhdKXOMJajKWXYxlyE?=
 =?iso-8859-1?Q?hcaG6cnIApQ3qjINPcrUOQRAHHLUsDW8oOjLc0MgkX2xw1bhl1se6z16wj?=
 =?iso-8859-1?Q?CiwdQV72w2plx9bKTmZ6Ef4Bp0Rj4KReg9DzdRrrpChS7abSNFWUE1PMCt?=
 =?iso-8859-1?Q?AVkpQvEpvFnDaJL99CQGs7pye8j1g+JmJ/aJJr2K19LRjp2vvLZJl90ur3?=
 =?iso-8859-1?Q?89m+nh9GPuwhJccV2tquE2XAI6PBVVdVQMBNTQBNkZUhPjtGJD186qb7Ys?=
 =?iso-8859-1?Q?OR4Zo81LxvyL74nGUWXG355c3IazxBuPKInIStHR5IUFexdfY0VIl4uUEm?=
 =?iso-8859-1?Q?5Q0SwV0l9FkHD+DZwOSSSFWoMC611LD1UoKl4EZNV4rGoRkTysT6fPi0KZ?=
 =?iso-8859-1?Q?09kCkVgyFgnOHcEuUUb5SxDMR2R/S18rQ5R/oQVLbWdePdOyDc7tCLT+3M?=
 =?iso-8859-1?Q?fUKMuIIPVKu/c1JwRLPkoSGgmLG5RVesyO1+xWIMsMKd+Ac4a4JpaQIIIz?=
 =?iso-8859-1?Q?yxvXdTYt3qQMYt2jBPnL178KJdJvn5sOkJutwPSgEu/CMcAY3g8ncCEgdf?=
 =?iso-8859-1?Q?Mi+4L4B+i1LGBgKz91eVlH3Vs3zC+2ti+UrVwbKzo/nL24ASAl1B2qbYzA?=
 =?iso-8859-1?Q?yjMt7eLNv88awaXpARkrEHPbkf33fQ9VK1zVRm4l+1lZddtoRlh7PoT/Ro?=
 =?iso-8859-1?Q?QFRC+vLWGO7H6vdik5OL1kGeeFXWMnJ3VEr5A/ifgRDa/B5XQE7SXvq0hV?=
 =?iso-8859-1?Q?sJc+a9TJHVRPu5NsVt6WvafrOt4uYpRlMTZNfgws4V78r1PFUE6V1ZVyGu?=
 =?iso-8859-1?Q?yO9ccN/oNKO38rfpxYi7ZSX7RAnnmgWVoCzmIAr3q865dnPItB3vB/jAA9?=
 =?iso-8859-1?Q?9wBZHZ4lnJ/XE/JncQyb6a/Gbcu7mC+2KO/ADDudLFuh9lkT++AQVvXQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 981faeae-02b3-4ae0-db0a-08dbbeb66f81
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 17:31:37.0719 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZLiXoKhBlrwQaqweS99cApAuzjCuFlBP9x6jga1PkjjTMtLsBL2gXm95Ozuvj6LXmTaZ49sRS3KzVrLaTcU5+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7608
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/2] drm/xe: Add base performance and vram
 frequency sysfs attributes
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

On Tue, Sep 26, 2023 at 08:11:20PM +0530, Sujaritha Sundaresan wrote:
> This patch adds base performace attributes as well as vram frequency
> attributes.

Is vram freq tied to the gt or tied to the tile?

> 
> v2: Create a separate performance directory for attributes.
> 
> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile           |   1 +
>  drivers/gpu/drm/xe/xe_gt_freq_sysfs.c | 218 ++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_freq_sysfs.h |  16 ++
>  drivers/gpu/drm/xe/xe_gt_sysfs.c      |   3 +
>  drivers/gpu/drm/xe/xe_pcode_api.h     |  19 +++
>  5 files changed, 257 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_freq_sysfs.c
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_freq_sysfs.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index b1681d1416eb..bdd9922d3db5 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -60,6 +60,7 @@ xe-y += xe_bb.o \
>  	xe_gt.o \
>  	xe_gt_clock.o \
>  	xe_gt_debugfs.o \
> +	xe_gt_freq_sysfs.o \
>  	xe_gt_idle_sysfs.o \
>  	xe_gt_mcr.o \
>  	xe_gt_pagefault.o \
> diff --git a/drivers/gpu/drm/xe/xe_gt_freq_sysfs.c b/drivers/gpu/drm/xe/xe_gt_freq_sysfs.c
> new file mode 100644
> index 000000000000..6017d09eeca2
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_freq_sysfs.c
> @@ -0,0 +1,218 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include <drm/drm_managed.h>
> +
> +#include <regs/xe_gt_regs.h>
> +#include "xe_device.h"
> +#include "xe_gt.h"
> +#include "xe_gt_freq_sysfs.h"
> +#include "xe_gt_sysfs.h"
> +#include "xe_pcode.h"
> +#include "xe_pcode_api.h"
> +
> +#define GT_FREQUENCY_MULTIPLIER	50
> +
> +#define U8_8_VAL_MASK           0xffff
> +#define U8_8_SCALE_TO_VALUE     "0.00390625"
> +
> +static ssize_t freq_factor_scale_show(struct device *dev,
> +				      struct device_attribute *attr,
> +				      char *buff)
> +{
> +	return sysfs_emit(buff, "%s\n", U8_8_SCALE_TO_VALUE);
> +}
> +
> +static ssize_t base_freq_factor_show(struct device *dev,
> +				     struct device_attribute *attr,
> +				     char *buff)
> +{
> +	struct kobject *kobj = &dev->kobj;
> +	struct xe_gt *gt = kobj_to_gt(kobj);
> +	u32 val;
> +	int err;
> +
> +	err = xe_gt_pcode_read(gt, PVC_PCODE_QOS_MULTIPLIER_GET,
> +				PCODE_MBOX_DOMAIN_CHIPLET,
> +				PCODE_MBOX_DOMAIN_BASE, &val);
> +	if (err)
> +		return err;
> +
> +	val &= U8_8_VAL_MASK;
> +
> +	return sysfs_emit(buff, "%u\n", val);
> +}
> +
> +static ssize_t base_freq_factor_store(struct device *dev,
> +				      struct device_attribute *attr,
> +				      const char *buff, size_t count)
> +{
> +	struct kobject *kobj = &dev->kobj;
> +	struct xe_gt *gt = kobj_to_gt(kobj);
> +	u32 val;
> +	int err;
> +
> +	err = kstrtou32(buff, 0, &val);
> +	if (err)
> +		return err;
> +
> +	if (val > U8_8_VAL_MASK)
> +		return -EINVAL;
> +
> +	err = xe_gt_pcode_write(gt, PVC_PCODE_QOS_MULTIPLIER_SET,
> +				PCODE_MBOX_DOMAIN_CHIPLET,
> +				PCODE_MBOX_DOMAIN_BASE, val);
> +	if (err)
> +		return err;
> +
> +	return count;
> +}
> +
> +static DEVICE_ATTR_RW(base_freq_factor);
> +static struct device_attribute dev_attr_base_freq_factor_scale =
> +	__ATTR(base_freq_factor.scale, 0444, freq_factor_scale_show, NULL);
> +
> +
> +static ssize_t base_freq_rp0_show(struct device *dev, struct device_attribute *attr,
> +				  char *buff)
> +{
> +	struct kobject *kobj = &dev->kobj;
> +	struct xe_gt *gt = kobj_to_gt(kobj);
> +	u32 val;
> +	int err;
> +
> +	err = xe_gt_pcode_read(gt, XEHP_PCODE_FREQUENCY_CONFIG,
> +				PCODE_MBOX_FC_SC_READ_FUSED_P0,
> +				PCODE_MBOX_DOMAIN_BASE, &val);
> +	if (err)
> +		return err;
> +
> +	/* data_out - Fused P0 for domain ID in units of 50 MHz */
> +	val *= GT_FREQUENCY_MULTIPLIER;
> +
> +	return sysfs_emit(buff, "%u\n", val);
> +}
> +static DEVICE_ATTR_RO(base_freq_rp0);
> +
> +static ssize_t base_freq_rpn_show(struct device *dev, struct device_attribute *attr,
> +				  char *buff)
> +{
> +	struct kobject *kobj = &dev->kobj;
> +	struct xe_gt *gt = kobj_to_gt(kobj);
> +	u32 val;
> +	int err;
> +
> +	err = xe_gt_pcode_read(gt, XEHP_PCODE_FREQUENCY_CONFIG,
> +				PCODE_MBOX_FC_SC_READ_FUSED_PN,
> +				PCODE_MBOX_DOMAIN_BASE, &val);
> +	if (err)
> +		return err;
> +
> +	/* data_out - Fused Pn for domain ID in units of 50 MHz */
> +	val *= GT_FREQUENCY_MULTIPLIER;
> +
> +	return sysfs_emit(buff, "%u\n", val);
> +}
> +static DEVICE_ATTR_RO(base_freq_rpn);
> +
> +static const struct attribute *perf_power_attrs[] = {
> +	&dev_attr_base_freq_factor.attr,
> +	&dev_attr_base_freq_factor_scale.attr,
> +	&dev_attr_base_freq_rp0.attr,
> +	&dev_attr_base_freq_rpn.attr,
> +	NULL
> +};
> +
> +static ssize_t freq_vram_rp0_show(struct device *dev, struct device_attribute *attr,
> +				  char *buff)
> +{
> +	struct kobject *kobj = &dev->kobj;
> +	struct xe_gt *gt = kobj_to_gt(kobj);
> +	u32 val;
> +	int err;
> +
> +	err = xe_gt_pcode_read(gt, XEHP_PCODE_FREQUENCY_CONFIG,
> +				PCODE_MBOX_FC_SC_READ_FUSED_P0,
> +				PCODE_MBOX_DOMAIN_HBM, &val);
> +	if (err)
> +		return err;
> +
> +	/* data_out - Fused P0 for domain ID in units of 50 MHz */
> +	val *= GT_FREQUENCY_MULTIPLIER;
> +
> +	return sysfs_emit(buff, "%u\n", val);
> +}
> +static DEVICE_ATTR_RO(freq_vram_rp0);
> +
> +static ssize_t freq_vram_rpn_show(struct device *dev, struct device_attribute *attr,
> +				  char *buff)
> +{
> +	struct kobject *kobj = &dev->kobj;
> +	struct xe_gt *gt = kobj_to_gt(kobj);
> +	u32 val;
> +	int err;
> +
> +	err = xe_gt_pcode_read(gt, XEHP_PCODE_FREQUENCY_CONFIG,
> +				PCODE_MBOX_FC_SC_READ_FUSED_PN,
> +				PCODE_MBOX_DOMAIN_HBM, &val);
> +	if (err)
> +		return err;
> +
> +	/* data_out - Fused P0 for domain ID in units of 50 MHz */
> +	val *= GT_FREQUENCY_MULTIPLIER;
> +
> +	return sysfs_emit(buff, "%u\n", val);
> +}
> +static DEVICE_ATTR_RO(freq_vram_rpn);
> +
> +static const struct attribute *vram_freq_attrs[] = {
> +	&dev_attr_freq_vram_rp0.attr,
> +	&dev_attr_freq_vram_rpn.attr,
> +	NULL
> +};
> +
> +static void gt_freq_sysfs_fini(struct drm_device *drm, void *arg)
> +{
> +	struct kobject *kobj = arg;
> +
> +	sysfs_remove_files(kobj, perf_power_attrs);
> +	kobject_put(kobj);
> +}
> +
> +void xe_gt_freq_sysfs_init(struct xe_gt *gt)
> +{
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct kobject *kobj;
> +	int err;
> +
> +	kobj = kobject_create_and_add("performance", gt->sysfs);
> +	if (!kobj) {
> +		drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -ENOMEM);
> +		return;
> +	}
> +
> +	err = sysfs_create_files(kobj, perf_power_attrs);
> +	if (err) {
> +		kobject_put(kobj);
> +		drm_warn(&xe->drm, "failed to register performance power sysfs, err: %d\n", err);
> +		return;
> +	}
> +
> +	if (xe->info.platform == XE_PVC) {
> +		err = sysfs_create_files(tile->sysfs, vram_freq_attrs);
> +		if (err) {
> +			kobject_put(kobj);
> +			drm_warn(&xe->drm, "failed to register vram freq sysfs, err: %d\n", err);
> +			return;
> +		}
> +
> +	}
> +
> +	err = drmm_add_action_or_reset(&xe->drm, gt_freq_sysfs_fini, kobj);
> +	if (err)
> +		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
> +			 __func__, err);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_freq_sysfs.h b/drivers/gpu/drm/xe/xe_gt_freq_sysfs.h
> new file mode 100644
> index 000000000000..7b76c4670632
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_freq_sysfs.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_GT_FREQ_SYSFS_H_
> +#define _XE_GT_FREQ_SYSFS_H_
> +
> +#include <drm/drm_managed.h>
> +
> +#include "xe_device.h"
> +#include "xe_gt.h"
> +
> +void xe_gt_freq_sysfs_init(struct xe_gt *gt);
> +
> +#endif /* _XE_GT_FREQ_SYSFS_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> index c69d2e8a0fe1..3b6316ce10ed 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> @@ -11,6 +11,7 @@
>  #include <drm/drm_managed.h>
>  
>  #include "xe_gt.h"
> +#include "xe_gt_freq_sysfs.h"
>  
>  static void xe_gt_sysfs_kobj_release(struct kobject *kobj)
>  {
> @@ -52,6 +53,8 @@ void xe_gt_sysfs_init(struct xe_gt *gt)
>  
>  	gt->sysfs = &kg->base;
>  
> +	xe_gt_freq_sysfs_init(gt);
> +
>  	err = drmm_add_action_or_reset(&xe->drm, gt_sysfs_fini, gt);
>  	if (err) {
>  		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index 837ff7c71280..da4114bfaa7a 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -30,6 +30,25 @@
>  #define   PCODE_READ_MIN_FREQ_TABLE	0x9
>  #define   PCODE_FREQ_RING_RATIO_SHIFT	16
>  
> +#define   XEHP_PCODE_FREQUENCY_CONFIG			0x6e	/* xehp, pvc */
> +/* XEHP_PCODE_FREQUENCY_CONFIG sub-commands (param1) */
> +#define     PCODE_MBOX_FC_SC_READ_FUSED_P0		0x0
> +#define     PCODE_MBOX_FC_SC_READ_FUSED_PN		0x1
> +/* PCODE_MBOX_DOMAIN_* - mailbox domain IDs */
> +/* XEHP_PCODE_FREQUENCY_CONFIG param2 */
> +#define     PCODE_MBOX_DOMAIN_NONE			0x0
> +#define     PCODE_MBOX_DOMAIN_GT			0x1
> +#define     PCODE_MBOX_DOMAIN_HBM			0x2
> +#define     PCODE_MBOX_DOMAIN_MEDIAFF			0x3
> +#define     PCODE_MBOX_DOMAIN_MEDIA_SAMPLER		0x4
> +#define     PCODE_MBOX_DOMAIN_SYSTOLIC_ARRAY		0x5
> +#define     PCODE_MBOX_DOMAIN_CHIPLET			0x6
> +#define     PCODE_MBOX_DOMAIN_BASE_CHIPLET_LINK		0x7
> +#define     PCODE_MBOX_DOMAIN_BASE			0x8
> +#define   PVC_PCODE_QOS_MULTIPLIER_SET			0x67
> +/* See PCODE_MBOX_DOMAIN_* - mailbox domain IDs - param1 and 2 */
> +#define   PVC_PCODE_QOS_MULTIPLIER_GET			0x66
> +
>  /* PCODE Init */
>  #define   DGFX_PCODE_STATUS		0x7E
>  #define     DGFX_GET_INIT_STATUS	0x0
> -- 
> 2.25.1
> 

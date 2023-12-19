Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB7BC41535
	for <intel-xe@archiver.kernel.org>; Tue, 19 Dec 2023 23:24:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EB1B10E256;
	Tue, 19 Dec 2023 23:24:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9808610E256
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Dec 2023 23:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703028254; x=1734564254;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=yh+5FcdyZqaG7rB59Jqc4UbjOoGXp6Q52hLRifYJBKc=;
 b=kAs87Fv4T9xIj8c0t1nmpQfoq/CTWiqRbriT/L4vUYBAn4iYK5HD1k2Z
 Eqh8D2+BH9fl11fTdJ+QUATfYJ9lfVEfc6vJuWzMbM4PgwRb6Xsl0CW5V
 IgKNjADlqzOgo7NJoDYTq2ZTON6FTBfcngWai1GATUvyQQ1BAxgLPULkX
 5ksLEAuUpoYKviyNlz+9sWH8Ota1bIN2ScRlAxFsiQ97WAgwuL3vFPMRJ
 ru3u5tMLEvqx3tdJT6XXxLs+kbYHr9k5PX5mCZgramDQeAEXGBOIc8WLf
 cdnNpjF7nkkcTJLp93tLLj7DGCtX7urbDT03NAZAz+76TRvw+WxbC8nHl g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="9111105"
X-IronPort-AV: E=Sophos;i="6.04,289,1695711600"; 
   d="scan'208";a="9111105"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 15:24:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="776127122"
X-IronPort-AV: E=Sophos;i="6.04,289,1695711600"; d="scan'208";a="776127122"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Dec 2023 15:24:14 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Dec 2023 15:24:13 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 19 Dec 2023 15:24:13 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 19 Dec 2023 15:24:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jpmL3poDLEXElAmcLVKUyIOUCrBVWRqLAPB82OYgctLJ9OS5U5NmPIJZg3Z1+4EoVJNrGn/4m5qt7Wpn8ACLfrM20xNntemmZWh1trbc55BehFa9mrwVGM2T3UyqwlzPYsYR2Yu4nM6cUyRc+uksykyHabMKOgh8A8n1dHqkMCmhmUhZgdcH7k15UDkaaWBJWtJztK6E3NvU/UqUYiC6AMWvblsW7pTuTh1fGoI3niy7oO1LVofNo/4CdWg+o3Oo/ZfCUMRKHmODzdnEZVWoG6SfaAQrrVvSz2VbAw3WgppEtGb8Wqy5Gv3qOnnsD3PgQBXYEjtJWdEQGTXS9/HAPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yik0rLS791/gGe2UuEiVnoO07ryTk/kC/snM+cjgMfk=;
 b=ecEaoaAyBgRJLeopr726DVISPisw0+eKQqVIiBHlTVlrNHT6++OMjubuMewV7WwJby83lyGm9RDp3/txRBK4zPS2g25Z4cNRFoZCCEb287PCkXn1e0dkTYMESefI/dF/t+uaIVccSg9ZZJ0H5nSnwgGPKfO/76hihX3LDWfLr8+ETz5CLKupBe3LPWNe5v83JYTtXj9vziHjyIhdqBTaIWsEMyKMLG2b+qHY+oS1XzKOX7NewScicYP/ocsYa8jBDXuAqa7Y2wzSzqmSVVXP7NfaaP8NH9Vv4l7bkmM+8UF35hcjAII2tLoj+XbgBKKgedKvpbq7vcCvidDuKezJxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 DS0PR11MB7879.namprd11.prod.outlook.com (2603:10b6:8:f7::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7113.18; Tue, 19 Dec 2023 23:24:09 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::e73e:dcc0:c5bb:49b9]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::e73e:dcc0:c5bb:49b9%7]) with mapi id 15.20.7113.016; Tue, 19 Dec 2023
 23:24:09 +0000
Date: Tue, 19 Dec 2023 15:23:59 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH 07/17] drm/xe/oa/uapi: Define and parse OA stream
 properties
Message-ID: <ZYImD3tGhYyFdQrL@unerlige-ril>
References: <20231208064329.2387604-1-ashutosh.dixit@intel.com>
 <20231208064329.2387604-8-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231208064329.2387604-8-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR02CA0016.namprd02.prod.outlook.com
 (2603:10b6:303:16d::22) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|DS0PR11MB7879:EE_
X-MS-Office365-Filtering-Correlation-Id: 72773f4f-f81c-4417-6e56-08dc00e99a47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ABe4AzG5QwMmVKxWIF8FV6eyV9MFp4SBswaU6u1HchPLeVOfvx17kZair0GM3crxU7mm4lTMlgVDU20p/iJO6fby1KMtBzh1k3rUDB3uCBiB4OaYK+AS+TWwQugU1LIHWAJfSrbxj6TjZadCcMUz4vE+pFWZbRBUgKbvfTSzHaF1pJTtG/l1EpWu/0KFohR7ItNHapwzTn5hDUzts6Mn70ITlgAPas+FYBzB7ivqkCNDTm0ddUVp77BPjVc2WjCaibkE1pDUq048T7z/qr+Jtf5nM2SIrdaRb0pRkzDFKeJW8thXxiOkvr4iKH8ZCWOOn7b2LLuRNe6hayDmFp69SRmVIaInbzE+eRpi5pSHfHrwkf9oIJMQkfNy+FXQfdI0y7L0NOy4Q5iAbNP05V5wHT6Xw1K3/H6+wOZ8phXb4TnvnbaYV8K/NTSLP6XtpiDPAZMnLlLExfnnwpawzshZvedeqkxJX0H7nTRIXQEsvG4d09vTD3ToyXFgDu5VRh6LLH3P0ruJG6qKYjxE6yAOwQ9vnWVgqGmNNTQVLs7JcHl14zB1CaWOeObqna+Mo+Ia
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(39860400002)(376002)(366004)(396003)(346002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(6512007)(26005)(6486002)(478600001)(41300700001)(6506007)(66946007)(66476007)(66556008)(6636002)(33716001)(83380400001)(6666004)(9686003)(316002)(86362001)(82960400001)(30864003)(8676002)(8936002)(38100700002)(2906002)(5660300002)(4326008)(6862004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ny9rTzB1NXlOSU1ySUV5NFZickFHbWo3em93YUxuUnNtTWxzUmVjWFFQYjFV?=
 =?utf-8?B?OFVLNlpyS0xTZVRHTnFJZUcyY2NPY0twcWZDUHgrMVowTmxVSysvMW5SeWQv?=
 =?utf-8?B?V1hyand2b09LTXpNV1JaYmZhT0sxQk0xb3lYU1RFVDhuMUhyVEJ0dFBUN1VD?=
 =?utf-8?B?QytmdzI2b0dMM2tXdzFremJkZE53WWNnOU9SczRiK1h5Nmo4QXpIbXlKdmRj?=
 =?utf-8?B?TmhsdWxINERESFZLVzl3eVR2ZGpqeVdmUnhNVGRrRHZ1ODgyODNwMVA5S3dR?=
 =?utf-8?B?dnVieVA0MVR2aW8wVHVCNDNoSWpMRHl3U1RxUFV4Zmt0Y2VsVCtsWDFDYzhB?=
 =?utf-8?B?R2dTQVU4Z1AyMjlLa0pYSElOZzArM0FmVWt6eDJNaWFoQTUyanp5M3BqMEhN?=
 =?utf-8?B?TkQxOExBQTFEZHo0dkpTY1lhaUk1Q3V5ZXZ6UWdDcHNha2F5S3IzQ2lBN2lI?=
 =?utf-8?B?VmkxSThtaWVjSzFJeXpobFA4ZGNDR1RQTUNIS0ZkNUhMUHZjZ29JMXJXdGlq?=
 =?utf-8?B?ZjRpMEg5akszYlBKMDY1RXZPMnhnRTErV2NYQWV4bVBNNXYvU25jM2p5RDl3?=
 =?utf-8?B?S0NoMlNrRWp6TFFOUWdFV0tFckdQTmRmMUxWOWxTajd1V0VyM0Rsd2dPdGdl?=
 =?utf-8?B?cnhzSlVZcmVxTUVuV3UvamVUa2E0N3VZQjNhSW5OMm54ekozSkRvMjlkcWpK?=
 =?utf-8?B?ZHcxenQ3bGZuR3NZNW05N1k3OWthL3dmK1EyV1l5cDB2NXE3bDh3QVJuU2RV?=
 =?utf-8?B?RlRRTE9OWE1mRkJhZFU3YjVMSThRR05UZU9MOVdqRHZkamFaUUlDTkFHcW10?=
 =?utf-8?B?ZGd5YUVRbFQ4dGhMZE5NcGl3Z3Z6LzJ4T0VrRThLRVkwS2lidjQ5RWw3KzZu?=
 =?utf-8?B?YUg4WG5laWQwZGtER05ZamhmR0FJRkxNV1hFTVRCY3hHV0dDM3d1QkNIMGV0?=
 =?utf-8?B?N25WNTA2N0ZINEl5d1hrTnp0UmdCdDFaeHdwM2E0cDM4YXJnYVR1dHBCa2Y2?=
 =?utf-8?B?ZGJRR2hDbU56eVhRWnVvQlkwSnVJdGR1am04VlVXQ1I3Q0E3OGNBUTJOeXVq?=
 =?utf-8?B?WU9LNU1rc0VOU3B0cnNWcGZlcDFoS0hWdzJXSnA4dWVZWmRnS2ZPSnpJRys2?=
 =?utf-8?B?ZDB6bWw1Q1ZSa2YyZ2E4UStHaWtKMlVLcm9FYVBqczVpOXJnR0hmLzc1UzFX?=
 =?utf-8?B?Ry9vWHZvWXlPN2ZDOWQ4SUEvbXB0Q3RoUUM2dUM5ZTV0NDZHSmJoSkhseVh6?=
 =?utf-8?B?c1FEOUhCNGdiZ01McVF6UDYvQlVzU1ZaYThnYVVYY3h2SnhYMjdReEprUVFh?=
 =?utf-8?B?Yno5YkxiR3doWTYrU2lUenA5Q3I4WGRZcEhZeDl5VU16cWlCYzdwUzVlS1Rl?=
 =?utf-8?B?KzZHSW5DdFhkckZnTkg3eHZSNGFDYjJFQXVtQVVjUWxoN0NMcmYvOXlneWdH?=
 =?utf-8?B?VGFrOURHV1lZWUpYdkdCTG9oTEJXN2JqSWtFdTFsUmhpTkVZYXVHSURhajFj?=
 =?utf-8?B?TlcralVYSm5GNFNrSEVIWWhnN1hrelBqeG1LZC9OMFhqTjc0TW4reEZaTHhO?=
 =?utf-8?B?YzFoZEt5cnh1N1BHVlNtK04yWFhueGxzK3p5blZuNXZnZHRyNVR3SWNPVTh5?=
 =?utf-8?B?NUdUOG8wbkhlU1B1Qm1wWDBHd1hWb1dCWVI0cG1JOG83ektJRnRJaGpvTXZL?=
 =?utf-8?B?ZHFuNWdOUjF2aERDemZVL0t3N0xwUWt4ZVRUSVVIVEMxVFkxLy9ZVVdRSzl5?=
 =?utf-8?B?Mk51Z3NNYnRhajhSN2JiUXhXbG9zVWJTZUlwQndVcXhFWlkrZnQyOGZFVmRR?=
 =?utf-8?B?bGpDMmd3KzFhK3NtbjBTMnNQQk9FcXZkdHdsUVRMai9SeUZZdWM1OThMOHlj?=
 =?utf-8?B?SWE4cUhnbU9Uc1dWL2VLMTA1NktYVmhPWmV3cHFnWkROUWFBbFBxUEYra2l2?=
 =?utf-8?B?Wm9FYTRHY3dtZEMxUkpJc0FCT25OWlNrZjV1TUZ6UkFEZ0VHc0pLcjNGWlIy?=
 =?utf-8?B?elNYSC9mZG1qc3NUaUlBWDNrY0lRaVE2RUV5ZndPZ2gwRlVEZjRTR1hFS2pZ?=
 =?utf-8?B?RmovYllmVHFXa1owQnBpVXE3TnN3Wk44ZmZhU08vZEJwWlRJb1pKV0dpZkNk?=
 =?utf-8?B?WlVmaGwxdWx0bnVMQWtGMEsyYUg0NHU3NFRnb2wzY3RBK0FSMXMxa1JpNVhM?=
 =?utf-8?Q?D5tvG5jycaoM3aXs7zkGXCE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 72773f4f-f81c-4417-6e56-08dc00e99a47
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2023 23:24:09.8268 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1vKn0t5+XVw9yP1JNhXY9P6oKHH07pHz2SGbtQUexx5Dz3XGVqlWO37pVUh/JYYoGchCEF9IHWyLVMXX5gJ+yiAdBky5lszAlq2ksAXLm0U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7879
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Dec 07, 2023 at 10:43:19PM -0800, Ashutosh Dixit wrote:
>Properties for OA streams are specified by user space, when the stream is
>opened, as a chain of drm_xe_ext_set_property struct's. Parse and validate
>these stream properties.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> drivers/gpu/drm/xe/xe_oa.c   | 372 +++++++++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_oa.h   |   2 +
> drivers/gpu/drm/xe/xe_perf.c |   2 +
> include/uapi/drm/xe_drm.h    | 114 +++++++++++
> 4 files changed, 490 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index 6a903bf4f87d1..9b0bd58fcbc06 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -3,10 +3,13 @@
>  * Copyright © 2023 Intel Corporation
>  */
>
>+#include <linux/nospec.h>
> #include <linux/sysctl.h>
>
>+#include "regs/xe_gt_regs.h"
> #include "regs/xe_oa_regs.h"
> #include "xe_device.h"
>+#include "xe_exec_queue.h"
> #include "xe_gt.h"
> #include "xe_mmio.h"
> #include "xe_oa.h"
>@@ -46,6 +49,20 @@ struct xe_oa_config {
> 	struct rcu_head rcu;
> };
>
>+struct xe_oa_open_param {
>+	u32 oa_unit_id;
>+	bool sample;
>+	u32 metric_set;
>+	enum xe_oa_format_name oa_format;
>+	int period_exponent;
>+	u32 poll_period_us;
>+	u32 open_flags;
>+	int exec_queue_id;
>+	int engine_instance;
>+	struct xe_exec_queue *exec_q;
>+	struct xe_hw_engine *hwe;
>+};
>+
> #define DRM_FMT(x) DRM_XE_OA_FMT_TYPE_##x
>
> static const struct xe_oa_format oa_formats[] = {
>@@ -88,6 +105,361 @@ static void xe_oa_config_put(struct xe_oa_config *oa_config)
> 	kref_put(&oa_config->ref, xe_oa_config_release);
> }
>
>+/*
>+ * OA timestamp frequency = CS timestamp frequency in most platforms. On some
>+ * platforms OA unit ignores the CTC_SHIFT and the 2 timestamps differ. In such
>+ * cases, return the adjusted CS timestamp frequency to the user.
>+ */
>+u32 xe_oa_timestamp_frequency(struct xe_gt *gt)
>+{
>+	u32 reg, shift;
>+
>+	/*
>+	 * Wa_18013179988:dg2
>+	 * Wa_14015568240:pvc
>+	 * Wa_14015846243:mtl
>+	 */
>+	switch (gt_to_xe(gt)->info.platform) {
>+	case XE_DG2:
>+	case XE_PVC:
>+	case XE_METEORLAKE:
>+		xe_device_mem_access_get(gt_to_xe(gt));
>+		reg = xe_mmio_read32(gt, RPM_CONFIG0);
>+		xe_device_mem_access_put(gt_to_xe(gt));
>+
>+		shift = REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, reg);
>+		return gt->info.reference_clock << (3 - shift);
>+
>+	default:
>+		return gt->info.reference_clock;
>+	}
>+}
>+
>+static u64 oa_exponent_to_ns(struct xe_gt *gt, int exponent)
>+{
>+	u64 nom = (2ULL << exponent) * NSEC_PER_SEC;
>+	u32 den = xe_oa_timestamp_frequency(gt);
>+
>+	return div_u64(nom + den - 1, den);
>+}
>+
>+static bool engine_supports_oa_format(const struct xe_hw_engine *hwe, int type)
>+{
>+	switch (hwe->oa_unit->type) {
>+	case DRM_XE_OA_UNIT_TYPE_OAG:
>+		return type == DRM_XE_OA_FMT_TYPE_OAG || type == DRM_XE_OA_FMT_TYPE_OAR ||
>+			type == DRM_XE_OA_FMT_TYPE_OAC || type == DRM_XE_OA_FMT_TYPE_PEC;
>+	case DRM_XE_OA_UNIT_TYPE_OAM:
>+		return type == DRM_XE_OA_FMT_TYPE_OAM || type == DRM_XE_OA_FMT_TYPE_OAM_MPEC;
>+	default:
>+		return false;
>+	}
>+}
>+
>+static int decode_oa_format(struct xe_oa *oa, u64 fmt, enum xe_oa_format_name *name)
>+{
>+	u32 counter_size = FIELD_GET(DRM_XE_OA_FORMAT_MASK_COUNTER_SIZE, fmt);
>+	u32 counter_sel = FIELD_GET(DRM_XE_OA_FORMAT_MASK_COUNTER_SEL, fmt);
>+	u32 bc_report = FIELD_GET(DRM_XE_OA_FORMAT_MASK_BC_REPORT, fmt);
>+	u32 type = FIELD_GET(DRM_XE_OA_FORMAT_MASK_FMT_TYPE, fmt);
>+	int idx;
>+
>+	for_each_set_bit(idx, oa->format_mask, XE_OA_FORMAT_MAX) {
>+		const struct xe_oa_format *f = &oa->oa_formats[idx];
>+
>+		if (counter_size == f->counter_size && bc_report == f->bc_report &&
>+		    type == f->type && counter_sel == f->counter_select) {
>+			*name = idx;
>+			return 0;
>+		}
>+	}
>+
>+	return -EINVAL;
>+}
>+
>+u16 xe_oa_unit_id(struct xe_hw_engine *hwe)
>+{
>+	return hwe->oa_unit && hwe->oa_unit->num_engines ?
>+		hwe->oa_unit->oa_unit_id : U16_MAX;
>+}
>+
>+static int xe_oa_assign_hwe(struct xe_oa *oa, struct xe_oa_open_param *param)
>+{
>+	struct xe_gt *gt;
>+	int i, ret = 0;
>+
>+	if (param->exec_q) {
>+		/* When we have an exec_q, get hwe from the exec_q */
>+		for_each_gt(gt, oa->xe, i) {

Looks like the exec_queue can submit to a specific gt. I think we should 
try to get the hwe from the same gt as the exec_q. Basically this:

if (param->exec_q->gt != gt)
	continue;

or you can just drop the for loop and assume that xe_gt_hw_engine is not 
supposed to fail for this gt (exec_q->gt).


>+			param->hwe = xe_gt_hw_engine(gt, param->exec_q->class,
>+						     param->engine_instance, true);
>+			if (param->hwe)
>+				break;
>+		}
>+		if (param->hwe && (xe_oa_unit_id(param->hwe) != param->oa_unit_id)) {
>+			drm_dbg(&oa->xe->drm, "OA unit ID mismatch for exec_q\n");
>+			ret = -EINVAL;
>+		}
>+	} else {
>+		struct xe_hw_engine *hwe;
>+		enum xe_hw_engine_id id;
>+
>+		/* Else just get the first hwe attached to the oa unit */
>+		for_each_gt(gt, oa->xe, i) {
>+			for_each_hw_engine(hwe, gt, id) {
>+				if (xe_oa_unit_id(hwe) == param->oa_unit_id) {
>+					param->hwe = hwe;
>+					goto out;
>+				}
>+			}
>+		}
>+	}
>+out:
>+	if (!param->hwe) {
>+		drm_dbg(&oa->xe->drm, "Unable to find hwe for OA unit ID %d\n",
>+			param->oa_unit_id);
>+		ret = -EINVAL;
>+	}
>+
>+	return ret;
>+}
>+
>+static int xe_oa_set_prop_oa_unit_id(struct xe_oa *oa, u64 value,
>+				     struct xe_oa_open_param *param)
>+{
>+	if (value >= oa->oa_unit_ids) {
>+		drm_dbg(&oa->xe->drm, "OA unit ID out of range %lld\n", value);
>+		return -EINVAL;
>+	}
>+	param->oa_unit_id = value;
>+	return 0;
>+}
>+
>+static int xe_oa_set_prop_sample_oa(struct xe_oa *oa, u64 value,
>+				    struct xe_oa_open_param *param)
>+{
>+	param->sample = value;
>+	return 0;
>+}
>+
>+static int xe_oa_set_prop_metric_set(struct xe_oa *oa, u64 value,
>+				     struct xe_oa_open_param *param)
>+{
>+	param->metric_set = value;
>+	return 0;
>+}
>+
>+static int xe_oa_set_prop_oa_format(struct xe_oa *oa, u64 value,
>+				    struct xe_oa_open_param *param)
>+{
>+	int ret = decode_oa_format(oa, value, &param->oa_format);
>+
>+	if (ret) {
>+		drm_dbg(&oa->xe->drm, "Unsupported OA report format %#llx\n", value);
>+		return ret;
>+	}
>+	return 0;
>+}
>+
>+static int xe_oa_set_prop_oa_exponent(struct xe_oa *oa, u64 value,
>+				      struct xe_oa_open_param *param)
>+{
>+#define OA_EXPONENT_MAX 31
>+
>+	if (value > OA_EXPONENT_MAX) {
>+		drm_dbg(&oa->xe->drm, "OA timer exponent too high (> %u)\n", OA_EXPONENT_MAX);
>+		return -EINVAL;
>+	}
>+	param->period_exponent = value;

I think i915 has some additional logic where only root can sample at 
really high frequencies, but well, this is a root only use case, so I 
don't know what that logic achieved. Hoping that you intended to drop 
that logic, which is okay. Just confirming.

>+	return 0;
>+}
>+
>+static int xe_oa_set_prop_poll_oa_period(struct xe_oa *oa, u64 value,
>+					 struct xe_oa_open_param *param)
>+{
>+	if (value < 100) {
>+		drm_dbg(&oa->xe->drm, "OA timer too small (%lldus < 100us)\n", value);
>+		return -EINVAL;
>+	}
>+	param->poll_period_us = value;

I am not sure if anyone ended up using this at all. This will be unused 
if we add interrupt support in future. Any thoughts on adding interrupt 
support in future?

Also note that if we throttle poll to only signal the user after a set 
number of reports are available, then this parameter is not of much use.  
The poll throttling itself will reduce the CPU overhead that this was 
trying to address. Are there plans to bring that feature to XE (poll 
throttling)?

>+	return 0;
>+}
>+
>+static int xe_oa_set_prop_open_flags(struct xe_oa *oa, u64 value,
>+				     struct xe_oa_open_param *param)
>+{
>+	u32 known_open_flags =
>+		DRM_XE_OA_FLAG_FD_CLOEXEC | DRM_XE_OA_FLAG_FD_NONBLOCK | DRM_XE_OA_FLAG_DISABLED;
>+
>+	if (value & ~known_open_flags) {
>+		drm_dbg(&oa->xe->drm, "Unknown open_flag %#llx\n", value);
>+		return -EINVAL;
>+	}
>+	param->open_flags = value;
>+	return 0;
>+}
>+
>+static int xe_oa_set_prop_exec_queue_id(struct xe_oa *oa, u64 value,
>+					struct xe_oa_open_param *param)
>+{
>+	param->exec_queue_id = value;
>+	return 0;
>+}
>+
>+static int xe_oa_set_prop_engine_instance(struct xe_oa *oa, u64 value,
>+					  struct xe_oa_open_param *param)
>+{
>+	param->engine_instance = value;
>+	return 0;
>+}
>+
>+typedef int (*xe_oa_set_property_fn)(struct xe_oa *oa, u64 value,
>+				     struct xe_oa_open_param *param);
>+static const xe_oa_set_property_fn xe_oa_set_property_funcs[] = {
>+	[DRM_XE_OA_PROPERTY_OA_UNIT_ID] = xe_oa_set_prop_oa_unit_id,
>+	[DRM_XE_OA_PROPERTY_SAMPLE_OA] = xe_oa_set_prop_sample_oa,
>+	[DRM_XE_OA_PROPERTY_OA_METRIC_SET] = xe_oa_set_prop_metric_set,
>+	[DRM_XE_OA_PROPERTY_OA_FORMAT] = xe_oa_set_prop_oa_format,
>+	[DRM_XE_OA_PROPERTY_OA_EXPONENT] = xe_oa_set_prop_oa_exponent,
>+	[DRM_XE_OA_PROPERTY_POLL_OA_PERIOD_US] = xe_oa_set_prop_poll_oa_period,
>+	[DRM_XE_OA_PROPERTY_OPEN_FLAGS] = xe_oa_set_prop_open_flags,
>+	[DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID] = xe_oa_set_prop_exec_queue_id,
>+	[DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE] = xe_oa_set_prop_engine_instance,
>+};
>+
>+static int xe_oa_user_ext_set_property(struct xe_oa *oa, u64 extension,
>+				       struct xe_oa_open_param *param)
>+{
>+	u64 __user *address = u64_to_user_ptr(extension);
>+	struct drm_xe_ext_set_property ext;
>+	int err;
>+	u32 idx;
>+
>+	err = __copy_from_user(&ext, address, sizeof(ext));
>+	if (XE_IOCTL_DBG(oa->xe, err))
>+		return -EFAULT;
>+
>+	if (XE_IOCTL_DBG(oa->xe, ext.property >= ARRAY_SIZE(xe_oa_set_property_funcs)) ||
>+	    XE_IOCTL_DBG(oa->xe, ext.pad))
>+		return -EINVAL;
>+
>+	idx = array_index_nospec(ext.property, ARRAY_SIZE(xe_oa_set_property_funcs));
>+	return xe_oa_set_property_funcs[idx](oa, ext.value, param);
>+}
>+
>+typedef int (*xe_oa_user_extension_fn)(struct xe_oa *oa, u64 extension,
>+				       struct xe_oa_open_param *param);
>+static const xe_oa_user_extension_fn xe_oa_user_extension_funcs[] = {
>+	[DRM_XE_OA_EXTENSION_SET_PROPERTY] = xe_oa_user_ext_set_property,
>+};
>+
>+static int xe_oa_user_extensions(struct xe_oa *oa, u64 extension,
>+				 struct xe_oa_open_param *param)
>+{
>+	u64 __user *address = u64_to_user_ptr(extension);
>+	struct xe_user_extension ext;
>+	int err;
>+	u32 idx;
>+
>+	err = __copy_from_user(&ext, address, sizeof(ext));
>+	if (XE_IOCTL_DBG(oa->xe, err))
>+		return -EFAULT;
>+
>+	if (XE_IOCTL_DBG(oa->xe, ext.pad) ||
>+	    XE_IOCTL_DBG(oa->xe, ext.name >= ARRAY_SIZE(xe_oa_user_extension_funcs)))
>+		return -EINVAL;
>+
>+	idx = array_index_nospec(ext.name, ARRAY_SIZE(xe_oa_user_extension_funcs));
>+	err = xe_oa_user_extension_funcs[idx](oa, extension, param);
>+	if (XE_IOCTL_DBG(oa->xe, err))
>+		return err;
>+
>+	if (ext.next_extension)
>+		return xe_oa_user_extensions(oa, ext.next_extension, param);

What if the user passed a circular list of extensions? If it will result 
in an issue, we should also add a test for it.

>+
>+	return 0;
>+}
>+
>+int xe_oa_stream_open_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>+{
>+	struct xe_oa *oa = &to_xe_device(dev)->oa;
>+	struct xe_file *xef = to_xe_file(file);
>+	struct drm_xe_oa_open_param dparam;
>+	struct xe_oa_open_param param = {};
>+	const struct xe_oa_format *f;
>+	bool privileged_op = true;
>+	int ret;
>+
>+	if (!oa->xe) {
>+		drm_dbg(&oa->xe->drm, "xe oa interface not available for this system\n");
>+		return -ENODEV;
>+	}
>+
>+	ret = __copy_from_user(&dparam, data, sizeof(dparam));
>+	if (XE_IOCTL_DBG(oa->xe, ret))
>+		return -EFAULT;
>+
>+	ret = xe_oa_user_extensions(oa, dparam.extensions, &param);
>+	if (ret)
>+		return ret;
>+
>+	if (param.exec_queue_id > 0) {
>+		param.exec_q = xe_exec_queue_lookup(xef, param.exec_queue_id);
>+		if (XE_IOCTL_DBG(oa->xe, !param.exec_q))
>+			return -ENOENT;
>+	}
>+
>+	/*
>+	 * Query based sampling (using MI_REPORT_PERF_COUNT) with OAR/OAC,
>+	 * without global stream access, can be an unprivileged operation
>+	 */
>+	if (param.exec_q && !param.sample)
>+		privileged_op = false;
>+
>+	if (privileged_op && xe_perf_stream_paranoid && !perfmon_capable()) {
>+		drm_dbg(&oa->xe->drm, "Insufficient privileges to open xe perf stream\n");
>+		ret = -EACCES;
>+		goto err_exec_q;
>+	}
>+
>+	if (!param.exec_q && !param.sample) {
>+		drm_dbg(&oa->xe->drm, "Only OA report sampling supported\n");
>+		ret = -EINVAL;
>+		goto err_exec_q;
>+	}
>+
>+	ret = xe_oa_assign_hwe(oa, &param);
>+	if (ret)
>+		goto err_exec_q;
>+
>+	f = &oa->oa_formats[param.oa_format];
>+	if (!param.oa_format || !f->size ||
>+	    !engine_supports_oa_format(param.hwe, f->type)) {
>+		drm_dbg(&oa->xe->drm, "Invalid OA format %d type %d size %d for class %d\n",
>+			param.oa_format, f->type, f->size, param.hwe->class);
>+		ret = -EINVAL;
>+		goto err_exec_q;
>+	}
>+
>+	if (param.period_exponent > 0) {
>+		u64 oa_period, oa_freq_hz;
>+
>+		oa_period = oa_exponent_to_ns(param.hwe->gt, param.period_exponent);
>+		oa_freq_hz = div64_u64(NSEC_PER_SEC, oa_period);
>+		if (oa_freq_hz > xe_oa_max_sample_rate && !perfmon_capable()) {
>+			drm_dbg(&oa->xe->drm,
>+				"OA exponent would exceed the max sampling frequency (sysctl dev.xe.oa_max_sample_rate) %uHz without CAP_PERFMON or CAP_SYS_ADMIN privileges\n",
>+				xe_oa_max_sample_rate);
>+			ret = -EACCES;
>+			goto err_exec_q;
>+		}
>+	}
>+err_exec_q:
>+	if (ret < 0 && param.exec_q)
>+		xe_exec_queue_put(param.exec_q);
>+	return ret;
>+}
>+
> static bool xe_oa_is_valid_flex_addr(struct xe_oa *oa, u32 addr)
> {
> 	static const struct xe_reg flex_eu_regs[] = {
>diff --git a/drivers/gpu/drm/xe/xe_oa.h b/drivers/gpu/drm/xe/xe_oa.h
>index e4863f8681b14..a0f9a876ea6b4 100644
>--- a/drivers/gpu/drm/xe/xe_oa.h
>+++ b/drivers/gpu/drm/xe/xe_oa.h
>@@ -19,6 +19,8 @@ void xe_oa_unregister(struct xe_device *xe);
> int xe_oa_sysctl_register(void);
> void xe_oa_sysctl_unregister(void);
>
>+int xe_oa_stream_open_ioctl(struct drm_device *dev, void *data,
>+			    struct drm_file *file);
> int xe_oa_add_config_ioctl(struct drm_device *dev, void *data,
> 			   struct drm_file *file);
> int xe_oa_remove_config_ioctl(struct drm_device *dev, void *data,
>diff --git a/drivers/gpu/drm/xe/xe_perf.c b/drivers/gpu/drm/xe/xe_perf.c
>index 2aee4c7989486..2c0615481b7df 100644
>--- a/drivers/gpu/drm/xe/xe_perf.c
>+++ b/drivers/gpu/drm/xe/xe_perf.c
>@@ -16,6 +16,8 @@ static int xe_oa_ioctl(struct drm_device *dev, struct drm_xe_perf_param *arg,
> 		       struct drm_file *file)
> {
> 	switch (arg->perf_op) {
>+	case DRM_XE_PERF_OP_STREAM_OPEN:
>+		return xe_oa_stream_open_ioctl(dev, (void *)arg->param, file);
> 	case DRM_XE_PERF_OP_ADD_CONFIG:
> 		return xe_oa_add_config_ioctl(dev, (void *)arg->param, file);
> 	case DRM_XE_PERF_OP_REMOVE_CONFIG:
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index f17134828c093..8156301df7315 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -1192,6 +1192,120 @@ enum drm_xe_oa_format_type {
> 	DRM_XE_OA_FMT_TYPE_PEC,
> };
>
>+/** enum drm_xe_oa_property_id - OA stream property id's */
>+enum drm_xe_oa_property_id {
>+	/**
>+	 * @DRM_XE_OA_PROPERTY_OA_UNIT_ID: ID of the OA unit on which to open
>+	 * the OA stream, see @oa_unit_id in 'struct
>+	 * drm_xe_query_oa_units'. Defaults to 0 if not provided.
>+	 */
>+	DRM_XE_OA_PROPERTY_OA_UNIT_ID = 1,
>+
>+	/**
>+	 * @DRM_XE_OA_PROPERTY_SAMPLE_OA: A value of 1 requests the inclusion of
>+	 * raw OA unit reports as part of stream samples.
>+	 */
>+	DRM_XE_OA_PROPERTY_SAMPLE_OA,
>+
>+	/**
>+	 * @DRM_XE_OA_PROPERTY_OA_METRIC_SET: OA metrics defining contents of OA
>+	 * reportst, previously added via @@DRM_XE_PERF_OP_ADD_CONFIG.

typo: reports

>+	 */
>+	DRM_XE_OA_PROPERTY_OA_METRIC_SET,
>+
>+	/** @DRM_XE_OA_PROPERTY_OA_FORMAT: Perf counter report format */
>+	DRM_XE_OA_PROPERTY_OA_FORMAT,
>+	/**
>+	 * OA_FORMAT's are specified the same way as in Bspec, in terms of
>+	 * the following quantities: a. enum @drm_xe_oa_format_type
>+	 * b. Counter select c. Counter size and d. BC report
>+	 */
>+#define DRM_XE_OA_FORMAT_MASK_FMT_TYPE		(0xff << 0)
>+#define DRM_XE_OA_FORMAT_MASK_COUNTER_SEL	(0xff << 8)
>+#define DRM_XE_OA_FORMAT_MASK_COUNTER_SIZE	(0xff << 16)
>+#define DRM_XE_OA_FORMAT_MASK_BC_REPORT		(0xff << 24)

indentation/alignment is off I guess

>+
>+	/**
>+	 * @DRM_XE_OA_PROPERTY_OA_EXPONENT: Requests periodic OA unit sampling
>+	 * with sampling frequency proportional to 2^(period_exponent + 1)
>+	 */
>+	DRM_XE_OA_PROPERTY_OA_EXPONENT,
>+
>+	/**
>+	 * @DRM_XE_OA_PROPERTY_POLL_OA_PERIOD_US: Timer interval in microseconds
>+	 * to check OA buffer for available data. Minimum allowed value is 100
>+	 * microseconds. A default value is used by the driver if this parameter
>+	 * is skipped. Larger timer values will reduce cpu consumption during OA
>+	 * perf captures, but excessively large values could result in data loss
>+	 * due to OA buffer overwrites.
>+	 */
>+	DRM_XE_OA_PROPERTY_POLL_OA_PERIOD_US,

Again, very likely not used, but please confirm with the UMDs though.

>+
>+	/**
>+	 * @DRM_XE_OA_PROPERTY_OPEN_FLAGS: CLOEXEC and NONBLOCK flags are
>+	 * directly applied to returned OA fd. DISABLED opens the OA stream in a
>+	 * DISABLED state (see @DRM_XE_PERF_IOCTL_ENABLE).
>+	 */
>+	DRM_XE_OA_PROPERTY_OPEN_FLAGS,
>+#define DRM_XE_OA_FLAG_FD_CLOEXEC	(1 << 0)
>+#define DRM_XE_OA_FLAG_FD_NONBLOCK	(1 << 1)
>+#define DRM_XE_OA_FLAG_DISABLED		(1 << 2)

oh, overlooked this before commenting earlier on the fcntl stuff. Looks 
like you already were passing this in params. Anyways, fcntl should be 
good for CLOEXEC/NONBLOCK.

>+
>+	/**
>+	 * @DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID: Open the stream for a specific
>+	 * @exec_queue_id. Perf queries can be executed on this exec queue.
>+	 */
>+	DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID,
>+
>+	/**
>+	 * @DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE: Optional engine instance to
>+	 * pass along with @DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID or will default to 0.
>+	 */
>+	DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE,
>+
>+	DRM_XE_OA_PROPERTY_MAX /* non-ABI */
>+};
>+
>+/**
>+ * struct drm_xe_oa_open_param - Params for opening an OA stream
>+ *
>+ * Stream params are specified as a chain of @drm_xe_ext_set_property
>+ * struct's, with @property values from enum @drm_xe_oa_property_id and
>+ * @xe_user_extension base.name set to @DRM_XE_OA_EXTENSION_SET_PROPERTY
>+ */
>+struct drm_xe_oa_open_param {
>+#define DRM_XE_OA_EXTENSION_SET_PROPERTY	0
>+	/** @extensions: Pointer to the first extension struct */
>+	__u64 extensions;
>+};
>+
>+/** enum drm_xe_oa_record_type - Type of OA packet read from OA fd */
>+enum drm_xe_oa_record_type {
>+	/** @DRM_XE_OA_RECORD_SAMPLE: Regular OA data sample */
>+	DRM_XE_OA_RECORD_SAMPLE = 1,
>+
>+	/** @DRM_XE_OA_RECORD_OA_REPORT_LOST: Status indicating lost OA reports */
>+	DRM_XE_OA_RECORD_OA_REPORT_LOST = 2,
>+
>+	/**
>+	 * @DRM_XE_OA_RECORD_OA_BUFFER_LOST: Status indicating lost OA
>+	 * reports and OA buffer reset in the process
>+	 */
>+	DRM_XE_OA_RECORD_OA_BUFFER_LOST = 3,
>+
>+	DRM_XE_OA_RECORD_MAX /* non-ABI */
>+};
>+
>+/** struct drm_xe_oa_record_header - Header for OA packets read from OA fd */
>+struct drm_xe_oa_record_header {
>+	/** @type: Of enum @drm_xe_oa_record_type */
>+	__u16 type;
>+	/** @pad: MBZ */
>+	__u16 pad;
>+	/** @size: size in bytes */
>+	__u32 size;
>+};

I think we want to drop the header completely, but I guess that's still 
wip. Any plans to allow read/write of STATUS reg? I am thinking i915 can 
clear the register automatically but store the last cleared value that 
can be returned to the user on a read or something similar where user 
only ever needs to read it. I don't think user will try to recover 
anything if there is an error. In case of error the capture is just 
reinitiated. Again, need UMD confirmation here.

Thanks,
Umesh

>+
> /**
>  * struct drm_xe_oa_config - OA metric configuration
>  *
>-- 
>2.41.0
>

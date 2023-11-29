Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC375C4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 15:03:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F3A410E60D;
	Wed, 29 Nov 2023 15:03:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2180C10E60D
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 15:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701270180; x=1732806180;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MkQR0L9x38WyUYmqXA0/TB3lF1beFAjLsGjw+rh7LQM=;
 b=adRyJPMkxDdiPvqntht6cM69VpXkUWqpafZUmFQTd+2U1UqXOZZvh/QK
 t7NVEvv09V1TYMTvS/sX4nsgeb1rkTy6pinqa9nnB5FZagfjtmeJZpnoz
 KJHxjtR/Hl7UrybdWjkpgGug2TrrXY7ftl9O/Sk/0ih6ClQUgl/bHUWl8
 irdj6PIlaB1LNKTK/7hu5UZYgP9gQp326/ylzB314lneyzgab/+gfWzG0
 /iDPgmtqjGPcpjuaOl5pEWYOhOT/cuA5nY+6TcAH7KT4HYU7+B5kvB+QS
 0pvxAY4b/cQ8cG4FEe2B0DwpNTNo3L4/jj1c0mCTN039GPoaBdOTA2gxz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="372545311"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; d="scan'208";a="372545311"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 07:02:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; d="scan'208";a="17037382"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 07:02:59 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 07:02:59 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 07:02:58 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 07:02:58 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 07:02:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lx4ZNpcdawFgv5xxK9zBgJSuCjfitcM5/GjOI65l+KHUiNUxvIGuleemcYl7oucwn3f/g1a2RY68PjTFqp2y0Erp5kh143f8g/GgZbebPxNYvLbCpwKAS5es0bT50KbiiNq/8n36/RfECdjyRyEUvMe3oJGQJEa1V7xo8L5qvGt2mfKKb8ffgbwRONy3a1uHU4U1XmZkj7Eqd8A3RQIQsh4SQKrZl9JxCvmzxqvF7Cfiw9ofunar9eJ2ahia6QjQedTtSOGgBT5b8WwG5TcoQO4W7BV5sVSRZTTOq/PB5QCy/ExjRhBMLgwh5ZmQntyn7BobBYMJurymbpbpB3gq3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mz2Q66HU2O43lktBlGBKRt4c1YnOx48M5s8puQ6ob50=;
 b=VJSQcVQzuQlYvwa0jLBztHk+ZQEJRwCTgRsYSlWjdOyG6j/SNbStwk91C1YkJxsjhKUjZiZIOpEyu7pAj//1oZlJTGD+VDRcccZ1AmFJ/9wGR1CbEbBV480XicC9aNHbeexitBnXylI9E5+UqacMvIICSD/toBl0vCg++CzJYINNdOlyxJyJhBBmWfH588uqpp0J9qYcRH5g6jK7lHnzcIwhhvbpwi8ltDHYBj5GYO1w0OqA9x/ax3Py/xJvA4O9NDC3evDFyLXfGi5pVY9q6eEpuUoUjIA8yMU55+KQPeRuMVzTmzIOvnCQMKy3B5Lj+mN4XRGB96ZFDrKdQb7hLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB8173.namprd11.prod.outlook.com (2603:10b6:208:44e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Wed, 29 Nov
 2023 15:02:56 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7046.023; Wed, 29 Nov 2023
 15:02:56 +0000
Date: Wed, 29 Nov 2023 09:02:51 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <lkmhdvb53r2uks2ikjzx7f4ajeest25kjzz6ozpqy5llhrjeyv@57xn7aoxwzfm>
References: <20231115143838.2081-1-michal.wajdeczko@intel.com>
 <20231115143838.2081-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231115143838.2081-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR06CA0024.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::37) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB8173:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c7c39c5-8dd3-4837-1cd0-08dbf0ec44c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c6p5rXnvcPZJtKEpDBgTsqMqH8rMahT4ds8Z9u5/xEGSTD8y0W8XuO++CvKiMB2rUdpNp3TlHfsPyVqfiIqKSLXQSgB5T7lGCCPwptoi9WQkb5ZImqe+u2+iNWzmGF9EIqArCVsMoIX3ue2NH4ksgjsCvGlmd23RoxETpbYdqEI4RsSerAaK/rXLmmzI2NVdMcqe3GHV9tPmBQCdYnf34jpP/2ICbN9EjHGx//OuoK6wUm/6IxdEhYunq6MLTo1sRi1nL9kTIpNAJEfiMgI2/pEbiWadCpgNitMsB7wEzTzps60xLT028wHkcrtbV6DJdMSiNneRlHkbkkUBCDWk7OMgs3nuvA2gxxX6j+DKcwjiaczCoFztv25IV8mOBEfRm9B1uvZApfdaymE5mE5gelV7nIU7oXucfgA1mZ+UmwOY1r3SOB50KwNg7Z/RoX1I8yld/Es7uOLbVVy68pYg7p4yc2yZiyR4/54dM7Kdfmo/cZ5ztQZPtspWpIDha6NitfCUl+qUigbDKAQ7eVgxOW1V8djQlnoob7m7hvhGQX13EeHcv4AZ/s3XKJq3Xmqo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(396003)(136003)(366004)(39860400002)(346002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(5660300002)(2906002)(4326008)(8676002)(6862004)(8936002)(316002)(6636002)(66946007)(66476007)(66556008)(41300700001)(6666004)(6506007)(478600001)(6486002)(26005)(6512007)(9686003)(38100700002)(83380400001)(33716001)(86362001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qBISCx4qduW9aBSRpFQK9UqSGDdrifGpIE6rtHWcpE8CJmzjORbZoKGm5lMi?=
 =?us-ascii?Q?J2Bo0BGZdL6eDd5Vw+0A9tT1IN3HylxXRLPww1XucfDelhnxnXkSjTFtd2gp?=
 =?us-ascii?Q?MF4A+SNgcJ7vd2GIzS96z+1fpEDjaEcHKizG9npog+hXKxxjnuRrYDJfURag?=
 =?us-ascii?Q?mqwCKSnkD6oTac65WgH8NPomu+W/Lxlqp9kIzplqkFzTSdSM/hI4F94EigRp?=
 =?us-ascii?Q?tnjppIdGxxssDn5neLuNSVIeeORv/zUJURG+bVrMVhD/jU+KAYNbSy8UzxEw?=
 =?us-ascii?Q?8/M6qaJLVeLRex7oDaFu2jygn6R4APqenH1VbyYzVEtDOqWBeZG6XqfvkFy/?=
 =?us-ascii?Q?+zkA18etv02p+1EzCaPY7LRM3TN1PWQAJ64My76MTQ+SseSBHzpUF918Qcpf?=
 =?us-ascii?Q?ceNGRBPkNo6Q3J3QLXQhuRRRPcGb8oZIqZ787xjAdKCmG7XLgLllh1pjCeHb?=
 =?us-ascii?Q?CEgHln1mtY/u9EIJ0dU1+fQogpv7Hcl/WEfbS+iGJFCrgTrfTj/mGg1U65nO?=
 =?us-ascii?Q?GVW6ZYAk50nffbaA+5bN8lC+5BHoYfw0D3P+WhK3CUM84hZPQO4TefyKAA1F?=
 =?us-ascii?Q?2JbA9nsto1PMoAjzt/r5bjNwfnbRsO1QObZ21lDBteJDWBi7bpCHugziO7/Z?=
 =?us-ascii?Q?N5Q8vJ6P0FeA8PifyC+s57Jl/2LP5Wtoqri8LSqJX9HpWe8f4HAYqpEh7kx5?=
 =?us-ascii?Q?ZczrjXybbJXvaamfCzNmnRvq43crxTCXFm5vSTMmQKjNPcehjS8Ki7ot8IAj?=
 =?us-ascii?Q?Y9gAGWq0n6xnAV9QjdtjVrLB4pWpEHSnR9+VyI8yDcykc6/avYA6JuoHAzpY?=
 =?us-ascii?Q?laqXwKMhXk6VEeGD9S5hmdPWP3/d2c8WwLk5VCKiRa/Z9v9txhpQNA6ueobn?=
 =?us-ascii?Q?W26TqL/cpRs9maLcp5EKh23ZE0c+q2njUwu9WEd0uNtg3Inpr5qJGu/HKbGC?=
 =?us-ascii?Q?1RFfvmGFZ06cfVfPWmxgpp0fvFqOOWdWoU89TWOnZQydC5tAsb332+OHmHy5?=
 =?us-ascii?Q?rfEoVrNT3TbegzlXJsWPNDNxQqvC4JkkLD/pBy/WDbsOetutL1vz4btwPiym?=
 =?us-ascii?Q?9v+K6AsApmz9wEVW/yQPugSPXvubnxAE5tsZuruiqM8DoGNHYrR+x3nUrLXo?=
 =?us-ascii?Q?L8ZtNgXsfSR7q7VeRgqrRy08uAUfKdEp4rRxCxaq4MGf7MedNveaVb8DvOak?=
 =?us-ascii?Q?X/hjDxQ3iZL1JaV79+WMRVV7nQgeDrafVzicVrtTOyK+hW2yTUEoX8orTHf0?=
 =?us-ascii?Q?cPKeHiP+BXYC1Udh04IffzqkO82IV/aCiBY5qAUtnyaVBrxi6B5zQvT+Nh7H?=
 =?us-ascii?Q?bK9N4RJwGYBoATykRSZuKdNUQgDNGqIXNdImk8e2N1ug8WtzjHvxtMvp7lY4?=
 =?us-ascii?Q?ITlZ+q95NGVCLmMEBFLx0f458uErjVfyQDoFFCebDCvgCkwqyopfeuuAB3+/?=
 =?us-ascii?Q?MF0FZlcjcDht+cZLEVMRziSQG33uxtDBNnwXTDeaKSmN9V9HZpykud/DMfJv?=
 =?us-ascii?Q?am6ZxUFbvFr7ZK9AnD5jnoC4tQm/fwkpJkjynCpj1i7lNaBAFK1qnOeuuC5j?=
 =?us-ascii?Q?WlgM4epmM0XZaLndXYyNKv8HGrZw0rDf6qYn5EromKXwKBUW+yi3aj3wxY4u?=
 =?us-ascii?Q?hQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c7c39c5-8dd3-4837-1cd0-08dbf0ec44c0
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 15:02:56.1164 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0rtI90eorWgc1rlfQFlmwtB2lCUL6Xh9PvRdeSk5lWilh58o46GjuA3PIoUB2CbHXvM4dhlY9q4icUUDR5bi0EaHua13QXknjx/tzcOOtPA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8173
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/4] drm/xe: Use dedicated function to read
 engine fuse registers
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

On Wed, Nov 15, 2023 at 03:38:36PM +0100, Michal Wajdeczko wrote:
>These registers are not directly exposed to VFs, use function that
>will provide required data also when running as a VF.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>---
> drivers/gpu/drm/xe/xe_hw_engine.c | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>index e831e63c5e48..1cf26c3c15c5 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine.c
>+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>@@ -496,7 +496,7 @@ static void read_media_fuses(struct xe_gt *gt)
>
> 	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>
>-	media_fuse = xe_mmio_read32(gt, GT_VEBOX_VDBOX_DISABLE);
>+	media_fuse = xe_mmio_fuse_read32(gt, GT_VEBOX_VDBOX_DISABLE);

I'm not sure about this approach as it's not really clear which register
should or should not use this variant. For someone reading the code it
will be very confusing. We already have the mcr variant... what if one
of those registers is also MCR?

As an alternative, we could annotate the registers on their definition
like we do for masked registers, and just tread them differently on the
normal functions when in VF mode. See the first struct inside struct
xe_reg. On register definition we would pass it as XE_REG_OPTION_XXXXXX

+Matt Roper

I'm unsure what's the best approach here without seeing the VF
implementation. Just want to kickstart a discussion.

Lucas De Marchi


>
> 	/*
> 	 * Pre-Xe_HP platforms had register bits representing absent engines,
>@@ -541,7 +541,7 @@ static void read_copy_fuses(struct xe_gt *gt)
>
> 	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>
>-	bcs_mask = xe_mmio_read32(gt, MIRROR_FUSE3);
>+	bcs_mask = xe_mmio_fuse_read32(gt, MIRROR_FUSE3);
> 	bcs_mask = REG_FIELD_GET(MEML3_EN_MASK, bcs_mask);
>
> 	/* BCS0 is always present; only BCS1-BCS8 may be fused off */
>@@ -588,7 +588,7 @@ static void read_compute_fuses_from_reg(struct xe_gt *gt)
> 	struct xe_device *xe = gt_to_xe(gt);
> 	u32 ccs_mask;
>
>-	ccs_mask = xe_mmio_read32(gt, XEHP_FUSE4);
>+	ccs_mask = xe_mmio_fuse_read32(gt, XEHP_FUSE4);
> 	ccs_mask = REG_FIELD_GET(CCS_EN_MASK, ccs_mask);
>
> 	for (int i = XE_HW_ENGINE_CCS0, j = 0; i <= XE_HW_ENGINE_CCS3; ++i, ++j) {
>-- 
>2.25.1
>

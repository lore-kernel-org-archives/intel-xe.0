Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD06C77B7C
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 22:46:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E89C10E0DB;
	Fri, 26 May 2023 22:46:15 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F037810E0DB
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 22:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685141172; x=1716677172;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=19nhZMjM8PQDCz8LO6wBO8v3CPAreJSMvH3K/TMYf18=;
 b=fV/XSy1EZ1mUq7MbBNapCcNbEL5CD+GnzvlLVIJYj1L3WyMPY+kCs1Zn
 S6EMsnj0H8IHF1qlvtzseL5ibmlWy9AxaTPeWU5aXt0yY1sznf0rx622V
 Hj4rFub95Ax1Fnu7SuMYC8qxtTMmH8sTjJLcbxCZ9t7Vmf4rrlOxl3HcL
 Qm4ZvmKcm5dWuAr0TYHaCJzw+iAqZfb0Xk6aEEmCMTTFcnvzaDPzonoS2
 MAgkval/ghD3zFVZSz3kOi4aTjfGnEVvniE3FQ26ZadgWle7Rjwcjvexy
 3aSRCegCIeNSdd/GUQfJE32TTeDF5SSoReFnajRoTFVKDGM1077/8EeQJ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="351832485"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="351832485"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 15:46:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="738428447"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="738428447"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP; 26 May 2023 15:46:11 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 26 May 2023 15:46:11 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 26 May 2023 15:46:11 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 26 May 2023 15:46:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hGtRy+lb7o+Z2812on7yGIlUSV6bs0gx+uJBfL5G85lfTHZum5c+WPe4lE83026MjrqIdFd6D0nyRH8xiWOzvSVoGGboAgEW5wiYkyDp4nTGpW34bF8T/jHhp2xP8us+kQ4f3MCJL9IJq83negUzn5/mmLg0gLbradwN2Ulwe4tzzetgBLtLJkYULkMYmH/zkUswzbgU0pkFpcorJ1nLQqpLaXEha1em/gPMwVLbeKtdJlQHv/gPslEwnI6OKroBxT9gmajv6dEHt57IEL3ZZAYVtT2NAe2ktfORxNH3fe6ygonqQy87vGeeih9Css6f5h5CDZt9Ve0ABWpS1ByeSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a9epNoTFlvzkwn2e2TNyNCyKqsgWuOGmANEGB2iFU9o=;
 b=eAW2dypygCxXxBtSJARjBEixir1QhMDxxoJ+hpjO5+pw0moc7pGJAz84TIg/8SHZqscWzaIxZ3fSFFl7yPPyCPcp8coXj9DJCq3hvWp1vf45EsEDBGvlA2If6iNQteCe/WbwicVtLtU8jge+z8X6uTnnmxreSrtuAuCHq6IA+q2mRv1qcvif0+29g31n2wHaEZebuS0O+TDduGRz8PspzZhfk+XmsC3Pixaz3XUKDyigpL9dplJX5j012333ufpsAhUGT53tuRXAnnG5V82v9GIk+7vUK0TxJC+gVnaw1l1Zqxqhw2A0jibuwAORb9xC8nrAd34sr5VfOYOH7BziBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW5PR11MB5882.namprd11.prod.outlook.com (2603:10b6:303:19e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.18; Fri, 26 May
 2023 22:46:08 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6433.017; Fri, 26 May 2023
 22:46:08 +0000
Date: Fri, 26 May 2023 15:46:06 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <bxwabwmxavbtr7uk2vqlghuunhuuayiyav5v5p6vkypqudwru5@kih27ndabj2g>
References: <20230519231827.3572452-1-matthew.d.roper@intel.com>
 <20230519231827.3572452-30-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230519231827.3572452-30-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR03CA0040.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW5PR11MB5882:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f49fa23-7adf-42d7-9e6c-08db5e3afefe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hbFYDX2tTWr/baIW+/LhdJcH6Bcq5dtGVs5fs9jydo8bgtGp1TMojiiioJHJft1FjZMoXpZRDeXionicJepl81RlIGXR0ELA5HKPTLiajuOvd5+1vQ4wHQtv506aByOesjs530/JqS2wQIliuoSNJfz9osYIqM3WfY9cEwUMZL+o5owI52hvGUKXi2thMrqsJDhnz3JfHRD3pcRtpqFPYhglchq254lNeIYfpRycoJnqrmu0y7lonWZhw/Gj/j5RvymPkGBSfMt4nKiROBNegn07Q29SAmHjHptT0JDqCmogQEo/eXLlzzddfMC/CUDneLwdV7kV2kj7+ogTu3P4SO1U22Xf/pfcFagXHNHx2WHLm2alxsISWVXUP1SBCW9q9LQ+3lGvW4LEmM9lR/1rCJD+kZDnUD5gSZq3Q+9fZzIRgKiD0tgMBOxX+zMq/zIwp4hFa3rYgBECdXkUT5ECeMYAptygqtKTiDFvVj3MtfjdPX4vsREmoIc+ws5bQ2YrhIyfop2S+gZRsPflwEGQCCbwdzt9yQKyYh7dxHKZL62/G1SD4v5uWnshxPA5buvf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(376002)(396003)(366004)(136003)(39860400002)(451199021)(316002)(26005)(9686003)(6506007)(6512007)(82960400001)(66946007)(66476007)(66556008)(6636002)(4326008)(38100700002)(33716001)(5660300002)(41300700001)(6486002)(8936002)(6862004)(8676002)(83380400001)(86362001)(478600001)(186003)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GquWzAVQqzDydKRAVaajM/eZdYaJzMhOamYFnE/yJr+1eK70knFo5cPkfaaM?=
 =?us-ascii?Q?fWuPI4lVG+Do88js9JRlQTGs/0lkut6pN2c3qBNWIv1aynfLgQv0C0Ywh64S?=
 =?us-ascii?Q?Oblme0fqtQDHxz/4W08Xdsmo1VgdH1ALHmdI/GYuqukDVzVbvHPd1DI1N8UP?=
 =?us-ascii?Q?lsLsRflw0ojou029pKzAWg19zkJPvSg8uejVZh2Ui3sqtr/gFMPPX0w3r8gL?=
 =?us-ascii?Q?mwSFmyyRDtKlXwLy/Z1hj1HX6NtHgEWe0Hru04DanU6P+4Lkb2/VNoMVDqlf?=
 =?us-ascii?Q?fnY82YsKN1EDMrIHxO7pKIKkRAKMwNm4gknN6VIPrYBbtFi8W8pH3NQll+57?=
 =?us-ascii?Q?wvSvKEq1A7b/w5sQS/tMIXqGTqiiOG41P3H5bULWmmossNFRh6sC1L2h9gDE?=
 =?us-ascii?Q?LQoSv9Efiwa8T1nBmAxhAY/gIyesN4E1q7QpCw67iWREVhO+ZAgFaP+9hoOn?=
 =?us-ascii?Q?PW8cHaBfsqimmejCFwxs8+PnLEg7JgfV1nSu48ZLgihiwR+Fc6muXWmZOPVA?=
 =?us-ascii?Q?QbCY4JLuaJ9YPc7UlFy1jToxXuqobtegzwwWiJHUmVVGCe6CGzWdHcb5t/7m?=
 =?us-ascii?Q?+VG0sHTzwhOfsmnZ+i90n/V26Tt92w2XQKiunz7NmL5xDKXyIvzOPTJuXTol?=
 =?us-ascii?Q?mUkiu0Wtk4cRWwYBvSV24TfZY4Bt4sttwc5Nb62u+fxSp4nBcv/xIuCPU83q?=
 =?us-ascii?Q?8E5YOngPrfGw3+zgGb4Q4rp6fHnOWXa0/muqwUWFZiC13BsgprAjYQMf//Ao?=
 =?us-ascii?Q?gm2gBS3CDsBIdXYpitgvk14LFl+VDBE7Tv0DKZ0dGPGlMU8V5GbCsN0Y++5g?=
 =?us-ascii?Q?ZCGWQBhzykJJapAncRvn5OWyNZItrdDI6p5Cnr5DYcMQqu2qZ7LbmOKDbF2X?=
 =?us-ascii?Q?OTkO5xaLGTuLeHe1tDla/4DMrB5u9h2Q7V1+ero5sh3UTWKop+a1kcB9d28b?=
 =?us-ascii?Q?fLhr2N0OuPmEj750d/Pu0KIyesbGEfKRKe0d5qNQNSw2mUvVseiB/WnmXTCM?=
 =?us-ascii?Q?9whko9xjjsdwBnz5YKpeSaE4buVfL/wqiWZIlwdaV+hl/M6e2/ybAceq5BcY?=
 =?us-ascii?Q?H2HrdjeRJQRrIFZB7S8KhORWXSM46KUZsr7qbGqcqoIiALfCJD2Wp6eWIZus?=
 =?us-ascii?Q?S1/pSg4S0FMXmHnnBHYw8k2Z8uXzvv8YW42DSZu7BexqkIbWeBcbJIubjDjl?=
 =?us-ascii?Q?st0JjZV6QmzpsulqoV5sGjrB5v4VlScIjwX2vEtg9WAhBkgoIUHwV3bEwDV/?=
 =?us-ascii?Q?VdxECYUUkAkQ9jy7XFFpo1o8+dHHWthUly86Zhnay+cKeMkimr5UXt1Q4etB?=
 =?us-ascii?Q?E1rt0lPRiCs4lhDu3ZZGiP02s2JILfQ+AMxPb3GsRS7f/MDLPlgX3KRvAdMa?=
 =?us-ascii?Q?Uemb7ZsC7/vfrM0ZHvUgpcGVrG/o32nYhqWnKgvz1nE9AvDeoGeoEWKNFoVu?=
 =?us-ascii?Q?LvKZUH5NDWAHtiAfzRbBp6+pQhcng4a1Tzm9O7En2ZLUe6ew+bygkCuboQVr?=
 =?us-ascii?Q?09nyFxfw5m51uwJ7Q46UJ21FMt9Y2lazq7AZVv2xjPnWhjkkYZLu4Utou8QH?=
 =?us-ascii?Q?Fj/uR4E5eJzyG3nf2BruXLoI6VJUUIe4IK/iSZ0UPLUYAzjA36y/Y58+UGOX?=
 =?us-ascii?Q?yQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f49fa23-7adf-42d7-9e6c-08db5e3afefe
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2023 22:46:08.4062 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rhWr5N7m0GSXewRNAj4xWJSZzhe9i6O+v7GcwjS/TvIYHh66oK4QbVtD1K2DC62EuI/d9GEBjoVIYU5caf6X887dFe0KElOkq5wWj21bxPs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5882
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 29/30] drm/xe: Reinstate media GT support
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

On Fri, May 19, 2023 at 04:18:26PM -0700, Matt Roper wrote:
>Now that tiles and GTs are handled separately and other prerequisite
>changes are in place, we're ready to re-enable the media GT.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/regs/xe_gt_regs.h |  8 ++++++++
> drivers/gpu/drm/xe/xe_pci.c          | 26 +++++++++++++++++++++++++-
> 2 files changed, 33 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>index 4d87f1fe010d..26247725e0d8 100644
>--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>@@ -8,6 +8,14 @@
>
> #include "regs/xe_reg_defs.h"
>
>+/*
>+ * The GSI register range [0x0 - 0x40000) is replicated at a higher offset
>+ * for the media GT.  xe_mmio and xe_gt_mcr functions will automatically
>+ * translate offsets by MEDIA_GT_GSI_OFFSET when operating on the media GT.
>+ */
>+#define MEDIA_GT_GSI_OFFSET				0x380000
>+#define MEDIA_GT_GSI_LENGTH				0x40000
>+
> /* RPM unit config (Gen8+) */
> #define RPM_CONFIG0					XE_REG(0xd00)
> #define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_MASK		REG_GENMASK(5, 3)
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index bc0ed2a0e44f..890625598209 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -552,7 +552,31 @@ static int xe_info_init(struct xe_device *xe,
> 		if (MEDIA_VER(xe) < 13 && media_desc)
> 			gt->info.__engine_mask |= media_desc->hw_engine_mask;
>
>-		/* TODO: Init media GT, if present */
>+		if (MEDIA_VER(xe) < 13 || !media_desc)
>+			continue;
>+
>+		/*
>+		 * Allocate and setup media GT for platforms with standalone
>+		 * media.
>+		 */
>+		tile->media_gt = xe_gt_alloc(tile);
>+		if (IS_ERR(tile->media_gt))
>+			return PTR_ERR(tile->media_gt);
>+
>+		gt = tile->media_gt;
>+		gt->info.type = XE_GT_TYPE_MEDIA;
>+		gt->info.__engine_mask = media_desc->hw_engine_mask;
>+		gt->mmio.adj_offset = MEDIA_GT_GSI_OFFSET;
>+		gt->mmio.adj_limit = MEDIA_GT_GSI_LENGTH;
>+
>+		/*
>+		 * FIXME: At the moment multi-tile and standalone media are
>+		 * mutually exclusive on current platforms.  We'll need to
>+		 * come up with a better way to number GTs if we ever wind
>+		 * up with platforms that support both together.
>+		 */
>+		drm_WARN_ON(&xe->drm, id != 0);
>+		gt->info.id = 1;
> 	}
>
> 	return 0;
>-- 
>2.40.0
>

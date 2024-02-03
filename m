Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E43C4828F
	for <intel-xe@archiver.kernel.org>; Sat,  3 Feb 2024 06:05:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AC9110F3BE;
	Sat,  3 Feb 2024 06:05:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jyI5mtUe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E83810F3BE
 for <intel-xe@lists.freedesktop.org>; Sat,  3 Feb 2024 06:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706940338; x=1738476338;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QKsTLks3KNxH7z1BxXG5CTChm4k5SKR1rnFRhxvBY4M=;
 b=jyI5mtUeEmzLncGX6rVgJk1y1A2rIXkqDEpLRdFGarsmEdqRPNeXnYBu
 6oyMs1gqrb4ZeAVuzWfRgba4GVMZkPopMs9L+puAXsbR6jgpLrK1EwM8/
 Bq2aJrvRsrLHAcszW/Jqc/HoLpbxFKa8QEKBQnTxAWrp4htjVQRZpIrIV
 eMqSvJCGosOgjsHDmoE08KCgBy9ldJjK9QCbL0nq3YdlpCCyk4eLZyvYF
 b5BBUz6ZCHuxThReSN+4XjRBvQqXLTb/sQsbuDtsBPF5H+vl+2bhKGZ8o
 Cn4z8AmZRweaWk1KBpDIeby8szAqeogjjrKWA/4ckKALfANxpL9DdYfge Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="435433741"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; d="scan'208";a="435433741"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 22:05:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="4872632"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Feb 2024 22:05:37 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 2 Feb 2024 22:05:36 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 2 Feb 2024 22:05:36 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 2 Feb 2024 22:05:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i+jq0EJEjDHIBmTsrkBviHSN1ajDn2mT+m6ZHiQuK5TKhNpGJiiy5h5Rme7cmYPzmfowv8qeQaxm1fd08Yxi6OVb0/c821DkWmJ2qcfHKKgY5/7ZSdSSWyZWocJJ++1sGnYnIQkOkeLSYWTxAnmVyVHZ+7Nzc6ONspIHAfiWMYgEUVzEJDjzQMJSD6z14QGZUGnA/EZCdStzQZBjV3Z2SjlO7iMKUARUCHT+gob+2QTaRpQkj03cLmqc3282uzbwy+ZywVPouJ2D+tFQe5Brm/J58fVvStsusRNFL1yOCojrQ6Qo/3xpivi4oHAZJUSPESeg9YMLUjxHQNNyoIguZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KUdcR0rhvGXX8fzmfyjBchLyBfeai6dZGbr0J9LMczU=;
 b=d+iAt4fVizKzTx7m5DwAIjQuPf8HrMicu1qN5wueI89sNvA/10CLazqVeB32kAdV2C+7YCENBcnYX7HgdfpP8CeY8NkDNrEp9msEtWyysUKrlul/Gc4fwSXwD18Ylf6KQRlpkMrMc+SDmbnEHIpE4SiKOrQoq1sZe4ooPn4xEw+xVbwp4QVkiSMwo5dyxZVKGWx9YxDHeeQ0pdPGZ7K7BVzNIvOaGseGn6n/8MpEWEjegtc3UJzOrEkg53C46s199rBsBe7aKoPHJlRQfXiZUwAJxE07j206H10LnnbprEnZUFwDg56GuS1WF0UQvbhl4PlLM/9wA+Dy0B60KeEM9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL1PR11MB6049.namprd11.prod.outlook.com (2603:10b6:208:391::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.29; Sat, 3 Feb
 2024 06:05:34 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7249.025; Sat, 3 Feb 2024
 06:05:34 +0000
Date: Sat, 3 Feb 2024 00:05:32 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Xiaoming Wang <xiaoming.wang@intel.com>
Subject: Re: [PATCH] drm/xe/display: Fix memleak in display initialization
Message-ID: <5ixppxdyvowbzk55lv2rg2u7wccfgj4cmxsitg3tfcdfcmnydu@armtp3e7izqo>
References: <20240202215658.561298-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240202215658.561298-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR05CA0169.namprd05.prod.outlook.com
 (2603:10b6:a03:339::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL1PR11MB6049:EE_
X-MS-Office365-Filtering-Correlation-Id: 6371c0c7-0a27-49fa-96ff-08dc247e225c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JYs+EbKzzGbdYUOqYnnGW5Tl0jiRaioWlIBurbRQ8C5nXa2YD6VlSuwWVH/wOLT2o0LB2MV3JNEXPpwS8rNXmnj1D3hvFbBTdkpoEY+GOMChMdqmlYj0cOHt49uKa8R+QU2RaxQPfujtCM2lRfDW1MIV6wYbZd/Ie1yyNQlQqGYSLBPYrsxIphxuQUZ6/nO8tssS3BKfpOde/p3gERzE7wx7TidPTe/CKXEGwWxaJDfDumHDjz93YbHKfMGQ4McJD9h3b5lOG2c0ayd1eZ6yHMSsTim5h6zGQ/HQKc/ENRKDHQ8KWVr8686sPoavBLIMP9v4yBDe/mGh2O1nYk5q2Da3wMg1INChvo9w+4vmRmsT4s8sWxxWEe/ou4Z6iz8jDdaAdzzOHChoz+7KenfUG6ugav7XDKCioNhmpkPY0wRaLYhfee92RH/BDAL/XC1FQR64nFXuz/7VHpt++AyOIfkJuZ1oCAxjAOkOk7RDZbNDLqLncSZvEo+GN/M7IO+E6Y9TXCV+4qliYfBOgBeG0Z0gcodNrL+cBVIzv+mZBG7r6/6ykOGHkGtidk6zROWB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(396003)(346002)(376002)(136003)(39860400002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(83380400001)(9686003)(6512007)(2906002)(26005)(33716001)(38100700002)(478600001)(6506007)(316002)(66556008)(66946007)(8936002)(66476007)(4326008)(8676002)(6486002)(5660300002)(6916009)(86362001)(41300700001)(107886003)(82960400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cinZT4LFt0OrtdXTdN5b/74V60spOaDiQAMjgjtJwZCDvXNe63pU5WDnWRVD?=
 =?us-ascii?Q?ElxdYNLT8EEUfNUEdp31EK4r+EKoCzKlLzeY35XJyPbwPaSIo9H9NiaZVR4U?=
 =?us-ascii?Q?L09bSd/qRdVSD5tYTKQ38gGOV+4UPJ3N7d99mWjLiLsUDtDeTHtS6OGuFCJh?=
 =?us-ascii?Q?UnNARJytRuRUu3OF3vodLhmVusCtywfEoVv+qlPnDqnXXlMIdXpO8071AXOU?=
 =?us-ascii?Q?4HUNUoi0AEHIbA2cMQAt+5SN9U0MphDzZHhXsb0uYkzj3vi5l7aTUO07d807?=
 =?us-ascii?Q?SytdICdaybkhc2s793mGHmnRzwE8eBBLiel+URh3Fy1WlrhJu+ZT7cPr0JFd?=
 =?us-ascii?Q?crGwN41eMqjb3eVT5y3+Pk2VdSkByVshAYvYZblk3BzlrUSuHG3NeEY72RtQ?=
 =?us-ascii?Q?5H9Yv6/tvDOnZ6I/70Ez+j9tZav0AxEUqW8gBhTKoH4BFzC7T8wwQAO+imsg?=
 =?us-ascii?Q?TBw+hNyzUblFWkesF15Bkm8LyFZdLVceKpFQ8fqXBmRJgNZwwcrnDJjZJ3H0?=
 =?us-ascii?Q?A2Zb03mTOwmnVewVOBdkaIsSOePn2TgRjP8pqnOFjW/sGlbV7MADUafUqaVQ?=
 =?us-ascii?Q?1rKAdWnABC3cz2JyzUkgLzVLzPgqas1cNQVkv/YnCSyQlOZf1abEhH6Toaqu?=
 =?us-ascii?Q?tlvx05ofzC9kYEpXI0B5AYec11xD2DT7P4iFHj2EtLokIbwixhJQfiWtWE2S?=
 =?us-ascii?Q?e4UJcpz694SxPbSH9cJZRfp+ZPDxxg8m5pNu+hguQVmmxA2OkOmkmFAVfGk1?=
 =?us-ascii?Q?/9J1pWNativ+OHQc3wSh1//7p2dbzRmsLJAjQjT+AIPj01z+hQSni2m1wwhf?=
 =?us-ascii?Q?LqL/LIeCB4ezMRJo16qURUFCJPJawsuifsT/7dqAT0bhUxECaf4dxJAYkQY6?=
 =?us-ascii?Q?xmdhbcVisvJt5lj5rMBGqMixR5lWpftrbOcoCW8ajp/FCAJF3ICr30c5OKZo?=
 =?us-ascii?Q?xO0BZfklCAKJnQROC+r74TWYooVUDPF9/9WyePAhiabsoD7qc/esAD5BBU4y?=
 =?us-ascii?Q?TwqGTfq7XnD8qUGZTATCXIsMwZfNfGDQHU4H/paz14EL6J0GOLkTZ2FfQOxq?=
 =?us-ascii?Q?w17qpWTs6y0K4ZrMN3EQa93tIwue97RdSpbKv/jO3YjU4jTlTyeISxp4VaH2?=
 =?us-ascii?Q?JN94tquaG7Q+Y1F2YYtaLTBOhhEBNgb3ZS6xTFSET22z3Qv8vl2cfx9eCYfs?=
 =?us-ascii?Q?bHZ65rKxsxO1kNpSteVjNlubNIzu14Q9f71mvMLNpp4ghvVQvfOZcefZ1IwK?=
 =?us-ascii?Q?1wM0z3g5ZKVuCtyA14BW6suLQacGw0WxsVk23YOB7L0axH939ZSyAXrlUq03?=
 =?us-ascii?Q?lLHr2XG3YHEXg+yXT3QUWRSCUxV3kSsFXH4gnIq8/eLBampLwB4mbj9Odkb4?=
 =?us-ascii?Q?oNXNJ+MLHb4atR+BEc9QTztbRdm5eYCIN6jbkqDLzpI1TVOgP0z1WyHVnj3D?=
 =?us-ascii?Q?cnH8PRjiCrW64YpKuwhSvs5VXnJ4diERthl23Em0WOvWr0PhIzeYECw5LP6T?=
 =?us-ascii?Q?j2xClbiVv/r6PXHBpAYaxgpDb7Os+z2MDRmYXJiy/k2rqMmj2QfQxqou5sd/?=
 =?us-ascii?Q?lUAHreNiceAbWcglnSmzVHZxI6NbtMH8YAugRZHFgSQ+xrVPCcY9gvANFwyC?=
 =?us-ascii?Q?LA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6371c0c7-0a27-49fa-96ff-08dc247e225c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2024 06:05:34.1944 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PpEDRs/kG4rtoDr4j6O1sbraeFc+zer7hPTwdBbWmk7Mp95pt/jFWZsmjnYRw9t9fgIoDRZyXtQcHWmj9uzsyIBiCNDmmZdB/4fvLgOpD7s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6049
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

On Fri, Feb 02, 2024 at 01:56:58PM -0800, Lucas De Marchi wrote:
>From: Xiaoming Wang <xiaoming.wang@intel.com>
>
>intel_power_domains_init is called twice in xe_device_probe:
>xe_device_probe -> xe_display_init_nommio -> intel_power_domains_init()
>xe_device_probe -> xe_display_init_noirq -> intel_display_driver_probe_noirq
>-> intel_power_domains_init(i915)
>
>It needs remove one to avoid power_domains->power_wells double malloc.
>
>unreferenced object 0xffff88811150ee00 (size 512):
>  comm "systemd-udevd", pid 506, jiffies 4294674198 (age 3605.560s)
>  hex dump (first 32 bytes):
>    10 b4 9d a0 ff ff ff ff ff ff ff ff ff ff ff ff  ................
>    ff ff ff ff ff ff ff ff 00 00 00 00 00 00 00 00  ................
>  backtrace:
>    [<ffffffff8134b901>] __kmem_cache_alloc_node+0x1c1/0x2b0
>    [<ffffffff812c98b2>] __kmalloc+0x52/0x150
>    [<ffffffffa08b0033>] __set_power_wells+0xc3/0x360 [xe]
>    [<ffffffffa08562fc>] xe_display_init_nommio+0x4c/0x70 [xe]
>    [<ffffffffa07f0d1c>] xe_device_probe+0x3c/0x5a0 [xe]
>    [<ffffffffa082e48f>] xe_pci_probe+0x33f/0x5a0 [xe]
>    [<ffffffff817f2187>] local_pci_probe+0x47/0xa0
>    [<ffffffff817f3db3>] pci_device_probe+0xc3/0x1f0
>    [<ffffffff8192f2a2>] really_probe+0x1a2/0x410
>    [<ffffffff8192f598>] __driver_probe_device+0x78/0x160
>    [<ffffffff8192f6ae>] driver_probe_device+0x1e/0x90
>    [<ffffffff8192f92a>] __driver_attach+0xda/0x1d0
>    [<ffffffff8192c95c>] bus_for_each_dev+0x7c/0xd0
>    [<ffffffff8192e159>] bus_add_driver+0x119/0x220
>    [<ffffffff81930d00>] driver_register+0x60/0x120
>    [<ffffffffa05e50a0>] 0xffffffffa05e50a0
>
>The call to intel_power_domains_cleanup() needs to stay where it is for
>now. The main issue is that while the init is called by the display
>side, shared by i915 and xe, the cleanup is called by a non-shared code
>path. Fixing that will be done as a separate commit.
>
>Fixes: 44e694958b95 ("drm/xe/display: Implement display support")
>Signed-off-by: Xiaoming Wang <xiaoming.wang@intel.com>
>[ reword commit message and explain why the fini needs to stay
>  where it is ]
>Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

applied, thanks

Lucas De Marchi

>---
> drivers/gpu/drm/xe/display/xe_display.c | 6 ------
> 1 file changed, 6 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
>index 74391d9b11ae..e4db069f0db3 100644
>--- a/drivers/gpu/drm/xe/display/xe_display.c
>+++ b/drivers/gpu/drm/xe/display/xe_display.c
>@@ -134,8 +134,6 @@ static void xe_display_fini_nommio(struct drm_device *dev, void *dummy)
>
> int xe_display_init_nommio(struct xe_device *xe)
> {
>-	int err;
>-
> 	if (!xe->info.enable_display)
> 		return 0;
>
>@@ -145,10 +143,6 @@ int xe_display_init_nommio(struct xe_device *xe)
> 	/* This must be called before any calls to HAS_PCH_* */
> 	intel_detect_pch(xe);
>
>-	err = intel_power_domains_init(xe);
>-	if (err)
>-		return err;
>-
> 	return drmm_add_action_or_reset(&xe->drm, xe_display_fini_nommio, xe);
> }
>
>-- 
>2.43.0
>

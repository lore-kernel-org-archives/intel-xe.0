Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1123ECE7AA0
	for <intel-xe@archiver.kernel.org>; Thu,  5 Sep 2024 21:58:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF8CE10E95C;
	Thu,  5 Sep 2024 21:58:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y93QLmDN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12DEE10E95C
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Sep 2024 21:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725573518; x=1757109518;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ebmHq7cofYxyQL95S14giqXr0eolu4GGalcOvXOwRjk=;
 b=Y93QLmDN0a4s7i+95x/A7PvzUWO9K2BkzexU+BsbZS5+WxqYXgXx9cQY
 yRFhRO5cEj3AEVee+R2K8Up4SSV+Y0T0TOgR2orlSfRe98sfFahjcuK2+
 0fUcgSx3+CkEg+Psc46UmVWnnsG0lJXpk67aLyHRS66q1dnKkv6Q9UXC+
 5hqQ6TRr0gQ4F31/D5w2B/V5KwjFnMw64FcNaRtVouC3YUvc0byM3DjUq
 Fi6/Orj9aJqr0VhHxh9YteOMkR9Qv9U3UO1W+RoiFvaitCxOV+j3/nSHj
 Y6S7cLVa9gHBl1y5PWviTzlj2HBkVC12HHwb/1l/Y2dTSV2aBDkemlJiQ g==;
X-CSE-ConnectionGUID: 1z9YKS+MSX2Xg0B5KD0f2Q==
X-CSE-MsgGUID: I8W7/5d0SqizQFvqd0/sIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="35706181"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; d="scan'208";a="35706181"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 14:58:37 -0700
X-CSE-ConnectionGUID: ObO6Pw6QR6KAm80frcofsg==
X-CSE-MsgGUID: 2osfTzQNScOS8trNKuJmuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; d="scan'208";a="65581792"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Sep 2024 14:58:38 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Sep 2024 14:58:37 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Sep 2024 14:58:37 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Sep 2024 14:58:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zIUkMC1IsxIcA2q7w7mfG50FUY30s0A+nmKMtJyucUcdeK3YHzhNFwkg+ROI9Ixl5AwwngnMhw0QNpeHJGW0IPi/N22N9P5sGvxMpNDbt+ilr0xwUAYp0UUDaVWPxL/33hbzJBtbwsg5HaQOB7MCqS8MjDRrLaRTPtTwR9l6NxZGTxniJ5HsPv66kHXaK+fifHIL9u911jC/DQ7yngb0lbxXfZ+3g3/gkoWe2xXroLJa9nzFF0e0aHzttp97Kr2N/jXeEhNOM+VZf2Hm6xUgZ6uOPCmRdNFM8lhlq5R/Y/iEDIuLgRDBss4aD5V47OmI3dX83nVp4HLnupAlrUv+6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3dvTcyd3NdjNnIgch9i0c//dTOaX97aAtgNL/DGKOGg=;
 b=AVw1oziY4xgx2ulxPuXoYO2DeIqsfgBZf9surJ8gZ3oACYhZ1Co+qLvJCmXObP+3au7wMjBhYTgnE+UeScllVyw1KsDm8WbhH668X2BbS6t6pHCKcIW/CmESmy4lihmEugFokeTz0Xjwy77tPkeIdeJYqaNKVZI1BczNC3gyyXxg7Lh9teLvGOg9zslb5fx0Cwkion2uf+vsstpS/sKMuwou7y2KE1M84elldIrxPOyZ+H8Sz/pXn4dYlRUoqfb3Wa7k2dcdKhsAcEFHypthdTrwl4UhMtt28tNA9evWTAWEYXlvhDXFljrOGY7NxtxiBIpKazqT9jzLWYP0nu6yUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB6926.namprd11.prod.outlook.com (2603:10b6:510:226::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Thu, 5 Sep
 2024 21:58:28 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7918.024; Thu, 5 Sep 2024
 21:58:28 +0000
Date: Thu, 5 Sep 2024 16:58:26 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 05/43] drm/xe: Populate GT's mmio iomap from tile during
 init
Message-ID: <ep5b5wfwctd2xpgzqletnosyu4wreatb55xurnx2nbr4fvnwt5@xjjmy2ljgfjl>
References: <20240904002100.2023834-45-matthew.d.roper@intel.com>
 <20240904002100.2023834-50-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240904002100.2023834-50-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4PR04CA0189.namprd04.prod.outlook.com
 (2603:10b6:303:86::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB6926:EE_
X-MS-Office365-Filtering-Correlation-Id: 0df0e979-458a-40c5-8e9d-08dccdf5dfca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?f8Fycz241pmFndNVmZRYtDjzdFbwt2/Ti7F86KzvpF974T7JJb4EQHRvwVIa?=
 =?us-ascii?Q?TUn1SlgqnuQBFELbh1w7e+1Yx7oPFFh5+s3FprCQYK4itAVwYgt4AtWgbMV3?=
 =?us-ascii?Q?QnbDkDulwPyIogi4xyAiCN/Y8VahHehQELpdsHNsVNXnvnACpgDLDHA83l9p?=
 =?us-ascii?Q?geI/G9Zz1mXMtfBxMp7yTetNJP4K03+Ca9rXUHIguiZkAbGfOlF7nkWxbQa5?=
 =?us-ascii?Q?5r3QnYnmD9g6ENwEHu0/Hb2uFOCaDJhwpGbshrVxdb1qC4uqs4JCa1SE5ZKd?=
 =?us-ascii?Q?WQm3WMIuaO4u5MBDZWqwk3BgA2yvj5g7DTPHhuV67o7EGoAL1yZLQB9l49e6?=
 =?us-ascii?Q?K+mRjntkwms1ylu7wRCQg4zqrVbosaZd95bxfhMTfRzSNME/kmnAz9ho08sP?=
 =?us-ascii?Q?dfFFebJFa3XiHT4kdd6vmQmuwO+7/WWaJbaI4bVzh16JVzR523qCW0Kzt1jC?=
 =?us-ascii?Q?smzP+4GPYpZo3YbKEDH3zVxJDNEAX/ngZ9jkHhm2JVN+fiYQZLxKN7BVmtSp?=
 =?us-ascii?Q?9/0ftQRW8ObQUOe+iLbNJaF1iKXU+5akZauGMJkOHWcave492ZJzii4xT3X3?=
 =?us-ascii?Q?W3ewhoQGDuF2Idf+Rf7c0HcJFPSordPngW4PF/ASLAUVewdtY50x4HSExn3y?=
 =?us-ascii?Q?YWGJHwBrM3Ef233cePcT/sKRw6fUfPXg0i4oOOI0B2GTFjWqXJ1hsJPrcmRN?=
 =?us-ascii?Q?DK2b8+fa3Wffm1fTK9owur8kBEXAgiMOJu2ByQhT8hXbEhLEx/pmCoKMzwLS?=
 =?us-ascii?Q?O1BKKtali+3AfPifS+/G9ak3Ya6+ZDELOWs3D8YFvUD0+xC069I3uR4GFxRX?=
 =?us-ascii?Q?NmcBoWe3s0JaSrIKISVCJWhKvLOFgQoK2Dl8HCBhfLTHpdPINxwQZVWd/ZNk?=
 =?us-ascii?Q?iVj43TtZAkEoPnxxTon/fPrZ+FVc546Ql+yNmXX2sqcPQbcGZfEfSSzNJqjq?=
 =?us-ascii?Q?PISteuJ5cpa8I9yi63T4lPS5qROVhmecwT/8gRU5ujQQcccyDk+Mf7a5Gpfq?=
 =?us-ascii?Q?a+eL7I+UlbotMR5WIzSlVbLGcWX9m3ZL10LNWG9j9mvwQAYULDBDauolhIdn?=
 =?us-ascii?Q?xExYoAeCxgUnRkKPyCKp2d2Fn8xEu4sdxXPO4eaLZUieWj23Nu5+mgM58w2i?=
 =?us-ascii?Q?qtUd9nC+/4i8QRCtHmX1UruLjR38wFQmoGoaOr7hv39MlQFW8JTzOCv2mDMG?=
 =?us-ascii?Q?z6nnjaq9V4LBqSSqdRQi89EzwjfHqYJ5oYh6j1p6rZiBiyti9E4u0AgrCh8x?=
 =?us-ascii?Q?FUGQMXb5SXsV5tHJOcNzmzGOlEZRUmNJG8ntTQ+DDDqRjL9ETA+a0lrYMVNo?=
 =?us-ascii?Q?+2D6kAktxg+XXxLGAchb1YgA0KaqyZ+eb6Pq/cTMzlOPhA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z/pS5yQ3CxZ1MAsOTFziccKwdN7tMuwUgF1SM46CQo+iA6NE3GV4PYGYMwju?=
 =?us-ascii?Q?XY9YTC9IReJ9jJEWj2f+6cW8x8k9zhesRK3mgQmbIEfcGUhltFwp0H7z7m1K?=
 =?us-ascii?Q?YGoQVrzGeCcRE4luoWAuHrf7jVsxKhNenZRIGjycS2uKuGb7iMZ3x4G62eYh?=
 =?us-ascii?Q?R1dW+xEgaK1TXY+Pewv5ZzvQ83toc2WcgSiY29eEj5hhwrlU8jk2GEVD/gnn?=
 =?us-ascii?Q?sz4JappqSOFSNV9vYfDYNTJTH29D56gNNUN21Lt8Al5J8NylZgKI3YKfHq/x?=
 =?us-ascii?Q?SZSIYWWxCHkRFtXSQIR1ae7928Y3N856iGWFJKhLg3y5QpLhfTQkUWIuSecB?=
 =?us-ascii?Q?gY+YOSj3ZneaEvKCGoqfqYoH6VM82E7vCwfQmKjLl+ZKlNc69gFKix5VtcVg?=
 =?us-ascii?Q?AV7W2OVe60ti7wiuwTBx/W6G5bgcK2L//Nc20fgy8Tl2uWYyjxhFFX4KyJGR?=
 =?us-ascii?Q?KN+swhwdkA/6fKeFP04qJHknX1SPII0sjetYVuqZEv41dfqcDDGw/aNtiG7m?=
 =?us-ascii?Q?+HxCREBqJfB+IqeSh4ow08e2NNMLU77Ei61s27DEhSmka1c7BmMIovQwR+Qt?=
 =?us-ascii?Q?89+06yhs4wQ8avmmRgr1PH88eZvhDKpBiFjGNwahGVYxEdouAeNyFr2HhAb9?=
 =?us-ascii?Q?uGHu4KMBwuurffHm9zwslUkAN7zW0BIHrfcB/SUfeYHpRbyTr92RakvejSOo?=
 =?us-ascii?Q?Ctruc/hDrAgQjbihYAvmDtijfleiXHmTGU9v1iigBerkl/ZIfHWMy9ThYLIJ?=
 =?us-ascii?Q?q/Wcbh/QWffPw6VfkzI/8Mu35tz9+zPRmBUJ/4TWOV1cY/O/qLolur4T1kj9?=
 =?us-ascii?Q?YKHobnhZkWl284uwvEamLmrYcrc2R1RHHtbzvAN7st684S8owudcQ0nGOF7y?=
 =?us-ascii?Q?do7Jq+wGxFvoWzusGDRT0okEI0YMe6VIqPAwwOuZQ2uHenMsYeQemlv0kX1i?=
 =?us-ascii?Q?uOtKom6fccnMT4gsHeAoe7GnTumqWYPAr1ryDa3X81rgHFm0VjXVLMaOO7pa?=
 =?us-ascii?Q?LLIIYR619hK++0wuTKYu9YZWKW4NQ8UipOQxeiMzc8PNV0Kg9U6B/e/QXpre?=
 =?us-ascii?Q?cgwo5ccSx01AJIRbCG2H1AP8QMWYe0kAVuMK5AMGnTF4HLrcZp1o2v1vnuKi?=
 =?us-ascii?Q?I3x24N3Vsr/3x3lIdg7YVmDpHiCbtA6/U7kbCzgvpAFlQgmSN/lF3DfXNOCl?=
 =?us-ascii?Q?omqKb4mkZ5movWS/h8pDrUXf3qmv7kfgAsLtgAQIg87lE2y6PI6kjH1aoe43?=
 =?us-ascii?Q?hSewXOqi8KMAuNJ5YUTueKFUdJXl0pQae73O0XYjid52ASVDrBtEwJ7Z2OWQ?=
 =?us-ascii?Q?6PHErtyB+JrjyV9OIq+7Zlyzsen7vsvNr3jrsLFErBtz2oQj4osO2NonyaTP?=
 =?us-ascii?Q?Y6RxMiz3T5K4W00gdru9WtHJNVQ4nki01iClwT0IKfPk1kvwPOWHsNIoGHUV?=
 =?us-ascii?Q?uuyLX8LB960YPCDHV5BNtNUzwAIX0mRU2Z+6PaMmxEDQfUqJCtRvRj7Rwr52?=
 =?us-ascii?Q?7dhjzqnloxdG4rie+aOWW/noeM522W1lIetC6Pg7gWM3ChvCgoULKWCILyUd?=
 =?us-ascii?Q?VG20/AhwplahKieLbdGGyEU0MwTfVjX1H72K7F9Q49U/1OKDblCDC9ntW5Qq?=
 =?us-ascii?Q?vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0df0e979-458a-40c5-8e9d-08dccdf5dfca
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2024 21:58:28.6561 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9JORV9EN6WRc+LMN8gaz+K5/rVEPB7lrGNk4VsaBaIt9B+8AXbf0db3ZEr6nf6/fYr/JegI6J6rttz3DpV8h4we9mDFz8yZzawGGBl3F2D4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6926
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

On Tue, Sep 03, 2024 at 05:21:06PM GMT, Matt Roper wrote:
>Each GT should share the same register iomap as its parent tile.  Future
>patches will switch to access the iomap through the GT's mmio substruct
>rather than through the tile.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_pci.c | 4 ++++
> 1 file changed, 4 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index c05ca61787be..5b09a1cbd821 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -712,6 +712,8 @@ static int xe_info_init(struct xe_device *xe,
> 		gt->info.type = XE_GT_TYPE_MAIN;
> 		gt->info.has_indirect_ring_state = graphics_desc->has_indirect_ring_state;
> 		gt->info.engine_mask = graphics_desc->hw_engine_mask;
>+		gt->mmio.regs = tile->mmio.regs;
>+		gt->mmio.regs_length = tile->mmio.regs_length;
> 		if (MEDIA_VER(xe) < 13 && media_desc)
> 			gt->info.engine_mask |= media_desc->hw_engine_mask;
>
>@@ -730,6 +732,8 @@ static int xe_info_init(struct xe_device *xe,
> 		gt->info.type = XE_GT_TYPE_MEDIA;
> 		gt->info.has_indirect_ring_state = media_desc->has_indirect_ring_state;
> 		gt->info.engine_mask = media_desc->hw_engine_mask;
>+		gt->mmio.regs = tile->mmio.regs;
>+		gt->mmio.regs_length = tile->mmio.regs_length;
> 		gt->mmio.adj_offset = MEDIA_GT_GSI_OFFSET;
> 		gt->mmio.adj_limit = MEDIA_GT_GSI_LENGTH;
>
>-- 
>2.45.2
>

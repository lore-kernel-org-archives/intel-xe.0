Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A3FCCFA03
	for <intel-xe@archiver.kernel.org>; Mon,  3 Nov 2025 18:59:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 905FE10E21E;
	Mon,  3 Nov 2025 18:59:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UvUw3iwk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A5610E480
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Nov 2025 18:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762196342; x=1793732342;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8kSXbB+SGol3wryWTrVYKGJiM5PCyn9HKp/RTqgvYaw=;
 b=UvUw3iwk+hjlkEEbdSL/9mqKH4oPBW5V6d62oj2XHRGfxEck6adcfb+F
 DlqjbDkmg4X5Xp2DIsDetshUtefYQELJ6p4kw0RFrgiSUCcPO8VpBRm4i
 /B8o6ZOWkeOgoHWslrSfSuw43UPmFljmLMMsJeTBKD6jHSsdBEWwtm09k
 UqKhsj3O/6GwXIe/wZrP7xskR38+a/oes7JHL9jgo6BQ/7nq7SqFprIY3
 xRg7/YS/opXcJ56IsmbhaQSnGe+l3yqxi+3zEksKwzjQmmLXUp0qYyUnt
 pxrws4wRiEAQ+Lku0MxcGUorM7Lo7g1shWSpXdgj94brQOlgTY2OnRz7o A==;
X-CSE-ConnectionGUID: 84Nc0ZeaQYGzHnfWKunPHQ==
X-CSE-MsgGUID: YnAymBpcREedWDoj5+x4VQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="75730272"
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; d="scan'208";a="75730272"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 10:59:02 -0800
X-CSE-ConnectionGUID: 0XU1EGfMSzqAGx01yJ1JtQ==
X-CSE-MsgGUID: zU9mqjQoSrKwO9PKVh6qdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; d="scan'208";a="191266067"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 10:59:01 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 10:59:00 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 3 Nov 2025 10:59:00 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.2) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 10:59:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dbB8bosP4KtGrCcXa4LAfVHOubKzd6VgjJvsn6hD4aKuZhW+McwYYUkNcHOu8Cdu4smVL20LiXoSW51Mwp6JIh2yo4cuFTEEsGFGsZYXBILoRqHtGOSWnLWn22E4RONOLc1v3Fh9XjGPZj4nXIFJNLRiG8vIfrTgX0PeiTAKjTp37XYAmNzYcHPLLOVs5yV4sTcZubFdAlKsy/00zvHlZO4smJr6mS2gY0kOewPu53UosRPWtZxjuSBGsk2d8q9OwjtkQl8/Q5hGHG6Xdf6iS4b12jW47A6DnJYUYNmBRUWQm/kREj/0fDhDOjtlQEhlaW6a3SK3cSNHMtLca32Fyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pbsndN+MthhZeOoQ8L1pUWL5Rqvxa9z4ZMXSscn492U=;
 b=hdTjqqvb//f+AvInw1Bzu/WqZGWsuTK4ONOaYX6eIkIEgsot2feYVXmnC4MkBFWsTK2gwMOljAHG95rl919YuOzPzvsPY/0jzjM2ld0Zx1bDPckk2B9DicAYjsVuCa+T+Ww5c3nvM28rA357MhLSj4Gnk6EgiAlRdrjvrxdHUcnmlBoP6h2G2SIzGQFz7t8r20dmSB1l18otQU7jaJp7QXubYugHuQ2i5KAX0IB9ltl8bePYH6kWRALtvtel15eP8FUT7p9AqSKpXalDvco6rdqmpBkzOTe/Pv72HzgE7TyuOrdCcnLqZuNCL6v/DidIo/pJ2AUKp04TNHu21xPCIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB5095.namprd11.prod.outlook.com (2603:10b6:510:3b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 18:58:52 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9275.013; Mon, 3 Nov 2025
 18:58:51 +0000
Date: Mon, 3 Nov 2025 12:58:48 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v3 1/2] drm/xe/gt: Synchronize GT reset with device unbind
Message-ID: <xp7wdfskyxnruajgshsabvnpgf4xcgshomeyjs7oi32blritv4@xy43up22n4v4>
References: <20251103123144.3231829-4-balasubramani.vivekanandan@intel.com>
 <20251103123144.3231829-5-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251103123144.3231829-5-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: BY3PR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:a03:254::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB5095:EE_
X-MS-Office365-Filtering-Correlation-Id: ff7ed179-21fb-437e-166f-08de1b0b06f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Jz4jcPtk/NBZfObZxBjmjLGXIEc23ruViHqcr5rNaXu3ZeEXgWZ6n7FgOec2?=
 =?us-ascii?Q?Bpomk834o+oUdpWdS5sYnRnqJIL007AW2VwRaeFD4asQYzRRZPaM0kZA0xok?=
 =?us-ascii?Q?Cl/pxVXCzR3MHqUjl6GO84IHsm8eW/fj/tnW19fneWtJhGlIPQWB5CsVdu/9?=
 =?us-ascii?Q?EBLRTI06MCv1Eee5NlBkiVkoVmIGFsFrz3/eA8wN6Jje+CDk9w+LW/uRs4JY?=
 =?us-ascii?Q?OJ5Ea9fDQicGVpbOZHEGS6myIx0QmvRVZGltvKciXHF8elrwxttx0CpRJLbf?=
 =?us-ascii?Q?UBaCn9ndCg4vlW7csT0kGozQpz1URbjOCEl0j6R0h7Q96dAmMzFn82WbmR3F?=
 =?us-ascii?Q?m7ssR5Bv3yzXVWQzHfrYWxOXTiv3RHBd6cxz7c5wYsYBjWlfhhC3wsk+NkOV?=
 =?us-ascii?Q?PwTSRVlMZCCyDWJhpg76oB2C6zG/BLRUtsRTNUBTwfLVBqRHBV/oxT140E4I?=
 =?us-ascii?Q?2GfUHfjdMGwKJr4y3bLYszefdLvR2LRn1iwlFhlK9Sm3f0WaqhAACcJbvXim?=
 =?us-ascii?Q?P+TUmXY33zlFRVatWc5+61j/1KVi7/rnuLSjG48avAOukxZkkpPlb8cZJwwN?=
 =?us-ascii?Q?RYcxkpBwWGpqtGlzftj0yUMdMKgWfAjhQrnHXaBx+Sc8ZsiRtwIx/evxRCIn?=
 =?us-ascii?Q?jxraj0zsHnXYe8Tjp/2+cDgpqE1N8b0lz0kvandwqTm7t5+VVkBVgc7c4qyG?=
 =?us-ascii?Q?F30DolyI/OltNkGBjgd5wGJXn+8JSwY2MNc0HaEeYu3s+47VyrWMb1KAmgkm?=
 =?us-ascii?Q?Hq3KS8TKcOyi5kNNYyxfftmDF5+3FbccD+NiYstMkNlfru6UAjCe1HqW9eVp?=
 =?us-ascii?Q?sC3qydv7bh7B27HgV4HWHkJyREY0GcqZYB+WmrqRnl9n10LJSebftUgPtGRi?=
 =?us-ascii?Q?+VKC5ptJZIYDZhvzrJuewOKkt8fCqShMsG+YPCjOFHZM+Xsul/N6Sa+Dk8Dm?=
 =?us-ascii?Q?HW7IlSwZK+8NJMQM6OKDIOVoiGFSceVR8oo2N/vmbPuKK3uxpRePg12WoLx9?=
 =?us-ascii?Q?2rjVETL+f5+7VOVYdyszrDx/JAZq4HesxNr5q2U/Oui7NckXZvHBXHjniKPF?=
 =?us-ascii?Q?3ZLr0g5wnnzyoDRA0Z5llp5acmnXiHEmvpyzoWg/UGoKPnhWjetBqxnm4/Lj?=
 =?us-ascii?Q?Sqj5NC+TgAaxX9oXja3YPsi5XneDg0Slg23wtuVtgZnv7HGVlVgNcJ5A/nER?=
 =?us-ascii?Q?vh+ptqN2DXQAdQu7uI7EE1bPfKfrQHanDcHKK/lnzqi6U03Wzz1cfVFUMYQS?=
 =?us-ascii?Q?80SghiYh5wH2RdGcJftr5O24yuDkDkHPDNIgS36mTfrGkdDHvPoN/ZjaJ8ix?=
 =?us-ascii?Q?S/mAFS9/Y4vQvj25lO6NNSioJ08IY41ceEEOF7JTl2xpTI7uG/woKf8s4Bvb?=
 =?us-ascii?Q?awlybnPKsGSYjOhGaf2xZ65EAVWYBwUL6BqgePXflV5YgVYLfzFhGay0cCxS?=
 =?us-ascii?Q?46NQbqdzEUPuiKGn+lpjMK9Zu9FsEQ+H?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vhIlwRe/Zj9sxzvjsUGaunaXWvAQzsWsTdM9SoIzBCcyXyXLc/tnloAZLiLQ?=
 =?us-ascii?Q?jUwpZM+mPGTHSqNMQG5Yj4KrZY9J3Qv3lQxchk7or95sgx7ze5arI0fkfyUw?=
 =?us-ascii?Q?qc7WjGx4a9ODDa+MZXT9ng9Rl9Bw2sKcqEwbzelzABX7kWkE7ArxspTlHMmr?=
 =?us-ascii?Q?yvt2sze7LW22FitKtkCTAIZsn/91J9gY8dPAWPAccm2rrDkRc0t4+7doQQKi?=
 =?us-ascii?Q?RBCGdQZjL3WNHJ23Xvl0WWiyemjqKtJunS974MJzMWOEeMl0VRceEnM77CJY?=
 =?us-ascii?Q?DHSW6UawysgkcPGbfEKTa+YtFUYdBuHUYA9cYRVxH7rKq8tXyt2SaBAQt78M?=
 =?us-ascii?Q?y9nOQBRXyAVoXn9/4WzGrn2f39XGPIynczujsywWPhllM3i/gIzMA1LIuDWK?=
 =?us-ascii?Q?j6J4KdyzIFFyAB3NFCAPEu4Z8UwZWrIIj+IBkPnWHiOYQ+ELfmy+wVqBEAL+?=
 =?us-ascii?Q?tDLvZ8vcRyH8Qc9q2Ht2pNEApNtb0MjTJWOmftUzxnhTzdWNgy01YcowSdOD?=
 =?us-ascii?Q?zfkr1XZeZJ6dCVxqUzIPvfM+0ncPHkoVh7VB3dSgJuEc/trOA+2eyS20jV2z?=
 =?us-ascii?Q?iaIb6ohXrqvZs55hQWx70k43Kq1Zc9TD5RFdUVayF0WLtN2SvZ1f38zbEyr8?=
 =?us-ascii?Q?gAU/6k8qwHGdkq2PK5wowVkgpHOrJyD2Yp2LvKSRQDf9ZWAEOBvXBb+IFAKI?=
 =?us-ascii?Q?x9Xcj9GvZIabjVxuEtPaudObhMPRsfEAc8Kn0K6l+UVuol8WsXcRHFBYS3wg?=
 =?us-ascii?Q?+dwgvqPXowvqUNtcUyJobsZCKdIR/058vfi/FY0HZL7/jHrTPIpogCJM6NCx?=
 =?us-ascii?Q?ZjmQ8yesREhMFOxKUwt2mxqhXqp5RgSFqd+hitUFwuAbxA+unYyffinyDenB?=
 =?us-ascii?Q?A+k6+9uv17gEaxAy5pRfcQcOFqxv5Uvs3lm/4Vk/jla4B2z/Le/vaL453AVs?=
 =?us-ascii?Q?Wxkko7icYz6Rs1dYNX2rV0TZ9w1VmbizDAlMumjgXXLq8MA6CFQR7KNpD7mR?=
 =?us-ascii?Q?xdiC+9+yqzTHogJ+lL+4qXkHgIcXIcf5wP+niEUlgFmzA/L6E7bLuRqwqJ4N?=
 =?us-ascii?Q?Ovj2fgY0DclM3gRKmAPqckf0ZcHlaaPA5SxVw42LyoG3WHe7rQlBWZgtWJCR?=
 =?us-ascii?Q?bnjOphtNnjWLTvrVg3ekheQZtXuls21+U/tHzNAudf+BErJUObWgU5sfKdeV?=
 =?us-ascii?Q?qSJuUemcdb+GwbvYTpPkxddDL/XPL5IJ2KnYNV5t7ZtAw+TsHuEnYdwC+u0J?=
 =?us-ascii?Q?4LvR7Q+W/DlAzj/0sKkVe1BFjoUHzC/aFuVJp26TQnmL26B8cslz895iWHhZ?=
 =?us-ascii?Q?4AVb0aSjuamJAlclAD9cytfnZqSrQw2tvf8E+kZMWMm8fDP6bl3SOMkFM2zk?=
 =?us-ascii?Q?ITdI7aGqovZ+kqQyvR/u3orGhz7HzPPKjvkg13BgwptXXSc0hEhbewBWVJEg?=
 =?us-ascii?Q?NVOlmqqiW8d1MZGEJbl+7usK18jczDaIKA3cCGyEVRBfjDMMZuIGnr+rMQSY?=
 =?us-ascii?Q?R8kOsaXcefAZiTvQWQxrGTdpTqryJCFe1tH5Kc3z9J8KwMt3AUF6XqL5sqeo?=
 =?us-ascii?Q?WnGnudI4RFq/rsclHFsx4uKQbec3hrR3VP1AGpKBm5jw9cS5IgSnJRpcOLRH?=
 =?us-ascii?Q?fQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ff7ed179-21fb-437e-166f-08de1b0b06f1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 18:58:51.0554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TKDIODZ1pBOikb2LoXpTQ6wX3i2eL9Mov/AS6xcSU+6dEDrohse4RTYzcf4GIxWZA1TRHRQu+8cWP3cI1usLeUCGgRHMbGloNMqubBLrdBg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5095
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

On Mon, Nov 03, 2025 at 06:01:46PM +0530, Balasubramani Vivekanandan wrote:
>When unbinding wait for any GT reset in progress to complete. Unbinding
>will release the mmio mapping but mmio operations are performed during
>GT reset causing Kernel panic.
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Matthew Brost <matthew.brost@intel.com>
>Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>---
>v2:
> - Use the managed resource release function to wait for GT reset during
>   unbind. (Lucas)
>v3:
>- Release the reference to the rpm if gt_reset_worker is stopped from
>  execution. (Lucas)

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_gt.c | 7 +++++++
> 1 file changed, 7 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index 60bac65c8b9d..e008e3c1bf68 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -607,6 +607,13 @@ static void xe_gt_fini(void *arg)
> 	struct xe_gt *gt = arg;
> 	int i;
>
>+	if (disable_work_sync(&gt->reset.worker))
>+		/*
>+		 * If gt_reset_worker was halted from executing, take care of
>+		 * releasing the rpm reference here.
>+		 */
>+		xe_pm_runtime_put(gt_to_xe(gt));
>+
> 	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
> 		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
>
>-- 
>2.43.0
>

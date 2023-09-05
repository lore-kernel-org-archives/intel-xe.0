Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC44CA0FE2
	for <intel-xe@archiver.kernel.org>; Tue,  5 Sep 2023 17:21:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31D6810E286;
	Tue,  5 Sep 2023 17:21:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 959A710E286
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Sep 2023 17:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693934475; x=1725470475;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=c/ZqSy9S8VocSPBC7fXNm5jncAOCNwiQv0T9+FKwvcM=;
 b=LzDkokjlgWVotVXBIwPKR3A5pkWLyM1ypiDvVr6eJmd5eoc8FyN1fmER
 YErhy6KGWJ+h8x0CYGSfVw+U3ObAe1y1ZjqlQ8oSh+l4saJMH8Lf+iNil
 K8yzYjoj+aQBboBMWohgHyg6QZEigoJbTACMOu1raSIScDUNZR3iHmZOP
 wB74Jjz00RFdx+oaPUon5mOxlTF4cLI+G1gGL7MWwHNHUxFw+2lkjBbNK
 jyrShC/oaI1LYKT2LQFbsWMW4szBCGVDz4+GwLpxwBSUrJpjI157WNko7
 WkD6/K9vHkzu2cDbFnnxvAP+9DC9ZFyNb2kj+Yt1GxQ2IaSemx+fmfSjY Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="407848145"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="407848145"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 10:20:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="987920526"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="987920526"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Sep 2023 10:20:39 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 5 Sep 2023 10:20:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 5 Sep 2023 10:20:39 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 5 Sep 2023 10:20:39 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 5 Sep 2023 10:20:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IOzCQ7m3pHO5GLcWgSlgU74YbwWQ+Mk7evs+Kxp4sgzvXEGxliOYXyyKR4V4cmM5B4T5v5RWuOX3R447QL+HVCfTnbbvjHdeupwkxqqyrkloCa3ymBcIAtBSt0V4+uT054uNBAXkGkbDvNCiePTsdz6ytsfoTYNezFYQ6is8Xp0wSwBEKedPBQ7ISfmqgmrWkOHYsrQVaasxsH3cRxJ8mE6uZ7MrgO3QKGhRwgIYBtW/NLW94vRPC8GykKqHJsiCAOCBGSl3JPmKZbfLG/FPoC2xy/XTracWyhNNVOUm15ZjGDOva8V4Bo7weZ/+OyAvtTXqmSFxLuvRaikQIc2qYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BS1ZXgAcRvhUQ45VQ1dDNX57PWNHZS/mPc3j2telY3E=;
 b=kkz2NWmU+YSeHiHR6Al7jNfSZXGoO9/FpkoX6aO3Iti6KfVg6I1SM/RNzt416DyfMK8VFaF31P4d0eMFMVNOZrdLf7B3gflXZLTBLPJn+MGeG88BpeLGxrvjIT4K0Thq2gR76V0Db9owAcWjW6qnI6K9qEfowq7vnp0lu39Mjq1l739EaCuxI5GOYi/3D+sm/JMD9V1kzORJnZbotLs2/GYgBtwAWBmysfAx1owNg+WjydTnNfp+mLddRZh3rm2tfgvc69g92Jo4lTTH+DAVcXYFyXcmnMwtGvokcXWeP+QCbSchX2FzXv2GkAsBHRz1X2q2ly4jICNdlSPbgS41Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SJ0PR11MB7156.namprd11.prod.outlook.com (2603:10b6:a03:48d::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6745.30; Tue, 5 Sep 2023 17:20:37 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 17:20:37 +0000
Date: Tue, 5 Sep 2023 10:20:34 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230905172032.GC2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230905143144.1706967-1-lucas.demarchi@intel.com>
 <20230905143144.1706967-3-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230905143144.1706967-3-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR07CA0010.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::23) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SJ0PR11MB7156:EE_
X-MS-Office365-Filtering-Correlation-Id: b339a716-57a3-4bb2-936f-08dbae346bad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NEYxZTJxg12KM7/NpU129DxR5elM5zHkdy2eagGtsMPMn4+c/vfmSSje/rrqOlEKwBhiWX007nFofPdfZw1zMnORFzivvlxq/ucLuGC8bo689ID3geY3DYhkY9qYDy/geiC58cAr9z94suj0r6kl1EQ1azw6b9SCk2TtSFlRucGQpSXH1cuCnR0vJEdXxyO6SPX2QTOlQE+nPbuXYdQK56PiFDzvpkvXsBMGFM0Kj57qHTCTGgzYy7VaCDosjLctE1DSnBNI1AYsC1Lx3IyK5mazd8g/3YfFGeA9qhLaKPncf5wR0xjq9RtezDPzSvo8On0JPs8N1s2mvxtky8o7AYbZ61Gi6HnD6b3gBVp4xUWz7H/h3Oxydh8hL/Zcahe9dgv8Wld0PSJ8xMHsXd6SL32VNr8QC6rAI4GaTdEhEJKCeh4neknpFOhtO+zCUDZa0Hj5m/yWc5K6TPu/l5Ya/Fj7hkRgfVtZV/LvRqCKnjxvaCFEB8Wu2dlo7sLT11hHSiDELoG1DGGHZMSIvLdf+KtxL4tfceFpLouu2NSb7RUBa8I947uB4yLTcoFQ+36u
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(376002)(136003)(346002)(396003)(186009)(1800799009)(451199024)(6666004)(6512007)(6486002)(6506007)(83380400001)(478600001)(107886003)(26005)(2906002)(15650500001)(8936002)(316002)(66556008)(6636002)(66476007)(66946007)(1076003)(6862004)(4326008)(8676002)(5660300002)(41300700001)(82960400001)(38100700002)(33656002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N/1y5fQTzFanNc6u7++2zUzW9t8/CmDEQp45Bo7EBgqfv3+zJhpwvgbHgaKs?=
 =?us-ascii?Q?EzUIiXS9wQxdJFO4llLxEbwr63rDZAAx38Bo9dcbQj3XBWkUb45OkoYF2gv3?=
 =?us-ascii?Q?9eALMvtU6MQf2y2AyVbTuXMVHNnO5RCeNZ1G1ZKz0j2RMnggcW32OM9poKo+?=
 =?us-ascii?Q?0/Xx7TmnBd85jcQgiaoBpJdb/mX8xugiXfHqHzx4CKSgsq45okqbxLNx9iJD?=
 =?us-ascii?Q?NB74HBnC/QElOgcGgSKFTnbjtUSsXUMfLFJh0VJgJxaio4kSdUpWkDszcCma?=
 =?us-ascii?Q?MYJArBSdH6N5R6pXyc10czIeTBcBjO14Wi1LaMHw5LKhxOJspkQscK2dHzPU?=
 =?us-ascii?Q?1opf75X/eN9Nki4fG6Pr4Z5/Xg7uyIGkwxI56o7GqAYvwC+GLy5WiiMb42cn?=
 =?us-ascii?Q?Nt50R/6Paro5h8mLSYjsRi3fmA+2DVh+vG2XJSBS5d+pd6JJd9tCXa47nt/K?=
 =?us-ascii?Q?ZN+VUf4kX62RmP3G14p1k4czCAo7vuZDk3hULqg+DQwtKvKus9ilxN4AVx6z?=
 =?us-ascii?Q?NtVDCljFxSG+4/PbdbJNdKwRywdB/s58xzgfzy0+p5GyVK8KelCWcqTd8lLd?=
 =?us-ascii?Q?Iqce7/17lVrifA6jM1uY2HvDfRqsoFmMB6O32f6PEuCChAP3Slyo+1gbvQIt?=
 =?us-ascii?Q?sOjCzhf+tqAL+Rvf0Foh0nKZmH5fRIqhE2lwDxpm/Yk2xMlMIs+u5DOBYyA6?=
 =?us-ascii?Q?GENW+w2ctr1pO1+m3vlnBZq2Ldscxb2XV9k7NYNadQiw/oEe3Wr0fFlyCfuU?=
 =?us-ascii?Q?U/2TuERa7qhTH/Twa/IxgoDg7mH9jpqxHufXRsz+4hGHhASYauY0iFsuMfE0?=
 =?us-ascii?Q?p+sbEtYtDMxIGW4FIc9oBOhdUOSBXyt2vizaVsZHffNgchls3Ybvtzotd3lU?=
 =?us-ascii?Q?iEcdhbdgrxpWk1zyW09Ck9tAXJsfdvfHlZkPYAVsj2gTXxfIPFj7/jUd8Zy+?=
 =?us-ascii?Q?DNnJryojttTBpdPKw/qqYLApKlpeWchfVQfeKzT+77XCUl+mkW1aa3WEzZo9?=
 =?us-ascii?Q?U2dNlPlm+fbOkqad0R/2PbopssR0sey3u1aICsVVAbye2O4qhZ4zlghMg8F/?=
 =?us-ascii?Q?x06waTndFoswb9X2iLLsp7zWn3a2oAsHWadETKuvdSaHxTb6EQU9Gi6QRulg?=
 =?us-ascii?Q?PjSvfCMFPSn9TRHJaWVDZLFiVKjowHMPVhMOetoE86W4UZFVBQ7igqXjfhTD?=
 =?us-ascii?Q?Eh7Gm0I/O9Gdq8b4Kb/QewdbQ0J+eKHkIy3WRmpQUMVqlvBW/U67fzfNZYNi?=
 =?us-ascii?Q?7iuQptEspXJ75E9m/hn6FGUpDNwP5T9fYpSC27+sTh0fF2NsiSw5KL6K0xtY?=
 =?us-ascii?Q?iGWwPHz68AB6skx3sqva0hpcxoRw51xYC6wHCtuLNdXEDFBLh53rRhl1C0FR?=
 =?us-ascii?Q?vefIbFKTTJhZ+BAD9gP8Cqs9UH4+Fyj8LZfzWDMdFooA7QbFPHkKLSHr9WWE?=
 =?us-ascii?Q?IpMw23Ks4nxGwoC9vxsCC9eWtiCniBpkTHn0Fh7+G2iwwRwhPqWP/mimQhDX?=
 =?us-ascii?Q?nTQ1x6KDqJiDQxd4pCcEBTN0mT091g7+aumBmHpGMgDa71VtuXxUP4VCa7AX?=
 =?us-ascii?Q?2n40LSIThrbG1qTwTdhnktyVMdkW/4AYTEPbO1BR208x9TF293AqfqM0kGgK?=
 =?us-ascii?Q?pg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b339a716-57a3-4bb2-936f-08dbae346bad
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 17:20:37.2422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hv2/CfXPOoylmBZJc/Ue7DNcBzL+2a0tvKo5b9ybcg7AUdefjjdIRK3BT4KPCgpjGM5DgQU8LMIqjEmE8hVM/2u2CGBT+aKFlQSIUHwG4Kw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7156
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe: Add dbg messages for LRC WAs
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

On Tue, Sep 05, 2023 at 07:31:43AM -0700, Lucas De Marchi wrote:
> Just like the GT and engine workarounds, add debug message with the
> final value being written to the register for easy debugging.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Matches the existing output style of xe_reg_sr_apply_mmio /
apply_one_mmio.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 3d6a7c11bac1..bd307770a620 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -116,6 +116,7 @@ static int emit_nop_job(struct xe_gt *gt, struct xe_exec_queue *q)
>  
>  static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
>  {
> +	struct xe_device *xe = gt_to_xe(gt);
>  	struct xe_reg_sr *sr = &q->hwe->reg_lrc;
>  	struct xe_reg_sr_entry *entry;
>  	unsigned long reg;
> @@ -133,10 +134,14 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
>  		++count;
>  
>  	if (count) {
> +		drm_dbg(&xe->drm, "LRC WA %s save-restore MMIOs\n", sr->name);
> +
>  		bb->cs[bb->len++] = MI_LOAD_REGISTER_IMM(count);
>  		xa_for_each(&sr->xa, reg, entry) {
>  			bb->cs[bb->len++] = reg;
>  			bb->cs[bb->len++] = entry->set_bits;
> +			drm_dbg(&xe->drm, "REG[0x%lx] = 0x%08x", reg,
> +				entry->set_bits);
>  		}
>  	}
>  
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

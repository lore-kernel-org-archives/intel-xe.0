Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41004CA0FFA
	for <intel-xe@archiver.kernel.org>; Tue,  5 Sep 2023 18:02:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEDE210E195;
	Tue,  5 Sep 2023 18:02:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8A3710E195
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Sep 2023 18:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693936943; x=1725472943;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XP8/6ct3Fu32n9R7RG0E66/E2WH/SVG67T9+ZkwvGxQ=;
 b=S6G/b6kH3/4xBMW3T8C/JJuKulfWYEX9MSRGBJibTvcAOmYQYyHG5YdO
 guRxq1mosaUIUkGKsZ66HaDmyo3+koV8Qlo6eN7FQPnIZDB+/Z+BlhDSi
 9GMv4zj/HRZsF3gjiGErY5zPo44rbbrM0bwUlmvvJqYpsK1kEAztfJIlS
 S9Y+qVKlPxJQA9bAWUH+aRR/ZiC/qrnWg8VlF4191HAymhXUc/Rl4yXfR
 hHU/rs0qKscw08HdlHwLMh4Yl/EBJpOy64jpvbQvakYXr8t8ODcfNgZHW
 RzymWrQVxc5hOKPX4V7s5w5Qtpc7QziYgkFnxCCctZyMbXemXgSB89xiK Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="356355295"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="356355295"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 11:02:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="864842053"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="864842053"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Sep 2023 11:01:59 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 5 Sep 2023 11:01:58 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 5 Sep 2023 11:01:57 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 5 Sep 2023 11:01:57 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 5 Sep 2023 11:01:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FHlT2kXUseGCp6CnPzUCB7llZNHHPEaGjtOmJcxOf488oxbgV0VfdzTpzX2qzsQ19LHsk4nxyAee5l2IluGeCJVEK9VW6F/YZVM7PqXLMpNwKle1cUTl31ziwpf/VVniRWS0r9so7al5YWxcBXRaxzucCSU1b8lMIHQ4ttw8J9L4mRr9ECgzdeaYUYbHQvshPcz1Sa77ovFw1qJzVGg/enI2/WLjLApw+bBRLhqIEAKWT5mlSEmZGwx2sSGQrHqOFfjZDxDeHvfyJxEGbFCSPkoYoEobwfrfneNVot8eNRBnWn2cRtrquOwrqAlbq6vptN+c+E+Dz/dYpczd6h3SlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tJimCJx7975vx1lZeJtZJ/oQ3sUBGVH6nFLf45EwUf8=;
 b=Uq7S6gpOZ4IvaW4h+9BudbfBzVMgV/KyyF5eVRLVvDCJEgIHh4bsxY6jFU5/fbtJzWvBbMNdVU4/cMCHcF/Z61qL8ohzGSwynapWwjfZjYxoW5pWKL2if3wqxuO7DLYNpfH/DoI2GqNuuDvh5qAao3FtsixE0EwwLTI9MxKwiDA/nfKt4phKeHkH/WsD++mTwaZkZtIQb76gIys9FwhdC1H4GNwkxiKUBnJ0o0zuLcMbS10mcLZPoY0Yd852ge6kDKyoItR/FJgvsesIZeyuzY+b+Qw0LCF1QhzSI3sEMXFJcb9DcqzEX7AevqU65l8iMH4oxuuZjGk/19e7XDqjNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CY5PR11MB6258.namprd11.prod.outlook.com (2603:10b6:930:25::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6745.33; Tue, 5 Sep 2023 18:01:53 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 18:01:53 +0000
Date: Tue, 5 Sep 2023 11:01:51 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230905180151.GD2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230905143144.1706967-1-lucas.demarchi@intel.com>
 <20230905143144.1706967-4-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230905143144.1706967-4-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR21CA0009.namprd21.prod.outlook.com
 (2603:10b6:a03:114::19) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CY5PR11MB6258:EE_
X-MS-Office365-Filtering-Correlation-Id: d31dfd50-1306-4e83-448f-08dbae3a2fc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xDPphc3aH5Wv6CIa/AWH/4UpEjOwxtMpvInhI+lxdWx7k8NcXCsgPyIAMkK/pIvaLu+tVrNLQX4cVH0k0kgYkNsf4xSWaWZ0VmSpLseBMP1WMnLJJIDdKRs/3KCpOTsNhQ5p98c/rev5grB71uTHroZGosLXsj7ouFOID0MYSIusR5NPMqrGounuGjdZJVgBxErC5UjmnUrv1u4yTz1fbNzOIUqlAlU78I1YthExD3RSoD4zuYMZyKMjdjIj3xbMKNEQpy29Vefw22JBhfiL0vIK3M914wje03oCGWnQCkJbLAQd6dqT+2DQYzsozWo0WI4kdwi6ZDEXqzfMoan1jdUJ//ylA8VAesRXhlea79k3bxOwjsNDrtMnO9TBLor0qT9BAev12a9YtV6T8LUGTC3ikdNQLVw1zzF8n8ls9KkfBGlphJ7IS4iNb6Y1ofB8t8V2LhxcL4WF5/Rvzx0jzKQktV1AUNUx8df7yGbWcwfT29+F4Vq5RPqXVjrSS6RzbiTkIuuWPMPLEVrBT25vo5hh7adEz2YqFap68up7udgy2aTY5psqJPCfdaGS6jms
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(136003)(366004)(396003)(346002)(186009)(1800799009)(451199024)(26005)(2906002)(33656002)(83380400001)(8676002)(66899024)(8936002)(107886003)(6512007)(6486002)(6506007)(1076003)(86362001)(82960400001)(5660300002)(478600001)(38100700002)(4326008)(6862004)(6636002)(316002)(66946007)(66556008)(66476007)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0q4QvMQvTfsiUUqveutE+LjW/l5lQCTg3j79Y/BNsPjUcNiXaMpBmehq1eY8?=
 =?us-ascii?Q?FbmAnVE+IjrTv4KAP/L/oM12d2kp+icyhMtfgBuuuwlwJaOrhOhAXLH5XyC2?=
 =?us-ascii?Q?o4EjXxmPKz5PQ0dHF9vQhPBarft3ctaOBcZVjRsLP6I8KXLRIh8JdssnfbYf?=
 =?us-ascii?Q?LIVjK8WK7hq8BCGWr5O1mJewXvD8fzkCEZNRUyCPsLbKp9k+HL1liNOo/7e8?=
 =?us-ascii?Q?E+tCZzJ9HsS4JLborYLWdbl45/3DVOuBbQAP5rKXQEartX8TwFtPi1ZOTsze?=
 =?us-ascii?Q?8Uc6Z2opp3hZ1zTh3upEaD+EmXKBgSgwvqurspUdgPuc4nxB1NJyP8yoVf4J?=
 =?us-ascii?Q?pK3Mt/uadNkR7SUG333CIuWuRr08EUNpMP0r5bLf9F7thveigzdqbx8YzZik?=
 =?us-ascii?Q?isGUWuy5yzep5yvHHJ6WD5wgu1bVBoZKJF0KyhBKs04y1OJojs+F3K87d20r?=
 =?us-ascii?Q?pAMS2y96QcFQ5nxC2cAW28n1dJVVwoCLm8ZFYpb4IGaJZ5OKFQ/XgdaoGgwG?=
 =?us-ascii?Q?2WRJAeJ6yB388TJ04iL3Gfj9g/cI9tGeshz5OBrzlIyApHcDqr/9XAGSPTnh?=
 =?us-ascii?Q?mIBhc7mhqv5U271qerYXko9P6Al81ZfUUCJpN+MeD6N1Ngd+xUBXlYmcxFLr?=
 =?us-ascii?Q?dXsp2Jqi9AJi8QJNpLBdjU3lpGYBlfO/OO6AyKTbk3BbS7vmVyY1Cee5H7DO?=
 =?us-ascii?Q?CJT3VlUQiHkdGEIWgUu5JtwQ7qR+HLAbuxM6/0KOOEtP40QgAkofoeVbQC4K?=
 =?us-ascii?Q?s/Y9KgOepLa/fqyyLc5+oQtccl4CvOa4x66CDnht6qZECJkvxOyyAUHaNEKL?=
 =?us-ascii?Q?vlsABmB2dUPj5y5J35L/mwqmB+oS1iXBS5bJIsivDLy2bJNKCcau3tA1Kf8G?=
 =?us-ascii?Q?lig7C9Yq3yTO/KyNpPeJz9DT6o4YnTRVwFFMGUmGq5mTYKpPA+tVZQp3/OuH?=
 =?us-ascii?Q?B8bjSyENnlx92wNmUGL2kkuhrpwZLjfWVfx5wgJvRldQ8K3tiGR7Xy7MQWW0?=
 =?us-ascii?Q?XTed5ihwmEYbesNH7B2Jg1vjSo9s6X+jUQunD/8I2oKavddVpUEoZlZpgdBf?=
 =?us-ascii?Q?itUtvDw1gNSyaVCY7eA0PrT6Eh2uj6WCAjsR7eehcsaTwQjcLO0uVrPzUm96?=
 =?us-ascii?Q?8Q6TYuSktAVjn6mXk0eS840x5lkaa0KwYrdUtL0rmZYVBv04s6TiwmFjRFSw?=
 =?us-ascii?Q?rKU6emt3gnTwM0WQiMKzkbsXVhYxt3C2qWZ1gz2sOkdJQOnumnLFW7G3DsFH?=
 =?us-ascii?Q?TD+meFXj8a9T73M2q3fJokGe/OCO4Mo1JdNSdD/y0LO6LGtW+ZwI9+c7IxgM?=
 =?us-ascii?Q?l6Vy4IbDXpcfkXPEsWJA1GVYWIn+xycfNIOL5v0R83R0GoPWpbwzVEvoamae?=
 =?us-ascii?Q?DMRxocJHqYyUfZaTDFKmd7WCdiaL9t2dOiHjo/fJdbJJnW3IqfgETe2VJKdO?=
 =?us-ascii?Q?3jni69hf1WRrKyWQPj9AhblANNMJ1ETWTCqKxhvsTuAKTD1yUkjScEf1/6Pg?=
 =?us-ascii?Q?zZfDt/pxBk2sAxPPatobdJuEvDmw0SFAj7e1YFOGBcYdxUziOQ5/ySwYNYEQ?=
 =?us-ascii?Q?e4Yddq6W4+obkO3EFmJLhzVNA7e6W4+SKqDFVpNAsrPr9wfURSE+no/IHAad?=
 =?us-ascii?Q?Fg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d31dfd50-1306-4e83-448f-08dbae3a2fc2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 18:01:53.7356 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xjMKzyQjsWGfxPAJx6vs3awOdgf51cqeY7K+1UYuSicC5I+KkS2RbCW2FJVQcQo48sLWv1DjRQVuLDQfQ39sNrE9FzaeBpgjKifUrb3VOTc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6258
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/3] drm/xe: Fix LRC workarounds
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

On Tue, Sep 05, 2023 at 07:31:44AM -0700, Lucas De Marchi wrote:
> Fix 2 issues when writing LRC workarounds by copying the same handling
> done when processing other RTP entries:
> 
> For masked registers, it was not correctly setting the upper 16bits.
> Differently than i915, the entry itself doesn't set the upper bits
> for masked registers: this is done when applying them. Testing on ADL-P:
> 
> Before:
> 	[drm:xe_gt_record_default_lrcs [xe]] LRC WA rcs0 save-restore MMIOs
> 	[drm:xe_gt_record_default_lrcs [xe]] REG[0x2580] = 0x00000002
> 	...
> 	[drm:xe_gt_record_default_lrcs [xe]] REG[0x7018] = 0x00002000
> 	[drm:xe_gt_record_default_lrcs [xe]] REG[0x7300] = 0x00000040
> 	[drm:xe_gt_record_default_lrcs [xe]] REG[0x7304] = 0x00000200
> 
> After:
> 	[drm:xe_gt_record_default_lrcs [xe]] LRC WA rcs0 save-restore MMIOs
> 	[drm:xe_gt_record_default_lrcs [xe]] REG[0x2580] = 0x00060002
> 	...
> 	[drm:xe_gt_record_default_lrcs [xe]] REG[0x7018] = 0x20002000
> 	[drm:xe_gt_record_default_lrcs [xe]] REG[0x7300] = 0x00400040
> 	[drm:xe_gt_record_default_lrcs [xe]] REG[0x7304] = 0x02000200
> 
> All of these registers are masked registers, so writing to them without
> the relevant bits in the upper 16b doesn't have any effect.
> 
> Also, this adds support to regular registers; previously it was assumed
> that LRC entries would only contain masked registers. However this is
> not true. 0x6604 is not a masked register, but used in workarounds for
> e.g.  ADL-P. See commit 28cf243a341a ("drm/i915/gt: Fix context
> workarounds with non-masked regs"). In the same test with ADL-P as
> above:
> 
> Before:
> 	[drm:xe_gt_record_default_lrcs [xe]] REG[0x6604] = 0xe0000000
> After:
> 	[drm:xe_gt_record_default_lrcs [xe]] REG[0x6604] = 0xe0efef6f
> 
> As can be seen, now it will read what was in the register rather than
> completely overwrite the other bits.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c | 42 +++++++++++++++++++++++++++++++-------
>  1 file changed, 35 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index bd307770a620..6dd3cb5d8246 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -114,12 +114,21 @@ static int emit_nop_job(struct xe_gt *gt, struct xe_exec_queue *q)
>  	return 0;
>  }
>  
> +/*
> + * Convert back from encoded value to type-safe, only to be used when reg.mcr
> + * is true
> + */
> +static struct xe_reg_mcr to_xe_reg_mcr(const struct xe_reg reg)
> +{
> +	return (const struct xe_reg_mcr){.__reg.raw = reg.raw };
> +}
> +
>  static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  	struct xe_reg_sr *sr = &q->hwe->reg_lrc;
>  	struct xe_reg_sr_entry *entry;
> -	unsigned long reg;
> +	unsigned long idx;
>  	struct xe_sched_job *job;
>  	struct xe_bb *bb;
>  	struct dma_fence *fence;
> @@ -130,18 +139,37 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
>  	if (IS_ERR(bb))
>  		return PTR_ERR(bb);
>  
> -	xa_for_each(&sr->xa, reg, entry)
> +	xa_for_each(&sr->xa, idx, entry)
>  		++count;
>  
>  	if (count) {
>  		drm_dbg(&xe->drm, "LRC WA %s save-restore MMIOs\n", sr->name);
>  
>  		bb->cs[bb->len++] = MI_LOAD_REGISTER_IMM(count);
> -		xa_for_each(&sr->xa, reg, entry) {
> -			bb->cs[bb->len++] = reg;
> -			bb->cs[bb->len++] = entry->set_bits;
> -			drm_dbg(&xe->drm, "REG[0x%lx] = 0x%08x", reg,
> -				entry->set_bits);
> +
> +		xa_for_each(&sr->xa, idx, entry) {
> +			struct xe_reg reg = entry->reg;
> +			struct xe_reg_mcr reg_mcr = to_xe_reg_mcr(reg);
> +			u32 val;
> +
> +			bb->cs[bb->len++] = reg.addr;
> +
> +			/*
> +			 * Skip reading the register if it's not really needed
> +			 */
> +			if (reg.masked)
> +				val = entry->clr_bits << 16;
> +			else if (entry->clr_bits + 1)
> +				val = (reg.mcr ?
> +				       xe_gt_mcr_unicast_read_any(gt, reg_mcr) :
> +				       xe_mmio_read32(gt, reg)) & (~entry->clr_bits);

I'm a little bit worried about whether this will continue to work in the
long term.  There are definitely some registers out there that we can't
read properly from the CPU.  Maybe none of our current LRC workarounds
target such registers, but they do exist (I have a vague memory of
hitting this on some old pre-production PVC LRC workarounds I think).
We can probably go with this CPU read for now, but maybe we should leave
a comment here that we might need to switch to a GPU-based approach at
some point in the future if we run into CPU inaccessible registers.

If we wind up needing to change the approach down the road, I think
there are probably a handful of possible approaches:

 * Save the default_lrc without applying the LRC workarounds initially.
   Read the in-memory contents of the LRC to find the original register
   value.  Then submit the LRC batch and re-save the LRC with the
   workarounds applied.
 * Submit a preliminary batchbuffer with MI_SRM instructions to save the
   hw-default register values to a hwsp location that we can then pick
   up and use when crafting the MI_LRI batch.  Or update in memory and
   use MI_LRM instead.
 * Use MI_MATH to perform the desired bitwise operations on register
   bits directly.

Anyway, we can deal with that later if/when it becomes necessary.  For
now,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


Matt

> +			else
> +				val = 0;
> +
> +			val |= entry->set_bits;
> +			bb->cs[bb->len++] = val;
> +
> +			drm_dbg(&xe->drm, "REG[0x%x] = 0x%08x", reg.addr, val);
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

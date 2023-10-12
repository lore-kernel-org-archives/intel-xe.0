Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4252CDB474
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 23:04:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 907DE10E57F;
	Thu, 12 Oct 2023 23:04:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9151C10E575
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 23:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697151867; x=1728687867;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dZEWZG2Lmd21EHT0Fj1aIzHExJooTaS++Nf1vnyCNSw=;
 b=h+LNXHN/uw/lV50aHlom6nP4DOjJF5Rg/GNhnGVJQDfrcP8Au9FhnVDl
 uayw7Q71JstdiDAJuGQb7FY4xd1wZimAzGmpKSCPe+URBExkwnGOpWS+T
 SS1/EEskjyxgD3Tghc2xWKPLitQr/abc1Q39vEQcB8jaRbnnrsgnegjJ8
 gQLjou7laeuMmAXqoNsCLIJ0vjzjwepKsGhqwYJwHrwhwBKXQbSi3qT7h
 ldbc0ITVLD/v5kQaBTdyz6eu50OgS6HgiRLDZb6Lg6P0FP3ZCEX0b+KYi
 63DZh11Wowhf+29mH6LRrqRaNHuCf7coQYelCFP6dSWLBNC83Hh6ZHVv0 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="388924014"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="388924014"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 16:04:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="898318927"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="898318927"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Oct 2023 16:02:37 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 12 Oct 2023 16:04:26 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 12 Oct 2023 16:04:25 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 12 Oct 2023 16:04:25 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 12 Oct 2023 16:04:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qyg8eCPTSyeRQW6E6SH+8T4om6iq/SpNwLt1ws9dxokwqhbwfwuKEIztfMA8xoHm/JTp23eGqeEQKtUnHY3UTIRsHUTc+tm/5QF5z3fKq+t9a0T/ILFnFnJevDvd/GiDcfXVRW0S20c26vsEWF2AH3001dbYDvS6Ybe9FKBBXWUoQsKzXWdpuRb/nTvYxK/OmO8ebeyWNGyAt0ismcPzvLgQi4uFgFv/KzzihBeXGt8fRxnHIX4ueLC3HpWzStzJNQCeGB0icMk7DkLqcvAPCb8v2pBPteNGov9ExzMY7tP7muiEXFAwkp01WnMxafmUb49nJ3K+ODr8MHGcucVtCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eIeEdkG0Fn1564AdtMJGZjUjyWntlxwOJrnM6hLAwXY=;
 b=NjecmUW7nlsTlAy966bQz+K+kTfX90p6Oxoga7Iw9QTSbcDqrpgMp/spR2ADOdWEWe/LIq/9hKuA3arXXCm6DI50ki+yoAmRlT/UojCkCpBn4LVwxc4Oi3lIDovIAceTwprwV7k2f5TnawS1cqgnyOXNchTs9vxEgtdO4Gan6db/kd4KVAbR1dQUKRF3wQ3eFd9lHVwueWvCLB/kLgjAuSSzbMVOmJKt0deWxA9aSw2X9t/HWOi+Rsk6EU8S0R3zdPE6L6gmAJYS4R/bEj1slwlp0Op0WFrcVsuRyG8idrMMVqJ1tCRxj6KXcEcXSNKnkpOPtfkzLxRZNmNTVMZXkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SJ0PR11MB6814.namprd11.prod.outlook.com (2603:10b6:a03:483::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.36; Thu, 12 Oct
 2023 23:04:23 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f957:c15a:9c34:71db]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f957:c15a:9c34:71db%3]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 23:04:23 +0000
Date: Thu, 12 Oct 2023 16:04:20 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20231012230420.GN5757@mdroper-desk1.amr.corp.intel.com>
References: <20231011230957.463381-8-matthew.d.roper@intel.com>
 <20231011230957.463381-10-matthew.d.roper@intel.com>
 <pyuuzeqdal4ynnudiz5thlssext67qaxuxz7fu2ho6fi2y3li4@mw6lo2vdr4pz>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <pyuuzeqdal4ynnudiz5thlssext67qaxuxz7fu2ho6fi2y3li4@mw6lo2vdr4pz>
X-ClientProxiedBy: BYAPR07CA0020.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::33) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SJ0PR11MB6814:EE_
X-MS-Office365-Filtering-Correlation-Id: 22bcb4f0-2824-4843-fc47-08dbcb7792e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p2Q7t1J57hog+a2NZ9rDocsZBX4VfjTMXHULXIKRJRMYdeVpyuA1ZtQWL4U/5ZsHgyAOzYn1INu1YoYQ4UAJ+BzLzIXUiqXlkipQ2AbWIWdFstnXx1ianehB2dgQ08IRfezfOLceSZ1TNS0ClcUg0fSy3kSO0HpEsjNm0MXW36+2zK4poedjeKeEjDXD9GZScqyMHxhBUAQjgaqpzDBVYk7nvTz6H5Wfzv1l7m7ntwZb1fx/mTpj2enReUYSzQ10eBnpvab9qnrkBgGyOz/gvVJLf0m5Pdz+fVubCNtll2E6D5Mh8FcW539v2DvDkE/Kxt+Y5SmWkoNazy2lJ/qDmXSL3j0trFZlhGqyTWXOzfHdz/B3mbRwLhx/aX2tLbttagFP31XtLX1wYBUWA1hgi1EKIdfXZSYYA6CZPaSO56pWV9GLuZCKZtStYKxU3NW0ZH/MCEflzyu0Rq+8i3ewy+WO6P+4/6f4CcoZ77f7BLqSQ2fxgccj4Gd3cNgGiX5UHpSbQx7Wb7rRrm3fmGvHUfZZdPPWQOumbzGSVJE96i+xOiVc0n5XV77W2LxW1kTJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(376002)(136003)(39860400002)(346002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(26005)(1076003)(8676002)(5660300002)(8936002)(83380400001)(6862004)(478600001)(6506007)(66476007)(6486002)(4326008)(2906002)(66556008)(66946007)(41300700001)(6636002)(316002)(82960400001)(86362001)(38100700002)(33656002)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9naCf+AkXqVp8ZEyVm5DNkcVZ+JQ6AgCgLDcB0QDdSEafouI5dmKoIXZ9r2I?=
 =?us-ascii?Q?YHOawLncVLXczHv7ClpOp/4sdqje0NKlvwC6NC3jl7CCIT+CoHW6w2X3wnS6?=
 =?us-ascii?Q?xI0HoCMqIGPu54TOGV6j5SEcI55y6AMdZCpAD9KZrw5L/SnvCka9okPR1soV?=
 =?us-ascii?Q?Hgxu/Z5dwXW8TAs7glNu2kdnZ29SnKWF4KtUIb8kVI+GWFp8hiIuG1eeCW4g?=
 =?us-ascii?Q?+5nDqTAg1UQZr29e/FpD3vf6UDAAW9lgXY6MJfZuo+b/On1NYPCha5q1HG2i?=
 =?us-ascii?Q?cVrdMiKFkz8uCxP4wsNcFbXmZz+mKN3yJLVhJ2Hm9AbR3FXlJ8RYRLHOKQWR?=
 =?us-ascii?Q?GMsIJz/PdCjLtpyqSIYfpqoPL0hXkI3QSk+0DBRI7nX1Ncp6WybyQ4w+b0uZ?=
 =?us-ascii?Q?Q+2gfoULtdroUVmUOhjmprq/q4fZItmiPI9Jft3L3MahpQmqlePcIc/rQ8P/?=
 =?us-ascii?Q?MVL8CUrPv+TqhjnIuDyF9/gmS1A3UYh+/m69+osSeDBqwlFhMtFo7etGGZ6X?=
 =?us-ascii?Q?kPgcQiCb94qgS3Ap9YdugppTh3jwnDXaxB2r8dyHy/UsRM+Y2Vyh0hbR0Al+?=
 =?us-ascii?Q?vIgdEbE4sMj8y1I2qPAJnmjlGUou0hByQXYyQAWwrjGJ2ZdvBcDXfSGPLMb7?=
 =?us-ascii?Q?GsmanjvgoP9cGHM0EuXF0z/PP6JY8iLjHf8ni1T56iYBn3fmZcI1R3x4qI1S?=
 =?us-ascii?Q?nHB0TTT7dsf/O+C6Ricn/nyNtjczQc2lBxSORPIBrBn7FJegGd6GHUlIeNYb?=
 =?us-ascii?Q?mza5VQGhmQzph202OqsveEmr947bHBuC1NX43ip0Y5RHeGLHW5A5n1P5DKqe?=
 =?us-ascii?Q?aDfVBZwJx02vr+jqMh26LlDxBtOyqsZy3tMWizbM11uCOrkhJD/kov9VaYAF?=
 =?us-ascii?Q?tvn+WOTNj6t1NRByWzNhJ7eW5djPn0OBxLIoKGBoXMm8DMbbtVrdrrjIn72+?=
 =?us-ascii?Q?xX2+eLNVdlhWYL+acysfPfj2syjPOh5mKtApZYhn+QvMQ0+bgCFmseRRPZYv?=
 =?us-ascii?Q?iEL52kZOky1XNCe/pZUEXwCvJhs4XUKjavtffdf/nAOtWXNAg/VG4Zru+qis?=
 =?us-ascii?Q?09unrcb9/8O/s5n6PVqDICFLuQ4+pCWXZb2LHu71AU7/IMs5BZDTQe6rFI83?=
 =?us-ascii?Q?pMYYuQ4rhvAkOR93Rx70rCtW3mUT1x9/Cx8owKh8uBGHHcKeQBsCP+GLxCjl?=
 =?us-ascii?Q?y3pme1bhBwp9ag0QNFwoZm+K7LRbeIxx4Y1t2w/uhj2XytZQ0njT2tKry9sH?=
 =?us-ascii?Q?/LpG+ROYiG06iIGHUtsLBboUrSU74j2zhCoDuT6JeYNuzOkfnlLYa118rFI6?=
 =?us-ascii?Q?RxZuC+woR5YPySQ7P9F9Xs39GlCaDF8mreB+scUvrPz0J2M5QAIgItRMhDCA?=
 =?us-ascii?Q?vZVNAFuZRQyadcNExJ8Kffhk61IeBHeXqf26P/UU1NUcunuThbIfuO+2oZ/p?=
 =?us-ascii?Q?NtRNHsHRWQAmA3xXjx696OUB2f8QN8GT6Mr4rZMC1ARA09E0sX1In28TR8j1?=
 =?us-ascii?Q?AnHRVPv6LS8/GWsx8t7/laT2Xl+lP1zcLmX5dU6Zx0oOH5B3sSc4z6Mr+KG3?=
 =?us-ascii?Q?uffkB5QrU+6zbNlejGGqRiIBiL9wTbD/pdMfHrq4zgZ21cqN7eoIbGDU+Dwi?=
 =?us-ascii?Q?lA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 22bcb4f0-2824-4843-fc47-08dbcb7792e1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 23:04:22.9898 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n6WfEMBNLerYJYKXGrj4NF3ZuByMzr9yCgbtd+rL6JnYDBhDLdz2dIjOIoebMllZZSfXdk75pLOqekNmm0SzABBnxsqW0heDcwfpP01FPto=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6814
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/6] drm/xe: Separate number of registers
 from MI_LRI opcode
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

On Thu, Oct 12, 2023 at 03:55:41PM -0500, Lucas De Marchi wrote:
> On Wed, Oct 11, 2023 at 04:10:00PM -0700, Matt Roper wrote:
> > Keeping the number of registers to be loaded as a separate macro from
> > the instruction opcode will simplify some upcoming LRC parsing code.
> > 
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> > drivers/gpu/drm/xe/regs/xe_gpu_commands.h | 4 +++-
> > drivers/gpu/drm/xe/xe_gt.c                | 2 +-
> > drivers/gpu/drm/xe/xe_lrc.c               | 2 +-
> > drivers/gpu/drm/xe/xe_ring_ops.c          | 2 +-
> > 4 files changed, 6 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> > index 9432a960346b..ad1e5466671b 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> > @@ -25,9 +25,11 @@
> > #define MI_BATCH_BUFFER_END	MI_INSTR(0x0a, 0)
> > #define MI_STORE_DATA_IMM	MI_INSTR(0x20, 0)
> > 
> > -#define MI_LOAD_REGISTER_IMM(x)	MI_INSTR(0x22, 2*(x)-1)
> > +#define MI_LOAD_REGISTER_IMM	MI_INSTR(0x22, 0)
> 
> since we are going to have a churn in the codebase due to this, maybe
> it's worth going ahead and doing a s/LOAD_REGISTER_IMMEDIATE/LRI/ so all
> the macros follow the same pattern?

You mean so that the instruction macro matches the field macro names?  I
thought about that before but was uncertain whether it was worth
switching the instruction macro names away from the official name given
in the bspec.  If we do that for LOAD_REGISTER_IMM, we should probably
do the same for all of the various LOAD and STORE instructions for
consistency (although I guess MI_STORE_DATA_IMM is the only one we use
at the moment).  I don't have a strong feeling either way; what do you
think?


Matt

> 
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> Lucas De Marchi
> 
> > #define   MI_LRI_LRM_CS_MMIO		REG_BIT(19)
> > #define   MI_LRI_MMIO_REMAP_EN		REG_BIT(17)
> > +#define   MI_LRI_LENGTH			GENMASK(5, 0)
> > +#define   MI_LRI_NUM_REGS(x)		REG_FIELD_PREP(MI_LRI_LENGTH, 2 * (x) - 1)
> > #define   MI_LRI_FORCE_POSTED		(1<<12)
> > 
> > #define MI_FLUSH_DW		MI_INSTR(0x26, 0)
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index c63e2e4750b1..a42ee3b9b8c7 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -145,7 +145,7 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
> > 	if (count) {
> > 		xe_gt_dbg(gt, "LRC WA %s save-restore batch\n", sr->name);
> > 
> > -		bb->cs[bb->len++] = MI_LOAD_REGISTER_IMM(count);
> > +		bb->cs[bb->len++] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(count);
> > 
> > 		xa_for_each(&sr->xa, idx, entry) {
> > 			struct xe_reg reg = entry->reg;
> > diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> > index 35ae6e531d8a..81463bd5e490 100644
> > --- a/drivers/gpu/drm/xe/xe_lrc.c
> > +++ b/drivers/gpu/drm/xe/xe_lrc.c
> > @@ -111,7 +111,7 @@ static void set_offsets(u32 *regs,
> > 		flags = *data >> 6;
> > 		data++;
> > 
> > -		*regs = MI_LOAD_REGISTER_IMM(count);
> > +		*regs = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(count);
> > 		if (flags & POSTED)
> > 			*regs |= MI_LRI_FORCE_POSTED;
> > 		*regs |= MI_LRI_LRM_CS_MMIO;
> > diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> > index b95cc7713ff9..1e36b07d3e01 100644
> > --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> > +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> > @@ -50,7 +50,7 @@ static u32 preparser_disable(bool state)
> > static int emit_aux_table_inv(struct xe_gt *gt, struct xe_reg reg,
> > 			      u32 *dw, int i)
> > {
> > -	dw[i++] = MI_LOAD_REGISTER_IMM(1) | MI_LRI_MMIO_REMAP_EN;
> > +	dw[i++] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1) | MI_LRI_MMIO_REMAP_EN;
> > 	dw[i++] = reg.addr + gt->mmio.adj_offset;
> > 	dw[i++] = AUX_INV;
> > 	dw[i++] = MI_NOOP;
> > -- 
> > 2.41.0
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

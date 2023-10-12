Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A9ECDB47E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 19:50:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD3D810E550;
	Thu, 12 Oct 2023 19:50:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1CA910E54E
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 19:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697140256; x=1728676256;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vAE3PxihvReAYe6+TAH5PMLEEoekm6B2fYN7Wt4QPA0=;
 b=ly2TXGvJ3jHckv2un2C+GY4hsJmvR8BDGiwvs05rxhBz74jWac7gScTI
 7KFwvIo0/0IGTEq/7w6DIAsrRbmGV6GMPEdTWwfisCRReCa4Vrh5MJXQ7
 q0g17/9khjEgxsOA+ALSmtBjifjzkV2guy7Dwo+Ia3cLPeSpTPLad0Dor
 g6Q1jR3TO67BygCKmggVS/tKxq1VtEenymmDfMumBLoemPcGzVLl1UCsd
 UYKR2UG1H5HMe00usArxyPvwy7twlYzkDiKIbsf8WwJnT747IeMgXDX89
 Bod9P2rJvSsIQN5NXWvCS8/TzVWjC3RdXH9mR2FUYgFz0R8ZLAAgvsiNq g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="387875932"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="387875932"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 12:50:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="878221199"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="878221199"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Oct 2023 12:50:56 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 12 Oct 2023 12:50:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 12 Oct 2023 12:50:55 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 12 Oct 2023 12:50:55 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 12 Oct 2023 12:50:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MDPuCu0EPatcBCJOWpMjerSGUhUSY4SvktB3Hp+KoAWJFw0k5WsEN17F1MN/f6msiHL2a+zfnWCqKqwLk0Tnfdj/0k6CrG+ZP40pxsuAtomfu+E88AvuZEDgIRiIN93ihwxT1zlPQDxS+1f4zkK15tOdYisQRo36gz4xasYxjDHeDWdfT4G+WMgD7HvYD95VKspMUTdOPJmcCB0j2xP5Oceuo5yA1PcgHz1dFB+QMNkBaPIuaKgAHEqKf3vHwvl106+TTN9hUPfccavEUKQJiYrtyy3aYLreKNnDhd8czsM95KHGck6NL04qXLqohk1bDA4BFw7hAHynbZzOuJVE7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FUtyo+7ATP36Z/yApzp9izqhhDY4SkLlzKsND1kjuVA=;
 b=Eehn6kfzcQbrQZxIo1ti26DX75yedtTr7WDEn4Y1dYcvkL9E5HJILz/FSw0G2SV/TLoym4DfsUNCKrD8C00L5Ov9jZKNoQXe26Ru9DPY8CqkO4e0XV/XabtczzPvr6ngh/PmW8JoRakOHV6Mbiq64a7bXAOUnjUqHmPdUdtQZ6Cu0tnPGbmKXqW6EXfstf/nMocfevwoqnqwCmRIvkz7hmaDh0dE7p5x6xmpcLX3mxhd83/tL4ngAiDFMVfl9TZShSV/yUCNMwUJ2YZGKQs5SG+qt7vys8kEqtwx6qev+ctFakf03t1Nsg3RXzNO7uWB4o7nZOo8ZwPgVxtewpBWNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by CYYPR11MB8357.namprd11.prod.outlook.com (2603:10b6:930:c5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.44; Thu, 12 Oct
 2023 19:50:02 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::cf65:94e6:cdd3:cfe]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::cf65:94e6:cdd3:cfe%7]) with mapi id 15.20.6863.032; Thu, 12 Oct 2023
 19:50:02 +0000
Date: Thu, 12 Oct 2023 14:49:58 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <a723bsv6tcebsikgh7ylefrhgsypvrccy2yyhirb7jg3mc3sng@qxwl3lwumjg5>
References: <20231011230957.463381-8-matthew.d.roper@intel.com>
 <20231011230957.463381-9-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231011230957.463381-9-matthew.d.roper@intel.com>
X-ClientProxiedBy: BYAPR11CA0037.namprd11.prod.outlook.com
 (2603:10b6:a03:80::14) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|CYYPR11MB8357:EE_
X-MS-Office365-Filtering-Correlation-Id: c758ce28-3b34-48c5-1e1e-08dbcb5c6c6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vxx/W8LAY5AAbKMLur9zaaucPn0g8DuqM8Z1QeygJUDP8ia1Yy8d9qLBh0qsxIXQMxzhMU/lRfv4fT+gTFZz8zd30wkbNoHMjtUjkbFegPLNv1C2hq27s2H4xDrZJwmGojRIPKCstCDcyG/2EjErneAGuEE0QMKaON9u2sRTdVcyUxAAJXilWgY5CaY+qrcVwFYLQJZOU7OojQLOonZjP3ny/4lg+q3bW7m0c3mu66EfVw/u/XpBGXpoRtjLIbeAYqDjZSGH5F/fizXeEQkD7sYcDSMp3y5146PZmjy+Hl/YrdUBzdKE9lxvMAzXP5Wvh8pS6lXC/Bjh2vAyBVCP0EKgLW8wPuiQ+lnoSCjWi1uzA51mounhuaF26mfwAjDlfSU5SGDGoP1Y1+5uTSzJDaJ5EleD1MJ61eKLpsqHqnFE9SDpjE7ToQazoUY+GaCcmu+mCBpJQ6AiGUFoSLc5aRahd8BRmPfnjLHrec32+7WGVA3mF64vh9y8pk9MQqCSMRwhbRt63r3ZKMxa7hC1hDIknkl2VugLthdRqFf0Ja74sEN6bd+ffb4pBnKVnLCB+j8SQJE8GAKKzkkmGiMO/ooWsl9GwL7jEalsSNimkaHcUCOX/lDAdski6J5YpADDjP2TqeiV8FV5MmLanmiUJA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(376002)(136003)(346002)(39860400002)(396003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(6512007)(6862004)(9686003)(478600001)(6486002)(86362001)(14773004)(33716001)(6506007)(6666004)(8936002)(4326008)(38100700002)(5660300002)(8676002)(66476007)(82960400001)(41300700001)(6636002)(66556008)(316002)(2906002)(66946007)(26005)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QyiATgeJDBc8ibPc5bhSHIaw1ag3RLEmiVHZl140us1YQOMjQa6s+coN55il?=
 =?us-ascii?Q?jGbRQ//kKqEIhFH/72rdyKDmd3mgQecU4nkizszMGxtpSh7cJdQRZLpoJ7bG?=
 =?us-ascii?Q?p9JytOCAncCr0p8Ckwnx56NHJQDvsl9O60g9zW+9UPWHfTsNBTfI5euiL4jG?=
 =?us-ascii?Q?FRvT4CcrPgg0vnuDm2p3aav/yYH62MvYUqF6bXyLLgR9Q1vYKBSa1rH0yFAF?=
 =?us-ascii?Q?gabBkFfKSwik9fl33XaEr3vUCA0r3e1YWn7aZb0INnlcMeHNkP7k1otr8PSs?=
 =?us-ascii?Q?r3qeuqY68947Ch1Srxiokx5esZL4ri/yGv0cUp+YAaDBtsmxBkAdesxvjU6t?=
 =?us-ascii?Q?x2/OEAgxEtsLq02I4tzRYbsOtqWNOrh3wmd6sWdukaT3jJhoNbb8MSunUpCJ?=
 =?us-ascii?Q?phqEnLV4eGnadsYAxzdzE0EUXOhIHkSkQcE5tRMLcbfFNeT+2hmUEtvf3IKq?=
 =?us-ascii?Q?h1SEdrZcnoo31YlAw4wcSf2JC20q3o6DHOW2SyjWLfp3KXN6z/fLNuwmbfq4?=
 =?us-ascii?Q?8tZGX2iw14Sd8IjYj3t9JaihLOiOfltt/+bEpIUYdH+5yo6DAoN8GHYePbk0?=
 =?us-ascii?Q?BOfbkRy7eQFhm35T5t43wjnHo42emUTp1/+uH3slTB/08PyVj1Xh2+gDX+mB?=
 =?us-ascii?Q?8nhQCCJm+Te2e3pI0NjI8HkX/zmI8gLCKSBVeUB3Sr5JcxinN9A2kDTo8H4/?=
 =?us-ascii?Q?F2wDyl6NhOGoVsPkmZPuqwlX7eP7F52m6vJF2XwyUyX+HVPNaRjUzBOAdeYn?=
 =?us-ascii?Q?S7KE2u3EwLQnYNd0gYoIieyHYzFP6KlZZrh3yHgQW+1CaK6220subFGGtgoP?=
 =?us-ascii?Q?lRFtN7lMK+Zh7qnhYWTWRcyzfTAbnhpAI8ojZX2FMFA1BJ+H7x9CZ1M6B2LI?=
 =?us-ascii?Q?0ldeTffwnf0civI65jcao6sea4o2T0rDk9aNPYCxFgET3G0uDLDCiHVAMdkR?=
 =?us-ascii?Q?Lk+fx8qFyzC/2twbZyjbYSZfH8kL/UFdIN+CzXIfe34ED1Fetaoc4V90mmxR?=
 =?us-ascii?Q?aCtwlk0igYDkb6actm86PjTwrp3rwpF2gZiCnU90mVCE25UO+SbH9UqEvRL7?=
 =?us-ascii?Q?jHMG13ipYMIApoHcm2vccA5EE7onkoncD5Z1wLdKYnbEmzLC5UE3eLmoT5/d?=
 =?us-ascii?Q?RbrpJ1AhFI5mgIlKJeKDw9VA5QMFZOKUJYOewa+feGc6DLrn5+oTRYTbejFb?=
 =?us-ascii?Q?wm9WbYPuBQ/fEH635v4RP+J+Lge9kSVf/kL0N/s9T7Kmzl7qIfL6/Tis8sN8?=
 =?us-ascii?Q?dO/ov2091+1tY8rZpT99Athzgt/OHnjUAyYhgN89aWLl4BHtjbwrAfi5TXJU?=
 =?us-ascii?Q?UU3O7DItuXzvRVkZ1I8FpEWwmpAKBmCT7SrN47i/7tvG1N7qb41cNlAXsTVD?=
 =?us-ascii?Q?65iURKEBLCJ2pSgy44DtK5RNGJENiXj79rJiB6kpLTuzeM6y8tie5JrBmVDO?=
 =?us-ascii?Q?rh7tqg8Rvxl5pJX1K8hepD7g7Xw34yMvNraXGndV+Sev09zualqeE1ZfbGGc?=
 =?us-ascii?Q?Ibq5qLQ9ltY8DStei+oTYT2gi0cXBTTLt+VYQZ4QuAKGrSjaWsf3C/eT57Ky?=
 =?us-ascii?Q?1hTykauinnzwnovNP/O6SFNZ4uyprh0CCELbyYxpYuTHFgOBR3syOW34erCz?=
 =?us-ascii?Q?qQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c758ce28-3b34-48c5-1e1e-08dbcb5c6c6c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 19:50:02.4452 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +YvgSQBPZWjyp1Sg6cyqf8VOHWoZqg24eP/GS11+PDQnRoUtwwr2hr3rLmGi0iHQAyuUSPeaYZh6GGfmchwAPNOAYrbtjm9exPHvVKGgBM4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8357
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/6] drm/xe: Make MI_FLUSH_DW immediate size
 more explicit
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

On Wed, Oct 11, 2023 at 04:09:59PM -0700, Matt Roper wrote:
>Despite its name, MI_FLUSH_DW instruction can write an immediate value
>of either dword size or qword size, depending on the 'length' field of
>the instruction.  Since "length" excludes the first two dwords of the
>instruction, a value of 2 in the length field implies a dword write and
>a value of 3 implies a qword write.  Even in cases where the flush
>instruction's post-sync operation is set to "no write" we're still
>expected to size the overall instruction as if we were doing a dword or
>qword write (i.e., a length of 1 shouldn't be used on modern platforms).
>
>Rather than baking a size of "1" into the #define and then adding
>another unexplained "+ 1" at all the spots where the definition gets
>used, lets just create MI_FLUSH_IMM_DW and MI_FLUSH_IMM_QW definitions
>that should be OR'd into the instruction header to make it more explicit
>what behavior we're requesting.
>
>Bspec: 60229
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/regs/xe_gpu_commands.h |  5 ++++-
> drivers/gpu/drm/xe/xe_ring_ops.c          | 10 +++++-----
> 2 files changed, 9 insertions(+), 6 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>index 21738281bdd0..9432a960346b 100644
>--- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>+++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>@@ -30,12 +30,15 @@
> #define   MI_LRI_MMIO_REMAP_EN		REG_BIT(17)
> #define   MI_LRI_FORCE_POSTED		(1<<12)
>
>-#define MI_FLUSH_DW		MI_INSTR(0x26, 1)
>+#define MI_FLUSH_DW		MI_INSTR(0x26, 0)
> #define   MI_FLUSH_DW_STORE_INDEX	(1<<21)
> #define   MI_INVALIDATE_TLB		(1<<18)
> #define   MI_FLUSH_DW_CCS		(1<<16)
> #define   MI_FLUSH_DW_OP_STOREDW	(1<<14)
> #define   MI_FLUSH_DW_USE_GTT		(1<<2)
>+#define   MI_FLUSH_LENGTH		GENMASK(5, 0)
>+#define   MI_FLUSH_IMM_DW		REG_FIELD_PREP(MI_FLUSH_LENGTH, 2)
>+#define   MI_FLUSH_IMM_QW		REG_FIELD_PREP(MI_FLUSH_LENGTH, 3)
>
> #define MI_BATCH_BUFFER_START		MI_INSTR(0x31, 1)
>
>diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
>index 6eec7c7e4bc5..b95cc7713ff9 100644
>--- a/drivers/gpu/drm/xe/xe_ring_ops.c
>+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
>@@ -80,7 +80,7 @@ static int emit_store_imm_ggtt(u32 addr, u32 value, u32 *dw, int i)
> static int emit_flush_imm_ggtt(u32 addr, u32 value, bool invalidate_tlb,
> 			       u32 *dw, int i)
> {
>-	dw[i++] = (MI_FLUSH_DW + 1) | MI_FLUSH_DW_OP_STOREDW |
>+	dw[i++] = MI_FLUSH_DW | MI_FLUSH_DW_OP_STOREDW | MI_FLUSH_IMM_DW |
> 		(invalidate_tlb ? MI_INVALIDATE_TLB : 0);
> 	dw[i++] = addr | MI_FLUSH_DW_USE_GTT;
> 	dw[i++] = 0;
>@@ -100,9 +100,9 @@ static int emit_bb_start(u64 batch_addr, u32 ppgtt_flag, u32 *dw, int i)
>
> static int emit_flush_invalidate(u32 flag, u32 *dw, int i)
> {
>-	dw[i] = MI_FLUSH_DW + 1;
>+	dw[i] = MI_FLUSH_DW;
> 	dw[i] |= flag;
>-	dw[i++] |= MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
>+	dw[i++] |= MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW | MI_FLUSH_IMM_DW |

I don't understand the logic/convention you used to add the MI_FLUSH_IMM_DW here
rather than a couple lines above or as the last item to account for the
bit position.

Anyway, it seems correct.


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

> 		MI_FLUSH_DW_STORE_INDEX;
>
> 	dw[i++] = LRC_PPHWSP_SCRATCH_ADDR | MI_FLUSH_DW_USE_GTT;
>@@ -365,8 +365,8 @@ static void emit_migration_job_gen12(struct xe_sched_job *job,
>
> 	i = emit_bb_start(job->batch_addr[1], BIT(8), dw, i);
>
>-	dw[i++] = (MI_FLUSH_DW | MI_INVALIDATE_TLB | job->migrate_flush_flags |
>-		   MI_FLUSH_DW_OP_STOREDW) + 1;
>+	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | job->migrate_flush_flags |
>+		MI_FLUSH_DW_OP_STOREDW | MI_FLUSH_IMM_DW;
> 	dw[i++] = xe_lrc_seqno_ggtt_addr(lrc) | MI_FLUSH_DW_USE_GTT;
> 	dw[i++] = 0;
> 	dw[i++] = seqno; /* value */
>-- 
>2.41.0
>

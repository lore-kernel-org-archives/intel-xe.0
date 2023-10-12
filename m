Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2627CCDB47E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 21:03:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D026010E552;
	Thu, 12 Oct 2023 21:03:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DFCD10E552
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 21:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697144630; x=1728680630;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=29i6DkYa1SuHIce0OHlWkK3VlsXKFX2LnGo4esYtuKc=;
 b=LGnIm/RrnzdhrdIk15dPhumHlueqMgz/dU5Ekjod8uagaZjPhsN66J1w
 5KRTxNmjjmGVYYAuqnTwqxxRLieN0Iz3TjwQsda/iOb80IvX384s+pQ7f
 1oVgOv1aWDnPzhc882stk2tH4PuTQeuv/jcQEOQGrRSjkU2kuyMeB3zkB
 J6C9f5n0qyiRPMCIxxcnoD410nVPDJ1xDWUyd9X4sHNEurdwkGATWOOUq
 Xtk8mlqL5hjcuV2X4jacSHeW7EdbvYjcvapP3y5x2Y/iIT73hTrF1ulN3
 ObRemwncQDC3yyVuBkZWW4GAUZ8nUntN7I3mwEXKOxrAtT7ijtOrSeHI+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="365297649"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="365297649"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 14:02:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="878239093"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="878239093"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Oct 2023 14:02:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 12 Oct 2023 14:02:05 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 12 Oct 2023 14:02:05 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 12 Oct 2023 14:02:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BTSX0elFwYfMtL1Ieay/Oke8pGTn0zBGhu33+ocaDkr/WgZZ9esDfV/ni7u7dWyGYgRdf1wkGojKf/0NDNdTql/uHxqxmU18gYaEaHjpg8oQaLqbo/8GMMXCJ/umzbYwRoJCz8/gXADJipzA/FbuIq7+qY5CpEZXsFv+kMW/IpDbRTkMMxxACGEfpzbpnzud7b3DWF+bkaxjEBmU2wWOI1qVOGTrFYAJRiFzQ5pHrwtzO74I9/AFSlldDP8/mAAR+tpnRsr5gfBgTJzp7wRkEk1DpVXMt73wbNxQYd+5uC+hKWOeHyMcjojF6OH89a6pzalQ3DtH0qqw/P8Nj9c2xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+csYiZWonqWqP094jJUQnPaeJrhTbbxoDYhN41v9t9k=;
 b=KhwzhReYUbKaQ82y4L79fVMHu9BC6SXiBH6Fyg7DFRbFLes2YKpkW42AncWsR0vQ44499FxI/2LEAcPZbSH2UjuewnTWBUr+pWCLidFCbJ1Saotfch+YD7NSm3HQ+jUhnd1Nm1RB2QtnoEmzUWR+potWVnhJjZJZSfxY4ycaRFg3JawOXlN82b6d2K9Yq3Kp+Udl1sYFbHGKgZfI22iPjEm2tIf88l1YVMze/HifRYxJSKhW/UT2KmExR79mBOjTBduFUbOmUGIdIG06Esigc2nbgyZ0B0ILFjOa2AwliN2sR9aKVEt7m2pcZvfBBKEodG/T+eFWjWz8IsuNOz8hJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by IA1PR11MB6492.namprd11.prod.outlook.com (2603:10b6:208:3a4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.36; Thu, 12 Oct
 2023 21:02:03 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::cf65:94e6:cdd3:cfe]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::cf65:94e6:cdd3:cfe%7]) with mapi id 15.20.6863.032; Thu, 12 Oct 2023
 21:02:03 +0000
Date: Thu, 12 Oct 2023 16:01:59 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <zrlhupycvn5pt6skv6rrvgtlmt6aywwc2k2b572r476hrpey4i@csmtqc5dp7x5>
References: <20231011230957.463381-8-matthew.d.roper@intel.com>
 <20231011230957.463381-11-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231011230957.463381-11-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR13CA0215.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::10) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|IA1PR11MB6492:EE_
X-MS-Office365-Filtering-Correlation-Id: dbeae2f0-c1d8-452f-03f4-08dbcb667b94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ctok05ZAx3SK5zedYiC1UJPEtVa+Jrb9DnqhQUjPlOA4xNUXHfl+c04z0we2AWVCiZzSvbhhMFEzoon0daCFnLHCpskw6GZnxgpv8t0bK3PfLkuWgS/OeMI194Z9x56mDP5kuTj6I2z+A6tELdmgajZnEBrFGf8OrBzbzJPSyE70Lvjz72Mb2TfilVcpOsfl4j1BS4j3ZFkQL/lR2EA8EjLf928H/JUJNtzj2aIAH0Ek7rm9Hcoq+ZQ2+SkDxW6U4bum/EVyLpEjbphkfadQPJHWTMZyNUuMvU8SNc1/TW7lGijNjvLXkmFT+X5TMT3Kew3enJm/zkB/aU96m6qFegBWCtUxRPjLWrZ7mOu+fDLQulBQn6nZKmuRsh+YMPc2jZVjjxmjrLb+hP8YknMxYXEPsedr3BcGa2o/RsJti7ixqDMbMZSJfWB9t+ljdtkDgP/zV2oedliSzUdplcRV8IyQqkoFiKl00K3kVHZ/MvWZv3tFXJFjiTkTEzj0avBKmwTxSochIWNZb7uSLR3rd4o4APHQGXBnZMqr97uaJhTz2VpZul54DTo1/LVfpaGR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(39860400002)(396003)(376002)(346002)(136003)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(86362001)(82960400001)(33716001)(38100700002)(66476007)(6636002)(2906002)(6512007)(9686003)(478600001)(6506007)(6666004)(6486002)(41300700001)(6862004)(8936002)(4326008)(83380400001)(66946007)(66556008)(5660300002)(8676002)(316002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yupfoT9FuAhGGCjlrMFfyM56Rw8FZXTYtcTDjqG21JCq08tLTTb5HDG7CpBn?=
 =?us-ascii?Q?dAWU0KfB6qWNijpLHqmkDhBiv0MzfaXNExyvlAQuaF0E83uluHP9P6FSaGSV?=
 =?us-ascii?Q?t//mZLT/4zKPWKjNqX5PbRFsQXL7KusWt9N4ZKLI5Fotmraz9XFrEY1IwbiL?=
 =?us-ascii?Q?i5wO9ZHcxD7UybXmVWwBm1/I65NB8PG4WdZn1JTrT+XphROQfq/giyc6n5IS?=
 =?us-ascii?Q?nd7ZXx+OwuV5RtW742gc61PyI6ZPbutEyh9ta8LdY5nGl5R2HIKqiltONf37?=
 =?us-ascii?Q?7feuqMvdq/7JxV/8f94DRELRp6sS7e4g8uE+rHI8KN9eOrWPr837vz8vnNOX?=
 =?us-ascii?Q?fTMcTWuke6aXGSMLGV/p4LYM5TEfprZg7pSkG3lTy3UsD9z35oE6s7gTVkBy?=
 =?us-ascii?Q?W1iNmdtAz7P2vUwuwoSKSOdNJ6hF1eSqnG26gwVo3ecTn/DeCkcKS7OMbIlO?=
 =?us-ascii?Q?Gr9MzinYRtl4nKOo4tT3znqVMCGcgZG282GhOzYEmOFXZG4slqfxYjOKx0k8?=
 =?us-ascii?Q?FbBr8zZ4dRNAB7FbbC8UwBMoaRIx0A9QplHBLVy+Q5jMewDNtzNQOPWTVpLx?=
 =?us-ascii?Q?SbsrG51iZNvQypYJiqBfTvM53Ill+Sn2Ju8FROwmJlzT5Ym4d+O9S/fstoN/?=
 =?us-ascii?Q?XM67vmUGqPW2baet9JmvZE3MCxP2vgq4Df1cr7Cf6U8ZNkYF9I4wSE85wtEW?=
 =?us-ascii?Q?ipRPZtBU9Rw01ZWxoBX578mIfzZBCT+sEOxiiQ5l/5mnYNZHYLTDo5Wv+nV2?=
 =?us-ascii?Q?SNvjfwKJeXpdpnH1Ygsljx7LK8t4cY5W2cTLSSCCwyz3metZ98SS+B1OPQwY?=
 =?us-ascii?Q?HkKRXhrLAbqZdPocO27m2QtITtNV7o+EueYhM+N7y1xUBlZjjCpwK4kjjIxU?=
 =?us-ascii?Q?g1ki+IaJqJcJk3W/FY6sAD6yneclmr8/OmRM3pRF1YPp5/vOklUrX0MCnzzG?=
 =?us-ascii?Q?fZ8YbqVX8LdGHuWCL9CI0EOkXmdL5xS0dW7EiGYKhz3/0/L7HG0eFD9vZT0a?=
 =?us-ascii?Q?7AWfPCw4s/KdEl0As0zBCLERNBW0xxBnoXO9QM0oIDYsSCNURv2HpvqXchK4?=
 =?us-ascii?Q?7Im7rKAHOGY+hoYq58yeQylfLGSRKnTxmIEEzzjkg03McVqdwII2W+W3pnvJ?=
 =?us-ascii?Q?4DHqlhVJlUPo0QW1g4nlDZ7e+qWKWtCjNYAwDXiRE3WjrsT0bemdHYb3WKVb?=
 =?us-ascii?Q?3dRTvqri8m+6v9QWc8/vqlJ3hJ6m8DzfN2M4DSzIA0t5oTmL8fn3f3XktBiV?=
 =?us-ascii?Q?kSg+VltDe+4r45qjPQesm36mWXYFji/K2CFrGGh5zo1rLrsIYkjhYWJGjwtq?=
 =?us-ascii?Q?X5RDOlLUPqEkLe9xqVX2mBX7+Lvt2s7tvpYaLJmoYiIO1ATvHpKTaNg4d69k?=
 =?us-ascii?Q?qnGh5+CqTsB8TO7hqaMi9ZUYfZTm1YFN++QCTrmDMUZ23Kr0fxm82zDIaR8M?=
 =?us-ascii?Q?aKmeZBUaPw/iV+GgzCF3k2V2zLYpHsNz1495VdOHlbTGjoIhaGo/OCd5PbUF?=
 =?us-ascii?Q?wIm9axFdojLw+N6uKGyT7hF2Sowyw11EL7n2FnZe0cMrYtcuLRTmFHGI40TH?=
 =?us-ascii?Q?nZrCzrf0id0Mj1AOoTclObbXIjkPFugM7p8h4N+eKUlPalAnqA1CHF89tcA+?=
 =?us-ascii?Q?Yg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dbeae2f0-c1d8-452f-03f4-08dbcb667b94
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 21:02:02.6349 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NYvP8GHVIeFuBpZZoxZxJ27skXFzGPh6YaIOisfqLwBTly5nDb29oq1EnS5QJISLS9xKjzbXginkUyNgSH3+5Q7qfc43GS9HDto2ZAOO4F0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6492
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/6] drm/xe: Clarify number of dwords/qwords
 stored by MI_STORE_DATA_IMM
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

On Wed, Oct 11, 2023 at 04:10:01PM -0700, Matt Roper wrote:
>MI_STORE_DATA_IMM can store either dword values or qword values, and can
>store more than one value if the instruction's length field is large
>enough.  Create explicit defines to specify the number of dwords/qwords
>to be stored, which will set the instruction length correctly and, if
>necessary, turn on the 'store qword' bit.
>
>While we're here, also replace an open-coded version of
>MI_STORE_DATA_IMM with the common macros.
>
>Bspec: 60246
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/regs/xe_gpu_commands.h | 3 +++
> drivers/gpu/drm/xe/xe_migrate.c           | 9 +++------
> drivers/gpu/drm/xe/xe_ring_ops.c          | 6 ++----
> 3 files changed, 8 insertions(+), 10 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>index ad1e5466671b..8c2e0da694d8 100644
>--- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>+++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>@@ -24,6 +24,9 @@
>
> #define MI_BATCH_BUFFER_END	MI_INSTR(0x0a, 0)
> #define MI_STORE_DATA_IMM	MI_INSTR(0x20, 0)
>+#define   MI_SDI_GGTT		REG_BIT(22)
>+#define   MI_SDI_NUM_DW(x)	((x) + 1)
>+#define   MI_SDI_NUM_QW(x)	(REG_BIT(21) | (2 * (x) + 1))
>
> #define MI_LOAD_REGISTER_IMM	MI_INSTR(0x22, 0)
> #define   MI_LRI_LRM_CS_MMIO		REG_BIT(19)
>diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>index 3049595e288a..716f72ba8cd6 100644
>--- a/drivers/gpu/drm/xe/xe_migrate.c
>+++ b/drivers/gpu/drm/xe/xe_migrate.c
>@@ -482,8 +482,7 @@ static void emit_pte(struct xe_migrate *m,
> 	while (ptes) {
> 		u32 chunk = min(0x1ffU, ptes);
>
>-		bb->cs[bb->len++] = MI_STORE_DATA_IMM | BIT(21) |
>-			(chunk * 2 + 1);
>+		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(chunk);
> 		bb->cs[bb->len++] = ofs;
> 		bb->cs[bb->len++] = 0;
>
>@@ -1083,8 +1082,7 @@ static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
> 		if (!(bb->len & 1))
> 			bb->cs[bb->len++] = MI_NOOP;
>
>-		bb->cs[bb->len++] = MI_STORE_DATA_IMM | BIT(21) |
>-			(chunk * 2 + 1);
>+		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(chunk);
> 		bb->cs[bb->len++] = lower_32_bits(addr);
> 		bb->cs[bb->len++] = upper_32_bits(addr);
> 		ops->populate(pt_update, tile, NULL, bb->cs + bb->len, ofs, chunk,
>@@ -1290,8 +1288,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
> 		emit_arb_clear(bb);
>
> 		/* Map our PT's to gtt */
>-		bb->cs[bb->len++] = MI_STORE_DATA_IMM | BIT(21) |
>-			(num_updates * 2 + 1);
>+		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(num_updates);
> 		bb->cs[bb->len++] = ppgtt_ofs * XE_PAGE_SIZE + page_ofs;
> 		bb->cs[bb->len++] = 0; /* upper_32_bits */
>
>diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
>index 1e36b07d3e01..da13cc7ba6af 100644
>--- a/drivers/gpu/drm/xe/xe_ring_ops.c
>+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
>@@ -69,7 +69,7 @@ static int emit_user_interrupt(u32 *dw, int i)
>
> static int emit_store_imm_ggtt(u32 addr, u32 value, u32 *dw, int i)
> {
>-	dw[i++] = MI_STORE_DATA_IMM | BIT(22) /* GGTT */ | 2;
>+	dw[i++] = MI_STORE_DATA_IMM | MI_SDI_GGTT | MI_SDI_NUM_DW(1);
> 	dw[i++] = addr;
> 	dw[i++] = 0;
> 	dw[i++] = value;
>@@ -140,12 +140,10 @@ static int emit_pipe_invalidate(u32 mask_flags, bool invalidate_tlb, u32 *dw,
> 	return i;
> }
>
>-#define MI_STORE_QWORD_IMM_GEN8_POSTED (MI_INSTR(0x20, 3) | (1 << 21))
>-
> static int emit_store_imm_ppgtt_posted(u64 addr, u64 value,
> 				       u32 *dw, int i)
> {
>-	dw[i++] = MI_STORE_QWORD_IMM_GEN8_POSTED;
>+	dw[i++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(1);
> 	dw[i++] = lower_32_bits(addr);
> 	dw[i++] = upper_32_bits(addr);
> 	dw[i++] = lower_32_bits(value);
>-- 
>2.41.0
>

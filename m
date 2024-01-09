Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8803CC47079
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jan 2024 18:28:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4303010E4CB;
	Tue,  9 Jan 2024 18:28:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D31310E4CB
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jan 2024 18:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704824893; x=1736360893;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OUm+HY7C0egv2SR30l1tVpV5+9A3YrBrS+OK6IUA8w0=;
 b=JAzRmugT98VYTR83lOQLcVEth07W/5btapR0aRTrPzMQ9XZ9bapHlnOh
 EwsyOh73deGAlPCdjpZaNJ+d2JvVYDCKOMuZgNKYIEcFuFDAc9zqOQt24
 XC3yu2F1ioFtdlKnPPfnhNF5LaaZdmdujeHvR3MRVjbpxtfxjJ14l0yr+
 ZXWSF+xze8ndmZZkxBACLST/MzuFiPdGo57B0/rRtrCaAyi3USuNyp7HC
 BrceeOfFLYrOoGyD3okfHojOb9mi/QWinVTPF+LYfcu0zqOJva9f8J2qb
 s+ya7xat7kKOdIOhZvSE+LMGljB+rRlki5BYGGo158oGvKB+yU01nVerr w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="429468530"
X-IronPort-AV: E=Sophos;i="6.04,183,1695711600"; d="scan'208";a="429468530"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 10:28:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="758074926"
X-IronPort-AV: E=Sophos;i="6.04,183,1695711600"; d="scan'208";a="758074926"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jan 2024 10:28:05 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Jan 2024 10:28:05 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Jan 2024 10:28:04 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Jan 2024 10:28:04 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Jan 2024 10:28:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e5hWmWmVREx0G6psicNVQgvwqDkhNrIyEqte+tqrSvH0Ul2m6nOdnFcg0wpoPYpvfmBbGYqi+6AJnWiDNNFUkJWSR7C0/s2JZCwI1MWNJfuJUK7n6WPSBd6NzEPJOaN0Y+AP/W2OGcw2sjQaYom07GMmSZnZ5c6V4mVNRjUAW/z/Af9qwo3Tt7c00C6FIfQNjFAkkJALlGI8X5pIWtNkJ6mxzJ9CmmXUd4/eMIdrIIogRl5QKUWF6uTYZOpc2vo5Kxmsl9Ohgqcvw/5SgS+fiA4mDRRDUUoaRqRUQ3h2mRi9y5rRInh53BXAIb+NpGFfNnkfSo5sHRjNW3skdNfrVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZhDac54CPWwYjahWe0hWE/Ucz3LlFlkTEZJmJVoEM84=;
 b=Si8MWTDNi1xF30Ta3vbJBuvZBrX/t7fA2C8BtkPfXgN9vGSSzuRKFVTF08+n5NknRQswiy8g0wfVa6FakiZ985LogovW8c/vEVHVIeAltlxNbwsF9wVvWherIpzvMBZbOewY7EVR2B/sxwXTytFw/ZsQa7Clb0gLlij4SNkRzb+a8FZwld+eRfkbm6Dn8j7ds7kJH3MEyz9Tk7u/v8tc+O8zUiz4PLGS4+37xwEGtCoWfSUocMyV7sk1V281vBEgPKb2NiiWyVfMtsYyzYSPHAg7Lp3v5c5PCVPlr4kLw9LFy3pSLvt9+ilcG2uLIOjfDcm9JEGopaWVEnANrechnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB5326.namprd11.prod.outlook.com (2603:10b6:5:391::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Tue, 9 Jan
 2024 18:28:02 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3%4]) with mapi id 15.20.7159.020; Tue, 9 Jan 2024
 18:28:02 +0000
Date: Tue, 9 Jan 2024 10:27:59 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Shekhar Chauhan <shekhar.chauhan@intel.com>
Subject: Re: [PATCH] drm/xe/xe2_lpg: Add Wa_16018610683
Message-ID: <20240109182759.GI1327160@mdroper-desk1.amr.corp.intel.com>
References: <20240109055550.679289-1-shekhar.chauhan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240109055550.679289-1-shekhar.chauhan@intel.com>
X-ClientProxiedBy: BY5PR17CA0062.namprd17.prod.outlook.com
 (2603:10b6:a03:167::39) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB5326:EE_
X-MS-Office365-Filtering-Correlation-Id: c68c33b6-cd56-4b94-e337-08dc1140b6a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: smtpHEVZZA4z6CyLiGEjaUcPGaBtgTk26K5Gp9mrOYoCyWXXoxxVJxz0/ww84MhSFkrcSAGS9shWL0fRig5/M44YQ+y4P5++ekQmwAhvy/aTSRsWtIrpM+bqVf8URSvBxhqzzKAyjtOj4FHZcYkCSCNiBoeXrzTFD8takDqCahrVJJWczjmuua5USB3DCewQwmqR4h+UBJ042cLDOyor+pVZCk0OqDlDVcvVQatWwkp2ZsIapqKY63AnWZdgj78m68fSszRYG17oaG8lMrgNvZ6AyaoIEQjLf2qp1zJWsqN+kPE8VkLqOwX7cc/CmPtPsy83qx4vc9qFlO9TxMqXcejeKxS6sWCQlaHL9OYGy5aNd4MBjU2S8rbUCLagvU6ar9icg8MpQfj3jQ58apTv7gF3ufmpXRI7un/A6wh6EOrs7bCQkb2iOJwtSUD14WQ4Rg7janCgNEnWhbhG68ZJTWuHgQ8Ty+wEX/fc99DXqJr4hXVHo2qu4VshqzdIDaKUcaK/YiI0ZWm1iYd2icoKUSQbL7XNBN738bTE/4tijeI9W1u5tLyEtdzb8B+mbCvM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(346002)(136003)(39860400002)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(478600001)(5660300002)(6666004)(82960400001)(6486002)(33656002)(86362001)(6506007)(6512007)(8676002)(66556008)(316002)(8936002)(41300700001)(66476007)(66946007)(6636002)(38100700002)(83380400001)(26005)(1076003)(4326008)(6862004)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YxP3YEac1JdiO4x2y+WtVcbHnH6EK4ZWRaMhVCA1Mcx7iPO8rrjiWwP6aBhP?=
 =?us-ascii?Q?ehw4tU7MRt9PCdQSBBW1XGW0Pq6lePB2RTmJM6y2xXJ7Zd7G9TQbRyeO78WK?=
 =?us-ascii?Q?52t0db0L0ppVQBL02OJQWvTQK6BRpRxZvZD0VDz7iXYbInN5HtSNyXeYPHox?=
 =?us-ascii?Q?BXUoN90esZgX9wRIYlsikD0d7vrGhqSJLZRSpgDbNgGIfrKFb1aZZkN77nE8?=
 =?us-ascii?Q?8aFCpL2kna6HXp1M013aDlgX9McIJerzKOagRmmCtG8rx6pzCbW3dBzx9ZX/?=
 =?us-ascii?Q?V6QjLyL0KwcKLJdhUcVXFbNnoKqZwGDcaj8d25myTKHhJQ3xjfkBY+v59L2k?=
 =?us-ascii?Q?IbYxMFGszlWWHL5UeRvZP09QDDWU+BCvU0KUzi2kbVh5BSRYVzbbkwKzcNqG?=
 =?us-ascii?Q?4V1JhgSYCKowzIGBxYZd+4kFSC4CLd3nV9XwAf/ov7WotSKQ8pTGraeRHFRR?=
 =?us-ascii?Q?oDzlm3rVNuua4R4DOYYbhuCqm8sSS0tLTCsH1YiECw1rJuERaznx97WMy3i6?=
 =?us-ascii?Q?S8492qnZY16MwIlqpZTEFSxlzrygC8lfjZJyvBhk8aZeKj4gNsMWIPcNcNYz?=
 =?us-ascii?Q?RkTp5QB5xLAu8O1QlaaoZz80jK+E2Pe8pqlsEQopwXPEVUYNjDDgS6fEznDl?=
 =?us-ascii?Q?HKbvIDuveP8gWGoKjQyuh1p4sclPXjCaI+DFjh5MT6u2A+cnkP2rqulDiWeZ?=
 =?us-ascii?Q?mJdDIIhT5YSRc+NGZgxFsr1LdUj6GYXcUiyOChRmnR10CLy1fyMFQe2rYZrI?=
 =?us-ascii?Q?ElB1XB+ZXFwyapYOfQrYQuSvK+xESyFEgERCoRlGEGHDskaQ4nsMln2RlML6?=
 =?us-ascii?Q?4j4aT7PbsRj/qxkF7xwIz6CpXuzFZAL1j+emfuTq1ZueF/aSIl8tihbRQDDd?=
 =?us-ascii?Q?+LLGrgWeUC+/FYR5qj5l6xn6T2f2aHWlbhKsWtxbjXJ3484pEsYXPl4qS26N?=
 =?us-ascii?Q?efNnHiHbnetondUM+gCmivl5EC+QdYx+0z1vaKWy3Ux+wpAkiQ03+vSPuT8B?=
 =?us-ascii?Q?OZUK0x3oT/ZcBJXZVhsYPzMrYoq7F2nygt7nP4SBg4/18Er2FyQ+OfJuJt7S?=
 =?us-ascii?Q?6ThZ4Jt5JvHjw80rdDsgw84n0pNE0WfxyexvrlSvkMFjp+aJ0B/+MkMcEBI3?=
 =?us-ascii?Q?bzMWGqfLI5LzIJncMv7NkzhvU64NnrgPp8wNtqzd6ShxZHEyf58eYvIwTd7Y?=
 =?us-ascii?Q?TMzAnlhU6UClNiRlL8e+kst2AhUTtToYO15aKwXJ5QyhsoyvIGL4b9FgecbA?=
 =?us-ascii?Q?turSb3j8tqmwyoyJl+8MxwPkN3sfEtAUWlDlg2ADSwbtWmISZMEaYA6lMR/p?=
 =?us-ascii?Q?RGw21P0RG7Eoast20KnmDv+obv3BLjzRBxPPUP5Ah0FzmAaQjeNkdei77kNl?=
 =?us-ascii?Q?3cAzQ1U7Dgr4fC+xFlffzPLi8p+U2MuVO1+MciBMFnEO8Gvp6TzyAW3nl4Yo?=
 =?us-ascii?Q?GlrUmr87q0e4r6hydkurTrtKYA9yS3xo6pPhSwiX2haFHkdAk4PVrlhaTave?=
 =?us-ascii?Q?vMPrpb+saS0glihnjdyWcY57Ay4BWrMVMO+EqjpdVlN1FpROm5pCgYmBZGQF?=
 =?us-ascii?Q?Fv6if2ocOyjYvh3ePiZrrnXaX0u5P0WhQUGl3ibtjlJbSwsXT0qirKJVb7Fu?=
 =?us-ascii?Q?jw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c68c33b6-cd56-4b94-e337-08dc1140b6a3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 18:28:02.0763 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X5NgdKdSyjiDJDmHvkuZf+MsENuEUBjpwLmlNEuD6qIPyX0xrBYiFhflo5bultD2ZCD2pu2ix2Cv+JFKbeHuOZ2H5oPUZOOdUD3I5cf4BS8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5326
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jan 09, 2024 at 11:25:50AM +0530, Shekhar Chauhan wrote:
> Force max 128KB SLM during WMTP PASS1 Restore.
> 
> BSpec: 70202
> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 3 +++
>  drivers/gpu/drm/xe/xe_wa.c           | 5 ++++-
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 6dfad86aaea6..4017319c6300 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -345,6 +345,9 @@
>  #define ROW_CHICKEN3				XE_REG_MCR(0xe49c, XE_REG_OPTION_MASKED)
>  #define   DIS_FIX_EOT1_FLUSH			REG_BIT(9)
>  
> +#define TDL_TSL_CHICKEN				XE_REG_MCR(0xe4c4, XE_REG_OPTION_MASKED)
> +#define   SLM_WMTP_RESTORE			REG_BIT(11)
> +
>  #define ROW_CHICKEN				XE_REG_MCR(0xe4f0, XE_REG_OPTION_MASKED)
>  #define   UGM_BACKUP_MODE			REG_BIT(13)
>  #define   MDQ_ARBITRATION_MODE			REG_BIT(12)
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index b77d406e083e..3299130ba10a 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -455,7 +455,10 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  			     PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS,
>  			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
>  	},
> -
> +	{ XE_RTP_NAME("16018610683"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, SLM_WMTP_RESTORE))
> +	},
>  	{}
>  };
>  
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

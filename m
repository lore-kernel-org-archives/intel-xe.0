Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7BF3C77B7C
	for <intel-xe@archiver.kernel.org>; Thu, 11 May 2023 21:14:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A752E10E0FD;
	Thu, 11 May 2023 21:14:56 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B64110E0FD
 for <intel-xe@lists.freedesktop.org>; Thu, 11 May 2023 21:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683839694; x=1715375694;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dDCSRl5ZYMyaXcm4aX+SQek5K6VS0XOb4fPi/8sepAk=;
 b=gPDO7NFu5fS49qzJNC6FWdDPjQOcGClVo/qbLpCBL/Ygd3N+3FTVUCJ7
 nQdOUnYShqdLT3nY6B5rGcrGKczGEcJhixNgJ/XRT6qt7aVj4aN9LAI3e
 3dbL67doV7LGdE4emDp6zzrDb0cnXsjQbRi7185c6W7co8UGLddpyVAdb
 m3XgNTkCaSi/kBIbyVTMj122XXi2sEVDi2CzlW09PcbGBENm0d2zWQo3l
 hxzgFQaF1yXcINw927jK49ADNHKvtGpiv22R44XhwswHzpy8eLfYTv+GP
 M192HScHiSqgAF++V9D4Phauoxx5RnZPEbRFkq7iQGVuFezhdhegO3yBa g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="330998635"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; d="scan'208";a="330998635"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 14:14:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="946348475"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; d="scan'208";a="946348475"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga006.fm.intel.com with ESMTP; 11 May 2023 14:14:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 11 May 2023 14:14:52 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 11 May 2023 14:14:52 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 11 May 2023 14:14:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AmbpVGemGsnjKNe8XEUkf3uUCzmZlCfyth4AJDKnZiUQR7rJjOslYXLbOeQ5fkcjIfr2+z8+l61STJ6DGZi0Lz1CZrvSXd7SuxTIM075r3OhKGhSzuAipXVKzhAwXP2aLC/uYRjB2EdFfrbV2CY4rckzVs09N4atDijyHQVZHIYDiHniZlQZuMmvzbFZJLKTVuiQjQJ/vXhV/xFFhaWqJ76PZGHO6rO7DQzbsYMXKj50WqUlymZh07i4MRKR4krp5ARipvhF2b6hZYSBUc4X0y3vg62uNGTMrXZPhDVu9DP3dIK07ilUGCK1WyoiRyuKZyHPGXL1KaSEUrXXnAh/Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9rVZmsUYeinpT9IdT279qVxaq0fb43RV6IUDQCFnN3U=;
 b=effKjvmvTNiNP+YfVGF5iBHfLfkOkQIowWUazZ7kFuthxy1jVqeG6MJHdIqqRto3IyupUi1qn9DH5Xu7BLeGQCh/pPA78uDz0lIXGnDyi9ezmxdU4b5YuwZJ8KO2ZcsWLvmcTWM5CWhZYgG9Dl3u7rfXaPw+itLPtTbHlVZ4x1bxgLl7rjNCYjPiBfw9Xjq1JEbZFijr8lY9gkblRGAPcwczmtzeRXqMbTGFGzEtuj5EIW1kslBpZoPPszpQBK00tHpj46rAqTsFzYLGTx4v4lrqG4ilh+/aspwBtTQgBRRk8xFyWvfzt1GOTKnZqK+Zy3atEpzOpZOoTFHUQD1blw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BN9PR11MB5435.namprd11.prod.outlook.com (2603:10b6:408:100::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.22; Thu, 11 May
 2023 21:14:50 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6363.033; Thu, 11 May 2023
 21:14:50 +0000
Date: Thu, 11 May 2023 14:14:47 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <jfyox4ibz7jh5d3ppbx3bx77hsudu42aesecrzpi3i7tym3f2c@ttfgcsi4oyau>
References: <20230511192015.1816-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230511192015.1816-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0087.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::32) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BN9PR11MB5435:EE_
X-MS-Office365-Filtering-Correlation-Id: face87e5-7a81-405c-0f62-08db5264c1cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YqaBV8EJoQlAtjghOrNROHQQ+Qejq70o97tZWf7oOAtoP2yaMy2l3wfoofM7eBkDBhEygk7XzjZf4diP9wvVxuayukQR51oH5OxHRRB6c31i5EWZznflOn1pvgcnNWiqhmN0sDctqV/ssU7n7dGsZjVmnMpnjG+RXFqwWyVEewtafQhdcFu2mqJGgmviIuvHZACDo4XqwX1aCe5SgNUxKvO7BhEdtvqRsp6/kZ/2pN0TYls5R04qjeJDtEvYJ5q2O5or+JsYw6pk754NSg5qlmN/fgT37W2spOXgfLLAoewHms8bOFzYemPTKe23OyjSvoluE8yP7NeRu7R8SrnZuaLtiQHncX4bisQjairCbw7JcBcll7DTvyq7xjnur4n3hBzLMQoKv+m/zphRz0B9Uo+GPTqCHoVORjapDTz/h3qnZYdktFw+g2yRERlNxm2WnCQoiik5nD2cYahaL2IIjXnk9OneRch7IEQ0KGJKqj3VCPOdQnUPyq+a+664fkTdYn7u8B8HwmCbLFgXVz4OoeTij42fKUK/N3t1UlxE2b6c1lsFQfW+j6wi+fCFCfPy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(376002)(366004)(39860400002)(346002)(396003)(451199021)(6512007)(186003)(26005)(6506007)(9686003)(38100700002)(41300700001)(6486002)(6666004)(83380400001)(478600001)(6636002)(82960400001)(4326008)(66476007)(66556008)(66946007)(316002)(5660300002)(33716001)(86362001)(2906002)(8936002)(6862004)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Fyf5qHDMuvK4yf5V5Qn6xhIkUxqQtSzCPZCUrNIArpCUGydZjO5ZWGE446qO?=
 =?us-ascii?Q?OsrSg2UIAtIz1U2wKssUVuemRN7LG7DPTT2Woy5Kh7QqpKykbIuXJTxQ/LBE?=
 =?us-ascii?Q?8zJOsuRJ4NnHt9rWBfbIX4AxJl+52YYEN6/RtL1gIktu3/HXl9NzmOQJ9ftq?=
 =?us-ascii?Q?VIhBs/MKcckey31iHqigEkMdMeiWAgnLNsdQN77rc93QDA12CFsy+Dbhdogg?=
 =?us-ascii?Q?UCc2GL14RFN6+OgVE7TSeByPDJ7GEjzYyd92Xq5RftEX7Lh1FcoPDx1hbtlY?=
 =?us-ascii?Q?m7KVSCWJmQ7hMj+WXu2Sl+BBctL6K8svwAvZ+l0dOKWGqXazcWHxUYmeZ2mO?=
 =?us-ascii?Q?dlfs5sVM07FYIs2yn9ACW53HDY3aIC4OXPA3Cn0SqcM7MdtihoXs8ceD47Nq?=
 =?us-ascii?Q?Ykdmo2WIoYnFzofnH/hW+07p5Xdp7tb9qmcr3VNulDwYC6xIi+BuN3cMzubG?=
 =?us-ascii?Q?lPDF6BKzLgRWbSlf41g+uiIM3qUrL+CGpuivLpSUtIH+//0bRwhTP68/3R5L?=
 =?us-ascii?Q?PmvF6WHe4BqsgQ/oiMtLGJ04Foc3kXZ5BFefrSDVF8pYszgX3w7nsDsTsxSg?=
 =?us-ascii?Q?1CJYMPm59enZjZtmZEhQNBPGQ/qhunu2sHW7xSYnu07ywBHNSNjvmU6FDn0M?=
 =?us-ascii?Q?b5E8i/AR8FEwj1wyJ1z6XpB9HgOKGSPiUkdBa/DYdmSr9ArmNFrcNUSMGHoS?=
 =?us-ascii?Q?2koJvvMJSmdo5O11hc0YRn/0vhi3Jq7rmeHDvdOzzDNkqEnKW+2m5pS5P4P6?=
 =?us-ascii?Q?tSC4WSW9DXqCt4lcc9aYNIwJe0H5OI70M1W0PqFqIqWs10FGHPY3rXauNdib?=
 =?us-ascii?Q?DnLyeKxhPTTWd6ZxvgDh7wCqKSVjnGryeaoPdH6ZFplRi8bC9PCR2LaDP/+7?=
 =?us-ascii?Q?GZeFEEixh9DIDr6udszUjGP+2U0N/zX/0otsoVgCCbpMAvgjUziZ6uawN3bH?=
 =?us-ascii?Q?QsAcRhzPgqKSkOY0huGIGOG2opO0obRaJliQ7R16Yg6kgJLIpg5HlAaDpd9b?=
 =?us-ascii?Q?I4uCSEatxzCOfq09hT69bnb4ntBFCxdMrGAMuDnfW0gkwxSf7ut/cDniopOi?=
 =?us-ascii?Q?e/+gLXnfin1jqvPNAal0d5B5kPRCKXE2NCXDx8cZ7iDUvDJ7wUVhn3DzPKMB?=
 =?us-ascii?Q?AjN7sAa9D/wfTx+kRK1czJupJk9z7iDQF67tYhotG0udERVnaqFX8M0hFlHw?=
 =?us-ascii?Q?y73eAOeITF2sQZn3rObQQzTa2l5FQRKyzAXSXjiLutqw0FaRn6ZuyCPguuIm?=
 =?us-ascii?Q?eGSAhohBx0Wg1jDwP0peb0zA4bKHsibCBDx0y4QvvFYxHZy9whlEfII0lqcQ?=
 =?us-ascii?Q?QtQYFrsvda73uXocfE+PvPlMGw+Pm2hxlI/aSWumH39ULAGptWoMhE15t2Eu?=
 =?us-ascii?Q?UUrCpHHaaz/oKOIiWOrHZXMN9TJh1Fd0WJXQCum5SMwLVOyhOh/opmcrdRzB?=
 =?us-ascii?Q?o5Qd9sWJ3r5fC+MypJzeSpbS0gzBLJGpUKOKNbAXhNODrPhGtVnO1TsgamVU?=
 =?us-ascii?Q?qg4/9RVcqJIOPwfr2umQO7azdHW2pWmhMnamKZmlP87KXXgFaN/54fM+oWZF?=
 =?us-ascii?Q?Yo0YSXwZtgmj60W/IwoYx5/3K4n+RyyZ3j5iXmhsJhiDojXtRxpu151CJMww?=
 =?us-ascii?Q?/w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: face87e5-7a81-405c-0f62-08db5264c1cb
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 21:14:50.6523 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TU+pTTh3rsDR1YXBcfXbp7i9fhmCcJmbpbOULDSBc77b93HGYYjyhhD5WDygiCjh3sbu3unibhTbnfp2A4WczLl0/paJrU+IXUpLg/WJEm4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5435
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Move Media GuC register definition
 to proper header
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

On Thu, May 11, 2023 at 09:20:15PM +0200, Michal Wajdeczko wrote:
>All register definitions shall be kept in dedicated regs.h files,

That is not the rule. Yet.  In the commit message, I'd just say this
guc register can bem moved together with the rest of the register
definitions and be named in a similar way.

git grep "define.*XE_REG(" -- \
	drivers/gpu/drm/xe \
	':(exclude)drivers/gpu/drm/xe/regs' \
	':(exclude)drivers/gpu/drm/xe/compat-i915-headers' \
	':(exclude)drivers/gpu/drm/xe/tests'

drivers/gpu/drm/xe/xe_ggtt.c:#define GUC_TLB_INV_CR                             XE_REG(0xcee8)
drivers/gpu/drm/xe/xe_ggtt.c:#define PVC_GUC_TLB_INV_DESC0                      XE_REG(0xcf7c)
drivers/gpu/drm/xe/xe_ggtt.c:#define PVC_GUC_TLB_INV_DESC1                      XE_REG(0xcf80)
drivers/gpu/drm/xe/xe_gt_mcr.c:#define STEER_SEMAPHORE          XE_REG(0xFD0)
drivers/gpu/drm/xe/xe_guc.c:#define MEDIA_GUC_HOST_INTERRUPT        XE_REG(0x190304)
drivers/gpu/drm/xe/xe_guc_pc.c:#define GEN6_RP_STATE_CAP        XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5998)
drivers/gpu/drm/xe/xe_guc_pc.c:#define GEN10_FREQ_INFO_REC      XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5ef0)
drivers/gpu/drm/xe/xe_guc_pc.c:#define GEN12_RPSTAT1            XE_REG(0x1381b4)
drivers/gpu/drm/xe/xe_guc_pc.c:#define MTL_MIRROR_TARGET_WP1    XE_REG(0xc60)
drivers/gpu/drm/xe/xe_irq.c:#define IMR(offset)                         XE_REG(offset + 0x4)
drivers/gpu/drm/xe/xe_irq.c:#define IIR(offset)                         XE_REG(offset + 0x8)
drivers/gpu/drm/xe/xe_irq.c:#define IER(offset)                         XE_REG(offset + 0xc)
drivers/gpu/drm/xe/xe_mmio.c:#define XEHP_MTCFG_ADDR            XE_REG(0x101800)
drivers/gpu/drm/xe/xe_pcode_api.h:#define PCODE_MAILBOX                 XE_REG(0x138124)
drivers/gpu/drm/xe/xe_pcode_api.h:#define PCODE_DATA0                   XE_REG(0x138128)
drivers/gpu/drm/xe/xe_pcode_api.h:#define PCODE_DATA1                   XE_REG(0x13812C)
drivers/gpu/drm/xe/xe_reg_whitelist.c:#define XE_REG_MCR(...)     XE_REG(__VA_ARGS__, .mcr = 1)
drivers/gpu/drm/xe/xe_tuning.c:#define XE_REG_MCR(...)     XE_REG(__VA_ARGS__, .mcr = 1)
drivers/gpu/drm/xe/xe_wa.c:#define XE_REG_MCR(...)     XE_REG(__VA_ARGS__, .mcr = 1)

>not defined locally in .c files. While at it, rename it to match
>name from the Bspec.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>---
> drivers/gpu/drm/xe/regs/xe_guc_regs.h | 2 ++
> drivers/gpu/drm/xe/xe_guc.c           | 4 +---
> 2 files changed, 3 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>index 37e0ac550931..01a8b0679679 100644
>--- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>@@ -122,6 +122,8 @@ struct guc_doorbell_info {
> #define MED_VF_SW_FLAG(n)			XE_REG(0x190310 + (n) * 4)
> #define MED_VF_SW_FLAG_COUNT			4
>
>+#define MED_GUC_HOST_INTERRUPT			XE_REG(0x190304)

wrong placement as registers should be sorted by the address,
so above this register.

Lucas De Marchi

>+
> /* GuC Interrupt Vector */
> #define GUC_INTR_GUC2HOST			BIT(15)
> #define GUC_INTR_EXEC_ERROR			BIT(14)
>diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>index eb4af4c71124..18bce8c1fbf7 100644
>--- a/drivers/gpu/drm/xe/xe_guc.c
>+++ b/drivers/gpu/drm/xe/xe_guc.c
>@@ -22,8 +22,6 @@
> #include "xe_uc_fw.h"
> #include "xe_wopcm.h"
>
>-#define MEDIA_GUC_HOST_INTERRUPT        XE_REG(0x190304)
>-
> static struct xe_gt *
> guc_to_gt(struct xe_guc *guc)
> {
>@@ -268,7 +266,7 @@ int xe_guc_init(struct xe_guc *guc)
> 	guc_init_params(guc);
>
> 	if (xe_gt_is_media_type(gt))
>-		guc->notify_reg = MEDIA_GUC_HOST_INTERRUPT;
>+		guc->notify_reg = MED_GUC_HOST_INTERRUPT;
> 	else
> 		guc->notify_reg = GUC_HOST_INTERRUPT;
>
>-- 
>2.25.1
>

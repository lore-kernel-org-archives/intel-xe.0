Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 817E2C7EE23
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jun 2023 19:44:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5047D10E1E2;
	Mon,  5 Jun 2023 19:44:57 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8B5610E1E2
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Jun 2023 19:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685994295; x=1717530295;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mdYr4N+xuQfN34plNu0MF7d0Wr8vD+cqoelrNUfH5zY=;
 b=SjDWTV8AaP88ZAQKyGyIXjOBfvdY6koEacTzaKhUf8dtUIt2UejjgO+j
 mX6reYwABtDBNm0IfXucyzyIaqqI81zw5ldbI1r1P+vN6GZ9Id7+FRI3z
 gwfu44/nP2h3R9N0/PMxXUOgPQUFODmQOLRYplxKL2h8cwZOMSZ47fBC4
 UMa89Qi+5BMkwdzcCCSsdHF4mcVvAbPKsOZf+YZpBQ7kckS+0Rmeq8ncj
 m/0oGSITHvN2A9/oCrwEGBmM/3Ap+2oW94Q4qJ5xtq+21nzv+kdth9kg5
 HyDBpYJ4xHkH/VdnUA/87K+XKUdTi1+RWAEN3l+NxeKpmXD9Ju+ODhaLA w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="336821478"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; d="scan'208";a="336821478"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 12:44:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="798557092"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; d="scan'208";a="798557092"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP; 05 Jun 2023 12:44:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 5 Jun 2023 12:44:54 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 5 Jun 2023 12:44:54 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 5 Jun 2023 12:44:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A7slqJmUPvl7E8U9oSMO/X5r+Rh2QiZgg/y8L/3g6tVgrfKU+AnRwd6xELXlUd0tgjM9eTCE1396J9pkSmt3BtySl+t8qXhOZ2wRY1zoNeueijgWJ5qnDgPqUkes1Gr0HqwPyslHuKIRRbuQgltDsYHTWx93pa0g4cWAWQhGe7tFnP5p4M0Euz5Jy2ozBRBxRw0tr8HP1ce2yIIo8oYdC4ykcJMZ2HONGRtcqMwKyFGs8sF/6GHCy7lsg+Khf0RgSsb3E0r6E1h5ZuL7j6njd9XKYlJNhHRMJr+yJrJGjoDMIdGqTtPJk5fzxDywGDN6VwQAmG1MQ4+iwdOJblTPPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vj7sWuptPbNeTa+iTD69W1bkMfponSH2pgpsm8Nkmlg=;
 b=Y1GKvpiDmtecl2Bg3We1IFbY4+i4u568nHE2gzYaL/9SH9gFJdxMgDPTMnDDKMp6qiIddXP/6ZeKp6WWhLPcyp8XSiWM8sy3r8Bd98zZht2fgamFYYhzc/guqFL+2TjbERIL/pN3sW2kM+FRbn5AyZZ5XB7IK6gurLdFSnyjbiMWNX2VqxilL8iu7AhIqEqMJhZf76WXoG3RucsI1zb3FvfrKz2SBP+XO1hq3LHxcBcg3kwfn0iWO/7D5oauOkmL5TlpRWjfrSGiTgFdCqKXgaw4WqL2f9lwPEWb/JnVtUdiu4BteMwmPr4VzjoAo5a2Gesp2/bSf1jZKdQoRXWK8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB7308.namprd11.prod.outlook.com (2603:10b6:208:436::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Mon, 5 Jun
 2023 19:44:52 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%5]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 19:44:52 +0000
Date: Mon, 5 Jun 2023 19:43:36 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <ZH466GjaZyvwnmz6@DUT025-TGLU.fm.intel.com>
References: <20230602235210.1314028-1-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230602235210.1314028-1-matthew.d.roper@intel.com>
X-ClientProxiedBy: BYAPR07CA0091.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB7308:EE_
X-MS-Office365-Filtering-Correlation-Id: 10ac8358-3025-4dac-0d4c-08db65fd5439
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nBxVYE71rA4kkurDw1zWoVct00W0iQgVKuhsKNP+3k2WC5JCjnYThltIIYgD4zW/x4cAqfO8YUJv/ihWBHXc/4RF1+A4uUC41kcMLOje1msPD3wftEXDuAbUOYg/ZEh3cHTO/8VN7ANGAfJNvWlRi6rxkyH3uv8kXmFAsLDnQTrIXlel0cs/393Bjh+G9UOepxj7qIfnuZCsMrHkYE+WL3mndDql4ehjjAFf3xyW+xs8L8ohna+zpQ/ILO6gpMqRz4Kj8GCWm4ZouzRRDJocB98QoWMNqofkR/8Nf8WAIFygtaMh/O/9Kjqb7FD3onsdFF5bAXwtP3p1T9uwFSCRnkZA2jJsETFkXimawEOennenNDbYLDsK1PHpJXZTZW2qtPftedbJaj2b2kZ91IQMFTmhstsg1frHzgvuPTE8RwTazGuKuKB4u7u3Hixg2wsjM6gGFu4/8MSaMsFsyoxGgB1S19Bi4e5qmBCdpBlEadC5UiBiCO1+AUr8XYbsFOC518oFu914NyDP3E64rLtoti0wzj3geGt/0Zw3FrUxnv9o7+lQfkvM0jblM7WEaHxt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(366004)(396003)(346002)(136003)(451199021)(6512007)(26005)(6506007)(44832011)(316002)(83380400001)(66556008)(6636002)(4326008)(66476007)(66946007)(6486002)(6666004)(186003)(478600001)(2906002)(5660300002)(8936002)(8676002)(6862004)(82960400001)(41300700001)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?V2QMlmXKcrhhOGttCCc25j3Iwnzn4Y7Q7873zHgaccJYeMHOOvncf6ZnVvE1?=
 =?us-ascii?Q?uT0kelk+HKN/UkShup6mIYU5GMpAVt6OSp/ml7xvm8boJwmGffoJ4fDE9hjr?=
 =?us-ascii?Q?Z2+tWac/1hUR26HRliqd68NWHWZBZ1KJmvEjM7TMVZp0iFLE2T97l8hP/clq?=
 =?us-ascii?Q?1odIH55tqA9SPpQh6D2Taw8o5hP+IKTAtUozDTraCWnNJ0V0CY1ggadq4Fig?=
 =?us-ascii?Q?hKrV+MrYLmtYYkgRwcHeiXDFh7hCc24UsCeZh2OVk9VkKlOvJQzx8J68HpSF?=
 =?us-ascii?Q?ZikITQzr0Bmlu2C7uXaTl89NAmgewuZRsS3wTVyfw10BpNXumOOPNjcNRTEK?=
 =?us-ascii?Q?z3Ce/75EjgG6TJvUlro6bB/3ZB/KXqkjsVtFTr+VqearB13KtaLIJISbUYAX?=
 =?us-ascii?Q?95ygdZ/NBg/DA5icDqvTT5TxkvUH5bMmalY7383PHvOCATqkpTjOkA+owCSi?=
 =?us-ascii?Q?6v98SQlxIo3VX+lhhIlro6rh3wyFIh5skgoQScT0moqGL3bCr9ond2zATa9l?=
 =?us-ascii?Q?11UdIc2zwfqwbCDg8dEmw1CC4i76dI7Du9KHOlg4wwAz04vpHS7Np2Dub0H2?=
 =?us-ascii?Q?UNplcMFruZKBy6Nq94w5338ncEKVUE7a/HXKTaiOHrqXPwoIGrrOlGn6q2aP?=
 =?us-ascii?Q?4gmOhGNyGd3797dRglnwShp4TfXGxnygjiC0FYxdzrXakFJNXyPfaSNEtbfB?=
 =?us-ascii?Q?blR9q8tEfCx7+FH3Fs1Oi2/K2e6vNH1cmSSrnFrzTR2M7cAibkqkaEFgnsko?=
 =?us-ascii?Q?Nh3684oN+aG4AP1HhVOkorw2EIEtS26PZNZtbVye6YQ3TXaOZ5EIHvvXFYXw?=
 =?us-ascii?Q?3I+vE+F4Lp8M9mIZ8j+96IyTLs4bZqK6WVzR7J+eeKLEIhAFXDtCP3Zt3dvI?=
 =?us-ascii?Q?4QEr48/wE0mM+TCjXBJH9Kax4M/5W+9xNmEe7yYJTpxVpB85GOhWMUpARrFh?=
 =?us-ascii?Q?nYzOa4xUocXMu7G9PL+fylD57XDnWMhMz73ADOWX0oIWGuq3l0FMq6E3BpkI?=
 =?us-ascii?Q?8JHffuW4rkKU7JkP/NTl8kRzDH22kWJbvgE5gKcL7DO98ut+6lZPhLAuArc5?=
 =?us-ascii?Q?VvSbfKPN9Xi/5qRoNffF/TauBNdZAgvHr/CLdbeFTBwRXLCcWjq3TiI2Zs9E?=
 =?us-ascii?Q?OWoqgUk5r6ZpQ9wAWlWBg7VO+LHTgCh3fUxlMcCdgT2EK5/vKebE0SVp+ryg?=
 =?us-ascii?Q?Z491avtOV3v3Hos6hf43tS9Plc4Jlbdo6Ch7Qq/aNg1j54EtHNzkvfomvvZ/?=
 =?us-ascii?Q?IqZNTpHYROQ/I//PE1vkfU5q8n4utpNgFtDU9rnzm/m83fpgvJ1L5kUyte9i?=
 =?us-ascii?Q?sWBMwTJg1j5UiyRs6eb39Xs2gyt9SVLpjSUYL6JsyJmKdkMFq555wu8hga6u?=
 =?us-ascii?Q?YCy23AOfjns3DESgboakzSC08j/5ELjDifKDd4iENNRxEtE0NBvUCv29r/CL?=
 =?us-ascii?Q?ksptkckwRmTeiTFjFI+/V2UqB3h4NKrE9CyLth9ixPF+Wsp7oZNA5036Rkdz?=
 =?us-ascii?Q?mqdeo0MztumNW9unUajr9PtFmNJLbnt3C6q7jUXJRmD7KbmINJslYBCZ+GZY?=
 =?us-ascii?Q?B46TctkIgSG15rAnFS1DUCx7T/062mRNPvsAv7bGnZX5TQ8urV7G9VyHOdIv?=
 =?us-ascii?Q?QQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10ac8358-3025-4dac-0d4c-08db65fd5439
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 19:44:52.0540 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J1jEYPSnSBSjWGlaH/fSHPNEhPjsYPXbH/eyF6V2lC6JKaKiJt2DGAHOSUaDDKm2jBPurYAZUDe6Ka4ne64rRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7308
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/3] drm/xe: Reformat xe_guc_regs.h
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

On Fri, Jun 02, 2023 at 04:52:08PM -0700, Matt Roper wrote:
> Reformat the GuC register header according to the same rules used by
> other register headers:
>  - Register definitions are ordered by offset
>  - Value of #define's start on column 49
>  - Lowercase used for hex values
> 
> No functional change.
> 
> This header has some things that aren't directly related to register
> definitions (e.g., number of doorbells, doorbell info structure, GuC
> interrupt vector layout, etc.  These items have been moved to the bottom
> of the header.
> 
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_guc_regs.h | 186 +++++++++++++-------------
>  1 file changed, 93 insertions(+), 93 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> index b4f27cadb68f..ea8118f16722 100644
> --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> @@ -13,65 +13,37 @@
>  
>  /* Definitions of GuC H/W registers, bits, etc */
>  
> -#define GUC_STATUS			XE_REG(0xc000)
> -#define   GS_AUTH_STATUS_MASK		REG_GENMASK(31, 30)
> -#define   GS_AUTH_STATUS_BAD		REG_FIELD_PREP(GS_AUTH_STATUS_MASK, 0x1)
> -#define   GS_AUTH_STATUS_GOOD		REG_FIELD_PREP(GS_AUTH_STATUS_MASK, 0x2)
> -#define   GS_MIA_MASK			REG_GENMASK(18, 16)
> -#define   GS_MIA_CORE_STATE		REG_FIELD_PREP(GS_MIA_MASK, 0x1)
> -#define   GS_MIA_HALT_REQUESTED		REG_FIELD_PREP(GS_MIA_MASK, 0x2)
> -#define   GS_MIA_ISR_ENTRY		REG_FIELD_PREP(GS_MIA_MASK, 0x4)
> -#define   GS_UKERNEL_MASK		REG_GENMASK(15, 8)
> -#define   GS_BOOTROM_MASK		REG_GENMASK(7, 1)
> -#define   GS_BOOTROM_RSA_FAILED		REG_FIELD_PREP(GS_BOOTROM_MASK, 0x50)
> -#define   GS_BOOTROM_JUMP_PASSED	REG_FIELD_PREP(GS_BOOTROM_MASK, 0x76)
> -#define   GS_MIA_IN_RESET		REG_BIT(0)
> +#define DIST_DBS_POPULATED			XE_REG(0xd08)
> +#define   DOORBELLS_PER_SQIDI_MASK		REG_GENMASK(23, 16)
> +#define   SQIDIS_DOORBELL_EXIST_MASK		REG_GENMASK(15, 0)
>  
> -#define SOFT_SCRATCH(n)			XE_REG(0xc180 + (n) * 4)
> -#define SOFT_SCRATCH_COUNT		16
> +#define DRBREGL(x)				XE_REG(0x1000 + (x) * 8)
> +#define   DRB_VALID				REG_BIT(0)
> +#define DRBREGU(x)				XE_REG(0x1000 + (x) * 8 + 4)
>  
> -#define UOS_RSA_SCRATCH(i)		XE_REG(0xc200 + (i) * 4)
> -#define UOS_RSA_SCRATCH_COUNT		64
> -
> -#define DMA_ADDR_0_LOW			XE_REG(0xc300)
> -#define DMA_ADDR_0_HIGH			XE_REG(0xc304)
> -#define DMA_ADDR_1_LOW			XE_REG(0xc308)
> -#define DMA_ADDR_1_HIGH			XE_REG(0xc30c)
> -#define   DMA_ADDR_SPACE_MASK		REG_GENMASK(20, 16)
> -#define   DMA_ADDRESS_SPACE_WOPCM	REG_FIELD_PREP(DMA_ADDR_SPACE_MASK, 7)
> -#define DMA_COPY_SIZE			XE_REG(0xc310)
> -#define DMA_CTRL			XE_REG(0xc314)
> -#define   HUC_UKERNEL			REG_BIT(9)
> -#define   UOS_MOVE			REG_BIT(4)
> -#define   START_DMA			REG_BIT(0)
> -#define DMA_GUC_WOPCM_OFFSET		XE_REG(0xc340)
> -#define   GUC_WOPCM_OFFSET_SHIFT	14
> -#define   GUC_WOPCM_OFFSET_MASK		REG_GENMASK(31, GUC_WOPCM_OFFSET_SHIFT)
> -#define   HUC_LOADING_AGENT_GUC		REG_BIT(1)
> -#define   GUC_WOPCM_OFFSET_VALID	REG_BIT(0)
> -#define GUC_MAX_IDLE_COUNT		XE_REG(0xc3e4)
> -
> -#define HUC_STATUS2			XE_REG(0xd3b0)
> -#define   HUC_FW_VERIFIED		REG_BIT(7)
> -
> -#define HUC_KERNEL_LOAD_INFO		XE_REG(0xc1dc)
> -#define   HUC_LOAD_SUCCESSFUL		REG_BIT(0)
> -
> -#define GUC_WOPCM_SIZE			XE_REG(0xc050)
> -#define   GUC_WOPCM_SIZE_MASK		REG_GENMASK(31, 12)
> -#define   GUC_WOPCM_SIZE_LOCKED		REG_BIT(0)
> -
> -#define GT_PM_CONFIG			XE_REG(0x13816c)
> -#define   GT_DOORBELL_ENABLE		REG_BIT(0)
> -
> -#define GTCR				XE_REG(0x4274)
> -#define   GTCR_INVALIDATE		REG_BIT(0)
> -
> -#define GUC_TLB_INV_CR			XE_REG(0xcee8)
> -#define   GUC_TLB_INV_CR_INVALIDATE	REG_BIT(0)
> +#define GTCR					XE_REG(0x4274)
> +#define   GTCR_INVALIDATE			REG_BIT(0)
>  
>  #define GUC_ARAT_C6DIS				XE_REG(0xa178)
>  
> +#define GUC_STATUS				XE_REG(0xc000)
> +#define   GS_AUTH_STATUS_MASK			REG_GENMASK(31, 30)
> +#define   GS_AUTH_STATUS_BAD			REG_FIELD_PREP(GS_AUTH_STATUS_MASK, 0x1)
> +#define   GS_AUTH_STATUS_GOOD			REG_FIELD_PREP(GS_AUTH_STATUS_MASK, 0x2)
> +#define   GS_MIA_MASK				REG_GENMASK(18, 16)
> +#define   GS_MIA_CORE_STATE			REG_FIELD_PREP(GS_MIA_MASK, 0x1)
> +#define   GS_MIA_HALT_REQUESTED			REG_FIELD_PREP(GS_MIA_MASK, 0x2)
> +#define   GS_MIA_ISR_ENTRY			REG_FIELD_PREP(GS_MIA_MASK, 0x4)
> +#define   GS_UKERNEL_MASK			REG_GENMASK(15, 8)
> +#define   GS_BOOTROM_MASK			REG_GENMASK(7, 1)
> +#define   GS_BOOTROM_RSA_FAILED			REG_FIELD_PREP(GS_BOOTROM_MASK, 0x50)
> +#define   GS_BOOTROM_JUMP_PASSED		REG_FIELD_PREP(GS_BOOTROM_MASK, 0x76)
> +#define   GS_MIA_IN_RESET			REG_BIT(0)
> +
> +#define GUC_WOPCM_SIZE				XE_REG(0xc050)
> +#define   GUC_WOPCM_SIZE_MASK			REG_GENMASK(31, 12)
> +#define   GUC_WOPCM_SIZE_LOCKED			REG_BIT(0)
> +
>  #define GUC_SHIM_CONTROL			XE_REG(0xc064)
>  #define   PVC_GUC_MOCS_INDEX_MASK		REG_GENMASK(25, 24)
>  #define   PVC_GUC_MOCS_UC_INDEX			1
> @@ -86,11 +58,78 @@
>  #define   GUC_ENABLE_READ_CACHE_LOGIC		REG_BIT(1)
>  #define   GUC_DISABLE_SRAM_INIT_TO_ZEROES	REG_BIT(0)
>  
> +#define SOFT_SCRATCH(n)				XE_REG(0xc180 + (n) * 4)
> +#define SOFT_SCRATCH_COUNT			16
> +
> +#define HUC_KERNEL_LOAD_INFO			XE_REG(0xc1dc)
> +#define   HUC_LOAD_SUCCESSFUL			REG_BIT(0)
> +
> +#define UOS_RSA_SCRATCH(i)			XE_REG(0xc200 + (i) * 4)
> +#define UOS_RSA_SCRATCH_COUNT			64
> +
> +#define DMA_ADDR_0_LOW				XE_REG(0xc300)
> +#define DMA_ADDR_0_HIGH				XE_REG(0xc304)
> +#define DMA_ADDR_1_LOW				XE_REG(0xc308)
> +#define DMA_ADDR_1_HIGH				XE_REG(0xc30c)
> +#define   DMA_ADDR_SPACE_MASK			REG_GENMASK(20, 16)
> +#define   DMA_ADDRESS_SPACE_WOPCM		REG_FIELD_PREP(DMA_ADDR_SPACE_MASK, 7)
> +#define DMA_COPY_SIZE				XE_REG(0xc310)
> +#define DMA_CTRL				XE_REG(0xc314)
> +#define   HUC_UKERNEL				REG_BIT(9)
> +#define   UOS_MOVE				REG_BIT(4)
> +#define   START_DMA				REG_BIT(0)
> +#define DMA_GUC_WOPCM_OFFSET			XE_REG(0xc340)
> +#define   GUC_WOPCM_OFFSET_SHIFT		14
> +#define   GUC_WOPCM_OFFSET_MASK			REG_GENMASK(31, GUC_WOPCM_OFFSET_SHIFT)
> +#define   HUC_LOADING_AGENT_GUC			REG_BIT(1)
> +#define   GUC_WOPCM_OFFSET_VALID		REG_BIT(0)
> +#define GUC_MAX_IDLE_COUNT			XE_REG(0xc3e4)
>  
>  #define GUC_SEND_INTERRUPT			XE_REG(0xc4c8)
>  #define   GUC_SEND_TRIGGER			REG_BIT(0)
> +
> +#define GUC_BCS_RCS_IER				XE_REG(0xc550)
> +#define GUC_VCS2_VCS1_IER			XE_REG(0xc554)
> +#define GUC_WD_VECS_IER				XE_REG(0xc558)
> +#define GUC_PM_P24C_IER				XE_REG(0xc55c)
> +
> +#define GUC_TLB_INV_CR				XE_REG(0xcee8)
> +#define   GUC_TLB_INV_CR_INVALIDATE		REG_BIT(0)
> +
> +#define HUC_STATUS2				XE_REG(0xd3b0)
> +#define   HUC_FW_VERIFIED			REG_BIT(7)
> +
> +#define GT_PM_CONFIG				XE_REG(0x13816c)
> +#define   GT_DOORBELL_ENABLE			REG_BIT(0)
> +
>  #define GUC_HOST_INTERRUPT			XE_REG(0x1901f0)
>  
> +#define VF_SW_FLAG(n)				XE_REG(0x190240 + (n) * 4)
> +#define VF_SW_FLAG_COUNT			4
> +
> +#define MED_GUC_HOST_INTERRUPT			XE_REG(0x190304)
> +
> +#define MED_VF_SW_FLAG(n)			XE_REG(0x190310 + (n) * 4)
> +#define MED_VF_SW_FLAG_COUNT			4
> +
> +/* GuC Interrupt Vector */
> +#define GUC_INTR_GUC2HOST			REG_BIT(15)
> +#define GUC_INTR_EXEC_ERROR			REG_BIT(14)
> +#define GUC_INTR_DISPLAY_EVENT			REG_BIT(13)
> +#define GUC_INTR_SEM_SIG			REG_BIT(12)
> +#define GUC_INTR_IOMMU2GUC			REG_BIT(11)
> +#define GUC_INTR_DOORBELL_RANG			REG_BIT(10)
> +#define GUC_INTR_DMA_DONE			REG_BIT(9)
> +#define GUC_INTR_FATAL_ERROR			REG_BIT(8)
> +#define GUC_INTR_NOTIF_ERROR			REG_BIT(7)
> +#define GUC_INTR_SW_INT_6			REG_BIT(6)
> +#define GUC_INTR_SW_INT_5			REG_BIT(5)
> +#define GUC_INTR_SW_INT_4			REG_BIT(4)
> +#define GUC_INTR_SW_INT_3			REG_BIT(3)
> +#define GUC_INTR_SW_INT_2			REG_BIT(2)
> +#define GUC_INTR_SW_INT_1			REG_BIT(1)
> +#define GUC_INTR_SW_INT_0			REG_BIT(0)
> +
>  #define GUC_NUM_DOORBELLS			256
>  
>  /* format of the HW-monitored doorbell cacheline */
> @@ -103,43 +142,4 @@ struct guc_doorbell_info {
>  	u32 reserved[14];
>  } __packed;
>  
> -#define DRBREGL(x)				XE_REG(0x1000 + (x) * 8)
> -#define   DRB_VALID				REG_BIT(0)
> -#define DRBREGU(x)				XE_REG(0x1000 + (x) * 8 + 4)
> -
> -#define DIST_DBS_POPULATED			XE_REG(0xd08)
> -#define   DOORBELLS_PER_SQIDI_MASK		REG_GENMASK(23, 16)
> -#define   SQIDIS_DOORBELL_EXIST_MASK		REG_GENMASK(15, 0)
> -
> -#define GUC_BCS_RCS_IER				XE_REG(0xC550)
> -#define GUC_VCS2_VCS1_IER			XE_REG(0xC554)
> -#define GUC_WD_VECS_IER				XE_REG(0xC558)
> -#define GUC_PM_P24C_IER				XE_REG(0xC55C)
> -
> -#define VF_SW_FLAG(n)				XE_REG(0x190240 + (n) * 4)
> -#define VF_SW_FLAG_COUNT			4
> -
> -#define MED_GUC_HOST_INTERRUPT			XE_REG(0x190304)
> -
> -#define MED_VF_SW_FLAG(n)			XE_REG(0x190310 + (n) * 4)
> -#define MED_VF_SW_FLAG_COUNT			4
> -
> -/* GuC Interrupt Vector */
> -#define GUC_INTR_GUC2HOST			BIT(15)
> -#define GUC_INTR_EXEC_ERROR			BIT(14)
> -#define GUC_INTR_DISPLAY_EVENT			BIT(13)
> -#define GUC_INTR_SEM_SIG			BIT(12)
> -#define GUC_INTR_IOMMU2GUC			BIT(11)
> -#define GUC_INTR_DOORBELL_RANG			BIT(10)
> -#define GUC_INTR_DMA_DONE			BIT(9)
> -#define GUC_INTR_FATAL_ERROR			BIT(8)
> -#define GUC_INTR_NOTIF_ERROR			BIT(7)
> -#define GUC_INTR_SW_INT_6			BIT(6)
> -#define GUC_INTR_SW_INT_5			BIT(5)
> -#define GUC_INTR_SW_INT_4			BIT(4)
> -#define GUC_INTR_SW_INT_3			BIT(3)
> -#define GUC_INTR_SW_INT_2			BIT(2)
> -#define GUC_INTR_SW_INT_1			BIT(1)
> -#define GUC_INTR_SW_INT_0			BIT(0)
> -
>  #endif
> -- 
> 2.40.1
> 

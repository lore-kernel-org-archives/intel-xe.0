Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC7AC64ED9
	for <intel-xe@archiver.kernel.org>; Fri, 17 Feb 2023 20:23:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99F3F10E2F7;
	Fri, 17 Feb 2023 20:23:19 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1231810E2F7
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Feb 2023 20:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676665398; x=1708201398;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tyCCsM2VAW7kvcd1AmCocWDGN5cKoHM8hfKjMnWzR44=;
 b=c7fXbhSP9MugMqH/eETSDB441M4yxDFOzZY0cGMBK9d+lultb6BAUHPP
 ntcQvLv0g8wsYG7hH0QHmOcG0mJ9PdlQOi4jLwAN5ySy5AelpUL5mQjFL
 HEIQ5453/4iueVemVh1yPUoJpi9TnqFWfOmhcUd2Z3N2wIv+lxVzMTs/J
 sqOkMo3wdcugKC78IfHPEctKMrednuDP5GRJmBT02sflzcJmxKn9YTEl2
 VDp8uk4dHA+IevaLVDZkT1JK/TK7F904WHgrbz20YWa/o+nXVaHU5sbIV
 N/feyYoLAVSjR/YxZ2GV02mEMZGk+5AgZgYepW9KiW9P/G2UcLsJMAqrA w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="329800620"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="329800620"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 12:23:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="672704421"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="672704421"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP; 17 Feb 2023 12:23:17 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 17 Feb 2023 12:23:16 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 17 Feb 2023 12:23:16 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 17 Feb 2023 12:23:16 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 17 Feb 2023 12:23:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nwTlyynPmKRChfaS/XOxYb6YN7RyerInawb17KyXIhxuLFUqy1l/LF7AiPnPfvf3j/c3Lkmr2KOd9bO0RPLvBWnRwoeRXLuov/SFAcTYDOxc0jwTCM259CT3xItxsPdUDOi56A7oqPP2vLPPSJ33LlbOoxGLz6bnVVsB0aFvHQ1KcSWi+J3OSP9FXXcH4Gsrnz3/+YE7ZkvqjxY2IfTvDKN2uCT7b5KyVoNxoMGdK06JnPx67ASnWVY4WcVu8FCqEpDoyXE8kGlzhmSGo7DneKyraHDbUnXn0b8bVKpAkLewfAw5EUiBuC4+rk57NNFiHfgFMWUyKMrE+oQDSezo4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=arlZV9ViVvXTO76NV4ISgD1JVAzzS+Ui7GhdEBZE0SM=;
 b=bLdvGyfKlm8RblJ66YR+ajUDPuqNyJS7i4FZgW2kzVlxANTQ+ISqoRX51EwXz6EkFje1bCXGyPCNvWYQ3skMaPUF60f6uxS2T8Kb3K+wMzKVi2ARFis190llfpQlwHydbqCGlKKGHY6sF8ecraCA2qRCMJubV/tThwrbKelnx5Wc3b448WsO6gkHtnaWQXl0Sd4zVH6bjSUzZxMHa26g+m2zim04abi61rh5Ss8AD1zhS0PAMOEQEuCnNIzNlixFzGlWYBeKUCGKLTeK7GupHWEOc/U8ZD56Jtn6OGujBohYRkgHGfHpMwrC+blz1lJIdfqcReUDETUaHI+qz4nKYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB8111.namprd11.prod.outlook.com (2603:10b6:806:2e9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.15; Fri, 17 Feb
 2023 20:23:15 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%9]) with mapi id 15.20.6086.024; Fri, 17 Feb 2023
 20:23:14 +0000
Date: Fri, 17 Feb 2023 15:23:10 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <Y+/iLu7iKuC1jMDb@intel.com>
References: <20230217005226.106499-1-lucas.demarchi@intel.com>
 <20230217005226.106499-10-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230217005226.106499-10-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR05CA0074.namprd05.prod.outlook.com
 (2603:10b6:a03:332::19) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB8111:EE_
X-MS-Office365-Filtering-Correlation-Id: 670836b9-319b-4505-ceda-08db1124cc26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xMapeclHu965K1rlAVUc0zc2fDytfgG74jO19BVntTKe2xohkfjz36PAQIwsnbPEbwRrYZtX/I8YgM08vRa49m4FzchVOrDrrnsD+PdSDoTHw89/fQBBBUv1c8Ryfuj86SBEFzGQzYUSF0NFdwWdLeKVGv/dKZppJrARxsLdsupm+CXGeMk735NM0iwDhLAHCPqFNWBmtvlyduiasucM1+54g6wqtR/kqaE0hlEA+/+8+BIX0OOpws7O6ljmDZENa/DVaHb9lRy+z/XM/SsPGytjJB4dIChw+q7rtS7x78BSsPF2n0B3jLESCOzV9y6dcXnmpU+t5qR2AEKsWXLbLymzoq+mOFQaqN+HoApiCa5ySTIO/ZT4S0VTn4OVIsui3X7gJTtbc7IW7czbDIu+QuLPjQS1uNnIS2jYm28k4LbkCDkgKypUOoQVHZSp/cWVLFIPO3Fyo1xESttBL+z+St7s1eYiMm9zJRbnjpMD+Pu0PSdkn/gnyW4eayNIf3I/LEFsCWPt0ofcsSQD331lTOhEKV6JfEXwN4dhpjlatg7cskosHY65z2OfY6+yQkfq9EH2zkTjzCZwykQcYXuJQn5vYlOX9+Xxw1wskPpZ6a6VV+auE1mDv2hNAMDzMUaPvkNbkTRPahGMvSyqVoj9wg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(346002)(39860400002)(366004)(376002)(136003)(451199018)(44832011)(86362001)(82960400001)(2906002)(38100700002)(6486002)(6512007)(6506007)(186003)(26005)(6636002)(54906003)(478600001)(36756003)(41300700001)(37006003)(66946007)(316002)(66476007)(8676002)(66556008)(4326008)(83380400001)(6862004)(107886003)(6666004)(2616005)(8936002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?byJhIh1cIxRNLbaN9ed4fyO41TO/T8x3WMq0BOeXFPhiyT1ppfshx8nbLHXZ?=
 =?us-ascii?Q?N0zoJnc5mmU5Nv/mFLyiNggI5f8QertPzpS5Xh2cCdsrCIaCHHwmUeKagMIt?=
 =?us-ascii?Q?PMBucjlfXEp5727r1ZdwNQx5xyIEB+3a0aeKevXh+iHBH+pmsIxDGbeyTs8d?=
 =?us-ascii?Q?tBUzwaxTWnoHNqpVTwmCs4liEeBnGix3DLhJfZ9Bi4TRVX5beHZQCBX2h+hV?=
 =?us-ascii?Q?fLFv7ZsfD6xAU3yfNezn+0n4le1Ch1avLeKzfYRkvIwP+MeBpqGlw9dx6mho?=
 =?us-ascii?Q?IXnn4QxcxxHnNftNVlzn34JQK+ZsF78Hbz6VaXJDgAqMcX/ZWtEFEtumA5Dk?=
 =?us-ascii?Q?FZeCSwAOE2UoF4fdWQBdo+bLnxNLYRJINdhrfvC1qw5uY/eLZFvvFauoZhHo?=
 =?us-ascii?Q?apEUwo05Pye1uSQjUt+GJ/KuJuXCJVt4AU0CE71bxA+TCKjaMX/c2rS1ZKd4?=
 =?us-ascii?Q?hl9ghRK+G2mwa3JJ+bAJWfiyhWpVhsn32Vmx/SjM+MP9PQ87dTxIhFDfskhf?=
 =?us-ascii?Q?RD7uSNYUTOs7cWREV47J5CaBSsnODwHLJ26FXzhPzkkuR4nNd3RmYiaZnnYe?=
 =?us-ascii?Q?wcnCSawhyTw2EA44McGsVzCMJrdx4kGQ1Y6ycCsPSzXhq0ciWIyESKY666VV?=
 =?us-ascii?Q?9yvo7hvDkD+fH7COO3PcBTOxSrAVVg660xK+bzX+1+Ff2uvYxZs90Fw4Ozo5?=
 =?us-ascii?Q?9LZecVczjf/euvhidUrgOXKdehJPMhsxip1wbQh3slRQ0eVIEGjuLuiyEGRy?=
 =?us-ascii?Q?KqxNcDgTNbaFjMhrOjyHPvf67HExI/ZD9qDVLQWNjG+h7JjlDruWBiFIoGpP?=
 =?us-ascii?Q?5cx+NwdrtAr3fcxjhCCqCiK8vp3iYCK1HJ7tyapjigLeVZtukLZONpZ4WOzw?=
 =?us-ascii?Q?GRWkwvHPBap2bLcWqhbv5MHw+IQZrxPmKxfe0NbdKTJXztXlq7pB9rchJUoo?=
 =?us-ascii?Q?VpX05/Fm7QUCIuRA+Dt/iq2pB0guPCxhFxWRvoc5B2xs3vzyjP+shTBk7Rju?=
 =?us-ascii?Q?QezBDxs07TtBccXkrmlYzDrVQ1XM3VcbzlBbBxMlLCTTg7xxer9k465Fmbom?=
 =?us-ascii?Q?6u00Mt9YHWYIaRYf3xUpgTSXLmXI9e8MbgiZDV90U9MHU2roPL9ivo9ev7SU?=
 =?us-ascii?Q?A/L/NIgiWb2d5kelyhrCmffAP3BvQKD/mLkc+vE+h525YlLjWq3v0Q+PQXJR?=
 =?us-ascii?Q?ht9qlDxgxBCCrCgLaGNUU6WJv3/XX/56sM8XaS3Sh/52nFiVkyxKKMsbjABH?=
 =?us-ascii?Q?SihaBEr+EwjpMidHSCmVl7Lcnfs05p1e+eeunZsBcyAVghSav6884mQ9Ws4O?=
 =?us-ascii?Q?69XUlxhXz8XHXsPuJF2PyaRJnYOQzFTtz65KP3j7xTnX7qSoKA3wntH/JjiG?=
 =?us-ascii?Q?Xr3v6ari+PIZcmZZEpRYCnf0RSUylDBnGUc8In4XPL7k42nh+lR5zzgny2Hw?=
 =?us-ascii?Q?Ho+veRDU9ii4j+PyQHt4cWn2AMpqsJ0e2VS48ceer7KGf5U7xGNffII+GEq9?=
 =?us-ascii?Q?aQUR3sU3d5sAymSmlo43ozlOcC/KHGx0GGX00yYAIHnineqjCcuu0TVEw285?=
 =?us-ascii?Q?MAM3pDAaS8VMFjycEhNg/CfDzVXp+3Zv0zyKrkod6+x+ic9icdjkujfwi6Fc?=
 =?us-ascii?Q?Cg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 670836b9-319b-4505-ceda-08db1124cc26
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 20:23:14.8396 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5UANNEjdedFtmiUJd6BHzdfa4K4hLhI+SRRtF4XDrJmhH00kkZZu0tYX0duMqt7pcoQ3sWHtFHuyoyICMuHD2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8111
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 09/11] drm/xe/guc_pc: Move gt register to
 the proper place
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
Cc: intel-xe@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Feb 16, 2023 at 04:52:24PM -0800, Lucas De Marchi wrote:
> Move a few defines from xe_guc_pc.c to the right register, now that
> there is one: xe_gt_regs.h.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 2 ++
>  drivers/gpu/drm/xe/xe_guc_pc.c       | 6 ------
>  2 files changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index da40133252fb..ab8c9e51f62e 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -186,6 +186,7 @@
>  #define   DFR_DISABLE				(1 << 9)
>  
>  #define GEN6_RPNSWREQ				_MMIO(0xa008)
> +#define   REQ_RATIO_MASK			REG_GENMASK(31, 23)
>  #define GEN6_RC_CONTROL				_MMIO(0xa090)
>  #define GEN6_RC_STATE				_MMIO(0xa094)
>  
> @@ -242,6 +243,7 @@
>  #define   FORCEWAKE_KERNEL_FALLBACK		BIT(15)
>  
>  #define GEN6_GT_CORE_STATUS			_MMIO(0x138060)
> +#define   RCN_MASK				REG_GENMASK(2, 0)
>  #define   GEN6_RC0				0
>  #define   GEN6_RC6				3
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 0df82defa7e4..3465236b0b49 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -30,12 +30,6 @@
>  #define GEN10_FREQ_INFO_REC	_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5ef0)
>  #define   RPE_MASK		REG_GENMASK(15, 8)

I don't like this getting split from the rest... but I don't have
any quick better recommendation and the movement below at least is correct
by itself. So,


Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


>  
> -/* For GEN6_RPNSWREQ.reg to be merged when the definition moves to Xe */
> -#define   REQ_RATIO_MASK	REG_GENMASK(31, 23)
> -
> -/* For GEN6_GT_CORE_STATUS.reg to be merged when the definition moves to Xe */
> -#define   RCN_MASK	REG_GENMASK(2, 0)
> -
>  #define GEN12_RPSTAT1		_MMIO(0x1381b4)
>  #define   GEN12_CAGF_MASK	REG_GENMASK(19, 11)
>  
> -- 
> 2.39.0
> 

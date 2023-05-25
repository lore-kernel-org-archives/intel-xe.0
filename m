Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA2FC7EE29
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 23:31:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2267C10E789;
	Thu, 25 May 2023 23:31:08 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D09B10E789
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 23:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685057466; x=1716593466;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gKO9HEu81ybZmEKpiRQscKFAe4G7UX/BBRe0ZEZVWRI=;
 b=QzpatxW7AG1OQRZ6Dc3itV2khwODEMkNiEOoPKSUXsfp8L6C6kOnQQxc
 ZYzA8yYLnrCIT/AZPdHfF5IKzjxRo6ya9hKD7VoMG5ygauo3SAwBdYo4r
 w1L9CX0vGRjzLepvJ5LuSGEgb2vsdbjlCqAR7nF8sdvjZKvn/hJlvUVAN
 1QAyLHMXk/0ypKvMK4FHDKKtvEzyLOHtpRL4UM4No57SHFnghJCB1FTX7
 7SDd2zUOTgRtXiXaNZQy+XL/sznjex0VFm6dzZK+KgD3kEC0LiJBcjBUB
 kwL5Dqukhe+xF60xzUTg/lChju3SLmeQk/eHcBDHJ6KReNVVx6db9Cccg Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="440410900"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="440410900"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 16:31:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="682522098"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="682522098"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 25 May 2023 16:31:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 16:31:04 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 25 May 2023 16:31:04 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 25 May 2023 16:31:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n38kWXFNNHiIguuaDZSSIWobWkJL3DxJwiP+2qJVBbb5GYwinAY6aO8/7+2b47GNwDX0fcNBSQ2CCbNI0uceNKSBrVAh8K9rU6oE6JNEw/oR1y7/THCr1M42qp1uVeioEjFY1e27SuIiUUl1hXx0e1FskKdpU41Gei2AqIADN5dhhMtxrGg6c1WqA0H8aqt4zXiz/qh9e4BUN41DwYNws9PqGH32VwN8UmhkSr9MvJjRexE7cge6swCVH7RwdYt8wGanN/3jpqW1fS6WUwojRUCz4s3Rl0K7og0iHxL2XaTbNEkaF4GzuQyPFnEsG3hyx7DN9pUK2cPewyYEO2ItkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fQOM210/ndiMqTDHr25mtI1LbJ4wwqiAxG/IZE+0LzA=;
 b=FabU89X3INdYDfL71PJ12AFlFzZFnZb0rTvi10pb8c5flqAGnBdVHbfJWDsa5ElBfIzeduIkWvBZuHbjXWiB9FDt+/il170DZ2CV+hVNC6Puy5W+1DSokxLl2GmWJ0LcuYSGT5YwhbvSjTEId2uu2RUZTmVpYoysTJz9z4ezDRCRENpyNu674mFTB3sYoTONlKjW7YBG50A7t0lqpQkrWJyLGZC/QXbIV0Bvsllx2SOvJav8+vugsERDoPKXSxxqj/YiS8Ktl80XcudK11cxb4onnxXK4e//II35BH9fztXRnDQzPTEiydl7B5AW4nZ+AVsmkhjd9p6DSfd+PciO4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH7PR11MB6377.namprd11.prod.outlook.com (2603:10b6:510:1fb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Thu, 25 May
 2023 23:31:02 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%3]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 23:31:02 +0000
Date: Thu, 25 May 2023 16:30:53 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230525233053.GG10045@mdroper-desk1.amr.corp.intel.com>
References: <20230525213407.3907094-1-lucas.demarchi@intel.com>
 <20230525213407.3907094-20-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230525213407.3907094-20-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY5PR16CA0036.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::49) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH7PR11MB6377:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c5e3e9d-5847-46d1-f316-08db5d781a18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RDpZoC+ABpgJpN2Jm4wr9RFr95uFlpwczZd1zc/T5oQf0wLX+a6ngA9qpC9HRPiAd2b0qNPBEtIIAwgBTDJ8IaSR78MVQ+bPTjRZ6anXHutSWsLFJdXKxLl569H+2W6z1EtR0YPvZq0Kje6fHoZe2TCRDyThwxspnIhmE63ZGyoiqjgEfRDo896ibmfUqXIjNOzKo2pogsuK0BUAgdtw8Xt1GnpsOpSnUq9veNp40BiNFiLhvJ45tO8lVFUaemwGYKtzR9oac0XnjWL7gu/RXUlaSbU+OjY29Ma5eOUKocl6m99x2ymTaobqSaNTr/8zOEZP06rRTJXukVYEppwFc3oLdYK9U4sFFA4XOg8bxeMEYS3fUejnD82/Ga8H0pM3KKWJaKobawLTGJMWfgO9k2SFdhButLgW/4sCyyTE9aZl6nedJ/hROGnA0BAFPbKJqZjbEDuL8mAp93b4yczk9roEZINX/Q4pdeqrFssXTVs29AR7FjkqSjXcfqZV0VX9SxUwf3NKndjbzCVcU2+g2jjf2NM6EGlley2qCRq8uXbCkOSW0QaYWWdiwURfLxr3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(396003)(366004)(346002)(136003)(451199021)(41300700001)(316002)(26005)(1076003)(6506007)(6666004)(6512007)(6486002)(82960400001)(8676002)(6862004)(5660300002)(8936002)(38100700002)(86362001)(478600001)(83380400001)(2906002)(186003)(33656002)(66946007)(6636002)(4326008)(66476007)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6IV00cEbJCGMC0ic5nJK5XLoCw3D75jGXV6ALYcnp5BycObDc75+iVD3s6q9?=
 =?us-ascii?Q?rj9VRcFaFkjwJ4QlpCzk59HkhCws7y/quF2mMTtioYN/6xk/LXH+CK8ZusMa?=
 =?us-ascii?Q?DoLvTjflXsvQ4iUQ1f5u1pOfzBaweAmHbdHF/Leo1ZmtsnOjhz3EhrhxvGv3?=
 =?us-ascii?Q?38SD/exMA7RDKLtTXL9U3i4lCGfSQMX5lnkMWXbWNeWxXDuVTHDgvbrEXhDm?=
 =?us-ascii?Q?ziqw1Yuq4KiR0EVZqEqcwTOJ07qQG98BHcOvcZzpAIFLmcosSyoA9kmWPab/?=
 =?us-ascii?Q?BrQLhCVMkSU9YCy7W90EQmJV8QWC/A4ukQ14hf29LRnIBBAPVp9KL7KDHiDG?=
 =?us-ascii?Q?/a3rBlACxweVM6lRxRtTutw74wpz3hxat4uew2p1qefoAcbkBs1bKniT0jLV?=
 =?us-ascii?Q?wueM6dk6x1UXB3R7rNEWPFTsSwtiFb/1WpOllpb4ssu8yPDZApMxClUtwNyz?=
 =?us-ascii?Q?15rwQgPXWStm+++RzSyT5uDRu4DvPISvA6hP2pcjurYpcTuberA1k40oyzsW?=
 =?us-ascii?Q?uadJMcdxYLwiEjo1mIuvJ6V/NZc5e2reAQmtpf7M+lweLXrN+coYd4TOEG9d?=
 =?us-ascii?Q?fqqRwP/Yz1vkztrgI4FwrgzSo1qTs3tC9sriXD7S6WygaNt2E1NLvBPJHgd2?=
 =?us-ascii?Q?eeQ3I6JL9pn1kpMI0fuFa4R/yYGFY4+ZLVDDBspCSFrVbjiDflA2qA4NARgE?=
 =?us-ascii?Q?gIMMASOu2LJLkoclQrKVSYrdm5hx5eBh9a7RJ8EobLxE0QgDTPP+JWj73LsI?=
 =?us-ascii?Q?ws+UFSd0orszWK2OzYFlaUxteEOGDfK+B7l+6KTjM+NiecIEBtdnSMBBPoQ/?=
 =?us-ascii?Q?WJiSt+B5oYGXslSXSb99pBhlYWHtNzgcPHKB8EczO2/nGkGeMvB0dgp+XpiS?=
 =?us-ascii?Q?DAWaYvXO1NqYTG8nTAiCAbH6t3vQOBJbvGpibRP/HM5httCIFK8ZXe2mMl3P?=
 =?us-ascii?Q?Jm5q0BFIeL7VSv5gMLv2Ei3y7n+/iI+0k5ayBuNQ9xYrFbbPNGK6PW3e6Ajw?=
 =?us-ascii?Q?cHnY5nQGTlaebsLkE2sqahKL01lM3KmDPGzFeXK7rwEErqbDNd64NJjLQNYK?=
 =?us-ascii?Q?GNCv6fYiMQzW/Ona970SyZ/iTtlsWRLNbVjopna0kdvnYfrWs1yQLMOlrpHy?=
 =?us-ascii?Q?suna57i/ITlW5xEamrRdqIhOtoZrnNF4CxRuMzF+sXzDfyHXMJwv5BPS+KcS?=
 =?us-ascii?Q?8lhXGbqocW4LRUMhK1VI5SjjomnPj64tqoX7uLcxKk+gMmdPyW1oHrJDE5pW?=
 =?us-ascii?Q?cKCKJjJdGcttILyY7Zy0rswFYays6Cup7gDGs4HeSpah1vIpoclNzh/R66dp?=
 =?us-ascii?Q?OjOY8UCqTUbqlTidTYCCXAFxwdFKSMHwHZDjiR3faF75Uoe/Hmz6ohVghM3E?=
 =?us-ascii?Q?GT5kbOeUiY9x2/R49IWN+rvaVot8JoHFVRZ/UHciFayoqt6cSPJg1VDsg1sj?=
 =?us-ascii?Q?rHMyCqJGXIdzhY8uJn6UnLhf6I5CVPOJDnj0pqFlo9v8F46fh9S9EUW64bbR?=
 =?us-ascii?Q?gRm4bjEEtXLkJITvBVxDMwAlbxMv4MdbvUA2cHHsYS9nkxrLKCNtn9//djLn?=
 =?us-ascii?Q?kGujnUA5JU0y+2Ajn7IKHRzbEVmsbId+TLAPodTPg1P65UdYq+1nNCedDUWC?=
 =?us-ascii?Q?Tw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c5e3e9d-5847-46d1-f316-08db5d781a18
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 23:31:02.0116 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iQ80Y7A0Q2qEstsdmU5YPKZCRP1WCAtRYsQvSFHhM4SmBjuVDthlLBMGGkK6a0oDACa+ZPQVsAMCDGZ7yJg89yIh1gWQ/OAMAA7LWDlnOzM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6377
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 19/21] drm/xe/guc: Port Wa_1509372804 to
 xe_wa
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

On Thu, May 25, 2023 at 02:34:05PM -0700, Lucas De Marchi wrote:
> Port Wa_1509372804 to xe_wa so it's reported as active.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Workaround database says this one starts from A0, but since that's a
preproduction stepping it doesn't matter if we omit it.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc.c        | 3 +--
>  drivers/gpu/drm/xe/xe_wa_oob.rules | 1 +
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index cc58a2092236..3ed460d3b6ca 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -168,8 +168,7 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>  	    !xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_RENDER))
>  		flags |= GUC_WA_RCS_REGS_IN_CCS_REGS_LIST;
>  
> -	/* Wa_1509372804 */
> -	if (IS_PLATFORM_STEP(xe, XE_PVC, STEP_B0, STEP_C0))
> +	if (XE_WA(gt, 1509372804))
>  		flags |= GUC_WA_RENDER_RST_RC6_EXIT;
>  
>  	return flags;
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 05c821a50680..fc9846af460c 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -11,3 +11,4 @@
>  16015675438	PLATFORM(PVC)
>  		PLATFORM(DG2)
>  18020744125	PLATFORM(PVC)
> +1509372804	PLATFORM(PVC), GRAPHICS_STEP(B0, C0)
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

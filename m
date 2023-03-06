Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD2BCC64EC4
	for <intel-xe@archiver.kernel.org>; Mon,  6 Mar 2023 17:12:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A636610E117;
	Mon,  6 Mar 2023 17:12:46 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01C6E10E117
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Mar 2023 17:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678122765; x=1709658765;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QXgVAVlbVFYg7II/os0ygqDB/Dey+0dWArllDhfLMo4=;
 b=ZV24ztG0z8kuSgTH3sCIbvy0xBnZ9GDgjBFf0bIOgZHHAt5cwMvc3qyo
 KqC+be1GyT0BBO/U8p0U6YqahB1dAHHYaXUDhxOOEv9k1v73++z744la7
 xnfHWmQbz4fmPyIFgX1+CEIIjd0E3CwQymADk8lzgrlHKhsPwMe/aIHW+
 GRnoPbyGSHsUAHR3DzwugdKoWM/DoK5p9qdbFyVVZbTZeWteLuuJzaI6h
 WEwGxncdxiWCIj9o4wU76IcGwu46MXjhTl1Xn6pctsmON9fZ/rX1aB0Yg
 3vG/0TB9we+1Ag84Ise19Xy1ObCxju/HAb1qu4fQYBsI/i9I2VJ8YPL/k Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="315269800"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="315269800"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 09:10:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="676228014"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="676228014"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP; 06 Mar 2023 09:10:01 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 6 Mar 2023 09:10:01 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 6 Mar 2023 09:10:01 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 6 Mar 2023 09:09:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f4JDtUKbAk214kcXefeyT48yjNhz3JLPr2+vosGWd9RFGDwl+bhizY6CE+XxMUUkJXr1y3etJIbWa6iMnlFwto+Ii2y5BIWpKnord/5SzvYFiSktvxlFlVQF4enmDiMcsYpgPDgLmsNqNXdULfyvnyLdo1rQNk0clN8rZifQAi77Z608S3lAzcSB4BkWvZhUaTj5wdYKDaqWFNZ4spJcaOMZmdVqYgyRfsbXllMyaXgZ4SQS2VyEWC8A/2qQeRYpeqs5fX+alUgPmEOo+Bb+rOBWpuPHYsmcvRi5xxv7VWHq9IDamLRjZLCumFdl/54EJtBzBQpBjmLolad826YsWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qUH9dM6yssvR3SMXi5RNQRxLHfbj8WOpR7+R5i8Xuds=;
 b=DmsZf99+IVI2ORHWsXo4O6TW5JAQDDupk4ur5rjGkhE1wrhBUOoMwlzm2AF4+e+dSqBdLrw1ZQTkTiYYzm25YwBnBOQ2ikt9bmvwIj8df3Y+5bJSebHAD3lAF3fyHE1CTTs1+Hq5ZzqRZB45g9Ob6iQlZRiy3G7gOTF0fhJWVKEzv8L1QHcKp6+CGYXwhV17z8F3OptDq5DNA8gzKdBtPQXrXNe9uLmOrlhXXjJuScfRznjDK4DVDun5N26sPww83eO03PbRlDeBe9LSvPOH6uak25etGXc3ZIOM/Q3v6Aq8TYO6SeUIjlQURq7W802MrHM2YVLK+kZKikXcLqQCDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.28; Mon, 6 Mar 2023 17:09:55 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b%6]) with mapi id 15.20.6156.028; Mon, 6 Mar 2023
 17:09:55 +0000
Date: Mon, 6 Mar 2023 09:09:52 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230306170952.GC1543793@mdroper-desk1.amr.corp.intel.com>
References: <20230306165757.633796-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230306165757.633796-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY5PR03CA0001.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::11) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DM6PR11MB4564:EE_
X-MS-Office365-Filtering-Correlation-Id: abff2d39-ab06-47ed-140d-08db1e659b91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dT7ARhb/0y6LaMOagnMPBb0MSBdaH2mLQgwz2DzK+92QzYk5vR4CGR595ZG49Kh7u/CmEEHlMVpF1v6pn079GDG6BV7w7srR3wzcYPRzah8SdHwllxvN1tIK/YlJ4x9PyYf4sG5fDkM6Mj41f6fxUAjhGOGL4sAULzUtTn6vkFyerTcvgRma6ym1vydCOfV+y69kxFnsSxvEBkPRXGmJRDDWUSyH0BALV8vvn/RktW0SAZZdpyBU1TROOPT04wdHQCo5PzyT+hJBA5n6yxvaV628TZ7Arv1VoLWVvC8NELFLI/220wjv4sEFtaP6L+XG8yHgbYUFHf84/a/+vvdfflu2VxqpNKe25F1jIArCBHPdmmbYpMiW5SmqQaHFnWpaBRmNPJ7juDe+aL3j2+0jBMHxuNRGxFpPrnYQPyyNxwetsBkhb410mpebdDm7D6HknUhdNXCnPibt62GNT5P3P0MM8a0iuuEVoPRyqVBEkpKij+5m6GJVryoa2L7sorkE77DJCmPSRm3zgymI4QaAoGSxEbWj1g8M3n3+90RqENCfk+p7qaDN8JkMloyFTwTVFMb99G6rfA2KtkxGYSzKPi41ugEuh9oGOsJeqgiEtoA+M2M4OPX+Il1+mftOGqtWZH5peFR/+/417bxv6JJ3tA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(366004)(376002)(136003)(346002)(39860400002)(451199018)(1076003)(6506007)(6512007)(6486002)(6666004)(83380400001)(86362001)(82960400001)(33656002)(38100700002)(186003)(26005)(41300700001)(66556008)(66946007)(66476007)(4326008)(8676002)(2906002)(6862004)(8936002)(5660300002)(478600001)(316002)(6636002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gs4XJnZo3p5eUCwL4DB2/3ETJn2NuYye8FnU8yuXuTWGaC+NIS6QPe6ZiiFH?=
 =?us-ascii?Q?SibdDRYmMfmHBhIoCoKXLZnaxdAQWOOuJ3lM11/gQFxmQQoxl0PVMqfdOqs7?=
 =?us-ascii?Q?FENPgKr/X/wJZHmSS3pHXQMN/6UGbTrnJZYhSFNpHZxZmhRt5ikc0a18sQIP?=
 =?us-ascii?Q?0e7/bMc5mC57m+GM1ub//u5sMDydFpQC76F1hlHomSxStsi1LXxXzksZfr7T?=
 =?us-ascii?Q?ByTnkZAqJEr3wabUMOV+AOQVskuEiO/IeAPx5m/F5/3uLvXD9JlF56xtPPEB?=
 =?us-ascii?Q?3Z4DMMVz9HeArwGpUQLiJS+H3rYgpVPBrT1er3ou/Ou1ipHWIT5ObyFHuHUt?=
 =?us-ascii?Q?TOvYV9LWiy6uMMEPzXrhXweV8/krKtlJ1EZoSRJ4FkAau0h+or8TMMznwiVJ?=
 =?us-ascii?Q?io4LXBeaSKhgFsnQMgHtXgRj7sUpgbqbCz3x6yWqSdykbxaxHsknbygC6x1l?=
 =?us-ascii?Q?dR/OsSqHAGHA0et+3VA77vFD3cC8aSrYgKG/KrvfUtAaLDyPYwfQpiXgp/7a?=
 =?us-ascii?Q?EVtb215GG33Hz0dY2KJ1og6buO70xLPe3YGA93mv9srzefXie81zGEwjB+F8?=
 =?us-ascii?Q?YOeKSCzTbIlBQ66DbgZIKNYWt1u1JZbtHGcIJrXmylrC7TZ/jHHwzMLJG534?=
 =?us-ascii?Q?d4RpfGeujz1hldKEoj/KUWlNN71r5ghCIhk6nfKOjYWtLyvK7Xjj+VFqwKPr?=
 =?us-ascii?Q?dHo+a3tQW/hl4vl6Iu2VW51WfP/HSA6Y1Z7jOMGF1pxfEj3ZLzeoWUCM2AcI?=
 =?us-ascii?Q?j5gWAACYMb1Slh0nfbm1tmAytSldohb0eKAJc49OlJsUxD4SKdCkhrWNmBzx?=
 =?us-ascii?Q?Y5mvJWwhONvZ9KKufDgWVWPemdR07x6K5R+YuxfvK2eBsl/1eW7jEzw4a6Uk?=
 =?us-ascii?Q?8dDa47xz/FdVieZgf4lkxOS/cqg+5vTY+Tge/WQq3ZutbUu9GKOZ1JCM+iQ1?=
 =?us-ascii?Q?s+HgwEbWXKeMusC1HBHzGKEr65pVou8sRDid0dWl9Z6pDZ2EucZ64gsEeHPH?=
 =?us-ascii?Q?xDW5LIEDU5l5ERvU3ErD8ul0JCyTBQZdTUNIcDpErSLvotRZQ8D9UQ3fj4UP?=
 =?us-ascii?Q?rJwio8QRGBqSh40+qH3kZhjLTIHIIboLw1cPmqEJqXNtEeS1zIqA8VEJSFSZ?=
 =?us-ascii?Q?Uw/UsRk0qA8St9PZ0Xtm9EsE44vaewdDvA0DJh+lDIbf1Ch1ggEBzirqzPxf?=
 =?us-ascii?Q?Jl51UiqMO7VmaZ609zlE2dw/scK1bcVesLsj6wjrxELA/IQRdLlnEC+WcZqw?=
 =?us-ascii?Q?ZQwD4LBU3EmNzw6Upf6YXiXKDcFFllMl48ndltalPZBgSSe47WxqShrshSoM?=
 =?us-ascii?Q?clzE30weW56lr6cFLDKQEqnQeWLWEpgCUd6K0kOULk8Zc5fRQG8FPvMUk273?=
 =?us-ascii?Q?nuIEwBYi9UBGkCAr0rEz2fiIiFGEB7521KeBaiEpNM6o8OK5qASLNHHQF8aD?=
 =?us-ascii?Q?yQieSprcwYLHL38SqSYhRaI6go8QC8UEe5R5vW3OGylLts2NuDsD3A0+NPkm?=
 =?us-ascii?Q?Xil4lrz5cl8PpHYUQbmbFM8ZJ5tnEV2ZE08eQ7ox2qeaYfmkgIpgMLj9Ip8u?=
 =?us-ascii?Q?+WVFhEdQZfYfowq08eMtGbc1SPLG4PnrF5umKkBe8vrHpOpOl8CcmQbA0KkM?=
 =?us-ascii?Q?+Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: abff2d39-ab06-47ed-140d-08db1e659b91
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 17:09:55.5126 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1F61NuxJbY3+LtaPzrfNU0cjU6ocweOaYJ6c8UsjMCXEij9tcO01P+JLDaJk4vEMmr4zP44fR+GOKxPvMtLz1FPndr118lYkK4fpfC1q4Oc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4564
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix ROW_CHICKEN2 define
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

On Mon, Mar 06, 2023 at 08:57:57AM -0800, Lucas De Marchi wrote:
> When this register was added in xe for some workarounds, it was copied
> from i915 before the registers got changed to add the MCR annotation.
> The register 0xe4f4 is MCR since gen8, long before any GPU supported by
> the xe driver. Replace all occurrences with the right register.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 2 +-
>  drivers/gpu/drm/xe/xe_wa.c           | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 4d0f09cd447c..3ba2b2978dd9 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -231,7 +231,7 @@
>  #define   THREAD_EX_ARB_MODE			REG_GENMASK(3, 2)
>  #define   THREAD_EX_ARB_MODE_RR_AFTER_DEP	REG_FIELD_PREP(THREAD_EX_ARB_MODE, 0x2)
>  
> -#define GEN7_ROW_CHICKEN2			_MMIO(0xe4f4)
> +#define GEN8_ROW_CHICKEN2			MCR_REG(0xe4f4)
>  #define   GEN12_DISABLE_READ_SUPPRESSION	REG_BIT(15)
>  #define   GEN12_DISABLE_EARLY_READ		REG_BIT(14)
>  #define   GEN12_ENABLE_LARGE_GRF_MODE		REG_BIT(12)
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index df72b15dfeb0..5938e538ba7d 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -191,7 +191,7 @@ static const struct xe_rtp_entry engine_was[] = {
>  	},
>  	{ XE_RTP_NAME("1606931601"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
> -	  XE_RTP_ACTIONS(SET(GEN7_ROW_CHICKEN2, GEN12_DISABLE_EARLY_READ,
> +	  XE_RTP_ACTIONS(SET(GEN8_ROW_CHICKEN2, GEN12_DISABLE_EARLY_READ,
>  			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>  	},
>  	{ XE_RTP_NAME("22010931296, 18011464164, 14010919138"),
> @@ -213,7 +213,7 @@ static const struct xe_rtp_entry engine_was[] = {
>  	  XE_RTP_RULES(GRAPHICS_VERSION(1200),
>  		       ENGINE_CLASS(RENDER),
>  		       IS_INTEGRATED),
> -	  XE_RTP_ACTIONS(SET(GEN7_ROW_CHICKEN2, GEN12_PUSH_CONST_DEREF_HOLD_DIS,
> +	  XE_RTP_ACTIONS(SET(GEN8_ROW_CHICKEN2, GEN12_PUSH_CONST_DEREF_HOLD_DIS,
>  			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>  	},
>  	{ XE_RTP_NAME("14010229206, 1409085225"),
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

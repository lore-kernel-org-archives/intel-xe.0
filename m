Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 791C9C072A2
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 16:06:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 460B210E0A5;
	Wed, 15 Nov 2023 16:06:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FA6A10E0A5
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 16:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700064380; x=1731600380;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2UcbRsQcedwniRWgYF9ta3egpXJ4JtxrX6vwufrTCcM=;
 b=IJuxAGOIEe5bFt1eRu5pV1EeYljNzE6co4fd7T17EDsEnZQ0/Wgh/JLq
 jDga3IHi5u5AhNXPchxejGPIY/9bz/SvLUbtbFZqRPIpzavdshvn4W9ST
 5lzCSHqTiNN5iR6SqjIUuuXrEOfeUEZtFtau4sFIWZxVXuMwg6MaRQXnD
 cZVvMf/C8X6T1ut7+65HHDFcPbPPJgAvnUusRTs1618FGkWpUJ5jD03bh
 k2jCLVu/IErRzAoD23ownY4qmQHQYCjtr4y7LgyRKAIsG0t0DJRzsMg4l
 EA79OzCBHiMhypit4ffKzJqHkw27Jguge66jo6y1x7FZqwQdqu2QfxQc5 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="370247812"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; d="scan'208";a="370247812"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 08:06:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="855683012"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; d="scan'208";a="855683012"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2023 08:06:03 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 08:06:03 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 15 Nov 2023 08:06:02 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 15 Nov 2023 08:06:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JcbTGMwPQWeahAOhWMrlrKANIa1+hkyakgdUzFPQ7xcLC6Gd6Y/1sDJvRuwb+lbNGPAOsI2f1jcst9sA/2IpQ6bA2ycdwDVTV0B0+5xMZp4pbafzGpiVqciW4IMfrz28ZXLdVpKqV8z51RK8eOjBV/8EIok2CYuoPhkdPR2XMjvrPYoX/SqsShL3MgRtGRRRiJDt/vqNyS5IX9c7oaIj4sIboO7N8NjpDHYqr6b5bO43q9sDODiHrqFShXKfcYUpFoRRwqLgOhyN66aWkNi4vOd57tzfCEjEUgPtNf/3fdNRQmj41uxz2BXm0Fns7xofuzPhkKCLvJ5/ZqqaG5xE7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/d2uCmwu+Q636g5NfisqESCq9XYrw9a3icLbbg5p5Lw=;
 b=RAlEwtNCs+ZW+5uletwW6TS3RZbQsBxHn6UPefb+tZUctTT63HVHxheTnmZE+CO/+86A5PkJNCSHBppOCfPBfHTRWaIS9pQTONKxcaBCe9pZ6X+18OCsl8rHXt27xqrn2Q0loJqNtSePsrnrX5ySZC+XKlGO2NeBsSCdzt50VuCIYBZP5EnS/SMaB+DXsUlVsXJYkyo1r302n4idsVOaRtWrKvg7RKFT3csU2BHZypeS/4Yw/RBAmqj9jQe6KPGIaM0Sp3vT89WLAmbRleaG4CLPWo3luw0dU5HdPvmhX+tj8BTMR4tv/8zcQ+eAgSOD8xzNoHZhNO1EQwG2t/EZgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB7592.namprd11.prod.outlook.com (2603:10b6:806:343::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Wed, 15 Nov
 2023 16:05:56 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::1c7b:3943:33a5:aa9]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::1c7b:3943:33a5:aa9%3]) with mapi id 15.20.6977.033; Wed, 15 Nov 2023
 16:05:55 +0000
Date: Wed, 15 Nov 2023 09:04:40 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <ZVSJqKpfPcs7oGnj@DUT025-TGLU.fm.intel.com>
References: <20231115113748.1949-1-michal.wajdeczko@intel.com>
 <20231115113748.1949-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231115113748.1949-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0368.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::13) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB7592:EE_
X-MS-Office365-Filtering-Correlation-Id: c5e46a60-e5ed-47ec-e7a6-08dbe5f4bfee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HLO2ymDDw6gGOHb0lOv/mFryd4JMGPVi2UcZ31Y1aoCtMo+S3qKVQXh/DW9hGRnmJh+vPcKxAbY/0zYNOBt/PNjoTuXxzIQdJZ/vpECbtZCXyRKl6oiuYgsR1cMPB/KVYpkoSulDJI2anKQElWHpXhn/emqbAUmnDYJS+o9HkOWQr1bqhuPQDW9FwCLCONbLh8nwOnX2/G4YB4nXl/4Z00R81w5LY2HcPH1m69+0XXt9nUNon+5S2cxZ+CJpccz2pbh0YNJme0Ek93tBYAuvQVbutt4Km+gh4wI+9A+6nuTxdv1VilRqIQJ+cKrT7c8W7TFQo1+TMf8brCdDOvlzP5XU8LO0zk6bsWdX/iPm6TUZO2ZVAf4c0O7v3Hg4wUCnDPykyBbLZL+D3fg9+vixLvgL2W0SOn7TxllovQ793qka3/xiav3uljq2IFPibPMOU4gw/wF41fqWbqLP7R5RKy6JUrDBTSKLC2CDbJy3McvyjcqaH3dtLXG3QU5BSt/X9oEK36+ot7f5g6we1ytbkmVzfBvj7XV2grQMvQLRsVENDUmgYrn1+peZnBQxHi21
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(39860400002)(366004)(346002)(376002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(41300700001)(83380400001)(26005)(82960400001)(38100700002)(6506007)(6512007)(478600001)(2906002)(6486002)(86362001)(5660300002)(4326008)(316002)(66556008)(44832011)(66946007)(66476007)(6636002)(8676002)(8936002)(6666004)(6862004)(4744005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dA/Yrt03A6TZdA8/MzpaV7voNM2jke1tepscMGpt1T2MnsbikG3wLHYKTiW7?=
 =?us-ascii?Q?vaICGbvP87rZqknnA5wH31Y79BFUwczbIH77M+bHha8WInO1QpUlUdVQxBUj?=
 =?us-ascii?Q?CHtfi0kikUT/q7cuc9OMAbv1ksuJicakL/3IVKRsJNhtVihx5Y64l5nL4HYy?=
 =?us-ascii?Q?JYeD8UuDfcWXWDh1OMGJng6GQlNHqAohC7JS4bpO+aAH7thXgcTBeG2IqaIh?=
 =?us-ascii?Q?q8xOGqXBXoFs4K9gZm97rZKlSRealyWMiGaQUKs9yQMXzSlAobY5O7NZ+y5t?=
 =?us-ascii?Q?aNode74XVPs03/y3yXVVBx474kKZyieyByAOo+oVwFvpYb0s9+w3rbCG0b7W?=
 =?us-ascii?Q?iXGnItdjb7u/xGbVumjruKWin5Bqud1kRmn7Dw+61D9s/DQ8Bptt8RxPgF0y?=
 =?us-ascii?Q?3U6vb8Q6u51a0ZJM5q9QfJCrBDJ/ZaDMDlFT1rYeIZdkxJxC7pErOdQD1lkn?=
 =?us-ascii?Q?NDx9KhVCNacMvcarSFDmNglr63f9aSW9IKFy89ahjmw+3CntiRYjr41zRTKq?=
 =?us-ascii?Q?XAbjDpxdfN61hjXwyJVlD+PxeZTKy885/Qu2t6mH1SH9UfXQBil4jElGVNaI?=
 =?us-ascii?Q?6mAh0/Gt7x8l6U7wH6oO/ZzO77ufoTJtSYggGHXGUqj0XzgWkUupJjK9HWWf?=
 =?us-ascii?Q?dq8pHzOgJm7YCXpbyNpbCivdIUvepvShLpiXJs2hwOVDJEZFRBM4OLY5+mi+?=
 =?us-ascii?Q?uXN8icFYZhq90DPXWVXfd6AO7Q9zj9pRGwAYl210DaGw42wokW9rWtW+CNos?=
 =?us-ascii?Q?Ktj4c8jKRIc8FVIeCkXF4ba/6mMnz3rulovvRXoR6z5nr//SOHxaVtH/ATF6?=
 =?us-ascii?Q?Y0zHlukJaMXorDMMyrb630eAFAmxEQaPvjRTaKnWDUzvMM74PU7w8sQKyFKa?=
 =?us-ascii?Q?v1UnR39+DX8e1SjX63kFMWK1Fgg3rhMwg5EIukzuvfijm90p6Eqtx1LrD7uk?=
 =?us-ascii?Q?OdcUi5dc4lBhga6i5c+ucTDzRGCv+DHZhpP3FOJTekGKoDwGJOWoe1n8nQt/?=
 =?us-ascii?Q?9Cxovx30/3qNUm9g1RhEBJFB0jh7vQ5/nGrsJwHUqCpb0DiIUqH83esG574p?=
 =?us-ascii?Q?xM6AWUbHo05GV4+IpmkfrqpvjrLdlQ2dbOlTdG67RZzkF5nt3CugeuGJOGy2?=
 =?us-ascii?Q?2BHubVMrJw2CN301KAsZhail6uWD19TZr4zjxORERc2dszgstmN/P7LWAdO1?=
 =?us-ascii?Q?+uXMnJjkFE5Z29wXEnCpjZr41OraJf7TRPIpdlnQdpANdrA/GOrEbNlRIleL?=
 =?us-ascii?Q?DZpjHiYY2NKZHSyJOnMSnl9iVMX9cYCSQ95sTwgL8injvbqeJY8uJutzkO54?=
 =?us-ascii?Q?l4hV+F3S1tZ5OOmQoQor9v+7dcj19oz67KmbdaYp5THpoCDuAvjx/+Ul/8tY?=
 =?us-ascii?Q?Nc980LeIki+7b8dX7Q+wrFFrulzANH+wBQNI06US40YQmtRQOV3tpfACcANL?=
 =?us-ascii?Q?Owtzy2uiGM8S+j6h9idDHw/ShP3KwxWXDPSTNboJ+KN1DKvjkCvabq0E+sjo?=
 =?us-ascii?Q?jZ2L2UBrTLV6lmG3qUcczSLcgYiyrm/SUIJw2K2RHRxx71Dpl9d5+lJAgJrT?=
 =?us-ascii?Q?hLS9gAulhAyMLte4VA+7vsicqfoR4oSlqWj2BCSB8mmrDAdm8Z3LTRZRxcZN?=
 =?us-ascii?Q?HA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c5e46a60-e5ed-47ec-e7a6-08dbe5f4bfee
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 16:05:55.9303 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SmTEUOaWDXkHyB7jKXVNcYzSCUcW2+f1f12U9karNB/6ZSGYukSNBOPC8oTmlANq80dElg+JclcY9zFBpSInoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7592
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/4] drm/xe/guc: Copy response data from
 proper registers
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

On Wed, Nov 15, 2023 at 12:37:46PM +0100, Michal Wajdeczko wrote:
> While copying GuC response from the scratch registers to the buffer,
> formula to identify next scratch register is broken. Fix it.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 84f0b5488783..ddbe64eb0f3b 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -715,7 +715,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>  		response_buf[0] = header;
>  
>  		for (i = 1; i < VF_SW_FLAG_COUNT; i++) {
> -			reply_reg.addr += i * sizeof(u32);
> +			reply_reg.addr += sizeof(u32);
>  			response_buf[i] = xe_mmio_read32(gt, reply_reg);
>  		}
>  	}
> -- 
> 2.25.1
> 

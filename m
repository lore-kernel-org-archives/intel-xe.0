Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46633C64EC4
	for <intel-xe@archiver.kernel.org>; Thu,  9 Mar 2023 17:37:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF4A510E1C3;
	Thu,  9 Mar 2023 17:37:47 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 196A710E1BE
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Mar 2023 17:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678383466; x=1709919466;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=j0+VY89LCXICpSHKt5WtIr/TGaNUKKnQdpr1FvL7hYY=;
 b=jrFS850F4h69WhQ1cDX6v6kyeLG/K+EskC/hF26NPGbt8UVCd9McbBsZ
 tLkQlVKaegBh5fROWnHEJtATtndmcZJQmnCXrZJy5BHyYoYM5sA04Lgnp
 jJk6Gt0SLV2WWKWvJajbLcFC2YwVrMoS85EuL/EV9sOtOINHhAV0bM/aO
 HYcPRO0cUYw8tIHEV7oZPmme190+HO851ujPnPP91zwIy3hZ4Kna5zyF4
 5vMAJYZ9BRrlhEt6/ZgL5537xLFb6Pzt7g9QEuvNs5e5P6erW9QqGN3uo
 bHDbrusX0B/dsFBBzYBcHU++haH0yqw+n4O67TiFuYVZCqmNM2QU+9UJX Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="333989500"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400"; d="scan'208";a="333989500"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2023 09:37:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="801246530"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400"; d="scan'208";a="801246530"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP; 09 Mar 2023 09:37:45 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 9 Mar 2023 09:37:44 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 9 Mar 2023 09:37:44 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 9 Mar 2023 09:37:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c7IQrfmyD3B0mi84DVA5J5b3y3huRNGMEGuCb/RfPfzzeOQJnOY44R+gsW3ob1PQhgGvijWWWhuR/pIwA1LKP2aFZBmqgnIwkGPUOqLoMvxl3cqg40KFBkadXsD7+aedo3vtakzOy28rtmTRwITTXwEgac/xGceyyVsYgKczX/U/YQZ3C5r2Mb+RdCdfl/ACraqdD82zKAjuDknLkDE60VZ78MCQwhIgjQCAetKUk0taCmG7Q/3W4iHoSV5mUPDuYJObEb/Px9MkS8MviE2hS6QUpLtvnol3TPAj1GVdWI4wpONYa9/g++UvYaY1Vw9qsn3Q4Z1lxgLLrev5i6pc8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xaWcx5BTP+nRk5bC0xQ8EqTkBxVN7PB8fhl2ff+sfuA=;
 b=LcozKCRw270df7KqB+pBUGTB2cvyxZh5JtEMyuyMlCKkFtWeNnnRBTjL05/uoA1GoCViYJysu05VF+Dcb20SznVNPcLZEbWyVs//e1RweOoamJjRnhvHpCD9VTjbBggJJeLW/99YJAyX9kSUw4p0w29PzKp9nHdw+JCz18EzJ7mcOWTBQJDjhn7LnkogA0ldeAybSv/avO8UK5dfSH7kZIJ4B14zee9BPCno43G73hTwh8pODbO+W7v6+8Fo8mkeb3Ljl6qYGU7MekoNHwC/IFAjB7XIx/Mgd8zuYxdUEOgQ/Crtp2zFnhxBYMtr6El55bzh2SpmpscQgktneqLoIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH7PR11MB5887.namprd11.prod.outlook.com (2603:10b6:510:136::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.23; Thu, 9 Mar
 2023 17:37:37 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%5]) with mapi id 15.20.6178.017; Thu, 9 Mar 2023
 17:37:37 +0000
Date: Thu, 9 Mar 2023 09:37:34 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <20230309173734.GA3408186@mdroper-desk1.amr.corp.intel.com>
References: <20230309122133.486044-1-jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230309122133.486044-1-jani.nikula@intel.com>
X-ClientProxiedBy: SJ0PR03CA0262.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::27) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH7PR11MB5887:EE_
X-MS-Office365-Filtering-Correlation-Id: d2640677-1e4c-4200-636e-08db20c4f943
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Pq7W7iMWVTgZYMS+wuVi+kPTpXG+q1HHkWqyww3ewWJIqqefsQR2Y5tT7W2xIVmifxik5RFTVDFb1LHzTXEeGrTxPgfv0zx7WwPORQ9vkiRkPIZcwTvNvjkJOqC6hmo8cZCjHDU5DkAA9pDAyhRF/NqPCojVTtRRtETIOomujYpviI46VHaBVRl7/JNyPQ+6MqFRXFsj1tgznuw1A3lr27C7FGnF+EZQ+D/fqSEvVmUxlyVrjQN8FV3nNkFqhnh+YPC2erBjBMangQCfsUa3LVW05Tc63jrGechjjSAFnyjnHwzaj8UCsHJnGSDmOQHheTVeBrtD/9zTqHaN2ytXIS6alGJhbhC9LctX3OD21KmcS6rvbY0w7wnwcOLYk2S02P9Qr6dVLsR5Lq66tFVJQYodjzi+QMIM4gXRl+nOrdlMifJISoanpF9sDoloMbfVk46cyOiFJtOafPTUAXbVVYAAy52buuQOF7vCpKrNGphG/loK0HcxOx9/NWZqJZN5Vcmdalss+LHodD0WZzxtms4UiOUhXe4aTua5uMUu8tsio7pRTAWWF8E/3QqtaRBmrrYk78YWEYvuBPDkKxMmJFs/CqyHTPeTtxyTtIxKHzkfSCviCygc/qDNrvKmob65QgH9WIz/Gtj/xO0tTb9BKw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(346002)(366004)(136003)(376002)(39860400002)(451199018)(316002)(478600001)(83380400001)(6666004)(82960400001)(33656002)(6636002)(38100700002)(26005)(1076003)(6486002)(66556008)(6862004)(6512007)(8676002)(5660300002)(186003)(2906002)(86362001)(4744005)(8936002)(66476007)(6506007)(41300700001)(4326008)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RqS5LYDui/3a1dzqcdzR6ESnhHtdiZ/zhf7RwBoyilLlzBXnNF6nJSsXS+KB?=
 =?us-ascii?Q?dWsOgrLNpZX0N1laUte5W7CqagD5/K67zzfwMxUuLYPF0V8f1Q3FAxJr4uJ2?=
 =?us-ascii?Q?LRn2WhaeDYBk+SoAd5yoiwmqfRNjfoG6dKo9h2ZVy38q7M0LEiJKq/Q9IWcu?=
 =?us-ascii?Q?OXmpXpgbhNXelNkI07VxzD2LAfoJMK+/sXPsPy8J8pIHhleLlMjIr0ZfQp8q?=
 =?us-ascii?Q?rJCJKQwqYzVJwdDcbdW8O5VI3FMNr+NuFigJdxFCoICE4T24mIwWQawGwFnH?=
 =?us-ascii?Q?uV569wgcR16zlfanqjNdFOeHWfImpto5e9CpxkXQGSVicA2JpSCBdyXNT35B?=
 =?us-ascii?Q?AiNA8UEJfKWqa2O5TiKTYJGdzBjkTE08yrF63RSq9KGcb4BkvR01ryJhq3JT?=
 =?us-ascii?Q?M8Fy0m32k9u5LkWWoaMUqKD+2ox5VsGx2T2y2kmoPWnREEB/ZJBIT3lJDeBy?=
 =?us-ascii?Q?D+hPAeks4SyauqPNAkikfh6Nyy6B10dpBSJIhGu7inCm/EV+0cP+Qze7R1wZ?=
 =?us-ascii?Q?E4ImATA0qoKXq3rcszoqHtWgIoBMRxIc9VauBCLw4wM3tRlcIBblBPphRCFH?=
 =?us-ascii?Q?nON3MqdFRtCrngFdJ1Cltb2CDREZo2px9ALdlSKyJRb5ftiNHSoCU+9DLUY/?=
 =?us-ascii?Q?S8vY31BHScg77yTCGMG07Tc5tiQSh3/NOy7++Dr1BUcSLHq0ca7NyDkWP1M2?=
 =?us-ascii?Q?04t7LOAEt96Hf6tjf8YtVtVAFl4PAqqLjqCbnRYuGhmJqy1uKupBTBicFr/1?=
 =?us-ascii?Q?Z5MC5q+AnzXuLMHmd+iOzukk3x+AkIIsBZfzAlUEuqYx1+1oDayYCZfpgeY3?=
 =?us-ascii?Q?77totnrc/xiqLELkdNRZ85hBolG5HHvTjNW6W7h+zximwYvvcug6D24jNlJF?=
 =?us-ascii?Q?+CTxJ1ijBRF1lGaiIoJzbZOjPyu7arcZDwmsaQS2z/gnNxaS8Qk6k1xFFf4r?=
 =?us-ascii?Q?A/OTZTPyVyNuOjBkgstJjmngavU499ZaRR0JDWHP3kAvTOTF0ddzfODndSad?=
 =?us-ascii?Q?opINYQtQj6JaL/kxVyVkuFkenjuxT2HapHCy9ekWVV+GmrHd6uy5xF4rosIT?=
 =?us-ascii?Q?cIb2GHP8bqfKAlBz0bVblV5XJARUZQ4kYHs43qCxqEn+Y9OSSItL58AmBYN3?=
 =?us-ascii?Q?tp+FxTbtZ3Z3jSV8l9+6EYabBdS8qgtXfqW24lUKzF82mon3PAbHcTmbNkhT?=
 =?us-ascii?Q?OnND4+/7mnszd9+IxZlnB5OL+UIlbgMRXdUor3nvJU3ZvqSFze4xOyleDJA5?=
 =?us-ascii?Q?TCD66OD3/nEJdpPUxAs7cSaSsUYCCQP1iaS3M5sjqwTggXgOpE8bdI4kNmvm?=
 =?us-ascii?Q?FT978NY7C+g5FLcjqTg4UrDEZn+LLjl/srlfadl2vTN4L8mnc87e7CX0Wv6V?=
 =?us-ascii?Q?J+zWjL2ITA4szMUtf64qumwWh5hcRlG1h+1J4pqdvb6dHxROOsBF0o8rZe6v?=
 =?us-ascii?Q?vsR8GuBihpxXVetY7Tw9CWXrRD67ZHb55BO0yx6S15i0RZJDAZEtKdt+rZ4y?=
 =?us-ascii?Q?iDMMAZVoCXgu4NSigEW1pvPBQ+LDKMnG/Zbav8CnS7GFQTvbW3Qyd4YbI4zF?=
 =?us-ascii?Q?fZ/5ampUWGhMG4VsFNjajEWhHD72h6oF0W2N+qwNEjFhXTt69NSUlWh3upqg?=
 =?us-ascii?Q?pQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d2640677-1e4c-4200-636e-08db20c4f943
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 17:37:37.3335 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jKyrfKnDyqBDsUnqGXRgCBDUsRlLwb1hgJjI+Y1wuOFRkEsTMUiI4fQJ3rH/d070l1obcpRylEEGYwUM821H4lT+fmNK5/lJqndVgQegks0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5887
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/irq: the irq handler local variable
 need not be static
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

On Thu, Mar 09, 2023 at 02:21:33PM +0200, Jani Nikula wrote:
> It's just a local variable.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_irq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index ae2f65c00fa6..529b42d9c9af 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -529,7 +529,7 @@ static void irq_uninstall(struct drm_device *drm, void *arg)
>  int xe_irq_install(struct xe_device *xe)
>  {
>  	int irq = to_pci_dev(xe->drm.dev)->irq;
> -	static irq_handler_t irq_handler;
> +	irq_handler_t irq_handler;
>  	int err;
>  
>  	irq_handler = xe_irq_handler(xe);
> -- 
> 2.39.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

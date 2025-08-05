Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A9DFC87FCB
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 03:35:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FE0C10E23E;
	Tue,  5 Aug 2025 03:35:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HRHltvNg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CABAC10E23E
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Aug 2025 03:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754364950; x=1785900950;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OHP4WMB/0LjQDVVZtwZopCs9VE5s1UJw9b1P8DMcNT4=;
 b=HRHltvNggHDSnfJmm3hiO6DxoThn+UGTg2nFRKGdfARRvY+acy0QnIoP
 A8FsAF8i5Fs97sqLCr+z5mW5245257knycUqSs3jVo1775Bt78Cs0/dsd
 DKZ0VxPcb4KE5NWIzct0Uwhvu4ecvyAhojlm3l1Yuce781dr/EbvaXsnr
 7Uz3fDEpJcQisWhakQWHkeev10LeCs5beZ9ZV50WYo2sY6SXYz21U74IF
 7W6KI49AJDfSyq230GDla8y2OP8MQgKrjCms1r34saMSLo/faaMWKXrBU
 1Wd3uKbsdQQdA/RU2sRGegaoyrktxPWdjYbW1XIDGHK4z+HVkbIGul3Ao A==;
X-CSE-ConnectionGUID: Hj+bu5mGQwOsCadCdUs1lw==
X-CSE-MsgGUID: KwlD7qZ9ShWRnSMU/z+jBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="59258361"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="59258361"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 20:35:50 -0700
X-CSE-ConnectionGUID: waKGGhNOQCGO8iYYwsj9zQ==
X-CSE-MsgGUID: kWYe5/hJR9uWwbukDoGJGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="163596488"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 20:35:50 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 20:35:49 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 4 Aug 2025 20:35:49 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.61)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 20:35:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XIdlGfcMLdTmU09SUdBZR9v1hYGPcpLDjcdAmNSvzLCtoLlHdB4/4qHWYfmeKDsXwwPRq4CDOpnCc56Zr4cF7odcMPTUEbuehDgfVNqhDfoYEzWTiHyb8iVMHQCJdQ2jhYB8sImIhZNYaOfTwDUaeU8jrjLNSDN2Ylpvi91YQIMjkPNe7AvY+hp+IPXInkp5y0fMtLgyTuHCIEF+QBcdgLlc6uiLk42cM2nVVQRBVjhZACxyqdnskxu4uATDWaI5c0rOFguG2aQfp1zA8Qr8PNy3e7+C2B/wHJiezx18yOvfkEIc8NhQ6cCQn4ZKEetPABGLfSjN/aPX7JMXb9lDlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0wMCrE5zxJyogD6heYlOvw1f9LITAFRMV20bh4Rg3CA=;
 b=aRKmctJ1u7fnFPiVHt3GvAhjfzahgL5T3for/qboIWfbb7JVZOUUjPVbpfFmZokdh3CNSk+jUK+c9/3h04zBtQDdyVsNI/09pDvG7wiUJSqJpYbC4uYINGPApw9KG3QyYnrqKuuXXZYHgUep9UNki8L1gO5l7ByGo7G1e1WG9LphN6UJe00ISpLcnfA3XlqOwnRSNqmqtDLyuTOJn0w56cqzKmFveM/oQE27N3MTN1LtCxHoErWsuNFusCgqMowu9O9728qfNreeh05UbDfM1n4ItImlmM7ZscJYIRQkROMbDsBNXDZMhkNfFDFLBk3VoN/Uw+rMORtFkxY0ArvrzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.18; Tue, 5 Aug
 2025 03:35:19 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 03:35:19 +0000
Date: Mon, 4 Aug 2025 20:35:16 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Pravalika Gurram <pravalika.gurram@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <michal.wajdeczko@intel.com>
Subject: Re: [PATCH] drm/xe: Fix coverity issue, truncation warning
Message-ID: <aJF79APhUqUUK1Xl@lstrano-desk.jf.intel.com>
References: <20250804104409.3305071-1-pravalika.gurram@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250804104409.3305071-1-pravalika.gurram@intel.com>
X-ClientProxiedBy: MW4PR03CA0343.namprd03.prod.outlook.com
 (2603:10b6:303:dc::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6479:EE_
X-MS-Office365-Filtering-Correlation-Id: 15071307-db4f-49ad-89ef-08ddd3d119af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?P94kAG+tGmqZDB2KZ0vfttA6k9jOLMs9mOimkgEACZivhHPXTIP7B40EWIHK?=
 =?us-ascii?Q?7HUAaiStE23J1dXk5xBmG7EhvaDS5obXPRK/mQeE5RAQ13Ce4UvKLyyelMeE?=
 =?us-ascii?Q?8Tbfnp2u3mceTq3MQONFoBtqyhOMKLTgIkd7RarzC0AjW4Px0RVKq4KrSa3F?=
 =?us-ascii?Q?06nXCNug7QjOlHVHReSiQSLZxFO5diXHNnlTbKd9UVWPiiNTXSrl/Rxi/STg?=
 =?us-ascii?Q?IE0Yjzk/vOgZV0AWKh5ukKqbSKXNM/ggibCW89qOU6Ztp0leQyecxstXILS9?=
 =?us-ascii?Q?9tTONP9QgquRpsAqf+sV2LNhRZ0fFPBDGK8Drj4mWiBGzSwdCHZk39N/QcxD?=
 =?us-ascii?Q?a5iPs+lgthXrEvRpv+nmo+in7vtvei4fCBZGpkG7oWVcdAb9dbjHES1/MWUj?=
 =?us-ascii?Q?uqenzoV2bKXQlS9lXf5M6YrrXja7eIn65iB904iayy5Vx20X5foMwN41HlFv?=
 =?us-ascii?Q?4dqp8+ETSSOQyNV2LXw1mIiAj+NAhuzyhW9Wgoy2jQwk4pjltDawm4jnC+DB?=
 =?us-ascii?Q?NqEFl6wGO5CJ9wFTqsJH6+Y4eTSZ5prla2APwCh8S8j+wyktlJULFQKHA1OS?=
 =?us-ascii?Q?MFcWPHR0zIz2UKttMRfYnbZ7hQu8rHPPGemhzndjZh/ORfEyBuE+iOnaMc/3?=
 =?us-ascii?Q?pAAaKEnkwIdM3mrQ4eOZgAaIDKKLk8Tn+ji8cBDQl0esQ5wOUzPi1tqqbrxz?=
 =?us-ascii?Q?l9eKJQHuZEnjxYAdK2lCCJhEEJtunle0EqfwDorGcEG3Tr2mEicq1xYhTM1f?=
 =?us-ascii?Q?S4OCtdWRn7noNwuGbT0g2VtjEmqaPkHHCgQxGo4TqAIZZX1tzDc4fIk5Onpe?=
 =?us-ascii?Q?yY3jm1v1IxOhWPsq00/Z3M0a1px/aHMKC7b2bH7X1kcFXx+lUs2H3rxcZKL/?=
 =?us-ascii?Q?I1WjDBHE8Apbhl6QUr7o1/wdw4a5FiQ+tTmDSXDSVpWUTQAtDegCazVzvbj7?=
 =?us-ascii?Q?HEqlAMyquWH1pTxrxcoLKIUrUWiPGTVI8gANl3efaDM5d1O3eUSoJICfRtnY?=
 =?us-ascii?Q?qpKuRkkqeRpc+x7JZegdHnvPjK50wDl84CzNjfvbdE4FQq130Ut/WtasWcP+?=
 =?us-ascii?Q?rIbELb0fsMAio2d2R5nI7rG2Qx9sPKNuy+b5gvxKyBRyfHKXxlAwC7m/wUAS?=
 =?us-ascii?Q?5DZRKG/IL99xIJM03lS2fmoMC570QoUHJmbx8tyhFiCr6eMr6KyE+mhFqFyD?=
 =?us-ascii?Q?SkUs0OCbQHjjRMeTtgc0HqdFMTtxdFc4BGsyeLm/VqmH5XCO02jrLlBqfIpT?=
 =?us-ascii?Q?BYOkcbZ2vmAu/XKhNBySFuD5T2aBECMLX5TvvKCW2ZCJhCMdT3D0+79nZVx5?=
 =?us-ascii?Q?Nv5K1KMyDNkBnYlBfnUQH2JPcXb28fdGs/8aFyboKs4k7C7j9HMxXWd1LlzD?=
 =?us-ascii?Q?B4dW5I6Vzvv36YiVizwqKtBE++Wo646ESxSwt4uqJqYy0tgQJLSysK7xuuEC?=
 =?us-ascii?Q?s5fhT7eiXkw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zlsOkyibM32wE9KAcTv8fi43tmkXOgWVcq3dRDZptQW1mnJdq1Dauh17zFjZ?=
 =?us-ascii?Q?69Y/AA2G+I7kEqVmq4Tj698hSsYiijgbD0eD3VVHQiC+h6u6HZLlzGOMjoPZ?=
 =?us-ascii?Q?a+a9pg1eKayEvXK00eShVi+cW3XNlIeUdzUWQGjwK1ISxyA+dym194n8PIzG?=
 =?us-ascii?Q?AGcwMEhxaOf3DuiMhYFlf+NGjgMRoM1fRK5Ms6Y0dAeNklrJoD8s3nnRSIst?=
 =?us-ascii?Q?CFwryLg4FbXK7e0GioIiVJR5GDbw4gNpq9vgoFimjeuA2BRWbnIJYWZGeZ2V?=
 =?us-ascii?Q?AXyhApCUac6qyW9YpS+jMl8CUNYTyIrbjguGLh2Kas/RT6dbNSo3nmf0Dan3?=
 =?us-ascii?Q?4M1MAFWx1m4JZTlqVgVlB0xAKgD4X0MHANScOel/qKVOtPumYDvsJAB2veGm?=
 =?us-ascii?Q?rXnNPS7q/VaLn+1wMiVhD0bHpkyOGwey4S0Jdx+hSpWX5QNjur6y2tcErbnZ?=
 =?us-ascii?Q?UckOgHHaK8482IKfb7MxxBDh7x1bFZfHpKhZO70jpYdCb+CBWRNj9BA5liSM?=
 =?us-ascii?Q?1kg+QBxqcs6p1+Jz6VrW46FqwXTZnfUzmdoyhdvIHQmRClr7nHtGFSb4gi71?=
 =?us-ascii?Q?2mFeMVy2wz7f6cl2a8tt+ZkPd6nuR/slJjAajEjgwteHYJkcXT6oLv5KrLUe?=
 =?us-ascii?Q?hxn4sl5zMJ9Imu+HBR6LRu9VXn8B0vKjFwfoQIhzn1eoryLCb2xidTIUN9Bq?=
 =?us-ascii?Q?pR0RnjlG/DMircqq0vhodHj6p/whJtJE6Evb6vePkpbYstNx71uVilWLAFOw?=
 =?us-ascii?Q?XihaXPUIDsc4ZS51BMzwrt1MwVeAverN4rFyQPw89zsvZKOYBT//ddDHBf30?=
 =?us-ascii?Q?mnxeFMtnNqQdrLzymssU1jOJcGCJi8N944ac8//re5HKpoPO0hiVbJQfjY80?=
 =?us-ascii?Q?y0kS2rSxBBXHiveXJ/hZOAm8cyqD98osCED74ZP5VCddhKgC2EuK4e5QuWiP?=
 =?us-ascii?Q?qO2k08M75ZUI9piV+kmoLUxqfqGEvI8dCz2i+espAv35F+UvRBQLslNZgT1H?=
 =?us-ascii?Q?nvsO4KyDsFcXlPvBX5a61QOSwrvidKjw0iBJDxQ99vgBKAD2OhOoZRVLoaFH?=
 =?us-ascii?Q?WWBnR/q+HHIIpye7EIs+ZiGV6CBEC9IfE7TKgOIsgt5n2R+u7BrJuovUqg6W?=
 =?us-ascii?Q?YLNCalTTZiCAldLw7UTkPWUMDKMYaEgEuGspepXKUARuNvPmwViiZDc8TAAA?=
 =?us-ascii?Q?YTQuuxMWHdTMLsHl7PiW2sOi4gb8znRBru7WTJ2+YvBe8VQ88xhKwi7uM9St?=
 =?us-ascii?Q?h7A7OKzgggPUxj1c/iLnv+2u/ZPmeCZ5d8FuR72buzDmCKolYjActJC+rp6t?=
 =?us-ascii?Q?6dlQFmD3gOiNhBzDShORpQdkfqB2pmYbMj3KSnIOdnapqLquofg+AahfhGpC?=
 =?us-ascii?Q?zSmBopff9vJtCCqIQnqj0EsLrmETNnP3qzcP1rsBOFS5Ts3C/K4kOP2sCtRc?=
 =?us-ascii?Q?SdN3t/toOeBA7Sh6pkKmo8WEYTBhOZnP7Ewlad0q1Uh/zcQqUtKKKNh7kd8l?=
 =?us-ascii?Q?CHezylHquShzIKIOTQK9zpLLSiFGl+qbraGiGljd7lg42x+SI1EsnJ41HqOo?=
 =?us-ascii?Q?I/LD6Svb1bKETsT3YIkTJoJ+N2nGjp4Sqi7zdfJPnIjGqEBzHt1ssTItopBv?=
 =?us-ascii?Q?4A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 15071307-db4f-49ad-89ef-08ddd3d119af
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 03:35:19.0592 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QFqijVdJzYpDS4DiFRAJo8aiaNYXFzr7Yhu9OXajErpRg/4A8Re+y/ZbDjnduP0lP8Khc6s597887DZnlI0A1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6479
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Aug 04, 2025 at 04:14:09PM +0530, Pravalika Gurram wrote:
> Use conditional assignment to avoid cast truncation warning.
> Set instance to 0 when hw_reports_to_instance_zero() returns false.
> 
> Fixes: 95336cfd5b2ce ("drm/xe: Add memirq report page address helpers")

Definitiely no fixes tag required here.

> 
> Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_memirq.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
> index 49c45ec3e83c..75ddf4eda355 100644
> --- a/drivers/gpu/drm/xe/xe_memirq.c
> +++ b/drivers/gpu/drm/xe/xe_memirq.c
> @@ -257,7 +257,8 @@ static u32 __memirq_source_page(struct xe_memirq *memirq, u16 instance)
>  	memirq_assert(memirq, instance <= XE_HW_ENGINE_MAX_INSTANCE);
>  	memirq_assert(memirq, memirq->bo);
>  
> -	instance = hw_reports_to_instance_zero(memirq) ? instance : 0;
> +	if (!hw_reports_to_instance_zero(memirq))
> +		instance = 0;

I'm failing to see how this fixes any possible static checker. Could you explain?

That said, I do prefer the way you have changed it here.

Matt


>  	return xe_bo_ggtt_addr(memirq->bo) + XE_MEMIRQ_SOURCE_OFFSET(instance);
>  }
>  
> -- 
> 2.34.1
> 

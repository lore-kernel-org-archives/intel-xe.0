Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3144C25B6B
	for <intel-xe@archiver.kernel.org>; Thu, 26 Oct 2023 23:00:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66AAA10E031;
	Thu, 26 Oct 2023 23:00:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 248B810E031
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Oct 2023 23:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698361225; x=1729897225;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=74To3q7p37yEGsRv3/miaO67S5X9fL+o1vVbXkk5HgI=;
 b=m4lf9OV9VAUb3nTFGkreXmA8a9xKZ7ELyvGfji43RdUOAzV2URua85P3
 pSvslbmiuLuGUNCuPSZzG7QE3BT716HUMpY1Z8bLUGDJshEzj2MLthM4A
 N+uzx0hQZgTKzqXMzlxSOekoaym6g+5uMy4ZFYmlGy+2oDAOoDOw5Gbnw
 rbh2lC2ESDJyJ+D82KbiqrEX55ngvLanH048kB2nURpKIYyMvnfi4GVU4
 KZCs9v1ObP+VVJ5pYTCm3EOsYMi6NGJ2zRFBg0zJ3rosC3qki1/PsR5c4
 QGgT0uEQU0WjJw7CdHzaCmtdsdXAPDA7O6AB5Xu9vJU/BPWFP52ZpMska Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="372718188"
X-IronPort-AV: E=Sophos;i="6.03,254,1694761200"; d="scan'208";a="372718188"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2023 16:00:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="735906378"
X-IronPort-AV: E=Sophos;i="6.03,254,1694761200"; d="scan'208";a="735906378"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Oct 2023 16:00:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 26 Oct 2023 16:00:23 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 26 Oct 2023 16:00:23 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 26 Oct 2023 16:00:23 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 26 Oct 2023 16:00:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W4mWgptJnZoBt9QyAatNpDfJAMevC25yUzqWAZZ3Uqwo3RGSqJ09u6gtUTwmJmRtpKQ80w06W3oKPbvyBKGqZoWWjlAQOoI28W04vHm43KAMNSu7sglup77h3wJpOBTe+YsasjYJC0YrevNGYJnG0eVa1eeFZ8mRIu18AllO4xNlFzHBBu+kyMmzbnrxbruNtzqUvMsapvBNHtzE66oSpQkYSLBZjJ/xW2hCuX4UeKyhVlayuEsQ2e0am+mHDpWZnSUqCGaNDEqr1uwJVDnk1hN/DYWHX5XP3WZeXy9KwC2VzAN1gzhhXiqLuXIDigaTKzYXyWeZsfV4ELju8QSTXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AG+Q6s98zvv86z+6mySGbiIszjF8kw4Rn4BmHBlXtGE=;
 b=Qn0D73z1QpFm/PLq/ntCYI+X+6EDeQYN53ufxvF1q1na4kWh2aEUANyn9QlAUEeffcnp2/ltG6I+D7JlAD4m7XUNama/nAPyjCV3D7mFtKca6oPnJY5m7XSlwoeevh7yxmI4891oqzWP1/cMMgwhEL+FkTMER6cy5xJ6AifxcLBHauQe/YFWtAB6rY/fbkDy80gpWUzy15WpufFC12cfGlLuFvzWVJwMFFZc9ARObWPWjf4578ZwCa4UKAMvvd4jIHiFt9NXH+XAhWLXIeZhbtJL99SrWKvyvSws0whie73hXu4bPemj9mk9baXbksFWn6/x8p0k5TLfSFqWTdyrAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by BN0PR11MB5696.namprd11.prod.outlook.com (2603:10b6:408:14b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.31; Thu, 26 Oct
 2023 23:00:20 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::f52d:79e0:1b96:2c4d]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::f52d:79e0:1b96:2c4d%2]) with mapi id 15.20.6933.022; Thu, 26 Oct 2023
 23:00:20 +0000
Message-ID: <f54d6da6-ff35-45fd-86a5-47721022c383@intel.com>
Date: Thu, 26 Oct 2023 16:00:17 -0700
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Andrzej Hajda <andrzej.hajda@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20231024-xe-ups-driver_flr-v3-1-5b7d63b92fde@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20231024-xe-ups-driver_flr-v3-1-5b7d63b92fde@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P223CA0029.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::34) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|BN0PR11MB5696:EE_
X-MS-Office365-Filtering-Correlation-Id: 16c082f9-ed5a-4b63-9963-08dbd67753d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6j/kzbDcc0eHvg09WvRYMWhwuq1sv/HIjSmG13JJs0X4W6Pjm67MAo0umkx4v6uq1TU+XA/rMgDKrIZEGYNCYndAMnmvZYiLBsS5WdL2m+QEPQY+xOEOGvVQssw8Kn/25HL/FBpcRK87MtLAbfufsblYfDEtCREmqPpsOjtT40495xYiClUv9a8qO55MUnDE6R5c+aICbPMJCYnewvVr0Mz/j9EvtvEggL9smsn9JfcTUq4vZctiAfwLvqzUWmpKVQyJhA8T3J6i+ZIDMH6T7RBhhOsM2Mq+xVnRUBZfHszZpAJYV7rGt4Ush69RIRXerGT7PUTg+EM12BUz8l+B1YGXa+kd1bNWKVdX+upZMUK+mcJY43avJTkgeukB0dtF0d7OQL2D8BI8+QdpRlZ8ziahfTIhalWJxONSQSiBkNUkbnqVH35FrrHbUYIqB9YzyiQbvkqpnfdh/EsbXtMWEFD3ZbiZ8EiAQ/LigEBQeNmVeV/2iF5MmwK5hja1UB3+H0ubBCmFMKRauo9bF0FfFdrWFxVvJutIGD7OCLRltRTBA7Yky0CNvcQu+4/J45XCsuJSgto/WouwkkCZPrfRhXWhKUm+PDC2MBar67TX+PRHF3IcWAi2RGp8e5I8Klb1eacj7La2FwVmyhvsH6yW+Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(396003)(39860400002)(136003)(376002)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(2906002)(38100700002)(2616005)(82960400001)(31696002)(66556008)(66476007)(66946007)(316002)(54906003)(478600001)(6506007)(53546011)(6512007)(6666004)(6486002)(83380400001)(5660300002)(41300700001)(86362001)(8676002)(4326008)(36756003)(8936002)(26005)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3c3RURrTEhBQjNKRC9iNDc2akZyMjdjdHRQcjNrcnJUZ3FobnRJSm5pbXJJ?=
 =?utf-8?B?OVNjQml5b2MzczRwOU44N1E5VDJaMVJvTnRUa2dGbTFoN2VwUGJUQnJKZlh0?=
 =?utf-8?B?OWJoQXg3ZGJOa2k0czd6S3piVXdrQUMwR2czUC9hZm5hTkFiVjVjT0F2MFhU?=
 =?utf-8?B?N3g5SzBhVktwVmpoN1p3UWtteWUvV0R0UEtoUTVrR25abzJoWnF6ZHRrNk5W?=
 =?utf-8?B?QWF3UXdRYlJBdHFzMGl4OVpFYnlRMmpWNTAyL0lURnBHdGRIWWJzNkNpZ2FG?=
 =?utf-8?B?NklnUHN1NDMwOUF3d3RUV0Q1djdXMGFHK29jVmdlekV1T0hsWXZ2cW4rYUVQ?=
 =?utf-8?B?VW02MjVEWjduNHovYVdxb1ZJaGNwdkhpWEJ1SEtVaFl2UDh2TEZxbWtxbVJr?=
 =?utf-8?B?NXQvN2VTL1psOGxEdGtOWjJRTkVJdzNtaUtYOWZuYnMra3ViNWw4YTduS0k5?=
 =?utf-8?B?TmE3M0Iwd3Vqb1FOaGNaMkdFSU82WTFhSGltNTVoS09UeUhSMnFoNjMrbHYz?=
 =?utf-8?B?SXB3ZFVpSFBwWHJsazJGMXZLaUZucU1HdzNiVlVQYU1xMHVuZ0toNXdkaVc2?=
 =?utf-8?B?Q20vazMzbTI1cUp3R0ZnaUVGTlYrTEFVenRpNFV4L3FqWlVJdkdQZ0xLZkZQ?=
 =?utf-8?B?RHErcjFjaENONDJlaGtjUGZCNU5XWUMzMlBmbFk1ejYrVzRQN0xBMmNPOXRt?=
 =?utf-8?B?S3JPUWhOR1JNWGlFY1I1bnNKYkMxNWNDcVZYRmF4WnVuTFBCYXhzSGVsQ0hw?=
 =?utf-8?B?VWpIb1JuMWhHN29kbWkxSXBSNDZzejJnaUVQWGtQZ2VCN3hRMW5kcnNublNw?=
 =?utf-8?B?V0hnMS9rSEJhdEtrS3R0ZHZYaVFlbGdWNUlVbGZXMUhzT1FyY3VrZGRKdDJl?=
 =?utf-8?B?NUU0Z3grUkR1R3hKL0ZaVmFVMVVFYkRrTkxxTDdFeHg0N3VTeDNEN2lMREIw?=
 =?utf-8?B?ZFRyK2xGVzR6UFcyRGZYMHhUZXYyUHYwVnc3M251UlUybjFWY2tzQWppamZU?=
 =?utf-8?B?ZXR1L1hCTlpCaHk4akFRaHlSNFFmME5wYVBkTHFRNGhVNjVRNnViYVhYTkc0?=
 =?utf-8?B?Tm01UlBXVDJyRDhWTnJ4Yyt5YmNDc2MrazdqR0twdlBic3FIVDFQSUR6M2hW?=
 =?utf-8?B?MW9wVFJFM3dBSFZUa2h0b3lNZ2dLclV6emNQVUhuZkZxWXliWmVLSCtaQUM1?=
 =?utf-8?B?Sks5bU15TTR5WFVLcDl1U3dSOWE3U1FvaEpjejJEWTI0Q1NGTG50NFVCSnMw?=
 =?utf-8?B?cG5PUGkzYXlqdXpmZTB6YjFMcU80U3VyejFGRGhHL2toZkhRY1BrNkw0U0Nk?=
 =?utf-8?B?dVR0SVU3emJnS1cwR0paMUlkOTg2d1JzaGcrTmUxMHdCR2RkTkhMdFdic3po?=
 =?utf-8?B?eFo1VUVmbGl4dXZxdk9OVWFFb0pLRjQ1L1dZbHhPSnZpeUdPc3Q4VEpHMTBW?=
 =?utf-8?B?LzlXL09tSDlMZWRNSERIN2tGUDNKT1JjWlFhZFo5U3JPVkY5ZThMbDk0anBJ?=
 =?utf-8?B?UGx2dXVBUFF3cURPOTRzRGVlN0FSQ1haNXhpV2c4cXdzTENScm5lcVI2bDdT?=
 =?utf-8?B?Q2Z3dzl3NzI4cjhoMFB2RldHSFNXbnBsUkM2Nkp5S2VySlp2Wk1USmUveEp1?=
 =?utf-8?B?MjBoSFo4djdXRGFLN1dtNjYyN20zL1BhSWE5L3JldGk4OWxsU1VwOWgyY0Zu?=
 =?utf-8?B?bkNXdTBNek9RSGJwM3JSUWk1aXo2L2NIaHhqNmJ4OXEwZDEybW80MzNqbzFH?=
 =?utf-8?B?ZVkrcFZveURpSXpzMmIyczAwckFXaDZLMVRiRkZvc1E2YzVGL3RtQ3B1WW52?=
 =?utf-8?B?elZSZGV2TE0xK1ZIb2lYMWhaSitkSjFDNUs0QWlVNjJjS1ZGRStwcHZuczli?=
 =?utf-8?B?U01hd2xtbzgwbUxSTjBodEQ3K1hLbkxiRGxyRW9BanRVNUx0OFZ3QXFaZGZi?=
 =?utf-8?B?Y3FxQUNWSDhNWWEyUFFCK0l5OTBQQlNackFTUXZOL3dXbFlsRzdyNjJ5eVlh?=
 =?utf-8?B?Vk1WbG9aNVFNNS9ZaFc2S2NYOWthdG51TlNXNVFmVU5EV1BQbWF2eDkyd0VK?=
 =?utf-8?B?T0gzQjZWTFVyeWpieTB6WTVoQ255emhCTHhMZldYWW1KMS9mT1BtY2pLdGVs?=
 =?utf-8?B?NURBREo1K2JOWFlna3BRZWxLZUpkMmxOekU4MUxySnJnRnRZTENaRzdHVEth?=
 =?utf-8?B?bHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 16c082f9-ed5a-4b63-9963-08dbd67753d2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 23:00:20.3059 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MEZvR36Z+7BgOUuNQ/VW1i0G8L4u49LVVVMNDWpWMrc4TfiI9WBTKgPSYL9uOG7cqPX4vBGAMJv6eJLm1qR2WmsB47nh/tVq1Ma+ZIksdbo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR11MB5696
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3] drm/xe: implement driver initiated
 function-reset
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 10/24/2023 7:35 AM, Andrzej Hajda wrote:
> Driver initiated function-reset (FLR) is the highest level of reset
> that we can trigger from within the driver. In contrast to PCI FLR it
> doesn't require re-enumeration of PCI BAR. It can be useful in case
> GT fails to reset. It is also the only way to trigger GSC reset from
> the driver and can be used in future addition of GSC support.
>
> v2:
>    - use regs from xe_regs.h
>    - move the flag to xe.mmio
>    - call flr only on root gt
>    - use BIOS protection check
>    - copy/paste comments from i915
> v3:
>    - flr code moved to xe_device.c
>
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_regs.h    |  7 ++++
>   drivers/gpu/drm/xe/xe_device.c       | 78 ++++++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_device_types.h |  2 +
>   drivers/gpu/drm/xe/xe_gt.c           |  2 +
>   4 files changed, 89 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
> index 2240cd157603fc..a646d13af03ac7 100644
> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> @@ -57,8 +57,15 @@
>   
>   #define SOFTWARE_FLAGS_SPR33			XE_REG(0x4f084)
>   
> +#define GU_CNTL_PROTECTED			XE_REG(0x10100C)
> +#define   DRIVERINT_FLR_DIS			REG_BIT(31)
> +
>   #define GU_CNTL					XE_REG(0x101010)
>   #define   LMEM_INIT				REG_BIT(7)
> +#define   DRIVERFLR				REG_BIT(31)
> +
> +#define GU_DEBUG				XE_REG(0x101018)
> +#define   DRIVERFLR_STATUS			REG_BIT(31)
>   
>   #define XEHP_CLOCK_GATE_DIS			XE_REG(0x101014)
>   #define   SGSI_SIDECLK_DIS			REG_BIT(17)
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 8341acf66e5f92..1b1524bf186180 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -5,6 +5,8 @@
>   
>   #include "xe_device.h"
>   
> +#include <linux/units.h>
> +
>   #include <drm/drm_aperture.h>
>   #include <drm/drm_atomic_helper.h>
>   #include <drm/drm_gem_ttm_helper.h>
> @@ -260,6 +262,78 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>   	return ERR_PTR(err);
>   }
>   
> +/*
> + * The driver-initiated FLR is the highest level of reset that we can trigger
> + * from within the driver. It is different from the PCI FLR in that it doesn't
> + * fully reset the SGUnit and doesn't modify the PCI config space and therefore
> + * it doesn't require a re-enumeration of the PCI BARs. However, the
> + * driver-initiated FLR does still cause a reset of both GT and display and a
> + * memory wipe of local and stolen memory, so recovery would require a full HW
> + * re-init and saving/restoring (or re-populating) the wiped memory. Since we
> + * perform the FLR as the very last action before releasing access to the HW
> + * during the driver release flow, we don't attempt recovery at all, because
> + * if/when a new instance of i915 is bound to the device it will do a full
> + * re-init anyway.
> + */
> +static void xe_driver_flr(struct xe_device *xe)
> +{
> +	const unsigned int flr_timeout = 3 * MICRO; /* specs recommend a 3s wait */
> +	struct xe_gt *gt = xe_root_mmio_gt(xe);
> +	int ret;
> +
> +	if (xe_mmio_read32(gt, GU_CNTL_PROTECTED) & DRIVERINT_FLR_DIS) {
> +		drm_info_once(&xe->drm, "BIOS Disabled Driver-FLR\n");
> +		return;
> +	}
> +
> +	drm_dbg(&xe->drm, "Triggering Driver-FLR\n");
> +
> +	/*
> +	 * Make sure any pending FLR requests have cleared by waiting for the
> +	 * FLR trigger bit to go to zero. Also clear GU_DEBUG's DRIVERFLR_STATUS
> +	 * to make sure it's not still set from a prior attempt (it's a write to
> +	 * clear bit).
> +	 * Note that we should never be in a situation where a previous attempt
> +	 * is still pending (unless the HW is totally dead), but better to be
> +	 * safe in case something unexpected happens
> +	 */
> +	ret = xe_mmio_wait32(gt, GU_CNTL, DRIVERFLR, 0, flr_timeout, NULL, false);
> +	if (ret) {
> +		drm_err(&xe->drm, "Driver-FLR-prepare wait for ready failed! %d\n", ret);
> +		return;
> +	}
> +	xe_mmio_write32(gt, GU_DEBUG, DRIVERFLR_STATUS);
> +
> +	/* Trigger the actual Driver-FLR */
> +	xe_mmio_rmw32(gt, GU_CNTL, 0, DRIVERFLR);
> +
> +	/* Wait for hardware teardown to complete */
> +	ret = xe_mmio_wait32(gt, GU_CNTL, DRIVERFLR, 0, flr_timeout, NULL, false);
> +	if (ret) {
> +		drm_err(&xe->drm, "Driver-FLR-teardown wait completion failed! %d\n", ret);
> +		return;
> +	}
> +
> +	/* Wait for hardware/firmware re-init to complete */
> +	ret = xe_mmio_wait32(gt, GU_DEBUG, DRIVERFLR_STATUS, DRIVERFLR_STATUS,
> +			     flr_timeout, NULL, false);
> +	if (ret) {
> +		drm_err(&xe->drm, "Driver-FLR-reinit wait completion failed! %d\n", ret);
> +		return;
> +	}
> +
> +	/* Clear sticky completion status */
> +	xe_mmio_write32(gt, GU_DEBUG, DRIVERFLR_STATUS);
> +}
> +
> +static void xe_driver_flr_fini(struct drm_device *drm, void *arg)
> +{
> +	struct xe_device *xe = arg;
> +
> +	if (xe->mmio.needs_flr_on_fini)
> +		xe_driver_flr(xe);
> +}
> +
>   static void xe_device_sanitize(struct drm_device *drm, void *arg)
>   {
>   	struct xe_device *xe = arg;
> @@ -294,6 +368,10 @@ int xe_device_probe(struct xe_device *xe)
>   	if (err)
>   		return err;
>   
> +	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
> +	if (err)
> +		return err;
> +
>   	for_each_gt(gt, xe, id) {
>   		err = xe_pcode_probe(gt);
>   		if (err)
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 44d622d4cc3a17..a0094a9326e0d9 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -287,6 +287,8 @@ struct xe_device {
>   		size_t size;
>   		/** @regs: pointer to MMIO space for device */
>   		void *regs;
> +		/** @needs_flr_on_fini: requests function-reset on fini */
> +		bool needs_flr_on_fini;

Given that the code now works at the xe_device level, this variable 
should also be moved out of the mmio substructure (i.e. just have 
xe->needs_flr_on_fini). With that:

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

>   	} mmio;
>   
>   	/** @mem: memory info for device */
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 74e1f47bd40114..9fdc7279c311a8 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -617,6 +617,8 @@ static int gt_reset(struct xe_gt *gt)
>   	xe_uevent_gt_reset_failure(to_pci_dev(gt_to_xe(gt)->drm.dev),
>   				   gt_to_tile(gt)->id, gt->info.id);
>   
> +	gt_to_xe(gt)->mmio.needs_flr_on_fini = true;
> +
>   	return err;
>   }
>   
>
> ---
> base-commit: 4354e27efb78582ee567ba6264c79d0872a3a4e7
> change-id: 20231024-xe-ups-driver_flr-2bd8d10c16e8
>
> Best regards,


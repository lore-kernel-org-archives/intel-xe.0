Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82024C7EE23
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jun 2023 14:04:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39AFE10E0B1;
	Thu,  8 Jun 2023 14:04:49 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABA4510E0B1
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jun 2023 14:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686233086; x=1717769086;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UM92OTTSiUvTmb1fnnnJzbqO2HqfFz9tWSjivCTU+ZQ=;
 b=fgMse1LZ4Z4vMG+8VzWVJ5eEur4IW7C+sFBmraeoBBDF9puV1pf7rB8F
 INsTr1B+EzDGnYxH8XD11DelVUzW7a1z4N6u2NPH1QRFJxy6GCxzyq+kn
 0iayUjsS9aRjsqo0V3A6zbfcrKLbTSSTwx95MPonQIZ+Ia9tNaorBw1PW
 +23zGiGJtwY+5L5sOX4sw9FLAlYEtaQuCRbhmC0QwxxC1A20StZF8h7Si
 vk9pihc7TlG/g7LRnxhrV3EBlPsy7Y+XW1CFsC9GyW36p6EzBfoUyou7n
 blPhmIhltnjzc+OCtEUnOkVE6MiCsA1vq/gRh5qReqh9ZviQ9UXcrFrs8 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="354801945"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="354801945"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 07:04:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="713120265"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="713120265"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP; 08 Jun 2023 07:04:20 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 8 Jun 2023 07:04:20 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 8 Jun 2023 07:04:20 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 8 Jun 2023 07:04:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nMnRByLe4HKFH2GXv13e5G+I2v1nMmqvTGXCWt2b4StUpcPpliRbXOAIRkQg/OtBjo3vdM9JxcPO8VWMOoJOia7qYEKP0+Fy2o/K6XpqAutzganPw/pGdccpXs5I1rQOGx2nlw78xGz+zz9mNVXWcVGZ5BkQSMaEMZXVlfWj+g5TzKiaa+7yfHo3S0cInbdmuGWYQnBij11GCV9h50dQ4pdB52g8ZcdynUOaMy1GJDG8KNxM/J5DVASG1nWRDobFaofSaGUf8OiiLHMLOtwTKCpi5PulWWkr8/OmYb51G8oE4kQHeUh8GQbpAzT2q1xx1wVEaVO3nSCFr1twRbjOng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R40WI2gRJpY1nrW4Sw/081g9KUNPtpOgGIe99JY5G38=;
 b=Tg9sgU4SXjvQGlJPzEYI97Dp4kfGHmWC60f8IzkPIRUK057J8/nVr5KSwrB+865Z1+6WDp2drX1ZoR8HnpcvZ48+Xn8sRIxL99rh9dDkLtt+CInTqaaseGtzQ3EeLljfzfelS9erXcYZIF7UFjFuo6jr60Asb/W36BsiBfwrL1PXJWZ5USiZ6yYqgxEVarRT3FGQoBMFA4wcVZQqUlbY4V4sajTu60ZQtQNzkfcWmsbx6zyctYFeIAoZLEyUx55fTRKq/qmPKG9bI3RaDxgEXv//EYWcmA9yZt60tZwyUDsCBWppUYwd6OhcSdXZwCiwfCqhqa+s44gSqXVsLNTQfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by SA2PR11MB5210.namprd11.prod.outlook.com (2603:10b6:806:fa::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19; Thu, 8 Jun
 2023 14:04:17 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::3fa8:dede:a9ab:fc5]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::3fa8:dede:a9ab:fc5%6]) with mapi id 15.20.6477.016; Thu, 8 Jun 2023
 14:04:15 +0000
Message-ID: <ed287afd-c711-cc44-0688-2e56d2da8bcb@intel.com>
Date: Thu, 8 Jun 2023 19:34:06 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Content-Language: en-US
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230606125057.838618-1-badal.nilawar@intel.com>
 <20230606125057.838618-3-badal.nilawar@intel.com>
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20230606125057.838618-3-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN0PR01CA0017.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::22) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|SA2PR11MB5210:EE_
X-MS-Office365-Filtering-Correlation-Id: 0980b080-dea5-4bca-775a-08db68293e58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e2FO97lyA4DfmPPy1IezD3z36z1zVK2HEa4IaCURSy8HYefByKaEzj3ZrqzciEorcQ5BWgGY/P0ShGYbS42XeJJydeKe79leyrMDdn39/Z8MawKM0MTxaLF3Yikn5hBgezvbTGIt5LPV4CC0/YAVGZ+oUBFPzinwwplUfBsyW6o+9VaXxSw0We98RBVr1AEfi59Wh/E+mEgAYDkqrYb/MiiJodjIDnP1HfnQMNxstu4QSKg7Ud38uD3Dxe2Y4b5pmethlaIrpQ/0DicLgQK7j5RtB8tGmnv/zWMU81gVPEsZkyCO8dOulZwF3YDUaPMXIXu53uF02hUC7bju11h5ewbWvxcXA8TvJESJs9y7I6aa7t5GFbwAElDHXKZhH+XwSwK0oB55Ay0tqBrFa0GFnxAL7CJzhLVhDV+HgquYDFGp7YdOG2J2SdaXNakBdfJuZS6w7mEhUkIiv0+Nu8yVLe5ag4/c79UdL+SrK6fXoOmM6GOdPYRxSTy/xZb4F5QvUIDhWEq05AHl2WsmyuRSZ139f0ZLKdjafccaZDcaDdT2mlzIOVuiAcTm0Ku7PA6tXaFQ1h2BRzHLffpvcsyIYXJ/2BNbMdtC+YwUzb37FlcLxOlcS5nU8kKKURAqhnVpqtQIwm8ElHS0eTh6dGAOnJpNY7qaHwP0/who8RFaSblF/IaSU4oTBHLadJ5vDJQ5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(376002)(136003)(346002)(39860400002)(366004)(451199021)(44832011)(186003)(31686004)(478600001)(53546011)(6512007)(26005)(83380400001)(2616005)(6666004)(6506007)(107886003)(6486002)(316002)(8936002)(8676002)(86362001)(41300700001)(38100700002)(31696002)(66946007)(66556008)(82960400001)(36756003)(2906002)(4326008)(30864003)(5660300002)(66476007)(45980500001)(43740500002)(473944003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2NDYTlXMlg4NTVEandWOTliWjJ6cWFXMlBZQmNpbTRvN1k0VUZORWxIdmQ3?=
 =?utf-8?B?QnRtVGhubDdIanZRdVdmUWQ1NUt4QXY5TzRpU09BaXFHRkdoazRpNGhGSmxw?=
 =?utf-8?B?b2MxRy9zdHZJdndodkRGaGFYcU54aStPYXV3UVVFb0pBZ2JwZkxGSzVPQ0xG?=
 =?utf-8?B?dk5lcnNMa2VBQW9WdTlJZStjeVlHbnZPV01aK3dVM2pGMEFKczBoZFR4bzVR?=
 =?utf-8?B?cUVGOTdjVlJaZFlBeXpvaTdVQzc2OTBoeHRuY3Q3d3pxZURyOXdSK0t4OHJl?=
 =?utf-8?B?VXFiL3JieTNkR1Nvb1hjQ0JXa0xRZmpRWHRhUkFIWVpxNUViejllWGt6L1RK?=
 =?utf-8?B?T0ZPNVVUcU9lSnNTYjNnSTQrT1JtUzBOdnZVVHpjZ2U5cDRDTHRWVXoxSE9X?=
 =?utf-8?B?V0JiMzMyR3RsVEJZcExlZDdWRkZRNGNFMElibVFXK21VY21aNzRYaFNrVW4v?=
 =?utf-8?B?L1d3eStzc1lSN0tpc1RLWlJlZFNSSUFFdTc3cWsrVW01U0V4WjhLUkUvOUoy?=
 =?utf-8?B?bERiaHlTY1F2ZmVXNlZHWWp1V1puUTB1VTdqZ2xKTnFIaDRIK3VLNEx2Wmta?=
 =?utf-8?B?RUdvaUZieGsvWDFvZ1JLNEZ6R2k4V1VtdGJhRDBGZytoUTlwbFRPUy92dmVR?=
 =?utf-8?B?Ny83Z2ZaUlY0dkxuVGdPdUphb2JyR2xJelMzaDArV2dMOHR1VzFVbFZ6bmpC?=
 =?utf-8?B?Nk5iYTNqY2FJUTZtQlZ1UXA1V2psSXNiOERKdkVrOXlmN1E2RkVCL1Q2anNp?=
 =?utf-8?B?SnpKRVJ4c3E5VHJ0Q3ozOEViR2NoRysxRVAzMVBxZDMxQXE2QkZnVk9Fckdk?=
 =?utf-8?B?K1Y1d3lKdmF5SmkrU0V6eWVlYWZiSGhQQ0JFTnNiUG56eTNjVVJjdlBxRDVn?=
 =?utf-8?B?Rm9vVXdueC9qa3c3TVFFNC8yYUtqOUVEcmNRY29EZVFmRlAyTm0vOG1WbG1J?=
 =?utf-8?B?ZzNnTG9Jei83RDZPTU1kRUxLTFJBdmdTOXZlSFhRSmYwZ2plN011aEVoL3B1?=
 =?utf-8?B?RXZzNU5tMUtHaStVRGQ3aDkza0FPVU1PWDBpMWQ5eklxelowV0NEOUI1S0Zj?=
 =?utf-8?B?Tnpsak5nWkx4K3luZlA1bDhENHQ3NmtQNWFzeHFZWVllTVFESUFSQVpZa3V3?=
 =?utf-8?B?czJUWU8vUHFRSURKeEpGZHNVRURTVzlWeXR6MEZBd1MyN3dlSllhdk5FckJj?=
 =?utf-8?B?U2xWdlNmNG9nSTFLc2lKcnFwa2pOU1IwV2JIVTZGckRVSUIxY3BlajZ6dUFk?=
 =?utf-8?B?STB3dnpyTlEwdi9NVjhDR3dmWUhZQTlSaG8wakwxOWF2cWIyaHpHTDhtMXlx?=
 =?utf-8?B?V2o3N0dRSTJJSkxHdUxCVUxoYStkSllxcTJURE1NbWJDeXdDR3h2eHNUYTk5?=
 =?utf-8?B?YUg0WlZUZFB6TUZiMktNbFV0aFN0OHZOQTZCNkZIOU5HWVlDLzc0ZnIxamlE?=
 =?utf-8?B?OTgycmpvRnBiSkl6eGdrY2RBbDkrV2FjRGl1UWtpaU1OWTZCaExoV24rd2k3?=
 =?utf-8?B?aHRaMStPNnZpT2RkcUk4aUt1aXNYQmNGK1Fsay9lZXVPNktrMDVvRjcyN1JZ?=
 =?utf-8?B?S1N3NjVsVmluZkRGTXU2UGJMcysvR1JQc25vYXc0ZEo4VXhqeHV0aVowMW1r?=
 =?utf-8?B?TzMrSFRqTUFLV0cyYS95UWVVTHF4c25zZ3RtbkF2aXZxN0hiTXNIQmIydWdO?=
 =?utf-8?B?ZDRNNys0eTIwOVlUUDZkNlR5b3ZtbFFkcDZQeFM0ckd0bk1YM2dTSUpRenNl?=
 =?utf-8?B?SzliNU41NGJrcUhhMWEyTXNMZHRGenMrOUVNQktDa1FjYjJrbXZMVGluYTJY?=
 =?utf-8?B?eWtORnRGZ1ZEbWljeVJPVEp0b2dGSEx2Yk82TXFpQ3FkUWFUY3BHNmZER2ho?=
 =?utf-8?B?ODlObHc5MFNla0wyYlFCc29PTkh5emd4YSs5RmdaRklid3B2aTlaVnhZMXJR?=
 =?utf-8?B?Rm11eSs5eS9ReHN6V3YveW5XSHRITGZwTW1adnpMTE1JM0tEeFZ1WXpyQTF4?=
 =?utf-8?B?cGdIclZQUnpOVHppdTdXeHFYb296VEtMTy81RytFUzRlYXNYQkxnaEFWQ0h3?=
 =?utf-8?B?SHloUkY2bFVVK3hNS0RWRlJGS2k2WVhuVkx0UTQwUVRDTmVqWGJUUjhuK3Vi?=
 =?utf-8?Q?+RwEB5yNdX8H8XUL+uJzw0BMO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0980b080-dea5-4bca-775a-08db68293e58
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2023 14:04:15.3763 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9t8DAYE7cNmWxKRh9OhkB+A33jl5TCM0sxY7hHUlNuxhvmJ/sCc0G9QW80LiUVhPsQ5r5+SyHBxeLvWqUzE5SA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5210
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC PATCH 2/6] drm/xe/hwmon: Expose power attributes
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

Hi Badal

On 6/6/2023 6:20 PM, Badal Nilawar wrote:
> Expose power_max (pl1) and power_rated_max (tdp) attributes
> 
> Co-developed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  22 ++
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   4 +
>   drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |  34 ++
>   drivers/gpu/drm/xe/xe_hwmon.c                 | 342 +++++++++++++++++-
>   drivers/gpu/drm/xe/xe_hwmon.h                 |   4 +
>   drivers/gpu/drm/xe/xe_uc.c                    |   6 +
>   6 files changed, 408 insertions(+), 4 deletions(-)
>   create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>   create mode 100644 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> new file mode 100644
> index 000000000000..54a7b668009e
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> @@ -0,0 +1,22 @@
> +What:		/sys/devices/.../hwmon/hwmon<i>/power1_max
> +Date:		June 2023
> +KernelVersion:	6.3
> +Contact:	intel-gfx@lists.freedesktop.org
> +Description:	RW. Card reactive sustained  (PL1/Tau) power limit in microwatts.
> +
> +		The power controller will throttle the operating frequency
> +		if the power averaged over a window (typically seconds)
> +		exceeds this limit. A read value of 0 means that the PL1
> +		power limit is disabled, writing 0 disables the
> +		limit. Writing values > 0 will enable the power limit.
> +
> +		Only supported for particular Intel xe graphics platforms.
> +
> +What:		/sys/devices/.../hwmon/hwmon<i>/power1_rated_max
> +Date:		June 2023
> +KernelVersion:	6.3
> +Contact:	intel-gfx@lists.freedesktop.org
> +Description:	RO. Card default power limit (default TDP setting).
> +
> +		Only supported for particular Intel xe graphics platforms.
> +
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 0f920175526e..9d888aae907e 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -382,4 +382,8 @@
>   #define XEHPC_BCS5_BCS6_INTR_MASK		XE_REG(0x190118)
>   #define XEHPC_BCS7_BCS8_INTR_MASK		XE_REG(0x19011c)
>   
> +#define PVC_GT0_PACKAGE_RAPL_LIMIT		XE_REG(0x281008)
> +#define PVC_GT0_PACKAGE_POWER_SKU_UNIT		XE_REG(0x281068)
> +#define PVC_GT0_PACKAGE_POWER_SKU		XE_REG(0x281080)
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> new file mode 100644
> index 000000000000..4ad473e69e27
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> @@ -0,0 +1,34 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_MCHBAR_REGS_H__
> +#define _XE_MCHBAR_REGS_H_
> +
> +#include "regs/xe_reg_defs.h"
> +
> +/*
> + * MCHBAR mirror.
> + *
> + * This mirrors the MCHBAR MMIO space whose location is determined by
> + * device 0 function 0's pci config register 0x44 or 0x48 and matches it in
> + * every way.
> + */
> +
> +#define MCHBAR_MIRROR_BASE_SNB			0x140000
> +
> +#define PCU_CR_PACKAGE_POWER_SKU		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5930)
> +#define   PKG_PKG_TDP				GENMASK_ULL(14, 0)
> +
> +#define PCU_CR_PACKAGE_POWER_SKU_UNIT		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5938)
> +#define   PKG_PWR_UNIT				REG_GENMASK(3, 0)
> +#define   PKG_MIN_PWR				GENMASK_ULL(30, 16)
> +#define   PKG_MAX_PWR				GENMASK_ULL(46, 32)
> +
> +#define PCU_CR_PACKAGE_RAPL_LIMIT		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
> +#define   PKG_PWR_LIM_1				REG_GENMASK(14, 0)
> +#define   PKG_PWR_LIM_1_EN			REG_BIT(15)
> +
> +#endif
> +
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 65e5488dec82..8e248e806559 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -7,42 +7,358 @@
>   #include <linux/hwmon-sysfs.h>
>   #include <linux/types.h>
>   
> +#include "regs/xe_mchbar_regs.h"
>   #include "regs/xe_gt_regs.h"
>   #include "xe_device.h"
>   #include "xe_hwmon.h"
>   #include "xe_mmio.h"
>   #include "xe_gt.h"
> +#include "i915_drv.h" > +
> +enum hwm_reg_name {
> +	pkg_rapl_limit,
> +	pkg_power_sku,
> +	pkg_power_sku_unit,
> +};
> +
> +enum hwm_reg_operation {
> +	reg_read,
> +	reg_write,
> +	reg_rmw,
> +};
> +
> +/*
> + * SF_* - scale factors for particular quantities according to hwmon spec.
> + * - voltage  - millivolts
> + * - power  - microwatts
> + */
> +#define SF_VOLTAGE	1000
> +#define SF_POWER	1000000
>   
>   struct hwm_drvdata {
>   	struct xe_hwmon *hwmon;
>   	struct device *hwmon_dev;
> +	struct xe_gt *gt;
>   	char name[12];
> +	bool reset_in_progress;
> +	wait_queue_head_t waitq;
>   };
>   
>   struct xe_hwmon {
>   	struct hwm_drvdata ddat;
>   	struct mutex hwmon_lock;	/* counter overflow logic and rmw */
> +	int scl_shift_power;
>   };
>   
> +struct xe_reg hwm_get_reg(struct hwm_drvdata *ddat, enum hwm_reg_name reg_name)
> +{
> +	switch (reg_name) {
> +	case pkg_rapl_limit:
> +		if (IS_DG2(gt_to_xe(ddat->gt)))
This is from i915 header. Should xe->info.platform be used?
> +			return PCU_CR_PACKAGE_RAPL_LIMIT;
> +		else if (IS_PONTEVECCHIO(gt_to_xe(ddat->gt)))
> +			return PVC_GT0_PACKAGE_RAPL_LIMIT;
> +		else
> +			return XE_REG(0);
> +		break;
> +	case pkg_power_sku:
> +		if (IS_DG2(gt_to_xe(ddat->gt)))
> +			return PCU_CR_PACKAGE_POWER_SKU;
> +		else if (IS_PONTEVECCHIO(gt_to_xe(ddat->gt)))
> +			return PVC_GT0_PACKAGE_POWER_SKU;
> +		else
> +			return XE_REG(0);
> +		break;
> +	case pkg_power_sku_unit:
> +		if (IS_DG2(gt_to_xe(ddat->gt)))
> +			return PCU_CR_PACKAGE_POWER_SKU_UNIT;
> +		else if (IS_PONTEVECCHIO(gt_to_xe(ddat->gt)))
> +			return PVC_GT0_PACKAGE_POWER_SKU_UNIT;
> +		else
> +			return XE_REG(0);
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return XE_REG(0);
> +}
> +
> +int process_hwmon_reg(struct hwm_drvdata *ddat, enum hwm_reg_name reg_name,
> +		      enum hwm_reg_operation operation, u32 *value,
> +		      u32 clr, u32 set)
> +{
> +	struct xe_reg reg;
> +	int ret = 0;
> +
> +	reg = hwm_get_reg(ddat, reg_name);
> +
> +	if (!reg.raw)
> +		return -EOPNOTSUPP;
> +
> +	xe_device_mem_access_get(gt_to_xe(ddat->gt));
> +
> +	switch (operation) {
> +	case reg_read:
> +		*value = xe_mmio_read32(ddat->gt, reg);
> +		break;
> +	case reg_write:
> +		xe_mmio_write32(ddat->gt, reg, *value);
> +		break;
> +	case reg_rmw:
> +		*value = xe_mmio_rmw32(ddat->gt, reg, clr, set);
> +		break;
> +	default:
> +		ret = -EOPNOTSUPP;
> +	}
> +
> +	xe_device_mem_access_put(gt_to_xe(ddat->gt));
> +
> +	return ret;
> +}
> +
> +int process_hwmon_reg_read64(struct hwm_drvdata *ddat, enum hwm_reg_name reg_name, u64 *value)
> +{
> +	struct xe_reg reg;
> +
> +	reg = hwm_get_reg(ddat, reg_name);
> +
> +	if (!reg.raw)
> +		return -EOPNOTSUPP;
> +
> +	xe_device_mem_access_get(gt_to_xe(ddat->gt));
> +
> +	*value = xe_mmio_read64(ddat->gt, reg);
> +
> +	xe_device_mem_access_put(gt_to_xe(ddat->gt));
> +
> +	return 0;
> +}
> +
> +#define PL1_DISABLE 0
> +
> +/*
> + * HW allows arbitrary PL1 limits to be set but silently clamps these values to
> + * "typical but not guaranteed" min/max values in rg.pkg_power_sku. Follow the
> + * same pattern for sysfs, allow arbitrary PL1 limits to be set but display
> + * clamped values when read. Write/read I1 also follows the same pattern.
> + */
> +static int hwm_power_max_read(struct hwm_drvdata *ddat, long *value)
> +{
> +	struct xe_hwmon *hwmon = ddat->hwmon;
> +	u32 reg_val;
> +	u64 r, min, max;
> +
> +	xe_device_mem_access_get(gt_to_xe(ddat->gt));
> +
> +	process_hwmon_reg(ddat, pkg_rapl_limit, reg_read, &reg_val, 0, 0);
> +	/* Check if PL1 limit is disabled */
> +	if (!(reg_val & PKG_PWR_LIM_1_EN)) {
> +		*value = PL1_DISABLE;
> +		xe_device_mem_access_put(gt_to_xe(ddat->gt));
> +		return 0;
> +	}
> +
> +	reg_val = REG_FIELD_GET(PKG_PWR_LIM_1, reg_val);
> +	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
> +
> +	process_hwmon_reg_read64(ddat, pkg_power_sku, &r);
> +	min = REG_FIELD_GET(PKG_MIN_PWR, r);
> +	min = mul_u64_u32_shr(min, SF_POWER, hwmon->scl_shift_power);
> +	max = REG_FIELD_GET(PKG_MAX_PWR, r);
> +	max = mul_u64_u32_shr(max, SF_POWER, hwmon->scl_shift_power);
> +
> +	if (min && max)
> +		*value = clamp_t(u64, *value, min, max);
> +
> +	xe_device_mem_access_put(gt_to_xe(ddat->gt));
> +	return 0;
> +}
> +
> +static int hwm_power_max_write(struct hwm_drvdata *ddat, long value)
> +{
> +	struct xe_hwmon *hwmon = ddat->hwmon;
> +	DEFINE_WAIT(wait);
> +	int ret = 0;
> +	u32 nval;
> +
> +	/* Block waiting for GuC reset to complete when needed */
> +	for (;;) {
> +		mutex_lock(&hwmon->hwmon_lock);
> +
> +		prepare_to_wait(&ddat->waitq, &wait, TASK_INTERRUPTIBLE);
> +
> +		if (!hwmon->ddat.reset_in_progress)
> +			break;
> +
> +		if (signal_pending(current)) {
> +			ret = -EINTR;
> +			break;
> +		}
> +
> +		mutex_unlock(&hwmon->hwmon_lock);
> +
> +		schedule();
> +	}
> +	finish_wait(&ddat->waitq, &wait);
> +	if (ret)
> +		goto unlock;
> +
> +	xe_device_mem_access_get(gt_to_xe(ddat->gt));
> +
> +	/* Disable PL1 limit and verify, as limit cannot be disabled on all platforms */
> +	if (value == PL1_DISABLE) {
> +		process_hwmon_reg(ddat, pkg_rapl_limit, reg_rmw, &nval,
> +				  PKG_PWR_LIM_1_EN, 0);
> +		process_hwmon_reg(ddat, pkg_rapl_limit, reg_read, &nval,
> +				  PKG_PWR_LIM_1_EN, 0);
> +
> +		if (nval & PKG_PWR_LIM_1_EN)
> +			ret = -ENODEV;
> +		goto exit;
> +	}
> +
> +	/* Computation in 64-bits to avoid overflow. Round to nearest. */
> +	nval = DIV_ROUND_CLOSEST_ULL((u64)value << hwmon->scl_shift_power, SF_POWER);
> +	nval = PKG_PWR_LIM_1_EN | REG_FIELD_PREP(PKG_PWR_LIM_1, nval);
> +
> +	process_hwmon_reg(ddat, pkg_rapl_limit, reg_rmw, &nval,
> +			  PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, nval);
> +exit:
> +	xe_device_mem_access_put(gt_to_xe(ddat->gt));
> +unlock:
> +	mutex_unlock(&hwmon->hwmon_lock);
> +
> +	return 0;
> +}
> +
> +static int hwm_power_rated_max_read(struct hwm_drvdata *ddat, long *value)
> +{
> +	struct xe_hwmon *hwmon = ddat->hwmon;
> +	u32 reg_val;
> +
> +	process_hwmon_reg(ddat, pkg_power_sku, reg_read, &reg_val, 0, 0);
> +	reg_val = REG_FIELD_GET(PKG_PKG_TDP, reg_val);
> +	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
> +
> +	return 0;
> +}
> +
>   static const struct hwmon_channel_info *hwm_info[] = {
> +	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX),
>   	NULL
>   };
>   
> +static umode_t
> +hwm_power_is_visible(struct hwm_drvdata *ddat, u32 attr, int chan)
> +{
> +	u32 reg_val;
> +
> +	switch (attr) {
> +	case hwmon_power_max:
> +		return process_hwmon_reg(ddat, pkg_rapl_limit,
> +					 reg_read, &reg_val, 0, 0) ? 0 : 0664;
> +	case hwmon_power_rated_max:
> +		return process_hwmon_reg(ddat, pkg_power_sku,
> +					 reg_read, &reg_val, 0, 0) ? 0 : 0444;
> +	default:
> +		return 0;
> +	}
Does is_visible require an extra read operation? reg.raw check should be 
enough
> +}
> +
> +static int
> +hwm_power_read(struct hwm_drvdata *ddat, u32 attr, int chan, long *val)
> +{
> +	switch (attr) {
> +	case hwmon_power_max:
> +		return hwm_power_max_read(ddat, val);
> +	case hwmon_power_rated_max:
> +		return hwm_power_rated_max_read(ddat, val);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int
> +hwm_power_write(struct hwm_drvdata *ddat, u32 attr, int chan, long val)
> +{
> +	switch (attr) {
> +	case hwmon_power_max:
> +		return hwm_power_max_write(ddat, val);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +void xe_hwmon_power_max_disable(struct xe_device *xe, bool *old)
> +{
> +	struct xe_hwmon *hwmon = xe->hwmon;
> +	struct hwm_drvdata *ddat = &hwmon->ddat;
> +	u32 r;
> +
> +	if (!hwmon || process_hwmon_reg(ddat, pkg_rapl_limit,
> +					reg_read, &r, 0, 0))
> +		return;
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	hwmon->ddat.reset_in_progress = true;
> +
> +	process_hwmon_reg(ddat, pkg_rapl_limit, reg_rmw, &r,
> +			  PKG_PWR_LIM_1_EN, 0);
> +	*old = !!(r & PKG_PWR_LIM_1_EN);
> +
> +	mutex_unlock(&hwmon->hwmon_lock);
> +}
> +
> +void xe_hwmon_power_max_restore(struct xe_device *xe, bool old)
> +{
> +	struct xe_hwmon *hwmon = xe->hwmon;
> +	struct hwm_drvdata *ddat = &hwmon->ddat;
> +	u32 r;
> +
> +	if (!hwmon || process_hwmon_reg(ddat, pkg_rapl_limit,
> +					reg_read, &r, 0, 0))
> +		return;
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	process_hwmon_reg(ddat, pkg_rapl_limit, reg_rmw, &r,
> +			  PKG_PWR_LIM_1_EN, old ? PKG_PWR_LIM_1_EN : 0);
> +
> +	hwmon->ddat.reset_in_progress = false;
> +	wake_up_all(&hwmon->ddat.waitq);
> +
> +	mutex_unlock(&hwmon->hwmon_lock);
> +}
> +
>   static umode_t
>   hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>   	       u32 attr, int channel)
>   {
> +	struct hwm_drvdata *ddat = (struct hwm_drvdata *)drvdata;
> +	int ret;
> +
>   	switch (type) {
> +	case hwmon_power:
> +		ret = hwm_power_is_visible(ddat, attr, channel);
> +		break;
>   	default:
> -		return 0;
> +		ret = 0;
>   	}
> +
> +	return ret;
>   }
>   
>   static int
>   hwm_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   	 int channel, long *val)
>   {
> +	struct hwm_drvdata *ddat = dev_get_drvdata(dev);
> +
>   	switch (type) {
> +	case hwmon_power:
> +		return hwm_power_read(ddat, attr, channel, val);
>   	default:
>   		return -EOPNOTSUPP;
>   	}
> @@ -52,7 +368,11 @@ static int
>   hwm_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   	  int channel, long val)
>   {
> +	struct hwm_drvdata *ddat = dev_get_drvdata(dev);
> +
>   	switch (type) {
> +	case hwmon_power:
> +		return hwm_power_write(ddat, attr, channel, val);
>   	default:
>   		return -EOPNOTSUPP;
>   	}
> @@ -70,8 +390,19 @@ static const struct hwmon_chip_info hwm_chip_info = {
>   };
>   
>   static void
> -hwm_get_preregistration_info(struct xe_device *xe)
> +hwm_get_preregistration_info(struct hwm_drvdata *ddat)
>   {
> +	struct xe_hwmon *hwmon = ddat->hwmon;
> +	u32 val_sku_unit = 0;
> +	int ret;
> +
> +	ret = process_hwmon_reg(ddat, pkg_power_sku_unit, reg_read, &val_sku_unit, 0, 0);
> +	/*
> +	 * The contents of register pkg_power_sku_unit do not change,
> +	 * so read it once and store the shift values.
> +	 */
> +	if (!ret)
> +		hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
>   }
>   
>   void xe_hwmon_register(struct xe_device *xe)
> @@ -96,15 +427,18 @@ void xe_hwmon_register(struct xe_device *xe)
>   	ddat->hwmon = hwmon;
>   	snprintf(ddat->name, sizeof(ddat->name), "xe");
>   
> -	hwm_get_preregistration_info(xe);
> +	init_waitqueue_head(&ddat->waitq);
> +
ddat->gt must be initialized before calling hwm_get_preregistration_info

Thanks
Riana
> +	hwm_get_preregistration_info(ddat);
>   
>   	drm_dbg(&xe->drm, "Register HWMON interface\n");
>   
> -	/*  hwmon_dev points to device hwmon<i> */
> +	/* hwmon_dev points to device hwmon<i> */
>   	hwmon_dev = devm_hwmon_device_register_with_info(dev, ddat->name,
>   							 ddat,
>   							 &hwm_chip_info,
>   							 NULL);
> +
>   	if (IS_ERR(hwmon_dev)) {
>   		xe->hwmon = NULL;
>   		return;
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.h b/drivers/gpu/drm/xe/xe_hwmon.h
> index a078eeb0a68b..a5dc693569c5 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.h
> +++ b/drivers/gpu/drm/xe/xe_hwmon.h
> @@ -14,9 +14,13 @@ struct xe_device;
>   #if IS_REACHABLE(CONFIG_HWMON)
>   void xe_hwmon_register(struct xe_device *xe);
>   void xe_hwmon_unregister(struct xe_device *xe);
> +void xe_hwmon_power_max_disable(struct xe_device *xe, bool *old);
> +void xe_hwmon_power_max_restore(struct xe_device *xe, bool old);
>   #else
>   static inline void xe_hwmon_register(struct xe_device *xe) { };
>   static inline void xe_hwmon_unregister(struct xe_device *xe) { };
> +static inline void xe_hwmon_power_max_disable(struct xe_device *xe, bool *old) { };
> +static inline void xe_hwmon_power_max_restore(struct xe_device *xe, bool old) { };
>   #endif
>   
>   #endif /* __XE_HWMON_H__ */
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 70eabf567156..9df5a3a85dc3 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -13,6 +13,7 @@
>   #include "xe_huc.h"
>   #include "xe_uc_fw.h"
>   #include "xe_wopcm.h"
> +#include "xe_hwmon.h"
>   
>   static struct xe_gt *
>   uc_to_gt(struct xe_uc *uc)
> @@ -127,11 +128,15 @@ int xe_uc_init_hwconfig(struct xe_uc *uc)
>   int xe_uc_init_hw(struct xe_uc *uc)
>   {
>   	int ret;
> +	bool pl1en;
>   
>   	/* GuC submission not enabled, nothing to do */
>   	if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
>   		return 0;
>   
> +	/* Disable a potentially low PL1 power limit to allow freq to be raised */
> +	xe_hwmon_power_max_disable(uc_to_xe(uc), &pl1en);
> +
>   	ret = xe_uc_sanitize_reset(uc);
>   	if (ret)
>   		return ret;
> @@ -160,6 +165,7 @@ int xe_uc_init_hw(struct xe_uc *uc)
>   	if (ret)
>   		return ret;
>   
> +	xe_hwmon_power_max_restore(uc_to_xe(uc), pl1en);
>   	/* We don't fail the driver load if HuC fails to auth, but let's warn */
>   	ret = xe_huc_auth(&uc->huc);
>   	XE_WARN_ON(ret);

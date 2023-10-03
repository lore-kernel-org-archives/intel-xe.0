Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 546E9E75433
	for <intel-xe@archiver.kernel.org>; Tue,  3 Oct 2023 08:14:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C55310E067;
	Tue,  3 Oct 2023 08:14:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2768610E067
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Oct 2023 08:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696320878; x=1727856878;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=bj0qzHRx8Jma+dqTIa2DaR33STo6e3NAaWpDM3+oxoE=;
 b=IXs6BABlwcYMfjGxzCvTqsOEmKgNc4QJLULDZPnXouyYtoBOVihpeFc4
 oehJhrD8m4ja72rR/+VyzdNtXEy5BNUAG5UynX1DmWBHtRBUPMgkLa7CX
 BQ19Ku8W5BLtPOdCdRbqLaoYPWggqRlmJS8YwNNo+sfdyQzqCqMeTU1lc
 s0WgPxCQXoMYKDCwvmHH1evzd/jibOXOXaFJ9mrLJKhNr78R+C0hvPdXz
 M7FiEbhHLrV2f7dZUtE13jJCDUGgIHUURV10422WZUDSS9OAZDAXG69Au
 PpDuYTPddzL5d/KSt14mqgO6bMpUviH4UpIvKjQk9fV6jTCVzbOXuCK1T w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="1409952"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="1409952"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 01:14:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="866784233"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; d="scan'208";a="866784233"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Oct 2023 01:14:35 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 3 Oct 2023 01:14:35 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 3 Oct 2023 01:14:35 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 3 Oct 2023 01:14:35 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 3 Oct 2023 01:14:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fQo5+cVwGJbH+qfCad7hmhDPFBXOkmuwx4fWgLXJuWnrPlFbMFqgjtQ1gYCvTmJ20HXurNc0oOV2YZ9JaIFAYrF00efmogYnEa4k4UZoK/VRl0Ww1qzk8bFc6vYzDH/WWev7Di4GzlWZgKsPR8BqXnHIDutU5EL3FpVvuXoK4NEErAISj3w39j2OyY5NcpDkBGroWuK4Zg+oJ4opMSm3853BhLY8tPuaBJ4998Pa6lkkI0Z2fQhfzSHDO44j3Ea0tmDXIHqHL5oe/sRgH3+v/RfZy2xWuZQoiZjYag9ktNwtirBi7xFi5WJBpkXv5kQRpZEVbAMRl6TidKq1buZb9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RW1tlqb79n78pt9jyvmlZ+0HKKoRgJ+3uWXHwyc5iPQ=;
 b=PL/yj723EyNnftQmxU458HxK5dzbaO7vXVmRYTo36/5g4ipcymYhzUgtOk/g2uVh7DRwTa09a1wZOhD1vhOl0M5pnVjAdYAt+p+7UC7X08qbr+9kjFBDrH6i34vIvhHkGeOuUzQWJ6qgyzgL0Bm51d9lRLomZPPHh0vAhKx9+7KwPraQZNqpmfU4PqxQkArU3Pp786KFpLD3N91SCcNYgFg13ssymMvnab5EitH4nIRPrM/VWoX3FWmrUyxMSGcXmecUVN3N6sUhZ7kPtUurM0GZQfcjHXdus508JbKJVjk+XkiylmGL42Izqo14mP3XrAGSFvSVclZvI9xOhwuA5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SN7PR11MB6921.namprd11.prod.outlook.com (2603:10b6:806:2a8::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26; Tue, 3 Oct
 2023 08:14:33 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::4b20:e34:71f:139f]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::4b20:e34:71f:139f%4]) with mapi id 15.20.6838.030; Tue, 3 Oct 2023
 08:14:33 +0000
Message-ID: <03993d91-737d-43ff-bd9f-d1b981caf707@intel.com>
Date: Tue, 3 Oct 2023 01:14:28 -0700
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Andrzej Hajda <andrzej.hajda@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230927074607.3027012-1-andrzej.hajda@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230927074607.3027012-1-andrzej.hajda@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DUZPR01CA0281.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::9) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SN7PR11MB6921:EE_
X-MS-Office365-Filtering-Correlation-Id: a4484572-9d2d-4cb3-93dd-08dbc3e8c61b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hreltO+wHuEoMpyOmyiiylfy5gagL/shV16iL0XgKq7RE9c20dXClGBz4M3V3zSZPSQeHRgBpGlDhWVAJZ/6TqV1xQuhPciBU2Ny9tJF04H/CDyD0mcPZLqdhD+5abTOUeTrxI74u8sZw5VIk0YT7mVmKAsk97XIuLK+6n24S9q7acXQtynikshxy7+61HpaE7IkS3QsFvhELQCNRwIWtH4Z5qrnu4UfOBtJhFYXhTGLd6UysQt4aYs3o9KHgnCtbS/S2BGk6YzeLFMyeXiH76IndTiqVXD0FoVjhmn9m9mHAAaKnt3K0dNt1rUz8pFQELbIDB6smoD0PtC4lxkt46FnnEvc1Mbrn8+fouzzbllwMyiXsY4FiNIXxg03aijDo74CJw/aWcur0ycahp+W4kiyynSkF3fQuoI5tlLQxr1imtZplmDbP77FR0TDRrL1+HKtkvxHr8ATxZ5LMvUfxdXd/lIZX95cTbs6dawFrFp7K80kGdqRYVaUCYYJpW81nGWqLsbV2owd8UgcsFNAZ3EL4eOCOFKxkkrq7bw6b7hO2SsF4sBCQwdPzFDOE0cpoGwkw3osS9QqrB2X8cqdXxb+hCMyLokpSQDC7+EzeCrgnuuFoJbmwjWmNOvWBIfpNU8vZh11Xm0lqzHafi91fA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(396003)(39860400002)(346002)(376002)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(31686004)(6506007)(6512007)(2616005)(6486002)(53546011)(86362001)(36756003)(38100700002)(31696002)(26005)(2906002)(83380400001)(6666004)(478600001)(8936002)(316002)(41300700001)(66476007)(66556008)(8676002)(82960400001)(66946007)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bS91TkgrYTFWSWhrREFlN2p2R0l5QzNYNUFoVExUM0t2TndkaG0zbjNZVXFp?=
 =?utf-8?B?NDJ3SlR6WU92VEk0UUNBM3JzOXlCNk8xa0FHQ1NhMkljakNZQVMvcDBBM2Q1?=
 =?utf-8?B?SFIwUFQ3QXJGcjY2UmE5N0JDR040bG9aTnRZMFY1SFpZVWtwMU5TTVZEOVhH?=
 =?utf-8?B?ektxNzYxNVBKdkxidGI1MmdXSFBqWDhpQmdmTXI0L2wyWnkvUVRjeGQvOFFo?=
 =?utf-8?B?OFQ3am5paWRTNW9ESE1wVXdONy9tZTczaWFpQXJBYmg2QTE5clNVeVZrdDVT?=
 =?utf-8?B?QWR0SE5taGFWZzNycEZqUXlld2gyS0s2aDZtdk5UQlArMlpJQ2ZMQjE4Vzky?=
 =?utf-8?B?RDNhTU1tWThqWHAwdmFLMG5HMzF5OGJnWWxKbEZub2F3dWVVcEJQVnFMUVRv?=
 =?utf-8?B?NnVSQ0NkOHFTWW9OOENvbnNZSkNBM1V4MWV4UnI4MCsrSndEbXhvZ2pqSGUx?=
 =?utf-8?B?SWdhNUFId0ZEV2ZOL29IeC9OSWpHOENCTEVBdVM1ZEVwejVycFVCSjBtZTl3?=
 =?utf-8?B?ZE5OWC9YNEdCQWtmK3Rob1pPM2FNazRBd1IyNEp4MWl6YnRtUVZBYUJtVDdR?=
 =?utf-8?B?bU1RczJldlBGaU1QVmhxcTBmeUFaSkVuN1cvWktZelVrNy9vVDBaT1pOSkZv?=
 =?utf-8?B?YkpVUklRVkdsWis2Q1g3YjJOZXp6c3d5bW55ZHo4MWxNWVh5VSt3UVl4R1FR?=
 =?utf-8?B?OUlaZmNTNWxHMDgvdXp4NDlpTWFrb1VtL3hnVFNuNnhRZitjVFBUb0Z2MlIw?=
 =?utf-8?B?ZlN4MmNTajA3Y1pRRmUxbzlUZHZnQTgvUzBHR0dDVS8rOWR4Wk5UaVc2eEhp?=
 =?utf-8?B?SkRxUFVrWDd3SnhPZW1FL1VOajlKNk03OVJ6Z2pFWDY0UHZsYXY2US9vaUNr?=
 =?utf-8?B?R2U4YkM0eDlXYjR4MysyYUJ6ZGRLWFdnYzYwUW84UWFLbW9FK0hIbTRTbm12?=
 =?utf-8?B?elExUDhzd2QxMHJWSDRpVjV4S0loU2pJZFlCN2g4eVhRYVczRmNPSWx4UFlX?=
 =?utf-8?B?QTNNYVhnT2cxRGRHaTk3OUdpUDkraHdPMzVCUUVLMHhrRy9PTUhVelJJNnQ5?=
 =?utf-8?B?c1VJZHcwZ1lXdEx5VElJcGNGZHNYbmQ4Q29pYVlBTEdXbzE5VHJqbWt0T3A5?=
 =?utf-8?B?Ry84ZU1tbXU2ZGcwS3N2aVBXdXRZRThROXRpaHF5d3RBV3BPdDBILzZWNGdT?=
 =?utf-8?B?WXByZzRJOXE3SjdscTM2MmFUNVo2WVhyT3N0c2ZGc3dNeXBNVWdTeXlQUEtp?=
 =?utf-8?B?TzJTemdDVFNjYVNKcy9xSXA2RXY5dFgvY1lsYUVpdmNyVUdhUXYyTnhmbU5i?=
 =?utf-8?B?Tmlub1h0MEVyV0xWekE2aVhqaXNWU1N0aklvekh4NzdmbGhPZXIvMWVWd3RB?=
 =?utf-8?B?WWFYT1VrdmhMSzl1RmdEOVBBK3VTUnplZm1GUDVWZmJBR3dBNWh1S1I2dWl5?=
 =?utf-8?B?ZWhhditSa2gzQjRLd2VpYVp3ZVFxUzBFbWVpRDdHMXdRcHd5KzJaQ2ExczBs?=
 =?utf-8?B?eCtWdm5wcTA1Q2ZsZDFnb3E4b29kMVpQblpWUjZEY3A5ajZGNk1ZUWxINjJ5?=
 =?utf-8?B?anMyZ002dGR3S3Q4NnFraWtvV0pHMU9zV2JxRE44ZXJNcjVIaG55Q2c1eStt?=
 =?utf-8?B?L0Y3K2d0R3FDdHpPcDl2cEFsSi8wU2M0MzlxZEpBOFJ1SFV4UTNxTmsrSFBp?=
 =?utf-8?B?K3dLdVhkYVBzL2tLcjRQa0M5VGdtKzFLMFdMWWh5SWhrRm9zZ3NxNUZCY094?=
 =?utf-8?B?WnhZMlk5MmtmSGJWRWhFNVJ3TG02R2tUeHlMcDVLanhkTjdWNlViTjVZV1Z1?=
 =?utf-8?B?UUszM1haUWtkM1I2K1hzTEF3UHp6L01jVG5BRXpzNTRueUU1d3lsTmpDek5w?=
 =?utf-8?B?ZlJjQ1lTQ2theEdPRHV3Z0xFSVZmSTh6UEVUSVRXSHJLR1hIMmFUNWhmeTk0?=
 =?utf-8?B?cC80TS9OUVQ0TlFKbGpaZTR0TFZ0UzNaOUVMVkdkcDhISmRnekNoYmtMaS9Y?=
 =?utf-8?B?U2UxanRUM0t4VjQ4dnhhWTVva0V6NDJKby9BWmlBU1V6dG5wb0w4a2ErSjYx?=
 =?utf-8?B?TFovUEtCVUZUOXRKM1M0MXBXYWVUOFprUjViV251LzRkMTVCaUZtV1lBalVG?=
 =?utf-8?B?UmtGL2VPMTUwY3VpNlV5Q2dKczZhcDhtMmwzZ0FxSmM3WmNqZUttbFA1Y3pW?=
 =?utf-8?B?QXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a4484572-9d2d-4cb3-93dd-08dbc3e8c61b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2023 08:14:33.1846 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TZogpbVfQvruGUSiy6O7sDO3IPomkxGDIkLux9uU9pfP2kfFqk+Q1haaczdz1ckV1bdjP86ONJ09vKl0RD6G6bVSXvQ3OLjy8WzbQMapHxE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6921
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: implement driver initiated
 functional reset
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



On 9/27/2023 9:46 AM, Andrzej Hajda wrote:
> Driver initiated functional reset (FLR) is the highest level of reset

Just to be pedantic, FLR means "function-level" reset (as in PCI 
function), and not "functional" reset. Just making the distinction 
because the meaning is different.

> that we can trigger from within the driver. In contrast to PCI FLR it
> doesn't require re-enumeration of PCI BAR. It can be useful in case
> GT fails to reset. It is also the only way to trigger GSC reset from
> the driver and can be used in future addition of GSC support.
>
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
> Hi all,
>
> This is initial attempt to implement Driver-FLR in xe. Implementation
> is copied from i915. I've skipped comments, but I can re-add them if
> requested.
> In i915 Driver-FLR is performed on driver unload if GSC was used.
> In xe GSC is not yet supported, but I have added trigger to perform FLR
> in case GT fails to reset, I guess this could be proper use-case and
> of course this is prerequisite to GSC support.
>
> Since this is my 1st patch to xe please be merciful in comments :)
>
> Regards
> Andrzej
> ---
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h |  6 +++++
>   drivers/gpu/drm/xe/xe_gt.c           |  2 ++
>   drivers/gpu/drm/xe/xe_gt_types.h     |  3 +++
>   drivers/gpu/drm/xe/xe_mmio.c         | 38 ++++++++++++++++++++++++++++
>   4 files changed, 49 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index e13fbbdf6929ea..769a8fd005931a 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -359,6 +359,12 @@
>   #define RCU_MODE				XE_REG(0x14800, XE_REG_OPTION_MASKED)
>   #define   RCU_MODE_CCS_ENABLE			REG_BIT(0)
>   
> +#define GU_CNTL					XE_REG(0x101010)
> +#define   LMEM_INIT				REG_BIT(7)

this is already defined in xe_regs.h

> +#define   DRIVERFLR				REG_BIT(31)
> +#define GU_DEBUG				XE_REG(0x101018)
> +#define   DRIVERFLR_STATUS			REG_BIT(31)
> +
>   #define FORCEWAKE_ACK_GT			XE_REG(0x130044)
>   #define   FORCEWAKE_KERNEL			BIT(0)
>   #define   FORCEWAKE_USER			BIT(1)
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 1aa44d4f9ac1c8..1e0b76000ed46b 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -604,6 +604,8 @@ static int gt_reset(struct xe_gt *gt)
>   	xe_uevent_gt_reset_failure(to_pci_dev(gt_to_xe(gt)->drm.dev),
>   				   gt_to_tile(gt)->id, gt->info.id);
>   
> +	gt->needs_flr_on_fini = true;
> +
>   	return err;
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index d4310be3e1e7c8..dc194e9656abd5 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -347,6 +347,9 @@ struct xe_gt {
>   		/** @oob: bitmap with active OOB workaroudns */
>   		unsigned long *oob;
>   	} wa_active;
> +
> +	/** @needs_flr_on_fini: requests functional reset on fini */
> +	bool needs_flr_on_fini;

The FLR is a device-level reset, so it shouldn't be tracked at the 
GT-level (all GTs are reset when we do an FLR). In i915 we tracked the 
uncore at the GT level so we had to work with that, but in Xe IMO better 
to store the flag under xe->mmio.needs_flr_on_fini

>   };
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 3ccc0af4430be4..593ecc98cdfe8a 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -4,6 +4,7 @@
>    */
>   
>   #include <linux/minmax.h>
> +#include <linux/units.h>
>   
>   #include "xe_mmio.h"
>   
> @@ -364,9 +365,46 @@ static void xe_mmio_probe_tiles(struct xe_device *xe)
>   	}
>   }
>   
> +static void driver_initiated_flr(struct xe_gt *gt)
> +{
> +	const unsigned int flr_timeout = 3 * MICRO; /* specs recommend a 3s wait */
> +	struct xe_device *xe = gt->tile->xe;
> +	int ret;
> +
> +	drm_dbg(&xe->drm, "Triggering Driver-FLR\n");
> +
> +	ret = xe_mmio_wait32(gt, GU_CNTL, DRIVERFLR, 0, flr_timeout, NULL, false);
> +	if (ret) {
> +		drm_err(&xe->drm, "Driver-FLR-prepare wait for ready failed! %d\n", ret);
> +		return;
> +	}
> +	xe_mmio_write32(gt, GU_DEBUG, DRIVERFLR_STATUS);
> +	xe_mmio_rmw32(gt, GU_CNTL, 0, DRIVERFLR);
> +	ret = xe_mmio_wait32(gt, GU_CNTL, DRIVERFLR, 0, flr_timeout, NULL, false);
> +	if (ret) {
> +		drm_err(&xe->drm, "Driver-FLR-teardown wait completion failed! %d\n", ret);
> +		return;
> +	}
> +	ret = xe_mmio_wait32(gt, GU_DEBUG, DRIVERFLR_STATUS, DRIVERFLR_STATUS,
> +			     flr_timeout, NULL, false);
> +	if (ret) {
> +		drm_err(&xe->drm, "Driver-FLR-reinit wait completion failed! %d\n", ret);
> +		return;
> +	}
> +
This block could do with some extra blank lines and some more comments 
to explain what each reg access does (you can copy those from i915).

> +	/* Clear sticky completion status */
> +	xe_mmio_write32(gt, GU_DEBUG, DRIVERFLR_STATUS);
> +}
> +
>   static void mmio_fini(struct drm_device *drm, void *arg)
>   {
>   	struct xe_device *xe = arg;
> +	struct xe_gt *gt;
> +	u8 id;
> +
> +	for_each_gt(gt, xe, id)
> +		if (gt->needs_flr_on_fini)
> +			driver_initiated_flr(gt);

As mentioned above, the FLR is a global reset so there is no need to do 
it multiple times if multiple GTs have failed and require it. Tracking 
with a global flag as suggested before should fix this as well.

Daniele

>   
>   	pci_iounmap(to_pci_dev(xe->drm.dev), xe->mmio.regs);
>   	if (xe->mem.vram.mapping)


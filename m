Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B003DC001DF
	for <intel-xe@archiver.kernel.org>; Fri, 20 Oct 2023 18:42:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 521A210E5DA;
	Fri, 20 Oct 2023 18:42:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF8C510E5DA
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Oct 2023 18:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697827345; x=1729363345;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DLqGnOqWCK652dmU0WJ1orEgBMQcLnk1KbEq+xorM2g=;
 b=Aiks7fao/Pwxmmhz0K1C0X+BjU38FdgfgKfgutAGUWK82A2isFeHo7N7
 crY1ADxY1uFJTR77gw6wYtILpz0IkBv/Njc0j8AtIe0ZKDWl08fjBW8hN
 90l96X15KMyGPSVjB2wSpzsVKkleaZquoAj19U0RdsSMoEITO28uAEsI3
 QhWzY7KrPpgV3C330Aht06nOhuR7ne2cdCotXMbch5Vfytb15UJlN+dlc
 2oY6xKuBgaVXXGs7eX4JglxpUi/Bl7xE29G3m+M2F0GqXggXxUc+9mtYH
 s19tZeJOy+vItK9JcWnQMCkBJ70NyTumaEecpI4+XIuzRv7MhsyP4ice3 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="450786216"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; d="scan'208";a="450786216"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 11:42:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="757548414"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; d="scan'208";a="757548414"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Oct 2023 11:42:21 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 20 Oct 2023 11:42:20 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 20 Oct 2023 11:42:20 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 20 Oct 2023 11:42:20 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 20 Oct 2023 11:42:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gZnistAolGDpWXb4q/8dB3Q9iinyoIrHwwu8E2whJZK3nf1XD6eDQXhZXVkmHRtD6arP6HuvWYk5ryAJ/VIkSieUXGYoenwoNvh5GPnmLKjseaoWTbIO4bvBhhKzk7dAI+nybLuXW4eSk11TgZ4WRz7SQYxMwWBlCWt1ojYbd8/2fvrR6HZgLIJF+CljbD8vSObrdNHG4Gj8C9VgJDkggFlNyZyhQmKO2TgYYkgbZb00CbDVpL3u3ZXtdf5iCdnUHf5ZIkkD6R/FwQxr1UZ5jz0FwT6ZtbqoLeJfeC79I2uBclaUB3DJ3e9eB8vuGv9a3huNgr6EvgCDO41tPATKzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1wZIYlMNhMaRvKXoTiOeFkvaZhsCzH/DAJv0KCGQK1U=;
 b=oe2Vmy/rtp1M71lgg2ddmOsDLE/BJ6ngsZFVp/QidENut9Cu8D/lGrl1y9Pb464kH85zLewM4LJf9NND+53OXaXCfLe2UHOF4lXkTu182xbnfx+a+3i9cUVx4Yy7/+EtAh0yHNjGNu4vh75xnlH74d94opQy9H9DSaCrmkAhZGEWuRpC6vqtw8TUay9e8x1U4SSWfwBHSkaeGlHWLc+Cbth/VCC1GlpHr1OIKV8YqE86spMr70rS0b1eCDfnFDed/Juuzm2oZ4lZF5ck7GFJkwMdJuXVoZTQA9jQDiiA9gkL91jU0tR4nSApVjU2X8C1K3N3MGuCy69mMhPTT8wrJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by PH0PR11MB5095.namprd11.prod.outlook.com (2603:10b6:510:3b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Fri, 20 Oct
 2023 18:42:18 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::51b2:a46b:a57e:9fd6]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::51b2:a46b:a57e:9fd6%6]) with mapi id 15.20.6886.034; Fri, 20 Oct 2023
 18:42:18 +0000
Message-ID: <fda2123f-ab87-4dbe-9736-5063ba884346@intel.com>
Date: Fri, 20 Oct 2023 11:42:16 -0700
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231020045533.1425375-1-himal.prasad.ghimiray@intel.com>
 <20231020045533.1425375-8-himal.prasad.ghimiray@intel.com>
From: "Welty, Brian" <brian.welty@intel.com>
In-Reply-To: <20231020045533.1425375-8-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0196.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::21) To SN7PR11MB7705.namprd11.prod.outlook.com
 (2603:10b6:806:32f::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7705:EE_|PH0PR11MB5095:EE_
X-MS-Office365-Filtering-Correlation-Id: 378d46ed-3efe-4ae8-3b43-08dbd19c496d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KO8UOSX8BXtuyxjd4XpASuOhDmp9cc8YtYaMPn+PYvj6nOBawacXdime7eKUYXoMc3yWT9z2rT7JyAIZMcrR4BnO9A3uXC4NkIHbyuVOtoAUt9Kks95dM3JM0Y2CGFQaq/OrKZSrShPudlO4spppLDY2bsPahiKRBLSvoCAQjsm/lEwfh3KMzlE60lX3fMZTXRmgwBTETk5KoLR1+vbrj+W43qiT9GdFOYT1YOgaVXDoV3n8uu/+JV5Shkx7GbKZzsgnQv6kwtRoTS6VbF98dJ4h/+5HU4bOJv5Y4CgVNu23XBNzDZLgLUeAfhHX8YScUIJwHt+hMCI70Bvp593oYkMmSa1sznle4TXmp/XwcAWpCITtXC1ZdsBwT/nRuMjTJ+5PWx7HHqgnBEkP5TeG0gP/iz+Uj5AR9uxYPUuJmI1dNR7BZ2kf0noxWnsbHGOWqIrNBrAZdejPxlCBh4T4hLUl/zGbtHFFa/5v+Yig8f2m7vshb1kO3nWwFvKYzA8c+wR+bUHZN3gZbe02Eb+dmDFHhMEjvnngWZpnkuVkVGXLQbSPSXZyXhxZYvO6IoElY1aKClw3Z3YVV8uIjlbvchR5QwGXgRhvj7WE0A/C19jDLGAXx77c9DZJDgXhPH5hZoD+ZmHJf9uwplBiMPLFoA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7705.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(39860400002)(366004)(136003)(346002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(41300700001)(26005)(82960400001)(2906002)(36756003)(8676002)(8936002)(38100700002)(31696002)(86362001)(4326008)(83380400001)(2616005)(6506007)(53546011)(6512007)(5660300002)(316002)(478600001)(6486002)(66946007)(66476007)(66556008)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUdIVnpVNmpxbmVvOWRXMkxlTWZJRE5tcTNZNTMwNFY5ZDdLUUxhNVFlU1Bs?=
 =?utf-8?B?MzFWbXVzSlJCWURwRUtHOWJoYlZSU3hSYWw1b0ZBWGIyWTJFS09JQjErM1JR?=
 =?utf-8?B?RGxNNlVraVZKS2ZOQ3plZEQzOFl2NXIvK3ZzbEt1ajZmV0pYYTNBUi9YZU5u?=
 =?utf-8?B?SjM3L0ZrcWNscmI2TTVwOE1Rc3BLbzl2aG5qY1hjNlJ1azdOdTBuMFRDWmdR?=
 =?utf-8?B?SFFDeWV1ckVTOHI1YmQxcDB1bkxDQzRFeW9GVjZDeHNvM2VFUjJQWXY3UWJJ?=
 =?utf-8?B?MlBnRmlDdlZsaFZmcG1FUFQ3NElxSFFCbnhJa2tWTlVyb1lhNTF6NGxoQWN4?=
 =?utf-8?B?Vlh1QVlmWXF0V2hqQUZjN2ZkQ05YY1NqdWJVbTlndUFQZWtUMVFPSzFYdWsr?=
 =?utf-8?B?WTRadXVvWkpXKzFXd2pNUmtXZFIvWnVodUtLaVNtZnV3UEZyRHNvcEJlelZQ?=
 =?utf-8?B?aFc0R0pQRFB5a2NHSk1ubURyTkxITFlUdUN4OE1BQnBaVEhiV3Z5UDV6N3hI?=
 =?utf-8?B?N0VsSGhCcC9UUkliTWMvRVNuMXBDeFZWeFF6RGpPdldyUm9Ub0Q3UzBWS3JP?=
 =?utf-8?B?dkE3djl3YW5IblkrS0NGUmNUcHMzMUgwTk95dHdKQ2ZoOHBYZ0xTQkZ2anp3?=
 =?utf-8?B?ZUp5eEJRMXpmS2JSZEN0MGFpZWZENzE3QVZFdmJYd21mVUJrYlM4RHdpZmpa?=
 =?utf-8?B?cDdlTFQ3eWU1VWN1bnhNendkb2dDQUN1RVJ0SFhzZ3M1ZkFNcW5BNFlLcHB0?=
 =?utf-8?B?ekxsNkEyanM0WE9vYUxRRlI3L2h5ckpFU3ZUc1BDUklKaHZUYkRJVm9NNlBo?=
 =?utf-8?B?MW5tdk1BUW56dWlIZ1Q2SFlZbmd0Nkw3c2dhKzVLbWorK0dEZEFlR0dDR1Rn?=
 =?utf-8?B?T1pydTc5SXpOcm5iQjlic0JzYkhsbGZ3MDlDRWJ0eFd0QUJVLzZuMWYwc0V0?=
 =?utf-8?B?dHRmWHlvRkdlblFnSzFSYXMyUjRnTWJFeHBSMmJ2Z09KaExsaFlxcDE1ZkNU?=
 =?utf-8?B?NG9yZVMyeFhiZHduc2c2YUJhWWtoM1BRZmlPVi83ZTNSU0NPQlAzVTFFV2V3?=
 =?utf-8?B?SHJ1S1pBQXUvdDJKZ0xYdUZ1WXVYZjEzck0zaDc4S3AvTzlnK1BFT2RzclF3?=
 =?utf-8?B?azkvMTlqN3pTa2lURk4ySEtpenJhK0NYMFRwQ1ZQNlJaR3cwbUVFTzR3TjEz?=
 =?utf-8?B?M3NlT0xFa2drdS9qUVgwZHJIQWZMUXREb1drNVVSUFcveWo5THh2RGp0QUVr?=
 =?utf-8?B?dWc0QUVjVTdid3QvQkE3RExDY0U2N3lvVFpCNE1YalRFak1lMWltVTBNL1hx?=
 =?utf-8?B?anR4by9CL2N3V3ZTUU9aUVUvZUZrRzIxMktDdXZHRm1pUy9aV0hyN3hjcGtD?=
 =?utf-8?B?blNvUmljRjZDUnBBa1IxQjM2eFRQV3Awa0hRMEpIMUVhcisvbUpoVklIOEV4?=
 =?utf-8?B?T3QxeHcreDdNUkVZakV1ZXU2anQwS0RBaTRlekRwV1JWNHFHdHAyekNsWmFy?=
 =?utf-8?B?UXFwSUJSdjIzRU8wZkxManY3bHRuNzhyOUdnOERpRXJXbkZ2bVV6Wkp2T25H?=
 =?utf-8?B?T2g5YVhkMXNsOGNRc0FQUS9PU1BCU0hnbko2Ymt2NXJxMmJJK3dvRTNDR3U0?=
 =?utf-8?B?bVo2ZnhMMDYzbnRMTTF3ekE4eTQ1bmpnbXMrUDhmTzdRS3BJSTRRZDcvaFhl?=
 =?utf-8?B?eUpVRDA3eUcxOWQ5OE5HaE00K292dXJRL2lZRUR1QXdsUmxEeFFQQzAvWFQz?=
 =?utf-8?B?aDUxcC9SRWY1bStubittQUN3UkNsN0lSNk96TTRma3JTZ2htbllFTzVRVEx5?=
 =?utf-8?B?bGJmNjBhYWdGemZsOHllbWJnK3dmdWZGNnRFQWswOXhML0NRdEJ6K0pDc3BC?=
 =?utf-8?B?TnVxSXBlcmk4d09Ya2dIcE43Vm1aWmlmQml4blRUdjYwNW5ZVm9QSGcxNHFl?=
 =?utf-8?B?T2RxWDdacndZMmtiMWRiVVlTckpBcEQ4RnVCaWJkY3dsWUdyVUJ2MEwveUJs?=
 =?utf-8?B?eE85MUpwaVBQZUpVMzh5WWxXQWNLUUtldmdUYlRCbzB4SEE0Nis3dGlxWWty?=
 =?utf-8?B?ZndIdUd2UjhyNEtQbmZmRU5BZjdkd3JBRHoxSjBZNjRHczNMVURNRGZmMzM3?=
 =?utf-8?Q?6UcCClEYntYHdHDE9QORYxFZF?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 378d46ed-3efe-4ae8-3b43-08dbd19c496d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 18:42:18.1729 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vfLu5R28Tl7mfG6CSW0iHk9MShE3u+7teVC7tYPzS1HMlH5vx06h6FdSO5736xvoYbR7vnZ7g0Ii1CDuMXN1ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5095
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 07/12] drm/xe: Notify userspace about GSC
 HW errors.
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


On 10/19/2023 9:55 PM, Himal Prasad Ghimiray wrote:
> Send uevent incase of nonfatal errors reported by gsc.
> 
> v2
> - No need to provide tile info in uevent because error is
> accepted only in tile0. (Aravind)
> 
> v3
> - Use pci node to send uevent.
> - Pass RESET_REASON for uevent.
> 
> v4
> - Use XE_RESET_REQUIRED_UEVENT for GSC HW error.
> - Define reason for reset.
> 
> Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> Cc: Brian Welty <brian.welty@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device_types.h |  3 +++
>   drivers/gpu/drm/xe/xe_hw_error.c     | 17 +++++++++++++++++
>   drivers/gpu/drm/xe/xe_hw_error.h     |  3 ++-
>   drivers/gpu/drm/xe/xe_irq.c          |  4 ++++
>   include/uapi/drm/xe_drm.h            |  6 ++++++
>   5 files changed, 32 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 3b371e0f6168..bc7b545ce37b 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -196,6 +196,9 @@ struct xe_tile {
>   	struct tile_hw_errors {
>   		struct xarray hw_error;
>   	} errors;
> +
> +	/** @gsc_hw_err_work: worker for uevent to report GSC HW errors */
> +	struct work_struct gsc_hw_err_work;
>   };
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
> index 84533ef6a51e..b9d669c150a1 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> @@ -3,6 +3,8 @@
>    * Copyright © 2023 Intel Corporation
>    */
>   
> +#include <drm/xe_drm.h>
> +
>   #include "xe_hw_error.h"
>   
>   #include "regs/xe_regs.h"
> @@ -378,6 +380,20 @@ xe_gt_hw_error_handler(struct xe_gt *gt, const enum hardware_error hw_err)
>   		xe_gt_hw_error_log_vector_reg(gt, hw_err);
>   }
>   
> +void xe_gsc_hw_error_work(struct work_struct *work)
> +{
> +	struct xe_tile *tile = container_of(work, typeof(*tile), gsc_hw_err_work);
> +	struct pci_dev *pdev = to_pci_dev(tile_to_xe(tile)->drm.dev);
> +	char *csc_hw_error_event[3];
> +
> +	csc_hw_error_event[0] = XE_RESET_REQUIRED_UEVENT;
> +	csc_hw_error_event[1] = XE_RESET_REQUIRED_UEVENT_REASON_GSC;
> +	csc_hw_error_event[2] = NULL;
> +
> +	kobject_uevent_env(&pdev->dev.kobj, KOBJ_CHANGE,
> +			   csc_hw_error_event);

Sorry to drag this on, and I meant to mention before if you combined 
these....
But it looks unsafe now to have both gt_reset() and new worker above 
sending uevents to dev.kobj?
Unlikely, but if they are sending concurrently then it seems that
will corrupt the uevent.  You can double-check, but I don't see 
kobject_uevent_env holding a lock.

I guess you could either introduce a lock.  Or not allow the gt_reset
worker and above worker to run concurrently....

Actually, I think maybe problem already exists in that gt_reset workers
run on a per-GT workqueue.  Two GT resets could fail at same time, and 
each will send a uevent for failed reset?  Ugh.

Well, I'm okay if you fix this separately.

For your patch here:
   Reviewed-by: Brian Welty <brian.welty@intel.com>

-Brian



> +}
> +
>   static void
>   xe_gsc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
>   {
> @@ -435,6 +451,7 @@ xe_gsc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
>   			drm_err_ratelimited(&tile_to_xe(tile)->drm, HW_ERR
>   					    "Tile0 reported GSC %s %s error, bit[%d] is set\n",
>   					    name, hw_err_str, errbit);
> +			schedule_work(&tile->gsc_hw_err_work);
>   		}
>   		if (indx != XE_HW_ERR_TILE_UNSPEC)
>   			xe_update_hw_error_cnt(&tile_to_xe(tile)->drm,
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.h b/drivers/gpu/drm/xe/xe_hw_error.h
> index e82e7c00a7e1..f8d859c82d72 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.h
> +++ b/drivers/gpu/drm/xe/xe_hw_error.h
> @@ -7,6 +7,7 @@
>   
>   #include <linux/stddef.h>
>   #include <linux/types.h>
> +#include <linux/workqueue.h>
>   
>   #define XE_RAS_REG_SIZE 32
>   
> @@ -104,5 +105,5 @@ struct xe_tile;
>   void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl);
>   void xe_assign_hw_err_regs(struct xe_device *xe);
>   void xe_process_hw_errors(struct xe_device *xe);
> -
> +void xe_gsc_hw_error_work(struct work_struct *work);
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 8365a4cb0c45..bc0f01a2abc1 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -614,6 +614,10 @@ int xe_irq_install(struct xe_device *xe)
>   	irq_handler_t irq_handler;
>   	int err, irq;
>   
> +	struct xe_tile *tile = xe_device_get_root_tile(xe);
> +
> +	INIT_WORK(&tile->gsc_hw_err_work, xe_gsc_hw_error_work);
> +
>   	irq_handler = xe_irq_handler(xe);
>   	if (!irq_handler) {
>   		drm_err(&xe->drm, "No supported interrupt handler");
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index ae1b1c7528d5..60cc6418d9a7 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -32,6 +32,12 @@ extern "C" {
>    */
>   #define XE_RESET_REQUIRED_UEVENT_REASON_GT    "REASON=GT_RESET_FAILED"
>   
> +/**
> + * XE_RESET_REQUIRED_UEVENT_REASON_GSC - Reason provided to XE_RESET_REQUIRED_UEVENT
> + * incase of GSC HW reporting Uncorrectable errors. The GSC errors are reported only
> + * on TILE0, therefore no additional information is supplied for this reason.
> + */
> +#define XE_RESET_REQUIRED_UEVENT_REASON_GSC    "REASON=GSC_HW_ERROR"
>   
>   /**
>    * struct xe_user_extension - Base class for defining a chain of extensions

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9375C4829A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Feb 2024 02:20:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90A2D10E2A1;
	Wed, 14 Feb 2024 02:20:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zfmmg4/K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C032C10E2A1
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Feb 2024 02:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707877208; x=1739413208;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tbec/NfcgEIyYCJtR1tZUbX1hFU6OnN368acULej0ss=;
 b=Zfmmg4/Ka80rccbu7Zux+T8MZyZs802vMRpTD6aO5McdW3X1AjDYQyz2
 XPV+zbywUmHDY2PrnBqwosmevXEGG0wJvTTuAteExSwbwUXTbP9njRGJU
 KqjlRc2cOnVMhPflA60JneMdxr6YhVY6wojaK3NUoixcJEq1AW9vVL+kh
 AjdP3kw0FAUz1Lr5ZzjIx2ezJj5/a9SLWbyvHsEtF0Zq2i2Y9tk6pfFy+
 cPv1KbQtDS36H6uJ0VydrZItr3gaKAIgJ1+Ux3igAsjVFVUYsr7lIjWo/
 RxJGkJyg/sdczVsyB9eTXw+PfvTNaP9L+2Nz4XMwLBDNo7mIQOcuzs/mu Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="12632006"
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; d="scan'208";a="12632006"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 18:20:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; d="scan'208";a="34124195"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Feb 2024 18:20:05 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 13 Feb 2024 18:20:04 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 13 Feb 2024 18:20:04 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 13 Feb 2024 18:20:04 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 13 Feb 2024 18:20:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DoW7ab8L1K82wR5tnlQ3IbJ3wgnSNQVTG/3KNI9D8ucMOlfpV2qB0G0SBFiZDtfQHfnjfssKVVlG+/31FPmD9pK3zvbEtnzIscelm6ad70lD2PrYSgExg8RBYgy/5ZharriT+vaxkYowhMLFGa/aX0QZJSOvreLVY0ruFcGOamPEUcfP+z3ZqM8ZMkFMxDuulN2OWYUE7KtoCaI4hAVYARaVazOtuZ8eh7pM7cnQKZUBPZl5Chfpbd3YgrgPxM+goNa1y8paLh6K2dWy5IXc/I6Q3rv0M4+HByWfGm/7jKbHGcrYEKOFti/WxfOuvIZRJWEfFZoDUplb55A4o9w8jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ocnVk8KKlKelcIv2AAOYSSxLbUe/AsS6q7o+rpA7kQ=;
 b=V4Etv+OcDhiRrLT7sILnrZnkY9gE6QMobYg8DaeWCWbmhusAjS9lD0PCnJpg7L9kOiMGhgAWZMR+FHn+cB/8YtTSydcRkqpYuBWz2cLTTqzEqbtLgMzq4t0wuYpGNFNMKc92wNWLMveseLcpBqfX9mV3LEEv8RVPy56NoBuMDK85tQXiI5VSXo3F2E/7FJ1bO2+llspTQ7SyeoTSt407yxf8k69roBTNmU6O0g/CK3WSKckEzkfxCvQhEtIASRcZCjcyERMXkAclqU77BAmmB0mLA3n8iGy1gBE54OSdhetkLu0KjsiXtTRVPD40QyoJEcOU7h1hcF7gZbZpPvVCjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by PH0PR11MB5160.namprd11.prod.outlook.com (2603:10b6:510:3e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.35; Wed, 14 Feb
 2024 02:20:02 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::c590:37b4:ad48:cd0f]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::c590:37b4:ad48:cd0f%3]) with mapi id 15.20.7292.026; Wed, 14 Feb 2024
 02:20:02 +0000
Message-ID: <c48b1247-03d7-4454-a286-b6333d367a23@intel.com>
Date: Tue, 13 Feb 2024 18:20:00 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe: Extend uAPI to query HuC micro-controler
 firmware version
Content-Language: en-GB
To: =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Francois Dugast <francois.dugast@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
References: <20240208183539.185095-1-jose.souza@intel.com>
 <20240208183539.185095-2-jose.souza@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240208183539.185095-2-jose.souza@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::22) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|PH0PR11MB5160:EE_
X-MS-Office365-Filtering-Correlation-Id: 8962e59d-9b95-4e4a-dce9-08dc2d03732f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XBBsWQG7+gMm2BlkXyxuwqoZkwfqaJ8SI5cQhEn8n/jz0hNmmUe0RkpJ5dm3SVfwZ6YrqJUfG2LXaLVyuQ/c3zA9klJC7nkFdd7B4wXf8pNoM2SAZKutCjl7govPRLOjITP9JKKOpjbggyKAjmFECj7PUIWy9q9jogjuIgwWxO2Y6j2tJsi00W9fK9IC200H9xpxruHZlyKqJrvr6t7Br5JHhgi1VHSxsSOk3ZzCOj9+s6niExmLVpVkvFZUPE7/Vj2bvJmdW5Oiq/xyFwwIz0M5wJEpBInh/hKlcJycWcQ9XAYIiRUAzR5NyVepkC9oXJrMjDjXyKQvwb2QxxkASRw30CrE4pyQLjlPftMp2JHNXQTs7MBd6AX/O3rpiiVuZurlo6+Js9rlG5C7+eqpI5RfFX79IYxmg7GcbkZaClWLmkfcTaf0qyRoFoaLiYqXAQE7mMTUMYUqmTtMfXxyVQPXjzX6vbH4lKcZfIXl+rURYYF4xeOY33IjYf7qH3FeEAv/oy0CZpoT15o5+y04QPq+ux8r9yYeLansCd5G6Jx/7Fz6A0xEAYnN5AcgdC8P
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(366004)(346002)(376002)(136003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(6512007)(6486002)(478600001)(41300700001)(31686004)(5660300002)(4326008)(2906002)(8676002)(8936002)(66946007)(53546011)(6506007)(66476007)(316002)(54906003)(66556008)(2616005)(83380400001)(31696002)(86362001)(107886003)(26005)(82960400001)(36756003)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cm9FcDdUd2gyWGt3Vjl2bWwyZjFMOGI2aGs1eWZQZE1IZ1pUMGtVV1RwbWtH?=
 =?utf-8?B?MXBSUGQxNXlqOHVDUzBwaGxMc3NnTUxSQlVsTWxsRk54NDZJWmdyWXhZUlJI?=
 =?utf-8?B?MlY0QWI1MXAzR3B2UTNJZjBhbDYrUXh3S285dDFCNWlHb0lqRno5TmVuNDFQ?=
 =?utf-8?B?T0ZtNngrMFlvZ2dPNjlYTThUd3lLUGdJN3UybzlFeExSMFcwZ2YxbGRtVEtr?=
 =?utf-8?B?Wmc1RVQzOWNldUpZcVBTdnVpK2Z3bVpueUc5SUxHT2hQazg5Sk52WVltVlhL?=
 =?utf-8?B?ckpucU1uYTFDT1RxaVFtRjdyMThIMStSZ2kvZWZUbitST01Nd2pwVVBqWld1?=
 =?utf-8?B?UzFTVEtCRXRzNkkxNjVLTUVvQjhIMGVyM2V0bVl2UFIzdkNVTHVjNHFBS05l?=
 =?utf-8?B?TEE5NFFrV3IyTVNDeGtJOTI0MW1XRHVrdTFTMmRJL0J0aUhDN2MwMW9TSjZW?=
 =?utf-8?B?UzIyVFc5ZkR6NlZvM3k5dlBGd3JmR1pFcjJldnlEVTdnYnJMeGdDOXdRV2hH?=
 =?utf-8?B?N0V1WXpUelZyQlJIYU1hcVZXSG10VUNoTENQZXBWcGc1eDZpTjFyQ0E5M2V3?=
 =?utf-8?B?T2x1L1EydEJnYTFFcGlaR0JVUkhiZnZ0VEltaTZXNVdCS3huY2Y1L2krdUE4?=
 =?utf-8?B?b2hxYU9KMDZCcFIyNVptNHUwbmNHTXVtR3pkWWhCaTJOSURmc0pYcFV5UVlw?=
 =?utf-8?B?bVJxbkhNb0tMd282RTRoK2lmWEZsU1hoMk9nQWl2TlQ2a0N0SjFTdktYeC93?=
 =?utf-8?B?bWc2OVVaZjBMT3BCVTFBSmxtd2FEMWcvMC9IU0lzYWQ3a2JoeG9qWVZJQXY0?=
 =?utf-8?B?Sis0QXNGYkFOeGEvdzlEcTREZUdncTNmK1J2Y1hESUl2dTRoWm44clkxcWNL?=
 =?utf-8?B?ZVhkMnk0UnVIbmtuZWpiaUNWMTQ2dUJUUXBTeFFjMS94bU9hOXRqQnZJVlI0?=
 =?utf-8?B?aXNlZENpei80QnlYc05veS9jck5ESUgyWHZaVTF2UUNIeDR4bnZaK1RFalU3?=
 =?utf-8?B?QVdKU0FnUWZjNHJTbjdzWnhVWE1RNzFMVHVSMG5VZ0kvS25Vbm1HRksvSnBQ?=
 =?utf-8?B?ZVM0Z2ZnSlllMmpLTHEwbm95alRkWWo4UDIxd3E5c05pOW1GdE8vMUJxNFVy?=
 =?utf-8?B?OU1ONDAvUTgrVmpRRVMvR2laNXRhRm9xK2tWNGZ2emxEUkVCUDZWVjdkV2gx?=
 =?utf-8?B?SkIzTHRvRjJsKzBTRDhNZmpwbC90ak9zaVpQZEN6bG1SNjduM2tzaEZ1VmRw?=
 =?utf-8?B?ZytJYTJpNmhLc3ZIaVF6NkhSYm9iVGNVdFdYeDc4K3JWR09TU0ZJbFZ4VCtw?=
 =?utf-8?B?dXczY0JCZUJOT3VwREQ3dURzL0plY0IvenhkejAvTG95TU4vMzZzMHFsTS82?=
 =?utf-8?B?WndRZXVjTkJzU09rckM4TlB3eEgxdHo3RXNVSjBHWlZUdkd3N01iUXZvd0Qz?=
 =?utf-8?B?dUJsUm96TzJVMGpTOTROcUtEK3RhZVJVemZFN0FLU3VmM2NUeU9jVWU3Mm56?=
 =?utf-8?B?ZEQ5WFZjejArSC9xOWxEeHZZV3hJUWN3UkUxZ2ptM2hWTnh2SFhiRTRTemw2?=
 =?utf-8?B?V2hSdmo0RjNaRThqc05RMGNkYnQ1dEdTOW5ZR3JSdENvVFBGTUxCU3QwRnJi?=
 =?utf-8?B?eUljMGpNanZrV21uV1NyM2hmNGxLVXNTb1BjQVVlc2JodDdqd2lkMk5QdVVH?=
 =?utf-8?B?UURuVWFHd1NkbmNDY3ZBeStFbUZNanN6S29XVmF5bDNVUThid0c5SWRvbTRK?=
 =?utf-8?B?SE9xNDZmR3paVEtZWWRMb01rV0F1Ly9FZFFsME80N29OQXpndnArTERJSStI?=
 =?utf-8?B?cGNoWGdqUjRsMVdFUjlMUEgzS0xHQ3R1UlB2SE9BL2JUa1R5ekE4aXpQbmh0?=
 =?utf-8?B?aSs0ZWROazRRZ3hsbTlrdWF4RlM3aGpaWmlyYjdEbksvZHBtRmJTM1dPZEs2?=
 =?utf-8?B?bDJBMHZuNGlRZC9jMFljbENqVzVZRzdGcEtLdlFtVHl3SXZYY2I1QUd3bEdY?=
 =?utf-8?B?SGtRUGtGVUNyU3Z3L2YycTcwa2JWYnNpL0JrRUZsQ1I3NGwxcU11MDV0N1dO?=
 =?utf-8?B?UTQ2UjFOVDBaU3h2ankvQWdzcm9NQldyUlZpOW11TGpJZWtuUWNQVzYvaXNG?=
 =?utf-8?B?MSttWG10Q3JITEN6N2VQUFNqcld5b1N5eVFaYWV1S3pub3ZVRWU4Qkg5eUw1?=
 =?utf-8?B?eGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8962e59d-9b95-4e4a-dce9-08dc2d03732f
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 02:20:02.1887 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 37b9GpHeSXgeszXP81Km4VsCJ3znkMBwEitMEHS2Ls1Y5jo/1J/PrRzExSiUn3pTHv2IO3CG6KCphVI721z+JGm2QsrVG8utCYSC24LQ0I0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5160
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

On 2/8/2024 10:35, José Roberto de Souza wrote:
> From: Francois Dugast <francois.dugast@intel.com>
>
> The infrastructure to query GuC firmware version is already in place. It
> is extended with a new micro-controller type to query the HuC firmware
> version. It can be used from user space to know if HuC is running.
>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/xe/xe_query.c | 38 +++++++++++++++++++++++++++++++----
>   include/uapi/drm/xe_drm.h     |  1 +
>   2 files changed, 35 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 92bb06c0586eb..7855d04e032f2 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -544,14 +544,44 @@ query_uc_fw_version(struct xe_device *xe, struct drm_xe_device_query *query)
>   		version = &guc->fw.versions.found[XE_UC_FW_VER_COMPATIBILITY];
>   		break;
>   	}
> +	case XE_QUERY_UC_TYPE_HUC: {
> +		struct xe_gt *media_gt = NULL;
> +		struct xe_huc *huc;
> +
> +		if (MEDIA_VER(xe) >= 13) {
> +			struct xe_tile *tile;
> +			u8 gt_id;
> +
> +			for_each_tile(tile, xe, gt_id) {
> +				if (tile->media_gt) {
> +					media_gt = tile->media_gt;
> +					break;
> +				}
> +			}
> +		} else {
> +			media_gt = xe->tiles[0].primary_gt;
> +		}
> +
> +		if (!media_gt)
> +			break;
> +
> +		huc = &media_gt->uc.huc;
> +		if (huc->fw.status == XE_UC_FIRMWARE_RUNNING)
> +			version = &huc->fw.versions.found[XE_UC_FW_VER_RELEASE];
> +		break;
> +	}
>   	default:
>   		return -EINVAL;
>   	}
>   
> -	resp.branch_ver = 0;
> -	resp.major_ver = version->major;
> -	resp.minor_ver = version->minor;
> -	resp.patch_ver = version->patch;
> +	if (version) {
> +		resp.branch_ver = 0;
> +		resp.major_ver = version->major;
> +		resp.minor_ver = version->minor;
> +		resp.patch_ver = version->patch;
> +	} else {
> +		return -ENODEV;
> +	}
>   
>   	if (copy_to_user(query_ptr, &resp, size))
>   		return -EFAULT;
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 0819959a52227..03d12b8f33744 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -583,6 +583,7 @@ struct drm_xe_query_engine_cycles {
>   struct drm_xe_query_uc_fw_version {
>   	/** @uc_type: The micro-controller type to query firmware version */
>   #define XE_QUERY_UC_TYPE_GUC_SUBMISSION 0
> +#define XE_QUERY_UC_TYPE_HUC 1
>   	__u16 uc_type;
>   
>   	/** @pad: MBZ */


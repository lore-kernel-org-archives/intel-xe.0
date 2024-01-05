Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF40C3DA6E
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jan 2024 07:04:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9325310E0FA;
	Fri,  5 Jan 2024 07:04:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32AEC10E56F
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jan 2024 07:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704438273; x=1735974273;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CkdhfYOn2uU2c860I8W27LDqvxGNJO1OrRkrhTaUOos=;
 b=P3ym89JiRwOP0Qu7bzzbdq+t+N5mrTnqktv67IfLSQWGe5wmarLmTuTO
 RuDx6cihLNYuAPTLROBhIizccTuQGH4fCeE0vgBK8byELVobAim7w5zHD
 F34+ituqCuPz10MGLY22TqyOKcgTBipTc3XR2qD8OhISEgodJobEn87FS
 xk5nGht3h2fG/PIyPvTPwhADDmzDplqffHY1JG28szypAX23dcSCc3x/n
 FGEUlzYWchCwjUd3kQmZ5nIGimD9p+tEvCc6qasACEqMIqiw+CxYfPxXs
 H9iwR8PqKByAQ6yX7ygghHeqzs5qz+A7ijHZiOwIrrXliApG08k/7hAnA A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="483620865"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; d="scan'208";a="483620865"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 23:04:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="780683786"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; d="scan'208";a="780683786"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Jan 2024 23:04:31 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Jan 2024 23:04:31 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Jan 2024 23:04:30 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Jan 2024 23:04:30 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Jan 2024 23:04:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HvW2arewcQR4xTalgxmD3bOGdLZ5vMXkcvG6//cbtfu1SMu1fyfwNBTDggBiLq/6WZdrxSjk+Ni6W2fs0frsHpe9LzDFGicynqwVZ55onMSFOeXI5Jwhfp+Yna8u8ntn4TRY3191ZLH/L9PLnTqap5i9+EL2cbe52gjP5+futdOgaIaZperOlBp2v+mSUqhi8Q2+Zk9nVAK3g64rbr4Bj2l76/uqtF/VU2XrTq7qSY6g75glbYXZPGTQRf54pUfPIH2bD52fjyg+rt+n8Bxzzi/0lD8z+YvQnSIcB5AO2vb8GaN35oaIORG+skw+XFODkFJgZMKFnjoLvJEYMSKeuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WoEDT6XAUsd/of3rnzsx2ymCIC26JwYXJnhb+GWADB0=;
 b=KxwIMpUgS3m1Ic4jIPqk4vqYJ1JHA16kpklTKuuCOukbPv+fddxEiDLeu8kb/G6TM+2tuLtoT/gtgwIWoNch4sdl+bkUn2/FaOJQ/NzoPXb3429x8y2mpZSKabCX0u4qS1ahJD8jzpE1fiXJUVVWh2WxmvZtbeywo0tklhyAS6daLdFeI5oswt7YgbiV+PVuLKfg7grS+KfIHeibgBH+7Mz006hwDvin+zTKQv6v9tMElOKQTxaqazeFMijD13x7GUaTG/SsSQyC8G6xWwfCamD4w8Romk6h1Spq8OCALL4uv3GcbvQE2vVDEiLniXlkG9L+MUM/1JSjWUAEWvDCqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by DS0PR11MB7624.namprd11.prod.outlook.com (2603:10b6:8:141::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.26; Fri, 5 Jan
 2024 07:04:28 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::7c9d:1857:d17d:53da]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::7c9d:1857:d17d:53da%3]) with mapi id 15.20.7159.015; Fri, 5 Jan 2024
 07:04:27 +0000
Message-ID: <ea7ca804-bddf-45dc-9950-0458ca316657@intel.com>
Date: Fri, 5 Jan 2024 12:34:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] drm/xe/dgfx: Release mmap mappings on rpm suspend
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
To: <intel-xe@lists.freedesktop.org>, "Auld, Matthew" <matthew.auld@intel.com>
References: <20240104130702.950078-1-badal.nilawar@intel.com>
In-Reply-To: <20240104130702.950078-1-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0071.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::18) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|DS0PR11MB7624:EE_
X-MS-Office365-Filtering-Correlation-Id: 506d05f7-50bc-4ab8-e0df-08dc0dbc8e53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YZjCTwSuny1XIUn+48pKCeEwWOLRDAMui1cWXJyalXwLELgykKg7wemFF6NtzpeAd0IxbeZzh/X7w2P196KCcq49S2bXcm0duNJ6dC53vGOirAfsqLqHZ8YqDyi78HCweVsnODTSrCL+gUwhAaNGx4FOCGbfV2nlqe9Y3T9jaryIX+eQUddQ3icbIJi1cOBaOD2lDW7xcwvEU+HZVz7y3wBm7ybZTsr0AoCqOfrSpNWwE+OsCH23vw59yKr+p/y7x0r6MbWFDq8UckqWqOX4dCodkb+ouGFU7DQKJ8FphCRNCDrCFl0mcs3KzZCIuVmhofyZQq6TSHhpmoJkSWeJsyrSLmtmvQhR4mBleK3BhUfDk1PmY2zOaKYd+GNaL4mqtrnQKGWqnQP3btyzFialXM2/9u+cfOuZqyDJCRXXY8+TkUSNNvqp+OuQf102+m8+gTUgiGYbx+xi0Bp+mNhhFmTS4EyM2XFv13qJ4iHgJQvkNsFs5k7RvdpFkhmkthK0Q0fadgfCwxGocOFle5jl7E7VaZc7ZPoDYA29z4CthqqsH0T4HPXCXk672XdrluDJ3O4i+QkO9NInsl8M0XqR6SS2ikDbfnjz9KEMecSTxZE0SQNfZsORJVu8HKhVFipO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(396003)(366004)(346002)(376002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(36756003)(31686004)(6512007)(6486002)(53546011)(31696002)(66556008)(6506007)(66476007)(86362001)(66946007)(66574015)(6862004)(15650500001)(5660300002)(6666004)(82960400001)(38100700002)(107886003)(30864003)(83380400001)(26005)(2616005)(2906002)(41300700001)(4326008)(6636002)(966005)(478600001)(37006003)(8936002)(8676002)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1lQTWlwb0R1V0xSS0Q2UFFnL0kwNkNOM3BhZ1ZPVE1aRzNsZ3ovN2V2d3hi?=
 =?utf-8?B?dk54RXlvTkUzTVZuV3pwTGdGTEtXcnNiUm01bFFRMWNXMjBhRjVLd3BYL2Iy?=
 =?utf-8?B?VmFjaTN0eGNrUFQ5QjNMTERWeTBESWkzUHR3cThnTGxaY1RWYXpGSDJURHBl?=
 =?utf-8?B?SmRVRE1qYllmeEs4dzErektUZVRibjVEN0dRdXJCT1hMTU9KejRrU0VEMWI2?=
 =?utf-8?B?djNNL0pqZE5QcEgybGdGL2Q0VVErR1VnTDZERGNzTTFxS0lFR3JaU1ZIYWsv?=
 =?utf-8?B?MUtURXg4WmpEYkJwZGxyL1kxQkdSeTg5WEJHRURvWFEvNXpzQUtxdmZTRCty?=
 =?utf-8?B?aEtDODZTRE5hVUJ6VlBPMzFvZ2ZVcFFvOWltMWZjMlhaNERkbjhWUXNsOHJL?=
 =?utf-8?B?cGliRmlZanRISE9ORnJqelBCUFBDVWx4dG9QamdCUnpHMmRKZWozTkhGVUlq?=
 =?utf-8?B?VXVLUnNnK1RML0tHemJiWGM3amVjRWVQb0F0SEFlUjlpcm1VekVwTmFhWTUy?=
 =?utf-8?B?SEduWFJxR0tzZllVNC9QcWdERThCMXVnYW5nTWlKZGNGT2kzNDc2SStZT3pY?=
 =?utf-8?B?Y1RKMVhOY3FNK0JsdVB3ejZNWnkzVE56V3hady82ZTBoaDJLQm5xYjdVcTNy?=
 =?utf-8?B?bHdOTjNrS0kvclcwejlsbXcrSnF1dkxrY0ZDQTI2L1ZBSEpCZHRjaEo0bUY2?=
 =?utf-8?B?TkhsaStMY0FjNVd4YlQ1SmpsTnZhR2R3cUVQSlFRcDZPN2hoSHZSWiszdnZG?=
 =?utf-8?B?QnhqN25kZ0Z6a3VpS0lKRml3YTgyUG1OSmNsb0Znc0JMaEtJR3lzOEZpS2RR?=
 =?utf-8?B?aWtBMFFxZ3F1Vm9UQkJQc01DbkF1UUJiQUdZV2xVQzhQNTcreVZGckNsVmpl?=
 =?utf-8?B?anpaakxtWEU4dDZWbGN6eWNRMmhFdmo2aUhwdVRkUXhhSEVIN2Z5RHhKWVFZ?=
 =?utf-8?B?dEhzenk4V1I0cDg2QkVMbGg1V1NvRzZwTzEzUWJjVS9wc3llYVJmM043MTlt?=
 =?utf-8?B?ejAweXZ0Q1RkSnhIc2pqVHdmWUZNMFVRRzZBRHlFTlhYN0dvMkFTQmpQMzBE?=
 =?utf-8?B?MTYyVjFMWmtjUWlnUytiNFlJRDJnaFg4alQvQ2Fkc0w3cVB5Z2FRRFd0V3Ew?=
 =?utf-8?B?WUZFMmxFaHFBVlc0a09UdG9xQllQZHVHdzV5Y082dzFKbWw5ckNSUGJxdFh3?=
 =?utf-8?B?amJqS2FCemh6VmRubUYxODNJSi9ST29TY0NrL1l3SGNJWmVWVWZTanEyUUg1?=
 =?utf-8?B?UFRjTWY3QXBiQVA3RDhZSUhBKy90Q2U2cWM0ZEdLUWIzc0k4OEdRRVI5d2JX?=
 =?utf-8?B?WVJ2Vmg3dnRvS2lMbkdlR2w0R2RlWE1xQ3ozdUtiTHlnNUFhLy9WMU9uM3Ex?=
 =?utf-8?B?Lytwd2hLd3hYUDMxZ0d0Q0VDMW9LejB6aHprUERLODYrR3VzemtrNTk2Y0hB?=
 =?utf-8?B?ZFROTEFxVUF5blNiQVkrcm1VYUpkeVJEeGx3bjVCWGRpOHZNeE5OZHIzY3Zo?=
 =?utf-8?B?b0ZhUC9LYStZUEJibFgvWVN4d2ZReFhIckdma01TbHd5RVdUbWRDd1lXaVhr?=
 =?utf-8?B?disvQ3pjdTlIUktnR21hWGRqYWdBSzdnaW9YN0Y3dndONE1XRVFFN3lkTmxt?=
 =?utf-8?B?bDh2NVd0Qit5R3UxUjJmbGYyK212d2tDUkh5citVajl1MEhLNmp3YTJJSUdj?=
 =?utf-8?B?NXNwdU12enVXbEJlUFZ5T0U3NHhKcUVmQ3lLKzY1VlBMODF1aDRPa0VHQVRv?=
 =?utf-8?B?aXVPejBuS2MwYXppWWtpSGp2RXdWTG1XRnZBR2RzQUV3MnVrOTBEb1ozeXhQ?=
 =?utf-8?B?ZTdGWit5UXdhZWpiaWgzUVR0S2MyODVkaVM4L0NwcXkvM3oweEpZVVhISXNY?=
 =?utf-8?B?UTFnandYWW14cXc2VlAyZTliOVZRanRQcHJGRzR4ejluTDZIZkU0bElUcVIv?=
 =?utf-8?B?SzdKUHdsdUk5MEs5U2ZWQTQ0NFNROS9YU29ZY0t6M3hMZ2RldWwxT1VXUlIx?=
 =?utf-8?B?d3NmRUV4TzZQVDBaZXFFQWN2NzBnQ3JQaThIK0h6VFhNWllUamxFdmd4V3Rt?=
 =?utf-8?B?ZDZBS09TbWQyNTFQVkhPSERyR3NRQzBFL2N2Q0wxbUNSSnJJWjB4aHpFWGk0?=
 =?utf-8?B?R1NGakM2OGxRNWJ3VDd1VGpXTC96YTgxWmJGNDZsV09qeFFUblZmZUlaVVkr?=
 =?utf-8?B?dXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 506d05f7-50bc-4ab8-e0df-08dc0dbc8e53
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2024 07:04:27.5654 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tJRZim3Z6PJgCw7Z4Ht4NNuCeMriHUegTYgImchfLKnZev3KjcezyzsEdxB5hSR726Ks6zqb7P9DqvCb7B3l6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7624
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
Cc: thomas.hellstrom@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Matt,

Thanks for RB. Fixed v5 review comments. CI looks good for this patch so 
will proceed with merging.
Tests related to 
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/999 are passing 
with this patch. So as you suggested I will add Closes: 
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/999 while merging.

Thomas, Thanks for Ack.

Regards,
Badal

On 04-01-2024 18:37, Badal Nilawar wrote:
> Release all mmap mappings for all vram objects which are associated
> with userfault such that, while pcie function in D3hot, any access
> to memory mappings will raise a userfault.
> 
> Upon userfault, in order to access memory mappings, if graphics
> function is in D3 then runtime resume of dgpu will be triggered to
> transition to D0.
> 
> v2:
>    - Avoid iomem check before bo migration check as bo can migrate
>      to system memory (Matthew Auld)
> v3:
>    - Delete bo userfault link during bo destroy
>    - Upon bo move (vram-smem), do bo userfault link deletion in
>      xe_bo_move_notify instead of xe_bo_move (Thomas Hellström)
>    - Grab lock in rpm hook while deleting bo userfault link (Matthew Auld)
> v4:
>    - Add kernel doc and wrap vram_userfault related
>      stuff in the structure (Matthew Auld)
>    - Get rpm wakeref before taking dma reserve lock (Matthew Auld)
>    - In suspend path apply lock for entire list op
>      including list iteration (Matthew Auld)
> v5:
>    - Use mutex lock instead of spin lock
> v6:
>    - Fix review comments (Matthew Auld)
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Acked-by: Thomas Hellström <thomas.hellstrom@linux.intel.com> #For the xe_bo_move_notify() changes
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c           | 56 ++++++++++++++++++++++++++--
>   drivers/gpu/drm/xe/xe_bo.h           |  2 +
>   drivers/gpu/drm/xe/xe_bo_types.h     |  3 ++
>   drivers/gpu/drm/xe/xe_device_types.h | 16 ++++++++
>   drivers/gpu/drm/xe/xe_pci.c          |  2 +
>   drivers/gpu/drm/xe/xe_pm.c           | 17 +++++++++
>   drivers/gpu/drm/xe/xe_pm.h           |  1 +
>   7 files changed, 93 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 8e4a3b1f6b93..2e4d2157179c 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -586,6 +586,8 @@ static int xe_bo_move_notify(struct xe_bo *bo,
>   {
>   	struct ttm_buffer_object *ttm_bo = &bo->ttm;
>   	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
> +	struct ttm_resource *old_mem = ttm_bo->resource;
> +	u32 old_mem_type = old_mem ? old_mem->mem_type : XE_PL_SYSTEM;
>   	int ret;
>   
>   	/*
> @@ -605,6 +607,18 @@ static int xe_bo_move_notify(struct xe_bo *bo,
>   	if (ttm_bo->base.dma_buf && !ttm_bo->base.import_attach)
>   		dma_buf_move_notify(ttm_bo->base.dma_buf);
>   
> +	/*
> +	 * TTM has already nuked the mmap for us (see ttm_bo_unmap_virtual),
> +	 * so if we moved from VRAM make sure to unlink this from the userfault
> +	 * tracking.
> +	 */
> +	if (mem_type_is_vram(old_mem_type)) {
> +		mutex_lock(&xe->mem_access.vram_userfault.lock);
> +		if (!list_empty(&bo->vram_userfault_link))
> +			list_del_init(&bo->vram_userfault_link);
> +		mutex_unlock(&xe->mem_access.vram_userfault.lock);
> +	}
> +
>   	return 0;
>   }
>   
> @@ -1063,6 +1077,11 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
>   	if (bo->vm && xe_bo_is_user(bo))
>   		xe_vm_put(bo->vm);
>   
> +	mutex_lock(&xe->mem_access.vram_userfault.lock);
> +	if (!list_empty(&bo->vram_userfault_link))
> +		list_del(&bo->vram_userfault_link);
> +	mutex_unlock(&xe->mem_access.vram_userfault.lock);
> +
>   	kfree(bo);
>   }
>   
> @@ -1110,16 +1129,20 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
>   {
>   	struct ttm_buffer_object *tbo = vmf->vma->vm_private_data;
>   	struct drm_device *ddev = tbo->base.dev;
> +	struct xe_device *xe = to_xe_device(ddev);
> +	struct xe_bo *bo = ttm_to_xe_bo(tbo);
> +	bool needs_rpm = bo->flags & XE_BO_CREATE_VRAM_MASK;
>   	vm_fault_t ret;
>   	int idx, r = 0;
>   
> +	if (needs_rpm)
> +		xe_device_mem_access_get(xe);
> +
>   	ret = ttm_bo_vm_reserve(tbo, vmf);
>   	if (ret)
> -		return ret;
> +		goto out;
>   
>   	if (drm_dev_enter(ddev, &idx)) {
> -		struct xe_bo *bo = ttm_to_xe_bo(tbo);
> -
>   		trace_xe_bo_cpu_fault(bo);
>   
>   		if (should_migrate_to_system(bo)) {
> @@ -1137,10 +1160,24 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
>   	} else {
>   		ret = ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
>   	}
> +
>   	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
> -		return ret;
> +		goto out;
> +	/*
> +	 * ttm_bo_vm_reserve() already has dma_resv_lock.
> +	 */
> +	if (ret == VM_FAULT_NOPAGE && mem_type_is_vram(tbo->resource->mem_type)) {
> +		mutex_lock(&xe->mem_access.vram_userfault.lock);
> +		if (list_empty(&bo->vram_userfault_link))
> +			list_add(&bo->vram_userfault_link, &xe->mem_access.vram_userfault.list);
> +		mutex_unlock(&xe->mem_access.vram_userfault.lock);
> +	}
>   
>   	dma_resv_unlock(tbo->base.resv);
> +out:
> +	if (needs_rpm)
> +		xe_device_mem_access_put(xe);
> +
>   	return ret;
>   }
>   
> @@ -1254,6 +1291,7 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>   #ifdef CONFIG_PROC_FS
>   	INIT_LIST_HEAD(&bo->client_link);
>   #endif
> +	INIT_LIST_HEAD(&bo->vram_userfault_link);
>   
>   	drm_gem_private_object_init(&xe->drm, &bo->ttm.base, size);
>   
> @@ -2264,6 +2302,16 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
>   	return err;
>   }
>   
> +void xe_bo_runtime_pm_release_mmap_offset(struct xe_bo *bo)
> +{
> +	struct ttm_buffer_object *tbo = &bo->ttm;
> +	struct ttm_device *bdev = tbo->bdev;
> +
> +	drm_vma_node_unmap(&tbo->base.vma_node, bdev->dev_mapping);
> +
> +	list_del_init(&bo->vram_userfault_link);
> +}
> +
>   #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
>   #include "tests/xe_bo.c"
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 97b32528c600..350cc73cadf8 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -249,6 +249,8 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>   			struct drm_file *file);
>   int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
>   			     struct drm_file *file);
> +void xe_bo_runtime_pm_release_mmap_offset(struct xe_bo *bo);
> +
>   int xe_bo_dumb_create(struct drm_file *file_priv,
>   		      struct drm_device *dev,
>   		      struct drm_mode_create_dumb *args);
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index 64c2249a4e40..14ef13b7b421 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -88,6 +88,9 @@ struct xe_bo {
>   	 * objects.
>   	 */
>   	u16 cpu_caching;
> +
> +	/** @vram_userfault_link: Link into @mem_access.vram_userfault.list */
> +		struct list_head vram_userfault_link;
>   };
>   
>   #define intel_bo_to_drm_bo(bo) (&(bo)->ttm.base)
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 71f23ac365e6..dd0f4fb57683 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -385,6 +385,22 @@ struct xe_device {
>   	struct {
>   		/** @ref: ref count of memory accesses */
>   		atomic_t ref;
> +
> +		/** @vram_userfault: Encapsulate vram_userfault related stuff */
> +		struct {
> +			/**
> +			 * @lock: Protects access to @vram_usefault.list
> +			 * Using mutex instead of spinlock as lock is applied to entire
> +			 * list operation which may sleep
> +			 */
> +			struct mutex lock;
> +
> +			/**
> +			 * @list: Keep list of userfaulted vram bo, which require to release their
> +			 * mmap mappings at runtime suspend path
> +			 */
> +			struct list_head list;
> +		} vram_userfault;
>   	} mem_access;
>   
>   	/**
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 1f997353a78f..4de79a7c5dc2 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -775,6 +775,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>   		str_yes_no(xe_device_has_sriov(xe)),
>   		xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
>   
> +	xe_pm_init_early(xe);
> +
>   	err = xe_device_probe(xe);
>   	if (err)
>   		return err;
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index b429c2876a76..d5f219796d7e 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -163,6 +163,12 @@ static void xe_pm_runtime_init(struct xe_device *xe)
>   	pm_runtime_put(dev);
>   }
>   
> +void xe_pm_init_early(struct xe_device *xe)
> +{
> +	INIT_LIST_HEAD(&xe->mem_access.vram_userfault.list);
> +	drmm_mutex_init(&xe->drm, &xe->mem_access.vram_userfault.lock);
> +}
> +
>   void xe_pm_init(struct xe_device *xe)
>   {
>   	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> @@ -214,6 +220,7 @@ struct task_struct *xe_pm_read_callback_task(struct xe_device *xe)
>   
>   int xe_pm_runtime_suspend(struct xe_device *xe)
>   {
> +	struct xe_bo *bo, *on;
>   	struct xe_gt *gt;
>   	u8 id;
>   	int err = 0;
> @@ -247,6 +254,16 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>   	 */
>   	lock_map_acquire(&xe_device_mem_access_lockdep_map);
>   
> +	/*
> +	 * Applying lock for entire list op as xe_ttm_bo_destroy and xe_bo_move_notify
> +	 * also checks and delets bo entry from user fault list.
> +	 */
> +	mutex_lock(&xe->mem_access.vram_userfault.lock);
> +	list_for_each_entry_safe(bo, on,
> +				 &xe->mem_access.vram_userfault.list, vram_userfault_link)
> +		xe_bo_runtime_pm_release_mmap_offset(bo);
> +	mutex_unlock(&xe->mem_access.vram_userfault.lock);
> +
>   	if (xe->d3cold.allowed) {
>   		err = xe_bo_evict_all(xe);
>   		if (err)
> diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
> index 6b9031f7af24..64a97c6726a7 100644
> --- a/drivers/gpu/drm/xe/xe_pm.h
> +++ b/drivers/gpu/drm/xe/xe_pm.h
> @@ -20,6 +20,7 @@ struct xe_device;
>   int xe_pm_suspend(struct xe_device *xe);
>   int xe_pm_resume(struct xe_device *xe);
>   
> +void xe_pm_init_early(struct xe_device *xe);
>   void xe_pm_init(struct xe_device *xe);
>   void xe_pm_runtime_fini(struct xe_device *xe);
>   int xe_pm_runtime_suspend(struct xe_device *xe);

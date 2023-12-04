Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60012C46CA3
	for <intel-xe@archiver.kernel.org>; Mon,  4 Dec 2023 11:57:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE0CA10E1AA;
	Mon,  4 Dec 2023 11:57:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D37E10E369
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Dec 2023 11:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701691070; x=1733227070;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vF6odmCa2NScNS4i1DB6L2P/9MNlgwwFNgf2jNBf4dM=;
 b=E3Cte8JAdnevQkmr1TKcFzqVw0Ny+wof65DVEydT3xm6/N7hGwyNQZtV
 +PksRMOD9YnFimA8zCaZ39vSCrjIPYv7MmM7dILABEBN1dgCTw+thmv/D
 jjUfg/cV/AMYr5fpZ4c4Ye8VnSnbxTV4hTV2x8bPM7FEZ3v7jlhoHvneO
 PUr1+24dYx+rM8UHgwnXj9jla2hR0x+XAhIuAaOunvYqNz8bjR8KTAkHY
 ouY5e+LXyF1ZbkDOhxnvLIOfQj1BC2SDb5L7mEhTYbZ1MyWyyaYWei34K
 uqYgKcT4Fer+r22piKLcglwWO/o2uTS5brOEbxiHd3LtWF05yhQusZwia Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="620022"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="620022"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 03:57:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="770512770"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; d="scan'208";a="770512770"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Dec 2023 03:57:48 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Dec 2023 03:57:48 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 4 Dec 2023 03:57:47 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 4 Dec 2023 03:57:47 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 4 Dec 2023 03:57:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eijeRf0c5+offZjunnevd2x2LUZxiRZuheYRseDRNY+ad6QH5fANOdp5Po7ZzsuGRD6QNipSwbHr7VD0BqvYWrf6u27Qe1U97rh+cftf1aCRUVStfudJYrUbbigwqo4dJyVN7BJ8SpXnAe/St4v7l8/uFG6+aT4KFMxOhPJLYg10MkYRtD6oL14+rzQv2JSL0z78so0ka4QXtPrgna+mNOAG2srqjEewQO2Di2c9Smstvx+3jp0ng4gXmd9KAp/zWH6740tkhlmCZEZtUt1PrJuyeGifektHs5EYixhfVV/LwZ+SagBeBQ9J6fI1qZgbn5Q+kAsnIQrZNkXzEtK2hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3GJalgBxU2ThECVsUdyf63bgcrONK4ZqSjMDbzapID4=;
 b=O2GkrZVXt3Bjf1xPZuh1GQBTsW2CUEe5SeYcFMnKcY9Ah+zLkD998CuU5RFGo0K0j9Ir5PsbMP1xK7jgTBBTLE1Gyve4pEc89wXp3c9nCEvu9J207QK0pz2+GTU1yWL8uHkCAhsoc98YnFIGomfvuNtugflNxcmtLOMllfmK9OTnRvvIyRPCrQZxPqxDoNt9M8jLokfSdKoI9zRXCSgn6GQ5jRi8OD/zKlBV5AZjoKfZVYalZRStnsWQ9bsqN7AkRXQSRXO2xlkJLPJC52i0RRWk4cC/axbGoeQ6DsU2Un6UWsqk+fUdaRZP69zLrOMLy73A1zGAcXcr92A+FOVK9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH8PR11MB7968.namprd11.prod.outlook.com (2603:10b6:510:25f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 11:57:45 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6%7]) with mapi id 15.20.7046.033; Mon, 4 Dec 2023
 11:57:45 +0000
Message-ID: <6a0bbe2f-c990-4be2-8a14-b09e224feead@intel.com>
Date: Mon, 4 Dec 2023 17:27:38 +0530
User-Agent: Mozilla Thunderbird
To: Matthew Auld <matthew.william.auld@gmail.com>
References: <20231204052609.3283031-1-riana.tauro@intel.com>
 <CAM0jSHOk7sGu6tHOmnsYryRf7dNSJM5rk_gqV-+6wF4ZvzNxBQ@mail.gmail.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <CAM0jSHOk7sGu6tHOmnsYryRf7dNSJM5rk_gqV-+6wF4ZvzNxBQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0059.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::13) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH8PR11MB7968:EE_
X-MS-Office365-Filtering-Correlation-Id: f6bfec44-2954-4d4c-a034-08dbf4c03a42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UiX/0prly2MS2lxgvXogrNsBO//7kUxUuidBR9rykKwoH0VOSvAnkgPHUkf+gO0eZ4rBAweQIIQKUtbMK4kapUCx/LieoJTfNdEY+AW+9HsFdRX2s9M3lJMWHlBMY2CyStGuJwYnV9cQYF8rAWE/B5eImpQr4WQkPR4O1XrnITVxZ2dzZWanH3v3QNI2JuZ22nPxNmkxmsZzMPYW4awbTsNHGDmyYQMW1ZprvfQQ5SmZktog6XoqC6u4OKTCZ8xBYcIIXFWMAszn2/7IR0HICroEtondraADMLJOzE6VxfxfTUkzeRpP30fe8OkoUzv/qECHwfmy9opTtWI5vTPAkQDFRyt1fu16vmERDR50qixV6iLp7L7YYD5Sv26IziBJ09BYMncsXnFaMBNbF2g5m6ZmSmByvZWKw6kFjv9I6Ub7oMGEq6//3h8lpHUY03jtoaQMBPNP7lzWCKRfM3kVJxqOnwSX442qsctRTvMkX/4sClaX7aIxem0XevZRidc0GRdzsAiALiX2WllINzjaGsFOleu70hiBBZLn1EOzZYKrSeYQtP+ym7JCSCqs8rqfOK8XGCaNZgVHSPxAZXmcW/wliNCIozAgoWLY6ewACM1pUo63R5slYyfA9fPx9jfu1uLzzE52s6ypcvkA6ryY3f8c9/WD2NAr6/tA9ykNGrc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(39860400002)(346002)(136003)(366004)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(107886003)(31686004)(2616005)(4326008)(8936002)(8676002)(6512007)(6506007)(53546011)(83380400001)(82960400001)(26005)(966005)(6486002)(478600001)(6666004)(66476007)(66946007)(66556008)(316002)(6916009)(2906002)(36756003)(41300700001)(38100700002)(44832011)(86362001)(31696002)(5660300002)(32563001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEVKeFlwbUZIaExhWXZYbHlJOVJtRVB1Smp4eFgyc3BRQTBEOHdiUFpRVC8r?=
 =?utf-8?B?UEVxejE1azM5bEtUWUFwb0NhRU1SbHZubmNPTWZYNE5ObDhYeitnVWdWT1Bz?=
 =?utf-8?B?L2hBMUU0ZmdGYzFTa083YWRzTUhjTmZrclR6ZnByVitiZmJjcnNuUWpVM1NU?=
 =?utf-8?B?bE9IeVNnSUtRcDNMWkIzQUVidEk1SUJIYnhScmdlZ0J5WHdnallXR3ZYeWcx?=
 =?utf-8?B?WmFtYkFrWWNOamNiS3BZaVcrYlJ1dFVQOWNxSHF6bkF4WnNQZjJTbmVQVkVL?=
 =?utf-8?B?M0dURFRDRkZQa0RMN1NwWXhtamlwTCs2d3hDOC9yTzJYcEdoM1daRmhuUDRI?=
 =?utf-8?B?RmFVc2RKZVhIUy9YSHo1NENzNlRsNXZDVXUyQy94bzMxN2JxKzB0LzlTNENG?=
 =?utf-8?B?OVk4NFJTYldUdklDSUIweExUcHE3QU9aTHlKSDNaV01xTHZSN21ORkNnVHdu?=
 =?utf-8?B?cUJjb3hhb00vaWZLbHRwbzdLcXh3M3l1SGl5MEFnUExPTEREbjRZUkFyTU52?=
 =?utf-8?B?RXArUzBkb28ySlJ6NEpRUjArSWVObGRycW0vSjZzclpKZmtSZWtjNklKWndG?=
 =?utf-8?B?eUNmMTc0OGRQQU5rNlF1UnRSMzhYdEVObEZYT2RMUStQckxycmxqUSs5SCtQ?=
 =?utf-8?B?OHdvVlAwSzlIQ3ZPN2JwZU9ONndHRDRGTFUvQ1laTUMzUEt5M1gvUWJrWlc2?=
 =?utf-8?B?MTFuWXlpNDg2MkVHWlJxZTNUbVV2MGR5YkVhQm93K2FVMzVzN2ExRi9NUk1R?=
 =?utf-8?B?MUdpUWh0OTFodVNNYW9JRUxIRGpycDlnWnJIWEx3UDNkSThqdXpFTml4eGlI?=
 =?utf-8?B?VzN4RlBTd2NNdS9Jdnp1U2wzS0RkeHA5cm5MVFN5NWkzY2oreEdRaThnTW9B?=
 =?utf-8?B?YjdRMGhQYmZqUHFMbG5ZMjBtVVZnUEpxSm5idjc3dTJhRmI1Qm5tNWhqN3VU?=
 =?utf-8?B?Zm9jaHdzdUJSdEwrbno5aVR4SFBmazZSdjlaVVZVVHJvYWRrb3AvTGkvREhK?=
 =?utf-8?B?RVNqc0s0cE5aWEYzTXh3RVgvWjB5V1N1eTBKV2FpWGFZVi9IMks5Z24wN3Qw?=
 =?utf-8?B?bE9udzBvVVJEUDdYb3diZm9ZRGlxMjh4NjRCeVpxMmVPQTFKTHVzajE5dHpD?=
 =?utf-8?B?cFlQLzRkbjZkL05kTUUxSWt2bERmN3p5UUJ1RGNtTUk3L0hlMERqZlYzRmM3?=
 =?utf-8?B?ZGlPWjRvWnE1LzZLTnRpcDR4Nmx1Zm1NUHRRdTlqMDhqTjdrN2svbjV3MmxK?=
 =?utf-8?B?K3hRSy92dmtsZ2I3RnROUVB4Y3F1NWw3aklNMU9KL09EYnBzOEh1c3UzVWVF?=
 =?utf-8?B?S09nS0g3RGxFUnFNSEVQZlNwNm5UYXJ5RE5xMUdGbklaQ0lZOTZQcS9tNXAr?=
 =?utf-8?B?U2dJMTRRQkF3UFNjSWpIejQzNXdKUUkxRDk3bG5Xdm5RL2VtNjNaWUE1Tisz?=
 =?utf-8?B?UzF5alM3MjYwVDRVU0UwZTQrMGgzS1ZqYzB5VDJ5ZUtZMXo5eDNyQ0hVaytE?=
 =?utf-8?B?Vit6Zy9sWkQyUVltMFg5Tk0wMjE2cW5idEF0dGNPU0c3RTM1dG5hUDVYQlB0?=
 =?utf-8?B?S0hVbGJyT0hORWFZZkt1WW93V29VK3ljZkV2SDdhaWZ0N2JmMk50K01xRWtL?=
 =?utf-8?B?UlpOemhYS0VDa1lLQkJsUUNBV0FwMDlHNXoxQ3k3YzI0bWJxOWxxc3N0aFE4?=
 =?utf-8?B?NmFLN2tVSWtvL2IvNW50SlpkS2NmUEphVnh5NjQ2UnA1QVh2TjRHTVBDeEt3?=
 =?utf-8?B?WDNxcWJaWHFNU3RHdko4V2VoQlpTeHQ2L1dZcWllVkE2NUlxblg3UklNeUNM?=
 =?utf-8?B?MlpsZXA1ME5oaVUxUThkZTlqMFFoNkxnU3RUcFBwZlNBV05pTTJQNVZRZERB?=
 =?utf-8?B?VlZjK1NoMmswZ09FUGMySmNZMHB6dUZydGZHbFVMbFZ1V1RGQkpmQ09pTUt2?=
 =?utf-8?B?NDZWVFVrL2pKNEprYXRsYXNCZXY5N2RGcHhvRU5pcW1TOXpzNlNCLzZRSnVK?=
 =?utf-8?B?Wkpud0RhS2hHaHN5VEVoSHluOTdtSmgreHJCbEpjaGhueEFYUkdjTlErVThX?=
 =?utf-8?B?RjZmM2xTN0pFWTVyWU16UE15VkYzNVNaQXo1N3dhVGhWMmJPTHgyTjJMSTlJ?=
 =?utf-8?Q?NGPe+KdjQODG8zbA4uA/ZFnKf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f6bfec44-2954-4d4c-a034-08dbf4c03a42
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 11:57:45.5135 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NMeFky4AaRPpw5n89r3D3BEWO1ajlWBwShUzYKMP6Olh9oex0VUjfrgws/knZkWLEDvEJpzL3983bnnyabVVDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7968
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 0/2] Fix deadlock issue on d3cold
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



On 12/4/2023 4:27 PM, Matthew Auld wrote:
> Hi,
> 
> On Mon, 4 Dec 2023 at 05:18, Riana Tauro <riana.tauro@intel.com> wrote:
>>
>> kernel BOs need to be restored to the same place in VRAM, and with
>> d3cold that means that any VRAM allocation can
>> potentially steal the spot from kernel BOs which then blows up when
>> waking the device up.
>>
>> However if we end up moving xe_device_mem_access_get() much higher
>> up in the hierarchy (start of the gem_create_ioctl) then
>> this is no longer possible.
>>
>> This patch fixes the deadlock issue seen in
>> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/256
>> Also enables d3cold to get CI results
>>
>> Riana Tauro (2):
>>    RFC drm/xe: Move xe_device_mem_access_get to the top of
>>      gem_create_ioctl
>>    CI drm/xe: Enable d3cold
> 
Hi Matthew


> Tried this locally on DG2 and it triggers lockdep splats for me when
> loading the module, so it looks like a lot more is needed before
> turning on d3cold. 
The lockdep splat seen on load when d3cold is enabled has the below 
stack trace

xe_tile_init_noalloc is called before runtime suspend is initialized
using xe_pm_init. Seems to be a false positive

[  150.900520]
                -> #1 (xe_device_mem_access_lockdep_map){+.+.}-{0:0}:
[  150.908078]        lock_acquire+0x169/0x3d0
[  150.912276]        xe_device_mem_access_get+0x53/0x220 [xe]
[  150.918067]        __xe_ggtt_insert_bo_at+0x12a/0x3e0 [xe]
[  150.923760]        __xe_bo_create_locked+0x2f5/0x6e0 [xe]
[  150.929353]        xe_bo_create_pin_map_at+0x42/0x270 [xe]
[  150.935033]        xe_bo_create_pin_map+0x1a/0x20 [xe]
[  150.940366]        xe_sa_bo_manager_init+0xac/0x300 [xe]
[  150.945884]        xe_tile_init_noalloc+0x74/0x110 [xe]
[  150.951316]        xe_device_probe+0x765/0xaa0 [xe]
[  150.956392]        xe_pci_probe+0x53d/0x860 [xe]
[  150.961220]        local_pci_probe+0x7d/0xe0

                -> #0 (reservation_ww_class_mutex){+.+.}-{3:3}:
[  151.049443]        check_prev_add+0x1ba/0x14a0
[  151.053886]        __lock_acquire+0x203e/0x2ff0
[  151.058413]        lock_acquire+0x169/0x3d0
[  151.062596]        __ww_mutex_lock.constprop.0+0x164/0x1e50
[  151.068161]        ww_mutex_lock+0x42/0x1a0
[  151.072343]        xe_bo_lock+0x2f/0x40 [xe]
[  151.076817]        xe_bo_evict_all+0x57d/0x610 [xe]
[  151.081893]        xe_pm_runtime_suspend+0x38f/0x3b0 [xe]

This does not affect the functionality of d3cold.

However I also had to manually set the
> d3cold.capable=true. Wondering if we have machines in CI that are
> d3cold capable, since BAT results are reporting success?Yeah didn't see this lockdep splat on load in the CI DG2. it also has
display enabled so it won't enter runtime suspend.

Thanks
Riana Tauro

> 
>>
>>   drivers/gpu/drm/xe/xe_bo.c | 26 ++++++++++++++++++++------
>>   drivers/gpu/drm/xe/xe_pm.h |  2 +-
>>   2 files changed, 21 insertions(+), 7 deletions(-)
>>
>> --
>> 2.40.0
>>

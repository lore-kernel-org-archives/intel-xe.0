Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 988E4C4332F
	for <intel-xe@archiver.kernel.org>; Mon, 13 Nov 2023 20:29:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63E3A10E41E;
	Mon, 13 Nov 2023 20:29:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6738010E419
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Nov 2023 20:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699907355; x=1731443355;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=+ttcUqyDCa/27QPaGW3P+dBWJBPjE5AsQDFUFd1ciJ4=;
 b=FrgWqYUMnspQJld6sqMGkvppQu+WH9fX+5mMbFbv969WeH1EHaw9KDMc
 BAm/ctoRdfCIrnR4B0DWoCL6YMphQ5NowXLZ9HJlRHFU1E4jgG8/f1Kth
 qE3wJKnYGQpe47hYRM0VBB7P3nzBt/MSkzvuOteCqUfqediKIPxP5EeDp
 2zHGJ/r8pvqNl1ajeo7xged2Vdjh51nFs8B0AiMGEfOcu4S6ituJcvvjb
 TwSGZP5v6kKMOQxXh8xJa5gCF2sCWENKKFicG2MavAzzqLzcL7oYRCiEF
 W896N83E6hc1GBCB8Feb7GoB3U599zrEzubzC7Ju6DjAAXxrtX+QrLgz+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="3593368"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="3593368"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 12:29:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="5571481"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Nov 2023 12:29:15 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 12:29:14 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 13 Nov 2023 12:29:14 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 13 Nov 2023 12:29:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P9ZYqe5Gu3cIo2qGweALQSCCXKX5ySYB+ldSq1VC+LE7XOQTtS2lQXAj4bd9+EFCn0I8IX51CgCm+xksH+2cHIUWnjSSEJ0hAeKhnCttMP7brbkbJNPHrJ87ip/GkgfdpNJrLxpOHTMRoVyYpXZNbAiVHRx9iImNkBsBpsQ4YL77nASFl6e1aOWFjtXpVTZAuPieT04R93bJd0xpu4zwDYiIYDY5yCB2nj5r3EvwUk5n2RYAdzhlFYF1H49sxyz1SGcsTOrFMDaANnw+MwyWAuumpSeiGHmUr8TENl+3C9+gvvwPSlpAY/9kCnomY6Je2412FX2fwbB/n/c8rLjTPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UYZWgD5OSk3H+vDsmWMZfRf88uYRSGyPUE1Vbu1+QjA=;
 b=cdE7co2ZJuBOcX9J48tAN2sKWTEtifQOJTS1czFkAkgfPqCoI1TwXp13CSd8kMlISdccE31VQZPLWz7+aP+mk+zCa/6u2zt667X+K57p7p3JITbTQFbtdUP+Q+PiT7P5SRclCY4HEMrTe6TcKaEHYCU4f2huhC5ibuGV008ZG8GkA8BDJ/3RhOn1vGKm65GexxyZ8CfENXhN5PaEqWwBPujyaBk3LNMGc5OemMzbeO0mvPwFudnMjbv4LjOVOJgbdFFhnyboKSf1i6qOY6RDrKMMH95klsgNDY/xcd7WVdFjXAMB6ad7b1cK1ec4u9igxhQduOhhQqCd5pPljuA/oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SA1PR11MB5899.namprd11.prod.outlook.com (2603:10b6:806:22a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Mon, 13 Nov
 2023 20:29:11 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54%4]) with mapi id 15.20.6977.029; Mon, 13 Nov 2023
 20:29:11 +0000
Message-ID: <04d426af-fb73-4913-9051-dce6a9d74ec5@intel.com>
Date: Mon, 13 Nov 2023 12:29:09 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: <intel-xe@lists.freedesktop.org>, Patchwork
 <patchwork@emeril.freedesktop.org>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>
References: <20231027222928.1981633-1-daniele.ceraolospurio@intel.com>
 <169844597788.19710.16664047200755648500@emeril.freedesktop.org>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <169844597788.19710.16664047200755648500@emeril.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW3PR06CA0018.namprd06.prod.outlook.com
 (2603:10b6:303:2a::23) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|SA1PR11MB5899:EE_
X-MS-Office365-Filtering-Correlation-Id: 772874f6-61c3-49ec-61fd-08dbe4873226
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H9t9tsxbvu3ct0113KSr9K5xbNx/nnrLiqiU+y0chTUsXO8Oct9czv9uuLN01NN+OmYcHUuAg5GmRgvpbhalx5rxOa+pzA6I6v26BsNJdmWeORp4t0gp6HA6DVRa1BgFh9tjnvzdoXsMZqYMxUzZxI3HXqWjKIzRJvBPlo5OFvXPfF4oIT0R97P4YdrUfmcysUM4U8CFNzXHmVRsaGEA1DFaPa2Nj3iIg3SqqX406G9jCUwt0I7S0C/qOLWTzsC6IodYLw07F3LMPCPkB77otdyJEg7HEquzCICD3MdRMs6N/DQbkcnr3Wf9Kmdls2tgp2FmM1Sk6GQ6evmiqpMtdAL1N6JWttrbQrRFZildwj+XmBEfjdb+EtLgB8eLfagP1uVBzeYnqFRVGaqQ/XtzXWzrQtINgXrD5CODhzIzfiLm1igLQuuSIWpUKIIVW18pjL+si7YO1M4HPhC4xW1yDzb6Ej+rlXDn9JOlS8hLe1BQwaWjKAV4tpfija5WKbATBHUplVmfhQUB1l76PKWwgxSwfPJyGju4sSScB9aHgfD+Xh59GpPYyOyLWlpufNUBxiGYQcVvltKDQjQVEmjvVaf4nXiVShdLjoPaY7wGx7bCnPUd53qpp2S5QJoNklrnURs41oKpom2nbx2HISpVLiv7Jir85gQIuUMu1eK4OVoLCVbhP4NZgT6PJQ65VUOg9yym/PRCj6NpyhuEVbeZpA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(136003)(376002)(346002)(366004)(230173577357003)(230273577357003)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(2906002)(6506007)(53546011)(478600001)(31696002)(86362001)(2616005)(26005)(6512007)(316002)(66476007)(66946007)(66556008)(6636002)(6486002)(966005)(82960400001)(38100700002)(83380400001)(5660300002)(36756003)(8936002)(41300700001)(110136005)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWNDZUxRdlk5N3BQaXJYWCs5Nkp6S2pEU2pWc1VyNVM1dWtIUTZ6V3kweEs0?=
 =?utf-8?B?Z0x2V3ZVN0FxUzNyRTlwRlV3WENBbi9Ic1IyQk5GTjg0Q3Z3WUdjeHI2cnJm?=
 =?utf-8?B?Sit2b3pzdGFQKzlnTEUycG0xWXN4MWF5WWVaR3RyblRmbDVIZDV5OWtJdERu?=
 =?utf-8?B?cTRyU1pNVGNDQjdCUU90N0p4em1QOWpMUCtZVURpeVEwYU52QTM3VkYvUXgr?=
 =?utf-8?B?VWR6OXh0TVlteFl5QS95cFUvcy9tRVUycjBpa1dlemVCdk1TMk1ZbFBqdEla?=
 =?utf-8?B?SXBlMlNHTnlBYkh5T0MycXozUjhXVTZWbHM5TkVJTHYyQ2pCckxHUHh5V1ha?=
 =?utf-8?B?MTROc0dIV2JzY0lNa0F6dE9aSmpTK0VNS3NVR3dYOWk2czN5dHBxQ2NKaWZl?=
 =?utf-8?B?T0wxckVIUDh2VU1sWHd5RllKS0hRMWNtTHFaRXV2c1VzdjZZQy9wLzVtYVg2?=
 =?utf-8?B?cDBkSkNScFBxK0swWHBRSjBENG04R05IaWk0UWh0YjJ0K3A1dGRWOFhxZVJX?=
 =?utf-8?B?REg5aldmQW02dWxlN3VTWHNLYS9DazlQQTJwNVV4Qkl4TU1GNmFBUWJOQm44?=
 =?utf-8?B?d29vbzJiYXh3UG9DQ1BDM2o1NlNhcVREeWZiQWxXbERUeWRUbkZManNWQS93?=
 =?utf-8?B?Tnd5NjdIcnJ3TEFSaWwzNVJIQnZpaWhiUkxheDkrelU1Q3FudVFSYnVDOVVF?=
 =?utf-8?B?N3lFSnFMVjM0aHBPcU1UaXQ3N3NsSldGK3ZJMnJZalMrSkJwQzhKblZmL09y?=
 =?utf-8?B?MFBCZ0hlWWg1TDZmcXZ3Z05hc0d6S0N0Z2F6dnFIVHlRQmdEU01QRXJqUXZH?=
 =?utf-8?B?ZkcxSUpLZHVLWGdHTXBLM3RGSlI0djBFVEdPbmgyMHV1Vm9HVUtmMXdhb25h?=
 =?utf-8?B?Q0Q2WnoxNTlsRW15Qnp0ZWFWZXlHQXpmeVU0bTVPVUp4b2NLQS9wYXZXeEVL?=
 =?utf-8?B?clMxSE9BaXhGdWpDWWRuUXZQNFc2YkU0bnJOYUgvN1lmdFdUR1pLaFFOZXFh?=
 =?utf-8?B?MEVnNmxGMUN2ZlpVaTNjcXVCelNJU3d6dVUvcytXZElDb2QwOXBOZ01FM1hz?=
 =?utf-8?B?QzhvaGdIeG9pWitxZVBmL1QzaElFdzJyZi9lTGpVR2YzZkZlTUFMZ1l1eTJu?=
 =?utf-8?B?L21hUXZCVWhkdlk2TlQvZG1Bb3k4VnVSUTE3ZDd6eDRvQlRkTFpraGdQOEJa?=
 =?utf-8?B?UlBhc082VnBCNzFPZGx6aDZoNnprQlUzSVJQeUNKTHg3U2dSeEI4TmFJdVRv?=
 =?utf-8?B?N1NyMmdCSFNnMFRaRU5MQkJzT1BKaUhobE9vTTZKeVA4eW93QVlLem82YnUy?=
 =?utf-8?B?UnF3YzlCNVJub3M2RUg3Y3dYQTVjSXVKaHczbGorVUc5dCt3N1RsTjJtVUI1?=
 =?utf-8?B?YnRMdnFKTXRKOGQrU0JEOTNmK1NvMDhTeng0ZFBWMlhrTHNZdk1lR2pUZ00y?=
 =?utf-8?B?KzdaS3ZxMXVGYlVVVW1zWmRSQTJ4bmlDdktDRGY1WGJPYVI3SmNoeTFSakta?=
 =?utf-8?B?ZWozZ21JWm1FaFFXVnhjeTkvRXJ6RDVrbTV6bWlCYlVYd08vWlMrQnhsK0lS?=
 =?utf-8?B?MHFRbU5HZ0tKWWlxc2FNYkh3MzhjcFhJTFlMZTYrUU9kK01tMnZhMncvdGE4?=
 =?utf-8?B?YTRrR2R3SmhvVENPT2pHSkR5blJsN3FxKytlak5ub0xuWHZHVUIyK2Nidmlx?=
 =?utf-8?B?V0FVem8rWUpXQlpFc1BnMlhvOVUvdExtdkxmNzYya0NCMU9YQmloVjZPbjFo?=
 =?utf-8?B?TjRwT3QvZDlISkNvdU8xSnFSbzJXQXA3aEx1R1BrbE9jWW5oUDdGanhoYWZY?=
 =?utf-8?B?V2wyV2hOZmpaaEVSOUlCK00yWFhPblRZTUdnRjBiMndPNXhYSjh4d3UzNjZI?=
 =?utf-8?B?RnVtbEZ5T1JCdGZZSlN3OU1YSGJwNnBnVmpPT2NLczNCWmVtcDNYd1oxeEIv?=
 =?utf-8?B?aHFWTzNGT2Fma3B1RWdERnAvRW9rWHJuWXBqb2RQdkpENEF2MjA0WnBpWjFS?=
 =?utf-8?B?L2RHY2YxYjB0bUFXN2ZWQ3hLTld1MjNMN2hiYmt2RW5JaG92Ym9jR2pTRzF3?=
 =?utf-8?B?TjdNNDZOenAzSnhDcEhDNmVkU05BWExyMndTWkNxMDFwLy9iNmk3SExNRW4y?=
 =?utf-8?B?WHM4TnZQYkZmdUV2L3U3aHlEcC95UEVGM1pjbnoxQXZhRTd4VUNabU1UMGJ5?=
 =?utf-8?B?Umc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 772874f6-61c3-49ec-61fd-08dbe4873226
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 20:29:11.7640 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8e8VXy2yR/aMPbmW68GcDSzxFGpC4bs5eRCtxy3ON05fWIFOGlt/f5dAhY/vRuPNsjLLVGtbDf/816JC2PM1r60tebRW5yj3TqlVs4VxrFE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5899
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] 
 =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_GS?=
 =?utf-8?q?C_FW_loading?=
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

On 10/27/2023 15:32, Patchwork wrote:
> == Series Details ==
>
> Series: GSC FW loading
> URL   : https://patchwork.freedesktop.org/series/125717/
> State : warning
>
> == Summary ==
>
> + KERNEL=/kernel
> + git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
> Cloning into 'mt'...
> warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
> + git -C mt rev-list -n1 origin/master
> 63c2b6b160bca2df6efc7bc4cea6f442097d7854
> + cd /kernel
> + git config --global --add safe.directory /kernel
> + git log -n1
> commit bfb0ed12aee560b93dc3056de7832bcd95c6cb81
> Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Date:   Fri Oct 27 15:29:26 2023 -0700
>
>      drm/xe/gsc: Define GSC FW for MTL
>      
>      We track GSC FW based on its compatibility version, which is what
>      determines the interface it supports.
>      Also add a modparam override like the ones for GuC and HuC.
>      
>      Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>      Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> + /mt/dim checkpatch f24c46200dc8fad700f51106e678d68d38496860 drm-intel
> 01e883a3a drm/xe: implement driver initiated function-reset
> f88539d04 fixup! drm/xe/guc: Report submission version of GuC firmware
> 590a5b6a1 drm/xe/uc: Rework uC version tracking
> -:206: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'p_' - possible side-effects?
> #206: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:528:
> +#define print_uc_fw_version(p_, version_, prefix_, ...) \
> +do { \
> +	struct xe_uc_fw_version *ver_ = (version_); \
> +	if (ver_->build) \
> +		drm_printf(p_, prefix_ " version %u.%u.%u.%u\n", ##__VA_ARGS__, \
> +			   ver_->major, ver_->minor, \
> +			   ver_->patch, ver_->build); \
> +	else \
> +		drm_printf(p_, prefix_ " version %u.%u.%u\n", ##__VA_ARGS__, \
> +			  ver_->major, ver_->minor, ver_->patch); \
> +} while(0);
>
> -:206: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'prefix_' - possible side-effects?
> #206: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:528:
> +#define print_uc_fw_version(p_, version_, prefix_, ...) \
> +do { \
> +	struct xe_uc_fw_version *ver_ = (version_); \
> +	if (ver_->build) \
> +		drm_printf(p_, prefix_ " version %u.%u.%u.%u\n", ##__VA_ARGS__, \
> +			   ver_->major, ver_->minor, \
> +			   ver_->patch, ver_->build); \
> +	else \
> +		drm_printf(p_, prefix_ " version %u.%u.%u\n", ##__VA_ARGS__, \
> +			  ver_->major, ver_->minor, ver_->patch); \
> +} while(0);
>
> -:206: WARNING:DO_WHILE_MACRO_WITH_TRAILING_SEMICOLON: do {} while (0) macros should not be semicolon terminated
> #206: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:528:
> +#define print_uc_fw_version(p_, version_, prefix_, ...) \
> +do { \
> +	struct xe_uc_fw_version *ver_ = (version_); \
> +	if (ver_->build) \
> +		drm_printf(p_, prefix_ " version %u.%u.%u.%u\n", ##__VA_ARGS__, \
> +			   ver_->major, ver_->minor, \
> +			   ver_->patch, ver_->build); \
> +	else \
> +		drm_printf(p_, prefix_ " version %u.%u.%u\n", ##__VA_ARGS__, \
> +			  ver_->major, ver_->minor, ver_->patch); \
> +} while(0);
This one needs to be fixed.

Likewise the white space issues below and another redundant ; and a 
redundant return.

John.


>
> -:216: ERROR:SPACING: space required before the open parenthesis '('
> #216: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:538:
> +} while(0);
>
> total: 1 errors, 1 warnings, 2 checks, 298 lines checked
> 790a1435c drm/xe/gsc: Introduce GSC FW
> Traceback (most recent call last):
>    File "scripts/spdxcheck.py", line 6, in <module>
>      from ply import lex, yacc
> ModuleNotFoundError: No module named 'ply'
> Traceback (most recent call last):
>    File "scripts/spdxcheck.py", line 6, in <module>
>      from ply import lex, yacc
> ModuleNotFoundError: No module named 'ply'
> Traceback (most recent call last):
>    File "scripts/spdxcheck.py", line 6, in <module>
>      from ply import lex, yacc
> ModuleNotFoundError: No module named 'ply'
> -:31: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
> #31:
> new file mode 100644
>
> -:63: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'gt != tile->media_gt'
> #63: FILE: drivers/gpu/drm/xe/xe_gsc.c:28:
> +	if (tile->media_gt && (gt != tile->media_gt)) {
>
> -:231: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
> #231: FILE: drivers/gpu/drm/xe/xe_uc_fw_types.h:61:
>   };
> +#define XE_UC_FW_NUM_TYPES 3
>
> total: 0 errors, 1 warnings, 2 checks, 186 lines checked
> 7f147cee3 drm/xe/gsc: Parse GSC FW header
> -:48: ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
> #48: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:493:
> +		struct xe_gsc * gsc = container_of(uc_fw, struct xe_gsc, fw);
>
> total: 1 errors, 0 warnings, 0 checks, 235 lines checked
> 8220f5ca7 drm/xe/gsc: GSC FW load
> Traceback (most recent call last):
>    File "scripts/spdxcheck.py", line 6, in <module>
>      from ply import lex, yacc
> ModuleNotFoundError: No module named 'ply'
> Traceback (most recent call last):
>    File "scripts/spdxcheck.py", line 6, in <module>
>      from ply import lex, yacc
> ModuleNotFoundError: No module named 'ply'
> -:24: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
> #24:
> new file mode 100644
>
> -:360: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
> #360: FILE: drivers/gpu/drm/xe/xe_gsc.c:268:
> +
> +}
>
> total: 0 errors, 1 warnings, 1 checks, 408 lines checked
> 65fcf37ec drm/xe/gsc: Implement WA 14015076503
> -:96: WARNING:RETURN_VOID: void function return statements are not generally useful
> #96: FILE: drivers/gpu/drm/xe/xe_gt.c:535:
> +	return;
> +}
>
> total: 0 errors, 1 warnings, 0 checks, 100 lines checked
> b70e25c8d drm/xe/gsc: Trigger a driver flr to cleanup the GSC on unload
> 4b7e69532 drm/xe/gsc: Add an interface for GSC packet submissions
> Traceback (most recent call last):
>    File "scripts/spdxcheck.py", line 6, in <module>
>      from ply import lex, yacc
> ModuleNotFoundError: No module named 'ply'
> Traceback (most recent call last):
>    File "scripts/spdxcheck.py", line 6, in <module>
>      from ply import lex, yacc
> ModuleNotFoundError: No module named 'ply'
> Traceback (most recent call last):
>    File "scripts/spdxcheck.py", line 6, in <module>
>      from ply import lex, yacc
> ModuleNotFoundError: No module named 'ply'
> -:38: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
> #38:
> new file mode 100644
>
> total: 0 errors, 1 warnings, 0 checks, 261 lines checked
> b0022f477 drm/xe/gsc: Query GSC compatibility version
> Traceback (most recent call last):
>    File "scripts/spdxcheck.py", line 6, in <module>
>      from ply import lex, yacc
> ModuleNotFoundError: No module named 'ply'
> -:14: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
> #14:
> new file mode 100644
>
> -:89: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
> #89: FILE: drivers/gpu/drm/xe/xe_gsc.c:104:
> +	query_msg_wr(xe, map, wr_offset, header.command, MKHI_GFX_SRV_GET_HOST_COMPATIBILITY_VERSION);
>
> -:97: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
> #97: FILE: drivers/gpu/drm/xe/xe_gsc.c:112:
> +	struct xe_uc_fw_version *compatibility = &gsc->fw.versions.found[XE_UC_FW_VER_COMPATIBILITY];
>
> -:108: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
> #108: FILE: drivers/gpu/drm/xe/xe_gsc.c:123:
> +	bo = xe_bo_create_pin_map(xe, tile, NULL, GSC_VER_PKT_SZ * 2,
> +			  ttm_bo_type_kernel,
>
> -:110: WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
> #110: FILE: drivers/gpu/drm/xe/xe_gsc.c:125:
> +			  XE_BO_CREATE_GGTT_BIT);;
>
> total: 0 errors, 4 warnings, 1 checks, 185 lines checked
> 55c932772 drm/xe/gsc: Define GSCCS for MTL
> bfb0ed12a drm/xe/gsc: Define GSC FW for MTL
>
>


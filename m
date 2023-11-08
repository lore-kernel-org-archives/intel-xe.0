Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA9B4C4332F
	for <intel-xe@archiver.kernel.org>; Wed,  8 Nov 2023 00:18:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B23FB10E16A;
	Wed,  8 Nov 2023 00:18:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33AA410E16A
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Nov 2023 00:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699402678; x=1730938678;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=m7SGMbOv6akpwqFGx9isbWPOAtoU4x9wRm2b8e5aFT0=;
 b=NV1za+f1/K9rYq7RxXLUsbjE4WeTpKHMG7oBTqjqeyU6H4J27PGVRnwS
 8UYe5L9bBqRebiP0F4M9TFWpyR0iU8tsNAJt4cBBFqs0N3wnkDaOCQCW4
 ueMFtao05u4jR0jOTE9DtNXr6CSwS4LjdWZ+eWtpPAdJGbl8DmLGFXGib
 cbTGBH5q1ie86SPPCqBl9NCQqHWvhZyry+VTySCU4R+3DwL8Jo6prWzNr
 GcN3q5d6RCA4n/UuqoGCjOfUoNFC75UELdvQz1QZmikfH5bjSQNGSDu0/
 F+rcVdKc+tHXNd2Cs+yxe1aY7QTrwupoClVb7uBE8hSoTkfjt0rv1CuJK Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="11207801"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; d="scan'208";a="11207801"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 16:17:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="792008693"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; d="scan'208";a="792008693"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2023 16:17:55 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 16:17:55 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 7 Nov 2023 16:17:55 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 7 Nov 2023 16:17:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j2xWVhSxpVCA89BEqBIW/R74NHg0zhAyqy5y/TMR1ajvAFibSMdlPCqgDh+u22JTMHY1l4St0y5e8vdVYxXsZPtCh1QqOf143TCvBIxxPkyWwr0wv4mfYzlCRQzbrtPn/3rBjuBgxmS4IUmoMIgfEH+Q62VFjj+alybJqaems8CIUpC8pDSHm9CODE3uc+diCfgQZPPSDRJGRMzE0TGQ/ztKQZnyKMpN9ZsD46AmxN/UREYJXr/2PguVRW+L/NVz434NjsF/LQoc1/dKKA7HFJ55rb06YzKXDJZrGgFWDt8c6JmWYTJPDjjbGwWa73Yl+6JwWSEWpWx4QLFA7Qp6vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FY0ySZc4SBvoTuTPO6b/bwwUnzxZxYZb7mDo3J8qNOs=;
 b=DSgExcBVPUbMNL2W+dsWTGt4QnhG7aTf/EHm0SW/ulusRoQChC5li+E+AVPZFiVnUPll6CfuaPSRpSDauyamLeKRqFKjQy1q2gQJbYqL0yMhgZZ0ekDx0DZOahch9udx7nJYfy0qUiTladKoipiFLQQ/CMPHPIQSrw15EuMcSPv1q51qDI/vxVRGKODjLdmc+x+r4sz1B7fx/34hzMDOjfgWcAm1SszeYoOcRuZqce5glbVMK+nZgAkEeMZBIj+FfrpJ9QaPjElEfdEQYxrna3N41GTCpfMnS/+qInSv++P4nrlMPEOckzMYS0fUDvlS+N2KZjvUveWKtOUXUg0NNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by PH7PR11MB7050.namprd11.prod.outlook.com (2603:10b6:510:20d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Wed, 8 Nov
 2023 00:17:52 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::7c9d:a4c7:4e1e:aebc]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::7c9d:a4c7:4e1e:aebc%4]) with mapi id 15.20.6954.027; Wed, 8 Nov 2023
 00:17:52 +0000
Message-ID: <4d0648c0-9665-4303-b64e-36365c804699@intel.com>
Date: Tue, 7 Nov 2023 16:17:51 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Francois Dugast <francois.dugast@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231103143456.7-1-francois.dugast@intel.com>
 <20231103143456.7-38-francois.dugast@intel.com>
From: "Welty, Brian" <brian.welty@intel.com>
In-Reply-To: <20231103143456.7-38-francois.dugast@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0065.namprd03.prod.outlook.com
 (2603:10b6:a03:331::10) To SN7PR11MB7705.namprd11.prod.outlook.com
 (2603:10b6:806:32f::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7705:EE_|PH7PR11MB7050:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a672d3f-c2b0-423d-ce6c-08dbdff0260e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tah25F99+JM5LnF14j38XXC7Ti9z6sY+579/7wCNEnmjyOPjbV0vg1qZ7P+BcblE/AZ3Z1CAnUGrWD9qb6M8os27oUoWnhVVFFrccRBao2rBXWg6G0A3bqCwXbyYwErSywxvmh3nKIAF+WLZW5fjpXEdk0OOzQy+UyfOUeGN/08Ge/Dxz2dIZ+pLngG4huNSJn64hmqfAeqJy/ks2Qp1ldGoPrL6HqKykHv5xxGRhOD67ZzesoogKWeEPTLoXcPSsoWavNh/UJEx6k2dbqQdD7RUmxfoOHQTSgWMFA3ATYhfK+Ha6MLoxCkKi5r7fWruAidrKSkX9hNcng2P1kIaDGEc04xuCx/8pNc1vxzlie8Dy7VFazHsPcQZG56CHdlrPtyuK7vBIqJaDY2hTkFjBVQrsYHTd332vzItk1sTpbbXA7+6H9sVLB4J8/iaBFrWYpB1Q0zT2IpH/DWj6CLwhMQmt3+isVBEK5K0FQxQtVhdMaxiZYJwB5Z2+3e69CAz8DFs0g0M9gR4jfrxmHBemefd4OTcT0QmuEgYKpQ1b9Kd4UjXqnD6TKRYf+mZA69/Q08aXlJR0UmI4xw1k+gy64OE1aTdZqFuZKOaCGnZqIqgrTRYDsEgmpamhFIHJ6wZ2/9s30NRATTPiGyOQfXbtg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7705.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(366004)(39860400002)(376002)(136003)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(6486002)(107886003)(8936002)(2616005)(83380400001)(38100700002)(26005)(8676002)(4326008)(316002)(5660300002)(2906002)(41300700001)(6506007)(66556008)(53546011)(66476007)(66946007)(478600001)(31696002)(6512007)(86362001)(36756003)(82960400001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VytLZlF4bUQ4VTdhSkEvRzZCMk1ZOU5hWkpKVFJucXlhWnQxWlhDQjEvZk16?=
 =?utf-8?B?NHlBMFczMkRPOGFlSmNJWGFQemR5a1JGVUt1WkN5ZlFhd0pVTXUwcCtQcUdi?=
 =?utf-8?B?enVTRG0wQWp6ZzErS3dmU0Z3b1hLTFRjRkN1ak9Ea2wwZWwzaHNOcXd2akxv?=
 =?utf-8?B?dWdWcXYyZE42bklBOTJuWkdVT0ppUXZKOEMzMGxZTU96bnJYUlFMQ2w5Zzg0?=
 =?utf-8?B?V3doNWFRWXdTZThvMGZMYVBpZzM4emhrelIwQ2tpK3F0UytWTG8yREFCRTc5?=
 =?utf-8?B?eU9sVWpCRlM2OFZPekVBaGowOXVqYzRvVDEvVlRDRk1reXZvNmlWR1JiUkpE?=
 =?utf-8?B?cDRoZFRLeEVNbGk5Vk1XcldUSkVsM0Mxanh2NWpyZXNFRVZsUkkxMzB5UTRR?=
 =?utf-8?B?V3ltN0phVlMwd1VoU1NRbUhwMWw1ZjR3MExOVFYwOGtUTzVwVVA1MDRCVkl1?=
 =?utf-8?B?dFRLbms4UVNCU0VKYWtXZVdTZUJKUG9xZDVuZHVhdm1tMG11RlJTYmdheUw2?=
 =?utf-8?B?eDZOT0U0bzNRNEVub0owbUdnRHpXOG1MWUYxbk92dEhudmlRNUVzQ1RWYWJG?=
 =?utf-8?B?R3hTQytpeXd3YlV3QjR5WDlIcVFqTDIxWWxDZGVOR1dzTVhhRVVxM2FCaVEz?=
 =?utf-8?B?QXlRRG5nM1o0NEhVNlRtYStLSXVWMFJ0MTR1VDlsYWJLTGZzUGJiNXVad0Ri?=
 =?utf-8?B?SzNMeGQ5K0tNZzdSdFk4S05CT1kxVzEzU3BQUGM0L1VXMnhyN21NMUl5YnlP?=
 =?utf-8?B?OHRNTkw1SlRMZVlCL3VXZXdwcjlCelFmSUg3ZGlGU01ReHQ2eWNtMW12REdJ?=
 =?utf-8?B?Ky9UeG43WEZBMTd4QTcrVDN3VkVDVVhBeExkZ3JXQjdpMlJ4TEZ5cDFseFl4?=
 =?utf-8?B?Vm8welBSV2ZOVWpuOUxINFpnaW9QbXZyNVR3N21HaHR0RDlFWjB1NFpLWnQ3?=
 =?utf-8?B?L2FsT3lHRHEzTmZYTEhCZUR3bW1NNEZDSWVjdEdDd2dVSDFPWjVUL3JYMXNo?=
 =?utf-8?B?MHh1ODZ2cVZVc1dVR0Z3SnJUVDBsa01URWg0UldWVE1BaVB2RGwwdHkyS0pa?=
 =?utf-8?B?OEpaOWZ1Sm9oaVdQNytrQ0Ftd083aHd1ZWZHcThkcGJWdXE4a0dhbU05SkRD?=
 =?utf-8?B?dkxpM1RlWC9LeW5WdnQ4cjM2aFdLTVYrZnBES2hzZStONThVd2lBd0pvRytz?=
 =?utf-8?B?cUN4UXltMjdJcExlWFRiN3AwWktGTDl6TCtVbm1QTGZFbnhMaUk1OXhlb3M4?=
 =?utf-8?B?TjBnVFdmSzB3TnNYR3dieVpDemRWditCbWNTeVJaeUxzWGVNRitTTXVtN204?=
 =?utf-8?B?d2NLaGp2eUhoMzJWVEhleEEzUnZEbXQ4SkRMQUhEbVhSNUcwMW05RjVCUnQ1?=
 =?utf-8?B?VVQ5ZlMwZTljMEhrak15RTlTSXlFOVpxMWEwVGsydE16ODlmUzhZUE1PRWRa?=
 =?utf-8?B?VkZ2LzdUdGdBZjF1aVJaSXpXKzFaQWU5dUlIai9VYnVHQjBHZjZ3d2hhMTFO?=
 =?utf-8?B?ZFBKU0NqdENLNjd3SHlvU05MbUlWSU5vRVpFZDNCd1NReXpNaUpiY1l4TUkr?=
 =?utf-8?B?NWwvZ0tRWFNOZ3MxNE1ERVloNEtjbWorNCtWUUpoSVVKc3plcWlWd3ZNVGFn?=
 =?utf-8?B?Y2k1eGtwT0FmdjlHQXBHbUIwMXlVZFRLMXZjWk1ZSVVNK0ZvZWFVcWdQUU5a?=
 =?utf-8?B?ZFBLNmtwTytJcHEvTEQwcm5kV1NYNEFUc3FjbFhOd1dyZi9RRlBBWmoyd2tT?=
 =?utf-8?B?WkZ3dGxpdmk1d2hpMHJBUlRsT3lUamdUTUZkQUR6dVlzb1gvTHpjQTA0K0Zy?=
 =?utf-8?B?Vml5dVB5aFNscENKdk03N1hmNS83Q0I4L05XV1MxSlF1SVpnWC9mSGpQK00v?=
 =?utf-8?B?WXZPRWhlR1VqYTdIQTFMUTQ3Ky9GdW81ajBxcFVRM1RKNEcrVjRTdFZHNUlr?=
 =?utf-8?B?MXRzZzlrTGRhKzZYcldIaEtjb2NkTjk1MkowZmwrU21GcmZoNW9keWszMmll?=
 =?utf-8?B?U2w1V3hQeGlOTUhqOGQ0SjhDQTdoNWdMWXpDNTE5YU10RVlBRnVZOEJobk9O?=
 =?utf-8?B?cU91UU9HVWEra211cW5Sbzl5WmMyYVljdDFvc3dtY3pTOE5acmpvL1krWVJ4?=
 =?utf-8?Q?KFs91OcUictqeOcFWlDLgEhGH?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a672d3f-c2b0-423d-ce6c-08dbdff0260e
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 00:17:52.7960 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MHDA5XHmsdMKuPkJkNVhatz1k/CWJkzzi68eY4gVS0bT5X46KHDgSHwjJ/TFqxAo4fGLvX/0QOFJhf1TcHrDSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7050
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 37/50] drm/xe/uapi: Convert tile_mask to a
 pt_placement_hint
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


On 11/3/2023 7:34 AM, Francois Dugast wrote:
> From: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> The previous tile_mask was also an optional hint, and only used
> for the page-table tree placement. However, it was so tied
> with the tile concept itself. Let's clarify things up and make
> this generic enough. So accept any valid memory region mask.
> It could even be a direct near_mem_region gotten from the engine_info.
> pt stands for page table.
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_vm.c | 14 ++++++++++----
>   include/uapi/drm/xe_drm.h  | 16 +++++++++++++---
>   2 files changed, 23 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 5538b0ed81e8..c7eb8d43bf33 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3007,11 +3007,16 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   			goto release_vm_lock;
>   		}
>   
> -		if (bind_ops[i].tile_mask) {
> +		if (bind_ops[i].pt_placement_hint) {
>   			u64 valid_tiles = BIT(xe->info.tile_count) - 1;
> +			/*
> +			 * System memory is currently ignored from this hint,
> +			 * which gets entirely converted to a tile_mask
> +			 */
> +			u8 system_memory = 0x1;
>   
> -			if (XE_IOCTL_DBG(xe, bind_ops[i].tile_mask &
> -					 ~valid_tiles)) {
> +			if (XE_IOCTL_DBG(xe, bind_ops[i].pt_placement_hint &
> +					 ~valid_tiles & ~system_memory)) {

But valid_tiles is not correct bitmask to use here as that is tiles, not 
a mask of VRAM regions...
If pt_placement_hint is actually memory regions, I think you simply want:
	if (XE_IOCTL_DBG(xe, bind_ops[i].pt_placement_hint & 
~xe->info.mem_region_mask) {


>   				err = -EINVAL;
>   				goto release_vm_lock;
>   			}
> @@ -3088,7 +3093,8 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   		u32 op = bind_ops[i].op;
>   		u32 flags = bind_ops[i].flags;
>   		u64 obj_offset = bind_ops[i].obj_offset;
> -		u8 tile_mask = bind_ops[i].tile_mask;
> +		/* Remove the system memory bit when converting to tiles */
> +		u8 tile_mask = bind_ops[i].pt_placement_hint & ~0x1;

Same as above...  conversion doesn't look right.
If you want a tile_mask, don't you need to shift the pt_placement_hint ?
So you want to convert XE_PL_VRAM0 and XE_PL_VRAM1 to a bitmask of 
tiles?   I think you need:
    tile_mask = bind_ops[i].pt_placement_hint  >> 1;

-Brian


>   		u32 prefetch_region = bind_ops[i].prefetch_mem_region_instance;
>   
>   		ops[i] = vm_bind_ioctl_ops_create(vm, bos[i], obj_offset,
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 35ce3605fc0b..2d0fb4386a69 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -850,10 +850,20 @@ struct drm_xe_vm_bind_op {
>   	__u64 addr;
>   
>   	/**
> -	 * @tile_mask: Mask for which tiles to create binds for, 0 == All tiles,
> -	 * only applies to creating new VMAs
> +	 * @pt_placement_hint: An optional memory_region bit-mask hint, which
> +	 * only applies when creating new VMAs. Default value '0' is the
> +	 * recommended value.
> +	 *
> +	 * It hints the optimal placement for the page-table tree for this VMA.
> +	 * For instance, when userspace is using engines living in a secondary
> +	 * tile with allocated BOs near those engines, that same
> +	 * @near_mem_region could be used in this hint field.
> +	 *
> +	 * Since it is a hint, the Xe kernel driver is free to ignore this mask
> +	 * and choose the best location for the page-table, taking into
> +	 * consideration the running hardware and runtime constrains.
>   	 */
> -	__u64 tile_mask;
> +	__u64 pt_placement_hint;
>   
>   #define DRM_XE_VM_BIND_OP_MAP		0x0
>   #define DRM_XE_VM_BIND_OP_UNMAP		0x1

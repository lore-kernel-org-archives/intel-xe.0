Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A0F0C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 04:49:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 265BF112119;
	Mon, 15 Apr 2024 04:49:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LtyFstC/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AFD7112119
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Apr 2024 04:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713156584; x=1744692584;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=CnCpim6Vux7H/mEVvgVT1AlT2+aTAy0tIl4Tb1Eyjk4=;
 b=LtyFstC/N5Bz+2nWI9/2pf7kf3mMZ0kZWjToaxr/bGH1TDIQ6ezsvDpR
 7X0e+7UziP4MXd5XtW9s/VloW78YsEQdKa5mHXCgSd4Lqr/yINBZERaEL
 7/nO5fTGJvmqq0j9EZdGU3kiSh5dXv7bfJmkBRh3BXVzrXfrExHntOvjZ
 JjfS7pab79y+MyJvJmMO77+EvMioCypPTwsRfGBigmJ28D0rL8gZkJVhG
 bYZngpJfQKMRdliQ/IMmqEMaTRbIWYd1LdmKWAxmYGG7otvdamFYVSCSK
 wI1M0qAOiKS+CMNTX3LG+vfv+Q7/Ybnra4A+9yQXtJTnBZRZPWoE0nmo5 w==;
X-CSE-ConnectionGUID: 1sAlUHg8TGe4bJiKVEX+bw==
X-CSE-MsgGUID: 01niJhfoQOeZipBdrspbFg==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="11479145"
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; d="scan'208,217";a="11479145"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2024 21:49:44 -0700
X-CSE-ConnectionGUID: gj8vcdVGSYORoumc+e+sug==
X-CSE-MsgGUID: xBJOGt9eQi+sqg6hwd4fLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; d="scan'208,217";a="26208040"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Apr 2024 21:49:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 14 Apr 2024 21:49:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 14 Apr 2024 21:49:43 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 14 Apr 2024 21:49:43 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 14 Apr 2024 21:49:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DHnP5MaqMaF9CkkbddL9MpCDOii/0Me7KkQS7S396qok910UvvPbHE6tmgx3u+JE7BWkS9Un1ralRPFT4ZphWwQpfObhAx75/jp7PVfSycAu+gZ36SNF50pThdAZvXzFHotltctkK5Zxybfy5guvPFs5rn5d2vJep8CVwZ3uEw42hKC62x/B2ZiLlnS0pCGmh2vjoYPn4ibw50C46QFRgoK4GxyAr5wFeLEIKjRdHGlVrJYkNF0b39jxbjK6Nk+K1G0lFES2Ezdef7qwhcV7xC3DQVdyk9+yYfl46ASpkCUQOpncY5iKmt1ho9h0gc4gFtH7BqaZVz1o9irDXcOv5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DOKfwRpEeDafVgfIoJIs63lpPp+qH0tLTKLAo+jkJjo=;
 b=mVOBQ9Wyd//KWHoyD7ivOQiB2Py6ZJOc/qZfMrhFdv9Me5Yjoo990jVfyh5gL2Q9uarTOgc1wcQUU2AWeQNy/TauPDNMUhit9R1lmyth05VpfG3QJge6+ToR8eXLuCJYx4rTqiqyhU2vbV7FZQs+TwL0wGuTwQVDGCAHD+8YTILMRE0bxaUDC3EpO1p9d3kbMQDlUQYl4iSGEYOwvvy7X+WGO/r5VudoZ3R9jtsWJdHBT6CIBb8/dyzCRVJUP0+B/hRg6g5IDS3PpaJ7OloHEsho8I69ZW0iXdhnDJ0jcckWMx+jkRtssLjzPfKP/UqrL4q2AdhMGlu8gVpOxBPRIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by PH7PR11MB8528.namprd11.prod.outlook.com (2603:10b6:510:2fd::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.29; Mon, 15 Apr
 2024 04:49:41 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93%3]) with mapi id 15.20.7472.025; Mon, 15 Apr 2024
 04:49:41 +0000
Content-Type: multipart/alternative;
 boundary="------------mYMblufn60gcCFsZRqPShgV1"
Message-ID: <f3151915-3057-4fe8-981f-cf58ced43b04@intel.com>
Date: Mon, 15 Apr 2024 10:19:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] drm/xe: Allow to assign GGTT region to the VF
To: <intel-xe@lists.freedesktop.org>
References: <20240414190137.1243-1-michal.wajdeczko@intel.com>
 <20240414190137.1243-3-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240414190137.1243-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: PN2PR01CA0025.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::30) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|PH7PR11MB8528:EE_
X-MS-Office365-Filtering-Correlation-Id: e8cbe729-8e20-448f-7daf-08dc5d077637
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5C6J+VJmOc22pZPA/UNPjjJxFIIMlC6S7elTMS9QT9NualNz3ox/2IsUGG5O66Yd7NRbJEEPjb30+CG9tc9QdP1GzAVv5fd3g4JbUnRYJKmxy8x/0G5JMyrX+xO3vc8TpKMzaNgy9hZUnJi3Aqgs6jeabrM4hZVmGSdpoee3vFq8k2lMUHZJsggvChMWBCysRZJ6/Cv3I9kAmA8KwyflffUnpoa2FW8msnQl0bn2b3IrHcovNJLHAfhRtL86v575/0czdsk/+sa5FTH7jCUr4U99ccemDxDgWY1cUQqUhOso5LVUiwccbcGmn2yY8Q8UNQzko4Fnk445eeF+KhmCQXina7kCy9KbAPPvqE+942v0GTf8tGVK54bOMZvI5efOGE7agCZwCy6eWQUphlMJt8+ZG/wqU8fYTknXOCAXcdvOhEhIwjGz7G88MtkbF+EBFX9YN+4uQc20v0hdsCzSILIcG3VO+2MBmGb8EQsf+VjaVb8uL+irMvDQTx108vKRSRxoWnnnE/6UM0NTyD/25cuZ3oNV/ALhNpWv5YbLa7synW/g8ejSS7fSCLZWu9/sB8Bp5iroD540YuxMXnZG8MMRndUo/dj+zhW5Bryq7du0lxLoJ6OZxZ2h+Uwjp59PUJKHUFni6MF2QL3/lwWsB1V0jdPbwXMHZDlBfJRLCHQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U09CbVdsN0VPcTA3SEwzUmpxTFdReTJMbGJ4WXArdFcwa2QvYTZzeXdGcExi?=
 =?utf-8?B?R3lDMUkzS0Y4Q2dveTk5VWR2MHpGeTU3c29QdFhuUEltOVp4OUY3NiszZisw?=
 =?utf-8?B?Q3pvd0l2a1ZObWRGYk14bU0rbU5XOEtmelBLMFgycmZoeThSenBRR1Z4NU14?=
 =?utf-8?B?Zm1SMW5OM3R1Tzljenp3Y0Y3TGQwSks2eWdLclc3YlFtVk5haFVUdnRTTEZh?=
 =?utf-8?B?eVlrbDR5K2l3V3JjL3poKzRHTHI2QTVBekVYNTk4VUlaVmh2UTl2d1l2bXVX?=
 =?utf-8?B?STdhOG03c0JIUzlWeTAyQVRKeS9RK1pmT2svaHRsN3V6bmU4bEVNbFRXMEt1?=
 =?utf-8?B?V0VSSHZ2aHhLamthMjNlazBnTEdTSUlnM0d1Ri9SS01DcXFQbitUazBqY2t5?=
 =?utf-8?B?bzQ5elNPWVEvQWsrdjRCM3ZNNjhtVmg0ZklTKzhLNGdOOFB1VUVnN0VEa2wv?=
 =?utf-8?B?NTJnUU5DOUt2RDI3ZnQyVFo0YWczdmx3NUR4Um5sd0tmRXpUaHdwWGRpa2Js?=
 =?utf-8?B?ai92WXRUeW9PeEtEdml4dUVvcDdDVkJ5eXdRbE0vNnZSZ0hySlBPcXpoTFUx?=
 =?utf-8?B?TmYrUzJOSHNqUXIyM0ltZTdmOEVXOXVWR2twbGRpaWN2N0hpOGdDNEp1ejZT?=
 =?utf-8?B?SEpNZ05GVm80V3ViTkhXQVBUWjFNNEM0eTg3RzBZMm8vQlN6OFBOTWd1K3B4?=
 =?utf-8?B?Nmxuckt4bEtiUjhDdFNMZHBnOUVOOVdUaEJWN09NQ3pLMTUwSWxiNWtRSTVJ?=
 =?utf-8?B?Zjh2MDBBa0IzMkhYUHM2U2pzbkxXTGVWTkZzZEx5R1dDTUhxa0c0UE5rZ1kr?=
 =?utf-8?B?Y3hjS0h4ZVFaNitrZGRNK1hUREQ4MFEzVllnZHF6dzUvSGpzTFE1OE5aR2g1?=
 =?utf-8?B?VmRnZzJRam1rQWxMT3pwVEloQVNNL0d4Q2g1NWE4Z0Vtb21oNmVGSjRRWUdN?=
 =?utf-8?B?eVFyWWV2N1Q3TmhnYTdRSjdvZHpqdHlJUXNHRXRTcEtCMWU3QWRWUm9PWGlz?=
 =?utf-8?B?bGRrVmdOUGZDSTd4c1M2ZVlBOVVjSFpZK2VnVGcxNFlBcjgwd2NtM3d3cS8x?=
 =?utf-8?B?NTlsUm5RK0ZURS91ZEVWYzVPd1E4amluc3o0d016b1VBNlRtb2dNdkEybEdB?=
 =?utf-8?B?VDZSd2lKK1NkKzBlRXBZeFJ0ZmZlc2hOa2tBaTY1V1AzUWlUM1pzZlRDTDhV?=
 =?utf-8?B?WTM2QmZmVXNubFVMeW1RRjlwS0RJVERGRDhKclVWb05sZVVkNXBORG55Q3Bx?=
 =?utf-8?B?UExZcnJwWjA2NGdUVFFHWEZjVFJKVEgxdmEvTWZONW5FVENBbGhwVFBuNFUv?=
 =?utf-8?B?b0R6MThiN3ZuM0lxcXlJVko3RGRxYytLcG82MTBZNmNHSTN3bVBST29ST2pL?=
 =?utf-8?B?UkZwYmp5NzJTemlXemIyUWQ3KzFWV3oybHhPYjhSclVTeXBmOTNoQU5Eb2Ro?=
 =?utf-8?B?YVZmQ2NFSGpnUnVXRzBBMzd4cnpZdXVGbzRZeUUxMlB4RGxWVkpVZERla3A3?=
 =?utf-8?B?UkFVQWowVm9wK2gwUFA5THRvT1VTb252eWtRQUNqUFMwUUt1ZVo4YkRjbEhG?=
 =?utf-8?B?REFNVmZkK09zbjliTlk2RmNqVnJJQXBiNVB0Z2FqRmo1WEEyaXFZK1hSbWlp?=
 =?utf-8?B?dEREWVVMUzAxQnZnbW5CeFovck5SOSt5R05JdVVteWFJN0lqSmx6dnU3ZzRC?=
 =?utf-8?B?SnRkNUEwQzNWWVZZUDlyRnRnLzdxU202YjFQNDNVWWtsQmI4UER1aHRZbGlO?=
 =?utf-8?B?RWtsQ0tTcU5DR3o4QlFBZnc4T2RXMWVBaVMxandGeUR0ZElzQkxML09XQXR5?=
 =?utf-8?B?M3pnUDUwZFZ0Zk5FSVhTTEVKVlRwVGd4dTVJNEcvQUNvS1hoQ3lGdkJ5ZzQw?=
 =?utf-8?B?UDE0THdHSnVWRFFWeFMyOTVwczExQmFsMWJTVjlsNTJBazFUMWZleklmblZn?=
 =?utf-8?B?dEpLZ3NobVZrY1k5NmlYaEFpb1ZlZjRnRUU3Z3RVTUEwL1F0N0F0YXk1WlRB?=
 =?utf-8?B?STBTYnh1Qmd2RGZiK0hzeTMxSnhpaHY0TEszWVVPTTFVZk8xeFFmNkM2TUU5?=
 =?utf-8?B?SHdqRHQ0TWQ4YmFoT3FZR25POHdScGJPWUM0MnVyeERWOElhK2JNYnYyaXJX?=
 =?utf-8?B?bzJuUzRGekhZak5zc3lrOHFXajNXbndlYUg4d0g3ZFg1Z3k1OTlZVHFBcCtk?=
 =?utf-8?B?ZXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e8cbe729-8e20-448f-7daf-08dc5d077637
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2024 04:49:41.2071 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0P4hCl1jot0jjQCvB7+w0BpRrGbLwy62BG927ahZ89QIUkpHXz05aHTcplmwv99biw+DVmv6amlVexGApfT2njf6M5q3wItrloVY/CTN7w4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8528
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

--------------mYMblufn60gcCFsZRqPShgV1
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 15-04-2024 00:31, Michal Wajdeczko wrote:
> VF's drivers can't modify GGTT PTEs except the range explicitly
> assigned by the PF driver. To allow hardware enforcement of this
> requirement, each GGTT PTE has a field with the VF number that
> identifies which VF can modify that particular GGTT PTE entry.
>
> Only PF driver can modify this field and PF driver shall do that
> before VF drivers will be loaded. Add function to prepare PTEs.
> Since it will be used only by the PF driver, make it available
> only for CONFIG_PCI_IOV=y.
>
> Bspec: 45015
> Signed-off-by: Michal Wajdeczko<michal.wajdeczko@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_gtt_defs.h |  2 ++
>   drivers/gpu/drm/xe/xe_ggtt.c          | 44 +++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_ggtt.h          |  4 +++
>   3 files changed, 50 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> index 558519ce48c7..4389e5a76f89 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> @@ -9,6 +9,8 @@
>   #define XELPG_GGTT_PTE_PAT0	BIT_ULL(52)
>   #define XELPG_GGTT_PTE_PAT1	BIT_ULL(53)
>   
> +#define GGTT_PTE_VFID		GENMASK_ULL(11, 2)

Patch looks good to me.

Just to confrim, based on BSPEC, this MASK applies to GRAPHICS_VER >= 
12.50. For versions before this, the applicable mask is (4, 2). I infer 
that since SRIOV support on XE is expected beyond GRAPHICS_VER version 
12.50, you are using mask (11, 2).

> +
>   #define GUC_GGTT_TOP		0xFEE00000
>   
>   #define XELPG_PPGTT_PTE_PAT3		BIT_ULL(62)
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index ff2239c0eda5..f090cab065b8 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -460,6 +460,50 @@ void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>   			    bo->flags & XE_BO_FLAG_GGTT_INVALIDATE);
>   }
>   
> +#ifdef CONFIG_PCI_IOV
> +static u64 xe_encode_vfid_pte(u16 vfid)
> +{
> +	return FIELD_PREP(GGTT_PTE_VFID, vfid) | XE_PAGE_PRESENT;
> +}
> +
> +static void xe_ggtt_assign_locked(struct xe_ggtt *ggtt, const struct drm_mm_node *node, u16 vfid)
> +{
> +	u64 start = node->start;
> +	u64 size = node->size;
> +	u64 end = start + size - 1;
> +	u64 pte = xe_encode_vfid_pte(vfid);
> +
> +	lockdep_assert_held(&ggtt->lock);
> +
> +	if (!drm_mm_node_allocated(node))
> +		return;
> +
> +	while (start < end) {
> +		xe_ggtt_set_pte(ggtt, start, pte);
> +		start += XE_PAGE_SIZE;
> +	}
> +
> +	xe_ggtt_invalidate(ggtt);
> +}
> +
> +/**
> + * xe_ggtt_assign - assign a GGTT region to the VF
> + * @ggtt: the &xe_ggtt where the node belongs
> + * @node: the &drm_mm_node to update
> + * @vfid: the VF identifier
> + *
> + * This function is used by the PF driver to assign a GGTT region to the VF.
> + * In addition to PTE's VFID bits 11:2 also PRESENT bit 0 is set as on some
> + * platforms VFs can't modify that either.

This info regarding bit 0 not being modifiable by VF's on some platforms 
is missing in Bspec.

> + */
> +void xe_ggtt_assign(struct xe_ggtt *ggtt, const struct drm_mm_node *node, u16 vfid)
> +{
> +	mutex_lock(&ggtt->lock);
> +	xe_ggtt_assign_locked(ggtt, node, vfid);
> +	mutex_unlock(&ggtt->lock);
> +}
> +#endif
> +
>   int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p)
>   {
>   	int err;
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> index 8306ef74abc6..4a41a1762358 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> @@ -33,4 +33,8 @@ void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
>   
>   int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p);
>   
> +#ifdef CONFIG_PCI_IOV
> +void xe_ggtt_assign(struct xe_ggtt *ggtt, const struct drm_mm_node *node, u16 vfid);
> +#endif
> +
>   #endif
--------------mYMblufn60gcCFsZRqPShgV1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 15-04-2024 00:31, Michal Wajdeczko
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240414190137.1243-3-michal.wajdeczko@intel.com">
      <pre class="moz-quote-pre" wrap="">VF's drivers can't modify GGTT PTEs except the range explicitly
assigned by the PF driver. To allow hardware enforcement of this
requirement, each GGTT PTE has a field with the VF number that
identifies which VF can modify that particular GGTT PTE entry.

Only PF driver can modify this field and PF driver shall do that
before VF drivers will be loaded. Add function to prepare PTEs.
Since it will be used only by the PF driver, make it available
only for CONFIG_PCI_IOV=y.

Bspec: 45015
Signed-off-by: Michal Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/regs/xe_gtt_defs.h |  2 ++
 drivers/gpu/drm/xe/xe_ggtt.c          | 44 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ggtt.h          |  4 +++
 3 files changed, 50 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
index 558519ce48c7..4389e5a76f89 100644
--- a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
@@ -9,6 +9,8 @@
 #define XELPG_GGTT_PTE_PAT0	BIT_ULL(52)
 #define XELPG_GGTT_PTE_PAT1	BIT_ULL(53)
 
+#define GGTT_PTE_VFID		GENMASK_ULL(11, 2)</pre>
    </blockquote>
    <br class="Apple-interchange-newline">
    <p><font face="monospace"><span style="color: rgb(13, 13, 13); font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Patch looks good to me. </span></font></p>
    <p><font face="monospace"><span style="color: rgb(13, 13, 13); font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Just to confrim, based on BSPEC, this MASK applies to GRAPHICS_VER &gt;= 12.50. For versions before this, the applicable mask is (4, 2). I infer that since SRIOV support on XE is expected beyond GRAPHICS_VER version 12.50, you are using mask (11, 2)</span><span style="white-space: pre-wrap">.</span></font></p>
    <blockquote type="cite" cite="mid:20240414190137.1243-3-michal.wajdeczko@intel.com">
      <pre class="moz-quote-pre" wrap="">
+
 #define GUC_GGTT_TOP		0xFEE00000
 
 #define XELPG_PPGTT_PTE_PAT3		BIT_ULL(62)
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index ff2239c0eda5..f090cab065b8 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -460,6 +460,50 @@ void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 			    bo-&gt;flags &amp; XE_BO_FLAG_GGTT_INVALIDATE);
 }
 
+#ifdef CONFIG_PCI_IOV
+static u64 xe_encode_vfid_pte(u16 vfid)
+{
+	return FIELD_PREP(GGTT_PTE_VFID, vfid) | XE_PAGE_PRESENT;
+}
+
+static void xe_ggtt_assign_locked(struct xe_ggtt *ggtt, const struct drm_mm_node *node, u16 vfid)
+{
+	u64 start = node-&gt;start;
+	u64 size = node-&gt;size;
+	u64 end = start + size - 1;
+	u64 pte = xe_encode_vfid_pte(vfid);
+
+	lockdep_assert_held(&amp;ggtt-&gt;lock);
+
+	if (!drm_mm_node_allocated(node))
+		return;
+
+	while (start &lt; end) {
+		xe_ggtt_set_pte(ggtt, start, pte);
+		start += XE_PAGE_SIZE;
+	}
+
+	xe_ggtt_invalidate(ggtt);
+}
+
+/**
+ * xe_ggtt_assign - assign a GGTT region to the VF
+ * @ggtt: the &amp;xe_ggtt where the node belongs
+ * @node: the &amp;drm_mm_node to update
+ * @vfid: the VF identifier
+ *
+ * This function is used by the PF driver to assign a GGTT region to the VF.
+ * In addition to PTE's VFID bits 11:2 also PRESENT bit 0 is set as on some
+ * platforms VFs can't modify that either.</pre>
    </blockquote>
    <p>This info regarding bit 0 not being modifiable by VF's on some
      platforms is missing in Bspec. <br>
    </p>
    <blockquote type="cite" cite="mid:20240414190137.1243-3-michal.wajdeczko@intel.com">
      <pre class="moz-quote-pre" wrap="">
+ */
+void xe_ggtt_assign(struct xe_ggtt *ggtt, const struct drm_mm_node *node, u16 vfid)
+{
+	mutex_lock(&amp;ggtt-&gt;lock);
+	xe_ggtt_assign_locked(ggtt, node, vfid);
+	mutex_unlock(&amp;ggtt-&gt;lock);
+}
+#endif
+
 int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p)
 {
 	int err;
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 8306ef74abc6..4a41a1762358 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -33,4 +33,8 @@ void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
 
 int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p);
 
+#ifdef CONFIG_PCI_IOV
+void xe_ggtt_assign(struct xe_ggtt *ggtt, const struct drm_mm_node *node, u16 vfid);
+#endif
+
 #endif
</pre>
    </blockquote>
  </body>
</html>

--------------mYMblufn60gcCFsZRqPShgV1--

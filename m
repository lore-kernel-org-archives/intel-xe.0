Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 118D8FB5164
	for <intel-xe@archiver.kernel.org>; Mon,  6 Apr 2026 21:28:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C343410E2A1;
	Mon,  6 Apr 2026 21:28:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T10gjVFC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 595D110E2A1
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Apr 2026 21:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775510889; x=1807046889;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qoNaAfKK/q7Xag67SZhFy8liV9PN7PAVtwn08kJTkho=;
 b=T10gjVFC9010JFKVXg6CekqC2s7AjJqwxF0G4JzsOMWeqkIk7K7CicY5
 Xu64LBgB315YZXP+xD5bkz8HCzBj7HGf/QCR5AUFR1wRB8yxBUASPyyJz
 d9k577B4J3r04hYkGPzo99AubIfhLWKoZKHf6eXFGPIrVzMwhsMQE5VKB
 lHFGdruy8cjYLvx6rwh0LAtNKl6kQU9ixbq2QKcu+axyLbhKU67o7acp8
 EJKFLEokxCS6L59S0jUFX49SpALMS9NCOWfy+x8MfBbEyUoh3MouMyE9O
 sK8XYVRfjIvmqBLljFscdZYsgllJ38kJIfrlIxdxfdx9L+9hq0tXHs970 Q==;
X-CSE-ConnectionGUID: 7239uUEMQkKFOevgl6PviA==
X-CSE-MsgGUID: B8fvKhf+TimTVgUKUIY1Nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="80354607"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="80354607"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 14:28:09 -0700
X-CSE-ConnectionGUID: pLeIznNfQ22o2jthAi9+uQ==
X-CSE-MsgGUID: ty2F5vZLSSaVpYqgrKXoag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="226973553"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 14:28:09 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 14:28:08 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 6 Apr 2026 14:28:08 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.59) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 14:28:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MHTllXBshZSPP7qz0Y7h2xP49dhQB8l9XNPeVPPptO6Jva8NmdcWX7IF2qjMWspPmtOQJCJLIW7CmcxrQMGKjGmOZ89Oa71e6RpNlwLp9/t6cqBg3riPwQ3b1b5SCpAbgxT5WwtsBIF7BWUU9nIouHk8hJOPPDvXc536II+4BBhTzQiRtPbanZgIg2RMPgqJItHsif7O8xndOpX7WvCzPxl0ddrste9Avw9ro6tDm71eRHis79sLppnJbuSNnkyp8mIzJb581cDpEWAljiOuFeulQtdoAh/4Tcw0WTGKYnuL5Nd4gqRnuNjixBIsheTYb6Mu5IKduescJhSkBt624w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EpFMu86D9jBMkvDA3jKiSPsnTEniO1QX0GjMmxMaVsI=;
 b=OVMKRIp1AwXct13ZMnVckfwJ21E5n4hHRoZ41dLIXMIBKmwrw+KOPJ1oVfT2u7Tc0nusFGDYl6xbzJhQbM1FL1Hk8J/IPcvs16OvgfSlIr+KpytWzU/6bsuSpho6pb/TEhHlN/FWJqaroJcjxa2dZlZTLjHsblUd0F3qxz0d59Z2xpW3R9YjzSEbksMWOhWf7B6bxhc62xdd9dv7ngIhEw3JSIlxB9Y8M/b9Esq/LJdZq/+cskooaVcKf4Zypr5ixOmMAWEd2iMPSCQebp+JbrmtK2p9yn6wpTnqSVNKHk4slw1dauqEn105ujBo8O9ktWlpbndpcNLXWjroJsGbOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by MW4PR11MB6569.namprd11.prod.outlook.com (2603:10b6:303:1e1::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Mon, 6 Apr
 2026 21:28:04 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9769.016; Mon, 6 Apr 2026
 21:28:04 +0000
Message-ID: <920e4c7b-42ad-479a-a15f-9a871e85f0d0@intel.com>
Date: Mon, 6 Apr 2026 14:28:02 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Add support for NPK as a GuC log target
To: Stuart Summers <stuart.summers@intel.com>
CC: <shuicheng.lin@intel.com>, <matthew.d.roper@intel.com>,
 <intel-xe@lists.freedesktop.org>, John Harrison <John.C.Harrison@Intel.com>
References: <20260226232648.675128-1-stuart.summers@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260226232648.675128-1-stuart.summers@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0131.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::16) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|MW4PR11MB6569:EE_
X-MS-Office365-Filtering-Correlation-Id: abaa7665-127f-482d-5966-08de94236348
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: W9cUeRFgjwoGz3rijiIzA9MCmi94vIPbHB/uFSOuiqN5BGSTCf/Ej1G5oLy0IFHzoU80sYdHgPbaqapKoBIV5sfCOqRMZutjPrKyOWA4HbZDqzoUfh6n/rc1mNPArbovFLUIypPbItRXuYTMtmfMn1TzIEcSH6A47fJ/VS2T8yHOazA9G+InWhsz3AOiXYYlaB8Elu7cRQqaRa41dZYqJ6gpSdJJRFC8llVh9AxsyiWsXU4sWqb+/rwoJwbrAzwFgabJiwto0++1c1TyJu0MMA2QG6k0SSEgqbAkP5nzO0fO+WCjSOtWeo+BzIaVyP8s5jjJMFUizfiMVltRQWZZgikQ//g545/rS5MrkpQgUkPieHIvtIc3tIcEng5jyKIcaTKIlGalbvfMTv1ZYP30Ysll5aI7NPD6d9ebtZxYYhb64r0SMva79XqJvaEZinSZUo4TiBZP/AvATtQio3OK1Lp9S1bt/zMfhgWy1FAKC9AwBdH+0natrJdftJquJEjusfurXpLT3MKuKLtuP60v9cFexiIbg0C2tJAlWcpkcPiJSeHU1UBX+spLHgEG8GptySukVNZvqYdGS6rXdCZ6zYkybxkKV9FsqoaZyGRjuPlVHbjlvJI0wZGS6mgIe85CDjcIU1OZNlJwDhBqrH2KTIfiWMTzLBQ36+SDRntcUGCKAXXtQYmUpQGGa04MH1m7cNFGw/iiGGa3Bpa51O6ErBVXqocO5DQlw+cn1BYaAYw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aytxd1o4QTdqc2tLejh3dktWYkwyUk04K0t6b1dKUjc5dHMvdnFxUEVwMVp1?=
 =?utf-8?B?eG5xTFgvNEpudDJTMVk3a0JMaFZmckpHTzdUcDVTVjV4TlBHWDUyaTdxcWdj?=
 =?utf-8?B?bWxkM2d6MGdjalZTaUhZNnFVKzVHSmNPMWF4SDJkVDRRa25Lczg5cW5XK2Yw?=
 =?utf-8?B?Sk8zTFE5bkg5ODRtMzZ4L05Xd0txQUVHWWlESVZFS2k4NXlPc1ZqSW9oNFZM?=
 =?utf-8?B?YWFDejdwNjhKOHQwMS9jUnNwak5VZTUxdkxxcVNuZCttTVhhVHpIOTVqR2JG?=
 =?utf-8?B?N2VzT1RQZjczdTBqRUw0cGc4Z2NPdkdxSFNnekxSVG9mWXhDMm9ObUlrNklr?=
 =?utf-8?B?R1lJcWFHbFp5WEhBY1VvakJXMWQ3RDlUOHV2Zm9mTlIvQ0xUT3k4WG04OGhs?=
 =?utf-8?B?U1dqYUgyRWhKN1Q2akxoU28wSWRrNUhsMTROM29nbzl4ZitTV3VBMXVMMXpS?=
 =?utf-8?B?THRpRHEvN3JYOGkrcWJnenlsMG1Nd3pHdU1ZazFKZklENlE5aFdJejZ1NE9y?=
 =?utf-8?B?cWZpMERycHg4K0ZSSm9ubHlxVDAwUHZETnkzUmI0YlJhVllwUGgxOThST2N6?=
 =?utf-8?B?dE0zNm0yUk9rRGNGOGJOUGp6OVc0MExscU94c1duYVhZNDE3UlJzTFlrRXlh?=
 =?utf-8?B?dUk4QlFyemJraXR1a2RYQndrVHlqTitXamZUQUZHOUpNTFg3S2ZDZHFYU0Ey?=
 =?utf-8?B?WjdwM1ZLVjdHOHp4eDlzWDJuNGhDOWZEaWpxSmF5TlZUTWxLL0UrUFB6bU9X?=
 =?utf-8?B?VDF1SmZYakJTVU5RRndXNHMxMzBWZFJvc3NETG83T05mN0JJZm4wQjlOMGds?=
 =?utf-8?B?aHFrQkJQcGFKRlY4dExuaEdyVm5Kd3U0V2lOS2hVSnpNSW53eUlYYXFZUkdh?=
 =?utf-8?B?aFpaS01SOUZNOU9EQzZLcnJ1SEoyMmQxQkNkYWhseGw5R0QzdkZKbFc5bXZx?=
 =?utf-8?B?RXpUWFpkY1ZWSzhPbG1kbC9xZWVrd1l4VktsaUpiS0QxNC9raXhJNXZwTG4y?=
 =?utf-8?B?RWRqRUZhMllGbTFiemN6c0wyblVSTUxNSHIzMWhyVjZVcDk2V2RneUlnR1VB?=
 =?utf-8?B?QjU4SWY1SjU0TUZucS9xTkRXRjJlbmhJWWNtekJxV2RUWm9xaVpqTVFoVjJB?=
 =?utf-8?B?dkU1OWJyY05oVm1qQytoRGFzSTdIeXdZNUhRREtUeWdxcVp0YXZvY1JzWXJ1?=
 =?utf-8?B?TTZleFVvQmdqaktzWXpBNis4MFg0N3dOKzZDMGhLNkp4Q3RUbVJISUcvOW93?=
 =?utf-8?B?ejNWUXU0aG1kSkVjOXlqODBVaFBDeHlFMStLaVZZaEtIRzAzcFNPKzQ1eUxi?=
 =?utf-8?B?WmpOVW9jN2hwSkJYMW9keStsSTV6MEwrcUNsMTFSV2ZFbmgraytLMTlZb0tt?=
 =?utf-8?B?UG8rRmt6MXN2NURRSExSczRqVGdoSU9lOUNlQUF4bTFOZldiZE5wVERMdEM3?=
 =?utf-8?B?aDBFVWhkS0M0VnpnYUQvOVhmSlh0NWFzVDl6ME1DNWdSblYvcmdsTmZpbnI0?=
 =?utf-8?B?b3p4ZS9UYURVK1BIeG5sdnd5Um1Od1BmK1FDbUtKeENlck5ZU3U1WVkva3oz?=
 =?utf-8?B?L0sxN3J6bHJzdUcyTnhOTHpEcXMrYlI0b1VPSDBKSmJVb2JML3ZoTERDV1dN?=
 =?utf-8?B?T2xEQzY3c3ZFUVhpMFVEWlJEbi9qanhrUUJRY2RTTWFZdHNQdXV4OFdLVGZv?=
 =?utf-8?B?RHZMR1NmQjNiRHI3TlBiNEMwekpBSzYxeS9iT3NBRjRmUjNNOXBTYjNnTHlo?=
 =?utf-8?B?V3lQRjJQVENFdC94Y0FJNGdweW9YVkFpRnNxdGZkd3c5Z1RQKzNRSm91NHky?=
 =?utf-8?B?OHQwK3MxZGRHZXpBaSsrVW1hNFZpdkNmaVVqc2lWYm9rb0NJTUh0cjVVRnhP?=
 =?utf-8?B?eWcrenNMc0E0ckxydW9wbzRvWmxyOXVDNUJxZ3BWWktnSzNmQUlhOTFsTDRp?=
 =?utf-8?B?YkxzWUhCMFJqdUo1YU1XRFprMkFrOXlIaFMvVENwdFg5dTNuZTBjR2h3U3Zn?=
 =?utf-8?B?bmdER3NYbDFaOFFlTVBIRmIvdlp1eE5FQVU2TE1NZDc1Y1JEYVQ1YUhINmRa?=
 =?utf-8?B?MWhSSTZpSEMrMEpJaGJOZm1IOWxDcFRseTVMRlhGQmFUQnYyWFVYS3Fud1Vk?=
 =?utf-8?B?N1BQa3A2U0NUd1ROMTlOL0xNWFhERU1sRklhTlBWa0tQc2tBWUxMZG5UdXht?=
 =?utf-8?B?R3U5a0ZDOEdOTkg3N3IzVThQMkpVL0lRWEVubFdLQXRKQXBHUHh2L0NnOU9S?=
 =?utf-8?B?NjAvNndNRmZzRFBweWJmZDZlaFIxODNLOG9lRVFrbTdIZDRpdFAyczBJeG1j?=
 =?utf-8?B?NVhPdTlhNGw2dnRaRDMwZXhWQ08zWVR2NDRFWTBYUk1sL0hLbEthZTB1M1hZ?=
 =?utf-8?Q?iVElrG/ix8Qp7wf4=3D?=
X-Exchange-RoutingPolicyChecked: ec2QW8bKBZnLpWkT1dhCqKjP8eZ/ncZYWZOdaf7TaPGFmsE1fU/JiEo9aa0DhLc/TDwmU8tXKyEQweEKNufyaW36EWFfGFe/jQFb8qwyjDAuI79Jt2jvBbQvQsDkjubNQNOC5QdmqOJZNd3CMDUz4beCu5/1t+U/ON+z24WIfKOhuKOg+gpHMoa+upfGwDjzENwVLwHq/5aT31mOM/McWlBA9/allNvrjAURekKUtmUvnvWMMoDU3yAwFVON3seclxnvzx/S2CKOVIgO1R1K+WjtTjyHkRGO/MgtbGoJqJDtr9nPC/smunUKxdYkd7LC0KZEuqHTkpzN/v/+a60KdA==
X-MS-Exchange-CrossTenant-Network-Message-Id: abaa7665-127f-482d-5966-08de94236348
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 21:28:04.5681 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kPotn0CSPB7e6Sl2nHfvRquLj7gE/U7hu7XifV1LOGcPmp16RYTLHqgA9iwqM/pWai/d7TKMQV+xU7pu3BgKoA2NPKfD5az8+ruWahH9BkM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6569
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



On 2/26/2026 3:26 PM, Stuart Summers wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> GuC provides the ability to gather logs through a hardware interface
> called NPK. For certain debugging scenarios this can be advantageous
> over getting logs from memory (or in addition to).
>
> Add a hook for this alternate debugging mode via a configfs. This
> translates into a parameter passed to GuC during load time.
>
> v2: Convert to configfs from modparam (Matt)
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_configfs.c | 60 ++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_configfs.h |  5 +++
>   drivers/gpu/drm/xe/xe_defaults.h |  1 +
>   drivers/gpu/drm/xe/xe_guc.c      |  7 +++-
>   4 files changed, 72 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index 078dee985d24..e0c21328af75 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -83,6 +83,16 @@
>    *
>    * This attribute can only be set before binding to the device.
>    *
> + * GuC log target:
> + * -------------
> + *
> + * Set the destination for the GuC log. 0 - memory only (default),
> + * 1 - NPK only, 2 - memory + NPK.
> + *
> + * 	# echo 2 > /sys/kernel/config/xe/0000:03:00.0/guc_log_target
> + *
> + * This attribute can only be set before binding to the device.
> + *
>    * Allowed GT types:
>    * -----------------
>    *
> @@ -256,6 +266,7 @@ struct xe_config_group_device {
>   	struct config_group sriov;
>   
>   	struct xe_config_device {
> +		u8 guc_log_target;
>   		u64 gt_types_allowed;
>   		u64 engines_allowed;
>   		struct wa_bb ctx_restore_post_bb[XE_ENGINE_CLASS_MAX];
> @@ -277,6 +288,7 @@ struct xe_config_group_device {
>   };
>   
>   static const struct xe_config_device device_defaults = {
> +	.guc_log_target = XE_DEFAULT_GUC_LOG_TARGET,
>   	.gt_types_allowed = U64_MAX,
>   	.engines_allowed = U64_MAX,
>   	.survivability_mode = false,
> @@ -357,6 +369,37 @@ static bool is_bound(struct xe_config_group_device *dev)
>   	return ret;
>   }
>   
> +static ssize_t guc_log_target_show(struct config_item *item, char *page)
> +{
> +	struct xe_config_device *dev = to_xe_config_device(item);
> +
> +	return sprintf(page, "%d\n", dev->guc_log_target);
> +}
> +
> +static ssize_t guc_log_target_store(struct config_item *item, const char *page, size_t len)
> +{
> +	struct xe_config_group_device *dev = to_xe_config_group_device(item);
> +	u8 guc_log_target;
> +	int ret;
> +
> +	ret = kstrtou8(page, 0, &guc_log_target);
> +	if (ret)
> +		return ret;
> +
> +#define GUC_LOG_TARGET_MAX	2

IMO better to define this with XE_DEFAULT_GUC_LOG_TARGET. Maybe also add 
a comment to explain that the modes are set directly by the user and 
therefore we don't need individual defines.

> +	if (guc_log_target > GUC_LOG_TARGET_MAX)
> +		return -EINVAL;
> +#undef GUC_LOG_TARGET_MAX
> +
> +	guard(mutex)(&dev->lock);
> +	if (is_bound(dev))
> +		return -EBUSY;
> +
> +	dev->config.guc_log_target = guc_log_target;
> +
> +	return len;
> +}
> +
>   static ssize_t survivability_mode_show(struct config_item *item, char *page)
>   {
>   	struct xe_config_device *dev = to_xe_config_device(item);
> @@ -814,6 +857,7 @@ CONFIGFS_ATTR(, ctx_restore_mid_bb);
>   CONFIGFS_ATTR(, ctx_restore_post_bb);
>   CONFIGFS_ATTR(, enable_psmi);
>   CONFIGFS_ATTR(, engines_allowed);
> +CONFIGFS_ATTR(, guc_log_target);

This should go after gt_types if we want to keep the alphabetical order.

>   CONFIGFS_ATTR(, gt_types_allowed);
>   CONFIGFS_ATTR(, survivability_mode);
>   
> @@ -822,6 +866,7 @@ static struct configfs_attribute *xe_config_device_attrs[] = {
>   	&attr_ctx_restore_post_bb,
>   	&attr_enable_psmi,
>   	&attr_engines_allowed,
> +	&attr_guc_log_target,

here as well

>   	&attr_gt_types_allowed,
>   	&attr_survivability_mode,
>   	NULL,
> @@ -1094,6 +1139,7 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
>   				 dev->config.attr_); \
>   	} while (0)
>   
> +	PRI_CUSTOM_ATTR("%d", guc_log_target);
>   	PRI_CUSTOM_ATTR("%llx", gt_types_allowed);
>   	PRI_CUSTOM_ATTR("%llx", engines_allowed);
>   	PRI_CUSTOM_ATTR("%d", enable_psmi);
> @@ -1146,6 +1192,20 @@ bool xe_configfs_get_survivability_mode(struct pci_dev *pdev)
>   	return mode;
>   }
>   
> +u8 xe_configfs_get_guc_log_target(struct pci_dev *pdev)

This function needs documentation

> +{
> +	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
> +	u8 target;
> +
> +	if (!dev)
> +		return device_defaults.guc_log_target;
> +
> +	target = dev->config.guc_log_target;
> +	config_group_put(&dev->group);
> +
> +	return target;
> +}
> +
>   static u64 get_gt_types_allowed(struct pci_dev *pdev)
>   {
>   	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
> index 07d62bf0c152..fb5cb7c57e75 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.h
> +++ b/drivers/gpu/drm/xe/xe_configfs.h
> @@ -19,6 +19,7 @@ int xe_configfs_init(void);
>   void xe_configfs_exit(void);
>   void xe_configfs_check_device(struct pci_dev *pdev);
>   bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
> +u8 xe_configfs_get_guc_log_target(struct pci_dev *pdev);
>   bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev);
>   bool xe_configfs_media_gt_allowed(struct pci_dev *pdev);
>   u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
> @@ -38,6 +39,10 @@ static inline int xe_configfs_init(void) { return 0; }
>   static inline void xe_configfs_exit(void) { }
>   static inline void xe_configfs_check_device(struct pci_dev *pdev) { }
>   static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; }
> +static inline u8 xe_configfs_get_guc_log_target(struct pci_dev *pdev)
> +{
> +	return XE_DEFAULT_GUC_LOG_TARGET;
> +}
>   static inline bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev) { return true; }
>   static inline bool xe_configfs_media_gt_allowed(struct pci_dev *pdev) { return true; }
>   static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
> diff --git a/drivers/gpu/drm/xe/xe_defaults.h b/drivers/gpu/drm/xe/xe_defaults.h
> index c8ae1d5f3d60..fbe670668a04 100644
> --- a/drivers/gpu/drm/xe/xe_defaults.h
> +++ b/drivers/gpu/drm/xe/xe_defaults.h
> @@ -12,6 +12,7 @@
>   #else
>   #define XE_DEFAULT_GUC_LOG_LEVEL		1
>   #endif
> +#define XE_DEFAULT_GUC_LOG_TARGET		0
>   
>   #define XE_DEFAULT_PROBE_DISPLAY		IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>   #define XE_DEFAULT_VRAM_BAR_SIZE		0
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 54d2fc780127..d98d5d051f1b 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -73,13 +73,18 @@ static u32 guc_bo_ggtt_addr(struct xe_guc *guc,
>   
>   static u32 guc_ctl_debug_flags(struct xe_guc *guc)
>   {
> +	struct pci_dev *pdev = to_pci_dev(guc_to_xe(guc)->drm.dev);
>   	u32 level = xe_guc_log_get_level(&guc->log);
>   	u32 flags = 0;
>   
>   	if (!GUC_LOG_LEVEL_IS_VERBOSE(level))
>   		flags |= GUC_LOG_DISABLED;
>   	else
> -		flags |= FIELD_PREP(GUC_LOG_VERBOSITY, GUC_LOG_LEVEL_TO_VERBOSITY(level));
> +		flags |= FIELD_PREP(GUC_LOG_VERBOSITY,
> +				    GUC_LOG_LEVEL_TO_VERBOSITY(level));
> +
> +	flags |= FIELD_PREP(GUC_LOG_DESTINATION,
> +			    xe_configfs_get_guc_log_target(pdev));

nit: Should this be part of the else case above? the specs don't say 
that it is an error to set this with the logs disabled but it does seem 
weird to do so. not a blocker, so I'm ok it you want to keep it here.

Daniele

>   
>   	return flags;
>   }


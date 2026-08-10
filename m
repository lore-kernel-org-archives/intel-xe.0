Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE60AC5AE5D
	for <intel-xe@archiver.kernel.org>; Mon, 10 Aug 2026 11:36:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B18510E7D3;
	Mon, 10 Aug 2026 11:36:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TBWFk96o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C37F10E7D3;
 Mon, 10 Aug 2026 11:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786361816; x=1817897816;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=klm4n2pSIncF0e6RQBkuLBNSo3fiOJ08XeqtAoM/HJk=;
 b=TBWFk96oBETBp4yUSUuoMxNTPcLGOK+ayymJu9VVu/KRY1vzcy2xVUCq
 zluQG/WCY1SE6RZ0UoR7r20CRhdMeYLDgEnjejhqrMbjqRC4EZ34llur6
 fCe4iFVUdrNnktNLsXwcS23FsZyszWnzef+RBcrTuOWtjmOGBeBYarQWG
 D+kcB6TWRGYvu9o7iP5DwpUXg2AeaFV78E+ALYRcS7i+C8LAdtgUULbGT
 i9gyeJA6udV8qkZRFPrVXPYVPAutrZ446Dk3YB8hiDhsPgY/tqfSuStWB
 YiM4fs6nL820F7K/YZ2uYFsLIrAPlvnGYh0xUfgPK5vXSSKOZmhu5KkOe A==;
X-CSE-ConnectionGUID: Ji9kDRkfRlKnO8IFlgF0FA==
X-CSE-MsgGUID: ivrBDzUhThiZ377Atdf5Uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="98387337"
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; d="scan'208";a="98387337"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 04:36:55 -0700
X-CSE-ConnectionGUID: pvPet4CzS3Gp+Kbvvjw0CQ==
X-CSE-MsgGUID: FERIsJ6dRPCIDQu2QC/sUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; d="scan'208";a="263071833"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 04:36:55 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 04:36:54 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 10 Aug 2026 04:36:54 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.27) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 04:36:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HoIrCr/nvAv/1iEwxbNtCA+AI/hunq7cfMpmPZcNjrCRveVgW0JgxaZDIoCVVkapQI8orrQlLw8yqNvGprvdywOIynqGASBR5XiskkCA5yXFIwHZNDPoeJ/celSeoLhLKW0U0+I6gynbrS+4RmXSGsWLnUlSTysRo6DesthodBG9XH4Xv2sbViSQCocJDDRXrq6EWhpLiYZA9iZ3Ti2LtIPbiE5kQZjyCiRIw6FGlb5k10mAWkKQNmrkuG+xe1V4ts8HkG5LqlvBDTa8NAIgvFtfxhgSuAPS7XgjfmISU3prfsyNTb7w6JFznFxFOEF6TxIQ69JWqePNf0mvDJBv5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ghiaMbXo/aJv1Pnm6yNp7yqy1s/Ix7FzmC8UMEB80y0=;
 b=s1CWhWjDzqpYkNbfFfyGxYIx0GfEiwWP/U8Isz+Mf9QMmF5bFU7Me5NCTWiHQyv7hRAlUK7rl8cMlFQEJ8tHRCnLvWzS5dYesCHuaN9aNj+8bHsYB6jt3YbA9LiUi/pGZsFzN0rsRnwpJUou+SCD0dSEMpNF7LoC1HrBdynPGklM/BJ3Oj7cjbdp23ZRPE4Q4x4phL0SlMdV7fVqsnUM7VzRCJa6ue0oHsABxzyoiXMzg5lnvmFl3DTMnhsE4hERmCJeiSZS/5fOpO4Y2nTPeNTeedSUAf9M6fv6svk7wLgSrkIPr1LxGIPPX5CXcV+ihmBvQ8oDlkEYXG4RWflX8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB7554.namprd11.prod.outlook.com (2603:10b6:806:315::9)
 by PH7PR11MB6403.namprd11.prod.outlook.com (2603:10b6:510:1f9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 11:36:51 +0000
Received: from SA3PR11MB7554.namprd11.prod.outlook.com
 ([fe80::3ec0:2280:db82:d67b]) by SA3PR11MB7554.namprd11.prod.outlook.com
 ([fe80::3ec0:2280:db82:d67b%5]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 11:36:51 +0000
Message-ID: <37c48d39-acbb-473f-aee8-bdf508483357@intel.com>
Date: Mon, 10 Aug 2026 17:06:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/i915/dp: Limit for_each_joiner_candidate() on
 joiner pipes available
To: Jani Nikula <jani.nikula@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
References: <cover.1786105831.git.jani.nikula@intel.com>
 <efc330687f8299e5725564c3ed90d5d8e6aa0eb2.1786105831.git.jani.nikula@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <efc330687f8299e5725564c3ed90d5d8e6aa0eb2.1786105831.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0242.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:223::9) To SA3PR11MB7554.namprd11.prod.outlook.com
 (2603:10b6:806:315::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB7554:EE_|PH7PR11MB6403:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ee09923-bcd7-4df2-98ff-08def6d3ab6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|4143699003|11063799006|56012099006|10067099003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 8Y+Bh/80jAAG+3KpyvnelpoH6xNZr3JIzQRydqfuGK11tzoatP/aHn6b422aw2tqv0jq6UM8VwoEIsqpu76AFteR5tYOvbn5//vMVgVsYs2P/JdzIAoFK/zn4aFYMpy03BngXRX+e5u9E3kO3gFd5eHCJhbhJMGnL0jXzEng8H7e19E7QULRbwkNqHp0EZAjLyXTWZF6qCOcBSR2UJrClSGS3TUoZt0hNQ3HTF5W1pwZZQ3l4lpVYsa1wH5Uo56AR6EZzQ5WGlf4IoAnx1OHkCr7U8waB8naoyWHjLH9gnUKsqGU27HOyiU0i4194ivZgLXWPE661bAc+AF3KvhO30NCsBPkHLtqByqaSCqJuM0tCGWOiVoPxxSfgUeROjmMvt2OEYCEO8ufHvvvii5l3wpET8J93IW3UYWz51FSQ/6UeYVwe4Fo2Lyf2/H+YbTHWTNbn4jPBIgKud3omumUv45zWLioRVE7plxTKpxGMlQZSRW61sk+/UBq+ZcR3WT93HuMsCqRyCK4fs89kGLrF16VV1X0PZ+xiJIYfk85aD+Pro3Nk0bVnmvGofS+qJX2otJw+Qdx9u2gMLcLe2IbVUSSgIFWK76yIQtwuBMFDu8UjITerow06z8d0pq+Y8EeqadX6LOdKA6RXUIw2sxklr9HMM4PD2j/AC9AHGHlgic=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB7554.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(4143699003)(11063799006)(56012099006)(10067099003)(3023799007)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjQ2bTJTSStDWDRpRS9RaVhaWHFCUnQ1TmdSbVhya2ZmeDI1OVd3NlA1ZnhH?=
 =?utf-8?B?QTFRVzdDOHBVNWpUemhVbEYvNno5RWhoZ3Z5NndRb25QVHMvS3p2Rk9WUll3?=
 =?utf-8?B?aTh3UExCclQyM1UxWFc3OUYxd0ZlQ1JSVlJOT0FqWCtxcENtTGoxam9rWUk0?=
 =?utf-8?B?SXdkM2xJYnpwbXdUYlFabzY4cStZZXdEMXh4bk5yekZPbnE4dU40Vk16NGJu?=
 =?utf-8?B?OE5zU0Z1Yk9tazdPOURZZVpHK3dKanF4YjNpUkJTUUZEMlNZVmthOUZFcGtG?=
 =?utf-8?B?TDFUTDhpS3V3M1AxSWlPbE9vTXFUU1lOZ2NFeFlYWU4zY1Nzck8yTlRDRmlC?=
 =?utf-8?B?UGcybnAzRDc4Sk15Zk1uT25yY29UQVAycCthWC8zK3VQZkIwVk1HM0pOYWZC?=
 =?utf-8?B?dWFIWkJ2eEpNa0lyMVd6L1FuT3orNDBrYWVQSnZJNmdzclVlWWpZWm8wZU5v?=
 =?utf-8?B?K3JQRHJjRk9HQWhoMVVRYlNtYU1vNnZ4SWdFaGYwTDlyWjcyZWM5eWh6RnNw?=
 =?utf-8?B?bnlzcVhRSlUrTjhzMEN4Q3o3NGRFcm8zcmZBUk1sQWlBcStYcXlkTklSN0sx?=
 =?utf-8?B?SjBySW9udlpTSjQ0RFVtZWNnei9yWXQ2cWFTRitYT0haWTcxWFZJd2p4V2U2?=
 =?utf-8?B?bE43Tm5NejVxdVY5dXphaXhNNEh3bUs2TVpvQ1NkN05KMkpEK2dxdDhtV2li?=
 =?utf-8?B?dVFWWU96T1RMR0E4T1luLzhWZEZqT09ENnpXWmljOUtkNFBleFIzcWhMa3FW?=
 =?utf-8?B?VzNYaGV1WWxzWXFFSzJaVTlSQWh4OHhER2RJalUzRmpHNy90aEZVSzhnNWlx?=
 =?utf-8?B?TUJuR3pVVGF2aE02QUtMRnZkY0JxNnAvUjNGMm5XWHVXR3B4d2tGNk9vSXM0?=
 =?utf-8?B?RzhTb2hlUnJQaFpCYzNYeDdVa3BkazNBSkxMYmNETDhkVFlicTV2Qm4ydXpy?=
 =?utf-8?B?WThDWEFnN0k0K2p5UVZZR1JOZ0NXYTI2Q3NWWTdlVGNHeHNsWWxYdk54L29o?=
 =?utf-8?B?LzVMWjMrcTJrblB2OFVhR2hwYUVpNjFsWFhzdmlRYlJPaWdhcGlsdHJ6Vmtm?=
 =?utf-8?B?enFnbVczQWpSMHoyMmlWTmZSQ3Q2ald3RjRrdDJNYVJPb0ZPSXBWemhsdnVJ?=
 =?utf-8?B?a0FnNjFEVDIvSHhFeTJGTEFxendNUXV2N3AzN1R3OW1STUx1YU50U2xKZU1N?=
 =?utf-8?B?azMvR3dRbnl5aGtCT2Q1ZFRFeHpjRzZoNVBoUWkxOUZ6SVkrNXVDWU53OGx3?=
 =?utf-8?B?b3NvbnZxUzNvMjJOQVJ6bDRTUm5YQit4UmRtM0I5dGc1M1UreTRLWWxJWDRp?=
 =?utf-8?B?aEFyUHFDUmg0eHpLZGJ4UFVDUGptcm5lbkxzdVlJbTZzYlgwZHMxT1hkdGNS?=
 =?utf-8?B?aVRGelE4eU1ib1ZVUGJOdGpoWWdvaEpYbzhJVlBvcHNmVkRiMUxzMlgyajVG?=
 =?utf-8?B?bzlKaFlsczNETUFkcnJrTmgwcTBoYUJzMzh5S3kzdUlZejk4R2VhVytIWmpC?=
 =?utf-8?B?dVpzWjFseGlrTDlEeHhJQS94VjI1RW1nYVo3Nyt2eW83SzAxQ2RrWG1ZdDJI?=
 =?utf-8?B?eklRb1g3aDM5SmFBeU5VNUZYTmtJZjNxQUFhcEU1VGpTRUR4VGJCRVp4bi82?=
 =?utf-8?B?VGdQWXBIbFJYS0IwZUsyTXJ0d0I1ekVxN3NXVHVlNk9wR0VxQkF6VW1oQlZx?=
 =?utf-8?B?WnR1OEcyekhlSHdod1pLbGhSRDZTM3pCaGlrZ0NmY0ZFOXJzcUpFMTlJd1pz?=
 =?utf-8?B?VlRJVFY0MXlPSnlXQzdjWi9PVWV2THNteGdScGE5QlRXT01wMWZNc0UvUnBL?=
 =?utf-8?B?dmR6ZUE1cG16ZDJnM05HZlBGRzN3YktEdWg4UnFZQ25SaVU5SS9Ud1JGbFRj?=
 =?utf-8?B?cWF2ZHVBYURLdm9jN0hIb2VKaERmeE9vQ2xOODZSMjVzR0NLTzQyb3ljWkFy?=
 =?utf-8?B?MWUvQW10elltTjZCRm1Pd1RJeHhzR0IwWU1rbmVkb1F5ZjFLaGcyZHN6RVJt?=
 =?utf-8?B?QUJweE9GcHhPemg1d2ozSTFDWFowNEZCUWZ3Z29WOGhDSkJVQXBQRlV3K01l?=
 =?utf-8?B?TytEVG5KNEtPNXpOMVQxNkk4T0xIOG1HR2FKTHRLSHhZa2JkNWlkZTJUOEd2?=
 =?utf-8?B?WStQa0VHcFc5NjU5VWtGSVp2MlA3TmNWUXBLS1pyME5CZnZHa2FYL2k2aGFX?=
 =?utf-8?B?dmg2UjQ0NlZRS3cvc081K1k4WmEvSWU5UnRza0JpSExHWW1veUdHdVNFVXYw?=
 =?utf-8?B?RW8rcnI3Q1RHYlRjRXU4cVJ6VlVsUmJqQi9SNmJDTFdoM3lqSG5rVjk4Qjhj?=
 =?utf-8?B?TjA2UHJ4cGw2V09CQmN5SlYzRHZ2REJQWk9VZ2hOWnhadDV2NFIrVVBHcnRz?=
 =?utf-8?Q?H1hYbICI90fh9Fgk=3D?=
X-Exchange-RoutingPolicyChecked: WTkdq8EhXvV8NQY5XEf2uon13lBHis55SYXoh//TncG8qqcEjEaXUSnQ6EBdu1uAjGIpkRHri2GhVQLnhTqYf1CaoxwY/8wb3q4ayYSZxL4PNhHqGEVztzT7E3m9yY7V6Sk4Ed4LY+oiMXsAP4g+hxsL5yZRFzkr0rEj8qK0vgvGc9OUY70jNlyGmKx0GL0dzAthwZxcjgNNiUBp7PVcwK23DQYkAZGq8NOeoPv7vidKrRnY0CEvasVbjZkzJ0D9sEJRXvPwjwknsRfyw45tnTp8HKQMwNA9Mp8JsYGdGbiJUtqU9q3LiAeRP9u0Jfw/eiWkSIwpDyMa4mZu+4fDuQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ee09923-bcd7-4df2-98ff-08def6d3ab6c
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB7554.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 11:36:50.9804 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AvHt6tS8Bpelngkf4aAuvD106jPGfRG832tyw2OobO7tBxmXBsFU5IipoB9+mXpWsFeote8WHquiq361Ve8hfAgRn+KfYUIXvqw/+Kb+1Y8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6403
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


On 8/7/2026 6:04 PM, Jani Nikula wrote:
> Make intel_dp_can_join(), and subsequently
> intel_dp_joiner_candidate_valid() and for_each_joiner_candidate() more
> strict about pipes actually available for joining by using
> intel_joiner_valid_primary_pipe_mask().
>
> This rejects some invalid combos early for both mode enumeration and
> compute config.
>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

LGTM.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> ---
>   drivers/gpu/drm/i915/display/intel_dp.c | 12 +-----------
>   1 file changed, 1 insertion(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 437b9e7bb864..e1604bc895e5 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -1274,17 +1274,7 @@ bool intel_dp_can_join(struct intel_dp *intel_dp,
>   	if (num_joined_pipes > 1 && !intel_dp_has_joiner(intel_dp))
>   		return false;
>   
> -	switch (num_joined_pipes) {
> -	case 1:
> -		return true;
> -	case 2:
> -		return HAS_BIGJOINER(display) ||
> -		       HAS_UNCOMPRESSED_JOINER(display);
> -	case 4:
> -		return HAS_ULTRAJOINER(display);
> -	default:
> -		return false;
> -	}
> +	return intel_joiner_valid_primary_pipe_mask(display, num_joined_pipes);
>   }
>   
>   bool intel_dp_dotclk_valid(struct intel_display *display,

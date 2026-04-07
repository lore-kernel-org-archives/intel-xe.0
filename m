Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 752ECFB5173
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 00:12:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3505A10E2F9;
	Tue,  7 Apr 2026 00:12:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j+SQE+3P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A6B010E2F9
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Apr 2026 00:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775520725; x=1807056725;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Nr3gXP/ePwXdcFJ3n9Gq0L0Y9wfdFS+kPuYF/8ZdYu4=;
 b=j+SQE+3PudtLZ6MPSo6+gKK5aLiZZiRXEnTCVsJ41T2PpWurM/qkzHbO
 QKb8l9fpACgjCH/cHOpWRhFPeYAIJ95TJp5z84J0sPkDr2VFOEDuShEol
 5dtg8m9gTHx3d40or6YBRTkaF6sWGoYgkOn1/sr1neaJPFyKi2fOloSI1
 O6/k+tImLl5YRWVKr6dLkA7dZM9OISeMqxeeKy0qESnPOScKEN6b4w2AO
 tHn+nGpt8exAXJ2gM+SKyisIOPRN359KRIj67yXodF7CUjZ5WmEq/PT2k
 CIHUydv4unmqeVa3Lo6WAQQzlkGXMfhwW2RgmBmLF5sdNRYv3VyJfMyvs w==;
X-CSE-ConnectionGUID: yEdvAR4zSsylD+zOA8QXPw==
X-CSE-MsgGUID: OcFWKYhRRfuXtRntGVoiGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87929980"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="87929980"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 17:12:04 -0700
X-CSE-ConnectionGUID: LiDLhJHCQ5aze6yzH5YYoQ==
X-CSE-MsgGUID: LtWnFh9FTxiPCgqL2c6kug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="223212048"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 17:12:03 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 17:12:03 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 6 Apr 2026 17:12:03 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.15) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 17:12:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jh8DUFgeLuQWZI8Cli8hrdhRYSoMtz4ShJ5w61fV3axPl0Vfbpmie/M43uSTZXGrsEwdj7gjpVK2W3eAG4xHwvCRcFccEFMwOwOQqsLXoaabERyZENNdZ9Y1sDCOn0ONzoMvWoLeYoPlpLv+qhlmDah4b0UuWP/FRQfDMluvWAfcK1AlfvZrddEAZ2v1Lj4n3Yix/mC2vDb2e+2eBVPzsCxUwykL6Wz0hAonphfO/Fc9bgM1SQjOKGF6zR0XypNJzXHxlPGLVmvdC8B08NjaX1gAw7Ksj5VcYUo2inIM05RGP2UmpM4NLU75aZbML5ftjeH7isfUl0TLLig98810IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F2qtJlJB13u1wlVr/TG4ECvZ8pSEuKsZm8zwfdL+bvE=;
 b=fCsOxNwzWK7bHSuJDPhQO8SyKAxwF49UZ1nWoSryefSpiZBd2AWBSFh7oKa6Sv76T3uKvzikHomP9OMrJnZt0sI2D0nJR1RET9B+pUkoNtLX5p5BSSCC8SEZ/ZMY1WDQhdcZayH6ONob4TluZ4nMESt3vCPjBgpZMW4A1Zh90UBYGlYK6MiPBEUu02x551nWmo9C3dXBd6xiGFa9UOa+gP37oRXM4Bwhf3grX0XRUgTT0I0RCnf/Ua2HM4tZzf+iA3cinU6RA3S7L4cSgzH+LXk9NeYuKvaIzNn+MUhL9uq8R+zSgdEk8ms84o8I/UrxEqFSU9gwko8pXYOMOvS17w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by IA3PR11MB9351.namprd11.prod.outlook.com (2603:10b6:208:57c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.14; Tue, 7 Apr
 2026 00:11:55 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286%4]) with mapi id 15.20.9769.020; Tue, 7 Apr 2026
 00:11:55 +0000
Message-ID: <7da0dd80-e18d-4aff-923c-416902b8f234@intel.com>
Date: Mon, 6 Apr 2026 17:11:54 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] drm/xe/uapi: Fix code examples in xe_drm.h
 documentation
To: Shuicheng Lin <shuicheng.lin@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260331172049.3053871-7-shuicheng.lin@intel.com>
 <20260331172049.3053871-11-shuicheng.lin@intel.com>
Content-Language: en-US
From: "Wang, X" <x.wang@intel.com>
In-Reply-To: <20260331172049.3053871-11-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR04CA0004.namprd04.prod.outlook.com
 (2603:10b6:a03:217::9) To SA3PR11MB8046.namprd11.prod.outlook.com
 (2603:10b6:806:2fb::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB8046:EE_|IA3PR11MB9351:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cf5d749-d0b2-4bda-6fa1-08de943a46ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|42112799006|376014|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: eFxXV37l1SMldZNXOdMyBSvk/Kk1vDZ1gwQZ8Lucr9mKRmCZcgmk9aPpz+4u0k4KpyTyYHN4nUIfJKfYOojW73A7IPduQTDqsWFjHOf25C6ezuO2MyqyftLX8lcQMMdF6c4Ivbh9ixtouSlNURLw3hFmyQqWQkKFziFVRe8WunNrQYTp3rAyyIxzFAS7vyVscmW7eruPmehMJjwDJUaazpHdeafFPkaJOpnLGt9cNcgWXFG6yvUJptLr/+rkJ/3J0rqLivthzGPCvrXouHovhCTyyT9DJqyBAHhSo3JwfTZzAd1Io9xEIAl9lkvlcAa404NHcaNNHxURLuKyQlWRwzXCs3n3S06LtJCxIZBcSYd53NrN6EmDuJrLT7EV76tTNeS0AgqGvE9VVK7B2XEfXDx1tixdD8FPHFsaZ5Z/h34FE24ZBAM2vq84e58AAKrMrdioVQOPmvbHezwI8jiz5f4r7yu9uzV847BCKN5dAo+09rPzNxmkj5+ELI+C1kmFSg/7hNSD4ZZ4lw4pJPLb9VTw6jkM4UiKbaJBWD7oV1FC+sVoEJFb/1ZYFWc9UImptY2f/LDnyzgCZHV7jWtZ9NzeQgiIReXi/cmWXesj2viUA8l7FcNNsIqGkzriRvkpC18mZbs0EXhPhVKpEel9EYPEhUMNR7V+mJyMqZZ08tn+AA47oE3vxPxKQMgJ31cG9K89O4RX/iVsmrsOpFNaa4UBu7boYGMMoOVJXd0Pp+Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(42112799006)(376014)(1800799024)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejljckN6Z3lYZnNGVFc3YWtDclBCZVQ4RjNMZEUyak5rY25uSWFmTFUreHp2?=
 =?utf-8?B?YmM0eWJaa3Y4WTBtRWpPMlBua1pCK2lQaUg1QTkwN0pmYzFHWTMxei9HNnpq?=
 =?utf-8?B?OGtRTEFXTnBiaVFTU2xPNWZGVktzVnhPMVhxNGhFZ1NMaVQ3TmVqYlRTalRn?=
 =?utf-8?B?U1htNlVNUmkwVzZtd3VkSTlZRzVldisyRlBQcFhLZFpHc3IwelhVV09IcWt1?=
 =?utf-8?B?THhZZmdOR0lFSXE0Z1BhRUZacjBaV1dJY3k5a3B5VmxBdTN4SlVmQVRlbDN0?=
 =?utf-8?B?UEpJVk9Mem9tazV0N1YwZFVNMHdzVERtbG80M3RFMFhWOW1JWVo4S1o0Ullx?=
 =?utf-8?B?YXYxUXNiTDhBajRObHJNSXY4c3l1MFlVK3l2YTdLdXNsa2Z1ZFpSakZ4TERn?=
 =?utf-8?B?RmJ1dFoyZU1QWnNacTE0d3J3ZTc1Q1F1VnliYUN2cTlHbHdpVjR5T2IyNFhK?=
 =?utf-8?B?cWt6blJYM2YxVVUzTXo4dUNWcFh6Ly9haVBhcEdQZTRmd0t1dkJPOHVQT3Zy?=
 =?utf-8?B?NWFJQ2tKOUVtLzVaQ3NRSE80TFV5T3A5cWJxZWNIaEVOZVgycXI1VHZVZGgy?=
 =?utf-8?B?TS84aW9FenNIenFFeHRkZ0FBRUtPczhBaHp3MzJCM2FVODNkZWZ6bzRYM1U2?=
 =?utf-8?B?OFdnWHh5a2NrWE5vbzhBQnAzK2JUODhURU9OTXptZlR3SmFaMWszSUpnRFEv?=
 =?utf-8?B?SGlNWmt6eld1R2pwZVVRSnFCc2dlaHFKaHRsZ3RqQm9DbnlMV3dsMEFxdXpZ?=
 =?utf-8?B?NUhtL3V3cGNYT1FKYU1sbkdHdnNRQVNUME05YnpQSE9RWFpDSjR5ZUo0enp2?=
 =?utf-8?B?V0F4WnBhd2duc2p0Y2lPSXpxeVY3UmlYQ2JTV3d2NmhmeE1aUlJRb3FuUGRU?=
 =?utf-8?B?RGdTRWUvK2g4d2Y4WE83Z1RNOEh0QzZvWTlFejc5VUMwY0tjWS92eDdLNmVm?=
 =?utf-8?B?SmtwWjY4a3ltTy8yWjlkcEp1RGRBdklZdzNtTHc3ZkdBaUs3eHVZWVgrN0sx?=
 =?utf-8?B?eFlpRHBCSm5uY0RER1JOc291WVNqVHpRNlBRb0x1alU0OTlBNVJCdmxEOWRw?=
 =?utf-8?B?NEptMDZZUTBUMisvSVFmVVVGb2dVN2MxZC9ZRnNaT2MwSFpJWGZ0YnZOTUVu?=
 =?utf-8?B?TWNsZUl0NE4yRnIrNzVULzV1Y2J2S3Z1WGJYQkhVdU1ZSU9FWXZCNkUreE1y?=
 =?utf-8?B?eXlzUnJPenFHWFIybklqaXZUWnBRV2pNcklBelJuTUJSOFAwRmxwQnZLZVBB?=
 =?utf-8?B?eXp4NWpCOCtUZGVwQmZnb3o4amY0TUpiNkRybE9oOTdUUXJtNzNKa0FXQXUv?=
 =?utf-8?B?Z1NaaDFvNjFSVVdVTnNZSm5Dc29BTVVBNW9tWVJOdHNEM2ZkOG1odXhIa0Zz?=
 =?utf-8?B?V1F3WXpCaG9nOHZ6RDJXNk1RZTZjalRXNDFpbHplZ0dPLzRYWC9vYnFRMTA2?=
 =?utf-8?B?MDFROEYxRFZXOFEyOUtJUTBYZzIzZEJBODBlUUsrVDlDVFo5ZW5CQnJqMk1v?=
 =?utf-8?B?QkZ1QzZKQWNvZFdUMXIwTDF0U3hEdEk2WlJjMmgrY0hUT0I2Tnp0NUdCZE93?=
 =?utf-8?B?L0loYVhLNytQNzZDN012YlU1Mlk3K1hTT2xhTFNTdUo3UDhtR0JkSEVJR04y?=
 =?utf-8?B?dDZXMjhxZ083SGhxTXNoTGtCN1R0WDU0N2dTZkVCb3o4UC9kU3BaaFdxMUxm?=
 =?utf-8?B?c2FhejR5b09lRVhubE5mdkpKR1ZIQVVOOTBKMXhkVHdoUjl3UFdGUDFCcjdn?=
 =?utf-8?B?YkJMQU5RTDFpSW1NVkRmSmZ3WjZDTjB5UU1RRHVmZHNzNzc2dmVOdnVGcUYz?=
 =?utf-8?B?SzVqQ0tObzhKb2xqaFp0Wm5obFVrQlllK2ZWUUNDSktZQTFZZlhFQXRydzM1?=
 =?utf-8?B?djllRDUzbEtMOUtTWkMrZ0dOQ2pRamcveEVHRHNXbFpxeXJMUlpSbTZlUTJs?=
 =?utf-8?B?SHVKU3lhRTJuZ05XZHBtYW5lN1o0V1pqOTZWYVE5dytlTDRsYUJjK2J6bi9C?=
 =?utf-8?B?ZTA4RU5iaXFFdUp3bVBRcmNvRFdWdXMrd0U4b1ZsS29IMEV5U25UbHRJQXMr?=
 =?utf-8?B?Ym5SWWhOVHpvTzZTUUt4QTZoUGRLZ2pJa1FyR25wQVMrSmFJZ3hWUDNKRzZO?=
 =?utf-8?B?VmE4SnF0TjU0TEFaekJVSHdRc25JamM1U2FFVndQc2xsc25FOWQ5YWhMcDY2?=
 =?utf-8?B?cW5aaWgwcmw2aVQ1NVhJTVU4TUFsMElNSWtjWlhVaVhzL0JiQklFcld4THpT?=
 =?utf-8?B?ZnZ2c0RhT3N6YTFQL3dFc2V2WkZkZFNKSFFXanQ0S0xaSHE0cGZOQ0FuK21F?=
 =?utf-8?B?SUwyMEdYUFR4Q3F3OWJMQ1l6bkVNWkFMMFpSRVMwaDgvQ3RPUmJJdz09?=
X-Exchange-RoutingPolicyChecked: AVlLmlDB/qCcV8mYE2z08zk3eXN9ZNlGZEnQoStpcGojTT6UOzNsP4LpvtbPSA6V2Bzwhsv0sPYy+OIdBxhtYYyR28t52BVq5oSpiWqpdNmQn32aK0bRGfgQguiD2uFAjToRTTN5gp0TTB6CwUXGwQMxC37XGlgc+b6eBc7qlV5C3nEPXmpd9Am6NSqEoB84vhzkMrBVMzDBHP5PEcjgXsU0M3ZKn9VOpXxADHzf1hDq+Zfsx2Q/lcMZyL8xgHEW9HLCENQT0xC90XH52CKSv4+eza/If+H2v+/zXtRED5NUJgGo0g6kIgqKqM3k6wKh00wl1kjT1DmKKoJ3ikBApg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cf5d749-d0b2-4bda-6fa1-08de943a46ff
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 00:11:55.4887 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2l2k11uPN9NJLBZWQeB8fPxoF6fAWWWtVnhqTWucR3VG8iS6GjnfGVWnq42Vk5vIom5JJ08go+HJze29wNA+YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9351
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


On 3/31/2026 10:20, Shuicheng Lin wrote:
> Fix incorrect field names and formatting in code examples:
> - .num_bb_per_exec -> .width (renamed struct field
>    in exec_queue_create examples)
> - .num_eng_per_bb -> .num_placements (renamed struct
>    field in exec_queue_create examples)
> - .atomic_val -> .atomic.val (correct nested struct
>    field access in madvise example)
> - Remove unnecessary backslash escaping in UUID format
>    string (%\08x -> %08x)
>
> Assisted-by: GitHub Copilot:claude-opus-4.6
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>   include/uapi/drm/xe_drm.h | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 36627322448c..c2e8cf31a82a 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1401,8 +1401,8 @@ struct drm_xe_vm_get_property {
>    *     struct drm_xe_exec_queue_create exec_queue_create = {
>    *          .extensions = 0,
>    *          .vm_id = vm,
> - *          .num_bb_per_exec = 1,
> - *          .num_eng_per_bb = 1,
> + *          .width = 1,
> + *          .num_placements = 1,
>    *          .instances = to_user_pointer(&instance),
>    *     };
>    *     ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &exec_queue_create);
> @@ -1416,8 +1416,8 @@ struct drm_xe_vm_get_property {
>    *          .flags = DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT,
>    *          .extensions = 0,
>    *          .vm_id = vm,
> - *          .num_bb_per_exec = 1,
> - *          .num_eng_per_bb = 1,
> + *          .width = 1,
> + *          .num_placements = 1,
>    *          .instances = to_user_pointer(&instance),
>    *     };
>    *     ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &exec_queue_create);
> @@ -2019,7 +2019,7 @@ struct drm_xe_oa_config {
>   	/** @extensions: Pointer to the first extension struct, if any */
>   	__u64 extensions;
>   
> -	/** @uuid: String formatted like "%\08x-%\04x-%\04x-%\04x-%\012x" */
> +	/** @uuid: String formatted like "%08x-%04x-%04x-%04x-%012x" */
>   	char uuid[36];
>   
>   	/** @n_regs: Number of regs in @regs_ptr */
> @@ -2181,7 +2181,7 @@ struct drm_xe_query_eu_stall {
>    *         .start = 0x100000,
>    *         .range = 0x2000,
>    *         .type = DRM_XE_MEM_RANGE_ATTR_ATOMIC,
> - *         .atomic_val = DRM_XE_ATOMIC_DEVICE,
> + *         .atomic.val = DRM_XE_ATOMIC_DEVICE,

Reviewed-by: Xin Wang <x.wang@intel.com>

>    *    };
>    *
>    *    ioctl(fd, DRM_IOCTL_XE_MADVISE, &madvise);

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CE59C04FF6
	for <intel-xe@archiver.kernel.org>; Fri, 19 Apr 2024 07:16:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C159510F802;
	Fri, 19 Apr 2024 07:16:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WN8NEUqp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFE7A10F802
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Apr 2024 07:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713510987; x=1745046987;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=eJVC5/PaHFiQYCdqLRp0DLHJSjsE2xgfcAQNt09dES8=;
 b=WN8NEUqpu4p4hTYgHNPRX0Z0rqZwNlxilaaAGr5N6VN1wx+TohLB4t6m
 H3eec6Ja8OT0pU1hjL2MGWjMdzdtdGFqJHSIgUeBmBxzw7h1A7zMMlFX5
 Sh7lBiIxWJKUovCoq7shQQDsJXIx7Lsg4gdPnm0AAa9+vIzvHCuOR45rG
 cZL8ztRf8q9tQjZdaVoejIWJkc9XHKsft0gCUHydNUvLyBbULGT0lXHWj
 o3JgVqCf/ydE3LC4YXTv3niVor+yI0aVi3t+dJM5l7u6K0hOSicd7QFlk
 MkNF0HWAfsBxorG7mhYBcoro7AESqeWpdQ/wyKzfUXZq7s0IQwAoREs1p w==;
X-CSE-ConnectionGUID: rpo5J4hqQaO8RYFnumJXhw==
X-CSE-MsgGUID: SsYQa8Y0RTakTUM9zlBitw==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="9225240"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208,217";a="9225240"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 00:16:25 -0700
X-CSE-ConnectionGUID: qHL/h0N0TZ+EeJVeQUbFVg==
X-CSE-MsgGUID: QkxbygLiQpCVFWdtD9TYIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208,217";a="60680758"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Apr 2024 00:16:23 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 00:16:23 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Apr 2024 00:16:23 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Apr 2024 00:16:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hanexskV2eQnADm7rY6y1CefaDEztZ/OWdGokxO9/azL7x9pqWUt3xzuEReN8eQSEeTOlbUaJc0CrubprV5zP/vaZIekZxLtnGR6CTJtl18iB4kmvIISm0BX0G34QnO/fD32SO/n2Jy1hphYsFidI6VsOgd291Ml9ksZjI4fmcn3CvdFNWumIZD8lX6Sw3UA+10/I7YDrdIYb3eylOz6vyOAL0FQFvMocEMt3rQEW3W3At5JmqHqLE4R8cb14fRHLLcwqntW5yuZgEQQzp/7hQns6NOEtBIgpZMhTgzCfsOy1sToWFMy35/1opndJJkg0qFmQW4ovgMRAFDynQ2nkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B50gyC138dGy65zcgU7Ki6CqtUAxU3dlJhAdj6bpnZg=;
 b=VFzRyPuWgPl40soUWoFZ+NzphA6LD+0Pf0W61LQiFQXQDbtAq8UpKa03YU2JjXwdCkuT2GBz1gcCShZ5mQ9rYzflC/frIXXtypyZ1Aqe2ASGs2sx9htosZZXlLkfYsFYnhL5hQpDCQ/+FIiSRh04HSGzkg0ooRHd1QXjV2HpdJjIXxwfUUnxI4tyQKSMDmshT8XvTkxSA25CotRulQbSdsf+AdgOqwdpPeVSw9PuS3QsOuw+Q9HdOqj4ZCou0MX9QlgypFfZeOznnq7I2T5Ro8ri38KEarucLgCD7AuLhnPvC6iA6/8D2ZMN8AiRJshiInPAm2jFRlTuUBJdgLjZSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN6PR11MB8146.namprd11.prod.outlook.com (2603:10b6:208:470::9)
 by DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.11; Fri, 19 Apr
 2024 07:16:15 +0000
Received: from MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::8542:9a6e:8019:7360]) by MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::8542:9a6e:8019:7360%6]) with mapi id 15.20.7519.010; Fri, 19 Apr 2024
 07:16:15 +0000
Content-Type: multipart/alternative;
 boundary="------------ydFD2MqHEFAHYN0pth4PUfuh"
Message-ID: <f763388c-2d45-4780-90c0-8ac8c359e090@intel.com>
Date: Fri, 19 Apr 2024 10:16:54 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] drm/xe/uapi: Introduce VMA bind flag for device
 atomics
To: Nirmoy Das <nirmoy.das@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240415145214.25641-1-nirmoy.das@intel.com>
 <20240415145214.25641-7-nirmoy.das@intel.com>
Content-Language: en-US
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <20240415145214.25641-7-nirmoy.das@intel.com>
X-ClientProxiedBy: WA2P291CA0004.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::8) To MN6PR11MB8146.namprd11.prod.outlook.com
 (2603:10b6:208:470::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN6PR11MB8146:EE_|DM4PR11MB6020:EE_
X-MS-Office365-Filtering-Correlation-Id: bf4e882f-f53c-4f6b-d353-08dc6040999a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: qT+QJ8mwp80+oJ34gwCmJVzG+yK65KbIntiEAHGa1X0pxsiRTm2W4y+UKfi6vGb2m/UhfNhJ26hFqruA3aXrwKmXV3wNn3MF5foAZr/UobAidbznpMgdT2NyghX6PZk1wVX0DcdczWrtrg5yO8vm8O6HqNBtsSY20Z5zds15O8v9FYmjxHl/3r2Gpc72yJPJTcisnoXAsH6+rFE+Ezd0u9HsIlotSl+wLU6vbQbdK65Pw0FH+PbjdpSd2PSNmTrAWbl16N6S3kv7qXNVT1NDK+8SBJG+Mdckbqk5wne9iJsCe66jSRSWNLn7Fg3SNrS9sExjyCoV9AzBgNtpH+dgWt9pxDO5YmoORukDydawWCqc+RTlD4Yhi+vlmgdU7AsZUc4nWK2V+rCPGy624GBAvEeWa5R4z4voCUo0XAkVt30Xixn/Anv2IicClgTAMADh5t+Zf8Cn0wo0BPvflqxs820vUxsdaohdYpPydsS/DdG7bG0BbcSG+frSSueO8Yd2tZXrHX+P71ul5LVWUAOuJytqwPFehomQDKjZjMigsGXK1ZJJvt1lPIUL3AR9HoAmJKFoyxH7nZZOpgu41UVeZMpywhtVf0izfH0SgkImxeuF4IyzuldkaBByWrueDSusj9ca5IhGlhp9kGhtrcTmSiNXTiZ4aSOm+7iZifxF6A8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN6PR11MB8146.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N29wcEdCZ0ZoUFcrZlJjdlNDeDJhU2wyM3N5TXluVEtaYytuUWlWcmxqNTRx?=
 =?utf-8?B?TGxRMmVoYUJwUkRrZVVIbzE0WGQ3dEs0ajUzZXl4TE5udlNHK0RxNkp0aDFG?=
 =?utf-8?B?WHZ0b29WbmJVbDFOQXkrMjM0ZzF2aGx4UFFZeXRVQkVobXQ1eDBZVXVUMlJy?=
 =?utf-8?B?QnNuWm5RQ05pQlhXdkpLUnBhL2ZySVpVQWR3WkRqRVJ1dnZSWDdIQVBma0Fn?=
 =?utf-8?B?ZlpoNi9hdlZFZGNMMTRacERBZkp2ZnhpTE95emxIZUttUmtpdzZhbGJmTVQ0?=
 =?utf-8?B?bXFneHlNVnFxRGUwaUU3cEtxNkNkeVJuTzZwM0dtUlE1SnRnNVhPcnZPN0Ft?=
 =?utf-8?B?UUsyZVJGVytER0YvMnJ1UzJTakt1WUJtdmw5ZmFxQnp6bHRVSDNhaE8zYWhO?=
 =?utf-8?B?OU82dTl0NkJweTFCeTRLcllZWi9XQ2xSUWd1RHNZdEQ3T3BqZk1oWUlyYnF2?=
 =?utf-8?B?YmNURkVsM0w5ZkE5VllGYUNUTE1EbGRNR25hZ2M0SzdacVo1Z2FrU1N6eDIr?=
 =?utf-8?B?REN3cDhlSXlaZEcwam1Tc09oZkNHY1duRG1yVWFKMlpHVlBXTHVwajk1eWpW?=
 =?utf-8?B?SlU4eU5EV21qanZKWXhWNVVOUW1GaDZCcUdxTUM0QVB5Y2R1YkR3Wklab1RM?=
 =?utf-8?B?VWhVNWMrVW9TS3RncjQ0SWFkU3o4Yk1SVS9qY1RmN0FkS2ZuQXF0V2Y3QVhi?=
 =?utf-8?B?U0NlNDZaR3JTZW5lSUpobHRtaUI5RCt1aGFZUHpIdE1XUlplMTBlUGNjdkxn?=
 =?utf-8?B?UGVWam1tOUJySTcydmpRb2h3VUxHQzdxWjNBRXBrV3VhODFWaEpTUzFCOGxZ?=
 =?utf-8?B?Z2Y1UFljR0syOEpWUHhMdHR5eHpjdjFlQTM5b2ZrTnlFVHpKQjd2QUI4U29F?=
 =?utf-8?B?RVZ6eG1PRkU4YlA0ak9pWjZDYUN6aHZkeGdIZ2VRSmRZZ1lKMGxVQ1pycDYx?=
 =?utf-8?B?ZlhJb01Wa3lJYVdnK1ZtMmVCL1pERlpIS0Q3R28wc0ZGNEkvMmxmcy9STGZ2?=
 =?utf-8?B?R0tFZUNuYmtXWTV0cHJnNFVBU3JkNzFLWU9mWXk4UkI5NE0zVUNKMUZ2OXA2?=
 =?utf-8?B?b3lWM1hwT3NRNEtiWFBqZmVLWm54cklxYnRWZ1BjQ2txcEQwOEJTODRTM01X?=
 =?utf-8?B?aWlpOUhQMUthV1N1NlNxM2dWS05rZlM3WFY0OGFIUWVzR0RWalZHMzVuTlJ6?=
 =?utf-8?B?TlI0bDZtU0wyMEVjR2VJOXE3Yll5RER3dVNLZDJGamNkTVRxZ1ZpY0kveXVE?=
 =?utf-8?B?b1FPMW0yZm5WdTMwODd6WEtacGpZL3hiemM3bUpvVHpiNlFnVkRXTk82MVho?=
 =?utf-8?B?ZFQyZFVoWmRyczR6ZHN1RVpsL3JJTmNNd3NWS1FndW9SclpJMVZaVDFUUlZB?=
 =?utf-8?B?bGxXWkpPYXc0OFJSTU9pdTVpSFY2UUJLdE13dGZGeVNtSWJtT3Uwb2pLSmwy?=
 =?utf-8?B?emRMUzlTVmF4UUEwOS9VcTB5SjhUWFBGVjg5RXVVam1DWU5wdm9tcnVta0xW?=
 =?utf-8?B?cHh4VVlNcW00OUVjMzB6N1NuL3pvZmRNNHlzdU5kQUpzVkcvbXluVlgyNnkz?=
 =?utf-8?B?RG16dTNJS0xEVUFMMW53RXFlOFdSSkJtM2UzVVlkQjBGQUkvUTd2MVUzOUZq?=
 =?utf-8?B?Um1PMURYL1ovVzRpS2xYUlNzNE40UTJoMlFEVEJHckUwbUlSNk4weGxyMVBL?=
 =?utf-8?B?bTdzTllFd3ByYlFFQWR2TmRaRXJTZXJ2VEZEb2huTGViK3h0dEkyR1JNUEV1?=
 =?utf-8?B?NlltcjFlZDZIVEZnbGNkTWRtSkNYVWo4Y05aV2Z6em5JZDlNQWxEOGhNQXd0?=
 =?utf-8?B?bDRhbWE2YlpmQ0JWWjl2Y1FncWJxSnpwSVFrK0ZVZ1hLcW9VWkhoV1J4bURJ?=
 =?utf-8?B?cmpKMTZ0Zi8vbkR1bmlWVnJtaWxnZTZIbGVla0hBeWozZ1lQV0VWamwzVkJ1?=
 =?utf-8?B?UFgzeWZzRzBhRVVHbElxajlacStoOE5zcmI4cmRrNHZPNEZPOEFDUi9zUnVY?=
 =?utf-8?B?RkNQV2pGNmUvRHJ2dm9rNllXY2FDT2NHbHVOZGZLU3FYaTVQU3NUZ2t5ZGZw?=
 =?utf-8?B?TDNCS2xnbmtTK1ZwZkhPOGJrYWJGSGczeHh1NHJjd2MyMERCWkZCQWY4Ujl3?=
 =?utf-8?B?YWlCV0p4NDBxbmtBd2k4TTVQbndqKzhCdmhHTmxpbU15R0dNUEc4S0QrS0xs?=
 =?utf-8?B?b3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf4e882f-f53c-4f6b-d353-08dc6040999a
X-MS-Exchange-CrossTenant-AuthSource: MN6PR11MB8146.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 07:16:15.3021 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wkTMSJ17UXa0755fJni3A9i1RfrzSCCyDXGZPP8SGysM5Cl+MGugwW/ZfTKeuQwzADmvWgttKV6HwrVXd/+lZeCNhUH5oRBXcicsfQXOZoI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6020
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

--------------ydFD2MqHEFAHYN0pth4PUfuh
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 15/04/2024 17:52, Nirmoy Das wrote:
> Adds a new VMA bind flag to enable device atomics on SMEM only buffers.
>
> Given that simultaneous usage of device atomics and CPU atomics on
> the same SMEM buffer is not guaranteed to function without migration,
> and UMD expects no migration for SMEM-only buffer objects, so this provide
> a way to set device atomics when UMD is certain to use the buffer only
> for device atomics.
>
> Signed-off-by: Nirmoy Das<nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_vm.c       | 28 ++++++++++++++++++++++++----
>   drivers/gpu/drm/xe/xe_vm_types.h |  2 ++
>   include/uapi/drm/xe_drm.h        | 17 +++++++++++++----
>   3 files changed, 39 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 8380f1d23074..b0907a7bb88b 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -753,6 +753,7 @@ static void xe_vma_free(struct xe_vma *vma)
>   #define VMA_CREATE_FLAG_READ_ONLY	BIT(0)
>   #define VMA_CREATE_FLAG_IS_NULL		BIT(1)
>   #define VMA_CREATE_FLAG_DUMPABLE	BIT(2)
> +#define VMA_CREATE_FLAG_DEVICE_ATOMICS	BIT(3)
>   
>   static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>   				    struct xe_bo *bo,
> @@ -766,6 +767,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>   	bool read_only = (flags & VMA_CREATE_FLAG_READ_ONLY);
>   	bool is_null = (flags & VMA_CREATE_FLAG_IS_NULL);
>   	bool dumpable = (flags & VMA_CREATE_FLAG_DUMPABLE);
> +	bool enable_atomics = (flags & VMA_CREATE_FLAG_DEVICE_ATOMICS);
>   
>   	xe_assert(vm->xe, start < end);
>   	xe_assert(vm->xe, end < vm->size);
> @@ -814,7 +816,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>   		xe_bo_assert_held(bo);
>   
>   		if (vm->xe->info.has_atomic_enable_pte_bit &&
> -		    (xe_bo_is_vram(bo) || !IS_DGFX(vm->xe)))
> +		    (xe_bo_is_vram(bo) || !IS_DGFX(vm->xe) || enable_atomics))
>   			vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
>   
>   		vm_bo = drm_gpuvm_bo_obtain(vma->gpuva.vm, &bo->ttm.base);
> @@ -2116,6 +2118,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>   		if (__op->op == DRM_GPUVA_OP_MAP) {
>   			op->map.is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
>   			op->map.dumpable = flags & DRM_XE_VM_BIND_FLAG_DUMPABLE;
> +			op->map.enable_device_atomics = flags & DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS;
>   			op->map.pat_index = pat_index;
>   		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
>   			op->prefetch.region = prefetch_region;
> @@ -2312,6 +2315,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
>   				VMA_CREATE_FLAG_IS_NULL : 0;
>   			flags |= op->map.dumpable ?
>   				VMA_CREATE_FLAG_DUMPABLE : 0;
> +			flags |= op->map.enable_device_atomics ?
> +				VMA_CREATE_FLAG_DEVICE_ATOMICS : 0;
>   
>   			vma = new_vma(vm, &op->base.map, op->map.pat_index,
>   				      flags);
> @@ -2339,6 +2344,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
>   				flags |= op->base.remap.unmap->va->flags &
>   					XE_VMA_DUMPABLE ?
>   					VMA_CREATE_FLAG_DUMPABLE : 0;
> +				flags |= op->base.remap.unmap->va->flags ?
> +					VMA_CREATE_FLAG_DEVICE_ATOMICS : 0;
>   
>   				vma = new_vma(vm, op->base.remap.prev,
>   					      old->pat_index, flags);
> @@ -2376,6 +2383,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
>   				flags |= op->base.remap.unmap->va->flags &
>   					XE_VMA_DUMPABLE ?
>   					VMA_CREATE_FLAG_DUMPABLE : 0;
> +				flags |= op->base.remap.unmap->va->flags ?
> +					VMA_CREATE_FLAG_DEVICE_ATOMICS : 0;
>   
>   				vma = new_vma(vm, op->base.remap.next,
>   					      old->pat_index, flags);
> @@ -2731,7 +2740,8 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
>   	(DRM_XE_VM_BIND_FLAG_READONLY | \
>   	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | \
>   	 DRM_XE_VM_BIND_FLAG_NULL | \
> -	 DRM_XE_VM_BIND_FLAG_DUMPABLE)
> +	 DRM_XE_VM_BIND_FLAG_DUMPABLE | \
> +	 DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS)
>   #define XE_64K_PAGE_MASK 0xffffull
>   #define ALL_DRM_XE_SYNCS_FLAGS (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
>   
> @@ -2874,7 +2884,7 @@ static int vm_bind_ioctl_signal_fences(struct xe_vm *vm,
>   
>   static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
>   					u64 addr, u64 range, u64 obj_offset,
> -					u16 pat_index)
> +					u16 pat_index, u32 flags)
>   {
>   	u16 coh_mode;
>   
> @@ -2909,6 +2919,15 @@ static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
>   		return  -EINVAL;
>   	}
>   
> +	if (XE_IOCTL_DBG(xe, (flags & DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS) &&
> +			 (!xe->info.has_device_atomics_on_smem &&
> +			  !xe_bo_is_vram(bo))))
> +		return -EINVAL;


Is the check correct?

I'm not sure what you're trying to forbid here.


I would have guessed :


  (flags & DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS) &&
  (!xe->info.has_device_atomics_on_smem || !xe_bo_is_vram(bo))


> +
> +	if (XE_IOCTL_DBG(xe, (flags & DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS) &&
> +			 !xe_bo_has_single_placement(bo)))
> +		return -EINVAL;
> +
>   	return 0;
>   }
>   
> @@ -3007,7 +3026,8 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   		bos[i] = gem_to_xe_bo(gem_obj);
>   
>   		err = xe_vm_bind_ioctl_validate_bo(xe, bos[i], addr, range,
> -						   obj_offset, pat_index);
> +						   obj_offset, pat_index,
> +						   bind_ops[i].flags);
>   		if (err)
>   			goto put_obj;
>   	}
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index badf3945083d..5a20bd80c456 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -276,6 +276,8 @@ struct xe_vm {
>   struct xe_vma_op_map {
>   	/** @vma: VMA to map */
>   	struct xe_vma *vma;
> +	/** @enable_device_atomics: Whether the VMA will allow device atomics */
> +	bool enable_device_atomics;
>   	/** @is_null: is NULL binding */
>   	bool is_null;
>   	/** @dumpable: whether BO is dumped on GPU hang */
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 1446c3bae515..ca4447e10ac9 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -883,6 +883,14 @@ struct drm_xe_vm_destroy {
>    *    will only be valid for DRM_XE_VM_BIND_OP_MAP operations, the BO
>    *    handle MBZ, and the BO offset MBZ. This flag is intended to
>    *    implement VK sparse bindings.
> + *  - %DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS - When this flag is set for
> + *    a VA range, all the corresponding PTEs will have atomic access bit
> + *    set. This will allow device atomics operation for that VA range.
> + *    This flag only works for single placement buffer objects and
> + *    mainly for SMEM only buffer objects where CPU atomics can be perform
> + *    by an application and so KMD can not set device atomics on such buffers
> + *    by default. This flag has no effect on LMEM only placed buffers as atomic
> + *    access bit is always set for LMEM backed PTEs.


Maybe we should be more explicit about when this flag is allowed :

   - error ifDRM_XE_QUERY_CONFIG_FLAG_HAS_DEV_ATOMIC_ON_SMEM is not reported

- error on multi region BOs

- ignored for LMEM only BOs

-Lionel


>    */
>   struct drm_xe_vm_bind_op {
>   	/** @extensions: Pointer to the first extension struct, if any */
> @@ -969,10 +977,11 @@ struct drm_xe_vm_bind_op {
>   	/** @op: Bind operation to perform */
>   	__u32 op;
>   
> -#define DRM_XE_VM_BIND_FLAG_READONLY	(1 << 0)
> -#define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 1)
> -#define DRM_XE_VM_BIND_FLAG_NULL	(1 << 2)
> -#define DRM_XE_VM_BIND_FLAG_DUMPABLE	(1 << 3)
> +#define DRM_XE_VM_BIND_FLAG_READONLY		(1 << 0)
> +#define DRM_XE_VM_BIND_FLAG_IMMEDIATE		(1 << 1)
> +#define DRM_XE_VM_BIND_FLAG_NULL		(1 << 2)
> +#define DRM_XE_VM_BIND_FLAG_DUMPABLE		(1 << 3)
> +#define DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS	(1 << 4)
>   	/** @flags: Bind flags */
>   	__u32 flags;
>   


--------------ydFD2MqHEFAHYN0pth4PUfuh
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 15/04/2024 17:52, Nirmoy Das wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240415145214.25641-7-nirmoy.das@intel.com">
      <pre class="moz-quote-pre" wrap="">Adds a new VMA bind flag to enable device atomics on SMEM only buffers.

Given that simultaneous usage of device atomics and CPU atomics on
the same SMEM buffer is not guaranteed to function without migration,
and UMD expects no migration for SMEM-only buffer objects, so this provide
a way to set device atomics when UMD is certain to use the buffer only
for device atomics.

Signed-off-by: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_vm.c       | 28 ++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_vm_types.h |  2 ++
 include/uapi/drm/xe_drm.h        | 17 +++++++++++++----
 3 files changed, 39 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 8380f1d23074..b0907a7bb88b 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -753,6 +753,7 @@ static void xe_vma_free(struct xe_vma *vma)
 #define VMA_CREATE_FLAG_READ_ONLY	BIT(0)
 #define VMA_CREATE_FLAG_IS_NULL		BIT(1)
 #define VMA_CREATE_FLAG_DUMPABLE	BIT(2)
+#define VMA_CREATE_FLAG_DEVICE_ATOMICS	BIT(3)
 
 static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 				    struct xe_bo *bo,
@@ -766,6 +767,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 	bool read_only = (flags &amp; VMA_CREATE_FLAG_READ_ONLY);
 	bool is_null = (flags &amp; VMA_CREATE_FLAG_IS_NULL);
 	bool dumpable = (flags &amp; VMA_CREATE_FLAG_DUMPABLE);
+	bool enable_atomics = (flags &amp; VMA_CREATE_FLAG_DEVICE_ATOMICS);
 
 	xe_assert(vm-&gt;xe, start &lt; end);
 	xe_assert(vm-&gt;xe, end &lt; vm-&gt;size);
@@ -814,7 +816,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 		xe_bo_assert_held(bo);
 
 		if (vm-&gt;xe-&gt;info.has_atomic_enable_pte_bit &amp;&amp;
-		    (xe_bo_is_vram(bo) || !IS_DGFX(vm-&gt;xe)))
+		    (xe_bo_is_vram(bo) || !IS_DGFX(vm-&gt;xe) || enable_atomics))
 			vma-&gt;gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
 
 		vm_bo = drm_gpuvm_bo_obtain(vma-&gt;gpuva.vm, &amp;bo-&gt;ttm.base);
@@ -2116,6 +2118,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 		if (__op-&gt;op == DRM_GPUVA_OP_MAP) {
 			op-&gt;map.is_null = flags &amp; DRM_XE_VM_BIND_FLAG_NULL;
 			op-&gt;map.dumpable = flags &amp; DRM_XE_VM_BIND_FLAG_DUMPABLE;
+			op-&gt;map.enable_device_atomics = flags &amp; DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS;
 			op-&gt;map.pat_index = pat_index;
 		} else if (__op-&gt;op == DRM_GPUVA_OP_PREFETCH) {
 			op-&gt;prefetch.region = prefetch_region;
@@ -2312,6 +2315,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 				VMA_CREATE_FLAG_IS_NULL : 0;
 			flags |= op-&gt;map.dumpable ?
 				VMA_CREATE_FLAG_DUMPABLE : 0;
+			flags |= op-&gt;map.enable_device_atomics ?
+				VMA_CREATE_FLAG_DEVICE_ATOMICS : 0;
 
 			vma = new_vma(vm, &amp;op-&gt;base.map, op-&gt;map.pat_index,
 				      flags);
@@ -2339,6 +2344,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 				flags |= op-&gt;base.remap.unmap-&gt;va-&gt;flags &amp;
 					XE_VMA_DUMPABLE ?
 					VMA_CREATE_FLAG_DUMPABLE : 0;
+				flags |= op-&gt;base.remap.unmap-&gt;va-&gt;flags ?
+					VMA_CREATE_FLAG_DEVICE_ATOMICS : 0;
 
 				vma = new_vma(vm, op-&gt;base.remap.prev,
 					      old-&gt;pat_index, flags);
@@ -2376,6 +2383,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 				flags |= op-&gt;base.remap.unmap-&gt;va-&gt;flags &amp;
 					XE_VMA_DUMPABLE ?
 					VMA_CREATE_FLAG_DUMPABLE : 0;
+				flags |= op-&gt;base.remap.unmap-&gt;va-&gt;flags ?
+					VMA_CREATE_FLAG_DEVICE_ATOMICS : 0;
 
 				vma = new_vma(vm, op-&gt;base.remap.next,
 					      old-&gt;pat_index, flags);
@@ -2731,7 +2740,8 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 	(DRM_XE_VM_BIND_FLAG_READONLY | \
 	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | \
 	 DRM_XE_VM_BIND_FLAG_NULL | \
-	 DRM_XE_VM_BIND_FLAG_DUMPABLE)
+	 DRM_XE_VM_BIND_FLAG_DUMPABLE | \
+	 DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS)
 #define XE_64K_PAGE_MASK 0xffffull
 #define ALL_DRM_XE_SYNCS_FLAGS (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
 
@@ -2874,7 +2884,7 @@ static int vm_bind_ioctl_signal_fences(struct xe_vm *vm,
 
 static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
 					u64 addr, u64 range, u64 obj_offset,
-					u16 pat_index)
+					u16 pat_index, u32 flags)
 {
 	u16 coh_mode;
 
@@ -2909,6 +2919,15 @@ static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
 		return  -EINVAL;
 	}
 
+	if (XE_IOCTL_DBG(xe, (flags &amp; DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS) &amp;&amp;
+			 (!xe-&gt;info.has_device_atomics_on_smem &amp;&amp;
+			  !xe_bo_is_vram(bo))))
+		return -EINVAL;</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Is the check correct?</p>
    <p>I'm not sure what you're trying to forbid here.</p>
    <p><br>
    </p>
    <p>I would have guessed :</p>
    <p>&nbsp;&nbsp; <br>
    </p>
    <pre class="moz-quote-pre" wrap=""> (flags &amp; DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS) &amp;&amp;
 (!xe-&gt;info.has_device_atomics_on_smem || !xe_bo_is_vram(bo))
</pre>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20240415145214.25641-7-nirmoy.das@intel.com">
      <pre class="moz-quote-pre" wrap="">
+
+	if (XE_IOCTL_DBG(xe, (flags &amp; DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS) &amp;&amp;
+			 !xe_bo_has_single_placement(bo)))
+		return -EINVAL;
+
 	return 0;
 }
 
@@ -3007,7 +3026,8 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		bos[i] = gem_to_xe_bo(gem_obj);
 
 		err = xe_vm_bind_ioctl_validate_bo(xe, bos[i], addr, range,
-						   obj_offset, pat_index);
+						   obj_offset, pat_index,
+						   bind_ops[i].flags);
 		if (err)
 			goto put_obj;
 	}
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index badf3945083d..5a20bd80c456 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -276,6 +276,8 @@ struct xe_vm {
 struct xe_vma_op_map {
 	/** @vma: VMA to map */
 	struct xe_vma *vma;
+	/** @enable_device_atomics: Whether the VMA will allow device atomics */
+	bool enable_device_atomics;
 	/** @is_null: is NULL binding */
 	bool is_null;
 	/** @dumpable: whether BO is dumped on GPU hang */
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 1446c3bae515..ca4447e10ac9 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -883,6 +883,14 @@ struct drm_xe_vm_destroy {
  *    will only be valid for DRM_XE_VM_BIND_OP_MAP operations, the BO
  *    handle MBZ, and the BO offset MBZ. This flag is intended to
  *    implement VK sparse bindings.
+ *  - %DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS - When this flag is set for
+ *    a VA range, all the corresponding PTEs will have atomic access bit
+ *    set. This will allow device atomics operation for that VA range.
+ *    This flag only works for single placement buffer objects and
+ *    mainly for SMEM only buffer objects where CPU atomics can be perform
+ *    by an application and so KMD can not set device atomics on such buffers
+ *    by default. This flag has no effect on LMEM only placed buffers as atomic
+ *    access bit is always set for LMEM backed PTEs.</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Maybe we should be more explicit about when this flag is allowed
      :</p>
    <p>&nbsp; - error if<span style="white-space: pre-wrap"> DRM_XE_QUERY_CONFIG_FLAG_HAS_DEV_ATOMIC_ON_SMEM is not reported</span></p>
    <p><span style="white-space: pre-wrap">  - error on multi region BOs</span></p>
    <p><span style="white-space: pre-wrap">  - ignored for LMEM only BOs
</span></p>
    <p><span style="white-space: pre-wrap">
</span></p>
    <p><span style="white-space: pre-wrap">-Lionel
</span></p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20240415145214.25641-7-nirmoy.das@intel.com">
      <pre class="moz-quote-pre" wrap="">
  */
 struct drm_xe_vm_bind_op {
 	/** @extensions: Pointer to the first extension struct, if any */
@@ -969,10 +977,11 @@ struct drm_xe_vm_bind_op {
 	/** @op: Bind operation to perform */
 	__u32 op;
 
-#define DRM_XE_VM_BIND_FLAG_READONLY	(1 &lt;&lt; 0)
-#define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 &lt;&lt; 1)
-#define DRM_XE_VM_BIND_FLAG_NULL	(1 &lt;&lt; 2)
-#define DRM_XE_VM_BIND_FLAG_DUMPABLE	(1 &lt;&lt; 3)
+#define DRM_XE_VM_BIND_FLAG_READONLY		(1 &lt;&lt; 0)
+#define DRM_XE_VM_BIND_FLAG_IMMEDIATE		(1 &lt;&lt; 1)
+#define DRM_XE_VM_BIND_FLAG_NULL		(1 &lt;&lt; 2)
+#define DRM_XE_VM_BIND_FLAG_DUMPABLE		(1 &lt;&lt; 3)
+#define DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS	(1 &lt;&lt; 4)
 	/** @flags: Bind flags */
 	__u32 flags;
 
</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------ydFD2MqHEFAHYN0pth4PUfuh--

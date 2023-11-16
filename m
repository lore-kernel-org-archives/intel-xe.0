Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98B08C197A0
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 19:57:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 643D910E694;
	Thu, 16 Nov 2023 19:57:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7886710E693
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 19:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700164645; x=1731700645;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AxmHkqwRl+4kXgsORqlFLom4WmC/OPztD/Rg+d1Zufk=;
 b=RejXdPf6bOiPUTZKh1p/kMguHzA4Zz0z3RDGbj3KrClZKujl9pV8XXYY
 UDKc4Mw9DHKgnd0iAgob6mbhvLVJDyTzVoDNaE18Wb3cy4Sz0iGGuk0xC
 T5Ak/DcqASMjm/cP2IhGEhrGpLnVxmNOEIRtvYtXVhuVOyfCSJcKiBLtH
 PZgb5nLkBOaR+XskrGjG4hYT97y6LwITBEaMBicDdryG0KEWSea7odTJL
 EU7UF7YMvPCz9/h7UE5RrsvAV6qqE3uJDeBVepdkYGkBnQGYzX/m1tRtp
 HFnomRyIKUgEkfiRrVzhnJ5wuovFLzOTcwIOJu3HDeywj/yamBx2j6AQr Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="370525413"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; d="scan'208";a="370525413"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 11:57:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; d="scan'208";a="13669042"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Nov 2023 11:57:15 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 11:57:14 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 11:57:13 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 16 Nov 2023 11:57:13 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 16 Nov 2023 11:57:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e8XSqug9p8dpBe3/kYwYRL3EB/R6BGvoht0lqqLdtrmHCvsGfgdkFCeY8Co7G5CNAM7e5UZHfRdM/gKWgPWJhZEN5W58suegJBy0NXpAea1a0B+k+dqni5QmNn00MFkpLi3LiRYnC1L62QsB7zxaTp3h8p3lQdBSe0qcsxiDcnJxuZPgVjv8or7VwG8SG+3BLTZ5LZqwoiI5KFs3q9ZFX6ulYmxMlpIjqI04pl3Z57SDs73yU6hGiR31Rmj+9b86+FQjcATUg0P2JiXEe2pEspPdNnmqafWwqZ8O8Vj5Iaflo66lxBVuuxwEkJtpCPyCBbdb/agxcWI9g32hTFfc7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qGCq8aDpDw3TEbBg3yhrA+WSivQeMPxkV0SCm6h3kj8=;
 b=iLiCPZmWOZARzSJttF4UbX/0v90HEzAU31yM6vaKS6pGu6PDNmYnMuLN9FdcKlCZTGBMpXZz4t/glvpYjzeunB2GJK/ctHkzK6v6Q29SBDKf8HQz3VUAb6AxEqT6BPWQTdtlRug2WG/PcmcP2FT4M//iF00UYaLnTiDnu9MTMRnISwJbfsfML5rl/58vAt6fpS0qNs8/Wd3j1N9+B1vtLfh0rvqeJmQWw1GaVlmFz+qnt5seApek5h59LTIqQ5Qm/s1THldyauhfRvOotgZISgRSKfbJ8BO0HVExRJ+VwH7KykcfXjLwb4CiW0YlR9xYqDmsXgGlqhoE9VZbLB+VZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by DS0PR11MB6495.namprd11.prod.outlook.com (2603:10b6:8:c1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.17; Thu, 16 Nov
 2023 19:57:11 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::c947:cbd4:3870:c36e]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::c947:cbd4:3870:c36e%6]) with mapi id 15.20.7002.015; Thu, 16 Nov 2023
 19:57:11 +0000
Message-ID: <8f88e133-6595-4cdd-8b81-11fd4e74e85d@intel.com>
Date: Thu, 16 Nov 2023 11:57:09 -0800
User-Agent: Mozilla Thunderbird
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20231115031508.173140-1-matthew.brost@intel.com>
Content-Language: en-US
From: "Welty, Brian" <brian.welty@intel.com>
In-Reply-To: <20231115031508.173140-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR08CA0071.namprd08.prod.outlook.com
 (2603:10b6:a03:117::48) To SN7PR11MB7705.namprd11.prod.outlook.com
 (2603:10b6:806:32f::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7705:EE_|DS0PR11MB6495:EE_
X-MS-Office365-Filtering-Correlation-Id: f1594ede-3402-4ae2-0b29-08dbe6de388e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 67fl7xu8oL47kHijnpqGmGbNErljso/qg+no4GzHWyYa1fL2ty+WZIlGZJI/hh65pLakte5WAOK4e7tkasOVw20pQukZIg/MFWCPQ9hyoEUk1ARKGNFGqBsdPHGXFz0Buc8xmEFARtBHt65fv8QQ0XJWut4aYzzvcF9k7cZ/8E7RDjvrI4S795W1vUl8zbY2/50aBK0wZYB5k+XWvTXAeuvw7OO29wiVbcX8/n++eOWaa9dBnjTS5eY6b0gz4Xqb5hpL+nQ18sh9x3mL0Z30gaoTcf5/sd0s7pMbNY9Z9D6X6uzHL1V9qXlQ6M2bPEapspsgcPvqLyPLtVgDFJqj0RXlTzufORilWxKcWeJyvD7Qg4q5gM76N0+J8F/FlvWS5GIC+1yI1ndH86cNlP80E++MgCwQK+uCfmiv5OeSx3EiVAlU6k8Ws2Xvqa11zIO0CjqySd9KZ+O9jFYNeUGnoLeG0d2VuPGCIw2gzGbMHLPq4Z4cOD3LDRX6X41uLkwFZx5spCQU/Z8ExgeEvBbNAH5DEvPiPVK5Wh0Iw4Rk5FaRLa9vNYMq8Zv1+H0YlrUkpK0DGsZrDOxujFtScpDgC7wSkfPt2RnHsKi2xq0MCm8RU423UGEoaMIaJYlHwzzRIDWzAEBBPjwRq4CfxLujIw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7705.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(346002)(39860400002)(396003)(136003)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(6486002)(66946007)(66556008)(66476007)(316002)(478600001)(4326008)(8936002)(8676002)(31686004)(6506007)(6512007)(53546011)(31696002)(41300700001)(86362001)(83380400001)(2616005)(5660300002)(82960400001)(36756003)(38100700002)(26005)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmRTem1PQnhDKzg0R0ZROW1xejVZMHZSeHdjdEt5Z2dlQ2pOT3M3ZHBPRWRB?=
 =?utf-8?B?WG1EYzBzZ0ZSMnI5elIyV3NnNWNOczNWeVZnckxWR2ZNSFR0Uy93bzBaT0Fl?=
 =?utf-8?B?OG8xSWZLZXJwdW0ySTFlRVF5a1NVeHlJbVB1aW5kU2daNm9GbXhMQ3NNSExh?=
 =?utf-8?B?U3VnK0ZaR0NLRCtubEhGQVBCRlFkWUVsSkI2cEhqNjlOWkFhRnNKdVBsQXl3?=
 =?utf-8?B?VGc4cmpOK0crd1oxeGVzMGxmRGZvbEE1ZlhtNFRDVjkwWmsxOXg4UTNyZFRE?=
 =?utf-8?B?OElQQWVrQjJXL3FMV0E3WDdOZnhoekt2MUxKemgxemhRQ1VuNVBDM1dubHg1?=
 =?utf-8?B?MlpCWGRwaUUxaFBzRCtWZFNxbExjT2Q0VWsrYjBQN2JnYW1wQXpoWExJOGRT?=
 =?utf-8?B?R0VwOW1EV1JEV1dKSDQxVG54Z1l0R3R3d2tjQUNkNEJDeUZ1ek0zajJhMVdu?=
 =?utf-8?B?VVlMOUxrc0xxMTl4MDl2OVFyanFnTzMrczEraVV1S0VPY0J5Z2VKei83SlVt?=
 =?utf-8?B?Lzl0ZmtnMTdabVR5M3YzVWswTnpiWk9NZDlBUzNGd0wwYnJpMS94c0lYQ0pG?=
 =?utf-8?B?QWZycDB3aVZIdXJmdlgvMHFkakNwMldRNjJwaXNGNXpHV0NMV3gxYWptZE45?=
 =?utf-8?B?eUlrTnFvS3c2WUJsL2s1QXF4OGlYclJyK0d2Z3NuQXJTUFFRYUtIMU1QYWZ5?=
 =?utf-8?B?dU84VkxqVGpwRlR6elFWUEJjeXlVMEgza09sNVI2V2FDY1ZlaWtwUERVczBa?=
 =?utf-8?B?VjRmSEkvR1pvZFd0Y0s1YzliMmVUVTNYMG9hVnVGSjJibFRMaWE4T3JORjFv?=
 =?utf-8?B?WUZiSVR6cDl1eWxvSEMwSWtmNGNKUExrOE1XOU92UGpHYmFQeUFpay83ZklB?=
 =?utf-8?B?Q1oraW5ZZVZrOHNTSnlrcjVrR1ZqQzJmaWRZSGNxTDRqbGdnN3ZpajRtMGY0?=
 =?utf-8?B?aytnY1JqeFptcEROVXJxTHcyODV3dk5vM251SGU4dTNoYUk4NGdUTUI5VFo4?=
 =?utf-8?B?YVhIQmZXTWJEQUVhUGZzekhoYXlyVE4zeElQRE8xeTNLT3JwTTl3T2JpR2tE?=
 =?utf-8?B?d2g5aERsd0hKZWsyOWp2SEdPa3pxN1FwNWtZOW5wa0cvYlpsckxQSk13UHpO?=
 =?utf-8?B?WXlwTnVVQzU1WW5rYnF3N05vZFVXVmlISGpXRnU5cnErVUxObUNFQmREUXpa?=
 =?utf-8?B?NmRLZUIyU1g0QnR0bk5ORlFqb2VQZXdMVjFDeGU3QXpvWkRtMFZ3Mi9QQVRH?=
 =?utf-8?B?T3l1M1dGNjRWR09yWnBnZ2YyU3d2dEkwck9MTnZhTG9CZCs3WXgrY21kSkFh?=
 =?utf-8?B?aDU3S3p6emRkN3plVzMyNHpmZVBWbWY5cUtqNUFacVQ0RFQyRkVBTEs3OEhN?=
 =?utf-8?B?SW9YZTJldDVsMDJsQ2k1c0wwZkNtUnYyc1NNMVM2Q29SZlBYWTd2OGxMaUZw?=
 =?utf-8?B?TFFLUVFYblBWMDZRMEMvTlhLa0pqVXpRS1pDbTBaRzJCdDJpU1FnNHpscmc2?=
 =?utf-8?B?cXNyL1BwVzM2RW9keThoc01mNUQvZWRncHZIdEhPbkMyRjhITGNEaWtydjRB?=
 =?utf-8?B?aWtVeE1lK3Z1b2hkbUppY3VWQktZQkZqT3FCRG4rcytKWk5LL0dIalZYNjFO?=
 =?utf-8?B?TjdKYlpPSDRRSEZrb1pDc2ZzWXc5ZFF3K1lURktqcTBoOUZ0NmhjNm9qVWFw?=
 =?utf-8?B?OGMrR0V1RzlHTFlzdDZ3QXFBNHlXT2xPNWlYZW1DRjB2NHNNbG4wR2l0YzNu?=
 =?utf-8?B?Yyt4U1M3Ui9QMElyUWl5MWpQYlJrMGt4eW12WGdyRC9iTmlmck1sT0swbmFk?=
 =?utf-8?B?Wmp4NlZNeHl4UDNqNXhKelZVaFUxcmRwanVmazhIWEw1Y05DKytqREk4cHUr?=
 =?utf-8?B?c3lDMDc4U004RFJ3MzFaTE9Vbk8yVEZ6OXRMZ1NyNE80bjZIZW1SOERZNjEv?=
 =?utf-8?B?UysxbnJML0VtQUlBanBFNDZhWllKd1YzTGJvQkFQWlhmMzBZemVpcmZKVlVL?=
 =?utf-8?B?OGcvM1h4VGorcTN3ZlZuVmpkWFBNS2hQOURVODlsckFzU0NOcGhuUmhDREVD?=
 =?utf-8?B?OVUyYjEwNDVEY1ZUcWVwR0hOZHl6WjBJQmpmRU56Ly9TMnlXaTlxK25hYjNV?=
 =?utf-8?Q?NqmsXDPbhT9HuYiVYWFF5eqMQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f1594ede-3402-4ae2-0b29-08dbe6de388e
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 19:57:11.0284 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lEH0POHohmIJMginSr/EFzlO2EOVLd4xG5o3s9avrkRrAbWa/bi0K4+5c/BXHNcyelrVSTRL4lQi9UEZc71mww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6495
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Only set xe_vma_op.map fields for
 GPUVA map operations
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
Cc: Dafna Hirschfeld <dhirschfeld@habana.ai>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 11/14/2023 7:15 PM, Matthew Brost wrote:
> XE_VM_BIND_OP_MAP_* IOCTL operations can result in GPUVA unmap, remap,
> or map operations in vm_bind_ioctl_ops_create. The xe_vma_op.map fields
> are blindly set which is incorrect for GPUVA unmap or remap operations.
> Fix this by only setting xe_vma_op.map for GPUVA map operations. Also
> restructure a bit vm_bind_ioctl_ops_create to make the code a bit more
> readable.
> 
> Reported-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
> Signec-off-by: Matthew Brost <matthew.brost@intel.com>

Typo in your signed-off !

One comment below.

> ---
>   drivers/gpu/drm/xe/xe_vm.c | 59 ++++++++++++--------------------------
>   1 file changed, 18 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index d45f4f1d490f..1049869b5a6f 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2187,42 +2187,12 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,


Looks like you can trim the arguments to this function....
At a glance, looks like flags, tile_mask, and region no longer need to 
be passed.

-Brian


>   	case XE_VM_BIND_OP_MAP_USERPTR:
>   		ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, addr, range,
>   						  obj, bo_offset_or_userptr);
> -		if (IS_ERR(ops))
> -			return ops;
> -
> -		drm_gpuva_for_each_op(__op, ops) {
> -			struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
> -
> -			op->tile_mask = tile_mask;
> -			op->map.immediate =
> -				flags & XE_VM_BIND_FLAG_IMMEDIATE;
> -			op->map.read_only =
> -				flags & XE_VM_BIND_FLAG_READONLY;
> -			op->map.is_null = flags & XE_VM_BIND_FLAG_NULL;
> -		}
>   		break;
>   	case XE_VM_BIND_OP_UNMAP:
>   		ops = drm_gpuvm_sm_unmap_ops_create(&vm->gpuvm, addr, range);
> -		if (IS_ERR(ops))
> -			return ops;
> -
> -		drm_gpuva_for_each_op(__op, ops) {
> -			struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
> -
> -			op->tile_mask = tile_mask;
> -		}
>   		break;
>   	case XE_VM_BIND_OP_PREFETCH:
>   		ops = drm_gpuvm_prefetch_ops_create(&vm->gpuvm, addr, range);
> -		if (IS_ERR(ops))
> -			return ops;
> -
> -		drm_gpuva_for_each_op(__op, ops) {
> -			struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
> -
> -			op->tile_mask = tile_mask;
> -			op->prefetch.region = region;
> -		}
>   		break;
>   	case XE_VM_BIND_OP_UNMAP_ALL:
>   		xe_assert(vm->xe, bo);
> @@ -2232,19 +2202,13 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>   			return ERR_PTR(err);
>   		ops = drm_gpuvm_gem_unmap_ops_create(&vm->gpuvm, obj);
>   		xe_bo_unlock(bo);
> -		if (IS_ERR(ops))
> -			return ops;
> -
> -		drm_gpuva_for_each_op(__op, ops) {
> -			struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
> -
> -			op->tile_mask = tile_mask;
> -		}
>   		break;
>   	default:
>   		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
>   		ops = ERR_PTR(-EINVAL);
>   	}
> +	if (IS_ERR(ops))
> +		return ops;
>   
>   #ifdef TEST_VM_ASYNC_OPS_ERROR
>   	if (operation & FORCE_ASYNC_OP_ERROR) {
> @@ -2255,9 +2219,22 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>   	}
>   #endif
>   
> -	if (!IS_ERR(ops))
> -		drm_gpuva_for_each_op(__op, ops)
> -			print_op(vm->xe, __op);
> +	drm_gpuva_for_each_op(__op, ops) {
> +		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
> +
> +		op->tile_mask = tile_mask;
> +		if (__op->op == DRM_GPUVA_OP_MAP) {
> +			op->map.immediate =
> +				flags & XE_VM_BIND_FLAG_IMMEDIATE;
> +			op->map.read_only =
> +				flags & XE_VM_BIND_FLAG_READONLY;
> +			op->map.is_null = flags & XE_VM_BIND_FLAG_NULL;
> +		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
> +			op->prefetch.region = region;
> +		}
> +
> +		print_op(vm->xe, __op);
> +	}
>   
>   	return ops;
>   }

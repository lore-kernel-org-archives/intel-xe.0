Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4761E105D986
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 21:35:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0563710E4D3;
	Tue,  7 Apr 2026 21:35:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CcVOQJCC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0428F10E4D3
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Apr 2026 21:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775597735; x=1807133735;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=BO9o1YyUbGtJ7MRw4y7BE/d6y6ka5KJaUrHqqg9cMVg=;
 b=CcVOQJCCy3dw8KVExH2rYkVjY4E+1OhDbz2lwRNqdjhGSeOoPkNKJNle
 CjrWfyDIsXKNZoMtj9r09kJgvKUH61p7gDZsqrJ5HVm4V/PnZquWaKdcD
 Ww4mgStD7mNrzsGVSAlkPAskOYXH7BVH0d2cGJ0rPSlO68yj2BV7rdwMz
 2f2LEiHgdnuvC4PhIlgCRmFaDZ4tI+T+N1zdfmLVNL8BBahBnAvm5J/4q
 ZDRaKP7sqP6ITHNDYCVFX18jSvLusfjTO3MFXEUR+NblsKgmU7yfqtKCS
 NHWclfuub0KvEngsO+cjPMRhUzDQPMq/aQzg9OKcfYUyafNH4kwkS2LST g==;
X-CSE-ConnectionGUID: jfDGoJMFQqaWZ9aY6xRhNw==
X-CSE-MsgGUID: 2lZoeJO4Rnq1PL1uAgAxAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="76643261"
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; d="scan'208";a="76643261"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 14:35:35 -0700
X-CSE-ConnectionGUID: tEqUJdCXRwWf+ODuAInsaw==
X-CSE-MsgGUID: y1W9p8HzTam4NLfmOnOurg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; d="scan'208";a="223511749"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 14:35:34 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 14:35:34 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 7 Apr 2026 14:35:34 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.23) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 14:35:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dGCeAnKx5QGTgPpAkIDxY5AELQguMZuyQmXFsz6/jgvrzYOEwwCKIF3/I3udJ7OB0P9AZSq8notsahkHITPOtymY/TD4PFdNQnjPUEhh6s4fLSsmeWj63IJOKVEWa/KnPM0IVp5B7yxeFzUKhXI/8Ect6AKa9U7teUc1gOXY6vUjggUykRyMKrxZkiGCeZrTHXiWZYTPj6LAaLcEPfgOmIzVKO4kmkqb9cuL/cxMgFDNC6Tuh5DhQcRUxBXBXr6xiyIO8ec+XNKp2mlrOtbckPcajiaWwCNSv97sfeMvT86EykBAYgoR8LJSrIH996fnIEeLL/ca04ukd7rVRPcYyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LREFwqA0vxCBxFtc4Omff/EtlZb+UePOpcJHo+085mM=;
 b=KFrnQ0HXRINuNuZFYLVA9OAIQzSDPLumtPbNZkDq2SfDWTF8S+qLaoQwDco4fS4YqH3zyDS6cu2+bwkvG9FQasbs0D91KXnlLQ5mDny9Oq3OikwqMc8SpY6KKt9nExXopTUXhJuQT4YPiTpRzzoP3Il2Cl0JoUREqE6zz/25JgC1QoFXnMB4HyFs4ijUUEziviU6zrR0foWqdJTtiPUUodfISe9U75Jui80iNhG0D8O4tkUDp5ZB8QZPxPgoiqqp2eYjF9DcyMpQCO9nA1wRHsxj3gfygsUJFhsd2qI2eZ9qp4PMqzRskm893TD6m8s3eZ+8mv1M+0K0UPiDG16tgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by BL1PR11MB5222.namprd11.prod.outlook.com (2603:10b6:208:313::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Tue, 7 Apr
 2026 21:35:30 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286%4]) with mapi id 15.20.9769.020; Tue, 7 Apr 2026
 21:35:30 +0000
Message-ID: <ef805325-0579-409b-98fd-0ebecb796d62@intel.com>
Date: Tue, 7 Apr 2026 14:35:28 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] drm/xe/uapi: Fix wrong names and references in
 xe_drm.h
To: Shuicheng Lin <shuicheng.lin@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260407030046.3394004-1-shuicheng.lin@intel.com>
 <20260407030046.3394004-4-shuicheng.lin@intel.com>
Content-Language: en-US
From: "Wang, X" <x.wang@intel.com>
In-Reply-To: <20260407030046.3394004-4-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0350.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::25) To SA3PR11MB8046.namprd11.prod.outlook.com
 (2603:10b6:806:2fb::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB8046:EE_|BL1PR11MB5222:EE_
X-MS-Office365-Filtering-Correlation-Id: 45c43d0a-9994-4d48-a041-08de94ed9788
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|42112799006|1800799024|376014|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Ue203Y9yvfzQFwO+7877JQLkLDU/XFai2Qhe6xHCOkw6b1gM3ioLcSZ59BsBqO2l233/mAmf2FhTkbEluqGYnjsuKYwRos3Z8wa1sOlUpsKUslCJI7IrVGzSV4ZAGmWIeYG4nD4RxBpkcIaHsgLF4hBD2ZgfaNdTODJQk9JYvsVGTjGuBaLOl91/936dc5kreAnW7DgHq+stieP2P2k3Uu//NK3tf40EnDy17QWSXTei2QfrmWbRICNSook/yDcJeTHYSlYByqMIGOdTBrArz9h5y48eHPCHT06Aqs3R6x/YICMQkyFfVrHug/gHxMs7wK8+q21ecVbENUaFsDOcKAb5hlzU/xg/yjvDuKd+bwKOodOv5aJMtkdidxF12i27YyBpRGhpUmVGDc0zqjxy/9kB6W1PIgISxOKxfcVk0KRhD1xaeFSs6SMLIePyKbITqcOSPWu3YK2EmUeJki1MQfEDIjKefQXiLXB+G9rXOLFforVYL9v/dtjLKKJcj5VzFnKm38zhNK+NmWtExEu+tfojYd+7NbCTSsW88P4tHvgTQqETKWh2tEtHhxpvmk78cymWHvoO6MfIZS//0Pip9/OEf3oz6czLtN4IGGYuwppdCU1xOn3S55nqLCuiMZHuB7o9sopu9+9X7w6S4ZQ0lF5KSG5VmNOvbqDn2Q+/lwQGaLBab9nr1cvx3Ehy6R5Pa2h8qQNtlfujgU9YmH5ObUHIsD35vwmxfKrG2BhPvYM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjRDUS8vdVF0cUh5SmRIa3hqYW1vb0JPeTdaT2dCdDJPckVuUEtQTjdSbUh0?=
 =?utf-8?B?WFQ4Sm5SaHJIaHN6YTlwaDRXanllQ0s1MTlmQzZNTjhvVEp3cFc4emJjaEk2?=
 =?utf-8?B?ZUpJYXNKYUpsUWZYNjB3WVgrN1JCUmNCTm9lZHA0RGZHdS80SUtSSXZKWTM1?=
 =?utf-8?B?UndTWVkxSmZUT2pETk13Mlk0QXRzazlhQzBLdmwvVjlUY0NPM1VNVzFjWWsw?=
 =?utf-8?B?bENnbUhUcUo5eWlkajhiQndNaFlXbnB1ZHlMSEh6aklzd2t2MWtyS0U3MXA3?=
 =?utf-8?B?em5FcHVzVmhqcjdJRHpYL3hycTMrUUk0a2lmL2VzNCtKWk8rbVc1dThKZHRW?=
 =?utf-8?B?S0RkVG1PWWJTbFpSdFEyUTJ2SFFTOGphREtsR2p5NkNxNE9NMFFsWE9RMUVS?=
 =?utf-8?B?bnUxaVNOdVcyQ0xid3ZXTTE5bGVMbEY1TnhydU9VV3p1azdjeGpzcVAyQjNW?=
 =?utf-8?B?bkhNeFVMMGRJTGRrRWhuZm5QVTEvSFNGZXRQVGRXSWJNTDlpUWhORngxQzJh?=
 =?utf-8?B?Q3lYcTV5Q3dDVzQwQUZLdGxHaWRENXRsUTYxbXRoOFdaTy94MDRYWU9TVmNt?=
 =?utf-8?B?eE05OWxLWUV4NStCSDB1aUlYVDZRUGh4QWtMUDFPTUFlS0U2MkdEYjF6Ly9q?=
 =?utf-8?B?enY0R21HeVVrNUYxcnZrTEhTRVZCT3Jscnp2NmoxcmRLWVg2aFZOdVlBN3VF?=
 =?utf-8?B?ZkR4aWxJT1NkNi9ZUW0veTlQYzNOVGw3R2V4Si9Ob2IrM1pLQ3RDSllGb1Vl?=
 =?utf-8?B?YU5ncVFwZ2Y3dWlTbzRadk9mMXZJeTFhQ2pITkpwR3d3Tmw0aEVCbVloOHFM?=
 =?utf-8?B?WkFXZm9jaWRScmhQV0wwSUp1YjZ0UWs4ejBFeDRVK3JaNG1NMTdhRi9SVGlz?=
 =?utf-8?B?bjdWNEhscUptNjZGY2pOaEpyeW9ZOG1yTW42UmY4d004dlE3VFFySzFGVUNz?=
 =?utf-8?B?SmhpYk50cmw2NllTRmtKRmlGM3RMMmdMQjN4Y2hUaEozZWZtNHlSZDJnYWNs?=
 =?utf-8?B?bnhuRnJDVXpQVEk4V21UNnZESENCdkpqMVE0RW4wT2N4MUhOMVVDRDZEZ3RQ?=
 =?utf-8?B?aWttb3pacTVPRFBLblJBaVNjTS8wMkRJUks2dGNsd0hkbkhzVFBEQzcyamxo?=
 =?utf-8?B?dHZHQnZ0T3NWRTFPVHc0dm1EK2lEaGJXZEpSdWZDWVpPV1Vzc3E5dFpqYjQr?=
 =?utf-8?B?WEx5RVY1RlJuUVVraDNlOXJzZm15c0VnSEJ6OG9kelhUWHBmclU4T1dueEF2?=
 =?utf-8?B?eTJMRXQ2UVFuMzNORWQrN2dDdWhkOWVTR0RIR2piM1NzQjJGazFDd3V3elpv?=
 =?utf-8?B?SlRXb0NaSFdQUkRHUFBNazF0Rzh0WFRMMWtOdnFRSCtUeERvZnl6Qld5anpG?=
 =?utf-8?B?akx5VjVWRU9BM05wVkxKZDBwclMwRzRDeTRZMDJKeUZwbG1oUUNCKzlhT01J?=
 =?utf-8?B?eG9zWFVxb3FQNlZNdFRVZXhHVktPeXlhNzlsZEFiTHQrcEpNbmJ6MEpaUHZv?=
 =?utf-8?B?WmlvL3hRekdjbmlnYVpOVjFXR09TTEpCeEhidlhRb0R5R3g4OS9zUUpVMzZ3?=
 =?utf-8?B?VTEzSjc0b1ZrZUxBcDdTeERYbmdhbW1ldDZzZ3pmSS9wMjQwaDBNQ1FKUXZM?=
 =?utf-8?B?Ty93UVN5Tzl1dE5URGM4M1FKSDlzUFdBbTdaMy9Tb3lCcy8wWVJOOFFLWExQ?=
 =?utf-8?B?eDJkcjdrUHpRZzVqNlRBVjJCTEFQaTRKcjV0OFE2d09CaTcwSUM5ZzRVbVFm?=
 =?utf-8?B?YlZPUG9vSU5XNG1SL2hkdk9zWkkwT1BoYzMzSmlpRjIzNU90RG5rVm5kcy9D?=
 =?utf-8?B?UUcyVXFpNmRaNUgzWm0vQkVmWG9panpyclNRTDhnZ21NdTI0SHh3Zm9pZSs2?=
 =?utf-8?B?OUNoZWdxVzZ0ZGpTY1pQYVRlMWozanZaUmhDekEwOWZRNGtpc3lTaEM4a0pH?=
 =?utf-8?B?alN1Q1pVbTVSWEx6QmIzRXNnenZva0VYRXdlUll6U1M1N0FXZTR6TVowTUp4?=
 =?utf-8?B?dEMwK3RSKzFxME5GUXBvdkEwRHZEeGo4alZIMEZRQkxBQlI5dk42SWdSRmdl?=
 =?utf-8?B?TWdtV1Q4cDNzQW14aGR0RUtvYTRkMlMwd0hwYm1WZUhyNGhhT1ZOUlJNLzlX?=
 =?utf-8?B?RS9ZcU5pc2lBdE9PRXFEQmF3T0I4cVNVdGU1elljQ1lvSWFUOW0vZnNsZGo5?=
 =?utf-8?B?aVV4NGxjZnhaR28yZXdNRkxmK1dYRmtjTEE1TktCYkVocGQvM0FuU2xGYzJs?=
 =?utf-8?B?QkR3Y1ZqZ2NkaTFPNU5JR2tKTTBMOTB6ZzhsMFVwdnhzc1hVcHNXcTU2VWNt?=
 =?utf-8?B?aTd3bWF1MTdHRUNaVlJiN2pLNlRCbnB4YjN4SDVnY0tVMzV4ZFkzUT09?=
X-Exchange-RoutingPolicyChecked: Y53qR6kU5u2+vlqf3GDJS5Y0vk5PSnhU3rRIVunbX9CaDMvpQxQCYzV68eAFnR5aSsJ8xugQKZZMrfBDXypPcEVVyGvqdtcCJ1z3h/hINwOI17gt7WuIAKXpzsHHClcYfmqBJaKqPT8Zbxo/+rCRckHbVyhjnZXYoib2iio7Cpx1FV+YBINODpjC5iPuJFba01U69FdEuf542ymCyYOQdqDxl42TyTD5A+UVvNa7d9zBsi5wz5UAbyo904wOaYqv+WyV56xKC5BqGxsiZIjsIJ4GrTh9Gwg9+UhOABDs0nyNCMV6rASjExWojdMi/wwRgFq5essIL4ex+eMNdUtI4Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 45c43d0a-9994-4d48-a041-08de94ed9788
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 21:35:30.5675 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: apz0RHT2b4NAUK876slJjDNellz1EH6GRzauoGJVDspwrt4m3wWYrrNpIqsit96pRT3sxzFh0w/qSBBWiYxK/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5222
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


On 4/6/2026 20:00, Shuicheng Lin wrote:
> Fix incorrect field names, struct names, ioctl names, and
> descriptions in doc comments:
> - probed_size -> @cpu_visible_size (correct field name)
> - @flags description was copy of @placement ->
>    fix to reference DRM_XE_GEM_CREATE_FLAG_*
> - %XE_PXP_HWDRM_DEFAULT_SESSION ->
>    %DRM_XE_PXP_HWDRM_DEFAULT_SESSION (missing DRM_ prefix)
> - Remove undefined %DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP
> - &DRM_XE_OBSERVATION -> &DRM_IOCTL_XE_OBSERVATION
> - id's/struct's -> IDs/structs (fix incorrect possessive forms)
> - drm_xe_query_oa_units -> drm_xe_oa_unit
> - DRM_IOCTL_XE_VM_QUERY_MEM_RANGES_ATTRS ->
>    DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS
> - DRM_IOCTL_XE_VM_QUERY_MEM_ATTRIBUTES ->
>    DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS
> - @sizeof_mem_ranges_attr -> @sizeof_mem_range_attr
> - @vector_of_vma_mem_attr -> @vector_of_mem_attr
>
> v3: id -> ID. (Xin)
>      split cross-reference fix to seperate patch.
>
> Assisted-by: GitHub Copilot:claude-opus-4.6
> Cc: Xin Wang <x.wang@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>   include/uapi/drm/xe_drm.h | 26 ++++++++++++--------------
>   1 file changed, 12 insertions(+), 14 deletions(-)
>
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 1d3406416d8c..ad8e3b69a3d7 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -349,7 +349,7 @@ struct drm_xe_mem_region {
>   	 * is smaller than @total_size then this is referred to as a
>   	 * small BAR system.
>   	 *
> -	 * On systems without small BAR (full BAR), the probed_size will
> +	 * On systems without small BAR (full BAR), the @cpu_visible_size will
>   	 * always equal the @total_size, since all of it will be CPU
>   	 * accessible.
>   	 *
> @@ -862,8 +862,7 @@ struct drm_xe_gem_create {
>   #define DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM	(1 << 2)
>   #define DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION		(1 << 3)
>   	/**
> -	 * @flags: Flags, currently a mask of memory instances of where BO can
> -	 * be placed
> +	 * @flags: Flags for the GEM object, see DRM_XE_GEM_CREATE_FLAG_*
>   	 */
>   	__u32 flags;
>   
> @@ -1366,7 +1365,7 @@ struct drm_xe_vm_get_property {
>    *    drm_xe_pxp_session_type. %DRM_XE_PXP_TYPE_NONE is the default behavior, so
>    *    there is no need to explicitly set that. When a queue of type
>    *    %DRM_XE_PXP_TYPE_HWDRM is created, the PXP default HWDRM session
> - *    (%XE_PXP_HWDRM_DEFAULT_SESSION) will be started, if it isn't already running.
> + *    (%DRM_XE_PXP_HWDRM_DEFAULT_SESSION) will be started, if it isn't already running.
>    *    The user is expected to query the PXP status via the query ioctl (see
>    *    %DRM_XE_DEVICE_QUERY_PXP_STATUS) and to wait for PXP to be ready before
>    *    attempting to create a queue with this property. When a queue is created
> @@ -1651,7 +1650,6 @@ struct drm_xe_exec {
>    *
>    * and the @flags can be:
>    *  - %DRM_XE_UFENCE_WAIT_FLAG_ABSTIME
> - *  - %DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP
>    *
>    * The @mask values can be for example:
>    *  - 0xffu for u8
> @@ -1741,7 +1739,7 @@ enum drm_xe_observation_op {
>   };
>   
>   /**
> - * struct drm_xe_observation_param - Input of &DRM_XE_OBSERVATION
> + * struct drm_xe_observation_param - Input of &DRM_IOCTL_XE_OBSERVATION
>    *
>    * The observation layer enables multiplexing observation streams of
>    * multiple types. The actual params for a particular stream operation are
> @@ -1902,10 +1900,10 @@ enum drm_xe_oa_format_type {
>   };
>   
>   /**
> - * enum drm_xe_oa_property_id - OA stream property id's
> + * enum drm_xe_oa_property_id - OA stream property IDs
>    *
>    * Stream params are specified as a chain of @drm_xe_ext_set_property
> - * struct's, with @property values from enum @drm_xe_oa_property_id and
> + * structs, with @property values from enum @drm_xe_oa_property_id and
>    * @drm_xe_user_extension base.name set to @DRM_XE_OA_EXTENSION_SET_PROPERTY.
>    * @param field in struct @drm_xe_observation_param points to the first
>    * @drm_xe_ext_set_property struct.
> @@ -1919,7 +1917,7 @@ enum drm_xe_oa_property_id {
>   	/**
>   	 * @DRM_XE_OA_PROPERTY_OA_UNIT_ID: ID of the OA unit on which to open
>   	 * the OA stream, see @oa_unit_id in 'struct
> -	 * drm_xe_query_oa_units'. Defaults to 0 if not provided.
> +	 * drm_xe_oa_unit'. Defaults to 0 if not provided.
>   	 */
>   	DRM_XE_OA_PROPERTY_OA_UNIT_ID = 1,
>   
> @@ -2369,10 +2367,10 @@ struct drm_xe_madvise {
>   };
>   
>   /**
> - * struct drm_xe_mem_range_attr - Output of &DRM_IOCTL_XE_VM_QUERY_MEM_RANGES_ATTRS
> + * struct drm_xe_mem_range_attr - Output of &DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS
>    *
>    * This structure is provided by userspace and filled by KMD in response to the
> - * DRM_IOCTL_XE_VM_QUERY_MEM_RANGES_ATTRS ioctl. It describes memory attributes of
> + * DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS ioctl. It describes memory attributes of
>    * memory ranges within a user specified address range in a VM.
>    *
>    * The structure includes information such as atomic access policy,
> @@ -2427,7 +2425,7 @@ struct drm_xe_mem_range_attr {
>   };
>   
>   /**
> - * struct drm_xe_vm_query_mem_range_attr - Input of &DRM_IOCTL_XE_VM_QUERY_MEM_ATTRIBUTES
> + * struct drm_xe_vm_query_mem_range_attr - Input of &DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS
>    *
>    * This structure is used to query memory attributes of memory regions
>    * within a user specified address range in a VM. It provides detailed
> @@ -2435,14 +2433,14 @@ struct drm_xe_mem_range_attr {
>    * page attribute table (PAT) index, and preferred memory location.
>    *
>    * Userspace first calls the ioctl with @num_mem_ranges = 0,
> - * @sizeof_mem_ranges_attr = 0 and @vector_of_vma_mem_attr = NULL to retrieve
> + * @sizeof_mem_range_attr = 0 and @vector_of_mem_attr = NULL to retrieve
>    * the number of memory regions and size of each memory range attribute.
>    * Then, it allocates a buffer of that size and calls the ioctl again to fill
>    * the buffer with memory range attributes.
>    *
>    * If second call fails with -ENOSPC, it means memory ranges changed between
>    * first call and now, retry IOCTL again with @num_mem_ranges = 0,
> - * @sizeof_mem_ranges_attr = 0 and @vector_of_vma_mem_attr = NULL followed by
> + * @sizeof_mem_range_attr = 0 and @vector_of_mem_attr = NULL followed by

Reviewed-by: Xin Wang <x.wang@intel.com>

>    * second ioctl call.
>    *
>    * Example:

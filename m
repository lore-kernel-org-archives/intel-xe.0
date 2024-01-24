Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB2D7C47258
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jan 2024 01:30:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67FA610F4F3;
	Wed, 24 Jan 2024 01:30:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9547B10F4F3
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jan 2024 01:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706059851; x=1737595851;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DrH41Cfmj0SK1l4G9VcoY1HZ+Q6dhwb4tpxAr8tfKcI=;
 b=NAVbNSsqZyftBYIf3eAWaHUZ7Z9UrpWW/z5gYlGcopJdef9bqabux+CS
 rnqeZFPbCXZQmFDQ5j06CRvGBdmIpVys30O7z9iabfnbyr69w7wM0gcAH
 bZRI/MneV1lo32/Unk8nAc9/uvsPg88dJpMMFr4hXpOzdW+t1spx9rADT
 a6UW0bIDFaxUSYXxfHaQNRYirKo1J8xlI8Ju6iPkOdMnvrILUUPtMx/gE
 LsGmooJvYoJiNyJbRAUFyoeIN8Yzjg9to0dImRUpPdT6untJwBHkZTf+P
 4xEbz8jLxt8vpogKUJgMtD5/uTycktjfA5giuE+EGQ3vy7vVmGxmGNH/6 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="607510"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="607510"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 17:30:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="1724561"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2024 17:30:50 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 17:30:48 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Jan 2024 17:30:48 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Jan 2024 17:30:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a2lLj+HTdbcY5Ba4cltiKzfBnfvjZMTjqNN9qqVxvVLCvsZdRazZjnRzcz2d+OgxKBGzUB5cTbn4j9EtcdR1zOxcDS5bdlVy5v9iuBAo0zg4XpnquJRcLCCszGuEi+q5VavicBcbllz2rElROx6BSE3J0kVMNxwVWYKE7OjhIUQfvbInce7O+fZJc9AwC4SKkdyjI6JXoKQ8a5M+ILHE3VjKtpuLhg3yimpAy8yhfxlEd731g4GLlW4Qx2TFPkYXA4eG8Us9+tVKPTn0ZSnVscPA3wOez/Ez4UScIrOlFLZqL/O3JLcB6SxjMhpwZ/LLP8qFI9ofMEa6tx5POzNfAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W5FsNnUXct3lKL5jl4ye3cTwBqaqyeqb9N1kxf8PAoA=;
 b=SdKOGtqWu2Tg2hgRAbcCqKY8gfi93EEcUpdS3DUaZIH+HAjaTeGPLLNM9fHDpsfGxz+YR3cQLaxI5HT3+vyoZ3e373PRwWpkC4fb1du2RZXxkN+uskDxugpk2L2IyZ5D6Q2gBm/APKxSEPQNADZIm3HVkETmu1WAHi2T1+f9iXddkLAZojd8Eik9iPLLfnxHvNIwprBhfVu9ILSFaXopDEOD3Nf1398leov8hufqAfVu0Dc3r5tEKFnhdkmazhCq55L6XwLUurljqzx33qmDZvlZcy6TtXSV8OGpOM9HNTprl/XK4mmM+S36FZudiZBY+AVahUSA1tNW8Lws6a+EcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by BL3PR11MB6483.namprd11.prod.outlook.com (2603:10b6:208:3be::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32; Wed, 24 Jan
 2024 01:30:46 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::83d:7cbc:ec45:cb9d]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::83d:7cbc:ec45:cb9d%7]) with mapi id 15.20.7202.034; Wed, 24 Jan 2024
 01:30:45 +0000
Message-ID: <a90caefb-46d0-43b0-8148-5182160bca08@intel.com>
Date: Tue, 23 Jan 2024 17:30:44 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Only allow 1 ufence per exec / bind IOCTL
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240123163422.1570227-1-matthew.brost@intel.com>
Content-Language: en-US
From: "Welty, Brian" <brian.welty@intel.com>
In-Reply-To: <20240123163422.1570227-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR05CA0036.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::49) To SN7PR11MB7705.namprd11.prod.outlook.com
 (2603:10b6:806:32f::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7705:EE_|BL3PR11MB6483:EE_
X-MS-Office365-Filtering-Correlation-Id: 51869f00-8e02-4319-4f5d-08dc1c7c1676
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OtwJpxxdms70eWbXVTZa34aDWTEudx/B2jPSnEnHpQcp8UEhG1cl4fgFAq5VYd8uKkwHcIqm0PX1Fgpg2va7yau/sF0jumh9b6HqIgUA1OxB0FHrDzhxovWpJnA5iAV8YyOBkDz+tNEGQEpjFZhh44TY59bNFtw2v9wCnUBvT2ETHyN4Qh3VJSw2bkksKubZUfDs208QcQqmp5iDlOctsmIOVP0Zjo0E5eeZgw97kQz5GR5gkZpPZD1l3QTOV45fVE7lXcV65dtxJW+ktADD+5rc8Icnx4yJl3z9jd9lKshXG9aJPs8R9JhJ3wCMGAitrappGZCGbCq4XCPBeHktjEtRBk2nvddNJnAoU5YLIDKtry5yzXtRal5/1m1hJQA5ykb3TyJhXvqjo5oPHoyvrNe8YDwOXVGtcg2PqOMoz0V8QmZ9RXcVa9Ib9wiNc7rcsGEJYZzTY2Y72UTofoyKzCvwEpj6qizcRff2/EN0PxV7TOxoYbJTYePurnA8Ap4jAgNe6EYBnboixk6cWNr50YNVFwtD2JK+AqufGzOy+h9Lj7z08TCnkMzGYYKDyifhJixsF25U8rAGfDh/of1QnPKMD+R76sS0w6a0+rb96aiGkMgUQdJ0k54fWV80mtkkXyp/tKMN40NxEH2O7hWDbPtVTO5j/icqXKoiuevk9UY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7705.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(39860400002)(136003)(366004)(396003)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(6506007)(53546011)(478600001)(107886003)(2616005)(6512007)(66476007)(316002)(8676002)(8936002)(38100700002)(82960400001)(66946007)(66556008)(4326008)(83380400001)(66574015)(86362001)(31686004)(26005)(31696002)(41300700001)(5660300002)(2906002)(36756003)(6486002)(45980500001)(43740500002)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDBnUkc0akVrRXllekE0dDltcFpUVUo0aGFoZXU5a3ByaDFJUkZ6ZUhxUFQ5?=
 =?utf-8?B?bHJOWlZvUlhDL2loT1F0UjhYQ3NNZjlac1lPZGV4cStpYzZJRU04QkFGTTJv?=
 =?utf-8?B?dUxCWWVtMkk3YU1QU0JibU5Vc0Z6S1ZOYkhOWnZJMTlDR0VjVTlkbmRVbWxJ?=
 =?utf-8?B?WGVkWWtCN2JVTHhQQVhHbFJVYlBIT05OZ0Niem1KbUlsOHM4MlBrYndSMG9J?=
 =?utf-8?B?TUllc0RzM3FjREVNaVpRT0wxZEpoN0tvV1BRQU5RSjVjaFVsZHcyUDloUjJs?=
 =?utf-8?B?ZHVhWjRtTk5CUVMxdmY5M2oyQndPclQ1TWpUVVhHQ0xRTnlqb2x4SEFxYlp4?=
 =?utf-8?B?aVZCTTgwcUIzaW41Zml6SWpYZEl2Zk9UNFN0Rjg4eFBuZmZNVjZBR0NYeXlm?=
 =?utf-8?B?U1Zpb1V4WXU2Y3pBaVhuVjY5TTFJbnhYZ21iRGJtbFZsTDRyaE9aVUNmaExl?=
 =?utf-8?B?dXh5MjczY2RFUWJWSUtNQVFhNEhvaTdJT3puV2ZVQmE3cmp1Nm9aVkxRbnBL?=
 =?utf-8?B?Z2d0TE45d3hPV2xoazdOSGlrQVAvUldVb2NSeFlzWUQ0UkRTMnhkT1JFd0lz?=
 =?utf-8?B?cWxwTm5oVEtNa2kvZlRCRzRHVk4wMnRnZHQ1V0xkU2R1dC9WT0FGaHQwbFlV?=
 =?utf-8?B?c3pyVlVKZjdudVk4dlliWXppU1BtZ1hOaktmd2JpM3VoSjZHMnJBaHNzYzZr?=
 =?utf-8?B?LzU1OVRDYVFnd3RTVzExR3czcXhRS0pCcFp0RTJmK3VoRDhQNjVUZU1wNDVu?=
 =?utf-8?B?eDFoc3I2ZUw0b2czUkpLYlhQRTUvRHFYSmdqcGdyTER0bGFVN09YbnJPZ3pq?=
 =?utf-8?B?bys3QURxOUF4elFRWVhKZVdoUFBTZE1hZlBZMXA0QXRqMUNnNGdlcEsvUDg0?=
 =?utf-8?B?bkQxZWF4SmtzWTJ6Tk1Cd3ZrVEg2N2dRaHZrN1lxQzg3ZjZtd2NtbTJ1ZFVE?=
 =?utf-8?B?dGZhVFlLVEo3TTlTZTd5eFlIay96S0RxQXJHUFIwa0NyWUdLZ083MEQrdHNl?=
 =?utf-8?B?TVg2Nlo2WEdselpmc0d6OENPTCtLS2FmbUlYelBIY3B0UFkvR0ZDT0hEK29s?=
 =?utf-8?B?MUIwTXdWYnU5aEdBRXorRVZ3Wk52cGZibHlXdjFlYVh2TXg3Y0d3VUlJVEJm?=
 =?utf-8?B?U2Q2T3Q3eDdsYlB0T2ZRVVROdDNMRTR4eWxDUHQ3WlFmdmpmakk4SGxrQUVO?=
 =?utf-8?B?M1F5dEVITEcvbHVpN1B6a2NocENNRFU4ajF6RXMrcUdpT2R0ZEtaRzRzMlF6?=
 =?utf-8?B?eGQwZHM0Ukg4eXlYcDQwNktuZVRzZmtQT1FSTlE0STRXc2lMajZmaGs4MHhu?=
 =?utf-8?B?cW1aOUdnbnBjd29CZFZsL2c4WHZlK3phRTc3dXNzMUh1NjVEemM0ZXVLMnFX?=
 =?utf-8?B?TTBDYmcvVlNxdzJYQ0ZlSWd3N2QxZU9Qa0dsQm14REtQTjBvQTlsNEZNSFpQ?=
 =?utf-8?B?Qm0yT2VwZjhNUllzUmhGRmRnZGFUOG81OCtRVUJ4U1dqOU9GVHEvSVF1RFRx?=
 =?utf-8?B?dzBmY2ZoWmFiUm5DRkdsUUIyU2tyZjRoSW9GVk1yUnplQ21UdW9raFU3eXIx?=
 =?utf-8?B?K21mVThLWUdJSXE4SW9BK3VVZFJCd0puVURkKzEySzNZd3QvOTVyZEN6Y1JZ?=
 =?utf-8?B?MkV2V3IvK3J1eEtjRE1IcWs3TlJtVzBmWUFPaGdQQUsrWEcrUFBmSGxQdGlx?=
 =?utf-8?B?TW1uUkpBMzBPbnhTL0hoTFl5cXRZQXBObjVPdUdja3NEVlBxYVJxTEdLcTlW?=
 =?utf-8?B?OTBtYUgvbWxLQVFFcEY1Q3BVTHFUeHAySUxobFFOdXNjbUIzRUk3WkZTNE14?=
 =?utf-8?B?VTMwUWdVMmV2Z0dxejhONlBYQ1o4RkpISlVLOXBkY29jVWV4VGl0dEZhWlJI?=
 =?utf-8?B?QUF4cTBtNW10WkJGeDVzZEptdkpBUXVkeEl6WEFsQ3I5RkkxbmphUzZ4K0xN?=
 =?utf-8?B?ZkpOR01NbUFFVmtWbTBFZUlsZkNpdFBnK1lDWHdKME5zZzZQMXpDNUFwV2k0?=
 =?utf-8?B?M3lBSTNVZ0h5aS9HNnpSOWFaejlOQnRnbVRuQTQyNjBVbW9SVU9oZmo1NWxO?=
 =?utf-8?B?aStvc08zZVpFUFVhU0U3QWlWaDBsK3cvaEgzMXI4YUhRaVlQdG45azZ4QXgz?=
 =?utf-8?Q?lVe4vD5wcOoLKO6fvr2vCuBKi?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 51869f00-8e02-4319-4f5d-08dc1c7c1676
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2024 01:30:45.9222 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P1gkxD+xlJML9RFmI8QQs1pubWxw6c2YKyG9YRFLMJBQ7TTahN8hJ8lMPfU//bVLkFxBbF7ynFgxW5ubSqq0zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6483
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
Cc: Mika Kahola <mika.kahola@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 1/23/2024 8:34 AM, Matthew Brost wrote:
> The way exec ufences are coded only 1 ufence per IOCTL will be signaled.
> It is possible to fix this but for current use cases 1 ufence per IOCTL
> is sufficient. Enforce a limit of 1 ufence per IOCTL (both exec and bind
> to be uniform).

Interesting.  Makes sense to me.

Reviewed-by: Brian Welty <brian.welty@intel.com>


> 
> Cc: Mika Kahola <mika.kahola@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_exec.c | 10 +++++++++-
>   drivers/gpu/drm/xe/xe_sync.h |  5 +++++
>   drivers/gpu/drm/xe/xe_vm.c   | 10 +++++++++-
>   3 files changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index 59fd9bb40c18..952496c6260d 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -150,7 +150,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   	u64 addresses[XE_HW_ENGINE_MAX_INSTANCE];
>   	struct drm_gpuvm_exec vm_exec = {.extra.fn = xe_exec_fn};
>   	struct drm_exec *exec = &vm_exec.exec;
> -	u32 i, num_syncs = 0;
> +	u32 i, num_syncs = 0, num_ufence = 0;
>   	struct xe_sched_job *job;
>   	struct dma_fence *rebind_fence;
>   	struct xe_vm *vm;
> @@ -196,6 +196,14 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   					   SYNC_PARSE_FLAG_LR_MODE : 0));
>   		if (err)
>   			goto err_syncs;
> +
> +		if (xe_sync_is_ufence(&syncs[i]))
> +			num_ufence++;
> +	}
> +
> +	if (XE_IOCTL_DBG(xe, num_ufence > 1)) {
> +		err = -EINVAL;
> +		goto err_syncs;
>   	}
>   
>   	if (xe_exec_queue_is_parallel(q)) {
> diff --git a/drivers/gpu/drm/xe/xe_sync.h b/drivers/gpu/drm/xe/xe_sync.h
> index d284afbe917c..f43cdcaca6c5 100644
> --- a/drivers/gpu/drm/xe/xe_sync.h
> +++ b/drivers/gpu/drm/xe/xe_sync.h
> @@ -33,4 +33,9 @@ struct dma_fence *
>   xe_sync_in_fence_get(struct xe_sync_entry *sync, int num_sync,
>   		     struct xe_exec_queue *q, struct xe_vm *vm);
>   
> +static inline bool xe_sync_is_ufence(struct xe_sync_entry *sync)
> +{
> +	return !!sync->ufence;
> +}
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index d096a8c00bd4..8576535c4b6a 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2851,7 +2851,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   	struct drm_gpuva_ops **ops = NULL;
>   	struct xe_vm *vm;
>   	struct xe_exec_queue *q = NULL;
> -	u32 num_syncs;
> +	u32 num_syncs, num_ufence = 0;
>   	struct xe_sync_entry *syncs = NULL;
>   	struct drm_xe_vm_bind_op *bind_ops;
>   	LIST_HEAD(ops_list);
> @@ -2988,6 +2988,14 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   					   SYNC_PARSE_FLAG_DISALLOW_USER_FENCE : 0));
>   		if (err)
>   			goto free_syncs;
> +
> +		if (xe_sync_is_ufence(&syncs[num_syncs]))
> +			num_ufence++;
> +	}
> +
> +	if (XE_IOCTL_DBG(xe, num_ufence > 1)) {
> +		err = -EINVAL;
> +		goto free_syncs;
>   	}
>   
>   	if (!args->num_binds) {

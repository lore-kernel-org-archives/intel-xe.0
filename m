Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF24C4707B
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jan 2024 21:52:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78D2110E00C;
	Tue,  9 Jan 2024 21:52:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F02AC10E00C
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jan 2024 21:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704837131; x=1736373131;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pXCRzgq0xDGHD7i52IpaJDeEWRm2mCKnoZoHH3B9RKs=;
 b=glgssUf3gJrXX5aIIIC0u7jy90Z6tSGKeU/IvghZ71uMTMZ0F+fkS+oj
 SAptgBrsZW+35eHALIrnwwakkQ7EJsRgP0HuHQQPMPCoCTeLXWLmZV9//
 +b74sZs+6hR0iPja2SyyICuSE9LCEGBWLhLdLkz2nVTFQnAai650QJjjo
 5tNk09S1m07RN1hpwugWNCAk30E17/iJUka+g+zE3fY2V6Badwa4u9RpW
 L5N6/oIMIBjAhCzJ/WrjGr9up/9Wx86/DPhZx6ln28F5mai6rEVOLWpjN
 O9Ve29Ot+kGCtBs7UG5fJ3jWMSqr8U150UuimX+oqS+hFTnn3T43yItH+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="11678261"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="11678261"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 13:52:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="731620639"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="731620639"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jan 2024 13:52:10 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Jan 2024 13:52:10 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Jan 2024 13:52:10 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Jan 2024 13:52:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RG42gXNv9ezQtmqGtTnh3LseyVTrJBv62JTvjnfalSOR4YZmYyGAZeg0lLWhym/t3dpJxvFnm/jbz8nIfzJVDKfgk25S0X6MibFrcu46pNZEAXOxeLINJ0qa7JFeGz+vHFrt4CcNVq/ngYCvCm0U6xPlJeyp87ZpAecfi2fqrurtnnf5rEAHI1MNavhhWyAns9X6vE/MGfnvfk/ZGBUlWJBgDzOCXkPk+q7LcoB8XnVI/dGCL/s73NGRK8kWhSwasXE3JUQNclPD3E66C/jMXQxw5gUL0zudQzwiyozkJIzHhKW/iHYoCIL1U2Hd/CEd/ny2tQcd+gT8wv3FoEfz/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=50d9Qs9oaMRSPvfp/vRAf4llaDXnPJahXy63Fx4pR+4=;
 b=gK8N43Hp4PoZ8vNVh2y0fx+7gx9dXbJVb0ha+u0nISlG7FegG1nQOiMsxpVsMp2I7dpreSJWj2zaZI9LRMwTOiZ2xZuTmpKoUTxfFNgzPNcltvEUeSyOOZtQz82t1jYeTd2n+AuPcERGhKCal0xg23HUptgH5RvI8RXU7yPA3a4sZvUqnT2p0GopPqQej4hAXMxUIfWarstLUfxV9yLnx43NCfNlH5E4jd2atP+IkxgYMB2N8s6A0rGiHdbipgAQnKnJS5uEyhwqvxvJdWm5YRNUtUfDJCM9Fl5XOkQA/jxkb8vln3fOf8x9WRDhLSRoygKS6Sv90X06aYj8ni/UyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by DM4PR11MB7181.namprd11.prod.outlook.com (2603:10b6:8:113::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.24; Tue, 9 Jan
 2024 21:52:08 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::c947:cbd4:3870:c36e]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::c947:cbd4:3870:c36e%7]) with mapi id 15.20.7159.020; Tue, 9 Jan 2024
 21:52:08 +0000
Message-ID: <5dde9f65-29c1-4d74-bf3b-83672546c969@intel.com>
Date: Tue, 9 Jan 2024 13:52:06 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/xe: Add build on bug to assert page fault queue
 works
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240109172838.1376015-1-matthew.brost@intel.com>
 <20240109172838.1376015-2-matthew.brost@intel.com>
Content-Language: en-US
From: "Welty, Brian" <brian.welty@intel.com>
In-Reply-To: <20240109172838.1376015-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0224.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::19) To SN7PR11MB7705.namprd11.prod.outlook.com
 (2603:10b6:806:32f::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7705:EE_|DM4PR11MB7181:EE_
X-MS-Office365-Filtering-Correlation-Id: a3a693f4-703b-4011-423d-08dc115d3a2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S9uMoRNtG5AaACncZTZO8lha173pKeJUC+LRccGHBXoGDyQO6/8moqCSmC3RIPB1RU1THwsmjaOZuhIko7eZz/fYLj5lJP3KCkHHKWKhERF+BRAjgGfNWs5kDqkrX6TPLJb/3Ng/63a3i0R37gtNiGOmVGdN0oFQ1YeR+1CCgXMoR8EYLGB78oomNhbOksSph3IIb659hSNi+pyCZAZe1y56BOcFstRa8d7coda6dlow6ThvOzL+IKLMLFuDkXFF5qWFyhkBmFsK5NvcVTc04Nre9AcaMo8BvDduN1fzqWGSYfAlrA+Fh2zanvp/gg64eE5DcE7JrTqtsUEKhJIvMcD+h5yo+4/fN0CiH4mzWn9ZZdhv3g3Xaxwv6mxxVjE7Czsqe0uf6T8aAJR5bVuSTMwZoMObKkYg0WBY6tSgRSgxi47qBBPNL/aIF1A+B4jC7PsndDi2KcaVd1r6sA0GPpgs0etEuYMiUskUOjQTaBIEQgwkQjwdNlJftOtTbP9POOJeC2KVMoE/XnREFLFCfHX1CLwJF7ylRY2BYiCfDd8nnaYvrjnk/VQZhzBAT+KTQ24AKPJBgNAJOhu/HkWm6jnh3QSAbBtQJ4WGIq27UGJnwOHowKuulKKVrsAxP/QvSXtcdb9pvno8r5zZhwRsRyl83n1+L48DTIuLHUQF+086eWu0wq9AwishcdXo2mrh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7705.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(376002)(136003)(366004)(39860400002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(31686004)(66946007)(41300700001)(36756003)(31696002)(82960400001)(86362001)(38100700002)(316002)(26005)(6512007)(2616005)(107886003)(53546011)(6486002)(478600001)(2906002)(66556008)(66476007)(6506007)(8936002)(8676002)(4326008)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emk1ZndXa09JYmorN3VLMm1jUnJRRFp4L2N5ZWpKUmJKeWxGTTBoYWxwUklw?=
 =?utf-8?B?c0EvcGJqK0REbkNKVGZIcWxxMkhrN2crYnhLcHdNb1h2TnFWd3g2aFVkMFBk?=
 =?utf-8?B?bFFqbEpoK1kxeGp6RUVhWmUzVEE0ZnRGVDVlK2pGdk9wZU9oYlZFNGU2ZGZV?=
 =?utf-8?B?L0cvQXJyMWtUYUhXUTF0bmV2R2NnQUN2R0NNTFUvbi8vaXdBdDR2MENiQ09x?=
 =?utf-8?B?RWpyNWYreUlFcWh4bXZPWmpQZWp2SWxyY214NUZWekRyckh5YmlMWlVUbkox?=
 =?utf-8?B?RHQ0Y3liUElXcHlWNVlkNUFRWUh1NXNINGFlVElzaDU0V0U0TnVEandTc0Vm?=
 =?utf-8?B?RkRvVTdzS09MZERNdDhsdnFWUlZHbUJiWG9jS3p4NmN0Sm9WVVlhU0tERTk3?=
 =?utf-8?B?OWdPbFdoT1NzSWtPd1pjdGJCcy81YUhJN1BOM1dXSUZYbXFkN1dSclJGaHln?=
 =?utf-8?B?VmxXL25EUFBEcmd1TXBiSyt6c0x6SmtJbDc3T1ZvUDlOeHcwZ3doQUtrS3c5?=
 =?utf-8?B?MTBUc3Y0WkRlUVAvV25oQnRpMFhQajBYRG0rMkoyMmFDTHNzRGdEMWVVRXRU?=
 =?utf-8?B?MlN2Mk91MU1BbEtSaW9wYkVMZzc4M2EwUzJYWFJWU054d1dkTC80ajhUVmVR?=
 =?utf-8?B?SlVqRzdRcERwWkhGbDJ1bzRWYnNSQml5VUlZUk1OckNuaGY3bzl4ZW5TaU5m?=
 =?utf-8?B?aXVFRkxybHVXWklqbE1FcGsvWmcrS0VZbUw2Z0s4MDRVaW43Z0ZkdkhJMm1N?=
 =?utf-8?B?QS83MWpLbktISTBxYnZ2MmJieUxZaWJHTFVIQUl0eFdTMkx1ckcxcjEyMzVM?=
 =?utf-8?B?UWw4eVo2RU5NazhEWmxtWG0zelhJMUw0aWlZNmlVbVQvNnJqSUZLVTkraHFU?=
 =?utf-8?B?TFZ3OUs3SkVYZk9VWnZWWGtabDI4aGNwUXc2Smp4M0Z5MmFobWIvSks2NWFE?=
 =?utf-8?B?c1c4SU51RXZ6ZHNIalAyeWJVM0xtMHpGWFExVHR3V1U2RjNMdzFSYlFOOTgw?=
 =?utf-8?B?VS9WQWc2Z3JnN2hKWkxZb3lLSittZHIvY2IzQ0hnVllyaEM1aExwMUJvbVZl?=
 =?utf-8?B?NzhHYjdZVHo5U1RCdkp6eTA3TisrUy95K1Awdm4rOUowSkJja1FvRTU3bnFN?=
 =?utf-8?B?R2V6YzF1Um9pQnYybEpuSDNzZXpqMk1kbFlSNStoM2U5REV5dnJHYlZiWFVX?=
 =?utf-8?B?U3dBSVd4VElDR2FROXNIREZPMGlBQU9uRENwbXFKYnRkR1EyT1RSM3dDbWp6?=
 =?utf-8?B?czYra0hTdUdkTWpKZkFjL3VZQkozaGhSdUZ5bVh0d2ZqSVFzeDdjRzlXcXJw?=
 =?utf-8?B?SlFPNWVsdUlNQmdlM1pFajJlcFV1RDMrWGdpZjBVYUJEbTJ2K2p1N0lFeitK?=
 =?utf-8?B?TmNCWTBYbGhkQitlYTBEVWV5bmNrc1E1VkZkVy9KM3I5TENUd2VUTkNpMUtz?=
 =?utf-8?B?MXZQTy83c3d5T1hpaWRJdit4U04zTmlGYWhhSFUyVUhKckptSnVNVjc5VE5E?=
 =?utf-8?B?N3YyMk91Sk9JM255VkpvOU1STEN1REpqYURSanByWVhwT1draXVwNTRuVzRW?=
 =?utf-8?B?YzZoWFdGSmlIck1xd2FTYzRtNFptc2JkejRETUsxbUoxZzlTUHpqUTRkWVha?=
 =?utf-8?B?c21wNUJWQWhOU3hWZjNadms2VFVYem1DT2x3cWxOQlF4N0J4a2t6czJ0dnZH?=
 =?utf-8?B?SExpTVFWZVRPbEQ0Q2RVc1VlZFloSFNjZjMwTDNCejNwck1IZUZKVnZ6YzFk?=
 =?utf-8?B?Z0ZDVHJnOHpVWU0wSlBuUzY5TUw2NktBQUp6ejR5Y0VvS3d2Qkp2LzFYa0Zu?=
 =?utf-8?B?d01xdVlhS0hKdjFzZ2U2RzFFVnBDR2FiSktVdUV2ZUgrWGxJTnM1S3hySzVS?=
 =?utf-8?B?Yy9EcEFUT0NSN0hOOXhvNmxNSDhYQzUxWFdEVVgvZEo0bVBGMW54NW14Y1Vn?=
 =?utf-8?B?czRGanZuOHlYZ0prQjREbWo0S0hsOXJ6WHVXeGtSNzBQTEd3Z1VVS0F1VHhS?=
 =?utf-8?B?TVd3NnRTNkxLTjhWczA0WUJWUUNGdlJrVWppbHJlK1dJdmlPeDNEaUp6L1pL?=
 =?utf-8?B?b2FrenhHTFcreXYzVVJwb2Z1Snk2dWRHaHFiTmFYZ0NGbWljaDh1ZzkyS0Ra?=
 =?utf-8?Q?F/BiEUdewVVT2uVY0iBTv4Blz?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a3a693f4-703b-4011-423d-08dc115d3a2a
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 21:52:08.6525 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DGgLDtaaterBXNm8/3bMDRmrasEAZiAsGro/NIlHYzYS6jlWUF7bjtU2B9/FsAkuS3xh652woSHpXxcv9BYu7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7181
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 1/9/2024 9:28 AM, Matthew Brost wrote:
> If NUM_PF_QUEUE % PF_MSG_LEN_DW != 0 then the page fault queue logic
> does not work when wrapping occurs. Add a build bug on to assert
> NUM_PF_QUEUE % PF_MSG_LEN_DW == 0 to enforce this restriction and
> document the code.

I'm a bit confused.   Number of queues is independent.

Don't you mean to test against size of queue in DWs?
So this for the check?
    BUILD_BUG_ON(PF_QUEUE_NUM_DW % PF_MSG_LEN_DW);


> 
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_pagefault.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 4489aadc7a52..16cea47d9e15 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -328,6 +328,11 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
>   	u32 asid;
>   	bool full;
>   
> +	/*
> +	 * The below logic doesn't work unless NUM_PF_QUEUE % PF_MSG_LEN_DW == 0
> +	 */
> +	BUILD_BUG_ON(NUM_PF_QUEUE % PF_MSG_LEN_DW);
> +
>   	if (unlikely(len != PF_MSG_LEN_DW))
>   		return -EPROTO;
>   

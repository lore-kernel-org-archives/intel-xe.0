Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DDD7C4707B
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jan 2024 01:05:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC7C810E9DD;
	Fri, 12 Jan 2024 01:05:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D854F10E9DD
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jan 2024 01:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705021514; x=1736557514;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AsrBx52sQXChIn9H/kyd0bu/2JB/l+D+tZEhrX3vO5A=;
 b=DPDi9n+wO2/qeklMKX+6+8xTyReKxg5pJnKI9kkKnskx6clna8zFR4hS
 B8R7xHNDr9lSZ+7G+cBER2fJS4vleus4vQfalQFyn2OUr1TylTA9JBhwK
 QIOyd7bJ1ScmkqOdi8axVltJJSK3A3NaAHMBPzXtNF8O+SwvwwGDg/knA
 789GdQ5aOS1SU5BvJJJy7u9g+ZoPRd621vRz2/Kplwhsui1aq1/9ExTmY
 P30Rm0jLNd7YNzry0IM96AdbhNPDzWUyRpe7fdRQDA05GlF+zM1s/ewHU
 nPo4DcqY9Fo2jVHuK5Lesjfk+GYvxwqWM0iJsxxzn9Cf0QYzSTSrzF2Vn Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="463332012"
X-IronPort-AV: E=Sophos;i="6.04,187,1695711600"; d="scan'208";a="463332012"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 17:05:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,187,1695711600"; d="scan'208";a="31210700"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jan 2024 17:05:15 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Jan 2024 17:05:14 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Jan 2024 17:05:12 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 11 Jan 2024 17:05:12 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 11 Jan 2024 17:05:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ACsL7hSbLnjBspSCiUI2LaQ8tzQSha1QChpQhhUVQ+Z0EDEBF5uF6GaKQGEtXtWiL4Q1XJFNyaqk03Oo+O7kyV8LKBJmoUX2Pqg0HIAyEKp2TUIi+TpeE+7K4Q0qObv3spiyJh62RV6cHOnjKzx/v6YK56vWHT6/8OaVUQ7AbYqCuuJIA0K3eOijh/GqlNM1R3l01PLXuopmbKboNeIcYFKFBFOAOMRk6VDVzabgNNMwvOiYajaDYglJxqm1YXqIC2NtdKwDJGAaoah5rSAAq3vArnnk+C8lMPJiyXd5YcwzrveJMrmlIadKj5RN2RRtHx9xsFgXpZ0JBSi4J0Vm+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Te8noE/rqvT6JFE4/TMgcAXbcS6ELZ81g8SgKecG3hE=;
 b=EbFZiivTzvuPYv1of9aWiYmJyjYeroK7jsLxtg2MGOXtcaHvvEnfYDrrW0RoD+g9tq8bS1d+jn9oYPwh10tOBIl9hXJNvNaGV0J/1mcitD06QQ+K8G4c+xUa+E0noMu/LPHPU3C9Mp4+zRPHYxXKW54HvLkrQUo2USbbXDSFteLccAb/cq7nCc0auwN3MQTHsycE4Y3JkSotRR2M/qLGahN+yWZUVzFluzJVtQLxZjloF2OsWkcbaC25WcavUfYuen/JjBDR+nOtYH6BEOdnCIhbsdd+qfAudR3dm1/05NCqHHGpDWitwolCX6AcMpduwg15FtKlG2PZi2eNubUwEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by CH3PR11MB7843.namprd11.prod.outlook.com (2603:10b6:610:124::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.25; Fri, 12 Jan
 2024 01:04:42 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::c947:cbd4:3870:c36e]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::c947:cbd4:3870:c36e%7]) with mapi id 15.20.7181.019; Fri, 12 Jan 2024
 01:04:42 +0000
Message-ID: <fcc548a2-e79e-4981-9e85-45425c6ea4b1@intel.com>
Date: Thu, 11 Jan 2024 17:04:40 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/xe/uapi: CLOS uapi support
Content-Language: en-US
To: Pallavi Mishra <pallavi.mishra@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240109235758.1432987-1-pallavi.mishra@intel.com>
 <20240109235758.1432987-2-pallavi.mishra@intel.com>
From: "Welty, Brian" <brian.welty@intel.com>
In-Reply-To: <20240109235758.1432987-2-pallavi.mishra@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0202.namprd05.prod.outlook.com
 (2603:10b6:a03:330::27) To SN7PR11MB7705.namprd11.prod.outlook.com
 (2603:10b6:806:32f::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7705:EE_|CH3PR11MB7843:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a1fe4de-27a0-4ef4-1f0e-08dc130a755f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pdLUB8CmJPsUvzsqLnC1ZEQ7E6QAj04bKvgJQZpPogCdMMKMvWDtp1WqwANGYFSIO3ndBIt42T6hAxjNWXvZ70fRg0TwEkFKkiOupdoKkLWhqk4abYFMqlIJ/cCYmhGt1F4xJt4qjSWq9J7CGkohFDTjIV4OujZFNeVhDpQGINtR8KyX/eLB0mhSptkrkNm+jsj8/8nmpkT2UrYrEHeO1UTDQNIBKMHO0XZizU35QmshliyRZ1ymLlN/p/5zJcFxqdGJa4OsrIQoSxh9dw/8v9O9cgeYvo4ZK5MIgaFHieZYWSCOABQwZiM3eonrtEbu/0yvRUcjEAlGaEpowyW98HnuDC44A4FUZAemTuNVBrdtbW7F7FAPgrERFHnxaSNgpPDj7wu2TPoQD3L5vGaV8Nbj/hGY9JXm5l8YPc1SWqhZXKQkLj4SNJBq9sLGAer/qS4FHhBflZTkRMxBf218RYjCCKKB5khaoyjQKU9zFrt6SwPdZSDWSJiRkOdJzgctxr3zZsu7OZ8s2+rY70yYdGCW1BpHGbAZ/TG67GbENf7eaA1cQYhSHSKMiXPkni5ORBeJypOQvt2YrsaICyeqS5YKSefWr74mdeeTSqHDruUae2rKH/333E478pzU8P5PO9Y+Pue8qV5DdKI27d6K7g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7705.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(376002)(39860400002)(396003)(346002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(66946007)(53546011)(2616005)(66476007)(6512007)(316002)(66556008)(6506007)(478600001)(6486002)(26005)(83380400001)(41300700001)(2906002)(5660300002)(8936002)(4326008)(8676002)(107886003)(38100700002)(36756003)(82960400001)(86362001)(31696002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWxESTEzZDNROUt3UjMzMTBGSzltNkdEcHlqTUtWTmRMQ2ExVHR5c1dybkZ0?=
 =?utf-8?B?UVoyTXFLRTdid3hXUStWei92K3RuOUF4KzF3TkpYcE5DdzkwKzErTFl0dzNl?=
 =?utf-8?B?RW1nMDNEMURQMUt5UUhyS2c5UUNEUEFJc1NGK0Jqckh5WjJxNHg4Z3BpRldh?=
 =?utf-8?B?V2pxR1JXYmVoODJYcmM5LzY0OHhKVDJielI5dUQ4Z0Q2YVBuWWtkTGoyNXdj?=
 =?utf-8?B?QXFLbGx6bzNpWVZPQURHbVJRVkQ0eUV2YzdVcHNSVHFSaDQxaHJOZnlTbEtU?=
 =?utf-8?B?UWZYcjVtWmtmY08rbWJKdDJJL0xPMDJrZkk2YWh5QmdIMnRhLzR5enhJZkNZ?=
 =?utf-8?B?dzJKa1kxQ1dSOVBCb2ppQ21qQ2t0WFFGZHZCSHp3eFRCTGpvZlMranpMOTZK?=
 =?utf-8?B?QnZLcUV2S2NHcFN3c0FwK3N1c0tNdVNlckJ1dFFVZzNJVy9WNkRlYXd4QnY3?=
 =?utf-8?B?TkUzckpwUnFZeFJ3Kzh2Q3dTWG9jZVBQb1NmTzF5aHdjYWJZOVpIR1ZJZ2kr?=
 =?utf-8?B?S1Q5cHgwOGViUVZPTWVDRUtxZm1mU2pRcTBxMjJSejJLclYzTXVIN2h4cXEw?=
 =?utf-8?B?SHZ1Y1RKOGJGT3dWR2RSMitiYm5Vd1ZOVnQxWmZ6SWVvZ0s4aDJDeFpROHhu?=
 =?utf-8?B?SDlCaUl4VERkYUhnNithZzB3OUxrall3Y1NzSlVIUDJRZzN6cmZlVWlhSmcy?=
 =?utf-8?B?RjNOQlpWYkRoVGZlajYxWVd3U0tzUGpWaTZKZzhzZFl2OTdVaEVhTFVFenFx?=
 =?utf-8?B?MlhQTDBSY0FMSEJiSTlkRGFING83NVowcVBUK0hUQ0FENEh0Y3Z1MTArZ1hn?=
 =?utf-8?B?YVNiNVlLWHM0WjhJT0ZrRnQ3SGZwY08weldUejFVZFpuSnRnbVJFamdtZGVk?=
 =?utf-8?B?Rm14c0ZLMnZLTk5oSE42a2V6NnNWRElXMCtrNnJoODlHdm5MQ1RGbXB2SCtM?=
 =?utf-8?B?aStoVGtpQ01oQm10dmJnblFOTEpWVDlQUG9leCtMMkFpU0tmdWhqaVpVV3Iy?=
 =?utf-8?B?ekE0L3ZVNWpQY0NlTDhEcC92T1pSQ0ZQdm94VUJOWXBmai9VbkRCWlArNVc2?=
 =?utf-8?B?ZHlGTUhWL1dvdFAxeVVlN3lqdGc0UjFQWlYwTFNVSzF1RWNjNldLbXV3aXp2?=
 =?utf-8?B?b1l3TDBkRnpNSmJzQm11czJKckFtRjZzbFVxeGs5REFpbWlBRHZFakdNckQ2?=
 =?utf-8?B?Z0kxcUFOVy9wdnloSUpSa3FxMGhHU1UyZmNrZElpcUxFblN6Rk9KT2t0UW9z?=
 =?utf-8?B?eTEwbnN0aFpuZlh0QzdidVJrTVVGQ21OSVYrNFZYM3c3bmh2SDZBd1hIQ2tP?=
 =?utf-8?B?c1B2RFNGQlE3MjYxbFNSdUIvLy9xWlhjbjBqOGt3dmZZam0zamlwLzJZa2dz?=
 =?utf-8?B?MEwraTk1RXhSNEl3b2JUM2xqWGtmK2JBa0R2dW5JTEJiaGlKcERzZGU1QWkw?=
 =?utf-8?B?UUFJbFkzOGFCbEZNTXFrSmM0ZVlhSWUvVTJ1K1RmNTlxeWw5bUQ4V2JKMk1J?=
 =?utf-8?B?TDNpVUh2NzZoRXR1OHZVMXA3ODh0RWphRzJhbGpZeThYNnlwUHNMS0dMNGNE?=
 =?utf-8?B?cnBxd0lTdjFVWFcvL3hrYWJtTFAzTzU1TE02bmFqSXMyVnAyNndLQmZPdW5y?=
 =?utf-8?B?a3JhaFllZ2VPMFFGWWVrMCtyYTNRNHpCOWVhTUZmKzE2WWxSdmZiVGsyc3lC?=
 =?utf-8?B?Qmg4aU1lb3JvYmY5QzVIZ1gyOXhqV1FZRG1LUG81eFNIL3c1N2Vzam4rR3VY?=
 =?utf-8?B?NFdWbTNjUllxeUh3SFFxMUF4cjRIeUR0a2U3Z0JTa2M0anhOUmhiSG1sWnZL?=
 =?utf-8?B?R3NWZUpqWjNBRHhpVGswby9LT1RGYmpYZEN5TWFrdGdlbHNsU05RTmhnMVl4?=
 =?utf-8?B?NHJGYWtXMHRnTmtRVGtXeTJMYjR2RDU1cURtYkxXT2Q3QjZSQk9JMmVMM05n?=
 =?utf-8?B?cG5tMWZ0cnUzSTZLVjFmUWJ3aytJeVVyYlgyMXdtR2oxSmdZeXJERDdHUnRq?=
 =?utf-8?B?NitUR0lZMkNxaEFMQ2UvU1g1cG52NVZoUGpVeGJzaXlCcFVLYzFBN1ZQdDFj?=
 =?utf-8?B?SXNyZjRYZHd2bVRNN2hGSHp2akdYOW1qeWRFWGduS0lMTmh2MWYvRjkwUjhx?=
 =?utf-8?Q?B350qfI7KIpntFsS6paS1qSo/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a1fe4de-27a0-4ef4-1f0e-08dc130a755f
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 01:04:42.0544 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i68xmzIFr/g4Nqc/xgMdcmiXZDrdXkBwtsG1EGb6fSyPtvYEQDugfOmlvmdAulaCGJ0EjXX9uFBCXpY00ApUhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7843
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



On 1/9/2024 3:57 PM, Pallavi Mishra wrote:
> Introduce Class of Service (CLOS) uapi. This allows
> Apps to reserve portions of the GPU Caches for
> exclusive use
I think make this the last patch in the series...
so advertise uapi last after the code is in place in KMD.


> 
> Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
> ---
>   include/uapi/drm/xe_drm.h | 71 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 71 insertions(+)
> 
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 50bbea0992d9..7d5656a55ddf 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -100,6 +100,10 @@ extern "C" {
>   #define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x08
>   #define DRM_XE_EXEC			0x09
>   #define DRM_XE_WAIT_USER_FENCE		0x0a
> +#define DRM_XE_CLOS_RESERVE		0x0b
> +#define DRM_XE_CLOS_FREE		0x0c
> +#define DRM_XE_CLOS_SET_WAYS		0x0d
> +
>   /* Must be kept compact -- no holes */
>   
>   #define DRM_IOCTL_XE_DEVICE_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEVICE_QUERY, struct drm_xe_device_query)
> @@ -113,6 +117,9 @@ extern "C" {
>   #define DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_GET_PROPERTY, struct drm_xe_exec_queue_get_property)
>   #define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
>   #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
> +#define DRM_IOCTL_XE_CLOS_RESERVE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_CLOS_RESERVE, struct drm_xe_clos_reserve)
> +#define DRM_IOCTL_XE_CLOS_FREE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_CLOS_FREE, struct drm_xe_clos_free)
> +#define DRM_IOCTL_XE_CLOS_SET_WAYS		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_CLOS_SET_WAYS, struct drm_xe_clos_set_ways)
>   
>   /**
>    * DOC: Xe IOCTL Extensions
> @@ -1339,6 +1346,70 @@ struct drm_xe_wait_user_fence {
>   	__u64 reserved[2];
>   };
>   
> +/**
> + * struct drm_xe_clos_reserve
> + *
> + * Allows clients to request reservation of one free CLOS, to use in subsequent
> + * Cache Reservations.
> + *
> + */
> +struct drm_xe_clos_reserve {
> +	/** @clos_index: clos index for reservation */
> +	__u16 clos_index;
> +
> +	/** @pad: MBZ */
> +	__u16 pad16;
> +};
> +
> +/**
> + * struct drm_xe_clos_free
> + *
> + * Free off a previously reserved CLOS set. Any corresponding Cache Reservations
> + * that are active for the CLOS are automatically dropped and returned to the
> + * Shared set.
> + *
> + * The clos_index indicates the CLOS set which is being released and must
> + * correspond to a CLOS index previously reserved.
> + *
> + */
> +struct drm_xe_clos_free {
> +	/** clos_index: free clos index */
> +	__u16 clos_index;
> +
> +	/** @pad: MBZ */
> +	__u16 pad16;
> +};
> +
> +/**
> + * struct drm_xe_clos_set_ways
> + *
> + * Allows clients to request, or release, reservation of one or more cache ways,
> + * within a previously reserved CLOS set.
> + *
> + * If num_ways = 0, KMD will drop any existing Reservation for the specified
> + * clos_index and cache_level. The requested clos_index and cache_level Waymasks
> + * will then track the Shared set once again.
> + *
> + * Otherwise, the requested number of Ways will be removed from the Shared set
> + * for the requested cache level, and assigned to the Cache and CLOS specified
> + * by cache_level/clos_index.
> + *
> + */
> +struct drm_xe_clos_set_ways {
> +	/** @clos_index: reserved clos index */
> +	__u16 clos_index;
> +
> +	/** @cache_level: level of cache  */
> +	__u16 cache_level; /* e.g. 3 for L3 */
> +
> +	/** @num_ways: cache ways */
> +	__u16 num_ways;
> +
> +	/** @pad: MBZ */
> +	__u16 pad16;
> +};
> +
> +
>   #if defined(__cplusplus)
>   }
>   #endif

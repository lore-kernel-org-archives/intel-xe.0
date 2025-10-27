Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 545BFCCF9EB
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 19:46:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12EEE10E09C;
	Mon, 27 Oct 2025 19:46:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a5iPeiFP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52ABD10E09C
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 19:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761594410; x=1793130410;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XQIDb6LLiKuWQLZq9Wr7VUtN/EfHJRXNvUraHH5yBwE=;
 b=a5iPeiFPwVjXwelU2q6wl8eH9lwMBtFy7n7RwqHbD1z3ZAEsLv7I2aJF
 bQrFuZup+ECUTLTQ0pJyxy5IMPHRHs8QdtJoUwXzSLjdb4bB983cZABpe
 elA5kl1E6OfnmPtwv12F/zimuszb/HU+AE2EMRczJZPPOv2srw3Dmg66o
 kkCc5eYUhZPh2HdZ6Hk2231E113LncpvJyCXW7Zpb/Sd1Kw94RbMfBz9l
 utLLOi7tiJ/g927lV0CnU5ZjW1lueqUbYd+rDbGjH9gX1Y5QV9HW6aEZJ
 2VOJvpPouo8P5eQvZVhS6Go6qYRVi+YQfGiLtgD4WMwF+vlda5OQ5xHup g==;
X-CSE-ConnectionGUID: PQk+sNtNRquUZAdYX7xSxw==
X-CSE-MsgGUID: Y16Mw7GrSsOK58R5mrlY1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74360993"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="74360993"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 12:46:50 -0700
X-CSE-ConnectionGUID: 7042KBrORi+hP3BN3isrFg==
X-CSE-MsgGUID: tA7sRdneRI+KSmunWTtt5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="185034579"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 12:46:49 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 12:46:49 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 12:46:49 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.69) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 12:46:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vgykjMxCQvM6Gc8ftCHQZC5HGx75oqJsWT90agvd2A8n2hGFi5UF5Go83yijXFuvts6vhi3v8qRnEBZdfTg+CJic1CTe5QIZcIqfFk2vEwHhlobxuReTyNTN0oC+L+OerLgOZKkQUrquqcP44gO7TS1vgs3O5fDEIMwEn67rFTUJRiPfn4N9TRToAVLlp0L4YCqtUTERDA0LUo6Ar981Iy2ZAJevPSp9ezmLbFWtx99un28eOuqYJEGd88bGNE1VBniHEUHwbtTWUQDOSqyoG7Bee8T/VhK9WSLjJ4F3q+B4ySwiV8SEq2m7S2yGDid34eBWtNaxjUblcIVFD5FJvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OqGqlYTMFzI4Mpb3WZ1Pl0ED/rWTh8H4Q/ehC76x5oE=;
 b=VA2UeW7qbRmx7GYdnf+Y+uB8YiKIHi5s8z8Fl+UrnVrb2ql3cnifnMHUaJ3KcNXeEXqaqEOBtXzKHaWfO6C8cb9zDT+WpQfn3vgDb36yOFKHOl3Ek5zWJB9iVg+RNw4oAp/oeNGcsB00Cz04raUg6ofS+OVCsAnRnYQf3oVda9YU+84C1x+XD8xmH0RHzJO5ZbupG0mqqYgglEV3SpOvzdBlH7sqTG+53hJ11bL0xdYepzPS3+lh3zV0Ow25tzIpq0actkuY4XR6Jn06uvL+QuKhuRr2UBqZTo+umFHeGoODqnd6fQKnZw2WVnCEDHhL5UA7tEsnYGUph+5fm4JdQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB9496.namprd11.prod.outlook.com (2603:10b6:208:5b3::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 19:46:47 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 19:46:47 +0000
Date: Mon, 27 Oct 2025 12:46:44 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <niranjana.vishwanathapura@intel.com>,
 <zhanjun.dong@intel.com>, <shuicheng.lin@intel.com>
Subject: Re: [PATCH 5/6] drm/xe: Correct migration VM teardown order
Message-ID: <aP/MJCGuf1/x2hrV@lstrano-desk.jf.intel.com>
References: <20251027180412.63743-1-stuart.summers@intel.com>
 <20251027180412.63743-6-stuart.summers@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251027180412.63743-6-stuart.summers@intel.com>
X-ClientProxiedBy: MW4PR04CA0287.namprd04.prod.outlook.com
 (2603:10b6:303:89::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB9496:EE_
X-MS-Office365-Filtering-Correlation-Id: 529a545a-f384-4009-8a55-08de15919069
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?crCOA04RU56I4SrPEFcbHOsQofuN3QTl3b5l7kCd215uqL39Bt9nCitS5/7y?=
 =?us-ascii?Q?ddh+8sj92MVKo/ttxK3vewsAz7YswuiRctOONtYjOmwp3wSWAKlJM+jNICD/?=
 =?us-ascii?Q?WzKmZc+I7e0pljbz3RyK2wZypwH0IthjUPr7NaBpUJTGA/ieXqEPeWDHcks9?=
 =?us-ascii?Q?8ChLHYQwKjUy8NXy5HcUfRe5YYN63UsPFi9Xh1/YFeYf2r0pUky6y74GmLGW?=
 =?us-ascii?Q?t7KIy+l+X22971GMbtNPOUUa/S8TRoc9hhBnm1bJLL+vGNjCEH27hEWi8zgR?=
 =?us-ascii?Q?DdbEP4x6ll6Q7selHKw8jOtTpLeEbLfbat7vbNbMZUCLt8ZUBim5gbEL2Lk+?=
 =?us-ascii?Q?XQZdq94qDYJ5nbvOLp5+gErfnB2zbE03qsaY3MBMEJ9QizyAIrdDEf7iHgjC?=
 =?us-ascii?Q?//rT+YAoFVPjiwSHpTMmZeWICLH8kk0FjG5YeSdEQmcQpbN19uj7UeCG50w5?=
 =?us-ascii?Q?n391YedoCg+qAFPMRp7S64Zi4JDq1vJu6VPS9FWkXWJArK4GbKL8rKCOwiak?=
 =?us-ascii?Q?lTkuVCleo0YJRa1tbeayAg3eOz3ENnprYdLxdlJN9zXDQ5q+wjj6HCEAs1dZ?=
 =?us-ascii?Q?xa9HN0ytCM9dCvrBW7spnOMV8kuHrqhhAmaN4iYOjsDp1ZIx5P5iHKBkfEY4?=
 =?us-ascii?Q?Pbm6QwgBhoOG36ZxWFW9DUpQM6QiHwtjRUbe8O86e/9XG7eS3wRX+cxnyNF7?=
 =?us-ascii?Q?CRJcZups50HDcc/JjuvDI6qklFJWvSmxN/ls0uQopmamtJwN+VApW5SGp36Y?=
 =?us-ascii?Q?wsrKjuLUeL0Cs+k7V3UgGxuH2dwDnmpogSQsong3jALv/3Ze+gI6dqAzK524?=
 =?us-ascii?Q?3wunm8B0RWCeEsv1dWTkB/O1IbUDJV97ASX8t61fl7v/vTNpwm7s6PL+Ci7k?=
 =?us-ascii?Q?iSq39oTOQ15BrWr4eCG8L6CDKyMAOm2jZof478mwVbfm95nvuRZYGeAZwMew?=
 =?us-ascii?Q?k68wbMXno44nA3YGJFAXeuYXBgsMEI39rM4wa2L78ty3zplA7yXWCaWwcuXl?=
 =?us-ascii?Q?wzAQixNKCvN03wlHhFd/w9DoWjzvQIlVjl65iK9LxDWHd2t7bTViY5HfoWoS?=
 =?us-ascii?Q?XfVFZ+ptTOGdiV7pQdT4Lmfnte0KPdQeTREy85ljEpLmx2z4vWPQJCrTs/9G?=
 =?us-ascii?Q?Bs7e940vS/zdqZvfSMpdCs7jwohPb6hcm8yp9NwcgYNmiIFXQ7j5b3nkpJ44?=
 =?us-ascii?Q?YoB6OP3UpHDJOoMLACetC7TSYkYEalFFOLf2nLfZjpUa80EY00j3RqZf/Icy?=
 =?us-ascii?Q?GmsOJ9wN34fu5LrErZXmnvoMdW4PFxW3D8rGcGRQFG0N3zAi76FtbtH9JJVm?=
 =?us-ascii?Q?HAdZJGq3x6sFGjKHyTz3kbPqLK8ANMDex2gsfXiyYJFiz3j8dJewOYhfmXtD?=
 =?us-ascii?Q?blQDHo9kO9ZAzVg42tf7/xDWw4QSLdOBLqavSJ0u7BqSy2T35gl5hRIhXPpb?=
 =?us-ascii?Q?JOlC7KDRcu6GllFWlI4LeBLJluqZXrWT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a0aOW81nt0LgcieMkxSLFnVFV/nPGoayL7FAzEKCMOBwXreGcTG6WFerZ4jI?=
 =?us-ascii?Q?u6h5qDRqMg25+/paam4/HUpK5TiJzTroO44WwgANz2zf1DbB/Hou62t47OgZ?=
 =?us-ascii?Q?TZ+b/Nu/m6ZjxK1+6kogI3+MzS/jK3NAs5XwpncY3Z341K4hPJw0niGg89+E?=
 =?us-ascii?Q?65fImJXYNoP0Q5nbcvddaPRh0aAO/HF6Zq78GwL7ozbFZy7iB0qby10/b9GS?=
 =?us-ascii?Q?J37cnt0VERZwo+nkXlamqKzV6HkbjwlQTnexxCZHTKKYDcqJM3x7ylDR4T19?=
 =?us-ascii?Q?Ft+TbVge+o7PLhritZPIKYepdST8B9ZU3RZ7cL/g7bI18FOVMuVDOTf1So5U?=
 =?us-ascii?Q?LMzOHrFt21OCGA8fiwUvlloOtZUtroJiu9Y3PfEjVtF/3DgHXKphzbHTewPO?=
 =?us-ascii?Q?OuAaA6KUCiVB1RAGmstHqb4bmjIJs3C3A9JpwX2L6lOk57DBYwnoHNCpGwKb?=
 =?us-ascii?Q?Q8dReCMQaTsa+NgwzML5gJYC8aywTLagbV01IfQnSOu7I6lgveujlw7lYlqU?=
 =?us-ascii?Q?Bz3C6ZvOIKXol6L290fUozUWNWEyTFdGw/VKUER5Hc3MD0qMUWAk1uDbb1N0?=
 =?us-ascii?Q?9ewt6nLAuC4jglV8v4XZ/zT3oBhA4mASONhf9ld6kbtB711z44Gtk2d0N74G?=
 =?us-ascii?Q?xYY47CjOK2Dl9vwOBFX2twmhZo76gxl21M+8hmXX2EuOzOUIjn7WRkDBbAM9?=
 =?us-ascii?Q?0nczbVPAmm7xQWWB5TNQoFDHSb3EOE4UJ3NIpFyM0qdJvYCF4FB6iT/45DOD?=
 =?us-ascii?Q?74b690UcwUDJR8I9DhZAPB/4koxduFab2qvmBRNq4xUvdS9AL4yt0fBB/yHL?=
 =?us-ascii?Q?A/JdYozX7fq/wKaAfuk8Fse+/QtpiPBkiZ80m+3FcDLnCZ6YmLS31iiyuGN/?=
 =?us-ascii?Q?DB/IN5T5h7dVbmCFo8BWm7SffHirZXiMRyDHh091tkBE2tK+URFCtNJRO4bu?=
 =?us-ascii?Q?ViBj88pS6K7rCfVMzbDTWDzbxQAdRGXsz616ZEs5s0W+4bG0MdE1y20S79Df?=
 =?us-ascii?Q?NFe60htjSr3gumbUlFBUD9mJ8DMDeQ9zxt7lr5RdK9yt03NFvazywIR/Fr8s?=
 =?us-ascii?Q?NIZEz0PuZIzHSRmb907FpDBxR1+Yhtb9BW4uwsiZqOIhQC7csHW2R/SkZFqr?=
 =?us-ascii?Q?McAf8sE6ctQWXl84QCgxGTZWRc0XRt+sFTxlimV88eolBuhjiN/hcvFXuFrz?=
 =?us-ascii?Q?sYc8MER8+WjA8SJWlz9f6cr8kvQIMFZclaZ0Dgyp6mmM6B2FbWl6NcEojfMr?=
 =?us-ascii?Q?OwpxTMlvK7YW0gZ8YpeWSeKNRxRw4f3vghI3DsRQ+f7VXuHe3Oha7vIpaSQt?=
 =?us-ascii?Q?KJYNTqP/r77fY5R9VAk0i6qhqV77rmfaEm/qEXwEJq+IskxWAtzmc9yyi8oj?=
 =?us-ascii?Q?PhxMkxQ0Y74iQlD3yYmtyGGFWQ0w0Js/GlxPu5DeV+ZawOPlpmOiAdswdWLR?=
 =?us-ascii?Q?Ly+jCiH48gIlB5OBxmC4WfXGmvOcMn0SwTy87TkIu+QyAfFRJxu+BQKYmW/W?=
 =?us-ascii?Q?0U9Qr+4V9xN4+0E38F039ABuLaVYxECYcDmepx49sia82OapJm7vKNOTiur5?=
 =?us-ascii?Q?J1z8lmZ7fJ5xLwy6omkoHyzm1gfprC1sruh6KcYX/j3/j1mtGXyE2uxvrFIv?=
 =?us-ascii?Q?Bg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 529a545a-f384-4009-8a55-08de15919069
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 19:46:47.2758 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bwg68pBkFLGOShKK8ePcLUVeeiG8Z3niCURrII1EvDCGxGA74ftzyY6CBqQcOa26HuX57Lh2hBXrYygYEIxF/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB9496
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

On Mon, Oct 27, 2025 at 06:04:11PM +0000, Stuart Summers wrote:
> Adjust the sequence of the migration teardown to match what
> is happening in the init() function.
> 
> v2: Take a reference to the migrate queue before put (Matt)
> 
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 56a5804726e9..9d60bc2b57e4 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -98,17 +98,18 @@ struct xe_migrate {
>  static void xe_migrate_fini(void *arg)
>  {
>  	struct xe_migrate *m = arg;
> +	struct xe_vm *vm = m->q->vm;
>  
> -	xe_vm_lock(m->q->vm, false);
> +	xe_vm_lock(vm, false);
>  	xe_bo_unpin(m->pt_bo);
> -	xe_vm_unlock(m->q->vm);
> +	xe_vm_unlock(vm);
>  
>  	dma_fence_put(m->fence);
>  	xe_bo_put(m->pt_bo);
>  	drm_suballoc_manager_fini(&m->vm_update_sa);
>  	mutex_destroy(&m->job_mutex);
> -	xe_vm_close_and_put(m->q->vm);
>  	xe_exec_queue_put(m->q);
> +	xe_vm_close_and_put(vm);
>  }
>  
>  static u64 xe_migrate_vm_addr(u64 slot, u32 level)
> -- 
> 2.34.1
> 

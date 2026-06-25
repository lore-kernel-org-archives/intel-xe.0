Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B9A7CDE009
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jun 2026 19:41:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F57610E270;
	Thu, 25 Jun 2026 19:41:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l/A7eubP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 166EC10E270
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jun 2026 19:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782416476; x=1813952476;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=yKWnxReCT3PJoJXbOnYogNxlxgl4HFh30nwK7AfZGA0=;
 b=l/A7eubP3RuQGH/CVjBJ8ux6ukxnE7ilzBE1WebB+udulHaAJ9RQQsPH
 QOysAVnirlISlDZ2qhbjwObrPyVWslqXJfC5BnAYt2E0q+gYrf7dXamaf
 VvQrticXhEg834oUaySFifLeXH+Ex18B1+kR8C04qTPMRhDaSfQ8mg6Av
 ICsXH4EAen9ce/4s4lx2ont1WMIRSq9mLUbmy/PqcAif/CBBqlhaGdi1w
 kyS95TCmUlMH7kgS8xfar+vlalCSwjMlrVRgdyT1yd63lXCjxWjaYGfQq
 NhPL7HZl5mvS/41yBHY3ZDuqTX5XgF/1+nBJFpLYQjegOZvwnHGQXqgI4 Q==;
X-CSE-ConnectionGUID: SCVDaz4KTyuXquDKkQVfCA==
X-CSE-MsgGUID: xL5wCoFAQi2SHQVo6l5P7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="82325982"
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; d="scan'208";a="82325982"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 12:41:15 -0700
X-CSE-ConnectionGUID: OtCg1LpjRZWrilspaIUtjg==
X-CSE-MsgGUID: y2l4b+3HRfKJaZigTbaWbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; d="scan'208";a="250575649"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 12:41:15 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 12:41:14 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 25 Jun 2026 12:41:14 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.57) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 12:41:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j1jp1TO/KpbaMPZ7vgxuzVEN8QLvExq0l0qI+gju9Q1FCPY4wNK+u0wzAr0o0QJn6ss19aXZaVVuZbyFLqNG9Zbda419xIH5pjuedAFPHf1cvKt18osrE0eOFwcr6WPQoGAQ4Lb0l11tmDxEnaaEtNEvM8mvlCqng2zLPitto0LIG6xKlFFA0qGR9w0HrpXZPMuPX3Sot8A0bcCkhK3sxmPQ8Ftb3GhRoOHzN2BVwW28Rw9M6YCyYOaMuUChEQqY0e/+w6168RLqgjdkUKGOPNgXY7i0F0EospkT+8kB2g+KbYn3fqXAOVXnfVok/RHjFhLPtUp9RtoKOCZ6l6PPgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B+Ylg3yrzH06VcSlp/CgcxTLYfxCW8BReWwPpehBaYk=;
 b=HM/QvivoTnRD3EPEEkcCHlaThTNMbnHBblMYC+3OSwH1FiySWrXchmyC0ed1IUNUVo+VQuQQhG+dOr+5vGksZvuyS7vp+pNMBTnzNJ9sJgYsoqL59TIlagS7MFZctRiokyUvNKbq9D5ZiMbt//XW+WM0DYIfCP8EKKzFPa6pkWYsiop9kChJH/lbdNZvcoVs/urZ3Zy9F5x36jFtnVjNJ3ImP43eE8Ef8R1zQJ5HzqqabPcodOZeApdrpg3kOmBXlcW7cjL9SqbKqT7aPiamO3RTGezhNyYsvNtPcofgXZmguOi3YZPE1j+d3/XvbwUwRhTKPRwA6uxhvupkSKESPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN4PR11MB9967.namprd11.prod.outlook.com (2603:10b6:806:4fe::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Thu, 25 Jun
 2026 19:41:13 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0159.014; Thu, 25 Jun 2026
 19:41:13 +0000
Date: Thu, 25 Jun 2026 12:41:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Arvind Yadav <arvind.yadav@intel.com>
Subject: Re: [PATCH 2/3] drm/xe: account for dontneed in fdinfo purgeable
Message-ID: <aj2EVqUeTgDGkx4n@gsse-cloud1.jf.intel.com>
References: <20260625152054.450125-5-matthew.auld@intel.com>
 <20260625152054.450125-7-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260625152054.450125-7-matthew.auld@intel.com>
X-ClientProxiedBy: SJ0PR03CA0364.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN4PR11MB9967:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fd580ef-1ae6-40e1-fa58-08ded2f1b6e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: YcYxXQcW+rO5X8fYAB3XP02002EwazJ7l/HXpRW7zAZ2ZaaG2fBDFDsF2OUnTH6Xh0lpDZkpMIv9HXlCDZqpJEg20Tw2/aBBH3ezQ3gbwO3IfCRpDmmGMPRX2Z//W1Hew4lowN9VYUnrYlVxcebZU2Iyg+9uvd+tvk2fXv+uSbSlKQDiEFB2OlC3DhKmMti/BNG2QbrO9bXtYl48wtSq1XBG3iCbIwf3Js9RfRcPFnJBCs/20Xpl2tFP6sNjTNog+bUNI8VLy8x+YayC7aYbnVJ1eyhYQQKC0Ln7NHnQO/3BD0fC5fSJX1Y5EAuB7T/lmAn6aN9/Mb2NkPL16fcvFOI/xNym7kmt8Df+foFC4dmQ/Bn0QUvXWWtksLdRhMmdDmHdxrKjGSTQXCx21g9uRglZAQLtmc1vYJ/Po5SVBot1fTDjiyRHM0A8HrBzZLC5nvhSy9gXyMkfHDJ8IeiTLv2zPmRj/QXYI2wDsVUHRG17pooTsPiM51aJov6V1X3GnUABzoCc3D8gJQaWHLzYe+15OLkrA4sigdSQLG0cRt0oZiM1afqtQGkVq7kPsplrN0apV6A5vyH414gqMJWS5nGBLFx/wNXDCWv8bR+ocrhJsCi91lrDSn1I5uuhnq43/r2M8cmU3xCRZr3ZoNAea7i0LuwtNU0pvY4s35u51rg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?DykWE2MC+KMw+8Es3yBs4NF0vVV8wqgMbHXksTMDz8KgJqmug1z3Pg8KAN?=
 =?iso-8859-1?Q?Y1EhfFUjPjSc08GtG50l9RNpE8WK+yiZRGq7ohPy6p+lYNGANT792O+anX?=
 =?iso-8859-1?Q?dNQuPEeRcnhR7gxWNaufrMk0ax4QWs49z64BrjzH79rXd8PaoNXpiAZy2i?=
 =?iso-8859-1?Q?c+327Kb8G2/uV2mxVC3R6rcKMAosqsppmZ63pq92gClkOFLvXxz+m540iI?=
 =?iso-8859-1?Q?DPnDcZCMi47t+zEZsvedthGkKw3ROvpUXczAi7O0jVxLQlWBNjz4h565dy?=
 =?iso-8859-1?Q?Y6Csds3p3uN85HlqZKAwJ0o1YQ4pFc/OR8H+P3MqXiSPbFYRlm4XCwsmtT?=
 =?iso-8859-1?Q?pj+jqxrV37xyjuTqeR95Y8Sxoy3nknmYHWcFf5HI3KGffw3ThkqKwaew0w?=
 =?iso-8859-1?Q?LOIHprTgvHb09GjfnW2ObzeRsEMyKX/siDjfzfmA2C6pRq+CVt/Fc096DP?=
 =?iso-8859-1?Q?5ZzHF9ymPEly4RVPtFGd1JmkYQBK2lmyc9nZUijhtYoA6kZzNzYigxC0qA?=
 =?iso-8859-1?Q?2hfWZoiS5w4V3xrx3oG5wpz1UDG4ajG7W/yJfI8cSEGMh9I+cCvglwkhnY?=
 =?iso-8859-1?Q?ePY7AxgdkkGYo3v/QTuxUDIA6BcWpZsupMR0R09FUHPT0HdKa2AtTB1NYc?=
 =?iso-8859-1?Q?n2QLDaSIQ5X1UDBdlXQKL/QrbKQ/u1m6Yo70EwzGAweCN3bDdDRpyVCOcf?=
 =?iso-8859-1?Q?c+1vJjGytK6q928jsT3cUiJrjPcgQfhazHm9AnW5cGytyaNiKG17JJX47m?=
 =?iso-8859-1?Q?WltTxe/h9CMQBcD2TRYq1/2ko/SoRJZCkyZ0rDITH8a8Aw9NtGshCCDQnV?=
 =?iso-8859-1?Q?NVBZ1dhghhI73Zm//ubjuN/VkDLeKxtMix4mR4vglzxu6y44md8xCmTHyQ?=
 =?iso-8859-1?Q?1u1BrfMFdx6P4PQlp+Mc93cndb8P0mjhH1w2hujz9n1tFDdqbXRYHlfCTh?=
 =?iso-8859-1?Q?OYht1lhyIAuiO1SLBXIOogG7Kom0zVVJvj+vxPf7ElrhHtYTzrSAMGatWi?=
 =?iso-8859-1?Q?hvzNxQgCpTJAvyYK3KztCR6GJBfvByCQYkvgsWvEjwi+HljCN8JQAIoIDK?=
 =?iso-8859-1?Q?t0Bre/156AQCkvR+2YILjtwuBjrhRbzSI/bmNMWIBqW0/HC/o9ZPwESDDx?=
 =?iso-8859-1?Q?rOqkvx5SvYZq1rh7Y2ocHU73kuvJmvH857tneRcgCYr7yDew9gSSH9nJSe?=
 =?iso-8859-1?Q?quWbYh348LmCJ8Fi9saHiNKKu27+DV+EDI1hbCeCkl7pN8V7wxxnqHUzHS?=
 =?iso-8859-1?Q?GjlY1BFK9Iv2hv6YCcPvXUncPPlf/tjIVWMVpYf7xOy3TDCvCkj06P5MvS?=
 =?iso-8859-1?Q?XeZz8Hi731rhsibwea/TGfzDO6AAzzqDNSho+nI8EwsUodQdtL2JN8Baac?=
 =?iso-8859-1?Q?+XAs7nXLIOXj4m8YZzSyUbMNS//hEhLqMCC2AOwMKmf3JuCp8NbaorKPhl?=
 =?iso-8859-1?Q?ectpu2bTFJ8EWvftsL+VBXKeBWWaMk70vD3KziD+XspW6sZLGDj4Czq+jg?=
 =?iso-8859-1?Q?5Cuqgik1QQwOiP8np5QHwsCKLulW+3L+kmtKzJtQ1eko+BRONX8ycYgJrF?=
 =?iso-8859-1?Q?zepit8C/kQ6R4eWdTeEHtdZlBfIHyuFjLa5PdOJF7BUMkDbwbj/zlO+EWV?=
 =?iso-8859-1?Q?djHHeFwlgHPek8BptXrZ3yaZLLa60tUlnpuTPFM8f9/+wF13/FRBmiWUUk?=
 =?iso-8859-1?Q?WM7tWqvqjtxYsRp+9DS13HsCzFqlD+5VvlYtF+XtDkPAHDNMBKfPCkod1F?=
 =?iso-8859-1?Q?RoMeJexXA3rTUPF+gh90TER6QwEcceSdiNk182Br7Bn4RjxWI++qHNIVzZ?=
 =?iso-8859-1?Q?G7gUGU8/TQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: HWF0SAVyI400JBdaUnb22CmTTEfggWKkwu20ZCUuS51mQvrtlmRownL9DHzjHa+kSKWXbB7ytdwKBZq2IIzHBvu9MHTuSFGqPkzISR3ip/U7mrm/Kz6ilgvM9uALa+Vt5Lr7WtVNSV6JwcCynZq36EsRZYaLfiddboMQLq627opFQkSvKwY1L5G7l5BxGZEOumB8IXIQXa1sH1PnFfb+bJ2QTRm5TcEctBNm2VYlA/uisxKvnxJ9JTc2bP7G2w4YgmAKMME+QBw1KcMWTO6Oe9ZeIPr9JG4Jc+9xuLHRl/bf7Bxg+odYVyDy6HBviJRxCP+14Ga7QKkByX0NMrC7bA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fd580ef-1ae6-40e1-fa58-08ded2f1b6e5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 19:41:13.2070 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OId8QyT0h9CMcC8N9ySUgx6thFwWg/j+Z0PrEdkSPGqKGsvHbqKEy8yCEYqosu/rRAHR7aMqe0zP7tDN+7e8LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR11MB9967
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

On Thu, Jun 25, 2026 at 04:20:57PM +0100, Matthew Auld wrote:
> Now that Xe supports explicit madvise WILLNEED/DONTNEED states,
> userspace can mark memory in any placement as eligible for purging.
> Update bo_meminfo to also include any BO explicitly marked as DONTNEED
> in the purgeable statistics, ensuring fdinfo accurately reflects all
> memory offered up for reclamation.
> 
> v2 (Sashiko):
>   - Also update the drm_print_memory_stats() so we don't mask out !=
>     SYSTEM
> 
> Assisted-by: Copilot:gemini-3.1-pro-preview
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Arvind Yadav <arvind.yadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_drm_client.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
> index 81020b4b344e..e116fb562c4c 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.c
> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> @@ -193,7 +193,7 @@ static void bo_meminfo(struct xe_bo *bo,
>  		if (!dma_resv_test_signaled(bo->ttm.base.resv,
>  					    DMA_RESV_USAGE_BOOKKEEP))
>  			stats[mem_type].active += sz;
> -		else if (mem_type == XE_PL_SYSTEM)
> +		else if (mem_type == XE_PL_SYSTEM || xe_bo_madv_is_dontneed(bo))
>  			stats[mem_type].purgeable += sz;
>  	}
>  }
> @@ -273,8 +273,7 @@ static void show_meminfo(struct drm_printer *p, struct drm_file *file)
>  					       &stats[mem_type],
>  					       DRM_GEM_OBJECT_ACTIVE |
>  					       DRM_GEM_OBJECT_RESIDENT |
> -					       (mem_type != XE_PL_SYSTEM ? 0 :
> -					       DRM_GEM_OBJECT_PURGEABLE),
> +					       DRM_GEM_OBJECT_PURGEABLE,
>  					       xe_mem_type_to_name[mem_type]);
>  		}
>  	}
> -- 
> 2.54.0
> 

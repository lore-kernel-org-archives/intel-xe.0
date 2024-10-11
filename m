Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD94ACFD36B
	for <intel-xe@archiver.kernel.org>; Fri, 11 Oct 2024 12:06:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 590BE10EAD5;
	Fri, 11 Oct 2024 12:06:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QVU2R1bF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 731CB10EAD5
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Oct 2024 12:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728648386; x=1760184386;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rr9Fve517x0RcIglbvU3mKfqa+9HmNO02lYA2PfGdPE=;
 b=QVU2R1bF4edDBIe4G872I7WyBV7cd5OzXUBstZY8y5tLwlJ0WmR7KG7+
 GShEIIrBCvnlmc5I6bdyNIR9d5DiO41b5N6ZJPk5mK+J+2ow1Xiz99lro
 vgtfdT8PnIpKIBJSqzpXhcYGjCb0PzQx4PtfoyjPyI7NiNYSM4y/8S4M8
 u+kxS4cxf7ZzxDmItFzYAwLUBDUeJf7mQczreyry4IoBmcurlhBVv9dEb
 wVvl1dX99ElhSRgQIxNet6VwMkNXELovjvxmKGl1My6RlsXDqErP8axyR
 kX88bVeEUxe+uMNyD9ho7fYSOX5AIBxYx0PTyjvgc2U+rrxLasThTFvZq w==;
X-CSE-ConnectionGUID: 4xExGVh6SDWsC52h4h2PDg==
X-CSE-MsgGUID: 4ek8enUkS+CdN0BZnD+B6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="38614394"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="38614394"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 05:06:26 -0700
X-CSE-ConnectionGUID: TMX5aiGVSrGZjyGXsXkPOQ==
X-CSE-MsgGUID: BLg0UnPJRC+1lExFm4Cr6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="77197410"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Oct 2024 05:06:26 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 11 Oct 2024 05:06:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 11 Oct 2024 05:06:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 11 Oct 2024 05:06:25 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 11 Oct 2024 05:06:25 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 11 Oct 2024 05:06:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NWbVmLIGRMWUbYhcJQLQFYBYRBTVH1a6UELhWmbGsCUbfHM1gbihXG1PRDZN9ZI4g0/3J1XaRnf6f7WicqfyBw6e6VReagfHgQ3/3aMS5BJVAzEFby/57JwbtLPShzxIN+/1D8nF6wM0e7Hreb8f9pzyO+8c3txpfgSm/Og5MUSM/iLWhypxuhyFBlXaTfxp5IX2jvi/uqeMCm9GwpH94XFcqtZGoHbFftk1kIUG3NoDXKMnLn7MHqpRk9CtvR2O3RYgcIpqqm32VQGyjFdvyZRQ/3kEJXhA84m0nU+OTTirJ4f6c5DhYaLvDLAv1zHojfzOOUPn51Y/jEC/ZUtkQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NQ1dzAeTHMkp6I1OQQu3ddA1o2B+j5GPWetR+lpmliQ=;
 b=J1ySQvP9ST46b25OUlN4F5kUe/lQW/YzrS9ujj8ZHpr32UVV6i/vQz5cosIm9e6haKtatBdFwV6DrYBwDmi6NR91NUhiSCU/B3t256OMIqnkE0tWHO387vvEiI0u3BHJCkqrZOV6xrnYLOR4G35cd5MpUQtlA0vOyq9AGZRbXPf9NBi4UicTB823vhAHkJlm9OLFVTCL/ub1aCvPWtHD7xx14/3Nx3YJVZMP5PfEBcOc7CiDifUrm/2lG61wDZclX2EyC0TZyQIZPWPu3y1yjPYmn9LnaHMI76OG53oWRB3ekGiNk+sMtwpcFQrHZzuqFuuUUKA1HQog+IzPO/axrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL3PR11MB6388.namprd11.prod.outlook.com (2603:10b6:208:3b8::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Fri, 11 Oct
 2024 12:06:21 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8048.017; Fri, 11 Oct 2024
 12:06:20 +0000
Date: Fri, 11 Oct 2024 07:06:18 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v4 1/6] drm/xe: Use xe_ggtt_map_bo_unlocked for resume
Message-ID: <v2le34deli5elidl3hazaye7mrjhbdviouq2jq4ysx6ozv7hz5@plvub3idhafe>
References: <20241009125114.412624-1-maarten.lankhorst@linux.intel.com>
 <20241009125114.412624-2-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20241009125114.412624-2-maarten.lankhorst@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0328.namprd04.prod.outlook.com
 (2603:10b6:303:82::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL3PR11MB6388:EE_
X-MS-Office365-Filtering-Correlation-Id: e9653728-7f7a-4bb9-ce68-08dce9ed1e7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WVKmjgOn7KfUc+aPA4176HbnyVR93+SHuza1NZd5NTunmb4m41H5foWOG1b+?=
 =?us-ascii?Q?PagULQZO8t95AP+zJrYwBEEZ0NNDrlA1bJShWD9Fp55CTU2XugU6Vvg6m+dl?=
 =?us-ascii?Q?j5p8Y5kzNKFpHStckFiN8FBYaZ3Atrt6b6GkWTr9HwlcBo1W2ITRQH6s11ns?=
 =?us-ascii?Q?yS0nuiND9TPS0FD5MAcAZMcQ2bnIRcLEBm2a1LK+73kGUJDlfwyzL3VjD/Kv?=
 =?us-ascii?Q?po/AkymRyngTfwJ4UTijrmN3YSAZL/ZzOK7efHnKBaCcJRC6gp63BhB/tbA4?=
 =?us-ascii?Q?dL4RPbT5M8Au345qQ4rtoCgStFYLV9I+PvZ1F9/8oXgfxufbALh/2aUY2N5t?=
 =?us-ascii?Q?DCvblpFHLOg5tVbQfA5bSIayIeGTRpIe0qHWW7uHoeuLC9IIY3g1372mWrXc?=
 =?us-ascii?Q?1/hBJ8F/KDpMj99nD5rnTg9THMOFBA0gWJvZ/SX6YehJ4LueBnYDvTuASPYe?=
 =?us-ascii?Q?Z/HpFs2/fkD7aaVy8yTg3knx7VkM3DmEL2hYIK0V+yJdsniZHFscWhEejv0f?=
 =?us-ascii?Q?qP2QQfR120ZQOuLXfEHOYaLwhyU7MS4oXGmVdzrR9PZC9hjKm3EUTJIdt9nE?=
 =?us-ascii?Q?s7NqxfLc+R0/ismJf1N46xOta32hmZrdiB+lQHZEGb+5Q4A2NZsJNOoELBJp?=
 =?us-ascii?Q?95PmwGM9C38cKYTeWGdU51fCuVCrBFneOCUzCmt0/RRzFFpt9myzQmQ1m3+n?=
 =?us-ascii?Q?eRyxPsGSfgYU5n9eZ2DToxLZ2CJ2Q31o/rayiXGQJxX3toBk3X2ujMG6rUSc?=
 =?us-ascii?Q?0a5P/fjyG1zvsRzx9F7PKhTpKc0+Zdknxn+H3SWo9/A5ASr6Zph0BP3MY8qG?=
 =?us-ascii?Q?WEKEtTFgQg/CtsPesOWIK7TL2rqblTok7bJXnGwRinxCvskX1W/w39awxyT5?=
 =?us-ascii?Q?SF9LPvakNiFScx5zA4tvr9jH4VTxAUa3tbvIclHNLGo8anrg3C1n7vX/mgn8?=
 =?us-ascii?Q?HdIdjdsQuH+0/oWfVo6yZA0frA+pC6ZOmIysizQmZSx7fqbjCeCBGr5Bqvti?=
 =?us-ascii?Q?4ban34iqqTf0BmfPW3qBqaMzTAofMFhK0OmTjNvOlR+1eufhbm0RVmWMEVS6?=
 =?us-ascii?Q?shIgAo5izLqs5sZVBoWoeMYXMOx54P209LkWlIPuyCZbl/lyzBWMILhist8k?=
 =?us-ascii?Q?yVlVL13EJLJ50Vphs6Bh+ezQvlQdRN8l2LuIxcJIC6D1sM3SnrbAQxzsO5bs?=
 =?us-ascii?Q?XYlwvHfZUzXlXRVOPahTXBrhfPk2BUMhQAKuv/rwv2DM8F2+yuBoqCA1+Wy6?=
 =?us-ascii?Q?gPiCaWT5o+lFsU9lb1/nnTlpPO1TZaJUfl0qlW+0pQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MYgGQFrVBq107LNnzlKWX1SCm9Csak2Tg3UwJb4flXDTi3R+U5uhH0t+bJkS?=
 =?us-ascii?Q?XhiPBV0Ns6l57BmASUJfjXHDhY4HS6ej3LEACmrgdaMYjBvoDo4pFZQeQQKK?=
 =?us-ascii?Q?2W2RXbb6b8/5ME/ucX04CRyWtVfXKRnTEWASJz8jWYFmNKeT/sP4seLLuMEJ?=
 =?us-ascii?Q?8LQGovLxlpAA1D9eIMvWn6QbX53Z/kMtBOApPR5ElXqj+xgurDdyBw5yuQGh?=
 =?us-ascii?Q?9cKfE0W7K4mtyU1P/Z4qUdg6BCy8xcuRZykFVOfReosYo5B/z0X1/DCz3GOT?=
 =?us-ascii?Q?1dzsglF+Zr2WU3iAgZ0NlO4vt2vHNZVkv8+Tgk8ECgjKH72gFYgCNHvKuVpA?=
 =?us-ascii?Q?GrFKNXWST+IHO0HRQjzsmew92w4FrNDI49iTJ4qc21UO/tsuZB/WAZK/z4uQ?=
 =?us-ascii?Q?OVMT5/k0bdfiI01GpSi/RQ7OdgonCZm7Gj4P0W5l9u/Jb4rL/4grE4LCj3WN?=
 =?us-ascii?Q?jGU6mWxAe5Loup9G/XDvOKmGN6c+kpcenJ25RtJenvmYBXCQhZh5PI3+hCVe?=
 =?us-ascii?Q?cOi34xV5Ng1tWDWObxMMCMy4IUrQoWWNFpyYhCIPj+7/vflGfQ7LColtOgco?=
 =?us-ascii?Q?FSWbfI8N2IwDri/ZFmXpMx2+CnOocpUABuTlXaShDdBi2/Nb4vZ0nimYwg9J?=
 =?us-ascii?Q?bWF9F3T8RmLXMV4NvReo1BhdzFWtvkuJNNSEPpw/zsOCEck9o0aJII2USuMA?=
 =?us-ascii?Q?caG77cgjm+wGDUBAXG+3ihQYQw7WENkLGv/rUcTKa9VqcDG/Y1KkiwQwAi0y?=
 =?us-ascii?Q?jjdmoaYNAkQHBHoJXNfZkqVrL4gpiXXf6RNrUDTQJLJlnynzAKW6vSxKXdrL?=
 =?us-ascii?Q?0dbuHEL6mS/rZei1G6ZKek5Sx28LMCoNVRr+hXZDarp66vgYLKDBhwhLX+2A?=
 =?us-ascii?Q?4jq82gpniGBD5x0iyvJMdj/3hug+d4iNMme7lZ20QOf1rcL1nft2kj40fliz?=
 =?us-ascii?Q?6RTN7e7NMcw6q9v7O2zT8lNiipsDGXuqDf4BRnYDHjD2wwgZXWpuQMBpqD90?=
 =?us-ascii?Q?5l/kaR2tVHuQj2+S/p7DCDfPTW/LRGLFBcgW1X7K7jC5cKYvkad4o5H5ki9w?=
 =?us-ascii?Q?c67cW3hu52lfUI7J0ipRM0a6fHv7hdBaUSCUmkcUJBqq7o9GS+KCWpfJxSPq?=
 =?us-ascii?Q?bGw6TKfo+BHhjj1L2A3YFx1Kr24LxBEnpAt8YrpT8e8Cp+HLnvQ91uFhs76K?=
 =?us-ascii?Q?MbP0QpwXRSbzdYron55vWNJYglWvvFh00UbnoEu8O2L1hV3L1PXo886QzSI5?=
 =?us-ascii?Q?doXPiTiwLnfKDOK+GgEuWO4PdlftLcxytHWekPuBHPMr/v6rQfU+5xi5dIIU?=
 =?us-ascii?Q?lbKEPA+9DGsYIIlf0H7uRXQ6dkIr5GuGV1mC4KC2AkxpMGxwD/9ipkK7Qw9u?=
 =?us-ascii?Q?eauOBmzeMNuVNGdfm4TM5sR3qOangk6eQcjmXhcu4zJmMoRIExXAuMiuZRtv?=
 =?us-ascii?Q?q8hgKYIOk2/UPWZ/UWJLhUEG6jzorWF9Dsxw8pHzvcz8qjXJepliAk5Rnqip?=
 =?us-ascii?Q?6C+ID0NqjNVrMGdVaBqMFv6iu8b0AIIOswWmW5CBvLKxP6Z5UslleFjxV7P0?=
 =?us-ascii?Q?/yUhUwui2Dmx5cggBltdIt2J2bvxqpb71i1dWai1dGxygSEgeQEm4zfiHjT+?=
 =?us-ascii?Q?8w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9653728-7f7a-4bb9-ce68-08dce9ed1e7b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 12:06:20.9406 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K1w0dMAgvpTck90cCctsO8sEffaUh78eX4neMyinxQnrCLgGb/S7PIkR3zFJvvlrY4opKTBzTjIIPFFNgnLGwldhXY2GahdOIZV4sw44PIc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6388
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

On Wed, Oct 09, 2024 at 02:51:09PM +0200, Maarten Lankhorst wrote:
>This is the first step to hide the details of struct xe_ggtt.
>
>Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>---
> drivers/gpu/drm/xe/xe_bo_evict.c |  9 ++-------
> drivers/gpu/drm/xe/xe_ggtt.c     | 16 +++++++++++++++-
> drivers/gpu/drm/xe/xe_ggtt.h     |  2 +-
> 3 files changed, 18 insertions(+), 9 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
>index 541b49007d738..788c071af92e0 100644
>--- a/drivers/gpu/drm/xe/xe_bo_evict.c
>+++ b/drivers/gpu/drm/xe/xe_bo_evict.c
>@@ -146,13 +146,8 @@ int xe_bo_restore_kernel(struct xe_device *xe)
> 			return ret;
> 		}
>
>-		if (bo->flags & XE_BO_FLAG_GGTT) {
>-			struct xe_tile *tile = bo->tile;
>-
>-			mutex_lock(&tile->mem.ggtt->lock);
>-			xe_ggtt_map_bo(tile->mem.ggtt, bo);
>-			mutex_unlock(&tile->mem.ggtt->lock);
>-		}
>+		if (bo->flags & XE_BO_FLAG_GGTT)
>+			xe_ggtt_map_bo_unlocked(bo->tile->mem.ggtt, bo);
>
> 		/*
> 		 * We expect validate to trigger a move VRAM and our move code
>diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>index 47bfd9d2635d0..655eb6b7474e1 100644
>--- a/drivers/gpu/drm/xe/xe_ggtt.c
>+++ b/drivers/gpu/drm/xe/xe_ggtt.c
>@@ -581,7 +581,7 @@ bool xe_ggtt_node_allocated(const struct xe_ggtt_node *node)
>  * @ggtt: the &xe_ggtt where node will be mapped
>  * @bo: the &xe_bo to be mapped
>  */
>-void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>+static void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
> {
> 	u16 cache_mode = bo->flags & XE_BO_FLAG_NEEDS_UC ? XE_CACHE_NONE : XE_CACHE_WB;
> 	u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[cache_mode];

lockdep_assert_held(&ggtt->lock) in the beginning of this function
wouldn't hurt.

>@@ -599,6 +599,20 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
> 	}
> }
>
>+/**
>+ * xe_ggtt_map_bo_unlocked - Restore a mapping of a BO into GGTT
>+ * @ggtt: the &xe_ggtt where node will be mapped
>+ * @bo: the &xe_bo to be mapped
>+ *
>+ * This is used to restore a GGTT mapping after suspend.
>+ */
>+void xe_ggtt_map_bo_unlocked(struct xe_ggtt *ggtt, struct xe_bo *bo)

if we are not exposing the other variant, what's the point of the
_unlocked annotation? Either keep both xe_ggtt_map_bo() and
xe_ggtt_map_bo_unlocked() in the header or provide another name for the
local one.

Anyway,

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


Lucas De Marchi

>+{
>+	mutex_lock(&ggtt->lock);
>+	xe_ggtt_map_bo(ggtt, bo);
>+	mutex_unlock(&ggtt->lock);
>+}
>+
> static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
> 				  u64 start, u64 end)
> {
>diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
>index 27e7d67de0047..bdf6d0733e2ca 100644
>--- a/drivers/gpu/drm/xe/xe_ggtt.h
>+++ b/drivers/gpu/drm/xe/xe_ggtt.h
>@@ -24,7 +24,7 @@ int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
> 			       u32 size, u32 align, u32 mm_flags);
> void xe_ggtt_node_remove(struct xe_ggtt_node *node, bool invalidate);
> bool xe_ggtt_node_allocated(const struct xe_ggtt_node *node);
>-void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
>+void xe_ggtt_map_bo_unlocked(struct xe_ggtt *ggtt, struct xe_bo *bo);
> int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
> int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
> 			 u64 start, u64 end);
>-- 
>2.45.2
>

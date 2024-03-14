Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC43C54E60
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 17:40:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C26F10FC5E;
	Thu, 14 Mar 2024 17:40:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oIgoWdnB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68B5E10EE97
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 17:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710438005; x=1741974005;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jym5aJoC6/c3KMYpnU6EFbBtmYZlP/0y2/P/Hd4ebTY=;
 b=oIgoWdnBqVwXjCLgS9Qeg9DjHbPhiFn0vn5iXrpywG5mzyrKb2Ujsxii
 kXXd9Ujmc2DzO6LctI2WY65XT39jyMTWhrUot9o5XyZTOclXlJ6de0SYb
 KSMe/4kxJXw8NklPLM/h2NxSgCHa4vsitGF7TRdqiBq5HYsJsJ0e3tXVk
 H6ZAPFUeH6bHjImIkD2iPFe6/5FQEGC5uLsLsyfl8RHe2g/uEnRG4qfwn
 ty9Wx7uolYpN+e3vQSbLY1Ja9skYsJibjC7Y6idqehwYPrib720yCEq8S
 eZvx6Wxs/k5i8vt8qfjVRhB6kc1juGiPY9sgOhe4WML2hvxX6qh943ugR Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5476571"
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; 
   d="scan'208";a="5476571"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 10:40:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="12441847"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Mar 2024 10:40:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 10:40:03 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Mar 2024 10:40:03 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Mar 2024 10:40:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JkxXhBKB92goywJXeE5yWhcOPMnCWDUgIlRcNsCkP/s/epF1iUFGp4Fr63t0x5Li89OlBNLnxTEtL+AHDsS62dwCGun4nvwHA45Qv3A07WBh87Y0C+QD3BBSg/vu3iQwNQY8Ciuj1fMZI8edM7uJn5SUZlB+Myew7f+MOFH1GM32WLfy4hfRx1lypKhHH27as3CyNhm3gcxvsGItIYILXF4rt2dY47H2uX0Zq6IneDmxmQfxzi89kC2KY2fNOkPj2cU+A8wJNmHfGY2S48oPXL2faYvcHaSdre/oKU45V0woKAl8ocLVcc/7XHqd6pcsMazHd+dmP3DO9ycmCuHbMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NxiDH2e39e2xtyFLgXldlSXbVuAvEHvC2T6Q0ecfKUg=;
 b=SiHm/05wKH1XDUo7w5ZvCDXIyrcMc4e++KpdsCZa1Iyt5MQDH6VsBn1KgHHzom9Wpu792Za/HmEsXOyWk2eOAjwbvBF/2G9zCjO8F9aax+298DzMn6QnKMcmPvRKNq4NTT5XVOTB3TvohsEojwLTi8AJrz9WkFYb+2yrYm1OCWOd6VVPfAFqInHAWN0r8CDVtT3xXCj7ly7GnuXSIP86KvVcRx3/dHtPIJqoPYlhcTp6RwW9qdTnBthetuhk0hSchxXR3F9fNtVS4N5seD+WPhyU981d1UAYRFMo+hLQ6Dpn6r19Ou9MwoffPFQPmle4nKxNmcguiScnVoQN4FKaMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.20; Thu, 14 Mar
 2024 17:40:00 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7386.017; Thu, 14 Mar 2024
 17:40:00 +0000
Date: Thu, 14 Mar 2024 17:39:05 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Oak Zeng <oak.zeng@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@intel.com>,
 <airlied@gmail.com>, <brian.welty@intel.com>,
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH 3/5] drm/xe: Helper to get dpa from pfn
Message-ID: <ZfM2OYmQ8/XiT7/D@DUT025-TGLU.fm.intel.com>
References: <20240314033553.1379444-1-oak.zeng@intel.com>
 <20240314033553.1379444-4-oak.zeng@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240314033553.1379444-4-oak.zeng@intel.com>
X-ClientProxiedBy: SJ0PR03CA0199.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB7821:EE_
X-MS-Office365-Filtering-Correlation-Id: 19588588-3add-48e5-f5c3-08dc444dc5e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qwJf2L/O31reXPcQ3vyAfHq8gK4kiJHiMmvMIXdcAy5vu/yEBVnS9J2YcGYcixjWUkxtI66MwMoSutsR9q63XQSQ/EBTs46OmnMXVIu/zQ6jgfRNquEkbza5IhbOrNadFLmZwgwOk/YXxCHYsqTBuVS1yvUzr6POEJRVmeMUkHpW+1nQq7MMEr7EeNPBcvwp/o1xC1Bivm+GdW1NURLRBtqeKUylGT/SndBImOR/oiM5iy4Xnf2fhVAnHY5ufzd1pdfddklrPMdnWrP39kFdK5pYtFQLaGc3UPhGSqJdrIfSFvzpa30pNmtEWZHELW6L8+49ZHfU+o++/4A+d+ep9pxxqfNXmF76u7xWGU9rkcEzYhyLI4YqQ+0049IluLZB5wVvYzAOcfBm+pfpRCqHAyUBPtXLOG/zmt042nkA2CvpOY86JRUk8Zo9l4l3dDjdbzXk2IHLTT7MeUZ70FfYZ7K1N7zGUvXHW5gGzL6gjFmWO/DfdtjhGl5WsM3FR50YqVFWI35EOH/r9VcTy8E95/sauHPP2GSK5VoSxuhpeCGDjd7ENKevfYmN3di3s1YQL7wpB4YzSsnpwOVp+w9Rd8jzh8r4TEgUMsH0QdCaWYMZgobuMKoOk3o2Yd/qZIXuPAZC4CVt4V6AHTFABqeApRRWjaSx+8PDAHj2mJtbVgo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?haTwzSyTQNjr05aDKtqCoy4vQN1t5aXadtoEF1OXKQsGsn/veIbyRC11lIsS?=
 =?us-ascii?Q?fQhm+1v3MDR3L1Na0sxHOPAjl78neu4rLlXZ91XgG2kCNHm3+4XURlQrF1Eh?=
 =?us-ascii?Q?q0ZyKH8sT9Ztx829piIBYZajKt6CHokO9qMVuRkM+yXyO6p3tCtI17CUP3Dn?=
 =?us-ascii?Q?C47S1Z+MMKofupn5Qk21cYPgIJ8OxSOrHi2jdv5o4q9DpTqN4/dx5DVlqLo0?=
 =?us-ascii?Q?0K/KMiHy8L5YAfMPQ1/dbh+WT5qtYYkxPeqNMSwOqEk4bXW+JouUEbpYKPOG?=
 =?us-ascii?Q?L51NWiQOlcEbchrcImkZZYihNf7bLBFDhEirwPHbYK+2UzGMMd+iWVg1LqSm?=
 =?us-ascii?Q?vf4ywEu+7mfs8Rqny1KRHIdW7Jj1bWx6FE9xsGvDZDdqNeYGgfFmmGWmhPEI?=
 =?us-ascii?Q?jU1LLn/piA3Ie3K2/zdhAUpa8a35ZOFVRhNv4YldHokVAIkb35qNRPizyJVf?=
 =?us-ascii?Q?uajfuCrDz/hOUg5V4sdHTmzqoO91FrPCxJZeMgn0kwP0ark9wbt/KBvGAH+M?=
 =?us-ascii?Q?zRbL3wpmjIk1aIIet6Ph6yNyRDY3neLQK4e2rkEN3iKELvQJVCMPUJgNf/cs?=
 =?us-ascii?Q?ydoIV1fizBzxajrOLemcLbLsDGoYBIKu7p8/q60fA3yBkumTj7N4vCCH9vKW?=
 =?us-ascii?Q?AOK54gMD3l+uIi/5qE96AwwQPlB3yadYv2UEp0Q2WDIFOPHf75boyaPQe81L?=
 =?us-ascii?Q?yjRA5ccXLhMT+1HR+LTpe2RS/zdBewl9WnLJ9b4kMG3Z3576zGwC1CsqIpGY?=
 =?us-ascii?Q?9NEE7M3VZic2Z1CVM8wX3nb2NGefQ4PDqn8n0ae7Imb0HUGIcM1JLSeRAz+7?=
 =?us-ascii?Q?6Y/2Av3xOCC+Ay8tWNoixY15X0g1yVL3j7YIC8x3PucEGlJk6gS6+p8rvFPm?=
 =?us-ascii?Q?DFdNkK4Yh76nJhHzEhRFDKfneyRD0viH/p3muX0PSAXCz3XtK1fZiEkpJkxq?=
 =?us-ascii?Q?nA7LCqGN4AXkQzHAra5iU9EGuwMUNn2Wgs+71oWTVfZ/j3oMHTmw56kEADzV?=
 =?us-ascii?Q?yCysDd0xVJjilsq6inPXnQG810wPR+byaEMRIZOk5CoOUvF/G6X8m8dvHYEz?=
 =?us-ascii?Q?WbdC68GOz6wXwK39thpijpdJiLtTYF+0ELl7JwgS3hLZVwMpivAkR2QxkfGq?=
 =?us-ascii?Q?bIkHun2YjTwB9GOKvwc4LVV1kpHg+6bbPJiLjAZhzhNK9Whp4Jq8yIW1p1r8?=
 =?us-ascii?Q?ZFDegQ8S95m7GgxkrK0mJFA7T6vuiuB2HGhTFM3pYi4gaPaFtBAZO7HGJ78g?=
 =?us-ascii?Q?nazUTDoqQHYLFY8FM+O6bbhvPOdnh7TqwcgXHkIlflm9ggGuDRtsrjYSSPg7?=
 =?us-ascii?Q?CO6Hn4WNmcRq35NZQehN6ZrtzUkupSE8NNJckJWIvZZ6cNmxT1b7TLlRsse9?=
 =?us-ascii?Q?oxXmiwEK55w7rFJBoybML3FbJNGl5CzAHzZ15738JkSlUrYBVHu0Ns1BbNPb?=
 =?us-ascii?Q?HdJni/2dfkwbYEQtXHq0UNDijp1/sf4LNC2VmbSgZ2Faxv5oUMn7/WICbuts?=
 =?us-ascii?Q?oOFOs7CDPS5oGypJ7Iwx6bki14Iwey2upBuAVRsMAjIDen8GQhAPXhfPfX9+?=
 =?us-ascii?Q?DmQAwckV46ZJ6RWqvZxHKKqFmLeDpSfV25bmbxp2IdZ7eL2kPQqwDs6Beglk?=
 =?us-ascii?Q?pg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 19588588-3add-48e5-f5c3-08dc444dc5e5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 17:40:00.4319 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JfoDjt3s2DePNV+2ac3Ff+cDdmw48T2EKZmpYGAtnRpsEyj0vC5t0qkJgIqTLavB8x5sAJ6GXiEpntdSY2T0gQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7821
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

On Wed, Mar 13, 2024 at 11:35:51PM -0400, Oak Zeng wrote:
> Since we now create struct page backing for each vram page,
> each vram page now also has a pfn, just like system memory.
> This allow us to calcuate device physical address from pfn.
> 
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index bbea40b57e84..bf349321f037 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -576,4 +576,12 @@ static inline struct xe_tile *mem_region_to_tile(struct xe_mem_region *mr)
>  	return container_of(mr, struct xe_tile, mem.vram);
>  }
>  
> +static inline u64 vram_pfn_to_dpa(struct xe_mem_region *mr, u64 pfn)
> +{
> +	u64 dpa;
> +	u64 offset = (pfn << PAGE_SHIFT) - mr->hpa_base;

Can't this be negative? 

e.g. if pfn == 0, offset == -mr->hpa_base.

Or is the assumption (pfn << PAGE_SHIFT) is always > mr->hpa_base?

If so can we an assert or something to ensure we using this function correctly.

> +	dpa = mr->dpa_base + offset;
> +	return dpa;
> +}

Same as previous patch, should be *.h not a *_types.h file.

Also as this is xe_mem_region not explictly vram. Maybe:

s/vram_pfn_to_dpa/xe_mem_region_pfn_to_dpa/

Matt

> +
>  #endif
> -- 
> 2.26.3
> 

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0113EC3DA4A
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 16:07:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3F2910E425;
	Tue, 20 Aug 2024 16:07:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ihrwsvki";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5088F10E434
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 16:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724170074; x=1755706074;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Yhykfe9HgEgoElkNLGSdpDP6M/TgdgY7eEM2+IijtXU=;
 b=ihrwsvkisTFPX70MISiK5bDhkSaFOHPe7D/AC63E0OepViXb4ZQXXnYh
 kf9E2aJtJlwdDI5E4YMlrirCMnGZhprIIf8mj583Q7h3aP52lpBAfaiN2
 qyXHt5a/0DDqiqSo97ImF2+spYfgggsvUoS576UCwACbW8/TAz9l2MvPz
 005Li4qNXHHMplOmeywu+CTm6khgOU6RFmbGLJ9VrD1W85GZaigmuRxMx
 B8YBJCDOULzUo6RJLhZrQgJpHMCkXQjsSTOSCGhsKtrusNrR7EsqyD/gI
 z7eY6xp73gtOe2qQFr7lid6CgFWaqgI9hn3C4whkeWvbMDtCGj/pjiaAe w==;
X-CSE-ConnectionGUID: kY8IOpFETjqzHk8YMQQa6w==
X-CSE-MsgGUID: enTkWJ5XSCe8iT1jR8ERHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22648685"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="22648685"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 09:07:20 -0700
X-CSE-ConnectionGUID: 7m0atfvvTLepZmz1ai3sng==
X-CSE-MsgGUID: rXMi97DwTemn5ALADC887A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="91552271"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Aug 2024 09:07:20 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 09:07:19 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 09:07:19 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 20 Aug 2024 09:07:19 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 20 Aug 2024 09:07:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iK0sytIAWQv0MGktjdjHEiWNHMsqfCv0sIoo9PvaeSTB7o89ZXb+BPPwlFd6fgvCufzTFDN70ViWgnJ+2FIiQ7x3lpxLcV8VoStroLgRj7PwgQ69JpHEqNqSbppQdjCqFHL5U5BWzPD1BbD88s/5M3riYjrqBrdrNXwjPb+/Y4YTQNT+DRIahAHujKjVv9QZ5jNLURvrpyinFls8K5s8jKQmzDVCUL/vsL1ZFTiNXT/7dNf8a6vx2avlcM0Omyk8/O92dlXN8mBrMV9yk8RrcX2ERjMo78XX88btRbZv4QT92375u56DwMkUOWkw74SraIkomcz+1ib/RDn2AA0Llg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2XjgdwZ/xOOTZmH0UGmyh1ZiI45Ln1FJrk87KoueNrY=;
 b=YhH65tTP4ty4o1pxpVvUc8W2mJmJgSc+KlGkY8qmLOCEKJ0+xFoZLxkWUBV7z+GaeWIcJs+0xAt9C9hROj/qfArfOnsVo4gOHSFs0ji1KcSpGTPU4wRJ/kUu1TLz+lJ5VY3e92nkZBife0pR0EOy5mD5eZqdXcAH+P/2QfdHvMRBnueDp8DCFm1PnAcmjpTAixWrWLCz241AsrRmq03hrXg2FfcSxkItkam5JIWBRDZJBSrn1+QxEpGY9n0CpEi7/OwbbMNaXLYUnBhREOMjtQSXJfn+PR/apkYDzcF76N3bhfvvrQ1RMH1E16g67LeyXMCvrkflMnrrEW2+Ktzg9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB7657.namprd11.prod.outlook.com (2603:10b6:510:26c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 16:07:16 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7875.018; Tue, 20 Aug 2024
 16:07:16 +0000
Date: Tue, 20 Aug 2024 16:05:57 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/xe: Remove unrequired NULL check in
 xe_sched_job_free_fences
Message-ID: <ZsS+5fFpBMOnNE1Z@DUT025-TGLU.fm.intel.com>
References: <20240820090230.3258128-1-himal.prasad.ghimiray@intel.com>
 <20240820090230.3258128-3-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240820090230.3258128-3-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: BY3PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB7657:EE_
X-MS-Office365-Filtering-Correlation-Id: 32473b5f-62b1-40c2-abd2-08dcc1322954
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jizKOt7QDjEUfsI6R+ibOzJos6xkDdfqsBuyfN1Tz7RN48Dwg05f/LYOFkkz?=
 =?us-ascii?Q?v+6JsNJKa9AXBb2aYCLb0mLqvQpv9fRw4lug83TSXhYXjQI2CWjP4Sv5GHnB?=
 =?us-ascii?Q?KTHFdlnq/u5jzrQGwcYR+wTaf68s+KZVc4o+VWCKCWYvNZfodVYd4WIjimW7?=
 =?us-ascii?Q?g3RGf14abs2vmJG8vRiaF+RaaHNJsMTKdtdTryvLed4kagW02nGIwyIgmw14?=
 =?us-ascii?Q?B8GQ4xJH+yYgP/5RiUh0tGEwV9WoGvu0exiMogHm9SRT4P54SI00M6wIYq8w?=
 =?us-ascii?Q?5vkN/UOibpThGwgsTBB6UTHflRXF1mh7wETEDp67zldjNxsnCVyu5sSuUQ8L?=
 =?us-ascii?Q?W5ncUmktLjD762NfCFB70xQ3HuKYdl8d4qjtPa6vGw5QCytjEHCYnZ2/6l7w?=
 =?us-ascii?Q?1YQqS6FCqUviKoQe3Qot6PFoyPAW3dDoOLwdN5u9/L4G2llGkG5GjfmI8tFO?=
 =?us-ascii?Q?vER3G7USBkqaA0y37LD+L/S3LkjLq0AdF34INlS5iBMJXmD2mifHSdIZS5z+?=
 =?us-ascii?Q?FLJ4clIJMwchPe2KkIOw2jW08MJEKzTGleIBr1MGKxHlXxNUJ3AdJHUJGkC8?=
 =?us-ascii?Q?/Ho2d1y2VaaX08ob2isBi3O6qgXGvzRFTTvF0lN/VM1jNNnz+EF3Zw6b+Ysl?=
 =?us-ascii?Q?A4BIbS6OzcO3RCw++KdlYdMZr6RbXCKbAAlB+LUwc5d8VCRAz/gNE/jAK718?=
 =?us-ascii?Q?caED34dIJe06b2x//3yDIOVnvav4gFOzpVheHMkd0e5QyuMr7S2v4/99uc7Y?=
 =?us-ascii?Q?31jJWi6t8dSnaM6tJbgcagqHc4x4T9/2zBBswUOwFkCgUXU1GFH+EQOwm9M4?=
 =?us-ascii?Q?0OPL8SpgaBC9q0UguUifwV+MQPK2AtPNeNnDGLEe/Ks18lEXIQ19jLasNXrx?=
 =?us-ascii?Q?TBSD8m212LmE9rqh0JnO+b+q0OwXu3HeR91lCJQAAutJRcK1ZBbC3LxpVjD3?=
 =?us-ascii?Q?PtU33vSje485Em5BOPMpWVQLLhp4fhPKItMv0iKEKMM44ppMZ2HwVjPsu/nV?=
 =?us-ascii?Q?nfYstENc4hqanwPxX41p/Txt30jZhdufiBMgaWHSgwXja6ZbjJK2Ay222bX/?=
 =?us-ascii?Q?t+sP1UntOHaMFZBOlontfZn8iGF6uzKHyP0W/YLLgu2PdyeKGZiDvtcSYUA/?=
 =?us-ascii?Q?IsF2iyaSMnBqrfA/c9/CW/Oi7P0ijibY1jguToXGZILx3IyU5nHLzwgN0pgb?=
 =?us-ascii?Q?aQdRIUMlCYs1gtHfllFNlsssGUIjZWamkBA3w/bv0brj1igVYwhjLPzx1KER?=
 =?us-ascii?Q?XwMJtBlfxPLMu4V0UbtqPRdm1MYDyzDF9wysmHumnR3I2zqrNl0YqsaqqMbE?=
 =?us-ascii?Q?1gRikUrwGIWpJqCj1MrQpLhwfNXFO0de13xIWXIXEOr4yA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qUvESpSkZoOABbdoIzrM9ApYQKN9OqwmAzjbXsn4LqW1EP+iggFIQaN1Dkb+?=
 =?us-ascii?Q?piIpXZe0wLvEHTJyZ/uOqWEbNqiaI1b+FEcCqQB9QysIu+rjIF4eRI+KzT1R?=
 =?us-ascii?Q?RJyQYO7LXk36UFQu9IQotPP1p8ijxBiKJpEjmRoZ2hRntRdrwxb+pER9gGIl?=
 =?us-ascii?Q?dqgrnC5mQq9ToxEO83DhukqycL7gCuC/pYC3l/BhGIy5jMal4SrqUze6DByA?=
 =?us-ascii?Q?+kA5/Kzu1crLrL4IJwuHBvqYoMrDUU1K1y6/yY+lMICSZvuKdh1hLbaRKpVc?=
 =?us-ascii?Q?B+OQYpcSeQDLpyu0fWIb0pgrPGyXSjTvUXwimPyXbVGhqGbqyomTQzAeKg0q?=
 =?us-ascii?Q?q1xf55aUllYfQXs6IxCPw2ZcbOyrwI3GKP8Mefgnf78ZG2wjdL9eEAwTW03r?=
 =?us-ascii?Q?KrGhQf2LHhIeYpsWhlgQssxGuvfkRVUhsIpATp3AaoBsLI6UOckmjsgy5C6c?=
 =?us-ascii?Q?MN8iITIPbICdBCR++3D57DQxABY35sG+29X/xvl/vdogLK/+FxJVM8pw0rYr?=
 =?us-ascii?Q?8Caand6USPApS9Mk6Fb1Xc/U7AKnJdz+ZcF7OfYVFFqTb3qEDhVPqQfuWeXL?=
 =?us-ascii?Q?l7Puk4hhlG15zSJkkd15l7wHVVJCwwD7CZhsOAuIXiTKvy6k75jLcZDyAxVQ?=
 =?us-ascii?Q?r4rddHVvExGvlUb4INDWM8FBHIpOg8ZubWp1/hZhax1LF4JlLgHEz9wTHNQz?=
 =?us-ascii?Q?xZtCTSepk/fw5Zkb9mk3aPjkSBSh7Y/G+vTj54DV3Sg6zVolgwCQcjViFgZt?=
 =?us-ascii?Q?+SJLKEsTjqWs6sT9BZgrLQlcRxXHobf9kM6q4wq112BSUwiW7R1ZW2/Z5EI3?=
 =?us-ascii?Q?/qVj9yBFkw8XcQVgrhh3w7PBWxiv6jYw400vfQ4GLX1Duydzq3dKUsZobwsX?=
 =?us-ascii?Q?4kbON0jz5JHBg7fecvs4QtGEr+W3D6d2tQE9J/7noJYFPPiWgZ8JH79gogUs?=
 =?us-ascii?Q?lL73gc2dsiT/31rCSPfvfLZzTS8JyDCq6iJgVsKqkH/8CsKPng63JpRot9qb?=
 =?us-ascii?Q?0OIQqJxILxLhMD4eM7pxMqqg4Nz0X4xlaXk4Rbz3aVcdGA7rdhTIUFokNYEX?=
 =?us-ascii?Q?co8xzE3XQTmUBlwDgs4SobJGTXATci7BXpyqsN+o2MSb3i8RUsu5u3/+O1ix?=
 =?us-ascii?Q?OFYchZQENOySp0D4O4ul45bCk3f/jeckmhQmGJkIHrrDmjH109w7qbqJsikv?=
 =?us-ascii?Q?64bMsjzdgtdR2D/aUWRKY4ijxTLqUuKSWuLU6F3grvLGsvD+C4T72iV7Svaa?=
 =?us-ascii?Q?u6q3H+qVlmFBm1K8qTjlNGY6GVVml3CV5T7WPJLMI7WoNwH5Iq2CAZoKSfLc?=
 =?us-ascii?Q?ACHYZFjlKS0pT3ab93f3pqCnvTEF0kPjQ+hjI+iKwYKZ24tdM3rbHGticy3t?=
 =?us-ascii?Q?iYbHVCoqi7KsXqUhfWWQiyQuo0HcT4IxK+im16sKXaHDdprXsKPsqpM0xCJW?=
 =?us-ascii?Q?bcVkLnBeTlk3mh3jdA4NKf4cx9ln+BedV5QQBLNgz0C49/lJT+2IiyiG8ABe?=
 =?us-ascii?Q?FmzTCeBE/hvvEKJif+Nets3HKPZh/ri/a/01GIsyOzVxek3FLMHIJtNCQNFT?=
 =?us-ascii?Q?2nl9GBBFRu2j+ruUKn+ytrktNcxJftZzHKfjEPFdhVHEUPoY5lhkQiPgKip3?=
 =?us-ascii?Q?Wg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 32473b5f-62b1-40c2-abd2-08dcc1322954
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 16:07:16.6874 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sJy9tkipCmnaOdJirxKAbKnE1EKCp0TWJAa2hmsu0Zmb8HyWfWCX1QWz9VZjbwrWrCJ2Gsj6FOjTdcBvFfoo9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7657
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

On Tue, Aug 20, 2024 at 02:32:30PM +0530, Himal Prasad Ghimiray wrote:
> dma_fence_chain_free() can handle NULL input, there is no need for NULL
> check by caller.
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_sched_job.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> index 44d534e362cd..4ed0c366ccff 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.c
> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> @@ -89,8 +89,7 @@ static void xe_sched_job_free_fences(struct xe_sched_job *job)
>  
>  		if (ptrs->lrc_fence)
>  			xe_lrc_free_seqno_fence(ptrs->lrc_fence);
> -		if (ptrs->chain_fence)
> -			dma_fence_chain_free(ptrs->chain_fence);
> +		dma_fence_chain_free(ptrs->chain_fence);
>  	}
>  }
>  
> -- 
> 2.34.1
> 

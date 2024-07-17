Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B93E1C3DA60
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 19:39:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7494210E34D;
	Wed, 17 Jul 2024 19:39:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fMRZ5CG/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19BCB10E34D
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 19:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721245145; x=1752781145;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hJg+WevEmZ0DKLYVYkzMS1eLFKjjroxRb5vkIV3JYEY=;
 b=fMRZ5CG/5mZKCDrMomAZgoKJloRniodLetZtKor49AvvRJ5S/O3XjzNT
 WacKifVuGWNNtzR1uzofx9UgDby5b9ltcN23sCCSusraCaCOeUY/NKryV
 4Ls+uh/Sn4kXI/LNagGisGYV53ezzSKS4kJvGqoHYUgm9rOJiD8JkEK/6
 fHjQxhfh/zydrGJb+TydoL/8vM/s362WS8sWsy/N6hR+l4K9Iz13dASHn
 K7bgmlKLlGgrQGfYwrGTVS7c3uYCdcYgMya/0Vud33J6POoV0w+ZTpIJh
 BwMSgWKd9oemvFLxOE2TjpkbPtPvnw9B+cnWhA0Q4/F0fayLoTZHjyjMT A==;
X-CSE-ConnectionGUID: RNcdj9wkR2uBfi8AMIa64g==
X-CSE-MsgGUID: 7YYnPteWRNaQTF5cwqF1WA==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="22584666"
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="22584666"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 12:39:05 -0700
X-CSE-ConnectionGUID: FxjnvAkJTCW7a91IclgGaw==
X-CSE-MsgGUID: qiiOgDpuQp6VIfgMepIKfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="50383015"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jul 2024 12:39:04 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 12:39:04 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 12:39:03 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 17 Jul 2024 12:39:03 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 17 Jul 2024 12:39:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mj2DhdVU8vyrdnzF8Ug5VU8IAY05Ogkeo0iJqCAd6lN4TRbn8J5lTOb9oQKOW9dCu18TOLdIXXI+Nsw2CHOZIaxELX70WGt0AEUpctYPmxeqO45pl/UQSbGqMF76dBDncxox7E8Cs3SgaPl2TjCpY3iQ1tRxgb9o+o9k1ExZy5JDBrio8iBaRgiWgz406tEM18txQbLzxHd166zIJLweRE9RpUQ9BWqL/h5qEzJdLpDq4UPhKUwceDAcE4dHhbd575JY7pB9LJW7bXE/3I6gcE+gZOTv2FaM+cb6s4dsFyNWYolLK/RwT5zC69tHiL4F7zkzFEMqNzZGDps+X1HdKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XF9hrTQF260YurINJDY7j9ac4t9r0LmndUCvkqF1dpI=;
 b=dPYzAkJoz5EcC+bmYtA/FuBO/NnV8tnIw6pmty6NGZ3sd0qJL4IyKPX1WPgf2MLsMLyVwgf1dq0DzO9zaJ3lNhUeancpXroXgrJu6E6nEKLVLnvL0MJY/72RVM8d3R8RvU9RSih/w7fCbNsf1eR11rQg2OW7Sc8yotNQ+Qp4azZZqemgE3ZJSS8HRW97Uj8Gr8w5QnKT0RlbGpz8heN+3WN8EsKOJkNpxZxQrqaWX03KIbqzSEd4YwHK8MSLeb7mTeo3zkYBQyL+xnq9qUSt6qC6YXzpMmTHoFo/HAf7YidVJm85za+OKeWoZ0i5hWkWHeFpmavDLeTfokjBe27a5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5117.namprd11.prod.outlook.com (2603:10b6:a03:2d0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Wed, 17 Jul
 2024 19:39:00 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.032; Wed, 17 Jul 2024
 19:39:00 +0000
Date: Wed, 17 Jul 2024 19:38:10 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [RFC v1 3/9] drm/xe/hw_engine_group: Register hw engine group's
 exec queues
Message-ID: <Zpgdoj5gt4EoRDMT@DUT025-TGLU.fm.intel.com>
References: <20240717130821.1073379-1-francois.dugast@intel.com>
 <20240717130821.1073379-4-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240717130821.1073379-4-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR05CA0200.namprd05.prod.outlook.com
 (2603:10b6:a03:330::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5117:EE_
X-MS-Office365-Filtering-Correlation-Id: affa6471-36ed-49ba-1d95-08dca6981b89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UOrzq5W3XhOCiROQ3no0EFb4c9DB8S0ztNbPYjv86vyK3q+PsMyCYmvIwtFx?=
 =?us-ascii?Q?TzAoYSzP8GvLvV7dPMkvPLir6H7/J0yUIHAs1nYMwnxwQcaVAP3gcpaYDsd5?=
 =?us-ascii?Q?A5CcR4qLVh+hMfd4ojO+E6Z+AjlDIVlp17iE/3ULbBXTbeYwY8F4hLBIuelt?=
 =?us-ascii?Q?5yEZ5T8HNcpqQfkC5mVDiIgG5cx/7e1W1BAfzV0wjzJJt3P+A/N+JQhIWRxr?=
 =?us-ascii?Q?vazaoBaXDgfgUHX8Dg2uR6kONsmMBfRDZwplnw64DrX5arqU2qzdIkBXX46n?=
 =?us-ascii?Q?Y7rJoGNZFzfV4nuIAJ7IJQu+2p9WM4n89/tYMgMxRkC3Thg/BnFIQ45KvNnp?=
 =?us-ascii?Q?LfPVqN7g9kawMveX0hPsOPHyqD17XYMgqQ1ZCvMn2YudezRPnUJrhFpjo5HQ?=
 =?us-ascii?Q?HTrUdJDJ4fn7tiTLrxsk7z/saZLYDLoWGD5F5+AdavD95XwIAOs1BD9YafIJ?=
 =?us-ascii?Q?i96CUxUGFAsy9xiP72Q+g23HD7iE5WtcKcw3Ih2X7N9LdlO7Js+F2SgxQP7h?=
 =?us-ascii?Q?LKMGtz7mwmI/xU6dmsPF8Qg6WPq3gfu0coRVKCcpzrWBwdzHdmd1PdhVgeDD?=
 =?us-ascii?Q?xjwYY6uo3IITxAypUOkBU1l1Orxs8Ez42dBBofWHeZdy94IHgWYjxPH276QN?=
 =?us-ascii?Q?bsqUNuzrYPuGyaYsgWmPfqBUB47bSGfXMohxxq/YAhqHf8D7kbKDe5kRccrN?=
 =?us-ascii?Q?WpR8H+JbI3+GwVCBgx7a7YgzQnjWXjJvh+NVIQ3A/xBS77cYiDOfKF+Ovf/p?=
 =?us-ascii?Q?6UvXIKc1Q3e46sjQf4FpbKXtH/sBKJVXlcoxnK6H4rNP6FwLynCfOouehwzC?=
 =?us-ascii?Q?v08ilx4WufJUByxf0XN3sKlU4mMFg1ffe6dIgCFBJBCSTqYj3FVIT4wrGlDg?=
 =?us-ascii?Q?ZG3exc718zOIwbAtjUZW1rrDMf1hXupSFb1lle9ZHzpavLMo9qPsA9o7quGZ?=
 =?us-ascii?Q?+oVezdlgI1Cumw6xInLEPOmNzA9GYBkdWzVl76TSEnL6nw66qbAzo2GVvrAz?=
 =?us-ascii?Q?qVaT5MmXUsAP9WunlTMMb+E+gZAJT0MyKeUZsRNHh35vI/PvvnXZuxC4qcjV?=
 =?us-ascii?Q?uw6ZAjFa6+GCLALblUwQfeR2mdvzmRgUa+d9uJwqU1AotH+lzSK99HK5F5dt?=
 =?us-ascii?Q?iPb8XBzSU6lfKEu3CzHPtUWAVplu8ESIzI6jdN00mAV1TMkLHWItLu2LfNeE?=
 =?us-ascii?Q?s3AG7yce8iw26tFQV4abZqVtmzOqFolpN+3MhB8RMoPuVTUq4twhdKqJ4YVu?=
 =?us-ascii?Q?dGQH70XbScf2cOCeSvcE6SzaOgURYQ5cgpMOPpWYLDNlv4UqmM6P28VkMIeV?=
 =?us-ascii?Q?j/w2AF0A311tRMSjrXY96d+ObfnznvwguBe8H1tsyCBYvg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4lloVXH8aA98bQQV8zM7MsyrvMuVMXEeRXJnyWgVU4d4Pzorvii2WntFlfgl?=
 =?us-ascii?Q?rfEWjefJwTsThNxsoewsWak/YOczNVMkGG4HKHUoodwauitmnZwm7WfQap4f?=
 =?us-ascii?Q?fO2ique5+r1wsRiURS/PZX6CivInZwrvVTTedFcPAwGlqmaKU62iT37cdQm5?=
 =?us-ascii?Q?FJZ/jFLzS/Cej+9+YfFbzzQuwm1gqey58m+PRzUnjPQNcxkGOgfvodtcRvEG?=
 =?us-ascii?Q?HMXIYHjwrzlTIpyVoXE79QUG7SMpNQ6aefEUS64z9mwB0YPaSCiIYbtxM2lr?=
 =?us-ascii?Q?xkT+p6IA64D0CCmDpG6PqCndUcqGLucHncq52TjPVZ9eI7Exha3nyW0ymHRo?=
 =?us-ascii?Q?rvH+WjXZap94RvxN1Rcl3JNer5ZlikPxSIGxZfq7qIXURF0EbUcP6IgiZWqC?=
 =?us-ascii?Q?TizRNwkpYwnVjm+CgWpSFlR/y+lsPoMJN/WDlKu+RHXv0JEyyWVmsO4wfKhD?=
 =?us-ascii?Q?UUVD6DXsAUxkf+XJ0qSSQLeBPX4/9K+PFtaXjSf+6t12FXQWbJwreuy/17BJ?=
 =?us-ascii?Q?bZ2Er/mxOleK+q+RvC30YKb8eWZDyKnYlRCD8IpM8vBX59puUrVG4yH8Iud7?=
 =?us-ascii?Q?T5B4jNFnn0RtC0wiz92n5N3sRBC75C0voJOPWinkpeBUexkwHqnRC5S7NQhA?=
 =?us-ascii?Q?n79H6qDwpjtwOd2JBVoH5sBNcqwp8fB1jiWW9BEMU6D28Ls6iGmIU6r2J52b?=
 =?us-ascii?Q?p4gSyny5Lus3b4xl7X2fshhfIdq0rz0KROBC1cKb7nqgTfkrQ4nn5LCnOtfH?=
 =?us-ascii?Q?NTBy/lWRJntvMUB18Z9L42t14GLTe4YJidt7ZvlD1mfBMtDfhplwAAq1cgKh?=
 =?us-ascii?Q?+xRyIkBTkg9AyPNoJLoje8JU+0xnT4pdIf+zOHpLV76NVxY+cVYkzJocJps7?=
 =?us-ascii?Q?i1EugpBvAhbRFLvcD4A/hbFoMpdrRyb+xdIMN7HaG9icjpDVVyQwy3sossWk?=
 =?us-ascii?Q?MyxRDnHFVNn6rGcWlNERNXhIfUHZJ+ftWpWncs9Zowox98fCERwU67JBAqbB?=
 =?us-ascii?Q?F+lAr2q4ORUfhItnlbLudYgR/s91i2CtZXm56tvu9TGUSRWb97JJwk0Nb8ax?=
 =?us-ascii?Q?SZqfQ3EAdDFlg8ijxFPtEqzxf+OgVBj+g4EyNUWAUodGd7JK1VJWb0pc+iEk?=
 =?us-ascii?Q?YhHsSdR6t/aZq8XmV2Pa3QrA03/uUd/u7gLU/uYoVLRGrpy2YA8kDQWDD5e1?=
 =?us-ascii?Q?t1jczQfKry+VDsaOqQuCjrBOh8V8d719qy1whFGC6Y/wrpMCGDBv1PxX5sJt?=
 =?us-ascii?Q?sXEBeYx/4Rnh1vxR01eH5in79Y6YovYI+Zm38mPW8dnY/Gz5UepbHjtm/HC+?=
 =?us-ascii?Q?b7csfvD+aaNBd+qotHKfesxPrH8rwoWJg2qVRJvSdSswbbkcG5EncWM0Y+Kd?=
 =?us-ascii?Q?HKZFeRrzU42Ak3oCiqdXc/EeanEwOZ2A6SbzF6YkU4tNWhHEt5MCmfIaUpuh?=
 =?us-ascii?Q?rj3SI+uACRcwHpmoaOqBNndI/FvPpPg9637iub4nXQSJ116Nu9XZOQfnnYPv?=
 =?us-ascii?Q?sSkBE/FlY+gmN05EI1c8AjNEjf3nBAzakfoVG2cTkbDFK97Bh9UON2K31uuR?=
 =?us-ascii?Q?YbtOj1VnHVn2pNMWb5eVT3smf71VY//jN+0zdPbMSJRwkZNr4fog0xJi1v01?=
 =?us-ascii?Q?eg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: affa6471-36ed-49ba-1d95-08dca6981b89
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2024 19:39:00.8090 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oWEk4DKoE2zIWc+Z6LVbwZ6vFCUEM4Rr5BeleEX/ssGrONJ9BS3RpN9cpvKuMndJndAN0N7IWvTIh7wBTsnhrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5117
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

On Wed, Jul 17, 2024 at 03:07:24PM +0200, Francois Dugast wrote:
> Add helpers to safely add and delete the exec queues attached to a hw
> engine group, and make use them at the time of creation and destruction
> of the exec queues. Keeping track of them is required to control the
> execution mode of the hw engine group.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c |  7 +++++
>  drivers/gpu/drm/xe/xe_hw_engine.c  | 45 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_hw_engine.h  |  4 +++
>  3 files changed, 56 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 0ba37835849b..645423a63434 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -192,6 +192,9 @@ void xe_exec_queue_destroy(struct kref *ref)
>  			xe_exec_queue_put(eq);
>  	}
>  
> +	if (q->vm)
> +		xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
> +
>  	q->ops->fini(q);
>  }
>  
> @@ -640,6 +643,10 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  			if (XE_IOCTL_DBG(xe, err))
>  				goto put_exec_queue;
>  		}
> +
> +		err = xe_hw_engine_group_add_exec_queue(q->hwe->hw_engine_group, q);
> +		if (err)
> +			goto put_exec_queue;
>  	}
>  
>  	mutex_lock(&xef->exec_queue.lock);
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index f8df85d25617..4dcc885a55c8 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -1178,3 +1178,48 @@ u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe)
>  {
>  	return xe_mmio_read64_2x32(hwe->gt, RING_TIMESTAMP(hwe->mmio_base));
>  }
> +
> +/**
> + * xe_hw_engine_group_add_exec_queue() - Add an exec queue to a hw engine group
> + * @group: The hw engine group
> + * @q: The exec_queue
> + *
> + * Return: 0 on success,
> + *	    -EINTR if the lock could not be acquired
> + */
> +int xe_hw_engine_group_add_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q)
> +{
> +	int err;
> +
> +	err = down_write_killable(&group->mode_sem);

I think it is overkill have this killable, but fine leave it as is as it
ok fail here.

> +	if (err)
> +		return err;
> +
> +	list_add(&q->hw_engine_group_link, &group->exec_queue_list);
> +	up_write(&group->mode_sem);
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_hw_engine_group_del_exec_queue() - Delete an exec queue from a hw engine group
> + * @group: The hw engine group
> + * @q: The exec_queue
> + *
> + * Return: 0 on success,
> + *	    -EINTR if the lock could not be acquired
> + */
> +int xe_hw_engine_group_del_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q)
> +{
> +	int err;
> +
> +	err = down_write_killable(&group->mode_sem);

So here, I don't we can fail as this a cleanup. So 'void
xe_hw_engine_group_del_exec_queue' and
s/down_write_killable/down_write/

Matt

> +	if (err)
> +		return err;
> +
> +	if (!list_empty(&group->exec_queue_list))
> +		list_del(&q->hw_engine_group_link);
> +	up_write(&group->mode_sem);
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
> index 7f2d27c0ba1a..ce59d83a75ad 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> @@ -9,6 +9,7 @@
>  #include "xe_hw_engine_types.h"
>  
>  struct drm_printer;
> +struct xe_exec_queue;
>  
>  #ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MIN
>  #define XE_HW_ENGINE_JOB_TIMEOUT_MIN CONFIG_DRM_XE_JOB_TIMEOUT_MIN
> @@ -70,4 +71,7 @@ static inline bool xe_hw_engine_is_valid(struct xe_hw_engine *hwe)
>  const char *xe_hw_engine_class_to_str(enum xe_engine_class class);
>  u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe);
>  
> +int xe_hw_engine_group_add_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q);
> +int xe_hw_engine_group_del_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q);
> +
>  #endif
> -- 
> 2.43.0
> 

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE661CCF9E7
	for <intel-xe@archiver.kernel.org>; Wed, 25 Sep 2024 16:36:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C96C10E102;
	Wed, 25 Sep 2024 16:36:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O8UdN5DH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2A4710E839
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Sep 2024 16:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727282196; x=1758818196;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XA+I81zHHlxeRyUQi9VdlzNYZ8Pvie/f9t4eGPV7ugM=;
 b=O8UdN5DHTeBT/fQsZtFlKnhsPXTHe/PGrPyDigX6Vjc5SIunxWksDGIy
 4oeUMIAA8iPkhnL8T6ZaK1Bu5wh89TUFmABR9BxyCsURXo4EmH9GE0Eub
 A97WUDmDE9kEr25Ifl/kJWSzf5KO3BIQRBFYyVQxnpf9X5PmRQkzwFRR5
 q7oECpQbJCsZhMphqSlZ1V/mOVrK35swBgOYetlDYNC2z8Cg2T/0FtnOP
 K94j73w4RP8udIPE+bdDzLjfGQRlMVM7ccmioMvz21jpqGy5KvzQW5e1o
 cSNNxf8zxB/Aa09ZZDt2KzNkeheQbXQWtwJDxqqNEygczOB9tOOfIsTWv A==;
X-CSE-ConnectionGUID: y+Cok9ZxTByY8pZRaX8ekQ==
X-CSE-MsgGUID: Yy9DG9srQGuxC5x/fn+EjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="29230584"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="29230584"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 09:36:32 -0700
X-CSE-ConnectionGUID: MPuoi9rGTwWPFJjSipYlCg==
X-CSE-MsgGUID: FjtT/rNfT/ClpDtcZP3yGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="76346361"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Sep 2024 09:36:31 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 25 Sep 2024 09:36:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 25 Sep 2024 09:36:30 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 25 Sep 2024 09:36:30 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 25 Sep 2024 09:36:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I3Rd0YgOPyyipalHpoRrrK0NTjmQqSVDG/JMWf+fk10hCbKPPDMdE8AkRGqtbodDF1cg4FKJGUskXpkrKrc7ZOeZ9kvDvEL+riWWmVMLEqNZ0i9jHESl4kHC+rsX9trcRJ2APr3MdhOC9CAP7SKu6RdCAXDM9+LsS01qvg96ydaiV7rySQvBlhVuJ0zbAjaqoz4DuPZOr9OWiw+PYu16wwbw9xQM0R/PsiyDfP3M3ywt3AxqksDXcJB7skqTz0knlVA7O2tWBh0BNe17xHg4NhBDo5/p1PdLxEh+DKgv6V7u/qzWkl+jSkX1bph91EefUVm3qleUGkM12V/UXpYqFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j72MFbvaoZhPuEAZ2Sy6rSh1ITM631fn8HkczNEJn+0=;
 b=E0d9eGyUpTuAbBZLJu+VoHLhcMW8HXR1raCwNclc74r/vrk4ZmlnLuPu/42TFrqe1GcWhIWL6y8OMfyJ9eW2GX5Nk/C7Wx51omXJM/npKP7mwBo5/BuA3LwDm8fd4OyCkMOHDPgUnRw2hHZoDhI2CWpNinuknIaQlln49b3xA+dR+B1JV2pv4tQJDTBDrngAP4XKXKSGLuP6wD2f9b0tYbg858r10z7UNZTTZ0MZXQpA1XnfFLSF0NoRox2M7KjwrWL2EcGD82qxlpSTJOrr4c318stYpbbNTI5Q4D9ZvOXRbGo5RgrPheWJq3ESjA/nMyaCIc+fCs4HFJBgdnFoWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Wed, 25 Sep
 2024 16:36:27 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7982.022; Wed, 25 Sep 2024
 16:36:27 +0000
Date: Wed, 25 Sep 2024 16:34:22 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/2] drm/xe/queue: move xa_alloc to prevent UAF
Message-ID: <ZvQ7jlwT7Up1cWlH@DUT025-TGLU.fm.intel.com>
References: <20240925071426.144015-3-matthew.auld@intel.com>
 <20240925071426.144015-4-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240925071426.144015-4-matthew.auld@intel.com>
X-ClientProxiedBy: SJ0PR03CA0171.namprd03.prod.outlook.com
 (2603:10b6:a03:338::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ1PR11MB6129:EE_
X-MS-Office365-Filtering-Correlation-Id: a7181c4e-7337-42a8-ac72-08dcdd8033e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?G4HxuTdcchm2R/7spbidiL5AE2L4tvZxucYrMItihX+mU8fmOMcsmh95SrR6?=
 =?us-ascii?Q?UMCFj1HHPbyQzrerrIYdDJtpmOUFX7WNuUTyhCUPGi0FXMnqUMzu144sfYLa?=
 =?us-ascii?Q?st9xaljirRPHN9KzmGwUr3rNY+RKJx+dKN7t45GCAZPgLEtshDpi+NXKCoAp?=
 =?us-ascii?Q?5rQpQijzlMRiYNcwgSVYSLdEYhBwjdI5VZylOxmWmGg2ozhRMSU/8/o8KNvS?=
 =?us-ascii?Q?CspASq7iw3Xeoi84K9xUJeAsPELwvzklPk6MjxubtlGm9qttvxeQUDytZ0Ts?=
 =?us-ascii?Q?A30hX3MfDUg2QIE+sDjEVY1IrUjGlOS5t6IHBU5DMtX9FzyBZ/4G8uxW29TE?=
 =?us-ascii?Q?RV2fkrYZOyQePzwQn3Mu2LAxS2BFtC9ZnJ/e3B41UmTC8IQyRKepxIygMwbV?=
 =?us-ascii?Q?2qQFfUkzgjbNjJsup8TzznoEUHtshmiYd0Pjv0OO63PPYb/+Ex/99iLWAa8z?=
 =?us-ascii?Q?oLD4gaTI/2JkCRpyoGwh9k6qe9UX+4s0qiyVwAIwiHAP6HcnfLA5KdSKTdHs?=
 =?us-ascii?Q?deUZU204oi0rIZQ+UVappvxoxBy2d6kX31yEnJTFs6dWAYsXJT/e7jEC4Duj?=
 =?us-ascii?Q?GmAaDIPpc540l35QU4jzM52wgIu88Un+5/VQ7jcG6F5hXTJihm1NmEpCKd0E?=
 =?us-ascii?Q?elgbwBPgetDczv0QK7TmMTAT2ZZFxuSSacOf4MMxNeLS3yrBzMBZvxVysCql?=
 =?us-ascii?Q?uRG4nYc197Jp37IOr5hrJ0x/BEYqyzbS1GEbrNlLswLXhiq0aQCgTdA6f+Q0?=
 =?us-ascii?Q?DHu4O8U7Rl4JCy+T3RsFuKv51OVhEhOTBfIIJKv2tkfOWztNEDZo///XcQGG?=
 =?us-ascii?Q?Y4KfNB20oNKpJXGYwd75788ldpeoVzMUDeXAh4QnBhbK5oF2c5VN8Q/3Doem?=
 =?us-ascii?Q?TGoVPO8lnH/suBs/5LM0PWsYJ51KJMozqkaAil0f3tDsIKAMhgsP0Y357Q9a?=
 =?us-ascii?Q?epz8y/ctCQNoBCddoKcMgNdjLYooakx+iiy/UvsTLy53J661S4AvdO+5R8uB?=
 =?us-ascii?Q?NpgpsDfC8QgCLbmdHLDxvqcI+Z0jb9UIa2OsoW7W5FoPF5Pt0d4E6GHySPxs?=
 =?us-ascii?Q?gZRrE8dJ0Ors7dQMQX/leoVjG7eSmJJ5HilyY+96nk9BtFlYgalvhqEKGGOT?=
 =?us-ascii?Q?pgBFBybJWu2eEoXtezMsD9e2stia6QZFCQNb5oR+QjVzAGd0EWrlZsUKz5MO?=
 =?us-ascii?Q?xeLmXuBNIPWrrYYlvSJcLZGhpFuYV2hIV89J28Q7Fn4DLfHksI4PJSdZf3dg?=
 =?us-ascii?Q?sC+E7Vm1yKs2ww83MID57JYFgyQxtiJeqJyUKf3/Xwx5brabKPuAteBaqA6b?=
 =?us-ascii?Q?K+xDfp5H2BrBpX9QkqQezp1P+dCo5EiKTMEZt3a9yzLGoQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dlp29KuEfH+/8/b9WYdjKt9gFuTXIQmwUInVWwyfQvwIbMIIQhQeTJpwTu/W?=
 =?us-ascii?Q?QXs02KJKgJjFUix586+foC0E/OLoioE6D6t170/2oHcdMxxGE3TP+Fp+MoGH?=
 =?us-ascii?Q?rSI+ONUvgeSI9lXFzDvfAFIhsxnQCsDrbzq8CL6gIrs64lEC+mI5Fh5QT/gU?=
 =?us-ascii?Q?nDJLIMUwI8gdKnX15UhR2Jaivi7SWIWfArUUxjfHDIt11FiL+rJSPghyM0lI?=
 =?us-ascii?Q?HZLkBsDbdVQjNAA4uYJBSGcj/zJW9AEcrDPvbhwrg4dnU/TP2N441HOnN4Hd?=
 =?us-ascii?Q?KXKXDPCRg0idKCRT7NP1VYuwnT2tfFJzIU4uR7rfcu+CEqcDBjpqbEGlTBoI?=
 =?us-ascii?Q?iaJCA+4D2ugvnDODEQS/WnyfPWPYkgAY4r4V92YEuZbV0IkHhGjwqIE0QCRJ?=
 =?us-ascii?Q?+4672yFEUwgr2UI305A+cG8qxPanL9jat8T/lzBghlSPkGLqILiwB7z4qN0j?=
 =?us-ascii?Q?nBFgiTaSgc5pg5VosSBtAPuswWAkTZeGqqj+UHdnO9KuI8wl6xU9drujoxPH?=
 =?us-ascii?Q?vLfCDNlLOv5qrYdXvVBHDi7Av95AmfxOsNxwEMy8tSE1BZEVBszvkPvKwH7V?=
 =?us-ascii?Q?hwofM2MyBm0TQ9ZTDyOBjZFKdjPxplQoL4amW9hq/ht5+osaaRgFFx+b8uDq?=
 =?us-ascii?Q?KvmzWBhr5EN4vQ0U5GuU92ivxZhO75mIdJpN1iZ2WehCO7C7x7G1+C2PKSxL?=
 =?us-ascii?Q?KViw0vznsECQpqVmiVi3bm23Hs5dhIJUBpKbGYq7RgmBu43gbhwV2YgUWxZ7?=
 =?us-ascii?Q?nZHnOIJq8GhhbLEOF2pXe2054DES6yvCUAmbpSmwRnE5dy/ALSMWmLvoDQF8?=
 =?us-ascii?Q?WIOakVeTG/Tm6xMbfwXWeW0ftCIX36ILEXXQXFOepyS43QeL2Zy20bsM8V87?=
 =?us-ascii?Q?DEEdLnGjVECUBnU7DU1PBeG2RSpf4uAJgglkyMh4JGGGE9GigSaC5OdSFrfT?=
 =?us-ascii?Q?wILoY+if0Hb1Shk0E6ono/LWUNHuRByLY5tbhhGW8mKto3KRY1Q91+klF3Ed?=
 =?us-ascii?Q?Wwz2qeIg/8MVfpvRxwi63kJb1kHHanKJSWcALY6f7186KZYttgV0b0U8f2JN?=
 =?us-ascii?Q?IS6yCOREBtgKv/OCMZjqel93x2pVgMQueJOJhkNWjEZcsYCzLDB/9i3+r5RI?=
 =?us-ascii?Q?sTf/QLbwnZnOQvRq12dlOQkQZO2SIIkL8IWmsE4+vXSm9YQgcm6HZihdE1Tm?=
 =?us-ascii?Q?+sccDnURZzyTPzVbr+UklEfWXSG3XfT6DpZcJyPMBGHNyLpQwzoZvVyuK07T?=
 =?us-ascii?Q?5Or47drlofDsMHRpr3ArrHWa6U3IUUYtq5lJHzhGyICQVvtg+jK+DX2Pp02B?=
 =?us-ascii?Q?KNhJzJIVmxZDJwLd77m1amIIpu4LA060buQvuyIs3sEFS2EVdcX5AxcK/+le?=
 =?us-ascii?Q?z4veVG5kAqVewCBN3FiBQ+xbIVkYWemAEjhPnxWvdoFZv3OH8+Z4AW87X6m9?=
 =?us-ascii?Q?cso5UH4bNS2MKKcZ0WJJNUhdnIaD3pdGYeT85dxcrwGbZ2YF3yZpgu/sTmoD?=
 =?us-ascii?Q?0mvuVMCgF9YHQpRjth1TFcEq9NJ5NrP2j7npr7rdRIGdDfkQ1WLZ7MBilNxR?=
 =?us-ascii?Q?WSiERg6WtnvlULQhxffYLBwXGuctA3fIA+aTJs+in6UB7L99OaWjSmwCjhAl?=
 =?us-ascii?Q?+Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a7181c4e-7337-42a8-ac72-08dcdd8033e1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 16:36:27.6761 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1rTFzZnjpD5a/J+RTMkeskd5dVX0s42VE5S5QNYoGrlpzSblCGtm2bgGOUNKSwcLI18CzFp8IT0E78vQ77uHmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6129
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

On Wed, Sep 25, 2024 at 08:14:28AM +0100, Matthew Auld wrote:
> Evil user can guess the next id of the queue before the ioctl completes
> and then call queue destroy ioctl to trigger UAF since create ioctl is
> still referencing the same queue. Move the xa_alloc all the way to the end
> to prevent this.
> 
> v2:
>  - Rebase
> 
> Fixes: 2149ded63079 ("drm/xe: Fix use after free when client stats are captured")
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 7743ebdcbf4b..d098d2dd1b2d 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -635,12 +635,14 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  		}
>  	}
>  
> +	q->xef = xe_file_get(xef);
> +
> +	/* user id alloc must always be last in ioctl to prevent UAF */
>  	err = xa_alloc(&xef->exec_queue.xa, &id, q, xa_limit_32b, GFP_KERNEL);
>  	if (err)
>  		goto kill_exec_queue;
>  
>  	args->exec_queue_id = id;
> -	q->xef = xe_file_get(xef);
>  
>  	return 0;
>  
> -- 
> 2.46.1
> 

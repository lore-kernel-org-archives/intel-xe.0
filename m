Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4043D24459
	for <intel-xe@archiver.kernel.org>; Thu, 10 Oct 2024 23:02:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2B9810E151;
	Thu, 10 Oct 2024 23:02:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UczWk6Q4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 044CA10E151
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Oct 2024 23:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728601342; x=1760137342;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=as+Opz8ue9qX5YVXk8c9RdCvKDpvC6F3EGhLuuvE9ss=;
 b=UczWk6Q4Ye45vnOeIFlTjoGgd3a8kveN7fTi3nGILqjDIUSP8gxkjicb
 dR+YfDAIvjCuwnF/+iDjVGbl1z/nBGmfXgNirC4M+VFOPmI0WQQs9Vabw
 IkC1o1fcGoRQJb3vhIQUSfzi0H3RVZQ/k9gAR02uVTwoicyNDjYLHB5UM
 x12KgfNW0TsG2S+Am473pR5OApwectYcZsQp9sl99P8sPCvzBoq2Tsi11
 E3SQugzU0xpHiPUKSpjoZPqorxP4Ny1yXEIcLoNhDNceRrrMH7vjB3Dpb
 nKM4Hj1d7NZ0anrXDdSCAR7HikfkgkrmXcZh9aOnFJG40Kyb9khf80P0D w==;
X-CSE-ConnectionGUID: k5XPWk2/QgG3BiDfKXGgUw==
X-CSE-MsgGUID: kFOQFgcVRtWjI3uoSmeKDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="27455518"
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; d="scan'208";a="27455518"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 16:02:21 -0700
X-CSE-ConnectionGUID: Ze4eDG/vTaaqtA29dQRipw==
X-CSE-MsgGUID: IRwnbXf/TJ6ixdB4bYS96Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; d="scan'208";a="107599043"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Oct 2024 16:02:21 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Oct 2024 16:02:20 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Oct 2024 16:02:19 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 10 Oct 2024 16:02:19 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 10 Oct 2024 16:02:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yxO4b5Cn16pUSkDddw826n2ed7Dre6X/honpfOKE7Z71O7BPCBkri7i+otPgqyuv0iF3VBilNGhRqAw4j6bwaKR1YFbNPrkNJSJ9aeU7GoqexLdLoA7x0t0DqbALzDnBB4SbClENIFELS9y/uxSqrCLaxlGPipwGPzEDTiVL2mTwhUXHPsCMdW0sDGps4rEl72SG/OgQDLGo8KeHaowfbtGmTFMVVGU/7EDUpQZhpHlGt2rgFDXYmnU+LkSS88emTvfar2tpzmeHx38wRlYu1tgVTnECgSzdDoOPeQjYplmVJENb2PXcEjNkz47QxF/Wl6TK8s7iWXdg2xkZPHT5ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XdmqS7WQXj7I0w69oq421S1iUT6irBvDnUbCvxUQGQ0=;
 b=FvG1c8F4A1f9YsP7LXzeRuTAWtu5UaIAB9G0H498/yN2I+BUr5FbUVtUiAJvTtVR2R858T3V50z8xTpgCiRVfvhuv9ae5PQzfv/uGhRgaTSv6fvz35yam03DzO2orEq/6gT/ZYU+p8jPuJpY9U967n/DoKTpm+8bJw68jmUYuw16jfZXzpROzBI7QAYw6ugqfMh+/Qs5NXjG2dy/I3HpbHPu6Zd7MMj+EEP1aks6Y52KPsmC2lvcN7K2xj8AhUUNW8vYW6LIXa3kEVwcfPwBQB7dXAHOKx18FRqsKqUttB1wOPA49eJE3/vFnJJzg7WQkalWuXDsh2CAjWeHKsoHuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA0PR11MB4606.namprd11.prod.outlook.com (2603:10b6:806:71::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Thu, 10 Oct
 2024 23:02:16 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8048.017; Thu, 10 Oct 2024
 23:02:16 +0000
Date: Thu, 10 Oct 2024 23:01:57 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <john.c.harrison@intel.com>, <rodrigo.vivi@intel.com>,
 <matthew.auld@intel.com>
Subject: Re: [PATCH 1/3] drm/xe/guc/ct: Improve g2h request handling during
 async gt reset
Message-ID: <Zwhc5V5aQDSbhBWN@DUT025-TGLU.fm.intel.com>
References: <20241009105645.1416588-1-badal.nilawar@intel.com>
 <20241009105645.1416588-2-badal.nilawar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241009105645.1416588-2-badal.nilawar@intel.com>
X-ClientProxiedBy: SJ0PR03CA0075.namprd03.prod.outlook.com
 (2603:10b6:a03:331::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA0PR11MB4606:EE_
X-MS-Office365-Filtering-Correlation-Id: e011fa99-98ab-4e47-bc93-08dce97f95df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?S8Uxv4vSGGqB6XWsAkDQlxtLIiVM0CIyMRbHePo6FQaPc9+JxO8zirAmTjlh?=
 =?us-ascii?Q?1ADFZKhg5qVmAP2iNKT8BoYTLE6cQJmklbJIy/hKm+AfoAob2MZT+Jh20jtY?=
 =?us-ascii?Q?ZG3IsBsJUKCQDd/8g/jAmexJNIYxFZJ4T204h3skKEdHpI4Mk6v1Cwl17sss?=
 =?us-ascii?Q?xVs/h7spx2yvduEh3KuJ9eIr3imeJdAIxXXMygJT60rrIbljXrUF24tiWQj4?=
 =?us-ascii?Q?rb6QNRjrvqDbNjwoYLcaNsMHtMpdvcHHbBOCi6/oCCEIylmxIUPo0CoagzDW?=
 =?us-ascii?Q?IIywXfL2MgmV7Txa0k/OSNTgnUHcH+owrdoi+xDGK7dVuntJ15w16E720Eoq?=
 =?us-ascii?Q?hhjf6vHpY+xqF9G5x4Q5xlSe6mDBEOlS+5TYU/zuPF+PUlpAa4ap1dshAU+2?=
 =?us-ascii?Q?2WUwAJBgAmQyJu3v6CyPsD9RrOIL1uYI6WprZZdDibhYh7KuTw9VH9JXV3rI?=
 =?us-ascii?Q?6Npmq/5V2rSFrAr/XJACNl7a/RkR83WoesZCMUWLbi8Jb1wJ7RzHlnmjq+1h?=
 =?us-ascii?Q?MoytjPdo11uLuMxbuWJ3EFF9WZ85gexoTx+hDnbLtctyDbQZUi0q5mw04hpT?=
 =?us-ascii?Q?Q5RYa8VHAYXj0FfHAwUDJJBRK8LwJk3UqY+1SqtQBmjxRH6mN6yLcN5JhhIX?=
 =?us-ascii?Q?Lzl6gG6wqR3Lw+GELvVCDuYdCuV3p4yU+AMCnf/crjS/GGA+cP/rA3URWR/j?=
 =?us-ascii?Q?1wUxermyNkjsxO1aRIBejO+4efwqDxWCylGmeLi2a179H+6FyjM5U+Ro+0et?=
 =?us-ascii?Q?bkzZRiy/EAbCIqHz9jIzx4Vi4umQoTv7D5tvqDRUAOtnqbSPvdvqw/XHdgRL?=
 =?us-ascii?Q?nK36qf3Of04aTxNlbWO6gEl6IDAupjrAGjgU4ASqAx9GvKbApocA+LGS85lJ?=
 =?us-ascii?Q?MZb4zaB0TgxQkQQdtsX8iyr+wOKgnNhpLHeOcZ1L/0TKzbVeBH2bGkh5rojo?=
 =?us-ascii?Q?DmCg7xPUhzAmz/+W3ifna+hOMQEC5pWkF344xr1bQx3p4cQAebWue8gZguMW?=
 =?us-ascii?Q?ugCll5D1QmvI4TKe5AK8r1HjidPtexmL0ryRrTCSGi1AvdpR4pEoUaf3HSnJ?=
 =?us-ascii?Q?ZM4lf5q52Y+lE+42y8rV8XJzz7dgeDPsymK4Sr+h5v01HxZL8yIOG73bQogJ?=
 =?us-ascii?Q?2OiscDdnVRvZnIrJ5z8muxGtRXaRcvqU4RgKdG5KGG5YoctYUw30euveMU9J?=
 =?us-ascii?Q?v1UJrcP9Z5e97VzR3ZbWUEmpgMgCiCRGQxFfhFiH2FupcXJPODv8uzFLWrzm?=
 =?us-ascii?Q?xghC2j57KIv7K9ATXS52WvqA0kHi+HBx8eVRptDAPw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JOPHxPBWYLFI4ltj0m4CUEbp3YGXUSg8zsYU53t/C8xbmxLV7EHS/OxB/s6e?=
 =?us-ascii?Q?L+1TbgowaJYn4h6QQJHzOSSm81usEB1i60QjWvXgIaBkpGE1peonoXlAPjcQ?=
 =?us-ascii?Q?46XAdM1ed0MdPt3CA+0+qTmxfzKg6jVg0k5woCGjLHGt0GV4SU8Zt0B45i5G?=
 =?us-ascii?Q?dAnLhsiK17X/AE6OD9qA8kvtsmbvPpKUsC077Lx+mjXY+ubcCkmk4CQklmaP?=
 =?us-ascii?Q?PzBqmyDnnjStbk5PtzQPBPST4PDEohUG6cqjeuvqhs5rdxe8GaYE73bAzAjY?=
 =?us-ascii?Q?0mfsAY1Zll+lnO0bZyKKOCNUxSu6ELJnVKN18/uKmqD62VqEXcL6yxZF6weB?=
 =?us-ascii?Q?V+1xYLGMAWKarYdVRlzC68HtkkgjRh3t+8XmQ+ES4ZKE0KY5Hrxr4KgM5BFu?=
 =?us-ascii?Q?lPCj7Zf4StfOqlRtIbvdx6cntoyi/cjwc5QtPYCQ1WmNIAum+djrL4Ga4wMH?=
 =?us-ascii?Q?4qFvf4kEwGr5k0nrKkjKEtPuNUyHBKe8y1gs+MVtWZ2ZTc1h9kG3vt69qDT/?=
 =?us-ascii?Q?C5Wau1bP3KQS6jHb/6YQR6h6yx3gtWJhEPVDamKHq32AGGQh7dApnnfX80MS?=
 =?us-ascii?Q?0dBiKxKXrIFhIcJ45w1yIpOlPRKyoAIQAe1/7J853xsBqe/RmHcXVEu2BuDR?=
 =?us-ascii?Q?E9UkkzLPyJ7uA0HqrqYA8hvs8shLpeVWThWfc0jbWVvyC5/S1eX4R2LNtPpp?=
 =?us-ascii?Q?yZiY3ZvLdXka76aYmA9Gx159nF0VsdOgab/wqgmsXdH/pM2rhQ/ikeoBy/uh?=
 =?us-ascii?Q?ElmInTOr+6tt7IViCNrN2QukSOzvBcp60IZm6849a+hCWxJWBpy8aEQrYYFx?=
 =?us-ascii?Q?kjBLqA4oZintvGzCE11/v4+0mGMOZaF/anseubGs0k2ElOARW8UJKPn5c0HW?=
 =?us-ascii?Q?GHGA1n9LXqI9X7DLDEJSqG7HpuefEbaI9FXdDMsP2ZLJj/FjNsOcnPRjg/Ja?=
 =?us-ascii?Q?/r0Kh9u2CLlj5sO3Trq9h+N7XkF4/wBWegEqBiqD8HsAnCkydKy959yDmOBv?=
 =?us-ascii?Q?rf/kncTy+5xBQfN+ctXIBAYCUiBYnkGASHxENkLLK99xjSxkv95EjanR7z6y?=
 =?us-ascii?Q?iapKzZCk2e6sEWaS2iLG5pddhdvTvsMItZF5YyORoqA0Ttfvrm7S6Igpjz4m?=
 =?us-ascii?Q?O6aoqVjwUoIvSnZ4PxjSKMJhHUlolP7A7NGcEzS7nvhW9M8m5QLgOIveDfpq?=
 =?us-ascii?Q?lUA0c+Yo7OjrmQqIDypgDkHs2RnCNdKFYXBfSY9nmMPXb/mzYzpMkJi9PSRx?=
 =?us-ascii?Q?4g1yFFbqVIbI5vKdEArj45YtxD12tZrjm2Vwd0qeFx6QM+mtchErRE+jftxr?=
 =?us-ascii?Q?+4b2o0ZME3DSwTmJJEJyyhgUxR6werp+f1VswcXvo8gWYItFgnSfPQsnpYAr?=
 =?us-ascii?Q?MI+9BWxC+xvq41jwF1lKCNiO+pCYpyvVuM/4hv6nyo9/d/mmg0P/jPBDPmhT?=
 =?us-ascii?Q?Ces6/ad7MU5omYppMBxgIfiU7klCtN95CTcN+6G4DYY+jzR/PAiFHLXbpxyf?=
 =?us-ascii?Q?VhHskuWfVh8nUvDt1E4680RMrf9K+bNwHtrH1UyN4OqORK8PDsjUwWtnRNR3?=
 =?us-ascii?Q?f4aTrSdgdezNX12ZUwwfj5G1vWX0mPzU1oQoEIaR?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e011fa99-98ab-4e47-bc93-08dce97f95df
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 23:02:16.5838 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LFmrj8Nd2wLNPw8CI8h3t0XqubCymPhO+juq0h82vwULB0reEfljZh8CbHhIZ38BCUFqEeH/66fZC195ozzJfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4606
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

On Wed, Oct 09, 2024 at 04:26:43PM +0530, Badal Nilawar wrote:
> It is possible that a g2h request may be cancelled while waiting for a
> response due to an asynchronous gt reset. This commit ensures that in
> such cases, caller will be notified by returning -ECANCELED.
> 
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index c7673f56d413..b93b2821e4e8 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -512,6 +512,9 @@ void xe_guc_ct_stop(struct xe_guc_ct *ct)
>  {
>  	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_STOPPED);
>  	stop_g2h_handler(ct);
> +
> +	/* Notify callers that CT stopped and G2H requests are cancelled */
> +	wake_up_all(&ct->g2h_fence_wq);
>  }
>  
>  static bool h2g_has_room(struct xe_guc_ct *ct, u32 cmd_len)
> @@ -1018,6 +1021,19 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  
>  	ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ);

Better would be abort the wait here if a GT reset is queue'd or in
progess. We do this a lot in the xe_guc_submit.c - see any of the
wait_event functions in that file. We likely should normalize this a bit
with proper layering but basically the flow should be:

- Any wait_event_* are OR'd with a queued or in progess GT reset

- After wait_event_* signals check for OR condition, handle gracefully
  via an error code kicking it to upper layers

- All upper layers need to cope with H2G failing or use *_no_fail
  versions the H2G functions. The *_no_fail versions are untested as I
  coded those 2.5 years ago in Xe and don't have user of those functions

- Queuing a GT reset wakes up all waiters

- Upon completion of GT reset the OR condition is cleared

Matt

>  
> +	/*
> +	 * It is possible that the g2h request may be cancelled while waiting for a response due
> +	 * to an asynchronous gt reset. In such cases, return -ECANCELED.
> +	 */
> +	mutex_lock(&ct->lock);
> +	if (ct->state == XE_GUC_CT_STATE_STOPPED) {
> +		xe_gt_dbg(gt, "H2G action %#x canceled as GT reset is in progress\n",
> +			  action[0]);
> +		mutex_unlock(&ct->lock);
> +		return -ECANCELED;
> +	}
> +	mutex_unlock(&ct->lock);
> +
>  	/*
>  	 * Ensure we serialize with completion side to prevent UAF with fence going out of scope on
>  	 * the stack, since we have no clue if it will fire after the timeout before we can erase
> -- 
> 2.34.1
> 

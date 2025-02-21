Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1740BC021B3
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 17:23:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D89C810EB24;
	Fri, 21 Feb 2025 17:23:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TbzdYHXP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE0B410EB14
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Feb 2025 17:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740158587; x=1771694587;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=q9hxwnj9gRFluSCm/loCOX1eGR3JXooiOPHD4nJtXWQ=;
 b=TbzdYHXPP5nFM0V4jinVwJMfmSj9C/byzTlrXSkGyqb7qY1s6vk9GItE
 mk0raBhpXVzz9r1eknKz7lN7sm0KKglvyKzRm+4td2FkVfkSAOP067die
 nqbfBRazE05RXRQMz41kpt0Rrn9RCQqgPuQe7AGc1Nl3q8vwpy8Z4gkoN
 A/H/b6xD3dJINXv/K7JZ+hlqN6S89QM5YE+7HZIy8BtgazMwWXdiYEAzF
 wiA9KQO9a+Q5GT0x0TrArvNA8mOuuTPkALsddiSB1/McGxdLTNQUYR44a
 SiUAIGpUea3PvU/ACcPep2Fye9yM/MnfDt0aHHYfr4c1cthd+jGBp4lxn Q==;
X-CSE-ConnectionGUID: pu0j1PY4SRajGk1pmiY/Sw==
X-CSE-MsgGUID: CWXXUegdRiy6KDRxhmKBJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="52386782"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="52386782"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 09:23:06 -0800
X-CSE-ConnectionGUID: Wg0IhBcQQqaFzOIV/yxHAA==
X-CSE-MsgGUID: qZ8HE+NVSBSHMnlfywlI1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="138651128"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Feb 2025 09:23:07 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 21 Feb 2025 09:23:05 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 21 Feb 2025 09:23:05 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 21 Feb 2025 09:23:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pe27HMeNThltoyBu7h1F8FGeC+oeO1vFn9D302BuhDZ/yLvDqUyPVslG105tmPxXbcxQrrg63MNK3yPw4buyrD0nKZMK+59n0s9oNRRZ2Fw2k6dkJmvXZranAjrAbT1x/rrG3jrnB5t8IwNXppywsRyVTnlQnaS2fk4EAxOXzeaRTSg8VATj/InAYvrU7R6EEwfHG9wNRyGMdLGNL3a4aVuq3ijPU/oV7KuiQIarWE9G2ivnJhC2PhO2mnW483Rr0sv8YeNdieRyEX2hsQMJZ1plQ62Ev/1X/8CgIO+YkzmEm1dQldHqw27y4WbjX4clLSFYbpWHnfdXJ8ACXzOz2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fUGFNCE/pnxgvSxvM1BG0/Ct31sQMNi1ahZVgWf7KVw=;
 b=gtW+w7Ly3gNhT+BJMnPlWu7Xoly4r8ZHK6tWcOausy8l1z7WrAiEtCHak+PKTslRDBVrds4xQHf7dTipSS3cR5IPlkcDaI9Sc335I2wpM2V174S0500m3FghgOLSscF86l0iBRgXPPkDYNdi9H3wvyHg/q0kE1XkBBV2Lvfh/6wEinGC1Urw9794j57PXLA4vFZqCBnz6Qgy+4v9Ji3BWf99Vv0fwHnu2yVcYMgyKOX7Hs3jDKwuMjEujMRWMR/tn1o8xyeX7GF3CeLhOKM/qZeJP85DxAgJ5x4hl3wlo4/RYv+xq0FqdktfVj0TpnoNVb6kWhNgAOrleTqW/PMLNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY5PR11MB6488.namprd11.prod.outlook.com (2603:10b6:930:30::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.17; Fri, 21 Feb
 2025 17:23:02 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8466.015; Fri, 21 Feb 2025
 17:23:00 +0000
Date: Fri, 21 Feb 2025 09:24:03 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <badal.nilawar@intel.com>
Subject: Re: [PATCH] drm/xe: Make sure scheduler is ready before submission
Message-ID: <Z7i2szvi1T19KQnR@lstrano-desk.jf.intel.com>
References: <20250220123859.291523-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250220123859.291523-1-tejas.upadhyay@intel.com>
X-ClientProxiedBy: MW4PR04CA0217.namprd04.prod.outlook.com
 (2603:10b6:303:87::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY5PR11MB6488:EE_
X-MS-Office365-Filtering-Correlation-Id: d8591ffb-ba2e-4818-6b14-08dd529c6439
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kh4YECV/cA7Yw9ROevi2CvsSddPqRC70Q+hMNNnpnFYXCiMW0f7jBLrPB/f5?=
 =?us-ascii?Q?wrj3g6y4TtRIgf+tsqUSn8mOQjxB088bomPszm2rNqrUqrfRNp2XkEA8I2rF?=
 =?us-ascii?Q?82YEfPq9+ekKI5pVaLl3ClDWx4ySZqEh07/4ioVkXMNew+CmVqTiAzSji+Fd?=
 =?us-ascii?Q?KjMi8xDamu3JSM0adY/dqitewOi+gSjKW2hsnzACuPEfxjhzgbtcvJ9+Gf1D?=
 =?us-ascii?Q?mTW8NYtdGjsRgDACb3D+H8B35be0euVkGtpchZZwaZiULotQrqNDVdFf2Oa1?=
 =?us-ascii?Q?h+qh4UE/7ikv6qOvilbCY88TCxJrf/oCG5UL6cDwsHCiHwZTkm9NkO0zP7ER?=
 =?us-ascii?Q?HjGz9wOPDRiMVgxFUPFqdD3df1F4cvs6TD705R0K+b7Jenv9xZxPFY4/X+Ks?=
 =?us-ascii?Q?kXSDQLji/YCSMzSJkfMrjV1/9FTVtAc7qHKm5OeILelkzZ8HnvsELuIE881g?=
 =?us-ascii?Q?K2vxiuWwJqHYAMfN3tpyh1MIU4UH9m1kCV4Rshk5uCt1WGXP+5rYBF6An83I?=
 =?us-ascii?Q?urwMUoaWI2lDgJt321YOIBryIGagk370J1TaW5zWU/5c7k6+bUc0v7plJxXW?=
 =?us-ascii?Q?PLpTXS0WhBROg1qa7V2e679Y/e1ze+C+B2uUYzTcbn6uHzR3B2ZK8Ba/Biej?=
 =?us-ascii?Q?bWI151Rcz+88Rs88cCZZ4VFZfk45KzVP7R+YOMbB7YoqO8cy+pZx2oNm3vVJ?=
 =?us-ascii?Q?K+LVJRLvDfg+Qsk9vq/GCUvdnwcU8XtG1UDN6WqysR4zEljNdRStd8AECWO7?=
 =?us-ascii?Q?bFTRFZdcZpq+9uXM6R5uvrPfrUrkh9U2QxWIwswYD5vxBXgyMGwEd9KQG5z7?=
 =?us-ascii?Q?2Ie2cPDF4AD3cZOJqNMZ0cLFOCwY2V4WcvL8HyjWzBx4xT5DMGZOioDvt/hI?=
 =?us-ascii?Q?mU7dZg/7wp8B3p3/tfUgiTEIG3VScVt0u+C1soSIAfOziZs5LgybnL1HjBYY?=
 =?us-ascii?Q?K3yhXBbPpdQzWPMqXoQuSGmm0fBrP5EDm/QVIbFaCu1c4mcd9NY/4at15UWh?=
 =?us-ascii?Q?tDsck7EcUYJpTfvEjtwPBtJ+4uwpnQkelVs99kAgatrSFkvVJ42oaGXsegAy?=
 =?us-ascii?Q?zZmJ/xaQ+PUYPYv7ZcpLPTicq8PgbNoh1GwofDeq38F/lsskoeOWql84iP0J?=
 =?us-ascii?Q?xFlAAjQwY+zOfIfqzXkGYy10L1PDmva8GYTJw9vzhVsJZF31/NdYGLjEJaB5?=
 =?us-ascii?Q?fY5lMfDsOxaL5VOpCEbR0zrBGDDiCT7nY6B1hYXZJX3pvQHHWJ9yQf576XRQ?=
 =?us-ascii?Q?DJ4Cb5Z/Hrt7png2sJxGq08a3K+TCPyJkUv8uM3JN3Lhnaz9QjJH3FX3KXCl?=
 =?us-ascii?Q?0zsVN09I5PX75n28qHlRMZ5o2pJ6qIaOxIY6gHUz44I0Ng=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eznOlq40grO+P8Kz5MuKNmXgjMWh0i1QKOjiUKxeGN1d4vWqgK9+pwkma6HM?=
 =?us-ascii?Q?oCuePlMEURrKMRfVaTP5x7x0hHIMDNhGhSCA2S4bSeEBqklSwSFAfqChADYn?=
 =?us-ascii?Q?WgHjpe5iTFo4fOLYK+UVx0g9IkefoHv3hJqea3d3d+WMZELYa/xTVS7ElAYy?=
 =?us-ascii?Q?Ifq8ULGjzngr8NfsoTbGkRj/5aoeqUnK98LqN6oCUNjXmGX+HrDARY/jjp4e?=
 =?us-ascii?Q?TTY40ucdKbpozlaBl/24PvM1OAmfH9cxq6XE8HgQyMH4XIlPakps6ZNhrU5X?=
 =?us-ascii?Q?HUxuZXqjK4THWnkd2SX5ggL1syOFsH8ebbxzHFnMU5Vs/rph5C40dwIkYM4A?=
 =?us-ascii?Q?+FEXMuHIvu2PaeI7MxBViuXFGd6VIRahaCHJIlLDHRgeajJCd0W5GR5+CefX?=
 =?us-ascii?Q?dqSsjUmeAY29epEH9+mYWrPKYtql9HOxkn9x+MK4mI3AtogghKrqGy79gal5?=
 =?us-ascii?Q?vrx10LptTIsG+NBxuOwKATops4NWVezuikqehSZVmw2+ziPf6CWQEqWxseB+?=
 =?us-ascii?Q?KegPIPwxNqz5leo9SANYK4qvmoAfqYPq3YpwbiCpzldZnQVDwHQhjIeP40uW?=
 =?us-ascii?Q?uQBjZ5KFG4bLsx48X8W0EHNMbvcrMRTez5taY/TI6g6Gjiv+cALVefC+hB3p?=
 =?us-ascii?Q?wA0YdmTFQTEvCtASAio5LFxra/WBWt3or/smgMXea3pQPGdEOfhSmvaj/Fna?=
 =?us-ascii?Q?/ktX0qO+58hY6U11x15HMkqfPXIYRbt2NjGjweb8HB5fEsQJtkHze5xsSc1J?=
 =?us-ascii?Q?IZkzfZrDHh8ySU0nw2oEzQnpuUh59oMtQQ4UtMFApetU3gxiGfMvbwiwbiFf?=
 =?us-ascii?Q?OJGz2b3+O+qqFOqlNwHcebm+OMLHZM9c2LpqjoMoaTn10RoFs4Hjjzwp/BsW?=
 =?us-ascii?Q?KI6NNS+5GYVGbFA2HEKAnaLpWrWHs3n6g+uyj3Aod7YEnw79bKC9mWtcPrju?=
 =?us-ascii?Q?WiHKo/aJu6y5dv22LXyVs8de5x5zd0lN6z6D5yUHhsjSRjGHxORILRx0bVCV?=
 =?us-ascii?Q?1MST398Kf1KL5Q3bVcYuvbeHoDt9P495/6g/A1YtnWDAzb9pXjmRxq9WS7D/?=
 =?us-ascii?Q?R7/ewF1watOF9PZZVdg/xuOU9zODgo4gwPVdLuRIhkjPp1rC5oLhruTP6IWL?=
 =?us-ascii?Q?aKJCI7h94eI06i0KgOaoNjCl//F7A811TNzvFkCA6ymTZJHIqELgxmNGYQAK?=
 =?us-ascii?Q?FkXfoU7TADhivIw36Dg7c7CNO++zV1RNEu02DnMaff/8MGn81If+kxL6el5n?=
 =?us-ascii?Q?iCAR1ZlhX6Bb2wY9nRz0dODMBCeIB8MX6uzemIXkni4CHXFoBTTCUbDC9bnt?=
 =?us-ascii?Q?20P1Q2IpGi7h2RsYAOqehp2BpiWSY1O2AnyspiWWCrzWyQeXY6NiEsXontsO?=
 =?us-ascii?Q?CeSg9DIDLzTlVcPZtzTszVhHwVPaPmGkaNFxfPhLf0qTD4gsZPRHwnVTF+HZ?=
 =?us-ascii?Q?ib7ikdtaNCQ0pwOHh9H9qx4lrDsMI3wo24j4phFV/3u+G2DS+xigZa4Wt5gI?=
 =?us-ascii?Q?OqqdVTdD7OQaSPEUhubPQdkttMMevjtKa/lyXCNlDrSPTspbD0w9+iVwtXm3?=
 =?us-ascii?Q?u5rfukzut5EARui1/3jMDUZ5Qy1OG75M2iGteGw/UWd/+/pKJNGXMm3tfliG?=
 =?us-ascii?Q?fQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d8591ffb-ba2e-4818-6b14-08dd529c6439
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 17:23:00.7966 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /kOrLTLWtOSPLNW2yGarxfdtUK13oaSQyR8TNILTtJtU1sB1mFUNYGQC0J5KvOoBoFpi5k/liPAq5i9t9JikOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6488
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

On Thu, Feb 20, 2025 at 06:08:59PM +0530, Tejas Upadhyay wrote:
> Async call to __guc_exec_queue_fini_async frees scheduler
> while some scheduler submission would have already started.
> To handle such small window race case, submission should only
> start when scheduler is ready.
> 
> It will help to solve below which is not easily reproducible,
> https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4223
> 

I don't think this help. We can only enter xe_sched_submission_start if
exec queue is in &guc->submission_state.exec_queue_lookup and remove the
exec queue under a mutex in release_guc_id before we call
xe_sched_fini which flips the ready state to false. We then immediately
free the scheduler - we'd be getting a UAF in xe_sched_submission_start
anyways.

The gitlab issue looks like a memory corruption. Basically it is saying
a variable which is a bool is reading 107 which shouldn't be possible.

Matt

> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gpu_scheduler.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> index 50361b4638f9..42ca3c4a299a 100644
> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> @@ -80,6 +80,14 @@ void xe_sched_fini(struct xe_gpu_scheduler *sched)
>  
>  void xe_sched_submission_start(struct xe_gpu_scheduler *sched)
>  {
> +	/* Async call to __guc_exec_queue_fini_async frees scheduler
> +	 * while some scheduler submission would have already started.
> +	 * To handle such small window race case, submission should only
> +	 * start when scheduler is ready.
> +	 */
> +	if (!drm_sched_wqueue_ready(&sched->base))
> +		return;
> +
>  	drm_sched_wqueue_start(&sched->base);
>  	queue_work(sched->base.submit_wq, &sched->work_process_msg);
>  }
> -- 
> 2.34.1
> 

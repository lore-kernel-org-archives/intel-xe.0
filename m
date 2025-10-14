Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F49CCD193
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 18:09:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9F9110E670;
	Tue, 14 Oct 2025 18:09:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K4OoVcuI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70BD410E670
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 18:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760465366; x=1792001366;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=N0D/XmR1PBVexju3Q1ruvYu+QKCdhr/PXYiituIdt5I=;
 b=K4OoVcuIqdUwRloyuh+uXDb0ytQrIM8pxNBVz+vSmj9WTUgo5S77akvF
 0acwSD/e9o9ctmhLCl6blTdC9Q5JPFq0dfQ+X6v6I4w8EB2WsxUsZxvbs
 z4wsD+ksbz3F8omXMleo9ynKbXbioXRB5UjXP3fSekg2NGqOWgMxlyTor
 TuIOm5rQe3IvnR/EeSi+LIRhwxiR/1SwJfxH0YK3fTPmJcZZxWiQPlkUE
 AKqZazTvGgQ2JiSgfOsJNxiEH391i8sRKqPcV51uiObe0yAPnYr8TQYdi
 iGoMqBAZ9fp9l0j53qco5o8jeX03kN1RDTrZr4BTH2rT8vVITUBI1b3hL Q==;
X-CSE-ConnectionGUID: 9kTpln9sRsqgpnVi2VC5Mw==
X-CSE-MsgGUID: BCnslIZwRemqvvmX7gMpUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62784044"
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="62784044"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 11:09:26 -0700
X-CSE-ConnectionGUID: DZ8z/3CaSfWEgqsW3wbJ7w==
X-CSE-MsgGUID: rno0cu0zQey7NxRyaMxu0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="182389821"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 11:09:26 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 11:09:25 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 11:09:25 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.67) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 11:09:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dlSkP56bc/HBVTueHQ3qkqhxQ7UmpqEAL4pFspOS98FGwNNpmRY6/rJfrcVfOWiIyNmQA/o0y6lL5qiZJE14dkvVLnCn/wxpyRxeMrdFr7nKftFpEXobsBVAlM22yNGfSQKqi9fkaMiH37Lt2QDat+ll7HRgm7VlMFOaReHctKQxa63+w/8eODmz461IP4OWh0ItBb2P/v3g3zvj576w6artOkEwQUEapZ2zabGYOIBFsAzbh+FplxtkYYzOm82GgdbPSrRefj+f4NWIHx5rBnqHKD4e0jfHs6NhCgqRee2HwqjEJS1QXFwdYYZTISS4L2/laSOLSPqFpDBOCC9Sdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Chh9EoZJAS7o8LFomVPQWv++2g2CMmhUH+FCNomJrMo=;
 b=ikxmynpRRswlSuEm3gfTX8ga//H95lDG+/2Inog5iD6+pPGx9HXnGXMt6o4GUrf09v/ExjWXXdpIiE7S165w5ivQHEbrkP12x69CxGWxtqe9QeJloOBX8O39v/dCWry9Uab+eVLpaiN6DSGTxAcCX9LFt7eJQNeHzCmr+YTn7KEl/wdZWoxtj6uhGiwe2y3GRDK3Pci3LM/ZoWPre3pHSFCr+SzHDBWA8g2lSI/tPmjUOW3ycFkP6eaqrPj7JjN8JJTh+or2pyieTTwQPp+SV9+XvAvrKNBafzdDbXfFDIeYxvO5U5nIV6vjqIhySzB1+7qJVyWWrlcB0jlhnd88OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6504.namprd11.prod.outlook.com (2603:10b6:8:8d::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.10; Tue, 14 Oct 2025 18:09:22 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.009; Tue, 14 Oct 2025
 18:09:21 +0000
Date: Tue, 14 Oct 2025 11:09:19 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <lucas.demarchi@intel.com>, <rodrigo.vivi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <daniele.ceraolospurio@intel.com>, <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v5 1/2] drm/xe/guc: Make xe_guc_submit_pause() available
 for non-VF cases
Message-ID: <aO6Rzzh7YNzpVy/0@lstrano-desk.jf.intel.com>
References: <20251014073036.3282329-1-raag.jadav@intel.com>
 <20251014073036.3282329-2-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251014073036.3282329-2-raag.jadav@intel.com>
X-ClientProxiedBy: SJ0PR05CA0180.namprd05.prod.outlook.com
 (2603:10b6:a03:339::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6504:EE_
X-MS-Office365-Filtering-Correlation-Id: c0e4a364-c544-4fc7-a683-08de0b4cccad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?d7zQsaxTUYXx2O733ulLqnBMoVvU49o7fpMa65nlD17Wp04LqUZ1gJmT6tce?=
 =?us-ascii?Q?d/OTHme1/YcoR14jr6UDoTmUPdZ05ZqlOzWTI07dkGjZiGGgoD9X2eVHCePN?=
 =?us-ascii?Q?N3szGOYpuBfKYavNx+aLDYBK1ZkNvfGa9Aa4ppyqNoUdrPj0gbD1Wj66u5QY?=
 =?us-ascii?Q?+xwbkFksT8BYu3/V9Y9lxhOY0DPTgtg8k1hIMAjI3YOiuJxNU/0SkYPYbJsP?=
 =?us-ascii?Q?1lJZGQi9AFu4MpW4D5w/WUZf5yHYzZgjX3tD4ndMLy64p/CdDnPsBaDurHGD?=
 =?us-ascii?Q?NH9bmM2FTuZi+RRTyPfTUx8QczOJrSMW5cPJwy0inkw1MZv9UqumUbYiCDnE?=
 =?us-ascii?Q?Ka5+3Hec7IBcJfm3lnhQAeK40Br0S3HvmxEK0Obfjoa8mV09Co5DdaDxOqnh?=
 =?us-ascii?Q?AtIjqPZvyo7D8Z0eMd8RRvP/BzkI/JAWniym3XLDc9bLvNmBz6vaRKoq3jDt?=
 =?us-ascii?Q?TPqgt6idXmHD7+N6A6NZpX95Xb0UNd3cuI7TvGBV+gNTG187pkfjIs0tnq4k?=
 =?us-ascii?Q?vn3AGNXdqcxh+IH4HinSrYaUq6nrX/TpEAHIF6Ew6JnMWLYLTh6ojkAP3vO0?=
 =?us-ascii?Q?Q1NUBqKwhMZjKu2rUjFM7yJVZgjzVPsvxHCfwXn0/JiwsRgAHNxsmckOw4ls?=
 =?us-ascii?Q?kmyztGM+8sMTRTZ+6n/elPDeuzTQJlSe6sg49HQWLVJz3jZjkoyT47pxol+6?=
 =?us-ascii?Q?5uKZqXYYBjOJIxCu3c8vZ+HLhqGSij1HEm+U0vZ941W9gmWTDJFaNwwy7DUy?=
 =?us-ascii?Q?b27V2skf/hobJybBxB8/QVbZpoREKTB4abfVXCfHjhvFNtspWMrYAgKfl823?=
 =?us-ascii?Q?GgC0VFBCK5PrmZBzOJLUCnCZTXCnyNlYWygF7EVzcHU5MEW1QOUIxSxo82hI?=
 =?us-ascii?Q?Z4WTIz8tDKNOmjLTogKcTIUQr7vaKPxeGuf5SWFfNGCRBmHjzjt7dXp/Y1qr?=
 =?us-ascii?Q?v1Lj/p1YNxj+MRTf9QYTg7pQHujtGb+BFCqpk9Ss0LRpiLbcsrB8gpYW8Aa/?=
 =?us-ascii?Q?czL1EmQwgARilDJ55Oos2wRYF0Tm5zSeiwEsQwRzSjPajI1IHth6cX5c2nh4?=
 =?us-ascii?Q?sg0msouXx0s6zSpQUzAH9b1QEEn+Z/0av1pbZOot01Uhad6CvYKYT93ltByc?=
 =?us-ascii?Q?4FXYteIcEH9wfeCH8Jb0jJLjUfkhgqBD0fCWrx9ng/qTI8borgiFAqXNdPmP?=
 =?us-ascii?Q?/4h2oyokX+4ksNtqK18hq7dMN0lXgnHHvjRhq0HJMfSF1mSQebedNoWNfw31?=
 =?us-ascii?Q?ccA6xAYWGQPOnUDalqZrzFPeFiCdEEnlwVqUneabYNoD06RBlBKGDOrqe6D7?=
 =?us-ascii?Q?rlE5hHGinzwZaxJXmk+0tLDwINXbKaQTBRkyRc7AZaVwAKL/CCbWaFxFWoI6?=
 =?us-ascii?Q?8eg47rZlT9K1R8FmbAgoMa8WDGJfDSTe+2HkkVqGM64YRNngt+YZg619lMtY?=
 =?us-ascii?Q?Fv5y/LGzzAaZPV6r6MTmL7OLbrBs9xgf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YsodQAfDcWQzADJqTRsidBQ6mg0VwtgyvxTDPGVEOX1iGjKC1MEuuZLbNatC?=
 =?us-ascii?Q?0fZCUS4lUdcFf5fCb9uJOfK+R+Im8zhpatoE7eA03c2eoH8MISjBxtujb/56?=
 =?us-ascii?Q?MHfueoJoQ9lYNcv8h8zXh17ijdt5wOolzHqf6ZEOU3ThrJ5zAFbBlNux1nkB?=
 =?us-ascii?Q?qSVREKzUv17zOWfz8/jD6kk0XJ3inLuJtImVcLuJuGL+YM3cehj9/glMRl+Y?=
 =?us-ascii?Q?FBSuH1pI2oRoA4SiNobmIi+txBNDRnhIg2jdDVnMXqhyhyR7sTTfeJRf6F6r?=
 =?us-ascii?Q?snLnGNFeuSjzDs5LJCBzpHM3sDNgpeIkxjp/vGU3Wny2SoPuOclpSTBM/njo?=
 =?us-ascii?Q?dLBgkz1Nk7wU/ipQaq5/vHYNk5Q/A7InvdrRCbReAm9qP38BudLVorLaxSBT?=
 =?us-ascii?Q?3SUxjj2hCTnjdhY7tjGVJnH2/V4uZfseOs5J3kiOdpGUz0P4rXCFqrh+1pvv?=
 =?us-ascii?Q?61R5I+1koBQGBQCJQyRTxZNXMF3RLPUDUQ36iVsX53n6N+siCS3LlrBLjpLD?=
 =?us-ascii?Q?VCygD27lrBhX+4Dv//1HLO/xWNdDZO9QG30piJLSpnK/aDcQodWlrnvSsjh/?=
 =?us-ascii?Q?FrST6PBR6FO/i/AYLEDPSAKOueYdNVYnIJOp9Zbwefx80N9E3cE8ppeXD6RA?=
 =?us-ascii?Q?wnBLpkoqCSdyzhbLl4yzCUBeqJIUezcw+8rvpCyTkXlTIO1BF+uudgitJ+gB?=
 =?us-ascii?Q?8kSPFw8RtPu36S0lU37J04Iai+fJs9ugOLkCelbeZgk+XnSTP54PMp7XTOS1?=
 =?us-ascii?Q?m3J19mYZOArqIX53oWLFyaHsHRE+k90Tg6rCalJaxMk/QS9yWv5xo2maQN07?=
 =?us-ascii?Q?MQs7/8i3jqkwwyR/bI9juh5tmIbK/ey3vYmqPoYdpWj1bh3qmg6aqBGEbCJw?=
 =?us-ascii?Q?LPMiSdJJr1pBNbfOjK1KYhU7NqXdBqPLhDegRHDamNsuLS30/V+Qf0xnDwdI?=
 =?us-ascii?Q?T8DHWZD9xwaeE6aS7udNPL4LCwwcgTH75oAgLxcGFscfD/3M+NSJrCMPnHdn?=
 =?us-ascii?Q?NDKHZ3iV2/cr0CvGCmupHlyCkA0vd0kjbHDBpGwlFDS8BjpfJmmfv+JjtOdK?=
 =?us-ascii?Q?aR3fu7jAb5QzhQ9GDioBzdjsG9etGfxv5hxH27fhx4/i3cj/iEIqSJuyJeDI?=
 =?us-ascii?Q?d1qL8lZbd8KaAfpcehe4EeMPxW6Q2rRmgBygRJ5uKTBgYIt8QKxuZwAYYCGh?=
 =?us-ascii?Q?n6cB2UNHyIfKsQTGyC132OmfS2mB+BJUM0vqORg9zfToJAWtvYSh1aPCkaLQ?=
 =?us-ascii?Q?6s1pfl6beHuOno+hINqKcqIUaafdBagYmLA44MpAb0YxLvZRAe5XmapLtc8u?=
 =?us-ascii?Q?YmyUX2QyLSSPkGnRfyKcZtcPqMhhehbQpBNgayeUTZ5pf3rO9hWwcdJIDPlU?=
 =?us-ascii?Q?IlT539RIk/vl3FV3QV6hV/hUkSXTTW0IxT0A7jPzzXKhWDKMTuTlMzdePZif?=
 =?us-ascii?Q?XproFy/tYbqIK5yaZFlc0C5oKlUkvMSH1xlQTzm25V51JvNwaHMW8/aU7ETH?=
 =?us-ascii?Q?6kqkBLgsM6nwnatv7UBr+uVBTSsHCO5S4smoFF9I6p2JbhzyZ4vbR+zckEml?=
 =?us-ascii?Q?89ntEH318XWeYT8349s44Z2Bn8flI+PG0FjatIGIBoup6YcR/FmejI+LM1fe?=
 =?us-ascii?Q?CQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c0e4a364-c544-4fc7-a683-08de0b4cccad
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 18:09:21.4436 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +liC7Fbb+0jROPkNdk9AQgqT5yhVQDqdEdjjrpUn0L/jVv/ZREPbddeLnP3RspoOiw28KtSV+azcy9ljBbK54A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6504
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

On Tue, Oct 14, 2025 at 01:00:35PM +0530, Raag Jadav wrote:
> Drop xe_gt_assert() meant for VF migration and make xe_guc_submit_pause()
> available for non-VF cases.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 0ef67d3523a7..3cc428d45b4a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2170,8 +2170,6 @@ void xe_guc_submit_pause(struct xe_guc *guc)
>  	struct xe_exec_queue *q;
>  	unsigned long index;
>  
> -	xe_gt_assert(guc_to_gt(guc), vf_recovery(guc));
> -

This function does a lot of things specific to VF recovery, it should
not be called in runtime PM flows. Same goes for xe_guc_submit_unpause.

Matt  

>  	mutex_lock(&guc->submission_state.lock);
>  	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
>  		/* Prevent redundant attempts to stop parallel queues */
> -- 
> 2.34.1
> 

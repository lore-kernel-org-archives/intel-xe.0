Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43EBEC4345F
	for <intel-xe@archiver.kernel.org>; Tue, 30 Apr 2024 15:46:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B938E112329;
	Tue, 30 Apr 2024 15:46:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MtIUScMi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5D1C112329
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Apr 2024 15:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714492001; x=1746028001;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9/J8Rj7QufwdJCxT8FJ+5Xh9+1hKkGsvhPfEDXOy8us=;
 b=MtIUScMiex6bF0y0nv8kkDrW5AWbCaDQVrbhBonJ/j3zzLO+EF5nqciG
 Jlc345B4dEuSrHi4hP5InHZOL4Pd2moL7qoTNQG/jfkC0A5gYKrsad1lW
 u6OtsU/eFdZWwXKbb9nvF9Lu+2uj/8nuUD63qxs9HZZdwSsnZCftudlyM
 qcJ1FepTkl8vrmLIl+uBTVoy9cU3i2EDVMCL3oI37kcyc6J3eVGL3j114
 0bCHdisGW3IJmEEuof4gDloX/3j2hOeeCC4G2/cVG/FLz/2l4AknG68gJ
 qXu3mY8dqxo3NBmgxGJWMQ51xFrCostqQ+hKerk1Smifyqu5kPTjXkoFA A==;
X-CSE-ConnectionGUID: RfWcyA3sSamUKDjByrWvxg==
X-CSE-MsgGUID: uueOcOjLTGOh+/ttX4D8Tw==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="14032891"
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="14032891"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 08:46:41 -0700
X-CSE-ConnectionGUID: jWy/7a+bQU6uwMeExjszBQ==
X-CSE-MsgGUID: vieOPIjvRZCYInZ6nShqyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="63987137"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Apr 2024 08:46:40 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Apr 2024 08:46:40 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Apr 2024 08:46:39 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Apr 2024 08:46:39 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Apr 2024 08:46:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MZOHQZtgxIWKvnPBR3bQ9+Yf17D7cMeWKmIfJUKgKidOzkoIeOjMrf1SUT+rkLoxxoZk6tq1e7bf4Oi5EpgYJ5luS0y+KioDgLbSDkqVBg6iwTfoBjdVKbped48k7Cs4OhF97Zkb+/D+vbAJSV0rjFGL9/Oc64jULQ64xyEPwy6x+ORl8xfqHCN9NTx+j1hjZNwqpufmwaILFw76zI06k/WcjZKPE3+xth+gkXa3i9JhGBs+0erWG6hiHbuoaA8tUoE9ypgSCIMUBeqKmf1dPlJ916jwpRldrjc521ZjIKi4wB8Kq0N7CnDT28OEfuPDpyykla8mn1v1nTIohrnOLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j8ULz8FtMWgFRTu4rEpBOrz3qIZ3jEFGQCwMVwPpoGk=;
 b=RTTLGxAyBMSQraks9eXqgyGkw1hZw8ACEj3LXyHCNhtjmX9lzT60qpszIPHsEIqFkOcVf7JvgY5mVjscw4L/uv2gK3wc61zA0m08lcGuEsbxAnmnPu8yShyyR/dr3f8o9IfqU2QYWxSG8LxQNrVkdEPxS9ZLI+72mIpbotDnru3QxG/8/5RNYiBRjME57Jn/H2sBzZCLxNsIpnxB9TCpOb0foNdAK3P6Nedo4HXu9PbBsUcfhARAYjIjClHFXPSab0Y7iemCSlwFpNQ1VqCRhTgpB/Q7OonRyHoHXaEPNqCLlEmpsvOavXLcjtzmE10Wfms2eh6EsQvZdutLqe/vjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB4902.namprd11.prod.outlook.com (2603:10b6:510:37::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Tue, 30 Apr
 2024 15:46:37 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.7544.023; Tue, 30 Apr 2024
 15:46:37 +0000
Date: Tue, 30 Apr 2024 15:46:27 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/xe: skip error capture when exec queue is killed
Message-ID: <ZjESU4WcO1bTls5w@DUT025-TGLU.fm.intel.com>
References: <20240425122931.1851837-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240425122931.1851837-1-tejas.upadhyay@intel.com>
X-ClientProxiedBy: SJ0PR03CA0122.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB4902:EE_
X-MS-Office365-Filtering-Correlation-Id: f37bde6b-7220-4881-7574-08dc692cb877
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xkraQvzyHcOZNqKF30B1f7lGXLdRiHSDA4Doh6XKaNwTddwtfFU5Kg0xhMPL?=
 =?us-ascii?Q?UMTE3hqX/EG2mP46TO8PqIM3VCpuESxoUCLvrMzndH/C2uzeLaCEnrz2c2Av?=
 =?us-ascii?Q?7/1w25dnbHUP6Ne/p5a7nf6sIfHda5FxzBZtfowFYvKZKgldK4eYGwkDRmrr?=
 =?us-ascii?Q?wizrXX8suSuyqrfi3Ks6NN+wYr8owAw0fa9kkZuFVeT0Jw/agE8EzrsYc0Mu?=
 =?us-ascii?Q?jjLNKNPInTj8hLgll+YdfWnfe1X+/KJFNsAIB2gCSe4UIm1kHV83W75tX/KH?=
 =?us-ascii?Q?kNna9WHTvk4UpZduzwLPKG/6A58TrEVupzx2fLsdbEZ58yOSOIwHmk0k92bB?=
 =?us-ascii?Q?WSYDaAK+1rmqPR1x1SZkPD75oHLGQy8ziCEGIaCQ9c9ubqCwLe2Qfc+HPXeX?=
 =?us-ascii?Q?mm6nxFheuoyP1XW59iWexCduv4boL6KWXnNZhsNFckeRbdNfAPE4R+Rvi5mH?=
 =?us-ascii?Q?ok/TtAYqaNjZC8S6Gc7cumyukxy9vr7KfmLZ0q3XJ7KkjILGEvUp+lALlTeD?=
 =?us-ascii?Q?Uo6dA0xShmzj2lQ+GaITCsp5oy43CdwidWSuLZAHgeBo8Kn/aYxTiX12dB+f?=
 =?us-ascii?Q?wLQ0GVQt5NSQD117lrb5lgZDEDilQeU9chRPyr67elM3rlTCWfUKMubieZbj?=
 =?us-ascii?Q?dFO+DyOTey50iROUzsFm59QpeOdsvrGcyUoaqvF85CSaZpd29n5z3hZ+wftP?=
 =?us-ascii?Q?kW/rykwVqGwCStwp/tBe26yF0y6b67EcUg7wrpCWuuQg4oDNgqmlzMqyLRdq?=
 =?us-ascii?Q?3jttTuWij6ljqq3Z9nXApLvyUrhtWLlZUdnoEY1kXPLMbqTIANCnXxwhkXSe?=
 =?us-ascii?Q?oaEBr6nmr62m76Rwzp9FL1+xQ0s3GOmn0NbKCV4JDvf9Ani3q93MxhrqfAsz?=
 =?us-ascii?Q?tBZ0rMe+YjNNsG0cOPXoemfluKETb1Zvj7aQBeY4oYS+WO2v+dT6Z1ZtD+tj?=
 =?us-ascii?Q?owwSRELCVcegnW11NSpcczqpp7aFop4F9zuG3yA04nQHO/73BJpcoL8X3tJN?=
 =?us-ascii?Q?3xALF3BFMbZdk5q8zT0kIyrJ593VvpODF2hO2gOsWldxqT4uMVXP/foqZc1W?=
 =?us-ascii?Q?I5/0XcVj2pwj5k7r+Z6MEuFpfxvPGPbsRQlalOnJTIs1K2vKhdmxnUD2vX64?=
 =?us-ascii?Q?b2//vIDfrC0B5ugRKab0FEtQXDlE9Pk/vymFxvliiMeoNbg4wsoqL1VSof0H?=
 =?us-ascii?Q?VcDtGVpq7sS3Yzuk92d6LxyzuhJzNX/DeJZyt8WsSZMU69RhPocD2EegTELd?=
 =?us-ascii?Q?7/KksfXnSO61l4xTMV5qfMkpVIr9/6C9OIsMe8NO6A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9DS9nwAO2qOmJ723NhPdrs/uWIRK/eK1fk4VHabhShtDv1B8Vs5mU1D3PnNR?=
 =?us-ascii?Q?HkK9XTHzAqgr2vpo/V5Bt0YYxOKOWDPF5jY9SV6dC0gntKUlNIpjl1O7ZeOo?=
 =?us-ascii?Q?L7xM76rBk9YdYoNCtsnvov4hSy+uzzDyeJ6UAMMC0/RusBUYJSqAIkPTD0Yd?=
 =?us-ascii?Q?dDFGAZwIESNHokgLslTtMUMFcF+dKArIfdYXgKNkf4KGIcX0a0mavC2HGC0n?=
 =?us-ascii?Q?pYW1GUZ4tTUJ4EndDv3Ltq58L+Qm4VFd3lQp7Kr86rDhl664sZO6UHNxs3Eg?=
 =?us-ascii?Q?jwAx0eUOQhfGwkuljBCkcdmGdCQMM46w+j6U7yeipD4Omic5+2JMoJkMKS8B?=
 =?us-ascii?Q?/+539dgTf4kS5R5ORnbu27yO1rdC/dPrQTw2mbMn6lqZpYXYBENjaYgRo6hD?=
 =?us-ascii?Q?wXeLAHgZsfow9ld0Lfy5k44KWWmihRHBIAcCFRiDpyyZ2PhiwAgjytOK41D5?=
 =?us-ascii?Q?DB8CESAvkHExYqfe1I0Uq9/Jwnb0ymwb360EuqT4kHwe9lcukmPD4zUWPTkV?=
 =?us-ascii?Q?YCWaDQZCurBxFAlMhe259xazT9oknP00AGB3Mi6+gAsGefrkRwQQDqWV1Vx0?=
 =?us-ascii?Q?6U+qj7BuvAQ+GP2z4sT4f7d5zytH1qmsqQmFE0wqpe/VouTwCizS0iORM1HJ?=
 =?us-ascii?Q?bHzD5ilIheeH0M4ratknAV3+j2JE/RuRWfZAE6Wzui6ai5a9/Jx/kpsofs2o?=
 =?us-ascii?Q?mOtZ9OCHm3ko3pTjiKyzLnIiBf8gESpQldcqMgYdxsOurmCb6C3Ymf2n9gR0?=
 =?us-ascii?Q?n32FRzYFtZI/yAcQSOmk7XFkxc8ynOQhuQDI++lqV5bspTLHxL7zox+DHmbt?=
 =?us-ascii?Q?Sj1PQZ/PfJ1GuMhhGQ455B6ima7giXuT/t/JLO36O/5tYwr5Y7M/xd2KGAaY?=
 =?us-ascii?Q?Smle5wRG6WtBCcaMqPoWs+RGhJJIqr1u9s02MhwWWUddWbjqHYOL+2H04dcW?=
 =?us-ascii?Q?/yJqRUEGL5jgpZJipXjXFKjRiKP89oM5Eal8QAwk5iHN96/Ac5UupLk1MJGD?=
 =?us-ascii?Q?qwBMuR4XgZDxNj5d4fqwTRmzOQloSbDATxut1rxeDahef5OLV50Kklj8uNRa?=
 =?us-ascii?Q?OoHnaaYAgQJm6IupyEMWdkZt25JI8Kr6mllR4NBL32Sh7kVNALNFZ0YENJcY?=
 =?us-ascii?Q?fdgQsP1yQKewLKt+PJ4tSM1Tel7I2nxC87CdxWp6jGNuqKMyp82mJMNPyAqC?=
 =?us-ascii?Q?P9OyxyAffAklFkSAhD5oy0vpOAHlB9kDoMWKKjEYdz90SDaPHFP25lgc105y?=
 =?us-ascii?Q?C1uJnZJkg1TjKnKGckLDRl6+FoLFCWkPGYP8k2C/WLgFDyVe7CgpN6WFrPiC?=
 =?us-ascii?Q?C1jve3Qe4j9lyR5iGB9IfI3kmH8rcPu6GyVbxI5WAOXqRlidOFEyAE+MTJ2y?=
 =?us-ascii?Q?sgNtAutdUGcpAmJhbCueJHbEEqnCTv59+MPO2GaLgpnPrl0dienwGJKID8b4?=
 =?us-ascii?Q?YDeK4SLIC+amTO1CIlyu4bIXw1k3rZ+GyExwJD3aQoVLK3TnA2Jxj+EUjhuD?=
 =?us-ascii?Q?DBgtZ3+znvIu9Cb2eKvppPYAjvEnHVXk0GVmfh/2cs2/bXVsPbxOx5Athgqn?=
 =?us-ascii?Q?6eOHWJYJPD0AJv4JjoEFf/qXiszSU269laOR3piPbwMOaHwJ2XfeSiVzvchT?=
 =?us-ascii?Q?dQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f37bde6b-7220-4881-7574-08dc692cb877
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2024 15:46:37.5035 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zsuV2ijBYtkJt9jujjQdtSj7b24ncH8WdYKyI6unJteImz9YT3StTFNa50nJaHH0VH/+ZDIL4e7zwB0+90HqBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4902
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

On Thu, Apr 25, 2024 at 05:59:31PM +0530, Tejas Upadhyay wrote:
> When user closes exec queue soon after job submission,
> we are generating error coredump. Instead check if
> exec queue is killed during job timeout then skip
> error coredump capture, just free the job and return
> proper scheduler state.
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 93e1ee183e4a..376a2c04e899 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -971,7 +971,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	 * TDR has fired before free job worker. Common if exec queue
>  	 * immediately closed after last fence signaled.
>  	 */
> -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags)) {
> +	if (exec_queue_killed(q) || 
> +	    test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags)) {
>  		guc_exec_queue_free_job(drm_job);
>  
>  		return DRM_GPU_SCHED_STAT_NOMINAL;
> -- 
> 2.25.1
> 

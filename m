Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34508C67861
	for <intel-xe@archiver.kernel.org>; Sat,  6 Apr 2024 18:25:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF21910F137;
	Sat,  6 Apr 2024 18:25:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R4yjsslm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2C8F10F08B
 for <intel-xe@lists.freedesktop.org>; Sat,  6 Apr 2024 18:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712427934; x=1743963934;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SHjWDJadv/OSyEEtuji/lqx7RqH3kkujvwB9ZeQOARQ=;
 b=R4yjsslmaCB/eVqgVOumstw5X1jCdn9eRycRCs82KDhda4PITRE6nOq7
 E0F7bSz8pHQj/cYuwQB3CiK+v4PIy9lUvlJMCv0GExj88URLER53B/t+d
 0WWMShLx1ZfkYG7MQQd7CdFauUroDU28piq/VMzJu2UsW8R0VrqMZ8G4A
 TsLG589UvSTguBOc/SuYNxeB2wpvd8RYJGzhmsFZARQN2P1c11n3lh0HQ
 oG7RCxtsl/UAfD98coSAdNkmgagHbZwRV4tMHWU+v3JHgVRN7iJxNhyQF
 YM3W0pJGk1X/vh39k8TrOJacH09zI0Id8U8UAeoQJKZww2f2Wd6u8TwGW w==;
X-CSE-ConnectionGUID: nJEbcv0NTMe0GXVmmmWdNQ==
X-CSE-MsgGUID: wYNYYVo3Rqyriq+rFKvlgA==
X-IronPort-AV: E=McAfee;i="6600,9927,11036"; a="18362497"
X-IronPort-AV: E=Sophos;i="6.07,183,1708416000"; d="scan'208";a="18362497"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2024 11:25:33 -0700
X-CSE-ConnectionGUID: z0Qawl8eQ6uojZmNMdlMGA==
X-CSE-MsgGUID: ZnIO/CQ+RS6TT5tQeo/gcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,183,1708416000"; d="scan'208";a="20011722"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Apr 2024 11:25:32 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sat, 6 Apr 2024 11:25:32 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sat, 6 Apr 2024 11:25:32 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sat, 6 Apr 2024 11:25:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e8U5MzpdjiOB3itTlh8ZyYE5tRY7LNG4EeWX/LZz0X+Zgu/Y16kPKJ28zffQXoT0wn6T4Q3HZwD8XIZ5sQUa5vt+XzD7fYw/nwKgtvaRjh3qY8ZqEKOY6xjVP5yEkGqZaHXRM+KphPmfy3VitJSuSMLyLGzDIZMNpjQ6NLLnAkmWV5eWHUh0uD1B4D1UQm9CSriHG1cFZa7sWi3T78d2v3g0nfILTTKfeaowCUw8fNakDSSTdoFZus5pDEssIsWQ5NwZO1QEX+Ldd9aL6ADZqh0VsCCkAODUd2rR0P7Tz/4XboQ/6hw7YPk89AqjrhdtlOji+5Qi3hNSLAzlme5CLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M6TfZdjsAxmeg/FFskyhIOZlg6mM8lqXf35ip972vpM=;
 b=DR5lo7FakFnUej7gAJ3NjsCarp9jwvUQJkFaD9XH4Cdn/VBZMCYPjEM65JmS81+GN8KZykArZum2qSEvyLao7QW0rUoNEW0SvjXQe8T8U1Tq+EtZ/5XJA3FIji0AwmVhXpMWU9xtH0lW9aE2cnFD4L/XPHLNHQsJlme9gBsimqmxk/wOm/rpMmXD7ZYL/uikjyRvCeD+g8odg1aD0aMrbKx7ZkM6cVwWJprk/5jjsK5hPL2q5NEWrTZcFZuEI/TeubCXbpnXfYOe+InbK4YBPZnMe53c50jaB1u3BzIiQvcVBsI+3wBcyi//HC1hThqx+yZ1ln2aCqoOcg3j9hRK5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY5PR11MB6092.namprd11.prod.outlook.com (2603:10b6:930:2c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.10; Sat, 6 Apr
 2024 18:25:29 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7452.019; Sat, 6 Apr 2024
 18:25:29 +0000
Date: Sat, 6 Apr 2024 18:24:23 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe/guc: Initialize GuC ID manager sooner
Message-ID: <ZhGTV7dpZ7mhxcBW@DUT025-TGLU.fm.intel.com>
References: <20240406143946.979-1-michal.wajdeczko@intel.com>
 <20240406143946.979-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240406143946.979-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY5PR11MB6092:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8dABhnjQajzGGZAZaWO8cVS2bhydVNhxxBwr/rXlRbSYr8kYX3Kh2rIK/Cc6XQX+CmSxYZTpvm41XYdym1icBF9+3dOf/N6uJho3jKFafuG84TISd/hKuCmkvUdrqCrA3IPLXTao8iv5hY1A2vXpb6X7BB2y0NxEpK/U8mnlP0JrkgThmo8PRTErzDiaE9D1pGT7UnCmD6OBMJJMWNGvyCxHgD7KhIJTnZIty+D3vV/MGtvtLcJIRo5ZODwAbnnCq/x32GZC8fWwamXAKEnd//EarbngFtkZMm7a8zwUM6eYHZMQlvd4cHsWy7K/DWrPHYdIi7QukpI8VAsV+xxnJJhsVrWyyCwpRUjL3q+8pOGbGf+PaR9UDyT4v6JRb8yklsgyR1tZa26PTjRZRzpsmOepYjpJ5iHro5b/Je6Ir2+fl972IydIzE6psQoVresyyEDU7RGu7cLWNyHK0QdyBm3LYBZFAcGfjQDsEWgHuH7bQMO3m1WLX3O5DNx6NmTIs41YpMtv/KxJpU++B8d3zLU2WyP8rrRnGsljpbiftlB5ASU/+kFyv9SDbeiFavM7dsdsSLC6c7gkLhNKnnW4XZwkfoMWjw3DUGOeG4Pj1Z17MPsQ6h8POpvora3kFF0t3UzE7MQ1OKvXeM7u0k44U+jdICBFSHPPlDX4nVDAjDQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BxHxs7oivypKXNrWQLcwYuuPLFRDEUftQyV5DT46KdT7yuy1oonwdIX9vP9i?=
 =?us-ascii?Q?ECnDagIXqJd6PSWVG13/hOVJG8tUnlWUXDQDyAYPKSg78Im5omwk3892tHzz?=
 =?us-ascii?Q?yrAQwOL5eXVFseXYo30jFuzpByu9MdIfSK5AnPCMGn5wZ78k/97s/iUiSVuX?=
 =?us-ascii?Q?uJqMf1rBbRQXLW/6m1Abal+vsRQosktmrlzegPWev6kBa3j9CCgGGWVXr6od?=
 =?us-ascii?Q?jjBtUCM99Ugv6Dc6vV+kmzb97fgZmMiBfvFQd1y+fuXY76t46obWNJFcfgbq?=
 =?us-ascii?Q?xFkEynAAHT4G1kILu5H2lb4Dt3yXupsoORHNHtuSNLlm0RtI0yO++RTzI9h/?=
 =?us-ascii?Q?ARu+L4PQ3OERTCFaKv0FG1bVY9cJAYpBUWr4bTYUX/U0jb0r01744oerBp7q?=
 =?us-ascii?Q?x2bstiHgifaGt33MSM/RgSe35wXpX/fkMHXUkoWtptJkui/dif8JveX94w9y?=
 =?us-ascii?Q?+gVOLlwcYe6CNgbWPKL10jFyStiTl2mnzVJ/rQVDNTlCZK2kAzeYcAWNwfZC?=
 =?us-ascii?Q?cMy6M+BnC3V5zmLu/OLNkUXkI+asXyvd9SSBV/O8EHUezcMmsLfxcBfaBKBw?=
 =?us-ascii?Q?FLiM0dFhDShHiUVDTM8x5LdNIBq3des/ZUQS3mJV1iHyCYif4fRZ08mkVF2F?=
 =?us-ascii?Q?tiKFxEMviC7D0h44fK5wkDFjaf3HW0j2d8ZOi+sSe3yMpRZAqJIq2F45bZNX?=
 =?us-ascii?Q?2FibhoRZEzoX817AaJbskysQmaEe8Z+9Hd/0/PW1H5wULl4jJZtl5llnqV0V?=
 =?us-ascii?Q?zY55LoH4SqKRF1YaOtmPGDB7GQFTSMuJ9RvGHZECjsd00Uw/d7ki4OcTT+tm?=
 =?us-ascii?Q?U9JwaKhinmZvEilnpmxINfUd5NSA728qiHSIqsronpf6n6Mi9woWInRoKqSH?=
 =?us-ascii?Q?4U8baSAFXaKYfRkouhpD++XI9YxHbbi+CHfoToPHlJUF2qeEd0kSSuaOlN0S?=
 =?us-ascii?Q?+ytP+uZOi5+HpGSfTzfZnbrvXMY2Pnb6cJYLYhJR4q4OC0SWXYTVQjKbnj4X?=
 =?us-ascii?Q?Ll319f49YWaswLHW9XPyTwGyI1XxxE/Oqq6joRkUuNGV9/VcDL39DZeIaZy8?=
 =?us-ascii?Q?KHrqScsuzCXHrG8uymp6NJR7qcyBDjy+YijPSbtBMTaXknrbwvxCMqvRjrDE?=
 =?us-ascii?Q?3dbkwhSTFpZGIWxr7lQE6gO5K0MlAPkkP1rynjY/RsdyzA7hTpI2W8BJ0SYm?=
 =?us-ascii?Q?Wkb1W8LLw/9Rbxe2AmK/mbuCkKFWCayfzJk1aqKU4AUshDrWgvnO/b6Ir6Y2?=
 =?us-ascii?Q?qjki8lxC6t9f7TOPto5vTPbezkd6GV0EmGAOaAgjeIhBmR+wYWCGGksYF4Te?=
 =?us-ascii?Q?l8J50B+6LSSy3a2eZ+Ahkskq48SfiBUrvE8xplb7qVjVQfS+5c/NyzGeoltf?=
 =?us-ascii?Q?GWoQQVSZeWgJuRn7VBAMH3PCDqBPnhcau4xzm/yulaul+6xuP7myLQeuokz2?=
 =?us-ascii?Q?d7zqyjCkAELQj6viL25ph9ph1IgqBXLXIOHS/080pClPE1JmD5briogJxBj8?=
 =?us-ascii?Q?ZjobyuVFUORizw/5etQb/OfdhaEW9jXpY7wOSMeXMqSP4qSMSsxTB9AZgCvi?=
 =?us-ascii?Q?bK8zgX4iW2bkJ8cJi6MYk0u5HMsb0CH3d6Udc+BWRo0wo/hjBuU57Y2r8Dh9?=
 =?us-ascii?Q?tw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 111cc26d-4b64-4b8e-fd16-08dc5666f02b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2024 18:25:29.7182 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vNqQnLi3Wo6P9+CAl+5raKBcx+0bn5pHS8R1Kp+am8b9/cvH4DhnotT1yvliUs1jAXP/m4MZhO1qPwV4UdNraQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6092
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

On Sat, Apr 06, 2024 at 04:39:46PM +0200, Michal Wajdeczko wrote:
> The GuC submission cleanup code may depend on the GuC ID manager,
> thus we can't initialize it after registering a submission cleanup
> action, as reverse cleanup sequence will destroy GuC ID manager
> prior to a call to guc_submit_fini().
> 
> Move GuC ID manager initialization up, right after managed mutex
> initialization, to have it available during guc_submit_fini().
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 4c444fddfba6..61e7a8fbd18c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -266,6 +266,10 @@ int xe_guc_submit_init(struct xe_guc *guc)
>  	if (err)
>  		return err;
>  
> +	err = xe_guc_id_mgr_init(&guc->submission_state.idm, ~0);
> +	if (err)
> +		return err;
> +
>  	err = alloc_submit_wq(guc);
>  	if (err)
>  		return err;
> @@ -279,15 +283,7 @@ int xe_guc_submit_init(struct xe_guc *guc)
>  
>  	primelockdep(guc);
>  
> -	err = drmm_add_action_or_reset(&xe->drm, guc_submit_fini, guc);
> -	if (err)
> -		return err;
> -
> -	err = xe_guc_id_mgr_init(&guc->submission_state.idm, ~0);
> -	if (err)
> -		return err;
> -
> -	return 0;
> +	return drmm_add_action_or_reset(&xe->drm, guc_submit_fini, guc);
>  }
>  
>  static void __release_guc_id(struct xe_guc *guc, struct xe_exec_queue *q, u32 xa_count)
> -- 
> 2.43.0
> 

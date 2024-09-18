Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F0B2CDD55C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Sep 2024 21:28:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4CBB10E641;
	Wed, 18 Sep 2024 21:28:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FnpGrUP1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1F3110E641
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Sep 2024 21:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726694880; x=1758230880;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ET8pl0FMX72JmPJV/82EqDjnl5j1fwjgmI5WJ2c06lw=;
 b=FnpGrUP1g+tXj2PpyvdvqKLa14v5Ac0jKP2B5qeByKKR2oRylH/yjvJ2
 AS13i5g4IWnrRP+R1lk4oCXr/26V5nIpTnqChA1LuG/K4eNvBUNE74ajf
 h6iTdXORR7cvzje4tAZuO/POSRdtzGl26yRzxblKE828qY8Mt48ntj7XO
 zV3WALGeGQ8dxhfm5OnAxRO8W7Don41Ona7cWzKMWvH1Auj/LlUxvZHnl
 45pRc5PvIbUtY6kkUnLBrlsVX+WOhfQzvwQGSf8Y74yycdA4H7R6yJGW9
 HYsYwRc+EjisMrYmhFil+icFmXG3rpbRyySPVAkAYgVbeOqGUBGQs4WgL A==;
X-CSE-ConnectionGUID: J0OyYUEHSwuG/Ksmz/RxVg==
X-CSE-MsgGUID: otTqpxw8Rj+0XZ/dfJWAnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="51038413"
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="51038413"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 14:27:59 -0700
X-CSE-ConnectionGUID: ZbhxeSozSgKC2OW7MzyLaA==
X-CSE-MsgGUID: IEb6VpBuRdqMj2JneDTMhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="74068919"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Sep 2024 14:28:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 14:27:54 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 18 Sep 2024 14:27:54 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 18 Sep 2024 14:27:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aqZJjsg4Al3/MqP/wh6VuCL3AdRgGh+90uWNRkAhk4lmcjfZOL8Byqyqi12p+BnrCDidSIGfPHhKi2QZcup57eWDsQ0fUE7PxTMFxC890Jm1jHICXWww9e0tbamVQxVgIYU6kiktgwqvE6OBNYLHf8orZnLTwWS/IBbB9QTZlajhD2M1UdVtxaUcD1CIjYh0paabYJf1t9w45QrCH0NxnAhUmVZXwfINkvSJOGlcC+kvGy/RtlZoqoS1bV04J+S/ZYNbbCkF5llhBnphEQ/vshkJbteR/+giJfEV/AdsWwyozyLv11z03Mo8urvCFAgvvAuNpdRDWCjTO4ng7hKXDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mcKDG7BcqD6I379tpRudaa8wa2RtMHXehQzbty4xgno=;
 b=P29BpeChizMNiJ5tIUXDuJl2uvVfgzrx5azVjxTnQNhqfk0j+MrfzN5ecr6vABw7+2vFdaUi2OPtk9dcYDrMBa+w5K4lDy6NmIvAM9AZWRBI21lpy0+6nOb3vM+ggLG36JQ+HDmb1bTCpMyprUkxRhqzpDNQB2rjx4OQAuikIocZB3v3L8jQ7AZJGreSTOV/onq9799BsiT5zT9grE7BDolqMd3fQysC7KKPf3g6RxpoZwY+vaUq+K0Da8kkj159sn9u0taw37UdC/8gzAcfkB/vBUWxu3IrD20kIfmk4CNbcKOdfiHL6hKQXgIs/jEoC4HLS8BPZqV24R7bQQnTvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL3PR11MB6412.namprd11.prod.outlook.com (2603:10b6:208:3bb::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.17; Wed, 18 Sep
 2024 21:27:44 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.7982.016; Wed, 18 Sep 2024
 21:27:44 +0000
Date: Wed, 18 Sep 2024 16:27:41 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Jakub Kolakowski <jakub1.kolakowski@intel.com>
Subject: Re: [PATCH v2 3/3] drm/xe/sriov: Drop TIMESTAMP_OVERRIDE from Xe2
 runtime regs
Message-ID: <vrjgeflwmn5c722d4wdwpxcj6x6bzifxvtgu77q2isikdvx3bm@2dezcofk3oxv>
References: <20240913162910.4145142-4-matthew.d.roper@intel.com>
 <20240913162910.4145142-6-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240913162910.4145142-6-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW2PR16CA0058.namprd16.prod.outlook.com
 (2603:10b6:907:1::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL3PR11MB6412:EE_
X-MS-Office365-Filtering-Correlation-Id: ead38ddf-0b5c-4964-4f02-08dcd828bbc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vRnSH7o5+n1XphpFWckIxN8UUmksTatjnA9hPBJObckpMAySMRvh0HO/1E97?=
 =?us-ascii?Q?4dfIf0Bab8df+X8B/DhIR5fb29xieGqn8eCDtCl9sI5tKECb0zbPQfW+cuJE?=
 =?us-ascii?Q?lhHvFRomlq9os0N6FSF4HOpBqbNAPYJRMFGkJ5/x9BSiJhWE23UfuNgya30I?=
 =?us-ascii?Q?QWX4LtWDkUhGA/x78mcmn3ZIVDqoT2RhZDGstoXWQmrZ4o/mxdwsMYXNeHNR?=
 =?us-ascii?Q?Ov2kmOA46WDK1oj4JVVeF1T94Gc8PY5XutvsjQ3PfurXpmfMduVaeisnlAFO?=
 =?us-ascii?Q?oNDdP1+0XWsanmBaSKXp9z9Rp4Gok5xwcu/B62zQuUryXAWIxR0jMP2e5uPH?=
 =?us-ascii?Q?sP4TpDuD8QEQnTCGL5re/q5yCeH1AHzYa89A4/OhTiss+FeynioC2BPv+gFp?=
 =?us-ascii?Q?rcC7O34aDBvyGvr5LX8+HApYyS/w6oY6uy98IJ/+71Ie3MJ+AWG+yt25aeKA?=
 =?us-ascii?Q?7kH4GEzmBXwvKh01mYPrHHhI0i1ukN7QyXrs30Cjr1lT6FkvHJmdbiMM8K8C?=
 =?us-ascii?Q?u4RkORjIWTAZvHisQUWSCA2BA6UeFgtezbMIBxkO4mWiKbFXUuOBJP1dKavq?=
 =?us-ascii?Q?+pZ0ReRihQBN5CDDRFBgmm/t+2ljgi77NLkMc6MABpAF6VqM4z447lS+Sl/z?=
 =?us-ascii?Q?Hs0gtBUao8Bg1tJhqxYX7F1GeY8BdfoX3DQOhFQipc14fW6Kts+CftfIVWfA?=
 =?us-ascii?Q?wS4H5MB8xH1XEH3UswIKmg4h6gG7Nj0U8elN1hd+dsdHnGk/FLrXESOFKb7N?=
 =?us-ascii?Q?eyB8NIXYmLnqP7kgcMwiNKMQNPdcAhe3auI+ZTvoCmQTc1W5ncalN4n2At/Q?=
 =?us-ascii?Q?G5XCoy9Pj0OiBVnTDMHhRQCa44PVSRJukaX6IAd/4nXqERA1W+qJCEn5no3t?=
 =?us-ascii?Q?FvLwCXKKflcAZIG2s+gB09xsHmAMt5UrveYbeXQXvCVPXv7bpIr1Ywu1BBsN?=
 =?us-ascii?Q?LO+j8bMjiEgD3LErJ94koBH9ZAo/Q2Xaus3Vjh6StDxvwXAnqkhVkhc+Y7on?=
 =?us-ascii?Q?UPz5E78tRfxjYVQynIbFWevgYLAbD4i/cBM033BVx4BYWqxizQsVVMYDsVTc?=
 =?us-ascii?Q?EAEFhNY6kyTMpbR3YXMtX0JexECNZmnUKbkc+6azJEBwyDVSIkOXXzQIR3ff?=
 =?us-ascii?Q?uuL92J3dQxrbDvQA8w2IEb2o3K0Pe7h+xlBtBCT63ekYFxCwj2LY6Lp/pueQ?=
 =?us-ascii?Q?lCA9/oASkorm4zQCRxRIQrGNcXQhSFACeYXFmD6+ez2Nd0nHuahgHIcxujL+?=
 =?us-ascii?Q?INr7pcLLk8AQ7jbab4BhEmddcX36L7yRL680HqF7TZWa71nWrIj9XMUq1oQJ?=
 =?us-ascii?Q?syXr9hmoJtn9Gq7ji73cuUm2e6uFAgdsfEbccURUAbnSjQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m91VCfwC/KhFBF/FCis9M/+mpnbY6NSYGrIO/jRHjZ+uSVeaouTFZT8Z76QG?=
 =?us-ascii?Q?mj6xIaVBjBVPBrysreQxxS5UC+9MuYEwfJqOaNnSSIgk/JLcks6h33I/EXnE?=
 =?us-ascii?Q?vhsHd33SST35q9ZRUtHjTIy0tQ0AGzfOwwf791ENsYO35pYYp5N3/B76L+lE?=
 =?us-ascii?Q?cfCLrvB4cn3zwiiTsVN/V+fgM975sOi9n6hI6SFCJil37Oytg1PFPd1xPsPG?=
 =?us-ascii?Q?88j6wW3w1hYB+NXgW9RcgrOQWpLmmB6XKqjVhRLKpiIhdHRanWTRLtspOb0Y?=
 =?us-ascii?Q?geSgvy2VlJjrhvJw4VVJJO0qQIAejSOTtfF7C40X1glteRTM0BnmpmW14hmv?=
 =?us-ascii?Q?6rHn8R6Lj7c6qjE5KdJ+l28JSPwl4qKDPM2HwpcbZm+qHTcLXvYZ9zodCdTC?=
 =?us-ascii?Q?LgrRXFXl0U9BEC5opNCBkhIn2p15JtViAvcBlNStvAlQ8bhxZhrzZ9k3AfAC?=
 =?us-ascii?Q?DXVr1/JU9BJN9LulZ0ghqNBXnhRlfFXls9tAz0EaQWob3RWva7z1wwN+JcfO?=
 =?us-ascii?Q?mKWabk2F9abnGD3b+iLVQRtxwRhQbhJAI36NciO4Fyg7Xd2P3j9bgXFk3YpP?=
 =?us-ascii?Q?icQ7ArTyjfCcXTF0II0sayT1lJg17DBnvHWztVfqE8HbE7d1b2twsbjem8LJ?=
 =?us-ascii?Q?1HyCAY+YTPi2J0+x3Xi8FkR5GebAsTyCGTrTzMFQssq6JQa5+YDv5zM7pxkp?=
 =?us-ascii?Q?Ir6Z156ZRKV+FGtwYPB+a1Uv7vE2YX458Fvk6F7vLydwG/ddOPvVRiRXuE6Q?=
 =?us-ascii?Q?CcM4W0+IHdHNGUocfUm3yrmX37O2nVehp/pkCdBERxfgtJrF/gYCIUqugdWL?=
 =?us-ascii?Q?Rwyet7JVSdOUsUl46Bwp284jYkEEz3ea2arCyvZCegnrVn0bCV5wpNLqSqkZ?=
 =?us-ascii?Q?bSy6eiTgqrVTzQHtdRxYKhDVwDtmkkinTqTbtB57l1idN6KMTn9fr8GN5EIo?=
 =?us-ascii?Q?+BoXqFruXMkvZM6bCb9R2+JY5gZ/5D5aqrxpGA5SY71aJsU2b/MMcT7HN3kq?=
 =?us-ascii?Q?KqOEECQkTV2KHOK4G8RqJH9CsM3hjQlXzBnNQDsRO/3QuZWrmPu84cXriFS4?=
 =?us-ascii?Q?ZK3zibVkAaq/CucU8bL6GvMuLPzA5zEux2z4rgW36KPGj/Gos5yDrTU2Jn3P?=
 =?us-ascii?Q?oTIfvvrDiL5veTmLWT5NbpHxPGHOJwX+lUAm0cbvXlv9iEHFQUt0dfjlgO8n?=
 =?us-ascii?Q?jaw7FCiVgi1uZVQNB9gl544XQfvCFk3tSY7/yifQbSv+NbJ2hHjX1OpwP3Hb?=
 =?us-ascii?Q?10D2S+hilVl0bBlgdyYmStDJkfmRMkpVK6XbywT4mEw9kJQe/m+Okx7MpYVG?=
 =?us-ascii?Q?MaEe1dWKnDouzp3syThX6nXIaCPz41Ap0NnOUJrGP4HmKgDJ18ZtEPcDdwYx?=
 =?us-ascii?Q?4xgkXXe5u767LxzP0Lkl5WdNjr/K9xgieuqkebuYDozQtHfY4yQoPt8ojrjU?=
 =?us-ascii?Q?khhGPy7hDESq+/w9r/Vd9LXWxS3stOHFRFIhu3U7gawc5ohoq7BxlIsj2tyn?=
 =?us-ascii?Q?NkqYJGuCb709xV0cZP3kkf/gJ+hn/M5LOdUehNkpj/kHD0fKZUthLBzNpXpt?=
 =?us-ascii?Q?hV0J3T+4pobH1lv5ida34WggY/LIXJMb6iEAtN/lFCBg/fRq/auS7R12f8re?=
 =?us-ascii?Q?vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ead38ddf-0b5c-4964-4f02-08dcd828bbc6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 21:27:44.2129 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /tyvdWvAHx0Ws0KQ6P2Uaq6/rHUoHh5DYHa+63BiEjR3bBKmtNFfS/zdPWGHuvjiZcLNPUDxbYGCb5dIyPAn/3CL1XOyw45TBTcA5InjKwo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6412
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

On Fri, Sep 13, 2024 at 09:29:13AM GMT, Matt Roper wrote:
>TIMESTAMP_OVERRIDE is never used to initialize the GT clock frequency on
>Xe2 platforms (and the register itself no longer exists on LNL) so drop
>it from the list of runtime registers.
>
>Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>Acked-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c | 1 -
> 1 file changed, 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
>index 924e75b94aec..a5bd577227d4 100644
>--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
>+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
>@@ -173,7 +173,6 @@ static const struct xe_reg ver_2000_runtime_regs[] = {
> 	XE2_GT_GEOMETRY_DSS_2,		/* _MMIO(0x9154) */
> 	CTC_MODE,			/* _MMIO(0xa26c) */
> 	HUC_KERNEL_LOAD_INFO,		/* _MMIO(0xc1dc) */
>-	TIMESTAMP_OVERRIDE,		/* _MMIO(0x44074) */
> };
>
> static const struct xe_reg *pick_runtime_regs(struct xe_device *xe, unsigned int *count)
>-- 
>2.45.2
>

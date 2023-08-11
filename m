Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E5DEB64DD
	for <intel-xe@archiver.kernel.org>; Fri, 11 Aug 2023 16:22:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 609D410E6B5;
	Fri, 11 Aug 2023 16:22:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE02A10E6B5
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Aug 2023 16:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691770944; x=1723306944;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/LMPr4mFa9KEVpVfvd/7TLP4qnb9xU0eQXeAMkLuoe4=;
 b=JfSiGTdCJ8u4ASsR/Q/f0d+30olvpf6kTICk9MBFf8Bsoh1OMdOvITHJ
 PUdg8+B37/6bZZGnG58Y/vuFq4w6y0jMFRbEXjBl6Z34VWGLDuojcq8Tz
 xhV846MyNXbapl8/7s98aIjnf2xerRM5lQrReIJdMijTKzJOZQA2J5T77
 Z1cmqZsgxuy+06hl3oADVmHMyBxJ/fl3uJm2ngRp+9ifqqXOI+7Z29HAG
 w9UVq8dPq5Bd/YcpFxZiiWpepqiOf5cquccNBsV/MgFkZ/lOLPbgu7Mzg
 T9tlYPLRRxnU21j0l29AGt7C0Yg8PsURaqponGxzvXCqkNzTxI66UMs4J g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="356672546"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="356672546"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 09:22:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="1063363915"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="1063363915"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga005.fm.intel.com with ESMTP; 11 Aug 2023 09:22:23 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 11 Aug 2023 09:22:23 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 11 Aug 2023 09:22:23 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 11 Aug 2023 09:22:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AyfGs7cmcG9+wR5B+jjoYxftvVNHyhOWJzFoGlsQgCOJJGzE+AqzdlkCoc6ex4ka1xf+styTB557AbWaoXSy5ZwikpnsfroalfcXUmJgYjaoU2DF9G34V/npIAuUkNqY+2RHh/N19hdLKvL1Ylw19O8fg4nMBOQv7uKoQJnbuPH5m26txjpQ7/82khWXGswLph6pOBXmkMld/QAqxoOQ1AIoXTcxHtDKB5EGuBnn8Z4wyIlsAhdPEE/0WPvq6OluuUw3FA4Z6m4i9WtG9EzuDTxJdlksONfQ0k4sAZTKEh2Lc92IutHzghxtg9xFItGVMYSNP/jrqcqMN7pmF1JVeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XlEGmbxBj++I5qxRUu6em4VQtjhdqR1nY6rL4kDTQSc=;
 b=howis7zwm5zSdct5Xq9oS0D6wzX3067RbBbHb8COdPPqzdtg8AaQxj+ju0zYlVnD6Fre+hn+nO3sUFVkZdS11X+Fyn9M2jJctD6pgt4ibBTjT7WpR97Q1x4mKx4y//YEKacGaBDOmjCiSIJ7y4euhTbA1b65yrNMa3d8BkIgzPHfY7nt6gHbzrRzmExIT/x3Sk5g7cBwRm0DEWBqmfmlTXCn0IvS1bXfpBk0GS0CShRd1Cn2jLWPNZPoPSUf8z28RnEPdUSz2C/gwblBtRNEzb4tRnfS+ogDSHnfPGrz6kCAs7o3QO5M9ONOI4AxFY/rydA8VQTmbXz9r69tur6WtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 IA0PR11MB8378.namprd11.prod.outlook.com (2603:10b6:208:48e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Fri, 11 Aug
 2023 16:22:21 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41%5]) with mapi id 15.20.6652.029; Fri, 11 Aug 2023
 16:22:21 +0000
Date: Fri, 11 Aug 2023 09:22:18 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230811162218.GG3375865@mdroper-desk1.amr.corp.intel.com>
References: <20230811160618.477297-1-lucas.demarchi@intel.com>
 <20230811160618.477297-16-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230811160618.477297-16-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY5PR17CA0002.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::15) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|IA0PR11MB8378:EE_
X-MS-Office365-Filtering-Correlation-Id: ce80f422-72c1-4bfd-22d7-08db9a8723c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HL/37SpakMCYpFnqDLjuCUwFjzrXTr4Ifoqi4Y0GlCZVA43rCnXiGvFyG/sNRtkYFaT04x+hz+gICRMgGsp1IHH3Di5DDjhF++iTlbUXR8gBm0ABoBz3Lop6gqzqXbCUpmy9/DeRfn6UsJRa/LpBmN7eSBbcRABrlECe4mpbjeQ/bVSDWpblJqlTHj1Xy4pfrQY++FBcJvYXnaQWmsr/j5MKfSmaknD1fhNelDNi+jIhJ5sCFSDmA5aJ0DrcCHErC0wQEnlr26dlXJNlxWbrXZC7tSQkdBx1xmVn6v8KSZlfIKdBiTQuA0VRRBA6fxKpmDWEit4OjRIwkyEBge8mrHf6F4yqk26PbQkF+q8tFV1ivZImp3YtSCXFhcNirpdfJojHlaVYx9TozQi+nEr3l68rFkq5CWCWsQCWTGom9NNC09Y1yA4io2bOdnSWTKEH6o8NIHi/i/PxJaIp//W6rfm3IMzPNgLw1KOEInC4Ik2Le1udBMvATxxBbeW1l1AXj/vYbu90eQP8vXQelkK7vP/QFCP+XaRPmP3JAW4j8hb/3ZYU3VFZXShOoK8MHN9iADunhuSr+06y/wY5bRD7waje9EZHJBoKZxZ3sRZEnLXTjc1X6hlPvRFHKPdZ5+4VdVw91oeX2a2GOGTb5AF4Qw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(39860400002)(136003)(376002)(396003)(366004)(186006)(451199021)(1800799006)(1076003)(66556008)(6506007)(6486002)(26005)(66946007)(66476007)(107886003)(478600001)(6666004)(33656002)(316002)(6636002)(4326008)(6512007)(2906002)(86362001)(41300700001)(8676002)(8936002)(5660300002)(82960400001)(38100700002)(6862004)(52103002)(158003001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WaFXz08fm6CpGrMxrIMfLraTMC6Ak/VQ3/cQbyhL+mJ7c4O3g69ZuFTIw9yo?=
 =?us-ascii?Q?Antn9y6vj/5dzGOnQxk+j7ukugk9a8/nG4PXVq3qA3jJ8IUayLHVOzxVRoKi?=
 =?us-ascii?Q?7RqpAZCVaeNV2rSgO04Ra5ZaE1IcJmTzhuy6lw43yUBL5aGbqenFRmbrBWs8?=
 =?us-ascii?Q?1wt/3MnTh39iXsWMmYv8SsjNG8kXpvz6/4VDkDUzUsfZpK+kHkUNrXIZ4m5V?=
 =?us-ascii?Q?BpM7M2Bmpbe5QTvY1SJFJ56h7U5Ktr9WXhqF+sjP5vCXhInPRKsOsZiofNX9?=
 =?us-ascii?Q?ZhvQg5GsimXL9mwiE2KL5n6jxtl3lbCMtIdOSzhJyu4YQ4ndkthHWOOSgnTw?=
 =?us-ascii?Q?0V2H7Az8DoYQl2xAiuaPvS8VgskYxnDM964UWS8npALIPSQSPobbTavgKX5Q?=
 =?us-ascii?Q?z4b8sw+cMEGRecYzAGsQz9UTq+p6uMSV3o8nK/OQ64eepZ6syo+A3wwHXs+f?=
 =?us-ascii?Q?cMXwsWyxN6oqRSQ3MKl+B+q5Kwn37fYbVYJmMETkcG9Q6lgNAyGReHJdOLfh?=
 =?us-ascii?Q?Evl1huxJMTLBsLX+DuJ2718G07iOaHtB5KpAcb6nRIWurnLw34oUPxdyokPn?=
 =?us-ascii?Q?MB8+LMnxZ/tvzrsZz4ZOfE3u4L2mW47bpZJvVPgjBLNw/tICDmfm7BU+dR82?=
 =?us-ascii?Q?S5UFiRmrIcaMzwYsccyfpc9+iRZL2rthpGB7EZeBQE3ltby9pNb/g/0+cuG8?=
 =?us-ascii?Q?f0ztK04agVEGc/Gv+skJ4xXRlNPrM7YFzqRpDCFbspq/U3Zpl8Jn0STX6i3o?=
 =?us-ascii?Q?4XSLHOxg4LPcZn2lLeo58ihhoebtQLrPnYuJZ05hSNP1egm40XlmtsTF+o7G?=
 =?us-ascii?Q?4uB3ludvyNziG9hv0FZCFFCVawST3REGPGNEt2NNDGpOSxxj006jnIUTlhiR?=
 =?us-ascii?Q?NIajSn1rEJZD6kKx05oXC73ajWtFVcoEH9C26G9cjqjUEw7lc7jNT7gHBnPy?=
 =?us-ascii?Q?/1RWrE9o7uXw/cKtLx/0v3NERhBKMLJzu+hk1cteDTw95Ym2SGkmRumLbvvx?=
 =?us-ascii?Q?1sXwKJM9EQ8qSqfBPJ5AwVpG9QYJH1zVxWnIIx1cX+1HIpKt6oYw5EBZRkQv?=
 =?us-ascii?Q?Nt5KyFLiw9pNTSv3uU9p7nwACSmL2gl/wPHLiDY9qSWi/4V6WPOp6+4pr3EG?=
 =?us-ascii?Q?JLIOjbYuP1qMD7usM2X2VhSCb0zhK0ypZBV7uVvF5WKNYRgvv/hzkWq5281w?=
 =?us-ascii?Q?qpNnO9y5DCtGgp1TzCgMqmI7Zt6IGApNHVAjnb4yl9mShIOZ5QJQ9Hc9ZYMS?=
 =?us-ascii?Q?Ire1Dzl3VO7F8/Cfwj7uuzpo6RenFndseqinkU/S3OKfMPtA1obR9N+IIgfY?=
 =?us-ascii?Q?3ICcYPTkWEip30WqITUwj2qWvxQrf1G60/WmUr3JPkZytrAqkr6pDeRL9+FS?=
 =?us-ascii?Q?rjxHcQ4hQFiPOryQO/e5S8x2pvSHb8UTkhctQULI4jrRFt71sVOQB3Ru2xwS?=
 =?us-ascii?Q?XsfRfsAElpI5eZHqQ//CRI9pLCYkeyuwwiH5UQf9JRCat4066PjeD2nFtn2f?=
 =?us-ascii?Q?rW+7SL9ir4e2NHqBeGPmLchDUWVqZnsnMMAh+1i2F152CYd5mG2tETtRB13d?=
 =?us-ascii?Q?lMiGb5bWN9d19jyXbKtRYfyzWLnVJ9XYF5TIO/MYOJfxQlA83ltPxGkv3ebs?=
 =?us-ascii?Q?QQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce80f422-72c1-4bfd-22d7-08db9a8723c0
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2023 16:22:21.5453 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 31dMZ/jJp3R9zas5Z5PTUhbtpqDNbyX+tjTqFmuF8oZYzgLWh6s1iYTvxqJg0Im49Dw+aA2i7NqCBWx7Qf3dZEWhYLtyTOSniV7hIkmEF/o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8378
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 15/15] drm/xe/lnl: Hook up MOCS table
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Aug 11, 2023 at 09:06:18AM -0700, Lucas De Marchi wrote:
> From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> 
> LNL uses the Xe2 MOCS table introduced in an earlier patch.
> 
> Bspec: 71582
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_mocs.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
> index d779ab8466d32..38d3e4ec9f445 100644
> --- a/drivers/gpu/drm/xe/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/xe_mocs.c
> @@ -395,6 +395,14 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
>  	memset(info, 0, sizeof(struct xe_mocs_info));
>  
>  	switch (xe->info.platform) {
> +	case XE_LUNARLAKE:
> +		info->size = ARRAY_SIZE(xe2_mocs_table);
> +		info->table = xe2_mocs_table;
> +		info->n_entries = XE2_NUM_MOCS_ENTRIES;
> +		info->uc_index = 3;
> +		info->wb_index = 1;
> +		info->unused_entries_index = 1;
> +		break;
>  	case XE_PVC:
>  		info->size = ARRAY_SIZE(pvc_mocs_desc);
>  		info->table = pvc_mocs_desc;
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

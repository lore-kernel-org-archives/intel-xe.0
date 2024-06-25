Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3BEEC2BBCA
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 22:14:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8159B10E250;
	Tue, 25 Jun 2024 22:14:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TV/er1KI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D415B10E250
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jun 2024 22:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719353642; x=1750889642;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Hw3tB4sVGyasjww/de97UVsYoJtbXhyvZWpXlLt8+UE=;
 b=TV/er1KIqmycIqyCU7PVLpPGStmt+QowvfqtBS59usKxxrq/ON9y/lNR
 3eGOMKRxKegUKh8kbfCaiJj6vtLnxVdr+cYi7+1hF9krMb4ZRNisZZcy+
 RyaAP6u1WGMP3xmtcnA7IhfcfLxrl2JX3rLTK5ioqVhsJVpo+ZTO5WzwM
 yzOkRmgK0be4yAi+JzHJ377KcwXSHmy7D6IUclpN8MUkIoYvF9z4JoqZN
 CKtgftitNqRW8eBzsuekp3vkjxC1HK+s6nDJFDw0otnQDxwVzZuucEj2h
 PnkaZbvygx7KQx+3RIj/MXa6GczxJmvfdsZORgEPElW/d5gHV5WyMlbWd Q==;
X-CSE-ConnectionGUID: ifUO+vzsRtuJQp4GLBh6Ng==
X-CSE-MsgGUID: 2f3tutaVRgOH+ng+qAy0ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="33855648"
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; d="scan'208";a="33855648"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 15:14:02 -0700
X-CSE-ConnectionGUID: NyCYdfVdSJi7vmthbocv9g==
X-CSE-MsgGUID: zmKk/40OTlqEaIu1E0OZmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; d="scan'208";a="48373747"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jun 2024 15:14:01 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 15:14:01 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 25 Jun 2024 15:14:01 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 25 Jun 2024 15:14:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aLLDKVQapi0D0xpc0i7dquxXuY3zxCg4eIzY/ldtUkoZgmQ0vex/BH2klHAeov5crCHA18E4n11JNehh4qqoCyTUY53/tYAJs8EzaAnLgNH+GddqOEmBWYlauyPQXR5qH5I18f80z6KZP8wqcSkrT0nor+GfiWIz9PVxU4EZv3krb3Vzjjp0tfddxS+xG6pX653AZDkrslbb2gOTT5uKKRDjGVniLIl4A0d07/Cn7eLIaXSh0jr5faXjstPON8/R+Zvn0A6ENJJYfzlzw0P2rNoA12W7R/OzzgqUzCS1+TxoLLuChifvxnqwHpzvsOGXr5VKOw0ISKqpIUcdoqAEKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sv+xb7ja2gCjpE/Jnc4012VNF/kTC7AjT1PIZ/wWR4s=;
 b=TYwTmrnqMr4+/nA202TWYYmalgyahEfFlukXGlA1wLWM+jXx5w4XQsNhSaVoBHm9UA7LtqSDDEU6ywAC3+vWON0CqbcyP/MjaH+tDZkSXL50oVtTSEoERhaBdFBg4DgaGauMTYqwlZ4m3p1KZFO85nrRKotfOAqOhEo7BL2dk+JzTTsFbQCObdhkEpvMHz+m3iwPrbfTq0OeJG4LqzRQt2dw3FQs9+S/E/AuqqpgveX8SUg2Jwwd9lvQp48w8ResgI+HlDNh4DaHSKclDMDx2tUvTTYSbCi4PxXAnOX/2+oaQEoXL4o+TD0cPjhaWicSdy2J2d/0QHPz7ieUzfci6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS7PR11MB5967.namprd11.prod.outlook.com (2603:10b6:8:72::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Tue, 25 Jun
 2024 22:13:56 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%3]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 22:13:56 +0000
Date: Tue, 25 Jun 2024 15:13:54 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/xe: Get hwe domain specific FW to read RING_TIMESTAMP
Message-ID: <20240625221354.GX2906448@mdroper-desk1.amr.corp.intel.com>
References: <20240625153842.41070-1-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240625153842.41070-1-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: BYAPR02CA0046.namprd02.prod.outlook.com
 (2603:10b6:a03:54::23) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS7PR11MB5967:EE_
X-MS-Office365-Filtering-Correlation-Id: ba4ff568-2183-449e-8708-08dc95641b12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230038|1800799022|366014|376012;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IhukCUA9Tscyx+xbKya7qpjctbBOi28lwuycB2UKE8zPGISzoHs0VvaYJDlO?=
 =?us-ascii?Q?s5HJjr/AESG8CuzD+dTRKYFAWw3y0TJN23xojhALTWJE8udpiRkpZcS7a6bw?=
 =?us-ascii?Q?cgZtfc0rWMB5CM6AUzyzL2M1YVD/QHs4KpizCUE3saeWz0ZByj6kIUbtoNcC?=
 =?us-ascii?Q?Ko+Uqh9oi+2H4HoAnm3Xs7yyrkgRvp8LRBz7btrkZoz/68PJ2MIj5LwtoET/?=
 =?us-ascii?Q?6SKqn1Msmi4JzwPadukCkVmMc5cIRLYWMcy872AFfNxRIId67JGpicIPFM5S?=
 =?us-ascii?Q?A7/PH8FBR3vXemtEO8Kp7AhvJ/0/CKQ2xDaJAxvr4gXQrTVvqEoqnjrf0bRP?=
 =?us-ascii?Q?33PZ7GnASpSqacCrapYB1c0k5D2yMin9gmSffeEcSnlVr9bDWSLj1SUD9GNJ?=
 =?us-ascii?Q?IsEbsL27gHzkkKaXEt7ZBT/Rpgbgl4xEvQC9LiYLmBoSNv0dyBbivYT71jkF?=
 =?us-ascii?Q?+HhQZ6NcqwzEtABvtmGRsuZKZr5Raveal+NejM9guUPZGk1eUo2KjvL2e0l0?=
 =?us-ascii?Q?1FxKEfT4G33jbkSqRFfAo3/UxXGXEBCpmuTtLVW0mlXY5R2D3dVa379oNVGn?=
 =?us-ascii?Q?+Qw7CnjA0YVhsXZ8+F35BDSFiDdYWSH0DxVRkz9Vk/CTPZj94p5BoVkUYaiG?=
 =?us-ascii?Q?cx/nIIznYAAp85j2AVClwhgjqpC/1wbes+V5/LXGqdmzclqiFfHsLMd10aIy?=
 =?us-ascii?Q?0LGaYEJfiEamoUDy/MU51Y21gatRbbyqCdH5IeNtJInwOE+xIsj8biyo8FN+?=
 =?us-ascii?Q?iTvwJdOeEtJBk9pu2mJDHWS38UvS9ikpUNHL/f0NvTm/2dRBZevUdHNjlUcR?=
 =?us-ascii?Q?JORC+lLRYaf5cEnWG4KPYFRcz2SJC23ifI86PI0zFbaaoqAP7C8yikXSH2JM?=
 =?us-ascii?Q?nGOVUS5S6KEHQRTY+0OoIFpvo7dJJz0nLA+tsRjrMvYJldXD7ICIZSEeJ8Dh?=
 =?us-ascii?Q?+EXGXheBtDmIlwYll6MIpnI5PNjaOD+JHVRJuD1MegihNzQ2Rr3itMw4ynIX?=
 =?us-ascii?Q?qZgF1BXsmHB4YlE5m8Nr1Ue+qkDyajL0UHOm9Y5gW/jT9eu6eJFU3FDO//MK?=
 =?us-ascii?Q?npBnQs55eAgXywDiiIEslGtuiyj5+Zp9nfws0zAMihfKXs8smy31PdYtuFcB?=
 =?us-ascii?Q?NpDtGu5e+dAZ9+lX2z86g1IXZi53qdR22DuX/zoO3zPFIiwNH6lyfNpIYlnN?=
 =?us-ascii?Q?uH1Miy17aPNx81HxVpNtguW7iMrZDArICIzZ/IeyEGE+f8ufHvrO9i53a0Zs?=
 =?us-ascii?Q?FEz0b1p6LyiF2p0DlV1ribpWBHYJiS6Cnsb9JMFPCToCQULJrWbGi7hz9t+z?=
 =?us-ascii?Q?Xk7FL6qiSwFuDCL4SWwicjFtG3gKfp+0fn1gaOhG9l3BYg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230038)(1800799022)(366014)(376012); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PeTH0cWNVlNka3dI+Gr/9WdiFYUjDOkzgkJCKzBmrcEsZ+0HLKtPht4jLHp/?=
 =?us-ascii?Q?ERympwtebKFY+M17Wju+VfVHoEyzrADKdrXx+rpttLw0dWyZVooQXlzhuWR9?=
 =?us-ascii?Q?MjvdlSWQMymfiMGL7b2K4f+kpUUXyhdbMtxxcqxE3c14nWMh1RVLj12bd4qY?=
 =?us-ascii?Q?V2OToiWLoTeD3kSNeeTqhlHGJoRNu2t4UagNeyFObOzh5mn3DhelK/zdvro1?=
 =?us-ascii?Q?rX1h0E8sY3WHnAq2LTjQhKkLePORgx8FYMqRC+vS9aT1W4HWTVPlh/igHXup?=
 =?us-ascii?Q?33u3u8um8ShDce85rbOrND6Swz/Uf7KqX8rStIpiWC7McmxbWIxYIzgXkd5d?=
 =?us-ascii?Q?09Ahlkk7hvomQFz73UIJPB1pBtOf146eP5li94J6s/WFH7wPJL43o06muR4I?=
 =?us-ascii?Q?hWq8DO5Qdsderzso2kQLIGNuT/t6gzR6jj9NNR2czCWvaRd1LQc4N4DHvPAC?=
 =?us-ascii?Q?qXqNQD2sa2kY2b+XmJfq/uVsGyItTg6FZ6hQygQ6RiovZbbhj0v9FU22wnOj?=
 =?us-ascii?Q?/lVM/a16ga7ZhlDj1xCOVhv+xjEH1zRzl5eTvQgkMXJW3t0IitXD/lVvOKsx?=
 =?us-ascii?Q?7JM58WoDxqlQ3X6St3ergvXQNks6uXtnrCZUjA1Akyn0btYfZrpCnYVpBuMf?=
 =?us-ascii?Q?BLM5QG7kGqXA5t97Ka1SUJA3Ked/FAukTZoQFDNRCaP3LCOJD8N3Ccl1B7sv?=
 =?us-ascii?Q?uSW3kUKjL6b7SF4YZIF3acSL5Ke3J48fiXfnew+1woeoboOwWhGl4gKxeDQ5?=
 =?us-ascii?Q?w/cPEbFXSNMtQotiRy7g3NTPri2gOW4mwy3JtelKwdrWxPx01jRG5c9ZRnwW?=
 =?us-ascii?Q?lWbdRgnB6iS3cnubvsUUVcNL3K2Rleku9ShJ38YoLNVkldQTy86606W5Hf35?=
 =?us-ascii?Q?WwF48nX/2da5EqQylLG/uueFHNlwuMttji/03Cwjpbm4GkjNT0jiPuxKpepz?=
 =?us-ascii?Q?UW3A/dVzXu5C/CD9pFefqMn6i45VlhcbgavydbgFn0TUViWEYO+QaTw3lKTP?=
 =?us-ascii?Q?Na/rMBqDeDrxXKoFSjyG7oyTmbx8hFKXONp7IpxrMyYSMvhGwyBjqrRRpZW1?=
 =?us-ascii?Q?q+Qynn69Au5D3/Y6vOJdarpGhud1CaoQ6HfdWORa04ORcPNtFUfV+MvyvNRa?=
 =?us-ascii?Q?hZR7GYDYY11FCHygKV7V5NiHtyZAH+JUnGrsgihHDmeS1NG/GbkV/NCYm7+o?=
 =?us-ascii?Q?fW7uHbTz9QRZEh1z908ReeV3/MEmTi9L1h9BKQcReeT4dHWcicj6VCPXtuUo?=
 =?us-ascii?Q?ODLAufmtcGvHJ8eOvIAsfkDynnE9mRCkR+al3T4eLmPdqqj9ou0q6RwzSlPj?=
 =?us-ascii?Q?zLE7927E00j5Ld69cOmiY51vDPfQIYpU/26lV6Er11rf8zKUm+33PRZz3hdP?=
 =?us-ascii?Q?Qdler371m/5QTwhasyWwU3bemuuIchcsJA4HNwmI+DstvoPobIqHIrDtJHje?=
 =?us-ascii?Q?bSCsHtpCCi7rxaE9tbNr+IGpcKPsY0W4/2CB8OmxIGzOiRMEa5hArMwV2riN?=
 =?us-ascii?Q?M5JWhDmEjUpPA8nGQDfiA4h1BRD4yZQDQRoTKzbgD/hk6362F4Gg5iUKUIRY?=
 =?us-ascii?Q?AO5f9wYiKGmiqaLt94bFLYNknowIf9WJKuX+4uF5ob97tu+jYxqo7jyXEmLS?=
 =?us-ascii?Q?jg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba4ff568-2183-449e-8708-08dc95641b12
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2024 22:13:56.4561 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oQsOOVtHJaSdYo5tmd1LkcH3EftU+7fYooui2Ath6UMmfZLLpOTUolTl32sjQ1juBCgCETBCPQv9/YZ5qjXVEgNMIG9bjgzgUsZSbWUgr0E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5967
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

On Tue, Jun 25, 2024 at 11:38:42PM +0800, Umesh Nerlige Ramappa wrote:
> Per client engine utilization uses RING_TIMESTAMP to return drm-total-cycles to
> the user. Current code uses XE_FW_GT to read this register on the first
> available engine in a GT. When testing on DG2, it is observed that this value is
> 0 when running test on some engines. To resolve that, get the hwe domain
> specific FW for reading the engine timestamp.
> 
> v2:
> - update commit message
> - use domain specific FW (Matt)
> 
> Fixes: 188ced1e0ff8 ("drm/xe/client: Print runtime to fdinfo")
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_drm_client.c | 7 +++++--
>  drivers/gpu/drm/xe/xe_hw_engine.c  | 5 +++++
>  drivers/gpu/drm/xe/xe_hw_engine.h  | 1 +
>  3 files changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
> index 4a19b771e3a0..886965e81465 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.c
> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> @@ -260,13 +260,16 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>  
>  	/* Get the total GPU cycles */
>  	for_each_gt(gt, xe, gt_id) {
> +		enum xe_force_wake_domains fw;
> +
>  		hwe = xe_gt_any_hw_engine(gt);
>  		if (!hwe)
>  			continue;
>  
> -		xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +		fw = xe_hw_engine_to_fw_domain(hwe);
> +		xe_force_wake_get(gt_to_fw(gt), fw);
>  		gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
> -		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> +		xe_force_wake_put(gt_to_fw(gt), fw);
>  		break;
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 78b50d3a6501..97f43ba3a00f 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -1130,3 +1130,8 @@ u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe)
>  {
>  	return xe_mmio_read64_2x32(hwe->gt, RING_TIMESTAMP(hwe->mmio_base));
>  }
> +
> +enum xe_force_wake_domains xe_hw_engine_to_fw_domain(struct xe_hw_engine *hwe)
> +{
> +	return hwe ? engine_infos[hwe->engine_id].domain : 0;

Not sure if we really need the ternary operator here since it wouldn't
really make sense to call this function with a NULL hwe.  But it doesn't
hurt anything either, so

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> +}
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
> index 7f2d27c0ba1a..900c8c991430 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> @@ -69,5 +69,6 @@ static inline bool xe_hw_engine_is_valid(struct xe_hw_engine *hwe)
>  
>  const char *xe_hw_engine_class_to_str(enum xe_engine_class class);
>  u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe);
> +enum xe_force_wake_domains xe_hw_engine_to_fw_domain(struct xe_hw_engine *hwe);
>  
>  #endif
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA3C2C25B78
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 17:22:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D853C10EE0F;
	Tue, 28 May 2024 17:22:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e8N5EH1u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D45410EE0F
 for <intel-xe@lists.freedesktop.org>; Tue, 28 May 2024 17:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716916964; x=1748452964;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EYpqQYDmtdDG8n5KxobIPEWswF1jTXXYgi+5hv9GJ5c=;
 b=e8N5EH1udFqZnlOcEufDmfnfiigC+XpV8merOI+iYRpAbUOCJOIPwan5
 Fn3G+bMD0lTXB+Wceyg0sy0OK4iV6rk4LTgNjDsOzJBBTyHavTV6lhcWx
 dCny+OLBreYMZu6X0dtJFxU6S8szqhiUs7yiX511T8Y7BbNH+wh7iJdGD
 xoeOWjZS+TIAJJuFakFzdg/SsgPbqjO68tSrU7wfjTYxIrc6gSlRni/ij
 ZghpxkJlkVt65KvHLTUsSMYe6hE7VKsiNCXZvMGsK9d7ygDnMndUzXVX6
 GJ2w8U4nmEzQZGGMwF8ofAKqPGSM2FDzkddgNsZej2/VAtI4TNrAoxo5q w==;
X-CSE-ConnectionGUID: NzLibJH2QOC8Ybc2teSVyw==
X-CSE-MsgGUID: BGD0V1xWRv2RGhlcyOTHQg==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="17110434"
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; d="scan'208";a="17110434"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 10:22:38 -0700
X-CSE-ConnectionGUID: MbAQObCUQge2uELRMuaDPA==
X-CSE-MsgGUID: B7ea/1m4QmCsaF8+hudg0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; d="scan'208";a="35117762"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 May 2024 10:22:37 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 10:22:37 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 28 May 2024 10:22:37 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 28 May 2024 10:22:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=leJ+hAcXGMypNpcEKY6EHfdP9p5UuhNtiVydVySZFMxgMk8kLR1mGqhy/B1/R3GdCDti3wszr5ea28kyqoAUjVQmDgaKmKkU6moxy08UnlMA8hFqjgT+Cjt4TWoSS+T7F5Q4cKEEXsVB3AhHzUWJJfY9m8/bCt6h4nY8Aa3A9MN0ebVpcCozQcQSz4he6SFzyKEl4VoRd1nUUrhTAUlMSIC2sr7aqj+3ZVI61LxDI7cVRgQM7atFlNq/8XSXOTvurKNG6HM/T/YZchw4hHc4DFxW8mf/oVIXCUr4BYoIjQ7nPdTTw3a5KAGi2VspfJ+BLAiK03+MIybAMwl9cOs09A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kizlSJ4/PM7PyTQvINYy1WAnXvnJSGSxSb/nffsAodA=;
 b=JGXY4WZyGHDQi3c02829TGdr7d5PG8TXukoqji62tNVH98wLXSm8NdJm/pQS4ap5t0g2XiGN9ayqU3SMSx5Bprr+n5WY77Mx8XKHcMoAHnbjNzmBWh8OsjTk+B7rfgaaYabdQ8IOybxBp734+pJ40c6h1r0ELI07rw1ABmQEx5RJtyWzicFPFW4U28vVp1rI0poscr3tTcv5Sk8KktKzVb7dtZruollBDuHx4AIVOcsJznES/cSECo8Ih28k7T/ULjqqr3KhdW6yzFEzA7ojAsLS5w2fEzRwIZbyjinWclkJlToSoy+RBgW33zhmY59jXaV+RONGlTP+gJwjUQSONQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB4819.namprd11.prod.outlook.com (2603:10b6:303:91::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 28 May
 2024 17:22:26 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7611.025; Tue, 28 May 2024
 17:22:26 +0000
Date: Tue, 28 May 2024 13:22:23 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/xe/client: Check return value of  xe_force_wake_get
Message-ID: <ZlYSzzsY5xepVreW@intel.com>
References: <20240528101132.14788-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240528101132.14788-1-nirmoy.das@intel.com>
X-ClientProxiedBy: SJ2PR07CA0009.namprd07.prod.outlook.com
 (2603:10b6:a03:505::6) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB4819:EE_
X-MS-Office365-Filtering-Correlation-Id: e4c15150-5691-4145-6412-08dc7f3abead
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UK2zkXXWDY4ZU2YD+QLrvdYhXptdz7AB8jOfX3meuy+K9kfY4ZfVn7iEGyQG?=
 =?us-ascii?Q?wnb9f5DCxsPXyl+QuoWBOz5zECwCs9sXFxbrdr7YPfePmhPbhphfSqy5/iYu?=
 =?us-ascii?Q?z2p74eAfdbbemPck72/XT85RY4NF3LVJIaRtYDO/JbWAgPoobIk8wEt5p8KH?=
 =?us-ascii?Q?i23Hz/M4dGF9xrNk9K9PV061RI2Y5s7l+QAxRO81wC3Ij57HJ8AEQPziLRjA?=
 =?us-ascii?Q?RFRC8dBgxXjxDM+QAMS/TNiRlxoUNJHvqnbiyf38Ykav2cYzx0xgjk8jnvv8?=
 =?us-ascii?Q?3nbOIg54JKn8S8/mIv2zs1tZn1kuPxE+DoRvzD03WcTvrGYKpa4C0+BzrYud?=
 =?us-ascii?Q?gRv/xBIXBAiqLwcxGmJgiFuvCAQqY7dZ2c6msqkBlBPHlWFXfLaEPLaWcDGR?=
 =?us-ascii?Q?+MqI+M80TUpg7Pi/OJer+hjL60LTxW/daE1O7caCi9IV4lkn9FGQogzoCR5n?=
 =?us-ascii?Q?pmS3I3FrVobCcVZ8PRimTa/tEJTIDJxp6VglOK5R0wiRYeUZWeZeZt7c+bFG?=
 =?us-ascii?Q?kEEwnOgLnxvGbscQIg2C+SbUf6LT3EvyzVLHBknStg1WhW3mYnfw5U3PcCtn?=
 =?us-ascii?Q?WMkzwPvHH0cyTxPhizzGgATcpnw+a81XgJLqU3ggEZb9UcjtfezOVWZlN97d?=
 =?us-ascii?Q?wmZCUwP1TrPd/iKHnUG9PkzX0UEInsiy+wSMVR5mM4DUBLxyQJjw2pQVxMRH?=
 =?us-ascii?Q?uC3qB6HYMPIuUGcQRaGPK+mx6Z/XOwHymLn8zDZ8AOGyXM9TIpj/DWgKDUvb?=
 =?us-ascii?Q?izNh17IpanvGgoh9HTpBBBddI+oRMFrbz9m7Rpqeczho52BOP46B7wHvdy15?=
 =?us-ascii?Q?KDp88lw4S54LIU5bQSl1iYKPoW6Q7DTLLCC/pGgCRj9mvqOLPa4D1hzdmdEp?=
 =?us-ascii?Q?NB8vyBY/haE2YSCPE88jcdn6tfaVOwTBPngXVOj1a2hEoO4ftol1MA5RrOwG?=
 =?us-ascii?Q?qLN6PSrjuclFb65/X6vjatr6ekW4vPOcxYzqDEoNuStH4IulsVHhbm/p/X6I?=
 =?us-ascii?Q?Sdj3cVQ9YBoe0CYiYYhSulVfaUWfLqeYZE3ju8v8tbITig9lf+mshv7maTkF?=
 =?us-ascii?Q?h59cLgZZ+G7mK0p/Jqx4xMZeWHnT/3pOkYO0iw4PTlPg8gbHsX+JeiJ2ECga?=
 =?us-ascii?Q?ooMOGzmZrOIm/4x6VVylAfVhRpdlgTJH51XQZ7GWFVw70iKYlvsu222YBr4A?=
 =?us-ascii?Q?NYrzVpqf8b1Bop18Mgq8xKnHzMzvZAdcdacgWe/EvliUJV+wOSjK9rvadUWN?=
 =?us-ascii?Q?L7EfLEBNp6uJjr5XYSdn3vb7pPABLEUgzMMS7LQtCg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xS0ANcCLaCg6Gj9k+G5jIGFA/8snVvak6FQahFU3nbkJfdCH6djfEuWgMGSn?=
 =?us-ascii?Q?AvUURq0XPmc+1nZLBDmrozA8e6WjRlRvgIzN0boOUYIblIh7f9sGMhpCcOp7?=
 =?us-ascii?Q?j3s915+exvko6bFqRGF7WrOP0Eu68zBRFiIn3qSQBhNKRUTfaGXAHxuMrTFj?=
 =?us-ascii?Q?pDLNI5UM1cS0J5k4iDBQ9g641KhUFDWn38jDQE3bz5jpN96Th6CnnxN1ux3E?=
 =?us-ascii?Q?FrDXoqg3c4oFiz4Dm0VmuivP20axkjpapqTwRyMPL/7RhfN21LoAishSdqMq?=
 =?us-ascii?Q?ays+NN3REFvOma+Y22MnpZbV1hsl55p8p6rTeZtF1C2LlR3p2n+u/uQqrjHD?=
 =?us-ascii?Q?fgzb6XD46p6lwnPNU0rOKAxXDMHdD3GVd5eBWqpzLB+C7LI3l7OWCi8eKs2t?=
 =?us-ascii?Q?n7VP6XpuwK8SKi8ak9/qkD4wCtEzrdaEgscxJ4ZbwkBsabx334wY9bo7ammf?=
 =?us-ascii?Q?0GJOnZ/7AHyec4mS7QyT7oQlerCg/4DljCIOusddeoScij8K4hun0ZTDduQH?=
 =?us-ascii?Q?vhzkd9b1KHjU9Aw4q5G5uZW+ATcWQLDHlZrMsUdxuAAx6v1v7LQDXGxbdvC8?=
 =?us-ascii?Q?9kFRQM0zOS65FchKYcmas2CKvnqCXae6GZMjQyKqVUGPyQdoKvllT/s0wlhL?=
 =?us-ascii?Q?LLZeW09kNzsuLnyvZZH3Ud5hln1muGfqwg8hsZjjJ6NboVYXJuoKbQLEC4a3?=
 =?us-ascii?Q?7eLSVQ68NC1bGsNJIGohNq+aYnTTSVwA8S9F74QwYAl0HQdrKhrwvmMbfzCT?=
 =?us-ascii?Q?cWsCnFX5C0bITDDr0QwAWES2i9RGn1i0zCpZEgiCYP2tDS4aqrNzDGs6JJ21?=
 =?us-ascii?Q?5uEpVgg0FvYOlHmOc1KVEqQaeF58M6qtLFjtfg5fNlY5z7cQFbNEgQLjblJz?=
 =?us-ascii?Q?hMY2UhqwJKgfk3qkPp8ndAKX2KF3tCp3YRlDSpwojO+LnSL2010lTGuTy/5j?=
 =?us-ascii?Q?Jm6S1tTVudxR94ogAdGObddXXW62qrRVSNb60wGFPfI5Gj846i9HeTks0RIR?=
 =?us-ascii?Q?CahNTZbfhY7cAFHrsJA9CPT9GHLvcgirYCQUzXdsx5FKMroB8MpzhalD5+Gg?=
 =?us-ascii?Q?0psIkU8QL8Yuqr8vULVJLLqRvWn1AXCQtIsYRHUWiFHTKe3pvyzsqSEPBqd/?=
 =?us-ascii?Q?Qyoq1CzMf7KNo0dHCaBY1RotjKvVf+yidxbvqjOYiGwbgsTEyFFYklSukZ2X?=
 =?us-ascii?Q?WCgBh/K+9fh+CTQrHb5W0g9/GGKnobphfYk4nEaSlZAmQPfZqezC41GxeTtr?=
 =?us-ascii?Q?pMfCpkwp0JCVqj5t7KNaax5Ar3xeLD12rBRnQAUeecWvd9H5VA4YHrOEdtTK?=
 =?us-ascii?Q?eCFWoF7THuTJmOsF2S+G2XYY2Un9Iqo9D4en3h0hWoks/b783FefwuipmcLX?=
 =?us-ascii?Q?n1PK8XZJGoxQzapfQeJy9pc56iSNNhB/ZBQLbW+rer9hPjWXuns5MS8MiIeL?=
 =?us-ascii?Q?lWqPwd3g5iiaCtFOZNCkWz3JALAw/YryO9IUsTMzDRZs2Q6GfSKWEh4m7WU6?=
 =?us-ascii?Q?1x+Ws8gxiGSEPLr83rj9D+c/buq47ti7hINxsvLOKOhS42pFix7nGpJsIDIm?=
 =?us-ascii?Q?NE4bnH6rs+4XHSZUpnipbAjqBDa+BsxG+JDeoZA9?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e4c15150-5691-4145-6412-08dc7f3abead
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 17:22:26.4580 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PZwSvrNXy9Q3Bc1a5oBWWHpsCPCiwliRDRsdnLAXN0zPHE08Xp5vQARNDl3Z8kzqxZqICuktusNMWMaAeu16EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4819
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

On Tue, May 28, 2024 at 12:11:32PM +0200, Nirmoy Das wrote:
> xe_force_wake_get() can return error so check it's return value
> before reading gpu_timestamp value.
> 
> Fixes: 188ced1e0ff8 ("drm/xe/client: Print runtime to fdinfo")
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_drm_client.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
> index 4a19b771e3a0..0c13395ffd34 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.c
> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> @@ -245,7 +245,7 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>  	struct xe_gt *gt;
>  	struct xe_hw_engine *hwe;
>  	struct xe_exec_queue *q;
> -	u64 gpu_timestamp;
> +	u64 gpu_timestamp = 0;
>  
>  	xe_pm_runtime_get(xe);
>  
> @@ -264,7 +264,9 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>  		if (!hwe)
>  			continue;
>  
> -		xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +		if (xe_force_wake_get(gt_to_fw(gt), XE_FW_GT))
> +			break;

worth adding a debug/err msg?

but up to you:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> +
>  		gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
>  		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>  		break;
> -- 
> 2.42.0
> 

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8058CC64ED8
	for <intel-xe@archiver.kernel.org>; Mon, 27 Feb 2023 23:03:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 234A410E1ED;
	Mon, 27 Feb 2023 23:03:59 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12C1410E1ED
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Feb 2023 23:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677539037; x=1709075037;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nOzEfesVJwUNpdvbZt5x5pii7zLtIpzukx8Tho5uOj0=;
 b=PnuoZqwt91DUU0PTRtc1cgnuyej9OmhQPZZ4lG465Fxttdtd2ZhbuUb3
 lGHNy7AC/ihM7sD3Xn780hnvoGS8pGgfPhrZ+D0MgZv8B3hn7F2sf3EFH
 rOVbk8v14y0ALxnQu2v+rwRA0WRDa+P8t1nMTaZUK7wSZEwbHhr3LW+Lh
 eaPmFAaK/ZE3MqyiS7p1+eMU+0N5L5Z/Eyqc9g4S5WUOBH6ZxPM4scScZ
 NrdthimhUMQ4ghAXwRrY85zta5puC5xKZo4UiywP38YXiIW44N8xOmR2t
 EenqAHS562HiUxCeakDR/v+yTaLy/4rRpxqE46K9lpQbfoaJT9H4RxQS4 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="322238047"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; d="scan'208";a="322238047"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 15:03:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="651397507"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; d="scan'208";a="651397507"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 27 Feb 2023 15:03:56 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 27 Feb 2023 15:03:55 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 27 Feb 2023 15:03:55 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 27 Feb 2023 15:03:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nt/SvnLEgQRIeFgvbXgmrfDBabxt/PRi2q4dlswPfJxtPivQRlM4yvpSJi1Yyj2Xt04iOAlPEam5+aGmBt3LAlsGQ+SQBNJTcYL/Iir1tgBr+o5Q5Bji4ymZLE62qnBEW3BXKx2XWzEdQkHxN4OVRduTmN5ih+FLXiP02WCsAB7SKWTNOcOEGGPbsfyWsU4YZzFmv1GTF+GcSF4FIuL11OMBfvsJClX/12HBIPw0G6hJxcgImHJnADQWWVlqYMZjYz+VJFhqZ32yXcpMTtOScXIRQw0ryowsr+tDJE4CPBc/xdTVpWxQuUGjqPyzxbyj/dfDrMtbBpE7oIn0/eeobg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GTvdThIMCk+aXFSCj7xGkZg275o371sJGduHsVnI8aY=;
 b=ETgs4y14T7LT5RIFjJnY0mkhvFlv9BArwT8V7CzumZOleM3rykz3ee4n1e7hC5ePYR7GxT1ZpS0Y+/hV6TfofhhvSZ1aOleRPT5jPKInTtmMSjYh8metVm8A/JoV0ZHWOeflq/Ui/PTnbiPGJwe12CAk1zINFMU5Ai3zu6DrnLwseuYz5+qFJnDYDrTke56eBMbbl+jEqFZQURHPlZTVg/N+EhXx1SEOwF5QRoySttr/IL/m7Zv548Jfr0dQ0bkT00/dkjwhI17S4mYOcfCJFlI+2+EXfi5BI1jJ7b5gEWgWGkfDzD3Hk2ZqQJ5RzL7jhQzBPlc6HGP67UnV1/SSaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DM4PR11MB7327.namprd11.prod.outlook.com (2603:10b6:8:105::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.29; Mon, 27 Feb 2023 23:03:54 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b%6]) with mapi id 15.20.6134.025; Mon, 27 Feb 2023
 23:03:53 +0000
Date: Mon, 27 Feb 2023 15:03:51 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <Y/021zSAbtZAi+ZF@mdroper-desk1.amr.corp.intel.com>
References: <20230225002138.1759016-1-lucas.demarchi@intel.com>
 <20230225002138.1759016-3-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230225002138.1759016-3-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY5PR03CA0015.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::25) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DM4PR11MB7327:EE_
X-MS-Office365-Filtering-Correlation-Id: b20d2fb3-0896-40f4-5c51-08db1916e5ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D/sCrQ6R3+5SvsbP/ag01qzA/5SJKXpjjSHIqyiijrzYIW8xbGn26ashe8/uD+mrABL+FXVM+niUPHLZsgGbInUdLAH+rgghu+Du0eu2Xv7n8DX8knLO4JDTaGY0bvBPtNYAtU5ebioG0O9pc3o2FVo6Pa2pqi7Hw6Aemmen5G4ZBDL3FAS3WYwKtgfPEBPVdAgCRO/iK/Q8nUNIxpknHSn25wIFZiWQrrBwyjlNCjGBpl9hJ4KNkuw9UUHOIzKWL/C+6poOjYQ6ogiDlp8GxIlLw2FPtFPFmDK0fx056H1hZXqAFTDSyLfduPhcbd6ILr8fDi5po5AEr8nAnxEu2LjvSiqw3STi93Rd+LPC7zIZVuzERvGHB6a9HHgCeoxDl5g2hMPR4Ok7VXu+iXm7VDGpRSQ3sR0+AaeZi2sdvgglNWnl1LtjdfJ00YPvT8sEJPy1wLNrtQZBo7AzFGKrATlTgrargUB6m9kiyMbviRFgls75AMvPtyNJrkjf2MUXZ6rp+rvEbs/qTLvkEW7unRMr4muzCYUpajYwWVyIMypA0Gqt/Tfk6hK1euJI2yYKkfeHRyxWenLxE7rUTQlKzDcF5KdRQMw1lR9MJWgieVZZlmdxx3qh9YaVPthWgdBWHM8SlYceeUBdtCfk0BMz6Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(366004)(136003)(346002)(396003)(39860400002)(451199018)(8936002)(6862004)(2906002)(5660300002)(66946007)(4326008)(8676002)(66476007)(66556008)(316002)(6636002)(478600001)(6486002)(41300700001)(26005)(186003)(6512007)(6506007)(82960400001)(86362001)(83380400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Qjxh4XOdLE9CX/sfHQW3t8nB2/GGh0rblHyA9ezOglNp0Uq6k0EPa/LkUShw?=
 =?us-ascii?Q?r6xxjudH8X4SKoRapnCfl/keGzHYOtod+KX540tcDRj6aivKAk2IqAH1ffSC?=
 =?us-ascii?Q?PC3nKkgZPO1Bu4atzhQwWEpun+E1sckJ1FN1uEYlPl42T6mYwV5gLlx1rigV?=
 =?us-ascii?Q?RRXZH85GCkohjNacj0LKdUY5U1ts77ftbpp49zuiITsdPjyWCtxdKGgEDxwr?=
 =?us-ascii?Q?FdqgFy/4oyZm7R+qa0jMhB4vuOBcs7PH9+RhwSTZa0fv6LKvDlnWelB4W0yB?=
 =?us-ascii?Q?fyJK6h6dM2pWr7Oj0f2qMWKuHbOoS5CHU3CD7jr8LzSc3JioQ+z6QK0Re0ZN?=
 =?us-ascii?Q?TcNcxkB6evYKE/QRr+fJNx9jXfEpLBVgr23L1ZdAU6ERKKXrIMY62PrDsZOh?=
 =?us-ascii?Q?ndnLG8WvF4ZhKsfxXE+/9PxgTLnQKN0IKeE7a0n1/HfvuJ6MJtVOT//932CI?=
 =?us-ascii?Q?7nOiMB69Ix3NkKl2/30cS6kWWYNOXFHFqeXeb+KBmLQsQmDpJfqVbzTk87Vw?=
 =?us-ascii?Q?8rQYPfyyG9u83WGLNtVxGF+47C7oDsvRK0LBlRY54zpfq9Gm5L3U3kWck5Ns?=
 =?us-ascii?Q?yhqVuZXrmsgvoRguiHUVx4SpfS1aoxyTutYoVubPNN2Qf5LwJDI9Px5ha3gL?=
 =?us-ascii?Q?/FfjfsIzW/XM6ab7E9fYDcL3cHi/GI6q+/OoDM51NABeFJqEN2m8QuL34scM?=
 =?us-ascii?Q?nI6aYJOMX9Rzn4KVsnAyyPhwsGxwsHwaPvaXw6LIVtz79mbCQXYHtH0ikaZ6?=
 =?us-ascii?Q?AgrgZEXt2RIbU3wwzvmuAaQAfgaOne3Dei06wdq5b7Scmx3Teb734SjP48DQ?=
 =?us-ascii?Q?SsJcI08jUkuiZ5HvAQg5aFqCYEVfdry76d6582yCj/raKOr9/UeNl7lqPAD1?=
 =?us-ascii?Q?9Q4KfnM2QWmgVBawkrDVmklmn61+bZHXsvhfcrDcO3h7r0cZLULbYlPRSeaD?=
 =?us-ascii?Q?qPuaZmv1HzjDI5wJBnQ6uB6Zet+OIR3FXU8CBdCCE8/GNL2KWeoB5a998/xc?=
 =?us-ascii?Q?cWiCBi6vXeWZi2TPkViUVIZJwYFHxfNusrNAdDQd8RFzA0RldCvMXlA/59Jd?=
 =?us-ascii?Q?dqZXYshiF79Du5vw45ZnSuQzrLe63npmsUeVrCARzPfTrS0iRZWCluW9wiY5?=
 =?us-ascii?Q?Tf4I17ajlIH1OeKP1koJjKADsOdxilbs0ePLzPuJyZytgQImQXjZFDzxSI0M?=
 =?us-ascii?Q?R1H+Q4GIukPcjHVKsXYVYN3eMdPa1Z6aLD6bfprIxC3dmSCib3PDwX4LNHWa?=
 =?us-ascii?Q?NiGiEf/4aWBivRrckEwwqn8duI4xi959XQsv0VAPAp2ITHp/jX3oVn+Cuo/o?=
 =?us-ascii?Q?ZJKjIhhTzO3lO2TkJwUL1Q8noT5s7UKbIJ2GB35g92nWWXz88IKcpd+Xr3OH?=
 =?us-ascii?Q?MeAuqXJTyz6TvLMp85eHCsdgSMabo+bywoJWVRFT7OBwZ41YRl7jip9ckEAE?=
 =?us-ascii?Q?F72SebvfRocWv89mJT+iDuxI2mLO5dOfyeX9djfVTMvyyyDDTlwfiPCHB05k?=
 =?us-ascii?Q?DNE3deMqp8uVJ767EAiy+rff1nhCqhjuVi/7PjfD7VBL1FQ4o2Ee+/LUTAhe?=
 =?us-ascii?Q?P45F35JQZcUgO2xiJGzeMqyeXWqxCglUKYjvHxdi9Sqs5Krq/MBwXnDT/9nH?=
 =?us-ascii?Q?Hg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b20d2fb3-0896-40f4-5c51-08db1916e5ad
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 23:03:53.8251 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5WcGvNLTxHiq4onu46pSKMr6lei8EKIv+Umk0Ft+9gUQv+DJZEuN+FjW7zzHPe/s+aDVYe6a6kS+Oo8Jp6qh27ryRrq8ziMdBW1+FdvRa1A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7327
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe/device: Let display init in a
 common block
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

On Fri, Feb 24, 2023 at 04:21:38PM -0800, Lucas De Marchi wrote:
> Move mem_access.lock initialization up and display.hotplug.dp_wq down so
> all the display initializations are in a common block that can be moved
> elsewhere later.
> 
> Also, the `goto err` is not correct as it misses the drm_dev_put() to
> correctly unwind the actions.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 5e2f5d93f2ce..1e7fa507c123 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -206,12 +206,15 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>  	INIT_LIST_HEAD(&xe->pinned.external_vram);
>  	INIT_LIST_HEAD(&xe->pinned.evicted);
>  
> +	drmm_mutex_init(&xe->drm, &xe->mem_access.lock);
> +
>  	xe->ordered_wq = alloc_ordered_workqueue("xe-ordered-wq", 0);
> -	xe->display.hotplug.dp_wq = alloc_ordered_workqueue("xe-dp", 0);
>  
>  	/* Initialize display parts here.. */
>  	spin_lock_init(&xe->display.fb_tracking.lock);
>  
> +	xe->display.hotplug.dp_wq = alloc_ordered_workqueue("xe-dp", 0);
> +
>  	drmm_mutex_init(&xe->drm, &xe->sb_lock);
>  	drmm_mutex_init(&xe->drm, &xe->display.backlight.lock);
>  	drmm_mutex_init(&xe->drm, &xe->display.audio.mutex);
> @@ -233,15 +236,13 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>  
>  	err = drmm_add_action_or_reset(&xe->drm, xe_device_destroy, NULL);
>  	if (err)
> -		goto err;
> -
> -	drmm_mutex_init(&xe->drm, &xe->mem_access.lock);
> +		goto err_put;
>  
>  	return xe;
>  
>  err_put:
>  	drm_dev_put(&xe->drm);
> -err:
> +
>  	return ERR_PTR(err);
>  }
>  
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

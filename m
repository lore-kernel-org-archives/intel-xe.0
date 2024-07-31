Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A99DC3DA49
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jul 2024 02:41:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CEEF10E28B;
	Wed, 31 Jul 2024 02:41:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MX5aY0oi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89C0310E28B
 for <intel-xe@lists.freedesktop.org>; Wed, 31 Jul 2024 02:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722393670; x=1753929670;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wHgU5rSuvhcDHSAQRK3m926ENsB09NfWTlwgAkixmcA=;
 b=MX5aY0oi4vyTggWG2GY9c9prTo97aZyE62EXlmM9rq4Fw2hmgfZnPH4M
 9h9bklZcNdKtlRZGG8z7C72LJfHQRPBJR34WtW0LYBlL3lOa9aFqa2zDj
 wkGTXu/7KsbMbEzLyAeUQKPstzgrSUyb4uVTQfMXRr6YY2/LvYTDC6UNu
 fWYIpGHreqrKZhzAE3p8xEZLaugoVDTTIXqAik5O3X3pjsVPkuNSUKW4+
 e24StkfC0eLcam0kUw5hy+5tKg2pJ23LSYRhxm7VHMC2nDXy8QOb6l0q7
 SW6G8+GkFIezPgBdt1d8oPAws3dBJM4HdLrVek5m7xtHCH924FDcG+adX Q==;
X-CSE-ConnectionGUID: +NQwkrvlSS6MNoK6HRMHSg==
X-CSE-MsgGUID: w3KtZMK6R/G4jA6F3JScHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="23164249"
X-IronPort-AV: E=Sophos;i="6.09,250,1716274800"; d="scan'208";a="23164249"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 19:41:09 -0700
X-CSE-ConnectionGUID: ZOqPKSaIRAOLQFWn2m6rsQ==
X-CSE-MsgGUID: IyWo0uolQHilXh4MXw4Q5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,250,1716274800"; d="scan'208";a="54786286"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jul 2024 19:41:09 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 30 Jul 2024 19:41:08 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 30 Jul 2024 19:41:08 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 30 Jul 2024 19:41:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WDJTqsVB+3DHtagWX8DK5IibDWXLLsL57f5UrtHniu7J+a+AZUQj2Cee+uqooRo34k3YBSENxvPM9IgaX/w6LahNMWGYBwN9MrtAzEqpsiHrpRRsyQDFg2bKq/cb5F4uyLr1/klB4WxO8BUbUEJlLM2CUmmOWGIVHHLh8MrPqLZTMOe2GWe1/pS8q8itpr2im25NnukJwzMgtjFZhbqQznlZhSY9am749XPM74JhDguPCGLLeT74yylyuY4ew8Dc3eGm93XfH8+i/mJ/ktwTRA2tLsVFSIWn9cWVs1QGL3SwJuyNYhvr7bWC7p1vOdUtOicPDL4vE2bdxs/j1LVTWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PyK01l5O1+GxqAZMUIPzJ6o9NsPLNc2jt2DFxCmWuKM=;
 b=IlnQ/5A/krBxb2ZZnMolYHhuMUZlmaGpkFjbhP/bZ9c/iEH9zln8U+TQ6AKTk6Qmlw630Mg6nOvoT6Tz9WJ0hY3d2aU+VXITAF8WB4rx3EYsFTLyA/okMgGcpodAC/prtcZvQgPM5SubuOB2OHKRoIGek7vJpwvFYTKxN/k66dCTGggTv2NLJ2WvWtgH88CujRWCaXS9LdvtD5eCfUUffdXLho6eH7iClgOX1SuYzF5F5dJz4mArh8VVcJvIDBJMlFE3bk/3udiMy6U+zlp3MtADRFG/wBaJXSURjRkQORfQAldSfeYBAyslEq/Z+YXwf3NpkwYUe09dmJZSC1EWUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB7096.namprd11.prod.outlook.com (2603:10b6:510:214::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Wed, 31 Jul
 2024 02:41:00 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7807.026; Wed, 31 Jul 2024
 02:40:59 +0000
Date: Wed, 31 Jul 2024 02:40:07 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Dominik Grzegorzek
 <dominik.grzegorzek@intel.com>
Subject: Re: [PATCH] drm/xe: Move and export xe_hw_engine lookup.
Message-ID: <ZqmkBw4iGEUcMQSP@DUT025-TGLU.fm.intel.com>
References: <20240729130152.100130-1-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240729130152.100130-1-mika.kuoppala@linux.intel.com>
X-ClientProxiedBy: BY5PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB7096:EE_
X-MS-Office365-Filtering-Correlation-Id: ee5431f7-bdc6-4cb7-bf72-08dcb10a3647
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PP6SpPBRlwCgaQtMOz8bjo+YXy2M7Z/R1RWjnBq6OzRFYrToRdVLcoEjce0J?=
 =?us-ascii?Q?ic31zfSjmi920hFiMUNS8NYmfqtRUQ0/9OvMgLsZPGw2v5tbGWwCkyt1mUEn?=
 =?us-ascii?Q?m++dLjCW8W+PeEDY02EidQH4FcCUwjOqV9o/ada5uyLEx3acqAuseCAfmhxo?=
 =?us-ascii?Q?vfosFqQMrjUFLKtKK0h4fGjvBfbpzL5H+aV15wKOUWR/DngXnmGDwVqghbyd?=
 =?us-ascii?Q?HfABHDTqr8qa6HLMerXUWv4sqzqASiBmgRfbX2/PVZHa6X/ydiSzLgPedGUB?=
 =?us-ascii?Q?jb7Z85J8r9ufE4SksCa7J1AS/r9VbJjvS/eEgn66VfVfBSsceK0os7sxZENY?=
 =?us-ascii?Q?UgM1K7VWzNmpDPfhq7+ZsbFt1chTX3e74uEjLIGKZygRdcJCrIk3w9T7zn56?=
 =?us-ascii?Q?3ERtGB9HgEIGSOUIQH5TMUmkZ6j30OXrXTyKIAlaqIZwsmUDdiI/T+SpBNQ9?=
 =?us-ascii?Q?woGQNBSZnCjq69pnh267y2JugqztxxLnxXKL5hTE6U4M8mZo7n7p+R840/gh?=
 =?us-ascii?Q?onw2AEisAcWvcPBkM2KOcI80WU1b6tLTuDqUUxWtiDAbH/BN6i068yuUtJb+?=
 =?us-ascii?Q?qvP4CMvwnNkASRN+lxcR3R8MJvIFtmzTHJmsImMNCSsI4tmb5HRut+iq2aJH?=
 =?us-ascii?Q?7lCJtAfo593z1VIa4Uwtw7x/yQiz3jNEcHA4vnrmZLs6SlP6gvcKyGBdfvHh?=
 =?us-ascii?Q?qXWx6MvZqVChOTiZMKOUF5qDKo/PS+azh+klTg0PVvbBH59w9QIu+3zCADkt?=
 =?us-ascii?Q?15dxpUvlr5Ph25ukAzT/nCtnF5YNddTnCs9bl5RHz8aa68KhxlTzuZmx/Xsk?=
 =?us-ascii?Q?SFijy/SSD1Jato+81fFF1j0RL44FbKNAv9L1jgGH0u0bSsPGKRzGMgvbBUuS?=
 =?us-ascii?Q?yRJ6jaVf/Ho0cV9yn5hckgIWFIPaStWWQ0DWyH057EoddGi77ElVUxif8GQf?=
 =?us-ascii?Q?hYu/DwB8P5En4Qaz5mUXq8Kn1g8t7kGc3jvqa8ciqH1xqldSt4wjKuB9iiUo?=
 =?us-ascii?Q?94TOOgX7w9MAFVphVjZS4VpfJzPo7o2xQ20ebUARwaPod82tzbtkX+N5WoBD?=
 =?us-ascii?Q?zllS/XExynk8fpbqqwCHCjL8O3xtjiUWSSmv5c4cdp6bZaq4aW4MxTrTUVnU?=
 =?us-ascii?Q?hlWG4YdsZ8N41VQC4r8Pmt/MSBq+JrotA6g89iTnCb/wAtllldfDObpPR0Sg?=
 =?us-ascii?Q?Wh4NJCF3hW/GuaqW8ggw67+cgT9u+JElhBHZXtl0lDIOYKiiacZSN5dz9GhN?=
 =?us-ascii?Q?iCPnC2z7SIL7VycEVPNr/O1jyDt9fsalOE5yD3xFLZG4uLLNx0ARZXDKGa7s?=
 =?us-ascii?Q?VTJa8QDZwSf+ZLcKDVLkNxJx+lkL6kFN0peyQk8QFx25Ig=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1h8BT3OrfiVt7osQA27vMmReGztqhMf4W/8YTstVLB9v2jkqryWV0qVXlZ4R?=
 =?us-ascii?Q?el5jDabJquW/LJed44UilufF2izNcV7SdflYfhupgQQh3tqFUTHzwTC4Aj/v?=
 =?us-ascii?Q?GibML3BuUXk78iNHSxUm/HkyAmyBa/0CHIFy2/7Ab4ZTn093SkZTL5KCovEY?=
 =?us-ascii?Q?yZhEyH5wxBqbfyH26z6nCT2KeiDeofwA1nMCr4r5x11UDNRhJZROLOOEYXZv?=
 =?us-ascii?Q?Y7tqkzByIMa0kg05dpKVEP4er0oWvU5Sisps6lCLYSwUaUQwwLBNTIPOIZL/?=
 =?us-ascii?Q?CpoPSI2mBaWf1BO4Zwple2HFZGidJoxVJg8D9VMBBFtRzTbaDbwylTR1LWrM?=
 =?us-ascii?Q?X7VwCEQPxfIFnfUtwvZbBobckn/4ALFexbl7ps4LbmZD/o1NXFvg9iOdEbuK?=
 =?us-ascii?Q?vpMobYx5K2emT9MsFNQkHh/N81/G15Dedm1w1aQt2FsZAAxBC3aWhQCIAGm/?=
 =?us-ascii?Q?1a19htrpw6v/55y1pTzI+mFEUEEGzyfo+Tm1CPUurmoADvu7teLKftjduXqI?=
 =?us-ascii?Q?gG9GuDcZ0xUjG+x13NZyiJwRaVz09EweWG6gOblr4WAUy0Ifow2+RYhKNXkE?=
 =?us-ascii?Q?+DkqmlQ9P2gZ6qc+S3fpJhRaVNYUYVzyQSfOlvHupYwI/Lan9suzEcLYBwNZ?=
 =?us-ascii?Q?On/j2vFKQnCeYr1hxSGJU4YdJSHE7pcI9HCua0W5UoNNzcFgpdOG+H6Auwbh?=
 =?us-ascii?Q?o57jephx0wvrCXQozqRUliRA0DRv68X70ccgg6tPd5+ElT6r8agCEYtAELZb?=
 =?us-ascii?Q?LGgHy6pApavsyDAHEtZgwQcw5Kmfj8qghEun7Coy5DAeBxBWQeeSTtAOXYeP?=
 =?us-ascii?Q?ncXY2VYV44Wf81V0er3ypfe1zPcRmO3XCQdn8SprZtE0fSAfRUBWgktnAskL?=
 =?us-ascii?Q?8lX8FvWTimpuZOkUVOvG9467TSzliYRQSauZ9xTcf6YQMMzIU5TJmyqdZREt?=
 =?us-ascii?Q?7QCjdaFooglA8p9wm3HL+Ybau9QL0xFfEgHGyVINUUdEWk8tCkeZrnOHJ1YP?=
 =?us-ascii?Q?jN65CemGRtzM00DZxszjw6R1DZtyvv3lKejzzz+HVJE7NKdEHgQRGQL7x+aA?=
 =?us-ascii?Q?CHaeOWr4f2kDyyx+T7DbGHHOvHpvcKs1PyOR94yEBS7zt4F9n/9rgyzyA8PJ?=
 =?us-ascii?Q?1RNAoEQS9V/JeMKSWjT3IAuBe1lJwfXtofcRPWoEhRyU/Zfb8W7ycSoUBVvf?=
 =?us-ascii?Q?IM+3blC33l/3w9V41iN62UIlNeDEG7OXwpBDY8jYx9Ma6bgPkvn1sfr0uWqZ?=
 =?us-ascii?Q?nkzGvOSgfnMbqPT6cfGX/0SQmiS0X23rCqmXU9HgptTExUDHtfPJHVBy6Tee?=
 =?us-ascii?Q?3RnEcckpO8kTS5h1VC8P2kCsL/CfQOLZgm0+0dhPgFdBxH/AnQ3vTw3GwHXw?=
 =?us-ascii?Q?YcZhtyUvk+kGUu7ugncvcNuGane08ROWgTGJn43TS5Z4cj6BNWfY3vvRxczL?=
 =?us-ascii?Q?e2r/CGKPcdf1pxN4MBV8Lp8JN4naR9/Ty4yQCz0+FX+SZYya4mWsx9ZGaWxg?=
 =?us-ascii?Q?giAwlubvar7FTQ+QJKXu8eeGW40Y9TMwCNc+NwqpgadM+y5jmSg3+pWYecEP?=
 =?us-ascii?Q?DuGvAqYE8v9TrDSNaijhyIehZa1mBOyHRfbRwXNlSuWQDLznzw25vVaFLoqx?=
 =?us-ascii?Q?6A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ee5431f7-bdc6-4cb7-bf72-08dcb10a3647
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 02:40:59.9097 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4IXClzvIDKIGWYsJ+BfBrnwFI3K7FkqQEJucrSP+bqClutFCc3q26AInLboOsIEveNVUSA/amSKc0jn+HvEtNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7096
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

On Mon, Jul 29, 2024 at 04:01:52PM +0300, Mika Kuoppala wrote:
> From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> 
> Move and export xe_hw_engine lookup. This is in preparation
> to use this in eudebug code where we want to find active
> engine.
> 
> v2: s/tile/gt due to uapi changes (Mika)
> 

Applied to drm-xe-next.

Matt

> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c | 37 ++++--------------------------
>  drivers/gpu/drm/xe/xe_hw_engine.c  | 31 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_hw_engine.h  |  7 ++++++
>  3 files changed, 42 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 69867a7b7c77..956dc15b432a 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -413,34 +413,6 @@ static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue
>  	return 0;
>  }
>  
> -static const enum xe_engine_class user_to_xe_engine_class[] = {
> -	[DRM_XE_ENGINE_CLASS_RENDER] = XE_ENGINE_CLASS_RENDER,
> -	[DRM_XE_ENGINE_CLASS_COPY] = XE_ENGINE_CLASS_COPY,
> -	[DRM_XE_ENGINE_CLASS_VIDEO_DECODE] = XE_ENGINE_CLASS_VIDEO_DECODE,
> -	[DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE] = XE_ENGINE_CLASS_VIDEO_ENHANCE,
> -	[DRM_XE_ENGINE_CLASS_COMPUTE] = XE_ENGINE_CLASS_COMPUTE,
> -};
> -
> -static struct xe_hw_engine *
> -find_hw_engine(struct xe_device *xe,
> -	       struct drm_xe_engine_class_instance eci)
> -{
> -	u32 idx;
> -
> -	if (eci.engine_class >= ARRAY_SIZE(user_to_xe_engine_class))
> -		return NULL;
> -
> -	if (eci.gt_id >= xe->info.gt_count)
> -		return NULL;
> -
> -	idx = array_index_nospec(eci.engine_class,
> -				 ARRAY_SIZE(user_to_xe_engine_class));
> -
> -	return xe_gt_hw_engine(xe_device_get_gt(xe, eci.gt_id),
> -			       user_to_xe_engine_class[idx],
> -			       eci.engine_instance, true);
> -}
> -
>  static u32 bind_exec_queue_logical_mask(struct xe_device *xe, struct xe_gt *gt,
>  					struct drm_xe_engine_class_instance *eci,
>  					u16 width, u16 num_placements)
> @@ -462,8 +434,7 @@ static u32 bind_exec_queue_logical_mask(struct xe_device *xe, struct xe_gt *gt,
>  		if (xe_hw_engine_is_reserved(hwe))
>  			continue;
>  
> -		if (hwe->class ==
> -		    user_to_xe_engine_class[DRM_XE_ENGINE_CLASS_COPY])
> +		if (hwe->class == XE_ENGINE_CLASS_COPY)
>  			logical_mask |= BIT(hwe->logical_instance);
>  	}
>  
> @@ -492,7 +463,7 @@ static u32 calc_validate_logical_mask(struct xe_device *xe, struct xe_gt *gt,
>  
>  			n = j * width + i;
>  
> -			hwe = find_hw_engine(xe, eci[n]);
> +			hwe = xe_hw_engine_lookup(xe, eci[n]);
>  			if (XE_IOCTL_DBG(xe, !hwe))
>  				return 0;
>  
> @@ -571,7 +542,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  			if (XE_IOCTL_DBG(xe, !logical_mask))
>  				return -EINVAL;
>  
> -			hwe = find_hw_engine(xe, eci[0]);
> +			hwe = xe_hw_engine_lookup(xe, eci[0]);
>  			if (XE_IOCTL_DBG(xe, !hwe))
>  				return -EINVAL;
>  
> @@ -608,7 +579,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  		if (XE_IOCTL_DBG(xe, !logical_mask))
>  			return -EINVAL;
>  
> -		hwe = find_hw_engine(xe, eci[0]);
> +		hwe = xe_hw_engine_lookup(xe, eci[0]);
>  		if (XE_IOCTL_DBG(xe, !hwe))
>  			return -EINVAL;
>  
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 07ed9fd28f19..00ace5fcc284 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -5,7 +5,10 @@
>  
>  #include "xe_hw_engine.h"
>  
> +#include <linux/nospec.h>
> +
>  #include <drm/drm_managed.h>
> +#include <drm/xe_drm.h>
>  
>  #include "regs/xe_engine_regs.h"
>  #include "regs/xe_gt_regs.h"
> @@ -1135,3 +1138,31 @@ enum xe_force_wake_domains xe_hw_engine_to_fw_domain(struct xe_hw_engine *hwe)
>  {
>  	return engine_infos[hwe->engine_id].domain;
>  }
> +
> +static const enum xe_engine_class user_to_xe_engine_class[] = {
> +	[DRM_XE_ENGINE_CLASS_RENDER] = XE_ENGINE_CLASS_RENDER,
> +	[DRM_XE_ENGINE_CLASS_COPY] = XE_ENGINE_CLASS_COPY,
> +	[DRM_XE_ENGINE_CLASS_VIDEO_DECODE] = XE_ENGINE_CLASS_VIDEO_DECODE,
> +	[DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE] = XE_ENGINE_CLASS_VIDEO_ENHANCE,
> +	[DRM_XE_ENGINE_CLASS_COMPUTE] = XE_ENGINE_CLASS_COMPUTE,
> +};
> +
> +struct xe_hw_engine *
> +xe_hw_engine_lookup(struct xe_device *xe,
> +		    struct drm_xe_engine_class_instance eci)
> +{
> +	unsigned int idx;
> +
> +	if (eci.engine_class > ARRAY_SIZE(user_to_xe_engine_class))
> +		return NULL;
> +
> +	if (eci.gt_id >= xe->info.gt_count)
> +		return NULL;
> +
> +	idx = array_index_nospec(eci.engine_class,
> +				 ARRAY_SIZE(user_to_xe_engine_class));
> +
> +	return xe_gt_hw_engine(xe_device_get_gt(xe, eci.gt_id),
> +			       user_to_xe_engine_class[idx],
> +			       eci.engine_instance, true);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
> index 900c8c991430..d227ffe557eb 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> @@ -9,6 +9,8 @@
>  #include "xe_hw_engine_types.h"
>  
>  struct drm_printer;
> +struct drm_xe_engine_class_instance;
> +struct xe_device;
>  
>  #ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MIN
>  #define XE_HW_ENGINE_JOB_TIMEOUT_MIN CONFIG_DRM_XE_JOB_TIMEOUT_MIN
> @@ -62,6 +64,11 @@ void xe_hw_engine_print(struct xe_hw_engine *hwe, struct drm_printer *p);
>  void xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe);
>  
>  bool xe_hw_engine_is_reserved(struct xe_hw_engine *hwe);
> +
> +struct xe_hw_engine *
> +xe_hw_engine_lookup(struct xe_device *xe,
> +		    struct drm_xe_engine_class_instance eci);
> +
>  static inline bool xe_hw_engine_is_valid(struct xe_hw_engine *hwe)
>  {
>  	return hwe->name;
> -- 
> 2.34.1
> 

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 367E7D6A22B
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 19:48:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 012D510E360;
	Thu, 14 Nov 2024 19:48:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VbI5BaBa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE2ED10E359
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Nov 2024 19:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731613710; x=1763149710;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fHiyDInsWJHSDmenV0GogPxu+8X73kePQKSyIxFF3bE=;
 b=VbI5BaBabwbsCcHpB8ueDV3izkf2uIP7rsb+P8qXdo8YnakwNVex9KYJ
 RxiWoW+2BHamOvAfPbgBLKxNl0Jk21zU4Uub6m5StDERyyhKCJIUqfxZk
 EaoHlbb8amjTAqIHYp993iDLm+7XesyQ4RxSlzuDAwHsUOBFoNYZNt4/P
 G05qqdFPXq6cGBM4OtnbaPC7EtKOzk8R3XCYGYSc4hWJtIWG2KDLEpxOi
 u31UmeZRkP4KYYsZ7Ku2JsxA6lfB4JBDEEBIKWcNWJLeOqIzIPxYLC5WN
 WQraxApsQTJjvl0BC9f49L1Hz0QAKC2G2VjLvTYc6plWhTiDygXx5q4SG Q==;
X-CSE-ConnectionGUID: qIosggmOSneSfrEd5IN0QQ==
X-CSE-MsgGUID: bdIQgcAqRVCQsugtegd3tA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="49033207"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="49033207"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 10:27:26 -0800
X-CSE-ConnectionGUID: MvsvJm8jSJCnbOvAUwYebQ==
X-CSE-MsgGUID: Oyj+Nf8kQoGH+gpkHU4pAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="88291001"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2024 10:27:25 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 14 Nov 2024 10:27:24 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 14 Nov 2024 10:27:24 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 14 Nov 2024 10:27:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w83P3X9M7ctHFOnXmI/MuboB+AfopwhmsWEJA8gYT81bg3IgYzVhzEjRdGZPj0rJOmFJ4wBsIiSOq0ODTBnYUPULeeHNAzz23Bzf2P9Ev0UXcZc3B/BQ6mlcmYOdEniOzXkw2Unr87GiZwPVgL2tIDxp/UHMH9Jx3INDNUTtIU7lGqnG3Az74b9w8Xa5nBCmdnGLVUP9hJ0ldWLfMAAk1idrKqChPb2/JLNz++K6GzhGmBQzqHvzJ6hi5L4NkJvEHNNvdjYxIiiAPpRX/vhkwHWG53xngraeoBtt7g2gkZ1P78YR1jG1wpQTfXAp0SPpWJifmASDvqza3jSxNNRZMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EIEXMdsNwCppe28chDy3j9zaZx5/P5cycKEW6x5bj+I=;
 b=vc/qoMY3sJq0dAXe1r/82ZtpAdNHxVmvQRAQOnSs5n2IpdJeWfokd+sNYUWT8zAD0Wr9DlXbKMaQThqrvLbmp/YIY25KosCHH34BPI6/pGVf/L5u9SOywZ92/Q8gze1CCF3zabWa1RdZed0dAoopG2xyownEU1PxT4nvdguRmvDiZvHl8K1Z6tkHfGKCNZMJ6Hcb5DnNFj73Tr4Kz+ye+8PMQ9ZmrRuNJaWB9uarSxe2HPFhJUtX6xJ/RZrXvtjYFZjvjsT2NjHc5qAW/BWxu2fcsUKDMQPVaj95ATavPP0q6CzRQwPr790R/EoIs1emrVm0EBtexCjt+2fPH8UylQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DM4PR11MB6165.namprd11.prod.outlook.com (2603:10b6:8:ae::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8158.17; Thu, 14 Nov 2024 18:27:21 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8114.020; Thu, 14 Nov 2024
 18:27:21 +0000
Date: Thu, 14 Nov 2024 13:27:17 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Mark preempt fence workqueue as reclaim
Message-ID: <ZzZBBX9pBazOOI16@intel.com>
References: <20241113171751.1677784-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241113171751.1677784-1-matthew.brost@intel.com>
X-ClientProxiedBy: MW4PR03CA0171.namprd03.prod.outlook.com
 (2603:10b6:303:8d::26) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DM4PR11MB6165:EE_
X-MS-Office365-Filtering-Correlation-Id: 663bd38f-f94d-4449-f388-08dd04d9f9df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fz9ijlD4yfq6+5KYRHObqCG8dzRmnPbgz+nAM66NVbcVBwRShY9oY8xBriSM?=
 =?us-ascii?Q?NZYyQqOEGRBMI7EMS0F1Mj9m//ozkI1+Qo2tb88tl7xQt5jrgCq9i+u8P8DT?=
 =?us-ascii?Q?McN7ZXEtZ/7aJhYnom3moeWDnf7FAZ8UfSTPmDO7HE7yjgC5V31z/ymGZrKo?=
 =?us-ascii?Q?eZeMk+LwmGxddR5Kv3IZ2nNfJce9w3se23ZIfF+G/X6nd54pvo9eVDr1BGEQ?=
 =?us-ascii?Q?ectt2jAp2a9HJIAYfqCHd1jczg+hynqhH+iHWOil3EEeQ4Uo8euBEnyYAvUb?=
 =?us-ascii?Q?thUWOxO6oiVsvKgk9MKB6puEBbqQeiLskcQ/3epu9S1eou1YJGIHSXjeqqNa?=
 =?us-ascii?Q?Lb0MYe+CPFZ7afz/qRe1bv17HI3doClCX+2T5p3HGSBio8q8f0naVDe8TSp8?=
 =?us-ascii?Q?5z/MZLWpDpntHrhue2OGEDr2AuDH7GKZ/70R5OK2Odi8dRK4g2Xoeh3jJgn+?=
 =?us-ascii?Q?3j6Ui570M6Y1vqUds5MXFCvSs7i05OMK+nXBDd5SHD3zjPB1V9YGW1kc0Z6v?=
 =?us-ascii?Q?HLxyZHI4vRaa3yqlI7l4sonjVggLzHnHvajTkn+/fRQxk5mlX4FHk40jdPqr?=
 =?us-ascii?Q?/S2V190B3BtDM3ObxOHTULOVfP5n2gv2FAOfNYrVxfkKgX7Jjh8zKhzF1GW2?=
 =?us-ascii?Q?NkKQwBavYrHfK0DBlhY0UXomevj054R4lLshuPxHFcsBsw3Yo6qIdDR4sRoT?=
 =?us-ascii?Q?PVnDGDVkTT//BMhpGEiE5iLT0Cqw0ogo+ZKh7jwRU5J7pciaY1zY4pgvuapD?=
 =?us-ascii?Q?GEuFYmRa2Bu1whqi4DrTJyaKmCw+Uhd1V5lTc2JcZrtQHwZpNiZuozoOUiN0?=
 =?us-ascii?Q?OFP7F2jv9RRexamps95GT8sVZ5n5MKdR9xaTVI3+SqvvXTOHVXBqkdS9UcHw?=
 =?us-ascii?Q?wwA6h95r2m4hfCKC7ieLVZFEHGGG9R0bssWAxdVen/DhDxrMyPAz8bI9K6We?=
 =?us-ascii?Q?Bc7GILCu73NYQJP5hQhKMKaweFyeQ1xAKfOjS3vnKr+Xg8ljf7l5RN//LYmg?=
 =?us-ascii?Q?8V6cmWBQpK+G3W4v1wy9jWjgJ8YYt2++2Pj/mE4igZjEXeFp2JVS2Uq2U7p5?=
 =?us-ascii?Q?iGTQRdMySKtWOILfjFeudTqBpr6HmlYGWbTakT3wZryMOp3+aD7nCi1gH+Os?=
 =?us-ascii?Q?SIpyFGarDrmdT9B595guANLVrNoUZpb41OsagEHOi5G0ot2I2HmOcM6IJAE4?=
 =?us-ascii?Q?x0Nt7sP1bQSP9dsfk6sCoCX0BrnTJ4mZFgv7lJ0G4jZFA6QruJawlXsRiB6O?=
 =?us-ascii?Q?GcyDap5ElW6InoFALnkUftn+yHFPbUTT0345iglH1okrUDiOldiD6tVa57uH?=
 =?us-ascii?Q?SC7d7UmZRZni8vqkXvJ9fU5B?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2dlAXxbWMMnbSsOecDw4UIN8KSKHBT0KVqSJLfQ4c+yeIf1jYUePCmdCXtq+?=
 =?us-ascii?Q?9ZZF1SAVGlHA3KBgDS8xBb0bYRwXWHbQul6mxDVe+znNPEoeV2pvglElcnnt?=
 =?us-ascii?Q?8oMbs4DAIYIW/KMczZReRv3NQnXlDWV4sNJWrTdLOE8qLxUvgQuJRrpUi7/Y?=
 =?us-ascii?Q?cZzBv0lbczlAmaFNsQiqSSfikq5YTxUbdaNqGCUTCTR1U3wXMPxwEISbdilw?=
 =?us-ascii?Q?q1FUSnkFg1zZLWwbIFp1f4NzZ8DzZqRu7BPSMQ5HfX7+ZFCAYnXpW1NUg58B?=
 =?us-ascii?Q?vQsqoe2zi88vBSUCutWvTQMLi5o5YfeQql17gCxqg3hlJIG3BTcPya+HFVHg?=
 =?us-ascii?Q?AdTZoJEMeoMKpRAaO5dB98VAVPmNYawN/oS5Sin3eMVDuwpItBT4Lgg8HRt2?=
 =?us-ascii?Q?y5NLaopBKgeRIG4Vrmh88B2lpKzAVjo/Evq7KBcFCAc/5Nx9WrYuwQpXypsm?=
 =?us-ascii?Q?JEpVHQPdXOknKAmcOaFnL2KDAh4tnLedTicYYR+zGPDHELYqcI0xg+UEdQ+b?=
 =?us-ascii?Q?TEDvs0HCmpHfJPAlERsIDfm9i2v3uGBNTsSIHeHnINuDUCGfWh7mVZLM5/Cx?=
 =?us-ascii?Q?n75KXRXbkOLeggVfuZqlKx2afzkyZPAeyLWfUtuFks050o/+cFQKVlD74B7Z?=
 =?us-ascii?Q?Kt79ePhGRZ4LkHfLCGcJrTsZUJyVErj2Re/HEHCjsE1lYiPlBhU+7ERCE4W9?=
 =?us-ascii?Q?qa1D4qFdUdn9e5Mlpcxc8P+W19gCLhQHXaCoDRCKU3ZFIWdHw8VTz5XxJKgL?=
 =?us-ascii?Q?LY6c4n3wPf0uoSFUqOy7jfsNq/jFOvxX/LiCiVOIXzEXTfO//DGpkQAr2fvL?=
 =?us-ascii?Q?rbxY4Omy80qwl1/Ezp72hVqhu0LziaboMtXO5V83YRI+p9ZH77a3WCkiWqYM?=
 =?us-ascii?Q?JhxE0rAtuUyCICfhW7DFsM00mDgozIp7myepmLo7UFlC1+krkQgm0uLWx+D/?=
 =?us-ascii?Q?Au4uPYti7wyoXLQORrE4S4+2rOGMrmkH06TRHGzCi17Eyjj3HYlvVe8V/KXi?=
 =?us-ascii?Q?lNsU2JdeYHtEibT5l+PaJ0fGi1QQ6aoqS14nDIkRZmqsByM46FMnoUIdotsE?=
 =?us-ascii?Q?cJIZUDZGEsodgAVnxm9cmYQbJ//+PoxmKEPRLQXA1Ra0CIBOiHlLDGyQpsmr?=
 =?us-ascii?Q?YUJUdW/jo1fFnh/+9c3Kq2efgNCK8SW6JZlrCWULsxfcnhFkI2l9tCOKPOHF?=
 =?us-ascii?Q?S7ZSPi67MVDETkr3OSFtTqZXLh5Vc4ysPf1n56BAXZAS20/uXHft9WPZ8vzz?=
 =?us-ascii?Q?XJ/pUBXhBnQGlpHj/8P9xTdUn7aw5p8aQFNnU/GeDX+tr84NDCEqNG7flUub?=
 =?us-ascii?Q?JaQRCBKFeK49s1wXfx1w4zy6u+z+M6E9YP6Cx3yDI8tfHGiJlBTcl8EgMqLI?=
 =?us-ascii?Q?buy6XAYYWK3WHFVUa5wopeNbxreW+D1FJKSMwYYoHHAwcUzNUV9woG7hre+T?=
 =?us-ascii?Q?yTIUz6KfA/2IE63MjaGYW49XE56CyBMty4Fn6CDgVGSaeREoBcZqzsuG+S/Z?=
 =?us-ascii?Q?W46QKNF0f4+hFbEvl+a8nl5XsQxQE+RHKKl4yjwuxJE9JXsd6nEulI36ZHL+?=
 =?us-ascii?Q?WkFlrfcMZkAVjWxCC4XD1jv/WUe1g9tPRxbtPZci2Xg/boXdV6rblhaU/xQM?=
 =?us-ascii?Q?fQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 663bd38f-f94d-4449-f388-08dd04d9f9df
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 18:27:21.0805 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U3ca1KIljDGb8eei7qriVryvRLYbVzgJNO2RutbPnDB3VXzaIc5nYA1ZH9+x+qd3mjCjNouhBRmZGjrCAm95FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6165
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

On Wed, Nov 13, 2024 at 09:17:51AM -0800, Matthew Brost wrote:
> Preempt fences are in the path of reclaim, and we signal these fences in
> the preempt workqueue. With that, we need to mark the preempt fence
> workqueue with reclaim so that this workqueue can make forward progress
> during reclaim.
> 
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 0e2dd691bdae..06d6db8b50f9 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -350,7 +350,8 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>  	INIT_LIST_HEAD(&xe->pinned.external_vram);
>  	INIT_LIST_HEAD(&xe->pinned.evicted);
>  
> -	xe->preempt_fence_wq = alloc_ordered_workqueue("xe-preempt-fence-wq", 0);
> +	xe->preempt_fence_wq = alloc_ordered_workqueue("xe-preempt-fence-wq",
> +						       WQ_MEM_RECLAIM);
>  	xe->ordered_wq = alloc_ordered_workqueue("xe-ordered-wq", 0);
>  	xe->unordered_wq = alloc_workqueue("xe-unordered-wq", 0, 0);
>  	xe->destroy_wq = alloc_workqueue("xe-destroy-wq", 0, 0);
> -- 
> 2.34.1
> 

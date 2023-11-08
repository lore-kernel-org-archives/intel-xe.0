Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC86C4332F
	for <intel-xe@archiver.kernel.org>; Wed,  8 Nov 2023 16:34:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12BD710E179;
	Wed,  8 Nov 2023 16:34:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C250F10E179
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Nov 2023 16:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699461272; x=1730997272;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=yeC6X8uB19FVevrQG/d7o2jCMx0N30d14hKb8oZuaxw=;
 b=W1cSGCGMfEZ84fXY8LLzt5M6Oti9XUYNUsIaxqE7XawiJpPtx35N00Y1
 iz3K5mCwWB9LMTs7HgrP/saWba5W0FIq42FnEmy66fvzK6N5ul2t17K/g
 lgi/B4X9gHOU60kC9RVHqL3l87yerbeOmGEipAYrcpXSF3cgkjAEDSXwe
 fLQ3jHxrlbcSCh3ZDYz4r0xDe1nxzBydBlPkXTmxUF62Pu0VKnrLiNaYJ
 6yXx8jKf3mZbkLKTywvJTl7pBjCetpcR7yWS8W4sLXXubq2ASxDytu7ta
 mXb2px9xR0FzSFuYIXpc8rzqBqPTIruuIBT7aEGsvq+SGLe0GEyEiEu7M g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="370009746"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; d="scan'208";a="370009746"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2023 08:34:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="763107614"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; d="scan'208";a="763107614"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2023 08:34:31 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 8 Nov 2023 08:34:31 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 8 Nov 2023 08:34:30 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 8 Nov 2023 08:34:30 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 8 Nov 2023 08:34:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QyQ8OCxov74vn7ksOsk2Ojmd916jK3Ihb5fp2fMkbvbJt1QIr9aH6jC+1NnUFoTwHku842UTu7GT4C1K4IXNhm3If8rKx42g0mzxIXZK0yFeaV7yvVq4v6dkCdwxB5wRnlNhPJqZqX5/NLuUJbLOZDGBvzIgQVNqzMtjp1C8HBHPL+noqsoFZWeaWJrjRMOfOVchj3FE4gdiTa8vJD9A8FVCSMftJjPDCAQrpwFN01DaDcQx+zb9ZRSr+f1MtcFChqrazrytpf2yZsnxhdEJYMnea8/TzitgdN6aLGjJvzc9oTYeTxaAMSFCMjCIl80LmGqyobkCmCMZbwa+75V5cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uI1jE/1Wwgdw0ABajFIgT8Kb5W4aKRM0BNtaS4uhqUY=;
 b=lTVxf7ZjrLtGuCrrS5utv0mgKiZn6YAHnwMZHVZH+/yDl8jExHN1WSJdPyusArCnZEdG2+We8f2JVwjK0uz7S7F+MxqY2iH9ulvd5jQ8CnLkNwWYGwe1aULxIm/0oYgkn9Do91IQldLLEJkTHVpehtydAyz1bnE//0SBYjUBJyivYVZ89X5UkWTWBTNPIYiNKwEPK/p9HxZyFno05y0ttmsomN9HDHS6UBrOhydrEZtaalJwY6zYfLOSRLaJr97hnSNnLffZCBHq/MgDGs8qjXDsDy30XFOC1NQPK7zA7ycLSdJpVnXMJY/Jc5zTRoG1sZAV8UMD4kMODUL8WOKFvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB5899.namprd11.prod.outlook.com (2603:10b6:806:22a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Wed, 8 Nov
 2023 16:34:28 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777%7]) with mapi id 15.20.6954.028; Wed, 8 Nov 2023
 16:34:28 +0000
Date: Wed, 8 Nov 2023 09:33:40 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Message-ID: <ZUtV9EE+/PzCASVw@DUT025-TGLU.fm.intel.com>
References: <20231108003344.1169016-1-michal.winiarski@intel.com>
 <20231108003344.1169016-3-michal.winiarski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231108003344.1169016-3-michal.winiarski@intel.com>
X-ClientProxiedBy: BY5PR20CA0020.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB5899:EE_
X-MS-Office365-Filtering-Correlation-Id: c7da2063-c0b3-4906-624d-08dbe078938c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gVOi08C+AJPuDBYdYOxqxTnD/PmXVTYnuv35gEPMnnFdJv2SGmF3E+WQ9AMYCZW0cKicCMj/0z2gSPJrLaFFvsB3zP2VNo/ICCvNFgDoJBZw4EiSRTuawTHfBnW+Y/LMn9W2Z9uwdrFCiXlmYYADyG1aL43/bdz5rTYogHkJB98AA6DGs/8qKPCIzfjODknJPrIzQtp8mFUopPe9H8bulDfIrmHVG/386udU78fznQxMxsInm12siuFOleyeLdI6BZ+nYvL5cNbt9c3JEKf4ZBlU5k0CbGvBpzqR4S44R+JTBQNe5VxXBtMutoFVG2zrj0HVg+rf+OvGB76akO9LCaigOn4l0G/XiZ5nhtBJY7eKIXBXL+MouSiL7WNdlCBjPbJnr2qgYaOy70ovgie1WJnpc0F/t819uGouhdfQV8jPRuiffPo7Bz7r4ZsbD3Tu1Bwxf65X+x0FjvaDRXW1vipfIFbRRi4+BGm/fIK/44OYv3TJFAvrwdaMn0Pwq5EIXS3kmldGHi31HoovR2rABW+1EQtHm7+L7Qiou3txuhLXppyhnNvUowlkI2kqyTna
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(346002)(396003)(366004)(39860400002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(6512007)(44832011)(41300700001)(6486002)(66476007)(66946007)(478600001)(6666004)(66556008)(5660300002)(6506007)(4326008)(8676002)(6636002)(8936002)(316002)(6862004)(2906002)(26005)(82960400001)(83380400001)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFE4WXc0enhpS0F0djZQRnhTNXFHRCswN2hycDlYcFlZWjlkRTNjUUtuVUFr?=
 =?utf-8?B?aDQrU3hrMEJpSWpoMlZiVDlXbFphSmdJUCtDZHlzMTZ2Tk1QMjZoRm0yeEFt?=
 =?utf-8?B?L09yNlc4QkJCSFAzUHFQaFZub1gwbE9oYWpWVjFKTkRoSnpHWW4vaTVJNzIz?=
 =?utf-8?B?eVFZZituckZsdXFKRitqMmpJZHZ6VDZWc2JpWW0zOGg3Z1ZpbkhlUnBzQlhG?=
 =?utf-8?B?eWt1N2REcFREbTlIbDBVYUxncGQ0ZDMxUklpSWREQzZSMHpZbXJ0T2JOeExk?=
 =?utf-8?B?cWsyV01sMkIxbzhtVDdDTXEvRG55MmhuMW5COXNidms5STZqODhONHpjc2tR?=
 =?utf-8?B?d3lDTVhLbUtQUmJ4RVBjd3FocHEwenN5dDl5ekROMGVYUGphcHlDQk1MWEVw?=
 =?utf-8?B?WEVOcTNJa2VYNTA1ZW5ubS9wMVZPMWcybGl4WXRNS3VyMnhxb3Z1UWpjR3Q1?=
 =?utf-8?B?UFE2dDAvcFdMYkNlSEZMYUZKS1NXOW4xS2hBaGgrVTVwRGdtcVRNdzk2aGZB?=
 =?utf-8?B?YXArSjlON1FMK1R6eDR2S0lhdjQrY1dWV2NleU9OdVNDQ3gzYVZBRGNyR2ZK?=
 =?utf-8?B?VDRxZktSemM4cEVYN1ppK1RUd3pXSGZrYVI2clRnODZxblVKMnlLa1FCOHFR?=
 =?utf-8?B?MnE3YUVRTzVnQVJhd0M3TXdqZy9sRnpxL05McHpWMzZXbGdoR2FSeUpaMFNz?=
 =?utf-8?B?VFZSZWtUcXlic1VQWEtXV3ZQcFZJdVpra1lqOHBWUXdaUC9rNnkxVEVOUTFk?=
 =?utf-8?B?NFZlKzlpdHViNmQzYmRTRkRWSkJkTkxyaGpQRVl0N0hYK0NYamx5SnRMdSti?=
 =?utf-8?B?ZlBVdnJPVzMwSmJUWXYrQ3RSSkhUenNCZWVYZ3U5ZTRCMERVUU9EWDNXT1NJ?=
 =?utf-8?B?M040bGc2K0JadnBYbWlDekpEUXZSRk9TZUh3T2xBQ0QxRjlXUFB2UGlkMUNC?=
 =?utf-8?B?dzRhVk9nS25DWkJzb2RVbUllOGc2NEJsdTB1L0RjZUFwMGRYdkFKRHZpaHRl?=
 =?utf-8?B?WnYrRnpLUGIvdXVXdktmUS9jSzhiSlNjMjZwbDluY3Vja2NNMllaTFdJQVQ4?=
 =?utf-8?B?U3RYc3J1V0JHUVNpMExCTy9DYXA4eVJQT1kzOUEvZUJrVldEbmZhUGR5WG53?=
 =?utf-8?B?Q1ovLy9ydzhDYTZGRG9qSkFzVGJkcjVUS2MxTE9qcDF6eHpyT1J4bWo2YzlV?=
 =?utf-8?B?THlJMzNuMURrZG41ZzIrWUxDVmlIdXZUZEdZSjFpVzgrbktYM1kyMXBlMGI0?=
 =?utf-8?B?Z05jNjY0UGNJZUVBVWdvSkdybHBzVmZKK2dxL3NtVVR1OEpsZlVGQXk5TElL?=
 =?utf-8?B?UkZSampKSG5VRm5WeDkxSzVBa0lKZUVaak16dWxMSFFGdzVVVUtob2o5Zm1H?=
 =?utf-8?B?RmppN3doOGJ5Tnd0Y21zRHBQbmozbHM3b092M21VaWl3L093QmNUaUNUaU96?=
 =?utf-8?B?T3VUVXpPVzhLeEF3MHdrL0FHdGVieDh1bUJFblYxZ1FsZ0gxNW9mMVBnZHZV?=
 =?utf-8?B?KzFsdHJCZFRqdUJHN1VheDhycVljTGRpblI2YUljcVB2eWF2dlFiWkFYRVR2?=
 =?utf-8?B?QmZ0dzVoU0hucE1lSWZNS1Zob1prbjZYRTBDMmpvUzg0Mm5OdXlza0x2Wjk4?=
 =?utf-8?B?SXh0WkZaaVpQRTZXWDVId3JCY1A4Z0ZlbUFLTUlqQmFVL3ErdzVZcGtXaGxX?=
 =?utf-8?B?S3VCUjNVSlc4SkNPdDh3dk1SUktzQ2dmMlZ4S3JPU2VyTk5RNVdQbmlmdlNP?=
 =?utf-8?B?R2tnQkhYNWM2enVZTGhFMHV3YnNKRzFtNW5LaEFmbUtabDdvOHVDaGlUTHRQ?=
 =?utf-8?B?TCtlVTF1bmRuZTRRNURRdWdSRnZLY2VqN1YrTVlQV2EyMFE2aDdrejV4ekY4?=
 =?utf-8?B?Z3czVTN4VWpnd2NCTWFZQnI4bGhKNGtWQ2IwcEd1MklZazJCemJFdXFyWE1n?=
 =?utf-8?B?aE1PS1FEaDhsZktXZXlOZDFDd3Y2ZlYyUENCSjh1MEJOWW1BSE8vMEZOMzJs?=
 =?utf-8?B?TVE2RXVwdUpDRW1aeUNqQ2k2ZDk3UHlwQ25kUyt0VjNqV2hqdFRkQ1N1dk94?=
 =?utf-8?B?V290a2Uvajg1V2hyV3ZFSGpjMzlWU0hZNWpZYlJ3OU1Wb2pTNXQ3NEg3dWQy?=
 =?utf-8?B?ZEloWmRvc3RBNDJXZVRrckxpV0xzVTdjMTZJMndwMWlhcm15bDhvK04zSy9U?=
 =?utf-8?B?Q1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c7da2063-c0b3-4906-624d-08dbe078938c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 16:34:28.0935 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fRcgG5kM2fMaK753BAdD1WA2vXJKObihxY0nIbcd/CeUELzLCPK+bhybZEeKz0PhSpErcEGBw9iUw1JrF2xreg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5899
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 02/12] drm/xe: Skip calling drm_dev_put on
 probe error
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

On Wed, Nov 08, 2023 at 01:33:34AM +0100, Michał Winiarski wrote:
> DRM device used by Xe is managed, which means that final ref will be
> dropped on driver detach.
> 

Where is the detach called if xe_pci_probe() fails? I'm struggling to find that.

Matt

> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 12 +++++-------
>  drivers/gpu/drm/xe/xe_pci.c    |  5 +----
>  2 files changed, 6 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 078c92576062a..78374997cbf6f 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -217,11 +217,11 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>  			      xe->drm.anon_inode->i_mapping,
>  			      xe->drm.vma_offset_manager, false, false);
>  	if (WARN_ON(err))
> -		goto err_put;
> +		goto err;
>  
>  	err = drmm_add_action_or_reset(&xe->drm, xe_device_destroy, NULL);
>  	if (err)
> -		goto err_put;
> +		goto err;
>  
>  	xe->info.devid = pdev->device;
>  	xe->info.revid = pdev->revision;
> @@ -247,18 +247,16 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>  	if (!xe->ordered_wq || !xe->unordered_wq) {
>  		drm_err(&xe->drm, "Failed to allocate xe workqueues\n");
>  		err = -ENOMEM;
> -		goto err_put;
> +		goto err;
>  	}
>  
>  	err = xe_display_create(xe);
>  	if (WARN_ON(err))
> -		goto err_put;
> +		goto err;
>  
>  	return xe;
>  
> -err_put:
> -	drm_dev_put(&xe->drm);
> -
> +err:
>  	return ERR_PTR(err);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 007e272d2758f..84f3e4d901502 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -700,7 +700,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	pci_set_drvdata(pdev, xe);
>  	err = pci_enable_device(pdev);
>  	if (err)
> -		goto err_drm_put;
> +		return err;
>  
>  	pci_set_master(pdev);
>  
> @@ -742,9 +742,6 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  err_pci_disable:
>  	pci_disable_device(pdev);
>  
> -err_drm_put:
> -	drm_dev_put(&xe->drm);
> -
>  	return err;
>  }
>  
> -- 
> 2.42.0
> 

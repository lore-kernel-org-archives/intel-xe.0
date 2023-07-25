Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49DBBC0015E
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jul 2023 17:23:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E79310E16B;
	Tue, 25 Jul 2023 17:23:37 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8EAD10E16B
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jul 2023 17:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690305815; x=1721841815;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=AcXDkWXCPJxWywlCPnPc6m5uCFZQ/TN2qGvheL9Md+c=;
 b=hYTMXG1zWlcRVSFSTLo7V1KvuJTCi4Jh8dW+4gjAkQfIgMiqA0A/7tAJ
 ZCkXz1ODVD+BvO40WNdxRQHWUN3/FsDS+bfsxeF5wiXpM3V6ObPI3CpJm
 WdTZrnIn9619UdntQoNXWKcaEqNZjBos/8OEKbpr3/yQVwOydnaxwP5iH
 8TvEX0tFeysohklvECibC7KhmnEXZdC3I4qf/TFITVEb/kc2dsL3SU8rY
 +jSMebKcEXXfCyRFOkPW7Hp5QviNENCXotxug7F35cVAU9ZoIhmWDLRBZ
 tdebX414YJhlUbvzuZoSGpy6VkbzeUFoM5gZcnialMIBZdy8jVqnzViN2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="352696067"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="352696067"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 10:23:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="726185050"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="726185050"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP; 25 Jul 2023 10:23:35 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 10:23:35 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 10:23:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 25 Jul 2023 10:23:34 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 25 Jul 2023 10:23:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cdABpjCumU0Xei9JIetSEzzTa+74aI0oS2267IH+fHY9DlpVZbn+BE6JMvKzEkeZaUc19S5AL2JGOChWR2wp8Sxtg9l/CIvGzEGTQakmh3Y83Yuy4UFDHQ5XSPw5ifuHckUORJQS6Xrvda1JbJ+1xLkw+Fr9jjbU7ph51CqqDHtulc+oRlAmkR+saGZntQeImpnlcg5o/RyAudwf1jT64dNuIvTZKCw+Ix3RhW2vO7Btr/MvqgxDsR2BNRORVjOtt0vA8CbcrdPW6M+OaK1OMeimd362HZaLcmlOnRS6Ss6FBaxjoFGykGZtSNSmwX3UnBey76VienterAANGSBepQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GGuz0OnsUNbnf+pofmv2o5vnn41nuDSkuPLKngSr2CA=;
 b=K9CeRjwvE/8bYa/ceWwYkzaotcFAQ6kiWMtJ4DTR/MMPC7FJSCtIhLmORYpfU++yf71sISComtQJVFE935SZHH1rCDN6Qh0b02zjmamFEjrv0U5DxBc9YZM1mbkvURjq91VT1Z3qcKyQJC/fuSmYyEnJpTeb60l940Q7nCAV5nQcGiMLiEdWhLpIc2QFKmlFfO6pBH4vdWVZYmmZmOpsb/6n86oLa9iswxO8kTcmHfj5mvesBe2PqEofZ1T4hZcIn3b4/xewlfvM8QBYOZeoTwmKYtuRaKKF8gZvtxZjFX+VAtrtEev/1MWJiDNdew6OCVTkKZtQOI1+H18Ys+PPXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB5437.namprd11.prod.outlook.com (2603:10b6:5:398::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Tue, 25 Jul
 2023 17:23:31 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0%3]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 17:23:31 +0000
Date: Tue, 25 Jul 2023 17:22:27 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <ZMAE0yXpF+IdQ6KY@DUT025-TGLU.fm.intel.com>
References: <20230725151239.133708-1-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230725151239.133708-1-maarten.lankhorst@linux.intel.com>
X-ClientProxiedBy: BY3PR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:a03:254::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB5437:EE_
X-MS-Office365-Filtering-Correlation-Id: ef9ea25d-9288-4e61-e322-08db8d33de6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tfGLiKakQNAsyURTXaf0fUDSDdPGw2by7ucbiwXDt4Qah6d9bYgo2NKCc3+WiabCTNWM3P2MpgMAYizE/U8pROuD7rgLrmLnCzGFy5iGSe74WWpGE3KktXtM7qUZHrcFWbyRznStbl6q4NKYoU+q5OsPPF2kIg+/5ghE4xYp4YzUb9tM64jUKlSrJEUSPk1of+p+BsCN/nppad+LEy7c4Qq7gMHEuwpaYlRTAS+sRElvQ/vFcQ+qdWkgkyDwzMLI52Qo5ZxLpBtkKJIMSSguXNKNAymf1z7bIP263T2NrpouuYMNS2mm3A2th1ztKkO/rXQaLbRCyV+DhQQWL9++66G6X6UodzIKNkmOU7JA7vyymTQeZJrJF8PZcqEkU2qZu+tRmfIZFPgHLmrFA/DVXYhEV1ErRqd5I6z0XLN9E4nWt2rhSZZtYHoAXFgOuggjy35pJM6GKuhLBtE76eLjcoHsxHS9UMEbVq+KxPNE6OxT3Y8Z6kYmiH64fswBXKbdXZdh/+2rD8YsHHDaHUv8hfKY587XpbgwRoZ5Uzf5cg4ugMnsRbjeb5xtiEkO4mydInPAluR9hYWCKf71T+aC2VyZUlAjMJbNJ0oSYNMU8lk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(136003)(39860400002)(346002)(376002)(451199021)(478600001)(8676002)(86362001)(6666004)(66946007)(66556008)(66476007)(6512007)(4326008)(6916009)(316002)(6486002)(41300700001)(82960400001)(26005)(6506007)(8936002)(5660300002)(38100700002)(186003)(44832011)(2906002)(83380400001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u1SLhFA7Z8ob/78lqbjFKXRTwJ1dXwgAYo1qMqUt7MKLgsQDcRyaD/T0I1tP?=
 =?us-ascii?Q?7n7py5DfQ5mjiKAvskLZw9FQ6wlpTgWyjIDr4DXEeei0q1Xy7J2sJFkgi/2P?=
 =?us-ascii?Q?LeVbbtzwe5WL3Wap9nCCwLYkJRpJvrY5kYda23SetCZp8m6urH+G5mpCP5KN?=
 =?us-ascii?Q?pQeR6iF9eYBXCGlRMMTJrvW1dxgrEkvpynsNQTSNz3U8ZiwatjJmPHbYOP5N?=
 =?us-ascii?Q?AvoB82qRSPakH1dYNMNfKKBS8UbXX7x9glgbJwXt1tnIHV6UVO+FHssSBA6X?=
 =?us-ascii?Q?ANFit7zL7mcq/5oo+b5I8o5tyRWpLQ6njskPnlrwKVGkzel1Pk6wytikt4LC?=
 =?us-ascii?Q?cU3X7qEVR5SoMo0wQh/jCa8xxHjsHZ2QuJNcX/SEMVw/x6sfNAAdl/05UM2d?=
 =?us-ascii?Q?lqe2TOQGKKLovnSzAWRMItw5MW+FDexZB1XZggXu3vNqiTp8Dgpxf+Y6sxTy?=
 =?us-ascii?Q?UmzNMH6ilWgcXrIIeI1YCDRxItZakdzh+7u/NEeibj0Eq0/gus5SbK/KUwPT?=
 =?us-ascii?Q?tXz3ukgb4U8HvSQ/C/RTlWMboPGvY9mGHg95/pEduDBp2OMyqtF+/WDV1j2v?=
 =?us-ascii?Q?T0Sdunbp4CFJBoWUW4y3CxJ6LkhyniP7uwM3cX7I6fTYGk6crmyrU1bjmKE/?=
 =?us-ascii?Q?s88C4a/DJY8TSrvF8cqBehaRYAB8rnwkKXQ/K+hH0BZVojkuwha1J8cX8tSV?=
 =?us-ascii?Q?B6N3plzIHRDTHaglpVs+cs+eSmczWpbTgzWrvGdwpQ4JzoS0PinlrBZ7lMZ+?=
 =?us-ascii?Q?OTMYYfyEG+6tgipKAN3aOm3bNHVZ8JRZgDqqy8eel5yeBXNmzS2HBDKORrQg?=
 =?us-ascii?Q?svx/XOumMT1HXBlQEYlkGk2Hqw5aT3uYJV2L+6XVbU0MhId5Bzej5a7dNJBn?=
 =?us-ascii?Q?Esr5g/QzbQu2gHUlmIVMMcuVUG6lavYNx9uiA8i87z36FdQowGM3h8AIywiZ?=
 =?us-ascii?Q?SVrHg6J+T52gxq6YqCRMfX2toB7Xbh8dDwXlWLdkbtLda0tT1Gd8xJ1uyoiD?=
 =?us-ascii?Q?BUoVZdLUOidBj2sOrwFQ2NExAsvzPm748N69M4l9+Nf71eyvHP0rum12oxK0?=
 =?us-ascii?Q?aaxdIxKy5yW4MlGp8lUwcur48lUMlCG+yXg5Whyz4XltwyaoGhgnZhtmVHzi?=
 =?us-ascii?Q?r3urp3UNcl/rwWfDVhA7oNsRtnUdJ3skicdz6M1UJErjo2zBo7eYtbhFWnwN?=
 =?us-ascii?Q?M7n/r62WjAcrtHYnHqXQCXENCi+CQ23fRYUXeD0KUgsfQr1zhBQuVzyx3CFx?=
 =?us-ascii?Q?YR9lB8zQzUhCp/j6U+8y3wd//PfmSByw+xo5pvi4Q5ZWYbmjZI4llT01Gg8g?=
 =?us-ascii?Q?QCcMYfixzhZkYoW/GyoaBP8sfStlWjQmEMxZi8hHtPYLLW6FNipN6dhRyTU5?=
 =?us-ascii?Q?ccai04O4rFbb/7hTirxHFEeb5Upl/hBDbxCa+8zaN/TWcbLIFNCfiNxqe7JF?=
 =?us-ascii?Q?pHf6ATYkvzIqiT7okh7bw6PqcCqKYGSJHMluCCJUAhDzDDnKR2njdDIvgbna?=
 =?us-ascii?Q?t9YFV7HeKH/O8MJQHgtJqCLqEVafHukIzDOUzfzd2qfI0PKudkwJjn/OTYgm?=
 =?us-ascii?Q?4S9JtrD0XbhyXx2Ys8tfDOENmX66TSzDckdd0F2AEPoRu3Qq9soA5UUaxhTF?=
 =?us-ascii?Q?JQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef9ea25d-9288-4e61-e322-08db8d33de6a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 17:23:31.8389 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aJpByxT88JIzCQ4NqQinoCwXbaSCxf4t6oLPmSdL7IJbDC2GdxF5lmOQQx3Cf0ZZp8/TKtLHRtuMhT8GIFLqyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5437
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix error paths of
 __xe_bo_create_locked
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

On Tue, Jul 25, 2023 at 05:12:39PM +0200, Maarten Lankhorst wrote:
> ttm_bo_init_reserved() calls the destroy() callback if it fails.
> 
> Because of this, __xe_bo_create_locked is required to be responsible
> for freeing the bo even when it's passed in as argument.
> 
> Additionally, if the placement check fails, the bo was kept alive.
> Fix it too.
> 
> Reported-by: Oded Gabbay <ogabbay@kernel.org>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index e240df6c7ae64..b63290540dd9b 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1158,8 +1158,10 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>  	/* Only kernel objects should set GT */
>  	XE_BUG_ON(tile && type != ttm_bo_type_kernel);
>  
> -	if (XE_WARN_ON(!size))
> +	if (XE_WARN_ON(!size)) {
> +		xe_bo_free(bo);
>  		return ERR_PTR(-EINVAL);
> +	}
>  
>  	if (!bo) {
>  		bo = xe_bo_alloc();
> @@ -1197,8 +1199,10 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>  
>  	if (!(flags & XE_BO_FIXED_PLACEMENT_BIT)) {
>  		err = __xe_bo_placement_for_flags(xe, bo, bo->flags);
> -		if (WARN_ON(err))
> +		if (WARN_ON(err)) {
> +			xe_ttm_bo_destroy(&bo->ttm);

This doesn't look right as we haven't fully initialized the BO. An
example of this is the snippet from xe_ttm_bo_destroy:

1012         if (bo->vm && xe_bo_is_user(bo))
1013                 xe_vm_put(bo->vm);

This shouldn't be executed in this error path.

Also do we need to do a cleanup if ttm_bo_init_reserved fails?

Matt

>  			return ERR_PTR(err);
> +		}
>  	}
>  
>  	/* Defer populating type_sg bos */
> -- 
> 2.39.2
> 

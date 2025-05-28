Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 901A5C5AD49
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 23:46:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47BB210E6D1;
	Wed, 28 May 2025 23:46:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lg7e8oFs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1920310E6D1
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 23:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748475975; x=1780011975;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Vlc+aJVXtvbnZeFVrjvdu2IT8K4TeoZV57GF8XVO724=;
 b=lg7e8oFsAVe/n9i8SOj3TCRqxzo7NzKdli2l+OOSWkd6DCm578QNPxOe
 8no5CaLjN33phucR0SKvObCgz4DKrWwyltELcUh35fzlZvccCW188ymCX
 +FELnoR6ODvo6k+pe5hNIj8eIOqeqWVxyzHJG75i+V/0GSiPl3Z/17xZo
 n3FQdRH0QAcOrHhiYLxspvDAn/fzTRbFz35LIsZiwIdiXiFGOwxziXREk
 M3QE6m1oP1o5J7hsqOru5G+sxoqM6WfFiK1OQN/72EepBkfuPDt6vBYdg
 g3xYtj8b2rJ1a5zqX1jCu8R8ZotIx7tam8+i1L/Kk7CnVj5i7ELnkOSER Q==;
X-CSE-ConnectionGUID: 7LPIrdC0QbeX6GoSQAJ9xw==
X-CSE-MsgGUID: QwGow4ifTICJCgMXBbq53Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="60781674"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="60781674"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 16:46:15 -0700
X-CSE-ConnectionGUID: H2Ns9zBmRyOBYgTOIDgnkw==
X-CSE-MsgGUID: RzebVuRASKe+AvVzT6O/5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="143413353"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 16:46:15 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 16:46:14 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 16:46:14 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.57)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 16:46:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tYx8Z8g+8n41+5MXb0XyM8TSnrhsJjLpCw64NQUH3CsRlImpMKxxYzLrgtDpOpJ2j1IdI0P6Zf4d0eiG3MwoMkPCUekJMvmN9HSAjf9oT07BivetYsj8BDMlYDt0nE0j+Wj8Yv8wycZxSMhb2O2BlkB9mTH/b4RMfvaoQggEmoOcm57HHjEJR/j2BZFJpSpnr+ojF2xzFH3HIWN3XhC0AnFynwl4OYKptw7nWCm75XFuvPNFMhG08OLvukfpIhy1Q4Mt1RacfCF0/k+Sau94TL1fbpB/N0qAfegH6rpGbwMUc8zyRMiSj7y2Qq50b5NBj+WREGCQagqsXG8s/gC8KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FPXd+zSP2q7bA4sFwYXQMVGOKLRkHpPL8+1n/aIoa6k=;
 b=FQ9BZmJET+SDTQPczP+0WEoIlqR9DeiJM8vph1rx9j166KdWmSUoOMjfQGC2XExXGNy8pGGzgcbx5qYN7UbvdU+C7dj1awASJpygqK1vt/YMRxxnxbkpiMMiKbyLjgJCn7Z6VOS1bIYHz2vgTHF7K+doQ8jP7gXffX8DEQOmOMMkoDUKm6B+CmU42J1wPf9t9sIfzwXmCFXnhxk6+Q7iW1uGSBuK7RuWOHGNXq2ude1JAQhZOIvHyzQrRHFCbQLPr/vxb+3NeLOM5J7BE2kf2pXh+x/gbNwvfryIA6c9lKo77J+CuimyHsPJ4wmXxnZJeF/d4KY8AIKUUQfFQ+Ydow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB7892.namprd11.prod.outlook.com (2603:10b6:208:3fc::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.30; Wed, 28 May
 2025 23:46:12 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8769.021; Wed, 28 May 2025
 23:46:11 +0000
Date: Wed, 28 May 2025 16:47:43 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 18/19] drm/xe/bo: Add attributes field to xe_bo
Message-ID: <aDegn4lbaUqDnEb2@lstrano-desk.jf.intel.com>
References: <20250527164003.1068118-1-himal.prasad.ghimiray@intel.com>
 <20250527164003.1068118-19-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250527164003.1068118-19-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4P223CA0024.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB7892:EE_
X-MS-Office365-Filtering-Correlation-Id: 08787ea0-fb07-4c72-2ef0-08dd9e41d3af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JzkjGUWtltS+BzpoX0vU3VuDXLhB1rSGFFjwoEwfTbfMf8nsT9YqKc0Oc79+?=
 =?us-ascii?Q?QSNvg6LCYy5Npdm38L6f+pwr1iPz4mj6n+NIH5A4Puy0fenqPiZ+k6Q+tRP0?=
 =?us-ascii?Q?RzENxQw3UeH+OyzasVQobfLur3bGFG9+yaPz7eFrSJbawGGvJnOxIohslHX2?=
 =?us-ascii?Q?Pah7KcnejHYHNKtNaSIjecjnx0+gs4GtGryZ2dASdE9P4Zw6o2XqWDHvDlnu?=
 =?us-ascii?Q?pO9splRQePLAUVGs/6TM4UNg3XfwO+TOgT7GOjssa1VCy2/qpqy1+nGZuOzE?=
 =?us-ascii?Q?aP8oHquqOf2448CBuiKSmqRD9MLDmt7JaGFazmlmUSnSWlHnOU2l054fZH51?=
 =?us-ascii?Q?2Y7a4yLoAhxSaz/KyQuYPeebC/bzZ+7/VcVgFtjQU4x17HSz0975r3PnM91S?=
 =?us-ascii?Q?whr+Rk10HRwyQdQSBHzj7cvc6r6rHN0+4W8W9Uer6DEYjSQa1frUkmIrn/Mp?=
 =?us-ascii?Q?xe0PphLm0iSczuJYno6sezMXoyrda3kRrj0ro2933zx8FsRqZ2z0l6zPeekg?=
 =?us-ascii?Q?3Y7Zbm0Q5xHzxK+kprpAbg95rh4WUVBZnjRBfolZE26i1ZwOvsH0kXLYFw8e?=
 =?us-ascii?Q?fdxj3PdluUb8vrTWKVLti8mS8mNcINbNooqTF2JRJ11T1GJ4rr1Bprb8E3Pu?=
 =?us-ascii?Q?H2OELmnMI/i6V5vCs45c7jAFeiv3vzssxATY4jD/6AbwRKBvHjoFxXbk/M4q?=
 =?us-ascii?Q?4adkN7yKH/0M04CAS97ZN3Z8B0cEp4rjGRkIEssKXy2KNOFTMOFalSKOSHRn?=
 =?us-ascii?Q?MsFXbLcmreXPrpznopo9Yze1Bm6o4UjHIJhTpyxaWXc6RwzBXcYtREjjDKrF?=
 =?us-ascii?Q?kAOUYKfne7ss4xBwMrWw4FJo2rYnLGQOZqayCvTxdW0Za8HsRbEO08k4U29X?=
 =?us-ascii?Q?bg2kCQ06zIsAwKYOzJSd0ddbGOHLIt+5FNPaVBvyJNbgeG5PTGjfv1mLNzZX?=
 =?us-ascii?Q?p7AZJQ4jtvKJH7K9qcoYxVANQNbSwiuYDcSRU38EPM85v/ddufJhTi3vwrL9?=
 =?us-ascii?Q?DIXVay/nZOMXaH+lp+5qSyDmFxpYzcz+nma2BlFnLQ5QE4M4OgaITyMzURuB?=
 =?us-ascii?Q?3dsBJB04HDIfRw8KioVGGdRODsRfGX2NqQmnCvz/mqaxAb4SOPVc5jq1bacb?=
 =?us-ascii?Q?OTYWer32IQsVQPLFgi0lTjlGtd8/1kYq6HTltYQinEZivvl6H13hK/QnvjFj?=
 =?us-ascii?Q?181Jk4nUHFPCODwATuxVoymvlQjaXV+Jj+HhzRfywH8rrRinYrWmZOp0WUwJ?=
 =?us-ascii?Q?CoZRl1BLT6yhUl0c3AEZ9Dz1Ea5I3RIMcUEAxhDRp4zYTn0x8rLvh63KqwLj?=
 =?us-ascii?Q?ASv9ovDoWT2376ZhfAqlBHOcPYtrJxTsqcjolNLSrvX0aMmeqtKMyUsAkw4N?=
 =?us-ascii?Q?bb8Db8iaHatNcpD74ptbfcUf0QWZSpLqR/v91P/7Dfhjueb9clHi5DhO3jQX?=
 =?us-ascii?Q?AxdOkEKKW/o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aweLtp7go5BrQ1YJTCzjT9iDGQWKjf0cxvuzCfcJ7PzKcfzNk2o0FTxSXkmi?=
 =?us-ascii?Q?J4No/tY5tvobelZATBFFr+zsWR/Qk7D6nHpx9L3DRvzbf4LcOm0/XFbsxEGV?=
 =?us-ascii?Q?thnGJvpmsaHP3CqD7j4tfI1hUTUK9k0SsinX1+dORvftMpnI2D0g79rNGKVm?=
 =?us-ascii?Q?/RxbGzdwZbPjM0wBeva/tCnfXcSnjVjhwnK7kDiQsOvLffS4GqGP4vfmazZM?=
 =?us-ascii?Q?qfjINvW8rBLMao5UD0eHFE8t1FiGtkfsahuCtrq5Xq2qOVhWhw9xWi7jOnzD?=
 =?us-ascii?Q?2JSubhcMJNMgx5QPiKDtL7IzhsaBFcM9EbQq3SdZ4QPvfabzn87LD7IA9w/h?=
 =?us-ascii?Q?69k3LtwvLRSw9dk+t46omiJlblrRYUGBLJKFZgn3wDYWzP0SZ01DvZjkc6Qv?=
 =?us-ascii?Q?dVlPHvffw3C7kkMtWkGf4FAmDw5yRdtfXafRzE4pvM8L6RNVqhlVSfwZFzuU?=
 =?us-ascii?Q?QHcE36nqMPOF3DM+/vflNy5Fb0ZHh/UzUEiM+jx/Z9f/dBA2S/Y6aIgcuFMa?=
 =?us-ascii?Q?4/npTL1KEdLyRTMDIpuwRc+L1MN/BTTHo7aBi+h+jmp2nK0++5oRlj00Dvmw?=
 =?us-ascii?Q?RFNOBzIPr21ZgD/YK5iiX1MEWGqFZiihFeDxikN8WdljCnD3qdUNfJtjfVfO?=
 =?us-ascii?Q?SERibAnDfL2oFl1oYYGd1Trl+f1IB1Fzvqnkx/V3lPahzMKGimhDHWi75qmd?=
 =?us-ascii?Q?oybCBrruWeLdxs4V1DIq4iJNtwsGJ2nTpZARCDh7KktWDOoKInMDIXjlat5f?=
 =?us-ascii?Q?lwMwukMjbEkOtkvh+fzJTd+0olLYDYRiV1/r/hQVFITchdcpxyyE1mubK0VC?=
 =?us-ascii?Q?8fVuGq4qIlv3qB9iPrcGotNh/YvFfhyzWxB35tLWgv9guB/auQ8xN+ZKEjFT?=
 =?us-ascii?Q?ByOB6f3Hsdv0YA86JHFyfEiM3MFaID5/cjUlYohKhDi13H3I4sc9OKPrQZzi?=
 =?us-ascii?Q?teFNAPrd4BEfRcY6lkqHQxg9HEAz+YKA6En/QSt7jBePi9xABh2T14GAjcNY?=
 =?us-ascii?Q?27+dpbaTuJlFdHfbEPo3zCvUkj/HbgB/+3vfu/C9hVF8BV9xazqaI/mRsfgv?=
 =?us-ascii?Q?w051vrHGmJER0/oR2WeQlftPM2zdXBioxqCaqmqPtx2Q9l4rdPWuQl3AQp6+?=
 =?us-ascii?Q?G7dki1ave8RhfV8nWUvYmlmP0uVrIkzt3Oj2KQj+l3K4s12JldfNAmoBssjA?=
 =?us-ascii?Q?RqDtYax9Y45Dm9TecOhaaqD4QPdsojIRsB+9LJMP6nkGJOhV0BkxQfraGP3m?=
 =?us-ascii?Q?Kqzryb6Xc5Ks6M/YJtLc2DNPjG6dCEuAc3InTKcv0ACHlEo0XCeH7rDBMQSX?=
 =?us-ascii?Q?czc8cnkDFH1saqecGDrwF13r1IszoJsLEGZXoXyLG5KoiLev4U4CxBoE08PW?=
 =?us-ascii?Q?ML1rXR0EgXCVtOtlJhhodcQTpxYjIsB7BHJgcSbTi5qaHsWPxb4VXF9EHa6h?=
 =?us-ascii?Q?71UWAa/BCx5L3AasrBkbvTDIglNXg3U1/C+RZ6IUXsW7hs/Tx26x3ix4Ghvs?=
 =?us-ascii?Q?2v7S2Ej2//fRGVLQupkIfUr8Zwr8yLOrR4Gu854Q+sJf568jByYlr9cz31+Y?=
 =?us-ascii?Q?L9EcYshGrjIqaeBk5DLyV+bzi7RBr+OQa7fHIXArER17EXGSOgn2/adNdVam?=
 =?us-ascii?Q?6A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 08787ea0-fb07-4c72-2ef0-08dd9e41d3af
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 23:46:11.9266 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eeU+YR8718l1XIxEF2i4wXCJc/wgiAZDHP4Qal6c7ryecK6zKN5wbbhvk0+whw+s3VJErXmht8gXGXV6Z7E0DQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7892
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

On Tue, May 27, 2025 at 10:10:02PM +0530, Himal Prasad Ghimiray wrote:
> A single BO can be linked to multiple VMAs, making VMA attributes
> insufficient for determining the placement and PTE update attributes
> of the BO. To address this, an attributes field has been added to the
> BO.
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo_types.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index eb5e83c5f233..70960368a5a8 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -62,6 +62,11 @@ struct xe_bo {
>  	 */
>  	struct list_head client_link;
>  #endif
> +	/** @attr: User controlled attributes for bo */
> +	struct {
> +		/** @atomic_access: type of atomic access bo needs */

, protected by BO dma-resv lock.

Missed above in previous rev, RB stands.

Matt

> +		u32 atomic_access;
> +	} attr;
>  	/**
>  	 * @pxp_key_instance: PXP key instance this BO was created against. A
>  	 * 0 in this variable indicates that the BO does not use PXP encryption.
> -- 
> 2.34.1
> 

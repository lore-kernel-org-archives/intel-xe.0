Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 941D8D711CC
	for <intel-xe@archiver.kernel.org>; Thu, 18 Dec 2025 22:46:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53F2710EBC0;
	Thu, 18 Dec 2025 22:46:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LEc0JSMG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4346510EBC0
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Dec 2025 22:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766097984; x=1797633984;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ahjxV1/M4a9qmLpOXXkKVHW/tIsJ6njrtyxjxTXkQgY=;
 b=LEc0JSMGO24DrgJgUlSR5TpjySdLl3qDgmNMlIdd6ysb3gaSjdbeK1dL
 BLLd9h/74fxjD3eSlwjoSCpP0yj3UdFiV1cWiPdhuMsHr8whDhc+ypCZn
 rJUs0jHxXi5uHe+6xFi28/oWEy8yKGVzZTG0x9THkdrp5Tspb278H1DIh
 H24L9vJLGMgT6cKURyTHGml0Y9xKJsTnIcEnjNNea3t679sMzxTGGKZi0
 Cs6evyYAKQXhF+xA6LLVsuWsyIERwUZVoX0Ex75Ay3L4p67laBqehsz4Q
 fgNHHKs85M0cA6TcMZgeSRwjCaWgCQvIjvNr9r+ywfm4WyfgvwTxVDsgV g==;
X-CSE-ConnectionGUID: yMsg42IVTCuX90ZBkIc7HQ==
X-CSE-MsgGUID: JkBnsl5kRFSdLmV6hia6IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="78696875"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="78696875"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 14:46:24 -0800
X-CSE-ConnectionGUID: At4dhig4SnCSt0zsoxPHxA==
X-CSE-MsgGUID: 2DMCVzxZQe6ULxrAvo4r/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="203107985"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 14:46:24 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 14:46:23 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 18 Dec 2025 14:46:23 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.43) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 14:46:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hg5TQeA73HIWeEnUV2EClQroEWn4r33q9xVNwHVaKUxU1ga/FXoNxfx+n1OGKkLClE157iiTcWULOgdUm97SIeZ9kqBDhImgwYr1beSorL5fXqIP81eZhO+iVPyi8xRNf04WCzHOS6M4+bLDzwJKBQuJ9wXxUvlKO0A0Z8sOimuqYRYIPo9vduHXl8fg50Fr3eD0JY9oVvMjzk/nwPiV8NG5uboWRrIFu/DBcTOSayGGAqjEadN2l++OSJj1P3LxOSNDcqJOCHF3xK9k1AxSfpgii+NU9qDolgVsukXQyq1mjIYTmEu5fLTQ+vdv23ikHc0ozN36m1TSISbvGksmfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T4Fr8YUtL8QZjY5EG4AWNFC8QXsOUBxovmG4CXqSYq8=;
 b=b5EkLfCp58Md9Mcg5tHxx/pFKEVKABEYmh7kGyI/HwHVf43NVvTjkak/OZAZLb2kNGcUigoWQ0v3p0ngfBYk2smpSuw+gOzgMlYQLDvnybeClpLML1bLRzu+HN2zRnGfZpjzcgf2uxh6m02z6liQiGpnRgXhAXnID9DG9wtV0qCg/MxjrkSjQb44ghEUXRqfVfr9+r6c+zvXzycwrbErNDx9eryS3VuBnhHYYC5RWRVaQh5BgiEHoB3sqNnQkIFCIkPGkksEozCSAO7N8OTZyHPPjE0//YJoIUPsPlhnJ1z034D5tIXR+m7zpNC9nkxFyZQkqdPn1AA4GCGiKWkDAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by BL4PR11MB8822.namprd11.prod.outlook.com (2603:10b6:208:5aa::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 22:46:20 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 22:46:20 +0000
Date: Thu, 18 Dec 2025 17:46:16 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe/xe_survivability: Fix static analysis tool
 reported issues
Message-ID: <aUSEOF9ka7KjunaK@intel.com>
References: <20251218105151.586575-4-riana.tauro@intel.com>
 <20251218105151.586575-6-riana.tauro@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251218105151.586575-6-riana.tauro@intel.com>
X-ClientProxiedBy: BYAPR08CA0033.namprd08.prod.outlook.com
 (2603:10b6:a03:100::46) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|BL4PR11MB8822:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b1ccd53-7d56-4314-bf9b-08de3e87431f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?h57YkugRYNmNv7Z13DqTNopw/ytG5bcDLwjhNqR6Z3L/Alylq6+bXL6HUMMd?=
 =?us-ascii?Q?xD4TA34bAdpkp2BVsCFppao3xz3Wje0/u7tPCxqCQ43J/pT7T/A77EqoP6Ba?=
 =?us-ascii?Q?YRIQhkhqssibt/vcluyNPIBBz8CvWnmbYXpCiFR9yYHK+6qQUciePda+88wZ?=
 =?us-ascii?Q?QHrVoDGDW1YhsO8mzO5kP0rs8JVCVMEeW6foQYCXGzTlMdQRYx2/UcXHFiI3?=
 =?us-ascii?Q?nd9vL9/M0ZtEIEPuSueEuNECNN4/33mcHkgqIHQBChpx7MR8Yx5wysouXjJL?=
 =?us-ascii?Q?027b+o0qylaQa+5tBSKgpapJu58iUvHJke21mZETv2PdOYyjNoipfid4cvRg?=
 =?us-ascii?Q?dQnX6A08JWZuedN4u5WwLXHeQCjHTLUbSB18Vyu4tuNRzgxTPWd3RWXwzfzY?=
 =?us-ascii?Q?FVxY6ldQNjWZqUqzDc6qb+Yqe7Yd///QylX2oskkUBgxNoSfg2EQ85eK2Cm3?=
 =?us-ascii?Q?pf3m3J2lrKjxJVdhE7QQEjiI9ZOjpk5YZVGUbzvx/umK5YylLAR6btblIrZi?=
 =?us-ascii?Q?1AupUYdDnzNR+PtnXcvCh0HTIUR+UuEfF9X0U0fqLwZySASVaMt7iKClbSCb?=
 =?us-ascii?Q?/eYJEaTLX3KOhthmgqykioKlewHpI94Lbc4egHNwItt/wRWpcwdJbETmvtPB?=
 =?us-ascii?Q?HfgZFkUgeZnoQFjM7v0q7da4QRAbg+0iJUcGhDyiLEPG6KcEEVDgz3zgN4sx?=
 =?us-ascii?Q?FBFV5AqueZv8MyxDJckGyCG/+ieGHdcphBRMg36aj5/Awzr0F7vrfsQfWG5t?=
 =?us-ascii?Q?MThuy/bX7n9Jp3F2Ljj74yHpAF7PAfa59pYLV7rGdRdIPzd+ki26Z+86sGsq?=
 =?us-ascii?Q?8QHoFXjnHuFVkLot19Q/kZrnFWHQYxX0qSdFtHPLBKRKarcU1LybeexxrFQ2?=
 =?us-ascii?Q?CrMKg+MAXjY7VdpKbdG21+5pgb/rhfsBrSAcwuvCqpIKT7JE2Opc/xwRtTm5?=
 =?us-ascii?Q?KA74h2X9hiLNTUTaL3qlQNj1TlnqtX7RWNNBjCM2nJjdrh/VpWk2mfhKNw8V?=
 =?us-ascii?Q?JBO1zl2eXXDR2QwUbboVliywN4IiQoSF8Hykk4YoLRZwKIL4Ls5k2C1SNmVb?=
 =?us-ascii?Q?IDXFAijH+qD8fTYI4B5H2A8waTLAerUpnrBs5XLrSbmoLp/PuOFamOxERgpm?=
 =?us-ascii?Q?AMDr4+0zDlLvIicbrwREPj+WzTg11WRKtreklvuTrvBLQcPcdSQNMlZpo9Iv?=
 =?us-ascii?Q?KF/u448XjDZ5obNJ/2NBgIT09YEHWQ8JNtQX6PrWWHZSUwIH7jl7B42drBEZ?=
 =?us-ascii?Q?PJXXp3S+2hc4xjzxlBQ0odEWGl4JfkDwoTmkzHVp4xa1d97z5nmD9Pve/mSS?=
 =?us-ascii?Q?+Ymf+qbMvkP+u0yFk6HmBMaPL4MMGB0J9pVqbG7b80hrd1sMiAOs/D4xgMkD?=
 =?us-ascii?Q?QXkoSB0oY7MQly53YQeiNATzBGqbP62GGmy72CxWntvYmiGyBfuZuFwtsiuO?=
 =?us-ascii?Q?Ifk0izA7kyIVc+pfvlqvt1UhrYwumfCWETflRzijFbpiltsWHK965Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QjFHWDD5JEkJa1NKHcEFIAwD1p6EDyV3rH0EZNlpkSCGEBtKFUUTMGNmznMl?=
 =?us-ascii?Q?mOdo6RCBbBrnSq7PYk657hgM8xLlWo7Adqp9+ToVEzlTVRZZ7pZaKRYAwtzk?=
 =?us-ascii?Q?RWGBL1dWCtswrRZnuZvWGNok8mHBoSTcdlwg0FsQ6y2e6g9/sS+uBRlOUrX8?=
 =?us-ascii?Q?lxQBCaim40aV1oe3cVK18B+Coq4D6cejh2w7vLnjHqWH6vDaRRiict2L5BHO?=
 =?us-ascii?Q?GnF6w8WJSYKxGxcelmZpnHQWSJJIi2iZXS1b0CJExxU8emix8LpL2+psPS+l?=
 =?us-ascii?Q?5Oe9TfYjfNMYbmQhoyzjIcrlcRByeL4IRyoXxjNa4fSLxx5SxNhT+naFFcv1?=
 =?us-ascii?Q?7lx7amrNAy747joay++m/ankq8bLodMQwBA6cWozbkbazujXpwKm0lnE4JX2?=
 =?us-ascii?Q?o/hduVGjw5VRunDJXBS6Y59jQ02PO5TLQibGwCVxP8/ubM25rn/cBLdMvA8l?=
 =?us-ascii?Q?R9b8lGlFbKmtfOuozWypOdqfIIQepNl98KZXkdSNgWHEKscqXGLqZJYZsjM0?=
 =?us-ascii?Q?Svc9TLOsbMPbynueTrQ06L8xYRVk/xCVKfQYAp378TckzYVdfsujw6tnu4C9?=
 =?us-ascii?Q?KBxD7FLGOSd6kLnIlYrGn27dfP248afyph5sDJDsx8ICtmiqHEo/U3h5sZck?=
 =?us-ascii?Q?+5IScpPP+p+OgV1V7vPdU9nhUgYZnr9IXg4fZrIMp/HUrDOuWMol64nxlELR?=
 =?us-ascii?Q?qi86we2yeNVb6AmJDwJW4orwAyPtiCC1+uWGbFbbq71UY9W8DwqyLOBKNlcb?=
 =?us-ascii?Q?UwOJsIVMl7PYAkiXLYHI6jlrGN6wR+FWmm37j4WWHrPAWiL/1s6KNnYbGxaF?=
 =?us-ascii?Q?RbaNWf7zVfRlcd+6XEbYIMPZ56QzFrbMPj7O1Bhav53JkB42NI2vmw/qGgfF?=
 =?us-ascii?Q?+U0mUzjLZ+kjmOzH4bfaFRxT29qa9T/raSjj6Ljh+yKcbf12vYrntqpFM7jr?=
 =?us-ascii?Q?wyfkXHmaxTcOLzD86DWLPYgUPRSQFxFB+3xRa7kUHZD01WuVh35CuQ3hOM+e?=
 =?us-ascii?Q?nOCkrkRzCoarVQprc/bMsioTRu4B7D54ccwusohZR0jNV7ptAzsJYjRXRhf8?=
 =?us-ascii?Q?p2ZEwKoOimuQwbZf9L/f2n6BLXRPfzUhbWjAQEr/qhooGSo5QNWL8R5Xwf96?=
 =?us-ascii?Q?kPepmlQ8hmeFCXHrHTv3hyqHk+GTmhV2KW0fS5U8lcNTJHp9ZWNJkym1rMKA?=
 =?us-ascii?Q?Y6AE+gBn5gbgYh5zMOXxks09Bynrw72Jfx97GXw2+5ayzSJMO3EIFPh+tTzB?=
 =?us-ascii?Q?sza9iSmXEbvwh51Tdcq149q1Y/qi9bJ4Kojfgs1ANuYRysdH2Xr2TGWiDzuy?=
 =?us-ascii?Q?/pw/2+BwQ1G6FsSGFobjuKcaREKHGG7ByidNQSF2nXuImKGEq/r1KfyoXfDO?=
 =?us-ascii?Q?2t2IgJf4sLdyVYDLw0XnuyQ2NVEcYFuV+qtM4D4CcKtaZ0ZzSO4YB2ky0m+5?=
 =?us-ascii?Q?ep4X+Ssm9OaSkId0fjxmkPcvJ5Hgvdb4Gi9hUeK5aT4UW+hC9uzKjfCnjdyg?=
 =?us-ascii?Q?82zBXBQlz25p71h2e0ZM5eiB4Xl+sb4dnfrHSwTWHUViEkZs3DvVn6Gc8WOI?=
 =?us-ascii?Q?eemGBMZ62aMtKEmnmZTqGbvTCn1XKJYpUn2ffhGhJCL3xuqser3iDtqCWHmo?=
 =?us-ascii?Q?Iw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b1ccd53-7d56-4314-bf9b-08de3e87431f
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 22:46:20.3530 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hMmfQMFhiE5Q0KFdIbJzCmSID0TEELoXp2ixc/A2iwagJ2opQ8iGCDKuQeAUyqxprOy8hF/+deJ5RWsKrxvzzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8822
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

On Thu, Dec 18, 2025 at 04:21:54PM +0530, Riana Tauro wrote:
> 1) Use static survivability info attributes.
> 2) Fix visibility condition
> 
> Fixes: f4e9fc967afd ("drm/xe/xe_survivability: Redesign survivability mode")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202512101919.G12cuhBJ-lkp@intel.com/

I don't see the number 2 above listed here in this report.
What am I missing?

Also, I believe it deserves a separate commit with proper explanation even
if it ends up with same closes and reported by tag.

Sorry for not noticing this on the previous revision.

> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_survivability_mode.c | 23 +++++++++++-----------
>  1 file changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> index 2869866537ad..a25a23bcacc8 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -221,15 +221,15 @@ static ssize_t survivability_info_show(struct device *dev,
>  		.index = _index,						\
>  	}
>  
> -SURVIVABILITY_ATTR_RO(capability_info, CAPABILITY_INFO);
> -SURVIVABILITY_ATTR_RO(postcode_trace, POSTCODE_TRACE);
> -SURVIVABILITY_ATTR_RO(postcode_trace_overflow, POSTCODE_TRACE_OVERFLOW);
> -SURVIVABILITY_ATTR_RO(aux_info0, AUX_INFO0);
> -SURVIVABILITY_ATTR_RO(aux_info1, AUX_INFO1);
> -SURVIVABILITY_ATTR_RO(aux_info2, AUX_INFO2);
> -SURVIVABILITY_ATTR_RO(aux_info3, AUX_INFO3);
> -SURVIVABILITY_ATTR_RO(aux_info4, AUX_INFO4);
> -SURVIVABILITY_ATTR_RO(fdo_mode, FDO_INFO);
> +static SURVIVABILITY_ATTR_RO(capability_info, CAPABILITY_INFO);
> +static SURVIVABILITY_ATTR_RO(postcode_trace, POSTCODE_TRACE);
> +static SURVIVABILITY_ATTR_RO(postcode_trace_overflow, POSTCODE_TRACE_OVERFLOW);
> +static SURVIVABILITY_ATTR_RO(aux_info0, AUX_INFO0);
> +static SURVIVABILITY_ATTR_RO(aux_info1, AUX_INFO1);
> +static SURVIVABILITY_ATTR_RO(aux_info2, AUX_INFO2);
> +static SURVIVABILITY_ATTR_RO(aux_info3, AUX_INFO3);
> +static SURVIVABILITY_ATTR_RO(aux_info4, AUX_INFO4);
> +static SURVIVABILITY_ATTR_RO(fdo_mode, FDO_INFO);
>  
>  static void xe_survivability_mode_fini(void *arg)
>  {
> @@ -252,9 +252,10 @@ static umode_t survivability_info_attrs_visible(struct kobject *kobj, struct att
>  	u32 *info = survivability->info;
>  
>  	/* FDO mode is visible only when supported */
> -	if (idx >= MAX_SCRATCH_REG && survivability->version >= 2)
> +	if (idx == MAX_SCRATCH_REG && survivability->version >= 2)
>  		return 0400;
> -	else if (info[idx])
> +
> +	if (idx < MAX_SCRATCH_REG && info[idx])
>  		return 0400;
>  
>  	return 0;
> -- 
> 2.47.1
> 

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE584C4332F
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 09:56:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B5A110E503;
	Tue,  7 Nov 2023 09:56:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89FA310E503
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 09:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699351002; x=1730887002;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=GX5V9jGQKgvl4PsHa5/0m/4et8GoQishp0sffy99eOo=;
 b=Be6vFJrJBCiZONg5JgYnW3AZgGKF9q6XlQyGePrvELqcJMbuGDGSHa9O
 nw11V60ymg/0QrPFse5t/6oqXVuHbU/ffdnJQ85bpSvb5fxVM4e75LBrT
 xZX3HhZXx2b6Cl11nDjWLzWWoshPJh2f7CIX1X8O38sMxTAnQzKSAAgQH
 bPFJ0Mn+VOJY0f3+UySHmWwb9Dm2o0fZEnPZeczd6Pf+TNilvDKWkWjS/
 VlwAaMwG8303ScpkhrPRBLLCBoGKENBXRmSQI5N76VaL4+7wjHN4HrEF9
 NAUcx3BQfT8ZV04Jd9+LR7G28A2+Y2oZoM3jg5R8IoeHabVMaBlNIhk9o Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="374501172"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; d="scan'208";a="374501172"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 01:56:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; d="scan'208";a="10776308"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2023 01:56:41 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 01:56:40 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 01:56:40 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 7 Nov 2023 01:56:40 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 7 Nov 2023 01:56:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M9umNfLE0X9wziGjNqrlXknBGkYV0GnlIsgI02s80jCv412R2Q2YIcpQ5unw9eNqsWFhT7JW50gWQLVBV2VaOl9sJ6MSRPkz6B5zM+d0HIqsWPd83Dk28aLhE9fjE4hmXIsxVHKWzV5zkcKm+mAdZ80+bnbQAsOcFiQ/xopwsORwoKC3ZgbBXvz5AYTPq/srQ8bUB62gC3sGXA9o0Nx74SbnCk4bNO/crrKMRks9O5+86YvidKbEXzdP7MVgZ3u+/DeSE2rp4rYpSNRP6WbLq9ws53Gm2ig9LBq1kmjbgIuDOWXxCRJKMkfK+RwEF+ar44SlvZbLcqqHx/P0E7gbrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iyf8yhKjAP0z0jKQwaZC7+cJTOzIITSeoq3Asj6R52U=;
 b=bFPz0KN2P9CLn2s2aAAopm0RsFH2dRnKMLmksbxDuCJ6NGQj/Ymo98LnMMynVpBRCY28YMFKSYqzqzg5EnAYCS0m9yPoh95XKdqquvAMz/+/FeuXKdO/6yfcj05siTnq0AX5pdSeNAr2Npmnd1TtaSH2yZkVp2DJ2d/IWgm57vNPVqWEaB62cGW0cZlNv7RlrCAVrZEOUWFvBPB97VgMIyjyXnJdXPpMulvgRH5mzB4KzZ/FbwOIEdvV8J5/kP9v2/vYh71iMAnOj3G3A7ZCVF7hdfwOQ+//N/Fp0N7fDMyFuqIeHKP6/2WB+/oEVGS/3BqRXaUwkBoEeDZ8kbNPvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SJ0PR11MB4958.namprd11.prod.outlook.com (2603:10b6:a03:2ae::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.27; Tue, 7 Nov
 2023 09:56:38 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::3514:49a8:468c:a3d4]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::3514:49a8:468c:a3d4%7]) with mapi id 15.20.6954.028; Tue, 7 Nov 2023
 09:56:38 +0000
Date: Tue, 7 Nov 2023 10:56:31 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZUoJz0qGqMjO5Tzv@fdugast-desk.home>
References: <20231107082440.7568-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231107082440.7568-1-thomas.hellstrom@linux.intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: FR3P281CA0154.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::7) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SJ0PR11MB4958:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c80194f-fe99-4463-4171-08dbdf77d5c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P+brD3Ta26rbuVr2RDC05j5QoRoVkytkoWlKfbarQSRqZs7MsxI2Sw/m1UfNeUTod1WyRNhQSC7HxGOknpGrz3G+RsAdCLW60Pwj812AqmOKs3JkN4wRtRokE1iTZLW3buHnfAVxC0u/iiBVafofA12T+PYTtRUSTkkqSDdipBc8Yth9bMyw76+JAJMNRXM4GA4ImvZPKJOIBArkILMT9rTwheK+XnAfEo2gOuNG7Ni7Q1ezktE5rsFMX1Qg+9wlkigWaAhFtcsvqH2WPmXY2kYMBpgoPiVONF/QgX0Y/2Q1fvuovSuNYrUq0lKMy7X8sG95b27Z8ywOOdObmMcEknDrNogHUmO8T1OffOwovP4OxF7yJt7wC/Xywbj5pj3zFtJpn6h1dGe4i8hoJnMpFOU6uC4oWVkeb35nOjOwBeqNeLLv7iCrPJQHUriojNfgoSZNUf7ST7rwDBwhWyIm8TcmcAUcZonunHM9iF0CJByl92VAlQWDT78Q6FvbjNUWUctAbZY4F6yX9yal33AnjWLraQqrmW+ZLz6Zx7yEYcXbrrSZvh4ZBWCd5uIB1R3r
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(39860400002)(346002)(366004)(396003)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(478600001)(6506007)(6512007)(6666004)(6486002)(9686003)(36916002)(44832011)(36756003)(38100700002)(82960400001)(86362001)(41300700001)(316002)(66946007)(5660300002)(66556008)(66476007)(2906002)(83380400001)(15650500001)(66574015)(26005)(6916009)(8676002)(8936002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?cVzjawpYEAS+Ur1gf9k7Dg+aOlh+rtoxMNwL7iXFyZQSMvgulaszt7oBrg?=
 =?iso-8859-1?Q?ZylMIhPlg+gY/3C3X7k5/VF+FU98HbRLRh+pxOCtFZS696htUx7bfjwMLO?=
 =?iso-8859-1?Q?tolNgiToAEIP0EcZ9v3W7IyQkQgPoFgN96cCK+mlBG0C8vJUURVUrK9dIU?=
 =?iso-8859-1?Q?H3xlKf0M9AqJQf5TQcRc8rCtKRBNmmQwv3C4czLd/AO3Dxm5mHbac6F1M5?=
 =?iso-8859-1?Q?CwknhU5p2GQLVhfHmKx7nTBmBbErcVrKGKzSio2sRIoKCuM3jtJ3CVpFkb?=
 =?iso-8859-1?Q?bqE5z+fAECW5F4+lBFOV2t3UrqF06P6j2hPghTwjjHPAXYd3z3JnH7QzQ6?=
 =?iso-8859-1?Q?6LxAfgP7TJWBIv14Y99iijElkYL+Dbwq+q2LOCCKc5YAPe3O30sf5v6GU4?=
 =?iso-8859-1?Q?TeE+wBh0+p/OmAwrVPbZKPkmlIduDKeT1f4DF8hIkyiA8sr5MlS9wnjoVM?=
 =?iso-8859-1?Q?nOTk+hm7QfThBg+7sxAU3yKNX4V/xO6CgGosRQm64LPmL3mpNwd8O+PBg9?=
 =?iso-8859-1?Q?wC1v8QU9CahbGWn5f/NwtSIS+xHCk9zg32AJKAWXuos0fTBE4yOPxqaA9s?=
 =?iso-8859-1?Q?Bkv2f8UvBmyrN6CHvx5JQuM28W4kxF3QWkFGjGpbk1tfcARaejXNPsz2BO?=
 =?iso-8859-1?Q?2wemXvjt2kjnGELbL7XSK06wpqvDmROBZjtoYZgyShWvBpZu4HhsBMwtSx?=
 =?iso-8859-1?Q?owbhq4eP4RtizcgcBjzdj8Qh1PPVkSzaxgZlft1IOU+ATdnM+Y2cOfP3qO?=
 =?iso-8859-1?Q?HTTIaIcSpIV394IwmsYdcRZGws4T9qdFMHOPXdDJ3oAzcgklMQIjywAvJn?=
 =?iso-8859-1?Q?xPFjetd5uDy6CcClMAFMsyYakDtW993/7RqX+kQt0BXmuqdqeLjoagyDMu?=
 =?iso-8859-1?Q?sojdBkQBbvUBWv612/LsPw3u2uZbpCo7kgH8ukqRwwcdlL0QGox6DXCPPh?=
 =?iso-8859-1?Q?SmeZQ2E+CahXZdGAmiR0aCltO51bUdiP7WeDuy8soGPFLvcm2zq0PKhUdl?=
 =?iso-8859-1?Q?dqJC1MDOD70jhIe2SLIAbItp2W7UGoAbsTxRh+G+CToUiK3dwggStuSRlN?=
 =?iso-8859-1?Q?4GCJG5dyVhIFb3OJ00348SqFM2cOFpH17KuyBkD0LktQp34OpMTJnNSUsE?=
 =?iso-8859-1?Q?cGqNDbgmrQ+yOnRPEzCaXOM9xl8BdzrbxO90uD3LRVHP1twPYDIs5neGi2?=
 =?iso-8859-1?Q?kFqxWRomRb7KEuHCPp/8AD3f53UX/LgS7iBIV6NTuIu36NSCEVeTK/aYYY?=
 =?iso-8859-1?Q?+P9vyfwqFU+N/lldDCid5ZZAJzrlsMc0kosSQtf/n9iisIdEF5fV5NzUfs?=
 =?iso-8859-1?Q?Bh7f6TTv1vJ4reUe+fiVAiCftQNsm4lVoVTAIktZ4YvfubRzobQ7kBHcEa?=
 =?iso-8859-1?Q?jIo2xSKsPeZaQK4MSDc1KGIl/5//IJVEqNjHhJwmVimeQ0ex2BG0sW5LP6?=
 =?iso-8859-1?Q?rLQYKERO4DpffpChcVxCO+K2JUfm/1Sj6j6cOErHEUNQd7R6eEjfCZpWVK?=
 =?iso-8859-1?Q?p2FZNkQHaia/OooyKVZpftw9s82sY/Whwu3bFrnoPefVaTZhfToSzsZ0gU?=
 =?iso-8859-1?Q?DyrH4HEiV7B3Gq9MtMOM9rpH32SxxWOWExy2Bz/MKZlvbzjR7bao7kOr1P?=
 =?iso-8859-1?Q?+LeiXlfiQQBlLeDHO5KYBTVQVXEQ3YoQk8S3/ZC9kRNCg6T/83eJWxNw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c80194f-fe99-4463-4171-08dbdf77d5c4
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 09:56:38.4423 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a/uDjTzw9Bg7ax+JEvCghHMf7SPzaoJtb0P3LeO6AOZwVshp1YGZS1LiOCcrLz0HsZhi52SSDt8Y76VID+jciz7eMkg+iwv7esR83/4t4Y0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4958
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Update SPDX deprecated license
 identifier
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Nov 07, 2023 at 09:24:40AM +0100, Thomas Hellström wrote:
> The "GPL-2.0" SPDX license identifier is deprecated. Update the
> code to use "GPL-2.0-only" instead. Choose this identifier over
> "GPL-2.0-or-later" since it's the most restrictive of the two and it's
> not fully clear that "GPL-2.0" also allows "GPL-2.0-or-later".
> 
> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pt_walk.c    | 2 +-
>  drivers/gpu/drm/xe/xe_pt_walk.h    | 2 +-
>  drivers/gpu/drm/xe/xe_res_cursor.h | 2 +-
>  drivers/gpu/drm/xe/xe_trace.c      | 2 +-
>  drivers/gpu/drm/xe/xe_trace.h      | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt_walk.c b/drivers/gpu/drm/xe/xe_pt_walk.c
> index 0def89af4372..8f6c8d063f39 100644
> --- a/drivers/gpu/drm/xe/xe_pt_walk.c
> +++ b/drivers/gpu/drm/xe/xe_pt_walk.c
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: GPL-2.0
> +// SPDX-License-Identifier: GPL-2.0-only
>  /*
>   * Copyright © 2022 Intel Corporation
>   */
> diff --git a/drivers/gpu/drm/xe/xe_pt_walk.h b/drivers/gpu/drm/xe/xe_pt_walk.h
> index 42c51fa601ec..ec3d1e9efa6d 100644
> --- a/drivers/gpu/drm/xe/xe_pt_walk.h
> +++ b/drivers/gpu/drm/xe/xe_pt_walk.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  /*
>   * Copyright © 2022 Intel Corporation
>   */
> diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h b/drivers/gpu/drm/xe/xe_res_cursor.h
> index 006fc1361967..0a306963aa8e 100644
> --- a/drivers/gpu/drm/xe/xe_res_cursor.h
> +++ b/drivers/gpu/drm/xe/xe_res_cursor.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 OR MIT */
> +/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
>  /*
>   * Copyright 2020 Advanced Micro Devices, Inc.
>   *
> diff --git a/drivers/gpu/drm/xe/xe_trace.c b/drivers/gpu/drm/xe/xe_trace.c
> index 2570c0b859c4..2527c556bff1 100644
> --- a/drivers/gpu/drm/xe/xe_trace.c
> +++ b/drivers/gpu/drm/xe/xe_trace.c
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: GPL-2.0
> +// SPDX-License-Identifier: GPL-2.0-only
>  /*
>   * Copyright © 2022 Intel Corporation
>   */
> diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> index d55dd1521df3..1536130e56f6 100644
> --- a/drivers/gpu/drm/xe/xe_trace.h
> +++ b/drivers/gpu/drm/xe/xe_trace.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  /*
>   * Copyright © 2022 Intel Corporation
>   */
> -- 
> 2.41.0
> 

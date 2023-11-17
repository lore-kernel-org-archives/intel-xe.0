Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1DA5C072A2
	for <intel-xe@archiver.kernel.org>; Fri, 17 Nov 2023 15:30:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74F5610E2F7;
	Fri, 17 Nov 2023 15:30:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8949410E2F7
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Nov 2023 15:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700235039; x=1731771039;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gv5vjy0PbpWlwoc7lHs+dAsFQJgZKpxvnvsk9/9p2Zw=;
 b=W0nN0H5g5B7xGEE6u0RSuliU/eRsZxXF/lkB6yDyaJcWtXw0gV31YwDs
 MKLONvKTQyfcW+Jdd+8R6zS9VimmyPgA3MwPvYbBwJiZbRqblacdMFKJF
 xyhhJY0B2VRoMc8sR9/CT7mAtrQSRICBEAt6egr6+HUSLFqP+Fmqdodkv
 XqgX8yhjJtt4RKmicEjH59Vn4IPyzhn46RejQgjJYbHZwbDYqTDn87Myy
 TaxHaGOY/48KjApSvhiuGvk1Ob3F9BrddxuC1I00kN4ueZ0MizF87GJFi
 SFA4bL8GXx7hSnwONNLUq55RnZFodRbUKWlSxb/8LafnOsQAGJPCF3LLd w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="455617092"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="455617092"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 07:30:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="889267931"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="889267931"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Nov 2023 07:30:39 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 17 Nov 2023 07:30:38 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 17 Nov 2023 07:30:38 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 17 Nov 2023 07:30:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dix04Lmpx9MJi8OBamQpF5JaDr6a5tSsEZNYqlfFM/4lf2ZKGmyBb+9Id/McU1dIrwbCVnSgqvp58fK95N1pn0qSKXaUdYOHKb5UJ28JrbP2RrQcBZg1/aiCzOKErPL2b6YqNUX6PzkbGsr8YzwYGy4BvOnRnU9j+vh/bBZvux/tO9ji2NfipatxuVml0Tw1n3TGj8w3Mv74OrhxC4/cbz/+2HPyGsHu7nan4KcwxbEIdB6DdJKNVa00VPaaQzcu+TAvcim1BnxcF14voOpX43+MKhYFuQHjaXiP7mddCIkPp5L1SU12F8WWfAT3npvNQPXfbg5M2Y2jY3DYClpleQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eN20KpspGhauFgHTQ9fAoueibJGc5dj1p0vlNS0uh+E=;
 b=DcKbuM2/ulwP5LiGOAI6c+u2z7q5jOAazmTuak7vYVj9GWWFJYauSqHZp8oLyEfC2y3z0SyxLKsg3fICnz2Yp+d0X7jRwG98wPzDFN+9yPnhayMvInBgllQ1guM9gZVzdORaatnHhC6MPn+rWhRMh305AL2DNx+ov7I1hlZutd1nf5s40UFj763gAXT679IZlPzuaiMP/XD3Uoo/YTlRxAf608tIahFR9LngvQ5LZtFSv6PpAcBdjLbdaNvR9sDVohWS5k9jwCEisu1ZUZl+miNaUMTw7z0ZeA2VO9rxs6V9grb0L7ceUBSNMcj0jP18E3rq7/AIuW0tJvMQujlbaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB5210.namprd11.prod.outlook.com (2603:10b6:806:fa::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Fri, 17 Nov
 2023 15:30:30 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::1c7b:3943:33a5:aa9]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::1c7b:3943:33a5:aa9%3]) with mapi id 15.20.6977.033; Fri, 17 Nov 2023
 15:30:30 +0000
Date: Fri, 17 Nov 2023 08:29:40 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <ZVckdDrkeAvrs8/P@DUT025-TGLU.fm.intel.com>
References: <20231117035321.40102-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231117035321.40102-1-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0226.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB5210:EE_
X-MS-Office365-Filtering-Correlation-Id: 296009a8-70f7-4618-d620-08dbe78221a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5KUGXeoWPh2R8/fNUtFd9BMZmvHRe/T6+j15mfxvdGuWPBclTCjWzJpAF/havT1+P1Dex0/oWlUbRSYs8LQI3o2FLkRyKZnc7Y5t+EZbuapM53LVtllt1xzle1gE+Zj+GZjmUIy8XvWHHHt5V2K0Cogpb1FZARJAW/PMooPTHnT04+s9GnaAYw5mVusLBzDBmGzVJy1HbL5czgR9LHw/FW9dLqN6JJ+/Q+3wI+YhmsHSQU3msHZDJdcnvTkxYWauVCau94HKTVY4o94jRV6lvA42+cNiGDtI1Y8r83Qzje0ibdUXqNWhMFhXfPCZ3hBP2D9ZQfhynO2fvjtRQnspFNg9dlnP3y6HWIhhcO+KmFSseAeLgEB5psb7d0oZK6L78WmIrnEvCeLinGA3oheDG4qQCu3n+PI948qWf01cNHbTneLY8ErUcvUDdteJqCT2laCvs1gqzy6hbSJv+0wEYg+pbR02CdFvRxJHocATKl82xHomA8dAM9YAug6jGBHO6vdcel3p7GtxcbRAdiotJZc8TDmfppNb6SAGaUjk/JiamS3/E8t9L3tQ8wSjXWzB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(376002)(346002)(396003)(366004)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(41300700001)(478600001)(6636002)(66556008)(6862004)(4326008)(8676002)(66476007)(8936002)(316002)(6486002)(66946007)(44832011)(86362001)(5660300002)(4744005)(2906002)(83380400001)(38100700002)(6506007)(6666004)(82960400001)(6512007)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MancpSQPVLmwiUX9VoMk5gGkC5bDLSnNmUeqF340fU0zL6WBch5P4hPCxUx3?=
 =?us-ascii?Q?OIlPyvUDhndmda/3INJdYkbyLGm0XMqU7Q9LTHNTFKl8QZuQtfi2SJaCHEoy?=
 =?us-ascii?Q?TwlcbIGGeK/NP4RnMVoCTqFZKVgmdNQz9J2vYRED+3xIvYO9rGSjDtfRZQtc?=
 =?us-ascii?Q?xPEdcLczVf7uarmWHq8o7pnjMIlSs0vZvurdSs2KY92TLPEFHPKeVTn4Updd?=
 =?us-ascii?Q?JQAjtEyZVZDrvnUA0ORegtSvXqImEx82ZZL763BUO5IFycNcgqbMEht/8Zn4?=
 =?us-ascii?Q?C7k9W+bH90WGftr/MYj2bBl78IOTcWVaLnPkVuoSZG/uHlMM1FvrS+0y42u8?=
 =?us-ascii?Q?N5m56RS3FotJrcd+FPEgNfnQtMNATn8dtIPAv8VBi7nxtEETiLwXBhG3GQqE?=
 =?us-ascii?Q?/S2/V1RTEQbQktjs2FZSZxuDLKPmJbju+syjXz4wPHXOaZbWq3LhKFA49Bt3?=
 =?us-ascii?Q?8xcpWDNgSZv6JVxV7bjdyQ7vjxJUZKiP71Aqz0S1PEj/l5CBHF+wrorqEOZo?=
 =?us-ascii?Q?8r66BNp4tY8HqjDUQUCQxg6ly6kGhowlGTx8ER1a2+j4Dv8VNjum1QTbimrk?=
 =?us-ascii?Q?ZyRY5YeMywj9RkiRFx+emO4Ba9Ghi4/a9U0aLE0VT/PXslBW3PASh1yiw5hR?=
 =?us-ascii?Q?yxSiiK2Ii07lv4B6JSOdJWshye7KBfeuhhpzxpge8nku6J+QQ5VbIawfXp6X?=
 =?us-ascii?Q?Ugx2GhlV6ytEw+97k4jtu70PCo83kfXOnzfT+5FR2gBB3+BZrs+lnXu5F4hN?=
 =?us-ascii?Q?S8Saz+Wk/LzbRb8OrzK+NvNU7H/1plApCTg18MvwIuwlVXv0G+dkEEUgHvoj?=
 =?us-ascii?Q?HZuTn1vk1Z37kbuXSqCn3/KI2YKcdNXkSK6u+Ajmrxf9Q/QYzLPZ5jzw/L4B?=
 =?us-ascii?Q?5aoSmTjRl+s6G1oPeij/omqtIGJgNbhDwLZtOqB4gPDHsMKIhAgSV+FqkiDw?=
 =?us-ascii?Q?Gq4eOo+0R6rRZa64tOucLwUNnv3TA+aGZvffFmIpuQqHDeqR6xUDvakiwM/C?=
 =?us-ascii?Q?q9WRNXFCd0Y8765Qu7G6UCcqqJIsXs0Dn7EXbIk1VXOq+NX+HwSKv9Oh0lPP?=
 =?us-ascii?Q?3d4JG0cfc0NV51riTP5tBmTmy+2G41TvsIv73m1UFae95n/BvJWrt1PysB/3?=
 =?us-ascii?Q?QfV7vuggwlw4p/JuIkdIXzLwV5xQuytlIwvwkghbtKetkh7dUNIeA0ctmFs3?=
 =?us-ascii?Q?rvNoRcma6jC0nnxZCpya3eGCWSqFyeLr7D/5NoVas2x2ZyK5whdhiNBjvKaM?=
 =?us-ascii?Q?Q0PHoSP//BTwy/mlVjh9ivJA9FAfRjD1i0yjE6ytHlSqtqO9B0mYjg+8u7XA?=
 =?us-ascii?Q?Xyx9mHBPFBOETVkxkGg4VJ8aK+MEwG1XCukTmrgd0+SofvyqlBOY+/4Q8mwU?=
 =?us-ascii?Q?09VJzjmNGsPz0Yquzt29m5sCZgNKwXdWN4sOABVHpLT+06ETt72KR2TMh3UT?=
 =?us-ascii?Q?08rsnB0h3bNOgy/sO1f85o+yH+9jL6GPGD7EYEgGugDua36Jb2ZaCt4h9c/q?=
 =?us-ascii?Q?lE4fcryo0mcgalpjP6Jqah+urh8bYW3c7/wRVjUNeREdbElS3TKWmJc4Kb8c?=
 =?us-ascii?Q?MjcE7mI57Nszp46JcH3boInAxNgYtdxT0fHw1xJITSUQUsgFOkwNz7sIMMqb?=
 =?us-ascii?Q?9w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 296009a8-70f7-4618-d620-08dbe78221a3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 15:30:30.1349 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xOkE4AgnVds/+RmjJml6/jIbsimjsHJPiOTQX3yoyD4ehdGHdp9KJPY9FvCyCOsqEvcXvCGYgyNQXUJfawKHkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5210
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] fixup! drm/xe/uapi: Remove MMIO ioctl
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

On Thu, Nov 16, 2023 at 10:53:21PM -0500, Rodrigo Vivi wrote:
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_mmio.h | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
> index ae09f777d711..24a23dad7dce 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.h
> +++ b/drivers/gpu/drm/xe/xe_mmio.h
> @@ -124,9 +124,6 @@ static inline int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask,
>  	return ret;
>  }
>  
> -int xe_mmio_ioctl(struct drm_device *dev, void *data,
> -		  struct drm_file *file);
> -
>  static inline bool xe_mmio_in_range(const struct xe_gt *gt,
>  				    const struct xe_mmio_range *range,
>  				    struct xe_reg reg)
> -- 
> 2.41.0
> 

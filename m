Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E67ECD37AA
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 21:12:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62CF910F26C;
	Thu,  7 May 2026 21:12:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iLZoj2fj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1A8310F26C
 for <intel-xe@lists.freedesktop.org>; Thu,  7 May 2026 21:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778188371; x=1809724371;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=GlkymXE9BGGZMunq2QUWW7A+UxQG92iYidtRLQqv8FI=;
 b=iLZoj2fjyrPb2DWVWHbpJOhiajbKXo3f+z2NQwNJzznpwc2NssPnlGcl
 PN9KarJlTn9+fJKRfGLdzSSv2l6aSgigjH4L3Ti7l18xlTgB7ac19c14u
 wUO25Yby9Y4ehMRirJBq3c9VuxYD9BO/nvDruNll3feWGSzqJY7M6hroK
 e64XGxox52vMnrW9lYCNKYaO6FZqEujf3/6GldaVHRkGcc+oF52cwKpS2
 XdN3lfoWw2yvrVsYlwPjYxOi7aVGRYDyZSXtIV6ymUC+zXl3UPE6zgyxA
 Urj41ZMlhE/hyKvuXrzPdCJbuvzx0jkybzbbbKD4UuWKC0URLsrlAaIA4 Q==;
X-CSE-ConnectionGUID: u7EGPEL3Qaqp7x8EiMBlWg==
X-CSE-MsgGUID: BVKkMTHjTOGg7klYyLHGmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="101827407"
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; d="scan'208";a="101827407"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 14:12:51 -0700
X-CSE-ConnectionGUID: kbAF22GuTEOFUVuZc7Y4+w==
X-CSE-MsgGUID: sVOyRgQ3RqqY0/BHQMWZoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; d="scan'208";a="240913468"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 14:12:51 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 14:12:50 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 7 May 2026 14:12:50 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.0) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 14:12:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IOLYUPC2aX93if0SIYKoZeI6b4gFru+wfCm6XSrWz7Oc/We1cecLzc4AWagVhK75ptoloVYKtuhgxFZaiMdL6iD9LrwS4ZBXznetwvYCyBDl3FzXGBWmeTDZsWRm1W6bkwUkZaeM1G9TkNJVec7oWieQ7wmIbPFqoNYwmHg9zoDiEEsIm2Z1NLug0FvpE8Xj5Sq/XuHBHwE0fTaZFWB6OKf/rVsN5u92adypY0Ivt0ckMxm/+Bg4SaVvuu7NeeTEgY/+sVcV/lL2th/4Yqc6Jqgr0OTVy+LAd9svkpCHRAyD1gYI1HuILk1Oh1TrKOmBJ33IxuuUodpk0yimdiJNwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MUi35+WOc4ipQTeA+x5T3Nff/daXxZbFhyBY7I9rk6I=;
 b=StmHT6f9VTZwIg/MO/osjXBOko6c+9XIcnatJzftDtbiN5viMN7ztv2UnMwtPGH9rECUMKqn/26HAlyy0Pa525gzwgLPzCPBjiVypJaD/tSt/AkuNeVh0uti4JQgvin5mgrfNhSEvF+eYiWdIyR+LIU8MfmlS0KDRRqmdTYre8Nl+no92nvNF6c7NQ/F5HShcmAgdOsuC+odrOjWgo6s8I4Br5gzCMEgptnQ3ewnJvSIi+nv7kgpgMpbd50g8h4FAkeJ5ETWb1vUWZeExR66tr9OdzTxoTAl9KuzU9+2/BmtB27eY6wYJYKT/qliwhF3YRRa0wjonre8CUmK/zRvSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CY8PR11MB6939.namprd11.prod.outlook.com (2603:10b6:930:59::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Thu, 7 May
 2026 21:12:48 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 21:12:48 +0000
Date: Thu, 7 May 2026 17:12:43 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <umesh.nerlige.ramappa@intel.com>,
 <badal.nilawar@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [RFC v1 5/5] drm/xe/fwctl: Add System Controller FWCTL RPC handler
Message-ID: <af0AS3wtCOsdg9UH@intel.com>
References: <20260320072528.1780651-7-anoop.c.vijay@intel.com>
 <20260320072528.1780651-12-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260320072528.1780651-12-anoop.c.vijay@intel.com>
X-ClientProxiedBy: SJ0PR03CA0247.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::12) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CY8PR11MB6939:EE_
X-MS-Office365-Filtering-Correlation-Id: 8074bf56-3b00-48e3-267b-08deac7d63cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|3023799003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: dlhKn6U68n5WBHDXBGwPmCkI0e+IjQ4a5m+0gPRUKL2pwWsqZwi+kNDPY8PPB/rF4lQN6/1PWy1dh7BCUZZlCGZO6XToi8Drw/KFXWpNcGc98ajTtaJbWjse3NyNKOEuzcU2Qx8oIUbojOeZqSqVaR+sVd8d1sJJzrIh6R83PYsg2vZJzUMKMQECoQK/kBbfZ2EeQoEB+4e3Tb7ipoREV6Lr4bqKUeKH9ZBf+gvWV9XopqtvRSOzNZZ2bDDOtE9rYicR4gDQ7jN/TjebqM5+ADm47odDfyw7oKo5Es/msuaM8L3ZSlrETpDjY35KQinaEw+5AoQ8AIXdDFW9vhDzLtxIMcy4FWpvbsRDLYsl/mAIZ+49Z7POY8qlwC1LsTQJTuWr9jCw8SAEPt/jUIi8QbcSyIv87MUUaqOEroLlydceARzuoO9CTqFW+l4dwyyuvXHrNqd3LAuSwEOiQQ+Q2MBuqwmE0KrDAoWvBhjy5vjlmo5Te6V+oeKxuY+uFRf191ZzRpu4kUxbwtibZPD4zL7jCzmoGWy3lPu3MmCvPjQ7Za7L2zzdwX6T/ZJjDCUO6lXV6fnjq4FZI7/7cxv5qJ5Kxyx3nXZHY28zTXGuZUZLfjjmKwD72tbCm5zOi/KW0UptJITknm0QxIAjO62xiuPk8xHZORLS5jLS8oxHx+yxxKygjB0VylFbMbQFtcHs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(3023799003)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?y1SsUx+Fz5ApTNsK0r5D/5Hr5pRfml5vQb96R/hwWRgmOz7zyVo6wv1FVg?=
 =?iso-8859-1?Q?iZctdgssU0MXMOBWr2Np0NyitO/MSTAMkSp4xjgAfepntVinyfIeYrhXal?=
 =?iso-8859-1?Q?lP8AZCrCNrDNLZbwalh1MkrVQF0RIOc3MtdsOzLiRSnBeYBvlSwFXrW6Ep?=
 =?iso-8859-1?Q?YB26GhJoWm+3ttATwYSu4VYfKmeGXhwSODG2NEJoeDLctsytOPUyBRFL7U?=
 =?iso-8859-1?Q?hCqVnpW1qjdKfqY6jftGPBAttLTeF8ZUeG1gt8TRVsPgZkIWMy/9m3PDvX?=
 =?iso-8859-1?Q?0AgEb8YLRfo3sEfTynMeZg4TPfELUoCRB3XQbqUjGUu2UrvylbwHCtUDq0?=
 =?iso-8859-1?Q?krEBbD6k+9USnqQBzVUNQz1l7iWG0BbQ1mIAPqz9LSMFAZn40q3141rAeu?=
 =?iso-8859-1?Q?cYqIrhRcji0J5pKDBOFAjVyAB9qrYWiaqXOrwR+a/K7hDlZ9XqysM2yuUp?=
 =?iso-8859-1?Q?h6W4m2cAT6NWLilGmGsE1xMFvlIOPZf5Rm+uMsyeWtSsX1jUww4tPOpNVR?=
 =?iso-8859-1?Q?vN+eEfIS/qgUoah/WH68iZlnOWuwLy5Fj4dRIpIyCzB+TwSzIl4f8yczX1?=
 =?iso-8859-1?Q?sQsLnMyoVZClfIPyYgLn32ZIusu6C/RE2THf3+qbqzzCWfBAD7byqL7Fuf?=
 =?iso-8859-1?Q?cMHetaVaAmdxsZlttkU00aAtNK+FF8AC+HPGrNi5skTpTPOTRb/qXN2Jb5?=
 =?iso-8859-1?Q?DtQGnLjfyio7RN9rfsqFMH0NE+v78NunkZW2WcWr+Wkvz8dPbAjF/3bGri?=
 =?iso-8859-1?Q?c6+cx/mU8BNOfTHER4VoxOIAmIwV4YVBrN9rM4LVAGAA0x08Em+tjw1NzZ?=
 =?iso-8859-1?Q?vrWD3/LXVkk/EogURttF+yrk4ZLuGB5JeMT/y/uL6nv6OJR1qOh7+xTyGm?=
 =?iso-8859-1?Q?TifpFHIw6BSVi1e3lbXPmPDjirWGSjjWgucNIlvFwkZyYYuvUmRNyRKvxx?=
 =?iso-8859-1?Q?PK+hXf33dO/n2I7tsYJwcMsb1mTTwAnhAafBRJ91stYqyEHo1jKPE089Ai?=
 =?iso-8859-1?Q?RSg+qMvGU1SQqeDNnXyt2nR746Kirp41xFgOb9qcQn8iY4TEsO0yEzY7qU?=
 =?iso-8859-1?Q?LGUt94Mpc3Vd9GfisxAt85rU5oi4jINJIGjDTo0HO4KP1AEaQSGRpaJ0cr?=
 =?iso-8859-1?Q?aoqiLWPR9a0tS8IP9sYoExSUmfym0MDnRPjwzYFrBl3z7JlVw8dsuR1lhs?=
 =?iso-8859-1?Q?ToeOLCkTlH5oJapLbpwFGlqHiyXsQ+mv1TjQO7/s3GZyKMZ6oP6zH88VYh?=
 =?iso-8859-1?Q?f6AXlQjnICkPjNJvoDH2SzPUjfUFcjlZHAc93XqaVS/6tcL58QfcAFVjWG?=
 =?iso-8859-1?Q?NMtB0rXL55QBQt2/J91QWLxoyto3DeFkrqKOtSP7A5reJ3d2/fpJKDsse/?=
 =?iso-8859-1?Q?+zfKX1bDUtfiZ7futftjMgDs0ryMTyrgX8RHJUHeNeXxbUaRXmYacCZ3yz?=
 =?iso-8859-1?Q?xq4JAJ7+f9IlIBUsiWPRm6yViJqMWm+4y6ExoU71LmOOHaeuWDMcRgFhRy?=
 =?iso-8859-1?Q?duNPhUIzbE1Q2aZ/QghzNksKEYUkFnBmO1D5knXD3u7sHZpXo4KdaR62Ay?=
 =?iso-8859-1?Q?vyIM6ON3evRO3PJn+BhMg2RTYb5qEGvCUDNlV2gbH5qi7ba2K0Akmwhi+H?=
 =?iso-8859-1?Q?V6IHZqQ0SuyLPt5tQ3HlsCP9Qi5QI8rNLRuOpX7486zpbNBbH63BRyh1lC?=
 =?iso-8859-1?Q?FObKxwpNSSKrUYW47YpKayNx2u7aMJ+QC1gBUOfo3h8soG9gj6oBt5XMHM?=
 =?iso-8859-1?Q?GN9a0UTy0ZrSVaTacK6kgaxId5JCTktzW08IrOnZQ2MtJIcqiU4qL14sBi?=
 =?iso-8859-1?Q?9JtwzK/47Q=3D=3D?=
X-Exchange-RoutingPolicyChecked: k/wAnZFucTmzezfWyIgopaF0e6AmWHz+daeni1DQjz98LXEqa99S4dxAmHu8gcxgS0DJU1YAOslkcXNKkhTmH/r92fAXrrufg0yO8hbVPaDw/QQTriGX121P55kgSR1+3PSDB7wkvZWGnMVbV6nV/4DPDVberwpqDrjJ/wIcvmvcjq8PxdSg+6dPvNx3qigB03rGDR88qZeJV63ZqQyE81u/ZvLEcXNDImKnJxdcX1yBlKGSubTQQLdUbmWL+QvNsvonCFBo7SmcrX9w6yElXSFaGeGo/DMVTat7nGq44biPuJ5zwuNRikSdFwu5tIyO9ums8KpIeEgzV+DRHrVDCA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8074bf56-3b00-48e3-267b-08deac7d63cd
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 21:12:48.1126 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jBU9G2VXJ70uJK5mGNQ/LiwwjfsSJ9W1JRFZ3OCJlpbpEb4Fbg/KxZtC5DhUEDqHzS6PFl5Z7ums1nRXeSXXPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6939
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

On Fri, Mar 20, 2026 at 12:25:33AM -0700, Anoop, Vijay wrote:
> From: Anoop Vijay <anoop.c.vijay@intel.com>
> 
> Add FWCTL RPC handler for Xe System Controller firmware.
> 
> Implement xe_fw_ops to route FWCTL RPCs to System Controller mailbox,
> allowing userspace to issue System Controller commands via FWCTL.
> 
> Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile             |   1 +
>  drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h |  29 +++++
>  drivers/gpu/drm/xe/xe_fwctl.c           |  10 +-
>  drivers/gpu/drm/xe/xe_sysctrl_fwctl.c   | 136 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sysctrl_mailbox.c |  31 ++++++
>  drivers/gpu/drm/xe/xe_sysctrl_mailbox.h |   2 +
>  include/uapi/fwctl/xe.h                 |  25 ++++-
>  7 files changed, 231 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_fwctl.c
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 6d47d5d59cf4..f5d7109893c8 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -125,6 +125,7 @@ xe-y += xe_bb.o \
>  	xe_survivability_mode.o \
>  	xe_sync.o \
>  	xe_sysctrl.o \
> +	xe_sysctrl_fwctl.o \
>  	xe_sysctrl_mailbox.o \
>  	xe_tile.o \
>  	xe_tile_sysfs.o \
> diff --git a/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h b/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
> index 4cbde267ac44..b80e01e8ae37 100644
> --- a/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
> +++ b/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
> @@ -62,4 +62,33 @@ struct xe_sysctrl_app_msg_hdr {
>  #define APP_HDR_VERSION_MASK		GENMASK(23, 16)
>  #define APP_HDR_RESERVED_MASK		GENMASK(31, 24)
>  
> +/** System Controller FSP Runtime command group */
> +#define XE_SYSCTRL_GROUP_FSP_RUNTIME    0x31
> +
> +/*
> + * XE_SYSCTRL_CMD_GET_FEATURE_CFG - Query feature configuration
> + *
> + * Return platform feature capability and configuration state.
> + *
> + * Group: XE_SYSCTRL_GROUP_FSP_RUNTIME (0x31)
> + * Command: 0x10
> + */
> +#define XE_SYSCTRL_CMD_GET_FEATURE_CFG    0x10
> +
> +/**
> + * DOC: XE_SYSCTRL_CMD_GET_FEATURE_CFG response
> + *
> + * Returns 5 DWORDs:
> + *   DW0: Supported features
> + *   DW1: Enabled features
> + *   DW2: Software-configurable features
> + *   DW3: Pending state (effective after reboot)
> + *   DW4: Default (factory) state
> + *
> + * Each DWORD is a feature bitmap.
> + */
> +#define XE_SYSCTRL_GET_FEATURE_CFG_NUM_DWORDS    5
> +#define XE_SYSCTRL_GET_FEATURE_CFG_RESP_BYTES    \
> +	(XE_SYSCTRL_GET_FEATURE_CFG_NUM_DWORDS * sizeof(__u32))
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_fwctl.c b/drivers/gpu/drm/xe/xe_fwctl.c
> index 72124b5b3c87..2e8faa027487 100644
> --- a/drivers/gpu/drm/xe/xe_fwctl.c
> +++ b/drivers/gpu/drm/xe/xe_fwctl.c
> @@ -67,10 +67,12 @@
>  #include "xe_pm.h"
>  #include "xe_printk.h"
>  
> +extern const struct xe_fw_ops xe_sysctrl_fw_ops;
> +
>  DEFINE_FREE(xe_fwctl, struct xe_fwctl *, if (_T) fwctl_put(&_T->fwctl))
>  
>  static const struct xe_fw_ops *fw_ops_table[XE_FW_MAX] = {
> -	/* [XE_FW_...] = &ops, */
> +	[XE_FW_SYSCTRL] = &xe_sysctrl_fw_ops,
>  };
>  
>  static int xe_fwctl_uctx_open(struct fwctl_uctx *uctx)
> @@ -102,12 +104,16 @@ static void *xe_fwctl_info(struct fwctl_uctx *uctx, size_t *length)
>  					      fwctl);
>  	struct xe_device *xe = fwctl->xe;
>  	struct fwctl_info_xe *info;
> +	u32 fw_caps = 0;
>  
>  	info = kzalloc_obj(*info);
>  	if (!info)
>  		return ERR_PTR(-ENOMEM);
>  
> -	info->fw_caps = 0;
> +	if (xe->info.has_sysctrl && fw_ops_table[XE_FW_SYSCTRL])
> +		fw_caps |= BIT(XE_FWCTL_CAP_SYSCTRL);
> +
> +	info->fw_caps = fw_caps;
>  	info->platform = xe->info.platform;
>  
>  	*length = sizeof(*info);
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_fwctl.c b/drivers/gpu/drm/xe/xe_sysctrl_fwctl.c
> new file mode 100644
> index 000000000000..ebdbe6d1dfd8
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_fwctl.c
> @@ -0,0 +1,136 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +/**
> + * DOC: Xe System Controller FWCTL backend
> + *
> + * Implement FWCTL support for Xe System Controller firmware.
> + *
> + * Provide xe_fw_ops implementation to route FWCTL RPCs to System Controller
> + * mailbox using struct xe_sysctrl_rpc.
> + *
> + * validate_scope() enforces required access level for System Controller
> + * commands. rpc() executes mailbox transactions and returns responses to
> + * FWCTL core.
> + *
> + * See xe_fwctl.c for generic FWCTL documentation and userspace usage.
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/err.h>
> +#include <linux/vmalloc.h>
> +
> +#include <uapi/fwctl/xe.h>
> +
> +#include "abi/xe_sysctrl_abi.h"
> +#include "xe_device.h"
> +#include "xe_fwctl_types.h"
> +#include "xe_sysctrl.h"
> +#include "xe_sysctrl_mailbox.h"
> +#include "xe_sysctrl_mailbox_types.h"
> +#include "xe_printk.h"
> +
> +static bool xe_sysctrl_validate_scope(void *rpc_in, size_t in_len,
> +				      enum fwctl_rpc_scope scope)
> +{
> +	struct xe_sysctrl_rpc *req = rpc_in;
> +
> +	if (in_len < sizeof(*req))
> +		return false;
> +
> +	if (req->hdr.firmware_type != XE_FW_SYSCTRL)
> +		return false;
> +
> +	switch (req->group_id) {
> +	case XE_SYSCTRL_GROUP_FSP_RUNTIME:
> +		switch (req->command) {
> +		case XE_SYSCTRL_CMD_GET_FEATURE_CFG:
> +			return scope >= FWCTL_RPC_CONFIGURATION;

The validate scope needs to explicit validate bit by bit of the API.

> +		default:
> +			return false;
> +		}
> +
> +	default:
> +		return false;
> +	}
> +}
> +
> +static void *xe_sysctrl_rpc(struct xe_device *xe,
> +			    enum fwctl_rpc_scope scope,
> +			    void *rpc_in, size_t in_len,
> +			    size_t *out_len)
> +{
> +	struct xe_sysctrl_rpc *req = rpc_in;
> +	struct xe_sysctrl_mailbox_command cmd = {};
> +	size_t in_payload, out_payload = 0;
> +	size_t expected_resp_len, resp_size;
> +	int ret;
> +
> +	if (!xe->info.has_sysctrl)
> +		return ERR_PTR(-ENODEV);
> +
> +	if (in_len < sizeof(*req))
> +		return ERR_PTR(-EINVAL);
> +
> +	if (req->hdr.firmware_type != XE_FW_SYSCTRL)
> +		return ERR_PTR(-EBADMSG);
> +
> +	in_payload = in_len - sizeof(*req);
> +	if (in_payload > XE_SYSCTRL_MB_MAX_MESSAGE_SIZE)
> +		return ERR_PTR(-EMSGSIZE);
> +
> +	ret = xe_sysctrl_get_response_len(req->group_id, req->command,
> +					  req->version, in_payload,
> +					  &expected_resp_len);
> +	if (ret)
> +		return ERR_PTR(-EOPNOTSUPP);
> +
> +	if (expected_resp_len > XE_SYSCTRL_MB_MAX_MESSAGE_SIZE)
> +		return ERR_PTR(-EMSGSIZE);
> +
> +	resp_size = sizeof(*req) + expected_resp_len;
> +	if (*out_len < resp_size)
> +		return ERR_PTR(-EMSGSIZE);
> +
> +	struct xe_sysctrl_rpc *resp __free(kvfree) = kvzalloc(resp_size, GFP_KERNEL);
> +	if (!resp)
> +		return ERR_PTR(-ENOMEM);
> +
> +	cmd.header.data = cpu_to_le32(FIELD_PREP(APP_HDR_GROUP_ID_MASK, req->group_id) |
> +				      FIELD_PREP(APP_HDR_COMMAND_MASK, req->command) |
> +				      FIELD_PREP(APP_HDR_VERSION_MASK, req->version));
> +
> +	cmd.data_in = in_payload ? req->payload : NULL;
> +	cmd.data_in_len = in_payload;
> +
> +	cmd.data_out = expected_resp_len ? resp->payload : NULL;
> +	cmd.data_out_len = expected_resp_len;
> +
> +	ret = xe_sysctrl_send_command(&xe->sc, &cmd, &out_payload);
> +	if (ret) {
> +		xe_err(xe, "sysctrl fwctl RPC failed: group=0x%02x cmd=0x%02x err=%d\n",
> +		       req->group_id, req->command, ret);
> +		return ERR_PTR(ret);
> +	}
> +
> +	if (out_payload > expected_resp_len)
> +		return ERR_PTR(-EIO);
> +
> +	resp->hdr.firmware_type = XE_FW_SYSCTRL;
> +	resp->group_id = req->group_id;
> +	resp->command  = req->command;
> +	resp->version  = req->version;
> +	resp->reserved = 0;
> +
> +	*out_len = sizeof(*resp) + out_payload;
> +
> +	return no_free_ptr(resp);
> +}
> +
> +const struct xe_fw_ops xe_sysctrl_fw_ops = {
> +	.name = "sysctrl",
> +	.rpc = xe_sysctrl_rpc,
> +	.validate_scope = xe_sysctrl_validate_scope,
> +};
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> index b10c8b7e0c40..418ab672528f 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> @@ -293,6 +293,37 @@ static int sysctrl_send_command(struct xe_sysctrl *sc,
>  	return 0;
>  }
>  
> +/**
> + * xe_sysctrl_get_response_len - Get expected response length for a command
> + * @group_id: Command group ID
> + * @command: Command ID
> + * @version: Command version
> + * @in_len: Input payload length
> + * @out_len: Pointer to store expected output length
> + *
> + * Returns: 0 on success, -EOPNOTSUPP if command is unknown
> + */
> +int xe_sysctrl_get_response_len(u8 group_id, u8 command, u8 version,
> +				size_t in_len, size_t *out_len)
> +{
> +	(void)version;
> +	(void)in_len;
> +
> +	switch (group_id) {
> +	case XE_SYSCTRL_GROUP_FSP_RUNTIME:
> +		switch (command) {
> +		case XE_SYSCTRL_CMD_GET_FEATURE_CFG:
> +			*out_len = XE_SYSCTRL_GET_FEATURE_CFG_RESP_BYTES;
> +			return 0;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
>  /**
>   * xe_sysctrl_mailbox_init - Initialize System Controller mailbox interface
>   * @sc: System controller structure
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> index 91460be9e22c..f219ad738b81 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> @@ -23,6 +23,8 @@ struct xe_sysctrl_mailbox_command;
>  #define XE_SYSCTRL_APP_HDR_VERSION(hdr) \
>  	FIELD_GET(APP_HDR_VERSION_MASK, le32_to_cpu((hdr)->data))
>  
> +int xe_sysctrl_get_response_len(u8 group_id, u8 command, u8 version,
> +				size_t in_len, size_t *out_len);
>  void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc);
>  int xe_sysctrl_send_command(struct xe_sysctrl *sc,
>  			    struct xe_sysctrl_mailbox_command *cmd,
> diff --git a/include/uapi/fwctl/xe.h b/include/uapi/fwctl/xe.h
> index 3720f188a7ec..2a1e559f94f2 100644
> --- a/include/uapi/fwctl/xe.h
> +++ b/include/uapi/fwctl/xe.h
> @@ -16,8 +16,13 @@
>   * through the kernel FWCTL framework.
>   */
>  
> +enum xe_fwctl_capabilities {
> +	XE_FWCTL_CAP_SYSCTRL = 0,
> +};
> +
>  enum xe_firmware_type {
> -	XE_FW_MAX = 1,
> +	XE_FW_SYSCTRL = 0,
> +	XE_FW_MAX,
>  };
>  
>  /**
> @@ -39,4 +44,22 @@ struct fwctl_rpc_xe {
>  	__u32 firmware_type;
>  };
>  
> +/**
> + * struct xe_sysctrl_rpc - System Controller RPC
> + * @hdr: Common Xe RPC header (firmware_type = XE_FW_SYSCTRL)
> + * @group_id: Command group identifier
> + * @command: Command code
> + * @version: Command version
> + * @reserved: Reserved for alignment, must be 0
> + * @payload: Variable-length command-specific payload
> + */
> +struct xe_sysctrl_rpc {
> +	struct fwctl_rpc_xe hdr;
> +	__u8 group_id;
> +	__u8 command;
> +	__u8 version;
> +	__u8 reserved;
> +	__u8 payload[];
> +};
> +
>  #endif
> -- 
> 2.43.0
> 

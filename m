Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E53C4167D
	for <intel-xe@archiver.kernel.org>; Mon, 13 Nov 2023 20:14:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4132110E413;
	Mon, 13 Nov 2023 20:14:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48EC710E413
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Nov 2023 20:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699906496; x=1731442496;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UXaUa7f1uCN83eU9osqnxumsIgWvkN+FRdTJvK6AUAg=;
 b=WlJCTDmHOMOAXGcFo2XcTaiImK5TRSMxkchy9vQ+fTdJLWyHMIYJ/UKx
 SRufAepReKvSOD0YjgxAekeMLJRAQ+a+/dV9xl1+Hl+yG4jd0FK6yY56S
 GFqTBIEo3aVou8CiVcIp9x5NnTFxyrf/sw+B1qkzFNiyy0Jri3CB3E7Xh
 zPS4xHRpSMkE287wFmnCCBmKsSsSnTYpzdeXvjfkI+Su6Z9ggHqRVjIAA
 CoDTODFx9wKOHDbHbs1Ssnv2JHtTEEZvpFpIKAJJnwTPRr71sLuZAZaIy
 enR6JrgcDp9DN7+NApfZVi8jwYjeOmUGJ5y7KHiH9bPmFag4eXnv3d+x9 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="12056664"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="12056664"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 12:14:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="12559587"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Nov 2023 12:14:55 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 12:14:54 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 13 Nov 2023 12:14:54 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 13 Nov 2023 12:14:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Md3J8i5QhvViAHAbvLQ+8r7n1tCrzmNP9qRc8SQc3WvN+IjDlXrGYkCwJ1AwOZPT0jOWbrz5nOdFIG2SfhIJ3MySHbOcZcE3D5+VRf2efjyaZ/VvgP7Gr421EMUSYiR/MQh0cvtdIM8mMca/pmPhSEg+sFLk8YUtQa4mOYdeaPC0RupDtaz9zOL+WVT7y/p78tvM18LgQFn1u/9Y/BeFMrb5jg2m3d54SGGGf20oXGRYwOmXdl+hfF8ynUwly92zPbg7qrXR73BiKi7/morv2EO7KupMXwOYfvnXWa5cIbaILjRI8s4cAqdtpf0qX4wPhf8z0JLI+xjrK3hukBNFDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g2iOCtIQhh1yiszJCxfFspAychsZKF6hKRjvfY8J910=;
 b=TnhSM3UpaMglz8PDHlFCoOTajEhzuYnpptDeXtLITaX0+i+i7Jz/HVTlEr/o+A5uo/JHgLcL+95Ukz3ZjR5EROU5DLxn4oXqOVsX7PbcAAxqM0jYUs1ERNgi4/mEHQ2q/r6pqb7L0ktGhFnyVed5NfKyU7itRSYNUJClmWXpVGtFWqjOnpLv0JXPdTSPvhRGHHkeB88cphs2TRtxsrLO5nKcObQyWqsYcwfvbh8PlvQJyRtGngFmQ2x/NZT0k8dEXIPq1frmMpFBxzZyVO7RGn6kEemzMLUpRpjHKcfGSfauD9n0+mfB6QdZH04YKYv5JAfR4OSBbOHzpnt291XoWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7854.namprd11.prod.outlook.com (2603:10b6:208:3f6::5)
 by DS0PR11MB6472.namprd11.prod.outlook.com (2603:10b6:8:c0::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.31; Mon, 13 Nov 2023 20:14:52 +0000
Received: from IA1PR11MB7854.namprd11.prod.outlook.com
 ([fe80::929d:7372:b3aa:2541]) by IA1PR11MB7854.namprd11.prod.outlook.com
 ([fe80::929d:7372:b3aa:2541%5]) with mapi id 15.20.6977.026; Mon, 13 Nov 2023
 20:14:52 +0000
Date: Mon, 13 Nov 2023 12:14:49 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <20231113201415.GV5757@mdroper-desk1.amr.corp.intel.com>
References: <20231110102518.3130411-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231110102518.3130411-1-tejas.upadhyay@intel.com>
X-ClientProxiedBy: BY5PR13CA0029.namprd13.prod.outlook.com
 (2603:10b6:a03:180::42) To IA1PR11MB7854.namprd11.prod.outlook.com
 (2603:10b6:208:3f6::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7854:EE_|DS0PR11MB6472:EE_
X-MS-Office365-Filtering-Correlation-Id: 9215bf12-0bd4-43bd-e327-08dbe48531c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6hJCstVaOKTQRb00JBkY2JeiKxBoyWs6GXba84UiAKHG2JwPzDisTxjlQqoAv/nbn3ZvU/ddKyYyAvBRPyKXwzSGSayYs7sLo4KbS9cElo9adByEfBbGst0O2I64mY7fB6E9hY2nLJCrnSvF1pw7O85ISN4v5jQks2M3uBXuSmDLw/hHdRyBJjE0SlxzlMUC6GkJLU1+AmX7YFccgKmbXfNVKaqWyfq3F1wLMIs1WQiNXpprw1pGI/rtp3Pn8LveqOHqcgX8cQ/Y46XkeyYKAgHZZ2ZGxoaCp9BMVg5kNqI5mSko/amxAHpBgeVARVGrlWh5+Qgoy+da6Fdsd6436zPukyNSLipiqnHdUxH7Vjk79eGYhLhwPStjUYqFR/ubEltHXBgMVWQk/brcE58G0fhlzqqC7ojCEwawlTGkLjsNGH4HSrdQGeLhn1Sy+tylHdS2UkOtRHYMVz+FxN3P7t1UFX7i0VdWaIgjKIoUkbnqYKRRCjBAR5nlip1iJ0DKWOuiRfMitIsQ6QtgcZmIXaA17vOwVue1XSgveGN2oCb9Aoo7fdWQDp/l14bB7Xg2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(366004)(376002)(396003)(346002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(1076003)(26005)(6506007)(6666004)(6512007)(83380400001)(5660300002)(6862004)(8676002)(8936002)(41300700001)(4326008)(2906002)(6486002)(478600001)(6636002)(66556008)(66476007)(66946007)(316002)(82960400001)(86362001)(33656002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0sNN3rEycDcYOporuIE2j+/s8U6+12zfmk06ZZRgnIA8jL4T/AWKVnJuOAOz?=
 =?us-ascii?Q?9u0s70gtlTF4HyucwqNmcYo8aJOJebxE+3DSCu2uxQNvoMowyXgpG7ohI4gP?=
 =?us-ascii?Q?37n71pH2uCcv1NUdJalG6/Gyb9nyelm8D5toKp1VzX/G87BgAhtzIcbkwjvd?=
 =?us-ascii?Q?eIjcij6QAUwsdml5jK6js1mNSmJ4mTmSV4rn47QwW0nqckCM6z/8RJ/7GkKq?=
 =?us-ascii?Q?5dQDC521C+9RK2HwnD7g+9jCnSnXzwfN4LaS6mb2NVpncqnOP7xAn9g/r2mq?=
 =?us-ascii?Q?Hy93KeIbXcw7JPazNt3QY3UcJWs4IAIXxJ072ZT4XxVa0IUpodBCzoxaWqpn?=
 =?us-ascii?Q?PeGdrrCMc6hWxLfhyQxuXj+XvnUIDoJZAKM1N/2pN3MV7snrMURtGOg2xKYR?=
 =?us-ascii?Q?oum7ZIiHsoBFpvq2pAhh4CvApV3bzBEGrV5eD+XbjCBGeXGN3aEis96eqNWC?=
 =?us-ascii?Q?j0NZZ9TMH0HmIsb4vfzWcrCwNqVKpVNFc1k3v3UkPmCN+Fyh1iwg0PPvyVIS?=
 =?us-ascii?Q?2FyC4YwCJBNb59uOCbaeIxkS7IAIp7VbXynV3NrIYFj+Xipw0LQUSay0Shrk?=
 =?us-ascii?Q?BOwieja+xm6+KMtZ2P6ZRDZk8Z3zCbAxwQV9nhJ7zlRHJL3749x9JsAOK9Mt?=
 =?us-ascii?Q?c6O6vRkrjscK5xEqKpQy6uk55dNnp8akB4kTm1A0VERjLPF5EfvFrPlXd4ci?=
 =?us-ascii?Q?f1tes1pJ5Cosc/rI/VI9abUNqKGBvDqapcTFVpHpEt06AT8wZzNZQaNcXznF?=
 =?us-ascii?Q?Kkyxgu/9F1na3SnyV5ASV+mJYLmHIsj1OJaZngt0LWERV25pwE9YiTNpi3VP?=
 =?us-ascii?Q?va6L9DoJIv93p3az656HgZmjGd/UZsCLX3QuYkY9YbydTZH1GV9C9OlOO0HG?=
 =?us-ascii?Q?NO0754CTeSG2C/bc11QBnrlGmwMHkSJNoQz1gXUwJ650ZBS8geaMU/8n227j?=
 =?us-ascii?Q?sAyBSnEOaOfLO45JI05VQTf/P7Q1nkVANRus8XB1aeUJah3gzbgMlcQcQ+c0?=
 =?us-ascii?Q?xvQOI3hnsES6ity4pLMlwU5CC+8vDMFUTrdaiW1TIQSOctjJ5VRBqbQowOvL?=
 =?us-ascii?Q?kIwCxHmlrm7jTZHqEQASVdumsoPZLf60gryAgdIokkdoELQT/2VyI5G+f7vi?=
 =?us-ascii?Q?rGoThWlUql2g9MX8KmkO0ejJuPSrNz/6AAwTBEkj5NIcB8jcpBQCIgaoPnzg?=
 =?us-ascii?Q?SAJ5xwxKS5p6rD+21xGCEAJjtkjQGP4zoN1uY5djjaj+OvRazZLRSvOuMPSJ?=
 =?us-ascii?Q?07asVNOIFVRkk6mV/rfk5vscwI3hDffw+BUGT2CJVkMUofEVXxbq0zOcn7Vj?=
 =?us-ascii?Q?FlvSBWhPe8EMQhCDBqKa/XPybA16JOkAqvGbH9CL+ng6HHleJ7bCdeOpiK30?=
 =?us-ascii?Q?NUJc/rEFCnln8V9FJTooctK2sYOz3iUh2ngHWTCFgOlvcgsP4nPvW/CTd2Uc?=
 =?us-ascii?Q?bDubVoRvbEwJFLE0n7qz8eWMd9DFrwp8Wpr7y2UC9Ka6AtyrZRC6isjYjWzJ?=
 =?us-ascii?Q?t2el+QnJUn7TCRK0FLrQYspKLy0YZnOccFE5WqRrTlqecpvEZHDnC+vimQwr?=
 =?us-ascii?Q?5I4dFVa3vxZ3sV2A6/4nrbtL7qbxH/W7HR0lr5HwBYI26UUieWtPKcqFUlWc?=
 =?us-ascii?Q?ng=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9215bf12-0bd4-43bd-e327-08dbe48531c4
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 20:14:52.1504 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RM2uwWkC9jZpDztRuiXqXWaa6Wupd+gGDDp9jlV4gZzDbrgAxmFrzWFjoP1KL11gPbtSgBn7jn9bkywMrpcQlEbNtz4r93f/JJXxtW7xCEw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6472
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/xe2: Add workaround 14019449301
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

On Fri, Nov 10, 2023 at 03:55:18PM +0530, Tejas Upadhyay wrote:
> This workaround applies to Xe2_LPM media-15, stepping-A0
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 3 +++
>  drivers/gpu/drm/xe/xe_wa.c           | 7 +++++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 902c60543de0..cac6e9e3098c 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -446,6 +446,9 @@
>  #define XEHPC_BCS5_BCS6_INTR_MASK		XE_REG(0x190118)
>  #define XEHPC_BCS7_BCS8_INTR_MASK		XE_REG(0x19011c)
>  
> +#define XEHP_HRS_UNIT_LEVEL_CLKGATE		XE_REG(0x1c3f08)

This isn't the name of the register.  HRSunit clock gating is just one
single bit within the register.  You should name this with the same
convention as all the other vd clock gating registers.  Also, you've
provided only one specific offset here that applies to VD0.  You need to
make this parameterized engine register based on engine base.

> +#define HRSUNIT_CLKGATE_DIS			REG_BIT(5)
> +
>  #define PVC_GT0_PACKAGE_ENERGY_STATUS		XE_REG(0x281004)
>  #define PVC_GT0_PACKAGE_RAPL_LIMIT		XE_REG(0x281008)
>  #define PVC_GT0_PACKAGE_POWER_SKU_UNIT		XE_REG(0x281068)
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index d03e6674519f..5040d3841125 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -259,6 +259,13 @@ static const struct xe_rtp_entry_sr gt_was[] = {
>  	  XE_RTP_ACTIONS(SET(XELPMP_SQCNT1, ENFORCE_RAR))
>  	},
>  
> +	/* Xe2_LPM */
> +
> +	{ XE_RTP_NAME("14019449301"),
> +	  XE_RTP_RULES(MEDIA_VERSION(1500), MEDIA_STEP(A0, B0)),

There's no such thing as media version 15; Xe2_LPM is version 20.00.
And the bounds here don't match the workaround database either; this is
listed as being a permanent workaround, not one that goes away with B0
stepping.


Matt

> +	  XE_RTP_ACTIONS(SET(XEHP_HRS_UNIT_LEVEL_CLKGATE, HRSUNIT_CLKGATE_DIS))
> +	},
> +
>  	/* Xe2_LPG */
>  
>  	{ XE_RTP_NAME("16020975621"),
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

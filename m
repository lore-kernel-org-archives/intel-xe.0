Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5CD0C0015E
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 19:33:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A61DD10E4B4;
	Wed, 26 Jul 2023 19:33:21 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5424310E4B4
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 19:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690399999; x=1721935999;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FM9bS/pvMW7BcXmjJIY2n8pbcZCixGQjgdQ1RVvj6Ho=;
 b=QbwguIlA4AjM87tOCACaxkwPjEbA8s44nYWdZQtCH+5kJlXY1k6WDwzL
 LBPrb2F7bCzhkwtcdSMiS4aG4PWeHiLT9XUqJHyXnt+NUHCm+9eypCsIw
 OzY6PZV55HSaXGwksdYOiPVmvVjOhMHlAw4M6cPLmQHKp6KT7ahGMYTjY
 aSLygZV/IzshPyR8fey1j0HbOC4VjZrz/Ek44EnVLvqj0P+YOs7zGR8eG
 PS5jesN9XSeTodVzx6CjreBaP3TwGlQR760I7+Uu+iN52e2ucamQHsGxT
 6GMIMxMO/0b8Wy9g+nVJDusq3q+WIwF+IyeNelF2VW3QkO6MuC9s4ShQw g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="366991152"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="366991152"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 12:33:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="676822839"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="676822839"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP; 26 Jul 2023 12:33:18 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 12:33:18 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 12:33:17 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 26 Jul 2023 12:33:17 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 26 Jul 2023 12:33:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lG2UgetxI0DahRbsovbh3OkJ77zYGrqAa0TDfTpCYPBQWfAP1Z24hCHUOyhArhRUEuRKtzVlsDojYdujjnSWN8YsxR+V+173glVJtc+ajT9c3GRcQBTJiTP4oQ0Kw4MYdBv19vIRZ7F/paesmp1yjQbEY3dcAdNlLlPJKF0Xpbag30j51quMc6Bb1u7G+pCwkHUQ19lOcv7pFctzw3Sft3aQXztNIQXvOJ2ozs393T9qcaFquPsn3wd1jmGX7Iuv7FAVIajoLV/D8/4SBxBLSNxAwcbb3UbEj06W00Yy9YzZKyB9osQGUlXRz1repckS3Og9/py+UOYuOV/HwgsjQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MaId8P4DVJjk2GhbCF+G35J60ti4m2kwhYCcGWGl4Ao=;
 b=FGIwO664aQNWurpoRERjFvOdTNhc696vcs561AXO9Qw527fky7yZcYy5Q1fTHoqA8kG9FWsQflUWkyuS0PPXiOY/hYlvg+kiSu+Euvs0JVOtCJVTSYmU+LE/0ADbByOq1snGGn40IzaOgkvqRAEvY0HN6A1+HNiUkL3Ofwdm4XHA/awyQN4dXSTEMVvovkNmqgJ/AlzH5aBzwPxgg7/e9Pa6+lij3HEfGXkkAZhj9/K5HJ7MrwRzOydDZpyUOmWyCzGJ65cBOG6jNX0MsCr5FJBiUm/cLZ6YmANe1d6ANeTjr0owEGNx1ctfi0SyqZjttFcwaSNHOLgARiHDJUAm4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB7432.namprd11.prod.outlook.com (2603:10b6:510:272::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Wed, 26 Jul
 2023 19:33:16 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0%3]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 19:33:16 +0000
Date: Wed, 26 Jul 2023 19:32:31 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <ZMF0z80EUoiZ/xeC@DUT025-TGLU.fm.intel.com>
References: <20230726192520.383531-1-rodrigo.vivi@intel.com>
 <20230726192520.383531-2-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230726192520.383531-2-rodrigo.vivi@intel.com>
X-ClientProxiedBy: BYAPR02CA0060.namprd02.prod.outlook.com
 (2603:10b6:a03:54::37) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB7432:EE_
X-MS-Office365-Filtering-Correlation-Id: 7653571a-fd8f-4d83-05fc-08db8e0f28a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fJmGiY5OKYCv2NRi5YosUymHDft7dqoBCMG6bW3K/XfmCyXzMTabbhEfQNVGHKAhg4YHCqP003lJO7SJypv/mgKQNHxhU9cK7TYawBMyOgcuJ6jRtBz0/KAKxUL5BdbL5q+SZ+suDIiTGKUzUziKMDOkFUv466/5Ok5OXXZTY7kPWeEiubNX9/mCoCJ/ZUex6VgV9+V4n9Ao9AdXUqTbt5XSg/kmjnJKiY3yNW9nS2eVJ3vYeL8+Rer6S7MOlt3VTxEDRyAvAUH8N3fl6d5hRsgwEbC9lmfPXXHsVUZ0xhrek9pkatF0ldteqhY38ul7Cg3WV4O0o3SX1FPuw/K6zoiQsv9N0xrR9y4ex+qbxM6efJP0D4+eVS2frNkbZURuzhKIXHkg8fLhxo08EUWRvIKQEn+KsPOnDWqB8fHd+7lE6ZNtvk0m9XRs44WRuv0s/GCvydvcDdoRmciYgqY40z9QwhZEZgV8JS4K9Zfw2Qfy3DpgPZu3qb4QC8HsvQS+f/72Kzx0GMNHkEZVFrOxyuoLmfbqE/RAS7i+7ikajTX7LtWLOzrQIHdU/hAsBEkb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(136003)(366004)(396003)(39860400002)(451199021)(6666004)(38100700002)(6512007)(478600001)(6486002)(316002)(8676002)(41300700001)(6862004)(5660300002)(82960400001)(8936002)(6636002)(4326008)(66946007)(66476007)(66556008)(83380400001)(186003)(6506007)(26005)(44832011)(86362001)(15650500001)(2906002)(4744005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZJYwZevlPAoNMPTzx9FtuMbwoDSiteB2FFi2rxbM6oRpGgoVGvipDBZ8S+P8?=
 =?us-ascii?Q?KpMJ5wPhY0OtvXyea7D99Ru/6Voub8HCkoa4IS0iVY2eCi34BqouoAc70O7v?=
 =?us-ascii?Q?mFndZeM7mbdNwbcO1Sq+409qD1lvb3ezn3O5/3eguJiHZHZyI0QdsCg6Ev5W?=
 =?us-ascii?Q?cyo9W3YbEA95qvY5mboG7hWK9G1OysXzueE1ofQIjkNOFdvwDrDBmqo+hFU5?=
 =?us-ascii?Q?EGZj6Pfv63QYz8yjHk1S4BvkHmHBW3HVdyoovqEX0C5gTYZYdO6D/GjsMYIw?=
 =?us-ascii?Q?xoFPSZSXGMG1n85SDzwtiMChPErTtxh7PSAmD+6Zcdyi6GPmpUYZBqLP9ubX?=
 =?us-ascii?Q?JUIWtNoZ97n11vYQ38sc40O42M2Qx6A+nnQld4OE7fO6sPolAbLf7cOpT/23?=
 =?us-ascii?Q?gqQrl+ZixBLXdRR0AnK0ziJYxMb9vzM3xYHF21uLYZ5+rBW+NX+s/8eubpoI?=
 =?us-ascii?Q?MubIW6fl/ohtVh/YykGx/PrsRs+wLbWZqPhbdvF/jMyH2DOqjHjahv828Y6i?=
 =?us-ascii?Q?zqbr1IxD+tYkptM/iMaVQ5RxaBCsv/+U3E4u9Dg6Uja3V4LXzNVq3AtQrIYS?=
 =?us-ascii?Q?cNT6SC74d5f/utpBWgx0S+w3SMKxrSYde9RkCm1ZApIZGt6IA8KS/Mj4YLlg?=
 =?us-ascii?Q?6JsKf0uNJD/jkAy7bogV0JHDmu3BBi97IggKr9GqtlL21hrIfmn10veC8LL2?=
 =?us-ascii?Q?4oq4jfqh+WSioxz1BnqH0loOVmVB0cceWzjmLwmuUFkD5IcTTrZRvdI7PInS?=
 =?us-ascii?Q?kCOgFj0dnTq61aH0fmGYI0uB4Lwgkp5bZCrWJNav0fO8IMxPC/jtqvuJP/bA?=
 =?us-ascii?Q?oT7v6qftJSc1SCrLKn705osSRmsJfOYPIrVtGM/RmF6U0G7YE6DNnfcnfFJ7?=
 =?us-ascii?Q?Fa3AslBDBKdfMVhK9QATrb4W1zVCWmoVjfclexcdwUApMVAw8WGZzEOGP0rE?=
 =?us-ascii?Q?Emji7IekNwn1nkvvDVxgh0mw9pB9ES3MvvbWlJ/nCujaXXwakOd3Q17GnWJ/?=
 =?us-ascii?Q?5hrmiYC7aWaDfT+0ufmXZYnrEmehLu1R6lENlzLnxV6jsZzdplygsngBqzWa?=
 =?us-ascii?Q?lZ9c4kw4+oa1oYiXBY9eRQ6HVG2LcfQ/QdE5yRgTVpPZ/+/dqan2SjiI1HqG?=
 =?us-ascii?Q?zgAoKCvB7SAvyEv0brvOP/gtUPpZNaRtv6VtWO29UkVmulrEZGa/lktXwAXH?=
 =?us-ascii?Q?LhaQUsnb2jOZxf28JlMHwjfKMLugCVD39h3zNu6UI2p1DAfTnct6Ol6uSRaB?=
 =?us-ascii?Q?Uu4wOzbam27zchtEbXO0HWqbdEr46EM5+aL/poWVw+HN5MNgq75oI0OzJNRk?=
 =?us-ascii?Q?oNO1Z0iYVTeMP9krsCj7i/QQ/FTTgxLMXqcpk9gNa1BjSnWEl3PDATW4jN6a?=
 =?us-ascii?Q?K8+xFMpHnqgNts038NLDzkJfHXUIgr3LrUSQ7Q1zhhz8qkFRu+nEPl/RiRbs?=
 =?us-ascii?Q?qGX6fd2dDGXQNJHaTt2wlcOqCM7iIro9zaPBpfPGfsJPqN8LqdkBF7vfTIFX?=
 =?us-ascii?Q?k5a7GsJLaVEb4XrdfaumssvH94usYwrCJadUkUrfPM7y5Xul/KIvb9cz8ZtH?=
 =?us-ascii?Q?tVA1x8p8ZWUjnIX1EIe48IhO1RH5bnTGXtoMYQbC9fSGsQbPL2jeS0IC+ZnU?=
 =?us-ascii?Q?HQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7653571a-fd8f-4d83-05fc-08db8e0f28a0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 19:33:16.1126 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4jXyKbnS8knJ/oFJQWWNl4DNiygbrLtSj9OTky+eHJIZn9l/E93fMR9rl2cH9oh3YtqROTEzK4m3KsPO3CClWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7432
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Update DRIVER_DATE to 20230726
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

On Wed, Jul 26, 2023 at 03:25:20PM -0400, Rodrigo Vivi wrote:
> It is time to update the long and forgotten initial driver date.
> 

That old date is way off, AFAIK this date is long prior to Xe
development starting.

Anyways:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_drv.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_drv.h b/drivers/gpu/drm/xe/xe_drv.h
> index d45b71426cc8..dd1a421cd4f2 100644
> --- a/drivers/gpu/drm/xe/xe_drv.h
> +++ b/drivers/gpu/drm/xe/xe_drv.h
> @@ -10,7 +10,7 @@
>  
>  #define DRIVER_NAME		"xe"
>  #define DRIVER_DESC		"Intel Xe Graphics"
> -#define DRIVER_DATE		"20201103"
> +#define DRIVER_DATE		"20230726"
>  
>  /* Interface history:
>   *
> -- 
> 2.41.0
> 

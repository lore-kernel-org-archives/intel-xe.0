Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F6FCDB474
	for <intel-xe@archiver.kernel.org>; Fri, 20 Oct 2023 08:28:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BEA910E082;
	Fri, 20 Oct 2023 08:28:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6502D10E082
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Oct 2023 08:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697790498; x=1729326498;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MSPHchZl3zIPEJLXS4e2R9D9iig6wjO3mnLL+kiSPNg=;
 b=B8Me74WyqF+msi37igizpq/ZStZjLvqWbTGDZ39sTWo1XojvGZ9UVgBt
 3qRJzaUFhk75cZUBrqoXbjK/aNa7sgJz/ocThkdY2mIfjmUB22dU4P/Kh
 3ye33nDDaECxJPwkV2XWBCFVRWAauXka4PiOa0SMexhA0AqF5xD58YOek
 1p5cZxv3RAO0TU63FjGafdAY7UjQY0nIORYLFChDsj9Q2kbRTaG9uuN+Q
 two880pJTTX3o5U/VFgNqgo2oGizeoef9j7j5h3AndY4sVHpHsR0ZHQ2T
 MTqPJtYMj9hYSX/rlicmTNH0NhCZroQZvRF/yY3t0ORskfzHY/Otadvdb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="365793674"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="365793674"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 01:28:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="1004531730"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="1004531730"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Oct 2023 01:28:17 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 20 Oct 2023 01:28:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 20 Oct 2023 01:28:16 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 20 Oct 2023 01:28:16 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 20 Oct 2023 01:28:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZMuYZDxT58JtHh6SIJemrOrheKgTn5k1vLYKjtGBgJZ9DNLwRgveF/j3DxE5NNrom27SVx2CIH46G1MGXprYFaubsqJooCPXFSeuv98rNah2DhDqbo+PtFGF6d3Sh9T9YBfY1KdjeQmPzr83iO5cGJFMX5eQp9i9+ab5treDh9aJGucFh6T2jFTGKPNUNA5g3x/z1LOdJCPSwtADBPVLpIJSvrkb/s4RDuYTMDLR4uhHPLGLJDHv1q1iOAAGH981xZvkiUhDky5yDM475+73q2lwrkbISliKJ8ebIlMRY4xPTpFwGhRJiU9tkdP6IQyWxJg9f7EZLbyD/nqRu4cjRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Khc4AAK+AjDmrU4jGEtCUFgU9eNFf5iwGb5trkAmA9o=;
 b=N/AqQlFhfyLTI5k2vKHi1oqM/ysqJKNV8GbYJQBxvTAymvjCjYf2/x8RXpA6EGAJMOtQXsrKFJELt51Vp9VMCwymk+EJpHtpC78GyvH3QmcNyyGqwG0CEyujb8R+VYlJ5B1IHrXNodV/CySZn/xszNqAYMGHLxR3zQ4R4qgsNvDOp9nvg890iFkR0UIW/QeMW8qbNCb2vi5KmtqwH4tKQlfvErtPF4GBvSXFFaY3WZXFfmDndRgFEcF+FwpXwH3DjkBpWwM2bZgTPTMcn7/GT6svOzRbD6N2GBwiizUPbwC7rdz5rm7vdMBrvlpOkxxG/xhtRJWtgegz45KlqYEorg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SJ2PR11MB7518.namprd11.prod.outlook.com (2603:10b6:a03:4c5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Fri, 20 Oct
 2023 08:28:10 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5772:f514:b746:5723]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5772:f514:b746:5723%5]) with mapi id 15.20.6907.022; Fri, 20 Oct 2023
 08:28:09 +0000
Date: Fri, 20 Oct 2023 10:28:03 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Message-ID: <ZTI6E25lQ_r-j4Dt@fdugast-desk.home>
References: <20231020073430.103493-1-mauro.chehab@linux.intel.com>
 <20231020073430.103493-2-mauro.chehab@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231020073430.103493-2-mauro.chehab@linux.intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DU2PR04CA0264.eurprd04.prod.outlook.com
 (2603:10a6:10:28e::29) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SJ2PR11MB7518:EE_
X-MS-Office365-Filtering-Correlation-Id: 30996f0a-0e5e-4513-3eed-08dbd1467db5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: klA44x5nL5hxXmeL1BBhThThum1OQZ3T9jIhMrMKAZkKei0RDnakBZie1clhI7Qox5tDCLa/00Z3j35ODiy/ZwGIXmPRuMqHIBml7Jk+EmMTJpIrf6I4rxGEMuG0V1E6r0eHXLq3bjvWdkZz8ZONrkhThJkX3k9muha92Kokcvp3ECYBbxex4/AeFV9H4lT5aruDIAT7k65Vr1n8GH8/QrpQ88rzKl4+9ZkNZpgh6VL5DOkqO0CK+x1o3cMTMOyv50JJiW8sGJaWbrnK+E3Yqf33TyEcjrzkVHEx2RldOirJ3ai4E50nMTnSuwfLFuT5Q/ncQRpfPAgy9pOxcUKwvWdqRk15PoMoMogbvRUsfDsIc76VjdMe31/h2BKbz/q2mHs+/+xU3oe8QqxVU/KTkfn7AUqpdexGhzMSI2R5+RTWdKAIqx8ecx3FIKmnF0Fk3oMsfOFo4UP6AyLSH6j3REj4GRLDq4siBFhhqyOPnFIuLfWvigink+kyPqhaGIgGaLf7x0nzP2OUi2jOrqY8ZxX244GozeTJOOvTAj5npOo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(346002)(39860400002)(396003)(376002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(478600001)(6486002)(966005)(44832011)(6512007)(6666004)(6506007)(9686003)(36916002)(6916009)(316002)(5660300002)(66476007)(66946007)(66556008)(83380400001)(82960400001)(2906002)(26005)(36756003)(41300700001)(8676002)(4326008)(38100700002)(8936002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bWWDuc/H4sURxp0N06gCBcRsQ9GMDk3ZR4AxyxqXzZeQF/W6jBNKb36oQPKw?=
 =?us-ascii?Q?gxmomZ638xrdbo5iEVJFNRp6ldJ/D6XpsdsxTCmu0/ShjFWrOQk0fytwBKyH?=
 =?us-ascii?Q?dIHRHkFqZ3TNGLKEyTnCQ7uBVUmwfnZSOnI+PynZgel6tryoRdHn/v/vizj/?=
 =?us-ascii?Q?pd2rjvN53nMczrjHIZXQMziVxnH5VPSJ2AdQ3TKQNLVj6KhPMgw6PS5/OuCk?=
 =?us-ascii?Q?fTAQsQTJTdM8rO7nggve1wxmO2XUqeGSmcP7fziypU3zKyJZ7DwKv7Gyg+SN?=
 =?us-ascii?Q?FYUsiC4n11IsanGV8BH4gXP0+k8ruTJRgDxPIkuE8NmJLkbd2bBln1b3xDac?=
 =?us-ascii?Q?xcpzFTApigpYoeBlOX+xtOoqt/rn3FvSF4YPXJZeoTryAJVl3yh9RGHwWlGl?=
 =?us-ascii?Q?6AQ0RASVlv+xYhHKrjTc+pFAKcAQLr/dRng18kxvmjOPcYQ6CBLOyn7jA224?=
 =?us-ascii?Q?W/IusJXgAMivUKTVSFkHDFFuEYWDYne3eGxlsxKPa2S2RQhMH14UBIJdVlBI?=
 =?us-ascii?Q?1xlej5E1KgGAa+VZr1uLVZThNuW654mu622jFUrVXyetL3EeVcC5fd8JpOFr?=
 =?us-ascii?Q?BseVXw8WP/X0YlckytDJb0PI9EFjRkyfXOn/+0UmlhuED9pI82R1jShFrajR?=
 =?us-ascii?Q?b66UTFGCGVzbqFO10Vlq6FiH39qfkv3tOODAn/RxTG8ACb4KNFIaXSe5kQ49?=
 =?us-ascii?Q?uBpUOjypWdTXwA3nFIFX5AhArJ8zRo8IrBkQgC29R09JxtxkiwEafQNSfcEm?=
 =?us-ascii?Q?Mtrq0w/0sr1odP0186K9HAiJX8WdhHXa6HrTgFD3FqH3FTGt8NksjDwAIaaz?=
 =?us-ascii?Q?veCpwWmU5zqy2zrXizkL4/M7/nGG8kd0uliqoe8Inv/KDaNvXBUODtj/Niv7?=
 =?us-ascii?Q?HI0L6m5W4T29cwLSsJkjii0k+WXdq+dGjQ8gJw2CIo26Nbm1fcyxyhbXRr8x?=
 =?us-ascii?Q?HqZnYWZO0z1U+0n9HvyneanG1Q6Hqd1VBFNQlW8c2Y779sXRUutEcNbT7z0a?=
 =?us-ascii?Q?rJ1EkCF6BQYoPveowF/ZB+gZWtsKJACfyK83P4xYUDAxDfm2iqUpDRS1BQtI?=
 =?us-ascii?Q?3k/+MO19RI7r4uQFhxX9A5MGhohkCPTpB9k9ap5fhChBMlbmjH7y5Zr8JFvB?=
 =?us-ascii?Q?EWVH7vZFUJRna/ZwKG8SQU1QWj11GwAjuqfdD5iRvzZF+H+qucG7KhGyTwl5?=
 =?us-ascii?Q?Xkp/SrnPWsJilnrZn/O20vDL1hdMU3z1kSL3tCkBnbn7nuhDafgtXNwN00w4?=
 =?us-ascii?Q?nl/DZSzU9ThwvmbTogfITtY8dakYEa0gH7FtKrieuUM+GjNwSRsy323yHiyc?=
 =?us-ascii?Q?znHMEPa6cZv+qJJa47en+roYRf+ZHmwigDDxlE5pc+wcFzSyuxeM6MNWO1uE?=
 =?us-ascii?Q?T/Wcb9esamViZ8cYeBndX1WiVmIoWxJzlX1KMyxDLU9KgjVBk15kHPU6ahQv?=
 =?us-ascii?Q?H6tw6rYujR0Al48C3Wr20fHF7O33QpEO/rctRzP3sEzsiZa1+JIETByl0Z8e?=
 =?us-ascii?Q?Bl3rqsaDDzNKmnUGLZJ4bUNelHFJsoIUAADkCTm8WPGJvlSeDnJ67AWwbD5n?=
 =?us-ascii?Q?S/q7GvTukjmIv7e6iv54WdK9qYnEWJbiQfY3SY0sTAu+5tAr7NB3cwRxlmbD?=
 =?us-ascii?Q?fQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 30996f0a-0e5e-4513-3eed-08dbd1467db5
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 08:28:09.3747 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zR+t4TkC7uNw+YMVkAtB67TIkQOeeslu7oDyXRwPtvf3a9QPqY24e7DPh5UnXlB9pH6A28oadayZjyAoZW1xJNfxQKGh0HsXoTAU9Xy7IC0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7518
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] misc: mei: fix Kconfig dependencies
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

On Fri, Oct 20, 2023 at 09:32:14AM +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> The dependency chain for INTEL_MEI is not properly addressed, as
> reported by LKP:
> 
>    WARNING: unmet direct dependencies detected for INTEL_MEI_ME
>    Depends on [n]: X86 && PCI [=y]
>    Selected by [y]:
>    - INTEL_MEI_HDCP [=y] && (DRM_I915 [=n] || DRM_XE [=y])
> 
> Basically, all symbols selecting INTEL_MEI shall also depends on
> both X86 and PCI.
> 
> Add such dependency, as otherwise the dependencies won't be
> properly followed.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/oe-kbuild-all/202310201234.ZZLwdoiy-lkp@intel.com/
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  drivers/misc/mei/gsc_proxy/Kconfig | 1 +
>  drivers/misc/mei/hdcp/Kconfig      | 1 +
>  drivers/misc/mei/pxp/Kconfig       | 1 +
>  3 files changed, 3 insertions(+)
> 
> diff --git a/drivers/misc/mei/gsc_proxy/Kconfig b/drivers/misc/mei/gsc_proxy/Kconfig
> index 5f68d9f3d691..6053ebbf536d 100644
> --- a/drivers/misc/mei/gsc_proxy/Kconfig
> +++ b/drivers/misc/mei/gsc_proxy/Kconfig
> @@ -4,6 +4,7 @@
>  config INTEL_MEI_GSC_PROXY
>  	tristate "Intel GSC Proxy services of ME Interface"
>  	select INTEL_MEI_ME
> +	depends on X86 && PCI
>  	depends on DRM_I915
>  	help
>           MEI Support for GSC Proxy Services on Intel platforms.
> diff --git a/drivers/misc/mei/hdcp/Kconfig b/drivers/misc/mei/hdcp/Kconfig
> index 2ac9148988d4..a5e8d3e9fc92 100644
> --- a/drivers/misc/mei/hdcp/Kconfig
> +++ b/drivers/misc/mei/hdcp/Kconfig
> @@ -4,6 +4,7 @@
>  config INTEL_MEI_HDCP
>  	tristate "Intel HDCP2.2 services of ME Interface"
>  	select INTEL_MEI_ME
> +	depends on X86 && PCI
>  	depends on DRM_I915 || DRM_XE
>  	help
>  	  MEI Support for HDCP2.2 Services on Intel platforms.
> diff --git a/drivers/misc/mei/pxp/Kconfig b/drivers/misc/mei/pxp/Kconfig
> index 4029b96afc04..3acc05fea744 100644
> --- a/drivers/misc/mei/pxp/Kconfig
> +++ b/drivers/misc/mei/pxp/Kconfig
> @@ -4,6 +4,7 @@
>  #
>  config INTEL_MEI_PXP
>  	tristate "Intel PXP services of ME Interface"
> +	depends on X86 && PCI
>  	select INTEL_MEI_ME
>  	depends on DRM_I915
>  	help
> -- 
> 2.41.0
> 

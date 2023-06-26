Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA8CEB64D7
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jun 2023 08:39:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DDCC10E096;
	Mon, 26 Jun 2023 08:39:27 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC69810E096
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Jun 2023 08:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687768765; x=1719304765;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XkasWCm51drD5OAHUrtGz+uvepvtvJzPvC6oI4QTscg=;
 b=fHCOMlofRm0JtX741060ZGb+edVheIIqUQFwak5AqOH7nH68aoHAyMcV
 9zjKqT6fD/Ndz4Ao7bhNk2lz5SryCCXnIe+m+2WE2VQhnC3pu9SEUwsau
 FyQvNPT3B3CrveRqczUFnH4gVh8+GGpaZ55IUaO/vm7exIQpxoyWIYZYB
 u897mPO7DKjhjQ3nvslO0C6qR3bI+XK7mg12BSvV+20ukGjsYfzBmoyFu
 4E1gmU3UYvH6nhEie7Og+FzU/ayrX7UO05W36oXBKTP23Y40Xg6uvSwBw
 6SvR/Cj7vxOynmeUP2EMSePvZD5xJoXL7HvtMKwolHIextv2zsDZGMNz8 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="424883566"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="424883566"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 01:39:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="666219623"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="666219623"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP; 26 Jun 2023 01:39:21 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 26 Jun 2023 01:39:21 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 26 Jun 2023 01:39:21 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 26 Jun 2023 01:39:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IlNSP4DofEzQaC4sRcs1PZ2T/Fqfm4gnfXVLHrJD6pVssVzZNEnsDy8YwKVERpx7yB9yLOxHAvGpBJXy1iZ7wkuP5FwBJ7dPP6pU7tmvFav7iamBuZWsiwvTQGjQKIihTOnOIfcjri1Bs2ohfLJPCMm8Q1M5FQChaxuvm8OsTKQWafr2jFKxtbIRd8mGLtIPbP++FqM+HuQhxSr34CZjzo6jlYHfkv2UPpOm7GkaNYBSMrVhiyd9JlPhwmUAR8zxSPLZFbPIvWg1jcO9QEqcpyYjJSfT0+7tX1izoLWZNiVqpnVuE+EvR2ZdnQwL8dAPsM+t5VZe73Z0Cf6jz80CUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mPoKcYj6DmroakOX8LhXqhsd9aS18hq8f89dPgNV78M=;
 b=ocaewiQJUzEra6mK42RjspdUNLTgKm1Lhiu3wYMXmeLlfYbtnbFfMSUjEX1+raQTf+gDE57Zq8dNkeglvW6xB73JYxzWMpCTAY7pctHKARD8XCOkMScxOD7/DihYO1cHGpswUjvjOQHrjpZviw05YgBZ/3FPLoD9OgzyuqGa8fxnIKrIkuDE+EjXAwwAAKMUWiXq96gpmq+c+tVWUIRz4Kb3FFYfK2bWyNQxpWcKhaCb4ETX2uYhjFJXUkmii1gsGukiXYfD1ovGMKvtPZh/TX6MMIxl+cMe2bEt/r0ui535moN6ySqtNYPtYt332oaRZjCNEi4DFdQ8WswyzXONBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by DS0PR11MB8081.namprd11.prod.outlook.com (2603:10b6:8:15c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Mon, 26 Jun
 2023 08:39:13 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1e4e:c49d:445e:cb2d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1e4e:c49d:445e:cb2d%5]) with mapi id 15.20.6521.026; Mon, 26 Jun 2023
 08:39:13 +0000
Date: Mon, 26 Jun 2023 10:39:09 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZJlOrbfa0slvD2Hv@fdugast-desk.home>
References: <20230626082506.12638-3-matthew.auld@intel.com>
 <20230626082506.12638-4-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230626082506.12638-4-matthew.auld@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: FR3P281CA0027.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::14) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|DS0PR11MB8081:EE_
X-MS-Office365-Filtering-Correlation-Id: cbe51a0d-9d15-490e-42da-08db7620d1ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ed0qb4UrrsRCv5ghc4UC4n22kCcPw/SI11cESC5X7Ts+RujX5Q1PzcuwRnclhfSgdnKq5bB5bR89CiGpAsxpIXLOL9o2AXyAuym6sBM7l5yZb8ibDhaUSLz0sFgJYQVKCQygfklb1FJt0h8QIkAlKc/fkrY1C8u1HaLK2MMw8OG9WEI4PZ0TsJPtC6Urk73FqkTerhnY1WwAqOQ3fF5J9J85Ps/KRAvQGot6pyfk7GccKj19kV/IcHks6zuwW3H9VolQFsBNLPuAa1YSfRDKwkB0u65m/HwcveU3UNcjQIYKAGtYo/eZNka4oR0HgysMcImrEpSxSA/TszVCIHnZni1QenEqrVsUgX4Ct3hIIkeXlwzyIUhBoGj5k4P89mUINDjVEV8D8+KtScgm+S3KXlXlh7jDCTC98zu1ESOs4RuQiyTguHRv3KuLo750JV3OvdAYdkhOYHHyy3us+f1b3KtYrlv8nm1651vOcO25PrmAOlHXqpgeDiw2Wnbzu9eloUDzVEdsiwyaNW0pg1ZZwJ/EgwuKy1sUPL8Wl9ivVrFY6WLDQ/0JYzzu3c59p+pw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(346002)(136003)(396003)(39860400002)(451199021)(2906002)(4744005)(6486002)(36916002)(6666004)(107886003)(38100700002)(82960400001)(6512007)(6506007)(26005)(9686003)(186003)(41300700001)(86362001)(478600001)(316002)(36756003)(66556008)(4326008)(6636002)(66946007)(66476007)(44832011)(5660300002)(8676002)(8936002)(6862004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Kolc634VvjmlK+vNO3vjNRRUpUrZnIHUM72dbJx6wldWGLixA6vZ+pFX5jgJ?=
 =?us-ascii?Q?hFBM5JYs9xAoirnZsdpWOk7LQVHTf2GwLW8qsfKPc15OwaY1BEhabh8shO2c?=
 =?us-ascii?Q?FU/o2VidJLfJvMMN2e+Hls2GKpSWhxkNsCoPQHLXYF1rcXMiRQWwi7ep4fXz?=
 =?us-ascii?Q?9JUvTxhc63Iu1vrCLFCJzsY04UdZnI3UneI17P9T/QC8fQQnVjiDzfewhg8J?=
 =?us-ascii?Q?M3qjGHtA+ftPtDgXhoGgqYseMUuJZF8dPvFHJT9u/Es62LAGomQ5nps0qjBM?=
 =?us-ascii?Q?5sL1SaeJKRhhFmteRaqrJIOVbl1oOhYAjnXjEv6Z8CeUoIFjbQsayGhhOHpM?=
 =?us-ascii?Q?+80isJv+Yq3vWa2G5m2oIEZXap1ldn9Eoo84V+XXUoGE7w+RSGlndNvRSYx2?=
 =?us-ascii?Q?73MgrVXQud4zOWRt0Sin5gKjBD+4l0a5c2N2YTcLkwIaTEUYw/+ieQbnG9gs?=
 =?us-ascii?Q?cZOoATv5LbWmXmKN/cwbY1pkwkK5tGikor7D1XVf2smZIgwdDkKCpz9/SxKO?=
 =?us-ascii?Q?3UdCTCGrZgrsSsZCAgnDRH/44zeP6guZePxs71BMzhIChKzrQ+DovKVO+BFx?=
 =?us-ascii?Q?Tb996+LUOXF7la0HSOwrYPh9zLjNJwRixc4njuSosoEK6CNUKmxq3esLLAqA?=
 =?us-ascii?Q?bmT8TnpsAtrNcxy2hP883pwOdplSSGFbPmGRiOJnMlbrOKxR/27IXEs5COHQ?=
 =?us-ascii?Q?emlLALFhkWo1WszpTIZ1E/7OAPhNRuORLwBdNI4RnBnR2LvTeJGSZWX4UyXU?=
 =?us-ascii?Q?xWRpqut84FXV1LtLEvqSlqIYE3rd6OZwjE/le/HOtNDmzJbn4K5nHyvUs0c5?=
 =?us-ascii?Q?vSctBE2p65cmng06OGqmUrKSe0hvi0kVck/uFadOsx9gAn8tI1+4Vu7l+0Ca?=
 =?us-ascii?Q?VH1n8qP1Ekpd5q+0ZEA02KsY3j99zWy9uFMquThuXnbNJp/OIaeWb8nx59zW?=
 =?us-ascii?Q?8PnEH3rzr4myZsME9lSoz4SNAmxWp1grXpAHaCCfVEhAQtQa5DMI3+gnGzb7?=
 =?us-ascii?Q?Z6zmwqNGC8l8gHIiNcSHEt/IWTrnbaI216I1VRGMVCDyO78h+IfmqXEyJ1Ws?=
 =?us-ascii?Q?90WjpqOwv6LgMW8VuGVFHd8BJ59hpdpKY/YCNnem/B3K6i7gcWuFnbq57ADn?=
 =?us-ascii?Q?U87H8JPCrQRbjlvt+YCkG2WKxz2Z69DbBdOwUkt5jDiX1Z7AUjeBKrAmjBKq?=
 =?us-ascii?Q?RRV/HxJcG901dOMv+zwUXa5tTZTROCx++JLf7YeJ4O/lVfaxnr+sAX6sW13o?=
 =?us-ascii?Q?HJx67H3vP5Za4Z2B3qytIGmT7TkT3s8BTCrFPrrciQ7Fu92vclGOcSFJaI1f?=
 =?us-ascii?Q?9bHNKNJ/sDq4yY2BAWZT55/DYPpARk8Yh9nc0V20bZsr8U599qlavk3CIY18?=
 =?us-ascii?Q?u7FLyf+3G+1QhzEGG45SMgui3T88dtD9zv1re4H/p0+pfolFWBL930biA7VM?=
 =?us-ascii?Q?hBVRdhvNJ9rFbJ/SSiLn4yah/QQysQivcoVEqMEoZZ3VfNpV0V+6X6xyU844?=
 =?us-ascii?Q?QPv3arxyoUxmDCuvP9Tbhn7Fepul4PzvaA01KnltCBm9glmjLFmkoRXifM7W?=
 =?us-ascii?Q?G1A7ZGbwJwYPWfWju9IKUvmXWz5SNYjHrANdDD6aYbS9sXBS0cU1LU/PpCU6?=
 =?us-ascii?Q?Xg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cbe51a0d-9d15-490e-42da-08db7620d1ab
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 08:39:13.2711 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dFAuzh2GHhp3AZw6WT3DwOqchL6RKvmhcUJujEhvbQOnFJ60ujg5+gnCGeJoxj5APXC/wyi5GgXOR1EzX6VxipycVDy/ver3MgDx/WQ8mxw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8081
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/2] drm/doc: include xe_drm.h
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Jun 26, 2023 at 09:25:08AM +0100, Matthew Auld wrote:
> Make sure the uapi gets picked up by the normal docs build.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  Documentation/gpu/driver-uapi.rst | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/gpu/driver-uapi.rst b/Documentation/gpu/driver-uapi.rst
> index 4411e6919a3d..79f255cf7b10 100644
> --- a/Documentation/gpu/driver-uapi.rst
> +++ b/Documentation/gpu/driver-uapi.rst
> @@ -6,3 +6,8 @@ drm/i915 uAPI
>  =============
>  
>  .. kernel-doc:: include/uapi/drm/i915_drm.h
> +
> +drm/xe uAPI
> +===========
> +
> +.. kernel-doc:: include/uapi/drm/xe_drm.h
> -- 
> 2.41.0
> 

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E74E6FE54
	for <intel-xe@archiver.kernel.org>; Tue, 23 Dec 2025 21:36:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20C3B10E2CC;
	Tue, 23 Dec 2025 21:36:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VVUjw5y7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6108310E2CC
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Dec 2025 21:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766525781; x=1798061781;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nO9/jkp8LJ++Wxx0GlYBKUOs2id+uNzb/NGM9lKVjWo=;
 b=VVUjw5y7kF4NPfcEZid9cpEgLZxIukgXCY1vK4tZs+z23LBdHKQan7g0
 F+ULROd6eC0FkZPRMX1QwEfsZghXiF/uNIszRFUWkHrOsQqEDOCM+w+yW
 62nS4heS6co+EB3B9sbEuy6UBDG9RDeMtAej0keEm/9vldjP/S5jepxww
 2Bey9oX9T3pIaRQOnXk9Yr7xAAUYoX9s0YR8OCcNEAmJWwvalUp3Woqyt
 wWtHWKf7az134KWFo2OypoVaRNHXBFC6EiHg2B81xAa5HozSa0fAF+Irs
 D+JSZ/bNILmOij6fMWly1eybSDxF4Vc8vPwjwPf90wZLlJTaIgQuu99WM g==;
X-CSE-ConnectionGUID: IUXNwSk2TRa9d+kIH6dRsQ==
X-CSE-MsgGUID: jdxpX9oUSQGybsw5LBM1RQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="91030855"
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; d="scan'208";a="91030855"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2025 13:36:21 -0800
X-CSE-ConnectionGUID: CnD44FZ7RtG6EfKSTLENEw==
X-CSE-MsgGUID: awLt8EaLS8WQ/kyZV7r+Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; d="scan'208";a="199894367"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2025 13:36:21 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 23 Dec 2025 13:36:20 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 23 Dec 2025 13:36:20 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.12) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 23 Dec 2025 13:36:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LxwFb95diejWCT9B8EzN1pQ9ngxT/f8YDxRt1THZKHeCJMTNeAHprFO30kR6RCnmjl8GpRpPRfJVgODOtmyGSc48aJg7v3mIMRzgojOi/+nJUkcEYqrDVfc1+ufaS2Br4SDBxYKvXRNw31GIg+GZxsEXznnF5plLo5XUD6vu9y0uoG1aZPKFK8bgYDb0rh48xbPAOXpxJQEJzK2qY90Fm1b7rlY/Ks8WzqFsTvXZ5vvXuxcJubR/hHhJIOJJJYTi23Ml2Mba7PvnZGaaRQF2vaLbUjIPXaz7j9HYw42CDXv02ImJUH2FdQb5O24UsBJcu+sY04uIn7Wu0NFXFLgbJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o9i4dI8FXzLFKAfbsvyP9jsuZqr3HSFm32OVJPhbcYc=;
 b=t6mzjVSzjQygFWvGL7izO9hGfNeZoimuJJTYpR0Z8YeM6aUZesyo42NURVIFl3MvDzKXf1QqgX9CLL8rufJp+GUztn+6b3QF8cLoJeIK9QPpSUxqkM/6DRNV+i/O8ujwdHTVrSu5XPqL80Wx2hZadyW3qCV12S2hZsO6TCqL//wg6UN93VZzcsoqsuE1ibG6V0PYGfroraDc8EXtpq0f+RQje98b8jeH1GKWVmopdw3UT2agcGLoib9G4Zqtz1/ZVcwvIGHq6an/F3bvidzpmlAn4Zi9qaMi0jqmR17Aor0NBqpFJxjP+zUhNNG97JHP2hMI75blf8vjj8ZZXEf6Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB6783.namprd11.prod.outlook.com (2603:10b6:806:25f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Tue, 23 Dec
 2025 21:36:18 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9434.009; Tue, 23 Dec 2025
 21:36:18 +0000
Date: Tue, 23 Dec 2025 13:36:15 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <daniele.ceraolospurio@intel.com>,
 <rodrigo.vivi@intel.com>, <michal.wajdeczko@intel.com>,
 <stuart.summers@intel.com>, <ashutosh.dixit@intel.com>
Subject: Re: [PATCH v3 1/2] drm/xe/guc: READ/WRITE_ONCE g2h_fence->done
Message-ID: <aUsLT59alCPEistt@lstrano-desk.jf.intel.com>
References: <20251222201957.63245-4-jonathan.cavitt@intel.com>
 <20251222201957.63245-5-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251222201957.63245-5-jonathan.cavitt@intel.com>
X-ClientProxiedBy: MW4PR04CA0066.namprd04.prod.outlook.com
 (2603:10b6:303:6b::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB6783:EE_
X-MS-Office365-Filtering-Correlation-Id: 359cea51-a864-4a02-6f37-08de426b4e9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uPenQ41VgUEviWATmuVDVCmBa/ySfWx6qxasmqL/8sQP0/2AcaJEH4b4THnb?=
 =?us-ascii?Q?yxleocc5I1oeaBOWGp+X1YwEG4pKRUkxiEG+Bo4q5koaHF0C791+XKNoQc7P?=
 =?us-ascii?Q?m20xMGzwh8m3vDhUJQ+D+SyvSmPBjV/fIWAGh4sj6AY5t5EBaEZ/6WPnq2s+?=
 =?us-ascii?Q?IWKoh0qoHn2s9wTrTKuya8LoKKcQKOKJ4FIt4QXI+JFV9yW3LaxI1dWfcnQS?=
 =?us-ascii?Q?fHJLNliDG0NdmLx8fqZebf0A7x9mSwrZYIi5sGIu1tYyFje34CHuUd4QW9Xr?=
 =?us-ascii?Q?SHRE20uuQVr424DZ6ExG7nucl6+pJ7NQBTasmbW+858pUeVDleHL2pjgPXsE?=
 =?us-ascii?Q?i1nfVqAZmM8gjaHVdP/+8fTaaV4lNzDW+0zUEU6pnfSappnNMzB/EKMg8SRB?=
 =?us-ascii?Q?PnLpRCNevXHVFdz4IXPq1S0vvGJD6gwZxDHI/0gaos+tpzoFGq/f7ZvBNDfZ?=
 =?us-ascii?Q?OcSetBwrLrobWsY/hki/buKRg2F3eVfxEG5lRDngupPHyPfR0yv2vBzHqMk/?=
 =?us-ascii?Q?qhzyR0argIAmWm4A9yN/ws2grpwKlDWmB+oxkH52m+VMGVpF15h+zWK0i3if?=
 =?us-ascii?Q?OsCG7obxGBcVdgZ5tXaa0eHTqInjSLvwnlmmYwe8LuJl6TGsYVhDPVh66570?=
 =?us-ascii?Q?plC1GF/e+jFs8kgvUmEjxbgzh3SbkqhCmXAwYuknO01uTBmhSxphPb/ir+Pt?=
 =?us-ascii?Q?HDXqmZfF8jjmuUhyeCItT4WWVMVCE4HwRLysv2hQntw5SqreAITWYxTvn81g?=
 =?us-ascii?Q?VoxWWVeTZXWPCTEnj9aOoQTaAb2iTOekChBa5g7+P7MHDurKp5az40sU8+NC?=
 =?us-ascii?Q?LQ2iq0SlkS34K83m60QZqI7fZKmyRH80oJhh/dHzNh5Uu2cyNfSwNEYiYmE3?=
 =?us-ascii?Q?+lIvVTkLksn+4zMG1HrG22BopbIMUpdntxm/3OCP4M5Pb622kxjEMw1EdTP/?=
 =?us-ascii?Q?vZcN9zwk+2Rksv9wDfSKJhVfu5ejjq2bqA/RFNoX4D+/edh5a78VXILNVbgj?=
 =?us-ascii?Q?p+tPa5NkUORuansO1Z5Usy58WL9zlNp2CYp5QHQCvh1Y1FVhHAUgEGRTtSkF?=
 =?us-ascii?Q?+/vb0UVIbOhQ6HbrlDyEW0iM5I6DBYU7NNP+AxzXCPQwFXn/r7C3XeVUIYX3?=
 =?us-ascii?Q?Wh89rWJ2z36XO6miqiRV0em/5GQcK1j+SOyIdLJ0YuylZZ+0E0ZsIN5CzEk2?=
 =?us-ascii?Q?X7hzL5k9MLyYfo4tHrCZfxQTL/noi4UVwO3Rmj7JXHpqHYFDfycJJ5g4P+bi?=
 =?us-ascii?Q?QtIlkVuOJezJ/CnnmEB1z57GkbFbKXKYa8cgPmggklNsRO53U595UuMwdnJj?=
 =?us-ascii?Q?nApGQ+e2VHe5aN/WUE9U0k3Yabz6wYHjeRTTuSbYX6Pu5xorelxLZFgzCo9e?=
 =?us-ascii?Q?D2hHn9S5dnOKOMbr0Jd/TDIObFVEkacEGtpJX3U2bMd2z+uGM1GGA1lM5H0J?=
 =?us-ascii?Q?XBGHrxei9vm7XU7Eaq2WZSjssLPUVgmF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oXjw8FBhJ3UoHOixMHZEbW/OFxxrc7HHrbkAWz6hy9vPEW9wkE+SxLB3HQ6n?=
 =?us-ascii?Q?HTplKTMX4dW64gBYQUxmvj7nkZw7a9/hKRJwuSWVbZAZZqOYJDDXJEJWpqqT?=
 =?us-ascii?Q?/7g6YZ18tbnuJEg+Ae8r1kBhvybtx/3xsN5K0NBgtMK3xj2t4ij8kanuJILw?=
 =?us-ascii?Q?7rlhGIYuk+5PiMCGl4P4laf6Bst7vsXKvuxNWcnsjYr9xAZ9OcwEfkOVh2BS?=
 =?us-ascii?Q?TR/d+VK8gU9zjt7pR1l7Q0LKqZr33M4lXkHkGJM34I6no6GxhJC/iVJqSoLl?=
 =?us-ascii?Q?CRnLbJB37dsqmGF3t1FpQI7jnhJolvy3M5aJw96KF4HFfr7xBvjEd2HIxPEq?=
 =?us-ascii?Q?88z0flrXYRKK1+bwEzxtJe+B5UNYffn2r9rfAvhrGa4c7NFJhMsBphV5W3+u?=
 =?us-ascii?Q?e8rGFGz0SKE/68vH5kF0r4OrfyT9AqgE/tbwPllbqSVQLfzChvx6MLvcYDNB?=
 =?us-ascii?Q?LTytSIpPYvMSh9eBf/5FD4vtwdwl5JyV441Yr0wnP+St6PmjhpqkujQ+Hqjp?=
 =?us-ascii?Q?IWOqyo/b1Od4Fr96tnx9cKH8vCjkD4pd32nuqKjlIxEmxuZk/ayd3ldRkfqk?=
 =?us-ascii?Q?f7Pwc/bvPkAOb/uZa/gCNCEUzpPWKfUVhejnCiQYKZd3Zt4iouyawMCXYVcl?=
 =?us-ascii?Q?OTnB4YjVmraVkJBR35KUJhcL/xS83TauJ6wWpLiBeaMwZtjlTqYqbWho7BPL?=
 =?us-ascii?Q?a0mBEoldDn5aIAGVStN2qLpiBaWzhCyMNnNPBd1ybl7gCRTJ5jriUsmRXJuo?=
 =?us-ascii?Q?xcWX6zcfljjNRI0EYgMi7az3mKsUZKeqECU7GIsaZqSxfb/oz4yCZQZp+vJw?=
 =?us-ascii?Q?qLSYlyFB9FPpYm8lLR7yuUN2T1GRPXefHOBqE8QP4gyRmD2k1EcTcHjFwQyH?=
 =?us-ascii?Q?kLzX3I4z3ZqZ22WarP6JflobjfM4oZIhYiMXEWK42u8g9Do033b7Vw7wi/m3?=
 =?us-ascii?Q?rJ68mSNVGYZnGeQiEDs+vgQROfKm6tQVAf/uXbW0Fo782ObS1vjwBGi9zOv4?=
 =?us-ascii?Q?u4QOVj1ODerCvQmk3evwlGLyaM5rymD6ZT77X4tN2aMsxaKzXvORzhR/ZJQy?=
 =?us-ascii?Q?YVGkiXIOj4Wq7VWrn6PGgY/bRJwZBwcZ+a9X9EzyGSkaT2MNn6vPw8f3kW0+?=
 =?us-ascii?Q?JXeCa0Bc/2J/4az3nfgQ9R042Kf0vhGrmBcCc17QMbllYaMvqHj47gRhvJCj?=
 =?us-ascii?Q?veCQP4bWVGGkPkAQPES55ow3BFpxz/TOaWKPjyIHiJVDvF36bLVElNDHKSEm?=
 =?us-ascii?Q?E5aN4bbmnnjVEbuIi3TjDYwuM1v63ezLJCFc3oB799I8NGiHifzutVnuJwoN?=
 =?us-ascii?Q?ySCUcbb5VytriKNS4wTTHcwvS1w3NhAeHH3l4RSyDeT0LqFf5u3PMa+kKI0E?=
 =?us-ascii?Q?Fvg0vGQ2hDVZ7gb3pNpm+JQUcQY3ggf2rywObwzakLbh2CbAjeQuRo4KCbsW?=
 =?us-ascii?Q?30ZYekyNjGysj9S7K7ql4ph6b6spWXEfAQw0XmnPbrvX9Ncgv5/MfImzHsnz?=
 =?us-ascii?Q?6SUHmaUg7NPXIMaQN8VchbvaUgTp66kWBXK0UAYcOeK1vh3TWmVrTowragIN?=
 =?us-ascii?Q?Hr+Ib3x3N0iEkHnHLkSUV93ydGBU6NLvuAjrdlP+8sRNEhrjmT1NCTzYhvXD?=
 =?us-ascii?Q?oJcx3h+MQsKgAFwYpLRcbudUd3OLZPXvL0cunkblCRFUSv8AcJ4LgpFHPEKy?=
 =?us-ascii?Q?7Nj+0zOVkyv1INTJahV1uvKh97YObfbwqLfl/A1j/kmPq8j+gaZAYmevZvyt?=
 =?us-ascii?Q?ePnhFZqrww=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 359cea51-a864-4a02-6f37-08de426b4e9c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 21:36:18.2739 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TWTfIH3LhGLNWhh8eR3UYu9vwd/sCXryAyqEX5GqWQgZLls79fSB9yD4CtLSZFrXiaZSCN2ocbjgr1JvsLxGqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6783
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

On Mon, Dec 22, 2025 at 08:19:59PM +0000, Jonathan Cavitt wrote:
> Use READ_ONCE and WRITE_ONCE when operating on g2h_fence->done
> to prevent the compiler from ignoring important modifications
> to its value.
> 
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Suggested-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index c3df9b3f1b4d..f2148a8bf208 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -206,7 +206,9 @@ static void g2h_fence_cancel(struct g2h_fence *g2h_fence)
>  {
>  	g2h_fence->cancel = true;
>  	g2h_fence->fail = true;
> -	g2h_fence->done = true;
> +
> +	/* WRITE_ONCE pairs with READ_ONCEs in guc_ct_send_recv. */
> +	WRITE_ONCE(g2h_fence->done, true);
>  }
>  
>  static bool g2h_fence_needs_alloc(struct g2h_fence *g2h_fence)
> @@ -1294,10 +1296,13 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  		return ret;
>  	}
>  
> -	ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ);
> +	/* READ_ONCEs pairs with WRITE_ONCEs in parse_g2h_response
> +	 * and g2h_fence_cancel.
> +	 */
> +	ret = wait_event_timeout(ct->g2h_fence_wq, READ_ONCE(g2h_fence.done), HZ);
>  	if (!ret) {
>  		LNL_FLUSH_WORK(&ct->g2h_worker);
> -		if (g2h_fence.done) {
> +		if (READ_ONCE(g2h_fence.done)) {
>  			xe_gt_warn(gt, "G2H fence %u, action %04x, done\n",
>  				   g2h_fence.seqno, action[0]);
>  			ret = 1;
> @@ -1498,7 +1503,8 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  
>  	g2h_release_space(ct, GUC_CTB_HXG_MSG_MAX_LEN);
>  
> -	g2h_fence->done = true;
> +	/* WRITE_ONCE pairs with READ_ONCEs in guc_ct_send_recv. */
> +	WRITE_ONCE(g2h_fence->done, true);
>  	smp_mb();
>  
>  	wake_up_all(&ct->g2h_fence_wq);
> -- 
> 2.43.0
> 

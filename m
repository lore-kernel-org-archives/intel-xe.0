Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A2DC5AD49
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 21:12:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93EA310E01F;
	Fri,  6 Jun 2025 21:12:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jyKtR6Gc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 740C310E01F
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Jun 2025 21:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749244340; x=1780780340;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8UUNe8sQ8D+RDo4aq/Ttf3F9YZ28cyI6xM6ouflPzRk=;
 b=jyKtR6Gc/0fKCCh5Q2iIrxkZLdire73sA7hQpICx2MIyNORi3WP7z5lB
 FLEf/wkcK0WKXR4bvHaK+k7Il4k1FNPXuDMvKZSGLE6GVQFbKatzf1Isu
 OkWj35Z5OwAWtZGfamYYVBOFu1e7Y2mGRCXhJjm0526jKkgUiBgnfWWWQ
 GDd+2ixX/K2Mjn9DrzLgxchZd126i4JtqKGud737ogMlqI+RayCZoMMsL
 rjVb9ckX+/W1CwuO4OKBhSGPgSdvhwOWMPsGkEhgdJhXXqDWiViJnQu53
 E0TM37c5iF1+dAC1a/lTduk48WXQHud8HWmP+6kI3q0xMjKwdmiLnniTe A==;
X-CSE-ConnectionGUID: 5d+iA39rQiSqwKxmxb5GvQ==
X-CSE-MsgGUID: Y3xNkD7pSJOGGSCAhSR7tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="51499533"
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; d="scan'208";a="51499533"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 14:12:20 -0700
X-CSE-ConnectionGUID: BWMxDp9GRay1xI3fxISWCg==
X-CSE-MsgGUID: M3gMCo4bSsGyTfwlQteWkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; d="scan'208";a="176809442"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 14:12:21 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 6 Jun 2025 14:12:19 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 6 Jun 2025 14:12:19 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.72) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 6 Jun 2025 14:12:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=drppdOwZjFI4XnRCAhDNb5D+xQjs60cm7ybhmp4TvcdUlyoh2pVQMw0j8enpvvaRcX0fjgFig165oNRayb6ayZ53e6Wr+eR06ZqiAoSWD6tnr3ajv7uoHpDNSAe8mkwNsVxHxbFVC+fNZj6xQCw0v96nebXJ2V+66oUjbjV3m5U6X/f3sAIczDfxNPnmjz004NFYvNh4BNiVXh+Tm+Jl7kE5r+oNJ7BFN3ar7FhO4tifa/kVsTCa8P0zx1i2ruNQ5z9bRJe5OOt+y2NrvDzyOrGWcv8KtEdcaIt5/1W0wqCoGtyF9nw/cTdvnsq2rzCepiVmU/j3CJDYhW/6LvaKAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8UUNe8sQ8D+RDo4aq/Ttf3F9YZ28cyI6xM6ouflPzRk=;
 b=RX7r8cXmCN5gDVLCFanawC+h13VS1oK15iYsMJZSg8Tsa6LYCw/pX6cYDq22vQKTCGFICUMHf7vxEqcuGWn70SWYTicH6fbOUH/CTMngCdQtzD9/TOYX8Ouv2s95sNXmbfGdzhxxjIhLYF3Izaz+YvjYPn5loUvlUWcBBU3h4vXFVihIZ1Bw2T8tkW8n/qje7wmE96IKpcpvL5qyZ7NrlaPjx19phD7AYHi5t4308+bal/OhgHpRN0+LH46v4azW+rxwrpx4gxcOaav4NichdawH0gNrvA1qloAWKcrhPL+TJR2EOT1uKofbQ4k6sLXXm5KMV1BpcKYWtFwBOgl+9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB7566.namprd11.prod.outlook.com (2603:10b6:806:34d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.36; Fri, 6 Jun
 2025 21:12:02 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8792.034; Fri, 6 Jun 2025
 21:12:02 +0000
Date: Fri, 6 Jun 2025 16:11:59 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>, John Harrison <John.C.Harrison@intel.com>
Subject: Re: [PATCH] drm/xe/uc: Use GT-oriented firmware messages
Message-ID: <nbakc5s2wpgwlrmsem3rmdlasivc6qhtssqm2gf2jcmdovetba@kygfzl4c2rrb>
References: <20250606204311.813-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250606204311.813-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0165.namprd03.prod.outlook.com
 (2603:10b6:a03:338::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB7566:EE_
X-MS-Office365-Filtering-Correlation-Id: 95ad0cc9-625b-408b-5536-08dda53ec83a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ChJqqRgUVl1Yduq4TbLxkfOVhLDlZQ58hyF8MiUHaNjCNnfDS1Z4KqAXwHh9?=
 =?us-ascii?Q?6eLvU4VPCJq6luShSBoOuPlQnVIwGvRwTKIFriJbSMexGJ5Zhz31McEaYpbO?=
 =?us-ascii?Q?RsttaLAF/G1E3oCkMKSGlaROTpGg+RS3xyspt3BqR9gsT5OBS3qgKT1gziZz?=
 =?us-ascii?Q?p903tCe5dLYIKAylLuZuYNzAgcNm+IS+mWNTjLNc4/rMCRXorB8oYgCe8x4W?=
 =?us-ascii?Q?d7jXq+nyhmC5WbU1qx3QPU8mLdoiG+YPAe6JJOqgWeXRBe6wZfaS+H+ESyJK?=
 =?us-ascii?Q?YCNmIcZ2ykNIr4C7vqf/kzrt9H7tNS1FhIY9U98F9eSsIn+7/1KfL5KbO1PL?=
 =?us-ascii?Q?eDAHwS6P+99thHD2r5EkgLvXsPeJjYOCA4Wq3VT1UqUVG1SKzMKaSm0Vs0lU?=
 =?us-ascii?Q?olQ5NUw05BeoFSmnyd6x43bNEAn07tZOGK2/GQYpbY5t/IvVsCJUebENKDBK?=
 =?us-ascii?Q?wIWw8Nr7mv0ZkzHY3KtApiVGdLk7g8Zhn6fopFCmR6drh48OZTQijoTD5mrO?=
 =?us-ascii?Q?lz5QmDVVU8HpvjyS4wpn2JMrHUBtqj2T+aUt4UhaMfwkeKFBNkqqj7zmwCxu?=
 =?us-ascii?Q?NmwSce/vKn5DX77qsnSEUwFy72tF1TvLsPEH1LXn9XFOFMhFkH0QJX5iHS9M?=
 =?us-ascii?Q?5SvZlaxqvUy6zuqBjIa++e8GHiBz9l4X/zi3EcVdlSwfoBQFG6nXF0Uv1rGD?=
 =?us-ascii?Q?mAnGi70/PvWjtGNss4LQNsGG1dfTlP/dYOf/CpTbiXkCnbYO/Ijp4WqiVjHg?=
 =?us-ascii?Q?U7Qdv//SRToMhnDTrKlZgKMzG6RAwjXM2t5JnM7yDzdZFLHuqUoZrRwj8uK+?=
 =?us-ascii?Q?qubX7oBfko5MpTtODG7dHd56SCiCT80huBBYsHWfF05tD3vEjQ0f7OjqU/4C?=
 =?us-ascii?Q?tugxIdGSpwIsvCttb/u2uw6akSiA8TavRGaeA06JYQtFjORineDnXuzwrqKn?=
 =?us-ascii?Q?4lISCqVO8lJw/jEuzSjvSuT4lyjLwqydQXLuGrz/z20wAL19X0ul0eL79YJR?=
 =?us-ascii?Q?4DgGJTeQmzbaL+dudRDGkfF3xVGE6SmHtm+1rH3xhEdNoFIx9c1BLpmiazhN?=
 =?us-ascii?Q?nlMZ3m0ChtoFzpG1yBi8xc3u7/ShH843xrD7WbRoEG6dPCuXXtGh19HoKl5y?=
 =?us-ascii?Q?DRYxmQQM5PPeG+rTkLrNA0MMGvB1mYP3i8QBm17nN/HIg+HRUAl7nzSeiaN4?=
 =?us-ascii?Q?hDv/42H//s17lX4gIZG0vv38LNpK9PArRP3Iqjt0T1W2vrUKIF6YHC4xgT8g?=
 =?us-ascii?Q?mNBCwztDZsWDch6irC8a6HiU4S+dqi0XQ9dPlZ8vjQBAa961Tb7asjVbeYWA?=
 =?us-ascii?Q?V84n/xiGpxnaFzTHjor1HSOgPDGQa+XaJWsDIX2woOd8vFeuUVvjRl9KUE+0?=
 =?us-ascii?Q?R9DskValkNafd6dN+ns1T7JS/pK/26DKdaLFX0GZHKxHTz+UYkpJG4NSLXh3?=
 =?us-ascii?Q?0risrNFODyI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QPwUEY+aZ6OIa/DoNOCuLAn3FIgthjotbDftHDwoi4Xk9+LnX/TJpLi/8LXQ?=
 =?us-ascii?Q?v9j7yz4KS02NVNyfVvU7YiOPXUrn7Q17e2qIBBUjHGj8d4f59vs45sFCyxoE?=
 =?us-ascii?Q?+GBal5vkpcXE5cNFLjvzrF1WDJOwlYumeg5cS9dwrITrOXPOnRQEwGutaHV/?=
 =?us-ascii?Q?m4WqBaNguTQwe6FNDaFTRr34fjX9jNCbe9hUeU2ZHbbsUtAd2TewIxdqZmMb?=
 =?us-ascii?Q?y6Jhz75cMjBPauYnHAVpuPv92khM+UB1QRiQ/1xKSK7Xwvla9kDcqeSDaHXx?=
 =?us-ascii?Q?bQryXNsVs/jXVkQK9xPRDx5AkzplTV6i2Eujwq9dj7yuFqc3WESZf+/OzZVi?=
 =?us-ascii?Q?JIlVfX4BL4fKDRHAoP0tPmYyRF/joAeCvLzb/oi7l9ewyVr5ObzmBRaEl2wc?=
 =?us-ascii?Q?eo/4WfPxuW9kDY7CjUSoM5yr8fJG4jvbGCYvS2rdFf/XP0kDD6zp00f2nyWn?=
 =?us-ascii?Q?HIm5oHErTRYbCrayyCX+8CRUogTMAfvh/Cbc7I8LWR2nMr3qVcLBm09jcY1Y?=
 =?us-ascii?Q?6NciYKNF24PxcG0kAhBXzOdQP+0QXrDGt+OWLgMpuTITfwQ2Q/aALZb0Fd1/?=
 =?us-ascii?Q?eupVpMiD3Q9UmK6DKm/dEmz/oNGnKsM7yWHF9+d8R0VvAzFAPBsJfihG6SYE?=
 =?us-ascii?Q?Kk3nRCo62NJ5LH9axKlRDXbDrH9nAn+26EQ1TjplPZGtPnGyjvlCwF8EeFOn?=
 =?us-ascii?Q?EHHaNJXX7bvKohGaUo1Snj6AVmUbfzMZy7pcHTUPLYlSeEgV9bT+CFCmQdgE?=
 =?us-ascii?Q?w01CLIK8PgRgwX24efSHVGPJDrK2bpfg6nr2EJmfd3jVrY7F41/zmPvgfD78?=
 =?us-ascii?Q?QTcsDbzKLYeCcaAhnxIosRI57flVB8OjjnXdXi2n4pHWKLQqSXqink3SL9Xk?=
 =?us-ascii?Q?H8/ODojflOpDSpq5kyp1CfNmz3WhgCXxLicR38QxJW6vmiIkdHhPUc0H/bvw?=
 =?us-ascii?Q?kNzUv+SnTtWvAIZWSr5iEXtT7k67WWv8/ZT1IN46kmPv/xohab8y8ulJCZsS?=
 =?us-ascii?Q?U+x5xhz9G+5v8/cL6NjVQxmoal9BaJJUXkXHnBCr9g9n+jCKLDuMTimsFweb?=
 =?us-ascii?Q?5Ef6YOVESz3AaLIioyBcSQwZDX2ih6U3bvHQNTjBIVjIdxilUqvhrBM5xS50?=
 =?us-ascii?Q?kDhYlCEuwsVImhYd5A8FR+ESHxpigIJYjsYddBx67Vy6YJTC3/qn2ZOvuUTu?=
 =?us-ascii?Q?7yjPua5ci9rnPdTmlkF2UzSKawLACCQApPBLpVmRFb/gp6YnsM3zqxw56YtD?=
 =?us-ascii?Q?KSsMopDWRujpUtyQzYh60Uaj4NEdvLmlNXbr0WKe2tmlhX6tOkg7vfojPR/L?=
 =?us-ascii?Q?y2Lg2KLgGeclUMSxOEBhzShn2JRLR6rZjdwLrXTfU295oe3bbdHj3wRoHV18?=
 =?us-ascii?Q?VTWIuAxsm+RVNOe3bnWOw2nVn5W6B2DnKPnxdoGQD5roLFo0jTGoFkuzNqIL?=
 =?us-ascii?Q?7Db9KTIoB7Ka4DhEIAlwJmS75h/2SJLdNTvzvWcnt7/7l4EqwUskbhCElc6E?=
 =?us-ascii?Q?vsXrX12P/iemkpWAT+V6VfSB28nPEuwp27mN2oiXSIm8bW8d6Cb45uiVNIML?=
 =?us-ascii?Q?YbH0vAdiZAxg/Plz7GDH6/aaDwyMrLXrOFHyj55gLzCAmegbeHS1rqiv+hU5?=
 =?us-ascii?Q?cg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 95ad0cc9-625b-408b-5536-08dda53ec83a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 21:12:02.3591 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: scie+FWeRIwdPRDTgl5cLt0DHUXEeAvGM9zODT5B+NaGiYRhOw0HY5GWM9UxzaKyoX2FlGl1BF0/xeDwkyEBhMnfLzaYY4TJnIPzXrWdWEo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7566
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

On Fri, Jun 06, 2025 at 10:43:11PM +0200, Michal Wajdeczko wrote:
>We are already prepared to define firmwares per-GT type, so we
>should also prepare our messages to be GT-oriented.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: John Harrison <John.C.Harrison@Intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

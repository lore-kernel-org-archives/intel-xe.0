Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79359C83030
	for <intel-xe@archiver.kernel.org>; Mon, 30 Jun 2025 23:54:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3996610E4D7;
	Mon, 30 Jun 2025 23:54:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lEKIsOJE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F55110E4D2
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Jun 2025 23:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751327693; x=1782863693;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nTQxQdVxKzQapKLWyudBMwj4jhmtZXPz2e4nvDjcyns=;
 b=lEKIsOJE4x5jj8OUb5ItyxhA4LhEeOe/uHvTiXzrbqd3SvzucLw66XNA
 lAP2/xBu2VqLrA7G1gi9O+gz97HjZDO/7xlX3wjt9+N1VXBSsLKPwExO6
 clltTQ+ZiRxdjlCt19y54gbVSaTPPxw0TSM0qHW9DdL8ubaNGa9Vf5yeP
 Mh+OfyQUAHijNHbiAO43ywJl0POWXK5VXmShRGp2NZXOzKpBEW1wkrUN6
 0Ktr+Vc8D2FD3Q2ATTGQKl9OxOFAAPvjRP7F2ICLyr9SDy5Oyuohrn9mp
 ARRu/k1C3bMaTNiZiq4aNBhqPlPhB19POgMs60jVpvJJatKBbucJe0JMH A==;
X-CSE-ConnectionGUID: CoDGp1rxSBKm5WPPY+TVKg==
X-CSE-MsgGUID: NEPYVhDcQda4tZqzqYdOQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="79012225"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; d="scan'208";a="79012225"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 16:54:46 -0700
X-CSE-ConnectionGUID: yYHfBjiKRCmdhfsuWTQ3nA==
X-CSE-MsgGUID: maPMVCBMRtmGxFgmn2WZlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; d="scan'208";a="157997919"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 16:54:45 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 16:54:45 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 30 Jun 2025 16:54:45 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.40) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 16:54:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tDE12qYRUzs3GeGt+IILdOUmDUc9GiXJiHZH0ZG/UoBI3TAPHsEO5/i3jTtKBEL7l6cv3Eo06f4tOtozTiX1fpNJpHvTRz36bEbIJetzAG0A1DIugLTqq/4ZOW+DzZ4AbeBnKMUV8in3GOzZwEihqtLjmOJ0yxae1dXtXQ8Pfpr8PKc7nr5DbqJ5w+65U8qXA5AZxz/MVDvIjSP+L0s3pQxfXNHf+UpUwJLAEHVVlxU/gDXzIdTtx/y/r0qYVCbaA3h6bvG5LGojWEQ0O11ReHl5knUNQiFu/E83cLyjG5NozposXc7l5lS/nwwfRdwAN+K9BMDqum5iKrmSI+7Tzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=07fsJ4AfsJOlxXN9Ft7guZGwQkPH66eJb/jXrhOgcWI=;
 b=RQCDtHErLrfzB8G8P78imvcof3RscLpRd2935P9J+vxLt+Cvn00jdQHPe8TseB1eZk0zK9kO7BCiKfmBAdW/Ky9hygU4Ls/AOrBJm+kI7edpTKZNXVBnHYOxiEsnC9Qdriul2ZBRNrX1soJBsTJjshW7G0Z3+VxToJp2l58LxcNFLQaJXc8niTE4dumvVh23AvwDt5NHoY5Om1pvGP8pW7ywvcyXydc/v2mTbfMm9z/kH2pQobGK0ztPyL1j8u56wOrXFS9QjediSuLWS4+ot+PwGq9Yj11E5t2d2R8SS8Ofeg0mIUEttFqfK6fh6TnnJS73/8TTAOkKhG5iaDGiQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB8131.namprd11.prod.outlook.com (2603:10b6:8:190::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.26; Mon, 30 Jun
 2025 23:54:30 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Mon, 30 Jun 2025
 23:54:29 +0000
Date: Mon, 30 Jun 2025 18:54:25 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v3 1/6] drm/xe: Export xe_step_name for kunit tests
Message-ID: <3cz5a6ndikuwr5a2ufcueiexcx2atwscgt2fk32hsxhxsheqr3@a33ruk7ygllv>
References: <20250630173438.2342706-8-matthew.d.roper@intel.com>
 <20250630173438.2342706-9-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250630173438.2342706-9-matthew.d.roper@intel.com>
X-ClientProxiedBy: BY3PR10CA0029.namprd10.prod.outlook.com
 (2603:10b6:a03:255::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB8131:EE_
X-MS-Office365-Filtering-Correlation-Id: 1570c3d7-5653-4f8f-1879-08ddb83173e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zSMkB6RXGqB43ufNRynVjkThRADlpk+/utISD44VH07AMhoD55YZpibjlxM7?=
 =?us-ascii?Q?9Khm3FIEtYnCEu9RmOMGRS4qZQmMlgaS6S4pK0jasPMFMqoPvrKyQB+jkgry?=
 =?us-ascii?Q?mzjg94JmZyvxqWaTKS0v2E8w8iEz+ewm6N2VOWGQZeF5XyWe0fmZwzaSGj4m?=
 =?us-ascii?Q?ojrT0KJlS6O9nswL2ThjJfgFD9r/vm+j4JzvpgTCy70tKL0iDMiHkT9koXqL?=
 =?us-ascii?Q?fY5uhNncF3tjRNT2MgE/CWF10dM6O15pFz6daj9z7WeQE0jAGOJCg7C1+efA?=
 =?us-ascii?Q?aWTliPBZBVorIdGJKzkzS09oVSYdfdAVFiFdWoDkaoACvSqU9Q2b9CUCJJnH?=
 =?us-ascii?Q?Vc/op1b/8YcA3qFDeik9noIfWg98eL3U+9m+ITzhIBK3QN+1/1SNXRQtVAZC?=
 =?us-ascii?Q?MchPBAbvwJfYQeGhRamDLbu4JOVkPc+5CZM786elmG6y9r8dbsX4fLw1clhH?=
 =?us-ascii?Q?IRbEYdfQUz3uzfXzUDYb6Yb3NaO2js9VDD3SP+Md6Swggu8w1az1AaGR6tqR?=
 =?us-ascii?Q?jnJ0txHydQHNFlz/To5H+edVNg9O94+zTt1+8JpWMtpMp2pqWgGa8sq2gTz7?=
 =?us-ascii?Q?hOboQzSPqyFaTcmhuUPmF6qR2Z4mU/F6ssnP13Kd50KmJ/0DJclEoI/9b+KL?=
 =?us-ascii?Q?x1Lc9o2DPFkKBZlzu0xOI/6LDNa+C08ouKAX4qNbQptHp5mWQ7x0s9g2Jl4M?=
 =?us-ascii?Q?d946fG3ip/b4DWdYCknuTwxqbkAFINlusWTIIbO9WswqiR/K8ZQ6NspeUh3s?=
 =?us-ascii?Q?C8zO6sQCv3Eeucrt5B4SJhJ0Su2G5BQ6dw4uEnTKi2UdOgXguc4IKxXLCoL+?=
 =?us-ascii?Q?f3AUinvRexaO3ui9d3hQcLVlP3gG93yb0eqpASc0cl1s9t+//LBSoNPyh9uT?=
 =?us-ascii?Q?gaOWX/66E3BTcfgU4Qas4SSAhBFb9dhtfhfYH4EsZ/fA7eWcCcbxAS3K3e+H?=
 =?us-ascii?Q?ylM956SXlNQEUP8qyzh4o0/3kle1wxbF/Te4tStWcMjQApgCMnVRURVXw8qO?=
 =?us-ascii?Q?V2MgJJDWORuqGgv1R036Q5rDHIqmebKCt31vh40moBUj7sBNswufriCWIYUb?=
 =?us-ascii?Q?1ddJ8/FZtAjqb1Ox07fKBiqzt02qq9V4NKv6uKEGQIKnd4O7o/PFdC3FIZzo?=
 =?us-ascii?Q?pveMejXLkGJ8JYUokoj/7tBKcLcW+YHdj/k1/cmmwqR0vzkFo3LimJYH7JZB?=
 =?us-ascii?Q?y8p3tiERoHg2r4rJ4zyGDKdoagjkj1mV1T0EQoZZ1lFuQ1+X4E1QDIpKRfGY?=
 =?us-ascii?Q?DsiE6bN1M/wkoAw+HOgIS54skkGbVMXtKc9yR09oFQMFlZ1eP4ftvZWcMCld?=
 =?us-ascii?Q?dthEm1WJ6Vez0yhDJVus1yrFFHaxpAdl811pJ3uRyZuimxR/YuZz236KD/pa?=
 =?us-ascii?Q?K/QvN96x78bLR4gtkmCg4a58dwosxkg36KWeWPNC/Bdzb9eV5+/8Pzifiz//?=
 =?us-ascii?Q?arIPzQxEs2o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qFABiarpQwdVHrvoAzUBL5WbaHtIojew4Zy2Zb+zL57e9oNg21ay+vhOmPw2?=
 =?us-ascii?Q?gWYwV8oEpN7cWo1KnomE7Pi8w12XUwoF4tgtK0QLLFyovxXH/Z//Pkftm4kv?=
 =?us-ascii?Q?bFVLJ9/g1AsHe8QLNdZPeQaxW/gmKT85yuUedhhWyThONxqI7MgkrutSGOZ4?=
 =?us-ascii?Q?5B7Dhh6aRxWaPF2xKOf2ILjwpPkw7Y5hTosjIFhNO7DzYnKSDZ3kfiLB1DvW?=
 =?us-ascii?Q?f6UmPS1SMY0JO0fib2ZdrLQrzKA8fwbXYg7xPTqghY0YsuoAg0+wwWzFMAQo?=
 =?us-ascii?Q?ulfasO8LxayNbEEySnMRGy5AhB1PBeE6PKU50bnr3bsbOeZu/+SmL6FDTc/K?=
 =?us-ascii?Q?z1TjXZ6jG8uxqUoi8uNO374t5GSvh/1/e+Pq0GaQBXSlIylD5WiK+TLYl/Sd?=
 =?us-ascii?Q?EFGeiLHoYTq6IbhaeZRHyWpn1kO2B8MfTcf0qPO+F0MHqXP3McDEGj0EJbB0?=
 =?us-ascii?Q?JpnHFomFvc5E/N4PeYI/p4RP2L2Gz9sxefqFiskUcUMS+a2IYQWy6pfJDglO?=
 =?us-ascii?Q?6W+eNMjRuKQzN6rFB8/GKvHH3JXM5kZwE8JUfV9NNyxn5PsTINABy9hfd9Bz?=
 =?us-ascii?Q?SawLY4FT3ydsLPJ9Lu376SMIMTiqGNFFTaBqHrf15FKaj8f89EOS801U/4KW?=
 =?us-ascii?Q?6S3IVHU6ysamhkY56XkE3rNNj+/LbPjwKqHh/Ztg8uZGFCSkl0PSX5YsctNC?=
 =?us-ascii?Q?mf2H1i8w/R657+bOeYpW/YswEbfT0s0pQSHg+0DZUnJ1JwiwzXL14uMpuqmn?=
 =?us-ascii?Q?oR5U60j3ZfZzGoq5g4ckCt5U+/qBwKkcCi5PeER95CKguRjO5ww5FfJRTuWK?=
 =?us-ascii?Q?d1dXxALMU/E7sJzs0yTWgS0/VJR7apsq8QpMYlBGrXZRcjTOyinZhxjxp5hk?=
 =?us-ascii?Q?90RjN96kbvAH0XOxxXIk1KZweBpnCg9sXWHsP1lQqrGQDZompZqRAMXb36+2?=
 =?us-ascii?Q?aG3GfwIXSGnUREiq89YmZkbDznmEswCleiS6HHqpoiMmz2Bat8Ee+z0tIT5I?=
 =?us-ascii?Q?pwDrSgL6OHtEBTm2rXEjf4wUYyxj63aS7KNueX9Fh9DbhIzmbMstW4YVR+VW?=
 =?us-ascii?Q?GopnkWCvr1cPnaCM1xtg91sayYDBopsZpLZV+CK9Atu+2v/daxwd+EaXzjHP?=
 =?us-ascii?Q?vWsdiIX8XvePDex1erBaxJ35Bvp75PLg3yrqdC3kDO2h7AMbBFlNgsM01PW0?=
 =?us-ascii?Q?pFDAtOXkXBUZWK6ToFRvN/YtOlZHOL5b27zF4wygJTYZ2BeZxCs8Hi6iWu7h?=
 =?us-ascii?Q?1+s+SmFx9Z8MrVmI7l/QIn+z7O33KmRAa67faW4rnO3hlJJ1EQQvpRHNEsLb?=
 =?us-ascii?Q?d31OcF7ZywZtuogghdp37HvyWq5Y8YHgFAyaGrIU0rYefIVi3HTzXfsuvkI6?=
 =?us-ascii?Q?pGbVc60vb7Ol04jawU96nm0xn8kNGKTKCJAdy5RTE7KY0bVmHNIWwXGc4FT8?=
 =?us-ascii?Q?RDJ883GQ5FViaupMby8ztilDwv0ZhoWUqNxIdoGImeFZ9FjaxvqA5wGjhEEo?=
 =?us-ascii?Q?qpogZHfbaLmz7wJJ4VGuyrEs0savdw21r8UYahfDPJ4zLlECUMRIuv59cs6j?=
 =?us-ascii?Q?1li6fiUZqm7bRiZ/qv6lwASa+Bqdy6jzEzNhPG90qxEiAyALu84zHQRUve6V?=
 =?us-ascii?Q?NA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1570c3d7-5653-4f8f-1879-08ddb83173e9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 23:54:29.8639 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 73qoapZopqRHixR8/FKJdNHPjiQevdiYFQJDAaUjEltVg85snqEyp5hh2c3A0D0Y0P/3Qllk0u0mZSitHP6bSnZkFcMLQG7RJmoCmEIrGGc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8131
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

On Mon, Jun 30, 2025 at 10:34:40AM -0700, Matt Roper wrote:
>xe_step_name() is used by xe_assert(), so adding assertions to functions
>like xe_device_get_gt() will result in
>
>  ERROR: modpost: "xe_step_name" [drivers/gpu/drm/xe/tests/xe_test.ko] undefined!
>
>while building the kunit tests.  Export xe_step_name to avoid these
>build failures when adding assertions.
>
>Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

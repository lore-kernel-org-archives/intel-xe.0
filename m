Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C9AC27C75
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jun 2024 15:24:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3283D10E0D6;
	Tue, 11 Jun 2024 15:24:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jMPGAuQV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3DD310E0D6
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Jun 2024 15:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718119467; x=1749655467;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KsFy0eHTAGBxbj08zv0269Zx0zTVhsRh4rmQsl67s8w=;
 b=jMPGAuQVbM0v3jzPV7Oib/Ao+fiAEXFsCEsg1EXxi8qSCsRfRHLvh/5g
 HyrrV9jnelu1Zsv13vgg+b2sgYTOyJ4EPnYksx1pbc5d9zdlMKGqvJ3vh
 YREw4VFRoYHzM/ZUPn+og9tbNE2e+/k4MKmeLoznk6ikUG9hAFVr1DIdq
 +l38yMxmvfmX5PG0ytjmOPyyF1PtrO5rJDv3T3iQnKHxQYUY5/p8STMYp
 MPCRDODm0nqHnLM7jaPv3skK+gML8RePGUXtc8yetEtK4OoB5DjEvBDbW
 RjGc0OSuvDSofH998dGvcsK5wII+rQ+a1PUh6ldpfF7EIrhL3VI2EORJ5 A==;
X-CSE-ConnectionGUID: Zbjb7u1dS8iJMzpXVwYO2w==
X-CSE-MsgGUID: 694Jt80aQNea0+qQG3GThg==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="14964208"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="14964208"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 08:24:26 -0700
X-CSE-ConnectionGUID: KFRFYaDNTCW6EAOXznmLvA==
X-CSE-MsgGUID: KCWXax71RvGBQQkn0svCrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="40180708"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jun 2024 08:24:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 11 Jun 2024 08:24:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 11 Jun 2024 08:24:24 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 11 Jun 2024 08:24:24 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 11 Jun 2024 08:24:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BSfjrksf7hwkOiJwE3YahLP5PVoQzsJsRy/fF0nPaDxU1BPvv1NY78haXx2DrsaEVyOuaXQanAhhkNj7xYscQVZ97JyqLF9bf2+oUm3N8joNsiyujzGQszCskLfRphWI1OzHMNqLhMbpuzglRcOV3MQmP2x2Zjs/Cq3bIUXJ0hKRHbvRXf2BLyJ0mZtLVLMX4Fz2G9flwB+tijfZndKbJ/agsG5ESIgXyMA22+oktAXmLIsYxcGMwGwocZVI771NiSZUXqrBNopwhxQB7KTJPwdGzfpSBxD4xTsxD6hYRB914SPkCplp3DNuc/HJmirRIKEoiI5PjNUdTYN8EdMJag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V7qhdfJUR0PxodshcutHgq/Vz7GIzVv5a6L5RHbXgCk=;
 b=CMNAVXAHlZ5k4/d7tpLSF8XBUy+jh6tNB0XdNZNJQb8CB/BlUG55lu3g1RI+6R8OsuMSAmXdbbZb//B6qLkrpPPAw+5VJGuzfUxpkbJrPaGr86jOwwMWau8DywZY0FY0UnJK+rwWZddCqLF3n7pI24wOgXVAefSA76lkTUcNB5twVEGhmQCAZK4hgs/aNgTXXn9bKn6tCVQM0Or3JOh9uz8MeDjp1tr82mQAcRl18iyFd8Hto+nVKq1vn08HvfzLemZ4e9Phh0TeqXcgYV3kdKkyzvgBzneLS04dZKnIzbL9vyzYYiPjeONGwg+k+8bFn38Iabc/tS3F1aOy4KoyEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH7PR11MB6380.namprd11.prod.outlook.com (2603:10b6:510:1f8::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Tue, 11 Jun
 2024 15:24:05 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.7633.036; Tue, 11 Jun 2024
 15:24:05 +0000
Date: Tue, 11 Jun 2024 10:24:02 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: Re: =?utf-8?B?4pyTIENJLkJBVA==?= =?utf-8?Q?=3A?= success for
 drm/xe/xe2lpm: Fixup Wa_14020756599 (rev2)
Message-ID: <ygwgnfgqa47dvrewf7ms2xjszbwsrrnkkqb2gtliqvh7xk7wzn@istssts46gaa>
References: <20240607122528.1048610-1-tejas.upadhyay@intel.com>
 <171776703815.26305.7341022001332187419@a6498e030952>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <171776703815.26305.7341022001332187419@a6498e030952>
X-ClientProxiedBy: MW4PR03CA0352.namprd03.prod.outlook.com
 (2603:10b6:303:dc::27) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH7PR11MB6380:EE_
X-MS-Office365-Filtering-Correlation-Id: e0cc658d-15cd-4c0f-3228-08dc8a2a87e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230032|1800799016|366008|376006;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?drAgItsEZFhe/L/ySCNtOQH69YRY4xqb5Ekf2NfdLGUWYr/q68QT9YSiRS+n?=
 =?us-ascii?Q?eDCfqT2sRrZPgyaU4cp8aaFw7FAzeircV2eHJ8mVNVTmzQop8LRhVoU4Ag6w?=
 =?us-ascii?Q?ZHLYHdNgMMAafpHQ2rkQc22JMCcnTTXQW3h8xzbQe37EbeaSrEEdxQx6BC1s?=
 =?us-ascii?Q?JdMVgn5v7h1KjOG5/NlXK/b2ElIRPoBS4I4TAXp7IpMywetuHvaCZuQbTbwV?=
 =?us-ascii?Q?l2P5MHNp4UfRsGNNGZ2AXdnAtLOn+v8013Z1b2eBHkxCwAzL2J1wZJvwAzlW?=
 =?us-ascii?Q?6OBLuc1hS8nMZD841AAZ2u2E0LiYvM/IagyOXOrBY1lAuSIWYMcN+rmvz4pq?=
 =?us-ascii?Q?uYiu+UAqxXRo4wFsI8Ixz/9Ib4AEy+Egi1v9yS6z4JxVTnHRe6+UUo5D/BOV?=
 =?us-ascii?Q?VJ1LlovaLwcc7ZqIQct5VqgzMxP3DR8AlEUSJdeyE0ooifnJd4ADpkdlX0pc?=
 =?us-ascii?Q?67ofbKeosBYg2JeDL5aKkBunLDvr9sgoLSfeomzOzONRYetvHIilpXo3vNlV?=
 =?us-ascii?Q?LW/jr08/8BvmS283UMTsohSlENvAGwAwXKjqtsykZFfHKVK7hfm7KNP9zugc?=
 =?us-ascii?Q?24HUtG4OIKuDXo/cFByJllYAoya9M9OjKwftuoSc4NX0wglv2WQYJGl9jJtu?=
 =?us-ascii?Q?N5i6+rJ6M2JWCKfZcd+7YQQDicYo/QEtYlmdghMytzCj8/pIsXaKzn9o9rbd?=
 =?us-ascii?Q?VwVHe0xFC1cXmKvxZ+934p0HjDhc7C5wDCGhvrBFRzToq5pRLi/ro3HWTqli?=
 =?us-ascii?Q?m1duJHYrWLjhvthHzCPSPwVft6cyg0/7Ot+Oxc20jQr19iUN4hTnSTdeIBXN?=
 =?us-ascii?Q?44sS2a62MA8hiNdpzYSw4yG9n6zvJc4I/fwuPD1afzBaiyI9PWW3NQynSorW?=
 =?us-ascii?Q?QzaS55TSFPwRMiuMFVo/qs+RRAbD9VmMI/n6ciQayImTMdjNvRTy7kvinWCh?=
 =?us-ascii?Q?NJ8SOOSsbmYttzIxdgiEOqG+ozKvdl4Oyza3G9iPM6ySna13+nH8m1TD1SFM?=
 =?us-ascii?Q?G2wXSq/F99cIbHoSrjj4MkJKEctxz79k0poY+0ORDOg7CQmKPxQN9P8g23uu?=
 =?us-ascii?Q?jd3A6f7eQCnd06I2D6EdM0Ad3M6OA0WbSSjb/fhMrZHFXzZpCeEdFqwiyj1w?=
 =?us-ascii?Q?yoXkLnBBnjRprdkIbvZi9tyBbmGuOcHl2hfdYnUPSRH/J9qIQ+kKgpx8Mai9?=
 =?us-ascii?Q?zeSY3di4UHrUt0XUWmZ5lrgdNpEcrO555vwmaVRKDRtNGyYjuC8TAQan/4GW?=
 =?us-ascii?Q?kfrIxqISr7ST3RdM6QAx+/vUVYhwqGtBKzZck6qQsQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230032)(1800799016)(366008)(376006); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pvdOlpGVY6Vw4jj+NJTylcyVRIB+4HClVxYbMMlJ+5ohFojBUD/nd/ICFepc?=
 =?us-ascii?Q?bZAs05hCI+MK16GWtr2/cpFsfCx+8qy+IBp1/uFYsHdN4uGV+eyeipn7SJw8?=
 =?us-ascii?Q?Soju1Q/J+AUgCxesx0wo65+iRJCgkYHb8ciAsT49ojYCnK2hclqkGRdNWgfp?=
 =?us-ascii?Q?MynN/V/suruP/GasbecKYZrgyc8DIc/cp54jTNigNYU+80TpxdZu3pYntCGm?=
 =?us-ascii?Q?AjQpWVNrtwEPNyKXF/IoxpYwVMDXWGIdsMqsHzghCWFk6wHezzxbu2mShxV3?=
 =?us-ascii?Q?7A2/F8kzD/+XiDIr7/fXpNTgannxKguNeE8UW2dcoHHlm+7o4bVAbTiqNQVv?=
 =?us-ascii?Q?Ky52S1KoXkdApvgVFsxTfKZ2/oRyW7Gq5CgxZ01/Vf45oXi3iLzbtdHTLNBU?=
 =?us-ascii?Q?cmV/IpB8AfBho4/7K4ojkUhyectv9byT9a55NXF/hXhKrF2jxe0LW6kW2Ieh?=
 =?us-ascii?Q?zREfNlvJSSxrI2sGneTRZaKZYG0w9m4zkgNM8aarEw85JP6UzHUqqtfPo0qM?=
 =?us-ascii?Q?Idsy0h0tT9kSWtQ4fAEp23QhEXTPmhvhF96Z6OO1Wd3Cdrnn8eSUXiQpzh1X?=
 =?us-ascii?Q?uso9+lU/dzmVcaownPT922RrQusQ2kazHuSfgzWenj1Y/F7HTMhxwpWZR5pY?=
 =?us-ascii?Q?S7sWC1htEuwv2Gke6l0i6UCyAd2T5MwH5yXUU/Mej1Sp2+LSP6YT5dzw8gy5?=
 =?us-ascii?Q?E9IonrJAmKR4OkoeT0xnOxiaI+qbkJA087gh2dj3Xlqb9BTspXxx/0Yv2ax/?=
 =?us-ascii?Q?GNEL9na+OuJeExs9jdogrl4RuXO2iiPc871PS5dE8qnu1DCmY5gkhfJasp33?=
 =?us-ascii?Q?7sEbZDfKWHr62XtSYDtKy+rwXMjt6pjLTaLJnXG3G1v+Sl/9TSUcYkDB82ZO?=
 =?us-ascii?Q?CnCvrWrLS7CnzOEXIlGrh9a0N78YoD8rxAsPMRc61cfmbK9msagw8BYytwHt?=
 =?us-ascii?Q?ieFcpBQ6oUXnJR1kuC7zFZfgiZoxCy07aFaN2JGPBZIrJLU2mbli7YRhSgVu?=
 =?us-ascii?Q?u/gKspAcC41m4+jW8N9IVOiZV/jVB9fN0n7lnP+23MaA4EuqU7VfqrgTez1/?=
 =?us-ascii?Q?dyeDMqOLv+DuuZwxauKSC5/+IX8f2KkRA2o+AKQ+OFE7BIoXKPV0BJLO9S8R?=
 =?us-ascii?Q?qS9EohJp+h18h1Npl/ISlJFT4ovqtXDEg5WqotzTA7vjrlnMl3LUIErZK6EG?=
 =?us-ascii?Q?ppR/ZAQpGdDxgUNbMBaszXosXh8UyEW2nAnrzj4d8Ue4hUpZtPjcGGWfk8N+?=
 =?us-ascii?Q?Mp7f5sWS/U4TWArOerSB8MG/JSaBKL9S2DiYtfvz6f29Ws28RmpfZWnFoUvC?=
 =?us-ascii?Q?U40XtJ+eUcCnJq28jEofD4uSZJQBiwHtAoX5zLF8CaZjAIcKmBDexFgYvjP5?=
 =?us-ascii?Q?3PieXmrrQUmgOYuqQhEILDHBbNeAwpPbWL3Dc0drDD2fhFPUzD+wwGLkG0O9?=
 =?us-ascii?Q?z2hQuAB9VMU6PGctkg4lU4/iThBCJnEIDkNMLXdu4eaUXx53w9ZRTDpOBjep?=
 =?us-ascii?Q?wYmMz2GLY2avUZWU5N2eoeVk+w6T89K3iEz3tAkbFukPy8fDszZJFm6IkGvr?=
 =?us-ascii?Q?AxcLIeVLdhEoODh1+UR89gC8JSy/wXcVFZkI5lcIpOAhYzJvrfw4PHyfyAO+?=
 =?us-ascii?Q?TA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e0cc658d-15cd-4c0f-3228-08dc8a2a87e8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2024 15:24:05.4186 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lIeZgb/9Ehqh88QfkspBhZ4w+85etjjcHjEMCIZzb9QHw0fumR+ryoqhVniyTEyXb6EoThs64VEBtPeYVceVnvd0ji4uOeB/yv5A9ZQuTD0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6380
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

On Fri, Jun 07, 2024 at 01:30:38PM GMT, Patchwork wrote:
>== Series Details ==
>
>Series: drm/xe/xe2lpm: Fixup Wa_14020756599 (rev2)
>URL   : https://patchwork.freedesktop.org/series/134571/
>State : success
>
>== Summary ==
>
>CI Bug Log - changes from xe-1421-cacd33d88259632bb0ffbfff343e278fad7f46e8_BAT -> xe-pw-134571v2_BAT
>====================================================
>
>Summary
>-------
>
>  **SUCCESS**
>
>  No regressions found.
>
>
>
>Participating hosts (4 -> 4)
>------------------------------
>
>  No changes in participating hosts
>
>Known issues
>------------
>
>  Here are the changes found in xe-pw-134571v2_BAT that come from known issues:
>
>### IGT changes ###
>
>#### Possible fixes ####
>
>  * igt@kms_frontbuffer_tracking@basic:
>    - bat-adlp-7:         [DMESG-FAIL][1] ([Intel XE#324]) -> [PASS][2]
>   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1421-cacd33d88259632bb0ffbfff343e278fad7f46e8/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
>   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134571v2/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
>
>  * igt@xe_module_load@load:
>    - {bat-lnl-1}:        [DMESG-WARN][3] ([Intel XE#2016]) -> [PASS][4] +1 other test pass
>   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1421-cacd33d88259632bb0ffbfff343e278fad7f46e8/bat-lnl-1/igt@xe_module_load@load.html
>   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134571v2/bat-lnl-1/igt@xe_module_load@load.html

great, it indeed fixes the warnings.

pushed to drm-xe-next, thanks.

Lucas De Marchi

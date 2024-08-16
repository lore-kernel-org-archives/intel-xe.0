Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C92DC531DC
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 15:13:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25B8510E7F0;
	Fri, 16 Aug 2024 15:13:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mfCtidHN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9F4010E7F0
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Aug 2024 15:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723821238; x=1755357238;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hziIZ7MKSCKj9nEXiytralDrf2AsxZR2m5J0r0cPNNk=;
 b=mfCtidHNnHuzdpLTtJv5UI//xyjfEGB0VUhediFQOilPkQNr2Ic7a+vN
 /2k+lyfQ009KwZVLMQCBP+L8/R+9MyLRS5/7LYvd2+EyjjYchlqIPDPA5
 7soqdj3zDMWR9WMl1L6cGMyPB4X8nlN+p/IqM6WhZt+WFCdfcWuDxWYDq
 Z9DPP3kdp3gHjT01d4wo/Z5UoAlWNAiBgom7DHY5/pzkE5NRUL93w4VR5
 bvRRLimgVACy4OGQEKWiDowOVrAYsmmLofsfBfO8XGDgMEo9YsVEKBRGy
 iIHnl5xtGaQY3XXU8kZkG/1/+te7pUfS669AM65SM7PlF0pg4I//S7/9t w==;
X-CSE-ConnectionGUID: udN7jGJFREOmLHqbec6Pfg==
X-CSE-MsgGUID: 8yHI+JHdRc+Sj6KXlG5j9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="39574467"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="39574467"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 08:13:58 -0700
X-CSE-ConnectionGUID: 49m5sA4dTUOGJjM6jMBJ1A==
X-CSE-MsgGUID: pl7fExjHTVi2ES6+Qr25lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="59980080"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Aug 2024 08:13:57 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 16 Aug 2024 08:13:57 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 16 Aug 2024 08:13:57 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 16 Aug 2024 08:13:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NRYLgTBvl1KxqIqMtYZ04OrkLpgJl4tGYkc3OTXdRw3i7CHtt2EaLFq8jd1hrvAihOGttStUEcgpIAXcMPxmf1rK0SI0uqiEpo5XQ1+CYa5SmT/UThU4pBYJjbcqxd/9PTr8XpbnNZ7b/H5tau9SRzEvMNiLCawD5v3ezd/uZBQ1JQdfB55MO6ivX1fG1umaZo476dd3Y5BOMFdrBIOJyOE/ZBWkC0Kbl8P/jS7d0VuwUFXrZ6pu2i5uehA4lS0r+aX8Kyfwup6FV9koxOai1NcfStSbLE2Ih/FeYcKLirQCSMgYy8yrFsdVRZsA4sVc5u6cXxNBjGLkWditEu09Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0dCi5kO1Q1tKDXQ0aHSGNSgymty0321OPk3ouNDNfts=;
 b=lpR28N0LD0LO/jRVYcViegwMW5iy3NtUdmfpnO+gYytiUrjGRKzb1zsHQksEeyEW8X3QVabrChcVA7URz05i/49fu4p8ZWl8HNIj4VAq9KVw5MgeKTUl6e3cwzesnpvryDDUHRZdvJaPlfVuLAl6JV45hLNqjXvmB+ty3GebWm46Ypzn6cVRagIg4epDvxr8S49O5kbQE2wPZa6bIWjO1Tev48G9Ebwh7otkV2sS/mnnmQC17GHrUl7xMj60Od5RnhppO3ISRNEZyZGIruXfKpeq5v+o40ixQmlOUU7xr794Wp7APlskY+Sfusrc5QQKA0C7UKmuSeN9v5+6lF5vTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW3PR11MB4585.namprd11.prod.outlook.com (2603:10b6:303:52::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Fri, 16 Aug
 2024 15:13:54 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7875.016; Fri, 16 Aug 2024
 15:13:54 +0000
Date: Fri, 16 Aug 2024 10:13:51 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <jose.souza@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH 02/12] drm/xe: Introduce GGTT documentation
Message-ID: <lopckf7ujhbodevmscgxfhmzvx7f6pxwyuszdkkx7na5fhmelz@yiiqirsgiaje>
References: <20240816150243.87596-1-rodrigo.vivi@intel.com>
 <20240816150243.87596-2-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240816150243.87596-2-rodrigo.vivi@intel.com>
X-ClientProxiedBy: MW4PR03CA0247.namprd03.prod.outlook.com
 (2603:10b6:303:b4::12) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW3PR11MB4585:EE_
X-MS-Office365-Filtering-Correlation-Id: 9746758f-8c0f-4dff-c1aa-08dcbe060b24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|27256017;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4YpHb8fGQ/CEVmLyWBSCGrhhflD2QTDoHI5TLRFXzBGbBySwNMwnATe/wdUz?=
 =?us-ascii?Q?1ttWg2OSrMzBBi6CbapSlbonCAVYZ/IgSGD6ESvORT5hLkpNzw0jB9oQydwK?=
 =?us-ascii?Q?Z1dgZgeJGepBnfXtSPlZ0mS56g/J6Pxzt0OFVp9qnPmL8MPLybthsHjdG7QB?=
 =?us-ascii?Q?bNql3vIUBDaDFTWM0v+ppMj1iQiOIfRFKljvrkHMYr3EzsOhXV7lfudAiE3j?=
 =?us-ascii?Q?R4BTxC5sbxgd/SLeDxNQefOH3tNdh/OoRVYCufn9w+ez8xMKh1i0Jes9BBM4?=
 =?us-ascii?Q?ZOnBV+SUgWVDG8HW/j/vI+ObRfJJcQb4bRpg6GOqGcwajH3LKFBf9lPxiOIY?=
 =?us-ascii?Q?fuSwhvaVZfGviy0Y7Lcowci1vmMWzT31gqHna9mjRqU+L+/MbzMLG8pv8dcG?=
 =?us-ascii?Q?sAxGvD9s3tEYPLWjepJmBdyamnBTLfw1FNYqeILLqcNHrOm8c89GO7YPxrhs?=
 =?us-ascii?Q?/JXg0S2EI+dmgIiWm+bq3jlGqsgVcKTZHq63AuKMjtiw07kyGqbDmNKe0cYc?=
 =?us-ascii?Q?jPtwy0tCtMGBMXSZd/cVT6Q1UxwM+0BvZa9M+szej/7MKVagVXOUWu2xIVLP?=
 =?us-ascii?Q?HRpR8vR+SMtEIWA92ZDdSu6VaoRPZ+EmRXlfZAfAVbLe9y7T1+xrvSDAkLM7?=
 =?us-ascii?Q?h2g9bSvP9ysW8H32aljy9+FaUk32Bkpmd3q38YygCuZatuxHiBNlajhYwRsm?=
 =?us-ascii?Q?yLWnBGm7p3WPBTt/b6S0vgGAvPXMiAYHaD+TPwHlxcu1geyCRn7vjeDhi1gl?=
 =?us-ascii?Q?CvDWJAgZt0KsXPDPc8Pi7mpa08HywaWwaTed8Wf8/UYGkPK6ud8yUvhTXaJY?=
 =?us-ascii?Q?lOG2AejDRM2oPydzVuHuwyKua5AdPrxC3Ofh3rnyGiuxaVUd34ByRHCivW7E?=
 =?us-ascii?Q?NktWgiFfMBVbdqgqj5zyk5dX/lJKJ0Fe5PBvIBiZ1RrTc4UWjfkQ+jIaVTLT?=
 =?us-ascii?Q?wn2f++fyB52hnyyHef2M5exMaWSjhOZoM175YeSYflfh3M0mulMDbusR+au7?=
 =?us-ascii?Q?LHuHazetKTKOz9j81brCpPXuq1aYb4XBdgS7SRLUMyn7uqTanUMflfb83qD9?=
 =?us-ascii?Q?S/pWlHrb+KRCpofIC+1hdRytKPcoAf5tR6ocPaSWDMURTu/w2KVEW/SuUTWT?=
 =?us-ascii?Q?fsxosTdAYKAkVYmPy+cP1XnkiudQ83JgUQL25rwXBjZ5fVCH/j+bpHs5NBhV?=
 =?us-ascii?Q?+jnENL7TL0Se6veYVrbMrSsCrItI/DZEAKTtGERmy+q2NXcnMBw+nD5zLj1s?=
 =?us-ascii?Q?r+yUcJf712pHRDFrciFuefbR5wodlKyXDeAMGror7zqDIbtwakAU9mO854Al?=
 =?us-ascii?Q?oPoOrtEXEl+LIKI6082e65SdTkjyR1oWqopUL/JTTWkVymyAPjhAJBvLlDh+?=
 =?us-ascii?Q?AnQz5o03VvzmkPMGEHULgY9s7+RQ07W155TU3ChlPhodB/dRiA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ps6YwrvuWmuaUAQwAqfErwMp7EcyMn5MQDvmkDzTYI0az+mPLEW6OoUOeGdg?=
 =?us-ascii?Q?9+iCn5eMNr3xjZKsyvogaFbQYnBjZpk/ZSbSFeaNaEkS43E8zS99NRhKgefl?=
 =?us-ascii?Q?FljlSU3Cqh1UQDQ72VBZPuzFdh44+onAOBivgA/qcUByBS67VJe8W3rEH09H?=
 =?us-ascii?Q?CsnhND0dTnwqf510Yn4hN3OMSUhtAYw00bp0UWvK0BBYhO5V8gMyLFpmpye2?=
 =?us-ascii?Q?JkmWIdY1telD5ZRdkGVIAPXF0eBquyP6Eo4V1B1ttaT2yioWpVwxllmmM9rd?=
 =?us-ascii?Q?+oOJPNCO2TswBheljNs8+oMGJx0QLGrUd8SFEPGNWXmCWx+SDSmkByWcvMzb?=
 =?us-ascii?Q?Y5ul+RAw1FyP0lg1GnVWLxZCSKX0XjRtTHvbrnpg4+BAksDTBJRkkWZo0sPg?=
 =?us-ascii?Q?pKFw4Tj1fuayY9RSXohOZpsZ/JYMVPGNk9pc0XH95cUvgtvPewzvIzzsJeRa?=
 =?us-ascii?Q?7e15fUxJYumcYbkY8g2VAv5rZsCcj2TY912Qo06Newe0yJY15n5Q94QWjyaF?=
 =?us-ascii?Q?0fwjX57/yNKvz9rva9s9YLMedwQKmtV2iXyqP80kXOZ92j0s+DApWVo3+8wt?=
 =?us-ascii?Q?tMQNEbvoLjW1pbvcbLFi03hNK1ZWeGvg5q6p+qknZq/tWn+De3HgZy3sKCZt?=
 =?us-ascii?Q?7oE79ocqCKUxBpk4pdQspGipxUkeZVYFdLSyQ/Oes4TDstfcWwNqV1gfZg9y?=
 =?us-ascii?Q?gSI/fe/8Mj6+K16vpyFxpl++pz/FFWtETIp17AzcHtbZfYv/8GK3kldEGvSt?=
 =?us-ascii?Q?TIObkes2qtIlKq7KUDzBb7OPGKJPifpEhtkEvwcA+TGL4mmYMDqqIKIwKKLj?=
 =?us-ascii?Q?mnEYqR/lt74MHGurYH3GRhd6flHTdRpIS1kcnYR4TF7QPd/1Nm9wl2geeq26?=
 =?us-ascii?Q?ggBoAVJVguVmMTP5Lf0TO7Dz8QnFiRNn9oFkbWPW7kbIkzuHSvDw5So+djpc?=
 =?us-ascii?Q?QYRLQlvpO+EoAdu56dMxfoUOa5FGFUg9zxtQHqwlKYIu8yoGapkyqco6e4+u?=
 =?us-ascii?Q?6tgHtSWE+BlPwepOhEHF9IIduIKGnT1Fvfxi2tdfVkVhqee2YT5WuaX2Qxz0?=
 =?us-ascii?Q?o27MoiP7RxrNY+qbO7TjN/VsckSi4yConJIKrXXYEekIuL1EROv44UgLm0qZ?=
 =?us-ascii?Q?kNrgcxdfl56EodCpZnCfykKjpHD886gfE2AFN8SMjFXktiw064+VcM4gEQjW?=
 =?us-ascii?Q?Ld7xBOCNZGXdwvpBFe3BxVdL9K6yO5AQoi5Kts88c/C2rhkuVexsEFx8DmmT?=
 =?us-ascii?Q?hyL160tSubGU+mqYn0LAwYY/gQYy0mNCiMykemj5G8XveSYyHGyv8BpTiIj9?=
 =?us-ascii?Q?cTz/4fqIX7LLFbgWKXvcAuCxAlaJUWUSXlPqjCsG0/DNkttjxNWdqVm8vDm4?=
 =?us-ascii?Q?VNbKMjuvfBXZTbusm61tVkLa8m8DkJA+QFCPAGfLtbSG+TiUKSSMq5rsh+aF?=
 =?us-ascii?Q?7mQk0m5vFFKSll7S6dhR7Zc1lvc1klDeRdZp2TqDyMKQH6l1GV4awG46Gh9Y?=
 =?us-ascii?Q?DylW96t7/3LKywQtr3BHH2ugPe8elfDv7hXDdKcRL06ZY4oUFgOoDqhe07K1?=
 =?us-ascii?Q?Ps82Ti8RPP4t9NdNuWiJmp60AUYYXO15gd96OOa9gkjj5TzCCvWM/l8EB4g0?=
 =?us-ascii?Q?zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9746758f-8c0f-4dff-c1aa-08dcbe060b24
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 15:13:54.6859 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zmm5SCkh6d9XepUzlVMcZ6HN1amvaFo0N1fA1ZEUUy78yhIOcCfmbMdC5lm5sWpEtUr1TgL2fQnLF3FNsX2uNJlAWVxA/J+HHqkZqYGqY+U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4585
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

On Fri, Aug 16, 2024 at 11:02:33AM GMT, Rodrigo Vivi wrote:
>Document xe_ggtt and ensure it is part of the built kernel docs.
>
>v2: - Accepted all Michal's suggestions
>    - Rebased on top of new set_pte per platform/wa function pointer
>v3: - Typos and other acronym fixes (Michal)
>
>Cc: Matthew Brost <matthew.brost@intel.com>
>Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com> #v1
>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

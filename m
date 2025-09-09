Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 180A3CAC582
	for <intel-xe@archiver.kernel.org>; Tue,  9 Sep 2025 20:26:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8A9C10E7EF;
	Tue,  9 Sep 2025 20:26:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TA5SmwMW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2503B10E17C
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Sep 2025 20:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757449568; x=1788985568;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oBVTN7PIeVEI1KQYZbc4nS5RunPaH+BMwKbOn/L0k1E=;
 b=TA5SmwMWBjiG5QaMLRAnTuebQeD7q0dcQWtaVZ5e8PieW8nrqwEMvbam
 mXyF1CWKZfdhNXmBfzQPGYzVo1oEqTrxQZlZaDo0eqDNwWsxXxtSBO9xw
 J2S02Hjc2tlK1/in+reRsxZoJ0ynw74y0UAKhcT11BR5adWpGS4xhJQoK
 YmCHC+wvbh6kEt2f7sh/y6NkUMQpHltHdBjSwRdOXlWLkFoRcnMiFFy90
 /Nms1XBNGGn7nv42EMTI1n0kvS7SgH+cbGewJ4zXLKROD6lECxkZSQQRL
 i+yZZBSoUaRzBbmjGjKicKClAzEu29939904V+QtwyREdqQmXAXyZtHvv Q==;
X-CSE-ConnectionGUID: DG5DL225S++mdneaQwQ9vw==
X-CSE-MsgGUID: 6nRQ2W9qS8uLiY1PDSDB+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="63578647"
X-IronPort-AV: E=Sophos;i="6.18,252,1751266800"; d="scan'208";a="63578647"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 13:26:07 -0700
X-CSE-ConnectionGUID: +sILRY2/RRO8znBx8BIZZQ==
X-CSE-MsgGUID: AAqLqJHlSLi9QjRuHgHX2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,252,1751266800"; d="scan'208";a="178403707"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 13:26:07 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 13:26:05 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 9 Sep 2025 13:26:05 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.76) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 13:26:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ThhSurEJXSpHKQWQ9WAv6qyrcsVuS2EZUMPSgdjqge/TKxiix5VkLcQbbeZgaNRQHf/ZGDO30F6+mHoVg1Ahw6PgPEA6X09G5ZjaAEQk1Srv/YvQ8LmtvN20HIqZ/TjdGAuOWqMwuyTcdpuHBCiABhAxBGlSEAEFRP75jXiro/u3iCmOIB4RkEDMKcXDhhezxHNrLV36fbxGs5yQaL4duSgParXigbd//Ey+3JgJMRNO1SyYu9esoR7lBNzN1cfW6zccn9zYhiFunlJ1wE6lph5cf2waaDSuNJ+NBmX560RzUy8360HQInA0kwjPeNSxOArCOvtpjB2gz1gfIgwjPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nXOdeZ11hCNgq5J6j78ic9t9f57shXXw8hx3Azoddzo=;
 b=MUZt/+IXY84gkLqFrcmYKxB86JQvCzXp99uQFUr6mlQSNhqgn36yfJ4wb7ZXMBzoVvkey6A8EOo/LXy/JchHKpTBNDQcfAlfgxftbfKyrPJJ2lkj/hXjezNEZsHP/vWyxtv6NX/b8gzrXqiuMLnvN/KaJLsRu7U6oMg4AhfAq1+e3U83Ta1DMEAo5gUhdcZZ6cVPbMIAp9OBaC5Oto7u+iDMXlrqkByWO5KZtzQ3UmJrAAmZOrAnXO2u+DXZhAdGxT8zKbVplOg6o8GAG4hdH5eS+UuzOm5w/kVYSJ3ixy6+rGRvss2WxO+22VFoH+nVFB4zqomoE5khbLYw0+NDiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MN2PR11MB4568.namprd11.prod.outlook.com (2603:10b6:208:266::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 20:26:02 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 20:26:01 +0000
Date: Tue, 9 Sep 2025 13:25:59 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Julia Filipchuk <julia.filipchuk@intel.com>, John Harrison
 <John.C.Harrison@intel.com>
Subject: Re: =?utf-8?B?4pyTIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= success for
 drm/xe: Recomment GuC v70.49.4 for PTL, BMG
Message-ID: <20250909202559.GE150955@mdroper-desk1.amr.corp.intel.com>
References: <20250829235305.672287-5-julia.filipchuk@intel.com>
 <175656640831.287034.16387933912855998676@1538d3639d33>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <175656640831.287034.16387933912855998676@1538d3639d33>
X-ClientProxiedBy: BYAPR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::35) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MN2PR11MB4568:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c42959f-aff3-42ab-4b8f-08ddefdf1804
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iWH5nNnAZ0NEEg1l8xnOvcH4poWsXl4f8UA5J6hJ++IPSAc9e1PT/CnlEE4J?=
 =?us-ascii?Q?1imR3Og3gYTyIe0hebaVixldbun1V+S0eVT0D/vLLxGeDnVyeYyyMnmW3HFT?=
 =?us-ascii?Q?T4hjqwZE2chNtUp00KTvvLkmdh0ksGFhwcGgQLHVNYMMSjpr2PVjvmVsSzEh?=
 =?us-ascii?Q?sLqirtxnejYi2XOvQLk8m6QOFZQpp4RAnkhxPoWkVGS2tdEgr694ue3KxNn0?=
 =?us-ascii?Q?sNhOAYuscKp18Ob7IFnqlNTCMXTjzRQ+aantnsV0QPhMKiMBvmrhZTJc7+/f?=
 =?us-ascii?Q?p+Sz/Twrs8L6121i4u7M1bLP3Q0mS3iIXYpb7pqBt9OsCda+sQJNoopH5xVq?=
 =?us-ascii?Q?9mupIE6y4PSIIniTfAtLl83JoRrVRKdPceS37SDDdLvesGZDliOax7SvznGV?=
 =?us-ascii?Q?2zcAx8qAwDgZL6wENBJEZ+/qJp0laKr1YkwAEXLIX5aF77Be4gDIl0e2K4FL?=
 =?us-ascii?Q?dXr5AnUR/SZBJJJKQyBrLm9Jhcc9MBW65VL9LG4cIihPSEWQNfcqHj4NCnOr?=
 =?us-ascii?Q?GExQrqqPZURUtVm/WFntsmNgAXH6Y82j+N7eF2LRxFN7GAubuVZYWwt9ALLd?=
 =?us-ascii?Q?SCnAOQhMY/U0LH9NLBk2FAuvbJho8PA+ZLL3HM+kdJ26vHT/KaiaisZcPHn2?=
 =?us-ascii?Q?rEVoeWXQXmP563ET4cirQFLVDYvLfBF7zwiCRQV1or5FDqjqaX6P80YCyUXk?=
 =?us-ascii?Q?hdF428N7Lnt0BehT+U4y5XRe8WqwzX2zo59CMoXaIVZO5WpAJdGOV1U+BxCu?=
 =?us-ascii?Q?usvQCvF9d1AkYFcCsZN0l0vf4ke4ljPaqjZNoSWkABnXIH/yVmRPzGzgfuBf?=
 =?us-ascii?Q?2EpKeufXV4uQA7rWdxBvW+InEV+ygTZPfOdYP8bo2YqrYA06RihhL8cMqQWx?=
 =?us-ascii?Q?0PUdjWLGF+pwcy4IChnJvWOu3PBAfEnJTFCwy8hAHqpE2L8EaHN3pVYZnetC?=
 =?us-ascii?Q?ocVSpHPWo2Esn3+U9qy4RC31JLisUJOeKAYVLde1gAvme1BYykxc/4n+viia?=
 =?us-ascii?Q?ETHi88q0vZv6vqIKYb3wfkdenq4heLqiZgfnrWgf3jKJSAT8jmo+GGWSJjBl?=
 =?us-ascii?Q?QEOwNiVXJnAAeb8v4oJEJHXlvgcVXSTUE5xeqNP3XyPZ4e1ORXFEz/3xW3Z7?=
 =?us-ascii?Q?XiBX0VHwW9X1OIlvcAm4fOwl2ze5PgmwXwMedCvxnMAWY7dJ/BVBVQ4T0mAI?=
 =?us-ascii?Q?fCIqHVQ1+b6QRMH9UI+vMusrxQErQVvmInKdf0T3d9ygqxd+j/eurXA+z8fR?=
 =?us-ascii?Q?OgdjhVPvGbRXVo9Ce2fKh8oCTbe1Db+YaBVYY/T+diSYvKNaVrTGpVLfkCc3?=
 =?us-ascii?Q?FQcLpB9Ay5YqKdqAaqLSVETOtYuDk9ZzR2YbZ0TQVSKDo8VdYwSe6Q+N2zqF?=
 =?us-ascii?Q?mw5csbE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pTSJvo61LEchL4U2rCCcGrc8cmDmbOa3W+oVCXRHUI4zbnC67KJ4+vghmiDA?=
 =?us-ascii?Q?JFrDHYU2nRs+XI8P4aQGR6WxxLvXxB5vlL5F9Fp69JqLQHGe6YjuZF8SufMU?=
 =?us-ascii?Q?4kAhbS8wmAne9e/CyTRZfsU3j+Q1iIVcdP68K5dzSwQSvnkRTCgrEzcRZQlO?=
 =?us-ascii?Q?wNefNXd8r7fLlF7zlKUSBYGOxRIooPL2u5AGTXu/HrfQW8zoZnb1hVGhBKxs?=
 =?us-ascii?Q?iedMDC5kUvKWuTrWOa1B0J1nUE0rarXBRb14Mcu24bdE1yfQrQdI5WY351w0?=
 =?us-ascii?Q?BpsBGrn0PuyWjVvP/QT0Z0eWmUGK9ENTGfY3hvRtOk3dl9UwPwQmlfe2o0vE?=
 =?us-ascii?Q?1N+9HEZpM1hCAvwWb3EhiIgGvTSv/VrmqRNghSvsNz4672eNLT8b5RIhDTm3?=
 =?us-ascii?Q?YN6X7WirWdY1XtVfMYB8F1GnYg91r0kMdZEb/5UBfGXFBwFxosSA/kuNn+no?=
 =?us-ascii?Q?FvvOh3cpS5loNGu7zm8eBYLiz5LR4zOBlNyzXY3EMqcrdHYrj+VDLiCaa9da?=
 =?us-ascii?Q?+TgS7LVjUEpUxTVnY2dlPXD3lPSm0Ic/QRphCAY31C1ILGXQI32AyAoBF09P?=
 =?us-ascii?Q?B8SbtQwSKzYwlPqTbNuGnYuXLX3921FCq3QDPykNljhRxA7JmqIDo6i2V3sZ?=
 =?us-ascii?Q?GfFYZtFNlpdlVkr8pnHN+LkxRERYhA7w8uS1HBRFplqqujS7bI4dRSV1D4ET?=
 =?us-ascii?Q?SdZBTVHg2FaBwJSumLDEUk6ASHo2lqBrShvK34PKlxGNWsvkyeoYYJEXeux+?=
 =?us-ascii?Q?LdUH6ZjUcGAWluWZxR+OqQXO8hZNZNj7heYz5DmfFRicoIE6QODl1vG3Vkyu?=
 =?us-ascii?Q?dtinY8xnDgFDR6GUVdCJRdJwElu3rKrVP0l6/HN2XmBQLTheSNoQA/slFhAh?=
 =?us-ascii?Q?jPhMbx/o1NcMyLaJ0U0CZu9qarrcmJVBXZjYoDdBJFFN1wjS7XLioiW2WF2X?=
 =?us-ascii?Q?SX0MZ7F2BJzKHco2jT8korHj69CcQ1mVpnWqy+3yEGhx1IWIZnLBdXuCoJ98?=
 =?us-ascii?Q?ObKVxbqIEjFUS9ry8JG8CMhHmsaKA460hxScbFCrgSG+88uoNbv/XhR5ygZi?=
 =?us-ascii?Q?KGt6POCIB1spFyarqfOG1h6n0VhXQmtyaOHBJk6ggQ4ktS7cmplav6ijwSlp?=
 =?us-ascii?Q?I/wiLltU+k0HHtlLKwGNzel8haUK+XVyWrIZAoSiGkX9RANEs2bfYm2kH3tu?=
 =?us-ascii?Q?KWIgqsYpsdyHPGeGgdoMs6MSvTXfRFH4ssesWWGho27+SpWesX9owOUcxJ6q?=
 =?us-ascii?Q?0gth2gnHmLjxQC5lYGcfkkNOveJpptn6ulzfz/F7muszQuhO2EGGC9eTBvWT?=
 =?us-ascii?Q?IfiMeIkmkahqQOKnxYvQCSrtgMWofE5dof5+n2SBdCX0ONjcleA/kEZVBOcI?=
 =?us-ascii?Q?Ad3QaqXl41j2qGFosN6ECTV+JHSs9MAz4CO2UuV/frHYlx+57KCt7srSPKOC?=
 =?us-ascii?Q?VNCH6rvSpJICamEKMR7w74RZe0fIy9AKgNtLugeC/xUB6tbSJrAGNe7Aq/2Z?=
 =?us-ascii?Q?VYniQS+6+huEUPV3D4Ck6xswKy9VIj+FWiaStplDCDRHlvd3DambcNJy+eal?=
 =?us-ascii?Q?WaI3Th3i/b+bY5fKZ7feQXjoApzL0UJEEyP7Qhk/cO5wF+VL3CbBPi93oxPQ?=
 =?us-ascii?Q?Lg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c42959f-aff3-42ab-4b8f-08ddefdf1804
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 20:26:01.8532 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E+YMC9aWpUUrbAttai95HzpyOKEK3Uqf5/rdTpFYbQMQOOvIFYPgDkkJFQE4HRYwbEjtQnnr0igNZtJVEzMzRD9rh5RuABA9h3bBbaXFvg4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4568
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

On Sat, Aug 30, 2025 at 03:06:48PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: Recomment GuC v70.49.4 for PTL, BMG
> URL   : https://patchwork.freedesktop.org/series/153742/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773_FULL -> xe-pw-153742v1_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.
> 

Patch #2 applied to drm-xe-next.  Patch #1 (revert PVC from
topic/xe-for-CI) and #3 (re-apply exactly same PVC patch to
topic/xe-for-CI) wound up not being necessary in this case because the
PVC line was far enough away from the lines being changed by #2 that
there were no merge conflicts between the two branches.

Thanks for the patch and review.


Matt

>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> New tests
> ---------
> 
>   New tests have been introduced between xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773_FULL and xe-pw-153742v1_FULL:
> 
> ### New IGT tests (1) ###
> 
>   * igt@xe_oa@tail-address-wrap@rcs-0-4m:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.10] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-153742v1_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@core_getversion@all-cards:
>     - shard-dg2-set2:     [PASS][1] -> [FAIL][2] ([Intel XE#4208])
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-466/igt@core_getversion@all-cards.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-434/igt@core_getversion@all-cards.html
> 
>   * igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-3:
>     - shard-bmg:          NOTRUN -> [INCOMPLETE][3] ([Intel XE#4912]) +1 other test incomplete
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-bmg-2/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-3.html
> 
>   * igt@kms_big_fb@linear-16bpp-rotate-270:
>     - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#2327])
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-bmg-4/igt@kms_big_fb@linear-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-90:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][5] ([Intel XE#316]) +1 other test skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-435/igt@kms_big_fb@linear-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
>     - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#1124]) +1 other test skip
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-bmg-4/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#1124]) +2 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
>     - shard-bmg:          [PASS][8] -> [SKIP][9] ([Intel XE#2314] / [Intel XE#2894])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#367])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-435/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#455] / [Intel XE#787]) +26 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#787]) +174 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2887]) +2 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-bmg-4/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][14] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html
> 
>   * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#4417]) +3 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-466/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html
> 
>   * igt@kms_cdclk@plane-scaling@pipe-b-dp-2:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#4416]) +3 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-2.html
> 
>   * igt@kms_chamelium_edid@dp-mode-timings:
>     - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2252]) +1 other test skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-bmg-4/igt@kms_chamelium_edid@dp-mode-timings.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#373]) +2 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#307])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-435/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_content_protection@srm@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][20] ([Intel XE#1178]) +1 other test fail
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-463/igt@kms_content_protection@srm@pipe-a-dp-4.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#308])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-435/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-suspend:
>     - shard-dg2-set2:     [PASS][22] -> [INCOMPLETE][23] ([Intel XE#5397])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-432/igt@kms_cursor_crc@cursor-suspend.html
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-435/igt@kms_cursor_crc@cursor-suspend.html
> 
>   * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][24] ([Intel XE#5397])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-435/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
>     - shard-bmg:          [PASS][25] -> [SKIP][26] ([Intel XE#2291]) +2 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
> 
>   * igt@kms_dsc@dsc-with-bpc-formats:
>     - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2244])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-bmg-4/igt@kms_dsc@dsc-with-bpc-formats.html
> 
>   * igt@kms_feature_discovery@display-2x:
>     - shard-bmg:          [PASS][28] -> [SKIP][29] ([Intel XE#2373])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-bmg-1/igt@kms_feature_discovery@display-2x.html
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-bmg-6/igt@kms_feature_discovery@display-2x.html
> 
>   * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
>     - shard-dg2-set2:     [PASS][30] -> [SKIP][31] ([Intel XE#4208] / [i915#2575]) +61 other tests skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-435/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-434/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms-on-nop:
>     - shard-bmg:          [PASS][32] -> [SKIP][33] ([Intel XE#2316]) +5 other tests skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
> 
>   * igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1:
>     - shard-adlp:         [PASS][34] -> [DMESG-WARN][35] ([Intel XE#4543]) +2 other tests dmesg-warn
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-adlp-4/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-adlp-3/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
>     - shard-lnl:          [PASS][36] -> [FAIL][37] ([Intel XE#301]) +3 other tests fail
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-bmg:          [PASS][38] -> [INCOMPLETE][39] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-bmg-6/igt@kms_flip@flip-vs-suspend.html
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-bmg-4/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@d-dp4:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][40] ([Intel XE#2049] / [Intel XE#2597])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html
> 
>   * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
>     - shard-adlp:         [PASS][41] -> [DMESG-WARN][42] ([Intel XE#2953] / [Intel XE#4173]) +8 other tests dmesg-warn
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-adlp-2/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2293] / [Intel XE#2380])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
>     - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2293])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2311]) +5 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#5390])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
>     - shard-dg2-set2:     [PASS][47] -> [SKIP][48] ([Intel XE#2351] / [Intel XE#4208]) +8 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:
>     - shard-dg2-set2:     [PASS][49] -> [SKIP][50] ([Intel XE#4208]) +135 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#651]) +4 other tests skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2313]) +5 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#653]) +4 other tests skip
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-bmg:          [PASS][54] -> [SKIP][55] ([Intel XE#1503])
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-bmg-7/igt@kms_hdr@invalid-hdr.html
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-bmg-1/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#2925])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-435/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2501])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-bmg-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_panel_fitting@legacy:
>     - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2486])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-bmg-4/igt@kms_panel_fitting@legacy.html
> 
>   * igt@kms_plane_multiple@tiling-yf:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#5020])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-435/igt@kms_plane_multiple@tiling-yf.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-adlp:         [PASS][60] -> [FAIL][61] ([Intel XE#718])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-adlp-4/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_psr@psr-primary-page-flip:
>     - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-bmg-4/igt@kms_psr@psr-primary-page-flip.html
> 
>   * igt@kms_psr@psr-sprite-plane-onoff:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-435/igt@kms_psr@psr-sprite-plane-onoff.html
> 
>   * igt@kms_vrr@cmrr@pipe-a-edp-1:
>     - shard-lnl:          [PASS][64] -> [FAIL][65] ([Intel XE#4459]) +1 other test fail
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html
> 
>   * igt@kms_vrr@flip-basic-fastset:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#455]) +7 other tests skip
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-435/igt@kms_vrr@flip-basic-fastset.html
> 
>   * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#1280] / [Intel XE#455])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-466/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html
> 
>   * igt@xe_eudebug@basic-vm-access:
>     - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#4837]) +2 other tests skip
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-bmg-4/igt@xe_eudebug@basic-vm-access.html
> 
>   * igt@xe_eudebug@vma-ufence-faultable:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#4837]) +4 other tests skip
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-435/igt@xe_eudebug@vma-ufence-faultable.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:
>     - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2322])
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
>     - shard-dg2-set2:     [PASS][71] -> [SKIP][72] ([Intel XE#1392]) +3 other tests skip
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html
> 
>   * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#288]) +2 other tests skip
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-435/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm.html
> 
>   * igt@xe_exec_reset@parallel-gt-reset:
>     - shard-adlp:         [PASS][74] -> [DMESG-WARN][75] ([Intel XE#3876]) +1 other test dmesg-warn
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-adlp-3/igt@xe_exec_reset@parallel-gt-reset.html
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-adlp-4/igt@xe_exec_reset@parallel-gt-reset.html
> 
>   * igt@xe_exec_system_allocator@many-large-mmap-huge-nomemset:
>     - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#4943])
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-bmg-4/igt@xe_exec_system_allocator@many-large-mmap-huge-nomemset.html
> 
>   * igt@xe_exec_system_allocator@process-many-large-execqueues-new-bo-map-nomemset:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#4915]) +42 other tests skip
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-435/igt@xe_exec_system_allocator@process-many-large-execqueues-new-bo-map-nomemset.html
> 
>   * igt@xe_oa@map-oa-buffer:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#3573])
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-435/igt@xe_oa@map-oa-buffer.html
> 
>   * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][79] ([Intel XE#1173])
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-466/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html
> 
>   * igt@xe_pm@s4-d3hot-basic-exec:
>     - shard-dg2-set2:     [PASS][80] -> [INCOMPLETE][81] ([Intel XE#5382])
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-463/igt@xe_pm@s4-d3hot-basic-exec.html
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-464/igt@xe_pm@s4-d3hot-basic-exec.html
> 
>   * igt@xe_pmu@all-fn-engine-activity-load:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#4650])
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-435/igt@xe_pmu@all-fn-engine-activity-load.html
> 
>   * igt@xe_pmu@fn-engine-activity-sched-if-idle:
>     - shard-bmg:          NOTRUN -> [DMESG-WARN][83] ([Intel XE#3876])
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-bmg-4/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
> 
>   * igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#4733])
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-435/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html
> 
>   * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#4130])
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-435/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@core_setmaster@master-drop-set-root:
>     - shard-dg2-set2:     [FAIL][86] ([Intel XE#4208]) -> [PASS][87] +1 other test pass
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-434/igt@core_setmaster@master-drop-set-root.html
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-466/igt@core_setmaster@master-drop-set-root.html
> 
>   * igt@fbdev@write:
>     - shard-dg2-set2:     [SKIP][88] ([Intel XE#2134]) -> [PASS][89] +1 other test pass
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-434/igt@fbdev@write.html
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-463/igt@fbdev@write.html
> 
>   * igt@kms_atomic_transition@plane-toggle-modeset-transition:
>     - shard-adlp:         [FAIL][90] ([Intel XE#3908]) -> [PASS][91] +1 other test pass
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-adlp-2/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-adlp-9/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:
>     - shard-dg2-set2:     [SKIP][92] ([Intel XE#2351] / [Intel XE#4208]) -> [PASS][93] +7 other tests pass
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [INCOMPLETE][94] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [PASS][95]
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:
>     - shard-dg2-set2:     [INCOMPLETE][96] ([Intel XE#2705] / [Intel XE#4212]) -> [PASS][97] +1 other test pass
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
>     - shard-bmg:          [SKIP][98] ([Intel XE#2291]) -> [PASS][99]
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
>     - shard-bmg:          [SKIP][100] ([Intel XE#2316]) -> [PASS][101] +1 other test pass
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
> 
>   * igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1:
>     - shard-adlp:         [DMESG-WARN][102] ([Intel XE#4543]) -> [PASS][103] +4 other tests pass
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-adlp-8/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-adlp-6/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html
> 
>   * igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant:
>     - shard-dg2-set2:     [SKIP][104] ([Intel XE#4208] / [i915#2575]) -> [PASS][105] +75 other tests pass
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-434/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant.html
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-466/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant.html
> 
>   * igt@xe_ccs@ctrl-surf-copy-new-ctx:
>     - shard-dg2-set2:     [SKIP][106] ([Intel XE#4208]) -> [PASS][107] +159 other tests pass
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-434/igt@xe_ccs@ctrl-surf-copy-new-ctx.html
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-463/igt@xe_ccs@ctrl-surf-copy-new-ctx.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
>     - shard-dg2-set2:     [SKIP][108] ([Intel XE#1392]) -> [PASS][109] +4 other tests pass
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html
> 
>   * igt@xe_exec_system_allocator@process-many-large-new-race-nomemset:
>     - shard-bmg:          [INCOMPLETE][110] -> [PASS][111]
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-bmg-5/igt@xe_exec_system_allocator@process-many-large-new-race-nomemset.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-bmg-2/igt@xe_exec_system_allocator@process-many-large-new-race-nomemset.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][112] ([Intel XE#316]) -> [SKIP][113] ([Intel XE#4208]) +1 other test skip
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-466/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-434/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][114] ([Intel XE#4208]) -> [SKIP][115] ([Intel XE#316]) +2 other tests skip
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-463/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][116] ([Intel XE#1124]) -> [SKIP][117] ([Intel XE#2351] / [Intel XE#4208]) +2 other tests skip
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-435/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-434/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-dg2-set2:     [SKIP][118] ([Intel XE#4208]) -> [SKIP][119] ([Intel XE#1124]) +4 other tests skip
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
>     - shard-dg2-set2:     [SKIP][120] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][121] ([Intel XE#1124]) +3 other tests skip
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>     - shard-dg2-set2:     [SKIP][122] ([Intel XE#607]) -> [SKIP][123] ([Intel XE#4208])
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>     - shard-dg2-set2:     [SKIP][124] ([Intel XE#1124]) -> [SKIP][125] ([Intel XE#4208]) +4 other tests skip
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
>     - shard-dg2-set2:     [SKIP][126] ([Intel XE#4208] / [i915#2575]) -> [SKIP][127] ([Intel XE#2191]) +1 other test skip
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
>     - shard-dg2-set2:     [SKIP][128] ([Intel XE#2191]) -> [SKIP][129] ([Intel XE#4208] / [i915#2575])
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
>     - shard-dg2-set2:     [SKIP][130] ([Intel XE#4208] / [i915#2575]) -> [SKIP][131] ([Intel XE#367])
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-434/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-463/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
>     - shard-dg2-set2:     [SKIP][132] ([Intel XE#367]) -> [SKIP][133] ([Intel XE#4208] / [i915#2575]) +1 other test skip
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-435/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-434/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs:
>     - shard-dg2-set2:     [SKIP][134] ([Intel XE#4208]) -> [SKIP][135] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs.html
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-466/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:
>     - shard-dg2-set2:     [SKIP][136] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][137] ([Intel XE#4208]) +4 other tests skip
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:
>     - shard-dg2-set2:     [SKIP][138] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][139] ([Intel XE#455] / [Intel XE#787]) +2 other tests skip
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
>     - shard-dg2-set2:     [SKIP][140] ([Intel XE#2907]) -> [SKIP][141] ([Intel XE#4208])
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
>     - shard-dg2-set2:     [SKIP][142] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][143] ([Intel XE#2351] / [Intel XE#4208]) +2 other tests skip
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
>     - shard-dg2-set2:     [SKIP][144] ([Intel XE#4208]) -> [SKIP][145] ([Intel XE#2907])
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
>     - shard-dg2-set2:     [INCOMPLETE][146] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [INCOMPLETE][147] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_cdclk@mode-transition-all-outputs:
>     - shard-dg2-set2:     [SKIP][148] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][149] ([Intel XE#4418])
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-434/igt@kms_cdclk@mode-transition-all-outputs.html
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-432/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>   * igt@kms_chamelium_color@ctm-0-50:
>     - shard-dg2-set2:     [SKIP][150] ([Intel XE#4208] / [i915#2575]) -> [SKIP][151] ([Intel XE#306])
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-434/igt@kms_chamelium_color@ctm-0-50.html
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-463/igt@kms_chamelium_color@ctm-0-50.html
> 
>   * igt@kms_chamelium_color@gamma:
>     - shard-dg2-set2:     [SKIP][152] ([Intel XE#306]) -> [SKIP][153] ([Intel XE#4208] / [i915#2575]) +2 other tests skip
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-435/igt@kms_chamelium_color@gamma.html
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-434/igt@kms_chamelium_color@gamma.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
>     - shard-dg2-set2:     [SKIP][154] ([Intel XE#4208] / [i915#2575]) -> [SKIP][155] ([Intel XE#373]) +8 other tests skip
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd:
>     - shard-dg2-set2:     [SKIP][156] ([Intel XE#373]) -> [SKIP][157] ([Intel XE#4208] / [i915#2575]) +7 other tests skip
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-433/igt@kms_chamelium_hpd@vga-hpd.html
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd.html
> 
>   * igt@kms_content_protection@legacy:
>     - shard-dg2-set2:     [FAIL][158] ([Intel XE#1178]) -> [SKIP][159] ([Intel XE#4208] / [i915#2575])
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-433/igt@kms_content_protection@legacy.html
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-434/igt@kms_content_protection@legacy.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-dg2-set2:     [SKIP][160] ([Intel XE#4208] / [i915#2575]) -> [FAIL][161] ([Intel XE#1178])
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-434/igt@kms_content_protection@srm.html
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-463/igt@kms_content_protection@srm.html
> 
>   * igt@kms_content_protection@uevent:
>     - shard-bmg:          [FAIL][162] ([Intel XE#1188]) -> [SKIP][163] ([Intel XE#2341])
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-bmg-1/igt@kms_content_protection@uevent.html
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-bmg-6/igt@kms_content_protection@uevent.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x170:
>     - shard-dg2-set2:     [SKIP][164] ([Intel XE#4208] / [i915#2575]) -> [SKIP][165] ([Intel XE#308]) +2 other tests skip
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x170.html
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-463/igt@kms_cursor_crc@cursor-onscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x512:
>     - shard-dg2-set2:     [SKIP][166] ([Intel XE#308]) -> [SKIP][167] ([Intel XE#4208] / [i915#2575])
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-512x512.html
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x512.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>     - shard-dg2-set2:     [SKIP][168] ([Intel XE#4208] / [i915#2575]) -> [SKIP][169] ([Intel XE#323])
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>     - shard-dg2-set2:     [SKIP][170] ([Intel XE#323]) -> [SKIP][171] ([Intel XE#4208] / [i915#2575])
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_dsc@dsc-with-bpc-formats:
>     - shard-dg2-set2:     [SKIP][172] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][173] ([Intel XE#455]) +4 other tests skip
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-434/igt@kms_dsc@dsc-with-bpc-formats.html
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-466/igt@kms_dsc@dsc-with-bpc-formats.html
> 
>   * igt@kms_dsc@dsc-with-output-formats-with-bpc:
>     - shard-dg2-set2:     [SKIP][174] ([Intel XE#4208]) -> [SKIP][175] ([Intel XE#455]) +4 other tests skip
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-434/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-466/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
> 
>   * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
>     - shard-dg2-set2:     [SKIP][176] ([Intel XE#4422]) -> [SKIP][177] ([Intel XE#4208])
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-466/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-434/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-dg2-set2:     [SKIP][178] ([Intel XE#4208]) -> [SKIP][179] ([Intel XE#776])
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-434/igt@kms_fbcon_fbt@psr-suspend.html
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-432/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_feature_discovery@dp-mst:
>     - shard-dg2-set2:     [SKIP][180] ([Intel XE#1137]) -> [SKIP][181] ([Intel XE#4208] / [i915#2575])
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-433/igt@kms_feature_discovery@dp-mst.html
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-434/igt@kms_feature_discovery@dp-mst.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-dg2-set2:     [SKIP][182] ([Intel XE#4208] / [i915#2575]) -> [INCOMPLETE][183] ([Intel XE#2049] / [Intel XE#2597])
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
>     - shard-dg2-set2:     [SKIP][184] ([Intel XE#455]) -> [SKIP][185] ([Intel XE#4208]) +1 other test skip
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
>     - shard-dg2-set2:     [SKIP][186] ([Intel XE#455]) -> [SKIP][187] ([Intel XE#2351] / [Intel XE#4208])
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt:
>     - shard-dg2-set2:     [SKIP][188] ([Intel XE#651]) -> [SKIP][189] ([Intel XE#2351] / [Intel XE#4208]) +4 other tests skip
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt.html
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
>     - shard-dg2-set2:     [SKIP][190] ([Intel XE#651]) -> [SKIP][191] ([Intel XE#4208]) +16 other tests skip
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-blt:
>     - shard-bmg:          [SKIP][192] ([Intel XE#2312]) -> [SKIP][193] ([Intel XE#2311]) +3 other tests skip
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-blt.html
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
>     - shard-dg2-set2:     [SKIP][194] ([Intel XE#4208]) -> [SKIP][195] ([Intel XE#651]) +16 other tests skip
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-suspend:
>     - shard-dg2-set2:     [SKIP][196] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][197] ([Intel XE#651]) +6 other tests skip
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
>     - shard-bmg:          [SKIP][198] ([Intel XE#5390]) -> [SKIP][199] ([Intel XE#2312]) +6 other tests skip
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
>     - shard-bmg:          [SKIP][200] ([Intel XE#2312]) -> [SKIP][201] ([Intel XE#5390]) +1 other test skip
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:
>     - shard-bmg:          [SKIP][202] ([Intel XE#2311]) -> [SKIP][203] ([Intel XE#2312]) +13 other tests skip
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
>     - shard-dg2-set2:     [SKIP][204] ([Intel XE#653]) -> [SKIP][205] ([Intel XE#4208]) +19 other tests skip
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
>     - shard-bmg:          [SKIP][206] ([Intel XE#2312]) -> [SKIP][207] ([Intel XE#2313]) +3 other tests skip
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
>     - shard-bmg:          [SKIP][208] ([Intel XE#2313]) -> [SKIP][209] ([Intel XE#2312]) +12 other tests skip
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:
>     - shard-dg2-set2:     [SKIP][210] ([Intel XE#653]) -> [SKIP][211] ([Intel XE#2351] / [Intel XE#4208]) +3 other tests skip
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@plane-fbc-rte:
>     - shard-dg2-set2:     [SKIP][212] ([Intel XE#4208]) -> [SKIP][213] ([Intel XE#1158])
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-434/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-466/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
>     - shard-dg2-set2:     [SKIP][214] ([Intel XE#4208]) -> [SKIP][215] ([Intel XE#653]) +12 other tests skip
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move:
>     - shard-dg2-set2:     [SKIP][216] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][217] ([Intel XE#653]) +5 other tests skip
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move.html
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move.html
> 
>   * igt@kms_joiner@invalid-modeset-big-joiner:
>     - shard-dg2-set2:     [SKIP][218] ([Intel XE#4208]) -> [SKIP][219] ([Intel XE#346])
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-434/igt@kms_joiner@invalid-modeset-big-joiner.html
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-463/igt@kms_joiner@invalid-modeset-big-joiner.html
> 
>   * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
>     - shard-dg2-set2:     [SKIP][220] ([Intel XE#2925]) -> [SKIP][221] ([Intel XE#4208])
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-466/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-434/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-dg2-set2:     [SKIP][222] ([Intel XE#4208] / [i915#2575]) -> [SKIP][223] ([Intel XE#356])
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-434/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-466/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_panel_fitting@atomic-fastset:
>     - shard-dg2-set2:     [SKIP][224] ([Intel XE#4208] / [i915#2575]) -> [SKIP][225] ([Intel XE#455]) +3 other tests skip
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-434/igt@kms_panel_fitting@atomic-fastset.html
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-463/igt@kms_panel_fitting@atomic-fastset.html
> 
>   * igt@kms_plane_multiple@2x-tiling-yf:
>     - shard-dg2-set2:     [SKIP][226] ([Intel XE#5021]) -> [SKIP][227] ([Intel XE#4208] / [i915#2575])
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-466/igt@kms_plane_multiple@2x-tiling-yf.html
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-434/igt@kms_plane_multiple@2x-tiling-yf.html
> 
>   * igt@kms_pm_backlight@basic-brightness:
>     - shard-dg2-set2:     [SKIP][228] ([Intel XE#4208]) -> [SKIP][229] ([Intel XE#870])
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-434/igt@kms_pm_backlight@basic-brightness.html
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-463/igt@kms_pm_backlight@basic-brightness.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-simulation:
>     - shard-dg2-set2:     [SKIP][230] ([Intel XE#1122]) -> [SKIP][231] ([Intel XE#2351] / [Intel XE#4208])
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-435/igt@kms_pm_dc@dc3co-vpb-simulation.html
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-434/igt@kms_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@kms_pm_dc@deep-pkgc:
>     - shard-dg2-set2:     [SKIP][232] ([Intel XE#908]) -> [SKIP][233] ([Intel XE#4208])
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-466/igt@kms_pm_dc@deep-pkgc.html
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-434/igt@kms_pm_dc@deep-pkgc.html
> 
>   * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
>     - shard-dg2-set2:     [SKIP][234] ([Intel XE#1406] / [Intel XE#4208]) -> [SKIP][235] ([Intel XE#1406] / [Intel XE#1489]) +3 other tests skip
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-434/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-463/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
>     - shard-dg2-set2:     [SKIP][236] ([Intel XE#1406] / [Intel XE#1489]) -> [SKIP][237] ([Intel XE#1406] / [Intel XE#4208]) +6 other tests skip
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-433/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-434/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html
> 
>   * igt@kms_psr@fbc-pr-dpms:
>     - shard-dg2-set2:     [SKIP][238] ([Intel XE#1406] / [Intel XE#4208]) -> [SKIP][239] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +10 other tests skip
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-434/igt@kms_psr@fbc-pr-dpms.html
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-466/igt@kms_psr@fbc-pr-dpms.html
> 
>   * igt@kms_psr@fbc-pr-sprite-render:
>     - shard-dg2-set2:     [SKIP][240] ([Intel XE#1406] / [Intel XE#2351] / [Intel XE#4208]) -> [SKIP][241] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +1 other test skip
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-434/igt@kms_psr@fbc-pr-sprite-render.html
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-466/igt@kms_psr@fbc-pr-sprite-render.html
> 
>   * igt@kms_psr@fbc-psr-no-drrs:
>     - shard-dg2-set2:     [SKIP][242] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) -> [SKIP][243] ([Intel XE#1406] / [Intel XE#2351] / [Intel XE#4208]) +3 other tests skip
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-435/igt@kms_psr@fbc-psr-no-drrs.html
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-434/igt@kms_psr@fbc-psr-no-drrs.html
> 
>   * igt@kms_psr@psr2-dpms:
>     - shard-dg2-set2:     [SKIP][244] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) -> [SKIP][245] ([Intel XE#1406] / [Intel XE#4208]) +4 other tests skip
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-433/igt@kms_psr@psr2-dpms.html
>    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-434/igt@kms_psr@psr2-dpms.html
> 
>   * igt@kms_rotation_crc@bad-pixel-format:
>     - shard-dg2-set2:     [SKIP][246] ([Intel XE#4208] / [i915#2575]) -> [SKIP][247] ([Intel XE#3414])
>    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-434/igt@kms_rotation_crc@bad-pixel-format.html
>    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-466/igt@kms_rotation_crc@bad-pixel-format.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
>     - shard-dg2-set2:     [SKIP][248] ([Intel XE#3414]) -> [SKIP][249] ([Intel XE#4208] / [i915#2575]) +1 other test skip
>    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
>    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>     - shard-dg2-set2:     [SKIP][250] ([Intel XE#4208] / [i915#2575]) -> [SKIP][251] ([Intel XE#1127])
>    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
>    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-bmg:          [FAIL][252] ([Intel XE#1729]) -> [SKIP][253] ([Intel XE#2426])
>    [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
>    [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_vrr@flip-suspend:
>     - shard-dg2-set2:     [SKIP][254] ([Intel XE#455]) -> [SKIP][255] ([Intel XE#4208] / [i915#2575]) +3 other tests skip
>    [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-433/igt@kms_vrr@flip-suspend.html
>    [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-434/igt@kms_vrr@flip-suspend.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off:
>     - shard-dg2-set2:     [SKIP][256] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][257] ([Intel XE#4208] / [i915#2575])
>    [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-435/igt@sriov_basic@enable-vfs-autoprobe-off.html
>    [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-434/igt@sriov_basic@enable-vfs-autoprobe-off.html
> 
>   * igt@xe_compute_preempt@compute-preempt-many-all-ram:
>     - shard-dg2-set2:     [FAIL][258] ([Intel XE#5890]) -> [SKIP][259] ([Intel XE#4208])
>    [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-466/igt@xe_compute_preempt@compute-preempt-many-all-ram.html
>    [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many-all-ram.html
> 
>   * igt@xe_compute_preempt@compute-threadgroup-preempt:
>     - shard-dg2-set2:     [SKIP][260] ([Intel XE#4208]) -> [SKIP][261] ([Intel XE#1280] / [Intel XE#455])
>    [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-434/igt@xe_compute_preempt@compute-threadgroup-preempt.html
>    [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-466/igt@xe_compute_preempt@compute-threadgroup-preempt.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0xfffe:
>     - shard-dg2-set2:     [SKIP][262] ([Intel XE#4208]) -> [SKIP][263] ([Intel XE#1126])
>    [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfffe.html
>    [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfffe.html
> 
>   * igt@xe_eu_stall@invalid-event-report-count:
>     - shard-dg2-set2:     [SKIP][264] ([Intel XE#5626]) -> [SKIP][265] ([Intel XE#4208])
>    [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-435/igt@xe_eu_stall@invalid-event-report-count.html
>    [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-434/igt@xe_eu_stall@invalid-event-report-count.html
> 
>   * igt@xe_eu_stall@non-blocking-read:
>     - shard-dg2-set2:     [SKIP][266] ([Intel XE#4208]) -> [SKIP][267] ([Intel XE#5626])
>    [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-434/igt@xe_eu_stall@non-blocking-read.html
>    [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-432/igt@xe_eu_stall@non-blocking-read.html
> 
>   * igt@xe_eudebug@basic-vm-access-userptr-faultable:
>     - shard-dg2-set2:     [SKIP][268] ([Intel XE#4208]) -> [SKIP][269] ([Intel XE#4837]) +9 other tests skip
>    [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-434/igt@xe_eudebug@basic-vm-access-userptr-faultable.html
>    [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-466/igt@xe_eudebug@basic-vm-access-userptr-faultable.html
> 
>   * igt@xe_eudebug_online@interrupt-all-set-breakpoint:
>     - shard-dg2-set2:     [SKIP][270] ([Intel XE#4837]) -> [SKIP][271] ([Intel XE#4208]) +7 other tests skip
>    [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-435/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html
>    [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-434/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html
> 
>   * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
>     - shard-dg2-set2:     [SKIP][272] ([Intel XE#4208]) -> [SKIP][273] ([Intel XE#1392]) +1 other test skip
>    [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-434/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
>    [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
> 
>   * igt@xe_exec_fault_mode@once-rebind-imm:
>     - shard-dg2-set2:     [SKIP][274] ([Intel XE#288]) -> [SKIP][275] ([Intel XE#4208]) +18 other tests skip
>    [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-435/igt@xe_exec_fault_mode@once-rebind-imm.html
>    [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-434/igt@xe_exec_fault_mode@once-rebind-imm.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
>     - shard-dg2-set2:     [SKIP][276] ([Intel XE#4208]) -> [SKIP][277] ([Intel XE#288]) +23 other tests skip
>    [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
>    [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shared-nomemset:
>     - shard-dg2-set2:     [SKIP][278] ([Intel XE#4208]) -> [SKIP][279] ([Intel XE#4915]) +195 other tests skip
>    [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-434/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shared-nomemset.html
>    [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-466/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shared-nomemset.html
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc:
>     - shard-dg2-set2:     [SKIP][280] ([Intel XE#4915]) -> [SKIP][281] ([Intel XE#4208]) +181 other tests skip
>    [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-435/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc.html
>    [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-434/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc.html
> 
>   * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
>     - shard-dg2-set2:     [SKIP][282] ([Intel XE#4208]) -> [ABORT][283] ([Intel XE#4917])
>    [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-434/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
>    [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-432/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
> 
>   * igt@xe_media_fill@media-fill:
>     - shard-dg2-set2:     [SKIP][284] ([Intel XE#4208]) -> [SKIP][285] ([Intel XE#560])
>    [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-434/igt@xe_media_fill@media-fill.html
>    [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-432/igt@xe_media_fill@media-fill.html
> 
>   * igt@xe_mmap@small-bar:
>     - shard-dg2-set2:     [SKIP][286] ([Intel XE#512]) -> [SKIP][287] ([Intel XE#4208])
>    [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-466/igt@xe_mmap@small-bar.html
>    [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-434/igt@xe_mmap@small-bar.html
> 
>   * igt@xe_oa@create-destroy-userspace-config:
>     - shard-dg2-set2:     [SKIP][288] ([Intel XE#4208]) -> [SKIP][289] ([Intel XE#3573]) +6 other tests skip
>    [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-434/igt@xe_oa@create-destroy-userspace-config.html
>    [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-466/igt@xe_oa@create-destroy-userspace-config.html
> 
>   * igt@xe_oa@oa-tlb-invalidate:
>     - shard-dg2-set2:     [SKIP][290] ([Intel XE#3573]) -> [SKIP][291] ([Intel XE#4208]) +3 other tests skip
>    [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-466/igt@xe_oa@oa-tlb-invalidate.html
>    [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-434/igt@xe_oa@oa-tlb-invalidate.html
> 
>   * igt@xe_peer2peer@read:
>     - shard-dg2-set2:     [FAIL][292] ([Intel XE#1173]) -> [SKIP][293] ([Intel XE#1061] / [Intel XE#4208])
>    [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-435/igt@xe_peer2peer@read.html
>    [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-434/igt@xe_peer2peer@read.html
> 
>   * igt@xe_peer2peer@write:
>     - shard-dg2-set2:     [SKIP][294] ([Intel XE#1061] / [Intel XE#4208]) -> [FAIL][295] ([Intel XE#1173])
>    [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-434/igt@xe_peer2peer@write.html
>    [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-466/igt@xe_peer2peer@write.html
> 
>   * igt@xe_pm@d3cold-mocs:
>     - shard-dg2-set2:     [SKIP][296] ([Intel XE#4208]) -> [SKIP][297] ([Intel XE#2284])
>    [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-434/igt@xe_pm@d3cold-mocs.html
>    [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-432/igt@xe_pm@d3cold-mocs.html
> 
>   * igt@xe_pm@s2idle-d3cold-basic-exec:
>     - shard-dg2-set2:     [SKIP][298] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][299] ([Intel XE#4208]) +2 other tests skip
>    [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-466/igt@xe_pm@s2idle-d3cold-basic-exec.html
>    [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-434/igt@xe_pm@s2idle-d3cold-basic-exec.html
> 
>   * igt@xe_pmu@fn-engine-activity-load:
>     - shard-dg2-set2:     [SKIP][300] ([Intel XE#4650]) -> [SKIP][301] ([Intel XE#4208])
>    [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-433/igt@xe_pmu@fn-engine-activity-load.html
>    [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-434/igt@xe_pmu@fn-engine-activity-load.html
> 
>   * igt@xe_pmu@fn-engine-activity-sched-if-idle:
>     - shard-dg2-set2:     [SKIP][302] ([Intel XE#4208]) -> [SKIP][303] ([Intel XE#4650])
>    [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-434/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
>    [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-466/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
> 
>   * igt@xe_pxp@display-black-pxp-fb:
>     - shard-dg2-set2:     [SKIP][304] ([Intel XE#4208]) -> [SKIP][305] ([Intel XE#4733]) +1 other test skip
>    [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-434/igt@xe_pxp@display-black-pxp-fb.html
>    [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-463/igt@xe_pxp@display-black-pxp-fb.html
> 
>   * igt@xe_pxp@pxp-stale-bo-exec-post-suspend:
>     - shard-dg2-set2:     [SKIP][306] ([Intel XE#4733]) -> [SKIP][307] ([Intel XE#4208])
>    [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-433/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html
>    [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-434/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html
> 
>   * igt@xe_query@multigpu-query-gt-list:
>     - shard-dg2-set2:     [SKIP][308] ([Intel XE#944]) -> [SKIP][309] ([Intel XE#4208]) +2 other tests skip
>    [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-466/igt@xe_query@multigpu-query-gt-list.html
>    [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-434/igt@xe_query@multigpu-query-gt-list.html
> 
>   * igt@xe_query@multigpu-query-uc-fw-version-guc:
>     - shard-dg2-set2:     [SKIP][310] ([Intel XE#4208]) -> [SKIP][311] ([Intel XE#944]) +4 other tests skip
>    [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-434/igt@xe_query@multigpu-query-uc-fw-version-guc.html
>    [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-466/igt@xe_query@multigpu-query-uc-fw-version-guc.html
> 
>   * igt@xe_render_copy@render-stress-2-copies:
>     - shard-dg2-set2:     [SKIP][312] ([Intel XE#4814]) -> [SKIP][313] ([Intel XE#4208])
>    [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-433/igt@xe_render_copy@render-stress-2-copies.html
>    [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-434/igt@xe_render_copy@render-stress-2-copies.html
> 
>   * igt@xe_render_copy@render-stress-4-copies:
>     - shard-dg2-set2:     [SKIP][314] ([Intel XE#4208]) -> [SKIP][315] ([Intel XE#4814])
>    [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-434/igt@xe_render_copy@render-stress-4-copies.html
>    [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-432/igt@xe_render_copy@render-stress-4-copies.html
> 
>   * igt@xe_spin_batch@spin-mem-copy:
>     - shard-dg2-set2:     [SKIP][316] ([Intel XE#4821]) -> [SKIP][317] ([Intel XE#4208])
>    [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-466/igt@xe_spin_batch@spin-mem-copy.html
>    [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-434/igt@xe_spin_batch@spin-mem-copy.html
> 
>   * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
>     - shard-dg2-set2:     [SKIP][318] ([Intel XE#4208]) -> [SKIP][319] ([Intel XE#4130])
>    [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-434/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html
>    [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-463/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html
> 
>   * igt@xe_sriov_flr@flr-each-isolation:
>     - shard-dg2-set2:     [SKIP][320] ([Intel XE#4208]) -> [SKIP][321] ([Intel XE#3342])
>    [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-434/igt@xe_sriov_flr@flr-each-isolation.html
>    [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-466/igt@xe_sriov_flr@flr-each-isolation.html
> 
>   * igt@xe_sriov_flr@flr-vfs-parallel:
>     - shard-dg2-set2:     [SKIP][322] ([Intel XE#4273]) -> [SKIP][323] ([Intel XE#4208])
>    [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-433/igt@xe_sriov_flr@flr-vfs-parallel.html
>    [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-434/igt@xe_sriov_flr@flr-vfs-parallel.html
> 
>   * igt@xe_sriov_scheduling@equal-throughput:
>     - shard-dg2-set2:     [SKIP][324] ([Intel XE#4351]) -> [SKIP][325] ([Intel XE#4208])
>    [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773/shard-dg2-466/igt@xe_sriov_scheduling@equal-throughput.html
>    [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/shard-dg2-434/igt@xe_sriov_scheduling@equal-throughput.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
>   [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
>   [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
>   [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
>   [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>   [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>   [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
>   [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
>   [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
>   [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
>   [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
>   [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
>   [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>   [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
>   [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
>   [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
>   [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
>   [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
>   [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
>   [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
>   [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
>   [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
>   [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
>   [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
>   [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
>   [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
>   [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
>   [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
>   [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
>   [Intel XE#4418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418
>   [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
>   [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
>   [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
>   [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
>   [Intel XE#4821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4821
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>   [Intel XE#4912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4912
>   [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
>   [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
>   [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
>   [Intel XE#5007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
>   [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
>   [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
>   [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
>   [Intel XE#5382]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5382
>   [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
>   [Intel XE#5397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5397
>   [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
>   [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
>   [Intel XE#5890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5890
>   [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
>   [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773 -> xe-pw-153742v1
> 
>   IGT_8518: 8518
>   xe-3643-99f4b32d88cb9718c944d44ea96cb04f4f70a773: 99f4b32d88cb9718c944d44ea96cb04f4f70a773
>   xe-pw-153742v1: 153742v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153742v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

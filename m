Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D39C02198
	for <intel-xe@archiver.kernel.org>; Tue, 18 Feb 2025 15:55:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AA9D10E3CB;
	Tue, 18 Feb 2025 15:55:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KwH1V1kN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B44CE10E3CB
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Feb 2025 15:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739894123; x=1771430123;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=e9g1uBmfqf+mzLV2Hn5Ns+Bo46zPaEgfjY4z3Yr7V2E=;
 b=KwH1V1kNyjkzHsFKucIS1DJJcyFOeCWFo9g7XDymy9w7ctwdFoFw3GdQ
 2Enfzi7WM9gkIlWRzq+oQJLulI7uNNT3bRuYk+t1I4z1N8bfsWTP3q/US
 SB90BWd9EHByxPe6GpyN44YxVPCd13sGrfbI6/RkJ1pHUunYswHtOxLKh
 nakedg+FpMXNHek64UdHZTAOk/NhC++gYChRNkvBiKRZT0oYzzx2yn2lD
 sbhvr5JKBcjGlPl0Kzn6W7lHjff8jensrrcYv6UmGXRj47UPn6SVPKWX6
 38+WeFcoDG0MghyJYSRylLYPIqn7De/4htVAxG++P91IVQysVzj7qNA44 w==;
X-CSE-ConnectionGUID: 5RKn5dDjTUGIRTGsVvTANw==
X-CSE-MsgGUID: z9Lkki+XSMWzJtsQ2/W7VQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40719162"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="40719162"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 07:55:23 -0800
X-CSE-ConnectionGUID: qOe9vcTsTBmCe/0hMoesQw==
X-CSE-MsgGUID: 08QaIaIJS8WT7Sycf1sYnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="114299633"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 07:55:22 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 18 Feb 2025 07:55:21 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 18 Feb 2025 07:55:21 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 18 Feb 2025 07:55:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v3NEe555INPS0fHvz54y/5hm+HDyc8EnWEFo5EwR+FC6LpGuiKaz/r2G1+l9kIqxE3jMBBWo9RXjbIuYLa7mASMHzpK0yXSGdOC41JT9L3I7tyB/reYvcVBLqdtdwTrPv04EBImc+p68aFNXBqA/03z02wC0Oh9fz699alX4Fb5K3Q1X3W58xS59Py5Rhus9voUxzD5hKbUCB+YnafDqimeUpB39aKv7Y/DN8KMj7ekPacln2IFXneYoUwkpNgnb44BTV0vdpf8PNm/JMWdWHWH3cVN2teyHTk3KH+a3ron9xCTuMWb88BPxGu1xuFympNp+/24Ik3ikoM5WrwpQEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PjNm904oonofVgEWTzHJe2zqH6TdpiYc4lkdquGzuEY=;
 b=P8JkacEiSd7uvFS2Mjqya3AY97RrTVGd4PKwn2a5Q/te2gduTsDvHcgNGMPiaeW03YyyV9E/LxWm5txgaA5swNYysZvvmfQ8nzPkmcB7RstB+U4Gvi6azCjsFyTrJDCul+QdLHdI8wAPKnQBO1OSglphIYc+7ETlCK8ahxhpeLA7Frvug0qr3G5jpkLat3t5EKkRj1amSZujRsZyY2VQ0dzsYrtTO+ev5EYh8Eb2T1sY6SOXYMA66pxUVNYUr40PV+L5SmD9EIIXSZKras1LJcvcWI+1ZIzCi7E2bH2euoYBKzQu6RgBHt4QdeIDBcVsyMlGQpFzBidzqVjY+thoVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by LV8PR11MB8605.namprd11.prod.outlook.com (2603:10b6:408:1e5::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Tue, 18 Feb
 2025 15:55:02 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 15:55:02 +0000
Date: Tue, 18 Feb 2025 09:54:58 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/kunit: Test WAs for PTL
Message-ID: <vm7ofc5d3h3ejhvyiyxo3jr3irey3vyfmb3eqlzvu5fcqd6ob6@tgtqgzbd4ap4>
References: <20250218151057.50478-1-matthew.s.atwood@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250218151057.50478-1-matthew.s.atwood@intel.com>
X-ClientProxiedBy: MW4P220CA0028.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|LV8PR11MB8605:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a92574a-35b8-4d27-f61b-08dd50349abd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1zh4fykt5xw84lHcLjtn4xIvGf8XYQQhMD/exCcq/9jcLhUflJ8KprwURnKF?=
 =?us-ascii?Q?IWIidUAqFMMYYheAdLP4fA6whrwSSuwZyssMAvFBEPSzcGw6MlLkpGDR/xph?=
 =?us-ascii?Q?ccZKpfXlYy0p2XPGcrTxMEX874WEhfzQSpyCvZUswlRY4cUzP0FYWGlde5W1?=
 =?us-ascii?Q?nPHgw1WRSMa6nsbPGU4i++YWXMd6QDxZug90bfqYcKvqG7FMuiLNkLTElKrj?=
 =?us-ascii?Q?QribeCA/QDFqfRv2WSOq9QzrndQhfLD3fkpvLn9RCvr11tatw4DpCrWQeH8C?=
 =?us-ascii?Q?ZUzxODga5CdnQ5OAV8oMra1BuqcrD0LJ0qKPGzpeogl4RH6lr2z6voHYBi6L?=
 =?us-ascii?Q?YZdyWpACWcktgE9+xJJNtmrPjWU2ETLRF00RbJmlnnLD/Yy9GHxUl7LJZSaw?=
 =?us-ascii?Q?uM0VkW/t4KmlVJlreccgkdZVZCR+hQXWmophvcfPS5wzaOhw16xKQ/g67Qa0?=
 =?us-ascii?Q?2IHCrJYikQ546BLhy9mPxI5GN2wmK+13oB+goc48dLa/oAFMgkkilCVW2pdZ?=
 =?us-ascii?Q?JlIQh7ungUYO1z4dc+JJhwQ3lJR0XKVsUV/z4jtQaowZAQXkCO7Dz8j6j8yQ?=
 =?us-ascii?Q?rHeGxGbcEAK5xFTX1PMZ7LR9brEwtM4p0B09UOyAnzw5BwAxobSxur0zekkk?=
 =?us-ascii?Q?oYpMailDLsh8c43fcIJ2zptfuY1Oa6qDXsxvWdYB5uKWGpsXsVgakpJ9PqWK?=
 =?us-ascii?Q?PQocWKRI10YyqPRpxLYFZohppyIuyfy21W/HrAeN2LZMd/LvToa2MPOGd703?=
 =?us-ascii?Q?KuWPf9lgPPiyiyXsZBVKTX+DWo1dfNZG1gB58GWA+79ZGx1CAFBHoMuq5aeq?=
 =?us-ascii?Q?U6cnDPGTn+yHc00ntrUCA5yAJENRo4rBQQc1HigjV+Ur6N+mMgvBmHdgLw4z?=
 =?us-ascii?Q?btHEbOPPtR9J8Ti8+2yfsIzbSaWY9kzXwRs/3pbCJm0TKfWKHpqs8/CMIkOP?=
 =?us-ascii?Q?HyFTRBPUUu9cWCa8HsT90GehbMDse1klMmTp9WFYEzBo8Fsq9Vje483JXtnM?=
 =?us-ascii?Q?R11qwWm3ilajVa5zD1BvuBlAkNbWbAwC8h5tQH+snQiSycyfRQYEWGlAhcrI?=
 =?us-ascii?Q?010wMk0CFLsNDF0uiIGGFDOVyDBjbvppqai4VkHRkHhgXHVbfOnJfztMFL1C?=
 =?us-ascii?Q?+X1sTxm8mGqNNRja2TitchHY75EH6M3o0mKSZDW2vvxiA3GO3NNDcyFrxefF?=
 =?us-ascii?Q?Gqqzf8u7MOKHgVB0oCC61Qf2OVvhcTHUU5HqR7el3BIEK7wfFlaghVcJ6Q+8?=
 =?us-ascii?Q?5Ol+ilUdBmWeuEfdSA2wL2PVYmGnvu75Y6cqEFQ4YxwazUBbZlpBmdANMiTy?=
 =?us-ascii?Q?l81ojk/MYGNgp8oZO4gEVrNSacj5oRMelVFefbGO3AMBrfi5s+1sSx4VeMUC?=
 =?us-ascii?Q?asynbgY7laWiYZFZnzfP8lp3twsP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qBREAQ5A7wVb+Xyfflb2Rtlrs7a9bnrzXXdP3iExXyu47gsZfww/hGNxcMVI?=
 =?us-ascii?Q?qZ4ZIwKotoYjJjdLLsS3kdbzEz43nbn2Be3xUnBIGeFAmYW9071b+jvw4zvD?=
 =?us-ascii?Q?RGT9HlM6eSySlHUk7uiPstrrawSEu1QENSS6yJKKooQyBtlizU82hvAnhIGc?=
 =?us-ascii?Q?J2dvn96n9Mh0mCjHNS7FrRgbgeHCa3Er2crRy2vgC7APAzKAqC2LSmn+IZ5i?=
 =?us-ascii?Q?JRGF0YbrDPfANLEBNRrqTQLx3CUp1k6c5AA0HKcZ7SoQ91I59NcoB/kUTkZb?=
 =?us-ascii?Q?p1PBs3YH66MOMe0MdBX47micAPM5V267wkUTnUMQlzCnFBfU3q16KQ0jDWSw?=
 =?us-ascii?Q?NOZaqT0uVvtON92CK6lZo+fCJ8aVKu7UOTcXpUFUFW1ESnlybcwPSKeAT++s?=
 =?us-ascii?Q?+FumPAxNnocFu0WglRRQNdCAh1CXDtcEE9gXwmQRceo8iBR7l4cxn/kZqf/D?=
 =?us-ascii?Q?SVWUPuDVbC5ytvuIVAYAGcTAENK040HWZaxgEq0uAPfoW4CjObyH82r08LGY?=
 =?us-ascii?Q?dZskUd8MqhR6GqXq0EdNEwDnaaPk+sJOrY0CTQHQfmMndO+HzmoeL2dcjOff?=
 =?us-ascii?Q?JcGE7TAgQdzg5Mk8TyFyKTAP4gDUyACWPmJZq4m9kdAJ7OsXn885gpj0ddRH?=
 =?us-ascii?Q?ww202fhHEH2o1rOzFsauNIRv9qGFV/UWDnntsHHz4EktEnBpftBfdkSRLKQl?=
 =?us-ascii?Q?UXGOc39RUIgKncXQP11+ixpIxLWhYQHCbN8UWARDJHLJTJ2HewoEl4QU0ZAR?=
 =?us-ascii?Q?nKFaTOZoDjmTWeYaBgjWxqI5KW7LM7s1XRcZQ8REhp2WkWbxzmvVD5UYHGQm?=
 =?us-ascii?Q?SQCN0CYqBj1Sq5Itk+MR0HwO+8YMZAYfnW3ySI1PmutSXAN1kgWhZ9BGR050?=
 =?us-ascii?Q?kY2IfT8dR97jlUlIA2fkjd9kpfkePeJeZSjIxAv/vl6+nlOZu1Hld6mNhpJz?=
 =?us-ascii?Q?pVwVZxTuhX1BzsTLSZXzk4SiZA7KUN2GHrtqqlbOBNhELR5elRTXcMpjmZgM?=
 =?us-ascii?Q?9JdQG2pdLQ/m2jEd9zTuJjDKdgFQHMqKseeig3xTevOHRbxNdOaDkkrBgQUB?=
 =?us-ascii?Q?AgvU1vut9iYBdozzbNhbEEzXLN1Um36qZl3k7gEBNnRDUjrNp7o98SNmbnUs?=
 =?us-ascii?Q?VH6WD4dVWN86LUFqL3SdPIC0XriIzlSQdMKnqvMQdXy2SL5iTYK9ulNbs1do?=
 =?us-ascii?Q?5G2PsnX/6b8+zBgbYuKOIWJisP1P3J9X+qGs/80LoFs8Rf+6PO+DLfJCx/zn?=
 =?us-ascii?Q?bpOMTRiwiavPEVJyG2brqDJcNtEoaCnNW7E2VSI+aVBMKSNijbnqpcMnrYjB?=
 =?us-ascii?Q?vS2QB7aIB2CffqrBdJhMIEeaqGGAZCNMoWTZJL+3Pao1eHZ/een6SI5ueIMc?=
 =?us-ascii?Q?DBr+5M5UfdSjdKKXzNFaNU5nyTFUjw4SK2QqGme/emyv8r02q1RbTf4BHsgh?=
 =?us-ascii?Q?Z5Ljd/6Qeyyj4UEbwyKy8axG+vFzu0+mlUe47a7yCWPWd+ni+emBKreDWRQz?=
 =?us-ascii?Q?+jsT0cc/Ef0fpKt9ftQQIKaPnwwtcxQ/seZhwJM64DvVa39v978Rarx1EFWU?=
 =?us-ascii?Q?FxLFqwq/Ima2Jx2T84Xci0yaw4oz9bmdLL3bO3oGu7stD4R6xb7SOR23vshc?=
 =?us-ascii?Q?gg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a92574a-35b8-4d27-f61b-08dd50349abd
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 15:55:02.2362 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RUEpuTrYmBnCjdBSkUsJQtGxm6OumeHPpj7LE/zQCoIuU+5GqmtewM7JOLwRA6Fykv3w7PFgsb7d1nIKlGErV61EqChoh7ZnUzXbNZFY0ys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8605
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

On Tue, Feb 18, 2025 at 07:10:57AM -0800, Matt Atwood wrote:
>Add PTL to make sure the workarounds do not conflict. This matches the
>machines with PTL for CI:
>
>	PANTHERLAKE b0b0:0000 dgfx:0
>		gfx:Xe2_LPG / Xe2_HPG / Xe3_LPG (30.00)
>	  	media: Xe2_LPM / Xe2_HPM / Xe3_LPM (30.00)
>		display:yes dma_m_s:46 tc:1, gscfi:0 cscfi:0
>	Stepping = (G:A0, M:A0, B:**)
>
>Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>---
> drivers/gpu/drm/xe/tests/xe_wa_test.c | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_wa_test.c b/drivers/gpu/drm/xe/tests/xe_wa_test.c
>index c96d1fe34151..416258c193f6 100644
>--- a/drivers/gpu/drm/xe/tests/xe_wa_test.c
>+++ b/drivers/gpu/drm/xe/tests/xe_wa_test.c
>@@ -75,6 +75,7 @@ static const struct platform_test_case cases[] = {
> 	GMDID_CASE(LUNARLAKE, 2004, A0, 2000, A0),
> 	GMDID_CASE(LUNARLAKE, 2004, B0, 2000, A0),
> 	GMDID_CASE(BATTLEMAGE, 2001, A0, 1301, A1),
>+	GMDID_CASE(PANTHERLAKE, 3000, A0, 3000, A0),
> };
>
> static void platform_desc(const struct platform_test_case *t, char *desc)
>-- 
>2.45.0
>

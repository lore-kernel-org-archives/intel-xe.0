Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77CDDCCF9F8
	for <intel-xe@archiver.kernel.org>; Mon,  3 Nov 2025 21:46:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3401710E223;
	Mon,  3 Nov 2025 21:46:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jNgqG/Xl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20A4410E223
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Nov 2025 21:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762206390; x=1793742390;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=jjnt7nmgC6dwN0mId34M0KDxmRIOcbK6LnnVgij2/1U=;
 b=jNgqG/Xl/5aThgg0//gm9tWKLDRIY8qUwyYqCJV6ECAKD09T1alIuOGj
 aFdIq9DhvhGn3sjLHtoOuASTX8MY8OWbDSLQyAPqpQQ3GYLVSANva9eih
 2iDTTGjcBlayGpzTgHdaJuHcHXMT6NtoNxXDXGnxukmqMh3qlFK3brH+6
 K7ChyhQrfFx/JD7cTHPzCX7PpVicJb+BXoK+l1Yvyw/kv4cDCfj9pvje8
 SA/7QzOqHkPM88Gzdem9KMrodKFAeheylkvVCc6fuyMIiixpdDvs++fH3
 e83bNuwzLP85Qu7gyeaR4EVt85RJNpgQ79+EigoX0wIdI7/NQDM9rgYMz Q==;
X-CSE-ConnectionGUID: xWHF9ws6Q7mQzXezTCrnfA==
X-CSE-MsgGUID: ip78uAciQBa7/u35Nk3QNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="64211584"
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; d="scan'208";a="64211584"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 13:46:30 -0800
X-CSE-ConnectionGUID: hZwpBYi9SVuH4zIDrQmehA==
X-CSE-MsgGUID: O44kiUSGTauIkbW60K4bqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; d="scan'208";a="187293319"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 13:46:29 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 13:46:28 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 3 Nov 2025 13:46:28 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.13) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 13:46:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nfh/fDcnfW5k9AfFvZNPpp0PLurm/4agdI22r/USZtro7CYq+XGn4AbVPh6xvINQz+vXXHEY5Edzm0N1ttwF8P/vFFoMnlu0n2scmo6jZypaM9nULGTHwuFkMofXPrRcB+YddEeJRMAZY+LVH5fC5qAbDwjTYAnWw0L6GHjd4kF5Qe/+1ZmiuzOFZhfTXMz53zJEbk6zsh0/VI3e2l9tr2IT+p+9goHkjERplcr84LC6JEd/HNm1UAXnifaUdtey39cvpgTvDd8DTiGYlpw5q7/6KZOtkseTdfQudu0jgjw2N9wA6SxbTXAphGPDsSan1tY/B1kJyzdage7MKEYCrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jml9yScfFxEMQ82z30dX0zNrNa0N6V0hts++AfUGN54=;
 b=W/ndbvFOOy7tk51eEYg4KWWy/nqSbR3SENbc0lMUcs7AZYnNQR6jWA6aUYIY+n5yj8OWJxor57RzfveeR6M/2mOaCqyfBVSeYJ0Frdq+3sm5SOZQVEdKZhf/qkmG3PZjD/10wBdqarOnEnffCL6cK/LKfadQTD/HEw89idUMCVoewDRl8iwAWMwpGgf3KMSuTy3mnKVazUtcvU0rJfpyH/wPmHbZzV57Lls33ozwFvaUTIg3vQpW3hY0C2iDB8pyV2s3gwz4A9yPNudXxS469FN8EqzkZqVm6xnkbDCoVaHkdiMSWqql1UXvOzsyE4gsdgpoIIQVxS7bnzNxUiq7sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB8586.namprd11.prod.outlook.com (2603:10b6:a03:56e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 21:46:25 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9275.013; Mon, 3 Nov 2025
 21:46:25 +0000
Date: Mon, 3 Nov 2025 13:46:23 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkJBVA==?= =?utf-8?Q?=3A?= failure for Fix
 serialization on burst of unbinds - v2
Message-ID: <aQkir0rFTyWv8ZJN@lstrano-desk.jf.intel.com>
References: <20251031234050.3043507-1-matthew.brost@intel.com>
 <176196828101.8736.6651475582499170446@10055242dc62>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <176196828101.8736.6651475582499170446@10055242dc62>
X-ClientProxiedBy: BYAPR06CA0041.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB8586:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ca44ed5-698d-4004-cc32-08de1b22700b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jH25cpmHI1EskHjaVInr+ySQ3vD4y0DSiYpJFtnOW0hA6TRWfX6/TX+iDS5s?=
 =?us-ascii?Q?mWYcszQgHk85ChiSQFkqN0Lhu932zk8MaMbdYhAiDrsUnofl+mGm3oXwiJP+?=
 =?us-ascii?Q?8ibkMbg8EXsztXcp3ZvN5J6C7YdJWzHoUQSaOIrzU9TCxf1/zgG0l61jv+o7?=
 =?us-ascii?Q?LHGCQR8R9cCXcaA6xE6oeABVZCZw1cRJo9tMOQXLhio7Nh8oMFuFIUx7OmYb?=
 =?us-ascii?Q?HJVesxwfXFMDKSXPLnXCTs+XXhOy/GeaYe0o5CfUHUmCl1WJ56MOvIUoH16G?=
 =?us-ascii?Q?YqxkFFBh3uIN6RYSqX29PnOHuf3XowiSakJ66dJnOuOQgtxSs4QSrLrUf6d9?=
 =?us-ascii?Q?yagBgrK8M1PLslRum6+RYUXwnGCv9pkoqme42dUKPEeZR4D5SHo6Oln9s3+i?=
 =?us-ascii?Q?PLi/DL1uwUf/RVG1F4DxEAHxXdSC2Sc+DCiLK2hqtbcwDJedDFcowpov2Lau?=
 =?us-ascii?Q?SBXTmmjKaM97IDqOCI/dfFySqMHqgqaS9KF4bJ206E4YcUWdBL2nd3NUKodB?=
 =?us-ascii?Q?wKqqbNbpbXtoKg07optcMCL7abhYzYo1adoVw+Lk4/6VR6I2uA/mJ7nrE32F?=
 =?us-ascii?Q?Gl8WB86holfGJ5jA7sg3F6R9Nimnclnc2sMy6j7IeaKrO5wQMuMqBlRCJELG?=
 =?us-ascii?Q?diA+wNx5TuDf1pD91LaBH6gASlvPmsipu8Yb60RULM3P7BbVBVY2K8U/0Yk4?=
 =?us-ascii?Q?VEOX7iiVSMpxyx2hqMxw2LD0d2SHcZGwWLTyfBFT9CmKQ85inxQzZzACw9Pe?=
 =?us-ascii?Q?djTUuToG6S6FxAi1g33C4z+fhfOM893bsuLk2+jpeQcbjpFmK43ecMt6KXRB?=
 =?us-ascii?Q?xg6ODUIbA4YkfRIUOt+SF3CXM5F/+x1LNzQXkTZweHfgStHH2/uBADSqwYQm?=
 =?us-ascii?Q?1nw01z54+GcDN2q4LWxbeGrkLuc4/HSP3z0Z9/DU0HFAwq7VeJTHSDx5NtVo?=
 =?us-ascii?Q?5Mid0QkwlRByFwaIki5WHm0oAQYb+wI4X/e41D7510r6yKP+CvX5QFg/1m6n?=
 =?us-ascii?Q?yCucitCV0/ZLZZCdxClUyyuMYDomFunE2utny2KGgEFO7XgjZxMPVYpvE/NP?=
 =?us-ascii?Q?CJmsvIHH0PrNm6zriPt/bauUMA6XXJSK05PuwGxSXgOLT3ZmDaWnvMwF1zPb?=
 =?us-ascii?Q?8rwCg61/3r1a2FgRfMpxCLMoSKQjIVl6sy0fWsim2SRx4CJc+Tpt1fpLT9as?=
 =?us-ascii?Q?g2vpBf2Pr8xwGT8f/XXnzZkJWF/xW2YfbjSLGqxrDChWo80cd9Pf4Cd1QW/n?=
 =?us-ascii?Q?NmhzbE/TdSYFmpXvme6WnD1NjXVirh8OiwDE+JupG7dE2fnQ8Z1OAgIAZCs7?=
 =?us-ascii?Q?AfBlixNSjFTZqSpQyEF6rZhMfFH4F7r1RekoLup5CEEGOCnYInPGWxFbERKL?=
 =?us-ascii?Q?4+ivyaDSeSHQ/laoLXJUMMaJjYYvx+KhKEtrjcYixpAGKadY0g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/IGEYUekzWUIC5gO0reYy5lvU9cK7xcxtGiQi/DM0i1uxBKe9EtpRzVXxyCs?=
 =?us-ascii?Q?iUCXjXmgT5Nf8bbXVR504KBlPXVY8pBIOJW0/ODcRlMov1JAR8W+OhNMJRHD?=
 =?us-ascii?Q?w6thy+GvsrK3gcH5dC6NKXUOEi/Fbg5fnkf3BE+b95Q9N/6/RFL7HF3MOAka?=
 =?us-ascii?Q?cTOkVSEdoDIR0lNXncuq68lEOO1SGFuM0QZ5G0Nr/XSHZPv21asUjbec3n2E?=
 =?us-ascii?Q?CanQt9BmKJuDyl4nPHeyvMLK5LA+6qo6F4LI5I+yVp5P91BYCAtZfae4hHEq?=
 =?us-ascii?Q?g8LN7+bHhVrk5mMAmyOmQMvPZoUnK6H7DX2JDSXC3/bi2t/R+ppyHpPE7Qku?=
 =?us-ascii?Q?HVegfo+Zjbthe/qJSiKgry1bjYVkEA78DOa6vrWF2jbpvrBLXbukMn3CoOee?=
 =?us-ascii?Q?wF08O5lmFPUZo0L0Qv/ZuAR5TspKDFROHV5Pz3VPFqVhzS55RO9h4ixB5xmL?=
 =?us-ascii?Q?4dI1ilev4EAN1FnhMyFE1cqhDuHavPmyO2gz7Ejmm+QszcWN6/6icium5OzZ?=
 =?us-ascii?Q?Ome0iMWI/MsfGu9THEV4ISzK6k5JAqOkcOCokyBE/snm+t/WLO1cu+hEUBHM?=
 =?us-ascii?Q?QIn7yoj+xDN+sXR+Qp2L1yqwAUDwzqQI3k3Jqt8ItkrOeu//6mMy4Wa2KBpW?=
 =?us-ascii?Q?262WJW6ZXM6vJdrpnYcbfjmeozknsOs3NpJhUCuBGgjmkrVb/+E7Yprb8r1e?=
 =?us-ascii?Q?sM+4abnnc8yjLGJje6OEzgjSUhEmw9g40tHYFPeBJEODkBkuEXVDnOiJCXwM?=
 =?us-ascii?Q?EjKTuks55O+7HMythIpOclgXmC7sMognT6SzvrsmxNybK2QZ6uJgOxtymI0t?=
 =?us-ascii?Q?c0tnn9hf0a27Q1E5ERJs6Q7S2oF/21Jk1mmi6Nr+FHmN5TvktOoGxH2O8yZI?=
 =?us-ascii?Q?1YhIkMasZcXWZ4O23NrRXioE1PQ2riJAmVknPy+a96XHxrs5A80dHMJBsuCf?=
 =?us-ascii?Q?YzRccBam+Qc/FuIkq2xD/1T7hl7Addwo9txy4CVaHbEbBcjrUZhIZoYtgpO7?=
 =?us-ascii?Q?qClbJD4kSzHIk7f4o5riNN0a6nUnjmcO7kKmiKo+vBvX1w4D0UjfLqKxTnDw?=
 =?us-ascii?Q?Q9LMPGeBK40EbQiJM0hHIvRA/VELiPTR5FfijnB4SNW+ncm7Dhjqd3IgVmvW?=
 =?us-ascii?Q?MHcYTU4dyjtAiNCGrRIZ8Tc22XX/KNiiLAgWuv0SdFeZs9RroqVCBpasifW6?=
 =?us-ascii?Q?SvOnXXFrDCi66ITEek9o+aSTclscIM+t14ba6W+yhktUn7F2x8vIGsLNKjFQ?=
 =?us-ascii?Q?GI2Vk5iZQYPMRi5r26kfzX06RW8m+/tjESuXdycUbnqS4+yXnYD0nFn49zL6?=
 =?us-ascii?Q?Sukw6IEbC/MMJVCUiPljPqH1KV1GHqy1/bBcQ/TVK8JyCGW8gJQ+LGUtNFQS?=
 =?us-ascii?Q?hPSpAR7NBxdiOk5sDu1GFkXcei/7MsxkhYoQNQ13vOIeoaOBe21B7ulvF9cG?=
 =?us-ascii?Q?hF6RntDVZuHgY6H7SIo4kxPKJsXyhpaYLO+6GjZn3f3G+2YCP0CY4nGJhA5T?=
 =?us-ascii?Q?igBBvJND+qpWgKHd/DpiZoAJvM8VlGBAHG4sqV4AesOV8gI4Gb5qJsV4e255?=
 =?us-ascii?Q?7gjmpk+ML9m0fK/J0NVa6mIawSsSLTp+G6XSEt0NqJ95M22SRaB5QZmCedfK?=
 =?us-ascii?Q?cg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ca44ed5-698d-4004-cc32-08de1b22700b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 21:46:25.7773 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W9lnB74wEmqU2uVW0h/wWIXmPobmKwaZ2ma7w8+cNJ91FKKC9gwieJ868QLxUrzlTNplYZbITjNtjK25kGlb4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8586
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

On Sat, Nov 01, 2025 at 03:38:01AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Fix serialization on burst of unbinds - v2
> URL   : https://patchwork.freedesktop.org/series/156873/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4027-089e83683d58db86cc4c69d34fba3a96904e40e1_BAT -> xe-pw-156873v1_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-156873v1_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-156873v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (12 -> 12)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-156873v1_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_waitfence@reltime:
>     - bat-dg2-oem2:       [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4027-089e83683d58db86cc4c69d34fba3a96904e40e1/bat-dg2-oem2/igt@xe_waitfence@reltime.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156873v1/bat-dg2-oem2/igt@xe_waitfence@reltime.html

I haven't able to reproduce this one.

Matt

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-156873v1_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Possible fixes ####
> 
>   * igt@kms_flip@basic-plain-flip@d-edp1:
>     - bat-adlp-7:         [DMESG-WARN][3] ([Intel XE#4543]) -> [PASS][4] +1 other test pass
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4027-089e83683d58db86cc4c69d34fba3a96904e40e1/bat-adlp-7/igt@kms_flip@basic-plain-flip@d-edp1.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156873v1/bat-adlp-7/igt@kms_flip@basic-plain-flip@d-edp1.html
> 
>   
>   [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-4027-089e83683d58db86cc4c69d34fba3a96904e40e1 -> xe-pw-156873v1
> 
>   IGT_8605: 8605
>   xe-4027-089e83683d58db86cc4c69d34fba3a96904e40e1: 089e83683d58db86cc4c69d34fba3a96904e40e1
>   xe-pw-156873v1: 156873v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156873v1/index.html

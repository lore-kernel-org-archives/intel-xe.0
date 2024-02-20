Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 966ECC48BC4
	for <intel-xe@archiver.kernel.org>; Tue, 20 Feb 2024 05:45:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39C9210E101;
	Tue, 20 Feb 2024 05:45:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OQKjV5oS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F215410E1BD
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Feb 2024 05:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708407904; x=1739943904;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tHoZR7f823Gy5O8KYUcxWCkvC2sroipIM1ZwZY588Kk=;
 b=OQKjV5oSB9KHXrcnVPHBmUFaEA1sKEhFHlJvxkureBJeieQESk/mfvPS
 VXWOvEn97l6Fwp3STkEsjUUfOrIDqWAsI72aFj3opi65zVVWD8vtbvtOH
 iDeImvdpO3fF/5kU+c+cb+vsAS3AQmRz6gzcLM/Dl5Eg2tlNdFKX6z/Ub
 l0hcWx4QgoYw1qt1G1X5FiKP4Sd0vW/zUnnYaydO3zCFD4ZdAK9CBZEEl
 tP4i0QqaorU5EOCF4gewva0ScheqrofteMFv13bW/zjoEEO4B65rZTPzM
 ak14F+17hZ6SLSf2Wc7a8algrLC7rANpNHnawkh8O4gwesIpFDNlHOKP6 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="13050017"
X-IronPort-AV: E=Sophos;i="6.06,171,1705392000"; d="scan'208";a="13050017"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 21:45:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="913011922"
X-IronPort-AV: E=Sophos;i="6.06,171,1705392000"; d="scan'208";a="913011922"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Feb 2024 21:45:02 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 19 Feb 2024 21:45:02 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 19 Feb 2024 21:45:02 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 19 Feb 2024 21:45:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=POiZ/MkJGwk5ActuYs9oT3PvLjYmSiuwCyqqHgRRZ8p+fWaSNKd/f8GoTecGszdPFKRdZa/BVf1DpK04L3Rnq6aGQu6KCVALxYaVBU7FxzpNsJMzv77md/8P58xIna6ENXcdmlKtE2P8bI2EXmCC5ZHmxur11j/iSNmAKgYZWwORm0UB0XcHuVA7rZPDEr1kyMbvq3D12SQoO89zy1nJFBCkKsWzOiqhlOEwolZOZHqBqiOMDFl2HsZx+MK4NZ4WbGUovoIy7vFeum5KrVoAxbwpsjNIi5NwoExs+NxfsctCg+LnmGKEltwGZVnOE5pKzM7BL1WVdXUtzBSNspPhFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tHoZR7f823Gy5O8KYUcxWCkvC2sroipIM1ZwZY588Kk=;
 b=fvw3ERwpG1iIwUR55ZW095kn3vCfC8NRjhUyEGCJEijPe22f2qYm+7Bn/WrgSbwWMXGgi9HQBeP9VfdnOWmDF/ohu+xXYDJN5I6GhEOo/+FCxZBNKg/oLfFvdk5z16rvAFcbsD1A8i/f0Og/8f791/PSuyFtQA7PrDpjEOkW1W1mqJmjF/XlwGqzLybmVbFS27pcUBp24+jkKnA+Fk980/DIlzwhmuh1VuuLq2KjWRJOwkurd7x9o8kkLwlbnR8ZZHkCq2VaqEGjft3ste43Wu6npwMeAxPd+U7/BlOP5N1xRF8WJF8Rm7dl6vMrT/fTdE87AxiYv6FFXOHsfYu63g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW5PR11MB5932.namprd11.prod.outlook.com (2603:10b6:303:1a2::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Tue, 20 Feb
 2024 05:45:00 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7292.036; Tue, 20 Feb 2024
 05:45:00 +0000
Date: Mon, 19 Feb 2024 23:44:57 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Dafna Hirschfeld <dhirschfeld@habana.ai>
CC: <intel-xe@lists.freedesktop.org>, <ogabbay@kernel.org>, <obitton@habana.ai>
Subject: Re: [PATCH] drm/xe: avoid using 'grouped targets' in Makefile
Message-ID: <ubtbma6zlqdhh5ovx3437q7oyxgn4n2ct3drc7ovvaaong2awq@n6r56aduj36l>
References: <20240219135845.1463992-1-dhirschfeld@habana.ai>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240219135845.1463992-1-dhirschfeld@habana.ai>
X-ClientProxiedBy: BYAPR02CA0070.namprd02.prod.outlook.com
 (2603:10b6:a03:54::47) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW5PR11MB5932:EE_
X-MS-Office365-Filtering-Correlation-Id: a603b737-7fd2-4593-d693-08dc31d713c9
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: awoSV4NS3BWyKIqa8iI+W+ADskvmAHh+/kIwXSkB3OV3wHFYQRLapZHYmltZHCAV+vh/zUiR8HQU7Mu2vomv8vySkwEkzP25f5Bk3gugAlzgQw0M4Gx+tT1fQI/cW6/ze4WiigvcLRD6C2k8Pk/ePUgykVNOwEHbPnUiFX5FbJX70xRvoPy42XsQipldwmluEx9IVj76YiYLhLx9s2Kyc0H12MJ0OlUSz8nj3Nh4ILbPX0gdQd+Oy1H336ObihnSgxsWLjf2nngS1vLu9qV7phVwdgc4fc7sr4ri/VXqaeYK6z+d0QMelfDwrRTkVA63VuXAXG7+22OZpKC6NCFtiu06ia4OggziRnv1VGQfMnYt8/7ONumKtyKAwjklvRbm7SAvPXqUmRuajsKL+HHets2811XXNRrMXQqaC/GSCR4urxKhr/UYPtqtd3wMSum3NczE01Y26PJecKSirv8L9rwuMGrKI8vJEZJxsYK1uQ/41C9uCtedj+g7fDqbOVwceE9rT3IH+gpPggKBeQgRyCPhSwHoxyU+T9shDRbuS1o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9+7LNGAP8ZEOifb8L5TfxSVNd2kWPANVcEBGvMSVSaOP5e70gk2h2t2eap8i?=
 =?us-ascii?Q?RzNOUxjhlhHxvQFbSZrD7KPGHymmEuer11nGAOU08MGCB0QTp0AeuFTSJmVr?=
 =?us-ascii?Q?67H1a8qtH9PFMDOSi1PV+9UyDui2HQrlFveaZ0nj+VM7b80yu9pQFlspkswB?=
 =?us-ascii?Q?x7F6LB7zw6dNAsOCerayu31QopPl9rgb404GL45Bssn2dEeGe6+cF0ZhWxqk?=
 =?us-ascii?Q?3cM6UeFn9pT8YWZKK2zSqAoN4uGu0badGN4dQ5FAGq5Sd/HCOWN9zmOVLB+r?=
 =?us-ascii?Q?TginKT9pcqE18x/GFL0wSKqA5ExpFql+oduV3kPcxroUKnG+5qy8pJyWvaEi?=
 =?us-ascii?Q?4VXvmG0NUunV7encdRwGwN6Pb8jO4vK8r8ylCFi+PCg7RFRxSSEIkggNQjK3?=
 =?us-ascii?Q?+Qy1bJzTXM1zDpshOcin2bmeodekyMxaoYNk/mzoGSoOe8+zue1myd+iBR2e?=
 =?us-ascii?Q?RhMc/J48/tlZVPsMf3plZjd7EkzSjE1UefYkVjm5NEwuJjso4D+6Mn5s5mYp?=
 =?us-ascii?Q?JkI9BvIR8nHiGfdROUAvygBLidJGFBbeGgbf4BK1JLROMR/8bBpUOXLNOufi?=
 =?us-ascii?Q?Ty3omZ+hgEJDRTpc1JM3DPa0ww7ue+/KAVOE60eP/06B8Ll3gLT6MniiwQ5k?=
 =?us-ascii?Q?DLtqBSzIgAcmFIFQUnbRnwhdnpAVK/ZJMTwUafd7sYRrEpbdeDeDuGfhBhxc?=
 =?us-ascii?Q?uzC4HQxG8h9MMWVVQpSUFklwj2Dh73DsDur9vNXxBAEAAU/VpTfMcx852ng1?=
 =?us-ascii?Q?l6Wr5m98iI2d8/chb4P4wQZqTIHngHHc4qNI9L7ariXoim58yTl0yxRCAEBe?=
 =?us-ascii?Q?G+27BMZtMSysHC16a7/Nnlwt3Dab9UzA7u1eY2NYM9bK8flR3iRCZRvtDv4D?=
 =?us-ascii?Q?tAE+Tr1UtLAZ+vvqVFvLLFb3s/0Miymk32ptsbv8ogV4/vAK4qWi84Bxekl9?=
 =?us-ascii?Q?oMETu9GrGJFOk6YS2GvVdFdd9ZLLcxD25nF9E42e7R4yeE4TCil+ZtUBmLgO?=
 =?us-ascii?Q?bawADSk+vrRcr4hn2tj+5YTjQTfbLHcWdeXOiGF2pScWdMABJ2vmgvDqiCyN?=
 =?us-ascii?Q?1E4IO0I2pqhNJDr6KZ170DegXov0IwG8aBCLrZ08sVMxVvR0IDMd5/lPq0RH?=
 =?us-ascii?Q?8E7sLI61G1p+bgBHps5mXGql0tMepdtW6TTCeVBiTjjo7qhcHyWHH1y5oLAe?=
 =?us-ascii?Q?MO2F1gazvcwL7YFgPhPqVGBwoICot+7i7YG3SINNkOtFYI9iz41aOs4bqL/Y?=
 =?us-ascii?Q?UNhDlRZBcbKHW7IDnfG3LeO2vGBuKE7FoeWvcx5rN5wOsC92pBuO+FDbWYNA?=
 =?us-ascii?Q?GEch7L3ev7fUJP3zQGkE1IWmWOvdXcLmv2fcKaAWyWpqzdknYnI40znp2TOv?=
 =?us-ascii?Q?vLwXy9SumqnqqTfmYE8Ag7GqheseX3gQNkWGbJLq374C+v0GJKOuAIzin0/H?=
 =?us-ascii?Q?Un20ZO7lbZFsMJGseOcMVC3uLyG5q27vOEjKz9BWfKnJ3vylb4TYEGak21Y8?=
 =?us-ascii?Q?ZBHBbkbTm1bQWQfRq1vPbDQO6z6VOpWRBv6sIo2xJFvj4FobZ12XgDKRv317?=
 =?us-ascii?Q?XiM96ht12bh1FnHPsoEIZWJyNuMHpCBS0bgrPEJbafERyXnIXkFcFAq66TNE?=
 =?us-ascii?Q?3Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a603b737-7fd2-4593-d693-08dc31d713c9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 05:45:00.0751 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bk+zFs+TosD1BTGquLswQnxPWIz21IaSoRtfTe2W53aX9m0hBbfHpSwQgx7A0JnKDcxJkW68bHxSVi9OmnlDn1mtizgNfceO//Z5gQl6GAo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5932
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

On Mon, Feb 19, 2024 at 03:58:45PM +0200, Dafna Hirschfeld wrote:
>The feature 'grouped target' ('&:') in makefiles is only added in 'make'
>version 4.3. This cause problems in older version of 'make'.
>(Specifically $(@D) is wrongly interpreted - it creates 'generated' dir
>in the source path instead of the build path).
>Avoid this feature.

but it was used for a reason since a single invocation is supposed to
generate both the .c and .h from a single invocation. AFAIR when
implementing this, not using grouped target would be a mix and match on
having a succesfull build. Does removing it really work with incremental
and parallel build?

Lucas De Marchi

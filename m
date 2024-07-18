Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFEA9C3DA49
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jul 2024 13:02:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3F7B10E819;
	Thu, 18 Jul 2024 13:02:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mSSn3q0J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CD8210E819
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jul 2024 13:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721307758; x=1752843758;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lpIZZ4DNzURMEtbPwVDkUtp6UFi+8ZLqnFNeuVGQCJM=;
 b=mSSn3q0JwkIuw/I745XpnhE4WuXq2CuJha+YW5ePTXuSZDkcOjribuFS
 IstD2xEBPVJeOoUgzQDtYbF2kIlgm5ozqR3MpF0SXxNeEopeo/cR/n/Ii
 NUxdsDgKEkuTERx3wRymBNamtyMquBNttl3E5yOM8Wh632D9PLPzBKJYv
 /dRdFrkq5b+BkmsqU60kOcEkpgg1Onc+n4OjVMl7PX1+81m3Du1RFaAEC
 E9QRNpRKt0SbP9MO/6DuiSwKbpTmbZ1+WnP95N7jEqcn6ykjtGfpwP7zl
 O1CXY++EmDl4o0lT9W+OczAxD1AUh6yTTPNqj+y2737MfSX90KWxdNrTp Q==;
X-CSE-ConnectionGUID: qY9ZTzvKTleqYIu8HPgIgg==
X-CSE-MsgGUID: A8hFR4NVT7qUPJmID1vmvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="22636460"
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208";a="22636460"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 06:02:09 -0700
X-CSE-ConnectionGUID: /GnddSFBR5eG7wIVFHkmCg==
X-CSE-MsgGUID: W2jCm4aAS769U2tYp2KPlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208";a="73984361"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jul 2024 06:02:05 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 18 Jul 2024 06:02:05 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 18 Jul 2024 06:02:04 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 18 Jul 2024 06:02:04 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 18 Jul 2024 06:02:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OPLZXfflfzmG5Ke/Ni3MpHR3gu/VbqPZLE+fOOl5UWTa7xas5izNTUT5n6vVbH3D1epuKyizEVbgzL38w9op3o8zA6NWXaaCjyGREBAe2IQENBeyVel/RqmIcn1ULCz0JFsdUI5+SUHthEZhDjjtT5Aj6HSVCbZO0Jgo+YErOrFIidCcTWWjNxe3HjgiPhAIaTql7nD188hF/H01fSkTuf9+OeCIKiuWg+u7vQQiOwEqSXU5MAmLJpUH6hvmmuUI//BnjWjFEEmiaXMp84Ge6XFWPsp/MtKlnOPiaPMYqPJJLipEypjX4NSnxhLAWsQOj53IhsjVgeL3zUTxo5ZFvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lpIZZ4DNzURMEtbPwVDkUtp6UFi+8ZLqnFNeuVGQCJM=;
 b=NS7iK4r8kmkoWvFXy386NFqUsoJC3qeTV/Dn8Lt7h0TEJ3iNZXn5XUlsaFCeCgd3l4BniFJJZkrvWLWf0ELviZ4W8GLFSBPwJwDSCdT2LUp4FciENWQLLEIjBsvgzwgVuyqI5L+1kRNwpZxx+gDU716Nmc7aRRKPnFmoP41gu+A0C3ercEwEUjqJTjIQw7QjsKXbAizSgBQhyNUS7ISaFjTsM9L3NQZ7k6P2ZeQSZurgoinPJdvHR6xk/0ovkVTCS30IEKpnpIQqT6IvuXW+jL7znGAqV11auzJszsO7AINofH9JeOu2pV8UcEFMd3buDAj6NpmXxEDR1yjL1VXAaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB7727.namprd11.prod.outlook.com (2603:10b6:208:3f1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Thu, 18 Jul
 2024 13:02:01 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7784.017; Thu, 18 Jul 2024
 13:02:01 +0000
Date: Thu, 18 Jul 2024 08:01:57 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>
Subject: Re: [PATCH v2 3/4] drm/xe: Take a ref to xe file when user creates a
 VM
Message-ID: <3ukew4goqnniqgi47btx7hh5zfvlwzd3b37rvxn6epueo5zgje@g3kau2wnj2mw>
References: <20240709002835.3372618-1-umesh.nerlige.ramappa@intel.com>
 <20240709002835.3372618-4-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240709002835.3372618-4-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: MW4P222CA0014.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB7727:EE_
X-MS-Office365-Filtering-Correlation-Id: 8415b12c-daf3-47bd-78ac-08dca729d06c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WOyGxPajpIuF0xIcNbWSoGTv5MwN1nVbVxYWWwRr90N16ldqQWZqpsxfEslk?=
 =?us-ascii?Q?QNFc9R7g2BvPKPNok1MSwgdCE/3MyzNzazNEx+oAoPYRH825gmOgVdBl4PA/?=
 =?us-ascii?Q?XIwMFGDXHSjViLsXPyFliLLj+OObCVyEYi8+lh++FJaCio6fh21ANL0gMmBz?=
 =?us-ascii?Q?Fskhga16a+Y/PA25oPqAhsTPcUg3tt8rfP2SjM04ZnsF4dMs8jxV+IiVrABY?=
 =?us-ascii?Q?CQp0RWWMY4poed0m50benRBI1zpnEv4y85uHVYHBDrr09t16SgOI5T17IkdV?=
 =?us-ascii?Q?LUciAdCGtqGShfUdraUKNXEjqRIT4NL7gqbCmVRdVMOOZKVitc0pMylli+NE?=
 =?us-ascii?Q?UZsxIa/QflZuwzN7G1PP2jyWst1rpMSx1vQ7ANR4ANNi7Ro59YL7vyx26hvW?=
 =?us-ascii?Q?DGcuHck5zrQCYZeUFPrEnHc+7ch3moGNWWJuXUX1yAv841rA2CsabTbshIdY?=
 =?us-ascii?Q?iLJOxrisPsqQVKyjkgZauu8met6txQWLCYzdnEXgCjpeFjsd0HUNW7Z2K21X?=
 =?us-ascii?Q?EkPIbh4W8yWZaRHpN43z0HYPygmK/Y+BNZ4pzYZf35cneKqt+gW0wj54F2OS?=
 =?us-ascii?Q?H0yOXxHyR1TKHkwSuPwJDe2QdBfXGr9M5QiTB5DsZHYuUI7nByFDOxECdpKJ?=
 =?us-ascii?Q?5kMGn8xWjVGqhGdMUDx2jzs73uJuiyy1Y/+r9Fcjku3wG80kIf3CI9glfDCD?=
 =?us-ascii?Q?0sDo41aDGPhBLy3vTWdfLkQOCnhK5UXz52voOiG0sI+d71FLQhVzlsywwNBZ?=
 =?us-ascii?Q?xHmhZtasT1awdMOYUZnHPQqXb006sYEzlH/wwaMnUqJR31hk62FUa8mXH2CR?=
 =?us-ascii?Q?xXCyPVpnuQv8JnTfMyYy2cQUI9NHHz0FHv3RnxSsWuqzJfX/3H2viFZuB5lI?=
 =?us-ascii?Q?0ZYTTWa2P+4zbl1BdcYI+MY+glpbY7fjN4ItzkO363XmXM1ubAGPwQRqnjN2?=
 =?us-ascii?Q?+MGOF8+emX7OPndTq8tKzT3SAaYehVph9ykkPM9wZTh7Pb5UaT5FBCmjtYdp?=
 =?us-ascii?Q?YFf2ZWQm74oOpYuBcNkqzN/37jdwz5SUK3tdS5K0At7TX9zyk+WD4B+M+lP+?=
 =?us-ascii?Q?Kaq4ob5nhkhhW6Ye51Ndslhz/F9ciBU2Y7cFS4+kGMhZJbEE0Dlrvkm4KlEE?=
 =?us-ascii?Q?cAQ37DMwBwFGd4MZbYUgLbBvzvVBHGGqsbc4Pf9OZ2tCv67i0s4R94rdYDWs?=
 =?us-ascii?Q?xm29PAbvoVxMhmj4YDtLqGz0R/c8UleuqrlQLE70xxpGaNEz/B9xVuAr3G1+?=
 =?us-ascii?Q?Vc8UqdlMMtWXAo9/ntByx2FfA1ICmvBsI9s6PrTRiIAmM9xV8P57klpOhq9X?=
 =?us-ascii?Q?054KC+UWHZKRx1LiLJsoPLUkC/5e5l03ySxzdMjhi+7phw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bscbg80NDHERH6JWv0Q+kX9/onPQBZvobjWcyjWN6zxVVup1TiNkqzTELkvy?=
 =?us-ascii?Q?WDF08/YKiaaI0eGtakmf1mx+V/+0VxAuV7napTPInoJRi1WqKSK+KU/yuPx3?=
 =?us-ascii?Q?0u8i4zGftiLucpUOIzxPPDYa/4QgS5ppWgprz1Q3+qLZaVNQw56Ykm25Fn7G?=
 =?us-ascii?Q?pGO7jQ4Sht+q68sNdqcBAmCuIW0zXMVGAjIxDxsILHYUFTbc1xjKtt8cmpZ3?=
 =?us-ascii?Q?LT+MRbXu6eGHUJswi7Z3Urq+VZjiMiZ3P1NF29Zez9+2/hXRT1sQIWKeDzuB?=
 =?us-ascii?Q?UaJu/GGyWCBCLGgN3BwBOcAOD40rpMaCdmmMcDcPY3dXzAF1NpyODlEJdg+U?=
 =?us-ascii?Q?aBsXHYGdzK9wEUzcmtu7bPN32vkIEX8oKGXQ67ka887v+NtskMBmFs8qbzP0?=
 =?us-ascii?Q?j7bbIoMgArd/nkV9QFnhlpyWT0rKa+OM5euMljXQrsVliq1HuILexP0p/s3e?=
 =?us-ascii?Q?sZd3nz+JbcAVUoc4DLld2w9YU5WaGZ/1D4IuL6UoYynPxUDNxC16FpRifxYX?=
 =?us-ascii?Q?nr2ybnXG/K4KLzQu0fW5a6c5BdVQSSbcOveNuT9ohsU4oz04nzOeTDHXtBEO?=
 =?us-ascii?Q?XkXPr+v3VWEv7Gj+9lbQEv6THbre0rAL9GRpG7H7K+gQclllDV1imxyzy1Hk?=
 =?us-ascii?Q?ghKXBbFpfoR/xB4i7N6cov8Q/KqOMRV2REk4aK9CPQN1z2Ip2Aro40EZErzj?=
 =?us-ascii?Q?kvRw5S8ehlzVfrUIGlAe7jXVyjKXZoWbKDu7qQfWLyOLp1Ayy+ybdnn3c3WE?=
 =?us-ascii?Q?NsTGDmKo3wQkJsEBF3BGBumsjV4rGhY+LY1WOyOfA4P8Dlfn+rptOc6DcKgt?=
 =?us-ascii?Q?swWsk3yjMkMDreOMuzLF+jOe6jp6ne5SNqSZVuN9DjI4kyGmldwz36G3+r8q?=
 =?us-ascii?Q?K/U0yjIJVHbq+L1QPhZ0vQCeHmnwBJhIPBlfqFK/AC0U0AF1o2iRhZ3rf+B0?=
 =?us-ascii?Q?d98RvpHrovzbZeiFFGukYRFgrFddJhAcvS5FyMZ74aO6HUi5MTZBAyaX+gtX?=
 =?us-ascii?Q?ccu4k13zusKZ+13PiBCt4knkHNObNVhl0nJIyzgT3p+cByjL7SNEGbgTQwSN?=
 =?us-ascii?Q?N/0q90WQIh/14ocNZIMF9ctz+59WeNG6CneuLDh/wQp9cAI/RiJNLW81JSDH?=
 =?us-ascii?Q?Kff91eWRdJbTtaIKLzKOrhZOqdGEPXMW7aMIqqVM63PuH9CnabBlrNCUW9vd?=
 =?us-ascii?Q?5PIFn8zrtOlee0mOuzRY0yc5Vsxr3fvGsxwnPYv7xzCPZFt15oo/NFwyJakm?=
 =?us-ascii?Q?LsSEHLOl+CQz00OhtamPtGm/nCrLROk84VyGmwM6hDFMUKPSrk5HLevZFW93?=
 =?us-ascii?Q?6zUnOMXiFm+WSWljzEZ4PeUVLeozfsxZ+kQ6yqHEtUiCwxoi6Ye1fhb6Lg9L?=
 =?us-ascii?Q?XvkTarAW8lQhwcWdmo6Le3YBT6eP60bvQnWJz8wyBZagFGO/t5jsGl6x+pys?=
 =?us-ascii?Q?wrMjESLvsJD7/601jnsXyprkaTD5Jn392Z2EVXwM6lIlAzWMk5zCrZcikzIH?=
 =?us-ascii?Q?XuVW61kNLVsRu7mICZCnXfP99NZdLm05xJC+Y2bQYV1ghRvS9mtXaBR0zZvV?=
 =?us-ascii?Q?fx7zXJx3rKluYJI1Ee1UBhKTyCPcQEdcBdRIDTrP+0/pp5BUYwhoILlO/zlN?=
 =?us-ascii?Q?Ug=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8415b12c-daf3-47bd-78ac-08dca729d06c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 13:02:01.3671 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ixccKkOVMgbb6mfKzhI/dO9DpO8/lUDJDtek2Byb93PcEo/XSA6ySoTmn4gdZw1M5txwd7+l5oJIzLYxGPnXjDKnr4wo1LAcQcEs/DT0N64=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7727
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

On Mon, Jul 08, 2024 at 05:28:34PM GMT, Umesh Nerlige Ramappa wrote:
>Take a reference to xef when user creates the VM and put the reference
>when user destroys the VM.
>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>Reviewed-by: Matthew Brost <matthew.brost@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

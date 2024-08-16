Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24647C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 16:08:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E188310E800;
	Fri, 16 Aug 2024 16:08:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="blsh8PTj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A1E010E800
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Aug 2024 16:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723824521; x=1755360521;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=YDpDSBbjo5qht2przVrugYkf46q6BfpSWCNiXNAfO6Y=;
 b=blsh8PTjbpSP6WIITsM9HxD4X8CXHppCOV8OZ8ejUkjA0pi9Go06Gvor
 c6eNMqr6qeX3oU661ZWAn10h8GGLwCJcVtbAoYi/5C7rbFzIZFYD2/KMQ
 8bTsocdPth/K2DD9mLVGahIJYQtMJ9aE/tXa0FI0yaeW39WNWaM7pdRx5
 4gsb8MQENEd1j+XyenIMooc3L9DDhe/kt5yyHaqnw8eLXA8lfwRvoY9r+
 4nRFwhEQzYYtg6waL5TKjdVggiwuAuKEFKVbsmybUWcHDWLkzfUYp0THN
 nhUdbkzJz/n56HuAT5OZ0jpp42sMh2mRJH1t2kAQWc6EA4TNYQooGrAeF g==;
X-CSE-ConnectionGUID: TGP35nTJRO+gvyScqYgcDw==
X-CSE-MsgGUID: cc8DydyaS9ypfJVgiYYPjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="25922480"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="25922480"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 09:08:40 -0700
X-CSE-ConnectionGUID: Nv+ewOjXRyabS5DGpGrfoA==
X-CSE-MsgGUID: 6diUgHDwRNCB4B/bkhDJ1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="63891718"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Aug 2024 09:08:41 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 16 Aug 2024 09:08:38 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 16 Aug 2024 09:08:38 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 16 Aug 2024 09:08:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n+q7b8d9qAf6NRc8TQbBNMaUGTUz6pwggMud9pBMPttCFS76+L4L+ViMFiRJcQmxe0qP8vTgp7niamyLZi0q+/SbZJ4GKhIXtAMFEPKIv3FEKZBwKpt97dSGObCFUkKfUFdGnuDqouT7u6J1HgOExOsQw06BuTcFnNdxdoIR9J00wW6OEkB/obl14bFhN1KkpXu4hdQjAjsnMl1iAPiAPEl7ZdWyjcz/6Lz4BAoJ3PzmiT+L9Z5OU82o785W4FBkgstnkCHlXametNC0ijPhABa/PO09XnlOoQXgrdF1cdPJGm1Rzw32oSFGs6bR04WVh4bAJ9Vk0BEHh/F0OfnrIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=myZaPz8GE6isy9D84S3Heyja226AQab9t8dhoZo7WEg=;
 b=hCwWTXJ5KzvB3W8B7I7FZhwOyXv5Z1DWurd3NlvJs66Cp9KAkV6GF9Z3DQPzonKFCFB+zyfYFVFewv1gGu+bScFxxBhOUwcnMd5fbUkXYhVeyq4FVG7YUWbfNSllVhpM2V2mbE2DLEbytPcIEbZEePIiYri+c//jPc6dGauyJwFdI98d+GWdqEnhKVwgm0oag07NgQv71ocBTdeLgzDplIc4hqQkhbdN+45fLuGZiF5oKHf46+0j2jXKuGHwRtpqPmKA3GxF3wc1aWV3CfSkBmeX9i/RUrTuM5i/Nu8YYenVCyu1X4sEUpGHZDSNOtHstxb+kjH0lnCIeQg1d1qmFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB6040.namprd11.prod.outlook.com (2603:10b6:8:77::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7875.17; Fri, 16 Aug 2024 16:08:30 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7875.016; Fri, 16 Aug 2024
 16:08:30 +0000
Date: Fri, 16 Aug 2024 11:08:26 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <jose.souza@intel.com>, Matthew Auld
 <matthew.auld@intel.com>, Paulo Zanoni <paulo.r.zanoni@intel.com>, "Francois
 Dugast" <francois.dugast@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH 12/12] drm/xe: Fix missing runtime outer protection for
 ggtt_remove_node
Message-ID: <mjynpl7ebpbmpzqncu2meyhwb7hfqpwxmu33pizqrfyluslxri@nvvhez7ybc45>
References: <20240816150243.87596-1-rodrigo.vivi@intel.com>
 <20240816150243.87596-12-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240816150243.87596-12-rodrigo.vivi@intel.com>
X-ClientProxiedBy: MW4P223CA0003.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB6040:EE_
X-MS-Office365-Filtering-Correlation-Id: 9339f871-af93-49f0-3a8e-08dcbe0dabb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?kYec76n9WOvm5+bSUoRd7B0INPYbwKLSmI7QZVhNSlhKzCJNFOuC1IQ4K1?=
 =?iso-8859-1?Q?mzXWegARIV1DKP1HQhdcTUS4MJZQ8V79uCEZP0s5QKbvThVCyCztHDXvPR?=
 =?iso-8859-1?Q?Y7e4YxUc6CwgqV7vPecQx1f04PEfx+szIYfqIV6IzB16OD9D5wZmB1fLrI?=
 =?iso-8859-1?Q?CMRVvvTYxT1mOfarMUy/RWLdr6gs69fPPvme7QNwuq04c6AYzhqSv7eC/s?=
 =?iso-8859-1?Q?bfo8563IiNI2ylX9yUNDlJsMYmM8lNgWoswTYuAbQS+/keRMBmormfDNYb?=
 =?iso-8859-1?Q?TCzspouJiNVGcu3RT1e8dr879Xw1PObumbaMUT7wI/6oG+L6pcr4SyyctB?=
 =?iso-8859-1?Q?vYTPO5HjVmKy5PnoMeEG9rJEWz0ngSR2lQ3icuMcFjEOapD5D9cVF54C/r?=
 =?iso-8859-1?Q?z1zexFWS85eklSIzNHQMY6myt8cvn2fm2kS4gE8CFdJlc2GV7ucAzvZe/9?=
 =?iso-8859-1?Q?JSexXPG+8A8CUSj/OvXisZJ1lcCwDm4F73ZKLXwv5PqeWnaWsHLgv8KlpT?=
 =?iso-8859-1?Q?XP9Dh4FifibX8ICN0UXKlbsr5e5WGAbD2pAgdfehyrJ09wX8zoJs1M4B7V?=
 =?iso-8859-1?Q?DpxBzvfK1kYS/kFwH7buInf4s5BV8jYc8wAMkp1MYifggLiTA1v9i2SQGN?=
 =?iso-8859-1?Q?XyrLiT/OrOodPS+Rq7LRx5bWx5gHBQ48s0/Fhx1+XiPwv+VVHjpLI0hGKp?=
 =?iso-8859-1?Q?EXR0OgI17BhCIhLT5gCmDl2dykM3NjzpUpZ0pq4GHMtu3/zPgCstAaKJho?=
 =?iso-8859-1?Q?KmCmtuszaJ0cXFAxH8fOiiGBnxA1yZeS/RzI8jO8FH94sn1M+jG57LR6vV?=
 =?iso-8859-1?Q?B049t+PkaD/OFVHTAs/f4BRbKAXYGCrm0kj5iqz+byaMKXrHtEooaZnAiV?=
 =?iso-8859-1?Q?SvbNQLsKRfrAyUFj9ytzV10pq3iDNDHKnX9cvelFfHTc0p2BxVkqjxjruf?=
 =?iso-8859-1?Q?PGc2KrqW9AeNszVp66gnb1Q0plR2bJWEv7sMzSxRD6SGPLdT4noOpVbmsD?=
 =?iso-8859-1?Q?cK8L1qgsNp+C4m1kUFwBMf9Cl77M6OJO/2LTSOprXwyiGpYW3LLiMkFX8Z?=
 =?iso-8859-1?Q?06jOb4Jll9P2c8NzsOK/jf+NXcIW5YlEOLZ3mcjWsAm7NXGb3c9/5KgwJv?=
 =?iso-8859-1?Q?Mqe83MvH99vTh4HVw9b8xFs0iAw39JBtaaTlP6Lx79Tyu9R4C0JctFpfU5?=
 =?iso-8859-1?Q?f1EItzYdPLYB2xIj691Vs7orkRJtAZws9/BhOW8dha9HT8x5qYhMjRnNug?=
 =?iso-8859-1?Q?jw0pHDvdKzDcxa2kIG8gUhnwmzAS4GDXxNcnYp0EXqcXe7q28U5XLnXc5Q?=
 =?iso-8859-1?Q?lg0Ec0QgRDwc6phWxrDywGDX5fIxTIxtVR0wEghXh0+VMfTgH2IUW01q/7?=
 =?iso-8859-1?Q?afG03Q73AdJZaE72kyXmli96oTXZEsFQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?mRq5nYskmD1KYrkNV/O5r2DguUI1wBEbWgDR5J8duDSonZphwRQ8nwGyVK?=
 =?iso-8859-1?Q?+wfSfa1MR7D6SLDgt3XatAbWuIarU8PFnA2/eOJ8vnBuG0EfpjFHfztRdj?=
 =?iso-8859-1?Q?Ahyy57EDByw4kB9W1YDcRR6X3sZEx+JYHkyvEbOjWTRIdhNuAsHDWx/xp7?=
 =?iso-8859-1?Q?W8mH2hW7SjpLXSQh7DAYfXPcHRSvEom2hSfPv+g6Ykqc70ppW0rrXLDtDI?=
 =?iso-8859-1?Q?/Sl0qdr7/0Q8+DvuDWuFWrsryqVHrFRJcdxeUPXr5U0nHSB1dWs5Bneu4K?=
 =?iso-8859-1?Q?cZKObq5j8OYCpt4r2D65YKIzpquZA14NmMXZkolU1Mp2SmEM3yXMje4kG1?=
 =?iso-8859-1?Q?mI9sQigvBW3r5H94JyuhbUxXvrmqyBKK5HhhfYKySIiVkrP+Yq9vSlvbp4?=
 =?iso-8859-1?Q?mQNIGnb/5gPxmdyQ9/cbAAa0ndcWlnNan8hKxXcr6d4sS/mFoD9lEILTw7?=
 =?iso-8859-1?Q?V5THnufr/r2wfeC5rs8Y6zD57ITiTgFbAyy8MXC9F4kbinINqTkXSXN3Jq?=
 =?iso-8859-1?Q?/2NRLi1jPeNAgCpjWgfccpJWa1RhcKD74Q95EFzHGACcXvzKTvpItgVCgL?=
 =?iso-8859-1?Q?g/5RN+bZhqYDAfHYv7+N3TrM81p2lGO0X/4YOg1SAPx2OB1Anhmui0HkR8?=
 =?iso-8859-1?Q?ntsBvXcOEff9+XV3tnC+I8ztK40x86gbiXQn4Z3fd0l/XD6jW8DjnMYUIP?=
 =?iso-8859-1?Q?4J/XWoy2YDYlV0PqkC3MC51F8GxuAen7aWaHZDO7THCTTs51KBLByIuh/i?=
 =?iso-8859-1?Q?z8xasUERpM36TBVUdFdxIZkTxDysegvXj34Hj+Zbeo4v48S0RWQjdN1wOq?=
 =?iso-8859-1?Q?RYeew5yPS7nD6STydeNBJdDsdFZtBKLH+GkabN2BFGIRZgyPJUK4gKdHk4?=
 =?iso-8859-1?Q?BNcbFbH9HMwKmnz9VBjwhUL9Elqcx9Aubkc6lEExV2wjd6Aa6F6QiACyae?=
 =?iso-8859-1?Q?h3Fme0WTEBLsrb/kBNosNkFmVfuFRP/MR4eQSVCnWD0V3Zo6oPj+p8+ZUU?=
 =?iso-8859-1?Q?fmxe2yk5FIfXW9pwth5bWy0CYo0GEsQPqR6UkaJiwVCyOKhFYlQY7MQu+P?=
 =?iso-8859-1?Q?npTVQc/hc0wow7QoSLzYo01DZbgxn5wMiWT2s/Jg/O0+3LP1/7PnziCWN/?=
 =?iso-8859-1?Q?9feTmztvQuZr8CWEr9/QZ9/wYrw/HY/E018WuQ86JPSfW30lOdV7aio+S/?=
 =?iso-8859-1?Q?tCE2XHDtRbb53uC1IIkHUwSEQG30WzyYGx3sxOXCOxv2apgexlbz5xEIkx?=
 =?iso-8859-1?Q?gD0K1h2e0bliXEyepPoNDVQUf4dxas1fOnxLXSRZHZUoEJBha7mbbouuJ9?=
 =?iso-8859-1?Q?PgEMGi2AJwoUrr+zWKjiJGbnb1KZTNUuCjXa69kxXUaDA7C3A+VKjASzhq?=
 =?iso-8859-1?Q?12m9FtlH+0m+puB3aV7Lyu4YtT12s/3AzX7n4b4dB8CeHa32JTKpLf/9T5?=
 =?iso-8859-1?Q?z3xNupu7kksYu6cFgXqdPusTc8Vx9XCB2/QomNeC3Wm+5VBRJI1AXdNBiX?=
 =?iso-8859-1?Q?zvyB+Tw7187RpNWrAVO+CCwMUjDYA2w3VA2yPH9S/A5VY6otWFhQqyEjMK?=
 =?iso-8859-1?Q?Hh3W31Qgr+7vsI8tLWOkHCGjFoISO9pHNxf9qAZetlj+Q5nGrrH6cdq5mE?=
 =?iso-8859-1?Q?UCFSo2uZs5QSdm/eStZ+qojPqMzzU1mAGvnH7t5ZcXnJX1LcEe6vrz4A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9339f871-af93-49f0-3a8e-08dcbe0dabb4
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 16:08:30.6558 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HCAR0vgZ8+IFpWKc4IjqlMgwpD7DNrUM3I29uZoMRrrsbA40JjAqOjJa22lCjGmRNO+tnCa2QQQljoNhVXMWWe3sNYK5XmHO9asQZBFAuVY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6040
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

On Fri, Aug 16, 2024 at 11:02:43AM GMT, Rodrigo Vivi wrote:
>Defer the ggtt node removal to a thread if runtime_pm is not active.
>
>The ggtt node removal can be called from multiple places, including
>places where we cannot protect with outer callers and places we are
>within other locks. So, try to grab the runtime reference if the
>device is already active, otherwise defer the removal to a separate
>thread from where we are sure we can wake the device up.
>
>v2: - use xe wq instead of system wq (Matt and CI)
>    - Avoid GFP_KERNEL to be future proof since this removal can
>    be called from outside our drivers and we don't want to block
>    if atomic is needed. (Brost)
>v3: amend forgot chunk declaring xe_device.
>v4: Use a xe_ggtt_region to encapsulate the node and remova info,
>    wihtout the need for any memory allocation at runtime.
>v5: Actually fill the delayed_removal.invalidate (Brost)
>v6: - Ensure that ggtt_region is not freed before work finishes (Auld)
>    - Own wq to ensures that the queued works are flushed before
>      ggtt_fini (Brost)
>v7: also free ggtt_region on early !bound return (Auld)
>v8: Address the null deref (CI)
>v9: Based on the new xe_ggtt_node for the proper care of the lifetime
>    of the object.
>v10: Redo the lost v5 change. (Brost)
>
>Cc: Matthew Auld <matthew.auld@intel.com>
>Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
>Cc: Francois Dugast <francois.dugast@intel.com>
>Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>Cc: Matthew Brost <matthew.brost@intel.com>
>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>---
> drivers/gpu/drm/xe/xe_ggtt.c       | 107 ++++++++++++++++++-----------
> drivers/gpu/drm/xe/xe_ggtt_types.h |  12 ++++
> 2 files changed, 79 insertions(+), 40 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>index 5c04c1bc8417..110acf828974 100644
>--- a/drivers/gpu/drm/xe/xe_ggtt.c
>+++ b/drivers/gpu/drm/xe/xe_ggtt.c
>@@ -161,6 +161,7 @@ static void ggtt_fini_early(struct drm_device *drm, void *arg)
> {
> 	struct xe_ggtt *ggtt = arg;
>
>+	destroy_workqueue(ggtt->wq);

better to follow the inverse order of init_early, but doesn't matter
much in this case.

> 	mutex_destroy(&ggtt->lock);
> 	drm_mm_takedown(&ggtt->mm);
> }
>@@ -242,6 +243,8 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
> 	else
> 		ggtt->pt_ops = &xelp_pt_ops;
>
>+	ggtt->wq = alloc_workqueue("xe-ggtt-wq", 0, 0);
>+
> 	drm_mm_init(&ggtt->mm, xe_wopcm_size(xe),
> 		    ggtt->size - xe_wopcm_size(xe));
> 	mutex_init(&ggtt->lock);
>@@ -276,6 +279,68 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
> 	mutex_unlock(&ggtt->lock);
> }
>
>+static void ggtt_node_remove(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
>+			     bool invalidate)

you don't need the invalidate arg anymore. Just make sure it's always
set in node.

>+{
>+	struct xe_device *xe = tile_to_xe(ggtt->tile);
>+	bool bound;
>+	int idx;
>+
>+	if (!node || !node->ggtt)
>+		return;
>+
>+	bound = drm_dev_enter(&xe->drm, &idx);
>+
>+	mutex_lock(&ggtt->lock);
>+	if (bound)
>+		xe_ggtt_clear(ggtt, node->base.start, node->base.size);
>+	drm_mm_remove_node(&node->base);
>+	node->base.size = 0;
>+	mutex_unlock(&ggtt->lock);
>+
>+	if (!bound)
>+		goto free_node;
>+
>+	if (invalidate)
>+		xe_ggtt_invalidate(ggtt);
>+
>+	drm_dev_exit(idx);
>+
>+free_node:
>+	xe_ggtt_node_fini(node);
>+}
>+
>+static void ggtt_node_remove_work_func(struct work_struct *work)
>+{
>+	struct xe_ggtt_node *node = container_of(work, typeof(*node),
>+						 delayed_removal.work);
>+	struct xe_device *xe = tile_to_xe(node->ggtt->tile);
>+
>+	xe_pm_runtime_get(xe);
>+	ggtt_node_remove(node->ggtt, node, node->delayed_removal.invalidate);
>+	xe_pm_runtime_put(xe);
>+}
>+
>+/**
>+ * xe_ggtt_node_remove - Remove a &xe_ggtt_node from the GGTT
>+ * @ggtt: the &xe_ggtt where node will be removed
>+ * @node: the &xe_ggtt_node to be removed
>+ * @invalidate: if node needs invalidation upon removal
>+ */
>+void xe_ggtt_node_remove(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
>+			 bool invalidate)
>+{
>+	struct xe_device *xe = tile_to_xe(ggtt->tile);
>+
>+	if (xe_pm_runtime_get_if_active(xe)) {
>+		ggtt_node_remove(ggtt, node, invalidate);
>+		xe_pm_runtime_put(xe);
>+	} else {
>+		node->delayed_removal.invalidate = invalidate;
>+		queue_work(ggtt->wq, &node->delayed_removal.work);
>+	}
>+}
>+
> /**
>  * xe_ggtt_init - Regular non-early GGTT initialization
>  * @ggtt: the &xe_ggtt to be initialized
>@@ -482,7 +547,9 @@ struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt)
> 	if (!node)
> 		return ERR_PTR(-ENOMEM);
>
>+	INIT_WORK(&node->delayed_removal.work, ggtt_node_remove_work_func);
> 	node->ggtt = ggtt;
>+
> 	return node;
> }
>
>@@ -499,46 +566,6 @@ void xe_ggtt_node_fini(struct xe_ggtt_node *node)
> 	kfree(node);
> }
>
>-/**
>- * xe_ggtt_node_remove - Remove a &xe_ggtt_node from the GGTT
>- * @ggtt: the &xe_ggtt where node will be removed
>- * @node: the &xe_ggtt_node to be removed
>- * @invalidate: if node needs invalidation upon removal
>- */
>-void xe_ggtt_node_remove(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
>-			 bool invalidate)
>-{
>-	struct xe_device *xe = tile_to_xe(ggtt->tile);
>-	bool bound;
>-	int idx;
>-
>-	if (!node || !node->ggtt)
>-		return;
>-
>-	bound = drm_dev_enter(&xe->drm, &idx);
>-	if (bound)
>-		xe_pm_runtime_get_noresume(xe);
>-
>-	mutex_lock(&ggtt->lock);
>-	if (bound)
>-		xe_ggtt_clear(ggtt, node->base.start, node->base.size);
>-	drm_mm_remove_node(&node->base);
>-	node->base.size = 0;
>-	mutex_unlock(&ggtt->lock);
>-
>-	if (!bound)
>-		goto free_node;
>-
>-	if (invalidate)
>-		xe_ggtt_invalidate(ggtt);
>-
>-	xe_pm_runtime_put(xe);
>-	drm_dev_exit(idx);
>-
>-free_node:
>-	xe_ggtt_node_fini(node);
>-}
>-
> /**
>  * xe_ggtt_node_allocated - Check if node is allocated in GGTT
>  * @node: the &xe_ggtt_node to be inspected
>diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
>index 0e8822ae13fc..8b83610c6ee6 100644
>--- a/drivers/gpu/drm/xe/xe_ggtt_types.h
>+++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
>@@ -47,6 +47,8 @@ struct xe_ggtt {
> 	struct drm_mm mm;
> 	/** @access_count: counts GGTT writes */
> 	unsigned int access_count;
>+	/** @wq: Dedicated unordered work queue to process node removals */
>+	struct workqueue_struct *wq;
> };
>
> /**
>@@ -61,6 +63,16 @@ struct xe_ggtt_node {
> 	struct xe_ggtt *ggtt;
> 	/** @base: A drm_mm_node */
> 	struct drm_mm_node base;
>+	/**
>+	 * @delayed_removal: Information for removal through work thread when
>+	 * device runtime_pm is suspended
>+	 */
>+	struct {
>+		/** @delayed_removal.work: The work struct for the delayed removal */
>+		struct work_struct work;
>+		/** @delayed_removal.invalidate: If it needs invalidation upon removal */
>+		bool invalidate;

as noted above, I'd move this outside and always use it.

node->invalidate_on_remove

or something like that.... should make it simpler IMO so you can ignore
my comment about using a flags arg in a previous patch. Up to you if
doing in this patch or as a follow up

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>+	} delayed_removal;
> };
>
> /**
>-- 
>2.46.0
>

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D85C36002
	for <intel-xe@archiver.kernel.org>; Fri, 21 Mar 2025 16:39:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5986F10E057;
	Fri, 21 Mar 2025 16:39:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BGAcZeWY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4975910E057
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Mar 2025 16:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742575142; x=1774111142;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=znbYV26EeNGkd4UkFFBV/c4cQat88orsqZ8xWN9Kwwg=;
 b=BGAcZeWYDJrocjhU85YUhoKyjlWGN2ejdSKXH6KSif+iCwzKJP6NAwD+
 zwMTSdrlVk3+ay28KFfno+6c2nMMSD4DjHlXSIL9MFPNoplx/KrtMuDwr
 b1EISPnyXWrinyFOzzAcHYUEml3CUXTMHZYfyVeBopBM7HQ503cQDrmtA
 4CtAl0PEcCPF+xcF+PSJkKMgeL7r+jQDmxU+HV71IWYHBD674Q3YaMNaR
 kqssbVftcMCR73Qgr1f1soncvoQ9cfnmFUH89TLOg9CTBgdf3wSkNQcTM
 q5nEzPX2BvORAooq4aarsVTBgZI90RWkMh/igA04i6UThlTTTOnWvIspC g==;
X-CSE-ConnectionGUID: XQnMBPBoQriCkb0M20X6Eg==
X-CSE-MsgGUID: VQZ7AZpiTn6Cz/rG5ZazPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="47505318"
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; d="scan'208";a="47505318"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 09:39:02 -0700
X-CSE-ConnectionGUID: j3qcYClpQ4+9DDOavlY0Qg==
X-CSE-MsgGUID: vaI+bOZhQ0GXIgakFOEqxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; d="scan'208";a="123468346"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 09:39:02 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Fri, 21 Mar 2025 09:39:01 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 21 Mar 2025 09:39:01 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 21 Mar 2025 09:38:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L6naAOPPNGd/b6sOMt8i8DziCMczyDv2NiDHhK+2FHMQf2xKUqLtgaw9Aj1cFn0Hty8PaDmgMaYAJW1bhoxYpFaeSA7yZmQi91HUzu+V8eYi2siK/PL9LbLOlKLCadwOQmBjNPfnIAJJfAoa37tgyHH/TUyBGt0pTTzPjuacqPHBH0UWD9r5wl/bc0BpTPqvk2oUeZyCjnOBRMibTYkj606wBYm0VM9UWy98GuINuFWnVKdbR47cKiRS0N0lziKINxqH409s2MPDt+6MCgIURxyLkY5NyE5sF0MdpeVy65PSOrTs3bhmwLwHwEPECbmo+L4YRncmFRQPB0X6Drivxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=znbYV26EeNGkd4UkFFBV/c4cQat88orsqZ8xWN9Kwwg=;
 b=gRxgGCE7QIblb7tQZGiC48qcae/PP7kT0SG+3m1e4cEc436FVq/5G20U621nSTQQMvVs5nfc/KAFH1OmM6g9BQlBc8/jl24Y6Wf2kHioXPt23pNkmtUmQpITMYciWAsWJD+A0c56wJPX7+mrIhVQMGZvZtO5DHySqUhLlh6WMxx0OcN1+FWVaRN00t5quyvmRklc8dANIPIIxTSBT3UzqUKu1pAdRETdMspCwSC5MOApVFIdJjeNHKaFZTzjoN+Gm+Aa/gZCpbc2FJhatooJmqTGkLONOeyHggosaqVvvsyr3tlyCoUo7lyZzqHWtAiWCjWHSkMU21YCX6OLad7zvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SJ2PR11MB8537.namprd11.prod.outlook.com (2603:10b6:a03:56f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Fri, 21 Mar
 2025 16:38:55 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%7]) with mapi id 15.20.8534.036; Fri, 21 Mar 2025
 16:38:55 +0000
Date: Fri, 21 Mar 2025 11:38:52 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/3] drm/xe/guc: Don't expose GuC privileged debugfs
 files if VF
Message-ID: <rpcog2cxe7ovkjm7r3opi7apeevwarfnqv4ber2ej3ujgu2klt@gaujozma7uq4>
References: <20250320210738.1733-1-michal.wajdeczko@intel.com>
 <20250320210738.1733-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250320210738.1733-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR02CA0029.namprd02.prod.outlook.com
 (2603:10b6:303:16d::34) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SJ2PR11MB8537:EE_
X-MS-Office365-Filtering-Correlation-Id: a79467f4-c2b3-463c-9304-08dd6896df2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ArpRpFyyWK2Z2ima6G5IRHsTWQRQYDtOy0ZsIPC38l0jsAIzNrmdjqH6/5B5?=
 =?us-ascii?Q?v9o1fzqNSIUhov3vrsY97iBw1kziDL8uVWa9DJIlG/s7Pz8DnWkk2oeSmini?=
 =?us-ascii?Q?GkjmuCYIcQHLs12UcppNNd9ENxabetMfOBQd3pKxrtbOtoj9lk+3G3oXiA0X?=
 =?us-ascii?Q?OL8xXQ2htSa/SM5y7w8yKZQerMAIZB2W7T1mxKnmbKJmavjswclx36vD1KnF?=
 =?us-ascii?Q?slbn5urXxADgM8gIxU025GEMjQNTtVZScTHAWY4oPWILKjNMbX8Jd2ha05X0?=
 =?us-ascii?Q?BtnVbyzp7KMlHODFmwpwDDcG1lF35t/mSVCyt8mz7EyAQs/5/zRmKc9YfAXL?=
 =?us-ascii?Q?TopSHmXbXTCERGgQxlH3GT52dyooXDiDmgXSPjsRxGveIdMiplLlJE90VzpK?=
 =?us-ascii?Q?UlHvlMwBqDHswldzlK1C/QiaoXPiDWdHdksK6e0xPB0Nk7K+oAivlN7GdKMF?=
 =?us-ascii?Q?62sSBjWG5GckKBmHkzK5Z+3HLW0FHh/bTrxv3sW9bB0WNi60p+eIbqd2AwKC?=
 =?us-ascii?Q?EGdPmGeVUioeT+1AlgOVBjCidJo/zyhoabh5PnpgtQm2zyYVWKBtjsnk6YZs?=
 =?us-ascii?Q?jTNmTNTVjxn3PE8hI/NKnuSIxNuxHvqyQUcqLNZ8wFm/ba1mTH9k1ufWeiuC?=
 =?us-ascii?Q?R5Wf2kwNAC/Fmq+1kUHc4jPMZ62OydctkK9dLwt3wDqFZqTTlmMgR0ud0jB1?=
 =?us-ascii?Q?m2MWK5iGK3KgiShp34rib35gZcIx4EcnrUr4SN4L5FxMFRNgFJ85OU3MzuUi?=
 =?us-ascii?Q?Irlk8Q4JCWWhZHue/KO5QGoF98th9p9GhsgrgVW1VCtxhD7FzN3vk+0xHEkZ?=
 =?us-ascii?Q?mnDBNiDuf0HFkco4a4qfDiUL7y/gUoNMf3lUoTIvp2j7YI8bYYwc8wOpnsmU?=
 =?us-ascii?Q?NGT1JUflX7RaSeeo3tJnvDBeHic8t63uEo+yYjqd0YJRUmPHT6bbL5ZxSWsE?=
 =?us-ascii?Q?ha7rT6F7r3nLXCAyXtoR15M2nG1KaQd5bj9TnFYB6a6FatxUr8R5+VFixvKy?=
 =?us-ascii?Q?dJh4R0opy0IZ5pOCxod/1tvcrvlsk8KCYegtKPoURLxcs/E+umJ/dB0BBfZ0?=
 =?us-ascii?Q?hwJE5Pz3/rC6Fr0UOxsdzXqsCUDRS8jv5NtRKSBdVnOZYcpw4x986wSMHgOP?=
 =?us-ascii?Q?A4ZmqLtNS5qW8t5U2zWLqWKNpwkt7yV31HKdK3mTyrnx2s8vufDcBFT2Nywh?=
 =?us-ascii?Q?qihaJh+2mduuY00quIYdNpaIF7Eqv0qMJ3Drh/HQOB1sadQehAVt6IWm0T/a?=
 =?us-ascii?Q?6xdWCfEh+dOPkISo5zWls4wW+EsZqRQ8wSYueltHh4LDEubyChJ91pR0eQHR?=
 =?us-ascii?Q?EwABhRt7mcr/b6ZT42IT1GOx5ApQaPni4WpSTLkdom+ou/fZWT9SZxtEh+sv?=
 =?us-ascii?Q?Q+6bP8Jk4P8YoeU8Tc/TZ1+unlml?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l7sBNdHQ1rU9BB21YVPTS+6FJ13kmHJY7XDyIem0cF1TN8BDuFL32OH2F0mt?=
 =?us-ascii?Q?dbYSUYkc1y1uF0azFnrC7EqXL28nltsXdss79Ek7KF/hYkEh2OZgU0T9E2FS?=
 =?us-ascii?Q?Q7AGbtBiWc5gIEFo2w31o8zLfkFJmaM5TZzifuOcjwJqa4Y5eguJVBTPvvxe?=
 =?us-ascii?Q?hRzVyhSuCPUxAT/DHSRPRx/NfAUWIYGN2XmPpSqIJXGp+aegya5u+JI+1+NR?=
 =?us-ascii?Q?Q0m2QkVJLVyPShaRQoGPaPLrfuk2TjpbiqARS4NvrFVahqFsrWw9hoxaTqcH?=
 =?us-ascii?Q?OEY53LGBECmKjjKR3cgyNSs8stDfMVHiLJoEuw2V3I4tgW2SxlaxqxZ5dSo6?=
 =?us-ascii?Q?A597EaYEleyxuKRZSUpAz9OiZOEbK8dq9SUC+AtqcfLpjOkKlbOjYQEzR/Yc?=
 =?us-ascii?Q?JFCMfG+XGHje8M9ueCgF0wATtp3RtFg++ccVfO2epeMEPtZcl+QoF7tS3OmL?=
 =?us-ascii?Q?ReSIwRHpL1YWq9b1cgrlMX6YTMgG8aXXd5oPoNYVNL3bMmmz6qW7Y8B3eXMq?=
 =?us-ascii?Q?XnzfEmMuYbA7EqVrcIgoYXH54ruLVydVdUSjZcQwti3o1EO1/u0TdLYDp8kt?=
 =?us-ascii?Q?CQRIP6vttnIqUG+XPpxRA8uvCT1Gn+ik8VZpZdvkJlft+snuBfbsg8WrbyiR?=
 =?us-ascii?Q?3P25IXPyFWPiYRDG0DFogcHZUuyduMc4gzRNGo0NTbBv0eg5AN7vBEfLPtPb?=
 =?us-ascii?Q?TF6gZsV7Tt+r46SxJY22K4QV9jlQ1ETBdOSt4ChrrTe7hZSSQ79eVDbIqnqS?=
 =?us-ascii?Q?WPdIVQST3h+AEWceCeyzIXAGDP+CV33FfXn/dj8mwzeIwPGn0siVbfiIOh8K?=
 =?us-ascii?Q?V3tBBV0YtXseodZj0PgYV19ERP1qjCnzRhKtUA8HmhEh850Zs3todJ5lgpgg?=
 =?us-ascii?Q?0oNhAWoSVGLZ0L478lAzXIZLDGmwF++SP4EckPVnCmZPablDo2XBQRPxzWLt?=
 =?us-ascii?Q?oXsXnoTjgvEQ+oyIlyVOL19oSHASSWUeZdTAUwey9fJtiiBGT3VexneIQO+G?=
 =?us-ascii?Q?eBdfmF6JVns0XFyG+YGkbIpXpvjdG2XG3jmzcnAUzsTfty5UuZDhAFXGleqo?=
 =?us-ascii?Q?rHIIVLtuhcjIwEm558Kpfn9E87/hAQ5nSEEqxYn4yqSs4toXH62JPnKjjm/N?=
 =?us-ascii?Q?TkV/YTapzRV0yG0fjUlcusdT+QG6YaeMyLpFFno+SV7+qzmgJ02+Z50qKYeQ?=
 =?us-ascii?Q?/q371+jkl/JDHj+lBJJthRaybSAf1jqOm4S72isma3UgAQWTD2QaaaBkUD7g?=
 =?us-ascii?Q?1wwGMw07hB0aMVI5D9M6PFYGMv1lZt5DXKUri95eftxOeOrUhhVB0osgbDzn?=
 =?us-ascii?Q?v/9EdSBdX48CbQq2aGUzj8sBdUbtZQs6PZQl9ql/7oLnjYKn2f8plyBI9K5D?=
 =?us-ascii?Q?fUc0ENcRq8hV497t4vutLjzePhrzMEywzkp7cqrBVdXnyRxK8hDRXDDKlz8Q?=
 =?us-ascii?Q?H/1gN8Qi5GKh+5bgXlTAm7OmwgupSX0xmguQbveMu7ixN51GcFhvCXxN0EuE?=
 =?us-ascii?Q?FcmvVc69su8wWy7x8u8KMTBDglsG0BjoajM6UB8EG2HDieEOn/p6hxnAt1OH?=
 =?us-ascii?Q?Xvtz+fcIsTxSrPY40mGyMB+SA3puXBA+zn4qE2s/0J/w3G7D07GvSXv5LunU?=
 =?us-ascii?Q?iQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a79467f4-c2b3-463c-9304-08dd6896df2a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 16:38:55.6106 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /eOVG3Zv8Pq1Yy7RuKTQbPxOTg7jpiT1AtKrbFQtCwVccnu0qYJYLCbrMUdRffGjt91jV7p/oDA1Y3ySSJNQBmRoostjzN2DIZAq8YSXBTQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8537
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

On Thu, Mar 20, 2025 at 10:07:37PM +0100, Michal Wajdeczko wrote:
>Some of the GuC debugfs files require access to the data that is
>not available on the VFs. Don't expose those files on the VF driver.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

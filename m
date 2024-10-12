Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C10D1A427
	for <intel-xe@archiver.kernel.org>; Sat, 12 Oct 2024 02:54:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F53710E03B;
	Sat, 12 Oct 2024 02:54:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YwT8R0v4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D40F10E03B
 for <intel-xe@lists.freedesktop.org>; Sat, 12 Oct 2024 02:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728701687; x=1760237687;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8TwWGug+QCCWwOJamEGbUnN6UkhBkqF2pVs21YVFzmU=;
 b=YwT8R0v4qzYZjKMjePu/7MDhyUZuNJ9jJ11E6CGzhtThxZcWz9dn+VuR
 3IJeCP0vIZKfBFv+Bq7mknrAOf7GNVkjD4f9PruX5qNdwA/Yya0ObbszN
 Qvkh8G674FnPRkigChhx2Ek2urMq1vwzBDRXsGIXYBPilTZ19wD8ftIgO
 FA3hX6fOCzhM5SS4Da9lhLBsYEDxtQNE99OhYFbclQoY1SYvaIwn8VvpG
 nGBquWVlexqfDLLW2mQBIcRmQXGsDEN2NNE37gR1lOrsNFerFCNFJWNLS
 bWsSpMeJlF0wePR3MP3TgVcZFUvzEe+T/YIzryBaNgZTbEqShJBjWzw0U Q==;
X-CSE-ConnectionGUID: kjuBjVB9QcOd8qIgucIiCw==
X-CSE-MsgGUID: hixLVsucTuGzBadiYmYYzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28065330"
X-IronPort-AV: E=Sophos;i="6.11,197,1725346800"; d="scan'208";a="28065330"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 19:54:47 -0700
X-CSE-ConnectionGUID: GEmJCnU9Q9yOlZsXBgPqNQ==
X-CSE-MsgGUID: C0zeC1GZQiioGbQcWJzZRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,197,1725346800"; d="scan'208";a="82078516"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Oct 2024 19:54:47 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 11 Oct 2024 19:54:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 11 Oct 2024 19:54:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 11 Oct 2024 19:54:46 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 11 Oct 2024 19:54:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EccVejkflFD9jnfwUW9vIuUHYCi/1AW7pKH4+QsbXF67SbxVDIEwFyLmLUBCCu5lev1d94GoxwmIe759gCT0sfSxLNuZke7Vv02C3FaDhWGc/Soag2VQ0zlEyRGziNoUj5TbUqDiilFfn+f1el6p61+q5unoxfFO93SFD0X+nf1w9u8+wruIYVk5HdJlqGSMnWdb0vVnbJKb+aU4u5W9JXT3jRpOrr9hJyXY4FGPbPjLFJu6O9reHENFKubtzhQTyvO3bGvgRQN67YJKq6UGWiUG4Xo1JicaufMmlg3adKKkxK039sO4zCu2xeKYXCA0DzGNsw4/sG2RX97f3gpp5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8TwWGug+QCCWwOJamEGbUnN6UkhBkqF2pVs21YVFzmU=;
 b=iOOnrSSta178FL5eXhtGXZNxE9B/LDyeQ6IxTBSt6ob5XHCba7JjJNWszEozkwkW708x4rRTg0WgTuDBF0/P4BzwTqchhGReD1mWZULci0ATMuwoYXws9SH8XktUnWUVTZgXyKiFDp7m/6MdxzHe+Ob6r71rp9ROO3L7fYdZgMeT2uEnnunpDuuXxHO/xX3TJseOVup144IyUbGwVdLPdd/JLHYmYlOridPzwEFoCrOAo4X7ondZpK4fXHqAQnFYgNdEk5Spbwwr5IPTJTt33lGADxVITbrEs1BF09kiO6zlJLsAIg5ElbsvTisrRb49afEbGL7tynmJRmWWiTAWlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB8326.namprd11.prod.outlook.com (2603:10b6:806:379::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.20; Sat, 12 Oct
 2024 02:54:44 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8048.017; Sat, 12 Oct 2024
 02:54:44 +0000
Date: Fri, 11 Oct 2024 21:54:41 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Sai Teja Pottumuttu
 <sai.teja.pottumuttu@intel.com>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>, Szymon Morek <szymon.morek@intel.com>
Subject: Re: [PATCH v2 3/3] drm/xe/query: Tidy up error EFAULT returns
Message-ID: <x3v3rtjnrhzclnp5uejalzuibhp3t7gjjzvhqoabc7uqxddwle@rlfsh5axtgml>
References: <20241011035618.1057602-1-lucas.demarchi@intel.com>
 <20241011035618.1057602-3-lucas.demarchi@intel.com>
 <20241011211758.GC5725@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20241011211758.GC5725@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: MW2PR2101CA0020.namprd21.prod.outlook.com
 (2603:10b6:302:1::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB8326:EE_
X-MS-Office365-Filtering-Correlation-Id: c4daa14e-ccf4-4e42-1073-08dcea69399d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9bBC3rMikudt4xjPEhYGcBpVNhMCclo4OGGkieL28aGwtD7DJV1xZjxW0ema?=
 =?us-ascii?Q?P8mzxUqqKsba1UBqcwWD3oPHA46fZqDROW9FESZYHikpXlQYXFkMOnVNAPzO?=
 =?us-ascii?Q?2ZqpysbUWcH8hOeq/w8to13Dci3XZ2QZNNwCIjkclLS1YRtxH0jdvLZm+OsW?=
 =?us-ascii?Q?NBFYQFLnIXFxfcQzWTzyReJEAMQ6gYEH3OZomzop1rMeixNwMkP6NOdVctuu?=
 =?us-ascii?Q?z2BiRQZGdunYELiu+27cvoaqiqE7cO2Y5ZBMXpBdKkQw3VIUucCbnTECEDaP?=
 =?us-ascii?Q?3+WOmcEIKe5ihoHZ1tzD47Z/DLGbIJFVJcXW9cBfbZPpEkd1BK09OxaCDdR3?=
 =?us-ascii?Q?gbz/kh9KZrGSk5Rd1Lo2N4kaEgd3qWFxPGfm7Bz1pH9lg4ap7dK7HinNuwH2?=
 =?us-ascii?Q?REmd0MhyMbNWePfaecpjtAptedZgGcZA3xEN8NHvrEp77ygADZ84yc8gCF4z?=
 =?us-ascii?Q?pO9+1AnAd4q/I8TpOgSk95x8IWWPogQqQg2SaGjUrlGFExC1yvEfQHrC+5C3?=
 =?us-ascii?Q?IigAATAOazzQXMEJE+NbXeeuZ/dtmWmuRxy0zl6P6MGGa/R6CC/K7+pdhnyu?=
 =?us-ascii?Q?C1SOv94RaojBv9P5Sxns1sKqTNb1Hvf/NqsKtgux+0szZG08QfvjJOisCrYI?=
 =?us-ascii?Q?vahZ+VVaSSqaDsLdUX7QYUNpRj+xOiX7bQS35Ojs9AyDAFFKV/qzq5zHhlwq?=
 =?us-ascii?Q?aFpkpPWMFdtI+wYLPRMdsHgHIkR6n+ktUhmtSqXVh1GW0hrAbN9I03ba1nj2?=
 =?us-ascii?Q?KnHw18bJfpqszPFHq3kM8x1lfvSsPRWylD2skPHOUz7ufiYtpOVGC7l8jSj3?=
 =?us-ascii?Q?mSacCIzJB0eSmqoOuR51igj+ZJwg5/GvHeaDxZy4KEepIdIi57KFx453fLTi?=
 =?us-ascii?Q?3NvF5nCLo4REBxnf6yqiCVjTFMpMRq2jPdqiH76CmsyvUz/aOzuWSh0fbDbh?=
 =?us-ascii?Q?5Y5nszlfrkqGw7y994ZDIyZyZ7PHNmuESyxVNUYKqCiubUwXbCqOSFk3IDwN?=
 =?us-ascii?Q?+BULUkfTxBtfawv7BuGX6rJS7EBUU7NXYW4/GdWDB9JYHHJZnJkBTm3FvEzU?=
 =?us-ascii?Q?Sr/mFAZt7RnIo/kJ8xeGW0FgaZ4lZEIHwAfxsnvQEvy9KXYbiWEw0Ui3vBRN?=
 =?us-ascii?Q?Ea3xsi30kAoZZ82kc+9hUyNpA3CBjJ/ldf5YYOfmgruUtDoiTYkUCWQtPGWd?=
 =?us-ascii?Q?Dk7r8cbpvRTXPTXBz3gC6oS8XnsASK/eFvwP6wVRo3xysNa9URGTCg6A1X9+?=
 =?us-ascii?Q?QGN8MUcF3NNLMJbrQyv+8hNntQnBTFxsnv033jH3mA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RmRXp2ibCpxNmTJqfMQ537DaXpPE1FV2kEjdR5gH+vS/rhfARoQ0O7Nj0opO?=
 =?us-ascii?Q?LdGVdPrGb1EVt6rGag0CAosqCtQVv1s3SpmWAmL7A00YPtzILT4qbLZQBIw/?=
 =?us-ascii?Q?9d4WhGUr4kgF8/nZhRPe4yG92VuZz7CkpZLhK7utUlcDUCm7ak7/3c+Nrr+c?=
 =?us-ascii?Q?DOZxhFwRX3xCSHxe+XAEy5P1tb/iJaUP4rKCh0MGzSxWQoodlJMkGteh/2y6?=
 =?us-ascii?Q?tq1Msk7XiVqG9VbVd/uaFL1rlMZ0l7Y41VMF1d96Nvgr5QfTJNj9kPBpaYcP?=
 =?us-ascii?Q?l5fYCtBQhAzKoJoRumLZM27nDy5bs+fwQn2J8p0A7pk275NbjJ8Ef4mccS96?=
 =?us-ascii?Q?lb2OjWym+BhNE0/INmgy/g8Vh4U0cPPdMCJhx/tS4sruvuHPOPVfk4fYYRCQ?=
 =?us-ascii?Q?yippsO3K9mTDDvEWdHP190jYFMX7lnMKraL8YOKMsGGSqJ8/4AhHXuhLe6FK?=
 =?us-ascii?Q?gJ7HB1HiUdQ5ocHmBMX8E5TT/7LSfQMQ4n16hLLrgGhJhGHWmVdyRSxWwLdz?=
 =?us-ascii?Q?FSOxWIqEog3p7SX/W8djwMbg3wkJzmBhufx6ygy8qQK1bTl2HtmqCbDpFdZr?=
 =?us-ascii?Q?O15bt8zotsD/FGi3l2o+fdWXNSfjgYSbT0R9x3TIhKYWxDuYZHJig05yD1p9?=
 =?us-ascii?Q?G4mo6XzsSzw2Js8OPMWQffBl4g7RDNRgA7UtMxfPoWj1XSE2oLGJAq4QrFhb?=
 =?us-ascii?Q?B8kK2yAPy7BNwcVHW60YKKaMPk3lM+yu2GkKAKNOvZzQfj+J2KK7WQ01ht/z?=
 =?us-ascii?Q?OHuZxxBvnzVrb5Czt4Z7oOIeaxoz9JnBf8OIAj84yIhP3f5KNTp7PQNIECwn?=
 =?us-ascii?Q?nRiqYfCNmskuCSN5Get5MlrqfUiruItNr1hp89OYnbJXMfoHlcfZEbHnvN6q?=
 =?us-ascii?Q?Zzo/ufmy8zdbUwWLSVUW9IvSlsNYCvlU5Vo91B2egP3RBDigtf715woLgjxF?=
 =?us-ascii?Q?dlZhgn1UoqooFLckyeE7wXr4UPI/+fQkRLG66yHau5jZmxEx2oxp0Eev0IQc?=
 =?us-ascii?Q?1ItcydrqBIUl/X9rjBVHI8pMAw8DHapYCUFy3+PNDxhwWAlBS+FaFyw5JmVF?=
 =?us-ascii?Q?U1a5jD0s74y68ECBUO+QPqAeJHVISUJcYnOZbBmcDp6nofxkxZ8nVT5mxxlZ?=
 =?us-ascii?Q?F8RNdjbNiC6qAtaVYe0Q7D6wkA/UqbaNyngpQbNsG+2ele/ZgNT+xkUMpzng?=
 =?us-ascii?Q?p5f12ruYpx7SSQQPWxQIAhwu7+fAfsOTuT0EDKUADIrbHlTgrlbzn2Z87CfJ?=
 =?us-ascii?Q?F/iM1rRF3GnCh3+ztQAlv8eVNkQDRpJMu0/rCMMSTnW6Yk5sne++NF+s9Ewl?=
 =?us-ascii?Q?DRYQZ6RkM9sYJmbSr6fCvpU/L/by6gokrb44kiCZuTWLiMtCERrU34FTcp/v?=
 =?us-ascii?Q?GPegv4maB7u4OqoqeRDBqioVxYBxVD5F+oNrxgg9vCmGfqlDuSJmdKL820w/?=
 =?us-ascii?Q?3HwB+9db2GBApu7RmZgdpcvCtxfqLJaekh70kwi+Yntv5UP9RH5W/wEAnxqO?=
 =?us-ascii?Q?fzmyRfk4DTI/EsmuWjjo1hK5zI1vrIwIjBbrfqpDCERIcxSmtehrutEcYS+K?=
 =?us-ascii?Q?9HH52sbfmWw6imyiTWaSHkb6i+ufD6ZNmpPIDEpVpVzmKHh5RgzWGKoZDXDC?=
 =?us-ascii?Q?yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4daa14e-ccf4-4e42-1073-08dcea69399d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2024 02:54:44.0503 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9xR6P5H4Nd/ustOMxFBXeRjfsLeFBAdlWnJPTXdXqzWNOiB7rNjKy49sNdVOiPnnwcjALWWSOhM8usCpN5yvsYFotsHexqineul9Cgar/Zw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8326
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

On Fri, Oct 11, 2024 at 02:17:58PM -0700, Matt Roper wrote:
>On Thu, Oct 10, 2024 at 08:56:18PM -0700, Lucas De Marchi wrote:
>> Move the error handling together in a single branch since all of them
>> are doing similar thing and return the same error.
>>
>> Reviewed-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


All patches applied. Thanks Matt and Sai for reviewing.

Lucas De Marchi

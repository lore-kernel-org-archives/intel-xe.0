Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D1D9C25B10
	for <intel-xe@archiver.kernel.org>; Thu,  9 May 2024 19:42:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BA9210F16F;
	Thu,  9 May 2024 19:42:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hKj+jbkr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9635510EFAC
 for <intel-xe@lists.freedesktop.org>; Thu,  9 May 2024 19:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715283769; x=1746819769;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=aFXkKv8rvFtEMKaqvhBwJwEjDNsq8bQ2Kg3bWeiDiNY=;
 b=hKj+jbkrb1ObDC8OIqqW6yr7tMN8sNPJd3ytKjeR8V2rKrAj34obfKbT
 ozzQHE8QN3wy8uVUrigtudBKUteOpfE3DzIfP4TSOmdEp/vBTN3qEoPcS
 LnUi0ZA+kk+ePzVqm+Z4gXwIsah1xbuTuvchAHFr1mBc24c34vJEK44id
 0iYXdGArZTrXw5qPDGLFDiQ+qOY6gDHu0OYA7gZDhsBPXURpULz/60pC4
 Ute979JzFh5c2C1EGkMhZ6oXkadH0VvVHeHsAsrFS8qvyABB1r/R6z9V9
 W599/FbGNQCWQRX5Qj0d/ZSZvgc99OKLJOlUOVI5fDGjMM5WgLRe/zRHO g==;
X-CSE-ConnectionGUID: cdQWDu4pT8W2kUPl4uhigw==
X-CSE-MsgGUID: fgigkoHkRFG2Z9IEEtqCow==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="22635527"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; d="scan'208";a="22635527"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 12:42:49 -0700
X-CSE-ConnectionGUID: scgnKCQVSyinaBbSgO280Q==
X-CSE-MsgGUID: +9nOPwBORQ6yuCp+0R2CEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; d="scan'208";a="33887187"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 May 2024 12:42:48 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 12:42:48 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 9 May 2024 12:42:48 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 9 May 2024 12:42:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QpG7ci1+tRVop6o9N0vuZfsTcKnTvElU3W9T6Z7ljp8GKDp3RiBlgb8WLwNTtyvoh31TKHPsO8vORHco34wbo6n80zmmCjcsSH2hsdd1EB17phxWPuKFHW+Zou/eP0STN4tJ14jv9AuMUtKG1tcv4wwCT4SCmobAr0tX8SFb4xMnf1zW/m8P4p4PXwY1366AKKN8NKCgZNQou86b6ia8AtwdGn35LrLyULRJdhhLeUyHiYqwGlRzq6Hril6NpGx9EYlFt7NMEN062anbTH4SM5uCvJpR1n6gpdLgz7nnDISVhYA+gYYR8alLdMvWNv0jKHTRiqyop1PC2nAH6LOB0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FsIxR5KbRzdRzVQ5LO/xxBYPybhDhdF4hFAHJAPK5GU=;
 b=VcsaqQqFqAMVwSwV4DHyHf67Ijr2wMC1LtUfOm/SLLH48lJCTJhk1VtG+xX3UuQIWwD0MXeY+kmOuRGDDvBrTvn1b2aOhsjnPeN/YREUT5vKjNB/nwRzcFIbWE9WGDOCFMUA97YNisquWmiGky8LgGrdlFMBc4djuwtDMXYdlKtgwFFf6k6N9E98oTLf16ZfGw491Kc9IpWCz7PmvIWRHlxRUaybax7OT2/BUyBjCZmQZwJ+bb11bcI2MJ1aUuIHLvoNRDaX4BWP2L5LaHXiRD1ZUs7Cn2aNQoYoPgcYcRQyuAU1XpeSG+YJUk6v/tdjptg3o6PLQDN09gwhyQmySA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by BY1PR11MB7982.namprd11.prod.outlook.com (2603:10b6:a03:530::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.45; Thu, 9 May
 2024 19:42:44 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%5]) with mapi id 15.20.7544.046; Thu, 9 May 2024
 19:42:43 +0000
Date: Thu, 9 May 2024 14:42:39 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIENJLkJBVDogZmFpbHVy?= =?utf-8?Q?e?= for series
 starting with [CI,1/5] drm/xe: Drop __engine_mask
Message-ID: <lnifnspre3mwil4tugc3c6xfaxk7v7w5w7gzhbdllmwdmfjcwj@2gg3mlzqsx7s>
References: <20240509041225.610636-1-lucas.demarchi@intel.com>
 <171523092156.2037201.8333820888914998643@8e613ede5ea5>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <171523092156.2037201.8333820888914998643@8e613ede5ea5>
X-ClientProxiedBy: MW4PR04CA0054.namprd04.prod.outlook.com
 (2603:10b6:303:6a::29) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|BY1PR11MB7982:EE_
X-MS-Office365-Filtering-Correlation-Id: 775cacb5-af1d-463d-30db-08dc70603162
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?R1lBK75hphmlWbKy2LL1m/S4+HN+8kbrlNbCeqF7gkrLGSsN6oB4+jb6hlhF?=
 =?us-ascii?Q?on374gY8laVlJ5WFbSOyZJHKWCxwsXVh78YoL2uddGoJIPaWT2QdtRNIt0eu?=
 =?us-ascii?Q?MEUw4q2golavyYc96Navk1hpW7zNjMTxNuzmqMbgv+c8rR4mA8xwK+4y23ap?=
 =?us-ascii?Q?f7rwWIuyCxKqdM+BUxUux/nRrzFcIcEsdJGXjVzeP8yj6TNAXbCl90E0lz+Z?=
 =?us-ascii?Q?UagwTqhd8AwWgOY5RZB7ODqJchojGA/neYhERbliikp5zu8uvfRKUJikpi4A?=
 =?us-ascii?Q?yAoGTKpUL+D/HO7grHFhGB4y1KTvRKsHXCuJHcELGV20t0/x+whyW/e7R6ST?=
 =?us-ascii?Q?fATs3EkYCjZKedfrBLKz7n8dUgGDIkJvr5f/UiMveHeAwW7CzAQtSeyH/Ytk?=
 =?us-ascii?Q?/02k6PkDE6MADFiJ1nSROoqmN0lgwE37F+22HCtD0ZJs3STz+Lsi0Jkqc/iC?=
 =?us-ascii?Q?X7Vik+70xhko+vPyMn2d71mYQ0J/RgiFDGaBPyXLa/4mCSwbFM0Nkm3jIKCf?=
 =?us-ascii?Q?d2Aoq8AdIeLy2SRvFABua/bswhFV4Br4Bb+XKoWYzpHcnPc8FX6cvh+y58Kn?=
 =?us-ascii?Q?FHonUoWbYFLRrF8ldaXkcxLIdj3ku7ux2lGltlm/uhzjfsaknP0EoLtpyQDr?=
 =?us-ascii?Q?meZtUX2wQlZEimC3bJ9ixv8GN/Xjb1+qU4aRwGt0Vllp9OpASkh11q7X19cJ?=
 =?us-ascii?Q?/HEU8+mDDDnhsdCpFJhJrSEjfNYGE3RQrClFRZ40uRVmqIM23FTjaK5dmamW?=
 =?us-ascii?Q?dWBQ5vVeKoIsjvlr8vahCpAvgzbDOBhKQIsH+P3GE2hymqoNsaiH2l5cKUhG?=
 =?us-ascii?Q?l7DAThsgf90zMzDQdVb5iEPNggnhUua1ZcnBZAJxSoaCYYoZ/5jLeKViXQIB?=
 =?us-ascii?Q?XXja22Pjv/2peLvRzGPtUGaZBfjwfusAqgQvZ1dDZYk9XRWl8nQSdKjF0gOl?=
 =?us-ascii?Q?jGQIYYP756vsEaDpCygsBWR+tgtNHi9MUNLGQF+7GngdIX6KOPizUjTUw4zF?=
 =?us-ascii?Q?Je2emYBa8DENYlmrZjLU97/tynGywhFqMfiEL2XlVatBc9uzNhW9jmf59prh?=
 =?us-ascii?Q?OBZMg6ncelenAhk6ClDi25qarNQyHjEQ76xc8hSBKjkVz0op1SMZqmg0AIFT?=
 =?us-ascii?Q?/EchBlsD6e0XnXmuOjyzwsTE+PHGr3/oKPmvVgwgUU0AoNqhTvRnhbk6H5Ni?=
 =?us-ascii?Q?n8LwHCC53Ir9cwW2seRBRnUXTYnLqf/eSDX/mr09sxwPN6JYDRw48y4YFVM?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZySFbuNuC0IAS+mWEAHk012XOFEgjFarSwQoo6MfFeMy8OfVdyfmIIHHAWSr?=
 =?us-ascii?Q?NEjwyLhl3aW/Nn3/W3hot+YG3yzd+vGHWx3bBU/U6foTzoXmor3Xi7ccQnR7?=
 =?us-ascii?Q?Mr80R5PbCyA2GeB/y06nm1QOdUlrdxlUX+vFB3HsOzxAZ4gD029I4Cqny29w?=
 =?us-ascii?Q?Y6DlHd+VS7+f9x8uIQ0TQOX7EA/arT8lQHyhOQzE/XQw0PUH2/iKqP+D6syx?=
 =?us-ascii?Q?wq1eBoHE8SWajCvGowN+QEbFsobM8Sw9PauX84j1mC8pJvI2MDRRViF+M+lC?=
 =?us-ascii?Q?PlWebl8KxkRvtoHRL+9PTVWuSKQSh1f2YRwD7kfoxW/nxdUJ+e8vLe9ih/U3?=
 =?us-ascii?Q?YVuucJ/LNsnXSVvxMxJTjrROgAh3hUehYeqKjfL0b1YKXTkfEHrDSTeaGFOd?=
 =?us-ascii?Q?ovYY524sA/fo7m39obYzR5UL7jyvmhnzb6xQ+JYMrYpGCAmpX0gBDXHO4Alr?=
 =?us-ascii?Q?FhTzUbSRcG0ODibjnlJUUQ7vRTA/qEiERi1VKRr+xIH1ZX4WB5AvUKggvDiH?=
 =?us-ascii?Q?f/v4vO6a1yMY7q8pqoj7DgGzdhcUisMorTtg/ycpooAe735q/WMkH+c8bHiy?=
 =?us-ascii?Q?D8DCEip0BV8eII0ey8SjtGdIb8JPpSLpoHpL1nuAgdQeB6+3koks6Iu8WHK4?=
 =?us-ascii?Q?uoar6Y6Ul0S78zEX33UKsu99GwvbMwQM4Ezx119s3O6mX8eMHsLUjGYzCUWf?=
 =?us-ascii?Q?dcz7XROYli4sKDF5AzAlAuobp43wMU7j72VtoLXc8r+AonomAlfGz0flDRoL?=
 =?us-ascii?Q?5hypGwmMAXDzut7P8cFD8Jfg3VUTG5/BSAD4ZxBvUnCNvAaOi9ld5/NduEmS?=
 =?us-ascii?Q?UBnKWkcVKdbWs84ny4ba7dUGsJ+wxA0ucUaS4UdxZFVhsqeFjwflxc0XSPve?=
 =?us-ascii?Q?Ac6yHZ+Uaxgmhjh7xXY9IzV+HGKgQGvCfqFS5g8wDl1cwxEPcZ/ThqmDZKHm?=
 =?us-ascii?Q?SOWr08JI4Xmho6XZ6I3YnJyqC+VowISaF6qVBQkAW9u2zvuS8DjtbHrG/4un?=
 =?us-ascii?Q?Tq7ALFsPuCvIO9EH3c91uKptvVaimqiL+nKE9hXmP7HjNsyy+gRB57NGW0vI?=
 =?us-ascii?Q?SkGL109la6+r9L4wnGpDX79SwpKyNj7la6/0VU2g4jj+pv2M5MM/ZEWN7Ip0?=
 =?us-ascii?Q?BULg2XxNnHcU33uI8L28J/d2NMpPn1xs1UtzHam6XOlb/ZAHsYNPMpC8KgGv?=
 =?us-ascii?Q?mkxGW8sZ/gbwHebabCdxjvFnsS6N4Z2S2fQ3vLvidfm0ZCGd38vBWpSttlwa?=
 =?us-ascii?Q?gbTOa5woxrr2Ty9hRTYCkID33l0zsdGjXIivu3DQCdOj7AQcJbcoY3EywCQN?=
 =?us-ascii?Q?iYPfsMslfsEeHnEBVgGaVt3BOkLZ1eMV8IWGbttzjKBLJLknS5WSqpfHB2fM?=
 =?us-ascii?Q?kniutaZHTbcfFv16q2HNdNxF0uZH/YN8p8Aq+Z2Y4peclUHW83YbYdCj7vjz?=
 =?us-ascii?Q?A9OKDF4CjNj1vpkf28UY7XdNiLvkcsvjKU1fosEeUEObXlChsvzBYYg3gnk/?=
 =?us-ascii?Q?Y3bw0Oq/TPls8a689o4N9uMSYMND9lC3rugIIM/ysoMWYGAAFvlYL7U+X6cj?=
 =?us-ascii?Q?Qj4YoNI2RqV1t2YlqcNTaVHzjknt0m2JZQxi22lkSeQfZm78x2eu7d+CB3wp?=
 =?us-ascii?Q?Pg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 775cacb5-af1d-463d-30db-08dc70603162
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2024 19:42:43.0020 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2QNlcDhxnG7UAB0yJhJTJuGXYtYOvBPmFhzDdyQRa/TKdhMWyAoG94OPGj78KHgFjukKlujBzP2vFU2kCyleMWY/nBG4TqCk+TMGjOczORQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB7982
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

On Thu, May 09, 2024 at 05:02:01AM GMT, Patchwork wrote:
>== Series Details ==
>
>Series: series starting with [CI,1/5] drm/xe: Drop __engine_mask
>URL   : https://patchwork.freedesktop.org/series/133360/
>State : failure
>
>== Summary ==
>
>CI Bug Log - changes from xe-1262-9560ae02d1ab528d73167fbf4568102ac2256929_BAT -> xe-pw-133360v1_BAT
>====================================================
>
>Summary
>-------
>
>  **FAILURE**
>
>  Serious unknown changes coming with xe-pw-133360v1_BAT absolutely need to be
>  verified manually.
>
>  If you think the reported changes have nothing to do with the changes
>  introduced in xe-pw-133360v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>  to document this new failure mode, which will reduce false positives in CI.
>
>
>
>Participating hosts (5 -> 5)
>------------------------------
>
>  No changes in participating hosts
>
>Possible new issues
>-------------------
>
>  Here are the unknown changes that may have been introduced in xe-pw-133360v1_BAT:
>
>### IGT changes ###
>
>#### Possible regressions ####
>
>  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
>    - bat-atsm-2:         [PASS][1] -> [INCOMPLETE][2]
>   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1262-9560ae02d1ab528d73167fbf4568102ac2256929/bat-atsm-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
>   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133360v1/bat-atsm-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
>
>  * igt@xe_evict_ccs@evict-overcommit-simple:
>    - bat-atsm-2:         [PASS][3] -> [FAIL][4]
>   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1262-9560ae02d1ab528d73167fbf4568102ac2256929/bat-atsm-2/igt@xe_evict_ccs@evict-overcommit-simple.html
>   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133360v1/bat-atsm-2/igt@xe_evict_ccs@evict-overcommit-simple.html
>
>  * igt@xe_gt_freq@freq_range_idle:
>    - bat-dg2-oem2:       [PASS][5] -> [SKIP][6] +1 other test skip
>   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1262-9560ae02d1ab528d73167fbf4568102ac2256929/bat-dg2-oem2/igt@xe_gt_freq@freq_range_idle.html
>   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133360v1/bat-dg2-oem2/igt@xe_gt_freq@freq_range_idle.html
>
>  * igt@xe_live_ktest@xe_migrate:
>    - bat-adlp-7:         [PASS][7] -> [FAIL][8] +1 other test fail
>   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1262-9560ae02d1ab528d73167fbf4568102ac2256929/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html
>   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133360v1/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html

don't really understand why this would start failing. I've tried to
reproduce it on a similar adl-p system without success.  But I don't see
it failing before neither :(

hit the retest and will check again before merging

Lucas De Marchi

>
>  * igt@xe_pm_residency@gt-c6-on-idle:
>    - bat-dg2-oem2:       [PASS][9] -> [FAIL][10]
>   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1262-9560ae02d1ab528d73167fbf4568102ac2256929/bat-dg2-oem2/igt@xe_pm_residency@gt-c6-on-idle.html
>   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133360v1/bat-dg2-oem2/igt@xe_pm_residency@gt-c6-on-idle.html
>
>
>Known issues
>------------
>
>  Here are the changes found in xe-pw-133360v1_BAT that come from known issues:
>
>### IGT changes ###
>
>#### Issues hit ####
>
>  * igt@xe_exec_balancer@twice-cm-virtual-rebind:
>    - bat-dg2-oem2:       [PASS][11] -> [DMESG-FAIL][12] ([Intel XE#1069] / [Intel XE#1602]) +6 other tests dmesg-fail
>   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1262-9560ae02d1ab528d73167fbf4568102ac2256929/bat-dg2-oem2/igt@xe_exec_balancer@twice-cm-virtual-rebind.html
>   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133360v1/bat-dg2-oem2/igt@xe_exec_balancer@twice-cm-virtual-rebind.html
>
>  * igt@xe_intel_bb@create-in-region:
>    - bat-dg2-oem2:       [PASS][13] -> [DMESG-WARN][14] ([Intel XE#1602]) +79 other tests dmesg-warn
>   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1262-9560ae02d1ab528d73167fbf4568102ac2256929/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
>   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133360v1/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
>
>  * igt@xe_intel_bb@intel-bb-blit-y:
>    - bat-dg2-oem2:       [PASS][15] -> [DMESG-FAIL][16] ([Intel XE#1602] / [Intel XE#358]) +11 other tests dmesg-fail
>   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1262-9560ae02d1ab528d73167fbf4568102ac2256929/bat-dg2-oem2/igt@xe_intel_bb@intel-bb-blit-y.html
>   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133360v1/bat-dg2-oem2/igt@xe_intel_bb@intel-bb-blit-y.html
>
>  * igt@xe_prime_self_import@basic-with_fd_dup:
>    - bat-dg2-oem2:       [PASS][17] -> [DMESG-FAIL][18] ([Intel XE#1602]) +13 other tests dmesg-fail
>   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1262-9560ae02d1ab528d73167fbf4568102ac2256929/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html
>   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133360v1/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html
>
>  * igt@xe_vm@shared-pde-page:
>    - bat-dg2-oem2:       [PASS][19] -> [DMESG-WARN][20] ([Intel XE#1602] / [Intel XE#358]) +7 other tests dmesg-warn
>   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1262-9560ae02d1ab528d73167fbf4568102ac2256929/bat-dg2-oem2/igt@xe_vm@shared-pde-page.html
>   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133360v1/bat-dg2-oem2/igt@xe_vm@shared-pde-page.html
>
>
>  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
>  [Intel XE#1602]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602
>  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
>
>
>Build changes
>-------------
>
>  * Linux: xe-1262-9560ae02d1ab528d73167fbf4568102ac2256929 -> xe-pw-133360v1
>
>  IGT_7843: 0df7b9b97f9da0e364f5ee30fe331004b8c86b56 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>  xe-1262-9560ae02d1ab528d73167fbf4568102ac2256929: 9560ae02d1ab528d73167fbf4568102ac2256929
>  xe-pw-133360v1: 133360v1
>
>== Logs ==
>
>For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133360v1/index.html

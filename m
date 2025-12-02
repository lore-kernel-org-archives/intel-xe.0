Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3EB8D1171E
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 18:17:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8583B10E676;
	Tue,  2 Dec 2025 18:17:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I9zahP0c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E7BA10E676
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 18:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764699435; x=1796235435;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zvKby/SNP9Kjd6mE/oeNSEOzvLW4w8oTZpG7NnTVcKk=;
 b=I9zahP0ctEkAC6LkAn/0miMPD6gaowFhtb8452oRQJJQUBlfeq9N83Ut
 K9qRicpBdpHG83vmpEQrEY3n+fcMF9cnscHJVZogrBPVA0GWqULlHBym5
 Sqouq406q2u8con1VFTbhZO6yN4arrxtzbOSW4TUbW2NrPZe7+2n9eME1
 fNGwhvgq1DcFsy2VkJyFg5q1z9U/1Dhst5tYvLQ5Ha9VkbpZspuxFfpAy
 U+Xy0fj3Gs9k8LYfsE3caC5VYspr9DN4MiA3rix4v08PLxF8zGpUHhCRw
 SpmRTWwVhUguGDcz3Ib++ItLjnLRseRJqCVkcpaQ4L0eJfjfnd8YBnN4d A==;
X-CSE-ConnectionGUID: SGmThKabQhmstw2KBJim0Q==
X-CSE-MsgGUID: GCWJUjFWRLKLfEOxZ+O19w==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66713850"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="66713850"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 10:17:15 -0800
X-CSE-ConnectionGUID: yEQ2HDvzTVOd9mmQMZQAFg==
X-CSE-MsgGUID: vN2K+GRSQ+6XDaorPhjI8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="194545476"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 10:17:14 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 10:17:13 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 10:17:13 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.3) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 10:17:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eXNBVUIbrNsdchZBsluSJhi3+RxWzIzc2gNCqdSiFtqhO0twJJEIrQ6o45qO8yIgcIsCRecm61bmbgyI8XQbDl2dwuDaGZ1CSzWqglHx24aVbNZ9V5YwA7NOq5DpqGE04seYPsDmuJrYnMrk60vLwAl09YbcPIWVZ2zR+6XQAmg4aIeHuE5HkU0FNon5Pck/DJmNMnVNFUePMHvuS/rrmn9oQH7wYOPPG92m5eFDut2lcg+UM13V/XITvgQjDoBrJwZ/gLeipz9Y/LDuc9AXGSJu6Hg6nR6Z9TVdrfrN5UJt/EU/hkNo8ZeOOPYb9U/HEqy5TwEbqrbxpQ5UfJ5pnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dADuovocRCSbiz9kMDTqGFMXdRLWE9jx9fNRkJXzCI0=;
 b=oMisy+nr9kmHGtq7JyBNx5s2/GaaTHp30w4+VRh5Yq49kwmUX4W5NbGdl8HvEavovxszjuEt6/U9PDolcBIlnZtF/v9iNka9Zil2OEuW0rCDoE+z5IgubOw1LP7JJmkVhhh994J7mCb8L22PHCdkg1nSVt62vj5CCwQIpbpNRiYr+wbM6oGsgDC0bnXbkHx0kqhMLOgdwrIhm/S675cqtNeWJDKhjxoZrtAVaIeWyrwkakWUWp4kxgxqrxxTh01bG3DQdXgPu7yvBjGU7xrMHnSm9rqCZHIHzHT82AZwxmnJjuaVTOkT3eXpO5QFCD6owajSjFHAzWXefxAbKwySig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA3PR11MB8918.namprd11.prod.outlook.com (2603:10b6:208:57c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 18:17:09 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 18:17:09 +0000
Date: Tue, 2 Dec 2025 10:17:06 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 drm/i915/display: Add initial support Xe3p_LPD
Message-ID: <20251202181706.GK4065316@mdroper-desk1.amr.corp.intel.com>
References: <20251202012306.9315-1-matthew.s.atwood@intel.com>
 <176465855011.47892.751386860256814962@a3b018990fe9>
 <aS8gw0AKOnp7owYf@msatwood-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aS8gw0AKOnp7owYf@msatwood-mobl>
X-ClientProxiedBy: BY5PR04CA0022.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::32) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA3PR11MB8918:EE_
X-MS-Office365-Filtering-Correlation-Id: a5b7e0c5-b252-49e4-6736-08de31cf018c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vHEe9geILoXjLVzeqON3xiiefNQx0CcWjT7dSkh37uFsp76yRaKzeEi9nQyc?=
 =?us-ascii?Q?gOqVC91OYz95IICXRLcPVTIM65aCWLsI6xT+v3MaeS0LcGGmdbPcvcWxz61h?=
 =?us-ascii?Q?BCEfyeloSsTcz9H5ZhPJDns/lcX7FFZa2rKnF0Ygrz6DSAcDoAjTgFbxHKpu?=
 =?us-ascii?Q?pfsXzZHjH2Yj/aROj0NAdroLv7kkI7lhprpePob9gQQCyFDw5s6/TJiO78R8?=
 =?us-ascii?Q?52H3q3VrIR9XrmNqd8AzTF+b2ZlQlccBCvlTTj56GAo9EiIjJkPwhRl0cV9/?=
 =?us-ascii?Q?ohlBfAej1KmGwqtqbA16OmQp1cUQ880wwXL/o5uhug0ABp38B0d/ZKlIwJfw?=
 =?us-ascii?Q?/3/Fe9LeUQ4/oPW9hOFS7jy3HdNtZAbVByldtdI4SWmpePAg82sC2PAcyEHh?=
 =?us-ascii?Q?i61/eGbpHL+C6wlx6S9ZJJeX/zCl+3qUqx4oGpy0aEbsB0LRryy802ZxZTXv?=
 =?us-ascii?Q?Y+tdrZjn4O20k3Mu8lnGC6N2mVH3wnMpaNlsV5fZj1m1wkV44S7mF6Btxw+h?=
 =?us-ascii?Q?kGqISYhN/XIRvd+DuKPc5NLBUTwLS1btxxL7jkzyY2XEnmT76bHuF+IchOwy?=
 =?us-ascii?Q?8kYT7amsUZFPvhml/GkGGNNHi9oJOlSJnGKWPKwiuFsIG1Rfq6RggAf64bYD?=
 =?us-ascii?Q?KyrpwRUHwC/RH31gICXaRmxnXFhBA6VkyEmn5/c5KnkYvsUBQRwqlXPPlU6a?=
 =?us-ascii?Q?IhcIYP7zcYqpCb8PaFvFdQ1W33GLQrXAW88s7bCAsJz3pxPh0iggg68lSu88?=
 =?us-ascii?Q?1unFhnVruyUgGPuiEBGTBEpIRQjQ+jAl80xbQei3a1swk0O2drqKbQ2AQHfa?=
 =?us-ascii?Q?ecYAfbM6ewxZtfPgcf8mYisqOBUNBMHVjfVsZcSj7jwebgHNBwxHxXIwWZLR?=
 =?us-ascii?Q?xgusf+H3wUlZqpOw0PdGIyCBkrFJSZcOjqVQHWVCQ+tVfEFPzK89llYkyqc0?=
 =?us-ascii?Q?UGpON+q9J90IqzVH8EVPbkPXz80yWz5K8mYRraUlNaNgP8pJPVY8IWCXyPW+?=
 =?us-ascii?Q?R/mY4qOdBXs8zDkLb5kMnH/6rvf5B7mdTfQldNoJpoe6ddBxCQHn7IJq9lBJ?=
 =?us-ascii?Q?7+2dCdEseGve5dmHIKUEvg2sQT5J0qTu1a59hyXTgkc05D0tLGz96IJZo/Ix?=
 =?us-ascii?Q?/v/yeCRdy5UZAj1LgT6bcTB2mefF32t6N/9JPQqDpjI0QaWRjWkIkhxbJmG2?=
 =?us-ascii?Q?vbVltL3fthyElhy4tnNVRPZR8JPE7qZrpirCUbXV1mmCgpsj0WMMdA88WM2T?=
 =?us-ascii?Q?yXzrUO0USfS/8ncHqtUzurebQy83PxfnuO7fBpp1mA2EsXSTRMjBLgVD2ZIU?=
 =?us-ascii?Q?NCGeyDCKPpjDGmTjH3PTPxdXMqciSyULVJvpcAjdjcblui5cu9moaLOy2XWi?=
 =?us-ascii?Q?MMiyRJk420Vg+TupFAwhGoRqjhISFqp4xwXnCSdAd9GciyvA6Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fE+bvF76IqqbpPx7gXrwprsOLXqvrLYJtRE2A+11dmgmJI8qVC/3W9R3hxj2?=
 =?us-ascii?Q?U/j8jfcvS6yH/4Mn5TJxQru0FRHxuCu/ZHmYfbGA1GutMhsT64+Qr/3Nmv7t?=
 =?us-ascii?Q?PYG4Ryg2izYQ/hiYBUArLcKR5zBkOvLMM8aafCXEHQwVY9d951L7Z+XY+PRK?=
 =?us-ascii?Q?HVMeBdN5At++JUYF0dwEbJ8B0CBV7tL0O/eO0U3IQZwk2ATnUcgDhLAHQ+66?=
 =?us-ascii?Q?W9Si7Ng35GMRHe3SAG3BlE/1TbVhDcTT3GyfZXqfKGPRlTx801P5+d3Stfz/?=
 =?us-ascii?Q?HtjDSeWghF1SeYzVa5i5PR8tNKLn7FVFpjFGY6TLsvl9F9LkDP7k7aLYcNAx?=
 =?us-ascii?Q?2105c71zJMEyNFvjbx2ucsViAfQy9lLBjwYk27vDoTylwII2yI4X+VJlkKyk?=
 =?us-ascii?Q?FXMTi67EIk4abhhu3oPR23HvG3JGu/4qN3bXE2HrEZninyxTy/dfeBo0n5eq?=
 =?us-ascii?Q?uxACOYLkto6NJ/NDrMmTpz8xe5L2FrhRrz/3XotzJvU2JR9a5347EA4m9tHl?=
 =?us-ascii?Q?n+L/UoK7FJAwlmPf2aBNzKuCjOy8XJ72Egn/In1mjdoF6opnOa4FFAsDNx9Q?=
 =?us-ascii?Q?J+RP5IDY+iygVtB2z7cUhrGb9Sh7qRQjmhxXqlBLz0r6kNtqbq6Bs3sGpd6k?=
 =?us-ascii?Q?uAhz8D69P8ga/feMh7nFGjul/cLkXSqFpiAQ1Ndc6av/CHNFjashlkopieNZ?=
 =?us-ascii?Q?wht1tMu8M9yk2GglsjkNGIQFEeCNKuD/T/20vz7A7EXQOB5qNDNzkUmY643K?=
 =?us-ascii?Q?sAN0B62+gQS3dCfLViyAw7st7t4fLwcQd7SD9JCnapvRg3owjDWTmBGo22sE?=
 =?us-ascii?Q?pV+RKK1LVeBVe/DSa6uG7crVQ/5MVKITa4zq5tBZI8rMjMAhQCLmS/VZFlBJ?=
 =?us-ascii?Q?2fwsDQGuladAMOHnSKkXCwhFt2FnEaosNzqbxOutS4Zon8dAmrCRYA02dDaV?=
 =?us-ascii?Q?1J3h7Q9r5OKZgCpow5Nf/yzWbBPYhstJY6RGKPxq93tzD1k4abPusKjNSx5s?=
 =?us-ascii?Q?zJDOlHbnUTBD5KmK8KI/pvNAep9GVhPQXKJOvcrd1OntHe5T/Atpt8imGwG0?=
 =?us-ascii?Q?98QENAbmUw0T0QWULT5ZI6apBJqZwQ7fhpqlMZnO4D5wvzses21FkG0cVENs?=
 =?us-ascii?Q?id1JY8u0rwcJFimoA/FspMY2IFkS6y6LtqgufALQP/pi7o9XSt8Rsysxx5xh?=
 =?us-ascii?Q?DdqItqA6W4m5eBtSouWm3SX5tGGTljhNjJH47XOdlfcZZFhzyQA7tbuzZf9r?=
 =?us-ascii?Q?BZTMMXMFCy5FffjyzEXPddBLtfc7xyunRZfS4FQl4K0I6O1yaoYqn7ZDHipU?=
 =?us-ascii?Q?g/4x6xnKMSh965UVQsIoUHIwcHl6B3TCQVvrwM4svkY8SECsNkCI4cmob6Lr?=
 =?us-ascii?Q?EMLLEufh/40nt2S4QS/Ngc6WwXfU7lyPag90E+dnY3V9bY+aJe0BQ9J/XLWB?=
 =?us-ascii?Q?EIzdI59eClEdkyomEDWwA6FAI6Cw6MgVwn681gFtlYtSYBQ3rgf6RnsZi/68?=
 =?us-ascii?Q?xODRJFGX4FldgSgi1pyCNsaPsDQpM/GCYzlWRJ2+RjNE7p+/GB6FpmV1CuI7?=
 =?us-ascii?Q?yqDugvMGV9x+KOrJvSCxjA6knfez/sdKgPfE1EafqqAIiCczfp14g0bvEbfr?=
 =?us-ascii?Q?FQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a5b7e0c5-b252-49e4-6736-08de31cf018c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 18:17:08.9795 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rV0rnkjGv8fLUJ9pWj7ZPfRXYNKhDNTkgySCLaGE1ZhlWIfmTRURp0SWs2vJzJwjmFggYWtDZc5ijRmK6OHksU+cXWRNueW3ecCXUkCexXw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8918
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

On Tue, Dec 02, 2025 at 09:24:19AM -0800, Matt Atwood wrote:
> On Tue, Dec 02, 2025 at 06:55:50AM +0000, Patchwork wrote:
> > == Series Details ==
> > 
> > Series: drm/i915/display: Add initial support Xe3p_LPD
> > URL   : https://patchwork.freedesktop.org/series/158344/
> > State : failure
> > 
> > == Summary ==
> > 
> > CI Bug Log - changes from xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65_FULL -> xe-pw-158344v1_FULL
> > ====================================================
> > 
> > Summary
> > -------
> > 
> >   **FAILURE**
> > 
> >   Serious unknown changes coming with xe-pw-158344v1_FULL absolutely need to be
> >   verified manually.
> >   
> >   If you think the reported changes have nothing to do with the changes
> >   introduced in xe-pw-158344v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> >   to document this new failure mode, which will reduce false positives in CI.
> > 
> >   
> > 
> > Participating hosts (4 -> 4)
> > ------------------------------
> > 
> >   No changes in participating hosts
> > 
> > Possible new issues
> > -------------------
> > 
> >   Here are the unknown changes that may have been introduced in xe-pw-158344v1_FULL:
> > 
> > ### IGT changes ###
> > 
> > #### Possible regressions ####
> > 
> >   * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-edp-1:
> >     - shard-lnl:          NOTRUN -> [FAIL][1]
> >    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-edp-1.html
> Failure unrelated.
> MattA

Specifically, this appears to be
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3718

Series applied to drm-intel-next.  Thanks for the patches and reviews.


Matt

> 
> > 
> >   
> > Known issues
> > ------------
> > 
> >   Here are the changes found in xe-pw-158344v1_FULL that come from known issues:
> > 
> > ### IGT changes ###
> > 
> > #### Issues hit ####
> > 
> >   * igt@kms_async_flips@alternate-sync-async-flip:
> >     - shard-lnl:          NOTRUN -> [FAIL][2] ([Intel XE#3718] / [Intel XE#6676])
> >    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-3/igt@kms_async_flips@alternate-sync-async-flip.html
> > 
> >   * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-edp-1:
> >     - shard-lnl:          NOTRUN -> [FAIL][3] ([Intel XE#6676]) +1 other test fail
> >    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-edp-1.html
> > 
> >   * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][4] ([Intel XE#316])
> >    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-dg2-463/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
> > 
> >   * igt@kms_big_fb@linear-8bpp-rotate-270:
> >     - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#1407])
> >    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-3/igt@kms_big_fb@linear-8bpp-rotate-270.html
> > 
> >   * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
> >     - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#1124]) +2 other tests skip
> >    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-8/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html
> > 
> >   * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
> >     - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#1124]) +2 other tests skip
> >    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-3/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html
> > 
> >   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
> >     - shard-adlp:         NOTRUN -> [SKIP][8] ([Intel XE#1124]) +2 other tests skip
> >    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> > 
> >   * igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:
> >     - shard-adlp:         NOTRUN -> [SKIP][9] ([Intel XE#367]) +1 other test skip
> >    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-4/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html
> > 
> >   * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
> >     - shard-bmg:          [PASS][10] -> [SKIP][11] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
> >    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
> >    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
> > 
> >   * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
> >     - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#367])
> >    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
> > 
> >   * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
> >     - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#367])
> >    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-4/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
> > 
> >   * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
> >     - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2887]) +4 other tests skip
> >    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-2/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html
> > 
> >   * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:
> >     - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
> >    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-4/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html
> > 
> >   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
> >     - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#3432])
> >    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
> > 
> >   * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
> >     - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#3442])
> >    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
> > 
> >   * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:
> >     - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#787]) +11 other tests skip
> >    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html
> > 
> >   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
> >     - shard-dg2-set2:     [PASS][19] -> [INCOMPLETE][20] ([Intel XE#2705] / [Intel XE#4212] / [Intel XE#4345])
> >    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
> >    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
> > 
> >   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
> >     - shard-dg2-set2:     [PASS][21] -> [INCOMPLETE][22] ([Intel XE#2705] / [Intel XE#4212])
> >    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html
> >    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html
> > 
> >   * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
> >     - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#2887]) +3 other tests skip
> >    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-3/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html
> > 
> >   * igt@kms_cdclk@plane-scaling:
> >     - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#4416]) +3 other tests skip
> >    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-4/igt@kms_cdclk@plane-scaling.html
> > 
> >   * igt@kms_chamelium_frames@hdmi-aspect-ratio:
> >     - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#373]) +1 other test skip
> >    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-4/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
> > 
> >   * igt@kms_chamelium_frames@hdmi-cmp-planes-random:
> >     - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2252]) +3 other tests skip
> >    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-2/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html
> > 
> >   * igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:
> >     - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#373]) +3 other tests skip
> >    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-3/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html
> > 
> >   * igt@kms_colorop@plane-xr24-xr24-ctm_3x4_bt709_dec_enc:
> >     - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#6704]) +1 other test skip
> >    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-8/igt@kms_colorop@plane-xr24-xr24-ctm_3x4_bt709_dec_enc.html
> > 
> >   * igt@kms_colorop@plane-xr24-xr24-multiply_inv_125:
> >     - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#6704]) +3 other tests skip
> >    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-3/igt@kms_colorop@plane-xr24-xr24-multiply_inv_125.html
> > 
> >   * igt@kms_colorop@plane-xr30-xr30-ctm_3x4_bt709_enc:
> >     - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#6704]) +1 other test skip
> >    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-4/igt@kms_colorop@plane-xr30-xr30-ctm_3x4_bt709_enc.html
> > 
> >   * igt@kms_content_protection@uevent:
> >     - shard-bmg:          NOTRUN -> [FAIL][31] ([Intel XE#6707]) +1 other test fail
> >    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-8/igt@kms_content_protection@uevent.html
> > 
> >   * igt@kms_cursor_crc@cursor-onscreen-32x32:
> >     - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2320])
> >    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-32x32.html
> > 
> >   * igt@kms_cursor_crc@cursor-random-512x170:
> >     - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#308])
> >    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-4/igt@kms_cursor_crc@cursor-random-512x170.html
> > 
> >   * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
> >     - shard-bmg:          [PASS][34] -> [SKIP][35] ([Intel XE#2291]) +2 other tests skip
> >    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-1/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
> >    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-6/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
> > 
> >   * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
> >     - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#309])
> >    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
> > 
> >   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
> >     - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2291])
> >    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
> > 
> >   * igt@kms_dsc@dsc-basic:
> >     - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2244])
> >    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-8/igt@kms_dsc@dsc-basic.html
> > 
> >   * igt@kms_feature_discovery@dp-mst:
> >     - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2375])
> >    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-2/igt@kms_feature_discovery@dp-mst.html
> > 
> >   * igt@kms_flip@2x-absolute-wf_vblank:
> >     - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#310])
> >    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-4/igt@kms_flip@2x-absolute-wf_vblank.html
> > 
> >   * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-dp2-hdmi-a3:
> >     - shard-bmg:          NOTRUN -> [ABORT][41] ([Intel XE#6675]) +6 other tests abort
> >    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-dp2-hdmi-a3.html
> > 
> >   * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
> >     - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#1421])
> >    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-3/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html
> > 
> >   * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
> >     - shard-bmg:          [PASS][43] -> [SKIP][44] ([Intel XE#2316]) +3 other tests skip
> >    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
> >    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
> > 
> >   * igt@kms_flip@flip-vs-expired-vblank-interruptible:
> >     - shard-dg2-set2:     [PASS][45] -> [FAIL][46] ([Intel XE#301]) +1 other test fail
> >    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> >    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> > 
> >   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
> >     - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2293]) +2 other tests skip
> >    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html
> > 
> >   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
> >     - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#1401] / [Intel XE#1745])
> >    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
> > 
> >   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode:
> >     - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#1401])
> >    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode.html
> > 
> >   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
> >     - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2293] / [Intel XE#2380]) +2 other tests skip
> >    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
> > 
> >   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-blt:
> >     - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#651]) +1 other test skip
> >    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-blt.html
> > 
> >   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
> >     - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#651]) +1 other test skip
> >    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html
> > 
> >   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render:
> >     - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#656]) +4 other tests skip
> >    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
> >     - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2312]) +2 other tests skip
> >    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
> >     - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#4141]) +4 other tests skip
> >    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render:
> >     - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2311]) +7 other tests skip
> >    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:
> >     - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#653]) +2 other tests skip
> >    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
> >     - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#656]) +8 other tests skip
> >    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:
> >     - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2313]) +4 other tests skip
> >    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html
> > 
> >   * igt@kms_hdr@bpc-switch:
> >     - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#455]) +4 other tests skip
> >    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-4/igt@kms_hdr@bpc-switch.html
> > 
> >   * igt@kms_pipe_crc_basic@suspend-read-crc:
> >     - shard-adlp:         NOTRUN -> [ABORT][61] ([Intel XE#2953] / [Intel XE#6675])
> >    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-6/igt@kms_pipe_crc_basic@suspend-read-crc.html
> > 
> >   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:
> >     - shard-lnl:          [PASS][62] -> [ABORT][63] ([Intel XE#6675])
> >    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-lnl-3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html
> >    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html
> > 
> >   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
> >     - shard-adlp:         NOTRUN -> [ABORT][64] ([Intel XE#6675])
> >    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html
> > 
> >   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-6:
> >     - shard-dg2-set2:     NOTRUN -> [ABORT][65] ([Intel XE#6675]) +1 other test abort
> >    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-dg2-463/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-6.html
> > 
> >   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1:
> >     - shard-adlp:         NOTRUN -> [DMESG-WARN][66] ([Intel XE#2953] / [Intel XE#4173])
> >    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1.html
> > 
> >   * igt@kms_plane_scaling@2x-scaler-multi-pipe:
> >     - shard-bmg:          [PASS][67] -> [SKIP][68] ([Intel XE#2571])
> >    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
> >    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
> > 
> >   * igt@kms_pm_rpm@system-suspend-idle:
> >     - shard-dg2-set2:     [PASS][69] -> [ABORT][70] ([Intel XE#6675])
> >    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-dg2-436/igt@kms_pm_rpm@system-suspend-idle.html
> >    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-dg2-435/igt@kms_pm_rpm@system-suspend-idle.html
> > 
> >   * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
> >     - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#1406] / [Intel XE#2893])
> >    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-4/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html
> > 
> >   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
> >     - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#1406] / [Intel XE#1489])
> >    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html
> > 
> >   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
> >     - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#1406] / [Intel XE#2893] / [Intel XE#4608])
> >    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html
> > 
> >   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1:
> >     - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#1406] / [Intel XE#4608]) +1 other test skip
> >    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1.html
> > 
> >   * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
> >     - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#1406] / [Intel XE#1489]) +1 other test skip
> >    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-4/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html
> > 
> >   * igt@kms_psr@fbc-pr-sprite-plane-onoff:
> >     - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
> >    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-2/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
> > 
> >   * igt@kms_psr@fbc-pr-suspend:
> >     - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#1406])
> >    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-3/igt@kms_psr@fbc-pr-suspend.html
> > 
> >   * igt@kms_psr@fbc-psr2-basic:
> >     - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +3 other tests skip
> >    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-6/igt@kms_psr@fbc-psr2-basic.html
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929])
> >    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-dg2-463/igt@kms_psr@fbc-psr2-basic.html
> > 
> >   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
> >     - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#1127])
> >    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
> > 
> >   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
> >     - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2330])
> >    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> > 
> >   * igt@kms_rotation_crc@sprite-rotation-270:
> >     - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#3414] / [Intel XE#3904])
> >    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-3/igt@kms_rotation_crc@sprite-rotation-270.html
> > 
> >   * igt@kms_setmode@basic@pipe-a-hdmi-a-3:
> >     - shard-bmg:          [PASS][83] -> [FAIL][84] ([Intel XE#6361]) +1 other test fail
> >    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-5/igt@kms_setmode@basic@pipe-a-hdmi-a-3.html
> >    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-6/igt@kms_setmode@basic@pipe-a-hdmi-a-3.html
> > 
> >   * igt@kms_setmode@invalid-clone-single-crtc-stealing:
> >     - shard-bmg:          [PASS][85] -> [SKIP][86] ([Intel XE#1435])
> >    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
> >    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
> > 
> >   * igt@kms_vblank@ts-continuation-dpms-suspend:
> >     - shard-lnl:          NOTRUN -> [ABORT][87] ([Intel XE#6675]) +1 other test abort
> >    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-4/igt@kms_vblank@ts-continuation-dpms-suspend.html
> > 
> >   * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1:
> >     - shard-lnl:          NOTRUN -> [INCOMPLETE][88] ([Intel XE#4488])
> >    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1.html
> > 
> >   * igt@xe_compute@ccs-mode-basic:
> >     - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#1447])
> >    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-3/igt@xe_compute@ccs-mode-basic.html
> > 
> >   * igt@xe_compute_preempt@compute-preempt-many-all-ram:
> >     - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#6360])
> >    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-4/igt@xe_compute_preempt@compute-preempt-many-all-ram.html
> > 
> >   * igt@xe_copy_basic@mem-page-copy-17:
> >     - shard-adlp:         NOTRUN -> [SKIP][91] ([Intel XE#5300])
> >    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-4/igt@xe_copy_basic@mem-page-copy-17.html
> > 
> >   * igt@xe_eu_stall@invalid-sampling-rate:
> >     - shard-adlp:         NOTRUN -> [SKIP][92] ([Intel XE#5626])
> >    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-4/igt@xe_eu_stall@invalid-sampling-rate.html
> > 
> >   * igt@xe_eudebug@basic-vm-access-faultable:
> >     - shard-adlp:         NOTRUN -> [SKIP][93] ([Intel XE#4837] / [Intel XE#5565]) +1 other test skip
> >    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-4/igt@xe_eudebug@basic-vm-access-faultable.html
> > 
> >   * igt@xe_eudebug_online@interrupt-all-set-breakpoint-faultable:
> >     - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#4837]) +2 other tests skip
> >    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-3/igt@xe_eudebug_online@interrupt-all-set-breakpoint-faultable.html
> > 
> >   * igt@xe_eudebug_online@set-breakpoint:
> >     - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#4837]) +4 other tests skip
> >    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-8/igt@xe_eudebug_online@set-breakpoint.html
> > 
> >   * igt@xe_evict@evict-beng-mixed-many-threads-large:
> >     - shard-adlp:         NOTRUN -> [SKIP][96] ([Intel XE#261])
> >    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-4/igt@xe_evict@evict-beng-mixed-many-threads-large.html
> > 
> >   * igt@xe_evict@evict-large-external:
> >     - shard-adlp:         NOTRUN -> [SKIP][97] ([Intel XE#261] / [Intel XE#5564])
> >    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-4/igt@xe_evict@evict-large-external.html
> > 
> >   * igt@xe_evict@evict-mixed-many-threads-small:
> >     - shard-bmg:          NOTRUN -> [INCOMPLETE][98] ([Intel XE#6321])
> >    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html
> > 
> >   * igt@xe_evict@evict-small-cm:
> >     - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#261] / [Intel XE#5564] / [Intel XE#688])
> >    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-6/igt@xe_evict@evict-small-cm.html
> > 
> >   * igt@xe_evict@evict-threads-small:
> >     - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#688]) +3 other tests skip
> >    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-3/igt@xe_evict@evict-threads-small.html
> > 
> >   * igt@xe_exec_basic@multigpu-no-exec-null-rebind:
> >     - shard-adlp:         NOTRUN -> [SKIP][101] ([Intel XE#1392] / [Intel XE#5575]) +2 other tests skip
> >    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-6/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html
> > 
> >   * igt@xe_exec_basic@multigpu-no-exec-rebind:
> >     - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#1392]) +1 other test skip
> >    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-4/igt@xe_exec_basic@multigpu-no-exec-rebind.html
> > 
> >   * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
> >     - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#2322]) +2 other tests skip
> >    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-2/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
> > 
> >   * igt@xe_exec_fault_mode@many-bindexecqueue-imm:
> >     - shard-adlp:         NOTRUN -> [SKIP][104] ([Intel XE#288] / [Intel XE#5561]) +7 other tests skip
> >    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-6/igt@xe_exec_fault_mode@many-bindexecqueue-imm.html
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#288]) +1 other test skip
> >    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-dg2-463/igt@xe_exec_fault_mode@many-bindexecqueue-imm.html
> > 
> >   * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
> >     - shard-adlp:         NOTRUN -> [SKIP][106] ([Intel XE#2360])
> >    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-4/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
> > 
> >   * igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset:
> >     - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#5007])
> >    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-3/igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset.html
> > 
> >   * igt@xe_exec_system_allocator@many-large-execqueues-mmap-shared-remap-dontunmap-eocheck:
> >     - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#4915]) +67 other tests skip
> >    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-6/igt@xe_exec_system_allocator@many-large-execqueues-mmap-shared-remap-dontunmap-eocheck.html
> > 
> >   * igt@xe_exec_system_allocator@process-many-stride-mmap-remap-ro-dontunmap:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#4915]) +11 other tests skip
> >    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-dg2-463/igt@xe_exec_system_allocator@process-many-stride-mmap-remap-ro-dontunmap.html
> > 
> >   * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-huge-nomemset:
> >     - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#4943]) +9 other tests skip
> >    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-3/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-huge-nomemset.html
> > 
> >   * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge:
> >     - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#4943]) +4 other tests skip
> >    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge.html
> > 
> >   * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
> >     - shard-lnl:          NOTRUN -> [ABORT][112] ([Intel XE#4757])
> >    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
> > 
> >   * igt@xe_mmap@pci-membarrier:
> >     - shard-lnl:          NOTRUN -> [SKIP][113] ([Intel XE#5100])
> >    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-3/igt@xe_mmap@pci-membarrier.html
> > 
> >   * igt@xe_module_load@load:
> >     - shard-bmg:          ([PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137]) -> ([SKIP][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163]) ([Intel XE#2457])
> >    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-2/igt@xe_module_load@load.html
> >    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-4/igt@xe_module_load@load.html
> >    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-6/igt@xe_module_load@load.html
> >    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-1/igt@xe_module_load@load.html
> >    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-8/igt@xe_module_load@load.html
> >    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-3/igt@xe_module_load@load.html
> >    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-3/igt@xe_module_load@load.html
> >    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-5/igt@xe_module_load@load.html
> >    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-5/igt@xe_module_load@load.html
> >    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-5/igt@xe_module_load@load.html
> >    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-5/igt@xe_module_load@load.html
> >    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-1/igt@xe_module_load@load.html
> >    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-7/igt@xe_module_load@load.html
> >    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-7/igt@xe_module_load@load.html
> >    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-4/igt@xe_module_load@load.html
> >    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-4/igt@xe_module_load@load.html
> >    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-8/igt@xe_module_load@load.html
> >    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-8/igt@xe_module_load@load.html
> >    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-7/igt@xe_module_load@load.html
> >    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-6/igt@xe_module_load@load.html
> >    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-6/igt@xe_module_load@load.html
> >    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-3/igt@xe_module_load@load.html
> >    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-6/igt@xe_module_load@load.html
> >    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-2/igt@xe_module_load@load.html
> >    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-8/igt@xe_module_load@load.html
> >    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-1/igt@xe_module_load@load.html
> >    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-1/igt@xe_module_load@load.html
> >    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-1/igt@xe_module_load@load.html
> >    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-7/igt@xe_module_load@load.html
> >    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-8/igt@xe_module_load@load.html
> >    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-7/igt@xe_module_load@load.html
> >    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-5/igt@xe_module_load@load.html
> >    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-5/igt@xe_module_load@load.html
> >    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-5/igt@xe_module_load@load.html
> >    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-6/igt@xe_module_load@load.html
> >    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-2/igt@xe_module_load@load.html
> >    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-2/igt@xe_module_load@load.html
> >    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-6/igt@xe_module_load@load.html
> >    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-3/igt@xe_module_load@load.html
> >    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-3/igt@xe_module_load@load.html
> >    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-6/igt@xe_module_load@load.html
> >    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-6/igt@xe_module_load@load.html
> >    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-8/igt@xe_module_load@load.html
> >    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-4/igt@xe_module_load@load.html
> >    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-8/igt@xe_module_load@load.html
> >    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-4/igt@xe_module_load@load.html
> >    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-4/igt@xe_module_load@load.html
> >    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-8/igt@xe_module_load@load.html
> >    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-3/igt@xe_module_load@load.html
> >    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-2/igt@xe_module_load@load.html
> > 
> >   * igt@xe_oa@invalid-oa-format-id:
> >     - shard-adlp:         NOTRUN -> [SKIP][164] ([Intel XE#3573])
> >    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-4/igt@xe_oa@invalid-oa-format-id.html
> > 
> >   * igt@xe_peer2peer@read:
> >     - shard-adlp:         NOTRUN -> [SKIP][165] ([Intel XE#1061])
> >    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-4/igt@xe_peer2peer@read.html
> > 
> >   * igt@xe_pm@d3cold-mmap-vram:
> >     - shard-lnl:          NOTRUN -> [SKIP][166] ([Intel XE#2284] / [Intel XE#366])
> >    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-3/igt@xe_pm@d3cold-mmap-vram.html
> > 
> >   * igt@xe_pm@s2idle-basic-exec:
> >     - shard-adlp:         [PASS][167] -> [ABORT][168] ([Intel XE#6675]) +5 other tests abort
> >    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-adlp-6/igt@xe_pm@s2idle-basic-exec.html
> >    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-3/igt@xe_pm@s2idle-basic-exec.html
> > 
> >   * igt@xe_pm@s2idle-vm-bind-prefetch:
> >     - shard-bmg:          [PASS][169] -> [ABORT][170] ([Intel XE#6675])
> >    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-1/igt@xe_pm@s2idle-vm-bind-prefetch.html
> >    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-6/igt@xe_pm@s2idle-vm-bind-prefetch.html
> > 
> >   * igt@xe_pm@s3-d3cold-basic-exec:
> >     - shard-bmg:          NOTRUN -> [SKIP][171] ([Intel XE#2284])
> >    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-8/igt@xe_pm@s3-d3cold-basic-exec.html
> > 
> >   * igt@xe_pm@vram-d3cold-threshold:
> >     - shard-lnl:          NOTRUN -> [SKIP][172] ([Intel XE#579])
> >    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-4/igt@xe_pm@vram-d3cold-threshold.html
> > 
> >   * igt@xe_pmu@engine-activity-accuracy-90:
> >     - shard-lnl:          [PASS][173] -> [FAIL][174] ([Intel XE#6251]) +4 other tests fail
> >    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-lnl-2/igt@xe_pmu@engine-activity-accuracy-90.html
> >    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-2/igt@xe_pmu@engine-activity-accuracy-90.html
> > 
> >   * igt@xe_pxp@pxp-termination-key-update-post-termination-irq:
> >     - shard-bmg:          NOTRUN -> [SKIP][175] ([Intel XE#4733])
> >    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-2/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html
> > 
> >   * igt@xe_query@multigpu-query-hwconfig:
> >     - shard-lnl:          NOTRUN -> [SKIP][176] ([Intel XE#944])
> >    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-3/igt@xe_query@multigpu-query-hwconfig.html
> > 
> >   * igt@xe_query@multigpu-query-topology:
> >     - shard-adlp:         NOTRUN -> [SKIP][177] ([Intel XE#944])
> >    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-4/igt@xe_query@multigpu-query-topology.html
> > 
> >   * igt@xe_render_copy@render-stress-1-copies:
> >     - shard-adlp:         NOTRUN -> [SKIP][178] ([Intel XE#4814] / [Intel XE#5614])
> >    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-4/igt@xe_render_copy@render-stress-1-copies.html
> > 
> >   * igt@xe_survivability@i2c-functionality:
> >     - shard-lnl:          NOTRUN -> [SKIP][179] ([Intel XE#6529])
> >    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-3/igt@xe_survivability@i2c-functionality.html
> > 
> >   
> > #### Possible fixes ####
> > 
> >   * igt@kms_flip@2x-flip-vs-dpms:
> >     - shard-bmg:          [SKIP][180] ([Intel XE#2316]) -> [PASS][181]
> >    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms.html
> >    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms.html
> > 
> >   * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
> >     - shard-bmg:          [ABORT][182] ([Intel XE#1727]) -> [PASS][183] +1 other test pass
> >    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-2/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
> >    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-8/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
> > 
> >   * igt@kms_psr@psr2-suspend@edp-1:
> >     - shard-lnl:          [ABORT][184] ([Intel XE#2625] / [Intel XE#6675]) -> [PASS][185] +1 other test pass
> >    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-lnl-8/igt@kms_psr@psr2-suspend@edp-1.html
> >    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-4/igt@kms_psr@psr2-suspend@edp-1.html
> > 
> >   * igt@kms_setmode@basic@pipe-b-edp-1:
> >     - shard-lnl:          [FAIL][186] ([Intel XE#6361]) -> [PASS][187] +2 other tests pass
> >    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-lnl-8/igt@kms_setmode@basic@pipe-b-edp-1.html
> >    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html
> > 
> >   * igt@xe_pm@s2idle-basic-exec:
> >     - shard-bmg:          [ABORT][188] ([Intel XE#6675]) -> [PASS][189] +1 other test pass
> >    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-4/igt@xe_pm@s2idle-basic-exec.html
> >    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-2/igt@xe_pm@s2idle-basic-exec.html
> > 
> >   * igt@xe_pm@s2idle-exec-after:
> >     - shard-lnl:          [ABORT][190] ([Intel XE#6675]) -> [PASS][191]
> >    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-lnl-3/igt@xe_pm@s2idle-exec-after.html
> >    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-3/igt@xe_pm@s2idle-exec-after.html
> > 
> >   * igt@xe_pm@s3-multiple-execs:
> >     - shard-adlp:         [ABORT][192] ([Intel XE#6675]) -> [PASS][193] +1 other test pass
> >    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-adlp-1/igt@xe_pm@s3-multiple-execs.html
> >    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-6/igt@xe_pm@s3-multiple-execs.html
> >     - shard-dg2-set2:     [ABORT][194] ([Intel XE#6675]) -> [PASS][195]
> >    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-dg2-436/igt@xe_pm@s3-multiple-execs.html
> >    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-dg2-463/igt@xe_pm@s3-multiple-execs.html
> > 
> >   * igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_enhance0:
> >     - shard-lnl:          [FAIL][196] ([Intel XE#6251]) -> [PASS][197]
> >    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-lnl-1/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_enhance0.html
> >    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_enhance0.html
> > 
> >   
> > #### Warnings ####
> > 
> >   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
> >     - shard-adlp:         [FAIL][198] ([Intel XE#1231]) -> [FAIL][199] ([Intel XE#1231] / [Intel XE#6699]) +5 other tests fail
> >    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> >    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> > 
> >   * igt@kms_flip@2x-flip-vs-suspend-interruptible:
> >     - shard-bmg:          [SKIP][200] ([Intel XE#2316]) -> [ABORT][201] ([Intel XE#6675])
> >    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
> >    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
> > 
> >   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
> >     - shard-bmg:          [SKIP][202] ([Intel XE#2312]) -> [SKIP][203] ([Intel XE#2311]) +2 other tests skip
> >    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
> >    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
> >     - shard-bmg:          [SKIP][204] ([Intel XE#2312]) -> [SKIP][205] ([Intel XE#4141])
> >    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html
> >    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
> >     - shard-bmg:          [SKIP][206] ([Intel XE#4141]) -> [SKIP][207] ([Intel XE#2312]) +2 other tests skip
> >    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
> >    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt:
> >     - shard-bmg:          [SKIP][208] ([Intel XE#2311]) -> [SKIP][209] ([Intel XE#2312]) +8 other tests skip
> >    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html
> >    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
> >     - shard-bmg:          [SKIP][210] ([Intel XE#2312]) -> [SKIP][211] ([Intel XE#2313]) +3 other tests skip
> >    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
> >    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
> > 
> >   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
> >     - shard-bmg:          [SKIP][212] ([Intel XE#2313]) -> [SKIP][213] ([Intel XE#2312]) +10 other tests skip
> >    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
> >    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
> > 
> >   * igt@kms_joiner@basic-big-joiner:
> >     - shard-bmg:          [SKIP][214] ([Intel XE#346]) -> [SKIP][215] ([Intel XE#346] / [Intel XE#6590]) +1 other test skip
> >    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-7/igt@kms_joiner@basic-big-joiner.html
> >    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-5/igt@kms_joiner@basic-big-joiner.html
> > 
> >   * igt@kms_joiner@basic-ultra-joiner:
> >     - shard-bmg:          [SKIP][216] ([Intel XE#2927]) -> [SKIP][217] ([Intel XE#2927] / [Intel XE#6590])
> >    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-8/igt@kms_joiner@basic-ultra-joiner.html
> >    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-1/igt@kms_joiner@basic-ultra-joiner.html
> > 
> >   * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
> >     - shard-bmg:          [SKIP][218] ([Intel XE#2934]) -> [SKIP][219] ([Intel XE#2934] / [Intel XE#6590])
> >    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
> >    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/shard-bmg-4/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
> > 
> >   
> >   {name}: This element is suppressed. This means it is ignored when computing
> >           the status of the difference (SUCCESS, WARNING, or FAILURE).
> > 
> >   [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
> >   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
> >   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
> >   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
> >   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
> >   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
> >   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
> >   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
> >   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
> >   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
> >   [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
> >   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
> >   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
> >   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
> >   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
> >   [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
> >   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
> >   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
> >   [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
> >   [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
> >   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
> >   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
> >   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
> >   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
> >   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
> >   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
> >   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
> >   [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
> >   [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
> >   [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
> >   [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
> >   [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
> >   [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
> >   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
> >   [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
> >   [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
> >   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
> >   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
> >   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
> >   [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
> >   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
> >   [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
> >   [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
> >   [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
> >   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
> >   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
> >   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
> >   [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
> >   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
> >   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
> >   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
> >   [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
> >   [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
> >   [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
> >   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
> >   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
> >   [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
> >   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
> >   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
> >   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
> >   [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
> >   [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
> >   [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
> >   [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
> >   [Intel XE#4488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4488
> >   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
> >   [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
> >   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
> >   [Intel XE#4757]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4757
> >   [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
> >   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
> >   [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
> >   [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
> >   [Intel XE#5007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
> >   [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
> >   [Intel XE#5300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300
> >   [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
> >   [Intel XE#5564]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564
> >   [Intel XE#5565]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565
> >   [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
> >   [Intel XE#5614]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5614
> >   [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
> >   [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
> >   [Intel XE#6251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251
> >   [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
> >   [Intel XE#6360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6360
> >   [Intel XE#6361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361
> >   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
> >   [Intel XE#6529]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6529
> >   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
> >   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
> >   [Intel XE#6590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6590
> >   [Intel XE#6675]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6675
> >   [Intel XE#6676]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6676
> >   [Intel XE#6699]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6699
> >   [Intel XE#6704]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6704
> >   [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
> >   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
> >   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
> >   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
> >   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> > 
> > 
> > Build changes
> > -------------
> > 
> >   * Linux: xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65 -> xe-pw-158344v1
> > 
> >   IGT_8647: 8647
> >   xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65: 639f325d8cbdc690de963db2fe5840444ac7ea65
> >   xe-pw-158344v1: 158344v1
> > 
> > == Logs ==
> > 
> > For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158344v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

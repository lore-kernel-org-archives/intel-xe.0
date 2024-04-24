Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA842C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 24 Apr 2024 03:58:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F86E10F03D;
	Wed, 24 Apr 2024 03:58:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VJWvuZ8U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE5D010F03D
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Apr 2024 03:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713931084; x=1745467084;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WVfZYKRf0wmWzzM50WJNnKYYsqS6e2dvNp+CarYo3xo=;
 b=VJWvuZ8UtI2NLVKpwUhsQo2Ya4VMcvTy8K8+HUcH3aXDlx6X/rcztWGs
 kBgbQlwF1mxQbYFMpqrphS3EWN5s6WyYJE16dKyOh2kuyP2sGIYXIx5Sr
 rHD6HVa0oE7w8OmTt7rgA2QgzatR8N0w1mrLrL7r5gU500n5xTNt09NyT
 +54OSYLUKIBd2w2lOInp+24WjY00Jd0QMD4fDhLZZUdz92UhEBQKSAHmh
 35fjkN4i/nBCEttTkl6ZJ1Gj+nAnehBtEQ32O05bBbdNYm5YvpWOWfmGu
 mHoCCTo6OsPVdrNCnEPdfTU0AQ8ieoNl/lJqin0tILPkc1ZYE/4Aewl7M A==;
X-CSE-ConnectionGUID: X6TcUaLSTFWZuJzpkm/3Rg==
X-CSE-MsgGUID: GzKXE/b6SUekHFURN1KNfg==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9468772"
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="9468772"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 20:58:03 -0700
X-CSE-ConnectionGUID: LT+YlzyhT3ujX2QhRMCu/w==
X-CSE-MsgGUID: XQxChLjSTw+waSRXu1gIyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; d="scan'208";a="24619761"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Apr 2024 20:58:02 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 20:58:02 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 20:58:02 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Apr 2024 20:58:02 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Apr 2024 20:58:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kFOjxbyGFqh6PvXwVRKb2MoprJdToIexyyXSHlPCR172CfgDbtZfcOBStw6fLLLe9zk69VRvX9yULzOzcRgzQGHewV5P2opBSFE/wMWXCfEJdwQSjKsNfn9chmj0rCEDbyW9zLJ8xe6T2qkS+hZWL3u32aAHL7wcHHfnT/LtT0RQWIXNpM+nCk6HAfdjQQFxMPwUq28fl0u1BLqoWl0dG8IxxA54X4SoiR8o+6aK/9nc+Cq6tyIJ5HUQGcXhrde3v3Oybk/65vFCXgAuvrV4quTWAa4Ltqrd55PGlsIiKgsJH4VyF3w9NvsE5xPD7BXLlwF3Ye4iOLhdGBUrWuXSBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=By7Dhx+N/os49dKyUtbL81NKonnhQ+zLnaHZmweR6bE=;
 b=Q0O8BtuuNsGsbgvohf1ubHeP/DVWA8UoMF/wLjJjRgx5ZD+qYcG6wLqp1itu0BXd4h4OuBt3Zq/Gu/jM4m8nr5+NJlbrZP5319hortkfkScWVreAyX1R8s8aL+aespODXDrg+DJBK43EYRee9Q3gHFxbbJoiMeTSfx1P+ZTJiXHcwWWSe9z6bc/YU0iVh7XVG5uEfqQO2TSim3r0k8GSLuObSKbd8PsKSZMbgqvofE02A3P3K33oipCykrFLi8e3RsWgiUUNhMstq8yDu0ykrg4h6dZcK62gxQP5xvNQWRbv1GNqRlUumz4nKmtexP/wvH0KQ+tFjzsL8dyTu7YzqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SA1PR11MB6567.namprd11.prod.outlook.com (2603:10b6:806:252::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.20; Wed, 24 Apr
 2024 03:57:54 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93%3]) with mapi id 15.20.7519.021; Wed, 24 Apr 2024
 03:57:54 +0000
Message-ID: <19d1ea6e-eea8-4a14-a886-740f1f8a4464@intel.com>
Date: Wed, 24 Apr 2024 09:27:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/vm: Use xe_vm_lock()/xe_vm_unlock() helpers
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Badal Nilawar <badal.nilawar@intel.com>, 
 Ashutosh Dixit <ashutosh.dixit@intel.com>
References: <20240424035756.2169209-1-himal.prasad.ghimiray@intel.com>
 <20240424035756.2169209-2-himal.prasad.ghimiray@intel.com>
 <ZiiCi8RUNDytoZoS@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <ZiiCi8RUNDytoZoS@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0189.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::10) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SA1PR11MB6567:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cfdcc57-67b9-4277-ca91-08dc6412b831
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aHVOUit4UGx5ZUhCK2hESXJmM1podWo2S3Jyc3Z1amNDdXRQb3NOc2ovMnZO?=
 =?utf-8?B?ZjFjK2FWeFQrSi9CYVArSysvT3NldG9CT3BiSjlqM1lVNUw5MzIxYWJyeUdG?=
 =?utf-8?B?S1lWNnBGVVY2NFFoV0VvWS9aRlFtUVBOVGtmQlM3VGVVRjMxOHJaY1hHMGVT?=
 =?utf-8?B?RkVOZFFMaTROY2padDc3RzhHYm9CbytqSFlwTjVZend1N2ZtOWtXLzZVU1Vv?=
 =?utf-8?B?eldJWTU2eHNZL0FXQjRSUGFyVUZIRGxvYVRXbDFTb1JQMXF4SG55UmxpUjRV?=
 =?utf-8?B?WjAvV0NheTM2cWxPSUxnVWRhMWNZSW9zK0Z1YkJlSlRPZ1JiTkJYVHpBN3FY?=
 =?utf-8?B?UkFCN0NSN2tTQVkwUGZXS1VaWWVVa1R6b0Nqb0RlemZVRnVvOGUxSTZ0bjJs?=
 =?utf-8?B?dFhvSXc0M0dSRUxPekRESFpUT1N3YWQ2M0R2d1RqTFVrdUdoMDViQVhCeXg5?=
 =?utf-8?B?aFRhKytURVlScHZNb2VxdTRBenhjcHRibVJMODhlTnczZHh6NWhBRnNaK1RB?=
 =?utf-8?B?dklTblV2QldlVFY2QzhCV3FCS09TY0d1NndHV090ODZSZTlCeEFCaXM5VDZj?=
 =?utf-8?B?TjhOSGwvZWh2Tk4vaWhwZXUzS1oyYXV4bXZiQWVDOXVZdFNFM1hTZEVwQjB0?=
 =?utf-8?B?Z1NLdWt3RjJFdXdMRFRoTHI2NVR0WFE5ejZaR21qVzRFTVkxM2puZTFVTFhy?=
 =?utf-8?B?VWhUWW5ZWkN6NERHT1lyTU1IMGM2L3FCZXcwWHJIbEU0NER3SjUzZ3pwZEov?=
 =?utf-8?B?WnhGb0RhNFpxNlBQVDArV3JsK3VhMHJ0OTdVaTRFVTdocDVMV0lVWnlWY2gz?=
 =?utf-8?B?NTdrSFVEVTBlT1VmOUUwMkx2cHNSeHdFT0FvYlJFNDh3aHBFUVpUTmp0ZklM?=
 =?utf-8?B?YjFCSVUrM0lqUHlHZTVBNFo5SEJKQTVvWnAzSjU3TzlUSWpTeFhMUVRWT0N2?=
 =?utf-8?B?dVR3Q3MyQmFSTHJXQXVEVFFmVHNjOFI3eXgrZEduczN4OHZJR0Z0WDhtYnFM?=
 =?utf-8?B?SWJGMUg2SVBFY0tORGgxWFl0cEVxVEtuTUJPYVFiSUY2TTdkTjVNR3JZY3BW?=
 =?utf-8?B?WlpSVHRXT1VwUVVPSHF0OUZnTnNTcTY2WGx6Um4yQ3hETUk2OU1kZTQxSVRS?=
 =?utf-8?B?T3hwM21nb1dXcHZqOTM0aUVRSkZDR0RLbmJJZ2FDYmcyUW1rR00zN0pqaE5r?=
 =?utf-8?B?ZjQ1REJTRUUrbUNHdVdUWkg3bndZSEdtZEQxYncrbTVJN1EzRDY0T05Xd0VF?=
 =?utf-8?B?U0U1TGJpZFlBMUoyckEvdHhiWTNZQ1lQSDVnT3h3Uk51aWNSd2djeXd4MjQ3?=
 =?utf-8?B?TkRSbVl4UzFTZ29lSHFHVE9qT3l0SjJ2bE5Fd1lCVjR2U3NMRVhzMnBtTGhy?=
 =?utf-8?B?aDB4R2J6dFJrdXRLMGhhT25pYXBFTmlINVBBd3ZpejZMbnlKTVlvb3F1ekpH?=
 =?utf-8?B?MmlmZzA2UkVzSXlERHEyQytjd1pVdjBNRHdZREF6V24rL2RQZG9CaW1WaTdI?=
 =?utf-8?B?aTB6eHRPZElwRjhOaXJoQ0NReHJ0d3lvL29uQUQrbUtVUDVBbFd1VjdHNlNo?=
 =?utf-8?B?Z3VadTVsZUc1cFpaY3A5bnlQZ1FxUmkrRjRhazFmbnBVWGxZSHVkYk1JMHAw?=
 =?utf-8?B?dDh0MFdUWm5wM0YzTHpzWTdzSGxhVEFaKy9SK054TkxwMDNLUHN3RFJLcFll?=
 =?utf-8?B?Y2g4ck9TdEZVRU5CYVFQTkkxVCtjS0RKajFyNXlzc2o0UHh4dUxIakpBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OE5EeldPb1FtbFYvM0pvQlJIN0NoUE5qRE90d0RiRXFvS3d6Zjk0NndlQWFF?=
 =?utf-8?B?YU1RRVZFUEoxWkRta2lUOW9STWw5bEoxTGhPd2RIdW9UM3VkN0o3MkhSQ29k?=
 =?utf-8?B?MGxRRFF6U0p3aGNRckMvUDdzTzJqNkNCV2x2dHhoeHFGcWJxNXFrcTZKTWJJ?=
 =?utf-8?B?OTNhaTBJYnNZNy80OFMvd2Jaam91MGR3bHpzTlBxQ2RKeGF3emh6eXNZOWVW?=
 =?utf-8?B?T3RtNVMwRVdsWlkvQjZtTWppd2Z2c2NqVHZ6Q05BWG9LaGZwR0lubUovSTFu?=
 =?utf-8?B?SjJ6cVA3Kzc1RXVISDB2YldEQnRKVGtkKzBSVGg2dGRRNU9hMFBrbnV1VmF6?=
 =?utf-8?B?SFMvSHlNb1Z4TFZNaTZzdUV4UXpJdHBwem4wT1d1TWhOQ2owNy9KU1E4THdH?=
 =?utf-8?B?aVZYbUQ5YkNtRkhUUmtaeHhMT3RqcDJjRFRMNkZLVkNnZVBiV2cwTDd3VXJK?=
 =?utf-8?B?ZXdRZWREWUc3aTVEblVJQXpqcWpablZaSVE1UEhRUDlaY1daeFBnWWMzTlRM?=
 =?utf-8?B?T0pFR20wUlFLQ2xvaE9XTGRpVmRlZkljTTBFbEpIdXdqdXZhTkN0RHhRaits?=
 =?utf-8?B?a1NZcngrYW0ybmgxYjhxRDM1dWM5SnFYMllvakpkSDBYcWdzSC84VzZodXpR?=
 =?utf-8?B?Y1RJcUpPek5RVEZLS2ZvVUVMOHo1U3AwZDlqR016Ymt0SCs4cGZGT05HQzRz?=
 =?utf-8?B?UXFGV0JVMkdUQmhqRlZsTmZKa1dqcG1uNWkxNk9BZy9JZjVBTmRiS0hoSWla?=
 =?utf-8?B?UEJlMTFiM3RYRjdjVjFaZ2l4czUvdG1IVml6VDdCS1R3WUxPYkdFMUJ5L0RJ?=
 =?utf-8?B?NkV1emROYll6a0VJNzh5ZjZvcWUyVGVCSUhDZXN3SzNlLzBEbVV3QmNPdjBt?=
 =?utf-8?B?Y3pBeTVtMkZ2YlVyNWRhNmpWVWtPTm9IZWdjMDJLSituTy9WNWsrZEVUdThY?=
 =?utf-8?B?dEdIeWVEUFRibnMyM1VFR2Y3QTMzc2xuQm5hVGdBQmRsYXpya3dnazcvVko3?=
 =?utf-8?B?ZWoyb0J5QUxUYjl0Y24zY3V2ZVY5a0pNZjBzaTlBNnRVSmRuY1UyZnBtWmR2?=
 =?utf-8?B?VTRwbkkzeEVGdnFobDJ6dFdYMkVEeGp4M1NiL3RnQ1YrNS9zMHlyQ1FYdFlP?=
 =?utf-8?B?bkxQVjc1MXJYQ3MrdDhPRXBiOC9qVVNobklqS0dEUjFlOFpCYmI3ZVlnVjBO?=
 =?utf-8?B?cldSQTdRNWdpN0JtSVdWYWxudjMrYnFmNTZvcVhiWk1jM1BZM2VSWitRaFdj?=
 =?utf-8?B?V3RsRkNMQ2NSc2lzSHZsRTlCTXV0WnVEbkxUTGswUlY0eWYwalM4Y0RHWm1u?=
 =?utf-8?B?M0xyN2wreExwR0dvNFBXdFdVUy93QTlxWWZ6eDNGdGtocmtpWEp5OUxiWlVQ?=
 =?utf-8?B?amhMb3JEbG01Mi9VQVVYN1hnWE9PNHczMyt0MmZad1YxdHNBeEc4cnVhdHN5?=
 =?utf-8?B?RUkwQU8rQXNaZFdGTnE5QWs1LzBwMDNvOHVmUmpXQnZEYmJaOUdIc0cyNDUy?=
 =?utf-8?B?dnRhNFcvdmZ1d24yOUxSUGdhakxhZ2VPL1dZRU5udks2U2hsaWNzMlZOc2RH?=
 =?utf-8?B?U1hMeGlmdUx3VnZIY0ZzcUNtUXB0WkhpQzkya29NZTlrZFZlaUZ1RlBpMWh0?=
 =?utf-8?B?eDlLVFUrRThmNWR2L0svVUJzRjFkaTJJczF4eG5ncnpQU1B3L1o3b2FwNUNC?=
 =?utf-8?B?Y0tVVHpnSzZKWS9jVDNhekZ5QjR0dzRid05jWitEanhOVXl4SEZtZHkvcVFM?=
 =?utf-8?B?bENDZTZraWJSd1lkWWRvN21YdllHQUZoSkhYaFBHWUpNM1BtWWlPcmFVSEk3?=
 =?utf-8?B?WUlxeVBaTE11dVVUOTBhaHhYcElDRmU3YWRuYldaUnFNVy8rbGxQZkttL0ds?=
 =?utf-8?B?T0JkQklkWXZuRDBRQUlKT0tqVlI0OWM3bWtsSDZiSHdrcHFCbzBFT1AwbHlp?=
 =?utf-8?B?cng2L0JqemtoSzNQSmI5eXRNdnpORC9BTzNCc0FjWS9td0pXVi8xMWFHWkVs?=
 =?utf-8?B?TlBxTWgyNURTcENWS2VUWXJoYnR3OXlJZlZDY3BYT1hITCtreE14bG1uU0c1?=
 =?utf-8?B?dEl4L0dGMVZrcDMzdTV4cXdock1veTYrZXJmL2J0d2d6V0NiL2JsNWJ1VnYv?=
 =?utf-8?B?NXBEL1BRUTRZaFZ2WUppRE14S0Q3QzlvRk9HSHNyTHlpT0tEMmR3cm1Dd2Z4?=
 =?utf-8?B?WlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cfdcc57-67b9-4277-ca91-08dc6412b831
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 03:57:54.5221 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qxg+Lv3zUYo92MvlPIUvwHTOkLrd3dSd9m//vadN69OxKBG9ntyCY1HcJvvdHw7JJq5AS04FrjKnQck+g7QMZKEiilB/BUd3Gu1n2Nn/lGo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6567
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


On 24-04-2024 09:24, Matthew Brost wrote:
> On Wed, Apr 24, 2024 at 09:27:55AM +0530, Himal Prasad Ghimiray wrote:
>> There is no change in functionality. Using the helper function
>> defined within the driver.
>>
>> -v2
>> Use xe_vm_unlock() (Ashutosh/Matt)
>>
>> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_vm.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 85d6f359142d..c350c561e7d9 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -1279,7 +1279,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>>   
>>   	drm_gem_object_put(vm_resv_obj);
>>   
>> -	err = dma_resv_lock_interruptible(xe_vm_resv(vm), NULL);
>> +	err = xe_vm_lock(vm, true);
>>   	if (err)
>>   		goto err_close;
>>   
>> @@ -1323,7 +1323,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>>   
>>   		xe_pt_populate_empty(tile, vm, vm->pt_root[id]);
>>   	}
>> -	dma_resv_unlock(xe_vm_resv(vm));
>> +	xe_vm_unlock(vm);
> There is another dma_resv_unlock below the label 'err_unlock_close' too.
>
> Matt


Thanks Matt, Addressing it in next version.


>
>>   
>>   	/* Kernel migration VM shouldn't have a circular loop.. */
>>   	if (!(flags & XE_VM_FLAG_MIGRATION)) {
>> -- 
>> 2.25.1
>>

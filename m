Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91AB7C54ED0
	for <intel-xe@archiver.kernel.org>; Fri, 23 May 2025 16:51:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C7ED88A27;
	Fri, 23 May 2025 16:51:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CWdgxTup";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A698F88A27
 for <intel-xe@lists.freedesktop.org>; Fri, 23 May 2025 16:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748019099; x=1779555099;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rgJ5+YwmCh4LL8kiVAeIvb2rmbHeFwr09vUs7dgOaaA=;
 b=CWdgxTupeOzyRp0JFk1OOTlT4ZkhQhCe9F4F028hhoDYvJ5tCXSsXYTu
 LuvQ++/GMjs1ONpLr4hfwSrItHh2zeSJfAc/UmR0zYBOw/S2q8rnnOmEW
 n7/nVwaaMkSjAEjjsXT8xA3/O/Q7S6OQ1T5jU/QbUgI5aDMbf4m7Lmnun
 PYvGi8KJOEDucSjVfCbgtWq44SR1ssWCdiOpMGOKg/sA3IShjewnNlLsH
 bAyh0luxEktIAIr7soi6x7vX9EOQeiHhsx2jmmze+Jj7VXtzbIvpcZZxm
 gvEwesZ7rwoGYkyiAhjD95TEA7mlYvCUoeAVLHSFlsj+NARZKMI0p1Jc0 w==;
X-CSE-ConnectionGUID: f1Xd6q1uSyWWLsWiOrRlPg==
X-CSE-MsgGUID: aafOkZccRJCEg9rG8Z/XJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49198912"
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; d="scan'208";a="49198912"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 09:51:35 -0700
X-CSE-ConnectionGUID: VH90ZjfQRYe0UwRY5jVNVw==
X-CSE-MsgGUID: myjRerUNQpuFjCbgkuBRqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; d="scan'208";a="141097367"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 09:51:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 23 May 2025 09:51:35 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 23 May 2025 09:51:35 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.78)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Fri, 23 May 2025 09:51:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z5P04g8I8QNaEv4yiMe3JtycCrqZ4eMMVzHkbymn8//019DtFyTiljvb2sURdwd60yCj3mmapkTBxXAe1ttyEsy10qPqf4zyXwvzK7/crO4i5B4EdMMPAwP5FUaAHK7UvQQsZF9xjt0HJcGAAHGvRvh+zyiNqlrwW6cGrIvtta8+eVxa//y4UYFXeEx5szKTn+ZJ0Mzy1r5Owb9+11corgwVNRiEPXOUgR1YCqzmbkEiQpADMjBlUsWNXClPextlGL2rdii1F8PNXcYBJU719JXTrzrUhfccQywf7LpZqy37hBrVOd7vp754vrVHjhZc3JEm6CCK39kJjHpVmyME1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c+27NJj8aS/AOI+6T/RTa8ognH/Kwo7+C9HhMgsoKkE=;
 b=ekv9bJFdmsagnkgX3pj+B/WwpdEk9IcsGOowYkcGh9+qJjRzVSTzExwfjmAkW+YnG3Avuj37cUMPtSAunP7xP53Cr9JzVEqZTuKMQ52BSCM/bKyLJbsxQYGG0J6iCFu9LpruN4DG12F5GdJUAkI8NTSvjKZvcNsF3GSyeg8Ob90FfSzTs1m8FLJNUShSynV3LGXPXsL+tfWOCoo5L3/QHmTyb0FcnG5zc64wqrfm6oA+evPfo4Mmb1I/EjfQPJWcVoRwEDq+RfrE30ntuFTY4Ay8SIT5q8CubVQzkbLv2vDWvGxD0IiYWyv+spRxsqIKRJi84/6sLytiiSFoZV18Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by DM4PR11MB6455.namprd11.prod.outlook.com (2603:10b6:8:ba::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Fri, 23 May
 2025 16:51:32 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%7]) with mapi id 15.20.8769.019; Fri, 23 May 2025
 16:51:31 +0000
Message-ID: <87e44285-c2dc-4888-a889-3e588a0ebc8e@intel.com>
Date: Fri, 23 May 2025 09:51:28 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] drm/xe: Add helper function to inject fault into
 ct_dead_capture()
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>
References: <20250522080020.2787294-1-satyanarayana.k.v.p@intel.com>
 <ebbae452-0a14-46dc-8e25-989c36bb0dda@intel.com>
 <LV3PR11MB8695662472A2F378B9B894FDF998A@LV3PR11MB8695.namprd11.prod.outlook.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <LV3PR11MB8695662472A2F378B9B894FDF998A@LV3PR11MB8695.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4P221CA0022.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::27) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|DM4PR11MB6455:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c8dde22-5779-4aba-d706-08dd9a1a11e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZVRvUlpOYyttak16cG5DeUlmeW9vVlFtamRvc0lNQVBnakkrRlJaR3BTTkJ4?=
 =?utf-8?B?T1BnTGdzQUcrWWlpZWU5b3lzMlZOWG9NTDVIckVKMS9ndEhtdUpvK3FhOFlq?=
 =?utf-8?B?OXBWekV1YWFsakVsUUovd0UvNEJ4bHp3WW5vOG1jTEczQUxOTDlWS1lBWTMy?=
 =?utf-8?B?UXFNajZRRWRpclRSK21pWDg5K2FEdHQ1SXRwdFB4V2RKbFRTaXJaZGNFd0pC?=
 =?utf-8?B?dmh0aHRHcEkvM0o0bmlsMkhUNzE3bTg2eFpWVkR5bUZrbjJHd2c4bGVCR1Q0?=
 =?utf-8?B?eGU2bFhieW0vZkZncm0vallsbFRPVXFNUVFBLzh4WUIwaU1wNnQ4a05SUXNI?=
 =?utf-8?B?RmNKSVovMFBUQnZUclFnRnlmZG9HekVIckQ1M0gwWjBDUnpOTWk1VnV6bEoz?=
 =?utf-8?B?QkJCamVUZmRSSy84VGtIMFVLclJ6cXpIbytQUlBERi9jaW44c0tUWTZkR3VS?=
 =?utf-8?B?aTVndk9mYlNhaGYzRlZ1a0wxWUNtb1J4TFVmT0JmSTE5ejFSS0lLUFJBVXl4?=
 =?utf-8?B?UmtZK3JkU1lVQTBVTm9QNUQvRkRUbEd5eGwvOE5iU3V1SXlkWi94U1FueHdO?=
 =?utf-8?B?WHA0K0pNK2dhVGlZVmNBaUl6K2ZUeVRVKzVselVLLzhRbzlWWndlNXpCTkx5?=
 =?utf-8?B?amczaThpbjZYWWhRYWh2UDVRbzFTVXpzcHM5L3p2OWU1eUxHR01KekZsK2c4?=
 =?utf-8?B?MEhQamg5a1R2aFdMb2d5a2cwN0NpbmJjN0dPUTUrdUZValEvemR0bTc1OHFz?=
 =?utf-8?B?U00yVVp3YUh1RStta1A4UTQ0RUJnS2hpVi9JNldxRWR5VmFEVkhvVk9LUDZy?=
 =?utf-8?B?eEg5OUFlZE92c29rcEU5K2RUellVKzd0UFVLNWFpSHp6ODREcC9FN2ZGcVhL?=
 =?utf-8?B?eGdyTFVKVXpJOVJOTmJIZjZXSUdKWTZzT0JNTEVWWFNrWUw1dXI0enZaaDNi?=
 =?utf-8?B?Qlkza1hRb3ZLbmIvODBsWWNmeWVrbi9XRnRYRTMrbFdsQ2QyejMzK1RyeEVj?=
 =?utf-8?B?T0UreEdHcmVDYVVJZ0ZJQVN4cEVEWTB6NUxITFZwdHgzZ2M2WEl6TU1jMHor?=
 =?utf-8?B?dFA4eENLdENFeEgwcjlPZ2RsaTNQWmEzT2J0M2pPSnhaZ0J3eGZZNjdTYTRB?=
 =?utf-8?B?aHdZSWE4UUZSUW9zWk9wam9iYVRTR1krcHpyOFpCblFDd28vZ1lBemNFYjlm?=
 =?utf-8?B?ZDk5OFdqcEtacGVQOW5YdzhoK01UbHhldDFOdEV4a2lmSGxMWTFwUC9IM2E0?=
 =?utf-8?B?a1VuckY4QVdneTk2a2FHWWh5bEw1a01rWUNwQ3JUQ3QyUDUyeFhzRlVuWUt5?=
 =?utf-8?B?T1Z4bGt0NFArMXJxWmNXTWl4dTNwd2t0RnI1d1ZhMXBLSWh3WjkrZ3RwazA4?=
 =?utf-8?B?Y0VwNEJaOVV1SlRGRDkxV2prV0phMkU0VDZvOUVUVU8vS3VaOVVybG4vNDZF?=
 =?utf-8?B?MXZQWHI2Y1E4Um12MmgxdCtXSEYzdThWSG5Ta3JaN3QzR1h0ZloxTDhIRm1u?=
 =?utf-8?B?b1RFTVpQWTB1WEhuOHBqZDN3NmF5TzI2aG45V0o0aWdBeDZoN29UalMrWXl0?=
 =?utf-8?B?Rm83dnFQS2JicFpTMlkzRjY2bW5VbVFBczJpR1RobXkzeDQ4ME5rQXJrSml2?=
 =?utf-8?B?UlF2SkVTdGliVlhzbkZPS3FSL3RUN0JXTUdpMmxCeXhWZk9YZHBuajFsRVIy?=
 =?utf-8?B?bHFtZzdjd1oxcHU5cFFweFFTWEZreXZVaXQ1ZzRySmJaU29rTCtlRWs3ZCts?=
 =?utf-8?B?bXJzaUxWQjVhV1hnSGtFT3JiV0VCY2QrTVNGUktTZzJmME5VOVZKQ2hBM2lF?=
 =?utf-8?B?aWhnR2RaNzlHd2RLUEZ3RzVBTnRIQ0p5N0FhcXFyK2tIcHB3M0VMMTRDSXZu?=
 =?utf-8?B?R0hPMm11RjZlMmpJRDRsSUhHL0FvRU9vWnMxRjRzcTlRbmlOajVnWDFPZkcv?=
 =?utf-8?Q?m6/V108aZl8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vk5wWFBVY2V1SE5jeHh0RWg0RlIxMXdLOWl3QTdFWmRUcVQ1N2dDSEU4UHVW?=
 =?utf-8?B?aTJsT3p4L3RMdWlXNmk5eG9uN2Y5T1A4UDVhWEN1T2tmTVRSSTU0Z0hyZ1hr?=
 =?utf-8?B?QXZHNWJUM0t5L3VOeVVIVUZqTitSdHM3S3d3VGRVb1B5dlZ6Vk83RVIwcWJw?=
 =?utf-8?B?ZHE1dXNtaUZQUkVldmJndFNENEd2a0ZFTGEzZnFSdkhXU3RISTRCOStIMksr?=
 =?utf-8?B?RkU3SXg1NVFFUlhub2lLOGl4Smh4aVA2Vy95MUgydEVRdlJqbU1VZDlWMDFh?=
 =?utf-8?B?WHlCS3dLRkZoL2c3MTFGYXN2bytWQUVMaXRRSmdrcXFmVThMd0VaazB6bXlj?=
 =?utf-8?B?RDVBMlJBWGd1Y2dxQ3pac2l2NnBHeGtSMGxyRE5henVMRHUySFVGN0txUWY5?=
 =?utf-8?B?ZXQvUTk2cFlaK2FUN1JiTTBxbVVlMTNEano3SG5rYWtKMUlEd0Fzd0tSUUQw?=
 =?utf-8?B?WnpWRzdsd0lHN2dOd0pVcmJLTUIwQStkWUhPQnhIU2xHakJaek9ZWHZhc205?=
 =?utf-8?B?US95MENRczJidjF6aXQwUHJLb1FOS0ZJTDN6RlJEd3ZQazZYYStJa2JkZUJG?=
 =?utf-8?B?TS9aVkJ5VDMvcEQraXRzalZ5Sk0vZEpvYUUzaXJhb0NMTE9TeWk0Tll3RGNH?=
 =?utf-8?B?QlVLcmNDSGszTE5aSkwxaC93Z3JHMHlvTTBGbEtZSll4WFVSNkNRQ0RESHVt?=
 =?utf-8?B?M0swaTdLK2tGOHRCTVQreFdCckpqTXNmdUxuMEJ3dHBKU3Bpc3A3cFZYSHBQ?=
 =?utf-8?B?TnJySE5NcU9TT2I1d0dncWJVcVRleFptK1BLcXN0a1IrTjN3QWwwdVNsTW95?=
 =?utf-8?B?L3orMk1vOVRaRjNUczV6NXlsVVU5eEFONXNvMVFlekx2eFNTeDVRMENHbnNR?=
 =?utf-8?B?WWhsZU8wMG83ejhmWm9pSCs3MERvNEt6WXd4aWh5UGswZ0tjdHhBNmFORFVu?=
 =?utf-8?B?dEo3UDl1QkpMV1QxVXo4eVE3enY3QnN4SjJGU2dTY3ZSTkpXd0dEZnE4dzZx?=
 =?utf-8?B?bDhzWUtDRWVEWlZuQmltYUUxWjZ0a0FMUXlBRTVkQzBabnV5ajhZTFBzQjZq?=
 =?utf-8?B?QmU4OWNjT1pqMmRidGZCZUhPZnlkZlpXeXhyRzBKWTRueXdKOW80emNuQ2VO?=
 =?utf-8?B?UVZHNVltbWdjYjVuWFJETW50ZnA1WkplTW1pa0dMTldWbEJiVzF1Ky8zZDRY?=
 =?utf-8?B?UXh4Y3V6VkVSSkZrbHFhU2JhVno4UnRGblBic3BDVXBpSzBxL00vQUZQSkN4?=
 =?utf-8?B?RHNDVWsrdzlaY0lBd0hFb0tCUURxTGtta2pCWnR0T256ejNmczY2MWNveXBh?=
 =?utf-8?B?akJxN1dlczE5ZEZ6WUlzU0w3R0hRaXFUSHlUQkU0WmhHUE5lUXZsemtIaWQx?=
 =?utf-8?B?Q05vUHpsb0trVTVYTWxqOG8ydCt1NXNqVG43WnZKRWdlYzU0dWNFUVUyYith?=
 =?utf-8?B?N1FCdlRleW1ITzVUUnpKdnU4bDF1VGkvQkw1dWtxaEFkY0s3OURGNmorUXZX?=
 =?utf-8?B?TCszcDBzWjdjNjhUSDRJeWdPQ1cvRlVmVE9VYUpyOVFpUlBaQXBnYlQ4MXow?=
 =?utf-8?B?TkQ1UGRsVWtuRVVuYWZzdTJoQzZuRmlCKzFJUzJwUk9FSmxTYmhCMUQ3WHNB?=
 =?utf-8?B?OEw4QkZDY1V4ZWJEVTBlMUdYMU0xMGdxU3FoOGo5RWkvMDVCNmhDc1RiQ1Yz?=
 =?utf-8?B?bFZQdzdKUytuazFrYWR3STRuNm11a3BhRTNnSjVqV2d0dEZxZUtvYjU5M2NU?=
 =?utf-8?B?aUZ3QjRQS2cycG1kNGlybWUwd2tUT3FrdStxTjMvOFNScG9hUDJOYzI1cGty?=
 =?utf-8?B?Q3BDYXFGaTZSQk5HOXR0R1M2YTFrRm1oYnhpNUZScExzZTk0V0JIQ3RGVjls?=
 =?utf-8?B?WG1nMEY5M3dqOXFVaEJGZ1NHY3NMMDNxaFIvWHQ2RGVEdkZjMFRGQWxGRTB3?=
 =?utf-8?B?OVFLOVAwdDUrWHdxN2E4UFBzbHJjM3dZVWxHeUFMUWJsdGEzNHdManArRGFn?=
 =?utf-8?B?am1TMWFWQ3R1N1VmV0N5UDI4bUh1V1o4eVhvZFVMaHcxdkxBVGNQbDFDVlBo?=
 =?utf-8?B?bmo5bkFVNldPUFRjQ2drSjIrOERsSWxYWXJQNnNLOGFiVVBvc2VNeUxXY1NR?=
 =?utf-8?B?R2RaTG9PdTNKNVpPaGhoR0xpNyt3ZWNLYVBTTnBBbVpTZitrRW9TZFdqTjlU?=
 =?utf-8?B?M2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c8dde22-5779-4aba-d706-08dd9a1a11e3
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 16:51:31.8216 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w6b9rF1t+tgYczrlk4kpi0C4JkUQYKGwE8Kklndy9nQkmWw65XhzOExGt4/3btwUahBzs9KmF2ujnk1UvxPiFHRcLH89pK60v2ovRVhsCvE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6455
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

On 5/22/2025 10:33 PM, K V P, Satyanarayana wrote:
> Hi
>> -----Original Message-----
>> From: Harrison, John C <john.c.harrison@intel.com>
>> Sent: Friday, May 23, 2025 1:09 AM
>> To: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>; intel-
>> xe@lists.freedesktop.org
>> Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Nikula, Jani
>> <jani.nikula@intel.com>
>> Subject: Re: [PATCH v5] drm/xe: Add helper function to inject fault into
>> ct_dead_capture()
>>
>> On 5/22/2025 1:00 AM, Satyanarayana K V P wrote:
>>> When injecting fault to xe_guc_ct_send_recv() & xe_guc_mmio_send_recv()
>>> functions, the CI test systems are going out of space and crashing. To
>>> avoid this issue, a new helper function is created and when fault is
>>> injected into this xe_inject_fault() helper function, ct dead capture
>>> is avoided which suppresses ct dumps in the log.
>>>
>>> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>>> Suggested-by: John Harrison <John.C.Harrison@Intel.com>
>>> ---
>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Cc: Jani Nikula <jani.nikula@intel.com>
>>>
>>> V4 -> V5:
>>> - Fixed review comments.
>>>
>>> V3 -> V4:
>>> - Updated the name of helper function and moved to xe_device.h file.
>>>
>>> V2 -> V3:
>>> - Added inline function to avoid compilation error in the absence of
>>> CONFIG_FUNCTION_ERROR_INJECTION.
>>>
>>> V1 -> V2:
>>> - Fixed review comments.
>>> ---
>>>    drivers/gpu/drm/xe/xe_device.c | 18 ++++++++++++++++++
>>>    drivers/gpu/drm/xe/xe_device.h | 14 ++++++++++++++
>>>    drivers/gpu/drm/xe/xe_guc_ct.c |  6 ++++++
>>>    3 files changed, 38 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_device.c
>> b/drivers/gpu/drm/xe/xe_device.c
>>> index 660b0c5126dc..e1b4087a2974 100644
>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>> @@ -1120,6 +1120,24 @@ static void xe_device_wedged_fini(struct
>> drm_device *drm, void *arg)
>>>    	xe_pm_runtime_put(xe);
>>>    }
>>>
>>> +/**
>>> + * xe_is_injection_active() - Helper function to test whether a fault
>>> + * inject test is running.
>>> + *
>>> + * This is a helper function that the driver can use to detect whether
>>> + * a fault injection test is running in order to suppress excessive debug
>>> + * output. By default, the return value is fixed as zero but it can be modified
>>> + * by the fault injection framework to return an error.
>>> + *
>>> + * Returns:
>>> + * 0 if no fault is injected.
>>> + * Injected error if fault is injected.
>>> + */
>>> +int xe_is_injection_active(void)
>>> +{
>>> +	return xe_inject_fault();
>>> +}
>>> +
>> I'm confused. What is the point of this wrapper?
> We are injecting fault into xe_inject_fault() function which is generic. The fault injection status is obtained from
> xe_is_injection_active() function. This is to make function names meaningful.
But why?

Why not just have a single function that is named 
"xe_is_injection_active" and has the fault injected into it directly? It 
has a meaningful name, it does what it needs to do, it keeps things 
simple. Why have an extra level of function wrapper for no benefit?

And in terms of meaningful names, "xe_inject_fault" sounds like a 
function which is going to actually inject a fault somewhere. Whereas, 
you are wanting something more like 
"xe_stub_function_for_injecting_fault_into".  But as above, why bother? 
The comment tells you exactly what is happening here. There is no need 
for extra levels of wrapping just to change the name of a function.

John.

>>>    /**
>>>     * xe_device_declare_wedged - Declare device wedged
>>>     * @xe: xe device instance
>>> diff --git a/drivers/gpu/drm/xe/xe_device.h
>> b/drivers/gpu/drm/xe/xe_device.h
>>> index 0bc3bc8e6803..13a43fe4fb64 100644
>>> --- a/drivers/gpu/drm/xe/xe_device.h
>>> +++ b/drivers/gpu/drm/xe/xe_device.h
>>> @@ -195,6 +195,20 @@ void xe_device_declare_wedged(struct xe_device
>> *xe);
>>>    struct xe_file *xe_file_get(struct xe_file *xef);
>>>    void xe_file_put(struct xe_file *xef);
>>>
>>> +#ifdef CONFIG_FUNCTION_ERROR_INJECTION
>>> +/*
>>> + * As fault is injected using this function, need to make sure that
>>> + * the compiler does not optimize and make it as a inline function.
>>> + * To prevent compile optimization, "noinline" is added.
>>> + */
>>> +static noinline int xe_inject_fault(void) { return 0; }
>>> +ALLOW_ERROR_INJECTION(xe_inject_fault, ERRNO);
>>> +#else
>>> +static inline int xe_inject_fault(void) { return 0; }
>> Why not name this xe_is_injection_active() and just call it directly?
>>
>> John.
>>
>>> +#endif
>>> +
>>> +int xe_is_injection_active(void);
>>> +
>>>    /*
>>>     * Occasionally it is seen that the G2H worker starts running after a delay of
>> more than
>>>     * a second even after being queued and activated by the Linux workqueue
>> subsystem. This
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c
>> b/drivers/gpu/drm/xe/xe_guc_ct.c
>>> index 822f4c33f730..89f992feba31 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>>> @@ -2040,6 +2040,12 @@ static void ct_dead_capture(struct xe_guc_ct
>> *ct, struct guc_ctb *ctb, u32 reaso
>>>    	if (ctb)
>>>    		ctb->info.broken = true;
>>> +	/*
>>> +	 * Huge dump is getting generated when injecting error for guc
>> CT/MMIO
>>> +	 * functions. So, let us suppress the dump when fault is injected.
>>> +	 */
>>> +	if (xe_is_injection_active())
>>> +		return;
>>>
>>>    	/* Ignore further errors after the first dump until a reset */
>>>    	if (ct->dead.reported)


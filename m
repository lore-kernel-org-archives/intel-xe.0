Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 060DDD43359
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 22:55:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8E9410E2C1;
	Thu, 11 Dec 2025 22:55:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oA/v6V7E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB5B110E2C1
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Dec 2025 22:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765493708; x=1797029708;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=lP9jFwIz3a5TTwYi/w4ZIx7H2uw+Bz4jZzOLpF8Bwds=;
 b=oA/v6V7ETrfJl8UG8ulwLGGZv4PcP+jU/iyRe5bEmQGYn/Dv4/PM6X8k
 zFg3/p+HKdOzvYGwIQi1UutM3cl13NzYylf7QfKqujANHyVTb8OvgOlvn
 A2g3sES2pEVT1iaRw+3Qp/ybP6vdyOptwtWYvK664fXvvlH0sdRFB7pPa
 COCgEhj/qs13ihgP0XtuGdyXqMEB5ZwXS/xMtFau+OFuLIIGSqPqV6bIM
 m+Rc4p35/TxwXznatJql5p0lvnYJAjlL1rhxcxdfvRR1QCeheJ2+2yGWK
 x68XbjtUPskjUk1gpxKq231W9zTyJJ2WPoBS/yYypH0a/R/wDXWLpTn8X w==;
X-CSE-ConnectionGUID: Zg01hd4LQnmxzUmTFEsw9g==
X-CSE-MsgGUID: OzFs1QsAQ9OYwx8LUJNDIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="55035374"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="55035374"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 14:55:07 -0800
X-CSE-ConnectionGUID: hGi5RQ0qSLKgRrDT1P83nA==
X-CSE-MsgGUID: mH77VbWtQK+58jwaZh7Eqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="234316657"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 14:55:07 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 14:55:06 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 11 Dec 2025 14:55:06 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.3) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 14:55:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VyiQshSXPj3wwkEE9giyydBiaoLyNXQx1HXh1e3TDtlZgUjhLCM2SuzECD5YTVNx6h9w/QJr5AjwwZH+TuHi6Hz05+m1aOrtHMgPGZRVnI3OECD32vgp10omA56RQrwORQ/1QraR4MxeSASDEorh7dYs3GIHpvsIL4XgQDS9qjpKCtOHKX55f3IjbAFwqSyITye9KDyifQCq8sBT29Ah0ojBg+krgid14c83WIRxExRttjRb+p+V1F4bhTyu0UGFFMAO7Lrsj9QGoGyq/1re8wF+EM0CLRFemqgf8BOn9nSBeM3BMN9dZMYvx8172gtIhCyxyUGSTUxq+41KCMeUqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4l0KTBw8ixpkldXqgbJDF6u+8YV7LPIyaoC7OpHT6zw=;
 b=qAr4x09TNmU5+QsIUOVRvNYm1GgA+XqpGM+i9f+TxFqWoNhZUqAE6Ig+LRod4TmYg8OkYMh9v4yRIBNCrTYlLWD7xDH3WQ6eXROc6jH4V3jnImioL0gUD37uMGjWxuWhYhLPhggiw9I9xqj/98/dbit/7T69BFQ3GCVE9CqVIMrBZ9m6M4Nk1aq/gcQFGV2mza+a5pxU7GB6AcmSqTq8N5oOyJhNlQou2CgUCsyvFHjI+iddyFW/MhiDrnztNe8bQbNjlWV+n58rZVecA/R7upzbqB5ex7l9/JxXtecX1Lf/AfT1yfnMZhfbZs+Hq0iPdgpO8tXWtMKjSHRWvhjnMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SJ2PR11MB8299.namprd11.prod.outlook.com (2603:10b6:a03:53f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Thu, 11 Dec
 2025 22:55:03 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 22:55:03 +0000
Message-ID: <5fa62765-a018-4712-b966-c8eca9b3cb2b@intel.com>
Date: Thu, 11 Dec 2025 14:55:02 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/12] drm/xe/sriov: Initialize scheduler groups
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251211015700.34266-14-daniele.ceraolospurio@intel.com>
 <20251211015700.34266-17-daniele.ceraolospurio@intel.com>
 <143fc553-229e-4bf8-8494-abb06cf7ade2@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <143fc553-229e-4bf8-8494-abb06cf7ade2@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0106.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::21) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SJ2PR11MB8299:EE_
X-MS-Office365-Filtering-Correlation-Id: a2e46012-af1f-46c9-e683-08de39085203
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y0RTQXRFMUhYUjJjSVVUenk4bnl0UWhoMHk0MUt6UTNXcHN3TnlkVnV5K2lC?=
 =?utf-8?B?R2FieFgxeGZIME0zRjJnQTV2b2hxeG9Hc0FMNGtKbXpSemxYcFZ1QlpoUS85?=
 =?utf-8?B?UXpHQ0ZCcnRaeUlUZFRDcVlNbk92SHpYZTFlaHJQR0ErbEFWODlvTlE5ZnFn?=
 =?utf-8?B?YkFqZExDKzJHUlZsQlo1dVdXS2N2VkZ3aGpBRmIwZVlRQUd3SWIzUFM4V09o?=
 =?utf-8?B?NDlTekZkMllQQmNWSEs1Y2o5YkFqQXdFcTZjYXlDekNydDBmNytVS2U0Q2do?=
 =?utf-8?B?b3pWNTZPYytSTDl1SVpEZVl2a1NUMEdFVzFiWUYxZ0FPRDhhOE0wZEhhMzhT?=
 =?utf-8?B?LzdvSDN3bFlaRTNUdW5wby9HamhBN2hhRXg0enplOWkwamdGUVJKeEs0UjNL?=
 =?utf-8?B?eXRiSWZVL3p3U2FZWDhCM0djVXB3VjVWVUgwcE9DcjFuQytoOVJMYy9KMUJV?=
 =?utf-8?B?SG1YTnorZmpTRElobktIeG9jZmVjcGhnTWowS3RZSnBnRTRzYWJvTU1xSzl5?=
 =?utf-8?B?R2VRR2w3OWQ2M2tGSDkweXpmckNZVmxSZHhBS0pidlUvcDY1c1VoNUxLZ2NX?=
 =?utf-8?B?TFMyN3V4aHBqVUFzczFmTDRxNjlYeVQ4K3VVeFp0MmhldGxXdXlnR0NaWXZv?=
 =?utf-8?B?YVgrdk9iOVhrRHN6WWpQNTV1OVhQZmpZaU4ySHBTWHlEUThHbDNrMVJ1VVFG?=
 =?utf-8?B?emhFOEUwdDlWWlZ0V3ZxSmt0c2o1T05JeUc4K2J4VnAxLzl2RmJRRXQ5ZVlo?=
 =?utf-8?B?ZWp2WHF6ak44a2ZnNmhXYzFQbzlPV3BvdGJWSmFoLzhhU3BzcXFWVWhLNVdl?=
 =?utf-8?B?b01sR05PSCsxekpLRFYzcGtudGZ6eTd1WUdOdGhITEN4TVoxSjhQM011OVEx?=
 =?utf-8?B?aURVUHA1RGRCR1JyYjA0bnZYeERHZTg1ak4yUEZvSEtCQzVFN1hEZisvSEV6?=
 =?utf-8?B?SS9PWEpxTzh4S3FhQUR1azdaT3VRWDllWkRDZGpDMmpDNXQ4VGRSb2psS0Ev?=
 =?utf-8?B?M3RLbGVyOGlweWt6R2N3bGIzbDRzaUp0TkI2Ny9aKzF3bWIzOG5EUUZUSFd4?=
 =?utf-8?B?NnlZaVNUUnFQRGpvU01pU2NaeTRmenpQMXNaUXJCZGU3ZE1jRkN5dkNGM1dM?=
 =?utf-8?B?MGI5QVN3WHlWNGE0RmwybjRoK3pseWY2ekszeFpoWTk0dDZUSEdMSnpJamxl?=
 =?utf-8?B?NnQyRjRsY3lmRzEvN2RTaG1JckZ3S1VSb3pJWmZCZFhIZit1ZFVCcmFQMy9r?=
 =?utf-8?B?ODVPMGNMZEFnZ1RmcjRBZDNjRk9VUHp1M1BrajB6ajJIOExQT21EbEJUSEN5?=
 =?utf-8?B?bjN5RkI0a1JLb05yN2lOYlBRb3NibDRFSkdNd1lJbWg5VkFZeHZ5QldUWnY2?=
 =?utf-8?B?TThqMTRiN1BSMm8rSVM5R0VTZTMwUHdBWHhaY1hVMTh1Tjh6Y0RPbHAvbEFw?=
 =?utf-8?B?c1JzV0N1MnlQWDIyL3B0UGtqRlJSbU9vY1RmeUt2dW1HczFDY3BwRWpYSVB4?=
 =?utf-8?B?VGFNUC9YS1FRM3FsczV0N2xFSkswQ0hJTHpXWkNwOXZEaDRXMk5HMlVoREor?=
 =?utf-8?B?bi93RFpVOW4vTDhhOExISzkyUTQxSTdjQXd3WWQwVFJnNERhQ0pRUWxOazVi?=
 =?utf-8?B?YTdYUHhWeHRoeDdwOURxOXpZR0hET0tqcXVnL0Z3dXNCMVdydmJHbXZPNndP?=
 =?utf-8?B?UCthZzh2Wk0zU0pGMWpqUE9ZRW13N1ZwNUZCangyZThKd1Y2VDVSbmdQbTRZ?=
 =?utf-8?B?dExHaDcvWi9vdVp2SUFIMHd5bGM5ZVVkRmhUc2VRV0VFRnNNUGxUWjhKTkpS?=
 =?utf-8?B?Y245eDlaeUxqaVhQUHkzSTYzZGVZRGhZUVh5V1dWSzJRWGZsNFhhS3luS2Rx?=
 =?utf-8?B?Tk11dTNNTTVQYklHMEkvMm9HZ1VNNW5scEJtVmZ2NityQVlvZkhUeE9jSUpx?=
 =?utf-8?Q?7I6GCng+Xw0Q+mNbi7NI1yBLmOet56yY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHA2S3o0ZDBYcGEwNitBQlJzOXgyWlFjaityem8vekQ2QW9hNjR2U0lGTjVk?=
 =?utf-8?B?ZHVIbldwZUhLcmhXYVVhTTNaRThubUw4a3ZtUXR3OG9qS3pyMWdWMVU3RTB4?=
 =?utf-8?B?RWplTGlkU2tNWWRqMEpxK0NlSHBVaUpOZURsY2lpamxLcTJoV3cycXpzOWZr?=
 =?utf-8?B?VTZtYlFtdmhXK0FhZWlsK3l0emxNNHBDTy9CMjFzdW5mcUgyeDBya09iQ1Ix?=
 =?utf-8?B?QkdEY3JYMk1WQm1XL08yYjlsalM2RnZZTlFpV0IvSGFua1RtRjlJRkQvbG1U?=
 =?utf-8?B?L0NFWHNxT2w3OXhWYngzRFU3SUowcThFRTBSRTNmU0Z3VElwM1grSkRsUm1H?=
 =?utf-8?B?S1I5VW9uOXE4ajc1M2pVRUJvTm1WeURDTmlrODM4K0FaYlljUzNCdUh2MlNh?=
 =?utf-8?B?aDdnTVlBa2ZDNjRZQ3BOUm56M2d6SFFwZjVKdTR5eUNZTytYVHowS29LYnlB?=
 =?utf-8?B?M1hoemJjZDNNVGhBWFdCbk90MG1RZUpEblFvdFllY3d2akhpN3F2d2NpN014?=
 =?utf-8?B?YWdabE5jRTRqaE9sMFpzTmN4SndHb084UmpnTm4wYzJVMUlwczd3R1p4b2xx?=
 =?utf-8?B?M2tsTzdwbk1XdE83dzduclNKdFltT2xUdTN2L1JCdjRySGpsSlVVdUxWTFJy?=
 =?utf-8?B?UmxFdU1LQUM0QXU1c1dQT0pDSEsxd3NDSE1wMUlaenkvOURrUHRiaksrZkVq?=
 =?utf-8?B?WWY5Z2RZWEZLcjRXVkpXTU5yNS83aHJvRXNSSTQvWjJrWXp2STRDWDY4RXFh?=
 =?utf-8?B?SFJOR0lPeUorRVdKRUxHc0NqWndhdFlWMmpjQkRvQlIrdUV0TkdPb2JPeVRF?=
 =?utf-8?B?aVFQSHBjLzZISlRpUFFlejVSM3IvZ3B0aFRmUTc3alpuNm9mNXlXTUFZTlBR?=
 =?utf-8?B?bWlTVFBsbE9SaUI4bUJ3M3BHRjE4OGhUanlCMFJNdU1BU2VWNXpDVTNSK2lN?=
 =?utf-8?B?KzBBNE44YzQxOUV6MWx1SlAzYjQzdWJDalJGNi82OGM5cUhHWEJaQXVhVnA3?=
 =?utf-8?B?WnlqZXVFVkg0MmJvZWZ2aUZqZjQxVXRWbHNxVVh6dExRdUJFaWw4My9EYzdr?=
 =?utf-8?B?VWFybzlWOUN2c09HdXpoOHdaK1dyZHNkWDU1QUhZUjMyQy8zNW83WVF1UUQ2?=
 =?utf-8?B?Mm1heXlYTFFMZTIzS2lNWmg0ZXBCQWU3dWZuV2hJVnB1UTcrOGkreFJSa1A1?=
 =?utf-8?B?R2pmTlJ3aW1weUhCdC9yREZ3OHJTNkt6V3VBMUFVWUNBUDlsM3BxUkhHVFl5?=
 =?utf-8?B?R1JVYTVFTFQya2I4OTZUbDh6ZmFBc2RNajZxNFY2Y3gyUW9kRE1JMFVvMklP?=
 =?utf-8?B?eXRpOXJRRGFyRlg5YmFPcTlaeEJZWlUrYmZPYkxjcXpPc2M5akpFWjhlbU1q?=
 =?utf-8?B?S1JRajBxQUpPazVDL0k4NklVYmNJRlBhZFNwdUJjWklnYXhZYnJiZVJHb2hl?=
 =?utf-8?B?Y054dVZxVWlJcWlySURDUEJSeWtvcWZQRk9COEVYRTR3dWhuVGFYQ3NTM1lE?=
 =?utf-8?B?cmxjN3RFN1QvMkdyQVcyYzNVSkorQUhaZVg1Yi9raEtweDcrK1d2K1NlVHJN?=
 =?utf-8?B?dEUzSm1zNzQySEdzcmJESm9VellUbDNmWW1aa1BHRDZmb1BkUHhyRGRUeEZs?=
 =?utf-8?B?UUlBYVY5OWVFQnNFZGhDM1BnUXd5OUwxSmpnaTlWTVNWT0VhcENyTjJ1S2Z3?=
 =?utf-8?B?c1RmY1NSajBBSjRsV2pHTUxRQnJPTWR0Q09lKzlzdE45cXRNQ0xwOWZQeFhH?=
 =?utf-8?B?K2pMcVF4RVBOd0tyUkRCazhkOXdOVW94aWdIQzNoM21QTVpTRVcyM3BWdXM4?=
 =?utf-8?B?STdTSkwvSlNPcnpRYkE5UHRPZ1gvQWlKcHVzSTl2amQvQWtoUzZLODBESXJJ?=
 =?utf-8?B?ZjE0YS8vemkrc1IwcXNvUnhxUzFPbmFNb25SZ0Q2L09yZDFFNU12YW5FL2Qy?=
 =?utf-8?B?SWxSZ0NPNU5qR2pKNzEvcjZvNzBHTzB2SEFjRFNkUVRuZXlzSmZjZXlQbW1q?=
 =?utf-8?B?MW9TQ0F0bUZ3YzNUZXlyUkVXZmgvWXk3WUJEZlllVjRENTZHUUJoVEZhblEz?=
 =?utf-8?B?ZEU3ZFBTdEQ2UlhhemZLRk5kYnljM2U1OW05eHBubVZwWGZjbWxSSmEzT0Rz?=
 =?utf-8?B?OHhXNnFyNWlzRXVvbUd4TGRxWDhpQnJPT0g3cXlIL2VaQ0x5R1JBLzAzcUtt?=
 =?utf-8?Q?e/YOLKdL83HFzj1gLsVtcpE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a2e46012-af1f-46c9-e683-08de39085203
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 22:55:03.4098 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jwwJq723Q5uMwToNh94X+VuDWlXQ1VmJt+zZaChGgy40o5fRMPsvp4Kxum2GSS5A2xN6y1+VjUsCVMblclOYQE+YFpCZJqN/wCBl2TNpxZA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8299
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



On 12/11/2025 10:52 AM, Michal Wajdeczko wrote:
>
> On 12/11/2025 2:57 AM, Daniele Ceraolo Spurio wrote:
>> Scheduler groups (a.k.a. Engine Groups Scheduling, or EGS) is a GuC
>> feature that allows the driver to define groups of engines that are
>> independently scheduled across VFs, which allows different VFs to be
>> active on the HW at the same time on different groups. The feature is
>> available for BMG and newer HW starting on GuC 70.53.0, but some
>> required fixes have been added to GuC 70.55.1.
>>
>> This is intended for specific scenarios where the admin knows that the
>> VFs are not going to fully utilize the HW and therefore assigning all of
>> it to a single VF would lead to part of it being permanently idle.
>> We do not allow the admin to decide how to divide the engines across
>> groups, but we instead support specific configurations that are designed
>> for specific use-cases. During PF initialization we detect which
>> configurations are possible on a given GT and create the relevant
>> groups. Since the GuC expect a mask for each class for each group, that
>> is what we save when we init the configs.
>>
>> Right now we only have one use-case on the media GT. If the VFs are
>> running a frame render + encoding at a not-too-high resolution (e.g.
>> 1080@30fps) the render can produce frames faster than the video engine
>> can encode them, which means that the maximum number of parallel VFs is
>> limited by the VCS bandwidth. Since our products can have multiple VCS
>> engines, allowing multiple VFs to be active on the different VCS engines
>> at the same time allows us to run more parallel VFs on the same HW.
>> Given that engines in the same media slice share some resources (e.g.
>> SFC), we assign each media slice to a different scheduling group. We
>> refer to this configuration as "media_slices", given that each slice
>> gets its own group. Since upcoming products have a different number of
>> video engines per-slice, for now we limit the media_slices mode to BMG,
>> but we expect to add support for newer HW soon.
>>
>> Note that while the GuC interface supports a maximum of 8 groups, the
>> actual number of groups that can be enabled can be lower than that and
>> can be different on different devices. For now, all devices support up
>> to 2 groups.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>> v2: Use asserts for coding errors, code cleanups, better docs (Michal),
>>      limit groups to 2, limit to BMG and newer, bump required GuC to
>>      70.55.1.
>> v3: Use a struct sched_groups array instead of an array of u32 masks,
>>      move the max_group check to the next patch, rename NONE to
>>      DISABLED (Michal), limit the media_slices mode to BMG.
>> ---
>>   drivers/gpu/drm/xe/abi/guc_scheduler_abi.h    |   9 ++
>>   drivers/gpu/drm/xe/xe_gt.h                    |   3 +
>>   drivers/gpu/drm/xe/xe_gt_sriov_pf.c           |   3 +
>>   drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c    | 142 ++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h    |   2 +
>>   .../gpu/drm/xe/xe_gt_sriov_pf_policy_types.h  |  33 ++++
>>   6 files changed, 192 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_scheduler_abi.h b/drivers/gpu/drm/xe/abi/guc_scheduler_abi.h
>> index db9c171f8b64..513b22a87428 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_scheduler_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_scheduler_abi.h
>> @@ -6,6 +6,8 @@
>>   #ifndef _ABI_GUC_SCHEDULER_ABI_H
>>   #define _ABI_GUC_SCHEDULER_ABI_H
>>   
>> +#include <linux/types.h>
>> +
>>   /**
>>    * Generic defines required for registration with and submissions to the GuC
>>    * scheduler. Includes engine class/instance defines and context attributes
>> @@ -45,4 +47,11 @@
>>   #define GUC_CONTEXT_DISABLE		0
>>   #define GUC_CONTEXT_ENABLE		1
>>   
>> +/* scheduler groups */
>> +#define GUC_MAX_SCHED_GROUPS		8
>> +
>> +struct guc_sched_group {
>> +	u32 engines[GUC_MAX_ENGINE_CLASSES];
>> +} __packed;
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>> index a2ba80c954a6..de7e47763411 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.h
>> +++ b/drivers/gpu/drm/xe/xe_gt.h
>> @@ -29,6 +29,9 @@
>>   #define CCS_INSTANCES(gt) XE_ENGINE_INSTANCES_FROM_MASK(gt, CCS)
>>   #define GSCCS_INSTANCES(gt) XE_ENGINE_INSTANCES_FROM_MASK(gt, GSCCS)
>>   
>> +/* Our devices have up to 4 media slices */
>> +#define MAX_MEDIA_SLICES 4
>> +
>>   #define GT_VER(gt) ({ \
>>   	typeof(gt) gt_ = (gt); \
>>   	struct xe_device *xe = gt_to_xe(gt_); \
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>> index 0714c758b9c1..0d97a823e702 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>> @@ -14,6 +14,7 @@
>>   #include "xe_gt_sriov_pf_control.h"
>>   #include "xe_gt_sriov_pf_helpers.h"
>>   #include "xe_gt_sriov_pf_migration.h"
>> +#include "xe_gt_sriov_pf_policy.h"
>>   #include "xe_gt_sriov_pf_service.h"
>>   #include "xe_gt_sriov_printk.h"
>>   #include "xe_guc_submit.h"
>> @@ -123,6 +124,8 @@ int xe_gt_sriov_pf_init(struct xe_gt *gt)
>>   	if (err)
>>   		return err;
>>   
>> +	xe_gt_sriov_pf_policy_init(gt);
>> +
>>   	err = xe_gt_sriov_pf_migration_init(gt);
>>   	if (err)
>>   		return err;
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
>> index 4445f660e6d1..003860661687 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
>> @@ -3,6 +3,8 @@
>>    * Copyright © 2023-2024 Intel Corporation
>>    */
>>   
>> +#include <drm/drm_managed.h>
>> +
>>   #include "abi/guc_actions_sriov_abi.h"
>>   
>>   #include "xe_bo.h"
>> @@ -10,6 +12,7 @@
>>   #include "xe_gt_sriov_pf_helpers.h"
>>   #include "xe_gt_sriov_pf_policy.h"
>>   #include "xe_gt_sriov_printk.h"
>> +#include "xe_guc.h"
>>   #include "xe_guc_buf.h"
>>   #include "xe_guc_ct.h"
>>   #include "xe_guc_klv_helpers.h"
>> @@ -351,6 +354,133 @@ u32 xe_gt_sriov_pf_policy_get_sample_period(struct xe_gt *gt)
>>   	return value;
>>   }
>>   
>> +static void pf_sched_group_media_slices(struct xe_gt *gt, struct guc_sched_group **groups,
>> +					u32 *num_groups)
>> +{
>> +	u8 slice_to_group[MAX_MEDIA_SLICES];
>> +	u32 vecs_mask = VECS_INSTANCES(gt);
>> +	u32 gsc_mask = GSCCS_INSTANCES(gt);
>> +	u32 vcs_mask = VCS_INSTANCES(gt);
>> +	struct guc_sched_group *values;
>> +	struct xe_hw_engine *hwe;
>> +	enum xe_hw_engine_id id;
>> +	int group = 0;
>> +	int slice;
>> +
>> +	xe_gt_assert(gt, xe_gt_is_media_type(gt));
>> +
>> +	/*
>> +	 * Post-BMG the matching of video engines to slices changes, so for now
>> +	 * we don't allow this mode on those platforms.
>> +	 */
>> +	if (gt_to_xe(gt)->info.platform > XE_BATTLEMAGE)
>> +		return;
>> +
>> +	/*
>> +	 * On BMG and older platforms a media slice has 2 VCS and a VECS. We
>> +	 * bundle the GSC with the first slice.
>> +	 */
>> +	for (slice = 0; slice < MAX_MEDIA_SLICES; slice++) {
>> +		if ((vcs_mask & 0x3) || (vecs_mask & 0x1) || (gsc_mask & 0x1))
>> +			slice_to_group[slice] = group++;
>> +
>> +		vcs_mask >>= 2;
>> +		vecs_mask >>= 1;
>> +		gsc_mask >>= 1;
>> +	}
>> +
>> +	xe_gt_assert(gt, !vcs_mask);
>> +	xe_gt_assert(gt, !vecs_mask);
>> +	xe_gt_assert(gt, !gsc_mask);
>> +
>> +	/* We need at least 2 slices to split them up */
>> +	if (group < 2)
>> +		return;
>> +
>> +	/* The GuC expects an array with a guc_sched_group entry for each group */
>> +	values = drmm_kcalloc(&gt_to_xe(gt)->drm, group, sizeof(struct guc_sched_group),
>> +			      GFP_KERNEL);
>> +	if (!values)
>> +		return;
>> +
>> +	for_each_hw_engine(hwe, gt, id) {
>> +		u8 guc_class = xe_engine_class_to_guc_class(hwe->class);
>> +
>> +		switch (hwe->class) {
>> +		case XE_ENGINE_CLASS_VIDEO_DECODE:
>> +			slice = hwe->instance / 2;
>> +			break;
>> +		case XE_ENGINE_CLASS_VIDEO_ENHANCE:
>> +			slice = hwe->instance;
>> +			break;
>> +		case XE_ENGINE_CLASS_OTHER:
>> +			slice = 0;
>> +			break;
>> +		default:
>> +			xe_gt_assert_msg(gt, false,
>> +					 "unknown media gt class %u (%s) during EGS setup\n",
>> +					 hwe->class, hwe->name);
>> +			slice = 0;
>> +		}
>> +
>> +		values[slice_to_group[slice]].engines[guc_class] |= BIT(hwe->logical_instance);
>> +	}
>> +
>> +	*groups = values;
>> +	*num_groups = group;
>> +}
>> +
>> +/**
>> + * xe_sriov_gt_pf_policy_has_sched_groups_support() - Checks whether scheduler
>> + * groups are supported.
>> + * @gt: the &xe_gt
>> + *
>> + * This function can only be called on PF.
>> + *
>> + * Return: true if scheduler groups are supported, false otherwise.
>> + */
>> +bool xe_sriov_gt_pf_policy_has_sched_groups_support(struct xe_gt *gt)
>> +{
>> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
>> +
>> +	/*
>> +	 * The GuC supports scheduler groups from v70.53.0, but a fix for it has
>> +	 * been merged in v70.55.1, so we require the latter. The feature is
>> +	 * also only enabled on BMG and newer FW.
>> +	 */
>> +	return GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER(70, 55, 1) &&
>> +	       gt_to_xe(gt)->info.platform >= XE_BATTLEMAGE;
>> +}
>> +
>> +static void pf_init_sched_groups(struct xe_gt *gt)
>> +{
>> +	int m;
>> +
>> +	if (!xe_sriov_gt_pf_policy_has_sched_groups_support(gt))
>> +		return;
>> +
>> +	for (m = 0; m < XE_SRIOV_SCHED_GROUPS_MODES_COUNT; m++) {
>> +		u32 *num_groups = &gt->sriov.pf.policy.guc.sched_groups.modes[m].num_groups;
>> +		struct guc_sched_group **groups =
>> +			&gt->sriov.pf.policy.guc.sched_groups.modes[m].groups;
>> +
>> +		switch (m) {
>> +		case XE_SRIOV_SCHED_GROUPS_DISABLED:
>> +			break;
> nit: since we know that for DISABLED we have nothing to do in this loop,
> so maybe we should not start with it?
>
> 	for (m = XE_SRIOV_SCHED_GROUPS_DISABLED + 1, ...
> 	for (m = XE_SRIOV_SCHED_GROUPS_DISABLED; ++m < ...
> 	
>
>> +		case XE_SRIOV_SCHED_GROUPS_MEDIA_SLICES:
>> +			/* this mode only has groups on the media GT */
>> +			if (xe_gt_is_media_type(gt))
>> +				pf_sched_group_media_slices(gt, groups, num_groups);
>> +			break;
>> +		default:
> nit: since XE_SRIOV_SCHED_GROUPS are defined as enum, then if we declare 'm' as enum,
> instead of this 'default' case we could just have dummy case for COUNT
> and compiler will help us catch any new missed GROUP mode
>
>> +			xe_gt_assert_msg(gt, false, "unknown sched group mode %u\n", m);
>> +			return;
> hmm, IIRC those modes are supposed to be per device, not per-GT,
> so there is a high chance that in this loop we will have to handle non-media modes,
> so maybe this assert and early return is too much?

This code is not media-specific. If we have a non media mode we'll just 
have to do:

case XE_SRIOV_SCHED_GROUPS_NEW_MODE
     if(!xe_gt_is_media_type(gt))
         fill_masks_for_new_mode(gt, groups, num_groups);
     break;

And that'll work. The return is only in the case where we have a 
programming error and the mode has not correctly been added to the 
switch. I can still drop the return and leave just the assert, or move 
as you said to use the enum for m so that the compiler will catch the 
missing case.

>
>> +		}
>> +
>> +		xe_gt_assert(gt, *num_groups < GUC_MAX_SCHED_GROUPS);
>> +	}
>> +}
>> +
>>   static void pf_sanitize_guc_policies(struct xe_gt *gt)
>>   {
>>   	pf_sanitize_sched_if_idle(gt);
>> @@ -401,6 +531,18 @@ int xe_gt_sriov_pf_policy_reprovision(struct xe_gt *gt, bool reset)
>>   	return err ? -ENXIO : 0;
>>   }
>>   
>> +/**
>> + * xe_gt_sriov_pf_policy_init() - Initializes the SW state of the PF policies.
>> + * @gt: the &xe_gt
>> + *
>> + * This function can only be called on PF. This function does not touch the HW,
>> + * but must be called after the engines have been initialized.
>> + */
>> +void xe_gt_sriov_pf_policy_init(struct xe_gt *gt)
>> +{
>> +	pf_init_sched_groups(gt);
>> +}
>> +
>>   static void print_guc_policies(struct drm_printer *p, struct xe_gt_sriov_guc_policies *policy)
>>   {
>>   	drm_printf(p, "%s:\t%s\n",
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
>> index 2a5dc33dc6d7..f5e3b2595063 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
>> @@ -17,7 +17,9 @@ int xe_gt_sriov_pf_policy_set_reset_engine(struct xe_gt *gt, bool enable);
>>   bool xe_gt_sriov_pf_policy_get_reset_engine(struct xe_gt *gt);
>>   int xe_gt_sriov_pf_policy_set_sample_period(struct xe_gt *gt, u32 value);
>>   u32 xe_gt_sriov_pf_policy_get_sample_period(struct xe_gt *gt);
>> +bool xe_sriov_gt_pf_policy_has_sched_groups_support(struct xe_gt *gt);
>>   
>> +void xe_gt_sriov_pf_policy_init(struct xe_gt *gt);
>>   void xe_gt_sriov_pf_policy_sanitize(struct xe_gt *gt);
>>   int xe_gt_sriov_pf_policy_reprovision(struct xe_gt *gt, bool reset);
>>   int xe_gt_sriov_pf_policy_print(struct xe_gt *gt, struct drm_printer *p);
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
>> index 4de532af135e..d228cadcd8b0 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
>> @@ -8,16 +8,49 @@
>>   
>>   #include <linux/types.h>
>>   
>> +#include "abi/guc_scheduler_abi.h"
>> +
>> +/**
>> + * enum xe_sriov_sched_group_modes - list of possible scheduler group modes
>> + * @XE_SRIOV_SCHED_GROUPS_DISABLED - no separate groups (i.e., all engines in group 0)
>> + * @XE_SRIOV_SCHED_GROUPS_MEDIA_SLICES - separate groups for each media slice
>> + * @XE_SRIOV_SCHED_GROUPS_MODES_COUNT - number of valid modes
>> + */
>> +enum xe_sriov_sched_group_modes {
>> +	XE_SRIOV_SCHED_GROUPS_DISABLED = 0,
>> +	XE_SRIOV_SCHED_GROUPS_MEDIA_SLICES,
>> +	XE_SRIOV_SCHED_GROUPS_MODES_COUNT
> nit: maybe to emphasize that COUNT enumerator is not a real group mode, prefix it with underscore ?
>
> 	__XE_SRIOV_SCHED_GROUPS_MODES_COUNT /* must be last */

I can add the comment, but I'd prefer not to add the underscore at the 
front, since it is pretty clear that this is not a real mode anyway.

Daniele

>
>> +};
>> +
>> +/**
>> + * struct xe_gt_sriov_scheduler_groups - Scheduler groups policy info
>> + * @modes: array of masks and their number for each mode
>> + * @modes.groups: array of engine instance groups in given mode, with each group
>> + *                consisting of GUC_MAX_ENGINE_CLASSES engine instances masks. A
>> + *                A NULL value indicates that all the engines are in the same
>> + *                group for this mode on this GT.
>> + * @modes.num_groups: number of groups in given mode, zero if all the engines
>> + *                    are in the same group.
>> + */
>> +struct xe_gt_sriov_scheduler_groups {
>> +	struct {
>> +		struct guc_sched_group *groups;
>> +		u32 num_groups;
>> +	} modes[XE_SRIOV_SCHED_GROUPS_MODES_COUNT];
>> +};
>> +
>>   /**
>>    * struct xe_gt_sriov_guc_policies - GuC SR-IOV policies.
>>    * @sched_if_idle: controls strict scheduling policy.
>>    * @reset_engine: controls engines reset on VF switch policy.
>>    * @sample_period: adverse events sampling period (in milliseconds).
>> + * @sched_groups: available scheduling group configurations.
>>    */
>>   struct xe_gt_sriov_guc_policies {
>>   	bool sched_if_idle;
>>   	bool reset_engine;
>>   	u32 sample_period;
>> +	struct xe_gt_sriov_scheduler_groups sched_groups;
>>   };
>>   
>>   /**
> mostly nits, so
>
> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>
>


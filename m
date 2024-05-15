Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD60CC25B75
	for <intel-xe@archiver.kernel.org>; Wed, 15 May 2024 21:45:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 692F810E267;
	Wed, 15 May 2024 21:45:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EB/IQq6l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A0910E267
 for <intel-xe@lists.freedesktop.org>; Wed, 15 May 2024 21:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715809550; x=1747345550;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ZmMq/3vdPgLMTSZFUnc+3NO9XrXsNDaIG1ILAuRe3MM=;
 b=EB/IQq6lwYV9ncGw/rZW+cVsL4C8l/QRTeGeUVhoSwTNc8yf//NssCed
 VRXDkJkIJGLXzZLRFuIh2lW7W2EE/xybBLavwr6/HpQObFWjm5nwJ0pOV
 gNiPfbGSKQUwFk2zA+HCoxNf0IWUaW30p3mqhCXfS9duY4kX13NE4JXfd
 WXUNnJJGjCO1ZgCP4h2VPddCJDVcDAB260rYY6bScVaT2FaYOCAHz3DaY
 bOdDcl8qq6OlsoGdjcKYrh41RkBTun3N8kGmWeR7x9pkZ6SdTwpFMAmd5
 7m6ffKZjeS7lDD3vGoC23jlVfZ5yS+kHXgjOXHoflYZy6YOEy8VVgD5rS Q==;
X-CSE-ConnectionGUID: wVK1Aa0QTLO/OQ1y5/PNsg==
X-CSE-MsgGUID: /G8o/CXwRSKp34mnJ0qaKw==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="29377937"
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="29377937"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 14:45:49 -0700
X-CSE-ConnectionGUID: 8Mr8nVqyS5mWsWxuiSJjyw==
X-CSE-MsgGUID: FjhOouyLTm2cVz/NbBZjyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="35977794"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 May 2024 14:45:50 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 15 May 2024 14:45:49 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 15 May 2024 14:45:48 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 15 May 2024 14:45:48 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 15 May 2024 14:45:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZNnX7eq3O2ZiRBVvHubEiNndAecyQheUCeDz3W37wC0DqHV91wUjiDEdpTVITgHkg2yclTVMShmlPuS+8QqaUC822sE1gwnsEIowJMH7CjMwVSLnLugGVUhObrHcTDnERosbt1BN0lMktJzadgDut1ZeGHzR2Hrz3cQnRNlTeWbTDlmdRP/7/omAKFcY+vyN63ikARkAM6j4DorowYw89b3Acv1JAhqkzL36gSnPB58aEN9TAcGZ/iq1/0nDDVSjQT2T1DD19dZjMr4+3r2euY7X52iQoZzz1g3wD0Imxk7bLyPgPwfWGsYhdsywPRz1F4atAn32zbixdzmKTMBwJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Asbhk/JOcOnvAOZCAn3bO6nwl+qDpHwT4Fg+KXMBHAQ=;
 b=TkwtOmU3A50iQwtiX8D7YEpshB3P7Dg8MakL9sGMQfJWuhotymBf6f26QRWz5eODwzkO3m1aKOMQcenp6yXtEe6MK/GEfQQdrDAuEfrgPmUbIEx7u4Z9NVhyFP5hZkQOhN6TFTMW4t3Z/P4EgzOwBf2bIoj1NNbjHIwlWteieY/pDlovgsRnjcswRbpKzGIP0ETD76gbezyPMYaCCXP+mIxsjM78EnQG/D7UNmqIKNtjHmRKi3kPMth3C+Zrz199WnJwAnXDRf1HxUG9eaiPGAq2TaLt5NQtrD+mun7cP7GAJc7OfLHKkFvkUQs3O26Dq6wMMGi/PG625F3djkG9vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by MN2PR11MB4648.namprd11.prod.outlook.com (2603:10b6:208:26f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.27; Wed, 15 May
 2024 21:45:46 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::ca61:3301:7ce0:f694]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::ca61:3301:7ce0:f694%4]) with mapi id 15.20.7587.025; Wed, 15 May 2024
 21:45:46 +0000
Message-ID: <d89e9233-083d-4ab3-bb8d-9fad07922864@intel.com>
Date: Wed, 15 May 2024 17:45:43 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/6] drm/xe/guc: Extract GuC error capture lists
Content-Language: en-US
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20240507014736.1057093-1-zhanjun.dong@intel.com>
 <20240507014736.1057093-5-zhanjun.dong@intel.com>
 <66f6cab5388fb92fe090427406f1f2807bf10d25.camel@intel.com>
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <66f6cab5388fb92fe090427406f1f2807bf10d25.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0241.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::6) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|MN2PR11MB4648:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f19fb5b-b805-403c-52a5-08dc752860ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K1A1NnpQWGVIbmhlZE9SQ2xGanpkWERTR3NlVnNGUW5ZaXBUaFNPNWpQMFcv?=
 =?utf-8?B?Y1ZFbWdVOGlrNlF4MnFNUVNQc2hZV2RsblF3VUMybGlRN3hocmZQSlN0TDFi?=
 =?utf-8?B?ZnBQc2lUNWNuTXhCWVkvYUJzMENub3pLaEdoMk1LUmJxWXl0aHlXN3VobXlH?=
 =?utf-8?B?OXhxMXdKOWYrZE83ZlV6dkdRb1hJWjNGSzNzM0drSUcxR2hEMkQwQ2pYMEdE?=
 =?utf-8?B?YW51aFVVcDZqcklxaHRvaXJlZS9XZ1BBaFI0ZmM3a0pxWlc4M2liRC9Mc3di?=
 =?utf-8?B?WHgyTmQ0L0l3M1M5WmR2dWo1L3VybXIzQWdpWHFLeHFEdnZScnhzN0hTR0VV?=
 =?utf-8?B?Y21pci9ZRG1rYTlwRkpqK0o5NVV6QmV6OGsxTnJoNXVTM0VONHN3OWpFVzY1?=
 =?utf-8?B?WUw3ZHpBU0JwZjdXWldjYURTZmJVdVRmcGg1d3RFelIzOUN4VnNCY1ZvZmIy?=
 =?utf-8?B?UTZjRzJwR1phVWlnZnB4elMwQlZFaUZ3bWtvdCtZbTQyVEw5d09vOHR3Y1V3?=
 =?utf-8?B?MTRaM2NRQm1UUVhaZzc3L0YwdUZhRVYyYnNJREJ2SkRVcG5HOFU5dmVBTUZ0?=
 =?utf-8?B?OVN3Uml3dDIvY2pwNWZMemRnWDhTdUZnOEtXQmJKeXFSNjczRFpua0x4cEw4?=
 =?utf-8?B?NUdGeG9oTzVlNkU2eFJqUWl0RTFtZHhXSGs0cFNpT3JJdDEvT2NzTCtnK2N3?=
 =?utf-8?B?SE9QSUdESU5naHU5b1BMV0Z1UDJOenIrOFNHOUJadGlqaFVZOWNGNld3RVBV?=
 =?utf-8?B?a2RON1d6SWYvV0p5RHNPekFtcDZQREZtem05U2lHRkhLZGN6UTFYdG5YTHEy?=
 =?utf-8?B?SldnNkcxc2l0YzFmZ3BEMzhGMENNYW0yL2FCTzlSVmYrSkFuZXhJM2F3SVdr?=
 =?utf-8?B?VE5GOTZkMmlCaERRSEZlY3BhZGlEU21MT2hoSjVmd0Q5TXk0c1UvT2x2Sjdv?=
 =?utf-8?B?czRGbHR6MWMwN05rUXNNQzNwY2ZrMjBwNkcvSlROYk9GTmFVRE5Ya1E4cE55?=
 =?utf-8?B?N1FVSlQyc1pUUUV6M3djaHAzZFRZQU5ZZHRsOHc3dXBrMElheGVzZS9FL1FL?=
 =?utf-8?B?Qk5rWnBZZ2lpamo3WS9YbDM3SEhEZmVNZWQ4bzlIZEdRSHlhMmNpaUVuMDhX?=
 =?utf-8?B?TWtycDBPUjg1UWcya0VPQVpaTDlVeGZhN0pjbGg3OFljOFZyM2J5SytRUkJy?=
 =?utf-8?B?YUVHTmFEWDhia0Q0R3Rkc2FHTkovVTRFWkZFMHFZaXpyeXlsTXZrMmNwdS9j?=
 =?utf-8?B?K2JWVS9HVXZDUmxnUlFTMURMODdab0lsSkplb2NIa2swR2U4aG16ek9CbmNT?=
 =?utf-8?B?RW5nd2kyUDFQa2FCcVIrNWNib3QvVjlLQTRPWFNxdmYwS3RJcnZlNFpuTXh6?=
 =?utf-8?B?YjMxTk1CM0liMktCS2RVRFBaZ0JrUzdDTWk5MGo2UGlPKzduWkF1MmN6cXZJ?=
 =?utf-8?B?ZmJNYjNwK2RxSklZYldQSnVZUDg2OUVsaUZwSm02c1RFeGwvUWI5WFZkOHor?=
 =?utf-8?B?K3hEY0xZMWVqeWg5OHBxRnVKS2xFZURBMmhERGI0YzcwRjYxeFNSM3R2SURK?=
 =?utf-8?B?cEVXZm1aRUNIK2hQZ0JoQjZqREEzcHRaRC9UdTVkQUZpNzF0c0pLU2sxN1ZG?=
 =?utf-8?B?dXIrQThoU1RSMDlDL2gveHhNaDBXd1E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjFiR0lUQ0tjbE9YYk9CUFkrUE1tY0xJR1dFdVlQQWp6c1ljRWtBU3RyY1hZ?=
 =?utf-8?B?bjMyMWhUVTlBYndzSXZsa0dJY0ZuZGVONmVpSng3bVR6VU82cGNwcWFKL0ZC?=
 =?utf-8?B?TElvR1JSa0VNZ2FpYXVTK3NZS1NaS0lzSFpNU1U0SWRreEg5UGhWb0JwRW1s?=
 =?utf-8?B?OGtCTVRrVU5DVU10M0xiNTVYdHZpblcwQUhNT0hSSWNSdHQ2QmRSUFBjWlZP?=
 =?utf-8?B?QkpZUUlNdVVFTUhrSGhtaFZvSllGK1pRa0ZadWpIdG1JNDZ0YVJIS1Z3blRM?=
 =?utf-8?B?R1JIZExSSVdwdTcyVlZ5YUkzOGFQaEh2dEIzUXVQeVdmbkozOUtwcUlmTDgw?=
 =?utf-8?B?NGJRUFlMYWs3cHE4ODlsb1UralE3RDJEajRSWms4K25tWG5pNEV2TWVyaWFR?=
 =?utf-8?B?Zklvd21SbFJjYkVSQmROLzh0aUoxbm03V09yMFVKUEFBS3Nrbk1Uc05JVnpD?=
 =?utf-8?B?VWVFUThFOXd4bXdEaEFRUzdKYkhqb1NaRzhwNkovNmlxajA5M25sbHJnODVF?=
 =?utf-8?B?eEU5QUYzL25qR1hwWlpKa3ZmSEJzODdnQ3FZRTRwZW5VRXhCSGJKbURFNmc3?=
 =?utf-8?B?YXRtam1adkE3ZFZOK1l6bXNHZm9WRHJRaGY5Nm56UkRhL1YwM2I3S25PUVlh?=
 =?utf-8?B?OUl6U1BSdXVFWU9xYjRKZkkrN283SHpmYWg1ZnM5djV3Nk1lNHhhdDg5eGRO?=
 =?utf-8?B?ZDFvUUVEVTdyRHRUeHlrTjZIQ3pUQmo2R1ZuS2R2dnV4U2Nwd2t0YjVrd2N4?=
 =?utf-8?B?ZWdLak5xY2h3UEZ5TFB4cXlJdW5YVHlHdHNlUUJ6UjRmSnpUdXoxTGhuVTE1?=
 =?utf-8?B?YzVIMytocmlRMUdIZlhMVmJtY0VWbnNURjNHNElYWGFjcUoxeEViU205eWdO?=
 =?utf-8?B?QlZ1QUpOMVVnK09qbmxIQi8rTGVzVktNMkpyOWRodHhJS1pBalFWbDVEUDdT?=
 =?utf-8?B?cEp6YUJWZTFpWnd4eG9ybVY4dGNLaktwWlhYZStYZWxzbFYvT1NBZ2lCZVdP?=
 =?utf-8?B?V1I3WXV5TW5KWkdJVEZSd1N0aUJPQUZoR2x4TzNKMGlkZlY3ci9FZ0JGZ1BP?=
 =?utf-8?B?N0V5NXcxK3pMbUl3akVWRVJYWW9kbFlVM3QwVzRMYTBLV09PYUY2T1BMRlFK?=
 =?utf-8?B?YVhJZjRaV1IvNEFjbHM3WFBIbFZDN0xsQUY0djVWMWZleFRwWVRSUFA4YjhT?=
 =?utf-8?B?WXNDK3R3UkRoU2tNUFZTREs4aE1VaDU2a3c2NG9tVjJ1djVQZDg4WHNITGJN?=
 =?utf-8?B?ZTF4MGdFb3h2UzFGbDI4T0VTbCtSMGZUL1RnVmtSNnlJSFgvTFBjbGVhT2F1?=
 =?utf-8?B?dnVlaWtxSHJ1SHJ2aG12RmMvZElkaURKcWlmTDlMR0lxalFQd0lsL0UrdG9N?=
 =?utf-8?B?cCs0ZnBiOUNDejJOVC9adnY5Vzc4Tmd4TU0wWjhvSCtLeGh6NnBLQXppLy9u?=
 =?utf-8?B?M2hwTGZpc2thZkVQZmkvRStzQUhqbmxPVmFEYlR6eUIxcjJlRDBvRkxNRVd5?=
 =?utf-8?B?eDlrbm4wSVpiOUhzcVR3OVFyclJlYVRaNkFiVzh0cUxEczc1RXJzWGZjTVlw?=
 =?utf-8?B?azBLYVV6UGpSaElydTZDL0gyL0d4UXM4S3lhUVJiVjdjQ0FMWGx5THJmNHA4?=
 =?utf-8?B?T3JYRzlqYW5UYk1wMUYwM0daTmEvSUUvaSswRFc1TmFuNnVHcjVZNVVYU0lx?=
 =?utf-8?B?cnVua1lDWlJ3MFJ0dldBdC9EZ25iV1lDeVJ0YWFSWWlqM05UV0xka1oweEp4?=
 =?utf-8?B?VndFTWQwS3dYSEMwS1hCcEQzb2pWMEtsZkR4RllkQVJsNmtFcjUwS29ld2M2?=
 =?utf-8?B?QSt1eVovbHhvRXBUOWNCQ3Zsc2dhZ1F2bHVGQ0pFRnFkaC94NDBnZXJWN0ti?=
 =?utf-8?B?eXE2Z0Nnd0xnMFhIYktodnYrdzMxdVA0VE0yZ3pCRDFEZ2lRRTcyNzUzSzlI?=
 =?utf-8?B?QlpJRktiNHZHaTF6SmNBRnBnK3pGS2ZRQWY0eFdETHVJN0ZuU285R21MZ3p2?=
 =?utf-8?B?VmdjdW9kVzhHOFhEWDNqd3dqRWQwRnhENmtIMjV5YldnakFmOEQ2QzhXc0dt?=
 =?utf-8?B?eVBFUkRUS2I4dUtzL2NwM1lYYllzVG1HYm9VcnAxM0F0Q010NTBqNjRjSzlE?=
 =?utf-8?Q?zA7pF3/BCR10+++rSVgI6C7L6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f19fb5b-b805-403c-52a5-08dc752860ef
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2024 21:45:46.6450 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uGTrtCYj2pUHmc2MVCfzuttXaixqDhWXLwCCwHcrrYxiHtICp0tE8MvjjLsLbE7g0Aqb0M5RDayh2myE6u7OXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4648
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

See my comments below.

Regards,
Zhanjun Dong

On 2024-05-10 9:43 p.m., Teres Alexis, Alan Previn wrote:
> On Mon, 2024-05-06 at 18:47 -0700, Zhanjun Dong wrote:
>> Upon the G2H Notify-Err-Capture event, parse through the
>> GuC Log Buffer (error-capture-subregion) and generate one or
>> more capture-nodes. A single node represents a single "engine-
>> instance-capture-dump" and contains at least 3 register lists:
>> global, engine-class and engine-instance. An internal link
>> list is maintained to store one or more nodes.
>>
>> Because the link-list node generation happen before the call
>> to devcoredump, duplicate global and engine-class register
>> lists for each engine-instance register dump if we find
>> dependent-engine resets in a engine-capture-group.
>>
> alan:snip
>> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
>> index d2df027081b5..71d7c4a58925 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
>> @@ -520,6 +520,560 @@ static void check_guc_capture_size(struct xe_guc *guc)
>>                            buffer_size, spare_size, capture_size);
>>   }
>>
> alan:snip
>> +static struct __guc_capture_parsed_output *
>> +guc_capture_get_prealloc_node(struct xe_guc *guc)
>> +{
>> +       struct __guc_capture_parsed_output *found = NULL;
>> +
>> +       if (!list_empty(&guc->capture->cachelist)) {
>> +               struct __guc_capture_parsed_output *n, *ntmp;
>> +
>> +               /* get first avail node from the cache list */
>> +               list_for_each_entry_safe(n, ntmp, &guc->capture->cachelist, link) {
>> +                       found = n;
>> +                       list_del(&n->link);
>> +                       break;
>> +               }
>> +       } else {
>> +               struct __guc_capture_parsed_output *n, *ntmp;
>> +
>> +               /* traverse down and steal back the oldest node already allocated */
>> +               list_for_each_entry_safe(n, ntmp, &guc->capture->outlist, link) {
>> +                       found = n;
>> +               }
>> +               if (found)
>> +                       list_del(&found->link);
>> +       }
>> +       if (found)
>> +               guc_capture_init_node(guc, found);
>> +
>> +       return found;
>> +}
> alan: I mentioned this in rev6, you cannot start pre-allocated nodelist anywhere
> in this patch when you are only allocating it in patch 6. Look back at my rev 6
> comments on this. Also, take a look at the original i915 patch on how to implement
> guc_capture_alloc/delete_one_node without preallocated nodelist:
> https://patchwork.freedesktop.org/patch/479022/?series=101604&rev=1
> (note: watch especially for the use of new->reginfo[i].regs which needed
> additional allocation step. Alternatively we could squash patch 4 and patch 6
> together and change patch 4's comment but not sure it might be too large a
> patch (can discuss offline).

Good point, let me try with pre-alloc vs GFP_AOTMIC and will get back to 
you.

> 
>> +static int
>> +guc_capture_extract_reglists(struct xe_guc *guc, struct __guc_capture_bufstate *buf)
>> +{
>> +       struct xe_gt *gt = guc_to_gt(guc);
>> +       struct guc_state_capture_group_header_t ghdr = {0};
>> +       struct guc_state_capture_header_t hdr = {0};
>> +       struct __guc_capture_parsed_output *node = NULL;
>> +       struct guc_mmio_reg *regs = NULL;
>> +       int i, numlists, numregs, ret = 0;
>> +       enum guc_capture_type datatype;
>> +       struct guc_mmio_reg tmp;
>> +       bool is_partial = false;
> alan:snip
>> +               if (!node) {
>> +                       node = guc_capture_get_prealloc_node(guc);
> alan: see above comment on the use of prealloc_node (as per rev 6's comments)
> alan:snip
> 
>> +static void __guc_capture_process_output(struct xe_guc *guc)
>> +{
>> +       unsigned int buffer_size, read_offset, write_offset, full_count;
>> +       struct xe_uc *uc = container_of(guc, typeof(*uc), guc);
>> +       struct guc_log_buffer_state log_buf_state_local;
>> +       struct guc_log_buffer_state *log_buf_state;
>> +       struct __guc_capture_bufstate buf;
>> +       bool new_overflow;
>> +       int ret;
>> +       u32 log_buf_state_offset;
>> +       u32 src_data_offset;
>> +
>> +       log_buf_state = (struct guc_log_buffer_state *)((ulong)guc->log.bo->vmap.vaddr +
>> +                       (sizeof(struct guc_log_buffer_state) * GUC_CAPTURE_LOG_BUFFER));
> alan: once again, i dont think we can use vmap.vaddr directly this this anymore right?
> i dont think we use "log_buf_state" until the end of this function to set the new read_ptr
> and flush flag. We ought to use xe_map_wr below?
Yes, need xe_map_xxx helper, as we are doing read, so should be xe_map_rd
>> +
>> +       log_buf_state_offset = sizeof(struct guc_log_buffer_state) * GUC_CAPTURE_LOG_BUFFER;
>> +       src_data_offset = xe_guc_get_log_buffer_offset(&guc->log, GUC_CAPTURE_LOG_BUFFER);
>> +
>> +       /*
>> +        * Make a copy of the state structure, inside GuC log buffer
>> +        * (which is uncached mapped), on the stack to avoid reading
>> +        * from it multiple times.
>> +        */
>> +       xe_map_memcpy_from(guc_to_xe(guc), &log_buf_state_local, &guc->log.bo->vmap,
>> +                          log_buf_state_offset, sizeof(struct guc_log_buffer_state));
> alan:snip
> 

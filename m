Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6F36C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 29 Apr 2024 13:52:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A46610E18E;
	Mon, 29 Apr 2024 13:52:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MfSraZl5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9325710E188
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Apr 2024 13:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714398767; x=1745934767;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=67u9BQUYrin+ejpfLyk3C3z1WzrwIoZQlRITrIfQTW4=;
 b=MfSraZl5OSTUXMhtqW4hJ7lEURvHuH4/+6rIcYseJxizSFDYRdESB9Cp
 chINCkZfYzilfpCXp1UqAuhOUDwowhZZ0ESESs3Cg0wuaA/MYRSusbpgT
 k6DQcWL+yWwY4OAs4U/vsTAO2yDhQjNOzjCb2bxidZIc7wTqrwoNpvUT3
 QzYlZ7oQQFNrBUXYWmkDyt9gI0f31N/gUyytjqPWuEGloYBeC1WYoi6VB
 hDS2x+iWHpacocg1sl9r+Wdea5ZjxJPxU2SPZBc0ibLIBUU1WYIdRPzE7
 oXaS7pLf/vlUlIdIhTJS5fliZfkN+RbbMKzSTAwtT8NpnghnFAONIDYz9 A==;
X-CSE-ConnectionGUID: FhOXesHBTbqg72XqdLSO0g==
X-CSE-MsgGUID: 9w3HM4vbRKCCveW3okTNFg==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="20610057"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="20610057"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 06:52:47 -0700
X-CSE-ConnectionGUID: 3dkvBmpuQZCBGmA+ncAndQ==
X-CSE-MsgGUID: TcvUPrVITDaqN7lMIVlwoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="26620685"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Apr 2024 06:52:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Apr 2024 06:52:46 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Apr 2024 06:52:46 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Apr 2024 06:52:46 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Apr 2024 06:52:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LdtB0dJfzru/dpQFQhvvEahbSfbFskaCBVv4CMtsoU6aHgYtXb7cNcpD1HGZNdKLFQBKCTYfxUKhjdXiLPsZOsuS2JCyLEBwOiMaShJC2kW4xbmZhXzJw8o3pw2WIoOQjFFCuxaMMEP4h/9ns0b+xwasRE/C/Ja4pNgaC+M7u87U6+l4FwY5HCefkoJpeDpG6v/AvhLNqRxCYFHxu+GMWd71eldQGpxhpyU09mCm83n59eVtI+2InHgoupICaLI05kiATFmPIeXlFqr02PucNjhfETP47hBXi5py+hHtyYsNKRWq7btfYqZIV8zS+pq3rm4oelgrzbr9J+shlZJdLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7L82tsfOLDaAFM/np81N+lJ72RD7HqMV0NY3Lg5vUF8=;
 b=liPWwQ3iVyEdp496VDP4h/8V8xw+dBaWhblRt4afL2mtBmBWWlrmJWDgj+lFQfQuL7w25Cq93/5AKyQIuaRz40JxFFQDHbPd3yr+uuPsEvKK4LPksnvqD3BaCpY+l3ErR1VU6fCYOfkgM91HNSJgvFpW5U1S0qqtKCZVFcDlbWGLFhHQASVIUvm50Qx8Q8TU67FFxuQnJJ8iMBVN6ci2QmOZKP835pjeaUI9zANDXO6dyOW2Ov5dha/fPAPljzrE+KFO8w9ubz1028nKkLEeTmxEF1okjyiXQgr6OqjYyWbzvpu6ZeeS0LikWbKHTnNm5zH/BYf0chKyeDqR2eNouA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB7988.namprd11.prod.outlook.com (2603:10b6:510:243::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Mon, 29 Apr
 2024 13:52:43 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711%6]) with mapi id 15.20.7519.031; Mon, 29 Apr 2024
 13:52:43 +0000
Date: Mon, 29 Apr 2024 08:52:40 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/8] drm/xe: covert sysfs over to devm
Message-ID: <wtqag5pd5plbiubuhypzdr7jitxutcfbft2xtchwx3fbf4zzfm@pmokwtkmlnf4>
References: <20240429121436.33013-9-matthew.auld@intel.com>
 <20240429121436.33013-10-matthew.auld@intel.com>
 <Zi-gYDEFzI_bXCzP@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Zi-gYDEFzI_bXCzP@intel.com>
X-ClientProxiedBy: BYAPR08CA0004.namprd08.prod.outlook.com
 (2603:10b6:a03:100::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB7988:EE_
X-MS-Office365-Filtering-Correlation-Id: 319aec16-8075-4821-49a0-08dc6853a4ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/vEqRr4ENwBRHeKhN9fupfdOV51BAoa0WLOgbgQPah9KN6vrDHs/jRgJXkgN?=
 =?us-ascii?Q?Dxpi2zoahAII+IJ79Hy7xgikJ8UjNhI4fUiZMtXtqk9lZtuRkr/nIuk5yMhp?=
 =?us-ascii?Q?FrIYh5oZVo4hgZC/0yzfxOOqFjMuqgS9O1j0KIWFbinxnuRtD0DuQiSAxf6y?=
 =?us-ascii?Q?VkJbZRmwnTq0X+vHyDsIOHmigFtO6JjRmL6i+SjLstaUn61sJURok1NtWaUF?=
 =?us-ascii?Q?yLK2SCRtkcHuKpyQDWYREA869rCdT11v31bpCCf6PNL0OSA0iwa11pztM3/R?=
 =?us-ascii?Q?rhhfVRSpYrZmLzh/C0Df6KHWKNgO0CjFWZRhBXuuWI3XfGg1pXT0O7zVbDYD?=
 =?us-ascii?Q?vP8VshqnOO30pijq1TisFJvijzBjS3dFyRycmhzn2DnRHqZRLYKe+SICwjQ8?=
 =?us-ascii?Q?6Tu3WbkQ3u9qC+qcRNpScOIoKGMYRneW21IeFtmZBZqBVzHWWRr8fWsEqIFi?=
 =?us-ascii?Q?kvIbWQMsNO0nA6gJoWbDtT6/xk5Lc6156NksCqSA9U6yJXM7yyKYn48ymHGX?=
 =?us-ascii?Q?KL8kjvPmw9ViBLUn24QUF+mq1Ve2UUthAOV0XZL+nks/K1Q7yTkILpSXIOea?=
 =?us-ascii?Q?LRGrcJQRwJWrOkDL4rgbitGg1LpHfogYDWzlVLXGyePY98zM1Cow/xu4SnkR?=
 =?us-ascii?Q?w+ETuaGlRdtw+Dcw3rDn0vx5ByBqkypCvspN/GHN47eaixu/ZjkUAZCI1ZhD?=
 =?us-ascii?Q?LgybD3yO1bjdTZnuT1S9JgB96aNLsu3erNyivSZO2AnNF1K6s7X1PXd5UBgj?=
 =?us-ascii?Q?T9JkSmwcpv/h4uyfrQBNCerCQu4LWe0A4tYSBBVYS9TKNMHjlooU66mFAK+w?=
 =?us-ascii?Q?xrzNb2FsDmoKNkxWUq7Ka6Kc8KnEnJoOvQbEKTCUQsOD5t09yxNYrxwev7p2?=
 =?us-ascii?Q?Q62M6yyjAx7rjNEygTOYTVSzuSwUqfx6GZQ4PiSMRL5WKCUSdXpx0QIWtSw8?=
 =?us-ascii?Q?90RD3l2lHVrjUtX635B9occ6WP4bW6c0/4jr7w1CW07p46NsiYOeD4WfG2gd?=
 =?us-ascii?Q?txrbHqcUzuB+/bnV7wJ2UyzA3m2zg2CUWJts0qOHGKPmfED7W5Ek9qPMXJJe?=
 =?us-ascii?Q?ntxEwgjG+k08Qxs+5pLEpa2TFR1rYQzL3/RdzMyGWzxUj1e06SuvzOlTJ0HA?=
 =?us-ascii?Q?OJk8FdOsP7oPkmLgXIlifv1uFrT+/dXIIICF/7Fizb4I8fbikp82aUDAkXbI?=
 =?us-ascii?Q?Erd/QRBy37oxd3tmoGA1XHFOjBBKJY4Y4KLY0N5puGMIg790wOXXt6Du/m52?=
 =?us-ascii?Q?5RqsLUrSHTqFWUFTbhfLkngn+yFhir//hj4nd5vl+Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PPnGYztZDMAZOYtUTleFzToePDu9/66UlzgbeVPkablbE0o3l1U8UMiyb/Wq?=
 =?us-ascii?Q?SRihMx3PhRtOliGlKI9lK/FmLUzJw0ge6EQBDfkHxSaNyk00lGybnS3s40Ha?=
 =?us-ascii?Q?mW2Ug/hYH69t6yuCIPSw9Jj5XKxKfp/bKIBkX/C/Zu8e3Z0m5J8dlqAzj4J2?=
 =?us-ascii?Q?s/5VoAe8NDzJXzY20Agzk/elaUBRLR6eyNDa6pEFnTtWEKia1sPxWSs2cSfi?=
 =?us-ascii?Q?AI6/tqwDSyPv4iisFfaArEwX8/VfiQJBH4SW3ZIr/AN3VrX/50iWS/UMzF3Y?=
 =?us-ascii?Q?YFPfV06EJgx/eGD89hNwQkb/KtRboZJxvW5E3eRsNHUJf0dZa79XCV50j/mm?=
 =?us-ascii?Q?k36l3VErE0IdX4VaVG30TisxLlIo03Z1dBwqwnVglQUugY6mjnchRPXWDzWt?=
 =?us-ascii?Q?Y+tbuDqg3tLqEVF4EGWp7mllerwd0rdkWtHUzGeD0qW5gpiwhGXB5vx9DKea?=
 =?us-ascii?Q?Ea8+THeZyIbZO1spueiK3aFSuWCpT1KnghYboGwcaIybKJcsTxY5IW72wA9b?=
 =?us-ascii?Q?s6G5vJRTfqmwJiwAzEt+jeUZcW4JQyz8que1xatMTmdormuprINXb9ocl5FM?=
 =?us-ascii?Q?3WvyZnvw+57iHd6xJMjShsgBCV1JA3mFScuMks0NbMEQJu9kFbbsIRYlklac?=
 =?us-ascii?Q?to2miUom1Ay7frMHWZCCTG1JlZvPjTACKgz6487dvZ+FOf8/hoJT8+UkdOSx?=
 =?us-ascii?Q?47VQgzGGyZBk6jL4hmqKLkH3M2OjUGtrKysBly5PhA0SE/ac6W65qvJmci+t?=
 =?us-ascii?Q?21fn5IoUUVP1DX48Z4b/Ol1Q/v5LQ5IFZC8H83HG29g0a7BrJLvFIO8tGGW0?=
 =?us-ascii?Q?UtglSFeDaLhwuNIUsfoJD3yxNAfSMTDHcyjBDQcAcY7IhO9kBOcGppuND7fC?=
 =?us-ascii?Q?AdQgLvXJhNLPgvfJf84F382FIwPhR21lyQonDF1g/wbdIIyjg1obM7/iB118?=
 =?us-ascii?Q?Yoq41zuQ61gQdWJh9gG8/RTo0suerpmVQCei4Saer1+OxZQUWZQ0/oRezrql?=
 =?us-ascii?Q?m1zsI1EvxIw7CEaDKPe7+ojYKRajivOxiheAA9mPCIoUvIEBOm++mVMxsUtI?=
 =?us-ascii?Q?LUZNNIIihpP8PfmFoB1/r/fSj/hTx0uk1ySr8eaPD8rBHpfcB1C8lANipj2P?=
 =?us-ascii?Q?xNV+TFUrIWOBpiPPFfIFxfWXVHI/knDa4ywW0/tt5YWtXJ8ZAjRjPi3PPAlW?=
 =?us-ascii?Q?lSSsnUMyOQDO2PLXp3lPIJPGlgcwL9S1F8/bSShmJEYWrb5XvVGs6Plln6/o?=
 =?us-ascii?Q?p9/fs5JAv3lwKR0MdJW7gQ1vGBLR9bvurxqA+VxDj3N8kDH57+pEhNFrZ5hP?=
 =?us-ascii?Q?ZdB8E4tQwYiHs59i/gyVu4KFcIUJp6PDNk/uM4gDFEUBR8Y+2zrFRvYJi32V?=
 =?us-ascii?Q?zeCXRdR+aoDcSgoR47ziCfxpbzro2IY9WKgZaZhi50ZRPPfZDcRiMdxi/Yar?=
 =?us-ascii?Q?zAtfS+pLYBb/ZZLiwzdQtjw6fJAUAKHIVkYrXlG+rv8FSic80NFnB3hSqv0+?=
 =?us-ascii?Q?YscpGYv6RoJ9qEiH8H/A2GVK54ONkx+f5JWVSKPGf4CdKlyAACYn1/9Nc5Em?=
 =?us-ascii?Q?Nfpyd7qIw83oeEUNw6zJ4ZnuQP3DNpcNb0gNve+OOWNC0hn4Va0rEaUFd+Ph?=
 =?us-ascii?Q?jw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 319aec16-8075-4821-49a0-08dc6853a4ce
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2024 13:52:43.7447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I+UHCYEVIP+nAzk/K1Gvd+nn61Fl37rPRQ2ZES2HbQ5FFV53KkJAUyEkG9dS3KPJT+CA86nhmuMgDM7+Nmiow+BMyhLczTBGwGmIrdlqjn4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7988
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

On Mon, Apr 29, 2024 at 09:28:00AM GMT, Rodrigo Vivi wrote:
>On Mon, Apr 29, 2024 at 01:14:38PM +0100, Matthew Auld wrote:
>> Hotunplugging the device seems to result in stuff like:
>>
>> kobject_add_internal failed for tile0 with -EEXIST, don't try to
>> register things with the same name in the same directory.
>>
>> We only remove the sysfs as part of drmm, however that is tied to the
>> lifetime of the driver instance and not the device underneath. Attempt
>> to fix by using devm for all of the remaining sysfs stuff related to the
>> device.
>
>hmmm... so basically we should use the drmm only for the global module
>stuff and the devm for things that are per device?

that doesn't make much sense. drmm is supposed to run when the driver
unbinds from the device... basically when all refcounts are gone with
drm_dev_put().  Are we keeping a ref we shouldn't?

Lucas De Marchi

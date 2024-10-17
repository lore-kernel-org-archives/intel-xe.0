Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ACFCD206BC
	for <intel-xe@archiver.kernel.org>; Thu, 17 Oct 2024 08:36:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48ECA10E1CF;
	Thu, 17 Oct 2024 08:36:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QXPkLSBj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEBD010E1CF
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Oct 2024 08:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729154176; x=1760690176;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1mB+OMGf+zDtoPTNmSX/omAIk9rePtTQwqVMjDareqw=;
 b=QXPkLSBjnrksrbVHFaZ9uOO0rW1UsRE0wnT7PhQT2XUX0E1avwnTSt+S
 gvpx0xCvm7DcSVjYX7IDODk0xVTLRKJR9Ma/kPcYN3nsXnxMx40g7nqGb
 xQA1Xmz+f9B6bCE3Mrb7vVz24sHS6h+FNBnc4khfIMxaHha50zeD/pusQ
 P9REuwbJ07AtL3HFHcyFkcRkypSkaDJeGSGFyKrEXm9SiuwDvCSopvP7i
 UQWmhSR6gthv+N5DY/FU/faXUf9FaciWKMo9/b4NcHRwIzGF869Gb7kMI
 HLoP2vpq/gXluwB+k7XvXt7rI5YzycA3nzFmVOUA8Mz5oYiRtEgFoc07y A==;
X-CSE-ConnectionGUID: qHfntZHaTDCGm29V7jPNEg==
X-CSE-MsgGUID: eGdS6yxMSXikPqL0KZAS8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39179228"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="39179228"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 01:36:15 -0700
X-CSE-ConnectionGUID: Tc2xP4zbQCK3e7Y8AVD+bg==
X-CSE-MsgGUID: +jLliYjuSqCJ+SRb25J8Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; d="scan'208";a="78503229"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Oct 2024 01:36:14 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 01:36:14 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 17 Oct 2024 01:36:14 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 17 Oct 2024 01:36:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tAS1LCsHX6zU079AzZNvfVP204mFrPpABo4a8XqXsL+lLgXbigLikUW7YVCivOhQKaE0wV6LQC5IIlUdJC6HJSK9icYYMETOTkHBhOnyB3zGH4OxlTkaL1y6KdL8wEvC0JP0T/7iBLTsOy0tuCFZ6H5x+5qwjhKyA43Jsdjckx2xpOnSOVEBWjOaFXaZB7hu9IsoyZ7SB7ACFCyAGea6z+7BHUzvVdfLAcDTRlNu0IRwHEGrcKjrNDtgbz89WL4KSFjqvwmVGd1ySgFLdkEtBWu+SeyVRGZB4SrkDXhPaYT4vbmJaBG/eJIY/X3V/rnVItcKaw0sYHJH3g0cvdvfRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e55Cp71hoGZvow5lPKBUeqgMBYQHcJ45u2EjmWGMkUQ=;
 b=kI8ThzIgfWMPN8XQZyYdqWXtJ32XRaWA2BgpeWrR3nrNIF6zq+Wk072mMZNiEoUL5KruhodV6ew6YzxP2BurMxCkuJPZOn7lMYtEd1CgwCXyoSageC74GeECEOwF55nmhWZySpGZDP1gpEwgaMDYCbUTGftbus3j7FCydayLzOcbMOIN5FbLM3ii7bGGjDHpke43Peca2lpvwqnAGLIaWGA/n2rNcaxxdkp9qu84zmotMb70+Zh/d6atkdUC/XKEjgrfyr/YCQAZl/Eky1MrQJEVhiEtNx5K/7IdVsTFmI0c9iXmOLEndyiam7wHCQFZQczxluyK1B4QJt4HasM1Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SJ0PR11MB4975.namprd11.prod.outlook.com (2603:10b6:a03:2d0::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.21; Thu, 17 Oct
 2024 08:36:10 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%7]) with mapi id 15.20.8069.019; Thu, 17 Oct 2024
 08:36:09 +0000
Message-ID: <b2951f83-feff-4078-8d58-4159c2762959@intel.com>
Date: Thu, 17 Oct 2024 14:06:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe/guc/ct: Flush g2h worker in case of g2h
 response timeout
To: John Harrison <john.c.harrison@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>, <himal.prasad.ghimiray@intel.com>
References: <20241016115256.349791-1-badal.nilawar@intel.com>
 <20241016115256.349791-3-badal.nilawar@intel.com>
 <a6870973-20ab-4eff-a0d2-34dec13e52e0@intel.com>
 <8cc4c4cd-c3d4-4b40-9fce-1284e9b4df96@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <8cc4c4cd-c3d4-4b40-9fce-1284e9b4df96@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXP287CA0024.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::32) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SJ0PR11MB4975:EE_
X-MS-Office365-Filtering-Correlation-Id: 86420006-3936-40f9-d508-08dcee86c021
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eUc1aXFCZmpXSEw3cS9wZU55RzJCRU5BS09peHlYUWd3TStxYloyS1lIV0Rv?=
 =?utf-8?B?elo2bUJwbHN1MHg2L096TXNLVVE0T2NWWWJFNEhpMXA0b1Y5U0ZucS94V01p?=
 =?utf-8?B?KzlPY2w4dGJJbXkwdFg0djFNeERib0pUeVd1MGpVdkZPTEtKdUlJWEx3OE4y?=
 =?utf-8?B?OU0vYXkvMzdwdERIWXM2dnBVZ0p1L1VHajRIbWsxT1hPSGNPblhoV0VRcjNn?=
 =?utf-8?B?TUEveTVEajc0QWF0bmtsWGJlY3N2bVZFam1SVlNoV1FSQ3hHVzI2TGpXSkZT?=
 =?utf-8?B?S01LVVo3cHFyem13dHZ3aFE0dVh6VW9XQXJBd3RreElyN1plRVdYR0tqbjFQ?=
 =?utf-8?B?ZUE4NENENlQ5NW4wTkNySW5rRU53VytLenQ1bm0zUkEwdHpKV0UyS3RLbVYy?=
 =?utf-8?B?aUdFSTk0cDFjUWN6Ym5aTHpuMnBLbXAvT0lTUThuODBIa1FlWEhocjhOVDYx?=
 =?utf-8?B?SGx1WE9FUk9jTDdRb1FKckR2ekViT3o1Z056S21EMTFicCtmU0NSKzdOOWNX?=
 =?utf-8?B?Y2dycCtua1pzMERVT3dJbDUrLzlteFkyWDZQK2ptbVFCSmRzRmowR0xzb2NP?=
 =?utf-8?B?QXRCZE85UXFHS2V1S1p6S0ZaYXpxd1Zxd3hRR1ZIU0xmUHh3RFk1WWJqL1Zv?=
 =?utf-8?B?UFI4MjFBV0oxay9kbk1xTzRFMURrMFNocTB1Mkhjb1VoNFoyMmhvQ3AxakZJ?=
 =?utf-8?B?bGNUWWNiaXNvQjJyZHd6QWtzclBmdmh5RFcxaXUza3JRd1RBYXNROVVHMmpR?=
 =?utf-8?B?YXgxeWJKeU5oY09wbkZuVGxiYytQZzlDSWNua3JLditRcndUbUtRQjVjMlRx?=
 =?utf-8?B?MmE1TXpreEYxb3laaWtab0xjOXlnQ2o4bXNNQ0R1S3FOV0Z6ZW5pd0FPZVp0?=
 =?utf-8?B?cEo1RldzZmE4enhneTJVbnFmeG15LzBRM3FZcEtmb0dBUjR3TlpiWlRLQWdS?=
 =?utf-8?B?LzVFVkR0WEp6ckdRYk1udm01dzdZQzk1N202MVRYVDdWanI5OG85MituenFl?=
 =?utf-8?B?WUJvZzVNaUVVbUlEME1wblE1RHNJTE8wcm5FYmVVV1NWV09aODduVEpmOGlC?=
 =?utf-8?B?UDRNbUxiUnNpZ0o0TnUrVm1kdkgxSVdFTUIxdU8xOGVaUVRDSjdvQmZyNUpo?=
 =?utf-8?B?TTJmWGZrcDNWeG4xWkRjTHlFZWxzUnVFbFo4Ym5xelVsL3U2dUJpMUdsWFNa?=
 =?utf-8?B?M0FiemluNm5QejFXRlRSTXFGcG5yUnFCZi9ueVZtNkdDRFpseTlPZGxnYjBD?=
 =?utf-8?B?YThReWhNYWVkTDZ1TlM0NnM1REZsWDNUdlBwblYvZGpMR2VhK2FvRFF0QlBI?=
 =?utf-8?B?dWxiR2ljd1ozWDhmSHNVOFROaEFKMm9kdE15T3pWdnQrais1eGZhOElyV3Zm?=
 =?utf-8?B?K0tOeXBUZWNaaVdhT1FjQnlOTWZDSmNoSHByMm9pcXNuMVozaFdsTENBVmNv?=
 =?utf-8?B?UzVOSkVacHZhQUVMSllXMnNQbzR3WWk0eXkwcGVuaVRFM1dkUEhyaGwvSzdp?=
 =?utf-8?B?UUNsTGY3cDIrWjFmZEdJcStxS1dwaWs4SnpyQWRDSTFzUWRpWmRJeWpaZXFx?=
 =?utf-8?B?NFF3eXAvY2JwUFhoMGo3RXlJS293Z0h1ODNBVWlUdElXelJ2WTY5S21QV3FI?=
 =?utf-8?B?M25vWDN6MTlxdEs1UzdLYWdGbFhFK0RNRVREQVZEUEx3TEJOK3ZueStpWWFl?=
 =?utf-8?B?WXEvTEN2NUV3UnhlaDhkR253UkdYdEQyZjhxSnFHOWR2cFdOTlg3LzhRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akNMTVNQVXlwVkNwamhXQjdZemw5MUk5cW54RUw4a05iaURtcjBwcm9tcHhF?=
 =?utf-8?B?eEJZOXRyb3RpaXVQYUc3SFhxZkJ0N1E0R25UcEc1UXJJQWI0ODB3Z053RlRZ?=
 =?utf-8?B?NnhQcC81TUJHaEp5WmJEWjF3SHNsenpUNTFUZjMxWXNIa3NtZzN6UFZNaXZL?=
 =?utf-8?B?bGJlNkg3eFVPc2F5SWw4TGx0U3ZsYU83K0FvbHNqbzV6dWxZWjdaeUgwdXpo?=
 =?utf-8?B?d3NreWxTQVBFMGxIMnZoU2s4SUo2eFpvblFvYTR5OGU2WFBxOW8rRlpzZGY3?=
 =?utf-8?B?TytSeHZ0ZnJGS1MvU0poM2hNTkRoTUFIV0QxZDZSWmRMTnkwZGRGV09sVWhZ?=
 =?utf-8?B?UDhLcXp6UmZpbnJOMVQzcXF3RHF1TFZpSm81akp1TkNzM2NpbHNBSmlrVXdP?=
 =?utf-8?B?bUxjTG5sVm1SbC9aaVJiT0ZsckNpZXo5R2pJbTBPeUkwd256NDhlbThrSXVh?=
 =?utf-8?B?VlVjNUFSdG9FWTQ0V1loWTU2L01Ec2JYaVBWSGlkNDBtS2VsUmdCQzlZUXVk?=
 =?utf-8?B?OElLYWoxcGRmY2YxMmlUN2ZDM3lhNmFvOVNHWFl1OTcvYmozSnlUZHhVQUVl?=
 =?utf-8?B?dUJMVFRLTCswQnFjL0dwRU1nQUxqbEg2KytTZVpMbmNXem1wQVFpR3lRWVdQ?=
 =?utf-8?B?WE5HNUt6WjRLR2YvZ2hQRTBPVFNORVVwZHZOeGVURVBFL2paMzRlRytGUDJu?=
 =?utf-8?B?NWt2TzJ5OXZUeXRQNXVSc1JRNStrNnhsVkkzV3NER2ltaU1LbVVnaGhsalZI?=
 =?utf-8?B?R2FaQURIbDJGOWFUVGxWNFFLb3AyL0NSWVlieTZiL0ZiUGlrelhkd1hweXhZ?=
 =?utf-8?B?dGtPbHhidEhaT3pKNE9mcTZIRGpDZWc2dzhFSmNjV2o5ZWpBY1NreE9ZN1c4?=
 =?utf-8?B?bzRhWmVPWVloSU8vRkpJbDZOc21RV3pyOEtHOGZudlkyV1hHalhmUDV2MWJU?=
 =?utf-8?B?RXV3cnp1Q2ZKbWgyRnAwQmVuOXFYeUxSNldRQ1o2SmlFMWQ3QkdrOFYxcDYz?=
 =?utf-8?B?cXNSR0FJMC9HaGlRSlNaMTBwZDg2K1dORi9Sc25JT215R1pIcTF2SURSMVNz?=
 =?utf-8?B?N2lYbWtQUlJqREhMcHVDbTVndUl0UUEzdEN6S2pUbGJtSk1sZlA1Tmxpdzlo?=
 =?utf-8?B?ZU94c0crZ29US1o1UG8yUHU2WENOMEZKTXh4OE0xS3hoMEhieWdmdGkwVHVP?=
 =?utf-8?B?MkxobzRTOStjUERaOVJRcmhkb0twRUNCYnJGUU9zYkc5N0xjVjIzUVFOTlQ1?=
 =?utf-8?B?NmhGb2wyZDZxMHdVLzZ6UFl4dzA2WTNpQ242WHkvZFlPMkpJVzllOElzV056?=
 =?utf-8?B?TU56S3Y4cGg4akhyMDhPNlpEQ0g3Mkt2blhGYVoxeXNBRk5kQVlrZjNVUVBO?=
 =?utf-8?B?Z3hFMGFYdnhsTVp6cDBBT0hZeUVhUXczRU83S0w4NnZia1MvQkFFLzZJVWJt?=
 =?utf-8?B?d3F5aHg1dEorcnZpbm9NTmpzbXBibHdndDBBV05PZm1vMVhOQ25LUkpGbUhZ?=
 =?utf-8?B?dmVMelVlWS9LUW9zb2YxS0pxUVRJMXcxUzZ1blNja3pyU1FGRGg2ZjNLMW1v?=
 =?utf-8?B?eUNWKzZzWC9wcmR2TmhYYVdLNmZ5RG9MSHh6NEg5akdYMm9jOUZWUXZEODNj?=
 =?utf-8?B?TGpyQ0JFSGpldjdIR3dvbnp5NUdpQ0d1aThnZ1JkQ1BVV2wwUEZIZ0IzVGVM?=
 =?utf-8?B?endwMmdGdGowTGI1eHVKT1UwWkRZUGxqOFBPR1pTZDErSDBscTYyUm9lak1o?=
 =?utf-8?B?NUM1a210MWlZTzQvRGsxalhCVkdTc0s3QlF2eDRrbGlXYjVwSmpkNEY1bm1a?=
 =?utf-8?B?V2VNNnhUTUF5Tjh3QVZMTWFQY25FUTc3endSdjd3U3pERW1Vd3RCQVlQaHln?=
 =?utf-8?B?UlVZRzdJZlJOdXVoT1BDQWVvVlBxNmpDT2QyaGVDbU9xSzU2dzRuMzBtSVF6?=
 =?utf-8?B?UVBjdXRERFphK1VBSU5Vd25sRmF5RGlsZ3ZnQ0RZWUVtRHRBWElWRjN2S2FP?=
 =?utf-8?B?QzFUQllEcmZ4Q0t6Y2YwcFhLTkVrelBhSUVzWXlheTBRNHd0VE5oWGljeSts?=
 =?utf-8?B?V0lsSHN5bEhVZTI0bmxzRXdzaWdEQnFUcUcvNUorSGgrNDFQRzR4RFJZeTZT?=
 =?utf-8?B?bmpoWWpvd3pTWEczbyswSTVQRkVYRmtpNVZTRHllV1pQMm1HMC80d3doeG9V?=
 =?utf-8?B?Nmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 86420006-3936-40f9-d508-08dcee86c021
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 08:36:09.9094 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1h7BHyrlvS/oEuL8zDVtRmANs3IQUpdFa5hujRSgxmXeOQoUIknl0ICpBYqGbfkOVirVhs5nnCc08BX+uux/qA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4975
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



On 17-10-2024 00:25, John Harrison wrote:
> On 10/16/2024 11:51, John Harrison wrote:
>> On 10/16/2024 04:52, Badal Nilawar wrote:
>>> In case if g2h worker doesn't get opportunity to within specified
>>> timeout delay then flush the g2h worker explicitly.
>>>
>>> v2:
>>>    - Describe change in comment and add TODO (Matt B/John H)
>>>    - Add xe_gt_warn on fence done after G2H flush (John H)
>>>
>>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
>>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2902
>>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_guc_ct.c | 15 +++++++++++++++
>>>   1 file changed, 15 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/ 
>>> xe_guc_ct.c
>>> index 3096baa4c9f4..c4e06d6722f0 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>>> @@ -1028,6 +1028,21 @@ static int guc_ct_send_recv(struct xe_guc_ct 
>>> *ct, const u32 *action, u32 len,
>>>         ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ 
>>> * 3);
>>>   +    /*
>>> +     * Explicitly flush g2h_worker if it hasn’t had the chance to 
>>> run after being queued due
>>> +     * to delays in workqueue scheduling.
>>> +     *
>>> +     * TODO: Drop this change once workqueue scheduling delay issue 
>>> root caused and fixed.
>>> +     */
>>> +    if (!ret) {
>>> +        flush_work(&ct->g2h_worker);
>>> +        if (g2h_fence.done) {
>>> +            xe_gt_warn(gt, "G2H fence %u, action %04x, done %s after 
>>> G2H flush\n",
>>> +                   g2h_fence.seqno, action[0], 
>>> str_yes_no(g2h_fence.done));
>>> +            ret = 1;
>>> +        }
>>> +    }
>> Why bump the timeout and then do the flush? If the only issue is 
>> believed to be the delayed worker thread then waiting longer before 
>> doing the flush seems counter productive. You are just increasing the 
>> time taken for no benefit. Flushing the worker thread should be all 
>> that is required. If anything, we should be breaking the timeout up 
>> into smaller chunks with a flush in each so that the completion 
>> happens sooner not later.
>>
>> Also, there was a big discussion about resets on the previous revision 
>> of the patch set. What happened with that? I'm not seeing anything 
>> about connecting with the reset paths here?
>>
>> John.
>>
> PS: No point in printing a 'str_yes_no' for something that is the 
> condition on which the entire string is being printed.

Sure, I will fix in in next revision.

Regards,
Badal

> 
> John.
> 
>>
>>> +
>>>       /*
>>>        * Ensure we serialize with completion side to prevent UAF with 
>>> fence going out of scope on
>>>        * the stack, since we have no clue if it will fire after the 
>>> timeout before we can erase
>>
> 


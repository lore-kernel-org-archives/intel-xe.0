Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B9ACA5FA7
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 16:32:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10C6B10E633;
	Tue, 20 Jan 2026 16:32:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hGx4/N1S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C40E10E633
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 16:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768926723; x=1800462723;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1kdpBfwkSKwGCF5JNVlGBdeOgfsSUf1hM10LAmvqQJs=;
 b=hGx4/N1Sc7jonU2dTAvh82yajuXK+C9wdhgh0/lLeMWw/70dKTlgyyvX
 bfXW52MUZPqnU3Ebg6jugqVryVw+9HzrIudLU5aWwPpW8jY3s1S2c3Dq4
 mgGCFiAydZe7FAffkPKshRkpeC4+y4xhYWPkfISxEw/KR98wvvFdVv6T8
 opZOT/ZP7v6oW+mxikPgFPtbpTUG4x4fR48UAQuFnhm9ncV7a7bvl7Zwh
 sf4VZHc8DHNZ0lWrTi4jXse8qd0k1kHcw1H6ohNILOl6/A1Y+2gsFbmkw
 OmNim4dHN4lvX7kp2XAoHyYUBTS5WEQvD7LunqkQUYJ1YlHJEv44gyoyM A==;
X-CSE-ConnectionGUID: 402HdyInS3OlXsYUsdU0+w==
X-CSE-MsgGUID: oB5PayFfS1a3ZfQYox0Ryw==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="73995548"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="73995548"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 08:32:02 -0800
X-CSE-ConnectionGUID: NBShBj67QzCby0e2uIT9ZA==
X-CSE-MsgGUID: 45XTHDxTS1SChwoPehC9aA==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 08:32:02 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 08:32:01 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 08:32:01 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.43) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 08:31:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c3etXmQpwQXhpNuAzFRNj09gawarmCe+/MMNOV+tNAJcWecDabiziHGa9lOXbvP1/VTuo3eYpG7+mrOFA/4hQeWJeM5eznnvx+FTSYRztuj60jVYJi7EWh8LqMNCu2Z1+Ii7QVAHrE9mQFL7OikGiMPHsOH+jOffSnjeLRMk6LeusjATpAyyiX3p3Hv/0oh8rGUM/70yUjA68YwK+zlOdIMQQPebpDBrSWafkLvGB2ZYgHwCrcoIPc7wE4twJWHcC5rOJ1z66cMC5GSuMwWzMAQ+XqTVlycKIuvOiR/22A8loGIln2J0tMu6RZQfV5Qn3VP6ugkaOShwEnFL6ibCsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2tFme3qPGs/qapKnB8XxE6TlW0hHi44jx2JPNNoC/yQ=;
 b=ddQR6dE16iO+6P4FdflOiX7Lth6tvofmSBYMeNMt8V7IlhFutmHIeImIluF3jmyE/NcMRclq9TSWOzn2QEjwJ8UoN/rs4AIEA/a0Xa6kga1yQQFwLTUHKMj1USZik8n4mVBU0JpRTlcQYK7XraohOPaSDUeVVutHS2BglQ0gyppuuxTkWMipnS9nW6y3JXzOc+DZ3FEIBj+6ZEujyW0ykEb0saYl4EYpY+Tn9sCqutyBxgFTlB6eW1ajGDOMbD7TmIrJyDnAp3zCFGYzcirUaFmbCtEgqExa+iUpX8YzHAiP189pXwjmUwP53fngyRTtss+kczMIL+hxzI5ExYt6uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CH3PR11MB8435.namprd11.prod.outlook.com (2603:10b6:610:169::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.13; Tue, 20 Jan
 2026 16:31:57 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 16:31:57 +0000
Message-ID: <e881d5a8-d508-40da-a1e7-ddb90f16b660@intel.com>
Date: Tue, 20 Jan 2026 17:31:53 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] drm/xe: Make xe_ggtt_node_insert return a node
To: Maarten Lankhorst <dev@lankhorst.se>, <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>
References: <20260119125101.277182-1-dev@lankhorst.se>
 <20260119125101.277182-5-dev@lankhorst.se>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260119125101.277182-5-dev@lankhorst.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0204.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::25) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CH3PR11MB8435:EE_
X-MS-Office365-Filtering-Correlation-Id: 940cc362-2d8b-4e7d-33cd-08de58416d8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q2Z4V2lCZWc2VEpvdC9sWHZzVGxIYStDd0dKZllGaEF6dG1HbTVmbGFCUGtQ?=
 =?utf-8?B?NGdWcDZmSTBLSW84SHNsRWthV1JacGk0bGVlTzdCcnA0TVJQZG83dWNJdWs1?=
 =?utf-8?B?YXlldXM1Rml0WjVoYjBOVUswQ1lOU0NRVjdzYlVyeG1QdU5oQjJqYkJoL2No?=
 =?utf-8?B?YUlwUkZTam9MVm9XemtQTXNjVFJTRjd5QjYxb3hYWjdvWmNqeWNIOWg4VVpT?=
 =?utf-8?B?dGdsTU9YRkttSndiNFZzbXd5VWdaODFXZTdFc0l0cmpmOFRqUWdLT1gvRnk3?=
 =?utf-8?B?M1J2Z25jVmN2TW9wdm12L1BSRXJ5Zm11TzRRZmZ0b0V2RGY1b2RJYjAxVnJL?=
 =?utf-8?B?ODJEcFZmRzlZNkdZVjVKcFR1OGg3YU5QYTB5OU1aTnRKMitSN2N0QTJLcnJS?=
 =?utf-8?B?Q0VSSEptZHBpSUVwNStkTU94c2VHUzdjTHFONUNKQWd6bGZkZkFOU2hxRzJG?=
 =?utf-8?B?WG1Rb3djbnNSSHhyenFmR2pDdnBXZFFzNGJkTWNUNVN2RGlrb0hqeVJNa3ll?=
 =?utf-8?B?QUlLeitmSXhNRTRJNnIvSjlpd1dZZnczbkNKYWRoL2ZlVkFnTkVvYXg5c2dw?=
 =?utf-8?B?TEJrdjFNRTVOMDh3UTNHb1ZndHZQVGVjdm9LVFFQV0RPYkluNVgxTEZoOU45?=
 =?utf-8?B?ZElyKzIrTHQvdm9xK0RQdE1UWlJUTDgySnM4amplaWVhdXNzM3k3eSswaG80?=
 =?utf-8?B?Qit2M0NqekZLVWFnQUh1QmRKK0VmWjJ2KzE5VEpqdEo4anZNVEJtZkllU2tX?=
 =?utf-8?B?VGsxWXVNYjJWRzhrb1psc0NqQzVJeENiZEpsc1lLa3RWUGNreUZTcTVOT0VJ?=
 =?utf-8?B?YzhRR3FPakg5czVJQVV3ZWdBMmxib2Jmakxvc0NYQjlIMlljaVQyMlNoTWpK?=
 =?utf-8?B?RHdYSHhyUzU0UlhuK0Q0aFBHVUFuUUUrZU9vaFhmR2pSU21EV0pqWTlxRmw0?=
 =?utf-8?B?dm1WMzd2MU5KNG55T2gzMTRyZThXYUtMZWVaS3VPUGpFeVI3RGRiM0dQNFFk?=
 =?utf-8?B?L3YzeEFhQzFHb2tOaUlNTDlFZHFoVE5QMFV6WWxGc3p2Sm8yd292QVZScStr?=
 =?utf-8?B?Z2JyR3dNMndoZFJ0MzMrL0pJZVRjejFDYzFoY3ltVHpRSGhweEtkaERlWmo4?=
 =?utf-8?B?QVZDcnc5V213U3AxUGgyWGVzUGZmcVdFSE9QQW45d3JhL1BzZW4vckNsOFkr?=
 =?utf-8?B?THZYVjZZM3BYMGM3eW5YNFhydmhJaTF5TExiMjZFK3luckxJeVV3MTBpcXRi?=
 =?utf-8?B?QVFUdFZiczhIWmxDOUVRR0lyWFM1Nk00aXhsN0Rsc1I2SkpEWDkvRzBtdlVo?=
 =?utf-8?B?RGI3U0RzQ0Y3TkQvTzF6TlBmRUJFZ0M0THN2YXNzSWkyU05zUUhFS1FoK3JI?=
 =?utf-8?B?OHk1REE4U2pUd28xUDVBVFFySVkvT09JZ2JRWTVDZDNZOS8ySkZTTHUzY2N4?=
 =?utf-8?B?VUxxZUVEQkRpVHZiUlovZTdNRDdFQXl5MUhWcDVVVU10VlVNSTNMLzE0WVVw?=
 =?utf-8?B?TnZHMTFzWWpCb3RxbTFBbitQTFFNdVQ1UXBBcUdSamFicC9ZMUtqRHlFby90?=
 =?utf-8?B?M2FyQ3VSSjU3WTYvQWo2b2xvRFI2dDdlSkpzOCtGVk41R1VSWnRzUVZYSFlX?=
 =?utf-8?B?VDZyRXZITmNSMFhvamJvUUVJdnM4cFV3MnoxYjgxMmlBeUUxZnlzbnFpL3c4?=
 =?utf-8?B?b1E2enkwYlFDTVZRUzhlZjlSMXJwS3h2dzRGL1R5S0tnTEZvNGs3RWtYUDV0?=
 =?utf-8?B?czFtblBYOE1uZytQZWxlb200K1lWQ0o3cGV3RE8xNDAzSW5ZQTBDSVlqK3pl?=
 =?utf-8?B?MWRSRWhTV282YzE2bVgzTnVOSjJFWlJEbjB5R05XM2lsR2Ridm9oRnU1amxi?=
 =?utf-8?B?eU9iZ1ZSS3Y2WEw1UWdGdWl2VDNaRms5NUxPbkZsU2hZRDRqcGxmU3BOcm81?=
 =?utf-8?B?Y0sxb0Qya3p4RFpFM1B4MUxKVzNlaTlDRVpBWDdaZWQ0QTFVT01yWU1kcXYw?=
 =?utf-8?B?Z3FOdTA2d0ZBZUh0WlFuSlJSZWJUTmNjbEdhRXVsKzd2RDQwZmEvSU9TeFpI?=
 =?utf-8?B?NUFQZHJROWVtaVNNWjF2MFYxTjk5QVhxeEtsZ1plOW1tQytnd05wVDUybndF?=
 =?utf-8?Q?uGuo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bExoekZoTnZnbVlmTTdCS2lBZmZ3ODUzM1BCZU43c3F2RnNRSElldnVWR2Q2?=
 =?utf-8?B?RTJIQ1JoYW1IWEw1Sys2V3BURUREYTNCVE9MVU1tNUJBRFA1TnFwQVVWSXZO?=
 =?utf-8?B?UmRzRkNSaW9aRU1tZ2pqcEo4NnJ1bXJxdDJaUzRLYWNOYm4wYjFTdC9VTWNI?=
 =?utf-8?B?SHRTOXJ3TzdrcmExR2N1M2pWbDFaazJFd0hIYVg3bHB1MnhvMW5LM0Y0OGRk?=
 =?utf-8?B?L3hubmJqNDYrdDF4SUVnZk5UbmdoQlQ0RC9rYXp4aWVIY3lYT2lna3prUTV6?=
 =?utf-8?B?L0JyeWRVUlBLZy9MMXZRZnc4R3pHL1pYZ3dGckxWS1Y3NFprSFdLSmp0bmww?=
 =?utf-8?B?T3dXSWVCUTdGaWVIVUJKVWdsUXdnbFNub2ZtRS9KbTdqUGNjbG5tSmxLd2RB?=
 =?utf-8?B?aC83dkJGZ3BSNVdIUzRxME01SzI0RkE4V0ZxM2ZhMENzeGF1ZFduS3lsc285?=
 =?utf-8?B?alRhNDRaMjNCemxCUjFEU1lBSUZNS1BHaFQ3NHMzd04xeXJHcnRLSnd5Q0Zy?=
 =?utf-8?B?STgrR1I2QTZsRm82di83ODVhVGZuSHkyZnFUTjZTQmhGS3JIRklGZFJ4NEg0?=
 =?utf-8?B?Z09EaXpsL3VVRUpVaUkvMTFvQkRZSkR5S1F5bUtNcXZCazlwZjQ0NDdvU1lO?=
 =?utf-8?B?L3ZuQU5OdjI2dDNValZUTGIrTVpQbkRvd3FOdnhldkdQRlRTeTJYQzMwNWQw?=
 =?utf-8?B?RXo3YW05OWNtQmIxU01pOXlIZlIxZjEvK2tyRzJQTjJFMU53S0NUYlF2eTZ3?=
 =?utf-8?B?cmtCV05hYWNtN3IxVU1yUjhTbHZIVkRGVnVCRXkzVkdsUjVaWmppRVBIQkxa?=
 =?utf-8?B?R3BYNll0TUpsVkg4MENTWk5BRTVVZkRMbGVadXFjcGk4ckY2NGNRRDFDRTlM?=
 =?utf-8?B?SnJaUTkrV1k4a0I4aWxISWhpdHNYdWN2RXRkOS9PVFNTYnpGVnRYazZMZ3ZT?=
 =?utf-8?B?VFV5dW5wcitIM2dJbkthbmVGYkpoS0pQOXdqQTFSVFVsRGN3NnR5RC9qTyts?=
 =?utf-8?B?cExCOWRCRG9wZm9CL0lVOCtaNlhBb2tNVlAvblIyZ3I5QjRMSEMzNkFYcmlU?=
 =?utf-8?B?ME5RRm9FNi9KenI4SHpoSUJKZUhOM3JmR2JEd0lzL0lXZDVhY3pORG50blFp?=
 =?utf-8?B?SWNZNjFWNnc2MUVTdXRmSGR4YU9lb1d6MTlWVEtsazZ4OGc4R29tU01QSUFl?=
 =?utf-8?B?ZmJIOElGOHd2NGJ0QjVKRkxZU1ZhWGJIQkxtckpLWGo1Vmpzd203MXB3K3pC?=
 =?utf-8?B?bVc4RkY1ODJYYlhiSEtMMVpsNjNTNFdEUTI1TTlIY2g4M216ODFMcUNTallj?=
 =?utf-8?B?QWQ0UVkxL2pVWWZGUE5CNDNYWkcxcnU4b2hDT2NZcHJFaXB2UWswUVZOc0dk?=
 =?utf-8?B?d1Z2b2NNb2pFQVd0enc4S2ZKUTJ5WjdWb2dmMXR0MFV2ZHV4YXdoL00xSGFh?=
 =?utf-8?B?ZXJZZFlYSFhVaVVJRTA1Zzg0MHBWTHErMVc3b0kzRHpnY014Zmxld3I1amU4?=
 =?utf-8?B?bjdIUmZLcHhmSDZ6dk1Ya3YzbGQ0aUVIMkZHbzNDMmFvcVo2c0JMUDJ0RU9T?=
 =?utf-8?B?ZUpMVThzelYxT3owUmp5VFV1cWt3RW90WlIrYWhGWUlqMDhDMWx0WUU1ZCtX?=
 =?utf-8?B?b1RaZENORHJPWDdnZTE0Y1JEdGtSbVpGVkhoMjZ5YXdhWHBBblVFRWNtTk5S?=
 =?utf-8?B?K3AzaFhZNTRiWXlNb3BhRjl5VTZVT0NmN1RwV1RxSzR3eEszOU5NZ2NyRGZy?=
 =?utf-8?B?R1RGRElML293aWpIaTBWUEI0d2hSTEczVzlPRW8vOHloZ3llWlFOWjV3N243?=
 =?utf-8?B?L3NOOEJaK2RNYXQzWEFZUzZwUHF2NUdUWUNWdGxjUmtwR3JORjRiT3lLYzBO?=
 =?utf-8?B?cGJzTnVkdkE5SWtHSFR2ajM3b0FwWFhQN3cxMkEyQ1NsR3c4di9oMjB2cUdu?=
 =?utf-8?B?cVhmSHZvbmdDYzUyM0x4VjJGMEpJaDRCRjl0TDVvbjhUNlU5eGZxSm56bW1s?=
 =?utf-8?B?ckZEUVFVTHZ6NWkvZ3ZJNFhtc2c3NVR1UEdJeGJMeHZ2VW0wcFAwajlyMW5y?=
 =?utf-8?B?RW5FOUloN0k3Z25VTUl6L2pjK3YveFIrd2NwMkpjQWc0ZGllWXVzbUU0Kzg5?=
 =?utf-8?B?Yzg2MnEyLzM5eFRzVW10QVVabUJjR1l2cm4vb05PQ1NzZzdQUktHRmlYcVh6?=
 =?utf-8?B?R1pqbTY5T3ZKWUNMc3hKSnZGbmJyMHFJUjVocEY5L2tUZTlLY0ExMUc0K3Bh?=
 =?utf-8?B?ak1aM1RXOUhVTjdsVFh3NzVEVVhVYWcvSWJYeFlYZjFTTGdNeFZYK1o1SXpm?=
 =?utf-8?B?bDRQV21GeHNJUFpFM3JsUVB5QUdyZkdYYlJQMkU0djk5dE0zWk1IT3lHNkox?=
 =?utf-8?Q?5/aB6HBZw2ZYovYQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 940cc362-2d8b-4e7d-33cd-08de58416d8b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 16:31:56.9606 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sBgo7tAQCAYt6fw5qpaw3ujyUHh6EjSemC7G6GEZWm3M7klzsxVC7S6Rb1u3vLgDAA9/H+0V53Rs+J7l6yhsZ3Ok7utsBwecQPt3lTRsqOA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8435
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



On 1/19/2026 1:51 PM, Maarten Lankhorst wrote:
> This extra step is easier to handle inside xe_ggtt.c and makes
> xe_ggtt_node_allocated a simple null check instead, as the intermediate
> state 'allocated but not inserted' is no longer used.
> 
> Privatize xe_ggtt_node_fini() as it's no longer used outside of
> xe_ggtt.c
> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c |  6 +-
>  drivers/gpu/drm/xe/xe_ggtt.c                | 75 +++++++++------------
>  drivers/gpu/drm/xe/xe_ggtt.h                |  5 +-
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c  | 24 +------
>  4 files changed, 36 insertions(+), 74 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
> index acddbedcf17cb..7aeee6680d78c 100644
> --- a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
> +++ b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
> @@ -38,12 +38,8 @@ static struct xe_bo *replacement_xe_managed_bo_create_pin_map(struct xe_device *
>  	if (flags & XE_BO_FLAG_GGTT) {
>  		struct xe_ggtt *ggtt = tile->mem.ggtt;
>  
> -		bo->ggtt_node[tile->id] = xe_ggtt_node_init(ggtt);
> +		bo->ggtt_node[tile->id] = xe_ggtt_node_insert(ggtt, xe_bo_size(bo), SZ_4K);
>  		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, bo->ggtt_node[tile->id]);
> -
> -		KUNIT_ASSERT_EQ(test, 0,
> -				xe_ggtt_node_insert(bo->ggtt_node[tile->id],
> -						    xe_bo_size(bo), SZ_4K));
>  	}
>  
>  	return bo;
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 715d050cd63a4..04e207623e42d 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -458,6 +458,11 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
>  	mutex_unlock(&ggtt->lock);
>  }
>  
> +static void xe_ggtt_node_fini(struct xe_ggtt_node *node)

nit: since it's static, it doesn't need to have xe_ prefix (see below ggtt_node_remove)

> +{
> +	kfree(node);
> +}
> +
>  static void ggtt_node_remove(struct xe_ggtt_node *node)
>  {
>  	struct xe_ggtt *ggtt = node->ggtt;
> @@ -613,43 +618,7 @@ static int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
>  					  mm_flags);
>  }
>  
> -/**
> - * xe_ggtt_node_insert - Insert a &xe_ggtt_node into the GGTT
> - * @node: the &xe_ggtt_node to be inserted
> - * @size: size of the node
> - * @align: alignment constrain of the node
> - *
> - * It cannot be called without first having called xe_ggtt_init() once.
> - *
> - * Return: 0 on success or a negative error code on failure.
> - */
> -int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align)
> -{
> -	int ret;
> -
> -	if (!node || !node->ggtt)
> -		return -ENOENT;
> -
> -	mutex_lock(&node->ggtt->lock);
> -	ret = xe_ggtt_node_insert_locked(node, size, align,
> -					 DRM_MM_INSERT_HIGH);
> -	mutex_unlock(&node->ggtt->lock);
> -
> -	return ret;
> -}
> -
> -/**
> - * xe_ggtt_node_init - Initialize %xe_ggtt_node struct
> - * @ggtt: the &xe_ggtt where the new node will later be inserted/reserved.
> - *
> - * This function will allocate the struct %xe_ggtt_node and return its pointer.
> - * This struct will then be freed after the node removal upon xe_ggtt_node_remove()
> - * Having %xe_ggtt_node struct allocated doesn't mean that the node is already allocated
> - * in GGTT. Only xe_ggtt_node_insert() will ensure the node is inserted or reserved in GGTT.
> - *
> - * Return: A pointer to %xe_ggtt_node struct on success. An ERR_PTR otherwise.
> - **/
> -struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt)
> +static struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt)
>  {
>  	struct xe_ggtt_node *node = kzalloc(sizeof(*node), GFP_NOFS);
>  
> @@ -663,16 +632,32 @@ struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt)
>  }
>  
>  /**
> - * xe_ggtt_node_fini - Forcebly finalize %xe_ggtt_node struct
> - * @node: the &xe_ggtt_node to be freed
> + * xe_ggtt_node_insert - Insert a &xe_ggtt_node into the GGTT
> + * @ggtt: the @ggtt into which the node should be inserted.
> + * @size: size of the node
> + * @align: alignment constrain of the node
>   *
> - * If anything went wrong with either xe_ggtt_node_insert() and this @node is
> - * not going to be reused, then this function needs to be called to free the
> - * %xe_ggtt_node struct
> - **/
> -void xe_ggtt_node_fini(struct xe_ggtt_node *node)
> + * Return: &xe_ggtt_node on success or a ERR_PTR on failure.
> + */
> +struct xe_ggtt_node *xe_ggtt_node_insert(struct xe_ggtt *ggtt, u32 size, u32 align)

wrong naming, this should be:

	xe_ggtt_insert_node()

>  {
> -	kfree(node);
> +	struct xe_ggtt_node *node;
> +	int ret;
> +
> +	node = xe_ggtt_node_init(ggtt);
> +	if (IS_ERR(node))
> +		return node;
> +
> +	mutex_lock(&ggtt->lock);

nit: since you've changed many other places to use guard() maybe here it should be scoped_guard() ?
or do everything under guard() as both node_init/fini could be called under mutex

> +	ret = xe_ggtt_node_insert_locked(node, size, align,
> +					 DRM_MM_INSERT_HIGH);
> +	mutex_unlock(&ggtt->lock);
> +	if (ret) {
> +		xe_ggtt_node_fini(node);
> +		return ERR_PTR(ret);
> +	}
> +
> +	return node;
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> index 403eb5c0db49d..6d8679bcc38fb 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> @@ -18,13 +18,12 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt);
>  int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 reserved, u32 size);
>  int xe_ggtt_init(struct xe_ggtt *ggtt);
>  
> -struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt);
> -void xe_ggtt_node_fini(struct xe_ggtt_node *node);
>  void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, u64 new_base);
>  u64 xe_ggtt_start(struct xe_ggtt *ggtt);
>  u64 xe_ggtt_size(struct xe_ggtt *ggtt);
>  
> -int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align);
> +struct xe_ggtt_node *
> +xe_ggtt_node_insert(struct xe_ggtt *ggtt, u32 size, u32 align);
>  struct xe_ggtt_node *
>  xe_ggtt_node_insert_transform(struct xe_ggtt *ggtt,
>  			      struct xe_bo *bo, u64 pte,
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 23601ce79348a..2cb41e8322676 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -482,23 +482,9 @@ static int pf_distribute_config_ggtt(struct xe_tile *tile, unsigned int vfid, u6
>  	return err ?: err2;
>  }
>  
> -static void pf_release_ggtt(struct xe_tile *tile, struct xe_ggtt_node *node)
> -{
> -	if (xe_ggtt_node_allocated(node)) {
> -		/*
> -		 * explicit GGTT PTE assignment to the PF using xe_ggtt_assign()
> -		 * is redundant, as PTE will be implicitly re-assigned to PF by
> -		 * the xe_ggtt_clear() called by below xe_ggtt_remove_node().
> -		 */
> -		xe_ggtt_node_remove(node, false);
> -	} else {
> -		xe_ggtt_node_fini(node);
> -	}
> -}
> -
>  static void pf_release_vf_config_ggtt(struct xe_gt *gt, struct xe_gt_sriov_config *config)
>  {
> -	pf_release_ggtt(gt_to_tile(gt), config->ggtt_region);
> +	xe_ggtt_node_remove(config->ggtt_region, false);
>  	config->ggtt_region = NULL;
>  }
>  
> @@ -533,14 +519,10 @@ static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
>  	if (!size)
>  		return 0;
>  
> -	node = xe_ggtt_node_init(ggtt);
> +	node = xe_ggtt_node_insert(ggtt, size, alignment);
>  	if (IS_ERR(node))
>  		return PTR_ERR(node);
>  
> -	err = xe_ggtt_node_insert(node, size, alignment);
> -	if (unlikely(err))
> -		goto err;
> -
>  	xe_ggtt_assign(node, vfid);
>  	xe_gt_sriov_dbg_verbose(gt, "VF%u assigned GGTT %llx-%llx\n",
>  				vfid, xe_ggtt_node_addr(node), xe_ggtt_node_addr(node) + size - 1);
> @@ -552,7 +534,7 @@ static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
>  	config->ggtt_region = node;
>  	return 0;
>  err:
> -	pf_release_ggtt(tile, node);
> +	xe_ggtt_node_remove(node, false);
>  	return err;
>  }
>  


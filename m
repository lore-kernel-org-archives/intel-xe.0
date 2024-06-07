Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68600C27C53
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 14:35:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CBFC10EC7F;
	Fri,  7 Jun 2024 14:35:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="izgwRghg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82ADC10EC7F
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jun 2024 14:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717770911; x=1749306911;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=rDEtMGxL/x0ipyPLOkDkL0H9M7Lf1bJqGXPyUdRcyoE=;
 b=izgwRghgHFomsIHNFRKD8t+SUVwzKLh66R8Nt/4NdBOkNOJAyo2+y7D4
 g7wmosrgTrFGETJStxU9jZhXG+LftQ30IWta8R8z7TX5me25rw+c/4Fk9
 cdL/lTFESJaS4zDfGzv6W5537/uDbQv5TF4mkHQ/nW0ih0TO5s1UmhWH0
 J34Z+5h2fhIPxRh+MflinSlNMs2LVoMXo2hHrxDHfJlaUQGgKi+MVNFJN
 aV9Et97Excd++zWWErj6OiRIQnV4wdV4N81MFrsFSEnx/y7Tf9nyvQUDU
 J5V0NR6yH8VaY8BRc7eSN40Lfbeu4AU+L3t41ciIwXmt89wAE+mQXbJSK w==;
X-CSE-ConnectionGUID: CObusKnyTnampUYx536SvQ==
X-CSE-MsgGUID: Lqu7o5vsR6ij6GdIp0DzSg==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="17420727"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="17420727"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 07:35:10 -0700
X-CSE-ConnectionGUID: k41LB9ylQTWso2uKFBXyVw==
X-CSE-MsgGUID: bI7xZVCoTg+pFgdLzS0DNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38452010"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Jun 2024 07:35:09 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Jun 2024 07:35:09 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Jun 2024 07:35:09 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 7 Jun 2024 07:35:08 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 7 Jun 2024 07:35:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fxEJOxgvDRE49uXSGpEj50zEGwVYfDLHfAW19qWxTW4trT744FQBQCD4T9VTaM2ia/Ewt3wjK43VEXzSXH9V0FeEYDQjF0JA1EEm5OnxBBSmaC8Lo8uExiKMNYwqu0FNSoQhTLebOS3twUWa5v5trQAOMeWqwQoyZIhxXmPRExPWqul+DRiYKx/zoSI1D9Mx3DrppmlYlhrtckIUDgZT62KqNTTk02dXqnDoRRfXy+PvFyHh0EeXPhaUXMjMWJVt9LQkP/OVX3tz0QapqwqGpK+aobKYoxMpj1JImROxKQawIQrfEVYrK4GwDE+dkyryhdKKDLt4eQz12P6LKZvwKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DiDSeSSCIcanXmsVOVCPy2al/10n51mS7Cu27neTVoA=;
 b=Ni2xkz0y93pMXfspcTiSfy5Go+48eTFCC8PoNhaXIA1QjjbN+GVDdHc9kbJ4yxJYpD5pj0ReR0ov9kOcQuIqXfwpbb7AP3v0Dzb2/exlhOu+3Ac8Gn3rs7eg12llC8tzsJlG7/P/7jPJO+GHJiXRaKYizYFO+0+Fl4+9O/CK0QM1APvWUJ8OY+n+wh80y2PSug9S3CTIKDU6YpdsRfjkpEIjMhZSGv8HQ29dzkXkpOETvs9jjeCI+HhqbbtQgb9apl8wfyFDyDnHyQ83ghCGCWKBm5jU3Sv1+Ck6E4RzHRos4NQF5wjlDD0X13DATbuTbt2mrBFLYpB2+VPmVnq1gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SA2PR11MB5049.namprd11.prod.outlook.com (2603:10b6:806:11b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.35; Fri, 7 Jun
 2024 14:35:05 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.7611.016; Fri, 7 Jun 2024
 14:35:05 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240606223819.3545560-6-radhakrishna.sripada@intel.com>
References: <20240606223819.3545560-1-radhakrishna.sripada@intel.com>
 <20240606223819.3545560-6-radhakrishna.sripada@intel.com>
Subject: Re: [PATCH v5 5/6] drm/xe/trace: Print device_id in xe_trace events
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Radhakrishna Sripada <radhakrishna.sripada@intel.com>, Ville
 =?utf-8?b?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
To: Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 <intel-xe@lists.freedesktop.org>
Date: Fri, 7 Jun 2024 11:35:00 -0300
Message-ID: <171777090023.2025.14332306180174639932@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BY5PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::18) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SA2PR11MB5049:EE_
X-MS-Office365-Filtering-Correlation-Id: 94235ac7-a6df-4897-f604-08dc86ff05d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QytLdFRtTnpOOHN3d3dOaFlCZW85SXRRcU9JT2hsVGtOYTZCTmtVTzZGVnFO?=
 =?utf-8?B?elhVRHh3Z2NkTHJMd2N6QkczWUZyalFMNnNKYUdkVzQvcDl2OFV6cVNaNElz?=
 =?utf-8?B?SFN4K3hwV0R0dWNkcmVWYVVhbDd4TitXYWlSOURVaHVBL0MyNmxEV3Nsbk11?=
 =?utf-8?B?YUw1ZG5zU3FGMkN2bXhIelNZbkZ0MmhnWTlqWGhFMlhEb3FmTE5aanQwRWZh?=
 =?utf-8?B?OHJHRjVPT0NLK0lsWVVnTkR3SDJHLzhKTUoxaGUzeTNrMndVTmJwK0RaWTJh?=
 =?utf-8?B?SmxiVE1XY0JneG8ydUw2YnFUeEQrdWN6YVAxai9oMEUvVjNzNlJiT01jWmdN?=
 =?utf-8?B?UFRUcWZwS3JCQThhTmdlNVk3U0NsT2R3UHIwQmE5di9ZWWQ2dURJdnR2MkNP?=
 =?utf-8?B?Y2t3UUgvREw5WjEwSU1GOHlMNVExRUt4L1A3WjB5NGw0cmhVY3B2R0VEU1hQ?=
 =?utf-8?B?Vnd2ZE56NjgzK1U2S20rdFo3T2RhQi9Mek5BRDl0OWlPNWJTV05mRFdJS05j?=
 =?utf-8?B?R0pGNjNaYU9GT2dtSDJFUUJDMVFyai90OVFwSWZnZjlNSjdKLzM0Z1FRWEk1?=
 =?utf-8?B?dFRqSlBqazhwdktFNW45cVE4OVdmREc1V2lQNllFMXB5MW54K2pld3UvSEFo?=
 =?utf-8?B?KzNMVkZ6Z3FSWGhFWXhtWmIrMnRPdUJ3TEtPa1FBeXNmeGxHVGIzUUhIamcz?=
 =?utf-8?B?UWJJdTVSY21mVUhWRS9mM2FDVFY2dERZOEtUbFo0TUo0QnQyVkY1alV4aGpj?=
 =?utf-8?B?Ty9SaGdzTFp0bkFyZzBLdER6WWswWlljSUNta09IdDUyN0lCWm10blhpV0Iv?=
 =?utf-8?B?MjI4bXIwdG1ELzB5eG53djdtSkMyL2ozM2drUFNUUGtWSjdvL1BiZWpuUGVt?=
 =?utf-8?B?bzZrbjE1MmFyRmEycnBhRFJjMjRNNWtPZEpJSnVuWXJLWFBoSFRHcnh3cDht?=
 =?utf-8?B?SUJ4cnZSMkEwUUlqT1FVUURDUHE3WEdxK24vaXFmQ3FnSC8rUUxJdElzcVo5?=
 =?utf-8?B?aUg5NEhZazFSVGVuY3ZhVHR6ajRSL3R6U29DdVVtekg0MWNPdDFLMVFFUVYv?=
 =?utf-8?B?eXBUV3ZsSVFYQ3JOS2JJYll6dXZKeXROYzBqNWRsc1V0eTFzMUdaZTNvbnJB?=
 =?utf-8?B?S0tUWGRzeWhtQ3VpNEEvSHQxWFRPYmgvR1Iwa2N6RS9wMVRRZDFZeWVTZFkw?=
 =?utf-8?B?ZGYzTHZ5R2dNVlFFdzRjczZsQUFOWGpuNWIzOGs4VlNFU0svUGhKaURzeHEw?=
 =?utf-8?B?NFFTWk1xOTFZK3IxY3JxNVBaNFEzcXpISUk4N3dwdFJzZU1kZkxFTjRIYkVE?=
 =?utf-8?B?U3FhWmJMQW1RSWJDc1pZaXVsZGVqRDBoUmJoUjBIVmQ3RHRiSS9oQTVIYlhw?=
 =?utf-8?B?R0dkWlFSTzB6MW1HcGNNSy8wTkc1QmxsNHcwUkprYzhxZlhmWGgxdFg2Qk1L?=
 =?utf-8?B?bktxYUdYLy9PUUY2aFFzUlMzZVNzRnNTS1FncHlhNnZSY3pFU0hEelJOMlhC?=
 =?utf-8?B?cGY0eXpOaDM3VWdJejk0UnJmK2U5ajNSbnVHMGJScmNKVlAxdmpBMWZUc0di?=
 =?utf-8?B?dWE1bFZxWFFMdWdmZjFHZjM1djVZcUlXQzI2TnFOYWRSNGo4SXZwVUpjN0ZB?=
 =?utf-8?B?U0pRdERnOEFUTzBOZ3QwcVVCL1BlcGNJQmxLMGRjcE1aR3lzZGpkVU5VKys3?=
 =?utf-8?B?amxYVTBQcE96dkl5UjU0NC9BR0ZhTE5HWEFEYXAzLzJmOU15OFVwZFNDTHFz?=
 =?utf-8?Q?07nzAsaZ2k5CyWPk9ZTm3nKrWQ4kcOWjYnm1/ug?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eE44NnlkR3hTMnlPeVZiOHJwMktCbGtNbk4yVHRoWVJrbk95SVRrRk8rQW5n?=
 =?utf-8?B?ZUxwcUExSGhwVll3aEhpWDEwWmdVNGorK3NMM0wwZEhmV2xSK3FiVlZHZG5z?=
 =?utf-8?B?NURONEJUZkRvWEdLQktrZGJrSFZxM1VpZWpkS01rZ1BQQmpkcVhxUmdFZmNS?=
 =?utf-8?B?bWhVMFI1YkU0djNLVnhyZkEzUlNuWDR3T2t6TTM0TWduaDZOSWhtbDlJekhI?=
 =?utf-8?B?OVZic25WcnpYUjV6ZHJiYUhndStnNDNQa01CcFp5RnRBK0pkajZlb25hZSs2?=
 =?utf-8?B?RjZPMDVvQ0RuUjU1a2tPZ3dTM2g4KzhFRUU0czZiblE3Tm56dTJnb0pGL1V3?=
 =?utf-8?B?dG9DWkM2QmlHUVpZYUdRMGxsOFZwTHdzUDlEV1BOMUJISDZRb1RsOWJIa0o4?=
 =?utf-8?B?MjNFMTJPMG43bEFFUS9CYU9DWmtKdTl6MDBRYjE5anRPZTVRcTdTWjNuWHNY?=
 =?utf-8?B?c3dpOVFkajVmWjFObnhEN0plbmQyR2FVRm11UXE1MXNjYlAzaWxyMFpwTXg0?=
 =?utf-8?B?NmxUUkdySFdKSjdRemo3bVB4cXRnSWxwN0N0KzZZQ0V5TndWMml3ZjljTU9r?=
 =?utf-8?B?NFg0ZXhYWUZIY1NYeEFVb1JZTFkzK2luMUlRMGhTSStXeHlmU0N5UmRmWnhz?=
 =?utf-8?B?aW1NMEZTUjNRWHN4STlCVjBFS3d3SnJQOFhaY3g4SnNPNDNlcE9QT21aKzVy?=
 =?utf-8?B?enhjSjNGQlo4dklVNFVrdDhVYVJaTUhpYWdkRUtCL1A5SStkc0l0MmlUUzBz?=
 =?utf-8?B?bWlNUjcwYWNvZ1UyYnZuY0hoK1l0ZEI4dUZyRHlhdWRjOWVJdTBqQzFQdnNQ?=
 =?utf-8?B?RkxrZXQwa2hoakJ6bURJRG9POUY0b1lPZlYrVUoxWVU2dmlYa0RvOHNvUkVC?=
 =?utf-8?B?STZtTGNoL2FhTURYSjFBYTU3SkNhRUsydWxsakI4R0pQcitXdE5DTG9WNjJJ?=
 =?utf-8?B?Mnp2YkZYQnk3UXNoNUdpamV0RjY4b20rNlVlRDhDNHFEWFY0Wjd1U0srSndj?=
 =?utf-8?B?K0hUeHE2SVJySzlLdlAvTHhHM2VvSHV2VDFlUzdLVzJobmZFUk0wQVNTRGZl?=
 =?utf-8?B?a1pzRXNrWENCOWNxdnVEZmVwdDhuY1VhbHN0UkpCRi9KdUttd0s4N1JqNTZN?=
 =?utf-8?B?NnBybnZGZVhCUzVrcE4zVzBnaFRrd3FVWlRlT2ZRZXJpWElSeEpZNUhXNFZu?=
 =?utf-8?B?SHBqRjRGTmpaQ3BJbW1CSXdEbEl5WEVoWHJQUGY3UTZhYWNNUmpxaC9CWVJF?=
 =?utf-8?B?OENPejZiNG1sdGhlRmpvNjZESFFoTzU0OENVWXlQWHprTjhnRS9OSlBuZDFn?=
 =?utf-8?B?SXQ1cXkrYkxTMFBPVENVV0ZBQjc2bGtwc1lBRE9zZm1KWURVSGNzNFBwR2NT?=
 =?utf-8?B?Uk1hdDQ3Qy9uT2MwVUVJMThrMXFtNXBtMmRyVjhJUWhSUHAyaFFqcktjc3dn?=
 =?utf-8?B?VVFlS3ZPRG10VUFMKzVoOUJ1UEZhR1BTb29sSkRjNHR1elFmVXFKRzRLNjV0?=
 =?utf-8?B?aGQrM1ZhaDN4U01DM2RTMHBRK2tFSkpFdEVpRGJCQUhqaCswbHBIRVZzTWNV?=
 =?utf-8?B?WEJJbWlDdENoeTB0UHUxVFBmUEt4L3cxVm5Fb3lvOTJnT1phQURLNlY1ZkpB?=
 =?utf-8?B?N1RqYmkwYmhOT3lpSDhhbEs4cTRYZnNyY1R2aTVxWEtBWlR3NmE2dUw0Z1NS?=
 =?utf-8?B?aWtsTHNTQXFRQ2dlRC94NkwwQWk2U3VFajFJOTFVT3NQMlZFRXhBeXIzMWth?=
 =?utf-8?B?MzFkWmczR0xrRG4zWTY2bnhkZ3p4b2FtR09jOFFwajFjb2dUNEtEWUVDN2hG?=
 =?utf-8?B?c3FTYTZ6NHlxeUhPTjdab2ZrUlh5TnE1dDI1KzF1QTNDdVdkN0tWWDhVS2VD?=
 =?utf-8?B?OEFUM1FSOHRjNzkyWFRpTTNLVmtwYlpPMmdHS3NhNWtQeHJEaEU4N3NjV0pC?=
 =?utf-8?B?WG1neGhwOFEzL1JaaHBMK3NXWlRrTzhEZXdNNWJjUWRGcHNkSE5aLzk5THJG?=
 =?utf-8?B?NVF2Q1hITlBSTzZqUm5uTDlFaVpwbXhwV21yS2NNUkhPT0FWRVZrZlNGbWtX?=
 =?utf-8?B?L1c1TmhUSHVVbDUrdmpHSzVsWnNaVzNxKzdMRnB5UlBBUGRmeG9RWlV0eVlZ?=
 =?utf-8?B?WWxhaHBxS2VaNjNrK045bWtBTmtUS3BwWWs5ZDFCWTJxR2FZSy9vNmg4bFd4?=
 =?utf-8?B?TlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 94235ac7-a6df-4897-f604-08dc86ff05d3
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 14:35:05.5699 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nN9pJKc8TSUHUiheEOJkY+mhdGs9slRkC5RLH3V17ZmsIx+oC7fBBTZAcE6+6Z5mC4eQMpaHROrtakFyjBg00Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5049
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

Quoting Radhakrishna Sripada (2024-06-06 19:38:18-03:00)
>In multi-gpu environments it is important to know the device
>gt events belongs to. The tracing information includes the device_id
>to indicate the device the event is associated with.
>
>v2: Use variable sized variant to display dev name(Gustavo)
>v3: Pass single argument to __assign_str to fix kunit error
>
>Suggested-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>Cc: Gustavo Sousa <gustavo.sousa@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
>---
> drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 27 +++++----
> drivers/gpu/drm/xe/xe_pt.c                  |  8 ++-
> drivers/gpu/drm/xe/xe_trace.h               | 65 +++++++++++++--------
> 3 files changed, 60 insertions(+), 40 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm=
/xe/xe_gt_tlb_invalidation.c
>index 105797776a6c..23d397a246a8 100644
>--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>@@ -22,6 +22,7 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *=
work)
> {
>         struct xe_gt *gt =3D container_of(work, struct xe_gt,
>                                         tlb_invalidation.fence_tdr.work);
>+        struct xe_device *xe =3D gt_to_xe(gt);
>         struct xe_gt_tlb_invalidation_fence *fence, *next;
>=20
>         spin_lock_irq(&gt->tlb_invalidation.pending_lock);
>@@ -33,7 +34,7 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *=
work)
>                 if (msecs_to_jiffies(since_inval_ms) < TLB_TIMEOUT)
>                         break;
>=20
>-                trace_xe_gt_tlb_invalidation_fence_timeout(fence);
>+                trace_xe_gt_tlb_invalidation_fence_timeout(xe, fence);
>                 xe_gt_err(gt, "TLB invalidation fence timeout, seqno=3D%d=
 recv=3D%d",
>                           fence->seqno, gt->tlb_invalidation.seqno_recv);
>=20
>@@ -71,18 +72,18 @@ int xe_gt_tlb_invalidation_init(struct xe_gt *gt)
> }
>=20
> static void
>-__invalidation_fence_signal(struct xe_gt_tlb_invalidation_fence *fence)
>+__invalidation_fence_signal(struct xe_device *xe, struct xe_gt_tlb_invali=
dation_fence *fence)
> {
>-        trace_xe_gt_tlb_invalidation_fence_signal(fence);
>+        trace_xe_gt_tlb_invalidation_fence_signal(xe, fence);
>         dma_fence_signal(&fence->base);
>         dma_fence_put(&fence->base);
> }
>=20
> static void
>-invalidation_fence_signal(struct xe_gt_tlb_invalidation_fence *fence)
>+invalidation_fence_signal(struct xe_device *xe, struct xe_gt_tlb_invalida=
tion_fence *fence)
> {
>         list_del(&fence->link);
>-        __invalidation_fence_signal(fence);
>+        __invalidation_fence_signal(xe, fence);
> }
>=20
> /**
>@@ -121,7 +122,7 @@ void xe_gt_tlb_invalidation_reset(struct xe_gt *gt)
>=20
>         list_for_each_entry_safe(fence, next,
>                                  &gt->tlb_invalidation.pending_fences, li=
nk)
>-                invalidation_fence_signal(fence);
>+                invalidation_fence_signal(gt_to_xe(gt), fence);
>         spin_unlock_irq(&gt->tlb_invalidation.pending_lock);
>         mutex_unlock(&gt->uc.guc.ct.lock);
> }
>@@ -144,6 +145,7 @@ static int send_tlb_invalidation(struct xe_guc *guc,
>                                  u32 *action, int len)
> {
>         struct xe_gt *gt =3D guc_to_gt(guc);
>+        struct xe_device *xe =3D gt_to_xe(gt);
>         int seqno;
>         int ret;
>=20
>@@ -157,7 +159,7 @@ static int send_tlb_invalidation(struct xe_guc *guc,
>         seqno =3D gt->tlb_invalidation.seqno;
>         if (fence) {
>                 fence->seqno =3D seqno;
>-                trace_xe_gt_tlb_invalidation_fence_send(fence);
>+                trace_xe_gt_tlb_invalidation_fence_send(xe, fence);
>         }
>         action[1] =3D seqno;
>         ret =3D xe_guc_ct_send_locked(&guc->ct, action, len,
>@@ -171,7 +173,7 @@ static int send_tlb_invalidation(struct xe_guc *guc,
>                  * we can just go ahead and signal the fence here.
>                  */
>                 if (tlb_invalidation_seqno_past(gt, seqno)) {
>-                        __invalidation_fence_signal(fence);
>+                        __invalidation_fence_signal(xe, fence);
>                 } else {
>                         fence->invalidation_time =3D ktime_get();
>                         list_add_tail(&fence->link,
>@@ -184,7 +186,7 @@ static int send_tlb_invalidation(struct xe_guc *guc,
>                 }
>                 spin_unlock_irq(&gt->tlb_invalidation.pending_lock);
>         } else if (ret < 0 && fence) {
>-                __invalidation_fence_signal(fence);
>+                __invalidation_fence_signal(xe, fence);
>         }
>         if (!ret) {
>                 gt->tlb_invalidation.seqno =3D (gt->tlb_invalidation.seqn=
o + 1) %
>@@ -294,7 +296,7 @@ int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
>         /* Execlists not supported */
>         if (gt_to_xe(gt)->info.force_execlist) {
>                 if (fence)
>-                        __invalidation_fence_signal(fence);
>+                        __invalidation_fence_signal(xe, fence);
>=20
>                 return 0;
>         }
>@@ -432,6 +434,7 @@ int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int =
seqno)
> int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u3=
2 len)
> {
>         struct xe_gt *gt =3D guc_to_gt(guc);
>+        struct xe_device *xe =3D gt_to_xe(gt);
>         struct xe_gt_tlb_invalidation_fence *fence, *next;
>         unsigned long flags;
>=20
>@@ -468,12 +471,12 @@ int xe_guc_tlb_invalidation_done_handler(struct xe_g=
uc *guc, u32 *msg, u32 len)
>=20
>         list_for_each_entry_safe(fence, next,
>                                  &gt->tlb_invalidation.pending_fences, li=
nk) {
>-                trace_xe_gt_tlb_invalidation_fence_recv(fence);
>+                trace_xe_gt_tlb_invalidation_fence_recv(xe, fence);
>=20
>                 if (!tlb_invalidation_seqno_past(gt, fence->seqno))
>                         break;
>=20
>-                invalidation_fence_signal(fence);
>+                invalidation_fence_signal(xe, fence);
>         }
>=20
>         if (!list_empty(&gt->tlb_invalidation.pending_fences))
>diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>index cd60c009b679..ade9e7a3a0ad 100644
>--- a/drivers/gpu/drm/xe/xe_pt.c
>+++ b/drivers/gpu/drm/xe/xe_pt.c
>@@ -1137,8 +1137,9 @@ static void invalidation_fence_cb(struct dma_fence *=
fence,
> {
>         struct invalidation_fence *ifence =3D
>                 container_of(cb, struct invalidation_fence, cb);
>+        struct xe_device *xe =3D gt_to_xe(ifence->gt);
>=20
>-        trace_xe_gt_tlb_invalidation_fence_cb(&ifence->base);
>+        trace_xe_gt_tlb_invalidation_fence_cb(xe, &ifence->base);
>         if (!ifence->fence->error) {
>                 queue_work(system_wq, &ifence->work);
>         } else {
>@@ -1153,8 +1154,9 @@ static void invalidation_fence_work_func(struct work=
_struct *w)
> {
>         struct invalidation_fence *ifence =3D
>                 container_of(w, struct invalidation_fence, work);
>+        struct xe_device *xe =3D gt_to_xe(ifence->gt);
>=20
>-        trace_xe_gt_tlb_invalidation_fence_work_func(&ifence->base);
>+        trace_xe_gt_tlb_invalidation_fence_work_func(xe, &ifence->base);
>         xe_gt_tlb_invalidation_range(ifence->gt, &ifence->base, ifence->s=
tart,
>                                      ifence->end, ifence->asid);
> }
>@@ -1166,7 +1168,7 @@ static int invalidation_fence_init(struct xe_gt *gt,
> {
>         int ret;
>=20
>-        trace_xe_gt_tlb_invalidation_fence_create(&ifence->base);
>+        trace_xe_gt_tlb_invalidation_fence_create(gt_to_xe(gt), &ifence->=
base);
>=20
>         spin_lock_irq(&gt->tlb_invalidation.lock);
>         dma_fence_init(&ifence->base.base, &invalidation_fence_ops,
>diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
>index 81128c0f31e6..f0b3477c0e1a 100644
>--- a/drivers/gpu/drm/xe/xe_trace.h
>+++ b/drivers/gpu/drm/xe/xe_trace.h
>@@ -9,6 +9,7 @@
> #if !defined(_XE_TRACE_H_) || defined(TRACE_HEADER_MULTI_READ)
> #define _XE_TRACE_H_
>=20
>+#include <linux/string_helpers.h>

I believe string_helpers.h is not necessary here.

> #include <linux/tracepoint.h>
> #include <linux/types.h>
>=20
>@@ -20,58 +21,64 @@
> #include "xe_sched_job.h"
> #include "xe_vm.h"
>=20
>+#define __dev_name_xe(xe)        dev_name((xe)->drm.dev)
>+#define __dev_name_gt(gt)        __dev_name_xe(gt_to_xe((gt)))
>+#define __dev_name_eq(q)        __dev_name_gt((q)->gt)
>+
> DECLARE_EVENT_CLASS(xe_gt_tlb_invalidation_fence,
>-                    TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
>-                    TP_ARGS(fence),
>+                    TP_PROTO(struct xe_device *xe, struct xe_gt_tlb_inval=
idation_fence *fence),
>+                    TP_ARGS(xe, fence),
>=20
>                     TP_STRUCT__entry(
>+                             __string(dev, __dev_name_xe(xe))
>                              __field(struct xe_gt_tlb_invalidation_fence =
*, fence)
>                              __field(int, seqno)
>                              ),
>=20
>                     TP_fast_assign(
>+                           __assign_str(dev);
>                            __entry->fence =3D fence;
>                            __entry->seqno =3D fence->seqno;
>                            ),
>=20
>-                    TP_printk("fence=3D%p, seqno=3D%d",
>-                              __entry->fence, __entry->seqno)
>+                    TP_printk("dev=3D%s, fence=3D%p, seqno=3D%d",
>+                              __get_str(dev), __entry->fence, __entry->se=
qno)
> );
>=20
> DEFINE_EVENT(xe_gt_tlb_invalidation_fence, xe_gt_tlb_invalidation_fence_c=
reate,
>-             TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
>-             TP_ARGS(fence)
>+             TP_PROTO(struct xe_device *xe, struct xe_gt_tlb_invalidation=
_fence *fence),
>+             TP_ARGS(xe, fence)
> );
>=20
> DEFINE_EVENT(xe_gt_tlb_invalidation_fence,
>              xe_gt_tlb_invalidation_fence_work_func,
>-             TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
>-             TP_ARGS(fence)
>+             TP_PROTO(struct xe_device *xe, struct xe_gt_tlb_invalidation=
_fence *fence),
>+             TP_ARGS(xe, fence)
> );
>=20
> DEFINE_EVENT(xe_gt_tlb_invalidation_fence, xe_gt_tlb_invalidation_fence_c=
b,
>-             TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
>-             TP_ARGS(fence)
>+             TP_PROTO(struct xe_device *xe, struct xe_gt_tlb_invalidation=
_fence *fence),
>+             TP_ARGS(xe, fence)
> );
>=20
> DEFINE_EVENT(xe_gt_tlb_invalidation_fence, xe_gt_tlb_invalidation_fence_s=
end,
>-             TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
>-             TP_ARGS(fence)
>+             TP_PROTO(struct xe_device *xe, struct xe_gt_tlb_invalidation=
_fence *fence),
>+             TP_ARGS(xe, fence)
> );
>=20
> DEFINE_EVENT(xe_gt_tlb_invalidation_fence, xe_gt_tlb_invalidation_fence_r=
ecv,
>-             TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
>-             TP_ARGS(fence)
>+             TP_PROTO(struct xe_device *xe, struct xe_gt_tlb_invalidation=
_fence *fence),
>+             TP_ARGS(xe, fence)
> );
>=20
> DEFINE_EVENT(xe_gt_tlb_invalidation_fence, xe_gt_tlb_invalidation_fence_s=
ignal,
>-             TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
>-             TP_ARGS(fence)
>+             TP_PROTO(struct xe_device *xe, struct xe_gt_tlb_invalidation=
_fence *fence),
>+             TP_ARGS(xe, fence)
> );
>=20
> DEFINE_EVENT(xe_gt_tlb_invalidation_fence, xe_gt_tlb_invalidation_fence_t=
imeout,
>-             TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
>-             TP_ARGS(fence)
>+             TP_PROTO(struct xe_device *xe, struct xe_gt_tlb_invalidation=
_fence *fence),
>+             TP_ARGS(xe, fence)
> );
>=20
> DECLARE_EVENT_CLASS(xe_exec_queue,
>@@ -79,6 +86,7 @@ DECLARE_EVENT_CLASS(xe_exec_queue,
>                     TP_ARGS(q),
>=20
>                     TP_STRUCT__entry(
>+                             __string(dev, __dev_name_eq(q))
>                              __field(enum xe_engine_class, class)
>                              __field(u32, logical_mask)
>                              __field(u8, gt_id)
>@@ -89,6 +97,7 @@ DECLARE_EVENT_CLASS(xe_exec_queue,
>                              ),
>=20
>                     TP_fast_assign(
>+                           __assign_str(dev);
>                            __entry->class =3D q->class;
>                            __entry->logical_mask =3D q->logical_mask;
>                            __entry->gt_id =3D q->gt->info.id;
>@@ -98,8 +107,8 @@ DECLARE_EVENT_CLASS(xe_exec_queue,
>                            __entry->flags =3D q->flags;
>                            ),
>=20
>-                    TP_printk("%d:0x%x, gt=3D%d, width=3D%d, guc_id=3D%d,=
 guc_state=3D0x%x, flags=3D0x%x",
>-                              __entry->class, __entry->logical_mask,
>+                    TP_printk("dev=3D%s, %d:0x%x, gt=3D%d, width=3D%d, gu=
c_id=3D%d, guc_state=3D0x%x, flags=3D0x%x",
>+                              __get_str(dev), __entry->class, __entry->lo=
gical_mask,
>                               __entry->gt_id, __entry->width, __entry->gu=
c_id,
>                               __entry->guc_state, __entry->flags)
> );
>@@ -199,6 +208,7 @@ DECLARE_EVENT_CLASS(xe_sched_job,
>                     TP_ARGS(job),
>=20
>                     TP_STRUCT__entry(
>+                             __string(dev, __dev_name_eq(job->q))
>                              __field(u32, seqno)
>                              __field(u32, lrc_seqno)
>                              __field(u16, guc_id)
>@@ -210,6 +220,7 @@ DECLARE_EVENT_CLASS(xe_sched_job,
>                              ),
>=20
>                     TP_fast_assign(
>+                           __assign_str(dev);
>                            __entry->seqno =3D xe_sched_job_seqno(job);
>                            __entry->lrc_seqno =3D xe_sched_job_lrc_seqno(=
job);
>                            __entry->guc_id =3D job->q->guc->id;
>@@ -221,8 +232,8 @@ DECLARE_EVENT_CLASS(xe_sched_job,
>                            __entry->batch_addr =3D (u64)job->ptrs[0].batc=
h_addr;
>                            ),
>=20
>-                    TP_printk("fence=3D%p, seqno=3D%u, lrc_seqno=3D%u, gu=
c_id=3D%d, batch_addr=3D0x%012llx, guc_state=3D0x%x, flags=3D0x%x, error=3D=
%d",
>-                              __entry->fence, __entry->seqno,
>+                    TP_printk("dev=3D%s, fence=3D%p, seqno=3D%u, lrc_seqn=
o=3D%u, guc_id=3D%d, batch_addr=3D0x%012llx, guc_state=3D0x%x, flags=3D0x%x=
, error=3D%d",
>+                              __get_str(dev), __entry->fence, __entry->se=
qno,
>                               __entry->lrc_seqno, __entry->guc_id,
>                               __entry->batch_addr, __entry->guc_state,
>                               __entry->flags, __entry->error)
>@@ -268,17 +279,19 @@ DECLARE_EVENT_CLASS(xe_sched_msg,
>                     TP_ARGS(msg),
>=20
>                     TP_STRUCT__entry(
>+                             __string(dev, __dev_name_eq(((struct xe_exec=
_queue *)msg->private_data)))

Well, in the definition of struct xe_sched_msg, it says that
private_data is an opaque pointer and it is "backend defined". It
seems that, today, the value for that will always be a pointer to a
struct xe_exec_queue, so the cast above is expected to work. Not sure if
that's a guarantee for the future.

I would prefer that the exec queue would be passed explicitly to the
tracing function, but I guess we can go ahead with this, since the cast
is already being done in this event for guc_id.

Thus, with the removal of the inclusion of string_helpers.h,

    Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>                              __field(u32, opcode)
>                              __field(u16, guc_id)
>                              ),
>=20
>                     TP_fast_assign(
>+                           __assign_str(dev);
>                            __entry->opcode =3D msg->opcode;
>                            __entry->guc_id =3D
>                            ((struct xe_exec_queue *)msg->private_data)->g=
uc->id;
>                            ),
>=20
>-                    TP_printk("guc_id=3D%d, opcode=3D%u", __entry->guc_id=
,
>+                    TP_printk("dev=3D%s, guc_id=3D%d, opcode=3D%u", __get=
_str(dev), __entry->guc_id,
>                               __entry->opcode)
> );
>=20
>@@ -297,19 +310,21 @@ DECLARE_EVENT_CLASS(xe_hw_fence,
>                     TP_ARGS(fence),
>=20
>                     TP_STRUCT__entry(
>+                             __string(dev, __dev_name_gt(fence->ctx->gt))
>                              __field(u64, ctx)
>                              __field(u32, seqno)
>                              __field(struct xe_hw_fence *, fence)
>                              ),
>=20
>                     TP_fast_assign(
>+                           __assign_str(dev);
>                            __entry->ctx =3D fence->dma.context;
>                            __entry->seqno =3D fence->dma.seqno;
>                            __entry->fence =3D fence;
>                            ),
>=20
>-                    TP_printk("ctx=3D0x%016llx, fence=3D%p, seqno=3D%u",
>-                              __entry->ctx, __entry->fence, __entry->seqn=
o)
>+                    TP_printk("dev=3D%s, ctx=3D0x%016llx, fence=3D%p, seq=
no=3D%u",
>+                              __get_str(dev), __entry->ctx, __entry->fenc=
e, __entry->seqno)
> );
>=20
> DEFINE_EVENT(xe_hw_fence, xe_hw_fence_create,
>--=20
>2.34.1
>

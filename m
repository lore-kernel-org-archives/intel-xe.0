Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D0AEE7717F
	for <intel-xe@archiver.kernel.org>; Sat, 14 Dec 2024 00:55:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3A5D10E1E0;
	Sat, 14 Dec 2024 00:55:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FY1IMACr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CED910E1E0
 for <intel-xe@lists.freedesktop.org>; Sat, 14 Dec 2024 00:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734137705; x=1765673705;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=n3jSW0eeH6137xgkYcsfzFoTwsNsJkR9ypICfqDpO9g=;
 b=FY1IMACrY8fIhTXR8FPsY0d1P0QSGAphZS4TqQGK1grV0Zhrg2wWxQgl
 C8+OA6debLHAHhLPV6eCXlhL2SAVNpbFfJQZJXEnmWuTXLCpfq0AqWLBm
 kn1m6bPIPqpvTvCzgE4bPXPvD7r8VJ1Hri23dY3GREVp4xrCk758ARB4X
 1FnDJivHpIbZEqQy7EzyBB6gZDgcgGNV6Dzx7rbU7GJhGkO2nasxDsKw+
 07ZwWjalG2LGJf8VpEwihNfitHQYq36YWqN27lPp+3mmzbuWTdJQQMLuc
 q9F8xaANmQXRaVjTdpF1tmcW3lmrzKOUvzmsjN12i53WQivp6tGY17nOK g==;
X-CSE-ConnectionGUID: s0fyQfZdRMalHi+tJqJZnA==
X-CSE-MsgGUID: iCMGDXcVQ/KJmp9U3FQ7Ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45608453"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="45608453"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 16:55:04 -0800
X-CSE-ConnectionGUID: toFEqxVmTrCLy+a0/yVO7g==
X-CSE-MsgGUID: SfHJXKM/SiWPVlO8w+ns0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="134030917"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Dec 2024 16:55:05 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 13 Dec 2024 16:55:04 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 13 Dec 2024 16:55:04 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 13 Dec 2024 16:55:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bIFC2msYE0KXZB3v3jFjkxrDO2Fr6FoXNjPpBZsiwYIhoaaYpEzJkNxncvUL6hDGAMSYDpcPP+mL/wqWcsJSeh5e0bvvZHldTk7n0lxlspPZI/+ognShCCj0dNkrrq6eKZnSKjR9FIIUxpulTRtzEdTUHGV4V1sOJT7d+0wbE2wjMfuNE/QpVI+GyMVXXAlbEdDdnpsB+LUfJKMFhkDHrqueqYRLGxpHhsT2Vw+uRCDuxA3caP5Rf0piIKhEcDZa2fpkyhjB/OG8sXYMBTgnVnyxkSj+4bmqcHa13utD4HD+cathlBWi8ARBFmFaqaLaWsIfET20of1BmJhBldCGGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AKh7TmQq44SOiPgojlQ6kuHIHpGqHmxX/kk/F4ymwH4=;
 b=pIH2vEUBJu2pK8glKtyjdE7sWnozVzhlpkEsljQkaAHXGTiLNq7MQT2wPvm38paLCddTXcetkU6ww8PotmdmaAjXYpwgsoqrbCR+1vmhZrGFodb1if0vNZOaTYW/RHSEce3l6LVAoK28n6vIw0wQVJyWTCPD39Zh+KX8A7NLJpyPse3b7C5jpyqLk+Q50Jf+rnDv+yU3WzWKDn/A+uIy4n85fnscZKB7kDy0afN+y1xGD1+Bd7HpHdW3Iqt9WBFykTRfenrt2fAwuSWuidfG3YxZeqBI+QWW7Tkxvk6EXw6dY+8J+gB9h5mQTWKe7Mey+3PZp1kCJ3oMmjkLw4PB+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CH0PR11MB8165.namprd11.prod.outlook.com (2603:10b6:610:18e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.19; Sat, 14 Dec
 2024 00:54:43 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%3]) with mapi id 15.20.8251.015; Sat, 14 Dec 2024
 00:54:43 +0000
Date: Fri, 13 Dec 2024 16:54:41 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/oa/uapi: Expose an unblock after N reports OA
 property
Message-ID: <Z1zXUdMPUGQVO5yJ@orsosgc001>
References: <20241212224903.1853862-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20241212224903.1853862-1-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0358.namprd03.prod.outlook.com
 (2603:10b6:303:dc::33) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CH0PR11MB8165:EE_
X-MS-Office365-Filtering-Correlation-Id: 051ea3a0-7ca2-47d8-5b7c-08dd1bd9e59c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V1JqaHJ5NThtRXFSSVZTVlJ4YkMwcGd1eDc0M0pwcXV6OVRkQkY3bEVrWjBR?=
 =?utf-8?B?RS9OMklVZ0lOTFNWcFBNL1M0R0FyS0J5aFlrTkxNNGVycndlYm1vOHhITjEz?=
 =?utf-8?B?QW1CTVF5M0lMZTFnQWd4YW4rZ0JoY1JwZllLbjY1bGV5U3hndFdrbWVyelZR?=
 =?utf-8?B?ejgzSDVYRHVJaU5yWVdwUEtpc3pJWDlBNDVZajkvUnFZZm9HRm5DaWs5Z3lu?=
 =?utf-8?B?VVBIOWxpUkwyQ01YamR3SVdFS0pIUTRWamd2RE9vdlhUUWFQYW9kOFF4ckpx?=
 =?utf-8?B?emIvU3ppU1NRdDBKc3plclRhRHB5K3lBYldaRVFxN1EraDVQVEhUcGVoWGMr?=
 =?utf-8?B?amNjTXRFNFhKMDArWG5vY3pQTW1yS24vNGU2NGhVbU91eEovbzhzZi84OHNq?=
 =?utf-8?B?UVcrMG93RGlsMjg3ZG8yWmJVNnZvMDJINWx3MUVrQ3NKQjB5blJDYVR0cHRW?=
 =?utf-8?B?enJFRFdXUFpENXdrUWw4M0RNaFR4QmZSRXhyRkU2bUI3eGlwd0xXTEdqSkVG?=
 =?utf-8?B?eTNVamJqbW11ZXdqWVIzZks2U2g3Q0tVNVcxaEIwY2JLYlVBdG9wZXp6aGIz?=
 =?utf-8?B?YTNyWlNOZVFmUFJ4MzlYMzdQdU1sLy9ndVZxbkJEdjdURHBaTlRKK3dzNDV1?=
 =?utf-8?B?Mm5qU1p6M2szR3JDeTU2djU5ODQ5aTkrU0xyWGZkRjdDZk5GRi9JN2VwV3E1?=
 =?utf-8?B?MnZKTzUwbktiNVI4NGRiS2dXT3lCY3p6WGhqTjJ1TmRjbzVOSHk4OGFlK0tp?=
 =?utf-8?B?NEJGekp3QktDcDFsMjY4WFVMdXpnTWVzdUh0dGJVaGF5WUFKMW5zUmRHMEhy?=
 =?utf-8?B?V0JyYWVCUSsxZ3o1Zmx3V2V5VXE1TUVnL3N3UUtmV1lNc1M3Q3QycUluNk5K?=
 =?utf-8?B?R0dpc211Q3B6VXJDdlBsd1Z4SFh1allkVjc0VFZJNkNNOTBaKzBpLzJ4bEZL?=
 =?utf-8?B?QlI4NEpjb2hscTNjSUgwVE80OHFBbmFaKzBTVGNieVBMN1BVWldRUThEaFNk?=
 =?utf-8?B?eGVEMnF5bGJ6bDcvR1RveklEaCtoWU95dVpqZVhESnc0WjhoYm8xYmVneURo?=
 =?utf-8?B?NEhyZll1bjlhNFNTTStGMEF2WEQwSWh5enZ2MHcvcDhacDY4cXpJOUlWUHVM?=
 =?utf-8?B?QXZuL1NiRmxQN3dCNXBDRmlyS0pjY0Fsc01xZ1JCRlRPdHhkOTFzcVh4TW4z?=
 =?utf-8?B?aHIyVUNhdFBxWUIzMmZ0TVluVmRNTkZDZWpNSUZHeVJJU2NncVIxVmZRQ3JJ?=
 =?utf-8?B?OXhCM1VUTWFvTmU4WmczRmVYeDFlNjZmN3lqcERlYXJTYjgyZTgzL09aYXlz?=
 =?utf-8?B?NUpidHVZL01YVHRFZWlzc05kMjJQUURZbzdRYm44SnpjNDRGUGRIbS84TFd4?=
 =?utf-8?B?OUZ5WEpFVXNVQThqSnJINlorOUM3bld1OGZxYTR2eVJkWjQzUzluSmVtZnV3?=
 =?utf-8?B?MFYxbndJRllMU20rVjZxcCtSL0NyUzA4L21CUWxjNXc2N2tFY2RYVzdUWHBz?=
 =?utf-8?B?L29BZkRNaE5xS0R1bDhaSUdlMG51Y3E2SUg2TFZUQ2JiaXgvZnFmU20vTytu?=
 =?utf-8?B?VVdETFBYZzlmYjFka05qN2k1M1RWYm5OeXZRRmJCVTZ4OUhhYlBjekdCcm5Z?=
 =?utf-8?B?VTRVUWhUVTRjcTJRRlFmRmc0eXhnT0RRREEvbnpmMk1TTUF2ZnhNVTd5a0Z2?=
 =?utf-8?B?aHpaSm5PRGYrNWRnVmFTUzRGTVl6dGtabTNoZFB0V0FJTVhhUml5STF0RlRE?=
 =?utf-8?B?ZzVzVk5maHZMU25nNEJONk4xd3hONE5BZW83M0hZZUFQR0FNRU1vY0RibkYv?=
 =?utf-8?B?V2lXWDhuU1drTXo4VWdHdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmNqdlJLOU5ZWjBaZSt2N05kMzNHaG1ldmxldVB2S1R0Rk0vVjhxcE1hZlVt?=
 =?utf-8?B?ditpWEJ2VXRuNGN5ZWdHRlFTbTFqSGZvVWEwbENEQ2VTQnlFV2oyZHlidU11?=
 =?utf-8?B?M3lwRW00elp3UWRSN203K0Y5SUEzdEhWQ1o4KzEvZWUzaUhzazZHQWRHYnhV?=
 =?utf-8?B?S2hqVHJuZitTSE12eVZzSk9IV3ZoNzVZMUh0TUlnNklxRDVYc252QTdKaHpa?=
 =?utf-8?B?ZCt5YXZocTROWmRBZXZ1NWpxS0ExS0c5dWp5MTFLQkc4RG9zL0dtOFcrNy9W?=
 =?utf-8?B?bE1nS0JDTm42a0EveG9kZTd6Uko0US9qWFZHbFNOSWZjTThIanFIM3lUd0NT?=
 =?utf-8?B?THVobEFpeFkwR3E0RUFvS0NFOXZtM3U0ck9iZFdjWkRPVzFiUFB3VkVoVGQr?=
 =?utf-8?B?TVVPczBlcWdHd0cralhEaGE2eWJyUnd1b0F6QUlWMG9QNHVhSlE1Q05MeUJM?=
 =?utf-8?B?cnlWTDlYMWVQKzMxSVpUcHlUSEpkUzZnTGlScm95MmlnbnB6MGxxT0pCais3?=
 =?utf-8?B?OVlvNDQ3eG9PZi9ucGxKMlk2bUdNckVwM05HMGREd0xJRFhtUmpjRDIwTCt5?=
 =?utf-8?B?eldOaWRNUzdSZHNlMU5JL0IyTDBEcFpURWtVMVFwSjJUVGZWMGExR1hEdHlU?=
 =?utf-8?B?T3dLNGtYTUpMeVlIVlRJcitKaHNyTDRqVThycWRNMDVic2FBMW9XdHY1dmdn?=
 =?utf-8?B?SUQ4cmUwa1IvQzl3NWk0Q0ZUTFBrQjJvd3QvTnZHQjZwdVdDNlBLZ041Ym0x?=
 =?utf-8?B?c0pYaC9SZVFWL2hzYWNjMVNrS2pYVDcrL0tVSkFWMENiQkdJNm1TWVUzV1ZE?=
 =?utf-8?B?QnJmd2tiNUJSL0QvSDIrYXpRL3dLOXF2QUtmUTF4SXcvTFNWaG9kWGxrUWZL?=
 =?utf-8?B?NHBPY1VuSERkWWhmb09JWURQbHZpN3UyRWxXRzMvWjJqN214S2ZzMG5DajlE?=
 =?utf-8?B?R0tQVy9ROWlmSHVLQmtKTXZrOFR0S1hTZjNuMmlKWU5HV0RhQlBNYjcyQVBr?=
 =?utf-8?B?TTFDYWRUVDhkUmJaejJlRW9Ic0tlOHZOT3Z3Z2VkcG1CWndFNWYwQlBOUXlG?=
 =?utf-8?B?bllGL0gvYkt6YkJJcHhtd2R2MFBiM1dHQ1JETGdMeGdIU3Bpb0pYZ1h6TDJC?=
 =?utf-8?B?NWFGK3RVOHNjNzNXSnpaT2lTTnRzU3AyTkU4dDEvYWUwTWFCc0dzZ1d1eTJ3?=
 =?utf-8?B?TXM3UWtrWDQ1elBYaml1ZU1kTytVMEhMVWQyeTlGRXRIcld5S1dVWTUrUUxr?=
 =?utf-8?B?WXJldkVmYkZXbmtRNEx4cmN5aHM0SkdRK25tbVdIZ01qUDlIRkpZRTIwUG1j?=
 =?utf-8?B?OGtzZEw4QndJOEI5WVJIbmZJRW9DNUVYT25mSThhZnJCVjdQc3ZzRk5nbEtS?=
 =?utf-8?B?MmdtM0tRdnVmREw2Ty9XYTF2WVVZQzRmcnVNZlhncm4zUHNzZ2VVUzNQQmds?=
 =?utf-8?B?b29YRExTVFdBWHRoTmVWaUlWUDVZY0dEMHREcC9KcURsajZyRmNEVndYZldN?=
 =?utf-8?B?VkR5ZzEzcjBlbGg2NDFZOERwRWdVQ1JaaXlYUmxVSjFFVEpvV2RucjYwV3V3?=
 =?utf-8?B?L2MxeS9BdWhDVVJzZG9wK04yMWY4MDd0YmRtQmNxVGJUdDFIZysrUUV1aVRr?=
 =?utf-8?B?ellZb1JZWHpFbVlCNmYvSGVwUkxrNUZsQmlBMHp0L0h3d0tWdXhMdG43ZEpJ?=
 =?utf-8?B?WlNQK0htRU0zbmJUMS9vMUJHckt1bEdZZU5LcWF3VHpPMDIzcVFHaHBLbHUx?=
 =?utf-8?B?ZVJ5K1JoVUpsUXNjblE5KzF3WG90dkVPODc1d1RnQzEvL1YyQ1BWWC9QblRN?=
 =?utf-8?B?akhyaG90ZGhFVHBhWkdKZ3VId25xVHBMeXNtOFZGZUMwVDkrYlNmM0d2R0lW?=
 =?utf-8?B?SWVQcWpBek9lRWtxMVF5REp0OENlVldiV0lrSjhrWDdWUGN1amk1SXVTSTNY?=
 =?utf-8?B?ZjF2SW5Tc2V2c0I3NURVN0xhYUVaN0tnTzJzWlFReHpYZ0VLd1N5YWU0QndZ?=
 =?utf-8?B?Q1I3VEdiT3puMW1QVDNzN09JcjJXb01jc1N4Y0xCWktYL2UranljRko3TkYr?=
 =?utf-8?B?OU9rWTYvbmpMcmVNZUU0TENwOTQwK2NqVjcxL2pmbUVieTNld0Q4d1M4ck1R?=
 =?utf-8?B?eStHMHZmZkc3Sk5rbjFENkNPU0k3NmtrdXV2YWtVVzJBMGdEK3BBUDl5ZWhH?=
 =?utf-8?Q?i+R5a4JYB1FQTqAPSOi8JYo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 051ea3a0-7ca2-47d8-5b7c-08dd1bd9e59c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2024 00:54:43.2425 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fT40OGsrs0+JXY0ldPJ9rDhBy6hdjfwze55TFmtuSSExpPpvldZ1Dtz9cEwGwOSMjtnMiHdlIJIb8TScoY4DcttRQu07VvOzFLV+/BD3brU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8165
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

On Thu, Dec 12, 2024 at 02:49:03PM -0800, Ashutosh Dixit wrote:
>Expose an "unblock after N reports" OA property, to allow userspace threads
>to be woken up less frequently.
>
>Co-developed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> drivers/gpu/drm/xe/xe_oa.c       | 30 ++++++++++++++++++++++++++----
> drivers/gpu/drm/xe/xe_oa_types.h |  3 +++
> drivers/gpu/drm/xe/xe_query.c    |  2 +-
> include/uapi/drm/xe_drm.h        |  7 +++++++
> 4 files changed, 37 insertions(+), 5 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index ec88b18e9baa2..56bf375a9d4bc 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -97,6 +97,7 @@ struct xe_oa_open_param {
> 	int num_syncs;
> 	struct xe_sync_entry *syncs;
> 	size_t oa_buffer_size;
>+	int wait_num_reports;
> };
>
> struct xe_oa_config_bo {
>@@ -241,11 +242,10 @@ static void oa_timestamp_clear(struct xe_oa_stream *stream, u32 *report)
> static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
> {
> 	u32 gtt_offset = xe_bo_ggtt_addr(stream->oa_buffer.bo);
>+	u32 tail, hw_tail, partial_report_size, available;
> 	int report_size = stream->oa_buffer.format->size;
>-	u32 tail, hw_tail;
> 	unsigned long flags;
> 	bool pollin;
>-	u32 partial_report_size;
>
> 	spin_lock_irqsave(&stream->oa_buffer.ptr_lock, flags);
>
>@@ -289,8 +289,8 @@ static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
>
> 	stream->oa_buffer.tail = tail;
>
>-	pollin = xe_oa_circ_diff(stream, stream->oa_buffer.tail,
>-				 stream->oa_buffer.head) >= report_size;
>+	available = xe_oa_circ_diff(stream, stream->oa_buffer.tail, stream->oa_buffer.head);
>+	pollin = available >= stream->wait_num_reports * report_size;
>
> 	spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
>
>@@ -1285,6 +1285,17 @@ static int xe_oa_set_prop_oa_buffer_size(struct xe_oa *oa, u64 value,
> 	return 0;
> }
>
>+static int xe_oa_set_prop_wait_num_reports(struct xe_oa *oa, u64 value,
>+					   struct xe_oa_open_param *param)
>+{
>+	if (!value) {
>+		drm_dbg(&oa->xe->drm, "wait_num_reports %llu\n", value);
>+		return -EINVAL;
>+	}
>+	param->wait_num_reports = value;
>+	return 0;
>+}
>+
> static int xe_oa_set_prop_ret_inval(struct xe_oa *oa, u64 value,
> 				    struct xe_oa_open_param *param)
> {
>@@ -1306,6 +1317,7 @@ static const xe_oa_set_property_fn xe_oa_set_property_funcs_open[] = {
> 	[DRM_XE_OA_PROPERTY_NUM_SYNCS] = xe_oa_set_prop_num_syncs,
> 	[DRM_XE_OA_PROPERTY_SYNCS] = xe_oa_set_prop_syncs_user,
> 	[DRM_XE_OA_PROPERTY_OA_BUFFER_SIZE] = xe_oa_set_prop_oa_buffer_size,
>+	[DRM_XE_OA_PROPERTY_WAIT_NUM_REPORTS] = xe_oa_set_prop_wait_num_reports,
> };
>
> static const xe_oa_set_property_fn xe_oa_set_property_funcs_config[] = {
>@@ -1321,6 +1333,7 @@ static const xe_oa_set_property_fn xe_oa_set_property_funcs_config[] = {
> 	[DRM_XE_OA_PROPERTY_NUM_SYNCS] = xe_oa_set_prop_num_syncs,
> 	[DRM_XE_OA_PROPERTY_SYNCS] = xe_oa_set_prop_syncs_user,
> 	[DRM_XE_OA_PROPERTY_OA_BUFFER_SIZE] = xe_oa_set_prop_ret_inval,
>+	[DRM_XE_OA_PROPERTY_WAIT_NUM_REPORTS] = xe_oa_set_prop_ret_inval,
> };
>
> static int xe_oa_user_ext_set_property(struct xe_oa *oa, enum xe_oa_user_extn_from from,
>@@ -1797,6 +1810,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
> 	stream->periodic = param->period_exponent > 0;
> 	stream->period_exponent = param->period_exponent;
> 	stream->no_preempt = param->no_preempt;
>+	stream->wait_num_reports = param->wait_num_reports;
>
> 	stream->xef = xe_file_get(param->xef);
> 	stream->num_syncs = param->num_syncs;
>@@ -2156,6 +2170,14 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *f
> 	if (!param.oa_buffer_size)
> 		param.oa_buffer_size = DEFAULT_XE_OA_BUFFER_SIZE;
>
>+	if (!param.wait_num_reports)
>+		param.wait_num_reports = 1;
>+	if (param.wait_num_reports > param.oa_buffer_size / f->size) {
>+		drm_dbg(&oa->xe->drm, "wait_num_reports %d\n", param.wait_num_reports);
>+		ret = -EINVAL;
>+		goto err_exec_q;
>+	}

If possible, I think this check where wait_num_reports has an upper 
limit should be moved to xe_oa_set_prop_wait_num_reports().

With that, 

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh

>+
> 	ret = xe_oa_parse_syncs(oa, &param);
> 	if (ret)
> 		goto err_exec_q;
>diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
>index df77939156288..2dcd3b9562e97 100644
>--- a/drivers/gpu/drm/xe/xe_oa_types.h
>+++ b/drivers/gpu/drm/xe/xe_oa_types.h
>@@ -218,6 +218,9 @@ struct xe_oa_stream {
> 	/** @pollin: Whether there is data available to read */
> 	bool pollin;
>
>+	/** @wait_num_reports: Number of reports to wait for before signalling pollin */
>+	int wait_num_reports;
>+
> 	/** @periodic: Whether periodic sampling is currently enabled */
> 	bool periodic;
>
>diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>index d2a816f71bf26..226b234d07110 100644
>--- a/drivers/gpu/drm/xe/xe_query.c
>+++ b/drivers/gpu/drm/xe/xe_query.c
>@@ -672,7 +672,7 @@ static int query_oa_units(struct xe_device *xe,
> 			du->oa_unit_type = u->type;
> 			du->oa_timestamp_freq = xe_oa_timestamp_frequency(gt);
> 			du->capabilities = DRM_XE_OA_CAPS_BASE | DRM_XE_OA_CAPS_SYNCS |
>-					   DRM_XE_OA_CAPS_OA_BUFFER_SIZE;
>+				DRM_XE_OA_CAPS_OA_BUFFER_SIZE | DRM_XE_OA_CAPS_WAIT_NUM_REPORTS;
>
> 			j = 0;
> 			for_each_hw_engine(hwe, gt, hwe_id) {
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index 0383b52cbd869..f62689ca861a4 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -1487,6 +1487,7 @@ struct drm_xe_oa_unit {
> #define DRM_XE_OA_CAPS_BASE		(1 << 0)
> #define DRM_XE_OA_CAPS_SYNCS		(1 << 1)
> #define DRM_XE_OA_CAPS_OA_BUFFER_SIZE	(1 << 2)
>+#define DRM_XE_OA_CAPS_WAIT_NUM_REPORTS	(1 << 3)
>
> 	/** @oa_timestamp_freq: OA timestamp freq */
> 	__u64 oa_timestamp_freq;
>@@ -1660,6 +1661,12 @@ enum drm_xe_oa_property_id {
> 	 * buffer is allocated by default.
> 	 */
> 	DRM_XE_OA_PROPERTY_OA_BUFFER_SIZE,
>+
>+	/**
>+	 * @DRM_XE_OA_PROPERTY_WAIT_NUM_REPORTS: Number of reports to wait
>+	 * for before unblocking poll or read
>+	 */
>+	DRM_XE_OA_PROPERTY_WAIT_NUM_REPORTS,
> };
>
> /**
>-- 
>2.47.1
>

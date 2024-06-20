Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF74CC27C79
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jun 2024 09:29:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AAA110E889;
	Thu, 20 Jun 2024 09:29:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LHlBQvIx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C0E110E889
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jun 2024 09:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718875756; x=1750411756;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=mWLYr6GsekTTCIXgDyZv8aRaI7Hb5GxHcGB4KA0DGI0=;
 b=LHlBQvIx33J6o9kdiCKkZixtZiKHPoBFbeYm812nBgJT1qqMERRKz6pw
 4vAAtUG8ZcW5s1e41ZjSTID53QnrXZnbP2sJpUUX4gmZ+SFS6IcZ9eYB+
 W2jGz9aoK6HZ55wH182BtINBr7DVtqe1YPtz0knitRGmRZJrRT2G4ycES
 uhU+1ThXpT5tVZ9LntQCwHtIChNQJ2fOcHeIPZR//Znp42qRDGHyxnn2N
 kvmB61FtYzjP2wyBosxoXAYD4HvPoNVQS21z0C3r2DlZx+f6npsQFvynQ
 XkRd9+LwyXrih0RcScvCtltDK/JC07q98QBRoest1YwkPAare52c3xMFT g==;
X-CSE-ConnectionGUID: rHeznMgfR92HA1do44SOlg==
X-CSE-MsgGUID: BH5ZP+SPQyqkpa4NPIlIBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="33299303"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="33299303"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 02:29:15 -0700
X-CSE-ConnectionGUID: yOcXxbM8TBO/vziBayTpwA==
X-CSE-MsgGUID: 7zif0UB6TCG5bhpR0us2Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="42005288"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jun 2024 02:29:16 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 02:29:15 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 20 Jun 2024 02:29:15 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Jun 2024 02:29:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JL76f0lvVUo+8fUPLwVhtlNxAzvEYGvdN/dLvsk5io2jUREV7lXiRqTkBh1We4ADKFR9beCdakbD7bTbs6/2ezO5FHjZ5/tYhhxqxVq4Cd+eqhBuZxaqI4yseXoji4ixQYkd/5cvTw9toSv0RY+sGzZT3XBy3QuM5TOhv4wFj9H5fkakftLUWIEO1iR6CYdhxpVCgNgu+++qKC5glZGTEe5gKLYt4ZuFn9eXAlaJq3nOuQa0wCHKfe8FZoK/7UN0SQM8Z3yXX3+wQ2cJnuQEkOUw4Hc21iOTNAIzE2XSLjNRxHu1PHMElszOnILQqypxmAbt7DPF8OqqdBq1eFOmdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=csts+Zn+dsSW6n9TfTOVJIecbK1JGsGUK/5lGMMKUdo=;
 b=cjgfz7Zi4BW18B0cr2fsx166Twd5JUncSahLP18PAkk17SdjcXq+x7xJwiXrQRuZ32H6OE81l9aE0JUH29mjz+wzZrBX8vQ8TjtSPaUwktYavqCGlxC9bKFS7GvR976F602XoB5pPz5btIaFQi3m7l8kc3oO8AQU5QsNkPnbViCR/HnCJJcsswzI/olzz0fTf2clENHXnpAIaY9tLUeefV6NW9HP/wTteZIWI9Qxo4PjIFZj3rwCj8amvXVWQHxc0IOYHEZLo7JN2rB5U7FsxEx8W46efPjr7FZh9Fbqz2wafjmNu3ZMhIrLaPA0lfxDvuTk+ajwGR8p3Rv+3xasyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SA2PR11MB5146.namprd11.prod.outlook.com (2603:10b6:806:116::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.21; Thu, 20 Jun
 2024 09:29:13 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.7698.017; Thu, 20 Jun 2024
 09:29:13 +0000
Date: Thu, 20 Jun 2024 11:29:05 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 4/9] drm/xe/vf: Don't change hwe IRQ masks if using
 memory IRQs
Message-ID: <20240620092905.m7hyvdrdsm26zybm@intel.com>
References: <20240619214557.905-1-michal.wajdeczko@intel.com>
 <20240619214557.905-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240619214557.905-5-michal.wajdeczko@intel.com>
X-ClientProxiedBy: DUZPR01CA0272.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::12) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SA2PR11MB5146:EE_
X-MS-Office365-Filtering-Correlation-Id: 07746ecb-c828-42e7-c1ae-08dc910b7284
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|1800799021|376011;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SWIrdG1aZmFQZ0p5YVRoYkZ1bDFHcWx6ZStWUjRNT1hsazd6eUlTMmc2bFJw?=
 =?utf-8?B?V2FXeUVYSDVlcysvandSTUc2SHhaTUo5amZaR0xFL0ZvVlVab3FMZmdBdWl0?=
 =?utf-8?B?YStTSWwwempDbTdiZFB5NWxFSXRjVk5JWC8rSG1wQlBhQnhZWmF4NmdtRXA2?=
 =?utf-8?B?MlVWcU1veGNKNWNyY1I3ZDI5NklMN2VyWjhsWTI5UWgxOThKK09sRHFDMTNz?=
 =?utf-8?B?ZlZaN0NaVUpBTDhscGZoTVRVcnlNZklOdllDWmtpOWJJT3dPNUc3cFpULzMx?=
 =?utf-8?B?N2hjRU90NjlUZ1JRK3VZM0loU045S1J6N1J1MTNuUUdMc2xrQkkveHIrdXkr?=
 =?utf-8?B?MGorblNUWU90WlJZNXNuNHVldWZpK1lUTlhXZFhoTVV5eTdvZG1UczFwNmlP?=
 =?utf-8?B?dEIyY0REYnVlZ3l1ODhMbStjNWxPdHN6aTBGa0pTc3BObUJVV01tMlB6c2tj?=
 =?utf-8?B?cnBnOVhBMzdkNzJjeFcwMmlsK0RLcEFmb0ZUQk9yTWpva3VHVldFVjJVdzNz?=
 =?utf-8?B?L2hpMzRIcjh2UWxNWXFaN2JLTDFyR1djWEM3STNNREUxMW8rVXZHZk4zMkRD?=
 =?utf-8?B?dmc5MXl3NDN3MlloNEh3TjZjMnR4WnVNbElsSW5SZFBmZG05T2podVpMQ3RR?=
 =?utf-8?B?U2NGdHZJM2ZtMVVsVm5IUkgzYUwvVjd6cmc5Z2tEai9ROHhlWHVHdDd2OHg0?=
 =?utf-8?B?VjRFL0tmbjYzZzVPSHRSakprWG5sOU8rOHIrMTdaMGRUdkQ5UktCVkg1dFFE?=
 =?utf-8?B?NEhZOFE1NGpLcTY1SWg3RWVURDZGcFIrM01zV2JPc2ZVUnlvTEt5MDhTRGVq?=
 =?utf-8?B?V0dmRWlkUmhZODc3YlZYejNxMG1KVHVjbU81aGhzUVFBeEk2bVdUTDRPZzdJ?=
 =?utf-8?B?Qml3NGVSSitXNU44ZnpsWU9iaEVkMURqaVRCM0hVWlNjOGlnVGlxNkkxbThO?=
 =?utf-8?B?TjVqT1dSWXo4TUo2V1MzM09tNUlwN3FpZ3l0VExYMnJEUnQ1di9xR2QvK1M2?=
 =?utf-8?B?VGs4dmhSMXVyeW5CZkpmRWhTVjNyRWdvbHN5UWJoRlR1akZBR2U3TnFHb1JS?=
 =?utf-8?B?YW9kRE9GZXRHMkxuL2NYaEM0cmhXOUZzMDNZV3dmcFMyRE5lTXR5bXBJazZk?=
 =?utf-8?B?cGVza0Y4UUkwL2dYS0wxckhwbHpwWjA5V3pGZU9vaTlRRGc0YS9XaXF1aktY?=
 =?utf-8?B?OEFGZ3RRYk5nall0dDFQb1REVjVLTGROdUphTjJpaEIvQUlDdzRXdFFnZjFl?=
 =?utf-8?B?NVFVMFMzMm9nelI2QnJ6R1BEUTdLeEdKZi9RVS9ZUjkxejBvZy9UdkVPOXlC?=
 =?utf-8?B?MWF2elVMbHFWbThERk9NKzhnaXRIMFFjV3FHaSsyK3JqYTRaTmZobm0yLyt6?=
 =?utf-8?B?V0RpLzE0WlIzWjIwdnM0cWs0Y0t0ZGNUeSsrV1NOSVI3bkIvTE5VcFgrYW9l?=
 =?utf-8?B?czhvenZ1YjFva0RUNEovdEh5UWZQNUU1bVNnNzdGODhXWkhWT1ZnV1BWZUlT?=
 =?utf-8?B?dFh6ek9VTlpqckg0YzZoMmRNMEdURldOUHY0cElYZnZyK1NRUWlLME9HUG1E?=
 =?utf-8?B?QkhOeGRodmNwMGtOTTQyNjNuSVdJcENLZ0xVWE0zZ3R0SEM0dEx0em1naXVm?=
 =?utf-8?B?bzcxYVFPc0l3dUQwNW9uWC9sVnVUOHhWc2dITWFEaW1qSTFKNUJsKzlaSjVB?=
 =?utf-8?B?MmcxdVpnSHQxWHl3dzZvY0wrSFpyR21tMnZoZCtGQlFWaG5rbC9pWlBFVlZq?=
 =?utf-8?Q?ab0Ko5KFv7crBN5ZPKw6F4+GRCVmWTCxKyYXomq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(1800799021)(376011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bE5pSzJlUTNtTk14OVJiYWRmRjlvS3hmckRrUDlvNUlNYWJJUVFuNHVSdk9K?=
 =?utf-8?B?eFZCc1lPYmtpZDRTS1gzczJwRExMbWZxbmJ0UVR6bk5saTY1SXcyQVRRYVpB?=
 =?utf-8?B?VVlKMXRmeG5hTE9CaUErdzJONTdNY1l2bGdnVVJ5WFBxbXFqNnluY1l1aHVx?=
 =?utf-8?B?RjZkQjlkMUtzQXluVXNnNHhtYUt0L0p6V2oyZy9GSDRGWFl5N2tJajV6Tmoz?=
 =?utf-8?B?UzFJVzY5UjdkYzZrOExIWXV3WURzS0YydGlkRWRwc3hUemx6TnRuODcvaEpZ?=
 =?utf-8?B?amNGb0V5OVF5cU93dDV1YXlHSkVGMXh4RTV3aHhIenpSc0NxbURqOWhVRnA5?=
 =?utf-8?B?TkpKY1A4bnh4OVhKeUttNE83TEt4SktVWlo1OERLK0xzd25WT1pFNmJ6NUJs?=
 =?utf-8?B?emFnSHJZem1CSk9XUXducEFxQUtRUzNIdGE2NmRwclczVmExeG1KVE8vd01L?=
 =?utf-8?B?R2E2QmE5WHBvSG5Na29aWXdjbWo4djJnMTdnSWdBRk1acTFxVi94QnYrTlBQ?=
 =?utf-8?B?RENtbFNaNVI3VzZxRWlSY1hFRENGT1hkdUZnakpZci9UdUtuR2t5TXdyVjQx?=
 =?utf-8?B?VlNrTEVUVWhpSWVyTEh6R25RQVFNd2E4WDBlc0JrSmljNjdFdFdPVG1OMTcz?=
 =?utf-8?B?VEdOS0pJREdLMG9JREYrTkdoblU4ZXRlQ2FoOVJBTld2SmZWcjdpM1gvQ3kr?=
 =?utf-8?B?VWlxRHd3NEk5dE12UWV5ZWI0YUdicWkvdVJ3NWtyZlE0ZUZlbDRsenhDbFJv?=
 =?utf-8?B?WUtCVEZoN3NQSDl0ODFHcjhUOUtwUU9oNWthR1JoY3o4cWVTT1JPUjRzUlZr?=
 =?utf-8?B?cC8rLzc2dU5zM2U3Y3BqOEdDamNjOFFvb09SaTFKWTdaZTJRM1dOL2U5TTdX?=
 =?utf-8?B?ZlVCSjYrWWpKNWUwSVVOYnBWSVpOb1hVRWo0U1B2MGFIaTdGRU9vdWxySURN?=
 =?utf-8?B?YVZEWHozRDZ6aEU2aW5jTVlMejIvNWdxNnYvM2xvK0UvNDh2S05YSlVjMUFa?=
 =?utf-8?B?bUNDb2xwMlp6aGFrRFNCcGwxT0xZSDJZUlV4dENHWUowQzVEbUNacjhUWVNH?=
 =?utf-8?B?TEFsN0x1KzljeHlXc2F3RG9PQUJlV1RFZnJWYldKMjZJRGoxQUVkTFVVcVdC?=
 =?utf-8?B?UmJuaURUYnFwUW43WTQ3SDMrYWFZSWNlTlNTcDhqdHRFWUwzMkpCbjUyb0JE?=
 =?utf-8?B?OGozZlFLY08xWDZlK1NXYWxxUnRQallCQ3Iwb21MNkRoUlZVZCtBaE9lVDh2?=
 =?utf-8?B?NmIySTkvV2VnSVZqVkk1bDN3bWdnTlRsamtwVW1NbFdmRFFFSFYrbVRHdDMv?=
 =?utf-8?B?aGUvcTN2OXJxdXFMbHBRLytPaHRHMlZTdFlwK05VczdPS0xpTW1KYUhFUFRv?=
 =?utf-8?B?R2oxeDlFdXByYTdCbytyeWlBVkI0cE5QZGlBM2RQcTRKdEtuVFIwQm5VcDRq?=
 =?utf-8?B?RkpnTUxMSzJtemhjZUFRZnc3dVNoaENTc2VmQVIza3JubFA3dllDaUlIV09o?=
 =?utf-8?B?TVNvRExwNEJINm80RUQzSmdxakRhVkpxbHFxbDJQQVZRVk1pMmFkbXhpM2hE?=
 =?utf-8?B?QnZPOElwbkx1cWVGeDNKWGNRcGJwSDlQWDF0dTgxOElFRzl0WDB0VFU3S0hh?=
 =?utf-8?B?TVJmNU1JWWdiSG82UUU0QlBnbDdWT2IyNHZrMGVVWjVXMWJsNmxXYk45UFN4?=
 =?utf-8?B?cFFKbFMyM3U3NW1PMFNkcnJpdys4eUVXOWp0WHBaN0JkcFpFSDJjR1Y5OHVV?=
 =?utf-8?B?ZjhWemptd1RXYmZoRDc2MXJpbVJQbDdTUjJMUDNTWUV6TG5nYkYreTRWRnkx?=
 =?utf-8?B?cmRvL2NwaDJXQUtlODRYMWdGcFREWDZrcWFtdjVQK01rUFBZWTRBMzcrT2FP?=
 =?utf-8?B?Z3dEOFVEalBLSW5GczlOVFphVFhxQXZhL0toa1hHMGZaa2NXM0FJZFEwRjNV?=
 =?utf-8?B?SUkwTHB4bWZsbmZPVURoOXRiK3A5VWdnRHZselpYbjdLRWJtb3IxNHFxWkZ0?=
 =?utf-8?B?Sk9Fc3d5RklTb2hwZ3A0Y1JEbG5icnpIS3JIeWlRNGdMcjJsZlJLcWtJYWtL?=
 =?utf-8?B?SDR0MjNyeHhHV0piSnhEM2pRaFByVWJhN016K0VpUWRwSHBsVGx3dWNJSUoz?=
 =?utf-8?B?Z1d6eHFzYkpIdC9GRHc3LzlQZHNlMHU1elJINUp2WVROdldEMjM1S2VhYzh1?=
 =?utf-8?B?VEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 07746ecb-c828-42e7-c1ae-08dc910b7284
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 09:29:13.2839 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5H93dJlvd3SURwR4DKlErxmU/e9topmkqZBvpVVKiU4nKJbHWX7GkKtyxH5KwsqH+qQ59i6Bs34OTeZOCbh+fD1ind8s+P/E42s/WVukszE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5146
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on śro [2024-cze-19 23:45:52 +0200]:
> We currently do not support changing the engine interrupt enable
> mask on the per-engine basis when using memory based interrupts.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_irq.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 8ee3c300c5e4..ab3d5b7a1e8c 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -134,6 +134,9 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
>  	u32 gsc_mask = 0;
>  	u32 heci_mask = 0;
>  
> +	if (IS_SRIOV_VF(xe) && xe_device_has_memirq(xe))
> +		return;
> +
>  	if (xe_device_uc_enabled(xe)) {
>  		irqs = GT_RENDER_USER_INTERRUPT |
>  			GT_RENDER_PIPECTL_NOTIFY_INTERRUPT;

Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.43.0
> 

-- 

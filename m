Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC3D1C7115D
	for <intel-xe@archiver.kernel.org>; Mon, 23 Jun 2025 06:18:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67EDF10E182;
	Mon, 23 Jun 2025 06:18:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FgECcJxz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 127C210E181
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Jun 2025 06:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750659521; x=1782195521;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0E4I1annTbvb68N3oRP+DOHJ3gxyyEB/yW0fEvgaReo=;
 b=FgECcJxziDxHnwrw4jAZuJ2HqVSnKqxDCAC2QUM5psSZj2AHRzUm4v8J
 4/YqIN3hu4AT7BKOT+ABEMRrbDC11Pry+qm0v7uKA87eVBSg9DPETRCGs
 e4nvIl3JnM5bNOadJ0XC264VEIwR/X9/ENl4NCjH5LUADH7Eqi4eq4j01
 SR7trCqmyOK8Kz4gBwBpAhiKJYf3i0p0lpgC7fHD7GAQyQsX+/vkwlGRe
 WRRaxbdfZEKkMEMpNhBeqwMSbRHOtbll+p4FwnZkp4P/VF0V7EICrXjlW
 3T35cHSFTm4iNpprouBx1lHCsnnxRA6bGtrRoQOTNMlVor43ImnSHB49F g==;
X-CSE-ConnectionGUID: 2DDozB4+R0yUT4B2ALA1bw==
X-CSE-MsgGUID: /3XlQOLtSt+QrCwWn18EvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="64283912"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="64283912"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2025 23:18:40 -0700
X-CSE-ConnectionGUID: C6ryw/kNQHiTPxfJI6cBkw==
X-CSE-MsgGUID: v+6hIoxyR6qFQbvvEuvfRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="155807780"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2025 23:18:40 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 22 Jun 2025 23:18:39 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sun, 22 Jun 2025 23:18:39 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.68)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 22 Jun 2025 23:18:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yh1J8+lZGoJvaAcHdCTU1xBgEIDMBFDcMcbfhbpyuW2WPfraqM4v3d398U332kkezmxgXiN/G6NR1DXPEXTTenq3WMMGu15nfaCDVxWpLvTBcNWV+i3AUtKje9v/i4rCAdWW9ErnNMCjKxOQr8Le6tPX2qADcXof+f06i0oix1b3sxGws+TNkv5UVitaySpyBA9fGX+8tc6ekx2eqqRn2trSiN2ezysvc8a9qADLXOxITcG1S+lOw9nur5KWs7loB3jcg/KE2J2wfI3iscXMkCAERdoOJH0j6JuDp7V2qcr8E+3e1pkuh25n3rrL77WmOoYr2uwEsXE88vTLWRmauA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rau1DN/os6ppnLq3cnq9wWgozRnQfdsnFr40rdl/6y0=;
 b=g8RGhYgLQXXY52u1ainnf/goSsB72uF2+MgHGUscEhZviA9uv6OdpF5FqyJS5YhyH7vXNxvWecVU0dlXCBPLDEavUXKQCOI7iCE4RUdyOW+DdtN2PszENrl7I3XbpmyXzsdg5WP5DBFxo0U0yCOX1yNi3NJpElVAB1QJqSIyjWIEbnImu7mZN8C4DZwcSOrq5Rxkdn6SciKMnlWxmYlooXI+QAeM0KYYIPpiWU1SEM/ckHjQbMj0UniHM3uA5YUWOLbw8DlMfH90suNv9MZgcR4/CR876bVIpo9XT0VagFgzB1tt6HfAjUSsDG+VqNOENZzQfVMR1EplFIg3WN1GPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by CH3PR11MB8436.namprd11.prod.outlook.com
 (2603:10b6:610:173::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Mon, 23 Jun
 2025 06:18:24 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::2ae2:110b:2487:40ed]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::2ae2:110b:2487:40ed%6]) with mapi id 15.20.8835.018; Mon, 23 Jun 2025
 06:18:23 +0000
Message-ID: <068adc36-b013-4fdf-8633-74a8887b3de7@intel.com>
Date: Mon, 23 Jun 2025 11:48:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/20] drm/xe: Allow CPU address mirror VMA unbind with
 gpu bindings for madvise
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
References: <20250613125558.2607665-1-himal.prasad.ghimiray@intel.com>
 <20250613125558.2607665-12-himal.prasad.ghimiray@intel.com>
 <aFjrgNVdY6rOPezk@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aFjrgNVdY6rOPezk@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0176.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::11) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|CH3PR11MB8436:EE_
X-MS-Office365-Filtering-Correlation-Id: 5741512d-17f2-4585-822c-08ddb21dc22d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K1ZpZUYyU252aG1xa3E0aWgxNG9SOXNyMkVTY1J2UmxEa2J0WFB3cmY2Ukhk?=
 =?utf-8?B?WDJZeVppZzhtL0hMekRDMmFLWlMzcks2K1hYcFU5eXBvM2N6Smtkc0hkOTZQ?=
 =?utf-8?B?aUIxQmJCTkVQb1BteU1tZ2szcmliOStPWFhtdWNFME9ZbkJ0VUs2dTNZMkNh?=
 =?utf-8?B?b0cwaVVHWHA2UWRreUFmWTJZVzBUQ040ZTZ3SHZjNnBTOERncTJuQThjWFdL?=
 =?utf-8?B?bmoyY2cvZUdaRUxMeDBFbGZUNEptZlY2NE9ZR3NrSDgvRjR6Y0F4STFNQW9B?=
 =?utf-8?B?YURrTnM0V1I3ZjR1a0tlWkxFY2JYU2NNRnNxN0xBTkRTemMxSGF3aTl5b3Br?=
 =?utf-8?B?UCs1b3RBNXpkOVA4NmgrZkJHV0JkbUh2aElta0hCcVFUT2EvTHZBYjFzVSs4?=
 =?utf-8?B?MFpCTm5HM1ZvcktpNEkzc2JNd0w2cHdONVlZT01USHlSUDZTU1kvTUxHRm55?=
 =?utf-8?B?S25BTFF4NWgyTkxTOWxuWWJaOTMrcDhYc242Z2J6L2U1aWtNTnpPcUptdzNL?=
 =?utf-8?B?eXp2TXdYVUo2azJEN2VIdVU2NndOL0tKdUFiY1ZMZGhWWEhvUm1hWHFqTUFp?=
 =?utf-8?B?Q0UwV1pUazBGZloxT2N4TFlNZGNtV3JwRGFkdDJENmlYb2Q1TnBjVHd0NFRl?=
 =?utf-8?B?bTNWNGdjTHhPUkR1NStWWUpRVmx0TWRUb2E0OTlFOTFBcmpCcEYzUDlZV3g0?=
 =?utf-8?B?NzRyS3lobUEzYXU3Um90cUtDREdRTFcxVDcySlRLTjdhUGkwRVdnTjRLbHZq?=
 =?utf-8?B?NE5xYWN5NVpjeXoxbFk0aGllaHMxcDlLbXBvcWxUckVTUEJrN05rZlFsWmh6?=
 =?utf-8?B?SWgyT0Nuc2dWTURUcCt4Qldzc0J4ZlBsSlhFenZkeEJZU1RjdWtZS2VJNEFP?=
 =?utf-8?B?UFpNUjE4VW5IQmMrZ0J1dmR0MkxIRkV6WTlwL1BqanYvNUl0Q205bzVGS0VL?=
 =?utf-8?B?cmpqaWk1Wmg0dGFRK2ZHUzhmblhtTVlWOU1QN3hjN1kyWlUrUDBoTU44T2w4?=
 =?utf-8?B?WTVTNXQ3cjd5VmxLWk9GTmJESlk4MmkrZ3hQTEprL0V5S3dYc1FlMTVDSXJ5?=
 =?utf-8?B?d1BRRWJuSVk3eUFpWEsvZE5WdktNUUpiRTEyejd3dEx6UkIxeVEybThPMStM?=
 =?utf-8?B?RWJaWkF1ckU1VnlDZ3k0alRKZGwrZERyZzQwMXdBSXNBeTZKWWZONGU3Ly81?=
 =?utf-8?B?STRDUmFKYVNsU2ZuMlFmZWh6NjlDZ3FDWll5NG5qU294d3BkenpVcC94SlZX?=
 =?utf-8?B?bDV1TUlOK2JqQ0R5NGt5Y2ZSUis4dHJVckQySStKazZWOHlvUy82QTNPcVdT?=
 =?utf-8?B?REJrbXdESzBSRDFSZjlCUDVNdzFpTURVeWZSQzlwQ2ZRdWhzTVBmQzZoY3hK?=
 =?utf-8?B?bjBsL0J5UlF2R21oNW51RTZhZTQvMkVQVnY5bXRDajF1dTNoTGY0Z05qSzRy?=
 =?utf-8?B?V0tmcWp1cVMwaTVNKzBaMk5DQkdPUmd5RmRKcmFGUUtPRkZKZy9RaGlHQzZM?=
 =?utf-8?B?bHhCUmxqZHVxSGxJcytPelp3ZExZVzFBSnlhTlJ1ZlUyMmFpemVxRndtVitv?=
 =?utf-8?B?NXNDNjQzZzVEd0NBSExudHdtYnZIcDNyaHZHdmdkajkvelpMbEJpMDZYQkRv?=
 =?utf-8?B?VHVOREtuQnpFZWtuWDZNYjFNbzQrY3ZlQ1RZYllhY1ppTHF4VTVwdm85L3R3?=
 =?utf-8?B?K2ZPVlVRbFg1RStVZTI3QXRrUnBxVklQbHRXYmVmL0dtanhyOW42YkhKQ2l1?=
 =?utf-8?B?VVF0UmtxUHZkVUxvQlFUckhKMlBNRDNZSElJZTgvVWJCUld5L1NUcWgrR0Rn?=
 =?utf-8?B?bXFzVGJOa3lldTNuR2o0OVVvSGM2dHVqdGFRRkxPOUdBQm5HblZvNHRocExK?=
 =?utf-8?B?YUZKd1hZUktKVHVrQy9sU2ZxaXNzbWJuZ2xFa1lMNktDNkRvazh4b0JjMHVO?=
 =?utf-8?Q?N0UtLqlvdeA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUppR0c5a2lWRjhkVFp0YjBDRkpRbjkxNUxEU1F2V1lYZi9XZllCZTFUeHVn?=
 =?utf-8?B?VndyNVEySk5WTzlTQzYyejNyVkNhSnQ4MWlZMzBFZ2VMSW5xMCsyUmh6ZTJz?=
 =?utf-8?B?T1ArRXlJZzljZWRNMUsvMmRXSnh6bldmWnZEcWZrVEllT3ljM2VxRW82MEJP?=
 =?utf-8?B?b29NTzhoVlVVWlhzZEdpU2NsUU5VdFo0dlRzaHZad3VUWmttV1hUa25KU3lY?=
 =?utf-8?B?anVXajNudVJmMTdWSE51TVRRYUdxUnZiQUFBT0hpWHFPSGNRQk1aV2pZY09s?=
 =?utf-8?B?WFlzenFwaVVMc2V0dTJJdG9Kc01pRWVuYzJkbU9QWWo4OWMvVHpPQ2g5cEx2?=
 =?utf-8?B?OHRuZWQvVTJDdTcxQXJueUxkUmYyUGloK2F2bllTRThCWHlzNHc2UHgxMmwv?=
 =?utf-8?B?RXdFbnpKVVBpZUFLanNWVEczQ3gzQnBEWFFlWkQ3WDh5WDk2cE1WcnhKa1R2?=
 =?utf-8?B?ZEJjWVJtV1oydVdmY1VCUDcxYmkxWTYrY3hzdDNyNW9GcDYxQk5jUW5aUy9K?=
 =?utf-8?B?WXprRGFqQXhEQ2N3aGRHdFR0UFNqOG9DZUk0RlpuK0NyYVowblRxNnBUTkF0?=
 =?utf-8?B?dUxTUENPTSsyMGU1azhVa3pYa2xWRHFlUlVJZHN5SGRhTk1DcWVMRU9ZQ2ZM?=
 =?utf-8?B?all5U3R0QUQ1UTk2NmJaRytwVE9aRElNRlJlZi9xVXo1eDRBNENxZmVGdFZH?=
 =?utf-8?B?eGNidEVIZkgxMVlBTzZETVVwLzBsdGJGQjNIL2NnWVRDNllKd09ycDlBZ003?=
 =?utf-8?B?M3lhTW1kRkQyZWlzY3lJekx4V0JSRlQvYjBTMStHTmhwMFg2UUFpaCt1b01R?=
 =?utf-8?B?bENtYWtSdXlYTlFhenFYbklOWGpQWVhXM0hPK3FFd2tiNHA0bC9zMmZHVE9x?=
 =?utf-8?B?b0VIRGNweHV1WGg4T2s4TGp2WFZ4MVJuVDhhUE5tV0pEV1lSNFI5WDRITitj?=
 =?utf-8?B?bjVSZ1AyTFNtTnoxdkhtNkJxaC9WSnRQZnlib0NKd2x0UWUySk92cWFreDVY?=
 =?utf-8?B?Y2J4bGVodHZQVUJtelFKSmZMTm9vVTRzNEE1cWQyUEUvaGdONk5iNHV1aUMw?=
 =?utf-8?B?dWwzb1ZPNnJ1T2xQK3FZOE4zVlBFQXlCaHFNeGtEc0FTWW9vd1UzK3VUc29O?=
 =?utf-8?B?ZjdiZGJ4cEkrWUJVQ2VKQytTN2h0SmdPb3NPUmpxUGtaY3JuTUZNSktQajla?=
 =?utf-8?B?bVdieVVDemQzWWhjbG81YXRmYmxwR3RDV1R6Y1duZWt3QXBoVHB2VkYrR2Ft?=
 =?utf-8?B?UGR6MytuNUF3UUp2T01LbmJjUkZsS2JTOGNCRCtsSS8wTEtrOE44WG1pS01r?=
 =?utf-8?B?UkZLQWhoQ3lENjdFOE9MRXNWR0lXM2J1ejdUWm9VVEFIUXRoYzRMbVBpY1FF?=
 =?utf-8?B?UGM4VldHdGYxTEZhU3JiMTN5Um5SU211S1dldE5STU0wZ283UHpTM0xUd0lv?=
 =?utf-8?B?WXNRZFNOclByUzFUSW1KSjlCdVYzU3hDdHJyQ0kwa0k5SVE4TVNjc213aEFH?=
 =?utf-8?B?QW1nZnFrdWs3TEJOR1pOb0VNeWhhY3FQdHRsYnpPRjNEemlBRjYreXJNaGdR?=
 =?utf-8?B?cnNNL1dqZ1FOenF6dkhmSC9ZcmRJa09KUG5rOStXREprM0lZR25xQXRRQyts?=
 =?utf-8?B?MmVQU3h3ZDg5dlcxSEVuSHR4NEQ4RUdJZ0VqdUVCVUhKN1grQ0NhelRSV3pk?=
 =?utf-8?B?T1J2YitkdVVodUNuRXJjK1JreHhEaTlWejdabTV1WGd1K0pTY0kydU9RWkt6?=
 =?utf-8?B?ZTRNZ3Q5TjJCdjA2Y1BDdVoxTnBIc1JTaHl2OFE4SXRXQllOZ0Nla0RGelZI?=
 =?utf-8?B?TURUcHc3VHFpWE80WkpEMng0Z2R3MG9vUzU2MTBIblhFVDVCbVlBQnl4aGVY?=
 =?utf-8?B?T3RBQ0FBNWVQYW5IZ0pJcEx0YTFEVEpTOElDZHFpcmloQURDSzlSQzdnK1Yz?=
 =?utf-8?B?ZlBhUmlBb3VZbUt1NElTNGl6SVNQbXc4VTZxcVNBN0Q0SWo5Nk1UWU1JSC9V?=
 =?utf-8?B?dCs4NDQxQzdSVGJPNmhraUIrTHJHMGNMZGZ5V0t2Q0cwcFptOEU1d3h4aHIy?=
 =?utf-8?B?SEc2bS9HQjl1d2ExZGxxSGpmbVMxR0pnTGw4aS9Gd29DWk5SV3B2MHhCaUc2?=
 =?utf-8?B?MWpJd3M5QW11NGVVTUJ3WGRuN3FJRnY3OXkxSXZIUHNSUnRxWS9wN21ZdGVJ?=
 =?utf-8?Q?EXLDjiQaoFT9try3xSY5ddU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5741512d-17f2-4585-822c-08ddb21dc22d
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 06:18:23.8852 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZxG6V+jBy6RfLlDw8kH4K2HT5D9xSrAAuDYNz91VHZBZbekVFOfiz+2N8/tdYLK1geWxFHRjIBh/B4tzmN/9fYXFwaHtSVo4ZkmOSYxhfKs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8436
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



On 23-06-2025 11:22, Matthew Brost wrote:
> On Fri, Jun 13, 2025 at 06:25:49PM +0530, Himal Prasad Ghimiray wrote:
>> In the case of the MADVISE ioctl, if the start or end addresses fall
>> within a VMA and existing SVM ranges are present, remove the existing
>> SVM mappings. Then, continue with ops_parse to create new VMAs by REMAP
>> unmapping of old one.
>>
>> v2 (Matthew Brost)
>> - Use vops flag to call unmapping of ranges in vm_bind_ioctl_ops_parse
>> - Rename the function
>>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_svm.c | 27 +++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_svm.h |  8 ++++++++
>>   drivers/gpu/drm/xe/xe_vm.c  |  8 ++++++--
>>   3 files changed, 41 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
>> index 19420635f1fa..df6992ee2e2d 100644
>> --- a/drivers/gpu/drm/xe/xe_svm.c
>> +++ b/drivers/gpu/drm/xe/xe_svm.c
>> @@ -935,6 +935,33 @@ bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end)
>>   	return drm_gpusvm_has_mapping(&vm->svm.gpusvm, start, end);
>>   }
>>   
>> +/**
>> + * xe_svm_unmap_address_range - UNMAP SVM mappings and ranges
>> + * @start: start addr
>> + * @end: end addr
>> + *
>> + * This function UNMAPS svm ranges if start or end address are inside them.
>> + */
>> +void xe_svm_unmap_address_range(struct xe_vm *vm, u64 start, u64 end)
>> +{
>> +	struct drm_gpusvm_notifier *notifier, *next;
>> +
>> +	lockdep_assert_held_write(&vm->lock);
>> +
>> +	drm_gpusvm_for_each_notifier_safe(notifier, next, &vm->svm.gpusvm, start, end) {
>> +		struct drm_gpusvm_range *range, *__next;
>> +
>> +		drm_gpusvm_for_each_range_safe(range, __next, notifier, start, end) {
>> +			if (start > drm_gpusvm_range_start(range) ||
>> +			    end < drm_gpusvm_range_end(range)) {
>> +				if (IS_DGFX(vm->xe) && xe_svm_range_in_vram(to_xe_range(range)))
>> +					drm_gpusvm_range_evict(&vm->svm.gpusvm, range);
> 
> I think you could use xe_svm_range_migrate_to_smem here but also I don't
> eviction is strickly required here either. This akin to a partial unmap
> and we don't evict there. Any reason that I'm missing here?

If previous ranges had devmem pages allocated, and eviction did not 
occur, subsequent VRAM allocations for smaller ranges were failing.

Scenario:

A 2 MiB range existed with VRAM allocation.
A madvise call triggered a split, invoking xe_svm_unmap_address_range.
Without eviction, the 64 KiB sub-ranges failed to allocate VRAM during 
subsequent page faults.
As a result, bindings were being forced from system memory (SMEM) 
instead of VRAM.
  >
> Matt
> 
>> +				__xe_svm_garbage_collector(vm, to_xe_range(range));
>> +			}
>> +		}
>> +	}
>> +}
>> +
>>   /**
>>    * xe_svm_bo_evict() - SVM evict BO to system memory
>>    * @bo: BO to evict
>> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
>> index af8f285b6caa..4e5d42323679 100644
>> --- a/drivers/gpu/drm/xe/xe_svm.h
>> +++ b/drivers/gpu/drm/xe/xe_svm.h
>> @@ -92,6 +92,9 @@ bool xe_svm_range_validate(struct xe_vm *vm,
>>   u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 addr, u64 end,  struct xe_vma *vma);
>>   
>>   u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end);
>> +
>> +void xe_svm_unmap_address_range(struct xe_vm *vm, u64 start, u64 end);
>> +
>>   /**
>>    * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
>>    * @range: SVM range
>> @@ -312,6 +315,11 @@ u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end)
>>   	return 0;
>>   }
>>   
>> +static inline
>> +void xe_svm_unmap_address_range(struct xe_vm *vm, u64 start, u64 end)
>> +{
>> +}
>> +
>>   #define xe_svm_assert_in_notifier(...) do {} while (0)
>>   #define xe_svm_range_has_dma_mapping(...) false
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index e059d9810d26..0872df8d0b15 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -2663,8 +2663,12 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>>   				end = op->base.remap.next->va.addr;
>>   
>>   			if (xe_vma_is_cpu_addr_mirror(old) &&
>> -			    xe_svm_has_mapping(vm, start, end))
>> -				return -EBUSY;
>> +			    xe_svm_has_mapping(vm, start, end)) {
>> +				if (vops->flags & XE_VMA_OPS_FLAG_MADVISE)
>> +					xe_svm_unmap_address_range(vm, start, end);
>> +				else
>> +					return -EBUSY;
>> +			}
>>   
>>   			op->remap.start = xe_vma_start(old);
>>   			op->remap.range = xe_vma_size(old);
>> -- 
>> 2.34.1
>>


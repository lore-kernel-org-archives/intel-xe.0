Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF47D0EE05
	for <intel-xe@archiver.kernel.org>; Fri, 11 Oct 2024 15:44:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDD0210E114;
	Fri, 11 Oct 2024 15:44:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gHslUDHN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 680B810E114
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Oct 2024 15:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728661452; x=1760197452;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sENFTi+9GKO/now6s1I4O+D7hsxQChR2kstqlBmxU4A=;
 b=gHslUDHNMxhcN1O/L9jWlOp0klnVhHgkJ8xSxmL/uN+3T9CULA68saUv
 kD3E64KerMuo0GumLC9cklXoNexyQ+RpnqGwe1lj7Yr0XBz5SldPExYQR
 wD7hg4siZUDRKKLg+2ElqL9oisDysZjP6O2IDF6kkZCmahQLLzxd9O4Lk
 l9qrl+YGmrOGyLJFAFh1snZYrZeVzNqtSh54+37k5XRTUTDPYL/lZJwAN
 UT3oLcgUQV9ZDNZBNeVjegjXY5QnkIaH7gYiT0p0Z8OEFXoYyy1wgVKmr
 qPp4bdZ5EfBQEq07qcKHlB3BKJBQEqM1OgDBbQJydZEpfQFczl9SbjIDp A==;
X-CSE-ConnectionGUID: y3I5jFgJQpm59mwxouA3+A==
X-CSE-MsgGUID: aeEls9TLQdeuYucmdmulQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53471458"
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; d="scan'208";a="53471458"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 08:44:12 -0700
X-CSE-ConnectionGUID: FYqbCdTsQjuylhrUS9H0qg==
X-CSE-MsgGUID: SbJVl0bVRQmAzQyLHIeyZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; d="scan'208";a="81728608"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Oct 2024 08:44:11 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 11 Oct 2024 08:44:11 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 11 Oct 2024 08:44:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 11 Oct 2024 08:44:10 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 11 Oct 2024 08:44:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JOLnrb6YaL+t35S4AZ61tmKKYdZ49YadVgxl3ZS+QfMBPncvM0OYyUrpwFvGnVBY6Swli28q/EpY22KGZikJgb3+/mjUpn2eEo7fTZx1I4ZeaO3bg+LUdZgrmUSr4O8ZshBMgmYlR7xvq79akzv/6QBgdaVpe4w2in3jEV8DnwRCXTc5vz/PafDZKINd0nJRTIv4lm+5+ZHqJWAH+wiqr2PC/+TMYECyqS6GZ2ICvO+dvtLFqe3vkIGj0tYM9AMEMXgLp+M1ODeGt3epfl7NB9PSAixQYTEl7oxUE5tmWSQ8ywiYpQ2Mom5ui98lTTO60zJHA1Rm3MT2V8JYvDWJxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sENFTi+9GKO/now6s1I4O+D7hsxQChR2kstqlBmxU4A=;
 b=tkBOHnr5ywzbRYuMo8QF3GtoqXnT8Jv4NLMH2xlD9Sdp52k/cTdD/rOanvE2Mnt8OLZUUyA7HRKJXyrVUkxPRKeG30ISdTIFJzodD1sjnGNaUjbT6CGmN8usM3kK7IudUIkeAAMRre90CHyXw9zmWpetOcSiuv5Yaa3YzXMxBblxNcQ3795KfM720dusKCf7DRGVhOVPf28axpRkY4ZeflvX7MlEBMc9/R3Qj9d7vEZvEE0amPU58hlmHzYNkV+UzNIb3NoYaWLns3jaAwErmR9NynmR1uaJisUH2GOQbu7u3FfI6DhTv/20FSmcGfd+rSqfvOpxJLwwHCcoUh2XMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 SJ0PR11MB5151.namprd11.prod.outlook.com (2603:10b6:a03:2ac::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Fri, 11 Oct
 2024 15:44:08 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%5]) with mapi id 15.20.8048.017; Fri, 11 Oct 2024
 15:44:08 +0000
Message-ID: <83c34df9-5c86-43f0-a029-786f0170747d@intel.com>
Date: Fri, 11 Oct 2024 17:44:03 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/ufence: ufence can be signaled right after
 wait_woken
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <stable@vger.kernel.org>, Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20241011132532.3845488-1-nirmoy.das@intel.com>
 <07151ff0-90b1-4ec8-9f64-f695fb411dbf@intel.com>
 <0e96d34e-1204-4208-bab6-5b8f585e672b@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <0e96d34e-1204-4208-bab6-5b8f585e672b@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL0P290CA0015.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:5::7)
 To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|SJ0PR11MB5151:EE_
X-MS-Office365-Filtering-Correlation-Id: a4f4894c-b8e4-467b-bfa0-08dcea0b8b66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cmxWVVI0N002a2tnV3o2R255b0xuY3lmbTlsT0ZrUzBjVWlLR1NUN01KYlBl?=
 =?utf-8?B?T1Jva093dld2R1o2V2RqZDJNUVRIKzNycFdJZFRZVUMraVcrcndSQnJ5VUFR?=
 =?utf-8?B?K3JqeVNpREZrTy9GS1NjTWN5aEw5Ujdndm5lYmZ2SDY4VWlwTEs1MTVUcGJk?=
 =?utf-8?B?b0Q5S1c4RjhZUUR0eW9yaUp0Z1orWW12dVA3NXRNSkFCSGRaTW9aNWpwdjIr?=
 =?utf-8?B?WUZteDQ3dmZBdHozK1pWKzcrWlJaYjJYdk1VbG1XYjFGWUtkY0t0eTd5SS9r?=
 =?utf-8?B?RUU1RzZ4eHFwZ3FDckxTR1lzWnUvb1FkeGpvSDVGb1ZEMXBPc3hSMVhnM3hR?=
 =?utf-8?B?bFFnd2hnVEo0WDFDVzBTYTRmcWpYdnB2c2JXWjVmMjVrRitIR29XaHNCY29T?=
 =?utf-8?B?ekJ4ZlBOU09VK0dqZUsxNkVUK2JHcFdQL2dIdjFWajhMZ1hPaUFVOHh6QXNs?=
 =?utf-8?B?MDdMVXlacXRIbHNWdnpTeWdYNEVwQ1JLT2dQWCtKSUJVNHVRS0lVcDg5dHRo?=
 =?utf-8?B?WEp0R05tSm4yZ3oxOWJ5akNuZE9ldmlia3NOUG0vbEFBN3Y1R2VCQjkxUTIy?=
 =?utf-8?B?MkJOSDl1NWR6Zzc4QzVRY1FVZWcrVThWR0JUanIvSHYrZjVCT0FlcVBtdW5q?=
 =?utf-8?B?NzJxYWNYWWU3VTAzN1hoR0FXMnpIbjJsTXFvVE91clZkOXZBVlB5NlNGcnZI?=
 =?utf-8?B?dHBkMGNCRm82b1prVXFsT2E3SDMvZEhwUDY2MjVDRTJEZEQ5T0FTdWRnMDVk?=
 =?utf-8?B?T3A0Nm9KTk9kdXdZa0lTRW8raHRzSThyNGxOdVVIYXloUWQ2TS9aZ3MyZitw?=
 =?utf-8?B?NGI4Rk1PSXhNZFVvMUM5c1RiT3F5K3FPaUJXV1MvUExxazEwL1FhR1Z0dDFT?=
 =?utf-8?B?QWVaZFNyQ0h6c0JXRjVReUk5QlVZdXR3NkRwdUNjbFBxRzhXWVd6ajF6TjFY?=
 =?utf-8?B?SzFvc0Q4MGoxSkIzZGY2ZDBXeDdXVjZUa1FvTk5qTkNVQm1NZVN5M2VBd0th?=
 =?utf-8?B?RkxLQ0hNc25qTVNENnlsbzVYMjh3ajdROTh2S2V2RC8vRFA5a1hNNFlyRG82?=
 =?utf-8?B?R3g3ZTZON2gyMFE1WnhGM3ExUlMzWXF3LzQrditPRjRxMEM2N0RMVXN2c1Bx?=
 =?utf-8?B?WWMxcHRRQnpKTFdDRW50TjU5VjllQ1h1aGlPa1lyUnF1bmoyenA4bnA5UUdw?=
 =?utf-8?B?QWJIWFl5c21lRFpTbEJlWFAwelNpaVNnTVFiQmkrMGZZVTA2dlU0T2Z1aVB1?=
 =?utf-8?B?M3ZFVjZmYzk3bFdpTkw4Zk9jektYcWdWNUowZDJhT2lpRmJFYlpza0V2Nk5t?=
 =?utf-8?B?bW05V2cxQWJjOEI1aVNGL0hpZStXL3BpbHdzUnZoTTllWk5QazQzSGVoOVZQ?=
 =?utf-8?B?TjdhNVVuQUhQTXIzT0wrdU9ralVyTmltb2pLMElmVVZVWUtVRUZpMU5mRU5D?=
 =?utf-8?B?b0d5bGRwNFkxK1hSRkZSWkEyUXNmMWhZbG1qYTRScGFmbE55MVZISHhxOGZV?=
 =?utf-8?B?SzIzT3dYaFNTUkNiQzZiQTFqRXBSSGJYQmxHS3VzODBQWGlRS21rbHBuMnFr?=
 =?utf-8?B?RUlGUnF5azA0bnZuZVdsYzhRcU5wUkFSSGw4dUxacXN4bTljaFNscGE4ejdo?=
 =?utf-8?Q?lXCSAqDnGjlZAYzU1IIneK+aeoLXe3/l9kunDXqgFnac=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VCt4V091aWIzTk5EQWhjZmJCQzRoZjl5NDBJUlRocFdXUGprTTJHTjFBRVp4?=
 =?utf-8?B?cVlsczFMRGl0QXB6eGZsTTVmOFd1dFAvaVNuaU84dEY0ajJRUzVUb3V0QXBl?=
 =?utf-8?B?YVlQTFJ2cVgvNGVpa0FnY1dyczNuaTZhTk55RW1PdTFzUkE2TVRjOXdVcjZL?=
 =?utf-8?B?NnVmSnlsL296R2VwUmpFakxWR0Z1Z2gzZTZsWWdOL3k4dHo1SUlnZ2twTE9X?=
 =?utf-8?B?YWg0RTY0aTF0bzdYRWNGM1VQbXpQL1BuTy9CaXJhK0xFWWdaOXFkaDNVd1ov?=
 =?utf-8?B?Wks0T2kvMjdUWUx2VXpJcjNMSXF0Ym4wdVlxeWdsM2VSNkFkWjl2Wkt4WTVF?=
 =?utf-8?B?ZGRkK1dxNGk1aDB4QlQ0VmtoVlNtcTBmaHNEOVczNnVGNFJvT3AzNWxlMVA4?=
 =?utf-8?B?N0JwUDJBUHdPemFQOG52NnNHZHlwWlRibmJmOHB0MW5QTVhkZzNGZEJsRE5q?=
 =?utf-8?B?QkxGaXFzQWY2Slp1Nlk2d1E1SWZJbHFyU1ptNEppc3dmNytSMnNUYjZKekJw?=
 =?utf-8?B?UytrdlNOQ1R4TGNZdjFOV0trWGd0RVcyN0FPRTV2VS9MSElvOEpmL2cya2RJ?=
 =?utf-8?B?RENybER5cHdQOU5yNERjWDdqa0oxbHRsQ05ETVZ3UitoSTdYMm50QXh3cmgy?=
 =?utf-8?B?K0kzaTBWSmF5aXREWDE0eTMwTHNiTzdKem9DSms0Vi9sL0xPYXFSWXM4SE5C?=
 =?utf-8?B?V2VxcmRVMGdhY1JDN0RWMTRZTHNPWDRNN2pMa0lHczhNZTBPVXhSVXFkZGFv?=
 =?utf-8?B?R1N5QUx3WjNhVVdhUlo2MTZqTDZDRUxsZFFWZGdyZ0UzQXVWK0ppNlFKdWI1?=
 =?utf-8?B?cHJ4T2RKMjRrUjlTbERZbHNPWDZGNjF3cHpHdHBtMXJ3TGRtRXhNZ3Bkdm5y?=
 =?utf-8?B?bFd1d0NlUjJpY08xMVoxb0d0SCtKZWhPZWhrNXN3V3poMkdSd08wUUw1WmVv?=
 =?utf-8?B?dHFaK05tdUNoMWVCbUNQeG9MeHpETlZQSEl2TVpFK3VQME9RRjVObmVMSmNr?=
 =?utf-8?B?d3pPVDh3bmlmREt3NFN3dUlFWWVjL0VMWVNrcHY5TVRRTXVsSXNZenZWK3ZC?=
 =?utf-8?B?dmEzSTZzVkdTMHR0Z2lxY3hhckhicmx4bU1qamZCQXZOeUVscHdxeTNPVjU2?=
 =?utf-8?B?NXhvZXdqTGVndElxVk4ycGVraForcG9RcEV6YWx4cWxDN0FBTDJGZkIrOWc5?=
 =?utf-8?B?K3RBd250enlaaHFScEtMYlZzNlhHcjlzNFczdFg3V2QxUkFQeU9ETHJHM3NU?=
 =?utf-8?B?ZDZZRFVhYXBOWWttY1Nha1VoblFxMkRmbHBZUHVhV0JRbFhRNnBqVG5FN0lN?=
 =?utf-8?B?SEQyODdBaDBidHZsb3JVU3lDNllxa0EzVFF3Ym1LTHpDQUNvU2RGZCt1Rk4v?=
 =?utf-8?B?TkNzVEN4QmZBc1IxQUxac0pOTmg5aTltYW5VUDdwTnJ4bU9PRDRXK29IK1lP?=
 =?utf-8?B?OUZrUkVqTk5XeHd1RTNOQXlMYjI3QnVKS2RqbDhKMTMwbmQzRlNlOXYwNWty?=
 =?utf-8?B?WFlxZUhlcDRtQVJXQWZqaEdreWtHVU96THltU3M1Q013RjV2dmgzK2NZNjJX?=
 =?utf-8?B?UjlTWXAvVG0zV2p4RU1jbVRMUlZkalVPWkNuTTZKaXgxSWNCS3VHMSszM2x3?=
 =?utf-8?B?cVIzSVFUTmlBckc1aHpqUzg3N0w4am9pVlkvTUhGMlUwK3ovb0ZYUG9YeXFF?=
 =?utf-8?B?Y0hGaDdodWo2Yk1KSWJlektaUEZvcTlKNm9HMnZUc01sdkJrcXA4d1NGRXow?=
 =?utf-8?B?UjJ6THM0ajB5czNzWmFTZnJFNlZqc1kwRFdIRFVKcEFhUHhNd25pVGx1UFhj?=
 =?utf-8?B?Q0xWbGRGZGRlTnNKMms5UEtPN1FPRU1ld1gvcEZOVCtJWmtlUjNSZEt0RzZn?=
 =?utf-8?B?TWM1QlBTZHllaEwrSlpXUmx2M3YvWFdhYnlaaHdGZjVMdUY3VXBxNFA0QWxh?=
 =?utf-8?B?TmI0a3dkR1NkSlFpSmYzaVhydTRDRGxZWHd4KzBLcnhBdDdvWGh4SlZnOWt5?=
 =?utf-8?B?Wk5qM3M3RmNDOTI3K21TUGFHMXBrSi9QaXQ3WDB0eStWQVY4bGRxZ3dKd2Yx?=
 =?utf-8?B?RkMvbS9WOWZrNFpxMEw1MTlCbDUvWittUXJLaFhQWHVJRTNtNk05dmZnY2x0?=
 =?utf-8?Q?1oq1jWpf3q7KR/KKs38UmSFZf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a4f4894c-b8e4-467b-bfa0-08dcea0b8b66
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 15:44:08.6655 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iR5YOTLJyYkEqbhAMDRXyAh4YZR9SWl/NpCfdwlTKdQc+UBmXrzRNj0EwHDdJwT+VxcBubIpgwOg6zTzrGK68A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5151
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


On 10/11/2024 5:16 PM, Matthew Auld wrote:
> On 11/10/2024 15:10, Nirmoy Das wrote:
>>
>> On 10/11/2024 3:25 PM, Nirmoy Das wrote:
>>> do_comapre() can return success after wait_woken() which is treated as
>>> -ETIME here.
>>
>> s/after wait_woken()/after timedout wait_woken()
>>
>> I will resend with that change.
>>
>>>
>>> Fixes: e670f0b4ef24 ("drm/xe/uapi: Return correct error code for xe_wait_user_fence_ioctl")
>>> Cc: <stable@vger.kernel.org> # v6.8+
>>> Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
>>> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1630
>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_wait_user_fence.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
>>> index d46fa8374980..d532283d4aa3 100644
>>> --- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
>>> +++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
>>> @@ -169,7 +169,7 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
>>>               args->timeout = 0;
>>>       }
>>>   -    if (!timeout && !(err < 0))
>
> Since err > 0 is impossible, this could be written as: && err == 0.
>
> So I think this is saying: if we have timedout and err does not already have an error set then go ahead and set to -ETIME since we hit the timeout.

This is the issue here. This assumption is wrong that if timeout happen then return -ETIME even though the fence is signaled.


> But it might have -EIO or -ERESTARTSYS for example, which should then take precedence over -ETIME...
>
>>> +    if (!timeout && err < 0)
>
> ...this would then trample the existing err. The err can either be zero or an existing error at this point, so I think just remove this entire check:
>
> -       if (!timeout && !(err < 0))
> -               err = -ETIME;
> -
>
> ?


Yes, this works for me. The for loops sets err correctly even when there is real timeout on not-signaled fence.

I will resend a v2.


Regards,

Nirmoy

>
>>>           err = -ETIME;
>>>         if (q)

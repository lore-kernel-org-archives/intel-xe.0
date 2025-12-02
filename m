Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C027AD12675
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 21:42:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8064710E69D;
	Tue,  2 Dec 2025 21:42:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j8coV0ik";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3828810E69D
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 21:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764711763; x=1796247763;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=+eTtYNk4nmXIYodrISSHUkR9w/FRF4kMbUWWyoK/knY=;
 b=j8coV0ikPOTY1P3Ra43QyP+zBh1tC6QSFFGCLEjY3AqjAkEKOtINlN+7
 vnwjaL5GIlzTk18UPRHoTfOV0QykVI/gBXTkPJJG2fzL8Nz/5LikrTsQW
 aGqiY89hNWXJ1tDwo1fw6Yq0It30b2VL2jw9tK5opa1vnspk6+u3pcXU5
 kLGuoClcKs5LNnSwmRkpx0KuqN8rv+3zVCa9R3kNvviR0SCcO+CTPwend
 3ES4vzIJb+iPFp9HK5gFtFt4jolFoemrY+uiDiZin+8uUKkAM7JKxKScu
 2oFsWuCmCkk+BXW5m4VwbSE1R4fWCpNjt+TrKLxPBJFO6uW3uDue8Dzw6 A==;
X-CSE-ConnectionGUID: xogNBzobQcqhlfyhSTQ5XA==
X-CSE-MsgGUID: uDguxR/dTTmKNf+YU2aLnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66735401"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="66735401"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 13:42:43 -0800
X-CSE-ConnectionGUID: DN66Cg8ASCOZZlR7kvzRGA==
X-CSE-MsgGUID: nwXVVJEhRA+c3eCaRW4fzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="225442606"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 13:42:43 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 13:42:41 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 13:42:41 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.40) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 13:42:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FeFSxvG8bsBYGR/AyEVI0yBt9JheZci7Y5UbJEjtqw+6P0rxkM4sWz57XIC1sxLcq7Qyxkr0zmuTXKHvWAUOQaV7z+qL7VQxcfSCxn7dbjloj3tiVc9onoFfnQIbNszrLY8Zvw4fS8U3blJ6MnhSSrM7U08kL6yb9DQ483vdNQ1Cm34J/Dh3fx/s93tCwyN8MCRWnWz/1TJ8TUbLiIAcyfAihuWDKHu4p7ntCFHEncr8WBQY6gl9kDCvlL08bcOgJ1KLA4VXWUZ5LdLRP23A12RmV7m4OEo/dXnldpDZl8H+EOAWspvpyUEczmazymsLdrMoG0eb5EvA9W3XaoGIyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vLFipihDtVq1tpJLy18cNMwN+0OldWW+pohdmxZjoqs=;
 b=q3deU2drNg9ivWS7eWBBBdILItNOPm93rD01aOxFH5CdkPMIoqVS6Bygg8UgqOXtS9dulB04D2KpnFDd4A+sqlztWyndZ8kfY9sgPimOVeMZYGzV4tcTLmEaZLItJIsdu0XPzqYwWV56LINLva3zLJj9vdgVrKniDPJK77eXuI2vJHgKCYvb+dhsN+W+Pj50lHx9HceDPUpia1YBUqzNZ5RNL64RW/jIrpST1YuKYOAGa1SFlKvjfNCeHxc8dn81yk5tTOqyHzclV7kfUtUX97vZN5DyGe8NfFsQZVd3CzrKFbczp7oI1iXU/PDjroM7x5AeaUPNSh7rxlMcKBW2CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SJ5PPF16CC3A048.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::814) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 21:42:39 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 21:42:38 +0000
Message-ID: <889ba851-c6eb-4ad5-b31d-6d67d4c6453a@intel.com>
Date: Tue, 2 Dec 2025 13:42:37 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] drm/xe/sriov: Scheduler groups are incompatible
 with multi-lrc
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251127014507.2323746-12-daniele.ceraolospurio@intel.com>
 <20251127014507.2323746-16-daniele.ceraolospurio@intel.com>
 <f9690fe0-a3b0-4ecd-a488-72457440a8c8@intel.com>
 <f14a6c48-fe8b-46d7-974b-0fa475b3b521@intel.com>
 <3a5dba85-44b1-453b-921d-420ce26d55b0@intel.com>
 <25b260ed-d7e0-497b-8b88-7a376402633c@intel.com>
 <2376b865-4e4c-49a8-82bc-dea2da9c706e@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <2376b865-4e4c-49a8-82bc-dea2da9c706e@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::27) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SJ5PPF16CC3A048:EE_
X-MS-Office365-Filtering-Correlation-Id: 91ba62b5-eb85-4560-4050-08de31ebb6ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L014bDhaRG5IbkFMZm93V3piNDQ3SDJYSXJKa0puajB3MGdDWUxXNkFiRjlX?=
 =?utf-8?B?bXIzazNtSm95dGdKM1VoK050UnJmdXovNEN5ay90TUdpYjdEL2RQalhQa3Bm?=
 =?utf-8?B?eDF0d1VrbTJndkVtcEc0QS91bGx5SWFleDJ3TWEyeVhmYnN5OVhoU0JFa0oy?=
 =?utf-8?B?MmppejlLdWtrcHo2WDNLZ1FtUWM3dm5VYzhyclpETlFuMGRpOUpTWTJsbjdR?=
 =?utf-8?B?NGJXbDQzaXd6b1BUWDlmWWVHdWJYMnNLUGJsRGNhbVlOSDZrWGdKVzZVUWM3?=
 =?utf-8?B?S3RRQUFVZWtjQ0NOOUhhZlVuOSsxamdSdzFRZ3R5UmJnekRMc1VzbVBHVXJv?=
 =?utf-8?B?YnVjSzkzVzJkUG9jZHBDZE92U0J4L2tDUmh5SzhFbk8rUGYrMnQwcXhXNUJk?=
 =?utf-8?B?R1g0WVdzQk1xR09mNTlRT2ZJdVd4KzB6aFN2M0dIbHJkaVZSWEdPWjFxUEhy?=
 =?utf-8?B?UE4zS1RQaGtrT1pnU1NyOVBncXRNZ2hCRnFuMHppeGcvRFdjZE85RzdiYlpj?=
 =?utf-8?B?NDAxS1g4bHpTdDVVbXdiTENuVk1PVFk2YnB4czQxbHd6aHBuQnhjTzhvZzlF?=
 =?utf-8?B?ZTdhb0d4bHVBbThtOXB5eXcrM3FHclV3ZlBOY3p0NXBoS0pLcXFsdUVDM3ZE?=
 =?utf-8?B?NG0xdXBEK202WHp3NVV4ajdTcWx4S0hhRmFXbWpiclc5RThvQnVPMEtSMXlk?=
 =?utf-8?B?cHVTb2JHSXFoN3JWSytlbC9MVDhvUCtXZGZKdDlISDlMaDRTNVpLanN4clpP?=
 =?utf-8?B?SExlZTNWeXkva3luRHJDTUFhTzdUSE4rVVY2VTArcEM3aElsTmJjcVVSM01s?=
 =?utf-8?B?a1lpQWYxSVI5WnZXd1ZoTSsxSnlhNk1Ba21FdzlQQzV4U290ZFFiL1IxcEZV?=
 =?utf-8?B?ZTBjT2NRZTZINm9qbE5MV2xwK3dUVUVQMlV5YUtsc1hvazRTUHp5eFlxbkx2?=
 =?utf-8?B?WEMraSs2VGpiU3JNT0NXWHdiTjcrelc2KyszM0twVjJQazNpczUrdzdsQTdC?=
 =?utf-8?B?Yy83b2Y1NVpRd2diZEZ5QWJhUXhJLzFFN0xreVd2RklVaVAyMjNvZmxRRSt3?=
 =?utf-8?B?N1dRL2NhTXl2V0tzd2F2SmVqUUVVd05ZZUJQYVRWUGZyQ2xxWktPSHRRUzEw?=
 =?utf-8?B?RHllTWFZOFpwL2liTDJSRFJpUXJSREJQQkhUNFBXQmtvbGx2eTlSTjJIZ3Bq?=
 =?utf-8?B?RlRuVUx0NE5LaTVWWnFwR0lzVDR6Q0Q5bHZSaS9JTmFNY1lqNHZ4Tk5KTHdW?=
 =?utf-8?B?b2xRZ3lFOWdta0E3RGxpdGhIMzFLUzVFaDdOaTVnVXlMRlhUZ2w3Snh6T2cx?=
 =?utf-8?B?V053YWJHSHJDZWtPcVlxSWxRb3hyRm9QUERSdTdtOEpycVhyZ25WM2xwU0ZP?=
 =?utf-8?B?OVRBM3hXYThTeGEzVlllOHk4SlF4VGxGTjBBQlJ3Q24rYi9yRDQ2Rkd1bktS?=
 =?utf-8?B?dVJrTngrQXhQVmg1OVE4d0FEYk9RVE1pU1hScXI2Z2piRFFLQ0hiTHRRcVNo?=
 =?utf-8?B?YkkyYlFvVTFLRnZsZGFOb2VmMlZPL3RncmNCQUhkZ094a1JDWVNFL0doc3FG?=
 =?utf-8?B?dmZjUXhIQlVCOWZiczFUUmRzMzBrbGVHSk9Zb0NyS2d3T05hRUlFZDArRTY2?=
 =?utf-8?B?bnA0YnRicG1XbmdMMWpTQVNBc1RWV2NNWW9IQXJxTjlTYTZRL0FseDYxWEU2?=
 =?utf-8?B?c0tZRXRJMEphWVgybUI5OUVIS01qdDJ3MytUK3BtUnVSUU5lanhUZk8ydm9O?=
 =?utf-8?B?bDl6QXpjYWNLdnVYdnRwcHFLMVIvS1dVc29VeVEvUnFhcnp0c29GWlU4Y1F4?=
 =?utf-8?B?NHJWb0wySHZTdTRDbWdpNUFRNnp6RTUxMU1qbjBCeUkzN1A5MUtqbmI3WS9U?=
 =?utf-8?B?eUd1RWhaRzkwYVhwVCt2S1ZqQm12dWxEamN6VnZCRm15VFhxWnB1U3NCSS9W?=
 =?utf-8?Q?rWj6nzcIKNBOGSKoiNVy53i08YIMNdK2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0lCck1kQVBiSUR3czgydThqWFJ4bXMvbFl2NElucWRBSHQvUDZrRVkwSThF?=
 =?utf-8?B?ajlFeWNwblhndTdraTQwWmZPZmtDUnU3UGErQXJma0pOYWlQZEpxMEpCdE9V?=
 =?utf-8?B?STg0T0IveVczLzZUS1l4bWw0Zm42eXhGWitWMEJqTXVUdlA1SVo0Umo0TGJu?=
 =?utf-8?B?d0oxeWorZEJlQ0p6ZGFTbjNXcllHSTc2TXdVNHhrR3RxVjVvQWxxYytKWTM2?=
 =?utf-8?B?TW5UWGtDVW50QkRsL21CcCtLVmtNWDNmbkFLak5QUERQRUoxd1VjMW92UVNJ?=
 =?utf-8?B?SmllYjByNEhIdGw2UmtGdGZZOVFTalBKK0wwNVlHQ08wQUxPcDBPS25weGFs?=
 =?utf-8?B?RXhVcko5RVBLL0VleEhuVUFyamw0M1Bra3dxSVNQbFVHb3crRXExTjhOalpF?=
 =?utf-8?B?L0ZSUzFvVUpheGxWa1dxMXRrM0tjOGxsZDArSCs5dGpIUVlmSEhGNDFjZWpC?=
 =?utf-8?B?cGVtQXErcE5XZkR5YUd4OFlRNENtcmxnZDdEQTVjdWZaMmlQUjY5OEsyT2RF?=
 =?utf-8?B?RXRjRGdudy9mNzJ2Z1RyVHE3SHdyOXc2WDFTYzNacjdHMjZ1Yyt6SU5Lckhj?=
 =?utf-8?B?MkE3S0RWaFhpQ2wvM3ZDOFBkMUVMYnA4TVRIc09MbU1HSC9uKzlmUXdZUDFO?=
 =?utf-8?B?elFFd2RFMG43bVY5RnZCaUhIL2R5aTBsQlRaS2dIOERzRkV6eHFmeEtTL2RK?=
 =?utf-8?B?WFJQcERMYTQ3YkNhQTVwSGVBQjhjVnhIcWlpdCs0Q2VUVTVZWTJYeXprdjdJ?=
 =?utf-8?B?Z1k1ZklkVUNoMllraVZSZ1VpNXozN2RZYlRlWGVzVWhlSnc0TDhIaU8zSExS?=
 =?utf-8?B?bERFd01ENXJmWWc5dlhhVlpCMHhhckNZand3M2pwTkFvT3NsM3h5OFVjY1FN?=
 =?utf-8?B?czNXNlZvV29KUE1ZUlZJTUNHa1g5dFVaalZGRkpnampWUnQzWG9LaUJoSElD?=
 =?utf-8?B?MjlzZlNEOGZEdHEwMUorVUhxeVJ0QmVydmZieXVJRHpsdGNobDBTWkdWcTJ1?=
 =?utf-8?B?YU1OczdrVDlHT0tYeTBtT294TkE2eGtHa2xLb2lkUjBvSnI4dEJ4aHNQT0I3?=
 =?utf-8?B?MDEyN3grYTZIQllSRytWWFZabG5jZEVnZzBEd1BzZDFyMHFmM3hNVWE1clp3?=
 =?utf-8?B?U1hhVkxQZ3NtOHViaUZ5QUVNUk9pWTcvSEI4Q0JrYkVLcGtoSHQzY2YyekM2?=
 =?utf-8?B?QllDSHJxUDF1SWcwSnZsbk1PTE4rNEcvV2ZIaE1LMlhuN1VWTk0xVE53VUw1?=
 =?utf-8?B?SWhWU3ZpVEQ3WkRWWWVtdGhYclhGZ3BLUU1ndGJzaGZNS2I2ekhFOGlwY2JE?=
 =?utf-8?B?TVRiczN4dnUwQk1leXVjaUFFeXF4b1Z3ZG5jUDV4dmFyUVBPUnUwY0ZnendS?=
 =?utf-8?B?SnFHU2p6cG92aDdkYnp0VXBDRUdhSTRIaDVKT0d1b29rVDBxQzdjQ083MElr?=
 =?utf-8?B?bUhuSGlicTBqMEtiWHJWNi9COHAwYnVqMEtXU2MzbExZV2xVM3l3Y3VkYWgv?=
 =?utf-8?B?UXJLbm9UYlA3aW0zZ0VEejlzbTEyQnZ2WWNaNkhCb3dJczlnR0hRMVYvVE9Z?=
 =?utf-8?B?cjcrNWxiMzlocVFwdW1jRUVQUDdYcUdvTlo3emxNckExNnFRNDBUa1JJYWJJ?=
 =?utf-8?B?RmEzSHplTmR2b3pCQTZqejM5cmtkVys0Zmo1TWFZcmdRalJiRmdoWEtPM0FC?=
 =?utf-8?B?V2oyQWxNZzBqM1JPUlFIK1BPL0NVTmMyWFgwaDhzalo1RUVMTk5OSmFLOVF4?=
 =?utf-8?B?T3N3OXVBY2xlRDVKK1VLUUV2cnlZRldZbFBpT3JDQzg3ejRMby91SW5wNEFl?=
 =?utf-8?B?WDAyWU5kbTJCd1FpWkkzejV0ZVRzSzRpUERLcWlEWjVTOFV0MmdyeDBISlJm?=
 =?utf-8?B?VEpYSFU4c2ZlS1BYRG9tSDFGSEpUVHBGd0ppakwvTEg4dXVVV00wdlMxTVZT?=
 =?utf-8?B?MXNkajhWNnNtUTVIU2o3YlFXSzhXVVpqb1d3ZVZFQ3JEYUhzTFJrb3hsTzBW?=
 =?utf-8?B?Q3Q3MFk1MXRSL2tUU2dJNmw3NWh6MUlVYXovK1daaUYvY0JGZXR0TGgyeito?=
 =?utf-8?B?N1ZqREZHdjdJRGJEb1VWcDRJbXZReUdzNEFVYnFmd1RKSWZoVmx1b1l6azlh?=
 =?utf-8?B?U2JTK0ZCMXdZdXBnYXZkYklrM2lidWlkYWh4Y0FtajNOd1BpdWM4QmhPQk5O?=
 =?utf-8?Q?h6wqsZDbnp5n5DN50IDKdp8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 91ba62b5-eb85-4560-4050-08de31ebb6ce
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 21:42:38.8654 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PxZ6wA2QB7uLEXnSbQIK0uZmR45UcF9tzfmVFgcq0BHvnYDQLKiBlS/uorAc+oRNpjevdWqoMGNwoUD7Sx/Jv8S/zC9Pr+69x1VU3Jn3hg8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF16CC3A048
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



On 12/2/2025 1:37 PM, Michal Wajdeczko wrote:
>
> On 12/2/2025 10:25 PM, Daniele Ceraolo Spurio wrote:
>>
>> On 12/2/2025 1:17 PM, Michal Wajdeczko wrote:
>>> On 12/2/2025 6:57 PM, Daniele Ceraolo Spurio wrote:
>>>> On 12/2/2025 5:32 AM, Michal Wajdeczko wrote:
>>>>> On 11/27/2025 2:45 AM, Daniele Ceraolo Spurio wrote:
>>>>>> Since engines in the same class can be divided across multiple groups,
>>>>>> the GuC does not allow scheduler groups to be active if there are
>>>>>> multi-lrc contexts. This means that:
>>>>>>
>>>>>> 1) if a mlrc context is registered when we enable scheduler groups, the
>>>>>>       GuC will silently ignore the configuration
>>>>>> 2) if a mlrc context is registered after scheduler groups are enabled,
>>>>>>       the GuC will disable the groups and generate an adverse event.
>>>>>>
>>>>>> We therefore need to block mlrc context creation when scheduler groups
>>>>>> are enabled.
>>>>> s/mlrc/MLRC
>>>>>
>>>>>> An adverse event threshold is available for the new adverse event.
>>>>> changes related to introduction of new threshold deserves separate patch
>>>>> (as we need to handle GuC FW version checks)
>>>> ok
>>>>
>>>>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>>>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>>>> ---
>>>>>>     drivers/gpu/drm/xe/abi/guc_klvs_abi.h         | 14 +++++
>>>>>>     drivers/gpu/drm/xe/xe_exec_queue.c            | 19 ++++++
>>>>>>     drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c    | 30 ++++++++++
>>>>>>     drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h    |  1 +
>>>>>>     drivers/gpu/drm/xe/xe_gt_sriov_vf.c           | 59 +++++++++++++++++++
>>>>>>     drivers/gpu/drm/xe/xe_gt_sriov_vf.h           |  3 +
>>>>>>     drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h     |  2 +
>>>>>>     .../drm/xe/xe_guc_klv_thresholds_set_types.h  |  1 +
>>>>>>     8 files changed, 129 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>>>>> index 274f1b1ec37f..a6dce9da339f 100644
>>>>>> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>>>>> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>>>>> @@ -46,11 +46,18 @@
>>>>>>      *      Refers to 32 bit architecture version as reported by the HW IP.
>>>>>>      *      This key is supported on MTL+ platforms only.
>>>>>>      *      Requires GuC ABI 1.2+.
>>>>>> + *
>>>>>> + * _`GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE` : 0x3001
>>>>>> + *      Tells the driver whether scheduler groups are enabled or not.
>>>>>> + *      Requres GuC ABI 1.26+
>>>>> typo: Requires
>>>>>
>>>>> and don't forget to update xe_guc_klv_key_to_string() with new KEY
>>>> ok
>>>>
>>>>>>      */
>>>>>>       #define GUC_KLV_GLOBAL_CFG_GMD_ID_KEY            0x3000u
>>>>>>     #define GUC_KLV_GLOBAL_CFG_GMD_ID_LEN            1u
>>>>>>     +#define GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_KEY    0x3001u
>>>>>> +#define GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_LEN    1u
>>>>>> +
>>>>>>     /**
>>>>>>      * DOC: GuC Self Config KLVs
>>>>>>      *
>>>>>> @@ -369,6 +376,10 @@ enum  {
>>>>>>      *      :1: NORMAL = schedule VF always, irrespective of whether it has work or not
>>>>>>      *      :2: HIGH = schedule VF in the next time-slice after current active
>>>>>>      *          time-slice completes if it has active work
>>>>>> + *
>>>>>> + * _`GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT` : 0x8A0D
>>>>>> + *      This config sets the threshold for LRCA context registration when SRIOV
>>>>> ... threshold for _Multi_ LRCA context registrations ...
>>>> ooops :)
>>>>
>>>>>> + *      scheduler groups are enabled.
>>>>> "This is allows PF to monitor VFs' behavior when EGS is enabled."
>>>>>
>>>>>>      */
>>>>>>       #define GUC_KLV_VF_CFG_GGTT_START_KEY        0x0001
>>>>>> @@ -427,6 +438,9 @@ enum  {
>>>>>>     #define   GUC_SCHED_PRIORITY_NORMAL        1u
>>>>>>     #define   GUC_SCHED_PRIORITY_HIGH        2u
>>>>>>     +#define GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT_KEY    0x8a0d
>>>>>> +#define GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT_LEN    1u
>>>>>> +
>>>>>>     /*
>>>>>>      * Workaround keys:
>>>>>>      */
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>>>>>> index 8724f8de67e2..e59c41c913b4 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>>>>>> @@ -16,6 +16,7 @@
>>>>>>     #include "xe_dep_scheduler.h"
>>>>>>     #include "xe_device.h"
>>>>>>     #include "xe_gt.h"
>>>>>> +#include "xe_gt_sriov_pf_policy.h"
>>>>>>     #include "xe_gt_sriov_vf.h"
>>>>>>     #include "xe_hw_engine_class_sysfs.h"
>>>>>>     #include "xe_hw_engine_group.h"
>>>>>> @@ -698,6 +699,17 @@ static u32 calc_validate_logical_mask(struct xe_device *xe,
>>>>>>         return return_mask;
>>>>>>     }
>>>>>>     +static bool has_sched_groups(struct xe_gt *gt)
>>>>>> +{
>>>>>> +    if (IS_SRIOV_PF(gt_to_xe(gt)) && xe_gt_sriov_pf_policy_sched_groups_enabled(gt))
>>>>> hmm, usually we don't want core code to look so deeply into PF subcomponent
>>>> I thought about that, but I didn't know which sriov file would be the right one, since almost all of them are either pf-only or vf-only. should I just move it to xe_sriov.c?
>>> hmm, but xe_sriov.c is device level function
>>>
>>> we might add helper to xe_gt_sriov_pf.h where we can also provide stub there:
>>>
>>> #ifdef CONFIG_PCI_IOV
>>> bool xe_gt_sriov_pf_sched_groups_enabled(gt);
>>> #else
>>> static inline bool xe_gt_sriov_pf_sched_groups_enabled(gt) { return false; }
>>> #endif
>> Do you mean to check for both PF and VF from that function, and just have it in the PF file for convenience?
> this is PF file and only PF functions might require stubs (when PCI_IOV=n)
> so it is just to hide PF internals
>
> VF function is already exposed at GT level

ok, I hadn't understood your first comment. I thought you wanted me to 
show the whole has_sched_groups() function into an SRIOV file, while you 
where just asking to hide xe_gt_sriov_pf_policy_sched_groups_enabled to 
avoid calling a "policy" func directly. Having just that in a PF file 
makes more sense :)

Daniele

>
>> I could also just create a new xe_gt_sriov.h file and place it there, making the function an inline.
> maybe later ;) we already have many files
>
>>>>> also, do we want to work in hybrid mode where one GT is using MLRC and other is not?
>>>> The GuCs allow it. I didn't want to block it in case we do get a scenario later where this is needed (e.g. we might get a split primary GT but still want to do mlrc on media)
>>>>
>>>>>> +        return true;
>>>>>> +> +    if (IS_SRIOV_VF(gt_to_xe(gt)) && xe_gt_sriov_vf_sched_groups_enabled(gt))
>>>>>> +        return true;
>>>>>> +
>>>>>> +    return false;
>>>>>> +}
>>>>>> +
>>>>>>     int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>>>>>>                        struct drm_file *file)
>>>>>>     {
>>>>>> @@ -790,6 +802,13 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>>>>>>                 return -ENOENT;
>>>>>>             }
>>>>>>     +        /* SRIOV sched groups are not compatible with multi-lrc */
>>>>>> +        if (XE_IOCTL_DBG(xe, args->width > 1 && has_sched_groups(hwe->gt))) {
>>>>>> +            up_read(&vm->lock);
>>>>>> +            xe_vm_put(vm);
>>>>>> +            return -EINVAL;
>>>>>> +        }
>>>>>> +
>>>>>>             q = xe_exec_queue_create(xe, vm, logical_mask,
>>>>>>                          args->width, hwe, flags,
>>>>>>                          args->extensions);
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
>>>>>> index 48f250ae0d0d..c7f1ea8eb9c5 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
>>>>>> @@ -8,6 +8,7 @@
>>>>>>     #include <drm/drm_managed.h>
>>>>>>       #include "xe_bo.h"
>>>>>> +#include "xe_exec_queue_types.h"
>>>>>>     #include "xe_gt.h"
>>>>>>     #include "xe_gt_sriov_pf_helpers.h"
>>>>>>     #include "xe_gt_sriov_pf_policy.h"
>>>>>> @@ -527,6 +528,24 @@ static int __pf_provision_sched_groups(struct xe_gt *gt, u32 mode)
>>>>>>                           masks, num_masks);
>>>>>>     }
>>>>>>     +static bool guc_has_mlrc_queue(struct xe_guc *guc)
>>>>> this is all GuC stuff, so export it from xe_guc_submission.c
>>>> ok
>>>>
>>>>>> +{
>>>>>> +    struct xe_exec_queue *q;
>>>>>> +    unsigned long index;
>>>>>> +    bool found = false;
>>>>>> +
>>>>>> +    mutex_lock(&guc->submission_state.lock);
>>>>> guard(mutex) ?
>>>>>
>>>>>> +    xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
>>>>>> +        if (q->width > 1) {
>>>>>> +            found = true;
>>>>>> +            break;
>>>>>> +        }
>>>>>> +    }
>>>>>> +    mutex_unlock(&guc->submission_state.lock);
>>>>>> +
>>>>>> +    return found;
>>>>> what if new MLRC is created right now?
>>>>>
>>>>> maybe we should use xe_guard to lockdown one feature or the other?
>>>> The idea is that the admin is responsible for enabling EGS when the system is in the correct state, which is why the GuC doesn't return an error and just ignore the KLV if the system is not in the correct state. This check is there to catch the case where the admin has closed all apps in preparation to enabling EGS but the driver still hasn't processed all the context de-registrations. Therefore, I don't really want to over-complicate it with extra locking. I'll add a comment to better explain.
>>> so it doesn't have to be bullet-proof ?
>> Yup. If we had stricter requirements then the GuC would enforce them.
>>
>> Daniele
>>
>>>>>> +}
>>>>>> +
>>>>>>     static int pf_provision_sched_groups(struct xe_gt *gt, u32 mode)
>>>>>>     {
>>>>>>         int err;
>>>>>> @@ -548,6 +567,12 @@ static int pf_provision_sched_groups(struct xe_gt *gt, u32 mode)
>>>>>>         if (xe_sriov_pf_num_vfs(gt_to_xe(gt)))
>>>>>>             return -EPERM;
>>>>>>     +    /* The GuC silently ignores the setting if any mlrc contexts are registered */
>>>>>> +    if ((mode != XE_SRIOV_SCHED_GROUPS_NONE) && guc_has_mlrc_queue(&gt->uc.guc)) {
>>>>>> +        xe_gt_sriov_notice(gt, "can't enable sched groups with active mlrc queues\n");
>>>>>> +        return -EPERM;
>>>>>> +    }
>>>>>> +
>>>>>>         err = __pf_provision_sched_groups(gt, mode);
>>>>>>         if (err)
>>>>>>             return err;
>>>>>> @@ -600,6 +625,11 @@ int xe_gt_sriov_pf_policy_set_sched_groups_mode(struct xe_gt *gt, u32 value)
>>>>>>         return err;
>>>>>>     }
>>>>>>     
>>>>> every public function needs to have kernel-doc
>>>> ok
>>>>
>>>>>> +bool xe_gt_sriov_pf_policy_sched_groups_enabled(struct xe_gt *gt)
>>>>>> +{
>>>>>> +    return gt->sriov.pf.policy.guc.sched_groups.current_mode != XE_SRIOV_SCHED_GROUPS_NONE;
>>>>>> +}
>>>>>> +
>>>>>>     static void pf_sanitize_guc_policies(struct xe_gt *gt)
>>>>>>     {
>>>>>>         pf_sanitize_sched_if_idle(gt);
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
>>>>>> index 36680996f2bd..89aa3af6cc7d 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
>>>>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
>>>>>> @@ -18,6 +18,7 @@ bool xe_gt_sriov_pf_policy_get_reset_engine(struct xe_gt *gt);
>>>>>>     int xe_gt_sriov_pf_policy_set_sample_period(struct xe_gt *gt, u32 value);
>>>>>>     u32 xe_gt_sriov_pf_policy_get_sample_period(struct xe_gt *gt);
>>>>>>     int xe_gt_sriov_pf_policy_set_sched_groups_mode(struct xe_gt *gt, u32 value);
>>>>>> +bool xe_gt_sriov_pf_policy_sched_groups_enabled(struct xe_gt *gt);
>>>>>>       int xe_gt_sriov_pf_policy_init(struct xe_gt *gt);
>>>>>>     void xe_gt_sriov_pf_policy_sanitize(struct xe_gt *gt);
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>>>>> index 4c73a077d314..7a180c947032 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>>>>> @@ -438,6 +438,30 @@ u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt)
>>>>>>         return value;
>>>>>>     }
>>>>>>     +static int query_vf_sched_groups(struct xe_gt *gt)
>>>>>> +{
>>>>>> +    struct xe_guc *guc = &gt->uc.guc;
>>>>>> +    u32 value = 0;
>>>>>> +    int err;
>>>>>> +
>>>>>> +    xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>>>>> +
>>>>>> +    if (MAKE_GUC_VER_STRUCT(gt->sriov.vf.guc_version) < MAKE_GUC_VER(1, 26, 0))
>>>>>> +        return 0;
>>>>>> +
>>>>>> +    err = guc_action_query_single_klv32(guc,
>>>>>> +                        GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_KEY,
>>>>>> +                        &value);
>>>>>> +    if (unlikely(err)) {
>>>>>> +        xe_gt_sriov_err(gt, "Failed to obtain sched groups status (%pe)\n",
>>>>>> +                ERR_PTR(err));
>>>>>> +        return err;
>>>>>> +    }
>>>>>> +
>>>>>> +    xe_gt_sriov_dbg(gt, "sched groups %s\n", value ? "enabled" : "disabled");
>>>>> str_enabled_disabled(value)
>>>>>
>>>>>> +    return value;
>>>>>> +}
>>>>>> +
>>>>>>     static int vf_get_ggtt_info(struct xe_gt *gt)
>>>>>>     {
>>>>>>         struct xe_tile *tile = gt_to_tile(gt);
>>>>>> @@ -564,6 +588,21 @@ static void vf_cache_gmdid(struct xe_gt *gt)
>>>>>>         gt->sriov.vf.runtime.gmdid = xe_gt_sriov_vf_gmdid(gt);
>>>>>>     }
>>>>>>     +static int vf_cache_sched_groups_status(struct xe_gt *gt)
>>>>>> +{
>>>>>> +    int ret;
>>>>>> +
>>>>>> +    xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>>>>> +
>>>>>> +    ret = query_vf_sched_groups(gt);
>>>>>> +    if (ret < 0)
>>>>>> +        return ret;
>>>>>> +
>>>>>> +    gt->sriov.vf.runtime.uses_sched_groups = ret;
>>>>>> +
>>>>>> +    return 0;
>>>>>> +}
>>>>>> +
>>>>>>     /**
>>>>>>      * xe_gt_sriov_vf_query_config - Query SR-IOV config data over MMIO.
>>>>>>      * @gt: the &xe_gt
>>>>>> @@ -593,12 +632,32 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
>>>>>>         if (unlikely(err))
>>>>>>             return err;
>>>>>>     +    err = vf_cache_sched_groups_status(gt);
>>>>>> +    if (unlikely(err))
>>>>>> +        return err;
>>>>>> +
>>>>>>         if (has_gmdid(xe))
>>>>>>             vf_cache_gmdid(gt);
>>>>>>           return 0;
>>>>>>     }
>>>>>>     +/**
>>>>>> + * xe_gt_sriov_vf_sched_groups_enabled - Check if PF has enabled sched groups
>>>>>        * xe_gt_sriov_vf_sched_groups_enabled() - Check ...
>>>>>
>>>>>
>>>>>> + * @gt: the &xe_gt
>>>>>> + *
>>>>>> + * This function is for VF use only.
>>>>>> + *
>>>>>> + * Return: true if shed groups were enabled, false otherwise.
>>>>> typo: s/shed/scheduler
>>>>>
>>>>>> + */
>>>>>> +bool xe_gt_sriov_vf_sched_groups_enabled(struct xe_gt *gt)
>>>>>> +{
>>>>>> +    xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>>>>> +    xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
>>>>>> +
>>>>>> +    return gt->sriov.vf.runtime.uses_sched_groups;
>>>>>> +}
>>>>>> +
>>>>>>     /**
>>>>>>      * xe_gt_sriov_vf_guc_ids - VF GuC context IDs configuration.
>>>>>>      * @gt: the &xe_gt
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>>>>>> index af40276790fa..2e1d34c0397f 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>>>>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>>>>>> @@ -23,11 +23,14 @@ int xe_gt_sriov_vf_connect(struct xe_gt *gt);
>>>>>>     int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
>>>>>>     void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
>>>>>>     +bool xe_gt_sriov_vf_sched_groups_enabled(struct xe_gt *gt);
>>>>> move it there [1]
>>>>>
>>>>>> +
>>>>>>     int xe_gt_sriov_vf_init_early(struct xe_gt *gt);
>>>>>>     int xe_gt_sriov_vf_init(struct xe_gt *gt);
>>>>>>     bool xe_gt_sriov_vf_recovery_pending(struct xe_gt *gt);
>>>>>>       u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
>>>>>> +u32 xe_gt_sriov_vf_sched_groups(struct xe_gt *gt);
>>>>> unused ?
>>>> oops, old function name that I forgot to remove.
>>>>
>>>>>>     u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
>>>>>>     u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
>>>>> [1] here
>>>>>
>>>>>>     diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>>>>> index 420b0e6089de..5267c097ecd0 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>>>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>>>>> @@ -27,6 +27,8 @@ struct xe_gt_sriov_vf_selfconfig {
>>>>>>     struct xe_gt_sriov_vf_runtime {
>>>>>>         /** @gmdid: cached value of the GDMID register. */
>>>>>>         u32 gmdid;
>>>>>> +    /** @uses_sched_groups: whether PF enabled sched groups or not. */
>>>>>> +    bool uses_sched_groups;
>>>>>>         /** @regs_size: size of runtime register array. */
>>>>>>         u32 regs_size;
>>>>>>         /** @num_regs: number of runtime registers in the array. */
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h b/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
>>>>>> index 0a028c94756d..3e55d9302855 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
>>>>>> +++ b/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
>>>>>> @@ -32,6 +32,7 @@
>>>>>>         define(H2G_STORM, guc_time_us)            \
>>>>>>         define(IRQ_STORM, irq_time_us)            \
>>>>>>         define(DOORBELL_STORM, doorbell_time_us)    \
>>>>>> +    define(MULTI_LRC_COUNT, multi_lrc_count)    \
>>>>> this needs to be defined with some version info, maybe:
>>>>>
>>>>>       define(MULTI_LRC_COUNT, multi_lrc_count, (70, 53, 0))    \
>>>>>
>>>>> and then in encode_config() have two variants of code generators:
>>>>>
>>>>> #define encode_threshold_config2(TAG, ...) ({                    \
>>>>>       cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_THRESHOLD_##TAG);            \
>>>>>       cfg[n++] = config->thresholds[MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG)];    \
>>>>> });
>>>>> #define encode_threshold_config3(TAG, NAME, VERSION) ({                \
>>>>>       if (GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER VERSION) {        \
>>>>>           encode_threshold_config2(TAG, NAME);                \
>>>>>       }                                    \
>>>>> });
>>>>> #define encode_threshold_config(ARGS...) \
>>>>>       CALL_ARGS(CONCATENATE(encode_threshold_config, COUNT_ARGS(ARGS)), ARGS)
>>>>>
>>>>> this should fix the issues already spotted by the CI on ADLP:
>>>>>
>>>>> <6> [133.603624] xe 0000:00:02.0: [drm] Tile0: GT0: { key 0x8a0d : 32b value 0 } # multi_lrc_count
>>>>> <6> [133.603625] xe 0000:00:02.0: [drm] Tile0: GT0: { key 0x0001 : 64b value 0x200000 } # ggtt_start
>>>>> <6> [133.603626] xe 0000:00:02.0: [drm] Tile0: GT0: { key 0x0002 : 64b value 0xfec00000 } # ggtt_size
>>>>> <3> [133.603653] xe 0000:00:02.0: [drm] *ERROR* PF: Tile0: GT0: Failed to push self configuration (-ENOKEY)
>>>> I think it works better if we add the version for all thresholds, so we don't have to define multiple macros every time we need to check the GuC version (which I believe needs to also be done at least in register_threshold_attribute() and define_threshold_key_to_provision_case().
>>>> I can just use 70.29.2 (which is the minimum supported version for the Xe driver) for all the older defines.
>>> but then the code for version check will be generated for all thresholds, even those that we are sure are supported
>>>
>>> I will try to find something simpler, or more reusable, but no promise
>>>
>>>> Daniele
>>>>
>>>>>>         /* end */
>>>>>>       /**


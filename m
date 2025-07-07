Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45933C71130
	for <intel-xe@archiver.kernel.org>; Mon,  7 Jul 2025 21:05:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02A2C10E07E;
	Mon,  7 Jul 2025 21:05:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XoDItjn0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 113E910E07E
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Jul 2025 21:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751922334; x=1783458334;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GKQqnsz0micvzyAUxRfAr/vNJW53OueY7RRb5HVJVWc=;
 b=XoDItjn0evswtl5yslHIf0iq0SxwK2KgL0lDiRUGhBxyhajleo2llybx
 q+yHEAdyPRCJQfHeIK/A+oMYILLyexrqv6PDdRlvkFF5maqLCiud7ZHp0
 VqPFcVBOYwcipAuR3r+49lSjlIO/mSbA97/yRQO+2jPL6mog5UNkM01Ow
 nLjwkOQHcEIiSQ00mmSxlsKw4EvCSVushbpulgcTnOqaTszJwBmLDjLWx
 G2by87kL+PFGIM5qRpJ04uctbz2AWytEWhQij3hYoX18l2coZZmUBJPDZ
 1TRmA9uJGwxnQAdaWxztgnHtJHoc0V/ItVwgpX8iqo3UfjqvYGQBZK+nd g==;
X-CSE-ConnectionGUID: A/nU+L5pR7C0ICnlgiSRnA==
X-CSE-MsgGUID: UGDRNFgiToKygpQEvoqzfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54036945"
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; d="scan'208";a="54036945"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 14:05:33 -0700
X-CSE-ConnectionGUID: ujgymac+QJaTFYVxq6kEbA==
X-CSE-MsgGUID: GdT7vAyfRaWSAEtd30DYXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; d="scan'208";a="154942123"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 14:05:33 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 14:05:32 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 7 Jul 2025 14:05:32 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.56)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 14:05:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S9ftl4GywF0Skg5F6L396l6zHArfV/OnLjSEISYR3DCFg0BkEmEdCp1R9xcDaSugglR+BSF1Rwsc11MWxLV72N0k1E/e6NuLi2V4MRnCFaEzwYTZAPljwC0qj6M99+wyTLW4K99KgQGfCMRJNYO3wScaIAyKjUR5WtekguvjaIBDDxlIGlIHhRbwOAqX3QAWKqVeeQkB2MWoTKQEI15CTOBa5WrRXg8rVWkTqo7hwF90Get7NaJEQy/JfQewpgLK34yE62cLd2QHYCB9DRPOtLH/3e+4ZWOv7FjvYA2zhAGbXaAt6ojt214PGTuyLrIEeLXLMzZo9d82JY2RYCI6fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CEbddU3e5lCA669HIxhmrypu6jdhRudrAysKr5Se1gE=;
 b=XFY0EhPMdzBSrqBow9rhEEcO6ZCdrEXmv4eG81hcbp7XXHd23cNZOgAOH9qYT6LF2pErixMXuBvvp9lBGRhOeiT+zOkR40Gf/r+n8ELj1sRZUkrkWWtlph2A7tFoasvkv5QsjvvW7x0KDOdUJUT3JccUu5pGPVRs44ssyqzQCSVJ2X2JPTr9TFWR/2FGtSquYvpdxkxJgXS88rPUG31FWvKYBfkcMAt1P0Nah6Fcn8idDlsG6CYrWQ7BgSZyKr5UlVsZZY7aHNZlVPFYZld9N1SC6edewIb6QTQeJKhC//v/JBoJtQK6hJVdx8P0AGC0YqC3ADNRdhPFWNl6aHvHoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by LV3PR11MB8529.namprd11.prod.outlook.com (2603:10b6:408:1b3::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Mon, 7 Jul
 2025 21:05:28 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%5]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 21:05:28 +0000
Message-ID: <c120cef1-cded-44b8-819a-77a3387ecf78@intel.com>
Date: Mon, 7 Jul 2025 17:05:25 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] drm/xe/uc: Disable GuC communication on hardware
 initialization error.
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Summers, Stuart" <stuart.summers@intel.com>
References: <20250703213845.2259302-1-zhanjun.dong@intel.com>
 <CH0PR11MB54443606D202241399E6692EE54FA@CH0PR11MB5444.namprd11.prod.outlook.com>
 <3a784641-2436-4ead-88e2-88ef33fd39ac@intel.com>
 <aGwSLzlUP1YTJ5bP@lstrano-desk.jf.intel.com>
 <CH0PR11MB5444E827204F576615A86875E54FA@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <CH0PR11MB5444E827204F576615A86875E54FA@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0321.namprd03.prod.outlook.com
 (2603:10b6:303:dd::26) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|LV3PR11MB8529:EE_
X-MS-Office365-Filtering-Correlation-Id: b431cee9-d65b-41b3-9b75-08ddbd9a0019
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?amVTL2E3UkRNMFBvUWFZaGwzU1V2THZ3Ykc1T040Q01FaWJ5T21DNlkvR3or?=
 =?utf-8?B?ZTNxMjh3TVd0bUdWUjA1cnkvcTVhc1JWRHVIMjRDaW1QQkJxK0ZsT3JuaVV6?=
 =?utf-8?B?WEcvTFh0WW9nYUN0aEltYkZnL0lqZHV1cjF4dlh2MDBSbDdDOHNaN2xjcGRV?=
 =?utf-8?B?NzBqekNUbmpEQlNPdWJENG5VR0pBY01pSVpMZ1F4RmZiRUg1UDFYcHNhVVhV?=
 =?utf-8?B?V2t2bWp2ZllBaWRzTkVZZUxIOFJPd1hPUVJIMHEzdk9oQjdwUnYrbmx4OUQ4?=
 =?utf-8?B?aXNLN0N6SnhzajlqRVdZaTJWaVBCRVBURUlJVmRGK3pGRnkxNTh3T2RndDBX?=
 =?utf-8?B?Q0hBdzBMZm5TTWFnNzBnM3Z6eWFMaWpFRS9NaEpYUWxLUE1tL1hXamx3dmxi?=
 =?utf-8?B?dG5zdWxUVWJtSG1lZ1E4dnRXL212cExJTGszR2l6eHY5b3o2RElYWU5mZStB?=
 =?utf-8?B?eGNmeUhGalA4a042SERDZE5HNTJOTHVwK3d5SkRmNDdJWGJid0tzR2pyLzF6?=
 =?utf-8?B?NldvcklNdDJSR1l2NXRPOXhwYXQ2NXRlSG1pZmpFc0NjSHV2eHI1KzVDV251?=
 =?utf-8?B?ZU9kYlE0aFRpSTR1SFB6Z2hTQzRtenlXU2NSbHhNSGNJbzZENytDTTBEbFdL?=
 =?utf-8?B?MG55OTNKLzMyYnU4L29rU3RRK3JNSnFZbTVrZXFLMWwrRjg4WFk5ektwUnNX?=
 =?utf-8?B?L3lUUEYvUHl0RnFxWWxoRURLR3c2aUpUWHJhSDVhN1hRS2FXUWE2bmZVT0h1?=
 =?utf-8?B?WmlQVjVqS3o0YkszZnFYMkdYY0N6MURRWDNFT0Z0SVMwRlBiQ1J1SlFkMUFC?=
 =?utf-8?B?S3o3R3RnZGVRTkVUM3E2WFRFRS9mWmJxZUx3dnNtUHJSTFNmNnNRbU1ROUJ4?=
 =?utf-8?B?d1Viai80aTVHSTd6RzFkT0tYUU10NGZ1ck1ER1dVZXJoTXJNZXI3TmVhaU1F?=
 =?utf-8?B?ZWZrcmZWRE5NdFIrN1pmVWRxWkZRYU52Nis0clNsdnZmMlgvQjhsWHg0by9n?=
 =?utf-8?B?NnJsdk5QNmlrV0tLZlo0TGtRL3dFOFdQWEJoSkM3cTNkRFl5TWVVQXBSMDRW?=
 =?utf-8?B?dXZRU1FBd21zblhyTFhaS1NDTUM5VnBoSUVLOXU1bnhIS2Z2UUZneTEzclgw?=
 =?utf-8?B?R3QvWnNwMXU2aWpLTUt0UHlubWVsSVVKQlNoYVdCekl4alBSTllCa0FQcnlT?=
 =?utf-8?B?bmppR0FLNWNpcElyRTJVL0lvMitMQmNnbzlqdkw1Yjc2K2hES1ZPRE9vZ3lQ?=
 =?utf-8?B?ZVhDTTEwZFVuYTRZWVErbFZvYXdRSFFaMEc1OGFhT2JDSVgzakRDMmJLZDFj?=
 =?utf-8?B?TWFzK1RtbUVtbE54NkMyOWorK2JsQmRibWpzbzZjYmtIdUZySC82c05YTlo0?=
 =?utf-8?B?elJiYmUrRW5rTUh6RE5LYVJXL1pVTys2ZlRHMWFNMzI1ZjdONnRWMStqNmdH?=
 =?utf-8?B?QnRTK0dDdC9raHNQazczcTdLSzlndTFoSEhQdUl5aVpQbzJmSWNFUGlSWEVx?=
 =?utf-8?B?Ykp1aDk5dXpiSFpmQ0QrcVBqZVIwajcrZ0lPU0g1bUR3VUNCR2piblJmcFFM?=
 =?utf-8?B?ZEE1ZjZIVzNVQmNFcTVMY1VoZkt4ZlJVNEIycFNGTS8xTExscWlUNGhxaVd0?=
 =?utf-8?B?c2oyOU9DZ1plc1FJRitnVUZEK0pFUzlNRThHUHlqZUdBTEZWbXRFZWxYRjVO?=
 =?utf-8?B?QnhRZ0Q0aStsdHFtY0M3d05YUG11YXdlUkVGd3M3QTUrRFpKUm9jUjZzZDBk?=
 =?utf-8?B?SlJnYVJhcHRKSlhnd1YveVlqd2tqdGpKTnJmcUUyRHZBZlI2MHhkTGZwVXhr?=
 =?utf-8?Q?IM3IXeD9aP5fbKCuF7R26G9JxXykv9YXNNHGg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djd1ZFRsd1BCL0ZxNG01dm11Y0hRQ0tmcXVpVm9QUnhlbGxrRGRiS1FxTkNP?=
 =?utf-8?B?c3FIa3dKMng1WmRpMjVxUFQrc2l2T2REQXFPQXU3T2JveEl4VjhZOHNkUVA0?=
 =?utf-8?B?U2hBa045SERHakVOZ0wwcU1TaVdPSm9DRHhZSkxucU5kNjFzSi9jODVBYStv?=
 =?utf-8?B?LzRDcS9OSU9KNjdTZEx2Ym04bmtQZTVIQjlKWXl1aWdNa3l3REVzNFAxZFZB?=
 =?utf-8?B?bDZvS1dKZ0VhbW9RZ2J2VlJxMDNCNTZYR29TWE9kK3IvNnoxV0M3OFpQYVE3?=
 =?utf-8?B?TC9vMGtsS2xLQlZ2MW9LYUY5ZkdNT3hoUmIraUw2cFJDczBKdmJheklRRDl5?=
 =?utf-8?B?NEFrcVlnLzduMkNQSzdaZ1BXdDNONVlOVVl2ZTBoMVgyckN5VkFkTFdEeG1v?=
 =?utf-8?B?MTlaYjlodEFQL3p2RWtuSFM0UnM2WDNVQ3JGS0tWS3VkUGdSeWlVRkcyOEdB?=
 =?utf-8?B?WGNpa0FBZ2R6S2NvSXZjZ1NZdGhrRFY2T3BDeWZRdUdjV0pGdlBNTlJ5NlZF?=
 =?utf-8?B?Tkp0TjVJbWJUak1mQW5ndktwZ2U5K2JLRjZWcm9MeHNtTFBjNS9VdE4yTHN1?=
 =?utf-8?B?TkRjaUNMSFhBcm4yTDk5RmY4d1N5ekdiTkFHZVU3Z3hQYlpiaS96ZjNUZHp5?=
 =?utf-8?B?bmlJN0dpTnZ6TEFISDhQcStJVnFaUnJ2NE5jTmxNTU5pdUdmZXhRVm1vM1BK?=
 =?utf-8?B?Z0hLK3hmZW9rRTdQZWVDS2ZPbGpydGlJMjZrQVlLVlJwZGlxdzhBRVRPeVFB?=
 =?utf-8?B?dHJocjR2ZHBjTTdTZHZtUlU2OFVKT0ttM0tIMWhjTDA5VjczTEtMZjV5TVB2?=
 =?utf-8?B?My9mWm1SRzlheTRFeTFNV2tBcFlTNTJWd1Y0ZmNMcEs2Ry9OeEhnc0VyS2c3?=
 =?utf-8?B?K0NDeDZBdE5qVmRoT2VzSzlhS3NjOE5HMkJBbHJvMlJ4c3VlKzExZUs2TGYz?=
 =?utf-8?B?UXdVYXNHcGl1L0JleThUQStHN0FHK2tPb1ZURFRldWlkczF4cW02TEowVXNS?=
 =?utf-8?B?U241RTNHRUl0Sm50RHhDTFB5OXd4cXZNcGpkaWI3UzJlcldVKzEySWJCS0Nn?=
 =?utf-8?B?R2VacmQxcUJmbmZSNzhUZ0Z2UGxGV3JzMkhnbVJud28wc05IaUZzT3ZDOHBR?=
 =?utf-8?B?MTRuSTJ0eG9TR3M2SlRMS0FyQWlqMWR5dUF3MmovVzZnNWpWem80SmZFL3hq?=
 =?utf-8?B?cTM5RHBiaDVnOURPVHUwRy9aZVFDa2ZxbzNvVThoVm1YemRWWXkrbTQ3Y1Fn?=
 =?utf-8?B?RE9ZMThnNHdINGc0QmExL1hWaW9hUDFwWWdSZ201cE9Ia3o5Q3EyMWtXbUEr?=
 =?utf-8?B?NFRtbGpja2NJaWdlTElCelBhTHhnMm5WT0lDR2hqTmtWaFBGSHVnWHNRWEFs?=
 =?utf-8?B?cWIxOGI2UG5GdkduSFdvc2Mxa3lEOTUwWTZ3dDJocDl5SndVcURxZUNCZnJL?=
 =?utf-8?B?VXZYMjdjeTBVdFBVd3pxOEFTV0FwZkhpL1Vna3hHQTQ5TUFBY3RNOEt1ZS9m?=
 =?utf-8?B?eW9laHkyV1NtOTlJVHFFMEZHTk1GRkFQUTVhK09FSUpOQURDa2VTelVIOEFj?=
 =?utf-8?B?Y21aVjJCNXRTVzJGWmZnSWNPc1NkNlMzS0xqWlRhaEsxczRhV1haVy9zMFVV?=
 =?utf-8?B?anhiL2NWZ3d0QzVsK3RRVHc3QjBpWncwTXBZUGlTT0tGUkkwSVI3dFByWE1B?=
 =?utf-8?B?bTY2bXFMdjVLZmJZdVZpSFdibTU1aytzeXNVazhhU1V6cE1qblNHRk81T1hD?=
 =?utf-8?B?WnFuWmNHMlFjZFd1SXIzNURZLzhkQlh4NlFaRStsVi91c1dyalpPNlpqWUlt?=
 =?utf-8?B?cTV2QXAxaU9ncDFYeFhubVQxaC9hVDBkRHpPdSttTGhzalpldjBmUUZjRVdl?=
 =?utf-8?B?VStabGRZaDZEbFN4QWkvenc0NGtXT2h0RE9KSi9jbmpQWkJCeERPb09HZ0tv?=
 =?utf-8?B?Z1J2TkRKSzJtY1NPU0JIc3oyZ1NTbzdBU29Rd1drRU9NUm9yUkpaR1ZVTFBB?=
 =?utf-8?B?MklPTi9XVmxsTk5aQ092Zk84b0pRZWF4OXc2Ty81ZHYvYk9BSWMzTUVrVnVS?=
 =?utf-8?B?V3ZxbDN0Y3VkenJrS3d1R3FiR0drTGU1amxITVNGS2I2dFIzbjlqc3owdUVz?=
 =?utf-8?B?THBlN0x3WThuSVIrOXhnUDRmRnlXYXpHTlhaMGlrQVIyc2ptUnkvSkJEMk1F?=
 =?utf-8?B?WVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b431cee9-d65b-41b3-9b75-08ddbd9a0019
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 21:05:28.2817 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GpSbLko7KOpjmiUmBwhmsGxNVifNdCohV4qDNORA/ZRFBo7alHXoCUinc8qg6Cw6sXp6JNQJzQcnFKiESX3oPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8529
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



On 2025-07-07 2:34 p.m., Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Monday, July 7, 2025 11:30 AM
> To: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>
> Cc: Cavitt, Jonathan <jonathan.cavitt@intel.com>; Dong, Zhanjun <zhanjun.dong@intel.com>; intel-xe@lists.freedesktop.org; Summers, Stuart <stuart.summers@intel.com>
> Subject: Re: [PATCH v8] drm/xe/uc: Disable GuC communication on hardware initialization error.
>>
>> On Mon, Jul 07, 2025 at 07:36:29PM +0200, Michal Wajdeczko wrote:
>>>
>>>
>>> On 07.07.2025 15:56, Cavitt, Jonathan wrote:
>>>> -----Original Message-----
>>>> From: Dong, Zhanjun <zhanjun.dong@intel.com>
>>>> Sent: Thursday, July 3, 2025 2:39 PM
>>>> To: intel-xe@lists.freedesktop.org
>>>> Cc: Dong, Zhanjun <zhanjun.dong@intel.com>; Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Summers, Stuart <stuart.summers@intel.com>; Cavitt, Jonathan <jonathan.cavitt@intel.com>
>>>> Subject: [PATCH v8] drm/xe/uc: Disable GuC communication on hardware initialization error.
>>>>>
>>>>> Disable GuC communication on Xe micro controller hardware initialization
>>>>> error.
>>>>>
>>>>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>>>>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4917
>>>>>
>>>>> ---
>>>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>>> Cc: Stuart Summers <stuart.summers@intel.com>
>>>>> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
>>>>>
>>>>> Change list:
>>>>> v8: Fix kernel-doc style
>>>>>      Add error handling in vf_guc_min_load_for_hwconfig
>>>>> v7: Add kernel-doc for xe_guc_disable_communication
>>>>>      Unset submission_state.enabled as well
>>>>> v6: Skip disable ct on xe_guc_enable_communication error
>>>>> v5: Set wedge is excessive action, revert back to disable ct
>>>>> v4: Fix typo and add new line
>>>>> v3: v2 CI re-run
>>>>> v2: Remove unnecessary jump to err-out
>>>>>      Drop disable ct, switch to set wedge
>>>>> ---
>>>>>   drivers/gpu/drm/xe/xe_guc.c | 20 ++++++++++++++++++--
>>>>>   drivers/gpu/drm/xe/xe_guc.h |  1 +
>>>>>   drivers/gpu/drm/xe/xe_uc.c  | 19 ++++++++++++++-----
>>>>>   3 files changed, 33 insertions(+), 7 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>>>> index 8573957facae..6643a2cb898b 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>>>> @@ -1219,13 +1219,17 @@ static int vf_guc_min_load_for_hwconfig(struct xe_guc *guc)
>>>>>   
>>>>>   	ret = xe_gt_sriov_vf_connect(gt);
>>>>>   	if (ret)
>>>>> -		return ret;
>>>>> +		goto err_out;
>>>>>   
>>>>>   	ret = xe_gt_sriov_vf_query_runtime(gt);
>>>>>   	if (ret)
>>>>> -		return ret;
>>>>> +		goto err_out;
>>>>>   
>>>>>   	return 0;
>>>>> +
>>>>> +err_out:
>>>>> +	xe_guc_disable_communication(guc);
>>>>> +	return ret;
>>>>>   }
>>>>>   
>>>>>   /**
>>>>> @@ -1337,6 +1341,18 @@ int xe_guc_enable_communication(struct xe_guc *guc)
>>>>>   	return 0;
>>>>>   }
>>>>>   
>>>>> +/**
>>>>> + * xe_guc_disable_communication() - Disable GuC communication
>>>>> + * @guc: The GuC object
>>>>> + *
>>>>> + * This function will disable the GuC communication.
>>>>> + */
>>>>> +void xe_guc_disable_communication(struct xe_guc *guc)
>>>>> +{
>>>>> +	guc->submission_state.enabled = false;
>>>>> +	xe_guc_ct_disable(&guc->ct);
>>>>
>>>> Didn't this used to just be a wrapper for xe_guc_ct_disable?
>>>>
>>>> ... Well, I suppose needing to set the submission state enabled to false
>>>> would also be a rather important step, so it's probably good that was added.
>>>
>>> hmm, while it might be a required step for shutdown, putting it here
>>> looks like a random choice, it's unbalanced what "enable_communication"
>>> did and also looks like a violation of the layering, as guc_submit code
>>> has its own files and we shouldn't touch internals from the outside
>>>
>>> + @Matt
>>>
>>
>> In general, the use of guc->submission_state.enabled in the existing
>> driver doesn't appear correct. It's accessed in multiple files without
>> any clear locking or layering rules. This falls into the category of "I
>> wrote this early in Xe without much thought or due to some ignorance,
>> and we never cleaned it up"—and there's quite a bit of that floating
>> around in Xe. So I agree with Michal—we shouldn't make this worse.
>>
>> Rather than calling xe_guc_disable_communication here, maybe call
>> xe_guc_sanitize instead? It should achieve what you're aiming for
>> without further complicating the handling of
>> guc->submission_state.enabled.
> 
> It seems like the only difference between xe_guc_sanitize and
> xe_guc_disable_communication is that the former calls xe_uc_fw_sanitize, and
> the order of operations is swapped around a bit.  So, yes, I think in hindsight
> we should be using xe_guc_sanitize instead.
> 
> Doing so would also eliminate the need for the xe_guc_disable_communication
> helper function altogether, so once all uses of xe_guc_disable_communication
> have been replaced with xe_guc_sanitize, we can safely remove that helper
> function from this patch.
That looks good, I will post another revison to do so.

Regards,
Zhanjun Dong>
> -Jonathan Cavitt
> 
>>
>> Matt
>>
>>>>
>>>> Everything else is LGTM, so
>>>> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>>>> -Jonathan Cavitt
>>>>
>>>>> +}
>>>>> +
>>>>>   int xe_guc_suspend(struct xe_guc *guc)
>>>>>   {
>>>>>   	struct xe_gt *gt = guc_to_gt(guc);
>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
>>>>> index 22cf019a11bf..20823b821f7d 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_guc.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_guc.h
>>>>> @@ -34,6 +34,7 @@ int xe_guc_reset(struct xe_guc *guc);
>>>>>   int xe_guc_upload(struct xe_guc *guc);
>>>>>   int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
>>>>>   int xe_guc_enable_communication(struct xe_guc *guc);
>>>>> +void xe_guc_disable_communication(struct xe_guc *guc);
>>>>>   int xe_guc_opt_in_features_enable(struct xe_guc *guc);
>>>>>   int xe_guc_suspend(struct xe_guc *guc);
>>>>>   void xe_guc_notify(struct xe_guc *guc);
>>>>> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>>>>> index 6431ba3a2c53..1012fe84b379 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_uc.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_uc.c
>>>>> @@ -13,6 +13,7 @@
>>>>>   #include "xe_gt_printk.h"
>>>>>   #include "xe_gt_sriov_vf.h"
>>>>>   #include "xe_guc.h"
>>>>> +#include "xe_guc_ct.h"
>>>>>   #include "xe_guc_pc.h"
>>>>>   #include "xe_guc_engine_activity.h"
>>>>>   #include "xe_huc.h"
>>>>> @@ -158,7 +159,7 @@ static int vf_uc_load_hw(struct xe_uc *uc)
>>>>>   
>>>>>   	err = xe_gt_sriov_vf_connect(uc_to_gt(uc));
>>>>>   	if (err)
>>>>> -		return err;
>>>>> +		goto err_out;
>>>>>   
>>>>>   	uc->guc.submission_state.enabled = true;
>>>>>   
>>>>> @@ -168,9 +169,13 @@ static int vf_uc_load_hw(struct xe_uc *uc)
>>>>>   
>>>>>   	err = xe_gt_record_default_lrcs(uc_to_gt(uc));
>>>>>   	if (err)
>>>>> -		return err;
>>>>> +		goto err_out;
>>>>>   
>>>>>   	return 0;
>>>>> +
>>>>> +err_out:
>>>>> +	xe_guc_disable_communication(&uc->guc);
>>>>> +	return err;
>>>>>   }
>>>>>   
>>>>>   /*
>>>>> @@ -202,15 +207,15 @@ int xe_uc_load_hw(struct xe_uc *uc)
>>>>>   
>>>>>   	ret = xe_gt_record_default_lrcs(uc_to_gt(uc));
>>>>>   	if (ret)
>>>>> -		return ret;
>>>>> +		goto err_out;
>>>>>   
>>>>>   	ret = xe_guc_post_load_init(&uc->guc);
>>>>>   	if (ret)
>>>>> -		return ret;
>>>>> +		goto err_out;
>>>>>   
>>>>>   	ret = xe_guc_pc_start(&uc->guc.pc);
>>>>>   	if (ret)
>>>>> -		return ret;
>>>>> +		goto err_out;
>>>>>   
>>>>>   	xe_guc_engine_activity_enable_stats(&uc->guc);
>>>>>   
>>>>> @@ -222,6 +227,10 @@ int xe_uc_load_hw(struct xe_uc *uc)
>>>>>   	xe_gsc_load_start(&uc->gsc);
>>>>>   
>>>>>   	return 0;
>>>>> +
>>>>> +err_out:
>>>>> +	xe_guc_disable_communication(&uc->guc);
>>>>> +	return ret;
>>>>>   }
>>>>>   
>>>>>   int xe_uc_reset_prepare(struct xe_uc *uc)
>>>>> -- 
>>>>> 2.34.1
>>>>>
>>>>>
>>>
>>


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8426CEFCEB
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jan 2026 18:37:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9785210E545;
	Tue,  6 Jan 2026 18:37:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mFbXNTsN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7292210E545
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jan 2026 18:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767724675; x=1799260675;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=FAazyBXeK90b2PLh7Fw1LIh4sbP+UgbNiaeD+cdl3sY=;
 b=mFbXNTsN+rFEGhV5CEggYRRYsq+WwAHQUKtzEYkDA17PlCWjUU/0zhfK
 XLBL3dZpLyj3JGNcIiYpl7RKoxooy+Ylofqe+b7nBxD9uCQsdme1A+C1P
 xV4Tfk6/vg9oxo3ahHLTJNvLPqbezkmHnPa4FASBcMh2KRRPCJSqyYOBU
 FTgqnLlGahyU7tZ/ZK5AfDZWgkSyucc6Xa/XMcMVmK9TDRefEZXCqydaP
 llUTycmuDXR0X6XoF7FLr2bIRMocloZy3cz4hz5EDceGS2wtZxw1bVaZc
 6s2sdxjJdCNILHQRrzMGCyhxuhJn19imnVj3MPa0VQaC+LSXoNI20VdqI Q==;
X-CSE-ConnectionGUID: 8ue515k1TxmA+U/rKFtRkA==
X-CSE-MsgGUID: /j91VCBZRWyvlrkM0+NxZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="94562195"
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; d="scan'208";a="94562195"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 10:37:55 -0800
X-CSE-ConnectionGUID: AL+058yoRieMXlcgnPR+rA==
X-CSE-MsgGUID: fbwCKUeaRCOomNrJ+yTStQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; d="scan'208";a="226252589"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 10:37:55 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 10:37:54 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 6 Jan 2026 10:37:54 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.0) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 10:37:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oN4FqMcguwiLM3dMeJ5wMVkMDgFn4TRWreCdM2K9ID8G7muCHqQGy23Mj3vbL6lOLIL306sNSrjfd3tGPNoCTYdqbCSiPfa2UjX1NbpS4ZGDnfz3tRfjbxPA70fbhTPRu47Ua0bitoIB/mrZczE9cm9hWLXcCxBC2FRHXdG/B7P9AzZ45tmY8PGfpwqI6db+Qi7bG6+guLgr/WqKVEerPhDpP+HkPFlEBHYiRLNj8spXou7NSz4D7UgLw99WiFvExJKYNVOy0sCn0Sjmh0aRmDTApgFavqX4lxpkh0LvJIHfoWqECfn8+L3Z7ja/C/f31LAGFbEiPlESedkifrpdsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0BUEyI7IsGl0YHjTU7Q8sEUMKdn8ph7+qwpeNKER4Iw=;
 b=pSUmRbcDlQS+PHwWw1IfldnYVei+xiK6LJylhhzyD49ETz+F8aoiVIkeaHRLNMji5hE89GIIMbZzYtdm7aa1ctLo6Vy/VLq7kRP+H7vkrqDDTWeKLRS8ukCb8eItXMDKTbeywHcV4jAWECLmbfhKW3CjemL0AhgSq+uFt9ipOFSPgCXCERT/5Eacflsd7dbjxdsjEOkk9ZIpwn+GsRPqJb/5NXKXhoL2DzC5+5C4+OYXEd/N5L2eW0/5CBVtfnSPSLJpIDdbc4TRaZ63m5kRjRRFwG36PjxEx6dv6boMYIyb6Wq4n96wGAlBJ4U395I2EaEleFY0Zs3vcI8jmfBemw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by IA0PR11MB7863.namprd11.prod.outlook.com (2603:10b6:208:40c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Tue, 6 Jan
 2026 18:37:52 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%7]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 18:37:52 +0000
Date: Tue, 6 Jan 2026 10:37:46 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <anshuman.gupta@intel.com>, <matthew.d.roper@intel.com>,
 <michael.j.ruhl@intel.com>, <paul.e.luse@intel.com>,
 <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v2 1/1] drm/xe/sysctrl: Add system controller component
 for Xe3p dGPU platforms
Message-ID: <aV1WekOuQFlqdEne@soc-5CG1426VCC.clients.intel.com>
References: <20260102165450.561614-3-anoop.c.vijay@intel.com>
 <20260102165450.561614-4-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260102165450.561614-4-anoop.c.vijay@intel.com>
X-ClientProxiedBy: MW4PR03CA0329.namprd03.prod.outlook.com
 (2603:10b6:303:dd::34) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|IA0PR11MB7863:EE_
X-MS-Office365-Filtering-Correlation-Id: e8726b16-0925-4bb2-fe87-08de4d52b311
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VEx3SFVQNk1WQnQ5Ni81S292anhDbG9LQVB3dnZBT01jZXB2T1ZTbTA0bHdW?=
 =?utf-8?B?YTZ5NC9CNWl0NlF4VDFmOGZQS2J3Z0ovckRmY2pOcWUwbnNaeFVYZ25zdU1z?=
 =?utf-8?B?Yjk4RU1DRGtyMWZWWFMrVng5U2dHTk5SRGxkaGtnOUtsVmd3Wmh1NXdJYUo3?=
 =?utf-8?B?aUJNbE9qTUU5enJnVUtPTHhoaTZaRytxa09kV2p4R0REZVVKKy9mUUZyOEIy?=
 =?utf-8?B?OGMyVFBQRnRYQkVuSEdIczRDcVAxYTNKV1NRZHAxWCs1eDUxTjNzRXNtK2Y4?=
 =?utf-8?B?UUhoQkpIOEpCRWJxRjV4Ky9JSHlsQVJ0cDkyaFVQQVowa00zeGVRNVJOVWpk?=
 =?utf-8?B?dXd2S3U3L3h5aWg1OHFsZkNZRUJaQUw4VGM1a2JrRjlDenBkbVhxNUpVNHdn?=
 =?utf-8?B?V0NlSnU4cVA1SXYyS1VkSWlPTWRBT01ZdlFFM1BxUFpqYkhOckpSK1VRVjgx?=
 =?utf-8?B?OXR3aSt1amJySEVoZXcyN3plSWFqekVuRXQyZmtXZ0p2NkhxRCszRHBzVGJP?=
 =?utf-8?B?WDMzcytsZGVUbXFGY3BqNFNkYmdJaWNQRjFZdjhXcGN4Qnpna1pKWlo1aTdx?=
 =?utf-8?B?S04xbktUSmJtOTdzUTlRZmgxTURDN1hMZEowalQ0SjBPMHk0ZDEyczl2NDlz?=
 =?utf-8?B?R1RobUhxOHhndFpqbjRBcWZBc0RUNTk2VzJQQ3R6THhOaFRaK2hnOEo5b1Ux?=
 =?utf-8?B?N3BVSDNod1piczh0L3JZOHpXSCtHR2czTEwvOGt3KzVTRG54YTVRcFlNRzlt?=
 =?utf-8?B?bUdUTTFPc09WN20zekc2bXQ0YkJ6QVFYc1FRRkEwVWRwVGx5cE9IOEFVSmZk?=
 =?utf-8?B?YUZ5c0tqMkZ4QitZMU5Ga2lPY0JiZE8yVUpGQXNNdWVGTzJWK1gzSXA0R0pG?=
 =?utf-8?B?ci9MdmcrVVppT3E4Q0hHTC9aQ0tNWFBxeTB4cW1CRDlBZ21FbjZxNmx4eklj?=
 =?utf-8?B?OFF5d3VpdDUvVTZRN2lQWXZ5WmozVGNFb1V2RkpXeUo0cmVyYlFHNVRieHNz?=
 =?utf-8?B?QWF3OU5BNk54bHhsdXhwOFN1TXQ4T3NIMkJubFFwK3kyU0dhMGxLT1dBMXFF?=
 =?utf-8?B?c0xNak9vQ2k4dVNkZG5EM0hkQWtPR1NyWWptcU1TaEYrbmRTaWtvbVlpN21o?=
 =?utf-8?B?a0NycHREM1VGR0lHdnBqT041RmFmUGgrTzFrRlRhUUwwbjkyeGUwem94cUNJ?=
 =?utf-8?B?ODRNSGoydU40VXNiVnhaTzdJRUVpb3YySDBTZG82b1Uybk1zSDBrTXBwaitT?=
 =?utf-8?B?MEJINFU2aTZWZjUzRHhtaG5JL2c3MERBWERFQm9SMm0wUmJNUk1SakxVMnZp?=
 =?utf-8?B?WlFwcU1wdkdhR2tJcUxNTXlZQ3JYSkV2YVBtdXRQZWZ5LzlqenRHTVV4K0M3?=
 =?utf-8?B?VXVuNk5RZWhzUzdlNjNrdGZUdEtPK0MweUxhektvS2ZYU0J2KzVIdkE0MHh6?=
 =?utf-8?B?dUtLWXgzZk9XUzVHNTRLcTFNU2xXMGVjVjkvT0tHQ3E3UlE1SlM3TU0xR0NI?=
 =?utf-8?B?OE5NUm5aZlJMNXR6azlTQTE0WmI1YjBVV2NrQlB4SG9Rc0xCV05oS2dWTm1U?=
 =?utf-8?B?Z2hyZW9CRDFuWDV2QUZKTW1LNXJCNXAyVEEyTVdmdXBmcFVWWTJXTjJGMkRD?=
 =?utf-8?B?cFpMNGVEZnF5QzV1Q3dRV0t6UnVuajRuSlZ6UW9WL1Rxd2hGdXllbU9RVUNO?=
 =?utf-8?B?M0QyYXF3dHoyN2loSkYxRFZPditHSW5wYnJsK1BHOERHdWtMcnNndkFQQkw4?=
 =?utf-8?B?Ni9Dc1NyS2lyQVZ4OXR4TmJjMFZBNWZRaXJBZHQ0UFFWNDRIbnRHNlNsU3d1?=
 =?utf-8?B?cExuekNCK09OdkptM1Rma2R4a1dEeG8rUEdqNUpFeVIyQUY5cm03bGVBYlNH?=
 =?utf-8?B?c2Nydm9rRTMvMzFYU05aNHZiTWJQd1V5YlVLcy8rTmZGbVAxU0t0SzdTejNC?=
 =?utf-8?Q?NefeHWDLOyU6fUjoGoWsiFeUrs4wGW/v?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MG1TMkpCV01DTnFSYXRjcXVrcGcxOGQrRndLSU9Wc2pGQ2JtRERBRG9wY3pl?=
 =?utf-8?B?L2N0RStWRjVwb1F6MCtkbmhYMzYyKzlxMGx0bVpWcjdpWWk5eSttWXBiZEU5?=
 =?utf-8?B?a1BMNC9ZMVNjUzZjZFBld3Znc3pVc1lYN2NuUTUvbVppbWNoZzdIUkxxN0hB?=
 =?utf-8?B?U2NRZGZHa043QUg2dHhIUTVHM2E4eUVzZnhBY29lUTZXNFhob2dVYUg4MGVM?=
 =?utf-8?B?dzRialh4a1VVSkZsTEwxeWlIUkxwWGpVK2t4Y2hNZzRFcHdpa0w3RmgxRm1Y?=
 =?utf-8?B?ZW9VY0xQRXU0NFNaam95VnhXK0tzT2liZTgyYlp1eG5XeUswVGF5K0MrWFps?=
 =?utf-8?B?WW42ZyticUhURTdhQ2JwWkE1UGFVc3dKRzhlVDYyWUpWcGNPa3pUaWhRcGFG?=
 =?utf-8?B?cG5IR0RYWCtTNHkwMkxBMDZ6V3pueW01djN6RmhTdUlHVGFPSFdSZ1BCS09M?=
 =?utf-8?B?bFQ4clFiZWRza203OUN5VURaOUlJUlFBdW0yU3hLeENoWWZHL1ZmWXBwdSs0?=
 =?utf-8?B?Ynp1UkFVdXlMTk9WWjRlR3lHSTdpWkhRcXZPN0hTY01WSnFkSmtRR1oySEVo?=
 =?utf-8?B?K1gzZ1FZMlpSWnJ1OEtNYUNVR1hYL3Z3bURYbVNXR1JWM0doT0I0V2ozbnk2?=
 =?utf-8?B?NVB3a0dRMlpQY00xOEMyVmIrZzRUUWlRVGdSdE9DdG5NR251d1B0eWEyb2Fm?=
 =?utf-8?B?cThBRStJSXpNam9hc0NMWUZPSlJwbzdtSkxlUVFabE94WG1pemxDT2EzRi84?=
 =?utf-8?B?bnhUMVpIZzByVGdBSTZjdFQyaUlvV3AyUnBNM0hzWDJLMjZXWitkT3VWY1li?=
 =?utf-8?B?Y0NPTm93ZWVQYlRDRmZhNS80eTRKLzB5Kzg3VUk1cy9xTi9BTk4wTkV5UFVK?=
 =?utf-8?B?RkdONmtpcktSSEJZWTNEY00vdnNwUy9VOWRRUHFkY2RWVlR5NXFhcnJrZjVz?=
 =?utf-8?B?T3ZwM1FjZ3MyU3A0TFBuMTdPeENzb2dFblBaWEdWS1dDS3ZZQ2dOcFdSckRu?=
 =?utf-8?B?UjljU0c5TkNmRzdKSHJNejJqRkp2ZUVvTGpCYmNSOXVFRnJLM0d3d0dlakN6?=
 =?utf-8?B?ZXhCM2YvcjZoQy9YT2pzZ0dyZmJQaWdlM3IzSkxPdE9vWkEzOFluTDkrYzBZ?=
 =?utf-8?B?Q1pCVVZZSkJCNmRYSDdPL1dvYnRJNUlIYTUzOHM3TzJVbHFwMG1XTVErOW5V?=
 =?utf-8?B?YlhzaU8rblZKLzNQblNDQWhYQXF3RWh6Y3ZpQUltMG1PYU1EYndkM1Jkb0Jj?=
 =?utf-8?B?dXl6YUptcEl4cXdiWU9oZFJTblh0TmNFSm1hZlZ1UmJhUHQ5Wk5ONjZ1YVBt?=
 =?utf-8?B?akFxZjZGWGVWV2RleVE2MmtNOEFIUnplYW5LUGw3V0xRYXVWVitXRFlDZXdZ?=
 =?utf-8?B?RHM5TnduNzlZdkEvWVdtRVFCNzBHN0hFMW1rWGFFVnltNWFNLzlYSlNMQ3hD?=
 =?utf-8?B?b1RqUzczMHVLcmxoaFVwNHFTSzViWitCSndnMmp3THprdDEwSXRyMkhKbmZJ?=
 =?utf-8?B?SjdOSkQyZ2pyZGZieXQ5VlZCNU5qZGlWME8xRFNNMVBhS1JRVGxQdS9FOFR6?=
 =?utf-8?B?WUVycjJ1cGh2eExXQVZVa3NSTjRqM2pZQWI4eWFXWEFsb1BvR3lGbE84aFE3?=
 =?utf-8?B?Y1VwU2Q5Q1dkOE40QndIeUVpMStvcVVEWmxubDJtOStGYUFLL2NQQVlnMmxM?=
 =?utf-8?B?eFZnODNrYVp0RFgxSTZJSmpzZ3RSOUFNTEFyYjZPL0VoQkFsZlI3QlN2RThk?=
 =?utf-8?B?N1R6aWNnaEhsTGpUdjdWVmZ0YU9IQVBKRUpWRHhqeVZlSkxzOGpIRUM0S1ZG?=
 =?utf-8?B?bDFDbTNVSHY0Rml0c1JrVmxtbGFxdXV1RUtOKzlzcHIwYkFadXRBMzJVN2FH?=
 =?utf-8?B?Y2xXWnVwSENsYnovT0Y3RGFLL000ZGltcEZScms3aHZ5YjU1TjFFQi9QYTZV?=
 =?utf-8?B?ZndBTThVQTlHUm10REZzazJ6d3U4bHIwWENTbzFMWEpueVhqK0NjY1g2RHhi?=
 =?utf-8?B?eHN3ZTA4bC81TFhuUWNTRXJFdnI1aTl3NXkzL0JhR3NyVzE0UkZWQjltdEdS?=
 =?utf-8?B?UWpLWVVGWU5KR29NOFIzNE1pL0tvRitIU092QW1kei9wMnhOa3RwRGpqQU9q?=
 =?utf-8?B?N0xEY1ZON1cxNzBzeUp2V01lRlVHSTN4aWwxL2xmVlNVM2drUUZSWkZHTHNp?=
 =?utf-8?B?dUhxMzhMa2t5eXl3TE1xNWhGamZtN2tMcFNIek84YlZ0Y0NpQlVmbmJ4SG9h?=
 =?utf-8?B?Uk5TVWtkMWptTDdtQjhXQjhWZERzdU9GS3FBT0p0SWpHRWN1ZW1PV29XakQ1?=
 =?utf-8?B?RUs0MldiSFo4dGxwZ0NDTmk2RXU0d05yTFpoN2hYUkhoS1VDQ3pYU3hjS3Q2?=
 =?utf-8?Q?xdHGj8YItK4qD3Y0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e8726b16-0925-4bb2-fe87-08de4d52b311
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 18:37:52.2540 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xpDjqwBE7S1qq4b0185LK4RcappF1vaOvEaAW8NzgBJjVRD8yieOkserPu91UkkUOl3OseGcx1xT0gr7wkgsufsjEorpa2RBDFTBw9oJt1Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7863
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

Hi Anoop,

Thanks for incorporating most of the comments here. I have a few more in 
this revision.

On Fri, Jan 02, 2026 at 08:54:50AM -0800, Anoop, Vijay wrote:
>From: Anoop Vijay <anoop.c.vijay@intel.com>
>
>Add a new system controller (sysctrl) component for Intel Xe3p dGPU
>platforms.
>
>This component provides the foundational infrastructure for communication
>with the System Controller firmware using MKHI protocol over a mailbox
>interface.
>
>Key features introduced:
> - Detection and initialization of System Controller interface on Xe3p
>   dGPU platforms
> - Mailbox communication with System Controller firmware
> - Fragmented message transfer for large command payloads

Let's break down the patches as Matt suggested.

>
>This implementation establishes the base for future System Controller
>feature enablement and firmware command handling.
>
>Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
>---
> drivers/gpu/drm/xe/Makefile               |   2 +
> drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h |  44 +++
> drivers/gpu/drm/xe/xe_device.c            |   5 +
> drivers/gpu/drm/xe/xe_device_types.h      |   6 +
> drivers/gpu/drm/xe/xe_pci.c               |   2 +
> drivers/gpu/drm/xe/xe_pci_types.h         |   1 +
> drivers/gpu/drm/xe/xe_sysctrl.c           |  62 ++++
> drivers/gpu/drm/xe/xe_sysctrl.h           |  18 +
> drivers/gpu/drm/xe/xe_sysctrl_mailbox.c   | 409 ++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_sysctrl_mailbox.h   |  77 ++++
> drivers/gpu/drm/xe/xe_sysctrl_types.h     |  23 ++
> 11 files changed, 649 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h
> create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.c
> create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.h
> create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_types.h
>
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index 2b20c79d7ec9..947fbcac65d5 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -121,6 +121,8 @@ xe-y += xe_bb.o \
> 	xe_step.o \
> 	xe_survivability_mode.o \
> 	xe_sync.o \
>+	xe_sysctrl.o \
>+	xe_sysctrl_mailbox.o \
> 	xe_tile.o \
> 	xe_tile_sysfs.o \
> 	xe_tlb_inval.o \
>diff --git a/drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h b/drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h
>new file mode 100644
>index 000000000000..6627a9c32c4f
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h
>@@ -0,0 +1,44 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2026 Intel Corporation
>+ */
>+
>+#ifndef _XE_SYSCTRL_REGS_H_
>+#define _XE_SYSCTRL_REGS_H_
>+
>+#include "xe_regs.h"
>+
>+#define SYSCTRL_BASE_OFFSET		0xDB000
>+#define SYSCTRL_BASE			(SOC_BASE + SYSCTRL_BASE_OFFSET)
>+#define SYSCTRL_MAILBOX_INDEX		0x03
>+#define SC_BAR_LENGTH			0x1000
>+
>+#define SC_MB_CTRL			XE_REG(SYSCTRL_BASE + 0x10)
>+#define   SC_MB_CTRL_RUN_BUSY		REG_BIT(31)
>+#define   SC_MB_CTRL_IRQ		REG_BIT(30)
>+#define   SC_MB_CTRL_RUN_BUSY_OUT	REG_BIT(29)
>+#define   SC_MB_CTRL_PARAM3_MASK	REG_GENMASK(28, 24)
>+#define   SC_MB_CTRL_PARAM2_MASK	REG_GENMASK(23, 16)
>+#define   SC_MB_CTRL_PARAM1_MASK	REG_GENMASK(15, 8)
>+#define   SC_MB_CTRL_COMMAND_MASK	REG_GENMASK(7, 0)
>+
>+#define SC_MB_DATA0			XE_REG(SYSCTRL_BASE + 0x14)
>+#define SC_MB_DATA1			XE_REG(SYSCTRL_BASE + 0x18)
>+#define SC_MB_DATA2			XE_REG(SYSCTRL_BASE + 0x1C)
>+#define SC_MB_DATA3			XE_REG(SYSCTRL_BASE + 0x20)
>+
>+#define MKHI_FRAME_PHASE		REG_BIT(24)
>+#define MKHI_FRAME_CURRENT_MASK		REG_GENMASK(21, 16)
>+#define MKHI_FRAME_TOTAL_MASK		REG_GENMASK(13, 8)
>+#define MKHI_FRAME_COMMAND_MASK		REG_GENMASK(7, 0)
>+
>+#define SC_MB_FRAME_SIZE		16
>+#define SC_MB_MAX_FRAMES		64
>+#define SC_MB_MAX_MESSAGE_SIZE		(SC_MB_FRAME_SIZE * SC_MB_MAX_FRAMES)
>+#define SC_MKHI_COMMAND			5
>+
>+#define SC_MB_DEFAULT_TIMEOUT_MS	500
>+#define SC_MB_RETRY_TIMEOUT_MS		20
>+#define SC_MB_POLL_INTERVAL_US		100

1)
I missed this the last time. Can we change SC to SYSCTRL here for 
everything? I see that for the mailbox, you are using SC_MB, but at the end 
of the day SC still means SYSCTRL and consistently using the same name helps 
readability.

2)
The MKHI_FRAME definitions can move to the xe_sysctrl_mailbox.c since that's 
the only code accessing it. See more comments below.


>+
>+#endif /* _XE_SYSCTRL_REGS_H_ */
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index e101d290b2a6..805d48dd954d 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -66,6 +66,7 @@
> #include "xe_survivability_mode.h"
> #include "xe_sriov.h"
> #include "xe_svm.h"
>+#include "xe_sysctrl.h"
> #include "xe_tile.h"
> #include "xe_ttm_stolen_mgr.h"
> #include "xe_ttm_sys_mgr.h"
>@@ -1032,6 +1033,10 @@ int xe_device_probe(struct xe_device *xe)
> 	if (err)
> 		goto err_unregister_display;
>
>+	err = xe_sysctrl_init(xe);
>+	if (err)
>+		goto err_unregister_display;
>+
> 	err = xe_device_sysfs_init(xe);
> 	if (err)
> 		goto err_unregister_display;
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index a85be9ba175e..6295b2c35d4a 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -29,6 +29,7 @@
> #include "xe_sriov_vf_ccs_types.h"
> #include "xe_step_types.h"
> #include "xe_survivability_mode_types.h"
>+#include "xe_sysctrl_types.h"
> #include "xe_tile_sriov_vf_types.h"
> #include "xe_validation.h"
>
>@@ -340,6 +341,8 @@ struct xe_device {
> 		u8 has_soc_remapper_telem:1;
> 		/** @info.has_sriov: Supports SR-IOV */
> 		u8 has_sriov:1;
>+		/** @info.has_sysctrl: Supports System Controller */
>+		u8 has_sysctrl:1;
> 		/** @info.has_usm: Device has unified shared memory support */
> 		u8 has_usm:1;
> 		/** @info.has_64bit_timestamp: Device supports 64-bit timestamps */
>@@ -606,6 +609,9 @@ struct xe_device {
> 	/** @heci_gsc: graphics security controller */
> 	struct xe_heci_gsc heci_gsc;
>
>+	/** @sc: System Controller */
>+	struct xe_sysctrl sc;
>+
> 	/** @nvm: discrete graphics non-volatile memory */
> 	struct intel_dg_nvm_dev *nvm;
>
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 91e0553a8163..b6dc3030b673 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -426,6 +426,7 @@ static const struct xe_device_desc cri_desc = {
> 	.has_soc_remapper_sysctrl = true,
> 	.has_soc_remapper_telem = true,
> 	.has_sriov = true,
>+	.has_sysctrl = true,
> 	.max_gt_per_tile = 2,
> 	.require_force_probe = true,
> 	.va_bits = 57,
>@@ -701,6 +702,7 @@ static int xe_info_init_early(struct xe_device *xe,
> 	xe->info.has_soc_remapper_telem = desc->has_soc_remapper_telem;
> 	xe->info.has_sriov = xe_configfs_primary_gt_allowed(to_pci_dev(xe->drm.dev)) &&
> 		desc->has_sriov;
>+	xe->info.has_sysctrl = desc->has_sysctrl;
> 	xe->info.has_mem_copy_instr = desc->has_mem_copy_instr;
> 	xe->info.skip_guc_pc = desc->skip_guc_pc;
> 	xe->info.skip_mtcfg = desc->skip_mtcfg;
>diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
>index 5f20f56571d1..53e44a32883d 100644
>--- a/drivers/gpu/drm/xe/xe_pci_types.h
>+++ b/drivers/gpu/drm/xe/xe_pci_types.h
>@@ -56,6 +56,7 @@ struct xe_device_desc {
> 	u8 has_soc_remapper_sysctrl:1;
> 	u8 has_soc_remapper_telem:1;
> 	u8 has_sriov:1;
>+	u8 has_sysctrl:1;
> 	u8 needs_scratch:1;
> 	u8 skip_guc_pc:1;
> 	u8 skip_mtcfg:1;
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
>new file mode 100644
>index 000000000000..e0e7b0ecf2bf
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_sysctrl.c
>@@ -0,0 +1,62 @@
>+// SPDX-License-Identifier: MIT
>+/*
>+ * Copyright © 2026 Intel Corporation
>+ */
>+
>+#include <drm/drm_managed.h>
>+#include <linux/device.h>
>+#include <linux/mutex.h>
>+
>+#include "regs/xe_sysctrl_regs.h"
>+#include "xe_device.h"
>+#include "xe_printk.h"
>+#include "xe_soc_remapper.h"
>+#include "xe_sysctrl.h"
>+#include "xe_sysctrl_mailbox.h"
>+#include "xe_sysctrl_types.h"
>+
>+static void xe_sysctrl_fini(void *arg)
>+{
>+	struct xe_sysctrl *sc = arg;
>+	struct xe_device *xe = sc_to_xe(sc);

Instead of using sc_to_xe here, just pass the xe as arg.
>+
>+	if (!xe->soc_remapper.set_sysctrl_region)
>+		return;
>+
>+	xe->soc_remapper.set_sysctrl_region(xe, 0);
>+}
>+
>+/**
>+ * xe_sysctrl_init - Initialize SC subsystem
>+ * @xe: xe device instance
>+ *
>+ * Entry point for SC initialization, called from xe_device_probe().
>+ * This function checks platform support and initializes the system controller.
>+ *
>+ * Return: 0 on success, error code on failure
>+ */
>+int xe_sysctrl_init(struct xe_device *xe)
>+{
>+	struct xe_sysctrl *sc = &xe->sc;
>+	int ret;
>+
>+	if (!xe->info.has_sysctrl)
>+		return 0;
>+
>+	ret = devm_add_action_or_reset(xe->drm.dev, xe_sysctrl_fini, sc);
>+	if (ret)
>+		return ret;
>+
>+	if (!xe->soc_remapper.set_sysctrl_region)
>+		return -ENODEV;
>+
>+	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
>+
>+	ret = drmm_mutex_init(&xe->drm, &sc->cmd_lock);
>+	if (ret)
>+		return ret;
>+
>+	xe_sysctrl_mailbox_init(sc);
>+
>+	return 0;
>+}
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
>new file mode 100644
>index 000000000000..fe90d6577d54
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_sysctrl.h
>@@ -0,0 +1,18 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2026 Intel Corporation
>+ */
>+
>+#ifndef _XE_SYSCTRL_H_
>+#define _XE_SYSCTRL_H_
>+
>+struct xe_device;
>+
>+static inline struct xe_device *sc_to_xe(struct xe_sysctrl *sc)
>+{
>+	return container_of(sc, struct xe_device, sc);
>+}

I would move this to the xe_sysctrl_mailbox.c. Also compile fails here due 
to missing struct xe_sysctrl declaration.

>+
>+int xe_sysctrl_init(struct xe_device *xe);
>+
>+#endif /* _XE_SYSCTRL_H_ */
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>new file mode 100644
>index 000000000000..940ea535da2e
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>@@ -0,0 +1,409 @@
>+// SPDX-License-Identifier: MIT
>+/*
>+ * Copyright © 2026 Intel Corporation
>+ */
>+
>+#include <linux/bitfield.h>
>+#include <linux/errno.h>
>+#include <linux/minmax.h>
>+#include <linux/mutex.h>
>+#include <linux/slab.h>
>+#include <linux/string.h>
>+#include <linux/types.h>
>+
>+#include "regs/xe_sysctrl_regs.h"
>+#include "xe_device.h"
>+#include "xe_mmio.h"
>+#include "xe_pm.h"
>+#include "xe_printk.h"
>+#include "xe_sysctrl.h"
>+#include "xe_sysctrl_mailbox.h"
>+#include "xe_sysctrl_types.h"
>+
>+static bool xe_sysctrl_mailbox_wait_bit_clear(struct xe_sysctrl *sc, u32 bit_mask,
>+					      unsigned int timeout_ms)
>+{
>+	struct xe_device *xe = sc_to_xe(sc);
>+	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
>+	int ret;
>+
>+	ret = xe_mmio_wait32_not(mmio, SC_MB_CTRL, bit_mask, bit_mask,
>+				 timeout_ms * 1000, NULL, false);
>+
>+	return ret == 0;
>+}
>+
>+static bool xe_sysctrl_mailbox_wait_bit_set(struct xe_sysctrl *sc, u32 bit_mask,
>+					    unsigned int timeout_ms)
>+{
>+	struct xe_device *xe = sc_to_xe(sc);
>+	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
>+	int ret;
>+
>+	ret = xe_mmio_wait32(mmio, SC_MB_CTRL, bit_mask, bit_mask,
>+			     timeout_ms * 1000, NULL, false);
>+
>+	return ret == 0;
>+}
>+
>+static int xe_sysctrl_mailbox_write_frame(struct xe_sysctrl *sc, const void *frame,
>+					  size_t len)
>+{
>+	static const struct xe_reg regs[] = {
>+		SC_MB_DATA0, SC_MB_DATA1, SC_MB_DATA2, SC_MB_DATA3
>+	};
>+	struct xe_device *xe = sc_to_xe(sc);
>+	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
>+	u32 val[SC_MB_FRAME_SIZE / sizeof(u32)] = {0};
>+	u32 dw = DIV_ROUND_UP(len, sizeof(u32));
>+	u32 i;
>+
>+	memcpy(val, frame, len);
>+
>+	for (i = 0; i < dw; i++)
>+		xe_mmio_write32(mmio, regs[i], val[i]);
>+
>+	return 0;
>+}
>+
>+static int xe_sysctrl_mailbox_read_frame(struct xe_sysctrl *sc, void *frame,
>+					 size_t len)
>+{
>+	static const struct xe_reg regs[] = {
>+		SC_MB_DATA0, SC_MB_DATA1, SC_MB_DATA2, SC_MB_DATA3
>+	};
>+	struct xe_device *xe = sc_to_xe(sc);
>+	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
>+	u32 val[SC_MB_FRAME_SIZE / sizeof(u32)] = {0};
>+	u32 dw = DIV_ROUND_UP(len, sizeof(u32));
>+	u32 i;
>+
>+	for (i = 0; i < dw; i++)
>+		val[i] = xe_mmio_read32(mmio, regs[i]);
>+
>+	memcpy(frame, val, len);
>+
>+	return 0;
>+}
>+
>+static void xe_sysctrl_mailbox_clear_response(struct xe_sysctrl *sc)
>+{
>+	struct xe_device *xe = sc_to_xe(sc);
>+	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
>+
>+	xe_mmio_rmw32(mmio, SC_MB_CTRL, SC_MB_CTRL_RUN_BUSY_OUT, 0);
>+}
>+
>+static int xe_sysctrl_mailbox_prepare_command(struct xe_sysctrl *sc,
>+					      u8 group_id, u8 command,
>+					      const void *data_in, size_t data_in_len,
>+					      u8 **mbox_cmd, size_t *cmd_size)
>+{
>+	struct xe_device *xe = sc_to_xe(sc);
>+	struct xe_sysctrl_mailbox_mkhi_msg_hdr *mkhi_hdr;
>+	size_t size;
>+	u8 *buffer;
>+
>+	size = sizeof(*mkhi_hdr) + data_in_len;
>+	if (size > SC_MB_MAX_MESSAGE_SIZE) {
>+		xe_err(xe, "sysctrl: Message too large: %zu bytes\n", size);
>+		return -EINVAL;
>+	}
>+
>+	buffer = kmalloc(size, GFP_KERNEL);
>+	if (!buffer)
>+		return -ENOMEM;
>+
>+	mkhi_hdr = (struct xe_sysctrl_mailbox_mkhi_msg_hdr *)buffer;
>+	mkhi_hdr->data = cpu_to_le32(FIELD_PREP(MKHI_HDR_GROUP_ID_MASK, group_id) |
>+				     FIELD_PREP(MKHI_HDR_COMMAND_MASK, command & 0x7F) |
>+				     FIELD_PREP(MKHI_HDR_IS_RESPONSE, 0) |
>+				     FIELD_PREP(MKHI_HDR_RESERVED_MASK, 0) |
>+				     FIELD_PREP(MKHI_HDR_RESULT_MASK, 0));
>+
>+	if (data_in && data_in_len)
>+		memcpy(buffer + sizeof(*mkhi_hdr), data_in, data_in_len);
>+
>+	*mbox_cmd = buffer;
>+	*cmd_size = size;
>+
>+	return 0;
>+}

In all the functions above, you do not use the sc pointer at all, so  why 
not just pass xe to the functions? If you do that, then in most functions 
below you will not use sc pointer and you can do away with the sc_to_xe 
conversion altogether and pass xe everywhere. Note that you only need the sc 
object in

xe_sysctrl_init()
xe_sysctrl_mailbox_send_frames()
xe_sysctrl_mailbox_init()

>+
>+static int xe_sysctrl_mailbox_send_frames(struct xe_sysctrl *sc, const u8 *mbox_cmd,
>+					  size_t cmd_size, unsigned int timeout_ms)
>+{
>+	struct xe_device *xe = sc_to_xe(sc);
>+	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
>+	u32 ctrl_reg, total_frames, frame;
>+	size_t bytes_sent, frame_size;
>+
>+	total_frames = DIV_ROUND_UP(cmd_size, SC_MB_FRAME_SIZE);
>+
>+	if (!xe_sysctrl_mailbox_wait_bit_clear(sc, SC_MB_CTRL_RUN_BUSY, timeout_ms)) {
>+		xe_err(xe, "sysctrl: Mailbox busy\n");
>+		return -EBUSY;
>+	}
>+
>+	sc->phase_bit ^= 1;
>+	bytes_sent = 0;
>+
>+	for (frame = 0; frame < total_frames; frame++) {
>+		frame_size = min(cmd_size - bytes_sent, (size_t)SC_MB_FRAME_SIZE);
>+
>+		if (xe_sysctrl_mailbox_write_frame(sc, mbox_cmd + bytes_sent, frame_size)) {
>+			xe_err(xe, "sysctrl: Failed to write frame %u\n", frame);
>+			sc->phase_bit ^= 1;
>+			return -EIO;
>+		}
>+
>+		ctrl_reg = SC_MB_CTRL_RUN_BUSY |
>+			   FIELD_PREP(MKHI_FRAME_CURRENT_MASK, frame) |
>+			   FIELD_PREP(MKHI_FRAME_TOTAL_MASK, total_frames - 1) |
>+			   FIELD_PREP(MKHI_FRAME_COMMAND_MASK, SC_MKHI_COMMAND) |
>+			   (sc->phase_bit ? MKHI_FRAME_PHASE : 0);
>+
>+		xe_mmio_write32(mmio, SC_MB_CTRL, ctrl_reg);
>+
>+		if (!xe_sysctrl_mailbox_wait_bit_clear(sc, SC_MB_CTRL_RUN_BUSY, timeout_ms)) {
>+			xe_err(xe, "sysctrl: Frame %u acknowledgment timeout\n", frame);
>+			return -ETIMEDOUT;
>+		}
>+
>+		bytes_sent += frame_size;
>+	}
>+
>+	return 0;
>+}
>+
>+static int xe_sysctrl_mailbox_process_first_frame(struct xe_sysctrl *sc,
>+						  const struct xe_sysctrl_mailbox_mkhi_msg_hdr *req,
>+						  void *out,
>+						  size_t frame_size,
>+						  size_t *payload_bytes)
>+{
>+	struct xe_device *xe = sc_to_xe(sc);
>+	u32 frame_data[4];
>+	struct xe_sysctrl_mailbox_mkhi_msg_hdr *resp_hdr;
>+	size_t hdr_size = sizeof(*resp_hdr);
>+	size_t payload_size;
>+	int ret;

I would rearrange the variables in decreasing line length. Not a coding 
guideline, but is generally advised to do so.

struct xe_sysctrl_mailbox_mkhi_msg_hdr *resp_hdr;
struct xe_device *xe = sc_to_xe(sc);
size_t hdr_size = sizeof(*resp_hdr);
size_t payload_size;
u32 frame_data[4];
int ret;

Also, please avoid hardcoded 4 in frame_data dimension. It could be 
frame_data[SC_MB_FRAME_SIZE / sizeof(u32)]

>+
>+	ret = xe_sysctrl_mailbox_read_frame(sc, frame_data, frame_size);
>+	if (ret)
>+		return ret;
>+
>+	resp_hdr = (struct xe_sysctrl_mailbox_mkhi_msg_hdr *)frame_data;
>+
>+	if (!XE_SYSCTRL_MKHI_HDR_IS_RESPONSE(resp_hdr) ||
>+	    XE_SYSCTRL_MKHI_HDR_GROUP_ID(resp_hdr) != XE_SYSCTRL_MKHI_HDR_GROUP_ID(req) ||
>+	    XE_SYSCTRL_MKHI_HDR_COMMAND(resp_hdr) != XE_SYSCTRL_MKHI_HDR_COMMAND(req)) {
>+		xe_err(xe, "SC: Response header mismatch\n");
>+		return -EPROTO;
>+	}
>+
>+	if (XE_SYSCTRL_MKHI_HDR_RESULT(resp_hdr) != 0) {
>+		xe_err(xe, "SC: Firmware error: 0x%02lx\n",
>+		       XE_SYSCTRL_MKHI_HDR_RESULT(resp_hdr));
>+		return -EIO;
>+	}
>+
>+	payload_size = frame_size - hdr_size;
>+	if (payload_size > 0)
>+		memcpy(out, (u8 *)frame_data + hdr_size, payload_size);
>+
>+	*payload_bytes = payload_size;
>+
>+	xe_sysctrl_mailbox_clear_response(sc);
>+
>+	return 0;
>+}
>+
>+static int xe_sysctrl_mailbox_process_frame(struct xe_sysctrl *sc,
>+					    void *out, size_t frame_size,
>+					    unsigned int timeout_ms)
>+{
>+	struct xe_device *xe = sc_to_xe(sc);
>+	int ret;
>+
>+	if (!xe_sysctrl_mailbox_wait_bit_set(sc, SC_MB_CTRL_RUN_BUSY_OUT, timeout_ms)) {
>+		xe_err(xe, "sysctrl: Response frame timeout\n");
>+		return -ETIMEDOUT;
>+	}
>+
>+	ret = xe_sysctrl_mailbox_read_frame(sc, out, frame_size);
>+	if (ret)
>+		return ret;
>+
>+	xe_sysctrl_mailbox_clear_response(sc);
>+
>+	return 0;
>+}
>+
>+static int xe_sysctrl_mailbox_receive_frames(struct xe_sysctrl *sc,
>+					     const struct xe_sysctrl_mailbox_mkhi_msg_hdr *req,
>+					     void *data_out, size_t data_out_len,
>+					     size_t *rdata_len, unsigned int timeout_ms)
>+{
>+	struct xe_device *xe = sc_to_xe(sc);
>+	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
>+	struct xe_sysctrl_mailbox_mkhi_msg_hdr *mkhi_hdr;
>+	u32 ctrl_reg, total_frames, frame;
>+	size_t hdr_size = sizeof(*mkhi_hdr);
>+	u8 *out = data_out;
>+	size_t received = 0;
>+	size_t frame_size;
>+	int ret = 0;
>+
>+	if (!xe_sysctrl_mailbox_wait_bit_set(sc, SC_MB_CTRL_RUN_BUSY_OUT, timeout_ms)) {
>+		xe_err(xe, "sysctrl: Response frame 0 timeout\n");
>+		return -ETIMEDOUT;
>+	}
>+
>+	ctrl_reg = xe_mmio_read32(mmio, SC_MB_CTRL);
>+	total_frames = FIELD_GET(MKHI_FRAME_TOTAL_MASK, ctrl_reg) + 1;
>+
>+	if (total_frames == 1)
>+		frame_size = min(hdr_size + data_out_len, (size_t)SC_MB_FRAME_SIZE);
>+	else
>+		frame_size = SC_MB_FRAME_SIZE;
>+
>+	ret = xe_sysctrl_mailbox_process_first_frame(sc, req, out, frame_size, &received);
>+	if (ret)
>+		return ret;
>+
>+	out += received;
>+
>+	for (frame = 1; frame < total_frames; frame++) {
>+		size_t remaining = data_out_len - received;
>+
>+		frame_size = min_t(size_t, remaining, SC_MB_FRAME_SIZE);
>+
>+		ret = xe_sysctrl_mailbox_process_frame(sc, out, frame_size, timeout_ms);
>+		if (ret)
>+			break;
>+
>+		received += frame_size;
>+		out += frame_size;
>+	}

I fell there should be a simpler way to implement this function. I will get 
back if I can think of anything.

>+
>+	*rdata_len = received;
>+
>+	return ret;
>+}
>+
>+static int xe_sysctrl_mailbox_send_command(struct xe_sysctrl *sc,
>+					   const u8 *mbox_cmd, size_t cmd_size,
>+					   void *data_out, size_t data_out_len,
>+					   size_t *rdata_len, unsigned int timeout_ms)
>+{
>+	const struct xe_sysctrl_mailbox_mkhi_msg_hdr *mkhi_hdr;
>+	size_t received;
>+	int ret;
>+
>+	ret = xe_sysctrl_mailbox_send_frames(sc, mbox_cmd, cmd_size, timeout_ms);
>+	if (ret)
>+		return ret;
>+
>+	if (!data_out || !rdata_len)
>+		return 0;
>+
>+	mkhi_hdr = (const struct xe_sysctrl_mailbox_mkhi_msg_hdr *)mbox_cmd;
>+
>+	ret = xe_sysctrl_mailbox_receive_frames(sc, mkhi_hdr, data_out, data_out_len,
>+						&received, timeout_ms);
>+	if (ret)
>+		return ret;
>+
>+	*rdata_len = received;
>+
>+	return 0;
>+}
>+
>+/**
>+ * xe_sysctrl_send_command - Send command to System Controller via mailbox
>+ * @handle: XE device handle
>+ * @cmd_buffer: Pointer to xe_sysctrl_mailbox_command structure
>+ * @rdata_len: Pointer to store actual response data size (can be NULL)
>+ *
>+ * Send a command to the System Controller using MKHI protocol. Handles
>+ * command preparation, fragmentation, transmission, and response reception.
>+ *
>+ * Return: 0 on success, negative error code on failure
>+ */
>+int xe_sysctrl_send_command(void *handle, void *cmd_buffer, size_t *rdata_len)
>+{
>+	struct xe_device *xe = handle;
>+	struct xe_sysctrl *sc = &xe->sc;
>+	struct xe_sysctrl_mailbox_command *cmd = cmd_buffer;
>+	u8 *mbox_cmd = NULL;
>+	size_t cmd_size = 0;
>+	u8 group_id, command_code;
>+	int ret = 0;
>+
>+	if (!xe) {
>+		pr_err("sysctrl: Invalid device handle\n");
>+		return -EINVAL;
>+	}
>+
>+	if (!cmd) {
>+		xe_err(xe, "sysctrl: Invalid command buffer\n");
>+		return -EINVAL;
>+	}
>+
>+	if (!xe->info.has_sysctrl)
>+		return -ENODEV;
>+
>+	group_id = XE_SYSCTRL_APP_HDR_GROUP_ID(&cmd->header);
>+	command_code = XE_SYSCTRL_APP_HDR_COMMAND(&cmd->header);
>+
>+	if (!cmd->data_in && cmd->data_in_len) {
>+		xe_err(xe, "sysctrl: Invalid input parameters\n");
>+		return -EINVAL;
>+	}
>+
>+	if (!cmd->data_out && cmd->data_out_len) {
>+		xe_err(xe, "sysctrl: Invalid output parameters\n");
>+		return -EINVAL;
>+	}
>+
>+	might_sleep();
>+
>+	ret = xe_sysctrl_mailbox_prepare_command(sc, group_id, command_code,
>+						 cmd->data_in, cmd->data_in_len,
>+						 &mbox_cmd, &cmd_size);
>+	if (ret) {
>+		xe_err(xe, "sysctrl: Failed to prepare command: %d\n", ret);
>+		return ret;
>+	}
>+
>+	guard(xe_pm_runtime)(xe);
>+
>+	guard(mutex)(&sc->cmd_lock);
>+
>+	ret = xe_sysctrl_mailbox_send_command(sc, mbox_cmd, cmd_size,
>+					      cmd->data_out, cmd->data_out_len, rdata_len,
>+					      SC_MB_DEFAULT_TIMEOUT_MS);
>+	if (ret)
>+		xe_err(xe, "sysctrl: Mailbox command failed: %d\n", ret);
>+
>+	kfree(mbox_cmd);
>+
>+	return ret;
>+}
>+
>+/**
>+ * xe_sysctrl_mailbox_init - Initialize the System Controller mailbox state
>+ * @sc: System controller structure
>+ */
>+void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc)
>+{
>+	struct xe_device *xe = sc_to_xe(sc);
>+	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
>+	u32 ctrl_reg;
>+
>+	ctrl_reg = xe_mmio_read32(mmio, SC_MB_CTRL);
>+	sc->phase_bit = (ctrl_reg & MKHI_FRAME_PHASE) ? 1 : 0;
>+
>+	xe_mmio_rmw32(mmio, SC_MB_CTRL, MKHI_FRAME_PHASE, 0);
>+}
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
>new file mode 100644
>index 000000000000..3e472418ebd0
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
>@@ -0,0 +1,77 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2026 Intel Corporation
>+ */
>+
>+#ifndef __XE_SYSCTRL_MAILBOX_H__
>+#define __XE_SYSCTRL_MAILBOX_H__
>+
>+#include <linux/bitfield.h>
>+#include <linux/types.h>
>+
>+struct xe_sysctrl;
>+
>+#define MKHI_HDR_GROUP_ID_MASK		GENMASK(7, 0)
>+#define MKHI_HDR_COMMAND_MASK		GENMASK(14, 8)
>+#define MKHI_HDR_IS_RESPONSE		BIT(15)
>+#define MKHI_HDR_RESERVED_MASK		GENMASK(23, 16)
>+#define MKHI_HDR_RESULT_MASK		GENMASK(31, 24)

Same comment as (2) above. If the MKHI defines are solely used by 
xe_sysctrl_mailbox.c, then you can just move them there. I assume that the 
app is only using the APP_HDR and is not concerned with the underlying 
protocol/transport.

>+
>+struct xe_sysctrl_mailbox_mkhi_msg_hdr {
>+	__le32 data;
>+} __packed;
>+
>+#define APP_HDR_GROUP_ID_MASK		GENMASK(7, 0)
>+#define APP_HDR_COMMAND_MASK		GENMASK(15, 8)
>+#define APP_HDR_VERSION_MASK		GENMASK(23, 16)
>+#define APP_HDR_RESERVED_MASK		GENMASK(31, 24)
>+
>+struct xe_sysctrl_mailbox_app_msg_hdr {
>+	__le32 data;
>+} __packed;
>+
>+#define XE_SYSCTRL_APP_HDR_GROUP_ID(hdr) \
>+	FIELD_GET(APP_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))
>+
>+#define XE_SYSCTRL_APP_HDR_COMMAND(hdr) \
>+	FIELD_GET(APP_HDR_COMMAND_MASK, le32_to_cpu((hdr)->data))
>+
>+#define XE_SYSCTRL_APP_HDR_VERSION(hdr) \
>+	FIELD_GET(APP_HDR_VERSION_MASK, le32_to_cpu((hdr)->data))
>+
>+#define XE_SYSCTRL_MKHI_HDR_GROUP_ID(hdr) \
>+	FIELD_GET(MKHI_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))
>+
>+#define XE_SYSCTRL_MKHI_HDR_COMMAND(hdr) \
>+	FIELD_GET(MKHI_HDR_COMMAND_MASK, le32_to_cpu((hdr)->data))
>+
>+#define XE_SYSCTRL_MKHI_HDR_IS_RESPONSE(hdr) \
>+	FIELD_GET(MKHI_HDR_IS_RESPONSE, le32_to_cpu((hdr)->data))
>+
>+#define XE_SYSCTRL_MKHI_HDR_RESULT(hdr) \
>+	FIELD_GET(MKHI_HDR_RESULT_MASK, le32_to_cpu((hdr)->data))

Same here. MKHI defines can move to the C file. Either that or the APP api 
can be moved to a separate header - xe_sysctrl_mailbox_api.h.

Regards,
Umesh

>+
>+/**
>+ * struct xe_sysctrl_mailbox_command - System Controller mailbox command structure
>+ */
>+struct xe_sysctrl_mailbox_command {
>+	/** @header: Application message header containing command information */
>+	struct xe_sysctrl_mailbox_app_msg_hdr header;
>+
>+	/** @data_in: Pointer to input payload data (can be NULL if no input data) */
>+	void *data_in;
>+
>+	/** @data_in_len: Size of input payload in bytes (0 if no input data) */
>+	size_t data_in_len;
>+
>+	/** @data_out: Pointer to output buffer for response data (can be NULL if no response) */
>+	void *data_out;
>+
>+	/** @data_out_len: Size of output buffer in bytes (0 if no response expected) */
>+	size_t data_out_len;
>+};
>+
>+void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc);
>+int xe_sysctrl_send_command(void *handle, void *cmd_buffer, size_t *rdata_len);
>+
>+#endif /* __XE_SYSCTRL_MAILBOX_H__ */
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl_types.h b/drivers/gpu/drm/xe/xe_sysctrl_types.h
>new file mode 100644
>index 000000000000..88a34967688b
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
>@@ -0,0 +1,23 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2026 Intel Corporation
>+ */
>+
>+#ifndef _XE_SYSCTRL_TYPES_H_
>+#define _XE_SYSCTRL_TYPES_H_
>+
>+#include <linux/mutex.h>
>+#include <linux/types.h>
>+
>+/**
>+ * struct xe_sysctrl - System Controller driver context
>+ */
>+struct xe_sysctrl {
>+	/** @cmd_lock: Mutex protecting mailbox command operations */
>+	struct mutex cmd_lock;
>+
>+	/** @phase_bit: MKHI message boundary phase toggle bit */
>+	u32 phase_bit;
>+};
>+
>+#endif /* _XE_SYSCTRL_TYPES_H_ */
>-- 
>2.43.0
>

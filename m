Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99FCAD12674
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 21:37:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5609110E6E0;
	Tue,  2 Dec 2025 21:37:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BKUDf7eA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8254B10E6E0
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 21:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764711439; x=1796247439;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=udtdv5abgYxqErgNE9M876MQZCYCAHzOehw9NngUF+c=;
 b=BKUDf7eA9+vgTNzACtBgiR+ua55/BIrry57tXIDUeGiNYJzh+KWAnViP
 iI4RGgnzpu4ZCh0DimNpoHo9DIKjKyHVq+zizrkjBVBv5cEAt9k7xXLBU
 uEtLBE22r+Lvz1/bLrH5ooEgvl/9eMLKV/KX+cDS6LxJJ5LRYPlUF74nm
 URXFE9qQCrIzVHWiPoJAMxXQckS43hVTAxqstWHCl0Jupq8yPayjRrxAY
 xOQi3f6PbT9DdEUL5oc4/V54nPVDcfsgrRuou5eyASrtKbrY36zpyfsd9
 c6RR9ErtICdK/p1+YSWAgmC0R7Uqc4jnT8BBYFLxR3V+X/2+41IV6G2JW g==;
X-CSE-ConnectionGUID: OaMHuVMbSaim0idF0Jtt3A==
X-CSE-MsgGUID: ld113nBgS4i8mZGivcFJtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66637226"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="66637226"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 13:37:19 -0800
X-CSE-ConnectionGUID: tqHsx9RySXWvtAewi9LVyg==
X-CSE-MsgGUID: LXZnDW0sQ8qKff3UcEiqTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="198669516"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 13:37:18 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 13:37:17 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 13:37:17 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.22) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 13:37:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YN12Cp6nIrOnk0P/jb0DTdjbSRd8hYO8TeAIX7sixLvWpKLUlXEJJeh9r5ldkqWpp84R+vA14HM/2rfTOotJqKGT8N56TX4ot1NP561LJkEiTV2oKVMe2AcwfW9eyAOePTx68PkdEDDsVf5FfwxVwCk7T6wneENnLdg2AWZev2Te9Y2ANeEf9fTzQZHbo9/goy9G+9e5JkOi09+UhvnKwmQeEGnGrvg+3+OZRGxdGmwfRJE4opvXgK/iLhmxWe0JlR3mD0t2FDS4Po+LmmI9wTQTaQ66kDIzuAXZ7Y272u/P3ZBCbafUdosXxviKuyuNNJ8rH0xPnO2TYyD16xQ2tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4p5i1+ffV24avzlDDITPvMjfsldUsh+iYbL5JiL6aOs=;
 b=E38g+uzpumfY6cD+lfbP7yxv4cnQ4V8ftav9jVXmQV30qS8WC4WGy91F6qaV81hszq+oZCwu8eyc5IcKL6HH8BG5sxcXAKZdYKO9LEKD4D/Zck9DQi468L+C0Fml3MhKtCjV+Go35O3CZgxuDnfO8Y3M+tvD/T//iBkTsTE3QHB3a+g1MMepdwqOqgNSidUQRaQdFHwFGhJ8/F8plMd5Rhy+OFfZJYiKphXxYBF+QJr0H9wiwlPIb8BKhR5QV66kwSbGJUzq2cyD9ujvpEDi1BxwLiAyEhmcXFyCY59GfsO7T4p4azS42wkj01RzJvgWX3SQtn50/HKXP+1lmazmGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DM4PR11MB6480.namprd11.prod.outlook.com (2603:10b6:8:8d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 21:37:09 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 21:37:09 +0000
Message-ID: <2376b865-4e4c-49a8-82bc-dea2da9c706e@intel.com>
Date: Tue, 2 Dec 2025 22:37:05 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] drm/xe/sriov: Scheduler groups are incompatible
 with multi-lrc
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251127014507.2323746-12-daniele.ceraolospurio@intel.com>
 <20251127014507.2323746-16-daniele.ceraolospurio@intel.com>
 <f9690fe0-a3b0-4ecd-a488-72457440a8c8@intel.com>
 <f14a6c48-fe8b-46d7-974b-0fa475b3b521@intel.com>
 <3a5dba85-44b1-453b-921d-420ce26d55b0@intel.com>
 <25b260ed-d7e0-497b-8b88-7a376402633c@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <25b260ed-d7e0-497b-8b88-7a376402633c@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR04CA0129.eurprd04.prod.outlook.com
 (2603:10a6:803:f0::27) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DM4PR11MB6480:EE_
X-MS-Office365-Filtering-Correlation-Id: f04f5d3e-e30c-4f75-d1a3-08de31eaf2ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T3gyVlBaNmx0T2l4ZVk4TTF2cE95aVNlaFNCVTBodktvSVNOZXoyS204OGNY?=
 =?utf-8?B?WHB3UEpsZW9JYmtPQ2U3NVVabExsWUdLRGlBa1BKVnNyNEJueDhTYnYxcUVq?=
 =?utf-8?B?b3BtODhlUDJVb2ZwR2NqaGxndE5Rdmo3RWtBTzZnSk44N3pGRjVHaC9CV2ZW?=
 =?utf-8?B?aWc0OE5XNHYxb3lHNEw3Y2lEV2V4RjdYNVFraWY1MGd0U1NaTWJBckQwbi9I?=
 =?utf-8?B?Z3AyOTVKMGF2RWNoMWRQdCtHNlNLMTFScExabk43eUNqYTRkdmhFOVdUVjBj?=
 =?utf-8?B?YWhYTkpxZEhZMkFHWm9VUUVRdXlDSkp3bzFaa2hXRzZlLzllczZVTEQ5MnVY?=
 =?utf-8?B?c3JMd1hTaEVkYnJPY09tWUlJdmhxQUlwMWt3SUlVTWdxcVUrMTBXNnZweHFl?=
 =?utf-8?B?ZTE5a3ZzQlNNSXpPcWJ0Um5xRnJUektVVXhYSkQ4YnBzQVF3RVplbGR2Rlds?=
 =?utf-8?B?d2dVdVZ3amdLS1lHL0RYYlpSS1I5bUEwSXhoUHdUQ3ZoOHc3blozcVdVZXFk?=
 =?utf-8?B?cHdBRXhQY3dJNjFiRG12RWRmaXZobEQ5SWJkbEFwSmxlUjRvRUhBTUlEckd5?=
 =?utf-8?B?Zm5iai90djlNdEN4dERUdGJpNTl0dXJmVVFKSlNoQVRidURKY08zNzRuMFkw?=
 =?utf-8?B?OFFrTE9heWNuajJjcmJoSFFCNkhvSE9ZQnlibW9GYXloT3pUYlpTSTROeXFo?=
 =?utf-8?B?emxUY0ZNSm1xTmgxYmtaWHByR2lNNUhoV3Q0bWwzU3hocHNSOWUvbEJCK2xq?=
 =?utf-8?B?Mzc1djI1ZjFNR1RPYkh4NTM1d0E4b2oxU2pxL09TUmVmTDFpRlZRaHRqc29a?=
 =?utf-8?B?clloRCtVUFpZVjFUcktaTE5nYWQxazlhTHBjNlRDTGdCVHNrT1NMMVo1WTBv?=
 =?utf-8?B?Q0JzK3ZkckxhVTNGcHlpSHZ2Q3k3ci9qTDhvS2tUOFM1Z25hb3FHZ1NITW1D?=
 =?utf-8?B?aWpwRDhzcFU4bWhUM1dVaUlUdm1kSDl5RDJsUXMrQ2x6d1pOQzB0Vkc0cWI5?=
 =?utf-8?B?bTBRa3pPRXF2UHcrSWJaM1ZTMjMvQTlaV0huT0ZsMDB4eEJiUUtweHpVOGJt?=
 =?utf-8?B?TFNEQnJXUWNHYnhKSVVqTHM2NjQxUVU2RCswUmdTbFo0L3BHcjJHdTVrUWl2?=
 =?utf-8?B?Y0Y4dzVJSFNLSllBTGpFQWdxK25yZ09lN2FYT1JtTjZXZjJDdmJDc1A5VTN3?=
 =?utf-8?B?VzllcTNyUFIrUVNLWmJGMkxBbm5WZXRhZCtVcTQ4UTRNQk43anNxdTVlS2Va?=
 =?utf-8?B?QkFMMkpRZUE5WVRwbDJZUUVDRHR5cy82OTMxTU5CQVFMTXk5bXFqR2s5NERN?=
 =?utf-8?B?ZWJFRXdSc0hpVGdBemRmQzBBNElxUHBjUDdwWnVYK1dnVFBPN0plbEhPSkxk?=
 =?utf-8?B?VXhiWXNRRFhFRTZvL1NHWmhkalZEN2dMTGxJWE1kbXl6QWoxM1RHdnlRREV5?=
 =?utf-8?B?Rm4wOEJwakgrMkdnRWdKbHhJOGtUSE1idUNlT2g1L2dDN0xOY3JBY0NMMkZJ?=
 =?utf-8?B?WVVOdEFKRXRXUStNM2tVZ28yQmJCMGtsS1Z5dFNQOGFtS3I0NGdwbU1BZ3dO?=
 =?utf-8?B?RE1kL3JLTmNrZUhna1FqYnpLUHJDYzBCdW9lZlBtYmxOSVR0ZGhuRzBQNTBK?=
 =?utf-8?B?Q0hVRjlBUUlCaVM4cnhIN3EwbWw5d05ET2FKL3lEOW8yRDdQWW5seHdmdjI4?=
 =?utf-8?B?dys3OHNwdVNRVGtneEthMjZqNTVzajdDR2VxOGJiTHVFKzUwTlY5SDE2TlJB?=
 =?utf-8?B?YWFNUE5rNjg2b0ttKzJybjQycUpVUUNVQ0s4U1lDKzAyU1J3VXpvRUQyRW95?=
 =?utf-8?B?QVUrcDgrQXdudUxwQStMZ1A5SFNIbFJpOVFCRXNRUERtZ3d2WUgyOEswLzVr?=
 =?utf-8?B?d2NxVGJnR2ZZTUN3ZHFLNmFDL2pzNHZmMnIwckJ6ZjRuYWxGTS9TdGttZEJh?=
 =?utf-8?Q?VOMAMMGcteGFxjgp41s2cslKQmfrNDvC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0F6TmhSSFJNRHNTUy9LcVdSTEdBMzRsWkkvYi8xZFJlSWUxb29PZ0dqNEhT?=
 =?utf-8?B?S0hZRmhXQmZNLzFxU0Q4VWNzVDR5RkJmRDd3Rld2UkM0WHJJZ2xubEV5dzk1?=
 =?utf-8?B?S0VUeUQxUlZobUFoeTErY2JIeEIyaHNhU1NsZlpCamZCbm4rdlpkWmhNNXlx?=
 =?utf-8?B?ZmNTaDFjNU9rd2ZVeElERFZia2kyc2Z5QVFJekZ3eEdsQWJYdlRFSXRmcDU5?=
 =?utf-8?B?bVU4TWRSdGV6ZEMzMUxmMjVwN3FOZDAwNGdOYVJkbTJQQlNoR3c0WVZmY3BV?=
 =?utf-8?B?eVFaUzdzY1djVFJmRDdLN1ZZckZUck1NZnJoMkVoaTBpemdRTlkyNUVyZ21Z?=
 =?utf-8?B?Qm1CZ1VDUjZxTDcrRENIQmJQc1hhc3FEelZ1dVhDTGQzQ0xkdm5taUJQZGNC?=
 =?utf-8?B?OERPVnJZMFpWTFlIUWF6UWlPQXlobVpSVTFidFoxMXJxZWJQM0FTR3lUR3o2?=
 =?utf-8?B?Y3pmMFhhSGYxelcyL3JnZi80dlJsbEZBWDRQVXZ5YUdwc2FLbE44dWhkaktD?=
 =?utf-8?B?bCtqbHVVaFNzd2pRaEcxVlVzcnZ4eGxuWW42cG13eHpHOStZVW51WFBmc1VE?=
 =?utf-8?B?TUQyenRBZTJycU9tcUxEMjBVaDZSMEJRQnZTNkF2VTVoakxNZkdzS0tvQ1VG?=
 =?utf-8?B?YzZaR2tNcFZDbVgxR2o0VFdlWTdjalNtcHBuL2tRWHZOZ1l5L1JYWm1sZnE2?=
 =?utf-8?B?SU1WUFlVVGovR1A4aWRFWkRGM0tRbTZzNEhLRXdCbmRuVkl6SmczQnlkeXFp?=
 =?utf-8?B?cEFHUWRzUFAxL295Q1FFa0MwZ0lxWStUQmN0QzBOSmcxTW9UR0dpOUhmd095?=
 =?utf-8?B?RVhRWldHbjViUVhCL1pPdHhLRTdLbmE0M3lyQnpuc3pkTU14ellKanNseVNp?=
 =?utf-8?B?a2JqVU1scjZwbjlrV0pxMFJZL2JGWjNyQy9ya1V2dXpMOTJOc0VSaS84RHRE?=
 =?utf-8?B?TjdTb3VQODlJTnpLemc1RUxIUW5lci9EMWlwOG93bHpZRDFsd3p5UzhMNzdu?=
 =?utf-8?B?WGk1OG5wMGxwYmRNLzRZQi8vTmN0TVJqVUYyakhOSWNBQytOaklEcDZOdVp2?=
 =?utf-8?B?c1NiQk81MisvRUN6WE1FbzZmbW9zbkErR01rNHpDd2NCWlI4SEt5VmFJcE01?=
 =?utf-8?B?Rm9id2x5azhUYjgvNC81WSszc0hHVnV5YjVFdkpnQ0dTcmNUc2VBUjFEcmNp?=
 =?utf-8?B?TENNRkV1a1VhOWdCNnJLcXMzYUhOc0lFWkh6cXVocFNZZnZDZEY5OGh5Vm9x?=
 =?utf-8?B?azU4UDl4SUNEZlRrQkpPbDlhL0NTTGJtdWdYL0NVN0Foc2Z2UisyK1JmTlZ3?=
 =?utf-8?B?d2Y2bXhXVWZRK0U0VEV6TnNZdEkxcHdHOTZScHpiOXhXU1VqdVNEa3dSZVFm?=
 =?utf-8?B?ZE00c2RUdkUrUkd0VTBwVyt0L25JRzdKbGhYa25WYU5NcHRicjBTRFdEdXBW?=
 =?utf-8?B?V2RTam5ORi9Bdm5HUlEvckFqZi9rUlpUQjlTb1FuRUF0bUwzU094bkxYdWYx?=
 =?utf-8?B?R3hVRzhtaFFnVUY2VDQ1d0lzQ1VOWFpCTERUbEVJS0hETm5xMnlaYUtEb3Ri?=
 =?utf-8?B?MUw5NkhmdDErSEUwQzJLcDRrQTB0RmN0L3NURThjRVpycVpGTjVwWlNQTEhZ?=
 =?utf-8?B?ZzdReVhIb00vYUZmS3M1Z3pzRjd3U2drZWpCclNNZkhLeEZpbTJJYmlVRXE1?=
 =?utf-8?B?UHRCQ1Z5akxyK1pKcFNIalFzbm4yMVR3TXZ2dDhNZXUwa2R0dkV0MFlia05H?=
 =?utf-8?B?elBkaFd1TUdPdEZ2Yk1SNElzMXNoUVM5c3lvWkF1SU5RdGxzQ0lBNjVhQk5Z?=
 =?utf-8?B?c1EyWUhRT1RRNU9NcVJZTzBqTUEzZkwzclRmNU5iMXMwbDQybDZPUXNrR1Mv?=
 =?utf-8?B?ZW5XNkxOeDcreDg3anh6eURHb2NkcmVUajBDUVc5MWZ2eGloZ1JUZjJOQjRW?=
 =?utf-8?B?UEVPVHZqTHQ2TjJkTGZGbmNVeC9ZM1FOMXRFdWg0TXM3NFNxbGE0UExJblJL?=
 =?utf-8?B?OHorUEJ0LzYvTjM0dHorNFNIWE1pdXlQTGJpa3EvTWFTRlhTMlZkQkM3dm0r?=
 =?utf-8?B?OEtPTmQ2RGZyQTVQd01OdXZFK1pyb1Bpclh4UU5xa3hmR3AvcllFNXVDWDht?=
 =?utf-8?B?cy9jUENET2Y3VGFMRmppcFRmKzFQQU1HQk8vKzljTFQzc0d2QW1Na0lpVG44?=
 =?utf-8?B?K0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f04f5d3e-e30c-4f75-d1a3-08de31eaf2ac
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 21:37:09.7946 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cuVznB+R+UGkm82cqKcB68THNjQtmG0KZlZPedIwACMQsvjCcK302o1qmaE7dJJwoGXNHCViQQdjGu/r//9HY7DXEtZb8Ep0ujVO49ab51A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6480
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



On 12/2/2025 10:25 PM, Daniele Ceraolo Spurio wrote:
> 
> 
> On 12/2/2025 1:17 PM, Michal Wajdeczko wrote:
>>
>> On 12/2/2025 6:57 PM, Daniele Ceraolo Spurio wrote:
>>>
>>> On 12/2/2025 5:32 AM, Michal Wajdeczko wrote:
>>>> On 11/27/2025 2:45 AM, Daniele Ceraolo Spurio wrote:
>>>>> Since engines in the same class can be divided across multiple groups,
>>>>> the GuC does not allow scheduler groups to be active if there are
>>>>> multi-lrc contexts. This means that:
>>>>>
>>>>> 1) if a mlrc context is registered when we enable scheduler groups, the
>>>>>      GuC will silently ignore the configuration
>>>>> 2) if a mlrc context is registered after scheduler groups are enabled,
>>>>>      the GuC will disable the groups and generate an adverse event.
>>>>>
>>>>> We therefore need to block mlrc context creation when scheduler groups
>>>>> are enabled.
>>>> s/mlrc/MLRC
>>>>
>>>>> An adverse event threshold is available for the new adverse event.
>>>> changes related to introduction of new threshold deserves separate patch
>>>> (as we need to handle GuC FW version checks)
>>> ok
>>>
>>>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>>> ---
>>>>>    drivers/gpu/drm/xe/abi/guc_klvs_abi.h         | 14 +++++
>>>>>    drivers/gpu/drm/xe/xe_exec_queue.c            | 19 ++++++
>>>>>    drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c    | 30 ++++++++++
>>>>>    drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h    |  1 +
>>>>>    drivers/gpu/drm/xe/xe_gt_sriov_vf.c           | 59 +++++++++++++++++++
>>>>>    drivers/gpu/drm/xe/xe_gt_sriov_vf.h           |  3 +
>>>>>    drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h     |  2 +
>>>>>    .../drm/xe/xe_guc_klv_thresholds_set_types.h  |  1 +
>>>>>    8 files changed, 129 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>>>> index 274f1b1ec37f..a6dce9da339f 100644
>>>>> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>>>> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>>>> @@ -46,11 +46,18 @@
>>>>>     *      Refers to 32 bit architecture version as reported by the HW IP.
>>>>>     *      This key is supported on MTL+ platforms only.
>>>>>     *      Requires GuC ABI 1.2+.
>>>>> + *
>>>>> + * _`GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE` : 0x3001
>>>>> + *      Tells the driver whether scheduler groups are enabled or not.
>>>>> + *      Requres GuC ABI 1.26+
>>>> typo: Requires
>>>>
>>>> and don't forget to update xe_guc_klv_key_to_string() with new KEY
>>> ok
>>>
>>>>>     */
>>>>>      #define GUC_KLV_GLOBAL_CFG_GMD_ID_KEY            0x3000u
>>>>>    #define GUC_KLV_GLOBAL_CFG_GMD_ID_LEN            1u
>>>>>    +#define GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_KEY    0x3001u
>>>>> +#define GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_LEN    1u
>>>>> +
>>>>>    /**
>>>>>     * DOC: GuC Self Config KLVs
>>>>>     *
>>>>> @@ -369,6 +376,10 @@ enum  {
>>>>>     *      :1: NORMAL = schedule VF always, irrespective of whether it has work or not
>>>>>     *      :2: HIGH = schedule VF in the next time-slice after current active
>>>>>     *          time-slice completes if it has active work
>>>>> + *
>>>>> + * _`GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT` : 0x8A0D
>>>>> + *      This config sets the threshold for LRCA context registration when SRIOV
>>>> ... threshold for _Multi_ LRCA context registrations ...
>>> ooops :)
>>>
>>>>> + *      scheduler groups are enabled.
>>>> "This is allows PF to monitor VFs' behavior when EGS is enabled."
>>>>
>>>>>     */
>>>>>      #define GUC_KLV_VF_CFG_GGTT_START_KEY        0x0001
>>>>> @@ -427,6 +438,9 @@ enum  {
>>>>>    #define   GUC_SCHED_PRIORITY_NORMAL        1u
>>>>>    #define   GUC_SCHED_PRIORITY_HIGH        2u
>>>>>    +#define GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT_KEY    0x8a0d
>>>>> +#define GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT_LEN    1u
>>>>> +
>>>>>    /*
>>>>>     * Workaround keys:
>>>>>     */
>>>>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>>>>> index 8724f8de67e2..e59c41c913b4 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>>>>> @@ -16,6 +16,7 @@
>>>>>    #include "xe_dep_scheduler.h"
>>>>>    #include "xe_device.h"
>>>>>    #include "xe_gt.h"
>>>>> +#include "xe_gt_sriov_pf_policy.h"
>>>>>    #include "xe_gt_sriov_vf.h"
>>>>>    #include "xe_hw_engine_class_sysfs.h"
>>>>>    #include "xe_hw_engine_group.h"
>>>>> @@ -698,6 +699,17 @@ static u32 calc_validate_logical_mask(struct xe_device *xe,
>>>>>        return return_mask;
>>>>>    }
>>>>>    +static bool has_sched_groups(struct xe_gt *gt)
>>>>> +{
>>>>> +    if (IS_SRIOV_PF(gt_to_xe(gt)) && xe_gt_sriov_pf_policy_sched_groups_enabled(gt))
>>>> hmm, usually we don't want core code to look so deeply into PF subcomponent
>>> I thought about that, but I didn't know which sriov file would be the right one, since almost all of them are either pf-only or vf-only. should I just move it to xe_sriov.c?
>> hmm, but xe_sriov.c is device level function
>>
>> we might add helper to xe_gt_sriov_pf.h where we can also provide stub there:
>>
>> #ifdef CONFIG_PCI_IOV
>> bool xe_gt_sriov_pf_sched_groups_enabled(gt);
>> #else
>> static inline bool xe_gt_sriov_pf_sched_groups_enabled(gt) { return false; }
>> #endif
> 
> Do you mean to check for both PF and VF from that function, and just have it in the PF file for convenience?

this is PF file and only PF functions might require stubs (when PCI_IOV=n)
so it is just to hide PF internals

VF function is already exposed at GT level

> I could also just create a new xe_gt_sriov.h file and place it there, making the function an inline.

maybe later ;) we already have many files

> 
>>
>>>> also, do we want to work in hybrid mode where one GT is using MLRC and other is not?
>>> The GuCs allow it. I didn't want to block it in case we do get a scenario later where this is needed (e.g. we might get a split primary GT but still want to do mlrc on media)
>>>
>>>>> +        return true;
>>>>> +> +    if (IS_SRIOV_VF(gt_to_xe(gt)) && xe_gt_sriov_vf_sched_groups_enabled(gt))
>>>>> +        return true;
>>>>> +
>>>>> +    return false;
>>>>> +}
>>>>> +
>>>>>    int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>>>>>                       struct drm_file *file)
>>>>>    {
>>>>> @@ -790,6 +802,13 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>>>>>                return -ENOENT;
>>>>>            }
>>>>>    +        /* SRIOV sched groups are not compatible with multi-lrc */
>>>>> +        if (XE_IOCTL_DBG(xe, args->width > 1 && has_sched_groups(hwe->gt))) {
>>>>> +            up_read(&vm->lock);
>>>>> +            xe_vm_put(vm);
>>>>> +            return -EINVAL;
>>>>> +        }
>>>>> +
>>>>>            q = xe_exec_queue_create(xe, vm, logical_mask,
>>>>>                         args->width, hwe, flags,
>>>>>                         args->extensions);
>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
>>>>> index 48f250ae0d0d..c7f1ea8eb9c5 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
>>>>> @@ -8,6 +8,7 @@
>>>>>    #include <drm/drm_managed.h>
>>>>>      #include "xe_bo.h"
>>>>> +#include "xe_exec_queue_types.h"
>>>>>    #include "xe_gt.h"
>>>>>    #include "xe_gt_sriov_pf_helpers.h"
>>>>>    #include "xe_gt_sriov_pf_policy.h"
>>>>> @@ -527,6 +528,24 @@ static int __pf_provision_sched_groups(struct xe_gt *gt, u32 mode)
>>>>>                          masks, num_masks);
>>>>>    }
>>>>>    +static bool guc_has_mlrc_queue(struct xe_guc *guc)
>>>> this is all GuC stuff, so export it from xe_guc_submission.c
>>> ok
>>>
>>>>> +{
>>>>> +    struct xe_exec_queue *q;
>>>>> +    unsigned long index;
>>>>> +    bool found = false;
>>>>> +
>>>>> +    mutex_lock(&guc->submission_state.lock);
>>>> guard(mutex) ?
>>>>
>>>>> +    xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
>>>>> +        if (q->width > 1) {
>>>>> +            found = true;
>>>>> +            break;
>>>>> +        }
>>>>> +    }
>>>>> +    mutex_unlock(&guc->submission_state.lock);
>>>>> +
>>>>> +    return found;
>>>> what if new MLRC is created right now?
>>>>
>>>> maybe we should use xe_guard to lockdown one feature or the other?
>>> The idea is that the admin is responsible for enabling EGS when the system is in the correct state, which is why the GuC doesn't return an error and just ignore the KLV if the system is not in the correct state. This check is there to catch the case where the admin has closed all apps in preparation to enabling EGS but the driver still hasn't processed all the context de-registrations. Therefore, I don't really want to over-complicate it with extra locking. I'll add a comment to better explain.
>> so it doesn't have to be bullet-proof ?
> 
> Yup. If we had stricter requirements then the GuC would enforce them.
> 
> Daniele
> 
>>
>>>>> +}
>>>>> +
>>>>>    static int pf_provision_sched_groups(struct xe_gt *gt, u32 mode)
>>>>>    {
>>>>>        int err;
>>>>> @@ -548,6 +567,12 @@ static int pf_provision_sched_groups(struct xe_gt *gt, u32 mode)
>>>>>        if (xe_sriov_pf_num_vfs(gt_to_xe(gt)))
>>>>>            return -EPERM;
>>>>>    +    /* The GuC silently ignores the setting if any mlrc contexts are registered */
>>>>> +    if ((mode != XE_SRIOV_SCHED_GROUPS_NONE) && guc_has_mlrc_queue(&gt->uc.guc)) {
>>>>> +        xe_gt_sriov_notice(gt, "can't enable sched groups with active mlrc queues\n");
>>>>> +        return -EPERM;
>>>>> +    }
>>>>> +
>>>>>        err = __pf_provision_sched_groups(gt, mode);
>>>>>        if (err)
>>>>>            return err;
>>>>> @@ -600,6 +625,11 @@ int xe_gt_sriov_pf_policy_set_sched_groups_mode(struct xe_gt *gt, u32 value)
>>>>>        return err;
>>>>>    }
>>>>>    
>>>> every public function needs to have kernel-doc
>>> ok
>>>
>>>>> +bool xe_gt_sriov_pf_policy_sched_groups_enabled(struct xe_gt *gt)
>>>>> +{
>>>>> +    return gt->sriov.pf.policy.guc.sched_groups.current_mode != XE_SRIOV_SCHED_GROUPS_NONE;
>>>>> +}
>>>>> +
>>>>>    static void pf_sanitize_guc_policies(struct xe_gt *gt)
>>>>>    {
>>>>>        pf_sanitize_sched_if_idle(gt);
>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
>>>>> index 36680996f2bd..89aa3af6cc7d 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
>>>>> @@ -18,6 +18,7 @@ bool xe_gt_sriov_pf_policy_get_reset_engine(struct xe_gt *gt);
>>>>>    int xe_gt_sriov_pf_policy_set_sample_period(struct xe_gt *gt, u32 value);
>>>>>    u32 xe_gt_sriov_pf_policy_get_sample_period(struct xe_gt *gt);
>>>>>    int xe_gt_sriov_pf_policy_set_sched_groups_mode(struct xe_gt *gt, u32 value);
>>>>> +bool xe_gt_sriov_pf_policy_sched_groups_enabled(struct xe_gt *gt);
>>>>>      int xe_gt_sriov_pf_policy_init(struct xe_gt *gt);
>>>>>    void xe_gt_sriov_pf_policy_sanitize(struct xe_gt *gt);
>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>>>> index 4c73a077d314..7a180c947032 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>>>> @@ -438,6 +438,30 @@ u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt)
>>>>>        return value;
>>>>>    }
>>>>>    +static int query_vf_sched_groups(struct xe_gt *gt)
>>>>> +{
>>>>> +    struct xe_guc *guc = &gt->uc.guc;
>>>>> +    u32 value = 0;
>>>>> +    int err;
>>>>> +
>>>>> +    xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>>>> +
>>>>> +    if (MAKE_GUC_VER_STRUCT(gt->sriov.vf.guc_version) < MAKE_GUC_VER(1, 26, 0))
>>>>> +        return 0;
>>>>> +
>>>>> +    err = guc_action_query_single_klv32(guc,
>>>>> +                        GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_KEY,
>>>>> +                        &value);
>>>>> +    if (unlikely(err)) {
>>>>> +        xe_gt_sriov_err(gt, "Failed to obtain sched groups status (%pe)\n",
>>>>> +                ERR_PTR(err));
>>>>> +        return err;
>>>>> +    }
>>>>> +
>>>>> +    xe_gt_sriov_dbg(gt, "sched groups %s\n", value ? "enabled" : "disabled");
>>>> str_enabled_disabled(value)
>>>>
>>>>> +    return value;
>>>>> +}
>>>>> +
>>>>>    static int vf_get_ggtt_info(struct xe_gt *gt)
>>>>>    {
>>>>>        struct xe_tile *tile = gt_to_tile(gt);
>>>>> @@ -564,6 +588,21 @@ static void vf_cache_gmdid(struct xe_gt *gt)
>>>>>        gt->sriov.vf.runtime.gmdid = xe_gt_sriov_vf_gmdid(gt);
>>>>>    }
>>>>>    +static int vf_cache_sched_groups_status(struct xe_gt *gt)
>>>>> +{
>>>>> +    int ret;
>>>>> +
>>>>> +    xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>>>> +
>>>>> +    ret = query_vf_sched_groups(gt);
>>>>> +    if (ret < 0)
>>>>> +        return ret;
>>>>> +
>>>>> +    gt->sriov.vf.runtime.uses_sched_groups = ret;
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>>    /**
>>>>>     * xe_gt_sriov_vf_query_config - Query SR-IOV config data over MMIO.
>>>>>     * @gt: the &xe_gt
>>>>> @@ -593,12 +632,32 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
>>>>>        if (unlikely(err))
>>>>>            return err;
>>>>>    +    err = vf_cache_sched_groups_status(gt);
>>>>> +    if (unlikely(err))
>>>>> +        return err;
>>>>> +
>>>>>        if (has_gmdid(xe))
>>>>>            vf_cache_gmdid(gt);
>>>>>          return 0;
>>>>>    }
>>>>>    +/**
>>>>> + * xe_gt_sriov_vf_sched_groups_enabled - Check if PF has enabled sched groups
>>>>       * xe_gt_sriov_vf_sched_groups_enabled() - Check ...
>>>>
>>>>
>>>>> + * @gt: the &xe_gt
>>>>> + *
>>>>> + * This function is for VF use only.
>>>>> + *
>>>>> + * Return: true if shed groups were enabled, false otherwise.
>>>> typo: s/shed/scheduler
>>>>
>>>>> + */
>>>>> +bool xe_gt_sriov_vf_sched_groups_enabled(struct xe_gt *gt)
>>>>> +{
>>>>> +    xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>>>> +    xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
>>>>> +
>>>>> +    return gt->sriov.vf.runtime.uses_sched_groups;
>>>>> +}
>>>>> +
>>>>>    /**
>>>>>     * xe_gt_sriov_vf_guc_ids - VF GuC context IDs configuration.
>>>>>     * @gt: the &xe_gt
>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>>>>> index af40276790fa..2e1d34c0397f 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>>>>> @@ -23,11 +23,14 @@ int xe_gt_sriov_vf_connect(struct xe_gt *gt);
>>>>>    int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
>>>>>    void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
>>>>>    +bool xe_gt_sriov_vf_sched_groups_enabled(struct xe_gt *gt);
>>>> move it there [1]
>>>>
>>>>> +
>>>>>    int xe_gt_sriov_vf_init_early(struct xe_gt *gt);
>>>>>    int xe_gt_sriov_vf_init(struct xe_gt *gt);
>>>>>    bool xe_gt_sriov_vf_recovery_pending(struct xe_gt *gt);
>>>>>      u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
>>>>> +u32 xe_gt_sriov_vf_sched_groups(struct xe_gt *gt);
>>>> unused ?
>>> oops, old function name that I forgot to remove.
>>>
>>>>>    u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
>>>>>    u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
>>>> [1] here
>>>>
>>>>>    diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>>>> index 420b0e6089de..5267c097ecd0 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>>>> @@ -27,6 +27,8 @@ struct xe_gt_sriov_vf_selfconfig {
>>>>>    struct xe_gt_sriov_vf_runtime {
>>>>>        /** @gmdid: cached value of the GDMID register. */
>>>>>        u32 gmdid;
>>>>> +    /** @uses_sched_groups: whether PF enabled sched groups or not. */
>>>>> +    bool uses_sched_groups;
>>>>>        /** @regs_size: size of runtime register array. */
>>>>>        u32 regs_size;
>>>>>        /** @num_regs: number of runtime registers in the array. */
>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h b/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
>>>>> index 0a028c94756d..3e55d9302855 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
>>>>> @@ -32,6 +32,7 @@
>>>>>        define(H2G_STORM, guc_time_us)            \
>>>>>        define(IRQ_STORM, irq_time_us)            \
>>>>>        define(DOORBELL_STORM, doorbell_time_us)    \
>>>>> +    define(MULTI_LRC_COUNT, multi_lrc_count)    \
>>>> this needs to be defined with some version info, maybe:
>>>>
>>>>      define(MULTI_LRC_COUNT, multi_lrc_count, (70, 53, 0))    \
>>>>
>>>> and then in encode_config() have two variants of code generators:
>>>>
>>>> #define encode_threshold_config2(TAG, ...) ({                    \
>>>>      cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_THRESHOLD_##TAG);            \
>>>>      cfg[n++] = config->thresholds[MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG)];    \
>>>> });
>>>> #define encode_threshold_config3(TAG, NAME, VERSION) ({                \
>>>>      if (GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER VERSION) {        \
>>>>          encode_threshold_config2(TAG, NAME);                \
>>>>      }                                    \
>>>> });
>>>> #define encode_threshold_config(ARGS...) \
>>>>      CALL_ARGS(CONCATENATE(encode_threshold_config, COUNT_ARGS(ARGS)), ARGS)
>>>>
>>>> this should fix the issues already spotted by the CI on ADLP:
>>>>
>>>> <6> [133.603624] xe 0000:00:02.0: [drm] Tile0: GT0: { key 0x8a0d : 32b value 0 } # multi_lrc_count
>>>> <6> [133.603625] xe 0000:00:02.0: [drm] Tile0: GT0: { key 0x0001 : 64b value 0x200000 } # ggtt_start
>>>> <6> [133.603626] xe 0000:00:02.0: [drm] Tile0: GT0: { key 0x0002 : 64b value 0xfec00000 } # ggtt_size
>>>> <3> [133.603653] xe 0000:00:02.0: [drm] *ERROR* PF: Tile0: GT0: Failed to push self configuration (-ENOKEY)
>>> I think it works better if we add the version for all thresholds, so we don't have to define multiple macros every time we need to check the GuC version (which I believe needs to also be done at least in register_threshold_attribute() and define_threshold_key_to_provision_case().
>>> I can just use 70.29.2 (which is the minimum supported version for the Xe driver) for all the older defines.
>> but then the code for version check will be generated for all thresholds, even those that we are sure are supported
>>
>> I will try to find something simpler, or more reusable, but no promise
>>
>>> Daniele
>>>
>>>>
>>>>>        /* end */
>>>>>      /**
> 


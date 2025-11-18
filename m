Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B15BCEE349
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 18:42:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBA8110E10A;
	Tue, 18 Nov 2025 18:42:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dfJDQWIb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6B2310E10A
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 18:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763491341; x=1795027341;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uLV2JdCoFZ3YK3VSRbdgNfB326zFAIwKIHPxzBYRK/M=;
 b=dfJDQWIb5Sb2MUWTVrCi+n0a+fUHJzY4P0ybmXWwMPpHLYFW6xrwqo7r
 iP+p0DPt06w5rWN87dvHC0I9dr+fZbtFW1Td4J6yz3g3G8J3AqM25b+2d
 g/aEWKHxaeG5y3WxE8Xuf3oHWafdG5Eq4plHhmkXa4lW9MbA+yU3zzgCF
 YgnCqwqVpu7S6QrKEfqf6AQBBUf/y0Di5wszC88w4FvOUxpnOXPeIZIkn
 34s4yDREbJKz0EoORBPrveBKlTSlrcj9D5nU6UPkOIxXyngHX8nGKHhmz
 mVFLUQYz72wF015p3xkrrJEjL/FqKJcTC0A+91WNPnFZ8xoeKlAtvRiHa w==;
X-CSE-ConnectionGUID: UrAaw8dZTgyTZB4BhDkOHQ==
X-CSE-MsgGUID: C/5dPxrURESwzHdNJASX5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="76132523"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="76132523"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 10:41:56 -0800
X-CSE-ConnectionGUID: GyB0ZHwyQLeH02LQ+7ewUA==
X-CSE-MsgGUID: x1K6YrhMTKSULuY12o6Rxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="190094161"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 10:41:56 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 10:41:53 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 18 Nov 2025 10:41:53 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.25) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 10:41:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k/uvg8JdeNC5yThqB3A3DDmlivMlv8OtdOXU2qgptHUCEnjVwu37x4L8CyaDWKPgq3FBXuhfht+ItYXu1E16wceJeLwF7Fd65QgglYaBxdvKMXdi/AFq13zFfo6H7RwFlFWENL6eknLIvljcGnWs0gliuhz7bmuHJR6OFVNlrprIgKf202MYrFM5EDhHaYP/K7/T7ibwoR3iGbcC4tYebpwQOgZYzD/F/AD5wPiWBzgREZyJfWyXdKzQRRTzfQOy6aia1v4pbtt0QYz9h++DqC8HbPvUifJ2d5m2ANwFEhO3CnQBr2kKwRi3DCYRvF+Sc7qheCPMWp0HME92uK/8zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h/PE9llP7yPVpZ0/s35Oy28EoWjRkO6n48SSl9Oh/ck=;
 b=nJtGXyU40QFz1N3VtHvUBZPmF5cWaG4EuAEAv7pam4dzWseluWkk+w94fSCDReowblmk3EEgnSnpbHVjV8t9ybCLu054uKCTcQ/ccEkwcBGIZ6AAtR1ExYlLZ3+8LNfGrXKEjrd6jCtoM9jvEgl0zfiW+WMcIhzteCzNgC0EwnR7cnm+bGsmVq5xPp7SFmRKME+1IlJMKESAVymYlWkLpERy+nJdM1Wb+qfWuLaOPkgSUPagFGUDVDOxnKY3gWeLC7+8oSCCoBY2cc8iesHlNagN44cWGjyMxD5qohSyzDJCATY0cLb1FTzmti2lRLvV8SFHxmbOEatgNN7Uw6ppbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by IA1PR11MB7918.namprd11.prod.outlook.com (2603:10b6:208:3ff::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Tue, 18 Nov
 2025 18:41:49 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%5]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 18:41:46 +0000
Message-ID: <56576094-b17b-4f3d-97cf-405ff3504e40@intel.com>
Date: Tue, 18 Nov 2025 13:41:43 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] drm/xe/uc: Add stop on hardware initialization error
To: <intel-xe@lists.freedesktop.org>
CC: <daniele.ceraolospurio@intel.com>, <matthew.brost@intel.com>,
 <stuart.summers@intel.com>
References: <20251118170110.3579770-1-zhanjun.dong@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <20251118170110.3579770-1-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0239.namprd03.prod.outlook.com
 (2603:10b6:303:b9::34) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|IA1PR11MB7918:EE_
X-MS-Office365-Filtering-Correlation-Id: d5b02a1e-832d-4598-497a-08de26d22097
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VUtBcksyOGFFaFZRRjVSQzA3M1VMUlFNWTRFaGMyNmZsZTdlQXZqem5zQnFD?=
 =?utf-8?B?eUg2SzQxNEQrRWYvcGJTcWNEaG00eDE3d0R4UjJaZ29vOTRQcDI0dFMxdjly?=
 =?utf-8?B?alVSeTJjblErSTF4T21XdFdhS3dnaWV6bFNoNTRVL0RQUmc2SnRWTVVPOVhV?=
 =?utf-8?B?amFZSWwyblZvV001K0hwK2VwNTN2MEdCUFZqVnh0TW9PeVFxL3FJZ1pwZWR3?=
 =?utf-8?B?bXlFdGtnT1hjLysrQjVUUCttU0NWbnVxdmhHSm5jcXNZWGIzcEt6TStnVEdm?=
 =?utf-8?B?MnFpaTZmVHpGWmNsWmI3NGhoOTZ2d1RBdU5IbVB1dklJRmpXeVBhbjVFWGE0?=
 =?utf-8?B?QXc3UTVwUjVsdzhTUWsxYVQ4UmQ4ZDFlc1B1M2k5T09LcjgxUlA2L2ZLMVFn?=
 =?utf-8?B?UWpQWU9TY21wSnRRV3dlQUswUU16RTlPMnFPSTVaWmw5OTduVzhRVXBaZ1Ir?=
 =?utf-8?B?NkQxZ2dnVTVjcVpZWlM0aHJ5OTljSURFMmFLMXpIVVl2M1RlZFlIRWdvWTRi?=
 =?utf-8?B?cHcveGdLU1NvRFUrbWFuL05LUmdXTU9FSGtuYTJsMUxMbTlYZUtPVC9NQ3cv?=
 =?utf-8?B?TmE0U3JDYm43cEhFOU9mOWlySGwvRXRSeDJlS3Z1VTBFTUdPRHdHazBUTWlv?=
 =?utf-8?B?STBMc09RZkFzekhtRDVycFF0WTZwVE8wM0pOdE1rNVpIVm1JMFo5Sk1pdUJx?=
 =?utf-8?B?c0lqL0l1QzRER3JaV25ZZDlkZkFoUXNBaDV3ZG8yNmRXQitCNml4V3FzaDUv?=
 =?utf-8?B?c2d5Z2NQOHVGcFpVVUFMbi9OV1E0eFAxcGYrYWlqYnFsaWhTN0JkYmJPN2Zo?=
 =?utf-8?B?Ulh0ZmtvZjkzcUVSTGJNZks4cUFkeUdFQTJzc2R2UVJ0RG9KYURYbFZxQSti?=
 =?utf-8?B?MUhDYm8yY0hYYnQwSlFOZWtnRm55M2tHZFRoaERuSEZuNHF5YlFKNmFuMzNF?=
 =?utf-8?B?enNoWVRnOElibUxMbGdGS1I1LzRodnB0YnJSQktsT2lnQWFmMFBnQUdOcGRX?=
 =?utf-8?B?dG1TdGpuaEsxcnJBa0tyS3c3MUgwOFlOYkNhVml4OEt6QVB1Nk1zQS9XMTJG?=
 =?utf-8?B?UHFSVy92aUdqV1FhQzROZjJLY3NrR1p2dC83bTBaSUM5WXhuZFlsa2ZtYXBI?=
 =?utf-8?B?QlgxbVVJMC9ESG9DR0NGaVd6N2RJSzZCZnVOTzJPcjl4N2l2MTE1NUcrSk5O?=
 =?utf-8?B?WjUxemlTTmpXb1UrZFJwbnExK1JzVHdiNlo0NVU5T0tTTzREY1dSaTl3QkxH?=
 =?utf-8?B?djkzQXFoVEo1NUJNOWIwcUgxYk9MUzNUZ3NHQWcvV0NvYVczNzBPN0w5MUdK?=
 =?utf-8?B?TEpqMkdyVlBzbk93aG51SWFNQ1dKd0g2cUdac09rZStub0dPNmMwTkZJcjRr?=
 =?utf-8?B?OFlSNGpHbFlVTVlKU05PdlBhcWJBdlduUHIveG95VWp1Ykh5Y0YvV0xqeEtu?=
 =?utf-8?B?Q1VibUlyT0ZwdjllWmdlcEx5SVVFcVM1V3JKUDJDM1pCZXlWL3pxMnN6cWVK?=
 =?utf-8?B?VnlZdzhaU1V5T0o1ZTUvekdwa1lwbmJINnlsNGx0LzlSSE5SZldWTzUycFNM?=
 =?utf-8?B?MmZRTktNb1diZ1dyekNHUWYzS1oycFZTSGhGUzFLWlE0cERBU01jS2pFSW51?=
 =?utf-8?B?R0xPVFdNeWpkVjdQblBXRHJTbzFlSCtoK1pOVFNNSldaR0Z2OWtNZkgreHRp?=
 =?utf-8?B?SVkvd2JqWGhBeGVCTGtGN0J1cTRhUllWTDl6THNnU08vUkJ3dllYZUZ0K2pS?=
 =?utf-8?B?N2dGSzkyZm0rZjF1cDBDalJ3aEZ0ZEpkN0ZNZVM1Zm1TSE0xejExL3dMeEQ4?=
 =?utf-8?B?dGE5U1k5QVhwWFNvc09LU1dRajFOL1NacDd0dUQ1dXp1K3N6TC9xL1hiRVVO?=
 =?utf-8?B?Y1hkQmxaYjh4NnBjMERtN1pTWVNwS2VHTEl4cU1nTW1FR0E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEh4QkM5cGsrdjYvVW1MN0JOTlN2U091VmRSQjlFSHorWEdXL3pGREM0WE5o?=
 =?utf-8?B?UzQ1ZVgzZ2lnSDdsN3I4Y3BSVDFDbGlhb3BpdWVmVVQ3LzM3eXdrVmlFVnMz?=
 =?utf-8?B?RnJEdkhOR25EbVRpUHVPWDAzWFNsUkw4bFhJeVdSV20zNFB2Z0VheUpNZDNt?=
 =?utf-8?B?MmxGd3V5dEhPQTNtMXNOeU5pRmFiL3VzVlZtUG9qNXFjK1h0SmVLS1kvZERw?=
 =?utf-8?B?NkFBWHBpZkQwdTVRcGkrbXNWc2hLR294azlxM0VCMnY4QWk3YSswV1hRZTRC?=
 =?utf-8?B?TGxyWDg5cFIzUGNPSy9xMmtubDNTbWpESEZTV1drL0pOZXdkdTZjQ3VsTEVZ?=
 =?utf-8?B?M1pNZ2hpMHJLd2tHQzdqdTMrT2xCYkF6TWVsNFhJM2xoUlBpWlBROVJHR24x?=
 =?utf-8?B?d01xRHoySlRaZitaalZiWG9vSlBDWEFnWXRjcG5NZXZsR2xxNU8vcUh1Nlp6?=
 =?utf-8?B?aUczUGZXdU5WbmRPR1pKZ1RWYnQzdlcxazA2UGZ3ZlRRV0pFdUhCT2l1NGt2?=
 =?utf-8?B?WDU4aWZsSFNCbVIrVHpXd1c0UFRkUlE5WDc2OXRkUW1oRWdwc0NLTVM1MTcy?=
 =?utf-8?B?KzBVSlYzbGpPQWZNRmQzdVRoMjc3b2RhWTh0RlhJdFJUQkFZNkE0emdWSWh4?=
 =?utf-8?B?N04xeCtWRzVJWHdZSXZCbGwySlo3eHZodE14RVhyRjBpVGM4U2RPU0Y2WmFs?=
 =?utf-8?B?TUszMmNvMDZ2bzRhMEs5ZVZYb29KMkd3REV0RERoSXI1MjZ4NHkyOEFQdndp?=
 =?utf-8?B?WTFyd2VpUzIvRG51djdCcm5pTm9OeU1xVHdRUlpuTXkwRXFDZ0xZK05WOFpm?=
 =?utf-8?B?VGFkRTFnMEdSUGwwNms1VkowWG01V3JZcGpuLzZIcGVGKzhYYjV3UTh5USt6?=
 =?utf-8?B?Z0paWHI2aEcwTkkzblp4TkFQQ2dpT2NmOHE1N2wyK21lRE93UlVWdVVZZW5l?=
 =?utf-8?B?czd3ZXFsU3BEMVk3TUI1RDVjclVmNks0aXZmeGlvNXVDRlREZmwzQzdoOW1H?=
 =?utf-8?B?Zk41bkpBYUMydkhRRzdvNFVVSFVlMk56RmVNMy9VSmFmLzFzWEVIOFRLRXRS?=
 =?utf-8?B?Q1RESjVTSzNTODMyZ2FFVW1UTWRUM2JEL1laeVEwS21mbmFyTVdmNEZoN2l5?=
 =?utf-8?B?TTNhL2MycnZpVDlZM2xyUFRnRVBoZkYwOVQ0UGdTdXRoRUt4V3E0RnZIWENG?=
 =?utf-8?B?K2lZbEJtdUxYVkF3K1J2clFjWXZqRXZxMngwQlA5UXRZSnlVbkg3QUxZZmZh?=
 =?utf-8?B?K2xHUTFkOThEL0RRNXE2QWFYSzM3SGVQeW9nWm5oL1ZidGF2UlhiL0lPL3o3?=
 =?utf-8?B?UU96U3lwdEJhdmV3OW1DTFM5ZWZwbmJINitNRE9CVEtVN3hVbmlpKzFlVTlW?=
 =?utf-8?B?ZDV3NHZjbHR0aGVWU1E3VldMVkJVZi9NY1pYNDlQTzVwVDc1SE1EQStRUWEv?=
 =?utf-8?B?UTRyVmxIcTUxSVZtMjFMTk1QNWUrRVJTTGlDMGdRcjZianRJSVdzZnExZWFw?=
 =?utf-8?B?K2lveEIxdUJTRGdUTEx0bkRwajVrejZwVFduaUx5OVFjTGtUVGVTV3FscG1W?=
 =?utf-8?B?WEFpREdTMnJXcFlNZjZOZzFlQzU3cnlNUVRWTXJxY095Zm1RT0RwUWx3UlQv?=
 =?utf-8?B?QUlnQTNXYTVUQ0JxaEVlL0RCWldqRXBONmpSME1SYm9qUzg3VGZDMHZheEpJ?=
 =?utf-8?B?SnZhZUowYVNlVzRpY3dpSURTK1ZVcG4vWTF6eFlBQXVkZDlKUEVvVVVjNTQ0?=
 =?utf-8?B?UXdOMzN3MmJ5ZzFVRGFIUDl4eWFRSVg5MWlKaHE1ZlhDQjQ5SjlpaWczYWVq?=
 =?utf-8?B?WWwwVFZUZTh0aW5rcjNSVkJyaGFjTGpzWnNDK2NLVEpJcW5NVXJGMFpaWGgv?=
 =?utf-8?B?bDFhUGU3RlVYU1FWaHRYbTErNE05YXJIdlRGdjFLODczcXJJYy85Qzg1NFJX?=
 =?utf-8?B?aHE3WjJJOUxFa3J1SjcrK3l6VE1WYlhqQjlqbk9mcHo2Y050WTlSMXA4OGwy?=
 =?utf-8?B?RUxUM3gyeVRENkJHM2xmcFJwTHZ6bmV2U3RwUm1vSGh6bUxWNE5SQWJsMjIy?=
 =?utf-8?B?S0I2NElNaWtxMmJtcDduUnZycmgxbExpN0NJLzVGdmhxMlRSeEczTmNMWnVq?=
 =?utf-8?B?YUlBaHhPVlJMRGxyUTI5dzVIRCttMkZ0OEd6WGJiNjZ1NlVWOFo2aU5xbHli?=
 =?utf-8?B?UVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d5b02a1e-832d-4598-497a-08de26d22097
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 18:41:46.7172 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PeTh0/3alG4eDAkMvnlVstSnFv1mxYnr99bDGKkh3syDpkKA/XM51tQccYz5VK3vEg6NuAwLcKmCRmJ6yLvrgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7918
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

Hi Matthew,

About call xe_guc_submit_pause_abort in guc_submit_fini before 
wait_event_timeout, test shown queues allocated in 
xe_gt_record_default_lrcs call trace, as shown in this commit message, 
have the flag is not match what xe_guc_submit_pause_abort designed for 
(exec_queue_killed_or_banned_or_wedged).
Expand condition might have unexpected side effect, here I want to limit 
the change within GuC scope, so new rev posted to add guc_stop in 
guc_fini_hw, please take a look.

Reards,
Zhanjun Dong

On 2025-11-18 12:01 p.m., Zhanjun Dong wrote:
> On hardware init fail, the hardware might no longer response, add GuC stop
> to clean up exec_queue items.
> At driver unload path, add call to GuC stop to clean up queue items. This
> clean up will fix memory leak issue like:
> [  189.997904] [drm:drm_mm_takedown] *ERROR* node [00f0f000 + 00007000]: inserted at
>                  drm_mm_insert_node_in_range+0x2c0/0x510
>                  __xe_ggtt_insert_bo_at+0x167/0x540 [xe]
>                  xe_ggtt_insert_bo+0x1a/0x30 [xe]
>                  __xe_bo_create_locked+0x1f3/0x930 [xe]
>                  xe_bo_create_pin_map_at_aligned+0x59/0x1f0 [xe]
>                  xe_bo_create_pin_map_at_novm+0xae/0x140 [xe]
>                  xe_bo_create_pin_map_novm+0x23/0x40 [xe]
>                  xe_lrc_create+0x1e4/0x17c0 [xe]
>                  xe_exec_queue_create+0x38a/0x6a0 [xe]
>                  xe_gt_record_default_lrcs+0x117/0x8b0 [xe]
>                  xe_uc_load_hw+0xa2/0x290 [xe]
>                  xe_gt_init+0x357/0xab0 [xe]
>                  xe_device_probe+0x403/0xa30 [xe]
>                  xe_pci_probe+0x39a/0x610 [xe]
>                  local_pci_probe+0x47/0xb0
>                  pci_device_probe+0xf3/0x260
>                  really_probe+0xf1/0x3b0
>                  __driver_probe_device+0x8c/0x180
>                  device_driver_attach+0x57/0xd0
>                  bind_store+0x77/0xd0
>                  drv_attr_store+0x24/0x50
>                  sysfs_kf_write+0x4d/0x80
>                  kernfs_fop_write_iter+0x188/0x240
>                  vfs_write+0x280/0x540
>                  ksys_write+0x6f/0xf0
>                  __x64_sys_write+0x19/0x30
>                  x64_sys_call+0x2171/0x25a0
>                  do_syscall_64+0x93/0xb80
>                  entry_SYSCALL_64_after_hwframe+0x7
> and:
> [  189.973775] xe 0000:00:02.0: [drm] *ERROR* Tile0: GT1: GUC ID manager unclean (1/65535)
> [  189.981731] xe 0000:00:02.0: [drm] Tile0: GT1: 	total 65535
> [  189.981733] xe 0000:00:02.0: [drm] Tile0: GT1: 	used 1
> [  189.981734] xe 0000:00:02.0: [drm] Tile0: GT1: 	range 2..2 (1)
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5466
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5530
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
> v5: Move stop flag set in guc_fini_hw
>      Change to uc_sanitize in uc init path
> v4: Add memory leak fix
>      Switch to xe_uc_stop
> v3: Switch to xe_guc_stop
> v2: Switch to xe_guc_ct_stop
> ---
>   drivers/gpu/drm/xe/xe_guc.c | 3 +++
>   drivers/gpu/drm/xe/xe_uc.c  | 6 ++++--
>   2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index a686b04879d6..48b0aece5020 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -662,6 +662,9 @@ static void guc_fini_hw(void *arg)
>   	struct xe_gt *gt = guc_to_gt(guc);
>   	unsigned int fw_ref;
>   
> +	/* Set stop flag, even submission not initialized */
> +	atomic_fetch_or(1, &guc->submission_state.stopped);
> +	xe_guc_stop(guc);
>   	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>   	xe_uc_sanitize_reset(&guc_to_gt(guc)->uc);
>   	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 465bda355443..fa9a9649afe3 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -173,7 +173,8 @@ static int vf_uc_load_hw(struct xe_uc *uc)
>   	return 0;
>   
>   err_out:
> -	xe_guc_sanitize(&uc->guc);
> +	xe_uc_stop(uc);
> +	xe_uc_sanitize(&uc->guc);
>   	return err;
>   }
>   
> @@ -228,7 +229,8 @@ int xe_uc_load_hw(struct xe_uc *uc)
>   	return 0;
>   
>   err_out:
> -	xe_guc_sanitize(&uc->guc);
> +	xe_uc_stop(uc);
> +	xe_uc_sanitize(uc);
>   	return ret;
>   }
>   


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28210C0218A
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jan 2025 20:04:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6E0910E0A6;
	Thu, 30 Jan 2025 20:04:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k4OpLfim";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 647F210E0A6
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jan 2025 20:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738267456; x=1769803456;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=p/hoEhU1JLcJSOJR+DRCG71takIS0MzSy6mzE9EeLSY=;
 b=k4OpLfimCfZBVI5H+EK4eCS7E6aD3tHiralaC8gPZZh5G4j9Rkn4MIPF
 4MZgNhYgrIplW6x/CQ+LXmA3EV/nUgX1G8fAGtPl6gyVMNT0cvLOBMVRX
 DWose/IDfdPnrueYkqNCgCpUc1CYKQOg6P6zyc83PtpHVnLsPDRxqE9lf
 XybBl+FfZOhk1C/fVBg2Cn6nd7GdqwAa8X0DWZvPRTIZywsQv4JP/AELl
 P7NZ7HYp8LPGqfrjveUm39C+FODaZi+sX7Ujvili9yUeE/3TXqViAZcuE
 wi7mkO8K9ooytVIdw18uaoqvXVvHqkOLoAEr+8EO6dfjrWOuheN95q9TU g==;
X-CSE-ConnectionGUID: 1ZMilo4KTjOaKRpC0/78Bg==
X-CSE-MsgGUID: 41N9vLX8REieKI21/IRYeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="49821013"
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; d="scan'208";a="49821013"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 12:04:16 -0800
X-CSE-ConnectionGUID: Rqb1KK8GTkqDF9Nk0Y3YUQ==
X-CSE-MsgGUID: alKNZKO/QAOPtlFTkqzBDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="109887777"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2025 12:04:16 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 30 Jan 2025 12:04:15 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 30 Jan 2025 12:04:15 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 30 Jan 2025 12:04:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J4DdKReshi2BRN9Dvlu3FDxc8944mDoa56+mlw9EaOwBQY9ERdG6u8/thhAbq1ELmWAOvQ5/4Ztkr4aa7aGeiRMn4QoLWeVDupkxUgxxW79okc+gET6l+32j9vmQKDaXOlAw0vfdTFI99o9nnvh0ONpkhlmAu4VEHtiTDSspaUfUGZ5xsJp816Io2qeOjxNDVlE83WyVlKROMV6LscpbKxyMwi3suswXSt+CWpc+X0I3E4xeJP/yCsG/LealpVs3nrCLt0fdnihufqx+p+uS+P4tGJVHcQBN9euqWE7p5MAywe8XWT1mFgnRDGRzU92pEo4HmJ8xcrzT2ci+p+Smaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1kdBDepNzekuVoxC5GgCSGGGB6D8SgFxF5xK7gR1BjI=;
 b=jw6RfXk+NIRFjlSFKJNW9U2IYlf8ScuHbMz2GKhg/OwtnjNws9UccCie2Sx4IaXQiIG4jXCnQ3cTiaBzaeNL/nLm6MicWAqIdm8HEoIZnLGqoc8cgons33No9fp5omChkL1Roh2N6avqcXMm6F01zeyMuSQFFqVL96NLLdag+IPRNbQKvIQX3AdppPJscWb4uBx0w0O79vnGvoRptaOfve0gkep14vFCQfzUiPR+rkdc4Brx+FpHitQ0vgAK4iZTyPoNI+2lhOK1cdD95Vxm+Na9K56n7sVjZYwAiMRwi94mNCuIZYX18Sdo3Z+boQWCiuJB0pqYnJH6X9oi05VHEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by PH7PR11MB6497.namprd11.prod.outlook.com (2603:10b6:510:1f2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Thu, 30 Jan
 2025 20:04:12 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8398.018; Thu, 30 Jan 2025
 20:04:12 +0000
Message-ID: <04bca992-f221-443e-9da5-3fb235ad52ea@intel.com>
Date: Thu, 30 Jan 2025 12:04:07 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/8] drm/xe/guc: Bump minimum required GuC version to
 v70.36.0
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <lucas.demarchi@intel.com>, <vinay.belgaumkar@intel.com>,
 <soham.purkait@intel.com>
References: <20250129101653.1976699-1-riana.tauro@intel.com>
 <20250129101653.1976699-6-riana.tauro@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250129101653.1976699-6-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR04CA0001.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::11) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|PH7PR11MB6497:EE_
X-MS-Office365-Filtering-Correlation-Id: 020f9a0a-376d-47e8-c447-08dd416943aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dldRZDNZTDZvTEsvZnFUZmV2OHVmRDJuZGltZGFhUzYxZTRJZ3VRUCtVWHQx?=
 =?utf-8?B?ZTk4ak8xSElUejdnYmUvMVFCNFFsTHpmcDRzbEg1bUlEbmJBdHJrbllnaFZD?=
 =?utf-8?B?SGVMeGVXOVVuTEhjNHVoU0NiOE9hbFdGWDNMbzRRYVN4bVJlT2pCKzRkUk9r?=
 =?utf-8?B?VE5KUnl3R3hBMEtJYTBvUEpsQTF5ZDIzUFA5YmROTlRsT0p5S1JjTXdkN2c0?=
 =?utf-8?B?Yy9meUFsN1lncVF6QmpQT0NZaHpTVnY4SWJTay9oYm9OM3JhN243M2pnSGVW?=
 =?utf-8?B?YThFVlFmMU1vUDdHd2NGbDR1RlE5S1ROWFRqenB1aG40US9jVzY2OXJ0dzFi?=
 =?utf-8?B?K1lGU2JBQUVoM3VXR1pEU3Q0MFNPT0JBUUVVMFBSaUdNMVpzZ2RYWWVZeDNv?=
 =?utf-8?B?UFFOMzNOaVdndzU5WXZUQlRaY25LQXhBRFJVOVcvNHNtL3pZbzBVS1RGeERo?=
 =?utf-8?B?UmpzK0VIc2FvcHZjdDM3Qlo5Zk9ZZXIvY0xFcHU1SEdvS2FQaWNCQ3dJZnFq?=
 =?utf-8?B?eEhZWHhjbFdYaThoWXRMdmdKeWk5M3lsck5BM0tVZG44Q2FrTmQyR3pmUGR5?=
 =?utf-8?B?Y2VVMUZuRnd1WUh2enk5V01kUS9OSC96bHNwK2Q4RWc1Vkh5RktNc0s5eU9T?=
 =?utf-8?B?OGZjNjdyNW5oVjVDdXBPUmtGZEl5ZmNWSWJUUXNaOXU3ZDNiVGJaNmM0Y28v?=
 =?utf-8?B?K0JQcHpUdHFXdEhGMUFkS3lzK3pvaFdVMG1JbHpHak12MkdiaVF6RW00eTRh?=
 =?utf-8?B?VFZaTGFhMHNsZy9vaS9SYU5RaVNLQUFWTzI3amQ3TzQ0UitVdHQ3VlJVNlNQ?=
 =?utf-8?B?SXYyTUZpUDdPcHErVk9EeVdaQWxpUENYMmlVRlMzcDd5RWIrNjg1anNyZHVH?=
 =?utf-8?B?VjRkcGs5bWNEUmp5dGVzaFA0QWpqeXhrUGhIR0Z2M2cvc3ozS2toc0xTMlFD?=
 =?utf-8?B?RWdPRS9vSTY4UWtJMW1URnk3QjArYmFaM2g1RGQ5SW9DdWZrd2hIMkR3SVpS?=
 =?utf-8?B?dDRFWmp1Skl4b3NsUHFuRnlUR3JBd1FZNkRCOGlWVGJOVXVxRk1XcG5LckZx?=
 =?utf-8?B?MlBneXp4TWtqbFpkbU8yNldLMTBKY0Exay81b1F0RjBLWFF3YWFDa1R0ajEw?=
 =?utf-8?B?bU40VFQzd1lUR3graWZIamdCU2lCdzU4V2thdDd4bjFUcW54aFptSTNSQ1VG?=
 =?utf-8?B?VTFFMHhHeldqbnh1MnA3M2VoVVd4UG9XNGVmQU5Uak1wSS9SdGlqd2k5MThi?=
 =?utf-8?B?Y0ttM0pZbVRXVzYwMW9rOUc0SCt3QWhWck1YL3FobnZUdnlNR2IyaitwZHUx?=
 =?utf-8?B?dnBYZ1JYTndHbWlybjZ6SU0wQndRSGNNbG9ySExHb25VSEt2Yzdwci9NTXhY?=
 =?utf-8?B?ZFNwcTBCYzNVVTFqNlRxa0FKaE01ejJmcHBOTURwWk9VbGY4aHZWWTFkSlVP?=
 =?utf-8?B?M1J2d3RiTFF1OHdPUHIrVzJCaFBnQkpmRHRvdWx2Wnp5RDdIMUdHNHgzMXU3?=
 =?utf-8?B?djZZTEY4czRMOUh5WFhybHBhRWZhSW5MWTV0YUMrWUowOEhlT0FONXA1KzBJ?=
 =?utf-8?B?SFZPQU10eC9lSmdUWWplZnF1MmEwVDRTMmpFSWJUUmIzakQwZGg0NUVPYTYr?=
 =?utf-8?B?U1NyY1YwU0laNjhVRmszNitHYmRSQkNXZDFTMWYzL0kvdG80RlZHK0VaRnN6?=
 =?utf-8?B?YmxCdEhCdkhRWnQxYW5CL29mNEt0N1ZCUURDbVVwT2RocmdxRFBoamZzRysr?=
 =?utf-8?B?QVZ1bDIyNTRQZmhjVER0MHNUbVM3dE5uYjFYdHNHWHQycXRieWo5elkyRCtR?=
 =?utf-8?B?YlZkOFdSRmhZQ3JPZ3hnWEwwYVg3dVZHZ2RQS1dFWmIzZm1wYlo4cFMranlS?=
 =?utf-8?Q?HMtvabumE7YiB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nko2aHJjMTN5MG1EZFZ1VFhQK05Sd1pER0dnbmZ4a0c0dnVXSWJDQlFUVVRD?=
 =?utf-8?B?UUJaZWZFd2NyZHVWVklYR1V4RWVGS2ZmKzBjZGlockJUY1cwbXpqenJ0eWEx?=
 =?utf-8?B?WWxDZFRVaEh6NkY2UUdLUVBlbTdQdmQ5WFdjSzFiRmFISGVrVnk5RWNxdWNF?=
 =?utf-8?B?V3lQeVZxVDNmMVVhLy9GSnQrZzFvOExGMWo1cEhYTGtmUUJUclU2cUpmYXZN?=
 =?utf-8?B?bnU0NXcxVzR3Njd5a0xsOWtMdWJGTmszYWl2VS9UM0dWNGJnMVZkZVBadEhj?=
 =?utf-8?B?R0lzdGVBMm4xWTNDUDByWE9TQmNuVWhkVUdSeDFLUWMyaTFwMExtcjJoRlRJ?=
 =?utf-8?B?cEYyYzA4U0E0blF4YTZXRTFxeTQxbG0rNE1CNXFGdXZ6ZTJ1a0F3L3FWRXhW?=
 =?utf-8?B?VG9OT1RkUldOT3BwWWV0R1BaTDArTE9ZRnBlSnArNGZCanlBMVlWNlFjT21i?=
 =?utf-8?B?NXVBTkkydjZJVHJHb1l6WE95RWRMUHZlZFZXQ0pqY0o5R1dPVjhYd21VejUr?=
 =?utf-8?B?d1c4NEtheUQvTE1vOWIxQ01vbkVGWFpIaFh4UlAxWnY0Njc1V0tTZGIwcnZ3?=
 =?utf-8?B?YkFOaVFneVFYVnBoN2ovOGdjY3krbkZPc0g1N2srN0tva3VUVUJvK1V4aktE?=
 =?utf-8?B?dmdVQzZERXBBSktnV1hORHgvZ3BZaUttSEVCekRvWEd2VkJ1cDdqdmppcjB3?=
 =?utf-8?B?aE40MFl6VE5VdmxVam14Uy9ndmJidEU5NTBpeWRsejBlekRzK2JrMG8rRXNE?=
 =?utf-8?B?ZHR1aWVERUVIOWxlNDdnOHZGZ01ISmVMUW5abWovQlFJZDhHUkRsdlNCUmQr?=
 =?utf-8?B?Rk5tck5wbnJVUFE0Sk1MZkFDdXpqb1FSbCtwUmZMTm1rMkpsWnliK05NSUtM?=
 =?utf-8?B?VXFKcmc1cWY5SUJUcHhXc1pRcE0xUGk2bDRsVUNtYURRc0pkNnJiQ00rQnZv?=
 =?utf-8?B?cEZyY0dmUk0zanhSZUVkNEVETkMyYTlIaTlucURvYWRQYnBMU0JBZ3FrWTBM?=
 =?utf-8?B?M3VmRGlONGd0Z3Y2Y2tMMkFZNTh0YjJ4aFdKU1RyTWRvSmNiYk1JS0NzTkRm?=
 =?utf-8?B?QVpwc2lzdzROL3lyN25BaEs5VFZSNWNBZWpkdUZyTWZ0eW1WY0tibzBHNzlQ?=
 =?utf-8?B?aHpXZWxzRHg0SUlVTUZnenFFbEwvT2RLUHgrTCthbTZPeWtwNVF4QnlwcE44?=
 =?utf-8?B?aEV3dVBsMG1jTE0wS0dtU25TL0JXRkovMUVEMENQNHBiRXBLWnB6TldVQ21m?=
 =?utf-8?B?VHRlRW1FNTJINnRhYzVWcng0TmdFT3Y1RnQwWDBIdXVzV0F2VVdzb0VXREpQ?=
 =?utf-8?B?RmNGeXBPbjBxcWYySHBQck1LUUpEc2pNSXRXMXBqUnRiSWhET1lwZ2g0bXpq?=
 =?utf-8?B?L3ZFNFVsRnJBOFQrbWlBa05EakMwY1lVdWtJVHJoRmx5VEoyR0lFaXVQNS9j?=
 =?utf-8?B?aUNwMVJQTjVxeE5MY1R2aS9oWFRjL25HVitHaW1oZlFsWlJOeEt6SWZsUTFV?=
 =?utf-8?B?dmwrN3FYRk16dmJ0SEhDc1MxMlNZN2dsRUJwN2FwNC84STM0aExKb3ozNnJJ?=
 =?utf-8?B?eit4VUxBaXQydGdpOUtFMTRSMXZLNkE1ZXRiTmFvMUtqV2xmU2l2aFJ5dDc2?=
 =?utf-8?B?ZVFGcERybmorRy9URGI0OU42eWFmYWdreElicEdsVTJJZ3U4akgzYnNieVVk?=
 =?utf-8?B?UGRiU0FXWkJTOUVDTkpwazB4UG12dlBXWUp0c0lUYitnY3V3cUg1eWUxeUtL?=
 =?utf-8?B?Ty8rZFFTTGFQS3VtTlpucktQSU9CWHZpQTU3MUMrN2lqMEpaY0tjbUZJa0NV?=
 =?utf-8?B?VGFjeDRSUzlhTXhNZ1JLV0tMNnJHVzk1cW1qRk1lSkRTZHBvRklaYmlWUmth?=
 =?utf-8?B?SDBIUE1HNndKYTlmSncxdkZsWHE2aEJteDhyOXh4SzNzSitweWtqL1RqeFJr?=
 =?utf-8?B?YkhHdFBLaUpBZVV1SjBxdjJTMmkzYWk2OVpUM0xtcUlKOHRLRkdCcTdzVzJT?=
 =?utf-8?B?dGRXelB3b3Z2VWhiWXVYRkRNV05MK0RPRVI3QlpmU1RLblduak41VW5MSmZ3?=
 =?utf-8?B?emNuVmVTbDRWTGVEamJZSkdKVHFFaWJvYlZYNTZpdUkySU5JQ2cwUzhNM0VO?=
 =?utf-8?B?Q3J2cGZ0TWtHcWVRYU4yUlN2YTNNQTIxS2FqZlVJRTQ3WVh1Sk51c0puTCt6?=
 =?utf-8?B?WUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 020f9a0a-376d-47e8-c447-08dd416943aa
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 20:04:12.0917 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7vFfzuxfABk1uKwG0ymXDH93g1RkXutLHma9WIsMgaqJxAx/VTGLhfElNUCWYDw/DC8Yrv46lBqt4wa39YnQn6i7Q5dGxtoVOkw/M+Rq88g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6497
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

On 1/29/2025 02:16, Riana Tauro wrote:
> The VF API version for this release is 1.17.1
>
> Bump the minimum required version to v70.36.0 to support
> engine activity.
We can only bump the minimum recommended version, not the required version.

>
> Suggested-by: John Harrison <John.C.Harrison@Intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_uc_fw.c | 28 ++++++++++++++--------------
>   1 file changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index 18e06ee9e23f..d9ff285c5d1d 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -108,17 +108,17 @@ struct fw_blobs_by_type {
>   
>   #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
>   	fw_def(PANTHERLAKE,	mmp_ver(xe,	guc,	ptl,	70, 38, 1))	\
> -	fw_def(BATTLEMAGE,	major_ver(xe,	guc,	bmg,	70, 29, 2))	\
> -	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 29, 2))	\
> -	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 29, 2))	\
> -	fw_def(PVC,		mmp_ver(xe,	guc,	pvc,	70, 29, 2))	\
> -	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 29, 2))	\
> -	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 29, 2))	\
> -	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
> -	fw_def(ALDERLAKE_P,	major_ver(i915,	guc,	adlp,	70, 29, 2))	\
> -	fw_def(ALDERLAKE_S,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
> -	fw_def(ROCKETLAKE,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
> -	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 29, 2))
> +	fw_def(BATTLEMAGE,	major_ver(xe,	guc,	bmg,	70, 36, 0))	\
> +	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 36, 0))	\
> +	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 36, 0))	\
> +	fw_def(PVC,		mmp_ver(xe,	guc,	pvc,	70, 36, 0))	\
> +	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 36, 0))	\
> +	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 36, 0))	\
> +	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 36, 0))	\
> +	fw_def(ALDERLAKE_P,	major_ver(i915,	guc,	adlp,	70, 36, 0))	\
> +	fw_def(ALDERLAKE_S,	major_ver(i915,	guc,	tgl,	70, 36, 0))	\
> +	fw_def(ROCKETLAKE,	major_ver(i915,	guc,	tgl,	70, 36, 0))	\
> +	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 36, 0))
This part is technically fine, but note that we have just discovered an 
issue with recent GuC releases which means we need to wait for a bug fix 
before updating.

Also note that the purpose of the minor/patch version numbers in this 
table is just to provide a notice to the user that they should update. 
So after the update to 70.36.0, if a user boots a LNL with 70.29.2, they 
will get a line in dmesg saying "please update". But the driver will 
still load and run with no negative effects.

>   
>   #define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)		\
>   	fw_def(PANTHERLAKE,	mmp_ver(xe,	huc,		ptl, 10, 2, 1))	\
> @@ -320,9 +320,9 @@ static int guc_read_css_info(struct xe_uc_fw *uc_fw, struct uc_css_header *css)
>   
>   	xe_gt_assert(gt, uc_fw->type == XE_UC_FW_TYPE_GUC);
>   
> -	/* We don't support GuC releases older than 70.29.2 */
> -	if (MAKE_GUC_VER_STRUCT(*release) < MAKE_GUC_VER(70, 29, 2)) {
> -		xe_gt_err(gt, "Unsupported GuC v%u.%u.%u! v70.29.2 or newer is required\n",
> +	/* We don't support GuC releases older than 70.36.0 */
> +	if (MAKE_GUC_VER_STRUCT(*release) < MAKE_GUC_VER(70, 36, 0)) {
> +		xe_gt_err(gt, "Unsupported GuC v%u.%u.%u! v70.36.0 or newer is required\n",
This is definitely not allowed.

Once a GuC has been released for a given platform, it must be supported 
forever on that platform. Which means that LNL and BMG must forever be 
able to run on 70.29.2.

If we really need to, we can add a per platform variant of this check 
for new platforms. E.g. PTL must be at least 70.39.42 or whatever. But 
we can't ever change the Xe global base line version. And there isn't 
much point in adding a new platform baseline because we just don't push 
the firmware upstream for new platforms until we are ready to do an 
official release. So there simply aren't any other versions available to 
warrant a baseline version check.

Rather than bumping the baseline here, individual features must check 
for a suitable GuC version. Which is what you have in patch #3 - the 
check for GUC_VER(1.14.1). That ensures that the new feature will not 
try to run if a new enough GuC is not available on the user's system.

John.

>   			  release->major, release->minor, release->patch);
>   		return -EINVAL;
>   	}


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2367DC02188
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jan 2025 13:27:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C793310EAF1;
	Fri, 17 Jan 2025 13:27:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n5C3QEiZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37D0C10EAF1
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Jan 2025 13:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737120427; x=1768656427;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0NRBDY4niiHhqg3pI6MXltqnCxWjx91YfeEGLbeFJFM=;
 b=n5C3QEiZWVuTmgIKKvzYo6vVBH1BfYV9UExGm12gGd9ebFbuuLYNup7F
 lkk8Mkwi6FNZWsTpfJtRm2tsSRI7mWWize6SNydy/dgBLhyvu4syeRNy6
 b61fFX4uPvl3yyu6o5/aBrmhTuYPnxL1zU2tvv4UIRA86doGTHCyH3dv5
 LfdkNM4s9675SHAOXe0yEKep17DvN8ZAl571lqRvgxTfc9JGUrIlFtAEi
 hmImTbq1PuVOf27Gx3JdeJE/8UwK3A05IgooapOVjK62L9acd1QJJ/bBt
 P8QcUyApQx89BxSGY9pkuswXhiAj8BnNJF6DEHPyyuvYUBO6jjwZFFyNb Q==;
X-CSE-ConnectionGUID: 5DcGsKv8RHCFthTWUPTEvw==
X-CSE-MsgGUID: TxIVOFSLS/q9AI9sf4vI2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="40361459"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; d="scan'208";a="40361459"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2025 05:27:06 -0800
X-CSE-ConnectionGUID: KIxHSXDsRAiMQtzn7hAmLw==
X-CSE-MsgGUID: 28+ZRyJjSkuVo9V7+vgllw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="143086951"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jan 2025 05:27:06 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 17 Jan 2025 05:27:05 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 17 Jan 2025 05:27:05 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 17 Jan 2025 05:27:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uSfb3opuFskakRaR8JsO76BxrQCHhMMjvDVivsIdVG1993kNeTPuDYnzuDb6fZdxLxc8Dr+GYSRffowZOM+JjNg2ehsBZ5BTCHtIn3rZDbv3nWNuY5wEFGjdBw+AR6WH9SvabbPv8sBuA8WfdXEg5lm6COvYY98aiOFhZOMEyTudjwMXPXhqRDHZTbiUbJ0bWhW9Xvdc2aTiYJZLUK0kTJrv8Aoea28ewjEOvcdCqpB8A5d7JbBkSZHRw2fj9DAZPhd2HNMdY51gW4FU+bJ3AJ2zWFelriRUINt0tlHXma5TmXiOnmBKO9phBpzNF31yDF9yMltvAASgZpDUirhhZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mlb/91u7NzgwXOtYnGdi7YpiTHEJcMNVeQSY/DjlLj0=;
 b=ucf7RkIRILt8n4IInTckmhsDno5WlO8t6jKBN23dCzt3e2+qpVJKCSiXhPH9FsfOWvbwYzepwE8dP+2jU8IYZi9GjRg1Rz3xEDR2EInspvcNuuIIHBV3uSvtdn66emiIiBc274tyZA52UlwbAHahLdkGAvB6fR2pZYnrYr/WX9mGrLXd7cc7ZWcxpsTdGf/4+KxUHPNvDUBI3UAeAwvQNoD7MftW6QDRkaYiP3TLYEkH0Sxi+izo/M7pREpTkdbrn5IG25ZO36rIF4ApdS/fVxiKiPYy91B4RPoLxWH3t4wieUga29fMYYyrmAOBMcu1gt7PxAFMJ6cc616U8Qtb+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SJ2PR11MB8298.namprd11.prod.outlook.com (2603:10b6:a03:545::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.16; Fri, 17 Jan
 2025 13:26:58 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%3]) with mapi id 15.20.8356.014; Fri, 17 Jan 2025
 13:26:57 +0000
Message-ID: <704cb2ca-385b-4d99-b232-8cbb47437f27@intel.com>
Date: Fri, 17 Jan 2025 18:56:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/10] drm/xe/pmu: Add PMU support for per-engine-class
 activity
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <vinay.belgaumkar@intel.com>,
 <ashutosh.dixit@intel.com>, <john.c.harrison@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <soham.purkait@intel.com>
References: <20250106075600.852080-1-riana.tauro@intel.com>
 <20250106075600.852080-10-riana.tauro@intel.com>
 <Z4mv7kYyeZPHozf9@orsosgc001>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <Z4mv7kYyeZPHozf9@orsosgc001>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0088.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::23) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SJ2PR11MB8298:EE_
X-MS-Office365-Filtering-Correlation-Id: 94dffe25-ba15-409c-6b24-08dd36fa9dd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cWRCelo0N0ZzTzRPSGVMWW9nN3NkY3pCQ0JnODdWaEtVeGJUYU5MaVZaVzJN?=
 =?utf-8?B?bXZLK09UNkJ6NjhNTVU1cTdZMjZKR2s1U1FPdFh5eUMydFZ0aUk2cFZuSEJI?=
 =?utf-8?B?MHd6ckhwRUZsdnR0UGQvVHFxT0c4WTVSK0RzYTU2VWFhbVVVc0xTUTdsbzdW?=
 =?utf-8?B?bkx0UDF2ZWZER3RnZVZyakxidmtUTk9RT0pRNFhMbkFkSmNzNmdhcEM1dUhx?=
 =?utf-8?B?V203M2hGK3ltOG9sdGVkR3hwb2VFbkNYUUZ2RlN4c3B5c2p0bXJGK3NHM202?=
 =?utf-8?B?S2Nmd1h1RVNlYU9hSnExWGloTzF6Mk9SSFVqSTRPQWFxOUxpaTJiVGFHQWFv?=
 =?utf-8?B?QnZ3bE1vZ1NIanJFSHJFZWdvMTQ5cmJlOFc2bXhSWW15R1k0YVU4V2FDT2lI?=
 =?utf-8?B?T01nS0d0L0J0Z0xxdkVlTDNSbS96bEw2UEY4ZkNHZzB4WkJ6alJPc0VUeVU0?=
 =?utf-8?B?WVIxcVQyUmZSRXhtclFUbnJlR3RFVlU3MjRVS1pFQVdOZmVrL21aTEx1cExL?=
 =?utf-8?B?UXpzRWZueVNXSWpBcVJOZ2owLzFCUFo0UHBMa1pKMjBmeWMrNlptcUwvQlM4?=
 =?utf-8?B?ZWt6NkFvMTlGYjFVeW1iWm5lQ1hsZkJrOVloSnE5M1o1WjlTR2VHZkNUTERi?=
 =?utf-8?B?Tys3Z1UzZUFXM2l6OU04OGc5NzZIb2EwTTlsZnJ3aFBIc0dLS3pLTU5mSzFQ?=
 =?utf-8?B?VGptZnFjbHA2SFUwQ2sxNllDRWlVYlJhVHlZOTgrRHdZMmZnM1pXdlJVMFYv?=
 =?utf-8?B?c3VWdnVqcTZqU3ZXYWRMZkJ2Rm5IN2NUVkhZNno3WStaczRVSVZZTnRVcHc5?=
 =?utf-8?B?YkpoVUVubkZ6RlBOdkZ6NWl5NldYSXFLMWgwV05QM0JtdDJhQnRzR0FQQXZy?=
 =?utf-8?B?T0VTdmxYZXpIdVVBUkhhTERYL3lxL2xlMUFVWFRnV2MzQTVOVUpibkRwU29h?=
 =?utf-8?B?N0ZKbGlDTWhrWU4rQVk0K3llSThRR3RWSlhQZmN4ZnF1V1ROMDhsSk9nK0xM?=
 =?utf-8?B?QWVNNHJlQ0ZONFdabHdpOXhyRVZiOGFhOG1BazJvT2tGR2EwRGQ4WmxVNWhX?=
 =?utf-8?B?d2hDek1nQnY3L09LM05aOW5XYW9hRXA0TUR4MnNFTmJiZUgxN09Qa0EwOVFO?=
 =?utf-8?B?NllmUkZ0YVM1VFAvbXVwR0NKSEUxaDhWQzJWVUUvcERDT1U5Z0NNc1d3ek5T?=
 =?utf-8?B?WldZcXFxckxUVXZMQklyUHZ6WUZiL29aeWJCSCthWWtxTU1PNkkrMjQzK0hq?=
 =?utf-8?B?SlFybk9uMGJmQ2tYOFhGSHUySGtMd2VJcDFuZ3JuQ0h3ejY5elRYU3doakE0?=
 =?utf-8?B?M1hyb29TRzNzTFk3Tnlya1YzWFVNNzkwY1E2bGRBSGxmQjRrUzZvU0U5eUxV?=
 =?utf-8?B?b3Y1SzNHejA3N1l2V1B2Rm1HT1NVN2VSQlV5Yi9MRjliRmlBUXNiUHhTSTZJ?=
 =?utf-8?B?WVFwUWIwbHBhenBXS2ZNNE9NU1ZjQ1A0eEdkMEp2VWhXbWtqZ1lLaCs0NHZq?=
 =?utf-8?B?T2VkaTZHVGptU1h2NWM5RzFLZ1BGa1JKS1M0NENJb0RwUGxlSWtUdERtbWps?=
 =?utf-8?B?eHpyTzd0NFhlTXpON2FQeTVUZFVUZFd0bEhMSzZwc24vL2ZMb0oycWgyZkNZ?=
 =?utf-8?B?bGdwa0xTcWxMUXlqa1FmWDlnUGlaSVB1REFyMDhmcklQbDFYMkFpam1tc0xt?=
 =?utf-8?B?UzZPSGdENXJDTkxCYzVnVENCSW9JRzVYSFNQRzM4OXpJY25LYWxMclJkbTEz?=
 =?utf-8?B?dk1XcEdHdkZRUnJuWkNnc1pPRHNqay9VT3FHelh5eEtLK2s5OWNZeUtpWlY4?=
 =?utf-8?B?VmJVN3lPOE5sYTFzUDEydz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGNVM3VGY01Fb0I1VDl0b3NCK2lFZGphVTE2Z3NWNUNyVkhlSi9RZTJTd3RN?=
 =?utf-8?B?dHJyVktNaGRoeUhnZmFuMSt3S2g5c0pyZUJMVnEwWXk0MnJTSkoyT2FOeXJ0?=
 =?utf-8?B?dVFCa2t6M0U5L1kwMlZWbzY0cGE3QzNIbkJkZEtLVm5CckdOSklnTDZxMjhE?=
 =?utf-8?B?eFhjSWVwQVp2ei91TFZZVHlCMkExdU1takdUbWk1ZTlIK0pqTUxtcmx3TVNm?=
 =?utf-8?B?eTFkMG5sc0xtS2J6WTN0TThoV1NZVGF6Tk5nZEZBck5mR2hidGlaeklKTERF?=
 =?utf-8?B?bnp1Y1NkK05oQ1NTTUFUL0NXK2FHTCtQYjhuejN5M0QwOUZMd0NaeWUvaEFm?=
 =?utf-8?B?MzhkRS9RY21ZMUJHSWFtdDVHZEJMcmVFNGFseFdjNDAyczR4T0k1Ny9hRjRY?=
 =?utf-8?B?Yitwc1puZ3ljTVpwcG9mSHI1SVRWUGV1T2RJZ0xsblU1V3Arbko5alJKTHpT?=
 =?utf-8?B?YWVTdnYxbERweTFkK2pnVnRYSm8xMERlTm80VzdaUHY2VmVUdlFwNmJFSHJw?=
 =?utf-8?B?K3JaNGFXZ1ZneDZleWlodHFHS1d2ajdCTmJ2cy95QU53ZGdGZk9DaHJONVU0?=
 =?utf-8?B?dUUzbnliVVcyYXNTTHZUcU1xYmZRbXRZekNiSUxjR2h1eFloY1BKcktOcTRj?=
 =?utf-8?B?YmJNQ2tBeXdDeWlxMk15Qko4ci9zNStoNTVXWDlCQXRxSnZoRnQyOEZBTWhq?=
 =?utf-8?B?VWZTRFpLaVZ4bHRzYk1YbDNoMjhRak1QUlB4SDdXNGFDZ2J5L1lTbDNDSGE5?=
 =?utf-8?B?UTRvVDhQYVBPb1MwTE95aW9HMGZmd0x1aUVRcENKZk5zUjMxRFc4bWN0RHEw?=
 =?utf-8?B?NmVwTGFGQ3B3RHdBa3U0VC94SExWTjAzWXdMQVpza01HUVJ1RXExNUpudFVD?=
 =?utf-8?B?dythVVFwb0RWblIreDVPV20wdmQ2VWV2K000OXRVOG1qSU9GcVhQYi81K0xN?=
 =?utf-8?B?TXNkTlpvRXJ2SG5mYUsveVYvUmZVUmZoWUg3ZnRoanBEWXVaTEdHTDhzbmRx?=
 =?utf-8?B?WExaTk00MzZBVmZiOWRvM0VnUUZKaFFXMzZuczZ5aVQxdU9Xb1p6Q1Roei8w?=
 =?utf-8?B?cG53Mm10UkRxV1VaVTd2YVlVNmVtdzhkcWYvU2RTSFBuVkQ4VElEVDAvT1Ja?=
 =?utf-8?B?ajByMmZQQk1BT3lUdmpINEd0dlA1T0E3RlBkUHFBaFgwRGJBOVlrMHdmWVM1?=
 =?utf-8?B?R3IweStRcjBIU1pDaXJ1aVZ0bDFnTCs2RHdxQXluSkRMOXJjeEhnd0IxbUM3?=
 =?utf-8?B?dytXbm51d1dKZHVkR3hVT2cwQmM3ZU5EVlYrVFVUUkVKYlBVang5czRZLzRq?=
 =?utf-8?B?bmlYVUZBT3lpOFJQd2s2QmR5b3lIdkwzL3B6ZzlEY2IreS9XRmhNQTFCTUFF?=
 =?utf-8?B?OVR0M1U0NDNNNVB3MHlha3U3M2tMbmd4ZFZrZEMvTWNzaVUrdUxPSG85Tm1z?=
 =?utf-8?B?ZldWVFNSUFBpRUp3K2ErdFpTWW1GYXE1bldhUGhPQkVxT3VySHRhaEVjS3px?=
 =?utf-8?B?N1V4dnE0U3FRbFU4endFUXlyY1FIeGJrVysyKzJxdlkyUGFORGtyQnozUURS?=
 =?utf-8?B?aDB3M2U5cWFtb0NxTlFuZk5panZYNmFZTEJmelQ1ZExJclNSVng0bUg1VDVl?=
 =?utf-8?B?Q1FKTFRqdVhjM1I3MTNZWkNzTU05KzQrQ0YwQ2Rhc0ZvL1Y2SUwxUzUydUFL?=
 =?utf-8?B?QjM3cno3Q3E2N05BS0NNa0w5cWp5aDF5VGVxZEx6dWhML2ZFR2pMNTR5YUo2?=
 =?utf-8?B?cGRMeFFXMlhOR0ltc0xEckhiSExTRkJYaWtySUQ0S0xqeVhvVW42ZmtCKzRO?=
 =?utf-8?B?U005U0lpQkFIQ1BSS3AxZnhoVTVrNXdGUUVxWUZVRzd6eTRsQlQzaklyNDZJ?=
 =?utf-8?B?dzhPMmdwWnJmSFRzeUhWcTRvN3BYWm9QUUN0bXpxc0ltY2FLdGFveEI4Vmht?=
 =?utf-8?B?SmtnSUdVa3FobWpjZXc4QWo0Q2R1RTlKZERvMXJQSnhwVm00bnc4ak0wRTRQ?=
 =?utf-8?B?M0ZZOGRYdGdlNWJDcmFRb09LekQxRE02NUZFaHlUY1Q2b2ZJWWRnQzEraXAy?=
 =?utf-8?B?WmpseFY4bVovemR3cEJYclh1bFVmR2p5endvZit3NjlrK3JnRGNGbi9ybUlw?=
 =?utf-8?Q?7KVBBDgg7hdXAimyiyJHhgiQh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 94dffe25-ba15-409c-6b24-08dd36fa9dd2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 13:26:57.7719 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jnoqYiB32uahQuIJ29T8CkcusnaWNKK1/+FrFD/Z0SfuHmT3FrciIn32A6F7eNOil5siiGk9wke8c8BZOqGYdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8298
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

Hi Umesh

On 1/17/2025 6:48 AM, Umesh Nerlige Ramappa wrote:
> Hi Riana,
> 
> This is part 2 of the review:
Thank you for the review comments
> 
> On Mon, Jan 06, 2025 at 01:25:58PM +0530, Riana Tauro wrote:
>> PMU provides two counters (engine-active-ticks, total-ticks)
>> to calculate engine acitivity. When querying engine busyness,
>> user must group these 2 counters using the perf_event
>> group mechanism to ensure both counters are sampled together.
>>
>> To list the events
>>
>>     ./perf list
>>       xe_0000_03_00.0/engine-active-ticks/        [Kernel PMU event]
>>       xe_0000_03_00.0/total-ticks/            [Kernel PMU event]
> 
> total ticks is also engine specific, so maybe we can use engine-total- 
> ticks as the name.
Sure will use engine-total-ticks
> 
>>
>> The formats to be used with the above are
>>
>>     engine_class    - config:12-19
>>     engine_instance    - config:20-27
>>     gt_id        - config:60-63
>>
>> The events can then be read using perf tool
>>
>> ./perf stat -e xe_0000_03_00.0/engine-active-ticks,gt_id=0,
>>                    engine_class=0,engine_instance=0/,
>>            xe_0000_03_00.0/total-ticks,gt_id=0,
>>                    engine_class=0,engine_instance=0/ -I 1000
>>
> 
> I am also wondering how a user knows what format bits are/are-not 
> applicable to each events.
As of now, its mentioned in the documentation. But that is the reason i
was thinking adding the engine class in the name would be better

  For example, if I pass engine class and
> instance to a frequency event, it shows unsupported. How does the 
> implementation check for valid config?

The current approach first checks if it is engine event by checking
if the event type is active ticks or total-ticks

return ((sample == XE_PMU_ENGINE_ACTIVITY_TICKS) || (sample == 
XE_PMU_TOTAL_TICKS));

else it enters the config_status. config_status then checks all bits 
apart from gt_id to check the sample. So it returns
unsupported

But that seems to have changed in the latest patches sent by Lucas
https://patchwork.freedesktop.org/patch/632764/?series=139121&rev=13
Approach might have to be tweaked

> 
>> Engine activity can then be calculated as below
>> engine activity % = (engine active ticks/total ticks) * 100
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_guc.c       |   5 ++
>> drivers/gpu/drm/xe/xe_pmu.c       | 139 +++++++++++++++++++++++++-----
>> drivers/gpu/drm/xe/xe_pmu_types.h |   7 ++
>> drivers/gpu/drm/xe/xe_uc.c        |   3 +
>> 4 files changed, 131 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index 408365dfe4ee..f229745b78b9 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -26,6 +26,7 @@
>> #include "xe_guc_capture.h"
>> #include "xe_guc_ct.h"
>> #include "xe_guc_db_mgr.h"
>> +#include "xe_guc_engine_activity.h"
>> #include "xe_guc_hwconfig.h"
>> #include "xe_guc_log.h"
>> #include "xe_guc_pc.h"
>> @@ -743,6 +744,10 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>>     if (ret)
>>         return ret;
>>
>> +    ret = xe_guc_engine_activity_init(guc);
>> +    if (ret)
>> +        return ret;
>> +
>>     return xe_guc_ads_init_post_hwconfig(&guc->ads);
>> }
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>> index bae8eb38fddd..5bd312b6b8f6 100644
>> --- a/drivers/gpu/drm/xe/xe_pmu.c
>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>> @@ -12,7 +12,9 @@
>> #include "xe_force_wake.h"
>> #include "xe_gt_clock.h"
>> #include "xe_gt_idle.h"
>> +#include "xe_guc_engine_activity.h"
>> #include "xe_guc_pc.h"
>> +#include "xe_hw_engine.h"
>> #include "xe_mmio.h"
>> #include "xe_macros.h"
>> #include "xe_module.h"
>> @@ -90,6 +92,17 @@ static unsigned int xe_pmu_target_cpu = -1;
>>  *    1950
>>  *    1950
>>  *    1950
>> + *
>> + * Engine Activity: PMU provides two counters (engine-active-ticks, 
>> total-ticks) to calculate
>> + * engine activity. While querying the engine activity the user 
>> should group these two counters
>> + * using the perf_event group mechanism to ensure both counters are 
>> sampled together.
>> + *
>> + * To read a engine specific event for a GT of class 1 and instance 0
>> + *
>> + * perf stat -e xe_0000_03_00.0/engine-active- 
>> ticks,gt_id=0,engine_class=1,engine_instance=0/,
>> + *        xe_0000_03_00.0/total- 
>> ticks,gt_id=0,engine_class=1,engine_instance=0/ -I 1000
>> + *
>> + * engine active % = (engine active ticks/total ticks) * 100
>>  */
>>
>> static struct xe_pmu *event_to_pmu(struct perf_event *event)
>> @@ -107,6 +120,33 @@ static u64 config_counter(const u64 config)
>>     return config & ~(~0ULL << __XE_PMU_GT_SHIFT);
>> }
>>
>> +static u64 engine_event_sample(const u64 config)
>> +{
>> +    return config_counter(config) & 0xfff;
>> +}
>> +
>> +static u8 engine_event_class(const u64 config)
>> +{
>> +    return (config_counter(config) >> XE_PMU_CLASS_SHIFT) & 0xff;
>> +}
>> +
>> +static u8 engine_event_instance(const u64 config)
>> +{
>> +    return (config_counter(config) >> XE_PMU_INSTANCE_SHIFT) & 0xff;
>> +}
>> +
>> +static bool is_engine_event(struct xe_device *xe, const u64 config)
>> +{
>> +    const u64 gt_id = config >> __XE_PMU_GT_SHIFT;
>> +    struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
>> +    u64 sample = engine_event_sample(config);
>> +
>> +    if (!xe_guc_engine_activity_supported(&gt->uc.guc))
>> +        return false;
>> +
>> +    return ((sample == XE_PMU_ENGINE_ACTIVITY_TICKS) || (sample == 
>> XE_PMU_TOTAL_TICKS));
>> +}
>> +
>> static unsigned int pm_bit(const u64 config)
>> {
>>     unsigned int val;
>> @@ -192,6 +232,23 @@ config_status(struct xe_device *xe, u64 config)
>>     return 0;
>> }
>>
>> +static int engine_event_init(struct xe_device *xe, u64 config)
>> +{
>> +    const unsigned int gt_id = config_gt_id(config);
>> +    struct drm_xe_engine_class_instance eci;
>> +    struct xe_hw_engine *hwe;
>> +
>> +    eci.engine_class = engine_event_class(config);
>> +    eci.engine_instance = engine_event_instance(config);
>> +    eci.gt_id = gt_id;
>> +
>> +    hwe = xe_hw_engine_lookup(xe, eci);
> 
> Getting hwe from the config could be a helper since you have similar 
> logic in __xe_pmu_event_read()
Will add an helper
> 
>> +    if (!hwe || xe_hw_engine_is_reserved(hwe))
>> +        return -ENOENT;
>> +
>> +    return 0;
>> +}
>> +
>> static int xe_pmu_event_init(struct perf_event *event)
>> {
>>     struct xe_device *xe =
>> @@ -221,7 +278,12 @@ static int xe_pmu_event_init(struct perf_event 
>> *event)
>>         return -EINVAL;
>>
>>     event_config = event->attr.config;
>> -    ret = config_status(xe, event_config);
>> +
>> +    if (is_engine_event(xe, event_config))
>> +        ret = engine_event_init(xe, event_config);
>> +    else
>> +        ret = config_status(xe, event_config);
>> +
>>     if (ret)
>>         return ret;
>>
>> @@ -300,24 +362,49 @@ static u64 __xe_pmu_event_read(struct perf_event 
>> *event)
>>     struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
>>     u64 val = 0;
>>
>> -    switch (config_counter(config)) {
>> -    case XE_PMU_C6_RESIDENCY:
>> -        val = get_c6(gt);
>> -        break;
>> -    case XE_PMU_ACTUAL_FREQUENCY:
>> -        val =
>> -           div_u64(read_sample(pmu, gt_id,
>> -                       __XE_SAMPLE_FREQ_ACT),
>> -               USEC_PER_SEC /* to MHz */);
>> -        break;
>> -    case XE_PMU_REQUESTED_FREQUENCY:
>> -        val =
>> -           div_u64(read_sample(pmu, gt_id,
>> -                       __XE_SAMPLE_FREQ_REQ),
>> -               USEC_PER_SEC /* to MHz */);
>> -        break;
>> -    default:
>> -        drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
>> +    if (is_engine_event(xe, config)) {
>> +        struct drm_xe_engine_class_instance eci;
>> +        struct xe_hw_engine *hwe;
>> +        u64 sample = engine_event_sample(config);
>> +
>> +        eci.engine_class = engine_event_class(config);
>> +        eci.engine_instance = engine_event_instance(config);
>> +        eci.gt_id = gt_id;
>> +
>> +        hwe = xe_hw_engine_lookup(xe, eci);
>> +        if (!hwe)
>> +            drm_WARN_ON_ONCE(&xe->drm, "unknown engine\n");
>> +
>> +        if (xe_pm_runtime_suspended(xe))
>> +            return 0;
>> +
>> +        if (sample == XE_PMU_ENGINE_ACTIVITY_TICKS)
>> +            val = xe_guc_engine_activity_active_ticks(hwe);
>> +        else if (sample == XE_PMU_TOTAL_TICKS)
>> +            val = xe_guc_engine_activity_total_ticks(hwe);
>> +        else
>> +            drm_warn(&xe->drm, "unknown pmu engine event\n");
> 
> Maybe also print the unknown sample/value for debug. Same for the else 
> section below.
Sure will add it.

Thanks
Riana
> 
> Rest looks good.
> 
> Thanks,
> Umesh
> 


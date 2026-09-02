Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF87C624D4
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 22:35:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1126710E083;
	Wed,  2 Sep 2026 22:35:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aqMZXpus";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CAA210E083
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 22:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788388547; x=1819924547;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EeKDiExT03Q2Ycx4IrEO9aOSI+Q3hGUhiKzy+fqLnM8=;
 b=aqMZXpus8jumsAwFDQjTML3neR4TJp7yfbTXbwOybtX1SV+gzTAx8arG
 TlzA4kumSRU9RFguLqlmNdQY4U6UQEi6MNXIYiIb8D2B7YSWL00qqOXF0
 Dg3wLbzKoF0lYHi/clWD9+XHD/lx2QPgmXpnQ8rgSUelsQ8awm2ImJ3tG
 EuZ+k57m7SdtH5Nfa3ptSJl7yzRZ4IPrrSjRw3QwiUe5BYUIWHZ+4ufIR
 Lec02HrbX0kNHEL5wxrj0X6CO5teiKxJwWrPrJXqVd8PqV8RBZLgq70jQ
 Ms6OqCcKL1/CexA/m2GFcgtgoyMFrTBfY8JJKTdTLiXbQP0Je8ueLtdSy w==;
X-CSE-ConnectionGUID: hZi7y5LnTkC3ygS+Mw4zZQ==
X-CSE-MsgGUID: ctl5Wp+CR2WBYpGHCw7E4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88624382"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="88624382"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 15:35:47 -0700
X-CSE-ConnectionGUID: pwkVvICFQqeCZIjmSKQk3w==
X-CSE-MsgGUID: 69gD/2SwRAmVdunj2JizJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="273692535"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 15:35:47 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 15:35:46 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 15:35:46 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.14)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 15:35:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L7rGnqYgst8NpiSPPCq2m8/iD2i1jHEj0Fo+1qJ+nVDJMVzV/rlbaatB/N+2W8oA7Y5q+1/AL0IT2JNXjGhBChjcUKhR/dHKujYjUyy70b93jFAc0hgqOx+Jb0LhT29ITIWwUvzfC/vojSAv6cu3FTOi/5fwo35aZ2EZOm1LaXI7+4cnOA3bpxirHCoT7eNbZaECafaBMeKnmTBPUlypgAUVsU/7/IiDUOVFH45SZM/wcSE4wPmz1tMz8wdKJW3OsVR6igwQiS2+p2fYBmp9DRKUlsJ6FaA70T0h37OL/+f7272IX2tsU0zXVlJDKHUxbeoeZ0l7Z27pLIJy8yrFCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0AT0hUPfsS/ctD8OMH2HH32oQjn9xKSXXy23nBTRACQ=;
 b=OVRn28P8RVZ/kRg3MF+ucMi0cq33YZXR8iEzZAggDBRA9GybtQ16hbeqTFgLOcH4zkUqsbDiN5XSH55SO7qJKn078gZUy5LcMFqrxAZoVKORaz5WfrkKia5fPWtdZVUUas4LVC5/fWhv72IJ77dW19PocHODxiMMfNxnhJis6fvqTCkvrIRGzOzv7hVaQiqE9WOGXFYcxOUm0FxccJ099buyJ7IyvfyzBxkDfkkyXGbrTTCQFidDPufv5EVcEU5uiQM6GEahwSWvhfFuoN/Wg9hvqgF3zbcw1ydp4cGHhUk6bLMOKxLw2diUOB4S7t5wfbGEXuEQwGs4rd7z8GoU+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DS6PR11MB005518.namprd11.prod.outlook.com (2603:10b6:8:52c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 22:35:38 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0382.007; Wed, 2 Sep 2026
 22:35:38 +0000
Date: Wed, 2 Sep 2026 15:35:32 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 <daniele.ceraolospurio@intel.com>, <aravind.iddamsetty@intel.com>,
 <mallesh.koujalagi@intel.com>, <alan.previn.teres.alexis@intel.com>,
 <julia.filipchuk@intel.com>
Subject: Re: [PATCH v2 2/5] drm/xe/guc: Use different error codes for CT errors
Message-ID: <apiktJK2em/UqnYg@soc-5CG1426VCC.clients.intel.com>
References: <20260901211204.131972-7-umesh.nerlige.ramappa@intel.com>
 <20260901211204.131972-9-umesh.nerlige.ramappa@intel.com>
 <bf230932-338a-4d83-9606-f4250d06c2a4@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <bf230932-338a-4d83-9606-f4250d06c2a4@intel.com>
X-ClientProxiedBy: MW4PR04CA0159.namprd04.prod.outlook.com
 (2603:10b6:303:85::14) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DS6PR11MB005518:EE_
X-MS-Office365-Filtering-Correlation-Id: 90d20991-7ac7-42d1-d810-08df094282e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|3023799007|10067099003|56012099006|4143699003|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Oh66hf+yl40rZHyL3jVfEQhd67mrgCu/CqexvmSYM9klC3uPg9DdwO0wubnZTGfsCbt4mGaZ547+xHonib2sBerpWL6oF5jD71PEZfKGcQbxUhtzFhvCXXsDp3LyCMMHVrRbCGyiCqUOKO5gicCthjsGoS0sYHGtjaoyE8IK+qbekgLMT3AKjgGsZRJjfCEMo+YnJjxwTQTXqCMNSZBGiFlsSVELxU/FPWB3osLWlEHyXV13k9jeSicVe5LLAySkcG8H5/MPLWZ6zrA45Ff1uKpe50ZE8E+3HnF8diCNexhzzHYrQLYqlL7yb0FR0yrByHXIw4a0AlKCCThyYLtS8rA3djYDlA0elCm/6U5g0OqeqSJOTvCPW+w09hWF/6qnrtmMvbTyx6PHLwLOXUUPVE3oobWVpYdHf/46z6VbXQ400tpJPsD/DxxKEoSmzexyRGsmGY30k7ovJw9uPcOHUJ9xRkdEMqHOp+Zk6PdOSygt/P82lV3WSwubw6PIvzYYxuzw3MB3PKNpaigpqwaA9I3gf9fk02Irw9XLLznQ8FNtUUOIQBY6e2PUX9B7D+jlcn/U2Q7IgzNUSztH1GWRY7FMnICOfQfdOI9UEgWMT8RAatqy5sBBkrlWSjoq5uR5UnoM89MZ1oNh0L2PFyoaGzss5zzdVVK6a0ZgiIZdwbY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(3023799007)(10067099003)(56012099006)(4143699003)(11063799006)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mk9vZG9xdUsyWmFxUmtQLzkwL2M1VXRuU29tR0VHUDhMQ2NHZzZMb3ZiTzlN?=
 =?utf-8?B?Rmp2a2JraVU1bVZIY3UraHpuYXFpU3l6R1ZlK1hmUWRWOEt1OHdIVXlHNER2?=
 =?utf-8?B?cUZkRzFnckduSVRoTDFDWk8xT2wwc2pwY2VLZE0yTHZNR01sZUdnTlpJbkJq?=
 =?utf-8?B?UnZ2VlNqczhSSzFuT3hjMnhidXJOUDdVanpmd3NCY3ZjMmxGV0d6bnZrSG9Z?=
 =?utf-8?B?ZXRVUTEzenJHMW1rNUZFcTlVQ3JhNm1WaFNJS1JETmUvRVVuWU5yZnRkL1Bq?=
 =?utf-8?B?OWtKRlZHZFJKYjhZRUc4ejJXb3dON0JqbUxON3RiRHNoOVkzUkZDUThVOWlw?=
 =?utf-8?B?dVpWb1V1KzY4TXMxM0RkREZOSTJGcDlaeUVscmVqTjZCeU1rU05VRlJpdlhj?=
 =?utf-8?B?azFIcTlVR0VZVS82b1RBL3RaKzdOdU5RdVppdVJpREYvOWhtN1I4NGhmeHRL?=
 =?utf-8?B?a25TbDVIOEtSeUhlVXJxTXhDTWZoZFpmbncvTDdkR040dWZTOEo1ektDcWFP?=
 =?utf-8?B?SW1RaTlkZVBiMi9PbldJU1MxYWpGU3ZsRURCOTFUcFpwTnlpVHFzelc0VEUy?=
 =?utf-8?B?RjRFcWxDZ0g3SEs1UUw0MEJ2dVMxOEl5aHJnRzVKZVlLNmZLcFZFUlJNQWZR?=
 =?utf-8?B?MkgrWWpKeHNWTExRaDl5SDFRWGtFYml1bUdkMmN6U0lacTF6Z3BQcUhLWWlB?=
 =?utf-8?B?WkQxajZCT1EweVNSOXpMUTRUcTZsMTdaMnhCWjdmbVRpVUJ6bkl4RkJ6TVVP?=
 =?utf-8?B?NWFHakVhTytmVWRzbEU4ZEQ0WEcvbjAvWjZKd1dlNGRBMGxSTkFlQmgrOHA4?=
 =?utf-8?B?aXYzWVFoelp0YjhzZzkvb25PZXFuRDJlME12VXpHMDVvQjRxY1V0NWdFTFl5?=
 =?utf-8?B?ZjEzbXhQMXNwVExObkV0RWZidW1iUklpdDJZaUlaRmZoOWdiR0VHVHh5Q0xU?=
 =?utf-8?B?cmMwQk40MjhKU1RvUFhuT0N2Q0Z6NEYrc1ZRdnZEd0RGNFBEeVpEOCtUYzIr?=
 =?utf-8?B?ZFUza2xFYSt1SE5tTDR2SmRSeEZJejZBTG5SL2Zhc1gyT2pFL0lmRmN3YXE5?=
 =?utf-8?B?OEhBMVZRcnY5L2pwQkRaaFo0cmd5aXFaTkM0eGlNYkZjTFVNV0JONDdiWERK?=
 =?utf-8?B?anhhWThjaFVpbTRPQlQ4VzBDK0NpalE2RzM0UEJSSVpUbG9OOHp3Q3A3TjhB?=
 =?utf-8?B?b0Nhd1JvNjR5OWRPZDhrYWVISytuZEtPRVdxanVSWEp3Q0ZvMFBQUm1nZXhO?=
 =?utf-8?B?UXdVcElGWXZvU285V0xsTzhqZWtHV0NaYkNPc2tPcTlGaktTazlsVUNTd0J1?=
 =?utf-8?B?OEZmaDlkYzJ4VVh6b2Uwak8vTU50OHFXK215OFlwRUVDT3c5MHE5R2xpditl?=
 =?utf-8?B?eENpNFpQWEJXWllkbzNLaEZST3EyYUFTaDdxclRhSUxGQzR5UUwxVHhONEl5?=
 =?utf-8?B?RnZHNjJoRlFIY28vejd3WnBZNjVqSmxwTnhvUUxWUHBOYVRBVUVVRThzUWxZ?=
 =?utf-8?B?NzJwbXJidjRvdGFjcFByNzJOUHUwWS91UEJ3Zy9DMmpITnh4cDNId3dZQ0tO?=
 =?utf-8?B?ZGhsVHNnTWN2U3FvblVUTGFlKzc4YXg2N1p1Q244eWJOSk96L0FlR3BBbE5H?=
 =?utf-8?B?WVNGTTF6ZUVsK3hXWmdyaVNoSmNyL3FKdjEzTGY2Nm9UNEJTMzdocHUwck5T?=
 =?utf-8?B?MWZKRG5DRlhVUE9KVDZEbnpTWFQvWGRCVDRDejJUZHVKcWVyN2RzTVJPRXhv?=
 =?utf-8?B?Q09leUFwaTRVWUM1eVpVc1cwNHVmNzBKaVZBdFI4WHhYeTJ1TUhWaU8xZENh?=
 =?utf-8?B?WGhQZWRSRXpKTkhBWXVMMmZtV2cwdW9nekxqbkFUYmhqd0FzTGpHMFRycGcw?=
 =?utf-8?B?Y0lwcjdEOGtwRm9qTUxxb0NXc0kyMjVpTTMyWE0zVXBWeUFydGdDck9vVDc0?=
 =?utf-8?B?MzUrSGszK3JNT3lWb0FZNCtzcVdiV0JyRDFxOU9hcVhhd0U0MWsyNGhyQWlE?=
 =?utf-8?B?MmdLQ1UzVXJaZlhWS1ZlMjJVT3E4c1lPSyt2bkZoVE5HMXdrTnFNR0pzWTBu?=
 =?utf-8?B?YW9uS0E1Q0htZ3JVZTBhRWQ2aGFqTVlrMzNyRUhMeHhGRlZRV2dTb3Y0RnNB?=
 =?utf-8?B?bWZmUEprcTlacVA5SkVJYVNzaTdiVmVPY1c5SUpDczcyS2xxNTVwTXlGcWRm?=
 =?utf-8?B?TXYxb01pZjJnQnlqSVRkZUU1ZENVQkxmeUtzSTg1aE9yUVJOeG5WSGRmK1Za?=
 =?utf-8?B?VTFNYXNwZ3JBWU52Q3ZzU0ZEUEtaeG0vcTJNcXRDb3F3TGkxYjFCa0t5MTdo?=
 =?utf-8?B?T05xeEg5bklGOEk3a1lvZk54R1RacjQ3bHBJNGh6MlZBMU1hU0NUaGordFE2?=
 =?utf-8?Q?1/xDQpRbDK5dpel/sZvnSpx/OXtuNr73LSyCg?=
X-Exchange-RoutingPolicyChecked: GRqODDOJ3BgFOXriU9mc6tpcjqecTTo5xYul5LU82fpow8VifNuZEQqEfdhzOLMSK2yklhGPJK9/H/50zbk9hmhSXNsF/j1Gvp7sSkokeNF/cbQcbEoBT7ptfzby5JzATBLByEB/XrgOf1qbj2iQMUCOJE436RnG4WAcavUYz9jQ76tJZznaq/Zu9y8k6ivH8HFLLSydiLFKUWjK6paF4QFxUL+aZXQSD5sEiwD+2S6I6dyYyuO6US+564NrHc3P1gDMRdlX6qk4V2XtqPLpDLWNoC1BxYpzrAzDGqZbpVl1yucuVgSRNAjkGpWsVeBTzWCtbBW7Yot2w9ytvOPeSg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 90d20991-7ac7-42d1-d810-08df094282e4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 22:35:38.1389 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HKCWiEkPZfA5ayTUD2h5WN5ArBMZePxIxn+BDKafISo+7PpLUOOWK9rOQgs80ZtDHC5MGNnrJTJGgZSPk+LIUhAhCJRsPWY1VLlqH2ixlIE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB005518
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

On Wed, Sep 02, 2026 at 04:22:38PM +0200, Michal Wajdeczko wrote:
>
>
>On 9/1/2026 11:12 PM, Umesh Nerlige Ramappa wrote:
>> Instead of always returning -EPROTO for most errors, use different error
>> codes based on the error type. -EPROTO is retained for the cases that
>> are genuine protocol violations by the GuC.  The remaining cases now
>> report what actually went wrong.
>>
>> receive_g2h() used to escalate to CT_DEAD + kick_reset() by matching the
>> two error codes that dequeue_one_g2h() could return on a fatal error.
>> Invert the check to simplify reset handling.
>>
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Assisted-by: Claude:claude-opus-5
>> ---
>>  drivers/gpu/drm/xe/xe_guc_ct.c | 48 +++++++++++++++++++++++++++++-----
>>  1 file changed, 42 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index 5c4733da385c..dcd457f38b89 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -947,6 +947,7 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>  	u32 cmd[H2G_CT_HEADERS];
>>  	u32 tail = h2g->info.tail;
>>  	u32 full_len;
>> +	int err;
>>  	struct iosys_map map = IOSYS_MAP_INIT_OFFSET(&h2g->cmds,
>>  							 tail * sizeof(u32));
>>
>> @@ -961,12 +962,14 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>
>>  		desc_status = desc_read(xe, h2g, status);
>>  		if (desc_status) {
>> +			err = -EPROTO;
>
>didn't we agree to use -EPIPE for a bad CT descriptor status?
>
>>  			xe_gt_err(gt, "CT write: non-zero status: %u\n", desc_status);
>>  			goto corrupted;
>>  		}
>>
>>  		if (tail > h2g->info.size) {
>>  			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>> +			err = -EPROTO;
>
>hmm, IMO it would be better to use -EPROTO only for the errors related
>to the actual HXG messages, and for raw CT transport failures use -EPIPE
>
>unless we want to use -EPIPE only for existing problems in descriptor
>and for new error conditions use something else, like -ENFILE?
>but maybe that's overkill as it is fatal anyway, and the message already
>says what went wrong
>
>>  			xe_gt_err(gt, "CT write: tail out of range: %u vs %u\n",
>>  				  tail, h2g->info.size);
>>  			goto corrupted;
>> @@ -974,6 +977,7 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>
>>  		if (desc_head >= h2g->info.size) {
>>  			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>> +			err = -EPIPE;
>
>we should be consistent
>
>	-EPIPE = CT already broken
>vs
>	-EPIPE = all CT channel errors
>
>
>>  			xe_gt_err(gt, "CT write: invalid head offset %u >= %u)\n",
>>  				  desc_head, h2g->info.size);
>>  			goto corrupted;
>> @@ -1591,14 +1595,19 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>  	 * failure to trigger a reset.
>>  	 */
>>  	if (fence & CT_SEQNO_UNTRACKED) {
>> -		if (type == GUC_HXG_TYPE_RESPONSE_FAILURE)
>> +		int err;
>> +
>> +		if (type == GUC_HXG_TYPE_RESPONSE_FAILURE) {
>> +			err = -EBADE;
>
>I'm little concerned that there was no other proposal here ;)
>
>>  			xe_gt_err(gt, "FAST_REQ H2G fence 0x%x failed! e=0x%x, h=%u\n",
>>  				  fence,
>>  				  FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, hxg[0]),
>>  				  FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, hxg[0]));
>> -		else
>> +		} else {
>> +			err = -EPROTO;
>>  			xe_gt_err(gt, "unexpected response %u for FAST_REQ H2G fence 0x%x!\n",
>>  				  type, fence);
>> +		}
>>
>>  		fast_req_report(ct, fence);
>>
>> @@ -1608,7 +1617,7 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>
>>  		CT_DEAD(ct, NULL, PARSE_G2H_RESPONSE);
>>
>> -		return -EPROTO;
>> +		return err;
>>  	}
>>
>>  	/* don't erase as we still expect a final response with the same fence */
>> @@ -1809,10 +1818,12 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>  	s32 avail;
>>  	u32 action;
>>  	u32 *hxg;
>> +	int err;
>>
>>  	xe_gt_assert(gt, xe_guc_ct_initialized(ct));
>>  	lockdep_assert_held(&ct->fast_lock);
>>
>> +	/* Keep in sync with g2h_err_is_fatal() */
>>  	if (xe_device_wedged(xe))
>>  		return -ENOTRECOVERABLE;
>>
>> @@ -1840,6 +1851,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>  		}
>>
>>  		if (desc_status) {
>> +			err = -EIO;
>
>earlier in this patch in h2g_write you used -EPROTO for the similar issue
>but I would go with -EPIPE here
>>  			xe_gt_err(gt, "CT read: non-zero status: %u\n", desc_status);
>>  			goto corrupted;
>>  		}
>> @@ -1871,6 +1883,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>
>>  		if (g2h->info.head > g2h->info.size) {
>>  			desc_write(xe, g2h, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>> +			err = -ERANGE;
>
>-EPIPE if we want to treat all CT descriptor problems in the same way
>
>>  			xe_gt_err(gt, "CT read: head out of range: %u vs %u\n",
>>  				  g2h->info.head, g2h->info.size);
>>  			goto corrupted;
>> @@ -1878,6 +1891,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>
>>  		if (desc_tail >= g2h->info.size) {
>>  			desc_write(xe, g2h, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>> +			err = -ERANGE;
>
>ditto
>
>>  			xe_gt_err(gt, "CT read: invalid tail offset %u >= %u)\n",
>>  				  desc_tail, g2h->info.size);
>>  			goto corrupted;
>> @@ -1898,6 +1912,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>  			   sizeof(u32));
>>  	len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, msg[0]) + GUC_CTB_MSG_MIN_LEN;
>>  	if (len > avail) {
>> +		err = -EBADMSG;
>>  		xe_gt_err(gt, "G2H channel broken on read, avail=%d, len=%d, reset required\n",
>>  			  avail, len);
>>  		goto corrupted;
>> @@ -1950,7 +1965,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>
>>  corrupted:
>>  	CT_DEAD(ct, &ct->ctbs.g2h, G2H_READ);
>> -	return -EPROTO;
>> +	return err;
>>  }
>>
>>  static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
>> @@ -2042,6 +2057,27 @@ static int dequeue_one_g2h(struct xe_guc_ct *ct)
>>  	return 1;
>>  }
>>
>> +/*
>> + * Errors reported by dequeue_one_g2h() come in two flavours: either the channel
>> + * is simply not available right now, which is expected and handled gracefully,
>> + * or the channel state or the message itself is inconsistent, in which case the
>> + * only way forward is to declare the CT dead and reset the GuC. Since the
>> + * former is a short and well known list, check against that and treat anything
>> + * else as fatal, so that new error codes don't silently escape the escalation.
>> + */
>> +static bool g2h_err_is_fatal(int err)
>> +{
>> +	switch (err) {
>> +	case -ENOTRECOVERABLE:	/* device wedged */
>> +	case -ENODEV:		/* CT disabled */
>> +	case -ECANCELED:	/* CT stopped */
>> +	case -EPIPE:		/* CT already declared broken */

I addressed the above in my WIP patches, and I am here now:
>
>btw, there is a different order of checks in
>
>	__guc_ct_send_locked()
>		if (xe_device_wedged(ct_to_xe(ct))) {
>		if (unlikely(ct->ctbs.h2g.info.broken)) {
>		if (ct->state == XE_GUC_CT_STATE_DISABLED) {
>		if (ct->state == XE_GUC_CT_STATE_STOPPED || xe_gt_recovery_pending(gt)) {
>
>vs
>
>	g2h_read
>		if (xe_device_wedged(xe))
>		if (ct->state == XE_GUC_CT_STATE_DISABLED)
>		if (ct->state == XE_GUC_CT_STATE_STOPPED)
>		if (g2h->info.broken)

I can fix the order in __guc_ct_send_locked to match g2h_read.
>	
>and IMO we should revisit usage of -ECANCELED as it should be used only
>for already sent H2G which wait for G2H but were cancelled due to a reset

maybe. I don't see a lot of ROI for mapping all these different 
scenarios to specific error codes. Final debug will still depend on the 
error messages and the specific CT states captured in CT_DEAD. IMO, CT 
disabled/stopped/broken can all be grouped into ENODEV and we can add a 
log stating the specific reason.

I feel it will be better to reduce the various errors instead of adding 
more (like you said - use EPROTO for HXG and EPIPE for CT errors). It 
would be easier to maintain.

>
>if someone is still trying to send H2G when CT is already stopped/
>then we should use different code, maybe -EPERM ?

or maybe just squash it into ENODEV

>
>-ENOTRECOVERABLE	/* device already wedged */
>-ENODEV			/* CT disabled */
>-EPERM			/* CT already stopped */
>-EPROTO			/* CT message broken */    => reset => stop/start => enabled|wedged
>-EPIPE			/* CT channel broken */	   => reset => stop/start => enabled|wedged
>-EDEADLK		/* CT deadlock detected */ => reset => stop/start => enabled|wedged
>-ECANCELED		/* CT stopped/GT reset */
>
>
>
>> +		return false;
>> +	default:
>> +		return true;
>
>are we sure only all other errors need to be recovered immediately by
>the full GT reset? not the other way around?

Just preserving the existing behavior of when the kick_reset() kicks 
in!!

>
>we should kick reset on the first report of -EPROTO/-EPIPE (when we detect broken
>HXG message or CTB descriptor), subsequent calls to send() shall return new
>either new errors, like -EPERM, as CTB should be already STOPPED, or -EPIPE
>as we might still wait for the reset flow, but CTB is already marked BROKEN.

Agree, reset should happen only once.

>
>and I'm not sure that reset would help for -EOPNOTSUPP, as it is unlikely
>that driver will suddenly start supporting some new messages ...

That is exactly what I was saying earlier. These errors are misplaced.  
The EOPNOTSUPP is returned when we are trying to process a G2H and don't 
recognize the MSG type. The error says ""G2H channel broken on read, 
type=%u, reset required\n", but the error returned is EOPNOTSUPP. It's 
not intuitive. I would just make it EPIPE (going by the categorization 
you recommended earlier...assuming I understood it correctly).

>
>> +	}
>> +}
>> +
>>  static void receive_g2h(struct xe_guc_ct *ct)
>>  {
>>  	bool ongoing;
>> @@ -2079,8 +2115,8 @@ static void receive_g2h(struct xe_guc_ct *ct)
>>  		ret = dequeue_one_g2h(ct);
>>  		mutex_unlock(&ct->lock);
>>
>> -		if (unlikely(ret == -EPROTO || ret == -EOPNOTSUPP)) {
>> -			xe_gt_err(ct_to_gt(ct), "CT dequeue failed: %d\n", ret);
>> +		if (unlikely(ret < 0 && g2h_err_is_fatal(ret))) {
>> +			xe_gt_err(ct_to_gt(ct), "CT dequeue failed (%pe)\n", ERR_PTR(ret));
>
>btw, shouldn't we always report an error and just kick reset on fatal?
>or maybe even move kick_reset() somewhere else we know it is something
>new and fatal (like detected corrupted descriptor) ?

I think this check is trying to avoid a duplicate kick_reset()/CT_DEAD 
since the caller is bailing out on ENOTRECOVERABLE, ENODEV, ECANCELED 
etc.

Thanks,
Umesh

>
>>  			CT_DEAD(ct, NULL, G2H_RECV);
>>  			kick_reset(ct);
>>  		}
>

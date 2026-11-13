Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51114606A33F
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 14:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cj0QHrGs;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=frfm9rLQ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F2AC10E6D9;
	Fri, 13 Nov 2026 14:52:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18B9410E6D9
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Nov 2026 14:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794581548; x=1826117548;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=T0zhTeQKXLimyg58v+F/Xqaw4CtfJQcN/LQ0cQ7D8Jc=;
 b=cj0QHrGsksDvqgOBwFb6OLNgRJlihxoENuwZWqUWjOrEUbz+rW1DkGJG
 IVykulzMFHRVv5YBc0/5mkVqFYA+FeRkElrrjWb9N8bM30/xmMcsnUxLj
 cK1RLD7lRsMBvTUVIJKPbjvPd0MT1NsDtAPVTNBEQkVeHeoYryzJzPjY7
 g9sUUMxqUWKyzUcg+1RHp5KPn7vNUYqEATphOEjzdZNKyP928LbBqab2/
 w9mgcnJklXZHY+OmBe8jFvBlNdBYBR3JsmnTs/2vfiTOTTFFkSZHLd+j+
 Sah/Vwzp9yPUSRAIkKJIq1vShxWLfS0pZE1q6XNDD76CBJfCqoWIro65w A==;
X-CSE-ConnectionGUID: upD7w7qlRaqZbGxDxOl+kA==
X-CSE-MsgGUID: z+8HYJqDRm+FfYINnMIf6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3278831"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3278831"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 06:52:27 -0800
X-CSE-ConnectionGUID: M2aM/wCHSRe6/i2XSYPzkw==
X-CSE-MsgGUID: Hq9hSZhXTBWQq0SMmkXijw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="8786542"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 06:52:27 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 13 Nov 2026 06:52:20 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 13 Nov 2026 06:52:20 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.22)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 13 Nov 2026 06:52:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rZ/klDxInFDopS9nISTBhIgXGyvA/3cdFbqSrIu4rupJfUJgVDg/GkyfOb29HyyVIZ8+L+4Lr3GO2UrSa/BKI7hgSWrvGo/VhUW7XBoAJs5roM9mfJZc0jazSLrcIk3g4DavQ79V63yAtkaEiIfzseXFssTvhDndftv763WeL6a9Jw0CCp5GeuUUPuRuWQK6j0JEJfxXY4UnY/VgPXOhoFVIP1PlYelA1BbZu+f1HjKFlnmis6E0GaIzFQxF/3YusDgAKRLIYs15ow4TMyuspYMSSPeEHXib01rc5OMwkYiU/o37vFKAmgym/UV3A5xNlebwXazP+kyumtGTDB4BYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eLJ5nAbXd+run+Tbm1ZA1l0vPf1TOSwFJ2J/5i7THFQ=;
 b=bqzwo0j8Uh0vpnujL5F1mzG6kytQrVReV5wfod2YKHiMnHyo/O/Yc1HcNf+gE2WfmAol1Q8YftqDOU4YUHfp2hFLbfeOgAkM7zdEzCutKy9LM2RR13YF61vFts6oUoh12NGnUAhwzk6utsmssBoDBfrE22Bk/kbAOOx9ChQq8C31VmbTMjBajJuiwGqZDjt4nqi6y5B3raawUm4Zy2tbWu6IypDEhqLub/FLIJ/J5KneZCU6ISbwpbOXo3YpA5zH7Y7jHDKSq7wFwyyaosW8uf1HrqLHAdnEogyA549WuBhIv/ug/yg1de87d8+QPLOMqw9QyDZC3eNeAZh0q5nPWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eLJ5nAbXd+run+Tbm1ZA1l0vPf1TOSwFJ2J/5i7THFQ=;
 b=frfm9rLQkLuHNcqEEBNe5dT24M2JVc69s4J1swdmGAvSSxF8UQyhzK4u7M3EoPEzVkyBQGJwHMxzrKJRrmBx6vuJ8kM7dDXeKe0Qd/nn6+29MUMtYyZsgNeeLHz+7R6VGhvnjTLGk8Ryja+wmKQM3Kkvd1I+wwVifP7G+VbDBIA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SACPR11MB441135.namprd11.prod.outlook.com
 (2603:10b6:806:542::24) by IA0PR11MB7402.namprd11.prod.outlook.com
 (2603:10b6:208:432::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Fri, 13 Nov
 2026 14:52:17 +0000
Received: from SACPR11MB441135.namprd11.prod.outlook.com
 ([fe80::b1bf:92e7:7b65:530b]) by SACPR11MB441135.namprd11.prod.outlook.com
 ([fe80::b1bf:92e7:7b65:530b%5]) with mapi id 15.21.0615.009; Fri, 13 Nov 2026
 14:52:17 +0000
Message-ID: <8dfa8e4b-89af-4955-afb7-79cc01529445@intel.com>
Date: Fri, 13 Nov 2026 20:22:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Add sysfs to disable RPe
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20261111212150.3738637-2-vinay.belgaumkar@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <20261111212150.3738637-2-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0086.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::11) To SACPR11MB441135.namprd11.prod.outlook.com
 (2603:10b6:806:542::24)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SACPR11MB441135:EE_|IA0PR11MB7402:EE_
X-MS-Office365-Filtering-Correlation-Id: ee49b59d-c710-4969-ad15-08df4195b5f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|11063799006|261102123227099003|261021121427099003|261026140227099003|261009223027099003|261021123027099003|261028144727099003|261022105027099003|56012099006|261026121527099003|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: YSMkg/Buxiq4Hp0deZE9da8bRVbvOqKMIafVGO1q5YvoaCUuJIIpQI1jtbJR1yOGsDIfV7v4WUqpKHKHgaxqFJbEQCiM5BM1ZpVyjV5FvOq3lOihhKqbRCVKoRq66AnMdwTco7KDzVgdS4QgZsRFECuJMC+oheLt46yuoUGkCglc0b2EBe7ZdQJ1/RmdPOfHmd00WTjBggQyHdFqErhxy7Ak2NazBTh5HkJG4l/Xp3/Xaut5hhBIEoyeUTHzY5H3ZbBxAkDNp1PsgpEzzGptHkhZ+JJhZeCaaFfmFyJz4fghDvvIOVcbnRFCo59b1vUapHRsUkEFJuKkn1jrBPT3+UKalvioRR5qK8DWU3eQNveByZU4M5wt3mdhjf8NRzUx6WWOJ9STDaAfwqX9OCDT2iY35Moys3a8SNXC1ijXjaonxfOKaSgSFX45EHCMGOtGPOYfCPoP28oK2+KHlyDT0FW+8PHP5/8trQdW6Ecal/0Ikbzz0CW88YjICr25X16H71qOWSEJg1qrLkl0yQhLPaZY5ccaQPCzT53E1+qEeNnks5WjEklqQKZ1yeFFMXlX4f8uRrT98JhrAGOheR9eVG6zKvZzY8kZNkWChjkMLwIboBm+mFkgPbr701sq301UOxHzmoVEtSsqEk1vdjJ0B6AW43aUjjvheE8l9fxpYE0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SACPR11MB441135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(11063799006)(261102123227099003)(261021121427099003)(261026140227099003)(261009223027099003)(261021123027099003)(261028144727099003)(261022105027099003)(56012099006)(261026121527099003)(10067099003)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z014QmZWMzl5SzUvNUNVdzJYZXQxM2REeFJSN0hOZGhHUHhCbmVjMkFPMjgv?=
 =?utf-8?B?QlFCU3l5MVNhTEx6dlJ3WmZpdWYxUC8rdStSMUV5VTdic2NHWE9GMlVOVlFp?=
 =?utf-8?B?RzlUd2pZNzNTMThkWVBMaXl4MzQ3b1FIUC9XZS9jMEVPTm5jZzBwMGdJUWhQ?=
 =?utf-8?B?VlRpUmtvWEh4T2RTVW5zODNCM2NHNWdrT3NZVGRtRmpNdk9TbnhzOGF0a3Ur?=
 =?utf-8?B?bUpiTWx1RjlaU0grYmVhUVhzenJ2MVoyQnpGMDRlQ013WFhkSTZrYUpBRnFY?=
 =?utf-8?B?N2lQZVVZRXdDYWNMTHViamdpTXJBUThXWnBRUThUS1E3Tm1NSjFkUSszaG5B?=
 =?utf-8?B?K3hQQS94aFpGVkhRQlNwbVI5enA0enRYY3NieEFQeERaTnIvajVIaUxkZHkv?=
 =?utf-8?B?UXRRQUp0eUZRb2hpWGVKMWVLNXFyUU5DS1cyRk4wOHhld1BoQXI1V1ROem5i?=
 =?utf-8?B?MlhWNTByLzBTMzVSeFNybkl0NjlNWGtaY0k0RXc2cEN6aDdPVzRoVFgvYzhX?=
 =?utf-8?B?R0NoUFNQUXBmY1hQelZCNFJGS000VDVmdHU4V2dkTExhaUJEMkdSYTdYSDYr?=
 =?utf-8?B?RWQ0bHNOMnh6Lys2YUYwdDFLMW1EMUtTeFk2cDRxVWpOb2t3enRhWkVueXRF?=
 =?utf-8?B?N001TFVndWJsTEtwSDFZK1B3MXM2MU5DSisxb25RM0NkVkFYdk12OTRINlhp?=
 =?utf-8?B?S3dsb1hBUDhjdEk5dTFsT2pIb1ZVQ29IakEwclBuTllBSkthdEtwZ3czT1FZ?=
 =?utf-8?B?dUx0blF6bTBILy9KTHhVODB4RmlSZUNiakh0Sm5abGIyeGVQbFI1OXUyWDdw?=
 =?utf-8?B?S0xFcnpNcGViQkdmNDF1aUNOZm5SRnVRV1RVa2pqcEJQb3RXL3l1VFdsQWRi?=
 =?utf-8?B?QWZGM3htM01lblRiQjl2M294dWRwY2diWTlNVE5VdTlQQTJlMWQrSmFVM3E3?=
 =?utf-8?B?d3o1SHkyRnpBWnIveG8yazlhekkzNFpjMXFOOUZFNnBrclhqYnVtRERKZURZ?=
 =?utf-8?B?eERHUXpNbk8xQyszcFZwYVNKMzg5V2MrbzBNbzlGUlAxYThRR0Z6TUZ6V1lH?=
 =?utf-8?B?QW4weG1LTklqQVpGSEtkMXgvNEx4REJsTExWUmUyMmMrVmd5MjJtWjVEQm5B?=
 =?utf-8?B?c3d1a3RRRFlWbi9HTmh2TmJFWmJTUCtvRXZXUVNsaEs5QzRKR3FmNnN0MFor?=
 =?utf-8?B?NlhrazY5NVBrY0Z2UHZKQUlKb0ZuWjZxRFR6Z0pPbWFRa25XOHpiOFB2cXVO?=
 =?utf-8?B?eUdjV2dRVU0wcTA0Q0ZEM3lCMFY1d0ZxOEg2Nm1FS2JqNUw5RkhOeHZFalVQ?=
 =?utf-8?B?SXpBTndBbTdHTWR0M1hQSk9yTzBwOFVzWnErVG9WcmVjNW4xcFIzaXJKMUF0?=
 =?utf-8?B?dFJUVTVmck0zL0tmbXVVdjFvVzQzREZ1a0FreG5oK1FERUV6TnFQZmw1V2g0?=
 =?utf-8?B?Q3NDM1R5NjhNb1BIbC9TR1U3bHJNQkNiMzQwdUhVY3NUNWlPNW92RkNpWmNR?=
 =?utf-8?B?ZHBtS3lBUTVjODN0SXhVcXJqMnJSMFEvWVRMRDJkaFV1MWs0cVBGZjhCNW5B?=
 =?utf-8?B?cmZoRzJzVUdyMndsRDk3ejRWMnBRN3VUaFQ5ZmV2aGhIcDl1WkJSQy9ZSXJG?=
 =?utf-8?B?VjQvdDBpV0lmL3c2UXdQdUM3Nld0RlEvSURZOEVzZ3VNZGRabjBrMGtDQ1VC?=
 =?utf-8?B?bHNJSUcraHN5TnU1RDRoaUtTdWRPaFdncGoyMVRJNlZScm1aOVgxSnR6RzJH?=
 =?utf-8?B?WTI5RWVlMDdGQXNNK0dRb1ViWkk4cktieDlLU0paSXE2cDZ1NnMyekxYbXVz?=
 =?utf-8?B?V1p5a3VYekZhcUNabkpSTTZCdFJMUkNHZVYwVk9qNldyaVpyVkJWeitUalZj?=
 =?utf-8?B?Sk1BQjE4Q2dmZ0RnLzdIb2ZuZnoxUSs5dVd4eWxlU3d4VUdEcjBkY3pob1Nu?=
 =?utf-8?B?SFJ0V1RJd1RXVGJpdlhGSHMwek96NzVTUzQxS1V1MzRUSjNmeis1NzljYU9x?=
 =?utf-8?B?V0gwQVVJTGF4dGE4anYzZ2NrWTlzb0NoblBnNSs5OStzUTlMKzArU0VQaDdv?=
 =?utf-8?B?Y0k1VHRzU3krM1NzSjUwM3hPWHFER3UzY0NycDBhVGJlL0NXN3RseTYvZnV4?=
 =?utf-8?B?Q2tMVUcyS2NBNEF3MFN4d0RmRldrTHR4ZXJ3N1lkbWRYd0E1Y1RXM3lGazNN?=
 =?utf-8?B?WDB4cXhKYklzbXNVbjZqMHVaNFIvWXE2U2ROZXE4TVYxQWFIMkIyV0dhb3Nt?=
 =?utf-8?B?RjZmdkorc1RtajVsSm4xNkF3YXBLajRqdzVOaDNmR09LUTVDUmRQZ0JtdFRw?=
 =?utf-8?B?dFErVHVVemI5STNQVEdWOTVQZGlCMXpqSmFwNEQ5ck11aVd0bXpqQT09?=
X-Exchange-RoutingPolicyChecked: Rh8YTYASmk6gh9pld/PE6rGEMtUfZiW0p3rf9tA5KGR7jwOQXgIwlS2GLsZoL3ijBiIyP+on957ttRGoelbtu9s/x2tn1hxRl2AdtlGhqqsWYshVJ5TbCipf8uJc4aXUz+i+jIcPkk0NqyldV8qIL2Jx2eAW2nzjbYA01BURbB4wOl8KxijXYf2GU/1z/sXeTW+ie+bAJvNorPgXRHKd1+9LY7VvZ6ZROESq9w0kSoHDRgb/N6ssJMMHoDhx+DabcXFW7xCWtSeYj0TzVEZhtNW2bC1pHd/f1e2gbx/fILYxl2ZbfeHYUVzKXBH9g7Sb7UI0PKmDI6k59nlxCfGVug==
X-MS-Exchange-CrossTenant-Network-Message-Id: ee49b59d-c710-4969-ad15-08df4195b5f5
X-MS-Exchange-CrossTenant-AuthSource: SACPR11MB441135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 14:52:16.9599 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MCkd1IyYf0FeR3ljKZgUP5fi/Q5bivViqM3jhl+BTbPlrUQA1v51CkxEznOC5PyWcG35qn4RdliohdDfwhAgDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7402
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Vinay,

On 12-11-2026 02:51, Vinay Belgaumkar wrote:
> When SLPC is initialized, GuC sets the GT min freq to RPe(efficient) by
> default. This frequency is desgined for optimal perf/power ratio. However,
> certain use cases may want to run at lower frequencies. This sysfs allows
> user to disable use of default RPe behavior.
>
> Efficient frequency will now be controlled by this interface alone. Setting
> min_freq < efficient will not affect the flag. Disabling use_rpe will cause
imo it will be better to convey that setting min_freq < RPe will not 
disable the flag anymore
> GuC to bring back min_freq to whatever level it was set before and enabling
> it will bring up the min_Freq to rpe_freq.
>
> $ cat /sys/class/drm/card0/device/tile0/gt1/freq0/use_rpe
> 1
>
> Cc: Sk Anirban <sk.anirban@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_freq.c      | 34 ++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_guc_pc.c       | 47 +++++++++++++++++++++++-----
>   drivers/gpu/drm/xe/xe_guc_pc.h       |  1 +
>   drivers/gpu/drm/xe/xe_guc_pc_types.h |  2 ++
>   4 files changed, 77 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
> index a40dd074106f..f9542848c1d2 100644
> --- a/drivers/gpu/drm/xe/xe_gt_freq.c
> +++ b/drivers/gpu/drm/xe/xe_gt_freq.c
> @@ -242,6 +242,39 @@ static ssize_t power_profile_store(struct kobject *kobj,
>   }
>   static struct kobj_attribute attr_power_profile = __ATTR_RW(power_profile);
>   
> +static ssize_t use_rpe_show(struct kobject *kobj,
> +			    struct kobj_attribute *attr,
> +			    char *buff)
> +{
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct xe_guc_pc *pc = dev_to_pc(dev);
> +
> +	return sysfs_emit(buff, "%u\n", pc->use_rpe);
> +}
> +
> +static ssize_t use_rpe_store(struct kobject *kobj,
> +			     struct kobj_attribute *attr,
> +			     const char *buff, size_t count)
> +{
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct xe_guc_pc *pc = dev_to_pc(dev);
> +	int err;
> +	u32 val;
> +
> +	err = kstrtou32(buff, 0, &val);
> +	if (err)
> +		return err;
> +
> +	if (val > 1)
> +		return -EINVAL;
> +
> +	guard(xe_pm_runtime)(dev_to_xe(dev));
> +	err = xe_guc_pc_set_use_rpe(pc, val);
> +
> +	return err ?: count;
> +}
> +static struct kobj_attribute attr_use_rpe = __ATTR_RW(use_rpe);
> +
>   static const struct attribute *freq_attrs[] = {
>   	&attr_act_freq.attr,
>   	&attr_cur_freq.attr,
> @@ -252,6 +285,7 @@ static const struct attribute *freq_attrs[] = {
>   	&attr_min_freq.attr,
>   	&attr_max_freq.attr,
>   	&attr_power_profile.attr,
> +	&attr_use_rpe.attr,
>   	NULL
>   };
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 9558d7196a51..8f7044b49e13 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -344,6 +344,21 @@ static void pc_set_cur_freq(struct xe_guc_pc *pc, u32 freq)
>   	pc_set_manual_rp_ctrl(pc, false);
>   }
>   
> +static int pc_set_ignore_eff_freq(struct xe_guc_pc *pc, u32 val)
> +{
> +	struct xe_gt *gt = pc_to_gt(pc);
> +	int ret;
> +
> +	xe_device_assert_mem_access(pc_to_xe(pc));
> +
> +	ret = pc_action_set_param(pc, SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY, val);
Once this param is set, does it stay stable on the GuC side when the 
user later changes min/max freq, or can it get reset? I recall hitting a 
case where it got reset, though I don't remember the exact condition.
> +	if (ret)
> +		xe_gt_err_once(gt, "Failed to set ignore_eff_freq to %u, %pe\n",
> +			       val, ERR_PTR(ret));
Double error logging,pc_action_set_param() also will display error in 
case of failure.
Also do we need to set min_freq to RPn here, as we are doing in i915.
> +
> +	return ret;
> +}
> +
>   static int pc_set_min_freq(struct xe_guc_pc *pc, u32 freq)
>   {
>   	/*
> @@ -353,13 +368,6 @@ static int pc_set_min_freq(struct xe_guc_pc *pc, u32 freq)
>   	if (freq < pc->rpn_freq || freq > pc->rp0_freq)
>   		return -EINVAL;
>   
> -	/*
> -	 * GuC policy is to elevate minimum frequency to the efficient levels
> -	 * Our goal is to have the admin choices respected.
> -	 */
> -	pc_action_set_param(pc, SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
> -			    freq < xe_guc_pc_get_rpe_freq(pc));
> -
>   	return pc_action_set_param(pc,
>   				   SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
>   				   freq);
> @@ -1166,6 +1174,26 @@ static int pc_action_set_strategy(struct xe_guc_pc *pc, u32 val)
>   	return ret;
>   }
>   

It's a non static function, better to use description maybe.

Thanks,
Anirban

> +int xe_guc_pc_set_use_rpe(struct xe_guc_pc *pc, u32 val)
> +{
> +	int ret;
> +
> +	guard(mutex)(&pc->freq_lock);
> +
> +	/* If use_rpe == 1, ignore_eff_freq = false */
> +	ret = pc_set_ignore_eff_freq(pc, !val);
> +	if (ret) {
> +		xe_gt_err_once(pc_to_gt(pc),
> +			       "Failed to set use_rpe to %d: %pe\n",
> +			       !val, ERR_PTR(ret));
> +		return ret;
> +	}
> +
> +	pc->use_rpe = val;
> +
> +	return ret;
> +}
> +
>   static const char *power_profile_to_string(struct xe_guc_pc *pc)
>   {
>   	switch (pc->power_profile) {
> @@ -1314,6 +1342,10 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>   	if (ret)
>   		return ret;
>   
> +	ret = pc_set_ignore_eff_freq(pc, !pc->use_rpe);
> +	if (unlikely(ret))
> +		return ret;
> +
>   	ret = pc_init_freqs(pc);
>   	if (ret)
>   		return ret;
> @@ -1400,6 +1432,7 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
>   	pc->bo = bo;
>   
>   	pc->power_profile = SLPC_POWER_PROFILE_BASE;
> +	pc->use_rpe = true;
>   
>   	return devm_add_action_or_reset(xe->drm.dev, xe_guc_pc_fini_hw, pc);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
> index 1025a2b15f5f..dc52f349a6a2 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
> @@ -31,6 +31,7 @@ int xe_guc_pc_get_max_freq(struct xe_guc_pc *pc, u32 *freq);
>   int xe_guc_pc_set_max_freq(struct xe_guc_pc *pc, u32 freq);
>   int xe_guc_pc_set_power_profile(struct xe_guc_pc *pc, const char *buf);
>   void xe_guc_pc_get_power_profile(struct xe_guc_pc *pc, char *profile);
> +int xe_guc_pc_set_use_rpe(struct xe_guc_pc *pc, u32 val);
>   
>   enum xe_gt_idle_state xe_guc_pc_c_status(struct xe_guc_pc *pc);
>   u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h b/drivers/gpu/drm/xe/xe_guc_pc_types.h
> index 711bbcdcb0d3..61654ee7d8d6 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
> @@ -35,6 +35,8 @@ struct xe_guc_pc {
>   	bool freq_ready;
>   	/** @power_profile: Base or power_saving profile */
>   	u32 power_profile;
> +	/** @use_rpe: Toggle use of efficient frequency */
> +	u32 use_rpe;
>   };
>   
>   #endif	/* _XE_GUC_PC_TYPES_H_ */

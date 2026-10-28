Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE8F606A325
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 09:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LN3DBf4q
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 763F210E59D;
	Wed, 28 Oct 2026 09:45:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA26510E59D
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Oct 2026 09:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793180720; x=1824716720;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WYsro8mBWgEFy+XmaIMOoHAmGoMAeyaSKn2jNDijhj4=;
 b=LN3DBf4q8LjF/FIZ9qxyjfVpw4ppGta3pCMbd3yed4VTpTTQNISGLIEV
 P6DgopmLElkpJA2LiDjWgl31CkWhxktBN1Gs+ym4CSG3t5VnbxNml2UM1
 ZLurlWZQKE9K8dHjDPT+A6aJtuCSK0v79JKgipdfuNnStQpsXKbnzgx3D
 FO95Do+yX3JtejgBqgIRJqS1Gq3JQ5dGZmaDwTy2xyqxBhvhDL1uZMN+E
 1TgghKKyBGYfNDTUPKuSIj42UJqck3w48rz1APpcBeO2snq4QAdYRK+rY
 XTl0ezFC0lQDyUNLIRLhtU3rqRBgQJ9RNerdhbhoi9MQXTKdA7WfbSM5f A==;
X-CSE-ConnectionGUID: Gy0px3BzTTuVr54SvLu6oA==
X-CSE-MsgGUID: pQ1lgDDbR6aeF4TQj8yTsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1789061"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1789061"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 02:45:19 -0700
X-CSE-ConnectionGUID: gu7owHjiSSCe41r6JTBUaQ==
X-CSE-MsgGUID: 7RH612UxSyicjHCdFG7rqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4807051"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 02:45:19 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 02:45:19 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 28 Oct 2026 02:45:19 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.6) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 28 Oct 2026 02:45:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PcixKdvIr/OFyNgAmDsFspYwjQcnnB8GOMht9mrRUxrRZbBSuAT31e4n3RN+7GTXmhM0fnYOmEHykLeNDIydVGJ9uErEwDzKqMMZG67LvDX4xAeTax9VfSR/RqtCJBiCtMiFN2OrBFcuZqBFKop4s+7eebwh8giVb/GUNIuIQb0kZHp6vJ+DlR66KnbLk06uCo8KOkXr4BL6qH1GAnk/VTn5zRZCXhvg/4KoO5iNzHhVqwEhVr6ZrtimpQ6fBWbn1PsUY/2f36WdBbMPzXcoqgzvDgAdAGusFSh3h0on1De8v1pcQ/f4cIum8+IsyLLbVWP94AWq8NK4uvcraeG4PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nDhlgZt/A++6uGmdhpwFv3mxWD4PNMzNWS30KxBxiNU=;
 b=uW8Y+uod5TWCcNdRjXEWkKGm7PFJX8+lPP2auG+yY8IL1JtjRXZNpfPrnYCrurWocWebjLagH1GorCVB9jw3XHFiZN5UE4V1vsgjUphBlLe68Oe09DudnOLRxDHgKkrxuBmOUven2tk0c3yjyaK5/JU8kjmxdxu97Si7ClI2cJ484lXxaMgjwCIYGjFVLb9RHPQv8HGyEA0C1uXcp+tTYsYWtXCqbIot5lIS5kV2GnT4DUX3tC0j7rhzb1bogd3uUJ03DJCi1K7XNXx2B+rK7v3IP+4gelJ5s+Mbnry5SgrTJvTclwdDKsgRUgq65QuHBbfgobuwr8YKFPXKVYYfKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7862.namprd11.prod.outlook.com (2603:10b6:208:3dc::8)
 by LV2PR11MB277206.namprd11.prod.outlook.com (2603:10b6:408:3a8::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Wed, 28 Oct
 2026 09:45:16 +0000
Received: from IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f]) by IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f%5]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 09:45:16 +0000
Message-ID: <55118b62-934a-4e81-bfdc-1e2f67777253@intel.com>
Date: Wed, 28 Oct 2026 15:15:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] drm/xe/pci: Add upstream switch port lookup helper
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <tejas.upadhyay@intel.com>
References: <20261026060459.771448-11-riana.tauro@intel.com>
 <20261026060459.771448-17-riana.tauro@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20261026060459.771448-17-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0073.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::12) To IA0PR11MB7862.namprd11.prod.outlook.com
 (2603:10b6:208:3dc::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7862:EE_|LV2PR11MB277206:EE_
X-MS-Office365-Filtering-Correlation-Id: da83c2bd-f3c0-434e-131f-08df34d82bad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|22082099003|18002099003|56012099006|11063799006|4143699003|261021123027099003|261021121427099003|10067099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: qi39BVFP3/vyuhxHmSWaarpzVhkTlMI6AFJcHfhKhqhZXu2JgvC/Of76mmIMcZRgCtdtNnlf9JNVBeOXWDtkNIyoveA3tGX4JuzfHqm2mxAfWkhhytgPtIJe2EyxyIYPRvD+WfCwOo7lfuX5lqmwKyT5mgodm/WuFusl/NnFCc7bOZ0R8nyWN9LuyXxIhQxfPZR5sn2aOLIxtUSCPhbWEbh1TBcTm7uvhUNmgdzjLaVY5D6uMq+pAsXfT172XzQsIytq7HFs9X0PQK4XYkQsypuzHSTe0hdOa6aoP/6nFkbJpP5umAdaddh+v0UZtdqJluMt/BoKdJPIBSrbb57mtvFvH4bXCnEQvq2Lu7SsWGSb5rGP1MgtiF+oBnasD+xxq6d88vqs1LfFDkJsPnSWkaoGVisn3QznUk5aPzy/ZfXksCfzoVXZwKj9zK0jAtOJENO+bRDqCGU3wunaGDQ5RzuURkkOvlU++g7ObCUgQH0bMwvv7p2MX65B7V2tMRh16kb20c+iRBO9Q89U/nW5lagzO2/hDmL1C+oYhP0r5MOCfTm5JZi584qH7Y1mvhGH2ag0bmZOzQqUS1kaV7vZGh7kXuJTmIgez0fF18NqWhmIaGS4w0fCBo2bqCs1Fwid1Zf+1Ni+MXFGk8xRa+NL4YmxcNpcug3G8BkF5jrCIaQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7862.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(261021123027099003)(261021121427099003)(10067099003)(261009223027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ly9FWHZHUUhGRDU3ODVlek9pN212V0VlOXkzZnJsUERCcU8zQTU5eVE4UTUz?=
 =?utf-8?B?TFZ3WlBoc21kQW9RRnhjOTBDSzNUdXJqTjB2K1NVWjJGZVJWV2ZnUzBlZnVm?=
 =?utf-8?B?cm9HM1ZrL1BMZno2bUZzRW5vN2ZFdEVITnNVOUZvejd2STlSSFQ1UGdDbytX?=
 =?utf-8?B?eE1rK0xpenRFVWNoYkZsd2NOY1VWS1Q0d21ic0FqT01HSFUyVm14NlNEUTRG?=
 =?utf-8?B?ZUhBZXlXUnF2ZzBDK21iWWpIYjd6Z3VRSjlteXhkbFI1clIxaVBGU1NZZGxD?=
 =?utf-8?B?bThzbzdGNWZhRXRhK1JXRmlSeFNFMC83WHRBZWdXR1kzNE5BTXNxMUVxY2sv?=
 =?utf-8?B?OWRKeXdCVURXZ294QjdIZXpUemxjN0tDMWtqTzFkbUtOK294NTFHOUtEZkR2?=
 =?utf-8?B?Q05yV2NUOWI1eExjdmxlcXExK3NXbEpvaVk2L25odzJyNHlienBUSTZKWjRV?=
 =?utf-8?B?SjhSamRtRVJaNG9pMVI1Y2EzcXhGUGVkR0FBYklRTXhpTUxtRUFCajIyRU1C?=
 =?utf-8?B?N3ZlK0cwdDdRQ1Y3d29ydVNId0l5T3hSMlE0QTVZeG0vcCs2eUtHSmFxOFN1?=
 =?utf-8?B?NGp1ZllUVEJZdStOU09oazQwMjNPWXhoSlozVXFaVkN3TmxZNmNKSkhXdEtp?=
 =?utf-8?B?dWU4d3R6dUdGdkhSdE9IREZvSXpLK25icW5MRHNuMmplbDgyWGk2dFFMRDVt?=
 =?utf-8?B?cWh3TnU0UXEzVGRtZ0E2TjUyVXFuQkU5THZpVHk1SWRpK2Z6bTdQTWZhQVNC?=
 =?utf-8?B?UWFXaFZJTHhJc2dFUFVEZGs1U1ZtdDlVZlJOU0toamd4bmwrMUI1cnNsc3R1?=
 =?utf-8?B?NmV5emVxWkdVeEd0ckhjQUlEQmJBNmVLL1BJdEZTdWJJNmhGWGFRamdvR2hZ?=
 =?utf-8?B?cXlSdEhDUG94WUNOdndoejFxODdSa0IrSDkzRllmZ3FTQnRUY0dnN1dNd2Nn?=
 =?utf-8?B?WTRxY0RpdGxEcnJ3MjltMXpORzJZMzFBcWpxdnhIaFRzMEhGaHNFWVB2YnE4?=
 =?utf-8?B?VjhkM2JTYnVsRXd2Y1lGOHNyejBvRFBCWGtMc01XRHloMEdwb2FScmczSkJ4?=
 =?utf-8?B?bjlvN1ZuamZmcm9zb21GYU41Q2VYRlZHcVpwRTBKTndDaTFUREwzMTYrU21M?=
 =?utf-8?B?dThCV2cwQjM0V1JaM1FsTzBBeU94TUoxSFVJUkMzTWZSUWgzczZFVGFsK2x3?=
 =?utf-8?B?a2RIZCtjUWtTRjJZOHpHclpwUEYvdjlTZy9XcUYyMTh0NCtDOGlkNkhSK2Fm?=
 =?utf-8?B?aGNQOFZ6MFU1dSs3UytvNXJkZE5RQkpXMStERTZOMWhMMFcvYjROZHhZVkQ3?=
 =?utf-8?B?Vi9zbFhaK3lzNzBXbVJSOTc5eVZneVY3NFNnaGUvKzRza214Q3Y1bTRkeDZE?=
 =?utf-8?B?S3k2c2ZPdFY2ZVhJN0M4OUFJQnpjeHJCVHdWRWRlamZLejhNR2tjK2RVNnZL?=
 =?utf-8?B?KzdISzlPTXJ4ZDZtN2dkUGdoejJGUG5BQXlFSzk5bSt1T3NDWXdNY1BHWStO?=
 =?utf-8?B?UHpkdFJwQW5HUVNJNENEZXZVVE5PSjBZa0dWV2x4WThhSkJRVTdLVWhzWnZC?=
 =?utf-8?B?bUFEYzFabjRPZ2dBdmV0MmxldjJ2NTRTZ2N4bE9UQXE3OWU0a1BNbERPaFRZ?=
 =?utf-8?B?NHlBWGZMOEhNZ29tYlBGdG4xUW9EWk0wVGZIcEpETGx0anRUVUc1a1l4c21h?=
 =?utf-8?B?aTlwYXplV0VvRm1rYUd4c05nUHVZTGY5bHBZWXRhNTZHMWVjMFdlcVZQMlBj?=
 =?utf-8?B?MHQvUVp5dE0rM1kyZnRDWmtaVk5kTy93YStjYmU0ckdoYU1xNXR1RXd1cFFJ?=
 =?utf-8?B?WDFTWVlXNisyOUVJTjdqcGgrUHpnbGs2TnhhekFGQVI1L1NzR3NQa0gwRFU5?=
 =?utf-8?B?cURQNmprZExrc2NIeEZlRUdnSXBVUTducGV4WTZUYXNPMnIyY1hUZWxhakRY?=
 =?utf-8?B?ZThyNVdsWW83RGt6NFBlUE9RaDBtMnMxRG96Y3JNRlViZkhwL0MxUGpxcWFP?=
 =?utf-8?B?cFFCYUlLVlJ4Zy9yM0lKRDYxVUZvNUVUbjg5ckVVdUMrNmM5OXpqWFp6akMw?=
 =?utf-8?B?cERjaHBjeGJKWVhmTVcvZnBoeTU3QzUrSXdub3RIajhEOFpJaTcyR29MWmxE?=
 =?utf-8?B?enJFYWYzTU9lSDVubDAxaUZnVVl5ekJnUzBzOXEvU3ZQQXFKdGxLTHo2NEgv?=
 =?utf-8?B?R3RaUjd1WE15eFo5SjQyMm43OElFRU1vNFd6MVhtRzFKQkFpR1A2dXg5cU1s?=
 =?utf-8?B?VHl1cEYwMlJOM3ozQ2c2Zkd1QkxzZ3JweG1CN1JuQkc2K0hRWldSb0VnL3lC?=
 =?utf-8?B?U0twRmhaRGZRMHRBdXpsSEFOajZ5cDBIektROERpOGpjL0pjMnkxbVB3ZjU0?=
 =?utf-8?Q?CW17RNjV5J7mCzAk=3D?=
X-Exchange-RoutingPolicyChecked: ncCm4e30dnfrIvVxiz0euAOC4xrhFGpPVW03otZLd9QQAjyxBF0sEJzP7JsT+HxuDcsbfI0PDYzcRdbYGnG2191p5IXREdPblh79dmQHmVzDLIvJeTmVl95Y+l1yzWmGXkXbiK53S5I22+mJDUyJAfCm4rjhASppTXynXQPJ/PVIBTdCT1u6b8QLKgHVhqXeuAEijhddsaPaWMpgjv5J3EL1qNj0wx6gLNpsMAx2l9guHl/0eJlT4efhb8x0++SE0ZHXVtJPVuXRmKj4kqGNm4CfsU+sNVB0alVYk/it5MJJdfxAR3DlfKvV2zks4GSub5hTbgX3yybeBB4zR4LU4Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: da83c2bd-f3c0-434e-131f-08df34d82bad
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7862.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 09:45:16.1814 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kTeFQ+EaoUNvoaTnKgRXSnkQzuKKFCwpCYKqlHe+P0Nd3AIkFZRIAMJYSJFGIcNACba2txjEZBI67Jp7m+XTrUrU4RTVI1/P/whYWc/4Re4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB277206
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


On 26-10-2026 11:35 am, Riana Tauro wrote:
> Move the USP lookup logic out of RAS code and into the PCI
nit: s/into the PCI layer/into the xe driver's PCI layer
> layer so it can be reused by other callers.
>
> No functional change.
>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pci.c | 23 +++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_pci.h |  1 +
>   drivers/gpu/drm/xe/xe_ras.c | 19 ++-----------------
>   3 files changed, 26 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 0c13eb901aa7..a9b8e65dff07 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -1521,6 +1521,29 @@ struct xe_device *xe_pci_to_pf_device(struct pci_dev *pdev)
>   	return to_xe_device(drm);
>   }
>   
> +/**
> + * xe_pci_get_usp_dev() - Get the upstream switch port device.
> + * @pdev: pci device of SGunit
> + *
> + * Device Hierarchy:
> + * Upstream Switch Port (USP) --> Virtual Switch Port (VSP) --> SGunit (GPU endpoint)
> + *
> + * The function traverses the PCI device hierarchy to find the upstream switch port
> + * device.
> + *
> + * Return: pointer to USP &pci_dev, NULL otherwise.
> + */
> +struct pci_dev *xe_pci_get_usp_dev(struct pci_dev *pdev)
> +{
> +	struct pci_dev *vsp;
> +
> +	vsp = pci_upstream_bridge(pdev);
> +	if (!vsp)
> +		return NULL;
> +
> +	return pci_upstream_bridge(vsp);
> +}
> +
>   int xe_register_pci_driver(void)
>   {
>   	return pci_register_driver(&xe_pci_driver);
> diff --git a/drivers/gpu/drm/xe/xe_pci.h b/drivers/gpu/drm/xe/xe_pci.h
> index 11bcc5fe2c5b..3dc3539c3970 100644
> --- a/drivers/gpu/drm/xe/xe_pci.h
> +++ b/drivers/gpu/drm/xe/xe_pci.h
> @@ -11,5 +11,6 @@ struct pci_dev;
>   int xe_register_pci_driver(void);
>   void xe_unregister_pci_driver(void);
>   struct xe_device *xe_pci_to_pf_device(struct pci_dev *pdev);
> +struct pci_dev *xe_pci_get_usp_dev(struct pci_dev *pdev);
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 2b1a7cb01b0d..a91c3d924e8c 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -10,6 +10,7 @@
>   #include "xe_device.h"
>   #include "xe_drm_ras.h"
>   #include "xe_log.h"
> +#include "xe_pci.h"
>   #include "xe_pm.h"
>   #include "xe_printk.h"
>   #include "xe_ras.h"
> @@ -462,22 +463,6 @@ static void get_offline_list(struct xe_device *xe)
>   			      &response, sizeof(response), &response.common, false);
>   }
>   
> -static struct pci_dev *find_usp_dev(struct pci_dev *pdev)
> -{
> -	struct pci_dev *vsp;
> -
> -	/*
> -	 * Device Hierarchy:
> -	 *
> -	 * Upstream Switch Port (USP) --> Virtual Switch Port (VSP) --> SGunit (GPU endpoint)
> -	 */
> -	vsp = pci_upstream_bridge(pdev);
> -	if (!vsp)
> -		return NULL;
> -
> -	return pci_upstream_bridge(vsp);
> -}
> -
>   static void ras_usp_aer_init(struct xe_device *xe)
>   {
>   	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> @@ -485,7 +470,7 @@ static void ras_usp_aer_init(struct xe_device *xe)
>   	u16 aer_cap;
>   	u32 status;
>   
> -	usp = find_usp_dev(pdev);
> +	usp = xe_pci_get_usp_dev(pdev);
>   	if (!usp)
>   		return;
>   

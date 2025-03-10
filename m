Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B12F2C282DE
	for <intel-xe@archiver.kernel.org>; Mon, 10 Mar 2025 05:46:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5361710E0BF;
	Mon, 10 Mar 2025 05:46:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j51hjna8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AAB410E0BF
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Mar 2025 05:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741585603; x=1773121603;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=F29N1YNbcCsIvZMYKXMRD0RDzs/3lMOzLDLGsUVE6Q8=;
 b=j51hjna8yhpHfjRC1q3kzP4y+ISwTe5Ne/BGkMOwCkBarfK8tKaQPf73
 nDaUuOeKxaA2QLerFBvbALrUAMaRxMNg2cDdbBh4Dzji+o5OQnRFisGVR
 F3RZ3oXsncjLYLk64Ve5JkLkHkpy37FmiR6uYhQH3S6Le9ePmeFsKiNjD
 eGQr00/sYkH56F7cz7eIoer4DUOfN3/RkAgMklAQHoC/fY112Lxfx1V5I
 mgrZm6zLmtmi2mQKLqyokt/KElp2+6q1BaYvQX1xEA9oPJJIeL4L64n4P
 ryyFhZVVggKc/bXrS8anQapbMrjiVfFBWtyeTo7/q7nhfVi7Cg8a7+Jbh g==;
X-CSE-ConnectionGUID: s2gjvOwnTmCck0WKI/AIQQ==
X-CSE-MsgGUID: ItaUecSWT+Ckn7La0J65KA==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="42756601"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; d="scan'208";a="42756601"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2025 22:46:42 -0700
X-CSE-ConnectionGUID: LaDuEKqhSlSh6JIMPDbxQQ==
X-CSE-MsgGUID: T1YXamt5REKQfNUNh+2IJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; d="scan'208";a="124054770"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Mar 2025 22:46:29 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 9 Mar 2025 22:46:28 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 9 Mar 2025 22:46:28 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 9 Mar 2025 22:46:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eAGQedCj8NZd9ID4JgZlQR9IwpPeCG2asNyz+Z5tIVHdA1oJcy6Qx3xmC40ipT6CzumjR2wiDnYf+ie+Umk/ieL03WUADBYX4nKkIcuSAKrIjfiHqJWVWRGQwpnYu4H336+QejJpWzVoySn49eWJL2h984is5xDUhorsc3IO+31OHEuxu2CRaqHtAWpxpQkHDP00mZp5iCKTeoKCa5PqiD0QWuv4WNUZjYb6ccnDX02hgr9ySP3gCfdhlKUUVcBh1wNWw5ActJ50PCIbJa4/MG13Epuxs1O4SOesa7lwsiTPZXzTEhsd9KlZIYENrrf+F8ACTBCkfUD7hTrJoF6u8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Lc+6jLtP+AYwfxxBy/71r5QHxmpoQyP6gcKpPuZDHc=;
 b=GPR/Dpryu5vPN4KLqEmNhpOTtk5ErGIWMKAVi5lu5vR1evC2oGHiM0ZsXdR90j6vP+deW8x89GD9oRqCGv9KGNGWwoYnitzWwnh5Ejd7kAYHS1N2Hrq/pfsBRa2FkrSbYdDSKyOlTwVRnKNfJd+z31TBMaSO70U5+LCBeLNiG8dra2ON7M+ipL+PrJWnOmLpSIuCpE08eO9S8UMpyKS0ZHggMurfrIYJqjFayZQRZFFDEWiacLjQWx4uU4m9JdxrNOWGVnVDQJlorg6gadr3IMK9N7j2rKJa4qNxEONVcz1ccHcIsFsLVZ126hE41f9/H+ROccDdFjxIlCOlqJN7Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CO1PR11MB4836.namprd11.prod.outlook.com (2603:10b6:303:9d::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.26; Mon, 10 Mar 2025 05:46:24 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 05:46:22 +0000
Message-ID: <698a48c6-502e-4b84-ab27-f2c2a053e71b@intel.com>
Date: Mon, 10 Mar 2025 11:16:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe: Add support for per-function engine activity
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <michal.wajdeczko@intel.com>,
 <vinay.belgaumkar@intel.com>
References: <20250304095743.3274062-1-riana.tauro@intel.com>
 <20250304095743.3274062-2-riana.tauro@intel.com>
 <Z8o23UNwOUaqarsH@orsosgc001>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <Z8o23UNwOUaqarsH@orsosgc001>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0015.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::7) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CO1PR11MB4836:EE_
X-MS-Office365-Filtering-Correlation-Id: 69831481-0748-4648-6a70-08dd5f96e39a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NC91UUt2Wi9BMGhHcTNYY2tmSERyZSttWnBsRnhGV1FRTU40M3lValdtWHE1?=
 =?utf-8?B?MXNHQ2xnT2l2M0FYU2lwaW1jVkZlbm9DOEJWSE1EU1RwZE5sRlA2KzIxYUtM?=
 =?utf-8?B?L0NWaytwZE9DQkZ3bzdjVjJrdzdBY1Z1S0hzdmdyelkzK1hSb0ROOFR5MEg4?=
 =?utf-8?B?Smx0ZmxoQ3U5bWVLRkE0QnZlTjlIUXdFdjJYajlxM1ZKVW1iM3FuUERPRW5Z?=
 =?utf-8?B?L1ZFTXRZUUZ6ZjRJNHkzRENlcmhkNFdOa3MwMjJMRUhIT1FkbUlsVFhZRjZq?=
 =?utf-8?B?dDMrNlVMNXI1NHhuOEFHQzlDejVxZVFNbnRyNzRqcjZHd2NOV1hzclBXMEpJ?=
 =?utf-8?B?czFxTEZkV0dRSzZwa1l4ZlJrZ0puN2RobHg4ZXVqMVl5NWpFcnpicm0rSUpI?=
 =?utf-8?B?TzJtZVpUblVlZ1FmaW9Gb1ArOGlmM3NuQVhGNkpaZ2RVbklwZW9UV3RBbjFj?=
 =?utf-8?B?S0Ywb3RoUkp0U1RNTXVLdHZBdVZIWFhzWURkSjJKSkw2b2JDSTdhMlAxaTJG?=
 =?utf-8?B?STV4bElYN0tWZGw3MnFreE8xY01mQVVjcTNxc01jRm5UV3FDYUx2YTFzZ3Z1?=
 =?utf-8?B?TnpldWlPMW8wTGZlRCtlQlFsckFmbUdleXIwSXk3bTJwQXNYVmhJbnRPeXBq?=
 =?utf-8?B?VWkxZTEwTk1zSkZ4ZUF5dlJKYzZnRC9jdmlhTjFtcFE0cTNNMktlNUxUWWI2?=
 =?utf-8?B?QnVnd0tUNkJJSFBCMUw3NTZHR1A4TUdnK1o2NlQvZk40WVNmcGZsaEdlZ3VB?=
 =?utf-8?B?QllmQUltNStYOTU0ampKZTBvU29sa2NNSVVNQWFVdFhaYWRmTkJvMmZVVUdY?=
 =?utf-8?B?SzBiZnhXeWlIV0JiUnJSQzFQNUZ3dTRDRFNBaFB0WmVhSnVmVGRtYjErTXlU?=
 =?utf-8?B?SXNvbFdmMnVuSW9ka2xEcnJiZG1jb1FhMHNydlIxYUptQVNsajk1aGFyQm5I?=
 =?utf-8?B?MEZ6V0hrVEJUN0hZQThSbkhteXBZaXlXY2ZzclBxRlVSV3ZHUzVmK0E3dHg0?=
 =?utf-8?B?bjkwN2JvWmppRktEbS9jdlh0TW1mSmtNYXJ4NGlleFNEZ3RHQmNMclpzNFE1?=
 =?utf-8?B?NHdyOEFKTUhRL210aHJmVFk4Q0V0TlZoVjRwZkFobzg1NCtKa1ZNWUtNQ04x?=
 =?utf-8?B?MHVZVmM0dEIyMjdWaUx1WXBlNnI0akxudzdLR3c0eCtSY3hmNjJNWDNqVENz?=
 =?utf-8?B?WElQeWphZkhmcGlYekt4MGYyVHlrZHZRZnBiNC9MUXI2ZktFbHdJMEpQcU1s?=
 =?utf-8?B?S0EzcGV5a2xpanpleXIzTWpRdXBzSTZEeDFTRmRZNXgyb1ZDc293UlVDU0VH?=
 =?utf-8?B?QzB3SlB5d2lzTVhEaUxJSkJmR3VyWnNraVRFSW1NS2NzVitzRVhJQ3JqM2Ja?=
 =?utf-8?B?WnZzQU9DRUp2Ni9Gc0RCbE1BeG1oYlNiY3Rvam1kMVpaeVhtT1UwQURPemh2?=
 =?utf-8?B?Q2lKTjN6czJCQmYwRjVLbVdRdlZUcmQxOXV5WHFJVlRlVWRnQWRkbDVqWHVK?=
 =?utf-8?B?SExTTEdKbFVzdlEzblR2S1drTnl0S3BKTkd2MnQ4d3BQQzU4MmVRcnN2TTUy?=
 =?utf-8?B?bHlhYzE0OGJGVEE4c1ZqaWZrblhtRitpSkZqUTFzL3pOTkQ1di9MUmtQZ2Vy?=
 =?utf-8?B?K2dFSTdIdUEyTCt3bDhlWURGTkttMWxrcS91d0paSDJUZUt5M2JrZTJhUFhU?=
 =?utf-8?B?SHZRTFVQT1FvUXJpcHdPSlFBZDJYSE5udzUrcjFCQXdDMStCeXc2eG54QWp6?=
 =?utf-8?B?UDdwcjZnMXZKWElnVmtDUCs5S2pqQjNYYXRSdUoxQlhTVnlWS0MzZUhjMHhh?=
 =?utf-8?B?bWdONUh0WDZlWE9lQzVuWGsvamprb2ZqVDhycVBvaTR6RlNNMU5mWjVHMGNP?=
 =?utf-8?Q?vTaPWzO/+vUMO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWRmamxveVh2Ty9oV1Q1bUcwVm5ING1uSTBrbFJIWUlsVVJLOEJwMVdHK3ZE?=
 =?utf-8?B?MFYzYkQ1Qy80bUNRNWszMEo3YU4yK25pQ2RHMjZhZmhPUDhuWmxOanVVNWtS?=
 =?utf-8?B?ZDZzWHNiZHBSdFh0ekQvT29KNG84cEx0TlpSbGRUNmxqR3JhOGRwM2hyMVZu?=
 =?utf-8?B?bWRrYXpHZVlmZ091R0ZXenBvdmhoWmRNeEt1ck5qcmJLU2JPRTBnUVFoclVK?=
 =?utf-8?B?OEFsZTlqcmYvOVJUdWpsTno5YnpEYjFaRXhXVTRnQjlyckRxbjJFQmNDNjAw?=
 =?utf-8?B?elFFQ3VXakM1c1RlSWE4QWhUQWlBU1orb25PQUdtVTk3eWZVMHBGTXdUZkt6?=
 =?utf-8?B?Z200R3VhTTVZODc2bnRZR0RzcjUrdlJOZlhVNS9udW5wME9HNzlDSTNwdzRr?=
 =?utf-8?B?L0U1R1VZQ1p5VUFUSGpZWFRQTzdYZnZobFNxR0tqL0o4ZWJmK1NiaHJCSitx?=
 =?utf-8?B?ZjlhM1FLVUt0OGp1ZG5MbXJOWXpLUll6b3Bpa3NSeWo2NFRDSTdKRXdkSmZR?=
 =?utf-8?B?eEJrTFJwWXRFWGlBK1kwSW5IWE9nUVE1bEcrUXZHa2RMRTA3TWJ0YzNUWFpG?=
 =?utf-8?B?VlZxRjUrVmdjaVVFVHpQN3RBVUZzNHRzVk5aVW5KZzBPWWFKeXNlZTJuMVJF?=
 =?utf-8?B?dmU2VCs2cS9YR1FyZmczYjV3dkthbUp0YmljekxFaGg1dXlKUGx0OHJ3YVY5?=
 =?utf-8?B?NWE0emtkTzRYV2t5dDFWS2owekNMbDVTc3BSVkVFaitEUk1ySHJBZnZFSEt2?=
 =?utf-8?B?SS9zSk5KemEvUXRsMFN6REFjVDJmSTZXMUxTOEV4QXVFYWNxRlhZQ2ZVL2hT?=
 =?utf-8?B?ekhTb3BrdlNRQ2NHSndJakNkVGR2STkweTZ2alpPVy85V0syaGVqOTJaOFNv?=
 =?utf-8?B?QmZZL2RqbTJwTnlnQTdjV2VTbU5ZR3hiS1ROWklMSzRBUjVMVHBML3hYMmFO?=
 =?utf-8?B?bTVvcWQ1UVVWQ3VzeEkvVTIwSGVpcExzMUtQS1NCRzlQOVBwY1ovR2ZtTDY5?=
 =?utf-8?B?dmJURzY5OTZlV0RKb2pMeFY3OE5jOXovc21VMkFENFp2V25KNmhIcjRBeU1r?=
 =?utf-8?B?SFVFVDFNbmErZW9HcHJmYTJGS0VCTkExV3hNaHhtRzYzemlxVUNYS2ZxZkRE?=
 =?utf-8?B?aURyTVlqbnVrWjNobXRMT212V200ZHRnZm54bzVGemVHRjg0Sjg1eXZBcjlE?=
 =?utf-8?B?THBDVVZ1SEhPRW92VXhRTlNpeTRSdEVNKy9FWWEzSzcrR3BKL2xweURVZVJR?=
 =?utf-8?B?UEx5cWVDWEQ2OEI5d3B4R1FxYVEyNDdGTE1SZWM2aVdBa1N2TVBKY1phTmxY?=
 =?utf-8?B?aVRQNU54K08vWm00VnRkaitkWkpZOTZJVzFzWndibk9LRHlEV3hpcDFVQWZJ?=
 =?utf-8?B?ODNubUNaTm01RWJoQVRpRGZMYU56cnUvZUNKZlNxQkNmcUovRWtpTEFTUGFH?=
 =?utf-8?B?U2hwRnNJcVFHOUlKTThYVWdHWWVDNzRJNkk3Q2E3WnlNNlJSYWRzQnZnWmxS?=
 =?utf-8?B?ZkpiR3pXNkVWbEp1QjNrN1pBL2J0Kzg1OHB4ZEdibDNIbHU4MFJ0OWpCSDZN?=
 =?utf-8?B?eGdCU0l2SFQ3WVRTRFA1QmpWSHZ1TUtPcDFGdW9ZdlVBTllxczc2elhBcWVB?=
 =?utf-8?B?WnVxUERyd29DWWpxMXg3RDA3ZVJaWEY1SGxyNklwYmhDZmVMSjErZC90Vkdz?=
 =?utf-8?B?WGVyVlNNK3ovWmNuWUxGblhHTTl0bkx0Vm1CZTV0UDM5YVBMeDNOaU9wTEll?=
 =?utf-8?B?THBkLzZidDJ4VnZ4azFhT2IvSnc4VVdFQk82OHZybDNKa3BweUE0UnRXNDF5?=
 =?utf-8?B?VWhDMDBlUTNvMHRJODFnNU1vc2FsRzBTMkR2YVIzNklWS3duRlNOd0ZWbGh6?=
 =?utf-8?B?aEgvbnFmQTB2ZFFvblhOM2I1STIrNlVQNVNFdzFobnBiWm16aGFYSThqeVUy?=
 =?utf-8?B?TTBmazlzZzRxemxYQUZoZzMwdFEzNEp5Y1NaWXozSnpEekV4M0hwZXgwTWpY?=
 =?utf-8?B?VStLTHNmL1FMam1nb1J0RTU3TjJMRWNmamtDY2RiY1FOUWNsSlVid2hES0Jw?=
 =?utf-8?B?a1FVV0NQTUpNT0JjRFZqZnZ3T1V1Q3VMam5UM0t5UTFqeHlHeHJyd0FYcEZB?=
 =?utf-8?Q?8ZPm/ozClNL5R3vJGTOzFjCSF?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 69831481-0748-4648-6a70-08dd5f96e39a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 05:46:22.6635 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h0LCkV4mXpOINDZagTlNoUWXV6EZY5hLD8KlWmLUnvE4XOGTEemdnyxkSlrddptepxz6qp+cRn8Y5R+0Pk7c8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4836
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


On 3/7/2025 5:29 AM, Umesh Nerlige Ramappa wrote:
> On Tue, Mar 04, 2025 at 03:27:41PM +0530, Riana Tauro wrote:
>> Add support for function level engine activity stats.
>> Engine activity stats are enabled when VF's are enabled
>>
>> v2: remove unnecessary initialization
>>    move offset to improve code readability (Umesh)
>>    remove global for function engine activity (Lucas)
>>
>> v3: fix commit message (Michal)
>>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> drivers/gpu/drm/xe/abi/guc_actions_abi.h      |   1 +
>> drivers/gpu/drm/xe/xe_guc_engine_activity.c   | 200 +++++++++++++++---
>> drivers/gpu/drm/xe/xe_guc_engine_activity.h   |   7 +-
>> .../gpu/drm/xe/xe_guc_engine_activity_types.h |   8 +-
>> drivers/gpu/drm/xe/xe_pmu.c                   |   5 +-
>> 5 files changed, 188 insertions(+), 33 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/ 
>> drm/xe/abi/guc_actions_abi.h
>> index ec516e838ee8..448afb86e05c 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> @@ -141,6 +141,7 @@ enum xe_guc_action {
>>     XE_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
>>     XE_GUC_ACTION_SET_ENG_UTIL_BUFF = 0x550A,
>>     XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER = 0x550C,
>> +    XE_GUC_ACTION_SET_FUNCTION_ENGINE_ACTIVITY_BUFFER = 0x550D,
>>     XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR = 0x6000,
>>     XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC = 0x6002,
>>     XE_GUC_ACTION_PAGE_FAULT_RES_DESC = 0x6003,
>> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c b/drivers/ 
>> gpu/drm/xe/xe_guc_engine_activity.c
>> index 2a457dcf31d5..37edc0414231 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>> @@ -17,36 +17,61 @@
>> #include "xe_hw_engine.h"
>> #include "xe_map.h"
>> #include "xe_mmio.h"
>> +#include "xe_sriov_pf_helpers.h"
>> #include "xe_trace_guc.h"
>>
>> #define TOTAL_QUANTA 0x8000
>>
>> -static struct iosys_map engine_activity_map(struct xe_guc *guc, 
>> struct xe_hw_engine *hwe)
>> +static struct iosys_map engine_activity_map(struct xe_guc *guc, 
>> struct xe_hw_engine *hwe,
>> +                        unsigned int index)
>> {
>>     struct xe_guc_engine_activity *engine_activity = &guc- 
>> >engine_activity;
>> -    struct engine_activity_buffer *buffer = &engine_activity- 
>> >device_buffer;
>> +    struct engine_activity_buffer *buffer;
>>     u16 guc_class = xe_engine_class_to_guc_class(hwe->class);
>>     size_t offset;
>>
>> -    offset = offsetof(struct guc_engine_activity_data,
>> +    if (engine_activity->num_functions) {
>> +        buffer = &engine_activity->function_buffer;
>> +        offset = sizeof(struct guc_engine_activity_data) * index;
>> +    } else {
>> +        buffer = &engine_activity->device_buffer;
>> +        offset = 0;
>> +    }
>> +
>> +    offset += offsetof(struct guc_engine_activity_data,
>>               engine_activity[guc_class][hwe->logical_instance]);
>>
>>     return IOSYS_MAP_INIT_OFFSET(&buffer->activity_bo->vmap, offset);
>> }
>>
>> -static struct iosys_map engine_metadata_map(struct xe_guc *guc)
>> +static struct iosys_map engine_metadata_map(struct xe_guc *guc,
>> +                        unsigned int index)
>> {
>>     struct xe_guc_engine_activity *engine_activity = &guc- 
>> >engine_activity;
>> -    struct engine_activity_buffer *buffer = &engine_activity- 
>> >device_buffer;
>> +    struct engine_activity_buffer *buffer;
>> +    size_t offset;
>>
>> -    return buffer->metadata_bo->vmap;
>> +    if (engine_activity->num_functions) {
>> +        buffer = &engine_activity->function_buffer;
>> +        offset = sizeof(struct guc_engine_activity_metadata) * index;
>> +    } else {
>> +        buffer = &engine_activity->device_buffer;
>> +        offset = 0;
>> +    }
>> +
>> +    return IOSYS_MAP_INIT_OFFSET(&buffer->metadata_bo->vmap, offset);
>> }
>>
>> static int allocate_engine_activity_group(struct xe_guc *guc)
>> {
>>     struct xe_guc_engine_activity *engine_activity = &guc- 
>> >engine_activity;
>>     struct xe_device *xe = guc_to_xe(guc);
>> -    u32 num_activity_group = 1; /* Will be modified for VF */
>> +    u32 num_activity_group;
>> +
>> +    /*
>> +     * An additional activity group is allocated for PF
>> +     */
>> +    num_activity_group = IS_SRIOV_PF(xe) ? 
>> xe_sriov_pf_get_totalvfs(xe) + 1 : 1;
>>
>>     engine_activity->eag  = drmm_kcalloc(&xe->drm, num_activity_group,
>>                          sizeof(struct engine_activity_group), 
>> GFP_KERNEL);
>> @@ -60,10 +85,11 @@ static int allocate_engine_activity_group(struct 
>> xe_guc *guc)
>> }
>>
>> static int allocate_engine_activity_buffers(struct xe_guc *guc,
>> -                        struct engine_activity_buffer *buffer)
>> +                        struct engine_activity_buffer *buffer,
>> +                        int count)
>> {
>> -    u32 metadata_size = sizeof(struct guc_engine_activity_metadata);
>> -    u32 size = sizeof(struct guc_engine_activity_data);
>> +    u32 metadata_size = sizeof(struct guc_engine_activity_metadata) * 
>> count;
>> +    u32 size = sizeof(struct guc_engine_activity_data) * count;
>>     struct xe_gt *gt = guc_to_gt(guc);
>>     struct xe_tile *tile = gt_to_tile(gt);
>>     struct xe_bo *bo, *metadata_bo;
>> @@ -118,10 +144,11 @@ static bool is_engine_activity_supported(struct 
>> xe_guc *guc)
>>     return true;
>> }
>>
>> -static struct engine_activity *hw_engine_to_engine_activity(struct 
>> xe_hw_engine *hwe)
>> +static struct engine_activity *hw_engine_to_engine_activity(struct 
>> xe_hw_engine *hwe,
>> +                                unsigned int index)
>> {
>>     struct xe_guc *guc = &hwe->gt->uc.guc;
>> -    struct engine_activity_group *eag = &guc->engine_activity.eag[0];
>> +    struct engine_activity_group *eag = &guc- 
>> >engine_activity.eag[index];
>>     u16 guc_class = xe_engine_class_to_guc_class(hwe->class);
>>
>>     return &eag->engine[guc_class][hwe->logical_instance];
>> @@ -138,9 +165,10 @@ static u64 cpu_ns_to_guc_tsc_tick(ktime_t ns, u32 
>> freq)
>> #define read_metadata_record(xe_, map_, field_) \
>>     xe_map_rd_field(xe_, map_, 0, struct guc_engine_activity_metadata, 
>> field_)
>>
>> -static u64 get_engine_active_ticks(struct xe_guc *guc, struct 
>> xe_hw_engine *hwe)
>> +static u64 get_engine_active_ticks(struct xe_guc *guc, struct 
>> xe_hw_engine *hwe,
>> +                   unsigned int index)
>> {
>> -    struct engine_activity *ea = hw_engine_to_engine_activity(hwe);
>> +    struct engine_activity *ea = hw_engine_to_engine_activity(hwe, 
>> index);
>>     struct guc_engine_activity *cached_activity = &ea->activity;
>>     struct guc_engine_activity_metadata *cached_metadata = &ea->metadata;
>>     struct xe_guc_engine_activity *engine_activity = &guc- 
>> >engine_activity;
>> @@ -151,8 +179,8 @@ static u64 get_engine_active_ticks(struct xe_guc 
>> *guc, struct xe_hw_engine *hwe)
>>     u64 active_ticks, gpm_ts;
>>     u16 change_num;
>>
>> -    activity_map = engine_activity_map(guc, hwe);
>> -    metadata_map = engine_metadata_map(guc);
>> +    activity_map = engine_activity_map(guc, hwe, index);
>> +    metadata_map = engine_metadata_map(guc, index);
>>     global_change_num = read_metadata_record(xe, &metadata_map, 
>> global_change_num);
>>
>>     /* GuC has not initialized activity data yet, return 0 */
>> @@ -194,9 +222,9 @@ static u64 get_engine_active_ticks(struct xe_guc 
>> *guc, struct xe_hw_engine *hwe)
>>     return ea->total + ea->active;
>> }
>>
>> -static u64 get_engine_total_ticks(struct xe_guc *guc, struct 
>> xe_hw_engine *hwe)
>> +static u64 get_engine_total_ticks(struct xe_guc *guc, struct 
>> xe_hw_engine *hwe, unsigned int index)
>> {
>> -    struct engine_activity *ea = hw_engine_to_engine_activity(hwe);
>> +    struct engine_activity *ea = hw_engine_to_engine_activity(hwe, 
>> index);
>>     struct guc_engine_activity_metadata *cached_metadata = &ea->metadata;
>>     struct guc_engine_activity *cached_activity = &ea->activity;
>>     struct iosys_map activity_map, metadata_map;
>> @@ -205,8 +233,8 @@ static u64 get_engine_total_ticks(struct xe_guc 
>> *guc, struct xe_hw_engine *hwe)
>>     u64 numerator;
>>     u16 quanta_ratio;
>>
>> -    activity_map = engine_activity_map(guc, hwe);
>> -    metadata_map = engine_metadata_map(guc);
>> +    activity_map = engine_activity_map(guc, hwe, index);
>> +    metadata_map = engine_metadata_map(guc, index);
>>
>>     if (!cached_metadata->guc_tsc_frequency_hz)
>>         cached_metadata->guc_tsc_frequency_hz = 
>> read_metadata_record(xe, &metadata_map,
>> @@ -245,10 +273,35 @@ static int enable_engine_activity_stats(struct 
>> xe_guc *guc)
>>     return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
>> }
>>
>> -static void engine_activity_set_cpu_ts(struct xe_guc *guc)
>> +static int enable_function_engine_activity_stats(struct xe_guc *guc, 
>> bool enable)
>> {
>>     struct xe_guc_engine_activity *engine_activity = &guc- 
>> >engine_activity;
>> -    struct engine_activity_group *eag = &engine_activity->eag[0];
>> +    u32 metadata_ggtt_addr = 0, ggtt_addr = 0, num_functions = 0;
>> +    struct engine_activity_buffer *buffer = &engine_activity- 
>> >function_buffer;
>> +    u32 action[6];
>> +    int len = 0;
>> +
>> +    if (enable) {
>> +        metadata_ggtt_addr = xe_bo_ggtt_addr(buffer->metadata_bo);
>> +        ggtt_addr = xe_bo_ggtt_addr(buffer->activity_bo);
>> +        num_functions = engine_activity->num_functions;
>> +    }
>> +
>> +    action[len++] = XE_GUC_ACTION_SET_FUNCTION_ENGINE_ACTIVITY_BUFFER;
>> +    action[len++] = num_functions;
>> +    action[len++] = metadata_ggtt_addr;
>> +    action[len++] = 0;
>> +    action[len++] = ggtt_addr;
>> +    action[len++] = 0;
>> +
>> +    /* Blocking here to ensure the buffers are ready before reading 
>> them */
>> +    return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
>> +}
>> +
>> +static void engine_activity_set_cpu_ts(struct xe_guc *guc, unsigned 
>> int index)
>> +{
>> +    struct xe_guc_engine_activity *engine_activity = &guc- 
>> >engine_activity;
>> +    struct engine_activity_group *eag = &engine_activity->eag[index];
>>     int i, j;
>>
>>     for (i = 0; i < GUC_MAX_ENGINE_CLASSES; i++)
>> @@ -265,34 +318,106 @@ static u32 gpm_timestamp_shift(struct xe_gt *gt)
>>     return 3 - REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, reg);
>> }
>>
>> +static bool is_function_valid(struct xe_guc *guc, unsigned int fn_id)
>> +{
>> +    struct xe_device *xe = guc_to_xe(guc);
>> +    struct xe_guc_engine_activity *engine_activity = &guc- 
>> >engine_activity;
>> +
>> +    if (!IS_SRIOV_PF(xe) && fn_id)
>> +        return false;
>> +
>> +    if (engine_activity->num_functions && fn_id >= engine_activity- 
>> >num_functions)
>> +        return false;
>> +
>> +    return true;
>> +}
>> +
>> +static int engine_activity_disable_function_stats(struct xe_guc *guc, 
>> bool enable)
> 
> enable is always false here so you can just drop the additional function 
> parameter and just use false below instead.

Sure, will fix this
> 
>> +{
>> +    struct xe_guc_engine_activity *engine_activity = &guc- 
>> >engine_activity;
>> +    struct engine_activity_buffer *buffer = &engine_activity- 
>> >function_buffer;
>> +    int ret;
>> +
>> +    if (!engine_activity->num_functions)
>> +        return 0;
>> +
>> +    ret = enable_function_engine_activity_stats(guc, enable);
>> +    if (ret)
>> +        return ret;
>> +
>> +    free_engine_activity_buffers(buffer);
>> +    engine_activity->num_functions = 0;
>> +
>> +    return 0;
>> +}
>> +
>> +static int engine_activity_enable_function_stats(struct xe_guc *guc, 
>> int num_vfs, bool enable)
>> +{
> 
> Likewise enable is always true here.
> 
>> +    struct xe_guc_engine_activity *engine_activity = &guc- 
>> >engine_activity;
>> +    struct engine_activity_buffer *buffer = &engine_activity- 
>> >function_buffer;
>> +    int ret, i;
>> +
>> +    if (!num_vfs)
>> +        return 0;
>> +
>> +    /* This includes 1 PF and num_vfs */
>> +    engine_activity->num_functions = num_vfs + 1;
>> +
>> +    ret = allocate_engine_activity_buffers(guc, buffer, 
>> engine_activity->num_functions);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = enable_function_engine_activity_stats(guc, enable);
>> +    if (ret) {
>> +        free_engine_activity_buffers(buffer);
>> +        engine_activity->num_functions = 0;
>> +        return ret;
>> +    }
>> +
>> +    for (i = 0; i < engine_activity->num_functions; i++)
>> +        engine_activity_set_cpu_ts(guc, i + 1);
>> +
>> +    return 0;
>> +}
>> +
>> /**
>>  * xe_guc_engine_activity_active_ticks - Get engine active ticks
>>  * @guc: The GuC object
>>  * @hwe: The hw_engine object
>> + * @fn_id: function id to report on
>>  *
>>  * Return: accumulated ticks @hwe was active since engine activity 
>> stats were enabled.
>>  */
>> -u64 xe_guc_engine_activity_active_ticks(struct xe_guc *guc, struct 
>> xe_hw_engine *hwe)
>> +u64 xe_guc_engine_activity_active_ticks(struct xe_guc *guc, struct 
>> xe_hw_engine *hwe,
>> +                    unsigned int fn_id)
>> {
>>     if (!xe_guc_engine_activity_supported(guc))
>>         return 0;
>>
>> -    return get_engine_active_ticks(guc, hwe);
>> +    if (!is_function_valid(guc, fn_id))
>> +        return 0;
>> +
>> +    return get_engine_active_ticks(guc, hwe, fn_id);
>> }
>>
>> /**
>>  * xe_guc_engine_activity_total_ticks - Get engine total ticks
>>  * @guc: The GuC object
>>  * @hwe: The hw_engine object
>> + * @fn_id: function id to report on
>>  *
>>  * Return: accumulated quanta of ticks allocated for the engine
>>  */
>> -u64 xe_guc_engine_activity_total_ticks(struct xe_guc *guc, struct 
>> xe_hw_engine *hwe)
>> +u64 xe_guc_engine_activity_total_ticks(struct xe_guc *guc, struct 
>> xe_hw_engine *hwe,
>> +                       unsigned int fn_id)
>> {
>>     if (!xe_guc_engine_activity_supported(guc))
>>         return 0;
>>
>> -    return get_engine_total_ticks(guc, hwe);
>> +    if (!is_function_valid(guc, fn_id))
>> +        return 0;
>> +
>> +    return get_engine_total_ticks(guc, hwe, fn_id);
>> }
>>
>> /**
>> @@ -310,6 +435,25 @@ bool xe_guc_engine_activity_supported(struct 
>> xe_guc *guc)
>>     return engine_activity->supported;
>> }
>>
>> +/**
>> + * xe_guc_engine_activity_function_stats - Enable/Disable per- 
>> function engine activity stats
>> + * @guc: The GuC object
>> + * @num_vfs: number of vfs
>> + * @enable: true to enable, false otherwise
>> + *
>> + * Return: 0 on success, negative error code otherwise
>> + */
>> +int xe_guc_engine_activity_function_stats(struct xe_guc *guc, int 
>> num_vfs, bool enable)
>> +{
>> +    if (!xe_guc_engine_activity_supported(guc))
>> +        return 0;
>> +
>> +    if (enable)
>> +        return engine_activity_enable_function_stats(guc, num_vfs, 
>> enable);
>> +
>> +    return engine_activity_disable_function_stats(guc, enable);
>> +}
>> +
>> /**
>>  * xe_guc_engine_activity_enable_stats - Enable engine activity stats
>>  * @guc: The GuC object
>> @@ -327,7 +471,7 @@ void xe_guc_engine_activity_enable_stats(struct 
>> xe_guc *guc)
>>     if (ret)
>>         xe_gt_err(guc_to_gt(guc), "failed to enable activity 
>> stats%d\n", ret);
>>     else
>> -        engine_activity_set_cpu_ts(guc);
>> +        engine_activity_set_cpu_ts(guc, 0);
>> }
>>
>> static void engine_activity_fini(void *arg)
>> @@ -360,7 +504,7 @@ int xe_guc_engine_activity_init(struct xe_guc *guc)
>>         return ret;
>>     }
>>
>> -    ret = allocate_engine_activity_buffers(guc, &engine_activity- 
>> >device_buffer);
>> +    ret = allocate_engine_activity_buffers(guc, &engine_activity- 
>> >device_buffer, 1);
>>     if (ret) {
>>         xe_gt_err(gt, "failed to allocate engine activity buffers 
>> (%pe)\n", ERR_PTR(ret));
>>         return ret;
>> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.h b/drivers/ 
>> gpu/drm/xe/xe_guc_engine_activity.h
>> index a042d4cb404c..b32926c2d208 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_engine_activity.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.h
>> @@ -14,6 +14,9 @@ struct xe_guc;
>> int xe_guc_engine_activity_init(struct xe_guc *guc);
>> bool xe_guc_engine_activity_supported(struct xe_guc *guc);
>> void xe_guc_engine_activity_enable_stats(struct xe_guc *guc);
>> -u64 xe_guc_engine_activity_active_ticks(struct xe_guc *guc, struct 
>> xe_hw_engine *hwe);
>> -u64 xe_guc_engine_activity_total_ticks(struct xe_guc *guc, struct 
>> xe_hw_engine *hwe);
>> +int xe_guc_engine_activity_function_stats(struct xe_guc *guc, int 
>> num_vfs, bool enable);
>> +u64 xe_guc_engine_activity_active_ticks(struct xe_guc *guc, struct 
>> xe_hw_engine *hwe,
>> +                    unsigned int fn_id);
>> +u64 xe_guc_engine_activity_total_ticks(struct xe_guc *guc, struct 
>> xe_hw_engine *hwe,
>> +                       unsigned int fn_id);
>> #endif
>> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h b/ 
>> drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
>> index 5cdd034b6b70..bab0ae6cae00 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
>> @@ -79,14 +79,20 @@ struct xe_guc_engine_activity {
>>     /** @num_activity_group: number of activity groups */
>>     u32 num_activity_group;
>>
>> +    /** @num_functions: number of functions */
>> +    u32 num_functions;
>> +
>>     /** @supported: indicates support for engine activity stats */
>>     bool supported;
>>
>> -    /** @eag: holds the device level engine activity data */
>> +    /** @eag: array with entries to hold engine activity stats of 
>> global, PF and VF's */
> 
> If I understand this correctly, now eag will either hold global OR hold 
> PF and VF. You might want to describe it here.
> 
> /** @eag: holds the device level engine activity data in native mode. In 
>   * SRIOV mode, it points to an array with entries to hold engine  * 
> activity stats of PF and VFs.
>   */
yeah should be or. Missed updating the doc after the code change.

Thank you, will fix this.

Thanks
Riana
> 
> Thanks,
> Umesh
> 
>>     struct engine_activity_group *eag;
>>
>>     /** @device_buffer: buffer object for global engine activity */
>>     struct engine_activity_buffer device_buffer;
>> +
>> +    /** @function_buffer: buffer object for per-function engine 
>> activity */
>> +    struct engine_activity_buffer function_buffer;
>> };
>> #endif
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>> index 4f62a6e515d6..f8f6ebb7c9c6 100644
>> --- a/drivers/gpu/drm/xe/xe_pmu.c
>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>> @@ -245,10 +245,11 @@ static u64 read_engine_events(struct xe_gt *gt, 
>> struct perf_event *event)
>>     u64 val = 0;
>>
>>     hwe = event_to_hwe(event);
>> +
>>     if (config_to_event_id(event->attr.config) == 
>> XE_PMU_EVENT_ENGINE_ACTIVE_TICKS)
>> -        val = xe_guc_engine_activity_active_ticks(&gt->uc.guc, hwe);
>> +        val = xe_guc_engine_activity_active_ticks(&gt->uc.guc, hwe, 0);
>>     else
>> -        val = xe_guc_engine_activity_total_ticks(&gt->uc.guc, hwe);
>> +        val = xe_guc_engine_activity_total_ticks(&gt->uc.guc, hwe, 0);
>>
>>     return val;
>> }
>> -- 
>> 2.47.1
>>


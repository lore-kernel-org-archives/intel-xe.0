Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B23C5C27C4F
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 03:21:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F01710E1AC;
	Wed, 26 Jun 2024 03:21:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GPKRMHv4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F89310E1AC
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jun 2024 03:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719372102; x=1750908102;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XuvhUf5in7L3+2m8Bw8UD9kcgOeUBnUo2SGHjU3Jrm4=;
 b=GPKRMHv4PbuObDbpIL/n3Har8lsIuewArMGumuEwJ9hexy7HvL1GAiEv
 XadW8oJujy9K5cL2V39mlQTG2IwM6IHmu2phyw3acBIAWuNXa/l2z8pN+
 +LoIrJ9ulpj0T7u8OlEKwesymAI0x3cppDw9CNTWN0HAUnhEy1pm28Qsr
 /8z0e2qniwWrITITQMvDcgeENewjuVRx6gCc8gRGD9N1AvPfRmNvqGH4I
 qJ9uZPzwa/P4cbZpZ6SWEVhCPOCC5JB0b0U2kH6kD9wvID7D7x4OpgEzL
 Ha0hlLeprs7yCktA8dNXUnxfr0AO7xvTRw6sNmThvexfseMlwYCbalOZ8 g==;
X-CSE-ConnectionGUID: Snh07dgUTXidGjkHQfzyZA==
X-CSE-MsgGUID: qy7kaisTTq+YO8dSuBriug==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16250598"
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; d="scan'208";a="16250598"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 20:21:41 -0700
X-CSE-ConnectionGUID: UlQPxQ0YTAKR1KZPJK/UXQ==
X-CSE-MsgGUID: tSPz/kL1QZuYbD+WypKQIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; d="scan'208";a="48236049"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jun 2024 20:21:40 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 20:21:41 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 20:21:40 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 25 Jun 2024 20:21:40 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 25 Jun 2024 20:21:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GYFFeoS85o+J1W25bdaTKT8rDzTLzfnaUQ10f7yXRhWuoRIviUPFZ9KsDIMvSGlArOJ3sd7jGv2xFFfnagGONEudARvhrXXtxMxxiokyG9pzvbeTz3wpTt3EVRzwLGe9NfK/PR9wZgl82jgIz3Mll2mXAqwD38oO6SNcUtvDPvfOQqrrTfGvjwLUwpthgNKuXHja7vt3C1b7QE2POQwjezQMIw9KaMeIs7xlklhP7KiblPnlBu5bLDX7D/WbKhLSI3QiytbHDakAu+kzplT7ZHcaJIAzx5kOE2Bu+cFoN70jWCD3SqjAkc78IBMA0amyGHTcsMam8sp8kL50UmdpPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fMFjl52QKsrKHxZ8vB8NralnUts27Zi0+scgQcthBGU=;
 b=CUCo88V7NV6H7HjKOL8Qp47bJ3WPBAoY1YLXRUiIFKub17GvJRVB62Brialp+i8bO3olmZBGL94HelMU+0cjMMvk2MWTevcPxZEiR6FukvfJp52z/DOtDIU9Lr/7U4xt23KZYaXg8wgvhYZ1XSgrMy3d9qnopu/N4V05vFTx/5zygS6EUJNvjMfGF0ghz3QRsyyKukQmpqmCoshL2SJv4XUk4KK4cW0E//mz8hivhZp1fRm6uqf/BVM1gCdGdBP56N1Xdl4UFD3YKsXZf5WC1WioAtkw0IWYToMZgI+N1ti9eluTW67hWvMXhBtZGc6t32T5xzvloJxjEEyfYz2zLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DM6PR11MB4529.namprd11.prod.outlook.com (2603:10b6:5:2ae::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Wed, 26 Jun
 2024 03:21:38 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 03:21:38 +0000
Date: Tue, 25 Jun 2024 20:21:35 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <lucas.demarchi@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Record utilization before destroying the
 exec queue
Message-ID: <ZnuJP4HOMsY0ImvQ@orsosgc001>
References: <20240625165812.58411-1-umesh.nerlige.ramappa@intel.com>
 <20240625165812.58411-3-umesh.nerlige.ramappa@intel.com>
 <Znr9Mk8r1e2gvUja@DUT025-TGLU.fm.intel.com>
 <ZnsBLb8x/Ma+JIxl@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZnsBLb8x/Ma+JIxl@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: SJ0PR05CA0114.namprd05.prod.outlook.com
 (2603:10b6:a03:334::29) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DM6PR11MB4529:EE_
X-MS-Office365-Filtering-Correlation-Id: 06cbfa78-4a05-4fef-bad7-08dc958f172e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230038|1800799022|366014|376012;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bWo5cWN0aUZHQ1hjMWNsVjJqUVYwczJPUGU5Wk9uY2dLS1RKWDRDZXRkZy8w?=
 =?utf-8?B?SU5LOUY1THBDYlRjeEVuRFdXLzBCeUFLVCtGbTZiUmZ4dGJiKzFIV1NrVHhH?=
 =?utf-8?B?YXkwVC9OWmJSMndYd1ZoQ2luaVdBQjBKWUZnWFdCcGsxZTllbXVRRnU2dnly?=
 =?utf-8?B?M1NVTlNRYkxMa3BuaTFWWGloM3k4WUZ0R0tTNHBVZ3dKR3JhRlUvMGEzdlo4?=
 =?utf-8?B?WmlZdUpNejliNEdEUWVPRVJpaDVaUmVzeHEwRDBEMU8ybzRIQ1MvYU8yUWNn?=
 =?utf-8?B?QVNrMG13YmVBcEFiWCtySjhZY2RKV1BZaDF1d0tTTHVXZXhOakluYTUxeFV4?=
 =?utf-8?B?RTJiRGp6MjlIdGYzSkx6N2NsRnU3ZFJIbzdOanRQeXBMd2xEQmQ1c3ZERXdk?=
 =?utf-8?B?T3RGeTRFUTNZTEttZnQ3dVJobzJTZmRiVjZRb3ZsZml1aHZNNnVydDJaaWJn?=
 =?utf-8?B?THM0RG5zRHlOcVZwL3ZsdlRtTFhEQ1JFM0xuWmRSRFdKUkRVR3BnLytzMi9m?=
 =?utf-8?B?dUx1K3N6U0E1N25KU3RTNFdMbVNaVG1qMlhSM1FZb0ZvemJZcExQUlByT1Y0?=
 =?utf-8?B?bEkrN2VsVkJUa0duMGtRQmtCOVVlTHQzRUdOUE8yZTdiZVRNTzBLRStCVlJs?=
 =?utf-8?B?dyttTFNYZDNORlRjRXhLOHhDUlArcWJ4ZTVnaXNvYmxCd2NteFVUVlBuZXpS?=
 =?utf-8?B?TjZTSENBZnE2UmtBZHhNcVpMRXorT3ZNSXplTm9ZRlduK2I1bGl4RnZzdzNK?=
 =?utf-8?B?dkl6N09XSitGL1NqUzNhQ2NxalRXTGpuWmdTNTJrdk5hdHZ3aTd0Tis1czF5?=
 =?utf-8?B?U2NIZll6T2VUdmhoQnF6TEZjNTlmKzlNYXhqRm9maTFyMkRiVXRvZWZzb2J4?=
 =?utf-8?B?UElQYUtDZEMrS0NEc3l6czBHM0loRndsM2JsSGMzZTVBVGpQN0pwS0YwWnVm?=
 =?utf-8?B?SUtQbExsY05Zeko1N1JObG0xemYwMGN1NWFjdTlLWVljdWZRYUxCSmtLaWRT?=
 =?utf-8?B?MVdUaTI1TnpLa3ZsZUZYc3g5eWdHaHgyV2ZJMkpiN3Q0QWVhMUc3UnMxSmNH?=
 =?utf-8?B?dXI4S1NDOWlPRk5sbW5hR0l5OEZ0bVNVSjV5b0kxTUIwdmc0R2p4UEV2R1hZ?=
 =?utf-8?B?SUpRRnFUMkt0VDkwWXRnejI1UFNNYkY4d01TVWJZdm1RYktpazZqa0t6V1Fr?=
 =?utf-8?B?cmdhblQzTVZDY3RvbHdXaFpkTHFPdzE5aXFScnhhaU9GRDZjZmwxZFRmcmlh?=
 =?utf-8?B?RXJ3TFgzRDNCbzdPWEY1N1pXcFF1MExQZE9wMFJMdkxOd2t3YUhCNVQyT3BV?=
 =?utf-8?B?TXROTWJLYWI3OXRkSHBqR1lPWGtyQnZaQ2VYdEVzamhWMWoySklGYmhKLzJu?=
 =?utf-8?B?Z3V6K21HS2ZOSVdKZlRaS0V4ZGxvaEc5RXJWb0xrYTFLUUViRkxoeThiY3M4?=
 =?utf-8?B?dkpHcndRZmh1L05aUUJwRkZ2K1lhb2xJbEtoTm1iTWRhM0pUVi9KMHY0dG9X?=
 =?utf-8?B?YVgvVXRBVmQ2OEpOYzE4R3hFUHRDdCtkUVZrc3ZvTmd4eS91NXlsRTdQYzBz?=
 =?utf-8?B?WTY4dVp3ZENrdDl4U3RwcHJNSmlNWDVmYms5Z0RNTUc2RzVqeTFoZ0Z1NytJ?=
 =?utf-8?B?Yko2QnRvdXc1ZkUwSVgvQWwvM3luUzY1MDlwWFUxcjJlaWtyRFNMSW5UOXB1?=
 =?utf-8?B?L1hBSGR1aU1pUTJVY3NjWlFSTGlWQ0paektFSWhKL3FYQnp0ZHErNmdJcXdP?=
 =?utf-8?Q?PlECsRrPygWIv4TZ10=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230038)(1800799022)(366014)(376012); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djhLcHY0dTRFSjdYcVNIYjJuOEFKOTVCS2ZTMkh0R2dXZ0FZZmRJSkxLTGVr?=
 =?utf-8?B?cmNYREs5TVFTWjR3UUxTQzUzek1XbktOMCszdnNlVXBqRysxYnhTeUVIQ1hk?=
 =?utf-8?B?R29IKzBReGcyRzVTelFrOUhDOWR1dS9qa2hXQkNLUndodXFYRk9sVk9vb2VJ?=
 =?utf-8?B?WFltbzFwVkdBSUR5QnZ2Sk9qSlR3bjFWY3dtbHk0dW0vOWdPb1hZcEw3NnB6?=
 =?utf-8?B?MXdsdzF6dnJyZGFMMmZNSWU2blJGQm1xSlBLMjltcU1tSE5ZKy9YdVE3Y0lJ?=
 =?utf-8?B?RnRuK0R4OUpsQTR2UGV5STY5MjVEK1JKWE9hVUVKSDZxYVdEaHNSTC9kdmRr?=
 =?utf-8?B?bmk3QVNCNnE2d2ZtVUFqQjFNS29MS0kyL2RYczdQeFZCeGZYMXF0UXpnWnNL?=
 =?utf-8?B?WFI3TS94SUNZVGJuU1BFZzdYbUs1NllGUjFBNlcxcFh2VFZDY2NSRTBxRW1q?=
 =?utf-8?B?OFM3Q0tqc1RCcjFncFYxa1NoQzBwNnVXOEJhTHg3T1M1VmdsdEgvcGthNVpT?=
 =?utf-8?B?ZW9BRWNac1A1eTFvajN2Y2xsdDhxRHNUSzY5Q1RNNHNyUFRHYlpsM3VvN3dT?=
 =?utf-8?B?OUNGc3lzWDBTdTIyOHpZb3ppU2h6ODBKcHcyWWFRQk9CRmg2TCtKZFNsU0F6?=
 =?utf-8?B?a1gxSWtpSEpVR2dUZTg3dHJpWHIya21mR3VLdFhmZmNRd2lkU1VSMDlteGJY?=
 =?utf-8?B?akMza2tNZzlVRmRvZE1seWpzd29ydHRocFBGZUlGdWZja3h3UStISTU5bXJD?=
 =?utf-8?B?SDlZQjdoS1c4NThCVitTNU01VElSNkRZMFZMcTlRZDdBUmpNV1NiM0RZSlVN?=
 =?utf-8?B?eHowb0lCejhlcTRJTlpQWnBQbjlPZ2ZlemswT3AwamVUcTJOSmR1WDRzWnB0?=
 =?utf-8?B?ZTltYzVQdFFyMVNKdmVlNFZFREIxWUp3L0h3Yit6SjY4SzUzR1REMmtPVWNH?=
 =?utf-8?B?ZlVIZHVJdmE2cG0yZXpSam5kMVBDNTdCYUtqNVRhbnJTMVI5Y05NMDV3N05r?=
 =?utf-8?B?Withc3ZoUXFNblBRQUVmemlIcjRrY2dZUGZFem0rbzE0dURNZjhQSit1QVlY?=
 =?utf-8?B?N0o5S2gyWWx2SytrRXQvWFBSZnlCdGlGSHcvR1BjSzRqMCtIUzRsdVloZGVu?=
 =?utf-8?B?TmN1bnhKbEMrTHJ6ZG1TK0FzUTN0V1g3UTE2V3NsckJ0NXg2OXlsam9lTjgr?=
 =?utf-8?B?aE5TTmhIVTBxcFBScitCaGVWd2U3M2k0elJUSEtaOUVhOStxZGNJVkVkRDMr?=
 =?utf-8?B?TTc3blprdkdDMGNUTHY1ekFwVzRlMGVZWndRdEdoOHJaVlQ4NFVOalpxbmZi?=
 =?utf-8?B?YXZOaWRnajlHRnRha3hZQ0dSa24yanYxY3NzM0RWN0o1eDY0UWNraWNzcHp4?=
 =?utf-8?B?SnhyUG1iRklLL21Mbk8yWWJWV25TeVFxaVlJb2VaQytuSWtSWlM1RnBLbytP?=
 =?utf-8?B?THltbkdOU3lwTVBVc3ZaeVlRT3dTNDJ0VFpWb3B2YXRGbml6K0RiQko2blJP?=
 =?utf-8?B?N1IyWWhmOS9UM0ZxKy9xdlVIYjJVSXplM0prVHEraUNQU3ZoSHpTYzlUR0hw?=
 =?utf-8?B?cXpQR3AzcVRTWGZhekRyRmFDVUJuWWpmUmhzQ3k5blRPdGJ6eHAwa2ZSbFVB?=
 =?utf-8?B?cXVScWkyVXV2WVhlMlN5WnNreERiSGUreUpwSWt2eHJRQWZHNlFsdnZSTC9Y?=
 =?utf-8?B?U1JFV211VVpabWcxejBPNGROaXpGY2xRUWV1bE9aclFpNVE5R3ZmeXl4WmdM?=
 =?utf-8?B?QjhwaGZqaFRBWGcxL1VEbGJPSlJiUVFiVy9qcWVBNWdkK29iODg3NWpib2hC?=
 =?utf-8?B?SUw0STdVM1ByOC9wT2NjZHhzVi9hQTFsVFVOL05hbnBBWkRpVzJnWFJiNmlP?=
 =?utf-8?B?aGZUYkhqRlNmeEp6eUlmam5vV2haclFZOG83N1REdm9VcmphRGVNMm5Pdnh5?=
 =?utf-8?B?RDY3a1A1L3BCNStRSXcrRHRrdWdZaDFEU0czNHVmMU9vd1orNHRFTEx0c0ZX?=
 =?utf-8?B?T2pqbk9LbzBxbmlRSXdIdTRQYlFpN1JlbVR4MXVSL0ZqcVJ5N3JqSjd5ejQ5?=
 =?utf-8?B?N2ZZV21TL3YybTB4Z0J3aHErak41ZnBZaFYvajB4VHQvYkl5dThhSGVhUmhp?=
 =?utf-8?B?MkhRZEc0TG1aSExvY01xZnRtUlN3NEs5YUNQTHQ5bXVPbjJKQjdJNEhIRTJI?=
 =?utf-8?Q?9ARDz6vGRu7SoW9U35iT9z8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 06cbfa78-4a05-4fef-bad7-08dc958f172e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 03:21:38.2922 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KUaeTaQYbgNuRW8OH6IZPTXpNjONq7UyXDi/HEAUVuM7fJRpbP2XBeDslSmL7EEjkqlvIDWKd3Ti6ikk/ePHqb5GJt9AzRXfJYSGgl+rjww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4529
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

On Tue, Jun 25, 2024 at 05:41:01PM +0000, Matthew Brost wrote:
>On Tue, Jun 25, 2024 at 05:24:02PM +0000, Matthew Brost wrote:
>> On Wed, Jun 26, 2024 at 12:58:12AM +0800, Umesh Nerlige Ramappa wrote:
>> > Current code captures utilization at the exec queue level whenever a job
>> > is completed and then accumulates it into the xe file stats whenever the
>> > user queries for per client engine utilization. There is a case where
>> > utilization may be lost if the exec queue is destroyed before the user
>> > queries the utilization. To overcome that, record the utlization when
>> > the exec queue is destroyed.
>> >
>> > To do so
>> >
>> > 1) Wait for release of all other references to the exec queue. The wait
>> >    uses the same timeout as the job scheduling timeout. On timeout, only
>> >    a debug message is printed out since this is just a best effort to
>> >    capture the utilization prior to destroying the queue.
>> > 2) Before releasing the last reference in xe_exec_queue_destroy_ioctl(),
>> >    record the utilization in the xe file stats.
>> >
>> > Fixes: ce62827bc294 ("drm/xe: Do not access xe file when updating exec queue run_ticks")
>> > Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> > ---
>> >  drivers/gpu/drm/xe/xe_exec_queue.c       | 11 +++++++++++
>> >  drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 ++
>> >  2 files changed, 13 insertions(+)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> > index 4d90a16745d2..f1028eaf2d7f 100644
>> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> > @@ -69,6 +69,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
>> >  	q->ops = gt->exec_queue_ops;
>> >  	INIT_LIST_HEAD(&q->lr.link);
>> >  	INIT_LIST_HEAD(&q->multi_gt_link);
>> > +	init_waitqueue_head(&q->wq);
>> >
>> >  	q->sched_props.timeslice_us = hwe->eclass->sched_props.timeslice_us;
>> >  	q->sched_props.preempt_timeout_us =
>> > @@ -825,6 +826,7 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
>> >  	struct xe_file *xef = to_xe_file(file);
>> >  	struct drm_xe_exec_queue_destroy *args = data;
>> >  	struct xe_exec_queue *q;
>> > +	int ret;
>> >
>> >  	if (XE_IOCTL_DBG(xe, args->pad) ||
>> >  	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
>> > @@ -838,6 +840,15 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
>> >
>> >  	xe_exec_queue_kill(q);
>> >
>> > +	ret = wait_event_timeout(q->wq, kref_read(&q->refcount) == 1,
>> > +			(q->sched_props.job_timeout_ms/1000) * HZ);
>> > +	if (!ret)
>> > +		drm_dbg(&xe->drm, "Timedout waiting for exec queue run ticks update\n");
>> > +
>>
>> I can't say I love adding a wait to destroy IOCTL just to accurately
>> report some stats. If we can't preempt this exec queue, the kill flow
>> can take nearly .7s which would be pretty bad to block in the IOCTL.
>
>Opps, my timing calculation is wrong here as I forget that we reduce to
>the preemption timeoot to 1ms upon kill. But my point still stands from
>an arch perspective blocking in an IOCTL to collect stats doesn't seem
>right to me. Maybe others have a different opinion?
>
>> Even the common case isn't great either...
>>
>> Beyond that, this code breaks if the assumption of
>> kref_read(&q->refcount) == 1 meaning all jobs are done. e.g. The wedging
>> code == 2 takes an extra ref to the exec queue, so this IOCTL will hang
>> forever even we wedge the device.
>
>s/even we/if we/
>
>Matt
>
>>
>> Could this be added to exec queue backend code which adjusts on the
>> final destroy? e.g. Add it to __guc_exec_queue_fini_async via
>> xe_exec_queue_fini? Or does that not work because we don't have the xef?

That's how it was earlier, but the problem we ran into earlier was that 
xe_file_close would schedule work to kill the queue and in parallel go 
ahead and close the xef object. By the time, the queue backend wanted to 
update xef, xef was freed - 
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908

Maybe if the queue backend somehow knows that the relevant xef is gone, 
it could handle the above bug, but we do not have a q->xef. It looks 
like that was intentionally removed a while ago. We were using 
q->vm->xef in the code that caused the above bug, but that's a hacky way 
to relate the queue to its xef.

To resolve the bug above, I had added code to localize the stats to the 
queue and transfer those stats to xef only in calls where we knew that 
the xef was valid - like when the user queries the stats. The only open 
was that when the queue is destroyed, we will lose the stats stored in 
the queue if we don't transfer it. That's what is being addressed here.

>>
>> Regardless if my suggestion works or not, surely we can do something to
>> avoid waiting in this IOCTL. I suggest exploring another solution.

Lucas had suggested using a ref to xef object, but I think that requires 
bringing back the link q->xef. If you are okay with that, then I can add 
some code to make xef ref counted and solve the original issue -
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908. I can drop 
this series then.

Thanks,
Umesh

>>
>> Matt
>>
>> > +	mutex_lock(&xef->exec_queue.lock);
>> > +	xef->run_ticks[q->class] += xe_exec_queue_delta_run_ticks(q);
>> > +	mutex_unlock(&xef->exec_queue.lock);
>> > +
>> >  	trace_xe_exec_queue_close(q);
>> >  	xe_exec_queue_put(q);
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> > index 201588ec33c3..2ae4221d2f61 100644
>> > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> > @@ -143,6 +143,8 @@ struct xe_exec_queue {
>> >  	u64 old_run_ticks;
>> >  	/** @run_ticks: hw engine class run time in ticks for this exec queue */
>> >  	u64 run_ticks;
>> > +	/** @wq: wait queue to wait for cleanup */
>> > +	wait_queue_head_t wq;
>> >  	/** @lrc: logical ring context for this exec queue */
>> >  	struct xe_lrc *lrc[];
>> >  };
>> > --
>> > 2.34.1
>> >

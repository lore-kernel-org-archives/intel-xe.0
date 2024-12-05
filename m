Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 306D5E7716C
	for <intel-xe@archiver.kernel.org>; Thu,  5 Dec 2024 07:21:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7DEC10E2C4;
	Thu,  5 Dec 2024 07:21:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EXzJNGUq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98B7510E159
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Dec 2024 07:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733383284; x=1764919284;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bPpUsQm1xnG+voURL/gBgW3J6M/zgoIeyj2dwg1OymM=;
 b=EXzJNGUqVS8dUziIBNdq7WT4vMeKQrNTwLHjMEsF6JmT8w+l6iV/U4Rt
 94cVmDWU3xbMLPUDvvqG+ydmSSG43yvlk9KHTH8SxoU/ZaChdmM+Ki3JO
 y7vhsVtlb+qzjNscIGu391s0V52jcmR2DjxcILUWpehdgmPGu6ttAYMZE
 dQuU0OWVkXSS7dXNK1OFs5sZef9gc30yi3NuyUd75WheZAsOD748TwnLc
 eOINQJ4TLyyse19OrgDTJgr9MWXKrIzyDcYfn+u2EhFNgeaeHsxC0Mh/g
 YbDTuTLnMl3id4MvpJXOdSPoXd9zu0sPdoKi3C4zR07UJ26fDzGgv/hcl g==;
X-CSE-ConnectionGUID: XOD19AqQRYSeE//coIX/9A==
X-CSE-MsgGUID: LmlZryU0QF+yPeJk+zHV5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="37459262"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; d="scan'208";a="37459262"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 23:21:23 -0800
X-CSE-ConnectionGUID: kPOeR0DiQVikCcovBnxuRg==
X-CSE-MsgGUID: cCcoMKrWT3q2w791KaHBuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="99047027"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Dec 2024 23:21:23 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Dec 2024 23:21:22 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 4 Dec 2024 23:21:22 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 4 Dec 2024 23:21:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FI4nxzpc4Pr3siAZ7AHj19uvMXTNJeralbyBB3oDZ2MhdDU10o+0txEhc4VbHNiuSIwWjWWsD65KOs6VGO7rll0/C94IIHeCdOdN5cyHF4A+LcwVvC2qh8sG6stK9bnOL0lnaiwzEKN2ZrhEQXnvJWFIi2IGyTbECGvi+1K10scPi8tIRVZPRZNPjyKSyqnawosItdimkmWkDA58sJdXnDT+rBRUqjycMlfKW0MxI2d2fns31tWRvrOKqdXvSVb0cZQNjlk2iAvznSlVFrIZdUfg2vIFAfjxtQ3J2mcENRsBsDMIy5MCgxxbIm/XwIErCtqo1Y91m/xI/H/WwInZCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hEXhbRwoqZKtrDE6sCebtQtrH5F70ZDX0/k5Ygq5fio=;
 b=MoNHHtRQpYop524aTYH/KkZXAJeY7Ug9d9Z+mU4H+GGeaX2lhU0Dy1l2VtcABC6iHQyaWBv1YBM02f3FhIAapOkr3Z3fAqhvQKAL7jqDGC74QSTdVNyFVuIAEdjXstmJ4YadwqEBJRfuhuYYuiYK9pt1o/p8dGe1+foR3r8aYOGjLv5l7tOITvjjugwSn9QvbZMok2GfmZQSyUJvZeERkLVKZSn+86JD85vhZrsUSv1Tyv5RgnbALNxpX78661dBk45n40ohx86JiNtINW3sQzYg8iaBP7Nq2B7syCxfNLxu+gF8c9dsv6L8TIMQgBkP2jcoNjof23YknOXYN7D+LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7010.namprd11.prod.outlook.com (2603:10b6:930:56::19)
 by IA1PR11MB7200.namprd11.prod.outlook.com (2603:10b6:208:42f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Thu, 5 Dec
 2024 07:21:20 +0000
Received: from CY8PR11MB7010.namprd11.prod.outlook.com
 ([fe80::5976:5330:937e:d741]) by CY8PR11MB7010.namprd11.prod.outlook.com
 ([fe80::5976:5330:937e:d741%3]) with mapi id 15.20.8230.010; Thu, 5 Dec 2024
 07:21:20 +0000
Message-ID: <2a365231-4408-496f-82b9-1eb1fc8faa51@intel.com>
Date: Wed, 4 Dec 2024 23:21:16 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Enable WA_DUAL_QUEUE for newer platforms
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: John Harrison <John.C.Harrison@Intel.com>
References: <20241127011105.1306924-1-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: "Narvaez, Jesus" <jesus.narvaez@intel.com>
Organization: Intel
In-Reply-To: <20241127011105.1306924-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR20CA0030.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::43) To CY8PR11MB7010.namprd11.prod.outlook.com
 (2603:10b6:930:56::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7010:EE_|IA1PR11MB7200:EE_
X-MS-Office365-Filtering-Correlation-Id: d9acbd57-8a63-4799-da27-08dd14fd6a62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NTZxUExZT1FEUEFMd0YvQXVTNW1CeFo4Slg0ZjFzdVJIbEVWU2dCN1N4YUZh?=
 =?utf-8?B?UmdBSCtlN0w3d3A1T2dqekhTaGdQczdOZzhqTlR1RzBYRXRNaUJGWm1XclJq?=
 =?utf-8?B?ckFmeUZNRXNIalJXaFZBd1lpb0RRR2VvMzZyWlNMZSsraVRnUTNDTUNKeklT?=
 =?utf-8?B?R05KbGtSa0ozOVMwbkkxajUxMkxGZ0RiWkVEV3VZa2lkK29kWm8xTWcvcWFu?=
 =?utf-8?B?TWJOUFZOYnljQ0ZDd0tHenQ5Vm5QVWovampjZldyaWJjWWo0bm1jUDNmS0FM?=
 =?utf-8?B?aGJyNzlxamdycEY2SGxaaXk0eE1DaFBVaFFJVkpvNXpWZ05kWEJYU0JkL1p4?=
 =?utf-8?B?YThWd0JEbGZ6aGlyVExvOFJlUVVpL2RMQWRsVnUxNUhPaUlDam5QZ1FOZWxU?=
 =?utf-8?B?TElVOGkzRm5NZEQ0aSt1cThRYllzVWpiczczbkFSc051MEZybXM3cmpWZ0pO?=
 =?utf-8?B?a2FaOEdaRzNBaGxRejZPYnZqb3JtT21ON1MybXh1aFdPdW55c0w5WllRL043?=
 =?utf-8?B?QlZ0djhoZjV4RDFoQ3c2YXhlWERkVjBld1M0S1NHSEc5WmZBTzFUcEM5WU9u?=
 =?utf-8?B?ZVpBeE9FeWp5aWcranc5b3NMYnI3VFU5b29sVVhnVnJqRjFGakV1c0xyTzZm?=
 =?utf-8?B?TGNaS1B3VUt5dmsxQllSSklLNG9ZdDEvTm5xclVDL0RUSXlUaWVjS2xvaGxr?=
 =?utf-8?B?WHhHREllTlgzMHRrcGlWWkszTVhYU2g2dG5hWkkrczVLUHJlREc5WXE2SVFp?=
 =?utf-8?B?M0ZqQThYUkwzK1VLbVV0Yjh6dGhYNHVjdGZ1S1BQSUhTbldIVG9mUHI4N2pK?=
 =?utf-8?B?eHoycTdOazVHS3I2bGJYSU4ybEs0bXVnVEtIOEpyQTIxYjY4c3R5N2lmQXZR?=
 =?utf-8?B?V0hQSFJaeFk4VXM5cEhXc1B5TDN5NU1ObVZzYS91SHpJNGtoSHVEbXExdDF5?=
 =?utf-8?B?bUJvMENIVlZFNDdDcmxKclBMajV0Y216bkF3ZUZCWThUL0ZJZ2VQMG00VWFz?=
 =?utf-8?B?aTNOT0pGNkNKWkhLQVZJemwvS2MrMUs2WVl1UXIyejQ0bGlhRmhUVGx5V0Zl?=
 =?utf-8?B?eGFQbVR1VGJVc1hJZnZMamlhOVBqa2tjR1R6YWtldGo1MmVzUXhkVkN0U1pI?=
 =?utf-8?B?MmJyM2NrVGd2SlY3dytGam1IT1NjWGF3R1NGMnVSWHhIZFRITmp6NzVFVVdi?=
 =?utf-8?B?UXlhVGRYZUVkd2VoN0NNdFZFT0t2YkN3cGFyOWlBbml4Q3hhU3lrNUpsclZs?=
 =?utf-8?B?bExwak03R1o3SS9tZnl3UEFvcUcxVmtuWEY0YXN3aFhPOHhOSXkvYk1sYlBN?=
 =?utf-8?B?MEVDVlJ3M1dIc2dJSVZQcWJ2aUNGR0dyQ2hKQzRhY0ZlWno0bXk3SW0xb0l1?=
 =?utf-8?B?a1RDK0pSMjhpa3pIL29KTmptcFUwRWJ2WUxzaUxNVC9zdDFpOEpTdFZPZWww?=
 =?utf-8?B?UXhONThBeEowclhjbXREYW9XSktOSERSYW1zWTgwMDEvMHord3ZPZldxSkw4?=
 =?utf-8?B?SjdMbHB0UFAySjNDd2FjQXNVNGNLaGd0V0pidlI4ZENiZHZka2hkUDRoQmw0?=
 =?utf-8?B?YnFpL3VnNDBGZlFtUy9SOXVEZjhURExtM3l0K3VodXFNN3V2b0tiWnhOTXZq?=
 =?utf-8?B?UHNpeDV5ZVVnRndJT0s4Q1A5WnBPTFJmM0Iwc3N3UFhvQ0NuUElLMlpxK1lD?=
 =?utf-8?B?OC82cWJKdEgyWVpoZXc3ckdvMWlZMW9FWm5VcHRyL0JFSDQyU0FKSlorNXdx?=
 =?utf-8?B?dTdXbm9UNTB2alp0d09LVERkYkRITzlOdm9GdWk2KzRyWFpKQVFMa3NBQmFm?=
 =?utf-8?B?YlJTZ3duRExzNG5MWEhvQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7010.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkRkSERvcFc3Y1doVDE0UGhmZGZONGR1MG5iS1c4eHpaTjhwaXo0R3c3WEc2?=
 =?utf-8?B?RmlkZXlKc25XRm45RzBNU2h5QXpqNE1mdzBxVEJ0NWZaRDRsaEJlclVuR1dm?=
 =?utf-8?B?Nk4zNkREOEdVckNDV3VmS0Y2cWo3OVU1aFk2a3lrbGZPaENZaGp3d0h6MUpV?=
 =?utf-8?B?cVpVL2MvVzNEMmNzcXk5M1hZMUtlY244RnVSY08vM0JjTnl6aWxEMTJGcTBH?=
 =?utf-8?B?ZTkzUUt4VW5mbkNJU3NMSlc2YlJvek9uM1N0ZjcvNEZmZHlOVEI2MVdFTW5i?=
 =?utf-8?B?ZEptb2NwWHcxclErUkFpczlwWE1NVlVXandSVWNwS3BLQXNzTzVSSlA0TUJi?=
 =?utf-8?B?RXh4VzgrWEFSUGhvb0ZuOEJrZ1dyaFFpZnltY3dUcUJ3aWpxUFE1QnZoT3ZT?=
 =?utf-8?B?TlM4YW1kWHN4YUFEQUhlRE4wYmMvdEUxdWptMGN1TGlkTzE4SS9rZTlHWVNY?=
 =?utf-8?B?SnlMYnpjTHM3VGhnaDhVK2hhdWdvVHhsS2dUaDZJbC9vcEJkL2dveGhhcUt4?=
 =?utf-8?B?TGZNYTloQnIveFJzTi9OL1AzNkpJS1ptQVlOcGNGSDEwbHdUMGJYb21IcmtQ?=
 =?utf-8?B?SWxXc1FvckhTcWV1UERrZlR3aE5BQVBocHNDUHhPeXU0aG0yMEVCc01ZR0xi?=
 =?utf-8?B?ckxiM2Q0SnN1K2ZXb2J5Z1lCRmlIZXN4S2VKUVN4aEtBQVdBTUh0bEZzazBL?=
 =?utf-8?B?ZkhSd2VlalpyRWxDbG1RVWhlajEyMFdGUXhxSjdYL3IrV2xQOEZha2FHVFpm?=
 =?utf-8?B?WExxdUN5WG44c3o3bk5YdkFla3RzdTd1QXY3bUNIRkZYWUxjWFptVnlFVnZX?=
 =?utf-8?B?YVcvVEo1ODNGaFZQOHpVeUtDWXUvelBxL2s4T2dPN2hYeDlaYWg0N3lmWU9Z?=
 =?utf-8?B?SlRMdWVMajFOV1hqSTZqZ1ZtNDZlT0gzSDhXRnBhcDdyM3dFZzhTekRkcHNN?=
 =?utf-8?B?eGYxbS9oTVU4S01aclZpY2UxcENtQzQxbTR5VTlZS3BKSFZWT0pENDEvU0w5?=
 =?utf-8?B?c0tUbkhETVZELzM5bGxTMEFoblY4RGlNemJyTWtrUlI3azY3K3JMcDlDSlR5?=
 =?utf-8?B?VUlKUDQ2UkZuSStDalZ5TEl3U0RKbW9obUcrNVdUVFNBMGpjcnlhTDdFMTlS?=
 =?utf-8?B?TUM2OXZzNWZJY1A0emphWFhSdUE2SmQ1aW13ZzkvaHVKWE84ZXQrQlNmRG1Y?=
 =?utf-8?B?SVFKOGpLUWdaZEtLZU5FbHc1SWt0YkRTZWFnaUpKK2k4dUJqTXhjQ29MNVNl?=
 =?utf-8?B?eE95K1ErQXdMQ0RiclBpSmgvNldwZXk1cVprODNQaHFWbGFJM1JqSlRDaWly?=
 =?utf-8?B?N25WWmRVWUR3UWV2eUt4Y2JXTC9iQ2F5eW84M0RiRWFCTk5MREJva2hoWWRa?=
 =?utf-8?B?SFBKVDA3RnJKRVdkZmtQNTFmWCt6c2l6VlBNYnF3MXcvQ2Z2aC9BMEdwV2w0?=
 =?utf-8?B?RUdVZjRuUmpVUk1CUHVpOGpVNms4QXpzbUZaZldtYll6azFuSHdaMEpiUmsy?=
 =?utf-8?B?eVRKdWxENnV6ZkRDTzY4Z0NIWGlSYlMzbVExbkhwV2h4cnM3RGt0Y3JtSkp4?=
 =?utf-8?B?ZTBva3hrTGgwRjUxTlRXaWJGV3FqUUJXRXIwNDhtWFQvY08vQTFhejlSa1Zh?=
 =?utf-8?B?V0xTMC9vUkJ1UDd6dHN5ZTIxcytpSUFZMGFDNzRHanh2NUg0Rit1MngvQU5T?=
 =?utf-8?B?amlpUDhySUdpVFZlZzJQVzJGcFRIWTB4S3p0YXNqZWVWck5VQS9naFhYa3I3?=
 =?utf-8?B?Mm42UkJCZkdlb25pSjBHVGtQMUpWdVNLWEtXS3JJZXNkaU1WS2tWdDYxaFJm?=
 =?utf-8?B?S25XOTlqamNsWWJLazArYUcwNDV3L1FRNktIR0czdUxWQ05sOHF4Qlo2Nlcr?=
 =?utf-8?B?a2tkalVwN0R1V1NYMWh0Zm9EVENzRGZOWnBLcHZXbldxNkkvYktDQnRCNFFk?=
 =?utf-8?B?RkIydDhVZEl1eDk2WUl3emE2ZlYwQTc5SHN0bHJITm5hcjhMRmdONlJ5TVdC?=
 =?utf-8?B?UjhmY2lqT1NWYXJMVGlRMDB5UlpNU0gyWWxSb05pSVVnZUV3MlFHNm8xMFZ5?=
 =?utf-8?B?aC8xNXo4ci9iTHpNSDVtajFNUnZTeFliNWtKaWtDYnlwTkRrSWVvOHE3NFBs?=
 =?utf-8?B?ZmpRbHQ1aXU0eG1nUEczajZiRStuOWcxbmExbjZFby9oMTlqbzJtY1JpNXpB?=
 =?utf-8?B?eVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d9acbd57-8a63-4799-da27-08dd14fd6a62
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7010.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 07:21:20.1957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sSPmZYoZrkWuenBzF9pj50Sbt/L2CS+ynrpTkRhD6n4AaY9R0ygIPKJzzIdWL8u5/ECeXFTGSTx8ocTjmP5MWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7200
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

Looks good to me.

Reviewed-by: Jesus Narvaez <jesus.narvaez@intel.com>

- Jesus Narvaez

On 11/26/2024 5:11 PM, Daniele Ceraolo Spurio wrote:
> The DUAL_QUEUE_WA tells the GuC to not allow concurrent submissions
> on RCS and CCSes with different address spaces, which on DG2 is
> required as a WA for an HW bug. On newer platforms, this block has
> been moved in HW at the CS level, by stalling the RCS/CCS context
> switch when one of the other RCS/CCSes is busy with a different
> address space. While functionally correct, having a submission
> stalled on the HW limits the GuC ability to shuffle things around and
> can cause complications if the non-stalled submission runs for a long
> time, because the GuC doesn't know that the stalled submission isn't
> actually running and might declare it as hung. Therefore, we enable
> the DUAL_QUEUE_WA on all newer platforms to move management back to
> the GuC.
>
> Note that the GuC specs also recommend enabling this for all platforms
> starting from MTL that have a CCS.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc.c | 16 +++++++++++++++-
>   1 file changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index df1ba94cf4ca..ddbfbdf901b0 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -151,7 +151,21 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>   	if (XE_WA(gt, 14014475959))
>   		flags |= GUC_WA_HOLD_CCS_SWITCHOUT;
>   
> -	if (XE_WA(gt, 22011391025))
> +	/*
> +	 * The DUAL_QUEUE_WA tells the GuC to not allow concurrent submissions
> +	 * on RCS and CCSes with different address spaces, which on DG2 is
> +	 * required as a WA for an HW bug. On newer platforms, this block has
> +	 * been moved in HW at the CS level, by stalling the RCS/CCS context
> +	 * switch when one of the other RCS/CCSes is busy with a different
> +	 * address space. While functionally correct, having a submission
> +	 * stalled on the HW limits the GuC ability to shuffle things around and
> +	 * can cause complications if the non-stalled submission runs for a long
> +	 * time, because the GuC doesn't know that the stalled submission isn't
> +	 * actually running and might declare it as hung. Therefore, we enable
> +	 * the DUAL_QUEUE_WA on all newer platforms to move management back to
> +	 * the GuC.
> +	 */
> +	if (XE_WA(gt, 22011391025) || GRAPHICS_VERx100(xe) >= 1270)
>   		flags |= GUC_WA_DUAL_QUEUE;
>   
>   	/*

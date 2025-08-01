Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12256C87FCA
	for <intel-xe@archiver.kernel.org>; Fri,  1 Aug 2025 14:04:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B646E10E863;
	Fri,  1 Aug 2025 14:04:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IEP+Jj1c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12AEA10E863
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Aug 2025 14:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754057095; x=1785593095;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=fDadOhnPI63FQOuMyRLFACmdgLa+14A3rraTv4xzxOQ=;
 b=IEP+Jj1c4LUWVhmTeX/YysDf/pc7JB3W2jZe+ENPchjc3LeCQ06neryr
 8rm5yl74uxvFVOLVG5wyASOjyOgxCrIOqwcmWWELhbM2pCJDxRVbljJ9V
 9AOi3pRDPooCOWAJZa5MwTmISFPd45sG1WHBTxw73sPfKMZjR5/B4000N
 2/riMyxWvAvXk49khTsA5dd7SMC+43/0JYFeWcapXHHZWnGb4KHnGt8sd
 kitPq6V3AfO/PO9JQxrEYHThuRsi2WwGKbs5p3urOZzHZRxi+l0CZaFXJ
 DnomwsTg/EtgV+93xBYvNwsKIYlFG8KR8glTrBEd37Lu1pCrfW4wwiDAl g==;
X-CSE-ConnectionGUID: Cd/qigK1RFKhPuSmTM0eMw==
X-CSE-MsgGUID: YP278BpRQomf+xEW9EDqjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="81857366"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="81857366"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 07:04:55 -0700
X-CSE-ConnectionGUID: eM9ToL1qTDujX0nytnIrMg==
X-CSE-MsgGUID: JBMG3cPbRqSu+KroB5FzeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="167776587"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 07:04:54 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 1 Aug 2025 07:04:54 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 1 Aug 2025 07:04:54 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.54)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 1 Aug 2025 07:04:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qh8KxPLwVOev6QUgnHdI64P4QAL7u44MR47W9kZZM03uZ5o0T3J0D2nHk5fLsfVSfrSKz11+vW0IxcfMirpg6eCxAZyoAyRITmtQTBsv4Ymz3bj+voTWUstDUi5IlfrE4gXuCpwZmKtp1cEboHEHVAejWC8hjtnvoPuVZKhNv6uAeOhBYMiXCthbAGlR5nggCxLdCWgedH3fGCt8Rt2PSlc5ccm4vF+nEyu6fqbbh+lQvxjVca+8O66K4RvtlCIKqQ8DWuFte508SJJgqNevI+a7X5F38IEy4/0YmEsao5Adicftdh64SKlMO1+0Ru+zC86857N01fg1xn+8ENTDww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Hr7iKM2V09dS5VRTEDRDlkNiRfCFKE+gi0pI6tNelA=;
 b=bBe57X8NGO5IpsVppbQdZqThalwzwNDqBMR0umvpSEY2Bgz1XC/PbU9O1fFlAaVcH6KsQyg6GQ+A168IwWa1zMITz8/F9teLbiTlqzY3H9z0LzbzU16icHd0Twsz7LDTB82xr+aZF5i1FbuG7XbqBk7KvOCPWVl+xG7Es9pX3/CfRqf5WYrYYa2mBDCebpdeq1cEqWEb5mqkJHQOZFwmXoxBdJsUP9MZvMC0ptutw+7KNJT2MKYmNoVPuMyOm1mI7q61jJupnwL+Spf3IFIhqTRBF3jhFJNYGppyq2eXg1iWaKjM/OSMzIDNIe0+NUP7TBImVvzzFc+Q6/tc2WZurQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6138.namprd11.prod.outlook.com (2603:10b6:930:2a::11)
 by CH3PR11MB7204.namprd11.prod.outlook.com (2603:10b6:610:146::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.12; Fri, 1 Aug
 2025 14:04:36 +0000
Received: from CY5PR11MB6138.namprd11.prod.outlook.com
 ([fe80::f24e:b21e:c458:4e74]) by CY5PR11MB6138.namprd11.prod.outlook.com
 ([fe80::f24e:b21e:c458:4e74%3]) with mapi id 15.20.8989.013; Fri, 1 Aug 2025
 14:04:36 +0000
Date: Fri, 1 Aug 2025 16:04:33 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/xe/pf: Don't resume device from restart worker
Message-ID: <20250801140433.zfa3a4ykab2enfki@intel.com>
References: <20250730174913.178434-1-michal.wajdeczko@intel.com>
 <20250730174913.178434-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250730174913.178434-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: DU6P191CA0018.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:540::6) To CY5PR11MB6138.namprd11.prod.outlook.com
 (2603:10b6:930:2a::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6138:EE_|CH3PR11MB7204:EE_
X-MS-Office365-Filtering-Correlation-Id: aecd9ce4-4658-4abf-7cb7-08ddd104593d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OTRaRXN6aDNOUWtYVWJpU3NtTzBYQm5IMXAzb09wK1RVM1VlMGNETzMvMjVM?=
 =?utf-8?B?NEVoZFNtcFhCS3lqSFNXYmYwVnJwanBnSWk4OWhiSnJ3eVF5TlVzWkpmT3ZS?=
 =?utf-8?B?STJPU0s3R0N0RU9mQWd1bDZGNTJtdkhpU1o3cENUeXYwaTJBclNxbUJZaWJB?=
 =?utf-8?B?WkNwbGpUTEFDb2daTkk3L0RjRnhoSVpOekNZR0I5MGZRVmRDUmhpYktRcEdr?=
 =?utf-8?B?bHdEY1JnMWFueEF5TGRsQko1RFRxV0ZuWmdLZWpIOTREYTZrSmFKWnZpZTQ4?=
 =?utf-8?B?djFQRzBYeXVIbWhab1kvTkhPVUJYM3hXeGYxMDJoaGJPMFFsL29lN1EwWHhx?=
 =?utf-8?B?QUFLajJFWXhuaDZtM3dCcDNwSTU5NmZaUlpJTjIxQ0twM3poWDFmZFV3bmxk?=
 =?utf-8?B?aWV3dXJITjJHeUVlUjdueFFDU3J5NGIvZFFQbVVQcjRYN040bXRST2l4WlJW?=
 =?utf-8?B?aGFoQ0hPMjg4NktZWHliSmVNKzdUMy9hZXZIdXFGV2UvZWZuSGsxdGZlRlZt?=
 =?utf-8?B?QnlZaTRvbjZBQnhKWThicXZuY0d2NWN0Vk1zdDdSbHA1OFVIT0pxdUZaY0dG?=
 =?utf-8?B?Tm1tMFloeWNhWDFMaXV1dS9GNmFNWlZqdy9BTGZZSXY0enNQNndrWjFnbHVQ?=
 =?utf-8?B?Q2VvSU9TekNMZkpmZUlzdTRuOTFqU0ZkK1loMEpRdWR1cGVPeTAxci95dXNL?=
 =?utf-8?B?L2RxQUI0ZDFnd0M2Z05KakdxVUN5T1VVUWJJYXhNOWhxcGVUdTEwWXpxbVNF?=
 =?utf-8?B?S1VRTlB3RG14WFkybHRwa21wSkFmR252S1pxZVJHYVpEMU1zUWZsNHV2OEkr?=
 =?utf-8?B?aXN6NTIxNmR2YUJnUWR1UkhSblYzaHhSNXc5OGtrSjNGM2FFeCtvRFpWVWNQ?=
 =?utf-8?B?Y3NrUlVna1ZsMnNOVWUyMEU5bGlnTG5vRis0RG9MQ0QyUDg0ZHhtZm1WYVBY?=
 =?utf-8?B?SHBXZFAzSzhuNlF2M2dNN09aZDg1WE9aNGNCWlFSanBqOEFwby9qVFdtN0RR?=
 =?utf-8?B?d0MrQTExMEV3MWQwOXp0Y2lzbDdtSVRIQ015cGJKNy9EL1Jqa2owOHF4bjNX?=
 =?utf-8?B?cTVEUDZxNE1XTmt6NXFkVGZScVEyWG9GNXA3RW1QSUNVMU5WeVYxVmdMbjBw?=
 =?utf-8?B?dDREa3YzZDhZREJ3bUdQSTV5c3UyRUV6K0tJUUZQNWg1bnVMMFZobzhlUFNn?=
 =?utf-8?B?ZXdlWC9PaWdsck5uWnhuc1o0c0YzNDBGNlRqUVI4YUlXckJ2eUFRbTEzTEll?=
 =?utf-8?B?b2NNY0phb0lRZ1Fqa0RJSnhwOUdSdGVlZFBjRVpSdkk5Wnk2bFg5a2E5Y2Rv?=
 =?utf-8?B?c1VJYWJoQUhlNG9xMjdWQlF1ZjB6UE1aYXNzWkpEdUxURkNzWXFvMXdLQS9w?=
 =?utf-8?B?Y3RrY0hsNkFoeVdGbC9nQWgwUUpVRXVHOXFoenpJUEFwUit6RnlCZlhaekpE?=
 =?utf-8?B?S2FhQVdtNkZQVHJNYjdpbTZvK2xvaGh1Y2VJeU8vZk9FbTFyN1hIYnhXQllS?=
 =?utf-8?B?NWI0SUFyQTdwNUw1UlliVFRlRUhMZWRVZm1sUjJvUEJtQTlHblF3Q0lpZ2ph?=
 =?utf-8?B?VWdzS01oUE0yZHFka2FhZ3FDWjlYOW1tSm4xVmRNRThtUTRMakMrMXorN3FC?=
 =?utf-8?B?aWNMZnYxOFFkaG9EeXBjUzQ1ZEZNR0NraFRtbmxEN0pJdmVZNWhrSEFGeW5L?=
 =?utf-8?B?SDNJc2NXSEppQTVNejBUU1hzZE1HSHV3emcvZ21xU0E5akVDT2RKSng5NmRV?=
 =?utf-8?B?cDRlempCbStINDBLZit5MExHamt3YTlVSUZCdEl0VGZQRU5uRUpLNnQwQnhP?=
 =?utf-8?B?djFvSkUxZm02R0toZ056RnAxZkN3eko1cTBpY3pXd3Y1NW91TjRwb1Jpbyta?=
 =?utf-8?B?U0tWRXpkQnlCMlQ2UkxvQTVkYnZxVVRmcUlEVHhlYkx6dUlvVVA4UjRtbGJ4?=
 =?utf-8?Q?HPdsGOREA4E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6138.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3NzVzZLL2FuNUdHTlRaTUV4TkhVM3ZaeEsvVkhNdlpEazR3TkZPT1FCSDIz?=
 =?utf-8?B?Nm5pR1orekdBZU1SeldxczdNUFlsc1VnWW1QdFZmZGFXT1NHeGw1MEhVS0k5?=
 =?utf-8?B?MU4wcEppWVpITGRvUUdud0xCVk9CYTRlOHczTmNUSVRWZ0dtbk1KcHJNNklH?=
 =?utf-8?B?Z3VSL3E5OWszZkRQZEJqOTVCbGZFbHNnZW9jT3BzcGZKajY1aDBXdE1COFlY?=
 =?utf-8?B?bEVpdG9vMzZmUmt6Ui8yMEJpT1M0V0g4VmN2VVFRT0tEMzhSVlU5V1J0MHE3?=
 =?utf-8?B?aUswUUE5ejFvUHhmWnF1UitRbVFnYmRzeStDa3FhdVJrM051Q21kSmFsbDVy?=
 =?utf-8?B?WjNaMWh0TGErYldiYms2SkV6dFhXL2NGNEIrUkluU01BOEp2Nm5ac01Cb1F4?=
 =?utf-8?B?M0xiemlRZmEvWW4rd0kwY211aVY1M0JWYjlSOUp6aFFjR3NBa2FqNk1paThG?=
 =?utf-8?B?cTBTU0U0VHNzQjRMd3A3bnFJNUVmc205UFRmUlkwbWZ6UDJsZkZSL1V6c3U3?=
 =?utf-8?B?VTNUY05Ec3gxaWhycS81SHpzZXVpSzg4ZVczUnU1VGl6ZFRDbEt3TG4vQnky?=
 =?utf-8?B?MlI1NFVDSkpwQldkcEVZSHJkQlBZdXJpRmVqTEZpVVB4aGZycklvWC8wUTBT?=
 =?utf-8?B?NzhyaGl4TkRSN2xLM1ZjRzk1VVJqUGcvY0xvZ0xyRzlOZ3g4R1pkcFZOR2Na?=
 =?utf-8?B?RWZoTERudlJPeHN4Wi9hTHhIVDFHeWw4a0FIR1poTkZhQnEvZ2tlWVVKaG1t?=
 =?utf-8?B?ZDRkbThZZ3piV1M5ZG8yUHMrR2pzd0Y5RW1McXkxZ3UydmFIOVErSFhKRzdl?=
 =?utf-8?B?YzQya2tKZEFKRTZiRjFoM3VtdGUyZkhZZnVXRkZ0Zk45b1NMaEJPc05Ua0VP?=
 =?utf-8?B?Sys2K2R6MVRjT2VZUUJjajMrZGljWFhmS3l1YW9xQm5meER4bGRscXZhV3gr?=
 =?utf-8?B?endDMXJGMEFLV21raU8rL3gvWmxxNlJkZUhBVE40VzBUZHZPZVNqWk50UEUz?=
 =?utf-8?B?M1I0NHIzMzJCNU5CUm55OFo0OElxQzllcmF6UjVBRFU4aVE4MnhoazBMSnNO?=
 =?utf-8?B?TWtTc2Fpd053MW9TLzFINjR1Z3lkU0paRnNGTnJGQ01XZDV0UEFOMmhiRkJS?=
 =?utf-8?B?R0hsbjcwemVFN0wwNEZ5SHNoV2xiakozZVhMaXNxL1B4cTBvbkpJME5YNk55?=
 =?utf-8?B?U1dYM2N3Z3MyYkZRN1lLaWhHcWNWUWJ2a0t3TWtHcTNuUjR5UUgzcnYzWWpP?=
 =?utf-8?B?VWFmUlRhK2dXemtZK1BycmNLYkVKU1U2QUhTdVN3bTU3SGg1WDI3d2FGVlpP?=
 =?utf-8?B?eFRRSER4Wis0bE9XLzJwR204bnB1RXZLVTFQeDBkUVFIQkxoKzA3V0VIVVJT?=
 =?utf-8?B?bHh4UmlGaHR3YUVsUEpLNlowU01kU3NSbStpamU4NzVSM2dPK012a09wZTVT?=
 =?utf-8?B?Mm9kS2JQV2kxZWdDNEpGQ0tsZE56OTdvcTJPam5XNkQrd25tUUFBNE9veWF0?=
 =?utf-8?B?bnh1ZG9uTktvY3dRMFN2WGt2NURmRGgvMVpPblphM1JtQUthaDBpblIrVEZR?=
 =?utf-8?B?c1A1em9EbmtXYXZOb0FQb1ZLS2pKVjVvK1BCRVU4VWR6RnQ0RVluMGE1ZWpJ?=
 =?utf-8?B?ZHYzaXNiNlFMT3lOZkVpT0kvd3F3d0tFKy8yNjE3clQvY0hJVzZVZElndGhl?=
 =?utf-8?B?MW5UZEI2UGdjRk82UlhTMVovVC8vSjZjZ0xDZmlvU2Q5RWt0OCtrWmE5RmN1?=
 =?utf-8?B?Rmw0THAxcnB1bFczSTZlbThscU1OYzhydkdMUDVFNFREeStOalFya2ZTblEw?=
 =?utf-8?B?Rm9uaTZVSEh2RmgvN2Jkb014Vm1tT20vUGJOeGJYT0RSYi9OWmFWdHROaytR?=
 =?utf-8?B?TkkyYm9MWmFrOWNsdk9ybG1RSWs1WklPRG1OV1VHaS9wM3hmMklCc0I5bEVR?=
 =?utf-8?B?OHdGRGxpa2grWldkclBMcHZ0aHFqNGRPUE9EL1ZnQ2xWcUlvRjNUSDJlRE5P?=
 =?utf-8?B?dlJmN1ZTSFMvRGMxandhNTVabEpUTHUybFQ3eGtjd0Z4RlZEMXhtaHl0NGJF?=
 =?utf-8?B?dGcxZXVueXkxNTRQSE1Ua3czbEVuWjgrS2lUZ0pKTzhUNGFJTUpaUGxXL09Q?=
 =?utf-8?B?Wi83QldmclF6MGtSYWZZa05HYnJ2OFlKU0dnTVc4OG9pMkFsZG1VbHZrbkxl?=
 =?utf-8?B?ZlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aecd9ce4-4658-4abf-7cb7-08ddd104593d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6138.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 14:04:36.5273 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zqwU8IPq7nov6YmDnq7aWouaPEREh/u5wTZrap9fN2VuxcPyblvH0mG7PArPCrM1f1CP8442ScgP9SqBKzY+RKFNdFlmqzAeCARNV9FATJs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7204
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on śro [2025-lip-30 19:49:13 +0200]:
> The PF's restart worker shouldn't attempt to resume the device on
> its own, since its goal is to finish PF and VFs reprovisioning on
> the recently reset GuC. Take extra RPM reference while scheduling
> a work and release it from the worker or when we cancel a work.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf.c | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> index 8bc7d7f9f47a..0c9012fb625d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> @@ -53,7 +53,11 @@ static void pf_init_workers(struct xe_gt *gt)
>  
>  static void pf_fini_workers(struct xe_gt *gt)
>  {
> -	disable_work_sync(&gt->sriov.pf.workers.restart);
> +	if (disable_work_sync(&gt->sriov.pf.workers.restart)) {
> +		xe_gt_sriov_dbg_verbose(gt, "pending restart disabled!\n");
> +		/* release a rpm reference taken on the worker behalf */
> +		xe_pm_runtime_put(gt_to_xe(gt));
> +	}
>  }
>  
>  /**
> @@ -205,8 +209,11 @@ static void pf_cancel_restart(struct xe_gt *gt)
>  {
>  	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
>  
> -	if (cancel_work_sync(&gt->sriov.pf.workers.restart))
> +	if (cancel_work_sync(&gt->sriov.pf.workers.restart)) {
>  		xe_gt_sriov_dbg_verbose(gt, "pending restart canceled!\n");
> +		/* release a rpm reference taken on the worker behalf */
> +		xe_pm_runtime_put(gt_to_xe(gt));
> +	}
>  }
>  
>  /**
> @@ -224,9 +231,12 @@ static void pf_restart(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  
> -	xe_pm_runtime_get(xe);
> +	xe_gt_assert(gt, !xe_pm_runtime_suspended(xe));
> +
>  	xe_gt_sriov_pf_config_restart(gt);
>  	xe_gt_sriov_pf_control_restart(gt);
> +
> +	/* release a rpm reference taken on our behalf */
>  	xe_pm_runtime_put(xe);
>  
>  	xe_gt_sriov_dbg(gt, "restart completed\n");
> @@ -245,8 +255,13 @@ static void pf_queue_restart(struct xe_gt *gt)
>  
>  	xe_gt_assert(gt, IS_SRIOV_PF(xe));
>  
> -	if (!queue_work(xe->sriov.wq, &gt->sriov.pf.workers.restart))
> +	/* take a rpm reference on behalf of the worker */
> +	xe_pm_runtime_get_noresume(xe);
> +
> +	if (!queue_work(xe->sriov.wq, &gt->sriov.pf.workers.restart)) {
>  		xe_gt_sriov_dbg(gt, "restart already in queue!\n");
> +		xe_pm_runtime_put(xe);
> +	}
>  }

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

>  
>  /**
> -- 
> 2.47.1
> 

-- 

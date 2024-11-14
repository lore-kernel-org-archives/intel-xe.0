Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7496D6DDD5
	for <intel-xe@archiver.kernel.org>; Fri, 15 Nov 2024 06:39:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7616710E3A2;
	Fri, 15 Nov 2024 06:39:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J4bwpXch";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C37510E3A2
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Nov 2024 06:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731652787; x=1763188787;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=NlXppyj2pJHhTIzI2T8xvNFVzVXxKNVQhnn9a9Bl09I=;
 b=J4bwpXch5Pu4XrDi46wvUQUdwaGJCrxYhH70ie2vQP/pC1raRz1pv8bF
 PDuIWzBukOcfB+Rwubce5NXekOGhdWSP3oC59QJV2XLFnFyHmbznehQVv
 /buitUgDtJVt+glvIEUi8VhGnIAdTJC0HB/EKHjk6ev3/qAHuPQLFhkcs
 VXiY60XFciKT7i1clXlh5PtmoRtxUO04wnUOLLrMPH1X+Rl4FSg87bp3T
 zuU0UkiCooP93zdf3irkAeL+DdanRR1VuCA/UCsZogX6/eueddSJvxH8Y
 +fD8v1oqnfz1tua9HHtGz5dDZwo9yELywmRQtIFhSz2b9DOfWRn44X3aB A==;
X-CSE-ConnectionGUID: tmjiAmvOTWyZgTjD6V83Ew==
X-CSE-MsgGUID: jQnN8+XWQlWjMl01NEDaCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="35392221"
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="35392221"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 13:20:18 -0800
X-CSE-ConnectionGUID: LEWaqMupS/G7ntUGIm8kOA==
X-CSE-MsgGUID: s4txXkydQSu3Bp9d4HhYVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="92406575"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2024 13:20:18 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 14 Nov 2024 13:20:17 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 14 Nov 2024 13:20:17 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 14 Nov 2024 13:20:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pSYN9c6ZifdTPC642t7Q7e8Q9S70vIsyl3720WRJVHQ+qZT0AaaDtu7h3iZJAmr5ghyQTD3Iqu7WUK0drplqM/4mQhcX7OVQBPdTJpTa/cc2dvcOpI8QwN8P7lDZSU7a34S/rgcfTGuQBW9TCA0JDlLPEEkCd/+h+V7rSCbDw2GUpDRRhN+fqHiICNfuyVFxvYDZR6hRlGRReAlr7cA/rRvbOIyR+0XH7Rwf4UueSELB8PycYKew9SnGqcrmdIeIrnq7+Az6c00zP+/H9uWj85yO9I8Fyb+gz9bJh8zU3Nx0IgoeDXlEdq3iwkICHspqPdq7naRds7YX5nWsWK3j0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kgEjsA3ex19J7YA+8d8unas4OO+91FROIk+z/F0EbTU=;
 b=HXVzgqx3WqRT8yGbzO1XO8+4I5WR9QGqV8diOD+mxv/ZRZvagaVc2EMT0PEV3iQXPeDiWF5wh9Zix+Z1wc/JsUwq+yvBesb4c4ZyTeNLsFK7Ve6TOUK9rZoV2cFrhELiB6zwpt+lhTpsydjinQMeXI0nLhThUefYuH/lIXJsYZqn60Kw6NtqweQdNQqi1MYDjvkjTtlzdj9edYtqqzV90N5BeTi6Q/iDGcv0monR5Ok8zQApi+k3hOwvcXymLXzUKM6rHs6HHNvd928xAv8D78UARpk7QSE3cpZRULq78nNU52rRFgzQU0tdEcHw78tMc7XelOQ3/enA+XxDAjkKYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by DS0PR11MB7852.namprd11.prod.outlook.com (2603:10b6:8:fc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Thu, 14 Nov
 2024 21:20:13 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%3]) with mapi id 15.20.8158.013; Thu, 14 Nov 2024
 21:20:13 +0000
Message-ID: <189089b3-561f-4639-9718-e96c098ee96e@intel.com>
Date: Thu, 14 Nov 2024 13:20:11 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/12] drm/xe/pxp: Add spport for PXP-using queues
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240816190024.2176976-1-daniele.ceraolospurio@intel.com>
 <20240816190024.2176976-8-daniele.ceraolospurio@intel.com>
 <63591af8-7d95-44b2-b3c0-3890b850d80b@intel.com>
 <0f0b7b2f-b8c2-457d-bfba-c4311efd2c50@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <0f0b7b2f-b8c2-457d-bfba-c4311efd2c50@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0240.namprd04.prod.outlook.com
 (2603:10b6:303:87::35) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|DS0PR11MB7852:EE_
X-MS-Office365-Filtering-Correlation-Id: 36c4e62f-3fd7-45b9-d419-08dd04f220ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OE5MZUFqbDgvL0R4ZXYzdU52Rzg5LzRHV05MajJLT0xqelBmZlJsZmYxS1Vt?=
 =?utf-8?B?T2s1cWUvNU5RcXZXYzNyUVZ3WGZMdnlZVkthWjhmVWpYL1pyMDZmbTgwQ0I4?=
 =?utf-8?B?akkxc3Q2dEFyd21aSkhiYVVma3ROdVFza2RaaVZyRFJoa2U1VWw1QnR5YlJN?=
 =?utf-8?B?Zmc4eWFMNklrc3RGLzI0dkR5Ly9qOXgwdVVYWTd2azMxNmNTaExFckhsL0dI?=
 =?utf-8?B?U3VYWmVJdkxrbWRDUFZwUlN6NkdOMGMzWmdOT0J5ZDFMcEFFKzBVNmMvd0VJ?=
 =?utf-8?B?dE9TUjhCNko5VTJpaUFPdWQ0cEk1azAwdXM1RFgxTHg0RzNFUGRJVGk1RFVu?=
 =?utf-8?B?VHJRWG5yRVY5cnlVcjBhVmVtUmoyS1BIcTQvQUVIcUJ6VzFQV3B3RnFUTFk1?=
 =?utf-8?B?eUIvK0liRlhtWFZmY2dEYVg2c0JydnlCUkZXbFZseDlzVGE3U1RadW85aHJq?=
 =?utf-8?B?STMrbUUyaTdzU3A5WEpGeUY2NHBSTGxsdzlLRnNUNnFmK0pXSG1ybGpZbGNl?=
 =?utf-8?B?NzlPM1VGcFBmSm5FbVEyVnpEVGZwV2xLdG5IMDdIRFlyZ1U3aFNSMSt2L0Jj?=
 =?utf-8?B?bVNOdDMrZjlyTWFydXdsVXkwM3RmL0orMjlvQzBMY3VNSUNXK0NyQVp5RTZB?=
 =?utf-8?B?V0YzS1hKUkZxa3R3RmZGTG1jTGdiWHZ2QlFLNGR1WmZqTXM4MWNUSlZydUo3?=
 =?utf-8?B?RExzUyszNFVLUVI3MWh1cjE2STYvNWk0cjZjcWllTTljOUpzNHhGTlVUcThW?=
 =?utf-8?B?SnJvRjYyMXNuZWFrYzlJUS8vYVN6d3d3WUNPZVo2RHlHRWJ1dC9BM25tMTR4?=
 =?utf-8?B?Y0NHMFdPNU94Y3BLL29uMUxRdmlrNXowczloWXR2UitubHJhRjRzWk9NT1Z5?=
 =?utf-8?B?OGxYWDZpYlFhZ096d3l3bTRLOFBZZWgwQVI2Vzh2M0FyOUJsSWRtSjhNUitw?=
 =?utf-8?B?UTB3dW1la3N6UnJsNXVmZGpoYXNsbTNGc01mdTU4OE5LQ01wcUNsMExxOGY1?=
 =?utf-8?B?endYdG1TMy9kWWVJZE1wdEQ1MTZFMjM2VlkwUzVTRnlCKzJJWG1KT21zbFBT?=
 =?utf-8?B?eHUwWVh3SWJTOHJPMnJsNituNU9oT0JEMTZZbHFwVmM5T3hGVVlBbjN3K3ZT?=
 =?utf-8?B?MjVremFTd2pTcmdld1IrYmlIeXlXTE5kQXZXbjhteVFJVlZyVlFwS1lHajBT?=
 =?utf-8?B?Q0dUcHhpTk11VEdVOVEvWE93Qkx3enQzOUJZS3lNLzVZdkVXVWZ3RlRESmor?=
 =?utf-8?B?VkZnbk5BNjJOYUZHZEJTMUpLL0p4eVN0Y3NtRkxEL0Zwc0RjL0dvK2JObWFY?=
 =?utf-8?B?NGFIeEpCQTVSYzJhcmlLMHNCNGNUb29GeG5TdFRVWDZzSjNOL3F4MEY4b3hI?=
 =?utf-8?B?MS91WHhtYTlndXlYZlJ0d2d3UmhkVjJqK3VIQjFzNjUyM2ZKREtwekFkeHNM?=
 =?utf-8?B?aStKYmFxekZyRE5LNXhHdUliNytuVGg1b0tNZXdKQ2I3S2tZMzdHbE9JbTV3?=
 =?utf-8?B?MkRkNnphc1EyV0ppdlF5TmhWakYxQlloUlAxSWV2T0lnMEp1ZWNLQkJjZFdC?=
 =?utf-8?B?VWVzNWpQd2tjWGZpbHFGNEx4dWhCbm96Zm9SRXBwbTNzaE1uQ2l1R1NydndI?=
 =?utf-8?B?alErN0x5UmFYK09qTnJZOG96Z09FT1Ixb1Zja2tCd3FoWG5XVkZDZ0JQalE5?=
 =?utf-8?Q?svd/Mv7EzmrD2lHh3etD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHJDdDV2Z0ZsNUphdkN0YzE1N1lvYjUyMkFpQlJZU1Z5QXFhWS9iVEV3LzU5?=
 =?utf-8?B?WmZITzNkMWZzb3ozMTJicTJKWjFtbldWak95aWFqVGo3ZUJwTmtxZHd3blpN?=
 =?utf-8?B?VVdHRnNYeXRmUkZXd08wWGpxTlZDNE9LWXlKZXE1VkYxMnlyWDRvLzRKVi93?=
 =?utf-8?B?Tmt6T3QvTXczWE1GZnl3L0U4WWNYaHZhV2E5QkMzYU5ERWorb0lJM0ZscjdT?=
 =?utf-8?B?UkxhSXU3VmxYWHk0UWM5a3JpNVMwVWNUNXlNVzdDUlovNksrWnVFcGU1SE5j?=
 =?utf-8?B?cnFtL21mdi9WejdrWW9DejhxSHpXVlhqMmVIQnpiWnNPMjdQUVgyQkMzVmhR?=
 =?utf-8?B?S2dZZlZNTFhoemhBSFRXOUwxQ2RZMjRTdnJvZVo3YzZ5REZOZDBmQldDQVZy?=
 =?utf-8?B?azNyL2RXajhXZlVWNnNYemhNK25ITmpDZ1V3aDI5UVRmZzFWS0VXK2grbTJt?=
 =?utf-8?B?ZEsyRHI4QnhCWkFLTFUybFptT0VXTklWU3JDQ2srV2JNdTZQWG5NdEx0dVVQ?=
 =?utf-8?B?YlJ3WCtheE9MWCtWTW5xOEM3a3RBamNBNm96aGJXVlB0YlBaUkE4SllxRy9o?=
 =?utf-8?B?NXRmL0JZMDlLVXNTWVBaOU5tT3VGZWpOZ2dRWUROZmttMVFsbGpaQlNwWnd4?=
 =?utf-8?B?ZTVOYk5YeTQ1NUNPa3MxQXg0TDk3S2xOU2Q2VFlLeG4wWjhFMUVZdmVOWExP?=
 =?utf-8?B?Q0R1aFRxV2J4T3kwZGpBQm9HNXBVTnZvZEl4dGFjZlhUeXlQZ0pQUURoZmVC?=
 =?utf-8?B?MGpjdWgzY2FzRXNVWFVWdkh5SUFZeXJrVFlwQnVobnloQjRaWjd4UlJNbklk?=
 =?utf-8?B?a1EyQ3QvUVVSTURFYXlhNi8weGlxQklNMkk2SWlJejdwL210Ynk5ZFZKWXVY?=
 =?utf-8?B?NUgrdjZySEczQjBLZE4xRU9DSjF3VVdjZXB5eUFqS2laVHNzQ0x5YjlhZ2Rw?=
 =?utf-8?B?TmpLZ3RMcXZtbythaktRQndZS0NMYzN1cGVZME41VkRUTk9WeWFYbjJJbWNO?=
 =?utf-8?B?UnhoSGVYS1l3aFFqUm9YSkFXd2ZqWGZnc25iNlRBQU1Vc0daSmR4Zktnck9Q?=
 =?utf-8?B?TUxTYUU4MzEwWjd4N2JVbUFBbDNFVm02SDFLT05TL0JZRHNGaGdjVE10eUZq?=
 =?utf-8?B?dXRCVWlGZWpQblFvSmlFNkJaRm9aRnZBT3Q5d21MSVBWN1B3K0x1c1cwcnB0?=
 =?utf-8?B?dXJLL2MxNVBydzBxazBSc2ZXcEl1cGpwbUVOcGo4ckc4RTdTdDVQQ1dpTUEz?=
 =?utf-8?B?cjgyeENiZ2IxWnovckp5UnlWaCtJbjhpbnNPR2dVVm04d0tmV1ozdTJLQ1FQ?=
 =?utf-8?B?bUhGVTVwNjFDTUV0TjBOd0lOc0RHeWFjU21iUlB0U3JibEFMSGdaVGM5VFFN?=
 =?utf-8?B?UkNralJBaDVTMkY3dEJ1NFN3ZmdWbDhiWnhsVmRCRjhTeFFNZ3JJendUUEJ6?=
 =?utf-8?B?OTZ0dXh1dVY5U0lraFZPWlZKUjBHL3V1ZjhWYS8rMStaK0NWelpWRG16ZElZ?=
 =?utf-8?B?T0dISEFZZmlTaTMrTFlOOHA2LzFIeGNWZzg2UzdJakR3NVFHYTNKMVFLT2FT?=
 =?utf-8?B?MTBoRHhyNDJCR3phajBpUmd4cXJOTjNVTWpoSDgrMXFkZitwRU1vVEVWZmFq?=
 =?utf-8?B?VHBHNXlrZ2hYL0Z0am8rQ0pJcnNWcDdoNzlpU2R0MW0rd0NiY1NJMkVzdFpO?=
 =?utf-8?B?YXpjNktVYWJpMHVVMHE1MkZYUHl5WlpBZHBWK1NvNGpubm1SNmVhZGRRSm5w?=
 =?utf-8?B?eVNIdHRraXU4cm5TSmhxVUNaNUEzNzM5WktSU3ptQVN4RkpnVi9CbVB0cmVw?=
 =?utf-8?B?VkRLcnZzRUpiUWVNZ1h4Umd4RU9saFgxdFBROVlQUnRFa21kWmxYTlBoaHRz?=
 =?utf-8?B?VWdzSGZnd0V3UDhaS2RtQUFXVTRLVTF3aE5EY2dEdXA5MFpkWjhpUDZiZDZp?=
 =?utf-8?B?YjByVWdnOENHcXArZ1lSUTBRbDhQZStVYU5qRFd6eElHVXlPVFkrRjRYajYv?=
 =?utf-8?B?ZXpoK05ZMExvalRnb3VNdzU2blpVMFppM1RGNHlJOXpCdUJCSGtmTzczVjNB?=
 =?utf-8?B?VGM3UjV3U0QrVGFTZmE0d01OdFQ3Q25vUDlKVGM0Z0lFNC9NeUxHaEJMUXZ1?=
 =?utf-8?B?K1VyOFI3U05iWjBBQnZDWTBZZ3p3QlJKeTJCWFN0M2hEZGx6VjR5VHE5eUdo?=
 =?utf-8?B?amc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 36c4e62f-3fd7-45b9-d419-08dd04f220ca
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 21:20:13.6908 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FaNumuw696WQBjM9E6smKXwEBn2icAF1lwjBX1SkyF9aSpVariK7DMtpHGSEKkIFxOmrQUnIv4BYoRtc8SvB55iXuHUBBzmfxFFhmNfK2Ls=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7852
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

On 11/7/2024 15:57, Daniele Ceraolo Spurio wrote:
> On 10/8/2024 4:55 PM, John Harrison wrote:
>> On 8/16/2024 12:00, Daniele Ceraolo Spurio wrote:
>>> Userspace is required to mark a queue as using PXP to guarantee that 
>>> the
>>> PXP instructions will work. When a PXP queue is created, the driver 
>>> will
>>> do the following:
>>> - Start the default PXP session if it is not already running;
>>> - set the relevant bits in the context control register;
>>> - assign an rpm ref to the queue to keep for its lifetime (this is
>>>    required because PXP HWDRM sessions are killed by the HW suspend 
>>> flow).
>>>
>>> When a PXP invalidation occurs, all the PXP queue will be killed.
>> "all the PXP queue" -> should be 'queues' or should not say 'all'?
>>
>>> On submission of a valid PXP queue, the driver will validate all
>>> encrypted objects mapped to the VM to ensured they were encrypted with
>>> the current key.
>>>
>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/regs/xe_engine_regs.h |   1 +
>>>   drivers/gpu/drm/xe/xe_exec_queue.c       |  58 ++++-
>>>   drivers/gpu/drm/xe/xe_exec_queue.h       |   5 +
>>>   drivers/gpu/drm/xe/xe_exec_queue_types.h |   8 +
>>>   drivers/gpu/drm/xe/xe_hw_engine.c        |   2 +-
>>>   drivers/gpu/drm/xe/xe_lrc.c              |  16 +-
>>>   drivers/gpu/drm/xe/xe_lrc.h              |   4 +-
>>>   drivers/gpu/drm/xe/xe_pxp.c              | 295 
>>> ++++++++++++++++++++++-
>>>   drivers/gpu/drm/xe/xe_pxp.h              |   7 +
>>>   drivers/gpu/drm/xe/xe_pxp_submit.c       |   4 +-
>>>   drivers/gpu/drm/xe/xe_pxp_types.h        |  26 ++
>>>   include/uapi/drm/xe_drm.h                |  40 ++-
>>>   12 files changed, 450 insertions(+), 16 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h 
>>> b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>>> index 81b71903675e..3692e887f503 100644
>>> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>>> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>>> @@ -130,6 +130,7 @@
>>>   #define RING_EXECLIST_STATUS_HI(base)        XE_REG((base) + 0x234 
>>> + 4)
>>>     #define RING_CONTEXT_CONTROL(base)        XE_REG((base) + 0x244, 
>>> XE_REG_OPTION_MASKED)
>>> +#define      CTX_CTRL_PXP_ENABLE            REG_BIT(10)
>>>   #define      CTX_CTRL_OAC_CONTEXT_ENABLE        REG_BIT(8)
>>>   #define      CTX_CTRL_RUN_ALONE            REG_BIT(7)
>>>   #define      CTX_CTRL_INDIRECT_RING_STATE_ENABLE REG_BIT(4)
>>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c 
>>> b/drivers/gpu/drm/xe/xe_exec_queue.c
>>> index e98e8794eddf..504ba4aa2357 100644
>>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>>> @@ -22,6 +22,8 @@
>>>   #include "xe_ring_ops_types.h"
>>>   #include "xe_trace.h"
>>>   #include "xe_vm.h"
>>> +#include "xe_pxp.h"
>>> +#include "xe_pxp_types.h"
>>>     enum xe_exec_queue_sched_prop {
>>>       XE_EXEC_QUEUE_JOB_TIMEOUT = 0,
>>> @@ -35,6 +37,8 @@ static int exec_queue_user_extensions(struct 
>>> xe_device *xe, struct xe_exec_queue
>>>     static void __xe_exec_queue_free(struct xe_exec_queue *q)
>>>   {
>>> +    if (xe_exec_queue_uses_pxp(q))
>>> +        xe_pxp_exec_queue_remove(gt_to_xe(q->gt)->pxp, q);
>>>       if (q->vm)
>>>           xe_vm_put(q->vm);
>>>   @@ -73,6 +77,7 @@ static struct xe_exec_queue 
>>> *__xe_exec_queue_alloc(struct xe_device *xe,
>>>       q->ops = gt->exec_queue_ops;
>>>       INIT_LIST_HEAD(&q->lr.link);
>>>       INIT_LIST_HEAD(&q->multi_gt_link);
>>> +    INIT_LIST_HEAD(&q->pxp.link);
>>>         q->sched_props.timeslice_us = 
>>> hwe->eclass->sched_props.timeslice_us;
>>>       q->sched_props.preempt_timeout_us =
>>> @@ -107,6 +112,21 @@ static int __xe_exec_queue_init(struct 
>>> xe_exec_queue *q)
>>>   {
>>>       struct xe_vm *vm = q->vm;
>>>       int i, err;
>>> +    u32 flags = 0;
>>> +
>>> +    /*
>>> +     * PXP workloads executing on RCS or CCS must run in isolation 
>>> (i.e. no
>>> +     * other workload can use the EUs at the same time). On MTL 
>>> this is done
>>> +     * by setting the RUNALONE bit in the LRC, while starting on 
>>> Xe2 there
>>> +     * is a dedicated bit for it.
>>> +     */
>>> +    if (xe_exec_queue_uses_pxp(q) &&
>>> +        (q->class == XE_ENGINE_CLASS_RENDER || q->class == 
>>> XE_ENGINE_CLASS_COMPUTE)) {
>>> +        if (GRAPHICS_VER(gt_to_xe(q->gt)) >= 20)
>>> +            flags |= XE_LRC_CREATE_PXP;
>>> +        else
>>> +            flags |= XE_LRC_CREATE_RUNALONE;
>>> +    }
>>>         if (vm) {
>>>           err = xe_vm_lock(vm, true);
>>> @@ -115,7 +135,7 @@ static int __xe_exec_queue_init(struct 
>>> xe_exec_queue *q)
>>>       }
>>>         for (i = 0; i < q->width; ++i) {
>>> -        q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K);
>>> +        q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K, flags);
>>>           if (IS_ERR(q->lrc[i])) {
>>>               err = PTR_ERR(q->lrc[i]);
>>>               goto err_unlock;
>>> @@ -160,6 +180,17 @@ struct xe_exec_queue 
>>> *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *v
>>>       if (err)
>>>           goto err_post_alloc;
>>>   +    /*
>>> +     * we can only add the queue to the PXP list after the init is 
>>> complete,
>>> +     * because the PXP termination can call exec_queue_kill and 
>>> that will
>>> +     * go bad if the queue is only half-initialized.
>>> +     */
>> Not following how this comment relates to this code block. The 
>> comment implies there should be a wait of some kind.
>
> We set the PXP type for the queue as part of the extension handling in 
> __xe_exec_queue_alloc. This comment was supposed to indicate that we 
> can't add the queue to the list back there because the init is not 
> complete yet, so we do it here instead. I'll add the explanation about 
> the extension handling to the comment.
>
>>
>>> +    if (xe_exec_queue_uses_pxp(q)) {
>>> +        err = xe_pxp_exec_queue_add(xe->pxp, q);
>>> +        if (err)
>>> +            goto err_post_alloc;
>>> +    }
>>> +
>>>       return q;
>>>     err_post_alloc:
>>> @@ -197,6 +228,9 @@ void xe_exec_queue_destroy(struct kref *ref)
>>>       struct xe_exec_queue *q = container_of(ref, struct 
>>> xe_exec_queue, refcount);
>>>       struct xe_exec_queue *eq, *next;
>>>   +    if (xe_exec_queue_uses_pxp(q))
>>> +        xe_pxp_exec_queue_remove(gt_to_xe(q->gt)->pxp, q);
>>> +
>>>       xe_exec_queue_last_fence_put_unlocked(q);
>>>       if (!(q->flags & EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD)) {
>>>           list_for_each_entry_safe(eq, next, &q->multi_gt_list,
>>> @@ -343,6 +377,24 @@ static int exec_queue_set_timeslice(struct 
>>> xe_device *xe, struct xe_exec_queue *
>>>       return 0;
>>>   }
>>>   +static int
>>> +exec_queue_set_pxp_type(struct xe_device *xe, struct xe_exec_queue 
>>> *q, u64 value)
>>> +{
>>> +    BUILD_BUG_ON(DRM_XE_PXP_TYPE_NONE != 0);
>> Why a build bug for something that is a simple 'enum { X=0 }'? It's 
>> not like there is some complex macro calculation that could be broken 
>> by some seemingly unrelated change.
>
> This was more to make sure that the default value for the extension 
> was 0. Given that this is UAPI and therefore can't change anyway, I'll 
> drop the BUG_ON
>
>>
>>> +
>>> +    if (value == DRM_XE_PXP_TYPE_NONE)
>>> +        return 0;
>> This doesn't need to shut any existing PXP down? Is it not possible 
>> to dynamically change the type?
>
> No, this can only be set at queue creation time
Would be good to add a comment about that? Maybe even an assert or 
something to ensure this is not called post creation?


>
>>
>>> +
>>> +    if (!xe_pxp_is_enabled(xe->pxp))
>>> +        return -ENODEV;
>>> +
>>> +    /* we only support HWDRM sessions right now */
>>> +    if (XE_IOCTL_DBG(xe, value != DRM_XE_PXP_TYPE_HWDRM))
>>> +        return -EINVAL;
>>> +
>>> +    return xe_pxp_exec_queue_set_type(xe->pxp, q, 
>>> DRM_XE_PXP_TYPE_HWDRM);
>>> +}
>>> +
>>>   typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
>>>                            struct xe_exec_queue *q,
>>>                            u64 value);
>>> @@ -350,6 +402,7 @@ typedef int 
>>> (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
>>>   static const xe_exec_queue_set_property_fn 
>>> exec_queue_set_property_funcs[] = {
>>>       [DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY] = 
>>> exec_queue_set_priority,
>>>       [DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE] = 
>>> exec_queue_set_timeslice,
>>> +    [DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE] = 
>>> exec_queue_set_pxp_type,
>>>   };
>>>     static int exec_queue_user_ext_set_property(struct xe_device *xe,
>>> @@ -369,7 +422,8 @@ static int 
>>> exec_queue_user_ext_set_property(struct xe_device *xe,
>>>                ARRAY_SIZE(exec_queue_set_property_funcs)) ||
>>>           XE_IOCTL_DBG(xe, ext.pad) ||
>>>           XE_IOCTL_DBG(xe, ext.property != 
>>> DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY &&
>>> -             ext.property != 
>>> DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE))
>>> +             ext.property != 
>>> DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE &&
>>> +             ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE))
>>>           return -EINVAL;
>>>         idx = array_index_nospec(ext.property, 
>>> ARRAY_SIZE(exec_queue_set_property_funcs));
>>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h 
>>> b/drivers/gpu/drm/xe/xe_exec_queue.h
>>> index ded77b0f3b90..7fa97719667a 100644
>>> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
>>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
>>> @@ -53,6 +53,11 @@ static inline bool 
>>> xe_exec_queue_is_parallel(struct xe_exec_queue *q)
>>>       return q->width > 1;
>>>   }
>>>   +static inline bool xe_exec_queue_uses_pxp(struct xe_exec_queue *q)
>>> +{
>>> +    return q->pxp.type;
>>> +}
>>> +
>>>   bool xe_exec_queue_is_lr(struct xe_exec_queue *q);
>>>     bool xe_exec_queue_ring_full(struct xe_exec_queue *q);
>>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h 
>>> b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>>> index 1408b02eea53..28b56217f1df 100644
>>> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>>> @@ -130,6 +130,14 @@ struct xe_exec_queue {
>>>           spinlock_t lock;
>>>       } lr;
>>>   +    /** @pxp: PXP info tracking */
>>> +    struct {
>>> +        /** @pxp.type: PXP session type used by this queue */
>>> +        u8 type;
>>> +        /** @pxp.link: link into the list of PXP exec queues */
>>> +        struct list_head link;
>>> +    } pxp;
>>> +
>>>       /** @ops: submission backend exec queue operations */
>>>       const struct xe_exec_queue_ops *ops;
>>>   diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c 
>>> b/drivers/gpu/drm/xe/xe_hw_engine.c
>>> index e195022ca836..469932e7d7a6 100644
>>> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>>> @@ -557,7 +557,7 @@ static int hw_engine_init(struct xe_gt *gt, 
>>> struct xe_hw_engine *hwe,
>>>           goto err_name;
>>>       }
>>>   -    hwe->kernel_lrc = xe_lrc_create(hwe, NULL, SZ_16K);
>>> +    hwe->kernel_lrc = xe_lrc_create(hwe, NULL, SZ_16K, 0);
>>>       if (IS_ERR(hwe->kernel_lrc)) {
>>>           err = PTR_ERR(hwe->kernel_lrc);
>>>           goto err_hwsp;
>>> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>>> index 974a9cd8c379..4f3e676db646 100644
>>> --- a/drivers/gpu/drm/xe/xe_lrc.c
>>> +++ b/drivers/gpu/drm/xe/xe_lrc.c
>>> @@ -893,7 +893,7 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
>>>   #define PVC_CTX_ACC_CTR_THOLD    (0x2a + 1)
>>>     static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine 
>>> *hwe,
>>> -               struct xe_vm *vm, u32 ring_size)
>>> +               struct xe_vm *vm, u32 ring_size, u32 init_flags)
>>>   {
>>>       struct xe_gt *gt = hwe->gt;
>>>       struct xe_tile *tile = gt_to_tile(gt);
>>> @@ -981,6 +981,16 @@ static int xe_lrc_init(struct xe_lrc *lrc, 
>>> struct xe_hw_engine *hwe,
>>>                        RING_CTL_SIZE(lrc->ring.size) | RING_VALID);
>>>       }
>>>   +    if (init_flags & XE_LRC_CREATE_RUNALONE)
>>> +        xe_lrc_write_ctx_reg(lrc, CTX_CONTEXT_CONTROL,
>>> +                     xe_lrc_read_ctx_reg(lrc, CTX_CONTEXT_CONTROL) |
>>> +                     _MASKED_BIT_ENABLE(CTX_CTRL_RUN_ALONE));
>>> +
>>> +    if (init_flags & XE_LRC_CREATE_PXP)
>>> +        xe_lrc_write_ctx_reg(lrc, CTX_CONTEXT_CONTROL,
>>> +                     xe_lrc_read_ctx_reg(lrc, CTX_CONTEXT_CONTROL) |
>>> + _MASKED_BIT_ENABLE(CTX_CTRL_PXP_ENABLE));
>>> +
>>>       xe_lrc_write_ctx_reg(lrc, CTX_TIMESTAMP, 0);
>>>         if (xe->info.has_asid && vm)
>>> @@ -1029,7 +1039,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, 
>>> struct xe_hw_engine *hwe,
>>>    * upon failure.
>>>    */
>>>   struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct 
>>> xe_vm *vm,
>>> -                 u32 ring_size)
>>> +                 u32 ring_size, u32 flags)
>>>   {
>>>       struct xe_lrc *lrc;
>>>       int err;
>>> @@ -1038,7 +1048,7 @@ struct xe_lrc *xe_lrc_create(struct 
>>> xe_hw_engine *hwe, struct xe_vm *vm,
>>>       if (!lrc)
>>>           return ERR_PTR(-ENOMEM);
>>>   -    err = xe_lrc_init(lrc, hwe, vm, ring_size);
>>> +    err = xe_lrc_init(lrc, hwe, vm, ring_size, flags);
>>>       if (err) {
>>>           kfree(lrc);
>>>           return ERR_PTR(err);
>>> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
>>> index d411c3fbcbc6..cc8091bba2a0 100644
>>> --- a/drivers/gpu/drm/xe/xe_lrc.h
>>> +++ b/drivers/gpu/drm/xe/xe_lrc.h
>>> @@ -23,8 +23,10 @@ struct xe_vm;
>>>   #define LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR (0x34 * 4)
>>>   #define LRC_PPHWSP_PXP_INVAL_SCRATCH_ADDR (0x40 * 4)
>>>   +#define XE_LRC_CREATE_RUNALONE 0x1
>>> +#define XE_LRC_CREATE_PXP 0x2
>>>   struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct 
>>> xe_vm *vm,
>>> -                 u32 ring_size);
>>> +                 u32 ring_size, u32 flags);
>>>   void xe_lrc_destroy(struct kref *ref);
>>>     /**
>>> diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
>>> index 382eb0cb0018..acdc25c8e8a1 100644
>>> --- a/drivers/gpu/drm/xe/xe_pxp.c
>>> +++ b/drivers/gpu/drm/xe/xe_pxp.c
>>> @@ -6,11 +6,17 @@
>>>   #include "xe_pxp.h"
>>>     #include <drm/drm_managed.h>
>>> +#include <drm/xe_drm.h>
>>>     #include "xe_device_types.h"
>>> +#include "xe_exec_queue.h"
>>> +#include "xe_exec_queue_types.h"
>>>   #include "xe_force_wake.h"
>>> +#include "xe_guc_submit.h"
>>> +#include "xe_gsc_proxy.h"
>>>   #include "xe_gt.h"
>>>   #include "xe_gt_types.h"
>>> +#include "xe_huc.h"
>>>   #include "xe_mmio.h"
>>>   #include "xe_pm.h"
>>>   #include "xe_pxp_submit.h"
>>> @@ -27,18 +33,45 @@
>>>    * integrated parts.
>>>    */
>>>   -#define ARB_SESSION 0xF /* TODO: move to UAPI */
>>> +#define ARB_SESSION DRM_XE_PXP_HWDRM_DEFAULT_SESSION /* shorter 
>>> define */
>> Is this really worthwhile?
>
> The define is used enough time in this file that IMO it's worth having 
> a shorter version for redability
>
>>
>>>     bool xe_pxp_is_supported(const struct xe_device *xe)
>>>   {
>>>       return xe->info.has_pxp && 
>>> IS_ENABLED(CONFIG_INTEL_MEI_GSC_PROXY);
>>>   }
>>>   -static bool pxp_is_enabled(const struct xe_pxp *pxp)
>>> +bool xe_pxp_is_enabled(const struct xe_pxp *pxp)
>>>   {
>>>       return pxp;
>>>   }
>>>   +static bool pxp_prerequisites_done(const struct xe_pxp *pxp)
>>> +{
>>> +    bool ready;
>>> +
>>> +    XE_WARN_ON(xe_force_wake_get(gt_to_fw(pxp->gt), XE_FW_GSC));
>> Again, why warn on this fw and then proceed anyway when others 
>> silently return an error code to the layer above?
>
> In this case because I wanted to have this function return a bool, so 
> can't escalate the error. In the unlikely case that this fails, the 
> caller will consider PXP not ready, which will be escalated out. If 
> forcewake doesn't work the GT is non-functional anyway, so reporting 
> PXP not ready it's not going to make things worse.
As per other comment, note that the fw_get return type has changed for 
both here and below.

>
>>
>>> +
>>> +    /* PXP requires both HuC authentication via GSC and GSC proxy 
>>> initialized */
>>> +    ready = xe_huc_is_authenticated(&pxp->gt->uc.huc, 
>>> XE_HUC_AUTH_VIA_GSC) &&
>>> +        xe_gsc_proxy_init_done(&pxp->gt->uc.gsc);
>>> +
>>> +    xe_force_wake_put(gt_to_fw(pxp->gt), XE_FW_GSC);
>>> +
>>> +    return ready;
>>> +}
>>> +
>>> +static bool pxp_session_is_in_play(struct xe_pxp *pxp, u32 id)
>>> +{
>>> +    struct xe_gt *gt = pxp->gt;
>>> +    u32 sip = 0;
>>> +
>>> +    XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
>> Same as above.
>
> Same reasoning, just that we'll report that PXP failed to start if 
> this fails, which again it's not going to make things worse if the GT 
> is broken.
>
>>
>>> +    sip = xe_mmio_read32(gt, KCR_SIP);
>>> +    xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>>> +
>>> +    return sip & BIT(id);
>>> +}
>>> +
>>>   static int pxp_wait_for_session_state(struct xe_pxp *pxp, u32 id, 
>>> bool in_play)
>>>   {
>>>       struct xe_gt *gt = pxp->gt;
>>> @@ -56,12 +89,30 @@ static int pxp_wait_for_session_state(struct 
>>> xe_pxp *pxp, u32 id, bool in_play)
>>>       return ret;
>>>   }
>>>   +static void pxp_invalidate_queues(struct xe_pxp *pxp);
>>> +
>>>   static void pxp_terminate(struct xe_pxp *pxp)
>>>   {
>>>       int ret = 0;
>>>       struct xe_device *xe = pxp->xe;
>>>       struct xe_gt *gt = pxp->gt;
>> Should add a "lockdep_assert_held(pxp->mutex)" here?
>
> I'll add it in
>
>>
>>>   +    pxp_invalidate_queues(pxp);
>>> +
>>> +    /*
>>> +     * If we have a termination already in progress, we need to 
>>> wait for
>>> +     * it to complete before queueing another one. We update the state
>>> +     * to signal that another termination is required and leave it 
>>> to the
>>> +     * pxp_start() call to take care of it.
>>> +     */
>>> +    if (!completion_done(&pxp->termination)) {
>>> +        pxp->status = XE_PXP_NEEDS_TERMINATION;
>>> +        return;
>>> +    }
>>> +
>>> +    reinit_completion(&pxp->termination);
>>> +    pxp->status = XE_PXP_TERMINATION_IN_PROGRESS;
>>> +
>>>       drm_dbg(&xe->drm, "Terminating PXP\n");
>>>         /* terminate the hw session */
>>> @@ -82,13 +133,32 @@ static void pxp_terminate(struct xe_pxp *pxp)
>>>       ret = xe_pxp_submit_session_invalidation(&pxp->gsc_res, 
>>> ARB_SESSION);
>>>     out:
>>> -    if (ret)
>>> +    if (ret) {
>>>           drm_err(&xe->drm, "PXP termination failed: %pe\n", 
>>> ERR_PTR(ret));
>>> +        pxp->status = XE_PXP_ERROR;
>>> +        complete_all(&pxp->termination);
>>> +    }
>>>   }
>>>     static void pxp_terminate_complete(struct xe_pxp *pxp)
>>>   {
>>> -    /* TODO mark the session as ready to start */
>>> +    /*
>>> +     * We expect PXP to be in one of 2 states when we get here:
>>> +     * - XE_PXP_TERMINATION_IN_PROGRESS: a single termination event 
>>> was
>>> +     * requested and it is now completing, so we're ready to start.
>>> +     * - XE_PXP_NEEDS_TERMINATION: a second termination was 
>>> requested while
>>> +     * the first one was still being processed; we don't update the 
>>> state
>>> +     * in this case so the pxp_start code will automatically issue 
>>> that
>>> +     * second termination.
>>> +     */
>>> +    if (pxp->status == XE_PXP_TERMINATION_IN_PROGRESS)
>>> +        pxp->status = XE_PXP_READY_TO_START;
>>> +    else if (pxp->status != XE_PXP_NEEDS_TERMINATION)
>>> +        drm_err(&pxp->xe->drm,
>>> +            "PXP termination complete while status was %u\n",
>>> +            pxp->status);
>>> +
>>> +    complete_all(&pxp->termination);
>>>   }
>>>     static void pxp_irq_work(struct work_struct *work)
>>> @@ -112,6 +182,8 @@ static void pxp_irq_work(struct work_struct *work)
>>>       if ((events & PXP_TERMINATION_REQUEST) && 
>>> !xe_pm_runtime_get_if_active(xe))
>>>           return;
>>>   +    mutex_lock(&pxp->mutex);
>>> +
>>>       if (events & PXP_TERMINATION_REQUEST) {
>>>           events &= ~PXP_TERMINATION_COMPLETE;
>>>           pxp_terminate(pxp);
>>> @@ -120,6 +192,8 @@ static void pxp_irq_work(struct work_struct *work)
>>>       if (events & PXP_TERMINATION_COMPLETE)
>>>           pxp_terminate_complete(pxp);
>>>   +    mutex_unlock(&pxp->mutex);
>>> +
>>>       if (events & PXP_TERMINATION_REQUEST)
>>>           xe_pm_runtime_put(xe);
>>>   }
>>> @@ -133,7 +207,7 @@ void xe_pxp_irq_handler(struct xe_device *xe, 
>>> u16 iir)
>>>   {
>>>       struct xe_pxp *pxp = xe->pxp;
>>>   -    if (!pxp_is_enabled(pxp)) {
>>> +    if (!xe_pxp_is_enabled(pxp)) {
>>>           drm_err(&xe->drm, "PXP irq 0x%x received with PXP 
>>> disabled!\n", iir);
>>>           return;
>>>       }
>>> @@ -230,10 +304,22 @@ int xe_pxp_init(struct xe_device *xe)
>>>       if (!pxp)
>>>           return -ENOMEM;
>>>   +    INIT_LIST_HEAD(&pxp->queues.list);
>>> +    spin_lock_init(&pxp->queues.lock);
>>>       INIT_WORK(&pxp->irq.work, pxp_irq_work);
>>>       pxp->xe = xe;
>>>       pxp->gt = gt;
>>>   +    /*
>>> +     * we'll use the completion to check if there is a termination 
>>> pending,
>>> +     * so we start it as completed and we reinit it when a termination
>>> +     * is triggered.
>>> +     */
>>> +    init_completion(&pxp->termination);
>>> +    complete_all(&pxp->termination);
>>> +
>>> +    mutex_init(&pxp->mutex);
>>> +
>>>       pxp->irq.wq = alloc_ordered_workqueue("pxp-wq", 0);
>>>       if (!pxp->irq.wq)
>>>           return -ENOMEM;
>>> @@ -256,3 +342,202 @@ int xe_pxp_init(struct xe_device *xe)
>>>       destroy_workqueue(pxp->irq.wq);
>>>       return err;
>>>   }
>>> +
>>> +static int __pxp_start_arb_session(struct xe_pxp *pxp)
>>> +{
>>> +    int ret;
>>> +
>>> +    if (pxp_session_is_in_play(pxp, ARB_SESSION))
>>> +        return -EEXIST;
>>> +
>>> +    ret = xe_pxp_submit_session_init(&pxp->gsc_res, ARB_SESSION);
>>> +    if (ret) {
>>> +        drm_err(&pxp->xe->drm, "Failed to init PXP arb session\n");
>>> +        goto out;
>>> +    }
>>> +
>>> +    ret = pxp_wait_for_session_state(pxp, ARB_SESSION, true);
>>> +    if (ret) {
>>> +        drm_err(&pxp->xe->drm, "PXP ARB session failed to go in 
>>> play\n");
>>> +        goto out;
>>> +    }
>>> +
>>> +    drm_dbg(&pxp->xe->drm, "PXP ARB session is active\n");
>>> +
>>> +out:
>>> +    if (!ret)
>>> +        pxp->status = XE_PXP_ACTIVE;
>>> +    else
>>> +        pxp->status = XE_PXP_ERROR;
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> +/**
>>> + * xe_pxp_exec_queue_set_type - Mark a queue as using PXP
>>> + * @pxp: the xe->pxp pointer (it will be NULL if PXP is disabled)
>>> + * @q: the queue to mark as using PXP
>>> + * @type: the type of PXP session this queue will use
>>> + *
>>> + * Returns 0 if the selected PXP type is supported, -ENODEV otherwise.
>>> + */
>>> +int xe_pxp_exec_queue_set_type(struct xe_pxp *pxp, struct 
>>> xe_exec_queue *q, u8 type)
>>> +{
>>> +    if (!xe_pxp_is_enabled(pxp))
>>> +        return -ENODEV;
>>> +
>>> +    /* we only support HWDRM sessions right now */
>>> +    xe_assert(pxp->xe, type == DRM_XE_PXP_TYPE_HWDRM);
>>> +
>>> +    q->pxp.type = type;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +/**
>>> + * xe_pxp_exec_queue_add - add a queue to the PXP list
>>> + * @pxp: the xe->pxp pointer (it will be NULL if PXP is disabled)
>>> + * @q: the queue to add to the list
>>> + *
>>> + * If PXP is enabled and the prerequisites are done, start the PXP ARB
>>> + * session (if not already running) and add the queue to the PXP 
>>> list. Note
>>> + * that the queue must have previously been marked as using PXP with
>>> + * xe_pxp_exec_queue_set_type.
>>> + *
>>> + * Returns 0 if the PXP ARB session is running and the queue is in 
>>> the list,
>>> + * -ENODEV if PXP is disabled, -EBUSY if the PXP prerequisites are 
>>> not done,
>>> + * other errno value if something goes wrong during the session start.
>>> + */
>>> +#define PXP_TERMINATION_TIMEOUT_MS 500
>>> +int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
>>> +{
>>> +    int ret = 0;
>>> +
>>> +    if (!xe_pxp_is_enabled(pxp))
>>> +        return -ENODEV;
>>> +
>>> +    /* we only support HWDRM sessions right now */
>>> +    xe_assert(pxp->xe, q->pxp.type == DRM_XE_PXP_TYPE_HWDRM);
>>> +
>>> +    /*
>>> +     * Runtime suspend kills PXP, so we need to turn it off while 
>>> we have
>>> +     * active queues that use PXP
>>> +     */
>>> +    xe_pm_runtime_get(pxp->xe);
>>> +
>>> +    if (!pxp_prerequisites_done(pxp)) {
>>> +        ret = -EBUSY;
>> Wouldn't EAGAIN be more appropriate? The pre-reqs here are the GSC 
>> firmware load which is guaranteed to in progress or done (or dead?), 
>> in which case it is just a matter or re-trying until the firmware 
>> init completes?
>
> Userspace tends to retry immediately when we return -EAGAIN . This 
> wait can take several hundreds on ms and I didn't want userspace to 
> just keep retrying in a tight loop for that long, so I used a 
> different error code. This was also discussed on the mesa review here:
>
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30723#note_2622269 
>
>
>>
>>> +        goto out;
>>> +    }
>>> +
>>> +wait_for_termination:
>>> +    /*
>>> +     * if there is a termination in progress, wait for it.
>>> +     * We need to wait outside the lock because the completion is 
>>> done from
>>> +     * within the lock
>>> +     */
>>> +    if (!wait_for_completion_timeout(&pxp->termination,
>>> + msecs_to_jiffies(PXP_TERMINATION_TIMEOUT_MS)))
>>> +        return -ETIMEDOUT;
>>> +
>>> +    mutex_lock(&pxp->mutex);
>>> +
>>> +    /*
>>> +     * check if a new termination was issued between the above 
>>> check and
>>> +     * grabbing the mutex
>>> +     */
>>> +    if (!completion_done(&pxp->termination)) {
>>> +        mutex_unlock(&pxp->mutex);
>>> +        goto wait_for_termination;
>>> +    }
>>> +
>>> +    /* If PXP is not already active, turn it on */
>>> +    switch (pxp->status) {
>>> +    case XE_PXP_ERROR:
>>> +        ret = -EIO;
>>> +        break;
>>> +    case XE_PXP_ACTIVE:
>>> +        break;
>>> +    case XE_PXP_READY_TO_START:
>>> +        ret = __pxp_start_arb_session(pxp);
>>> +        break;
>>> +    case XE_PXP_NEEDS_TERMINATION:
>>> +        pxp_terminate(pxp);
>>> +        mutex_unlock(&pxp->mutex);
>>> +        goto wait_for_termination;
>>> +    default:
>>> +        drm_err(&pxp->xe->drm, "unexpected state during PXP start: 
>>> %u", pxp->status);
>>> +        ret = -EIO;
>>> +        break;
>>> +    }
>>> +
>>> +    /* If everything went ok, add the queue to the list */
>>> +    if (!ret) {
>>> +        spin_lock_irq(&pxp->queues.lock);
>>> +        list_add_tail(&q->pxp.link, &pxp->queues.list);
>>> +        spin_unlock_irq(&pxp->queues.lock);
>>> +    }
>>> +
>>> +    mutex_unlock(&pxp->mutex);
>>> +
>>> +out:
>>> +    /*
>>> +     * in the successful case the PM ref is released from
>>> +     * xe_pxp_exec_queue_remove
>>> +     */
>>> +    if (ret)
>>> +        xe_pm_runtime_put(pxp->xe);
>> Does the runtime PM get/put need to be mutex protected as well? Is it 
>> possible for two xe_pxp_exec_queue_add() calls to be running 
>> concurrently?
>
> It is possible to have two xe_pxp_exec_queue_add running concurrently, 
> but that shouldn't matter with the pm_put. Am I not seeing a race?
>
>>
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> +/**
>>> + * xe_pxp_exec_queue_remove - remove a queue from the PXP list
>>> + * @pxp: the xe->pxp pointer (it will be NULL if PXP is disabled)
>>> + * @q: the queue to remove from the list
>>> + *
>>> + * If PXP is enabled and the exec_queue is in the list, the queue 
>>> will be
>>> + * removed from the list and its PM reference will be released. It 
>>> is safe to
>>> + * call this function multiple times for the same queue.
>>> + */
>>> +void xe_pxp_exec_queue_remove(struct xe_pxp *pxp, struct 
>>> xe_exec_queue *q)
>>> +{
>>> +    bool need_pm_put = false;
>>> +
>>> +    if (!xe_pxp_is_enabled(pxp))
>>> +        return;
>>> +
>>> +    spin_lock_irq(&pxp->queues.lock);
>>> +
>>> +    if (!list_empty(&q->pxp.link)) {
>>> +        list_del_init(&q->pxp.link);
>>> +        need_pm_put = true;
>>> +    }
>>> +
>>> +    q->pxp.type = DRM_XE_PXP_TYPE_NONE;
>>> +
>>> +    spin_unlock_irq(&pxp->queues.lock);
>>> +
>>> +    if (need_pm_put)
>>> +        xe_pm_runtime_put(pxp->xe);
>>> +}
>>> +
>>> +static void pxp_invalidate_queues(struct xe_pxp *pxp)
>>> +{
>>> +    struct xe_exec_queue *tmp, *q;
>>> +
>>> +    spin_lock_irq(&pxp->queues.lock);
>>> +
>>> +    list_for_each_entry(tmp, &pxp->queues.list, pxp.link) {
>> Double space.
>>
>>> +        q = xe_exec_queue_get_unless_zero(tmp);
>>> +
>>> +        if (!q)
>>> +            continue;
>>> +
>>> +        xe_exec_queue_kill(q);
>>> +        xe_exec_queue_put(q);
>>> +    }
>> This doesn't need to empty the list out as well?
>
> It's not strictly necessary, because it is ok to kill a queue multiple 
> times. Given the PM handling required as part of removing a queue from 
> the list and the fact that it needs to happen outside the lock (see 
> xe_pxp_exec_queue_remove), my thought was that it'd be easier to just 
> not do it here and leave it to when the queue is cleaned up.
Maybe add a comment about that?

>
>>
>>> +
>>> +    spin_unlock_irq(&pxp->queues.lock);
>>> +}
>>> +
>>> diff --git a/drivers/gpu/drm/xe/xe_pxp.h b/drivers/gpu/drm/xe/xe_pxp.h
>>> index 81bafe2714ff..2e0ab186072a 100644
>>> --- a/drivers/gpu/drm/xe/xe_pxp.h
>>> +++ b/drivers/gpu/drm/xe/xe_pxp.h
>>> @@ -9,10 +9,17 @@
>>>   #include <linux/types.h>
>>>     struct xe_device;
>>> +struct xe_exec_queue;
>>> +struct xe_pxp;
>>>     bool xe_pxp_is_supported(const struct xe_device *xe);
>>> +bool xe_pxp_is_enabled(const struct xe_pxp *pxp);
>>>     int xe_pxp_init(struct xe_device *xe);
>>>   void xe_pxp_irq_handler(struct xe_device *xe, u16 iir);
>>>   +int xe_pxp_exec_queue_set_type(struct xe_pxp *pxp, struct 
>>> xe_exec_queue *q, u8 type);
>>> +int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue 
>>> *q);
>>> +void xe_pxp_exec_queue_remove(struct xe_pxp *pxp, struct 
>>> xe_exec_queue *q);
>>> +
>>>   #endif /* __XE_PXP_H__ */
>>> diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.c 
>>> b/drivers/gpu/drm/xe/xe_pxp_submit.c
>>> index c9258c861556..becffa6dfd4c 100644
>>> --- a/drivers/gpu/drm/xe/xe_pxp_submit.c
>>> +++ b/drivers/gpu/drm/xe/xe_pxp_submit.c
>>> @@ -26,8 +26,6 @@
>>>   #include "instructions/xe_mi_commands.h"
>>>   #include "regs/xe_gt_regs.h"
>>>   -#define ARB_SESSION 0xF /* TODO: move to UAPI */
>>> -
>>>   /*
>>>    * The VCS is used for kernel-owned GGTT submissions to issue key 
>>> termination.
>>>    * Terminations are serialized, so we only need a single queue and 
>>> a single
>>> @@ -495,7 +493,7 @@ int xe_pxp_submit_session_init(struct 
>>> xe_pxp_gsc_client_resources *gsc_res, u32
>>>                      FIELD_PREP(PXP43_INIT_SESSION_APPTYPE, 0));
>>>       msg_in.header.buffer_len = sizeof(msg_in) - 
>>> sizeof(msg_in.header);
>>>   -    if (id == ARB_SESSION)
>>> +    if (id == DRM_XE_PXP_HWDRM_DEFAULT_SESSION)
>> Would have been clearer to just use the correct name from the start.
>
> You mean define DRM_XE_PXP_HWDRM_DEFAULT_SESSION locally in the 
> earlier patch, and then moving it to the uapi without a rename?
Yes. That would keep things simpler.

>
>>
>>>           msg_in.protection_mode = PXP43_INIT_SESSION_PROTECTION_ARB;
>>>         ret = gsccs_send_message(gsc_res, &msg_in, sizeof(msg_in),
>>> diff --git a/drivers/gpu/drm/xe/xe_pxp_types.h 
>>> b/drivers/gpu/drm/xe/xe_pxp_types.h
>>> index d5cf8faed7be..eb6a0183320a 100644
>>> --- a/drivers/gpu/drm/xe/xe_pxp_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_pxp_types.h
>>> @@ -6,7 +6,10 @@
>>>   #ifndef __XE_PXP_TYPES_H__
>>>   #define __XE_PXP_TYPES_H__
>>>   +#include <linux/completion.h>
>>>   #include <linux/iosys-map.h>
>>> +#include <linux/mutex.h>
>>> +#include <linux/spinlock.h>
>>>   #include <linux/types.h>
>>>   #include <linux/workqueue.h>
>>>   @@ -16,6 +19,14 @@ struct xe_device;
>>>   struct xe_gt;
>>>   struct xe_vm;
>>>   +enum xe_pxp_status {
>>> +    XE_PXP_ERROR = -1,
>>> +    XE_PXP_NEEDS_TERMINATION = 0, /* starting status */
>>> +    XE_PXP_TERMINATION_IN_PROGRESS,
>>> +    XE_PXP_READY_TO_START,
>>> +    XE_PXP_ACTIVE
>>> +};
>>> +
>>>   /**
>>>    * struct xe_pxp_gsc_client_resources - resources for GSC 
>>> submission by a PXP
>>>    * client. The GSC FW supports multiple GSC client active at the 
>>> same time.
>>> @@ -82,6 +93,21 @@ struct xe_pxp {
>>>   #define PXP_TERMINATION_REQUEST  BIT(0)
>>>   #define PXP_TERMINATION_COMPLETE BIT(1)
>>>       } irq;
>>> +
>>> +    /** @mutex: protects the pxp status and the queue list */
>>> +    struct mutex mutex;
>>> +    /** @status: the current pxp status */
>>> +    enum xe_pxp_status status;
>>> +    /** @termination: completion struct that tracks terminations */
>>> +    struct completion termination;
>>> +
>>> +    /** @queues: management of exec_queues that use PXP */
>>> +    struct {
>>> +        /** @queues.lock: spinlock protecting the queue management */
>>> +        spinlock_t lock;
>>> +        /** @queues.list: list of exec_queues that use PXP */
>>> +        struct list_head list;
>>> +    } queues;
>>>   };
>>>     #endif /* __XE_PXP_TYPES_H__ */
>>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>>> index b6fbe4988f2e..5f4d08123672 100644
>>> --- a/include/uapi/drm/xe_drm.h
>>> +++ b/include/uapi/drm/xe_drm.h
>>> @@ -1085,6 +1085,24 @@ struct drm_xe_vm_bind {
>>>   /**
>>>    * struct drm_xe_exec_queue_create - Input of 
>>> &DRM_IOCTL_XE_EXEC_QUEUE_CREATE
>>>    *
>>> + * This ioctl supports setting the following properties via the
>>> + * %DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY extension, which uses the
>>> + * generic @drm_xe_ext_set_property struct:
>>> + *
>>> + *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY - set the queue 
>>> priority.
>>> + *    CAP_SYS_NICE is required to set a value above normal.
>>> + *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE - set the queue 
>>> timeslice
>>> + *    duration.
>> Units would be helpful.
>
> I have no idea what they are. I only added this documentation because 
> it seemed unclean to only add the part about PXP.
Looks like it gets stored as "q->sched_props.timeslice_us", so 
microseconds seems like a plausible guess :).

>
>>
>>> + *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE - set the type of 
>>> PXP session
>>> + *    this queue will be used with. Valid values are listed in enum
>>> + *    drm_xe_pxp_session_type. %DRM_XE_PXP_TYPE_NONE is the default 
>>> behavior, so
>>> + *    there is no need to explicitly set that. When a queue of type
>>> + *    %DRM_XE_PXP_TYPE_HWDRM is created, the PXP default HWDRM session
>>> + *    (%XE_PXP_HWDRM_DEFAULT_SESSION) will be started, if isn't 
>>> already running.
>>> + *    Given that going into a power-saving state kills PXP HWDRM 
>>> sessions,
>>> + *    runtime PM will be blocked while queues of this type are alive.
>>> + *    All PXP queues will be killed if a PXP invalidation event 
>>> occurs.
>> Seems odd to say 'values are listed in ...' and then go on to 
>> describe each type and provide extra information about them. Seems 
>> like the extra details should be part of the enum documentation 
>> instead of here?
>
> This is documentation specific to how this ioctl handles those values, 
> so it belongs here. The 'values are listed in ...' sentence was about 
> being future proof, in case we update the enum in the future and don't 
> need to add any extra explanation here.
>
That is an argument for having a single point of documentation and that 
point being the point of definition. Then, if new values are added it is 
immediately obvious what documentation needs to be updated.

John.

> Daniele
>
>>
>> John.
>>
>>> + *
>>>    * The example below shows how to use @drm_xe_exec_queue_create to 
>>> create
>>>    * a simple exec_queue (no parallel submission) of class
>>>    * &DRM_XE_ENGINE_CLASS_RENDER.
>>> @@ -1108,7 +1126,7 @@ struct drm_xe_exec_queue_create {
>>>   #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY        0
>>>   #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY        0
>>>   #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE        1
>>> -
>>> +#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE        2
>>>       /** @extensions: Pointer to the first extension struct, if any */
>>>       __u64 extensions;
>>>   @@ -1694,6 +1712,26 @@ struct drm_xe_oa_stream_info {
>>>       __u64 reserved[3];
>>>   };
>>>   +/**
>>> + * enum drm_xe_pxp_session_type - Supported PXP session types.
>>> + *
>>> + * We currently only support HWDRM sessions, which are used for 
>>> protected
>>> + * content that ends up being displayed, but the HW supports 
>>> multiple types, so
>>> + * we might extend support in the future.
>>> + */
>>> +enum drm_xe_pxp_session_type {
>>> +    /** @DRM_XE_PXP_TYPE_NONE: PXP not used */
>>> +    DRM_XE_PXP_TYPE_NONE = 0,
>>> +    /**
>>> +     * @DRM_XE_PXP_TYPE_HWDRM: HWDRM sessions are used for content 
>>> that ends
>>> +     * up on the display.
>>> +     */
>>> +    DRM_XE_PXP_TYPE_HWDRM = 1,
>>> +};
>>> +
>>> +/* ID of the protected content session managed by Xe when PXP is 
>>> active */
>>> +#define DRM_XE_PXP_HWDRM_DEFAULT_SESSION 0xf
>>> +
>>>   #if defined(__cplusplus)
>>>   }
>>>   #endif
>


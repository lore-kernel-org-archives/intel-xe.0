Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DAB5C25B75
	for <intel-xe@archiver.kernel.org>; Wed, 15 May 2024 07:35:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BE7110E221;
	Wed, 15 May 2024 07:35:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nMa1+qTX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6297E10E221
 for <intel-xe@lists.freedesktop.org>; Wed, 15 May 2024 07:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715758537; x=1747294537;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=liYN5oUTbiOSvz3766jgHW7V4p3O2rt/TIdzzJpnoaQ=;
 b=nMa1+qTX13Hv9zi/Ts0TXidoPxSb+aj3VA7Y+o4lW8JZ1K8l8YFg3z7W
 2UpDkMvq+zdhlnaPk5VcqgdG/E5dorfozqOdLPsItzV9p6VnxwrmnSlrJ
 TQYVwEiMTm9setq3V6Eu+Il+AdyXh+vGnuNKO6GyFKWSKNAdv0bfs9JXU
 nXSCON1OCh9V85ql1HtYiJK2FMHsIVmkbT9Q3rC2C16FHAoNLCGlyap3Q
 tPOa75LdSbWwWEKSlKqu4G5hosCe+yLdkH/iZZ6IHBcmgdZntkdhW9ev9
 XCTYEXZji8QHAOtwFd1nmhwrZZ8Iq9crXr7oqFukqlZLmQ61Vexo2PuIu A==;
X-CSE-ConnectionGUID: 8W9NNjaPTreUuFQ+Ii2zlA==
X-CSE-MsgGUID: 1nxfp4Q9Tz2CCZXKzwjE+Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="11533566"
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="11533566"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 00:35:36 -0700
X-CSE-ConnectionGUID: FMJoz347QRWSbYIniKUnSA==
X-CSE-MsgGUID: Qz980qknSTSLOzWv3716rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="62141538"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 May 2024 00:35:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 15 May 2024 00:35:35 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 15 May 2024 00:35:35 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 15 May 2024 00:35:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JA7LVMvSt2+JjGrVlmegDPp/pUvDHIGLU3gj3OMoaD51RAn5x5noGXaj2zDYz4AHT+fhpRiTeS7li/Dj3ymSwqulpTpsfKgioxIapVXT7IWnpQBJNGQmJe98WpgEOpeLZIsyPmNX4ktCjf9rhmcxzZ1H+hv4iQGUCqx4UYh/dkq6j3rl0bPxNfYbKTyVDjfwERddP90z/0RqaOrcUTZIjlYNRcYgWiKNusexJe7BOuxglnVvWC2jHLfR51MyIQf3QGXJX+9L+DEQwpdoku0D+DdjGaK3ED4rtEMWBH5Hgvcyfv1ml3L3xaIJTHnQwu1FVcZI07+s6OFPmtQZCaaLrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7npeVYxyJt0uVgTXVjxEXH1rx58ZdeU+E3Hli+rOawM=;
 b=JfFOtRIspvXxYRX/VyWFCQjCJe9cZu8kDfkvhXmhmWjbG6rM+jKg19lxXO0nbA5AoN7LpDpdTTVLad9oH72XGDCvmOTvUTCTA1wZhgaJP2JoZ+PbShvWbXcPWaukTtinFd0KePT7CcNoHQQHcgFDkqnoDj1E0HJfHQKAlqUzdiHlT4sfeUKof/rXXJ2KkG2F5zzZl9gXCHIx8iCzRq8FXPr7XIblhAWfXzSVPCJDeLSnLAw/G/sJJmUoO4IHVICvZGVOIIkQTlo8k8x7ueUN+ekGl/nwdCODWTzi1ZnLY2oeTflUUnNYxdZ61q71CtYmyYSYYsFaCsueLQtz81d0XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CH3PR11MB7896.namprd11.prod.outlook.com (2603:10b6:610:131::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7587.27; Wed, 15 May 2024 07:35:33 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::301e:5fa8:50a3:3824]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::301e:5fa8:50a3:3824%3]) with mapi id 15.20.7544.052; Wed, 15 May 2024
 07:35:33 +0000
Message-ID: <a93400bf-a328-49b0-b297-73e1cd56eabe@intel.com>
Date: Wed, 15 May 2024 13:05:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] RFC drm/xe: Enable Coarse Power Gating
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <vinay.belgaumkar@intel.com>
References: <20240514064309.3819722-1-riana.tauro@intel.com>
 <20240514064309.3819722-3-riana.tauro@intel.com> <ZkQn1MQiOKRR5c36@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <ZkQn1MQiOKRR5c36@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0016.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::17) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CH3PR11MB7896:EE_
X-MS-Office365-Filtering-Correlation-Id: 46f34505-6e07-4c51-db46-08dc74b19a54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L2NiUzN0SThwY3VwaTN0VzZ1cTErSUpkMGpYWTAwY0NyVG9YaGRxbjJCVTBY?=
 =?utf-8?B?ZFZraWo0cURhWlVBUUpQckwvUEw2S3N5T2dsSThUMXNrOTNsWElObHF5dG1W?=
 =?utf-8?B?U004Ymc5ZlhIbjNKSEMxTnZaWkxZTW5sYzY3S1FWOXhXRG5Pc3pXNkRlcHda?=
 =?utf-8?B?dGQrZlI5SHZFOWRGL1p5MWc1MHdhdGVUTDVISGovd2xPQlVIbmlrVkVsODcz?=
 =?utf-8?B?cGY0QkdicnRFRXN5VVZkb1I3dldKZkpnUGhIWUpremliVm10MFlCUi9KSXc1?=
 =?utf-8?B?N1dWOFdnanpaZjZRUVY1aVJBdVVFWkhBZlNPZUVwVHdCclROQWVUYit4QzNI?=
 =?utf-8?B?WVlXaTd5ajkwSEN3TFZPcll5YkVvb0xRc0gzdHl5NnEwOWVGY0xEQkc1K0Rq?=
 =?utf-8?B?d09IbFEzR2tpZ2gvcWJUZFVOWUxJQzFnclh6a2xFVlplTlAzQWttSEx4T3Fk?=
 =?utf-8?B?U0hrcUxRbjNMc2JpWERXQXlSV1ZmajMvNHkxZlVWZFVYTnd4Y0x5QW1Jak8r?=
 =?utf-8?B?dDVibjhmdVQ1SDdaN0VyN2I3ZUNMQnl2RVo1YWNZQ2FiZVhMZm1BSDRmZUZi?=
 =?utf-8?B?clNpWkM0OEl6bFVHOXVSVnNBZzAwUWJSd3VJOEJPWmwwTHZGMm9vcllWZmp3?=
 =?utf-8?B?YWpUdm9naGkzZWxSR3JGdjZTNFg4Z1c0b2FDdmp5Y3ZuY3g0MitKVzE5N1k4?=
 =?utf-8?B?QytoVElEeFBuM0xVR1lBdlNYdDd2U0hjMEhqQXBqRXpLTWUvK2dNL003bm1C?=
 =?utf-8?B?ZENRdmdQc2JMemdMNk90QVJLa2VFczlhWUVKNjBybTVMNFVYbGt4dS9GSnZq?=
 =?utf-8?B?dVBNUkQ5Q1d3cjQzdkg5Tm16bE03Tno5YTBZM1lGSFdOOFhsSlI4aTc2ODNp?=
 =?utf-8?B?VkY5WlNpY2dydUFnVi9wRzA2Z3N0eGpJdUZ2Y0RVSkVEangwTVAvTVZiR0JH?=
 =?utf-8?B?SGRqdUhybytRV29lWVpxYkVBSmI0RjdNOVlKR0VuOW5TSVlvT2lwMjBFbito?=
 =?utf-8?B?YTFIWkpEYWgzMFZUZndiRUFrSk9TNVArWjJUejVTL2hjK1FpZTZKUExBcTM0?=
 =?utf-8?B?VXc5N1RCYkpQZW53UmFyTDR4enFPekQ0TGxDMnNlSFhWV2VZRDFVTW00bUZB?=
 =?utf-8?B?bGhXdXErMzVtaXh5dWJYOGZzZ0FORFdYNjhrM1kwNlV3VDB3UWtsMER1cnFO?=
 =?utf-8?B?RFY5SFNFMXRrdzNjL3NxRGZPVUFOdEQzSE9WSCszYUN5MHYzSnJDMHZGMmdQ?=
 =?utf-8?B?QzRFZU5BbnpmMDUxUjEzc2JGY0wwNjhXS09KbDZMMWc2MDRUczFvc1BuWDFx?=
 =?utf-8?B?U3poQTVBZldIY1FyYVJuWjBNZHlzbHRJaEw0aFZONTNwU3lzRjBWcmx0dnkr?=
 =?utf-8?B?SkpWclE2VUJCRGFMWDhSUmFvSVgzc09ZYWFGT0JQY3E0OSt1cWRpeENFSWR0?=
 =?utf-8?B?QkluaVcrWkF0SU9qU3B4N21odHpyWUdVN3JXdHRaN0VObkVHNXN5MVdSSmxp?=
 =?utf-8?B?UHBNQTREaFpYTWNmTmEvMWtodUVNdUxmQ1J2bEc2dEJtRVJyclY0WnJsY3NS?=
 =?utf-8?B?MENkaGplMm51NnpGQy83RWlQamJhYmd5M2JpR0htZEQxVDlXRW5MM3pHejNO?=
 =?utf-8?B?YnRadkU4YzBXUWRsekJ3RC9NcU9DdHo5Uk5pNStLdlA2R1dycERjZzBlS0xV?=
 =?utf-8?B?MkhJTHluUWNNOEFsRmV5UFpkdEZxUUxuUVhBbThRT0lMVFg2b2szdHh3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3Z0TDRHWCs2VG53Mm1FOWVvRmtGWFV0bkx6WFgzY0pOaWZTRnEzNzRCNms3?=
 =?utf-8?B?bVBvVzd0ekZYNlZuZkw4Ty9FUkRPYnMzR3NTSlNqMlBiclZwc2hsSk1ubStl?=
 =?utf-8?B?bnhEcW0raGhPcEFBVXRza1FaZTkyZWFtSjhyQXUvNEV6ZHlnRjh6dnBvZWNO?=
 =?utf-8?B?cHJ6QVk0dTYwTE9Da25TbmFLRm5BY3pjL0t0Y3pnTWZ6OHhzT3ZZWFVxUUdY?=
 =?utf-8?B?MWJWVzFTUHg5dzdiQi9yemhBS3UxZXZ5UXhKSVVVWEJBYTJMUzFtcXVnbk1o?=
 =?utf-8?B?M0w0a2ZVZ0tiVVF1cUNnSWJiVnd5dDVab0Y5OHI3VktNY1VrRnRHWmV6U1la?=
 =?utf-8?B?L2c4bWVpbE9ZNDBWMW9kWnNWa25mU2Exa25kdlFjVUhlM0NDZTVxMThzYVBZ?=
 =?utf-8?B?RFpZSkxGanNVVVJMVlpNam1pYVR5dUlwZkZiNVVleVNLU0hUdWpFZ3RzdUZo?=
 =?utf-8?B?MFA4UWtLVXJmV0RMWFZ0ZHAwZFpabEtBZGNodW1JL1JCcHJ6VkRvRzRDWDQw?=
 =?utf-8?B?dHFNcEVUNzM4M3NMbGhnZUovMU9iakpqYitoNDZ5d3F3RG8xQlJyV09abzQw?=
 =?utf-8?B?WW9sNmJzWjhjRlhIbWd5SUdZcE12ak9vRVAzdkI5RzVpaVl5K2E4WEcrZmZn?=
 =?utf-8?B?NzBQcHhNMDRRRGlhbkhMcUZFL1FucXFZK0RQQSs1N1l4N1pNeEhyayt2RVkw?=
 =?utf-8?B?Q2hGVUNCekdNajFia0FYN0hJbWwrSGJKQzZuQ3k0dHdPVmNLUHFSNDNoaVpz?=
 =?utf-8?B?LzZnSUdjRHhWYnNOaFZNRTROVUhmOFlucjR4YkdBd01Mbm51UTNOWWtOaXZ6?=
 =?utf-8?B?TTJSMVJBcVpqclN0REd3RWVEcHZLTXQzY2w1blJIRDloU2o2bFhwMmM2RWor?=
 =?utf-8?B?WHVjdWR1eStVK0tvOXcwZDNRQUxVOTVaVDg4Tk5uN3R3d2Z3Zk9ZY1UwSVdV?=
 =?utf-8?B?cnZMWHhEamtxY1djT1dvRW56bHI5dy91dktNamFUZUQyR2xxcjBvOWh1YWFL?=
 =?utf-8?B?VTQwdVB2Y0F5c0VSK3FJdDErSlhKZ0tnS1gyTit0WHVVL2pSenNxS1d4M2Fw?=
 =?utf-8?B?UmVtdmlaNllyQzJBOFFxR2M0S2VtaURUaHVoOVlXRnVUUnZzaU8wdWhyeUt4?=
 =?utf-8?B?dy9FL1hMak8wYTVGdjN4dXkxekQ4cTZXYU9zZGk0aS9jR243T3k3YXIwUjhw?=
 =?utf-8?B?Q3BsanFCYlYreThPS1NJRnAzTWlCWVRaTlUybmNpNzZVbHBSWW1scmNoQWF4?=
 =?utf-8?B?bFlxZUlGbGRDTUNXNkNuUzJzUGU1dFBadUVwZW5hd1k3dExtQ09oRmdIcGhJ?=
 =?utf-8?B?VkphbE1NS1hoTTBpcmZQTks4ZFdxOStiWVlNTFVjODZjNjlkOFh6OG9LcmxH?=
 =?utf-8?B?aW5lSUxOcmJhM3NpWEJHT0grSUNCVlFnYU1oM2lZSi9jUVNYbUJxTTIvcHRI?=
 =?utf-8?B?akdXbHlmRjdCVGR2VUYyUmZZTXRvQ09FUnFKNndIVHhzeGNqbTNvSGNQa1Q5?=
 =?utf-8?B?Z0w3R3IwcFN5Z1plVW5FMWp4dzBxaEpZczBLY3AwOTFLKzJtcDI1NTVtMUxL?=
 =?utf-8?B?TUErTm1EbDByZVJtZnRsUlg0b2JpUzhqbTV2d2RLMFFFMjZJYnMvM2UwcUF6?=
 =?utf-8?B?elREWHcxM0Y4OFJiOHEreFNLSXdFTUdUWExsTlRvSDdyY0E2bm91Q2ZWM09O?=
 =?utf-8?B?VlJpZnBKK2x5Tmk0WEdPYTJzQ2pNNzJma3o0MGxWZERzRWtTMTZ5cWFlNnVt?=
 =?utf-8?B?VDZLUzkyZ1dLUnVuYWdHVlZpWHVzQ2daTGR1d3E2MlNmbThSSXgwZlcyVll3?=
 =?utf-8?B?MVd4NUROcnlwZmxpaHdvaHdMeGlXb2JNMUJvdXJFVndUWnBtdVNyYVZTb1hH?=
 =?utf-8?B?cWJWdVoxNzhOVWtjOEduek45azJRbUk2OFRBL0JCcFk0WGNGOUlXYlI2WjZt?=
 =?utf-8?B?SUx4ckhvSTlyWjJiQ3NyWWU0UXR0TnZFM1Rjb3REQzA3clFiWmRHS0ZvR3hS?=
 =?utf-8?B?NGo2bVQxNEh1QnlPbmFpR3FubGtQOXc1MG5HVU1TbERYdXl6U01TVjJEOTY3?=
 =?utf-8?B?LzlyYzROaktxR09yc1VaTWt3L245UFpiQjk0d0R5dkhjME95QVhJQ0VBS2JT?=
 =?utf-8?Q?7kJwy/rLEChiFntWM4+0NdTN2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 46f34505-6e07-4c51-db46-08dc74b19a54
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2024 07:35:33.0052 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4t59dWYE3uoafl9cQ5iXiskE//UxGkm/4iaRY3fFDhaSUNLY2oV0JbET9wUw3f8maS53rXiEluT9f8I5jOuvwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7896
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

Hi Rodrigo

Thanks for the review

On 5/15/2024 8:41 AM, Rodrigo Vivi wrote:
> On Tue, May 14, 2024 at 12:13:09PM +0530, Riana Tauro wrote:
>> Coarse Power Gating (CPG), where Render and Media can enter C6
>> independent of the remaining GT. Enable render and media
>> power gating.
> 
> Something strange with this phrase...

Will rephrase it
> 
>>
>> Also enable VD HCP/MFX sub-pipe power gating.
>> HCP/MFX power gating is disabled by default, turn it on for
>> the vd units available
> 
> Could be simplified to something like:
> "Enable every power gating that are disabled by default,
> for every unit and sub-pipe available"
> (or something like that).

will change this
> 
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h |  2 ++
>>   drivers/gpu/drm/xe/xe_gt.c           | 10 +++++++
>>   drivers/gpu/drm/xe/xe_gt_idle.c      | 45 ++++++++++++++++++++++++++--
>>   drivers/gpu/drm/xe/xe_gt_idle.h      |  2 ++
>>   4 files changed, 56 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index 7c173db7d585..1cb0343ab581 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -317,6 +317,8 @@
>>   #define FORCEWAKE_GT				XE_REG(0xa188)
>>   
>>   #define POWERGATE_ENABLE			XE_REG(0xa210)
>> +#define   RENDER_POWERGATE_ENABLE		REG_BIT(0)
>> +#define   MEDIA_POWERGATE_ENABLE		REG_BIT(1)
>>   #define   VDN_HCP_POWERGATE_ENABLE(n)		REG_BIT(3 + 2 * (n))
>>   #define   VDN_MFXVDENC_POWERGATE_ENABLE(n)	REG_BIT(4 + 2 * (n))
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 36c7b1631fa6..8a09630f5f38 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -567,6 +567,10 @@ int xe_gt_init(struct xe_gt *gt)
>>   	if (err)
>>   		return err;
>>   
>> +	err = xe_gt_idle_enable_pg(gt);
>> +	if (err)
>> +		return err;
>> +
>>   	return drmm_add_action_or_reset(&gt_to_xe(gt)->drm, gt_fini, gt);
>>   }
>>   
>> @@ -624,6 +628,10 @@ static int do_gt_restart(struct xe_gt *gt)
>>   	if (err)
>>   		return err;
>>   
>> +	err = xe_gt_idle_enable_pg(gt);
>> +	if (err)
>> +		return err;
>> +
>>   	for_each_hw_engine(hwe, gt, id) {
>>   		xe_reg_sr_apply_mmio(&hwe->reg_sr, gt);
>>   		xe_reg_sr_apply_whitelist(hwe);
>> @@ -720,6 +728,8 @@ void xe_gt_suspend_prepare(struct xe_gt *gt)
>>   {
>>   	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>>   
>> +	xe_gt_idle_disable_pg(gt);
>> +
> 
> they are not the symmetric equivalents... we should probably find
> a more suitable symmetric place for that.

To disable/enable pg during suspend resume, i can move it to

gt_suspend/gt_resume [But these are also called during runtime pm] /
pm_suspend/pm_resume

> 
>>   	xe_uc_stop_prepare(&gt->uc);
>>   
>>   	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
>> index 4384f7e80258..f549bbb0e110 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
>> @@ -12,6 +12,7 @@
>>   #include "xe_gt_sysfs.h"
>>   #include "xe_guc_pc.h"
>>   #include "regs/xe_gt_regs.h"
>> +#include "xe_macros.h"
>>   #include "xe_mmio.h"
>>   #include "xe_pm.h"
>>   
>> @@ -93,6 +94,42 @@ static u64 get_residency_ms(struct xe_gt_idle *gtidle, u64 cur_residency)
>>   	return cur_residency;
>>   }
>>   
>> +int xe_gt_idle_enable_pg(struct xe_gt *gt)
>> +{
>> +	int ret, i;
>> +	u32 pg_enable;
>> +
>> +	xe_device_assert_mem_access(gt_to_xe(gt));
>> +
>> +	pg_enable = RENDER_POWERGATE_ENABLE | MEDIA_POWERGATE_ENABLE;
>> +
>> +	for (i = XE_HW_ENGINE_VCS0; i <= XE_HW_ENGINE_VCS7; i++) {
>> +		if ((gt->info.engine_mask & BIT(i)))
>> +			pg_enable |= (VDN_HCP_POWERGATE_ENABLE(i) |
>> +				      VDN_MFXVDENC_POWERGATE_ENABLE(i));
>> +	}
>> +
>> +	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>> +	if (ret)
>> +		return ret;
>> +
>> +	xe_mmio_write32(gt, POWERGATE_ENABLE, pg_enable);
>> +
>> +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>> +
>> +	return 0;
>> +}
>> +
>> +void xe_gt_idle_disable_pg(struct xe_gt *gt)
>> +{
>> +	xe_device_assert_mem_access(gt_to_xe(gt));
>> +	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
>> +
>> +	xe_mmio_write32(gt, POWERGATE_ENABLE, 0);
>> +
>> +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>> +}
>> +
>>   static ssize_t name_show(struct device *dev,
>>   			 struct device_attribute *attr, char *buff)
>>   {
>> @@ -145,9 +182,12 @@ static const struct attribute *gt_idle_attrs[] = {
>>   	NULL,
>>   };
>>   
>> -static void gt_idle_sysfs_fini(struct drm_device *drm, void *arg)
>> +static void gt_idle_fini(struct drm_device *drm, void *arg)
>>   {
>>   	struct kobject *kobj = arg;
>> +	struct xe_gt *gt = kobj_to_gt(kobj->parent);
>> +
>> +	xe_gt_idle_disable_pg(gt);
>>   
>>   	sysfs_remove_files(kobj, gt_idle_attrs);
>>   	kobject_put(kobj);
>> @@ -182,7 +222,7 @@ int xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle)
> 
> we should perhaps also change the name of the init function
> to ensure symmetry?
Will rename it. Will also move xe_gt_idle_enable_pg during probe into 
this function.

Thanks
Riana
> 
>>   		return err;
>>   	}
>>   
>> -	return drmm_add_action_or_reset(&xe->drm, gt_idle_sysfs_fini, kobj);
>> +	return drmm_add_action_or_reset(&xe->drm, gt_idle_fini, kobj);
>>   }
>>   
>>   void xe_gt_idle_enable_c6(struct xe_gt *gt)
>> @@ -202,7 +242,6 @@ void xe_gt_idle_disable_c6(struct xe_gt *gt)
>>   	xe_device_assert_mem_access(gt_to_xe(gt));
>>   	xe_force_wake_assert_held(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>   
>> -	xe_mmio_write32(gt, POWERGATE_ENABLE, 0);
>>   	xe_mmio_write32(gt, RC_CONTROL, 0);
>>   	xe_mmio_write32(gt, RC_STATE, 0);
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h b/drivers/gpu/drm/xe/xe_gt_idle.h
>> index 75bd99659b1b..ba7aa36348fc 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_idle.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.h
>> @@ -13,5 +13,7 @@ struct xe_gt;
>>   int xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle);
>>   void xe_gt_idle_enable_c6(struct xe_gt *gt);
>>   void xe_gt_idle_disable_c6(struct xe_gt *gt);
>> +void xe_gt_idle_disable_pg(struct xe_gt *gt);
>> +int  xe_gt_idle_enable_pg(struct xe_gt *gt);
>>   
>>   #endif /* _XE_GT_IDLE_H_ */
>> -- 
>> 2.40.0
>>

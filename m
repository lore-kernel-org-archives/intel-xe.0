Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A63AFC43458
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jul 2026 10:53:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6038410E8A8;
	Mon,  6 Jul 2026 10:53:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OA5CrC/n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B346F10E8A8
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Jul 2026 10:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783335206; x=1814871206;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JtVRyEKac6JetLENolcWV+Z7OFxtkQv0iEtaa9TYNtg=;
 b=OA5CrC/npc6qsAKgtNtaHrqhtU3+tyuFzGe+ZFGkGGGZKMs1hivgSKXt
 eY16QC3ded+OEsHmBiiEcV9ck2+TE7j5BAOapurnl8b7hIpC2cQNt3nLR
 GiyP4izLKscfnuceoSzL9F9KZ/5NWb8+1DS0ANFHvVWOLPmNAiAJoxcaq
 vEE+RmPVLSKhKTMzY1h6aBrOBZxPu4BsHY44QMnMgsZubCkas20R8Cso2
 m6fqHDlVDYzCVM57P+zWbc9dSMAiTlBuMogcjm0OlHVXoheMGFzOD53Lm
 eWRtRDk3BxUF62S0xPTx/vRu/aVVISm+Sd3AW4V0v5mZTGx251R+xm+su w==;
X-CSE-ConnectionGUID: 2MtXfCNJTDW3cU40mU1IZA==
X-CSE-MsgGUID: 7LpdomgLSdWsvzWMKe5ItQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="109509672"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; d="scan'208";a="109509672"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 03:53:26 -0700
X-CSE-ConnectionGUID: bg6kv/q4REKyQZq5N68Plw==
X-CSE-MsgGUID: 0ta90qh/SdGH46uwDw0KfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; d="scan'208";a="250329427"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 03:53:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 03:53:25 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 6 Jul 2026 03:53:25 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.24) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 03:53:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DQCfIK+rB+x46fPmA24iylAxlq5sU+u55g/fpfh8esTD/6j/+3XQCMCkfk8uKti/0+1wRwdwdrTnrW1OpJs5Hclib8yUy65NNQ9rPGAQu3hDw4U2Li8E5fdW8tb17/McJ9g3HgZOBaJyoacyEk1JKaPRyw7xgpYcfDMJiufPz77aGkSuRYXd2ThVxQuFltyWzz6MNK8JVgzeswpo/4hEV9fwlwKVuEDGn2WlTwObE3Sy4UqDVaB9YAFMQ1voR1AT32AIjOaRmGey18tu3QU6dsMnF9cKLcG+Sb75qDOHP6j7df9q3wylh0SF23uNEzaf3ylmsmPiw2dlnLNQtPTduQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pbc6PruptjbgifZvFJiRHJJ6m6chR6Oi0fMCsMi+stU=;
 b=RopNsZXuo7dprGWOx+mILzWdLEjxTkMdpEyz90D8i4ubvVPMiJTGr2I2WvlTb/0ZZQ6JI6yu7hB/o3o8WXAEzIN0rVmeuwaaxPPuFR+5PkVMs4G+7tNISjzxx216KxBd0WbHoWaf7krDV9wlRYhnWuna+uHb9Tk6AYCKQeN8zjv1vOJvcSAz324aNO2nQfZSYVlfJiE2twMiLJNVrib613YB92Kdzej7tdUFVGU+CAbdqs2RZ6AtLEfbgS13iXuEjcvcpd3TXOQ9I1D+OSFNeHJw4q5GyozFEYSeI8Pf/K7Y6GiuLPIv6Ni+HU8BHNjx3Aj/bJYldW5BtVMtoNR2yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by SA2PR11MB5129.namprd11.prod.outlook.com (2603:10b6:806:11f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Mon, 6 Jul
 2026 10:53:23 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0181.008; Mon, 6 Jul 2026
 10:53:23 +0000
Message-ID: <d4f71b84-9c02-4ed8-8d3e-f5031f0f03c9@intel.com>
Date: Mon, 6 Jul 2026 16:23:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 2/5] drm/xe: Add RAS logging helpers
To: "Tauro, Riana" <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <rodrigo.vivi@intel.com>, <matthew.brost@intel.com>,
 <thomas.hellstrom@linux.intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <aravind.iddamsetty@intel.com>,
 <karthik.poosa@intel.com>, <sk.anirban@intel.com>, <raag.jadav@intel.com>
References: <20260630115503.407158-7-mallesh.koujalagi@intel.com>
 <20260630115503.407158-9-mallesh.koujalagi@intel.com>
 <6b6e6259-a4bb-4d79-a87f-a8b21e22e923@intel.com>
 <44fb1c8d-2a72-4c65-97b8-b95ec23a9bfa@intel.com>
 <40fa79df-fd04-40fe-8e97-f93f6a24181e@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <40fa79df-fd04-40fe-8e97-f93f6a24181e@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0048.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d6::7) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|SA2PR11MB5129:EE_
X-MS-Office365-Filtering-Correlation-Id: 00aa372b-b03d-4865-a4d0-08dedb4cccb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|56012099006|4143699003|11063799006|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: Ng9W96BA4P52d317Y7RcVhpQysUbqD+tTeR5AwKKeI9pEoRECBQD5juBGPf7v4IewTpyMX7RZhJFNCd8PS4r3wrMEPgJS7qqO2JkrjRLx0jWZtU7n2FPRQK3jsSNsbaRP/aASvWYyFErtqXlrL432THGwHgbOTd88QQPBD8OT3smxlM+uAvlCpRtwaQ+BMfErYR8ncyZmcvlRqp9zIoLvq4pxD3df5ISJEKItQ+3aqNwZRrFy29JLlumNAwJrwZX5Rrr/WBRTmZTnMZkd6I8UWv5/9Un3lkyuVRyo4PqlHp3PGya3IH0c4UDjH09b9rKzow7XTNPnzKVG5hERCtAj50VKwwqza7uuJ8AFJUHkEtN82NQvbE9Z89aZjFQOgwIFDorE/j769i6laeBsOb/EfTC6VDLDdl0xvmHRw0fuWyv05jFn14yh9hKFqjRQNoJrYnP+j5f3Il5TU3tBcca6S5d3pXnanwazTNqyIZwWPJUd+twFNtNYVKyGMvw9bCVr5OJ874jAVydQvIMVAZMCCjifGasSqGgiC7j/Z1YCgNUZrqxwctyzZ4xHCRV7p4xK63rVUYcFCeaLHF2c1izwwHk3e8zMXG/hTY0hX3BgsQMZ92bREX9bHWIsKfr0YVdhJ8I5yiLS25bvWunkcGK8qNGA78e2rrCUKJfV4fFvio=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUhsQWQwUjVLNm9UVTdzM3R6Q2lMaXI5RnprUXRqS0xsVTEvWUI3cmFDczc0?=
 =?utf-8?B?SVpmYnNuSjB4MlNQSjFneURlTU5HRjB2MkVTVW9vanRVOGdwMUxsUERteWxX?=
 =?utf-8?B?ejFjTTM0SXVUOXVqaHJlRHpOZUM3Z3NmckhMQklRSW5aWHBKUFFJZWp6Qkwx?=
 =?utf-8?B?NW12ZFlhcUR4WGhBeUhIVDV0T3FZOFo3SXJvS3ZDKzgyWGRQaDJtS2Q1aW85?=
 =?utf-8?B?WTk4blBpL3BHQWRSdmZBTHhFUXNZNHh4TGdPWDc5dlY1VnFkRlBVNXd2dVdM?=
 =?utf-8?B?RFBEeG1hUFh3MjFNMjdDcnE2bmZCN3VWc1F5ZjlLaTlabVhNTUp1dWRGakFi?=
 =?utf-8?B?S1Rnb3RRQXphVzc3SFBPV0h1eG9OVnNYdnUrT2JJSXF0RVZ1V0M2WGtHczMv?=
 =?utf-8?B?Y1ZKNUQ3SEFBM21yeEtHUE9vbzVjemwyMXV6eVMxVUpaL3ZObm1OSlhsNWgy?=
 =?utf-8?B?QmdLYlREQlllZzlkc3Z0QUF0S0dtMEcvZ3NVQXBXTCtIMXRYY0ZKRElTNjBB?=
 =?utf-8?B?clowdXZDdFpkV05Wdk1UOWhMUkxCTENqY2lhd1p5NVVGdzgvT3ZubnZkeVlj?=
 =?utf-8?B?V3kvWVF5WFF6YTJTclJMUTRBSTArOGE2SHlaUS9iVXBKcUFwNzRBa0FLaHVE?=
 =?utf-8?B?WHlSTkVmMVZpSUJydUpiNm5LYmZZSVpFeUhEU3dRTnROdU1QOXNvTkRVQ1JO?=
 =?utf-8?B?U3pLTm12SGRESHRQeXV5SWpsUU9GaXl1YVRNTTBjQVFCUjdPRkp3YWZkMkJS?=
 =?utf-8?B?c3BuUkFNRnNLTmo3eWYybFd5QUsrZ3o5aVFDOWw4Rkwrd0FuWFhSbXh0RjJW?=
 =?utf-8?B?STJ6cnlzMkhCR3NER2JMdTBFNDNOQlo2RzNuWmtXK2Q3S2VxRVRNMkNIWU9L?=
 =?utf-8?B?UWh2NndoWGNYYWpLUDdkMExDYWx2RUl1SFJ0a0tIVjVndnVJWldNYVlHOFhX?=
 =?utf-8?B?dmlXQS9raEptQkIzTEtiVm1PSVlOc0w5S0xNRnlVQkU1K2JTNjArTVlxL3pw?=
 =?utf-8?B?Wk9tVTBEWFBQb1MvV2pOVUtDdWhDT0FUbURZSU9LbWhUK1l6UFE5cVBvb3pu?=
 =?utf-8?B?aWlGaUh0WFlvMDUzN2M5eWtENlh5V1JROGZxNTZJbkt5a2U1RnFZWk5NTFBx?=
 =?utf-8?B?RWlHL1p5d2lONjJDN0xwblpUQldVL3RzazNpSFhTaUFWMGczUk1hcFJXQ2oy?=
 =?utf-8?B?Qk1xbi9oSXdTL3d3TmdTSkZ6WjVOMmZHWiswRS9jeWVwRDZ6YUxMaHg3K2RF?=
 =?utf-8?B?N0trT1puWUZOZWg1LzRNN2RlQVNCd3RGbkJhNWIxeG1hay9KUko3Wk1TMmFs?=
 =?utf-8?B?YWIvODlWeXJjVHVDRVowNDhtS0k4YVlpbkpHdFhUVW5yQWdEMW0zdXVJSGds?=
 =?utf-8?B?Mk42aStneUFzRDdndU12Rjd5THBOQUlEeVFJZzR6Nm1CWTdXSHpTQkdCdllr?=
 =?utf-8?B?VkRPejlFUWZnL1MvYnBRNjQxYUxWOTU4bWdNTVVFckhVNFk1Uk5uakNKbFNz?=
 =?utf-8?B?NFdnbk45UjIwSW5GOGVFZ1FCK1daZ09IUmRuSnJQNGFjSXJ4Q2pyQ3FXOVZE?=
 =?utf-8?B?TThkSm4wNE92SDUrbk1kQ1lZZ1FqOC9ueDY0Q2tQL2lnRmdqSFFoejhENTBI?=
 =?utf-8?B?aTU0djV4bHJrdHVXajRyS0FQYUJVa0R2VmtJbGhoaVY3QmR6SW90WGUzekM5?=
 =?utf-8?B?QUZDd3RKOXlBQ3kxSTJKVXhmNUFHUTB0Sm1raEpMR1RDMjdhOFlGRWZKSC90?=
 =?utf-8?B?RlNYTUVtV2tuaGo3dzhlNkpyZk5XdnFGZUp4OXdFYy9JU0NpL0xDeUorNVlV?=
 =?utf-8?B?Y0RCSm1OUDQyaHQvclRDWEtScFZQL0N0ZHpwcnVCVDlyOCtLNzc0SVpudFYx?=
 =?utf-8?B?TkJrdG5sOG9WWjJNYzl0SXVteDhuWGhUMWttOU9yYnlZemRiYzdwMWJjTmpq?=
 =?utf-8?B?TDFuRE5MamI1V29xL2dxaGhnYlhYZ25hV3g3aEVxdFdZanEydHNXZmptZUNU?=
 =?utf-8?B?QUI3N0E4bGFjSTVXbDlOeVVrdGp1Uml6TlJPSXdKN2hxRndocHdMeUV0Slll?=
 =?utf-8?B?cWh0WnpFbmpCRHFjYTFmb2w2cmI2UlVySm9XQWx5bVM4MDhhNUJyK0VyWDNv?=
 =?utf-8?B?emk2K0ZGUDlONHdHVGhISnptQ09lWmQ5aTNacnB0eHUyQjZLM2JZSkdxLzNC?=
 =?utf-8?B?aTN1dTZsdUlNcWdnYzUvSVpvaXQwTkl6RkhkSVNXdEIxTjJHQVlNUWZzREZo?=
 =?utf-8?B?N0k5VksvYlhXY2ZjbjJna3IvL3A3TWRnTy9yU3hsTDIwYllSSkdwQXFGMm9J?=
 =?utf-8?B?b1B2dXV2MHV2TDlnSVhnZUovYTBkdkkvczM1Q2NLMTdMeHUvN3N4MHVJckJM?=
 =?utf-8?Q?o/2RU7HRoIEuk5Pk=3D?=
X-Exchange-RoutingPolicyChecked: DmxTyxQksPkCerg0L+1EPj8AprY+RsdXrAo+HfEheDWwrueDzPucJDpAyPsT7jYreJadUk39gJBju9RLDX/bEd9MDgDKsODTZHcBAs0y4u75EraomvcPsFOJTxUZxTJTB3990+xCT2xMAnwl2F/HG9Yhr4fHY8jWd4QxWKbH/wCA7+S9S/t5L7Vin8GpXYD0XwmiQcKI1niwU9cJ/kZ1Z/QRrz9hI2OjrAU1yp4JJZ0UVHosCqh+LPsyMEAbTVHyMTpr5svZKTJiUzUE7niuFCHWET+9fdThTNYfaKQEG/tLSK7diQiCMKgHKetvjp0yIICQAReBCacGsofXDVJQvA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 00aa372b-b03d-4865-a4d0-08dedb4cccb5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 10:53:23.5959 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I8x2pM9L+2d9r5/jTbbMmOsGCG7UayzroFbKvyMk4Nr2jAQD0Nulbw07haQymMaKEQB0t0nEaU5Gsz6GlIpT3xdAmvYa1dw4Cga9Z2TgB08=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5129
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


On 06-07-2026 02:05 pm, Tauro, Riana wrote:
>
> On 03-07-2026 18:31, Mallesh, Koujalagi wrote:
>>
>> On 03-07-2026 04:45 pm, Tauro, Riana wrote:
>>>
>>> On 30-06-2026 17:25, Mallesh Koujalagi wrote:
>>>> Add xe_ras_log_(*) macros to report Xe driver errors in a
>>>> consistent, structured format.
>>>>
>>>> Exposes one macro per error category (probe, wedged,
>>>> survivability, firmware, GT TDR, memory fault, IO bus). Each macro
>>>> hard-codes the correct SIG_ID and severity for that category, so
>>>> callers only need to pass the device or GT handle, errno, and message.
>>>>
>>>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>>> ---
>>>> v3:
>>>> - Refer "Tile%u" and "GT%u" strings. (Michal Wajdeczko)
>>>> - Remov xe_cper_severity_str(). (Michal Wajdeczko/Riana)
>>>> - Declare __xe_ras_log() function to xe_ras_log.h. (Michal Wajdeczko)
>>>> - Make macro function properly.
>>>> - Remove *_FIRST and *_LAST macro. (Michal Wajdeczko/Riana)
>>>> - Add sig id documents. (Riana)
>>>> - Change macro function same prefix as the file.
>>>> - Handle __xe_ras_log() function with variable format.
>>>>
>>>> v4:
>>>> - Handle CONFIG_UEFI_CPER properly.
>>>> - Add CPER_SEV_RECOVERABLE in __xe_ras_log().
>>>> - Add xe_ras_log_runtime_fw() and xe_ras_log_device_fw() macros.
>>>> - Update commit message.
>>>> - Remove document. (Riana)
>>>> ---
>>>>   drivers/gpu/drm/xe/Makefile     |  1 +
>>>>   drivers/gpu/drm/xe/xe_ras_log.c | 65 
>>>> +++++++++++++++++++++++++++++++++
>>>>   drivers/gpu/drm/xe/xe_ras_log.h | 62 +++++++++++++++++++++++++++++++
>>>>   3 files changed, 128 insertions(+)
>>>>   create mode 100644 drivers/gpu/drm/xe/xe_ras_log.c
>>>>   create mode 100644 drivers/gpu/drm/xe/xe_ras_log.h
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>>> index e5a04253e73b..cac19c21be08 100644
>>>> --- a/drivers/gpu/drm/xe/Makefile
>>>> +++ b/drivers/gpu/drm/xe/Makefile
>>>> @@ -114,6 +114,7 @@ xe-y += xe_bb.o \
>>>>       xe_query.o \
>>>>       xe_range_fence.o \
>>>>       xe_ras.o \
>>>> +    xe_ras_log.o \
>>>>       xe_reg_sr.o \
>>>>       xe_reg_whitelist.o \
>>>>       xe_ring_ops.o \
>>>> diff --git a/drivers/gpu/drm/xe/xe_ras_log.c 
>>>> b/drivers/gpu/drm/xe/xe_ras_log.c
>>>> new file mode 100644
>>>> index 000000000000..928fa4f45cdc
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/xe/xe_ras_log.c
>>>> @@ -0,0 +1,65 @@
>>>> +// SPDX-License-Identifier: MIT
>>>> +/*
>>>> + * Copyright © 2026 Intel Corporation
>>>> + */
>>>> +
>>>> +#include <drm/drm_print.h>
>>>> +
>>>> +#include "xe_device.h"
>>>> +#include "xe_gt.h"
>>>> +#include "xe_ras_log.h"
>>>> +
>>>> +/**
>>>> + * __xe_ras_log - Emit a structured RAS log entry
>>>> + * @xe: xe device instance
>>>> + * @gt: GT instance where the error occurred, or NULL if device-wide
>>>> + * @sig_id: signature ID from xe_sig_ids.h identifying the error 
>>>> class
>>>> + * @cper_sev: CPER severity (one of CPER_SEV_FATAL, 
>>>> CPER_SEV_RECOVERABLE, etc.)
>>>> + * @errno_val: negative errno describing the error condition
>>>> + * @fmt: printf-style format string
>>>> + * @...: format arguments
>>>> + *
>>>> + * Formats the message and emits a kernel log line via drm_err() 
>>>> for fatal
>>>> + * events or drm_warn() for all others. CPER record generation and 
>>>> hex dump
>>>> + * are planned as follow-ups.
>>>> + *
>>>> + * Format:
>>>> + *   [xe-err] SIG_ID = <id> Severity = <sev> Location = <loc> 
>>>> Errno = <n> Message = "<msg>"
>>>> + */
>>>> +__printf(6, 7)
>>>> +void __xe_ras_log(struct xe_device *xe, struct xe_gt *gt,
>>>> +          u16 sig_id, u32 cper_sev, int errno_val,
>>>> +          const char *fmt, ...)
>>>> +{
>>>> +    char loc[32];
>>>> +    struct va_format vaf;
>>>> +    va_list ap;
>>>> +
>>>> +    if (gt)
>>>> +        snprintf(loc, sizeof(loc), "tile%u/gt%u",
>>>> +             gt->tile->id, gt->info.id);
>>>> +    else
>>>> +        snprintf(loc, sizeof(loc), "device");
>>>> +
>>>> +    va_start(ap, fmt);
>>>> +    vaf.fmt = fmt;
>>>> +    vaf.va = &ap;
>>>> +
>>>> +    if (cper_sev == CPER_SEV_FATAL || cper_sev == 
>>>> CPER_SEV_RECOVERABLE)
>>>> +        drm_err(&xe->drm,
>>>> +            "[xe-err] SIG_ID = %u Severity = %s Location = %s 
>>>> Errno = %d Message = \"%pV\"",
>>>> +            sig_id,
>>>> +            IS_ENABLED(CONFIG_UEFI_CPER) ? 
>>>> cper_severity_str(cper_sev) : "unknown",
>>>> +            loc, errno_val, &vaf);
>>>> +    else
>>>> +        drm_warn(&xe->drm,
>>>> +             "[xe-err] SIG_ID = %u Severity = %s Location = %s 
>>>> Errno = %d Message = \"%pV\"",
>>>> +             sig_id,
>>>> +             IS_ENABLED(CONFIG_UEFI_CPER) ? 
>>>> cper_severity_str(cper_sev) : "unknown",
>>>> +             loc, errno_val, &vaf);
>>>
>>>
>>> There were few comments regarding this from both me and Michal from 
>>> previous rev that were agreed by you but not fixed.
>>> Also let's close comments from previous rev before sending new 
>>> revisions.
>>>
>> I checked with the Arch team. Even though this is logged using 
>> drm_warn(),
>> we still want the output to be prefixed with xe_err because it is used
>> for error handling paths. These messages are generated when correctable
>> or other hardware errors occur, so having an explicit xe_err tag helps
>> identify them as error-related events in the logs.
>>
>
> Why not replace with xe-ras instead. We are using 3 different terms here
> ras, sigid and err. Let's keep it consistent.
>
> Thanks
> Riana
>
>
xe-ras would be misleading for cases like probe failure. Since this 
logging covers

more than hadware RAS, xe-err is  a better common prefix.

Thanks,

-/Mallesh

>> Thanks,
>> -/Mallesh
>>
>>> Thanks
>>> Riana
>>>
>>>> +
>>>> +    va_end(ap);
>>>> +
>>>> +    /* TODO: Add CPER record driver handler */
>>>> +    /* TODO: Add RAS dump cper hex handler */
>>>> +}
>>>> diff --git a/drivers/gpu/drm/xe/xe_ras_log.h 
>>>> b/drivers/gpu/drm/xe/xe_ras_log.h
>>>> new file mode 100644
>>>> index 000000000000..3f94e6747e86
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/xe/xe_ras_log.h
>>>> @@ -0,0 +1,62 @@
>>>> +/* SPDX-License-Identifier: MIT */
>>>> +/*
>>>> + * Copyright © 2026 Intel Corporation
>>>> + */
>>>> +
>>>> +#ifndef _XE_RAS_LOG_H_
>>>> +#define _XE_RAS_LOG_H_
>>>> +
>>>> +#include <linux/cper.h>
>>>> +
>>>> +#include "xe_sig_ids.h"
>>>> +
>>>> +struct xe_device;
>>>> +struct xe_gt;
>>>> +
>>>> +/*
>>>> + * Common backend helper
>>>> + */
>>>> +__printf(6, 7)
>>>> +void __xe_ras_log(struct xe_device *xe, struct xe_gt *gt,
>>>> +          u16 sig_id, u32 cper_sev, int errno_val,
>>>> +          const char *fmt, ...);
>>>> +
>>>> +/*
>>>> + * Driver error reporting macros
>>>> + */
>>>> +
>>>> +/* FATAL */
>>>> +#define xe_ras_log_probe(xe, errno, fmt, ...) \
>>>> +    __xe_ras_log((xe), NULL, XE_SIG_PROBE, CPER_SEV_FATAL, \
>>>> +             (errno), fmt, ##__VA_ARGS__)
>>>> +
>>>> +#define xe_ras_log_wedged(xe, errno, fmt, ...) \
>>>> +    __xe_ras_log((xe), NULL, XE_SIG_WEDGED, CPER_SEV_FATAL, \
>>>> +             (errno), fmt, ##__VA_ARGS__)
>>>> +
>>>> +#define xe_ras_log_survivability(xe, errno, fmt, ...) \
>>>> +    __xe_ras_log((xe), NULL, XE_SIG_SURVIVABILITY, CPER_SEV_FATAL, \
>>>> +             (errno), fmt, ##__VA_ARGS__)
>>>> +
>>>> +/* RECOVERABLE */
>>>> +#define xe_ras_log_runtime_fw(xe, gt, errno, fmt, ...) \
>>>> +    __xe_ras_log((xe), (gt), XE_SIG_RUNTIME_FW, 
>>>> CPER_SEV_RECOVERABLE, \
>>>> +             (errno), fmt, ##__VA_ARGS__)
>>>> +
>>>> +#define xe_ras_log_device_fw(xe, gt, errno, fmt, ...) \
>>>> +    __xe_ras_log((xe), (gt), XE_SIG_DEVICE_FW, 
>>>> CPER_SEV_RECOVERABLE, \
>>>> +             (errno), fmt, ##__VA_ARGS__)
>>>> +
>>>> +#define xe_ras_log_gt_tdr(xe, gt, errno, fmt, ...) \
>>>> +    __xe_ras_log((xe), (gt), XE_SIG_GT_TDR, CPER_SEV_RECOVERABLE, \
>>>> +             (errno), fmt, ##__VA_ARGS__)
>>>> +
>>>> +#define xe_ras_log_mem_fault(xe, gt, errno, fmt, ...) \
>>>> +    __xe_ras_log((xe), (gt), XE_SIG_MEM_FAULT, 
>>>> CPER_SEV_RECOVERABLE, \
>>>> +             (errno), fmt, ##__VA_ARGS__)
>>>> +
>>>> +#define xe_ras_log_io_bus(xe, errno, fmt, ...) \
>>>> +    __xe_ras_log((xe), NULL, XE_SIG_IO_BUS, CPER_SEV_RECOVERABLE, \
>>>> +             (errno), fmt, ##__VA_ARGS__)
>>>> +
>>>> +#endif /* _XE_RAS_LOG_H_ */

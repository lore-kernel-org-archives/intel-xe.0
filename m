Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DABF1E93813
	for <intel-xe@archiver.kernel.org>; Mon, 13 Apr 2026 04:46:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6653F10E081;
	Mon, 13 Apr 2026 04:46:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FYo9DiIc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 198D210E081
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Apr 2026 04:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776055600; x=1807591600;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=sej5hK707Cojur0me7sa+OunUgXXpvwzgC0IxbTu/QI=;
 b=FYo9DiIc5a1be+4AAxD8aNzMgpk9clUAdSScimjJ8/4Np/szahmMFaVq
 YWUqPP1LCpc5TfNNOxtSvdJBejijzVu7qxMDX5KpE69oLboCP7xWCLor1
 4CnAzNegSyp3RyAdIvq28/tB4XvwBAsyUIKuOx9ssx6ZBrC+86CMu+GuF
 naEUwxgk/AmgLEVcnBuzm74n9aCAFJvzzrEDDBLTbC7GIQ2G5OA1Vd8Gv
 Gmt/2ZED4o97uUd5G7ca+r7t4RG9gzC2e7VfigZ46YI5aJWUHRp+jDWHR
 DrXJo5gX+VyDOThu2i/BvGu6HBscFUeONRmvbEUhTGIDo1Xl3B4Y7p40M g==;
X-CSE-ConnectionGUID: 7vbO0wHjQjK+pjVuxk5c8w==
X-CSE-MsgGUID: V68RcEgbRMWFat6Oi4zihw==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="80570434"
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; d="scan'208";a="80570434"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2026 21:46:40 -0700
X-CSE-ConnectionGUID: lRafYslnTgSdHDFeVmlxiA==
X-CSE-MsgGUID: WlOnfqw7Sseo2Mp8SPn4nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; d="scan'208";a="231402070"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2026 21:46:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 12 Apr 2026 21:46:37 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 12 Apr 2026 21:46:37 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.35) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 12 Apr 2026 21:46:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GbhLBnI1uwDl/ElFFDnOwobt0v66hIF28Fe8dCqZ70nc2jxYUyfj1HK/4QVVLhOodmIWoMt6OyqM7r+ZUNbW7Aai7AZ2kLI0KPwURf0xY2kkNYUyKioFyMeQCPpId2XvXtjbO+wmULSvqKdq0Sk0ReMzBBIg4KJGdgYRLMtt1jcvle/zg68KPluIb5fo/VMYlwmOV8Jhb7Me6qdsAUgY8nGEmSCqvMX8oGbD+3QPbXH2QZTnUjhLR1nID76sut6FKbGdIiLV3JxFGCx+oIEtJwY1PYwxBb6JINS0LTugoGD+3cUgwznNRwYum9T9YB0Zi1Hn2YT6oSARgt8zZg//Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nD4fWR6ounE21oW5j6vIa/W27JVCDNdTrhbayxZ9XPw=;
 b=OwBTRnlLCinN2lDgz7rXFWZuuVGA4AMwSxN9faxS9YTXCu1COnXwypNEaUPb9ehc7B/Va75LdONWIMLBOyw4oXkGVgE55tGdawHAwe8nhYcWGJT1QJfBEUoMpuZv1C9mE55c4+WNS2Kqmwk0VSwehhk28bnhqiq+e2nOTfFJuFxglCcrAO8lAWlnID7Z+QiKVyIzOx9P7DRzxRkQ9y8FV4I9BubpMzGfU9XXDoCNYh9OUu1VSIZ9sZ7guhGXrglz+Sq9q/mhLbQZZlz89dMkjpTx9mIDeDBzyXyCGvMkDOfHr3dDzLrb+UNQ8gmUwnPE8MlbSM4WDkYA8iqnH/UMyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 MN2PR11MB4709.namprd11.prod.outlook.com (2603:10b6:208:267::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Mon, 13 Apr
 2026 04:46:35 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9791.032; Mon, 13 Apr 2026
 04:46:35 +0000
Message-ID: <bddccc37-87b3-4451-ac34-35f2ce22ac10@intel.com>
Date: Mon, 13 Apr 2026 10:16:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/ras: Clean up coding style in xe_drm_ras
To: "Nguyen, Brian3" <brian3.nguyen@intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
References: <20260407225913.3397059-1-shuicheng.lin@intel.com>
 <20260407225913.3397059-3-shuicheng.lin@intel.com>
 <SA1PR11MB8839B6A60B4934022AC2F0FEAA262@SA1PR11MB8839.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <SA1PR11MB8839B6A60B4934022AC2F0FEAA262@SA1PR11MB8839.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0180.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a9::6) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|MN2PR11MB4709:EE_
X-MS-Office365-Filtering-Correlation-Id: 89d896c6-e171-4d37-c3c2-08de9917a43a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: Fp/K8J6LTw4YIBB0c+Ivmo//EigngL9LdHTTO3Ps/1fkPDStV/xY7KP2swRbrcpntFq9hVeMcxCpZqiL89HhCiBL3axVb3e9YLBasPgpF3bzJ2CoYu8p23s2z5aZLO5gFThoHsj9pl7vJovYXdXewGQdffIdnfg4moiRoDxpdj1ypMw5u+LXTQSueXNRjZxW8k5tZb6U21yISNyV0mQTxFXU6GnJpThOwX/d+m3yVxHh7HLTtbJSUbs63mgs6tKPGOGxMryLG0a14jzZVJ/clVOUInKg+DR/wfvumTsTgIo1bhCqluPckMXkEg4TE5EWeDOpI4YVJyxoWGhrvbc+CVcwue4/zIviMIquRlN09Rq3Co/dt0H6d65ziyjsaj5oGpKnwgsgQx/ekSb2DbViARPB3qlEVq9PARAI5r1dTxYNeNUCVO2Qpq6ebHfHsR+YFLYtIgT06WanbYsFmGNualKHcYb/SrHck2h7i7JqwUVFRJHZTwtvnUUv3FD3kTxLp4J82uPeyljRkA7/4h2VIq4IV1Xc65qYaP+OCWv5VuZByMCNNAJwzYyavy1YrhBsViBDE5yRLTTw8Iod/9w/2bYwMbzV2ZK1Fy0DbTboOxHFhBob2dC4dl+lIRFHujxjywHPE0TNdLQgSSdsBrZBNEzhi+1mntjZMDgG4opw8R22OAd6BmgUCHw5ou2gwwxLKfFYDNAco9CVZpwNcKZr3+Z4ukkJ5i6nyFHYaHfyzng=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aitrb3JLZ2dZREkzNWhjM0ZIRnVzN25nZnhZb1pjd3Q2bndzdThiQmFNTzNz?=
 =?utf-8?B?OCs0MXVnd1NtVmZRYURkeDZsRVJjRkNxSlc1MEdkd2haaU4rSTdlR0xXY3BQ?=
 =?utf-8?B?WWg3Vk1qVjhSUVFQbHlFYlZQck5wWVZLdm5GTFNaVSs3eVhlTXBaUVdxWjI5?=
 =?utf-8?B?Qng3N1ZLSkhhRk8wZWMwSzVhSmhja2Jyc3pZTWpMSEFJL2pyK3VPL1VHeFZj?=
 =?utf-8?B?Q0VESDNEdEMvU25yeVBkd2pMWVd4UU9kc2ZiQVNkWXZlUmtKS0RSSzU0YUJ0?=
 =?utf-8?B?ZTdsT3VLTEozMmdZR2c2anFJdmxKSUN3Ty9ERkF6V3ZBZ1Z4czBaWFppTm9x?=
 =?utf-8?B?UnF2U1p6M200TytyWTdnN3VXQnE1Q3JGWXhuOVFVQVpkVmtKdmxEUmd0UEtx?=
 =?utf-8?B?cDVwNmpsOG1UTjJyaVk3cWhRTmMyWVMzT0VLZ2xma0dONlQ2ZFV2MWxZQ25C?=
 =?utf-8?B?c3VCWFRmdThRVWFRa2ZLSGpieVlHQmNVRzEyRi9rUEZtZjVxTlBFcThGWmhR?=
 =?utf-8?B?OThaWmJFTUI1Q29TVnhPMU8vblpFSEl0UnEwSnpSUTJtSUk1S3Q0eXEyTDhz?=
 =?utf-8?B?NGlUcDdJUVpZUmNFaVFRdURIdkFYQ1JrVU5lS3Yzb1NoODQrZHJGSFJnZWpX?=
 =?utf-8?B?YzgzL2l3bFhGVS9WUzI5SWV5d3lqb0RvWndUYlExT09qYWM5cGowWml4eHNq?=
 =?utf-8?B?OFBRalZKWitTclkwb1d2K3V2TkRWN3FJb0VDMlFBQ3ZFN0hmMEZPKzJTWEF6?=
 =?utf-8?B?eUEyeCtRdG5BSnc0M0FPcVh3RlM1RWpVd1FVOEdWNjZzR3Jjc0ZOM201ODlP?=
 =?utf-8?B?QlZ0QXBoMkFhSlBYWW5JMUZEV3Boa3lUYzljd0V1eXp1WXBzSXNoQ1EzcVlw?=
 =?utf-8?B?bWswdytvSXcvYXRXWlQ1dHFyeEFvRFVScFFKQnd3cFdlV0NYMWVlMVlhZUtk?=
 =?utf-8?B?YlBncUt5TTVkUHluOUszK3Boa042b2VLbnd3NWRvZUVUbHlJZXV3TmU2VWtp?=
 =?utf-8?B?Zmc4anhXUEVvdFMzMHhiTEpsN09tKzRQbmZNb25DNk1BNEJGMTBEVk5YZDMx?=
 =?utf-8?B?cVlYVXd2V1JnTjU5dS9YTGRiazg0YVhHN3dFV1Q3Vk4rbmJUYkZGbExmeGFz?=
 =?utf-8?B?cnJnS0JROXlSaWh4eEMxSVBZd3UweGNMYnhkQmxPY0hEVkRXSWE4RlJhM2k4?=
 =?utf-8?B?b2RFYzNzQUxHOWxJNEpmcTRhVk1qb2ZUQnRTUXdWTUV2Rks4S3dEYTl6VWhp?=
 =?utf-8?B?MU1GMklXS1ZJRUlieTEyRFYraTZKSC9Mb0UzRW0wTmYvTkZyakpTbVYxVDMv?=
 =?utf-8?B?LzVnTXI3bXZ0Y3AzNiszajRhUnRkd2FsRlVjeTE3aFRUdTZET1JDZmNmSWRi?=
 =?utf-8?B?YkgxZnhWMVFFNEF1ajhrRFZ1ZUNjalBQV3czYXJMNGM5ZWQyeG00SnBPMTFG?=
 =?utf-8?B?K3Y1eGR3WVZKaG5qSTNIL2YzSDVveUFpMXVTc29neXM4VERWVmxHU2N2bEJG?=
 =?utf-8?B?Z25taVh6dExxZFVoZ1h3SmJ3cmNXWFJhdTR3WXJtdDl2MGZHYUk5MkVIZ1Jw?=
 =?utf-8?B?Q0RnejUrQzZya2lRS1BhTURyQi8reFZiWGg1V1N0UFVmYXZzc1hlNVJ6cmo3?=
 =?utf-8?B?TUV3RnlSTkdLS3JScHU3MFE4MkowOThuSXZ6UittZUxSRlRuSUU2a21DM3hE?=
 =?utf-8?B?cEhhaHFpM0xrSmRwTkZtWVZORzZVQitsVmJNakVhRDgyZDBDRlU5WWxzN01K?=
 =?utf-8?B?QlFPdWhyTDM0Vk11KzI1ZG9sVVNTeWx4WDVZMnhPT0x5bjRmdHRlUlRWbzhI?=
 =?utf-8?B?RldHRnY4cXJDYU9mbElqazc3alNPbTUrSmtGUGE3ZlB5aEhTb09EcjhBaWtw?=
 =?utf-8?B?YXkrSytMNFNsZWVNVUtSbzVGQ2ZpMVBDcmloVysvTjJOY1cwNWhZa3JBM0pw?=
 =?utf-8?B?UnBBU0xDT2NlWFhSeEcvMkVIT3JvQTArZWpZTC94bS80eDV0aFhiVkR4YTFv?=
 =?utf-8?B?VlM2blJ4WjRabGFseE1xZmNDdFZnNlZ0M3ZRVnZndDdXU1JNcGR3a3pRSUhV?=
 =?utf-8?B?NGVRTmJlL1hOaU5RbWMyaDQrVk5tVXBLR2hLUC9reFVrcnRrd0t4cERpYkl4?=
 =?utf-8?B?NUNCTG9uTUlweXlOZVBxUHJHS2pxZTF1KzdUTE9rcGZrTkdLSHdpaVYwcmNy?=
 =?utf-8?B?Y3RpcEtZQ2FNaVI2UU9BN1ZGOThGNzhTMTI3eld2YUZ4bFFqWm01RW9hUWhE?=
 =?utf-8?B?Tnl6a0M2SWFpZzVqVjlmOC9VV00zWnNUak92L2JmSGt0bFJ2Y1V5RlEyd3VC?=
 =?utf-8?B?Q2o2NFVudDBmNE1JL0IrMTFVdk9SZExsbUs4dkhWQ1FsZkczdnFHUT09?=
X-Exchange-RoutingPolicyChecked: TtDvebNl023NcMgyhv/x8Xw0dHnRvOLUzZIBs2z9JUWi010epCcXVs9SRpC5gMoAIoJ8O9bIvMFjqSNuDX/yWPilrQ3uAq/qaXmv31qb2itPQkvYlnev7f0pb1IS+rDHV77gGKobaRHyi4DezsKOVkfUrTYi6CB0W3UpH8sMLEi2NDC2x816f07OFI8Br/Zgz9gKC3TmwTs04ARNC6AhqTmHn7e8CoFkMMBnGoxfewCFeMBXweeTsrcilTSjXoXrqd9Gr1aRT/8Nz/n/RT+GiTikEPnhxlGtzFhd0muXlkMq3Erx5MV8CqWHxpzDn+xBaUASbkvDkAz6uOlKkRllHA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 89d896c6-e171-4d37-c3c2-08de9917a43a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 04:46:35.5190 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GAn0gMqbJydIVcYEWvukt1FEG1EpxdP3hiDtKW2ADsjbSwiCYKGXTqrJHX7GPE2thaEGHMA0oa1bLNel+twt8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4709
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


On 4/11/2026 10:24 AM, Nguyen, Brian3 wrote:
> On Tuesday, April 7, 2026 3:59 PM, Shuicheng Lin wrote:
>> - Fix long line in cleanup_node_param() signature.
All checkpatch errors were fixed in the original series.  The line 
length is in-line with checkpatch.
Please provide the checkpatch error if you are seeing.
>> - Drop unnecessary const on pass-by-value enum parameters.
This can be added as part of any other functional series. A patch just 
for this is not necessary.
>> - Simplify xe_drm_ras_init() by removing redundant local variable
>>    and redundant error path.
Any reason?

Thanks
Riana
>>
>> No functional change.
>>
>> Cc: Riana Tauro <riana.tauro@intel.com>
>> Assisted-by: Claude:claude-opus-4.6
>> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> Reviewed-by: Brian Nguyen <brian3.nguyen@intel.com>
>
>> ---
>>   drivers/gpu/drm/xe/xe_drm_ras.c | 19 ++++++++-----------
>>   1 file changed, 8 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_drm_ras.c b/drivers/gpu/drm/xe/xe_drm_ras.c
>> index 802e4bcb731c..9cddad2be549 100644
>> --- a/drivers/gpu/drm/xe/xe_drm_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_drm_ras.c
>> @@ -68,7 +68,7 @@ static struct xe_drm_ras_counter *allocate_and_copy_counters(struct xe_device *x
>>   }
>>
>>   static int assign_node_params(struct xe_device *xe, struct drm_ras_node *node,
>> -			      const enum drm_xe_ras_error_severity severity)
>> +			      enum drm_xe_ras_error_severity severity)
>>   {
>>   	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>   	struct xe_drm_ras *ras = &xe->ras;
>> @@ -109,7 +109,8 @@ static int assign_node_params(struct xe_device *xe, struct drm_ras_node *node,
>>   	return ret;
>>   }
>>
>> -static void cleanup_node_param(struct xe_drm_ras *ras, const enum drm_xe_ras_error_severity severity)
>> +static void cleanup_node_param(struct xe_drm_ras *ras,
>> +			       enum drm_xe_ras_error_severity severity)
>>   {
>>   	struct drm_ras_node *node = &ras->node[severity];
>>
>> @@ -174,15 +175,13 @@ static void xe_drm_ras_unregister_nodes(struct drm_device *device, void *arg)
>>   int xe_drm_ras_init(struct xe_device *xe)
>>   {
>>   	struct xe_drm_ras *ras = &xe->ras;
>> -	struct drm_ras_node *node;
>>   	int err;
>>
>> -	node = drmm_kcalloc(&xe->drm, DRM_XE_RAS_ERR_SEV_MAX, sizeof(*node), GFP_KERNEL);
>> -	if (!node)
>> +	ras->node = drmm_kcalloc(&xe->drm, DRM_XE_RAS_ERR_SEV_MAX,
>> +				 sizeof(*ras->node), GFP_KERNEL);
>> +	if (!ras->node)
>>   		return -ENOMEM;
>>
>> -	ras->node = node;
>> -
>>   	err = register_nodes(xe);
>>   	if (err) {
>>   		drm_err(&xe->drm, "Failed to register DRM RAS nodes (%pe)\n", ERR_PTR(err));
>> @@ -190,10 +189,8 @@ int xe_drm_ras_init(struct xe_device *xe)
>>   	}
>>
>>   	err = drmm_add_action_or_reset(&xe->drm, xe_drm_ras_unregister_nodes, xe);
>> -	if (err) {
>> +	if (err)
>>   		drm_err(&xe->drm, "Failed to add action for Xe DRM RAS (%pe)\n", ERR_PTR(err));
>> -		return err;
>> -	}
>>
>> -	return 0;
>> +	return err;
>>   }
>> --
>> 2.43.0

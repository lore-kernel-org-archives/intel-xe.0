Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D127C2BD09
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jun 2024 23:15:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE40910E15A;
	Fri, 28 Jun 2024 23:15:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HDw9XSti";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6DF810E15A
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jun 2024 23:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719616509; x=1751152509;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=eQI/eynmJDGDQFlDyEi04K8H1RXRQWZM/q7hctiw4iA=;
 b=HDw9XStiI98tCTPAOaBPuiVfkh3JbzOd/RSwMhtERlRFpxP0D4gKzOZy
 qqRy290D9vpOsBDzDWxKft4JO5iATJ0u+TsPumkJ8m0d56CA8vsl3YGYW
 0XcS13fC2xVQAgOsxeyzaJtp1m/sPRWK1SB7eHgWCVC5D/BC/pqh+J3Gm
 IZ752VuJOYaAqKFG5T8ZIl7vJSR4bkGKSenRZFCl3oTXSQ3FwATZMXp80
 TmXTail7z8StOelfAcoN/KSUq5Q0O9j6fEfrkl2iSSusPlcdCoSASH7X0
 ZUu10b8V48qODpsJcg97gSoVtHyXvm3Gx2PSmZ+1aVC6ZMAOv3iT1cLpU w==;
X-CSE-ConnectionGUID: QIJDy5nMQ5mRB6Sn7JC+pQ==
X-CSE-MsgGUID: iLui3EY6Rri6BRM6tIJVvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="17039447"
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="17039447"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 16:15:08 -0700
X-CSE-ConnectionGUID: Z03Fq+3kTLin80Ce4uNvVA==
X-CSE-MsgGUID: aJFXXds3SM+FhVzE4SCTog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="76066089"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jun 2024 16:15:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 16:15:07 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 28 Jun 2024 16:15:07 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 28 Jun 2024 16:15:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kpZHotwddoN27ATWOeJvQxzft5/h6Vz76u62ua/r3Ux5Tgc6yHbscfTvfwDENhEkfo9HO9okGB0UazrBZDVpWvWE0gYbEPwSJZ+gsa9Jqfik+i1+jYGE2vjE3gKJv6I4pwhYYYc6P7p4NPuldmWsbFR4daGcD02aP8cTxEkm73ViVBGvPlnbRuQPJpx5LLBM0ZIcJwjsxp4S63r08HAA98Z2LpcU2hJd+yVVzfdAZq5JCQcnmLtFLcYtIhRwFLrTZ6+2ko79HVThoWYQyrW9Sw5HTD3Ef7O0mQbsusUR/a9aBgGRW4pArb/+gyywJSc4JlmV9W1ugrJ0Ti5Z/y7HdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ygxWY3JIFsqoFUQYSLVHHKDRKHIj6zUfLRsLaS92ZZI=;
 b=fRxcFMyyDcXfiZ4UoplQV+YfRXMAZUnh6ERm9VcTSUCfoFhcv62lz+yGaye8PfnAquGDGl8liJ891ZbfNFlRJhkl3Pd33/HQ0g34Aqk7rjg8b+uJi/vUY2mEbu2FaylSi6SOtdexC52gSJ8KuFSdDJZo3w4iLjG9L1VBq0UBHIQapm5a07Ag6YmYXjJ7DGDJ9424FEQxLOybJK6XLhwHk9LlCXcH+ZjJTdjNIktqyd7Iwk016GCmXVJl+RGtwcBTGkv48ZeOIa0KUY1OcPSOAXLo3f/qF5uBFu+UhHkM4xU5mPIZ0FdVtFd5U5D5Yr1S5+zVKD9mtD/QgZfqWpW8EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by DM3PR11MB8683.namprd11.prod.outlook.com (2603:10b6:8:1ac::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.34; Fri, 28 Jun
 2024 23:15:04 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%6]) with mapi id 15.20.7719.022; Fri, 28 Jun 2024
 23:15:04 +0000
Message-ID: <e5e214cb-7255-485b-afea-ded22fcd0e40@intel.com>
Date: Fri, 28 Jun 2024 19:15:00 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 3/5] drm/xe/guc: Add capture size check in GuC log
 buffer
Content-Language: en-US
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240624215404.3213075-1-zhanjun.dong@intel.com>
 <20240624215404.3213075-4-zhanjun.dong@intel.com>
 <2f167ef2-dd2a-4560-85b3-b80a46fc0baa@intel.com>
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <2f167ef2-dd2a-4560-85b3-b80a46fc0baa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0352.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::27) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|DM3PR11MB8683:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fc10198-07bc-43c7-bbfc-08dc97c824a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q1JTR3E0RlZ3T2tnZWFCK1dPNzhIZi9sMHZsZGFtbnArMDVHVjRGSkdkTHpz?=
 =?utf-8?B?bVp3UC9NUjdkNU95N3NYZUI2YktidkwrZWgwclpCQjhGMm5yRnJzczFhVWlH?=
 =?utf-8?B?enBsbGYxN0d4OW15NDVFUS9TSktoSm10MFhrUnlnNE8zU2ZCQitsMlNLaTgv?=
 =?utf-8?B?a3hLbFVFVHNtbXA0OWlpK1dFMTlCVEI1cFNzTDgrQ0RRY1U4ZU4yWWVIanZS?=
 =?utf-8?B?NndyRVZwQnd1OS9HS0lXZzRBTmZVMGFrV2ZwSTVYSFR5ZFBTUEFWdXprbzc1?=
 =?utf-8?B?VnF1V3J6bVVqQXJhM2lZd0hpcDNubzBWbnJFMDFLdWhEa2hYTWRycG1HdHdM?=
 =?utf-8?B?MkdjYU1ybUZtZTNMdDQxZVJiMFhobEFSN1R3citra2JSSTJ1T0JqVWF2akpQ?=
 =?utf-8?B?dDJyWUJkbmZISXo5UEkwUEtESVZhdUZ0M1ZNMUpjR1ZHM2J5ZnVLTVI0YVh5?=
 =?utf-8?B?amxPTmFhT2Nsd212ZjhTaVh3MXhOUGEzTTlibGZza3VZZEhkT2xLM3ovUXd3?=
 =?utf-8?B?ckhCeklDTDhLR1hsVm13aGpNV0JUTXZKVUVOQ0UvYWpGU253bXhNb25SdlR1?=
 =?utf-8?B?eDJvZFQxR25QbWNXb0pFMUU0VThTRDBYK3BUdFVGQ2JGODlmUWN3WUpBODNt?=
 =?utf-8?B?ZVlyTXNyVDVyTFU3ekw5N0Q5LzZVZWRPckhrTHU4VisyalhyVk5FTzRTcXlT?=
 =?utf-8?B?YjFNaEI4dTNYQXRCNGI4dXZGMmZYSGN5ejU4YWNJVUk3OUIxK2cwM2FQblgw?=
 =?utf-8?B?ZU1wQ2xEYm9nWjYrbU9LZGV3c2Z3TFZKL2NMN0tZWGFpTis0em9kaHFTMlBE?=
 =?utf-8?B?Qnl3ZEFPZXkweUFqS1dmSDFvay9henpZVEpMR0F1ZlBpZ2M2b1lBcCttemhI?=
 =?utf-8?B?M1NJeER1bmZzUURDUFNqdDAxYjl0RUhEcWdyVUtrallEWmFMUlB5N3NpQ2F5?=
 =?utf-8?B?M3hvMnBXUytxRlEyVGZSU3lhYWhzWm4yMVkrTW05dGhJUE5jQm4rU29JSkJQ?=
 =?utf-8?B?MWdsY0JvaXJPTTMzbVFDTkdGVmIwK2lZaWZTcWh3YWE0UTRGMGVlM3R4dWtv?=
 =?utf-8?B?SEp0ZDlmQnhNL0psQ0UvSkFNOVZ1KzNHUHo0NExJMUx4alN1U0xPNmVFL1hV?=
 =?utf-8?B?ZXhaRTM5WGtaV2dkenhGZGpTaFpiUzBTQnpKdG9CVGQ3cWdFOExxL1BFa2RJ?=
 =?utf-8?B?NHhVMjgyZlJWSVc1bHpVd2ZpNVErNGd4eWozVFFzaHBKWEQvclVxNVFUa05n?=
 =?utf-8?B?dG82UVBXTld3Si9HWTF6YnFvOStuNElMb05Fc3VhTHgwRktSTnBTQm41VUJS?=
 =?utf-8?B?cWRnVlVuL3YwMmdacXdsVDg5dXFpZ001WkVZT2xMZGU0eFJqSVMrU2dOQUli?=
 =?utf-8?B?clZqQjkrV3pvU0N3OFhpU1YxMDBWMnYwWXhnb0g2djRjMU9oOVRoKzJ0bGtJ?=
 =?utf-8?B?MENhVDdzRHU2eFc2VVJXdktRWVRHR1NPMk9OQVNHaHo1Vm9LMGpMQ0ozaVRP?=
 =?utf-8?B?T09DV1pOM0p3dEwydnZxMlNPQVU3MXUyREJPU3RHUk1IQ3REa0RMd1FhSUpa?=
 =?utf-8?B?KzN6dEZLblBnUEROR2cxdzJlcmR4djlnTERrUzFJSjUwdWNoY1Z3N05Ibkor?=
 =?utf-8?B?ekEyZ25lYjhCaFRteUk2aVlCOHlqVExXSEVwUE1HOWRnMnFEbXBXUk00c2lL?=
 =?utf-8?B?YlVUZjYxV0Z2bDdldzdWaWFqeTZhdlVRVEU4elFwbS9jTDA3SjlNek00cFNR?=
 =?utf-8?B?UkhXcDZPM3paOForbnd2RmZDeXVXNFBpMi9pS0lvWDVaaXprMzU0ZXBHeGdW?=
 =?utf-8?B?ejJhNDFFOVFWRGZXWTlmZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aC9MMnM2WUZrVDg5Q2ZmMjRNQ2Z4SjdhVXBWejZlMmo4Y00zTlNTUFBsd0lx?=
 =?utf-8?B?cXorR2lIRnlIZ3ltMk83cHBua25lZTY5QVU4czFvTEpRNCs4b2Y2SVJHcmRV?=
 =?utf-8?B?ZXA4OHlvL1hHZlFaMXZ2UndVbjRGYlp5Zy9oZVpKMy9YU1dRWUNKeWZnQ0VU?=
 =?utf-8?B?WHVnNjNteldkUVBXTGVGb3h0M3hEUkxoVXRoc2p4b1U5SGliV0N4YUdDVm1l?=
 =?utf-8?B?WGNocDdtTy9pQXowNk9XYmZJcVRyNWhlYjdLZllHbWZmWm5BZndTVUlQSGM0?=
 =?utf-8?B?VmJINndoaUd0YU5QZWJLSSswdktraEJiMlliclhSd2xGK0VhNHF3YlhrUVVz?=
 =?utf-8?B?T1d0WlM4YnJGaGFCRkIrbWVFaElmT21qTzNYWFpJOWlvbmg2MC92TjJDTzF4?=
 =?utf-8?B?Skl2UjA4Qk1jbTh3d1lkVGZKdlB2WTY1MSt2VnB2L2xBRzB3Q0xlNitKZHZK?=
 =?utf-8?B?b0JIL2dtODVaT2lrYXdUL29wNHJINjEwN3FheXkzaG9TRHM5SzFFdTVHaUpH?=
 =?utf-8?B?blJhSVlBQmluNzdreVBVNTY3V3JBVG9ha1NrOHlYL0t0dG1LNEpidVlnUHN6?=
 =?utf-8?B?U1FhRXEzN1FLRURnMEVHRjFoR21SUG53NmozSFlUT3d0Z1ZNdnVPeUNBSTFV?=
 =?utf-8?B?SXMrSlFGcEdXay83THFSVGhVMGc2cjV6UW5MY0JIeGlYUkptS3hNV0toQ0F0?=
 =?utf-8?B?UEFOc2tKV2d3Z09CNUE0REpXRWpXWklQUkhIMmlMeUFYVWtDWG1JTzBXNTUx?=
 =?utf-8?B?M3MxUGJNSUZ6OUxET0lwU0VwTVZXMDdaUmFnUTRkZzM5NGcweENDRHFRMlEx?=
 =?utf-8?B?UFZKOHk4VzJXWnNTNVNvbGlMU0lKTmdWTWF0bS8wWmZHL3RYK01zTHJhcFlP?=
 =?utf-8?B?c3puMEJNT1U1bjd3SGptYXlZVzRhUzdLRGtld3l0NU12cERSRlE2TlFvNzJO?=
 =?utf-8?B?Y1BFL0Z2bnhDdCs1anV2Yi8zUzIyNjUwR2hpZFBROEp6N0tVZU01TzdMd2Nz?=
 =?utf-8?B?MDhpaUNXbndVaXNZWjdqckRDSERvTmpRekt3cWRzZllYc0UyS2pva2RseXRO?=
 =?utf-8?B?d25wZW5OcWM0WTA1cGk2OVFKcTVxQWtIbDNnSXdkQTJSVklTZlUxVjF3L2Vs?=
 =?utf-8?B?VnFyREJRN3lPUzZYejdHNlhUdWN3QzlNRnhkRWFsZDFZMlRhZnIyZll1djNh?=
 =?utf-8?B?b1c5Vjg3UjZYNWZpY09QaFBRU3N6U3ZYdTVvcVFxZ24xYzlUU2d0Qklnd1ow?=
 =?utf-8?B?NnVZeGRpUDFaeEtIaHVSZFVhbzJmMlhka0ZBZXkvUzUrTWY3MXBIQXYrUzJE?=
 =?utf-8?B?NWJFOVhXUVNBT3pNUWRYY01ERTB5dDBKamtUeW9PNTZVbGZ1eUJxSVdxUG1N?=
 =?utf-8?B?cituZUl6blBaRHhTMFpHeVk5Y1ZIWWJXdE03ZmllUFJHT29LYitXN0E2Ymo1?=
 =?utf-8?B?ZzJPZlYyakw2Q1RuenludmxIdURMU3NHZXZlWDk5UmVUWEJ5Z0xwU1lLNjV2?=
 =?utf-8?B?UVd6cDlUUThudFdUckhVcWFEck8vaW1VenMrOG45TjV5cERvb0M5K0JrUnFz?=
 =?utf-8?B?MnFZY3dFd2psamYxVlpRWjhpNElLRnBBcktySlNrYzFWVWQ0NithTlM3UGl0?=
 =?utf-8?B?WHQ2a3hCV21XakhJK0dhaXlPUks1U09KYmFtczExTC9oTktKOTBPV01UTTUx?=
 =?utf-8?B?Q2pPckVjTUNOcnM1aUVLcm5UT1Q0Yy9BWlpQVWJvakVXYXVFMllJa2tma21w?=
 =?utf-8?B?UHpNMzd3NlpabGxJc1BhZ1NyanN2SEpibXR5ajdKRU12MXc3KzUyTjg5NXFI?=
 =?utf-8?B?SnI1cWZnT1prRE5HMUtKbnlTRzYzdnNVditkME1aOHlTWE42SWFMbml5UC9Q?=
 =?utf-8?B?V2ZaVS83OU1Ednd3QVB4ZkFVWElya3kzVHRFN0pyNUF6K0M4WXlPbXJsVVlt?=
 =?utf-8?B?TTd2ZTJGU0RKcU9rd012aWNUNTcybEdGb0c5b2ZBVnZQSVA5Smg3UUxyTGcw?=
 =?utf-8?B?MUlNN3VLUSs3aGxUQVdHVGVBbjcrRm5UeUlpSGordEZHMnFYbzJkTTArWGhh?=
 =?utf-8?B?U1Vha1VXd2VSaHJnWnBRaThIVEFJMjkxY0tyWVRlSUwveXphUUJCL3hnOWZT?=
 =?utf-8?Q?WaJpctAnUA82DC/TJ/I00W6ly?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fc10198-07bc-43c7-bbfc-08dc97c824a8
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 23:15:04.5552 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: woO0pWaiWrF8k70uvrfUtuGZoUl3OtJkEWRGZ4z5s2nDIybJWuIervDynzQgQmGO7TJBwqQpbsDw9XIuE2ndMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8683
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

Please see my inline comments below.

Regards,
Zhanjun Dong

On 2024-06-27 2:56 p.m., Michal Wajdeczko wrote:
> 
> 
> On 24.06.2024 23:54, Zhanjun Dong wrote:
>> The capture-nodes is included in GuC log buffer, add the size check
>> for capture region in the whole GuC log buffer.
>> Add capture output size check before allocating the shared buffer.
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>>   drivers/gpu/drm/xe/abi/guc_log_abi.h  |  59 ++++++++
>>   drivers/gpu/drm/xe/xe_guc_capture.c   |  81 ++++++++++
>>   drivers/gpu/drm/xe/xe_guc_log.c       | 205 ++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_log.h       |  17 ++-
...
>> +struct guc_log_buffer_state {
>> +	u32 marker[2];
>> +	u32 read_ptr;
>> +	u32 write_ptr;
>> +	u32 size;
>> +	u32 sampled_write_ptr;
>> +	u32 wrap_offset;
>> +	union {
>> +		struct {
>> +			u32 flush_to_file:1;
>> +			u32 buffer_full_cnt:4;
>> +			u32 reserved:27;
>> +		};
> 
> maybe instead of defining the union and bitfields, just provide GENMASK
> like it's done for other ABI definitions ?
Ok, to be changed.
> 
>> +		u32 flags;
>> +	};
>> +	u32 version;
>> +} __packed;
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
>> index 9c473aceb402..c2a08d4a6751 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
>> @@ -22,6 +22,7 @@
>>   #include "xe_gt_mcr.h"
>>   #include "xe_gt_printk.h"
>>   #include "xe_guc.h"
>> +#include "xe_guc_ads.h"
>>   #include "xe_guc_capture.h"
>>   #include "xe_guc_capture_types.h"
>>   #include "xe_guc_ct.h"
>> @@ -558,6 +559,85 @@ size_t xe_guc_capture_ads_input_worst_size(struct xe_guc *guc)
>>   	return PAGE_ALIGN(total_size);
>>   }
>>   
>> +static int
>> +guc_capture_output_size_est(struct xe_guc *guc)
> 
> nit: no need for line split
> 
>> +{
>> +	struct xe_gt *gt = guc_to_gt(guc);
>> +	struct xe_hw_engine *hwe;
>> +	enum xe_hw_engine_id id;
>> +
>> +	int capture_size = 0;
>> +	size_t tmp = 0;
...
>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
>> index a37ee3419428..0188bc0a2b84 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_log.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
>> @@ -9,9 +9,22 @@
>>   
>>   #include "xe_bo.h"
>>   #include "xe_gt.h"
>> +#include "xe_gt_printk.h"
>> +#include "xe_guc.h"
>>   #include "xe_map.h"
>>   #include "xe_module.h"
>>   
>> +#define GUC_LOG_DEFAULT_CRASH_BUFFER_SIZE	CRASH_BUFFER_SIZE
>> +#define GUC_LOG_DEFAULT_DEBUG_BUFFER_SIZE	DEBUG_BUFFER_SIZE
>> +#define GUC_LOG_DEFAULT_CAPTURE_BUFFER_SIZE	CAPTURE_BUFFER_SIZE
>> +
>> +struct guc_log_section {
>> +	u32 max;
>> +	u32 flag;
>> +	u32 default_val;
>> +	const char *name;
>> +};
>> +
>>   static struct xe_gt *
>>   log_to_gt(struct xe_guc_log *log)
>>   {
>> @@ -96,3 +109,195 @@ int xe_guc_log_init(struct xe_guc_log *log)
>>   
>>   	return 0;
>>   }
>> +
>> +static void _guc_log_init_sizes(struct xe_guc_log *log)
>> +{
>> +	struct xe_guc *guc = log_to_guc(log);
>> +	static const struct guc_log_section sections[GUC_LOG_BUFFER_TYPE_MAX] = {
> 
> you don't need to specify array size here, let the compiler figure it out
I would prefer to have GUC_LOG_BUFFER_TYPE_MAX here, to prevent 
unpurposed sections add/delete.
> 
>> +		{
>> +			GUC_LOG_CRASH_MASK >> GUC_LOG_CRASH_SHIFT,
>> +			GUC_LOG_LOG_ALLOC_UNITS,
>> +			GUC_LOG_DEFAULT_CRASH_BUFFER_SIZE,
>> +			"crash dump"
>> +		},
>> +		{
>> +			GUC_LOG_DEBUG_MASK >> GUC_LOG_DEBUG_SHIFT,
>> +			GUC_LOG_LOG_ALLOC_UNITS,
>> +			GUC_LOG_DEFAULT_DEBUG_BUFFER_SIZE,
>> +			"debug",
>> +		},
>> +		{
>> +			GUC_LOG_CAPTURE_MASK >> GUC_LOG_CAPTURE_SHIFT,
>> +			GUC_LOG_CAPTURE_ALLOC_UNITS,
>> +			GUC_LOG_DEFAULT_CAPTURE_BUFFER_SIZE,
>> +			"capture",
>> +		}
>> +	};
>> +	int i;
>> +
>> +	for (i = 0; i < GUC_LOG_BUFFER_TYPE_MAX; i++)
> 
> and here you can use ARRAY_SIZE to get rid of TYPE_MAX definition
> 
>> +		log->sizes[i].bytes = sections[i].default_val;
>> +
>> +	/* If debug size > 1MB then bump default crash size to keep the same units */
>> +	if (log->sizes[GUC_LOG_BUFFER_DEBUG].bytes >= SZ_1M &&
>> +	    GUC_LOG_DEFAULT_CRASH_BUFFER_SIZE < SZ_1M)
>> +		log->sizes[GUC_LOG_BUFFER_CRASH_DUMP].bytes = SZ_1M;
>> +
>> +	/* Prepare the GuC API structure fields: */
>> +	for (i = 0; i < GUC_LOG_BUFFER_TYPE_MAX; i++) {
>> +		/* Convert to correct units */
>> +		if ((log->sizes[i].bytes % SZ_1M) == 0) {
>> +			log->sizes[i].units = SZ_1M;
>> +			log->sizes[i].flag = sections[i].flag;
>> +		} else {
>> +			log->sizes[i].units = SZ_4K;
>> +			log->sizes[i].flag = 0;
>> +		}
...
>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
>> index 2d25ab28b4b3..ea9e79ccd314 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_log.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_log.h
>> @@ -7,6 +7,7 @@
>>   #define _XE_GUC_LOG_H_
>>   
>>   #include "xe_guc_log_types.h"
>> +#include "xe_guc_types.h"
>>   
>>   struct drm_printer;
>>   
>> @@ -17,7 +18,7 @@ struct drm_printer;
>>   #else
>>   #define CRASH_BUFFER_SIZE	SZ_8K
>>   #define DEBUG_BUFFER_SIZE	SZ_64K
>> -#define CAPTURE_BUFFER_SIZE	SZ_16K
>> +#define CAPTURE_BUFFER_SIZE	SZ_1M
>>   #endif
>>   /*
>>    * While we're using plain log level in i915, GuC controls are much more...
>> @@ -36,6 +37,11 @@ struct drm_printer;
>>   #define GUC_VERBOSITY_TO_LOG_LEVEL(x)	((x) + 2)
>>   #define GUC_LOG_LEVEL_MAX GUC_VERBOSITY_TO_LOG_LEVEL(GUC_LOG_VERBOSITY_MAX)
>>   
>> +static inline struct xe_guc *log_to_guc(struct xe_guc_log *log)
>> +{
>> +	return container_of(log, struct xe_guc, log);
>> +}
> 
> do we really need to promote this to .h ?
Sure, will be removed from .h
> 
>> +
>>   int xe_guc_log_init(struct xe_guc_log *log);
>>   void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p);
>>   
>> @@ -45,4 +51,13 @@ xe_guc_log_get_level(struct xe_guc_log *log)
>>   	return log->level;
>>   }
>>   
>> +u32 xe_guc_log_section_size_capture(struct xe_guc_log *log);
>> +
>> +bool xe_guc_check_log_buf_overflow(struct xe_guc_log *log,
>> +				   enum guc_log_buffer_type type,
>> +				   unsigned int full_cnt);
>> +
>> +u32 xe_guc_get_log_buffer_size(struct xe_guc_log *log, enum guc_log_buffer_type type);
>> +u32 xe_guc_get_log_buffer_offset(struct xe_guc_log *log, enum guc_log_buffer_type type);
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_guc_log_types.h b/drivers/gpu/drm/xe/xe_guc_log_types.h
>> index 125080d138a7..67a9c58e7ed7 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_log_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_log_types.h
>> @@ -7,6 +7,7 @@
>>   #define _XE_GUC_LOG_TYPES_H_
>>   
>>   #include <linux/types.h>
>> +#include "abi/guc_log_abi.h"
>>   
>>   struct xe_bo;
>>   
>> @@ -18,6 +19,23 @@ struct xe_guc_log {
>>   	u32 level;
>>   	/** @bo: XE BO for GuC log */
>>   	struct xe_bo *bo;
>> +
>> +	/** @sizes: Allocation settings */
>> +	struct {
>> +		u32 bytes;	/* Size in bytes */
>> +		u32 units;	/* GuC API units - 1MB or 4KB */
>> +		u32 count;	/* Number of API units */
>> +		u32 flag;	/* GuC API units flag */
>> +	} sizes[GUC_LOG_BUFFER_TYPE_MAX];
> 
> maybe definition of GUC_LOG_BUFFER_TYPE_MAX can be part of this .h ?
GUC_LOG_BUFFER_TYPE_MAX defined in guc_log_abi.h and was placed close to 
enum guc_log_buffer_type, the max has strong relationship with this 
enum, make it better to be defined in _abi.h rather than here.
> 
>> +	/** @sizes_initialised: sizes initialised */
> 
> can you elaborate ;)

> 
>> +	bool sizes_initialised;
>> +
>> +	/** @stats: logging related stats */
>> +	struct {
>> +		u32 sampled_overflow;
>> +		u32 overflow;
>> +		u32 flush;
>> +	} stats[GUC_LOG_BUFFER_TYPE_MAX];
>>   };
>>   
>>   #endif

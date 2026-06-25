Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E634CDE00E
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jun 2026 20:53:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49FC010F305;
	Thu, 25 Jun 2026 20:53:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j2q4nCEu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A60510F305
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jun 2026 20:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782420820; x=1813956820;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=P6w7KZZVqQXd3YFC3A3djiu6xmndAmCr525QZ9mGCnY=;
 b=j2q4nCEuuRq6fpGkce0C6Gz0PKNLNLRMGbvc2SQXEkbsdumcBWhHo0IK
 LDcJ7uIoEXQ+iHs1AhS+xnbn1JfMDaPDN9928o2dlZtAzPXf4JpKHCoQE
 BZr97STtjVGR5g3KuA1au46S4vybxMZ/05I5DJ+oPinDRl3ESxKaVvGyW
 3g3kMaMrOHOtcspfL3s7SCfKpZ5JH+YNVXx2+KVYtFD/m0eo5lvH0v30Q
 Z1lOoV1K7u4rDA/Lpwt++iMycgH7ddwLxXirQxsVr4QNykJ4XREj0NMB2
 EkWvhsPVL404ewyG0dn5O66yH1AwiuQBnCl7n/x29vIJuJdqxWfd2FQGb g==;
X-CSE-ConnectionGUID: eEWs0HQCRdG5QE0QUS0W9w==
X-CSE-MsgGUID: bE29MZSqTTCb6p9XRVpC4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="82332070"
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; d="scan'208";a="82332070"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 13:53:40 -0700
X-CSE-ConnectionGUID: d4J2e127ReiptbFnZYRLNg==
X-CSE-MsgGUID: rA4VaQOjQyWFsnFzWlPkQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; d="scan'208";a="251627538"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 13:53:40 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 13:53:39 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 25 Jun 2026 13:53:39 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.5) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 13:53:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NiYKRICSdBbRYXYdtrOfJHwkmkY0K2nkrEfZOxnHtGNl/9Ptojdq0yyeXA9J4aj2O+ODiRYxH+IitT4aqd9oLRj4ZXlk6lzhJ4Pbu1BO2eYDsJ5U83MhMtQXWUzTwZSs9ph663mJ1DIvrih/ZfoKbotniuDkoUZMh0Fke5uBW69EBCBPtnCNzEeQXeJF1AZZ+EkarVWwuQiFN4XPdhxujv6K21i11iv3UebfUYRgH5tD9ZJ1dVWFHqbGSWuruHZ6ET5Y9zYhlOg/QHSaEEMkDyjIYcNyA9sF1VzYf/l+X3lulZecsGSn85uAdS2f95mO6m6U27wmlYw6f+7o56EExA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=745RdZ1T3lJC5DxIg/nJMQITpFt8aX4xymiN7q21YRE=;
 b=kN7D4R+hHq5wJd8Uj0BQdmZtpNwPF/PoMor+kKHhPoWdPx/9EYFIeRXZvEIsH7rqA9ORN2K4TxJRRpk76VGChv2xv7j0ixRbITESuZ4WYAf2lQz9iJHbxifFZTYw+3b4mHG4W5q2W6OT3fF2/SA81LFt/fE1WxU3M4ga54wfkR4RtTcw0y6Id7uOxQNMsTkIpIbKzBfFtajCxH5k7A1Gnozvkh4MUrUBa6zV+BjzjUoIYsgnH+aaAirl+3gFb9dfUriNovv+j8ZwZzvEy4DuVlTDV5MlXFPsEckBTDIsbtTc+TZuAFiVHOet54H8DVHwTtzKPC9EO9uYNXDufAl/TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4979.namprd11.prod.outlook.com (2603:10b6:303:99::16)
 by SJ1PR11MB6249.namprd11.prod.outlook.com (2603:10b6:a03:45a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Thu, 25 Jun
 2026 20:53:35 +0000
Received: from CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc]) by CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc%2]) with mapi id 15.21.0159.014; Thu, 25 Jun 2026
 20:53:35 +0000
Message-ID: <b992c4c5-4934-4015-b6e6-f8d13435d415@intel.com>
Date: Thu, 25 Jun 2026 13:53:34 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/10] drm/xe/vf: wire up NUM_PAGING_ENGINE_INSTANCES
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, Matthew Auld
 <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
References: <20260611161634.506476-12-matthew.auld@intel.com>
 <20260611161634.506476-20-matthew.auld@intel.com>
 <b67be657-cfd7-4dbb-ac4d-734ef6214b6f@intel.com>
 <172ca7a0-4860-4aa3-b0c2-9afb788d6613@intel.com>
 <47058937-f35e-4856-89ca-f1e2f5087f55@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <47058937-f35e-4856-89ca-f1e2f5087f55@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0361.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::6) To CO1PR11MB4979.namprd11.prod.outlook.com
 (2603:10b6:303:99::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4979:EE_|SJ1PR11MB6249:EE_
X-MS-Office365-Filtering-Correlation-Id: b8fe8894-f53d-457e-6322-08ded2fbd2fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|6133799003|22082099003|18002099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: /TZBUKfRio08lR9A/2qZhLpUMiqPfv1eCf+Cnpsbj1DaBvFtmT7POcpPIvHSQS5Cb/XmnE14A2OUIFJgpRiALhjDHIgyQhjQh5h0+iNbPYxiA8EOyXFuc8ZiFFRWkAk8y7owyIdcypFup9326qzCyTy7MD9G0WGCnfa618VxA55SOM4i/20ChVHCKBTH23QeVwy1fXa1NKVq/+i9LaRpqeIXKntPxOv7z3orZgFD9DDy2W4fGMNVh/5EfjpByR1N7JmJCL608M28Cq9Tl96a/4bUEMTOjC7knkCGDjYD+l3xY08WGKMygc6asTn8/JN8B7djR70XbIL/ZJQIks88p9GXCN9qPpW2uJtfxgHbZh6y+j6isfHEaa/wJKeS/JcYGlzQChRY8vfZIGdCVXN3nsEYMyQf6s3nrPTSevGnhZKY1wyL2AFurFtISqlyYAgjV2Vw7f4Wtjl8WYYdWQrGBLUd8/B78sGZ7TH6MlBdTe3bltFKgp8ubZjYzXWtBtJCWvH1p3WEMJ0t2/UlWkDJSj7xZjQDTK1jJNySAtNHg1rxRGb1huwjNbel9nD8oicDpO5PBUJvcPYayQE4H8U4Y61YED/m2PT8DpPtxLUwQCpX1IFRsN1O8kEU6pWpvXrFoxqd1UhMII9CUbJTKoV/CmVdgGq5tZuk7+ky4IBoojM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZndXb0xEMmVFL291WTlLSVM5WXg3MjhoVEVyb05HOE1IWDB5Z2hucFZXczhX?=
 =?utf-8?B?c2lhMUZXa1pOOWR5a0hyYURjVUlXQUw2ajlpOVRQK3VON1VaRXpXZ2oxZTRU?=
 =?utf-8?B?UU43K1drbitSL3FnQmV1SHcxaVpBckVVOVVHZEhnMm40MGZ0dFg4ZlN0V2Zr?=
 =?utf-8?B?RVBjMW9sU3F1RjNtdEVmd3VoclVWK0hhRit4VUxVRUVlNFh4dWhOM0x5UkdJ?=
 =?utf-8?B?ZEpyVzBnMlRodHYxM1VRcGQveWoxSmNXMkJpZ2xFVmtTS0JaU0NsaWNEaWpN?=
 =?utf-8?B?WFVQZk9FR1pPajByZGg2d1hZWCtVbDQ4cysvSHhLUitJZWNiaWlDSXJjYVFT?=
 =?utf-8?B?eTJkYnNmNnpiQjErclZmQksrQ01oZFpPMXRSMnZxMk5vNDc3NG9xSlBxYXJN?=
 =?utf-8?B?anlyVnRPK1QrMzNBZmZ0Ui82S0gzRzUwTnNVQjRib3l6U1EwYlVBSHhoMSs2?=
 =?utf-8?B?UGFrSHZIMFZXMkJCMStZeHNPaWdZL0pZY2RmcXZZYjYyRkxFUDZLNlBWTmx2?=
 =?utf-8?B?bi9ldnlmYUIyc0xXeFVueUJNUmdZcHpDRlBEUklnUVlVcGxHTlVGOGFTRE9j?=
 =?utf-8?B?UTdQcVE2djVKTGJ3eXh0SW5meUtjNnRXdmVpa1VKb252cFNON1o0eXlqNXpq?=
 =?utf-8?B?MDI3SWJMWkpQNnNLdU9jMWhiWnArOFF6OUYvMGF0OFZNbHlHdEQ5TU1rTlpv?=
 =?utf-8?B?YmczNzBqK0FHMmJnTGVxWTM0QnIxdkhXeVdoUVZmMEREVHNvSWo4Z0NYcHBL?=
 =?utf-8?B?NHlXMjVBVXhBK0txTlAvbVYrdXBhZ0R1anA2dzZpOFFEMWFzVDk1TS9aR2R5?=
 =?utf-8?B?eXJtOFpRMzh2MHRobHBvK0lSaFU2cjEvaVQ2c2lDZ1RLVkNtckQrRG5RQW9P?=
 =?utf-8?B?R0ZEZCtXNGw3QW1SWlRycEhLcy8zdEpZRkJaVHZmY3hFT0twYTZzeWVRTzhk?=
 =?utf-8?B?TmhyM2VJQVVUNmtvU01ieVpBeENPbUplUk5BNGg0NlJPYkxtcTJaVXNOZzhC?=
 =?utf-8?B?RHZXOEM4MjBnczUyWnkvTEJ0WGFuMlRoQ1RoWjZRaFNMQnZWa0cxemZHUGk5?=
 =?utf-8?B?MXYrMXMvamJrOXNYbnFzemE5SXZHVVUvaUV1d29KeFFnY1RZZTdRQ0cyVkNM?=
 =?utf-8?B?b0t0dkh5YUVXRml4aHJlV3hNbHBRKzlraHg5eTRRS3BLTnpmSGZUYU8wbFQ5?=
 =?utf-8?B?TkUxNDlZcTdzamlZdnl2TUUrczNteThJZFNzL2NxSExSallSaTdHN0F4YUVR?=
 =?utf-8?B?VzJBZysvVlFFaXpmY0dCN3FQNXhXZWJRSWNybU1sNTJPK2RBQVlWbTVXbEdF?=
 =?utf-8?B?cmRydlZZaTBwSWsybEtER2RHRmJaU0lIUjZoTEozU0ZpcHZjZElkRjI4cy9Z?=
 =?utf-8?B?SFgvVWZSVjVFU0JIM1pzcTVHRHBSWFlSeEhoV3J6MjU3N3ZpV3NZT3BLT1dh?=
 =?utf-8?B?NTBlQTI0VDgybXNtV1k0ZE9vMGc5Ym1lWlB3T3lmVDdtQmxZd01rL3VzUEo5?=
 =?utf-8?B?MkVxRzk3c0lxS09TMWZGWFRLbHRpWVlsMFNhSWp4K3lrNzhnYWI2eU5VU0g1?=
 =?utf-8?B?ZDdpQkJMZUZpVFRuNkhUVFdEbmR4TjlwYXlldmNnZmZkMEQxS2lva0I5bCtl?=
 =?utf-8?B?SGxjbTR5RGFCQTlxeWRGM3ozcVBzbktrM005N0YwVjBTeGtuQnMvK0NxY1Nm?=
 =?utf-8?B?bmdSMXM5OU0wM2NlTWU1V3B2ZHNvQzkralEvZDlzOVdsWmZySG96VnYyVVZY?=
 =?utf-8?B?UVZFZk15dnUrTDBlTkZyUE00RkpVRklSeW1xY1drUFZzV1NpV3FBc081MzBl?=
 =?utf-8?B?VkJhcktaelZEbEhYRUFhc2U2ZGVzcEZPclRMQ0FycTJmYnpWZDQ5dXlZK0Zj?=
 =?utf-8?B?S1dnRldFc252dkRLc0M2KzErNjlDUVB1b1cxMGNuYzRXcXM2eGN6QXdEWmJL?=
 =?utf-8?B?TGhRdElTcGt2cExOc2oxV0x6ait4NnFHd0JiK2MwT3RORXhDYU5YdlB5dDRj?=
 =?utf-8?B?ZGdnNXdXcER4WW1yaTROUEVHYzV6MjQ5Tk00dXBXUVI3SElPYnA1YkhaaEJN?=
 =?utf-8?B?ZmRMWnM5VGk4NjF6SjdjL0xwZ043aTNEbTF4MVdyemExeGFMSUpRNXE4V2pa?=
 =?utf-8?B?QXZtYmQyemh4ZFNTN1I5UjhjK2tUM2N1VTNjM0h4YjM3dDY0cU5zbXhULzhE?=
 =?utf-8?B?L3REUURtb3NnOU00d3RydDJKL3VMcnNod1hFVjdrVnYrM3N5VHRuQU5DNkFW?=
 =?utf-8?B?aG1oSHlOMWVXTjI0WVZnQU15QS9ZSmNVQmNBZlllb1JJRFNYNkdnNVlXdTl4?=
 =?utf-8?B?aFNKdmdsbmszcWRzaHJ6cXVBOXVWMGZnaVU2SVFOQU5DbE4zM3haaFUvM0t6?=
 =?utf-8?Q?3Iivue60rKSaX/0U=3D?=
X-Exchange-RoutingPolicyChecked: SZsVcqxICLOxYONUBEYtjU32+NWdF7Vo9/za5C1RqcfN1IUEnzYLMUwLMGVEEmwjf4eLXRoUxfeBa5+RIqT47W7XHSCtlNp55n4qqW25fiiVBZpS6Br8tpxbLdlhiyj2tbcHbv972ELoAPCbxc7OFSnTnXh/+BDx/KT5HMUdPbUSdxJiUB4XI5EjI7jGCGvIIG8SX210IHYr5YMLUeTTYqWHZshLUWd/H9Xhvpzk8ks69wK+zU2jKa7nSALasp4jWP20tOj48d2v90FEzv3dePG6YR/6peUmzKkXJ+hcsnMqa5HjJF5JqT5jRr+25bcvH2+dV1u3vr4NVFqRoLdGyg==
X-MS-Exchange-CrossTenant-Network-Message-Id: b8fe8894-f53d-457e-6322-08ded2fbd2fb
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 20:53:35.2604 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y6R5lmPQQGnZO8rWIRtHgvk0QeUtRh9gVjBFb+Ake7Cz4YHSfTH9DmseeUIXD3fm3g4XplgvIoM+/uXi+o2jNIxHkXG3BKOpc5z9+SH/UB4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6249
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



On 6/25/2026 1:40 PM, Michal Wajdeczko wrote:
>
> On 6/23/2026 7:50 PM, Daniele Ceraolo Spurio wrote:
>>
>> On 6/23/2026 9:28 AM, Michal Wajdeczko wrote:
>>> On 6/11/2026 6:16 PM, Matthew Auld wrote:
>>>> When host PF writes the logical configuration for the GUC PAGING engine,
>>>> the VF is meant to query it, and mirror it. Size of N means we have
>>>> paging logical index range [0, N-1], with N fewer normal copy engines.
>>>>
>>>> Agreement is that PF will only spawn PAGING engines on NVL-S+, so this
>>>> should be zero on older platforms, where we should simply fall back to
>>>> the old behaviour.
>>>>
>>>> v2 (Sashiko):
>>>>     - We can't call use the guc_has_paging_engine() this early in the VF
>>>>       code. With that just unconditionally do the query, if the GuC is new
>>>>       enough and take the value as-is. With that drop the -1 special case and
>>>>       just let the upper layers figure out the rest.
>>>> v3:
>>>>     - Also update xe_guc_klv_key_to_string. (Michal)
>>>>     - Add kernel-doc for xe_gt_sriov_vf_paging_engines(), plus other
>>>>       tweaks. (Michal)
>>>>     - Update with final GuC version.
>>>> v4:
>>>>     - Just fallback to manual reserve when vf reported paging engines is
>>>>       zero. Will revisit in the future.
>>>>
>>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>>> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
>>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/abi/guc_klvs_abi.h     |  9 +++++
>>>>    drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 47 +++++++++++++++++++++++
>>>>    drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  1 +
>>>>    drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  4 ++
>>>>    drivers/gpu/drm/xe/xe_guc_klv_helpers.c   |  2 +
>>>>    drivers/gpu/drm/xe/xe_hw_engine.c         | 30 ++++++++++++++-
>>>>    6 files changed, 91 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>>> index 644f5a4226d7..753c049d2fc8 100644
>>>> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>>> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>>> @@ -52,6 +52,12 @@
>>>>     * _`GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE` : 0x3001
>>>>     *      Tells the driver whether scheduler groups are enabled or not.
>>>>     *      Requires GuC ABI 1.26+
>>>> + *
>>>> + * _`GUC_KLV_GLOBAL_CFG_NUM_PAGING_ENGINE_INSTANCES` : 0x3003
>>>> + *      Tells the driver the paging engine configuration.
>>>> + *      Paging engine logical instances are guaranteed to be dense starting at
>>>> + *      index 0.
>>>> + *      Requires GuC ABI 1.36+
>>>>     */
>>>>      #define GUC_KLV_GLOBAL_CFG_GMD_ID_KEY            0x3000u
>>>> @@ -60,6 +66,9 @@
>>>>    #define GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_KEY    0x3001u
>>>>    #define GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_LEN    1u
>>>>    +#define GUC_KLV_GLOBAL_CFG_NUM_PAGING_ENGINE_INSTANCES_KEY    0x3003u
>>>> +#define GUC_KLV_GLOBAL_CFG_NUM_PAGING_ENGINE_INSTANCES_LEN    1u
>>>> +
>>>>    /**
>>>>     * DOC: GuC Self Config KLVs
>>>>     *
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>>> index 0cd9d77f3351..0a11e63f470b 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>>> @@ -658,6 +658,33 @@ static int vf_cache_sched_groups_status(struct xe_gt *gt)
>>>>        return 0;
>>>>    }
>>>>    +static int vf_cache_num_paging_engines(struct xe_gt *gt)
>>>> +{
>>>> +    struct xe_guc *guc = &gt->uc.guc;
>>>> +    struct xe_uc_fw_version guc_version;
>>>> +    u32 value = 0;
>>>> +    int err;
>>>> +
>>>> +    xe_gt_sriov_vf_guc_versions(gt, NULL, &guc_version);
>>>> +
>>>> +    if (MAKE_GUC_VER_STRUCT(guc_version) < MAKE_GUC_VER(1, 36, 0))
>>>> +        return 0;
>>>> +
>>>> +    err = guc_action_query_single_klv32(guc, GUC_KLV_GLOBAL_CFG_NUM_PAGING_ENGINE_INSTANCES_KEY,
>>>> +                        &value);
>>>> +    if (unlikely(err)) {
>>>> +        xe_gt_sriov_err(gt,
>>>> +                "Failed to obtain the number of paging instances (%pe)\n",
>>>> +                ERR_PTR(err));
>>>> +        return err;
>>>> +    }
>>>> +
>>>> +    gt->sriov.vf.runtime.num_paging_engine_instances = value;
>>>> +
>>>> +    xe_gt_sriov_dbg(gt, "num_paging_engines %u\n", value);
>>>> +    return err;
>>>      return 0;
>>>
>>>> +}
>>>> +
>>>>    /**
>>>>     * xe_gt_sriov_vf_query_config - Query SR-IOV config data over MMIO.
>>>>     * @gt: the &xe_gt
>>>> @@ -694,6 +721,10 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
>>>>        if (has_gmdid(xe))
>>>>            vf_cache_gmdid(gt);
>>>>    +    err = vf_cache_num_paging_engines(gt);
>>>> +    if (unlikely(err))
>>>> +        return err;
>>>> +
>>>>        return 0;
>>>>    }
>>>>    @@ -731,6 +762,22 @@ u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt)
>>>>        return gt->sriov.vf.self_config.num_ctxs;
>>>>    }
>>>>    +/**
>>>> + * xe_gt_sriov_vf_paging_engines - Query the number of paging engine instances
>>> nit: we don't do any query here
>>>> + * @gt: the &xe_gt
>>>> + *
>>>> + * This function is for VF use only.
>>>> + *
>>>> + * Return: number of GuC paging engine instances configured by the PF.
>>>> + */
>>>> +u32 xe_gt_sriov_vf_paging_engines(struct xe_gt *gt)
>>>> +{
>>>> +    xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>>> +    xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
>>>> +
>>>> +    return gt->sriov.vf.runtime.num_paging_engine_instances;
>>>> +}
>>>> +
>>>>    static int relay_action_handshake(struct xe_gt *gt, u32 *major, u32 *minor)
>>>>    {
>>>>        u32 request[VF2PF_HANDSHAKE_REQUEST_MSG_LEN] = {
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>>>> index 79878f21b1da..d171a8242a34 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>>>> @@ -31,6 +31,7 @@ u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
>>>>    u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
>>>>    u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
>>>>    bool xe_gt_sriov_vf_sched_groups_enabled(struct xe_gt *gt);
>>>> +u32 xe_gt_sriov_vf_paging_engines(struct xe_gt *gt);
>>>>      u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg);
>>>>    void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val);
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>>> index 80562ffadb16..21cb9bc1a341 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>>> @@ -40,6 +40,10 @@ struct xe_gt_sriov_vf_runtime {
>>>>            /** @regs.value: register value. */
>>>>            u32 value;
>>>>        } *regs;
>>>> +    /**
>>>> +     * @num_paging_engine_instances: number of configured paging engines.
>>>> +     */
>>>> +    u32 num_paging_engine_instances;
>>> nit: can we move this up near .uses_sched_groups
>>>
>>>>    };
>>>>      /**
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>>>> index 97600edda837..be992b8da9a1 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>>>> @@ -24,6 +24,8 @@ const char *xe_guc_klv_key_to_string(u16 key)
>>>>        /* GuC Global Config KLVs */
>>>>        case GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_KEY:
>>>>            return "group_scheduling_available";
>>>> +    case GUC_KLV_GLOBAL_CFG_NUM_PAGING_ENGINE_INSTANCES_KEY:
>>>> +        return "num_paging_engine_instances";
>>>>        /* VGT POLICY keys */
>>>>        case GUC_KLV_VGT_POLICY_SCHED_IF_IDLE_KEY:
>>>>            return "sched_if_idle";
>>>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>>>> index 4d7cb8b54b4b..1227b9e66fd6 100644
>>>> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>>>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>>>> @@ -650,7 +650,7 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
>>>>        return err;
>>>>    }
>>>>    -static void hw_engine_setup_logical_and_paging_mapping(struct xe_gt *gt)
>>>> +static int hw_engine_setup_logical_and_paging_mapping(struct xe_gt *gt)
>>>>    {
>>>>        struct xe_device *xe = gt_to_xe(gt);
>>>>        unsigned int num_copy_engines = 0, num_paging_engines = 0;
>>>> @@ -667,6 +667,27 @@ static void hw_engine_setup_logical_and_paging_mapping(struct xe_gt *gt)
>>>>        if (num_copy_engines && xe->info.has_usm)
>>>>            num_paging_engines = 1;
>>>>    +    if (IS_SRIOV_VF(xe)) {
>>> maybe:
>>>
>>>      if (IS_SRIOV_VF(xe) && xe->info.platform >= XE_NOVALAKE_S) {
>>> or
>>>      if (IS_SRIOV_VF(xe) && xe_uses_paging_class(xe)) {
>>>
>>>> +        u32 vf_num_paging_engines;
>>>> +
>>>> +        /*
>>>> +         * PF could in theory reserve multiple paging engines, which
>>>> +         * internally the submission/scheduling backend can load balance
>>>> +         * from. Not something we currently expect, but we are at the
>>>> +         * mercy of the PF, so we just need try our best to mirror the
>>>> +         * paging configuration.
>>>> +         */
>>>> +        vf_num_paging_engines = xe_gt_sriov_vf_paging_engines(gt);
>>>> +        if (vf_num_paging_engines) {
>>>> +            /* This should only be non-zero on NVL-S+ */
>>>> +            xe_gt_assert(gt, xe->info.platform >= XE_NOVALAKE_S);
> missed this one: I'm not sure we should use assert here:
> it's not our fault after all, but it's misbehaving PF,
> so either we silently live with that or abort
>
>>>> +            num_paging_engines = vf_num_paging_engines;
>>>> +        }
>>> hmm, so what should we do if vf_num_paging_engines is actually 0 on NVL-S+?
>>>
>>> can it be due to GuC FW being older that 1.36 on NVL-S+?
>>> can PF skip programming paging class on NVL-S+?
>> PF can indeed skip programming the paging class and that is a valid (although currently unexpected) scenario.
>>
>>> maybe 0 on NVL-S+ is a good reason to abort the probe?
>> The expectation from the GuC side is that if PF has reserved a paging engine then VF must match it, but if PF hasn't reserved a paging engine then VF is free to reserve a BCS to do paging.
> but then this paging engine on VF side will not be a paging CLASS, as the rest of the code may assume
> or it doesn't matter for the VF?

You're right that if we reserve a BCS (like we do now on current 
platforms) then it needs to be submitted as a COPY class and not as a 
PAGING class.
It looks like xe_hwe_to_guc_class and xe_hwe_guc_logical_instance might 
be unconditionally returning PAGING class on VF if we're on a setup that 
supports it even if PF has not enabled it (unless I'm missing 
something), so that might need to be updated.

>
>>>> +    }
>>>> +
>>>> +    if (xe_gt_WARN_ON(gt, num_paging_engines > num_copy_engines))
>>>> +        return -EINVAL;
>>>> +
>>>>        reserved_logical_bcs_start = num_copy_engines - num_paging_engines;
>>>>          /* FIXME: Doing a simple logical mapping that works for most hardware */
>>>> @@ -688,6 +709,8 @@ static void hw_engine_setup_logical_and_paging_mapping(struct xe_gt *gt)
>>>>                }
>>>>            }
>>>>        }
>>>> +
>>>> +    return 0;
>>>>    }
>>>>      static void read_media_fuses(struct xe_gt *gt)
>>>> @@ -906,7 +929,10 @@ int xe_hw_engines_init(struct xe_gt *gt)
>>>>                return err;
>>>>        }
>>>>    -    hw_engine_setup_logical_and_paging_mapping(gt);
>>>> +    err = hw_engine_setup_logical_and_paging_mapping(gt);
>>>> +    if (err)
>>>> +        return err;
>>>> +
>>>>        err = xe_hw_engine_setup_groups(gt);
>>>>        if (err)
>>>>            return err;


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1868CD5BD5
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 12:39:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8079F10E7AF;
	Wed, 27 May 2026 12:39:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m3Dw+UIe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A408F10E7AF
 for <intel-xe@lists.freedesktop.org>; Wed, 27 May 2026 12:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779885563; x=1811421563;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=BpPZlm88+ozjxxqNO+7XiFafA8nXpbRKK26D1sak9GI=;
 b=m3Dw+UIeW5Os1FJl1QAx3zNk04iYfP/l5spoTcFPDUjxhei/AnKS3OhN
 fiO0LIqhyOjqkZLZCGud/7W5iSvJxQnha6bpBI5KUlmo7Aiv8pynuJptB
 16SUaRQgcF0cfpssyCS00xYIUzf1hbOvkW3BOK3gUeOgxTYkqmae2Y0Hb
 AvY/RSkqUpwrTxZU6FSmam65gyUVrMyp0v22TG1wIWqX04XSwJMm4l1wp
 9k3i0yHO0Iylgi/XFoPGQLcrHkpDdLVZ9/UvZFcuZfBC4SB5+TMnF3zKl
 hfkbCi+U/UNkEnXoIQn1mX70VU0L+Dy+54reNnuq5kprnmhTdcxQRjHvW Q==;
X-CSE-ConnectionGUID: qymzcCFXSOe8KJq0tPFWug==
X-CSE-MsgGUID: PeA2y/74TaqrQMFXTC+6pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="91018484"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="91018484"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 05:39:22 -0700
X-CSE-ConnectionGUID: f06N4mjoTquMlmAOzrD1qQ==
X-CSE-MsgGUID: x567pii4QIWHC3ju0wY3zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="241191364"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 05:39:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 05:39:21 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 27 May 2026 05:39:21 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.60) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 05:39:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hvGw5IoZEWJfn+swT1ctPCEzCwBhZApmhcUZdWtU8fRTB8yV3Sle/Pg2+r4OdrOQMNQxM+t0x5a3CBZpV3M599yYD77Qkk/CUXRNjlvVuy/qqlBu5Vzva0CDy2wwk91pRJmCHiCYZ53Zi12/BK+aseI3EI9eIV6RNPy33Va6q13HDBofw70ZeCI2egMNRaRSJ6yv4h0j5IHqmLX3GtreCI8/rdEX49vjGG5ogpHNwHc5cHSBeZnKg7qgeMC2WQpRxqRQGqRC+AITlnop5BxDj92WSD8s21aVNF9EnWcXw0rkAyrf6dhXyVNzNnB3WkQsjkFRauhm33EbfLhFGY79eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Emg0BLW1d29z+pydcAYpH7W2tZ37tGeGzEOs73cd/zs=;
 b=gwwMVV4L9iyaYwU3auOVonLjSajdzvKemgNopEC2cjLNI9H8Pg5COh8Ggx7Sg7X+BkqT3LWrAuN9ap3gm9kxZOfSBT5dFWvlaO7a7gUXS9Dgtbv0MGpwvhBT24isdeTLFsspr0zd/vfsxJqQflmLlL9yrXwVOKM88yWpH//fPge+WwBx9V70elHdQt7UV84jYlUA/J8WO215YBaOawsI7ndHdn5Wd7l9A+y/08QuSy5f1UEiZrWsh3o/UQrCtO4eerZtsqwzH1XhU8KZ59MbgfFutB/Xnzr4YXXHzRetI/aVsT7SOHtUL6+df7F22eVQGjHladeHADyjpncAI9tWwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH7PR11MB6353.namprd11.prod.outlook.com (2603:10b6:510:1ff::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Wed, 27 May
 2026 12:39:18 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 12:39:18 +0000
Message-ID: <e5717901-92f9-46a7-839b-176b8700ce01@intel.com>
Date: Wed, 27 May 2026 14:39:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/xe/mmio: Map MMIO BAR using managed version of
 pci_iomap
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260522143112.10643-1-michal.wajdeczko@intel.com>
 <20260522143112.10643-2-michal.wajdeczko@intel.com>
 <3c622ff9-565b-4b99-ada5-23306d4733e1@intel.com>
 <d469f6a3-ccea-4232-a75c-d4d2172bc090@intel.com>
 <a3631901-0f80-4123-8f26-b34ea9a4db92@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <a3631901-0f80-4123-8f26-b34ea9a4db92@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VE1PR03CA0051.eurprd03.prod.outlook.com
 (2603:10a6:803:118::40) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH7PR11MB6353:EE_
X-MS-Office365-Filtering-Correlation-Id: 895226a6-1bbe-4916-c7c3-08debbecf768
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099006|6133799003|3023799007|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: YdrqEJih4BLyhg1ZPEuqtfzqW6o+BT0bt0S+n0fAxvD8o6JAZcoQgTMD6Pa2rMHV1jMDFr6Mal8BaZJE0vuICImIpwjlAyImaX1lT1kJ9fTw0B7/mxPDP/IMv2ormpvWCttCtLSfoG7bW3uX2vs40qD13McKfUYANQCMf0KLCr6LVz/WrSBi6Le5BFZrF5inbRDa1GYIyFsQsLpmVn02kQK3WuI4azAO5zwVWgS7FSgC+XUaCO+tpSXKvTQsq+SrwVpTmMjdw7s7nEazd9wvLbPVlCI3hjlUBhIZkPxlvpmU6fTCsKdfO6kCttqOfcoodIrETTd9EO+PHhm/jjnr7BsFyalkG+TMmhD4cTWM0QlUZrRf2d+gCvYP+LaLZEp1/GkL20ypXeBmfWrEbmygVucGV8EVNee4z1urINQLnP2zz4R9DYEvEB6PZa1JD9DlxFRtLq/KYh85UBU8T15pfy/GfCTv5GC14wvEYzIDE66VbZ7vKLQdja3MLbN2yWwBGfZyNnXCb3kndf4CVIzh3D7DION1Kft76N/HSu3UvX5VZJjmpTYnolD7J3YEXP8TLrTJLo4/cqgSL6qa7IGtOF94px6zsnrJjmukd2UbqTw/t035fseJODsnlgf8JKlhOQxbQlvEe46zNof8JfAMJWgdepwaha3HvjngXJdb+aLI1K7aNhOxvSZ14TjlMmaG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099006)(6133799003)(3023799007)(11063799006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUpuOElSN0w0YnlPTDdoaUJWQUl1ZExDWWlMaXVkTVdQMEtZQmFxWS92TnNY?=
 =?utf-8?B?VU9xS0ZTNENEcEp3TDZBdytHMkhKWTRkY3hkK0pRZnJvZzJpcTdlTkRXMnZu?=
 =?utf-8?B?TUkxR09SVzBvcXJMNHdLWSs1aVo4aXlzZGlYQ0RWUC9vc2JEc21FNkFFUFpu?=
 =?utf-8?B?VWpuOEdpdDh1ZG5aT2pEcGlkNnJKM29jRjZrdGppQnRGREY2NjJ4aW1nbC9N?=
 =?utf-8?B?WHd6YTUwaWRJOC9lVEZLT1NLcmF4MVQ0a3huaklsbkZXWE82blFBbzRXVnFt?=
 =?utf-8?B?WU5GakNzZXFDVzVUNWhRYUovdWhtRW1qa0pYNm5qRTErc2Z1RDVEUGljYmFP?=
 =?utf-8?B?VjMrd0pWeU82VWl2WWc4SFBaMndBYTdlZkgzZWJnWWd3eHBCclBWdlpJdHUz?=
 =?utf-8?B?Skl6dzN2TkVYeERQdldqdmprcmdoc2VBMmdtcGZlYjNhYm5HYjBHR2YxMTNT?=
 =?utf-8?B?ckltREQ5UXljZlV6a3JmdTF5c1hJMkx4emtIZVFsVDFuUVRkZXlTQWpDTHd3?=
 =?utf-8?B?NUplL0xhMEVBdE1KTFVIaEJlZTIrU3hyeDZpOVhSSWc0Q0tSUjdOckRGTUpE?=
 =?utf-8?B?WnpLRlVRNnpyZ0xqUC9hSHpFMmt4RXBsRkVRWXZQRVlrZ0RHdTh6eWNNTWRF?=
 =?utf-8?B?ejRFYnJ2RG91R04xTzRjeURYUjV6MktVVU50MTdOMTBoRDM2RHdFR2I4SDlW?=
 =?utf-8?B?OFUwR3E1UmhkcGp5OEt5UGZFTVdtcC8xVjNjako4ZlNiRFgzdTRZZTZ3eUN1?=
 =?utf-8?B?aC9XOWkvaVF6SUFqeXl5VmY5bHlxZmRvQnBmdVVEVFZkYXN3QXdnWWc0V2ZO?=
 =?utf-8?B?TzBkb0FTeUpWK2poanBXSms0WTc3eDgyL0RDbUpMQXFEdWwwYndkL01BRlFx?=
 =?utf-8?B?Y2lwY1JuOVJpSkowZktSTFZrb3VnY2g5ZTc5YU5vdEF6ZFUwSklCUXdvS1VR?=
 =?utf-8?B?SmRQSlJySVZLc1FTZUYxb0pCdHJ3Y2l1THhXMjVVRkxjTTM0TktHM2luUmt6?=
 =?utf-8?B?Z1REa3pqQ2Fuc3gxRGUzdWRlcmp2bld1ejVMUzdtVm9lQVJkV1I5UXQwOCtY?=
 =?utf-8?B?NkgvUDRJRENaQmJFM1FCY1hNdzZPV2ErU2RIZ0pNbkdsSmcvU2grZnF0N3Ni?=
 =?utf-8?B?Z2drMTgxVzluWWpOVW5JVnVaeXhsMS9NcGxpSm1Pbk51ZTNicXpPTW1jcHJI?=
 =?utf-8?B?NElVRXBHUXpiVGlZeDVMN3Z6S0pNWktaeVRoY3A0R0p3VDJZdFhQVUl4dFV6?=
 =?utf-8?B?b2puT2I3b0t1WlZpbUJvRldDZ2QxbHkva1JQUnpzY24wblBDVlVmeXBIY01t?=
 =?utf-8?B?a1drOXFHUzY3WlFyQnREQ3RGWUowMStvVGtuRUJ6ZTVxSVhqK0VoTFkrWjhw?=
 =?utf-8?B?RFZYMHFwbEs1eC93c0pJZVZwclVrRmkxcXVBbzg1c2ZkYmczdmdHZnUvUHVB?=
 =?utf-8?B?MkpLeHpDUkZFMWRhZjBBQk1JWnRkVDQrVWxOVmlOdXc0Y3YzQTVzUFgybW9p?=
 =?utf-8?B?ZFRweSsyZVd0aklyd245bWEyaDVVZHQyajFiR1NqNmlpTEhGSnFHRy9ucHN6?=
 =?utf-8?B?UStJOElxSUsrNndQWWRESm1WWWthN3VBdVVSSGVjMENQL3dUa2g0MFJRR3Bo?=
 =?utf-8?B?dUg1YjJZZ291VHhRMU83OE5vU0xWRWxLeE56YmpoNUdidnF0QmtHOVpyRGc5?=
 =?utf-8?B?cDdzdUpRbUw5NkZ5dHkrVVUzOU1uSHc3dE91VWRVWVJWdDdLendGOE42Q2xR?=
 =?utf-8?B?S21JRWJacHV5U3BTNVhxTHZZQmpYbmJ0Z1IwOXh2dW1XY2NWYmxkSFJSRlZC?=
 =?utf-8?B?alZVaTgvd2dtVm9raC8wdzJrV2gxVGxLOUJxa0pLalhOY3B5QTgyelcveGJO?=
 =?utf-8?B?dGxYbUduUlNoTTFxSkQvSUJMZVliM20rUGV4M1B1OXdqTFptbDEzWnRUWDIr?=
 =?utf-8?B?WXZHL056ZmlkZmNwM3JWdmZuNUYrUUwzVm1UWTlEY0pSUktYYmxVYy9TT0tz?=
 =?utf-8?B?Y1NuQ2VHQ1pKaUxpLythTVRIS2NrQkp2RW5BRkZndG9DUmVtU0tGdXFwZXhJ?=
 =?utf-8?B?M2xJKzR4RC9rT24zK3FnWEluU1o2V3gvZG5pcjRxV1RQUlVZMStvKy9udzlJ?=
 =?utf-8?B?cUpRS1NaTS8rbGk5T3pLZjAvTzhIbUQwc3pNMlJjcTd0bXZkeGkzMGhIUHRM?=
 =?utf-8?B?QUFEcFhoSnZmU29hMjZ1VkpKZ1hzY2wwRTdOcmhyU2pLZSt6dk96YWxLSmNP?=
 =?utf-8?B?RmN5b29GRWJlaFk1M1JPU3dpU01hM0ZZN2dWWWtzUzVCSU9wWTU4cEFFYmNY?=
 =?utf-8?B?aWlKdjhJaXZOYVBHK1ZDZC9zYUUzWmpTRDJkTmdqZXNOT2FwdkN6ODhFUUxh?=
 =?utf-8?Q?nPFcO5m/jyfjkL60=3D?=
X-Exchange-RoutingPolicyChecked: VhMqwN0E1nhED9KZ+1WEcSCUeiI1v+3oHGnzUxKE7hChZ9HAfAGjwzhwDvrbKwaCQ/I2kpxjX9k8G2e/VTOpjBWFbgwbbE+FdJIrMQv0rTbkGNx6/fKPmewgGzjprPv8OLNfzZF4ymUPtTcACSvhaTLYzYRzevxVEqFA1Jk4BwWM6cw1RF0ZuLjCXBywz9CMy91tAi7CW9Ff/00K9Pg6usn7jXUdH80fo8IvH8WhUbHWvXOI1Zn8d/moRj+xY9ZelnZRUKhVVM4j8QTgxT2wqIqNOVjhsKr0z3hhPaQJIRAzPEPeRXroLTkQNXnNq1OtYNokkd1UgnPptXtC1jGlLA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 895226a6-1bbe-4916-c7c3-08debbecf768
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 12:39:17.8213 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EvlKxlsiZ/A/bsrmRGSqH2mySjoEI8FIX/nZvTpwJBk+i75zqIGZ/cdJEP+5Jfg/ubhXfIlFWlS7nerEilTKIB1cBxhycXo5Rc3QrHCKJ1E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6353
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



On 5/26/2026 10:56 AM, Matthew Auld wrote:
> On 22/05/2026 20:25, Michal Wajdeczko wrote:
>>
>>
>> On 5/22/2026 4:58 PM, Matthew Auld wrote:
>>> On 22/05/2026 15:31, Michal Wajdeczko wrote:
>>>> This will allow us to drop our custom release action. Note that
>>>> pointer zeroing is not required, as there should be no active
>>>> code running during a driver unwind. While around, add missing
>>>> kernel-doc for the function and update error message.
>>>>
>>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_mmio.c | 33 +++++++++++++++------------------
>>>>    1 file changed, 15 insertions(+), 18 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>>>> index 78adb303b663..f4086b9ae38f 100644
>>>> --- a/drivers/gpu/drm/xe/xe_mmio.c
>>>> +++ b/drivers/gpu/drm/xe/xe_mmio.c
>>>> @@ -16,6 +16,7 @@
>>>>    #include "regs/xe_bars.h"
>>>>    #include "xe_device.h"
>>>>    #include "xe_gt_sriov_vf.h"
>>>> +#include "xe_printk.h"
>>>>    #include "xe_sriov.h"
>>>>    #include "xe_trace.h"
>>>>    #include "xe_wa.h"
>>>> @@ -76,37 +77,33 @@ int xe_mmio_probe_tiles(struct xe_device *xe)
>>>>        return devm_add_action_or_reset(xe->drm.dev, tiles_fini, xe);
>>>>    }
>>>>    -static void mmio_fini(void *arg)
>>>> -{
>>>> -    struct xe_device *xe = arg;
>>>> -    struct xe_tile *root_tile = xe_device_get_root_tile(xe);
>>>> -
>>>> -    pci_iounmap(to_pci_dev(xe->drm.dev), xe->mmio.regs);
>>>> -    xe->mmio.regs = NULL;
>>>> -    root_tile->mmio.regs = NULL;
>>>
>>> This was intentional, since on pci unplug this get nuked, but driver instance is still alive. So, by setting to NULL, we can more easily catch misbehaving code, still trying to touch the hw post unplug. Any chance we can keep the NULL part?
>>
>> but any access to the unmapped BAR should still end with some splash, similar to NPD one
>>
>> this is what I got after doing immediate pci_unmap without zeroing the xe->mmio.regs pointer:
> 
> It doesn't have to AFAIK. With the unplug, the same driver but new instance, like when re-probing a new xe card, or perhaps a completely different driver can map something there, post unplug. So the access might by accident "work". Setting to NULL is more likely to give us a splat if we trigger such an access.
> 
> Also IMO a NULL regs is easier to spot in the splat, since the full address will look bogus vs below, where the address looks normal. And NULL regs would usually hint at probe issue or post unplug issue.

but we might still have other pointers from devm_kmalloc that will be stale on unplug and it seems we don't care that much about zeroing them and we just rely on mm/slab poisons

and note that even if we zero out the xe->mmio->regs here, the gt->mmio.regs from all GTs will still be non-zero and will point to the invalid mapping

so does it make sense to keep such partial hack that almost no one else is using?

> 
>>
>> [ 1111.155480] BUG: unable to handle page fault for address: ffffc90006130030
>> [ 1111.155492] #PF: supervisor write access in kernel mode
>> [ 1111.155500] #PF: error_code(0x0002) - not-present page
>> [ 1111.155509] PGD 102400067 P4D 102400067 PUD 102c4f067 PMD 0
>> [ 1111.155533] Oops: Oops: 0002 [#1] SMP NOPTI
>> [ 1111.155558] CPU: 1 UID: 0 PID: 2853 Comm: insmod Kdump: loaded Not tainted 7.1.0-rc4-xe-sriov+ #618 PREEMPT(full)
>> [ 1111.155595] Hardware name: Intel Corporation Panther Lake Client Platform/PTL-UH LP5 T3 RVP1, BIOS PTLPFWI1.R00.3332.D05.2509011438 09/01/2025
>> [ 1111.155624] RIP: 0010:mmio_flush_pending_writes+0x28/0x50 [xe]
>> [ 1111.156004] Code: 90 90 0f 1f 44 00 00 48 8b 07 55 48 8b 00 48 89 e5 48 8b 80 d8 0f 00 00 48 8b 00 a8 02 74 16 ba 04 00 00 00 31 c9 48 8b 47 08 <89> 88 30 00 13 00 83 ea 01 75 f1 5d 31 c0 31 d2 31 c9 31 ff c3 cc
>> [ 1111.156025] RSP: 0018:ffffc90003ec36b0 EFLAGS: 00010246
>> [ 1111.156035] RAX: ffffc90006000000 RBX: ffff88810c7bace8 RCX: 0000000000000000
>> [ 1111.156045] RDX: 0000000000000004 RSI: 00000000011901f8 RDI: ffff88810c7bace8
>> [ 1111.156054] RBP: ffffc90003ec36b0 R08: 0000000000000000 R09: 0000000000000000
>> [ 1111.156063] R10: 0000000000000000 R11: 0000000000000000 R12: 00000000011901f8
>> [ 1111.156072] R13: 00000000001901f8 R14: 0000000000000000 R15: 0000000000000000
>> [ 1111.156081] FS:  00007136102acc40(0000) GS:ffff8884eb10b000(0000) knlGS:0000000000000000
>> [ 1111.156092] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [ 1111.156101] CR2: ffffc90006130030 CR3: 000000010ec70005 CR4: 0000000108f72ef0
>> [ 1111.156110] PKRU: 55555554
>> [ 1111.156116] Call Trace:
>> [ 1111.156121]  <TASK>
>> [ 1111.156130]  xe_mmio_read32+0x32/0x150 [xe]
>> [ 1111.156392]  xe_sriov_probe_early+0x2d/0xf0 [xe]
>> [ 1111.156672]  xe_device_probe_early+0x4d/0x1a0 [xe]
>> [ 1111.157057]  xe_pci_probe+0x13e/0x530 [xe]
>> [ 1111.157374]  local_pci_probe+0x47/0xb0
>> [ 1111.157393]  pci_call_probe+0x6c/0x360
>> [ 1111.157413]  ? _raw_spin_unlock+0x22/0x50
>> [ 1111.157430]  ? pci_match_device+0x16d/0x1a0
>> [ 1111.157447]  pci_device_probe+0xa9/0x140
>>
>>>
>>>> -}
>>>> -
>>>> +/**
>>>> + * xe_mmio_probe_early() - Probe and initialize device's MMIO
>>>> + * @xe: the &xe_device
>>>> + *
>>>> + * Map the entire GTTMMADR_BAR and initialize the first tile's MMIO instance.
>>>> + *
>>>> + * The first 16MB of the GTTMMADR_BAR always belongs to the root tile, and
>>>> + * includes: registers (0-4MB), reserved space (4MB-8MB) and GGTT (8MB-16MB).
>>>> + *
>>>> + * Return: 0 on success or a negative error code on failure.
>>>> + */
>>>>    int xe_mmio_probe_early(struct xe_device *xe)
>>>>    {
>>>>        struct xe_tile *root_tile = xe_device_get_root_tile(xe);
>>>>        struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>>>    -    /*
>>>> -     * Map the entire BAR.
>>>> -     * The first 16MB of the BAR, belong to the root tile, and include:
>>>> -     * registers (0-4MB), reserved space (4MB-8MB) and GGTT (8MB-16MB).
>>>> -     */
>>>>        xe->mmio.size = pci_resource_len(pdev, GTTMMADR_BAR);
>>>> -    xe->mmio.regs = pci_iomap(pdev, GTTMMADR_BAR, 0);
>>>> +    xe->mmio.regs = pcim_iomap(pdev, GTTMMADR_BAR, 0);
>>>>        if (!xe->mmio.regs) {
>>>> -        drm_err(&xe->drm, "failed to map registers\n");
>>>> +        xe_err(xe, "Failed to map GTTMMADR_BAR\n");
>>>>            return -EIO;
>>>>        }
>>>>          /* Setup first tile; other tiles (if present) will be setup later. */
>>>>        xe_mmio_init(&root_tile->mmio, root_tile, xe->mmio.regs, SZ_4M);
>>>>    -    return devm_add_action_or_reset(xe->drm.dev, mmio_fini, xe);
>>>> +    return 0;
>>>>    }
>>>>    ALLOW_ERROR_INJECTION(xe_mmio_probe_early, ERRNO); /* See xe_pci_probe() */
>>>>    
>>>
>>
> 


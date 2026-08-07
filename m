Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3118C5AC7A
	for <intel-xe@archiver.kernel.org>; Fri,  7 Aug 2026 10:24:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 571EF10F465;
	Fri,  7 Aug 2026 10:24:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jiXAjLr6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 712F810F44D
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Aug 2026 10:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786098285; x=1817634285;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=n5/9gJIzUmD4BwSFSflcNPv8FjksXxcL8XK1cZU8SpE=;
 b=jiXAjLr6y2dZH11PS2djRZMIcOyRlrtJtICQCPeeQKY5VRxOOGx0wS1y
 oYmZtvmBDQCq1OZviE/O+50X125RUGI+gXpkALREEvWuzV4gK5DDJcVsX
 ku6a35ssEu3yxHGxx+7xS3DxhiYDMhIYDa9yMEgKmWMnQB2RA4m9PN9m+
 f2ZgwgJoKqljPzY39H+V0O4nhltjsdj3kW1JXeiP5BbTfL/3M/2BN/TrK
 bpDnN1ZHN9XzcRJ2oSa/D0u5ezecVjnwNKFrmMVUfEUhWD4sSV2R7ldbT
 UMlwgWXwKCFs4uc0VN9T7rZmtZDh95nMCttnroFBCtGq1ec73GQL9LPbl Q==;
X-CSE-ConnectionGUID: bN0UxIYMRROjwGd/g8c45g==
X-CSE-MsgGUID: mwRWKPM7SSukKAH6kUw6ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="86578635"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="86578635"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 03:24:45 -0700
X-CSE-ConnectionGUID: CW5PKSgfS0exL0J3SpaDVA==
X-CSE-MsgGUID: SC1nZyP/TcCjctrNEd24wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="300580204"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 03:24:45 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 03:24:44 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 7 Aug 2026 03:24:44 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.54) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 03:24:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gw7XupxOkUlNQx4Ne5GdeY+ec4Ev0lUxSdAG1D1gWbDTuOlZe0owoxb/QbK2n2HhVEV6ATuLD4r28R/OeGQbiv8ACz/NbV5BnCJpvK/pTYiGeXHYR56y4sjtWhBZ7wQ63kPt2BGo84IHa+w+48SA4CKK+wUDns9sANlrMs3CfcZRLwhrTRveedcfV4oacxirlqEgH8K8wxPcDekGAQfIjDwRimvaOudF5l+QeGN8vAhdVG8IQGKAHBsqBn3LfAFK+Jc+SHMnygoicR7ohMvs2zAaI/Ff0ZO94GTrKlJOtn80tZaKV786Z9COkUs7SJYor6WV/bkT5NpYCxQ6LOl+gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WHX0/46rGPEluM+dJf4svBQ59DxNLrNI++GcCa/eSHg=;
 b=tdI5TXtvdgf9FyugDsqaKskla1O+D6+FdZq+PW2ZDiuV5kej5prCR2hy00xO0RTAwP+RnLK0zvPJHIBk0+8QTGtMUuIQwnLtxXdqCxO0/PmTOqwtZvs7z0YB639MpjuaPU5oOp5uAs1DkYqHYinT3qB1dPYLaFBW00o5K7DrH5wGsp3wODLFFrAUyLkiR0gwK8LWKkb8L74MEkLVaAO6nWifgnhpOGxaX74WS2zfCW+teX0H8UDNhewKrNaD8sS712dxKcTtEcC+qghDq4h5CC1VEm4cdNF+Ul6bRkvNHH7Op8HmE/Yi+weGb6N0qtKPWfbDWAyJf8n4JDdUFSJmJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA2PR11MB4923.namprd11.prod.outlook.com (2603:10b6:806:fa::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 10:24:36 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0292.018; Fri, 7 Aug 2026
 10:24:36 +0000
Message-ID: <2cf706a3-93cf-4f47-b772-c07c35e1668f@intel.com>
Date: Fri, 7 Aug 2026 12:24:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/23] drm/xe: Report 'device wedged' errors using SIGID
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@intel.com>
References: <20260730152121.576-1-michal.wajdeczko@intel.com>
 <20260730152121.576-18-michal.wajdeczko@intel.com>
 <f219c563-7703-4703-a832-28da4a8b3421@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <f219c563-7703-4703-a832-28da4a8b3421@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0007.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::10) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA2PR11MB4923:EE_
X-MS-Office365-Filtering-Correlation-Id: 9344c263-fbfe-4293-ca82-08def46e14d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|18002099003|22082099003|10067099003|4143699003|5023799004|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: RLrOwxNCthZOuto8qfASDT5hobkOQyLwhbS54f+ac+wztqZd2lh/zqdJnj8E+C7846ZHZ1hJiS7MSXDB6NUvSoA/OynE09NC4l3vq8qisCW0Z3I36sHw8PuV/5xwoouXnx7x/nfz60AtACq8QAzolwVifoEigWR+HJar4tQ2CXjkoOLw0JckWvdvYDeHxY2TZcN+ckz9CECnjeujAhkL07A9WaOmume4AtYeM7aLh487Z1mztKxTtfZhIFCPXbRj+8ynaEAKlNJgYhrHIrF3BupG/nm0exS2d5WM0eAB78kTUvePLg2h77Xqm2khyjW+Vo+7ZaltrxZF8yh5hI7UOMoAJQCmzPZVyyOFMOWzTj6A2mWv52vMFGBBteoCDWualIFwPUuhQpEjSZbvkc2Yvoq2oHtlqCAZUXkafHFDMxA0sq7gX8QQQKNaeKFjU7YhOLK/DQjuqCcgcygivAF7pmxMo61PsX8Q4K4Tj+FHau27R0iNes4k6OVq1/vkUAnJ7+K6Q9lTXQmjhqIr9B5AblY6T3lyLfrKjfcPwiL4IduG71l6zj41OjAO6qsug8c+3CGvwoPVPlV3siqXsfFWmNxiy28d2iK+2+ouMg/O1yE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(18002099003)(22082099003)(10067099003)(4143699003)(5023799004)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2t4YlJ0Zi9VYkhuWk1XTzRoZkxBOEprMWRtNHlMcnc3RkwwQlR6YzFRVzBL?=
 =?utf-8?B?SUFTYVFaRU5oT0l3UCtRNWk4SXBVWm5zbEs3N3NvZm9qZVMydEREQ3g2Y1VR?=
 =?utf-8?B?Z1BpSWZaWXo2VkNLbWV2Y2dNeFg0dEQ3RFN5ZitaTGwzb29DVzVVVzZpWmQy?=
 =?utf-8?B?VXYzTmVBTUtweVRESmZuNHFLcWJKeVdmMTM1Z1hXSFZhaE5JMVN2VXRxNk8y?=
 =?utf-8?B?RTM4WFc2eTFHNTBrS2duMjNneUlhUzdmdFhJMW96Vk0vZXlldFdYdFVaZ0Zz?=
 =?utf-8?B?enFVQnF2NzZ2R0QxZEs4Z09aOFRWbEhSK2c1dW1hUzJDcnhwd1d5bFhxeTJ4?=
 =?utf-8?B?dEVQVXZaQm43Z29WY0NGNFNXTS9EbmFQV1lDTVQyRUU2ZFBTNHRzbW5iN0Mr?=
 =?utf-8?B?ZmhzeWVhWWhXSTdlQkUvM1BEbnhaQVZxWVpIK0hoTVVUclY0WlBVR09OQkc5?=
 =?utf-8?B?WFNPU0RRSDEyOUkxcHRuQVl2c0lRMiswMWpaWlppQSt1TjdIUU9OR3JKVHVW?=
 =?utf-8?B?OHNvV3RVYVJyQ3BiV0JqdjNJOUUvRWwxQlV2YjBUekVMZGpNbG51OFhBcW5U?=
 =?utf-8?B?a28zMjk3eS95eUNwUWRwcVBVcTE1YUpmdjA2ZFFnZzRVYldqWStZM2dKVlRZ?=
 =?utf-8?B?RWhHK2pnZ2tWRlhwUDlQLzc0NC9yZ2ZWSXpLUUhUM1RBU3pBaEhySEJwd0tu?=
 =?utf-8?B?NHVSa1BDTjNheVY1cDFKN1RJMGFHZ21XRU14QUlmT1hJMmRpaWRDekJ5bHdl?=
 =?utf-8?B?QmR3MnluWU54Q1RIblo0QVhWVGF3VGxackh2bzQvQUpJcXlINktsL3kvOGVm?=
 =?utf-8?B?VUtic1I5c05WY0dBZ1U3RGJsZ3Z5Y1czMGFBWEI5K3ZsbVJvbDV3Mk5NZmlS?=
 =?utf-8?B?enJ3RVZwVUh6cEdqWWI3OGxjUUxGamNSSUZJKzRRQjl6UktSbjhLQVJNN0dh?=
 =?utf-8?B?UFBZQ3Jhdi9WaUxPN3AvSmZlMGdaL3RSZzZjOWJDOTBMdHJlbmJQUUk4cFZC?=
 =?utf-8?B?V1RXVUQxTTJYWFZhVkNIYjJOeGdzSlR5TG1DeW16TEUxcjJTY2VrVVhpeW1M?=
 =?utf-8?B?dVBWUGszdTkzMElXeldSZWVTcC94c2gxUUYvdHpZSlo3cmg2MVR5Z3g0R1Mv?=
 =?utf-8?B?Rm04ZjVJV3kxSTdPWE1HekQra2dnZVBVakJuUmRGR0IvaFM2WkN4UmJQRDVl?=
 =?utf-8?B?MFJwQktGRUNUVzh3NUEvbjBVVlBnWmtweVlwSko0YUVrb1djbG5FL2xNWFBJ?=
 =?utf-8?B?NXM4OXpsZmFIWjI4OFU1cEZFd0R0QklRMEJDOUVNa1ZVVFltZG9rbGdzTVV1?=
 =?utf-8?B?cEpNYXJnQ21PaFRmWkJ2MDFqMzB3ckJuVk5wV2dkeURZVVVrSzJjNGtUSmxv?=
 =?utf-8?B?UlFJanRrY3hhM1ZZNnJPMFVlSHVqRGR0d2tYMlZBUVJ0b0F1UGoxV2RqV25j?=
 =?utf-8?B?S0c3L05MbGE4QlRIZU9RaERvY29nR0hLOGFNWm1QcXZMVkF0L0lPSlJPV296?=
 =?utf-8?B?OTJpRTJjeXZjemgvL3dSeDlWVytaOEdpZ28rbXFwbUZFdTRKOFRoYlBVYXA0?=
 =?utf-8?B?Y3hXQXVXRUt6Q3dIakxUYzFoT3dZbTM2djlVNUdQdERTeXJjUjJrUlpBdlk5?=
 =?utf-8?B?bm5IbVo3bHNtWjNtYno1R2lxclNUUGlwZzdoWFF5ZStwWFdRRVJCdVh6UzND?=
 =?utf-8?B?S09FaDZCcHQrbXpoZzA4MHZXeGRhK3pEMlVZSVFXT3hVQWVmSVZPclZldndG?=
 =?utf-8?B?U3ltTHplVmluczJwRkFHR1JVd3lCVEl4K3M4U2pWREZRTFBoZVV6ZFQxNEpw?=
 =?utf-8?B?c1lpWXhibEpKK2xyQ0QzNEMxWDZxS3ZtZ3dzb09ZNld2M1ZEbFRXeVNaSlcv?=
 =?utf-8?B?dUg2MWRqb2NTYU5BMVRFdkV2bnNZYmhWMlU0VTFET3BaeU96L056ZU9IL2FP?=
 =?utf-8?B?bUxQVFhwTGFDb0VXRXZ1TGc2Tms0ZmNoVEpnQVlkTGR5R1ZVTHRQbFZ0STBy?=
 =?utf-8?B?N0hRZWUxOG43RmNURzdxL1hRTE50TjUrZFArdkRNN29yQ1F1M1JzMC9odEkz?=
 =?utf-8?B?VEw5ODdIUUROZzVNNnc0OXJwMW5jUFdtc0dTWnFyT011eGFQZFBPRlk2aVpm?=
 =?utf-8?B?cVN0V1BlVC9nSHhQcXMzOW0vNlhVY3B3SzYwUGc5YUxBdTVjdkQ0L0tWUURO?=
 =?utf-8?B?VWxqN1JGWjhOS3hzcmJkbVg0Q0lORG9EZE9lNGdqTksxWDAwZysyeFpqWmFZ?=
 =?utf-8?B?WnRnUGhRRlpOUWk2dDBpTzdCK3dPajJMNzFTSENtWEhSUk5aZldrSHZFYzgr?=
 =?utf-8?B?dUR2QnRuejBnYzMxQXVyR2R3TkhWNDVzdktFQjUzZjcrOXBvdWxiZUFsek5G?=
 =?utf-8?Q?rbog81xUjuQLevcc=3D?=
X-Exchange-RoutingPolicyChecked: isIiwiHY2TbeOOFJRU5+VxkWEOM03wAPovlhe0bFKej3Uudjx9dj2MitmWqBD13Iw+13BmS7buKfLIy3Ti9hNeOPHL5Wyp1lbaDWGdacIEsBdUuctkO7H1AkzY7/h2nqOFl6GLBxgUFRoyoXOnLVNEhwxrCyTbAhnFl8LasPF0+r2OzzMqy9xtbes6K+aHZLW1rieFPmZwIxxz1zPtoaFn7G5kUYYNBJif2oNLc0QeIInQ8Rs41wOKlbw8OQqUNFGrwTNS7NnnIxvOGM5ZNiPmzUtGBxrYws0rmlHDiKEJxKdJmSq9zBf1/94b+3vS4g4/ChPfhZQITq3NOr/8w1PA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9344c263-fbfe-4293-ca82-08def46e14d0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 10:24:36.7192 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qzX4XTgEPZgijppSmyg4niyygYv/Q5nIXF2QmQ8X4DpN7OD38lV4IOHKEbLGTxj6seKd6W91YLNDguE7kAmcE1HWswjaPZXDkmNjRcyx0Jo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4923
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



On 8/7/2026 11:56 AM, Mallesh, Koujalagi wrote:
> 
> On 30-07-2026 08:51 pm, Michal Wajdeczko wrote:
>> Report 'device wedged' error using xe_log_err_fatal() helper.
>> Use -EIO as the error cause, as nothing else is provided here.
>> The hints about the recovery method and bug filling are now
> Typo 'filing'
>> separated as it only needs to be printed once.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_device.c | 16 ++++++++++------
>>   1 file changed, 10 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 4eed9a251e65..b1e9bcd9f5b4 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -48,6 +48,7 @@
>>   #include "xe_i2c.h"
>>   #include "xe_irq.h"
>>   #include "xe_late_bind_fw.h"
>> +#include "xe_log.h"
>>   #include "xe_mmio.h"
>>   #include "xe_module.h"
>>   #include "xe_nvm.h"
>> @@ -1396,6 +1397,9 @@ void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method)
>>       xe->wedged.method = method;
>>   }
>>   +#define WEDGED_URL    "https://docs.kernel.org/gpu/drm-uapi.html#device-wedging"
>> +#define XE_BUG_URL    "https://gitlab.freedesktop.org/drm/xe/kernel/issues/new"
> 
> We can directly used url string, instead of define as macro, since we are not using anywhere else. OR

URLs change from time to time
IMO it is easier to change a dedicated macro then full message,
that will remain unchanged otherwise
> 
> Please make scope to file only.

hmm?

we can try to promote WEDGED_URL to drm/drm_device.h as DRM_WEDGE_URL_DOC
and move XE_BUG_URL to xe/xe_drv.h, but I don't want to this right now

> 
>> +
>>   /**
>>    * xe_device_declare_wedged - Declare device wedged
>>    * @xe: xe device instance
>> @@ -1427,12 +1431,12 @@ void xe_device_declare_wedged(struct xe_device *xe)
>>       if (!atomic_xchg(&xe->wedged.flag, 1)) {
>>           xe->needs_flr_on_fini = true;
>>           xe_pm_runtime_get_noresume(xe);
>> -        drm_err(&xe->drm,
>> -            "CRITICAL: Xe has declared device %s as wedged.\n"
>> -            "IOCTLs and executions are blocked.\n"
>> -            "For recovery procedure, refer to https://docs.kernel.org/gpu/drm-uapi.html#device-wedging\n"
>> -            "Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
>> -            dev_name(xe->drm.dev));
>> +
>> +        xe_log_err_fatal(xe, WEDGED, -EIO, "Device declared wedged!\n");
> 
> Using -EIO is right? since we called this function with difference location (since we are not propagating errors), we may have different errors.
> 
> which may be misleading with -EIO.

true, but there is no errno available at this point
and most callers don't use any errno at all

we can change that to -ENOTRECOVERABLE, which was introduced
recently to indicate a WEDGED state, but then it will be
little redundant

or

change the xe_device_declare_wedged signature and require
errno to be assigned by the callers (but that would be
a separate task/patch from this example


> 
> 
> Thanks,
> 
> -/Mallesh
> 
>> +        xe_err_once(xe, "IOCTLs and executions are now blocked!\n"
>> +                "For recovery procedure, refer to %s\n"
>> +                "Please file a _new_ bug report at %s\n",
>> +                WEDGED_URL, XE_BUG_URL);
> 
>>       }
>>         for_each_gt(gt, xe, id)


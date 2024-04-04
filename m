Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD71CCD1288
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 19:52:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2935A113492;
	Thu,  4 Apr 2024 19:52:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fuhMx5XK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C34BC113492
 for <Intel-Xe@lists.freedesktop.org>; Thu,  4 Apr 2024 19:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712260376; x=1743796376;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uyU2mPjM30hSxd+YJdipK2QnUeAQwlqwcoEsOaWvb/Q=;
 b=fuhMx5XKZ2lesTfs2hSdnwQDeMeE8aLd7dKCMEHYEtkyR7bLH8XuGEK4
 NJnZX9+EeQKu1VWekpI4iI3oVXcDPpG61KGBQDoqD3P95DFsv58ExdqGv
 IFN2rzI1oA61HtXVr9Qd6T8yUXKcbpFgWdYjSeg3xC0bJLfxD068ZXJGR
 An33+TadX8tBw49zDNcRY3yRPI4cMcz43hsyUU51sClGF3cnchRvUsdXK
 IRMdVupsCYare38YXrZzmWqD6LujVoy+W0zjaKzcSOZ3q0Fpp7mMV2IzC
 XNYvEJnbWu48Z0b8A2v73407SUDjmY1rRHuJqB8QUTnK6jPnkHetsXwox Q==;
X-CSE-ConnectionGUID: zhuN+scUTMeN/E/jrrktiQ==
X-CSE-MsgGUID: IlQ+AY6ESBi681BADlVrFA==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7418617"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="7418617"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 12:52:55 -0700
X-CSE-ConnectionGUID: P9m+c7n5RqS8FipI9ILo7g==
X-CSE-MsgGUID: kinOp8OgR3Gf6XOuoMj76w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="18869029"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Apr 2024 12:52:55 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 12:52:54 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 12:52:53 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Apr 2024 12:52:53 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Apr 2024 12:52:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WlUYRNqPNiovCPl0CcrTakRaEcV2UE2h8wb6xzPFkEEFcQn7OtyTONu72O7bYSEEjjborL0SM/ItBDUJ+6oIvd3dUrLBJg5gEiltHIyC/r8fLr0CLZYwkGEutJe79eAWdv+Yl1ipuWeb/Cb+hlT2zBzonrryOR8hmeNG1gx+KTjlYWg1aywDfie9RGE4E8sMec13xWeFeajSmPKZkS/WtZr+EF9hu3Z/BK5/PpTANJ8IyKe2S4yy+XaoOQo0N4v8eRhppreAIYR73VJyqL6tSiLA3zCRvRsaYHHC0WgWUO4TqZKRcbia8wiSPr9qGVBeaO/+r+EKzT3upKWac97r7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lp/+qu18ez0X0nhQjrFKW17eA7SQcj3UP7iIL94RKSE=;
 b=B0SnageQt2a6axPR0DLGcTgSXwpxFAGEaLGdKyDfq46jRMO2dz/tsJZfd+iDacvWxEySfHlR8zgBPucrznu+NvWIp1sD5fZMJfrtjNT9UnAaoJjAdkaVGmDbV5A8siWvG29FeRWMIHN2nFVkCFr00IVStchjiHIQOXd2Cy4X0YO7DMrwHNUZiilos5BQCVc7oRrzW9QzmtujZuiyoy/Jr+cMR+X4lIQaobeHLjrxBeYvPXpTVODWeQh+afpIS0b50V3J5pAdHUvSmj6PTvH9AOzsqjiwoLMbyq/LwU5q9F3XNPmSZCWgMclYbA+tilx1lJBqy7kEAhGJsQQS1rDJcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by MW4PR11MB7031.namprd11.prod.outlook.com (2603:10b6:303:22c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Thu, 4 Apr
 2024 19:52:50 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b%4]) with mapi id 15.20.7452.019; Thu, 4 Apr 2024
 19:52:50 +0000
Message-ID: <090d6d4b-1918-4355-9f42-7e696f89987a@intel.com>
Date: Thu, 4 Apr 2024 12:52:45 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] drm/xe/guc: Port over the slow GuC loading support
 from i915
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
References: <20240228011002.2454419-1-John.C.Harrison@Intel.com>
 <20240228011002.2454419-3-John.C.Harrison@Intel.com>
 <wj5shvj6oc5zdk6katkqanztp5jmbfyt6i34r44irtaph2gzf4@f6z5qdkfeg27>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <wj5shvj6oc5zdk6katkqanztp5jmbfyt6i34r44irtaph2gzf4@f6z5qdkfeg27>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0252.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::17) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|MW4PR11MB7031:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4VBATdKF9dIoLZFeNBBMTj+sA1RKYuHsfDcqOqKx3LeRaTqLrSQaE5il2/B+XQsAXIV+iT6mXLI0+C1ROU2/69sT6RlHSb8FvoCqi/4/VBE9BUoLGFQgwe7NgLCChmM2t3MdtCp+JS+lkymzOylPZ18xoGp2Yh8lBHZoEZl2vHY18htvydxgmM5v12Dt7/TZ6fCtRkw3De1EXcCWvGBQkIGp14galO4fp6pmhSz+f0YM+FKS3CFYbVjVrudVIm0NwZeFC54+sdDxodlg1yaFXjl2ItXCuYpclDtTJKqxovbmNTb9Ai/R6AVQD81bZHbsp6ox6dLAj5f/orChdvSV7w2r4aboi07hkXvVfiVK3E6YnmD+0588qsuCZzkGvRp0z9JlH/votHuox3nvqd/hsY/tNzcPaSo91u5L5cYYDU7OxQ5rdVd7TC7DcplFJ/A4qxKFv+ikU8Y0z3hiPdbpIYQ5WDtyCzJl53PNCkkpzNpBxMLuixnGAsufwkFp7o2SzqWyYIlXG1vB8ofX+tIDiwWN+1fs6ThqtifoxGJ+zxnH36lMKY8A5lvI9EJ25L1wUBXFkJfO0zOMaSS+5j4DRbyrOqt4lQbL6j/hL18tLuebOJpQwc9zo44YQT907Rum52GNbkZTiTyIiDoI1gFXC3cp60q3RtG8u1QAlx22aH8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGJqUldtQzVMVjdqTjVUWVpVQ3RlNnV1blBzbXB5OWQxdTFicW9aNHV4QW90?=
 =?utf-8?B?RW1YR2F6UXZWUmVJbjlZMmwyT0N4K0xnWnJxT1QzcUsyMFNOS0dwOUFkWDVQ?=
 =?utf-8?B?ZEh2OE5UQjhjdUhmd1lPaFkzdW5wbW9yN0tjd1dKUEpvTDhudTNhQ3l2N2sv?=
 =?utf-8?B?ZUU5RjlkYnd4UnJyMGJqd0xySGQ0NXFJSXpoRU5Rd01CSjU1blZ4Y0tNRDR5?=
 =?utf-8?B?dTZnRXBNb2dSZ3hIMVgvOHJETXZDWGNPVmdSNGNRRlJXR2p2L3phUmdWSUwz?=
 =?utf-8?B?TUdmSHovTWlydFAxN0pQcEp4cExiUzRGdGdkNlVsYXp2WkNtc21XL3B6QTNz?=
 =?utf-8?B?ZHo1Y1J6TVRrS0l2VW1iaFpCRHFCbzJyM29DOE5FTkVmYWtRQlkwSnNhQnpN?=
 =?utf-8?B?NyszcUxLTjI5WjZPWGhPYytzQXlyWkFJRjRYbU1oVzVZeHZyL3JLMTZaRkRk?=
 =?utf-8?B?dlFTZndXbjR0eWJpL2JTTUZQYXBYZU1nU3Bva1pkdUJpSkU1dkJrQUVmamgw?=
 =?utf-8?B?RnNzNkJoaHExSWhRSHVncm9HcWVDTE02VlRTWjV5L2NrdTJLUENqYTVhSFc0?=
 =?utf-8?B?MGRzcFg3bXB5Ym5LSXIxUEtSWmtCVHAybE1NaVJIWnowVndLUkFWMEQwU29W?=
 =?utf-8?B?MEpzd2pZeUExM3ZPTU95YXFHY1ZNNzBQeGRxT1E5ck5JMUVhVEcvZFRpcE5q?=
 =?utf-8?B?VEhYUmluU2VNbExlMmxhME1HeHRXVlFMY3hrQmJNWktMc0xXY21VUVRmL3U5?=
 =?utf-8?B?a3oyaDlRRXpVVTR2V2JoQlZSY0JqTkJhTnhJOTBMdzJuQTU1cFZJRGoyaGYr?=
 =?utf-8?B?eHZ2Y21aYlBtT3hwWkVvZXV1b3pKNndLVkVmOE9tU0plc2tQV0RoRUt5V08r?=
 =?utf-8?B?UENHcWlVZ2djeVY5U09mbnhwNjl1ZEpqdVZKdEdtWTZJUCtsK0RtcUY3K0Rh?=
 =?utf-8?B?Tk9QRzNpZ05GY0F2OEd2QWxYOEYzRWRWb1JTQUdSTWRiTkxPOHNzaU53cENp?=
 =?utf-8?B?K3B4eUpheC9FdFJZVFg2ZUIrQVlCNGQwL3RFeUsxSzlWRjFrU0RaTWcwWTR6?=
 =?utf-8?B?eWp5cGJ1RGtIZ0JyaUlrZ3JyZ2NxNk9TdUxRZVVZTDVGbXBOTklwSTZIUXNr?=
 =?utf-8?B?YzlNQUJQNm1EbDhZM1l6V0JQb1dHMjJqaXhuZjVXV0FrcDRnL0cxVDB3cDFS?=
 =?utf-8?B?WEtDdEt5bUg1TnoydWUvUGZ3U1NpVG9TMUhZc09WTVRPTjRqbDZqWHhkNUpT?=
 =?utf-8?B?dnBnUm5DQUJHS2hDblNuVFNSN3VNRVpCdXY2LzloS1l5NnVDbXozajQ0ZXR2?=
 =?utf-8?B?eGsrZFJpQ2ZielJDYmEwalVOZExPdmFhTzVJcjRzS2FIUjJNSXpJK1VRMWE4?=
 =?utf-8?B?U0FoL0ZON2JYSXlQLzhsNlBPWWprelp0SnhrUGtZYVhCSWo2YnRHckI3VFF4?=
 =?utf-8?B?UklEY3Rkam4vODYyWTlSamYzMVRlY0tkc01tRW9lWEs4VkNyelVjdHJBMmtv?=
 =?utf-8?B?aUs0Y21QclREQkxSMHY5WC9hcmhLSnUwaXViem4rd3pIY3dEUm53OSszbTlk?=
 =?utf-8?B?c2tnRThwWkt6RHlUSlB3T05Rb013ZlR6MHliL3RBampVQnFPeXo3VTZHWHZI?=
 =?utf-8?B?d2RTMmNML3I3MHlqT09pcmJXNGl5VGx6a3ozbk9yazhsdHZFc0x2aGlSSk54?=
 =?utf-8?B?K1BkTjh6T25mSCsyS05TTXJGRVRranUvRGw3TEZvZWhaYmxDM1dHa1RaRm5o?=
 =?utf-8?B?elpXRkVYdGtERUU3Smg0M3NzRnNVZHBER1grVjV2REVteVZYWDQ4L3Nuejg0?=
 =?utf-8?B?TDh3d3YvL2pCNExJemtpWXB1NjdoS3haZnF1MDBtNWtvY1l2dXl0MVByeTZt?=
 =?utf-8?B?Q3o4d1JLdWlwNmoxb1htbVdRNVNBYUVMUzdCMW9hbnBXQkl5OUZxdHJPaXBl?=
 =?utf-8?B?VGU0V1dnMlBJbmNqS3V6OGJ0UktmUmpFakIrdC9WMVBUNExTSzN5Sjg4WlFZ?=
 =?utf-8?B?bVhuSklnZjBqTlV0L2h2Mm5vMVBldGx5Vi9KWk9xNithajBnRlJZWTFlaXo2?=
 =?utf-8?B?eG5YMjl5UG9XbnI5R0hDNVZlQzNiK0RHaVpubWpQL0dSNXRRei9UbTcrZE1m?=
 =?utf-8?B?ZXlaeTJPOTNyWEc0OC9WUzIvajJCNzJpL21iM1RreHJKTSt4TnpRSXUzNXJx?=
 =?utf-8?B?N0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 13299e0f-8e16-4b23-875d-08dc54e0cf0d
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 19:52:50.4592 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C5NlUyJepBCFJ63uqVvVDapI5uEhbrowXRLv24cbnGC9YJywOWBULh/SABQO6kVXRYLjefrAuyZ7q5JPZo23cZn/btKG5CG18QF/wiOhd6Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7031
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

On 4/4/2024 12:19, Lucas De Marchi wrote:
> On Tue, Feb 27, 2024 at 05:09:56PM -0800, John.C.Harrison@Intel.com 
> wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> GuC loading can take longer than it is supposed to for various
>> reasons. So add in the code to cope with that and to report it when it
>> happens. There are also many different reasons why GuC loading can
>> fail, so add in the code for checking for those and for reporting
>> issues in a meaningful manner rather than just hitting a timeout and
>> saying 'fail: status = %x'.
>>
>> Also, remove the 'FIXME' comment about an i915 bug that has never been
>> applicable to Xe!
>>
>> v2: Actually report the requested and granted frequencies rather than
>> showing granted twice (review feedback from Badal).
>> v3: Locally code all the timeout and end condition handling because a
>> helper function is not allowed (review feedback from Lucas/Rodrigo).
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>> drivers/gpu/drm/xe/abi/guc_errors_abi.h |  26 ++-
>> drivers/gpu/drm/xe/regs/xe_guc_regs.h   |   2 +
>> drivers/gpu/drm/xe/xe_guc.c             | 226 +++++++++++++++++++-----
>> drivers/gpu/drm/xe/xe_mmio.c            |  61 +++++++
>> drivers/gpu/drm/xe/xe_mmio.h            |   2 +
>> 5 files changed, 274 insertions(+), 43 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_errors_abi.h 
>> b/drivers/gpu/drm/xe/abi/guc_errors_abi.h
>> index ec83551bf9c0..d0b5fed6876f 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_errors_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_errors_abi.h
>> @@ -7,8 +7,12 @@
>> #define _ABI_GUC_ERRORS_ABI_H
>>
>> enum xe_guc_response_status {
>> -    XE_GUC_RESPONSE_STATUS_SUCCESS = 0x0,
>> -    XE_GUC_RESPONSE_STATUS_GENERIC_FAIL = 0xF000,
>> +    XE_GUC_RESPONSE_STATUS_SUCCESS                      = 0x0,
>> +    XE_GUC_RESPONSE_NOT_SUPPORTED                       = 0x20,
>> +    XE_GUC_RESPONSE_NO_ATTRIBUTE_TABLE                  = 0x201,
>> +    XE_GUC_RESPONSE_NO_DECRYPTION_KEY                   = 0x202,
>> +    XE_GUC_RESPONSE_DECRYPTION_FAILED                   = 0x204,
>> +    XE_GUC_RESPONSE_STATUS_GENERIC_FAIL                 = 0xF000,
>> };
>>
>> enum xe_guc_load_status {
>> @@ -17,6 +21,9 @@ enum xe_guc_load_status {
>>     XE_GUC_LOAD_STATUS_ERROR_DEVID_BUILD_MISMATCH       = 0x02,
>>     XE_GUC_LOAD_STATUS_GUC_PREPROD_BUILD_MISMATCH       = 0x03,
>>     XE_GUC_LOAD_STATUS_ERROR_DEVID_INVALID_GUCTYPE      = 0x04,
>> +    XE_GUC_LOAD_STATUS_HWCONFIG_START                   = 0x05,
>> +    XE_GUC_LOAD_STATUS_HWCONFIG_DONE                    = 0x06,
>> +    XE_GUC_LOAD_STATUS_HWCONFIG_ERROR                   = 0x07,
>>     XE_GUC_LOAD_STATUS_GDT_DONE                         = 0x10,
>>     XE_GUC_LOAD_STATUS_IDT_DONE                         = 0x20,
>>     XE_GUC_LOAD_STATUS_LAPIC_DONE                       = 0x30,
>> @@ -34,4 +41,19 @@ enum xe_guc_load_status {
>>     XE_GUC_LOAD_STATUS_READY                            = 0xF0,
>> };
>>
>> +enum xe_bootrom_load_status {
>> +    XE_BOOTROM_STATUS_NO_KEY_FOUND                      = 0x13,
>> +    XE_BOOTROM_STATUS_AES_PROD_KEY_FOUND                = 0x1A,
>> +    XE_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE            = 0x2B,
>> +    XE_BOOTROM_STATUS_RSA_FAILED                        = 0x50,
>> +    XE_BOOTROM_STATUS_PAVPC_FAILED                      = 0x73,
>> +    XE_BOOTROM_STATUS_WOPCM_FAILED                      = 0x74,
>> +    XE_BOOTROM_STATUS_LOADLOC_FAILED                    = 0x75,
>> +    XE_BOOTROM_STATUS_JUMP_PASSED                       = 0x76,
>> +    XE_BOOTROM_STATUS_JUMP_FAILED                       = 0x77,
>> +    XE_BOOTROM_STATUS_RC6CTXCONFIG_FAILED               = 0x79,
>> +    XE_BOOTROM_STATUS_MPUMAP_INCORRECT                  = 0x7A,
>> +    XE_BOOTROM_STATUS_EXCEPTION                         = 0x7E,
>> +};
>> +
>> #endif
>> diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h 
>> b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>> index 4e7f809d2b00..2e54c9e6a4fe 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>> @@ -40,6 +40,8 @@
>> #define   GS_BOOTROM_JUMP_PASSED REG_FIELD_PREP(GS_BOOTROM_MASK, 0x76)
>> #define   GS_MIA_IN_RESET            REG_BIT(0)
>>
>> +#define GUC_HEADER_INFO                XE_REG(0xc014)
>> +
>> #define GUC_WOPCM_SIZE                XE_REG(0xc050)
>> #define   GUC_WOPCM_SIZE_MASK            REG_GENMASK(31, 12)
>> #define   GUC_WOPCM_SIZE_LOCKED            REG_BIT(0)
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index 0d2a2dd13f11..771971110600 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -17,6 +17,7 @@
>> #include "xe_device.h"
>> #include "xe_force_wake.h"
>> #include "xe_gt.h"
>> +#include "xe_gt_throttle.h"
>> #include "xe_guc_ads.h"
>> #include "xe_guc_ct.h"
>> #include "xe_guc_hwconfig.h"
>> @@ -461,58 +462,201 @@ static int guc_xfer_rsa(struct xe_guc *guc)
>>     return 0;
>> }
>>
>> -static int guc_wait_ucode(struct xe_guc *guc)
>> +/*
>> + * Check a previously read GuC status register (GUC_STATUS) looking for
>> + * known terminal states (either completion or failure) of either the
>> + * microkernel status field or the boot ROM status field. Returns +1 
>> for
>> + * successful completion, -1 for failure and 0 for any intermediate 
>> state.
>> + */
>> +static int guc_load_done(u32 status)
>> {
>> -    struct xe_device *xe = guc_to_xe(guc);
>> -    u32 status;
>> -    int ret;
>> +    u32 uk_val = REG_FIELD_GET(GS_UKERNEL_MASK, status);
>> +    u32 br_val = REG_FIELD_GET(GS_BOOTROM_MASK, status);
>> +
>> +    switch (uk_val) {
>> +    case XE_GUC_LOAD_STATUS_READY:
>> +        return 1;
>> +
>> +    case XE_GUC_LOAD_STATUS_ERROR_DEVID_BUILD_MISMATCH:
>> +    case XE_GUC_LOAD_STATUS_GUC_PREPROD_BUILD_MISMATCH:
>> +    case XE_GUC_LOAD_STATUS_ERROR_DEVID_INVALID_GUCTYPE:
>> +    case XE_GUC_LOAD_STATUS_HWCONFIG_ERROR:
>> +    case XE_GUC_LOAD_STATUS_DPC_ERROR:
>> +    case XE_GUC_LOAD_STATUS_EXCEPTION:
>> +    case XE_GUC_LOAD_STATUS_INIT_DATA_INVALID:
>> +    case XE_GUC_LOAD_STATUS_MPU_DATA_INVALID:
>> +    case XE_GUC_LOAD_STATUS_INIT_MMIO_SAVE_RESTORE_INVALID:
>> +        return -1;
>> +    }
>> +
>> +    switch (br_val) {
>> +    case XE_BOOTROM_STATUS_NO_KEY_FOUND:
>> +    case XE_BOOTROM_STATUS_RSA_FAILED:
>> +    case XE_BOOTROM_STATUS_PAVPC_FAILED:
>> +    case XE_BOOTROM_STATUS_WOPCM_FAILED:
>> +    case XE_BOOTROM_STATUS_LOADLOC_FAILED:
>> +    case XE_BOOTROM_STATUS_JUMP_FAILED:
>> +    case XE_BOOTROM_STATUS_RC6CTXCONFIG_FAILED:
>> +    case XE_BOOTROM_STATUS_MPUMAP_INCORRECT:
>> +    case XE_BOOTROM_STATUS_EXCEPTION:
>> +    case XE_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE:
>> +        return -1;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static s32 guc_pc_get_cur_freq(struct xe_guc_pc *guc_pc)
>> +{
>> +    u32 freq;
>> +    int ret = xe_guc_pc_get_cur_freq(guc_pc, &freq);
>> +
>> +    return ret ? ret : freq;
>> +}
>> +
>> +/*
>> + * Wait for the GuC to start up.
>> + *
>> + * Measurements indicate this should take no more than 20ms 
>> (assuming the GT
>> + * clock is at maximum frequency). However, thermal throttling and 
>> other issues
>> + * can prevent the clock hitting max and thus making the load take 
>> significantly
>> + * longer. Indeed, if the GT is clamped to minimum frequency then 
>> the load times
>> + * can be in the seconds range. As, there is a limit on how long an 
>> individual
>
>                     ^ that comma seems misplaced
>
>> + * usleep_range() can wait for, the wait is wrapped in a loop. The 
>> loop count
>> + * is increased for debug builds so that problems can be detected 
>> and analysed.
>> + * For release builds, the timeout is kept short so that user's 
>> don't wait
>> + * forever to find out there is a problem. In either case, if the 
>> load took longer
>> + * than is reasonable even with some 'sensible' throttling, then 
>> flag a warning
>> + * because something is not right.
>> + *
>> + * Note that the only reason an end user should hit the timeout is 
>> in case of
>> + * extreme thermal throttling. And a system that is that hot during 
>> boot is
>> + * probably dead anyway!
>> + */
>> +#if defined(CONFIG_DRM_XE_DEBUG)
>> +#define GUC_LOAD_RETRY_LIMIT    20
>> +#else
>> +#define GUC_LOAD_RETRY_LIMIT    3
>> +#endif
>
> just sent a comment on this reasoning in the previous version.
> Continuing from here.
>
>> +#define GUC_LOAD_TIME_WARN      200
>
> let's also add the unit, _MSEC
>
> Also, comment above says 20, but here we warn on 200. Is that 10x
> difference a typo or intended?
It's a safety margin to allow for situations such as a system that just 
rebooted due to thermal shutdown and is still running hot and therefore 
slow. I'll update the comment above to explain.

>
>>
>> +static int guc_wait_ucode(struct xe_guc *guc)
>> +{
>> +    struct xe_gt *gt = guc_to_gt(guc);
>> +    struct xe_guc_pc *guc_pc = &gt->uc.guc.pc;
>> +    ktime_t before, after, delta;
>> +    int load_done;
>> +    u32 status = 0;
>> +    int ret, count;
>> +    u64 delta_ms;
>> +    u32 before_freq;
>> +
>> +    before_freq = xe_guc_pc_get_act_freq(guc_pc);
>> +    before = ktime_get();
>>     /*
>> -     * Wait for the GuC to start up.
>> -     * NB: Docs recommend not using the interrupt for completion.
>> -     * Measurements indicate this should take no more than 20ms
>> -     * (assuming the GT clock is at maximum frequency). So, a
>> -     * timeout here indicates that the GuC has failed and is unusable.
>> -     * (Higher levels of the driver may decide to reset the GuC and
>> -     * attempt the ucode load again if this happens.)
>> -     *
>> -     * FIXME: There is a known (but exceedingly unlikely) race 
>> condition
>> -     * where the asynchronous frequency management code could reduce
>> -     * the GT clock while a GuC reload is in progress (during a full
>> -     * GT reset). A fix is in progress but there are complex locking
>> -     * issues to be resolved. In the meantime bump the timeout to
>> -     * 200ms. Even at slowest clock, this should be sufficient. And
>> -     * in the working case, a larger timeout makes no difference.
>> +     * Note, can't use any kind of timing information from the call 
>> to xe_mmio_wait.
>> +     * It could return a thousand intermediate stages at random 
>> times. Instead, must
>> +     * manually track the total time taken and locally implement the 
>> timeout.
>
> that's something we may improve in future with a variant with a better
> variant of this function to be used on loops.

Or maybe a variant which allows a custom comparison function to be 
passed in and keeps all the time tracking internal...

>
>>      */
>> -    ret = xe_mmio_wait32(guc_to_gt(guc), GUC_STATUS, GS_UKERNEL_MASK,
>> -                 FIELD_PREP(GS_UKERNEL_MASK, XE_GUC_LOAD_STATUS_READY),
>> -                 200000, &status, false);
>> +    do {
>> +        u32 last_status = status & (GS_UKERNEL_MASK | GS_BOOTROM_MASK);
>>
>> -    if (ret) {
>> -        struct drm_device *drm = &xe->drm;
>> -
>> -        drm_info(drm, "GuC load failed: status = 0x%08X\n", status);
>> -        drm_info(drm, "GuC load failed: status: Reset = %d, BootROM 
>> = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
>> -             REG_FIELD_GET(GS_MIA_IN_RESET, status),
>> -             REG_FIELD_GET(GS_BOOTROM_MASK, status),
>> -             REG_FIELD_GET(GS_UKERNEL_MASK, status),
>> -             REG_FIELD_GET(GS_MIA_MASK, status),
>> -             REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
>> -
>> -        if ((status & GS_BOOTROM_MASK) == GS_BOOTROM_RSA_FAILED) {
>> -            drm_info(drm, "GuC firmware signature verification 
>> failed\n");
>> +        /*
>> +         * Wait for any change (intermediate or terminal) in the 
>> status register.
>> +         * Note, the return value is a don't care. The only failure 
>> code is timeout
>> +         * but the timeouts need to be accumulated over all the 
>> intermediate partial
>> +         * timeouts rather than allowing a huge timeout each time. 
>> So basically, need
>> +         * to treat a timeout no different to a value change.
>> +         */
>> +        xe_mmio_wait32_not(gt, GUC_STATUS, GS_UKERNEL_MASK | 
>> GS_BOOTROM_MASK,
>> +                   last_status, 1000 * 1000, &status, false);
>
> if I understood correctly the meaning of this function, it would better
> be called xe_mmio_wait32_mask() or xe_mmio_wait32_field()?
>
> i.e. you provide the mask (GS_UKERNEL_MASK | GS_BOOTROM_MASK)
> and the previous register value and you wait for a change
> in that field of the register. Is that the correct meaning of the
> function?
The test is 'read != given'. That sounds like a not to me. A _mask or 
_field suffix (to me) would imply just that the regular wait semantics 
are applied with a mask or to a specific field (which is already the 
case, isn't it?). I.e. wait until '(read & mask) == given' or even 
'(read & mask) == (given << shift)' for a field version. This is the 
negative version of that test. It must wait until the value has changed, 
i.e. is not equal to the given target.

>
> ugh... this bool value to show atomic or otherwise shouldn't be there
> (but it's pre-existent issue).
Feel free to fix the baseline xe_mmio_wait32 function. I'm just copying 
that and trying to stay as close as possible but just inverting the 
comparison logic.

John.

>
> Lucas De Marchi


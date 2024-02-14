Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE729C4829A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Feb 2024 05:39:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97ACA10E4AB;
	Wed, 14 Feb 2024 05:39:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NL1hdpRM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C40ED10E4AB
 for <Intel-Xe@lists.freedesktop.org>; Wed, 14 Feb 2024 05:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707889181; x=1739425181;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=vGFKdYgUKC2yjB8qNlZPD5o1Xliee6ixAp/7DBj0CYc=;
 b=NL1hdpRMzHTnsc1U8m/S4kPbBlc3eXbmxicCwC+23ysESPPaCNYmNTnC
 K2WHg6fpfigzkePmrj5wNkm4L1zza0B7EbVTYFm0nK1yHSbqES/jgsKZY
 sS1GLrJZDCq88+285tdAY8K4PdjtP34xqQTgyVKi4h9leCQRnwZjE4whw
 ipfcIxd3uj4zCqIuoi1eIiF0BkbZHbPCx9dAxcoyRiFi5TguxQ/LAwrkd
 6E5Ka0TMeiDDmVay4iEIe8MmrXWvHnV7j70rKT/DIiJa4IXXoQhmgoEFe
 pf4cCd51mvAWHTSnUFI/BKXpotnOV6+aBf0kKxuLiSxN0v21AhR7l0OWd g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1773558"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="1773558"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 21:39:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="912013026"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; d="scan'208";a="912013026"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Feb 2024 21:39:39 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 13 Feb 2024 21:39:38 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 13 Feb 2024 21:39:38 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 13 Feb 2024 21:39:38 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 13 Feb 2024 21:39:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UjpmWv9AouJmPi9Y9hFYkqwubDfBgmj7b8/lyBfmHm9YQFks5H0V2g4Ol/zG1sRPf3w3p/k+HiEYgxAzDkLomAGrzTYhuy/oaXgrDgKpvwv/fvfanJvzAb7xAQBLt9RS5Dk4amVkf8BnZmDAASXYJOPt9ZKTwOWmWrAtY+91ByjY6Bofy3dpVxkmcKvg38E2T6whl+S74LufK1BXw01bQQ+b8t20hVzBhUl+oOZAg/Mc9pPtW7nH97vJq7pzAtw0aahwei1Gjodl15Bm6cnzqE39CUOPN4WxA4RPhIrO+c3XkwFeGb+86T7WpEATZFQDlb7O/081OA/8c1O4Lphg1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lxlJJZOLp28kU4G7RSSyBb1o8oKOG/jK3ix9GkXTA7I=;
 b=Wvf1HH9IlZmyiXmlQLiAD5TsUwd7mtEB1vW1NqEZONQotoTBBsAGN+73/grNvTnVMtT21UluLp1gBmxwQ4wTtGciZwBrvk6Wg/kew97zXReJYfK3IKsfT7JmqD3RrCuOyHgONyQyccvSQxsugY6+2KE7Lp77UnqaR9RRP9ym/3aprstCIKwcMgIKn1o0QyQQVUTnDEkGbc62EGXCLcV5a0OvZaz6CYfN8IxdNDPiITUvHUM98EMMENL1d0QgOdW445PAb5XlH1SY31jMxd03UPQJECy5LSlRX96HAzR11YwsMfFQmzbiQkQvtJGWOlbFWYzhm0Khg5wt1SVHVqnpOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SN7PR11MB6852.namprd11.prod.outlook.com (2603:10b6:806:2a4::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.27; Wed, 14 Feb
 2024 05:39:31 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::eb80:5333:fa3e:cb6c]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::eb80:5333:fa3e:cb6c%4]) with mapi id 15.20.7292.022; Wed, 14 Feb 2024
 05:39:31 +0000
Message-ID: <a48cc9b7-6d1b-4264-b400-3949583c0d5f@intel.com>
Date: Wed, 14 Feb 2024 11:09:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe/guc: Port over the slow GuC loading support
 from i915
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>, <Intel-Xe@Lists.FreeDesktop.Org>
References: <20240213003426.3943662-1-John.C.Harrison@Intel.com>
 <20240213003426.3943662-3-John.C.Harrison@Intel.com>
 <d8ec5d48-b356-42c6-9140-41c6868a1546@intel.com>
 <81c28b98-82f7-412c-a60d-9b19e372faeb@intel.com>
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <81c28b98-82f7-412c-a60d-9b19e372faeb@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0194.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::19) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SN7PR11MB6852:EE_
X-MS-Office365-Filtering-Correlation-Id: a5b4e0ed-2b76-4473-5aaf-08dc2d1f515c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bRKbolL2nHWZuSnif3uArUAn6MagfjmxdzKIC/XNvuXCoeUBqk95FVT3U0LKOHh9UFyw1GJuG4PqQwckIAL8k2/By+Mew7QAxx8mrx2NauaaD8ObXQaRqDs3361/HXQ4kJlVCd2tIYMvNgxTXDwt/AG20uHqUV6i30Ne9h+nVnmOffpbHSdDeXLmoiTAWlHVn50uCPOuheFAn4pOsF4ud7PNrZA0NekQQC+lCC7Xk2KNQuFywu3TrbSw3/h1XzRoaALzPzCQQ107JdnUR8iR8QAXCCObiQ773Tbhk0pH4CitPiU6VOZcBchoxk7Wg+QM7e5SXAJHUhw5pWP8qs7X2s9MQM6kj0us5I8MaKqMIMiZTU6bHJnq4QKP0y873mE6G1qOUqYkPo6rGTuJY9mDUOPE1MQBLeJ77oVHpN9evUiK20fX/zM9BdiM3sn3sq3WPlt2tAFhql4kKcBXPG7BBeraFvI9dRxn3PvHNzYIdqV4ydGgKQXEaXEHeXpjpT8ONSY5oCDnyzaRouW9p5WVbBs0bWOWRZ13Cqu6coCQqeUBQFVxx58gOQlKWJ2OBL4+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(366004)(39860400002)(376002)(136003)(230922051799003)(230273577357003)(186009)(451199024)(1800799012)(64100799003)(66946007)(2616005)(6506007)(31686004)(41300700001)(6512007)(6486002)(53546011)(478600001)(2906002)(66476007)(30864003)(8676002)(5660300002)(66556008)(8936002)(86362001)(6666004)(38100700002)(26005)(83380400001)(31696002)(36756003)(316002)(82960400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0lHdldTQXozK1VYbFlZQ1lObUZGK2RySXJPaWVmN1A5YkZ4TTdIWmRqRHRh?=
 =?utf-8?B?T1Y1NVA2TVdSYkJkMGV3WTNjUnJ1a2FNU3E2eGNqNUlWVzZkdHlyRkU4alBH?=
 =?utf-8?B?VE8rZk8yQVcvcGNZT2JTc3VvWHZEcFk0Y2VxUHFKNCtnVjhySXdCRndrenBR?=
 =?utf-8?B?aFhZVHc1S1JmeDQ4V1lBWTRZbWV0U3FvL0FXVkZBeGdyczdISDh3ZzJxWU9j?=
 =?utf-8?B?Nzh4azNRVG9icTZGelRNMGFxM2l5bS9sNmZJbHZ6b3U5bVBma0Q5Y2pFayt0?=
 =?utf-8?B?cUJZV00yb2xLR0Vtcjk2aUJHUjU2MThPcTVxYWl6NmRzNHJPckI4N05iQ1pN?=
 =?utf-8?B?SkpLNXZWbnc4ZzgzcXpWb1d6WVc2Zk04U2wyL2gwRzRSSUh1M1pXcmdWMW5W?=
 =?utf-8?B?M3ZyVHFoNmxNVWJUNkdPa2lURWZzS3B1RTB5QVRrYk9kV1R4OEQvUVBaWWVN?=
 =?utf-8?B?d1hGUmxIZmt4cG85Nnd4NjNiVWQ4RmF0VEo2Q2JmU251UUM4eFQwK3pQNndD?=
 =?utf-8?B?R2hHVUc5TVV6N1JzWEJLVWdCVHpTZjZaWnE0WWFaWHQrUk16UGwvbDVJcWdK?=
 =?utf-8?B?cnNLU1VFV0lUWElOTHhmUjdzRGxwV1JXYWVVOGN5cDlnM2oyWjZlUGV0YTZh?=
 =?utf-8?B?OXdVSW84N1Z0d2dhaU8vdVh1SHIwYzdnMTRxYnh1b2RJN2JLaU1kUXNXaDVB?=
 =?utf-8?B?S0Jlc2FiVFRHUlcxSmp1d2g5SXZmWmtiOWpnSXNDWmZIcmNaeXFDK1c0aWVR?=
 =?utf-8?B?U2owVkhKcXlDZnRlWmpYeDA3RFZIa2lVK2JyL0NRT0pIdzBpMGcrcnZYdjNy?=
 =?utf-8?B?bDJPbmwxL1I0Qk91M3MxN20vQXRlSVBJM0JRTnFFVWpEd1hvc2ZXUkRkdkVx?=
 =?utf-8?B?WHpKaThRdDZNWFdQOWRWWS92TkpRMkp4cVlqY1lvOE04U3htVzQ4dk0xeGdo?=
 =?utf-8?B?cHlPR1VoMWpxZ01sNkkvNGg3Mk85NmJFVExSeWxSQjN6eGJudnAySTB0VDIr?=
 =?utf-8?B?RjFscUpOWDBKaGhhLzQ0Y0xNelo1TVp5dVBUUHoxWVZydUsxSWFhM2dhcjMr?=
 =?utf-8?B?ck4wWHBDcmlHOUdhdlZWbURlOUxRSUs3Q2lYQmkzb1ZaYURUeEE5N2kvRWpL?=
 =?utf-8?B?SE1DeEpkYUQrazBTekdaMGxKSmhqSmNDSlJkK082eWdla1VUZzExWnl1a1JC?=
 =?utf-8?B?L3RNVlZUUWNaK3BZQ0ZIWitWeDhHSndmaFdlNHJSQlBTY1hoQXE1SzFuQU1R?=
 =?utf-8?B?TWhIRk1oanEwd1VXTHBza3ZGcU5ycTV6R2c0OUpJRDg4N0hhRWovdDlYNEZV?=
 =?utf-8?B?a2xHSWhyVERxWXU2d0Y5QWp0Q002NGdpTW9Gc0NBOUMzc1RqMjVaUHpmaFdE?=
 =?utf-8?B?Z2k0d1A1VVBlZ1IrOEREVmVMK3VDSkM2cnk0ZUVZMUxvZkg0NXg5MVY1dnBX?=
 =?utf-8?B?d2pUOXdRMWpmbUdUMUgwM3g3YXQzRTlLQlB3am5NWHpyUU9zaDFKVjRmVEFT?=
 =?utf-8?B?cFFGVUtkY3J5d1hObHpMZGYvcXYrRUw3V3BhWFVOZlU5MXd6bDR6YzRSQVFQ?=
 =?utf-8?B?dHpvZ3pSTHh0akdNQnZhbGhydXUyY1p2WFdkdDUyRTZCK1VvczFTOWFzU3M0?=
 =?utf-8?B?WnplaE8xWlZvaTNlbUpWUVIycHY5YWt5ZFRxQ2tqMzBOaDVqR001T1U0R083?=
 =?utf-8?B?aUtKenlXT2M4VkRiYmZDUk0zMk9BaDJPM2pSSC81ay9WNUFrMzM2WFZkRmxZ?=
 =?utf-8?B?SFVyK0VOQkpmUnNmZ1JnSENrUDBWTmMvS2J4alZKQVpKWHFDclhhcXc2REdT?=
 =?utf-8?B?SytwVXNVNHY3MkNYd3BwT0FKcEFwM0VtUHpRc3JSRmgzSzRuTUZtQ3Nma0Rz?=
 =?utf-8?B?M0VlbU16UWpFSzdoNGV0MFExclJyR21aVmhiVVpxaU05U0RFcGlmV2ZITHM0?=
 =?utf-8?B?MER5TWpaODg4c3hrUWhVSVZZZDFTZXBwdEVmWHJrWlQ1QjFrM3l6L0FmZjF1?=
 =?utf-8?B?UExvdm1JOUhSTzM0eC81QTB2VEdjUzBVeklNR21IamF1ZTlyMW9KN3pMUUc2?=
 =?utf-8?B?WEZ2ekd4UzYwcDYwaUNiMmIwQVZVWXJYczhoWk9UMjV4OEtTMC8yQVBzRWNr?=
 =?utf-8?B?YmhpTi90UzlCYWFjU01zSml3Z1liSFBmZytVckg5YndBVDhBbzA4TXloWUVS?=
 =?utf-8?B?QlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a5b4e0ed-2b76-4473-5aaf-08dc2d1f515c
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 05:39:31.3218 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /OSgjB4M1mzjyA+J32KJYFrGixbYc+ckYIu7WTnRZ43PEqDMmMOV3zNYOLi1v43395QuR3kvWAkIA/FxxYotnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6852
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



On 14-02-2024 07:44, John Harrison wrote:
> On 2/12/2024 21:17, Nilawar, Badal wrote:
>> On 13-02-2024 06:04, John.C.Harrison@Intel.com wrote:
>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>
>>> GuC loading can take longer than it is supposed to for various
>>> reasons. So add in the code to cope with that and to report it when it
>>> happens. There are also many different reasons why GuC loading can
>>> fail, so add in the code for checking for those and for reporting
>>> issues in a meaningful manner rather than just hitting a timeout and
>>> saying 'fail: status = %x'.
>>>
>>> Also, remove the 'FIXME' comment about an i915 bug that has never been
>>> applicable to Xe!
>>>
>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/abi/guc_errors_abi.h |  26 +++-
>>>   drivers/gpu/drm/xe/regs/xe_guc_regs.h   |   2 +
>>>   drivers/gpu/drm/xe/xe_guc.c             | 197 +++++++++++++++++++-----
>>>   drivers/gpu/drm/xe/xe_macros.h          |  32 ++++
>>>   4 files changed, 214 insertions(+), 43 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/abi/guc_errors_abi.h 
>>> b/drivers/gpu/drm/xe/abi/guc_errors_abi.h
>>> index ec83551bf9c0..d0b5fed6876f 100644
>>> --- a/drivers/gpu/drm/xe/abi/guc_errors_abi.h
>>> +++ b/drivers/gpu/drm/xe/abi/guc_errors_abi.h
>>> @@ -7,8 +7,12 @@
>>>   #define _ABI_GUC_ERRORS_ABI_H
>>>     enum xe_guc_response_status {
>>> -    XE_GUC_RESPONSE_STATUS_SUCCESS = 0x0,
>>> -    XE_GUC_RESPONSE_STATUS_GENERIC_FAIL = 0xF000,
>>> +    XE_GUC_RESPONSE_STATUS_SUCCESS                      = 0x0,
>>> +    XE_GUC_RESPONSE_NOT_SUPPORTED                       = 0x20,
>>> +    XE_GUC_RESPONSE_NO_ATTRIBUTE_TABLE                  = 0x201,
>>> +    XE_GUC_RESPONSE_NO_DECRYPTION_KEY                   = 0x202,
>>> +    XE_GUC_RESPONSE_DECRYPTION_FAILED                   = 0x204,
>>> +    XE_GUC_RESPONSE_STATUS_GENERIC_FAIL                 = 0xF000,
>>>   };
>>>     enum xe_guc_load_status {
>>> @@ -17,6 +21,9 @@ enum xe_guc_load_status {
>>>       XE_GUC_LOAD_STATUS_ERROR_DEVID_BUILD_MISMATCH       = 0x02,
>>>       XE_GUC_LOAD_STATUS_GUC_PREPROD_BUILD_MISMATCH       = 0x03,
>>>       XE_GUC_LOAD_STATUS_ERROR_DEVID_INVALID_GUCTYPE      = 0x04,
>>> +    XE_GUC_LOAD_STATUS_HWCONFIG_START                   = 0x05,
>>> +    XE_GUC_LOAD_STATUS_HWCONFIG_DONE                    = 0x06,
>>> +    XE_GUC_LOAD_STATUS_HWCONFIG_ERROR                   = 0x07,
>>>       XE_GUC_LOAD_STATUS_GDT_DONE                         = 0x10,
>>>       XE_GUC_LOAD_STATUS_IDT_DONE                         = 0x20,
>>>       XE_GUC_LOAD_STATUS_LAPIC_DONE                       = 0x30,
>>> @@ -34,4 +41,19 @@ enum xe_guc_load_status {
>>>       XE_GUC_LOAD_STATUS_READY                            = 0xF0,
>>>   };
>>>   +enum xe_bootrom_load_status {
>>> +    XE_BOOTROM_STATUS_NO_KEY_FOUND                      = 0x13,
>>> +    XE_BOOTROM_STATUS_AES_PROD_KEY_FOUND                = 0x1A,
>>> +    XE_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE            = 0x2B,
>>> +    XE_BOOTROM_STATUS_RSA_FAILED                        = 0x50,
>>> +    XE_BOOTROM_STATUS_PAVPC_FAILED                      = 0x73,
>>> +    XE_BOOTROM_STATUS_WOPCM_FAILED                      = 0x74,
>>> +    XE_BOOTROM_STATUS_LOADLOC_FAILED                    = 0x75,
>>> +    XE_BOOTROM_STATUS_JUMP_PASSED                       = 0x76,
>>> +    XE_BOOTROM_STATUS_JUMP_FAILED                       = 0x77,
>>> +    XE_BOOTROM_STATUS_RC6CTXCONFIG_FAILED               = 0x79,
>>> +    XE_BOOTROM_STATUS_MPUMAP_INCORRECT                  = 0x7A,
>>> +    XE_BOOTROM_STATUS_EXCEPTION                         = 0x7E,
>>> +};
>>> +
>>>   #endif
>>> diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h 
>>> b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>>> index 92320bbc9d3d..a30e179e662e 100644
>>> --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>>> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>>> @@ -40,6 +40,8 @@
>>>   #define   GS_BOOTROM_JUMP_PASSED REG_FIELD_PREP(GS_BOOTROM_MASK, 0x76)
>>>   #define   GS_MIA_IN_RESET            REG_BIT(0)
>>>   +#define GUC_HEADER_INFO                XE_REG(0xc014)
>>> +
>>>   #define GUC_WOPCM_SIZE                XE_REG(0xc050)
>>>   #define   GUC_WOPCM_SIZE_MASK            REG_GENMASK(31, 12)
>>>   #define   GUC_WOPCM_SIZE_LOCKED            REG_BIT(0)
>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>> index 868208a39829..82514d395704 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>> @@ -16,6 +16,7 @@
>>>   #include "xe_device.h"
>>>   #include "xe_force_wake.h"
>>>   #include "xe_gt.h"
>>> +#include "xe_gt_freq.h"
>>>   #include "xe_guc_ads.h"
>>>   #include "xe_guc_ct.h"
>>>   #include "xe_guc_hwconfig.h"
>>> @@ -427,58 +428,172 @@ static int guc_xfer_rsa(struct xe_guc *guc)
>>>       return 0;
>>>   }
>>>   +/*
>>> + * Read the GuC status register (GUC_STATUS) and store it in the
>>> + * specified location; then return a boolean indicating whether
>>> + * the value matches either completion or a known failure code.
>>> + *
>>> + * This is used for polling the GuC status in an xe_wait_for()
>>> + * loop below.
>>> + */
>>> +static inline bool guc_load_done(struct xe_gt *gt, u32 *status, bool 
>>> *success)
>>> +{
>>> +    u32 val = xe_mmio_read32(gt, GUC_STATUS);
>>> +    u32 uk_val = REG_FIELD_GET(GS_UKERNEL_MASK, val);
>>> +    u32 br_val = REG_FIELD_GET(GS_BOOTROM_MASK, val);
>>> +
>>> +    *status = val;
>>> +    switch (uk_val) {
>>> +    case XE_GUC_LOAD_STATUS_READY:
>>> +        *success = true;
>>> +        return true;
>>> +
>>> +    case XE_GUC_LOAD_STATUS_ERROR_DEVID_BUILD_MISMATCH:
>>> +    case XE_GUC_LOAD_STATUS_GUC_PREPROD_BUILD_MISMATCH:
>>> +    case XE_GUC_LOAD_STATUS_ERROR_DEVID_INVALID_GUCTYPE:
>>> +    case XE_GUC_LOAD_STATUS_HWCONFIG_ERROR:
>>> +    case XE_GUC_LOAD_STATUS_DPC_ERROR:
>>> +    case XE_GUC_LOAD_STATUS_EXCEPTION:
>>> +    case XE_GUC_LOAD_STATUS_INIT_DATA_INVALID:
>>> +    case XE_GUC_LOAD_STATUS_MPU_DATA_INVALID:
>>> +    case XE_GUC_LOAD_STATUS_INIT_MMIO_SAVE_RESTORE_INVALID:
>>> +        *success = false;
>>> +        return true;
>>> +    }
>>> +
>>> +    switch (br_val) {
>>> +    case XE_BOOTROM_STATUS_NO_KEY_FOUND:
>>> +    case XE_BOOTROM_STATUS_RSA_FAILED:
>>> +    case XE_BOOTROM_STATUS_PAVPC_FAILED:
>>> +    case XE_BOOTROM_STATUS_WOPCM_FAILED:
>>> +    case XE_BOOTROM_STATUS_LOADLOC_FAILED:
>>> +    case XE_BOOTROM_STATUS_JUMP_FAILED:
>>> +    case XE_BOOTROM_STATUS_RC6CTXCONFIG_FAILED:
>>> +    case XE_BOOTROM_STATUS_MPUMAP_INCORRECT:
>>> +    case XE_BOOTROM_STATUS_EXCEPTION:
>>> +    case XE_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE:
>>> +        *success = false;
>>> +        return true;
>>> +    }
>>> +
>>> +    return false;
>>> +}
>>> +
>>> +/*
>>> + * Wait for the GuC to start up.
>>> + *
>>> + * Measurements indicate this should take no more than 20ms 
>>> (assuming the GT
>>> + * clock is at maximum frequency). However, thermal throttling and 
>>> other issues
>>> + * can prevent the clock hitting max and thus making the load take 
>>> significantly
>>> + * longer. Indeed, if the GT is clamped to minimum frequency then 
>>> the load times
>>> + * can be in the seconds range. As, there is a limit on how long an 
>>> individual
>>> + * usleep_range() can wait for, the wait is wrapped in a loop. The 
>>> loop count
>>> + * is increased for debug builds so that problems can be detected 
>>> and analysed.
>>> + * For release builds, the timeout is kept short so that user's 
>>> don't wait
>>> + * forever to find out there is a problem. In either case, if the 
>>> load took longer
>>> + * than is reasonable even with some 'sensible' throttling, then 
>>> flag a warning
>>> + * because something is not right.
>>> + *
>>> + * Note that the only reason an end user should hit the timeout is 
>>> in case of
>>> + * extreme thermal throttling. And a system that is that hot during 
>>> boot is
>>> + * probably dead anyway!
>>> + */
>>> +#if defined(CONFIG_DRM_XE_DEBUG)
>>> +#define GUC_LOAD_RETRY_LIMIT    20
>>> +#else
>>> +#define GUC_LOAD_RETRY_LIMIT    3
>>> +#endif
>>> +#define GUC_LOAD_TIME_WARN      200
>>> +
>>>   static int guc_wait_ucode(struct xe_guc *guc)
>>>   {
>>> -    struct xe_device *xe = guc_to_xe(guc);
>>> +    struct xe_gt *gt = guc_to_gt(guc);
>>> +    struct xe_guc_pc *guc_pc = &gt->uc.guc.pc;
>>> +    ktime_t before, after, delta;
>>> +    bool success;
>>>       u32 status;
>>> -    int ret;
>>> +    int ret, count;
>>> +    u64 delta_ms;
>>> +    u32 before_freq;
>>> +
>>> +    before_freq = xe_guc_pc_get_act_freq(guc_pc);
>>> +    before = ktime_get();
>>> +    for (count = 0; count < GUC_LOAD_RETRY_LIMIT; count++) {
>>> +        ret = xe_wait_for(guc_load_done(gt, &status, &success), 1000 
>>> * 1000);
>>> +        if (!ret || !success)
>>> +            break;
>>> +
>>> +        xe_gt_dbg(gt, "load still in progress, count = %d, freq = 
>>> %dMHz (req %dMHz), status = 0x%08X [0x%02X/%02X]\n",
>>> +              count, xe_guc_pc_get_act_freq(guc_pc),
>>> +              xe_guc_pc_get_act_freq(guc_pc), status,
>> I think this should be current requested frequency xe_guc_pc_get_cur_freq
> No. The point is to report what the actual frequency was to see if that 
> explains why the load is running slowly. The requested frequency is 
> under driver control. That should be at maximum during driver load. The
Is requested freq set to maximum in resume path as well?
> granted frequency is not under driver control. That is the unknown that 
> needs to be reported to see why the system is not working as intended.
Agreed but in the expression "freq = %dMHz (req %dMHz)" actual frequency 
is being printed 2 times. What is significance of "(req %dMHz) here", I 
thought req stands for requested.

Badal
> 
> John.
> 
> 
> 
>>> + REG_FIELD_GET(GS_BOOTROM_MASK, status),
>>> +              REG_FIELD_GET(GS_UKERNEL_MASK, status));
>>> +    }
>>> +    after = ktime_get();
>>> +    delta = ktime_sub(after, before);
>>> +    delta_ms = ktime_to_ms(delta);
>>> +    if (ret || !success) {
>>> +        u32 ukernel = REG_FIELD_GET(GS_UKERNEL_MASK, status);
>>> +        u32 bootrom = REG_FIELD_GET(GS_BOOTROM_MASK, status);
>>> +
>>> +        xe_gt_info(gt, "load failed: status = 0x%08X, time = %lldms, 
>>> freq = %dMHz (req %dMHz), ret = %d\n",
>>> +               status, delta_ms, xe_guc_pc_get_act_freq(guc_pc),
>>> +               xe_guc_pc_get_act_freq(guc_pc), ret);
>> Same as above.
>>
>> Regards,
>> Badal
>>> +        xe_gt_info(gt, "load failed: status: Reset = %d, BootROM = 
>>> 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
>>> +               REG_FIELD_GET(GS_MIA_IN_RESET, status),
>>> +               bootrom, ukernel,
>>> +               REG_FIELD_GET(GS_MIA_MASK, status),
>>> +               REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
>>> +
>>> +        switch (bootrom) {
>>> +        case XE_BOOTROM_STATUS_NO_KEY_FOUND:
>>> +            xe_gt_info(gt, "invalid key requested, header = 0x%08X\n",
>>> +                   xe_mmio_read32(gt, GUC_HEADER_INFO));
>>> +            ret = -ENOEXEC;
>>> +            break;
>>>   -    /*
>>> -     * Wait for the GuC to start up.
>>> -     * NB: Docs recommend not using the interrupt for completion.
>>> -     * Measurements indicate this should take no more than 20ms
>>> -     * (assuming the GT clock is at maximum frequency). So, a
>>> -     * timeout here indicates that the GuC has failed and is unusable.
>>> -     * (Higher levels of the driver may decide to reset the GuC and
>>> -     * attempt the ucode load again if this happens.)
>>> -     *
>>> -     * FIXME: There is a known (but exceedingly unlikely) race 
>>> condition
>>> -     * where the asynchronous frequency management code could reduce
>>> -     * the GT clock while a GuC reload is in progress (during a full
>>> -     * GT reset). A fix is in progress but there are complex locking
>>> -     * issues to be resolved. In the meantime bump the timeout to
>>> -     * 200ms. Even at slowest clock, this should be sufficient. And
>>> -     * in the working case, a larger timeout makes no difference.
>>> -     */
>>> -    ret = xe_mmio_wait32(guc_to_gt(guc), GUC_STATUS, GS_UKERNEL_MASK,
>>> -                 FIELD_PREP(GS_UKERNEL_MASK, XE_GUC_LOAD_STATUS_READY),
>>> -                 200000, &status, false);
>>> +        case XE_BOOTROM_STATUS_RSA_FAILED:
>>> +            xe_gt_info(gt, "firmware signature verification failed\n");
>>> +            ret = -ENOEXEC;
>>> +            break;
>>>   -    if (ret) {
>>> -        struct drm_device *drm = &xe->drm;
>>> -
>>> -        drm_info(drm, "GuC load failed: status = 0x%08X\n", status);
>>> -        drm_info(drm, "GuC load failed: status: Reset = %d, BootROM 
>>> = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
>>> -             REG_FIELD_GET(GS_MIA_IN_RESET, status),
>>> -             REG_FIELD_GET(GS_BOOTROM_MASK, status),
>>> -             REG_FIELD_GET(GS_UKERNEL_MASK, status),
>>> -             REG_FIELD_GET(GS_MIA_MASK, status),
>>> -             REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
>>> -
>>> -        if ((status & GS_BOOTROM_MASK) == GS_BOOTROM_RSA_FAILED) {
>>> -            drm_info(drm, "GuC firmware signature verification 
>>> failed\n");
>>> +        case XE_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE:
>>> +            xe_gt_info(gt, "firmware production part check failure\n");
>>>               ret = -ENOEXEC;
>>> +            break;
>>>           }
>>>   -        if (REG_FIELD_GET(GS_UKERNEL_MASK, status) ==
>>> -            XE_GUC_LOAD_STATUS_EXCEPTION) {
>>> -            drm_info(drm, "GuC firmware exception. EIP: %#x\n",
>>> -                 xe_mmio_read32(guc_to_gt(guc),
>>> -                        SOFT_SCRATCH(13)));
>>> +        switch (ukernel) {
>>> +        case XE_GUC_LOAD_STATUS_EXCEPTION:
>>> +            xe_gt_info(gt, "firmware exception. EIP: %#x\n",
>>> +                   xe_mmio_read32(gt, SOFT_SCRATCH(13)));
>>>               ret = -ENXIO;
>>> +            break;
>>> +
>>> +        case XE_GUC_LOAD_STATUS_INIT_MMIO_SAVE_RESTORE_INVALID:
>>> +            xe_gt_info(gt, "illegal register in save/restore 
>>> workaround list\n");
>>> +            ret = -EPERM;
>>> +            break;
>>> +
>>> +        case XE_GUC_LOAD_STATUS_HWCONFIG_START:
>>> +            xe_gt_info(gt, "still extracting hwconfig table.\n");
>>> +            ret = -ETIMEDOUT;
>>> +            break;
>>>           }
>>> +
>>> +        /* Uncommon/unexpected error, see earlier status code print 
>>> for details */
>>> +        if (ret == 0)
>>> +            ret = -ENXIO;
>>> +    } else if (delta_ms > GUC_LOAD_TIME_WARN) {
>>> +        xe_gt_warn(gt, "excessive init time: %lldms! [status = 
>>> 0x%08X, count = %d, ret = %d]\n",
>>> +               delta_ms, status, count, ret);
>>> +        xe_gt_warn(gt, "excessive init time: [freq = %dMHz, before = 
>>> %dMHz, perf_limit_reasons = 0x%08X]\n",
>>> +               xe_guc_pc_get_act_freq(guc_pc), before_freq,
>>> +               xe_read_perf_limit_reasons(gt));
>>>       } else {
>>> -        drm_dbg(&xe->drm, "GuC successfully loaded");
>>> +        xe_gt_dbg(gt, "init took %lldms, freq = %dMHz, before = 
>>> %dMHz, status = 0x%08X, count = %d, ret = %d\n",
>>> +              delta_ms, xe_guc_pc_get_act_freq(guc_pc),
>>> +              before_freq, status, count, ret);
>>>       }
>>>         return ret;
>>> diff --git a/drivers/gpu/drm/xe/xe_macros.h 
>>> b/drivers/gpu/drm/xe/xe_macros.h
>>> index daf56c846d03..eac8f2c9fba5 100644
>>> --- a/drivers/gpu/drm/xe/xe_macros.h
>>> +++ b/drivers/gpu/drm/xe/xe_macros.h
>>> @@ -15,4 +15,36 @@
>>>                   "Ioctl argument check failed at %s:%d: %s", \
>>>                   __FILE__, __LINE__, #cond), 1))
>>>   +/*
>>> + * xe_wait_for - magic wait macro
>>> + *
>>> + * Macro to help avoid open coding check/wait/timeout patterns. Note 
>>> that it's
>>> + * important that we check the condition again after having timed 
>>> out, since the
>>> + * timeout could be due to preemption or similar and we've never had 
>>> a chance to
>>> + * check the condition before the timeout.
>>> + */
>>> +#define xe_wait_for(COND, US) ({ \
>>> +    const ktime_t end__ = ktime_add_ns(ktime_get_raw(), 1000ll * 
>>> (US)); \
>>> +    long wait__ = 10; /* recommended min for usleep is 10 us */    \
>>> +    int ret__;                            \
>>> +    might_sleep();                            \
>>> +    for (;;) {                            \
>>> +        const bool expired__ = ktime_after(ktime_get_raw(), end__); \
>>> +        /* Guarantee COND check prior to timeout */        \
>>> +        barrier();                        \
>>> +        if (COND) {                        \
>>> +            ret__ = 0;                    \
>>> +            break;                        \
>>> +        }                            \
>>> +        if (expired__) {                    \
>>> +            ret__ = -ETIMEDOUT;                \
>>> +            break;                        \
>>> +        }                            \
>>> +        usleep_range(wait__, wait__ * 2);            \
>>> +        if (wait__ < (1000))                    \
>>> +            wait__ <<= 1;                    \
>>> +    }                                \
>>> +    ret__;                                \
>>> +})
>>> +
>>>   #endif
> 

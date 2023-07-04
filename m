Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A03C001B0
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jul 2023 15:30:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50C2010E2D0;
	Tue,  4 Jul 2023 15:30:10 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40F6D10E2D0
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jul 2023 15:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688484608; x=1720020608;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WOh+/MsDFKa2xMljcLiFKCcLCguAtfBpN4w9WTGKOxY=;
 b=IZ+gxx7fdljk5JcBWhTSW7M5Z3fiAi4qESTn6d/1P1UbVS1yUFQQoLyj
 jU1lJmiTp+cfcP/gIRyQtpwE9iTNUdRM9qjznuZhOQ/vJyOXkeaWDNC/H
 cD4OTjta5uppSQ8eGuf5Wyn9VTxU31Qa72Fc/zZEjoWhnSQh/XccJ3hDS
 jikq4Cg7olgjnDIS4XX/QRcA3/vcoXZ2k/wQkhqg/YKw3olh0ELqnDLFl
 1qJFdo59zu2qoKZLPP+2PAPgXxUPLruD3xKBNly10KJszYzxaVq5EeLOn
 l3qtncVxCqLbXi/gBT2YVWfdaVMc+vbJpWYtZHIkbzmR/4rzZ/wslqzSN w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="360622850"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; d="scan'208";a="360622850"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 08:30:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="669127482"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; d="scan'208";a="669127482"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 04 Jul 2023 08:30:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 4 Jul 2023 08:30:06 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 4 Jul 2023 08:30:06 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 4 Jul 2023 08:30:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TaXXa4GnYaym/4+gH18FG2KUb9sy+j46vXzGtmRDNH+70deVfJh2gYoGr+QOLgEj4cg1NxArePKmOlZiR2qSnnZ3Z8Kl2JTXP2xCskwQNYFmaZU/LtimqpwJ8RmbtxDKIZGp9eVnz5aYskEWYq3uvLugk1eHheywPiN9b77+iRD0isHY7FsBczmscx5CheImUjNBRuPnHp2iZp/B5G9Gw6GYgZZfF3Z4bltPOQw/cXPXfIReDj3LyRgMorhzzt3azIUs+23uL6nFhMRdlOlNe6qeRb3t6Y7r+cqmOOlZT36WglAnoJODXUVwX7Xyuv0NkADkMXDoOuugriT/A61/Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A2x8l610P6pjp/naiLBZU5iT/1DoV3d3qt5u24XrPm8=;
 b=LZgZRtUJij04tYdHWquGdZy0ZbpAJe/knS8fPTd6gc1TxugFOGkbj2rs9DLWOVbxNc4mtFPFjs17VWfBNSXxdlfw3Z6UENbqbaDbXyrnDGEC0kHAB2mYQT1rTooztszWeHtsE8SriFcpmGS3U5HhuyKEWwhYbN9h5A+GQAUYH6Ej/zY1wtNnvwx4cXAmasPBkSQvqIXdEmNcK445jYdGXwiaiwa2222K5thtUSQZ7iTupaVGE/AuVDq9iK8MNislP5j0EVmTT9ZTruMu5lQDapUSr1Pcjhj3vUOe3KQjmZlIrU4M0XHgx7m8q12yMVB0AGKVRTYR29BswwvaazL3zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by MW4PR11MB6740.namprd11.prod.outlook.com (2603:10b6:303:209::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Tue, 4 Jul
 2023 15:30:04 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::347c:9286:96c4:cf61]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::347c:9286:96c4:cf61%6]) with mapi id 15.20.6565.016; Tue, 4 Jul 2023
 15:30:04 +0000
Message-ID: <69fb61e4-49e6-9809-6e9a-ee8a3f398959@intel.com>
Date: Tue, 4 Jul 2023 20:59:52 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.12.0
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230626105037.43780-15-matthew.auld@intel.com>
 <20230626105037.43780-16-matthew.auld@intel.com>
 <ea61756e-0dec-244e-d47e-0fe199061686@intel.com>
 <60fe1fd9-b9f8-3196-c43e-cace0c397f1b@intel.com>
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
In-Reply-To: <60fe1fd9-b9f8-3196-c43e-cace0c397f1b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0233.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::12) To CY5PR11MB6211.namprd11.prod.outlook.com
 (2603:10b6:930:25::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6211:EE_|MW4PR11MB6740:EE_
X-MS-Office365-Filtering-Correlation-Id: c07dafa4-22f8-4a8d-42fb-08db7ca389ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eaFYr9VGZsQkr/Wuo3m7VDCMruD12CUK8R5yF3NEn7OkGDagusLPNsIjnt4Y+HhQCK5/R/dPUBMvOfOZpcwBCBkQQLcAlLmzM13LFxxk4XIqIOmDYcgrDunKjexaFhvcaEOoYhhXnFo4j+4Y253+H9kjwRlShx8ncoEsS4LUbOmMKZcSIL1ptZYYIPQXnWVBZ28vV6sDV6dj6fcbfXuhO+cxgindXlrHdxrvzgnl+YYZGzVxFEOXjOUx7Nlw1YBJw+3xBURQ8NKXcD/myXBFhs4epLnMptZP6L/Bvu4IU5pVDOleY9vYp8XSiozhCvOPStDWgaxRdy20VO7LXOprqp1MHJToZl98ODUKBKDQ9j0u+DyYz4ep3Akr0lFWNjVqZC71jjTC/P5dYze1b/KPIwbmD9V3DBDNdbWMwFdDdDIq42D9YJ5oCK9wkqGv5eQv//FKcmFhzdKj2ujn43wtet2pJvVhlgPvsRB0yAvY+c+dO5B4Oa/owk+CaB7si2RpOPLPxFLJokpTEY01UJnj4Y3zmkAjObtNDZR1GfAd+qXThF+a/cVt1g5MvRTCkfiSUgOmaA/g3qtRIe7ir0ULN4iK3K34pHocQAUYK/EG5JZwPVZlfBOy/Wg/Is6dJzZLBQsQNFzFT8GbUUh75a/hZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(346002)(136003)(396003)(39860400002)(451199021)(31686004)(66899021)(2616005)(186003)(82960400001)(38100700002)(6666004)(31696002)(966005)(66946007)(6512007)(6486002)(86362001)(2906002)(36756003)(66556008)(66476007)(316002)(4326008)(478600001)(54906003)(26005)(53546011)(6506007)(83380400001)(41300700001)(5660300002)(30864003)(8676002)(8936002)(66574015)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1NWd2I3ZkdLYUtRbk55VFFCY0lxTmJNVjFQcnJPTTc1WFJxNXVWU0k3dlkx?=
 =?utf-8?B?bTBEb24rSzl3dElsQnZucndMdHNHSThvRitzVFZoWmVXTDg1NkFyM3UzRGVT?=
 =?utf-8?B?T1YvdG5LVWp5Q2g4U1lCb3RaM05IdEg4Zm4rbHJGODlGUEFLU3VTV1krWlZM?=
 =?utf-8?B?bHFyRzJFT0plUkpBczQ4ZEtxSEdISDIxWi9wVGVKam85WXFiYWQrWDBOWEhD?=
 =?utf-8?B?dlRtbEw5VGlCb2tiNGJSUDgyY3RjaVpqTUsxak1BN1ZEV2JWVHFiaDB4M2p0?=
 =?utf-8?B?YlJtbDNGMVNVSExsNEdkNWZBOWJkblhESUJCRU85QXV1VmFRaCt3ekczV3VH?=
 =?utf-8?B?MFlXRG9EQ3ArbnVtdS8vZWxkdlk4Vk9hNTVSRnZNOXRpb1JZVkxzcHpjM3Rw?=
 =?utf-8?B?bnRMZEY4RS90Vk1qVzFCclRNZ0lYcXd4b1NDUUp0T2hQZHBqdkRkbEZ6Ykhk?=
 =?utf-8?B?c3hTdHRXVCtPd2hHWGVra3o1YmZ0MHdTYTFZOFdlMXRxeW52UmV4TzJBN3h1?=
 =?utf-8?B?cy9YcVhvWGZPMUY4ZVRKQkEwVENXRjFrY2t0SVVXaDZQSkNhT3JBNmxZRVQv?=
 =?utf-8?B?czIyQVFENnZNOEhncUx1MXV6TTF1VVkyeU5HWnc0eUhsTDBZM251WGVkVklw?=
 =?utf-8?B?d2Vja21TWWZCdU1LK0pmL2JheXY4elNvYlBDa3VFWGpLUFRYTHNEb1Fuc1cx?=
 =?utf-8?B?WHVrZitJYXRONkxWcURhb3UxRUFpbDVNZ0dPUFhROElZUjhBcFhDRVczS2VX?=
 =?utf-8?B?ZkM0U1pyZ3RadlNlYUdRSm5sejdycUlTTWFUbnR0ZzlCcUxoQm5KOE1abVJ5?=
 =?utf-8?B?SnRHdDZHMlAxdUhYcUp5aEx6V2lQRUFCbjNLNUtVbklYbTRLU25ZaksvNVBk?=
 =?utf-8?B?ZWFLVDU5NzJ4eG5RczJwSE5YdGZadVZramVxU0UxWUpGeEZTd1BhNVZwWVk0?=
 =?utf-8?B?VlFnMC9YT1FlOHpXVDlCRU16bDlUMXAycHBodHF1UzdibGY3aXBDN05JKzR1?=
 =?utf-8?B?Yis3bWV1azJ0TVNqenkvUkVVbTlxK01lSkVtYWtQOU5MRUIzd2N0SFB2Y2t1?=
 =?utf-8?B?NWoyMVMwVW1BVTJRNHZMUmxyWVBTQklnY2VVNG8xSEx6WmxCV1BZZ3dNZzVs?=
 =?utf-8?B?Z3hoTnlqOXZmeENFcmR2S1lIVzBaVXlieC9rcHBxR29BUmJCNEwrdWdFb2ly?=
 =?utf-8?B?cFBIdy9UOW5iQXZyZ2dCc0pJZ0wrU3NmVnVOUTBXWTF2MmYyUFJNT2tFSzlC?=
 =?utf-8?B?MWx1a2JEa3lWVVl1MGRZV0JhSWhuT1A1U0hkK2xmeURpWHk3dGJDNFZsb05w?=
 =?utf-8?B?RG0xdUdVczBSSlQ5cmQyTDRsc1N0Z1NWRkdjVVZNRisxbzVxWmFhNEFEdU5z?=
 =?utf-8?B?SXZkTjVWNDdEVUhTUkcxMUVnTDdRR1dkYXBteTRXbWxRSisydWJFMnFxYnBS?=
 =?utf-8?B?aDBUTW0wZ2JTNGdQc1dTY0MxRnJsM3NweWkrL0tVWGxmVXVOQjA3OXZ3cFRp?=
 =?utf-8?B?eXUwMlI3ZG5sWEFGeHJLSm1ERTFkSWxDOU9oTUtOMC9mdlFRK2JlclZ0Q2VL?=
 =?utf-8?B?R1hGMmJRRjFzT2plc1NoMlpvWVVZcHIzWE5zL2dNZit5QnN5Z1A5TzNkSmM3?=
 =?utf-8?B?T3YzN1BhTjkwZjU2Z1hLUm8wVGx0TkVBUm13QnArU3huTENQK2NtM0E0OWg0?=
 =?utf-8?B?SS9HK2RJL0k1eXIrdlNDQVNqTnRrcnpzbDZmUXQxTWN0b0lwbDRUOVdETHFB?=
 =?utf-8?B?RVlCaWY3YU1TSy94MUZlSWtCZHk1OHJvdEdjVFVnaTZVaVBxOUk1ZjJVd1ZM?=
 =?utf-8?B?OWdZbEs0YUpEeVk4d0FKNCt0WG1OQWhGNFh4Q1haVmwyZVBSSkNLUHRQL3ZR?=
 =?utf-8?B?eHZRMnhRMlFSRmdjUk5yNElldFFPY0VWbjhUWG4wRHdTblFxb1FJMkM0N0h6?=
 =?utf-8?B?ajUrcE1CMUc1SEEyaU41ZEtQcjUrUE5RdGVYNzUyN2ZoZFE3QXJCR3ZDaGdu?=
 =?utf-8?B?S2t1N2o1SUZFNlNHTzQvb2s2NmNOTXMveHdEdHlscHdxUUcvd29aY1h0d2tu?=
 =?utf-8?B?eTFQTktEMXZVUTRNYWhBRm0vQ3Z0QnF2SEFVUWpRUzRBWmIxZDJMaGhsSkpL?=
 =?utf-8?B?RTF6UUpqazkzNGNpejAwc1EzdXFCUjJ5ZkFWMkM5YnlMLzI4cGRUSU5vN1hX?=
 =?utf-8?B?Vnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c07dafa4-22f8-4a8d-42fb-08db7ca389ac
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 15:30:03.8772 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QcUJuQJxj08rpA4xuXRkn1oBMwz9XBLCCDjIRBUq8+0HeCwkUo6cnH2qQnV9jQE0wGQPp9mIexDcxyfmB+NdKXy2uLDDFVUSUCFmq5nwb7A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6740
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v12 01/13] drm/xe: fix
 xe_device_mem_access_get() races
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 7/4/2023 4:55 PM, Matthew Auld wrote:
> On 30/06/2023 16:22, Gupta, Anshuman wrote:
>>
>>
>> On 6/26/2023 4:20 PM, Matthew Auld wrote:
>>> It looks like there is at least one race here, given that the
>>> pm_runtime_suspended() check looks to return false if we are in the
>>> process of suspending the device (RPM_SUSPENDING vs RPM_SUSPENDED).  We
>>> later also do xe_pm_runtime_get_if_active(), but since the device is
>>> suspending or has now suspended, this doesn't do anything either.
>>> Following from this we can potentially return from
>>> xe_device_mem_access_get() with the device suspended or about to be,
>>> leading to broken behaviour.
>>>
>>> Attempt to fix this by always grabbing the runtime ref when our internal
>>> ref transitions from 0 -> 1. The hard part is then dealing with the
>>> runtime_pm callbacks also calling xe_device_mem_access_get() and
>>> deadlocking, which the pm_runtime_suspended() check prevented.
>>>
>>> v2:
>>>   - ct->lock looks to be primed with fs_reclaim, so holding that and 
>>> then
>>>     allocating memory will cause lockdep to complain. Now that we
>>>     unconditionally grab the mem_access.lock around 
>>> mem_access_{get,put}, we
>>>     need to change the ordering wrt to grabbing the ct->lock, since 
>>> some of
>>>     the runtime_pm routines can allocate memory (or at least that's what
>>>     lockdep seems to suggest). Hopefully not a big deal.  It might be 
>>> that
>>>     there were already issues with this, just that the atomics where
>>>     "hiding" the potential issues.
>>> v3:
>>>   - Use Thomas Hellström' idea with tracking the active task that is
>>>     executing in the resume or suspend callback, in order to avoid
>>>     recursive resume/suspend calls deadlocking on itself.
>>>   - Split the ct->lock change.
>>> v4:
>>>   - Add smb_mb() around accessing the pm_callback_task for extra safety.
>>>     (Thomas Hellström)
>>> v5:
>>>   - Clarify the kernel-doc for the mem_access.lock, given that it is 
>>> quite
>>>     strange in what it protects (data vs code). The real motivation 
>>> is to
>>>     aid lockdep. (Rodrigo Vivi)
>>> v6:
>>>   - Split out the lock change. We still want this as a lockdep aid but
>>>     only for the xe_device_mem_access_get() path. Sticking a lock on the
>>>     put() looks be a no-go, also the runtime_put() there is always 
>>> async.
>>>   - Now that the lock is gone move to atomics and rely on the pm code
>>>     serialising multiple callers on the 0 -> 1 transition.
>>>   - g2h_worker_func() looks to be the next issue, given that
>>>     suspend-resume callbacks are using CT, so try to handle that.
>>> v7:
>>>   - Add xe_device_mem_access_get_if_ongoing(), and use it in
>>>     g2h_worker_func().
>>>
>>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/258
>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_device.c       | 58 +++++++++++++++++++-----
>>>   drivers/gpu/drm/xe/xe_device.h       | 12 ++---
>>>   drivers/gpu/drm/xe/xe_device_types.h |  6 +++
>>>   drivers/gpu/drm/xe/xe_guc_ct.c       | 34 +++++++++++++-
>>>   drivers/gpu/drm/xe/xe_pm.c           | 66 +++++++++++++++++++---------
>>>   drivers/gpu/drm/xe/xe_pm.h           |  3 +-
>>>   6 files changed, 134 insertions(+), 45 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_device.c 
>>> b/drivers/gpu/drm/xe/xe_device.c
>>> index c7985af85a53..1dc552da434f 100644
>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>> @@ -411,27 +411,61 @@ u32 xe_device_ccs_bytes(struct xe_device *xe, 
>>> u64 size)
>>>           DIV_ROUND_UP(size, NUM_BYTES_PER_CCS_BYTE) : 0;
>>>   }
>>> +bool xe_device_mem_access_ongoing(struct xe_device *xe)
>>> +{
>>> +    if (xe_pm_read_callback_task(xe) != NULL)
>>> +        return true;
>>> +
>>> +    return atomic_read(&xe->mem_access.ref);
>>> +}
>>> +
>>> +void xe_device_assert_mem_access(struct xe_device *xe)
>>> +{
>>> +    XE_WARN_ON(!xe_device_mem_access_ongoing(xe));
>>> +}
>>> +
>>> +bool xe_device_mem_access_get_if_ongoing(struct xe_device *xe)
>>> +{
>>> +    return atomic_inc_not_zero(&xe->mem_access.ref);
>>> +}
>>> +
>>>   void xe_device_mem_access_get(struct xe_device *xe)
>>>   {
>>> -    bool resumed = xe_pm_runtime_resume_if_suspended(xe);
>>> -    int ref = atomic_inc_return(&xe->mem_access.ref);
>>> +    /*
>>> +     * This looks racy, but should be fine since the 
>>> pm_callback_task only
>>> +     * transitions from NULL -> current (and back to NULL again), 
>>> during the
>>> +     * runtime_resume() or runtime_suspend() callbacks, for which 
>>> there can
>>> +     * only be a single one running for our device. We only need to 
>>> prevent
>>> +     * recursively calling the runtime_get or runtime_put from those
>>> +     * callbacks, as well as preventing triggering any access_ongoing
>>> +     * asserts.
>>> +     */
>> two runtime_suspend() can run in parallel for two different pci device 
>> those worker thread pooled by pm_wq workqueue, it is not guaranteed 
>> that tast_struct will be different for two worker spawned by same pm_wq ?
> 
> IIUC we only use pm_wq for the async put(). If somehow tast_struct can 
> be the same for different workers when using pm_wq (I'm not sure tbh), 
> then I think it's fine since all put() must be balanced with a get(), 
> and all get() are handled directly in the caller (not pm_wq) since it's 
> non-async, and must first wait for any running callback.
Agree with that.
> 
>>
>>> +    if (xe_pm_read_callback_task(xe) == current)
>>> +        return;
>>> -    if (ref == 1)
>>> -        xe->mem_access.hold_rpm = xe_pm_runtime_get_if_active(xe);
>>> +    if (!atomic_inc_not_zero(&xe->mem_access.ref)) {
>>> +        bool hold_rpm = xe_pm_runtime_resume_and_get(xe);
>>> +        int ref;
>>> -    /* The usage counter increased if device was immediately resumed */
>>> -    if (resumed)
>>> -        xe_pm_runtime_put(xe);
>>> -
>>> -    XE_WARN_ON(ref == S32_MAX);
>>> +        ref = atomic_inc_return(&xe->mem_access.ref);
>>> +        if (ref == 1)
>>> +            xe->mem_access.hold_rpm = hold_rpm;
>>> +        else
>>> +            xe_pm_runtime_put(xe);
AFAIU above is not possible ?
>>> +    } else {
>>> +        XE_WARN_ON(atomic_read(&xe->mem_access.ref) == S32_MAX);
>>> +    }
>>>   }
>>>   void xe_device_mem_access_put(struct xe_device *xe)
>>>   {
>>> -    bool hold = xe->mem_access.hold_rpm;
>>> -    int ref = atomic_dec_return(&xe->mem_access.ref);
>>> +    int ref;
>>> -    if (!ref && hold)
>>> +    if (xe_pm_read_callback_task(xe) == current)
>>> +        return;
>>> +
>>> +    ref = atomic_dec_return(&xe->mem_access.ref);
>>> +    if (ref == 0 && xe->mem_access.hold_rpm)
>>>           xe_pm_runtime_put(xe);
>>>       XE_WARN_ON(ref < 0);
>> /snip
>>> +
>>>   int xe_pm_runtime_suspend(struct xe_device *xe)
>>>   {
>>>       struct xe_gt *gt;
>>>       u8 id;
>>> -    int err;
>>> +    int err = 0;
>>> +
>>> +    if (xe->d3cold_allowed && xe_device_mem_access_ongoing(xe))
>>> +        return -EBUSY;
>> Not related to this patch but We should return -EBUSY even for d3hot 
>> as well.
> 
> Looking at this again, access_ongoing is always going to be false here, 
> right? On the 0 -> 1 transition we always do full sync pm get before 
> increment mem_access.ref, so not sure if this check actually does anything.
I belive this is paranoid check against any unbalanced put.
Br,
Anshuman Gupta.
> 
>> Br,
>> Anshuman Gupta
>>> +
>>> +    /* Disable access_ongoing asserts and prevent recursive pm calls */
>>> +    xe_pm_write_callback_task(xe, current);
>>>       if (xe->d3cold_allowed) {
>>> -        if (xe_device_mem_access_ongoing(xe))
>>> -            return -EBUSY;
>>> -
>>>           err = xe_bo_evict_all(xe);
>>>           if (err)
>>> -            return err;
>>> +            goto out;
>>>       }
>>>       for_each_gt(gt, xe, id) {
>>>           err = xe_gt_suspend(gt);
>>>           if (err)
>>> -            return err;
>>> +            goto out;
>>>       }
>>>       xe_irq_suspend(xe);
>>> -
>>> -    return 0;
>>> +out:
>>> +    xe_pm_write_callback_task(xe, NULL);
>>> +    return err;
>>>   }
>>>   int xe_pm_runtime_resume(struct xe_device *xe)
>>>   {
>>>       struct xe_gt *gt;
>>>       u8 id;
>>> -    int err;
>>> +    int err = 0;
>>> +
>>> +    /* Disable access_ongoing asserts and prevent recursive pm calls */
>>> +    xe_pm_write_callback_task(xe, current);
>>>       if (xe->d3cold_allowed) {
>>>           for_each_gt(gt, xe, id) {
>>>               err = xe_pcode_init(gt);
>>>               if (err)
>>> -                return err;
>>> +                goto out;
>>>           }
>>>           /*
>>> @@ -182,7 +210,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>>>            */
>>>           err = xe_bo_restore_kernel(xe);
>>>           if (err)
>>> -            return err;
>>> +            goto out;
>>>       }
>>>       xe_irq_resume(xe);
>>> @@ -193,10 +221,11 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>>>       if (xe->d3cold_allowed) {
>>>           err = xe_bo_restore_user(xe);
>>>           if (err)
>>> -            return err;
>>> +            goto out;
>>>       }
>>> -
>>> -    return 0;
>>> +out:
>>> +    xe_pm_write_callback_task(xe, NULL);
>>> +    return err;
>>>   }
>>>   int xe_pm_runtime_get(struct xe_device *xe)
>>> @@ -210,14 +239,9 @@ int xe_pm_runtime_put(struct xe_device *xe)
>>>       return pm_runtime_put_autosuspend(xe->drm.dev);
>>>   }
>>> -/* Return true if resume operation happened and usage count was 
>>> increased */
>>> -bool xe_pm_runtime_resume_if_suspended(struct xe_device *xe)
>>> +bool xe_pm_runtime_resume_and_get(struct xe_device *xe)
>>>   {
>>> -    /* In case we are suspended we need to immediately wake up */
>>> -    if (pm_runtime_suspended(xe->drm.dev))
>>> -        return !pm_runtime_resume_and_get(xe->drm.dev);
>>> -
>>> -    return false;
>>> +    return !pm_runtime_resume_and_get(xe->drm.dev);
>>>   }
>>>   int xe_pm_runtime_get_if_active(struct xe_device *xe)
>>> diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
>>> index 6a885585f653..e92c508d44b9 100644
>>> --- a/drivers/gpu/drm/xe/xe_pm.h
>>> +++ b/drivers/gpu/drm/xe/xe_pm.h
>>> @@ -19,7 +19,8 @@ int xe_pm_runtime_suspend(struct xe_device *xe);
>>>   int xe_pm_runtime_resume(struct xe_device *xe);
>>>   int xe_pm_runtime_get(struct xe_device *xe);
>>>   int xe_pm_runtime_put(struct xe_device *xe);
>>> -bool xe_pm_runtime_resume_if_suspended(struct xe_device *xe);
>>> +bool xe_pm_runtime_resume_and_get(struct xe_device *xe);
>>>   int xe_pm_runtime_get_if_active(struct xe_device *xe);
>>> +struct task_struct *xe_pm_read_callback_task(struct xe_device *xe);
>>>   #endif

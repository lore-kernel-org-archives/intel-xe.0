Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C6A2C197A0
	for <intel-xe@archiver.kernel.org>; Fri, 17 Nov 2023 14:37:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D904F10E143;
	Fri, 17 Nov 2023 14:37:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FC3F10E143
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Nov 2023 14:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700231864; x=1731767864;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Kn8fudKJDsX+S5S1NVMzOIu+hLGW0FA1vMBdcvfE5QE=;
 b=YuBHYzpsngrcuShOg4Lt+a8j/vBlfUN7atkDCLjXtvUNIp3aUD63ojrI
 MtUGE+ZPCCFFGZ9MYFErCBurBij2JjnxXuElviRtzrPcU8W6lh8W3FyJC
 FB/8ISj7uzLmw/Jr03cZpRW1pMAm8Iv6ZZGWLmHsetLgTbMLY3ok1jMJm
 LUX1sQt7rTUudZcuy5PhP24lQYjqsZXesLy1/wrOnpWaR1963lucJilC0
 /8JF86hyk9dpt3I1S5YDIfgCggkRcNfU0TdAjQiazGU9gXOocTJGSqTcU
 Md/Gjt2w+6iO7YbaA8rcD3w7Nu2mrzlQ4SQW1r6oVbSwXRD1wi4V+ALR8 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="376355947"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="376355947"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 06:37:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="769238316"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="769238316"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Nov 2023 06:37:43 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 17 Nov 2023 06:37:42 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 17 Nov 2023 06:37:42 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 17 Nov 2023 06:37:42 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 17 Nov 2023 06:37:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ahl826A20qpb1aUT+br2b6MMZFBx8+UKEoypENAKcLq7LCxf0PFVIabnyvmuj3TfJ4NZjVAvYoeyvZGH+0qFLM4xhyUaDhHq54svrq+2EoToOT4HZrf63i0yQjCjlGsBPNX27IXg6lsuixmPLBe3kEnDKNCQbwKj1cy5BPVGthbwmXhXdTg2nYXspHZKJO7AvNVfEKkDf65ymm7JXS4efIvWWpQpLRLOhdLLdZ32ej6CytY6n/7/Ax5CtLV1TjIQzec3l1htJvYl8JX2XmwCGP5wttMEEEihGpg3L9DQbBacmfidxysd6qg8qj9+GV6jJ9xAGHmeEIWf6E4mfC5L5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QFHWYhirXIoeSHTNRolJr+kgdfpnz77Sznr3mfOhVnk=;
 b=dtwdj9cuNpHcBIeT1rQSu9ZkHFAxydYWng7eKMiBnn+RZeXvIvutbQ7dCkDPoJi0xSrVg1jJ2QFTZVUyeX2wqNzsdGLxhoTTaYPKwdcYQo7yzmMgEgV0yrgPr/EW2umohg9Jq/qjGe7RyEg2BKC6G/vJTogBrEHcBKrdWHHkHFtHBGFynBTxT75lk+gf33vDSb8TAtGHYgy/e75eog8ZMEZ8KxCe3De3ckntu9hBeqMWZbfMufgkWY747ApjRK7o02n7jsMlpDO1psL/renuaVh7nDwIXiYI7lEyGyt977JqP8y2QA4tg5DEfkDafZlXcCMeMa4ankAG9g33M3iidw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH0PR11MB5609.namprd11.prod.outlook.com (2603:10b6:510:e0::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.31; Fri, 17 Nov 2023 14:37:40 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::67f:6c6a:220a:db2f]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::67f:6c6a:220a:db2f%5]) with mapi id 15.20.7002.022; Fri, 17 Nov 2023
 14:37:40 +0000
Message-ID: <debba210-4c32-44e6-8168-5bbe4f81daf2@intel.com>
Date: Fri, 17 Nov 2023 20:07:33 +0530
User-Agent: Mozilla Thunderbird
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231117092252.2413647-1-riana.tauro@intel.com>
 <c475654b-8863-70ed-aea8-ce4765ef9c26@linux.intel.com>
 <12c38f24-0521-9014-954d-41bdeba83075@linux.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <12c38f24-0521-9014-954d-41bdeba83075@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0117.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::32) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH0PR11MB5609:EE_
X-MS-Office365-Filtering-Correlation-Id: 72d29eb8-8c8d-43c5-ccd8-08dbe77ac01b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k9z6h/it1oSY4OQTVYrKaVQ/iKwhYB9N/zvt2hH3CkMSzLXpPBExvKfnEolCYRrtaqEMeo9VSXjd+C/YM1hzLvIqfyUAVPK6L3DXSXoa41BxInpUWM3QovGQ42/MamItxJVhQ5FH+wrvV73s6FoNs/tC2L7NUAPle08OnhQ2rrziDR5AjvNMqSCxQa+ucfXGiTxYSayEs//CHUFs1q8vHNbgnRKr8uM6N5aY8onc6tiPWhxR2XRy3VHBBH92sv9xMxXHEodl4xwNmThsq3rGfSWd06kzSKgBg81GknIGtcYsRZNwXsK1AWIKwCpAiGA9IsDSqA2UB2lJuYFIhrgAnru7ZTaJVHM8xXaGLpVFil8HHRy7cGyLJy3VuD+LJuQCipFM2u9NU4qj/GHo0+4V5mf69dByHFOXtulrSqkjLmMyEXIx507b8jTPhZ2gykVym0unEfrD61OWGs7kFmJRP7u23+u0RVyv4sM7R8sIqq6iZxxqN2PNNaYcN1uoPtPBnPzyplYih20/C2tzIPoDcTENEZjIAmywsXLbLSXcHdBfHSmFP/hEsfkrh7IpaAENXtluW5MDptc/gsl+UicZgqbeqgWZESTvSUE7ohZ4Vg1hZkRjl3ieQtnlGIJddiHQBYEe5v8RR8n50ck34KYS8Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(346002)(136003)(39860400002)(376002)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(66476007)(2616005)(6666004)(6506007)(53546011)(83380400001)(41300700001)(6512007)(478600001)(8676002)(44832011)(5660300002)(2906002)(26005)(8936002)(6486002)(316002)(66556008)(36756003)(66946007)(86362001)(31696002)(38100700002)(82960400001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzA2dlBueWJtNHVOTjZ3cVJ4ZjhHc2VmSlpuNHRFZGFkV0NvY0JERVRiOTVY?=
 =?utf-8?B?SXBCVHVaZldzSUd0Y3lMZmdPYk9LZzJJNWpqd2pCSnBFQWYvVUZMeEt5QzFv?=
 =?utf-8?B?Q0p2RjduOVdodmFzbS94UTZxaU9TaVNZUmlwdndCV0JtSUlERU5GOExuQU9T?=
 =?utf-8?B?RHlHd1pCRDVNeGk3V2lGaVBxR2wzRElNL2x6bDdXYjZrTlU1N3BmQjEyaURT?=
 =?utf-8?B?NkUwUEhMdlZvRkFPVmJQaEpVMUR4bkl5WWRzakdoa21VRDNCbW5Hc2xMZk1K?=
 =?utf-8?B?OTlSM3YvZi9GTDJ5ZTcyVDQ1R3RveG9rbjFEbzJYMGk5YTlSYzI2eStPTFFU?=
 =?utf-8?B?d1N1UzFjRTVyQ1dsNG9TUyt3cFp4UzM0M0JlV2l6RWp1OFBPMDlOVlV0TFpo?=
 =?utf-8?B?cXgxZnFCcnNKVC9qdTlCdUN2UWlIaVFFbi93U2lldlJsVnBWd25FQzA2QUdI?=
 =?utf-8?B?UWVvM3Z3OFg4Um1qUVM5TEo2bjRURE8rTWxwVkhFUy83TXlSTDVBcTExcEYr?=
 =?utf-8?B?RS91R28vNnVxcFFLNlBwY3Fibll3a3VDNUZlMEoweXVnWW1icndRTkU0bDQ2?=
 =?utf-8?B?T2VlcTJEOEhsbHE0RUdiU09uLzRpZ0I5bkVDa0QrbXVCTnNXTmRuTmdMTUQ3?=
 =?utf-8?B?bHZjNzVPNUU3aklHRHpIYVJOeU51YjZrNjMxK282dXV0K0ZiN2U1dlkxR3cw?=
 =?utf-8?B?WVRaaWZwVzVMNUE1MmtaVDA2MzdPR3lDNTE0OVZFQzBsU0drN3psMDJoVDF5?=
 =?utf-8?B?aUFnT2g3VnJoaUh0Ymg2UFVEMWFzRjBMZjBGcnpPTFpaaGY0TzhNazdXZlA1?=
 =?utf-8?B?K2k0R1lVcmd2dHBFdElHNmkwKzd3ektHZlQ5bC84czNBdmxUUHVWK1VQaUVJ?=
 =?utf-8?B?UmN6Y1JiZlc3OERaR2R5dkMyQnorVmcvbmwxQXhHTFRoK21Dd2JnK2s2N3RV?=
 =?utf-8?B?ZldpUjllRk9tM053TlBEWjc5QUFVbnZRVmJTbmdCeVEzZEw0VUNzSXVlQW8y?=
 =?utf-8?B?cFhYSjg1dndBLyt5SUZVRVQyWm9oMlp1VURhU3EzWEJ6RTBwQkIwWnRKNDAv?=
 =?utf-8?B?T29ZY2xVbVpNYWwrZGlpRzNENUZ3aXlxSFl6TGpkd0xRWHRoTUdEVENIOVV1?=
 =?utf-8?B?cDFXSU41Zkg1Y0JlTnN1bFJoZTBjQlp2ZkZlOVB6RStKclFkWURCb0ZvQkxs?=
 =?utf-8?B?WExCR252QldQRjdtb1IxV2hLckdXRkpJaElKMlppR0RkeHkxSmtUMXk0T09a?=
 =?utf-8?B?elV1UUplNmZLelQ1enpSclA0S3dNTm54SElRcURNWDB5M3pubGF4L3hyRU8v?=
 =?utf-8?B?cmR4elU3WWdpVXozUG5xUUdqS3JyWjRKRStJOFFrLytKVmZ1MXBJMzBzVmFG?=
 =?utf-8?B?OXl1R2cvNXhVQ1RwQUorMHhIMFltbk41RFVhWWdrUVByVkRUUXZTMTQzbWoy?=
 =?utf-8?B?dDhpdFdjdzVKcTdDODl0V25OOW4zeW5MaDFpbWtvLzVjazAyUXUvanQrYXJq?=
 =?utf-8?B?cWdXYjgwMExKeU1rbmpic3NjU0FndHE3dFRTYmNoWTBMN0JoRERoOHVsRDcz?=
 =?utf-8?B?bThvYWZTUUxlMkYxYzF1UWVDUXVRUDBDRk9EVTdKTWhaZXhoR25aWkxJd3VX?=
 =?utf-8?B?ZVRSWUhPQUcyODl6cmR1TGpMVGxNSkZ4TWFEU3Bnb0NEc0dKYTI3UXR5TStK?=
 =?utf-8?B?dUJqWk5yRFNmU1czT3NwK0FYRWRIOUhMU01rSG9nQTFOZzE5QlhJMG01OUVo?=
 =?utf-8?B?RnhwcEoycTdETVEvWDgvM0tydDNyVTZLbmFDYnowdlUzazAwdE0veitqNkJL?=
 =?utf-8?B?UHlrKzdrTS9tRUZ0SDdrSks3WXYrT1F3S3E1MnlIVDBwOG9HYnZGaGU0SkZw?=
 =?utf-8?B?dlNjNi9vOGlpTUZDSjhNL1d2ZkNsN1ZXNDhGbzBYR3JjMVZmc05ndlBRSXFS?=
 =?utf-8?B?bHF5alJJRGFoMlo3RWVPTWtNR0lJVmVVSStSR2hxMWpIYzl3dGh6ZktRSXpR?=
 =?utf-8?B?V3RYZ016Z2JyRmp5MDBkcFN1RXJ4RTZyUDhnSFB6ZzVJN0t3eURJSWJJZmhM?=
 =?utf-8?B?REFSUCs1UTdoMUFwVzdCVXVUaThUNmFDcUdrYS9PR0lDMThCTEgrSVMvayt2?=
 =?utf-8?Q?HdGQNvQ8JW2YnK1QhgGXhwnbR?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 72d29eb8-8c8d-43c5-ccd8-08dbe77ac01b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 14:37:40.2784 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DB4WtqK391X5YpvtvvUIUJ9A+uFoN/XKlq2UDmcqF9ZjZO7j50HpLvenDtAIov68Apo392oE5S12ejFnVxZloA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5609
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/pmu: fix config counters in pmu
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

Hi Aravind

On 11/17/2023 4:04 PM, Aravind Iddamsetty wrote:
> 
> On 17/11/23 15:41, Aravind Iddamsetty wrote:
>> On 17/11/23 14:52, Riana Tauro wrote:
>>> Interrupt pmu event was dropped in a previous patch
>>> and the configs for the rest of the events were changed
>>> in uapi header.
>>>
>>> Change the configs in pmu file too.
>> Hi Riana,
> 
> actually i was thinking this better be a fixup! patch to this commit "drm/xe/pmu: Drop interrupt pmu event"Sure will send out a fixup patch

Thanks
Riana
> 
> Thanks,
> Aravind.
>>
>> Thanks for catching the bug.
>>
>> Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>>
>> Regards,
>> Aravind.
>>> Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_pmu.c | 8 ++++----
>>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>>> index 318bbc9c1c9b..c63b7f2fd8a8 100644
>>> --- a/drivers/gpu/drm/xe/xe_pmu.c
>>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>>> @@ -353,10 +353,10 @@ create_event_attributes(struct xe_pmu *pmu)
>>>   		const char *unit;
>>>   		bool global;
>>>   	} events[] = {
>>> -		__event(1, "render-group-busy", "ns"),
>>> -		__event(2, "copy-group-busy", "ns"),
>>> -		__event(3, "media-group-busy", "ns"),
>>> -		__event(4, "any-engine-group-busy", "ns"),
>>> +		__event(0, "render-group-busy", "ns"),
>>> +		__event(1, "copy-group-busy", "ns"),
>>> +		__event(2, "media-group-busy", "ns"),
>>> +		__event(3, "any-engine-group-busy", "ns"),
>>>   	};
>>>   
>>>   	struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;

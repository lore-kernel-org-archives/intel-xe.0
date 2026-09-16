Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C9FC982C3
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 15:06:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5853A88FAE;
	Wed, 16 Sep 2026 15:06:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c3Ax7umS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAC3488FAE
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Sep 2026 15:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789571209; x=1821107209;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=J86q7C7HQspZJvC6T07z2N/5TC9lhsdf8cxAvW4ciyI=;
 b=c3Ax7umSLoPdpiF627mcpSIjlqnjLs9JDt4iRjGUlRB83qFgvsY/yt4+
 Fk5c3akpbIs+muRN3aadqG7lpBmWLVsfkWpksIPla5lvkG3nuDqMgs6Fd
 3jboNvsOH5y54INvnDN/pDKEqDhQasFWqHplkVGXg4Xj9EsxL6JSCoeyh
 QyJ5L29+aEAmmceR2zGW+KlbHakgVab41Glsu90iw9eSTSlca9sSWOSjz
 UNR3hibPjd8ZUL7bv9Cm0QxrJtDab4YUx2czj4DmYhNpqGn60JDgE7Xxi
 hVFLlLGK7A6kilyYxr3JkbX13xYEVC7rO0ZTjdgkXYB0pxvaD/yob1ixS w==;
X-CSE-ConnectionGUID: mqTbyqGuTrq7aaKALTjj1w==
X-CSE-MsgGUID: hcOkGv6vTN+MPnZBU2S1UA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93821048"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="93821048"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 08:06:48 -0700
X-CSE-ConnectionGUID: FdJIPhh4Sg2UBsVjiZoEOQ==
X-CSE-MsgGUID: Kjbrsj7xSJukJOvGg5463A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="278596392"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 08:06:48 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 08:06:40 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 16 Sep 2026 08:06:40 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.28) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 08:06:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PrX29CO6+3Jw+t6mJhNE2VH7DrpQQZ/5cnADhYdeewQQ6XPexYFwtCrqev3b1R+7tt7W1hbJ4iwKhw6PyhQXRu3Tg5rNRXftDS0xsdwg/Z23NTFAgLCC6Kymiy5hvIwCwtyymERcZ+dczFbBz2Jo0+frwLBP8JiFCRZOTIgxCFrNgnDbn/TrQ0hv9PbtpEZdjlm2ldVsBq17jAc1+eZIGIekSNlb02Qc0oHMEYPCymFN+LNkFXXMeadiKMLl3pG5MGje7O9NOmy+LB2BLSBMJTGjQooGupeFbljYM1knWmv7s37MaQRHf8giyMoc2bfay98Ij9XEe1s8/iInHCBAew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rr5rxFsEdyeQ693qMZG/GHYGc2bRLzGoEYPpoBduRn0=;
 b=Gv+Q/fkydOvSnEHC/i1M73U6J/1/kWngLexpSolw8UE/RPJ0HbHQnsrsqlcXfXpLvl/DjOp6TVtm8UcXxGLaXNVaLiM+nOSr9zAIVAXCUBle6KARZcKzgWtUov6FnjgIXdDh0ObaRIrtf/viJLbHpeKF/oWX/QY2IVxts97UP0tqaPMKSPVI2FGRauFgn5N6A5B3uRVAOd9v++L0Ws4Vq/yJaD2mokBtU3MXTE8GLrK3dbpLainVF1mKeqz/BILS4ae9TCOhyXfgeDvSLuppIPkJrZbVlTJSixmS5r9OhwVJsAFZkBMsHm+keNWMTybnWDT4Izc2MTBpq93S0jZUsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by CO1PR11MB5010.namprd11.prod.outlook.com (2603:10b6:303:93::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Wed, 16 Sep
 2026 15:05:59 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c%5]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 15:05:58 +0000
Message-ID: <b324f768-478e-40dc-b752-e0db1fca2e8b@intel.com>
Date: Wed, 16 Sep 2026 08:05:56 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] drm/xe: Poll GT for C6 before D3
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Badal Nilawar <badal.nilawar@intel.com>
References: <20260915210113.2915363-1-vinay.belgaumkar@intel.com>
 <aqqJXsFuaAo0rGq5@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <aqqJXsFuaAo0rGq5@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::11) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|CO1PR11MB5010:EE_
X-MS-Office365-Filtering-Correlation-Id: 8741ca7b-4f52-461d-93ac-08df1404038a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|6133799003|11063799006|56012099006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: l2NhwyRr68REnDaWYcHjBh9G+aki5FGCiVskPxyIM/GjBB18R9By9eN9cW24f4pNARv5acf9W5ygWXkjLAdyRTGzRjOtW31mI6/nH0zG0jkg7OVyaw4f781BPOSf3VC9wCxHuG9TdvSlhwVEwMjDV0IeRjEmkG7ytlEwQbApMNTXH5Ou0moDmaqTE9pluTYvZ26R6dlgKr6ABOab9+xoS8CWYR5sVpSSUEBhYPB929FEe0PxuW8wCxfYrbNzLoeJeiRmjWKdnlkC0FHeMsh0vAUGPwKK+DHyMeT3FB+vN1fap38SM0cTDhLHTiuMAWz+ETVt05whCql138FRY1TIUfqguSYTI4+p8Ubkt07S9pdyiToUU7Sg8I6VOf/XXi248nSoEMlxHTNExn4VXM0LgwdE5Fcc+58BL/UZZntn5vmcPQ3ITlwKaso1jyCWalVYvuc49k/dQ584/mdsYbIzydGrwaL+072NAYMsUw4zqVpb2o4vakJy/C6RYN3XG5/mu5iV3u23HCfKfki21IClBv0gWSsKUIXoBCq42AA/o0RvDxW1S2A7GONaUnbtD2FCTCjsc1qZ+m/39hxWodVUmmT4MJdU/7sKSiA7rAdRr9itg17JKme2EuVtT6hJTitKgHIouwwUkxo766bTYAeLbkxJUr81RQDGZnhBINtx2DI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(6133799003)(11063799006)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFE0VDJwUm9qNkVZbCtmdFA1dDhPVGw3TFZJeVczME93WVlMaXJrWDRmUlRo?=
 =?utf-8?B?TXVhQlMvMVBrR3BtTys0cy9keUtQSlY4T1RDSG84bVV5Z2M3bGdlVmttYVU1?=
 =?utf-8?B?M1ZGR2dWNDhVN29wZlhOSURVbG5yVDVlWTlCTkdpODl2K2ZBQ0VXM1hBZ2ts?=
 =?utf-8?B?MndJaUJFeHE0b1VEUi9Wd1VSNXo1aGNNZjliMzROeFBCRFNKQk83cDFBTEt2?=
 =?utf-8?B?K1k5aUVwQ3lsTWgrOW5MNzR6WjZZMmV4M2lpYTFabG9mM3cwQ2wyV1RVS2tJ?=
 =?utf-8?B?T0o0Nk0xSjZaWHZzQU5KVVlWLzBKQVlvODZ4aUh3OHZuSXZjSzhtaEQ0UUZn?=
 =?utf-8?B?ay80SmpmY3ZWQkE3My92dHl5RmpxdWtuYTRqLzZ5V1BtNjNTdzZpSmRHTWJ1?=
 =?utf-8?B?R20ya3FrWWxhOU5hUU5qVVJJd0FBbWtUQnRqR1lVVkRlK0dFYUFJdjR3emkr?=
 =?utf-8?B?LzY4dkxUSzR2R2pWWDdqTkZLR1NPU1AzNUdVNmRnMW0xbi9tUXVxS3IyOCtL?=
 =?utf-8?B?RWk3N3JBdHFRZXpXR09hNytKb2ZWZGtiSWtTTGRma0VLVWdmUGFPK0Y0WWpw?=
 =?utf-8?B?NUM4VXdlejAxeGEydkhIUGtRMU5VWlROWmkrYUYzQUdwOVZab0lGNDBZTEFl?=
 =?utf-8?B?d2pOdnM4Z1M1TzFXU3Jqd2I0V2htWlVLVDJLNktlYWJIT3ZoaVlLQjVLYWxm?=
 =?utf-8?B?ejV6TnFWbWwvNXNWeDErMVR2QldMQjdNb0wwRm55ZjhSQkJIenBWdFAwRm1V?=
 =?utf-8?B?bHdETWxHVDhJdkxTYnVDRUxjS0dYdCtTZkFOUUtZenZ5Y2lNZFNrSjY2Uzh0?=
 =?utf-8?B?clFOenQ4RndaZHRXdkFRRTJXZVdPS0VuRVVOb3U5ckFwL1RIMXFGSE55eXZ4?=
 =?utf-8?B?ZHczK1M1azdXWWFHZGtCaWF0YmN5RlpHVklpM3p4TEZPUGdzaGpUakg0Smhm?=
 =?utf-8?B?Ylh6bkRtM3M1UjNuOWI5S05Hd3ZSOTFvaGI1bFl6K1VqL0FtV1FNWGVVSXI4?=
 =?utf-8?B?cElyVDdqOXpmUE1JQnN4VGJEemNwMHc3UUJJM0hjV3BKcnU0WXUvYiszdVZ4?=
 =?utf-8?B?cExRWmV6azVCTWw0RzlwZzBLNjVHd0VBMXZmNy8zakorM040bGErSmhQa0hr?=
 =?utf-8?B?anhFdDVqdjVPeUlBR2F5Q21PeEhhYlhUcWVtemN4NE0yK2FpTUhRUkkzRWVk?=
 =?utf-8?B?M1QzSEJIZjcyOWgxT0xlMkttNzRyNlZYWVRmUVVCY2JFUGppenBQSC9DbGFP?=
 =?utf-8?B?TmpQZWpwWHc4SEhmOFdIMWpZaFlKUjJSVERxSzAzcWt2WERFVDFwcEVlKzUr?=
 =?utf-8?B?d0R5ZGpWa1M1QnlSSzZ5cjdlY3MxSTFrcWZGYWJqL3NjUE8xRG9CbFJBV3BP?=
 =?utf-8?B?M1NYR2YzcnI0aUZVaHhzRTduSWF3NGEwRGZydnFsa2JINlNoYWlFMjhJQTF6?=
 =?utf-8?B?NkUvZGE4Zy9Za0w5L213R1J3eEZjbUdpUTR5MUdpVjJpdW1Ld09sU2pEMmtO?=
 =?utf-8?B?TEZGeEROaWZaTTBlTC9qaVJTVzZaVEpxUGo1U1F2M3BuRFNiWW1NM3BtOVdh?=
 =?utf-8?B?SXNrMnB2a0U3VUZUb3M3MGtZWDNwUk03S1V3Z1Fub1NYR3VWVC9SaytJTnVW?=
 =?utf-8?B?RGppRjVMcUtia3hFdEovbHl1SCtPZ1FmOFRZaVo4a2o0NTJIQWFrajFmTzVR?=
 =?utf-8?B?WVZoZmllYUMxemdjZ21PdGY2QW91dGZhKzRJV09VOFVxb3pieGtnRTM3cEky?=
 =?utf-8?B?Ui9EZmhJYlVJVnltSnZ2UGZoS255TytQK3pKcS9xdG1OYWFyWXA2ejBkNGla?=
 =?utf-8?B?eTN3Z0VNQ2x5ZmNaV3BvV1FTdUttRWI4b1krY3hhbE5BQldIbGNSLzJoTFA4?=
 =?utf-8?B?OS9xME5uZDl2eUV4OTA1eG5mNHdISlcyT0VvNW9tcjlWVFBMbVlqMlV0SENW?=
 =?utf-8?B?REY2dkR1L0JqYjlpeGpnWm9icVBaLzRJNDZwRGkyd3poSlRUVVd3eVBIQXVO?=
 =?utf-8?B?anVRMVl2NWRSTzNMSzNWQmpQaU9GdmsrVVoxMTlwYVVmUTRtNUtRYm5OZGdH?=
 =?utf-8?B?cXJva0NnaVF6Z2ZJZUlxSzJMREJmMmo2V2JZc0tLM0pvN1U1NkJRRERPNU1a?=
 =?utf-8?B?MVVBTjdMTkZuWEQvZmg3YXJxVVk2UFdhVklsLytUSzRiTWtWOTBQNGNBaXls?=
 =?utf-8?B?WFhPRG1nZVUzbVNuU2xydHlSNXU0OExDdDFWT0FFU3E2bnJhTnZ3MG5MeTYz?=
 =?utf-8?B?eEtqenJsem1ieStEREpoU2ZFVllhN25Pa1dvRVFKL1c0c250Tzd1Q055L0x5?=
 =?utf-8?B?SGp6TGZOZDNpbm5naE1UbVlaMDR1cENKaVhLdWwrSmo5ODkvaWFzc0twU2tQ?=
 =?utf-8?Q?MRZIIFDRZKrao6Ek=3D?=
X-Exchange-RoutingPolicyChecked: Ho89sGwueSskAH16D9yUYz7xxWoWQBEENz0fwsJvSke+diDr4iucVbpSNk9mbqxhDaqLAub4309PZD7vsrAGX5UHjKtmH5D/gVlu5VIvUy2XZcx1w80hPtS1QtQL8NvQrSYFeC984YPVfDg2v9KUpKKSWT2LTIIfId/Zuj6chITJmxe7Jj8xCkzqN2WsdlRA+VEYtJ8rsL6KgbqE5RsjNzhQb3iUs3OG6vMPHCyWL8dkUkc1o8uWKl55wuAsohfG+8thFkvv+KeXvTUr35Ks5cDds/I27j9K+c78ueQGeAepWREZ7pFFOs4E5u5kuavGO0WTo01DZVrap/mq4ThWaQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8741ca7b-4f52-461d-93ac-08df1404038a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 15:05:58.2979 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E70tcI8yAIAVUZvThn8wfRRof15qoGLxBv/EHsZdL9J/GICg4yzeB7nRkeR54h1OnjZnvDGFW3LRsLRPVuhScQxustuc+RqObdajsTLYojs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5010
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


On 9/16/2026 5:19 AM, Rodrigo Vivi wrote:
> On Tue, Sep 15, 2026 at 02:01:13PM -0700, Vinay Belgaumkar wrote:
>> Ensure GT C6 state before D3 transition in runtime suspend flow.
>> This avoids the scenario where GT is being accessed after D3 state
>> is programmed. If the check for C6 fails, resume the device so it is
>> not stuck in an intermediate state.
>>
>> v2: Force resume when we cancel suspend due to C6 check (Sashiko)
>> v3: Abort the suspend properly when idle check fails (Sashiko)
>> v4: Only check for C6 during suspend (Rodrigo). Have check in
>> xe_pci_runtime_suspend() instead of xe_pci_suspend().
>> v5: Don't checkfor PVC (Sashiko), rename function from_device_c6
>> to _device_idle
>>
>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_idle.c | 36 +++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_idle.h |  1 +
>>   drivers/gpu/drm/xe/xe_pci.c     | 13 +++++++++++-
>>   drivers/gpu/drm/xe/xe_pm.c      | 24 ++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_pm.h      |  1 +
>>   5 files changed, 74 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
>> index c208d7563e36..8242feede1dd 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
>> @@ -8,10 +8,12 @@
>>   #include <drm/drm_managed.h>
>>   
>>   #include <generated/xe_wa_oob.h>
>> +#include <linux/iopoll.h>
>>   #include "xe_force_wake.h"
>>   #include "xe_device.h"
>>   #include "xe_gt.h"
>>   #include "xe_gt_idle.h"
>> +#include "xe_gt_printk.h"
>>   #include "xe_gt_sysfs.h"
>>   #include "xe_guc_pc.h"
>>   #include "regs/xe_gt_regs.h"
>> @@ -451,3 +453,37 @@ int xe_gt_idle_disable_c6(struct xe_gt *gt)
>>   
>>   	return 0;
>>   }
>> +
>> +static int wait_for_gt_c6_state(struct xe_gt *gt, u32 timeout_ms)
>> +{
>> +	struct xe_guc_pc *pc = &gt->uc.guc.pc;
>> +	enum xe_gt_idle_state state;
>> +
>> +	return poll_timeout_us(state = gt->gtidle.idle_status(pc),
>> +			       state == GT_IDLE_C6,
>> +			       20,
>> +			       timeout_ms * USEC_PER_MSEC,
>> +			       false);
>> +}
>> +
>> +/**
>> + * xe_gt_idle_wait_for_c6 - Poll for GT C6
>> + * @gt: GT object
>> + * @timeout_ms: wait time in ms
>> + *
>> + * This function waits for GT to enter C6.
>> + *
>> + * Return: 0 on success, -EAGAIN otherwise
>> + */
>> +int xe_gt_idle_wait_for_c6(struct xe_gt *gt, u32 timeout_ms)
>> +{
>> +	if (IS_SRIOV_VF(gt_to_xe(gt)))
>> +		return 0;
> Why?
We skip GuC RC init for VFs, so cannot check for it.
>
> And why not the PVC check right in here?
>
>> +
>> +	if (wait_for_gt_c6_state(gt, timeout_ms)) {
>> +		xe_gt_dbg(gt, "GT is not in C6\n");
>> +		return -EAGAIN;
>> +	}
>> +
>> +	return 0;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h b/drivers/gpu/drm/xe/xe_gt_idle.h
>> index 9c34a155e102..2c8e9adf4a68 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_idle.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.h
>> @@ -18,5 +18,6 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt);
>>   void xe_gt_idle_disable_pg(struct xe_gt *gt);
>>   int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p);
>>   u64 xe_gt_idle_residency_msec(struct xe_gt_idle *gtidle);
>> +int xe_gt_idle_wait_for_c6(struct xe_gt *gt, u32 timeout_ms);
>>   
>>   #endif /* _XE_GT_IDLE_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index ab4da1d9a9f1..379795ac5e7b 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -1381,7 +1381,7 @@ static int xe_pci_runtime_suspend(struct device *dev)
>>   {
>>   	struct pci_dev *pdev = to_pci_dev(dev);
>>   	struct xe_device *xe = pdev_to_xe_device(pdev);
>> -	int err;
>> +	int err, ret;
>>   
>>   	/*
>>   	 * We hold an additional reference to the runtime PM to keep PF in D0
>> @@ -1396,6 +1396,17 @@ static int xe_pci_runtime_suspend(struct device *dev)
>>   	if (err)
>>   		return err;
>>   
>> +	err = xe_pm_check_device_idle(xe);
> I still don't like _idle prefix in here...
I initially had it as _check_device_c6, then realized it is a misleading 
term.
>
>> +	if (err) {
>> +		drm_dbg(&xe->drm, "Resuming - Device idle check failed!");
>> +		ret = xe_pm_runtime_resume(xe);
>> +		if (ret) {
>> +			drm_err(&xe->drm, "Resume failed after suspend was canceled");
>> +			return ret;
>> +		}
>> +		return err;
>> +	}
>> +
>>   	pci_save_state(pdev);
>>   
>>   	if (xe->d3cold.allowed) {
>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>> index f517bf453b54..f03a463d2a05 100644
>> --- a/drivers/gpu/drm/xe/xe_pm.c
>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>> @@ -1030,6 +1030,30 @@ void xe_pm_d3cold_allowed_toggle(struct xe_device *xe)
>>   	mutex_unlock(&xe->d3cold.lock);
>>   }
>>   
>> +/**
>> + * xe_pm_check_device_idle() - Check if all GTs are idle.
>> + * @xe: xe device instance
>> + *
>> + * One of the ways to do this is to check for GT C6 state. This check
>> + * will fail if some component is holding a forcewake, for example.
>> + *
>> + * Return: 0 on success, -EAGAIN on failure
>> + */
>> +int xe_pm_check_device_idle(struct xe_device *xe)
>> +{
>> +	struct xe_gt *gt;
>> +	u8 id;
>> +
>> +	if (xe->info.platform == XE_PVC)
>> +		return 0;
> PVC check belongs inside the gt_idle component,
> where the RC xe decisions are made
Sure, I added it there since it is a device level flag.
>
>> +
>> +	for_each_gt(gt, xe, id)
>> +		if (xe_gt_idle_wait_for_c6(gt, 200))
>> +			return -EAGAIN;
>> +
>> +	return 0;
>> +}
> But anyway, why this indirection through xe_pm? Why can't the xe_pci call
> directly the gt_idle waiting for c6 inside the runtime_suspend function?

The only reason was that all gt_idle functions take GT as param, not Xe. 
In that case, I would have had the for_all_gts loop in xe_pci, which I 
was trying to avoid.

Thanks,

Vinay.

>
>> +
>>   /**
>>    * xe_pm_module_init() - Perform xe_pm specific module initialization.
>>    *
>> diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
>> index 6d5ab09cb769..a4fdc9c5cb10 100644
>> --- a/drivers/gpu/drm/xe/xe_pm.h
>> +++ b/drivers/gpu/drm/xe/xe_pm.h
>> @@ -36,6 +36,7 @@ void xe_pm_d3cold_allowed_toggle(struct xe_device *xe);
>>   bool xe_rpm_reclaim_safe(const struct xe_device *xe);
>>   struct task_struct *xe_pm_read_callback_task(struct xe_device *xe);
>>   int xe_pm_block_on_suspend(struct xe_device *xe);
>> +int xe_pm_check_device_idle(struct xe_device *xe);
>>   void xe_pm_might_block_on_suspend(void);
>>   int xe_pm_module_init(void);
>>   
>> -- 
>> 2.38.1
>>

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6EEAC44515
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 01:03:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD3610E240;
	Tue, 21 Jul 2026 01:03:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MlU7ErBy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 397C310E23F
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jul 2026 01:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784595779; x=1816131779;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yslpB5r/y9oFWtE9SkomY6fg2tC7t98DfqZumlmOfT4=;
 b=MlU7ErByt2NqR4rcvKRf1aAMgVBr0MW2vWQGQGKLQsUaomYYUYeGhUF3
 z0QOxaxBZXphpuJgaLanw8+p5wMnkuM4JUC62aE2dv6TlDsLYbtH3DRym
 mPoYqyxYn5jfcy36qrTIuWZ3GWmyOUSPLhaIk8zQJpzF490W4LMk+jN+Q
 wQ8Vqos6KcOm0QFKrCZdRckXrCxmc1cSzneYOU2OUg84ao14LluwCxJ+m
 xR9+pVoXnCl5hKewNBUU6d8tugroAsK71KFEGmFbBqCyqeAp0yHfu1fqX
 4Y7PPQnmZhoUZREQl28xP1enJnHjlbLme1htfr08a03miKZtlCbckvX9j w==;
X-CSE-ConnectionGUID: Q8Udh4r9RgG7obPJ8tYwaw==
X-CSE-MsgGUID: qlpxJqykR9i1yThW2nUfdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="85227473"
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; d="scan'208";a="85227473"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 18:02:58 -0700
X-CSE-ConnectionGUID: E3vameK2TbmJpkg5cw4iiQ==
X-CSE-MsgGUID: ScTa4f1bSLe4h0qQp4BIoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; d="scan'208";a="261885311"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 18:02:59 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 18:02:55 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 20 Jul 2026 18:02:55 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.58) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 18:02:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TxC17hhTaHvAkPNv1mRhyMIRkoyWkdglXXUFkr2CoydOU2f9n/0DaQ95AJo3Cgi4Vd3M4b3xut/m/ol2Ws3yy0U53z5LP/iA6hPbT0B/p+cMSNdbsiyKI3GmmiQY2X19Wgf+0OWbdcOG5SsVDo0nCius8Ce/rg51XJVocKpfHPtPdOVqf4v0jKGE1Z/6XGGbbj2Or3o/kzYQcznQjitTxgjN6RNKbT3RATWB9k5MDXSwMmoulyFF114vB3OPlaFO7WSihqGKaPe01O/l0KBwJrWnla1eW0VB/hZ2CONKjEKG0D1gzmyRFnbkNP2DBBNwnF8fXkWie0t/2VzPP2L+/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5V12VbNsjJ5WO1MaHAu7W+rOiQt8EHzuqEgjAG2eauw=;
 b=GntAacMwzSASiOp25NKny+YmxReSKXikdkLCop7lyWNrSR9u/3VdDVg9e6qdGLHhijEBSyCl/Uwy3NzfaPHBmHXb7cbIT/7jjvBsQ0zrjW7FPjjLHMVHDlveDPWkd7Fk5q7eEv5zOmqw6AKaptFLPp/SYuYh3Vz23yo9hMxR0EOZFGOjDGQ9RLG2oHjLoWM5fFQZ24l7oOIYzM+Y286DRxUXMAoonm7UIgNFKsqzi40uA8qVdNXh8ivaqVZpL0UesApCrLl3ShBNG9we1GbNRoRXDKo/MUh40LJowjEoNmx3BAE5NYXQS09iFeRqn54ro+tPqF6/rpiN0hPhnhrT4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by DS4PPF1C4B3BAB7.namprd11.prod.outlook.com (2603:10b6:f:fc02::f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 01:02:07 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c%4]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 01:02:07 +0000
Message-ID: <d9cf313f-4662-40d4-a765-70f120cb8870@intel.com>
Date: Mon, 20 Jul 2026 18:02:06 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] drm/xe: Add debugfs for IA/GT bias
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
References: <20260715235824.116991-1-vinay.belgaumkar@intel.com>
 <20260715235824.116991-3-vinay.belgaumkar@intel.com>
 <al3-Kf5iZD1dNR0w@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <al3-Kf5iZD1dNR0w@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::12) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|DS4PPF1C4B3BAB7:EE_
X-MS-Office365-Filtering-Correlation-Id: 0eadb08a-342d-4572-474f-08dee6c3af8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|10067099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: egGb0DasHnt7rK1AGsZRJXpkCpHWkMLvxTcEI2/FKDof1hxFnqzc/t79kWudYv+/msjFgjzJpAFKvDmqqSMrIl+7JsuqxXl+y0ePk1dq9T6KegE3Y8TpDWNg+6M/zIDr6i1MTTeLtRaplJoyPU4yx00FN+o4aZYyRUHqgaJlF/EM1EHaJV6OtiLIfVWZp0uJNi1/VyyiS3r++vRulcZxnY+NXTUTETEwwW2uzh8CWlxAMARVvwVlYK2fKGvRxjEyU9X6J3h9SdzRY2cRYhg4P/GzmDY+sbLFlAoALdT0QBtWl4zzLA+QFhBgHOhSDM20CRgnzIgVsQMznJHhNFqVtETDe9Wq1R/6s9XE9CXHw9D+GZXPt0hTkgihY75BY5HzdPzwVC8m05w1jF7qHrJXX1wm3p6Cpu2FR0wdA5W1LuZuIZwYeQ6HE98Oqq4ZcDVo8SfqRdm3YhgY/9A+1YSm7Ut864BrFbl7dDuSAAUoWrUi40NAecbIVoS4tGi5jbCL5t+krwEFGi3I3uk2/kMnieeL3VphW7x23jw9dG41nlj76WynKBNmyUwCEY2s13CO7+Vvf+53Z7lWNT4kA9LFJHS3UAdt8r3i+h5SmTRkaya3/pyu3FzlIfAs43mlFMyNNzqzokLfC0YY80nih+/Q4pR8LDI7hT+L5sLTDPXhZVE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(10067099003)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFhhR3Rhekg0MTA5aTBPNzI4a1NmNUwzS1hjWlljMDVJYmJ5OTZrSnZMQk1B?=
 =?utf-8?B?eWh0dWhYdTk2dG9yVUdHaDhCQTdCQXFTVlVySERUQXZmTis1MCs4bm44UUx2?=
 =?utf-8?B?QktsSFF2aHBOSUY2dWcyeHA1bzJMNHNWYjdobzh4M2dLakk5LytLYW1BNmd1?=
 =?utf-8?B?TC91eGhnTGR6WDNOVExIcGsxL0x2bS9Ma0NwSndxYXFERk5qaUp2NG9xQVBj?=
 =?utf-8?B?ODNTeFZFdkRoMnpLWkQrS3pOVnVVNEhreXFjckdaVnpnaEd3bHMzVUNFbkxx?=
 =?utf-8?B?SEI0LzlYbnBpbnhYYkRQQm5zZkNqOU5Yd05SSTZjbEU0RUxiMjdpb1d0NW1D?=
 =?utf-8?B?M0xMK2RLK2p1Vk1wV25aRHpha0dwd3pZLzl6RkpibFRiSWN2Tk9yMS9XU0h3?=
 =?utf-8?B?TFU4bTdQYitkNjNiM2I4a2dKc0oyczlBdTFhU3ZiOU44YjIyTFdSTHNlRTVo?=
 =?utf-8?B?QXJKd245YzFLVG9DakRBM2dnZkpFQVdJV2pIMDY5NDhHaXdlMDg4em5lM2pP?=
 =?utf-8?B?UzRRZk9IMDIzczdOY0FWYmZCTXJBMTlMOWhRdlM2eERoQ09HeUdLRmRGeVdR?=
 =?utf-8?B?SFpURURVNUxGMUM1Nk4yVjRRTzk4RTlIVEROUzljVVFIRWtyQ2pHZmN0UFhD?=
 =?utf-8?B?dExYTFpKYWcxb21GSWhOUndCK08zcmNTYzk1dGNMTTNESFBULzZUMzREYUxV?=
 =?utf-8?B?TXlYWWs3UHJNUHkva2hRWGgwaHQ0RDF0cXowckRQNjNpU1hpTG43bzVINjds?=
 =?utf-8?B?QU5qU0JacVJERmtvdDJjTUFheDBrUFBlVVZoUmprZzl4MlNaSVBybUxjWWta?=
 =?utf-8?B?dythYkt1bkUvQVNseHlPaHFjamdIUEl0VityaTVyRFlYd0R0UFV5S2ZKZUJS?=
 =?utf-8?B?L0lOOFhMZHF2ODlpdHZCdHEvRi9ZcE0yWUFYbjdKSXI4Qm9UTGF1Z2JQN2dn?=
 =?utf-8?B?Znd6MXZPMlpnU3JJQ25BRC9mTFJuR1FZdnhzMTJ2b3c5Z1QvYkdudjZiam9p?=
 =?utf-8?B?a2dJSGc4YkRRMHc0eWszWmRvK3ZuOExianVNL3JrdjEyZEhHZmx5aVlLUEFU?=
 =?utf-8?B?dXpPdUxOQWRvS3dFMyt4dkpjSWtEOTIzaUh6L2ZFNlVUUDBDcmVrZUV6WGor?=
 =?utf-8?B?N3BRWDZMdVg2cWZsalNtMHRYTThxK25XVEduRGp0NTVWRnF1UExpRlpvem55?=
 =?utf-8?B?anZyQW1ac3N6T2hIcXNJT0pZby9iUHlkRllTdXJ1SmRaeTRQTEpQazY1eEh2?=
 =?utf-8?B?WDJqenkwSVkvaVlDMmE4YW5BOWN2cW4xYldEK3BjMjR2ZDFQcHpRS09KY1dU?=
 =?utf-8?B?OW8xOTgvRVZuSHozV250Ulh6azRuR1ZzbHZNb2JyU0I4Z2RXWDJnMFU4VFAv?=
 =?utf-8?B?ak9KdFIxa2VpckZyMTFrMmU3RTNWclcwQ2ZUY3NHVEhLUUVRYk03VzV5ZjdJ?=
 =?utf-8?B?T1IvU3VmNGdBZnRKNitTS0I0STRtNmtnbW9JdDUzYm5LNitXN3FxTS8yaS9o?=
 =?utf-8?B?OTdWYnhhOG5ObXRlRFhrdGRyQTZweFRwN2N3Vmx2cFZBY21SK3kyalFpejdL?=
 =?utf-8?B?WFNRU0l2MW5valUweXFzYkNtK0JYcGEvQUdMSmZJY21FTUdqc1AvU0NKbytL?=
 =?utf-8?B?UUZZSC9TSmdaOXpVNjEwaHFCVzBmY0xicHdlbUpFNnFaTVFLai8wKzZpUE4r?=
 =?utf-8?B?R1A0WUNpSDFnRWVpYlJhWUY2NWcrcllJb3V2NW5oYSs4cUtOUVcvOWNySFhF?=
 =?utf-8?B?em1NamRKTENONkFkbmkySGlNSjQyaGM1aXdVZWFqdXp3WDFNellWM1dVRGNv?=
 =?utf-8?B?UitJbFBVMVFwNDJETHlLVXFUZ3F1MEZYWGp0NVpOUkxtNXNTUmN5NVJQTXZy?=
 =?utf-8?B?M0JpcGlRTllVTGJGS21Ba3R5alpMR3lBVzY2MmVab0tmM0wrOXdPaU5XZ2c0?=
 =?utf-8?B?VTJDTmZta2paMm82MXVoRTd3cXBpTlVvR2FNOFBscmthNjVvemRxSDE0alUr?=
 =?utf-8?B?K2RuYTliektPZXcvcURKMnhDNHVDR3BWSkhuOW1IYUVRTysxT285VU9uTVFZ?=
 =?utf-8?B?OUoydnJocnVuVWJSaHB6T25sNmFyVDVZK1YvOVZNazNEM3B6WXMweEcrcmQ0?=
 =?utf-8?B?RkVMeXlqUGhBMXk0N0xWN2ltN2VQNlRtYUpDb1BYdE04T2orWldRTUxZb0Q0?=
 =?utf-8?B?dnR2TjJpR3F6NlZHWUFxWUNOYkxoN3hTdGphbzNBSlFlS3AvYlIrV3RzWjVo?=
 =?utf-8?B?U2taQzVJNDUvSnNVU0pOSFN3eEdKWllpSFd6TENDaHFibGx5blgrWmtIMnZK?=
 =?utf-8?B?NGdpbm9WVEZ4V2JLNjBkczc4WGphYldTa0xpY3FRcUtIQ0lMVFcrL0Qxcm0z?=
 =?utf-8?Q?XNPmEuyllYVCKh6U=3D?=
X-Exchange-RoutingPolicyChecked: OhTm/WYSjKIvF7mWAziNbCOoXCdoN3ci+ch8uE5pKwkjDabPyD5yFqQXWBbZpjO6xXvOFcOf856uEyB1wV/mKLUaKwU1aKMVzvN0cxz2CKt/YiZVRmx8+DTqIzvfjBOYwX8ks+0cXztDzNoQv1CSvRGaPbCrVKpS2GKnbewbmNmZcXzdB4XiskMu8RyZydLKN+4FVDpkIU7mBO/DUSbI+lXMwTCJD0eQwU/zjVgtYxT7V5Etsxbz7H2xpaQHE7dqkqi1h6NWuZKcFPCcmLser1WCBPxlZpu8naA4LnFKCqU9pAtZKcZVJhOTGVn7IppNp18MH6df7CUe8BfDeYyglw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eadb08a-342d-4572-474f-08dee6c3af8f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 01:02:07.3467 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wHadgKo8QT4kvlrct7kukhVVG3QdwQxaaFuDNrpD+4ahAKmv+WlpaZOJwPNuOlbRg676Txp4QKvcaOtsPZpvMCO9m4xLSLCPO2u2wX5Swuc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF1C4B3BAB7
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


On 7/20/2026 3:53 AM, Rodrigo Vivi wrote:
> On Wed, Jul 15, 2026 at 04:58:24PM -0700, Vinay Belgaumkar wrote:
>> GT_IA_PERF_BIAS_REG indicates power budget between IA and GT.
>> Lower 16 bits correspond to IA and upper to GT. Higher value
>> indicates more bias towards that plane. The values are in U1.15
>> format.
>>
>> $ cat /sys/kernel/debug/dri/0/gt0/ia_gt_bias
>> 0x80004000 (GT: 1.000, IA: 0.500)
>>
>> This interface will allow us to observe power budget changes while
>> running workloads and also, if needed, tune it.
>>
>> v3: Add a helper function for U1.15 decode (Michal)
>> v4: Validate input values (Rodrigo)
>>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h |  4 ++
>>   drivers/gpu/drm/xe/xe_gt_debugfs.c   | 83 +++++++++++++++++++++++++++-
>>   2 files changed, 86 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index 08251c7a1a4b..4f1404c6c209 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -634,6 +634,10 @@
>>   #define GT_GFX_RC6_LOCKED			XE_REG(0x138104)
>>   #define GT_GFX_RC6				XE_REG(0x138108)
>>   
>> +#define GT_IA_PERF_BIAS_REG			XE_REG(0x138158)
>> +#define   GT_BIAS				REG_GENMASK(31, 16)
>> +#define   IA_BIAS				REG_GENMASK(15, 0)
>> +
>>   #define GT0_PERF_LIMIT_REASONS			XE_REG(0x1381a8)
>>   /* Common performance limit reason bits - available on all platforms */
>>   #define   GT0_PERF_LIMIT_REASONS_MASK		0xde3
>> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> index c38bcacb27e4..407393a90909 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> @@ -10,6 +10,7 @@
>>   #include <drm/drm_debugfs.h>
>>   #include <drm/drm_managed.h>
>>   
>> +#include "regs/xe_gt_regs.h"
>>   #include "xe_device.h"
>>   #include "xe_force_wake.h"
>>   #include "xe_gt.h"
>> @@ -22,6 +23,7 @@
>>   #include "xe_guc_hwconfig.h"
>>   #include "xe_hw_engine.h"
>>   #include "xe_lrc.h"
>> +#include "xe_mmio.h"
>>   #include "xe_mocs.h"
>>   #include "xe_pat.h"
>>   #include "xe_pm.h"
>> @@ -336,6 +338,83 @@ static int force_reset_sync_show(struct seq_file *s, void *unused)
>>   }
>>   DEFINE_SHOW_STORE_ATTRIBUTE(force_reset_sync);
>>   
>> +#define U1_15_MAX		0x8000
>> +#define U1_15_INT_BIT		REG_BIT(15)
>> +#define U1_15_FRACTION_BITS	REG_GENMASK(14, 0)
>> +
>> +static void decode_u1_15(u16 num, u16 *whole, u32 *frac)
>> +{
>> +	u16 frac_bits;
>> +
>> +	/*
>> +	 * In U1.15 format, uppermost bit is integer value and the
>> +	 * rest 15 are the fraction. We calculate up to 3 decimal places.
>> +	 */
>> +
>> +	*whole = num & U1_15_INT_BIT ? 1 : 0;
>> +	frac_bits = REG_FIELD_GET(U1_15_FRACTION_BITS, num);
>> +	*frac = ((u32)frac_bits * 1000) / U1_15_MAX;
>> +}
>> +
>> +static int ia_gt_bias_show(struct seq_file *s, void *unused)
>> +{
>> +	struct xe_gt *gt = s->private;
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	u32 val;
>> +	u32 ia_frac, gt_frac;
>> +	u16 ia_raw, gt_raw;
>> +	u16 ia_int, gt_int;
>> +
>> +	guard(xe_pm_runtime)(xe);
>> +	val = xe_mmio_read32(&gt->mmio, GT_IA_PERF_BIAS_REG);
>> +
>> +	ia_raw = REG_FIELD_GET(IA_BIAS, val);
>> +	gt_raw = REG_FIELD_GET(GT_BIAS, val);
>> +
>> +	decode_u1_15(ia_raw, &ia_int, &ia_frac);
>> +	decode_u1_15(gt_raw, &gt_int, &gt_frac);
>> +
>> +	seq_printf(s, "0x%x (GT: %u.%03u, IA: %u.%03u)\n",
>> +		   val, gt_int, gt_frac, ia_int, ia_frac);
>> +
>> +	return 0;
>> +}
>> +
>> +static bool is_valid_u1_15(u32 val)
> this function name seems to be misleading since it validates
> the entire u32...
>
>> +{
>> +	/* Validate both IA and GT values */
>> +	if (REG_FIELD_GET(IA_BIAS, val) <= U1_15_MAX &&
>> +	    REG_FIELD_GET(GT_BIAS, val) <= U1_15_MAX)
>> +		return true;
>> +	else
>> +		return false;
> just
>
> return (REG_FIELD_GET(IA_BIAS, val) <= U1_15_MAX &&
>         REG_FIELD_GET(GT_BIAS, val) <= U1_15_MAX);
>
> or perhaps just use this directly in the function below...

ok, will remove and add in the function.

Thanks,

Vinay.

>
>> +}
>> +
>> +static ssize_t ia_gt_bias_write(struct file *file,
>> +				const char __user *userbuf,
>> +				size_t count, loff_t *ppos)
>> +{
>> +	struct seq_file *s = file->private_data;
>> +	struct xe_gt *gt = s->private;
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	u32 val;
>> +	int ret;
>> +
>> +	ret = kstrtou32_from_user(userbuf, count, 0, &val);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (!is_valid_u1_15(val))
>> +		return -EINVAL;
>> +
>> +	guard(xe_pm_runtime)(xe);
>> +	xe_mmio_write32(&gt->mmio, GT_IA_PERF_BIAS_REG, val);
>> +
>> +	return count;
>> +}
>> +
>> +DEFINE_SHOW_STORE_ATTRIBUTE(ia_gt_bias);
>> +
>>   void xe_gt_debugfs_register(struct xe_gt *gt)
>>   {
>>   	struct xe_device *xe = gt_to_xe(gt);
>> @@ -368,7 +447,6 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
>>   	debugfs_create_file("stats", 0600, root, gt, &stats_fops);
>>   	debugfs_create_file("force_reset", 0600, root, gt, &force_reset_fops);
>>   	debugfs_create_file("force_reset_sync", 0600, root, gt, &force_reset_sync_fops);
>> -
>>   	drm_debugfs_create_files(vf_safe_debugfs_list,
>>   				 ARRAY_SIZE(vf_safe_debugfs_list),
>>   				 root, minor);
>> @@ -378,6 +456,9 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
>>   					 ARRAY_SIZE(pf_only_debugfs_list),
>>   					 root, minor);
>>   
>> +	if (xe_gt_is_main_type(gt) && !IS_DGFX(xe) && !IS_SRIOV_VF(xe))
>> +		debugfs_create_file("ia_gt_bias", 0600, root, gt, &ia_gt_bias_fops);
>> +
>>   	xe_uc_debugfs_register(&gt->uc, root);
>>   
>>   	if (IS_SRIOV_PF(xe))
>> -- 
>> 2.38.1
>>

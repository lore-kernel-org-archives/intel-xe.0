Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05EBAC4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 05:15:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9DDA10E9CA;
	Fri,  8 Dec 2023 05:15:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C24F410E9CA
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 05:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702012513; x=1733548513;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QrcWNCeFNcsjqPplnDq3EkycM1n5QfKbwiV8Rrj8QGM=;
 b=g/SYu/4MANkVP41l0uEscHYxXtQpak4QfjLjrLcdpaL+eHoBCbS27RCz
 xmY5KZDEv6fw6cnTIVSeThOgmz/Y9X+9ZppQ1TsiaA8CA65AOHO+wMdKs
 Wt5UgZcLLdOE3z3g+EhwqgdppEg9XjYwJzuDgJVTZ/amxd3t1MdBDb5EJ
 +pwx2LqtnuPetbf8z/5rCxKk8AViOW59AO+7mm6ukQYSWbbUAOrSs027V
 PmKWt3freZNLjlkwUEvmxvKs54IlU0cgdhDm4KR+X0VWNLa++xgtkufpY
 SJbPjhlQj/mf7jeKBw5xlwI6UO+KhyrspHBWkIU2jjEPFqW9QzAptx/xq Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="1217124"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; 
   d="scan'208";a="1217124"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 21:15:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="721748786"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; d="scan'208";a="721748786"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 21:15:12 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 21:15:11 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 21:15:11 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 21:15:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PYrPEV0VNmITfh3WG9zECN4gcmXSbeRJOkANYGw8ipjjUfogSmY7//05/r85fg/WcXaTeNS5jW6an3ZQFk5FdfIUqvif8YGonkuGbbWfq5i/QfHDVJ7azuG0tDw5fKFfkaFYrw7LC2kgfYIJRwn6ZijkW5oMDxtnnuooPdjfN8q1bE9R98DY4rVZan33xI2R4EuDGlrCzoS8BHZsryKsqi6Xjl0E/x//beO/rTkuRsuhI41pcFIpaWqR1QtKgnXar5FV/WRp+qbkjLiGc9oNTHm+OwcLl/5Jk2Tra2sFjdks7fDjrnS2OLAKpqGiAoKERSwpvDfOAYy/7tAXNba8Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FxAOvTrjuZE8+Xw7jYCPlTpNK6ZYguk3kEDRT+GMvVk=;
 b=BySbprI13rcwlsxHmR70m7lotYbupvz8xLbcnNPJz/yBSzyKhTuPW/drFVUGSL7XNRbjhttjUOfE4NgS16fJt+YBaBIfm92hkyShPrRB8GvlqXMusOreuo4zGJbFm5t9CY5PsfSoMyHqmT17+3LSgocb9AfRey9/yIUdiXjujpVj5s+3P3FPEwYtntLJYEOJqsq6BMpG1h1+EIPPJPr0FOprIbv5pQgsdsu1CljzzdXdqDMQv0o2euh+A22z6Cb64D+q13+Uc1yvV4u8UwHBAIaph4XsnWWx/GYldoSh0HbA4Wbn0CEWyUg4RalroK1YjcALTvSVUoVFbnsUt9qjfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DM4PR11MB5360.namprd11.prod.outlook.com (2603:10b6:5:397::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.27; Fri, 8 Dec 2023 05:15:09 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6%7]) with mapi id 15.20.7068.028; Fri, 8 Dec 2023
 05:15:09 +0000
Message-ID: <b06a5dc2-3389-4473-8e24-aeea89700268@intel.com>
Date: Fri, 8 Dec 2023 10:45:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-xe] [PATCH 1/3] drm/xe: Change the name of frequency sysfs
 attributes
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20231205213659.179813-1-rodrigo.vivi@intel.com>
 <046df246-d29f-4551-9df0-fcf8aa4502a9@intel.com> <ZXKf0yVaESLeQ3eB@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <ZXKf0yVaESLeQ3eB@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0151.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::14) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DM4PR11MB5360:EE_
X-MS-Office365-Filtering-Correlation-Id: 142ceea0-4c7b-4d55-4785-08dbf7aca5b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8noPbNsZNdJ5pgNSyB2+GT2D36t6B3iRstMPyNC9Ej8MGZd3HqnacC0YgB4Egl3gL3NigHaiEvh9ARKgfUWHMs05rAzgsMJ+4KQdcvkzkQVllm06sdLRdZB+9eU+T65RjiSACCEjR+RoBouz6No148/ZaHpSGikYaJupJDbdcnregeH/9cGbIBj8dAmrp1DalNs3/oSoFS6L5WmkUlvAxc8wDNlSgoZAMwyOeLnopaI0TMmIsPQSEqsLyruHOrN+egjXO/0qBqh01LcWAVCrJ1xFUjLJwDijkh0c0YJHKevo4akcUlrKf0OOem+EeS1Driry+jktinMcTCd7mYvz42YcDXoZyziH+Dl+ZGjs+j3upk0FH2zBtCk5SyC5oqJqbK0hetE/lIWOhlVNgh6VlzYRJ0BcXxfMdrb9RvXUWi+xmst/eh8RdUKcwUN5NHYDUMkfLZ4mJHktXKknSauUGaOj+4SLtzsdyXS/R4cNf75jY6v2iRYlI4MHVG4rWC/O2il1q4TeuFvfvFTdMgt8u3R/XXGpmKt1yCDtYlvn1j+8tNHAaeOsNWE8Yigu5zfvdqWNsZAIM9o50fssM0mYqmlAG7k1GGn6p4Bz7G52sMz/bnq91jWEsSinvrLqdk+oNClE1softUIFk1ymV8k/7A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(39860400002)(376002)(136003)(396003)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(31686004)(38100700002)(41300700001)(5660300002)(2906002)(6636002)(36756003)(8676002)(4326008)(316002)(6862004)(6512007)(478600001)(6666004)(53546011)(6506007)(2616005)(66476007)(31696002)(86362001)(37006003)(82960400001)(66556008)(26005)(66946007)(107886003)(8936002)(44832011)(83380400001)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0d5UHo3MTA4VTRobVlBVjJpNFpwelZaMUhKck1zZEwxeWFjZkJrSGxBSzhp?=
 =?utf-8?B?UHZzYjNLajVXYzBuaGFDZEdKSTJGTjZaWS9RdTJQYTdaeXFyeEk4RnJHZm1t?=
 =?utf-8?B?RmVaUjJOdUZ1VUJHampLYllTdWErcVo0UVhKckhQcXoxQkNWMGZoaWFnUVUx?=
 =?utf-8?B?Z0Q0SCt1L3V1UU9BQVoyMTJEQU90aE50NnRrOWNnc2txNG5SOHd0cUlOSU5V?=
 =?utf-8?B?eENPN1ZwT1BHS3JwSXRQTUI0eCt4T1REb1VpMjVpS2w1Y3FsOTNKdzVsS1JF?=
 =?utf-8?B?N2NzdG94dEhZMmI5enpKMkd6NGFEbWxFV3Y5N05DdFFHTk0rY0JRNzJoaVJT?=
 =?utf-8?B?bTU2SnpGbDJyUEJvTUZMSEUxRTBOSW9ZT2NMWVdwcXRtWTVmTnZyTUQwTlZw?=
 =?utf-8?B?bXQxV3BkVlJzWEdOU1VaZkt2Rms3a2YvZmExWUlMNFN3aWt2a2UyY0Z5Lyth?=
 =?utf-8?B?UjNXNGZWREdtNzQ1bU9GQi94ZVVpK1lqR0k4aEpvUlpRUyt1dzBUNUpWaVNW?=
 =?utf-8?B?Y0FlSmRTSmN5dXN1dzRJY05mSnZ1TURtSUhHdWc4a25wdDJKZmtZMjcwWDNK?=
 =?utf-8?B?TElZMnZtMHNiL0RFcnBKSWF6b2NkeC83MlJ6MnkyUFk3cHRZWGtnT1RHWGh1?=
 =?utf-8?B?QStDQmZoWk5xZHdHaGpjZjJYeUZTR3dGL0U4ZXZiM0l2U1ErUmFjZjhyRjQ0?=
 =?utf-8?B?d2N3VmgzRTdsK05qdG4vNGg1VCtwcFlhNU9xWkRvT1Y3dnlXUUVIbThKYmc1?=
 =?utf-8?B?akI3czY0L05YV3JhYVZkYmVCaUtaMmFqM1BRc0YrT0dVeDF1czg5TkdIQ3Y3?=
 =?utf-8?B?enovOHpDRythZjRhWXNvYTZXdm9CR01tV3g4ODkwQXZJQnBaaXBuUkxxUmFD?=
 =?utf-8?B?Q2NMLzRSSytmUU5zczA0ZThVLzhpREhOSSt5ekkreGpZK0dhZjVzNHBjeHpl?=
 =?utf-8?B?aEo5TVdEbitid25FajN5dks4d2Q5VjQ0SEhwRDBQeUMrcGRzWXJkMy9JUjdo?=
 =?utf-8?B?aFJYS2FxZVdPTjExbUZoSTgzTmtseDhwR2srWmRZekFJUEFIQk8wMWFodm5U?=
 =?utf-8?B?Y3pUWmpzcFZOQkxzQ1RMS1MwblJBZ29Lc0pQYnNra3RBdnJGMXZlaHk4alEw?=
 =?utf-8?B?MzZwMUh1MHVScEh4S1dENG5OQ2VLNHY2aTVGcEdqcEM4YmNiKzFuTUwrZWoz?=
 =?utf-8?B?NGkxekJ3VDA2NU8vRkZ3RndFQnlvUmRHKzkzRUdRY3NiM1BURG9uVXR1aWth?=
 =?utf-8?B?UnJZcUZoWXR0WFZFRFI3RUtaaC9jeDh6RGs5UzJFZXRuOUlPTUNnK3hISXFF?=
 =?utf-8?B?S3ZxNHBiOWgxeCtpajJNRGtKVG5jeU9LdE5GdjNrQVhMWFBOS1MxMWJCVjR2?=
 =?utf-8?B?UDBYT2lBTFMxSzZxOUh5VGFnbkpRTHYvbXpzeTh6RVBkZUUvMzlONVRpZlZ5?=
 =?utf-8?B?MUh6Y1VKR0NhU3l6STVJczBQYWwwU09Jajdrd2R4cUtiZjJMZ1c0L0NwR2RD?=
 =?utf-8?B?YjFZbEs4K3U3U1B3QkRVMk03dmlabEZ6dk9lWnhjSUx5cWVReHk1S0RxTlJr?=
 =?utf-8?B?c3BXZmhhcHgrd3paeGluUTdHYm1nYVM1YVdhZjRhVUpic2REb3VKT2pGbGx5?=
 =?utf-8?B?R0pSQ3UwcFoxeGM3dzZSZmdmWHdJL2hYMnpuOWVaQ3hTVHRsM3hjMjV4UGxn?=
 =?utf-8?B?c29xUWl3TWVhTW9lY2d6c3RXck5SMXBGeHVCUEhMMWdMeTcveHZ4SThTeHlt?=
 =?utf-8?B?SHFGczFuRUZZQzZDY0Fsait5T3JXR0xqV3hLWDVOc2JmZnFiSURXSldNQ0xM?=
 =?utf-8?B?MDhPdHVyeC8vbTQ1OUtSRlR6VWFuTXM5ZWUzSHRKMGIwSzlpa2EwalRzNTVY?=
 =?utf-8?B?SXB0WXhNRzlkN1p2R1FvdUVOTjc0MXVrNEkrZTdweU1IQkdQZm1mT2VWZWF0?=
 =?utf-8?B?Smc5SytwMWtmS09hSDhwbTRBYXYyK2RsdFgyR0tuRUpqU09MMlBwYm4yRHI2?=
 =?utf-8?B?dGgzQko4QXl2NFNOaWc0TTdmMmVwNWJtckttcnUxQjhZVFVvTHZERGpBN2h6?=
 =?utf-8?B?TjFPOUc2SnZRSXB6a3ZjU2kyRkRtSHM1USt0OW1WcGNOd0xoQ2tzR2YvS3F3?=
 =?utf-8?Q?GpCjFP+PqvWE1x2Yuug+awdwA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 142ceea0-4c7b-4d55-4785-08dbf7aca5b8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 05:15:09.3323 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qQjhUuBmdczzfS/ZszvRFcHpbG1PLg2Xqi5VI35Wu0hO5GaZ7AtxegCmhy3MWXPgxpC3rWdzGLz7fp1I7na4vA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5360
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
Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 12/8/2023 10:17 AM, Rodrigo Vivi wrote:
> On Thu, Dec 07, 2023 at 11:04:04AM +0530, Riana Tauro wrote:
>> Hi Rodrigo/Suja
>>
>> These changes are removed again in the second patch.
> 
> What? they are not. The final result is something_freq.

The changes made in the guc_pc in this patch are removed and function 
name changed to be called from the freq sysfs layer in the next patch.


-static ssize_t cur_freq_show(struct device *dev,
-			     struct device_attribute *attr, char *buf)
+/**
+ * xe_guc_pc_get_cur_freq - Get Current requested frequency


The next patch changes the name as well. So it is aligning to devfreq.

> 
> The next patch is based on this.
> 
>> Is this patch required?
> 
> and both are required if we want to be prepared for a
> possible alignment with devfreq.
> 
>>
>> Thanks
>> Riana
>>
>> On 12/6/2023 3:06 AM, Rodrigo Vivi wrote:
>>> From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>>>
>>> Switching the names of frequency sysfs attrbutes to align with
>>> required devfreq changes. The name changes are as below;
>>>
>>> -freq_act -> act_freq
>>> -freq_cur -> cur_freq
>>> -freq_rpn -> rpn_freq
>>> -freq_rpe -> rpe_freq
>>> -freq_rp0 -> rp0_freq
>>> -freq_min -> min_freq
>>> -freq_max -> max_freq
>>>
>>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>>> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_guc_pc.c | 60 +++++++++++++++++-----------------
>>>    1 file changed, 30 insertions(+), 30 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>>> index d2605a684b1c..b1876fbea669 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>>> @@ -60,15 +60,15 @@
>>>     * Xe's GuC PC provides a sysfs API for frequency management:
>>>     *
>>>     * device/gt#/freq_* *read-only* files:
>>> - * - freq_act: The actual resolved frequency decided by PCODE.
>>> - * - freq_cur: The current one requested by GuC PC to the Hardware.
>>> - * - freq_rpn: The Render Performance (RP) N level, which is the minimal one.
>>> - * - freq_rpe: The Render Performance (RP) E level, which is the efficient one.
>>> - * - freq_rp0: The Render Performance (RP) 0 level, which is the maximum one.
>>> + * - act_freq: The actual resolved frequency decided by PCODE.
>>> + * - cur_freq: The current one requested by GuC PC to the Hardware.
>>> + * - rpn_freq: The Render Performance (RP) N level, which is the minimal one.
>>> + * - rpe_freq: The Render Performance (RP) E level, which is the efficient one.
>>> + * - rp0_freq: The Render Performance (RP) 0 level, which is the maximum one.
>>>     *
>>>     * device/gt#/freq_* *read-write* files:
>>> - * - freq_min: GuC PC min request.
>>> - * - freq_max: GuC PC max request.
>>> + * - min_freq: GuC PC min request.
>>> + * - max_freq: GuC PC max request.
>>>     *             If max <= min, then freq_min becomes a fixed frequency request.
>>>     *
>>>     * Render-C States:
>>> @@ -388,7 +388,7 @@ static void pc_update_rp_values(struct xe_guc_pc *pc)
>>>    	pc->rpn_freq = min(pc->rpn_freq, pc->rpe_freq);
>>>    }
>>> -static ssize_t freq_act_show(struct device *dev,
>>> +static ssize_t act_freq_show(struct device *dev,
>>>    			     struct device_attribute *attr, char *buf)
>>>    {
>>>    	struct kobject *kobj = &dev->kobj;
>>> @@ -413,9 +413,9 @@ static ssize_t freq_act_show(struct device *dev,
>>>    	xe_device_mem_access_put(gt_to_xe(gt));
>>>    	return ret;
>>>    }
>>> -static DEVICE_ATTR_RO(freq_act);
>>> +static DEVICE_ATTR_RO(act_freq);
>>> -static ssize_t freq_cur_show(struct device *dev,
>>> +static ssize_t cur_freq_show(struct device *dev,
>>>    			     struct device_attribute *attr, char *buf)
>>>    {
>>>    	struct kobject *kobj = &dev->kobj;
>>> @@ -442,18 +442,18 @@ static ssize_t freq_cur_show(struct device *dev,
>>>    	xe_device_mem_access_put(gt_to_xe(gt));
>>>    	return ret;
>>>    }
>>> -static DEVICE_ATTR_RO(freq_cur);
>>> +static DEVICE_ATTR_RO(cur_freq);
>>> -static ssize_t freq_rp0_show(struct device *dev,
>>> +static ssize_t rp0_freq_show(struct device *dev,
>>>    			     struct device_attribute *attr, char *buf)
>>>    {
>>>    	struct xe_guc_pc *pc = dev_to_pc(dev);
>>>    	return sysfs_emit(buf, "%d\n", pc->rp0_freq);
>>>    }
>>> -static DEVICE_ATTR_RO(freq_rp0);
>>> +static DEVICE_ATTR_RO(rp0_freq);
>>> -static ssize_t freq_rpe_show(struct device *dev,
>>> +static ssize_t rpe_freq_show(struct device *dev,
>>>    			     struct device_attribute *attr, char *buf)
>>>    {
>>>    	struct xe_guc_pc *pc = dev_to_pc(dev);
>>> @@ -465,18 +465,18 @@ static ssize_t freq_rpe_show(struct device *dev,
>>>    	xe_device_mem_access_put(xe);
>>>    	return sysfs_emit(buf, "%d\n", pc->rpe_freq);
>>>    }
>>> -static DEVICE_ATTR_RO(freq_rpe);
>>> +static DEVICE_ATTR_RO(rpe_freq);
>>> -static ssize_t freq_rpn_show(struct device *dev,
>>> +static ssize_t rpn_freq_show(struct device *dev,
>>>    			     struct device_attribute *attr, char *buf)
>>>    {
>>>    	struct xe_guc_pc *pc = dev_to_pc(dev);
>>>    	return sysfs_emit(buf, "%d\n", pc->rpn_freq);
>>>    }
>>> -static DEVICE_ATTR_RO(freq_rpn);
>>> +static DEVICE_ATTR_RO(rpn_freq);
>>> -static ssize_t freq_min_show(struct device *dev,
>>> +static ssize_t min_freq_show(struct device *dev,
>>>    			     struct device_attribute *attr, char *buf)
>>>    {
>>>    	struct xe_guc_pc *pc = dev_to_pc(dev);
>>> @@ -513,7 +513,7 @@ static ssize_t freq_min_show(struct device *dev,
>>>    	return ret;
>>>    }
>>> -static ssize_t freq_min_store(struct device *dev, struct device_attribute *attr,
>>> +static ssize_t min_freq_store(struct device *dev, struct device_attribute *attr,
>>>    			      const char *buff, size_t count)
>>>    {
>>>    	struct xe_guc_pc *pc = dev_to_pc(dev);
>>> @@ -543,9 +543,9 @@ static ssize_t freq_min_store(struct device *dev, struct device_attribute *attr,
>>>    	xe_device_mem_access_put(pc_to_xe(pc));
>>>    	return ret ?: count;
>>>    }
>>> -static DEVICE_ATTR_RW(freq_min);
>>> +static DEVICE_ATTR_RW(min_freq);
>>> -static ssize_t freq_max_show(struct device *dev,
>>> +static ssize_t max_freq_show(struct device *dev,
>>>    			     struct device_attribute *attr, char *buf)
>>>    {
>>>    	struct xe_guc_pc *pc = dev_to_pc(dev);
>>> @@ -571,7 +571,7 @@ static ssize_t freq_max_show(struct device *dev,
>>>    	return ret;
>>>    }
>>> -static ssize_t freq_max_store(struct device *dev, struct device_attribute *attr,
>>> +static ssize_t max_freq_store(struct device *dev, struct device_attribute *attr,
>>>    			      const char *buff, size_t count)
>>>    {
>>>    	struct xe_guc_pc *pc = dev_to_pc(dev);
>>> @@ -601,7 +601,7 @@ static ssize_t freq_max_store(struct device *dev, struct device_attribute *attr,
>>>    	xe_device_mem_access_put(pc_to_xe(pc));
>>>    	return ret ?: count;
>>>    }
>>> -static DEVICE_ATTR_RW(freq_max);
>>> +static DEVICE_ATTR_RW(max_freq);
>>>    /**
>>>     * xe_guc_pc_c_status - get the current GT C state
>>> @@ -667,13 +667,13 @@ u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc)
>>>    }
>>>    static const struct attribute *pc_attrs[] = {
>>> -	&dev_attr_freq_act.attr,
>>> -	&dev_attr_freq_cur.attr,
>>> -	&dev_attr_freq_rp0.attr,
>>> -	&dev_attr_freq_rpe.attr,
>>> -	&dev_attr_freq_rpn.attr,
>>> -	&dev_attr_freq_min.attr,
>>> -	&dev_attr_freq_max.attr,
>>> +	&dev_attr_act_freq.attr,
>>> +	&dev_attr_cur_freq.attr,
>>> +	&dev_attr_rp0_freq.attr,
>>> +	&dev_attr_rpe_freq.attr,
>>> +	&dev_attr_rpn_freq.attr,
>>> +	&dev_attr_min_freq.attr,
>>> +	&dev_attr_max_freq.attr,
>>>    	NULL
>>>    };

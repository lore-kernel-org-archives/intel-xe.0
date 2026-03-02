Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 398FCD58E7A
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 07:50:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE80210E1E4;
	Mon,  2 Mar 2026 07:50:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LfRM8e79";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C169A10E1E4
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Mar 2026 07:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772437815; x=1803973815;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jke9HjvQqozBWSO1m9rrXbxSmJTW28ndLbpvwO9M+OY=;
 b=LfRM8e79iYUOnD9qYPLA3L8RedOJ5fzwd9BVRwOq0XN+Ba4supjzF0V2
 t7GRZA4xLPDvIDvukbxl7GePoRYBRz/Kpn/GfBQ00U24HBqMF8arLhnTa
 2YaWH189WKJd40ELmLZcAbL8+0+L6R7xzuhU4k+rlgV0hROqEZFZwu4Eo
 lmn9AxPUQ3xCEKm1vdT7iu9PI3cDc1rGxopYRVNpiuLFz0SjQKP6GJyv4
 glEl5UuqavHp4gSeef/ny/lfZpAsmbhhjMG8U0byq2VvFrfJzrgzfg3pe
 F3T6LbBbpOZVG2FKa7rlLDfrsMMobsuk312UE8FHCBe4fUCG8f7ODX8WU Q==;
X-CSE-ConnectionGUID: gbNRpR81R0CCpzWv8SLe5g==
X-CSE-MsgGUID: RBngTHU/Sa+F2KPQAnN2bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="73402953"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="73402953"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2026 23:50:14 -0800
X-CSE-ConnectionGUID: Av4ysfl5TkOn06TxWQ7BvA==
X-CSE-MsgGUID: pQ1WtcCbTc2KJTV+78Dk4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="216799633"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2026 23:50:14 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 1 Mar 2026 23:50:13 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 1 Mar 2026 23:50:13 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.40) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 1 Mar 2026 23:50:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j1mrfvCAwh6luS3RSFVE98zrF4tGULSH7ERe3gYt5VXjxGEKzb5SRXdcBahrWYaAEtTALBPnm3E5/tIcoVVCol+3MJ+VUQwsehs2v3wk9fqVR2mPPC1U01iZsEhAARcEg0Qve2aN/EjJOBRfJaxAre14g7aM29X5O/GQw0naQY9GvqO0FK9Nsxqm++TE0VkEiODtxuW0fkImaUAqVxo74ogx19XTMhrxTEtonwoso677Ga6OzDHI2JX1kj6myl+YRQxShpN+pSXJO03bTI9fkcPVnCpXMzLlLDraVwekfIT/8/sJAZeGd9+weDFj1IS0y1QjuzbBs9VEEEROKmOd/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1EU50Ss8TRZlQIzCjoTHDVEQbw1bn0G0PXPsYCgW8T8=;
 b=bTEZvo5Sg81vNhpyYWnYSVpL67UyTLrb63yEbg5e0SlCVf8bnN6LudyNKbu58N9SkF4vpLbMertOTN20EgUdwQMtQbDSnB37FiHXFxYls7WkItVPPM7QlbLBd+UB4J1ywZqB+J3vQoxcVBa5BT/bOvfIrXaP5JzlUMWl/TOPjjShCRXFc73ZJbSnvWqj25thqkV1tLXs85HrxsCLEj0Aa9B+vrsMCyrecdWLkg39j+eosUYzSyEq3bZ+e1oQJTWRrdJcDWcQSNM69SDFVDJLOoe0MAFyR9B0ohTainmmrmKjr6r6plJk0vf2zQajwpD89jjOvaB1QLj44iyTsEc/OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN6PR11MB8146.namprd11.prod.outlook.com (2603:10b6:208:470::9)
 by BN9PR11MB5322.namprd11.prod.outlook.com (2603:10b6:408:137::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 07:50:11 +0000
Received: from MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::a086:2649:bc88:db7d]) by MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::a086:2649:bc88:db7d%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 07:50:11 +0000
Message-ID: <711d1ca5-25ed-4518-8282-ec52251cc094@intel.com>
Date: Mon, 2 Mar 2026 09:52:04 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [v2] drm/xe: Allow per queue programming of COMMON_SLICE_CHICKEN3
 bit13
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20260217083436.1101287-1-lionel.g.landwerlin@intel.com>
 <20260217235140.GT4694@mdroper-desk1.amr.corp.intel.com>
 <5be3aeea-9822-49bc-a9f8-e28c64a1db80@intel.com>
 <20260227221231.GQ52346@mdroper-desk1.amr.corp.intel.com>
 <20260227221703.GR52346@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <20260227221703.GR52346@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0048.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::10) To MN6PR11MB8146.namprd11.prod.outlook.com
 (2603:10b6:208:470::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN6PR11MB8146:EE_|BN9PR11MB5322:EE_
X-MS-Office365-Filtering-Correlation-Id: d7849ce7-340a-4061-3ec0-08de783054d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: ZCHBkXeg59W8dF/iBYtYsnOmJZhKSX65b8f82R7Lx1OcAh7hJwFzk2yXwIuvIdh16vo1G5vbZFd9Yn6uQHkMY3Y2IbrUEso7HD5Sh0G47qHz1LAjQ6pVSxZ8hOCq8/37vkeNXrTmg52G/PwobtCUBGnjDDAVBq3Q9ee8ujTJNRZhBEReaN0IlpGwTjzHjTpx0b9eiwppvdQl/b8l1IRTQofk/xnkdeeTQsPBUazgMv3I3bkpgLQpLrK5mLpyz2BHz9pafjHUVpaBZm+Vdw1EKMIefuzYP6BVqT6XCejup1dz+AU3XNCcgw4Y177GZH7AprnVjjX/VWHG09Sk8NVV1Wv/IptsVhxv0aWXn5+Hjl6ye9+Y2GR6AcDcRsRosWRdNBnoT1+gffYbofiNLGqiYc6krDCWehVPxEOntnGxBRHS3rv/lZ55Wsm0TjCF+Zy94DAjKsfL1XdWvV0wkkG9k+yoYIpl4XYQ9LCLd5kQBgPXmyGDCQdlD3IM2EQRkIzCkcqZnxIA97JOn8vsGmg/swW+ajglSlxN61OYb/OodOt1ht+d3gIwPeM30SBQxiCqgLm13Afk8mxCoCZS9Yx84bPIv5GGIBym1YquuIYyDPkNKmA1NTsgJY8DcI58RvwRzSnbot+Ut0CDEBP7H8DrbxBp9CyIGRXyfSxiDlEn3UuMT2N7Ga6WWh/7LFkQoCLcNdVPT3RVt4ejsmFU0L3DnkbW8rYQwzFxzegiOgKgQkk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN6PR11MB8146.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UldYZ3poLzBKZzNYUFg5ZmZvL2NlUkN0YTYvaEtTUkpiRUQrOEg1cFlhTXk5?=
 =?utf-8?B?WE52d201a3B4SXR3ZEhOanV0bVdjMldzYkV1RDJFUHN5SUh5bmV0bzlRZ0VW?=
 =?utf-8?B?dUNHRFdXWFR3WU5uRWFOR1hFdUs5SDh5bnA4bXlvdzhTYUpVMmdHZjNoZC9I?=
 =?utf-8?B?YjkxRytrbEo2RjJ6Q0JiWENKRFJCY2ppVHg3c0I2SGkrVWt5d0lDS1NjenlW?=
 =?utf-8?B?WGFHSEQxOCtZMEFzalA0R3FLS1prVmxVQXZWZVQ2b0RpVXFDVmo2eFRDVkNn?=
 =?utf-8?B?MHdtdGpEWk01U2JRUGZXYWNpVGdYTDdzNG5jQ0RkTDQxZUlnbjFnRi9DWXRT?=
 =?utf-8?B?ZTlqNGtQdDU4NDJLa2MxY2xOSytiVERuT05FWEhZMEpvQUhtNXUxNnZyZ0pR?=
 =?utf-8?B?N1gySmFhazZPUTJhODNuWmk5a2hEN2Vrd3BUSkJLeHpkU0UyeUF5bXAwOEIr?=
 =?utf-8?B?ZktrVlExSHgxUmFBRUNibnFSVGNVWnZ3aHNiRGg5anYweWpxTnBkMXdaWU5R?=
 =?utf-8?B?M3JhMm5ubnRDYjFuSkR6eUZPcWpTcDRPanEvY0FzLytremVRRkNsVXFkdy84?=
 =?utf-8?B?V3h6UFlWa2FvWklzc25haUl1TWtGck9lK21acDRhN1VoUk0rWVRNRVphMGF3?=
 =?utf-8?B?ZllFM1F6VmYzZEU4OFdwYnN5bjJEeXdZTFd6UmFhQUZUbEppOU5IVTFVbHRu?=
 =?utf-8?B?OXJKSEFHUlpBY1Vmc00yTWp5K2VRa2h1QUZaZ2I1OUNUZ3RFeUFRNkFCUGVX?=
 =?utf-8?B?OEpLQVF0aW4wUmVtanRzYjNhanEwVENML0poTzM0YldTZm5CTkJoM0JKNFNk?=
 =?utf-8?B?a1ZJajZyTHBMNnJhWDUyNVRieHc2eE5waW9mUXlYMmJwbXZ6WlNyRmdWdUF0?=
 =?utf-8?B?TEpKekQ1a1NXOEpDQXJEQzEzenhjdHRHZ2s1NWJyVjhWdmtqVmFRbU4yaVpR?=
 =?utf-8?B?MHp3WDFTdkpHSUdhd0NVeXJPMy9yNVJoMnpNeUlTWGZWUTdQTmw5TitVMVFP?=
 =?utf-8?B?TzR2K2RhaUkyaWRuM082c0drKzB1b1kzTUlaSld4NlJtaURHdHI2dUVKcWxt?=
 =?utf-8?B?aVVDZVJjZnBvUGJHOEx5NVBtN0lhRCtEMktIY1ZQTmo0eHRvdlRza3I1bUZX?=
 =?utf-8?B?ZVJPazB0d1VhUlpHY0thdXJVcC93b203N2tpcm1RZHRZV1NtV1VhNVJ5SzF2?=
 =?utf-8?B?UE5CQ1ZIUmxXWE5oZlBsY0ZWWHJCcU1BTldQRmJaTWFoMWY1UTlMVmE0TWRj?=
 =?utf-8?B?b0JoRUM2MWY2aUZQYVM1RXN3QXZwbURFc3BJdVVtQWdEc0NkTlRTUDh1RmRy?=
 =?utf-8?B?R1QxbDdpZzFyME1qdnFyT1BCaUZMNGtXWTZXNExYNFNCeUVXYjNpOUJpUDhz?=
 =?utf-8?B?dzFUc0NWZG1HaUNBUHNUMHJmcmxBMllTZURxb2lrMlBUa25LcmZXM0pGcVNJ?=
 =?utf-8?B?eGVhUFNSdFZ1MENvdkw0OC9wd3hEZVJxVmYxc01ZSVRHcGpIbmVkejFmdUpv?=
 =?utf-8?B?T3pIaXMzWi92Mnllbld2NGJWU1hUbVZ3WnNPUG1ScnR0T200ZEw1OTlXRXg0?=
 =?utf-8?B?ek14dzBjNVUyb05VRi9PTCtXZHhlK0VJamRVbWQwNmdZRXBzMlk0YjJKZmdw?=
 =?utf-8?B?Z0ZJZStBd1NyenNBdkxQaDBERTNKVVR5MWZnTUhkanZWLzhobjFiZ2Rmc2Jp?=
 =?utf-8?B?MFVsRk92ZUpGSzNNVTR4NTk4MUx1RVZySGNobDdERVA4NGlZYkZrT2hqY210?=
 =?utf-8?B?TUUrb3lESmN6d1Y1YmRNN3NIL1JSY0ZXRjJSMGswa1IxQ08vZ3RpalJRdG8r?=
 =?utf-8?B?WG5FLzlkRHYrbmp3cEpiV254U3hsa2ZqenhyT2J0WGFFWjJXdGVhMUl6bUNO?=
 =?utf-8?B?VStlSHJjNUJiZ1BlaGk0d2dEKzU5NUVsVFZwUFZVVDkyY0hmTFg2Q3ZjdzNi?=
 =?utf-8?B?cUJjVEpxNHNFNkNPVGVhTllydU9vZTBLYmUvOW95WWFxV0JaUzlKV0dKSDJY?=
 =?utf-8?B?R3pLczBrZVArV2tKYlBpOTlUazdWWS9sOXJENTR2UWc0S1pjOEs3bEVKU0k0?=
 =?utf-8?B?UTBGdnZ3bnIwN3paUnNWOUo3ZE8zWDRRUWZnS0FWWG1nOFlsTUhybkdZVEJJ?=
 =?utf-8?B?MDkxaGdVSDZtK0JpZlJqbU9ySmVtNC83MW5iTGF3Q2l2Y1B2TDlQeC9aNWVs?=
 =?utf-8?B?V1FHbnFGOUszVDJYVEk5YUZpUytCVENYMFJHTW4vd0FKQVJlK2hZdXBlcVI5?=
 =?utf-8?B?R0RWMWx2TkRpN3ZGVTZOa05qSVRRWXpYcHhodEwrN0pXbkZ6UjhhcEQ2TVo2?=
 =?utf-8?B?aG4xYmlJcUlnVHRIRnBRNDN1QVNhTzB3QkM5ZnN3NE1iRktHdmlwa0V5ZWkz?=
 =?utf-8?Q?hplG+8jwKxwg33c0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d7849ce7-340a-4061-3ec0-08de783054d6
X-MS-Exchange-CrossTenant-AuthSource: MN6PR11MB8146.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 07:50:11.3111 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y3k0or1Gd6PopxDT89PXr2sOt5YiRi+HUNCCDjMv0JXY0rPQ44/FSMynilw+gdXlyIh2Z6HWQ60MzU/Mw216W2wa5QW70Hke78kDuF/YORw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5322
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

On 28/02/2026 00:17, Matt Roper wrote:
> On Fri, Feb 27, 2026 at 02:12:34PM -0800, Matt Roper wrote:
>> On Fri, Feb 27, 2026 at 10:42:41AM +0200, Lionel Landwerlin wrote:
>>> On 18/02/2026 01:51, Matt Roper wrote:
>>>> On Tue, Feb 17, 2026 at 10:34:28AM +0200, Lionel Landwerlin wrote:
>>>>> Similar to i915's commit cebc13de7e704b1355bea208a9f9cdb042c74588
>>>>> ("drm/i915: Whitelist COMMON_SLICE_CHICKEN3 for UMD access"), except
>>>>> people have decided to not rely on putting the register on the
>>>>> allowlist for UMD to program and instead have context/queue creation
>>>>> flag.
>>>>>
>>>>> This is a recommended tuning setting for both gen12 and Xe_HP
>>>>> platforms.
>>>>>
>>>>> If a render queue is created with
>>>>> DRM_XE_EXEC_QUEUE_SET_STATE_CACHE_PERF_FIX, COMMON_SLICE_CHICKEN3 will
>>>>> be programmed at initialization to enable the render color cache to
>>>>> key with BTP+BTI (binding table pool + binding table entry) instead of
>>>>> just BTI (binding table entry). This enables the UMD to avoid emitting
>>>>> render-target-cache-flush + stall-at-pixel-scoreboard every time a
>>>>> binding table entry pointing to a render target is changed.
>>>>>
>>>>> Bspec: 73993, 73994, 72161, 31870, 68331
>>>>> Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
>>>>> ---
>>>>>    drivers/gpu/drm/xe/regs/xe_gt_regs.h     |  1 +
>>>>>    drivers/gpu/drm/xe/xe_exec_queue.c       | 18 +++++++++++++++++-
>>>>>    drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 ++
>>>>>    drivers/gpu/drm/xe/xe_lrc.c              |  9 +++++++++
>>>>>    drivers/gpu/drm/xe/xe_lrc.h              |  1 +
>>>>>    drivers/gpu/drm/xe/xe_query.c            |  2 ++
>>>>>    include/uapi/drm/xe_drm.h                |  8 ++++++++
>>>>>    7 files changed, 40 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>>>> index a375ffd666ba2..80a438e51419f 100644
>>>>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>>>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>>>> @@ -178,6 +178,7 @@
>>>>>    #define COMMON_SLICE_CHICKEN3				XE_REG(0x7304, XE_REG_OPTION_MASKED)
>>>>>    #define XEHP_COMMON_SLICE_CHICKEN3			XE_REG_MCR(0x7304, XE_REG_OPTION_MASKED)
>>>>> +#define   STATE_CACHE_PERF_FIX_DISABLED			REG_BIT(13)
>>>>>    #define   DG1_FLOAT_POINT_BLEND_OPT_STRICT_MODE_EN	REG_BIT(12)
>>>>>    #define   XEHP_DUAL_SIMD8_SEQ_MERGE_DISABLE		REG_BIT(12)
>>>>>    #define   BLEND_EMB_FIX_DISABLE_IN_RCC			REG_BIT(11)
>>>>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>>>>> index 66d0e10ee2c4a..d3168353fcaaf 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>>>>> @@ -292,6 +292,9 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
>>>>>    	if (!(exec_queue_flags & EXEC_QUEUE_FLAG_KERNEL))
>>>>>    		flags |= XE_LRC_CREATE_USER_CTX;
>>>>> +	if (q->flags & EXEC_QUEUE_FLAG_STATE_CACHE_PERF_FIX)
>>>>> +		flags |= XE_LRC_STATE_CACHE_PERF_FIX;
>>>>> +
>>>>>    	err = q->ops->init(q);
>>>>>    	if (err)
>>>>>    		return err;
>>>>> @@ -850,6 +853,17 @@ static int exec_queue_set_multi_queue_priority(struct xe_device *xe, struct xe_e
>>>>>    	return q->ops->set_multi_queue_priority(q, value);
>>>>>    }
>>>>> +static int exec_queue_set_state_cache_perf_fix(struct xe_device *xe, struct xe_exec_queue *q,
>>>>> +					       u64 value)
>>>>> +{
>>>>> +	if (XE_IOCTL_DBG(xe, q->class != XE_ENGINE_CLASS_RENDER))
>>>>> +		return -EOPNOTSUPP;
>>>>> +
>>>>> +	q->flags |= value != 0 ? EXEC_QUEUE_FLAG_STATE_CACHE_PERF_FIX : 0;
>>>>> +
>>>>> +	return 0;
>>>>> +}
>>>>> +
>>>>>    typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
>>>>>    					     struct xe_exec_queue *q,
>>>>>    					     u64 value);
>>>>> @@ -862,6 +876,7 @@ static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
>>>>>    	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP] = exec_queue_set_multi_group,
>>>>>    	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY] =
>>>>>    							exec_queue_set_multi_queue_priority,
>>>>> +	[DRM_XE_EXEC_QUEUE_SET_STATE_CACHE_PERF_FIX] = exec_queue_set_state_cache_perf_fix,
>>>>>    };
>>>>>    int xe_exec_queue_set_property_ioctl(struct drm_device *dev, void *data,
>>>>> @@ -946,7 +961,8 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
>>>>>    			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE &&
>>>>>    			 ext.property != DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE &&
>>>>>    			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP &&
>>>>> -			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY))
>>>>> +			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY &&
>>>>> +			 ext.property != DRM_XE_EXEC_QUEUE_SET_STATE_CACHE_PERF_FIX))
>>>>>    		return -EINVAL;
>>>>>    	idx = array_index_nospec(ext.property, ARRAY_SIZE(exec_queue_set_property_funcs));
>>>>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>>>>> index 3791fed34ffa5..f4f72d01eb8c8 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>>>>> @@ -134,6 +134,8 @@ struct xe_exec_queue {
>>>>>    #define EXEC_QUEUE_FLAG_LOW_LATENCY		BIT(5)
>>>>>    /* for migration (kernel copy, clear, bind) jobs */
>>>>>    #define EXEC_QUEUE_FLAG_MIGRATE			BIT(6)
>>>>> +/* for programming COMMON_SLICE_CHICKEN2 on first submission */
>>>>> +#define EXEC_QUEUE_FLAG_STATE_CACHE_PERF_FIX	BIT(7)
>>>>>    	/**
>>>>>    	 * @flags: flags for this exec queue, should statically setup aside from ban
>>>>> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>>>>> index 38f648b98868d..a962ac2bb7ca2 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_lrc.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_lrc.c
>>>>> @@ -14,6 +14,7 @@
>>>>>    #include "instructions/xe_gfxpipe_commands.h"
>>>>>    #include "instructions/xe_gfx_state_commands.h"
>>>>>    #include "regs/xe_engine_regs.h"
>>>>> +#include "regs/xe_gt_regs.h"
>>>>>    #include "regs/xe_lrc_layout.h"
>>>>>    #include "xe_bb.h"
>>>>>    #include "xe_bo.h"
>>>>> @@ -1447,6 +1448,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>>>>>    	struct xe_device *xe = gt_to_xe(gt);
>>>>>    	struct iosys_map map;
>>>>>    	u32 arb_enable;
>>>>> +	u32 state_cache_perf_fix[3];
>>>>>    	u32 bo_flags;
>>>>>    	int err;
>>>>> @@ -1579,6 +1581,13 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>>>>>    	arb_enable = MI_ARB_ON_OFF | MI_ARB_ENABLE;
>>>>>    	xe_lrc_write_ring(lrc, &arb_enable, sizeof(arb_enable));
>>>>> +	if (init_flags & XE_LRC_STATE_CACHE_PERF_FIX) {
>>>>> +		state_cache_perf_fix[0] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1);
>>>>> +		state_cache_perf_fix[1] = COMMON_SLICE_CHICKEN3.addr;
>>>>> +		state_cache_perf_fix[2] = _MASKED_BIT_ENABLE(STATE_CACHE_PERF_FIX_DISABLED);
>>>>> +		xe_lrc_write_ring(lrc, state_cache_perf_fix, sizeof(state_cache_perf_fix));
>>>>> +	}
>>>> This will put instructions in the LRC's ring to update the register.  So
>>>> when this context starts running, the context switch will load the
>>>> default value of COMMON_SLICE_CHICKEN3 from the LRC's main MI_LRI
>>>> instruction, then these commands will run to update the value, and
>>>> eventually when we context switch away, the modified value will be
>>>> written out to the LRC's main MI_LRI instruction so.
>>>>
>>>> That should work, but wouldn't it be more straightforward (and more
>>>> consistent with our other LRC initialization) to use
>>>> xe_lrc_write_ctx_reg() to put the value we want into the LRC even before
>>>> it runs for the first time?  That's how we poke several other register
>>>> values into the in-memory LRC during init.  There's a
>>>> xe_lrc_read_ctx_reg() you can use to get the current value for
>>>> read-modify-write purposes (see the handling of the RUNALONE flag for an
>>>> example).
>>>>
>>>> The only quirk of using xe_lrc_read_ctx_reg() instead of
>>>> xe_lrc_write_ring() is that we'll need to add a #define for the dword
>>>> offset of COMMON_SLICE_CHICKEN3 within the LRC since we don't have that
>>>> defined yet.
>>>
>>> I'm not sure how you make this work.
>>>
>>> The current register you place like this from the host, their location in
>>> the image is know and doesn't change.
>>>
>>> I can't say this is the case for COMMON_SLICE_CHICKEN3.
>> You'd find it by looking at bspec 65182, although it's a bit annoying
>> since you have to manually count up the values in the "# of DW" column
>> to find the proper offset.
> Now that I think about it, we could probably do something on the KMD
> side to make it easier to find these offsets for people who have access
> to the platform in question --- we could add a running offset to
> to /sys/kernel/debug/dri/0/gt0/default_lrc_rcs and such.  I'll add that
> to my todo list, since it may come in useful in the future.
>
>
> Matt


Nice idea. I'm afraid you're going to find out it's not stable across 
GPUs and it'll be rather annoying to have an offset per platform.

Hopefully I'm wrong.


-Lionel


>
>> Anyway, it's not a big deal.  We can always switch over later on as a
>> follow-up patch if we decide we want to.
>>
>>
>> Matt
>>
>>>
>>> -Lionel
>>>
>>>
>>>>> +
>>>>>    	map = __xe_lrc_seqno_map(lrc);
>>>>>    	xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
>>>>> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
>>>>> index c307a3fd9ea28..083a2167aeef8 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_lrc.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_lrc.h
>>>>> @@ -49,6 +49,7 @@ struct xe_lrc_snapshot {
>>>>>    #define XE_LRC_CREATE_RUNALONE		BIT(0)
>>>>>    #define XE_LRC_CREATE_PXP		BIT(1)
>>>>>    #define XE_LRC_CREATE_USER_CTX		BIT(2)
>>>>> +#define XE_LRC_STATE_CACHE_PERF_FIX	BIT(3)
>>>>>    struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
>>>>>    			     void *replay_state, u32 ring_size, u16 msix_vec, u32 flags);
>>>>> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>>>>> index 34db266b723fa..5927eaf792efe 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_query.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_query.c
>>>>> @@ -340,6 +340,8 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
>>>>>    			DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT;
>>>>>    	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
>>>>>    			DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY;
>>>>> +	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
>>>>> +		DRM_XE_QUERY_CONFIG_FLAG_HAS_STATE_CACHE_PERF_FIX;
>>>>>    	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =
>>>>>    		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
>>>>>    	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
>>>>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>>>>> index c9e70f78e7238..856838fcadd89 100644
>>>>> --- a/include/uapi/drm/xe_drm.h
>>>>> +++ b/include/uapi/drm/xe_drm.h
>>>>> @@ -406,6 +406,9 @@ struct drm_xe_query_mem_regions {
>>>>>     *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT - Flag is set if the
>>>>>     *      device supports the userspace hint %DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION.
>>>>>     *      This is exposed only on Xe2+.
>>>>> + *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_STATE_CACHE_PERF_FIX - Flag is set
>>>>> + *      if a queue can be creaed with
>>>>> + *      %DRM_XE_EXEC_QUEUE_SET_STATE_CACHE_PERF_FIX
>>>>>     *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
>>>>>     *    required by this device, typically SZ_4K or SZ_64K
>>>>>     *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
>>>>> @@ -425,6 +428,7 @@ struct drm_xe_query_config {
>>>>>    	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY	(1 << 1)
>>>>>    	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR	(1 << 2)
>>>>>    	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT (1 << 3)
>>>>> +	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_STATE_CACHE_PERF_FIX	(1 << 4)
>>>>>    #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
>>>>>    #define DRM_XE_QUERY_CONFIG_VA_BITS			3
>>>>>    #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
>>>>> @@ -1279,6 +1283,9 @@ struct drm_xe_vm_bind {
>>>>>     *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY - Set the queue
>>>>>     *    priority within the multi-queue group. Current valid priority values are 0–2
>>>>>     *    (default is 1), with higher values indicating higher priority.
>>>>> + *  - %DRM_XE_EXEC_QUEUE_SET_STATE_CACHE_PERF_FIX - Set the queue to
>>>>> + *    enable render color cache keying on BTP+BTI instead of just BTI
>>>>> + *    (only valid for render queues).
>>>> I'm not sure if this is the best name.  The bspec indicates that
>>>> 0x7304[13] effectively *disables* "state cache perf fix" which was only
>>>> intended for DX11 scenarios and shouldn't be used elsewhere.  So it
>>>> seems like the name here should either mention "disable" or should be a
>>>> more descriptive explanation of what actually happens when we set this
>>>> flag (e.g., "xxx_USE_BTP_AND_BTI" rather than using the vague "PERF_FIX"
>>>> terminology).  The maintainers may have thoughts on what they want to
>>>> see.
>>>>
>>>>
>>>> Matt
>>>>
>>>>>     *
>>>>>     * The example below shows how to use @drm_xe_exec_queue_create to create
>>>>>     * a simple exec_queue (no parallel submission) of class
>>>>> @@ -1323,6 +1330,7 @@ struct drm_xe_exec_queue_create {
>>>>>    #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP		4
>>>>>    #define     DRM_XE_MULTI_GROUP_CREATE				(1ull << 63)
>>>>>    #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY	5
>>>>> +#define   DRM_XE_EXEC_QUEUE_SET_STATE_CACHE_PERF_FIX		6
>>>>>    	/** @extensions: Pointer to the first extension struct, if any */
>>>>>    	__u64 extensions;
>>>>> -- 
>>>>> 2.43.0
>>>>>
>> -- 
>> Matt Roper
>> Graphics Software Engineer
>> Linux GPU Platform Enablement
>> Intel Corporation



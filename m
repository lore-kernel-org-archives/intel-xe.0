Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6765FC4167B
	for <intel-xe@archiver.kernel.org>; Mon, 11 Dec 2023 11:14:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BDF110E3A9;
	Mon, 11 Dec 2023 11:14:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31E5010E3A9
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Dec 2023 11:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702293242; x=1733829242;
 h=message-id:date:subject:from:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Fy9kzWMCbE2bKGiFlppsdydWqq6fKJ7tI6Sd8hiyGdU=;
 b=RhxkxFUOXb52dEs7DKRpzRbmtgBIBc3d5jZH1EQYknVwBu4F9I5a+yQW
 pfrFZErph9jGN5J04j2W8NwvBQo6Iw0LFj8p7v6rTTlRY8vokufekQDqs
 kiCdlbpscCXZ9WUuMYoW2DQuy80U82gHAmZwagOEFqdOsHX7j9r38Wvb9
 Dnk5TtGXWxuavX7DXnd2/7qlq9ctfbW2Ckm/3aq/SI4ysMAbJ613VsZRW
 D+YImviDblFtQqraiNzj/kUVNeED41H41E7CFknDRbHoGNeXYrIMnkLjw
 VdDDPGMuKaUvGcrWE0Tho0QcmoJ1tpkyGqfB7d5GC4KutywCrkW3SM0Aa Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="398485208"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; d="scan'208";a="398485208"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 03:14:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="749252014"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; d="scan'208";a="749252014"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2023 03:14:01 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 03:14:00 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 03:14:00 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 03:13:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IBDHvW4tHHH2L0HQEipSbXMHiKDkdVIZuEgUJzbN7pISp0Ege6ilW+Kr3W6Y0Nh08099WYymYHHhoewfxyctM96RI63NV5M5akhnynkTK3EoF/OuQhKxtIOc7lDYBo+xghRWOGLhshbmgwZWU7ClU7PeTBL3cScDbdMJq+m2fri9IQtMUrZb103KR9LoWmJKMMQODdheO/6z/NX22XJKvJ88r7n9+3KXAU3rENo9gsLwIpYBvUFPUm6ZSMx/KxQlFr+8AAGTiX/QK/355o2TvR1Y9XnxPn6EsdASrR+SWpsTO1CSot4k4m/0aRpIje0NKzBtn/29sSPf8aRBJRRujg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uSJdI/lBN8D2HT4N+DclKlW1NCGBUXuUd9AKlrUTviY=;
 b=ZBQ2TOm/EcGf1ZrUzWYDt5kgdgKSLh10bPJfoojWDw8KjnjZbf2fTq9KmBrhojZzE/lTQwi1vi0AZY8SUVRQZfwXgix48i+DfNS7HXF1Qjzo0WiELDI4R6YJ/U09zaavLaTgM2IiyI+ykJUHKilyPb4Ak+x8IMV8Uyj8YyRGSdDlyPB7ecbdmC/CefPOZUEkce8SHRM7BuHi2yYuWN04X+ixhM9rK9RnjLEgP4xLinN7Vk6Aznr0gZbnTmyL+vQhigD685bmwcerZY5CPCAmvznCHAcVOuDzmqX5trC9Etu4qCcZocnPnA+cTXdGU3lB7hGQvrCWddRrYgXi/hPBdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 BN9PR11MB5353.namprd11.prod.outlook.com (2603:10b6:408:11a::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.32; Mon, 11 Dec 2023 11:13:56 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6%7]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 11:13:55 +0000
Message-ID: <34645f28-31dd-4d1d-9839-c2b149813d1b@intel.com>
Date: Mon, 11 Dec 2023 16:43:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v3 1/2] drm/xe: Add a new memory directory under tile
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Sundaresan, Sujaritha"
 <sujaritha.sundaresan@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
References: <20231207151739.1241374-1-sujaritha.sundaresan@intel.com>
 <20231207151739.1241374-2-sujaritha.sundaresan@intel.com>
 <SJ1PR11MB6204399019B23285D88A04B1818AA@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <692a9b93-dfba-43b9-a838-9e4cd20fa093@intel.com>
 <cb403e6c-cca5-4495-b1d1-57b38fffdaab@intel.com>
 <16f7e629-98da-456c-9506-27448c8246fe@intel.com>
 <DS7PR11MB61976F9270AF44005B1DD97E818FA@DS7PR11MB6197.namprd11.prod.outlook.com>
 <4f61addc-ce03-4ff9-a82e-bd6294893e3a@intel.com>
In-Reply-To: <4f61addc-ce03-4ff9-a82e-bd6294893e3a@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0055.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::30) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|BN9PR11MB5353:EE_
X-MS-Office365-Filtering-Correlation-Id: e4864532-79a3-4025-2af4-08dbfa3a4373
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: srl9Cf8Ele0NRsC0zuBkVonSt1JgTUhPxQ7wpzCu5bf8k+celEDSXxWWgNiehhkowkV8Aycq/HlckvoHhaNIMT+7FCwK4W1Z8eVMWzo2997P7kiXD7/m2aHYz7Cj5buBhUvdfvbgmh15EB/DqDz2SQsU7clmZntv/p5t/aYE/+0eEkNZpWzNjnJ5hPRkYqYwHbDWCVzjQ8c8dR3+OLicRDX7g1Pld1oYqnFGidfiPJUIROIhyQsNsvGLOVXJI2J489dneOKKdhRUw3sLBZe0V1AXv3dOpI0iQwGrqcN3FMA0anIQaZFQIst65vT2AuxHzstEny8eUaEiAgWu73Q5zFfVTSiDU57dSSLOE6JzNYoS5cfPah8oylQoWkzWCUDIVwtM9fhEmSfHkuk2KopJN0uH6mm6ZJYAt6eCkAcWkaLsC2nEO+pE+Z61KbiQ3CKTK3rkrrxaHTTw82YNMOod/b3JXcTfmvNI3J9ybciZonjbPZkGgApbNzrlNDCC5O5ikncs8oJgI4PafmBK5xc4RYe8kARcLV8e7YpHSgHoT6w2nFPEiC9hMXjN6Bb4yvA6Er5rh5PFsYMzJoDB2eaIR0yBr40I+l7T0mL3RuCGF2LcKtoNIa9XLTPJ9RLeeVP6xaVmacdIOUE2MHXmkUtDig==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(376002)(39860400002)(346002)(366004)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(6506007)(2616005)(53546011)(31686004)(6512007)(36756003)(6666004)(478600001)(6486002)(110136005)(316002)(66556008)(66476007)(66946007)(31696002)(86362001)(8676002)(44832011)(82960400001)(38100700002)(8936002)(26005)(83380400001)(5660300002)(41300700001)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2FLR1pUcDJpcC96K0hWbmgxbzgyb1M1N0VMMXk3T2xTbTM2WDVxcHpCOEhw?=
 =?utf-8?B?Mit4VkF1ZGJiTEVZZERnZkVNdEUxY1BERi90T3g0MnRvQmlncTBLcE5CNXdj?=
 =?utf-8?B?WWlvMlRsRnE1emwzVTdGSVdsbXFVQXNaVXZkOVFxdWxOWDVuYkZCSzJMNC8v?=
 =?utf-8?B?NkVwQWR3TTZlL0x0VlphQjhYb2MwR092TStoUU45bHVTSXhZRllTQk1BY0VB?=
 =?utf-8?B?WWhvY0RNeGEzdlFhN052UFJCMkJkZXJFL0l4a0Vocjg3Sjk3cE1uYjZKYWtl?=
 =?utf-8?B?WnJUQVorMHF6T012Mmp3VWJsa3RuNVJMWG02WlRYMjcwM29GWWlsRFFYcW5W?=
 =?utf-8?B?ejVvQUM0UHJNK3hHdUpWUWQxaVBNTHI2Z1pCNUovVjBzTDArcmdxeTlNSU56?=
 =?utf-8?B?WCtSa3BZOTlwMTVjcml5TmU1emtYbVRaSmMrSGFaZ2p1ekJwTnVabXp4QXBI?=
 =?utf-8?B?Yi96S0daM2QrdGdGa0pNc0FyVWdFK0pkNk8yRzR4VDhPSU5PTlZSemt0eDc1?=
 =?utf-8?B?VjZDcjRHZXlqYkl4UExKbytDTzV3Z2xLMldQcU9PWnArUnNkQWJEZzE1Ujhm?=
 =?utf-8?B?MnZMNUtnanNTck5oM1ZGSEllMDZmb2NLNnJxM2FkaW5KUWYvWHY4NjArTVM5?=
 =?utf-8?B?U251MmY2cmRrb1NldWJQYWE3RE9YV3NEWWFaVWVGL21XVjdKYzZscFNucHYw?=
 =?utf-8?B?U2hKYmVPMnZTNFlQUkNaWTBwczhHbmtKSkdJRmNVZWpwYlR0YlhlSEhMWHJn?=
 =?utf-8?B?ek9YVnYzK1ZPcStHRFptKzdpRmdkWGpkTVFqcDQ0NlZVY0pMdmhNQzNMbnh3?=
 =?utf-8?B?UW5Bdzh6SlBGYUxOdjFEbDloUlZuTnR0VkNVWEl1Um0xNWJ4TjlJalZkcEFV?=
 =?utf-8?B?Q3duY3RVZVk1NEh0MHl3ajcxR1NXand0dWwvV1RUelgwL2F4RGxoUUV1anF0?=
 =?utf-8?B?N0hTLzd0Rk16WVlRRnZDazRPbTByTDBZWXFZZ2lGUkNlNEZRUjZrd2VBRlA3?=
 =?utf-8?B?c2trZHRSMERxQXdSRGRRQ3RGNHA3ZnB2ekpDWFdwenhOM28vaWsvRkROeXBZ?=
 =?utf-8?B?NWNONGhsUDg3YXR1cGRyWnVNdWJhUVE4Q2k5b2FLbGdaNG9xNFE3Z0VrNW1F?=
 =?utf-8?B?SlpmcGJtSW9HaUhWSDJKcTdKQjlwN28zdmNNb0F1TjJsQmdUWnVYTHVuK3NN?=
 =?utf-8?B?UGY3aXZKbG5td0Z0OHpNVXFiaWdpVUdhNGIxR1pxU1kwdHZ2WktBWEExNTNj?=
 =?utf-8?B?Z3N1TWJ3L3kvMzJKQWhjZHR5VXl0cTV1L21rV3lpbDJKWXVYL3E3ZXFQV04w?=
 =?utf-8?B?dGNuOGFPdkZKc01OYjUxbnNRVzB4YkdFbDY4MjVkZXdHR2J4RXhTdXdkKzNO?=
 =?utf-8?B?YzRUN3N4ek1aclQrWkpsTGZjUXVxWXJUQXoyYlo1S0N2Z0t1bThDR0MybVUw?=
 =?utf-8?B?d1V0MmdVYUtwOTRSZk81VzRDbHB0b3FabEFkZXY3dytNNkV3MEMxMG1xQ2k2?=
 =?utf-8?B?cEEwTjczWEc3SUVEMXByU0FyK09JZFl2czM1Um5URjY3WTFuODdmVDJ5dFEr?=
 =?utf-8?B?WUNLVXNPWEtlT2dFNnZBTlViR3hiTm5ZUDNCeG9qT2RXNG5HQ2NpK3BMelpq?=
 =?utf-8?B?U1p5Zlo5R0pVUkI1U3VZWHM1OUVVZWQxb1ZiMytUT0lXQmVOaG1ZRC8zTEVk?=
 =?utf-8?B?MjlIajlMQmo0bDA2b09VeFU1NlF1dzduY2xSK05RaUkvK3VyMjBTQit0TVhk?=
 =?utf-8?B?WTZ6TkVuUEtEd2gzblJ4cnd4aFlxQ2RUUEp3VDBpczdsSEcvL3IwVk1yV0ND?=
 =?utf-8?B?ZmhnUEVKYUVGR0RSdDQ1N0xzU09uZGpjRTlsckw2dFNqVm00bnhDRTFHQ3gr?=
 =?utf-8?B?cmE0NDBUcnJ5OG5YdTZCdE96anYwRmZFVnYyVllKeit1OWx0MCswUzJ5TS8y?=
 =?utf-8?B?L1Uvc2R4Y0pFMXhWV0h0SitzcWxRMXNmQ2tXRDZHSHBhYnhKZUk3b0NCdHJF?=
 =?utf-8?B?cGJXM1FBQkROb0RoY2d5aEdreVNuNFozK09HWVBoQm13L0htbGFWOVJVWldU?=
 =?utf-8?B?azdXMmRKZzJpalhxNW9pYWI0NkZyWXNkV0NzWlB6c0FYTzdXUVlwNEhTMDl5?=
 =?utf-8?Q?gcfE471FJR2nfouYqYRwQ+Hg9?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e4864532-79a3-4025-2af4-08dbfa3a4373
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 11:13:55.3042 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9pY4m1GuIkVEfUi2ANgtXtI7X0X9/i3CvTfqEkzrEf+jyMbrHooW9opcDxvpWVnznHUInXweF4D7W/swdsfoFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5353
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



On 12/11/2023 4:37 PM, Riana Tauro wrote:
> Hi Suja
> 
> On 12/11/2023 4:31 PM, Upadhyay, Tejas wrote:
>>
>>
>>> -----Original Message-----
>>> From: Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>
>>> Sent: Monday, December 11, 2023 3:45 PM
>>> To: Tauro, Riana <riana.tauro@intel.com>; Upadhyay, Tejas
>>> <tejas.upadhyay@intel.com>; intel-xe@lists.freedesktop.org
>>> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>
>>> Subject: Re: [v3 1/2] drm/xe: Add a new memory directory under tile
>>>
>>>
>>> On 12/11/2023 3:23 PM, Riana Tauro wrote:
>>>> Hi Suja
>>>>
>>>> On 12/8/2023 1:58 PM, Sundaresan, Sujaritha wrote:
>>>>>
>>>>> On 12/8/2023 10:33 AM, Upadhyay, Tejas wrote:
>>>>>>
>>>>>>> -----Original Message-----
>>>>>>> From: Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>
>>>>>>> Sent: Thursday, December 7, 2023 8:48 PM
>>>>>>> To: intel-xe@lists.freedesktop.org
>>>>>>> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; Tauro, Riana
>>>>>>> <riana.tauro@intel.com>; Gupta, Anshuman
>>>>>>> <anshuman.gupta@intel.com>; Sundaresan, Sujaritha
>>>>>>> <sujaritha.sundaresan@intel.com>
>>>>>>> Subject: [v3 1/2] drm/xe: Add a new memory directory under tile
>>>>>>>
>>>>>>> Add a new memory directory under /device/tile<n> and move
>>>>>>> physical_vram_size attribute to the new directory.
>>>>>>>
>>>>>>> New hierarchy:
>>>>>>>
>>>>>>> /device/tile<n>/memory/physical_vram_size_bytes
>>>>>>>
>>>>>>> v2: Fix heading typo (Riana)
>>>>>>>       Fix cleanup error on unload/reload cycle
>>>>>>>
>>>>>>> v3: Fix reload error with kobject_put in place
>>>>>>>       of kobject_del (Tejas)
>>>>>>>
>>>>>>> Signed-off-by: Sujaritha Sundaresan
>>>>>>> <sujaritha.sundaresan@intel.com>
>>>>>>> ---
>>>>>>>    drivers/gpu/drm/xe/xe_tile_sysfs.c | 19 ++++++++++++++-----
>>>>>>>    1 file changed, 14 insertions(+), 5 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>>>>>> b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>>>>>> index 16376607c68f..64be1f3a38a9 100644
>>>>>>> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>>>>>> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>>>>>> @@ -24,7 +24,8 @@ static ssize_t
>>>>>>>    physical_vram_size_bytes_show(struct device *kdev, struct
>>>>>>> device_attribute *attr,
>>>>>>>                      char *buf)
>>>>>>>    {
>>>>>>> -    struct xe_tile *tile = kobj_to_tile(&kdev->kobj);
>>>>>>> +    struct kobject *kobj = &kdev->kobj;
>>>>>>> +    struct xe_tile *tile = kobj_to_tile(kobj->parent);
>>>>>> As Christmas is approaching, you might want to adjust this in
>>>>>> Christmas tree order.
>>>>>>
>>>>>>>        return sysfs_emit(buf, "%llu\n",
>>>>>>> tile->mem.vram.actual_physical_size);
>>>>>>>    }
>>>>>>> @@ -36,8 +37,10 @@ static const struct attribute
>>>>>>> *physical_memsize_attr =
>>>>>>>
>>>>>>>    static void tile_sysfs_fini(struct drm_device *drm, void *arg)  {
>>>>>>> -    struct xe_tile *tile = arg;
>>>>>>> +    struct kobject *kobj = arg;
>>>>>>> +    struct xe_tile *tile = kobj_to_tile(kobj->parent);
> Also, check if kobj is not null before conversion. As we are continuing 
> with init even if kobj creation fails
>>>>>> Ditto
>>>>>>
>>>>>>> +    kobject_put(kobj);
>>>>>>>        kobject_put(tile->sysfs);
>>>>>>>    }
>>>>>>>
>>>>>>> @@ -46,6 +49,7 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>>>>>>>        struct xe_device *xe = tile_to_xe(tile);
>>>>>>>        struct device *dev = xe->drm.dev;
>>>>>>>        struct kobj_tile *kt;
>>>>>>> +    struct kobject *kobj;
>>>>>>>        int err;
>>>>>>>
>>>>>>>        kt = kzalloc(sizeof(*kt), GFP_KERNEL); @@ -64,12 +68,17 @@
>>>>>>> void xe_tile_sysfs_init(struct xe_tile *tile)
>>>>>>>
>>>>>>>        tile->sysfs = &kt->base;
>>>>>>>
>>>>>>> -    if (IS_DGFX(xe) && xe->info.platform != XE_DG1 &&
>>>>>>> -        sysfs_create_file(tile->sysfs, physical_memsize_attr))
>>>>>>> +    kobj = kobject_create_and_add("memory", tile->sysfs);
>>>>>>> +    if (!kobj) {
>>>>>>> +        drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -
>>>>>>> ENOMEM);
>>>>>>> +    }
>>>>
>>>> There will be an empty memory directory in case of igfx. Should the
>>>> memory directory be created only if there are attributes available?
>>
>> Yes I think it should be taking care of all conditions which 
>> physical_memsize_attr sysfs file was created with.

Yeah it needs to be as Tejas suggested.
Should be under the same if

>>
>> Thanks,
>> Tejas
>>>>
>>>> Thanks
>>>> Riana
>>>
>>> I can have it added only if IS_DGFX if that works.
> 
> Move the documentation of the physical_vram_size_bytes to this patch
> 
> Thanks
> Riana
>>>
>>> Thanks,
>>>
>>> Suja
>>>
>>>>>> { } is not required here.
>>>>>>
>>>>>> Tejas
>>>>>
>>>>> Will fix all of the above.
>>>>>
>>>>> Thanks,
>>>>>
>>>>> Suja
>>>>>
>>>>>>> +
>>>>>>> +    if (kobj && IS_DGFX(xe) && xe->info.platform != XE_DG1 &&
>>>>>>> +        sysfs_create_file(kobj, physical_memsize_attr))
>>>>>>>            drm_warn(&xe->drm,
>>>>>>>                 "Sysfs creation to read addr_range per tile
>>>>>>> failed\n");
>>>>>>>
>>>>>>> -    err = drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini,
>>>>>>> tile);
>>>>>>> +    err = drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini,
>>>>>>> +kobj);
>>>>>>>        if (err) {
>>>>>>>            drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed,
>>>>>>> err: %d\n",
>>>>>>>                 __func__, err);
>>>>>>> -- 
>>>>>>> 2.25.1

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 793E5C4167B
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 03:19:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37ED610E178;
	Mon, 27 Nov 2023 03:19:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7069710E163
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 03:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701055170; x=1732591170;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=fDCJVk729qeSNdT3oDdOmjKWtfIL3ySjLhyMhTs7oHc=;
 b=cbtYyedG1Rmd+Ofmm3imMi7iPJZoZa67U6HVVzIThi1DfnRc9XYzfUhD
 bW4gFrHQnC5S/hpaaazDH1ujJH7gGJOvueLgFzDNVXctOksY4XB0PJoHM
 RzE7c6j0/cCJ/Kx92UeeoED3xkqnSoWyCxcQuruLBMLuV/05WjopxdUTU
 rCRFgMIRjX6pbedK+lodVOcYPxa4LjzfC0AGl9SCgswWr0PSksqAUUobh
 hyTA1nJCGkCFA67rudBuxA6IrD2n0F/n93UMD32hBs5akXWd/lVEXhvGG
 wZzkmT/oJN1jtSSPQu2bWSfQQ59mOjiKtKjJuFEeEOf69f2pGGqZ2Ues6 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="14188521"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; d="scan'208,217";a="14188521"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2023 19:19:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="717909561"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
 d="scan'208,217";a="717909561"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Nov 2023 19:19:29 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 26 Nov 2023 19:19:29 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sun, 26 Nov 2023 19:19:29 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sun, 26 Nov 2023 19:19:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YJQnb9wTw+jLjknQo5j3/jCS9QZXm2meckRjt4T6p15TXK8H/ofPwmfz5QgxjSQik2LR/3s6qKUzqrB9GfpExsNQX0fHCtnKbqVIuoKYOjJGxVVdG97ZePo7lnOdjFi0M7ZdUQEU+4Z1PdIMkLa4826AF6MH9Z3T+znScSSvgZsJHOn0sMPoJxd5INJ5wWXwh1igkW3Nn23e7mkfO4NBdKixp9me6wK+Z48pIr7/3XqFQkidfYHsD5rTsd+wz6Ni3arx1JFFFgUQJ7jT4qi8QcIdToSRTeuovg5tU9EoZUsMYDwAxWTxNgVFFur1zyroX/SeoU7eyQidnuzXwqlZvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NSpFY2+BntScoaHAauOqixsdwnoW7rMEKZzts9QQT6Q=;
 b=R1Tvj4w/IrjAwVke2CnohTZzzsfcjpVrzJpcwOkagPfmPBQk5+CynrVTLK3UMfb1JHCfVHMqAbs/N9ZieVFDQZHChrbp7sjvGmtOk3i96apFlf+3JnnfJNCANWQiazSUb5G4s2phWahe6K54Fros4nQH1d+YNW9PDPLchee2neoNTmR/bCv6b49CxhLGmNukFibVQvZAirET0BuHc2Yt8REK7eMx7DKq2t0orcniA67jygZvWfzOrJQ/4130dtd26M3fg7ES0zEZeOeJSlXQsDphQlwjGUAgi1V7/5vSrICO/gTWJm6UVJXn9NO19Y2VX+YGQ3e0pM3J4MPAqr8VCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by IA1PR11MB7269.namprd11.prod.outlook.com (2603:10b6:208:42b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Mon, 27 Nov
 2023 03:19:21 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8844:2d91:a510:af3c]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8844:2d91:a510:af3c%4]) with mapi id 15.20.7025.022; Mon, 27 Nov 2023
 03:19:21 +0000
Content-Type: multipart/alternative;
 boundary="------------Ep6kWQvGKAYaUFBacEB3wJ4m"
Message-ID: <64d14c6f-ceef-4193-9a35-bfd1f6e7c9da@intel.com>
Date: Mon, 27 Nov 2023 08:49:14 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231121100906.3587649-1-himal.prasad.ghimiray@intel.com>
 <20231121100906.3587649-4-himal.prasad.ghimiray@intel.com>
 <797b983ed6313c2866c8b02aa73a5cab1fc4d4a3.camel@linux.intel.com>
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <797b983ed6313c2866c8b02aa73a5cab1fc4d4a3.camel@linux.intel.com>
X-ClientProxiedBy: PN2PR01CA0145.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::30) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|IA1PR11MB7269:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fb39ed2-ba36-4fe4-b99c-08dbeef7a5d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NmeT+cdaBqWwiYKrFqByQAAvG2+qWky3pgPx5JnRnHSWoDMyKqvC+8LgKvRgDrPJkF0hsQcfYOBWS1vGdtI2udJ++Jzgy2a93fhbSbDXc5urRmz7AXBHBxw2EOstiFsdF/UGhr4d0Oe7tDnPkh2aHHjG4R9WyWgByzmusUJxbZiexU/tpsgX3/jrzMu0ndC80KLplzQgEciIUTng4Y4pz59WS0UcVoRCidiH0+lzPDp2pxz/8Jpa9s+Rzbn9Rr3kmHEGp74Mq4SNkvPv33S59Zc4rxfgdLOPHYInr7jIec0p2fwlGUYQCtuRq8h3WiAlddACgBCf2mxgXcv6ETIAvwFjA2FRVidJvcVMM7a98RCEEzrihMlQNGQNFUqj2FSwiay5LjYJSgLt8+igSzXanIkWqWEQeOC1mJdpwb+FIGTkDUsVcTxZmA+OIKYXV3hEZxrD84QwIOf0ZZ0tRGdAD/43qyQIYMLlxn711ZX9uTDaTYwk4X1pjxJV/Zxec0obbxrQ+tC8HVBjpi+wmb7rdnjK0EYmP/GRvZBZj3yMZGZGxzE6dpk7aYQV8HflO4sYj05uzhvx7sAECxVvI6/UMU89Cs860+T2FHkhRIfUxxqfc+et4ItdSbaCUuJZI1ADhGbYp1JJzNs2iUCMq9TRXA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(346002)(366004)(39860400002)(396003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(38100700002)(41300700001)(36756003)(31686004)(4001150100001)(2906002)(83380400001)(5660300002)(82960400001)(66574015)(26005)(86362001)(2616005)(6512007)(53546011)(6506007)(33964004)(6666004)(8676002)(8936002)(31696002)(6486002)(478600001)(66946007)(316002)(66476007)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmhkUWhWRUYyYnQ5djB3OVJaRXkrdlAwQ0k0T0ZBQTBvdzBxSGxJWGZjL0FR?=
 =?utf-8?B?ZndmdjNabDlpeE9Bem82dDlQNGNDNDR1NFR5YUJTcmM1OU9xZndVYVR3ZERZ?=
 =?utf-8?B?TTh1NEluOGljVHF4V3QzUUZ6NVdjTTlvOEZPRExhRTY4VmdnK0hWWUZTaXA0?=
 =?utf-8?B?TUJvYnlXYjlFK0dxTTN5ZG9RdUF2b2JGL1p2SHRJSzhvdTV0ZUd4MVMwQkN2?=
 =?utf-8?B?eWoxRlc4bERJMWRCWFVORTIxN3QyaFc4dG83YWxhSXRicDVHS3QxS2RxVlE1?=
 =?utf-8?B?NXQ2Ujd0RStSd0lTZE9BZFRNUWp2ZzJSZjRGRnJTQ0U4MkphK0VIdkl3Sm5K?=
 =?utf-8?B?NC8wdjdQVjMzOHhzNUVwQldSWUVNVFcyOVU3QUd0MTVhdyt6aVQ5bFU3aC9D?=
 =?utf-8?B?WVF1d25NSUdQTXpmTUh1SUZtTFNJUjhhYlRiQ2hwNjlZa1dUd1dGdlhiNi9p?=
 =?utf-8?B?WWIxR00vODBmeCtlSmVPSUQxVFJaOHFCMk1xSE1XeVExTi9yRzkrRURUaHhW?=
 =?utf-8?B?eGFkMUp4TUtIZ25LRjBNeEpCWmpPeFhKMzdiOEUwaGdRbUR6MmQ2TU9TTDND?=
 =?utf-8?B?YWMrZHkrY0xIaUUvaXdJdTYyR1F6MW92ZTdlamgrK1ppNUpDNFVzYkEyQUdJ?=
 =?utf-8?B?VC9YR2IzcGd2NmZMWm0zQVQrWnQvZlVoK0EvZkYvQXM1VTI1MkhnK3YwSzZk?=
 =?utf-8?B?cXFYRlcrdDdWMHVhc2Zmbzg2U0xKcDRGcHBwd2dIY0VLc1ErT25NQXlzUDRr?=
 =?utf-8?B?cWZvOElnVTRUSFlSSUFha1Zrazl2eFlWMUp6Q0ozd21RbmpDRTI3U2QvbGtu?=
 =?utf-8?B?ZmhNcjVQcDZsUUhTdlRTVDcya3V2MU96ejZCSU9pR1RIME8zYjdMeGJHSjBN?=
 =?utf-8?B?U283ZzJEb2lockF4dGo5OWdYZ2NxSExDSkFDRGVsdWlSdnNmVllQMS9WYjVl?=
 =?utf-8?B?Tnc2UDBRODRKai9PRGlvM2JvdHNGLzdvSkFXVGF2Q1hPSlFucUNLR3ZCT1Q4?=
 =?utf-8?B?YXYvUmhpMkpwRGhyYmwxK09jNkJ4MnJ5Vm1FMVRqQkpDajgxMDhpeFQwYUh3?=
 =?utf-8?B?NXVCSks4QW04UDBhTVV0Q0EyR2JQM3RKMlRjQjAvU096RnpPaWNlbnF3bW5z?=
 =?utf-8?B?VW5OWU1NTGxaQ2gvSDNCb1lhTVB0bm5CaUlHK2RFMTBOcmxqME1xREIyUlhi?=
 =?utf-8?B?ZWJ4YndQd2p1RWlteEM1UkFyTHhna1ZSTlZ6aVpIbGFCdkhBaWMrM0Yxc1A0?=
 =?utf-8?B?TUlFeTErc3ZMeXY4MFNDOFE2L0ZEUFV5N2N1OEQxbnZidDFhRVRPSDNXWW9V?=
 =?utf-8?B?Tnlza1hWcHRaTFh6OVNGaSs4aEttSndRNmdoKzRmMzRnZzg0QjR6YjNHTkZI?=
 =?utf-8?B?M2NZNWQrc3ZrQnB3elRydE5jTUpMZEpZVklhMVZ4bkxtaFNNMDFEUU5neXQr?=
 =?utf-8?B?QUlMMmZ6eGxxNzNvWjlGZXMvV2VCOTFlT0xIemEwTGxGZUdSTjJCaGdGZUty?=
 =?utf-8?B?R2JNMWNBbFVJcGV6RklwUndkejZ1SWNxYzExR0tZaTNhZ2tJY0c0bTU5WGI0?=
 =?utf-8?B?dHhPazkrekJ6MHZTUjJsYWZ3bmJhSmhPYnpNcGFySzVXRVpremsyOXFUWStE?=
 =?utf-8?B?aVQyRHZYRDlUVktMUG5ycXZwSldkUmlQUCtyZFQzdkFybitBUFhDRElQam15?=
 =?utf-8?B?R0dzMi8vNmszcHgyZW01Vys2WkFCWUQ4VDJiM2IxbFFKVjZ5T0lkMndncGVU?=
 =?utf-8?B?RW85Rk84d0gvaUlOWHJ5VHFYeFRvYUFrVFJ2UXVOL1NSVDBjU3Rydi9mM2Jr?=
 =?utf-8?B?NHh3bUg4c2dPdUp0SVl0ZjYyM3lrMG82L1ZZUldwNkNJeU9DS3drYkRsMXFJ?=
 =?utf-8?B?RjJkc2dVdkxLRkRwUTJyTGFOTEF5bzhLWlU3VzlQb0xRZUdrUitRK0pDZEFI?=
 =?utf-8?B?RGNodmh3Q3MxWS9NY3ZySWV4OUQyL00zRTBaMlNJL0VId20yOXBjd1Axck05?=
 =?utf-8?B?N2hhbHVKYzBJWmlMd3B2RDV3b2x6UGVpYThTMHlHaXNGUTlKdURwWjBLWEsy?=
 =?utf-8?B?QVBPMWtUUzBDTVcvTnFSaXphbzlhRzMvTkFDSTVTZUxHWW1taEVMcGN4WUN5?=
 =?utf-8?B?ek9HR1NkOERrSzE3NzZsOGg2dTUreE42M25tbzNDN1NGY3l5U0U0MXlDOVlK?=
 =?utf-8?B?SkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fb39ed2-ba36-4fe4-b99c-08dbeef7a5d4
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 03:19:21.2567 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BOoZNNhrJgEVdfcSW+X8mNLOdS9UoHpSd44AJwIsQ6nKqYjF+oWR6SDkvAEekptxausSCjCHY5lKjDagh9McTf/nkxW9j+qaqO6S0Sf7g0M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7269
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC v2 3/6] drm/xe/xe2: Allocate extra pages for
 ccs during bo create.
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

--------------Ep6kWQvGKAYaUFBacEB3wJ4m
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 24-11-2023 16:39, Thomas Hellström wrote:
> On Tue, 2023-11-21 at 15:39 +0530, Himal Prasad Ghimiray wrote:
>> Each byte of CCS data now represents 512 bytes of main memory data.
>> Allocate extra pages to handle ccs region for igfx too.
>>
>> Bspec:58796
>>
>> Cc: Thomas Hellström<thomas.hellstrom@linux.intel.com>
>> Signed-off-by: Himal Prasad Ghimiray
>> <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_gpu_commands.h |  2 +-
>>   drivers/gpu/drm/xe/xe_bo.c                | 15 ++++++---------
>>   drivers/gpu/drm/xe/xe_device.c            |  2 +-
>>   3 files changed, 8 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>> b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>> index 4402f72481dc..7f74592f99ce 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>> @@ -16,7 +16,7 @@
>>   #define   XY_CTRL_SURF_MOCS_MASK       GENMASK(31, 26)
>>   #define   XE2_XY_CTRL_SURF_MOCS_INDEX_MASK     GENMASK(31, 28)
>>   #define   NUM_CCS_BYTES_PER_BLOCK      256
>> -#define   NUM_BYTES_PER_CCS_BYTE       256
>> +#define   NUM_BYTES_PER_CCS_BYTE(_xe)  (GRAPHICS_VER(_xe) >= 20 ?
>> 512 : 256)
>>   #define   NUM_CCS_BLKS_PER_XFER                1024
>>   
>>   #define XY_FAST_COLOR_BLT_CMD          (2 << 29 | 0x44 << 22)
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index 4305f5cbc2ab..4730ee3c1012 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -2074,19 +2074,16 @@ int xe_bo_evict(struct xe_bo *bo, bool
>> force_alloc)
>>    * placed in system memory.
>>    * @bo: The xe_bo
>>    *
>> - * If a bo has an allowable placement in XE_PL_TT memory, it can't
>> use
>> - * flat CCS compression, because the GPU then has no way to access
>> the
>> - * CCS metadata using relevant commands. For the opposite case, we
>> need to
>> - * allocate storage for the CCS metadata when the BO is not resident
>> in
>> - * VRAM memory.
> Please extend modify this comment rather than deleting it
Sure. Will address in next patch.
>
>
>> - *
>>    * Return: true if extra pages need to be allocated, false
>> otherwise.
>>    */
>>   bool xe_bo_needs_ccs_pages(struct xe_bo *bo)
>>   {
>> -       return bo->ttm.type == ttm_bo_type_device &&
>> -               !(bo->flags & XE_BO_CREATE_SYSTEM_BIT) &&
>> -               (bo->flags & XE_BO_CREATE_VRAM_MASK);
>> +       struct xe_device *xe = xe_bo_device(bo);
>> +
>> +       return (xe_device_has_flat_ccs(xe) &&
>> +               bo->ttm.type == ttm_bo_type_device &&
>> +               ((IS_DGFX(xe) && (bo->flags &
>> XE_BO_CREATE_VRAM_MASK)) ||
> It looks like you have removed a restriction for DGFX here: If the BO
> has SYSTEM set, then ccs pages are not needed.

Is ((IS_DGFX(xe) && (bo->flags & XE_BO_CREATE_VRAM_MASK)) not suffice to 
ensure

that for DGFX BO is only in VRAM region ?

>
>> +               (!IS_DGFX(xe) && (bo->flags &
>> XE_BO_CREATE_SYSTEM_BIT))));
>>   }
>>   
>>   /**
>> diff --git a/drivers/gpu/drm/xe/xe_device.c
>> b/drivers/gpu/drm/xe/xe_device.c
>> index 07a3e4cf48d1..265f9ffc5323 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -551,7 +551,7 @@ void xe_device_wmb(struct xe_device *xe)
>>   u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)
>>   {
>>          return xe_device_has_flat_ccs(xe) ?
>> -               DIV_ROUND_UP(size, NUM_BYTES_PER_CCS_BYTE) : 0;
>> +               DIV_ROUND_UP(size, NUM_BYTES_PER_CCS_BYTE(xe)) : 0;
>>   }
>>   
>>   bool xe_device_mem_access_ongoing(struct xe_device *xe)
--------------Ep6kWQvGKAYaUFBacEB3wJ4m
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 24-11-2023 16:39, Thomas Hellström
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:797b983ed6313c2866c8b02aa73a5cab1fc4d4a3.camel@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">On Tue, 2023-11-21 at 15:39 +0530, Himal Prasad Ghimiray wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Each byte of CCS data now represents 512 bytes of main memory data.
Allocate extra pages to handle ccs region for igfx too.

Bspec:58796

Cc: Thomas Hellström <a class="moz-txt-link-rfc2396E" href="mailto:thomas.hellstrom@linux.intel.com">&lt;thomas.hellstrom@linux.intel.com&gt;</a>
Signed-off-by: Himal Prasad Ghimiray
<a class="moz-txt-link-rfc2396E" href="mailto:himal.prasad.ghimiray@intel.com">&lt;himal.prasad.ghimiray@intel.com&gt;</a>
---
&nbsp;drivers/gpu/drm/xe/regs/xe_gpu_commands.h |&nbsp; 2 +-
&nbsp;drivers/gpu/drm/xe/xe_bo.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 15 ++++++---------
&nbsp;drivers/gpu/drm/xe/xe_device.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 2 +-
&nbsp;3 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
index 4402f72481dc..7f74592f99ce 100644
--- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
+++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
@@ -16,7 +16,7 @@
&nbsp;#define&nbsp;&nbsp; XY_CTRL_SURF_MOCS_MASK&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;GENMASK(31, 26)
&nbsp;#define&nbsp;&nbsp; XE2_XY_CTRL_SURF_MOCS_INDEX_MASK&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;GENMASK(31, 28)
&nbsp;#define&nbsp;&nbsp; NUM_CCS_BYTES_PER_BLOCK&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;256
-#define&nbsp;&nbsp; NUM_BYTES_PER_CCS_BYTE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;256
+#define&nbsp;&nbsp; NUM_BYTES_PER_CCS_BYTE(_xe)&nbsp;&nbsp;(GRAPHICS_VER(_xe) &gt;= 20 ?
512 : 256)
&nbsp;#define&nbsp;&nbsp; NUM_CCS_BLKS_PER_XFER&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1024
&nbsp;
&nbsp;#define XY_FAST_COLOR_BLT_CMD&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(2 &lt;&lt; 29 | 0x44 &lt;&lt; 22)
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 4305f5cbc2ab..4730ee3c1012 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2074,19 +2074,16 @@ int xe_bo_evict(struct xe_bo *bo, bool
force_alloc)
&nbsp; * placed in system memory.
&nbsp; * @bo: The xe_bo
&nbsp; *
- * If a bo has an allowable placement in XE_PL_TT memory, it can't
use
- * flat CCS compression, because the GPU then has no way to access
the
- * CCS metadata using relevant commands. For the opposite case, we
need to
- * allocate storage for the CCS metadata when the BO is not resident
in
- * VRAM memory.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Please extend modify this comment rather than deleting it</pre>
    </blockquote>
    Sure. Will address in next patch.<br>
    <blockquote type="cite" cite="mid:797b983ed6313c2866c8b02aa73a5cab1fc4d4a3.camel@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">


</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">- *
&nbsp; * Return: true if extra pages need to be allocated, false
otherwise.
&nbsp; */
&nbsp;bool xe_bo_needs_ccs_pages(struct xe_bo *bo)
&nbsp;{
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return bo-&gt;ttm.type == ttm_bo_type_device &amp;&amp;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;!(bo-&gt;flags &amp; XE_BO_CREATE_SYSTEM_BIT) &amp;&amp;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(bo-&gt;flags &amp; XE_BO_CREATE_VRAM_MASK);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;struct xe_device *xe = xe_bo_device(bo);
+
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return (xe_device_has_flat_ccs(xe) &amp;&amp;
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bo-&gt;ttm.type == ttm_bo_type_device &amp;&amp;
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;((IS_DGFX(xe) &amp;&amp; (bo-&gt;flags &amp;
XE_BO_CREATE_VRAM_MASK)) ||
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
It looks like you have removed a restriction for DGFX here: If the BO
has SYSTEM set, then ccs pages are not needed.</pre>
    </blockquote>
    <p>Is <span style="white-space: pre-wrap">((IS_DGFX(xe) &amp;&amp; (bo-&gt;flags &amp; </span><span style="white-space: pre-wrap">XE_BO_CREATE_VRAM_MASK)) not suffice to ensure </span></p>
    <p><span style="white-space: pre-wrap">that for DGFX BO is only in VRAM region ? </span></p>
    <p><span style="white-space: pre-wrap"></span></p>
    <blockquote type="cite" cite="mid:797b983ed6313c2866c8b02aa73a5cab1fc4d4a3.camel@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(!IS_DGFX(xe) &amp;&amp; (bo-&gt;flags &amp;
XE_BO_CREATE_SYSTEM_BIT))));
&nbsp;}
&nbsp;
&nbsp;/**
diff --git a/drivers/gpu/drm/xe/xe_device.c
b/drivers/gpu/drm/xe/xe_device.c
index 07a3e4cf48d1..265f9ffc5323 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -551,7 +551,7 @@ void xe_device_wmb(struct xe_device *xe)
&nbsp;u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)
&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return xe_device_has_flat_ccs(xe) ?
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;DIV_ROUND_UP(size, NUM_BYTES_PER_CCS_BYTE) : 0;
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;DIV_ROUND_UP(size, NUM_BYTES_PER_CCS_BYTE(xe)) : 0;
&nbsp;}
&nbsp;
&nbsp;bool xe_device_mem_access_ongoing(struct xe_device *xe)
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------Ep6kWQvGKAYaUFBacEB3wJ4m--

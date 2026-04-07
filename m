Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 634BDFEEF4E
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 14:13:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FD7B10E423;
	Tue,  7 Apr 2026 14:13:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="niyKle8Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2414E10E423
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Apr 2026 14:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775571218; x=1807107218;
 h=message-id:date:from:subject:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=tw0e4gstY0BirdFmtrQVY4+PJ3SB63D3B9jzAR7vaVA=;
 b=niyKle8ZKmiw6bFlVyPO7l8kwMpbxSAWq0qDYJW2N3+/jD670iSrnn/X
 zLvNFWVY2DzQplHgf77ClkZ+Ze/bCQ60CrC+6wDS4KoAsXFEfl6hzPCCy
 cS6swFHn/qlnkzf1t/I0OQclBYSgurgNXsSlyfkvEe18savYoznNVz1uk
 uWeKWbNnCN+Igg6Y97nMNck6AOocni9KhUS/ub3+pFdB4UQD4T0BjDTvl
 sIXyH+GtIcPKmVkIC+DERZwbDK9tI7cNShoehUCSHXHbrMghX0FzV7gHh
 Zn15jSHM32ILQQZoUYia33n+0byOwTqVbEgPSXNwdflzkAVHhQIsGLcaD A==;
X-CSE-ConnectionGUID: 4qUWxlqaR9qMh+SJGUQ37Q==
X-CSE-MsgGUID: aOp4gj71TDqFr40F/D+B/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="76419655"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="76419655"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 07:13:38 -0700
X-CSE-ConnectionGUID: K5n9olDbRnelNYuf/FRxmg==
X-CSE-MsgGUID: F4naUJLuT22tY8TSVus+0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="223880909"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 07:13:37 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 07:13:37 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 7 Apr 2026 07:13:37 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.24) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 07:13:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MSsxJ3oJm0k9IdhixvmxoOisGbvJwTPq63xVpiHTWXlhBuBzV2WTro1BargKe9e9laXVL2LxzW085yT1JXKkG3YzZYMjif+/MMIfFT1Odh05pxhqhIhyeRq5G4Bm3dH4knYTwNF8lYnPJ5sprOb0+8qJqaD6F3yYzr83mGYMZPfv50lvIqjdMTHbpjguFIRAW+G+gOtC5UIlDH88J0lIi4+cw7bE8tVjIL+puvIiFvXaRDRXETcUKmCk40UJfLlIKQ3DzaMMUxpWgT163lXVfSvc1n3T0zldkIRe6Z4INzOmszaIY/e3aoZEB92ezUeAflYQ10GEQtsRoVs1phcq0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p/MmE1uOw1Fw6hRNxyqM9WqEQWSF5T9zBn76Ci77cHw=;
 b=jBRwho6Xu1MoTljfi9YYjb2y5dDki7/RhqchfZN6eZ7rV5hMrBGXcH3P4Re+Yy/2jmyIAGcOhRwEIoWAaShc1X+U6kQpR4+m/fZok0NdCQdFQpeFwr/wYQk4v8gOZ1u8zroIFM0VRGGaCx5vBenIphlA6o96hXf1rORnA6vTWhNif9Wq9qsd/nrH4Euedh6q+BpFb6KI5EXdiNcjpNf2c1fzLcjhzJyeF1zNER75iGQ7pPOSoh0VXTCcyKcIB5BQJhIutC7DcY32SqIlynJ+kD9yiuGUsX87ORErV3TBgW1EVvzD4M5zch2AfYxiiF+afIkbqRQFh5C8Joy+21Wutw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by DM4PR11MB6093.namprd11.prod.outlook.com (2603:10b6:8:b0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Tue, 7 Apr
 2026 14:13:33 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::e0e6:a2f:a53b:4414]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::e0e6:a2f:a53b:4414%4]) with mapi id 15.20.9769.017; Tue, 7 Apr 2026
 14:13:33 +0000
Message-ID: <4ec2ccde-730d-4579-adb8-01eabc9a31de@intel.com>
Date: Tue, 7 Apr 2026 10:13:30 -0400
User-Agent: Mozilla Thunderbird
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
Subject: Re: [PATCH v1 1/1] drm/xe: Fix null pointer dereference in
 devcoredump cleanup
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260326181017.2060209-1-zhanjun.dong@intel.com>
 <79b30bcc-b056-454b-a5ac-8035f7ce76c3@intel.com>
Content-Language: en-US
In-Reply-To: <79b30bcc-b056-454b-a5ac-8035f7ce76c3@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0339.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::14) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|DM4PR11MB6093:EE_
X-MS-Office365-Filtering-Correlation-Id: 6315729d-bddd-4618-c2a9-08de94afd9fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: CC3zJdDsYs093SXi10V7Bvu/tSxlji4mIIbG/qWO3aKact4dtaHFug36umHc5aU6OTGb94KoicDHD5jZZleAqs6fS2FTc+93cR5VBd9fJSvBG9c5XS9yKxAu2yd8HkULViIvS9qeVwqZKB7iwbP9TAek6ik7BTYRw4vOOq0EMIam1r9x821GBrlPUeP+JqLnGMANlZPKhExUwRXJUpRoNz7/flGx0totv83ry1nwnkDej3n8EY3LN+nNpXNyIsiT17F3PNh3SD6VFApVueTMOqO33kiUhtcCJMl+rFK8vTLEgCdZJlNACihTApc5bgfD/bnybBzeHRGRFBsNWJRLRXjhY7qOZoTzhWPk+0+3Ol4ATS4RaRD8tsXfmJqVJKA0Q6/kvh2F9CQnbB0qPMuDacuc2oVVsZsqLPzXo8FJQpHmNz7Ufn986s7/5j9kpk6U16hD53T8yw7onaGy5aphFPsdG/v7Aak/+iIOKUzV3nzvjI+KE/622UefrqC2maAmwyj7g7lZonED/aJvo5XsHKwwksQuOzYI4rQS4qD8CV7W2W0BPaICD1GHeD01GVfXONR9k2rEhnoI6n6vqZ0iYU89ZeCINLw2Gnqvh8jX0I9Ngr90rrxqrwHgUq/7vbSBOhDRiM05w2VATzkyf3kjuf/U0velQH3WWcM/XLsYoM0gNT3ymrCWvb/zyLx+HFlTwfmYhjepiPbdhVtYOSHrhXzDyh0ZxRmDiL9kfKPJKXc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXg1ZUNnVHVXMFc3UTJzc04yVmRLdnZvV1FIeEw1QmlYTWlOWURKRlA0Tndv?=
 =?utf-8?B?M0QvZ3pOLzllWGFISjNLeFVFMFZhNm5uZzM5S1VhU1BPTTkwU0ZNVU5Dcysv?=
 =?utf-8?B?U25HUDVubDR5OHlDdWlYSDFxcDRBbWNQOVRaVmVIczJrZzRScTRtUnVwUVZI?=
 =?utf-8?B?QlBTYVBKRHQ4MXNTSzJjZWtFVmV1OGVJK3JQcWhCeE5QdTFlQkNtbTBrcFBZ?=
 =?utf-8?B?KzdqMjZXejIvM3EzdXB6M1J3TUxlRjJibldCQmZDQU5INDBmRGJSVFhsclBD?=
 =?utf-8?B?NUZyUW1FL2EzY245ZXFleVluVnBMSU83RjdJZFVOK0Nuc2ljdGhjZUpDdmR0?=
 =?utf-8?B?RnY3SFF2UXpqMDdOMElFQVA0dVJOM0xlOENiMTFid3lvbituQjYzT1U2ckFs?=
 =?utf-8?B?dk4wbnB2RTIyaFdObjl1Q1RsZVdHRWVJdmZ0MHdtLzYzOEFoc1QySm1qbHNx?=
 =?utf-8?B?N0hBdCszSGtrN3VlZXg3SHcyMnN1ZnF1dFN3NzVuMnJlVzA1TUVnUlNLcFlC?=
 =?utf-8?B?Tmk1WmluVUZGemtXdGEvWlV3bjhPK2dQVUNRcnFqRnBUa2t1R0l2TWdDZFNE?=
 =?utf-8?B?dzFNcTZGZmVFTHFYb3RRalFuQVBkczVVOWY0cm9PcjA0Z2d0ZkpEOGRIVVZG?=
 =?utf-8?B?bzdBQ0cxcFo4MGdhVERITm5aZUlyS0N2WStpTmxubHRIb3pacFlPYS9DNXY5?=
 =?utf-8?B?cGQwNkVhMjM2RVlETE5rdWtYT1owOHNiOEloaGxlN1Q5K29qaXFTWUVCWWJW?=
 =?utf-8?B?RWxhUVNlUXR0S1QzUG5pMHNTZzlSb1pLbEVBUC93bnhnVTlhdjUwWmFsSzNL?=
 =?utf-8?B?c2N3YlpFNHdsRlFocGx0WStFYmtwbnJud3Y5QTVRTDlpcjJiamZKazlKT1ly?=
 =?utf-8?B?UVJMNE1uZmxwbXUxK2FSdzJJWGhmeWhtNWZJUmtycnRUMU1ocm1PL29zUGcr?=
 =?utf-8?B?UVNRSXBQRnZXYVlnZWk4TmZFN2VBT24wV0dXTmc5NHd2RWhTdUg0Vko4VWZL?=
 =?utf-8?B?MWdLTDB5MDVTaHIzS3NGN3pzYkxTeWR3bi85YlVsNkRZTlJQZlRKaVFXZ09D?=
 =?utf-8?B?bnB1NDllMHBiVjl6dGFnelNhWFBlRVRVc01KR2VrdlorMW9LZHRud3hONHJk?=
 =?utf-8?B?NTU0SDJhYktFaklIRVY5K0VFT1RxdnhPcnNwNlprVVRNSElvbUsyNTByclNq?=
 =?utf-8?B?ZHc2SlJRbFI4OEltN1JwcVhaUFB4NU1Rc1VzVEhhWHFxM1IwWlRaL2lWMHEr?=
 =?utf-8?B?alVBbmlTT0pqR0VraVZRMy9icUlsT1g0QWRaanlGcW56UVd2b0xhbFNZQ3Na?=
 =?utf-8?B?WkZGTHRGNVdNZ29uMHd0WEZXLzV6aDVJYmcvMzZ1SDZqdmpLMTBQbXZNZTMw?=
 =?utf-8?B?aVBzY0hOTnAzMVoxVExKS1pjenpwVkVORzhNT1F1MGhmY3VydXVnTU9TaGZ6?=
 =?utf-8?B?VWVLdlQyeTNFcVdTR2x2QUY2VGl3UFZNempGQXJ4aWZVUnVEb1IxUGI4Tmxp?=
 =?utf-8?B?M2ZXNjZGcFZZT2J4QVRreEVpR2c0UVhWaWFTK3FMSlEvempqNVZjSkRrT0tF?=
 =?utf-8?B?dG1MSGF3Z3ZreWg4ZmlVc0xtOEJoWVdHN1hjL0t0UzNNcWZxYStHNUc5eWEz?=
 =?utf-8?B?N2NsS1o2ckQzdXljV2FUOG9ML2JQOXVOYzczaFhDWm90WS9BR0ZzVVpaeng3?=
 =?utf-8?B?bjZrMGxUb2N3NmpuVlUyNjV3YUlEeWhwUU1vRjR5bzN3eS8zQy9STUlUYjdX?=
 =?utf-8?B?QzhCYzR3QU53SWZhSEc3TmpJbk5paXJ5OUFHby9sdDN1Zkw3R1dNTUpWdDVM?=
 =?utf-8?B?bnlEeitGVDZHRjV3c3NKMGVTY1huMTkzWFdZZWtpVEl3SFpHRXgxOEk0OGxk?=
 =?utf-8?B?ekRnbW1Lc2xEbFN2TWx5K2UySDduOVN2ZkJqMU9waSt2cDBQaC9KUGhiaXJU?=
 =?utf-8?B?WTdzV3JMamZUSFo3aXFUbEVwNnVwRzVoc1JXeG0wSnBMYVcwNnB1S1hxQWJo?=
 =?utf-8?B?T042aEd4ZnVTeEpneUtncTg1aFVuWnFSVm9uKzh2bXJ0cmM1WlFzU2ZxeS9B?=
 =?utf-8?B?RzVFUWR4bk5scjhmdTg1VGNuWmU1QURuT1BHcG01aWJmMDVWenFpZ3NRNzQ0?=
 =?utf-8?B?bjlTMmovbzVYWkpYalJOUUVla0FIZytrSnh2MTZTYTZKWGNibUQrTW5qZ1cv?=
 =?utf-8?B?NDdXR0lxQml1MWJRL2ZLcHhNd29TVWRZaVViNU4rZ2Npc0gzUHZwbkcvNWM5?=
 =?utf-8?B?N3RIQ3lzZHh6TzZnT3ZlbGN3MVhSZkFTVVdKOHhlZSs5cDY2ODZ6cm1ybHlu?=
 =?utf-8?B?eWZaaXFXbnd4TmtVcEVkL0FXNVlSVGE5TWtaUC82dFl3cEVwSExVZz09?=
X-Exchange-RoutingPolicyChecked: DCcwpB1EXDHj8hsizSuuejWpPJpaM1KxnZE+Ldk3LiPeLe3rMyKNHI3PgTOlCRHRMLF6y3C17ZBV4TzMOtHzg0dStWWBuMWyrhUxkaYGGLAo6nfxph7GlP0uJ9pyDTa75vkXFgk6kDOqLOVoTs6BJMaxPenxgS/wupkLkJ0N3EMmZlcpUAIrje2ISmBGWxFdG+K03/cBIFeHxRYsaulCWhbvZq3zbjYVqW+ffzEJ6NATvUDQKwFC/HVKiq7j3+LOZUxpEXmntZiSePIt6aDuTZ0YR7z1NbbPgiaNK4yaTyCQ40OlKW0wYEtR/QNPWy3BQBlPNdRYk1aPIcPd5EjGWg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6315729d-bddd-4618-c2a9-08de94afd9fd
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 14:13:33.2831 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +g3+LDrF3R2vyYLKp85PSQWlUiFInVvn8BtXwfK5XKRSZ4ZRTjklrIfQ3/UuSNuE6SCDZUF54fbixUJos/lEhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6093
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



On 2026-04-01 4:57 p.m., Belgaumkar, Vinay wrote:
> 
> On 3/26/2026 11:10 AM, Zhanjun Dong wrote:
>> In xe_devcoredump_snapshot_free(), ss->gt may be NULL when the snapshot
>> was never fully populated (e.g., when cleanup is triggered without a
>> prior capture). Guard the xe_guc_capture_put_matched_nodes() call with
>> IS_ERR_OR_NULL() to prevent a null dereference.
>>
>> In xe_devcoredump_free(), the deferred work is only queued when a
>> coredump is captured, so guard cancel_work_sync() with a check on
>> coredump->captured.
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_devcoredump.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/ 
>> xe_devcoredump.c
>> index 558a1a9841a0..ec206f512795 100644
>> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
>> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>> @@ -149,7 +149,8 @@ static void xe_devcoredump_snapshot_free(struct 
>> xe_devcoredump_snapshot *ss)
>>       xe_guc_ct_snapshot_free(ss->guc.ct);
>>       ss->guc.ct = NULL;
>> -    xe_guc_capture_put_matched_nodes(&ss->gt->uc.guc);
>> +    if (!IS_ERR_OR_NULL(ss->gt))
>> +        xe_guc_capture_put_matched_nodes(&ss->gt->uc.guc);
> 
> How about the other pointers being used here? Like ss->guc and ss->ge?
Thanks for take time to review.

For ss->guc, guc is embedded struct within xe_devcoredump_snapshot, so 
no null pointer risk.
For ss->ge, it can be null, the good part here is all functions (within 
this function) take this parameter already check for null internally, so 
no additional guard needed.
ss->gt is the only case.

Regards,
Zhanjun Dong
> 
> Thanks,
> 
> Vinay.
> 
>>       ss->matched_node = NULL;
>>       xe_guc_exec_queue_snapshot_free(ss->ge);
>> @@ -254,7 +255,8 @@ static void xe_devcoredump_free(void *data)
>>       if (!data || !coredump_to_xe(coredump))
>>           return;
>> -    cancel_work_sync(&coredump->snapshot.work);
>> +    if (coredump->captured)
>> +        cancel_work_sync(&coredump->snapshot.work);
>>       mutex_lock(&coredump->lock);


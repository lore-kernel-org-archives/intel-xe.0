Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B941C44507
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 23:25:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA85C10E0E3;
	Tue, 14 Jul 2026 23:25:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R73ZvQ3F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 828F310E0E3
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jul 2026 23:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784071517; x=1815607517;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vtT3gW/xMdGP66BkzwwoYRmXNKhpAYaLHocmH+eUvS8=;
 b=R73ZvQ3Fm6bfV3t6uXt5d52oqZ8O/Mbal+YlGW/NcSC+nHaSGfURWDPO
 UuwMRKM30ag8GEO2dxXNzwJ3VhbiuInA+bxhgkzroPKlgurBWrjanktnx
 LSLvGRZwOTe+TkPjdLfG304jZ7873ygd8jTW5gYbXTecjATFt0Dt1O8KV
 u1uwIpDh8G4l2AOWz1QUwudmLIXpr84IjR+goYHiHJp3yz+zhpMdAeQa3
 leKvNkF/QoQDEupJDB71xx+Wpn6vlW+klK49y0qhRMW9FSvnArujhJ4iB
 2Htzo//CETuWBHaTzcG30Kp/SGs4AzH2/J3XE4lMr66tf+u8vQioOSDEb Q==;
X-CSE-ConnectionGUID: xRU+H74bTM6SWwyQ4Vedlw==
X-CSE-MsgGUID: EaW2EAQ+TrGaBfNWxcx68g==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84662176"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="84662176"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 16:25:17 -0700
X-CSE-ConnectionGUID: yC7UBC6sT1S+FBNdWojhVA==
X-CSE-MsgGUID: JBhzUhYPRSOXQMCHFksgTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="294205893"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 16:25:17 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 14 Jul 2026 16:25:07 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 14 Jul 2026 16:25:07 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.48) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 14 Jul 2026 16:24:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nBT+b3bR7F15FtnT/1x4PFELzxr5UZyE+lhAN9jlOWlk+Hs6Uxk6SEv9OrHBrfAhJzmUTfcjMXlb0j50uGpZJvTKNwi18gToj3WJrquJuGn4rKU4pmwtTw60nmRDXf2kzTYkTO1sycnxfeyR28cKQwD0mH1IpMfACv4iKWRENQ/JpcdxFBdKI30vM+QoLuL7zN5nEuTTX3N3TOCnH7JPgHr21w/wqnvA4EQBt5jNYsL6xm8hkqPCZZTbJdmNN+LVy8fzx9Iq0dqqIKplePeZLrCGNjLihXnH9cP3lOV8s4s+9W10/HnFqDW6Zp5vz+LjsB89i6wK1xlzf3E/thaaZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Osa/STMI7Lx/JdZH/NAeeyxgvL7Y/u3xHo7sWdgaTX8=;
 b=iFGhcDRUI9GEDqva6kGGyV9E8GEpj1igj8QxNRGf6/IXFLpa/C4BBag6iGsogTLFZ0zhZQT+wdzXyPHqJzdJuCWDRkj0wV+XxSnu8ckMyx8fq/t8GtJQbXSbG7JfsGe6/KV2zIRO2D0g5tZCe8SR7rbz0frPdG6Rb8JpbQ6oUBXBZ0NQFpN62lSPb2RR6ND3YL2IjFtbK+qqOAzAnKuNpoVAiR9a4heY38aPX52jqWuhMPJSysLKH1lTio50VGHbBTSMZRl1oRZWXGiH0lYtd1w/FyK8aE6zENE+d/TsXUToPicnemaFnPnSYK0+N3jy9RygIRQud0j2Cp2A9Ahw4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4979.namprd11.prod.outlook.com (2603:10b6:303:99::16)
 by CY2PR11MB921967.namprd11.prod.outlook.com (2603:10b6:930:118::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Tue, 14 Jul
 2026 23:24:51 +0000
Received: from CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc]) by CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc%2]) with mapi id 15.21.0202.018; Tue, 14 Jul 2026
 23:24:51 +0000
Message-ID: <31701a38-4cd9-4e9a-bb5a-2cce86bdd258@intel.com>
Date: Tue, 14 Jul 2026 16:24:50 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] drm/xe/xe_late_bind_fw: Add support to load Ocode
 firmware
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <alexander.usyskin@intel.com>, <michael.j.ruhl@intel.com>
References: <20260709143926.3980581-5-badal.nilawar@intel.com>
 <20260709143926.3980581-6-badal.nilawar@intel.com>
 <39aab72f-e933-46d3-950d-f7575a7be156@intel.com>
Content-Language: en-US
In-Reply-To: <39aab72f-e933-46d3-950d-f7575a7be156@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR21CA0011.namprd21.prod.outlook.com
 (2603:10b6:a03:114::21) To CO1PR11MB4979.namprd11.prod.outlook.com
 (2603:10b6:303:99::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4979:EE_|CY2PR11MB921967:EE_
X-MS-Office365-Filtering-Correlation-Id: beb4ecd7-8536-43c3-0104-08dee1ff1aaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|18002099003|22082099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: pA/Sb1DXiW2gbkDEJvtWqR71xT37AVzLXiRLptVtwfeh0mt+UbB0N5eK/f02oNUSxUAFP73fcNNBsIT9xM5a0XKdFRy1LP989uPi0hbKmeCjUsdYOAPaoJr1ZavLqg8+LoxDc9O/JSBQnSGxf1plRUxh0f6BC120y1ZB8pIbexucVovbwNre5ovGQ3uEuzviL9dWhbA/JdD79e8DcL2ydBO7aN+SeGuFE7b4yAOVfda02LF/YMnrJ2a57pjQqzZP0GOBWe3OwDITZ8JsnZOmXoh1podXm9/ilMRhhMJY96NssSDgrpiSqjZnPUOH2ipsRziNUC6yZIG3X0LI4j7NFMZmgiLyrRqHmAsfEyKbfLDgX5HIUOEsmHdhnbmGX9JamTEUO7M9Cnu0jLSfkJmlLtoY8Zu5tkQ0jNl0fSuioZFngbhzZ0bEl5ZzD6TWndtnXuJUzw4TcfK+S3oJBf7FVViZLjrmI9eFulLgq/ZpZc8UVz7LaWCFgbgTHj2/zUkrWIjefnNc+gEJRmnf8l5v/eSZge9YDyi1kJYfCsQ5TcB78EBm1Zb5CoY7xGquvOMmsQrcs+xgSh/dtBy4pHg5xZb6pvhf5n0K1h8B6oeVInoKyIvs5nfTks4nBR33MWFDmhjyfUtmZ0Xh5TIMfa09FrhKQLfaULMucXHLbFo5Bho=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzNQZ1JZMmthdXdwWkxzMjVnaU9sblJnM3g1UXhYSlFRWG9ncHRTbGhtd0tC?=
 =?utf-8?B?cHVubnlMRWhYeE15bzJnZmY4d05BUzhpTkZTR3JRb3ZvTVBWOGtNSXNOM0lp?=
 =?utf-8?B?SmdCSWUwR2ZLa3p3ZUFFUjAwYUsrWWxkaWxVWlNCL3dFWkY4RXNLQ05WNlhm?=
 =?utf-8?B?WGkreXdPU3FqTGxGYUVDWTNjY2xhUjZJMmtxcms0MFBwYnJsRkVnTFZEN3Iw?=
 =?utf-8?B?c05BdW8zZDJsbDBLeC9SZElrdnBrSmcwc3BYTHBlUThrVm9FQjBzbnN5TXBp?=
 =?utf-8?B?NUY1Zkk3ZFA2bDBNYVJaSXNLOXBGMlJzdXI3ZGZFZnBkNG81UjR0dHdaRjdu?=
 =?utf-8?B?UnlVMGdKeWZ1cGpVZys4b0o0Q0FKeVJLenFGVHozWFZwVjl1S01tY3NmTkhz?=
 =?utf-8?B?ZWQzRk9IRnI3aDBwL3dYMEMwN2NzN2FuLzU3MTlBMzcyRk5KN283ZFdLS3JO?=
 =?utf-8?B?NnJPWHZwaGgwb3BmaStpakVlUnZFU2hveUJia1lDcXpmYUZETzJFRUdCajlP?=
 =?utf-8?B?S2F5dVJGcjkzNkI5VFBuU2ZaZ2dOTTdkVjVzVG14RndRckdlT2lVUVZmOWhI?=
 =?utf-8?B?aHZBVmE3ZlRBYzFBeGxxQWl0RkM3Z25HUDJ6aHlmM2tFMG9iMGJWKzlhTnlm?=
 =?utf-8?B?bithVEs4UytQaEc4TTA2QWQ0bTlqbml6S1VKd1JNaUk0dzI1Nk1XS1JUN1pB?=
 =?utf-8?B?T3BSUVFtR0lIVUZSR2t2TDVIUFFLdElvUWRTamZWazNkT1AwQkJRa1pXM3ZV?=
 =?utf-8?B?NEh5L1VZZEU4U3ROSnRLcjFvbGYvOHpaZHpacDdZMzgxR3pMVkF0NXUxQ3dB?=
 =?utf-8?B?bnBFZVo4NVJMeUFKZS9La2o0Z3UzWW4wNWptdkNiYTB0WlVKNjh1bkxSSDVs?=
 =?utf-8?B?TFU5cHFzZ2tNYnFWd0ZwVStrSDA3V3BYdVllK2lTNDZqMlEzaUpxSDMvWGpT?=
 =?utf-8?B?WTJNcFovVXdNZHVGWHdKczlLNkFEanJxY21TNFFmM2hvcFhtVFVqeGc4bloz?=
 =?utf-8?B?YWt3SDd6andYMTZXSjZUbUlIaDdTREx4NndDa3d2ZGRQZ2U1RzRNdHlVSWVx?=
 =?utf-8?B?VXhHNUkzK1EyQk9WUnJBWlN1dTdTZ25tSFhBQ25ZSmxPeHNVTmlZZ0daWU03?=
 =?utf-8?B?MWxtd2V2cjRKRm1iS0R4eGZPMU5BRnNQZFp5R05DUWY0QmlXRXlwbTFobU1G?=
 =?utf-8?B?QXBadmVsZnlaK3FUWm8xZmNneS94SjR4MmdicEIyOXNBRVhjRGg4RU9jTFR5?=
 =?utf-8?B?SVNDbU8vay84ZDYrSTJjYk9MOG5GMWpWVjBydGNpei9Vbm00bC8ydTJvN3Fo?=
 =?utf-8?B?ZnB1WjFTOThHclhudnlrckRYbVhnWUVRL0k5Yys3dCt0SzBLSXJoTVhyL09Y?=
 =?utf-8?B?Y0liaFhlRVk4b3VrVjV0ZExFd0RLKzNrWUFRREVuek1DOElFdHJjL09PaWhm?=
 =?utf-8?B?cW43WjJZY0ZzVHdmaU9vbDltWUpSdXZra1MvV25zajJyVlN6eEpTVEZBMmxW?=
 =?utf-8?B?SkwwVDJJVnBNWDAweVFtVEpOZWlvNU1EMjJiY0FGS1Qzc21yeXNkbDN0bU1n?=
 =?utf-8?B?VlNMWXNqajYwaFBTZGpXc0ZHQ01SOTF2ZEhYanl5VktNTUI3WWJKcml3RFNu?=
 =?utf-8?B?cDhKL1lRVWNkTmlaNXNmV0tDeFdObWcvZkh6S3hwWEFNazk4dktlTm85YzR2?=
 =?utf-8?B?dTUyU0lRaEw0Y1VGUUtaaEUzRUZheEZIVmxaVlVzS1F2U2NZL3JwVTA5TjdN?=
 =?utf-8?B?QnloN013UEt4YlJJcHlsUHVlTDNzUGdIZC8xclhOMFlIS1daVFgxaUlEOWo2?=
 =?utf-8?B?aGJqZVpMZFRFYi9aNWxJZkNLVCtmUGZHUlhxNSt5cVhkUGpOTys0RWUwenFx?=
 =?utf-8?B?QTBnYlI1K0xvMFJNWElWOTJ5VHJ2dmp5MXZQS0w5eTFBU2Jrai8yaC83UVNX?=
 =?utf-8?B?OE4yZ1krSExzSVROemNGMEhXU0I3TVp5NFBidDB5NktaVEhvVUJKcnVmVEdI?=
 =?utf-8?B?b3NZR0NtbjloVFBYeUxSNzJiWTBNRFRwd3ZMSWtRU1RiY0M4dTBFcFU3WlRk?=
 =?utf-8?B?VW84ejZTUElydkpLRG9BSDVHTGJHVmNzNDdURU5kUmJhMS9WNVMvOExkaXJX?=
 =?utf-8?B?dzNsTlBManVlMVE1OEswOXhHWWRHZlhYblVsVHZRb0NhU2dzWnpjT202TkRI?=
 =?utf-8?B?UHRWWlUvQU5qN0RGTDFtNDdWaitncGZoU1ErSFdJeVFrY2hVTEVLVTkyWVhv?=
 =?utf-8?B?VERFZ0ZCVWNDOVFSMzQ1SlBiNU4vK0NONXNFelF5WlBjRlBaTmd4WGlESnhk?=
 =?utf-8?B?WnhReEtYOU9Vb0xLcVJoOWNxbnVmRGhSYWxCSmVoSnM1S0pUT05ac3Rma0lR?=
 =?utf-8?Q?gPOrlEZVy2hU9DzE=3D?=
X-Exchange-RoutingPolicyChecked: KRqEN1CVW0B5MI8HDhqy92uzXT7AoXIPzcPBMOVqVIJ8OSzMbJZZlpQ+XF1wyiN33qa8irr6nlL9Te0umtfcauisUUw7k8L0HKMsOuyBaMSOqT2I1tApt/+mw2gx3wxc/l5aMXXCk8us3yDueJT1vj5BFHnqsgg+VKavpOs4cwhtbpwJbAA5Pm/9a1uxQpziTROBXgeDzkGpEzZORPJjc8AZj6SU4mqrQslFXoFi8bEc+PxK480tRJpK8a5oU8oTpmK5/O1wRpvSdm2IClVXFYTXx1nvIM/Lk+dqM2WLuqEEV3NAzXBnX83At+QYKuNdj3LfvgKMmOqmcgofMQev/g==
X-MS-Exchange-CrossTenant-Network-Message-Id: beb4ecd7-8536-43c3-0104-08dee1ff1aaa
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 23:24:51.4563 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XlkFKsK7hmrEWZVAgCVykg95xRSOZkGSwok3zW5rQ0fv+7Q534+mt6vWeL2YhclZtw+GoeMubmwgKkhLsiftQLdb7NLQJ4CpaqcjjWR0Wx0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY2PR11MB921967
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

<snip>

>> --- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>> @@ -21,6 +21,8 @@
>>   enum xe_late_bind_fw_id {
>>       /** @XE_LB_FW_FAN_CONTROL: Fan control */
>>       XE_LB_FW_FAN_CONTROL = 0,
>> +    /** @XE_LB_FW_OCODE: Ocode firmware */
>> +    XE_LB_FW_OCODE,
>
> in the review of the RFC version of this patch, we agreed to modify 
> has_late_bind to be a mask so that we could set FAN_CONTROL for BMG 
> and OCODE for CRI. Is that still planned?

Never mind, just saw this is in the next patch. sorry for the noise.

>
> Daniele
>
>>       /** @XE_LB_FW_MAX_ID: Number of IDs */
>>       XE_LB_FW_MAX_ID
>>   };
>


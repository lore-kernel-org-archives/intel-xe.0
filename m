Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03FBDC54E67
	for <intel-xe@archiver.kernel.org>; Thu, 28 Mar 2024 00:18:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5F4910EAD7;
	Thu, 28 Mar 2024 00:18:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KdU1Dvxm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D728B10EAD7
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Mar 2024 00:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711585128; x=1743121128;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GAHDV3jD30ywqP7lCtRaJv2xMma8A0fJCve0nVUAanI=;
 b=KdU1DvxmYisSw7f5mtwK66SrSYM1QpuXAgjforC5kKaRHuqv9YHkNha7
 aBlS0rxUsy+Uz7U4as9XDWe270Mze8pX8ZuwKz7/5bzRVbFDabByWdUT6
 eZz/Ucobct+3x71o6q+Rnm98WyeLSGSFUTu4gtDvRe+6muxb2PQP0IFmp
 H5pJ7kcgYGCrovBElZvHSwEeVzvmAij9pPCOeCwz3qgIwMQ2VpmV8mDoj
 X5eOrKEsE3obgxMi8XTI0YUMZe3y6CvvJ0xxf80UAa4L6B6Vc7jRePh9D
 bC8GXa79GbLOuZNRiep8HwZb10AfQaEcsdU3PtYn0ldHn9XMTNvWwkxTP w==;
X-CSE-ConnectionGUID: JXxe7YTJS5qCT1KA9dvXZQ==
X-CSE-MsgGUID: HSHMbtrFTVSJfTwUZqZZ/Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="6580162"
X-IronPort-AV: E=Sophos;i="6.07,160,1708416000"; 
   d="scan'208";a="6580162"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 17:18:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,160,1708416000"; d="scan'208";a="16373600"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Mar 2024 17:18:47 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Mar 2024 17:18:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 27 Mar 2024 17:18:46 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Mar 2024 17:18:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f1NU9vdjneGDjgjlvKEaoe5UtJqs7UFOJmXMHt4FXKaII3yvwP6awjEHnj54xfj7ZKJ4jieyt+LUJ49isXk0FKXqpIU5pXgoTxJklrjUHAbUIv0eIB0LE+gZSgJ3LShBNJq6Dg+fKFVEiTbXm+TOlCNQp8LGVVYD+2WvYSY9givYwOOYyI+L/xjvuL/f8ax/MsWU1qObLwloASn/ZMgFyIPTIkSZ1yWu0Pfk/X90SNe4RlD/a8mdpjlncI3J1eKXLovx48R2WJ1ulsJH5EhtMVWztLgklUnLybnXRJM8PqCQ1783CIY/NbpffTVKVNk9UcS6yu5C7+LuogPwP9p31g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DqH1EQ49pAdq22bd4vRYI2rtKCbxGrj8DuIPPDoC1Mg=;
 b=H3ShcUQRcTAUAnL+jmhAKzHTkukeIWdWPry/8uPF7s08CwPCDPI5MH6PTVI54ib1CpHE7Eg6V1vCNW/HghCIFZ8uYRCMerfBbDqph8IXcOHXMFFm2e1JkBm061suCnPKsociBd7Ormp3jayBSCmPFgEddvtdt/mxXvsIPNQpFY8pyLB0VrBW5/nWBa9X2Rg6Pi41EC2ETGNnlLXgom0JEhhZ+vAyDzgTOxRx5IvL6xIaC9hQJ/ckp8JEbVH3mQAqhmtCrdrtp23bjRBMw0qqK4HC4GWOxuT2h/G268+Px8rOllOVcOQldVp3o/D1kQv3lyBmMd3dDB0jpfaiE5jAxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by DM4PR11MB6066.namprd11.prod.outlook.com (2603:10b6:8:62::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Thu, 28 Mar
 2024 00:18:44 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b%4]) with mapi id 15.20.7409.031; Thu, 28 Mar 2024
 00:18:44 +0000
Message-ID: <977df4d7-507f-453d-a388-85c366c9174b@intel.com>
Date: Wed, 27 Mar 2024 17:18:41 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/xe/lnl: Enable GuC Wa_14019882105
Content-Language: en-GB
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, Badal Nilawar
 <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <matthew.d.roper@intel.com>, <daniele.ceraolospurio@intel.com>
References: <20240325150435.2967536-1-badal.nilawar@intel.com>
 <20240325150435.2967536-3-badal.nilawar@intel.com>
 <29f52749-032e-469e-9cae-cad1f01896fd@intel.com>
 <2636ee70-1b30-4f05-8448-3453d8f7e155@intel.com>
 <97e2b27c-4d1c-4eae-8902-5dd84702995d@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <97e2b27c-4d1c-4eae-8902-5dd84702995d@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR11CA0072.namprd11.prod.outlook.com
 (2603:10b6:a03:80::49) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|DM4PR11MB6066:EE_
X-MS-Office365-Filtering-Correlation-Id: d8d62a34-4be5-4023-a441-08dc4ebca0fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7xJHQQST5h7zT8kKxPn0xjmOVMbuR8XRIJDi7c5v808Kpj8ZXVivoAtFcceHm89yZAorKAWOR2JqAIGfZSMZaoDqbtJdjdQJ9stMWuLtXZ4QN3TmtgLbhj4ZVdXWRw6M5WO8OpkKTGqCSE4xax4HJ38C/2o34+shzehId2sp2lUt+H+ShpYC6CCr4+ag5RmCfwJmDBQJruB1fXfUJFD794riV8yeG4/BKum+ATUjV0FdcOPSSVR/ZsPXC3hfQZYM3tL32SklLW61q9KhXfqLXoLymTAsoIUjaQDAy/I9yPsoiuNiuupvyIY5BozbaPockmDClcEjHzWtkri5/yTs6AAox1TTZhElp9uXZvxlIKf7ew3cx6LGaQOMeeC+fRqIWHPPa8UMtECtTDDlorP6BWUmCcDOF5qzkPUP36LSot9zo/1lu8dy4+pnxQ4DHUoi3L/JnTaiFe56c6aVmuf4nZb5WIv1GarphASNXMMFhWl9+V9twN0cEnukjLLT75d9HHkIY2uNgrzLn+wGaGhW5zjzKen8cE98ZTgMi9/epoec9DaStkI18KF8srYIDxJRtiUS/qrnf5w3kdjk1EaJqxk8cDepW5PU7KkbblVKBUMB1TkCbnz7pdMAkPYFXci9POj4LeWhdJlsv1XxXrHezP445JMxIEnJy0TiuED4nvA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWFkeGJ3eDRQcFphTXd6cGJzTmVhNVJ3S0xDRmxEY0VhS0NqenpHT2RuUTY4?=
 =?utf-8?B?SysxbXBvWnNwcHZhVnQ0WHNQL3hoblhiVHo4bUV1czhvYzVCQ09EbUVscXVR?=
 =?utf-8?B?TjRWYnJwUHh0TjJVMGRRR2hncndqOXpWWExTUDU2Qk5RV1FoZ0hkbExEeXE2?=
 =?utf-8?B?MzZHYXlDUjloU0tLMUk1cURDVEM2Q2lvYXhJUnVGUlo2djJ1ZGtybnY5dHQy?=
 =?utf-8?B?MzlBSE1aTGdxdHZSbmtXV3lHTkk1MnphRGZXa0tNeTR5K0pLbkYxZytEZUVw?=
 =?utf-8?B?UlNVR2pKQzJYTmJ3ZkNIaERSd1Q2Q0k3NGhIa3lHQWEza3p5bVpsVmhtL2R0?=
 =?utf-8?B?bnJCWFlHMmMwdm5xNUIva0M0QzVlQ0haSENZVmo3cm02eUNmcWt0dk9GNGsx?=
 =?utf-8?B?V1E5NzhZM0szQkJDN1MyaUZya1ZvUTB1dG9KSzY0cHNwbk5MTVVsVCs5V1hw?=
 =?utf-8?B?dGNIcm1haHBTTjJsM1puWVVuMVRqSUMwdUQ0UUUzWHFCa0dIcFVueVF6cnN6?=
 =?utf-8?B?RUM0MkR0R0pOaWJhWjByS1V1WHN5djVROENEZGFLbFl0QitJbFVNT05aZ1VS?=
 =?utf-8?B?cjFsR3FWUjVRSzdhMVc2Mm9EdUFIeUNQN2ZJRFdVckJqQnZldDhDTmxHaUF1?=
 =?utf-8?B?WGlhRTdVTUJBcnlXRUF5ZHpFN1E4cm93clpzdXBmZ2ExbWt6NVJZaktOUVdv?=
 =?utf-8?B?SFdaSnA2Z2VtZnNnbEQyY0Frd0w3d0h6UHU4bUVVblNWRzIvSlA4YUE1THZr?=
 =?utf-8?B?OWNvcWV5T2tKcGVuamVMQTg2Z3FjbHJrcDd6MEN0WU84S2FKTVg1aVRBUmNO?=
 =?utf-8?B?bUJlZTFiOHRzMUxydFZoNjNvRW00MmdsUTN3RmVRNEJEWUM2QTI5YnRSUzg0?=
 =?utf-8?B?NCthMW1QZmZ2eThqNHpvTEZDRTlDZkMxNURwUk1YUjJsL3FuRk9BcXMxTFFW?=
 =?utf-8?B?OXVyVThzaHdXV0hvUWUzUkI2R1lTZHp5NWY3UXVySXJtNE56NFlaOHdjTGEw?=
 =?utf-8?B?bWhNdDdreEZaL3RBZmdGS3NndjhVeVZVSElVRmlYNmlBVVFSamJZYjZreVI5?=
 =?utf-8?B?SExVZnFCS1kxQ2lHZVNpOVo1eE14SlA3Q2NSYUhaOHlVZkJjbzNiZVpEeTI5?=
 =?utf-8?B?aDhhQmxpL1lqWVU4NzJNSVBVNkNhalhnUzNSdXcwTkJDWENQQjY4aVp6NFBX?=
 =?utf-8?B?UjYyK1hkbVZUNzQ2YmZ6bG00L1FEZ21lNDlSNTFhMHJzRFgyTUIxRXVFbjhx?=
 =?utf-8?B?aTJZNHZvTTF5clVSSDFTL0JxaXNhTmp3SmdlZDk2SUJhRUtxQlVVR1VjYmVw?=
 =?utf-8?B?U01oVnhkcG93ZUJlWDU1anRFWDVHTFROQ2xEbzBRcXdvZTQ4dDRhVENPc2dI?=
 =?utf-8?B?d2ttRjJ6aDNNRi8xNzVVUWtSUmlwZWxsSWF4elFZWUVVOXppMDlhbGJjUnpi?=
 =?utf-8?B?dzRJUmZNUys2L3lvYi9NTFpYYXJRcHFNVUdtVVpXR1BWZkZtME9lNkd1RHRH?=
 =?utf-8?B?TVhWV2ppV1RoRmNmL283TDVCZ2hPdzhLbzk2WE4xYy9Hd1lOV0l1aS9aMHpL?=
 =?utf-8?B?THA5TUtDRGZ0OWZBOEJReExueDJOaEhOZGtSN21lL2tCVGtybUVJdUZIS2N4?=
 =?utf-8?B?bXN4LzZZYmc2clFxUjhGVG15KzFtb2daK1BNeUZpWFNLd1Joakt2UFp6Unk5?=
 =?utf-8?B?czBpekwxRDR2dStKSGVNMmoxeHVIOVZKdHRNN3g2Rlh5RGFRQzkxZGRMQ0Zl?=
 =?utf-8?B?MStNVnlVbkNWRG44TVUySVA3d21EWXkybHlRQVcvOFVmVWgvb1hZZkFqL010?=
 =?utf-8?B?c3BlN1FxZ3ZybXdRUXN2Mjh1cTNQaEdiNXlLTTMxQ2pRWmlkY2dGUHdNZHlx?=
 =?utf-8?B?MUY2NWJXS3JRbnJmWk9WTUNaK1pZRlpIa0xGdGVwZ0tYSEt2SDhIbC9SRWtN?=
 =?utf-8?B?bnVtNHhFY3RUK3BQTmpwamJFUVFTeWtZNGNKazN4ZEpCRElERUJ6N2g5QzAw?=
 =?utf-8?B?T0NnVFEwZTNpdGxKWjV5OGM0RXZ5VTB0eWE1a3pXUWU3NVZGQm1lbHd6L2NE?=
 =?utf-8?B?U3kra2hCOVlzMWlCN1hxWGR1ZmNacjBpNnV6Rlg0S3ZCQkVXQlVTMFJ5dEZZ?=
 =?utf-8?B?SGJycDB0Ly9qMldnTk5NeTV5T1lnVitxOWZBV3dPdUI1SDZvQlp0SWNweWh0?=
 =?utf-8?B?bGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d8d62a34-4be5-4023-a441-08dc4ebca0fc
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2024 00:18:44.3334 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: onAjhaMurD7xBLNeymzcELygESAL40rw5ET4s+Sp3BkPhGTI4hus8mbKA30G175zFiknwnJaHp2Ut6gbwrYL/bSCYcCBCxY1iKPoa9YaakI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6066
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

On 3/26/2024 04:21, Michal Wajdeczko wrote:
> On 25.03.2024 19:56, John Harrison wrote:
>> On 3/25/2024 08:32, Michal Wajdeczko wrote:
>>> On 25.03.2024 16:04, Badal Nilawar wrote:
>>>> Enable GuC Wa_14019882105 to block interrupts during C6 flow
>>>> when the memory path has been blocked
>>>>
>>>> v2: Make helper function generic and name it as
>>>>       guc_waklv_enable_simple (John Harrison)
>>>> v3: Make warning descriptive (John Harrison)
>>>>
>>>> Cc: John Harrison <john.harrison@intel.com>
>>>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/abi/guc_klvs_abi.h |  7 +++++
>>>>    drivers/gpu/drm/xe/xe_guc_ads.c       | 41 +++++++++++++++++++++------
>>>>    drivers/gpu/drm/xe/xe_wa_oob.rules    |  1 +
>>>>    3 files changed, 40 insertions(+), 9 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>>> b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>>> index 0400bc0fccdc..5dd45e06f0b6 100644
>>>> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>>> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>>> @@ -319,4 +319,11 @@ enum  {
>>>>    #define GUC_KLV_VF_CFG_BEGIN_CONTEXT_ID_KEY    0x8a0b
>>>>    #define GUC_KLV_VF_CFG_BEGIN_CONTEXT_ID_LEN    1u
>>>>    +/*
>>>> + * Workaround keys:
>>>> + */
>>>> +enum xe_guc_klv_ids {
>>>> +
>>>> GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED
>>>> = 0x9002,
>>> how should we know the LEN of the particular W/A KLV ?
>> By reading the spec.
>>
>>> as this is the ABI header, IMO we should define that here along the KEY
>> I strongly disagree with copying the entire GuC API spec into the source
>> code just for the sake of copying the spec. The implementation of this
>> w/a (and a whole bunch more that will follow) has no use for extra
>> defines about sizes or fields. And creating defines that will never be
>> used is a pointless exercise.
> but without those defines in ABI we are using plain numbers in code:
>
> +	u32 klv_entry[] = {
> +		/* 16:16 key/length */
> +		FIELD_PREP(GUC_KLV_0_KEY, klv_id) |
> +		FIELD_PREP(GUC_KLV_0_LEN, 0),	<<=== hardcoded 0 len
> +		/* 0 dwords data */		<<===
> +	};
Which is in a common helper for a whole bunch of different KLV ids that 
all take no data. So how are you going to work in the use of each 
individual KLV id's data length definition? Either it must be generic 
code that is doing unnecessary things such as taking a pointer to a data 
block that is always empty, or it is coded specifically for no data and 
does not need an extra define to tell it that there is no data.

John.

>
>>>> +};
>>>> +
>>>>    #endif
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c
>>>> b/drivers/gpu/drm/xe/xe_guc_ads.c
>>>> index a98344a0ff4b..633e5fd9c738 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>>>> @@ -7,6 +7,8 @@
>>>>      #include <drm/drm_managed.h>
>>>>    +#include <generated/xe_wa_oob.h>
>>>> +
>>>>    #include "regs/xe_engine_regs.h"
>>>>    #include "regs/xe_gt_regs.h"
>>>>    #include "regs/xe_guc_regs.h"
>>>> @@ -19,6 +21,7 @@
>>>>    #include "xe_map.h"
>>>>    #include "xe_mmio.h"
>>>>    #include "xe_platform_types.h"
>>>> +#include "xe_wa.h"
>>>>      /* Slack of a few additional entries per engine */
>>>>    #define ADS_REGSET_EXTRA_MAX    8
>>>> @@ -279,23 +282,43 @@ static size_t calculate_golden_lrc_size(struct
>>>> xe_guc_ads *ads)
>>>>        return total_size;
>>>>    }
>>>>    +static void guc_waklv_enable_simple(struct xe_guc_ads *ads,
>>>> +                    enum xe_guc_klv_ids klv_id, u32 *offset, u32
>>>> *remain)
>>>> +{
>>>> +    u32 size;
>>>> +    u32 klv_entry[] = {
>>>> +        /* 16:16 key/length */
>>> drop this comment, code is self explanatory
>>>
>>>> +        FIELD_PREP(GUC_KLV_0_KEY, klv_id) |
>>>> +        FIELD_PREP(GUC_KLV_0_LEN, 0),
>>>> +        /* 0 dwords data */
>>>> +    };
>>> you can define size here:
>>>
>>>          u32 size = sizeof(klv_entry);
>>>
>>>> +
>>>> +    size = sizeof(klv_entry);
>>>> +
>>>> +    if (*remain < size) {
>>>> +        drm_warn(&ads_to_xe(ads)->drm,
>>>> +             "w/a klv buffer too small to add klv id %d\n", klv_id);
>>> this looks like our programming error so xe_gt_assert() should be
>>> sufficient as we don't expect this ever happen in production
>>>
>>> but if you want to keep the WARN then use xe_gt_WARN() instead
>>>
>>>> +    } else {
>>>> +        xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), *offset,
>>>> +                 klv_entry, size);
>>>> +        *offset += size;
>>>> +        *remain -= size;
>>>> +    }
>>>> +}
>>>> +
>>>>    static void guc_waklv_init(struct xe_guc_ads *ads)
>>>>    {
>>>> +    struct xe_gt *gt = ads_to_gt(ads);
>>>>        u64 addr_ggtt;
>>>>        u32 offset, remain, size;
>>>>          offset = guc_ads_waklv_offset(ads);
>>>>        remain = guc_ads_waklv_size(ads);
>>>>    -    /*
>>>> -     * Add workarounds here:
>>>> -     *
>>>> -     * if (want_wa_<name>) {
>>>> -     *      size = guc_waklv_<name>(guc, offset, remain);
>>>> -     *      offset += size;
>>>> -     *      remain -= size;
>>>> -     * }
>>>> -     */
>>>> +    if (XE_WA(gt, 14019882105))
>>>> +        guc_waklv_enable_simple(ads,
>>>> +
>>>> GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED,
>>>> +                    &offset, &remain);
>>> hmm, it looks that your implementation here in patch 2/2 is different
>>> than suggested one in patch 1/2
>> It looks the same to me. It has simply optimised the the offset/remain
>> calculation to be done inside the helper rather than outside it to avoid
>> replication when all the other 'simple' w/a's are added. The actual
>> behaviour is identical.
> still you can move this 'optimization' to the comment in patch 1/2
>
> alternatively reconsider the need for this comment in patch 1/2 if you
> drop it immediately in next patch 2/2
>
>> John.
>>
>>>>          size = guc_ads_waklv_size(ads) - remain;
>>>>        if (!size)
>>>> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules
>>>> b/drivers/gpu/drm/xe/xe_wa_oob.rules
>>>> index 48cdba1cbf95..a8d15f004b6c 100644
>>>> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>>>> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>>>> @@ -19,3 +19,4 @@
>>>>            GRAPHICS_VERSION_RANGE(1270, 1274)
>>>>            MEDIA_VERSION(1300)
>>>>            PLATFORM(DG2)
>>>> +14019882105    GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)


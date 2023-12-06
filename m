Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D18C4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 12:13:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D881F10E6EB;
	Wed,  6 Dec 2023 12:13:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCA7710E6EB
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 12:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701864828; x=1733400828;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fLIYJX0FE9sUPHGNLwZEGB03/fWpw4jVBll7h9Thn8c=;
 b=Sgu7VTLyutuZgN6uaP+fUhvpyn6M3bYSQojjMglMhhsVbKefKas7ILvH
 UUFyYNU5d8FKXpcstvaElSLTLn0OMuBOf2TR/H6rxFVEFlAo+qk8rLpHZ
 KNnpbt4qI1ZiVrrQfGl5EjLDNx/zsDZfeVjPamuzYJjKm8flP76N2uVBr
 hTkmsOPa96y4mMirZWnuWTRCj0QgqidaubTvgRPsfzvrPf0ZbLfTedemk
 S9Y5duCGMentOVTDKz0Eu+RY0UGgl/nzRUTunNHyRVMqmEHn4Io77OL2V
 EMHx6HI00wVTq1QJ8KXMWsVsrVBfTt8+tmvSxQdQrjkxmPk06cxcuG1bm w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1117744"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; 
   d="scan'208";a="1117744"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 04:13:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="764703711"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; d="scan'208";a="764703711"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2023 04:13:47 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 04:13:47 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Dec 2023 04:13:47 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Dec 2023 04:13:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nXwujQmfzybQPEWrn9ZkwpfWX8/Wf4Lb33Cc1UT/PthjUTa+2cGbvc4LdKmA38AG1PmjUucMHKSvTG7dRey/6+20IB6B+AdGt560JzG+5iz9awtdcnoQqc9Ihl3rFro7/53OOjijKLwtMYPiTepfy3WSYyXpbzYxZvAahd5wjP9bx2Mbl1VxHu+m6Wa4ifz7F8J1C8Rn3PKsF62F13rB4FlUxyU/IbaA4hlQJ8W7gSWzItHiplNIYliWQpSJEEObJVXXpphUtoGbxR0N33iMKFzbxyXIXU4oMCwvyXf4KxOXTlmxnw6wjR23B9sELDDPYnDgFnVstbK3+oyUts9d1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kv9KNx/MDg3YvPo/3TWSBrXikWEcsT7QqfMXap7nAGU=;
 b=XbEF09LqU67NJgGFAF7afEghzB9DKTmZnzhHEdkyGfasrL0g6pYs1mNih1Em3O3l5V7nzlCw/+wpu1z5HjpAUlaVS7nnoPsYPq1vffh2kOegLgK3wIqBoBRxbJLTeD51iesPmmhiu64KoInxCGyTOkWn5WazAL9ZVaEiEuLvrkXvfoiwmt6pYyREdiHW65SqFpC+ko9/CqrtMnfoOYvu4j4fjG/WxmVK0JiE7gBquOywHpc9I6rchCESnIvfFs0Yep5NmOcMosL3Es8NVk5ujpB5pmux0voabRiGlm6gehALT+/EBZfN0VhntlSPOtufLytu0R93UCSi8km+zqQzQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 SN7PR11MB7604.namprd11.prod.outlook.com (2603:10b6:806:343::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Wed, 6 Dec
 2023 12:13:44 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52%4]) with mapi id 15.20.7068.025; Wed, 6 Dec 2023
 12:13:44 +0000
Message-ID: <7b70c647-6fb6-46ed-98e0-8e898625b5a3@intel.com>
Date: Wed, 6 Dec 2023 17:43:38 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20231206044735.966213-1-sujaritha.sundaresan@intel.com>
 <20231206044735.966213-2-sujaritha.sundaresan@intel.com>
 <CY5PR11MB62113FC5A386520506F9912C9584A@CY5PR11MB6211.namprd11.prod.outlook.com>
 <d9e06457-ec98-46b4-9235-8e9b3b71ffa0@intel.com>
In-Reply-To: <d9e06457-ec98-46b4-9235-8e9b3b71ffa0@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0163.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::18) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|SN7PR11MB7604:EE_
X-MS-Office365-Filtering-Correlation-Id: 945d8c58-091b-4def-92a3-08dbf654cabb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C/5om+ItKD8CrC3rwkrPxer1wX1sg+LzkTvO1M9K31d5LLvG5DP3EW4VQN+Maz4Hj0/5mJlmY7acyHI9YHLRM1eu+om9Yg3bn3Hqe65vxhOEo+DUzDKNPajW/0lVnjZn6VK0nbU4m9uWqMfznPI0nRoXBRuoToXebGVG8pCptmBfA+3VoHDETobI9CfjMIr+fLdkO9YIVHOiBb7Nklk0UJ0B1DRRAekMVVNpX1P7VwnjsBOQVqllraKbrwYL/414SYF0XTeDW3b/pzxe7VaOo7Z9C+xuCWsdZFjuCOsdNvIDOSpHc88VehhxUnjA4neiHecyTtksurviLkEaZxfXjSU2zZ2EPOh068sl4qxERvI9vgmv03wMdIv+PDV0DpRT1KAnCUoOUD5LGsSzUHH29ESWvCgEaRNNjRqZF9cvyaMqgxK6aPi/gio/nDX99KKLOrwoWf3LO0Ark/rpEP1BmJzp/MohUmT7u8treqTvNNruU3k4uqL/N2nJfKxkS1M/Uo7eWZTJVIXq52EmttutTk0XLBxGwdaqS56jX3RIUDKNkjGfNx3tmAZdMQbl2qNKFIvOPCZQzuN4OxfH/GyrU3MKPPlNjO9GMvGxckOgta405N70J6NsZbiyVdJdapwtpvOUzcWwyKLlayzcUrWGeA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(366004)(396003)(376002)(136003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(2616005)(31696002)(107886003)(41300700001)(6512007)(8936002)(8676002)(4326008)(83380400001)(82960400001)(26005)(86362001)(6486002)(478600001)(110136005)(66946007)(316002)(66476007)(66556008)(6666004)(36756003)(53546011)(6506007)(2906002)(5660300002)(31686004)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3hpaFl4OFJaMWF3S2JpeHJ6Ymt6Y1Z5dlFBLyt6NkVFQlhERk1qM2dMdWVk?=
 =?utf-8?B?eXZiWEh1NzJ2YndDeU16UEliUC8yeG8xN1RCaE5sNDJyd2lRY1ZyeXVERzd1?=
 =?utf-8?B?MFhSVXpuMzJ6THhsdUFtbzVyUTBVcHFKQkFtSVFFNGVVV2ZLQnlHN3dCUVRi?=
 =?utf-8?B?V09sSFdQd0E4VWgzYmYrZDhFQzJUQ0g5M1hoUVRxck5uNzZuWS9DeXlpdDNq?=
 =?utf-8?B?WUpHeklreWN5U2FxdTR6MzJ4cVJDREpYSlRER3ROOTFJSVRyTXArUEZWUEs5?=
 =?utf-8?B?TkJMN2tYVWZCQXNUbUZ2K0lYRnJkQTVDZ2xyK2l1TzM1ZHdPQVhLbDVRbjhB?=
 =?utf-8?B?dlYxM1gzLzdyT1gyNGNITHUvNkR4RGJWZlJqZkU5d1VneUdUR25sMHY3c21R?=
 =?utf-8?B?RVQxUlA1NkhBcUsrNkgyOFFBMm9MdFpQeDVTWWhRUXhMMXZ6ZXdSTXdmRGxN?=
 =?utf-8?B?aVU5a0JNY3dSWHVCd1hSZ0tXK0U2a3NuQnVQNUxpd3VmNU1BR0RUMTFMZGRW?=
 =?utf-8?B?RVRqbm1WRUpOSzJpSm1YMFBxbXp1Q2tzbHVzdEVCSHV3SlJ0NjdNYUdQb2Q4?=
 =?utf-8?B?OGo3QTJCdGVvQ3RXUG5RcmJLWCtwWGVpb1pXcVdrZlViUEZwdnhOQ0dEdHdz?=
 =?utf-8?B?eTdRRklDVDhJU1g1blZhckpvck9tWncrc2Q5RlRXdy90MHlYVWNSU0tya1lN?=
 =?utf-8?B?QzU0c3JmUXRXQnBIUFNBeXJPSmxqSzNtVW1ycDdNRmhMbDdJdFdaYzZPUWlt?=
 =?utf-8?B?TkVtOWRuZDdCL1RBNldyS0hwbmJSekdMY1ZRNm5BRXhpcUpvQzRZRGFNWFU1?=
 =?utf-8?B?Nm5NVENzckk5N2FBTVBQOEl0blk5MFp5QkxVTEVpbzdqRkhGRDdUNmRUcm5G?=
 =?utf-8?B?V3JZbzFWdEFWa0laUXlNaTdsQjBoZklKdzA5NDBSYXNGK2g3OGl6OTVvWGxP?=
 =?utf-8?B?Y1FhUC9IZFR3RlFsRExXK0R1T1Y5cGVTVWk0TFNzdDUvODZEUG9PbGE5dStt?=
 =?utf-8?B?V0NMeWZjNXJyL3pwSXY5Q1ZwVHh2ZGE5OVRQNVd1UGRrYmRPY0RRVE1iaktn?=
 =?utf-8?B?ZmFSMWIxTjR5ZXlmaWlpRDd3czFOY1gzN2xLOGZqaG1JSTR3UXEwanFJM2RO?=
 =?utf-8?B?L1RSUmIxYmcwWVNHNFIycjhicHZ5UUVyWFZMS0F6TEtlbTliem1XbE5ZMGxZ?=
 =?utf-8?B?VDdtcDh2a2VGbld4cUxSRzdQdnV1UEdLTUgrOFhMOUt1dWo1TEdVWlpFWTly?=
 =?utf-8?B?aThOSU9IaTc0cCs0T0JUTTZHOU9KaGhtckhBRmpmVWNzOU11eUszMkFVblg4?=
 =?utf-8?B?THBaNnFOSkFSOXZnVTd4NHltYnNoczRQampwL3QvdDdybEtUaGtURnZRdTQ0?=
 =?utf-8?B?TndlQXZ0RUQwdEljR1ZOWUMxL0Ewb2Zua0tsY3k3SlV3eDJGVmp6V1ZFMWo1?=
 =?utf-8?B?NTlCb0d2R0hOTmNFZ2EwbnhRVlVTQkpSbVh3U0gwZVEwT0djcEk2Q2YzUG03?=
 =?utf-8?B?RzZxL1BMUGRHS1FPQUZaZElQcUtnOXFCWmdBNEdKMmtpRHNPZjNrWVExOVNZ?=
 =?utf-8?B?akFlSmNiMUZkTFM2RzRnZTh5L1RNVmsva3Brc3ZVakVPUlJRV3dnbFZZYkFC?=
 =?utf-8?B?UkltcjJUWUhsaVJsOUpwRENKZXd4MkVJbUpvVERyWEEvRXh2emVRQm80enFH?=
 =?utf-8?B?QXF3UTdJRitQRUZVdzVnQUZyNE9YMDFzeVJkVVBMS2tzeW9CQUJXSEFXd2Rw?=
 =?utf-8?B?K0lBVTVHZm1EZ3Z5UWFPcTAyWmZsbHhwV29BNnNzUmJtM1VJdXF2bWhKQU54?=
 =?utf-8?B?dC9PbzJublQrYXhtOERWeEFJY3ZWVHZ5eHJaYmVOTDUxV0NCN0dRNTZpWW84?=
 =?utf-8?B?OVozNlVxM2dIckwzcDYvN05kVnJ2ZkdURUNFalJuUDdLeTlGS0grdlZHVS9q?=
 =?utf-8?B?ZWUrVDZWUjZOOHJVZ2tvbVdQeVZsZU1GbC9GWWVSZG1RNG1oWWordG9GZzVT?=
 =?utf-8?B?L2ttbzRmU3JCZUFGUko1RHRCQWFueU9GdHo2RjlrTHVUd25VbkJnT0FSb1pk?=
 =?utf-8?B?Nk5Oa3FDZUdjdTJKUzZiWkYvQlptZTZlYklrc3lyamtHdjBQQ0JHc1VRTjdP?=
 =?utf-8?B?bEU4Tkw1UUFOSnp0a3FocFc5eUJLNFl0bWJ6dTRGR2l3bHJzK1ZsbjFCeHhw?=
 =?utf-8?Q?YXwK49juiauqBZZXmWBVZ/Q=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 945d8c58-091b-4def-92a3-08dbf654cabb
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 12:13:44.5350 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LxGVHdQgzyjLy4pTWi8WDwB1DF1GTMwLcmzt+MjWWit69acYSiEcsZYhqFMtlfoOcsHXPu3bXABBSPgCeG/7dbGk8RXpXuvnGN0GicComvc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7604
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [v2 1/2] drm/xe: Add a new memory directory under
 tile
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
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 12/6/2023 5:38 PM, Sundaresan, Sujaritha wrote:
>
> On 12/6/2023 5:23 PM, Gupta, Anshuman wrote:
>>
>>> -----Original Message-----
>>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of 
>>> Sujaritha
>>> Sundaresan
>>> Sent: Wednesday, December 6, 2023 10:18 AM
>>> To: intel-xe@lists.freedesktop.org
>>> Cc: Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>; Vivi, 
>>> Rodrigo
>>> <rodrigo.vivi@intel.com>
>>> Subject: [Intel-xe] [v2 1/2] drm/xe: Add a new memory directory 
>>> under tile
>>>
>>> Add a new memory directory under /device/tile<n> and move 
>>> physical_vram_size
>>> attribute to the new directory.
>>>
>>> New hierarchy:
>>>
>>> /device/tile<n>/memory/physical_vram_size_bytes
>>>
>>> v2: Fix heading typo (Riana)
>>>      Fix cleanup error on unload/reload cycle
>>>
>>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_tile_sysfs.c | 15 ++++++++++++---
>>>   1 file changed, 12 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>> b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>> index 16376607c68f..e8ce4d9270e6 100644
>>> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>> @@ -24,7 +24,8 @@ static ssize_t
>>>   physical_vram_size_bytes_show(struct device *kdev, struct 
>>> device_attribute
>>> *attr,
>>>                     char *buf)
>>>   {
>>> -    struct xe_tile *tile = kobj_to_tile(&kdev->kobj);
>>> +    struct kobject *kobj = &kdev->kobj;
>>> +    struct xe_tile *tile = kobj_to_tile(kobj->parent);
>>>
>>>       return sysfs_emit(buf, "%llu\n", 
>>> tile->mem.vram.actual_physical_size);
>>>   }
>>> @@ -38,7 +39,7 @@ static void tile_sysfs_fini(struct drm_device 
>>> *drm, void
>>> *arg)  {
>>>       struct xe_tile *tile = arg;
>>>
>>> -    kobject_put(tile->sysfs);
>>> +    kobject_del(tile->sysfs);
>> Why kobekct_del instead of kobject_put?
>> Thanks,
>> Anshuman Gupta.
>
> Hi Anshuman,
>
> Basically when sanity checking, after reload we see that we are not 
> doing a proper cleanup.
>
> kobject_put will only decrement the ref count and possibly free the 
> kobject.
>
> But that is not happening in this case. There is a duplicate remaining 
> of the tile directory.
>
> This required a clean unregister of the parent from sysfs hence the 
> use of kobject_del.
>
> Thanks,
>
> Suja

As a continuation of the above response;

I can probably add a kobject_put call as well to ensure that we are 
cleaning up the memory side of

things as well. Will add.

Thanks,

Suja

>
>>>   }
>>>
>>>   void xe_tile_sysfs_init(struct xe_tile *tile) @@ -46,6 +47,7 @@ void
>>> xe_tile_sysfs_init(struct xe_tile *tile)
>>>       struct xe_device *xe = tile_to_xe(tile);
>>>       struct device *dev = xe->drm.dev;
>>>       struct kobj_tile *kt;
>>> +    struct kobject *kobj;
>>>       int err;
>>>
>>>       kt = kzalloc(sizeof(*kt), GFP_KERNEL); @@ -64,8 +66,15 @@ void
>>> xe_tile_sysfs_init(struct xe_tile *tile)
>>>
>>>       tile->sysfs = &kt->base;
>>>
>>> +    kobj = kobject_create_and_add("memory", tile->sysfs);
>>> +    if (!kobj) {
>>> +        kobject_put(kobj);
>>> +        drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -
>>> ENOMEM);
>>> +        return;
>>> +    }
>>> +
>>>       if (IS_DGFX(xe) && xe->info.platform != XE_DG1 &&
>>> -        sysfs_create_file(tile->sysfs, physical_memsize_attr))
>>> +        sysfs_create_file(kobj, physical_memsize_attr))
>>>           drm_warn(&xe->drm,
>>>                "Sysfs creation to read addr_range per tile failed\n");
>>>
>>> -- 
>>> 2.25.1

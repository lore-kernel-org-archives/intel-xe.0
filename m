Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DDDAC61D92
	for <intel-xe@archiver.kernel.org>; Wed, 22 Nov 2023 08:37:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AE1210E5E1;
	Wed, 22 Nov 2023 08:37:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E702310E5E5
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Nov 2023 08:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700642242; x=1732178242;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hpFK1rjyZei3v0Ok7oRbnO1IX/HrPUQsAweBP+gg4ao=;
 b=PwNt3m8WiLlmkXzLwozwMeamWdo+XTBHhb6M98rf8nOekWbtj9TuyvcJ
 n6FRjYIcFHXkCpYdFIYugX+AkWbC/Xa5YBXfgPvsuy3a1wi3IQqnXiA/x
 hFTxw9+spSsrtOVL0ZxQhah70PSsn2zmXFwMLzXWcXXFW5JG6rytTGkZ6
 IQKfEbg2yB6+6XOM+WERYUZSxCz89vKltx55OwnS2v7jwEx1ch+GQlcHZ
 M+nFW6G2eRKVpUZJRU8qcfu69kAg+bcQOiheX6R1fPWaAOq824iq08l1b
 +7JcuJSMigroy+T/ljgVupYo5M1m/ynepFANoiGXG2AIERfYGpvDdsJ0x w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="456338722"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; d="scan'208";a="456338722"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 00:37:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="857612037"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; d="scan'208";a="857612037"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Nov 2023 00:37:15 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 22 Nov 2023 00:37:15 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 22 Nov 2023 00:37:14 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 22 Nov 2023 00:37:14 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 22 Nov 2023 00:37:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZLn/he9Vqqun8Y9jHtwwCsyufZEAtaSVHg5DXivkCXOueuKurgmmV5ypUY6UBikqYianlhVpLO0qDuQIsdC+s8S7QsQf+6RCAbdwEAdI4ZDBBa7FmCgTmfw7PiUZ0sEkDLbz8fPxI8l1Jj7Y0bMYUAJqNrNuWKOEVAaBog+2dTN2WLLLzLwad8LYyahQKCjCZ1Y4hx9sKD3TGy7VSsvC0mNvFYwwQaKQuOblX9MDs82pYZqVnQNrpMRQqTRUYG7etG5bxA8fKE17eIhK2TqzHEulQx0Oyi1S129bi05p6QgXkM6U3kyD5zkKize6EM41RdDWzO2Ln46FE4wQRqHBjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jQd6X/5/TsyFxHoaFrYoSyJRTV+SLk+YpuXIgz4Q9XY=;
 b=LP1zJbYmb5ykg5ddJE0vRjVErYOLs2o6P07Bg6sK3h0c970oGoku3tdPe+Uc5vRCXVIbd6RmM01bGxwOSVaZSOs8bwv0jnK61XSvvSkCNU5eN3IgnRJ/N+YerVu3DIfpqndG8xgdknXtkx7fZ5d1IO3U9AyVcdQVzaCcal6JGdjWJObATdlr7gKnthcAzqZwi3uCXQe27WbMBE1UJvE4kocBOSPugyGOt3ARAJs2fJFYwj3sMc46ShJcHiSR9PUzVIfF1/vChczcYAlIvlykLuIIlBAgHQ5s1nvhTgExY/GvsZxz3/z3kQQwSQ8mSSNfltG3NaYklrgYhRTGSd0SKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 MW5PR11MB5787.namprd11.prod.outlook.com (2603:10b6:303:192::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.18; Wed, 22 Nov 2023 08:37:08 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52%4]) with mapi id 15.20.7025.020; Wed, 22 Nov 2023
 08:37:08 +0000
Message-ID: <b46b5fc8-f96f-42da-83ba-e882f7f9d2a5@intel.com>
Date: Wed, 22 Nov 2023 14:07:01 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Welty, Brian" <brian.welty@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
References: <20231116143043.908412-1-sujaritha.sundaresan@intel.com>
 <20231116143043.908412-3-sujaritha.sundaresan@intel.com>
 <ZVfdHp1M0BPtn457@intel.com> <165bdc38-a10c-4bc4-8a51-40c15e6cbc7d@intel.com>
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <165bdc38-a10c-4bc4-8a51-40c15e6cbc7d@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0031.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::20) To SJ0PR11MB5664.namprd11.prod.outlook.com
 (2603:10b6:a03:37f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|MW5PR11MB5787:EE_
X-MS-Office365-Filtering-Correlation-Id: 9115fafb-ea39-44ef-b8df-08dbeb363622
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iz8lbntgSN2FZlnUJrdq2XXsaWstUVQwGFgqLNlSO4k24T0hRTPqnZVWV9XMEfv1tbjuGCIaQ2FbeOXBH16U2apVg9Y1wVea/yzl0MWoAu6usfvFt9YfGwXQW/HRm0U4/Z4PghU1vLtO9XOSHSi92+xhGc7egp3QdUVaOeIy2cvEGMWfbRI59U88dYhz1tjbRsYnvV+P4nx+ClOzER9tlCrH5nfbWQiiD50p8YzOVNSZH1KIq4RF7zxzzW6XgIW+J192HjynmK5ftZb5pfjOza918DM2i25K3rZZjyRPI1kaTrM99ZRd7pXSf0vRyCp82PQ7iBqJXdnrb38IAxo2AzqxocsYTSrriZoBhpDy69VAuOmhAjd7r24GkG+/OuMUBBtPJRFQ0CGwdqWP/qfdfx8pmt98QluFg+tBfMjdU+himin+W5s4yjhLiWd0wLffsr/nWCjtlauyo62Q0iuFBhC9w3hw6x8k1NTtqU2MZ9vdIAzY6+z6S5YiWK19VAI4/pSlL+lc8H0oVdAsv57rGthJI5xPnzWVvGbjNzkzUIsPRpDD5oP4/Pjc51YRCPpiPKys7ybmRF7A4S24uCkfYp6DwU6MhDojrNRI61sIwz7kIu4X/eL2j8R7M2yptrZ7FeVOQAxZbY9ZKBTFt7i7pw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(376002)(366004)(136003)(396003)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(82960400001)(31686004)(31696002)(86362001)(36756003)(66476007)(110136005)(316002)(6486002)(6506007)(66556008)(2616005)(66946007)(6666004)(6512007)(107886003)(26005)(53546011)(38100700002)(83380400001)(6636002)(478600001)(2906002)(5660300002)(41300700001)(4326008)(8676002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnJ4eStJVkRVcitqNUJ1d2NyTmNtaTlzblZjM3BxM0x5blJ1YTFsN1RsODJw?=
 =?utf-8?B?bDRmMkE5OVJJd1ozYnpKRGxjZm82eE1hb0xOOWNQUGt4T1FIenB1YjhNZWRB?=
 =?utf-8?B?UU15aUpqR3hWTGhRSDRWUVZDbURXclM5cmV4T3NXWWt1ZE5HNVUrb2gwRWs5?=
 =?utf-8?B?UzMyV0lxOGdKM0lSV01mSXBscHFSRE1PaG1DRjVxc3FmM095OUFWWEUxVWli?=
 =?utf-8?B?dzA1STBiamlUcnJ2RkllMzV6a1NCQnc4N0xadGpoOSszMnVqdWFSYUdCb3Zk?=
 =?utf-8?B?MFlLM3FqcEN2aXhhbzNWb3RRelVOT0RwRUdDaHBqM1dFN0NSUEgxK08wU0hz?=
 =?utf-8?B?eXgxWEZsUW54UFlKcVM0dE1UMk5XaUx3NUJDM09KSmUwY3VPZUxGRHVhcjhB?=
 =?utf-8?B?TENwT21OVDl4THdYNGoyYWk1OTFIaSsyeU9WT2ZkN1dOM3dGR0FZejMzd0E2?=
 =?utf-8?B?RVlockF3SjlieUo5L24wVGdOSkl3cUtONzJQc09hV2J6Q3NKM0dhdSszK04z?=
 =?utf-8?B?SnJZNmE0RkRNZUhWc2dBSFVtak9DWTRnTW0vYlp4T3RNVCtCWm1STWNoMEtF?=
 =?utf-8?B?RC9JaHRoaEZVRTFvZmpST3lwelRvaEIzNEo4amVHNW9iNG5NOTIwZlF2NEdV?=
 =?utf-8?B?THJQckV4WDZZWkxnemNWalpURnROZlBMN0tQMTZ0YVhUWndZZEZWZ1BVdFdL?=
 =?utf-8?B?TDVydWdhYjdGTEEySnpzU2c0TmNhQmdNVXhsNGh0aDg3cThWOUZzbDE0bEo4?=
 =?utf-8?B?M05ZNVJYaUU5S3FjZ3hzdGhTVmdXMUliN1NhNDdPZ1FzWW1YZE9wNUtDV2RS?=
 =?utf-8?B?QzhFdGQyczNVMzkyQWNSZ2o1ZExmVUlNNi90SjMxczdwcStNT2pJNVZ4bFA1?=
 =?utf-8?B?NVRlazZRUHNHMXNVRVdNczZjWmtDS1JvcmwySm4xSlFxdm14QUVaZHRtRkQ0?=
 =?utf-8?B?K2Y1SE5nSVpZZGxyQ2VraGtNaWQzOTlXa0JJUE40NytBVzNQWno0NzhQQmdP?=
 =?utf-8?B?YThBSUtXN0Q2OFJOekw4S1dlY1pka0tyclVabHVoKzlXMjYvYml1OWkxaTU3?=
 =?utf-8?B?NGpod241SW95SzJhZGNZSzlPRFBQdkYvVzBOS3psbngxN2dOUXRNNkxyVElM?=
 =?utf-8?B?MVJDUFIxS0k1ZHgzVkQ0cFVrL3dPYThVZGhJYzVwbnd1dkxvVENlWWgxOXMy?=
 =?utf-8?B?SGZBb0pKQS9JZVBBYjlWdU1ONWFPSWxRa3RQeVhOclV1MExQUVU5Uitabmlz?=
 =?utf-8?B?MGNFNXpGa2J1Nzg5ZUtGeS9sYmRIUG80eHVReUJJKzdVS3VNa2szSDJyZHIz?=
 =?utf-8?B?WXgySXJYYWhTRStsRFNYKzBOS1NEOHFLZnRidHlFRm9NaVhxL0Y2cGV3WjRT?=
 =?utf-8?B?ZkFWSlZHQWNMT1g3cG1qTlFua1RUTDdpQUQ2a1JNeENReHRSMlhyRVhQcFhn?=
 =?utf-8?B?anp3dTFYRGJyZGF2NS9ROTZHL2RkeGtyU0JXTXBPYXhFUkZzZVZwcFY3NkpH?=
 =?utf-8?B?Y3FycVcrSWI4emdxVThlNzVITWFxYXVSTGlGT2Y2TDVGWTZmeWhMY2hONmJK?=
 =?utf-8?B?alV6ZDhpT1ovMGNxK2VORjVjcUxzbkt4UHB2SEhHV1JyLzNtYzI2aEtGS0tV?=
 =?utf-8?B?V095M1pTV083VjdsaDNRRVN5dmpRWkNtbVc2RU5HcEx4SEZ4UnNhZmFwL1du?=
 =?utf-8?B?MHNxTmNmN0h6VDAyclZUSXNwK0dHNVlsd0VUSCtxL2RPQVRacFd6WE5JZk5t?=
 =?utf-8?B?bHp3UGVEbkdKakZjRFhHY0lhZmZuaXVyZy80a2tlWkFNUkUvSUVZUGxBdUNr?=
 =?utf-8?B?NW55KzVHWmEwUGJESWMwaktKTUYxV3pEQlRnbFMxRkFXTnlsVm5sdTZnVjZW?=
 =?utf-8?B?b3AxV0VwSldWeVNseU1mRkh6cnFlU2NhMDI4cUw4elVMbUVOUTJvVUw3OWxx?=
 =?utf-8?B?MU5YOVZCbFhVZGhWbUNsTmtuWlBMRG9JZzJsTkFQUWNtZzBYUk9ReGhwaU9s?=
 =?utf-8?B?M3RrcFNiV2xPT0dMZVRaRExaS2R4ZnZRaWxrOXpDWGdOWEpnT0VxNm52QnR2?=
 =?utf-8?B?UWErekEvQ2pkckRoOUhFS2gzbUp4NDkzTEc5Y0U5Vkl6RGlDV1daNCthc1Z4?=
 =?utf-8?B?NEFHYTljM3Fjd2V6M3N0MitDU0xjbldjRnlTdm1qTkMzRXU3OGRFZEdaUzRG?=
 =?utf-8?Q?f/8IMEJUqTLxeYMInjjtMjE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9115fafb-ea39-44ef-b8df-08dbeb363622
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5664.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 08:37:08.5769 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: enYKxatEPDm+caEC/NicfAjMmx00anxRNrahHsTt6nYxHDpCTxj5MTTxwf9ozz+UTUKD7xb0gXcbcIq3NSkgjfxD2Ys0ljDtxKJs+4nv5eg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5787
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC 2/4] drm/xe: Add memory directory for vram
 attributes
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 11/18/2023 6:55 AM, Welty, Brian wrote:
>
>
> On 11/17/2023 1:37 PM, Rodrigo Vivi wrote:
>> On Thu, Nov 16, 2023 at 08:00:41PM +0530, Sujaritha Sundaresan wrote:
>>> Adding a new "memory" directory under for vram attributes
>>> under the exisiting tile<n> directory.
>>>
>>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>>
>> Cc: Brian Welty <brian.welty@intel.com>
>>
>> Brian, should this directory be under the tile, or maybe we create
>> separated xe_vram_sysfs components for
>>
>> /sys/..../device/vram<n>
>>
>> and then if it makes sense inside the tile we just have a symbolic
>> link between them?
>
> Oh. Good question. Seems reasonable to me to have vram<n> in both 
> places as you suggest.
>
>>
>> Or better for now go with what Suja suggested and then later adjust
>> with symbolic links if needed?
>
> Yeah, maybe defer doing anything here until later...
>
> But let me ask....
> Was it considered to make the sysfs hierarchy more flat?
>
> Could also go with -
> /sys/..../device/gt<n>
> and:
> /sys/..../device/vram<n>
>
> and remove 'tile' directory?
>
> Could add:
> /sys/..../device/gt<n>/tile
> /sys/..../device/vram<n>/tile
> if feel is important to communicate which tile they are in.
>
> I don't know, just an idea.  Feel free to ignore.
>
> -Brian
>
I think for now I'll just have the /tile/memory and then add a sub 
directory for frequency

under memory for any vram frequency attributes.

Thanks,

Suja

>
>>
>>> ---
>>>   drivers/gpu/drm/xe/xe_tile_sysfs.c | 9 ++++++++-
>>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c 
>>> b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>> index 16376607c68f..d61c6fb1df40 100644
>>> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>> @@ -46,6 +46,7 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>>>       struct xe_device *xe = tile_to_xe(tile);
>>>       struct device *dev = xe->drm.dev;
>>>       struct kobj_tile *kt;
>>> +    struct kobject *kobj;
>>>       int err;
>>>         kt = kzalloc(sizeof(*kt), GFP_KERNEL);
>>> @@ -64,8 +65,14 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>>>         tile->sysfs = &kt->base;
>>>   +    kobj = kobject_create_and_add("memory", tile->sysfs);
>>> +    if (!kobj) {
>>> +        drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -ENOMEM);
>>> +        return;
>>> +    }
>>> +
>>>       if (IS_DGFX(xe) && xe->info.platform != XE_DG1 &&
>>> -        sysfs_create_file(tile->sysfs, physical_memsize_attr))
>>> +        sysfs_create_file(kobj, physical_memsize_attr))
>>>           drm_warn(&xe->drm,
>>>                "Sysfs creation to read addr_range per tile failed\n");
>>>   --
>>> 2.25.1
>>>

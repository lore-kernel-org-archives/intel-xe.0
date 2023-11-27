Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E87C4167B
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 10:50:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E7AC10E230;
	Mon, 27 Nov 2023 10:50:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FF1410E230
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 10:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701082230; x=1732618230;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=L4gb7bc75mlkpQRX5UhwgxDre+GnTiaU/KcXm57nzAk=;
 b=ienV67FS2MUAN/fQVaGOYKRY0tRfehwG9OXc+C4RrJwIxgG0/9IhFdep
 pNQxQ0pDMeZpBKsDfBxLTOfGq/7Eh7Ml3V2kGQM/VQ+utMLZSM5jADSi+
 Tv76vjukg5tEc6XKXffUFritQxQH81eFYtee435+jEAcr0GP6AV7uuxUS
 0F6p3YkeH6RUWoiApU8jUIf/cud4gdR3Xo0+XeqkMddUcQ9CtvrGevIQf
 Om9yA6kmQR1gF/RIWSf3a17nH/Om59RImXmMVYbuNTptvoVyrszUqrAmT
 TTR48uNJLk3TdfFG1cJS4a5XbB+qKZ1q3h44w3e539po/VKrvUSm0GWLX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="377712770"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; d="scan'208";a="377712770"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 02:50:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="891699079"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; d="scan'208";a="891699079"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Nov 2023 02:50:29 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 27 Nov 2023 02:50:29 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 27 Nov 2023 02:50:29 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 27 Nov 2023 02:50:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C1pJIEV+/wcZZVZiD4eqZa5PiLyL2DDJc2RTkWBVOvkW8Vc1PlOQUWfwfFVMVNYjccr/08Y51wc4+l5MmgpnUYcR1lEpZZOhn01xukfW9OZKAOZqHP9AzuSnsrU9zcGCw6UHVEXNQk44/ygPGOuXXeYOtbAagsmGSENAO+uo/Wpler7GQfc7n83veTb02o9f5aSM2K7mU+FOJuIRTMuUUEjJRWLn5eiO2woImJynirO3s3cKQvQqTZWPLil5yJKSwHdIhxuRGOUBH8q1WckqRhemi6uaggVdvygFPGZ6ETe7hA3DjSkrmA6tVVmhgBZeW7KLcff88+uZiHn4T4WElw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FaYS3RmS/uwmnr+tXfpxUYUOTtxvIYiUpv25+jjIqg4=;
 b=UZ88IipfzwYGJZV2LivqrnIeJYmizVKJOZYUvnDjKHVE+6o/LVymLP6koi4jSvTVOjFpfyhpDKNEW8+xSZdOp/x0YUv0O4l7CZzrv4NMcbmKuGaHOsygtPqgzLr6zeofphvXg/mabFo0XucJE6XknnQeXFx3GlBp8xQqsb815I/ZQWGvUuhnFCUvb+eGW1rrGREKn2wjB579GY4C1T0XnDasvokJ/VUMt1jlHkBoE9eYo2GrXQpwr3t6x9Db/iScXyBt7Y6ByTAECs2u51K0G+BP7c76xs9EiInUDuiDj2sQIDGQ4kpYYzQwM3H2YglTAI3JE2NrDukWufFH3cmrcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 PH8PR11MB7120.namprd11.prod.outlook.com (2603:10b6:510:214::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Mon, 27 Nov
 2023 10:50:27 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52%4]) with mapi id 15.20.7025.022; Mon, 27 Nov 2023
 10:50:27 +0000
Message-ID: <4ef43788-f872-4816-b194-0a0819bc3ee4@intel.com>
Date: Mon, 27 Nov 2023 16:20:20 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20231124122755.91279-1-sujaritha.sundaresan@intel.com>
 <20231124122755.91279-2-sujaritha.sundaresan@intel.com>
 <196f822e-415b-4333-b4d3-e2245bd2bedc@intel.com>
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <196f822e-415b-4333-b4d3-e2245bd2bedc@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0117.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::21) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|PH8PR11MB7120:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c5f2f09-4c5b-4e4c-77e6-08dbef36aa3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hYyUkY4VwePnMTHoBUaK73u5NHsi5RAGqO/f3wg6fHB67fdsaGhjMbk+YQhyh37AghmPO9z3oZ2HKwa8pcKGMe6yMV1/r+yV6w77ImOpwYcrP3Xc5fe+RYozkTEV8sCt2gyrT0NxAmSenOwNUETeqgDW/Swwg22pcJDh0lJ5Js9K59zDY9E6yw/SrqMpGxjkc9xkTo1HeVij9TvvFgHzMCFkLCESpNSe01cCff4d1VGzsNM0MyP0gx4S/IRMiyMB/N6kr7QEKWzOqDGrGhN1roY/GnWmNgPcBLiiUuGUtWflofvWTwdzlWCzWs1l9dZ/YBl6vG9NhadMUPld3vZB9oOmAHtIROgh82vie/GJwnG0xl6+KidikgeQBSntdqcJDuGSHLwoKjjPv0f1cCF9liJL4PS3ZYdnBsk+keRbom3xTg91qPYxelML9tuEpmbJjkwwytvLlA6wdpzxftLNdZF7nxgph7qaUQxtxQbyt61eRGnG2Gtz2Y2xzm2SLOW0q0DHgls9BWgl9Kuz7PGYUZDiNXdIHHSvuxFpvqSvkH7uh4HxMbUl8vWsPrHs3wnGu5Rhhlr5RdJMmhDcM7O9HEQnyPShZJnJGBLjnVX8hmiy/P7XjDzZYxWGMwvQ8vyq9ZTc9TSHWbb00bp9ZFtYrw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(376002)(39860400002)(396003)(136003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(36756003)(38100700002)(41300700001)(31686004)(107886003)(2906002)(83380400001)(82960400001)(5660300002)(26005)(86362001)(2616005)(6506007)(53546011)(8936002)(8676002)(4326008)(6666004)(31696002)(6512007)(6486002)(478600001)(66476007)(66946007)(66556008)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjFoQWcxakswdmtmaFdHVU9PbWVlU0JIajJFdG44R3ZQSnBUSGFDQisvUHRM?=
 =?utf-8?B?UkRnVXV6cUtlQVorTjhuTENyTnlOZUpxNU5mNnRZM096aGJUaVVTbmZRN0RF?=
 =?utf-8?B?Z3BEWHlCcG1iN0w1UVJKVW5FVGJtcVVXV2tlVStDRXZ4ZmY1SFZuRWtsZWZZ?=
 =?utf-8?B?eHJmWlpjNUhEUFppK0FGSWRpMTM1Ym52U2NlS0ZVVEV4LzhKUWI2cStuUjUx?=
 =?utf-8?B?VDFyNkFBZStIZ0wzSnBPZ2hmdUthK3dlVmk5V2xlSXBERVRRWi82aDV6bU5s?=
 =?utf-8?B?V2pYNmFKaHAvSFZGNklpS2JJVFdsSklpVnBzU3J2ZTdlWkNDd0VRN3ZzUWVm?=
 =?utf-8?B?QzRDMk5uR0tydUdMYWJFb2F3NnpsSkNyZU01aWNJK3ltWExiR2xaMFBjczJG?=
 =?utf-8?B?VjFNMnptRERBUWJJU3FybHliaFp1WjZ2K0tCNytvTEZ2S05iY1dINmt3ODBD?=
 =?utf-8?B?RGRXODc1RncwWWh5T2NiSENBNmFxUkpCVWMwTG1mc3orSlBUZmVLSC9yMFdv?=
 =?utf-8?B?eThnWlo1K3JDaDU5WFhPZWhPWEpvSlZreHR0eVh6OXo5UTVNNkIvMEJlYUx2?=
 =?utf-8?B?N0h1RUw3Q2doYVdGSytLalRlakRkRWJsRExnWWh0ZlJwMm40dVJMT2dNdENE?=
 =?utf-8?B?aERuSWM4UDBUclFDanFRN2J5QzNIVGMxYlN3OHJoYXp2Um1EK0J1VzZScUZa?=
 =?utf-8?B?SHc0V1V3ZHYxRzJIdTkzNHV0cm90VzVpUkVRaFJKR0NrelNFbjRmV09rN3dY?=
 =?utf-8?B?V2RJeU4yayt6cXpMNmFseHV6MktNV3RqSW53dUlaczN1TzZSNy9tS3JCMlRP?=
 =?utf-8?B?cDlGdGFNZFVYTHdpVExlaEpRKzZKajNQcFZ0dEpWS0lIRWdaMlFTd3Z6cVFX?=
 =?utf-8?B?dnhHelZ0RFBRaS9reGlOS0VaZTBrR3gvUnFObHhGZDFrMUNUem9TbmF5eU1z?=
 =?utf-8?B?ME81UFhadlFQcWNPNHlNa1N2alBIelJFaXJDbHpjbUFMUnBjVlY3ODVRUnE3?=
 =?utf-8?B?QnZ2TTBHMnFHQVRibTZWeGpxb3Q5bnljbVVBTER5TkxXcWQxcGM0cWp5bkhr?=
 =?utf-8?B?ZVNwVFFXWUJHUk9ySW9lbkUzdmdCWjVjVzVvVVNETktpRGVLMXVLWVBadGlH?=
 =?utf-8?B?dGthVFQvUUkyalBNWEVMK25uQ2FxaXQ4YlVHcEJ3QU9mMTVtUmVFQzJsdjg0?=
 =?utf-8?B?aTE5OXl5VVRNd0RhazdBKzJLZk1NNmFWQk85RmFic2RpdDlLUEpVaUcvSnl4?=
 =?utf-8?B?SUpLNnFkUkhBdkdzYUdXQ2ltTVdzQnZBUVhMU2lxN2laNmVHSWwwZmZBa09F?=
 =?utf-8?B?MWlPWlg5ZkltOUIrSThnRUQ0OVYrWDNyWFlVTHF0MU1hd2dBbDVEWXk1QVF0?=
 =?utf-8?B?dlZUTzE3T0F4ODcySWlINnA4clc0RStTMmZlbHRzZlJiYzlxanBFdnNWdVJp?=
 =?utf-8?B?c2N5elFDYXpudGtrY2tBSXk1b1R3V2IrazkyOC8vT010RlpqcVVNVnkyUCtS?=
 =?utf-8?B?M21GOFJSMTFJTXhRQ1FDZ2RWbkdVc3BrWmg1M2l1S25JZDhzaVMyQ2JXdXZE?=
 =?utf-8?B?TGxBRCtoTDQ3b0M1dFJnbGZLUStKUHZ5ZXhwS3BIZzVCdEJvQUxtWFNpOWp6?=
 =?utf-8?B?Q1hRS0pJaFN1R2lETlV3cjlHZ3dROW5TMlJYcmNOK01OZnJFRXVYNS9iQm5h?=
 =?utf-8?B?ODNMQkVVSHBTU05OKzNLajgzT1JvOXNNUGVNeE9RUHdQNzdta1BxdTRCZnYz?=
 =?utf-8?B?a24yUCtDNU5SM01kUGJSbVhwT2VXZTZxRGx6WUpyOXZaSnJOUjFsbWxkbk5u?=
 =?utf-8?B?OXJqU3RkMUxIQVZUR0ZVSm9lT1g5aDVORTJZN2h6c0tiQmpaTEpUZEFORCtm?=
 =?utf-8?B?QSthT0t1ejN3NFdaMmlvVFpwMUZ1MzR4amJSMzBOMWtFZk40SzIrY1FLMzlL?=
 =?utf-8?B?b01RSUtDMkZ6V3RNSjFvV1dEd2tqL2VLQVZ3RHFxN3ZYb1huU3pnUldrVHh6?=
 =?utf-8?B?MS8yRGxOTytHYWhVU1V3Ylk3R1FKbmZnOGNsRHRxYnk0Q2JFMGd3U3MyNzNy?=
 =?utf-8?B?N3RxYThYNS9vM3lGeWFDS2toN2FuNUkvM05NR0N2YjNnZWNjcElzSHlPNzFw?=
 =?utf-8?B?eWhXcXllbUU1MFlVQm00UXd4dkNVUkNBVy9SWkVXQmV5OENJdXdQKy92SnY1?=
 =?utf-8?B?N0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c5f2f09-4c5b-4e4c-77e6-08dbef36aa3d
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 10:50:26.9874 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RWxrUmB6PPi0CRPwxe75VhnzkMAuzqcQY52QkgFbjAySgRc4A70BWuF1+d0eR1MrRSvsl7r5OgHeHaZo945HXuHam9vS4De33+1rbmW/lOA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7120
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Add a new memory direcory under
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
Cc: rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 11/27/2023 4:18 PM, Riana Tauro wrote:
> Hi Suja
>
> Typo in subject
> %s/direcory/directory
>
> Thanks
> Riana

Will fix.

Thanks,

Suja

>
> On 11/24/2023 5:57 PM, Sujaritha Sundaresan wrote:
>> Add a new memory directory under /device/tile<n> and move
>> physical_vram_size attribute to the new directory.
>>
>> New hierarchy:
>>
>> /device/tile<n>/memory/physical_vram_size_bytes
>>
>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_tile_sysfs.c | 12 ++++++++++--
>>   1 file changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c 
>> b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>> index 16376607c68f..f354c8b2bfc6 100644
>> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>> @@ -24,7 +24,8 @@ static ssize_t
>>   physical_vram_size_bytes_show(struct device *kdev, struct 
>> device_attribute *attr,
>>                     char *buf)
>>   {
>> -    struct xe_tile *tile = kobj_to_tile(&kdev->kobj);
>> +    struct kobject *kobj = &kdev->kobj;
>> +    struct xe_tile *tile = kobj_to_tile(kobj->parent);
>>         return sysfs_emit(buf, "%llu\n", 
>> tile->mem.vram.actual_physical_size);
>>   }
>> @@ -46,6 +47,7 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>>       struct xe_device *xe = tile_to_xe(tile);
>>       struct device *dev = xe->drm.dev;
>>       struct kobj_tile *kt;
>> +    struct kobject *kobj;
>>       int err;
>>         kt = kzalloc(sizeof(*kt), GFP_KERNEL);
>> @@ -64,8 +66,14 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>>         tile->sysfs = &kt->base;
>>   +    kobj = kobject_create_and_add("memory", tile->sysfs);
>> +    if (!kobj) {
>> +        drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -ENOMEM);
>> +        return;
>> +    }
>> +
>>       if (IS_DGFX(xe) && xe->info.platform != XE_DG1 &&
>> -        sysfs_create_file(tile->sysfs, physical_memsize_attr))
>> +        sysfs_create_file(kobj, physical_memsize_attr)) >           
>> drm_warn(&xe->drm,
>>                "Sysfs creation to read addr_range per tile failed\n");

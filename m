Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B20C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 08:28:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02A3210EA0A;
	Fri,  8 Dec 2023 08:28:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EC2B10EA0A
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 08:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702024109; x=1733560109;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=J84UkqL71KOkoJrYNxr3X4iANLxJl7OvcikFF5ayVHk=;
 b=mOkl6cEMU3OC6zXDO9ZCDZIJ+dWk/kAMyQ+cOLPNv6qcLokBf3Ei3O4B
 47V4S5ACNEH/uvsK1y+db4jAWQQ14/IcjLQZDLjUt4fAmq6DVeLj3I0mn
 +yNsOYsWlKbSLBRgCwCFLEwuyp4Ght1dsEHLyHFcagKWF4HxXx5DrB3Ri
 y5M5SwPJnFOm3reyzbanvQCEOkvGyyadVyZAez+PCLzUjkm6BolBBG4PN
 USz1YW8z1i1in72h5TYmlwfQVsSkWMWmK++a3nRfmOIzN4nyFfFH4aPtk
 hXuKNbF3CivLQMHIKbzD7ry/F2CWmDbr6espj5run4Wqs9tC6bjtu513w w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="1442805"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; 
   d="scan'208";a="1442805"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 00:28:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="895451530"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="895451530"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Dec 2023 00:28:27 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Dec 2023 00:28:26 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 8 Dec 2023 00:28:26 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 8 Dec 2023 00:28:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gJk56NtWTDBtX1XDFMHsPvwxB+Bl0UQRpphTsmJujlQRCSMnG4asNnam1TgNLGWCDT+KFrhFjMZ94DDpEW1rKdSZEmIJcHrtFHA4gFg3j7ORVo27NSJXO/8Ig4gIyrK61gBtulmwDJvXqCRrIJNUc/KgGM/GDFh4H9db/RpcZUPENzSN4+hphFN1vrdQliVJ5uUAPgHDlIgkKSKz6RU+7fEmNCQY8kLnyOqB1jylO/Vmnfivd5EhwxEVhfIOBPnWgMxALEjZ7F2p/oG7bjk1BpGWjgsLTcQd0IlhOVT0dyoWQgdRWhER6dfeO7XGz5xjCCJ4XK5+ERIxxPEwRhNB3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FH1ON/6XGiSZVSGTsm8RzoVloxT7HHKctWqnEO45rcw=;
 b=O6yZur3ZXoQ9MF9IKmc9HO5WXIxIe15hS8NlixMEq+3M6AMhggycg854JgFuWEP/7qmBKZb7Ja7ixQp36OpQz3wlHBiqY50ELyJhCP3gTCrsu4TkW9J/OJGf+KWHLzrVyQ3U07MVfeeHg73mDv4LGJZhIsJE1O/X2U50rK7Y76ZB6oqmLjZZk1AUnyTi4WKDh+d/bQbgOt799rTzPScjOv5k1U/dnWDTVuooWFlWg2J6M3gGXJ/dPIle1ceceOFFKJaulTPSDHV3FABwfRIFWOrNFoulmXSPezRYVouSKtzsOByLbDx/mjlwCGMHKTPTvSRzFVCfNHgksDDvx5c1cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 SA1PR11MB5948.namprd11.prod.outlook.com (2603:10b6:806:23c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 08:28:24 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52%4]) with mapi id 15.20.7068.028; Fri, 8 Dec 2023
 08:28:24 +0000
Message-ID: <692a9b93-dfba-43b9-a838-9e4cd20fa093@intel.com>
Date: Fri, 8 Dec 2023 13:58:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v3 1/2] drm/xe: Add a new memory directory under tile
Content-Language: en-US
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20231207151739.1241374-1-sujaritha.sundaresan@intel.com>
 <20231207151739.1241374-2-sujaritha.sundaresan@intel.com>
 <SJ1PR11MB6204399019B23285D88A04B1818AA@SJ1PR11MB6204.namprd11.prod.outlook.com>
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <SJ1PR11MB6204399019B23285D88A04B1818AA@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0065.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::10) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|SA1PR11MB5948:EE_
X-MS-Office365-Filtering-Correlation-Id: b4224fc8-bf36-424a-37bd-08dbf7c7a4d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VojS8aWmXR/u7BC3cLLbadWu/DfeAq6DUVNC9/89c1SZ0IFlMpUroXzvCfbTnv1mnvc5kNwRWP+m83mASt4nkYdTxTkup8WdxwjeOQv3V3MHtEIZzdz9bvpPmAhihcipB9WrrCZtam419NRDhai4/pCCSpZhmhhJO37aywJMvKVEsT2c/+rkAYVkkrgrijG/tdDDchMAlNa82ARb9or77EGWb0EwW2XAWilfT10TCbwOV0UZoZhWBtVHOa84/v/AVJAibJd4zLwHaTd1AMG8wgPZJnt5HB8+bUOs/+HQwLTi7nqzkrrNwUfSuWmycxrhtXAUNAlFEDGieN08Q44wkplPdi8YFqn6dTmqBDmkfe9LEHut1D3VImIy3cmg3M+S2flcDEKOHTw1Q2qwGHs1OCyc6+28O7qITtsja5xZ5xs+CGwPDexuuWQ+XJ9jTsZ4JvlAeFD39D/WclBEr3qieaKSKMQlth04FoCYC7Dl8Eg4bHrZLXeP8XVZtbiXSPhyx3z1+xbO/Eb4Mq3DbzrhYMZQGJm6J5lmuFb5jj8wsd9gIcVnVc9z7w8Jzc+/wRh4kIM6V7rfMAWNadErUQVMvsrnmuJlltHKwZZbAtKSOUl8Fxhy9K4VX+W60Lpau2kIePvMBF3AUbwCj8/4epIOZw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(136003)(346002)(366004)(396003)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(26005)(6506007)(36756003)(41300700001)(6512007)(53546011)(2616005)(107886003)(82960400001)(83380400001)(2906002)(316002)(5660300002)(66946007)(66556008)(66476007)(54906003)(110136005)(86362001)(4326008)(8676002)(31696002)(38100700002)(8936002)(31686004)(478600001)(6666004)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UStDL2pQTzlxMnNOWWVHYklsOGQvbGRIMk8yTXl0bmNkakNhdld3QU9vNEZx?=
 =?utf-8?B?QjRCNUhZLzh6VndSOG9wcUpNREFvSlM5QWRBNW1IMVo5WkdFUkcrVFQxRHUz?=
 =?utf-8?B?eHFXZVNpUFpFVHdTcElpVmkxUWpCZG1mTXliWWtWWi9QRU5lZHdlZFlmY2x3?=
 =?utf-8?B?NXlvaC9weHpzQURaN0F4TGxtdVhrMDJCRlZ1cyswMVJYcWZ1MHM5MURqeGFS?=
 =?utf-8?B?TEpVSDd4QU1HMEVEZldSOURqdUdJMFVuNjlIN1cxeE8rR1RDb0xwR1FKWGw4?=
 =?utf-8?B?YlB4Nk9WbVB6RVEwNi84UjdvSUZPMUd2YXdSL1UzTmZQMmp2bGdIMzI1d0oz?=
 =?utf-8?B?WFlHY2VTOW1tMi85c2tTOU4rM3lqNElkSTJZNDd0UVRtMDRmMjJDVThWSDYx?=
 =?utf-8?B?T3daeXpSNDhqMnUrUGNRaG5uektHY0xkL2IwSmhKbi83Ty90aXBjL2ZsbXE3?=
 =?utf-8?B?aHJ1b3NmcUk2dHU2VDE2eVkyVDhIcUxKQlR3SHorTmRCdzNYMG5ISm00VnRL?=
 =?utf-8?B?aUF3Nm9Ja09BRDNyc05XMXUwMlFSeEVjRmttdXdkVHlKYVFCNlB1TlhXNC9C?=
 =?utf-8?B?UlZYcjJKZmpJaVRUS2swWGlTa0RqZXlUL2FXdjBxbHRIYitDUGEyNkY3UnEw?=
 =?utf-8?B?WGhOTDZFc09oUUhZWHhSRFZCOWtteEUwcEpYdER3dEN3aDEzZjJRMGVpblR3?=
 =?utf-8?B?MnBWQWFPNlh4clBxTmZydHB6TU0xQ0lrUUhMdjQveWt6YURxY1Bqb0xpSThG?=
 =?utf-8?B?Y1BTMHJQdDZvMUNzcjJKQkkrZXZrV0dIZER3eE5mYzRwNSsvdE1BNStYVzFu?=
 =?utf-8?B?enhSbmVSYjJkNjZaMkYxWnJWOFVtSDZjU1IzeUxJL1IrYkhlR1BYcFRkb2s3?=
 =?utf-8?B?cGN6elhsOUNPUVM2Uk43L0hkbkYyRkZGVHQzY1pUM2ZVUlJzVitWdnFPZDZK?=
 =?utf-8?B?dVJ1eVY3QVplSXdBV2MxZDBPZ1JhaUJjZ1Y4SHJkQU9oT3c3dmdZWThoVWJB?=
 =?utf-8?B?cytNOHBSNERWR1cyZmJsclVPSVZaQ1Q5b1ZPODZTYm5nazJ2QTNPQkt6emlq?=
 =?utf-8?B?bXRwUHV3elp1SDlXTUNYaWdIMCs0ekFKRkZJVDd1VnVmRkxpaEtVemVoYVl0?=
 =?utf-8?B?K0tTNXlzWU9DQVJsWHRJQUUrU04xNytzNEpkeDVER01TKzNLKytTdlJpTDhY?=
 =?utf-8?B?S203bjdMWUZTd1l5K3BxdGpMNWMyK3pjZVlPdGxQNHQ1aUFxd0NOOHZ2ekN2?=
 =?utf-8?B?aGhXRVZzRG5rYmpEMU1kYVRyQUtuWnBUSnUwVWc4cGJ1MVpmUFpyVU1wSjZO?=
 =?utf-8?B?Y2hHUUc0WDQyN29zM2hrOWZkQXgzVGN4QndWSWRhNjlVKy9TM2xpTE1YaDY3?=
 =?utf-8?B?R1pQaUlsYk1iOTRGeGxqOUNNRlJvQmUzbnFGWGxxZ3JOVlVXTk9vWnVjcHVE?=
 =?utf-8?B?WGVYREpGMDVxbDlLVzVNNFlCUzVaSmxNbHJEdXR2cmQ1NHFLVWxiRGx1WXFw?=
 =?utf-8?B?WWNkbEliVnk0ZmhoK0pMMFIzWU1IMFd2WWVMNWJ0Zkp1SktGeWNnZWZyNHhh?=
 =?utf-8?B?Q3c4SVIzYXcvSG5vYmhjSytoVENJcnptdE5KYnJwNWxGOFptQTZMSExSR2hP?=
 =?utf-8?B?MzE4QTd5MHJQNXZBcnl1WUtRVHlnbXpNWnBwaVhjWHAydXNDaHMyckRHM3RV?=
 =?utf-8?B?NSthOEd6Yy95dkUvc1dwNmFrSGdiSjhZT2xDWEh3dlFRMkZNMFVINk1TZ09z?=
 =?utf-8?B?S1l3d2Nkb2NZTGU3TFRnbURJdzl6TDl2SVExQ3hJT2JOTllDUy9WTEw3UUdt?=
 =?utf-8?B?OGRORTF1MzRmc2NCVEZlRThSTWFYeEpoZG9Hdm9HdGtKRmdaSlpYakV6OGpa?=
 =?utf-8?B?dzk4ZktIZnJudWg2bTdxWk9NUXlZeEF6M3lxdUtLTmVyNDRRZVpSbExMRjl6?=
 =?utf-8?B?R01KMXQyWUFSMlpUNHdZU0VuVUdUNURuOUVzZ2ljdHpHS1ZkS1lHZGpUK1ph?=
 =?utf-8?B?cWJ4M1hiZW90MjIvTkIxMnY5MFVreUs5QUpKS2RFRXY2ZFJHdHR2TkFGMHJS?=
 =?utf-8?B?WjVZOFNOT2J0MGthVVY1YzBrMlB6UzFsRW1PQ1NKSGhHeWdxdHA4NWR6MTZC?=
 =?utf-8?B?ZlA4WW5NcndWeVZHeGR1Zzh1WHNQTjJCOS8wWDhZc3M0SWVFaUU1UmVMbm9s?=
 =?utf-8?B?c0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b4224fc8-bf36-424a-37bd-08dbf7c7a4d5
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 08:28:24.2589 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UUSL5JEPMyLva9SB9rmNiPmWLKUBKSfzuyJyP1Xmmdpfol3ArtJZlKETM/3BfucqbKrcV+1M0RGPBE6c/mkqArQm8RaVSNx9nLMewnw9TIM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5948
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


On 12/8/2023 10:33 AM, Upadhyay, Tejas wrote:
>
>> -----Original Message-----
>> From: Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>
>> Sent: Thursday, December 7, 2023 8:48 PM
>> To: intel-xe@lists.freedesktop.org
>> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; Tauro, Riana
>> <riana.tauro@intel.com>; Gupta, Anshuman <anshuman.gupta@intel.com>;
>> Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>
>> Subject: [v3 1/2] drm/xe: Add a new memory directory under tile
>>
>> Add a new memory directory under /device/tile<n> and move
>> physical_vram_size attribute to the new directory.
>>
>> New hierarchy:
>>
>> /device/tile<n>/memory/physical_vram_size_bytes
>>
>> v2: Fix heading typo (Riana)
>>      Fix cleanup error on unload/reload cycle
>>
>> v3: Fix reload error with kobject_put in place
>>      of kobject_del (Tejas)
>>
>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_tile_sysfs.c | 19 ++++++++++++++-----
>>   1 file changed, 14 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>> b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>> index 16376607c68f..64be1f3a38a9 100644
>> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>> @@ -24,7 +24,8 @@ static ssize_t
>>   physical_vram_size_bytes_show(struct device *kdev, struct device_attribute
>> *attr,
>>   			      char *buf)
>>   {
>> -	struct xe_tile *tile = kobj_to_tile(&kdev->kobj);
>> +	struct kobject *kobj = &kdev->kobj;
>> +	struct xe_tile *tile = kobj_to_tile(kobj->parent);
> As Christmas is approaching, you might want to adjust this in Christmas tree order.
>
>>   	return sysfs_emit(buf, "%llu\n", tile->mem.vram.actual_physical_size);
>>   }
>> @@ -36,8 +37,10 @@ static const struct attribute *physical_memsize_attr =
>>
>>   static void tile_sysfs_fini(struct drm_device *drm, void *arg)  {
>> -	struct xe_tile *tile = arg;
>> +	struct kobject *kobj = arg;
>> +	struct xe_tile *tile = kobj_to_tile(kobj->parent);
> Ditto
>
>> +	kobject_put(kobj);
>>   	kobject_put(tile->sysfs);
>>   }
>>
>> @@ -46,6 +49,7 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>>   	struct xe_device *xe = tile_to_xe(tile);
>>   	struct device *dev = xe->drm.dev;
>>   	struct kobj_tile *kt;
>> +	struct kobject *kobj;
>>   	int err;
>>
>>   	kt = kzalloc(sizeof(*kt), GFP_KERNEL); @@ -64,12 +68,17 @@ void
>> xe_tile_sysfs_init(struct xe_tile *tile)
>>
>>   	tile->sysfs = &kt->base;
>>
>> -	if (IS_DGFX(xe) && xe->info.platform != XE_DG1 &&
>> -	    sysfs_create_file(tile->sysfs, physical_memsize_attr))
>> +	kobj = kobject_create_and_add("memory", tile->sysfs);
>> +	if (!kobj) {
>> +		drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -
>> ENOMEM);
>> +	}
> { } is not required here.
>
> Tejas

Will fix all of the above.

Thanks,

Suja

>> +
>> +	if (kobj && IS_DGFX(xe) && xe->info.platform != XE_DG1 &&
>> +	    sysfs_create_file(kobj, physical_memsize_attr))
>>   		drm_warn(&xe->drm,
>>   			 "Sysfs creation to read addr_range per tile failed\n");
>>
>> -	err = drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, tile);
>> +	err = drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, kobj);
>>   	if (err) {
>>   		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset
>> failed, err: %d\n",
>>   			 __func__, err);
>> --
>> 2.25.1

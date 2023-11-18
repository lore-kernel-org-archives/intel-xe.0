Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E79D2C072A2
	for <intel-xe@archiver.kernel.org>; Sat, 18 Nov 2023 01:25:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A834110E0C7;
	Sat, 18 Nov 2023 01:25:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 563D010E0B1
 for <intel-xe@lists.freedesktop.org>; Sat, 18 Nov 2023 01:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700270707; x=1731806707;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xddr1Z/LKc4VA+KiGVkQD5fyZeq9PBt50FFs5WIrKTo=;
 b=USA0FFvNPhlYPT4lsxtJdZGCMxeok1zLsW3dzydYBW/EDCVxrzf13bjU
 DojV+VwnAzyYZhf78CEjlArol5PCNOUpdbSCbGN3m3xLRp2GlrbjwExLK
 0DijmFmnln/NccglFI+Is49m1zsR336g5qaB/IxMwoFkLv3OP1inFZk0d
 NmzyDx2iJM3ck6OrjyuuEkmsSoZBcmGZCvn3SyOTKBnjIqZUxQEjsSjvm
 WPjGB5VdFjzbApUx9kSuZdgYfsgp0H2I2P0wGgRkhX/5sT3YR3mnb8ee/
 U8FMZBlqnZIEoGWsEwXVrWEvwbic+00TnyX5XKP11bIx7epxCKLvUS493 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="391178555"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="391178555"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 17:25:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="14068741"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Nov 2023 17:25:06 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 17 Nov 2023 17:25:05 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 17 Nov 2023 17:25:05 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 17 Nov 2023 17:25:05 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 17 Nov 2023 17:25:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SzvVfRDnAvZG4YnlICxRUo9HCYmsiYelJQvmSpRjHbMmsA+UG3QAi+dbBBftDiOZfA7cc+70ryIU7bt0+QyAb3YEzdv5izs9nlCWDIW4G8iK1h8FV39/c5LXG6+qcUiIDkvekxjyzueEAEBGu52jcTnedfP1vN/6u3MIE6uIo1FvBL8jHm0mYryp9XxmBpMbOZaaRoq3aTBETOROAmok8TwWQdh5XrrvDC66h1XwCh06azQKrkswjcbo33z3gxB/WIIaaro1cs9sYx+TeOS1Gx2CzmJz8Xaf9ObgNP+8vZIB6S8pzul2DprevoGoJgNrieLjI3Uj/vv5frLodOggeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hQzn3a1P3ssvY//pg43Gnju7FqG2Q+QxFjFU9kLFHgk=;
 b=Po++Y4lr56pGm0b8XTelifpcIiDmPtyTYPTwyjryTUjJ+GejNl4imzBpI6eO8l8o6RipGToRaV3HCuLv95BlIzW7SS0JJsA64k/UAuN3vR4kIl8Lh7nez9nPnoPg8RA75OUnXPokzMW8SMJKR0Q9HJJOUaZxaod6uwotBYBy+1VtxA0WshH9uPklbUoSwE/2VAvG/fNvDG65K4GjgI4oMWJ23bL78V3XTgtwmKY1qWx92qf2N9q1oW/A9u7VLgNbjUTo0sUzV5Iw0mAZ+jBuudFhTUQTmvgp+Y6bAvwpxjS53s8bdLYp97G9eCzsC7KIqSjEH1qscO4zsi/j79A84w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by CH0PR11MB5297.namprd11.prod.outlook.com (2603:10b6:610:bc::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.21; Sat, 18 Nov
 2023 01:25:02 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::c947:cbd4:3870:c36e]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::c947:cbd4:3870:c36e%6]) with mapi id 15.20.7002.015; Sat, 18 Nov 2023
 01:25:02 +0000
Message-ID: <165bdc38-a10c-4bc4-8a51-40c15e6cbc7d@intel.com>
Date: Fri, 17 Nov 2023 17:25:00 -0800
User-Agent: Mozilla Thunderbird
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Sujaritha Sundaresan
 <sujaritha.sundaresan@intel.com>
References: <20231116143043.908412-1-sujaritha.sundaresan@intel.com>
 <20231116143043.908412-3-sujaritha.sundaresan@intel.com>
 <ZVfdHp1M0BPtn457@intel.com>
Content-Language: en-US
From: "Welty, Brian" <brian.welty@intel.com>
In-Reply-To: <ZVfdHp1M0BPtn457@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0024.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::37) To SN7PR11MB7705.namprd11.prod.outlook.com
 (2603:10b6:806:32f::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7705:EE_|CH0PR11MB5297:EE_
X-MS-Office365-Filtering-Correlation-Id: 8964a655-24e6-4f7c-c6e4-08dbe7d5301b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IZTP9tlHOj+53hUG1U0JBYSxsExmqVUW/buRWqPuHvL6/TXIRihPXKemKbMpXOf1B+DMpoFthrVlngE6+SEdb55SxHDC7azZ3i6jeVMGWw30nF0Zvb/AuTgDB9+mmVj+wKKROFDtMJgRa5zMdf4RLUZ998709WV+BAL0Jkq1fsyAahu+capBOTt9iRA8W7xGbySNnEJGIW09tEQ9VRNLADIJ5UDA14/l3ngvezqOi2npn0GE2IRymdaW2LJznTDHk5sqF1xdNgVBlpg8gTP8L/Jpjbnnn5Jqs34dwGsYMq8asb/SqFMohkDi3Bq4J8GjoSheHroPwOyr1tfazAAYUldp4EMo1vi0Fw/BCf8W2E5PZgdROUqxmLD1wPxbuhRYcwpApHPY9bTyYdnYOmcCYLkJ5/JX9rNKicCZOc3L3XpRG+1djzkK9w4ouG+Dztt3FiNUQX399+auh5Exp3EiKzwZaMGy2U/FWjkS5brdaqzqj0V7ywpjapYK+wPZwOTDhtti0G8TfYuLP5JOYF21fwFGEqLjkk9PnVl9qDbZT35I2XI+XzFS7r7FZWwp2IIttTcWayWsVN8JSIXGni7yQPrB0INtTNUPYrMzBMmfEj53zM2nsqlRaD/oyqHfhxV0jMo2tVcXk9QnaTyfoh6r+g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7705.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(136003)(366004)(346002)(39860400002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(4326008)(110136005)(6512007)(66946007)(316002)(6506007)(53546011)(66476007)(66556008)(6636002)(6486002)(8676002)(478600001)(8936002)(2906002)(38100700002)(41300700001)(36756003)(26005)(2616005)(31696002)(107886003)(31686004)(86362001)(83380400001)(82960400001)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wlhic2xVTTJuNDhVcGk1eUhrQnJEVFZYNCsyMHJqQzJYOFdMSGtRTUpScHRu?=
 =?utf-8?B?TFNsZzV6RWF6RDYzZ05TZHBzLzBYYWNrN2pJZGhLeVF5cWVyZ2lRd2orN3Nm?=
 =?utf-8?B?QzFpMk9FWlNYdnR0ajA3aHJ1YUFFSGFENE5TL2xOemppTkdKN1hLWENOUm5x?=
 =?utf-8?B?eXVhOFFjZnpIY1BHRUVqSHRMZ2R0UjgyRUZtK1dDL3lrU0tJd2ZqZnJKbUxF?=
 =?utf-8?B?N1QrUE5ia1ZySTZ1eG5WeDB4OEh2NUp5MzFiUEZoZDV5MEpKU3NnVVZCZStl?=
 =?utf-8?B?c1ZPRjRUc1NzQ2lwVWQwTUZpdnhlcDFaNDVUbDI4SVFTbUpPL1NnTG9zQ0xH?=
 =?utf-8?B?SWxoWFQ3akNGajZHK25YTXZhK054T0ZVVlllU2R3SkFMcEE0QnJ0b1MyN0Zy?=
 =?utf-8?B?L3J5OWxJdFp0NFA2djZHRjF0K0ZKTHZubVNuTUd5VFRVRTlwUk05eGtrVGFo?=
 =?utf-8?B?SHdSRlRudGNNWk8xRUVRSzhDTzZ2b1BFQUM0WDFma2VCUWloVTRKdnlLWXRY?=
 =?utf-8?B?cVFQclppS3dqOVZTZ29qc1pReVhaY0ozdGpoQWdaZVVzVWZiaUxIcXVXcnFy?=
 =?utf-8?B?M0FQZ2VEdlFnclVKQ3B1emYvV2ZkWDBoR0lEQzFhRzNMQkpxdzNjT2hnRzU3?=
 =?utf-8?B?REJHRFdWSlZ3dHJiUGZnemg1bDBNRkhvODNsREJaZWZXZ0FZNVpUbU5pdHZn?=
 =?utf-8?B?M2pVeDVYaXJrME1XTyt4VlFjSDROcnExNjhwSTR6Y1FWQ2xvN2ZGRlVxbWR0?=
 =?utf-8?B?RUFabGJHYk1xZ0RUWHlaVWZLUXBzdllTU3NWRklKalR0RVk0MFh0bWFLWFpD?=
 =?utf-8?B?NHNzM1JtWmd6RG1HU2dFc3FRc3RzckFFV3hDKzVlT3luNGVoRHVTdS91N2dW?=
 =?utf-8?B?c0ZQM0pYcGMyMi9qRnRVS1A4TUt6MjUzdEVKQnRvN1RpcGdoNFNOTVlsWS9h?=
 =?utf-8?B?VmUvWFJhYjNTblVOZ0srTjh4eURzWGVDK0E0RUE3QW9pKzYxWnNTQ2o1bVBs?=
 =?utf-8?B?SlRGdi9YUjl5Rk5NZ1JxR0tGZGQ1TkhZQ3lxc0M1bkxCeXBLVTliM1R2ZS9j?=
 =?utf-8?B?OGlzaDUrekNpc2xQV29XR2JJSmU2R05QUVVjN0xZb0RsaUlibFUvdk5XWFFn?=
 =?utf-8?B?RS9uOFNhdG1oRmN4UDY0VExSa3dmVDB5SXl0UGlUcmpySTFnUzVRYkl0NXlS?=
 =?utf-8?B?cGFhTVpCb0g5cEwwTzhOKzJvSzdHNll6M1ZmSWNpRkRrajJqSUhNblY2M3N1?=
 =?utf-8?B?ZFdWWU5tQ3lDTEpFeThrWlBEbWdSaWJJWTdyWnZkT21JcTc1NnlRY3BsRzZC?=
 =?utf-8?B?MHZ0ZW0rTEJ4cVhVSFJzVnRiTEtzR2tIcStyZWF0NGloYmRUUHJYa3I5dGxt?=
 =?utf-8?B?V29wUXJNOTgxYmVaSG4zeEVoVFl5L2p5M1BpUmN5Um5zdjNjSHlSNUE5aVJG?=
 =?utf-8?B?ZlB0U1cvcHlPTnV6K1g5cTFzZHpFbXlwZlhNbnBXRlVDSVVNeEQxZ3dEdHZV?=
 =?utf-8?B?WTNlWEtFSlRXMUlkT3lkamh4b0hEYXpHeUFVY3NsRzdXTUE5RmlpL2IyT3pk?=
 =?utf-8?B?ZXJXcmFPNkdXY1FDSFNzTUd0QWY4QXNjYjM0aENFbGU2WnRtREFZWVlvbVJs?=
 =?utf-8?B?Z0lveXA5U09KZnJMUzBJakQ1MlpSWjhqc2ZIbU9GVnkxWmd2TGpHRDZOZnpH?=
 =?utf-8?B?SlFOaUgxU0VrTWpKYU9BejQ5QWhjRUl6MFRQUXRJZUVNYzhyMzB5NTJKb2hh?=
 =?utf-8?B?ZEFLcnprWGFXMlRjbjVpWEhDZXVjYm1kRy94eDhGVE1wb1VpbnFWOHRFdEt2?=
 =?utf-8?B?clR2cjlZMWp4MGFNUWYwajA1SjhtSUdFM1Q4UDhmbTRyWWRMRlBXeEUvNkhR?=
 =?utf-8?B?TjQ3VEhnQ21JU0lrTldiSXJjTVRzUjc4VEUvS0g1QTVqMmFYWkxYMGM5VnJr?=
 =?utf-8?B?WXd5NEpjUVlrVFoyTWQwRldJWGZQWWordXl2RUlsS09qTU5BSnNJdWZWem1v?=
 =?utf-8?B?YlFqU0JsNjZqcmUzWEZOQ0tWSlZYemU4dmpaTW9LQ1E0cG5xeStKZFNHMGNU?=
 =?utf-8?B?WXVCUm84bjBiSUloRUtqQXlnUWRtTHIrUWFkQ2VwaDFjUnFLRVpsQ3dFUWwr?=
 =?utf-8?Q?YK9rjtBJIr/acOgJCHVz/gq+P?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8964a655-24e6-4f7c-c6e4-08dbe7d5301b
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2023 01:25:02.7400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uwF7ZtGBmM+h8Pv62bEkcbTNbQxfn/ECkfIWqxLAZ6TB08zmi2S2grAJqx88rAgZdEDjivICpKNXSZQhd/bs/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5297
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
Cc: intel-xe@lists.freedesktop.org, vivi.rodrigo@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 11/17/2023 1:37 PM, Rodrigo Vivi wrote:
> On Thu, Nov 16, 2023 at 08:00:41PM +0530, Sujaritha Sundaresan wrote:
>> Adding a new "memory" directory under for vram attributes
>> under the exisiting tile<n> directory.
>>
>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> 
> Cc: Brian Welty <brian.welty@intel.com>
> 
> Brian, should this directory be under the tile, or maybe we create
> separated xe_vram_sysfs components for
> 
> /sys/..../device/vram<n>
> 
> and then if it makes sense inside the tile we just have a symbolic
> link between them?

Oh. Good question. Seems reasonable to me to have vram<n> in both places 
as you suggest.

> 
> Or better for now go with what Suja suggested and then later adjust
> with symbolic links if needed?

Yeah, maybe defer doing anything here until later...

But let me ask....
Was it considered to make the sysfs hierarchy more flat?

Could also go with -
/sys/..../device/gt<n>
and:
/sys/..../device/vram<n>

and remove 'tile' directory?

Could add:
/sys/..../device/gt<n>/tile
/sys/..../device/vram<n>/tile
if feel is important to communicate which tile they are in.

I don't know, just an idea.  Feel free to ignore.

-Brian


> 
>> ---
>>   drivers/gpu/drm/xe/xe_tile_sysfs.c | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>> index 16376607c68f..d61c6fb1df40 100644
>> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>> @@ -46,6 +46,7 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>>   	struct xe_device *xe = tile_to_xe(tile);
>>   	struct device *dev = xe->drm.dev;
>>   	struct kobj_tile *kt;
>> +	struct kobject *kobj;
>>   	int err;
>>   
>>   	kt = kzalloc(sizeof(*kt), GFP_KERNEL);
>> @@ -64,8 +65,14 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>>   
>>   	tile->sysfs = &kt->base;
>>   
>> +	kobj = kobject_create_and_add("memory", tile->sysfs);
>> +	if (!kobj) {
>> +		drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -ENOMEM);
>> +		return;
>> +	}
>> +
>>   	if (IS_DGFX(xe) && xe->info.platform != XE_DG1 &&
>> -	    sysfs_create_file(tile->sysfs, physical_memsize_attr))
>> +	    sysfs_create_file(kobj, physical_memsize_attr))
>>   		drm_warn(&xe->drm,
>>   			 "Sysfs creation to read addr_range per tile failed\n");
>>   
>> -- 
>> 2.25.1
>>

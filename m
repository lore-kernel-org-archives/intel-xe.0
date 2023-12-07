Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E581C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 06:45:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C72D010E7B6;
	Thu,  7 Dec 2023 06:45:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9794F10E7B6
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 06:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701931517; x=1733467517;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EkbF7PAS/9RZML3gbu5SQz01w3YvzNOSb1hGtIoQWYs=;
 b=jn2mnNs9MtICffKiRAEUoo+96AujHc9OQhuOxmjZHcIoeb/Dv/IhyQj1
 PZjSX7zw7x2r4vC+CVj0ysRCNDlLzYcEL6IQNDlImdfPYW5cgDa48bdJG
 NcdN3MRfLCuvvwf5TZQxDbcRzbR8bsgwq+/wsCSsqxSdyuxzhGQpKJh5z
 OoxJ3c572UAWhq4NBkzDK02D4uTCsovK39uWj9OjSFdTARgblo22z/8NN
 0VKapvg1xYWob9WrbM1qOEclqsbnpHwbflT3pKsvAoziHlXH8y0v+Ngxd
 cCBSM+pAVqLn8CVt4PcMWeQ/hhpYrTzmGObFfYNoZU2NG1IayyVM90qzi w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="7495201"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="7495201"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 22:45:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="765006495"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="765006495"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2023 22:45:10 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 22:45:10 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Dec 2023 22:45:10 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Dec 2023 22:45:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iDTjwaY9mHtf3eIlBys0UVAXLxttN/eo4kztwZvrUFkqhTlaLVw8qhFnySzZbAclquUrDcNh2ZEhwOL5oSf2GT4x5CMTDoGsosrviX8zSUi+Nym1RP3H21gmri5W9z3F1RTVlkmisv0b5RV6c6q9Wma3OPuNeQMhMcLuWnNJlCqEFB9NEmQzRVnrR8n3s92ChphcR0BSSL8+MwQg+FAFV6wqGF3tIgdafJwJLtzDwDaK7Sf50IF36vpKpAhnOky9Xu52D/e7Q9VWKOyusz2m5EZ6vGWYBdtXGv0Q7gUbiQtuWOLuimsgZCQYhrP3uWdFXu0aU26iaY1Ao5sO5dr41w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1iTNQ0bUwiLChOhkfwenGybEXOJR/vp7zUfs9i7V8QQ=;
 b=AY/aR2Svntw3khxf9i9zOI0S7Rx4yjl6S3uVzArXSAqBuRfhgsW/w+98tTz2Jp8QqTtU4fTuqRbLLO3sLUpfk2JDfOVlYUraXwzQKQiOWPRgjcDnUjISqBxqmd32kgBwOXfUVFTMCjd0bfqH63R4XB+LnusRBf/3wGYiuWsLa+P/sblD/xltvUFZ5Cqq8EtACivgc+4udPpbI1zbsAE5KmHNyx1nwMYUkaY8MnjjlSNdFFypa+XOh37lNGOBImlIpjki7tyY9tA3/mlK5TDTKTy3AZXd/KctebSi7ApqHdF9Et1CZjvmfDITCp6WRkXMHxGUGKYUT1uiPM96Xqsp2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 PH7PR11MB5944.namprd11.prod.outlook.com (2603:10b6:510:124::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.27; Thu, 7 Dec 2023 06:45:08 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52%4]) with mapi id 15.20.7068.025; Thu, 7 Dec 2023
 06:45:07 +0000
Message-ID: <e1dc61a3-15e2-406c-9ccb-cbe8800e408a@intel.com>
Date: Thu, 7 Dec 2023 12:15:00 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20231206044735.966213-1-sujaritha.sundaresan@intel.com>
 <20231206044735.966213-3-sujaritha.sundaresan@intel.com>
 <33c65d14-bb41-4091-b3ab-8bad50ed38fe@intel.com>
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <33c65d14-bb41-4091-b3ab-8bad50ed38fe@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0061.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::6) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|PH7PR11MB5944:EE_
X-MS-Office365-Filtering-Correlation-Id: 163c2594-fe32-4fe4-1184-08dbf6f00cc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hyoS6HgN2Z2IH/fRo6QltqAlb6SA5ccfAOUwz8IwLcJv2s2aGdCBHPlqLfpxZH2iEizwwlB8DUeSzUWnj//IY//UlDhpf9U/rwnLE7Yv9OWFfxLHBm8bPCRqLhK59Il6oS02fJ4EuEG6CwBw7oULehBHHLw6AoTliiwieF/1hnBvkgs+sErOxcleuRlK0RLI2iCFgdOj78zePH8H9HWFyYq0KoOIirt7X01ZnQeW2/nNQH/fHJW5ACIQo42f7qvYbrY0Lc9wAZmgyHgXZCcWqL6pC9qtF63OqJL5g70nje2EoQtgPWF1Tg4qPPAN4NzI21fthaadSuobcxNgGdGRjHTqnRhmaMPJCK5MJO19X2ZmXUXWFUgCPTTKcc6OD9rZOn7x+BzBsa82c4yaGZDNEOryTB3aUZ2JLvuQCWcIoHCP2h42pzlWVgLFnasKKF/U3QV+28qn6D9LWRxJ/8G1H4AOIueK81grJuPH1lB8n6IziziBmm9MgBpKH/SEhFLgifqvHOyoHjwlD2CWZBIbU3sBsN2q0Em5BOVPo1SQ6LS9FbdhoaKoAP6ycoM7riXdikwPeLYwqZIaI9JvHQtREbVl0GbLBDDRpflft8iFWo1E7CZhNEfJKKK5XRkeQLTCMjrebHWUp91kFDqV2Z5j8w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(396003)(366004)(39860400002)(136003)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(316002)(66476007)(66556008)(66946007)(36756003)(38100700002)(6486002)(478600001)(5660300002)(6666004)(41300700001)(2906002)(8936002)(86362001)(31696002)(31686004)(2616005)(8676002)(4326008)(107886003)(53546011)(6506007)(82960400001)(83380400001)(6512007)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWhNdElUNXp3aVQyN1VJLzZPdEMyajJDdmlLTHFHdm5RL3FQaVU0T3lVYUx4?=
 =?utf-8?B?VnFSL1FKb3RQUVRrQ2Y4eU5qS3oxZzdXMTBwWTJza0pxZFAvZ0FxZDRRMmxm?=
 =?utf-8?B?TVovT1BNNXFCNjhuWm5PQXZ6bFVJemRmUjhncjVUc2lmM0RjMkFBLzlTN2ZN?=
 =?utf-8?B?d2JGODJhMXJzSmFadUVTc1drclZBQzFVUFVOeExsamVJNVRoVEhKU2NLKytR?=
 =?utf-8?B?SjZpNHlmbEY3cFIvZzB5ODNqaE14NStjcUVYa1BiNlBsZXRQNG9sR2hsNGd3?=
 =?utf-8?B?NkIvc3V6UDJ0WHBCYXRzSzYrTmRlUGV6dHc3M0FGQ0RuMFR3R0JRUmR1ZTlV?=
 =?utf-8?B?UjBoRkdQZDQrLzF0Z0lxWjhyRzdnUXk3T3ZpaDU2c1kzRWdnMlZrRFV2RmJn?=
 =?utf-8?B?WEoycVdYRUMyMHU2dUcvUDRNSnpzb05qVHlxQnAyQXpQcUkwKzA1emNOQmpV?=
 =?utf-8?B?MllZak5HdW1iN3haRHp5L216alBCbi9PMStFQU1xQVNNL1lCdXdmaXZmRCtR?=
 =?utf-8?B?a3JpVWxjVG5PYWlvaXZpMTYzMEwwTE9JcHNxZUdYTnFhWFhKS3V1ay85SEJJ?=
 =?utf-8?B?cnhBUWJlYmJqVDhHUWFhWFE2SVEwTFpCcHBpRTVLdncyaWN1OFJrYmNYVy9z?=
 =?utf-8?B?VW9pMzk0UnRhQ3FVTlhQbzVCcGdDeEFtZlNrZ3E0MkVHaktXc3oyazJ3WE8r?=
 =?utf-8?B?VmlXVWNSWUI3VVhKak04d0V4ZC9YQzFqRnp1UHJyZkViaWhxY1gzY3lGS2oz?=
 =?utf-8?B?cmI0OWJWczI5K1JzSVZLRUg0YXQvNWNHbjR0Ry9ZUzdDVVNvSUt1QTd1MzE0?=
 =?utf-8?B?ekJ0YTNRNVdYRk9teE1KTjNzbXN3bjMrZG85SWwvMk9zZ3M0SDVOOWNRdGdM?=
 =?utf-8?B?dnUwakVheHNzVkdFTno3RTEySFpTRzI4czEwMHVrWGJRd0thMW1RQmlhOG8r?=
 =?utf-8?B?dkN6LytHVGNsN1N5RkJnMHRTcit0N1M0UUdWbXFwSEZ5VzF2UkhHd3RhUVgw?=
 =?utf-8?B?bGVkeVBGQmFrN1ROdVlBd0cwTTl6OUlOQktlSmY1QTEyNGJSMWlBOU5TMzl3?=
 =?utf-8?B?YWRMWTVQdWFMaUhYQ3YzY3BZcFBCUEJRZHhoN3ZUUHkrUW9EOXhZa0pTMkNQ?=
 =?utf-8?B?TVV6Z1BzL0Z3SDg0WDBpTDJ2UWVFeVFQWElFME5ma0lncXUrcjNmUzBvWlN1?=
 =?utf-8?B?Ky93aVd4dmxuS25DRkFBY2hucHFPK3d2dEtNZEl2WU1PQXdDKy9weCtPYi9z?=
 =?utf-8?B?SXFrTFU1dXBiR1JKWldWbWtTcXRnNjlKby9oVXI3ODJsOFJHeDNnNzVaNDJn?=
 =?utf-8?B?eEh1SEg0OENjKzNnWThJeFQwVkw2a3Z2dG5oL3ZiRlltaEd5RlJsNEExU1ky?=
 =?utf-8?B?dFVwMFpJQkdCb2YwK3VkYkdrS3pId1p0UDVNN3pvT0Z6M3JSNDBwNlNxUlVJ?=
 =?utf-8?B?QzArM28yT0haYTV3RVdFWDZlTmhZaFNlTHNOUHNIWmx4RUxCS2ZSNlhyMkRE?=
 =?utf-8?B?TmtYcExiM2VmSFR6WTc2SEU1TFlCRWxVNmNWZGxocXZGRVZNV2FXQ1kza1Jm?=
 =?utf-8?B?Uk9GRHBURnZMQ21IOTh5V2dzM0UvSmFaZGtNRW1GNGVaaEtVMkg0U0tNSjUz?=
 =?utf-8?B?OFJ4dnVHQnplY0srOGYwZ1FUdlNGNC9kTzNFZ3I2bVlhZWZDMTZpSFllYXJF?=
 =?utf-8?B?U2dlQ2JIa2dJNmJ4N3J1RDYrZEF5MVlWbHh6QVdUMVVsZGdxTFQ4anlvSVFP?=
 =?utf-8?B?enVFdmtDNldUUGd1dUVNTFVMWXBhWE1sbElaK3duelpLTUZaeWZqU3ZncWsy?=
 =?utf-8?B?cG94dFlpTzByNVFkY1RZTE0zL01IZ1FUL1hCNlk2TERjUmFZQUtKME5LZnBB?=
 =?utf-8?B?YU5SdVFMV005RDFicTVEY2RiRG5QbmFsQ3JjeDZkUFJyRU9yVmw2WW1ENWdp?=
 =?utf-8?B?RFMzSExZMUxHYTJiRTlucUhaaTZMTVhVNUtPZ05scWNNNW83dnV6K1h1bGp3?=
 =?utf-8?B?a1dWNEtJeTlzWDdWYjlLc3V4enIweGRmelk4ZTZyRFdod2J4MkUzQ0R0MFRP?=
 =?utf-8?B?SDAzNDNVV3IvckFMS3YrdG5xZExQWDVKeEJmS040UGVXZHFFblJFR0hkR0py?=
 =?utf-8?B?N1Z0VUREVnlsNzdaZ1pwZkRlSVNaa2RvdFZNcHN3NDZxM3VtMThGTzE3a21O?=
 =?utf-8?B?b3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 163c2594-fe32-4fe4-1184-08dbf6f00cc5
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 06:45:07.3205 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MxEz19gkWu9yK6w0P6f5Hvcx4xNKE4KszP2xFLgOr+7Rzh5OmL8RGCmlxsoCJtLzmw2BlHnB4oQOHcgb7iROBtxvIXJiRTy4v4So+HGd8YE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5944
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [v2 2/2] drm/xe: Add vram frequency sysfs attributes
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


On 12/7/2023 11:32 AM, Riana Tauro wrote:
> Hi Suja
>
> On 12/6/2023 10:17 AM, Sujaritha Sundaresan wrote:
>> Add vram frequency sysfs attributes under the below hierarchy;
>>
>> /device/tile<n>/memory/freq
>>             |-rp0_freq
>>             |-rpn_freq
>>
>> v2: Drop "vram" from attribute names (Rodrigo)
>>
>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pcode_api.h  |  8 ++++
>>   drivers/gpu/drm/xe/xe_tile_sysfs.c | 72 ++++++++++++++++++++++++++++++
>>   2 files changed, 80 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h 
>> b/drivers/gpu/drm/xe/xe_pcode_api.h
>> index 5935cfe30204..edde5335bdb1 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
>> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
>> @@ -42,6 +42,14 @@
>>   #define        POWER_SETUP_I1_SHIFT        6    /* 10.6 fixed point 
>> format */
>>   #define        POWER_SETUP_I1_DATA_MASK        REG_GENMASK(15, 0)
>>   +#define   XEHP_PCODE_FREQUENCY_CONFIG 0x6e    /* xehp, pvc */
> Can we change it to PCODE_FREQUENCY_CONFIG ? there's no usage of 
> prefix in other places
Sure couldn't hurt to generalize it I guess.
>> +/* XEHP_PCODE_FREQUENCY_CONFIG sub-commands (param1) */
>> +#define     PCODE_MBOX_FC_SC_READ_FUSED_P0             0x0
>> +#define     PCODE_MBOX_FC_SC_READ_FUSED_PN             0x1
>> +/* PCODE_MBOX_DOMAIN_* - mailbox domain IDs */
>> +/* XEHP_PCODE_FREQUENCY_CONFIG param2 */
>> +#define     PCODE_MBOX_DOMAIN_HBM                      0x2
>> +
>>   struct pcode_err_decode {
>>       int errno;
>>       const char *str;
>> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c 
>> b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>> index e8ce4d9270e6..38d334833594 100644
>> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>> @@ -7,9 +7,14 @@
>>   #include <linux/sysfs.h>
>>   #include <drm/drm_managed.h>
>>   +#include "xe_gt_types.h"
>> +#include "xe_pcode.h"
>> +#include "xe_pcode_api.h"
>>   #include "xe_tile.h"
>>   #include "xe_tile_sysfs.h"
>>   +#define GT_FREQUENCY_MULTIPLIER    50
> Could you add documentation to this file as there are multiple sysfs 
> added.
>
Sure will add.

>> +
>>   static void xe_tile_sysfs_kobj_release(struct kobject *kobj)
>>   {
>>       kfree(kobj);
>> @@ -35,6 +40,65 @@ static DEVICE_ATTR_RO(physical_vram_size_bytes);
>>   static const struct attribute *physical_memsize_attr =
>>       &dev_attr_physical_vram_size_bytes.attr;
>>   +static ssize_t rp0_freq_show(struct device *kdev, struct 
>> device_attribute *attr,
>> +                  char *buf)
>> +{
>> +    struct kobject *kobj = &kdev->kobj;
>> +    struct xe_tile *tile = kobj_to_tile(kobj->parent);
>> +    struct xe_gt *gt = tile->primary_gt;
>> +    u32 val, mbox;
>> +    int err;
>> +
>> +    mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, 
>> XEHP_PCODE_FREQUENCY_CONFIG)
>> +        | REG_FIELD_PREP(PCODE_MB_PARAM1, 
>> PCODE_MBOX_FC_SC_READ_FUSED_P0)
>> +        | REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_HBM);
>> +
>> +    err = xe_pcode_read(gt, mbox, &val, NULL);
>> +    if (err)
>> +        return err;
>> +
>> +    /* data_out - Fused P0 for domain ID in units of 50 MHz */
>> +    val *= GT_FREQUENCY_MULTIPLIER;
>> +
>> +    return sysfs_emit(buf, "%u\n", val);
>> +}
>> +static DEVICE_ATTR_RO(rp0_freq);
>> +
>> +static ssize_t rpn_freq_show(struct device *kdev, struct 
>> device_attribute *attr,
>> +                  char *buf)
> alignment to the start of bracket
>
> Thanks
> Riana Tauro

Yeah I had already responded about this on one of the reviews from Anshuman.

Will fix.

Thanks,

Suja

>> +{
>> +    struct kobject *kobj = &kdev->kobj;
>> +    struct xe_tile *tile = kobj_to_tile(kobj->parent);
>> +    struct xe_gt *gt = tile->primary_gt;
>> +    u32 val, mbox;
>> +    int err;
>> +
>> +    mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, 
>> XEHP_PCODE_FREQUENCY_CONFIG)
>> +        | REG_FIELD_PREP(PCODE_MB_PARAM1, 
>> PCODE_MBOX_FC_SC_READ_FUSED_PN)
>> +        | REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_HBM);
>> +
>> +    err = xe_pcode_read(gt, mbox, &val, NULL);
>> +    if (err)
>> +        return err;
>> +
>> +    /* data_out - Fused Pn for domain ID in units of 50 MHz */
>> +    val *= GT_FREQUENCY_MULTIPLIER;
>> +
>> +    return sysfs_emit(buf, "%u\n", val);
>> +}
>> +static DEVICE_ATTR_RO(rpn_freq);
>> +
>> +static struct attribute *freq_attrs[] = {
>> +    &dev_attr_rp0_freq.attr,
>> +    &dev_attr_rpn_freq.attr,
>> +    NULL
>> +};
>> +
>> +static const struct attribute_group freq_group_attrs = {
>> +    .name = "freq",
>> +    .attrs = freq_attrs,
>> +};
>> +
>>   static void tile_sysfs_fini(struct drm_device *drm, void *arg)
>>   {
>>       struct xe_tile *tile = arg;
>> @@ -78,6 +142,14 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>>           drm_warn(&xe->drm,
>>                "Sysfs creation to read addr_range per tile failed\n");
>>   +    if (xe->info.platform == XE_PVC) {
>> +        err = sysfs_create_group(kobj, &freq_group_attrs);
>> +        if (err) {
>> +            drm_warn(&xe->drm, "failed to register vram freq sysfs, 
>> err: %d\n", err);
>> +            return;
>> +        }
>> +    }
>> +
>>       err = drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, tile);
>>       if (err) {
>>           drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, 
>> err: %d\n",

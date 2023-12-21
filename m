Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 896AEC3DA6E
	for <intel-xe@archiver.kernel.org>; Thu, 21 Dec 2023 01:48:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4237110E038;
	Thu, 21 Dec 2023 01:48:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37C6410E02B
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Dec 2023 01:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703123310; x=1734659310;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SQSZ1At7SdYxh/zaYHDtsB4ZEy0dv8fkRJ6qbdXFEFQ=;
 b=fW1df9DCJ7+PCOoLtA97VG1ujROSplkJG61YZRWpSx1wCIXBiP+hCyph
 95WfwMCyynPW+wgt2mXWSkO6RcSnTeI7ZdpW1Wi50MdJvVl70tqeoNmyd
 DzQBXPKE057RzcloRCt79rohe5y+8AOCOMGcFfv4N4mpvDwqLNGycu3qG
 4oNsNy1YwO8K6Fm34CLpPf/Jwl94zkji3Dikt4s3lzK/VkA0PQOOMiKo1
 wcVcLVCeKgzsPWWCPnU6VEIC/AM2RrcP5eVoMYPaHdguMAN0CZkyKa8ez
 Y2oK083HWsOPxzXdeuEMz25vynid/ftVkx8HvYHk6ntETiynSTcqsKnyi g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="2741224"
X-IronPort-AV: E=Sophos;i="6.04,292,1695711600"; 
   d="scan'208";a="2741224"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 17:48:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="810812209"
X-IronPort-AV: E=Sophos;i="6.04,292,1695711600"; d="scan'208";a="810812209"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Dec 2023 17:48:29 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Dec 2023 17:48:29 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 20 Dec 2023 17:48:29 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 20 Dec 2023 17:48:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NVUJrAdtUQwxc7kK1hvlIJZThOWWhnN3z0vh1VzYxPf0TDpFj3GQoPPaxkCrFKqV/a2ZhD9Rek58PMD7GvW3xjntOEyIUIrM7QOx9Llui5158qO7w32I7EtvjAO0LFxBX4McV+plwWM+H8c/OQlFi/TcwDNQKlDjtsm5RJN240i/9a5hP0I4fUayVnEmLt8z59pjd6sHR8iRqQNwYLCOac+TB1V8c8OZ4Gk69X7bPQ0jZfikME60ZoeEeTmapvk5UhmHHJfO/YjKtItbbJHHno/TVqwVn3Lu8zw2C3y2wHYgUNH4xBwmGzwCyU3tDkaczf+bVjwe98mX8nSBJc17TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TrK8znwKGEX9shCPQUg5SQxq3kXrRmMHZavsYex8DS4=;
 b=irTrqr8zEIWEmzu/2XCh88Cuz5LudNtiU+DilNvb+5dNqHzVMfLb4MafqsLEFP/Miqg3Gd78LJLoPJ9C1R7qHHXFFjStjLAFbI5XDJMHIoZvtETE6Y9PKmAp4A6PGHPDk/5Ht/cL0b55SBODHkzYMSgM3lBJzUt8L6gpUWaC5NuDDAixOHUYDFlMoToi8480JFD+cJFq7CPl1SC1SL666+6fHU8NiIkfVXP6Ntvbn9R0ovp1yX/mQpP4ms3dmFRaCQbr2aFRyX9wwqZgssXTsMeulJZkuCzyYubES3ESnGPcS5n/PPhy67HIKqwdAzhPWYBMDRci8T0lNJGNjfe5nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 DS0PR11MB8049.namprd11.prod.outlook.com (2603:10b6:8:116::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7113.18; Thu, 21 Dec 2023 01:48:27 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52%4]) with mapi id 15.20.7113.019; Thu, 21 Dec 2023
 01:48:27 +0000
Message-ID: <b5943fcd-8192-4dd2-93d6-661ff004e5d3@intel.com>
Date: Thu, 21 Dec 2023 07:18:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v5 1/3] drm/xe: Add vram frequency sysfs attributes
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20231219100711.645011-1-sujaritha.sundaresan@intel.com>
 <ZYMbAvUzYlbuNq0d@intel.com>
Content-Language: en-US
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <ZYMbAvUzYlbuNq0d@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0088.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::13) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|DS0PR11MB8049:EE_
X-MS-Office365-Filtering-Correlation-Id: 867053f8-d5b3-4bee-b767-08dc01c6ec9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HIg+4hfEzBc4zjAuy+uXBYbZhGueWnLECd76YXC7H20Pw3OghxKp/b+01bXFgCSwER2400fYhLV2TAH2s7gN3FUfElEAkWtyEHcGiQ9s+uqveokjH8hwjJc1Bx0F4EtUzX+UunYsJs0mr5m1PiZku/Oec0hzUdLuxIAiCl/iaceZM1k1ED1p5OBZ+9pcqOaLhvMhbm2jZalfu/9qPSulD0/+7EViqaheQytEMeo4QAwx1eh2H2ellk3b74rFBE1zk2w5IFvauYAxYt5DBU++IXE6WZ+NtGfuWb6Tw0nKHMRgkbsv0SF+kKUTOO0hbUCGY03KBP4X3srhi5FyoBf6KcIDYQDOq2fpe4MCnM1rp8zzwDLjf3DaG5yw+9iER1sc903XbcdD3k/hYOEDcJ4RfElZSej0aJr3K9e6Hb6h4Zwhrgy8/VxuDUznoln+0OS+qgloNHTGtSEYCphy4FkwoXXeM+sY9kyH4AT5D5EmFf1IURpdW0LCmS+MPCoAc9oI6uVei9gn+gqBQqq/dCesoPsn2coOCWoHd4qg/cQF6J1HIQntP3kSvfgg6zmzhZzoFwgnwtManb+be0//RXGprMafhp1zrw10SQKfz6VlXJP7+LtJHPGfoWFwa6HekR0eZtDev5hQizMSbmCiB4n61w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(346002)(376002)(396003)(39860400002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(6512007)(6506007)(478600001)(26005)(6486002)(107886003)(2616005)(41300700001)(6636002)(66946007)(83380400001)(66556008)(66476007)(37006003)(31696002)(6666004)(31686004)(53546011)(316002)(86362001)(82960400001)(36756003)(8676002)(8936002)(38100700002)(2906002)(5660300002)(6862004)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjBuK0tyY1JkMzkwQ1Q3YW5SeFRnam1La2JsUUNFWkU2Nzd2by92cllYNVRp?=
 =?utf-8?B?MTdQTlpBUU14SFZ2WWxYTmlTTEVwV1FodFBhZUoxdDQwWlI1bEJrYVgxSVkz?=
 =?utf-8?B?ZzRwZ0QxVlNDWUVtdVBuZ3RBZ3Jva0ZOb2hKNTRZM2FwMmgyancxeVo3YUJY?=
 =?utf-8?B?eWsyUjJHYU92VmRUNlcwMWx0OVdTMjNPYzJ2UWhwUHRtQk9ZYlVkQndGc3h6?=
 =?utf-8?B?NWZ3Nk0vLzFwSlJEbDFSdTg2NXl3SGR1Q2xweWtUc0NSMGRWTHpzL1ZDWTg5?=
 =?utf-8?B?djZEdHhYM0hPVmNJaFp0dEF5VkVnT3JqVHZ5UmpUS1VPZnRrTlZkMEI0Y2Zl?=
 =?utf-8?B?a0tXZVc3MndOOVZ2SGgxNVdsTnByWThONFBMOGxwVEdBWW1KalhicDNycTIv?=
 =?utf-8?B?cVA5WlZ0emFneGhLUytZcVhhUC91U0hTbXdZUUxkYytYTDh5Z3BnaUF4bnk1?=
 =?utf-8?B?R2pqTGZIcXBmVVhybmRUN1VPTzI1MG80RDM2UjFJNGdKMUxHeVZZYkJjVURB?=
 =?utf-8?B?VGRKWktqcDM5THB1Vi9pRk9aWHpNSXYzMXU2YTIvckpwcTlKSWUxb3lKbmY5?=
 =?utf-8?B?amdJc2RBVzhLdHlXcEFUS1dwTFRaNmlwMkFKK2djRW1sajAyRERycHVlUVBO?=
 =?utf-8?B?eUtLU0s5aHNiR2xOWmpWOTljbXM3VWIyNGp0amo2bHRVL3kwaDgzK2o5eVdw?=
 =?utf-8?B?UlVBQ2M1c0lUZFJRTjlxQVRzcXhlcll6RGFWbWVscnl5Um55dG9rcFhGRFp6?=
 =?utf-8?B?SWlNSmk1bG5Qbm5zMDcyaXVGL2diV3NRT041TmxJc25tSTMzYThxUmZoVkEx?=
 =?utf-8?B?bExxc0NhNE1GNllHclpvcTBveXpVZmwzdUNpSVVjMjBTMEVSNGxMSGZudU9r?=
 =?utf-8?B?WW1MNWFFSElYSWFVejFUTHJtb3ovbGpVVitpZVd4ckVCbEdCZC9EWVFNejNa?=
 =?utf-8?B?NFVxRHhGQjU5bFJsQVEwaVVKRmVPTnpmTkRITHZmOXhtZ1RCMk1lMU9OSWI3?=
 =?utf-8?B?VjFhbUl5OWswQ0JydSsrU2p2ZU81VjdTZzBGMFEwbDJyWkdnY29qeHRnamxE?=
 =?utf-8?B?dU1pWE5Vdjkxakp6L2h6dUZ1RTM5eFEvK0Zldyt0MWRYOXlTdjZIdWVLV2k1?=
 =?utf-8?B?UkxaRTdxYUNUaXhjKy84ZXR3M2N2ektPcVRpcnpjeEMydnVYbFlQUS93c2l0?=
 =?utf-8?B?bEtWeEllS21oNzR3V01zbmt1OTZFS3lONFNSOVV3SWozUFJYZnV5TUJkb1Rt?=
 =?utf-8?B?MTlpdDhqNTFtVWVoTmh1MWpBcUtsaG80ZHFjME1qL3BwTThjUXlyeE5PbEVM?=
 =?utf-8?B?eWhKR0FOMUJ6UWlzTEpJdlBPSCs0WS9ZVDErMEtiNFg1Rlk2elRaKzQ5QkY1?=
 =?utf-8?B?VGl3eEZMdUlMNXg3cTJBTTZTTEwwQmxoVml3Rkc0TWUrSFN6ckNiQnlmWWxw?=
 =?utf-8?B?ZnduYXJUUVYzbHdGa1lSd3JXTVJwT3ltYytBd3RRMEtvNDNBQWMyN3BSejRo?=
 =?utf-8?B?bHAycWlrVUhFeTJpZXlZMFZvQWN3bUJqRldSVlBVTFBJYmdyOFcrQ3pXL0VG?=
 =?utf-8?B?Ry9mbTNUTnRaUGgvN0hDakZtaFROZU9wK2FOS2lZVmNWcXhvWWtjdUdiU2VF?=
 =?utf-8?B?SWpnaEt1RGcyVEorSEVyRnZDYmxCZlNCbUhhVEVtZGtqTjVRbnVzMWlnOEJs?=
 =?utf-8?B?MXNVMEZ5UmNvQUh3elIvRzJnRE94cTNTRXlkdUhrRWJnYVJYZU5EVUUyZDN2?=
 =?utf-8?B?WEtkc0tWSUFscVE4L0JtNXBGYjJiYlVsMVRUM3Q1ckVQSFhJN0xodytLQVlr?=
 =?utf-8?B?U0JhTml5cUJCTXJmRmFFR0xkcFVTWm9NMjdrT2hnVWlCbkY4WlcvS24yYjRt?=
 =?utf-8?B?bDhCK3VKa0dvRnlBbEtPZkEyZWN5WkhsRTF5ME9zaXREYWpuWWRya2hkend6?=
 =?utf-8?B?QjZHYXZPSnZNMXRlZkhWOUxIZVRJUlZBVmRLRm5qcW1USzJKRzA2d3dqZ0t2?=
 =?utf-8?B?cW9xZVV5NnJwT0tyWnVKYmEyYTJocTFoaHl2enBaOE11WmlCSGtUVmQ1R3NC?=
 =?utf-8?B?NjJmaUdzcVJMSDhTTC9yV0g5b2MyQVl4ZFlOT1RZQUZWcXVhV0FyZTBtNUVM?=
 =?utf-8?B?TVpXb1JSclZIZHM1VnpjdjJxekthNHlZR1VTMkU1amJTMG5iTjVaQkVEdjB5?=
 =?utf-8?Q?snRg8pAL2HepnnzvTObsrmU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 867053f8-d5b3-4bee-b767-08dc01c6ec9d
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2023 01:48:26.9273 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2fIu+t1DEwAWAiJmTRKh2KbwRxZ0JO2Uzw7vF3OoJXUTC6O+AQh+HyhE4OGyD4xE4xROl4cRBBfEdFF3quKgsAv0Nx2QkeAm6LLphqvofRw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8049
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 12/20/2023 10:19 PM, Rodrigo Vivi wrote:
> On Tue, Dec 19, 2023 at 03:37:09PM +0530, Sujaritha Sundaresan wrote:
>> Add vram frequency sysfs attributes under the below hierarchy;
>>
>> /device/tile#/memory/freq0
>> 			|-rp0_freq
>> 			|-rpn_freq
>>
>> v2: Drop "vram" from attribute names (Rodrigo)
>>
>> v3: Add documentation for new sysfs (Riana)
>>      Drop prefix from XEHP_PCODE_FREQUENCY_CONFIG (Riana)
>>
>> v4: Create sysfs under tile#/freq0 after removal of
>>      physical_memsize attrbute
>>
>> v5: Revert back to creating sysfs under tile#/memory/freq0
>>      Remove definition of GT_FREQUENCY_MULTIPLIER (Rodrigo)
>>
>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pcode_api.h  |  8 +++
>>   drivers/gpu/drm/xe/xe_tile_sysfs.c | 86 ++++++++++++++++++++++++++++++
>>   2 files changed, 94 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
>> index 5935cfe30204..4076a4e9daf3 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
>> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
>> @@ -42,6 +42,14 @@
>>   #define	    POWER_SETUP_I1_SHIFT		6	/* 10.6 fixed point format */
>>   #define	    POWER_SETUP_I1_DATA_MASK		REG_GENMASK(15, 0)
>>   
>> +#define   PCODE_FREQUENCY_CONFIG		0x6e
>> +/* PCODE_FREQUENCY_CONFIG sub-commands (param1) */
>> +#define     PCODE_MBOX_FC_SC_READ_FUSED_P0	0x0
>> +#define     PCODE_MBOX_FC_SC_READ_FUSED_PN	0x1
>> +/* PCODE_MBOX_DOMAIN_* - mailbox domain IDs */
>> +/* PCODE_FREQUENCY_CONFIG param2 */
> let's keep some consistency here.
> probably a single like like
>
> /* Frequency Config Sub Commands (param1) */
> above
>
> and
>
> /* Domain IDs (param2) */
> here
Sure will fix.
>
>> +#define     PCODE_MBOX_DOMAIN_HBM		0x2
>> +
>>   struct pcode_err_decode {
>>   	int errno;
>>   	const char *str;
>> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>> index 0f8d3e7fce46..1d34912e6184 100644
>> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>> @@ -7,9 +7,21 @@
>>   #include <linux/sysfs.h>
>>   #include <drm/drm_managed.h>
>>   
>> +#include "xe_gt_types.h"
>> +#include "xe_pcode.h"
>> +#include "xe_pcode_api.h"
>>   #include "xe_tile.h"
>>   #include "xe_tile_sysfs.h"
>>   
>> +/**
>> + * DOC: Xe Tile sysfs
>> + *
>> + * Provides sysfs entries for frequency in tile
>> + *
>> + * device/tile#/memory/freq0/rp0_freq - The Render Performance 0 level, which is the maximum one.
>> + * device/tile#/memory/freq0/rpn_freq - The Render Performance N level, which is the minimal one.
>> + */
>> +
>>   static void xe_tile_sysfs_kobj_release(struct kobject *kobj)
>>   {
>>   	kfree(kobj);
>> @@ -20,6 +32,65 @@ static const struct kobj_type xe_tile_sysfs_kobj_type = {
>>   	.sysfs_ops = &kobj_sysfs_ops,
>>   };
>>   
>> +static ssize_t rp0_freq_show(struct device *kdev, struct device_attribute *attr,
>> +			     char *buf)
>> +{
>> +	struct kobject *kobj = &kdev->kobj;
>> +	struct xe_tile *tile = kobj_to_tile(kobj->parent);
>> +	struct xe_gt *gt = tile->primary_gt;
>> +	u32 val, mbox;
>> +	int err;
>> +
>> +	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, PCODE_FREQUENCY_CONFIG)
>> +		| REG_FIELD_PREP(PCODE_MB_PARAM1, PCODE_MBOX_FC_SC_READ_FUSED_P0)
>> +		| REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_HBM);
>> +
>> +	err = xe_pcode_read(gt, mbox, &val, NULL);
>> +	if (err)
>> +		return err;
>> +
>> +	/* data_out - Fused P0 for domain ID in units of 50 MHz */
>> +	val *= 50;
>> +
>> +	return sysfs_emit(buf, "%u\n", val);
>> +}
>> +static DEVICE_ATTR_RO(rp0_freq);
>> +
>> +static ssize_t rpn_freq_show(struct device *kdev, struct device_attribute *attr,
>> +			     char *buf)
>> +{
>> +	struct kobject *kobj = &kdev->kobj;
>> +	struct xe_tile *tile = kobj_to_tile(kobj->parent);
>> +	struct xe_gt *gt = tile->primary_gt;
>> +	u32 val, mbox;
>> +	int err;
>> +
>> +	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, PCODE_FREQUENCY_CONFIG)
>> +		| REG_FIELD_PREP(PCODE_MB_PARAM1, PCODE_MBOX_FC_SC_READ_FUSED_PN)
>> +		| REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_HBM);
>> +
>> +	err = xe_pcode_read(gt, mbox, &val, NULL);
>> +	if (err)
>> +		return err;
>> +
>> +	/* data_out - Fused Pn for domain ID in units of 50 MHz */
>> +	val *= 50;
>> +
>> +	return sysfs_emit(buf, "%u\n", val);
>> +}
>> +static DEVICE_ATTR_RO(rpn_freq);
>> +
>> +static struct attribute *freq_attrs[] = {
>> +	&dev_attr_rp0_freq.attr,
>> +	&dev_attr_rpn_freq.attr,
>> +	NULL
>> +};
>> +
>> +static const struct attribute_group freq_group_attrs = {
>> +	.name = "freq0",
>> +	.attrs = freq_attrs,
>> +};
>> +
>>   static void tile_sysfs_fini(struct drm_device *drm, void *arg)
>>   {
>>   	struct xe_tile *tile = arg;
>> @@ -32,6 +103,7 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>>   	struct xe_device *xe = tile_to_xe(tile);
>>   	struct device *dev = xe->drm.dev;
>>   	struct kobj_tile *kt;
>> +	struct kobject *kobj;
>>   	int err;
>>   
>>   	kt = kzalloc(sizeof(*kt), GFP_KERNEL);
>> @@ -50,6 +122,20 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>>   
>>   	tile->sysfs = &kt->base;
>>   
>> +	if (xe->info.platform == XE_PVC) {
>> +		kobj = kobject_create_and_add("memory", tile->sysfs);
>> +		if (!kobj)
>> +			drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -ENOMEM);
> Please do not make up the error here. If it is a single error return by
> the function we should probably do something like
>   drm_warn(&xe->drm, "failed to add Tile memory directory\n");

Will do.

Along with the name change to min/max freq with documentation clarifying 
that it is read-only/informational.

Thanks,

Suja

>
>> +	}
>> +
>> +	if (kobj && xe->info.platform == XE_PVC) {
>> +		err = sysfs_create_group(kobj, &freq_group_attrs);
>> +		if (err) {
>> +			drm_warn(&xe->drm, "failed to register vram freq sysfs, err: %d\n", err);
>> +			return;
>> +		}
>> +	}
>> +
>>   	err = drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, tile);
>>   	if (err)
>>   		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
>> -- 
>> 2.25.1
>>

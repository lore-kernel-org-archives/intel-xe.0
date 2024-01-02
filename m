Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D57FC46CD2
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jan 2024 10:19:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EADD510E128;
	Tue,  2 Jan 2024 10:19:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D03310E128
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Jan 2024 10:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704190740; x=1735726740;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=s2JYmsohuHmd1wEHLr+ulHgq6D1C22xX/ibV50jQLQ8=;
 b=mB1CvjN5KAPoDBR6B0eR2mM42Z4jCB6fYBWlAQ35XdMu/NR/NAaWV1w1
 RqI80dJbAsEkIFLS/8DJbTg5Xh5lLuDrpxSCgCCao9gh6md1Uf7AwWo2I
 be0eh+sgLBR6bTWOc7KIlMdmjMTzv7JKxlTX8Fkh9fa5uEH2/ySiXsZF4
 TYnfQ+CapXZ676+mxO210yjasYLwLEsmPSg2+BYEE2gncAT9gDQw8bd2N
 DXMhzaFg1tYP5gw23gq2IvcxVI1UvdK4AeYTryfni1xNuwQpYph2B/pYk
 7TfQgVO1rMCHFeHBkv6RuonQleYbhsxMaMr+gkXMXtW/BiYm1ZN2C3/Yu w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="395747852"
X-IronPort-AV: E=Sophos;i="6.04,324,1695711600"; d="scan'208";a="395747852"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2024 02:18:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="1026737229"
X-IronPort-AV: E=Sophos;i="6.04,324,1695711600"; d="scan'208";a="1026737229"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Jan 2024 02:18:59 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Jan 2024 02:18:58 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 2 Jan 2024 02:18:58 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 2 Jan 2024 02:18:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A+4/M5TkXmefabxqg2Bgchu6o1f69vwFA4i4gmKxR/Om13mjqnMthc2XOfUmk+eSwP0JMI4vSneFbFJTbsIqTAH+1YhWlkStN7ic7tDHx9Dlrie/bzn/bTWrQoYalGDuEKcSrGGuCmJ1uqFOPqYCRqkY3N5a4mHl4cnpS0zuT2jzPcVQolrEqhGYyWwWQPUORtBzB6cXTJ79Ug1qz5/BF+dQQqxbE/1WQLTHyuTsF1V6TQ0BIZG00nQm/B9iKzyH2C3Us3m769SO5PRZfXSn3RaOeCthpa9t6gbepitU3SA5+FDbgb2MYWfzJpD+KkupjL1GsdkOUt8scuAv0F7rEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nuD0HOHMDCP/f3bJ1n+3OiiowpqmH78Drt10ZItPEeU=;
 b=c/35N3cRI+ChwyvFQM/IzAg8PH3tzXFegB3idhFFLfDuhJ3Hs259crlxmSuY+cd4QA3vSHwCt0eFbc13qzye2C5EuojvLEEzDGZ+YX5hlxQ0ZZXj2CK0ul3a3AfeBgBVgxhWSL4CcAgBAGkCaAjDNTs3LyYmmuw/Itftskf9Of6Oh3XogNWdq2B9+roD96aKRpVFwT4fc1DNDGIZnGVvFsQvJ3vAXoyc7sie2PB16Ek2UtuqPfP0k4cn9WrqnDMnqjPBdmrNK4FnkpvP2TabzDPHnJaImMeVxd8BAskoIcm0YyIb/+7aJ87Ty0EAR/DBpSDWa2I3Ywt73DNXklcBVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 BL1PR11MB6025.namprd11.prod.outlook.com (2603:10b6:208:390::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.13; Tue, 2 Jan
 2024 10:18:55 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52%4]) with mapi id 15.20.7159.013; Tue, 2 Jan 2024
 10:18:55 +0000
Message-ID: <c1086ea1-eeda-434e-8627-b28103eaa3be@intel.com>
Date: Tue, 2 Jan 2024 15:48:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v7] drm/xe: Add vram frequency sysfs attributes
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20240102052748.1598057-1-sujaritha.sundaresan@intel.com>
 <CY5PR11MB62112ED786C7B196DCF70BF79561A@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <CY5PR11MB62112ED786C7B196DCF70BF79561A@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0141.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::21) To SJ0PR11MB5664.namprd11.prod.outlook.com
 (2603:10b6:a03:37f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|BL1PR11MB6025:EE_
X-MS-Office365-Filtering-Correlation-Id: be8649bf-fb32-4b45-8117-08dc0b7c38fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p1cwHLQ330I6DzadXPjsZVoOSkV9QnZ+PpPZZWulCGUDVODELq2q9AYkj/C9x5rEM+2BuJQyZP/AZC99JCFQ6ROXY1dTtgCumqgPSzs+BIFDf0ZpNduRfZ50/rbu3axwlKbuO6c1Vi7sbUvcmY+CnnoJwQapvtB1fSNdtGBtfnJu/PoqDqfAP7rw1GcgBkczr4++BFqqXxBblRshIMvz+W3WQ2QaSxvMxjYG72DmSnhbHS8SRsZRiLvTbYVpfup0n5C1Z3RBVYnkqsASefW6qEVZqtgjEQGK5xdwYqE9n7ensrLlJW00f1Qdc5ri0d6ZazfujwJ+YuqNoH1TRm85nj/YdJ+NfdZC7KTY2bJcSrA5C5ZW9R7uL/TxQQxdxbjnQCZe14HqRp9uobAj+8WnQ+eRTWGB4FUm+xeSN2Qn3lOSH+Q0R8FR2x7aTnNqrEtnE44jYTlPCIvbDEEKeiOlWm5Jxypn7EQW1VIPeMLUMYJzBUw6efyXfgLV6cYmqntMucw01rbWS6UX4GRLZ0ZR5e+hqDNgAt/7iT3ZrSS05zuC6AKMT4B47t/c+57JIVmzsexcr9uB9y9ndCpnYjfBNLz1swiXveGOBW4C5jfOanLdRUxgvAOC4hdp3SvMt3u5KXUTmJA1D246IJlomvfUdQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(136003)(396003)(366004)(346002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(36756003)(31686004)(66476007)(6512007)(6506007)(53546011)(66556008)(66946007)(6486002)(86362001)(31696002)(82960400001)(38100700002)(83380400001)(26005)(2616005)(41300700001)(2906002)(5660300002)(6666004)(478600001)(110136005)(316002)(8936002)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3l4ajhUbnJqVy9HNFQrNFRtK0pxRjNGLzhWdjMwQVowR2pnQ1ZxS0UyWXBN?=
 =?utf-8?B?SlFNUDdMNFNqZWJ4a0FrUmdielZBTjNZYlR1anJWc3Jaa2htU2poWFRzME1F?=
 =?utf-8?B?YWlWdDRFRWRqcE1lRzBVZEl5bUhXYWhwUkRRWk9kVDQ2OVBtdFJOQS96SEt5?=
 =?utf-8?B?dnRjSDlBL0F5THNvR25WNTNaLzlVWjhiK0EzMHF2NDJKWVRZQUxVakxHSEQw?=
 =?utf-8?B?cnoyZVRUejI2eEFBc1I2STk5cUJ4U1ViSytHTWtLUWZZb2dGRW5DUForangv?=
 =?utf-8?B?SE9WRHdMRC9iWGVRT1lFZlphN3lyMnVHeHhhYlMvMjQzeTZWTDRDTXBJTDBE?=
 =?utf-8?B?UDAramkvNGJBL2dFV2MvQ1pubUZyUEFnMHgwL2JjK3BRUTcvREJrTk5zR09j?=
 =?utf-8?B?RWt1TkdFT2MwTjNNZUQvYVFtMmZHU3QzMWh6b1hlN0FGSWVoWTJLeFVTM2FV?=
 =?utf-8?B?OURzNVNYU1pwRDRkYmNqcEZXZjB6d3RBeFkwWVlMYUFwSU5LemNnQ1lqUEJR?=
 =?utf-8?B?M3ppcXNHYVlxcGRtS0IyR1hxTGR1d3BCeFBtODJzVnJaNXVNS1Fqeks4TkN1?=
 =?utf-8?B?enRFYTdIMW5HOVpGdFozQ2Z1aVpGdit6K3k1SHhpdjhraCsvaGRucFlPeTJ5?=
 =?utf-8?B?RzhkWndhRFhYYnA4UzR0T2dWeWdmVkNiQ1IySTh4aXBiUGxxMGpGVFBSTkVK?=
 =?utf-8?B?QkVyRDZrY2V1UXlsZ0JZYnh6Qys2ckpiRlk4MGhaQ0tmVmxobWVMUE9jWW5u?=
 =?utf-8?B?ZkRZblhKUXMrSzUveFFvVjhEQ3NkYnpQOUZ5bkQxWVlwMlhhMnFJYWZsU1lv?=
 =?utf-8?B?OEpyeC9MclE4OUR0Z21ibWhMMWJpaS9ISG5TSnRrRGh5YktJbXZFdE1sNy9C?=
 =?utf-8?B?NE1aY2grYWlHYnZKczh5Wkpxb3M4amUwVUdQNGFGMGZBeGNOZHdYN3lmQmtn?=
 =?utf-8?B?YTJqekRqeW9aeW1RZ1JES2hVb2lLQjJ0aFVFOXQ4OXVUcFlOcm11ZEs2OWdG?=
 =?utf-8?B?WklvTGhOS2xHK1BQNSs2YWNoZU5xT3NzaVVDZHZmRXBUNmNTYW5sK1YwNkdI?=
 =?utf-8?B?b0dPT1MwWFh1RDZ5ZjBkT2ZIOXdKRmRLbFYweVI3eGJwWDVzcHBtY3lDSzJI?=
 =?utf-8?B?TGVJNE15Vm8zcHQrZW1CRkw5R01TbVdnYk1FVHVXQXdUSkE0MC9BUVZUbnRX?=
 =?utf-8?B?YkNLTXRnVG1KZ0NlR2M5UCtWZGVDcncwcmZ4TWNtLy9wazNTdy9mUjlIN2Qz?=
 =?utf-8?B?VTg0bGcvMmQ5eG5ZeFFHQmxDbUZDVlRCSzRmSEtScjRDNCt6QzJsRWFwUkhM?=
 =?utf-8?B?MWRyMWtIQXdmdGdneGh2RVAyOHYvM3p2VWhmS3BvMDk4ZXZqMXVlaFJJVm9G?=
 =?utf-8?B?dUNjdVJ2WkYya1pCSTBrS0NTMm9jT1I0K3RxK1JjTVIyVGg3TXZoV2kwb0t3?=
 =?utf-8?B?ODRMb3B3ZlVKYmsvN3BiSVY0MmJpNHljaEw2VEN3eHJTQmNXMEsvNkE4UDly?=
 =?utf-8?B?c1dmd1lyUU5ILzZYa01ETjh6L1FYR2lrMFdMNFdrRWo1THhsZHVmR0Y2ZW5V?=
 =?utf-8?B?VWkwQld2NWdUdlRxTkhRTS9mV0VoWnRjcTdET2E3c1ovTG0vRzkvRitkdnAz?=
 =?utf-8?B?RWZqVW5IUTFac05FbmQ5L1FicEpVRVRDTTA3cTNkSEFFN05HR083ekZrNnJF?=
 =?utf-8?B?TUtTeFY0OG9TZ0J6bDJXU29EODlMQzNNZVF6R1M4RTkwOHlpVk9IeFZPY1Jz?=
 =?utf-8?B?TzBJZnQ3akhndkdueHN2OFMxRXhxWVJsVUpqQkFPdXRwY1VYZWhJcXVmWUR1?=
 =?utf-8?B?aGJYU2FCc1ZXY0NLK0M3aS9DdnNmTS9vY1paRFdtMzBPSjlVWXd5NzdpSHhV?=
 =?utf-8?B?UkFkZXJUNzc2SGUxVDhtaEtEZ1BxT3V0eXA3ZmJvbUFFaGM5bnBMcUhVV3lx?=
 =?utf-8?B?djZPRUZGSGFqM0tuQXp2NTBDS0ZzeHl0UStac3kzMUVnOGwxekM4Q2JTcnJh?=
 =?utf-8?B?aHZENGI3N0V0LzRYMlRWQ1RjN0hDS1RDSjRINUxac0hVd2JvZXpTNUkwTzBu?=
 =?utf-8?B?bGtYTnp5V1BHSTRsdkZ3eEREZ3dvUnczOXBjNUcvcVpZbFhpMUNVN0tBRUh4?=
 =?utf-8?B?MVNIRDc3bTlkM0hLWmpmdEtTekNoYnhMZzN2aHM1TkZ0ZTFjM1BQdWtOWGNQ?=
 =?utf-8?B?Znc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: be8649bf-fb32-4b45-8117-08dc0b7c38fd
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5664.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2024 10:18:55.4779 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HD7qTPD6HGJBjZWb2P+iGKVi93RYEfOaGEqFt4b1J+9P1hFj7A7LZFjKVYm+ENRJuqGLqi6qsrMPkaUYsr02a2Y4DHI/g4NYgA3JH9jqVkk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6025
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


On 1/2/2024 3:39 PM, Gupta, Anshuman wrote:
>
>> -----Original Message-----
>> From: Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>
>> Sent: Tuesday, January 2, 2024 10:58 AM
>> To: intel-xe@lists.freedesktop.org
>> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Sundaresan, Sujaritha
>> <sujaritha.sundaresan@intel.com>
>> Subject: [v7] drm/xe: Add vram frequency sysfs attributes
>>
>> Add vram frequency sysfs attributes under the below hierarchy;
>>
>> /device/tile#/memory/freq0
>> 			|-max_freq
>> 			|-min_freq
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
>> v6: Rename attributes to max/min_freq (Anshuman)
>>      Fix review comments (Rodrigo)
>>
>> v7: Make docuemntation more verbose
>>      Move sysfs to separate file (Anshuman)
>>
>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile        |   1 +
>>   drivers/gpu/drm/xe/xe_pcode_api.h  |   7 ++
>>   drivers/gpu/drm/xe/xe_tile_sysfs.c |   3 +
>>   drivers/gpu/drm/xe/xe_vram_freq.c  | 127
>> +++++++++++++++++++++++++++++  drivers/gpu/drm/xe/xe_vram_freq.h
>> |  16 ++++
>>   5 files changed, 154 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_vram_freq.c  create mode
>> 100644 drivers/gpu/drm/xe/xe_vram_freq.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile index
>> df8601d6a59f..17884e422cec 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -139,6 +139,7 @@ xe-y += xe_bb.o \
>>   	xe_uc_debugfs.o \
>>   	xe_uc_fw.o \
>>   	xe_vm.o \
>> +	xe_vram_freq.o \
>>   	xe_wait_user_fence.o \
>>   	xe_wa.o \
>>   	xe_wopcm.o
>> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h
>> b/drivers/gpu/drm/xe/xe_pcode_api.h
>> index 5935cfe30204..f153ce96f69a 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
>> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
>> @@ -42,6 +42,13 @@
>>   #define	    POWER_SETUP_I1_SHIFT		6	/* 10.6 fixed
>> point format */
>>   #define	    POWER_SETUP_I1_DATA_MASK
>> 	REG_GENMASK(15, 0)
>>
>> +#define   PCODE_FREQUENCY_CONFIG		0x6e
>> +/* Frequency Config Sub Commands (param1) */
>> +#define     PCODE_MBOX_FC_SC_READ_FUSED_P0	0x0
>> +#define     PCODE_MBOX_FC_SC_READ_FUSED_PN	0x1
>> +/* Domain IDs (param2) */
>> +#define     PCODE_MBOX_DOMAIN_HBM		0x2
>> +
>>   struct pcode_err_decode {
>>   	int errno;
>>   	const char *str;
>> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>> b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>> index 0f8d3e7fce46..ed60d12f5cf0 100644
>> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>> @@ -9,6 +9,7 @@
>>
>>   #include "xe_tile.h"
>>   #include "xe_tile_sysfs.h"
>> +#include "xe_vram_freq.h"
>>
>>   static void xe_tile_sysfs_kobj_release(struct kobject *kobj)  { @@ -50,6 +51,8
>> @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>>
>>   	tile->sysfs = &kt->base;
>>
>> +	xe_vram_freq_init(tile);
>> +
>>   	err = drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, tile);
>>   	if (err)
>>   		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed,
>> err: %d\n", diff --git a/drivers/gpu/drm/xe/xe_vram_freq.c
>> b/drivers/gpu/drm/xe/xe_vram_freq.c
>> new file mode 100644
>> index 000000000000..166d41a6b222
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_vram_freq.c
>> @@ -0,0 +1,127 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +#include <linux/sysfs.h>
>> +#include <drm/drm_managed.h>
>> +
>> +#include "xe_gt_types.h"
>> +#include "xe_pcode.h"
>> +#include "xe_pcode_api.h"
>> +#include "xe_tile.h"
>> +#include "xe_tile_sysfs.h"
>> +#include "xe_vram_freq.h"
>> +
>> +/**
>> + * DOC: Xe VRAM freq
>> + *
>> + * Provides sysfs entries for vram frequency in tile
>> + *
>> + * device/tile#/memory/freq0/max_freq - This is maximum frequency. This
>> value is read-only as it
>> + *					is the fixed fuse point P0. It is not the
>> system
>> + *					configuration.
>> + * device/tile#/memory/freq0/min_freq - This is minimum frequency. This
>> value is read-only as it
>> + *					is the fixed fuse point PN. It is not the
>> system
>> + *					configuration.
>> + */
>> +
>> +static struct xe_tile *dev_to_tile(struct device *dev) {
>> +	return kobj_to_tile(dev->kobj.parent); }
>> +
>> +static ssize_t max_freq_show(struct device *dev, struct device_attribute
>> *attr,
>> +			     char *buf)
>> +{
>> +	struct xe_tile *tile = dev_to_tile(dev);
>> +	struct xe_gt *gt = tile->primary_gt;
>> +	u32 val, mbox;
>> +	int err;
>> +
>> +	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND,
>> PCODE_FREQUENCY_CONFIG)
>> +		| REG_FIELD_PREP(PCODE_MB_PARAM1,
>> PCODE_MBOX_FC_SC_READ_FUSED_P0)
>> +		| REG_FIELD_PREP(PCODE_MB_PARAM2,
>> PCODE_MBOX_DOMAIN_HBM);
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
>> +static DEVICE_ATTR_RO(max_freq);
>> +
>> +static ssize_t min_freq_show(struct device *dev, struct device_attribute *attr,
>> +			     char *buf)
>> +{
>> +	struct xe_tile *tile = dev_to_tile(dev);
>> +	struct xe_gt *gt = tile->primary_gt;
>> +	u32 val, mbox;
>> +	int err;
>> +
>> +	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND,
>> PCODE_FREQUENCY_CONFIG)
>> +		| REG_FIELD_PREP(PCODE_MB_PARAM1,
>> PCODE_MBOX_FC_SC_READ_FUSED_PN)
>> +		| REG_FIELD_PREP(PCODE_MB_PARAM2,
>> PCODE_MBOX_DOMAIN_HBM);
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
>> +static DEVICE_ATTR_RO(min_freq);
>> +
>> +static struct attribute *freq_attrs[] = {
>> +	&dev_attr_max_freq.attr,
>> +	&dev_attr_min_freq.attr,
>> +	NULL
>> +};
>> +
>> +static const struct attribute_group freq_group_attrs = {
>> +	.name = "freq0",
>> +	.attrs = freq_attrs,
>> +};
>> +
>> +static void vram_freq_fini(struct drm_device *drm, void *arg) {
>> +	struct kobject *kobj = arg;
>> +
>> +	sysfs_remove_group(kobj, &freq_group_attrs);
>> +	kobject_put(kobj);
>> +}
>> +
>> +void xe_vram_freq_init(struct xe_tile *tile) {
> Please provide a kernel function doc for this exported function.
>> +	struct xe_device *xe = tile_to_xe(tile);
>> +	struct kobject *kobj;
>> +	int err;
>> +
>> +	if (xe->info.platform == XE_PVC) {
> Drop these platform checks(including below ones) , instead use a early return at starts of this function.
> If (xe->info.platform != XE_PVC)
> 	Return.
> With all of above comment.
> Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>

Will make the changes. Thanks for the r-b.

Regards,

Suja

>> +		kobj = kobject_create_and_add("memory", tile->sysfs);
>> +		if (!kobj)
>> +			drm_warn(&xe->drm, "failed to add memory
>> directory, err: %d\n", -ENOMEM);
>> +	}
>> +
>> +	if (kobj && xe->info.platform == XE_PVC) {
>> +		err = sysfs_create_group(kobj, &freq_group_attrs);
>> +		if (err) {
>> +			drm_warn(&xe->drm, "failed to register vram freq
>> sysfs, err: %d\n", err);
>> +			return;
>> +		}
>> +	}
>> +
>> +	if (xe->info.platform == XE_PVC) {
>> +		err = drmm_add_action_or_reset(&xe->drm, vram_freq_fini,
>> kobj);
>> +		if (err)
>> +			drm_warn(&xe->drm, "%s:
>> drmm_add_action_or_reset failed, err: %d\n",
>> +				 __func__, err);
>> +	}
>> +
>> +}
>> +
>> +
>> diff --git a/drivers/gpu/drm/xe/xe_vram_freq.h
>> b/drivers/gpu/drm/xe/xe_vram_freq.h
>> new file mode 100644
>> index 000000000000..94b04178a798
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_vram_freq.h
>> @@ -0,0 +1,16 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_VRAM_FREQ_H_
>> +#define _XE_VRAM_FREQ_H_
>> +
>> +#include <drm/drm_managed.h>
>> +
>> +#include "xe_device.h"
>> +#include "xe_tile_sysfs.h"
>> +
>> +void xe_vram_freq_init(struct xe_tile *tile);
>> +
>> +#endif /* _XE_VRAM_FREQ_H_ */
>> --
>> 2.25.1

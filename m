Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C16D3C46CD2
	for <intel-xe@archiver.kernel.org>; Wed, 27 Dec 2023 12:18:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43ED710E091;
	Wed, 27 Dec 2023 12:18:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA77C10E091
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Dec 2023 12:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703679514; x=1735215514;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Nv3nYmdHURS9p7qxF9Yukh/MIRwqlBx+pGUi3esyu/M=;
 b=d3wVeUPbcDs398RTTKuxrS3mRlpOJP90yTmKRD7okXHrh4m4ekbQtssm
 eIqrGSu2FroZz85AqhsjagOzuzVD2lQF8y9W5xcTSPWszH3+xa1gzDcoC
 bMhxe5v8sfRaMZXWBW+weBfrxHfCbMfa8rW1SKwKXGfJU4gZVlZ1mkSHJ
 Q9XqT3ZeJ3OLe0gzWMYFtOK3QS9nCFNJPMUgTO5nI/zlrVzZ+3/3pMgVP
 8NBoM0A+IZX7Npq/anEaZcrTYHHBhIDdmbUZUgcsZf9SUBOmN4tFpYsVY
 6vnKTKGbDa7zj+72NqauR3tYjKJOP8mpnNtBCzJUaim1VzMZ00rHP1qYC A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="462863149"
X-IronPort-AV: E=Sophos;i="6.04,309,1695711600"; d="scan'208";a="462863149"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2023 04:18:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="1109629541"
X-IronPort-AV: E=Sophos;i="6.04,309,1695711600"; d="scan'208";a="1109629541"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Dec 2023 04:18:33 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Dec 2023 04:18:33 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Dec 2023 04:18:32 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 27 Dec 2023 04:18:32 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Dec 2023 04:18:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nsr9etfTbfXdfGvcPVTERqlWUkbrPHOZqcOoQPcDrb7U1SQWrhp0y8cJ1lM3fWOYyaXZcqwoTh9Flf5TiK0qhsJG/XGdYz5lfz7ZMAw50lm/BJLvueYLSIGv1TBDoG2SDtiN3Ca3eUCfGRmPzaX6I7MKLM5AXUqHSUCsDgmfaAUEvmupp/6rRrP6imhK9Kr9Fz86toPreXklYazoW+gvlD8raDXZAoJsZVHv9j7tt/dArPYbLagHPKVk7iIfggwGkPPU2dMstS4kjCV5uDX8VJru85IEmIA6QHXFmRxfkMTdgjriz+QiN/UKkgQ/EnsxOlwzI8rfgIWg1OskTWgDWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ioSNAI59AbVMmLw7eiU+nFTpyhDmA0s7A7gkoS1CxjE=;
 b=KAcbyFwEA0e+M+FQTRjCZ6F0VXbZtI34cMJCDugdLgXs5Moyks851fBAtK/80VzxZr1J2gLENfrUJIRebNEAnxX+7Jw3qiT9HZRy6q8mGFeDRwlIiRZC5DkXrfHuX+ngbnZF8VNzlHGNmBU3Jii99WH+EiajOe1JTyqhJrAp1zANA0dUjyET/Y0He5MDHG7QvIS7eOo4mCo0Bm48w+luauYCAij2axFzzPk4CNdSNd9SPPloBIqWVEh7/0u35AhhVLw/Vcm4OOZpAQ5gYjLS0AeDPUlyPhulIOpGEFtgmBr7Ujxxa5XDAV2+tuD0vIE78H5owdsQ6SAkF1pQTqtYHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 LV8PR11MB8608.namprd11.prod.outlook.com (2603:10b6:408:1f0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.26; Wed, 27 Dec
 2023 12:18:29 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52%4]) with mapi id 15.20.7135.019; Wed, 27 Dec 2023
 12:18:29 +0000
Message-ID: <3f701189-fb71-493b-ba7f-7699df458fa1@intel.com>
Date: Wed, 27 Dec 2023 17:48:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v6] drm/xe: Add vram frequency sysfs attributes
Content-Language: en-US
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20231222110631.999517-1-sujaritha.sundaresan@intel.com>
 <CY5PR11MB6211B2AC3B3E3B1A926252219594A@CY5PR11MB6211.namprd11.prod.outlook.com>
 <369acab0-b07e-48d3-ad90-c28969e8957e@intel.com>
 <CY5PR11MB62110361C1C67AD8ABA5AA259598A@CY5PR11MB6211.namprd11.prod.outlook.com>
 <9c0e0cda-5768-4c0a-973e-74ecfdf2ce8b@intel.com>
 <CY5PR11MB62110375C2241F8AE3AFFE99959FA@CY5PR11MB6211.namprd11.prod.outlook.com>
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <CY5PR11MB62110375C2241F8AE3AFFE99959FA@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0020.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::16) To SJ0PR11MB5664.namprd11.prod.outlook.com
 (2603:10b6:a03:37f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|LV8PR11MB8608:EE_
X-MS-Office365-Filtering-Correlation-Id: 82588ef4-c61f-4688-6514-08dc06d5ee32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u62JoeHU1oDnX3POxVR2pRh7O+jzHUi/lZuCEOROXFdj6thn5sZItC3WIl+ZiYhQBOcWaBCp+rxdKElwJ1BHvhDPIT6qaEcX/e8maMdEf52ixU7gF4sQ1NOd0WQFyO6f+oAYhlE/a0Z8sh85iVdqi1rMT4imQZQsUYX7NkBrqcm4HqDpkO2TFMmKK6hJSPOOiOn9lhZ1Wh78qWcwsLQZM5G3vknryDbvg6pPab31A+Q8FNcBKCP0WXsxi31tvrhrAyU9de2wDKA2rhLRk7S9qu4ii5NkfHrwS2wLoCXKlVu+PER2lELU9dXiPGfkkGUwCErPbgYAUQKC68NHbY4yr205SNxPc/qmeDJLTvzC27GpehcC0UTYnyCy4loSFWLpli3+6us6194gWwdRH9roSv9vzHT7qhgGCzpzDMykP/JMUML+isLwkmqttEqf1zjrKHwgZWBc+3cxzne8rmwqY+iB8vf1HG/UR1h3LCbTIba7MbOnNOkAHeTG3KQyZ6fwvfSec3HaB4MDpXNlBtL7JSRNTNGPe0SHpxu+AFCSSVf7utZ8TEorNneU/Xy6scdehpogXu8aRW4K0CmeNWcIwZgXS90Ip7wZtiDmw4IviukCPyiG9HpE2QpLatDbhq7kFxeW3r4KGD+G5WV463221g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(346002)(366004)(136003)(396003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(41300700001)(36756003)(5660300002)(2906002)(26005)(6512007)(2616005)(107886003)(6506007)(53546011)(6666004)(83380400001)(6486002)(478600001)(8936002)(38100700002)(31696002)(86362001)(4326008)(8676002)(31686004)(66556008)(66476007)(66946007)(110136005)(316002)(82960400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OElPQWUrQllWMUQ0VmVJN0ZOQklFR3IrcUY0NktTLzJFR2w4WHcwNGFabUNj?=
 =?utf-8?B?VjJQM3pmZWx3RkIwYlVObStSUDVib1h6TUE1OFNsMUJFVzZXSW1zZXQ2WWRV?=
 =?utf-8?B?WkM4RDdVSXRzVjlIVWptVkl3M1ZtaDNDWkszbTVmOWJJV1B6Rzh3MmZBdVJz?=
 =?utf-8?B?U0pPdE1wR05DVUVMYmd3S3A5M1pZdG1YaDlzZ2ZxSWY0c0syK0hjUCtrOHFk?=
 =?utf-8?B?RTFuRWJvc2R5eXNTSi9oM3oxTkt4blQ5aGVuZUdlSUVNc0xnZC84ZWI2WjRi?=
 =?utf-8?B?ODNPMW04dGJTR3Z3MGkzV2prZy9lQ2lMQnpJNXc1Ym5uYzJKV2I4SHBZY1U4?=
 =?utf-8?B?WmpmTTI3WFFjcWxGSGY1VFVuTFI0RWhqQ0lqWjF6Nzkza0QxVEc0cjEyUDd1?=
 =?utf-8?B?NFVVTjhtNDM1NFNhSkdtM3lZeUJxSGFOQlNPZkJLRWMyb3RmQWFHdjRkUlAw?=
 =?utf-8?B?ajQ0U3o4clREd0RwMEZJbEZpSHhWaTlVYVpEbDg4S2tML2NycGI4ZWNQbHVF?=
 =?utf-8?B?MVVVZFFWaVdkK1Q3akxlbjJxUWF3TTF1R3hvMGMxYmNSOWYvOTkwaTEyNWVn?=
 =?utf-8?B?dy9RSkZQbWRLRkt5NnpReDk0Y0thbnhqOHBIV0x5YUkyd2pUa2ppQmRzd29Q?=
 =?utf-8?B?ak1RWlFJNHY3dmZLVnlhVmlyR0VsOWdQR0JjdnZWaUpqUmNZamRFdjNhd3dK?=
 =?utf-8?B?QkR5d3BjZm1ha3BXeCtVenkyV01MZ05WalRES04vcjFwQm84WTJncE1Zc2lV?=
 =?utf-8?B?RmpCb21qN29MQlhUUjJ1czVoZjZ6MUhyUlpIZ0x6MFpIL1ZYZ0x3cjkrcEZ1?=
 =?utf-8?B?V2Iya2NZVTVCUFRrRTFqUFlTdTF4dDQ3RGQ1RFp4YXJDQzU2eTd6OEFpcnhO?=
 =?utf-8?B?ekJoSWZKNXRKL21PTk0yTlhXc016V1I0bGorTjVIU3FwbDdiZWxyMlZRUTRa?=
 =?utf-8?B?T2JoNUU1QmM3NHQ3RFBQUi9nMXlvckJlR3g4OGh1UlJVYkZBVXFtZFpVb1Mw?=
 =?utf-8?B?NGtWTUdET2o3TjJrS0lSMUJZTnNDV3RXdlZuNTAwODNwc3pBVUdPUytaRVo4?=
 =?utf-8?B?V2N0VEJqTGpjV3JHVGk1bXh6QnpkU1JrUHgrdG9iK0ZvcFVHUkh2UmQ1bFBO?=
 =?utf-8?B?bnR3M2tLVmNPd0hwb1ViWVFQR3F4SnFMSTRTU3RrUDEzNkdEcjVRMmlEQ0Iw?=
 =?utf-8?B?SlJMOTJMbnZhUndNNExEVE83alQ5aXA4VUc3azdWWkhSVVNwV3laSCtvWUR5?=
 =?utf-8?B?dHczUzZWYmJjRGpVU2hpTTdlR3ZGc0JBcmhEUG03MFhNMVZaU3ZNdUNTMGtm?=
 =?utf-8?B?ZzE2Nk5kQzIzb3d1bmhmYlBmTFptWlNjajVDc3hMa3BrdTV1K09nRVRaU1dl?=
 =?utf-8?B?YnJaOExVN25HOEdSeVcvY2tocXBqWHdpWU1oYW15LzlvR3VPZ3JMNk12SUx0?=
 =?utf-8?B?UWhyOUFrRFRrUUdlbkp1blpvMFJBa3AxVGtGeDJWaUNndElDS1hmd0liR3Bn?=
 =?utf-8?B?NlhwT0F3MVlrejZreUVSOSs5a0c0OUVMeWJJUVNCQTJkQlNyekxTZklTbWw5?=
 =?utf-8?B?YVYzaTUyd1hVK3hNZlRqTDRDUnZnMUpWTXBuQWFYYkErL1NjTVVRU21NUHEv?=
 =?utf-8?B?YnV4em5VbThWNlZHZFl1WENIYjFKQTJhanFLR2FRcENEUWUvMUpXek1sUmJR?=
 =?utf-8?B?ZFRzbmljWmk2VlcwRlFRZUFQT3NVU0hDMDlNb1dGY3RzU0NTNlE1VWJqL2pX?=
 =?utf-8?B?aGJrWnIra3dPR1dsSVVXRHo3d1luNUxmaXVPL1k5N3c0RXdkSEJOODdXL0l0?=
 =?utf-8?B?T1g1VklKZGF3ajdYV2h5bExQd3ZHaExUOXNHSzgySnZjdEZkblpXOUFkZGJV?=
 =?utf-8?B?RGpTNUtuOGZ3QUVMUkFkS3VRRW1OdHoyTWt2K3FHZDd3cElRcnJCUUFqNFdC?=
 =?utf-8?B?V2tmd3dqcnU1TUhITGRnTmhXR29EY1diYmNYem04OGM2dTBLMzdxald0dXBm?=
 =?utf-8?B?YkxiWFloV0xvdkJoZHlwbHdWeDM1cThQU2g5d29xQ0l6dHNRNzhic0ZnZmJq?=
 =?utf-8?B?V2p0THJNTmJJWkM2Ync5UVQ1UmtvSWV0U2R1UkFuRkJqM1dZN29PME40d1RR?=
 =?utf-8?B?cGFCZHNUOVAzcEp6bTR1Z3dwK2NEeVplN25uN1o0UkZORVhnazJnakg5Q01T?=
 =?utf-8?B?M3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82588ef4-c61f-4688-6514-08dc06d5ee32
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5664.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2023 12:18:28.8507 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TD96NyMi27t9dhMSnvnW4pyqm8AFL8U/FjCmGZKTDv3uLhrQMkW0kjUC8B9OVAtudxvlJLp7HeeArFm5OsMgvnB8RPmFi7xElieAxNV3OmQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8608
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
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 12/27/2023 4:26 PM, Gupta, Anshuman wrote:
>
>> -----Original Message-----
>> From: Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>
>> Sent: Wednesday, December 27, 2023 3:01 PM
>> To: Gupta, Anshuman <anshuman.gupta@intel.com>; intel-
>> xe@lists.freedesktop.org
>> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>
>> Subject: Re: [v6] drm/xe: Add vram frequency sysfs attributes
>>
>>
>> On 12/26/2023 7:58 PM, Gupta, Anshuman wrote:
>>>> -----Original Message-----
>>>> From: Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>
>>>> Sent: Tuesday, December 26, 2023 10:02 AM
>>>> To: Gupta, Anshuman <anshuman.gupta@intel.com>; intel-
>>>> xe@lists.freedesktop.org
>>>> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>
>>>> Subject: Re: [v6] drm/xe: Add vram frequency sysfs attributes
>>>>
>>>>
>>>> On 12/22/2023 7:34 PM, Gupta, Anshuman wrote:
>>>>>> -----Original Message-----
>>>>>> From: Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>
>>>>>> Sent: Friday, December 22, 2023 4:37 PM
>>>>>> To: intel-xe@lists.freedesktop.org
>>>>>> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Gupta, Anshuman
>>>>>> <anshuman.gupta@intel.com>; Sundaresan, Sujaritha
>>>>>> <sujaritha.sundaresan@intel.com>
>>>>>> Subject: [v6] drm/xe: Add vram frequency sysfs attributes
>>>>>>
>>>>>> Add vram frequency sysfs attributes under the below hierarchy;
>>>>>>
>>>>>> /device/tile#/memory/freq0
>>>>>> 			|-max_freq
>>>>>> 			|-min_freq
>>>>>>
>>>>>> v2: Drop "vram" from attribute names (Rodrigo)
>>>>>>
>>>>>> v3: Add documentation for new sysfs (Riana)
>>>>>>        Drop prefix from XEHP_PCODE_FREQUENCY_CONFIG (Riana)
>>>>>>
>>>>>> v4: Create sysfs under tile#/freq0 after removal of
>>>>>>        physical_memsize attrbute
>>>>>>
>>>>>> v5: Revert back to creating sysfs under tile#/memory/freq0
>>>>>>        Remove definition of GT_FREQUENCY_MULTIPLIER (Rodrigo)
>>>>>>
>>>>>> v6: Rename attributes to max/min_freq (Anshuman)
>>>>>>        Fix review comments (Rodrigo)
>>>>>>
>>>>>> Signed-off-by: Sujaritha Sundaresan
>>>>>> <sujaritha.sundaresan@intel.com>
>>>>>> ---
>>>>>>     drivers/gpu/drm/xe/xe_pcode_api.h  |  7 +++
>>>>>> drivers/gpu/drm/xe/xe_tile_sysfs.c | 86
>>>>>> ++++++++++++++++++++++++++++++
>>>>>>     2 files changed, 93 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h
>>>>>> b/drivers/gpu/drm/xe/xe_pcode_api.h
>>>>>> index 5935cfe30204..f153ce96f69a 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
>>>>>> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
>>>>>> @@ -42,6 +42,13 @@
>>>>>>     #define	    POWER_SETUP_I1_SHIFT		6	/* 10.6 fixed
>>>>>> point format */
>>>>>>     #define	    POWER_SETUP_I1_DATA_MASK
>>>>>> 	REG_GENMASK(15, 0)
>>>>>>
>>>>>> +#define   PCODE_FREQUENCY_CONFIG		0x6e
>>>>>> +/* Frequency Config Sub Commands (param1) */
>>>>>> +#define     PCODE_MBOX_FC_SC_READ_FUSED_P0	0x0
>>>>>> +#define     PCODE_MBOX_FC_SC_READ_FUSED_PN	0x1
>>>>>> +/* Domain IDs (param2) */
>>>>>> +#define     PCODE_MBOX_DOMAIN_HBM		0x2
>>>>>> +
>>>>>>     struct pcode_err_decode {
>>>>>>     	int errno;
>>>>>>     	const char *str;
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>>>>> b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>>>>> index 0f8d3e7fce46..cdc9dbbc97b0 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>>>>> @@ -7,9 +7,21 @@
>>>>>>     #include <linux/sysfs.h>
>>>>>>     #include <drm/drm_managed.h>
>>>>>>
>>>>>> +#include "xe_gt_types.h"
>>>>>> +#include "xe_pcode.h"
>>>>>> +#include "xe_pcode_api.h"
>>>>>>     #include "xe_tile.h"
>>>>>>     #include "xe_tile_sysfs.h"
>>>>>>
>>>>>> +/**
>>>>>> + * DOC: Xe Tile sysfs
>>>>>> + *
>>>>>> + * Provides sysfs entries for frequency in tile
>>>>>> + *
>>>>>> + * device/tile#/memory/freq0/max_freq - Maximum Frequency, not a
>>>>>> configuration and read-only.
>>>>> Let's increase verbosity of doc something explaining it is a fixed
>>>>> fuse point not a
>>>> configuration.
>>>> Sure
>>>>>> + * device/tile#/memory/freq0/min_freq - Minimum Frequency, not a
>>>>>> configuration and read-only.
>>>>>> + */
>>>>>> +
>>>>>>     static void xe_tile_sysfs_kobj_release(struct kobject *kobj)  {
>>>>>>     	kfree(kobj);
>>>>>> @@ -20,6 +32,65 @@ static const struct kobj_type
>>>>>> xe_tile_sysfs_kobj_type = {
>>>>>>     	.sysfs_ops = &kobj_sysfs_ops,
>>>>>>     };
>>>>>>
>>>>>> +static ssize_t max_freq_show(struct device *kdev, struct
>>>>>> +device_attribute
>>>>>> *attr,
>>>>>> +			     char *buf)
>>>>>> +{
>>>>>> +	struct kobject *kobj = &kdev->kobj;
>>>>>> +	struct xe_tile *tile = kobj_to_tile(kobj->parent);
>>>>>> +	struct xe_gt *gt = tile->primary_gt;
>>>>>> +	u32 val, mbox;
>>>>>> +	int err;
>>>>>> +
>>>>>> +	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND,
>>>>>> PCODE_FREQUENCY_CONFIG)
>>>>>> +		| REG_FIELD_PREP(PCODE_MB_PARAM1,
>>>>>> PCODE_MBOX_FC_SC_READ_FUSED_P0)
>>>>>> +		| REG_FIELD_PREP(PCODE_MB_PARAM2,
>>>>>> PCODE_MBOX_DOMAIN_HBM);
>>>>>> +
>>>>>> +	err = xe_pcode_read(gt, mbox, &val, NULL);
>>>>>> +	if (err)
>>>>>> +		return err;
>>>>>> +
>>>>>> +	/* data_out - Fused P0 for domain ID in units of 50 MHz */
>>>>>> +	val *= 50;
>>>>>> +
>>>>>> +	return sysfs_emit(buf, "%u\n", val); } static
>>>>>> +DEVICE_ATTR_RO(max_freq);
>>>>>> +
>>>>>> +static ssize_t min_freq_show(struct device *kdev, struct
>>>>>> +device_attribute
>>>>>> *attr,
>>>>>> +			     char *buf)
>>>>>> +{
>>>>>> +	struct kobject *kobj = &kdev->kobj;
>>>>>> +	struct xe_tile *tile = kobj_to_tile(kobj->parent);
>>>>> If you are missing to create a kobject for freq0 , then this should
>>>>> be
>>>>> kobj->parent->parent.
>>>> I don't think a kobject is needed for freq0, since it we are only
>>>> using attribute_group for it.
>>>>
>>>> Similar to throttle_reasons.
>>> Sure,  thanks for explanation.
>>>>>> +	struct xe_gt *gt = tile->primary_gt;
>>>>>> +	u32 val, mbox;
>>>>>> +	int err;
>>>>>> +
>>>>>> +	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND,
>>>>>> PCODE_FREQUENCY_CONFIG)
>>>>>> +		| REG_FIELD_PREP(PCODE_MB_PARAM1,
>>>>>> PCODE_MBOX_FC_SC_READ_FUSED_PN)
>>>>>> +		| REG_FIELD_PREP(PCODE_MB_PARAM2,
>>>>>> PCODE_MBOX_DOMAIN_HBM);
>>>>>> +
>>>>>> +	err = xe_pcode_read(gt, mbox, &val, NULL);
>>>>>> +	if (err)
>>>>>> +		return err;
>>>>>> +
>>>>>> +	/* data_out - Fused Pn for domain ID in units of 50 MHz */
>>>>>> +	val *= 50;
>>>>>> +
>>>>>> +	return sysfs_emit(buf, "%u\n", val); } static
>>>>>> +DEVICE_ATTR_RO(min_freq);
>>>>>> +
>>>>>> +static struct attribute *freq_attrs[] = {
>>>>>> +	&dev_attr_max_freq.attr,
>>>>>> +	&dev_attr_min_freq.attr,
>>>>>> +	NULL
>>>>>> +};
>>>>>> +
>>>>>> +static const struct attribute_group freq_group_attrs = {
>>>>>> +	.name = "freq0",
>>>>>> +	.attrs = freq_attrs,
>>>>>> +};
>>>>>> +
>>>>>>     static void tile_sysfs_fini(struct drm_device *drm, void *arg)  {
>>>>>>     	struct xe_tile *tile = arg;
>>>>>> @@ -32,6 +103,7 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>>>>>>     	struct xe_device *xe = tile_to_xe(tile);
>>>>>>     	struct device *dev = xe->drm.dev;
>>>>>>     	struct kobj_tile *kt;
>>>>>> +	struct kobject *kobj;
>>>>>>     	int err;
>>>>>>
>>>>>>     	kt = kzalloc(sizeof(*kt), GFP_KERNEL); @@ -50,6 +122,20 @@ void
>>>>>> xe_tile_sysfs_init(struct xe_tile *tile)
>>>>>>
>>>>>>     	tile->sysfs = &kt->base;
>>>>>>
>>>>>> +	if (xe->info.platform == XE_PVC) {
>>>>>> +		kobj = kobject_create_and_add("memory", tile->sysfs);
>>>>> How freq0 is getting added, I am unable to see the freq0 kobject as
>>>>> per the path
>>>> "device/tile#/memory/freq0/"
>>>> freq0 is being added as an attribute group. It is similar to the
>>>> throttle_reasons implementation.
>>>>>> +		if (!kobj)
>>>>>> +			drm_warn(&xe->drm, "failed to add memory
>>>>>> directory, err: %d\n", -ENOMEM);
>>>>>> +	}
>>>>>> +
>>>>>> +	if (kobj && xe->info.platform == XE_PVC) {
>>>>>> +		err = sysfs_create_group(kobj, &freq_group_attrs);
>>>>>> +		if (err) {
>>>>>> +			drm_warn(&xe->drm, "failed to register vram freq
>>>>>> sysfs, err: %d\n", err);
>>>>>> +			return;
>>>>>> +		}
>>>>>> +	}
>>>>> Don't we need sysfs cleanup and kobject_put in tile_sysfs_fini() ?
>>>>> Have you made sure kmemleak won't complain here on memory leak ?
>>> Check the kobject_release() , this will only get call , when all ref count of that
>> kobj is being put.
>>> Here you are creating a object and it will never be released.
>>> Also  we need to call  the sysfs_remove_group() as well in fini function ?
>>>
>>> Thanks,
>>> Anshuman.
>> This is a bit of unique case. In this file we have two issues that keeps us from
>> cleaning up like others.
> Current patch looks broken to me, this will leak the kobject on module unload.
> Please check kmemleak after module unload.
>> One, we need to cleanup the base tile directory here. And second, we are
>> creating the kobject only for PVC. If we add the "memory" kobject cleanup to
>> fini, we will be defining tile using kobj. This is causing an error on unload,
>> despite adding platform conditions on fini.
> You may try by changing the type of void *arg to "memory" kob to fini function ?
>> After testing multiple iterations of the fini function, this was the cleanest way
>> with no errors that worked across platforms.
>>
>> If needed, the only way to accommodate the kobject_put(kobj)  and the
>> sysfs_remove_group is to move the vram sysfs creation to a separate file,
>> similar to throttle_reasons and gt_freq.
> I think it is needed for a functional working patch, if it can not be handled by using
> "void *arg" in fini function.
>
> Thanks,
> Anshuman Gupta.

Since this is bit contentious even though the patch is functional, I 
will move these sysfs out of xe_tile_sysfs.c to it own new file.

This should clear up everything.

Thanks,

Suja

>
>
>> Thanks,
>>
>> Suja
>>
>>>>> Thanks,
>>>>> Anshuman Gupta.
>>>> I have already checked for mem leaks during the cleanup. The
>>>> kobject_put is not needed.
>>>>
>>>> Thanks,
>>>>
>>>> Suja
>>>>
>>>>>> +
>>>>>>     	err = drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, tile);
>>>>>>     	if (err)
>>>>>>     		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed,
>>>>>> err: %d\n",
>>>>>> --
>>>>>> 2.25.1

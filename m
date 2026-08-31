Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D12A9C61DE2
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 07:10:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FB0810E66A;
	Mon, 31 Aug 2026 07:10:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JMFCKf0a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 720A610E66A
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 07:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788160204; x=1819696204;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ua3G82ytcc2+ehcXqKGQNK8P97M74J/jfAj0qEMKf7I=;
 b=JMFCKf0alI/Kfbl0gRLnXa4xidIr/stn0ktvlyChHkLZPKZB0k4OBTWq
 ycS8QXfY43qpAByIf5Gzo9EvWfMqeZNMBkP8vWhSu+rPlmdXtrPlaQooc
 eJnZadvAtHs3lEdtdYBlwUWh8PmN/Gtxq5C1kjyEof+F/jbd5nBrkh79R
 ZJErcOyF8xsmnt1uqbzKKUFVhMtEuKHexR4q2Oe1WMn/Njl+BPT4aMLqz
 FJuYS4HyuDF62aJvhcBttVxS111y2Um4PcrSGGSlFSH/dWKquzIHpml26
 55LESiDy8Mytphwb8JOusIKAJhbgZhoRGymf/7HoEsT6tE4Bz1F1nNvKK w==;
X-CSE-ConnectionGUID: YlgDozjiTQ69Z704yZNtZA==
X-CSE-MsgGUID: j2ltdQWCTUO2XUTubfyIOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="99910852"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="99910852"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 00:10:04 -0700
X-CSE-ConnectionGUID: hIBzEVjxRJK8RbbMiJgVmg==
X-CSE-MsgGUID: 7O1MBxwQQHa1lSa/ABBOyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="270645030"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 00:10:04 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 00:10:03 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 31 Aug 2026 00:10:03 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.63) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 00:10:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VJeSASAIbXLmZuW/GxfbYKWYezCvtTiXJCHvJUPgl1NbNqxMs8d6iCL6tpv+nyPcK469EM9YvNOeSjN8HZU9QZGy1g6i1gh/ExLhcnr/CpCSMsFl9bL2BJcU1QEUcqXaPmL1zHwqlZdFs7qZH3ILzPRyPyghhj9bqOH4BUeqfZak76CzazulrktJB91iszfJItOtfe3jyhz+GksjtJkML7WGeBOTrH/BaiCDHzzMCmHkRBnUvb3l1KJ1fVTAv+eJNII/kmIwar/BueOpwfkow98g/i8JAixQzD3PuEPpJSm7mhbv8DwLtx1yzluv6pb8DiV0tJdIlFaG04xildBsNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s/bofcYiV3wG0J7mgfmb+w7wbmvpV5oNoOtA+NVF1Sg=;
 b=sPvH7diN9IpKilbNj+YglY7kUdEW4uE6W3y68XCG5WPoA3jcGJ1iiuGwNNJNzhiZsojbJ4mBQAM+ijmD9vS95I0hcme3K1tda/awwYV/SttfufBrOcoU0mEiyKgf0XOJ8pSTxJ3bmRDYQRmyYHEpnD3umzUa9Q+yfi3NVGkFkjjSlawZ+/AZjrXrCKZ7tmUdbj2XBrx/DPmt8xV6FN370Nc9dHSxILFnTUIAh3wWN602zBBUpPR5xgoAfWJ+ann28xrHauqvgs41UdpweoO9Xx/2ixqSQvHgc1JF14vHX+VWJjhZABPgWs6WjRvxG9ljOxULQd+94Q/LVGMITasWpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CY8PR11MB7924.namprd11.prod.outlook.com (2603:10b6:930:7a::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Mon, 31 Aug 2026 07:10:01 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 07:10:01 +0000
Message-ID: <dc04b171-55dd-4a9d-9ba6-fb3960582e33@intel.com>
Date: Mon, 31 Aug 2026 12:39:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/hwmon: Increase timeout for mailbox power
 limits
To: "Poosa, Karthik" <karthik.poosa@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <sk.anirban@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>
References: <20260729171546.3368457-1-karthik.poosa@intel.com>
 <20260729171546.3368457-3-karthik.poosa@intel.com>
 <ad776a91-9b0a-4a72-8b05-8890a7b5a4cd@intel.com>
 <2c61329e-a7d0-4524-b585-5d10fd970ffe@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <2c61329e-a7d0-4524-b585-5d10fd970ffe@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:179::13) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CY8PR11MB7924:EE_
X-MS-Office365-Filtering-Correlation-Id: a5082eba-d69a-4dcd-828c-08df072edf3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|56012099006|10067099003|4143699003|11063799006|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: c1uLg8wKRehEWoxBnG6l6YduHYDs+u+EJnuf+MVW8lN+br5YVEnmEn+X3rAQAeJsEp+ggbuV8rlufO9z/lZBO/fxj0IhY7xdfK5wsHmFwGzAwXRAPZZeNU7W43k36aMROtBV71mF9bSTdBd1xpWHRrdyOzxOSDiMDtDrVCUiBmfMqaV3ziw1tLT1MI/RqKR7037sIRHj1/GYCYJQkPe0J/jqi/rp/+UOQloJmA3DeyKXeSxqzk0JGCjGcAObVLbFO0pTwWzGRPc8PRrA2bsDxUkkxzTTapQblHkKQLwBIOleaUvfu877TWz2EuYWEr9pLX1K6+UCzAWlOhTh/RiFdI0eXvX/GAYY5gDEibIoSn3g9Q7VmT+YVd4gDqjJRR15I4CgwUsTC47l6Nylqu3EAbznO9xbe/UcZnRkAu+lq6HAoor+50P5ceJGJrVW5BCP82lkR3w5Tk5pMcm9px6kmr9TXAeeGq6UGACQilJ9HkFaNhOurX2CUnTNYp1mACPCvfvYPUJtHmypE1HZ2l0zWcJJCNcuYwYLypcocwrhzNIKezg+choBFwSZ6kAsAHRtBtM9WyC/ykhoyMfuAjYSJXBh4uhSfzFLpH4ZEbbxzNQP/ltXXcuLE++5/sb3NkFVXSFvBCdExGfHESXtvkNmcprFklii3rbe3uybXOUlErA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(56012099006)(10067099003)(4143699003)(11063799006)(3023799007)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3Yxc3BVL3RaMVNIWHFLcDBxMTJncUtUQXlQT3NvTDJCNG5jOE9VT3ZPOW5T?=
 =?utf-8?B?b1prM3FnZllWblV5ejNGbVdCTEFlajU5cS9jbEV6enhBT3FQeEtOZVdwYkFi?=
 =?utf-8?B?bE0yOUl2MWxnYkYyRDBSSnBSemcyVUQ2R0orejcyWFFDVHVjZEtrZmp5MnBh?=
 =?utf-8?B?eHZLUFlHRUlQNDVMbWtDL3gxeHBwd2lyWlBYQ2IwSjZIUVBCakZrbFB4cmll?=
 =?utf-8?B?allzSTBmSi9RYW5YK2huU1N4QnNBVVV5MnpHeTU5MTUxbkxBMEJkU1BQSWpq?=
 =?utf-8?B?R21DQU1BUDFKL040Z1VYejhjNWhVUWxZc1k5S1NMTnBoVWtmekhXVGVUVitk?=
 =?utf-8?B?M0tNTkw1U21qUnpXSEx5YWg4RTVxeXNnNlM4Sk92cFBYaW9OTjRTM0hXNXRV?=
 =?utf-8?B?dWJmaC94M2lQVlp1aTBXVnV0NUprTUozM3JZSFU3TXp6cW9vM2hCdGcvTzU3?=
 =?utf-8?B?ODhNdVpFMTlFZm1nQ0RoU3RrZkZDbCtjcGZ3Y1l6cWRDM0FBdG1aZlJFYkhW?=
 =?utf-8?B?ZDY2aU5weEtaSGlQeEpldjB5TnlGSkxOdzZFMmVZN1NIOWtWS3NCUHBjdDky?=
 =?utf-8?B?RWUrV2xnMmRpUnJnRTM4UXRoSy9uQ2tBUlJ2SmtIaFRhR0EzeUpQSWxjWmRU?=
 =?utf-8?B?c3R2WXlzMEZoQ3JmVmtodmlzOE5QTU1QY25SRXBrbmNyeTJ2YXVZNUViOXNT?=
 =?utf-8?B?ZlhnSjNjaHpVMXZ3YTlvRFd4TUxIL2d6aVpVRFMzUTl4VFRvT2NVNDJWOXJH?=
 =?utf-8?B?T003ZDYrQm9Kc1V6S3NvY0c2WGdPcmZvZXBhYzdhK0pTR0x3QmJ6dTRRL3VU?=
 =?utf-8?B?RmZRMDF5WGFIV1JPeHBwMURhald4c0xOU0x4a2RqNXF5T2xvaHRzK2xJcWYx?=
 =?utf-8?B?ejhWeVhIN1dHRTNvdTlOaUNBRktmZjFLeERBMk9SK3MvOEhwTHlMdEp4Ri82?=
 =?utf-8?B?UnJWRU93bk1tSWc5WEMyVCtudmZ2dzdHRmM1eUtvS2htdThtUm55NkhadXJ5?=
 =?utf-8?B?ZEpZa2lIb3kxY2xSWER1cm84bUJsbHhtODBuSFZ0a2llWU5PeVpQa0l5cFJS?=
 =?utf-8?B?MWY1bnpMVlk4RnEwU29kQU5UdjQzU3JBeGZ6TUNPWFhUdEVKY0FiaHBmTzhs?=
 =?utf-8?B?K1U1VjM5em9QOWNrVVRBK05JdVgrR0xKanVoSVhJZlJvbEV3QW1ITEhmektP?=
 =?utf-8?B?RnVGYitwTG85TDM2K2Mwa1ZsZnB0R3VsNkZXbWx4dTVDWElyZ0RqTWxscjdh?=
 =?utf-8?B?T2xVbUc1ZHc0SENOZDgyRndQK2F4U2EzVWVZaVR2dTlhLzNnZmJqTk5kRVdU?=
 =?utf-8?B?U3Q5YnpVWUt4Qi84VmVkcmdGbGpobXVLMWZJZnNVbDNjY3hiV0JGL3hvK1RY?=
 =?utf-8?B?TitoUmlINC9PWUQyUTA4K0lvMDBwUm1LZ09QU2R5UGNGN01MaExjZ1Z0UGJ1?=
 =?utf-8?B?MDEwMy9qZ1J2M1F0eWsxeDYvSWRURjlGRmNSYTdPd2hZNkNDMy9vRVd6RUJQ?=
 =?utf-8?B?VHAyck5kV2VJWHVjeVZhbjNaRExGZGkyaEFjUUNacHVMa2pyaUw5UVJBMnpO?=
 =?utf-8?B?dWpKQ2VsRklWMURMdHFnbGZxOUpiWHZlN08yQmZuNDF1VEthK0VFMkQxdnRz?=
 =?utf-8?B?Z2ZHMjBXZHd4T3o0Kys5Tk1DcDF0RFZ4Uy8wcENja2o1OEJETyszMjM5T0x2?=
 =?utf-8?B?RDJEMXNLUVlKN3QzQTREL2gwZnpMcjlrcEZIM2pwZERsdllzdmNzWFlHamsv?=
 =?utf-8?B?UndZZkdzSms3djVmVUhRcVFaZjFWVDc4WUtyMWxVbUxZUktRc3YxU2ZVVTUv?=
 =?utf-8?B?bGpFNmlvMzRMeFVzbHdBN3ZoYlVpSGcrRDRtLzI0OWZvUXZua21ldHJhNFlI?=
 =?utf-8?B?ZlVLMk1kRFVSYlBVS243N2xMTXNPWktVWFdDbFZycHg5bWhDdUhjNk05Vmkz?=
 =?utf-8?B?YnVzSzNhTHY0Z0dlZGNqVGpTRjVhNFhMcUlFOXQyVlpYTzhHUkU1cU94aWNN?=
 =?utf-8?B?dnV2TWNCTEh4bHhSU29FMjBoNGJiTUtJY3FzTTFNMWhMQnRoc2tjTEQxTFQx?=
 =?utf-8?B?MUg1ajJhRDFPbmxEVmZvRjN5M0Y2aEVqNFF2SHVWem51NVZEVktNaEFoU2Zh?=
 =?utf-8?B?MHV5VEZZalRHUzl4bzZLbHJRQXRuRytxemNOWEU5dDZ5bjkyYXlSMWpPc01E?=
 =?utf-8?B?QjUxUUx5bnd4UlpxZU45QjJpWlBKeWFVaDBsUHFWT3FuRVF4NEZNejE3R2Jx?=
 =?utf-8?B?VmNvNExxZ084WDE4ZlNMakt6aUZhZUppOXVleld6czlBQzR1VzlaRDlQc0Fu?=
 =?utf-8?B?bm1vSE1iQ0FaczI1UUJnb2tYNjJFVzN5a3JuS1VOSjhmU3oyQmlzQT09?=
X-Exchange-RoutingPolicyChecked: jaVEZcliUQrQlXkT275lvFi4dVzxqPUNv5inQK/5QHljjVrEDWSp2uYwlDNfO0rN07rM6zwWlqOlvaygs+Tjyang4V2dgXHfG8Ed/QCvhDNzVFIgZNPXB8ICT9j8C+c7v/NlNkq4eGySuLt8zbt7shmMNIzm6cEbpRfP3ZIzbF/pEDc9slIXXZBDX7gMvnWLV7k6N/3ltUkP/gMsv4Ld6JjVvHlqPTRmybsv1ts9I03XP8r49/js+rtfQO/yHj9G0rBHbgWd9x2IENiX2Dp+r+AhLa/RxeQqTqN3O9cMoQYSGQTj2d8CJCUHTXj5QvtFO4DNmlZ2w2GGDiTFAcFcRg==
X-MS-Exchange-CrossTenant-Network-Message-Id: a5082eba-d69a-4dcd-828c-08df072edf3a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 07:10:01.2335 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ww/0GKUt4xrQm0Gv6mscpT8+x9+Cjsah8UDG60MPS9RBIxKRPtu4UoEPV9PEseHPzXgm7dGBiC+Sy0WSz0GGRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7924
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


On 31-08-2026 12:24, Poosa, Karthik wrote:
>
> On 31-08-2026 10:59, Tauro, Riana wrote:
>>
>> On 29-07-2026 22:45, Karthik Poosa wrote:
>>> Mailbox power limit operations can occasionally take longer than the
>>> current 1 ms timeout, causing sporadic failures.
>>> Increase the timeout to 10 ms and rename PL_WRITE_MBX_TIMEOUT_MS to
>>> PL_MBX_TIMEOUT_MS to better reflect its usage.
>>
>> Why is the timeout applicable only for power and not the other 
>> attribute reads?
>>
>> Thanks
>> Riana
>
> Because the timeout is seen only with mailbox power limit commands 
> only, default 1ms timeout wasn't enough here.
>

Any reason why this is not seen for the other reads?

>
>>
>>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_hwmon.c | 28 +++++++++++++++-------------
>>>   1 file changed, 15 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c 
>>> b/drivers/gpu/drm/xe/xe_hwmon.c
>>> index de3f2aeffc3f..459ad953dfc8 100644
>>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>>> @@ -102,9 +102,9 @@ enum sensor_attr_power {
>>>   #define PWR_ATTR_TO_STR(attr)    (((attr) == hwmon_power_max) ? 
>>> "PL1" : "PL2")
>>>     /*
>>> - * Timeout for power limit write mailbox command.
>>> + * Timeout for power limit mailbox commands.
>>>    */
>>> -#define PL_WRITE_MBX_TIMEOUT_MS    (1)
>>> +#define PL_MBX_TIMEOUT_MS    (10)
>>>     /* Index of memory controller in READ_THERMAL_DATA output */
>>>   #define TEMP_INDEX_MCTRL    2
>>> @@ -199,11 +199,12 @@ static int 
>>> xe_hwmon_pcode_read_power_limit(const struct xe_hwmon *hwmon, u32 att
>>>       u32 val0 = 0, val1 = 0;
>>>       int ret = 0;
>>>   -    ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_POWER_SETUP,
>>> -                          (channel == CHANNEL_CARD) ?
>>> -                          READ_PSYSGPU_POWER_LIMIT :
>>> -                          READ_PACKAGE_POWER_LIMIT,
>>> -                          prepare_power_limit_param2(hwmon)), 
>>> &val0, &val1);
>>> +    ret = xe_pcode_read_timeout(root_tile, 
>>> PCODE_MBOX(PCODE_POWER_SETUP,
>>> +                              (channel == CHANNEL_CARD) ?
>>> +                              READ_PSYSGPU_POWER_LIMIT :
>>> +                              READ_PACKAGE_POWER_LIMIT,
>>> + prepare_power_limit_param2(hwmon)),
>>> +                              &val0, &val1, PL_MBX_TIMEOUT_MS);
>>>         if (ret) {
>>>           drm_dbg(&hwmon->xe->drm, "read failed ch %d val0 0x%08x, 
>>> val1 0x%08x, ret %d\n",
>>> @@ -232,11 +233,12 @@ static int 
>>> xe_hwmon_pcode_rmw_power_limit(const struct xe_hwmon *hwmon, u32 attr
>>>       u32 val0 = 0, val1 = 0;
>>>       int ret = 0;
>>>   -    ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_POWER_SETUP,
>>> -                          (channel == CHANNEL_CARD) ?
>>> -                          READ_PSYSGPU_POWER_LIMIT :
>>> -                          READ_PACKAGE_POWER_LIMIT,
>>> -                          prepare_power_limit_param2(hwmon)), 
>>> &val0, &val1);
>>> +    ret = xe_pcode_read_timeout(root_tile, 
>>> PCODE_MBOX(PCODE_POWER_SETUP,
>>> +                              (channel == CHANNEL_CARD) ?
>>> +                              READ_PSYSGPU_POWER_LIMIT :
>>> +                              READ_PACKAGE_POWER_LIMIT,
>>> + prepare_power_limit_param2(hwmon)),
>>> +                              &val0, &val1, PL_MBX_TIMEOUT_MS);
>>>       if (ret)
>>>           drm_dbg(&hwmon->xe->drm, "read failed ch %d val0 0x%08x, 
>>> val1 0x%08x, ret %d\n",
>>>               channel, val0, val1, ret);
>>> @@ -252,7 +254,7 @@ static int xe_hwmon_pcode_rmw_power_limit(const 
>>> struct xe_hwmon *hwmon, u32 attr
>>>                                    (channel == CHANNEL_CARD) ?
>>>                                    WRITE_PSYSGPU_POWER_LIMIT :
>>>                                    WRITE_PACKAGE_POWER_LIMIT, 0),
>>> -                                 val0, val1, PL_WRITE_MBX_TIMEOUT_MS);
>>> +                                 val0, val1, PL_MBX_TIMEOUT_MS);
>>>       if (ret)
>>>           drm_dbg(&hwmon->xe->drm, "write failed ch %d val0 0x%08x, 
>>> val1 0x%08x, ret %d\n",
>>>               channel, val0, val1, ret);

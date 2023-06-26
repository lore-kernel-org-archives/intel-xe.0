Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E294EB64D7
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jun 2023 13:28:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7ED910E201;
	Mon, 26 Jun 2023 13:28:20 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 152A110E201
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Jun 2023 13:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687786100; x=1719322100;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nAyZs/v1KFZmHJ/b4LWqm22678yO6hPu79/68Yil+sM=;
 b=GPY9bBzjdBCA7HkTzUbJevQf9jtw62b9sNVF3CpMV8rexGZ9gavdGaXN
 mrMg0NpLByPr9LN886BUQPCkXvPQLgCi7re+7Usjdsurzx776PGtIn9RR
 R7aVqRtuICB9HOL7EytxZA7N33293oTqiYvGdJw+57Bnyb86BXnCiEJkF
 zOw/RDWSBdcDo1NhozXbm7ALVWTgWPUDuobpCv0/noNQ4a0JbHa87AxIL
 yyIq8O/8RtzLAexKlyV2r/9KxrgoFgvgvoQwFBC0j+fYn9qNmqUs9PaR4
 Zb1xVJrLATUiKRLWKmwym9TRf102iYeN9drcIpkZrCsohJrpIbDHaFnIA w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="364715463"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="364715463"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 06:28:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="840276856"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="840276856"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP; 26 Jun 2023 06:28:14 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 26 Jun 2023 06:28:14 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 26 Jun 2023 06:28:14 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 26 Jun 2023 06:28:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dTu6q68u+tASTrwtmfkG15AgE6qK9bmXynJKpgti+JDwIRdxQO73G0vX6J1q6YCGhc03ztK2usC0VF8q7e38QfbyQoUttKTYRxfnFlP4p62GqZnbZoVLQtKMdmoktB32mU3zQ/BHDQEzEP1fzz6nYry+fgnk9/Li1DdMgC68wgXJUBxBtqZf3LThlmArX2GA2ayEnAVsfWWF/RH07/Xu8Mxfp/GGMYn/Rsa5BaZIo+yykDxE/naz9GqhGGOQUv2QPgY4B+z7qpxLd/PbfvxUi6r0OcY4pHTRgX3AE1KfxlQkawaVpRTqniQxOED64XkodF1F4/QSNz+k+whXJtrWcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qpi/ah0ILyOJ2HzeazFFDaBd3nUsKz1+TvVQLlZf+6E=;
 b=mnyFytUnFi9jXtz1n7jwrtU4Pn26tD2VXOwOABRKXf99f9CtBISMUY0wHTbQsFoOnbxZcnCIczQCQGX9vZsAvMXSzq+AlGknz7cI/Z3MQIAhVYHCjU962yC3ftE+dxLDh4ikgqdW3uzMar6UCPuWBezeIMWjhjBVSLx7GqY6HzKH9UdNZawpwfhT6C4DOAy4udM1DzRASX3iwWikxTtlIFsAYuyG67tM3NAgEjRbBGE3eLiNZtD+WUf5BlvD0PSmmKHlIIfplbghcT0C4U8+TpB2SlvOjcHxKpEQh45ISvUS8TnTMkBxy2lQWMPJYtRSSZBdb0Ll9L4Ed5QvCBSG8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SJ2PR11MB8404.namprd11.prod.outlook.com (2603:10b6:a03:53f::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.44; Mon, 26 Jun
 2023 13:28:11 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::bb92:d504:7607:ed33]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::bb92:d504:7607:ed33%7]) with mapi id 15.20.6521.026; Mon, 26 Jun 2023
 13:28:10 +0000
Message-ID: <29d7ea52-ae94-af2f-aa7f-9fed66ed16c5@intel.com>
Date: Mon, 26 Jun 2023 18:57:57 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230606125057.838618-1-badal.nilawar@intel.com>
 <20230606125057.838618-4-badal.nilawar@intel.com>
 <bdf648c3-bacf-8f24-1695-981a9e4d7b0d@intel.com>
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <bdf648c3-bacf-8f24-1695-981a9e4d7b0d@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0233.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::12) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SJ2PR11MB8404:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d0c9152-80ce-45af-1bce-08db76492f70
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oUh9qwCbRTDln7oVZUsFpASLbDXvl/bK/4zUBSVCTada/6Sg6uJROmOqbzik7IwurHtxXZoJlclqMI/2ZD/Tb3Dj/rOmacka4LXc8pEZkxjA/SzDeyeVubSEVuz5U5aFBgc6GfipBx8VvMIJs1tazIkQewIUiLhCW3q8zCbxMldLzl2cvfzKBirWPfbMc9lSB+WjtTlBUQL/RKfvahMChF1k5/GG8eGy0YaMmWGv6En0mU8TTZoaq/6ikNjiKpG9EIJzD0fcZzESRavBkthNCnZc3hkppP/WXJ9YOlaUwRulYUlTWkAu8irgtDeJf/TQtFFDpwxSQV5TkCeGgxsAslsArI8Vz0kXTTXXwejctDk+0U9Tzyh6ik+TMpawnwdhxukXIPbNEXaQHeI9Cr5g6VKqTAY2Rm9P0aNZFGdlAT/NffPmJ1lmaoPMuCVEJ98yRYOtw9arZbHLEa5tdihgdkjlmWyK0nv5StcyT5Uo2tH4aUHJ3iFd4FbwS6JmMpuMKoGcrWEKR8y8DH8v/BhabM4hcdSTx5UM4GTcjw7Z5NdbIKTeRU5m7raQz2o4desCVj7NUyS4QK7U1flYZSRywnSDxFh2T+Xqc8CYpQfr/z3vscJslfsdkv4tm8CusNMlD/QC4eVTRc0yTso8BWg9kg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(366004)(396003)(39860400002)(136003)(451199021)(31686004)(6486002)(6666004)(478600001)(83380400001)(2616005)(36756003)(86362001)(31696002)(2906002)(66946007)(186003)(53546011)(6512007)(6506007)(26005)(107886003)(38100700002)(82960400001)(4326008)(316002)(66476007)(66556008)(5660300002)(8936002)(41300700001)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFhCa3BCWUZYQklwdHhGSDg0em4zMUNtek1EbDdxcGQ1a3diWUk5Q21jN3hM?=
 =?utf-8?B?MVg3d280K3hidmpFNlJMY3ZQdC9vUCtJMDVidHVwbi92ZVFIUThKekJ3Z01H?=
 =?utf-8?B?S205bVlINzZsRVFEalE1U29FaVNDZi9DM3hHRDUzSXd3R05rcVVDZGpWa2g2?=
 =?utf-8?B?SkpaeVkwa3BmejF1bVlaWERPcGU4ZkpzSnhDNjZQRlFJWGQ0NzkwejB5dmxX?=
 =?utf-8?B?aUhIVHNGaHFwY2ZVRDVlZ25MMDcreE02aWpoV2d6RHExejlrZmlCVlEwTTZP?=
 =?utf-8?B?b2tMYWpaa1Y4YzVpM2pGZVNjU3hWNUE5b01zbU54eUZkSFVVWVNJRy9yaHpn?=
 =?utf-8?B?YlMwdllQNmFyTVRPQmdNRmdNelRqbDBJK0xYRXFYYzBndTFkK1FwZG9pc1Ji?=
 =?utf-8?B?Qy9yVnZlUDRVRG1aSEVCcWZlNW50VWMyR0FHYlNUNXdKZisyY0lacjRldmpJ?=
 =?utf-8?B?WXdQSlZqdDkzUjJmQ0tZWWExRFBKRGxNcmJkY2ZxTXdxczdla0hGZ1F3aEN4?=
 =?utf-8?B?MW1hT3lBQVJhc3Jwdm40dkpUS0E5Qm5IZ0hFUm1POXpvdi9GWmVCQlhNWWg1?=
 =?utf-8?B?QTVNRGc2UlFSOWdEUXEwRjBCRkViektaUUFwbTdCTEpzcGJLaC9MWHR3RmJW?=
 =?utf-8?B?cTBoM1h2STlPc2xMY0g4T2lTK2VnZFd6Q093WkdrWm1hYjNLVkZXTm1ITDlU?=
 =?utf-8?B?dmNUQVR0TVk2NkhPVDJLSis1NWtQRXprYUxGOEYwRWtqc1NwSEJuT0wyTk53?=
 =?utf-8?B?M2dRVkIrbTZRcU1tQXJIMk9RWCtzSEo3MXRCMXc4eTR3OW9saUF6dVg5OWJX?=
 =?utf-8?B?SGNDK2xjd0tkemY4azB1ZzZ0SmRFT0NjWERqWXg3ajNzRUhtSFhNVlVGdE85?=
 =?utf-8?B?YjNFNnNFOG1SWnBtMWdwSzU2M2RjOVZJMnRHTHZueGIvQzJqWE4zV1o2SkRK?=
 =?utf-8?B?endxVXZ3emdjcFV2OE1ubkdkVlZ0VWFMQkdFRVY0aWViT2xmLzh2QmV3bEh3?=
 =?utf-8?B?NzJidU14azhicHRCYzQweGpabnBxT0ZUaXl5TDUrTHNGblJPSmVCSWRnNTdN?=
 =?utf-8?B?bG1hMXBYTUw2ZUVPcW52NU9tN1o2VGh5bUk0cGJYMGl3MVI0WFZObU9OYXVv?=
 =?utf-8?B?YU9NZnB6bmd1VHpWcm1UbzgwMkVzM2JSV1I4dDh4YkFEZHlmZC9QeTV5MGVt?=
 =?utf-8?B?cUlFYnhMRWhtOFFWMU0vM3R6WGpybG9uSktPZVdudXMyY1ZQc3dXbEdDRnlW?=
 =?utf-8?B?dkQyOFhkVjNVRUE5ZW1Dcm5OeEpUdk9VWXBqZnZqdEJQUVFrK2VNa0hoTGxB?=
 =?utf-8?B?dHBja1RCa0txN0kzVGcvL3dTd3JySVI2SWFucktIUlcvOGdjWXdoOEhGQmZD?=
 =?utf-8?B?bW5BRmFqNFMvR2NGRTJyNGpxbUc5dHE3WUJLZy91ZjNPRUJtM2NBS1ZiVDBB?=
 =?utf-8?B?anBUN0lkZk9FRlRINnhHajc4d3dPN3ZhYVBnL0I3K1dNeWRIMDJYN1JpeGg3?=
 =?utf-8?B?S1RFcUFOV0NTaDNpNHhuN0RWMnY0dlNCeUJyTkw4dzBDOFhiVVE3aWF3RE5N?=
 =?utf-8?B?cjhMLytSZVhBb1VocjA3NG1XSGdQYmZJemdJWWpKVWFHMXpyQjhSYjZZSGdN?=
 =?utf-8?B?UjNFeXNLeVNFQWRjaEt3TmRIMXJRS1YwNUg3SVo5NktZUDFlNnlQZEJiQ01y?=
 =?utf-8?B?ZGtLU28wKzRqWGlXck5JRHBEQnRCT2Y1MkpZZEpDTll2ZVpBbFdzNGJNK1Vw?=
 =?utf-8?B?cXp5azRIOGNqNmFFNDhPRGxCZTN4VC9hbERxd2R6c1JsN2NhZUNwTi9hZkJD?=
 =?utf-8?B?YmY5RE80Vys5MXR1ZHdTVEs5cWV4YzBRWVNUR1ppK0ZQdStBdmJLNVV0UEhJ?=
 =?utf-8?B?d0VQb2hkU1pidnc4UHgwRGIva01sK3Z6MlZZc1FqdnRvS0V5ZFVMTVF1WEJ3?=
 =?utf-8?B?M09vNjFVank2Z1hhRTM4ODdxK1lWM1VoTGlEOENYTklSSzRXS28yTjdBNFQw?=
 =?utf-8?B?K2Y4YmR1Z2ZyMGJ6MU1MSzJlbUwyL1NQV0tvdCtmeld3LzB2YUtZczRJUVpa?=
 =?utf-8?B?Z1duVGx6MHV3NHR4K09RUWxhamhhWFIxN0xCZEZEYlI5SUdaTXh5b1VDUVdp?=
 =?utf-8?B?M3cvUzdQdVVHdTMyYWN4RFYwTEtRc2xycUhybGxIT0ZjeEptTHNFSG1CTS9l?=
 =?utf-8?B?SFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d0c9152-80ce-45af-1bce-08db76492f70
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 13:28:10.5107 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RC0NnCK3SE4iJ5h/c0wxcYjC4xMLPFmyXRvzLQHwwhIzdiGomF6+Ra7DXaTmaLTsmoxXawr1wWqzmqc9m2j0DQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8404
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC PATCH 3/6] drm/xe/hwmon: Expose card reactive
 critical power
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
Cc: jani.nikula@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 14-06-2023 13:22, Riana Tauro wrote:
> Hi Badal
> 
> On 6/6/2023 6:20 PM, Badal Nilawar wrote:
>> Expose the card reactive critical (I1) power. I1 is exposed as
>> power1_crit in microwatts (typically for client products) or as
>> curr1_crit in milliamperes (typically for server).
>>
>> Co-developed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  26 +++++
>>   drivers/gpu/drm/xe/xe_hwmon.c                 | 106 ++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_pcode_api.h             |   7 ++
>>   3 files changed, 139 insertions(+)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon 
>> b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> index 54a7b668009e..fcc2aedb2aac 100644
>> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> @@ -20,3 +20,29 @@ Description:    RO. Card default power limit 
>> (default TDP setting).
>>           Only supported for particular Intel xe graphics platforms.
>> +What:        /sys/devices/.../hwmon/hwmon<i>/power1_crit
>> +Date:        June 2023
>> +KernelVersion:    6.3
>> +Contact:    intel-gfx@lists.freedesktop.org
>> +Description:    RW. Card reactive critical (I1) power limit in 
>> microwatts.
>> +
>> +        Card reactive critical (I1) power limit in microwatts is exposed
>> +        for client products. The power controller will throttle the
>> +        operating frequency if the power averaged over a window exceeds
>> +        this limit.
>> +
>> +        Only supported for particular Intel xe graphics platforms.
>> +
>> +What:        /sys/devices/.../hwmon/hwmon<i>/curr1_crit
>> +Date:        June 2023
>> +KernelVersion:    6.3
>> +Contact:    intel-gfx@lists.freedesktop.org
>> +Description:    RW. Card reactive critical (I1) power limit in 
>> milliamperes.
>> +
>> +        Card reactive critical (I1) power limit in milliamperes is
>> +        exposed for server products. The power controller will throttle
>> +        the operating frequency if the power averaged over a window
>> +        exceeds this limit.
>> +
>> +        Only supported for particular Intel xe graphics platforms.
>> +
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c 
>> b/drivers/gpu/drm/xe/xe_hwmon.c
>> index 8e248e806559..b07ea53fdbc6 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -14,6 +14,13 @@
>>   #include "xe_mmio.h"
>>   #include "xe_gt.h"
>>   #include "i915_drv.h"
>> +#include "xe_pcode.h"
>> +#include "xe_pcode_api.h"
>> +
>> +#define PCODE_MBOX(mbcmd, param1, param2)\
>> +    FIELD_PREP(PCODE_MB_COMMAND, mbcmd)\
>> +    | FIELD_PREP(PCODE_MB_PARAM1, param1)\
>> +    | FIELD_PREP(PCODE_MB_PARAM2, param2)
> Should this be moved to pcode file?
Sure, will move this to pcode file.
>>   enum hwm_reg_name {
>>       pkg_rapl_limit,
>> @@ -31,9 +38,11 @@ enum hwm_reg_operation {
>>    * SF_* - scale factors for particular quantities according to hwmon 
>> spec.
>>    * - voltage  - millivolts
>>    * - power  - microwatts
>> + * - curr   - milliamperes
>>    */
>>   #define SF_VOLTAGE    1000
>>   #define SF_POWER    1000000
>> +#define SF_CURR        1000
>>   struct hwm_drvdata {
>>       struct xe_hwmon *hwmon;
>> @@ -246,13 +255,35 @@ static int hwm_power_rated_max_read(struct 
>> hwm_drvdata *ddat, long *value)
>>   static const struct hwmon_channel_info *hwm_info[] = {
>>       HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX),
>> +    HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | 
>> HWMON_P_CRIT),
> Remove duplicate line. HWMON_P_CRIT needs to be added above.
Sure

Regards,
Badal
> 
> Thanks
> Riana
>> +    HWMON_CHANNEL_INFO(curr, HWMON_C_CRIT),
>>       NULL
>>   };
>> +/* I1 is exposed as power_crit or as curr_crit depending on bit 31 */
>> +static int hwm_pcode_read_i1(struct xe_gt *gt, u32 *uval)
>> +{
>> +    /* Avoid ILLEGAL_SUBCOMMAND "mailbox access failed" warning in 
>> snb_pcode_read */
>> +    if (IS_DG2(gt_to_xe(gt)))
>> +        return -ENXIO;
>> +
>> +    return xe_pcode_read(gt, PCODE_MBOX(PCODE_POWER_SETUP,
>> +                 POWER_SETUP_SUBCOMMAND_READ_I1, 0),
>> +                 uval, 0);
>> +}
>> +
>> +static int hwm_pcode_write_i1(struct xe_gt *gt, u32 uval)
>> +{
>> +    return xe_pcode_write(gt, PCODE_MBOX(PCODE_POWER_SETUP,
>> +                  POWER_SETUP_SUBCOMMAND_WRITE_I1, 0),
>> +                  uval);
>> +}
>> +
>>   static umode_t
>>   hwm_power_is_visible(struct hwm_drvdata *ddat, u32 attr, int chan)
>>   {
>>       u32 reg_val;
>> +    u32 uval;
>>       switch (attr) {
>>       case hwmon_power_max:
>> @@ -261,6 +292,9 @@ hwm_power_is_visible(struct hwm_drvdata *ddat, u32 
>> attr, int chan)
>>       case hwmon_power_rated_max:
>>           return process_hwmon_reg(ddat, pkg_power_sku,
>>                        reg_read, &reg_val, 0, 0) ? 0 : 0444;
>> +    case hwmon_power_crit:
>> +        return (hwm_pcode_read_i1(ddat->gt, &uval) ||
>> +            !(uval & POWER_SETUP_I1_WATTS)) ? 0 : 0644;
>>       default:
>>           return 0;
>>       }
>> @@ -269,11 +303,23 @@ hwm_power_is_visible(struct hwm_drvdata *ddat, 
>> u32 attr, int chan)
>>   static int
>>   hwm_power_read(struct hwm_drvdata *ddat, u32 attr, int chan, long *val)
>>   {
>> +    int ret;
>> +    u32 uval;
>> +
>>       switch (attr) {
>>       case hwmon_power_max:
>>           return hwm_power_max_read(ddat, val);
>>       case hwmon_power_rated_max:
>>           return hwm_power_rated_max_read(ddat, val);
>> +    case hwmon_power_crit:
>> +        ret = hwm_pcode_read_i1(ddat->gt, &uval);
>> +        if (ret)
>> +            return ret;
>> +        if (!(uval & POWER_SETUP_I1_WATTS))
>> +            return -ENODEV;
>> +        *val = 
>> mul_u64_u32_shr(REG_FIELD_GET(POWER_SETUP_I1_DATA_MASK, uval),
>> +                       SF_POWER, POWER_SETUP_I1_SHIFT);
>> +        return 0;
>>       default:
>>           return -EOPNOTSUPP;
>>       }
>> @@ -282,9 +328,14 @@ hwm_power_read(struct hwm_drvdata *ddat, u32 
>> attr, int chan, long *val)
>>   static int
>>   hwm_power_write(struct hwm_drvdata *ddat, u32 attr, int chan, long val)
>>   {
>> +    u32 uval;
>> +
>>       switch (attr) {
>>       case hwmon_power_max:
>>           return hwm_power_max_write(ddat, val);
>> +    case hwmon_power_crit:
>> +        uval = DIV_ROUND_CLOSEST_ULL(val << POWER_SETUP_I1_SHIFT, 
>> SF_POWER);
>> +        return hwm_pcode_write_i1(ddat->gt, uval);
>>       default:
>>           return -EOPNOTSUPP;
>>       }
>> @@ -332,6 +383,55 @@ void xe_hwmon_power_max_restore(struct xe_device 
>> *xe, bool old)
>>       mutex_unlock(&hwmon->hwmon_lock);
>>   }
>> +static umode_t
>> +hwm_curr_is_visible(const struct hwm_drvdata *ddat, u32 attr)
>> +{
>> +    u32 uval;
>> +
>> +    switch (attr) {
>> +    case hwmon_curr_crit:
>> +        return (hwm_pcode_read_i1(ddat->gt, &uval) ||
>> +            (uval & POWER_SETUP_I1_WATTS)) ? 0 : 0644;
>> +    default:
>> +        return 0;
>> +    }
>> +}
>> +
>> +static int
>> +hwm_curr_read(struct hwm_drvdata *ddat, u32 attr, long *val)
>> +{
>> +    int ret;
>> +    u32 uval;
>> +
>> +    switch (attr) {
>> +    case hwmon_curr_crit:
>> +        ret = hwm_pcode_read_i1(ddat->gt, &uval);
>> +        if (ret)
>> +            return ret;
>> +        if (uval & POWER_SETUP_I1_WATTS)
>> +            return -ENODEV;
>> +        *val = 
>> mul_u64_u32_shr(REG_FIELD_GET(POWER_SETUP_I1_DATA_MASK, uval),
>> +                       SF_CURR, POWER_SETUP_I1_SHIFT);
>> +        return 0;
>> +    default:
>> +        return -EOPNOTSUPP;
>> +    }
>> +}
>> +
>> +static int
>> +hwm_curr_write(struct hwm_drvdata *ddat, u32 attr, long val)
>> +{
>> +    u32 uval;
>> +
>> +    switch (attr) {
>> +    case hwmon_curr_crit:
>> +        uval = DIV_ROUND_CLOSEST_ULL(val << POWER_SETUP_I1_SHIFT, 
>> SF_CURR);
>> +        return hwm_pcode_write_i1(ddat->gt, uval);
>> +    default:
>> +        return -EOPNOTSUPP;
>> +    }
>> +}
>> +
>>   static umode_t
>>   hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>>              u32 attr, int channel)
>> @@ -343,6 +443,8 @@ hwm_is_visible(const void *drvdata, enum 
>> hwmon_sensor_types type,
>>       case hwmon_power:
>>           ret = hwm_power_is_visible(ddat, attr, channel);
>>           break;
>> +    case hwmon_curr:
>> +        return hwm_curr_is_visible(ddat, attr);
>>       default:
>>           ret = 0;
>>       }
>> @@ -359,6 +461,8 @@ hwm_read(struct device *dev, enum 
>> hwmon_sensor_types type, u32 attr,
>>       switch (type) {
>>       case hwmon_power:
>>           return hwm_power_read(ddat, attr, channel, val);
>> +    case hwmon_curr:
>> +        return hwm_curr_read(ddat, attr, val);
>>       default:
>>           return -EOPNOTSUPP;
>>       }
>> @@ -373,6 +477,8 @@ hwm_write(struct device *dev, enum 
>> hwmon_sensor_types type, u32 attr,
>>       switch (type) {
>>       case hwmon_power:
>>           return hwm_power_write(ddat, attr, channel, val);
>> +    case hwmon_curr:
>> +        return hwm_curr_write(ddat, attr, val);
>>       default:
>>           return -EOPNOTSUPP;
>>       }
>> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h 
>> b/drivers/gpu/drm/xe/xe_pcode_api.h
>> index 837ff7c71280..5935cfe30204 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
>> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
>> @@ -35,6 +35,13 @@
>>   #define     DGFX_GET_INIT_STATUS    0x0
>>   #define     DGFX_INIT_STATUS_COMPLETE    0x1
>> +#define   PCODE_POWER_SETUP            0x7C
>> +#define     POWER_SETUP_SUBCOMMAND_READ_I1    0x4
>> +#define     POWER_SETUP_SUBCOMMAND_WRITE_I1    0x5
>> +#define        POWER_SETUP_I1_WATTS        REG_BIT(31)
>> +#define        POWER_SETUP_I1_SHIFT        6    /* 10.6 fixed point 
>> format */
>> +#define        POWER_SETUP_I1_DATA_MASK        REG_GENMASK(15, 0)
>> +
>>   struct pcode_err_decode {
>>       int errno;
>>       const char *str;

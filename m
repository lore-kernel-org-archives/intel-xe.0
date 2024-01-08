Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 874E3C3DA6E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jan 2024 13:55:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 518BC10E25D;
	Mon,  8 Jan 2024 13:55:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E5810E25D
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jan 2024 13:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704722131; x=1736258131;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1YRQ5StpX7Ajt4bM+XrOjlC3h6say4PochddQsnNr0c=;
 b=jImkMcd66nut75N7Kolw+hkvfAzkCN7qDrB0L6tUk7Fzr8WbSah56Y65
 z2PRRz+QBb4gDEzV6tVjlA1/mia0wEb+n7sMXFdwdSJgV2Ivqxe+RkFF6
 DExnMdWZ+/ABQY4B0lluAF+0AJW/dQMDXLapxknAxSa+QqD5/wxPca+3d
 6wBiqdJq1f1vERL/sqmeLXgil6NWaPS4rsQArPx+Xeh6QRLASp4uECLw/
 n5r5YGqmMhHSwn2Mhp2st5/J2oiqkuHRGlhb8SbXtNk8iFjw3FO7itaCn
 kqJaucwu5Q6q6K/GPhPGUhfm/gFu2IW5fDSAYt0oYA/eS44mTaHy0+RMF A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="395051393"
X-IronPort-AV: E=Sophos;i="6.04,341,1695711600"; d="scan'208";a="395051393"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2024 05:55:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="954637290"
X-IronPort-AV: E=Sophos;i="6.04,341,1695711600"; d="scan'208";a="954637290"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jan 2024 05:55:29 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 8 Jan 2024 05:55:28 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 8 Jan 2024 05:55:28 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 8 Jan 2024 05:55:28 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 8 Jan 2024 05:55:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oWLmoxVeo4ZojhO341cW2IdtzB8B3jER7zK84Ep/ICq3/GQlJiaREeqOeuGk2Jmkhg1lpLactXvlvCNVHjWthoyrUMMpEaezUtAYhDQUfTUzEVrWI5//02zCNeHOF3ZNYggFSuoGhFUmgfBgDE03tT9N5jKOolzHa7Z0G+nXP9S+KN5Jm99ijIOZQ08T1nAGEmvZ7XxLPWm39BrpDq0wetUA1Q5RcGu6COgNWEMFGhaFlmP3JzJ03CCCTo4/ijeP/KWPdjBNqmii+q1tg+Jczww65xYV4HJhE6IJwmlAEL+1L5TzxxOF+MFrgE+Xh7ucD8Crav4bUmoPDXFfT2z+wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YaIY1VvVBILpxdcqSk/b8TQChgfsAGpRhxV0SnTdkGQ=;
 b=lFSwlwLlCMWcz60u9gV0paM5sshMlzAuvQEE+/DBhIbU0jYXUSU32xMnjEOM9cNZcQDWAqgd6T2BovMbYR7/tbuVTOOGEeK5qevWJ+uls8tYIq0cciiGQsw6a85jII7Z7YCuhjlD275BRIf7qBboEJ/qLQsKq931+D8ohtqa/Xo2WTPt8SCPAaUcopEdIRailw8m+v8A6yZHSjZKdPZKIgDsgLEbdKYHZPW62xkg20ZKOPLf9Lpkk8znWdOJZtUENCkeKOeZSD2X/LWJ1Tqe2YIV8gVPjfmQR1/uDkH5Zka6qLrn9023PtfKiCwViKUAA3xRi60q0nZf/XAbFE12yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 PH7PR11MB6859.namprd11.prod.outlook.com (2603:10b6:510:1ef::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Mon, 8 Jan
 2024 13:55:24 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52%4]) with mapi id 15.20.7159.020; Mon, 8 Jan 2024
 13:55:24 +0000
Message-ID: <9b89d6a5-d28b-4696-aaf2-590af1b862a5@intel.com>
Date: Mon, 8 Jan 2024 19:25:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v8] drm/xe: Add vram frequency sysfs attributes
To: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20240105124503.1821966-1-sujaritha.sundaresan@intel.com>
 <4z4eujmhi3jjeoltbw6zd6s5w37h2bdkjftbrryoogzp3kzfls@vgccbpvu3sli>
Content-Language: en-US
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <4z4eujmhi3jjeoltbw6zd6s5w37h2bdkjftbrryoogzp3kzfls@vgccbpvu3sli>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0234.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::6) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|PH7PR11MB6859:EE_
X-MS-Office365-Filtering-Correlation-Id: 96074a7c-d01f-4111-6eed-08dc105175f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gI1bmereIAYWkrdZ0HjLVPtChOg4cwJtUhR2lVIQW6ioLLzfYvOQVSPQGHii3z4gSUjUgzfJ3hQsJYQGtYOJ2C+gjAAh909SiivkiZrYuivv2h0tY8rVCpEycRs5GtjPm4tu4aD8Yi1Tvf++3M9v9q7DF05bw9s6qFpxL7mxg9nFOlsBdYpA2DxraUFij/6wN8/M8OWDgPxQYWEaNNtuAkmcvp2Qn1WBEJh38akPy3RHPVL2uPupUmA7viNSARngVyXzC1NUHo2VY+/7l5xMJ0M+ubMmLBxFd9wCnrjmQTPCaBm7O2rumknDvhLPQFbolF3wrkskA7mTdwyJ22UvMXFRqTXcKz3iskEKSddobvB7Yi5l4SkYht25GQdFUhTGkOSXyl+5czbdKwZ+SVTjGuZtYrpkXQcXu+vV6ZW9l4A/6PI+1BPw2watOF2n7oyFeaqZ9PFs2xNqFcyvxgkuXE7X7ACpxXN7fqLt1sirJHH3SjDseUyqn3Zr9YhR7Dqbmhd0LRTdon6vjBKeS0S8cqJHpkE+gSdrroCSVHDrx6tO2i7QfxpHl4imcViXt/TOJWg5UZYND6PxBbi52faoYMETdO+hsRnY/9wzKLaAN/JhHCwpaZxesaHMJfN/BaWUAoNBzZk9FKW+sXhN5COvfw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(39860400002)(396003)(376002)(136003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(53546011)(26005)(2616005)(478600001)(6506007)(6666004)(6486002)(6512007)(2906002)(5660300002)(41300700001)(66476007)(66556008)(37006003)(66946007)(6636002)(316002)(4326008)(8676002)(8936002)(6862004)(38100700002)(36756003)(86362001)(31696002)(82960400001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tmo1ZlBwUTU4WnVDUVRRbGdZaDcwd0VpWGNCZzJJNnJxbFJXeEg4NytOUzhW?=
 =?utf-8?B?Y3lzeVFaQjQ1dHNCUEtjdmFpSElrcHpFOVFnUTdCRjdJOE01S3dYQUFQRjB1?=
 =?utf-8?B?bnNuNTBBaytDYXlkVVVudTFxMk5TVXQrZStyTFZMRGc0aXUvQnZFSlVZeGdK?=
 =?utf-8?B?cTR4bkZnUTArRmZOMTVWeFVmNXVJclF4Tlc1bGlNaGdIRDNYNXlha2JWSDR6?=
 =?utf-8?B?T2pSTE1mTjhUa2M1VjRyUjBMRDR6RDBmdW02dGg3ZVhVMTcxZnl1WmgvdWRU?=
 =?utf-8?B?R3BMMjdKNWM0WDVqQWdiNnhBenFoSEhvZ09NNStFUGc0c2IyZktidDh6TWhD?=
 =?utf-8?B?Vmd5allkTEZ6RVR2dFlDS2ZtV1dVVVlQaTZsT1N6R3FkOU1kbG1TcGo5YjhW?=
 =?utf-8?B?TjdxT1VkcFR5aWcrUDRhSjBvNnJkSGlsM1A1UXMrVmZwZXpEbGwyVkNVeC92?=
 =?utf-8?B?WWhOcTNCbjJ1dEN1YlV3YmxEMVhVT1FRbXNVT3lWcUo4RHpIaXQrT2ZqR0JU?=
 =?utf-8?B?dG1JSWEyTGducXNQd1UyRlIvanNjbHdxRjRPYnY0QVlDeXFoek5ocGdvSm1w?=
 =?utf-8?B?TlhHWlRYM1FDb1Y1NFEweld3eHVvSkFPMDBuYnNzalRNdEwzOU1md0lPdWhP?=
 =?utf-8?B?Q3ZmcTdnKzIrQlNXRFJIMzFkeE1kaXdNNzI5SDhkbm0zbmR0b04rQloyL3Rt?=
 =?utf-8?B?Z0RGUk50TEw3ODRRL3B4a1IzS3QrQ1VFeThIZEptSTZMZXdHdTZla0l5ZGg5?=
 =?utf-8?B?QUZTbDlYNVU0Zy9MUFp0QnZ1TjZwTEJ6b1dJMm1oWjZBMk43RjdPclhic1Zz?=
 =?utf-8?B?endQMzZhM0dYTWpVYVdRTVlXeGxlNnZ2K2lKckRKc2tBZU04TVRTN2JSL1lq?=
 =?utf-8?B?bWgzQ1dxT2ZVaGRTR1NQUmIrZHZWNlJ3RXJaNzRSeVNWenhDQnU4RGQyc2d1?=
 =?utf-8?B?MDNJVnFCME1BbzhlM0lueW5ib29NeXV2WkdvazF2VURFb0VLN2FCMTd6MEdY?=
 =?utf-8?B?dC9jcWZVMWFac0VFSHQ1aC94NXYvZlJISU1VaTgvRjNJbzNyMFk1d2JuS0ZM?=
 =?utf-8?B?anF3KzRtZUNMWnoyZmM5T2xQY1V2cnkyQjlzZ28yUW01c0c2MlBHSm9UNlB4?=
 =?utf-8?B?SkVHY2N0bGhwWDhsdjBEK2NsTVNPUWFyVjk5NmhLMXVqUTdKZ0FpQWpUSHIy?=
 =?utf-8?B?RjVNQlI0SmFWOGQ1Q2Q2TUVRMTFZZDZ1cjdnLzRaVWhRYmhKVnNJaktuUjNr?=
 =?utf-8?B?M0N6RmF6dFNnUnpkWXNqNUMzQVIzRGo4K2hLbGNzWUUwVFp0NFFncnhZUW51?=
 =?utf-8?B?RkFuWlRLNzJOUTZadzFmK2toMGlEa2xHZ0pSRVViNEJSV09tMkdycGtnVENx?=
 =?utf-8?B?TzdoTFl4YzdpRlNjdU5JVmRJT1dTdGV3YjFJUUEyU1FwWmVHN280QmYzU0Qv?=
 =?utf-8?B?Ui93eUdLUnBuRFVlbk1hQ0Fsck54anVLRzRMdmgvYUE1VE0yMjUyb0l5K3Z0?=
 =?utf-8?B?d2VTTWcrWEEyOTVSY1dGOEZyeUtIRm52OGFaYmxGWklnaStGb1QvSUoxRDV4?=
 =?utf-8?B?bE0rN0hteXJTLzNZNVFZcll4OXhUYVNVOXV2bERTazdJbkhXVzBZOW9jR2o0?=
 =?utf-8?B?cUkzUHVESGl6UXhWSHQxS2RsNVhQNUxmU24xTTJVSnhKSHA4NGIvU3Q3dnVy?=
 =?utf-8?B?Tjl1SlJ1eDAvS1dtL2N3U0U3bndnSW05OVhlVTJSaFI0ZXZjMnRYM25FTDYx?=
 =?utf-8?B?SkRmL3piQ0J5Sm1OYVVQM1NLMFF3YTRjSkk4elZWMW5oU0l2MjFDVGJ2clQy?=
 =?utf-8?B?NjRZbFBwSUI2MHBlbUgrbHY5RWVYSW5BNGNob0VtazJnUlhvOGUzRW9tU1cz?=
 =?utf-8?B?WkI5cWc0Wk5qWi9kVnkzaUFJUUs0M1MvalJxS2dmaFdMV3pqTFdKTDU1S09Q?=
 =?utf-8?B?MGxxZmh4MVh1ZjdLWDR5b0hXcC9wc0VaUmZWTWVjbVRuWUxQNWVPOHlPMC85?=
 =?utf-8?B?OGtuZGRCMGpDZk8xSUlaa0tRTGZacGRqK0VaWHRVWFZNMW12STJFV0VpTkNa?=
 =?utf-8?B?bzNydExqcGo1ZTBKaHdZRFpWMnQ5Rk56bitRWXdxRy96WGxuQTNRQnhQenNF?=
 =?utf-8?B?VTRmbHQ4UTlhRWl0Z1FqMlRLUVZCbUd6Mk5kZTB2R1dQc2VmQ0xncmVxenJI?=
 =?utf-8?B?TXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 96074a7c-d01f-4111-6eed-08dc105175f4
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2024 13:55:24.0999 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o6hDKKaFMXiO6D7HpzdEDzfv0zkyxu5/FL/meGgCjAsJNbfDqB9xc9mq4oRrC7vurKjjIvxu0MhSLaNk90iN0dGGxPdtdSG3/esuA5jaW24=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6859
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


On 1/8/2024 7:18 PM, Lucas De Marchi wrote:
> On Fri, Jan 05, 2024 at 06:15:03PM +0530, Sujaritha Sundaresan wrote:
>> Add vram frequency sysfs attributes under the below hierarchy;
>>
>> /device/tile#/memory/freq0
>>             |-max_freq
>>             |-min_freq
>>
>> v2: Drop "vram" from attribute names (Rodrigo)
>>
>> v3: Add documentation for new sysfs (Riana)
>>    Drop prefix from XEHP_PCODE_FREQUENCY_CONFIG (Riana)
>>
>> v4: Create sysfs under tile#/freq0 after removal of
>>    physical_memsize attrbute
>>
>> v5: Revert back to creating sysfs under tile#/memory/freq0
>>    Remove definition of GT_FREQUENCY_MULTIPLIER (Rodrigo)
>>
>> v6: Rename attributes to max/min_freq (Anshuman)
>>    Fix review comments (Rodrigo)
>>
>> v7: Make documentation more verbose
>>    Move sysfs to separate file (Anshuman)
>>
>> v8: Fix platform specific conditions and add kernel docwq (Anshuman)
>>    Fix typos and remove redundant headers (Riana)
>>
>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>> Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
>> ---
>> drivers/gpu/drm/xe/Makefile        |   1 +
>> drivers/gpu/drm/xe/xe_pcode_api.h  |   7 ++
>> drivers/gpu/drm/xe/xe_tile_sysfs.c |   3 +
>> drivers/gpu/drm/xe/xe_vram_freq.c  | 129 +++++++++++++++++++++++++++++
>> drivers/gpu/drm/xe/xe_vram_freq.h  |  13 +++
>> 5 files changed, 153 insertions(+)
>> create mode 100644 drivers/gpu/drm/xe/xe_vram_freq.c
>> create mode 100644 drivers/gpu/drm/xe/xe_vram_freq.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index df8601d6a59f..17884e422cec 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -139,6 +139,7 @@ xe-y += xe_bb.o \
>>     xe_uc_debugfs.o \
>>     xe_uc_fw.o \
>>     xe_vm.o \
>> +    xe_vram_freq.o \
>>     xe_wait_user_fence.o \
>>     xe_wa.o \
>>     xe_wopcm.o
>> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h 
>> b/drivers/gpu/drm/xe/xe_pcode_api.h
>> index 5935cfe30204..f153ce96f69a 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
>> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
>> @@ -42,6 +42,13 @@
>> #define        POWER_SETUP_I1_SHIFT        6    /* 10.6 fixed point 
>> format */
>> #define        POWER_SETUP_I1_DATA_MASK        REG_GENMASK(15, 0)
>>
>> +#define   PCODE_FREQUENCY_CONFIG        0x6e
>> +/* Frequency Config Sub Commands (param1) */
>> +#define     PCODE_MBOX_FC_SC_READ_FUSED_P0    0x0
>> +#define     PCODE_MBOX_FC_SC_READ_FUSED_PN    0x1
>> +/* Domain IDs (param2) */
>> +#define     PCODE_MBOX_DOMAIN_HBM        0x2
>> +
>> struct pcode_err_decode {
>>     int errno;
>>     const char *str;
>> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c 
>> b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>> index 0f8d3e7fce46..ed60d12f5cf0 100644
>> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>> @@ -9,6 +9,7 @@
>>
>> #include "xe_tile.h"
>> #include "xe_tile_sysfs.h"
>> +#include "xe_vram_freq.h"
>>
>> static void xe_tile_sysfs_kobj_release(struct kobject *kobj)
>> {
>> @@ -50,6 +51,8 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>>
>>     tile->sysfs = &kt->base;
>>
>> +    xe_vram_freq_init(tile);
>> +
>
> this breaks the current abstraction we have in xe. xe_tile_sysfs_init()
> should not initialize random components and only care about **sysfs**.
> Currently xe_vram_freq_init() is only about sysfs, so it should follow
> what gtidle did, with the sysfs name in it.
>
> If this is going to be extend later to be something more than sysfs
> only, then instead of renaming this should be moved elsewhere.
>
> Lucas De Marchi

Hi Lucas,

Sure, I will keep with the abstraction and rename the function as 
xe_vram_freq_sysfs_init() (if that fixes it).

Thanks,

Suja

>
>
>
>>     err = drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, tile);
>>     if (err)
>>         drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: 
>> %d\n",
>> diff --git a/drivers/gpu/drm/xe/xe_vram_freq.c 
>> b/drivers/gpu/drm/xe/xe_vram_freq.c
>> new file mode 100644
>> index 000000000000..ea8b4511767c
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_vram_freq.c
>> @@ -0,0 +1,129 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2024 Intel Corporation
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
>> + * device/tile#/memory/freq0/max_freq - This is maximum frequency. 
>> This value is read-only as it
>> + *                    is the fixed fuse point P0. It is not the system
>> + *                    configuration.
>> + * device/tile#/memory/freq0/min_freq - This is minimum frequency. 
>> This value is read-only as it
>> + *                    is the fixed fuse point PN. It is not the system
>> + *                    configuration.
>> + */
>> +
>> +static struct xe_tile *dev_to_tile(struct device *dev)
>> +{
>> +    return kobj_to_tile(dev->kobj.parent);
>> +}
>> +
>> +static ssize_t max_freq_show(struct device *dev, struct 
>> device_attribute *attr,
>> +                 char *buf)
>> +{
>> +    struct xe_tile *tile = dev_to_tile(dev);
>> +    struct xe_gt *gt = tile->primary_gt;
>> +    u32 val, mbox;
>> +    int err;
>> +
>> +    mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, PCODE_FREQUENCY_CONFIG)
>> +        | REG_FIELD_PREP(PCODE_MB_PARAM1, 
>> PCODE_MBOX_FC_SC_READ_FUSED_P0)
>> +        | REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_HBM);
>> +
>> +    err = xe_pcode_read(gt, mbox, &val, NULL);
>> +    if (err)
>> +        return err;
>> +
>> +    /* data_out - Fused P0 for domain ID in units of 50 MHz */
>> +    val *= 50;
>> +
>> +    return sysfs_emit(buf, "%u\n", val);
>> +}
>> +static DEVICE_ATTR_RO(max_freq);
>> +
>> +static ssize_t min_freq_show(struct device *dev, struct 
>> device_attribute *attr,
>> +                 char *buf)
>> +{
>> +    struct xe_tile *tile = dev_to_tile(dev);
>> +    struct xe_gt *gt = tile->primary_gt;
>> +    u32 val, mbox;
>> +    int err;
>> +
>> +    mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, PCODE_FREQUENCY_CONFIG)
>> +        | REG_FIELD_PREP(PCODE_MB_PARAM1, 
>> PCODE_MBOX_FC_SC_READ_FUSED_PN)
>> +        | REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_HBM);
>> +
>> +    err = xe_pcode_read(gt, mbox, &val, NULL);
>> +    if (err)
>> +        return err;
>> +
>> +    /* data_out - Fused Pn for domain ID in units of 50 MHz */
>> +    val *= 50;
>> +
>> +    return sysfs_emit(buf, "%u\n", val);
>> +}
>> +static DEVICE_ATTR_RO(min_freq);
>> +
>> +static struct attribute *freq_attrs[] = {
>> +    &dev_attr_max_freq.attr,
>> +    &dev_attr_min_freq.attr,
>> +    NULL
>> +};
>> +
>> +static const struct attribute_group freq_group_attrs = {
>> +    .name = "freq0",
>> +    .attrs = freq_attrs,
>> +};
>> +
>> +static void vram_freq_fini(struct drm_device *drm, void *arg)
>> +{
>> +    struct kobject *kobj = arg;
>> +
>> +    sysfs_remove_group(kobj, &freq_group_attrs);
>> +    kobject_put(kobj);
>> +}
>> +
>> +/*
>> + * xe_vram_freq_init - Initialize vram frequency component
>> + * @tile: Xe Tile object
>> + *
>> + * It needs to be initialized after the main tile component is ready
>> + */
>> +
>> +void xe_vram_freq_init(struct xe_tile *tile)
>> +{
>> +    struct xe_device *xe = tile_to_xe(tile);
>> +    struct kobject *kobj;
>> +    int err;
>> +
>> +    if (xe->info.platform != XE_PVC)
>> +        return;
>> +
>> +    kobj = kobject_create_and_add("memory", tile->sysfs);
>> +    if (!kobj)
>> +        drm_warn(&xe->drm, "failed to add memory directory, err: 
>> %d\n", -ENOMEM);
>> +
>> +    err = sysfs_create_group(kobj, &freq_group_attrs);
>> +    if (err) {
>> +        kobject_put(kobj);
>> +        drm_warn(&xe->drm, "failed to register vram freq sysfs, err: 
>> %d\n", err);
>> +        return;
>> +    }
>> +
>> +    err = drmm_add_action_or_reset(&xe->drm, vram_freq_fini, kobj);
>> +    if (err)
>> +        drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, 
>> err: %d\n",
>> +             __func__, err);
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_vram_freq.h 
>> b/drivers/gpu/drm/xe/xe_vram_freq.h
>> new file mode 100644
>> index 000000000000..ae3ed6ce68f8
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_vram_freq.h
>> @@ -0,0 +1,13 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_VRAM_FREQ_H_
>> +#define _XE_VRAM_FREQ_H_
>> +
>> +struct xe_tile;
>> +
>> +void xe_vram_freq_init(struct xe_tile *tile);
>> +
>> +#endif /* _XE_VRAM_FREQ_H_ */
>> -- 
>> 2.25.1
>>

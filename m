Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86470C47258
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jan 2024 22:23:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D47C10E876;
	Wed, 17 Jan 2024 22:23:06 +0000 (UTC)
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Wed, 17 Jan 2024 22:23:04 UTC
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1220010E876
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jan 2024 22:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705530185; x=1737066185;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=1qBtEeNLVgSBnjG4y0yfE68leisGlhxMD/x15CJC8jg=;
 b=JoAPxocY3XwhmkYujeIRIEuU9LOK2xSOhfAmgYxFLVg6+0bTZklTUbg0
 INjuz4AZvpD8dx6sJCcTieyrRBHVR2VKwdUfgGTvvYvdZlKJB4k1y8I9L
 ruJvFprp7bc8ddp38obUWteE/pwleSfWS13whox5Sp4dbud2lyMFALXIt
 ByOq5cfVC32re8NlnVXczpvIxcdDkLUwEVRJrcd8+eKJ1pSzu2lEDbOQN
 /P1vakXwinIVrKD/+fWLzlKwJBgEiKQHdjg9NKt1isevnj8jqsZGGGW7v
 IkJjFIzyjlE+SMCEU+jDt0VoHf+wAKV8+QD4oTu7CMSigL9pXfA8RD9H1 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="193339"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="193339"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 14:15:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="907864769"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="907864769"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jan 2024 14:15:57 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Jan 2024 14:15:56 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Jan 2024 14:15:56 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Jan 2024 14:15:56 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Jan 2024 14:15:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fAkhoD5T2Z/yBzyDeEwz46wU0folYHE9zww2LQa1fTcBexnHZ32IizucM+ICsOCr/OOFuQHz7vIahFRUo/tMRb2nQeOC0GDgekjaZY35vNOpakYA4Zgco19u4bOulh/1pk3j6ixHikOOC+V6h2zwoxRCvWxDT0mmlC2BbwPLqqdsrXBZC9kiY1qk1uxStQtyZ36Gl/0QCmYf5SUAccrASxuPZqW+0J+FZOQrBpGJ4nS+G2o+i/acN2vyedx5HcBPxDs53n2OGkSnvWlLgi68eMfamHXm9D23JkdoBGfO219uphpjAEMOJcuG+rrZdL4ThH47qmFBNN+b+tkUZMvVZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TMWLxY6Z3fLJmgKuQ/N3B39124IV9fJmr1FmVeuwjR8=;
 b=iH16M8louht2c2k2nT2Z29QzCKAorstEpiKBG5vJWQzmeCJzHQ3gDF9zVvF8dmjf7HURWHYd1U4p0s6mnOIdUorgWxE/fauhMbnUMYoQmP6ZO1ycBbgl+yl+vd9r5kPsy1nnD29IXnx7gwvQJWxYKDBQlp9do2rOamLOWzniJBtw0XXxYuBzGitzfDxdF/4+CQdrMWj7Stl+evhu3rl610v5sFNpo99s9OQRzpITFtuuix3fz35sN8NZY9JXHjXsmlyDeYEtUfkJMDzzkFbpja8xlFsZXiIRYzJbDKDmayElbmiJ2kfs5D0aZwA9rRfNR0IUht4uq4U5BfNKenFRbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by CH0PR11MB8142.namprd11.prod.outlook.com (2603:10b6:610:18c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.27; Wed, 17 Jan
 2024 22:15:52 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::fe65:e38b:8d7a:355d]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::fe65:e38b:8d7a:355d%6]) with mapi id 15.20.7181.018; Wed, 17 Jan 2024
 22:15:52 +0000
Message-ID: <131cf662-3c29-4478-ab81-00609815c42e@intel.com>
Date: Wed, 17 Jan 2024 17:15:50 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/guc: Add register defines for GuC based
 register capture
To: Jani Nikula <jani.nikula@linux.intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240116231600.154097-1-zhanjun.dong@intel.com>
 <20240116231600.154097-2-zhanjun.dong@intel.com> <87ply0qsg0.fsf@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <87ply0qsg0.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0283.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::18) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|CH0PR11MB8142:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f277fd6-4929-4099-b18b-08dc17a9de41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ODUhOw3yqR+tFNTu5nlMuacFe7Kjo5h9SZFNs5OoxVkkFCnR3P2mA3hUpmU0AOY6x582XH/fd3e/wjT7e6oL5Zwkjj5k9uDokS6F7WDyGTGWa0xZjpr2j88VVb+CbWHqp1h2L/kYXzqqDUyrIsmRxUSo65r2PqnnpxRH0KXklXHgxx+cHS81zblOrG5noVqIEdqxy7WIwHfWCOWEvpXzIny8klSC0AsPqMiICyGkAuS2PDCytsgJ80qE4i2wjXWWN7PvG+kxtBP3xnH4wGfuxaR2ZClvjLldZc4IwDL8dBCq6+GFFSTo5X0t3xyClw3vmREjd+KXJpGFW6fLKWu8rLaxKj3IvyjeMDXzOFmPq/FmOgLF6v99xJhSWARO74zwe18z0QcDy8oh1+5L7nvYV9dAkkOSlE/IZwjAqbkwOeLiLzGdOPCLfLrfnK4rdGj2O0+0XELcBdGaWSv/quHa9FywiYZaTqhEf9qrCvW7Tdvv9EnVztF0/+eZct/1Y7C1Zdotg+m5131af7THSRkUKz2ZnAmfZsTdR1ndA2y565MAMiG8HePo7WoFrC9MtGwulHW8U9kMz2NCug9iGOMdJ7krhLV58W88Z5E/Zz2v/dB5kwPjQGEdUrpYo9ifyI5pwLF+goYBHnAKWGP7Yn6k0A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(366004)(136003)(39860400002)(346002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(38100700002)(6506007)(26005)(6512007)(2616005)(5660300002)(53546011)(83380400001)(30864003)(6486002)(2906002)(316002)(66476007)(478600001)(66556008)(66946007)(41300700001)(8936002)(31696002)(82960400001)(36756003)(86362001)(8676002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MndwZmE4TUk2YTZWMnFBVlhNQzJHL2Q3UHdZbWkvVWE1c01TNmRFLzkrUnBN?=
 =?utf-8?B?VENpMVV4a3N4a0hNU3h5SnYvOHFGNjVSQ3dwYWROSm9MK2hZZXNDZXJJeTRJ?=
 =?utf-8?B?eGpaVVRFbitEbm1Vck5RcXdkVEZuK3E0WWt4bkNHR2pNUDBxNkh1NnV6ZVZv?=
 =?utf-8?B?RVlCd2VMUnV6MlIyK0I0WENpL3hrNzJkaXBTYTVWSVdhNlZGaVJkMzYxb1No?=
 =?utf-8?B?azFjcFQvcFphVmdKMnh2ODFJTElkRmNnYTliMEpkTGcxWjJHU0p4b1U3MUdR?=
 =?utf-8?B?QnVoTjVSMmJFNTkxQnVnUi95Z0lHQlJZRE9tWUpubjhKZTVMdFNjc0hWc3Bs?=
 =?utf-8?B?eFd2UVNRR1BUK3NxbEdGeE4xcU5HOUU5MmViaGpMRjhSdW9aVWhRSFFUbnpV?=
 =?utf-8?B?blA1OG40bFJ4bE5DV0hFbVhyUnRRU1V6TjhZTU1HdGJkUnh0U3RIenFjYlBo?=
 =?utf-8?B?TjdCbitCSmM4TmlTVjBvaDdIMVljZXFnT2FjUlRnWElubXUvZjBON3BkR0tB?=
 =?utf-8?B?RHhkSmJMbG9nenJhZlBKcklnNzlGbGtpanpvbnVRbWhVREN2L2tXenFaSDlR?=
 =?utf-8?B?R2JCbWQzUFF5dXZGSVhvTkt2bzFzK0VKUXVORVQ3ODBzUWlRRy84Q2RSQ05C?=
 =?utf-8?B?aHBJcVVlVDhLVzZBTHZlZDdqeXZkeWY2T1lWVW9oSUtBU3AvblIwa3JwOTl1?=
 =?utf-8?B?bWpvUjZhSHpSQTJnL256VzVxc0UwYkVSMHAyQjJqSWxzR0h6TnpySkZEcTVV?=
 =?utf-8?B?N2QyVmRGT0tNL200cjdYUFRJUVg3K2tvQ2lnOWo2R1dmQ3pVM3htMUpWT0ht?=
 =?utf-8?B?Q2JuMzRIczhlUnlpR1k3Wk1TM1pKSnVtRlRTWVBNU3lnZHprdGJLaldKWE1K?=
 =?utf-8?B?SVdWSXdWczFxSm9wbGRZUHY4Z3hTaTNOVG9sM0xGL3dXM05iYi9VQ1lGbHE1?=
 =?utf-8?B?bUZ2YmhKUzRnMEFQS29mZkk0S0tMcWRvRUtRbWxzZ2tmc1B2dldnYmkwaTBn?=
 =?utf-8?B?NkhjVW5WWlNHN1BYL2VIOFR2WCtlbEtpc1lZS2hhaDJub0VWOFRYZGR2YXQr?=
 =?utf-8?B?ZWgwTHdzVGZVbDZpeUIxZVFsbU0zVEVGTkdEQXhyWXJLZXZEQVVFVm1qNU1P?=
 =?utf-8?B?d2ZkbGlKYUkyYmE4dzFwQUZ6UXZ5bU54VzBBSUVGWTRRVXZXaVVtRUgrZlZF?=
 =?utf-8?B?TXc1Nnl5SDlWQWF2SW1OVlNEQ2QwYnVzQlloalk1U1l4RVRhdEdIYTdHcHBr?=
 =?utf-8?B?R3kwUndJeHFDZ21uaEtJcW55bytMbmozNTNuWXdNM0xUSnowTlZQdUorVERj?=
 =?utf-8?B?MkVScVY3bXZWZ2tUc1RJaFFPTFNISUpITzdUS01HTWlJaDVtY0g2N0JIRHdS?=
 =?utf-8?B?N1BzM0RMTzdZWm0rNUg1Q0xpcnpjLzRKQ296WUNWUjdTcExEUWNJbEJTSFdY?=
 =?utf-8?B?UUdVTlJXSTNVUW9aWWk1TFJ4aFN1WFF3N3hHVUw1bnovSjZQZkJJTHUyWTRs?=
 =?utf-8?B?RVJiT0hYMU5ZeDZrWTF1ZE1KMkl6cTV4dUFpNHpDZENnUzhGMitiT25rdURH?=
 =?utf-8?B?d0c3a3hNWElFRGxSd0tsUmxKei9QUWtrQ01PYnRPcDFmU0p4cHJKdS9zOUxy?=
 =?utf-8?B?ZnlvOHJocWVZUlM2anhWTExianFaeEVWRVQySkpiUi8rMnBKOEgzdXdITDBR?=
 =?utf-8?B?cEJ2SXJxMS9pcGNDUGxKdFA2L1RhSlBCNS9pSWdDcFl4T08wN0xWMG5tcTVB?=
 =?utf-8?B?ci94QXhmM0NwemFjYmlhbGJTRjFIQ2dHUHoxdXhEb0lRbXE5N3RaRHg3YUJK?=
 =?utf-8?B?ZWJRWi9pQUkrOExZMTZwM3NoeWFqNEtqNitoeDdNMFJGWnRwOFhmUjA1MkNR?=
 =?utf-8?B?eWZxbEd0b3F1S25COWZtVXZLYW5NblhWUlRPdnd5WXlMSDR2UnZuTWowNWFG?=
 =?utf-8?B?NFFDTlVqZ2l2VkM4TWtzT09QQUR3VDlQM2VHYnphMG1mNE12NHQxZFI1blFw?=
 =?utf-8?B?c2JRb0h1czBkWWJhMU5UcHdGL0YzbjV3c3Q0TVg2QTBpa29QTTlFWlIvVGVE?=
 =?utf-8?B?Z003dGlVWGxhZ1AvL3piT2F1aXdOMGI2OGlaM1hVN05PTnUrRlB3d2RxU0pj?=
 =?utf-8?Q?lj4A4wwZSITS1dFoJcPNjwlJp?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f277fd6-4929-4099-b18b-08dc17a9de41
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2024 22:15:52.7224 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f6sydrb7DGVI3KBT3rfwUBnzPWrJox89rvu0X/iHUOI9LehJCbyxr6iuaRaJClAeHhzf5sQWePeDkKQ/z9Ao9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8142
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

Thanks Jani, I will update it as suggested.

Regards,
Zhanjun

On 2024-01-17 3:23 a.m., Jani Nikula wrote:
> On Tue, 16 Jan 2024, Zhanjun Dong <zhanjun.dong@intel.com> wrote:
>> Add registers defines and list of registers for GuC based error state capture.
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Kconfig               |  11 +++
>>   drivers/gpu/drm/xe/Makefile              |   1 +
>>   drivers/gpu/drm/xe/regs/xe_engine_regs.h |  12 +++
>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h     |  20 +++++
>>   drivers/gpu/drm/xe/xe_guc.c              |   7 ++
>>   drivers/gpu/drm/xe/xe_guc_capture.c      | 101 +++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_capture.h      |  19 +++++
>>   7 files changed, 171 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_guc_capture.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_guc_capture.h
>>
>> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
>> index 1b57ae38210d..236763569877 100644
>> --- a/drivers/gpu/drm/xe/Kconfig
>> +++ b/drivers/gpu/drm/xe/Kconfig
>> @@ -83,6 +83,17 @@ config DRM_XE_FORCE_PROBE
>>   
>>   	  Use "!*" to block the probe of the driver for all known devices.
>>   
>> +config DRM_XE_CAPTURE_ERROR
>> +	bool "Enable capturing GPU state following a hang"
>> +	depends on DRM_XE
>> +	default y
>> +	help
>> +	  This option enables capturing the GPU state when a hang is detected.
>> +	  This information is vital for triaging hangs and assists in debugging.
>> +	  Please report any hang to your Intel representative to help with triaging.
>> +
>> +	  If in doubt, say "Y".
>> +
>>   menu "drm/Xe Debugging"
>>   depends on DRM_XE
>>   depends on EXPERT
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index e16b84f79ddf..4cba24ff55e2 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -91,6 +91,7 @@ xe-y += xe_bb.o \
>>   	xe_gt_topology.o \
>>   	xe_guc.o \
>>   	xe_guc_ads.o \
>> +	xe_guc_capture.o \
>>   	xe_guc_ct.o \
>>   	xe_guc_db_mgr.o \
>>   	xe_guc_debugfs.o \
>> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> index 0b1266c88a6a..06015703a33e 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> @@ -64,10 +64,16 @@
>>   
>>   #define RING_ACTHD_UDW(base)			XE_REG((base) + 0x5c)
>>   #define RING_DMA_FADD_UDW(base)			XE_REG((base) + 0x60)
>> +#define RING_IPEIR(base)			XE_REG((base) + 0x64)
>>   #define RING_IPEHR(base)			XE_REG((base) + 0x68)
>> +#define RING_INSTDONE(base)			XE_REG((base) + 0x6c)
>> +#define RING_INSTPS(base)			XE_REG((base) + 0x70)
>> +
>>   #define RING_ACTHD(base)			XE_REG((base) + 0x74)
>>   #define RING_DMA_FADD(base)			XE_REG((base) + 0x78)
>>   #define RING_HWS_PGA(base)			XE_REG((base) + 0x80)
>> +#define IPEIR(base)				XE_REG((base) + 0x88)
>> +
>>   #define RING_HWSTAM(base)			XE_REG((base) + 0x98)
>>   #define RING_MI_MODE(base)			XE_REG((base) + 0x9c)
>>   #define RING_NOPID(base)			XE_REG((base) + 0x94)
>> @@ -111,9 +117,12 @@
>>   #define   FF_DOP_CLOCK_GATE_DISABLE		REG_BIT(1)
>>   #define   REPLAY_MODE_GRANULARITY		REG_BIT(0)
>>   
>> +#define RING_BBSTATE(base)			XE_REG((base) + 0x110)
>>   #define RING_BBADDR(base)			XE_REG((base) + 0x140)
>>   #define RING_BBADDR_UDW(base)			XE_REG((base) + 0x168)
>>   
>> +#define CCID(base)				XE_REG((base) + 0x180)
>> +
>>   #define BCS_SWCTRL(base)			XE_REG((base) + 0x200, XE_REG_OPTION_MASKED)
>>   #define   BCS_SWCTRL_DISABLE_256B		REG_BIT(2)
>>   
>> @@ -129,6 +138,9 @@
>>   #define	  CTX_CTRL_INHIBIT_SYN_CTX_SWITCH	REG_BIT(3)
>>   #define	  CTX_CTRL_ENGINE_CTX_RESTORE_INHIBIT	REG_BIT(0)
>>   
>> +#define RING_PDP_UDW(base, n)		XE_REG((base) + 0x270 + (n) * 8 + 4)
>> +#define RING_PDP_LDW(base, n)		XE_REG((base) + 0x270 + (n) * 8)
>> +
>>   #define RING_MODE(base)				XE_REG((base) + 0x29c)
>>   #define   GFX_DISABLE_LEGACY_MODE		REG_BIT(3)
>>   
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index 4017319c6300..d68a8b447842 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -67,6 +67,8 @@
>>   #define VE1_AUX_INV				XE_REG(0x42b8)
>>   #define   AUX_INV				REG_BIT(0)
>>   
>> +#define AUX_ERR_DBG				XE_REG(0x43f4)
>> +
>>   #define XEHP_TILE_ADDR_RANGE(_idx)		XE_REG_MCR(0x4900 + (_idx) * 4)
>>   #define XEHP_FLAT_CCS_BASE_ADDR			XE_REG_MCR(0x4910)
>>   
>> @@ -94,6 +96,8 @@
>>   #define   FF_MODE2_TDS_TIMER_MASK		REG_GENMASK(23, 16)
>>   #define   FF_MODE2_TDS_TIMER_128		REG_FIELD_PREP(FF_MODE2_TDS_TIMER_MASK, 4)
>>   
>> +#define XEHPG_INSTDONE_GEOM_SVG			XE_REG_MCR(0x666c)
>> +
>>   #define CACHE_MODE_1				XE_REG(0x7004, XE_REG_OPTION_MASKED)
>>   #define   MSAA_OPTIMIZATION_REDUC_DISABLE	REG_BIT(11)
>>   
>> @@ -110,6 +114,10 @@
>>   #define   FLSH_IGNORES_PSD			REG_BIT(10)
>>   #define   FD_END_COLLECT			REG_BIT(5)
>>   
>> +#define SC_INSTDONE				XE_REG(0x7100)
>> +#define SC_INSTDONE_EXTRA			XE_REG(0x7104)
>> +#define SC_INSTDONE_EXTRA2			XE_REG(0x7108)
>> +
>>   #define COMMON_SLICE_CHICKEN4			XE_REG(0x7300, XE_REG_OPTION_MASKED)
>>   #define   DISABLE_TDC_LOAD_BALANCING_CALC	REG_BIT(6)
>>   
>> @@ -299,6 +307,11 @@
>>   
>>   #define XE2LPM_L3SQCREG5			XE_REG_MCR(0xb658)
>>   
>> +#define FAULT_TLB_DATA0				XE_REG(0xceb8)
>> +#define FAULT_TLB_DATA1				XE_REG(0xcebc)
>> +
>> +#define RING_FAULT_REG				XE_REG(0xcec4)
>> +
>>   #define XEHP_MERT_MOD_CTRL			XE_REG_MCR(0xcf28)
>>   #define RENDER_MOD_CTRL				XE_REG_MCR(0xcf2c)
>>   #define COMP_MOD_CTRL				XE_REG_MCR(0xcf30)
>> @@ -317,6 +330,11 @@
>>   #define   INVALIDATION_BROADCAST_MODE_DIS	REG_BIT(12)
>>   #define   GLOBAL_INVALIDATION_MODE		REG_BIT(2)
>>   
>> +#define GAM_DONE				XE_REG(0xcf68)
>> +
>> +#define SAMPLER_INSTDONE			XE_REG_MCR(0xe160)
>> +#define ROW_INSTDONE				XE_REG_MCR(0xe164)
>> +
>>   #define HALF_SLICE_CHICKEN5			XE_REG_MCR(0xe188, XE_REG_OPTION_MASKED)
>>   #define   DISABLE_SAMPLE_G_PERFORMANCE		REG_BIT(0)
>>   
>> @@ -482,6 +500,8 @@
>>   #define   GT_CS_MASTER_ERROR_INTERRUPT		REG_BIT(3)
>>   #define   GT_RENDER_USER_INTERRUPT		REG_BIT(0)
>>   
>> +#define SFC_DONE(n)				XE_REG(0x1cc000 + (n) * 0x1000)
>> +
>>   #define PVC_GT0_PACKAGE_ENERGY_STATUS		XE_REG(0x281004)
>>   #define PVC_GT0_PACKAGE_RAPL_LIMIT		XE_REG(0x281008)
>>   #define PVC_GT0_PACKAGE_POWER_SKU_UNIT		XE_REG(0x281068)
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index 235d27b17ff9..4f9257075905 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -17,6 +17,7 @@
>>   #include "xe_force_wake.h"
>>   #include "xe_gt.h"
>>   #include "xe_guc_ads.h"
>> +#include "xe_guc_capture.h"
>>   #include "xe_guc_ct.h"
>>   #include "xe_guc_hwconfig.h"
>>   #include "xe_guc_log.h"
>> @@ -277,6 +278,12 @@ int xe_guc_init(struct xe_guc *guc)
>>   	if (ret)
>>   		goto out;
>>   
>> +#if IS_ENABLED(CONFIG_DRM_XE_CAPTURE_ERROR)
>> +	ret = xe_guc_capture_init(guc);
>> +	if (ret)
>> +		goto out;
>> +#endif
> 
> No. Please make xe_guc_capture_init() a static inline no-op stub in the
> header for CONFIG_DRM_XE_CAPTURE_ERROR=n. Examples of this are literally
> everywhere in kernel. Do not add conditional compilation in code.
> 
>> +
>>   	ret = xe_guc_ads_init(&guc->ads);
>>   	if (ret)
>>   		goto out;
>> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
>> new file mode 100644
>> index 000000000000..0870bfd1b88d
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
>> @@ -0,0 +1,101 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2021-2022 Intel Corporation
> 
> It's 2024.
> 
>> + */
>> +
>> +#include <linux/types.h>
>> +
>> +#include <drm/drm_print.h>
>> +
>> +#include "abi/guc_actions_abi.h"
>> +#include "regs/xe_regs.h"
>> +#include "regs/xe_engine_regs.h"
>> +#include "regs/xe_gt_regs.h"
>> +#include "regs/xe_guc_regs.h"
>> +
>> +#include "xe_bo.h"
>> +#include "xe_device.h"
>> +#include "xe_exec_queue_types.h"
>> +#include "xe_hw_engine_types.h"
>> +#include "xe_gt.h"
>> +#include "xe_gt_printk.h"
>> +#include "xe_guc.h"
>> +#include "xe_guc_capture.h"
>> +#include "xe_guc_ct.h"
>> +
>> +#include "xe_guc_log.h"
>> +#include "xe_gt_mcr.h"
>> +#include "xe_guc_submit.h"
>> +#include "xe_macros.h"
>> +#include "xe_map.h"
> 
> Superfluous newlines, not sorted.
> 
>> +
>> +#if IS_ENABLED(CONFIG_DRM_XE_CAPTURE_ERROR)
> 
> Please make the build of the entire file conditional in Makefile
> instead.
> 
>> +
>> +/*
>> + * Define all device tables of GuC error capture register lists
>> + * NOTE: For engine-registers, GuC only needs the register offsets
>> + *       from the engine-mmio-base
>> + */
>> +#define COMMON_XELP_BASE_GLOBAL \
>> +	{ FORCEWAKE_GT,		    0,      0, "FORCEWAKE" }, \
>> +	{ FAULT_TLB_DATA0,	    0,      0, "FAULT_TLB_DATA0" }, \
>> +	{ FAULT_TLB_DATA1,	    0,      0, "FAULT_TLB_DATA1" }, \
>> +	{ AUX_ERR_DBG,		    0,      0, "AUX_ERR_DBG" }, \
>> +	{ GAM_DONE,		    0,      0, "GAM_DONE" }, \
>> +	{ RING_FAULT_REG,	    0,      0, "FAULT_REG" }
>> +
>> +#define COMMON_BASE_ENGINE_INSTANCE \
>> +	{ RING_PSMI_CTL(0),         0,      0, "RC PSMI" }, \
>> +	{ RING_ESR(0),              0,      0, "ESR" }, \
>> +	{ RING_EMR(0),              0,      0, "EMR" }, \
>> +	{ RING_EIR(0),              0,      0, "EIR" }, \
>> +	{ RING_EXECLIST_STATUS_HI(0), 0,    0, "RING_EXECLIST_STATUS_HI" }, \
>> +	{ RING_EXECLIST_STATUS_LO(0), 0,    0, "RING_EXECLIST_STATUS_LO" }, \
>> +	{ RING_DMA_FADD(0),         0,      0, "RING_DMA_FADD_LDW" }, \
>> +	{ RING_DMA_FADD_UDW(0),     0,      0, "RING_DMA_FADD_UDW" }, \
>> +	{ RING_IPEIR(0),            0,      0, "IPEIR" }, \
>> +	{ RING_IPEHR(0),            0,      0, "IPEHR" }, \
>> +	{ RING_INSTPS(0),           0,      0, "INSTPS" }, \
>> +	{ RING_BBADDR(0),           0,      0, "RING_BBADDR_LOW32" }, \
>> +	{ RING_BBADDR_UDW(0),       0,      0, "RING_BBADDR_UP32" }, \
>> +	{ RING_BBSTATE(0),          0,      0, "BB_STATE" }, \
>> +	{ CCID(0),                  0,      0, "CCID" }, \
>> +	{ RING_ACTHD(0),            0,      0, "ACTHD_LDW" }, \
>> +	{ RING_ACTHD_UDW(0),        0,      0, "ACTHD_UDW" }, \
>> +	{ INSTPM(0),                0,      0, "INSTPM" }, \
>> +	{ RING_INSTDONE(0),         0,      0, "INSTDONE" }, \
>> +	{ RING_NOPID(0),            0,      0, "RING_NOPID" }, \
>> +	{ RING_START(0),            0,      0, "START" }, \
>> +	{ RING_HEAD(0),             0,      0, "HEAD" }, \
>> +	{ RING_TAIL(0),             0,      0, "TAIL" }, \
>> +	{ RING_CTL(0),              0,      0, "CTL" }, \
>> +	{ RING_MI_MODE(0),          0,      0, "MODE" }, \
>> +	{ RING_CONTEXT_CONTROL(0),  0,      0, "RING_CONTEXT_CONTROL" }, \
>> +	{ RING_HWS_PGA(0),          0,      0, "HWS" }, \
>> +	{ RING_MODE(0),             0,      0, "GFX_MODE" }, \
>> +	{ RING_PDP_LDW(0, 0),	    0,      0, "PDP0_LDW" }, \
>> +	{ RING_PDP_UDW(0, 0),	    0,      0, "PDP0_UDW" }, \
>> +	{ RING_PDP_LDW(0, 1),	    0,      0, "PDP1_LDW" }, \
>> +	{ RING_PDP_UDW(0, 1),	    0,      0, "PDP1_UDW" }, \
>> +	{ RING_PDP_LDW(0, 2),	    0,      0, "PDP2_LDW" }, \
>> +	{ RING_PDP_UDW(0, 2),	    0,      0, "PDP2_UDW" }, \
>> +	{ RING_PDP_LDW(0, 3),	    0,      0, "PDP3_LDW" }, \
>> +	{ RING_PDP_UDW(0, 3),	    0,      0, "PDP3_UDW" }
>> +
>> +#define COMMON_XELP_BASE_RENDER \
>> +	{ SC_INSTDONE,		    0,      0, "SC_INSTDONE" }, \
>> +	{ SC_INSTDONE_EXTRA,	    0,      0, "SC_INSTDONE_EXTRA" }, \
>> +	{ SC_INSTDONE_EXTRA2,	    0,      0, "SC_INSTDONE_EXTRA2" }
>> +
>> +#define COMMON_XELP_BASE_VEC \
>> +	{ SFC_DONE(0),		    0,      0, "SFC_DONE[0]" }, \
>> +	{ SFC_DONE(1),		    0,      0, "SFC_DONE[1]" }, \
>> +	{ SFC_DONE(2),		    0,      0, "SFC_DONE[2]" }, \
>> +	{ SFC_DONE(3),		    0,      0, "SFC_DONE[3]" }
>> +
>> +int xe_guc_capture_init(struct xe_guc *guc)
>> +{
>> +	return 0;
>> +}
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.h b/drivers/gpu/drm/xe/xe_guc_capture.h
>> new file mode 100644
>> index 000000000000..35fedc78d9e2
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_guc_capture.h
>> @@ -0,0 +1,19 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2021-2021 Intel Corporation
> 
> 2024.
> 
>> + */
>> +
>> +#ifndef _XE_GUC_CAPTURE_H
>> +#define _XE_GUC_CAPTURE_H
>> +
>> +#include <linux/types.h>
>> +#include "xe_exec_queue_types.h"
> 
> You don't need either of those includes.
> 
>> +
>> +struct xe_hw_engine;
>> +
> 
> Superfluous newline.
> 
>> +struct xe_gt;
>> +struct xe_guc;
>> +
>> +int xe_guc_capture_init(struct xe_guc *guc);
>> +
>> +#endif /* _XE_GUC_CAPTURE_H */
> 

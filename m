Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6597FC4332F
	for <intel-xe@archiver.kernel.org>; Mon, 30 Oct 2023 10:06:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2929710E27C;
	Mon, 30 Oct 2023 10:06:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAB7110E27C
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Oct 2023 10:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698660371; x=1730196371;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+NOUCGugkG33+ngNcM/2dY6PRk6YP36EoINoaRU64+w=;
 b=iEB78/X2yo0LXF4O9ZorXlyF1CH8OaEAu0wuKEZCV2B3mDtC1yDlloIb
 hPm+b1+tkXxeuSiZEoHu1FSRhHgusw1BA/paOZcwU/iMFpV0exqRcVDCm
 pB7OvcH3a63X3qMqGLQE7MwgiAyIOZc6s2tEUf/MyYiswxAZrz/leL3zh
 wnwTyuVBI6Y/DJhCOzo6X77fEpt+IZQlQJZYhZRADO4wWwTRj7MuLg19u
 aPqlLRsVDQGeQ1oLRnA/Og0A/cWqHc0KNsv3En0JyCra67AICceeeqsB9
 M0mnOhIYSdn5koUT1w82DwJ9klQB8nIU89A1hHpFjyCOCTBitUthyhS98 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="367390562"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; d="scan'208";a="367390562"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2023 03:06:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="850867055"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; d="scan'208";a="850867055"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Oct 2023 03:06:11 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 30 Oct 2023 03:06:10 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 30 Oct 2023 03:06:10 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 30 Oct 2023 03:06:10 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 30 Oct 2023 03:06:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sh9x+SZ6piI411/ShfgSLGtavsYZIvGrrkwRyVKeT2ZbnZqm6eZ4ILkOFmIsYwpTfCFvMkv0657nJhT+s0YhJefIjewwQPJ7Ms44bVWZwL4ch9dHYoN/sY10BdVxFJJwCIWGuqDcS5t08WgzUJgo3XcYYfUDEjpfUwwf7adK/nFsTuezibpoqmWrP9ZjkxdaEVXJWXV/tOS77e8U+ApRsklV2Av98TsK7Uda6rbSVVennkfK0Jkvr2oslvHq5Ibkuv25k0Nn+TQ8msH+EPTYYUTE0EVafeD9/MQH/LDx378mz7oUoBQlO4tXMAZVqhwXu9AVzk9jQDBh1/4m3aRSzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AdLq91xdNAllOE9rKPl3i1VQSd75v/kiUe5cecsJlNo=;
 b=oAKd7TV7iNXOhzmJddrQoBwflQXFz5p0LhD8Aw+0hSANermoVk9wQpJtLoTBam7WudGWNWyPpEv4X6Jyl+a2wSFCmqMXj4ariimCjzPbHRgagLlW9eq0E/kZn3qip4MSE717vTX5MiD54j/aEZT/ZC7F+I+u1JnjT6U52JIwwdLPw3g6jzwoIbioPpbL+UW4WP1se4X0BkDsXXoXsJlW/U6loaMKdhog9fI7L3lx5Hfohwq0iZF5Exxh55YYIF191GemMCdE/D9h0aJ4IReTxKG9FO3iYd/72d8pO3CB3qT2WHTvvcLfD5Di+9l/ACVryWfRuViojZ+MIxKjbhmRLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN6PR11MB8146.namprd11.prod.outlook.com (2603:10b6:208:470::9)
 by BL3PR11MB6411.namprd11.prod.outlook.com (2603:10b6:208:3ba::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.24; Mon, 30 Oct
 2023 10:06:07 +0000
Received: from MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::3f66:dcac:63f5:a183]) by MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::3f66:dcac:63f5:a183%3]) with mapi id 15.20.6933.026; Mon, 30 Oct 2023
 10:06:07 +0000
Message-ID: <ce82a1ef-5dee-45fc-a4ca-8c49d8dfb9bc@intel.com>
Date: Mon, 30 Oct 2023 12:06:23 +0200
User-Agent: Mozilla Thunderbird
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20230919161049.2307855-19-ashutosh.dixit@intel.com>
 <9d82cbe1-1dc3-4c44-9acb-58af4740c362@intel.com>
 <87o7gjdd43.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <87o7gjdd43.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0316.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::16) To MN6PR11MB8146.namprd11.prod.outlook.com
 (2603:10b6:208:470::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN6PR11MB8146:EE_|BL3PR11MB6411:EE_
X-MS-Office365-Filtering-Correlation-Id: c306ecd5-5590-40ed-95a7-08dbd92fd5a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: smM9pdMmH3KSCmFjRlBcJW1yuhsglQPuk91t5oCTlt+rSa22AthH+EUA15CaBB+rw9LnOiZ10n3jQlbRtCAbe16LnCTU7GGsBu1vVthETxK5q6q3pNtdzQoAdPI0XLCe3OuD3qqyK8U3keZwstiK5EKo7hM6/2d+l+mVJb2NVFnQlQYvkbMXS/P9Pou+3Zi8N7q3xF+QhYaZNhKSLUVcJCe75SWiw4/F8+TKiUVzBLDfaWuQgSst8644a3gQiEhJh8Kn6I3XbJUInYjvA3oPcjCT7RxcB8m09kepaH2Pqg41nU3b9loh7OqBcuduINLmbC3gwwNco3bIjP/LD9kfxjQ5uXpd91iiMPF/IKJ9BXbFHkuBXyrlK1yg1vzoCqXAYP3/yaL06X144IAsFHuFJUXAancvxC+kOf1CPvEAbfKGnCU0rp6T1qjVxZTAa7MFq71yIxUyjH2TgtJAaUNg3oTNIbG5/iqVSjXf0pOYEeLe9QLCxSjYT47x2LDL+l16KTBOFpPFiDqQapCYXmC/If1G15ewzzZEFxhKrGIzi8EE7Ggo1/32kdrnJ0fJVmN9N2Nf35sdg5Dbkj8LgGPcrIJStqDAALFIhShIKdVpRtItg6QpaCRG2Gf0SeJzZXoN6cnc5l0HUROi2EeIsBEhBA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN6PR11MB8146.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(366004)(346002)(396003)(39860400002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(478600001)(6486002)(83380400001)(6636002)(316002)(66476007)(107886003)(37006003)(66556008)(66946007)(6506007)(6512007)(6666004)(2616005)(53546011)(26005)(82960400001)(36756003)(8936002)(8676002)(2906002)(6862004)(31696002)(4326008)(5660300002)(86362001)(41300700001)(38100700002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3E1Vnl5WGQrcDVZRWtBK2NDY2x0OTZ4eTZSblk0UCtZT0pyaC9maVJ5OU9a?=
 =?utf-8?B?VW5iaFRpZGdjTmhHMXNEdEN3NGlYcEFzYVFMRkpQc0ROS0dGcG5YdzR6Zmgz?=
 =?utf-8?B?eXVDajdiZ3k0RlZCU3dzeUdFb2lNUlpBZGhWQ2VFbG1tc0dQamluRkI3QWtp?=
 =?utf-8?B?Q2tjTXlDZExIVkNBSDYyRWFPdEo2SlRSbmVoMkNlbElPT2ZENUk2VEcvM2Zs?=
 =?utf-8?B?VmsxY1JLa0xFbEFXM3hxR1U0aXc1NU5oeDNuNUhlbzhCb1RTZ0VGME5LQ2tm?=
 =?utf-8?B?RlJwNDlVUEZ2anlPTWdTT0dkV1pSYlFvQW1vaEloV3hyUEJYQXNIOEJFRmtu?=
 =?utf-8?B?dXdYNEhvc3NPeitHQjVOc0M5WDhqcWk4c0xoRHJQOXpJZnNEV0FhRXV6Zlpl?=
 =?utf-8?B?b0c1Vi8xTGo4Z3FyZGFaR0I5MUd2T09rVnVWTXMyaEN0TjBrOC9VL0tXSGFa?=
 =?utf-8?B?ODZoalVscmJVWXpaYUhUdjRJbzhWaVJDdXNuaTNITzRmRzdlUTBRMXRXcEpr?=
 =?utf-8?B?eXJFTk9kZW02VnBFMGdRUW1XVndRa2VnUE5PWnRtdUs1bnpERUZBRm44ZWty?=
 =?utf-8?B?dFFnWUdteXdiWjQ5RHBKaHNVQ3YzYWlZUTAxakdBTGV0NXdUb3JxYWtSNmt0?=
 =?utf-8?B?UFNIdU5xTVhKcFNaL1lOOTE5dmJjMnVnZnplVlZFUVVhbWdCZWF0SWpUaGhG?=
 =?utf-8?B?VUU4ZTJCZVpmZ0licEgxeVVJaG9hRkRlM3JxMHE0eDZyOWR5RnljdExnUkhk?=
 =?utf-8?B?OXl2RnZsc2ZkR1NoclV4UnU0SVZzNy9UbVpOVmIwRyt0bEpkeUJ5Mk9KZ054?=
 =?utf-8?B?TzVyNC9Ib3hjdXpMRGlBSFg0T1daNzYzNzFjRE1tK09VTFl0KzlGWmQxUUZH?=
 =?utf-8?B?eVNoTWEzdlJzdWgycTg5RzdjUVhpNk5kY1QxWENGOW5iQ2x2bDJHaUk1ZUZH?=
 =?utf-8?B?MmZSTHNRYnJIbjZOVmpUcDN2eWNZOUlLZnI5T3Rxb0gwOHpEbDZURDEzeVJu?=
 =?utf-8?B?WFIvM1AvRUIzWTJTbm5ZQXptR2hQY0g5ei9ZdXA1cWdCWWMzYnMwS1c4V3ND?=
 =?utf-8?B?dTJzSmJoeHRrbEpWU0VtNklTMXIxVXluWHYvb3hCYnpYZVRmanFZRktFdjRM?=
 =?utf-8?B?YVNqMzRpcjRZQmVXdXZpeTVmUnVuck45bUZwaWVPekNRVUhMU3gwMWNkTmxh?=
 =?utf-8?B?U1l1ZmN0TEVHeVpLM2ptS1ltQUFCbGlJRmg1RFNjN3NsaW15K3lETkxXRmt0?=
 =?utf-8?B?ajdmTUg1eERDYlI5UjJkTFRVOVpwZHBkckhqdStvZDFueHdCRHVRZmhnT1lo?=
 =?utf-8?B?Wll2OEZ5ZllCNS85YVl6YlZ4TVEvckZhOEJlTE1wL1lnaFViNDRCc3p3WVZS?=
 =?utf-8?B?aEEvdWtDajREMHJmRTloVW1Ea3ZFbHFqVFc4cVA4dnNqNmFLQ09xT25BWGRW?=
 =?utf-8?B?MEppMVdJK0pJZThyNWVqbjluZ25wK2lDV0JnazJ1dHMvNysrRXdjUGN5ODdq?=
 =?utf-8?B?OWhUek5hZmlUMTZjUFRNbjF2U01va0pYRGFlVDBYaHNpQ0lSM1BLNml5YTc1?=
 =?utf-8?B?ekRkbjN0YUhtUUdZU1BTZmZyYXp2RHBxUDQ3bHhiR2UzVHFCQTBmSkJ0K1dX?=
 =?utf-8?B?b0JLMjR2ZzZLT0JqZnlvZUZDQlp1WlNYYkhXUDU5Q21DT082MEYvTVN1RGcw?=
 =?utf-8?B?SlFNRmFoWGRSNml1aU5LN081UHlwc2dtWE5tT2NXTWpnR1ZTZXJMbEQvWUVm?=
 =?utf-8?B?d2lteERWdFkxTHl1MTV1OS9CNVprQVRVS1FRSWJrUnliWFVzSVNPNkhaZjdU?=
 =?utf-8?B?U1pOcitsdTN6Vm9OS0lLcEFjbThwN09jSTdocGdFRW0raTJsN3Y2SmVURm81?=
 =?utf-8?B?QnV6ek9nV280Z2JHS2plREt0b3p2eFdOVDAxbXl3d1RtTEdxQ1g5V0ZVNFVK?=
 =?utf-8?B?MUxQbkNMd3UyNEFFVEdaUFkyaVNVTDFGbkRNV3BPdU8vL1c1aGFYV2lOZVN2?=
 =?utf-8?B?SWIzbGhzeGVVMitKTEFiTzJERGVEUVNyMXg5TzAyYUJNTGplcjNpaC9pYkY0?=
 =?utf-8?B?SWRPREZxOXppUDFEZ2RXbDBNa0wzdXRRa0owbGJuTXByYkgwZDJoWmpqTTB5?=
 =?utf-8?B?NFF4Q1RseTdqZmxRUzMvd1ZuQTZ2dG12YnFUVHY5bFZSdHFMajc3UDhmbmNB?=
 =?utf-8?B?bEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c306ecd5-5590-40ed-95a7-08dbd92fd5a9
X-MS-Exchange-CrossTenant-AuthSource: MN6PR11MB8146.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 10:06:07.6510 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QwbZUmFV6PCfU8gnxB6EQyta5Dpg5L5DIW/iAtmJD+8t2uIlwBQ0fIYbGZv3vk4AeDjcL90CG0iSt1m0vCgU/QwZym1WNckuXghVjS0bxUM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6411
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [18/21] drm/xe/uapi: More OA uapi fixes/additions
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

On 27/10/2023 23:28, Dixit, Ashutosh wrote:
> On Fri, 20 Oct 2023 00:28:01 -0700, Lionel Landwerlin wrote:
>>>      struct drm_xe_oa_open_param {
>>> +	/** @extensions: Pointer to the first extension struct, if any */
>>> +	__u64 extensions;
>>> +
>>> +	/**
>>> +	 * @config_syncobj: (Output) handle to configuration syncobj
>>> +	 *
>>> +	 * Handle to a syncobj which the kernel will signal after stream
>>> +	 * configuration or re-configuration is complete (after return from
>>> +	 * the ioctl). This handle can be provided as a dependency to the
>>> +	 * next XE exec ioctl.
>>> +	 */
>>> +	__u32 config_syncobj;
>> So you're adding this, but there is no implementation for it?
> Not yet, but there will be. Actually the plan is to do this:
>
> struct drm_xe_oa_open_param {
> 	/** @extensions: Pointer to the first extension struct, if any */
> 	__u64 extensions;
>
> 	/** @num_syncs: Amount of struct drm_xe_sync in array. */
> 	__u32 num_syncs;
>
> 	/** @syncs: Pointer to struct drm_xe_sync array. */
> 	__u64 syncs;
>
> Which is exactly the same as what we see in drm_xe_vm_bind or
> drm_xe_exec. So the plan is to make perf_open behave exactly like an
> xe_exec which can be pipelined with other operations.

I don't think this is going to work because it means we have to close 
and reopen the stream every time we want to change the configuration.

It would need to be a separate ioctl on the perf file descriptor to be 
usable.

Otherwise we can't really pipeline anything since we have to drain the 
buffer until we can close it and reopen a new file descriptor.


-Lionel


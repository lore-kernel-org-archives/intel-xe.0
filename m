Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41016CD3424
	for <intel-xe@archiver.kernel.org>; Wed,  6 May 2026 08:59:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2C8C10E522;
	Wed,  6 May 2026 08:59:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CV5231dq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D096910E522
 for <intel-xe@lists.freedesktop.org>; Wed,  6 May 2026 08:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778057955; x=1809593955;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aTbwASvHB43cH+crtu+08FMPNRabjmQUmas4l0CisI8=;
 b=CV5231dqnMlUPBBBWCHQPYd/dyI5497TeAZDepHDui82yiRlP2hWnSCm
 8yyT3rpp0tt5cW/a/bDZWMMOywgWgUQd2+tjRo/90+GigpZnLrcYte2fJ
 e4FyzelAfdu+2bY7cXJX8hJj9R146KFMOJXXWsdG7h/fcjH0crT22Rqqq
 n6qcRq5Z2OmXirnC1/akk8Aa3it1cAwWw0S+hj/9Ve5zWB0yg66PUiRkE
 tMwvPhjdxj+a40GpfwsjI7UnlWjx2BgD5kZgg8jWom35q5y/7sfMwDtHW
 NT65O5DXhwCnHpE8SMbjrzhtYMUU+HvzuTgPhYsb1EHVM24uLzcz1aF6n g==;
X-CSE-ConnectionGUID: AEd2Gfr5QWWui5NTBMdGQg==
X-CSE-MsgGUID: qocPFXOgQcu5uaEcPZL/1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="90439297"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="90439297"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 01:59:15 -0700
X-CSE-ConnectionGUID: hScsb1m5RKCJMX+pJV+png==
X-CSE-MsgGUID: bMe7W5jZSZWXfarAHnRBBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="240066909"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 01:59:14 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 01:59:13 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 6 May 2026 01:59:13 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.16) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 01:59:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FNUINmQOelTXa8a2WcnjfCAPzJtCM+frv49nvWullhYHoYYtv/CX2+d+JrronxCncFqOkI47gcWo5NMnutBEbaVUvvsK05OeiNegeJiBB/E8inq/eCdGWE4Vy/Ljck9ABftOKtii9vpJ3hF9DpB+4bgt88WV/lZmCDKQiCLFbUSwpkbN+GDjPXTZevftOCExjVn43Hth0GxI5hjqzcGnK6pn8K6bNfY8CZfKrd1nbY98PWMYrrSGBQ0lIZUA2fsmUFEiJ0MqKxb9R9v3QrwJEKAnrxJju9WS3pBZ91kPjH59CZmoBiS8+2L49cZ9bEbHaWC1X2tAZ63MRKaZLdERkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hf8rLiC4VcMoSoZrMOQ+mydEm/HpXK2wXVrhRhuHpyc=;
 b=WWi2b4qXRtEu1TD+Jk5CUoNk6nKUhQJPPj98jDE7LarvFfMAkWqj+a8SI63R1tBwBhf4EFNa15oUHOrPkJVZKSCYDWw6CwNAu4Avqhb7Mlnniq5fmacRIHmQ2PfI/kBTpK2SD3z+nUJDOZIrAZFP3CpicCzM1YjDNNUz/MV2dPoJ7MSEtcO8CtZXX8oD+ubRKUP2i86fl77As9OVe/+XVTryynENb44rax/dOqRid0O8CGKdgOTVNH6hMjTJNCCLs2dD5+tgSr42DgpyDUepGJ24PT8hrCOgXBNpeymh2iJj29+9pJ6qawjoHFUQ0wX6PL0Yn5noLKPRxSnt7WFEGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DM4PR11MB5261.namprd11.prod.outlook.com (2603:10b6:5:388::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.15; Wed, 6 May 2026 08:59:11 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 08:59:11 +0000
Message-ID: <b47bd299-b538-49de-b8a3-bfc24f72ff74@intel.com>
Date: Wed, 6 May 2026 14:29:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/6] drm/xe/xe_ras: Add support to get error counter in
 CRI
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <soham.purkait@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260504065614.3832331-8-riana.tauro@intel.com>
 <20260504065614.3832331-10-riana.tauro@intel.com>
 <8c81ee71-14c1-49f2-ba7f-479ed9fabfc0@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <8c81ee71-14c1-49f2-ba7f-479ed9fabfc0@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0088.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::6) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DM4PR11MB5261:EE_
X-MS-Office365-Filtering-Correlation-Id: 6080fcc3-d00f-4569-7c17-08deab4dbdb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: Tgx+dIQ09PiLyG+Zt8il5d9+f5ZpwKd0roHSz5tksc/P3FmwP1zlo1kVq/6gFGPemu8jJrMfBduMf2peTXVkL02Ojf17lmvwuIxs2xNpt/G+gEnx3h5IK7R7omh5XeEwKa/NMh6E0nrpeeoJ5qizE+/hJzneLRoAnBRMc+gPOKEBLD8B3/Wqdwd7PM11pbsubk296EkBlPxb9cHjUtGo36PduBU/FBixer+kw0zZBJIpESN5o8pa3JAP5TseXUkS0fiFNAp+PeE2S7a1l/c48XodaGT8otHmx2ya1BpBkwOmKfj+RbuAV3b5R0KkB8K7A89bJDa4+8gIn27A5PCHDneidBczvyLkbU3imKyZdgax5m1oNLInDrSLgqeV82eqNlEZmNW1xVG/WHtgP2qQgUdo7k7goaPblWPZ1koNqA8nwYoRMTv98BB6r0tn8ld3iH7BxUYMb6/X+jXsZoPPwqVpmxPnvy0lX5/q5iir5RUXTuwEFGR4O6IFXUQo1K/nfoDgJYduN1dYTIvQHVbAqX8NsCCN2l1BwN5od5O6toNSLkm1ZTfvZkci9yDr13F+6Wsc3wskHgSoomFGqIbpE6vLbgQw2DP4AuHRKWo+1UNsvjyrisVMOkXDtWT/kkacxxTd68xzBm7LeSeqx9YhEL8WfS24hkucXafSn/rROgepVjDY6NINVJ7s0rWRMfkg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wno3QzU3WGNhSnhIQXhKZSszdkFEYnhHS0s4M1J1ZjlLTmhUa1dCWUJaSEZ5?=
 =?utf-8?B?MWdrNFJwbGE1S0taelpLNWw0SDhaYk5Pa2N1QUpXK3djYk5LcGdRL3lUcEJC?=
 =?utf-8?B?QkpTaEpQOFBZWXZtUGpIU3NFZVkybEp6bkQyWjIxRVZYN0VuSUlJd29oRHFS?=
 =?utf-8?B?ZFE3aFBIdE54NDE1ZUVqalM0MmNaVkdGTVp0SVZLb3JTRitjS1cydTZkOGR0?=
 =?utf-8?B?L1NWdEhGeDdzR3I3dFY3UnNPQlFESDY2cjk5ajNtd1QyZFpoVml6QnZKV0kx?=
 =?utf-8?B?WGc4dDdWR1l1NHRNNFZkRitFTlV0TU9oZG12NmllRXdSSzJiL3N2Z285WHhG?=
 =?utf-8?B?M1Y4SjBjSU02TzlMWDJIOVZwTU1HZms2U3dUYXRRTVhWSDMxMWpGcnMwUDkw?=
 =?utf-8?B?NTNrbkFXQUZUdTBPTjZnSFNUOWNvZGUvVC9FOHIzeGd2NnQzWjZMZUtteDFo?=
 =?utf-8?B?ZUV0bnZ0ZFB4c3I2N3BENTc0TlJVZmlHRnduUmpkUUJPbk9OcWIwdFN1UnFL?=
 =?utf-8?B?NWdqOEFXcUpOdm9GZHcybnRCUkF3dkxPRytPTng0RUNkMjN1TXlCaVNFZjZv?=
 =?utf-8?B?d3ZkN3U2a1hxMks4dGlRTmZMbEpnOEF6ZnVkQ29HQWNzS0gyTURiay9YQlF0?=
 =?utf-8?B?Ui9OMFlsS3B3WDQwZHVaazRtZ3hxU05FWHBaOGlaWEZYalBwaFpUc1FyZk5i?=
 =?utf-8?B?VnBUdGViOEdsdWFaR1FRTVFpc2kvd0hzTWg5cDcwYytiZ1JuczJ6MStUMjFW?=
 =?utf-8?B?dEVZTmdRTHlnSlZsS21aL3ZNempqSFYzdkFtcjNxdXQ4cFRIejRjOTYyaTRH?=
 =?utf-8?B?eTN2M1d1WHZTY25OSmVpclVETjZBbmllbnZ3cGZWblkrTWVzS2JYVHp2NGFX?=
 =?utf-8?B?MHNEamQ1d09PbVNnQjdHbzEvd0dtTERxRmxXbzFpMjFsUE5uWUluN3RUOENp?=
 =?utf-8?B?Q3JGeUViLzZGSDRyd2JWYUs1U2hubEhWZE13MGQvcGt3TFpmcDJTMU8wTnRG?=
 =?utf-8?B?SVFlTlllUnJkcGdmUFVBU294ZzFMMFNIYmxVZmFyenVqcWZ6ZC9NV3FWQVBP?=
 =?utf-8?B?dFY0MmMzZDlQUUd1TFNFU1dkOW9XWXFlcmRqWVlyTUxqSVZ0Mk5TUVFUSUFL?=
 =?utf-8?B?aWJ6citnTDlJMjBDN0JDWTNCOEhuTkNZMkZ3ZVZTMkVHTU9NYlg3VmRWSTF5?=
 =?utf-8?B?VnMvL1g1TFdmSWo4OTFjbGNPREg5U3RMM0V4dk5HMUpXNjFQZWM1QUxqWVlv?=
 =?utf-8?B?eVNvSXJEdXFrVEswSGtENXlYM1ZVL05lWllXcmJPL0xmTUYzTG42U2lrUGhq?=
 =?utf-8?B?NWRmYU5oc3BiZmNtTWlmam1rR3lUb0IyVHMzYjZCWXBsVUY4dStpK0dEU3lC?=
 =?utf-8?B?UHcrQjBDM0ExS2RTZ3FUcW5OMmlPNEJtTlZOS2prVFdGZVlYVjhFY1BpejlV?=
 =?utf-8?B?Y2Evc0VOdFQrMDN3RVNPMGpvb1ZuWnVwMDNWa0w0YzFBckY4bG5sb2lZdlNH?=
 =?utf-8?B?L0VVZHNiTUhUYXQ4UXMzUStuMExiVGRzSkh6L2xxT1dSTDB1OERXb1pPV1cr?=
 =?utf-8?B?OVc5THUrU2xNcmJ1NmwzSWRsOWNaUFY1QUhyOVloRW4yNXVYNWovNG5GWE53?=
 =?utf-8?B?ektnR09acnJSTVpsRmpSbzh1cCtqRjAwNVdJcVd4MXZGOHJxTGhSTUVQYVFj?=
 =?utf-8?B?djU2TTR0UFlBaGI5RUQ1MXl1b24wOEtDZzNKbG5lM0tnaE9FRjlVMitGd2xs?=
 =?utf-8?B?dVNabGlRSTExcGdyd1pQU055N2l4dFNUQ0p6a21xZktvT1o5SHJBaHFnQ0xJ?=
 =?utf-8?B?Wmp6RlF5TFBVNHJNOERPcXF2NXd4UTRYZmo3VG1mejhzUDdaSEV2SFRwQXdp?=
 =?utf-8?B?MjFXaldoN1hIbHdMVlJmbko4WVN5T1NLVXR1MmRJQXY1ZDYybkRjR01kL1RR?=
 =?utf-8?B?RkVLUmxXb21VbVE5dWt1MHFtZDZnVEdZSDNwamEyWWdZYUpVY3g1ZW5VeHpK?=
 =?utf-8?B?Z1p4ZG15TjZMOVkreFplSzhZRWVOZGdycEIzNlNmS1FHUE4zYVd2TEExMkZD?=
 =?utf-8?B?QTh3OXJhSTlJa016R2VQU1I5eDc4dnoySktoaEFidm9jR0h5VlIyY2lyeGZC?=
 =?utf-8?B?aU9zOFVSSFNxa3F0L2R1ODdLcGpvMngrNmdQalUvMFlKK0lNQXJMMTdQRE5D?=
 =?utf-8?B?YzMrR28yV21seERsMlJXR244dWdWZDVuS21ua0R0dG9OUFBuNXVHcWQwVVBy?=
 =?utf-8?B?UlliU3NJMzY5VkwxOHA5VGpRZ0s2a0lJc0dtMHhRb2hLNERMbHl5aHBZQWpZ?=
 =?utf-8?B?ZTA0MnRQMjg3Nlc2dTR1RC9GYkh5b1JBSUl6TUVjSDBvNXZkVjZxZz09?=
X-Exchange-RoutingPolicyChecked: VGybBHhGwoklHghTPEtnlVXaMdb+azaGqLrwW8V1VufajWsdSoFaKWJQgLlyDlN86jk23eMZ2NJ1p10SZXAt5PG/B/7ZV0zD3G0CISYNphXyHGwcqogqBcYTzw/DpbSktOkQO+0I3npxy9IGHaxONRvkJTu+i5oIqFvyg67fUgJQDZw7ce72iO+3emU+2l/OsoumaCyrZQnsm3kY9cAKMBsKO9eRWdP3EC/9yNmMSU5ZFaHFWn2wS6VyWc/eUrzjEhe3dtDEQLmoQaglsEaP/V6N8Mmox8D/gzBu/oFZrTjv1X8YqtgJSBS+evkn+o5qoUbg0W/ti7z7Abc3j/kgFw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6080fcc3-d00f-4569-7c17-08deab4dbdb5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 08:59:11.8035 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8ra+jX63vUrro/yNJIRB5MwQmOSy5a0Oj//pQ0HW4Z16t6R2B2PfcLrUB2PreyLjOE6Z6KsdwtzpQGqeVhohIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5261
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


On 5/6/2026 1:33 PM, Mallesh, Koujalagi wrote:
>
> On 04-05-2026 12:26 pm, Riana Tauro wrote:
>> Add request/response structures and helper functions to query system
>> controller to get error counter value.
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> v2: add structures for clear counter
>>      move commands to sysctrl file
>>      split functions
>>      fix commit message (Raag)
>>
>> v3: fix log message
>>      squash patches
>>      change error code for sysctrl error (Raag)
>>
>> v4: rename function
>>      remove unecessary macro (Raag)
>>      add documentation for enum
>>
>> v5: rebase
>> ---
>>   drivers/gpu/drm/xe/xe_ras.c                   | 91 +++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_ras.h                   |  4 +
>>   drivers/gpu/drm/xe/xe_ras_types.h             | 30 ++++++
>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  2 +
>>   4 files changed, 127 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>> index 4cb16b419b0c..47a58ce3b3ca 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -4,11 +4,14 @@
>>    */
>>     #include "xe_device.h"
>> +#include "xe_pm.h"
>>   #include "xe_printk.h"
>>   #include "xe_ras.h"
>>   #include "xe_ras_types.h"
>>   #include "xe_sysctrl.h"
>>   #include "xe_sysctrl_event_types.h"
>> +#include "xe_sysctrl_mailbox.h"
>> +#include "xe_sysctrl_mailbox_types.h"
>>     /* Severity of detected errors  */
>>   enum xe_ras_severity {
>> @@ -50,6 +53,23 @@ static const char *const xe_ras_components[] = {
>>   };
>>   static_assert(ARRAY_SIZE(xe_ras_components) == XE_RAS_COMP_MAX);
>>   +/* Mapping from drm_xe_ras_error_component to xe_ras_component */
>> +static const int drm_to_xe_ras_component[] = {
>> +    [DRM_XE_RAS_ERR_COMP_CORE_COMPUTE]    = XE_RAS_COMP_CORE_COMPUTE,
>> +    [DRM_XE_RAS_ERR_COMP_SOC_INTERNAL]    = XE_RAS_COMP_SOC_INTERNAL,
>> +    [DRM_XE_RAS_ERR_COMP_DEVICE_MEMORY]    = XE_RAS_COMP_DEVICE_MEMORY,
>> +    [DRM_XE_RAS_ERR_COMP_PCIE]        = XE_RAS_COMP_PCIE,
>> +    [DRM_XE_RAS_ERR_COMP_FABRIC]        = XE_RAS_COMP_FABRIC
>> +};
>> +static_assert(ARRAY_SIZE(drm_to_xe_ras_component) == 
>> DRM_XE_RAS_ERR_COMP_MAX);
>
> Inconsistent component ordering like
>
> In UAPI:
>
> CORE_COMPUTE(1)
>
> Internal order:
>
> DEVICE_MEMORY(1)
> CORE_COMPUTE(2)
>
The ordering here is intentional. Different devices expose the errors
using different mechanisms, PVC uses registers and CRI uses system 
controller.
The uapi ordering was introduced when the initial netlink patch was 
floated for PVC,
changing uapi will break PVC and changing system controller f/w ordering 
is not possible.
That is the reason for having mappings for both.

Thanks
Riana


> can you please make consistent ordering to easy to maintenance and no 
> confusion.
>
> Thanks,
>
> -/Mallesh
>
>> +
>> +/* Mapping from drm_xe_ras_error_severity to xe_ras_severity */
>> +static const int drm_to_xe_ras_severity[] = {
>> +    [DRM_XE_RAS_ERR_SEV_CORRECTABLE]    = XE_RAS_SEV_CORRECTABLE,
>> +    [DRM_XE_RAS_ERR_SEV_UNCORRECTABLE]    = XE_RAS_SEV_UNCORRECTABLE
>> +};
>> +static_assert(ARRAY_SIZE(drm_to_xe_ras_severity) == 
>> DRM_XE_RAS_ERR_SEV_MAX);
>> +
>>   static inline const char *sev_to_str(u8 severity)
>>   {
>>       if (severity >= XE_RAS_SEV_MAX)
>> @@ -66,6 +86,22 @@ static inline const char *comp_to_str(u8 component)
>>       return xe_ras_components[component];
>>   }
>>   +static void prepare_ras_command(struct xe_sysctrl_mailbox_command 
>> *command,
>> +                u32 cmd, void *request, size_t request_len,
>> +                void *response, size_t response_len)
>> +{
>> +    struct xe_sysctrl_app_msg_hdr header = {0};
>> +
>> +    header.data = FIELD_PREP(APP_HDR_GROUP_ID_MASK, 
>> XE_SYSCTRL_GROUP_GFSP) |
>> +              FIELD_PREP(APP_HDR_COMMAND_MASK, cmd);
>> +
>> +    command->header = header;
>> +    command->data_in = request;
>> +    command->data_in_len = request_len;
>> +    command->data_out = response;
>> +    command->data_out_len = response_len;
>> +}
>> +
>>   void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>>                         struct xe_sysctrl_event_response *response)
>>   {
>> @@ -91,3 +127,58 @@ void xe_ras_counter_threshold_crossed(struct 
>> xe_device *xe,
>>               comp_to_str(component), sev_to_str(severity));
>>       }
>>   }
>> +
>> +static int get_counter(struct xe_device *xe, struct 
>> xe_ras_error_class *error_class,
>> +               u32 *value)
>> +{
>> +    struct xe_ras_get_counter_response response = {0};
>> +    struct xe_ras_get_counter_request request = {0};
>> +    struct xe_sysctrl_mailbox_command command = {0};
>> +    size_t rlen;
>> +    int ret;
>> +
>> +    request.error_class = *error_class;
>> +
>> +    prepare_ras_command(&command, XE_SYSCTRL_CMD_GET_COUNTER, 
>> &request, sizeof(request),
>> +                &response, sizeof(response));
>> +
>> +    ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>> +    if (ret) {
>> +        xe_err(xe, "sysctrl: failed to get counter %d\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    if (rlen != sizeof(response)) {
>> +        xe_err(xe, "sysctrl: unexpected get counter response length 
>> %zu (expected %zu)\n",
>> +               rlen, sizeof(response));
>> +        return -EIO;
>> +    }
>> +
>> +    *value = response.counter_value;
>> +
>> +    return 0;
>> +}
>> +
>> +/**
>> + * xe_ras_get_counter() - Get error counter value
>> + * @xe: xe device instance
>> + * @severity: Error severity level to be queried
>> + * @error_id: Error component to be queried
>> + * @value: Counter value
>> + *
>> + * This function retrieves the value of a specific error counter 
>> based on
>> + * the error severity and component.
>> + *
>> + * Return: 0 on success, negative error code on failure.
>> + */
>> +int xe_ras_get_counter(struct xe_device *xe, enum 
>> drm_xe_ras_error_severity severity,
>> +               u32 error_id, u32 *value)
>> +{
>> +    struct xe_ras_error_class error_class = {0};
>> +
>> +    error_class.common.severity = drm_to_xe_ras_severity[severity];
>> +    error_class.common.component = drm_to_xe_ras_component[error_id];
>> +
>> +    guard(xe_pm_runtime)(xe);
>> +    return get_counter(xe, &error_class, value);
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
>> index ea90593b62dc..74582c911b02 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.h
>> +++ b/drivers/gpu/drm/xe/xe_ras.h
>> @@ -6,10 +6,14 @@
>>   #ifndef _XE_RAS_H_
>>   #define _XE_RAS_H_
>>   +#include <uapi/drm/xe_drm.h>
>> +
>>   struct xe_device;
>>   struct xe_sysctrl_event_response;
>>     void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>>                         struct xe_sysctrl_event_response *response);
>> +int xe_ras_get_counter(struct xe_device *xe, enum 
>> drm_xe_ras_error_severity severity,
>> +               u32 error_id, u32 *value);
>>     #endif
>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h 
>> b/drivers/gpu/drm/xe/xe_ras_types.h
>> index 4e63c67f806a..74d85875cd63 100644
>> --- a/drivers/gpu/drm/xe/xe_ras_types.h
>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
>> @@ -70,4 +70,34 @@ struct xe_ras_threshold_crossed {
>>       struct xe_ras_error_class counters[XE_RAS_NUM_COUNTERS];
>>   } __packed;
>>   +/**
>> + * struct xe_ras_get_counter_request - Request for get error counter
>> + */
>> +struct xe_ras_get_counter_request {
>> +    /** @error_class: Error class counter to be queried */
>> +    struct xe_ras_error_class error_class;
>> +    /** @reserved: Reserved for future use */
>> +    u32 reserved;
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_get_counter_response - Response for get error counter
>> + */
>> +struct xe_ras_get_counter_response {
>> +    /** @error_class: Error class counter that was queried */
>> +    struct xe_ras_error_class error_class;
>> +    /** @counter_value: Current counter value */
>> +    u32 counter_value;
>> +    /** @timestamp: Timestamp when counter was last updated */
>> +    u64 timestamp;
>> +    /** @threshold_value: Threshold value for the counter */
>> +    u32 threshold_value;
>> +    /** @counter_status: Status of the counter */
>> +    u32 counter_status:8;
>> +    /** @reserved: Reserved for future use */
>> +    u32 reserved:24;
>> +    /** @reserved1: Reserved for future use */
>> +    u32 reserved1[56];
>> +} __packed;
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h 
>> b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> index 84d7c647e743..b315847cbf64 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> @@ -22,9 +22,11 @@ enum xe_sysctrl_group {
>>   /**
>>    * enum xe_sysctrl_gfsp_cmd - Commands supported by GFSP group
>>    *
>> + * @XE_SYSCTRL_CMD_GET_COUNTER: Get error counter value
>>    * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
>>    */
>>   enum xe_sysctrl_gfsp_cmd {
>> +    XE_SYSCTRL_CMD_GET_COUNTER        = 0x03,
>>       XE_SYSCTRL_CMD_GET_PENDING_EVENT    = 0x07,
>>   };

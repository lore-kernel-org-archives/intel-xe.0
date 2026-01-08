Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE99D1D478
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 19:01:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3236710E7B1;
	Thu,  8 Jan 2026 19:01:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hX67s+47";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40BC010E384
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 19:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767898890; x=1799434890;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=uYcirPmcTC8T8Bjb7s0TabtkooLsso1IIpRTN/qC3js=;
 b=hX67s+47y8n/Qwjy86dCprA9tqcWX8LJYllgDGvBFjqxVSA1cpHh8i8Q
 vu6ZI7YLhyeUBzUSSHlVqOKtp2a2zc2fcWosgJUqpxrzochtkANVq6elv
 oicVkBGhGHWDYTum7QBHOQzhX4I58SnkK3n/6+dTpF+zWWAYg3dRxxiBT
 wMpehT7yD8/R6DHMnS7XeESHpjxXXSLhT3r47dURjZUoTA6oyPB/mDhDa
 3TjiRq0iGKN/w/GuW4bl4comYRHs7S1WMXqlWpWmr56Xy+f+znt0W9AMq
 /MGXwaYZ9dNBJrZDcdkfQHrQSuApzw2SfDxDFabaF6ZC4s+s6ZJ1kYdzT g==;
X-CSE-ConnectionGUID: NK+zwv5pQ5KgqpODkz4atQ==
X-CSE-MsgGUID: lGUm8UcPRaGCnaIz8WlCbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="69334938"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="69334938"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 11:01:30 -0800
X-CSE-ConnectionGUID: /ySbOASFSGOkOJt5Fp74JA==
X-CSE-MsgGUID: hg5Ew4GrSrefDBaiuywCDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="233975277"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 11:01:30 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 11:01:29 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 8 Jan 2026 11:01:29 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.12) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 11:01:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sbJpY/kO6U+lDY4YzNrlKM6cygMa+8RcuQ2dzCtKiq/CraxvZx1E5bVAJrRSVpLAgy+oBK2TW7lHK19KKRNUxewEYte3kKOxI/8y0mL4/tMXrWYVUT6pyD6w2g98w8e2CNEtWkZxeLfseyC9PFlX9NKsoPbnnrumOmF6U6ZBfBS+MPRZrbnExGMAD+ZMqqfPlsNHSVS10As3C9leOydqkH6UegBugy7bY1EiOuRQBgzwHYLNcI1RnCLqUAZ9WngPJb9LzQBuzlPfWue5ne+cHm5dVu57hOXucAoS1MYRYC6D9LithmkcioKnKtLVbshmsrl2lyas9Oi5nFsyJ1egOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uYcirPmcTC8T8Bjb7s0TabtkooLsso1IIpRTN/qC3js=;
 b=p53+Aulwva3fowhDv8MWfwRLnUby778ncVSVVu+D+pFEI68C8FeI8jxocqBQXD5IQ3aR6/lUSZunk7Y51k37mxx0aHrzfXQBkV0GizDuu8wQakqcRViNpr7y5EATW0Gk4ZfTKoeZy6MPFd9L+BgbJgfnBeaG+aeDHWVLjMsZLXU/Rv8AAyyVBChCLID5iTY73s2PpFyvCr9+oI9ev3nZvKKyoqrxQpFIxFGAzdvaV4u50q08aEahvPikaSAffrce0WBdbskA0GYZCpfgvCydJC6cgVoyMH6Eu8Hgpe+trdiWqemNYGUkrZcapDkRkJ1wKepLYv7ApLjFBlD85ltDMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by SJ0PR11MB4944.namprd11.prod.outlook.com (2603:10b6:a03:2ae::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Thu, 8 Jan
 2026 19:01:27 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203%6]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 19:01:27 +0000
Message-ID: <ca890ef3-28f7-46a5-9591-ad4424d92e58@intel.com>
Date: Thu, 8 Jan 2026 11:01:24 -0800
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/guc?=
 =?UTF-8?Q?=3A_Bump_GUC_version_for_NVL-S=2C_CRI?=
To: <intel-xe@lists.freedesktop.org>
References: <20260106212758.1172984-6-julia.filipchuk@intel.com>
 <176773630243.130801.12501833385149293905@a3b018990fe9>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <176773630243.130801.12501833385149293905@a3b018990fe9>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0044.namprd04.prod.outlook.com
 (2603:10b6:303:6a::19) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|SJ0PR11MB4944:EE_
X-MS-Office365-Filtering-Correlation-Id: c7cf228a-ab0a-472c-c5a4-08de4ee85332
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L1JCOEtZWjBCYURTWmdNNkowSnI5Q0NIeFVsTFZSZzV3TS9RSzMyWnpxdUtL?=
 =?utf-8?B?ZE1tRjc2cU9WelFyS2hPaUsxSldYWU55WVFWUDNmekZ4TmZIN0tmazZDTmcr?=
 =?utf-8?B?MGVydFRUdGV2ZTVudHBYL1Q5MTJnWDJreUhnci9nOWlLRHNNcXovNXpHemg0?=
 =?utf-8?B?SWVSa2h3Sk1TMjArYUZDUDN5ZTloM2kvN3hiZ0l2VlRoUkxwTnBjSWxjditG?=
 =?utf-8?B?NmxiOGNHTFFEeWJMV05WZ0FQOE1XSzcza3laaFdGcVpMY2RtSFpTZncrdzJu?=
 =?utf-8?B?QVh6ZXpEQ1pYb2gxcXZtdWVFNStsdWU4SmcyTmFCWFhiVHNRTmc5VE1IR2ZB?=
 =?utf-8?B?L1NwOTlnT3YyYllYbjkvbHRFSVdXV28vZ1dobDB4eVdYaUhNaEJmY3IrMjFj?=
 =?utf-8?B?R3Z1Y0lnSWM4YWY4Smk0YUgzdUJtVm9yWXpHOUMxcVNXcWw4cjNQb3F4OFU3?=
 =?utf-8?B?UDZzN1ZsdlFCeDJnUjVoREZyOXJDYWQwVnM2VHNtaE03TkJsYjF6Sys3SUF6?=
 =?utf-8?B?dElmWWg4cHVqak1GWS8zaEdYZUhSTDJmVWlQbTFrUEZEZzBNTUd6c2w3bHFD?=
 =?utf-8?B?VTFObmJuNVlNd1lVOTlWVXFXVkNkNUdBM3lrV0liRkE0YzZOOGVlckp1VSs3?=
 =?utf-8?B?eTMyUXlJYlFwVVRwcG5RNll6U2dZUy9tVGsxVGQ5Tjd6dSt0LzczWTZhYW9B?=
 =?utf-8?B?RWlEQ2dudXlydXlrTWlUNkJpR0MxdytJQy9KUFBNQnhEc291OEUwWUVvQVNh?=
 =?utf-8?B?d2xBYW8xNWNaZTdTaS83Q0lQaVNGVElMalFLeFdxWFF2V2Z4NWQrYlkyVmpn?=
 =?utf-8?B?VE9vRlVmMTJSV3BZV1l6N2F1Y2Vza3BhTWlES3FiKzBJbjVPQkVwZHpISnIr?=
 =?utf-8?B?T2pINkxHUXRVaXcySm9LWit2N2g2QnRwTTdFRXR4Yy9ocTBEQi9ONzB1Q3Nn?=
 =?utf-8?B?RmhCd3YwWWpVZS9RNkszZEZyckErQmowVUsySXpoWU1Va3dZVFk1dk9pYkNw?=
 =?utf-8?B?MEw0eFg5Qkx6Yk5iOHpkNWVsQnllK3NIdUFjbS9vZDhUTWFZaDBYR3VVWHZz?=
 =?utf-8?B?b1hicktHWTJEVGxRb1BkRjhQeW9qM3lEcTV3NG9qZlRrOEYwS05lMzAwK3VJ?=
 =?utf-8?B?Y3JxMDd0MFBPUWQ5UFY5MmZBU2ZGcUxMbWxaeENRMWJSVk5WeEd1YkM3QmJI?=
 =?utf-8?B?K0lyc2N0TjJnMmRYY2QraVl6c1pMbWtsYVlMMk5YUURNbmYvMlYwelFTcnZq?=
 =?utf-8?B?M1JvNUg3OUlGWEhIbHdpOTFJR2VsTGxZSkdZM3hqMXlnWVNWWDE0VCtXWHhG?=
 =?utf-8?B?RzdiVzZNVE10S0NDTE50ems5NDJKQ2l3cHhaSEdtN2JjZWJQeFR3RHBhdzQz?=
 =?utf-8?B?ZW5hN2hqYmI2WnJNR1B3akd3SitHeDNmeExUTWlhbW1xN1l4ZDNpclhpczVr?=
 =?utf-8?B?dVIxZVNFT1NuMnhFU2dOOUVTblNpaXRkR3ZtRHNnWlB4NG1ZN1hTNlplWllR?=
 =?utf-8?B?eUlWQlQ3cVZpbWZCUVFXQ3RZemdKMVdxcDVKUnI1ellYclNDczdaZjJha0p4?=
 =?utf-8?B?REViU29ESXJISHVYZlBKME9weG9lKzdwZm9TeU9SaWZsZmtpUmtvU2E4eHU2?=
 =?utf-8?B?ZG9IbE94VXNGS2xmbW1kNnI4Q0IvcVgyT1k0WkRNeGtPektHdE0wanNDZWJh?=
 =?utf-8?B?QXlSNFU4dWxjLzZPdWZCVGkxRUs4eEFLdE9mSW5yVG5yVzlaekdMZmxXVm1r?=
 =?utf-8?B?Wlp2eTFvVFkvYTlWaDdhajFuRXlxd2Vqcm1Za00yTGZ0Q1hhT2xjdnZUZHh1?=
 =?utf-8?B?M091N1JsalRhREF6NGtoOGVCeGo3aGJvRmU1Rms4NkVtdVNMSlJpS3dVbEhQ?=
 =?utf-8?B?VkhMM2xYOEFqUFFSZjFiVVRVb2N2WEdoZHVHUnpFUmM0RWg5Z1I3MFErQ0NC?=
 =?utf-8?Q?RIJiB5F+AVrR8pJx7Iow3knJ/akUvrA7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1lPUldOTzNiYkJxZUdUQWYvSC9xZkNyUU54d2xLMk9Cak1Wb2QzWnhlcU9D?=
 =?utf-8?B?NkM4WVBPZUxqblJKUTZjTnJiUTdhOVRxbG4zdVE0Q0p5QjVUV3ZjTExReFc0?=
 =?utf-8?B?bjNRRU41aDF3TjgrTm83M1RGV3AwZythZ3d2MnVqbENQOHJabklPU21Mbm1t?=
 =?utf-8?B?UzV6aGFzcHRrclVZdHdwZ01yU1VETXFiaFF0RFdLdVhYeGRUZnhWNjNpM3hX?=
 =?utf-8?B?NzRETWQ1TDc0c3BGTERhd3owUXlLc1RGNVZwU3QwVm1xNHJZRWtDcTZMMm9n?=
 =?utf-8?B?TUlzeEdtdkUwZFRZK3lHUkZ3WUNycUFzZEgxRWJYa2x3UThvaW1nN2UrWGFE?=
 =?utf-8?B?YWhSTDhmOFcxaUpDcVhDbWs0NlFsdHFpYVlOUFpQd24vVUZOalg5OEFDckZH?=
 =?utf-8?B?anMvTXV6d01ob3lSdjV1V2ZtcXY1d2VKamRqaWJFcllaMnJyYWdwdGNkQTc1?=
 =?utf-8?B?ZXYvSTFZNEY5Sm52ZEhGRWF3RGlnRkcwT3p4M1c5R09rTXhkdEVKNStJOE5D?=
 =?utf-8?B?NjJQSTBENXlXUzM1QmdQN09yeEgzbmtmWEFpSUtMNEwzdElpRnhZYjBFZGRG?=
 =?utf-8?B?RjVzRnZMS0RKZFdieXQrczVtaTFaaWR6Y2U5RzA0M0RGdTR4S1FxUFRmMGRK?=
 =?utf-8?B?Y1YrV1hadmd3d2hPY1BZL1VvYUZ6Uk5PcC9jNVRHNDhyYjVkamNoVnArSVB5?=
 =?utf-8?B?WitpVUxncEJVME43SnBJTEI3Yi9WekVVbWs1b3RHL3o5RWNWVzhuWFFzT0tx?=
 =?utf-8?B?WXF1dGV6UjYzdG9YZk5QZmVyL1BIK1VPUjREaFM3SXpoYldIS2VzNGNwc0ZY?=
 =?utf-8?B?MVo1NklYV3A5MENvWHVHdkRuci9BSjh1Nk5UYTc5MzJGOVFpckFPaS9OT3dF?=
 =?utf-8?B?eU43SHI5T2s5UllkYUVjVjFTbmNPMVNNSURDamVIbDBabWIyMEJMRDBScHZM?=
 =?utf-8?B?WWRsaGdKSTRlWGc4cWNFb1VkeUxNTStVL01DRGMrLzJWZ1hRdzRPY29sTGg3?=
 =?utf-8?B?STZhTmg5VTd2bWJBeVlYZHV2b3pBb0lsNk9QQkhpRlVnNnNkWEsyNlg2Mk1l?=
 =?utf-8?B?VnZqNEdhNnRtZmZ0Y0lPa1pBTERQVWxucTFKbncyME1WSVhLSWo2Q1RFYk4x?=
 =?utf-8?B?OHBqK0E3NFpFblY1aWxER1IzRzRrZjZBb2FmNmVScXlEcTZwTFIwRHV1czZU?=
 =?utf-8?B?b2tHcVFpZVAxY3hKbEVOcW1rYnp3cWVxano2YUlueUlXTDN4QkpnNnF3TWYy?=
 =?utf-8?B?SGhQd2RIVWdZS1AzdVlXb1FrN1BYV1h2OVZkcXV5SmtGSUFqc2hQWlVMcnRY?=
 =?utf-8?B?bjBEV29SYlpGc2VSNmg5ODVDN3JOTnJFREhLbGlQajJ5UmQ2VSswbGxxMS9L?=
 =?utf-8?B?U2ZYemM1WFZ3Qkc5WmM5bU1hTFAreXVMU1pyRjl1VWgyNGNUV2xlTkttTDFV?=
 =?utf-8?B?YmVpNEpoQUhudWc1ZXE0b0NmSm15WGU0VVcvdzdUUnlFbDMzdWlOdFpmOU9p?=
 =?utf-8?B?L05iV0drTG1SUVFvaGZ4c3Q4cFRFZUcrYklzZVlaT0RxRWs3ZnMzUll6RlNX?=
 =?utf-8?B?R0ZCQmRkeUxJZVZPNWN4RldQUHJoQmpNQnBNOWh3eDVTZW0wczdsSGNNalFm?=
 =?utf-8?B?bkhwYjd0eUVKV1ZCaGZJVFk1L3lNNEJtZ1FVelIzVnRDaXFZY0RNZFVpa3pY?=
 =?utf-8?B?S2kxTFBnaGVKemJLV1QrSzI5Sk9Zb0ZHWjRndElpaVNibTJOeWVaZVJaeEJ5?=
 =?utf-8?B?N29ib2JuZjdpL0U0SU5hRjJ3WWJQSnM4ZERVaXpQMEJ0Q0IrZ2JVdEdrSE1S?=
 =?utf-8?B?MHVVVlROZTcyQVoxYmpubTArVXJUMWZPbHp1bC9UczdzZnBBak9rUkhDd3dz?=
 =?utf-8?B?UkNOWmlLdHFqT0RDRGV2WHUzdmdkaW1LeGhSdnJaNlJRakl3dUFSa2tSVElM?=
 =?utf-8?B?eTIvLy9nMThpRWJyK2VndDN6Q1BTUDlRQVdHSVJuN3k3WGpOOUFSMU5TVzNN?=
 =?utf-8?B?aGJHK0N6VnpTNG5iNkMrQ2hFOUN4ZmlVVFhsUUV3NnFSN01HaEU3ZkRMc2py?=
 =?utf-8?B?UitTSVVKemFseTJNd1krUlM0NU1GQnZUZExHQlhZcVBNeG1nZG9vVExoNlVK?=
 =?utf-8?B?QlRySzl1ZkR5YUFlalBQMytRaWZleFY2YnNGaXdCc0k1RFVRNk9lcUJDdWJP?=
 =?utf-8?B?WEkzL1M2Yld6Z0Rnd1hLdCtXdW1aUEZHbUtHN01KZmFKS3RiaytrelJYSXZ1?=
 =?utf-8?B?dzQxZzRtZ2cxN1ZreGk2MzNpS3Jqc1RjTkJWTHZuVmpWZGFNdW5yb0hnKzNY?=
 =?utf-8?B?RTlvWEZJZVlBaXJKaE83MkpBL05MNXNKZkFXdnlzQXRrMzdrbHFVU01mNDlh?=
 =?utf-8?Q?1wuKHZeNv9I6OWy4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c7cf228a-ab0a-472c-c5a4-08de4ee85332
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 19:01:27.0697 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vNVLMx0WEot1X9ksjMpTtAJhH5Zc4J9EGIdP/XzPXmbewDMn050cA3lUojjdl0/rqwUAyudJhGH0+TyYusDyjOQz+ZLzn+/sU67rmRfWUqM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4944
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


Sent v2 with required signatures.

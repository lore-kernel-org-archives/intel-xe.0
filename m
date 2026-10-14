Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8889FCC6B1A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 09:31:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4840E10E02D;
	Wed, 14 Oct 2026 09:30:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6108510E02D
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 09:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791970250; x=1823506250;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=80M4F32Gf7lS4MQFFrY9rJbVwkMcuc5JfLrwFJbmnig=;
 b=I5Zgetz9iCHjyAqVSOasHaQn2RURPpdvYu0Ll+0e9m9U+PFGYf4zryxY
 ptRvki8NE8AyUzWmi/4DSFCMR98ZMK2h5wDyLm7tqPrXtaY/IOh/OXd9U
 TcsmRWE/cJpRHXwVVZRzhAzezdcp1oJ7u5KJkNKTlOs5TIGetBEOCcI8Y
 SgO/t871WjNr7iZfDpA+Dg9iBnZABnGVT2PNKRRNIxwfGHBbtOouNLFoA
 reToOKNjy3hPU9khLOSU5SOKQq1faQo8s+q4HZVEBjwn8eBlMWr8fvWTZ
 v0oYv/EYVyvdEghC4ouBCCZo69K9VBgHrDgu15GZzSH6NQINOe5jrfhXR A==;
X-CSE-ConnectionGUID: yqzk1OgPSgWVIVnO38fr1w==
X-CSE-MsgGUID: Gszd2pBTSN2EkN3vM7E8pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="816963"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="816963"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 02:30:50 -0700
X-CSE-ConnectionGUID: sYOIxcMpSMqk+bBfykHvAg==
X-CSE-MsgGUID: AlcsC1nxTFOAM5YS4foJqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1827022"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 02:30:50 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 02:30:49 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 14 Oct 2026 02:30:49 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.61) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 02:30:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nuElel6ihW4wy0E9ISyFIDglnq9hpVYr6Oc2OZYAr8k5fu9+KCbQbTOIE7ApTXSMpBKvzQb2B7X6UxrQ57Eg4/7NjmoHSL6wI/p77R6SHPtdBDp1H6JCGOXurEG+YPPK/NBVXLmxSYmlFlq/lL+O4Je9dfn4Qx2PrLp6F8c81IzvlXNxakRofVO3xFY9Vg8e2xamJxMQdNDYJe1wN2/491d3275zTkNxyRRLK5wls4/Up4bobjQmY0j23NWDophM/CY+YOvzqGZHrvFtplMHoun5ZKugD01oW0OsxzNGpcuRNabIqG/+pLuBeCoXA/5VwHtaDm3w/YyxWiir119pPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Atbm2MMsr09WJhhuKqvodNf+y9b5/wBazdbG1j+iWF4=;
 b=pIcGu8fKVTnq/Ny5B38m6v2Qxah7rSMQpoSJQdZNGAPMbNUUvZ6Mw17IjELAnx8M2LRtklBkE4NBLqqEvkZVInEOYrj0evbMhz9tNRlNTwG/sws54H5EWdNDHD2Lp4bA1HD9HRmef2WN0wbgdm9HWsrX7P8ejHFx1d8q6jqvErKULMH9Zg7wImXlahCJ5cFFl1bAQO1X5WSR2a5RmkOZ/16PGoQpgdLC+gGrD1C8IcR1ffqj02vw0UG1HWG45M7yXKgyI5cJVI7PyzA6nUv8NItD4xt9bJ995Rrlyr8l1PriBVSmUNYgN5iUFXHAns6VXbj6quuII5cbjszkJn/qig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CO1PR11MB4770.namprd11.prod.outlook.com (2603:10b6:303:94::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.23; Wed, 14 Oct 2026 09:30:42 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%5]) with mapi id 15.21.0472.016; Wed, 14 Oct 2026
 09:30:42 +0000
Message-ID: <8a45e18c-4763-47cb-80af-bc62f23dfc11@intel.com>
Date: Wed, 14 Oct 2026 15:00:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/12] drm/xe/xe_ras: Report core compute errors using
 SIGID
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>, Badal Nilawar
 <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <daniele.ceraolospurio@intel.com>, <raag.jadav@intel.com>,
 <aravind.iddamsetty@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <arvind.yadav@intel.com>, <syed.abdul.muqthyar.ahmed@intel.com>,
 <nitin.r.gote@intel.com>, <pravalika.gurram@intel.com>
References: <20261009104602.1075405-14-badal.nilawar@intel.com>
 <20261009104602.1075405-24-badal.nilawar@intel.com>
 <4db5864f-c058-4609-a563-efcea4b5b4a5@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <4db5864f-c058-4609-a563-efcea4b5b4a5@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0117.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::20) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CO1PR11MB4770:EE_
X-MS-Office365-Filtering-Correlation-Id: 5be70295-79bd-4307-a274-08df29d5d0c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|11063799006|261009223027099003|56012099006|4143699003|261009221227099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: seYwdCbnhyIrCvvvWAF6nApOoZyQNyl/00O3kzZyuO79GsXIZlwdj+m8JaGldfuTzk1i/8tIk3/alu/nnKvgb4/sLqFOxvWvpTlcsNzQT2nNyCD+mawxpj2awFcRPkxgPGzAd/7xVY7DfNEykiwiWDexfVxJVOw0VAmR3Qk85fc2I3P9xa/aWdK1sFxCn52xpEsXTu2YcYr/yknhfRH/ifcIiA0UiAqp4iZvLn4rQ+GdTfDhvhWN0rlVcmbUou77SzhP7it/6RkBMoTvn1zjHbqzHUtS2mWP3ti3E7LjonI/VXnTTKYEEV/c9YbS2XNxxIpsXttXa7NeDGZXiiC9+z6CLoSNOClpEuInr3pTk/koJhR6bC8nRsuR8gAAfig8QQ02oHXPOqkjmw1zGf0hxbtN/RFF47iGdiUvBYFk3OHSLxcokOAEwO9Yz8qDfsF8gWho8U1VTKb3V5a48qG6nHGYK+uC9LEd+7axJL73YFQaoUut6ZpImeUsJ8xx8wNSKsbMHsahc94jBg/EOBCj1WZJs9HA+yoMbNID8Jt4oeodz/pNO+QK9yjZPhq6zecpk+2OllSr3Ac6qRRW0yFX/YutnxXtNJL7D6ajSGmCXWEh9liX1X8w90bDzVoFUF9G+Q8vlCeH+lLa4n/srSR5tNZ1qo0Tt2Shz6yIE35yYNQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(11063799006)(261009223027099003)(56012099006)(4143699003)(261009221227099003)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkZRUTFNM3lRdGR3ek8vZnVnY2ZWWE1tajM0R2NOZVF2dlRUemdld21KS2RM?=
 =?utf-8?B?MWNNVFJsTzJ2aGtTcjBjakFHbytublExcWV4SEMzUFdCcW9oRFBxMGFEd3ZD?=
 =?utf-8?B?QVpxemNUNVBZTFZTZ0dFeDFYcklnL0ZDYVFCYklrNlJXSnlBSGloOWtVamNH?=
 =?utf-8?B?VnN3TFJBSy9DdGFLODZqeTlISmhvVTFoRVB3a3RvZEpyRHdHVEt5OHQwYk1S?=
 =?utf-8?B?NzBpUXVDWSs4WUowdHpWRmtMYnpQc2FoR1NmYjRJU2dCSTllWjJtVkJ1T1NK?=
 =?utf-8?B?L21RRjlmckRiSW1NeTJaUUFXUFNSa0lUS0tXMFExcW93b0NOdjFyOHlzNS8y?=
 =?utf-8?B?V3JvSWZIYjlTTkZvUHhXZ3ErMVo4a1NCVkNxdm9zaENuVHRCMklSOXVvdkFR?=
 =?utf-8?B?NnNPMm9qS2RqaVQzMEJuZlM0amphL04rWDZDcTRycUpPTXUwU0c1d09VZ1hM?=
 =?utf-8?B?UnAxNG5vZlNFVzRBRXRCaUNDSUtoTDY0TmlUSVdPMERaZ2JheDg2QjkybERG?=
 =?utf-8?B?OERuZEQ1RkZQZitCWTVKb1A1TDBBK2lzVTloYnM1R0pKa2dRTTB0ODdkOFZO?=
 =?utf-8?B?eXp0OXdlclhWeUFRRzU0ajZiS0xyUlR3UnlUQUhhTUJOWENOL3VFVU9obXhj?=
 =?utf-8?B?MXNidmNPYm50Nk1RekdWTUtoLzVkeGR2d2Q0TUxZUmFvR3BjNVZwNXhPMlhH?=
 =?utf-8?B?MzRkM3gveVlrTHdEaGFvZUxEa2xZeE81T21jMG9vOEMyanBJcXlMWGdESGtw?=
 =?utf-8?B?MTFHeTU3R0VzNVB2SEYwVHgxYzJOZGRiNm8vWXpJNHlFOGRScm9HVUFrWGV3?=
 =?utf-8?B?VUFsSHRBYVZzbzd2L3llOEltdDNwMFkzWC84V1F4UENTQ0thbVdrNnFxaEhh?=
 =?utf-8?B?bE9zd3lTMFRZa053aHBYSGR0L2x0TWFMWHFpMmxyMGpHa00xWDB1S1dVV2xV?=
 =?utf-8?B?NXRzOEpDQkZSYnJya0dlSmZ5ZG9ZZGNqVlY2b3k4dzRUMWVKd09WRHJYaVh6?=
 =?utf-8?B?ektlRnM5eWc2SW9yY0I3OFpmVlhLbzJ0U2VsUlFCcW94aHRCWnhwMTVPS1J1?=
 =?utf-8?B?MzhnWVlkT1RrbzloSldWQlRsUHdBcXZnVWQxOVA0bGFSQ2JRMWFxdituMHFh?=
 =?utf-8?B?ckhtWjQvL3psek13WlVVMFc1VThoUEsveHRUTnZFakQ2MmlhN0VJYm9nUWVx?=
 =?utf-8?B?bkROV0NSSndPaDJLSzRNbUR3UGUvUnZRTlhzdWRiem9UNVhXODBYOWxScUVK?=
 =?utf-8?B?U1I1bm56clZwbkNGZUpFUlNGbzNCNmtKZ2NrUjI1NHVvOTdwUnd6U1BLWTdo?=
 =?utf-8?B?Zisxd2hWOTNpa0NSRVI1NEh1dDZyRXZPZk8rdVdmcUozV2RITnBoUWdrT3g0?=
 =?utf-8?B?M3VvdE9mLzFubDljQmVPaGJQODFVSzdCTnJGa1BXY255NmJJUmFBVzFaL293?=
 =?utf-8?B?MlR0NnFkRXgwU2JDTHk4Y2RxbDFpeEU1ZnFlNkRHQUN2ZlA2YmVaamJ4QVJJ?=
 =?utf-8?B?OXg5WTA5TlB1TXdNZkhPUm5iWTNxdjlIaGMyczhDRXBXd0FCUVB2ZHVxM0du?=
 =?utf-8?B?VDVEd1kvZzRzTjVGVFhhWnBkVlp5cGlid2JOSVkveTJIdldsL2lMMDFML1Zn?=
 =?utf-8?B?UzRBM2hHMFFLMjcvQjZNZ0hsRzh2bGIxeG1MSUFjemlpT3FpR250cTJOb1d1?=
 =?utf-8?B?MWRTbkJIeCsvb0oxR0twZ3VabjhBcFgyNzQ3Mkk0Qk04K3BHSlFRRndHK1E2?=
 =?utf-8?B?WnFVMjRNS1RXb01PdEx2QWpPaDBibHF0Myt6NnJYTVNVenNINUVSaWI2V1Q0?=
 =?utf-8?B?aGFmMXdGQlc2OVc3MCtwTkliaytKYXBwUFRHL2N2aWVLTDZJb09WbkVWUmNS?=
 =?utf-8?B?WVBhblUxWEpsdFFKM0R6Zml0UGVBSzkrVE9DQVRuYW11eU4vK0cyVSt4bWlC?=
 =?utf-8?B?bGVPMGYwcUpsM0pvZ2FpL2xPZzh2bExxU3FzRk9YaURhOTVFVmFEQ0s2aHFP?=
 =?utf-8?B?bzUzUzl0WnI5WU80MmlGamR6TkU5a2NtbzQvb1J6cWwwUi9iMWtMbTFKYkMy?=
 =?utf-8?B?RlZwaHBMRnluRFJ2UzMreVNackxDSmw1QU8rQnJLZEtDenB4dmNvcE9yTklk?=
 =?utf-8?B?VEZDRk10OU9uQTNNTENxbm90Rmc3MGlSQ2hzVTZNTFhZMVNUVEgvaHFNckxQ?=
 =?utf-8?B?ZWN0SWRvLzN0eUZTR2RuR2hveVdOVENSSHQvdm9MQU54NzVKektEajQ2eUE1?=
 =?utf-8?B?dUR1TENKTWNqSVBNbnp2THVKc28vRStxZTNyTFRPMjhTSHd5dFBrZTRaS0Fy?=
 =?utf-8?B?cklnNWJuTTNINWVSZkpFQkdnZG9SbTZmUUlFbjRLNmJpY1NQeUN2dz09?=
X-Exchange-RoutingPolicyChecked: XOqjdEJ9bDnUnKS8/GSlvV6n6o+eXcst1R2W6xSFjh/U1M/ggy4YUw+DgpvyNODue6depGjai9+TqE3YkAdBIqHt+Ybu70EgfI6vA7fH2v9lZxL1H536/PME95WEkONRog2nGnuvlyCuL1JZWdVjwUwQaE/rVvYSR741y6mzvdfou8/ekNa/W6otXBpOqoQyGUyj8D07lIRxMSXMNEe4QHM1pi/ASEgXiO2x7tlfFChowNxKN0NHfotdW54RU/km9uXv4p6LIO+HEHqzJTi+AgvucSkgTPhVzRscCiFvm4/A8tPlfSrvXsYNUbisj05VJQ3aGNJPgb8rGsJN43qYOg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5be70295-79bd-4307-a274-08df29d5d0c8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 09:30:42.1601 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2x1C14TeVM8D+MPr6MbfVI5TA5LIcMtFhxtfDuXpjgmQRZ02v/mo3aoBULtp3jbTVIILMpPNy2UVlW1WxSnkDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4770
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


On 14-10-2026 14:58, Mallesh, Koujalagi wrote:
>
> On 09-10-2026 04:16 pm, Badal Nilawar wrote:
>> Use xe_log_* helpers to report core compute errors.
>>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> LGTM,
> Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com> 


The previous revision review comments need to be addressed. We are not 
seeing SIGID logs for all errors.
Please do not merge this without that fix.

Thanks
Riana

>> Cc: Riana Tauro <riana.tauro@intel.com>
>> ---
>> v2:
>>    - Pass RAS firmware reported severity to xe_log
>> ---
>>   drivers/gpu/drm/xe/xe_ras.c | 12 +++++++++---
>>   1 file changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>> index 8ed4a6992ef1..6647300c7f17 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -332,21 +332,27 @@ static void ras_send_error_event(struct 
>> xe_device *xe, u8 severity, u8 component
>>       xe_drm_ras_event(xe, drm_component, drm_severity, response.value);
>>   }
>>   -static u8 handle_core_compute_errors(struct xe_ras_error_array *arr)
>> +static u8 handle_core_compute_errors(struct xe_device *xe, struct 
>> xe_ras_error_array *arr)
>>   {
>>       struct xe_ras_compute_error *error_info = (void *)arr->details;
>> +    u8 cper_sev = ras_sev_to_cper_sev(arr->counter.common.severity);
>>       u8 uncorr_type;
>>         uncorr_type = FIELD_GET(CORE_COMPUTE_UNCORR_TYPE, 
>> error_info->log_header);
>>         /* Request a reset if error is global */
>> -    if (uncorr_type == GLOBAL_UNCORR_ERROR)
>> +    if (uncorr_type == GLOBAL_UNCORR_ERROR) {
>> +        xe_log_comp(xe, cper_sev, CORE_COMPUTE, &arr->counter, 
>> sizeof(arr->counter),
>> +                "Global uncorrectable error detected\n");
>>           return XE_RAS_RECOVERY_ACTION_RESET;
>> +    }
>>         /*
>>        * No action needed for other errors.
>>        * Local errors are recovered using an engine reset by GuC.
>>        */
>> +    xe_log_comp(xe, cper_sev, CORE_COMPUTE, &arr->counter, 
>> sizeof(arr->counter),
>> +            "Other compute errors\n");
>>       return XE_RAS_RECOVERY_ACTION_RECOVERED;
>>   }
>>   @@ -592,7 +598,7 @@ enum xe_ras_recovery_action 
>> xe_ras_process_errors(struct xe_device *xe)
>>                 switch (component) {
>>               case XE_RAS_COMP_CORE_COMPUTE:
>> -                action = handle_core_compute_errors(arr);
>> +                action = handle_core_compute_errors(xe, arr);
>>                   break;
>>               case XE_RAS_COMP_SOC_INTERNAL:
>>                   action = handle_soc_internal_errors(xe, arr);

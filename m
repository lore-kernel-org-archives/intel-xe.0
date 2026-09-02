Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10B15C624D4
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 19:02:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE1DC10E4DF;
	Wed,  2 Sep 2026 19:02:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="icYg6ZwO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8231210E4DF
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 19:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788375759; x=1819911759;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gjGbgeb/6WLOGQpIGRnBuj3tzws4w8dnyOD3Y7eeWWg=;
 b=icYg6ZwOP2ErOqzBz48efgrxxcin8Uv6X9IKaCJrpWfuoutB25bTNefF
 uCBT98d/JDP7bDa6vDKU/KUMwr8SbXdvBja5y5KwneMEgYNSUko0TUE2B
 8zcTxn0Ca5+lfN9hWR55V5ItfTwGLrKFFniEhFR57wgQNnWwMneLH2UEF
 Ox+IEBgloXT32gwNL72mdDhPjBHm4/j9AaWDpMIpQyMN1TOWe4jB3afkB
 riheuI5oxt+bNzaN94hErFf7dHWiVzWyTl/VwVyU3A0oXbX+9p7jABWP9
 WL0AFz+p1hGJt1xalYdiDTMCMFLB/533FCEvevoBcSnehUdJEtpRufvUd w==;
X-CSE-ConnectionGUID: v1n9iZB5QI+AYU9Rvw3clg==
X-CSE-MsgGUID: mzjLMk4USIG6Ptc2PZc3GA==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="92713555"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="92713555"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 12:02:36 -0700
X-CSE-ConnectionGUID: d0EFnvtrRjeXzOFAkb8WZQ==
X-CSE-MsgGUID: JlOPI/rUQLaAzuDSu8gndw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="268171731"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 12:02:35 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 12:02:35 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 12:02:35 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.71) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 12:02:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hLOEXJUNrKCTEequMFKADQY9bovaFKjGJqymiGQNQidmoLQrKiFqamSdCIO2L2i0HH8XTzGq1lGBbcb1VeU81KF+yAW0DBJQnw2X04EeJRnx9ugtvKQlp56hL8j2IZCOUts7hl4NejiKsPtCe2Qx8w72P7lvASCcgvdT/pFz18D7q9xzYz8l2nbUy/ruGlOoZ947AhFAVuWUpHKaggzxsCZ73cxDzmyMph2/FAP6iM7uZP0MYq5jJXL7WLpIUaZbRbM/chcaBuMrsurBVNp8Qw3bA7EfvPyhWTnvUg01q896ziKpnyZmjaynSZgKjcyBv5sv1mfBeMbze7zReOwDyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K9HWUsSSx4pSbr+gWRDNAiz5ovy/wNAQmZc1SEZWr+4=;
 b=yspG230G+Tjpt7eIymOt3P5FDs5+d2fGwcw/4Zy4WheagdYYGftvoNRewzvYKg7xkJCSGRnr+TsTqU+8LmKzNkCsWHPgszt3kzRdfrbqE5R5N+NGZhoJZc4FykYK0b76LXNZ0ePV9xDTzLWdxx84MVDmhBDApD04KC5ZopLvG87QRrcP3XQFBO8slXp5YSs9h2AVIOpQKf3BvP2Zcdsf13mGnCM3CkYhBhjLdAhwp0eDpXzHmpYT02sxqRJ6vEuXyA90OSjGBkTRv9e3hvy6d8PdRLgOj53RrdBS1jeRdQTvx4CuB7li71o+NwjeJMcEFKzgG8K2YftLVm10tzYWUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by MW4PR11MB6888.namprd11.prod.outlook.com (2603:10b6:303:22d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 19:02:32 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0382.007; Wed, 2 Sep 2026
 19:02:31 +0000
Date: Wed, 2 Sep 2026 12:02:29 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <daniele.ceraolospurio@intel.com>,
 <aravind.iddamsetty@intel.com>, <mallesh.koujalagi@intel.com>,
 <alan.previn.teres.alexis@intel.com>, <julia.filipchuk@intel.com>
Subject: Re: [PATCH v2 4/5] drm/xe/guc: Report major GuC failures using SIGID
Message-ID: <aphyxQSVOtd+C5Wa@soc-5CG1426VCC.clients.intel.com>
References: <20260901211204.131972-7-umesh.nerlige.ramappa@intel.com>
 <20260901211204.131972-11-umesh.nerlige.ramappa@intel.com>
 <00e3acce-3f21-4aad-a5d8-749e26bf7b2d@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <00e3acce-3f21-4aad-a5d8-749e26bf7b2d@intel.com>
X-ClientProxiedBy: MW4PR03CA0031.namprd03.prod.outlook.com
 (2603:10b6:303:8e::6) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|MW4PR11MB6888:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c0e5009-5e05-417c-81c5-08df0924bd9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|6133799003|22082099003|18002099003|56012099006|10067099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: jAM/sijmF6y+OxrTsvwq0Px0HnIhZkgVFu0XkKx19aW1WNaEPm17srkBgeWjkEaGlKdLdGPa8uYMkJZQ5cBXGr0wtiVn1RT8QkUbHC/stvJrpDpH1gY19BJ7WcIwPVB9xMAGIOh3H7YOdilw48bJOfEWVhVXjfontaHI3W4rRdTGaQSHIb0I5ZLkZYhBgdQrg3V+sfthQE/+BkPti8+MwXNLF6eiRDLWAHOLcZGuGJmAwV8BZCkyqV3fc8wdOw8iltxovhDuysZDmfEguoSZ7yuqh3QLOKeT0OstOueR4pmBmeGfo0T877tm6AvYEf6hO//ahvtNBeLjRRliMxuzcBYwrgv2qG++nZcONX4Y6s5N99bMODfLXaZD4hk+vf7IBBvzAPsqmTn2rhnUHaXoPmxdaqucK+2vQNeTrSbJ/Bhbnzwui32sVcBf0MCCDonHQd9RF9AviDtA984ne+4r+uFCRiqdrBkB4tprz7eFXkuhTIaYv2NYueCne73ny6b1DUFF4gdYtd42E3zig9NFlEVM3mVzwzjB4AwFADcfTPzWGVXsZgl0/nlo5audQ0ZuywxFCkGnWv4mkKG8YIGoMfJ3zb6JW4oOslFe7UzIQnzv4lCcCC2r1tWqX0jUOK2o71HvAftRskNlsdxIjBVbfs97xozKQj+HE/Nju5eG3Ss=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(6133799003)(22082099003)(18002099003)(56012099006)(10067099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXRYUUFQbXh0azYwcy94eFFyRW9wdS8vbVY4ME1Cbml2YVRSc2JNT1hvSkVw?=
 =?utf-8?B?U0NSb0hua25Cb1dJTzRlWUQ4SUdjbUpYZjQ1ak1MM01VTXJpaXRJb0VPQnlo?=
 =?utf-8?B?QTBLS1Y2YXFHdDM2cEVZaTBxZ3N6MVVJbjlqT1lCS0czd1gxSHVCN0Q1bElo?=
 =?utf-8?B?UXV1RmxpcFZHMUdScXNGamI0TVdKSUdMVDE5SGxPUjBTOCs5UEo4NmNDZFFi?=
 =?utf-8?B?V1JLYVhhYVZCTGc4NVYrZklyQWVReDV4SmlXRTBTeHd4V05oT05WK3BlelJM?=
 =?utf-8?B?RVF1aW41WVU2YlNQd2p5V0dsQ3I4dHB4YjlRWE4reVlwREtJWFpHVmlkblY5?=
 =?utf-8?B?Ykthd0xCM1dCNGxGT3RHb2t3OWlIMGMyU1luR0tNMVVtV2p6RzlpS2FCUU5v?=
 =?utf-8?B?QnQ2bE83SzZXZDZmaHAyNnJzalVMN3VnNnBucUdpazBSaC8wbEdqd2ExRlha?=
 =?utf-8?B?TDBkR1picng0WHQ4REhCcnEvc2wxU2prT2FjaDFVa3BpcFU2UmNrUzZUMWlC?=
 =?utf-8?B?MWNBRjdWZDZWS1pOa3JtaVZsemJDM1FNVitFMUYvbHdqVElBUGcvdGd1MExZ?=
 =?utf-8?B?RExtNmo4NDY0K2NhMUtnQlIyMC9wUTd0cHFuS3poS0d2NXNtRkpTYVdBclVC?=
 =?utf-8?B?ZEhETEx5aWdHRmx1bVZKSW9US29TaTRHWHg3a1VLa09EdDZSMTFYWkxnazFl?=
 =?utf-8?B?SjdyY2JCVVpZcXV4Um9zQ1FQMzNleUROOVQ0OFA2QkNyWkJlSE9pdkpydmtR?=
 =?utf-8?B?bVBDU09sa21VTTByeWREYkMwbUd2aHFHYnFtMG8wQTUydU1XSUVFd1plUlMy?=
 =?utf-8?B?aEJPTExVY0psSTR3MDZYbU54Q2ZHeFpHcDFSWktuTUxEZTdVM1pvTS8yUXhV?=
 =?utf-8?B?TUhIRzJxeTc2Wnp0SDFMVXl6d2RibENiaHlGeGlSZE5rQW56eTBoVWl0YXJQ?=
 =?utf-8?B?RTBEZklBeDE2WGsreDlqOVUxSThQNlZuNVgvMmNndWg5R3ZzckJMdTVTUHFi?=
 =?utf-8?B?cTZHNmtBUmNhSTJBS0duV2dQemsvTStJTG1OSWZ2NlZZRlhETm9XVGYrUzAv?=
 =?utf-8?B?d0dCR0pqSUtvYWtLYjgvVzVxRENlMUlkRHBWK0RPbG5oUkV1YjlkM0xLdjdG?=
 =?utf-8?B?b3NMTXVTREQ3OFBKQzJaNmFPRDQ3SzZubi93encrbkNjelpybUY3cG1TRmJa?=
 =?utf-8?B?MjVWVjVZWVJnRkk3Rm5PN1ZrOFZaNUdwUlBqUlJBT3REcGFnOGcwcTk4bDM3?=
 =?utf-8?B?aHV5Qlp2VEo1NXhjaHcrNHZONEIzNXhWd0Z1MlFsdWRWbUJFcWJaL05YQ25K?=
 =?utf-8?B?V1hpS3RtNGxLOUJBQmRBaC83cXBLKzU5eUJtamkzb20xaTdJVUNUV0IyajVI?=
 =?utf-8?B?WFVXK29qTmJBNVBMYkNPVUdSc1dFaVJqSWNIc1gzdmswNHNKZmpaaThQc0p2?=
 =?utf-8?B?NW56UnRjVFVyWGVaT0cvVmpMZXl3dFNNMmN3UVR6eUdIKzR6QklxcGk4QkQy?=
 =?utf-8?B?M0VBdGZNYUY3clJKc0lGbVFnUXRseTlQa0ZvZC9aQlJwbFRVOWVaWUpEY0Rz?=
 =?utf-8?B?VVNXc09IYWRmQjlWZVRJL0Y3Y0ZFcVhUSGxmeU9iVnl4V1F0WTVYSFpoZDVL?=
 =?utf-8?B?OVRmcFllWUVqZnJyN0pBSjFqTkt6TE9WYlU0cWo5a3IwdTVpV0FyTnV6b1dH?=
 =?utf-8?B?YjhDSUwrQTdIRzBVTVpJbzU4QU5LS0dmKy9mdFc1OVZlbWg0ZGFrdU9wMkxX?=
 =?utf-8?B?bmg0TGI2YzUvc1VNdTZ5TzE5dXNEcy9wUWErSy9mK3kzaGU5KzI4UzVVdkha?=
 =?utf-8?B?RHg3ajVEd3ArbTJ5UnI2aEJuSGZjNFBvOWZpaGdncEM2dmFFZDJSRTRXYjI5?=
 =?utf-8?B?QWxZL2pjcVNqOWx0RDhla2x2Y3ZSdkpKRTA5Y2laS1ROUXVJUEpKdFN2dy8v?=
 =?utf-8?B?cEt3ZmVpN1hnQlhQVHpWRTRqaFJvaGh0SjFsSWdMYzMrSXI5UzcyMG5VWS83?=
 =?utf-8?B?SUQ3VkNONXJLOHduWlhwK2k5S2tZVkFXWndSN1U0Sm95emE5UVJIS1V1NURF?=
 =?utf-8?B?bEkzaHZ0eFlIQklleVpSMmV1VXQvRUtrTWpkdHZmOEd1WkdIck4vc3pUMmo5?=
 =?utf-8?B?KzZqUGlIL1AyZkJQNWl1US9ZWHY1bXhtTXMyK25uaUNWemlvSUJkZEc2YTR0?=
 =?utf-8?B?VGFRdUJFZHpVY2prbUFCRzFCMW1OKzFXbG5IMFNObHl0TTIrZEpUSk1Eczdh?=
 =?utf-8?B?RzBqbjVFYTlsQkZhS0c4UVJtZnlXMms0a25BVWxad1dzSWFTSWw2NWJra05K?=
 =?utf-8?B?MkhnNGtkUWtHWGVueXV0azlZZlVudVZxUkVva2h3MXVJbjljcXZlaDNuL0hm?=
 =?utf-8?Q?ETtBzdPL5fbBleLeXSyCzVTm550REWytoHwH1?=
X-Exchange-RoutingPolicyChecked: Lv0negEJNah4khK77gOhxO8yPhUby08/VllAhEyiOiD4mkhMkQQfcv9kpcynqRDVGRb8BlhaXPVukSiMAPEGqP9IXAY9Y0ZkDwaFAMUdbSZY4ANx/a17cXDfwFAH9/2LAqlsLvHFszZ4Ewsn3/YTgiVJaOfwvnGaTbmfdkqNpBXNBL6491UgasT6xrVysJeIbTm3uWmbyFKMlz6A11TUhsoXaG0BbAunopR8xmAvpng6Ag3QCQ4lpF7eMu1a8XQfeLVez0ItLXh4NBXq4R/9kfELYCfqCmbrzwe+nu9e7yNX/GcTvSG/GMAPg0lHR5Ymxl0OLqt4NeLGahm5XL0+zw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c0e5009-5e05-417c-81c5-08df0924bd9f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 19:02:31.7406 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eHR8NSmA6a20LDQ4ZDdH+mfzxvyWwqDfVJ9ZDevehrVHouUeOglbcKDlMfmtkJbC+bxvrQbuWuIqw1N3wh7ioqAvux2+Y26Bdeb+cSd1nNo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6888
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

On Wed, Sep 02, 2026 at 04:33:52PM +0200, Michal Wajdeczko wrote:
>
>
>On 9/1/2026 11:12 PM, Umesh Nerlige Ramappa wrote:
>> From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>
>> Convert errors during critical GuC flows (init, load, reset, suspend)
>> to use the xe_log_err() helper.
>> While at it, simplify the error log for the GuC load failure to use the
>> cached frequency values instead of fetching them again.
>>
>> v2: split guc_load_done changes to their own patch, use available ret
>> value for reset errors (Michal)
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> Cc: Alan Previn Teres Alexis <alan.previn.teres.alexis@intel.com>
>> Cc: Julia Filipchuk <julia.filipchuk@intel.com>
>> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_guc.c | 19 ++++++++++---------
>>  1 file changed, 10 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index 5285d4cecbc8..d0ddaaf35274 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -777,7 +777,7 @@ int xe_guc_init_noalloc(struct xe_guc *guc)
>>  	return 0;
>>
>>  out:
>> -	xe_gt_err(gt, "GuC init failed with %pe\n", ERR_PTR(ret));
>> +	xe_log_err(gt, GUC, ret, "GuC init failed\n");
>
>note that there will be already "GUC: " prefix in the message,
>so maybe just:
>
>	"Initialization error\n"
>
>>  	return ret;
>>  }
>>
>> @@ -845,7 +845,7 @@ int xe_guc_init(struct xe_guc *guc)
>>  	return 0;
>>
>>  out:
>> -	xe_gt_err(gt, "GuC init failed with %pe\n", ERR_PTR(ret));
>> +	xe_log_err(gt, GUC, ret, "GuC init failed\n");
>
>ditto
>
>>  	return ret;
>>  }
>>
>> @@ -998,15 +998,16 @@ int xe_guc_reset(struct xe_guc *guc)
>>
>>  	ret = xe_mmio_wait32(mmio, GDRST, GRDOM_GUC, 0, 5000, &gdrst, false);
>>  	if (ret) {
>> -		xe_gt_err(gt, "GuC reset timed out, GDRST=%#x\n", gdrst);
>> +		xe_log_err(gt, GUC, ret, "GuC reset timed out, GDRST=%#x\n", gdrst);
>
>note that there will be already "GUC: " prefix in the message,
>so maybe just:
>
>	"Reset timeout, GDRST=%#x\n"
>
>>  		goto err_out;
>>  	}
>>
>>  	guc_status = xe_mmio_read32(mmio, GUC_STATUS);
>>  	if (!(guc_status & GS_MIA_IN_RESET)) {
>> -		xe_gt_err(gt, "GuC status: %#x, MIA core expected to be in reset\n",
>> -			  guc_status);
>>  		ret = -EIO;
>> +		xe_log_err(gt, GUC, ret,
>> +			   "GuC status: %#x, MIA core expected to be in reset\n",
>> +			   guc_status);
>
>note that there will be already "GUC: " prefix in the message,
>so maybe just:
>
>	"MIA core not in reset, GUC_STATUS=%#x\n"
>
>>  		goto err_out;
>>  	}
>>
>> @@ -1224,9 +1225,9 @@ static int guc_wait_ucode(struct xe_guc *guc)
>>  	cur_freq = xe_guc_pc_get_cur_freq_fw(guc_pc);
>>
>>  	if (ret || load_result) {
>> -		xe_gt_err(gt, "load failed: status = 0x%08X, time = %lldms, freq = %dMHz (req %dMHz)\n",
>> -			  status, delta_ms, xe_guc_pc_get_act_freq(guc_pc),
>> -			  xe_guc_pc_get_cur_freq_fw(guc_pc));
>> +		xe_log_err(gt, GUC, ret ?: load_result,
>> +			   "load failed: status = 0x%08X, time = %lldms, freq = %dMHz (req %dMHz)\n",
>
>as "status" is a register dump, maybe use the same naming as before:
>
>	"Load failed, GUC_STATUS=%#x
>
>> +			   status, delta_ms, act_freq, cur_freq);
>>  		print_load_status_err(gt, status);
>
>do we want to use xe_log_info() here ^^^ to get a better view?

maybe. Currently print_load_status_err uses xe_gt_err and I am not sure 
changing it to xe_log_info will preserve the behavior. I mean, what if 
info levels are filtered out?

>then maybe above xe_log() could be split and keep only GUC_STATUS
>and move rest (freq) to other logs?

looks like print_load_status_err is just decoding the status, so maybe 
we should not put the freq related stuff into it.

Thanks,
Umesh

>
>>
>>  		return ret ?: load_result;
>> @@ -1463,7 +1464,7 @@ int xe_guc_suspend(struct xe_guc *guc)
>>
>>  	ret = xe_guc_softreset(guc);
>>  	if (ret) {
>> -		xe_gt_err(gt, "GuC suspend failed: %pe\n", ERR_PTR(ret));
>> +		xe_log_err(gt, GUC, ret, "GuC suspend failed\n");
>
>note that there will be already "GUC: " prefix in the message,
>so maybe just:
>
>	"Suspend aborted\n"
>
>>  		return ret;
>>  	}
>>
>

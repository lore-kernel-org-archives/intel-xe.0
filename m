Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4261C28B30
	for <intel-xe@archiver.kernel.org>; Thu, 20 Mar 2025 14:27:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AA1C10E623;
	Thu, 20 Mar 2025 14:27:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OJBCuG7X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CC8910E623
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Mar 2025 14:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742480873; x=1774016873;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=puC2BmAoXy1JHfLeQnYWF5p+6y870za96w9mEZTuUw8=;
 b=OJBCuG7XDpUXuxgVUYcM4HD0h8mONP6qIzEtUr8bAbZ73W9q1m/VaWEt
 NC9ZlvCRinM1dPKsadZC9mXr/b3NUzOiTAyBuZVE8dTtYKRtrFyPbIp8T
 Kea7BEv+tQQV307sWyXA0XHzisMk4x+b296PjMGUQ3NTMPhsCd9n4BSxA
 YcpWM3v2Pn16wp1Ydy75p3tXzY3hN+h9sUz9dr3P4e1E4t6YDTnonUBmw
 czkybSh/+oHXe573T8fAGhPsj/LMa9ep2TDMcqa/RtvVmjPXh0mjC411y
 qJ68AgBZMxXRdew3lS2il8CvYdju6JBiclr97Tfe8N4KjsJdg4pphgfpu g==;
X-CSE-ConnectionGUID: +o5LZd7nQxqYnDtF3Em9XA==
X-CSE-MsgGUID: HHJ/Y9l8Qi6BF9fpCKCNNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="42959778"
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; d="scan'208";a="42959778"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 07:27:52 -0700
X-CSE-ConnectionGUID: eXN6mg2nRemREhRNCRVCYQ==
X-CSE-MsgGUID: HaCCyBEpTSiuUF4GWc4l2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; d="scan'208";a="127948732"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Mar 2025 07:27:52 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 20 Mar 2025 07:27:52 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 20 Mar 2025 07:27:52 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Mar 2025 07:27:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LjBPPWdxpVTH+5SJesBxId4hBi0MgbpDaaff+zmPDYDOXIb314gmAne9ZKGInWKS5j/X1Qb24NGXfxJH4CWIPrLRYgItd5YOdkNpILi5GElyNCQt8eTw8KPhHGm5nxWGlWXX53y+5Qz9HIRFyylJLpwKMi+iOvblsY2l5UNjzKEXbshErCakRR8qELenwQiGYbLeeQHhcfQr+BpwjtU+HGkUrB5qtbI8x1f3rrq1jWKGfKqVCC7bbfL10QGo+xBJYYvaLE3vF3YbLasCd2dllJ6uQ4XZ22EevjF5aiInYI6jQpIN3DjhKVKpFMpevMPMqOcr4Co3HnQDUnDctDHcGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IKeXf3+LnqeJfUtTqOX0P6qxK57c6vFOuTcOQWC+93A=;
 b=uPHGqEYy8S+i9KrdodhM17dsEkb3HH2ZG7rHYyFHo8NevJTwt02XEO3tGBpqDjSp1JJAtmoj57yrS4RFoKfa80rbqoy+JXJE/zdLKjKvXJ0unsrKcrgzurZyPnC2rDtd9tXIGxDvwpDWjcCZO+8r8rWI4hzqT9IwOkh0HMjnUTL2m1C5AnyySvAu6IfOg13vKeNfrQrTuqXN1FSmc7JroE4pIajJ0LUObYNIb/pj9WY/4YYSOMmG+p1PTFPs8tVBwQI9o8NqqbpiIztzQceVHX8rLuvqnARa4/XByEELdoq9WT2OHZWiiYn5XZpwNdq+6lyvWl6C+jfeuLRGOOtH6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by MN6PR11MB8217.namprd11.prod.outlook.com (2603:10b6:208:47d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Thu, 20 Mar
 2025 14:27:49 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%5]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 14:27:49 +0000
Message-ID: <495d642b-22bb-42eb-9534-d81f59465d15@intel.com>
Date: Thu, 20 Mar 2025 10:27:46 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/guc: Disable lite restore for MTL
To: Kenneth Graunke <kenneth@whitecape.org>, <intel-xe@lists.freedesktop.org>, 
 John Harrison <john.c.harrison@intel.com>
CC: Julia Filipchuk <julia.filipchuk@intel.com>
References: <20250319172825.3334036-1-zhanjun.dong@intel.com>
 <76f06baa-59b2-4d6a-87e5-a89a2d94904b@intel.com>
 <6142361.lOV4Wx5bFT@imeretto>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <6142361.lOV4Wx5bFT@imeretto>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0271.namprd04.prod.outlook.com
 (2603:10b6:303:89::6) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|MN6PR11MB8217:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f47c76f-9815-477b-236a-08dd67bb6428
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q0ZmQXpIU1NnNVEvVnBYemhuNWRvQXd0ZEVNcWFBakE3Ly9sTUVnVHIxbEhj?=
 =?utf-8?B?NkxKRkY2M3Avb3M2QitYSWtPUlRmOHNRWFFsdHlsdkRBVGNybGVlcXNIVmM1?=
 =?utf-8?B?TERUNGJPNlRHaUErQU54R0RHdmF0aWpEbjRGYkV0YWtNZG13UnlIc3k3UG5S?=
 =?utf-8?B?azFKWk0xODc0aU0yTEI4eE5adFJDbldvckpZRnRRemh5Qm5LYlhzOVNsNlJx?=
 =?utf-8?B?UW9ObmtjNUZwdmJ0dDFoMy9LZjNUOFB5VmNUT1Q1alZ3dWQ1M2xjdmdOcWla?=
 =?utf-8?B?bURYUDN2REhtTUk5S09Cd0IrUHZyYng1eTVwaUo0eklQS0Q2bk1TeDNjUWxW?=
 =?utf-8?B?RDRYTUQwSVgxSU4vZURRMkYvYXc3T01QYjdjZ0RENnEzRzBROVg1cFZkWkZs?=
 =?utf-8?B?RGQzNjEwQ3JDNmVpaWw4WnBRV3V6eCtmV3l2VUk3RVB4MUJCeGMxK05Kb1pK?=
 =?utf-8?B?VDBWMUUvYU1mejlmVStqVkl5blB3QlduVC9SQ095OTZZdTVFb0N6N1ZTblZ4?=
 =?utf-8?B?aThkRzFOSmNwanBwM2xxY2liMEZrVThvUkZLbENlZkJEd3hFQXhwTDRVM01j?=
 =?utf-8?B?eWxkUS9KUWVoOUtJTmpUSU5ha2J1Z0xZNUU1MGdaaDFVZmhmZHZhWVREVG1K?=
 =?utf-8?B?TytTNXFnQ0xKcnlweUlTU1orb0gzV0VOTWNHRFl0YjZEc015Y1RtVXl3cUgv?=
 =?utf-8?B?NGxtNUZDVzdmTkprUkEzbDMxS1JnV2xVM25LS0NXZU9LT0NuRVF5R3d1TFB2?=
 =?utf-8?B?UHZtM2NSbDVTNUVxRFJ0ZWJEY2tNRm02ZEw3STRFMU1GRDhYT2gzVDhwQTM1?=
 =?utf-8?B?MTJZU0hkS2d0TFFaUWQ1VzdFakFJUDlEbHZ6VGQvbVR2NDBDVFUwdWlUUGdF?=
 =?utf-8?B?R28wcEQ2VVYrM2RvT0dHaUJucGpxZEQvanVUdndBOHJQNWd1VGxLOFFQWThC?=
 =?utf-8?B?amZReTJWdW14dnNLS05ibk9BNkVXK2FhamZZdTlBbVNNcEVZYlNXWkM4OS84?=
 =?utf-8?B?SU1CTWNjVU9Vb0pYbUNaWldmc09OcTJ4OFV1Rmh3bTdmQ1dmTHpYZ1NiKzJa?=
 =?utf-8?B?UUlOdzV0MkxxZG14RHkraFV5OEVDMDZPc0k3UUNqNG4xVzlGQUplelkwRHND?=
 =?utf-8?B?UTBEZCtycmp6TkhpLy9ZMDg4OGpFNWtLbmwvdi8vTGdNNzhUWjU0UWJjZVNh?=
 =?utf-8?B?MDJsc0g2UzNJd2ZQdkk4VkNuaXBqRmRDNEh2eE1HTStwS3l5czBsTXF3QUZJ?=
 =?utf-8?B?SWNnWnVYeERsMGdsR2c1U1JkV1c2Ri9PRU5DNVY1bDlueG9uQ2duc1czTmli?=
 =?utf-8?B?Q28zTUlXZjdNb1pHYm91OXIxZGFQNzU1RnliNnpBa2dteEZlK2xvU2dIL1Q1?=
 =?utf-8?B?TVVCbktmSEo0QXI4K3lDTkFnWWU4bll5VjcxdUs2bVlIbG9tNTNUUEUybHRk?=
 =?utf-8?B?OTFNRzVIUURWOThHb0dLdXZ5VlUwcEcrSXdsSk52ZU9EZFNXTFhIVlRwZFRl?=
 =?utf-8?B?NVJHZFA5V3haWCtuM2ttK2VQUEhsM3gwdC9rZ2N0T2ZMQ0JoR2lvVFBKa3JZ?=
 =?utf-8?B?ZmNWaHYzVFJSUUNCZ0E3bkFpd3AzZU9vV293TDNFRm9uS1Ftek16RUxVUFBh?=
 =?utf-8?B?RkNWQVdLOERQL2VqSldCRGVFVkVXQ2k2MVhrVVFja3lwS25RQWwvd0dMYTNE?=
 =?utf-8?B?Z0hYSEhwTEIwWkYxRys3b0FLVW1tSWMrcmpZMGFHckNXT2JvNXZqZm81bHVI?=
 =?utf-8?B?OTA1SWpTZFpoNUpJZ2pTcm01Z3VwbU11T1ZscG9vS3d1Z3R2S0FxL2pmbEp5?=
 =?utf-8?B?azRKQjlWTFN2VVFLQTFHUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTd2cVJiUGZOK2dVRzVKVWRoODY2WDRtMnJUcGhiNWwvVXh0eURVNkprNjFM?=
 =?utf-8?B?TlNhTmRZY2Rybm1wWEhTbml6U0FmY0kvbmdqV2d6bzFnYldzY0wvVzVkUWlq?=
 =?utf-8?B?ekhJVXBVeDdxbVhVTitQYlJJZ0Y1SWRXY01iWVlGZk9nRjc1VW5IYVdFLzhj?=
 =?utf-8?B?cGMwUlJxV1ZQcTlwMWJHSklVTWRoTEViWWpreE5tWVFYNHRLMWhlbFZwQmVB?=
 =?utf-8?B?bVVqQ0dadVRaTjBmcFQ4NnNPc3hDNjZCR1pvcURBN0k5aGVkYktVMVRVb09h?=
 =?utf-8?B?NS8vYU5Bd1A3OFRtM2R6ZXQycFRtL3ZrVHkwSThadkRwSnJ2ZHMxcVQwVFFM?=
 =?utf-8?B?aVkvRk9JeEJKaXdRejZPaGpsaXNibUVSR1hNQVdDWSt4N3JoTU9XQ2cxOEwv?=
 =?utf-8?B?dzhLbzlFNUxPQjNqRjRHOVZkWXBZL0V5R2pib0J5c1ZNVFVGOHduZWFoZitt?=
 =?utf-8?B?ZWFpRjRTU1BodjdEblRqYzU4MlVHOE4vSm9VZ3J6WFpvSVRFL3pNcEovSnJM?=
 =?utf-8?B?TnovaXJkZjJ1K08wbTFQcmN1VDZLQUcxY0tRMCtMYVVkM3JMY0lDRWZnUGli?=
 =?utf-8?B?c0o4K2Uxc2llT202U0xkYzRWekR5UDFJMzk2NElIYXZWcGxKY285RG1oU3Y3?=
 =?utf-8?B?MnNVek9pRjdlVjBUT3orTXJKanZLaGNQTmkzaGJUMkhhbGgzQnc2NHNiRnEx?=
 =?utf-8?B?ay85eURySTRiSGRhOWpGRFg2TGQ4aWdpZytnZHhPbDlxMVMzNEFsYjk3MFMv?=
 =?utf-8?B?NWV4eFVqaXZUSXVGTUJoUFZvNm1lLzY4OHVUd3lEL1hubW80cGcrTElKR2d0?=
 =?utf-8?B?bElEOXd3NEozUzJHaTJoQTJCbExaWW8vZmFEOFlscUNSM3hIeDF3SithMFRj?=
 =?utf-8?B?R0pRSElyUExLSUdxN3lmbmFPVW9KRzZUYk10eHVsSjA3VGRwZ1doU2hQd0tT?=
 =?utf-8?B?SVY0cW1lS3RnMkIyaHU0L29taTRXNzcwVlI2a0cwZFlSdTRlVnM0RUpBNm9u?=
 =?utf-8?B?TGtNT041akVKRWRoQVVRWGZUa1Y1L3gyQXo2RVc1Z2EyWlg1bHNiMEZvbnYy?=
 =?utf-8?B?WndmUUh5ZTNjbkVXdFJUKzRZamlYaFQ0VHZ3dWh4dVduV2drZWFDSmd0M3BO?=
 =?utf-8?B?b1UySWJVMjhRWGM1RzArWXBPMVcxNjg2eUUrL1NoOHNJeWVvWGZaMHNaengy?=
 =?utf-8?B?dlhud1dxbzVPYTlpWG1kMTdOdkZnQlZoeENzRWlLbHN6eGdudjBjbkxrRWpR?=
 =?utf-8?B?Y29IbU95aTZZOUFTYUN5L24xSlJlbTZobHd6OUxraGw1eU1WZnR1UkxXYUo4?=
 =?utf-8?B?Z2ErQUgzSmdJd1Jpb2R2MzVNS0lUTFdtT254T0FyY2VIQjlvbytVYXR3azc1?=
 =?utf-8?B?Q1Z5bWlzVFJBZmorSy9NeStjaFZFNWRETEtEVW1lcWJKL0M4UndEZ1ErRlho?=
 =?utf-8?B?bVlKZ1lqd0tLYU42dVo4ZGx4UklYVlJEeVI4ZTQ0bzgwdEQ0UXJSZzZPd1JH?=
 =?utf-8?B?Z29ON2pjNXlLTmhnaHMySHBGdUxWa2IxUTdyc2RTakcxZ2tnaTludU1nTnpR?=
 =?utf-8?B?RUg1ckRkSnc1aE5CSjFOQm56eVRLU3BuWHNsOW9aK1NzV2N5U1J2YnNJa215?=
 =?utf-8?B?dVViUEgrd0tSOXZCaVpEQ0c0ak1DQkc3eUR1TmpzdEhubmo1bHA4R0t5c2ZT?=
 =?utf-8?B?eC9xMXZJU1Q5eEY4eCtvdVZiaXVvMTQrWnNrSGIrMEczYUtKOGovY2NRVkpN?=
 =?utf-8?B?VWtpbWR3TTd0dTBxK0EzcVNwSmdsSWFqaHRLQkFQdTROYzFmWXNXaW04YWZ6?=
 =?utf-8?B?cXBzdGk0aWpGWnBEZmgxbVIvMXNsSW9rb0RrUitwYTNZd1l6a3R3M1IrMSsr?=
 =?utf-8?B?b1NIWURDV0RaL1pUUC9IWHl4Rm15ZVVYcE5VdjhHWmxabklaVi9SYmQzY0Uw?=
 =?utf-8?B?TUQyQXBQanFrVUVpTFZrV2RrbUtOSHRkZ1VHeEpZa3F3MXB5cHliYUNiQy9C?=
 =?utf-8?B?S3VmMWZIQmpxSXc1WWhhQVVNb3RyOHhiNVUvT09WUm95S0dINGtEbWRNYzFC?=
 =?utf-8?B?bExDVEZkSGZ4MjdtNjFmcFprZ21ycnlXYmtWTFc4cDUwTENKT3YwK2p3czBr?=
 =?utf-8?B?b21kNWp4UEdXdEdNVXhjN0xyR2dpRHR5N1JxVW1YN3FiZ0xLRHlTNVUybjlh?=
 =?utf-8?B?RVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f47c76f-9815-477b-236a-08dd67bb6428
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 14:27:49.5110 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GYM5b9FUZzuw6CDthrzJNVhGU7QvV0Q7QF3gH350nqdes8dCUWEN0GhIcfjFAf481l5yD9TRVCa9bnLAgtu/tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8217
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

Woo, so nice to hear the issue is fixed by your patch!

Then I will hold on this patch and wait for your patch get merged.
Let me know if there's somepart I can help.

Thanks Kenneth. Cheers!

Regards,
Zhanjun Dong


On 2025-03-20 6:23 a.m., Kenneth Graunke wrote:
> On Wednesday, March 19, 2025 1:20:40 PM Pacific Daylight Time John Harrison
> wrote:
>> On 3/19/2025 10:28 AM, Zhanjun Dong wrote:
>>> Lite restore for MTL is not POR for Xe, then disable it for MTL.
>>
>> The point is that it is causing unexplained problems. And it is Xe as a
>> whole that is not POR on MTL, not just lite restore. Hence no priority
>> to investigate what is going wrong and how to fix it properly.
>>
>> You should also reference the upstream bug that this is in response to.
>> I think the tag is 'Closes:'?
> 
> Better yet, I managed to track down the missing invalidation.  I've just sent
> a patch to intel-xe@fd.o titled "drm/xe: Invalidate L3 read-only cachelines
> for geometry streams too" [1] which fixes the underlying issue and makes
> Firefox render correctly on Meteorlake with lite restore still enabled.  And
> probably fixes other bugs.
> 
> Assuming that patch is acceptable, I don't think we'll need to disable lite
> restore.  Which is certainly preferable!
> 
> --Ken
> 
> [1] https://lists.freedesktop.org/archives/intel-xe/2025-March/073997.html
> 
> 


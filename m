Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3AA5C3DA49
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jul 2024 05:17:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4311D10E522;
	Thu, 18 Jul 2024 05:17:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hP864yJZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94CD210E522
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jul 2024 05:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721279836; x=1752815836;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yeNG0punT0YUPgTi6BfKi3ntK1jxSCcLgVxOGMZZ9Qk=;
 b=hP864yJZ4au5I2cbiENlVTqRIZafX909gx/t9NYJnLXMTmgVjaTLPqr9
 9QPY4y3xWfhNoZ9PDewLSqp5o8tjQybISf+51IhzLEGYtXgjblytwE6QO
 td4PgbaiqHV9AHOmReSLivOTXyhOZYXnELbywcEeTO8d9iZbDo24My6uN
 w1B+l1P7R4Hrt+cXf29GfX8ikosiaclXxjHDNm8Jxy3rTz90Skci7HCBb
 X7diY+WreJdJsv1Bp63NMCuqlsLu0oOb+kuCOYHAGNZa8C9UXZLwCZUR7
 XocWMLwIK4yGHpzKFa6XT8k5ivONB3u5SdtOYtk0LT3eMrth2WLg5Sxue Q==;
X-CSE-ConnectionGUID: GJXSOcEpT3CKHP3qqE3E4w==
X-CSE-MsgGUID: RbKRqiGGRVKMUh9np0WoBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="29400688"
X-IronPort-AV: E=Sophos;i="6.09,216,1716274800"; d="scan'208";a="29400688"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 22:17:15 -0700
X-CSE-ConnectionGUID: sd6qmFAzRwmnBwA7lvuEAw==
X-CSE-MsgGUID: jhjafcz3R9yAsyi72jJBBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,216,1716274800"; d="scan'208";a="50722306"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jul 2024 22:17:14 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 22:17:13 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 17 Jul 2024 22:17:13 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 17 Jul 2024 22:17:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wZIzIx+6ehw4cudUXmU0OaCfMws0AMfjR6bFKNAdENBQjJQOhmxL6qSgPwoJhjvUzjELfRcgiJymR6VBIN5SK1WeTtaiGO1S6znJicxaHOgmWgIxNcc+Yryg92fe7vQsBvQpXz3p8CYpdd1KclsOFUoPaqITZ4JZZzky++VQLLK1D10HunXoTYb3yTpv3aQrcnLy+ZIjxlcBWb5XD6Z48uFpBk8IZWiQrWkES4vB0zlGZPm6+IJ3lhdbXEm9XbU1bIZup7GkC/9is82DWUR8m5Izbkazagk0OOijYlB4vHerO5ulqZonbxWvMUP9wJERZlgStldZl5CUmCiV5IVrzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Agzf571dY8DY7V+pRNtFvYBZPYcN5OWXtV0ib2BZ5t0=;
 b=jDVAISvcjj6lihbYvKy7Gp8FLCUGdiFzTuHixU9u9580vieQpveMTEwW5Xguq6WlPdTJNcbolGzqBlaXfgVNmLNNTN29kMH5O/wSPPDiMus5M55j8qwOJSIP/x3M22N1LIt1DtszFsYR5TnoYhxGcxe7V09+B8ggmZSzgP+ybviGrco85I3kLj1TxSqQz3AQnke8UX7OVDQUWBSsgkGEExEARitcnGXQNMGpxWaGRcwCvZ3QfyzBHTFci9MD5hgoJjpPUenineMBvzHfjw0yt919gkiYW29DC+asIFUoORY5LpbyzsQ6cX9pbSssLmTCLeOQSobM1XBjwYPYHEXGUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS7PR11MB6102.namprd11.prod.outlook.com (2603:10b6:8:85::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.29; Thu, 18 Jul 2024 05:17:10 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%4]) with mapi id 15.20.7762.027; Thu, 18 Jul 2024
 05:17:10 +0000
Message-ID: <b150c5fe-0bc8-4a46-87f8-d85286aee8eb@intel.com>
Date: Thu, 18 Jul 2024 10:47:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] drm/xe: modify GuC CTB enable communication
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <daniele.ceraolospurio@intel.com>, <matthew.brost@intel.com>,
 <karthik.poosa@intel.com>
References: <20240717055558.4169407-1-riana.tauro@intel.com>
 <20240717055558.4169407-2-riana.tauro@intel.com>
 <0b92ab50-8bcd-4f1b-a095-651f6e8f955f@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <0b92ab50-8bcd-4f1b-a095-651f6e8f955f@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0071.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::11) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS7PR11MB6102:EE_
X-MS-Office365-Filtering-Correlation-Id: 296c8f6f-8dac-4f0d-686d-08dca6e8dfc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NzRrVEsvd3prT2tiVCs1b3I2L2NZTVZZeE5ZOXRPSEdiaEsvemkyM2IyVnMw?=
 =?utf-8?B?blVIWFl4amJPeDd5VXlNbTZ0Vmg3RFBoR2FFaFdXbXVjRjd2S0hlZ1BwRUdn?=
 =?utf-8?B?dWNJREN1S2JBd0FvMEhOaGVVTWtIbFdHQ2QrVTcrODdISnJPSGVJZiswb3Jp?=
 =?utf-8?B?T3lBVkRTMXNHRjBESDJac2NHV2lvaitnQ2hvMEE0NzdxK3YvYmxmTkxMMXpw?=
 =?utf-8?B?eDVjS1R5SHhnUW1sNU9hZTREaWRvZGpNZy94RzQwcEU2MXFodzZtK2RTM1Nu?=
 =?utf-8?B?QlFjWDIrVzhKQVdWY3NkNmd0aGJUK1dKa0VCT3pCS1BGemNIUHhmYVUyRkRD?=
 =?utf-8?B?Um9Td3BkclArQmEybGFicmx3N0hHaEZ2SnNNS09mdmNuUHNWS2xJWUQyWDJu?=
 =?utf-8?B?cndrS3JkZnB6azZtemZqN1VXYjNwQ0RPZW10S3Q4QU9CaVlzSVN5UjBTVTR1?=
 =?utf-8?B?WEhRRjFiOHBzNlZwR29QYWNLLzJOZkVkU0NUUDk4aFNzdEpmWHcxdjZoTnda?=
 =?utf-8?B?dUFhaFlxMlNISkhmWlF6M0tsVjFkUnRpY1ZNR01mYzBqdDZFdHlyWlJ6NXE0?=
 =?utf-8?B?ZmxtcGZJQ2NQZ3c3NWMxN3JUS1BUME94Qk45UkJmd0lGZkdESHBZM1JMZ25H?=
 =?utf-8?B?S05LMVFJaXg5dEp5WHJabHo1bWNzMElyVGErd3pMSGdRVlpvQlp1ZkVweHI3?=
 =?utf-8?B?VjU0RjdHS0ZFZ2ZKVi9XN0h6YkhsTExySXpTOEk3cmMrV1gzcE1mWkd4RkFW?=
 =?utf-8?B?b0F0Q21mSGF5Y1ZxVmZjMzRTTG9Cc2F2RmtEcEdlVWRBazFwTHZWOTJ2cS9z?=
 =?utf-8?B?dlZKYXRZK0lMUWt6U3VXSVRqQWt6dHBUaVZPWDZ6WWdkVkdDbG9vSUdiZkZD?=
 =?utf-8?B?SFhBQUdkU3BOdThzRS8yK2pKYkhtMnAxa084YnZjNnhNVHFEdkZFb2dpRTl5?=
 =?utf-8?B?MXIxdnlWelh4c0c2TkZybVNqS25EUCtLQ3ltbmlRV2FVR3Q1Zk9Fbkx3aFNi?=
 =?utf-8?B?bVFJZWtHZXBDVXl0UTRxQ1BGT3FiREgyZjZkTjZlZFNvTlJSZ0JnUXdoQWJE?=
 =?utf-8?B?L1kwUXNibmRMVitBZEJFb0JMWnlPRjc0SXV5dVRwanpkM2hheVJIVVJzMVcx?=
 =?utf-8?B?L0lkUkt2SmlhU2JmNjIyNThtYjNMeGV4YXVtQkpiYjlGS1hKd0lpdExzTVo0?=
 =?utf-8?B?RldBL1Y3c0pPV3VsMThYNWRoUnNURmtuU3JXKy8yMHhqcjVRaUFSaFpGdXAx?=
 =?utf-8?B?cThPVTVDQm5kTWsrNlloQVNaUk1DMlRROEx5WGNJcTVaUk43RDFZOS8wenZu?=
 =?utf-8?B?Ymx4N1FVVjY0MWR6RjZKeUdZWFVzV3J0clRxNGpCcGsrYnRxTkNka1lhazYr?=
 =?utf-8?B?aGk3L2ZUV1lGZ3FnWXZMYkVoSTJkYmltb2RQb0dpTEtXd0lySHJLWUkwU243?=
 =?utf-8?B?RkRPcCtkSnVGUlFONXNVQXVlQzhpT1JXWGU0Snk5MmtNK1lDYjRSWWhrWGtS?=
 =?utf-8?B?MmJvRFJIU0hGcmY1ekN4cEJmb3gwdU9PeXl0ZU5YNVRraUxOdi9YMUhUOEll?=
 =?utf-8?B?K292Kzh4ZkdBdnRJTEZsWGRCQjd3WnBXOXkwdTJVM0hHY0tKSHViZHdhbDNI?=
 =?utf-8?B?bUgrRm03NXI2Yk9YZ0s2QjNZVXd3eGFhSDA5THBNcmpGVDlBZ1VkMDlablMz?=
 =?utf-8?B?MWYrRitBRnNLbFJHL0N0Z0JzZlJFZDdUam50VG0xaXorNVF2anZPTHFGSHBw?=
 =?utf-8?B?Zlh0VE5BMkZQTTlBMHhQVW1wTTBkVzVISEFpbjVoOTFnRzU1N2piSDdhVjlF?=
 =?utf-8?B?bDZIMFBRTFFPZWFJbDBYUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWdIcS9vMy9WcVIxRjdBR3F6UWkxZ3pTR01PZXRTcUwvdXRwTEhieWVCc1lW?=
 =?utf-8?B?RmFDY2UzNG1WWFBpeWxlVEpjWU9Zd1drNHVlb0owOUVOR09MRGhudTlwR2dt?=
 =?utf-8?B?OTE2MGdGbGZ0MWZYRnpodURlUzM5NFVaSmpWc2J5Z05iNE5QSVpmcUdRYmx3?=
 =?utf-8?B?ektidytXbkN1bjBnR1IzbGlZditnK0NWTWg2d0Q1czRRQzg2UnppbzZkcVYv?=
 =?utf-8?B?d1BtWVZ1VEVyYS80cHNicXdORnpFbEdWM3pSQ05UWUFsTU5UUlA3bUxwVG1N?=
 =?utf-8?B?WmRrRVJ1WkVLd3NQV1NRcEFzWTJtdW9vb1A4cWQwYzlGRkFrUnM1VDdZVjBl?=
 =?utf-8?B?SEUyRTE4MVE0SGhlNXE0UVMrRlAxTzBldW5KaHJkUlQxZTZ5bVEyVGl1TGlM?=
 =?utf-8?B?eTJlOXZ6WlY5TEliOEc5TURDVzF4YitTSEpVOHVnQVEzWjNWYXdlZFlEUEU4?=
 =?utf-8?B?N0grMm1aSm1HdFJPbUdBckViSDQrWEJvLy9lQms0NVIraW5WbHdZblVHWG5y?=
 =?utf-8?B?VjRTZTdydStvc0xMSlc0MksvaHVYdXEyQkpBbVE1MzdZTlIrZWR3UXQvOXFp?=
 =?utf-8?B?WStxK2szWTJHK2cvOXpzTk5xRWg0TXR6enpVY3R4bWczazk1OXhOYXhGNHpB?=
 =?utf-8?B?S3JLaDJvZ1Z0bnF5NC8vUUhYcmg2cWZNdmhuc3diNEVLY2dtamFRbGpMd0tr?=
 =?utf-8?B?UjBjWmtkRGh6bVliYlFtV0krbDJtSkp5UTNGVzJCVHB0ejdNSVAyZjdBR3A4?=
 =?utf-8?B?b1B0K1oxQkp6QTgzWTV1ZjR1QTZqdGptOFZnSnBGMXgyN05yUXVvVkp0dmty?=
 =?utf-8?B?dTV6V0ZUM20rWllNdUhPdGNFMlhoNTVhSEFJb09lcTFtZGlqVXNpbkRYVHF6?=
 =?utf-8?B?UHFFNlBGWUN0YlFsZ0F0bVcwRHVSbU5oUGExZzhleXFNUEphV0o4WDNuYVdr?=
 =?utf-8?B?UUdaWnNwMTExbkI0dEJTbEFweGk1bVprVkJ4NXNjL3lZbm51QkZxQ1p3b1Yx?=
 =?utf-8?B?M3dueGl3RGgvUkMrWkx6NnI4ZEhWcVFseTlscjFOV25DMEdoaFZKNm9Wa1Bk?=
 =?utf-8?B?NlpzMHA5NDJOWkFqdTd1ZklrMEJ3MzFiVmRQOWN5VHhWa1pRVnFCcjJGVE9r?=
 =?utf-8?B?NjhseDFMRkNUMGR0MjZKMEFteFZUV2dZY2tBWnF2MXliK3dQY2ZtbzNzamFY?=
 =?utf-8?B?ZFpUNGdISmsxMVBvREZtVVlYayt5bmhsUUt0ZjVNdnFTQVR3dksvcFdJNXpO?=
 =?utf-8?B?K1dDaEc4bEprUzY3NDQvcG9sOEovTGwza1NyT1FMcWF4SDlxSHpla2dwYWxN?=
 =?utf-8?B?dzllTEY3Z0pHRy93OWNld2IzSk5oZHdZSHMyMG50dVdIWEh3YjdIN2JxMzYx?=
 =?utf-8?B?clN4YUxpbFdRZFpYK0tGakZmZWE4US9PUDUwMnlTWEZRZzJPL3ZFQzFsTkZ3?=
 =?utf-8?B?WUp3MmNGSzdqTHRJRnU4QWV5a0tFTXQ5RXVSYS9LdVNSN0paTVRjaUgwMDhu?=
 =?utf-8?B?QmR0UXU0M0FMaktvTzJ1MGEzZmpRaHA2Y3JtVlN6cFN1UjlNNHNkKzdmUUlk?=
 =?utf-8?B?SWwreU85QzZEZnQ4VnVicGpOV09uRldzNGczOXFzRVF1QUwvTkFOZ1lNV2VN?=
 =?utf-8?B?alZlMmlhd3N1Mnk3TVhnRVhrenlKWHpra3BlanVxcHVTYnJkZjQrTzhQUE5w?=
 =?utf-8?B?ZTUxbXFWYTQvRUFKQlBVY1JCcm5QclJoaVJIbzZVSGRYL1ZJQk1DenhtWGdt?=
 =?utf-8?B?eHZObDEyUGJybmlZSEl5bWFEaXNKM3U5VGxyamxKMENUUVlMeXZMVkZzWmRE?=
 =?utf-8?B?SzhiandUb1pvU2pxQ016OU9ZMTF3dFJnQ21DUEY5NHlTejI4Wjh6NkFlNEpL?=
 =?utf-8?B?eWFuZTdXMGgyRjhNTE9jUEJ1UStjek9oMy9lT2dpc1V5SlVaUXY5QVBBNVJk?=
 =?utf-8?B?am1keUNNUEM0YlhGVFB0VDE3VVROdjJxRXNZdmszWG0yNHZ2MlFHdjhiNjBO?=
 =?utf-8?B?eXhZaDVlQUptazF2cXRrdjR1eENDYTE5ZXJqckNzS3dSblZvcVl3aHEwY3RI?=
 =?utf-8?B?NWU5eHZZbnZNWm1FWmlIMHhsOTMxempQRHJQOUNTa0xkei9XdDl2UW1BQTJE?=
 =?utf-8?Q?2dkrvhMjjP7Y74vwyJcQdUiuq?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 296c8f6f-8dac-4f0d-686d-08dca6e8dfc5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 05:17:10.0356 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kHhzmsNID4iSIqTE88pcAil1uBs1zuf46sTrvT6gUXIGv9HhcR4Fd0JrzxrTN1isjMy+j0NaS4jp7PRFzgBz6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6102
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

Hi Michal

Thank you for the review comments

On 7/17/2024 1:34 PM, Michal Wajdeczko wrote:
> 
> 
> On 17.07.2024 07:55, Riana Tauro wrote:
>> Modify GuC CTB enable communication function to only set the
>> CTB state if registration is not required.
>> This will be used while resuming from D3Hot where
>> registration of CTB is not necessary.
>>
>> Also move xe_guc_ct_set_state to header file.
> 
> hmm, but this will expose internals of the guc_ct layer to the outside
> see below for alternate solution


yeah that is the reason i had split the functions in the last rev.
Will follow the alternate solution of passing the register_ctb
to the CT layer.

Thanks,
Riana

> 
>>
>> v2: split patches (Rodrigo)
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc.c    | 25 +++++++++++++++++++------
>>   drivers/gpu/drm/xe/xe_guc.h    |  2 +-
>>   drivers/gpu/drm/xe/xe_guc_ct.c |  3 +--
>>   drivers/gpu/drm/xe/xe_guc_ct.h |  2 ++
>>   drivers/gpu/drm/xe/xe_uc.c     |  4 ++--
>>   5 files changed, 25 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index eb655cee19f7..8131c290a4f4 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -755,7 +755,7 @@ static int vf_guc_min_load_for_hwconfig(struct xe_guc *guc)
>>   	if (ret)
>>   		return ret;
>>   
>> -	ret = xe_guc_enable_communication(guc);
>> +	ret = xe_guc_enable_communication(guc, true);
>>   	if (ret)
>>   		return ret;
>>   
>> @@ -800,7 +800,7 @@ int xe_guc_min_load_for_hwconfig(struct xe_guc *guc)
>>   	if (ret)
>>   		return ret;
>>   
>> -	ret = xe_guc_enable_communication(guc);
>> +	ret = xe_guc_enable_communication(guc, true);
>>   	if (ret)
>>   		return ret;
>>   
>> @@ -854,7 +854,16 @@ static void guc_enable_irq(struct xe_guc *guc)
>>   	xe_mmio_rmw32(gt, GUC_SG_INTR_MASK, events, 0);
>>   }
>>   
>> -int xe_guc_enable_communication(struct xe_guc *guc)
>> +/**
>> + * xe_guc_enable_communication - Enable GuC CTB communication
>> + * @guc: GuC object
>> + * @register_ctb: true to register CTB, false otherwise
>> + *
>> + * Enables GuC CTB Communication and IRQ
>> + *
>> + * Return: 0 on success, negative error code otherwise
>> + */
>> +int xe_guc_enable_communication(struct xe_guc *guc, bool register_ctb)
>>   {
>>   	struct xe_device *xe = guc_to_xe(guc);
>>   	int err;
>> @@ -870,9 +879,13 @@ int xe_guc_enable_communication(struct xe_guc *guc)
>>   		guc_enable_irq(guc);
>>   	}
>>   
>> -	err = xe_guc_ct_enable(&guc->ct);
>> -	if (err)
>> -		return err;
>> +	if (register_ctb) {
>> +		err = xe_guc_ct_enable(&guc->ct);
>> +		if (err)
>> +			return err;
>> +	} else {
>> +		xe_guc_ct_set_state(&guc->ct, XE_GUC_CT_STATE_ENABLED);
>> +	}
> 
> maybe better option would be to pass the register_ctb flag to the
> xe_guc_ct_enable() so it can do either full enabling (including CTB
> registration) or just change the internal state:
> 
> int xe_guc_enable_communication(struct xe_guc *guc, bool register_ctb)
> {
> 	err = xe_guc_ct_enable(&guc->ct, register_ctb);
> 	...
> }
> 
> int xe_guc_ct_enable(struct xe_guc_ct *ct, bool register_ctb)
> {
> 	if (register_ctb) {
> 		...
> 	}
> 
> 	ct_set_state(ct, XE_GUC_CT_STATE_ENABLED);
> 	return 0;
> }
> 
>>   
>>   	guc_handle_mmio_msg(guc);
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
>> index af59c9545753..b49444297eb0 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.h
>> +++ b/drivers/gpu/drm/xe/xe_guc.h
>> @@ -20,7 +20,7 @@ int xe_guc_post_load_init(struct xe_guc *guc);
>>   int xe_guc_reset(struct xe_guc *guc);
>>   int xe_guc_upload(struct xe_guc *guc);
>>   int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
>> -int xe_guc_enable_communication(struct xe_guc *guc);
>> +int xe_guc_enable_communication(struct xe_guc *guc, bool register_ctb);
>>   int xe_guc_suspend(struct xe_guc *guc);
>>   void xe_guc_notify(struct xe_guc *guc);
>>   int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index 7d2e937da1d8..44c44e086a98 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -318,8 +318,7 @@ static int guc_ct_control_toggle(struct xe_guc_ct *ct, bool enable)
>>   	return ret > 0 ? -EPROTO : ret;
>>   }
>>   
>> -static void xe_guc_ct_set_state(struct xe_guc_ct *ct,
>> -				enum xe_guc_ct_state state)
>> +void xe_guc_ct_set_state(struct xe_guc_ct *ct, enum xe_guc_ct_state state)
>>   {
>>   	mutex_lock(&ct->lock);		/* Serialise dequeue_one_g2h() */
>>   	spin_lock_irq(&ct->fast_lock);	/* Serialise CT fast-path */
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
>> index 190202fce2d0..60d46739548c 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
>> @@ -15,6 +15,8 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct);
>>   void xe_guc_ct_disable(struct xe_guc_ct *ct);
>>   void xe_guc_ct_stop(struct xe_guc_ct *ct);
>>   void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
>> +void xe_guc_ct_set_state(struct xe_guc_ct *ct,
>> +			 enum xe_guc_ct_state state);
>>   
>>   struct xe_guc_ct_snapshot *
>>   xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct, bool atomic);
>> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>> index 0f240534fb72..eb9c1443c849 100644
>> --- a/drivers/gpu/drm/xe/xe_uc.c
>> +++ b/drivers/gpu/drm/xe/xe_uc.c
>> @@ -154,7 +154,7 @@ static int vf_uc_init_hw(struct xe_uc *uc)
>>   	if (err)
>>   		return err;
>>   
>> -	err = xe_guc_enable_communication(&uc->guc);
>> +	err = xe_guc_enable_communication(&uc->guc, true);
>>   	if (err)
>>   		return err;
>>   
>> @@ -194,7 +194,7 @@ int xe_uc_init_hw(struct xe_uc *uc)
>>   	if (ret)
>>   		return ret;
>>   
>> -	ret = xe_guc_enable_communication(&uc->guc);
>> +	ret = xe_guc_enable_communication(&uc->guc, true);
>>   	if (ret)
>>   		return ret;
>>   

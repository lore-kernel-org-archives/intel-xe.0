Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF4C8CCD185
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 15:34:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82B0310E852;
	Wed, 15 Oct 2025 15:34:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QBo2tKXU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A444110E852
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 15:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760542485; x=1792078485;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WiL98J4ABWi5NXcA/8PUApzMnqTgat4+WtfMBECOFAE=;
 b=QBo2tKXU/ylE+/HRKdOe+19oXbrmTwGaX19keowebt60B3F+LS1yfuMN
 VAOMI8WO4FGIYg3Zw0Vk1Z8j5KHd02FRy+ZY9rmk4nM4leJ3CT3L7xUEc
 iMnh1hkfouz2eb9Pxk2PYGwtkutYnc3HH+hLFjG1Wwm2wP3B1Ip5gMf5F
 FP4znMunzyxc1HUiBvDLpcEAfGRL9q2usissbkZZHq/OR8khH0r8fDuhx
 yU1GArJXkoN99xnj9P2Ep1kL/LLm2d/u4E35w1Q7Fzc47k0bujlBwa2Tc
 IVsV7aUiEO7y0IrdYtsxpAjUsxxTwrHN3AE7ZBx1nKTFVtmS9nGcUKX0G A==;
X-CSE-ConnectionGUID: BlNmBmziThOW8nYWpEvitA==
X-CSE-MsgGUID: 3W2jE7l3SSeCha/HEy1IKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="61928833"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="61928833"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 08:34:44 -0700
X-CSE-ConnectionGUID: OTpN4U+OQcyc2QYUImggRg==
X-CSE-MsgGUID: zml1mhJhTF6afTkf6n1CNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="182192649"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 08:34:44 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 08:34:43 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 08:34:43 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.3) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 08:34:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T0rzVVXggQlCDZdftAnzhX1V7wjRHkL/0z5a8c+CnndNB57W2JX+aCE8G8+j/o0uNL639n0F3OFYTqvOnfbijzpO8Ygg5bEsQlsM9IRv6JZpbJYUjGzBm4y4muI62gKzTzM7CReHR4P/jzh2o5Q1l+i+pZl1QKVg6i/AEqCpivvva1XYKjmJC53v5ix3UPyB8/6/sMmXSez46373HN0iz30ooM/u07+TJc2x1az4c1x0zpzQ2KP2bIAfCSMhwgbHJzJtzKHEwRWCV6RS3qonO2P9jSKGuChz0Gf3KUPf5jGp0Xpb5V3JidY3XHLE3JcYuroMFf2M8RpKu5jVOE6bgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=istJHeDqcdMI8NZ7CSj/zF0JHxroDm5SQttlfIsEYlc=;
 b=jU8qMqpUUT0KLFfp75ugQUy6R/ELpCkxujoIInm9hJGVHt4C/kTf1Fj7JZOfsPO3hyUT0CCQCItx+aeDZD9nM5IpKeB30XtMJEBIktmBg9gx7m+uqg7tbnFvWkdukwIp/sd7fgion88roQr0p565eTcF/kfbeBI46ZXkdhMVUI1wIzpJCvUipJOJ+xJ/Q2eMgYB+qbFS5e1lJqIgiX5iqFX6G+oz3v5G6Lyb5DyljMuS3NbcuB0asJVGAT6ZuFO1bYvzhSZQb2BUoz/ydnjboZnjR7fVmQtpW9fR+L7q37qeKSQNQHzA/9OmW26LEJHy2/dfhMBXgtEGbYoMLOPOfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by PH8PR11MB8040.namprd11.prod.outlook.com (2603:10b6:510:238::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Wed, 15 Oct
 2025 15:34:41 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3%5]) with mapi id 15.20.9203.009; Wed, 15 Oct 2025
 15:34:41 +0000
Message-ID: <f37cb816-ec66-4fde-9973-46365b72bd4e@intel.com>
Date: Wed, 15 Oct 2025 21:04:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/23] drm/xe/xe3p_xpc: Skip compression tuning on
 platforms without flatccs
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>, 
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>, "Tejas
 Upadhyay" <tejas.upadhyay@intel.com>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
 <20251013-xe3p-v1-21-bfb74f038215@intel.com>
 <46abe5ec-3fff-4019-8af3-b273b9627f8c@intel.com>
 <20251014181436.GZ5409@mdroper-desk1.amr.corp.intel.com>
 <2bf254f4-d07f-4ca7-9dda-6109bb97c200@intel.com>
 <v74hnh5tyciwdef2i2delsb4yuvqf45xovcoudqxp2zmurixbu@o7zzu7gvge4v>
Content-Language: en-US
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
In-Reply-To: <v74hnh5tyciwdef2i2delsb4yuvqf45xovcoudqxp2zmurixbu@o7zzu7gvge4v>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXP287CA0006.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::17) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|PH8PR11MB8040:EE_
X-MS-Office365-Filtering-Correlation-Id: 11fb873e-1111-476f-cdb4-08de0c005b63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?akVrdGFLamtNeWtXSm9YTDJQVi8xbkNDMnZrd0ltRnBYckhYMkJuWkNNb1ZG?=
 =?utf-8?B?VzF5ZHlJbFJodTV2b05VT0hMOEJENmp2LzdFcHZ3dGN2aWxKZm5kbEM4b3p6?=
 =?utf-8?B?cTcwNUI1ZFpDck1mRmtNUzRaT2xIQ2xKY2xVZHcxejlxKzdYVGNkZEI0UGtP?=
 =?utf-8?B?STJHMXZrb3Qwc1Z2cTR3dnZhYUxFcGticGdYZkdKbWR1RldOR1JURDRBS1VE?=
 =?utf-8?B?VU5wWGVQbXhFS1dpbDlhcmM0Z2Q1cTRiSmM4SzU0aVZBcVhUbUlKUHU5Q21h?=
 =?utf-8?B?WFJEM0gzRGh4YlFCTlhmMHhTNHgzdGs3YVJINyt4K1hSYzNUbGt5QkdPanly?=
 =?utf-8?B?WDlBUWJ3OU5aUUNXQS94bURMVEFKVi81aFJOMUpiWjcyMk1Hb0xkVk12b0VS?=
 =?utf-8?B?U1BReHBhdTRxY3FOWWUvUlZoTDAxdEFDVjBRZ3pHclNuODduclFERzFHclBp?=
 =?utf-8?B?bW84dktIWXlWbzV1bGJpc0RqNlFRZUljdUJlQXJoTEZLRy9wUU4xWk9xdXly?=
 =?utf-8?B?ZGQxZzFMUkVFbVRxV1RlSWllb0NEbmRNNEZoZ1p6Rm9nbUpiREhFK3diNG85?=
 =?utf-8?B?UzJIc0daK05ZY1pFWEFJSFlQOXlITkk0Z3NiUkttbWwvaEt4TFhmZTZraUJz?=
 =?utf-8?B?TU9SVHcwMy80Ni9aTlh3c1QraHB1MjEyTC85SHoxVzJMQ2JZbGx5ZGloUFcw?=
 =?utf-8?B?RVVNaytDWjdSWDVGRGRobXN2cTI4eXl0UUpRSTh2V01VQXlWcHdRN09aMHJl?=
 =?utf-8?B?SFMraysxN29DZnVyRXZsRzZiWDdqNmZBdEJBNEUxdDgwRE80Tzk1UklLQmlV?=
 =?utf-8?B?dTVtb0owRHUwRTZ3bU9MV1BMOEl2bGFaMk9XU1VTMXZhekJKd1llcE80ZHY0?=
 =?utf-8?B?WmVDZ2VBZThCczVBbXpoRFo0eGd4ZFd0QTdiemJGTnhUZ1BVVnZnWUZNTkNo?=
 =?utf-8?B?bk4rbm5KUlVkeGQxRkhqeEQrS0F0WGlXWCtUd0VMVEFESDVzWlFlVW91enla?=
 =?utf-8?B?UnNRTFdydm81d2EyUnllRkQ4c0cyUlYraUFNYUFIcFJ2cVpHcjdNMFp4c3Mz?=
 =?utf-8?B?YS8zKzBHNVN6eFVJaWpHOEdUUHZ0UC9KZlExcGNOZlJsd28yWkhMUzV3WFlB?=
 =?utf-8?B?RkRzYWpjb25MRDZaSStOaGdLSGE5MjBQRWRRcTNUVG9ack9sNjdVNFRQZmJX?=
 =?utf-8?B?bE9udFBQWU1wbmF2clo5YUpJVVNhb0M5Yytia3E5eFR0QkFHOE0yM1dRbmhP?=
 =?utf-8?B?OE5aR2ppT2UzOFJhMkFWQUZ6emQxdENjVTAxTVhyM2tFOFd4aGdkQnovcUJN?=
 =?utf-8?B?M2xSb1dIN05pckUyUExMMGZUdHVOdDhSd2p3WXpFRzBQWm9Yb1ZLS2NkVmZt?=
 =?utf-8?B?R3lMK0hmOE4wbFZYVDg1dVZXbzR3L0pIY3YrdlAyZDhOam96QzBDS2RhSGkv?=
 =?utf-8?B?UnlHR3dCR0RxS0poSTlteVdmZ0RWYmlkLzVSQTk1N1JBcWkydnBweHYrOERY?=
 =?utf-8?B?TnRWTkMya2NkZ2c0MDFSdDNaYnRCVGhIUlJ0WURaNVRyejNuWEJ3T2xwK1Nn?=
 =?utf-8?B?ZUQxVWxQaWRzZkJDalh3VHluQ0RsOXo2NnZOVjFTQVJLNVZEWHpiWTFOU3J4?=
 =?utf-8?B?RW9VTVlSMEdsdDhibzdwWnBPVmhuQUx0QUdvTEwzcDhYZzNhaURHZEptckxk?=
 =?utf-8?B?R0JReCtZKzcvSWtRckdZNTcrN0hUY0JrSk1xREhjUzVtRkR0eXFZUDRqck0w?=
 =?utf-8?B?VjBoQmxCL293S2hJTy9sR0dCaitOWHFiNXk0RzNKK1p2RzY3RmVlN0VuV1BN?=
 =?utf-8?B?SzRQYXczYkMvanNvMzlMZFM0eEF5MlhUeitya2MyRU54WUVoQ1ZHRmkvckxk?=
 =?utf-8?B?R0Fjazl4VkRBNU1jY2IrU1hZNXdxdXV2U3huSUwwbFB1STg2WGlUeFBaYUtC?=
 =?utf-8?Q?Ra+sbo7jli3NUSY4AhrwIq1eC7F/gSEL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cE9abnpKeDhYSndhdmVLYmE0WHFjd0NFVEJqTHAxQk5Bc3F3c0NJQXc1NStH?=
 =?utf-8?B?WUdsMytrVzIvUTMwdUxMUXdaMXZZYzdwRXVsMklpN3llTEZta05SbkJreTVk?=
 =?utf-8?B?QTVjSTEzVTNGOFBzcXRnWmhDbEFCRWY1U1lpeWxPU3pKSE84RkhJZmVlcWly?=
 =?utf-8?B?Zk1BMGVjNUlXelJNbmJKRStDSi81cnN2cFhualFiVVFaOFhBM2JMaFA2S0R4?=
 =?utf-8?B?b3B1UEw0MGg2Ukk2NXgreE1WaHUxNnlpSEJFUjJXSzlBblRBN1YyWFFSdUkw?=
 =?utf-8?B?MjVaSFhiWHJmUTFGeU5sc1Rrc2dJM0tJVHV6eG0raWdYMlhsSWtmeUhFdnNW?=
 =?utf-8?B?TmZpdDNmZE1GdVlONXR4STU5MzJKM0JzVVhvdDA4eUNyVE81OXFPQ3lQeG8w?=
 =?utf-8?B?TlpkSUd5aHpKTWRnR3lZRXBFU3VOTG44ZkdHaEtOUDhzMDlEOTU4RU1vbUlB?=
 =?utf-8?B?MTBIb3hLYWpITWVsTkRvd2NBN2pJVkh2QzViS1ZkNWxtbTFQNlljdzVwbjZn?=
 =?utf-8?B?ZmxJQUtKMzhOYkxBdDMzcGNJaU5DRFhkUk1BMDRwYm11QklobnNGWGJDWGRQ?=
 =?utf-8?B?VjRhQnJ1QnowSjVUcEs4QXViV2sxZVdkTXpnMDh2Nm9CWUdIaGJwOHdHa3VW?=
 =?utf-8?B?QVhOd1Qyb1FBZGdRclVoYTFrbVo5Snc5TmxzenlwVzdQQndVRGUzbGVrTGpQ?=
 =?utf-8?B?SXdjVE1DU1gxVkpqZEUvNndnZ0FqTU9ka2lmVkdBVzlZRXU5bUZnYmgxT25D?=
 =?utf-8?B?UXpsWC9lUHlxdFlOTzd1NDg5N2hoSzlKK2VOWmovTVRaRUJtdVBwSTFvbXhq?=
 =?utf-8?B?QTMyU0xPdUJIRGtsRlVEZ2tXbm1QVXJ3MVhHN1JFK0Z1SnMxbEhtbjAvY0hC?=
 =?utf-8?B?Y3RYVm5scjJ0TXl5RjRtQXZxSFFzWE83aGFTZzVMT1RmV3BXaGdVdVFQcHhQ?=
 =?utf-8?B?Y3F5a1J3c1ArTWJzRjhzWERTZURBeEY5eUMvcGcybVp3akZqZ0U4cU1MblJ6?=
 =?utf-8?B?aVQ4Ung0endMR0ozbUZnTmJHR0JDSzY0c3FXNHhDdDVsWEpHQmlIR203RXlY?=
 =?utf-8?B?NWMvMzJZUFdJYVR3YVNiQWdmZzF4MllmemI0STRTNDdReFZmVk12RHpoKzZH?=
 =?utf-8?B?RU0zTml5Qm14NVY3blU0emF6aW8vSFpjdUFDRVd3MytpQ2FrOTdObFNDT29y?=
 =?utf-8?B?K2FFQnBGVU1DWEVkSmxwTkx2TjVSSVpqckZLOUIwTVY0TERVblNnMm9xaTZW?=
 =?utf-8?B?ditodWl4M2k3RUNsamx0ZHpoUG5XK2NRMExSdnJudzhLeU1YRlhySXk2UFRo?=
 =?utf-8?B?VWEvZnA3bEhLQStGdXI0YkVyMVMxRGM3ZGxpMzMvR2FMR1dJd3Fpd3p6aGJ5?=
 =?utf-8?B?NG9adG13ZlJxN3lYZ3FZbkxMeFVCK0g2dVhrRkZVWmh4NVI2b2lPTy9WU0Ft?=
 =?utf-8?B?NG44S3pMMDR0QzFVcGg1ZEI1cGZxOW15a1Q2OFdoR29LR3Z5OXVKYWpVT1Nk?=
 =?utf-8?B?Qm5wTHYreFhTUkZ6VTRjc1FaZElNL0JVQktueFFPRGRlbS9ubFJ6WW9Lb2ZP?=
 =?utf-8?B?NHFOaFJCQWpGcURNTE9JNmVxVXM5bC9NYTNTaXdvcFNLUWwzT2dNdnJBbngw?=
 =?utf-8?B?eTNlMTNNNi9kRXZlV3BQaXN3L3pDaDF0RnFnZzVlajF6Qm9QZkVSdEw3VGs5?=
 =?utf-8?B?SGt1bEpqb0Y3bmdySDlHZWJIMFI1MEhWelpQeDdOMGo0VFFvRmhOaUtTTXBC?=
 =?utf-8?B?K2ZhbkYwWHBLaU8rRS83dEZtU0JRbEVvMjYrRlMzRFByUU9sa0dScVU5d2JZ?=
 =?utf-8?B?cTNLaFdDNytaUEdRdzdoNnNTMGQ1eEZqMmJXcU9pd2NJSTFiK0R5RHhJV1Ev?=
 =?utf-8?B?dHIwREF4Tjdic0hpeS9LZkVOZXhuRG1VSVpSUDBESXZuR3Y5cHhJOVg2NXJQ?=
 =?utf-8?B?a0RaTFZBbkZ5SWxHQjZUMjF4VklwelNrWllpcVBVTC9Jc0svc2pxa0I3aUVi?=
 =?utf-8?B?UDRWZURBaFRTQjY2Z3lNTHJDT0FKa1JhcWo1M1BsQlpXTHA3azRPdERVTWdi?=
 =?utf-8?B?SkdvNmJsRk5jenRlSTlhUDJEblFrWS9rQWxMdmxVZEh5OTl3NVQ4YlZGYWV0?=
 =?utf-8?B?SzlJQXJWQnRadFJtbGd0MlprZy9mVFhBb09uWVFVcTAyKzZEOTRIa0JHSFc1?=
 =?utf-8?B?MVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 11fb873e-1111-476f-cdb4-08de0c005b63
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 15:34:41.0236 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h63KZBQeDn2JqVjS6KD4FJqf5tEN7WqKyw0XX+Fk0aO4aWEDMWZ7/0n92J199iW0Q7QpLpuo+Wxz++99bt9AVp1MKnykyPcHoB1vu0yFPJ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8040
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


On 10/15/2025 20:08, Lucas De Marchi wrote:
> On Wed, Oct 15, 2025 at 08:22:19AM +0530, Shekhar Chauhan wrote:
>>
>> On 10/14/2025 23:44, Matt Roper wrote:
>>> On Tue, Oct 14, 2025 at 01:39:39PM +0530, Shekhar Chauhan wrote:
>>>> On 10/14/2025 8:54, Lucas De Marchi wrote:
>>>>> From: Matt Roper <matthew.d.roper@intel.com>
>>>>>
>>>>> The compression overfetch tuning settings only apply to platforms 
>>>>> that
>>>>> support FlatCCS.  In Xe3p_XPC (and any future IPs that also lack
>>>>> compression) some of the registers being adjusted by this tuning will
>>>>> not exist or may have been repurposed for something else, so we 
>>>>> should
>>>>> take care not to try to program them.
>>>>>
>>>>> Note that our xe_rtp_match_has_flatccs() function will also return 
>>>>> false
>>>>> on platforms that do have FlatCCS in the hardware design, but have
>>>>> compression manually disabled in the BIOS.  On such platforms the
>>>>> registers still exist (and it would be fine to continue programming
>>>>> them), but they would have no effect, so skipping that tuning is also
>>>>> safe.
>>>>>
>>>>> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>>>>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>>> The patch in itself looks fine to me, but, the patch doesn't 
>>>> specifically
>>>> play only around Xe3p_XPC. Maybe we can move this patch out of the 
>>>> current
>>>> series, or if we wish to keep it here, can we instead drop the 
>>>> xe3p_xpc from
>>>> the prefix? Thoughts?
>>> Aside from PVC (which is Xe1 and not relevant to these tuning 
>>> settings),
>>> Xe3p_XPC is the only IP we have without FlatCCS in the design, so at 
>>> the
>>> moment this patch is specific to Xe3p_XPC.  As a general architecture
>>> though, if we eventually wind up with other IPs down the road that also
>>> lack FlatCCS, then these tuning settings will also not apply to them 
>>> for
>>> the same reasons.
>>>
>>>
>>> Matt
>>
>> Okay, makes sense, I'm still skeptical on whether this should be 
>> named with the prefix Xe3p_XPC if we expect it to carry it's effect 
>> to other future platforms as well. For that reason, I believe, the 
>> commit title can be 'drm/xe: Skip compression tuning on platforms 
>> without flatccs'.
>
> Makes sense changing it, but I don't mind either way since we are also
> adding Xe3p_XPC in the same series so it's clear why we are doing so.
>
> Lucas De Marchi

Alright then, let's keep it this way.

-shekhar

>
>> This in itself engulfs Xe3p_XPC (and any other future platforms). 
>> But, consider this feedback as only a nitpick.
>>
>> Since the changes already look good,
>>
>> Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
>>
>>>
>>>>> ---
>>>>>   drivers/gpu/drm/xe/xe_rtp.c    |  6 ++++++
>>>>>   drivers/gpu/drm/xe/xe_rtp.h    | 10 ++++++++++
>>>>>   drivers/gpu/drm/xe/xe_tuning.c |  9 ++++++---
>>>>>   3 files changed, 22 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_rtp.c 
>>>>> b/drivers/gpu/drm/xe/xe_rtp.c
>>>>> index b5f430d59f805..22a879270c1ec 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_rtp.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_rtp.c
>>>>> @@ -376,3 +376,9 @@ bool 
>>>>> xe_rtp_match_gt_has_discontiguous_dss_groups(const struct xe_gt *gt,
>>>>>   {
>>>>>       return xe_gt_has_discontiguous_dss_groups(gt);
>>>>>   }
>>>>> +
>>>>> +bool xe_rtp_match_has_flat_ccs(const struct xe_gt *gt,
>>>>> +                  const struct xe_hw_engine *hwe)
>>>>> +{
>>>>> +    return gt_to_xe(gt)->info.has_flat_ccs;
>>>>> +}
>>>>> diff --git a/drivers/gpu/drm/xe/xe_rtp.h 
>>>>> b/drivers/gpu/drm/xe/xe_rtp.h
>>>>> index ac12ddf6cde6d..92f0d16110dd5 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_rtp.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_rtp.h
>>>>> @@ -483,4 +483,14 @@ bool xe_rtp_match_psmi_enabled(const struct 
>>>>> xe_gt *gt,
>>>>>   bool xe_rtp_match_gt_has_discontiguous_dss_groups(const struct 
>>>>> xe_gt *gt,
>>>>>                             const struct xe_hw_engine *hwe);
>>>>> +/**
>>>>> + * xe_rtp_match_has_flat_ccs - Match when platform has FlatCCS 
>>>>> compression
>>>>> + * @gt: GT structure
>>>>> + * @hwe: Engine instance
>>>>> + *
>>>>> + * Returns: true if platform has FlatCCS compression, false 
>>>>> otherwise
>>>>> + */
>>>>> +bool xe_rtp_match_has_flat_ccs(const struct xe_gt *gt,
>>>>> +                   const struct xe_hw_engine *hwe);
>>>>> +
>>>>>   #endif
>>>>> diff --git a/drivers/gpu/drm/xe/xe_tuning.c 
>>>>> b/drivers/gpu/drm/xe/xe_tuning.c
>>>>> index fd58ea5e78bf6..7c140d8cb1e07 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_tuning.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_tuning.c
>>>>> @@ -40,7 +40,8 @@ static const struct xe_rtp_entry_sr gt_tunings[] 
>>>>> = {
>>>>> REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f)))
>>>>>       },
>>>>>       { XE_RTP_NAME("Tuning: Compression Overfetch"),
>>>>> -      XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 
>>>>> XE_RTP_END_VERSION_UNDEFINED)),
>>>>> +      XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 
>>>>> XE_RTP_END_VERSION_UNDEFINED),
>>>>> +               FUNC(xe_rtp_match_has_flat_ccs)),
>>>>>         XE_RTP_ACTIONS(CLR(CCCHKNREG1, ENCOMPPERFFIX),
>>>>>                SET(CCCHKNREG1, L3CMPCTRL))
>>>>>       },
>>>>> @@ -58,12 +59,14 @@ static const struct xe_rtp_entry_sr 
>>>>> gt_tunings[] = {
>>>>>         XE_RTP_ACTIONS(SET(XE2LPM_L3SQCREG3, COMPPWOVERFETCHEN))
>>>>>       },
>>>>>       { XE_RTP_NAME("Tuning: L2 Overfetch Compressible Only"),
>>>>> -      XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 
>>>>> XE_RTP_END_VERSION_UNDEFINED)),
>>>>> +      XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 
>>>>> XE_RTP_END_VERSION_UNDEFINED),
>>>>> +               FUNC(xe_rtp_match_has_flat_ccs)),
>>>>>         XE_RTP_ACTIONS(SET(L3SQCREG2,
>>>>>                    COMPMEMRD256BOVRFETCHEN))
>>>>>       },
>>>>>       { XE_RTP_NAME("Tuning: L2 Overfetch Compressible Only - 
>>>>> media"),
>>>>> -      XE_RTP_RULES(MEDIA_VERSION_RANGE(2000, 
>>>>> XE_RTP_END_VERSION_UNDEFINED)),
>>>>> +      XE_RTP_RULES(MEDIA_VERSION_RANGE(2000, 
>>>>> XE_RTP_END_VERSION_UNDEFINED),
>>>>> +               FUNC(xe_rtp_match_has_flat_ccs)),
>>>>>         XE_RTP_ACTIONS(SET(XE2LPM_L3SQCREG2,
>>>>>                    COMPMEMRD256BOVRFETCHEN))
>>>>>       },
>>>>>

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12EACC87FCE
	for <intel-xe@archiver.kernel.org>; Fri, 25 Jul 2025 17:58:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C638810E22C;
	Fri, 25 Jul 2025 17:58:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QwOqMV+0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D468310E22C
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Jul 2025 17:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753466309; x=1785002309;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6p4fTG/MY0oF7q9Fo0PLMh2vA5xCFqyRy7BTKiUVOg0=;
 b=QwOqMV+0/Aa/zrQc6Avzhn4wRC3uPQ7bBVwNJ7ULUJIYOsXOxahqXY2c
 hxhqpz651ngfc/lQHhqWvjntZLxk0MijHlm9U0gabtG7N0ISIxu517Uay
 Hbk7Jph89wnIWFmVOvgCfn7hQmLntYewEWm/+NjghkW6qHds9O8frYDTw
 ideAEwBrxvDnK+Ojz91UHnbh45GmJP42N513JXrWoVfMZ6q/YWSYeSMbe
 TNCkXreLVhe7GEZgz/NUzRY1l4IMZJJHu9aAki/KmwCiWstoQ9P0jobEP
 qwKcVkw9Z3bADq1TGG8CbzDkIdMeE40WkFslYFuzrZOep1MOp760Ou5a6 A==;
X-CSE-ConnectionGUID: 0MIah3thSYSzppd61n0lBg==
X-CSE-MsgGUID: EXgd02JUT4mzq3zjWlUx3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="81248707"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="81248707"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 10:58:28 -0700
X-CSE-ConnectionGUID: yiTc+UvqTHuSvMnUmogxDQ==
X-CSE-MsgGUID: 7nc7mCLoScWYEyq5yObc/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="192049588"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 10:58:28 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 25 Jul 2025 10:58:27 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 25 Jul 2025 10:58:27 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.50)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 25 Jul 2025 10:58:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C2kVQkagA+9dAjdsYmExav2JB+AyVvo0ufnWxyIRdBTMCD7aSwaierrzyJkc1hZQ5wpWGWdEHOUKMhx3uf5vZ67bpAddhcK0J5OsOfV16MvIY2mJXlJBQDSo7omtp1Jo4kWPkfFE3KfmuoAYBods3CVSEHW4b0PVZh9fRWm5wlmCnXLX0kaXQZqrdYymzEXcmostC+2ZBUvxKyia8DaZFmsWOQVZi3lBZAk5lFvuJ/eiAKudHXl73EJ5uOCIVSw5p1FYLTb6hOghloRlvjEWVjHIZLP+WtyK+mH46FSoDYbx/IPtwCBWoJTm+86bYAbgVHF2TZyZtQAlbjwDQ7Dt9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jf4gsUJztmKvVnINXXCbOM9R8WxJQqkUgGh66rapQvU=;
 b=c+2eTm5flfDJLj1LxbH5AAHDZZxUXlK4MzAkfoB33ARwEpMxtYW5UsbYExQ2tz7wPNWIeOYd44iJr46SlhQdqELKLfm6tUp7uENjBJ7hyjYt+tiUmN7BUn1yQcqb623qHVR1sGXOH8FmxDdAVg0qJMDY1d9QJqRQmDHg/mfHyJqqx9KMfIdzjnsoLk6gYKLtH5wr9ljvwTAPeejWtkRmcL+DA0SfLJdWPk72Qj9/i+b14GqUR7H60ESlfeX95Q84f0YCTaT8CgYU4q96gVAmbvSJXDNpjjG2R8YhjUp5pgtZqKF0gUa0yuzENz0IlRdjMQ/QkHGQ8+N25HzhWUep7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21)
 by IA1PR11MB8864.namprd11.prod.outlook.com (2603:10b6:208:597::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Fri, 25 Jul
 2025 17:58:25 +0000
Received: from CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2]) by CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2%7]) with mapi id 15.20.8964.019; Fri, 25 Jul 2025
 17:58:25 +0000
Message-ID: <da022212-ea1f-4850-aa07-a35b75831f83@intel.com>
Date: Fri, 25 Jul 2025 10:58:21 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/xe_guc_ads: Consolidate guc_waklv_enable
 functions
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <saurabhg.gupta@intel.com>, <alex.zuo@intel.com>,
 <lucas.demarchi@intel.com>, <daniele.ceraolospurio@intel.com>,
 <shuicheng.lin@intel.com>
References: <20250725150749.68071-2-jonathan.cavitt@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250725150749.68071-2-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0149.namprd03.prod.outlook.com
 (2603:10b6:303:8c::34) To CY5PR11MB6391.namprd11.prod.outlook.com
 (2603:10b6:930:38::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6391:EE_|IA1PR11MB8864:EE_
X-MS-Office365-Filtering-Correlation-Id: 3516a58d-5ba5-4b61-5ade-08ddcba4d9e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZHc1cGlwa2I0b1V6TkllcFFaaUR0VlQ3bkEzZS9WUmtIejI3Qm40c0RQQlh2?=
 =?utf-8?B?d3ROcmtzNmJFL0xBbnlWbUhKS3JMNWhnbDNBL2VBeVNUczdCdjFpa0ROQlRz?=
 =?utf-8?B?Y0VjQ0V0aU5GZ20yRC8wb0h1N0F5K3I4RGRLWXRLNWF0d0tNWGJReVNDZ0c3?=
 =?utf-8?B?R2M4MkhRQnRlWmxoZUVjTXZMZnd2NzEwbncrcGZzQ3hnN0JXV2k0Ny9TcXFJ?=
 =?utf-8?B?eWxZNFVXRGJqczZ5dGw3RWgwZ0srOUxXbGVSQUZwbmh3a1E1WXAvbzMxdTMv?=
 =?utf-8?B?Mk9Ibit3VlRzU1k1c25LT0R6dkdxQTlrS0xmakplRndoajBabDZCOS9pSmM3?=
 =?utf-8?B?dFE1cHZJYzdiSDZndlhrRG1ETjFqbXZUamJZN1gwRXdyRkdBMTFKK0gwalZs?=
 =?utf-8?B?dEpOWnZvRjVCNVp3RHRWVERkS1hNc00rWXRldkR5K1lYc0dtRUpuOVNWWjZl?=
 =?utf-8?B?dkU4VjVhQ0NJZ2hPU3QrVjNoL1lIOVVldk1ycUs2OHhuMkx6S2lmeGt0cTR1?=
 =?utf-8?B?ckRyOU9jd3pDSXBmM1VnZlVVb1pVVkZWVERxMksvZVNLeHNnZ0F6YzJaVTZy?=
 =?utf-8?B?Wk5Oc2F3OHh6YTgrZGkyd2VZWm1ZakJBNENsTnVoUjc3Z2FsZWhTZ2JoOWZH?=
 =?utf-8?B?SFBMdVMyUTZCbVI1b3g5a0VZK1lvSDNjMFhtMDFLdVdRVzFTUFlxOXpVWEdi?=
 =?utf-8?B?UkNzQklLbG9tc3hJYWxDUGtMM3MrckEyOUQ2TnVoTUZKTnJFYTVZMFFBWFN4?=
 =?utf-8?B?ekpHMmdpcERvd2ZtdFVmeGk2dFlhSzZRNzEva0RHanRWRmxEcU1RRFI1Vnpx?=
 =?utf-8?B?bU9ISFRRcjdQc1FCdGVqZ2lDcklXd3Y4MzhKMjMwb1pjQjNiclF2VWRNTXZU?=
 =?utf-8?B?TXhjQUlRRGlxR05VN0UxdHVhV29ZK2xCWmU4VHMwVjZQMkhJcjdobEFTRGgz?=
 =?utf-8?B?eFY3WjZRdElNL2J2dFYzS21FMWJveFZ4THFJT3h6TTRSZitlUnNCWDRpY2hZ?=
 =?utf-8?B?MUJTNkZvQmc0TjNEcENnYjB2T2tHQzQ5OEJ0YzR6ZElJTFJOWjMzOXFjRk80?=
 =?utf-8?B?aW1yd0ZHMHVBL3ZpR0QxaWNlSm9SK2dpRnVkR2VRdVR0NEF4RDR6VDJhSmRQ?=
 =?utf-8?B?ck5oMDVVWFpsNjhsS05EUi9EY2M1dURKbjJiU0IyRURDanpjYU12cjNuekN5?=
 =?utf-8?B?ajA4Q21UenI3K0xnM2FlUHM1alVNNjVDYzhRczJmVzEzSzQyWkJQR1pZWmNq?=
 =?utf-8?B?UkFHNVFicVdGUklaN2JHMXQ3ckN1dlBxeUpaK2paTHFFYjZDZ1QrTlFLaFBI?=
 =?utf-8?B?LzR1SnNvdzVqZkVwQWpaNTBwb3YyNFdzL2gvdkh6VlozaTU0TXVnTTRQRjFk?=
 =?utf-8?B?ek51NEdnYWFQaVVVQWRUZ0pkSUdkQi9GMWtSalQrckw4MDZwOTMrTXB0R0cy?=
 =?utf-8?B?UU9KOXNWb3M1c3NjRy9hZVhaRlhqYTVJTHV6cEhoVGgrZkh4QTlVZ05VeEFO?=
 =?utf-8?B?b1kyVVpiTjM2UDR6OFB6blZuR2s3L1Z2K1lwbnpNV0k1VTlpRUZjcDkwdHh5?=
 =?utf-8?B?NnUwbVUzdHBZRGhWbER6aE5NQy9QS3BZLy9lcjhkMmc5STFXRmtGK0MzejJW?=
 =?utf-8?B?RTVYaVlvS01HcTV4ek5KdnAzODNKK2d5NlRMUkdzaGFPZGFSVy9MK3U2WXpw?=
 =?utf-8?B?elh5bnp5T0k5eERaZ05KaEEzTElxYkdSek1NbFgzYWhXcXF4SXFWWEc5dUxO?=
 =?utf-8?B?SlAyMEVhQUdUOWlJbmlxM2lQWjhmTThWU2M3dFZjTy9ZSFgyNG9FSzJSblFz?=
 =?utf-8?B?Ui9KS2hMeHFlTHU1cXZKR1U1UStUdlc1eHJYeld4WDg5ZlNGeUgwd3NJUGU2?=
 =?utf-8?B?a0dlMnpoVHRnSmZNK2Z6VnVQcTZPSE9FQ2ErcEtpUVcxUmFmM0Z4VlExdEZR?=
 =?utf-8?Q?ONXqm/1ghco=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6391.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RC81U2ZzMlQ3RlZvQWRNekJiL0JlUDBKVDdJcTRnbkNUdDgrS29YZjdPZmNK?=
 =?utf-8?B?Zy85TE1rVXFIMFhUNnJFdkVtMkRYQ0E1dkF3MTlCZzQ4R1JVcWtBT1g2bDBz?=
 =?utf-8?B?ZC9YSWRvdk8zS1JkcmFJYjdlZVN2VjhzNFZTWU1Xb09rZ1VHR3FnT0hHdHJP?=
 =?utf-8?B?OTM4TUFiTktiVnd1Q2tpRFlqVkpQTXc2d2oyV2h5TEhGak1LZ3pkZUkzTzFq?=
 =?utf-8?B?Q0FBellsQTBvS3YwSmoxdU82T1lhalVETGJKa3FWN0NKRjVHTlkxSmdWczMw?=
 =?utf-8?B?c1UzSjV0a1lycFFONE1aYkxyUU1qZTc4NlVmbHFZK3FSdTRjK0FidG5PZkpD?=
 =?utf-8?B?a2Q5VGVHK2kxWDdyYjRqSmV3MXJVRmRQNmNMc2J5TlEwU1BRbnhCWWJqaExk?=
 =?utf-8?B?S25LSzhHQkhSbzRrdDNVZ21GaEJGY0tTYUtWUEdLRWlmeVpHUEJMUDNKbTh5?=
 =?utf-8?B?U1NsSFJvdURkYVVLQjRmSUVucVRoSlBkVVZnVkpkZ1dEMVhCMXdmT0xCL0Fp?=
 =?utf-8?B?RGdNWnQ1ZWhkNWhlQUF1S3JTVmdPR3dsVGRJaktTK2hyeHhUTllOczk0dStQ?=
 =?utf-8?B?cXZOZndDNjBEanpVZzdqZmtsRjVsa0pUY2FOUWUvcXlxdnlvVDNGRXdwN2p0?=
 =?utf-8?B?Y3VsdzNwQVFmbkJKcytDTWw5TjdTcjJ3TytiSk5RRjU3TllEQm1kYVVSVHhB?=
 =?utf-8?B?WGNRT1h3c0lsdTk5Vk1HamM0TUp5Ykd3YlR4akdaVm4vOEh5NHhXci9vOWFv?=
 =?utf-8?B?dENURmNxL1FObmVRb3I1clJzSGkwRmhIOTJIR1QxODVCcFBHWC9DSXhwU1Vs?=
 =?utf-8?B?Y3NyMFhaRDR4WTJhNWRROEF1QWtvRXJKT092YWxCdDdBOXl4OXRCMDJLZkZH?=
 =?utf-8?B?YnVlZUJzVVk5VGZPM3lJR2NIaW4rV3M2K1ZrYm5XNXh1Q09FcXhyTnZTSGlL?=
 =?utf-8?B?aUNDUCtuOVhYdzJZbDlOVTVqbjBEKzlkdGJnalNNd3l6WWMwZWY5VmphdGpK?=
 =?utf-8?B?Wnd4SFNzbENneDE1Rm5VUlVZazkrY3pCL0RJSzlXRnErNElhbU4rQ0tXYlZ3?=
 =?utf-8?B?M2xnQjA0R2cxZHg0SGkxN0dYM3ZSZkgyWWVSbFF5VEdlUDh4aE9vTFhaSkh4?=
 =?utf-8?B?ejltZnRmenFpVkdsOUtSdy84ZzZIb2FpMFQ2cmRXZEt6VGxjLy9mZk9OQjFx?=
 =?utf-8?B?ZldTUjNKNFQ5aVNEc2VJa3MwbC9TZmttdXdsdXduWEJHOEFXUEwxMXhMMFpI?=
 =?utf-8?B?SHFwdFFBSlV2ck1sclVyMk45TVJ0K0pON3c1NmFzN1lIVGJhSmhlWjFjKzNI?=
 =?utf-8?B?Sk5wUThuQitlWGNQczg1K2ZhRTNGdXBSekN1cjAxTFcyL0swbjIwM1dobzJS?=
 =?utf-8?B?N1hOeDdYRFBiOVlCL0pzRkNMcDA2M1Y0Q1FMOGp5S0xtbFVOSlVCNE8za01Z?=
 =?utf-8?B?dCtKODJuMklrTGRJNmxZVEw4YXJidmFSeE9QMmZRSXhMdmtyUlV5TVBKWU91?=
 =?utf-8?B?QXdGZ3JCc0JVVUxDOHRDL0F6QXFvWTBteDZPVDVpTzZjRmlMUmRXUk9PTk81?=
 =?utf-8?B?N3pENktUQzVLMjZVb3lZSW13eFRmeS9vUTZId0g3RGpoVVRzT1lLR25jcU1Y?=
 =?utf-8?B?MTl0UHh4OFZ5ODVXWTQ3SGxMcGd3eEFQZkJXL1JRZXAvdm5GYytURzEvdzJN?=
 =?utf-8?B?OCs2WDVtMkhPaWZNRUtCQWxjc3JZbk9icG5MTml1Vy8xNDN5VzNkSm4yNmZv?=
 =?utf-8?B?YmVEbUFMeXZFd29JZEdsVDZ5aVRxZ0ZldWRWTTc2bGpIb21PeDhkazdEanBG?=
 =?utf-8?B?SlE1VlpENkpYamNUK2hjNERUOGVleEMzZDBYcGltcE01aHpRbnNNcGRyZWpT?=
 =?utf-8?B?UmE0VjM5Q0dBak5STXdHbHdlWmxvNno4bytBQ3cxVjQ0dUhQdlp6aktjWTNj?=
 =?utf-8?B?ekhWYXRNcUpOc0JiS2R4ZVpYTVdFSGRsMFJrTm1ZZ1lzbmhqSVBUK0ZzTTRJ?=
 =?utf-8?B?Q2R3NW1QMjBpZkxHU0h5NGRneWNpN3dOMGs4L3Btb3JPRlBIRHdvd3VxL1Jl?=
 =?utf-8?B?RmdrcEZDTVJWS2FqS3h2UEg1djlzZEtzbE9hMkhsaURLMllZQjNsc3cxQm9x?=
 =?utf-8?B?Qjd2RXFKeHBobUkwMzB1WlV0Z09lOE02MGZoeUFpbDlwU1UycnkzRk1FVVRi?=
 =?utf-8?B?VVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3516a58d-5ba5-4b61-5ade-08ddcba4d9e5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6391.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 17:58:24.9271 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sk6y6m4wmdE919uEZlJlZ+jUccYf2iaXHlBi+tLhBnNyB5WL+RLLQPTr2s/hBOtZajRP224jJ6+lY3q29SScjJWg4N4v4KGjXpe4zo2YM+c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8864
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

On 7/25/2025 8:07 AM, Jonathan Cavitt wrote:
> Presently, multiple versions of the guc_waklv_enable_.* function exist,
> all with different numbers of dwords added to the klv_entry array.  This
> is not extensible, and more duplicates of the function will need to be
> created if it ever becomes necessary to support 3 or more dwords per wa
> in the future.
>
> Consolidate the disparate guc_waklv_enable functions into a single
> guc_waklv_enable function that can take an arbitrary number of dword
> values.
>
> v2: Update length value properly (Shuicheng)
>
> Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Lucas De Marchi <lucas.demarch@intel.com>
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_ads.c | 144 ++++++++++++--------------------
>   1 file changed, 54 insertions(+), 90 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 8ff8626227ae..4183a82fdb0c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -284,83 +284,41 @@ static size_t calculate_golden_lrc_size(struct xe_guc_ads *ads)
>   	return total_size;
>   }
>   
> -static void guc_waklv_enable_two_word(struct xe_guc_ads *ads,
> -				      enum xe_guc_klv_ids klv_id,
> -				      u32 value1,
> -				      u32 value2,
> -				      u32 *offset, u32 *remain)
> +static void guc_waklv_enable(struct xe_guc_ads *ads,
> +			     enum xe_guc_klv_ids klv_id,
> +			     u32 dwords[], u32 num_dwords,
'data' or 'values' would be a better name than 'dwords'.

> +			     u32 *offset, u32 *remain)
>   {
> -	u32 size;
> -	u32 klv_entry[] = {
> -			/* 16:16 key/length */
> -			FIELD_PREP(GUC_KLV_0_KEY, klv_id) |
> -			FIELD_PREP(GUC_KLV_0_LEN, 2),
> -			value1,
> -			value2,
> -			/* 2 dword data */
> -	};
> -
> -	size = sizeof(klv_entry);
> +	size_t size = sizeof(u32) * (1 + num_dwords);
> +	u32 *klv_entry;
>   
>   	if (*remain < size) {
>   		drm_warn(&ads_to_xe(ads)->drm,
>   			 "w/a klv buffer too small to add klv id %d\n", klv_id);
The keys are all defined in hex and mostly as 16bit words, so would be 
more useful to print them as 0x%04X.

> -	} else {
> -		xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), *offset,
> -				 klv_entry, size);
> -		*offset += size;
> -		*remain -= size;
> +		return;
>   	}
> -}
> -
> -static void guc_waklv_enable_one_word(struct xe_guc_ads *ads,
> -				      enum xe_guc_klv_ids klv_id,
> -				      u32 value,
> -				      u32 *offset, u32 *remain)
> -{
> -	u32 size;
> -	u32 klv_entry[] = {
> -		/* 16:16 key/length */
> -		FIELD_PREP(GUC_KLV_0_KEY, klv_id) |
> -		FIELD_PREP(GUC_KLV_0_LEN, 1),
> -		value,
> -		/* 1 dword data */
> -	};
> -
> -	size = sizeof(klv_entry);
>   
> -	if (*remain < size) {
> +	klv_entry = kzalloc(size, GFP_KERNEL);
> +	if (!klv_entry) {
>   		drm_warn(&ads_to_xe(ads)->drm,
> -			 "w/a klv buffer too small to add klv id %d\n", klv_id);
> -	} else {
> -		xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), *offset,
> -				 klv_entry, size);
> -		*offset += size;
> -		*remain -= size;
> +			 "w/a klv buffer for klv id %d not allocated!\n", klv_id);
> +		return;
Rather than just printing an out of memory message (which is frowned 
upon by checkpatch) we should be returning an error code back up the 
stack. If we can't configure the system correctly than that could be a 
fatal error.

Alternatively, given that we currently only go up to two words of data, 
you could just use a static array that is sufficiently big for that max 
current size. Plus an assert in case someone does add a larger usage later.

Or even better, not have two copy operations in the first place. Just 
copy directly from 'dwords' to the ADS buffer.


>   	}
> -}
>   
> -static void guc_waklv_enable_simple(struct xe_guc_ads *ads,
> -				    enum xe_guc_klv_ids klv_id, u32 *offset, u32 *remain)
> -{
> -	u32 klv_entry[] = {
> -		/* 16:16 key/length */
> -		FIELD_PREP(GUC_KLV_0_KEY, klv_id) |
> -		FIELD_PREP(GUC_KLV_0_LEN, 0),
> -		/* 0 dwords data */
> -	};
> -	u32 size;
> +	/* 16:16 key/length */
> +	klv_entry[0] = FIELD_PREP(GUC_KLV_0_KEY, klv_id) |
> +		       FIELD_PREP(GUC_KLV_0_LEN, num_dwords);
>   
> -	size = sizeof(klv_entry);
> -
> -	if (xe_gt_WARN(ads_to_gt(ads), *remain < size,
> -		       "w/a klv buffer too small to add klv id %d\n", klv_id))
> -		return;
> +	/* add dwords of data */
> +	for (int i = 1; i <= num_dwords; i++)
> +		klv_entry[i] = dwords[i];
Why not a memcpy?

>   
>   	xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), *offset,
>   			 klv_entry, size);
>   	*offset += size;
>   	*remain -= size;
> +
> +	kfree(klv_entry);
>   }
>   
>   static void guc_waklv_init(struct xe_guc_ads *ads)
> @@ -373,49 +331,55 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
>   	remain = guc_ads_waklv_size(ads);
>   
>   	if (XE_WA(gt, 14019882105) || XE_WA(gt, 16021333562))
> -		guc_waklv_enable_simple(ads,
> -					GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED,
> -					&offset, &remain);
> +		guc_waklv_enable(ads,
> +				 GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED,
> +				 NULL, 0, &offset, &remain);
If we are touching every single one of these lines then maybe make the 
code more readable/efficient by removing unnecessary line wrapping? As 
in, move the KLV key param to the end of the list so it doesn't cause a 
line break in the middle:
        guc_waklv_enable(ads, NULL, 0, &offset, &remain,
GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED);

John.

>   	if (XE_WA(gt, 18024947630))
> -		guc_waklv_enable_simple(ads,
> -					GUC_WORKAROUND_KLV_ID_GAM_PFQ_SHADOW_TAIL_POLLING,
> -					&offset, &remain);
> +		guc_waklv_enable(ads,
> +				 GUC_WORKAROUND_KLV_ID_GAM_PFQ_SHADOW_TAIL_POLLING,
> +				 NULL, 0, &offset, &remain);
>   	if (XE_WA(gt, 16022287689))
> -		guc_waklv_enable_simple(ads,
> -					GUC_WORKAROUND_KLV_ID_DISABLE_MTP_DURING_ASYNC_COMPUTE,
> -					&offset, &remain);
> +		guc_waklv_enable(ads,
> +				 GUC_WORKAROUND_KLV_ID_DISABLE_MTP_DURING_ASYNC_COMPUTE,
> +				 NULL, 0, &offset, &remain);
>   
>   	if (XE_WA(gt, 14022866841))
> -		guc_waklv_enable_simple(ads,
> -					GUC_WA_KLV_WAKE_POWER_DOMAINS_FOR_OUTBOUND_MMIO,
> -					&offset, &remain);
> +		guc_waklv_enable(ads,
> +				 GUC_WA_KLV_WAKE_POWER_DOMAINS_FOR_OUTBOUND_MMIO,
> +				 NULL, 0, &offset, &remain);
>   
>   	/*
>   	 * On RC6 exit, GuC will write register 0xB04 with the default value provided. As of now,
>   	 * the default value for this register is determined to be 0xC40. This could change in the
>   	 * future, so GuC depends on KMD to send it the correct value.
>   	 */
> -	if (XE_WA(gt, 13011645652))
> -		guc_waklv_enable_one_word(ads,
> -					  GUC_WA_KLV_NP_RD_WRITE_TO_CLEAR_RCSM_AT_CGP_LATE_RESTORE,
> -					  0xC40,
> -					  &offset, &remain);
> +	if (XE_WA(gt, 13011645652)) {
> +		u32 arr[] = {
Is 'arr' short for array? Would be clearer to just call it 'data' or 
'value' or some such.

> +			0xC40,
> +		};
Also, this could just be:
     u32 value = 0xC40;
     guv_waklv_enable(..., &value, sizeof(value) / sizeof(u32), ...);

> +		guc_waklv_enable(ads,
> +				 GUC_WA_KLV_NP_RD_WRITE_TO_CLEAR_RCSM_AT_CGP_LATE_RESTORE,
> +				 arr, 1, &offset, &remain);
> +	}
>   
>   	if (XE_WA(gt, 14022293748) || XE_WA(gt, 22019794406))
> -		guc_waklv_enable_simple(ads,
> -					GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET,
> -					&offset, &remain);
> +		guc_waklv_enable(ads,
> +				 GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET,
> +				 NULL, 0, &offset, &remain);
>   
>   	if (GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER(70, 44, 0) && XE_WA(gt, 16026508708))
> -		guc_waklv_enable_simple(ads,
> -					GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH,
> -					&offset, &remain);
> -	if (GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER(70, 47, 0) && XE_WA(gt, 16026007364))
> -		guc_waklv_enable_two_word(ads,
> -					  GUC_WA_KLV_RESTORE_UNSAVED_MEDIA_CONTROL_REG,
> -					  0x0,
> -					  0xF,
> -					  &offset, &remain);
> +		guc_waklv_enable(ads,
> +				 GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH,
> +				 NULL, 0, &offset, &remain);
> +	if (GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER(70, 47, 0) && XE_WA(gt, 16026007364)) {
> +		u32 arr[] = {
As above.

> +			0x0,
> +			0xF,
> +		};
> +		guc_waklv_enable(ads,
> +				 GUC_WA_KLV_RESTORE_UNSAVED_MEDIA_CONTROL_REG,
> +				 arr, 2, &offset, &remain);
"sizeof(arr) / sizeof(u32)" rather than hard coding a magic number.

John.

> +	}
>   
>   	size = guc_ads_waklv_size(ads) - remain;
>   	if (!size)


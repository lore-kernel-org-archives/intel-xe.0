Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E5B1D6ACFC
	for <intel-xe@archiver.kernel.org>; Wed, 27 Nov 2024 18:47:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DBC010E072;
	Wed, 27 Nov 2024 18:47:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E/094Szj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F291910E072
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Nov 2024 18:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732733255; x=1764269255;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=0WLRIggmY4hh7vuU4WfsFPWFmXNy7Kx7taEgwrPxrpE=;
 b=E/094SzjjU2IVl8bxCuXFh+1K5MjopyWkvowSz5MNEXxLt9NbUP751IX
 HdRH4szkR8JZh61K5vYo6Zxj5BVs7YMxUmT751UUOQ7POo7EHmjK5UKMI
 e8WecpczKCCUBTU09JA9owrlNiFcFly5zxghnuSSRYepKdVd8CnrDdouu
 d03AZ/5ZoaLnUjsbtErcUfADay0FAA4QL/VIgVucO4Kwiswrg7c4OWBX6
 btU3IkNM1VhpKTsHQQqkBA2vHwE1j7T2oC6TEpCw4LDVwJo/XA9lSXPvy
 qMToDUrHyLb0oZiwIVFtWfNgstSIJh2xsvjAz/K7x15nUwTVFsZzsjb6u g==;
X-CSE-ConnectionGUID: w8276U5GS9uhqjV+i3a7Zg==
X-CSE-MsgGUID: 6LbKr6OPSZqwAO1xqGZxCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="36738746"
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; d="scan'208";a="36738746"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 10:47:35 -0800
X-CSE-ConnectionGUID: wbdXAc9ERNOzQOnD9XLb/g==
X-CSE-MsgGUID: VD7CuC2RQZyTjq4x1R7mcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; d="scan'208";a="92415200"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Nov 2024 10:47:34 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 27 Nov 2024 10:47:34 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 27 Nov 2024 10:47:34 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 27 Nov 2024 10:47:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P06LK55CbB1u5f1wUoTrvFCZbZwNRYZJdtAv3eclVPRTXvwzYCwAuYjQ7GXyOjzal5mGLTSPqeyoAay8gVCAqWHeVTJYucQyovic+eiMiLr3uOPuTCgJTwoFe2Ys/H9Rw0XFU1a8B4b6p41WTA1fmKAw4VjkEBMOy1kGTUVw7fGO8lW7rxDWXw9i7WgTxN5jRi3Zem1lKXtIupdXgO2zRYSRbXi4mPJ1oCQULVzm3kxTipStLCY40LSKXpZY9XpyG61fCtL2F++kPjIEGl7CiLHKNuuOyYaJ5M3uHgsDFSNTN3o1ldNzSw2R+siR/jwOWtEknVWjARZlLUDD3WzygQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rb842uqO4D9f89KCL9c12vUi4S3Gc56CKuodbixQluY=;
 b=h0DtEaiRWLzKy181s+3yP9vlT0f2ck3RAZ8cz+zy+I4XRdqL0SptoTJ1l6Z4uPNeYYurNuxQRLRvLNyM52BIkaS7e7K2GSAF8QUxegoqrwpmh8jfkFOU7/fTKNRsE69M9b9W37BjGFCKaqvv5BUjjxS9yE4w/0fjhQg7g408Umff9EGArDUBT/6hW6sGGROekh2lmEPV1E773jFBcW4kpx+jM/kcdTnY28DUZKFwsjev9uujn29cNG96HxY1CmTHM9+9vN7XeuIWQKh3SfMG55mh0PLoFn29LJoT0RVj8RByWT+sMadNDkP1ooAdFnZyDk+sGZxib+2NYjRnwfucQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA3PR11MB7553.namprd11.prod.outlook.com (2603:10b6:806:316::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Wed, 27 Nov
 2024 18:47:30 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8207.010; Wed, 27 Nov 2024
 18:47:30 +0000
Date: Wed, 27 Nov 2024 10:47:28 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Riana Tauro <riana.tauro@intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@linux.intel.com>, "Belgaumkar, Vinay"
 <vinay.belgaumkar@intel.com>, <intel-xe@lists.freedesktop.org>, "Tvrtko
 Ursulin" <tvrtko.ursulin@intel.com>, Bommu Krishnaiah
 <krishnaiah.bommu@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 1/4] drm/xe/pmu: Enable PMU interface
Message-ID: <Z0dpQFtZhxaHXdSv@orsosgc001>
References: <20240827164107.47034-1-vinay.belgaumkar@intel.com>
 <20240827164107.47034-2-vinay.belgaumkar@intel.com>
 <o42m66pseq7yxitt27whcwjntvtuoxndlxcvld2vak5i6ejhtv@ny3ilfuxvwyz>
 <602bffcd-d66f-4b49-b3b4-abb934b00f3a@intel.com>
 <3de57ee4-d8a6-4b39-bd17-0fd2f00adc2b@linux.intel.com>
 <shrwluh7x22szbsntnu7chuxr4i4q2uvrmfy6bxeru4ue6vemd@moyhm6rfrw3f>
 <Z0TLB2W3n37mPFRM@orsosgc001>
 <3288651c-3b4f-4e84-accf-a0ae8c77eb83@intel.com>
 <bdthqtjd6va275hbcesr7uayjie3ykxtebaxf7cuf64fczhrqd@khrjqxa5nuq4>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bdthqtjd6va275hbcesr7uayjie3ykxtebaxf7cuf64fczhrqd@khrjqxa5nuq4>
X-ClientProxiedBy: MW4PR04CA0148.namprd04.prod.outlook.com
 (2603:10b6:303:84::33) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA3PR11MB7553:EE_
X-MS-Office365-Filtering-Correlation-Id: aa99e313-1a08-4033-a4b7-08dd0f13f254
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RlFSNm5iL2x4eTBoTG5nYkI5SGpPd2l1djZGOFM4R2JnaDY1dzVsLzgwODY1?=
 =?utf-8?B?V2QvbHNQNUI4UWRLY05kcDl4MkIzeTlMSEFBU2tqR0M3UUpBVWQxcFlqUHE4?=
 =?utf-8?B?VUU0bXlIYjhLZVJZSW8wRGNrcG5YQVNVTmgrck1XL09nT2pvN2d5RmYwcHln?=
 =?utf-8?B?OExHSzZWSnd4ZTNFWnYrVTY5TzV0SHZncFJVbzg3aWswYkIzZ21FTW0yWlpw?=
 =?utf-8?B?SmpjaDRwUjFlYXg0aUtlYmtGTm0wUXhQanhhTDFDUS9qTHUwUGN6VWlpL0l5?=
 =?utf-8?B?L1VQM3ZpUFJXUVJ4MXNqbUpMM0hWYkcyWkgrSmpQWmIzZ3lkVDBzTVpCOXV6?=
 =?utf-8?B?bWFJbm9UbDJxUlQ0Vk9xNE1URE1MZG9wNUxoKzRKSERGK3Q0MEpKRTZDaGRB?=
 =?utf-8?B?VStzaVlMWmd0dFVvK3dOUnJUcTNBNzBtYmhwZlJveDU2eXdOUmtSaHIrdXYv?=
 =?utf-8?B?OW15cStoVis4enJGU241aU5ZWVl3azdUMEVpcmIvT1BMRy9wQ1lsem80cTdV?=
 =?utf-8?B?RHNCWlZnZFArTXIzL2R5T2l1cHBGMGlEVzVKb1JzMm5jNlZ2czd0L2EzQm1W?=
 =?utf-8?B?TlhjbzdSNk5nOEFZaDNUZ0dGRTQ1RE81dm1YTWhrQ1NtbUZJNlMvMCtZWmUz?=
 =?utf-8?B?NURaazdEUzNoV05adnNsYmlubHZ1Z0pHekZ3ZGMyaHFKQ3hrMFMydEFjOTJL?=
 =?utf-8?B?Y3VaSzRyS3M2Mi9FcjVoK1B5S2ZGSVVGKzExOFFydWxpM3ZCYVYwaWpMMi8w?=
 =?utf-8?B?RVJyZHp2eUFGNTdZcWxVTnhrYUEzNmdBUmtkTzVDckRaWWxhUHo1ZlJmRWNm?=
 =?utf-8?B?a1poMG5lVVBuUk43OVBkVWZheEg4SGFKcmFIU1ZNOEQxd1d5aEdLZFJFSHNh?=
 =?utf-8?B?OGRBR3pGb2hVRjNuYllkUllFYnhZT2J1UDVtcE1TQmdwMXloa1VMOG9yK21q?=
 =?utf-8?B?WHpReVY0clpkdzJkWXFnMmtxd3lZZmcyWGhFcC9saEVyNzM2UmRUZnE3YlU1?=
 =?utf-8?B?RjhCWVZ3WDFSY0JFYXJBMGNQWENTTlE3UmM5OWdwMGoyWWFVSnBGRVRVL0tz?=
 =?utf-8?B?Vm5JUlZHQnVJWGVVdjRnQkZLL2JTQS9ab2dQSlI3bHF3UTNUdCt1SjJuNU5T?=
 =?utf-8?B?bC9CZVpTNVdLRUZiWlNUbFgrbWJoQUpzQWN3S0xGWUhrbnVLTWdzZFhmVGVs?=
 =?utf-8?B?UE5xR3pWSmQ5VW1sTklKUlNYR1JidzlkcFJ2cnNqKzRBWWdtUDBFTktZVTNj?=
 =?utf-8?B?S1ZXVEFWb2ZwcnFBU0NmdlE2T2hnbmszYTZ0RTczRm1Qcm9yaDE3clRrWUo3?=
 =?utf-8?B?bXNUL1ZkaWpwbHU5YXVXRzFUSE5pUm9MQVJPTzUwbkRweWMxSE9JUjBxY0Fw?=
 =?utf-8?B?Snh4MjMrdy8yOVBkT20xbjg1RWdKQTRFWk9NNzNJZy9DTk9vMUd2Q2lES3Vs?=
 =?utf-8?B?eUNySmhnVlFsalVKM3QrdXZrNnE4UUlQNEFxK2plaEcxMUNUNWR4YXFaN1ZD?=
 =?utf-8?B?Zks1OEJNUUhpb3hlQmxNZkQ1UVVrVUU4T1p5cExLZmRIQVFaQjAzVzRDZXN6?=
 =?utf-8?B?RFVhY0lHb25rMTE1Z2dtT0l1c0FDVjdFV2g0K3N0bUZkdGVPaWpxWEdYKzVN?=
 =?utf-8?B?RDZ0UGNOcXJoaUpnay9OckxwNkVLWWZuYzJvQ05sVWpEUGdzZ25zUzMrbzVT?=
 =?utf-8?B?aTE0cDZBZ0VkTlBUb3pDYzd2YmFpb1hSMjAzaHRTOHVGNzVOdUFwejlDR2NN?=
 =?utf-8?Q?xCjo6rwe4iIv37fVqo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnUxN0lnOFJIa2gxeUg2c0pvUTB1VGQrUWdRYkl4VmNMZ0Z2US9KR0RHY1k1?=
 =?utf-8?B?dk5YeEFTZURvSDBVZVpabXhWdWxsUDYvZzByZDMwcndlL003T2RBaHNxV21l?=
 =?utf-8?B?OXF0WiswampSVHBtcFNaeUF4N2JRMEpMYWkrbjh6TUNNOE5GQk1aK1BJV3dp?=
 =?utf-8?B?TVVDV3VIOE9NenJMY244REI4MFREbmEycHArKzhZNmpsdFNLRFNiSkFxNXlV?=
 =?utf-8?B?cXBwa2wvVmpGdFpXdVBwTndhMVRrMzZNUjFGSTRveVY2ZUhzTjY5WjlDUFlN?=
 =?utf-8?B?VEJ6NlhwYmRWazluRURoWUhWT3JUMjc1TFQ2RkJWV2tiTThVRHIwSXo4cEVm?=
 =?utf-8?B?R0hmaXhaSVgxNmdVUHVQbUp3WExZdmtkdnRGNHpiaEpJUmZMVVJXV2VIRnBZ?=
 =?utf-8?B?UTg0NkRGQlhUcmYvREp0d01UVkZIbDN4R1p6bXRmT1VsQ3BLSFJBNVg0Mm9J?=
 =?utf-8?B?VnpYVVlJWFpHdHd6Rkx5SkJjODZRd0RsMlRjVUVqMmVIMk16cCs2em1DWXIz?=
 =?utf-8?B?OUVCbUZhS3F1NkJjSnRmQ2c1aVlTN1ZHd1FOQzNmelZIUzFSQWZPanA0elBs?=
 =?utf-8?B?bWZxTktFaFNNQ2NPcjIzL2EwR29iSzNBQlhaYjlqMENla2lmWjdtZGFjRG9v?=
 =?utf-8?B?dm52OVZRU0dXZzFHVGV6MnNUYmZodXlNdU45NXMyTUlwQmR3V0kvWmhzNUYv?=
 =?utf-8?B?cllsaUJBOHo4M3BGVE9WZ2J1TVJSbWJrQWZBNWZUS3lDR1ByYm5hd291eWVR?=
 =?utf-8?B?QnpoTWwvbm5tRHZEMUJQZW11QmY2N09CQ1VvczJsREp3N2V1cDF2aGdJTXlz?=
 =?utf-8?B?ODRnS1E4ZVBSbmY4OVlWbFNjMStZR09UTEpxV2t0YkZpa0dqYUw4R1RDSUVP?=
 =?utf-8?B?cHA4ZCtBSWRQcEVycXdhdlYwMk1xdlBhSGdnbVlUandqNlNDTEhNajRycWgy?=
 =?utf-8?B?Uml0ZkRLWFVoUmFUeWsrSHBWWFdDRGFOYXFSQXJSTllZREwwdm01NjdkR1Z1?=
 =?utf-8?B?dTd5U3daYzV3NXNhMnpxcHRub0VPczY1SkwybTRoRjg4S1FMMU9tMzNoVnhr?=
 =?utf-8?B?TkVpMFg1d0V0M0l1RlhNN2phVDZEaXNUWmxkVk0vOHE0US80NGRjK0R6YTlE?=
 =?utf-8?B?Vk1SWjI2MWNvNDBPSE9QNVloRi9PaUgxNDlyWTlMZytjSnJkcXIvU1BNNDFx?=
 =?utf-8?B?SFB1TFJrZXpCdVF5QWkvTEdaTFR4dWVjSnhnWlc3bWJzZjB3Uy9IaVZTd0Yz?=
 =?utf-8?B?anhDU1ZFOE4raG9DWWYxSXp4ZVBSUjlib0xPL3RHaXlzWDIrYW9adXpTSXF5?=
 =?utf-8?B?ckltcFZmR2JHL0dlMVNKR1pIVGE2d0RzMzlPOEM1SElzcWk5VDMxcEhGaG9I?=
 =?utf-8?B?QU5YbVU1c05iSGdVWDk2OHJ2cmxCejRPbEpuNUJZVVdpOHRqUWVHZjJVRzFI?=
 =?utf-8?B?YzVUQXBGNnR3Z1VIMTZmWXlDQlJlVDA2VW5kRnpwTXk2TU1DWGRRU29XTE10?=
 =?utf-8?B?QjhXYXlqekFTaDZhOTFaU2ZkRTNIbk5iU1pFVk1jclJqTGVUYm5wcEdjUHVO?=
 =?utf-8?B?ZzJtbnF4TkhGZVdqang5clpYWmM5R2VBd3FQOFhGOG1GUDJhRThVRlhhZ3o4?=
 =?utf-8?B?RDZBeFAxL0NiOVY4RXVIUjJIYyt5eUJETTlKelpoYTM3a3lSZ1lUL2NaU0N4?=
 =?utf-8?B?MWN3eTZsZm50NkYxZCsvNzI2TWwvbFIxbzNoaTQ4VlZxUXJCRUxqV3JmNXhr?=
 =?utf-8?B?emRhV3pMc09mRDBici9yQXoyVDQzbEVheEVadEdBMzk3UGtMZER5Nkg3QnBF?=
 =?utf-8?B?bCtWVzcrc01zR29wUG9nR3ZCRjBKcDlSTExmZmUvYjViZXhSb2NRZk9iQUQv?=
 =?utf-8?B?bkFBMSsvbWpSTFNaQitST0N6WVNhTzhhVVVkVUU3WGxiMHZLNTNSY3hacnp5?=
 =?utf-8?B?MVNVVU9TQTFMc0V3T1g5c0RSaUNEV2tDWnVQdHNXcmQ1N2FtU2x6ODJOSThL?=
 =?utf-8?B?NW8wM0gzWjdZempIRUY5dG45aUhTNTZIYzdJYTNpVXZmTnB2WWFJOVIzOUxS?=
 =?utf-8?B?VWIzWVZZSVZkQ2xkV0xyY3BpNlBtZGJIZm80aHgrRVI2a3BxQkVpTCtPejZr?=
 =?utf-8?B?ZDFuVVBPYWJhTkF3ellJRXhvWllpaVMrbWcxaXJ5M3FkelhFOVVBWUpiSS94?=
 =?utf-8?Q?unMmqZrvmnCF86ncBb46P2s=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aa99e313-1a08-4033-a4b7-08dd0f13f254
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2024 18:47:30.2569 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RR1W0chcZxKpuM6AZbzut+ASM1C/aZ03C4TopxqKkbo4ib4snuAoNuKjaqo7AzAd6H6PknUd+noIhneJStZe7w7cJSQXgn5yPfjHKqjPTk0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7553
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

On Wed, Nov 27, 2024 at 11:13:24AM -0600, Lucas De Marchi wrote:
>On Wed, Nov 27, 2024 at 12:42:14PM +0530, Riana Tauro wrote:
>>Hi Lucas
>>
>>On 11/26/2024 12:37 AM, Umesh Nerlige Ramappa wrote:
>>>On Mon, Sep 02, 2024 at 10:01:11PM -0500, Lucas De Marchi wrote:
>>>>On Mon, Sep 02, 2024 at 11:29:05AM GMT, Aravind Iddamsetty wrote:
>>>>>
>>>>>On 30/08/24 03:40, Belgaumkar, Vinay wrote:
>>>>>>
>>>>>>On 8/28/2024 12:33 PM, Lucas De Marchi wrote:
>>>>>>>On Tue, Aug 27, 2024 at 09:41:04AM GMT, Vinay Belgaumkar wrote:
>>>>>>>>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>>>>>>>>index b6fbe4988f2e..de6f39db618c 100644
>>>>>>>>--- a/include/uapi/drm/xe_drm.h
>>>>>>>>+++ b/include/uapi/drm/xe_drm.h
>>>>>>>>@@ -1389,6 +1389,40 @@ struct drm_xe_wait_user_fence {
>>>>>>>>    __u64 reserved[2];
>>>>>>>>};
>>>>>>>>
>>>>>>>>+/**
>>>>>>>>+ * DOC: XE PMU event config IDs
>>>>>>>>+ *
>>>>>>>>+ * Check 'man perf_event_open' to use the ID's 
>>>>>>>>XE_PMU_XXXX listed in xe_drm.h
>>>>>>>>+ * in 'struct perf_event_attr' as part of 
>>>>>>>>perf_event_open syscall to read a
>>>>>>>>+ * particular event.
>>>>>>>>+ *
>>>>>>>>+ * For example to open the XE_PMU_RENDER_GROUP_BUSY(0):
>>>>>>>>+ *
>>>>>>>>+ * .. code-block:: C
>>>>>>>>+ *
>>>>>>>>+ *    struct perf_event_attr attr;
>>>>>>>>+ *    long long count;
>>>>>>>>+ *    int cpu = 0;
>>>>>>>>+ *    int fd;
>>>>>>>>+ *
>>>>>>>>+ *    memset(&attr, 0, sizeof(struct perf_event_attr));
>>>>>>>>+ *    attr.type = type; // eg: 
>>>>>>>>/sys/bus/event_source/devices/ xe_0000_56_00.0/type
>>>>>>>>+ *    attr.read_format = PERF_FORMAT_TOTAL_TIME_ENABLED;
>>>>>>>>+ *    attr.use_clockid = 1;
>>>>>>>>+ *    attr.clockid = CLOCK_MONOTONIC;
>>>>>>>>+ *    attr.config = XE_PMU_RENDER_GROUP_BUSY(0);
>>>>>>>>+ *
>>>>>>>>+ *    fd = syscall(__NR_perf_event_open, &attr, -1, cpu, -1, 0);
>>>>>>>>+ */
>>>>>>>>+
>>>>>>>>+/*
>>>>>>>>+ * Top bits of every counter are GT id.
>>>>>>>>+ */
>>>>>>>>+#define __XE_PMU_GT_SHIFT (56)
>>>>>>>>+
>>>>>>>>+#define ___XE_PMU_OTHER(gt, x) \
>>>>>>>>+    (((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
>>>>>>>>+
>>>>>>>
>>>>>>>The perf uapi is self-describing and users should look up 
>>>>>>>on sysfs what
>>>>>>>to use. Example for i915 since it's what I'm currently working on:
>>>>>>>
>>>>>>>    $ cat /sys/bus/event_source/devices/i915/events/actual-frequency
>>>>>>>    config=0x100000
>>>>>>>    $ cat 
>>>>>>>/sys/bus/event_source/devices/i915/events/actual- 
>>>>>>>frequency.unit
>>>>>>>    M
>>>>>>>
>>>>>>>`perf list` works fine and doesn't know anything about this xe-only
>>>>>>>header. Why would we add anything here rather than 
>>>>>>>encourage other users
>>>>>>>to read from the generic interface?
>>>>>>
>>>>>>Agree. perf list | grep rc6 is sufficient.
>>>>>
>>>>>This was previously asked by Rodrigo https:// 
>>>>>patchwork.freedesktop.org/patch/555013/?series=119504&rev=5
>>>>>
>>>>>so what changed from then to now.
>>>>
>>>>2 different things. That rev you are pointing out had:
>>>>
>>>>include/uapi/drm/xe_drm.h            |  16 +
>>>>
>>>>so the uapi was being changed without proper doc. Rodrigo asked for the
>>>>documentation to be added, because that is the proper way to add things
>>>>to the uapi header.
>>>>
>>>>In this review what I noticed though is that the change shouldn't be
>>>>there in the first place. We shouldn't change anything in the drm/xe
>>>>UAPI header because this is actually an UAPI (via sysfs) coming from
>>>>perf.
>>>
>>>@Lucas,
>>>
>>>Agree. This is carried over from i915, where other constraints may 
>>>have led to adding some header bits for gt.
>>>
>>>I want to mention that now there are 2 events per engine - ticks 
>>>(actual engine run ticks) and total_ticks (total ticks that the 
>>>engine was alloted) which enable us to take a ratio of deltas to 
>>>calculate utilization at the engine level. If we add the config 
>>>for each possible combination of gt and vf_id, we would have
>>>
>>>num_engines * 2 * num_gts * num_vfs
>
>not sure what you're trying to do here with that * 2...?
>
>what are you trying to read from the userspace side?  2 separate
>counters or just 1 with the embedded info?

2 separate counters per engine. Both are required to calculate % 
busyness. This is similar to PCEU where we read 2 counters and then 
determine the % utilization.

>
>Also, why is this considering num_vfs? Is this to monitor from the host
>all the VFs being used?

Yes. Currently VF specific utilization can only be accessed from host.

>If so, then we need to be careful what we are
>trying to support: there's no dynamic event creation in perf - we'd
>need to unregister and register the pmu again like it's done in the
>uncore pmu

Yes, initially I was suggesting that only supported events should show 
up in sysfs, but later Riana pointed out that we cannot do it, so I was 
hoping we could just register events for max_vfs (which is known at 
driver load time). Although, that's not a clean way to do it.

Ideally VF KMD should be responsible for it's own instance of PMU (like 
below), but reading the counters from VF is not supported yet,

/sys/bus/event_source/devices/<host_device>/events
/sys/bus/event_source/devices/<vf1>/events
/sys/bus/event_source/devices/<vf2>/events
...

What we have here is a special case where VF events are being accessed 
from host, so I am unclear on what the best interface would be.

Maybe we just create new PMU instances in host for each provisioned VF 
and then list those events under host like below:

/sys/bus/event_source/devices/<host_device>/events/vf1
/sys/bus/event_source/devices/<host_device>/events/vf2
...

These sysfs directories will get created dynamically, but will be 
associated with separate PMU instance.

Thoughts?

Thanks,
Umesh

>
>>>
>>>where num_vfs should (ideally) be the number of vfs provisioned.
>>
>>Here it will be max_vfs instead of provisioned num_vfs. Pmu event 
>>attributes are added on pmu_register.
>>
>>num_engines * 2 * num_gts * max_vfs
>>
>>Did not find a way to add/remove events dynamically.
>
>there isn't. other PMUs unregister and register it again... but that is
>only done on early probe, not something really dynamic. If we want to
>support something dynamic like that then we really need to wait the
>perf_pmu_unregister() to be fixed: not really possible without that.
>
>
>Lucas De Marchi
>
>>
>>Thanks
>>Riana
>>
>>>
>>>Do you think that's fine?
>
>you have config, config1 and config2, each with 64bits
>
>I'm not really sure what that *2 mean and we'd better have some room
>to grow it for ABI compatibility (even if a proper tool would read the
>sysfs to check what is the meaning of each bit).
>
>Lucas De Marchi
>
>>>
>>>Thanks,
>>>Umesh
>>>
>>>>
>>>>Lucas De Marchi
>>>>
>>>>
>>>>>
>>>>>Thanks,
>>>>>Aravind.
>>>>>
>>>>>>
>>>>>>Thanks,
>>>>>>
>>>>>>Vinay.
>>>>>>
>>>>>>>
>>>>>>>Lucas De Marchi
>>

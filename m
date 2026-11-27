Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08847606A31C
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 09:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fmXxu2UQ;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=JlVTcSAu
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE8E0112902;
	Fri, 27 Nov 2026 09:48:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 778F1112902
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Nov 2026 09:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795772908; x=1827308908;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ajRjx/BIFjnUPEbz0YVG11by4gG8sHDO0nJwEuvn7/k=;
 b=fmXxu2UQYvaVgdxqezxQ9e+BLe7Rrq+CTt/7BgGxlpFIRhpI7Yj7QmKV
 mZETLBQpOaqJlIjvdiYw+1M3UxHfz/uLabQgtN1ae/NczJn7I225jbnut
 ugr0b6ehL6Eig7oChjtMqfv0xoJjtcGzz6zXo2riZPeQzG1+AI6VvKxBv
 Vvm/Km3UgOG0+K+TXh5QGPcMYqNkGb+oSkpxzeyAz4Q/xKQSuPto9AYpU
 ujgsBZujh9BeWv5fl+XEeOb46MeaUuwpCiOh6NO/RYyTfhCFj4r6mdjvR
 Xvy6F18evsTRKuhngJVbcHwPzYjJ4ZgkZaat2udpVtlmdXIZoGBn7atJj w==;
X-CSE-ConnectionGUID: DXs6+hKMT5af93bt8tDk0Q==
X-CSE-MsgGUID: zn8F4c7LRa6sCs0FSM3AAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4681306"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4681306"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 01:48:28 -0800
X-CSE-ConnectionGUID: fm4oLwR7SvuRN61xvoGDIw==
X-CSE-MsgGUID: +RhzLlPiT169JRecHtnkPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="12231445"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 01:48:27 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 01:48:26 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Fri, 27 Nov 2026 01:48:26 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.19)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 01:48:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XNVgbXiMMdAvVhySc8Hthhrreolqf5v1NLxFPQZF3MLwqPYQcDxINrHI5dSUwXR7CHOj/2KH99WRbcW5e8SbqJxRNfxyGUzq0gYwY9YzYF49Z0v2bWxjPbw3vxz4ZA1hOlJlulITNWD7bKBBFmJebTVIFUZqylCb3K1YCXD7g5fO6m57MrNeralhHVBvLbXdC6D3xyZIN7aDyje/iXLIvMCdVsIdqGynTT0u95MkdW9cTJEoWKAeEL2ByiqzuHXOH4pHfafv86OeFjtVXBYxS0ACUBjiyE9p4WiCTzApl5Goa6ro823iaGKpte1GJjl76Fl+VhpVXlOZPAuepIPjDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZFZ4xTLR1I15gL+vuISm2oIv9k9R9mYlKUHxTk8QRlk=;
 b=IOn1Hq8K+O0GpCvB8r5lAWW2qKF+sE1RG1vmIghsTpAfIP5f5e1q/B6zQgzsAyPNo0CcKlAbeI2dqhqnOyE0CfRUMYPcmVc58PXwTt8SgQXEik543BycFX6CG6Z/fs2cDElBS/1TSkotwAuopJzIrvp4Us6UTV4rkDj8xYA5pajIi8h4S80r0L7ANncaZw4laW4Z0x57A04WATVD8692sIvi7vOowU4WBqUQAQhUhCOJWHj6r0P/U7WxtNU2L6WkV2nJOGNs9Fnv3sJPbY/bHAHAa2JdCydZPHnt/r8i3eH+my2hyjAQMfeoSH21XH0cqHCDeXxpwUTp+CEl2Za5+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZFZ4xTLR1I15gL+vuISm2oIv9k9R9mYlKUHxTk8QRlk=;
 b=JlVTcSAuMYp4oqqb4S5o+pseNLaBpeHGdOzsd76ZozjkTZLj5C5wmSmoSqmSMidpHWcNJ1BZeybY5by9v3K/tV2mxKZK1mmNnlfK80AjLSSDzawV5QP7nG1c/S25pRdrCGnJ+uMAEd6Vl0mAWM20X3GmpibjGHQOOpg+WEoh2aY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by PH7PR11MB6978.namprd11.prod.outlook.com (2603:10b6:510:206::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Fri, 27 Nov
 2026 09:48:24 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%3]) with mapi id 15.21.0662.001; Fri, 27 Nov 2026
 09:48:24 +0000
Date: Fri, 27 Nov 2026 10:48:20 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Lukasz Laguna <lukasz.laguna@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <satyanarayana.k.v.p@intel.com>,
 <tomasz.lis@intel.com>, <raag.jadav@intel.com>
Subject: Re: [PATCH v3 2/2] drm/xe/vf: Support PCIe FLR
Message-ID: <20261127094820.3luzfcm2dfzzks3h@intel.com>
References: <20261125080621.599255-1-lukasz.laguna@intel.com>
 <20261125080621.599255-3-lukasz.laguna@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261125080621.599255-3-lukasz.laguna@intel.com>
X-ClientProxiedBy: DU2PR04CA0282.eurprd04.prod.outlook.com
 (2603:10a6:10:28c::17) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|PH7PR11MB6978:EE_
X-MS-Office365-Filtering-Correlation-Id: dea6c6d0-4ee3-4da4-7d1d-08df4c6b943a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|4143699003|261009223027099003|18002099003|6133799003|22082099003|10067099003|11063799006|261021123027099003|261026140227099003|261021121427099003|261026121527099003|261022105027099003|56012099006|261028144727099003|261102123227099003;
X-Microsoft-Antispam-Message-Info: TSX4paD9v3og+Bnrd/eM0nStJPcy/r9Kp4j5cn+R4XcEq7b2gVBZGm3i2jIPYmIkvxFK6csfwduRr9B7ozi3if8nZ80XjLWzv/AmYpK9f4jWIFUTSg/LfsUEQNEbOR/vxbdIOOvEIPu8etkBdQ0RuTOiEP/qD3QXk54dqBoDLYrz7ZMjYjsUM6SCowtM1hOZOpv0G/v20SAwbCGPOKNQHAIdCr05vGHPZ0oZOdn8ZsjtJjDyi+RtCwxBY32Hf67GOFoEWYn/0vm5bkv4h4LWkhYejx3p/Wp8SpuaEEnnbiOnFfAmEZAQEddj7xwgEA6QablkuBupD25y5cAlVjMVaMp5AQt5vDPoRh/KxZxohdQsuqGGK7908pvEldsJPk0LLNBB433jqS+g8HMDPUrY8rWSfyzJwdRiav56LFhrsDNNfIVFhsZoh3XqKXNct4c38mKDlKwZSpCQyERdMQZhBSh+UQzfQ2v5f2V33SlcaCTHaWG4y4e/hfsiSY7c876WAFgmFd8qYdR6Cn969dy7S8IA6gIBOdtRDGIwxr6yT7fmUqPHYdNih6tD3v4R15bbjC9z+y+yM/AoYqrTBbQMc7Am9EZDRCFevqAMoBHNj0MtZI/I5Ho91c1IdmxaL8v4MHx25qvX6YhdSPR+F4WBBiQ/WJwSoZoK86I92+0bnj8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(4143699003)(261009223027099003)(18002099003)(6133799003)(22082099003)(10067099003)(11063799006)(261021123027099003)(261026140227099003)(261021121427099003)(261026121527099003)(261022105027099003)(56012099006)(261028144727099003)(261102123227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3lEdzI1RmRSNzZsem9ORXlBREltUXlWWFlOMUFyakh5VThJWDdDTzJHR2Vs?=
 =?utf-8?B?Yy94dDlkUUY0VXpRbC82Q2hGQjFVYWhjaG8xSHptN09GcCt1RjVKS29BTCs4?=
 =?utf-8?B?OTQwZXZ4ZDY2bHFFTG9DZUdYbm5VTlNaL04zaTNKdXlvMTZFNHc1MXV6cW4w?=
 =?utf-8?B?UTNLZmo0L0x0blFsU284RGxlL0E4ZzJSMnJFY2lUOE45aGlxTDljN1F5eFgv?=
 =?utf-8?B?azZqWXI4dXc4MUVKMnByLzBDREV4aTNTa1lkd2packJyL0lxaml3ei95TDBl?=
 =?utf-8?B?NGQyZ3hUekZsSHRDQlVuZDhLNU5qTk5HRG1BVXdEOHpUMGRJdCs0RU1GelBQ?=
 =?utf-8?B?S0JYTnZ3SEZYTS9oakRHZzdXaXZ3ZVdnYVZXQ2FLZXhSYUIwVkxndUQxYVhJ?=
 =?utf-8?B?OUQ5cVRncGlMSHRJS2ZRTjRkdEVZUlhOaStFNFdwRnEwVjl3Wnc4clRiTFor?=
 =?utf-8?B?YkQ4cnQ5bytVRHVnTU9FWTE3ZnBMQUtjMllVL01EODkvOGJLYzlUYWdDV3lF?=
 =?utf-8?B?bWdIcHlXa0RESWpobmpFK25ITDBCODlqVGgvMHNhTnFOK29pbmFWbEc0NlN6?=
 =?utf-8?B?ZEw2dEtWZFV2b1NiS3pqUk9NdjhLTk5xK2RxY2ZvUHJES3FwejBOL044SzJ0?=
 =?utf-8?B?cE1VOUNSV1g1M1NuYlFhVVg0R3RWWW9EY1Y1Z2JRMFFlSXBSMGFVYnZOUFVq?=
 =?utf-8?B?b1JRM3gyOHdIL0NOZXlCQXpOR0RPRGljRGIrWHluOUVmR1lVbWdHNDlCdGkw?=
 =?utf-8?B?ZlBEVnJNVWNWZk83SmJibmpRK0ZWelQrUy9zL25kRE9zMDZrSzhQa0N4ZUp3?=
 =?utf-8?B?THI1dWtjMnR3c2RLZmt4b0dOaWVUbWNkd1ZmVDFXcWZBOU9CNXdZWmNzVnVo?=
 =?utf-8?B?b1dPL05oSmxDakJXdncvS1A5d0xRV0ZCelNKajNRMGFpNitMZ09sRVpCUzBK?=
 =?utf-8?B?TWZlTXphdmdIZkVDVlZ5bDBmVzFvU1Z1TGliWnhVeldTYjFySTYyZ3N3eDdV?=
 =?utf-8?B?MEdQbDQyTnc3RlNIMnJwVDBTQ0pNOEZ4OUVGaFdFcm5GRGtIemkwR3YzTjFN?=
 =?utf-8?B?YUtkekc5b2UwV1NHRjQzSFMzQzh1N0cwZUlFSVpWclY1ajFic1ZxME0wMmpW?=
 =?utf-8?B?bHpOVlJEMUtXbEkyN3B1UTh3aGFrVEpQaXEzYWkxZ0JQM291Yk9WaDJHcVV4?=
 =?utf-8?B?Vko2TkNvMTlEdktNYnhzNVRZdmduRk1OR2N6NUZaODM4Q05FNG5XWkowSUw0?=
 =?utf-8?B?ZTc0ZnVwOW5Lamx0TWZrNnNidGxKNHlzeUVtNGNOM0FZMWpzYTJQN3lYOHNX?=
 =?utf-8?B?YnNvWVRiN1lyZThvemw5UVcvNGtONTJ6Y3MyK0NxeEoxVTZqYVRtQTA2aGZF?=
 =?utf-8?B?cGZVcjNoMnViUkErZXZEdm40MDdQS3VoaVZKeWYrV1pZRFdUYjlJM0crVnZ0?=
 =?utf-8?B?cGRPNndCckU0TlJmMHVpd2xoS0srSzRkeHJkRDJPZnhjYmdNLytTTkFaWS85?=
 =?utf-8?B?RkZSNWlzbjBGWDdQeFoyZGxtS0Y5aUVlWXRvblg5M2FPQ1YwejRDaDVodmZy?=
 =?utf-8?B?dW1KdjJGMWNPVGx4OFEzWmVLMHUxbjg2dmlpZzFMTjNkWTlwVWpWY0RlVUVm?=
 =?utf-8?B?QlArWi9lWWZ0ZWFpLzA5VERCenJETlZyWnh3ZHlEbFF0M01vOHE1L0JFMmFS?=
 =?utf-8?B?VzNUZFJqS1lIcHRxTFR2dGE0NmFpdVdZR2d2UFcvamRUaWxqVmpOQVhzRzJC?=
 =?utf-8?B?cndGeWp6aUZReDZnV2E0a0ZZV0Nxb21rWHM2UldHaVBTOHJPQ21Qc2xUSWRC?=
 =?utf-8?B?VTBQSUs2a0JLWUplQ0VhcldWRVdleHd6ZC9LSFRKdW5yeFowdUc0UVpDWkEv?=
 =?utf-8?B?VVdlNHRPZVRKL204QUxxYVJENGNuY1BtSGlQanZUd2RPOUJMeVlqV1J6emp2?=
 =?utf-8?B?RWxUNkNReXpNWkpSNVZTVHkyQ1pqTjF2V2V3OUFSYnpMVjV1bjQyT0xSVGpE?=
 =?utf-8?B?RU5CRlIyejU5QlEyUkRYMEg2SHBPUlJWSUw1V2wyZExXNFQrRVFmM2dZVWtN?=
 =?utf-8?B?TzVKUFd4a2c5cW5DbXRuaEJUV0NRSnlCNzFiL2dpTFRyajR3QTQ4UTFkRGxy?=
 =?utf-8?B?cE1rZkZQNXVrSmlaYzQ5TFl5WVk1YW5ETXdwdmltZWNVNjBibXBFNCthQWEx?=
 =?utf-8?B?SDlZWVY0ZlVXRktrdlpWTTZVdkY2dyt0TlFod0JCQm1idkI0RU1LbTlCamJF?=
 =?utf-8?B?ckl2T25BajBESXQ3NlBuYjVlRGxuajFxRHlzTmpXcVRyWVNJUkRGZENrNXc2?=
 =?utf-8?B?T1pDcmRxYitnR1NaaGJoa1J3K2hqTkdRMzJDaHpTaURXRm1qSUtLcjdENE1t?=
 =?utf-8?Q?qO/1KnGq9H2huXMc=3D?=
X-Exchange-RoutingPolicyChecked: jxdBq95n2AoXk9eAOXL76u94mBwClIuSOIjctAMV0CB7OZuLDF9ObGCI+3RCIGChhV8DI18HcS2/QFKC5w9uILrYHMI6hFjYDw7cBv+J95j8mrfeEKdoVFYIOogjYzvtHKvvTbqwJ1L4A5uckk2MZ4FtH3M7FQWaVZpb/Mvc2mIV3rHjlvDW/tKR41QGzi9ThhZEVOTQbZEc6ZvSaaXryTs82nwmzmzsMWgcku3aoy/6F6JxsspsKgFveo8hzUR8nUkvt3LlwR2dDYGZgGYpqnH2NMI1i+JaqqrEtaJbbov2bQXn/ei6VhBbitfg6h2k6ddegcfJVD/WX1yqpZMeUg==
X-MS-Exchange-CrossTenant-Network-Message-Id: dea6c6d0-4ee3-4da4-7d1d-08df4c6b943a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 09:48:24.2840 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5nXJfP/hYj6Px5uCObkqmWVci0H9Y3J7kMDRC5m/ya6XoVI+8oiXk/9Is6IopiYy6+fUmBLPNq7D+FIxso+9mGgpD32fDrxYpFfu34Z1V/k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6978
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Lukasz Laguna <lukasz.laguna@intel.com> wrote on śro [2026-lis-25 09:06:20 +0100]:
> Allow PCIe FLR handling on VFs.
>

nit: maybe "on discrete VFs"? xe_pci_reset_skip() still skips
!IS_DGFX(), so integrated VFs remain unsupported.

> VF FLR isn't complete when the PCIe FLR finishes. The PF still has to
> sanitize the VF resources: it resets the VF GGTT entries and clears the
> VF LMEM. Once done, it notifies GuC with FLR_FINISH. Until then, GuC
> asks the VF to retry its requests.
> 
> Re-initialization after FLR assumes that the FLR has already completed
> and that hardware state and VRAM contents are gone. It restores GGTT
> mappings of kernel BOs and rebuilds the migrate page tables, so if it
> started before the PF finished its cleanup, that cleanup could wipe
> the restored state.
> 
> Add an SR-IOV post-FLR step to the reset handler, called before device
> re-initialization. On a VF, it resets the GuC VF state over MMIO until
> GuC accepts the request, which means the PF has completed the VF FLR
> cleanup.
> 
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
> v2: Log an error when SR-IOV post-FLR actions fail
>     Improve xe_sriov_post_flr() kernel-doc
> v3: Explain VF FLR flow ordering in commit message (Raag)
> ---
>  drivers/gpu/drm/xe/xe_pci_error.c |  9 ++++++++-
>  drivers/gpu/drm/xe/xe_sriov.c     | 31 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov.h     |  1 +
>  3 files changed, 40 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
> index fc6ff71d84a0..9b54ae2d392f 100644
> --- a/drivers/gpu/drm/xe/xe_pci_error.c
> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
> @@ -16,6 +16,7 @@
>  #include "xe_pm.h"
>  #include "xe_printk.h"
>  #include "xe_ras.h"
> +#include "xe_sriov.h"
>  #include "xe_sriov_pf_helpers.h"
>  #include "xe_survivability_mode.h"
>  #include "xe_wa.h"
> @@ -234,7 +235,7 @@ static void xe_pci_error_resume(struct pci_dev *pdev)
>  
>  static inline bool xe_pci_reset_skip(struct xe_device *xe)
>  {
> -	return !IS_DGFX(xe) || IS_SRIOV_VF(xe) || xe_sriov_pf_num_vfs(xe) || xe->info.probe_display;
> +	return !IS_DGFX(xe) || xe_sriov_pf_num_vfs(xe) || xe->info.probe_display;
>  }
>  
>  static void xe_pci_reset_prepare(struct pci_dev *pdev)
> @@ -293,6 +294,12 @@ static void xe_pci_reset_done(struct pci_dev *pdev)
>  	/* Unprepare early in case we fail */
>  	xe->flr_prepared = false;
>  
> +	err = xe_sriov_post_flr(xe);
> +	if (err) {
> +		xe_err(xe, "PCI reset: SR-IOV post-FLR actions failed\n");
> +		goto out;
> +	}
> +
>  	/*
>  	 * We already have the data structures intact, so try to re-initialize the device.
>  	 * This will be similar to system resume flow, except we'll also need to recreate
> diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
> index ec254b950daf..506f5a7bb335 100644
> --- a/drivers/gpu/drm/xe/xe_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_sriov.c
> @@ -11,6 +11,7 @@
>  
>  #include "xe_assert.h"
>  #include "xe_device.h"
> +#include "xe_gt_sriov_vf.h"
>  #include "xe_mmio.h"
>  #include "xe_sriov.h"
>  #include "xe_sriov_pf.h"
> @@ -174,3 +175,33 @@ int xe_sriov_init_late(struct xe_device *xe)
>  
>  	return 0;
>  }
> +
> +/**
> + * xe_sriov_post_flr() - Perform SR-IOV specific post-FLR actions.
> + * @xe: the &xe_device
> + *
> + * This function should be called after PCIe FLR, before the device is
> + * re-initialized.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_post_flr(struct xe_device *xe)
> +{
> +	struct xe_gt *gt;
> +	int err;
> +	u8 id;
> +
> +	if (IS_SRIOV_VF(xe)) {i

nit: an early return would save one level of indentation:

	if (!IS_SRIOV_VF(xe))
		return 0;
> +		/*
> +		 * Wait for GuC to become responsive. This indicates that PF completed
> +		 * VF FLR cleanups and it's safe to start VF re-initialization.
> +		 */
> +		for_each_gt(gt, xe, id) {
> +			err = xe_gt_sriov_vf_reset(gt);
> +			if (err)
> +				return err;
> +		}
> +	}
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sriov.h b/drivers/gpu/drm/xe/xe_sriov.h
> index 72e55543c30e..444d1ad74926 100644
> --- a/drivers/gpu/drm/xe/xe_sriov.h
> +++ b/drivers/gpu/drm/xe/xe_sriov.h
> @@ -19,6 +19,7 @@ void xe_sriov_probe_early(struct xe_device *xe);
>  void xe_sriov_print_info(struct xe_device *xe, struct drm_printer *p);
>  int xe_sriov_init(struct xe_device *xe);
>  int xe_sriov_init_late(struct xe_device *xe);
> +int xe_sriov_post_flr(struct xe_device *xe);
>  
>  static inline enum xe_sriov_mode xe_device_sriov_mode(const struct xe_device *xe)
>  {

All of the above are minor, so with or without them:

Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.43.0
> 

-- 

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01638CF9C71
	for <intel-xe@archiver.kernel.org>; Mon, 23 Sep 2024 20:52:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2DCA10E49A;
	Mon, 23 Sep 2024 20:52:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e8zvg7cG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7466310E49A
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Sep 2024 20:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727124734; x=1758660734;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=i7F1fRsuKH1DtloenUDcN6bMbJtuuSOxYFq9raKz8fI=;
 b=e8zvg7cGPFMcNF7nB7acJeZDLqlgUvSrWoINvj9x7D6lLMFzjfvDftWq
 RxqYRxe4bq+RbNhXV7BtfFxPUHL0iAK1tWZgvgwd58a8VWjUej0GGRPSS
 FC2rf2UMmvy9jacJbgCL9JQ8ZSmWq2GvC5rEl9m3eALMHjTReVNeb7Qkj
 WcnX3mcAQTWlqEgq5ZPmR5xwnqF+HsvDqG9CuQbCw3OecCmINuYM6z7oo
 TUwL3PSdxsfGa30JorygRDJGFuIKOh4Hqq2KqD2z8Kq4WFT0GwTCqDUUc
 +Cd0KNd4b6ls/OUC/iBVRSOX7QqIUswRK+lxUGl3LPQWmNP2UWpy1KKR2 A==;
X-CSE-ConnectionGUID: qZx4kpbhS7SeoGZZISvEMQ==
X-CSE-MsgGUID: /4/Y5pwVQKiFu0/WqKdgzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="26247411"
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="26247411"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 13:52:13 -0700
X-CSE-ConnectionGUID: N7srsOdpRy68lrf6s6oRQQ==
X-CSE-MsgGUID: VlmvSBBdQky5eJLygtBLpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="101911613"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Sep 2024 13:52:13 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 23 Sep 2024 13:52:12 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 23 Sep 2024 13:52:12 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 23 Sep 2024 13:52:12 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 23 Sep 2024 13:52:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZCLVo7rLDocN3L9jS9SloHfMyR1RbijNYFVhaYTdd5WovWn4gMRPUom/kjjRxJM8yn/fOU1RMn7cXPR/XyLpm0afL+o0oHgukbnNOr3yaEopPopISZlJgH1rywjhRl8BYzgxvYcGUcDMLYuz9r9EQXDaPTJKcFM3cgI3PetcDn6u0co/hx+k6Q7xEXTLi1VYbAHJ8ndAc32c8Cka2ohX2HRjofxJqLk/vNgT2bBNXMC8rcld04bIFiAPkpwG8KhLBbgQfFlY33ah3E52HL6dVadVjhsh3JtxOWCUqrzsU6svwB2x7cAEtWhSzO5Go7nKJPkNX2xBzVOgQIVEouzhMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ymJB9q672VJODak8Ow7YO1tfUQkUK1kPVE6PJj19QpI=;
 b=USavPzf2OHcwPGGFSu0WQ2Q+NaQ6haFXr3cltWLKUhemrs+hl8Y7AgSy2WXsC3paI2lHs26UeJBYxTzX6n6sAsY+Lb0k4vAP1sw0StQWJO1VPe/dTAnJw28GUDlaOw/DOiwzSRrm8bKUyaE/Ewpl405GgIdJ0LoJpBuGYcsZ5ze0eHNBoOvkRwhkZAMTadBHZZT9c6S3uB8RtA1wHD97gmS23V5EmT/ZOHsKW6duwhkvwUL9FE+0vw/sQi+G/Nw6pQJNjesQkfcryDFLXWd5i7CtJVrlwZJ4aw5u/Y7lCZq9yUCVqF/VvnG0EQ3cIY9RU0dweZOq0nIzM7M+MnToCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20)
 by SA2PR11MB5196.namprd11.prod.outlook.com (2603:10b6:806:119::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Mon, 23 Sep
 2024 20:52:09 +0000
Received: from MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2]) by MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2%7]) with mapi id 15.20.7982.022; Mon, 23 Sep 2024
 20:52:09 +0000
Message-ID: <44119f29-f82f-4a4a-a1ec-e280b1292508@intel.com>
Date: Mon, 23 Sep 2024 22:52:04 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/xe/vf: Send RESFIX_DONE message at end of VF
 restore
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
References: <20240920222926.846985-1-tomasz.lis@intel.com>
 <20240920222926.846985-3-tomasz.lis@intel.com>
 <02158df1-ea94-4fb2-a649-3e3f38ff8d64@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <02158df1-ea94-4fb2-a649-3e3f38ff8d64@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MI1P293CA0020.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:3::18) To MW4PR11MB6714.namprd11.prod.outlook.com
 (2603:10b6:303:20f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6714:EE_|SA2PR11MB5196:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b066864-1be6-4f54-0213-08dcdc11972c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z2ZEdmRWL2tZdEhDZmRGS1kyQjM3dlp4TkFlQjVMYzlFSVlPWktJTE9pUlN5?=
 =?utf-8?B?UFdmZmI3NGJranhUSmRXaUhRSzB6RmdHY3RvVDB6UERDRzZKQW0xQlBrZTJ3?=
 =?utf-8?B?TkYvKzRXUlBydkxMVU1RR2hBUFNkaU9kbTBxYmd0aGtxbGdoNW9Wd09wdnpa?=
 =?utf-8?B?ZkRJMUdIeFRkbmVDRDIxc3VtcHhSd0pIY2pCZy9JeUpJZmpLd0NhTm44eVlQ?=
 =?utf-8?B?RFp1TFlNQkZlVU95OFlzd0VOUDVWN1VjVW4ySUJYdU9QOUtxSjI2Tm5QRDcr?=
 =?utf-8?B?NVZDUVFXWlQ0ckNqQnFwdW5YRUJ3bHdjejMzaVd0S3Y3V2FmMXc3MHlVSExP?=
 =?utf-8?B?aDZReHA0Z2x4VnhndzA3bkRRKzZKdmU5cXpOOTN3ZXhpL1o1R2haWmNtYXlC?=
 =?utf-8?B?VGRZT3BRTjBLL0tvTXJxekl2VTUwdUJyUjJPZm05ZVFXUi92OXhzUlZjVEto?=
 =?utf-8?B?QU15UjN4eW84cmhPOHdrZ0lQNEhmMll1anFJaW1aT1drdmZ6bHFXRlRseVhC?=
 =?utf-8?B?dGdXRTVZWTlTZmdqb1gzYUYzMDMrRUtYY1FsM2RVcEJhb2Rzb2ZTVisyeVg1?=
 =?utf-8?B?emNKTjhWOGRnUENCYzZ3T1c2VU5YdGloeU9YYXNGQlQrSkM2bnZpdlp4SGVp?=
 =?utf-8?B?L3hEM2wyS0xMZ1dBbXVIVFJ0eWNsN3lwWnZVOGorMmp0VmdPMzVRZXl2Zjdi?=
 =?utf-8?B?dWNJR05DR0RvajQ4a1I5TkduYXNpbkJXeXVERG14VjVHalVMVCtFdVpRQm51?=
 =?utf-8?B?bnZzNzFDcC9HTndtcyt4UEszNXVyaEg3N3owYnNXVEVwc1BDdE9wWndqUmZO?=
 =?utf-8?B?aER1eHJFZ09DeDhvdlJJSWFmVVZZcHQ1UHdycVo0akZLS3VPclRXcWZQenRr?=
 =?utf-8?B?WWpWdTVja0pnbTN5bXNmMC9Pbk5TRWkvVFl0UVB1SzFTTisxbTJ3MWdGUGxw?=
 =?utf-8?B?VEQrREtkM0wycUxIMkRrc25tQ0xhS1psSUF3S3hYckp1dGJZM2tRT3BOR0pR?=
 =?utf-8?B?QWhVM3daUnhmUXVvVmZpbUI4aS9HMXQrRzJ5dnhwV0xwSkFadSt0dVdZUXFE?=
 =?utf-8?B?NUJ4OUthM0lybmdaM0tPZno3YTg1cHhCckpJcWVOczNCb210NUQzNlExcWY4?=
 =?utf-8?B?T0FxUUdqQkdRckZKM3MrUTlmRVJFOVJxWU56ZHdFdzQ2M2hsOWE3U0UveFlU?=
 =?utf-8?B?eHUyU0E2WnViVXBCckNVbzBlY1lPS0grNW05RXJNaSt4ZXhsNTVVRnNtS1k3?=
 =?utf-8?B?OFVTa0xSNzBabEo3dSsybkhQN1VBQ0M1THZOSi9VVDdSWnI5czZiZXRsVGRI?=
 =?utf-8?B?Zkg5em1IMW9ySnZ6WWVpYzM0RUdDbUtoRC9zNWtJd3hYdjBhRFdKdFkzMG81?=
 =?utf-8?B?Q0RMeEN4YnBUSmdFcU5FdFNORTlnUXFWOFE4RnVOY0dCZHJXOGMyT0FCRXdi?=
 =?utf-8?B?RTJNOWtvemNMUHE5akcxaTZBUE1LN3d3cWthL2dGdkc1dG9PVWlVODhqZVA1?=
 =?utf-8?B?RktLWTR1bGQrVEtmc1NLMjBid1R5aHdrVXdMQVJRTWNaNUtQR1dKUWRva3ZQ?=
 =?utf-8?B?ajVXT0hJKy9YSHgyMjUyV1NUcW1sWFdrcUpEdDVPUFVsTGNtK09wQnJxVi9Y?=
 =?utf-8?B?NTVFYmIvSHo1dnhUeGY2T1dMaUVnN25QQVRhajVLeHJxVDB1ZGxXa09mUFhI?=
 =?utf-8?B?Yk9nS1pENWsyN096TXFMTC9OU1hmYmdwZ2I2V0MzYU9hVTcrNEh5Vkd3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6714.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnBzd0hWckhnZmlwLzVnZXRsMmplQnlFTm9hNElEcStWNHMrTjkzOStlODRS?=
 =?utf-8?B?YkFjWjZsRVRmVWplNCtoeTQ4djNuVExYMUlVVUpJMVUrV2RnclhpR1NPcUk3?=
 =?utf-8?B?dDhlMkJ4V3lCenVhaCtVdlhobE9GS1hSR1p0WEp2Ykw4Y0R0UTRYeFp6aXlo?=
 =?utf-8?B?MHBvdDQ1aXYvZkZ2SVcrRExjcEcvRGxSVTZOc1N3c3p2S0FndDJkSXVHZFlE?=
 =?utf-8?B?alZOQnF4Y3Z3YkdFSnAyZGJISXpHamk4a1NtU1VQeW5vRHB5Zld4blVpRWp2?=
 =?utf-8?B?YkY5cVBmdUhTQVRlVEo1V21lK1NEcGl6UUczWElrTkZqUHF3dGY0ZWdqaUgy?=
 =?utf-8?B?QllvSzRoUHp4VElkUzRwNFR3c3Y3anI4RzhaaGhldU1LZll4ZzZaOGgzTlVR?=
 =?utf-8?B?ZnZ0T1A3VndxWHdOdlBwbUQwZTYwK0pVY3JMWDByK0JrMUxJbXZuTmVmek5j?=
 =?utf-8?B?ZzluQmIvZTJEU0ViWXlmeU1tV3pYdDlOQkJWSzE5V3MydUZ3bGVDemZhakdj?=
 =?utf-8?B?TzJWcW5tOHIvWXdSRFhVeHlDRFhjSm1DZldyMkxTN1RCRnlITHZaeitidmlW?=
 =?utf-8?B?V0dzaDdDMGNlWjFyYVRsczNvUUwvWlhYT1k1WWQ1M0hZL25pL3RUeFBvMXY2?=
 =?utf-8?B?UW40QjFCd21vRUh5VUU0QVUySnJRVzZ5cVB2cVhPdllxblA3VVNkMjZqWHJL?=
 =?utf-8?B?NmREUFJEdlhCYlRnK3R3TVRPMnhDZjlpQ3JWTmIxZzlUSVgwSmVudXBER2Jz?=
 =?utf-8?B?QlhYemMrUGZLRU12cSs2Wk1yT0VORmVzbmN4dGFZWEtJazVHNFhIZXN1dENT?=
 =?utf-8?B?MExWTmJzWmxvS0lUVlV4V3ZCVXIySXNHd3luSGtJM0dESVEySGd5Q1RRL2hG?=
 =?utf-8?B?N3BLOG5aMk1iai8yb2xJUU8wc2t0K3VYNFYzbXlFVmtrSXpJUTM1bVI0TkRZ?=
 =?utf-8?B?ZUdZR2FzcmN6S3FqYk9uOVpaYngzL1pGcEg5U1JXM3FEbHhBelhaUEkyamVX?=
 =?utf-8?B?M1UrVnlDK3prNmU5c2szZ3JCR3JLWEpVbnZCYXFUQnozSTd4R2xQYytrVzF1?=
 =?utf-8?B?ZURaWnVON3NoUjJIUUR5ZGwvcHpOVnZhV244RzYyeVgvbi9xYjFFR0hjTisx?=
 =?utf-8?B?TnpOQTJQTVlxNjNiTWJXb2M2MVIwNXd6RUxHVk82cDY0dHRwdkNWNUNzVGZ6?=
 =?utf-8?B?QUc2RFBBNkZTMnZ4NTNrTW42ODlaQU8rbGpMeEtiRysrOU9VUnBaV0VYOHVB?=
 =?utf-8?B?UXZjaHpuM3lvd3lRM3VlZFp2SFB6c3NXa2QwbVZiR3NXVGMwYjBVOGdpSFRv?=
 =?utf-8?B?Y3ovZkxpSjUzekUvdkhYV0szYnNFOEpPRlJrVFNLQjRIR2lzZ2dva2VIalE5?=
 =?utf-8?B?RDlNcjBTLzd4bndEZXVJY1UrdTl1RXFnTVh4SE5keGNoVGhVVmVPekhtNEVx?=
 =?utf-8?B?bitnamFLOG5NOGh2NzRMNUpPaWtIdVRFU0tnT1J6THpXd2hoNW9PSUJVUnpE?=
 =?utf-8?B?ckJZbWEzMStOSUtvN29RUHdQeTJJdVM5ekprN1pTWDZWWkVTZ2lBSUErZjU4?=
 =?utf-8?B?YmFScTJMMm9qdmg1WlJoeXFmUXo3dk9OaENVM1ZCSUNrdmpQQmZ3QjdXWmZW?=
 =?utf-8?B?bTlGRU5Tdmo2eUM2cXlTZ2V2dlMyZDJLSDBLUEZsN2V1bDlhUnpRMVRBdzV5?=
 =?utf-8?B?dy9BRnp3VHRRWTZETnhnSjg5RFNiOUVOeGdiUFdDUTJ4OVJWRlZHcldIU24x?=
 =?utf-8?B?cnJ2cGgvNE9CNWdGYjIweGxmd2hSQTgzY3ZqTE5qQzZsTDU2MW5UVHd0dktP?=
 =?utf-8?B?T1hacnVDRHplYlhtVWNEeXFuakx6d0JtOS85amNKcFdlQ2tYWUhNdmJMZ29B?=
 =?utf-8?B?WHVaa0JUMUdqWDhZWGlkVFNFOEM2aEdTN3R1bDFqbHRvVVZHRHdxY213Qm14?=
 =?utf-8?B?NUVOTVo3T2Jwd0dXMGZHdkFrNEhiaFl0NXcrZFFWL1c2RVlXNkF6UWVpQWp6?=
 =?utf-8?B?elFld044L2Z1Z2QwNThTbmdhZXV0LzhvNUJucVNZWTRUV2p4ME1oNE1Ua3I4?=
 =?utf-8?B?dTFkUzB2TTVVeWZheHR3NDFJZWN6UGd1bHl6Y0hKLzhJNzJJR1hXQXpqU3lo?=
 =?utf-8?Q?2LUF84WBUxu2bwVflmkWOarAc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b066864-1be6-4f54-0213-08dcdc11972c
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6714.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2024 20:52:09.1217 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3hPLCmMWy7zkXJ3kypdE6A/5ru5/rHCmSX4ygpjcv6FpTrgsaWSJJ7FHPQvKcUjPjJXClglMY1bNrzBLMwsDEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5196
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


On 23.09.2024 13:55, Michal Wajdeczko wrote:
>
> On 21.09.2024 00:29, Tomasz Lis wrote:
>> After restore, GuC will not answer to any messages from VF KMD until
>> fixups are applied. When that is done, VF KMD sends RESFIX_DONE
>> message to GuC, at which point GuC resumes normal operation.
>>
>> This patch implements sending the RESFIX_DONE message at end of
>> post-migration recovery.
>>
>> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
>> ---
>>   .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    | 38 +++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c           | 33 ++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.h           |  1 +
>>   drivers/gpu/drm/xe/xe_sriov_vf.c              | 23 +++++++++++
>>   4 files changed, 95 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
>> index b6a1852749dd..74874bbba10c 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
>> @@ -501,6 +501,44 @@
>>   #define VF2GUC_VF_RESET_RESPONSE_MSG_LEN		GUC_HXG_RESPONSE_MSG_MIN_LEN
>>   #define VF2GUC_VF_RESET_RESPONSE_MSG_0_MBZ		GUC_HXG_RESPONSE_MSG_0_DATA0
>>   
>> +/**
>> + * DOC: VF2GUC_NOTIFY_RESFIX_DONE
>> + *
>> + * This action is used by VF to notify the GuC that the VF KMD has completed
>> + * post-migration recovery steps.
>> + *
>> + * This message must be sent as `MMIO HXG Message`_.
>> + *
>> + *  +---+-------+--------------------------------------------------------------+
>> + *  |   | Bits  | Description                                                  |
>> + *  +===+=======+==============================================================+
>> + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_HOST_                                |
>> + *  |   +-------+--------------------------------------------------------------+
>> + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_REQUEST_                                 |
>> + *  |   +-------+--------------------------------------------------------------+
>> + *  |   | 27:16 | DATA0 = MBZ                                                  |
>> + *  |   +-------+--------------------------------------------------------------+
>> + *  |   |  15:0 | ACTION = _`GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE` = 0x5508    |
>> + *  +---+-------+--------------------------------------------------------------+
>> + *
>> + *  +---+-------+--------------------------------------------------------------+
>> + *  |   | Bits  | Description                                                  |
>> + *  +===+=======+==============================================================+
>> + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_GUC_                                 |
>> + *  |   +-------+--------------------------------------------------------------+
>> + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_RESPONSE_SUCCESS_                        |
>> + *  |   +-------+--------------------------------------------------------------+
>> + *  |   |  27:0 | DATA0 = MBZ                                                  |
>> + *  +---+-------+--------------------------------------------------------------+
>> + */
>> +#define GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE		0x5508
> please make it unsigned (like all newer definitions)	0x5508u
ack
>
>> +
>> +#define VF2GUC_NOTIFY_RESFIX_DONE_REQUEST_MSG_LEN	GUC_HXG_REQUEST_MSG_MIN_LEN
>> +#define VF2GUC_NOTIFY_RESFIX_DONE_REQUEST_MSG_0_MBZ	GUC_HXG_REQUEST_MSG_0_DATA0
>> +
>> +#define VF2GUC_NOTIFY_RESFIX_DONE_RESPONSE_MSG_LEN	GUC_HXG_RESPONSE_MSG_MIN_LEN
>> +#define VF2GUC_NOTIFY_RESFIX_DONE_RESPONSE_MSG_0_MBZ	GUC_HXG_RESPONSE_MSG_0_DATA0
>> +
>>   /**
>>    * DOC: VF2GUC_QUERY_SINGLE_KLV
>>    *
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> index d3baba50f085..08b5f6912923 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> @@ -223,6 +223,39 @@ int xe_gt_sriov_vf_bootstrap(struct xe_gt *gt)
>>   	return 0;
>>   }
>>   
>> +static int guc_action_vf_notify_resfix_done(struct xe_guc *guc)
>> +{
>> +	u32 request[GUC_HXG_REQUEST_MSG_MIN_LEN] = {
>> +		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
>> +		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
>> +		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE),
>> +	};
>> +	int ret;
>> +
>> +	ret = xe_guc_mmio_send(guc, request, ARRAY_SIZE(request));
>> +
>> +	return ret > 0 ? -EPROTO : ret;
>> +}
>> +
>> +/**
>> + * xe_gt_sriov_vf_notify_resfix_done - Notify GuC about resource fixups apply completed.
>> + * @gt: the &xe_gt struct instance linked to target GuC
> don't forget about "Return:"
ok
>
>> + */
>> +int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt)
>> +{
>> +	struct xe_guc *guc = &gt->uc.guc;
>> +	int err;
>> +
>> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>> +
>> +	err = guc_action_vf_notify_resfix_done(guc);
>> +	if (unlikely(err))
>> +		xe_gt_sriov_err(gt, "Failed to notify GuC about resource fixup done (%pe)\n",
>> +				ERR_PTR(err));
>> +
>> +	return err;
>> +}
>> +
>>   static int guc_action_query_single_klv(struct xe_guc *guc, u32 key,
>>   				       u32 *value, u32 value_len)
>>   {
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> index e541ce57bec2..97e8c76a641a 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> @@ -17,6 +17,7 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt);
>>   int xe_gt_sriov_vf_connect(struct xe_gt *gt);
>>   int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
>>   int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt);
>> +int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt);
>>   
>>   u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
>>   u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> index b068c57b2bdc..459fa936aaba 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> @@ -7,8 +7,10 @@
>>   
>>   #include "xe_assert.h"
>>   #include "xe_device.h"
>> +#include "xe_gt_sriov_vf.h"
>>   #include "xe_guc_ct.h"
>>   #include "xe_module.h"
>> +#include "xe_pm.h"
>>   #include "xe_sriov.h"
>>   #include "xe_sriov_vf.h"
>>   #include "xe_sriov_printk.h"
>> @@ -20,10 +22,31 @@ void xe_sriov_vf_init_early(struct xe_device *xe)
>>   	INIT_WORK(&xe->sriov.vf.migration_worker, migration_worker_func);
>>   }
>>   
>> +/*
>> + * vf_post_migration_notify_resfix_done - Notify all GuCs about resource fixups apply finished.
>> + * @xe: the &xe_device struct instance
>> + */
>> +static void vf_post_migration_notify_resfix_done(struct xe_device *xe)
>> +{
>> +	struct xe_gt *gt;
>> +	unsigned int id;
>> +	int err, num_sent = 0;
>> +
>> +	xe_pm_runtime_get(xe);
> maybe pm_get/put can done once inside the top level recovery function:
> vf_post_migration_recovery()

It would work. But I don't think there is a need for that.

While applying the actual fixups, we do not require the hardware - it is 
necessary only to query new provisioning at start, and to send 
RESFIX_DONE at end.

>
>> +	for_each_gt(gt, xe, id) {
>> +		err = xe_gt_sriov_vf_notify_resfix_done(gt);
>> +		if (!err)
>> +			num_sent++;
>> +	}
>> +	xe_pm_runtime_put(xe);
>> +	drm_dbg(&xe->drm, "sent %d VF resource fixups done notifications\n", num_sent);
> hmm, so what's the plan for handling the cases when one or all
> notify-fixup-done fail? are we going wedge or will silently ignore like
> here?

If RESFIX_DONE gives error, then the GuC was either not in RESFIX state 
or is not responding. If not in RESFIX state, that would mean the 
current procedure comes from a second migration just before sending 
RESFIX_DONE on recovery from the first, or GuC got reset by PF. So we 
have 3 cases:

* not in RESFIX state due to RESFIX_DONE from previous migration being sent:

If this happened, we were applying fixups on a living GuC. While many 
things could have gone wrong in that case, it is generally more likely 
that we've made it through fixups and everything will work now. The job 
which was executing without fixups might have hanged, but then all jobs 
were fixed, so this single job will timeout, get removed, and execution 
will continue.

There is no need to wedge in this case.

* not in RESFIX state due to PF reset:

This case should be handled by VMM, not by the kernel running on the VF 
- the whole VM should be marked as damaged. The VF KMD could wedge, but 
we have no way of distinguishing this situation from the previous one.

* GuC is not responding:

This will lead to PF reset, so see the point above. This time we can 
distinguish the situation as we've got ETIME from send function, but why 
treat this case in a different manner?

To conclude:

I don't think the VF KMD should wedge on no response, because it is 
possible that everything will work, and we have no way of distinguishing 
these cases - if there will be no progress or no response from hardware, 
we will get through standard reset and wedge procedures after the 
recovery ends. There is no need for extraordinary speedup of the demise 
in case of migration.

>
>> +}
>> +
>>   static void vf_post_migration_recovery(struct xe_device *xe)
>>   {
>>   	drm_dbg(&xe->drm, "migration recovery in progress\n");
>>   	/* FIXME: add the recovery steps */
>> +	vf_post_migration_notify_resfix_done(xe);
> hmm, shouldn't we have some kind of guard to actually track whether we
> succeed with the fixups and only then send notify-done?
>
> otherwise in addition that we're already cheating the user with below
> message 'recovery-completed', now we cheating the GuC that 'fixup-done'
>
> there likely always be a cases where something went wrong, so we either
> end up with reset or wedge, so maybe we should also start with that and
> only send 'fixup-done' when passing all post-migration steps

The fixups do not communicate with hardware, so they have no way of 
failing. They are a CPU-only procedure of iterating through internal KMD 
structures. Them failing would mean internal KMD structures are damaged.

The series under review does include a mechanism for fail, and a 
mechanism for defer. In both these mechanisms the RESFIX_DONE is skipped.

-Tomasz

>
>>   	drm_notice(&xe->drm, "migration recovery completed\n");
>>   }
>>   

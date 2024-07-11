Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9DD5C3DA45
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 21:44:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F8EB10EBB3;
	Thu, 11 Jul 2024 21:44:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="key+EoQq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1C8C10EBB2
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 21:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720734289; x=1752270289;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=FegRX8u0Mlc50/CZSZYrROnEVXwLK3yWRl1jDTPV4F4=;
 b=key+EoQqrDhu6JKrIEdRl8oS2M/e/QOtvfkAmSN/+pmOQC6/tVW2jiMN
 N3zDuIZuq4aMghXeUrQMNN0d/cYml6kPz/yUEx0592yoLRxB+K5cJk+5Y
 SSDK/4kqLRCGA5JTWOxPE7o/q7JQ2SFDfQbhAnovRoWCmBJxryxfbLm8s
 KJauhfQwmat3Yi4FJs1ZMhWc4Xq9NIFKz4CJu6hjioDLI+XlEBViMc84y
 CgPmmWeUNJIPhZLxyERalKlJrW7ncSZ2TYcka4t99v9Vv5FRDeiCsCMsI
 3wY4/E1b+GWnlucfTQJFKmuubnbeVFLWOdSef/YsnFz/dsx5FUXkbsIpm g==;
X-CSE-ConnectionGUID: jLFVr3GVSW6yGmdBi8z6IQ==
X-CSE-MsgGUID: 5/zSMt1TR6e7C0ffxj0zIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="21969621"
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="21969621"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 14:44:48 -0700
X-CSE-ConnectionGUID: ulshYR8fQfy/Gbn9MabZEg==
X-CSE-MsgGUID: agm1UkrlQAiKZ8VNBHmkqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="48715193"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 14:44:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 14:44:47 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 14:44:47 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 14:44:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I317+BQlL1PQWivF4heb83gNT3UydwicHlJUKLSEl4IkAbvMhpkskmvn0g7hWM/45uJMyXsEyLhVKY5Pavhgnhj6AisShAHUonvzVWD3g59V2W2QKuzZ0IfFtZS1CYP6q+ry3svT9sdZYqQY6WP9qwCu3TAIbgXF6PG7iOXxA0FCE9y2hAEMnRSVzxNtbqw3x+9ouLLbM9wLdz4R5gak3N3ZA4ksMHtVEUmLtD1enS2UmBx7+jcY1g4pXRG//cGHvexbtQWhKr8YFpmy3+R6ThzQKwvyfzxPceL/2PHnpdmEIg0GEz02MX3HwrmQM+yUP6W2l6cPfeQi22xRp0/A2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AZLa74RLQ3hQQcAM5kK83KhwtXdfYeLy71AkPese3PY=;
 b=DRkd3hptKKlLOZIYRA9IJewlmA4MNWyKJTw8oHtZN7Q8eEuzTkcFuIUXLPU/4qiC65L2uHJfKh74YaW3CjtFAiKLFsnhAULbQuRyw5s5jBU+r6J/yGq2FEw1M/XyhRPMsR5bohqp44Ej8NsjBo0cdt5KoWO9H2+/hpKl6YG83xX5LXhGBMTtgo1oG64ZoR1ogczCsiKSlphbMOeqzRfHVmmmLsiE5AEAma0E0/Mf7dd7L2/q4MGv1aLZnQPK8dBpfJvJwpQaEZUgGayUwaSjlYztMIf7DR3Cl5R4FufmP/vK3Edp7ScZWG4MbR+5Uw+fjGFKHEqZzJ2LmuHl3OEGfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2859.namprd11.prod.outlook.com (2603:10b6:5:c9::14) by
 BY1PR11MB8128.namprd11.prod.outlook.com (2603:10b6:a03:52c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Thu, 11 Jul
 2024 21:44:39 +0000
Received: from DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095]) by DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095%3]) with mapi id 15.20.7762.016; Thu, 11 Jul 2024
 21:44:38 +0000
Date: Thu, 11 Jul 2024 17:44:24 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v3 2/3] drm/xe: Expose display alignment requirement
Message-ID: <ZpBSOJRDHJfmsX_h@intel.com>
References: <20240711090925.179366-1-zbigniew.kempczynski@intel.com>
 <20240711090925.179366-3-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240711090925.179366-3-zbigniew.kempczynski@intel.com>
X-ClientProxiedBy: SJ0PR03CA0344.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::19) To DM6PR11MB2859.namprd11.prod.outlook.com
 (2603:10b6:5:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2859:EE_|BY1PR11MB8128:EE_
X-MS-Office365-Filtering-Correlation-Id: d2ae3849-aa7e-46e3-f192-08dca1f2a9e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QWh0TUJMaVMyTEo1ak1sK1RiZjNxNHVNc05qVlkzY2ZSaVE2WHFMVENVL2Fp?=
 =?utf-8?B?MkZVVmU2dHV1MlZ6Rk9CVEswdU0waWpnS2lTblJmdFhSeStvVEFvU0lTUGRp?=
 =?utf-8?B?c09HRHB0WmRCVEFMdEtROWV0aTN2WXIrVEtlRkJkYzlhL3lYbnVmRWlHZ1Zx?=
 =?utf-8?B?dnM1MDJSZHdSNHozYlZNbE1LYkhzQ20zdjZRNUp3MVRSbHhWaWhGQzk4Q3V2?=
 =?utf-8?B?eUV6VkxINTBYcVAremJZc1pVK1l3aHg5SXBLZXdDM01YYU1hNGY1bUViSEk2?=
 =?utf-8?B?TXNqTi9ZdEliS0VQQ1RFcFFxTE50eHgrWFZKMmRkcmpCbm1yay8raXpMR0Rh?=
 =?utf-8?B?STRpUDg4aUo4TGMzTy8rU0cwb1RubjJtWmo5Z0EyRlU3ZXJDS2FuTG9VUXhM?=
 =?utf-8?B?Z2c2UkVjYldRWGRudXhvckVVWnplcTQrWjN4WUZMRDErK3hYZzBSTGdZbkNF?=
 =?utf-8?B?SUpIVjdoanpxVHBxMjN5b2l4a3Q1c0FWK1ZsTzErREpKdzQ4MnZ5ZXdlSTRk?=
 =?utf-8?B?Ny9IcHJHa2w2dXRUcitzSEJiTzBmWVVZOXhoVVQ3bEtNY1M0dE5rcUhBWldB?=
 =?utf-8?B?Q0RNZ0RTeGpNVDgvblJzZHlpOCswSGRBalJ2SXVJRzQzN2s3WE1xbUxEbVM2?=
 =?utf-8?B?WXNNbko1VE04VEZoTHczQ3hCQklocFR4eVJjOGtNUVNsWXdvUysrRllreHVH?=
 =?utf-8?B?VzY3L2tCZkcyTms4OGlxZGV2SHJlOUNBRmczbEU5WTFIbHM1b1ZkUCtPYzJB?=
 =?utf-8?B?N2pGTFFYQlZtMWF0ajNiOUEySzYrVE5yajMvb0NOZ3lRTUhTUmQ4SksrVnE2?=
 =?utf-8?B?UVVjTk9sdzFtdmlvRDJwdzdqQUYxLzkxWWtrbFp5eEo0WnAreUJDVTJ2NkdF?=
 =?utf-8?B?cUhXWnBmUnJFZzUrVWl4N1pTY0ZSb3FnUFA1T3NWbGV0ZmwvUEhFQWljeUZT?=
 =?utf-8?B?amtvUjhVYnNsOGo2US8xS0k1TVJ0YmtxcGt0S2ZweVh1VFZOV2ZwWm9LU1Aw?=
 =?utf-8?B?b1Y5QkN1ZVRieVF6TlptZHd6d2VCa2xHMlVmNjRmcVdtWTgvMHJkMlZYVW9h?=
 =?utf-8?B?dTNlUjZrMXAxQ2tJYUV6cWF6SU5Pck9rbFRuUWMweDhYKzMzOW8wWlkrVG55?=
 =?utf-8?B?V0JnK2xMQ1pzaFY3eGRVMHJhdUxkcm9KQjRKSkljbEpHaGg0T055dzRZZStD?=
 =?utf-8?B?ckxNRFNSQWdnTGNrTTE1QTFSdjI4OEdVWUhHZWRIUXJpSXk3WDdJcHZEVnox?=
 =?utf-8?B?QkRZOVU5emhpeFoxODhsQkc0N3NvMlhvVEtWYTEwWnJyRDdoVE1yc0JsSWFW?=
 =?utf-8?B?SGRWc05LVkRGWkR5SCtOSjhPQW1YcEx0SWxlLzUxYVVtR05XbUU0RE1OMVRV?=
 =?utf-8?B?cVVhcGpzeW9GMWwwSlFESCtUV0djd3VKajUxNTNTQnFXVFFneGNwcGZGdzhD?=
 =?utf-8?B?TjNMN2VRb09wdDgzL2Q3cndjUm9OMlNJWldHSmtqcUQ4YTk4b2VlemtxcGJL?=
 =?utf-8?B?bEllRDY4SndVYm5Ca3BoL3I3V1Jua01CU2JSMWdtYkZidEtiVnpwaDV0eU1m?=
 =?utf-8?B?UXlPVkpMS2FHdjNpQmFjR0NBTXVqdTVqdUt1VnVLN3VraVAvYWVKdzRGYklr?=
 =?utf-8?B?aWt6TkMzbnJWT0IzYTVNOHJHMkhTZExyWXYrR3BvMzRYS3A3eG8vaUlldUt3?=
 =?utf-8?B?Ujgya1pOVEFrQjBlK01aUi9jQlh0ajd5Q0Rwa1I0Z0xOanZ3cFFtS0tSeGxa?=
 =?utf-8?B?akhPWTMzaWM3YTdlVi9UY3lZU2RPVis3SzQ4K0p6OERXM2NsTTYzRHRmZzE4?=
 =?utf-8?B?bU5IeUNLellSenVRT0JXdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlpudWtSeHBOOGJYTzVKVlZTK3ZqaWliWU5Wc2FHRXZqVHVBUTRMZ1QvTXhV?=
 =?utf-8?B?bjUwNUNTWkk4dUxVMElPV2ZYSGtUdDdmWTlhdjhldmJyUWRqeGJyNjc4MERv?=
 =?utf-8?B?TnltNGJzZmV5bjNMZm45NGJRcENibWRMWlYxZ0puZUFqSmNXcXA1NjNFNkIz?=
 =?utf-8?B?Y1cxQWtndDJTTHB3OSt6bjYvOUNuelJmby9Ub2pqVndPeDVVSUc4djZYZWp6?=
 =?utf-8?B?T0R1NjVRWmhZcmlWNnQxSTJJWWtvSEpOSjl4bEN1MEhTLzlEdnlGY0pXRnZz?=
 =?utf-8?B?QVRFbnN4Y2VQTlJVbkhKZXhrRjRRcTJzZWpieXphWDlyOEJWaUVnbm45MGpY?=
 =?utf-8?B?R0x2U3VKWW5vbVk1WVpkdnEzYm52Z3NwQXpQait6Y284b0VLbzE1Z3FOS2xa?=
 =?utf-8?B?eE5lckt0MmhjUlNlYVJBY2tzQkNzVDdtWitxTzBndlVYeUJWcng0U2RGR09U?=
 =?utf-8?B?VjBScDdhM3ZMVEI0Qks0RFB6TW16alNSNHZOSEVZMTNXbCt2M1Q4cGpJa3pE?=
 =?utf-8?B?NVpQaGhCNHJuZ1JqV2I3NExwSDlBVmZ3ajFESGtUNG9CRUU4R2tJdGNYWmJk?=
 =?utf-8?B?QVVBNmxCK3lqTDBLNk9TdWVra3Z2UEFUR2p6S2NOb0NrOHFqSjg5cWEvSVNU?=
 =?utf-8?B?VGZsZEduQW9RR1FLbi83aVVKbGV3dHFnQVJwV2Z1eWNjanZiS3FlcUJtY2ow?=
 =?utf-8?B?QUhOaW53UnYzQm4xOFduU00ydEpqcG4xSXJwSXhsOTYrQ2t5QlhHSjBVbXdo?=
 =?utf-8?B?Q01wWGpxYURrekhBUWNVRkZjOFh2MjJ1NWt6WWtGK1hTbEFSVkhZTHdwc3JV?=
 =?utf-8?B?dmdRejk5MHE5VGxwa1A2VGYySlFtK0NwNzdrRVBjUzI4SXROSnFwUUxIcndt?=
 =?utf-8?B?YkpJWm9HOUxHdEZCMngwS2xJcEQrOG94VS9UbWxtcUc4dHpZVWdiNGFUay9L?=
 =?utf-8?B?L2FlQ01PazlGTXFjU29jS1ZoV2VST3BrL0FidHh3ZnJ2UnhlNTQyS3ZJczQr?=
 =?utf-8?B?bCtCZDAzRXlvRmdTUmNzdlNza01xK0MzS0E0VjJsT1RTYnJoTzhhZGJDZWMx?=
 =?utf-8?B?cjVUUUR1NW5DLzRkTXJMOHhLN1JQR3d4Wk9TbzBIbTQ2REFFY0ROR3BNS3pu?=
 =?utf-8?B?dStjUlVVU3hVb3BzcFRkY3JxeWRPRlRVd2pJVjE3a2kyWmJLL29IZFRUTUVv?=
 =?utf-8?B?L0RJa3RvT2ZJbnNwSkkvYS9LZUhMUFZsdG5HTHl1RlFnZWdpRmh5SDFQV08v?=
 =?utf-8?B?SlhuUHhRQUxDanRSSXlib2ptNkJhSUV4ZHBkWHJVSVpUZnd2VHNPSmMvbFB4?=
 =?utf-8?B?c3hwSHFyL002TWs4L2tPV1FVWTRzbUx0VTl3Q3ZDUDgzRkZMZXRvaG9tazV0?=
 =?utf-8?B?Y1VNNzdsNk05T01lMGpZRk9TOVh1RVRCMzBXKzFuUWlkSC9DeE9reGw2VzZt?=
 =?utf-8?B?Y3VLM25xczB2V25uaEo5cGw0TEdRY2VqWlNqZXpyOHdTcU9LYkcwTnNOaWU5?=
 =?utf-8?B?V2lQVXZSM3JSMHBOamtyYkVHbzRJUUxGQy9CUmZzNjdjNkpTWGJTWnRGMk5l?=
 =?utf-8?B?L2FSWENoZ2hNcEV6OWFIa3hZb0xIcURXU3lTS093c3R2aXk0bHR6ditPdklx?=
 =?utf-8?B?R25HR3NJS2cxWld6MTdITUJGOEVhWkRUL3hlNUNmelROQ1BJSGE0TEw2eEcy?=
 =?utf-8?B?R1I4ZnZ4ZTl4YnJNL3FUUGRVZlBHcXY2K1VtUFBtSU8yUkEwRmt3M0YrR0FJ?=
 =?utf-8?B?Rzl1T2pnYjN4czVLVk5xZkFLWG1rUGREUTZCcG1YQkhtRmN2UDhyVUNETVhU?=
 =?utf-8?B?Vk9pS242NFl6V0NqVjFhZjZTSlpQUTdhNVJ4K1lYV2ZLcWExVnEya1ZSOVRw?=
 =?utf-8?B?eWxISTBHY0ZNV09tbE1Uc1ptaHFWdm9TSFZvYTlDaGRpVU94b1hoSHhPTzky?=
 =?utf-8?B?OFdtYnJialY0WEI5dkYxdEpxY08rRmxSYlJMQkVhN1pSSXZQMkV4cWw0NldT?=
 =?utf-8?B?MXRmQWxXZTFWQ3NwMlRjWEVRUGkrbmFheVFqdHVwL2E0T1hvNDhvdkN1Y3Z1?=
 =?utf-8?B?cjBtMWFrQlNLb1d4UlI2S2xkcXA3eVM4WnNnVExZT2lad1JsQjNXWCtWaXE1?=
 =?utf-8?B?VVJBSkdUcTVpUE9TUDMyT3J3QmdpTWc2TEhlV1BRM2d5TDd2RFk1bFZ1VXJ5?=
 =?utf-8?B?bHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d2ae3849-aa7e-46e3-f192-08dca1f2a9e8
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 21:44:38.7249 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8R49otEuOa0OJad6wGz0wf7YwlFatj/UQNRpnp9O0JJ9l4sD/zxv/7G+/SKog6mSNS6FEg9GIKIEIXv+uJxr2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8128
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


On Thu, Jul 11, 2024 at 11:09:24AM +0200, Zbigniew Kempczyński wrote:

Please use prefix 'drm/xe/uapi:' on the commit subject for anything
touching uapi.

And also documentation please.

But more then that, we need to engage first with userspace and get
them to implement this.

> Scanout buffer on Battlemage requires allocation in 64K contigues
> pages to support Tile4 + compression what differs from normal bo
> requirements. Expose display alignment configuration to userspace
> to ensure it will properly align requested memory.

We should probably consider something that aligns better with
the default alignment that comes from the min_page_size
from struct drm_xe_mem_region.

BTW: This will be a big impact in Media because right now they are
having to use SCANOUT flag for every buffer since they have no
ways to know upfront what buffers they will send to display.

> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_query.c | 4 +++-
>  include/uapi/drm/xe_drm.h     | 3 +++
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 4e01df6b1b7a..c32894f3eea1 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -313,7 +313,7 @@ static int query_mem_regions(struct xe_device *xe,
>  
>  static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
>  {
> -	const u32 num_params = DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY + 1;
> +	const u32 num_params = DRM_XE_QUERY_CONFIG_DISPLAY_ALIGNMENT + 1;
>  	size_t size =
>  		sizeof(struct drm_xe_query_config) + num_params * sizeof(u64);
>  	struct drm_xe_query_config __user *query_ptr =
> @@ -342,6 +342,8 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
>  	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
>  	config->info[DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY] =
>  		xe_exec_queue_device_get_max_priority(xe);
> +	config->info[DRM_XE_QUERY_CONFIG_DISPLAY_ALIGNMENT] =
> +		xe->info.vram_flags & XE_VRAM_FLAGS_DISPLAY_NEED64K ? SZ_64K : SZ_4K;
>  
>  	if (copy_to_user(query_ptr, config, size)) {
>  		kfree(config);
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 19619d4952a8..c7a930dbf58c 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -398,6 +398,8 @@ struct drm_xe_query_mem_regions {
>   *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
>   *  - %DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY - Value of the highest
>   *    available exec queue priority
> + *  - %DRM_XE_QUERY_CONFIG_DISPLAY_ALIGNMENT - Alignment of contigous physical
> + *    memory allocation required by the display, typically SZ_4K or SZ_64K
>   */
>  struct drm_xe_query_config {
>  	/** @num_params: number of parameters returned in info */
> @@ -412,6 +414,7 @@ struct drm_xe_query_config {
>  #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
>  #define DRM_XE_QUERY_CONFIG_VA_BITS			3
>  #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
> +#define DRM_XE_QUERY_CONFIG_DISPLAY_ALIGNMENT		5
>  	/** @info: array of elements containing the config info */
>  	__u64 info[];
>  };
> -- 
> 2.34.1
> 

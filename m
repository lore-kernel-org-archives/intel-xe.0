Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A9AC83F17
	for <intel-xe@archiver.kernel.org>; Fri, 18 Jul 2025 17:28:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3785E10EA27;
	Fri, 18 Jul 2025 17:28:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ESfuFgy/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7137710EA27
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Jul 2025 17:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752859737; x=1784395737;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=89r/isuE0tI9MZmeRfRiC/6jJ760diQAYEjlr1bvx8w=;
 b=ESfuFgy/Lgd0OtIqgS5nBXQftKi/y1GRiFWRbTYiwTP3YuITJ+n+iXuR
 19z8Vft8QRnNJqvsRr+ZIje9PV9tz9QESQL1v6fz2l2vnTMUz3QKly92c
 S3n+xJSEq1RGfRGX41BRCdGdBLQSFOoICwvi6pcgBP2YrcUj2cEtIM07P
 uGagWuDFZoMBGYrlrA+sJ3ssI/WQhjO3/vNfDhUE6iXzA715eKDbrOvXt
 JcwqlQCPo4vLz1zn1MKS38XX3dzGuNHsZGfCFy3xlO3ic7vjd+/rwXSt9
 pefMO04Wlhsd1laHyg8FOZX0QyX/cUJNyOo7mxI9mZIaKOVZHu0qa2HDB g==;
X-CSE-ConnectionGUID: VMLtxpKQSju1GlcpZaeYDQ==
X-CSE-MsgGUID: KVYZJIrRT1qjMkevZmb8dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="72726334"
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; d="scan'208";a="72726334"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 10:28:57 -0700
X-CSE-ConnectionGUID: FlvIocmySgabB3KNCawQ2w==
X-CSE-MsgGUID: b8qnwwN2SwyXRpFcmht+Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; d="scan'208";a="157485242"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 10:28:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 18 Jul 2025 10:28:56 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 18 Jul 2025 10:28:56 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.87) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 18 Jul 2025 10:28:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kFTrG/wT6ouyvJrS8kNN1MNsOaAaGpI+r9ru30sNL8IfRJxjnMlGer6azXlxA/YV0nVsyvAxlYPhbLfg7ZkzkNjQHFEmwOKJ2TkKn6sRnutxt4QSEFqDc+/2cLkHsGQB9sBbqIfpd1BmI1dec83CabUWPak9e3gKsmBGoezneaLD6N7EJMpwOgKgFdnwRHCf7b2fBCRKVI/xqjZzph3bSxWThYmtBWK8nhUVoZUNN/f9ChTlMWDHUqVDH7Kd+UXBAJVu5uOnVLQKUqe87KQ8BvLgDXDdFkiH3En5bVTr2r+at2eeOIm2t2v/zQllA1kvuHVC2QDsV9Wj/4nQwhnQxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=89r/isuE0tI9MZmeRfRiC/6jJ760diQAYEjlr1bvx8w=;
 b=nQnlZsscBS44D97crzBv7Xys4F9NfPuEHVhX9lb9SxPqA7QCa/IBu8PgqfZVlVow3uWmep+Ao40uq0uedDxOsNgn4EDfiGmAZ75ukVDylnKfkiXYhsuOMExhAcBIrcOA8qgV/XTLqEMIhm3aPV1ZRUskeUuGs/rfV5PVciWCjmm71D/EPwOUg1vjjDZ/eWh26QKe9iUEFUj/S2y6VOHACVcNfoJm9uk8eyZGQAIqZ6xUgaAyH5t++omn7u4ZdmPKFW9W+Mufv9SCMdKWYnfiOxyuiOpS4Esg6jAJFitH5M3BzCWcn08w8w6O5KFsluUrwp/wfax3CAGIDwTLocgthQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH0PR11MB7635.namprd11.prod.outlook.com (2603:10b6:510:28e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Fri, 18 Jul
 2025 17:28:52 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%7]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 17:28:52 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 4/5] drm/xe/configfs: Allow configurations only for Intel
 VGA devices
Thread-Topic: [PATCH 4/5] drm/xe/configfs: Allow configurations only for Intel
 VGA devices
Thread-Index: AQHb90t5TwDjmHk060ODwPb6lYwj1LQ2y75AgADSrICAAFBMUIAABK+AgAAuXxA=
Date: Fri, 18 Jul 2025 17:28:51 +0000
Message-ID: <CH0PR11MB5444901A7258B500FEFE8C18E550A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250717184825.851-1-michal.wajdeczko@intel.com>
 <20250717184825.851-5-michal.wajdeczko@intel.com>
 <CH0PR11MB544431B55F24E0F1688393E4E551A@CH0PR11MB5444.namprd11.prod.outlook.com>
 <9f8bb67b-4381-40cb-ad02-6eaa4b5f94e1@intel.com>
 <CH0PR11MB544405DF502241716CBE896EE550A@CH0PR11MB5444.namprd11.prod.outlook.com>
 <cda446a2-bcf5-4865-b30a-c807e82d5e3e@intel.com>
In-Reply-To: <cda446a2-bcf5-4865-b30a-c807e82d5e3e@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH0PR11MB7635:EE_
x-ms-office365-filtering-correlation-id: 58b99646-d6da-42cf-2fe7-08ddc620905c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|10070799003|1800799024|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?THcrTjZGbVJwa0l5d01lMnlueE5zN3NRc2xHN1VQUlRqcjc2WDQydkpyaFlW?=
 =?utf-8?B?WXJTMHN4Z0RtanlHeDRmd0NrRlZURGU4RUdvLy9YSC9rWjhyYnlldTlCb1J1?=
 =?utf-8?B?M2hPTDJpWCtHWW1NeDk2Rlc4bk9PWTI3OVRFWmVFSzU5cmlNVXBQYm5Gc1Z1?=
 =?utf-8?B?K0Q5Z1gycVZSUDkrWXl0REUxaFdlMVZ4VnJHamlHalZOTU41aXo5MkhBS3pO?=
 =?utf-8?B?Zk1TTUhKUzVZMmwrYnlXak1zMzl2d1RkMXpCS1REUTgwMVQyMmQrb0R3MG9y?=
 =?utf-8?B?aDVzN0pMWDkvdERWdFRYTnNHd3lVU1AxSm1TM21lVzZjdHltS1VBaDd3VURs?=
 =?utf-8?B?bDVCNC9ob0VrTEVlWlZidmlNc0xBeGVwZUoyWnpyVnBtRmlhZGpTTUNPenNr?=
 =?utf-8?B?d2VIdU41UDJTbDVCNXJQVUJDQlJ1ZFJEdjF4amtTTnJGRE03OHM1YUM3TXVX?=
 =?utf-8?B?aHh2VE5MQllnQVlGRkNQSEExYWc0YzNNZzBvYkhVZE1qTEJOWkNLY25NNVpN?=
 =?utf-8?B?aUFteHRLaDNSanBuVWRrc1hrSFhLVW5oYVhnTGIwSkZwN2dxMjFVTHZuaGM2?=
 =?utf-8?B?aE1xZGNvMU1QYlhRK1BWVnpPZC9FZm0zOUVZUE1wdFpuRDNwVFU0YU1Eb3M2?=
 =?utf-8?B?ZlVncWxTV3lSVUpEcmJCTjVpbGM5cVhNVlFBVzBmVkIySlAvaDU0MDlKdkhh?=
 =?utf-8?B?by9SMVhhaVlha1VWNG1yNnpKSlBubzRuUjNxTHVleGkvS1gzYzZhaWtpKy9O?=
 =?utf-8?B?R04yMU5YcEZHK25vUUZIZGVSZE5zYzZZMzJjM0RsQk8xRTdSaUt0U1BmbG9W?=
 =?utf-8?B?Zk92SHlMdWE1NGFGeWtiY1lTWE1WZkNRTlpKTmR4VVV6QkNnUyszcGJkc0dI?=
 =?utf-8?B?UWJGaTQ5Z1VkNVVkV2s3OTlOWjFKSmkwb0J6ZUVSQ2g0dXdvNkFPR2RuSm0r?=
 =?utf-8?B?N1FkWiszVjQ4VXBJK0ZFYlBUeEUrdUYzeW1hQzBFN203SXBTS0wvcm5UTXdy?=
 =?utf-8?B?clhRL3E1cEJyeWhjMmVNV2tRLzMvcVpxRHIvSmNRaEtDVzZVZnhpK281UWQv?=
 =?utf-8?B?bWpsVERtSnc3N2IzWWN6SE9QcmpnUExqQU50Tk5kbFdHRUdzVDhQdUdrWjNj?=
 =?utf-8?B?R09Pdy9VaXFDMWNUTHVzb2dIa05uK3V2dWxxOThralpybVdpNjFkTnNHYkJU?=
 =?utf-8?B?UmpuRUQxVng2T2NoRE5WeTNkWkEwMFcyN0tWY1FnaE13MXZoU3FwejNJakFw?=
 =?utf-8?B?ck9EdEd6T0RidVlKWm9aTlQ0YXdyODkvaG5zYlNBRS94UDM4VEFIWTlQclEz?=
 =?utf-8?B?V0tBRjFGWDN5UkZQRkE1Unp1K05wSjBzTUlqQ1UwSXhPVkR4L1R0T25IK2Q3?=
 =?utf-8?B?dHNvekd3Uk5ZaXpTdkZJWHlHcG5mTUgxS1d1SVFUWXRYOE1PQjA2M0V3cFRU?=
 =?utf-8?B?UlY4aEllMUoyTDk4cjdtM21HcVZTMFNlQzZabzNLSDJnV0crc3h3emY4MVAy?=
 =?utf-8?B?UW9Ubmwyam1BZmZ3UVVWejJYUFFhMEdtaS9sU2VxN3grc3RyY2tEWExycmd0?=
 =?utf-8?B?bmJuVkJtSVdPNUhWakZvdVhMM1FpOFBmMy96cG9VdnRYM1Yxdy9BTnIrVUxF?=
 =?utf-8?B?OGZ4eGRQL29zVHBhYVhQMVRhZTN2ZHdQWkRBd0Z4Qlc3MGJiYmpvODhlYjdn?=
 =?utf-8?B?NXhKYUdTclh1WTFVRWVxUk1NOGlIVmlRVlk0U3J2ZE95Nnp6dzJuRjdRU3RB?=
 =?utf-8?B?blQ5Z2lFUzBiWDJwVGdRSDNtNTU3QW5ZTU82bk55T3daMlh5K2FaVk8wSjVo?=
 =?utf-8?B?cnpWN25xUWl5V05iWjZ0cFpFaUk0cWhnZXdtYUMveVpRUUtOd0pNaFdPbm84?=
 =?utf-8?B?dnJFUHFoVVRzZ1RnTTJxVG4zQk9TcWFzWnZVYm5TOHBiOERCZjRsME9GeDBa?=
 =?utf-8?B?YXpUeHdrRE1jeVNzOFVNUkk2ejlMRWdZMjZaTG5qTlR1VUhNb0RXbFNCckdQ?=
 =?utf-8?B?TDgwdWZMcW9BPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c3prcHdrOXJQODA1VG5BQmhsd1lGTzBFUjdOVG95SXF1VW93bmUvMEVtMHUx?=
 =?utf-8?B?cWRYaTh0ektSMlRhc21LYVRVbVlmeWR6VDkwRGZYUmMvN0pqR1pjeWNuS0Fu?=
 =?utf-8?B?bDJyZHpQMkU4THhUdklFN0pxTU9Qa3hmMHhBTUgvNlZTcERmV3VKeW9CNVEw?=
 =?utf-8?B?S1VGdnEwZVJ3WklqcURCY0dBc0xzMlcxcTk1V1NQRkFQMU50RVgxSVh4K3da?=
 =?utf-8?B?VTQxRi8zVlBqTDg0Y0k4YkduWU9wbXVkSnlxd29oY3VBQThRUHBLc0ZxU1ps?=
 =?utf-8?B?Z1o4RXlBcUx3VGsyS09MWERmTnZWT0FjamNTZjRwemFpRGMzUDJoUjdhWW9C?=
 =?utf-8?B?SUZNSmVZS2ZwT3Rlb3NaK0RYQXZsaFljVXFCNm1Fa3F2Y2FRak1NMlBiUUNL?=
 =?utf-8?B?RlhrS0thMGFpNjEzRU1nUnFKSHNHUDl3TU82UFZZckxaR245TUw4eFpHNnVx?=
 =?utf-8?B?dndUZTNFRk5xSU5YaVRZRENpTGNrNzI0cnovKzV0ZWxneVBtOHFpU3AvNlpx?=
 =?utf-8?B?MDk2VCtrL3kyQkJoanRqOGFSbnBMVHArc3RYK256U1JMai91bit3Y3A3SERL?=
 =?utf-8?B?OUxyUU5oTWF3Q3RENGJVc091WWhyd243MG1sTFNpWU8rSHUzQzVhazdCbmov?=
 =?utf-8?B?YlBpYVFuWWJLMkNqTXAvZnI5Y0xaeDZmQ2JqL0xhQ211aWpJdUFpUXJmSHI0?=
 =?utf-8?B?aUxkNFRidE9aQXEyZ2VvYUVkMnBkTzlhK2JIQ2RFNHN1VG9KUlFnWk52aW8y?=
 =?utf-8?B?U1J4TzhsZHZhcERrZUJ0V3FKS2o3MXQ5MGFkclh2R2IxcjQ2YnJOVmhnWWNR?=
 =?utf-8?B?Q296aU9lbmFMNm56cHNwNFlXUGhSQWNDUHU4NHBlU09SZnErTGtYSGRkcldp?=
 =?utf-8?B?UTQ5QkVNdkR5VWh6dU5KdXIxOG1FUkU5SVJ2S1JOUUc4YmRxWk9kbld4clg3?=
 =?utf-8?B?ejJrWTJxcHk5VFphQnJnRjFNSHltQm1XR3RKL1hiTFpTK1d2anRJQXU1TXJK?=
 =?utf-8?B?RDNVai9Jc2pUTVVBQnlWNmNzam9RMUZSQzB0d2hlOTdpdFFKbiswM3BsSjNY?=
 =?utf-8?B?aVpweVExSGtKMVp2ZXBZZndnYXRLeTh5bTBSWi92MkYwcC9MUHg1RDIrelZp?=
 =?utf-8?B?MzN5WFBKaTgxUlduTExzVmdjaTk1ak52VXpLMzBkdzViZklIa1l0VzFRQVRl?=
 =?utf-8?B?dlRGaFBvbFlvaFdTS0RWd3ZnQU8vMTFBQ0xoell6bExZS0h4TDIrUUd4NmQ2?=
 =?utf-8?B?TVFNT0VqdzVpMGJTZllFeGJXSVpiV2xPM1lzckdNZ2ZTYlIwQkNHY2VueitI?=
 =?utf-8?B?dlhUS21EWHZ4YWtldkowQS94VlFZQjM4UE52dXdDVDMrejNyKzhCODhSbjd2?=
 =?utf-8?B?RUNVU2I1eHF3T1NQaklrU0l5QnI2YklvT3J6SFh0UTJvNG02c3FwR2FtK1BX?=
 =?utf-8?B?UlpiNkxuQUFVb1RzRldLMnNKWW52RDFlSk5UKzd5YWtBVmJFc05sSUIyUjdz?=
 =?utf-8?B?MjVBTUh2Ry94VFRYbDU5ZzhtNDZoQ2MrYUZRYjRTTHQwakxsbndpTFF6cUJC?=
 =?utf-8?B?ZG5IVU1HRFpzNVdCRXpsWFZ4U0dYNzdJczVHY00wczhtVm4zUy9mbHBBSEk5?=
 =?utf-8?B?Y1UzMG5kam1Id2M3dU9SZHlKZmtWRXRESkZ5VHRld0dOaWRLbSsyMTdXTm4r?=
 =?utf-8?B?NUJsbkoyaVZsdmpOaG1VM2FOVitRRjV5MmpIOExuMTBkWHpSVnN6SDc5L3JC?=
 =?utf-8?B?UUVld1hhZjFpQXRicGpWN3loZmI5Q24xYmd1ZmdVVHFZT1p1UTI1cmNyanpz?=
 =?utf-8?B?RUsydTFZQmRhbWFhYWNSWmhESjhWR0R5elVkeVZEdVlsWCt1MEZVSUVWc0xo?=
 =?utf-8?B?TGx4MHM3QjBYQW5YdWM4RlpwSUhTZEdYV2ppTDFBSEhSNmF3VmRwaCt3NXMw?=
 =?utf-8?B?ZUdXZzAvbzJ5NTJaQTJXWGFSWThRMVl3ekNtVGgxN29aWm8wUkh4ZGxFSVUv?=
 =?utf-8?B?dTNHOVZEMWlhM0RNZEZURG9RRVl5R1Znc2pyOUl3SW1ZckVLazcrb29veG1T?=
 =?utf-8?B?TURRdUxXSFdaR01lMXEzNHJ6bjdrSWwwN2pZeDZBOU1pTmJjQWtBbFVrOXpT?=
 =?utf-8?B?Mml6dGh0Z3RsenJkVFFoakMyVitpVlZ4NmUrTGZlVnZnR01PUWlaVmJyNys2?=
 =?utf-8?Q?OcjBygIaorowhemr2/+Y8niS4cVylwiRDCtZrAPOxaCr?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58b99646-d6da-42cf-2fe7-08ddc620905c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2025 17:28:51.9651 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yh2l4TJWX0hXSGwlBQqUXn94JNEKgye1Y7/02uQL5yU56xvTOgtoN5d730qi5MR5J1EcL8JDFfkd1995lQgV2WBEpyIWCQyXP3rBOGKn4Gw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7635
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFdhamRlY3prbywgTWljaGFsIDxNaWNo
YWwuV2FqZGVjemtvQGludGVsLmNvbT4gDQpTZW50OiBGcmlkYXksIEp1bHkgMTgsIDIwMjUgNzoz
NCBBTQ0KVG86IENhdml0dCwgSm9uYXRoYW4gPGpvbmF0aGFuLmNhdml0dEBpbnRlbC5jb20+OyBp
bnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBEZSBNYXJjaGksIEx1Y2FzIDxsdWNh
cy5kZW1hcmNoaUBpbnRlbC5jb20+DQpTdWJqZWN0OiBSZTogW1BBVENIIDQvNV0gZHJtL3hlL2Nv
bmZpZ2ZzOiBBbGxvdyBjb25maWd1cmF0aW9ucyBvbmx5IGZvciBJbnRlbCBWR0EgZGV2aWNlcw0K
PiANCj4gT24gMTguMDcuMjAyNSAxNjoyNywgQ2F2aXR0LCBKb25hdGhhbiB3cm90ZToNCj4gPiAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206IFdhamRlY3prbywgTWljaGFsIDxN
aWNoYWwuV2FqZGVjemtvQGludGVsLmNvbT4gDQo+ID4gU2VudDogRnJpZGF5LCBKdWx5IDE4LCAy
MDI1IDI6MzAgQU0NCj4gPiBUbzogQ2F2aXR0LCBKb25hdGhhbiA8am9uYXRoYW4uY2F2aXR0QGlu
dGVsLmNvbT47IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiA+IENjOiBEZSBNYXJj
aGksIEx1Y2FzIDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+DQo+ID4gU3ViamVjdDogUmU6IFtQ
QVRDSCA0LzVdIGRybS94ZS9jb25maWdmczogQWxsb3cgY29uZmlndXJhdGlvbnMgb25seSBmb3Ig
SW50ZWwgVkdBIGRldmljZXMNCj4gPj4NCj4gPj4gT24gMTcuMDcuMjAyNSAyMzoxOSwgQ2F2aXR0
LCBKb25hdGhhbiB3cm90ZToNCj4gPj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+
Pj4gRnJvbTogSW50ZWwteGUgPGludGVsLXhlLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
PiBPbiBCZWhhbGYgT2YgTWljaGFsIFdhamRlY3prbw0KPiA+Pj4+IFNlbnQ6IFRodXJzZGF5LCBK
dWx5IDE3LCAyMDI1IDExOjQ4IEFNDQo+ID4+Pj4gVG86IGludGVsLXhlQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZw0KPiA+Pj4+IENjOiBXYWpkZWN6a28sIE1pY2hhbCA8TWljaGFsLldhamRlY3prb0Bp
bnRlbC5jb20+OyBEZSBNYXJjaGksIEx1Y2FzIDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+DQo+
ID4+Pj4gU3ViamVjdDogW1BBVENIIDQvNV0gZHJtL3hlL2NvbmZpZ2ZzOiBBbGxvdyBjb25maWd1
cmF0aW9ucyBvbmx5IGZvciBJbnRlbCBWR0EgZGV2aWNlcw0KPiA+Pj4+DQo+ID4+Pj4gVGhlIFhl
IGRyaXZlciBzdXBwb3J0cyBvbmx5IEludGVsIEdQVXMgZGV2aWNlcyB0aGF0IGFsbCBhcmUgUENJ
DQo+ID4+Pj4gVkdBIGNsYXNzIGRldmljZXMuIFJlamVjdCBjcmVhdGlvbiBvZiBjb25maWd1cmF0
aW9uIGRpcmVjdG9yaWVzDQo+ID4+Pj4gZm9yIFBDSSBkZXZpY2UgYWRkcmVzc2VzIHRoYXQgYXJl
IG5vdCBJbnRlbCBvciBWR0EuDQo+ID4+Pj4NCj4gPj4+PiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWwg
V2FqZGVjemtvIDxtaWNoYWwud2FqZGVjemtvQGludGVsLmNvbT4NCj4gPj4+PiBDYzogTHVjYXMg
RGUgTWFyY2hpIDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+DQo+ID4+Pj4gLS0tDQo+ID4+Pj4g
IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9jb25maWdmcy5jIHwgNyArKysrKysrDQo+ID4+Pj4gIDEg
ZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykNCj4gPj4+Pg0KPiA+Pj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfY29uZmlnZnMuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9jb25maWdmcy5jDQo+ID4+Pj4gaW5kZXggMDBiYjRlNDEyYzEyLi4xZGY4Y2NlNzhmMTMgMTAw
NjQ0DQo+ID4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2NvbmZpZ2ZzLmMNCj4gPj4+
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfY29uZmlnZnMuYw0KPiA+Pj4+IEBAIC0yNjAs
NiArMjYwLDcgQEAgc3RhdGljIHN0cnVjdCBjb25maWdfZ3JvdXAgKnhlX2NvbmZpZ19tYWtlX2Rl
dmljZV9ncm91cChzdHJ1Y3QgY29uZmlnX2dyb3VwICpncm8NCj4gPj4+PiAgCXN0cnVjdCB4ZV9j
b25maWdfZGV2aWNlICpkZXY7DQo+ID4+Pj4gIAlzdHJ1Y3QgcGNpX2RldiAqcGRldjsNCj4gPj4+
PiAgCWNoYXIgY2Fub25pY2FsWzE2XTsNCj4gPj4+PiArCWJvb2wgbWF0Y2g7DQo+ID4+Pj4gIAlp
bnQgcmV0Ow0KPiA+Pj4+ICANCj4gPj4+PiAgCXJldCA9IHNzY2FuZihuYW1lLCAiJXg6JXg6JXgu
JWQiLCAmZG9tYWluLCAmYnVzLCAmc2xvdCwgJmZ1bmN0aW9uKTsNCj4gPj4+PiBAQCAtMjc1LDgg
KzI3NiwxNCBAQCBzdGF0aWMgc3RydWN0IGNvbmZpZ19ncm91cCAqeGVfY29uZmlnX21ha2VfZGV2
aWNlX2dyb3VwKHN0cnVjdCBjb25maWdfZ3JvdXAgKmdybw0KPiA+Pj4+ICAJcGRldiA9IHBjaV9n
ZXRfZG9tYWluX2J1c19hbmRfc2xvdChkb21haW4sIGJ1cywgUENJX0RFVkZOKHNsb3QsIGZ1bmN0
aW9uKSk7DQo+ID4+Pj4gIAlpZiAoIXBkZXYpDQo+ID4+Pj4gIAkJcmV0dXJuIEVSUl9QVFIoLUVO
T0RFVik7DQo+ID4+Pj4gKw0KPiA+Pj4+ICsJbWF0Y2ggPSBwY2lfaXNfdmdhKHBkZXYpICYmIHBk
ZXYtPnZlbmRvciA9PSBQQ0lfVkVORE9SX0lEX0lOVEVMOw0KPiA+Pj4NCj4gPj4+IFRoaXMgbWF0
Y2ggY2hlY2sgaXMgcmVsYXRpdmVseSBzaG9ydC4gIERlYmF0YWJseSwgd2UgY291bGQganVzdCBk
byB0aGUgY29tcGFyaXNvbg0KPiA+Pj4gZGlyZWN0bHkgaW4gdGhlIGlmLXN0YXRlbWVudCBpbnN0
ZWFkIG9mIGFzc2lnbmluZyB0aGUgcmVzdWx0IHRvIGEgbmV3IHZhcmlhYmxlLg0KPiA+Pg0KPiA+
PiB3aGF0IGRvIHlvdSBtZWFuIGJ5IHRoZSAiaWYtc3RhdGVtZW50IiA/DQo+ID4+DQo+ID4+IHdl
IGNhbid0IHJldHVybiBlYXJseSBoZXJlIGFzIHRoZW4gd2Ugd291bGQgbGVhayAoYWdhaW4pIGEg
ZGV2aWNlDQo+ID4+IHJlZmVyZW5jZSB0aGF0IHdlIGp1c3QgZml4ZWQgaW4gcGF0Y2ggMS81DQo+
ID4gDQo+ID4gQnkgJ2lmLXN0YXRlbWVudCcsIEkgbWVhbnQgdGhpcyBvbmUgbG93ZXIgZG93biwg
YWZ0ZXIgdGhlIHBjaV9kZXZfcHV0Og0KPiA+IA0KPiA+ICIiIg0KPiA+IAlpZiAoIW1hdGNoKQ0K
PiA+ICIiIg0KPiA+IA0KPiA+IEkgd2FzIHN1Z2dlc3RpbmcgdGhhdCB3ZSBjb3VsZCBwZXJmb3Jt
IHRoZSBjaGVjayB0aGVyZSBpbnN0ZWFkLiAgU29tZXRoaW5nIGxpa2U6DQo+ID4gDQo+ID4gIiIi
DQo+ID4gCWlmICghcGNpX2lzX3ZnYShwZGV2KSB8fCBwZGV2LT52ZW5kb3IgIT0gUENJX1ZFTkRP
Ul9JRF9JTlRFTCkNCj4gPiAiIiINCj4gPiANCj4gPiBEb2luZyBzbyB3b3VsZCBlbGltaW5hdGUg
dGhlIG5lZWQgZm9yIHRoZSBuZXcgdmFyaWFibGUgJ21hdGNoJyBkZWZpbmVkIGluIHRoaXMgcGF0
Y2guDQo+ID4gDQo+ID4gSG93ZXZlciwgSSB1bmRlcnN0YW5kIHdoeSB3ZSdyZSBub3QgZG9pbmcg
aXQgdGhhdCB3YXkuDQo+IA0KPiBqdXN0IHRvIGNvbmZpcm0gKGFzIHRoaXMgaXMgYSBkaWZmZXJl
bnQgcmVhc29uIHRoYW4gSSBtZW50aW9uZWQgYWJvdmUpOg0KPiBhZnRlciBwY2lfZGV2X3B1dCgp
IHdlIHNob3VsZG4ndCBhY2Nlc3MgcGRldiBhbnkgbW9yZQ0KDQpPa2F5LiAgVGhhdCBtb3JlIGRp
cmVjdGx5IGFuc3dlcnMgd2h5IHdlJ2QgbmVlZCB0byBzdG9yZSB0aGUgdmFsdWUgZWFybGllcjog
d2UgdmVyeQ0KbGl0ZXJhbGx5IGNhbm5vdCBhY2Nlc3MgdGhlIHZhbHVlIGxhdGVyLCBzbyB3ZSBu
ZWVkIHRvIGRvIHRoZSBjb21wYXJpc29uIG5vdyBhbmQgc2F2ZQ0KdGhlIHJldHVybiB2YWx1ZSBm
b3Igd2hlbiBpdCdzIG5lZWRlZC4NCg0KTXkgbGF0ZXIgY29tbWVudCBvbiBzZXBhcmF0aW5nIHRo
ZSBjaGVjayBpbnRvICJvcF9zdXBwb3J0ZWQiIGFuZCAibWF0Y2giIHN0aWxsDQpzdGFuZHMsIGJ1
dCBhcyBpdCdzIGp1c3QgYSBzdWdnZXN0aW9uLCBJJ2xsIGNvbnRpbnVlIHRvIG5vdCBibG9jayBv
biBpdC4NCg0KTXkgUmV2aWV3ZWQtYnkgc3RpbGwgc3RhbmRzIGFzIHdlbGwuDQotSm9uYXRoYW4g
Q2F2aXR0DQoNCj4gDQo+ID4gLUpvbmF0aGFuIENhdml0dA0KPiA+IA0KPiA+Pg0KPiA+Pj4NCj4g
Pj4+IEkgd29uJ3QgYmxvY2sgb24gaXQsIHRob3VnaCwgc2luY2UgY2xlYXJseSBsYWJlbGluZyB0
aGVzZSBjb21wYXJpc29ucyBpcyBpbXBvcnRhbnQuICBUaG91Z2gsDQo+ID4+PiBwZXJoYXBzIHdl
IHNob3VsZCBjYWxsIGl0ICJvcF9zdXBwb3J0ZWQiIGluc3RlYWQgb2YgIm1hdGNoIj8gIEkgdW5k
ZXJzdGFuZCB3aHkgaXQncyBjYWxsZWQNCj4gPj4+ICJtYXRjaCIgaGVyZSAoaXQncyBtb3JlIGlu
IGxpbmUgd2l0aCBob3cgaXQncyB1c2VkIGluIHBhdGNoIDUpLCBidXQgbWF5YmUgdGhpcyBjaGVj
ayBhbmQgdGhlDQo+ID4+PiBjaGVjayBpbiBwYXRjaCA1IHNob3VsZCBiZSBzZXBhcmF0ZWQgb3V0
Pw0KPiA+Pg0KPiA+PiBJJ20gbm90IHN1cmUgdGhhdCBhZGRpbmcgbW9yZSBmbGFncyB2YXJpYWJs
ZXMgd2lsbCBtYWtlIGNvZGUgYW55DQo+ID4+IGNsZWFuZXIsIHdoYXQncyBpbXBvcnRhbnQgYXJl
IGNvbmRpdGlvbnMgaW5zaWRlLCBhbmQgeWVzLCB0aGlzIGlzDQo+ID4+IGFsaWduZWQgd2l0aCBu
ZXh0IHBhdGNoLCB3aGljaCBhZGRzIG1vcmUgY29uZGl0aW9ucyB0byBiZSBjaGVja2VkIGJlZm9y
ZQ0KPiA+PiB3ZSBjYW4gY2xhaW0gdGhhdCB0aGVyZSBpcyBhICJtYXRjaCIgYmV0d2VlbiBkZXZp
Y2UgYWRkcmVzcyBhbmQgZGV2aWNlDQo+ID4+IGNsYXNzIHRoYXQgd2UgbWF5IHN1cHBvcnQNCj4g
Pj4NCj4gPj4+DQo+ID4+PiBKdXN0IGEgc3VnZ2VzdGlvbi4NCj4gPj4+DQo+ID4+PiBSZXZpZXdl
ZC1ieTogSm9uYXRoYW4gQ2F2aXR0IDxqb25hdGhhbi5jYXZpdHRAaW50ZWwuY29tPg0KPiA+Pj4g
LUpvbmF0aGFuIENhdml0dA0KPiA+Pj4NCj4gPj4+PiArDQo+ID4+Pj4gIAlwY2lfZGV2X3B1dChw
ZGV2KTsNCj4gPj4+PiAgDQo+ID4+Pj4gKwlpZiAoIW1hdGNoKQ0KPiA+Pj4+ICsJCXJldHVybiBF
UlJfUFRSKC1FTk9ERVYpOw0KPiA+Pj4+ICsNCj4gPj4+PiAgCWRldiA9IGt6YWxsb2Moc2l6ZW9m
KCpkZXYpLCBHRlBfS0VSTkVMKTsNCj4gPj4+PiAgCWlmICghZGV2KQ0KPiA+Pj4+ICAJCXJldHVy
biBFUlJfUFRSKC1FTk9NRU0pOw0KPiA+Pj4+IC0tIA0KPiA+Pj4+IDIuNDcuMQ0KPiA+Pj4+DQo+
ID4+Pj4NCj4gPj4NCj4gPj4NCj4gDQo+IA0K

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40492CD342B
	for <intel-xe@archiver.kernel.org>; Mon,  2 Sep 2024 11:57:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B74910E2C5;
	Mon,  2 Sep 2024 11:57:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IAchqWZ1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9875A10E2C5
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Sep 2024 11:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725278277; x=1756814277;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=7mpj6UqX8D5O/WtqEs6KMbu9ZgSTYnufeoShI1wMCfc=;
 b=IAchqWZ1Z9/YW9TAVQxjxUzojo4fk6+JBXsTxWKbB363F8lopyfA0EqO
 1QNmn74Oz3FVpRcIjCln465cvczJs0nWK8FO4m+fp6QBjwF11ojs4MUn3
 F8/PW8xWv0YE5XAKmc5b8tHvmsC5Uv5YRd4nVNzEfTaqays9CFxjAn8rI
 /unDM/g2068nTCtJjjdmMfsz4hJTRxiWIT+xkGKOC0z2fIG6+Zp5XXC04
 8lcuT4HZlzPNqoirSFHwGJK3piKt450E4Qmgya2Ox3mOIqCV4AusrMuNa
 do1wHEcjxfVgZU0uh913XlkVL9KZuKUdMjsoZuWAyOuB5jxoZYscnzO2Z w==;
X-CSE-ConnectionGUID: X5rI32X+Ttuc9sdo8Wv7qw==
X-CSE-MsgGUID: cGuEtOuDROKVg7hMh9Rd1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="46370788"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208,217";a="46370788"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 04:51:34 -0700
X-CSE-ConnectionGUID: 3PIH+8dKQQWPln0Xn7RanA==
X-CSE-MsgGUID: jP7VL337SLa0YHNKYlsVZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208,217";a="64593489"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Sep 2024 04:49:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 2 Sep 2024 04:49:46 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 2 Sep 2024 04:49:46 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 2 Sep 2024 04:49:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dMgl0CDfZEb0OSPCoHJi/uqHje1ukoPd//d2rb2l0Y/CbTP9bkcC0/dzsEMzvwbmpUCUV5MJVsh/dUcn/03qhOyMtPkgh7BPIvUgxCQjeg2mwPDa3rK4ixVJSBfERORNctTN+bRXaXyB39mBPWBbGMhYmVkXEEZbTJPcS5+onkN7HnHxg/tOLegTp3lHELhhCK3RhjkAoUXANQ6AEoO6mJf7EOIGerUGGdDktyyfXXWlefRWlAQq7WzK8VSLAjhhWO0/DRhusxf9DpbLShnBAPR2pzmbWYAg7m/dg6W9jfTH/Jjm7OPqz9kSUIsFbyKJ78ZhwLfROFZ3uMjVuqjPoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/jolrOHKqEK3fazsRp9S3o5FTB0BsNZpTbwAwnlruWg=;
 b=Ra9v/ZVYfFatgPnOQg+sapzZpJ74q2KrQIUxn4L0FuErHcdklTLVNyn5qdb0Bx2f/q4i/C54mLRqObDsBXc5IbLWghJq81+h0d3SJlO2LCuZw4my7jPqHe0YcGWJ6HZ20KzbSmpi/tiybgGfI4z+9zxQjA1/dlz8K90hdl9YtEpKewN5WBvfPz/cqiP3kOG5h7dCsxdwoHaR4Dyp3WXmAkvT/K3hncJeRIaXFyD0JDBZTQsr+ue1XqtGmxc5ZuJhM706OMoXonAG/X74X+uAb8BzLjwJS5mHybjc0ATrFIj+Hbyu+ybIO0S/ffumw4gJdQ+PSAbRRWIe3KvF/vYTLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3238.namprd11.prod.outlook.com (2603:10b6:a03:7e::30)
 by DM4PR11MB5995.namprd11.prod.outlook.com (2603:10b6:8:5e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Mon, 2 Sep
 2024 11:16:21 +0000
Received: from BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03]) by BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03%7]) with mapi id 15.20.7918.024; Mon, 2 Sep 2024
 11:16:20 +0000
Content-Type: multipart/alternative;
 boundary="------------ZC2k7FhJHzicw1yPfspU1gMX"
Message-ID: <71680f92-c15d-4d6e-8238-307e16a6556f@intel.com>
Date: Mon, 2 Sep 2024 16:46:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: Apply workaround 14016747170
To: Jonathan-Cavitt <jonathan.cavitt@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <saurabhg.gupta@intel.com>, <alex.zuo@intel.com>,
 <matthew.d.roper@intel.com>, <jani.nikula@linux.intel.com>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>
References: <20240830161118.2055939-1-jonathan.cavitt@intel.com>
Content-Language: en-US
From: "Pottumuttu, Sai Teja" <sai.teja.pottumuttu@intel.com>
In-Reply-To: <20240830161118.2055939-1-jonathan.cavitt@intel.com>
X-ClientProxiedBy: MAXPR01CA0108.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::26) To BYAPR11MB3238.namprd11.prod.outlook.com
 (2603:10b6:a03:7e::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3238:EE_|DM4PR11MB5995:EE_
X-MS-Office365-Filtering-Correlation-Id: 86dc5c3d-c538-4778-06f7-08dccb40ab88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QXloWko4K0dCK3RVMkRNMkNZNjRXRms2TmhBeHBwS0hxdUtTdnFGUDFKMk44?=
 =?utf-8?B?TkVkTjAxOFFIMkM1OUFFeStZN2c1cjJpdDJscjBMUW5lUVlOWDZkMVEzZUI4?=
 =?utf-8?B?cmRVTWRrSEdldVVNTy9sZU1VQno1WUQ2akRVdnBBbm04OWdYZ2xBNzUvNkFM?=
 =?utf-8?B?UEF5TmVVRUEvVFJOT0dRb3k1bUNQSnh6MnpvbHNQcWhFTE1JNCsza2I1bGs1?=
 =?utf-8?B?Z3R3K0J2SWI1NlFybUlycjFNekNYODFFL3NwL2Yzd3RyWkFackx1Z0tpTEJy?=
 =?utf-8?B?SHgwRDdpWURzN0xlSFJPaTI4Z2JRVGM1eGRSOHEvTFljdVpNZkgwbnFIeFA2?=
 =?utf-8?B?aTBoczAyWWFpRFJrMEVCb3ZNcktBWE5kc2sySzIvQ2ZRaEdWZ3BjdC9ZaHZF?=
 =?utf-8?B?ejM3NmxrNWRNSE5rSXI3Mm1qeUFORDhBQU9MRFE1TzV2dkw4ay8rbm0rSk92?=
 =?utf-8?B?TFZzTUtZbDhneFk4cFh1TTk2cktKWUR4KzhxY2Y2RyszU2QxZnVIUDBTUEVL?=
 =?utf-8?B?cXlQOE9QYUh3bFlkWHRRU243MVgyTy8zTFBwOG1pZ2x5Vkx0UzhxMXZQRGw1?=
 =?utf-8?B?WDFrNzN6OFdaR0ZDOXlhQnVqNlF3aUYxT1Z4OFFISk42QjBvRk1abDVaY0VG?=
 =?utf-8?B?SHZ3SnF5SUZFUm1PK3pnSlV3clEzdXpCWjVNd2RvV0Q4T1NDaGh2R2FRazlC?=
 =?utf-8?B?V01zZVlaUFpaVWpCTGVhL2p2Vk1SMTFrZXlORDFYOElIQ3VuNDJpM0VySDlC?=
 =?utf-8?B?aElQVFJtR1cza2tsblZWTE4vc0NITnArRkh0WU04MG1EdlpNU000ZWxSVS9l?=
 =?utf-8?B?aWQxVXYzQ0x5OVpkcEc4aUdlUGhZMFFYMTRBakNKeU40VXkyMU52QlNoOTZO?=
 =?utf-8?B?cDYvajNSL1FMUE9vL3grUmF4a2VrUE92MGM3TnZ2MWthbmViWDNCQUorQjVJ?=
 =?utf-8?B?elVTTXFaeHdSRlhMaXJ2QXMwc09OdFVDYTdEL1Z3MFlhbmQvYVRpU09iU0s3?=
 =?utf-8?B?YmZPRlBLaDEydGJhSCtIeE9CT2FYckQ3VU5ha3N0bElLVzlLaGFIS0QvMVBO?=
 =?utf-8?B?SW9JSGMzOEExYkxvY2taSmUzSjFHZW14dFdkQlhjRVROTmNvVU5KSW9sbTZ4?=
 =?utf-8?B?elFLNUg1OUt1M1F1Y1lKN1YyUUNYRyt0Z1kxSUtPelduWlYrQkpUdXAvMGlS?=
 =?utf-8?B?NE5OUjFFYm40aVVzYUhqVG0xcEFSU3Q2U21lbGFNS0tlR1E2NDQzQnN4clRu?=
 =?utf-8?B?SEJoL3ROVzJQNDFkVHVncVR6cVV5eVBSbDE5dkE0My83KzFJUjRwNmRiTVhZ?=
 =?utf-8?B?cjNGZGdGR2hmRENtRzRwWXlYRnE1K0NGYXRVMXJKNzRMenNHVHEzODNhcTBx?=
 =?utf-8?B?elEwak41NlFwdzAvWFZkYXFQY1grYjA1Ujd3ZVJtQVRnaStpdEQ2WXI0TmZX?=
 =?utf-8?B?SjFGdnZLWmduc0I2WG9wQjh2Qkx3MlM3UDNORnpCWkRXM2N6WmJvcFRtV2Zo?=
 =?utf-8?B?TEVmUmt3VDhyWUE4K2x4Qk5NL3NFSGw3LzhRRDFvWmRIWFJLRVRHbTBCSXQw?=
 =?utf-8?B?YVhBVjNKdWxSdjNldTljSDFnTnJGemtEdGZWV3NMdEJZUXZ4Q2pDQzMwWTFD?=
 =?utf-8?B?MUUwV3d6Vm00b05KYmNFMlpmdVhJWVlHNThzbzRrSmVWS1NtV1R4RSt2M3BF?=
 =?utf-8?B?RElhMEdaOGplUWUrQWpocHFscXJyc3VDSHBGYjFDSVBmR3Y5YzlRY1Z2eS9v?=
 =?utf-8?B?MkhjYkZTd2hvdW1EVS90eTcvaXRFeXNSUER0eGlueWtxbkhBMFhtcXF1eHZS?=
 =?utf-8?B?Z3JITS9odko4TmJHZlNpZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3238.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWJvREEvbGxWSmYrdEFJdE9ISjUrWEtjTVlxT00xNUhMOVM4TkVDV2tRbzhL?=
 =?utf-8?B?R2hBS1M0M29Zek5tZUZYaUE3QklUMkRIRjhTRDhZTjNSckgwM2EyV2pQekR0?=
 =?utf-8?B?UkxFSEtOU2kxbEhiaTREL2JTcXdZZTUvSThoeFN4U25ZNmFvckVqenVjbzVa?=
 =?utf-8?B?TG9QZFNUU2RIbVYxanF0ckcwb1RLUmE2bmV0c1BxalU4dGVCU1V5QVZ0NjFV?=
 =?utf-8?B?MnhRcUhYVWtaT09GMmxTY0xSSmFzU01BWFY4eWgxWlp5YjB5Z0JtbUZrZ29p?=
 =?utf-8?B?dWJOR280akJyTnVCUDBGQUhHcGpWVWlhU2JwMHFOVjJDTENJZy9IR09aTTJC?=
 =?utf-8?B?RVlSL1o2NmsvazREeHpZbXo1d1BVMjc2S0xvakFNdGFvMk9QbkdzSkdNbFBZ?=
 =?utf-8?B?SFgrOHYvTU5pVlU4Um52b242MmU2K2x2ZDA5WWxjOXhUa2JBbExQQWlRY05R?=
 =?utf-8?B?ZlJMRWRKZUt0M2RKbnVBYW1acnVNOFd1NXBhL2c2K1dDVGpzaVBVMXA0aHlD?=
 =?utf-8?B?aGJ2WEFmd3ZUL3M4M3BIeHVhRG0xbXdtaGtjaUFGWEpNdDlyRElHalhpVFlZ?=
 =?utf-8?B?OXQrYXoxY2g5SUtWZFo2QkZsWVc1TkR4TFA0ak5haVlIOUsydjJrUTRQL2l4?=
 =?utf-8?B?UWRlbVBhYkFlY09sd0VTY3VlRUNOL0ZDSEVGZ3NUcTBadWxSWnhQc2l6eDV6?=
 =?utf-8?B?aDNhMlgxNkRGd3BmT3BKRm5GWjBTM1Vib0FUZ3VTcXRHY0Q1cFN3SlZUby9D?=
 =?utf-8?B?YmVJdExKZHQ3SlN5YWlPTVN3aFVCb2VVdkk3RkcrZWkrbXRNZFdOUWFNZDRp?=
 =?utf-8?B?bWdPMEdJeUVDMStoS0tIM2hGU1JBV2ZESVMrUjFURE5tcldVYXEyZzU4bThP?=
 =?utf-8?B?VjFCZXZqUlRHYUx5S2hUT0RIVWZpSTEzTGVRV3lMNUFzTWdBN3p2cjFQUWxp?=
 =?utf-8?B?T2lCenJYSnNBUWM0SFNNWHFvZFIxSG1iMEVjc2lJWkQrK052N0FqR29jaUtW?=
 =?utf-8?B?cEZlalJJL1hUR2FpYXhqZ2ZJTURqdE1mNmdDNVk0NjRQN1h1V0xlUEcvaTNQ?=
 =?utf-8?B?Y1FQRmNFcU1hWlMwR1pHaEtZRnFra0ZUdGJIdlRFMTJ2QzduQmx5OHA1WXho?=
 =?utf-8?B?dkJTVjBQWUgzL2M4elg5Q2VXc2FVU3U2dHhkdFpFYzhTZFhqbjVkRXJiVE1v?=
 =?utf-8?B?U21RMXZlU3VMSkk1dFB3N2VMWnJqTjEySFdqUlR1Y0hOY3dDNVMwMFloaFhN?=
 =?utf-8?B?clBBbXlZU3NRR3lLcWJSelRqY25kUVNLczZVMVZFMTBLMm5HOW5QYjRtc1ZH?=
 =?utf-8?B?d2s3Q0p0OVZkTVUvaE9tU0RKdWRteGpqdjJKTWI3WEpaYUUrZnNiNjlLSncy?=
 =?utf-8?B?R0hkVEZQQjJod21iYU1LTU5FR1ErTzVQMXNrMUlwMFJYN2VxRy9pRjlwMjJK?=
 =?utf-8?B?d2hHTzVEU0F6eVBSOE5QZTBzTERTODhEMnc1dExkZGFJNjV0TWs5aGFlMnEw?=
 =?utf-8?B?MUhhZ2M1SzB6dmd5dEdHenhDRThueFVXVExWL1VvOUc2ZEZyK0QrL0hIWjho?=
 =?utf-8?B?SmFtbUxjVFZoQTRuY0ljekcveEZhQThyalRxN1o4WFlrUDUxeEd3alRDZUR0?=
 =?utf-8?B?TXdnVi9nT0pFZkNBcE5BbU1CUUFWTk5SNkFvSVhpb2p1NVlqdnpIeVZYMVgv?=
 =?utf-8?B?YVZyU2VmYitYdDFPL3YxcVZpcDcwblJWRlJpSWtUcGxKb1FrVTZ3ZWN0dkx6?=
 =?utf-8?B?eGJnZzFacVZvNm5LVkRVVGNWMm4vV1o2aWxkWC9NVVQwZitIZzhPdEZlV2Ix?=
 =?utf-8?B?N1F6OVBQa0krajRaN2Vzd0U2a01CUXNwdzBHK2V2cmdRdVhXc09MTDN6VUNa?=
 =?utf-8?B?a3dubHR2bk1hdHFPYkN2eE9uWFZtMTRZSzhmWk52VUd4dk5scExPUStEem55?=
 =?utf-8?B?UVB0K3VnZGJLNnpEemVENmtBTFNhbnY2SzU0RnVvaHJzWFNlMkNzSlhoZDRz?=
 =?utf-8?B?VTlHZCtoNC9sbHNyQVFXMDJ1QlRSeVY3WnVuVEdEakR6NitVeVlaZjBOc1hO?=
 =?utf-8?B?ZndZN1k1c1c3dFBnV0NzS3g5UThVRmRuQ1RHTzZadVorZWlPci9idEE1cXRt?=
 =?utf-8?B?bGorVTFSa0E2WXNGR1hXWjMrc1YydUQrUHdOQWFYRExJNVozamswZkNoM0tm?=
 =?utf-8?Q?2rJna9IKJ1Z7cW8cqVqb6kY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 86dc5c3d-c538-4778-06f7-08dccb40ab88
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3238.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2024 11:16:20.0116 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OYjvtf5SKzSioNHlw7/y0yInNecPEYhyruGxny1utwT5V02ZXZuNVzBb8xxo2RRLiJ+LtyZTURaKNoAbGWFypFHE1E37OO40aKDGF+uHT0Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5995
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

--------------ZC2k7FhJHzicw1yPfspU1gMX
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 30-08-2024 21:41, Jonathan-Cavitt wrote:
> Some revisions of MTL do not properly report the correct value from the
> FUSE3_MBC_MEDIA register.  This results in the wrong value being
> reported for the l3 mask.
Should it be FUSE4 instead of FUSE3?
>
> Use the recommended replacement register in this case.
>
> Signed-off-by: Jonathan-Cavitt<jonathan.cavitt@intel.com>
> CC: Matt Roper<matthew.d.roper@intel.com>
> CC: Jani Nikula<jani.nikula@linux.intel.com>
> ---
>
> v2: Update includes ordering (Jani)
>
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h | 3 +++
>   drivers/gpu/drm/xe/xe_gt_mcr.c       | 8 ++++++++
>   drivers/gpu/drm/xe/xe_gt_topology.c  | 9 +++++++++
>   drivers/gpu/drm/xe/xe_wa_oob.rules   | 1 +
>   4 files changed, 21 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 0d1a4a9f4e119..e0d735a5a7fa1 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -522,6 +522,9 @@
>   #define   FORCEWAKE_MT(bit)			BIT(bit)
>   #define   FORCEWAKE_MT_MASK(bit)		BIT((bit) + 16)
>   
> +#define MTL_GT_ACTIVITY_FACTOR			XE_REG(0x138010)
> +#define   MTL_GT_L3_EXC_MASK			REG_GENMASK(5, 3)
> +
>   #define MTL_MEDIA_PERF_LIMIT_REASONS		XE_REG(0x138030)
>   #define MTL_MEDIA_MC6				XE_REG(0x138048)
>   
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> index 7d7bd0be6233e..3253eaefb18b3 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -5,6 +5,8 @@
>   
>   #include "xe_gt_mcr.h"
>   
> +#include <generated/xe_wa_oob.h>
> +
>   #include "regs/xe_gt_regs.h"
>   #include "xe_assert.h"
>   #include "xe_gt.h"
> @@ -14,6 +16,7 @@
>   #include "xe_guc_hwconfig.h"
>   #include "xe_mmio.h"
>   #include "xe_sriov.h"
> +#include "xe_wa.h"
>   
>   /**
>    * DOC: GT Multicast/Replicated (MCR) Register Support
> @@ -245,6 +248,11 @@ static void init_steering_l3bank(struct xe_gt *gt)
>   		u32 bank_mask = REG_FIELD_GET(GT_L3_EXC_MASK,
>   					      xe_mmio_read32(gt, XEHP_FUSE4));
>   
> +		/* Wa_14016747170 */
> +		if (XE_WA(gt, 14016747170))
> +			bank_mask = REG_FIELD_GET(MTL_GT_L3_EXC_MASK,
> +						  xe_mmio_read32(gt, MTL_GT_ACTIVITY_FACTOR));
> +

Was there any particular reason for just adding an if(wa) and not using 
an if(wa)/else condition similar to i915 implementation?

CC: Shekhar Chauhan <shekhar.chauhan@intel.com>

>   		/*
>   		 * Group selects mslice, instance selects bank within mslice.
>   		 * Bank 0 is always valid _except_ when the bank mask is 010b.
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> index 0662f71c6ede7..f1946ce0d937b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> @@ -8,10 +8,13 @@
>   #include <linux/bitmap.h>
>   #include <linux/compiler.h>
>   
> +#include <generated/xe_wa_oob.h>
> +
>   #include "regs/xe_gt_regs.h"
>   #include "xe_assert.h"
>   #include "xe_gt.h"
>   #include "xe_mmio.h"
> +#include "xe_wa.h"
>   
>   static void
>   load_dss_mask(struct xe_gt *gt, xe_dss_mask_t mask, int numregs, ...)
> @@ -144,6 +147,12 @@ load_l3_bank_mask(struct xe_gt *gt, xe_l3_bank_mask_t l3_bank_mask)
>   		u32 fuse4 = xe_mmio_read32(gt, XEHP_FUSE4);
>   		u32 bank_val = REG_FIELD_GET(GT_L3_EXC_MASK, fuse4);
>   
> +		/* Wa_14016747170 */
> +		if (XE_WA(gt, 14016747170)) {
> +			fuse4 = xe_mmio_read32(gt, MTL_GT_ACTIVITY_FACTOR);
> +			bank_val = REG_FIELD_GET(MTL_GT_L3_EXC_MASK, fuse4);
> +		}
> +
>   		bitmap_set_value8(per_mask_bit, 0x3, 0);
>   		gen_l3_mask_from_pattern(xe, per_node, per_mask_bit, 2, bank_val);
>   		gen_l3_mask_from_pattern(xe, l3_bank_mask, per_node, 4,
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 920ca50601466..5bac4123b5db1 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -37,3 +37,4 @@
>   16023588340	GRAPHICS_VERSION(2001)
>   14019789679	GRAPHICS_VERSION(1255)
>   		GRAPHICS_VERSION_RANGE(1270, 2004)
> +14016747170	GRAPHICS_VERSION_RANGE(1270, 1271), GRAPHICS_STEP(A0, B0)
--------------ZC2k7FhJHzicw1yPfspU1gMX
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 30-08-2024 21:41, Jonathan-Cavitt
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240830161118.2055939-1-jonathan.cavitt@intel.com">
      <pre class="moz-quote-pre" wrap="">Some revisions of MTL do not properly report the correct value from the
FUSE3_MBC_MEDIA register.  This results in the wrong value being
reported for the l3 mask.</pre>
    </blockquote>
    Should it be FUSE4 instead of FUSE3?<br>
    <blockquote type="cite" cite="mid:20240830161118.2055939-1-jonathan.cavitt@intel.com">
      <pre class="moz-quote-pre" wrap="">

Use the recommended replacement register in this case.

Signed-off-by: Jonathan-Cavitt <a class="moz-txt-link-rfc2396E" href="mailto:jonathan.cavitt@intel.com">&lt;jonathan.cavitt@intel.com&gt;</a>
CC: Matt Roper <a class="moz-txt-link-rfc2396E" href="mailto:matthew.d.roper@intel.com">&lt;matthew.d.roper@intel.com&gt;</a>
CC: Jani Nikula <a class="moz-txt-link-rfc2396E" href="mailto:jani.nikula@linux.intel.com">&lt;jani.nikula@linux.intel.com&gt;</a>
---

v2: Update includes ordering (Jani)

 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 3 +++
 drivers/gpu/drm/xe/xe_gt_mcr.c       | 8 ++++++++
 drivers/gpu/drm/xe/xe_gt_topology.c  | 9 +++++++++
 drivers/gpu/drm/xe/xe_wa_oob.rules   | 1 +
 4 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 0d1a4a9f4e119..e0d735a5a7fa1 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -522,6 +522,9 @@
 #define   FORCEWAKE_MT(bit)			BIT(bit)
 #define   FORCEWAKE_MT_MASK(bit)		BIT((bit) + 16)
 
+#define MTL_GT_ACTIVITY_FACTOR			XE_REG(0x138010)
+#define   MTL_GT_L3_EXC_MASK			REG_GENMASK(5, 3)
+
 #define MTL_MEDIA_PERF_LIMIT_REASONS		XE_REG(0x138030)
 #define MTL_MEDIA_MC6				XE_REG(0x138048)
 
diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index 7d7bd0be6233e..3253eaefb18b3 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -5,6 +5,8 @@
 
 #include &quot;xe_gt_mcr.h&quot;
 
+#include &lt;generated/xe_wa_oob.h&gt;
+
 #include &quot;regs/xe_gt_regs.h&quot;
 #include &quot;xe_assert.h&quot;
 #include &quot;xe_gt.h&quot;
@@ -14,6 +16,7 @@
 #include &quot;xe_guc_hwconfig.h&quot;
 #include &quot;xe_mmio.h&quot;
 #include &quot;xe_sriov.h&quot;
+#include &quot;xe_wa.h&quot;
 
 /**
  * DOC: GT Multicast/Replicated (MCR) Register Support
@@ -245,6 +248,11 @@ static void init_steering_l3bank(struct xe_gt *gt)
 		u32 bank_mask = REG_FIELD_GET(GT_L3_EXC_MASK,
 					      xe_mmio_read32(gt, XEHP_FUSE4));
 
+		/* Wa_14016747170 */
+		if (XE_WA(gt, 14016747170))
+			bank_mask = REG_FIELD_GET(MTL_GT_L3_EXC_MASK,
+						  xe_mmio_read32(gt, MTL_GT_ACTIVITY_FACTOR));
+</pre>
    </blockquote>
    <p>Was there any particular reason for just adding an if(wa) and not
      using an if(wa)/else condition similar to i915 implementation?</p>
    <p><span><span class="ui-provider a b c d e f g h i j k l m n o p q r s t u v w x y z ab ac ae af ag ah ai aj ak" dir="ltr">CC: Shekhar Chauhan
          <a class="moz-txt-link-rfc2396E" href="mailto:shekhar.chauhan@intel.com">&lt;shekhar.chauhan@intel.com&gt;</a></span></span> <br>
    </p>
    <blockquote type="cite" cite="mid:20240830161118.2055939-1-jonathan.cavitt@intel.com">
      <pre class="moz-quote-pre" wrap="">
 		/*
 		 * Group selects mslice, instance selects bank within mslice.
 		 * Bank 0 is always valid _except_ when the bank mask is 010b.
diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
index 0662f71c6ede7..f1946ce0d937b 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.c
+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
@@ -8,10 +8,13 @@
 #include &lt;linux/bitmap.h&gt;
 #include &lt;linux/compiler.h&gt;
 
+#include &lt;generated/xe_wa_oob.h&gt;
+
 #include &quot;regs/xe_gt_regs.h&quot;
 #include &quot;xe_assert.h&quot;
 #include &quot;xe_gt.h&quot;
 #include &quot;xe_mmio.h&quot;
+#include &quot;xe_wa.h&quot;
 
 static void
 load_dss_mask(struct xe_gt *gt, xe_dss_mask_t mask, int numregs, ...)
@@ -144,6 +147,12 @@ load_l3_bank_mask(struct xe_gt *gt, xe_l3_bank_mask_t l3_bank_mask)
 		u32 fuse4 = xe_mmio_read32(gt, XEHP_FUSE4);
 		u32 bank_val = REG_FIELD_GET(GT_L3_EXC_MASK, fuse4);
 
+		/* Wa_14016747170 */
+		if (XE_WA(gt, 14016747170)) {
+			fuse4 = xe_mmio_read32(gt, MTL_GT_ACTIVITY_FACTOR);
+			bank_val = REG_FIELD_GET(MTL_GT_L3_EXC_MASK, fuse4);
+		}
+
 		bitmap_set_value8(per_mask_bit, 0x3, 0);
 		gen_l3_mask_from_pattern(xe, per_node, per_mask_bit, 2, bank_val);
 		gen_l3_mask_from_pattern(xe, l3_bank_mask, per_node, 4,
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 920ca50601466..5bac4123b5db1 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -37,3 +37,4 @@
 16023588340	GRAPHICS_VERSION(2001)
 14019789679	GRAPHICS_VERSION(1255)
 		GRAPHICS_VERSION_RANGE(1270, 2004)
+14016747170	GRAPHICS_VERSION_RANGE(1270, 1271), GRAPHICS_STEP(A0, B0)
</pre>
    </blockquote>
  </body>
</html>

--------------ZC2k7FhJHzicw1yPfspU1gMX--

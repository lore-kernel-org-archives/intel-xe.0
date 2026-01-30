Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2157BD73EA9
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 00:50:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA69010E0BA;
	Fri, 30 Jan 2026 00:50:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KpOPqbVI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1E1310E0BA
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Jan 2026 00:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769734220; x=1801270220;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=iDdPay1Ew42gEdFbymyd2lTQmTEgOeSbDU9Ubbj33Io=;
 b=KpOPqbVIUaM8AGvmE5Iuv0GIOIX/7NqgXWRAlS7IbWAs6e+L1VvS6Aq+
 Whk13iJAGXljfri/81X2X1S9k1aF8U2eiUNweIYzUQvaB0+RZ1dSa2qV+
 v3KKpUm2+XndfrZVBAtH3YnO88l+sohe4s6ckhVhdrOc3UBymeBVzZt4N
 Io/hWKTZl6oUcXNVXEXYxQ9zK/2i3PNfV3KMC8HK3a9xbclLlXjKhyqfa
 VHvhP8PzFfw4oRqbikKLmvLDkQjS4l1xgKFmfTPxrUaGz4F9/hdHIB/Gj
 6JrS1xoEZiTAD95XY7mnzR9hL8zf1pdD77tHqlcVIwFeKv+0CXprWSWO2 A==;
X-CSE-ConnectionGUID: h+UucOSKQ1aUYU2QpbJznA==
X-CSE-MsgGUID: PkoPEPCsSlmAUuKsowqpFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="88558926"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="88558926"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 16:50:19 -0800
X-CSE-ConnectionGUID: H4FAbCKsSxSvKc8YjmBpUQ==
X-CSE-MsgGUID: zdOH+B5CQhyxWFLxN1fKvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="213215800"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 16:50:19 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 16:50:18 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 29 Jan 2026 16:50:18 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.14) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 16:50:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ao93IL1wyEHPv6v9PTJpsoBoBoXXWxOj1B0f71RWYbZmV71SmXXhMdjRMxpcz8HG592e3rQWpli7DAVS0UzSsVQ4ipMcIkoBGJDoBylEGzVyb9zMVuLvCwAG3D4dcLbLm9+ngXnafiZe8LTKC1XagUmIL1DSQ/Yb7kMJzu7SQKOdB070uZ8rrECdu6v/V/Gf/Lae8ZPxW/FJFQgYvJ+TqxBU67TE2xhrqUPil0l2cK1EFgwaWOPPdlvlY6N/kkx78pg75jSkyFvwNiwus8EmtDIxiG2M8K8NhyPJqvPKIOZzSgiblKNd8rgt+E3mNCGx2LoaWTS/UsmfosipAQTEZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tZjKc0AVPMsU8ZvcBr7Xvy527GO5PqXnjSlaRFLez5g=;
 b=gSZxtqSur5EdVihdyUTOe2wjOU9GLx57/ZOZ/RSSvOupTT4E1xLnzrsWiguBbMHUYlxs3fI2dnzZGlL58zLbqOOVRuVfPsGqx1giLGjpJSk0ONup1kx2t10N+CZIsMpqAvqP1bwT4lQ0/Jt8CgLvb/Uz/Lzqus+7DUx47IbNjYI9B07fxs0vda34nOEGV/SOC6NJZVuUFDLOpJXpOQM4chswJcYbsx8hW8Tf4v4OfVqbW4SdpDO72L/SWLq1wRk1ClTL/wk6mkGYNNkGF7RJeyz1XpfYlwcaGRSlLsGLhf7ZDkPy8djYA44HqdL7o40HxizmfoPB8HMJef56NN4XRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH7PR11MB6031.namprd11.prod.outlook.com (2603:10b6:510:1d2::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 00:50:15 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%4]) with mapi id 15.20.9564.006; Fri, 30 Jan 2026
 00:50:15 +0000
Message-ID: <c3527c31-72b7-40a3-bd7f-abdefc4897c4@intel.com>
Date: Thu, 29 Jan 2026 16:50:15 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] drm/xe/gsc: Fix GSC proxy cleanup on early
 initialization failure
To: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260129231141.512831-1-zhanjun.dong@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260129231141.512831-1-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0050.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::25) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH7PR11MB6031:EE_
X-MS-Office365-Filtering-Correlation-Id: 45b212b2-ac7d-4ea9-8203-08de5f998822
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ekN1NWF5VzJsTzNVMXZTOFArak5jS3RGVlcwbUtEdzJrRFBxc0VuNVluRDRK?=
 =?utf-8?B?T2Ftb1hKNk1PYXg5T1N6YzNCOXlkU1pTQk1sTVpwT3F5WFVyNHBtZW1NQ0JE?=
 =?utf-8?B?aVZSQXpWZ1BleE8xWnNnZ25tVFo2TWJTWnNwRjEzUEtDMWRRd2FONmpNQmpL?=
 =?utf-8?B?WlhWRzdGZWVkbnRXUndsUzR6K1JOcmpSL1p2QTFWZXRCMzE2cTZCLzNyUXIy?=
 =?utf-8?B?NmRGMFNidGtkT05NZklMYzAwT0NIN01GSkw4SzRNbFdoazRXekhzaGpMMlRk?=
 =?utf-8?B?T3EzdklHWEdSd0VvQStwL20rNjVRUllSNC9ZTTg0bCtCZkdyekZzSDkxQjJs?=
 =?utf-8?B?KzZIdERNbUp2OS9sVkp6UlpEWmw5V2xZR0Q5MHR2RlBRNkJVSk12MlBPQkow?=
 =?utf-8?B?aG1QeEpNNW13V2VQNDFBd0FsNm1LbnVldGUybEtKUDU2eE5COTlIa3c0WWJm?=
 =?utf-8?B?a0tpaXFHM1JjckEvUXhHK0hNczM2bm5kdDh3OWlJMTViL0tRSndDUVJIVFla?=
 =?utf-8?B?Tlgzam81R1o4Qy8yVktmK2JPdkNSZ0hHTjZSRnRuQVA4UWRQY0VreDVIWHE1?=
 =?utf-8?B?UWxXTVM2WXVRa2NJQnp1OUxLM0I5Y1pLeEJtOG5idXNlSU8wa1NUMkROTnVy?=
 =?utf-8?B?NG9QbXJhTVVkdnhRNXpxRFlGVmdQNDNFaEdnam9JazVNTzZQWDJsU0VvTjlN?=
 =?utf-8?B?M2VPNDU2K1hjZmZWWENDbTFLeDlvZDVkZGtPVVpSaDNCeGM4SXAvOUExaktT?=
 =?utf-8?B?ZVlzK0JtY1ZsM3lqTU0reG1ZWHdMSXdlNEpsWWRERHpxOFpqaStDOWtWQWxD?=
 =?utf-8?B?UU9PNHdSNDFTZEJvSTVuNTlkc1orZnJPcG4vT1N5WVpDUUZqcGNKeFlaSlZn?=
 =?utf-8?B?M0RFbHkzaU9ZRysyV1cyRFdxTGYwTW16Y2hBekFZM3F6Yzl4RU0xb1JSTjF2?=
 =?utf-8?B?eUZjaWlXNjZOcnhUekZWZkZBaVozbDgzRERlS29BNzFPVEtheTUveDZvaGtO?=
 =?utf-8?B?UnJuQlVZdUZ0OVo0UXI4Qzh1MTZKTmhLZ3dMYVlBT3haeGcxSmFzQnhCMzNQ?=
 =?utf-8?B?SmNRZ28yMVIxRGxrUGlETkRLRTVUVjFtb0NmRWdoTVliZElnY1diWUFqdHZD?=
 =?utf-8?B?cU5YYmVFTFlKbnlCcVpBTE5XbVZzVi9HK0F2OWpicFZWV1dsVzFrKzN1dTdw?=
 =?utf-8?B?YmtlSjZDaUVCTWJVRW9tb3N1c3dXY01paDU1ZjJkRzJBRXJ5N2xLRmsvbnVS?=
 =?utf-8?B?ZUdRTVZ0Rzc0Zld2d3hscjFQK254SlAxVzdyKzRTR3lzZkRvTXBieWNkL1pL?=
 =?utf-8?B?QjB1NjFTMEhMR003ZXBwbEt4SzZGVkZmZ2l3ckU2UVY4aXovR3hTcU0vU0tQ?=
 =?utf-8?B?Yk03VmJDY29YOGgwVXdLTEVJWmhFazVIMXo4WENvNE1kM1FhNTRNYjJxYTJs?=
 =?utf-8?B?RG5oUVlSc2tTdFVpcVJxSndwdWNleEZRQlJYUzZHdkZaNzQ5c24wNWg4cUxG?=
 =?utf-8?B?NUxhYlgvM1hDaE5neWVHeGtqUkJFVlVIaUowMXVoV29GSjArNGRuU1ZHR203?=
 =?utf-8?B?Y2dZOHVLMFRFU0FkbzR5NzRmNG1LaXZMOGJmczE0WkVVZGJqTlBGMnlxZm9h?=
 =?utf-8?B?MTk3ZkdOTHEvcndQQlppWjQyV3BJNEpKTnNMOGNxcEh3Slg0YzExSHFCd3hv?=
 =?utf-8?B?aVQveVJXWGh6ODd3dS9DdGZvcnlORURtY0cyQ0RJOTRraEhORUZ1dzFOL3Vm?=
 =?utf-8?B?NTJuUC9MRWsxSHE2cXFxUW95VXNGcmxBMExOcEQ3bDJ4Tm9lS2hiQzgxaE5G?=
 =?utf-8?B?V01jUlRUNitWeURDaEFKck5wdGFodk5ZcmlDVTIxTjd0M2t1TWwxWTBteWpN?=
 =?utf-8?B?OFRnTENUZ3FCdU9HUGw5VFRvSzFzYWpLQTVTSm9JbmNIWU52elRFN05VVzht?=
 =?utf-8?B?VVAvdVJUMGIzOXNMN21kbTErSkNFNWNHQ1hGS2g0QVNvYmpuVGQyOHFpUHU0?=
 =?utf-8?B?ZWxSN3A5K0o5d21PV1NYWnRvRlRtalc4Ynp5c0J2aTNOTXYwSUxyTVpNQ0xw?=
 =?utf-8?B?dXpYb09SQjRsbjJxM0ZLbmpseGR3WWxELzQ0Q0JjWm9SWENnd1VnRGVUeERj?=
 =?utf-8?Q?9rec=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QnIyMm54NXhTQ1J5VkxSMVkwOEsweHhUMkVKK0g1cVVxWUk2U3prUVI4M0ww?=
 =?utf-8?B?cVlaSEdVVnBzb1YwTlJpdm9nUkZWSUVSSDA3VG5LcG9adUV6RXZFczlnWjFK?=
 =?utf-8?B?L2Y5NWhlMU9BcFNPRG9qeFZnZUNKT2c3aERwS3ZHM2x3WWVDMVJyVjNIV2Fo?=
 =?utf-8?B?cVF5RjlzUlBWaXg5bk1iQUhudllBNkNNUDJtOXhkb3dtVkg3eFVpS2FDZlB4?=
 =?utf-8?B?cDZFMXczeHJTLzJ2R2lqMDFKd0JBSlBoQ0ltb29VUEc3ajJtQk4rR2FmVmxE?=
 =?utf-8?B?NzNVSDZFZG1GNUk0ZlV1S2J1K3dHMG1Zc1NCOHI3WklJb3psVWFRTUh2eGw2?=
 =?utf-8?B?b1JEb08xRHg4SzYvZS9DeGR4QUFMeTJsNElXYTJKUzZTUUxITkM1czlGOUtV?=
 =?utf-8?B?T1J3QW5HQmJ3VUEwQnNGaG9aYzgza0RsdlE1UkpyQWRHYi9EUVBXMnBTSWda?=
 =?utf-8?B?eG1jVnUzWmxCalFjOHl0T0RTeWdZTFA3SDhzdUM5NGZTUVdmTkttVWc0WVdN?=
 =?utf-8?B?bmVKRXVOL2x1RzhDTWdVeFhyYXRJT3NURXduNWxOM3Y0SFhFLy9hcTFVMzJp?=
 =?utf-8?B?dGJhbWkraUtWeGMvaTRzUVJiWE9RN0NoaFRsNStpcVFaL1hnWkMwSEsrdzhG?=
 =?utf-8?B?TU1sV01ZWU42d2ZkeFpXQ1JENEwwcGR5TE80dVlwUHFrTnk4Yll6UWdJVEFE?=
 =?utf-8?B?UnhVZjdEZ3RwOUF5N1FkOUt0TXM0NWRxUUJhSkZhMlVGVnMxV1FOekExY25V?=
 =?utf-8?B?elpDajZwMjZLZEZYcEdXL3BoRFF1d3RJbmkvZFpMTE9HTVNFR1ovakhQS0xZ?=
 =?utf-8?B?UWorSFNsN1kwYXRmOGNoOG1HbkpCODdNNmU5bW85bStxdHFLMmt0cFByZWMy?=
 =?utf-8?B?WmlNeFZ3MWJzUnZXZkx5WmdXK2NsZTJMQjd5c2VsQVpUV1I1OGFNSXl1aHpC?=
 =?utf-8?B?YUNGd3hSbVRuWXJUUER6aWdqYmh1Zy9ZUjhWTHBTL25tbUVRVmZuNFM5KzFq?=
 =?utf-8?B?bU5rT095d0VycWs5WGx1emVkcE45aWYxekpTdFlvSXR5VnhrbEsza2VjQUc3?=
 =?utf-8?B?Z2FJT2YzelhZRm1xTHhkemVmdmJua3FlS2lsY1Jad09KRkl2ZHJzd1ZSK3o3?=
 =?utf-8?B?WkR0b01TWXFVaHd4UUZjLy9RL25lUlNCQmM0cnhIWlhjS0s0bVJYbXBpZ0NZ?=
 =?utf-8?B?MkR6cjd4aFc5SWEvVm5ra1JhLys5UXNhRmF4TDhVWUtnUFRqSEt6OVYveE5B?=
 =?utf-8?B?UTBiU1RIUSthZ29BNlRWaDMrV0pscUh5QlROVWhtNHBQMm1Dd3g5Zk1aUlVB?=
 =?utf-8?B?RUhaOEVXdmtmMXJHMi9DT05jSmxpRzdKOEVwcXozcmZjb3lHM3duYUxMMkdw?=
 =?utf-8?B?UkRQNXpPMlgwK1VEYmJ6T2dOWDVyV0JnVHQrT1J2SkN0cVc5aGtaVThQNVBL?=
 =?utf-8?B?S3Z5S0J6Y21GRXRxSDVERUJFR2dGa1ZCeVlBaGVvNk9waWFSRXd0T2llU0Jk?=
 =?utf-8?B?VWRocHhXWjdFMEs5dk5SRnB6b0E0eEJ1ZXhubnVIb0doZzRaQkxQMEdZcG5y?=
 =?utf-8?B?Z0kvdWxxcmhUb2JtK1czRkhUK3p6Q2JrL21qZW1CakpMbDdZZ0IvYVpWeFR3?=
 =?utf-8?B?Zzl1WFhWUjhhUWhDOTRMWi95L1EvT2ZrOVBON3hWL1V6U3R4NkpHMi85ZU5m?=
 =?utf-8?B?Smg0YWZTOEFEbnY3cVFKZ3NTbzdLd21TN0MwNWowaUFyelV4NGVoeUduVG5X?=
 =?utf-8?B?dm81aWZaNnBFRGJrbjY5TEZra2FzZTl5NHRUTlBqSnc4SUtET0tGMVlvc2lv?=
 =?utf-8?B?bURMRUhDK0NrbXBFcWc3cTNta1ZTM1YwV3VYLzZhbUtCU1cvSkhuTWF0c2Zs?=
 =?utf-8?B?Q0kxVGpqTmMzUUNpTGF0QUhzcml6QTVaaktPNzBtclZOcGdTUmFCWU5DVWtw?=
 =?utf-8?B?VlBiZTdjNzRxa0R5VnV6Y1o4U3BpSzhxRWdRa043OHFoSXNYOHJGZ2NNTHp5?=
 =?utf-8?B?Smtwc3ZqM2tEZWIwSHFkZzg5S0RacHFBYVlCNVoyWEY3SktrakxVdEhPdU9z?=
 =?utf-8?B?NGVwS0Znb2ZzQkFOUUVvNXYzS3pjOVgxcXZ3b2JmYVZKNlVjeDNIUTd6THZS?=
 =?utf-8?B?TGU2ZUlTaWQwWDY5UVBoWlNGdCtvV2lyNEZQTW5Dc3liUnZRZXJzRXR4ZmJF?=
 =?utf-8?B?WlhtWVFQVzFjbUxtUldkU2YzVlEycTR3SG1heTJZalIwY21ocUtaSjhhWmZM?=
 =?utf-8?B?UWlweU1MQ1RSQWtZc29hSGhpbTk0UGM0UTdPaExTTlY1RHRreUErSitKeHd5?=
 =?utf-8?B?R1pJbTRIQ01OelhHVFc3Wnl1UDQrZVYwcmZwMVhDbnluSVRSN0hoNFBYS09E?=
 =?utf-8?Q?WT5IzNLJBo0LRLUw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 45b212b2-ac7d-4ea9-8203-08de5f998822
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 00:50:15.3692 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1BboWXfu34Dgk5sZnBkFG0nOlx1ZJ+Dx2LX31+1jBtkLPYzuyWjlBghHpMZ59XN2h3AZWhpscoWYxyVc9yaCPxb15NaqgF9YzyMZAWP4V2w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6031
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



On 1/29/2026 3:11 PM, Zhanjun Dong wrote:
> xe_gsc_proxy_remove undoes what is done in both xe_gsc_proxy_init and
> xe_gsc_proxy_start; however, if we fail between those 2 calls, it is
> possible that the HW forcewake access hasn't been initialized yet and so
> we hit errors when the cleanup code tries to write GSC register. To
> avoid that, split the cleanup in 2 functions so that the HW cleanup is
> only called if the HW setup was completed successfully.
>
> Since the HW cleanup (interrupt disabling) is now removed from
> xe_gsc_proxy_remove, the cleanup on error paths in xe_gsc_proxy_start
> must be updated to disable interrupts before returning.
>
> Fixes: ff6cd29b690b ("drm/xe: Cleanup unwind of gt initialization")
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
> v3:
> - Move xe_gsc_wait_for_worker_completion() to xe_gsc_proxy_stop() after
>    disabling interrupts, since the worker shouldn't be queued anymore
>    after interrupts are disabled.
> - Update commit message to clarify that the error handling changes in
>    xe_gsc_proxy_start() are necessary due to the cleanup refactoring,
>    not a separate fix.
>
> v2:
> - Split cleanup into two functions: xe_gsc_proxy_remove() for SW cleanup
>    and xe_gsc_proxy_stop() for HW cleanup that requires forcewake access.
> - Add error handling in xe_gsc_proxy_start to disable interrupts on
>    early error exits.
> ---
>   drivers/gpu/drm/xe/xe_gsc_proxy.c | 46 ++++++++++++++++++++-----------
>   1 file changed, 30 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.c b/drivers/gpu/drm/xe/xe_gsc_proxy.c
> index 42438b21f235..591baf98e445 100644
> --- a/drivers/gpu/drm/xe/xe_gsc_proxy.c
> +++ b/drivers/gpu/drm/xe/xe_gsc_proxy.c
> @@ -444,18 +444,6 @@ static void xe_gsc_proxy_remove(void *arg)
>   	if (!gsc->proxy.component_added)
>   		return;
>   
> -	/* disable HECI2 IRQs */
> -	scoped_guard(xe_pm_runtime, xe) {
> -		CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GSC);
> -		if (!fw_ref.domains)
> -			xe_gt_err(gt, "failed to get forcewake to disable GSC interrupts\n");
> -
> -		/* try do disable irq even if forcewake failed */
> -		gsc_proxy_irq_toggle(gsc, false);
> -	}
> -
> -	xe_gsc_wait_for_worker_completion(gsc);
> -
>   	component_del(xe->drm.dev, &xe_gsc_proxy_component_ops);
>   	gsc->proxy.component_added = false;
>   }
> @@ -502,6 +490,25 @@ int xe_gsc_proxy_init(struct xe_gsc *gsc)
>   	return devm_add_action_or_reset(xe->drm.dev, xe_gsc_proxy_remove, gsc);
>   }
>   
> +static void xe_gsc_proxy_stop(void *arg)
> +{
> +	struct xe_gsc *gsc = arg;
> +	struct xe_gt *gt = gsc_to_gt(gsc);
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	/* disable HECI2 IRQs */
> +	scoped_guard(xe_pm_runtime, xe) {
> +		CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GSC);
> +		if (!fw_ref.domains)
> +			xe_gt_err(gt, "failed to get forcewake to disable GSC interrupts\n");
> +
> +		/* try do disable irq even if forcewake failed */
> +		gsc_proxy_irq_toggle(gsc, false);
> +	}
> +
> +	xe_gsc_wait_for_worker_completion(gsc);
> +}
> +
>   /**
>    * xe_gsc_proxy_start() - start the proxy by submitting the first request
>    * @gsc: the GSC uC
> @@ -510,6 +517,8 @@ int xe_gsc_proxy_init(struct xe_gsc *gsc)
>    */
>   int xe_gsc_proxy_start(struct xe_gsc *gsc)
>   {
> +	struct xe_gt *gt = gsc_to_gt(gsc);
> +	struct xe_device *xe = gt_to_xe(gt);
>   	int err;
>   
>   	/* enable the proxy interrupt in the GSC shim layer */
> @@ -521,12 +530,17 @@ int xe_gsc_proxy_start(struct xe_gsc *gsc)
>   	 */
>   	err = xe_gsc_proxy_request_handler(gsc);
>   	if (err)
> -		return err;
> +		goto err_irq_disable;
>   
>   	if (!xe_gsc_proxy_init_done(gsc)) {
> -		xe_gt_err(gsc_to_gt(gsc), "GSC FW reports proxy init not completed\n");
> -		return -EIO;
> +		xe_gt_err(gt, "GSC FW reports proxy init not completed\n");
> +		err = -EIO;
> +		goto err_irq_disable;
>   	}
>   
> -	return 0;
> +	return devm_add_action_or_reset(xe->drm.dev, xe_gsc_proxy_stop, gsc);
> +
> +err_irq_disable:
> +	gsc_proxy_irq_toggle(gsc, false);
> +	return err;
>   }


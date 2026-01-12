Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E813C9EC77
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jan 2026 11:45:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E11E910E3AE;
	Mon, 12 Jan 2026 11:45:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h/JyGe/S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3E2210E3AE
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jan 2026 11:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768218351; x=1799754351;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0zOLMJxcw8Jua6EQR9sOku/KdvKNpKoOhoB5h5GN8Zg=;
 b=h/JyGe/Szs3QHV1Pe7dFYeDaiBE/qX4jmbCovAXhro+LvmTlGoS7apxA
 vNTw0RDF0SCEA9MyYAVSvQgtAdnhzrQVbVgSjgTtq5siw1ya902NC1kZs
 8w3p4YFBOowkwG79yE7ivzxMgdGgLccCIO4momf0gIJEmFI1k/XBAoekH
 u4yNK6Gk2ae0amQPl1wkuwa9kmhpKIESgnQbf4VOKbHecvMhlw0JIFBtf
 c6ApYbpq0h9xlqy5E0tByf+PoIUK5x89cJ9U9JKrkjdBV7hA+1FDHEJYF
 AwSSCPN0rMvdvzezudcP+SpVf8qAQyq/s7ku1rDys1eKWlaoD3UZ3aBNq w==;
X-CSE-ConnectionGUID: Ckaizn8bSrWmI+0c1xeleA==
X-CSE-MsgGUID: bBUxXqOHRg6QbwSCnqoBDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="68695505"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="68695505"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 03:45:51 -0800
X-CSE-ConnectionGUID: hbiAsn4vTHSwMERkzYcuvg==
X-CSE-MsgGUID: w0cwORM9QFacsN9hEH/ZxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="208549034"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 03:45:51 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 03:45:50 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 12 Jan 2026 03:45:50 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.61) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 03:45:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NKU5tAwPeSlqi5HgN61YzT4Q3Ph0GYNojvrEfHF77sd3t5dxY6NfvKX8i3xCerS2FLD/o97ClTey5nIyz5O+6FtmuJG363sCKZoa9LtOY1Huz/Big7s4BBjyM03yRBBLMLMHLCC4jCu1OHeIlJ70FUT67W7sPg0OJ40taDK7mvZpkTgMLnOHvbk1ILdaCtX9zUxsa0SeWvDp0MPBRVLm5s7BFT3nAR4tfyYip5d6nf3erJivVAZ73jME2Tv/svwEHFGQLOV1SYspXpBI1qpt+hnmVSK6l98I4+Yj1DG7gKaNSJKbEXMvFokoMUNXfoO360I9VaibLABdlRsUGBvl5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0S/JACN9/7rBEPcHkvNOG1O1zyN2p7ulXpBlTZp55+M=;
 b=RbTW/eOq+JxWj7kGCgyXIGj2tL0cCY7TUY48zOf2cOCYbTFdKXmCxwmhdwbibXNFLllXqXm+uAzU4ZTuwExc7sgRxcZDOP7Ym8lbt6v5i+XhnP7pPH361vzrk9cnLCmesVHt+G0dpkJx+CRtB/g2sahzqKHJJD/OOkiSBZJmOTKj+jrtofLQ2u5TfYHz/N4GJElCKauKRimROsZqBEOp6XXPfyHiYvTBiuzxyyqpqGGt1PvqTn3Nrxq9/fMU/aheCjULGdTQyoa2MhdcpoUHbn99SNXw0J0d3syjxrU+qh4npvj4i/aNrOanX1m4rPhkS9kAyAyO8kXjcpKrIiCgEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by DS0PR11MB7483.namprd11.prod.outlook.com (2603:10b6:8:147::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 11:45:42 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%4]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 11:45:42 +0000
Message-ID: <67e9d831-361b-4691-8a52-bc6d0695b7b5@intel.com>
Date: Mon, 12 Jan 2026 17:15:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] drm/xe/hwmon: Expose individual vram channel
 temperature
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <rodrigo.vivi@intel.com>
References: <20260109201644.736483-1-karthik.poosa@intel.com>
 <20260109201644.736483-5-karthik.poosa@intel.com>
 <aWJ9EK0bi7f6WNRH@black.igk.intel.com>
 <79952244-7068-4d03-b142-aa15c81e2b59@intel.com>
 <aWSsrNRG4dDjf2PY@black.igk.intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <aWSsrNRG4dDjf2PY@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0093.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::16) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|DS0PR11MB7483:EE_
X-MS-Office365-Filtering-Correlation-Id: 586c947d-d515-4e24-6351-08de51d01d62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?LzhBSWJMa2RhSEhQVkJSRmxYQWhvaVg1alRpTHg0T3JWeUExaSs1TUtNU3g0?=
 =?utf-8?B?R0Foa05USVRZelMwQmp4eGd2ejVBUmVKeG04eitMTisvYTZCNFJhRklJOERm?=
 =?utf-8?B?dEUrb3pyOHlrQTd0ZmQ0VnNWemlxMGJIb2IvME5vZ0ZRUllkY3dHY0VMRzh6?=
 =?utf-8?B?ZmIwSkR5c0IrMlZFa2FWdGdUMnZqZDI4cDF1K29aZE1xeWoyQTlLdHpucE5a?=
 =?utf-8?B?ZzZpeUpFOC9Eb21VMVcvSDQ0ckEwdnJCbzlPSmZjMlNnZi96T3E0UHBqRkw2?=
 =?utf-8?B?b2VCVVpFRGZ6V2IxNUV2ZzA3YUdORkJhR0VRUTdVTHhLcURBZ3BFMlBGeVBo?=
 =?utf-8?B?UFVGcGpiVzY2MnArcVl5STYrUlpiQ3NHckNtZFp5SkdGZ21NVFQrcHdmUDhR?=
 =?utf-8?B?WjFnT1pWSGh6Ynlqd2U1bFI0VDNBRm5yVDhHdTdPU0NXUEJqRksxZytBZGFq?=
 =?utf-8?B?NTdsL0M1UmlaV2FGbGQ5MHNnSUY4NDVpQjI5N1AxYllySmhhWm9FZG5EOUlE?=
 =?utf-8?B?cW00OTlqYUNvcTN0QUgzTnBZYzFUVEI0TFIvZ3dpK1lRckY2L0lwYzFmZUt1?=
 =?utf-8?B?QXozeWdnVEpESWxkY0N3Z2dnV1ZKeFJBeEV0VWs1RUZOc05pajJ1ZS9yRDZw?=
 =?utf-8?B?L3pEamx4T2pkTUVnVjVJeGJUL3NocnhDZnFubEVEMTdkWDMxdHZxeEo3dzc3?=
 =?utf-8?B?QzBPSll2Y0VOam9LZDdQTU5teEhIUUxLdit5ejRuNVh1M3lIYnBsZHJhZTFV?=
 =?utf-8?B?TkxEK0pwTHdJSHNrNTRpTUo5dVlWZUhjQ3dXdklZU1FiYmtZNjFYWksrTkMx?=
 =?utf-8?B?VUZzQUphRTM3cjFIdWJiNEk5WDNIUmpmRkwrRXhPZG5sQVlGOHM5S0hGUWxC?=
 =?utf-8?B?cjNzRTd0Z2gwRWdwMENmdlVWUkI0SjFjaXAwTDRYZTlZY1NZNzMrWmpHZHll?=
 =?utf-8?B?QVpqNlZIbG1JV3VRNko0eldCcXd2WjVSMzR5LzdYWnZ5UmpKQXNKVVorT1FW?=
 =?utf-8?B?VXVCdjJhTVpIdXpxek0waWNVem1BUjhQL050b0tlbjFSSmM1S29XYXp6V0o5?=
 =?utf-8?B?dkFISHdpWk95MVZoZmdiaEZOdVBkL0M3SXM1UVlHWTV6SUtPOWUzMUw5Mmkx?=
 =?utf-8?B?cmJ4YjRDN3hqeE1Yc3hMNWdVVmNpSGdtMnBSVUY2L0tJVFpXQnE1MW5XWmIv?=
 =?utf-8?B?ZTIxdVBYMXpZSkpKTHVhd2YxQzNFRW9yTzRUa0J3T2hDU1hrTjVJZHZhZDRw?=
 =?utf-8?B?S1JQeS83YzlaamJHVXpQSDVwbTRzWEZPKzNKNmRYREFIV0s4WFFCL2tML01V?=
 =?utf-8?B?aUZnQ1NzUEdYQ1ZsSWJkdVFiSjhuNjlkZjgrZExLakpNRC94aHNvRC9NemhE?=
 =?utf-8?B?cy9qdGlJMFRveDJLanViSTR1RStHbDNldVJjV1BHb3Q5WFY0WU5jeFJ4TjFk?=
 =?utf-8?B?YzdNSmlsMXJrUldMb09jNWhtVk5ZWjgyazNqTlAvTGR5Ly9zQXcrM2YreXJu?=
 =?utf-8?B?WE5CcmF0dFE2U2J3ODBGaDdxUVVQUUVpMW1KMVo0YjQxUEhuZlM4cHdwSE5J?=
 =?utf-8?B?ZlNYWTRrc0dJbEF4dlB4cHpza0p1K3dTTGRmaFE1QUNlcFpwZlBvaGQ0RmZi?=
 =?utf-8?B?TU5QNXFwY3NKbEJBR2E5SFhoQUU4YVdmQXZsTm56NHRMZ0NWK0xCTkRaY0J0?=
 =?utf-8?B?dzlSTE9CcE8yOTd6NVhXVDNaTUV1d3FXZ21JWEM1Zy9HRU0yK0xGS0Y2MlJI?=
 =?utf-8?B?VEg4RW11YWVBQjZiV05tNnc5R1lKTkNBTHlHVjdyQmdWZiszNXNPamJLZmhr?=
 =?utf-8?B?MnhVc3JLeU9nVEtIelZDOGcvcjZ4RmNXakxOdm5SUjlmUWdoV1c2OGljU0FI?=
 =?utf-8?B?VHZVZWNWanZyam0vQnlWeFVHQllSc0dZS1FLdVNFcGgzUXQrR1JkQmtmcTRx?=
 =?utf-8?Q?96ejkf+zrvrJN/qjOFhXjbPCiwuM8lsl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czh2eXYxOHVobjIxWUgrVktCZTBCSjMvc0JOYVlOMnBCOFpuTUFESmtpVWcw?=
 =?utf-8?B?cHhvYTJYMWs3elhhSEVZMnpMdkJ2MlZ4QVJLOEFqRDV1NysxcG9sQlhtNHV6?=
 =?utf-8?B?QVVRcDFFMmxGdjFZcEJSVGRXN05QN3Y3aVoyVUhvQUw3N0VkSjZPMnI3S2dh?=
 =?utf-8?B?bW9kM2hxY0VRcWt6a3kxZjRaMVZNak9YblNQUkU2S2VIaytCYWRWLzIzLzQ5?=
 =?utf-8?B?dDQ1L05QK3dBT1FJTzNmY0VNYkZxbU1zQWlERG1VWGY2UWdJRHR6OG5yajJi?=
 =?utf-8?B?RFNUY3owamIzQ1ZQU1J5dGt4VHZldi84WXhyemkyRWZsWVhFMXZFcHhrYlFu?=
 =?utf-8?B?YVlRaWtLQXNkMHYwZTdNcGl5Rnc5T1dNcUYvald1MkNFQTdIUWpDaGlmb1dI?=
 =?utf-8?B?RllNMWg5UnBmcWVrd21xY3NqcW1zcjJrbnZRZ003amxqV1MwRURYQ0JOdW8y?=
 =?utf-8?B?ODViTGdCeTd4NFpIbzVEcytYTWtrV2VOYTZwclZUUnQ2K0wwM3h4cHpmNEp1?=
 =?utf-8?B?UVI2NEhnRmp3bjQ4bk1jdXdxU0hYdldONFM5WTlDMG1MTlFaSTVWSHR6c0Rl?=
 =?utf-8?B?dnVURlcyYlB5UDVZVmxXT216TGg5ZGpSTktoS013eTZ2djVVRUFIZDN4SjFR?=
 =?utf-8?B?M0ZaaW11WTdqSmJ4dmxmazU2Sk83d2VEdWJpY0I0OW0xZ2ZuUlcydTdiK0lF?=
 =?utf-8?B?Y0diUWYvZ1JNdjdZQmNHcktjcHFQM0NtUk9VaEt4ZUI5MWdUUkhOM0g0NXZW?=
 =?utf-8?B?QUxsL3k1cEJzVXZ4NWwvNXFwLzFCUmQ4UVRMc1FFY1lrL2RLUStNWHFCbHo3?=
 =?utf-8?B?bTMvakxWTWMzOVc2VE1TcXQ3aXMwcVFwT3IvU3N5N04wdHlzR0QwMWlBTS9w?=
 =?utf-8?B?VUlJT2t4U1Nybk1ldEJvUS9UYVh4Y0Z4M21lYUlrNVZrM1docXdYUFIxeHE5?=
 =?utf-8?B?cTl3WFpBNVBqT25yMyt2WE05Z2g3d3pXRWM1VzVUSFhaejExaXprODhsbncy?=
 =?utf-8?B?dHJCSTZmSDFoK2N2bXRWQm5uVEsyL0V4UUJNSWRxeUxoWGlZUnNrYlJoWEhl?=
 =?utf-8?B?Ni8weGFTQ0ViYm80Sy9VZ3ViSVFPUDk1djhmVkZDaW1Wd1kvR3JFRU5UV0Ri?=
 =?utf-8?B?V0N1WHNGdFJxeGJaSGlWN1l0dHhHK0QwU2tsTGhKd0xacUVCeVBZejFpNmlI?=
 =?utf-8?B?VlVVU0xqS1dLVzV2UGhobXYyM1NmM1hLUFo0azMrZW5SalRjOHZGRTdLeHBy?=
 =?utf-8?B?UkVrbUFTV3BUdUQxTk1CVStheEQvVm1WY1doTGhETm1xblgyUTRvUFdhald0?=
 =?utf-8?B?akZuaCtWckI4cmVEZFAxY0ZZKzdMbmRTWmMxbGtxRXpNaHVXeHMwakVEdnYv?=
 =?utf-8?B?R3dXaWxLWWJsT0RRMW1SN3locGlNRFFPK3JyRldYQnpYd1U4VVNDaVFHTlQ0?=
 =?utf-8?B?U2oxZ0tWaHNjakEvNUxUUlNkN1FIc0JuSnVnK29aZHRLOHRJQzY3Vy9iK1Fx?=
 =?utf-8?B?eUpQTzd6MVNZZ3J3cDhoQVNyMkZBalBsSDFvdFJ3NGluRFBCSHlUOGdLUXd0?=
 =?utf-8?B?VmdqaXhrU282WFQyZU1DMHV2amlLUFJRVXBqMm1sUjIxcFJwa1lpNU4rNkYz?=
 =?utf-8?B?OHZSN09rQm9HMmd6Vk5GbHVQTCsvWkVMWXFlempRV0l3S2tmcUFyd2lSZmQr?=
 =?utf-8?B?NjBGZ2VxWlpFckVWWWcxY2VOMVB0WFZTbzgyeWJYUk1IeDNQVTlua3dMVm1B?=
 =?utf-8?B?a0dnR1I5WkY2N1RISzVvd1ZyVitZdGpFSUJYeGQ3MXNXeXlIV2Z5OXZvTVV3?=
 =?utf-8?B?VWE0WHZZT0xZbVN1czdiNXZnODgvY2J1bVh4MmpjOXVzUUs3cCs4NlJFVTRF?=
 =?utf-8?B?T1JtYVQ5NUhZaHVIMzVUR3YydHBjTk5heW0zOFNod0U3K1llMkk5MVRmLzZV?=
 =?utf-8?B?VktZa1FiQVdVcFRZd0J3OUVXaVVmWmxUUjRnTFY0UjdvQllQQ3prbmlwa1VZ?=
 =?utf-8?B?QVAyYXpxa3duc0c0NURmOUVGbGtpblc1MmdOcklSMUkyVWsxMXFCcTh5UTdS?=
 =?utf-8?B?ZGVRYWV4V3ZjMXUvSXFDbjJMQXZtbmtUTVVOTFRONWdPWU1Rd1J6VmI4UHpn?=
 =?utf-8?B?Rkd5WHBLaElhZk1PbkRJQm4rYlVEbWtPc08rVTVjelVMdzdsZ3BSWjA5MG5h?=
 =?utf-8?B?dWR1S2laRXpwMVdJSFhmTnZUc2tISmVac09VTmxDQ2ErUHIzeXVHN3VEc0h0?=
 =?utf-8?B?NUcvUkhmVVh1UGtVaVdCdVVFZG9YZlArM1VDUTg4RzVnTkpxQXRRTUc3dko4?=
 =?utf-8?B?b005a0diYXBwTmJTQytxanNMb3lIM0p3SFBqVlMzQi82Q2hCRjE5Zz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 586c947d-d515-4e24-6351-08de51d01d62
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 11:45:42.4934 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mLcMWyXyt8k3yDrA7xPDygS0dNzaLSjZThUnrh95eXGAKQFYpi7w3XEylRE2iqgtXlO6305MoSo5g0Lux3iJrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7483
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


On 12-01-2026 13:41, Raag Jadav wrote:
> On Sun, Jan 11, 2026 at 12:52:39AM +0530, Poosa, Karthik wrote:
>> On 10-01-2026 21:53, Raag Jadav wrote:
>>> On Sat, Jan 10, 2026 at 01:46:44AM +0530, Karthik Poosa wrote:
> ...
>
>>>> +static inline bool is_vram_ch_available(struct xe_hwmon *hwmon, int channel)
>>>> +{
>>>> +	struct xe_reg vram_ch_temp;
>>>> +	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>>>> +
>>>> +	vram_ch_temp = xe_hwmon_get_reg(hwmon, REG_TEMP, channel);
>>>> +	if (xe_reg_is_valid(vram_ch_temp) && xe_mmio_read32(mmio, vram_ch_temp)) {
>>>> +		/* Create label only for available vram channel */
>>>> +		sprintf(hwmon->temp.vram_label[channel - CHANNEL_VRAM_N], "vram_ch_%d",
>>>> +			(channel - CHANNEL_VRAM_N));
>>>> +		return 1;
>>>> +	}
>>>> +	return 0;
>>>> +}
>>> I'd write this as
>>>
>>> static inline bool is_vram_ch_available(struct xe_hwmon *hwmon, int channel)
>>> {
>>>           struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>>>           int vram_id = channel - CHANNEL_VRAM_N;
>>>           struct xe_reg vram_reg;
>>>
>>>           vram_reg = xe_hwmon_get_reg(hwmon, REG_TEMP, channel);i!
>>>           if (!xe_reg_is_valid(vram_reg) || !xe_mmio_read32(mmio, vram_reg))
>>>                   return false;
>>>
>>>           /* Create label only for available vram channel */
>>>           sprintf(hwmon->temp.vram_label[vram_id], "vram_ch_%d", vram_id);
>>>           return true;
>>> }
>> I'll agree with vram_id and boolean values, for readability,
>> other than that I would like to stick to current implementation.
> The usual practice is early return negative cases, but upto you.
okay we can do that in next revision
>
> Also, just curious: Do we need the 'ch' string here? We already know
> it's channel, right?
yes to differentiate between existing channel "vram", I've appended with 
_ch_X
>>>>    static umode_t
>>>>    xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>>>>    {
>>>> @@ -903,6 +944,8 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>>>>    		case CHANNEL_MCTRL:
>>>>    		case CHANNEL_PCIE:
>>>>    			return hwmon->temp.count ? 0444 : 0;
>>>> +		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
>>>> +			return is_vram_ch_available(hwmon, channel) ? 0444 : 0;
>>> Shouldn't we also check hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN]?
>> that can be secondary check, then this would apply to all channels !
> For the channels that return data from the mailbox, we'd want to make sure
> the data source is also working. Else we'll have dummy attributes exposing
> no useful data.
okay, I shall add this in next revision
>
>>>>    		default:
>>>>    			return 0;
>>>>    		}
>>>> @@ -915,6 +958,8 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>>>>    		case CHANNEL_MCTRL:
>>>>    		case CHANNEL_PCIE:
>>>>    			return hwmon->temp.count ? 0444 : 0;
>>>> +		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
>>>> +			return is_vram_ch_available(hwmon, channel) ? 0444 : 0;
>>> Ditto, hwmon->temp.limit[TEMP_LIMIT_MEM_CRIT]?
>>>
>>>>    		default:
>>>>    			return 0;
>>>>    		}
>>>> @@ -935,6 +980,8 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>>>>    		case CHANNEL_MCTRL:
>>>>    		case CHANNEL_PCIE:
>>>>    			return hwmon->temp.count ? 0444 : 0;
>>>> +		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
>>>> +			return is_vram_ch_available(hwmon, channel) ? 0444 : 0;
>>>>    		default:
>>>>    			return 0;
>>>>    		}
>>>> @@ -963,6 +1010,16 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>>>>    			return get_mc_temp(hwmon, val);
>>>>    		case CHANNEL_PCIE:
>>>>    			return get_pcie_temp(hwmon, val);
>>>> +		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
>>>> +			reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_TEMP, channel));
>>>> +			/*
>>>> +			 * This temperature format is bit 31 for sign, bits [30:8] for whole number
>>>> +			 * and bits [7:0] for fraction
>>> Nit: "Temperature format is 24 bits [31:8] signed integer and
>>> 8 bits [7:0] fraction."
>>>
>>>> +			 */
>>>> +			*val = (s32)(REG_FIELD_GET(TEMP_MASK_VRAM_N, reg_val)) */
>>>> +				(REG_FIELD_GET(TEMP_SIGN_MASK, reg_val) ? -1 : 1) *
>>> Since you're already casting it, I'm wondering if you need to check
>>> for sign?
>> |REG_FIELD_GET() returns unsigned type, which gets stored |the lower 24 bits
>> of an |s32|, discarding the sign bit; consequently, negative values are
>> interpreted as positive, requiring an explicit sign check.
> Would something like this work?
>
> 	s32 vram_n = (reg_val & TEMP_SIGN_MASK) | REG_FIELD_GET(TEMP_MASK_VRAM_N, reg_val);
this is okay
>
> 	*val = vram_n * MILLIDEGREE_PER_DEGREE;

but this wont work as it will treat value as unsigned and we'll need to 
again check the sign check here.

existing one does these all in a single statement.

> 	return 0;
>
>>>> +				 MILLIDEGREE_PER_DEGREE;
>>>> +			return 0;
>>>>    		default:
>>>>    			return -EOPNOTSUPP;
>>>>    		}
>>>> @@ -974,6 +1031,7 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>>>>    			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
>>>>    			return 0;
>>>>    		case CHANNEL_VRAM:
>>>> +		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
>>>>    			*val = hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
>>>>    			return 0;
>>>>    		default:
>>>> @@ -987,6 +1045,7 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>>>>    			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_CRIT] * MILLIDEGREE_PER_DEGREE;
>>>>    			return 0;
>>>>    		case CHANNEL_VRAM:
>>>> +		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
>>>>    			*val = hwmon->temp.limit[TEMP_LIMIT_MEM_CRIT] * MILLIDEGREE_PER_DEGREE;
>>>>    			return 0;
>>>>    		default:
>>>> @@ -1356,16 +1415,20 @@ static int xe_hwmon_read_label(struct device *dev,
>>>>    			       enum hwmon_sensor_types type,
>>>>    			       u32 attr, int channel, const char **str)
>>>>    {
>>>> +	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
>>>> +
>>>>    	switch (type) {
>>>>    	case hwmon_temp:
>>>>    		if (channel == CHANNEL_PKG)
>>>>    			*str = "pkg";
>>>>    		else if (channel == CHANNEL_VRAM)
>>>> -			*str = "vram";
>>>> +			*str = "vram_avg";
>>> If you look at the readings this is actually not average, so it's a bit
>>> misleading.
>> what is your suggestion for that label here ?
> Since this is a stable ABI, let's first make sure that we can actually
> change output string. If we can, then something like vram_high or
> vram_peak would be more appropriate.
>
> Note: This is different from _max attribute which signifies the limit.
>
> Raag

1. Actually, this label change can be a separate patch.

2. We are modifying label here, ABI still remains same, so this should 
be okay

vram_peak seems apt, as it the current max value of all vrams

Rodrigo, can you also share your comments on this ?

>
>>>>    		else if (channel == CHANNEL_MCTRL)
>>>>    			*str = "mctrl";
>>>>    		else if (channel == CHANNEL_PCIE)
>>>>    			*str = "pcie";
>>>> +		else if (channel >= CHANNEL_VRAM_N && channel <= CHANNEL_VRAM_N_MAX)
>>>> +			*str = hwmon->temp.vram_label[channel - CHANNEL_VRAM_N];
>>>>    		return 0;
>>>>    	case hwmon_power:
>>>>    	case hwmon_energy:
>>>> -- 
>>>> 2.25.1
>>>>

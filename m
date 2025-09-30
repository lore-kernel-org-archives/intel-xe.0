Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B748CAC5B9
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 02:07:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F37C910E03E;
	Tue, 30 Sep 2025 02:07:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g1Url79Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD24810E03E
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 02:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759198022; x=1790734022;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=kb1bJpyGd2yzvjQmehjTaEMooKIbJDt0022sM1bOUSI=;
 b=g1Url79Qj1gkkLiL63W/lggU4u1vujWB2L+4vX6UCLwQF5s5CDuvtOiO
 MTkJGX3ldDT2L6Gpa7FGOzE+LPbzLlQscZ0fBV0/PG4r2F6ndNIsPb37Q
 2GwDzYASVtxrCufS/L0xz3qtEjOqb0Rk7ng7JzZEGccpqHmi3n6oO4srW
 C0YaJisOmcAY/HcmK1TU4fVf7H+BbUpzxdfa7iJF32C8IGKh9zADjrF8K
 iPY35wGLPOavvMdFZ5Wf41oI0P8Vjr7XtGe0sbzmclVzRXtaatQzTNmUF
 K2OLssQXzQr5LzNXp3sGa6UT+q/n8YdhvG9LtRs+HX/sNRf6qKmqEFsvs g==;
X-CSE-ConnectionGUID: 1n3vvHogSeKwqLOyv360fg==
X-CSE-MsgGUID: 6dzJ6xw7SpiSRQlLOelJnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="72063746"
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; d="scan'208,217";a="72063746"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 19:07:01 -0700
X-CSE-ConnectionGUID: ncyN+x9oSkmRFp4lNrQizQ==
X-CSE-MsgGUID: t8UIgpgDRC6jIj0vriKvPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; 
 d="scan'208,217";a="178346184"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 19:07:01 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 19:07:00 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 19:07:00 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.70) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 19:07:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cYMtTJPeN98v5r7cx0vKr0Ilpq0CYzfDE0zJvnxYzyjPpK4B4X9Tk3UGlFiqx/HK+DW4tHEIlv9VoyLD20uB4Yf2JaulkYO10RVHvMfPIKYxJ0G3a10sn2X1GXCS6AyMcbOepNykB0hqo0q4TzWoys50jWX5SBoCHUkaQ2kTK9giPvfM6FnbrKzMdV7h0G0JDn4p5IwJE7vJ8nW2XQ+gzonl5QDCPD9ipwRAVMtjBgt5q7eWoZRWcF11QFcqS2U6ROLgA5H947y1J6M8aDAojn0QCMcoM0ov9908rFwiIMZ/piTeuki15xKzU4lOQz2TyJG94fy84LnPBPaN7JU/ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9gaHyo1aHP3bT0Ds8xgzauoL6o/CsjmZ46fFRSt8mGY=;
 b=DU+hDf2eyrQWBx2GPzH1vrHV5uamWe+Skz6wwamLhpj7L8nYeOcOaQpoMDcSG39dxMkW6zqyzuDW0so/MQo6OcereHMLaQNm6JtkzswJ4lBlM71wsgc37dSBa6/9qb+a7S5eGngAdLrvSl/vjWmcqlhuBI45QemddGkEk5j5iDHY0DEpSJ7Fzg1qGu2mU8dSc415Fil1Wq4BxvSE1Rt+G2K8cliPXhggVpblE/r6Tf+ad71ERxhlfIT5QzNnB5j9HE4pf/Pfr6nhEMTGWgERyxq56xQvdKz8+tpN7rRf7187/8rnYHQtMo+H5bKvExFwrnAcAgMAFBATGkDc3mogEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by SA0PR11MB4606.namprd11.prod.outlook.com (2603:10b6:806:71::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 02:06:58 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9137.018; Tue, 30 Sep 2025
 02:06:58 +0000
Content-Type: multipart/alternative;
 boundary="------------3bTSZ67hpNZIUii20993CqSR"
Message-ID: <c16cf470-a725-4d21-9c54-b8a0686a3d99@intel.com>
Date: Tue, 30 Sep 2025 04:06:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/36] drm/xe: Add NULL checks to scratch LRC allocation
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250929025542.1486303-1-matthew.brost@intel.com>
 <20250929025542.1486303-2-matthew.brost@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20250929025542.1486303-2-matthew.brost@intel.com>
X-ClientProxiedBy: WA1P291CA0017.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::17) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|SA0PR11MB4606:EE_
X-MS-Office365-Filtering-Correlation-Id: 85c6a61e-3594-4bc7-2adc-08ddffc6092e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZlhJWUozTjJWcS9scjdwOS9SN2JWc0w2WkFwV3BDUXlDRldYSlBJUFQzNWt5?=
 =?utf-8?B?UVB2dk45alJ6UlRvV1ZPd2JObzBBUWxkOVhZdTErOFR2OGpURTQvbm1LdWo3?=
 =?utf-8?B?UEowYkkxL2xCODloRGNLT1NaN1hneStFU3VPc0Z3MVVia3BXaklKdHNpekZI?=
 =?utf-8?B?T01jMFRkWmszWWltOSt0ZjFpWE9FUUhvR21ZQmp4c1JVSzRsRE1TN3p4SWMr?=
 =?utf-8?B?TllWRHJ4aFlVWmtjTm12YWxnVjVlckZaZmJnYThETWorMFp0RlRXVStoRW1w?=
 =?utf-8?B?VXVBa2NTbjllWlRCMWNRSjhBdkdPM1ZEbm5YWUJDUThBbmZSOHVWUEVPakNv?=
 =?utf-8?B?WWQ0bWlHVFRKVkxpeUdlRC9HaDBQaXJSNW93N284UmhJNzRXWU1aelVJS0ds?=
 =?utf-8?B?dXJERDJWSmRvMUZvTHl4K2t6MnBQUlhGUnZycjFDZkdMRmduRXAveTVqa3lz?=
 =?utf-8?B?MzN3RHRFRFpmYjQrNWlkVkM5VmFMbSszVUYxT1lKdXJmbXkyV3RHc0VKVk5U?=
 =?utf-8?B?K3ZIYXVRYVI2eFdWbjFiK2lpM25iaGYrWE5lNGJLTTcxUy9UaDZNaTlocWtj?=
 =?utf-8?B?cENJK3ZDL0hqWWM1dmRIYy9hWld4WVNPOHd6RW9LcVlkNmNoTWFXODV2ZmtU?=
 =?utf-8?B?VGRqWUJ6dng0TzBoR0poNDNiRVk2NEoyN2Jlcjc1dVpQTTdhOFo3VURNbGFx?=
 =?utf-8?B?SlZlNkNIc1ByeG5vbnZ2Uy9wYlNYSkNnWGFOQW96anFKWlFWbC9xUktEdWd3?=
 =?utf-8?B?M2VUTzhRM0J6azBMSjBMN1kyZ3NZM1BSL25HWHJnWXk4S2hNbGJoU29vMmdo?=
 =?utf-8?B?SE9xaDg5KytmMVJRVURwcndrSDh5UTdoUHdrcWdxdnBsdGI1QkJMY3VDOVgx?=
 =?utf-8?B?Nno0cys0T296ODloV1dSdWw3Q0Racm9FaE5LazhNMktFL3U2YkRnZmxkQXF1?=
 =?utf-8?B?RVNORHZzQUhWL1AraHpOSVFOYjlZd3dha01WL2plUkpZbGxocThzRDNZQUp0?=
 =?utf-8?B?c2U5VlNSd1lmN3NGeGN4di8rL3lZZnVWL1k1MjBHUTB2ZmhiditZb1doQWN3?=
 =?utf-8?B?MitDUkZMS29iSUh2UHd1YjJrZU9xTU1XbzBiM1BraUV1bnVydXlmc3lLMGpx?=
 =?utf-8?B?OHRwdDB5bHc0dE9IdWN5RENzZXJlSnZpU1gyemtVcURvRzdLQ2RKRUFvWklB?=
 =?utf-8?B?dk84dzJFckQzL1FSNzVvdlBvbU9mdzhOcTdTc1hoL3lKWnVxOXg1bmxwVzBa?=
 =?utf-8?B?YXVRNUt5UXUydEtkRTRTY1NhdlJURWwrcGw3b3VoNjkwdnE1NWROOUlRaVpO?=
 =?utf-8?B?S2hQcmN2eHFlQzFmZ3VKSEdmOGZrT09FK1dRNklVWUYxeG1rTmxuV1FOZGJO?=
 =?utf-8?B?dDZrTUZ4R2xZeElOMStvQm1LTkVPUFNJTWZpMnhEL1FxdmtKRXVhZ0dxOGJR?=
 =?utf-8?B?bmp5Y0FXdG4wTUNlNjNMTVRTZFJXZHlvd1lJeWo3RjhPb3Z3SmdZMUxBY1Uz?=
 =?utf-8?B?T3c0NEhuRGhMVXdvTHNXZ0pPWHJKamhNQUJ3UkRMMHNQekRSQmMxNXJld2kx?=
 =?utf-8?B?RHhCYlArenNPNTJCWjRIcmNkN2VaaWlYTEFIUmhCNnphM05qSkN1VmtJTkxV?=
 =?utf-8?B?S3MvN3RrbFRsanF0c1JaZ0RaSDNOdHhWQkJ1cTJVTURadzZHNnpHOEJsR1pk?=
 =?utf-8?B?ZituVTVTK0hHdW9oUHlENHBMRXIxV0FmM0YyVjRmMXhJeTYyaWdaRFFGODJo?=
 =?utf-8?B?VUdVT0dsVjkwbTVIKy96U3FjdkRtL2YrNlpMcEQxcW9hTWtmN2pHaDJKeURx?=
 =?utf-8?B?TFA2OXUySGFxRVpsNTVCbG9sL2lLZ05kTnpzTjFYWk1iUGZ5SEgxa1BEaTBO?=
 =?utf-8?B?MWx3ZXJhcHVwZWhLblY4Z0VnMlZNbUt3aG5FNXVpb1Q5dVQ3SjFyZHNPWUpB?=
 =?utf-8?Q?eVERi8q8Vb81XgiDd/uoia02Io3msKIP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDB1UW5VQktRam40Nmc2Wnh3OWtOTkxvTmRUejk1RUF6UUpKeFRMRUozN0J5?=
 =?utf-8?B?bEtMTlNjSEJTU0xRaTlRbk9xOExPOThhelZiR3oyV3JKbzZjYWI0STNnU0RV?=
 =?utf-8?B?dk4wTXVVRS9TVnVZb1o3TXgzaFJiZjZ3b1pCT1ZLZ2Jyc3hma0E0TjJ2UjZz?=
 =?utf-8?B?TlVBRmljWFBYNDVJN0pFd2hrM1ZpVFZIYUtRc05vSGdqYUJ5cG5xVFRaOXly?=
 =?utf-8?B?OFBvUloyYjRkUFpDTlRpc0pXRy9rZTBsR3B5enBjZFJtQWtxWjhoQVFsTElw?=
 =?utf-8?B?dDZlY2NhYzlUa3puVFdZN05lemVJQzNKaE9ZK0ZPUEc5eCtIQW93THRTVVk3?=
 =?utf-8?B?ZElnNE9DZ2VqSktCMnJqWkZoMGZJRllnM050M3prbyt2TEk4c2gzUDBNSXQw?=
 =?utf-8?B?T20wR29nU2doOUxtRkJyUWRGQkVPRnh5bW1DRWpNVXhORUYvWE84Tkl6TGtN?=
 =?utf-8?B?d1UzNklPRGVFdmRpZk9kb2JMcS9UVmovTzV5YjdnbGxnbEV2ejdIT1JPdTJq?=
 =?utf-8?B?SnQrWXE0akdOUDkxenV4NW9HMStwZHBVUktVUVRaVGVObjZkaFIvdzE5MEE1?=
 =?utf-8?B?enhCc3NxcGdrdEo4R1p6T3pnQ0NJMEl4a1ozVzJhbWtLc0UvWjI0blhKL0RB?=
 =?utf-8?B?RGMyNEY4ZUsweHhGdGtaRjMyc0IrTHRESnRjbXl1Tm55WXVVZWo5b3IxL1VI?=
 =?utf-8?B?TEZoUjFaVGovQkhGSUtkTzZlbWRTdi9ucVNtTWJxUm56dEEvSDlRZjE4Y0Ew?=
 =?utf-8?B?MTcrTVpaZTVyVDVtYWV1dVNGaE9kUENydzZDMVMrV0x1T0poV3Y5TlR4Snh5?=
 =?utf-8?B?VjI1YVZsNE0wUlExTnlLa0dPM3RKZTZVRzU4RVNob0QwVTZXL3FFYUVQd3B6?=
 =?utf-8?B?b1QxeW1ZZE10M0JZMUFXUFhkdmlNRXRET08yb3pKamVGYml5aHhOdEwwdDMv?=
 =?utf-8?B?TE9FTjB1ekczU29IbkVEMFcwQUs5dHpUNGtwOHNWMEtuM0gzbHJXM1ZXMmE4?=
 =?utf-8?B?ZWExcWlsU2MwTVluNFlUM3gzUUM4TXlnbGFoK2hndHJuYnVVdnZWbnR2d0N6?=
 =?utf-8?B?clB1aUZlNkFPbi9YeTcwOFhBMHZYdzl4dXZsa0o0dWhjZWRkZW1xOWpCSytH?=
 =?utf-8?B?MzQyTkV4S1RJT05mQ2c3QmNMYWdGTUQ1VUNLaFE0MHNLQkY5RHpKWk5TbkhF?=
 =?utf-8?B?Qld6V0NjcytEVWpkRU1abVkyNXNoYW9ya3VnT3pYSWFYVk13dElMbXczRFBa?=
 =?utf-8?B?YjA3czJOdkR2TzBydlNlQUdsVWRuelhJclhEcXdPcm1MWkJyN2tjL0xCZmpE?=
 =?utf-8?B?dnVBTGowUklLa3ozVmN4Z2hUSlM3aDdSQkdENFBTRE4vd1JKT3lPMkQ3dUNs?=
 =?utf-8?B?ZWkxS0dqamlIckZRN3B3blJ4N3RyaFVUb0Q1ejdDcXFqVnpMWlUwdHpUNHc5?=
 =?utf-8?B?amdEM3NCMW1VTVZ0cFZZdFlEVjRqNk93b0toc1FrSjZ1WnN0bHk2ck5UK2p4?=
 =?utf-8?B?UUpiUlQ5dnBKTlM1eEg1bFZCNDJXMVBoUDdMQXZmb1BwWThVaGc2N1lHMDZy?=
 =?utf-8?B?cGVOR3N2UHQ0bWdxOGw5eVFPVHUrK3RVNlVLeWpXTk40dG45aHVTMGFUaG8y?=
 =?utf-8?B?VXVtSnZnSnE5RG9JWmFETjBMMEI3T0Z3VDRCWEdyVXh4Ly9jZWVLVUk1WUZZ?=
 =?utf-8?B?cG9CTWZUZi9kZkkwOFZnNkQzVEpJUlZsbFFEOEUwc3NRN1BUQVFocjZta1Rq?=
 =?utf-8?B?dG43UHNscFU0bFJuOVZ4SExBeUJyU3VibjlpblVhcUNjMVRkdFlrNWJEQXhr?=
 =?utf-8?B?VzNaM3ZNZnVOVlRmNTg3YUl2SVdJUWM1anRQOUJCK2lFbHZtNXhSVUI5K3hl?=
 =?utf-8?B?R0Q0Mnk5UTl0SDVmSkxGb212Vk92MGtKa1JvTHFUMFA0WmtzaFFjam9Nd3NF?=
 =?utf-8?B?L01oZExwRDMwMG54SUdXLzFCSkJ0TTlSdlFtVTFWVWlxcWRrbUN6YnQyWlBs?=
 =?utf-8?B?Uy9zRFM4RnBoNUcyOEx6MzdqdytjTkxSWkJxaHBZTWFKbjFySkk5VjIydndH?=
 =?utf-8?B?bDFUMmlndi9ybG42ZUFxYjgxWU9yc3NaVDNPdGtLLzd0SmFTV2l3dUpUUkt5?=
 =?utf-8?Q?gpc67HeEJdZx36FFL5qN3enEl?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 85c6a61e-3594-4bc7-2adc-08ddffc6092e
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 02:06:58.1347 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mGZQVD185wZWwdL0wYDwDCf8vFJl/7gInTu6BHGblw5nGIXJyKTyjBrbl6Pz/qTt65tFun28FCh2YheyU8n2mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4606
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

--------------3bTSZ67hpNZIUii20993CqSR
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 9/29/2025 4:55 AM, Matthew Brost wrote:
> kmalloc can fail, the returned value must have a NULL check.
>
> Fixes: 168b5867318b ("drm/xe/vf: Refresh utilization buffer during migration recovery")
> Signed-off-by: Matthew Brost<matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_lrc.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 47e9df775072..e1bc102a6cae 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1303,8 +1303,11 @@ static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
>   	u32 *buf = NULL;
>   	int ret;
>   
> -	if (lrc->bo->vmap.is_iomem)
> +	if (lrc->bo->vmap.is_iomem) {
>   		buf = kmalloc(LRC_WA_BB_SIZE, GFP_KERNEL);
> +		if (!buf)
> +			return -ENOMEM;
> +	}
>   
>   	ret = xe_lrc_setup_wa_bb_with_scratch(lrc, hwe, buf);

xe_lrc_setup_wa_bb_with_scratch()->setup_bo() handles the ENOMEM return, there was no bug.

>   
> @@ -1347,8 +1350,11 @@ setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
>   	if (xe_gt_WARN_ON(lrc->gt, !state.funcs))
>   		return 0;
>   
> -	if (lrc->bo->vmap.is_iomem)
> +	if (lrc->bo->vmap.is_iomem) {
>   		state.buffer = kmalloc(state.max_size, GFP_KERNEL);
> +		if (!state.buffer)
> +			return -ENOMEM;
> +	}
>   
>   	ret = setup_bo(&state);

setup_bo() does another check with ENOMEM return, no bug here as well. 
Also, with how setup_bo() exits, it ignores lack of allocation in case 
it won't be used anyway. -Tomasz

>   	if (ret) {
--------------3bTSZ67hpNZIUii20993CqSR
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/29/2025 4:55 AM, Matthew Brost
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250929025542.1486303-2-matthew.brost@intel.com">
      <pre wrap="" class="moz-quote-pre">kmalloc can fail, the returned value must have a NULL check.

Fixes: 168b5867318b (&quot;drm/xe/vf: Refresh utilization buffer during migration recovery&quot;)
Signed-off-by: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_lrc.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 47e9df775072..e1bc102a6cae 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1303,8 +1303,11 @@ static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 	u32 *buf = NULL;
 	int ret;
 
-	if (lrc-&gt;bo-&gt;vmap.is_iomem)
+	if (lrc-&gt;bo-&gt;vmap.is_iomem) {
 		buf = kmalloc(LRC_WA_BB_SIZE, GFP_KERNEL);
+		if (!buf)
+			return -ENOMEM;
+	}
 
 	ret = xe_lrc_setup_wa_bb_with_scratch(lrc, hwe, buf);</pre>
    </blockquote>
    <pre wrap="" class="moz-quote-pre">xe_lrc_setup_wa_bb_with_scratch<span style="white-space: normal">()-&gt;setup_bo() handles the ENOMEM return, there was no bug.</span></pre>
    <blockquote type="cite" cite="mid:20250929025542.1486303-2-matthew.brost@intel.com">
      <pre wrap="" class="moz-quote-pre">
 
@@ -1347,8 +1350,11 @@ setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 	if (xe_gt_WARN_ON(lrc-&gt;gt, !state.funcs))
 		return 0;
 
-	if (lrc-&gt;bo-&gt;vmap.is_iomem)
+	if (lrc-&gt;bo-&gt;vmap.is_iomem) {
 		state.buffer = kmalloc(state.max_size, GFP_KERNEL);
+		if (!state.buffer)
+			return -ENOMEM;
+	}
 
 	ret = setup_bo(&amp;state);</pre>
    </blockquote>
    <br>
    <pre wrap="" class="moz-quote-pre"><span style="white-space: normal">setup_bo() does another check with ENOMEM return, no bug here as well.
Also, with how setup_bo() exits, it ignores lack of allocation in case it won't be used anyway.

-Tomasz

</span></pre>
    <blockquote type="cite" cite="mid:20250929025542.1486303-2-matthew.brost@intel.com">
      <pre wrap="" class="moz-quote-pre"></pre>
    </blockquote>
    <blockquote type="cite" cite="mid:20250929025542.1486303-2-matthew.brost@intel.com">
      <pre wrap="" class="moz-quote-pre">
 	if (ret) {
</pre>
    </blockquote>
  </body>
</html>

--------------3bTSZ67hpNZIUii20993CqSR--

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 339FFCCA470
	for <intel-xe@archiver.kernel.org>; Wed,  1 Oct 2025 21:51:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C736D10E167;
	Wed,  1 Oct 2025 21:51:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EJIxU2Xk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6382A10E167
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Oct 2025 21:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759355490; x=1790891490;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=Ks5gJGr3Vq0vjQ71yjR8HneuRYwDWrtcvT7XkSvCArw=;
 b=EJIxU2XkIBQkgXX1/SzPjF4z7rnk8eXXn5a96yOSXtBQIWS5JSMYi5is
 L3tgM7CsX87OHRX1FEMgOuYrGym2XKQcDnQpVbdrBH2H+76yeYehUKddo
 qU6aUNux+lbMhYLBhe0ZpMTLAdOKae7QAIZemxdhYe8RPcW1MFh9tOuBc
 MRYtRbaDIl0gJJEB0zY6Nhn5z5VoZnlcn7k/RTFJavDcIVOVUoEOUjFem
 X1wZ1BCRezVfHA5EQFAWI24/tNLd+S8FqJbwcPpKNJuqTXvLPUiGZKcxB
 Ekg/5YK1ZXVvFXLNo7o4mxmcy0F/BTmkAQWz4nk5tRrrKmdEwMEufiauD Q==;
X-CSE-ConnectionGUID: YWUgYtU3SNO3nA4HTZxsLw==
X-CSE-MsgGUID: p4t2rv7XSaWKvGmX4No2IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="64258705"
X-IronPort-AV: E=Sophos;i="6.18,307,1751266800"; d="scan'208";a="64258705"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 14:51:29 -0700
X-CSE-ConnectionGUID: 3oz4dsadQwGh9w/1aTDN1Q==
X-CSE-MsgGUID: T67hjWEQQkGCO26NGlbrFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,307,1751266800"; d="scan'208";a="178502755"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 14:51:29 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 14:51:28 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 1 Oct 2025 14:51:28 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.70) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 14:51:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YINF852sPEe8v0WK1FfQZ0InLjfpsMxD9/rjQCl1nLVUPT8i0JbUYlWo90nERGkBpByymQgVG5nCBFJ7F9vob9n+6w3G+NtIf4A9WK0RfaGXqrL++RVXTp52A6XRLjhkHSPfZJJlPjT77JjJ6IcIN8ttndoVwJdUAZU+dpsx8yOjgXwflkNd1EJ3quhW7X4OXghM2aILHcG+eJmv7N0UI4tn/ttLOpb5ftTpGJGrnZK3V5rkV4dmb+F1N9fVTR2MrO3goeVvUBmYkOkz2Jz7/h32Y8lHAM98aFnhvisXHyVieybzLO/MtAA8X6ZqzPIbA9W+H6M/3P+44pFY7RSQkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HkLrd76vIPBLTZaaLkETr6smxN1DFOSH/gEBm5eOR+8=;
 b=myHvqkq5bI9PJuXcs4O3NDwz/q48nCdv/kIWHT2aFZqxHr1yJNsoWPPqEFjZSybdfjgxlNxkPKgCuXD83Y3T3qjJKx+AYZFZpuZbcBzk6+xFitm/iXgpdUFn6XdauxeZI8yNgrDIgGUKtTrklsXstA6CSrNPUb5k9/D/QIt6kvkOeCDJy5iwfZGb+BhaxIBMg21jPwW+0+s3WKjIj3vtGVwaEaK6j38GdE8CSrDRg0OEtGZbzXDxonYl6aB1Jr5p4gTqVp8YMMYxtCJtvR+LQ84WxGJR0V121a3vOispq/tlEdI6sXY3prQhCXM0/LYGW5i4rXIiLDe0LxCXwW1mZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by CH3PR11MB7914.namprd11.prod.outlook.com (2603:10b6:610:12c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Wed, 1 Oct
 2025 21:51:17 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9160.015; Wed, 1 Oct 2025
 21:51:17 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250930225618.140071-29-matthew.d.roper@intel.com>
References: <20250930225618.140071-25-matthew.d.roper@intel.com>
 <20250930225618.140071-29-matthew.d.roper@intel.com>
Subject: Re: [PATCH v3 04/23] drm/xe: Move 'vm_max_level' flag back to
 platform descriptor
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Wed, 1 Oct 2025 18:51:12 -0300
Message-ID: <175935547242.1952.3377937015716740312@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: SJ2PR07CA0018.namprd07.prod.outlook.com
 (2603:10b6:a03:505::22) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|CH3PR11MB7914:EE_
X-MS-Office365-Filtering-Correlation-Id: 8edff28f-bbee-4518-4cd4-08de0134a608
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a1drcVR1bUlaRjUrVC9uN2lxMWk1ZG1rNkpJbkxxbTZjWWNya1RpQU40NWY3?=
 =?utf-8?B?OTZKeFdWTElFMys3d25Na0E1SmJDRE5QUHRVR21sRnRYSENWbHp2eGljMi9v?=
 =?utf-8?B?ekhFRDV6elQwWTNzL24vYytDaGZ0VWptVDBlbnYvWG5SQ04zeXkzSSs0dUNz?=
 =?utf-8?B?bW5ieUgxVXVMQ255U05pR3BvV1cwWXRnUnRoSVBSdzRhS2hjaythUUxJYmI1?=
 =?utf-8?B?SExCSDZ1U3UydTErMVh2ZTgyOVpnV0FZZ0ppVTRLbVoybnFCM05ucHZOVDRw?=
 =?utf-8?B?VTRRdUFaMVFibGo1ZUtHSk1OQzUvSVpHbU9VdEV5dW91OHpPRjZHSkI3dUlS?=
 =?utf-8?B?OW1Rb1BqcjJMSkZxZGo5SFZzcWxqUkc4aGcwRVcyQlRZSCtuWVduVFZFT3hM?=
 =?utf-8?B?eThoYUFVT2xlcUhvUE5FUFdGUll5Nkl3V2t4OUU2UlRlK1R5UzVGWFF1NU1O?=
 =?utf-8?B?ZEpiYWxpSXVGaEU1c1RmeFpvdHA2Rm54MTQ0ZTNPOWlEM2FiSXFMenFNek8r?=
 =?utf-8?B?Vno2MmlLU2xVclg2b1hCVUNIOCtWWC9uclBJbmlYT0Z6bHJibWdqNXBBUVRi?=
 =?utf-8?B?TldUTkVkYlgxWmJwTXhxMEJaNXpTRTRDQTM3QXZhMTdTM3pZc0NFZUhGWnhF?=
 =?utf-8?B?dnR4dXZjTFYwSm9BWlZmMEJ6TGlPalFlVStVUm9ZMjltTlBiNERSYk5pY2Vr?=
 =?utf-8?B?ZFU1Y0MzVTV2bUw1dHZHa21oL2tKSi80MTFSN09tQU0rWSszV3RQS1JxUXZ2?=
 =?utf-8?B?bVRQQnRIWnZyVCsrWGN2YTRsYW1xaHN0N3RpUTN5cWdiSlFKUitnOUI5TDZD?=
 =?utf-8?B?bTlpWGQxVjdOS2NhaTN3M0ZueHpHTGhtK0Z2SWRKaGZiZnlaTzZGSFEwWDdr?=
 =?utf-8?B?eWl4bjZPOHdmVEVaL1pZUzlpZjFnV01DbzBJbXNHL28wQmtMVlBkYlBORGRG?=
 =?utf-8?B?Wktla0I5RDlQZVlxdXI3UkdwWmtKV2J5SlFwd2YzdFZ3d3NRMmR5OHN1QzZP?=
 =?utf-8?B?RGdpelh3YndoaWpmM2dJVGdBNHpMQVl0L3NTWnBQL1dvaUF4ZUMrWGU2TGgy?=
 =?utf-8?B?M2E4czZNVG14SzJmVzJ0NlI5VTJ1bmx4eWZRMVV4Z1F5dC9KN3lMN25zT3JI?=
 =?utf-8?B?NzlTTUhydEM1SEh6NzNSRGh4c3hZK2hwOEhLSVZGbUV5TllPbks2UGs4a21k?=
 =?utf-8?B?K0JacDhiaUhSRUd1dXVzUkp2SzJmMTBORHJ3VGFkWUNsR3dTdXF5UkdIQ1FT?=
 =?utf-8?B?eDJmQ2xNcTZxaXhsU2NmOTExYWpDSUVGMkJJMWczcXlFTy8xNm5FcDRRRHM2?=
 =?utf-8?B?cTA4UEx1d3BYTEFTMEVGUGlrNnRuLzZhcG9RbHgzdnFkekg4S21yYmd0b3Bn?=
 =?utf-8?B?Q0RvWGlVR0VkK1ltNVBEMi9lTDNXbnVsMWUxamNxdEdRSGF4SWcrc0hmR2ln?=
 =?utf-8?B?R3ZCZU16blZLdUZZcGwwWVRiMGxWYWpZUU5lV3BuY2hEQmh2RldmT2VNVk9s?=
 =?utf-8?B?MGJuRUJONFBDZ29HcGVRS095SklsNXp3c3MxTkMyK2NVZDhKR0NGZ2VHdVhx?=
 =?utf-8?B?Q1lVby91dGNvdjhQZExVcHV2RjJPR0I0WU5KcE1EZHhPZ3JhV2t5S1FHYjQz?=
 =?utf-8?B?Qmk4eUNNeFoxeVRyai80cVJMQzBZOCtRVmFmNHMraTNpSEJac2ROaUswalhU?=
 =?utf-8?B?RjdKWm12ZkhpblJQb1AzUE9VaUNNamJZVlVVT3FWQVBlYVRoU0F1MzhZMzZS?=
 =?utf-8?B?RWVJN0wwVjFiUWowb093QVE1MFltNXdQSVRnZ1ZoOXZYb1k3azJhWXRxaDl0?=
 =?utf-8?B?RGs4VTA2aHhlNzFHcG9zRUFEMnZuUHVkUDY0cmRvMmxwdWQrQjZjZDYwbFdP?=
 =?utf-8?B?T1VWQTNFcXJzY2tlOTRmUnNGMHIwQWhESzYvVjJhNzM4ZzRqWUtnQlBENnpp?=
 =?utf-8?Q?QjoL+n3P6aUvz9gATchYKlDxFzklxxPK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVBGTFppcUErQlppR0hxYXEwbHVnd2plcUczUWdqYVRRYzhxeTNSanNSWDFR?=
 =?utf-8?B?RlY4dUxoSVF0ZGpsQzQ3NlZKU0pLN3ZvQjBleWN5LytuS1dSZVdWZitPLzJN?=
 =?utf-8?B?aWFybmxhcWhUUGRuU2dYOUNURWU0ZWtDOTd2TnBvSlA3SVQvMytsbXB6MGpT?=
 =?utf-8?B?Nk9UYVFwLzN0MitiRE5WSVR0dU03dng4RUJOT1dSeEJ5aUlKWFJpaTdkZ2Mv?=
 =?utf-8?B?VjMrQitqUFcrUm9GK2l4UEN3Nmc2eVY0OFhqaS9YYzBPUDBLTjlxTlhQVldj?=
 =?utf-8?B?dUt6aVdVSlZSdDZDYjRrcUQzMzkyeUExOG1jRFVmanZ4aW9YNEJrQ0R1SkpH?=
 =?utf-8?B?WlBQRTJjTEtFcklHeXZGNEtkYzl6K3p3czlEcGVBbjV5WXVtOTA3YituUmFO?=
 =?utf-8?B?Slpsd3prQXdaOEczNEc5Y2hSUFVNZ1pNUDhVbG5kb2NVYTlQa0tJRWlBM1Jv?=
 =?utf-8?B?c2FJMURkbEViWWJ4SWR0cnprR01OTHQxcEErZUdBalBMRHprNnc3SG1sa3Jo?=
 =?utf-8?B?NVdiVlA2ZHhjSnZqK1RGZC82d3NIclgySmEyK1J4R1F4RjJLUHZ6OXEwTlpI?=
 =?utf-8?B?YlByajNGcGNXdi9hSHpsZjFFU1ZuSjJ4R2pVbWQ1S042ZkswSFVxRlpVRDdT?=
 =?utf-8?B?RkUrUzNUTVlrVUEvOFppeU81Z1VNdEgwdCs2K1FENXBoUHFFMGpaRks1bk4w?=
 =?utf-8?B?RlZxMFJiRlBTNTlBYnZ4a1dsL3hmb1N1bUo5MGlHd3lLT1gwQ3RxMGxRMkwx?=
 =?utf-8?B?VnAvSEV2Tm9yM1NITzVqNmFnM3JGK2w3Q3ZlWWZNaS9YQ1l1M0E4U0JibVVB?=
 =?utf-8?B?VWMrcGZWb01MSXdWVUhNdmZQVmUrTGp6TjhWR2hQQmRtV2p4Tm1WMHhFczFX?=
 =?utf-8?B?YSs4K1RzUDZ0Y2dGaE1NeGQxNldFZHFtY0lYSjkxdG1uNWtOdHZ2cU01M2ta?=
 =?utf-8?B?YW80UkJGRjhRSzZMWmhsMjA3c2pqOGZwMEtHclV5Q1lIVkMycFdMelkrWXRW?=
 =?utf-8?B?KzJIRW9hckNBK3k1b05GZ3JoY3lPaXBFeHM0RHNYcmo5TjgraEtoK29KOGdv?=
 =?utf-8?B?Z1NYZURrUzdMM003aG5hZkh6MjMwZkNSMmtVYjQwQ0loeEE0Rkxkb0JZaFoz?=
 =?utf-8?B?UW8vbjRRY3hIRFlWU0lTREw0aE10SmVYczQvMDJiNzQrZlc2QnM3bnJ0TzFq?=
 =?utf-8?B?dDVza3FPck5OL2ZZVlpJSk82U2hOdWJ0Y2UvSDBkdTFFRXRPcGdJT1lkQ09k?=
 =?utf-8?B?djI1MDdra3Uya00vYWpyRHpFVEdzWWNTMFdUSm0rVHhPRFlKVU9VSHFPQ3gw?=
 =?utf-8?B?cnU0cWhxWlYrTFE2Ukc4aDNWdlcyaHBrOFM4ME1xbVZ6Y1VKc05kR0lVV0o5?=
 =?utf-8?B?TjdyUHNybG41NnU2S2xvQ1o4NkVQZS9ldG1HSXZnUW95RDdibmpWM0lXVzlB?=
 =?utf-8?B?QVM2THVkT2dZK0VWUXZna2JkWXVXa1VVUG1TYk1zN2o2WjhuY2puakpiMExO?=
 =?utf-8?B?akkwa1VkSCtBZERFRno4RVJ5M21QLzdEczZDVUZtbnRkeTh3L3owY2VoTFNt?=
 =?utf-8?B?L3lSRStCcHhoU1Mycml3NDFvTFEzRVVYMytpTDJkaU1wTmFtSHdaTC9tMTFJ?=
 =?utf-8?B?d2ZzMjYrTUpORzlzbUg4YXcyNS94Q1ljVTZiWFJqNkdZamRuMVIwQUptNXIx?=
 =?utf-8?B?eUlkVWc1NktXTkFzNUVndC9JSW1oa3VkTk4rRFErNGxRNDhYdmtKRVVFMzYx?=
 =?utf-8?B?ZHRHakZBc0UzZXRmMEhFandDb25WdnJFQmVYa3krQlIxWlF0c0lKWFhRZ25h?=
 =?utf-8?B?MlpxZEptc2lmOWRYMHl2a2o0b2lQclBVYnZmMGVsZkQ1ZDVXRCswR3J1QXdp?=
 =?utf-8?B?M0pMMVVZUUlHM0pqbGJZS1pVY2ZYTTNVcXM1Y0pMamY2R05mMEdyWU1oNk93?=
 =?utf-8?B?ZURST1hJb0FYUHJ0S0VXVTVEUFBIYzVPOXFQaVRKc0dkOFhVSWVRZ0E1QkVG?=
 =?utf-8?B?TUdDYS9oRnAvZGQ5VlVFc3VqSkkySUpDUGI3OGt4RTRPeTFOcFl0R05KeXZY?=
 =?utf-8?B?cHBVb05md0NCZzFKbmtuNEZlN0oydlFCaHdremtlVWE2SFFMZzBHaHFEZTgv?=
 =?utf-8?B?bk15a0NWSGFsRlAwRjM0VzNoRWxjRlVhRnNNMUZ1c2VCbFlMa1JjZE9wQW5k?=
 =?utf-8?B?K1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8edff28f-bbee-4518-4cd4-08de0134a608
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 21:51:17.0551 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fsDJITTR5Ffg8YsAEqyOh4KYfEaGnOL+X9BG9tsUKOm5YQxfdBeKPXwmLkh52WmHWp8AmGPHKK7778wmY0bTJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7914
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

Quoting Matt Roper (2025-09-30 19:56:21-03:00)
>The number of page table levels for PPGTT virtual addresses is something
>that should be tracked at the platform level rather than the IP level.
>Even when mixing and matching various graphics, media, and display IP
>blocks, the platform as a whole has to have consistent page table
>handling.  This is also a trait that should be tied to the platform even
>if the graphics IP itself is not present (e.g., if we disable the
>primary GT via configfs).
>
>Since all platforms officially supported by the Xe driver use the same
>value (4 levels) and only some old Xe1 platforms have a different value,
>let's make this the default if a platform descriptor doesn't specify the
>value.  If more platforms show up in the future with different numbers
>of page table levels, we can go back to requiring this to be explicitly
>specified for every platform at that time.

I guess this paragraph does not apply anymore, right?

>
>v2:
> - Drop default value of 4 and explicitly set the value in each platform
>   desciptor.  (Lucas)
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_pci.c       | 22 ++++++++++++++--------
> drivers/gpu/drm/xe/xe_pci_types.h |  2 +-
> 2 files changed, 15 insertions(+), 9 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 69ed987fef67..8688f40f55d8 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -51,13 +51,10 @@ __diag_ignore_all("-Woverride-init", "Allow field over=
rides in table");
>=20
> static const struct xe_graphics_desc graphics_xelp =3D {
>         .hw_engine_mask =3D BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS=
0),
>-
>-        .vm_max_level =3D 3,
> };
>=20
> #define XE_HP_FEATURES \
>-        .has_range_tlb_inval =3D true, \
>-        .vm_max_level =3D 3
>+        .has_range_tlb_inval =3D true
>=20
> static const struct xe_graphics_desc graphics_xehpg =3D {
>         .hw_engine_mask =3D
>@@ -82,7 +79,6 @@ static const struct xe_graphics_desc graphics_xehpc =3D =
{
>                 BIT(XE_HW_ENGINE_CCS2) | BIT(XE_HW_ENGINE_CCS3),
>=20
>         XE_HP_FEATURES,
>-        .vm_max_level =3D 4,
>         .vram_flags =3D XE_VRAM_FLAGS_NEED64K,
>=20
>         .has_asid =3D 1,
>@@ -105,7 +101,6 @@ static const struct xe_graphics_desc graphics_xelpg =
=3D {
>         .has_range_tlb_inval =3D 1, \
>         .has_usm =3D 1, \
>         .has_64bit_timestamp =3D 1, \
>-        .vm_max_level =3D 4, \
>         .hw_engine_mask =3D \
>                 BIT(XE_HW_ENGINE_RCS0) | \
>                 BIT(XE_HW_ENGINE_BCS8) | BIT(XE_HW_ENGINE_BCS0) | \
>@@ -183,6 +178,7 @@ static const struct xe_device_desc rkl_desc =3D {
>         .max_gt_per_tile =3D 1,
>         .require_force_probe =3D true,
>         .va_bits =3D 48,
>+        .vm_max_level =3D 3,
> };
>=20
> static const u16 adls_rpls_ids[] =3D { INTEL_RPLS_IDS(NOP), 0 };
>@@ -202,6 +198,7 @@ static const struct xe_device_desc adl_s_desc =3D {
>                 {},
>         },
>         .va_bits =3D 48,
>+        .vm_max_level =3D 3,
> };
>=20
> static const u16 adlp_rplu_ids[] =3D { INTEL_RPLU_IDS(NOP), 0 };
>@@ -221,6 +218,7 @@ static const struct xe_device_desc adl_p_desc =3D {
>                 {},
>         },
>         .va_bits =3D 48,
>+        .vm_max_level =3D 3,
> };
>=20
> static const struct xe_device_desc adl_n_desc =3D {
>@@ -234,6 +232,7 @@ static const struct xe_device_desc adl_n_desc =3D {
>         .max_gt_per_tile =3D 1,
>         .require_force_probe =3D true,
>         .va_bits =3D 48,
>+        .vm_max_level =3D 3,
> };
>=20
> #define DGFX_FEATURES \
>@@ -251,6 +250,7 @@ static const struct xe_device_desc dg1_desc =3D {
>         .max_gt_per_tile =3D 1,
>         .require_force_probe =3D true,
>         .va_bits =3D 48,
>+        .vm_max_level =3D 3,
> };
>=20
> static const u16 dg2_g10_ids[] =3D { INTEL_DG2_G10_IDS(NOP), INTEL_ATS_M1=
50_IDS(NOP), 0 };
>@@ -268,7 +268,8 @@ static const u16 dg2_g12_ids[] =3D { INTEL_DG2_G12_IDS=
(NOP), 0 };
>                 { XE_SUBPLATFORM_DG2_G12, "G12", dg2_g12_ids }, \
>                 { } \
>         }, \
>-        .va_bits =3D 48
>+        .va_bits =3D 48, \
>+        .vm_max_level =3D 3
>=20
> static const struct xe_device_desc ats_m_desc =3D {
>         .pre_gmdid_graphics_ip =3D &graphics_ip_xehpg,
>@@ -307,6 +308,7 @@ static const __maybe_unused struct xe_device_desc pvc_=
desc =3D {
>         .max_remote_tiles =3D 1,
>         .require_force_probe =3D true,
>         .va_bits =3D 57,
>+        .vm_max_level =3D 4,
>         .has_mbx_power_limits =3D false,
> };
>=20
>@@ -319,6 +321,7 @@ static const struct xe_device_desc mtl_desc =3D {
>         .has_pxp =3D true,
>         .max_gt_per_tile =3D 2,
>         .va_bits =3D 48,
>+        .vm_max_level =3D 4,
> };
>=20
> static const struct xe_device_desc lnl_desc =3D {
>@@ -329,6 +332,7 @@ static const struct xe_device_desc lnl_desc =3D {
>         .max_gt_per_tile =3D 2,
>         .needs_scratch =3D true,
>         .va_bits =3D 48,
>+        .vm_max_level =3D 4,
> };
>=20
> static const struct xe_device_desc bmg_desc =3D {
>@@ -345,6 +349,7 @@ static const struct xe_device_desc bmg_desc =3D {
>         .max_gt_per_tile =3D 2,
>         .needs_scratch =3D true,
>         .va_bits =3D 48,
>+        .vm_max_level =3D 4,
> };
>=20
> static const struct xe_device_desc ptl_desc =3D {
>@@ -355,6 +360,7 @@ static const struct xe_device_desc ptl_desc =3D {
>         .max_gt_per_tile =3D 2,
>         .needs_scratch =3D true,
>         .va_bits =3D 48,
>+        .vm_max_level =3D 4,
> };
>=20
> #undef PLATFORM
>@@ -593,6 +599,7 @@ static int xe_info_init_early(struct xe_device *xe,
>=20
>         xe->info.dma_mask_size =3D desc->dma_mask_size;
>         xe->info.va_bits =3D desc->va_bits;
>+        xe->info.vm_max_level =3D desc->vm_max_level;
>=20
>         xe->info.is_dgfx =3D desc->is_dgfx;
>         xe->info.has_fan_control =3D desc->has_fan_control;
>@@ -723,7 +730,6 @@ static int xe_info_init(struct xe_device *xe,
>         }
>=20
>         xe->info.vram_flags =3D graphics_desc->vram_flags;
>-        xe->info.vm_max_level =3D graphics_desc->vm_max_level;
>         xe->info.has_asid =3D graphics_desc->has_asid;
>         xe->info.has_atomic_enable_pte_bit =3D graphics_desc->has_atomic_=
enable_pte_bit;
>         if (xe->info.platform !=3D XE_PVC)
>diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci=
_types.h
>index 095133a1aa44..f45b45a7f76a 100644
>--- a/drivers/gpu/drm/xe/xe_pci_types.h
>+++ b/drivers/gpu/drm/xe/xe_pci_types.h
>@@ -31,6 +31,7 @@ struct xe_device_desc {
>         u8 max_remote_tiles:2;
>         u8 max_gt_per_tile:2;
>         u8 va_bits;                /* default is 48 bits if not specified=
 */
>+        u8 vm_max_level;        /* default is 4 if not specified */

Ditto for the comment.

--
Gustavo Sousa

>=20
>         u8 require_force_probe:1;
>         u8 is_dgfx:1;
>@@ -52,7 +53,6 @@ struct xe_device_desc {
> };
>=20
> struct xe_graphics_desc {
>-        u8 vm_max_level;
>         u8 vram_flags;
>=20
>         u64 hw_engine_mask;        /* hardware engines provided by graphi=
cs IP */
>--=20
>2.51.0
>

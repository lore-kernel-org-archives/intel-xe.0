Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D34F9C02185
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jan 2025 16:21:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BA8510E770;
	Wed, 15 Jan 2025 16:21:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OFn9zQdP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3420210E77E;
 Wed, 15 Jan 2025 16:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736958068; x=1768494068;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=sCcnl06huat/+ic08LqAtBHYwW3tRK01j/UYuGsF47Q=;
 b=OFn9zQdPRrRveQ1EG0g5gM+HKpknHLyQ12JVM+HJIpcPm3+/zh7KEoYY
 /HldoNAXtZ5ob5Cg6o5slhYA6OW6xvSbISA7VeQJeT/DR8jmuZEt5K/MD
 i7wiBZtuixXIhNrZ1R+jm2GzXfI+g1qgNYOdpONAuEXE1AQaEmmRfK0yu
 x9/BpeLxmIaBTZRcbkvIV+tRgEenTRLfne4SswebHjtWz7YOAJCukLIzQ
 6vp0OvZ6o/g9RBqKCZRPMVQPbOrMJnciax6ZXxZb6mrdkqWuOzwW1VXBX
 WKE0eBuaQXXryFg0q2Xf/I5dkT6T75VFFA9djV5WG0vbz7UV8gXJ1nKCZ g==;
X-CSE-ConnectionGUID: kehDEBbhRHmP6l6p8Bb5vQ==
X-CSE-MsgGUID: EmiGNapmSu+9DZNL39S5aQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="54844828"
X-IronPort-AV: E=Sophos;i="6.13,206,1732608000"; d="scan'208";a="54844828"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 08:21:08 -0800
X-CSE-ConnectionGUID: QCwNQhGnRwuyn3n2npa+1w==
X-CSE-MsgGUID: OfjCmWXZRYCZTgngKp2LAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="105662399"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jan 2025 08:21:07 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 15 Jan 2025 08:21:06 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 15 Jan 2025 08:21:06 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 15 Jan 2025 08:21:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B/MgUpoKVp20K4RmlvPuFFqbFO/6BxRvo2kpwItEpBFFBfE1/ePzoqJ/g1XGaMute0HEl4cjP/CLXA6utGvNGPtVpLDxPBnB/fxKak/zhnDuk9X5wTts3LFDxe7CT7Hy+GdNV4ZAkJa5dMqmZuc8ifVfaN5wtKMZZ/wbJO4/Wm6R9j1mUiD1WhMeYuZjqHpanRAMs2LqmlB2c61FqpdsG2+hIw8/scmmg9WFsZuOqTypCeoinMZzUNHkV73iCST+Tr4dYpIdOaT4/Wg2di0Qh5YOY2vR4RgqcXokg4gTyPhzkP+IMW0pXWvWOfFPjJQ5wK7WvDgudFMtFi8RE6kNvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mwOMHw1cm4YoFfThzKsugudQLkMNLBU4GfWBOfS8QPk=;
 b=BgVtFr94fxSyKFkkNClPdsdUsEy9kLp7uIQ8a2/qiITFXDIKLrsyUcimeMrGcHHsEj0ofKxr2OEPVlGi36MolErsZwpN+CaWFbqVfFQmIxA2KosY6fYusNDwxZVPr65FQCqPbarZMX1kwJ6zFdcfFiVe4C80p1wfVXYh/a9Wn0pHPIdPsCxX5ac70YCgJMuUCel8DVPiLe52itTUlYZhOELpVEPSTFpARf0iEUJq9Zdfv/fflWvXHwyoLAKEIpk0RbJNwMA7povrfvH5BNG6wYFPWKAaYkwjGJQA+f18vm5pkcrs8U2vovugFq1li0+R54t3Erlrzm6+yWDSxtCOxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by IA0PR11MB8420.namprd11.prod.outlook.com (2603:10b6:208:482::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Wed, 15 Jan
 2025 16:21:04 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.8335.017; Wed, 15 Jan 2025
 16:21:04 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <173695374387.3983181.14187231526385162871@b555e5b46a47>
References: <20250115140812.20799-1-gustavo.sousa@intel.com>
 <173695374387.3983181.14187231526385162871@b555e5b46a47>
Subject: Re: =?utf-8?b?4pyX?= Xe.CI.BAT: failure for drm/xe: Fix sort order of
 .o lists in Makefile
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
To: <I915-ci-infra@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Date: Wed, 15 Jan 2025 13:20:59 -0300
Message-ID: <173695805941.3159.1159064316268223503@intel.com>
User-Agent: alot/0.12.dev27+gd21c920b07eb
X-ClientProxiedBy: MW4PR04CA0257.namprd04.prod.outlook.com
 (2603:10b6:303:88::22) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|IA0PR11MB8420:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d8e6bf3-ce67-4bd3-af9b-08dd35809b8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RFJsZ1pXMzZEa0JUYjgzWlJFV3d6WWFrVnpjNGNMVEJOMkFNaFlDSWRPbERl?=
 =?utf-8?B?MEZrd2o2Smo3a1A0bHNuLy9jdFR3SFVJREN4VDJaR2dEeWd4TVVibDl0a3Vt?=
 =?utf-8?B?cXNZbDdYdGRhbFhwdE1TMUhTNCtnRWFTRXJqRVV3M2IxVmxQMUoyaWV3RDgx?=
 =?utf-8?B?Qmc3aCszc0tDMGJuVDlpMURmYXExaWxrRnJDM1lkVENPYmlhaUViQ2FOQmhK?=
 =?utf-8?B?UzdMdm4wS3hZcUZLY0xPL3hiRlpHTzFIbnk2aDc5K3lVdlNKSEIzQm12WEhM?=
 =?utf-8?B?UmFhdW14QllidWh4SFBiTEVNRTlScGRpVlZRYzhOMTZieWpYYnBVSkUvSjl3?=
 =?utf-8?B?cTduNEN1Qy9rekxCRld1SGxFdjJGNmRwQTZycXFMcXZHSTllL2hjOERrUEpv?=
 =?utf-8?B?bkJiYlVkV1p1bGJzMzNwdGgrV0p0QlV0ZE9UREtYakxlNVFhYm1pMmNoL1Zh?=
 =?utf-8?B?bno0cDYvRG56VEZjdk5seDRzMDFGREhpSDNMSFNzbXBLbS9PQ3h5R2czM09D?=
 =?utf-8?B?UXZHUW5iaXRWS2d1YkRicWdGMUpQS3NzUk5PTjVzWEFsbldYTkxmZFczNSs0?=
 =?utf-8?B?bDZFTzJ6Z1lkM0lZK2pXL0lOTkdoY3F2bjdHUnpxMWNtbWc4bFZMTU5qdDRH?=
 =?utf-8?B?a2dWZU50Q0wzY0pYV2NVNkZobjBYcFRjMm0ySnJGT21OWnNYNVdqbDZVckpr?=
 =?utf-8?B?WEt6OWJJNzd0RERZUUZlT2hPM01TQ2k5dVNmZ1RHSTJIaTFNTnJDVDZYQ1JQ?=
 =?utf-8?B?TkMwSGtXWFF1SzdjT2tscE5ZTWF6bk4vdVgybS9jZjM1WkJZNWJCbENWWVZ3?=
 =?utf-8?B?bHF0NGtOU1c0V3Avbnh2REdPN1Z3bUR3WEpMU0NRMGpXdDN4dFBBZ1Y1REsr?=
 =?utf-8?B?OEZWcDRhVmVwcE91VU1CUDBDRXlBbXhxR0VtUFZERElDWjVkQjJhcGltRlEv?=
 =?utf-8?B?emdNMHlFMjF6dDYrTVJWT1VBTDJEeGliTWtidXRtM0Z5MEZoWDhkTFp3MUYz?=
 =?utf-8?B?NjBXMHNobFJmdkhKc2E0SDZlYjcvVmZQL2FNODFXRktoenNvUDNKMW1FRGQ5?=
 =?utf-8?B?Y2lIQzBsY09TdWJnc3N5RWZVMThndG9vTXhPV3RWQ2JOemlJRjVZS0luNTVK?=
 =?utf-8?B?WkJnYTZUYWR6ajNZQXpxNE9QVHppaER0a2d6YzIzK0E2ZHp2NGVhQnpoclRj?=
 =?utf-8?B?ZGJnT215RTZ0UEZyWnFwYTZ5d3dEenhCQlZ2ckFuQU4xelF3bWxLVFJyQ01y?=
 =?utf-8?B?a3FxRUpwWUUwb0sxVCtnMnpYTnFSSTZtY3h5WEY3L2p6clN1RWNuMkszUytZ?=
 =?utf-8?B?QkdwNVlkeE92WHQrNUdtOEo3T3hBeEc5R1hRd3pYdlFqVm8ydlozYVUvK0Vz?=
 =?utf-8?B?YmdiUDZkNUQ0VjVhdDlYOEk2WGR1KzdXK2ZHMXRnK3FPdncxS1N1cUViRmox?=
 =?utf-8?B?T1B0VXlSSzZ4enI1WVhjNUpjMVVYRTIvekNjN0tSQ3pMQnNORmNRcDNpOHpE?=
 =?utf-8?B?YVBYejF5b3hRVTFRWWFNeDBVbzFkb0VWR0V6emh3U1dxeEtWcU1jTmg5RmMw?=
 =?utf-8?B?aTcwYTNNWklZcndPZDdBOHYvSTZiZGNOaGhTR1pQTHNiWFVWRGJsNGlYSEFW?=
 =?utf-8?B?YVd1eTVrKzgyaGpuSjJRakNnMEJDRkpzaHZDdU5GeEsvTllBYXVkUEFkdFcz?=
 =?utf-8?B?aHNzeXZLNm9sNHBpbklaRXJINUswamp2RWluVC82L2JNVmdzUHhNYk1NK29v?=
 =?utf-8?B?a3dZcFlzRlp0bFZhT0xXSFRIQ1U1YWt6SzdtM3czblh6dk1sdVZndTJlUmwv?=
 =?utf-8?B?TUJXcnhkK2VNOHlTS3FtZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0pNMHdvZS9QL0RtQ0lZM0htaHZVVTZXY1NQSXUyV2FPcnVGbXd1U1N0Ym5S?=
 =?utf-8?B?akF1ZTROaTE5cVkzbnZxai9UeDMrVno3VlVEUWZmOEZRMDVHdjJDQU1nVml6?=
 =?utf-8?B?RVg2T01KVHRSL0VRRXNNN2RCWGRJNnByaWlQVUU5SXJzUmhUNE95UytjWmgv?=
 =?utf-8?B?ekVBUlM0THlYR2VDR3lKcTk1eWdPVmk0ZGs2OGllTUZzbHVqRzBnRXA2TG1w?=
 =?utf-8?B?RUlTRW15V0FSWFVCdFNPbDhhMlJjUUloZzAyc0Ywbm5vdnF0c2lzYlFuSUJH?=
 =?utf-8?B?MDVkM0dDVHprMk5lWGxZREVjeXpEeDllK2dKRHZ0NWl4RVNGcy9PNDZzeVY5?=
 =?utf-8?B?Y00vZGJhdjlrdjdiVGVXVkRjZE5vVkFJYk54bi8vc2c1b0RlM2dHdG1wSThX?=
 =?utf-8?B?S1BEczhDL1N3R1NDSExYMUVNRHJFbzhTU0lrLzZESWlRVk1ETWUwVW5NZm5X?=
 =?utf-8?B?S1BZMTVWUzhjMnV0S2laQW1lZ2xkUEh4czQrVDM1TXJRZkZ6VEoxV25abTN1?=
 =?utf-8?B?QmQ3S0pwcW1aN3Y5MmlOZWY5ZjZDVTBYbTJmWGJKNjE2eFdnanQzcENteDN5?=
 =?utf-8?B?Y0lzZWRlZ2haZ1MvZXFRMDBadDhwTHBxOGtCSmU3T1hrSm5DZ25iVTJIOVNL?=
 =?utf-8?B?VXNlUGJxWDZEYU9VS2FpODZsSTFwZjJ5alpxTi8vY0xBMko1UUtLVzZmMC9x?=
 =?utf-8?B?N2doSkNzVGJzdlpFRkJ1MGF2ZVN3UUVCQ0I0NXRGOFAzbzZrdXA1TW9nK21E?=
 =?utf-8?B?Q2oxTS9INk1yaXAwK0NlYXZJMktNWWZ4QTRGUGN6ZGxSYmRzQzd0YTBwYzVM?=
 =?utf-8?B?VWZDM1JBM25jMkVuOGo1ZEtxUWJ5QktPZ1F2Ni9LRVpZMlJVeGV2RGROajFt?=
 =?utf-8?B?elF4bm5OMmprdWY0dUMxWHhHSGRkSWxIV1JNbnA5VXJNaGxuMWRRM294UVBN?=
 =?utf-8?B?OGFvQW5VQVBwcytRQ1FHQ2EzQnJ4VGJOMTM3dVNCNGlnbFp1dUR1RVZyZEFV?=
 =?utf-8?B?UG1wZFlDaVQxZGl2SkNzTWlrVDJSQ1VxMk5tSGwxK0N0REhPVlFEd1RBcHlC?=
 =?utf-8?B?T1hGSUlZaVIwMnkxNXNnSm90TCtqTHdDeGl1T1dLcVdUYXBpcXBVajl6V2xB?=
 =?utf-8?B?dThiQk5UU21Kc2Y3OTAzTHVUdkgwT09iUWpNWnRtVnZuKzJnMGtENHNOZnpy?=
 =?utf-8?B?RFY5TkNucmxEUWtReWlVeVIzN2RpQnpaZmZvMjNlelV4Z2ZjaTBrczhZVFNR?=
 =?utf-8?B?QUZtc0UrYjhrZTRjRUJhdCt3b01qWFlnOGs0ajdXUUs3bGw4NkZVK0M1bEFE?=
 =?utf-8?B?RERGeGRtb3NnZmhvdkhrT3YrNGFMSVVucXdkRWlZb2UxdnM5aVlJRnQ0cEor?=
 =?utf-8?B?VndhcHdudXVjUjF3OENvUjlWa2xoai8rSTJjL3l4YlMyUGxaUWFrbDk4RkRh?=
 =?utf-8?B?eTE5YWZzNUlTNi9Cd0ZwL0sxU0JIRnFmN2MyQ203cXd4TVhMRDJNOWFQclk0?=
 =?utf-8?B?Sng2WnhJTld1WVRBZG1wclZNbXVIWEVadGdpTCtRZmpINWRqa1VBUWV6NEJH?=
 =?utf-8?B?ZXlRMUIza0lRdXI5TldXMS9zZ2NtV2xBWUNzOHlrNzAzeGFQY1RpOUtpRGly?=
 =?utf-8?B?UGY4S2E2R09YbWpuUTcxcjBHbUVIZGh0MFhEeUFrSWRxdTNvZ2RFNlJvNU9y?=
 =?utf-8?B?emlGK0NYMWVyTmlUZ2VObXBuYjVrNjJ6cFNvVlFERWIxWFhnU0lycG5oVWlD?=
 =?utf-8?B?WDcvMVBTOWZMZVVzV0Fqa3lhQjFnL2gra3BGb1pXWWJIMDQrdUhjdFNjd29M?=
 =?utf-8?B?T2YyS3hEaFpKNUNpTWRlaEk3alVIbDQ2MUgva0xMaUwxaXNjTGxMSkttN0NY?=
 =?utf-8?B?RnpQR2Raczg0cGFVWko3dmMvNENvV0tudENxcS8zM3Y2aXQwV3JoblhTeTBX?=
 =?utf-8?B?L2EwUVdUM2FNK3hGTktBOFJhdVc2ZHcwd3J4OEszVnJXeDlROWR2RXRLdVQz?=
 =?utf-8?B?MC9zblVwWW15bndwcFA0OTNSU2N5bVNMK2dMR3dBbGpWeGxDdWxRdzBkVldF?=
 =?utf-8?B?Tmhtai9xWGFZT1RkYURLUVhILzJDVDdVOURybDUvRDlZZWR4MEpCQkdzK1F4?=
 =?utf-8?B?UHVoTHJlWFY3V1pWcVJsSys4Um5WUmZwTkViTURPVnM5aGF0aHFCaTduSm1E?=
 =?utf-8?B?N3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d8e6bf3-ce67-4bd3-af9b-08dd35809b8f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 16:21:03.9504 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5JFhSLqIaQYalCSbsPaEjRnBoUUBQk7Zhlu976YO4Kk/T0twbUaRxH7SK1ppX3c4r8XH32cgllCVfVfRDIaINw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8420
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

Quoting Patchwork (2025-01-15 12:09:03-03:00)
>=3D=3D Series Details =3D=3D
>
>Series: drm/xe: Fix sort order of .o lists in Makefile
>URL   : https://patchwork.freedesktop.org/series/143557/
>State : failure
>
>=3D=3D Summary =3D=3D
>
>CI Bug Log - changes from xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09=
_BAT -> xe-pw-143557v1_BAT
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>
>Summary
>-------
>
>  **FAILURE**
>
>  Serious unknown changes coming with xe-pw-143557v1_BAT absolutely need t=
o be
>  verified manually.
> =20
>  If you think the reported changes have nothing to do with the changes
>  introduced in xe-pw-143557v1_BAT, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them
>  to document this new failure mode, which will reduce false positives in =
CI.
>
> =20
>
>Participating hosts (9 -> 8)
>------------------------------
>
>  Missing    (1): bat-adlp-vm=20
>
>Possible new issues
>-------------------
>
>  Here are the unknown changes that may have been introduced in xe-pw-1435=
57v1_BAT:
>
>### IGT changes ###
>
>#### Possible regressions ####
>
>  * igt@xe_vm@shared-pde2-page:
>    - bat-adlp-vf:        [PASS][1] -> [DMESG-WARN][2]
>   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae=
6345f0dfa5a598f0b284ab09/bat-adlp-vf/igt@xe_vm@shared-pde2-page.html
>   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/bat-adlp-=
vf/igt@xe_vm@shared-pde2-page.html

Hi, CI team.

This is unrelated to my series, which contains only non-functional
changes. Could you re-report please?

--
Gustavo Sousa

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10868C5AD49
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 20:32:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9CD310E12A;
	Tue,  3 Jun 2025 20:32:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dDTxj36W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C15AC10E12A
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Jun 2025 20:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748982768; x=1780518768;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AmNOEQU4PO66PQ7UtYFYiG4FTgkaDpTL0lK4rnH6qxY=;
 b=dDTxj36WYpny1OabaJEMoOJl+TOdOF3UKrBeugzYJNO8EArQGs1tBasY
 g/E+unJGefM3HaL8kauxplhiAJ4F83ju0n1qx0EN1mEVtDvXRCBeksZ9E
 T/WsDT11+lCgYl/BO1wKumQS5s8tZi0Bvaet/048oaMBgdFF0DoGUnnzu
 1zkIFZbaoPSoYCbep6gQ9trGDToSidINxFfdB04Snb5sal0vcmznqPwBN
 5rXBaF1DA+GeF8FgF157GcD5qf4nKvhZP/ShgpqLLiUikJactVVc6SLMi
 Q20n/Bitk28IN2EvX9m7cA15zTcVQAyF08DdYsuRrNUjFdMldw8BXxe1m A==;
X-CSE-ConnectionGUID: cd1fDqd6Tg+gBJRzioC5Fg==
X-CSE-MsgGUID: dMzNhSruRqaQb6QxqEJtqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="62098230"
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; d="scan'208";a="62098230"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 13:32:48 -0700
X-CSE-ConnectionGUID: IJjsStbzRkeXien6yKyvmg==
X-CSE-MsgGUID: ZJKKHS8YS+Ccw+T3j1QXqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; d="scan'208";a="144937777"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 13:32:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 3 Jun 2025 13:32:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 3 Jun 2025 13:32:46 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.72)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 3 Jun 2025 13:32:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oqL3JFvs9MdSZ8sdt59WOJKQ6sj7ulyDll21LwX5TP2I3p6/0lmNZC/z/Y1mgviL+wdgWtq/KV+soriS9dab7My6LFD0kH9z4QezGcmOpiCePgBhjOfB/G4M7/YkyFBQho1V2/RsN4BtlF+2mvAb4livHQSPcNktAwzR7jztiEjAjit1Rg2TbUchVSji7RpBpT/TYjyV+BeL2gmqiO3uYX03GE0JxSjUz8IRgMbUh9+On6X8NHo/YrqcggQuV0IUE8TDozXxlimhvLKg0pP4YmQ8qbRQelPiBYn47iRVXGXf8WllBRDLvRen+O+FLMMDXGk8vtzvEFUBhwf7qTZklQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3TR6tlSHiL/WRJt6Nk2iGYdzxN8yI1zAPhljhpYl0Ek=;
 b=SXl7Lt8/y2jZmT/RbJSmhO8Fg3IekSWLjQ8pKdEcUXMNXVwsOycb/bPbV1s0jB6O8ho8cgLTClwyy8e+28nxGIzH5WqD2GNyWfUpOU+4gltrehhsYyJ3Lb7F2AKj6rBeav4Zz9eDK+pIdXqCT/AP2MgMDY310A+yUUctT81l693VgcMMQ4JZ7XgvqZSIkJsuPVU2pgkqyhGXNBHqccMkXXP2pktJuzPYEIHG63aRcTDt2yGZ0sRjFFfE7zcDyfBLlr2P08YlZCG6BOwE6N1HuL2g2rymhoFnZDCOfWcHbpXPmFzhAFYxgV6y6UH/UKFklTW0QAG+Z2C+9FwHOrq/4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by SN7PR11MB6749.namprd11.prod.outlook.com (2603:10b6:806:267::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.31; Tue, 3 Jun
 2025 20:32:02 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%5]) with mapi id 15.20.8769.022; Tue, 3 Jun 2025
 20:32:02 +0000
Message-ID: <5f834906-e62e-4a61-8dbc-7bed51904548@intel.com>
Date: Tue, 3 Jun 2025 13:31:59 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] drm/xe/bmg: Update Wa_14022085890
To: "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
References: <20250602234415.2015921-1-vinay.belgaumkar@intel.com>
 <20250602234415.2015921-2-vinay.belgaumkar@intel.com>
 <85316ce01b40c0cf8775833c29c4843bbf281315.camel@intel.com>
 <83ec77ee-1aed-4926-866b-e1a6301109e2@intel.com>
 <8afdac13617376dd5c9151e832921b5993443243.camel@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <8afdac13617376dd5c9151e832921b5993443243.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0164.namprd05.prod.outlook.com
 (2603:10b6:a03:339::19) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|SN7PR11MB6749:EE_
X-MS-Office365-Filtering-Correlation-Id: 375c7c13-0f45-4a74-ca23-08dda2ddb268
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?anE0c2ZmbHVSaHRZNTQ3TGI1TFpZU0pJRU55d3ZNU2VibnF6bUlWTDNmbUFu?=
 =?utf-8?B?TXZxV1JUdHBucFBiZjhlVUgvakhVVjI3SDJxZEIyNnJMR0VKejdiWkU2Ujl1?=
 =?utf-8?B?UzFQVmFqNWFnSWlmQUh1TjkvREZvL0FrTE0rWlorUUNQK3g1cHltQi9MNTNi?=
 =?utf-8?B?R1hhQWdLL002MkMwVDUwRU9CTzZwU3M3UUo2Zmx1Z1lpU3JXUTNHZjVRYW5C?=
 =?utf-8?B?Zy8xR2EyZEVJQzJDMXNySHM1SGFEbUIvQ0Nyd1ZnRGthSCtBRVNuMldqcUlE?=
 =?utf-8?B?U2FRQmZUWWwzeE45a2hQOXRSd3NnK3BMQUJxZW5TOFVKYkZpUUlrNU1UZWEy?=
 =?utf-8?B?YzA4MkhSZnhUelVSbUg2ODVwR1BGc0EzUEpVOGZrMkwycUc0MEJReWZVTVhi?=
 =?utf-8?B?d0F4VC9BVVdvR0Q4Z1dXa21mMkJTWm85OWtNYXprWE9NL1J4b2hpZDRrVlNw?=
 =?utf-8?B?L2UzcStDV3JCUiswUmE3Y2lFMHV1eWFEMEZwMVBRa0dZMzVPTVVMOFJtNjZ1?=
 =?utf-8?B?QU5KdWN6V0JPSnQvM254ZnFDLytVTk1vazN3d2o0bEJvN2Zzb2FORDVxSWhy?=
 =?utf-8?B?MmRUSXYvYk5vdFpCdmNKaXNBNE9hTEJyYnN2TUJmVHRiYjJLTW16VDNtQUlN?=
 =?utf-8?B?UjlIblNyVGNuRXpUTGJObzkybi9LOFZnZEplZGU1MlRER1hlajNrb2RLN1Fu?=
 =?utf-8?B?aXdZakFIUjl6SGFjYjROYzhaRzczbFV4QjRxeWkyKzhsZzVrMGVjUW9YS2ta?=
 =?utf-8?B?ZlM5STEvRFBLdlFSdnpWWDJ1ZlRiQjVNOWFBbXdlaTl5Wlo1YUJrZGo3ODdY?=
 =?utf-8?B?Wjd0ekx0UWhBbDJrb0lsL1NVM1B3Snd1RnIwZWVlbjhrZUpvdVA4ek1KU0Z0?=
 =?utf-8?B?Y0hUS1lQT2U5MVg0eGZSZS9tWlJWTCs1OUdubkRkOUFMR3Noa205ZWovdFJQ?=
 =?utf-8?B?OTlLNnpxbnQ0L1JEbXNRS1ZwcVp2ekkwbDRzR3NVWHBZTjdNRjJRNmVCbGRN?=
 =?utf-8?B?cmxBVjFmaGVKakNlWmRnYXZUdzV1clR2MHUzNWxkMGsxMEFXVjBrbzVPQzFW?=
 =?utf-8?B?ajcyKzFzaEx5Y3BMYmVhTVhRVXFkNE5oNGw4bGN5SEM2UlB6dTJKbER3WStG?=
 =?utf-8?B?Y0R1RnExT3gxZ3k4cG1jc1lXN3hoV1pKM3RvQURoL3phUk1qcWJmZnBtTTBW?=
 =?utf-8?B?NWMxbmk2T0lzNVJ2SDcvTXVoY3NIVTczUlczdW04ZFdLdzkwd080Y1p1bG0x?=
 =?utf-8?B?L1YrbFc3d3UyYWxhTnE1blJDYU5QMURNVUVPemxzZy8zMHNyRGFOWTZpYXN0?=
 =?utf-8?B?aXFmZ1dZTWtwOENuN2s1RnFPc1BuT1RVNjUzYkRlV2JMcGxNRTRRME9VRVJP?=
 =?utf-8?B?eVR6L2J4YnhmM29OajhpbGc3aGVQU3dqUkgyZ2VDMmlHUUJLU3o5K2F2TlZJ?=
 =?utf-8?B?SUxDVm5lT1B1RURHNllQeDNIWFVSYzlvVm9ReGlwcVVhNWN1d1dSUDMyYVIx?=
 =?utf-8?B?cGJBWGhQb29Xa2hJK21vU3FhTElhd085ZXJ6c2REa1FlenZOMW9NK25nRXBv?=
 =?utf-8?B?M1ZwRmVlUUt5a3dOZ3VNQXFnUmcydHRnLzEydW5iakxETUVoTGgrWkVPZm9X?=
 =?utf-8?B?VlRNaGhySHB0ZTNYSmRESTlhSEdVTXNTV2V0c0RwYW03aGdaaDI3S2VpMmY5?=
 =?utf-8?B?R2p6dmJTcnFEYm5JL3plUHh4U29SUHh3eUZzZDI2SndrUmJid0FjWVMydUs1?=
 =?utf-8?B?NTk2MFFBSkRFU0Z4L1JSSlBKNkppYlZiMmxFMThGWUt1MFFRYitQdzNPZDJN?=
 =?utf-8?B?a3BCdlFZcDc1c2M2TWFQd3YvWlBieE5ZTHVCU2VGekJDSW8yQWVPQXlQTTBt?=
 =?utf-8?B?UVRZSjRGZmFwbFJOVHZ4b0ptYS9UbCtUbDZaY3NiMmMxd0piN1Z5aGZyYVlt?=
 =?utf-8?Q?TeKrdENO9so=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDN1RWtaTTlobXhYcmxzVldCelBMOXNjaHJ2ZTRhNENKWWVWeGJhM2ZlUjZ4?=
 =?utf-8?B?VTB5eUpEdXlsSzFlNzBLLzJEcjQwNlBGaXRpN1V5blM2Z2pPT2Nia3Urekla?=
 =?utf-8?B?UmZOaVNzUjJKdFdkZGpub1c3QlFZdEZPdUgvb3FNbUlNM0l6TXdJcWdaYURN?=
 =?utf-8?B?cE03VkFPeDI5c2hnUnp1R0xvcnNMSW1sNjBnV21aUStQWEJjUFRxM055ZURQ?=
 =?utf-8?B?dm5udGZxZVdiblhNRDJCaVkxRW82d1JwTHJKNXVST1BHUzBGcGo0MEpMbTI0?=
 =?utf-8?B?UWpyaHNpdTBmUk1GT09oYTh4NllwMlZPNHFSVGZ0QWJ1aUtqUU9MVXYxK3k1?=
 =?utf-8?B?VVFVMEJJcE1MOW1pVjNjbHV0ZldtMU0wa2pvNlFKWUF3eGhHem4ra3Z6OTJh?=
 =?utf-8?B?WHdncStjUEJ6TGpTdkE0ekFkdnY1V3lxMzVHVG83UFpkeitKa25Ybi95TmxP?=
 =?utf-8?B?RnVvb25QVURiVlFnR2FNc2dPRVhRbmp2VzZvNGtaR21uaUhrVnJXUFQ4TlNF?=
 =?utf-8?B?emg1ck9TZ1pxbUQ4U3dPOVVSVit6ZlZockpqWWx2VnQ4WEFORTlkOFp0cGhn?=
 =?utf-8?B?clcwdXE3aC9ibWJWaElRNFZmdERxWlNoM1RPaWluZ0FWd29OWU56b3VybVZP?=
 =?utf-8?B?OEQ5cWx2VWhZZDZZckVBOElaZk8rcnpuTjAyZDhWbHI4RlNiOGM3UkZzblNk?=
 =?utf-8?B?R3dkNWtPYUU2YkNQb1pra2tMMmRWL0NaZk9TSW8zZkZYQXNxVGdvVjlSWm0r?=
 =?utf-8?B?NnRjRVRDVXpmYWZqRHpBR2trYVJwaUlFM3hUdVRZTGxlcnlRRkhTMmJ6bFBW?=
 =?utf-8?B?YkpxeWlmWFl0ZDJndUlVbHJKVWg1eXc5eFlRUkhHRFJuM0hHSk5WVFZ4NDBv?=
 =?utf-8?B?N0hSd1MwaERWYUxiWWR2dkFKSnJNSWpoSVBvajRBeHNjcWhuaEs3UjZOaVdT?=
 =?utf-8?B?bTVyd0pIYmpJeFFONXI1S0x1a0Z1RU5KL1NpQ3JydGJiZkFKb3ZoNkFCekpR?=
 =?utf-8?B?ay9aZDI1VHFWKzRRU0ZoMDA2dmkzNnFOWENEOGNsaE8yWXkvbnVXaDA5TkVk?=
 =?utf-8?B?djVGcjIyRGFLTlNhdzhZY0cxcjFORWZEaU9CVGNPMGg2OWNQSVlMblJzaTBa?=
 =?utf-8?B?Y3JlOGtzckZYM1gyR0UvNDNYTVhSU1MyWEhzREY4MzZscG05aWtBMEdWbTNO?=
 =?utf-8?B?cGwvd0VNeG9vdlBzU0ZrUFVXUUM3TEljM0dvTDQvMG51THBHTlJiV0NUdS9T?=
 =?utf-8?B?SzZFL1ZwME9YanRBL2NNZUlFa0gxSWlrNzh5RjRsY05lV3V5N1BjQXNZcWJn?=
 =?utf-8?B?OFFDN25TL09taGJ3V0FnTE42dTJ5NE1kZTFNWk5xalNaejM5VUwvUXlhNGc2?=
 =?utf-8?B?QzZwdCtrZVZ5M2krV09zdnhzOHZZY3NXYkY2RGpkWkYyV0FhUzNUMVY4Y2dt?=
 =?utf-8?B?Si9OaUZ0REJacXFtcWJhRHdCenZPMDlrekdXaVpwZ2hKMnhMSHUwU0w3OS9o?=
 =?utf-8?B?emV0aWI5OFRPajRQcDRram9XUEZCYmlMTStacFBZQU9aYnorZi9maUxIc2Jh?=
 =?utf-8?B?bVN1NVFuSGFlZ3ZPQ3BFN2Jkb2dqL2NZMTdIbndESEJ4NUZ6YzRkRG1LclNr?=
 =?utf-8?B?TzAyYWQ4Ui9QV05WaXNTSll3UVVQemFQWXNoNUNWYXViNC9ib1A3MWNOMm9F?=
 =?utf-8?B?T01FMEdnQmJQaWswUGNxNS94UUtZcHIrMnlYTTVjLytxK2tBTXZUc0V0OWJK?=
 =?utf-8?B?aFlPVnoveExnbm5wam5LNE9Bak1obzArQVRJTENlamJIL0FLK01OZWQ5WmI2?=
 =?utf-8?B?M3pRSE1NK1lyM0lreVRWRnl3WFBBTnBmZUw2YzAwczJwVldZQWlybUdQUXJ5?=
 =?utf-8?B?V3pGcFFYZDFJV1hlN2xGazhGcHNCdUkzN0xyb0g3b3o3bEZzQ1lIUTNrdWow?=
 =?utf-8?B?bHAybUxMakRSeEFuaEFQUUlvaTRsUlNmNUJ6Mjg4TG51VXFGVXVPand0UjY2?=
 =?utf-8?B?ZGJNMEZ0dGZ6VkluTERZSk9Dc0hjT29kUjhWdFdxa0RpVEhIT3o2WmRBN3FZ?=
 =?utf-8?B?bThJSXA0bmpvZS91T0xsdkhvMFdCQVRUQmZKTTZvcVVFT3hXU2FveDlDb3Q2?=
 =?utf-8?B?bnliTXJOOVZ2UDN3OTVsTGFUeXJhQXBLV2pPd0RHQlp3WSt6c0h4elpzWjQz?=
 =?utf-8?B?M2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 375c7c13-0f45-4a74-ca23-08dda2ddb268
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 20:32:02.3327 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lYerxBrnsTItTlOqOKDHYMS0fQ0kUmejMERaHYEHRj/niktD1oatTRguPeHExGGUPXuRdNDov/fQHqJ5yAIjtfwHXtNDiL/MnsDS1SJNY2c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6749
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


On 6/3/2025 12:31 PM, Summers, Stuart wrote:
> On Tue, 2025-06-03 at 11:41 -0700, Belgaumkar, Vinay wrote:
>> On 6/3/2025 10:36 AM, Summers, Stuart wrote:
>>> On Mon, 2025-06-02 at 16:44 -0700, Vinay Belgaumkar wrote:
>>>> Set GT min frequency to 1200Mhz once driver load is
>>>> complete.
>>>>
>>>> v2: Review comments (Rodrigo)
>>>> v3: Apply Wa earlier so user_req_min is not clobbered.
>>>>
>>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_guc_pc.c     | 5 +++++
>>>>    drivers/gpu/drm/xe/xe_wa_oob.rules | 1 +
>>>>    2 files changed, 6 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c
>>>> b/drivers/gpu/drm/xe/xe_guc_pc.c
>>>> index 18c623992035..cb0563494fcc 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>>>> @@ -51,6 +51,7 @@
>>>>    
>>>>    #define LNL_MERT_FREQ_CAP      800
>>>>    #define BMG_MERT_FREQ_CAP      2133
>>>> +#define BMG_MIN_FREQ           1200
>>>>    
>>>>    #define SLPC_RESET_TIMEOUT_MS 5 /* roughly 5ms, but no need for
>>>> precision */
>>>>    #define SLPC_RESET_EXTENDED_TIMEOUT_MS 1000 /* To be used only
>>>> at
>>>> pc_start */
>>>> @@ -843,6 +844,9 @@ static int pc_adjust_freq_bounds(struct
>>>> xe_guc_pc
>>>> *pc)
>>>>           if (pc_get_min_freq(pc) > pc->rp0_freq)
>>>>                   ret = pc_set_min_freq(pc, pc->rp0_freq);
>>>>    
>>>> +       if (XE_WA(pc_to_gt(pc), 14022085890))
>>>> +               ret = pc_set_min_freq(pc, max(BMG_MIN_FREQ,
>>>> pc_get_min_freq(pc)));
>>> Do we want this above the get_min_freq() call above? Seems like
>>> that
>>> would further limit which is what we'd want in that case right?
>> No, this is during SLPC init, we don't need to read the min freq at
>> this
>> point. We will adjust it later in the flow if there was a user
>> request.

This ensures min frequency is set to 1200. That is required by the WA. 
If there was no previous user request (like before a GT reset), the min 
will be set to 1200 instead of the usual RPe (which is around 500).

Thanks,

Vinay.

> So then what is the purpose of the code just above this?
>
> -Stuart
>
>> Thanks,
>>
>> Vinay.
>>
>>> Thanks,
>>> Stuart
>>>
>>>> +
>>>>    out:
>>>>           return ret;
>>>>    }
>>>> @@ -879,6 +883,7 @@ static int pc_set_mert_freq_cap(struct
>>>> xe_guc_pc
>>>> *pc)
>>>>                   ret = xe_guc_pc_get_min_freq(pc, &pc-
>>>>> stashed_min_freq);
>>>>                   if (!ret)
>>>>                           ret = xe_guc_pc_get_max_freq(pc, &pc-
>>>>> stashed_max_freq);
>>>> +
>>>>                   if (ret)
>>>>                           return ret;
>>>>    
>>>> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules
>>>> b/drivers/gpu/drm/xe/xe_wa_oob.rules
>>>> index 9efc5accd43d..75fbdab68d44 100644
>>>> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>>>> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>>>> @@ -59,3 +59,4 @@ no_media_l3   MEDIA_VERSION(3000)
>>>>                   MEDIA_VERSION_RANGE(1301, 3000)
>>>>    16026508708    GRAPHICS_VERSION_RANGE(1200, 3001)
>>>>                   MEDIA_VERSION_RANGE(1300, 3000)
>>>> +14022085890    GRAPHICS_VERSION(2001)

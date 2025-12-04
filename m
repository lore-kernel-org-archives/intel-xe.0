Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C35FD216A4
	for <intel-xe@archiver.kernel.org>; Thu,  4 Dec 2025 15:53:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 401AF10E204;
	Thu,  4 Dec 2025 15:53:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mQbG3uvv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D43910E204
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Dec 2025 15:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764863586; x=1796399586;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=fxhMbhvktHi8tAOBvJU7F7Pp4c4ctTEqoEAapbERD+s=;
 b=mQbG3uvv4uEkyLRSepm5oG4GXlD0xurmlcuKqUyXTBPDLg9kI36A6q34
 l78NN1DGwaPbzGpJp4XY1bP4P1NsIZxX3jayo+giXMJUrKynxfgvYR0y2
 xCovJ2EE2JpHMMtFNHJvuaVg5gnGP4SIplemwNMyG8lX0dUhMPNYY6A2Q
 RfnxGN1xOAPI8J493l3OtUF4MSrQNjL2dGSiC2RYVgy1q5X4ZxMeJBh7h
 KsI+PMvGODka6RVoj9NbHHmzcxH0Qg81vlG+HbiVFtu+TzrdtgwEduxRu
 M9kaT1ExhD1HpuaR0Xxv1mwqlG0+LY3mr1996wtCCjbP8B01R+NVkepTl w==;
X-CSE-ConnectionGUID: bCUIEEMjRqqXLfBP95dzXg==
X-CSE-MsgGUID: rTaKeMv4TOmGKmAjKv2jqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="84492345"
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; d="scan'208,217";a="84492345"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 07:49:18 -0800
X-CSE-ConnectionGUID: gZHpTeskTCm7UGSZjeOxmg==
X-CSE-MsgGUID: JeOFRDrTSxeUaCrbGBpSUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; 
 d="scan'208,217";a="195825121"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 07:49:17 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 07:49:17 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 07:49:17 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.43) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 07:49:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jy3SjOVg1fIKPU8tnCMm4RMr84nA0jDt8eNX2BxnSvJTYVtE+Eg3pU/9JJ1BJmlBeMvRVSRVpyJjtyvL62qbSktnpfAxs3gB6AviwtS2lN4m7zJ2QgDAp+SxOLFW3A2huR4RudszGU72DXgBR7yF3/JaqtHEucAMAOpj+NsjYwCVutST7jwmme5mcsZuQOws3NxVTNwguwSP2gAID5Kh4+G8kNJfVAGuIs5aNImz9WDpUHuzmAci8hejLvBwudoza1toeS7Lel82YUe0kOHgsyhY3nixJng1RVJxtmfUoOEG3RMwOhccSTPuDXn3pnMVnpLdUavJ16kVA6BvZO59sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hEFvXspJnb879OWtBEmN3d31REHNAPdCkQZqsD7p/Jo=;
 b=k/TusPTihveDV/NPrkoOuy8W6K0kBJLCHflCTjnKelQBQnWPTSq+ZwbbTtyduxlauzW0Y+1Et7vcuqdE01duJlrt/qGUw56xQOnFSl2zYdmczI52RZHWSGZViMXDSYdnx5bItJJS/uhCTUapGubOsc4NXmgTXZ844BqzcPGxscdFleKsLgQK1CM6GazJHWBwAc9fF2rx4xa0px+Ekg1DZvD+1cGVZ7dtmMLOkqcaU8d94t1HB67M56YYD8mtMyHa689gXqiZp9bbZNJHGDTpUl6abLPygicT2aEAFFG+h7sD7R5F6DLIgdqQYBeQysNqFHjvhyuIQ0mCvPg6qB1hiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SA2PR11MB5179.namprd11.prod.outlook.com (2603:10b6:806:112::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 15:49:14 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%4]) with mapi id 15.20.9388.003; Thu, 4 Dec 2025
 15:49:14 +0000
Content-Type: multipart/alternative;
 boundary="------------X6fh8axO6PErEaV0d0M9gH83"
Message-ID: <5835e6ab-95c6-467e-a8b7-ac62610af093@intel.com>
Date: Thu, 4 Dec 2025 21:19:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] drm/xe/soc_remapper: Initialize SoC remapper
 during Xe probe
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <ashutosh.dixit@intel.com>, <anoop.c.vijay@intel.com>
References: <20251203004800.1993258-5-umesh.nerlige.ramappa@intel.com>
 <20251203004800.1993258-6-umesh.nerlige.ramappa@intel.com>
 <aTBuKPcPgZdkCPWO@soc-5CG1426VCC.clients.intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <aTBuKPcPgZdkCPWO@soc-5CG1426VCC.clients.intel.com>
X-ClientProxiedBy: MA5PR01CA0195.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b2::6) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SA2PR11MB5179:EE_
X-MS-Office365-Filtering-Correlation-Id: 79eef256-c8bf-4470-b419-08de334cacb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bFRlbE1QY3NETEZwZnBDRWNSMTI4VUhpOVJ4bmk0cjBrTE5HZGEwMW9BWnZW?=
 =?utf-8?B?Ykd5QkhvYmVaNzZpaDdMTjZQUnJsRXpwamlGQU5KbHFRbkxxWkRCMXRKTk04?=
 =?utf-8?B?QTl0NVordWxtSHhkc3hWdmUrNUx2SER4M05pdTBhWUJBcVlJOW5iVktNMERY?=
 =?utf-8?B?ZmZwbFg4VVF3cVQ3aEI0YnlxVDRlTGZPMVlUa2toWmc2UzFCV1F3U0wzeWJh?=
 =?utf-8?B?Q3Y2R0ZyVnBDNnQ3TWwxcjhkUnFpY1RHT213U2dXM2pTQjk1YTI1eTJWNzlL?=
 =?utf-8?B?Y0dmQml0ektvWTlTZS9CSFE2NmxVMWsrZ2MxdTlDYVlXSWtQRGYrMitpVnFp?=
 =?utf-8?B?dFF4QVF5TTZrbjIrZ2xTclEyeW9nT05oUDkzbWkrZm0vNlNLNUpqZUZOcE94?=
 =?utf-8?B?cWdwbVZKNDdvc1htcWdZSVhUWXpSbW9lcFA4d2lkVGJpbFJoY3VacmRaM2pO?=
 =?utf-8?B?Zm1ENVF4bVpOVGdnNldkK2pUaGthNmxhcFFQaS91d0c5Sy95STlyakpJbzRW?=
 =?utf-8?B?U1BHNm9kYWNZL0NEUEhPbmhOZlpsRGZDanA1eldTSWRsRHd1Qk4xcFZvL2l2?=
 =?utf-8?B?cDJFdTlnY3VXTnpyZmk5cHQ3ZytzVkg5M2Q4UzBPakZrN0hjVmtzTGYrQVJk?=
 =?utf-8?B?Y25UcysvRE5hZHV4c3g1NVBoMGVnN2cyZVVweWdocEdpR1ltMUlEY3BWWUJl?=
 =?utf-8?B?TEREVWs5RHVhdTlmNlBFd3VIUmxad0RhMUw1VTIrckZtUHFjWER1dmVVd21j?=
 =?utf-8?B?UHp4Yk1IbHVvVkF5M05zdXc0R09oZ3NOWklMV0JGMEQrOG5KL1F3L0lEa2tO?=
 =?utf-8?B?d3FzaWhVWEdKeHVEa0N2aWlsM2l2ZkJKUC9MeUU5M1J0ajRYYmVRR0JZSjBI?=
 =?utf-8?B?elF5dElwN3UvcElqam1hNTNWeEh4c3VDVTdsL0xCc3Q1dFFKTGNJckFnVjZP?=
 =?utf-8?B?R0JJWEE4NWFmOXhHQlVqWnBwa1lGYzV6Q3JIbDJWT2N1YmswL3psd1ZhSnl1?=
 =?utf-8?B?dkZqUmJCbVE4S1ljZkp3RWthcEZuQ0piUk16bnMvN3czQ0dzTW5HRzE3eHRy?=
 =?utf-8?B?Z3NUdWQ0YThkZzkxTFc2QUZmQk5CR21RdTMyNnFxSnNqdkRQUitZZjlPNjht?=
 =?utf-8?B?ZGxMM0phNk5rbVR2Ujh2QXdVWC9iN3hxMEdmazNid0N6UUNuTU5RK1FEMkRr?=
 =?utf-8?B?MXRzemREclJKVW53SWRMVUo0ZVpoU3NNcjNtUUc0eTVjQzVpRTR6bTlCQjY5?=
 =?utf-8?B?MmdrSFlzaUJ5ZloyZmloUXJTU054ZUc2SHlQMUJ6TC9RY3ZSZW1YdlRabW5M?=
 =?utf-8?B?VGVFNm54L0wyV2U1eER3UVV5enhhQW1PbUlhRFdJUXkwMk5oMnU3UTlPNjZ4?=
 =?utf-8?B?NUZMSjhZRWVEQlI1MnRvSmtGWVJnZy82SDRzT1cySEhJNVU3dHZicUJKMWky?=
 =?utf-8?B?Ui94bndmbExBaGkwRHhvSDEwUUZLVXpiZmprZjNVcVcwVTF1MkFKV3JEN0JQ?=
 =?utf-8?B?VE5uSXhRa2x4azVSQ2dRNFE3OGowQjZoaEppMUF1VTBWWVJoQzNCVnVwVzVP?=
 =?utf-8?B?Wm1jRVBjSjdTQncxY0R1Vk93d3c0djZZN3Q4NnJVZDdFYUpjajAvTFFIR3Mz?=
 =?utf-8?B?K04yVWc5SHAvUFRJTFFtK2lmcTlvTnhsZFZIdlBHYVJxakJZSnUybDQwdTFs?=
 =?utf-8?B?VW9KMW5lUEliTTU1RmNjVWhjalRGeDBqaldxRU1EWGg5QUZtT2JyUmgxT1JV?=
 =?utf-8?B?TDRmRWgyZ1NUWkI4eGVVbG41WklNMmFkRFpIUVNZZUx5THB5WmEzME5uZnYr?=
 =?utf-8?B?aGxOUnVlTVc4bER5bkJYeDBIdUNsa3hFNDBpWms3TGRFRWZIeThrYTkxQktG?=
 =?utf-8?B?SjIrMDhvaU1TUlozUjFJUXBsNGFpakNreU9tZHhCd0tNOUpVSVRST1ZnQWNS?=
 =?utf-8?Q?VsHzW9QezNZNMizzqQHrS5QiFAE4IqAb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHhaelhuTHllcU5HT3NKZlBkZk13cXZ2RFlLYk5NUjgzY3dELysxcUdaRUZu?=
 =?utf-8?B?QVlsMktzbnI0WUtLRGxpRms3bUhERWhSOU85Y2xSTjNOdE1WZDV6eEY3OFhy?=
 =?utf-8?B?OG1XOUxkUTZOMXhhL3lpYm1IY0EzcVdGbnRUSHVydjh2aEhDQlphZkRuUDlW?=
 =?utf-8?B?Ry9oUisvVXJBM1UydnpmQnY4bnoyQ2YvZjBLazNVYkt0Z2JiU0IveDhxeHND?=
 =?utf-8?B?UElZSlF4VmVaUlp6OWRuRFBocXFSNVJUTGVSZTZxSElSVUV6d2ZXbDh0bVFp?=
 =?utf-8?B?UjR5aHVWMU9LZHd0NlgyT3cyeC9PN21VMkx5SytqWUh0V0RUdXNaUTZhVjhN?=
 =?utf-8?B?VDg4a2EzU2NDcHhQbkdPeTVONzk0UE9KeWpzTW1tWWVocFVrWTdwdWsvV3Ns?=
 =?utf-8?B?akFPZitPZVZOQ2xBelBsUDBvRlZ6UWZjL0paaFUyTks3YS9sZnVkbjZZbm9W?=
 =?utf-8?B?VXNmMkZCZWMwMkE2VjhzbXpmdXR2Rjd4UFFzVHcvSVhjZjdoYzlwODhia0t2?=
 =?utf-8?B?Rm1VKzl6d0FkUzNGemRMblpKaE1ianl2blBJYWh1THBMSmVLbUZ2R2JEcjFm?=
 =?utf-8?B?Z0d6Z1ByeUNZTElJSUNjcjhvdHhLVUtEVWp5NGxSa3NlcnFGUkNiTllSZU1a?=
 =?utf-8?B?cXZ2NWxPNkJxOXRLUy8zNjB2amUzQlF5RjRCTjJhcXFOOFR0ZEdvS282ZEVS?=
 =?utf-8?B?ZVZQZUFZZUZjMW51aXhBNUlvL3VzZkFNcnFCaXdiZVNRYTk3RU9QanFhbDdP?=
 =?utf-8?B?UkxoZmJGT2QwUytzLzljSUw4cWcvYjBYN1VaMXM0SEtnNXF3L25vV3dkQ1h1?=
 =?utf-8?B?VWNmVVorMVBRWFh3T0E0VXVXVGVEdGxzUk43N3RlOUZOTlhnWFNua1hoalZi?=
 =?utf-8?B?ZVFQVlN0dWVzcDBFdlp3RE9BODkvblZiQUwxTFkvREw0ZjdtNWRwNXFJY24w?=
 =?utf-8?B?czRuSk1vWTdCR0l5dFBNN0crR2pLQWdkTTlHNXcyU2NOVmRzZFJ4bDUvcTJV?=
 =?utf-8?B?Wjl6M2FtMWw5WWVFVHlDUmt1Vy8wTlVOT3hQSkREbEQzMVVHQWhBOWJSQW8r?=
 =?utf-8?B?d3p1TlN2SFJFeVF0QmN1b1ZUV3AxNlAzbUVRV0FwNklXLzFSUUd1TkpjY0V5?=
 =?utf-8?B?anNwS0Y1MmNiTnhEVjNLbjRYdFROSFdKNExaNDVGc2Z0NVRTd25SbE1ENzNY?=
 =?utf-8?B?UlBQTW9Ca2VQazFCcWRpeGNNNjJLTFMvVHkzODJ1TU9aTHF5bVhxM2JsOSth?=
 =?utf-8?B?a1A4cUFTWnBzbnJlNFlKazdvOXdYc1k5ZXpiV1QxeDZIRnk2V1ZTaS9ZRE9J?=
 =?utf-8?B?eXdnL2FwSFZXM2hEUFJXNFVCLzlTYTdQRWtSTEN5Mk1xOHVxM04rbU4xdlFE?=
 =?utf-8?B?VWFwVXNKaXVBNGlDSm95OW5rVHlEY1I0Z0R1ektuekh0YzNlTXhDQ25LVW1y?=
 =?utf-8?B?QldpdHpSWWdmdkl4elBOczJXaFNiMlZNeUx2czE3MjBld3duSW9ET000M0Ey?=
 =?utf-8?B?WmtMcXU2RE9nTWFWK09RYXQ4SHhRL3JpaDd3N0FxZFI4VTREN2tGM201OUN0?=
 =?utf-8?B?S25vZnI3ZFhRVldISks1VW1CaG5sZCtrMzA0MEhvcTY0UnpHTHpjbTBWOUNx?=
 =?utf-8?B?aWJTMU12NXlLeXRDdU8vcWV0eWpSZ2N5eFpHS1UyLytmR3FUT1RSdUd6ZUc1?=
 =?utf-8?B?bitSUkUxbzJnN0Q2cnZ3Um1CVUtEMy9DUlZjRU5FNEU4OEM2eWo0UExsS3Zy?=
 =?utf-8?B?bWhxTXNlR2l0SGtrZXc2eEpSY0FVQjZpZ3pud1ZybUg2Z2FpNVRrb2tOaXJy?=
 =?utf-8?B?YVhhS0p1SHd4ZTBVcEtuTXpuNk9Hbmp0R2lyMDMvZXhPZzJZOFYwL0pQMzlx?=
 =?utf-8?B?eFhYUG92WGVlU1lwQjNwSEUyd2tmeTFYblAwZEQySlhnSVV6aW9vMDRUYUF5?=
 =?utf-8?B?a0tSNXplaDcrSkUvN3JyeUlaT0hsbjMzbTQ4amZSQjZhbUt3dHRCeEVsSWJa?=
 =?utf-8?B?cUZ6VDdXK3dXR1RIc0JZUDVrdnFNZTg2dFlTdmROVHR5dDV5Y014ZEF4WVM1?=
 =?utf-8?B?MG4xTytHd2JFd2tQV1RVUkhhNlBZUm9FRldRa3RqZGxvU0M4Z25ib2oyRTNI?=
 =?utf-8?B?VHdUUUpCSnl5SmIwZjh0NEtSM3VhTWZCNzZCcVpTRGtCcUd6U0pERVZRY0JC?=
 =?utf-8?B?alE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 79eef256-c8bf-4470-b419-08de334cacb1
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 15:49:14.5096 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oQT51+NiB7SgQ8Lx9dhtlUYTrnd/+9Nqd8Rw39o7kCIyg9tcllCwM149GS/dL/EBxOLPKaT5iHnWfK5+/FtY6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5179
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

--------------X6fh8axO6PErEaV0d0M9gH83
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 03-12-2025 22:36, Umesh Nerlige Ramappa wrote:
> On Tue, Dec 02, 2025 at 04:48:02PM -0800, Umesh Nerlige Ramappa wrote:
>> SoC remapper is used to map different HW functions in the SoC to their
>> respective drivers. Initialize SoC remapper during driver load.
>>
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> ---
>> v2: (Ashutosh/Lucas)
>> - s/remapper/soc_remapper/
>> - return status from init during probe
>> - reorder patches 1 and 2 from earlier series
>> - fix copyright year
>>
>> v3: (Michal, Badal)
>> - Kernel doc fixes
>> - Alphabetical order for headers/objects
>> - Add has_soc_remapper
>> - Drop unnecessary headers
>> ---
>> drivers/gpu/drm/xe/Makefile          |  1 +
>> drivers/gpu/drm/xe/xe_device.c       |  5 +++++
>> drivers/gpu/drm/xe/xe_device_types.h |  8 ++++++++
>> drivers/gpu/drm/xe/xe_pci.c          |  2 ++
>> drivers/gpu/drm/xe/xe_pci_types.h    |  2 ++
>> drivers/gpu/drm/xe/xe_soc_remapper.c | 24 ++++++++++++++++++++++++
>> drivers/gpu/drm/xe/xe_soc_remapper.h | 13 +++++++++++++
>> 7 files changed, 55 insertions(+)
>> create mode 100644 drivers/gpu/drm/xe/xe_soc_remapper.c
>> create mode 100644 drivers/gpu/drm/xe/xe_soc_remapper.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 0eadfeda67d9..06c3987afd4c 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -115,6 +115,7 @@ xe-y += xe_bb.o \
>>     xe_sa.o \
>>     xe_sched_job.o \
>>     xe_shrinker.o \
>> +    xe_soc_remapper.o \
>>     xe_step.o \
>>     xe_survivability_mode.o \
>>     xe_sync.o \
>> diff --git a/drivers/gpu/drm/xe/xe_device.c 
>> b/drivers/gpu/drm/xe/xe_device.c
>> index 92f883dd8877..b54fc5852fef 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -61,6 +61,7 @@
>> #include "xe_pxp.h"
>> #include "xe_query.h"
>> #include "xe_shrinker.h"
>> +#include "xe_soc_remapper.h"
>> #include "xe_survivability_mode.h"
>> #include "xe_sriov.h"
>> #include "xe_tile.h"
>> @@ -906,6 +907,10 @@ int xe_device_probe(struct xe_device *xe)
>>
>>     xe_nvm_init(xe);
>>
>> +    err = xe_soc_remapper_init(xe);
>> +    if (err)
>> +        return err;
>> +
>>     err = xe_heci_gsc_init(xe);
>>     if (err)
>>         return err;
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h 
>> b/drivers/gpu/drm/xe/xe_device_types.h
>> index 9a9a8eb84a78..450fe703a3b9 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -315,6 +315,8 @@ struct xe_device {
>>         u8 has_pxp:1;
>>         /** @info.has_range_tlb_inval: Has range based TLB 
>> invalidations */
>>         u8 has_range_tlb_inval:1;
>> +        /** @info.has_soc_remapper: Has SoC remapper support */
>> +        u8 has_soc_remapper:1;
>>         /** @info.has_sriov: Supports SR-IOV */
>>         u8 has_sriov:1;
>>         /** @info.has_usm: Device has unified shared memory support */
>> @@ -555,6 +557,12 @@ struct xe_device {
>>         struct mutex lock;
>>     } pmt;
>>
>> +    /** @soc_remapper: SoC remapper object */
>> +    struct {
>> +        /** @soc_remapper.lock: Serialize access to SoC Remapper's 
>> index registers */
>> +        spinlock_t lock;
>> +    } soc_remapper;
>> +
>>     /**
>>      * @pm_callback_task: Track the active task that is running in 
>> either
>>      * the runtime_suspend or runtime_resume callbacks.
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index 75e3588242c7..ec0fed691fa0 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -413,6 +413,7 @@ static const struct xe_device_desc cri_desc = {
>>     .has_flat_ccs = false,
>>     .has_mbx_power_limits = true,
>>     .has_mert = true,
>> +    .has_soc_remapper = true,
>
> Needs to be enabled for BMG also, hence the BAT failure.

We should use has_soc_remapper not just for protecting spinlock 
initialization, but also for guarding soc remapper accesses.

Since there are two soc remappers—SC and Telemetry—we could update 
has_soc_remapper to use 2 bits (u8 has_soc_remapper:2), and set only the 
relevant bits in the platform descriptor. For example:

static const struct xe_device_desc bmg_desc = {
     .has_soc_remapper = SOC_REMAP_TELEM

static const struct xe_device_desc cri_desc = {
     .has_soc_remapper = SOC_REMAP_TELEM | SOC_REMAP_SC

If we prefer a true/false approach, we should use two separate flags: 
has_soc_telem_remapper and has_soc_sc_remapper.

Thanks,
Badal

> Umesh
--------------X6fh8axO6PErEaV0d0M9gH83
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 03-12-2025 22:36, Umesh Nerlige
      Ramappa wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:aTBuKPcPgZdkCPWO@soc-5CG1426VCC.clients.intel.com">On
      Tue, Dec 02, 2025 at 04:48:02PM -0800, Umesh Nerlige Ramappa
      wrote:
      <br>
      <blockquote type="cite">SoC remapper is used to map different HW
        functions in the SoC to their
        <br>
        respective drivers. Initialize SoC remapper during driver load.
        <br>
        <br>
        Signed-off-by: Umesh Nerlige Ramappa
        <a class="moz-txt-link-rfc2396E" href="mailto:umesh.nerlige.ramappa@intel.com">&lt;umesh.nerlige.ramappa@intel.com&gt;</a>
        <br>
        ---
        <br>
        v2: (Ashutosh/Lucas)
        <br>
        - s/remapper/soc_remapper/
        <br>
        - return status from init during probe
        <br>
        - reorder patches 1 and 2 from earlier series
        <br>
        - fix copyright year
        <br>
        <br>
        v3: (Michal, Badal)
        <br>
        - Kernel doc fixes
        <br>
        - Alphabetical order for headers/objects
        <br>
        - Add has_soc_remapper
        <br>
        - Drop unnecessary headers
        <br>
        ---
        <br>
        drivers/gpu/drm/xe/Makefile&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 1 +
        <br>
        drivers/gpu/drm/xe/xe_device.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 5 +++++
        <br>
        drivers/gpu/drm/xe/xe_device_types.h |&nbsp; 8 ++++++++
        <br>
        drivers/gpu/drm/xe/xe_pci.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 2 ++
        <br>
        drivers/gpu/drm/xe/xe_pci_types.h&nbsp;&nbsp;&nbsp; |&nbsp; 2 ++
        <br>
        drivers/gpu/drm/xe/xe_soc_remapper.c | 24
        ++++++++++++++++++++++++
        <br>
        drivers/gpu/drm/xe/xe_soc_remapper.h | 13 +++++++++++++
        <br>
        7 files changed, 55 insertions(+)
        <br>
        create mode 100644 drivers/gpu/drm/xe/xe_soc_remapper.c
        <br>
        create mode 100644 drivers/gpu/drm/xe/xe_soc_remapper.h
        <br>
        <br>
        diff --git a/drivers/gpu/drm/xe/Makefile
        b/drivers/gpu/drm/xe/Makefile
        <br>
        index 0eadfeda67d9..06c3987afd4c 100644
        <br>
        --- a/drivers/gpu/drm/xe/Makefile
        <br>
        +++ b/drivers/gpu/drm/xe/Makefile
        <br>
        @@ -115,6 +115,7 @@ xe-y += xe_bb.o \
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;xe_sa.o \
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;xe_sched_job.o \
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;xe_shrinker.o \
        <br>
        +&nbsp;&nbsp;&nbsp; xe_soc_remapper.o \
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;xe_step.o \
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;xe_survivability_mode.o \
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;xe_sync.o \
        <br>
        diff --git a/drivers/gpu/drm/xe/xe_device.c
        b/drivers/gpu/drm/xe/xe_device.c
        <br>
        index 92f883dd8877..b54fc5852fef 100644
        <br>
        --- a/drivers/gpu/drm/xe/xe_device.c
        <br>
        +++ b/drivers/gpu/drm/xe/xe_device.c
        <br>
        @@ -61,6 +61,7 @@
        <br>
        #include &quot;xe_pxp.h&quot;
        <br>
        #include &quot;xe_query.h&quot;
        <br>
        #include &quot;xe_shrinker.h&quot;
        <br>
        +#include &quot;xe_soc_remapper.h&quot;
        <br>
        #include &quot;xe_survivability_mode.h&quot;
        <br>
        #include &quot;xe_sriov.h&quot;
        <br>
        #include &quot;xe_tile.h&quot;
        <br>
        @@ -906,6 +907,10 @@ int xe_device_probe(struct xe_device *xe)
        <br>
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;xe_nvm_init(xe);
        <br>
        <br>
        +&nbsp;&nbsp;&nbsp; err = xe_soc_remapper_init(xe);
        <br>
        +&nbsp;&nbsp;&nbsp; if (err)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return err;
        <br>
        +
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;err = xe_heci_gsc_init(xe);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;if (err)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return err;
        <br>
        diff --git a/drivers/gpu/drm/xe/xe_device_types.h
        b/drivers/gpu/drm/xe/xe_device_types.h
        <br>
        index 9a9a8eb84a78..450fe703a3b9 100644
        <br>
        --- a/drivers/gpu/drm/xe/xe_device_types.h
        <br>
        +++ b/drivers/gpu/drm/xe/xe_device_types.h
        <br>
        @@ -315,6 +315,8 @@ struct xe_device {
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u8 has_pxp:1;
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /** @info.has_range_tlb_inval: Has range based TLB
        invalidations */
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u8 has_range_tlb_inval:1;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /** @info.has_soc_remapper: Has SoC remapper support */
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u8 has_soc_remapper:1;
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /** @info.has_sriov: Supports SR-IOV */
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u8 has_sriov:1;
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /** @info.has_usm: Device has unified shared memory
        support */
        <br>
        @@ -555,6 +557,12 @@ struct xe_device {
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct mutex lock;
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;} pmt;
        <br>
        <br>
        +&nbsp;&nbsp;&nbsp; /** @soc_remapper: SoC remapper object */
        <br>
        +&nbsp;&nbsp;&nbsp; struct {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /** @soc_remapper.lock: Serialize access to SoC
        Remapper's index registers */
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spinlock_t lock;
        <br>
        +&nbsp;&nbsp;&nbsp; } soc_remapper;
        <br>
        +
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;/**
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; * @pm_callback_task: Track the active task that is running
        in either
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; * the runtime_suspend or runtime_resume callbacks.
        <br>
        diff --git a/drivers/gpu/drm/xe/xe_pci.c
        b/drivers/gpu/drm/xe/xe_pci.c
        <br>
        index 75e3588242c7..ec0fed691fa0 100644
        <br>
        --- a/drivers/gpu/drm/xe/xe_pci.c
        <br>
        +++ b/drivers/gpu/drm/xe/xe_pci.c
        <br>
        @@ -413,6 +413,7 @@ static const struct xe_device_desc cri_desc
        = {
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;.has_flat_ccs = false,
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;.has_mbx_power_limits = true,
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;.has_mert = true,
        <br>
        +&nbsp;&nbsp;&nbsp; .has_soc_remapper = true,
        <br>
      </blockquote>
      <br>
      Needs to be enabled for BMG also, hence the BAT failure.&nbsp;<br>
    </blockquote>
    <p>We should use has_soc_remapper not just for protecting spinlock
      initialization, but also for guarding soc remapper accesses.</p>
    <p><span style="color: rgb(13, 13, 13); font-family: Inter, sans-serif; font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Since there are two soc remappers—SC and Telemetry—we could update has_soc_remapper to use 2 bits (u8 has_soc_remapper:2), 
and set only the relevant bits in the platform descriptor. For example:</span></p>
    <p>static const struct xe_device_desc bmg_desc = {<br>
      &nbsp; &nbsp; .has_soc_remapper = SOC_REMAP_TELEM&nbsp;<br>
      &nbsp; &nbsp;&nbsp;<br>
      static const struct xe_device_desc cri_desc = {<br>
      &nbsp; &nbsp; .has_soc_remapper = SOC_REMAP_TELEM | SOC_REMAP_SC&nbsp;</p>
    <p>If we prefer a true/false approach, we should use two separate
      flags: has_soc_telem_remapper and has_soc_sc_remapper.</p>
    <p>Thanks,<br>
      Badal</p>
    <blockquote type="cite" cite="mid:aTBuKPcPgZdkCPWO@soc-5CG1426VCC.clients.intel.com">Umesh
      <br>
    </blockquote>
  </body>
</html>

--------------X6fh8axO6PErEaV0d0M9gH83--

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48614CA1005
	for <intel-xe@archiver.kernel.org>; Tue,  2 Sep 2025 17:02:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F39B10E7F9;
	Tue,  2 Sep 2025 17:02:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fCZmC/Wp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AECF510E7FB
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Sep 2025 17:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756832558; x=1788368558;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=E1sKwHaQBgnJqnPYOGUc0KYcrzITQEJVZfhKUqE+6go=;
 b=fCZmC/WpIQpr0COrzeGxgwHljb0nFRC4kBhs2OqRqhKK/yMwxh1u6JcE
 zcG3mfxbK42xvVsrSAOG/ZfGy8Qc99Iz0Uv9X1u0JqX3kSC8kT6hveRtJ
 n60HiydhQfnWq1FYMDx4vs9L45Ta7iNaJfV5nes1Hj+r1u6v0z+0oqiUx
 1pNyS51L5ST4Zus7t4/08yCB5+zbu+CnwD8ZZrWac4TA3o3Mr4Ds2Y4Gn
 pdDr5lieqLPD95uoMetOIw8zxtQWzaFpXNIckaeLxsJnLf3KZmMAlYWjr
 ctd80PrafJW2yF8HZbSStac5P1BSdinmc00vvOB1Rs1nbLPo3Pstv+F/I A==;
X-CSE-ConnectionGUID: uBwrTptyRRuoQXN4dYDxFg==
X-CSE-MsgGUID: LuZItNiVRlCHdfqxUelcbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="59254125"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="59254125"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 10:02:37 -0700
X-CSE-ConnectionGUID: 02JtUe9WQIOXBCizyxjWJA==
X-CSE-MsgGUID: 8zCbkzqbT3iVKpYM2nU+Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="170899855"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 10:02:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 10:02:36 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 2 Sep 2025 10:02:36 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.59)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 10:02:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MiV+j1Tz3slUZChPUAH97W4sCoxk+/CLCc2dOss3PIXXjObMwggcr+uDzqcovDKoL9ivmlava9uNzzkAXeWg87R1KbOAOGCZJ2ts4oPWwbNGL1NM5Ho/b3KHBhudFoE+Eay9YGlVDN/o2wdoVTJsjUn+VIVM8EH8Dc59peV3hko77Qul8sT1aAVVg5xWJTf+6Eq5F8MwQqWH9GvJ2+6CThVRWosD0ga6LdeszUnopW7LGA5s84uRzs5bEUuVMezd0l287pw1HVKwxzNSOmMFOfCsYSEWyFGMoCX58Kjmf0qXfEuxK/MRVOJXPnV5FIlY0+T4gmKWsa4mMaQ5CcG7Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Yc/EXk0QYtTUTw20QZMut8lOvR/baDEja0cUx/lK8M=;
 b=HZdDdDwCGWFPu+OQMdBXLxoJHMNFy+hg8PS413ukJIYP/XEpXgvlDGFW2TY8Vy77PBlEQ+Snab2LW/NI3q1ZwSpwLtC+pR7Vizb8sfpZWCc11XXsnLQOBWfRpMzun28DfN2lfBykeE0E2ndbwXkzV7+G/+40vz643jujup8tUF1BVWSJP1C+L+jBHsvZKnfCI1xsDZNqm708RtF2TET6pISnXmXZ0qFtbsA2WgGd5cOE+8+Pp35hfmtpapcAkL9ZvEU62iZ016Up0lM/Sh02cFvNt9d/uCtxnwgUv/PgpBvs3OxcW2Z8UB8FqZ8wa6rTEoOYQ0aBOxfTl7OmebLPCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by LV4PR11MB9513.namprd11.prod.outlook.com (2603:10b6:408:2e4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 17:02:31 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%2]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 17:02:31 +0000
Message-ID: <56b52ead-ff9d-43ca-8b71-6733e683e148@intel.com>
Date: Tue, 2 Sep 2025 22:32:24 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBkcm0veGUvdmY6?=
 =?UTF-8?Q?_Enable_CCS_save/restore_only_on_supported_GUC_versions_=28rev9?=
 =?UTF-8?Q?=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20250902103256.21658-2-satyanarayana.k.v.p@intel.com>
 <175682018917.293979.14442559867950192248@1538d3639d33>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <175682018917.293979.14442559867950192248@1538d3639d33>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0065.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::9) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|LV4PR11MB9513:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ddddfc4-0a28-4c11-ed6a-08ddea4280c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vm9rUllLM2xyc3NnQWhLVkdhMStUemxPdzVCNjExOTFyL0d3Y1hSRzNqL0t3?=
 =?utf-8?B?VDgvNXpWaHN4Ulo3TXUxN2sxWHZlWjZVOXJoazVLTTJEc05ldERQN0hzQUh1?=
 =?utf-8?B?WmFMU0w0YjJ6K3JrcTBsYUNBTkhhdU9uaXkydlJVVHRKckdmWnVYV242QWpk?=
 =?utf-8?B?Vk9YZ2NORVBMRzdDUE9Bcng0WWZQRzJNalRyc1JBR05XeDg3Um5LNVB2S2Nk?=
 =?utf-8?B?WUlYV0gzTUUrY2xIZHd1WDRtV08wZmswUTBORlpJdnNUMTBRM1ljSi9FRzdu?=
 =?utf-8?B?aXJpMWdxMVB2bmNzQklGc21Fc09hWEJnbnZnZSs2aXRBWXhLdElTaGNoNDdP?=
 =?utf-8?B?S0VJZ3cvMkUrNllldGFpSkxCaDVvSGltVHlUdlB0a0pEeTZ0Z0c4VkFtMGN6?=
 =?utf-8?B?T01tZ0ZEZG9Qc1p5YzNJWlhTU3p4WGdNL2Vjc2RxT29GY25QUkJHbGZoSEJh?=
 =?utf-8?B?RkxQV2tyNms5Y0hHMm1aV1p1WVd5MEhaTFhpNmF3S1hnS1lTcit6VFpzNG1G?=
 =?utf-8?B?ZWU3T3pwZUpVbFFQRE5sODJXL0hYSHVmb0dRa21EbDBTR1RtbU5lNllQYXpG?=
 =?utf-8?B?OVRwYS9KSkNQc2s1SytlMTZnc3JLNTNWVExteGRXSVVwYjgvaDdTRlc0Qnlu?=
 =?utf-8?B?ZHlOV01YWWlUME1zSlp1cFdPQ3dyUG03MGZKRmovL01QZjR4Zy8zZ01SMGcw?=
 =?utf-8?B?bTN5czFvd25xOHU2TzJrNERTa0taUmo3WlZRYnllZ3RFeFhsRmd2eCswMG44?=
 =?utf-8?B?VGVpSXJneE1lT3pPNE14ejFjTysxYnlmazlDZ2ZaTnRUeThZVUhPT1d4bitT?=
 =?utf-8?B?M0F2OVUvdXFsNi9ybnBSczJsSHFtdVg1ZkRWQXBJUGh4OExZSXdnQjBSbWlT?=
 =?utf-8?B?WUxrS0lldkpwd0x1TXdkSVBuVmpqVWZMaERSakhxbUlDb1liWk9ickRNWVFo?=
 =?utf-8?B?cWUzdDYrSFpUM2daUzBPSlI0cGMxd0FNdkoxOHNWYW8xTWNzNW5rYy8xRk9M?=
 =?utf-8?B?QjNyb0hhQnh3bDFjM0hRSGdQUDVYdXFjMC9PdGdUSmVJSTNaVzAxY2NsUVE3?=
 =?utf-8?B?M0IrdmJkc1crcjZSeW85S29xaG1STE1sZnkvWVM1OUR6TlZDWWhoYzd1Rlgy?=
 =?utf-8?B?RFNaQmZZaEZuQmFmRzZOeDBiS25jOExpZE9uL0lCd3hhWTRkU3NiSllhd3ZZ?=
 =?utf-8?B?Q0t1LytFTjBKVktVQkVHZU5IcDVJSXBmbUNsK1RPSjNPaWVhZnE0dHZXT01X?=
 =?utf-8?B?a2tNbE14QmcxMDYvZGhwRzg1WGlKdmlpUlg1STVCRCtmNHJxd1lRZFQ5MndC?=
 =?utf-8?B?MmVTeitmSXI5Q2d1Rk1pVTVDK0ppK2lGS2JyV3ZQQ1pNcFAwK0RmOHZ5Yks3?=
 =?utf-8?B?VjJ1ZjFRbCtwOU1iZWJIcTg0NC9Td2M2bTRvN3dCT0pMbFh0b1ozR0tNelUv?=
 =?utf-8?B?Q25RMDJVamxzMkdmUFJLbERNa0U4YUFvVlN0N2VmcnQ4TWp5d09aL0ZXa0Vv?=
 =?utf-8?B?R2hJTWZwVkR2bXBpQVlIYnYzejYxb0VZSStlamRPWXg5TS9MNWZFdzhWY3hr?=
 =?utf-8?B?SXRPdHNLTllDRWhNODRKRmZxL2dxajlJQUdRVlNObWs1cGdOZjVIWjlCNzQ5?=
 =?utf-8?B?ajNENWFMZ0VYMUhvQUxlT3NoczRlNnZSSkdGYlpRT29XeWhibEhQYzlCUnNM?=
 =?utf-8?B?ZjZ6dnBKUG9ka2tpK1pQKzJ1OXNXV3BnTXpDcWJJOHRVVzY1ZUszWUpEZ1Z3?=
 =?utf-8?B?ZjVQTENabnpiS3FhVFR2RWdSSTFubCt2d0xvbVhUL2FlTExFaVpHREJiSVhD?=
 =?utf-8?Q?/H2PxuwdDfcT4O8gU0vM3z0uPrC6eduvFnlqk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2RoazQwb1lhbXU1ckpzbWpFY0R3aERlV1VQeFZtZDM4UWs5L3kxbFRPK3Bp?=
 =?utf-8?B?MG1taDUrdUtkZklHRGFzYjdkdUluazZBblZ6d2hicGVGY003ZGpMTjk5eHlR?=
 =?utf-8?B?UmEzdnlmSTNDWEphK2xvcSs1WEFIUllMaFFYUEtKeVFCV3Zvb2VEMkRpMDJF?=
 =?utf-8?B?OU1pMXZSczlBbEhKTzJjU3pWOWROMnlScjZJeC9MaFpDdnBJdnlSVE9tQjBB?=
 =?utf-8?B?MDNidkJXRnZHV1laUHYxVlpySnYzSVRTb2xiNlR5bmZVd2w2Rmh6NmFjQ0pI?=
 =?utf-8?B?UGJXWjNHQk5wekROOVRib1MvL1A0ak04SW4vYitHWjlLRld2OUNjUlE3bjJ5?=
 =?utf-8?B?NzFqdGZXODg0eVRPS3lnWHNXQ2JZMXczVjVoWXhIYkRBUVhIVS9scjQyMXNN?=
 =?utf-8?B?WkI1WFBGRmhKNENaM3hlRGNYaHRMeGxQeWlhcjRVVXBmaHpnb1VhNlh4ZFZh?=
 =?utf-8?B?Z0hObExna296dDJlaVd1RTVsME1lc1dicU4yR0hyM1hJYytxR0hmQnZMREUz?=
 =?utf-8?B?UHVOZUdWUy8vbGlwa01YMjNqbERITlN4OHU2Q1ZXU3o5dENDd2IyTlRjYVBU?=
 =?utf-8?B?eldEcXBhby9BOGtZWUhYU1NkeEVscVRGcFR1MHNSVnFBVWRESThON082MCtF?=
 =?utf-8?B?YVB6d3lWOUNWTlEzeWRjU0F0Tjg0R2ZSL1Z6UHJqaDd1Smt5ZkVuTWJMazVk?=
 =?utf-8?B?RFVOMVI5enRkRDBLMUtNSVJWaW9CUzVoeDFjbXFiWDhlTnB4NzNEVVlMOExm?=
 =?utf-8?B?SllMZzhYcWxueHJ5MHk3MGNiSUdmKzdmVlhaVVIrcU9RMnNXcE93L003QkpL?=
 =?utf-8?B?YlBBa1FiaHlMMXdzQW9ZM3JJRkpud3I0allkR2U1MkpxallwUit0YXlmM2Vq?=
 =?utf-8?B?M2ZJQmFiRFVpT21xVm9FK1g1QWtKU2N3ZGdJQkt5WEtVd2M0NWlEanlFUnVP?=
 =?utf-8?B?WXV3SW4vcTF2b3M2bFhJV2p5ZnNHRnRpSFFMSnh0ajI3Z0F0MlBhWm9NcVQ1?=
 =?utf-8?B?cndnRHJKUHlLM3dhc3dNc05nelZYbGNyVTNoMHR5ZnJtTW9nM1Y1TWpCR1pl?=
 =?utf-8?B?WlpqUi81SENjcE8vV1U2OWk1dllvb3ZIeTkxYWxadFBtMU9WRGtlL3NreWVJ?=
 =?utf-8?B?cGpOeXUzaS9xeXcwWEVoNnFFUytieHc2MytPemZhY2hEMGlvVXE3THVrV3dF?=
 =?utf-8?B?Zjl4Y29QNllZQkN0Uy92QU5rQ2ZncjdSYlYvWXZWYm4vbzVKbnIxQkdKcDg3?=
 =?utf-8?B?TVllM1BZb1VWbGVwc20xVWU2dzBWbjFLN0xCdFFIMCttOE9tRzhWMWJQNEZO?=
 =?utf-8?B?L0hCbGtlZkM2TC9IZndDTFZxcnRVeitGTFdvTDdNYVhieHFJTXNXTiszTk01?=
 =?utf-8?B?YkNSVWxkZkVWT25xR3BMd1I5RGFwbGx6S1FWdG1qOENjb2hNUFVQR1NaSjB4?=
 =?utf-8?B?dVZRQ25xdjkzM25zdHp3eGhDMktEK1FDQ3N2dFdjNE5WQmE4YUJOTldqYTRW?=
 =?utf-8?B?YXdybjEyY0JlL3o4Q3NjMm9nSjEvcDBCb0t5alVqOVlkUUNaTXRva29HaC96?=
 =?utf-8?B?UWNzTTJxK2dvVFVxTjRTS0p5NEZWdmY0KzdxUExubXlIK1FBUWg2RjJSTUlE?=
 =?utf-8?B?OTBVTGx6R0RINHBKY25Zb2llS1BUZlJvZHErUkFGOXJmZFlJclZrNDlTYUtT?=
 =?utf-8?B?L1V6ZHRvQkpBUms3ajFkQzZ3YnRrY1lzTDc2cUNEbjlKVHk4c1F1bU4veCsz?=
 =?utf-8?B?L1NHN014a29VaFRESEVSa0Z6aWxXUlNiZnR5cTU0UmFPTWc2QmFEdGtTK3FH?=
 =?utf-8?B?OGtVdVRBVHhmM2hIakhyR1RTZk5Ydmhyd21VS0lNcFUrNWNvaUVSYWtPTUEr?=
 =?utf-8?B?YUFzcUJpeWNzaENWQlpQZjhVNjRpWFFNVEFlN2U2dG9TWTRWKzEyd0tQSWYv?=
 =?utf-8?B?RW04QXdKNHcyamVWWVBncGFYZitxVllLYWI3YXZ3cGpyYTNGUjVMaGJ6SjJM?=
 =?utf-8?B?T2duMC9WN3dpdjZYVHc0c0ZqbVV1VmxSVS9tbEJ0ZVFrMnhqa0JLdDFqcGhv?=
 =?utf-8?B?MmdJNUFCUjBVL0FmQ0IxYXp5dEd1ekJhemZYQXJSekQvNDIySXZ4dUlmbUEr?=
 =?utf-8?B?NTUyWllaK3NlWnNvUDhDdXRsWThWbTlwYUpkQ3o2SVJlREM1Q0JFTWdENlhz?=
 =?utf-8?Q?nOoZOuGcDIJihJy93+Q+7fc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ddddfc4-0a28-4c11-ed6a-08ddea4280c2
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 17:02:30.9451 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ojcaNVh63WiCPS6wtwRUmQhK4+0/58iUobovQhuUnWy5vM72AwiWEG0Sb5iiIk6Ce1nkPjVq4xuphCNL9/sqeGA5gzaXi1HRyWkb+XX7Iw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PR11MB9513
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



On 02-09-2025 19:06, Patchwork wrote:
> *Patch Details*
> *Series:*	drm/xe/vf: Enable CCS save/restore only on supported GUC 
> versions (rev9)
> *URL:*	https://patchwork.freedesktop.org/series/153061/ <https:// 
> patchwork.freedesktop.org/series/153061/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v9/ 
> index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v9/ 
> index.html>
> 
> 
>   CI Bug Log - changes from
>   xe-3659-375a75bab74b1a70e8d6920b0614b57a05e88a3f_FULL -> xe-
>   pw-153061v9_FULL
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-153061v9_FULL absolutely need 
> to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-153061v9_FULL, please notify your bug team (I915-ci- 
> infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (4 -> 4)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe- 
> pw-153061v9_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-invalidate:
>       o shard-adlp: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-153061v9/shard-adlp-9/igt@xe_exec_balancer@many-
>         execqueues-cm-parallel-userptr-invalidate.html>
> 
> 
>         Warnings
> 
>   * igt@xe_exec_compute_mode@many-userptr-invalidate-race:
>       o shard-adlp: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3659-375a75bab74b1a70e8d6920b0614b57a05e88a3f/shard-adlp-4/
>         igt@xe_exec_compute_mode@many-userptr-invalidate-race.html> ->
>         FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153061v9/
>         shard-adlp-9/igt@xe_exec_compute_mode@many-userptr-invalidate-
>         race.html>
> 
> 
I see that Xe.CI.FULL shows Success for rev-8 and shows fail for rev-9, 
though there are no logical changes between these two versions.
Also, the changes are unrelated to above reported issues.

So, Please help to merge this commit.
-Satya.

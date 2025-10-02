Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88E37CCA471
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 14:54:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 322A710E7F2;
	Thu,  2 Oct 2025 14:54:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZhjXhsKT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB44B10E7F2
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 14:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759416857; x=1790952857;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=esHaL/nbQVjjnP/fN3bttUkP0l/GfY8zwYDgQ5nb4kk=;
 b=ZhjXhsKTw3PaWM4B9+2t5ktiiWU8EwASNXzSPGLxeEsVXexcnsSD8mrK
 D4w7awRsOHO7ps8sYgD70qcXoaO7VDv7HH4LyYJ3K4A0a8szZ08+BOBRx
 GnmYDBZ4gJwYzI1utkRCVSxHuil8achniCzxNx4htTWh7SDQtCLethCjM
 KQCkBbXmf7QnY9iwYknD1gzrVYckemaC9f0mlSCRkvF9cU/EJ90KN/M7F
 02uYPfGJB77mUpkrkCsQY5Fp8QbeLYnw/Iydb7cnCXk//KMYq/Te51EFS
 leOmDd5n/ghup2uOYjjqqSCW02wC9Gw2oGP+BA55uocH4YSGs4BYxp+ku w==;
X-CSE-ConnectionGUID: +kSVhfjnTXKmYwYvexKoVA==
X-CSE-MsgGUID: hzqSC4SZShedOxrrVxHwdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61660881"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61660881"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 07:54:13 -0700
X-CSE-ConnectionGUID: Ectam2NaQVKqo+Ly/fRk3w==
X-CSE-MsgGUID: POcTuOlIRPG8F1LcMuENbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="178865798"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 07:54:12 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 07:54:11 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 2 Oct 2025 07:54:11 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.42) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 07:54:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l3uxx4ETQ5Ecifv0FzXO0ZExWpXTJlJAdgT6e/5oSodUHHSSK+zBmWgEZgL7oam0r5L8yUo1iI5FJp31XU0M7TxDJoH0AS+r9fMDysLVbmN+lwfuZqYY8zGXdnzZiR2mmLK2Iq9+OoAojGNaj8pR438U/KclX7mb1np2NbzhAUFNFPtryzKA2OmfBXq8kOgF2q4Ll54BlkKh9XntVdvgnL4NmOtYqZ9c4F9nUc5stS8LcmK005V7PI3lNnS1mknLVYWNmA92an/MHlfzHYySi4Zx4nyq3ov+9dEkGbcDmU3cyrl7wpS9lg2lHBdhQLZt7st5RrPqBZkvxepNGDFcpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SIqs2rZw7tR2E/vAgFT+wg+ANS5wYo6U6WKnr3xoKNc=;
 b=VhwjeFY7AMuhzOL5cYUj7MA9yNjUXFvI/1JdSa6bALNpBB+Dc0GzuGvoFdLdjtGmAnHD+BqmUofp2uheHO99xjoIgFATTX+FEWSDM/Xhw0bhss3ESeFNCFT44l4P0t/nnAYnVbe6Nbt/HPnS+spoRcAWSuX53j5sUUWnkYfxTRy0N2kgxjVLbQ3CsNdup1tQVBSmVq1Ei1bWIZ9FekC8JuOWHCyWd1S6VIG3B+63FZTlABeYX+vZaet8UrLhoAcV4JyOFTYsAqSn63JglAVnDvDiurEbCSd4cGP3QWWiVRx5PyYns/NIhnRMixK7174zGQkfu7SePRbfqwjPhfixJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by DS0PR11MB7629.namprd11.prod.outlook.com (2603:10b6:8:146::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Thu, 2 Oct
 2025 14:54:06 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9137.018; Thu, 2 Oct 2025
 14:54:05 +0000
Message-ID: <7c80681f-ae86-43f8-a128-f7a63e03a79b@intel.com>
Date: Thu, 2 Oct 2025 16:54:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 29/36] drm/xe: Move queue init before LRC creation
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20250929025542.1486303-1-matthew.brost@intel.com>
 <20250929025542.1486303-30-matthew.brost@intel.com>
 <1d5a68ac-290a-487e-a02a-a9e61167d538@intel.com>
 <aN4rl7zRKf5ex/fF@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <aN4rl7zRKf5ex/fF@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VE1PR08CA0019.eurprd08.prod.outlook.com
 (2603:10a6:803:104::32) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|DS0PR11MB7629:EE_
X-MS-Office365-Filtering-Correlation-Id: 949d7d27-2901-4129-38a3-08de01c388af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bSs3NThSMDBPVUs5eDlwakFuL0NWN3ptNnhwVDltVmhUbnJDZU5CNy9KaERI?=
 =?utf-8?B?V2Y5RW5JQ1lGakpQeFRGV2VudnJMekY1YWFSU3gvVE5Ed0FwUmptUFlSNytv?=
 =?utf-8?B?cXBpN3hXNnRpWDRUZTRyYXg4WHIxM1FMY0xGc0s5ZWRpWjF2TUdZeU5PR2ti?=
 =?utf-8?B?V2dzYnVtOEc1S2J6ZzlheWREMUVmQ3VSQlBZWGtraUkyNmNEZFlYYUExWjBo?=
 =?utf-8?B?amVOVWs4d0E2Mlk1YlozYmpMRVUzT0RldGJzNnk1YkgrT1htRld2NUdKZnZp?=
 =?utf-8?B?N1Z3ZzY0Y1Uwc0FSdFVUdHdsKzdtOEVCdzVkN3hrNHNvVmVTcGwxSTk5SkRP?=
 =?utf-8?B?UzdidXFLOElrY3ExT056ZUkzUzZROEg1Mk1Yb2NqYmFYYmtTakNDdTVseDlw?=
 =?utf-8?B?ck80SGFVNE5qNUZsaHRibTJjeFJJTGJCTTFMRUR3M053aGtFMkhrMzYxZzVl?=
 =?utf-8?B?dENBOUxaSG5oZGFPMmdIUlFjbWlIcVlMUisyTTRoalZDYzJKVksvaUw3ckNY?=
 =?utf-8?B?eVNtMHltQnVkNUhTZWtUTHRpRHl0Y3lraDhmSFJJOWxaUTRVOTBEYWJGcGVM?=
 =?utf-8?B?TzZUU1JzMHhDZWtqVnlac3FHcURvZTdNQithOVRpdWFZMDhOUUlrYStSTmJq?=
 =?utf-8?B?cWFrcG9BdzRJTWoxSExEVXg0TkJuNk9FS1VhTkhDeG9CVmNETEFCSmV4SEVG?=
 =?utf-8?B?Q0hlTjRsUkRzb3pBcS9YeWI5SGpndERoMEsxb3hFekp2V3cwM1ZvMjU0T0ta?=
 =?utf-8?B?dExvQmZxK0dCQTVGOVo1aG5kbHd3OXhKZndGdnBrSWVXalQxYVlBanREUnV4?=
 =?utf-8?B?OUE1akN1NGhBVThKRHZrUTJrMFc3OXMyTWgyWW1ySFJlWEpZalNlUzE2eDhr?=
 =?utf-8?B?cTBPVzJpN0lPY1NBV0dma2hLWHMyTnFSUTJLMk5TZ1RqbE1OQjA3RlNqenhl?=
 =?utf-8?B?TWFlYXZYVzR6ZFJYaUh5UGxVcTdMNG5YRSt5MVRjdDhJZ1NWWTZNM21ON0Zz?=
 =?utf-8?B?bG9Xcm5vUGV1SXhqbHd4aHZUemtYRUpERWpkRjRWTW9FazVxeHQxcVIxV1VR?=
 =?utf-8?B?eFAyMmRYakRxK3BLNFp0TEZMRzhOY0c3dnRHRWpnd0NKaE1vUzVBYnYrc003?=
 =?utf-8?B?ZnJkWXowMVpwWHU2VEpsMWJ1RFBUcDY5MUhlblMxMlBBandhRlBuNGV0Nzlu?=
 =?utf-8?B?aHllbGNwTnkxRyt6RTlHNVdyU2pKaThEWjh4K3E5VEJzREdha29FeHBtLzc2?=
 =?utf-8?B?aEdrOG9ybTZxUlNxTE1tdWNnTmlGdjR5c1J0QVNFSWpKOUNrVkRoZGdkY2ZM?=
 =?utf-8?B?YWE0RnVNbmM0N21FNm9od2RGWS9SeFZoeHRPOWU1QU5qcUJGZWhpWnVVTDRQ?=
 =?utf-8?B?R0FzWVViRXhWVEwwVUNNUE9Yc3gvTkVESHVZN3hjajJtT2lqUEtMNXlmemkx?=
 =?utf-8?B?djdRSEYyYnRHK25EV3ErdmJsYXNqTFIweXo4TlY4SFBoOU1sUGV4MTBkR1Rt?=
 =?utf-8?B?WGZqMmJkVS8rcmF0TE1Hcnh5TG9SS0liYUQ4dlJkeDc4SjVhYitHZ1E0Ly8v?=
 =?utf-8?B?TmxjckorSzNYbmZPYTNFTWJXbk5tYnVPTmpYVXZqbWRTY2xYVzJ1ZUpWWWlz?=
 =?utf-8?B?VkM0U1hGSDQxbk1YTlpSZkZpMmNORzJrM0NsQW5ON0xpb3V0RHNoeDFNUGxk?=
 =?utf-8?B?bDhIWnY5d3ZTckVXOWR0TkV5SG0yVUQ3T1AyMFhaRUFsRitMUTRlaUltNEZP?=
 =?utf-8?B?VHdsVEF6Zkh0Vkx6OXQvVnovSHdvaUtaVlN0anZOYWkwNTFCaGwxckhqREdl?=
 =?utf-8?B?T1gvRko4aEo5dTNHSng4d1kvR3V5YWpIRExSajkxMGk5Sk1ndmdRa0IxMTVs?=
 =?utf-8?B?dVVVRXA4eVFrSW5INTBvcHhJWHFXUzNZK3N2ZDBXUm0vNTExNER4L3dPaWor?=
 =?utf-8?Q?ffXQ3NSmc4dWdJe5TffbXkWQJ4lByS90?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGpPSFVGVmEybktzVXBqZ1pjQW5ENlgwRE5QakJwTXJ5ZmxacFUrNEZJcWZu?=
 =?utf-8?B?TU5NZE9jc2xUVWJJaWJuRGRGY3YzOWVFV1VCbTFKUk5kWGtBeGQvcnBrU0JH?=
 =?utf-8?B?ZGFtVnpyTnNqZUwySFl1RDVlb3ZlYWhISXo1TlQ0bFNRanhhMTJxSlA5aWJJ?=
 =?utf-8?B?K3ZVVUozSUNWVmVCRkVxeXlYcDZTVFFyWmRVZ3QzeVhjcDVPRzZnbFpxUnNP?=
 =?utf-8?B?TEtsajY4Y1Y0aVlwM3lJU2dhQ3N6WWlXbjNmdE1EUXYxcVFuK1lvR01GMTJP?=
 =?utf-8?B?cm1IUjg0Yzl2ZlNEaVZ1N1dzUkJyM3l5Ky9ZcEl6c0I5NjlWVXY4MERnbDNa?=
 =?utf-8?B?WW9TTVZ4RVRybnRtRHErckQrWWNBbDNBUko0MWFkY0EvU3RPMUFwRDZ0QWdi?=
 =?utf-8?B?K1h4VnlKaFh5NUwyMnpLUXJCd1FRSUVVMUhLSVBSQXB5ZDFZRDFhbGltY1NS?=
 =?utf-8?B?cG1uVUNJYk95anhpT3ZNUFl0WS8yNXhtRFZqVTdoS0s4LzZKdm5HVXhCak10?=
 =?utf-8?B?cTNFd1dEcXdzZFRMMmxZTzFYZnJyYmpJODN5RkcrdHpxdUVpa29Ic0VUYnM1?=
 =?utf-8?B?cTJaZDQ1MUtRUEN6L2l5SExCM0hOZC9VckdIdTBSRkdxRzI2TGtTbVAwZmd4?=
 =?utf-8?B?Slp3WVpRZEY5OXpaZnRhaEpVYVRTbGpaVi94ZXBydGx2eDZIL21mbFFnMGMz?=
 =?utf-8?B?NEE0TmQ3ZU5lMHJJWVpmNE5BZlFPQXlvY2h3ZWMvL1lBaUNJdXd1dXcyYTJK?=
 =?utf-8?B?Y2wxbzU2cnhPZ0VDbkhWVUlIbFVjaVFZbXJiQU9qeWdvbWxYZS8rTjFlY0xE?=
 =?utf-8?B?T1dTM2FWakcvdWc5ZnFxamVPb2xreEhZS2NmYkNPSngrYitxcEdEbW80QWxT?=
 =?utf-8?B?THFIM3pHRGNDQXkrOWI1NTdiL0hrMWZPVnlzWmRpSWFnVXRibzZ6ZXJWNHM4?=
 =?utf-8?B?QjdnK000RW1YaXZaRmgzTTY1Z2szM3M4bUNlcmVTb2ZUREpIbzFMTGROQ2c4?=
 =?utf-8?B?eGs2N0laVU5rNlVUQVFxaTVmSlllSWRlY2tzMEtKRm92bWFvYmtFZXJuRmNq?=
 =?utf-8?B?Ykl6aUhNYUZtdnpncWVPMm5RQnpOcTdVa2wvS3dzVVQ2Tkx1dkdPZ1QzUXk0?=
 =?utf-8?B?YjRnZjcwQVh5RHNSLzBWR2FDVUtmNnJCVWdlNzBxRXZMUktSZkplOTgzaDhF?=
 =?utf-8?B?dWNKTDVpT0RyZ0NIZnFBcmtzOXhaU1ZKTDFnTmJQcVF0Z3Iydk9FSWNteHp3?=
 =?utf-8?B?SDFhRld0cXNhTFhrZnFjeVRkc2w1N3B2ZXlDd3NGaURlZFptQTYvY1V4dElG?=
 =?utf-8?B?QUJpSFVScE1IYkllZFhjYURBajBtMWQ4Q21zNE9XaVFZK2ZUNUlDRDhvTElQ?=
 =?utf-8?B?dmRHTG1rUHF1dUp0QlhWUW1BNzFSa0JycnpJOFRXRXJ1Rnk2dUgyV3BtclpS?=
 =?utf-8?B?QUhWejBsdTZPM0NqTnk1SlpSRnVrdWFISTJXVThUM2tCSmJKYWswRlNNWGJF?=
 =?utf-8?B?eDQ3eUtqTStNMnhPbGZNakhnRS9Vamg4bW5WNWkwc2pHNmlrQVhiZGd4ZExp?=
 =?utf-8?B?WmxzZUJORG9xUTZuSE1sM0JYdDloakJhckxuK2xtQnJhelFSelBLbGVIMnZw?=
 =?utf-8?B?NFFXL3I3K0dJeUpOTDRoNHFJNVAwMVRTSG8yV1V6ellZWjNobytWYUh2TU9S?=
 =?utf-8?B?MTZtRmVOR3FSRzZRR25EN0h6U05TMVRyRlFweEhmTlF6Zk8wYjNpS2prSnV4?=
 =?utf-8?B?TlI4UktGbnNTL0hUenBIMWhrNzVXc1JCdzEyTElSUkZCL2Z4aXVLSy8xL2dz?=
 =?utf-8?B?NHY4ZURvdS9mNDdzb09aeTFkNDdYOFdZaGVUMWNaam04VkpLeWRpem5aZG0r?=
 =?utf-8?B?NTJJWjNuenhaRXY2RFY1VGVnY3Jibzc4UEtsRE1FREd3RDJ2RHNDWnNWREdL?=
 =?utf-8?B?cmhSOVRnS0NwU1dUUHR6RlU3QzFhU1JzSytMN2I3ZGtEWjZmMnpCRGY2Nmdu?=
 =?utf-8?B?UDJlSS9XdWh0eXJXbEhSRXk3UkYxZk80Qk9YYTRUQXZNa1BDM0RWeWdIYWFO?=
 =?utf-8?B?NnAxQm9SOW1IMkhXaEw4Q2NmdVcveWdOb3hwOEhtSkU4QTY4SUZVd1o4U3Fr?=
 =?utf-8?Q?TjYYRsZ6WEQHurVMYsg9uvmAD?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 949d7d27-2901-4129-38a3-08de01c388af
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 14:54:05.8822 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fx6E9VeCcOjDrRV4xjG+g1Ior/EehyrjF2IS8cGNk46pPJrAI+6LGBLxOHcWRpeuN2rHEcPGhOuPeAy5GIQlHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7629
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


On 10/2/2025 9:36 AM, Matthew Brost wrote:
> On Thu, Oct 02, 2025 at 02:44:47AM +0200, Lis, Tomasz wrote:
>> On 9/29/2025 4:55 AM, Matthew Brost wrote:
>>> A queue must be in the submission backend's tracking state before the
>>> LRC is created to avoid a race condition where the LRC's GGTT addresses
>>> are not properly fixed up during VF post-migration recovery.
>>>
>>> Move the queue initialization—which adds the queue to the submission
>>> backend's tracking state—before LRC creation.
>>>
>>> v2:
>>>    - Wait on VF GGTT fixes before creating LRC (testing)
>>>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_exec_queue.c        | 43 +++++++++++++++++------
>>>    drivers/gpu/drm/xe/xe_execlist.c          |  2 +-
>>>    drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 39 +++++++++++++++++++-
>>>    drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  2 ++
>>>    drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  5 +++
>>>    drivers/gpu/drm/xe/xe_guc_submit.c        |  2 +-
>>>    drivers/gpu/drm/xe/xe_lrc.h               | 10 ++++++
>>>    7 files changed, 90 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>>> index 81f707d2c388..3db8e64d9d13 100644
>>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>>> @@ -15,6 +15,7 @@
>>>    #include "xe_dep_scheduler.h"
>>>    #include "xe_device.h"
>>>    #include "xe_gt.h"
>>> +#include "xe_gt_sriov_vf.h"
>>>    #include "xe_hw_engine_class_sysfs.h"
>>>    #include "xe_hw_engine_group.h"
>>>    #include "xe_hw_fence.h"
>>> @@ -179,17 +180,32 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
>>>    			flags |= XE_LRC_CREATE_RUNALONE;
>>>    	}
>>> +	err = q->ops->init(q);
>>> +	if (err)
>>> +		return err;
>>> +
>>> +	/*
>>> +	 * This must occur after q->ops->init to avoid race conditions during VF
>>> +	 * post-migration recovery, as the fixups for the LRC GGTT addresses
>>> +	 * depend on the queue being present in the backend tracking structure.
>>> +	 *
>>> +	 * In addition to above, we must wait on inflight GGTT changes to
>>> +	 * avoid writing out stale values here.
>>> +	 */
>>> +	xe_gt_sriov_vf_wait_valid_ggtt(q->gt);
>> So to avoid locks, we rely on the VF knowing it got migrated from the first
>> moment after vCPU starts.
>>
>> On `qemu`, we do have it this way - when vCPU starts the 'MIGRATED' memirq
>> is already filled.
>>
>> But what about other VM managers? What about future support of platforms
>> without memirq?
>>
>> I don't think the availability of information that we've got migrated from
>> the first vCPU cycle is guaranteed by any specification.
>>
> It is guarnetted byt the design of Xe.

You mean by the PF part? Because generally, Xe cannot make guarantees 
for how VMM works.

When state is restored, one of the chunks is GuC state. After the GuC 
state is restored, GuC is expected to send MIGRATED irq to the VM. It 
sends the interrupt around the same time it answers to PF that state 
restore completed. The vCPU is not started at that point. When it 
finally starts, on qemu we see the interrupt set from the start. And 
this should always be the case for memory-based IRQs - because the 
interrupt data is stored in a VRAM buffer. However, in general, this 
depends on how qemu implements the interrupt model. I wonder if there 
are situations where that would become a problem.


>
>>>    	for (i = 0; i < q->width; ++i) {
>>> -		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K, q->msix_vec, flags);
>>> -		if (IS_ERR(q->lrc[i])) {
>>> -			err = PTR_ERR(q->lrc[i]);
>>> +		struct xe_lrc *lrc;
>>> +
>>> +		lrc = xe_lrc_create(q->hwe, q->vm, xe_lrc_ring_size(),
>>> +				    q->msix_vec, flags);
>> If migration happened at this place, it is still possible to create a
>> context with wrong GGTT references in the one LRC which was already filled
>> but not integrated into the queue yet.
>>
>> I don't think we can avoid races without a lock.
>>
> There might be a small race here, let me think about this. I will say
> this change xe_exec_threads --r threads-many-queues though. Locking is
> definitely not the way solve this though - reclaim rules are in play
> here which make locking difficult and convoluted cross layer locks will
> always get nacked by myself and others.

Ok, if you can find a lockless solution again, that would be beneficial.

-Tomasz

>
> Matt
>
>>> +		if (IS_ERR(lrc)) {
>>> +			err = PTR_ERR(lrc);
>>>    			goto err_lrc;
>>>    		}
>>> -	}
>>> -	err = q->ops->init(q);
>>> -	if (err)
>>> -		goto err_lrc;
>>> +		/* Pairs with READ_ONCE to xe_exec_queue_contexts_hwsp_rebase */
>>> +		WRITE_ONCE(q->lrc[i], lrc);
>>> +	}
>>>    	return 0;
>>> @@ -1095,9 +1111,16 @@ int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch)
>>>    	int err = 0;
>>>    	for (i = 0; i < q->width; ++i) {
>>> -		xe_lrc_update_memirq_regs_with_address(q->lrc[i], q->hwe, scratch);
>>> -		xe_lrc_update_hwctx_regs_with_address(q->lrc[i]);
>>> -		err = xe_lrc_setup_wa_bb_with_scratch(q->lrc[i], q->hwe, scratch);
>>> +		struct xe_lrc *lrc;
>>> +
>>> +		/* Pairs with WRITE_ONCE in __xe_exec_queue_init  */
>>> +		lrc = READ_ONCE(q->lrc[i]);
>>> +		if (!lrc)
>>> +			continue;
>>> +
>>> +		xe_lrc_update_memirq_regs_with_address(lrc, q->hwe, scratch);
>>> +		xe_lrc_update_hwctx_regs_with_address(lrc);
>>> +		err = xe_lrc_setup_wa_bb_with_scratch(lrc, q->hwe, scratch);
>>>    		if (err)
>>>    			break;
>>>    	}
>>> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
>>> index f83d421ac9d3..769d05517f93 100644
>>> --- a/drivers/gpu/drm/xe/xe_execlist.c
>>> +++ b/drivers/gpu/drm/xe/xe_execlist.c
>>> @@ -339,7 +339,7 @@ static int execlist_exec_queue_init(struct xe_exec_queue *q)
>>>    	const struct drm_sched_init_args args = {
>>>    		.ops = &drm_sched_ops,
>>>    		.num_rqs = 1,
>>> -		.credit_limit = q->lrc[0]->ring.size / MAX_JOB_SIZE_BYTES,
>>> +		.credit_limit = xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES,
>>>    		.hang_limit = XE_SCHED_HANG_LIMIT,
>>>    		.timeout = XE_SCHED_JOB_TIMEOUT,
>>>    		.name = q->hwe->name,
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>> index 0d94867dce8e..42f9fd43b436 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>> @@ -482,6 +482,11 @@ static int vf_get_ggtt_info(struct xe_gt *gt, bool recovery)
>>>    				 shift, config->ggtt_base);
>>>    		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);
>>>    	}
>>> +
>>> +	WRITE_ONCE(gt->sriov.vf.migration.ggtt_need_fixes, false);
>>> +	smp_wmb();	/* Ensure above write visible before wake */
>>> +	wake_up_all(&gt->sriov.vf.migration.wq);
>>> +
>>>    out:
>>>    	up_write(config->lock);
>>>    	return err;
>>> @@ -820,7 +825,8 @@ static void vf_start_migration_recovery(struct xe_gt *gt)
>>>    	    !gt->sriov.vf.migration.recovery_teardown) {
>>>    		gt->sriov.vf.migration.recovery_queued = true;
>>>    		WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, true);
>>> -		smp_wmb();	/* Ensure above write visable before wake */
>>> +		WRITE_ONCE(gt->sriov.vf.migration.ggtt_need_fixes, true);
>>> +		smp_wmb();	/* Ensure above writes visable before wake */
>> typo in patch "Wakeup in GuC backend on VF post migration recovery"
>>>    		wake_up_all(&gt->uc.guc.ct.wq);
>>> @@ -1344,6 +1350,7 @@ int xe_gt_sriov_vf_init_early(struct xe_gt *gt)
>>>    		&tile->primary_gt->sriov.vf.self_config.__lock;
>>>    	spin_lock_init(&gt->sriov.vf.migration.lock);
>>>    	INIT_WORK(&gt->sriov.vf.migration.worker, migration_worker_func);
>>> +	init_waitqueue_head(&gt->sriov.vf.migration.wq);
>>>    	return 0;
>>>    }
>>> @@ -1387,3 +1394,33 @@ bool xe_gt_sriov_vf_recovery_inprogress(struct xe_gt *gt)
>>>    	return (xe_memirq_sw_int_0_irq_pending(memirq, &gt->uc.guc) ||
>>>    		READ_ONCE(gt->sriov.vf.migration.recovery_inprogress));
>>>    }
>>> +
>>> +static bool vf_valid_ggtt(struct xe_gt *gt)
>>> +{
>>> +	struct xe_memirq *memirq = &gt_to_tile(gt)->memirq;
>>> +
>>> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>> +
>>> +	if (xe_memirq_sw_int_0_irq_pending(memirq, &gt->uc.guc) ||
>>> +	    READ_ONCE(gt->sriov.vf.migration.ggtt_need_fixes))
>>> +		return false;
>>> +
>>> +	return true;
>>> +}
>>> +
>>> +/**
>>> + * xe_gt_sriov_vf_wait_valid_ggtt() - VF wait for valid GGTT addresses
>>> + * @gt: the &xe_gt
>>> + */
>>> +void xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt)
>>> +{
>>> +	int ret;
>>> +
>>> +	if (!IS_SRIOV_VF(gt_to_xe(gt)))
>>> +		return;
>>> +
>>> +	ret = wait_event_interruptible_timeout(gt->sriov.vf.migration.wq,
>>> +					       vf_valid_ggtt(gt),
>>> +					       HZ * 5);
>>> +	XE_WARN_ON(!ret);
>>> +}
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>>> index 71e1d566da81..20cc0c4c32e3 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>>> @@ -40,4 +40,6 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p);
>>>    void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p);
>>>    void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p);
>>> +void xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt);
>>> +
>>>    #endif
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>> index e135018cba1e..3c3e415199d1 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>> @@ -8,6 +8,7 @@
>>>    #include <linux/rwsem.h>
>>>    #include <linux/types.h>
>>> +#include <linux/wait.h>
>>>    #include <linux/workqueue.h>
>>>    #include "xe_uc_fw_types.h"
>>> @@ -61,6 +62,8 @@ struct xe_gt_sriov_vf_migration {
>>>    	struct work_struct worker;
>>>    	/** @lock: Protects recovery_queued, teardown */
>>>    	spinlock_t lock;
>>> +	/** @wq: wait queue for migration fixes */
>>> +	wait_queue_head_t wq;
>>>    	/** @scratch: Scratch memory for VF recovery */
>>>    	void *scratch;
>>>    	/** @recovery_teardown: VF post migration recovery is being torn down */
>>> @@ -69,6 +72,8 @@ struct xe_gt_sriov_vf_migration {
>>>    	bool recovery_queued;
>>>    	/** @recovery_inprogress: VF post migration recovery in progress */
>>>    	bool recovery_inprogress;
>>> +	/** @ggtt_need_fixes: VF GGTT needs fixes */
>>> +	bool ggtt_need_fixes;
>>>    };
>>>    /**
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>>> index 497a736c23c3..7fe3fb07e35e 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>>> @@ -1943,7 +1943,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>>>    	timeout = (q->vm && xe_vm_in_lr_mode(q->vm)) ? MAX_SCHEDULE_TIMEOUT :
>>>    		  msecs_to_jiffies(q->sched_props.job_timeout_ms);
>>>    	err = xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops,
>>> -			    NULL, q->lrc[0]->ring.size / MAX_JOB_SIZE_BYTES, 64,
>>> +			    NULL, xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES, 64,
>>>    			    timeout, guc_to_gt(guc)->ordered_wq, NULL,
>>>    			    q->name, gt_to_xe(q->gt)->drm.dev);
>>>    	if (err)
>>> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
>>> index 188565465779..5fb6c74bdab5 100644
>>> --- a/drivers/gpu/drm/xe/xe_lrc.h
>>> +++ b/drivers/gpu/drm/xe/xe_lrc.h
>>> @@ -74,6 +74,16 @@ static inline void xe_lrc_put(struct xe_lrc *lrc)
>>>    	kref_put(&lrc->refcount, xe_lrc_destroy);
>>>    }
>>> +/**
>>> + * xe_lrc_ring_size() - Xe LRC ring size
>>> + *
>>> + * Return: Size of LRC size
>> Size of LRC ring buffer
>> -Tomasz
>>
>>> + */
>>> +static inline size_t xe_lrc_ring_size(void)
>>> +{
>>> +	return SZ_16K;
>>> +}
>>> +
>>>    size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class);
>>>    u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc);
>>>    u32 xe_lrc_regs_offset(struct xe_lrc *lrc);

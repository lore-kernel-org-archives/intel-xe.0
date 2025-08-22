Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D7DCA0EEB
	for <intel-xe@archiver.kernel.org>; Fri, 22 Aug 2025 20:36:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A44E810E0B0;
	Fri, 22 Aug 2025 20:36:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oKtvAMbT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC82710E0B0
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Aug 2025 20:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755895000; x=1787431000;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=VgcXFCCLW/c8eM+7kxvxFTRbzQV15/u/RI5SaWoER5g=;
 b=oKtvAMbTWH3NakYoYsy51BLh2rM12rAmEbGyicYdyfErVSmY4KctfgHS
 oq5gRbzHmt2yywth7b+Ve+QN9wOp3r2KzoVrTarUQ8wBksKEF1lSfiU19
 ri2jaZ32qZzf+1AJc7Sdy4ZCcTb3ZYe3KBuGTxuWWn0+hTTLDkPY4hjd5
 MYONl9WYgV4I0BHHvGR+GvP6HGu9RqwYu1oD3oxYIaN7QTKGjOX8Q6dve
 SBILEUUOiYQJkkiRdO7sOFId92wuBa27kUfmfrfZ6NW/2l+Jl+/0k565j
 UmOJh0XDVZAZJQSy2J7n4WCEiY08iUSk8vp387GoZa+YGYPvEXaRSJ9bT A==;
X-CSE-ConnectionGUID: 3DLOaF5xTWapyRGNDwoEvQ==
X-CSE-MsgGUID: 27Dx9cn+TzehSjHtuq4MQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58273228"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58273228"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 13:36:35 -0700
X-CSE-ConnectionGUID: bFpoTe8NQbSdNwXWpN2Q3g==
X-CSE-MsgGUID: vJ8hu3RGR6yDe02wMS8TBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="169607877"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 13:36:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 22 Aug 2025 13:36:32 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 22 Aug 2025 13:36:32 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.65)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 22 Aug 2025 13:36:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e2kyWKc05ElYdBLf2soaB/l5Mr4PoNdTegCDPFwgvqLNwEWx9mIDCq0uoYDAVTo2o8/lt+a/eNvS2dBKcZkeCsFRmv3zTjChluxXtyhpFRF2EukGyBILRYiXekgAXVLclLEqWwB6mtxtvmdaNKXBo3IJziy9t6kk6ESJD1+OfHhkJGY+bYiI4vesU1jfeyz0i1RLo7492BkjeTUUcOstQZn6Nd55e0RuTOKmwEoHg+jNzsa9WJShFJvb5ooJP784bOd1JN+8Dyo3XnJ/63nz9SP/p7MgMt65TtjY7Klhfqx4t9JN3Gp3sSdvE2IOBkR5oCeEfT0RyvYv2wGVRTahww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KD2Twf3IaSMU2ycc7Kn8FpSdwFGILo7uNOtna6MN2Zg=;
 b=PEbXgP5WkeX4fmEHtmT+85QhA+JLnz01m0l6oUrKGkSoCOmbpnokaxoTjOGc5wsulxmMb4BNWJM545OBy7x1lJAGA8qbQClT7zc3Kbkfz91fA7UAgV3F1yEnoQ5kyhOjncXp5lWkem85vepB/7vZGu9QCmo8ctt69fH2BARpXE6pHs2ySy+sP3yGWz9fLI/hAf0tQ7lLUAt6wCfLPJUV2iRIk0P223hAcvlpiTBdrnpeYawODyvqAuha6vms4WfX5htB4QUyB0zm+sC9cUXg37WIiMiaKL6srWPwrerRYbqwAxndJrwzZOHjvv7mfwoipAiREJDD4lMYYiwo/cag5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB8545.namprd11.prod.outlook.com (2603:10b6:610:1bc::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.16; Fri, 22 Aug
 2025 20:36:29 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9052.014; Fri, 22 Aug 2025
 20:36:29 +0000
Date: Fri, 22 Aug 2025 13:36:26 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 0/7] Use DRM scheduler for delayed GT TLB invalidations
Message-ID: <aKjUylKzWhQAA64L@lstrano-desk.jf.intel.com>
References: <20250724191216.4076566-1-matthew.brost@intel.com>
 <5339ecf6-05f7-4714-8032-c0508259f4a5@ursulin.net>
 <aJpDw9ruWXJjXg1X@lstrano-desk.jf.intel.com>
 <d8a07019-895f-44db-ace7-1fd9324de573@ursulin.net>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d8a07019-895f-44db-ace7-1fd9324de573@ursulin.net>
X-ClientProxiedBy: SJ0PR13CA0106.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB8545:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f321220-d412-4680-04db-08dde1bb92a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?STJ4Yy9oR3FOb2xscFdyZHgybU1PMFY3VWo3M3ExdG4wQVh4WjE5MnJWK2xv?=
 =?utf-8?B?TmlqaFF6d3RQSWowVVA2YlZIZUowWjdrcjh3S09hTGdWTUNOczRaa0tXRFZs?=
 =?utf-8?B?WnVMRzFtMVJBYmlyV2pWUzRrUW5sMThGTG5kcTZGSkpHNjhzc2N3MHJQM29X?=
 =?utf-8?B?WnNuUE1QQWVGQXVjZE1aYmpKbFBYMFd6UVRkaTdvcUw3UU5VMnVFcExEMDM1?=
 =?utf-8?B?a0ErdWQrT1l4RVlIUnp1UzZBd25uRlN2dzNaV3BrNW9hL3RCaFIwYm9mNG1K?=
 =?utf-8?B?c1FpWjlxQTZYNFpWZXYyS1JwS1c4bW9sYU8wV2JzMjRTdk4yc1JYZzMzeFly?=
 =?utf-8?B?OGFTcjZwL1NIN2QxNGlQNE9kQWUwTFdDb1JSZnE5SkZJa0pwZ05rRjF5a05y?=
 =?utf-8?B?RGxLdDA1UEpGRjlCcS94bGFJK25HRmY3eDNOQ1FIMzVHeFQ5NzJRR3Azc1ht?=
 =?utf-8?B?dHREdWs3NE5qampjdllWOTdoN3grajhvaWlkRkx6STBIZVhtYWpualM2S1Bm?=
 =?utf-8?B?dGxPK2lkUmNhSDgyWlJLZGRPVVJoVWhUTkI3KzdkR3lrU2gzL2FLQkF1NDMz?=
 =?utf-8?B?bVJJYXJiM0dmczZkTnEzSXQ3bXdwQ3E5NDRzcUR0S2szQmRtL2NYY1JhZDlW?=
 =?utf-8?B?U1dmZzAwdGo2RnkzNE5HTWlDQ2IyUmVmNi9ySmd6M1F1VEZDVkFsNHMxT29r?=
 =?utf-8?B?T3g0QTNQQktLMW5GaVlyU1hQQW0rNmg4L3ZRV3FYZWpSb0tvM29FRklxd2o1?=
 =?utf-8?B?bmQwdkFkRys5ZXpCV2FLZkxPdmlIQXZEejJmTFhQblBYV2hjenFRWUpSTDhV?=
 =?utf-8?B?N2JtcjVwT2pDNS9rSG03aGpldGpuT3pmakRxTkM5dloxWC9na1dJL3pmbXNC?=
 =?utf-8?B?QjQ4VnphTjNlSkMwaXBFYkoySmV3YldCaG9BdlpVdEFKTGovclExTFRKTUow?=
 =?utf-8?B?b2J0N3ZCSU5sSGFtTjF4VEx3ckxpa0ZZTGZoeDlkVTVUYUQwcWplL2p4QXJl?=
 =?utf-8?B?N1A2c1FiblZFdVZpWTNVemtUT0xxZk55eXBmU2cwcDIrcnNxaWg1dU9sc2la?=
 =?utf-8?B?VmxlVWlyT3BRTExLQWhwcVVKY2RDbnp2RTNydWhOMmU4ZGdYeW5GQUJFK0d5?=
 =?utf-8?B?cXdjY2U5c1ZXZVFVbTZBUEhVNHRuRGN3MzNjSFNHTUY5bVRDdUluWUZuMWxT?=
 =?utf-8?B?SWE0L3ArdGs1UnRPUGxTdHZGQUw1S1g5ZGFEN0FpTnJMNDFINVgxeGFnY0s3?=
 =?utf-8?B?azZzKzVYTVpub1NqWnFCVDNjbFR6NnlQbVBuZnBYWWpiVDZLNVdiSytMbDkv?=
 =?utf-8?B?UnN1Um1Ca3lTU1I1QzM3Z0VHRWlLdkFDSTlHTGU2ck5JTVVsT0pCbU9zekZC?=
 =?utf-8?B?eXpQY2YwQmxNdlRCODZRWURtVEdLa3VJdXEwK212TnkzVWJSenFkWnhMZ00y?=
 =?utf-8?B?YzZZbU1sYUVvTUEyNmk0NTFGeGlqNDhkNGlrSnE5STI0WXFYN3NpQXhZVnBx?=
 =?utf-8?B?Ym12bERDdlA4WmpaaEdHdmN1OFZYb052OXdiV1M2NnpqUUJxaHlqR0UvMHJS?=
 =?utf-8?B?MGRhQTVEZTBveVRJVmtSbHErMWZvVlRpaFRsVnlaeE4vVTd3bGpZcmZ1TEhN?=
 =?utf-8?B?ZXB1NW9QRm9RTnk1Tk1KTFR1UlUyenRIc29BOGV2ZjBjek95SnNxb0thSHNH?=
 =?utf-8?B?WGxOWUNBaVRCRnBmV1JXb3U3ejRiNlVJbU1qMDUyR2c2TVZ5V0U3NmpNQmI2?=
 =?utf-8?B?Z3hlUUxhcTR6WW5yOHBiaFc1YjFxdnRXQUxCVy92L1dPM25Pd09lbHFDVWN5?=
 =?utf-8?Q?A8hVrgpn7QPFXxUHSASDnGxcm9MBKUThyKvcY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3pYS3dZaHFGakFQRWtTK0tlVFpDdVZML3FlWTVPbDVkcFRKNFpzRXBJTHUz?=
 =?utf-8?B?Q1pxVUIzdy9CNVhJVVR0eCtNU1c3dnY3RER3SXI2cmZITSt0U25iWThLallq?=
 =?utf-8?B?bElocmxHemQwU0V3eWRrZGJtR0lBaXZXREUyTkR2UTEwQ2g2OEJYdytYY0hm?=
 =?utf-8?B?bEhZMHk5UFFGWTNFampKRHRoM0RzMjQ1Y1J1aFJ3Q2lZT1ZHaHdKd0k2aUgx?=
 =?utf-8?B?bWltUWtiaFBGY1pqdUp3c2tqbForU3FVcFA1TjZpNHd2RXluRlBqL0hVcElj?=
 =?utf-8?B?TGxSREttcnZ1YldsZjFTSnBHRHU3bUZwYzhOSXdTaklKRnBKeTBKQStlL1dG?=
 =?utf-8?B?WlFqallYMWtjWkVNM3p0Q0g5TWJIZVZwc3JTRkd4RlVLeWhNWG5DQWRvUFRO?=
 =?utf-8?B?c0dyTUxoUHVKaUllT1RZdldOdFNmVDI4Z0hrVFZaNjE2ajlVR2R1RGlRdEhv?=
 =?utf-8?B?NTcvN0lic0xXRU96Z01BS1Jiek1HTEJYVjRSaGpkYUUyYUtlc3dnVm95MjNR?=
 =?utf-8?B?emJJVHVCWUZOYWJXdjd1MFdHRUw0ZUg5bkN4NVR6djFaY28zTGpkZDV2blV6?=
 =?utf-8?B?Y0V1R2xtT0JrV2VwU28vK2JkSmZaeEFpYVNDUjI5Z3JBT0Y3RzlDemRjNG5Y?=
 =?utf-8?B?NFFnd3N4UnZ4bFphblRQZEc5bmJRZDRza21rT3RHdUxHQnppNXpIaFcwWjMz?=
 =?utf-8?B?UUsxbWdLVkIwTnltbGhRZDRIMnVlbmJiRTA5b0lTV2hvRGZCVC84L01Wdi9q?=
 =?utf-8?B?UUIvMzdKWlFGTk54c2p2VXJXMnNpcHBMVk40dHJTNTBBcHJtTGtJc1hlL0J1?=
 =?utf-8?B?TlhRRG1GaElLNUFyZ3o5cTRBdXBTSE1oTVBLcGowRldERU1oTXVsN3pzVXl1?=
 =?utf-8?B?M0NqWTcyMHQzQ0FienU1MTh5QWRTMXhCL2NuV2Zic04zVXBScDRLS1dKNk9E?=
 =?utf-8?B?aEhJS3p3QmJKcUxldmNQekRBVVo0MStteHppWHZ2ZmViem50Vlh5eUgwck00?=
 =?utf-8?B?TUhkQ1JQOU50L0pSQjNRUTc4Q2ZMKzlqQ210cW9zeEFnd3ExVE5QMWdSSXhs?=
 =?utf-8?B?elB4NWN1cHBRYzNOekp0aHk3cG9uVFZVa1RQUCt4andWOUNuNEIybkxtb0sr?=
 =?utf-8?B?VEl6TnpyYU95ZVB5WXluaFVUWEhIYTdPamgzaU9vUGZycWtGem1zdnJqeXZx?=
 =?utf-8?B?cTM3cXJJSkZXWnF2Y0RReVJSU29RTEFORmtaZ1ljVDMzc2R4WHNIM1F0ek5u?=
 =?utf-8?B?UnVTbGk3VzNkVHpLaHk2TWVXVm4yK1RtMjU5QVRBeVhGZnNEU2doTUZzMmZY?=
 =?utf-8?B?SGJydHRrN0JZNlBZMkhscWRBNG4vcEFZc3c1OXBXbzZnK201bTdCd3R4MGEv?=
 =?utf-8?B?WUVLYkV1TXVteHYra2NVY1hvQ01DT2xWNEJpZ2U2S0tRRytNV1FwM1lDK2pw?=
 =?utf-8?B?Tzd3cjR4eGJRclUyVE95bDNSVU96ekhySUZONlg1NFJTUHNXWnRaeDhPUEQr?=
 =?utf-8?B?b3dXcGZmRG5Yc21TKzNkelVVYzFJTFpEOUJqbGtIbWl4b1lkd2Qyd3dHZXdz?=
 =?utf-8?B?V2kwdnpveDJVMjlZekV4eWMrOXpDM3pSUTh5Q3huV2UzMmJQOFF1YmZDL1Z5?=
 =?utf-8?B?N2ZBT2t4TjliWkpqUWFyb0RSUEM0a2ZBY0Nsd3dMMmZwd2R2OHZMNEZHRGIz?=
 =?utf-8?B?QmQvbE1PSEVXNW9zRWxCemRXMWJOSkY4K1VtNzZ4dXRoOGZ4UFo3QkNMcWlh?=
 =?utf-8?B?UWRxblhMRy9iTlhTajZPUkFkeW9acHY4bkh6TTZMdkw3Smd0R3Fzd0Y0VWtV?=
 =?utf-8?B?SU41ZEQ3SE5sMUNoeEErbmdtSXd5M01jWHJPRUhCbkZJc1pwY0hTRndOb1B2?=
 =?utf-8?B?L1dHRHFiU2QxZnpqbnB3WHJYN0J6eGNKdXRFMkdmTklJUk16MXlid2lOS2xJ?=
 =?utf-8?B?UUdUTWN1RjVLQURqMlJVTE0wWFpkNEZrSFAvMGRBTUVKSTBSYStmMWxTd05F?=
 =?utf-8?B?eXRUZFRvZm9IdyswYzFHbVBjdHJmcHB2NE9EWm5HTTBrWlFEOE9HRlFUNXBp?=
 =?utf-8?B?eWYyTDRzVVVKN284cVpqcERHQnc0bTQ3SDJHa2tDczZQdmt1cVlQbFdnT09u?=
 =?utf-8?B?WTQvSEduMWZ0bWluYlI0ek56UCtyN2JPSHg0WDNhOG1HaE9BYkt2NlBaK2Rh?=
 =?utf-8?B?MFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f321220-d412-4680-04db-08dde1bb92a7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 20:36:29.4499 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LUREJTIowEZgkiuKnHpQMpVUr1DOar5aXrCLIiusqNQaL5W6fCAWyXqoc72cGaVzyufb5AjbbqySxM9KltWGug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8545
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

On Fri, Aug 22, 2025 at 01:39:18PM +0100, Tvrtko Ursulin wrote:
> 
> On 11/08/2025 20:25, Matthew Brost wrote:
> > On Mon, Aug 11, 2025 at 09:31:08AM +0100, Tvrtko Ursulin wrote:
> > > 
> > > On 24/07/2025 20:12, Matthew Brost wrote:
> > > > MIME-Version: 1.0
> > > > Content-Type: text/plain; charset=UTF-8
> > > > Content-Transfer-Encoding: 8bit
> > > > 
> > > >         Use the DRM scheduler for delayed GT TLB invalidations, which properly
> > > > fixes the issue raised in [1]. GT TLB fences have their own dma-fence
> > > > context, so even if the invalidations are ordered, the dma-resv/DRM
> > > > scheduler cannot squash the fences. This results in O(M*N*N) complexity
> > > > in the garbage collector, where M is the number of ranges in the garbage
> > > > collector and N is the number of pending GT TLB invalidations. After
> > > > this change, the resulting complexity in O(M*C) where C is the number of
> > > > TLB invalidation contexts (i.e., number of exec queue, GTs tuples) with
> > > > an invalidation in flight.
> > > 
> > > Does this series improve the performance of the TLB invalidations in
> > > general?
> > > 
> > > I am asking because we are currently investigating a problem with Google
> > > Chrome which apparently suffers a lot from latencies caused by TLB
> > > invalidations piling up after a lot of tab switching causes a lot of vm bind
> > > ioctl activity.
> > 
> > It doesn't improve performance of the actual invalidation rather the
> > time to create a VM unbind job as it avoids O(M*N*N) complexity
> > explosion. I originally saw this in a case of many SVM unbinds (i.e. a
> > free / unmap is called on a large piece of memory) but many VM unbinds
> > in short period of time could also cause this complexity explosion too.
> 
> You are saying it is just CPU utilisation and it does not show up as
> submission latency, or it can?
> 
> The soft lockup splat from
> https://patchwork.freedesktop.org/patch/658370/?series=150188&rev=1 is due
> drm_sched_job_add_resv_dependencies() literally taking 26 second beacuase of
> a huge number of fences in the resv or something else?
> 

Yes—there were a huge number of fences, each with a different context.

The initial patch addressed the lockup but had issues; this series
properly resolves the complexity problem.

I also greatly reduced the number of invalidations in the SVM case [1].
That alone likely fixed the lockup, but I went ahead with this to
address the underlying time-complexity issue.

[1] https://patchwork.freedesktop.org/series/150257/ 

> > By making all invalidations from the same (queue, GT) share a dma_fence
> > context, dma-resv and drm_sched can coalesce them into a single
> > dependenct per (queue, GT). That keeps the dependency count bounded and
> > eliminated the SVM panics I was seeing under heavy unbind stress.
> > 
> > > 
> > > Also, is it related to
> > > https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2162 ?
> > > 
> > 
> > Maybe. In this case, a flood of TLB invalidations overwhelmed the GuC,
> > leaving it no time to do anything else (e.g., schedule contexts). It’s a
> > multi-process test, so the driver-side complexity explosion likely
> > doesn’t apply as this explosion is seen within a single VM. What we need
> > is to hold TLB invalidations in the driver and coalesce them to issue
> > fewer operations. I have patches for this, but I haven’t cleaned them up
> > for posting yet—we’re in the middle of other TLB-invalidation refactors.
> 
> If you would be able to send something out, or share a branch, even if not
> completely clean that would be cool. Because I should soon have a reproducer
> for the Chrome tab switching issue and could report back on the real world
> effects of both.
> 

The last six patches in this branch [1] defer TLB invalidations in the
driver when a watermark is exceeded, which should prevent overwhelming
the GuC with excessive invalidation requests. They’re built on top of
[2], which will hopefully merge shortly. It would be interesting to see
whether this helps with the issue you’re seeing.

Matt

[2] https://patchwork.freedesktop.org/patch/658370/?series=150188&rev=1
[3] https://patchwork.freedesktop.org/series/152022/

> Regards,
> 
> Tvrtko
> 
> > > > Admittedly, it's quite a lot of code, but the series includes extensive
> > > > kernel documentation and clear code comments. It introduces a generic
> > > > dependency scheduler that can be reused in the future and is logically
> > > > much cleaner than the previous open-coded solution for delaying GT TLB
> > > > invalidations until a bind job completes.
> > > > 
> > > > v2:
> > > >    - Various cleanup covered in detail in change logs
> > > >    - Use a per-GT ordered workqueue as DRM scheduler workqueue
> > > >    - Remove unused ftrace points
> > > > v3:
> > > >    - Address Stuarts feedback
> > > >    - Fix kernel doc, minor cleanups
> > > > v4:
> > > >    - Rebase
> > > > 
> > > > Matt
> > > > 
> > > > [1] https://patchwork.freedesktop.org/patch/658370/?series=150188&rev=1
> > > > 
> > > > Matthew Brost (7):
> > > >     drm/xe: Explicitly mark migration queues with flag
> > > >     drm/xe: Add generic dependecy jobs / scheduler
> > > >     drm/xe: Create ordered workqueue for GT TLB invalidation jobs
> > > >     drm/xe: Add dependency scheduler for GT TLB invalidations to bind
> > > >       queues
> > > >     drm/xe: Add GT TLB invalidation jobs
> > > >     drm/xe: Use GT TLB invalidation jobs in PT layer
> > > >     drm/xe: Remove unused GT TLB invalidation trace points
> > > > 
> > > >    drivers/gpu/drm/xe/Makefile                 |   2 +
> > > >    drivers/gpu/drm/xe/xe_dep_job_types.h       |  29 +++
> > > >    drivers/gpu/drm/xe/xe_dep_scheduler.c       | 143 ++++++++++
> > > >    drivers/gpu/drm/xe/xe_dep_scheduler.h       |  21 ++
> > > >    drivers/gpu/drm/xe/xe_exec_queue.c          |  48 ++++
> > > >    drivers/gpu/drm/xe/xe_exec_queue_types.h    |  15 ++
> > > >    drivers/gpu/drm/xe/xe_gt_tlb_inval_job.c    | 274 ++++++++++++++++++++
> > > >    drivers/gpu/drm/xe/xe_gt_tlb_inval_job.h    |  34 +++
> > > >    drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |   8 +
> > > >    drivers/gpu/drm/xe/xe_gt_types.h            |   2 +
> > > >    drivers/gpu/drm/xe/xe_migrate.c             |  42 ++-
> > > >    drivers/gpu/drm/xe/xe_migrate.h             |  13 +
> > > >    drivers/gpu/drm/xe/xe_pt.c                  | 178 +++++--------
> > > >    drivers/gpu/drm/xe/xe_trace.h               |  16 --
> > > >    14 files changed, 700 insertions(+), 125 deletions(-)
> > > >    create mode 100644 drivers/gpu/drm/xe/xe_dep_job_types.h
> > > >    create mode 100644 drivers/gpu/drm/xe/xe_dep_scheduler.c
> > > >    create mode 100644 drivers/gpu/drm/xe/xe_dep_scheduler.h
> > > >    create mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_inval_job.c
> > > >    create mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_inval_job.h
> > > > 
> > > 
> 

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74236CCD1AB
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 22:39:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6EE110E382;
	Tue, 21 Oct 2025 22:39:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YHF8cTUn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C25B10E382
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Oct 2025 22:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761086361; x=1792622361;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Jac2fQ6jV1/GA9t0AFuA2FWAiJNEoHX357QNwByCkbg=;
 b=YHF8cTUnSQkdkn8/YOER5Q38O0o9s5Epy7UOq6cIalBZOADBicOzaWkW
 ChMExHv/XVTrdqN7gZrz7BQhnnPEvp1LATJoHJM9s1To8YqP9byZA4SZX
 uNMMTBHNTbQD6ut5xm+Tjx7AKqlBAdsyAqByOuqJQf8hU1DEuw7g3L07M
 fTHrFniNLrLr4hd0Q/D2Y0pc5NPR3zngQYpoP3IE/wjMVOugBYd4zybmX
 0RXI2evNjLLajFJRpBAGXk0SP3lvWmw1Zw0C9BxE1aOo4apVcW0gAdnEB
 Q7/wkhFMKE0LaJaatSKwgRH3bbacUuPQtYEaKSFdft91ieU0zK3hdflLo Q==;
X-CSE-ConnectionGUID: TTekPceLSO2JQj22s34+hg==
X-CSE-MsgGUID: VkpuVvJURyS5+mcvqCnYPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67060814"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="67060814"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 15:39:21 -0700
X-CSE-ConnectionGUID: EhwOoFuvTE24cZ7acNzHfw==
X-CSE-MsgGUID: ZgpTXVQBS3mQedbq3SNj8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="184190732"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 15:39:20 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 15:39:19 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 21 Oct 2025 15:39:19 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.60)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 15:39:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KCcKsHfdTxLwIKcsxauB+d2l+/ZjBRaRLBKyGQxlYzDyaMliL8TCqqPC/MmX9eUMOOTVpNME+84IT6HGMgwpRMPRbu8Mawhmum59FMc0oB8Cs5+V2WmQhBNn3IcXtvOJdJgYO5Eg732KKkR7JGHNQno1KCDwRXHsd487F0eZd/oiX4NBotHgprLiH6JK2htchYN9uhrroqWknzRioSJ06MzApi/fe0UlZFANfZz18Xi6Z2d4o0McR6IBuc98D6ZLiGU06HAgcWUmD1aD4SNnebwLmMcNPegS0vy44a1UmSgR+Nsf8nFPu+0hAnC43KeiCiyNNCk29wOGAoYiluzxHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SMc4d9Y+Pdqg/ooB7hIEl66ZgVnhh6sYvl8mtSkBHDo=;
 b=DvHKxQuSeCMacFSs4hFSLADg71R31fyRdZ2Z97xEy5V8mUigBIpxvDObiUhE1WyoEfyA23diAFspKZE1JO8hShUPIaOHSxAOJL4ozBef3F3ls4nHaxmM4QRavZzWuq7ww/9+8JZO9Ip34eWCRnhK9nfZFrRer6pVjpPdISqHAH/MtXFKZ87NtXq6QaqRlXCEa4nw4uMpp3fLvFLVjk2TPOKi+/wwIy3aLeS73hsgkT79Elk4SguqQ4uY+kS2vIn8TuPUfFKhARs41w0lt54Lkhl0lnKUnm26bLx8tL1DFNEsX5JVKPbnMdFZxG0mJQDcQJxbsrQDrcvhKO9Wbs21gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by SA1PR11MB6567.namprd11.prod.outlook.com (2603:10b6:806:252::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Tue, 21 Oct
 2025 22:39:17 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9228.015; Tue, 21 Oct 2025
 22:39:17 +0000
Message-ID: <d4dc560a-aeea-43a7-997c-06f5b03f0745@intel.com>
Date: Wed, 22 Oct 2025 00:39:13 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] drm/xe/vf: Fix GuC FW check for VF migration
 support
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>
References: <20251021181250.1541639-1-tomasz.lis@intel.com>
 <20251021181250.1541639-3-tomasz.lis@intel.com>
 <5b46eed6-fa1d-4ab2-8963-a8915b802c12@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <5b46eed6-fa1d-4ab2-8963-a8915b802c12@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0055.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:23::12) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|SA1PR11MB6567:EE_
X-MS-Office365-Filtering-Correlation-Id: 54149d4d-7db4-43f9-dcd4-08de10f2ab31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Nk56aFNSMms1T0VWbUF4NGFkZjFvb3lSY2JHNU9KMzUxTDlYRjVjWlFRSHlK?=
 =?utf-8?B?bGU4bXRQSDc0cDl2bFVNd3ZtT3JOZ0swNTF2eGpTTjh0bktNK3BmbEU4L3oy?=
 =?utf-8?B?WE1RMWl5alJjZUJUUG5yS0owNlFJeUp5L2txSiswckx2R0J0QlNCUFljalBG?=
 =?utf-8?B?YWdjb01iSG9keUVOUUdZNTUxazE2N2ppTzQ1ZW5VaVl0OE1JVUNuQnVhU0Vv?=
 =?utf-8?B?VGFsZi83bFRrV3prcVFDR1hKdDR2aFNocEZOTUFGUGhrR2xaQ0dWU0lmbzQ1?=
 =?utf-8?B?dU9YVkM4WDZWZ0lKcFd1YzgxdDl6bk1Xcm5ac1c5Q3Z0bDhRMitQMkFyU2FM?=
 =?utf-8?B?R0xWNXZ0VXJmSWY2NDNvWGZPV1NGcWlBM3FTdmJteDl6dmN3VStvdVlPdy9x?=
 =?utf-8?B?SzBkWEZCN25NSTJZdHlYaXZqVUtScFg1NGViZEZYS0hDQktNMTZ6ZklXVklU?=
 =?utf-8?B?cjNLVUw1SG1GRXU1NUpIWkowVzR0UnZBY3VqNDN3RVZnZ1RDU1ZGcXN5RnJN?=
 =?utf-8?B?QjA5ZjExRTVQRWdJTEJ3dklzNDZnRXhyZHBwd1lSMkFHNHl5eFhIa01uM2lQ?=
 =?utf-8?B?SzdyRkZzTTMzcUpwbUloSitITDErWjE5a0s5Tnk2T0NGV2hWUVZGVTlqZGlN?=
 =?utf-8?B?K0xsRmJjNmp5TDcvT01JYzZ3aFQrRlhDMmUrL3BnaCtrOFF4MXpHSW02dFlp?=
 =?utf-8?B?SHB2cVhneUZOTmRZL2QvbEJiaVZheEpSUGxPdFhZcmVOLzN3ckI1ZkloUHVJ?=
 =?utf-8?B?Q1pEYWtQRVZNRFVvWHhVVFQySmt5YUNJc1Jud3FSZmd1MU53QmFWejVUaEMr?=
 =?utf-8?B?T1QyZERNVlRCbzJ4VlNMKzBpRGxtNHMycWVkdDFyNzh6Zy9KRjkrUDA2dktl?=
 =?utf-8?B?andlM1drQ1k5MjdvbUxQbHdRc2xLV095WHYrMmhPdGMwSEZTQjlWdTd0U3hU?=
 =?utf-8?B?VW5jWVlQSU5vSDhqL2NtRU5VcDEzZHBuZ3ZFVTNlaFFhVUVDdFFSOWJyMlFW?=
 =?utf-8?B?aDhFamNYa0pzVXR6QUpvMWxDQlJpdjJNcmcrR29DN3hyRDRZNGhvSG1rblZk?=
 =?utf-8?B?by9BTU0yTnlWRkdVdFcvVUFDWHU1YjZzZjFHbUtDMEg2WFJKelJxQVhmUW1C?=
 =?utf-8?B?aVNQY09pQUdNbGVFQkRxRE1DUURMOGhiUUp2a3dJOTRQcTNKYU1TajZXOGZL?=
 =?utf-8?B?NWltSmZhUHU4ZlFWU29saXJsb2xYQ21aOElrNDVVZStYaExBMWVDc1BXSmJz?=
 =?utf-8?B?Q0l1aHo0U3VwS1MvWnp1Q2RyMkN4bTlkUW5HanhZWHJHd3VZT01OYTlzdGFG?=
 =?utf-8?B?dmJ4QzZVVDNUR0U3YTJvNzZDWm8wWVNGT2YwRnk0eHlxSEJYTXN4bDZMVWxn?=
 =?utf-8?B?b2E1ZmVud0R0YVNkdkVmTTJrczRpQWxtbWowN0ZYK21kaC9YWU9TU0lKZ3k3?=
 =?utf-8?B?QmRpRGtueDJycjBibUhjcXFpSDBvNWxLZDYzWVFiVEdVL2RDWENaQ0lZOHp6?=
 =?utf-8?B?aWJjVGloMTJDTUdBOVhwQm5nT0tEcmdpL0tzdks5SmI5VU9MWE45eFNaN2Yw?=
 =?utf-8?B?T3FxeUZ1emhVRXZiNGQ4eHlxcmhTcUJDNVBCeUhTckVLVjhUQ0FzK0dQa1Bw?=
 =?utf-8?B?MU82SXNESm16NzB5RWdjaDgvZm9USWM4bmNtMFdmaEIzMXMyVVB3akVuamdv?=
 =?utf-8?B?WGdzYmxuVjlNbll2aDA0bElQaVhzRng3MUszWGN5bFM3eXUyWmxiTjh1SzRo?=
 =?utf-8?B?YUF5Nkppd09QVDVMeDNuVWd1d01tOFR0TnY1S1pPa3RLRmJmb1FyUHBpSWRV?=
 =?utf-8?B?alFHRXkzUlNRbEMvNi8xcEdBT2FBcWxCY2IyRmJHcTNtcUFxQXlVWldCNTRR?=
 =?utf-8?B?SFBwQUNWSFBJMjBKdkdJU1NlVTI5VzJWTVBBWEZKdVNBYVE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2FtbEh6N2E3ZkdOQURWcVVudmZEamcybzhFMG90UW5rRkVuWEdhVm5pYWRN?=
 =?utf-8?B?SUFTODB5Z0loN0Z0bkF6RUVRSmc5YUpkSDRnN0JKMmhnRXlrQU1ER21ZVDRG?=
 =?utf-8?B?anRmQU5WcjJzVGxBc0REWXZrbmxRWmpKNE8xYU1Vbm5Cek5WSHpod3U0S0RT?=
 =?utf-8?B?eTlLRmJkbS9lQjZSY2dHaUxkYjYxVE4vQkk2QnRVT2x6SXU1NXV6QTZMVDlt?=
 =?utf-8?B?NzZBU0t3ZDdUT1BDV2VNb25BdG5yb2c4eU9Pei96QWJHb2M2em84L1VSdHBH?=
 =?utf-8?B?dmx3MnpzY3BvV1o0eUk2a01BK2hyV0ttbFpLWVB5YU03aDB5ZklUVXdxMWJ1?=
 =?utf-8?B?OVFPSkdJY2svdUxEYytpL213Z3RjV3RMdVhlTzhmK2tLMTF0NStGMzFNVDQ5?=
 =?utf-8?B?WndBMi96OVdwbjE3dE5obUMyL2hrUXNzVSswQnMwUGJDR0M0TDgxVFBXTGdF?=
 =?utf-8?B?WTBWUlJuTDdiQThSSmJEbkh3Rm5mdDlFeXQxdFR1blJrVFE5RWJNSUpjdHdN?=
 =?utf-8?B?TkxGTHpGVjZlRExySjY5VGlBZ0duRXhndlpqOUhSdThiM2diRFZWUnlzWC9F?=
 =?utf-8?B?U0h3cWRid0NwaWdIUGN3ZzBwaWNVNE9veEJ1NTJMeWQ4UjRVQ1NiN0ROMjJp?=
 =?utf-8?B?YXZQelNud1JKV1ZlekYwWnB0R2hDYlZFL0h0SzZQbEhGcENFdGJPS1Q0QzJL?=
 =?utf-8?B?OWd4OW1vYkRqV1Nmb252MThsS2hISlVrYTgyK1RwNm9DeGF4MkpGZkM5SDll?=
 =?utf-8?B?Zml5eUJrd3BuZ21mcjBhbGtKWEhzZkVDaThFS0dRd0NNTy93Y1FrTFhFMGdP?=
 =?utf-8?B?K2duckpqTFRabENaY3FlMlpvR3Jtb1Z1V1ZyZlVUM3JCYmNFU1FsUEo4VXNK?=
 =?utf-8?B?V0kxckxxTFNOUll3VEVVL0pGbUpsWmpOUWJtSWVqZ0Z2UGlCYTAvTVc2MEhJ?=
 =?utf-8?B?NmlvQkhURjhPNFJtbzBHNDJZY29yUVlYUVJ6QlNhSVJMYjY4MFExVWFxSjdL?=
 =?utf-8?B?YVhBRE95TXlyWUZReFN2VjhYLzlFemthSEpheUg4OGdZcXUyWHpucnFqMGY5?=
 =?utf-8?B?WjYzdURSa2NVMVppQ3F2TVI3YTNoZmRueURoT2YrNG8yZ05zR3k3TzR6ZHF3?=
 =?utf-8?B?MUoyU3ZyRytmWHgvS0NZMGpEUStrTllBNUNYL1hrMHlHdCt6S0xqR2s4dVQx?=
 =?utf-8?B?ZnkyaXo4bzRZajcvZEhqQWtTTmNNdWRORVB4a1d5SmcvSE1WNTRiZWE3WVUv?=
 =?utf-8?B?WjZOM2szS1kyV2Vkakg5VGhmY1pONFdJdzRXY2VERTdaNHVlMHNneUtLY2o5?=
 =?utf-8?B?dGdOUmkvakVyc0ZvMkJoMk1EY2VPN3Vja3c1eFZQcERHcDF2NnYydVNpRlgv?=
 =?utf-8?B?dHhrK2ZEV3ZkVFYzRjFZMEs4djhXS1dvV0FYVkxJN01HLzQycDJ0cTc4dS8z?=
 =?utf-8?B?UytjQUkzeGY5ejRPSEEzdUVzV1dpOXp0QWtQSTc4VU53b282a0E5bXBpeG9S?=
 =?utf-8?B?TnZzdSttZG1IZlRzZkx4SnI1THMyYndQaVVlZFN0TjdMZjZtSDRHMmkzZEdL?=
 =?utf-8?B?OVh2UFBUSWlIVkgwNGYxYmVOSkJkR0kya29lRkVWcGRCMUJsbEtRaU81K05B?=
 =?utf-8?B?OTR0N0U3NTVFS0ZZWThwVHhibTUvYXc2WXBjZ3Mwd1ZMUDRzVUEySFh0VEVn?=
 =?utf-8?B?TzZDOVkwSTRmZkdiVmJVUTlDbU5zcHk2dTVhYmM1KzRnVUtDSlZ0OWYwM2lY?=
 =?utf-8?B?MWx3TmZBb2JPSnpjcEdPVWZpU2pOU1drM3VtYVhKWm82TFNUYUV0VVZkMUk3?=
 =?utf-8?B?aGdaOHBpOEphRjM2QUtFWjF3cDhySzhvNUF6T291RGFJdDVHTE01Z3hDWStq?=
 =?utf-8?B?QXZ0c1NZRkVtOXl1MjQ3VWZONHJlSStiRWhzMm93Y3BFSDhFb1dpbHNvL00y?=
 =?utf-8?B?WmlmdXF2RzJGdVczaW5lUk0yZ2g1TWJ1WXM1NFlPZ2l1bnYwRkthR1hOTFVT?=
 =?utf-8?B?UnpUU3hEUk1Wd0lkT1lyNlRlOGEzT2NHanVXY2dmZU5JYzBCU1NSY0RNV0JP?=
 =?utf-8?B?VmNjOXhCaENnV29JUVRNVVg1T2dDR0pmUUovaVVpeEZaSEFiNlVqZG1Ydkx6?=
 =?utf-8?Q?WMmD9Ki6ND8OysowpluyxWLLt?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 54149d4d-7db4-43f9-dcd4-08de10f2ab31
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 22:39:17.4754 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W6PnQOHAJ9siORdRZmRPf9vI5CH9KuwhX4/6JbWthyMLLUZrNKENo4Yhj3vpDlMNwT3sZuGKnfBov5TOjMWtug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6567
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


On 10/21/2025 8:39 PM, Michal Wajdeczko wrote:
>
> On 10/21/2025 8:12 PM, Tomasz Lis wrote:
>> The check whether GuC ABI version meets requirements shall be
>> performed after said version is received from GuC.
>>
>> Doing it in wrong order was triggering a warning:
>> xe 0000:00:02.1: [drm] Assertion `gt->sriov.vf.guc_version.major` failed!
>>
>> With this change, dislodge part of the VF migration support check
>> and moved it to after GuC handshake.
>>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Tested-by: Matthew Brost <matthew.brost@intel.com> #v1
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6349
>> Fixes: ff1d2b5e3d28 ("drm/xe: Read VF GMD_ID with a specifically-allocated dummy GT")
>> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
>> ---
>> v2: Use xe_sriov_vf_ccs_migration_bb_needed()
>>
>> v3: Update commit message, move check funct to ccs module (Michal),
>>   rename xe_sriov_vf_migration_disable(), remove its duplicate
>>
>> v4: Limit scope of some functions to xe_sriov_vf_ccs file,
>>   switched 'Fixes:' tag to a different commit (Michal)
>>
>> v5: Squashed with "Helper for telling whether CCS migration BBs are
>>   needed", added kerneldoc, moved location of some checks (Michal)
>>
>>   drivers/gpu/drm/xe/xe_sriov_vf.c     | 33 +++++++------------
>>   drivers/gpu/drm/xe/xe_sriov_vf.h     |  1 +
>>   drivers/gpu/drm/xe/xe_sriov_vf_ccs.c | 48 ++++++++++++++++++++++++++--
>>   3 files changed, 59 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> index 0d8135f3927c..13d6c094ae8f 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> @@ -133,7 +133,12 @@ bool xe_sriov_vf_migration_supported(struct xe_device *xe)
>>   	return !xe->sriov.vf.migration.disabled;
>>   }
>>   
>> -static void vf_disable_migration(struct xe_device *xe, const char *fmt, ...)
>> +/**
>> + * xe_sriov_vf_migration_disable - Turn off VF migration with given log message.
>> + * @xe: the &xe_device instance.
>> + * @fmt: format string for the log message, to be combined with following VAs.
>> + */
>> +void xe_sriov_vf_migration_disable(struct xe_device *xe, const char *fmt, ...)
>>   {
>>   	struct va_format vaf;
>>   	va_list va_args;
>> @@ -156,22 +161,13 @@ static void vf_migration_init_early(struct xe_device *xe)
>>   	 * supported at production quality.
>>   	 */
>>   	if (!IS_ENABLED(CONFIG_DRM_XE_DEBUG))
>> -		return vf_disable_migration(xe,
>> -					    "experimental feature not available on production builds");
>> +		return xe_sriov_vf_migration_disable(xe,
>> +				"experimental feature not available on production builds");
> indent ?
it makes sense for the brackets align rule to be abandoned when using it 
would produce unreasonably long lines.
>
>>   
>>   	if (GRAPHICS_VER(xe) < 20)
>> -		return vf_disable_migration(xe, "requires gfx version >= 20, but only %u found",
>> -					    GRAPHICS_VER(xe));
>> -
>> -	if (!IS_DGFX(xe)) {
>> -		struct xe_uc_fw_version guc_version;
>> -
>> -		xe_gt_sriov_vf_guc_versions(xe_device_get_gt(xe, 0), NULL, &guc_version);
>> -		if (MAKE_GUC_VER_STRUCT(guc_version) < MAKE_GUC_VER(1, 23, 0))
>> -			return vf_disable_migration(xe,
>> -						    "CCS migration requires GuC ABI >= 1.23 but only %u.%u found",
>> -						    guc_version.major, guc_version.minor);
>> -	}
>> +		return xe_sriov_vf_migration_disable(xe,
>> +				"requires gfx version >= 20, but only %u found",
>> +				GRAPHICS_VER(xe));
>>   }
>>   
>>   /**
>> @@ -193,12 +189,7 @@ void xe_sriov_vf_init_early(struct xe_device *xe)
>>    */
>>   int xe_sriov_vf_init_late(struct xe_device *xe)
>>   {
>> -	int err = 0;
>> -
>> -	if (xe_sriov_vf_migration_supported(xe))
>> -		err = xe_sriov_vf_ccs_init(xe);
>> -
>> -	return err;
>> +	return xe_sriov_vf_ccs_init(xe);
>>   }
>>   
>>   static int sa_info_vf_ccs(struct seq_file *m, void *data)
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.h b/drivers/gpu/drm/xe/xe_sriov_vf.h
>> index 4df95266b261..e967d4166a43 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.h
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.h
>> @@ -14,6 +14,7 @@ struct xe_device;
>>   void xe_sriov_vf_init_early(struct xe_device *xe);
>>   int xe_sriov_vf_init_late(struct xe_device *xe);
>>   bool xe_sriov_vf_migration_supported(struct xe_device *xe);
>> +void xe_sriov_vf_migration_disable(struct xe_device *xe, const char *fmt, ...);
>>   void xe_sriov_vf_debugfs_register(struct xe_device *xe, struct dentry *root);
>>   
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
>> index 790249801364..842e2a4e4774 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
>> @@ -10,6 +10,8 @@
>>   #include "xe_device.h"
>>   #include "xe_exec_queue.h"
>>   #include "xe_exec_queue_types.h"
>> +#include "xe_gt_sriov_vf.h"
>> +#include "xe_guc.h"
>>   #include "xe_guc_submit.h"
>>   #include "xe_lrc.h"
>>   #include "xe_migrate.h"
>> @@ -260,6 +262,49 @@ int xe_sriov_vf_ccs_register_context(struct xe_device *xe)
>>   	return err;
>>   }
>>   
>> +/*
>> + * Whether GuC requires CCS copy BBs for VF migration.
>> + * @xe: the &xe_device instance.
>> + *
>> + * Only selected platforms require VF KMD to maintain CCS copy BBs and linked LRCAs.
>> + *
>> + * Return: true if VF driver must participate in the CCS migration, false otherwise.
>> + */
>> +static bool vf_migration_ccs_bb_needed(struct xe_device *xe)
>> +{
>> +	xe_assert(xe, IS_SRIOV_VF(xe));
>> +
>> +	return !IS_DGFX(xe) && xe_device_has_flat_ccs(xe);
>> +}
>> +
>> +/*
>> + * Check for disable migration due to no CCS BBs support in GuC FW.
>> + * @xe: the &xe_device instance.
>> + *
>> + * Performs late disable of VF migration feature in case GuC FW cannot support it.
>> + *
>> + * Returns: True if VF migration with CCS BBs is supported, false othherwise.
> typo
ack
>
>> + */
>> +static bool vf_migration_ccs_bb_support_check(struct xe_device *xe)
>> +{
>> +	struct xe_gt *gt = xe_device_get_gt(xe, 0);
> this will make static code analyzer unhappy
>
> likely xe_root_mmio_gt(xe) can be used instead to avoid that

I assume you're referring to the theoretical ability for that function 
to return NULL.

Not sure how the analyzer decides that one can and the other can't 
return NULL.. but I believe you. Will change.

>> +	struct xe_uc_fw_version guc_version;
>> +
>> +	if (!xe_sriov_vf_migration_supported(xe) ||
>> +	    !vf_migration_ccs_bb_needed(xe))
>> +		return false;
> nit: IMO it would be cleaner if moved to the caller side ...

Exposing multiple conditions, easily packed into one,  to higher level, 
is cleaner?

I don't really care which way this goes, so will change. Unusual request 
though.

-Tomasz

>
>> +
>> +	xe_gt_sriov_vf_guc_versions(gt, NULL, &guc_version);
>> +	if (MAKE_GUC_VER_STRUCT(guc_version) < MAKE_GUC_VER(1, 23, 0)) {
>> +		xe_sriov_vf_migration_disable(xe,
>> +					      "CCS migration requires GuC ABI >= 1.23 but only %u.%u found",
>> +					      guc_version.major, guc_version.minor);
>> +		return false;
>> +	}
>> +
>> +	return true;
>> +}
>> +
>>   static void xe_sriov_vf_ccs_fini(void *arg)
>>   {
>>   	struct xe_sriov_vf_ccs_ctx *ctx = arg;
>> @@ -292,9 +337,8 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
>>   	int err;
>>   
>>   	xe_assert(xe, IS_SRIOV_VF(xe));
>> -	xe_assert(xe, xe_sriov_vf_migration_supported(xe));
>>   
>> -	if (IS_DGFX(xe) || !xe_device_has_flat_ccs(xe))
>> +	if (!vf_migration_ccs_bb_support_check(xe))
> ... here
>
>>   		return 0;
>>   
>>   	for_each_ccs_rw_ctx(ctx_id) {
> but otherwise LGTM, so if CI is happy, then
>
> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>

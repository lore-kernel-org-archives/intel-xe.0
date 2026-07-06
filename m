Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 626F9C43458
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jul 2026 14:32:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22D2010E3A3;
	Mon,  6 Jul 2026 14:32:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mO+Bevo4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1073910E3A3
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Jul 2026 14:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783348345; x=1814884345;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=B9JWkjs6VMK2go9gRIUuz3jMfnHw3J2YNojs99Q+ocY=;
 b=mO+Bevo4B74GLCfp/acmqZfTKaatfBX6XD4WA37LL/5HhUAgEjLrYdv4
 Y7IY9264hsYwT5YCQw7upD2n3otDKQR6hte4QdSCgU/BRxszBWgFzDkzv
 sc7mL42ubBREuzE2KPCdcSRAJWSHb4F93nW1j3n8q3wLtgkk+VIvUQSuq
 4k+aVfLU49l5iiWEsOVNpiazUn5EZE5jSNngJYitP8se3eFl/tXU8Sy5x
 kLMj6emV9XMk2zy0xVoGk3hqNhtRoP/CD7COWlJxihzM0HyorWKD1LX28
 jJWLLRvMB7N72WqBsa0FhVvFfQnqh56GjsWM1zhXSpYj0kvj8wu2UAbsj A==;
X-CSE-ConnectionGUID: Od1eiE6JRJGO2T+Be7cqPw==
X-CSE-MsgGUID: 5QYMp95+SsuHCtB/6Du17g==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="83962003"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; d="scan'208";a="83962003"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 07:32:25 -0700
X-CSE-ConnectionGUID: L0kVv9BgStihSUychiQ1yQ==
X-CSE-MsgGUID: KG/oRkqfQjuYf/1uRcuyTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; d="scan'208";a="253265503"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 07:32:24 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 07:32:24 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 6 Jul 2026 07:32:24 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.25) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 07:32:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BaCUT0+ZY4cZ75v6IvZAI0tXDrofAll6ppeZjsHrwCUvMmu80XrqbqwEjEdAvffWJljOvRX6SxL4dmbqr+9xF6nR7h8CvyxMrq83Jp3WvFfgJvgNNtqF/c7WqqPBaw8/3FDr7lE2rl7tz4BM0K4KWLYKexj7NTZzxzeoF0b5XBe4qOm2wZtFykvkGDzsmiyUUnwh2KY38u6bPI0fOQcVbMd4w1m0TXv1rwXEY9se3EDlf9xg5BToB+Pz53pDtAr7btuC57fmOSwncEryFMFo4JODJFxX2mrK11L9sdfh3vv8YRPHxnG4M1mCKJbBwjRwoXjy0yZHS2sFqP04AiPo3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hN+TSlYtJVuidoOiuyEDeUQgUoUhX9XfdGq98VsgF6E=;
 b=nOYce2C1S0Lrq7kf/MkUs7L3cPZKFUZ96IyZzpTskdFQndQ32EvmOgp8arccsgFyX0xH18SvPUwjLq1ba7A7Vx0NORMVIMbExQRXQPHacmU1XjlpQn4sC3JRPzGfsd3mtlrDMBxyVvdrIZqlFt17OdJnSbM4gKq+XvRPBBVaUTpnwA8poHa1ol2s2H2KvvLRhVzEp3S2CuErl523jA8AuvqXxLg1YuUKaeGURqATzZaAzdCj5cKdvacNH65HKI6adKUByjcAZ90xjHO9NQXh82ZxiDdbXsOdriUo5CbNMePr+259Po7lPdQyHyvwYp9vXsupwqCqNU6iAxNgQLBpgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH0PR11MB5048.namprd11.prod.outlook.com (2603:10b6:510:3d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Mon, 6 Jul
 2026 14:32:19 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0181.009; Mon, 6 Jul 2026
 14:32:19 +0000
Message-ID: <bc441774-a8f0-4c78-a0f3-a9fbb4449a6b@intel.com>
Date: Mon, 6 Jul 2026 16:32:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 3/5] drm/xe: use xe_ras_log_wedged macro in
 xe_device_declare_wedged
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>
References: <20260630115503.407158-7-mallesh.koujalagi@intel.com>
 <20260630115503.407158-10-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260630115503.407158-10-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIVP296CA0031.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:356::13) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH0PR11MB5048:EE_
X-MS-Office365-Filtering-Correlation-Id: 610e007b-0806-403c-344c-08dedb6b61f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|13003099007|18002099003|22082099003|11063799006|5023799004|4143699003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: 4im2UGqIPqPjiQvioNOemsrSpYr2rQH3zZkE+BODaA3omAyfoGIXy+ieDJhi50FTMPC4tK0LFiwkEwIX7lQcYd+dP7Gp6ZKX5UYaKHFyw1uYMN+ZYXB/b54YQlD8vu2UHmySDcbhvNhqQ2+RM9iovwouS+A+x9+0/U2qqc3l5qmPpjoJO1VlaeHYcopgyvY8z0MRTqU42d+4lsF46SCkbujpm4ETaUQsToSgxGPc0DiOYavdgHDsHO/RnZyb/N0kpEPkjvcjlCvzdJJWLVXRd5Xjfg/qecyzw7UuxZQULHGuNZZxgWPS7GGScPTRUPp1piUY49XADUNRSRMeCpcEWIVnwoOStHMSUPzsti897cSfkQYsnk6y4U3XoEzHadpazakLsuhB9UxybF/9E0llfMVqQMHZSZJpAwmWXSryHajuTQDkymTyYI6D7fkNZFbUuGeUogHhVbGpLwIYSPV/u/HJpkXdeelR4/SRTYDKxlWyPidFdquYlfSuY2G1QceNDZzRKeM5e0NdftkehiEAI3l5E987Cu1me5dv+mNeJBQEmTeOM3KYStzAYOPM80sn2I2RQbl8QeoAaJ3A5aXjivfdluGkLpDSelKnxxdWLwl2jzlVBdVx7b9qGmw4LOrU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(13003099007)(18002099003)(22082099003)(11063799006)(5023799004)(4143699003)(6133799003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2NIU0YrSjZmdk13bU5vTVNWSlRKNEVSR1U1R3A1M09LS3VWZEovckU3R0pL?=
 =?utf-8?B?cUsyNCtpbDArQmo1ZmdBaWlxUnR0TWFMVXd6TUJGK1NoQnE2YzdGMG1ybTh6?=
 =?utf-8?B?YXpPV2lucFlBd05HM0VOUHlEbXVsYVFsOTBDUUNGRmhmWWw3Tmw3NUo1d2Vk?=
 =?utf-8?B?Mnh1bmxVOUVOU0xtNHJwQ2tFd1d4SjFyYzFDaWhReGtYam5raW9lSC95N2lh?=
 =?utf-8?B?bzJCYmhDK2lCRC9MZHdyZVorWDZidWp4ZzJGRmRNRU9sUFBHN3BSS2ZRZnZo?=
 =?utf-8?B?TDlwOVQ5QllySS9rMEhiSlZtT3lEZExKTHlIYlgzb0owV2g5NHg0YnhQNGRB?=
 =?utf-8?B?bnpWcjBwKzU1NnZQS2JPd0p5VVFhVkdUaTdzdnNJb0FkOFRPNXltNVZ3cFAy?=
 =?utf-8?B?VithWWwxbnU2MVJkbDcxQ2hOUmdlamlDNTg3eDl5T0xZRjc0ck1DNmdqY3lO?=
 =?utf-8?B?KzFENjNxL244TVZ5VjhEQ2tlWXIyQ25WYXFZbjFZUy8wdEsrZmh3clh2VlBT?=
 =?utf-8?B?UHRYUXZUcDJBdTBWNDFmVHFNdjRKUlUwUDBjNTJsTXhRN2ZsR3BRSTNqbzBT?=
 =?utf-8?B?M3JtRncrWDRjY2dtZXhwK0NieEYrOERKTXRpVkNDRHQ4anBYSHhWS3NpUUpP?=
 =?utf-8?B?MFMyTFVLbFJabFoyMG5acFEzZE5SNGVjbVJzTVZqT2JvcERUUXQvY0lEbnBV?=
 =?utf-8?B?eDd1d0F0R0ZWWi94ay9CY2REYnBybzV0TkpSaWx0RWZ5TnVmeGYyTVVYSFZj?=
 =?utf-8?B?TlB0aGZGZ3lLQzJjUUJhTVhIcjByUVovU2gzN3I5MHQvQzZkaTBOOHZnY3RJ?=
 =?utf-8?B?Z0RlbndmdGRJQUszSXl3UjlFeWJuOExSSklqbHI3RjBKdExNSnNtbkxySlFE?=
 =?utf-8?B?cUFnaTg3azQ2Z0VkaFFnaUxaQzlCaHBPTVAwT0N3SXoxYUpqWVVLT2FuaHdK?=
 =?utf-8?B?TUZ4Si8zTS8rdmh0aE92TUxrR2U0L0M1MENFdEwzYXhmWHB1NzN1VzgxMlRH?=
 =?utf-8?B?cVRpWFFoZDlrdmhxekdoaGRERTdPTXk1RVZ2dVpuNmtFczZ4YTJIVWVXK0cr?=
 =?utf-8?B?bVJYOTJ0eUpBSmwrbnBscG5nZm5FU2c2OEYzMUVyMmhqSS96ek9QN2tPc1Qv?=
 =?utf-8?B?a2NxMjhNMHZyM2NPK2hnbTlQQ3pWK3RQTnJMc2s1UHREeXo4MXE5QjVIRzFZ?=
 =?utf-8?B?VE80YmtsaHN5SUwvN2tZRXJPTGRnQ1doY3FTZlFWQW1mM1d0TUtMckRPMHNV?=
 =?utf-8?B?STREdmY4bmkwQjNyd3puMGRwM1FpWGZSUnlsckpHWGQyTGV0aHpxUzlQbU1C?=
 =?utf-8?B?Y01jb2hPRHR5dk5IdVJiM2JqV3VOWUtrZXE2MkMxMkdDSEMvdHJuZnZ6OU9x?=
 =?utf-8?B?UmsrQmpMTzBzRzFZb2E1QWlDZDltS3o1VFZIUjNmdkJyRlV0VG5WLzFWT1ds?=
 =?utf-8?B?VklVN0NGZHhFbjBzc3g4cUVkcVRXU2V2eVRQZ0ExZWtuQkJreUh4NmpUZzBz?=
 =?utf-8?B?cENRRkNmL2xuRGJCZjlHc3hSTHFOR3pnMVM0OUZnOWo5bEhHa0JKcDhxK1FZ?=
 =?utf-8?B?WEZ1RHFQNzFXVmlaNmFyZ3lKcnRndElTcHRkREVMbTRxSmdkRVpGMlFuaWZZ?=
 =?utf-8?B?UVRxME1nVEU5c25lUEV0dG13QTZ0UG5LdXozMVZOVVRGMTVjdTRtZUF3WUZa?=
 =?utf-8?B?R1lFTmprZUdjWlIxeG1nSkQ3MUpnSXFGQytCQ05uaW5OMHJUb0w2c0VERGVH?=
 =?utf-8?B?SGNybHY0cnZ2UkIyTzB0akVhVGp5dklnanV1a05waFZYY0pSVzQ4NTNRL0Y4?=
 =?utf-8?B?OExKSTNnUkVOV01kZG5vSnNMRWdGaDJMUlJ1M2ZpWnVSb1RsczRGS0dnUlJS?=
 =?utf-8?B?NUZYMlVoZHJqc01Da25iMVJPZHZaMU1jQUdTbm1IN2V0T3gwNWtwM1ZXaUUz?=
 =?utf-8?B?V1VRaFlYYXpta1dlU3drZFhFZTJKNGpYLzlZS1g0dEF5bG0zcVJRTTZsYThK?=
 =?utf-8?B?RjUwT3cvdTNrMFFzUXVaTXNXVVdxRDVlZmZuUzVYcktodWZFTG1tNDlqakNq?=
 =?utf-8?B?MkRObFVPK0pvRjhyc2pWYUlGZnhycHpsQy9rZjg3YW5HVEh6RFl0c0NLMTlm?=
 =?utf-8?B?N2Q3NXRqWGVJZGpGOUZocnYvUUNidy8yYWJrWThrTFNjSEtZMEFZVk1pcFRh?=
 =?utf-8?B?R0F2aktDVm1VaGF1Mm1xWjhaLzl1Zlo4bU9qcHQ0MU8wM0JrM0xMKzA0dm4x?=
 =?utf-8?B?QW5ZWG55aEVLa202cG5MczF6czkvYlB4T1hqRFFGME9TVDZDakpiaUxNTU9i?=
 =?utf-8?B?SGxlelZOSHZDWU00c2JEWFpnYXlCMkUwc2pBVlh3aVd4eHhyZm96RUl6SkMv?=
 =?utf-8?Q?E7YJAvHKmp1o3m8E=3D?=
X-Exchange-RoutingPolicyChecked: rdoee9HwbuJRAWKAKuItaKQ+AwwQlg+u7fbzI7ll6iIP2/XtWaVjMRT407bK/CDs22qJTF0uu+Ne5/DVzUC4X15BaEAbp61I4PEC60EoyNTTqAwc1OM0sTzkvk5/AXBLmuFbox8uMyRtA6epixz50mXVgrSvs/U6Jz4Ntth+vZUP0cOEs9IbW/parpHmIyOrPsP55Ge1YZzzlwo+hL+WDLOBaelH6KtEUPsVzgLV+1/sUL5Fm3+cwHrxuJglXKuUEpyJ0I10O8Gxc62u9GCChQn7cqhHHubsU8PJzkoHmoNnkdAdb6+Co3x34UUxcj/scZXgIN5VJl0YPywTsNunZQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 610e007b-0806-403c-344c-08dedb6b61f4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 14:32:18.9046 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tjgzqSkohjp4PJr7B/JZ7rZlhYByweZycjzIvKbsVaL+IG4kb6W3T0JQC6GBFRQnKvlbRoR96QBihRIdGzs4o0cSIEP9qmr411sBhKHAmaU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5048
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



On 6/30/2026 1:55 PM, Mallesh Koujalagi wrote:
> Replace the open-coded drm_err() call with xe_ras_log_wedged()
> macro so that wedge events are reported through the unified
> RAS/SIG logging path with a consistent format, CPER severity,
> and errno.
> 
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
> v2:
> - Rebase.
> 
> v3:
> - Update message in xe_ras_log_wedged().
> 
> v4:
> - Replace XE_RAS_WEDGED to xe_ras_log_wedged. (Dnyaneshwar)
> ---
>  drivers/gpu/drm/xe/xe_device.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index b6e49309a99f..7538ac7c7dfb 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -62,6 +62,7 @@
>  #include "xe_pxp.h"
>  #include "xe_query.h"
>  #include "xe_ras.h"
> +#include "xe_ras_log.h"
>  #include "xe_shrinker.h"
>  #include "xe_soc_remapper.h"
>  #include "xe_survivability_mode.h"
> @@ -1428,12 +1429,12 @@ void xe_device_declare_wedged(struct xe_device *xe)
>  	if (!atomic_xchg(&xe->wedged.flag, 1)) {
>  		xe->needs_flr_on_fini = true;
>  		xe_pm_runtime_get_noresume(xe);
> -		drm_err(&xe->drm,
> -			"CRITICAL: Xe has declared device %s as wedged.\n"
> -			"IOCTLs and executions are blocked.\n"
> -			"For recovery procedure, refer to https://docs.kernel.org/gpu/drm-uapi.html#device-wedging\n"
> -			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
> -			dev_name(xe->drm.dev));
> +		xe_ras_log_wedged(xe, -EIO,

are you sure that this errno is always correct/sufficient?
there might be different recovery methods suggested by the driver
maybe at least you want to correlate this errno with available recovery method?

> +				  "CRITICAL: Xe has declared device %s as wedged.\n"

"CRITICAL" word seems to be redundant as this error will be already tagged with the "FATAL" tag

also printing device name again is not needed as drm_err is based on dev_err which already prints that

> +				  "IOCTLs and executions are blocked.\n"
> +				  "For recovery procedure, refer to https://docs.kernel.org/gpu/drm-uapi.html#device-wedging\n"

one of the goals of this new error reporting mechanism was to provide consistent guidelines and remediation based on the error signature

so where these guidelines will be published ? maybe on the first "structured" error we should also print some hint where to look for help?

how will we make sure those new guidelines are aligned with the above mentioned recovery procedure?

> +				  "Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
> +				  dev_name(xe->drm.dev));
>  	}
>  
>  	for_each_gt(gt, xe, id)


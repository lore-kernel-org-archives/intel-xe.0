Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD6AC4345F
	for <intel-xe@archiver.kernel.org>; Tue, 30 Apr 2024 23:57:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0E5B11207E;
	Tue, 30 Apr 2024 23:57:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y2ROUXQy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FB8811207E
 for <Intel-Xe@lists.freedesktop.org>; Tue, 30 Apr 2024 23:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714521422; x=1746057422;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aP8CrtBZZe/TD5tArdddWVB53YbLNTVaCZ24Rd718lg=;
 b=Y2ROUXQyYcxT8HeBm4wdOJkRpxVV5iKLQyKylRzLGhGB9HUicq/927j2
 JvvGhj5R0KUywufkfIHnUgmKSxDfh2duZQ1Hhg8gdNAytw4C0xUuaxWWt
 IP0bKe8ml33EePOIEEVtaGnG/xImAm7BMTO1FduHPRtkL4VW+YtlfPOAf
 e+DuFIXc/CL1P6xw0QwSnmWmRwnKELzAlnEKk9hWVlPTLhkpKDnnSffbQ
 +NmIVU///ONXwvxnpiMO0/vpqsASUBhDjCF6ClHfcfhiDn5x3rF9SArCf
 yb0u+NUPQPhax3apv1bz4Zgwq3eh56rbgKnBDMWgvlZFaA6KGYFBYLFXX A==;
X-CSE-ConnectionGUID: +pZNYqiGR9iwP4G+GyY+aA==
X-CSE-MsgGUID: 2zhDdksTRMKjNiJx+Ne4Dg==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="14049437"
X-IronPort-AV: E=Sophos;i="6.07,243,1708416000"; d="scan'208";a="14049437"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 16:56:58 -0700
X-CSE-ConnectionGUID: M4baQ2aXSKqvdlJFLhm9Aw==
X-CSE-MsgGUID: 7v4L33RcTXyitoNwRMBPRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,243,1708416000"; d="scan'208";a="31101983"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Apr 2024 16:56:58 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Apr 2024 16:56:57 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Apr 2024 16:56:57 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Apr 2024 16:56:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EqRBX2EClYzp9QxqnfaH1u5xO23ow+iMyS6x4k4CP4EMZU5hJD20rw4OzN1ERXu9ABEy5W2sf3UmipVRPeoOla4N0ObvLt8nlg2j5m+4YS70NLHTlN/Lw1U3nGX8E3XC68PCEHpl6lvCtQddIUsgIAyf0vDkIXRzs3gy05mbQ3dq+PtSNPmvSbklLfbTpsSMG2+oYLGJ/iT7pZEInldNfXN/4XkfhMsT84VPDdSS9p3c6az/FaGcQ17/VvT/x2rHG1l8fHmvboZZ3j3JeEoe03SvC2IjZckaQu8D9cZeXRt3BbxiZLpUOKG7k/p2uNTNUApAWhLeHYyJLa3jfmJMMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E+BuS66AHWDqnl7sERS9moStLJ/4i7lm7vHhtUe6UFM=;
 b=fvxA5xM0rbs3RnP7oBGml02wCtY6zOfJl5jH3FPnuU25gM7nliXii9xxG72mMq4lIWFiu9ohFxurNKmwKtWFgyWkM58tbYDUVPVUt0EbmdOmx4T2lwqg8BE5GutLtDfuQNqwLvFClxdiikxkoOuPDjuBq0ozZZcQly0Res+1tKGXxqkJ4o7Ywq72UPSJYunWB5kXTkSSB8NeTftDK7HPvFWw6oDAFtOBnX1lTmIPK8YKoMLW5uyMD14icVm/+59P9oPjc5uGSf1DJLgAjQ2HapbhQ4rvj5jEihJlo5L4UhSepNQ+i/ptJD3Xq1s+6a1ut1SM6aIwcMYJbrDIhHQMIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by CO1PR11MB5138.namprd11.prod.outlook.com (2603:10b6:303:94::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.36; Tue, 30 Apr
 2024 23:56:54 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.7544.023; Tue, 30 Apr 2024
 23:56:54 +0000
Message-ID: <5c8854a4-24f6-4106-9ccf-8764e1041580@intel.com>
Date: Tue, 30 Apr 2024 16:56:49 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Improve robustness of GuC log dumping to dmesg
To: Matthew Brost <matthew.brost@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
References: <20240430233436.2838165-1-John.C.Harrison@Intel.com>
 <ZjGCYRp7J0/b1MiW@DUT025-TGLU.fm.intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <ZjGCYRp7J0/b1MiW@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR16CA0001.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::14) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|CO1PR11MB5138:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f329834-f16e-4c32-bb3b-08dc69713613
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R2F6WitrQXZBSks5VjVqb2doTHdRNVZFbHVvMVd2YzJjRzVwL240MDJuTTJC?=
 =?utf-8?B?b1RzbittcjFZQmsxbkNtU0NWekFFRXlsWkF6YWpkckF3eWU4bFllcG53MzZs?=
 =?utf-8?B?ZGVFWHNEZXVoSE4zVjZibTJlakR5NnFoTmQ0QWNsSHZYSE9EWDI5VmNOZThE?=
 =?utf-8?B?T0tBSmhnQXR6cURSVDNHSEd6THZpV3FDV2tXSFowNnAvTHZTcjdzeTg3N0dP?=
 =?utf-8?B?K2RFcEFuQzkwM2cwZDlFaVZVTVYzRm1RZEh3T2VnUHlZRUdkOXlSVWlZUUdz?=
 =?utf-8?B?R29WZHdQVWVxaVZLK2NWRDY3YWhrUmJQUThyWTJrNkl3eHBPU01KU1dKYy91?=
 =?utf-8?B?N214c2UxRU8wUGVzSjVRRXhXaHZraUMxNU90SjdqS1dVUTlRU0tLZVlLcFlM?=
 =?utf-8?B?QzVVUHphNUpzcUordGVMbWhqN2dMa01SUTExYTJQdUVsMzBSSzVEVDhzQ1JC?=
 =?utf-8?B?Z1ZpODlPQmdDOEdKdUdtMU0wZmcrT0RKQkwrY21wWkZXRk1VVGY4bjZwaE80?=
 =?utf-8?B?bjJ3QWpTd2N4czZxSmMrTnFwenQrUmtlOVNndmFGdWNKUXVqTU9lNGs5U0lY?=
 =?utf-8?B?M2hhcU44ZWxIdmdhYVZtcThvR1RNSXdBTjhQeHFmL252U0sveTMyelloM2Ey?=
 =?utf-8?B?UllIaDcxRG9TaFZQN1ZycldidUdFcVVCMXRHWU9tei9pdDRxY1J5eFBSVU1q?=
 =?utf-8?B?VmpOY0VzZ091c3pyNTRwdnRpNE9yZWt6WTlrdlNtUE9Ta0lUbEtLd2k3TnZ0?=
 =?utf-8?B?My9ZV0hicElBSS9mRkZsSlBMRW9ITHluVVpHdzM4bVFNbXJ1UnorN3ZTTlIv?=
 =?utf-8?B?ZGJRREduL2hTdXVMOUcvOWJDOVVENlZCV3lETkUxZytZWi9URWlrdG1VcVVv?=
 =?utf-8?B?aHptVWp4OVdKUzRDZVN3WE9sb1MzWGlWV1cvQzRUODNMNktwQkNkU0c0V05X?=
 =?utf-8?B?MjdQVTNRYSswZ3ZVWjZsaVdLeXdmQ1UvK2VnL2NXSmFCL0VMcytvUlFxRTA0?=
 =?utf-8?B?VG9tdGozZ2p4dklwNWJxb1p2V0ZPV2ZyV0Q1SnI2SzhVRldEN2ZFQXlZRmtO?=
 =?utf-8?B?eUZhaVY1ZERubm8yMkpWb09xU1F1dmVPZjlwbTJydmF5SW1pVGNDazA2Nmx0?=
 =?utf-8?B?QmluZ0k4RjJnYWg2LzQvMkprUXpKWTF1QTZsQk8vazAvT0NnV1pQTUtCNlhk?=
 =?utf-8?B?RTFjTjZjWFVBQ2ZWZHU2TkFjM1A3WE5jYlpEVDlERXVLckEyak1WZnNWK24x?=
 =?utf-8?B?WDVpOFFDWE5wbHFYbmZHaW9MS1hVWGF5SlFsa09GTi9IUGVmQjd6ZHVObmNo?=
 =?utf-8?B?a0QyZU9ueWVlUEVXcjNkd1YrWk10K2dhajhTUHo2dTVoVDF1SmxOZVU1ZlRP?=
 =?utf-8?B?UGdneVBBdjZUaWZYNHA2bW1RYmI4UFNtTVhaZEd3ZU9heHhaNmhHQzNTdzVN?=
 =?utf-8?B?ZGVwQ1JyUmhrOW13eGJRUlRSZ3R6VzRGTWxUYWpNa1JESHN0d2hqRjNDa1lD?=
 =?utf-8?B?alNWRDI2Y1hVWGtpUW0xN3RBbUNYYWliblM3aVpMZExVUGxLVG03MnRLTHRz?=
 =?utf-8?B?NkVrbTJIWFhHTnNCYjJZTGZRT2xpZFNmSEIzMXE3RnNha2t6T3VueDkveWNK?=
 =?utf-8?B?c0VUSXhYeGZvd3BQV2NzeHIvM2IxYWtyYkYrZHBkWE83dllkNDRtYzBNSTVJ?=
 =?utf-8?B?cGlia2E2OVg4aDE2M1JEcTBOcytNZ0tVL3B0a0NxekJ1ejZTejhvQThBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVhkRXp6K1dEV0NreHFZWlhnYXFPMVNiTXR2Q0xwZm40Rm1mSDNWZllvWk9D?=
 =?utf-8?B?bkplT3RHcDVCb2NJRHdva2dVVXNlTFF5NEpMdEZhZ0FXOHFZOGppcGZTV0J2?=
 =?utf-8?B?c0NYYm4vWm5CTXZ1MjJ3aWdoYy9ncGV5UzZNL25qV1RYaGVxZWowYTA3UEtv?=
 =?utf-8?B?czFYdWU0eTVUNG9DNjY4NDhGQ2k3TjZHRzllQ0UzbDVDMHVDVklXUDVxTnpl?=
 =?utf-8?B?UFhocFRJb21ndXhoZHovMEJrVlM4Z3VmU3YvQ3BnSkRaRm5NN3NhNURUN2Z1?=
 =?utf-8?B?c2Q1a0t3alV1MS96dFk2eXN6UTF2MUxjbzlqeDlNcFlISFVhNmpUNU5PSFU1?=
 =?utf-8?B?ZzBvc09DVTMxUHlzZjJkc0FsSzVCVWpVemphQjdHZzY4QjIzUlpHL3QyN0Rj?=
 =?utf-8?B?REhSWHRER2VuMEN6ZThoL2RhYmlzSnRBeGl0bUNnVG10T2xidEJIMWJ0enBu?=
 =?utf-8?B?SmQxSGFQQ1dIaDVKRG16bStDc0ZIeTFLTUYrc1FySThJdk9CTzhIa21WaGow?=
 =?utf-8?B?QzFYcUEwd0VpZG5keUthUURzSTdhRUhvZ2s4QlppUFl0cjBqNnJleGhORytU?=
 =?utf-8?B?bS9WU2crakRocFRLbFdEbU45U1lpd2QyNXQzWDVsNHF5SDBOOW5QOGp0NTVW?=
 =?utf-8?B?bENCN0RFVHMveWFJKzE1OXluUlhnS3RSSUg1SFB5T3JoSHFUSDdUaE00a3Bi?=
 =?utf-8?B?c2Z4ZmFlaXdKN21lQUk1SFRGTVdkSmtjZzQ1enNyam1ZWEZwcDZKT0UwRXJX?=
 =?utf-8?B?YzVhQzh2OUR3RHFCcjlFeDNBZnFsQ2Y2cVVwclNqMUZNN01CR0Z1K3g3Znh5?=
 =?utf-8?B?bmp3dmZ3cE8xdVhZMnlKSDdvcmpvc1JNNlA3Qk11WHl0UlBYSXdRSmFZUFZY?=
 =?utf-8?B?UEpuaGY3VExSaWpLY1NiNzJ4dWhRZjBqVTR1WXV6dFZjdnNSbnFuaTViQ3Nh?=
 =?utf-8?B?WlpvbVVRdm9FMmwxMnFhU25aOTFXc1BZY3oyTjF1YWhCZ0hXWlZzSHBJYkZG?=
 =?utf-8?B?YkM1d1dsWHNlNjNSWU5QNjJKWTlzUUYyQ21Ia3p1cGJRN1phZ3Z6M1pGNDdu?=
 =?utf-8?B?TkxsdGc1NzRBNzBFTVZwL08vYjR6UDdtc1U1Vm8xLzlFWVFySFlSbTcweXV1?=
 =?utf-8?B?dnhwdXljTStjbktheWx1SDRYSEJLQTNRWSs0R1lDWUpiTHpUdGRWOWRYa0ps?=
 =?utf-8?B?T2d3dTdja1RzTTdzeUk4V3pKQW9mQjVaWi82WjF1MFBzMEx4SFNpOUNiZGdV?=
 =?utf-8?B?WEM2Z2RJZEhWaGpFQW5DTEZicnBiSlR5enNSMEVERy9vTld2K0M4L3dpY0V5?=
 =?utf-8?B?bVVCZU1uTEl4ZEVZUDF5azFVZ1QvQmJYUW1sTFQwYjNIOG1oWGFjcDVuekpw?=
 =?utf-8?B?NkU1dTNUOWxhb3hwdS9lZzdYVHA5VGkyVktEMWlGbm5QWHdaK2F5U0gxY1c1?=
 =?utf-8?B?YnVNYi8vMDh2aHd2YVI1d1VJTndvQXo3NTk0Q3FOUkdZTzJpaGlDamJKS21K?=
 =?utf-8?B?eW50KzlUUHlPVmc3OFlPSktlVjBQYnRuZVhTL0hxb2hlRmZhUXhBK0doVTJs?=
 =?utf-8?B?Mm1MdEFZVFNJQzZINE8zbk9ZSW5yR1pORzk4V2UyQm5nbTdGeXBGeDhibEkv?=
 =?utf-8?B?eEYxYjJTeEp4Q1M0U0habEVURDNwM3Z6cGF4d3NMSjRXQlJRTkxjSWMyS0NH?=
 =?utf-8?B?REJacWRxdEJHRTVhQkVoa09EbjBhNFEvUlRxaHVBUkdSK241dDZBbnMzL0dF?=
 =?utf-8?B?Njh2V2drVXZtd3cxWnhZZjNMNVpVT2RsaUtTSGtqL3QvZk9Ya1BSbnlTdmlL?=
 =?utf-8?B?blhtQklTRWtwUyt4V2pqRER4QnYyN3pTVUEzMmdLSUdhTHJuUThGS2drWi9I?=
 =?utf-8?B?MDhsdkFrbVllZUtZY2VpcnhXVjh4bjRoeHNyTDBCZFdENG1DcHRYWkZrQ2tJ?=
 =?utf-8?B?VVoxVGRyNDB5clE0T1A2YUp2emhtR0Q1U3FMRGE3Q0V3YzkvRlpaRGxrSHhn?=
 =?utf-8?B?aVJuTEVDaEMzTnl3dUJmK1VjRlpNeUcxMDlzWlhnTVArUW9ldjJNYlZRR21H?=
 =?utf-8?B?Zjd1eE1maGMrZVoxNGIrZnlWcVRPcFA5UWNTeXdZYmdrbEMyUldZdllrQVEz?=
 =?utf-8?B?TlVRSW42TUZtcm5ZUU1IYkRBNHhWajdWUEUyV05NanFIUEtMam9UdjNKLzU1?=
 =?utf-8?B?T3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f329834-f16e-4c32-bb3b-08dc69713613
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2024 23:56:54.0690 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /y9jbrMIGCcE2LS84laHu7N9lcSn5567hzLxUvthpK7gCsYPxByFY2cO1Q6kYdPP1SYkq2dYkDgFrqmGokY562ZeUtvNisibQ1DJm3oOVf4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5138
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

On 4/30/2024 16:44, Matthew Brost wrote:
> On Tue, Apr 30, 2024 at 04:34:36PM -0700, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> There is a debug mechanism for dumping the GuC log as an ASCII hex
>> stream via dmesg. This is extremely useful for situations where it is
>> not possibe to query the log from debugfs (self tests, bugs that cause
>> the driver to fail to load, system hangs, etc.). However, dumping via
>> dmesg is not the most reliable. The dmesg buffer is limited in size,
>> can be rate limited and a simple hex stream is hard to parse by tools.
>>
>> So add extra information to the dump to make it more robust and
>> parsable. This includes adding start and end tags to delimit the dump,
>> using longer lines to reduce the per line overhead, adding a rolling
>> count to check for missing lines and interleaved concurrent dumps and
>> adding other important information such as the GuC version number and
>> timestamp offset.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_guc_regs.h |  1 +
>>   drivers/gpu/drm/xe/xe_guc_log.c       | 78 ++++++++++++++++++++++-----
>>   2 files changed, 66 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>> index 11682e675e0f..45fb3707fabe 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>> @@ -82,6 +82,7 @@
>>   #define   HUC_LOADING_AGENT_GUC			REG_BIT(1)
>>   #define   GUC_WOPCM_OFFSET_VALID		REG_BIT(0)
>>   #define GUC_MAX_IDLE_COUNT			XE_REG(0xc3e4)
>> +#define GUC_PMTIMESTAMP				XE_REG(0xc3e8)
>>   
>>   #define GUC_SEND_INTERRUPT			XE_REG(0xc4c8)
>>   #define   GUC_SEND_TRIGGER			REG_BIT(0)
>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
>> index a37ee3419428..ea269efd9c21 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_log.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
>> @@ -7,10 +7,19 @@
>>   
>>   #include <drm/drm_managed.h>
>>   
>> +#include "regs/xe_guc_regs.h"
>>   #include "xe_bo.h"
>>   #include "xe_gt.h"
>>   #include "xe_map.h"
>> +#include "xe_mmio.h"
>>   #include "xe_module.h"
>> +#include "xe_pm.h"
>> +
>> +static struct xe_guc *
>> +log_to_guc(struct xe_guc_log *log)
>> +{
>> +	return container_of(log, struct xe_guc, log);
>> +}
>>   
>>   static struct xe_gt *
>>   log_to_gt(struct xe_guc_log *log)
>> @@ -49,32 +58,75 @@ static size_t guc_log_size(void)
>>   		CAPTURE_BUFFER_SIZE;
>>   }
>>   
>> +#define BYTES_PER_WORD		sizeof(u32)
>> +#define WORDS_PER_DUMP		8
>> +#define DUMPS_PER_LINE		4
>> +#define LINES_PER_READ		4
>> +#define WORDS_PER_READ		(WORDS_PER_DUMP * DUMPS_PER_LINE * LINES_PER_READ)
>> +
>>   void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p)
>>   {
>> +	static int g_count;
>> +	struct xe_uc_fw_version *ver = &log_to_guc(log)->fw.versions.found[XE_UC_FW_VER_RELEASE];
>>   	struct xe_device *xe = log_to_xe(log);
>>   	size_t size;
>> -	int i, j;
>> +	char line_buff[DUMPS_PER_LINE * WORDS_PER_DUMP * 9 + 1];
>> +	int l_count = g_count++;
>> +	int line = 0;
>> +	int i, j, k;
>> +	u64 ktime;
>> +	u32 stamp;
>>   
>>   	xe_assert(xe, log->bo);
>>   
>>   	size = log->bo->size;
>>   
>> -#define DW_PER_READ		128
>> -	xe_assert(xe, !(size % (DW_PER_READ * sizeof(u32))));
>> -	for (i = 0; i < size / sizeof(u32); i += DW_PER_READ) {
>> -		u32 read[DW_PER_READ];
>> +	drm_printf(p, "[Capture/%d.%d] Dumping GuC log for %ps...\n",
>> +		   l_count, line++, __builtin_return_address(0));
>> +
>> +	drm_printf(p, "[Capture/%d.%d] GuC version %u.%u.%u\n",
>> +		   l_count, line++, ver->major, ver->minor, ver->patch);
>> +
>> +	ktime = ktime_get_boottime_ns();
>> +	drm_printf(p, "[Capture/%d.%d] Kernel timestamp: 0x%08llX [%llu]\n",
>> +		   l_count, line++, ktime, ktime);
>>   
>> -		xe_map_memcpy_from(xe, read, &log->bo->vmap, i * sizeof(u32),
>> -				   DW_PER_READ * sizeof(u32));
>> -#define DW_PER_PRINT		4
>> -		for (j = 0; j < DW_PER_READ / DW_PER_PRINT; ++j) {
>> -			u32 *print = read + j * DW_PER_PRINT;
>> +	xe_pm_runtime_get(xe);
>> +	stamp = xe_mmio_read32(log_to_gt(log), GUC_PMTIMESTAMP);
>> +	xe_pm_runtime_put(xe);
> Just a quick drive by comment, fine grained PM control like this frowned
> upon in Xe or maybe even not allowed. Rodrigo / Matt Auld would would be
> the experts here.
>
> Presumbly all the callers should already have a PM ref.
It wasn't clear that this would be the case.

And the whole pm_runtime interface is exceedingly confusing. _get calls 
get_noresume then does a task ownership test and calls resume, 
_resume_and_get does exactly the same but in a different order, plus 
there is _get_if_active and _get_if_in_use. Plus _get_ioctl which is for 
calling *before* making an IOCTL (where an IOCTL is a call from the user 
into the kernel!). And none of these have any documentation beyond a 
single sentence that is simply re-writing the function name with with 
prepositions added.

So I am unsurprised if this is not the correct way to do it but I have 
no idea what would be the correct method.

>
>> +	drm_printf(p, "[Capture/%d.%d] GuC timestamp: 0x%08X [%u]\n",
>> +		   l_count, line++, stamp, stamp);
>>   
>> -			drm_printf(p, "0x%08x 0x%08x 0x%08x 0x%08x\n",
>> -				   *(print + 0), *(print + 1),
>> -				   *(print + 2), *(print + 3));
>> +	drm_printf(p, "[Capture/%d.%d] CS timestamp frequency: %u Hz\n",
>> +		   l_count, line++, log_to_gt(log)->info.reference_clock);
>> +
>> +	xe_assert(xe, !(size % (WORDS_PER_READ * BYTES_PER_WORD)));
>> +	for (i = 0; i < size / BYTES_PER_WORD; i += WORDS_PER_READ) {
>> +		u32 read[WORDS_PER_READ];
>> +
>> +		xe_map_memcpy_from(xe, read, &log->bo->vmap, i * BYTES_PER_WORD,
>> +				   WORDS_PER_READ * BYTES_PER_WORD);
>> +
> Also I think the above pukes without a PM ref too.
If that is the case, should there not have been an assert about having a 
PM reference at the start of the function?

Although I don't see why a PM reference would be required to read from 
system memory on an integrated part? Maybe for a discrete part. But I 
would assume that having a vmap in existence would mean the memory is 
locked and accessible. Either that, or a vmap is only allowed to be used 
by accessor functions which themselves do whatever is required to make 
the access work.

John.

>
> Matt
>
>> +		for (j = 0; j < WORDS_PER_READ; ) {
>> +			u32 done = 0;
>> +
>> +			for (k = 0; k < DUMPS_PER_LINE; k++) {
>> +				line_buff[done++] = ' ';
>> +				done += hex_dump_to_buffer(read + j,
>> +							   sizeof(*read) * (WORDS_PER_READ - j),
>> +							   WORDS_PER_DUMP * BYTES_PER_WORD,
>> +							   BYTES_PER_WORD,
>> +							   line_buff + done,
>> +							   sizeof(line_buff) - done,
>> +							   false);
>> +				j += WORDS_PER_DUMP;
>> +			}
>> +
>> +			drm_printf(p, "[Capture/%d.%d]%s\n", l_count, line++, line_buff);
>>   		}
>>   	}
>> +
>> +	drm_printf(p, "[Capture/%d.%d] Done.\n", l_count, line++);
>>   }
>>   
>>   int xe_guc_log_init(struct xe_guc_log *log)
>> -- 
>> 2.43.2
>>


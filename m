Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A50CC282EC
	for <intel-xe@archiver.kernel.org>; Tue, 11 Mar 2025 14:25:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E80E10E5B3;
	Tue, 11 Mar 2025 14:25:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VbTboO93";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 344F910E5B3
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Mar 2025 14:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741703124; x=1773239124;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=DJeUHlsxe3Y29Q6IVIiJt/pZwVHbUxNN899H6ol7C6c=;
 b=VbTboO93mVIvsg2PfTfWl19ZwKHqU5mjqKrOzaHasbvADRDwoMlVXNW2
 Qqmo5bbakzIBi/pI0tptWubI+JFe9SVg8JB5NIfyhW/Ddyakn10mohqZN
 TF9oRJ81sfuXSqypXTlNlujSMHa2KXaYDgwuwnZtfny3uKOi5VlzMxDlA
 OD8RYvmo46r/TnwRWJ7JaIQF2iQdE1ywxDlVLyRyUOkQZlsWQTA+c172k
 YEGSuksiQLf11zcqj2p4PbiDj2HfmORfkgsguNyKpRkwWuhTi+XnC7+mf
 eoPRQM8Vvjq0wjwBdKOUL83cSrnDwXaPCpAhj8uWzSJisW94ZlszawxUg g==;
X-CSE-ConnectionGUID: Oi5GSObxTY+gy4dff2JcoA==
X-CSE-MsgGUID: KdqlBj1tToajEHbV/NiqvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="30317490"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="30317490"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 07:25:24 -0700
X-CSE-ConnectionGUID: 7O8whfikQd6cFLC7mde+Dw==
X-CSE-MsgGUID: T6/2/yaEQuSowVHKR/HElA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="121230229"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Mar 2025 07:25:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Mar 2025 07:25:23 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 11 Mar 2025 07:25:23 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Mar 2025 07:25:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X5KAPRfWxpI6vP46kmh4idG/+hvktnEAmBvZrOIY0zV75w6i+sStXz0IvgDM2PMx6HmMUgSTibPM75vIxBM9gzsKa0k1W+cSSfIWJ8Q7IKs4aYoCTdeRyraCK5XjZ6vaZ1OhtX9hcCwFAePCyQAz/eF0CTxieN/Vr1ty6GXcHPsNptrRTFRdyYGX1ZhbvRH5Wk0rOSMZKYUjmy/reXr11TNd1s4aLGyxZswbi9i/OTuoKerproo545jdnnCapuzKXWXUgRTcn5ZXci7zJhTYJ3AwCCdIwzEh3w7VvdNxnPm8eY6rlHnAE75MDxn5keOzba/7dgZGmPc8dJhow4ZieQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N8iv6xkvgkYQJ3KBbNyOJd9afUDeE/92uqCkAaLVPz8=;
 b=Hw5FjK8W8U2+aXX7TwVMF0e3fBwsKWftKpf2nfJvn8pdD09N42i3RliriEOXKhCvsSYwPULL+VeMLsKijHe5E66hih2nIv78EcUjFupAPmXulNWiHyr7MW4MKZx/SkYnpLpt2mlwMCEget9go0Iw3Y1dFrnKXvicrrZPbovVbzKUEQ5AtBeI1yYNlAU0zmB3cOY79Sez52iHFUiiKQiTUfoGlYDFkIef87cKogqb0VDnUnpgN1DL4REi9VPCZ8UXquM3AnPhQs+8lp8Y/82vmi9aHt06rqlmCsylUDwwmfMUTkegYoX5QX0A6tEtKtQEFjPsYSWQjBfQ45pPQxzRQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CH3PR11MB7761.namprd11.prod.outlook.com (2603:10b6:610:148::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 14:25:17 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 14:25:17 +0000
Message-ID: <0af001ae-1e86-43ea-849f-30213936ec14@intel.com>
Date: Tue, 11 Mar 2025 19:55:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/vf: Don't try Driver-FLR if VF
To: <intel-xe@lists.freedesktop.org>
References: <20250311135726.1998-1-michal.wajdeczko@intel.com>
 <20250311135726.1998-2-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250311135726.1998-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0068.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::14) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CH3PR11MB7761:EE_
X-MS-Office365-Filtering-Correlation-Id: 94769492-11b1-45e1-b607-08dd60a88bcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cjBiR3dqN1plN0taM3VRbGpxa1M0NG91TUxEZEdiN1BzTGRDYUloMDhQaHFI?=
 =?utf-8?B?L1NnRlFnenNheXlyMWdXcnNWR3BkTDV1T3dZYzRta3BXL1NFRmQrUUxMMVJ2?=
 =?utf-8?B?OWE4TGNHeFF3Zkt6dkl4UkJSK1pHRVhWbjFMYzFDOUtud2NZaEFuSHM0SEZ0?=
 =?utf-8?B?aUhzbjVtVTNuTmZibW9kUDl3S3ZVcGNkWXIvVnBqRVJ6bTlXY21CekViMzVx?=
 =?utf-8?B?QWhRblhxcTNxVms3NThnMGxJVGdnWk1TeXRKU05mYnh5UmN2ZisxVTBjbWlu?=
 =?utf-8?B?S04zcjJWZGNKV0MzM250bDQzay9PMytKaHRtanBnc0V0K1FPZU41VFdMLytl?=
 =?utf-8?B?azJjVjZBK1Q4TndxdjJBL01BVmtpai9iN25hZEtBaDVMcjB4SGo3a1BzMndY?=
 =?utf-8?B?MTV3NkJqRUpSZldOSjlwU2FtV3VRQ0NFSzNORVhIcW15S1JhcU82eDJNT05Y?=
 =?utf-8?B?N3dEKzdCUTVoWG1hODFnUytCUUJoalhiYnVvLzRUVS82ejkvbXlPTUVBcnNy?=
 =?utf-8?B?ZVFhMXNJNlhYMXhNTm04YTBRY0orWU5uUGw1TGZxQk83Uk1kQWFsU3Z4M2ht?=
 =?utf-8?B?U1VjY0Z0L2VLYWdJN3ZPVHdubnFuNFFGWE1JQTYvQ2ZhUi9uVG1WSGFWVTVS?=
 =?utf-8?B?c3NDcnZEbzFYK1RrNEZHRzNPeXZiRCtRREtQQmVBTnFaaTBNMnFyZHBZRzdi?=
 =?utf-8?B?aGxvbjl1SkgvYlhJNW1NRjM5Mit2OEdyT2tWalE1bFpvUDc2MklIemR2cmlk?=
 =?utf-8?B?QmZBMzB4OEpnOEMvZ1ZHOWhtUGFzRE1WMm1VdXBOZWRpQ2NBVXhsUDZPVWhx?=
 =?utf-8?B?eVRaamVteXdsd21kbEVrdUFpUVlXK29BejhnT0dsSThkMi9uVHZ1Sko0R0tt?=
 =?utf-8?B?S2JHVDNrNGtNZ2dzM3ZWak13eko3NlIwdDZVY3JFVWduaG9tR0R4ZStKUnNo?=
 =?utf-8?B?c1dYc0lGc21IeU5tTlZNYm43ajZNckRGT2lxMUoyYkJ6RTFPZm5vY25RODY0?=
 =?utf-8?B?ZXRvQlBqd3pDWFdkMVNqUUt5QWxsN1lqeFY5RUNmSXlJb2R0YWFOdE1ZQnYx?=
 =?utf-8?B?c1FaQTYxcjdmYjYxUXVNOGs3bVNWejVGRXRuWG9IRUpjcGJCZVF1aFQ0MWdU?=
 =?utf-8?B?QlA5YTFIQUM5UHpEZHFVTkRuV1k4aStoYnhLSDhzcnlwdEsvbWdMemFydHNv?=
 =?utf-8?B?SGxTQy96Lzdmc25KZ3RrNFpzVFcycGNPUkttYVBwcStvdGI4Qmo0NkNuRmY2?=
 =?utf-8?B?bVhjM3NuM0hsTklJcXg0SzhReCtyckNGSWJUUXFVb3ZEVWF4QythVExOd0p4?=
 =?utf-8?B?Qy9rZEw5NGdVZVlqeE9lTnB0VG5ZZlEzYlV1a0tXdCtkRXlyWG82WUNyZmtG?=
 =?utf-8?B?SHJLSUlnbk5wQ2V1RTFSbUVtMWQxejN0UTJFUWo5dEhzWHJka2tSZ0NOYmti?=
 =?utf-8?B?WnY4Y0JFNVBpdVhoRlNWNmxiWTVNQTBtNzVTQSthd2FjWWxDUmZNUDYyNzF0?=
 =?utf-8?B?UHJEQkpra08xQTRjK29iS1I0WXlreFVHYWFvT2ltM3JMbFBhR0MzSEpzRnQr?=
 =?utf-8?B?WEwvWjZ0YWErQm1qSkVrQTJuNlh6ZmtheVpEYnRaR0pnUkF5UkF5clFIN3pz?=
 =?utf-8?B?UUFoekwrS20wNGxiZUNoMFpoejhwSUkwNlU3OUtOZGE1Nk1iZHJhSzhtZ1Zv?=
 =?utf-8?B?L05CYjBlbWI0T3hYMUNLcCtwNGtCY0l1TTNtZWdBREFrYXlaeDJXdFNybm9G?=
 =?utf-8?B?YWNheTN3R3NXMWxTS2dQMHMzYW5Vc0FRMzdjZFZxL0pWc0JnSXRWbVppZ0RM?=
 =?utf-8?B?RXhIZHZPSHc2d001b1hDNWh3aG9FV0NJSmhCZEs1eHRjdGhPeFlsOFQ4N3BR?=
 =?utf-8?Q?r+b6Ab3bQa03/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0wzK1NoUVhVa0I5S3YvTElkdUJrUEExNUVsL3RiS0IrdXRFS2tqVzBlL1Ez?=
 =?utf-8?B?Tm01KzhJNHlGOFJ4T01wR2NYS0NMN1AxdFRTcXd1R2MyM2N0aFAxSno2Qlkx?=
 =?utf-8?B?YS81OG10dDR2MFM4OC9RaVV5alh5UERkVnFvSU1DVkZDK1R6Y1VIeDZNRTly?=
 =?utf-8?B?eURrTThjSkdIUTVhWXBZZmxyaGZFUFBBOWhmTHBMSjUxRmROS0hpejlwaklC?=
 =?utf-8?B?ZkV0SnhFYk5DUFpSVUQ0TDFrWEs2Y3dZRFl3Q0VuQ3dOMXk2NlpSK1JhSVZK?=
 =?utf-8?B?T0FwRnhxMkQ0RHdPN0MwZHZPMk9YZU9YNVd3NWNXcWkxcnl0Z0RkMjB0UXEw?=
 =?utf-8?B?dXlnSVB2QzdOU2hING43L09LVitOVjRrN2dPdW5tUUxnZU9ITjFLZHVDckho?=
 =?utf-8?B?cWlDdmpxRUowcGVsSXVDVTl2cnZUWGVKVVVtS2F2TjNtcFBRUGQ0V1NISk8v?=
 =?utf-8?B?NkV0SjJzcnFjaHEwS3psaklkSTdYUEt0MlI0d0lxaktVSW93c3crTlhqYXpP?=
 =?utf-8?B?SUU2dVRhakNrVzkvVnZ0ZUJmYzkrM2tNTHZXcjh3dGZheDlRT3orUndpYmtT?=
 =?utf-8?B?Zk81WkRZR1VZeGxXU2xIN0Mwek9URTUrRm82T2tqYUJsN2FyVU1rcTVsdFZl?=
 =?utf-8?B?ZFo2NnYzUUNGREhUMmZ2R3cyUTVLNldSOC9jVzMzZXRXTEtGUnhyV1dudk5V?=
 =?utf-8?B?ZFlsS2psekNMa0UxemdtbGk3TjVWUkdoN21rVjNMenMyWlhCamRFU0hCZ0Ex?=
 =?utf-8?B?QU1uWXM0UUEwZ3FseWlOSThKM0dCY3VyY0ZlejNzalplNkRSM29hdVdITk8y?=
 =?utf-8?B?UEs5QlJlYVA2NHhlU3FKUTNCTHlHKy9mWGZRT0FXRUVpeDBXV1VyY1BESHBu?=
 =?utf-8?B?elBJa0t0dnBSYlFVYUx3c0FLdUNnQ28vSE91dm5UTjNGa2dvRk8zMTFNN2FL?=
 =?utf-8?B?ekZEZno1V0V1QzRraGNIQlR6VmN4R3djajlJdFZNcWMvcFJpbm1LT0E3c0tu?=
 =?utf-8?B?SU1XSUpyRTNzUi8vRXd5d0RqR1lMU2hWR0JKdVE1QkZUVURLQ2lGc09RR3U3?=
 =?utf-8?B?Y1M0VGRvYjlRbWp5Nk94WHZmd0taZS9IdWlHVEk3TnNCc1RHSGtRd0ozZHVs?=
 =?utf-8?B?V2dadW5za2hzMXhoaDN0T0VhcUo3OWd5WVpWbE9pTGg1UEcrZXFVTjNGakZI?=
 =?utf-8?B?UDBncC9WbDFiUWhHL2Jna1BncnA0QktRdXc5RFV5djZyNTZmNmVTOWVBR3E5?=
 =?utf-8?B?REtVS0lLaCsvZXBGVXNFeXlOSGVhK0kvM2dQbkpoZ1RxQXlhVnNaRUwycHV1?=
 =?utf-8?B?QkJSZ0xYbnNxUW5XNituY2dHY3JNSG5tM1J0TkQveWZlWEJySFM3NmNKdmpI?=
 =?utf-8?B?dVh0WTliSkJtRndGNHN4TE5COXhIbWtPd3I1VHM5MFc5NXEzZG9ianVkMklU?=
 =?utf-8?B?Ty93emIyTjJYTVEycGdEOUhheUdNODlKT1Z4S3JrUkZ4elVpam5XK250Z2Ir?=
 =?utf-8?B?UG9PZ2dJaDJhQU85MFU0VVoxRkRPZmJyWUhya3RTUGliWDY4aURtUGZMbkhi?=
 =?utf-8?B?djJKVVRKTHNhUXErdTYzSlZqdTN5a3lTZG40ZE9RODJiOFdKaDZFU3RVdWVI?=
 =?utf-8?B?N0lveTRXS3VmUmxIenBKanhqUzU0VnZpeG9MRVBPZGJHb0Nxd29JOTRwMlNJ?=
 =?utf-8?B?V1dGRklCVHMrNVF6RmRMODAvNWZUWGhoaGtIbnB6Wi9RT3o3aWRaaFRRbTVZ?=
 =?utf-8?B?YkdhaEU0VmZhYzNKNkVFcTdKd1ZpNlBXYVV4WkhmM0ljOFdML1NQR1BwMVpz?=
 =?utf-8?B?L2pVM2JPeXovNGNkNk5BUG1UM0JYQ09LZ01EZXJRL1FzTSt2ODBCNmFjc1pB?=
 =?utf-8?B?SnFOMkg5dVphTjJrUVdSVmZPajVYaDNsNXRvRTJOdUpGYlVLZzBRa0VPN3J5?=
 =?utf-8?B?bHVOUXEydk5BNmpIZFBPd0g0cHcyazdMYVJlcGdSY0Y4bUg3WnVrQlFTRUJ6?=
 =?utf-8?B?K2NPdDlPTUoyQTlvTTZDNlpOQURDeVI3dDBrV1ZhMlFSbit3b0ljMUxYWGt2?=
 =?utf-8?B?QU5wTUFCalVnMmxQaitla2F5M1M1MkJqWGxmc3hXQldpaDluaHFGNStoV1NT?=
 =?utf-8?B?UWlndGVPUmQzdlJrZ1NTUWhXb1NHRWpJN2xGYURzcGJ2dlI4UHpNeGlSSlV6?=
 =?utf-8?B?amc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 94769492-11b1-45e1-b607-08dd60a88bcb
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 14:25:17.5329 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SzCbbnuAbSbWi57ElROo3esRrv+18XSDb0UZDKDzfL7cWiKWrY63aaGN4hz6zyKgLkBVpv9kEIPHQ+fOjfdr9nytlvGJlDTUIRorOcW3YEI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7761
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



On 11-03-2025 19:27, Michal Wajdeczko wrote:
> Driver-FLR can't be triggered from the VF driver, so treat it
> as disabled if VF. While around, fix also the message, as it
> shouldn't be printed just 'once' as we may have many devices.
> 

does it need fixes tag ?

> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c | 14 ++++++++++----
>   1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 5d79b439dd62..a2afa8a88997 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -504,7 +504,15 @@ ALLOW_ERROR_INJECTION(xe_device_create, ERRNO); /* See xe_pci_probe() */
>   
>   static bool xe_driver_flr_disabled(struct xe_device *xe)
>   {
> -	return xe_mmio_read32(xe_root_tile_mmio(xe), GU_CNTL_PROTECTED) & DRIVERINT_FLR_DIS;
> +	if (IS_SRIOV_VF(xe))
> +		return true;
> +
> +	if (xe_mmio_read32(xe_root_tile_mmio(xe), GU_CNTL_PROTECTED) & DRIVERINT_FLR_DIS) {
> +		drm_info(&xe->drm, "Driver-FLR disabled by BIOS\n");
> +		return true;
> +	}
> +
> +	return false;
>   }
>   
>   /*
> @@ -568,10 +576,8 @@ static void __xe_driver_flr(struct xe_device *xe)
>   
>   static void xe_driver_flr(struct xe_device *xe)
>   {
> -	if (xe_driver_flr_disabled(xe)) {
> -		drm_info_once(&xe->drm, "BIOS Disabled Driver-FLR\n");
> +	if (xe_driver_flr_disabled(xe))
>   		return;
> -	}

Change LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   
>   	__xe_driver_flr(xe);
>   }


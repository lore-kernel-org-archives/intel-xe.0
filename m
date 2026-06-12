Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 263A4CD98CC
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 05:20:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D69B910E56F;
	Fri, 12 Jun 2026 05:20:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dr7CaMl1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5E6210E56F
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jun 2026 05:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781241629; x=1812777629;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Q1d2eWy+GRixfbmDOq4OIzKKE0USt63SCOeB5SCa678=;
 b=dr7CaMl1SQmUuaXJayAogEd7mYxNO0N/KY7prNBlUt49cjI4DSRQKytr
 vMmyGPqkO49Ym7D9vqnwb6FYCCTlzDwq1kQbOVfsnAHrNMtKnSsfYndy7
 bYdwqeyyB6UhB0okIMkYmuF/h0kncsUlFexqpCwWodjbEKY2BPVwPZ0Fr
 Kg5wWtIOnynnQ/yBSts1WMbvy3BH2EID3bf9vnvTH9SOJljl7KhHnk7Hv
 Vn1I0RHQzOd8S9pBp8V4yrFmqNbvUzk1sBq2/ysVS2iuhPuAarWdgc7Gc
 N2lgTGk8jm74DryYAQLGQJiXHzKNHVUEi+oZbaXhT2rLoe5Pzy2ATUIgK A==;
X-CSE-ConnectionGUID: v5yH24CEQeqk6ZCPUtaZCw==
X-CSE-MsgGUID: vAnqzVnVQcSG6N9+StUXbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82260730"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="82260730"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 22:20:28 -0700
X-CSE-ConnectionGUID: qjXbe6KySeen4fQYRornVQ==
X-CSE-MsgGUID: D7QPMW8PRo6nWZQnWMsunw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="250653074"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 22:20:28 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 22:20:27 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 11 Jun 2026 22:20:27 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.35) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 22:20:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NE2bSuJ9OPg/vi4qNIjueiaJU/kpkf8d2liIVkez7Yw5vjI6yztoNntnkU+WBAArkitmz5AyNx3dcmcj50LKSHxTuZcv5HJtGDdiv7cHeokQm3RwkscF0p0IHvz7sAdyfzT5PvANOLPHdwlAx2wX1RtOmUl8VimuhXlA6NAK/mIao8MIoRbakV7PXUnQ9uQ4VrCKinmF5tFVUhrJTDkW9V/55WaCDHDrKdydMzqEGJ1fjwLLFmTaW2dNN2kvj9bAMlFZQwyuZG2UZ2jQ0OKQGmFkXOQAXd2zDxHATaHxLbmxlG7usz2O5HZWTmpuVuyglOR/KhkD2pVTeA0aEXKnCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BWsumbbxUfI3jP/qvOuBD9Lmr2U5pVv6GflGXciIvX4=;
 b=vyH/rlgNnjje1DIbpudeB2tvPtHhPn9J7gDm807noOO5NPTpH5W1JvinIjpkzAZ8cdCp9GDbx6kiPiYlAqR4BnQ481dD2uIuyyOws+VLmxqNXlrUeCKESpga5u4O3uDx2Pb0XBbL9vfL/YnXHAKh73ItVKOyIMeYo+bsL/loKlH7YONrqNsyQi1Tg5tL8bkiMrNz1tI6Gt8WKHPgSzI1WFufQUMWRHR8tkL8FNr6YIFaNae1oTBomF4N1K70O2Lf+T7upAbzkzRiDPfoaDi2X9zaRPS6D9sJFZkgj8ZFjgWiO+0p9HcrlouQguB11cZ0SNfaaXxD4BdDRYWNZ4TeZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM3PPF9EFFC957B.namprd11.prod.outlook.com (2603:10b6:f:fc00::f40)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Fri, 12 Jun
 2026 05:20:23 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 05:20:23 +0000
Date: Thu, 11 Jun 2026 22:20:20 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
CC: <umesh.nerlige.ramappa@intel.com>, <intel-xe@lists.freedesktop.org>,
 <Uttamchand@gsse-cloud1.jf.intel.com>
Subject: Re: [PATCH 2/2] [PATCH] drm/xe/guc: treat sentinel timestamps as no
 elapsed time to avoid false TDR
Message-ID: <aiuXFP+Fx8PlGp+i@gsse-cloud1.jf.intel.com>
References: <20260612032745.179673-4-gajendra.uttamchand@intel.com>
 <20260612032745.179673-6-gajendra.uttamchand@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260612032745.179673-6-gajendra.uttamchand@intel.com>
X-ClientProxiedBy: MW4PR03CA0208.namprd03.prod.outlook.com
 (2603:10b6:303:b8::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM3PPF9EFFC957B:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bc8337c-7186-43f3-30c2-08dec8424d85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|6133799003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: XRT6bvyPfotUCnrVtuIwXq3At3X7KcgfLJ404DAy4YiFLhQBjfw267Zk1IyI10fT0n7xwsWxmcxbBB+LnJO3j0wAm8nCSjghrPQjApFc4FhIqlpgsZL3OvmBgOOKjAExqprlxDz4CfNtmS5l4VGw1DiHVPhXRU0lHKYPpqCD3htppa+0AYDzxveOoCEEJIM4j0eLudIKRn6tsusAPRkoXaJ6AGuNtnn3CXW/W8I9Zyphtbq9ks53AMPbXDLtvo8w8CuvY9X31wlyLqtUB4TY+9KYMzf6AxLkeBcNr7Hxaa9c7Wn7uhAV4lH8mIA8V7qJpCqL0sBUqfALwFVOJaYklRg2QT+sJwIwjgQyXz1gMiYpn//Yq7kNmSb0fAhOXn6h5VxaQntlfrt6EvbNFO6Lc2JsA1Niu8kxS9tZPPyFA7nn3HTUKbnBluxapHX2owp7oxcaIDepEJFYuRlnBcbkaCAPuvF4NebVLLV4L5VL9uj8WgUODikhY4prnlYAkkXyCixl97iDWKN+SRcxOq77bA/L6knIUdRuwXr5QJehUTFjUbxneIsCZmjS1+Ob5KKsUSKCjFMNGL5D1sNwe7SPFO2UtH3arulAcHtn9Ckzrgc/TaqYWWyYQT2dRmM25kjzspi5+kIyP1wp92WunCm28w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(6133799003)(56012099006)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjhORm1raTRlVW1SUThHNUxYRnYzVFQ2czJCWGM2MlZsTEZ0RXZmT3VTSWhD?=
 =?utf-8?B?VXFQclQ3ZzFLLzI1UlVqTmVycFkvSGVsK1I5eDFDQjJiYkQremEveDlNU1BD?=
 =?utf-8?B?T2pkRUswZ3FuUC93TldGblprM3pnWGxIczN5SFdwa0pVbFowbmZMaDJxNzky?=
 =?utf-8?B?cHNNaVlzdG1OMEM2dVp3RGhoalNZSHdqQU1TcWJKcmVmSmlMSDJncmpramZ3?=
 =?utf-8?B?bmN0K202RXp2SG9hbVpuanozeHpMUU5LdFB3em9xODVIcnpnTktjb2xYNG1L?=
 =?utf-8?B?akZhbUlIcUZ0RjBDaGlRYjdrV3huM3BpWWVwZnk4Y2t6RGRxK0k2TmMzR1h5?=
 =?utf-8?B?b1BMYkVPYlkwcjN3dkVEZEl1ZlR6U0JkeHR5Y2VUbU1xOFRkMHlDTW9DeDJa?=
 =?utf-8?B?ZlVkdFNtb0RxVUhMZlgxZWx0eForeHQvKy9BRE9JczZ3UUFGODFHdU9ra3pK?=
 =?utf-8?B?cjFicys3RkptQm1BamtEcHdOZTlQK3IwMGt6dk42dkJTZmZQSHdyWDdEd2Ra?=
 =?utf-8?B?RDlaWFI0SHhvbHBXWWZUU1E4RUtLQ3MyeVp4MXp0Vy9aSXgvblN2c0Nza2JK?=
 =?utf-8?B?ZW9sckIyZGFacElkdnZHRlFEMWIvclBuQUhYQVE3MExHS2R5YkRQNURra1NH?=
 =?utf-8?B?YW04bXJxSGM3OWIrVi9hbUtQc2dmOWVnNEFnS3VsSkRydjJQS0hvZEszMTc3?=
 =?utf-8?B?UEtmT0ZpSUZBVlRtMVJ6UHR3SWhRR1JHU2xyZDVnY2twKzJ2SFJqWGdOcWh5?=
 =?utf-8?B?YVZjMm5hUlZZZ21mR1d2QTlaQ0J0RjAxL25lQ2c2VG11UkU4SElQQkxlclVL?=
 =?utf-8?B?OFNhSlp5VXk4S1NVUFczbVhlbnVMZlcyYkVIWE45NzBjNHZvWE9YZnF5RVNV?=
 =?utf-8?B?dTlhdEJrQThSZ0pXMTJCTzZrSE9GY1l3ZUk1Q2IzcEVUM1FpdFBvVHZXSmUw?=
 =?utf-8?B?Y010NzRNOGszU1lEc0tPTWJXSkFiaVFNRWliQWxBWGV1bjBiNHZlQ05lVHhS?=
 =?utf-8?B?amJiQThHM0R3UEV3bk44Q2k4U284RWdNUkV5T1FudTFMK3ZQR0JTMjNFVnZh?=
 =?utf-8?B?Tld3QkxBaUxIMzMxTjd3UTdEbXRjcnBueFI3eGFhckxUbDd3L1dVT2hPdzY4?=
 =?utf-8?B?dlZVeDlCNlVjM0RFeXRhRUxuRkxtbEVaZHhLbU9zTGJmYlBrcDVSRlB0bTB0?=
 =?utf-8?B?VEhoVlZrNjVsRjJMaFF0eVlTZFlpVDFKa043bngzZ21rb3Y0VVhlRVR2dUNk?=
 =?utf-8?B?YnVmMTRyd1d4ejl3Z3BmcVk1VFkvcHl0VWRFWnJZQmdWUkp1ZnlDMXhyT1pU?=
 =?utf-8?B?WFI0T3haTldQeWhacG9Sb0lZZjVSbzNVZnUwMTZVVVJNSTFXVHdRT1g5TjNi?=
 =?utf-8?B?ZURFWFE1VW5ESFJOd0Jid3llckdhZWtrSkhmNm5mb250ZVVQcXFudDBTTytR?=
 =?utf-8?B?ZkJrbTNhQ2hwMUJabkppdnpENUhDT1BFUlVWVW50cUJJby81THpObGhzNkxk?=
 =?utf-8?B?bGJnMm9HeGp4WU8xNlIzV0RaSzhKVXBXQzRvVnZZeld2MUN1akZXaGJ5YVpj?=
 =?utf-8?B?STM1MHR5MnRiclRyQ1ExQVAwV3V0MzJRMkNEeGEyMWRUaFF4Z3I0RHJjUXFU?=
 =?utf-8?B?b1JVc2JmRHdWTk95eUk4aktQSXFwQm5GT0ZFcVZHdmtOWVNrdkNDS0o0ckdh?=
 =?utf-8?B?Qk5LVHB2b21mbk9xdW5zWStENmVmMDdQZ014bHpIR2ZxSzI4SjZ3ZXVqUVpE?=
 =?utf-8?B?akNEQTByOGRWT2F1N1RhQU8yR3dDakkyK244UGcwT0t4ckdZMzNGekMzcytM?=
 =?utf-8?B?MjhYVlJ2TnJ3NWJZWUZiNFFCdEh6MVhKSjk0M2RMcWxMQXJUR015Y0NxYTJH?=
 =?utf-8?B?L0YyTWlDdEZDemdVcUhTUDJCME5mSC9qQ2M1bXZVcXVScDBSdVlHbTNvQ1FN?=
 =?utf-8?B?Y09ObURBOHRoRG9Ecm1TbFBKR290czR6U3kwR3c0dFJ6bElKZTBBWGZTY1lO?=
 =?utf-8?B?TXcvNkFrWWdhbEtHRytMTFFoWEQyR2dUNlZIeVFhZmRId094LzVJS2lHRWx4?=
 =?utf-8?B?Wk5EQmZ6UE04Qy9BWTdhZ2lkOWx1WHBSZ0xWeVBsTmVFMWJWdUsxcDJoc1U4?=
 =?utf-8?B?R1pqRGVnN3VsYk1jMjdJM2pIZDRFSktFa29odHVGaEVTbU1Dd1R6cHgrNy9Z?=
 =?utf-8?B?ZXJIbUc1TFNONVY4bGRnR2kvS2ZqNHRpMDlDdUlpbjZKK2hGT2JmQ1YwZUlB?=
 =?utf-8?B?K1Vaa3B1dEFJMEY3TWh5eTdPVmVFWmJ2bTh2d3hoWDhRUnk3Ty9WZ2I3eEow?=
 =?utf-8?B?VFN5YUFnRlByWlFrRmRlSlN4N3VZM1A0MWdNbmhtU09ueHV3V0UxUT09?=
X-Exchange-RoutingPolicyChecked: QG8EwCm6ydvLZI1jjpsDpqkreKRoo7vBiYd5j0Dtwg+LyBGDuBhv2xim4O9MfTpc/k1R15eytW2Zx2d0lvmNaZOeRiELzPviT3EsxXM2pLEvMxyQRrUz6A2w3Q0gQGoNCgdO5Zd909Fl1TyUYZMxqJ4pTVbYQ5bw7riNo/2EYU6kmHtcOcXmuoFHgLLvmz4E4t+EUKCQk7v2vH1l6Q++AODAZQ2cL+uIiJI3IKUHq0fZ3MymlL3Ua3cg8pJdFFy7OrbJSeRZTMwIoQ/nF+DrLzn9IxhxizYiuzFcLF4ROpqiK3t0JJpPHB+kn4B7JECGs1gO/917rPecLFaKGko/rg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bc8337c-7186-43f3-30c2-08dec8424d85
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 05:20:22.8757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ubjCLTZ+L1KcHqFwH+q5KPpi8TIjTzQgauOB0tqRE2pdKWp0ecx+k06DT8Nc2maQAnRgU3izZ41MMafD2TiNEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF9EFFC957B
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

On Fri, Jun 12, 2026 at 03:27:48AM +0000, Gajendra Uttamchand wrote:
> From: "Uttamchand, Gajendra" <gajendra.uttamchand@intel.com>
> 


The first patch in this series looks correct, but I’ll leave the review
to Umesh, since he was the original author of that code.

However this patch looks incorrect. More below.

> Problem: Using LRC ctx_timestamp values 0 or the CONTEXT_ACTIVE
> sentinel in time-delta calculations can produce a large wrap-around
> result, which can trigger a false TDR.
> 

I don't think problem statement is valid.

> Fix: Detect the sentinel values and treat them as "no elapsed time"
> (return false). Compute the delta with wrap handling when
> ctx_timestamp < ctx_job_timestamp by adding U32_MAX, ensuring
> correct diff calculation across the 32-bit wrap. Runtime logic is
> otherwise unchanged.
> 
> Signed-off-by: Uttamchand, Gajendra <gajendra.uttamchand@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index b29cc08e6291..b870ad30fe8c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1389,7 +1389,22 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
>  	 */
>  	xe_gt_assert(gt, timeout_ms < 100 * MSEC_PER_SEC);
> 
> -	diff = ctx_timestamp - ctx_job_timestamp;
> +	/*
> +	 * Values treated as "no elapsed time":
> +	 *  - 0: uninitialized / context never ran
> +	 *  - 1: CONTEXT_ACTIVE sentinel set at context start; real timestamp
> +	 *       hasn't been saved yet (using it in a diff can wrap and cause
> +	 *       a false TDR).
> +	 */

Both zero and one are valid values after a 32-bit wrap, since we are
only examining the lower 32 bits. If I recall correctly, we didn’t make
this computation 64-bit because some platforms we unofficially support
have 32-bit timestamps, and our assertion shows that a 32-bit timestamp
scales to hundreds of seconds, which is much larger than the 5-second
timeout.

> +	if (ctx_timestamp == 0 ||
> +	    ctx_timestamp == lower_32_bits(XE_LRC_CTX_TIMESTAMP_ACTIVE))
> +		return false;

So this if statement introduces a bug.

> +
> +	if (ctx_timestamp < ctx_job_timestamp) {
> +		diff = ctx_timestamp + U32_MAX - ctx_job_timestamp;
> +	} else {
> +		diff = ctx_timestamp - ctx_job_timestamp;
> +	}

Not needed.

Let's do an example...

0x5 - 0xffffffff == 0x6 which is the correct value. Sashiko agree [1].

Please drop this patch unless I'm completely missing something.

Matt

[1] https://sashiko.dev/#/patchset/20260612032745.179673-4-gajendra.uttamchand%40intel.com

> 
>  	/*
>  	 * Ensure timeout is within 5% to account for an GuC scheduling latency
> --
> 2.43.0
> 

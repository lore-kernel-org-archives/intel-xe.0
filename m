Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90CCFCD343F
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 16:29:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40BE410F22A;
	Thu,  7 May 2026 16:29:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O1WqwLvq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59BA410F22A
 for <intel-xe@lists.freedesktop.org>; Thu,  7 May 2026 16:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778171361; x=1809707361;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Cqo/3CJJrsaZDe1HY5aSKPdAJxeXBrlGDNzqOSOMwmI=;
 b=O1WqwLvqdvxbMt/R+9/fAaTRktEwJPEZxUzMBrfnqbNTeeVz8npCYaAa
 qhTy0yhrtMvFfa0bTjt8y0RlQAQI9MFpOHKd6WNoksJx8G7GK9+kSeOQP
 UoYv/A7kBskQrlRiT2ad5b/YQ/PdU0evgOVdJyUzoFOoXXCZp5oM5AXZN
 wztiyEF5tUs2sz4lDS+9NXHFjSr2BCBAklkeksr+biU4uHFa7RcOQfZdF
 7ZUsWUGmmNrRWPT7fRid1OUW+0n8rJ1cTVqJaCUwH9j9f7rY0JLFuWsCK
 7EM6PjipiBzAKUjyLJLhAzZkufQKxZny6gvhmPMpzQBWUkqSimIIdIZGl A==;
X-CSE-ConnectionGUID: tvVuM1R2TRuTuzBO6EVdow==
X-CSE-MsgGUID: zqfURBAwSqKm87NdEmAhOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="79064441"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="79064441"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 09:29:20 -0700
X-CSE-ConnectionGUID: griRQV7oSriZV8XyFB654A==
X-CSE-MsgGUID: dQfps6pERPCu0TOg2k4eNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="266879158"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 09:29:20 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 09:29:19 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 7 May 2026 09:29:19 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.26) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 09:29:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j3Uf8wq8lnxItI3cTElPvoimgqCzMDEK0kJvER+HZjB4WXvNpD4xw64zC1/KFfpHK68jIAdwq6eqmtXoDRK9YHVPIrKTBDGgkzEcrDROO38fSHM2lZPLGqnYpQbf9vrKG+PbvuPTQmXE7LZeZh69YSNJhcxu7pfqpKdDmvP6u3WvkA5YPIiZ04yCx/d4NaJvpYW5GTguqYnTHBwTsgnddSnYZs5SDvvDjr9aBqo8I2wDCbB+8wDEyNFdpInrDwXmXZECfTDIKnTPmkf6kq/MQDkyTovVMw2H841UTw92s9qjUfYH6tAJo1QLVd1boZ0sKQxGDqwRyf0bGQTUbfulpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8S+RpK5/MzKCwps0IugaUWDV+wReDD/YtHhElO+AMFQ=;
 b=SgmhP0ZGEqwb+QUbbONl9t54ga0b1Evls0GVuFZMYh+O3KuqmEutmJTGPv8BhCnJnYr7+y1F2/1Qg8wn5eKuZXIULppz4rFopkNIEamKGIIOeEjQsQaQ/QtgVrf5YEmJ5TIXPOaIPkdwFgxi+gqf//NX1ossRiTFnW7tcf+DP1Qm9s1SMOEhY7ucMpCArPSs7FpX+QDvZ88rZKvZ8vQ0UGWagIASE//IaSmYlV0wf9UTgIoXrMSJI6I9e1AwjW5CRKqu6p9i78h0IwcgxSqlepf80ftXEzLN9FpVqELiN2JKuZHzHK7AtOUMyerxKI3d6EauTf+H5NQAXGXRWtO4hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DM3PPFCBDC4B878.namprd11.prod.outlook.com (2603:10b6:f:fc00::f4f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 16:29:17 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%4]) with mapi id 15.20.9891.016; Thu, 7 May 2026
 16:29:16 +0000
Date: Thu, 7 May 2026 09:29:11 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <intel-xe@lists.freedesktop.org>, <niranjana.vishwanathapura@intel.com>
CC: <matthew.brost@intel.com>, <stuart.summers@intel.com>
Subject: Re: [PATCH v5 10/11] drm/xe/multi_queue: Use QUEUE_TIMESTAMP as job
 timestamp for multi-queue
Message-ID: <afy918W5WnuBHu5O@soc-5CG1426VCC.clients.intel.com>
References: <20260507162016.3888309-13-umesh.nerlige.ramappa@intel.com>
 <20260507162016.3888309-23-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260507162016.3888309-23-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: MW4PR04CA0113.namprd04.prod.outlook.com
 (2603:10b6:303:83::28) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DM3PPFCBDC4B878:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cf32cbe-f76d-45b9-e60c-08deac55c843
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: GD2q6/gT461JPzE0ypqEVcOFfgJpKxtaaaZkDeG5+rbHkDnRkuBJQaljddlQNjASvM2B0ZY/nvFCXU2MAdKRF894a34d0RtMBNUGc0GIVu6l94JAdmqEK3iWwC2dl2uX5+X9x2beR4nBq2SiMJEZeTqtFRWLV/+i9ICis0VCIasNByB79NlggUt/92TWesoj+DddCGM0JoVn9dMJf7d44dlwEKcxkvzH07SFDkuqcAHb8MofszJejw6HCIkjD/StpiAoa/xJg0l4siHL070HTl+Je0CP3NLYkhtHgDToPArqSlfPIPVDz95GF/lsmr4vDPB1Vz9U0XiXqEq9qtgpRlSv306ksm72f6izUJsTJ1ZIF91pZkdT/E1ITobhtAhOnhGu0WYOMBswB+lFlZNrI+wDP3ymBHEolfl4GkVP0ZQHyZdvYa8UKa0iPASmy5ssC908eilTBOIfbpq2ozVsXQl8U4sTX5i1rDt/9cRZQ7fQbxl7CnFVW+qBdu+0JlFFszhIDZHFMCajv4l4//gmmWrZc5ZEVFDl+ovAQj/lCy2ts7f9xC09qxp0BzOoBBRy2d4AvhFd6rfOrIEfDf7xLJtQxjuKl2ZTJYE4r9D2lvoDEd0qhVjPUYp/MsabYqci/1OBbwGvO56G0pSwUNAdxK3vpTxFkY42Jr5ocukuVIFct1HE8DHsdCJX4wQORykA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3BpQXJiRW50bHdPbWN2VUJNcWRFMVpsZzJoSndGZFhGYmxBMlZGM2MxbUV6?=
 =?utf-8?B?QllucmRINGRHUFFvejQza2ZIcnJUM1h6K2ZUa3FnVkFiZytBSDE1NVoyVC9S?=
 =?utf-8?B?aTQwQ1o4TGxzRjdjTFdIVTF0NU9yL0ZHZzNnL1QrY2tSQjA2USszR01VVnNj?=
 =?utf-8?B?MXlOcE5wM3dhdm5zZENJNGJPNWxGVnp5MUVMVHIvUW4wQ0o3cjIxVC9pWFF1?=
 =?utf-8?B?SFhsSnRxK2ZWZXZJK3E4NzJxTlYyWDNXL1pPcHpMZ0NpeSsrRGRmZ1Q3WE12?=
 =?utf-8?B?NzU2N2gxUlVtRjRGczFmRTdjc2Q4dG1YZm5HQUdRNXFTM1hTVW51VWJZZ3ph?=
 =?utf-8?B?bEExZ2JrYVBBcmI5WEZ1WFB2aGEwTi82L3pBb2JyK1RtRk9Yc0cwM0pEdDA0?=
 =?utf-8?B?Qm9JbnM1VENFcHRpMWljNTg3T1FEZW1ySmZKSXprakxuYy9ZTnNqQjJINWtN?=
 =?utf-8?B?OXVtR1lUTWZFK2hUWFlYLy9iVS8vTjAvZDB3TEg4MnRxYWxwVVp6VlNXQ05F?=
 =?utf-8?B?VlVPL2tCbkVDM3crWTVUa0hLd3VOeTZEOUczTkVVVHNnL2pCNU1CY2NuLzdE?=
 =?utf-8?B?a04zL3MxaWxHUGhMb1N6ZXdhRGJoeWxxRXhZNjBDVDIyKzRTcWZ3eEtGL1Qx?=
 =?utf-8?B?RFhHN3gvRWNYcUhzenFGNU01Z1QwMVRjak82Y09BbDN1cUhWTGZSaVB6ZEJP?=
 =?utf-8?B?dHFWa2RMRWhMK0dvRGpZZ05tTVNubjBnUkp4UExyZXZaYVc5OEFMR21iQTh5?=
 =?utf-8?B?TmI5dnFGTkNTMHpsRE0ydHIvZ05FUzU5ZFJibVprbG40WFFja1pKMzRIcXl0?=
 =?utf-8?B?K1p2U0FLWE0vSkdDMC9CcnBMRUM1N084QVpadFdIMkVTN0NtRzBZZlZyc3Qx?=
 =?utf-8?B?MnVNeWdUWlg1dzRqbmFpaldYUzdXN1JkUjl6SzREc0pSNzhuV0hhaDBibUda?=
 =?utf-8?B?VmFWQTRDRHF4am5WNEp0U0QvOXhnZGZWTGlxMnQyL3paNGhnV1hqbktJeVR3?=
 =?utf-8?B?MmxlR0M0Y1dzUkhyOXZrNzVDdXd1NXlXdytIRFQ2NGh4em9QRjN0QjAxaytJ?=
 =?utf-8?B?RGM0S2VwMDNjSU5yczkyK2wvUEFoMFhmN0lNUHI3aUUybUhwSlBlbzlpWE4y?=
 =?utf-8?B?SmFjRmYxVWYvWmpkNlpBZFJGNzBhVFMxWjFmb2k4YUN6Y3lUbTlveXl4NW9q?=
 =?utf-8?B?SEluOWw5QVpFY1BaeE9pMjZRUG5FenB3c1IwY0hiekFUWHhYU25Dejd4WW92?=
 =?utf-8?B?REFNd0JVcDZhNTZzei8xUUUzNk5nMjJ0ZkFsbWQ4OXRSSjZaZkhySUZVN0Fx?=
 =?utf-8?B?K0s1cWVlSU9yUEhvd1cxeFJ4K1pzL1pha1pCc281RGRpdXRvOEZSSjdENXlQ?=
 =?utf-8?B?N1MxN0hSekhGM25Nd0R4SUsrKzlVcWM4bXNTdWpLV0hNWG1idHJhMEtXeFYw?=
 =?utf-8?B?ZWorNWlBSnkvTERGQ2Y5L2VmVEFkSjdOZ01zMTVMRjNWa2RIRzE3QW03bENs?=
 =?utf-8?B?Ykl0K0R5d1N5TGJEWE45elZ2aUMrVFN1TXZtOFErM2tac0FTaGlORGJTcFov?=
 =?utf-8?B?Q1BpYysvZ0xZaGFSY0dUWVdHaithaTV2TTdudEZkUWhHQTJLOFNoY1YyTSta?=
 =?utf-8?B?UXlycExmUVlFUzcwWnp3RG9XNFNlbFhDR2gzRzdkTmpHQWVETzF0Mm9PNHNP?=
 =?utf-8?B?WTZFTDJsWTZ2UU5XOE90QkIzS0ZHNjNqVjNxQWN0bGlKY3VFSHhnSEE2TFhY?=
 =?utf-8?B?cFhSZzZCZkJEbXFTMVhmb1lTK0dWcUtZY3B3SG10dXlsWG1rc01QajZJbW5l?=
 =?utf-8?B?c3VTY1YxRklrRzFrMUV0aXh2ZXBBMHI4QVFwNkhCSEdFamJjZnBiaE1pS3Fm?=
 =?utf-8?B?MEtBWjl5bFBNSXNoMHNRTEJ1cFV3QkZCaE5FanMwL0NXOEdnM2JoejZ2UzU1?=
 =?utf-8?B?SlFUVDJhNnAxSkF5aFFjcWV1K2IvRzBOQXVLckNFN2Y3UTNGb0hlRkFpa3VV?=
 =?utf-8?B?cHNJb0x4WFE3anZpYnhCYytPb3NxUXhqd3d1dkFxdWhnOG5TOHF4d0J6Zlht?=
 =?utf-8?B?djZmMUFxRkFtSTd3dFdqSXZ5S0NRR01UcUROWnFPSTVqcnUrRXVQZkYweWMz?=
 =?utf-8?B?d3FNai9jQzducmVpek5GeWdtRWZ4VHJTdUxFdW1Qd2NnRW9mc2s3YVphOXFp?=
 =?utf-8?B?K2xiTU1JdnBIMGxvc0FxZUROa0RFU0Q5bE8wbUJYMkRpTm1nci9FV1hWSmJV?=
 =?utf-8?B?emxtTndiTE9LWWhvV0F3Z3l2WDAzcmtHdmxpYVVvbm84VkkxMzhZTEpWd2Mw?=
 =?utf-8?B?QmczdXpNUU5ZMXVqTUdDZnZVVkpTNU9uckExM1c0U3dwN2szaXY2NmpqMklR?=
 =?utf-8?Q?vW9PNUgzM0iMjGZI=3D?=
X-Exchange-RoutingPolicyChecked: Gts1i6huHPKnrx2w5vjwAltxWn8MmMPoLKyPc+B3K7KUs/pdXPeRBEhVHZSbgY5kg0dcy2DSA9UQ8TqIwV04qtRL8m4qb+kFLEKkY8VAEGRuJrFWF41IigCRvuSBdasKG/qRlYRvfUACgjtXrGwNwrCZiTz4QL3WlEFLTP+LRMSAbVrsJ+aOeUkRMdFkXhbNUhI5arNOz6jdqLPThHuYQ8+QmVBWkMYA+W3IbdhzUwG8q1OIjBXC3XyAdSpBOfSdMDBdi7/LscfUBTwjOkbfBfgFQvPHp48h6hE/0i8j3/vjAXxhJnqObrERxWb+tJ6ooExF9+VU0KYamFquaYpkFw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cf32cbe-f76d-45b9-e60c-08deac55c843
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 16:29:16.7569 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fmUdirsnpDaEXh4brglBnXomuhjGJXtD8eCKXPWvPZY0mVWGg3ZpEeIZ/vLeiIfp5oyK9z2v19oM96yflOD48+LbJs4m6Un+0KcivkIk5hA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFCBDC4B878
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

On Thu, May 07, 2026 at 09:20:27AM -0700, Umesh Nerlige Ramappa wrote:
>Each queue in a multi queue group has a dedicated timestamp counter. Use
>this QUEUE TIMESTAMP register to capture the start timestamp for the
>job.
>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

I think I missed the R-b from Matt here. Will add it before pushing.

Umesh

>---
>v2: Use xe_lrc_is_multi_queue for check (Niranjana)
>---
> drivers/gpu/drm/xe/xe_ring_ops.c | 8 ++++++--
> 1 file changed, 6 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
>index cfeb4fc7d217..39a670e91ba7 100644
>--- a/drivers/gpu/drm/xe/xe_ring_ops.c
>+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
>@@ -269,8 +269,12 @@ static u32 get_ppgtt_flag(struct xe_sched_job *job)
> static int emit_copy_timestamp(struct xe_device *xe, struct xe_lrc *lrc,
> 			       u32 *dw, int i)
> {
>+	const struct xe_reg reg = xe_lrc_is_multi_queue(lrc) ?
>+				   RING_QUEUE_TIMESTAMP(0) :
>+				   RING_CTX_TIMESTAMP(0);
>+
> 	dw[i++] = MI_STORE_REGISTER_MEM | MI_SRM_USE_GGTT | MI_SRM_ADD_CS_OFFSET;
>-	dw[i++] = RING_CTX_TIMESTAMP(0).addr;
>+	dw[i++] = reg.addr;
> 	dw[i++] = xe_lrc_ctx_job_timestamp_ggtt_addr(lrc);
> 	dw[i++] = 0;
>
>@@ -281,7 +285,7 @@ static int emit_copy_timestamp(struct xe_device *xe, struct xe_lrc *lrc,
> 	if (IS_SRIOV_VF(xe)) {
> 		dw[i++] = MI_STORE_REGISTER_MEM | MI_SRM_USE_GGTT |
> 			MI_SRM_ADD_CS_OFFSET;
>-		dw[i++] = RING_CTX_TIMESTAMP(0).addr;
>+		dw[i++] = reg.addr;
> 		dw[i++] = xe_lrc_ctx_timestamp_ggtt_addr(lrc);
> 		dw[i++] = 0;
> 	}
>-- 
>2.51.0
>

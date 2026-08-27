Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C67C61DCB
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 09:46:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58EB210EF63;
	Thu, 27 Aug 2026 09:46:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mX35lkqh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E23DE10E3D8;
 Thu, 27 Aug 2026 09:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787823963; x=1819359963;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=knPxEAgziWEuLeydpziEQ+Dpw+zHaSqcECSkMkTL/J4=;
 b=mX35lkqhahy/ykROVdH1t6RortmzPLF4SRhJMbCZOKiHQKXZkwZ/ey4p
 F40DmnRXPyc/a6jsCg5ddfqDCKFTflEohAtvGwnsHdfsxqkqoc/ebJtMP
 CTlZx9ecgATmahxnkArkfqNOxqfpsjnfPnE6ZVc7UdjOR0XOjzvFqICYN
 NFIC3TCBjzQTE0zMt3BdWvdN8mrdPqDh2vp+SWxXwdkSgHdU1R864CVd8
 qMO4tMXsWc3GWi0JUlK/4EDIAkoDCFzxNQ7o36r68XzHkW1Vs79dfNr/N
 x2djkZ0POKM271qcUL3U3lvEfLOV2C2jNX5IAIsMNtRS+yRWfXMghbRiK g==;
X-CSE-ConnectionGUID: 2lXowQOlQ1C0GktrCYPGoA==
X-CSE-MsgGUID: KETep/ABToeiiIQxqq4Y5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="111103493"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="111103493"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 02:46:03 -0700
X-CSE-ConnectionGUID: xunhL9m7TwaH8iVhzQxWAQ==
X-CSE-MsgGUID: /2h6rbBDS/KVHspGsnHXvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="264586170"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 02:46:02 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 02:46:02 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 02:46:02 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.46)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 02:46:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nu1I7rjj/ICN85VubUXS7PSqXBASO0VPKfOL8NeyelMhNdSZAfGU25tmx7EFcDbII25OkQL2mrlBkHLVOCOZgiJ3xnLqAHNXQniULZzqyEWGl0TaBV+zgzmejBtn6BsjU+MzsrtNW8JDqHkJsyahd7FpHBl6Lat+f4B/R1gkrph4ER9Dqa9at79PLiRT5je7LaW1CWhH4LLDo4qpX3hw+lUPZFoz05ELMoZTF98aaguq8fiZc4eNAlkFA5N0fU2N0sCViJWLC4yXe8Fd9c7rAycXgcSgYHS1oJxlZuzEi6QR4hkmPSb6tURKV6vDXvO2CvGDKIgUCl8vdHunuOUNRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o2Yy1McuD+bNnXN7pHUDnNSoZuLIpUhVPnt/t45NgWM=;
 b=LwVc2CtKguVJNxwXyMN/8DjAnwT1Xe55wJadd0JV8l739+RV2FdJEb0nO0o8lGtJ0CsxSGX2T+EGZtgP2zOacJLqrXokgrhRwcIlN/+WLQEi9coCab5yXiE6SYZaGBOsKRfyEPEBW3toUTUPAu+Bmiw/nig9lH2vYcvxZbKx257ZS7q+WZki4RXaVlFIyrCWTiexCI8GUX0qo19fO4JCR9OzCls9Z5zKmA5ByAIUBrJ+4Um+FcuyOS6/drvrbEiUdGiSe/AgHikZwxNwHO8FPwqSR0AsvEeQtFgFSUQr/IIq2f7PXwOts6S0STyfy2km9PKalWprRdK8t/Fp3U7zow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by IA4PR11MB9129.namprd11.prod.outlook.com (2603:10b6:208:55e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 27 Aug
 2026 09:45:54 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0360.005; Thu, 27 Aug 2026
 09:45:54 +0000
Message-ID: <248e035b-5e7d-407b-9f99-a32a41d90f71@intel.com>
Date: Thu, 27 Aug 2026 15:15:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] drm/i915/cursor: Handle secondary cursor state
To: Nemesa Garg <nemesa.garg@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
References: <20260821044755.2234490-1-nemesa.garg@intel.com>
 <20260821044755.2234490-4-nemesa.garg@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260821044755.2234490-4-nemesa.garg@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0059.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d3::10) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|IA4PR11MB9129:EE_
X-MS-Office365-Filtering-Correlation-Id: 8de56823-007c-43ab-4b84-08df041ffd1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|22082099003|56012099006|18002099003|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: /FBuxHkdTHlcN3/zXaFTIF0KBtv5ZS89GI/KH7lPPl2lTUJkRa8yxxxvenEtGq7zmK0ARtRdk3g6fRc3/c9zLoayjk3c+598ovkCemlsHBTX5DOKMSGpkNAq1AP4FVGSEGwGiDcFAr8yPriVYIA1VR4pU/RGTSsHt3JLXwpzNokntylSbrawrpEiyvsbrwDkSHTjE8TirduY0WNFjdRjv6EQPA6m6ufSJPfs/KFqS1Ygjo4aL/cYw816KQWPqvVr8+gdnHfziXWRnXPrRzrNZVGsdTJO59QSeoorxQ/EXf2BuKLq7bO08Om5rCDXJJYBDlK4eIVbY/xagb/wQKH5URE2GJmNfpGj5gETprQMK8dEQe7dsVq5B/nxPIFVeOjYGLhaOwBNL1z17FcwWOPzFVq87/PzO8V24zAie7gynFJ3mWD806/CIoeOeq9xFvpmw1syIPHshredzpHXTxua+8sVeqUBOAMxRpekVEqJiY9t2PnlpGSLNsw6RDL4aX75eDYzAOPLuM9uSTJyYo5Qz9N4Jx7T6SG7JeEN4PDm5UkhoindKsCzxVMsDTjyadSBf2v+zTQaWj2Qm2BKv1c422nJOcrJ98pQHGYvK7/NH9gFJ8awymOB334e+CLeR6vx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(22082099003)(56012099006)(18002099003)(11063799006)(4143699003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3IxSVZRNkwzRDNWcUxwYk9ZU2xrTDNVUnNWUGZTZWo2ZWNqZ1YzNUtMZW9D?=
 =?utf-8?B?K3YydzhXckovbktJU01SUXVuVmtoQ0VnVjJQS0MzMlhQOEc1M0FwaXc4SWE5?=
 =?utf-8?B?SE83SXQ4RVBidi9MQThqNkVGRUlCQnl0WEtJWXlBbVN0ZVNkbjZlVThLOUFP?=
 =?utf-8?B?QVFINDcweDVlaWdUZkpubkExQ2tHY3dKdUVwZzhkWWtWcjdFREovMkhBRnd4?=
 =?utf-8?B?SU14MzVIdVIyZWsweGpka1dtUXdJcFp0MjdnbmtvRUZLRVBqaHljVWV0QmNW?=
 =?utf-8?B?WGkxWHl3WXVhdjkrRHJOL3ZJckM4cUdPUVFGK0xzZmo2ZlUyaGR2V25GWUsx?=
 =?utf-8?B?eXdDd1BDTFdnY2t5Q2ZQVmduMm96SlI3QmJVVGNIdXFpNmVEYnMzWkJOalp4?=
 =?utf-8?B?d2I2UXZkWWhjclphUytHdG5EZFZuWkpSQWk2QXMwWEJEc0xzcW9WZldVRHlD?=
 =?utf-8?B?YnhGWFJXbU56U2M1N1U1Lzk4MDJkV3VjTlc2STV0QmlzWm5MK1dyemxqMG9i?=
 =?utf-8?B?cHlOdkswanRXbEorYzh6ZnFVTlJheUpCVFlmVE1xYjhZRUhsK2g4SnExcU1v?=
 =?utf-8?B?Ti95TklRVG52T2I2UnBPRnk5L0FKaDQ5NVhabDNVYm8wM3ZORTJtY1F0QU1u?=
 =?utf-8?B?dmhQaXNhVTZZRjBTL0dmTEpXOFBoS1pITFpub0MraUZBQTFKVVVlbnBMSVFs?=
 =?utf-8?B?V3gvNGJiRG4zanU4anhqUURQSzMxRGtoZCt0by9zL211UFJ0dzM3MndudnZx?=
 =?utf-8?B?Umdld1ZmdEtLU0lqZVFpUGkwVTV1YzBxd2UxMEdzQTFIZ2xEaHRxNzFrZkNU?=
 =?utf-8?B?RHQrY0pYaXpvYk93alNKNllvcVQ5aEJBNjlRRCtZc2tla3ZndWV1eHpFc0lx?=
 =?utf-8?B?Z3Q0NTRnNm9kNHVDVEUwZXFmaldvbUo2enZzaFpUQXhWSU5mcmkzZGwzT1NS?=
 =?utf-8?B?UDF6NmRLWWp2RVdZR21GVzd6aFdwb2JSeEZGNU03T2hrYkN2S1hBb0tQUkhJ?=
 =?utf-8?B?MGoycWp4cWJocTk3ZUNHc0RtWEtKVGF0dkZ1ZERFY1BRT3JOK2xJdHBQSVlw?=
 =?utf-8?B?OTRPNGs2NkdJZ0ZTS25CaUhJVmZVanBGZGhJSGRMbjcrZGVLUFNUOFViMGh3?=
 =?utf-8?B?ZExqejM0S2xmdkwyS01YcE0xU0h0TEN1ZjJUZ1NBWnhxRHl4R2V1bng2WWxO?=
 =?utf-8?B?bDNVSm1mN0RiZWFRRkkxeldTZENLSUxEcStnK0phd1h5Q25DVVhobzM2ZUxp?=
 =?utf-8?B?ODM2NlBkZWJKdkN5L3lIU3hpUHF1NVM5cnBPb2pNY3V0OVZ2QTh4eGx4U1FE?=
 =?utf-8?B?bmpGTjBiK084TUphMjYvcG1acGsxdmQ3OWx6MElmR3dhTDFYaWdRZW43anRC?=
 =?utf-8?B?dVFRTmx3ZWJYb3cvZGNUSWFEaEdWVkFkbmg5SWlTVFh3Y1hqTlQrRG5seEtj?=
 =?utf-8?B?UFV5Y25KcnZwNW41eW81SjF2UUtnKzdiaDFKOEo5MU1OWGx0dUV0eHdNM2d0?=
 =?utf-8?B?ZWNkOUp2N3hJUzBHL2w2MjMzZTExVFFadnhKQ0ZvWFNzMURrcUZmZHFOTU1V?=
 =?utf-8?B?TlVtclVpK2FWVFAvWWNtNDkzVUlsYmR3b3lWbVg1bHI2QlhUb3pnRkp0alVL?=
 =?utf-8?B?Q1F1eElka0hsVUMzVWwwWDVwa0JRaUM5SU9PNmxHRlVDWC9GTzhxNktzNlZs?=
 =?utf-8?B?ZnMvQTBxSjBEZHJaUjR0dTlRQUVub0VmVk92NEdCL2FkWTNPN0lSRG8yYlZ6?=
 =?utf-8?B?SU0wNHRvR1dXdjdHQlZ3bHF5ZVZldlNIR2JPYmMzOWl4NzFuTm5tV3lWdnhJ?=
 =?utf-8?B?NUR2TU9sbEREK04vMDIrU2pLclNENkt3QXpRd1h3a3JjZUlCNG8rQWV5OWdu?=
 =?utf-8?B?TGJzR1JqSm1wbitoN0t2UG5POXNLZzBmQm9yNjlWSWp0bWtUSnpxSEt0c3VP?=
 =?utf-8?B?OGx6Y3ordUc4ZFQwZVhJSVZadkZsbExzZytlR0F3M0pQOHhrdG1NOE14R1U0?=
 =?utf-8?B?UHhhZGNWTlluY1ZGb0Jva2U1NFNTN3JpQkZEK0RnQjY4TGVQUjlqV2J5RlJY?=
 =?utf-8?B?bE9kUkVMSXBsRStVaFk4Vks4cU05dVM5ME5lMmVlZ3dIa3hWWnNLY1g5alBR?=
 =?utf-8?B?L0J3KzJMSFdJRHhSU0tWd1gyZnJ5WHNwdHpQV0VjRWpQSUFQYWY0eVRrdHRn?=
 =?utf-8?B?SlNzMHkwbnp5MWN0eTJMeFphZVRua1l4aURWYUp4SDFlV0tDTlQ0VlV1Zm14?=
 =?utf-8?B?L2FPYXVmU2s1TFZnNlhydXRXVUtWaWRFSmg1ZXRWTWt3cGprcHFhZE1jSGpM?=
 =?utf-8?B?dE5KaSs2dGtuUDBVeU16UWVxY1pUaU0xWTJXbGY1eWJRcXQrb2d6bVpkcGRS?=
 =?utf-8?Q?7lTXz2Z0JgAlOZMCBxcEQ3nrnoj4q6rhF88ii?=
X-Exchange-RoutingPolicyChecked: fe+5c7UPpm1QdkGToR5N2DUnFCX/KeWyMS9hS+XWvFA2gU5QuyN9YttHScBWgPXPQrO5/V18tn73nkgliDG4KihuAiDP07kf5Xcd1+KcutWOX9MX6iUaUHpbX1Z5KMgeuJEsekDa8XCY8LBquS4OSIcK0GAZio/oc8nWCHU+i3pYiZ1Jd83kiz1Y5bUhdPVRkNpB/eKZFwJKVk2V8A595dWUbTbX878p8lEIbQboCVWLySdG6D+S+Ir4NfH8U2aglhBt5MdXKIW1yMmJs81FHAmOPJJnjnEB9Ehczc44tT4CiSTS7TyZ2+A5FfZlBYifiE3pV6fj54B9shyeGUyECQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8de56823-007c-43ab-4b84-08df041ffd1a
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 09:45:54.8214 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xyN7MeTshKnQ7nVCxYhEVUSstUHzIAJzywxmamzH9IIGygeZXd7ohXLEIx3YfnOSekvw9nESXreuRzP5/flDPw8KGYNi2r0wt1BGK1vJSnU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9129
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



On 8/21/2026 10:17 AM, Nemesa Garg wrote:
> In joiner mode the fast path cursor update must handle
> secondary pipes. Iterate over all joined pipes uniformly
> to duplicate plane state, run check_plane(), pin the
> framebuffer and on success swap in the new plane state
> for each secondary cursor.
> 
> Track every successfully prepared pipe in a joined_pipe_state[] array
> of struct intel_cursor_joiner_state so that later frontbuffer, unpin
> and error-cleanup paths treat primary and secondaries uniformly,
> and ensures the primary's pinned framebuffer is released if a
> secondary fails partway through.
> 
> v2: Use intel_crtc_joined_pipe_mask(). [Ville]
>      Add locking mechanism. [Ville]
> v3: Drop the per-pipe fastpath mutex array. [sashiko]
> v4: Fold parallel arrays into struct intel_cursor_joiner_state joined_pipe_state[].
>      unify primary/secondary in a single loop.
>      use bare check_plane(). [Chaitanya]
> v5: Fix secondary uapi.crtc to each pipe's own crtc.
>      Rename intel_cursor_pipe to intel_cursor_joiner_state and
>      joined[] to joined_pipe_state[]. [Chaitanya]
> v6: Mirror primary uapi into secondary hw state, don't set uapi.crtc. [sashiko]
> 


LGTM
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

> Assisted-by: Claude:claude-sonnet-4.6
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_cursor.c | 153 ++++++++++++++------
>   1 file changed, 105 insertions(+), 48 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
> index db4eaa74fc58..9cb8b0a8537c 100644
> --- a/drivers/gpu/drm/i915/display/intel_cursor.c
> +++ b/drivers/gpu/drm/i915/display/intel_cursor.c
> @@ -842,6 +842,7 @@ intel_cursor_joiner_commits_idle(struct intel_display *display,
>   
>   static void
>   intel_cursor_fastpath_update_plane_state(struct intel_plane_state *plane_state,
> +					 const struct intel_plane_state *from_plane_state,
>   					 struct drm_framebuffer *fb,
>   					 struct intel_crtc *hw_crtc,
>   					 int crtc_x, int crtc_y,
> @@ -849,20 +850,34 @@ intel_cursor_fastpath_update_plane_state(struct intel_plane_state *plane_state,
>   					 u32 src_x, u32 src_y,
>   					 u32 src_w, u32 src_h)
>   {
> -	drm_atomic_set_fb_for_plane(&plane_state->uapi, fb);
> -
> -	plane_state->uapi.src_x = src_x;
> -	plane_state->uapi.src_y = src_y;
> -	plane_state->uapi.src_w = src_w;
> -	plane_state->uapi.src_h = src_h;
> -	plane_state->uapi.crtc_x = crtc_x;
> -	plane_state->uapi.crtc_y = crtc_y;
> -	plane_state->uapi.crtc_w = crtc_w;
> -	plane_state->uapi.crtc_h = crtc_h;
> -
> -	intel_plane_copy_uapi_to_hw_state(NULL, plane_state, plane_state, hw_crtc);
> +	/*
> +	 * Only the primary owns its uapi state; a secondary mirrors it, so
> +	 * its uapi.crtc/fb stay NULL and hw.crtc comes from hw_crtc.
> +	 */
> +	if (plane_state == from_plane_state) {
> +		drm_atomic_set_fb_for_plane(&plane_state->uapi, fb);
> +
> +		plane_state->uapi.src_x = src_x;
> +		plane_state->uapi.src_y = src_y;
> +		plane_state->uapi.src_w = src_w;
> +		plane_state->uapi.src_h = src_h;
> +		plane_state->uapi.crtc_x = crtc_x;
> +		plane_state->uapi.crtc_y = crtc_y;
> +		plane_state->uapi.crtc_w = crtc_w;
> +		plane_state->uapi.crtc_h = crtc_h;
> +	}
> +
> +	intel_plane_copy_uapi_to_hw_state(NULL, plane_state, from_plane_state, hw_crtc);
>   }
>   
> +struct intel_cursor_joiner_state {
> +	struct intel_plane *plane;
> +	struct intel_crtc *crtc;
> +	struct intel_crtc_state *crtc_state;
> +	struct intel_plane_state *old_plane_state;
> +	struct intel_plane_state *new_plane_state;
> +};
> +
>   static int
>   intel_legacy_cursor_update(struct drm_plane *_plane,
>   			   struct drm_crtc *_crtc,
> @@ -878,11 +893,13 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
>   	struct intel_display *display = to_intel_display(plane);
>   	struct intel_plane_state *old_plane_state =
>   		to_intel_plane_state(plane->base.state);
> -	struct intel_plane_state *new_plane_state;
> +	struct intel_plane_state *new_plane_state = NULL;
>   	struct intel_crtc_state *crtc_state =
>   		to_intel_crtc_state(crtc->base.state);
> -	struct intel_crtc_state *new_crtc_state;
>   	struct intel_vblank_evade_ctx evade;
> +	struct intel_cursor_joiner_state joined_pipe_state[I915_MAX_PIPES] = {};
> +	struct intel_crtc *pipe_crtc;
> +	int num_pipes = 0;
>   	int ret;
>   
>   	/*
> @@ -928,38 +945,69 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
>   	if (!intel_cursor_joiner_commits_idle(display, crtc_state))
>   		goto slow;
>   
> -	new_plane_state = to_intel_plane_state(intel_plane_duplicate_state(&plane->base));
> -	if (!new_plane_state)
> -		return -ENOMEM;
> -
> -	new_crtc_state = to_intel_crtc_state(intel_crtc_duplicate_state(&crtc->base));
> -	if (!new_crtc_state) {
> -		ret = -ENOMEM;
> -		goto out_free;
> -	}
> +	/*
> +	 * Iterate over all joined pipes (primary and secondary) uniformly.
> +	 * The joined pipe mask includes both the primary pipe and all
> +	 * secondary joiner pipes, allowing us to handle them all the same way.
> +	 */
> +	for_each_intel_crtc_in_pipe_mask(display, pipe_crtc,
> +					 intel_crtc_joined_pipe_mask(crtc_state)) {
> +		struct intel_cursor_joiner_state *j = &joined_pipe_state[num_pipes];
> +
> +		j->plane = intel_crtc_get_plane(pipe_crtc, PLANE_CURSOR);
> +		j->crtc = pipe_crtc;
> +		j->crtc_state = to_intel_crtc_state(pipe_crtc->base.state);
> +		j->old_plane_state = to_intel_plane_state(j->plane->base.state);
> +		j->new_plane_state =
> +			to_intel_plane_state(intel_plane_duplicate_state(&j->plane->base));
> +
> +		if (!j->new_plane_state) {
> +			ret = -ENOMEM;
> +			goto out_free;
> +		}
>   
> -	intel_cursor_fastpath_update_plane_state(new_plane_state, fb,
> -						 crtc,
> -						 crtc_x, crtc_y, crtc_w, crtc_h,
> -						 src_x, src_y, src_w, src_h);
> +		intel_cursor_fastpath_update_plane_state(j->new_plane_state,
> +							 joined_pipe_state[0].new_plane_state,
> +							 fb, pipe_crtc,
> +							 crtc_x, crtc_y,
> +							 crtc_w, crtc_h,
> +							 src_x, src_y,
> +							 src_w, src_h);
> +
> +		ret = j->plane->check_plane(j->crtc_state, j->new_plane_state);
> +		if (ret) {
> +			intel_plane_destroy_state(&j->plane->base,
> +						  &j->new_plane_state->uapi);
> +			goto out_free;
> +		}
>   
> -	ret = intel_plane_atomic_check_with_state(crtc_state, new_crtc_state,
> -						  old_plane_state, new_plane_state);
> -	if (ret)
> -		goto out_free;
> +		ret = intel_plane_pin_fb(j->new_plane_state, j->old_plane_state);
> +		if (ret) {
> +			intel_plane_destroy_state(&j->plane->base,
> +						  &j->new_plane_state->uapi);
> +			goto out_free;
> +		}
>   
> -	ret = intel_plane_pin_fb(new_plane_state, old_plane_state);
> -	if (ret)
> -		goto out_free;
> +		num_pipes++;
> +	}
>   
> -	intel_frontbuffer_flush(to_intel_frontbuffer(new_plane_state->hw.fb),
> +	new_plane_state = joined_pipe_state[0].new_plane_state;
> +	intel_frontbuffer_flush(to_intel_frontbuffer(joined_pipe_state[0].new_plane_state->hw.fb),
>   				ORIGIN_CURSOR_UPDATE);
> -	intel_frontbuffer_track(to_intel_frontbuffer(old_plane_state->hw.fb),
> -				to_intel_frontbuffer(new_plane_state->hw.fb),
> -				plane->frontbuffer_bit);
>   
> -	/* Swap plane state */
> -	plane->base.state = &new_plane_state->uapi;
> +	for (int i = 0; i < num_pipes; i++)
> +		intel_frontbuffer_track(to_intel_frontbuffer(joined_pipe_state[i].old_plane_state->hw.fb),
> +					to_intel_frontbuffer(joined_pipe_state[i].new_plane_state->hw.fb),
> +					joined_pipe_state[i].plane->frontbuffer_bit);
> +
> +	for (int i = 0; i < num_pipes; i++) {
> +		joined_pipe_state[i].plane->base.state = &joined_pipe_state[i].new_plane_state->uapi;
> +
> +		if (joined_pipe_state[i].new_plane_state->uapi.visible)
> +			joined_pipe_state[i].crtc_state->active_planes |= BIT(PLANE_CURSOR);
> +		else
> +			joined_pipe_state[i].crtc_state->active_planes &= ~BIT(PLANE_CURSOR);
> +	}
>   
>   	/*
>   	 * We cannot swap crtc_state as it may be in use by an atomic commit or
> @@ -971,7 +1019,6 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
>   	 * planes atomically. If the cursor was part of the atomic update then
>   	 * we would have taken the slowpath.
>   	 */
> -	crtc_state->active_planes = new_crtc_state->active_planes;
>   
>   	intel_vblank_evade_init(crtc_state, crtc_state, &evade);
>   
> @@ -1004,6 +1051,10 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
>   
>   	intel_psr_unlock(crtc_state);
>   
> +	/*
> +	 * Schedule or immediately unpin old framebuffers.
> +	 * Protect against concurrent access.
> +	 */
>   	if (old_plane_state->ggtt_vma != new_plane_state->ggtt_vma) {
>   		drm_vblank_work_init(&old_plane_state->unpin_work, &crtc->base,
>   				     intel_cursor_unpin_work);
> @@ -1012,18 +1063,24 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
>   					 drm_crtc_accurate_vblank_count(&crtc->base) + 1,
>   					 false);
>   
> -		old_plane_state = NULL;
> +		joined_pipe_state[0].old_plane_state = NULL;
>   	} else {
>   		intel_plane_unpin_fb(old_plane_state);
>   	}
>   
>   out_free:
> -	if (new_crtc_state)
> -		intel_crtc_destroy_state(&crtc->base, &new_crtc_state->uapi);
> -	if (ret)
> -		intel_plane_destroy_state(&plane->base, &new_plane_state->uapi);
> -	else if (old_plane_state)
> -		intel_plane_destroy_state(&plane->base, &old_plane_state->uapi);
> +	if (ret) {
> +		for (int i = 0; i < num_pipes; i++) {
> +			intel_plane_unpin_fb(joined_pipe_state[i].new_plane_state);
> +			intel_plane_destroy_state(&joined_pipe_state[i].plane->base,
> +						  &joined_pipe_state[i].new_plane_state->uapi);
> +		}
> +	} else {
> +		for (int i = 0; i < num_pipes; i++)
> +			if (joined_pipe_state[i].old_plane_state)
> +				intel_plane_destroy_state(&joined_pipe_state[i].plane->base,
> +							  &joined_pipe_state[i].old_plane_state->uapi);
> +	}
>   	return ret;
>   
>   slow:


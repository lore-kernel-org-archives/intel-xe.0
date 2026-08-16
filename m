Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03793C5B572
	for <intel-xe@archiver.kernel.org>; Sun, 16 Aug 2026 14:35:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 451C110E248;
	Sun, 16 Aug 2026 14:35:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nHMlE5uK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C83A410E321
 for <intel-xe@lists.freedesktop.org>; Sun, 16 Aug 2026 14:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786890940; x=1818426940;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Hlp36pO6/icJ7MulcF6vjEbPlVG/OJHqNR/hutCutdU=;
 b=nHMlE5uKT+4IgtMc6Rgd4ZohsHSa2zTcbmTIg5dr5suTfbDtRTDbNWox
 ctf6Dgdcr5dhgC5GsD1gBB5znqUE3KjiRBQ0VfsUaRsVVOO1L8s/eHLxi
 R4Bnbv8JMhV93B/gCqPix2dPsux5W7cnCkC2rjw4Ydvge3xLZv4maoU3g
 5atUrQOwqx5/TdBgM3e1iLvXMdeU5I1sqwA6b3DZw5gPCw7sSy4PN+uSU
 khKWpJu2xJ+JNdevixHATpHDRUocHbffcmcvMIPW0ZC5rVTG8rHVXce/Z
 3SKZTR2pNBRrWlhT3jRu1Kfgz3pXQVKYJM6X1Jul1A/tXxOcc37vk1nzZ w==;
X-CSE-ConnectionGUID: VeAAer5YT8C5EM8SJMylIA==
X-CSE-MsgGUID: iFj4EYkoR52jazrVVI74rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="98902651"
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; d="scan'208";a="98902651"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2026 07:35:40 -0700
X-CSE-ConnectionGUID: T58b2LfcRGe9Oc+iYfaHnw==
X-CSE-MsgGUID: heYcywPgSciJhpIEu+IcaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; d="scan'208";a="262040139"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2026 07:35:39 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 16 Aug 2026 07:35:38 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 16 Aug 2026 07:35:38 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.16) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 16 Aug 2026 07:35:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gR5TDhezQIxhigo0eFLNFg82m2YRw6xhAWsXMmkT3i8YU15JDmktMA/kARG/PjpIl54zjmxqOGEfHjshy1Qkx8BxqclTXQgrjPbvd45jgqvDzG2oKjT/sz2+ZjZvv/kfDeLxwH5+H/UaPwyOlEOcHAlKp2H9PRFlizcKl6gGYDKQ2GkGXKOuO/UfoHuQRFEkDDBXapTVdgMU6U3Zx0ONgjYd6g2LoImGWTLsmGcHrz15NhRyzTWb1rSNiFjamACcQK9DOeXkfVUW7ApZ5tt5k6TROYTC8Fw/gQHfa7NCbEuc2JdFZDs9TGV6LNFs9gWymRgrRoBDd6dfr+F+r2o+SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gcefQfFr5hGv9IrFUGNoxADTJqS+F4JrVIVKBipuUzs=;
 b=k657QnJVFD8bEiBGs0szX7LNkx2eBUQWj9B128r/a+dKGNrqCnCCuuv4+u2z3ko5OqrxVTJCLd2KH0+7uzKuPN08X/KsMnxJ6m7q/0FhYT++YkuqD6A7H3as2f4XKC4bo+hNzdQaqjTuG1CPpt90+s9qDRCKIFnDWTJTZdi5yaN9kgyMl2eGSalcIyFN+4bzrwTo8eeo26Y57wxOku7+waJv8WQqZfsALk7g5943t+0oeGoofEPxXEeEG/18hwKnq9oMhMscgGBtP/towaXV5SfLBor5jcCbs13CPgiLfugDEUy/EqFxF/hP/eHqnA6M8hKAtmaxR/29T3F1nRPd5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by SJ5PPFF8B526086.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::862) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Sun, 16 Aug
 2026 14:35:29 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0315.016; Sun, 16 Aug 2026
 14:35:27 +0000
Message-ID: <d8e4019f-238a-4bd6-b6f1-6e2b3bfea612@intel.com>
Date: Sun, 16 Aug 2026 20:05:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V15 14/14] drm/xe: Add fault-inject based VRAM page
 offline injection
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260811124016.3614699-16-tejas.upadhyay@intel.com>
 <20260811124016.3614699-30-tejas.upadhyay@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260811124016.3614699-30-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0104.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::10) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|SJ5PPFF8B526086:EE_
X-MS-Office365-Filtering-Correlation-Id: 411d1dd8-9c3f-4c42-f64f-08defba39d67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|6133799003|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: ySh6iGwb/ofcvywuelQZZW2mCbuqV6X4h2Q8Sp6TuY90Ceiad0j6wZs3g58SVUAm5RuIMcMVn+WIoAf80wSH6qp1CS9Qe8p34AMiAD7EuaiOFUpWGKLyEDvvoSbM/zjjmWy7EM9MfauDR485t3cTaZisGF56fes1qmHs/vUTpOubhUsn6KJ3HGqp7C9puq8/I9qETSa6x7WZIzHcjSARpZBVwEcPgiMITxeMwsJ1SH5GXeUI4zBCJsF9gtkVcZm8FGSBwhAc766kngzyacx+Qqk3ojoWKt5mhrWdYiD4ZcmmNsSbV2bg8X8oY6NK6N53X0NBvXdZ2VYSk7BE5NoTy66gdI0GFJXhIpt0OEhgr0aki4sEplQVonuve9uC7n0wzWJCS4EF06CX9W+I9ybLji3frBTIBx9CKHPc6CR6Yzl21TnNfAzY/bXAMGcxrShrg+Cvp02msAwHWkdUDAYUlz4KSshHBpw0xBVCUyDhR19kIJJ6y07sv37iIQXgDt8mGsdqn+7U6j3AnPhbqR6XznjUFoaBm9sK2Hsh8ms5HcNAlWXVhBAcy2pRiD0NxFtddkIP7DKq6w/+6185NDhakXKIRalgThZ1KGv1+1DWcK9sZ4mNmv+a5dUUuFDNw/1qNJv+P0/scB8r6t99r4gNyqfpMuoc2S7s0PKWNlunofA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGNBRWE3Rjg4eTNVUFNTY3hvTTAvSU81dzhma2g0RkRyNGhXR1pFM3NJS2t4?=
 =?utf-8?B?bGp1dVJ2eTJCRExqeGFTVXdJZXpKSGNXbDQyT3ZJRlhLTkNnSldWdXl1QXBB?=
 =?utf-8?B?NUVxTUtVU092UUJlWGxKbjBqOWZncmlxVnNxWlpabWdMVUxFVnJYYzVxeGRJ?=
 =?utf-8?B?UTdycm9hVVdWNGVlK2ZyUC9FeXFucUtaVkhDblRVc1NoSUpiL0VvWXlPOElB?=
 =?utf-8?B?MFhKMmZiUktENlg4alNBYTIwSnBTUmpPL294bnpaeThnKzN0alNjNnpzcW8z?=
 =?utf-8?B?ZHhmZE5rakhTeFgvdUpRRFZwWHd5ME9WVW9SeXFuSUErQWlsMWZjeFc2Y3g0?=
 =?utf-8?B?WVhmMVcrbzc0S3AvSFV0cGpTdnk4TkJoakYyZXAvSVFsT2FOc1IyWDlBem0z?=
 =?utf-8?B?c3c3aVI5bTVPZllGZzlLR1FmSUJBaENoSjJNL3NLU29LeE1yVkVwaEp6MEtl?=
 =?utf-8?B?ajZRcGhwcTRkcVAxei9VRCtJZ29tcVZWVHprcUlWN3RxNVJBMkpoUkVUYk9M?=
 =?utf-8?B?dllLZG1lY2g2ZlY2b21ueFRqekl5R1dsTlFsRHBwT09ySERBb05MTmZkSWVB?=
 =?utf-8?B?Z2h4ajhZSFptcythbGxnVnp1cDBZVC9uS2VIT0RIdlYzTmJhQlU2aUZpaDZD?=
 =?utf-8?B?elVadDlFWW0ycDA2c3VaalFqc2dPb2UyU0k0NkpCMFdqekdlS2NKZkc5cmxR?=
 =?utf-8?B?MWdBWlVzK0pNNWUvZjVnVlNJVm5GNGJOMVI3MlFYVkpNRzZjVGZQTWFzMzRi?=
 =?utf-8?B?SzBuZ0F4K096T1BQRUpRM3UvS3FjaXh4ZnFUeElEZTRnZDRwSWkzdVFUOStV?=
 =?utf-8?B?MDZKanM4eGpodHRzTDB5SStEUTMyajc2YTRCSGxERjdNNlVMWGtFY2ZFT2tT?=
 =?utf-8?B?RDBjeFppNUYxbWl4bE82Ym1lb0d3TDQyZnRUNWV6Y0J5VkhkME51QWFrT3Jy?=
 =?utf-8?B?OTB4QXVRWThJNHNDaGRISzZVNmZHR3VFOHJ5eUZqQU9naDFCaEdNWmRKeXZY?=
 =?utf-8?B?d3RBMm9GZ0VFdGJqaTRTblp0bzY4VE9ZTVJreENzdmdCeVFuTTJrR3hXSkV0?=
 =?utf-8?B?L0I5QVlRZVEyYlJDc1hyNnRhRm1YRmxlbE5PT3Zpa3V6S1pQREEvR21JcndO?=
 =?utf-8?B?Z1ZiemNOS1NaYW5yYTZ4Ymp4OU1ocUFzRW9BYzRob05hdmhKdVk4elNNajEv?=
 =?utf-8?B?WWxxaWxJOC9PeXVvRFEzUDNONXlWY0FQOE5LNFR4Q2dibkwzR04rdHplWnYr?=
 =?utf-8?B?NU8zYUR3RHNYM2tXYk5ab3BxWW16NVIyRExJNjlnUXJ1RnczM1ZpdGxZSUNu?=
 =?utf-8?B?UExhWUg0aVZjZGtQTndPK3FuU2YzMllNNzFWSmpxMjhHb3Z2UVh1SUlyUXdI?=
 =?utf-8?B?K1piSTlOb2wwR0dRa1JlT005Nkt1TEc3YmpXaWxodlNrSG15dnhOaWp0WkY1?=
 =?utf-8?B?ck9XdU5JdS9ubDhxKzBJTVpyWWlGdDJiVVp1U2htSzNrNWxXL2hDVXI5Skta?=
 =?utf-8?B?cU81ZWNuWFBjWVZXZy9NemRoZXRJcW12ck1CeWF6TFpDaTdoNktsclhYNHR1?=
 =?utf-8?B?TWZxeC9OSCtDL2FySGpDZFA5VjZwMjc2cU1yNHRoakhOdEd5WXYrS2tkeUF4?=
 =?utf-8?B?UHZXNWVCanFXMkZOcEZFNjEyZ0F2RDh0VGxIQW4vcVd5cU9SSTdOb0U5cmNt?=
 =?utf-8?B?OVZuOFoxTkhrbmdkNGxLazdpR0ppK2VWWkNBckw5L1pKTEtWUUhnai9XanFU?=
 =?utf-8?B?VFNqR0hpSk1qb25yWm92dG85bWhvMzRZeTBJY1pPVk1IamdPQ2dqejR0L1pK?=
 =?utf-8?B?VFk4ajhSMm1IVEZQS2hkemhJald2REZqN2NqcmhrQkZYaFNJMTlpZjhad1pM?=
 =?utf-8?B?b2xnTDVhbFVma1VMeE9LSjJKZm5Vb2RxY3VONTlSSHAxeFZLY1NjQWtxRFBq?=
 =?utf-8?B?ZGVPNEtsZHZGR2lIYmhncXZsK1k3V0NWYUtvcVE3dHJhS3FYNUpFUjMxeFBU?=
 =?utf-8?B?Z1QvTng5ZFBGRXhlZ3NIMy95Wmk4QWY3K0NESU41SFNNblJGVFAzMmNBWGNF?=
 =?utf-8?B?azh2WFR2RXhJQkhKYkI1SDllbGpwRWdnVDFzdHkwcjFCVUtzb0pGbmFzZk9w?=
 =?utf-8?B?NzVzcS96SXN3ekJhLzhDN0J6RWN5V2gvaHREYm04MS8rQzUvL3hIQ1Z2VWVo?=
 =?utf-8?B?Y2Y4Qk9sbERORUJwbG4zY0Joc012NjUzRWduTUpsRytDZ3dIRlBLRVhHMDVR?=
 =?utf-8?B?enREMjFiTUR0ZmpQd3FUamxuQUVYYlNIc0VmRzF2VWx1a3lLVXhac3NNMm5m?=
 =?utf-8?B?TmxEVW0zMkYybGtPYk4vcElLNmlBWXpab1Jla2hYVEJYVXZOSGZwYWgwSXlh?=
 =?utf-8?Q?bIQ7rRlWE7SCsAvY=3D?=
X-Exchange-RoutingPolicyChecked: YRgrpPousHVidQvqNZccWclrAMDKYWII2WVmxFdMGIRXHpVFNtR8bs/5Jm50qNOC+hmfvzDUWVLp6Z1vam1ok+Ahjucgh5seUQXPUYQiWjkVh0zr5ZfaVG9C9DEtzaX02yMO8orwaBXj3OKvjTITT3gVKxbqMJKtVVg82/Nz1XGBD+b5Ggz4dHPZOXhYd5c2TK70lfE4tiTm9Ga/+0zpRQQPCEXVimZeALoXgm3IewdY7vdsLpvkWrpS4SSFbRUb8Q0MQzQuQ4CEeMwoMvv8hPiOSb67LBe1dJkUJLhLyhLXOfhrXKL8/RAQnubjhd3jqNhb4G3dPThs9cGqT3JnRA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 411d1dd8-9c3f-4c42-f64f-08defba39d67
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2026 14:35:27.7622 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 39s1dVwO5Fzpprd1WK1bH5mjLXsU8ksUXrxpgYu5wZh3l4ve4Q6bIbOCDsYsNw6jg0p6lfUC/lbeD0jLU7H4kKTN3HNj4kCmTmi8+5ZJsbc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFF8B526086
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



On 11-08-2026 18:10, Tejas Upadhyay wrote:
> Add a fault-inject based debugfs interface for testing VRAM page
> offlining. This replaces the previous standalone debugfs approach
> with the standard kernel fault-inject infrastructure.
> 
> Two debugfs entries are created under the xe debugfs root for
> CRI platforms:
> - inject_mempage_offline/: Standard fault-inject knobs (probability,
>    times, interval, etc.) — only available with
>    CONFIG_FAULT_INJECTION_DEBUG_FS
> - inject_mempage_offline_trigger: Write a PFN value to inject a
>    specific page, or write "0" to auto-pick the last unallocated
>    VRAM page
> 
> The trigger accepts:
> - "0"      : auto-pick last unallocated page
> - "0xPFN"  : inject fault at a specific PFN address
> 
> On kernels with CONFIG_FAULT_INJECTION_DEBUG_FS, injection is gated
> by should_fail() (probability/times must be configured first).
> On kernels without it, the trigger always injects directly.
> 
> The injection reports the page as faulted via
> xe_ttm_vram_handle_addr_fault(), exercising the full page offlining
> path.
> 
> Usage (with CONFIG_FAULT_INJECTION_DEBUG_FS):
>    echo 100 > inject_mempage_offline/probability
>    echo 1 > inject_mempage_offline/times
>    echo 0 > inject_mempage_offline_trigger
> 
> Usage (without CONFIG_FAULT_INJECTION_DEBUG_FS):
>    echo 0 > inject_mempage_offline_trigger
> 
> v2(sashiko):
> - use cond_resched()
> - validate input first and fix addr < 0 case
> - validate vr, move block, found var as local to scope_guard
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_debugfs.c      | 50 ++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_debugfs.h      |  2 ++
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 52 ++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.h |  1 +
>   4 files changed, 105 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index eeceab4a9901..2fd1ff806864 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -32,6 +32,7 @@
>   #include "xe_sriov_vf.h"
>   #include "xe_step.h"
>   #include "xe_tile_debugfs.h"
> +#include "xe_ttm_vram_mgr.h"
>   #include "xe_vsec.h"
>   #include "xe_wa.h"
>   
> @@ -43,12 +44,18 @@
>   
>   DECLARE_FAULT_ATTR(gt_reset_failure);
>   DECLARE_FAULT_ATTR(inject_csc_hw_error);
> +DECLARE_FAULT_ATTR(inject_mempage_offline);
>   
>   static bool csc_hw_error_available(struct xe_device *xe)
>   {
>   	return !IS_SRIOV_VF(xe) && xe->info.platform == XE_BATTLEMAGE;
>   }
>   
> +static bool is_crescent_island(struct xe_device *xe)
> +{
> +	return xe->info.platform == XE_CRESCENTISLAND;
> +}
> +
>   /*
>    * Fault injection table.  Each entry registers a debugfs attribute; add a
>    * matching FAULT_ACTION() below for every entry added here.
> @@ -63,6 +70,9 @@ static struct {
>   	{ .name = "inject_csc_hw_error",
>   	  .attr = &inject_csc_hw_error,
>   	  .is_visible = csc_hw_error_available },
> +	{ .name = "inject_mempage_offline",
> +	  .attr = &inject_mempage_offline,
> +	  .is_visible = is_crescent_island },
>   };
>   
>   /*
> @@ -77,6 +87,41 @@ bool xe_fault_##name(void)				\
>   
>   FAULT_ACTION(gt_reset, gt_reset_failure)
>   FAULT_ACTION(csc_hw_error, inject_csc_hw_error)
> +FAULT_ACTION(mempage_offline, inject_mempage_offline)
> +
> +static ssize_t inject_mempage_offline_trigger(struct file *f,
> +					      const char __user *ubuf,
> +					      size_t size, loff_t *pos)
> +{
> +	struct xe_device *xe = file_inode(f)->i_private;
> +	struct xe_tile *tile = xe_device_get_root_tile(xe);
> +	struct xe_vram_region *vr = tile->mem.vram;
> +	u64 pfn;
> +	int ret;
> +
> +	if (!vr)
> +		return -ENODEV;
> +
> +	ret = kstrtou64_from_user(ubuf, size, 0, &pfn);
> +	if (ret)
> +		return ret;
> +
> +	if (IS_ENABLED(CONFIG_FAULT_INJECTION_DEBUG_FS) &&
> +	    !should_fail(&inject_mempage_offline, 1))
> +		return size;

Use the FAULT_ACTION xe_fault_mempage_offline generated above.

> +
> +	if (pfn == 0)
> +		return xe_ttm_vram_inject_fault(xe) ?: size;
> +
> +	/* User provided PFN — convert to DPA and inject */
> +	return xe_ttm_vram_handle_addr_fault(xe,
> +					     (pfn << PAGE_SHIFT) + vr->dpa_base) ?: size;
> +}
> +
> +static const struct file_operations inject_mempage_offline_fops = {
> +	.owner = THIS_MODULE,
> +	.write = inject_mempage_offline_trigger,
> +};
>   
>   static void xe_fault_inject_debugfs_register(struct xe_device *xe,
>   					     struct dentry *root)
> @@ -91,6 +136,11 @@ static void xe_fault_inject_debugfs_register(struct xe_device *xe,
>   		fault_create_debugfs_attr(xe_fault_inject_entry[i].name, root,
>   					  xe_fault_inject_entry[i].attr);
>   	}
> +
> +	if (is_crescent_island(xe)) {
> +		debugfs_create_file("inject_mempage_offline_trigger", 0200,
> +				    root, xe, &inject_mempage_offline_fops);
> +	}
>   }
>   
>   static void read_residency_counter(struct xe_device *xe, struct xe_mmio *mmio,
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.h b/drivers/gpu/drm/xe/xe_debugfs.h
> index cd56f7442b99..727747f13101 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.h
> +++ b/drivers/gpu/drm/xe/xe_debugfs.h
> @@ -13,10 +13,12 @@ struct xe_device;
>   #ifdef CONFIG_DEBUG_FS
>   bool xe_fault_gt_reset(void);
>   bool xe_fault_csc_hw_error(void);
> +bool xe_fault_mempage_offline(void);
>   void xe_debugfs_register(struct xe_device *xe);
>   #else
>   static inline bool xe_fault_gt_reset(void) { return false; }
>   static inline bool xe_fault_csc_hw_error(void) { return false; }
> +static inline bool xe_fault_mempage_offline(void) { return false; }
>   static inline void xe_debugfs_register(struct xe_device *xe) { }
>   #endif
>   
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index 5bb66c7b5505..c985d633c10b 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -834,6 +834,58 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr)
>   }
>   EXPORT_SYMBOL(xe_ttm_vram_handle_addr_fault);
>   
> +/**
> + * xe_ttm_vram_inject_fault - Inject a VRAM page fault for testing
> + * @xe: xe device instance
> + *
> + * Picks the last unallocated VRAM page and reports it as faulted
> + * via xe_ttm_vram_handle_addr_fault(). Used by the fault-inject
> + * debugfs interface for testing page offlining.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int xe_ttm_vram_inject_fault(struct xe_device *xe)
> +{
> +	struct xe_tile *tile = xe_device_get_root_tile(xe);
> +	struct xe_vram_region *vr = tile->mem.vram;
> +	struct xe_ttm_vram_mgr *vram_mgr = &vr->ttm;
> +	struct gpu_buddy *mm = &vram_mgr->mm;
> +	u64 addr;
> +
> +	if (vr->actual_physical_size < SZ_4K)
> +		return -ENOSPC;
> +
> +	addr = vr->actual_physical_size - SZ_4K;
> +	while (addr < vr->actual_physical_size) {
> +		struct gpu_buddy_block *block;
> +		bool found = false;
> +
> +		scoped_guard(mutex, &vram_mgr->lock) {
> +			block = gpu_buddy_allocated_addr_to_block(mm, addr);
> +			if (!block)
> +				found = true;
> +		}
> +
> +		/*
> +		 * Intentional race window: xe_ttm_vram_handle_addr_fault()
> +		 * re-acquires vram_mgr->lock internally, so we cannot hold
> +		 * it here. A concurrent allocation claiming this page between
> +		 * the two calls is an acceptable false negative for this
> +		 * test-only path.
> +		 */
> +		if (found)
> +			return xe_ttm_vram_handle_addr_fault(xe, addr + vr->dpa_base);
> +
> +		cond_resched();
> +		if (addr == 0)
> +			break;
> +		addr -= SZ_4K;
> +	}
> +
> +	return -ENOSPC;
> +}
> +EXPORT_SYMBOL(xe_ttm_vram_inject_fault);
> +
>   static size_t serialize_bad_pages(struct xe_ttm_vram_mgr *mgr, char *buf, size_t max_len)
>   {
>   	struct xe_ttm_vram_offline_resource *pos;
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> index eb55b0f74ef3..9feb999a1f8d 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> @@ -32,6 +32,7 @@ void xe_ttm_vram_get_used(struct ttm_resource_manager *man,
>   			  u64 *used, u64 *used_visible);
>   
>   int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr);
> +int xe_ttm_vram_inject_fault(struct xe_device *xe);
>   int xe_ttm_vram_sysfs_init(struct xe_device *xe);
>   static inline struct xe_ttm_vram_mgr_resource *
>   to_xe_ttm_vram_mgr_resource(struct ttm_resource *res)


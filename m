Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0456CCAC597
	for <intel-xe@archiver.kernel.org>; Mon, 15 Sep 2025 13:59:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA90010E4C4;
	Mon, 15 Sep 2025 13:59:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n7sLCj7s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96CC910E2DC
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Sep 2025 13:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757944770; x=1789480770;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TCTBaBW3BH1/5efJwyE+b4QLwDBQL+8btcQpSZ7+jVE=;
 b=n7sLCj7srEATCLm5XdVBfwSPDeppNybsx6bICtReT4yqk5A+p7e9Y26y
 whn3nJMbnxKZXnBNp+wt45s+653vyI/Nd9LIWUbNr+q+vvqx34WiP+UCo
 59Vhvqza6zfvLGrCg4AVUNEz6uA9mlUGvIyLaLRHZ++QwcOdJ6XAwpF86
 nc/xhDyMQCF1V8A8DsqNVW9iNG6EgYaVz56Xlbpj8U2MgXfRlb6R5IRld
 BkAHHr2D3fWpjf7ZJVyIAo1g9sGrZf2LcL3NxndTlt2Ijbrouc8Jx1vbz
 qKtKiUax0hQghKzKdnD7ms27Q8yf5uhXtkIx+dgvkYnoI4irBgbtjWHN3 w==;
X-CSE-ConnectionGUID: AxePf3jaT/iEOkB9+GMAoQ==
X-CSE-MsgGUID: cwjL8V62TgGBFSG369brXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="85634218"
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; d="scan'208";a="85634218"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 06:59:29 -0700
X-CSE-ConnectionGUID: 8ubZUCfNTvmjWepdfKwuVg==
X-CSE-MsgGUID: 3my7Uxy0RjWYzV4PmA5PhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; d="scan'208";a="174465233"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 06:59:29 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 15 Sep 2025 06:59:28 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 15 Sep 2025 06:59:28 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.1) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 15 Sep 2025 06:59:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FzWfdZhQ1Ynhyt2etaXgBpeolh74abn+9pLwgtXDjN/NMSlnJW71IT3rhIOehxvrF1jRq1pd8u05hjLqRfrDuw+vZNYCaHRGq+j3VI7PTCjTzYkIrDeD8xa70OInASUe1/SPVXSG4y1fnrjy6AkzslXoGEffxVivaEVqxAijaNc9kVGpPXySruTRkZSp6cJSTCEq5xS/MCz0ylE2u5Bg23GoVeKshw52gnkN/my0ieSI0fKhEvP/bwTJk6CEcYam284xV9Ur+mD8iK6J/gRzGtZyf4LZeI5GqK5nFEK/syNAnEJsNIIUODIrdXlChymi4nTmrtUtEJaql/OHCUt06A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1U4IUKgPkSaAga5L3f9cBOmMU3J8fhVOmwEfN/1xI28=;
 b=JLYsRzme1RE38rZVZ20W5tKJiOmHpA2mBBG5o4gL9wMN20n4ienq5GliLx1lH49BC9GO9a/WsIlyCTD5yNF0/uAoXdIOGH2Xe5WXv0+CUcVUEzTKvMv3jFFNdz1OEfQ3nLkBrNnPv1Jznq18JnzKgpaV0B/Va/0QyqGm7AKnO3+IFh0r47nuaQCA8+NK2arvWHi10eEZO5yxLDNIK+rp8r04Ih+4yLMOBqXnyB6zAeGpNive58/vQATmbmwP1r0i5XGqlNzii9K6CWv3947hjBK2OI2jWWax1lJWSxVZuWIlD1jmfTPyM1UTthfkTyB+M6nWCgclOJIcS4XpFhChgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by MW4PR11MB5934.namprd11.prod.outlook.com (2603:10b6:303:189::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Mon, 15 Sep
 2025 13:59:25 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9115.020; Mon, 15 Sep 2025
 13:59:25 +0000
Date: Mon, 15 Sep 2025 09:59:21 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 John Harrison <John.C.Harrison@intel.com>, Vinay Belgaumkar
 <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH v2] drm/xe/guc: Set RCS/CCS yield policy
Message-ID: <aMgbudYnYyHNHnCY@intel.com>
References: <20250905235632.3333247-2-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250905235632.3333247-2-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: SJ0PR05CA0173.namprd05.prod.outlook.com
 (2603:10b6:a03:339::28) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|MW4PR11MB5934:EE_
X-MS-Office365-Filtering-Correlation-Id: c3aeede9-ec4a-4243-d2f5-08ddf4601448
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BhyFR2XtUuiOg2lBluBX8DiZ40C5KIKlc0n8pTSak4tKjt59+7Ch/1vngdms?=
 =?us-ascii?Q?7cPQ7E/6UPqhN9Y2b/XoxTlGdgumSFYeCfXTyxDdvmHIoMhw0sz164nxCnHh?=
 =?us-ascii?Q?CEqG54UvGaE143639KQfg4n+z1H10WRz2wdDiFhExdjs8AWqmnlE/g5RmtR8?=
 =?us-ascii?Q?5QFvv3QyROsWjnXD3SK8TvKSG6QVLYTzldoWv9BqdLRCLe2eGPxB2awe81nS?=
 =?us-ascii?Q?pHURbPS2MZOelL2Jf2R9okYkrUzz9L9rbt/ZRlEebvHj7OS/Vpahquy8vwQ/?=
 =?us-ascii?Q?bvHQeiq04JdIfOLymyfEqrshtV9bZMpnrL47EnfMxQp1NeSXNfNo5XpvhnmN?=
 =?us-ascii?Q?OBWhWImvaV7nW3GemhEbI+tovG5QadySZBaWq2Rigy9swpStEouMR9i7hNq7?=
 =?us-ascii?Q?T/lV3hZAMALpCF3RG+MJGpOHlrrYGyeO/3hm2bRtcJGhoOhhy0kemBiBwuHc?=
 =?us-ascii?Q?/2ek/LXiTbCJgwv/e/OVyFd8+LzE08CKAhjGForVKIfdylLquhMO8XQQacWi?=
 =?us-ascii?Q?UZg99q7F4BsaOjYTw27zhg1dMELpPwk931L1RbsSnf0qhpnCjM7BwEBB8QYE?=
 =?us-ascii?Q?Pcf+mZ+FIeihPOSShO4gBL/vZ5TJO5iPNBvSKXOGVOCEGOULFV/c/O3VPfRI?=
 =?us-ascii?Q?QGSL2fOsGcHwYrZyL6HXNBQXpFJW4vRFj/HfFNYE9hkX3aMnOPtFQE6Zxj3L?=
 =?us-ascii?Q?a9Mu7VFmnvCCfo/IqkVfL+W00vNY9/UOZ4b0EY5lD/3elW4Qr7F0HTlTw4D7?=
 =?us-ascii?Q?nGLf12ECI7VDJw1U/Tr8A+v1p2eXUbQFcD5dgaIiClSgR8TFOHvuTamotqcv?=
 =?us-ascii?Q?sH+niNxwI0ShLLkGZyoSO9aCOlyH0ZcycZQE0NOCFBRoJzRBbtl0P9WytxWK?=
 =?us-ascii?Q?aCXR3qEJUdpu4gRDxxaxJw3Npl0GCo0lWM1GkEsVux8DHBEp2XEHGabM2+/m?=
 =?us-ascii?Q?q+9NgrYZrh0B5o53iQE4PfZVlsK6j51rpfoKhygENA8n+2XFrXVw4Jn2wJEP?=
 =?us-ascii?Q?+DcNWQExPjSv4DoS/gU/JRrimInlEPSrksnmGKowHv+SPxPG75/i9LS7hnMW?=
 =?us-ascii?Q?vjmh26rajN2DS0GmgO9uSojFfur6c6TuAd/m/bAU297bFXaOuvpx5PNUHg7G?=
 =?us-ascii?Q?R3nuRbsOfSN+vq/r4LoGgFLk1Dy69gJkdgTdoBiE91hR4cAIadx6jq3PfDkU?=
 =?us-ascii?Q?XDQBuzgPAiEV8uu2N9xa/Z1K8AgSZJk/hgi0UIFjI4WBD5oGOxxFQ/OEF/Qx?=
 =?us-ascii?Q?GolZ1f4Cf669GnpQwW+WbB4HSb4MSQGHmjHFIZ6+OtI6GuD4YzyMmJ/xpxLq?=
 =?us-ascii?Q?8sdLvnAhDnVtIfc5JcG3rJEj6+C4DCoulsP9RMBv+h5BBTUft6gF4gOZ6W7W?=
 =?us-ascii?Q?95iRYmpH3TAvf0lj5uW40dC59ij5egdQFma7g90jEdNFjcXFd1i3s8Di1TUy?=
 =?us-ascii?Q?WxAgDMi6os0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3IQ+ZI558EaeamjCpGnMEy/eull2xLnWqJFpLsizIA1jh1wLbnlsckYFo/3H?=
 =?us-ascii?Q?8kVsrjrkk5Lf34Q4zU2BJbcP3fJ1KAJ2eksDl3k0udNQB0erUa4YZwCy+0Z/?=
 =?us-ascii?Q?Q0exCQDbM7Q+sIal/Q4URvDWc+q+U7d6MQx/KFU49j+UCkxB5OyMcYLPuilT?=
 =?us-ascii?Q?qA5UqUbPXV8PZ+NIbOa8DAgWyYUvXnq/qS+urmeQnNMIJcn6gFxPNG1STeTx?=
 =?us-ascii?Q?lZM/EV5hKLYWSf3qaE7tunLeI0Jh4Apab6T/GUYjxsF1NTi04TEBuZ76wA7k?=
 =?us-ascii?Q?NY7/FCL4m74A0UWS20qUKavqkgeKbAA8NJGmjMtZO1tkV+f8qXsa+o08mRKq?=
 =?us-ascii?Q?Ebu3BAMcADl5Prz/lTU8Iv7U+UMxgiaFHP8m/qJzAIp4ummIZ/3xk0Zlv354?=
 =?us-ascii?Q?FpSSb+aDkhwjSFwcXJyQvu86EQy53SQOa1eyBOCuzZA2WSoRAX1Ftb1KWBrk?=
 =?us-ascii?Q?3XhYNNocIB5+bpPoHKscYsaJjDHdyD95EJ2TEIutmvOZyikjqNxiOWO5pEh6?=
 =?us-ascii?Q?0YJgbIPXKBdZ6vPVI2KFAsAsf2T/bBSly6v0HotCCcuOGWO6PdhnoKl5QJli?=
 =?us-ascii?Q?Yj603wvTXlIznqMsXUO8WdFRmK+Fx+BNx7p55Q3eKhDQEYQLilLHxvtv0TUV?=
 =?us-ascii?Q?bYk1wB38oA6QVrDRIlChBI51bQSy8JeAUN3DA6h+ZzOJh0qT0z4C1JvSMeoy?=
 =?us-ascii?Q?tOOHHYtDny8snNJLvLY1prMDI6aoWsOYnCuOtLVKjzFxoHon2E6O5Bl1fbzC?=
 =?us-ascii?Q?U+TDL9kg2OPELvbnbag3qze4exugGa/wP+E7F7HCZidgbPzwAJbkHqJl3yVp?=
 =?us-ascii?Q?+omvXXYft1I+0MI2uqC+YxU/Lj7KxR84jEAfSu8UUjIzCcnbDQ16z5onSlgw?=
 =?us-ascii?Q?aaFQpzjVRmSP2eAloC4Hf3Rvv8PUSjtkuFzmTZAeLUFN/4Cgj9Dn6g7HIqm/?=
 =?us-ascii?Q?Q8re0ezoAf3HBY2kXNsATSnSb5/4LoLIrXXbKqfU+95t3JA9l8OL7J498XXs?=
 =?us-ascii?Q?OA0tFAUyJ6Upb4Mrnm0HW/0z0qiBz78Pmi8dvSQF2PlW0X7tcQxt7LlcdME8?=
 =?us-ascii?Q?vDBPp0W7oVB9HVBgisZOPFShruXUpHDC4WfWcmbkXv19dQSrkQVBkTHB8Ktp?=
 =?us-ascii?Q?YBYzitaG0+IGSYVtAn05Kyhk9jNV/Qr7k1aec9ieTPwgouRHuruMgeCJLX3K?=
 =?us-ascii?Q?/1H0I9E62cmy6ckyPH/A0wWF/tkBOCTf/aTJ3esHtdVv2gqyc+AdBATCpwVv?=
 =?us-ascii?Q?wTCvQY3x0z3W4yjDTGZiv1VvCiRWPquKvwfwd9oiHEalbMFk489UUVBpPjde?=
 =?us-ascii?Q?rT9Ht7J9TuGCtZlrSK96gQ2TniPk5CbFI12jKP1cXsAnJc7FwYWinozAL5GL?=
 =?us-ascii?Q?ms4tqfN7P6ASyoToTxZNQUOtMRCw/IRx/6ruoft+VqeP+XKA/r49ra6lqf9U?=
 =?us-ascii?Q?cmvTTeJClcbD3E9rPQcWd//9mF/hljW2/dM3SyVj4IoVm1/QZfWOH74x+ySN?=
 =?us-ascii?Q?1STzDiw+6cVQRLBdo+GtSFUdZ9E22T1VHm0uRNk31YySIyIKX9RzfVEWhyPj?=
 =?us-ascii?Q?dS/TF+MKFhFwbRTU3KFa2F5ZLuoJ5bHNgXKNpltIxklEHF1U7Zys12SIa05c?=
 =?us-ascii?Q?uA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c3aeede9-ec4a-4243-d2f5-08ddf4601448
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 13:59:25.3487 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8t2+Dyq6sFKi11Ze4cneSCzWKe1j1dSpDAgtz824lE1IqFoeeXRmY71kVRWtJYGb7jLXdLXHm2nnT7hRn+0svw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5934
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

On Fri, Sep 05, 2025 at 04:56:33PM -0700, Daniele Ceraolo Spurio wrote:
> All recent platforms (including all the ones officially supported by the
> Xe driver) do not allow concurrent execution of RCS and CCS workloads
> from different address spaces, with the HW blocking the context switch
> when it detects such a scenario.
> The DUAL_QUEUE flag helps with this, by causing the GuC to not submit a
> context it knows will not be able to execute. This, however, causes a new
> problem: if RCS and CCS queues have pending workloads from different
> address spaces, the GuC needs to choose from which of the 2 queues to
> pick the next workload to execute. By default, the GuC prioritizes RCS
> submissions over CCS ones, which can lead to CCS workloads being
> significantly (or completely) starved of execution time.
> The driver can tune this by setting a dedicated scheduling policy KLV;
> this KLV allows the driver to specify a quantum (in ms) and a ratio
> (percentage value between 0 and 100), and the GuC will prioritize the CCS
> for that percentage of each quantum.
> Given that we want to guarantee enough RCS throughput to avoid missing
> frames, we set the yield policy to 20% of each 80ms interval.
> 
> v2: updated quantum and ratio, improved comment, use xe_guc_submit_disable
> in gt_sanitize
> 
> Fixes: d9a1ae0d17bd ("drm/xe/guc: Enable WA_DUAL_QUEUE for newer platforms")

This patch doesn't backport cleanly to drm-xe-fixes since
xe_guc_submit_disable() doesn't exist there.

If really needed, please provide a backported version.

Thanks,
Rodrigo.

> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/xe/abi/guc_actions_abi.h |  1 +
>  drivers/gpu/drm/xe/abi/guc_klvs_abi.h    | 25 +++++++++
>  drivers/gpu/drm/xe/xe_gt.c               |  2 +-
>  drivers/gpu/drm/xe/xe_guc.c              |  6 +--
>  drivers/gpu/drm/xe/xe_guc_submit.c       | 66 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_submit.h       |  2 +
>  6 files changed, 97 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> index d8cf68a0516d..1baa969aaa7c 100644
> --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> @@ -117,6 +117,7 @@ enum xe_guc_action {
>  	XE_GUC_ACTION_ENTER_S_STATE = 0x501,
>  	XE_GUC_ACTION_EXIT_S_STATE = 0x502,
>  	XE_GUC_ACTION_GLOBAL_SCHED_POLICY_CHANGE = 0x506,
> +	XE_GUC_ACTION_UPDATE_SCHEDULING_POLICIES_KLV = 0x509,
>  	XE_GUC_ACTION_SCHED_CONTEXT = 0x1000,
>  	XE_GUC_ACTION_SCHED_CONTEXT_MODE_SET = 0x1001,
>  	XE_GUC_ACTION_SCHED_CONTEXT_MODE_DONE = 0x1002,
> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> index 0e78351c6ef5..265a135e7061 100644
> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> @@ -17,6 +17,7 @@
>   *  | 0 | 31:16 | **KEY** - KLV key identifier                                 |
>   *  |   |       |   - `GuC Self Config KLVs`_                                  |
>   *  |   |       |   - `GuC Opt In Feature KLVs`_                               |
> + *  |   |       |   - `GuC Scheduling Policies KLVs`_                          |
>   *  |   |       |   - `GuC VGT Policy KLVs`_                                   |
>   *  |   |       |   - `GuC VF Configuration KLVs`_                             |
>   *  |   |       |                                                              |
> @@ -152,6 +153,30 @@ enum  {
>  #define GUC_KLV_OPT_IN_FEATURE_DYNAMIC_INHIBIT_CONTEXT_SWITCH_KEY 0x4003
>  #define GUC_KLV_OPT_IN_FEATURE_DYNAMIC_INHIBIT_CONTEXT_SWITCH_LEN 0u
>  
> +/**
> + * DOC: GuC Scheduling Policies KLVs
> + *
> + * `GuC KLV`_ keys available for use with UPDATE_SCHEDULING_POLICIES_KLV.
> + *
> + * _`GUC_KLV_SCHEDULING_POLICIES_RENDER_COMPUTE_YIELD` : 0x1001
> + *      Some platforms do not allow concurrent execution of RCS and CCS
> + *      workloads from different address spaces. By default, the GuC prioritizes
> + *      RCS submissions over CCS ones, which can lead to CCS workloads being
> + *      significantly (or completely) starved of execution time. This KLV allows
> + *      the driver to specify a quantum (in ms) and a ratio (percentage value
> + *      between 0 and 100), and the GuC will prioritize the CCS for that
> + *      percentage of each quantum. For example, specifying 100ms and 30% will
> + *      make the GuC prioritize the CCS for 30ms of every 100ms.
> + *      Note that this does not necessarly mean that RCS and CCS engines will
> + *      only be active for their percentage of the quantum, as the restriction
> + *      only kicks in if both classes are fully busy with non-compatible address
> + *      spaces; i.e., if one engine is idle or running the same address space,
> + *      a pending job on the other engine will still be submitted to the HW no
> + *      matter what the ratio is
> + */
> +#define GUC_KLV_SCHEDULING_POLICIES_RENDER_COMPUTE_YIELD_KEY	0x1001
> +#define GUC_KLV_SCHEDULING_POLICIES_RENDER_COMPUTE_YIELD_LEN	2u
> +
>  /**
>   * DOC: GuC VGT Policy KLVs
>   *
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 34505a6d93ed..3e0ad7e5b5df 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -98,7 +98,7 @@ void xe_gt_sanitize(struct xe_gt *gt)
>  	 * FIXME: if xe_uc_sanitize is called here, on TGL driver will not
>  	 * reload
>  	 */
> -	gt->uc.guc.submission_state.enabled = false;
> +	xe_guc_submit_disable(&gt->uc.guc);
>  }
>  
>  static void xe_gt_enable_host_l2_vram(struct xe_gt *gt)
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index b3a6408a5760..ab1cc11a208c 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -888,9 +888,7 @@ int xe_guc_post_load_init(struct xe_guc *guc)
>  			return ret;
>  	}
>  
> -	guc->submission_state.enabled = true;
> -
> -	return 0;
> +	return xe_guc_submit_enable(guc);
>  }
>  
>  int xe_guc_reset(struct xe_guc *guc)
> @@ -1602,7 +1600,7 @@ void xe_guc_sanitize(struct xe_guc *guc)
>  {
>  	xe_uc_fw_sanitize(&guc->fw);
>  	xe_guc_ct_disable(&guc->ct);
> -	guc->submission_state.enabled = false;
> +	xe_guc_submit_disable(guc);
>  }
>  
>  int xe_guc_reset_prepare(struct xe_guc *guc)
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index bfc061da8f93..e377ba3a39b3 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -32,6 +32,7 @@
>  #include "xe_guc_ct.h"
>  #include "xe_guc_exec_queue_types.h"
>  #include "xe_guc_id_mgr.h"
> +#include "xe_guc_klv_helpers.h"
>  #include "xe_guc_submit_types.h"
>  #include "xe_hw_engine.h"
>  #include "xe_hw_fence.h"
> @@ -316,6 +317,71 @@ int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids)
>  	return drmm_add_action_or_reset(&xe->drm, guc_submit_fini, guc);
>  }
>  
> +/*
> + * Given that we want to guarantee enough RCS throughput to avoid missing
> + * frames, we set the yield policy to 20% of each 80ms interval.
> + */
> +#define RC_YIELD_DURATION	80	/* in ms */
> +#define RC_YIELD_RATIO		20	/* in percent */
> +static u32 *emit_render_compute_yield_klv(u32 *emit)
> +{
> +	*emit++ = PREP_GUC_KLV_TAG(SCHEDULING_POLICIES_RENDER_COMPUTE_YIELD);
> +	*emit++ = RC_YIELD_DURATION;
> +	*emit++ = RC_YIELD_RATIO;
> +
> +	return emit;
> +}
> +
> +#define SCHEDULING_POLICY_MAX_DWORDS 16
> +static int guc_init_global_schedule_policy(struct xe_guc *guc)
> +{
> +	u32 data[SCHEDULING_POLICY_MAX_DWORDS];
> +	u32 *emit = data;
> +	u32 count = 0;
> +	int ret;
> +
> +	if (GUC_SUBMIT_VER(guc) < MAKE_GUC_VER(1, 1, 0))
> +		return 0;
> +
> +	*emit++ = XE_GUC_ACTION_UPDATE_SCHEDULING_POLICIES_KLV;
> +
> +	if (CCS_MASK(guc_to_gt(guc)))
> +		emit = emit_render_compute_yield_klv(emit);
> +
> +	count = emit - data;
> +	if (count > 1) {
> +		xe_assert(guc_to_xe(guc), count <= SCHEDULING_POLICY_MAX_DWORDS);
> +
> +		ret = xe_guc_ct_send_block(&guc->ct, data, count);
> +		if (ret < 0) {
> +			xe_gt_err(guc_to_gt(guc),
> +				  "failed to enable GuC sheduling policies: %pe\n",
> +				  ERR_PTR(ret));
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +int xe_guc_submit_enable(struct xe_guc *guc)
> +{
> +	int ret;
> +
> +	ret = guc_init_global_schedule_policy(guc);
> +	if (ret)
> +		return ret;
> +
> +	guc->submission_state.enabled = true;
> +
> +	return 0;
> +}
> +
> +void xe_guc_submit_disable(struct xe_guc *guc)
> +{
> +	guc->submission_state.enabled = false;
> +}
> +
>  static void __release_guc_id(struct xe_guc *guc, struct xe_exec_queue *q, u32 xa_count)
>  {
>  	int i;
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> index 6b5df5d0956b..e20ccafdfab5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -13,6 +13,8 @@ struct xe_exec_queue;
>  struct xe_guc;
>  
>  int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids);
> +int xe_guc_submit_enable(struct xe_guc *guc);
> +void xe_guc_submit_disable(struct xe_guc *guc);
>  
>  int xe_guc_submit_reset_prepare(struct xe_guc *guc);
>  void xe_guc_submit_reset_wait(struct xe_guc *guc);
> -- 
> 2.43.0
> 

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B18C61DCB
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 09:45:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9F5610EF7C;
	Thu, 27 Aug 2026 09:45:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WjwdWSNK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22F8710E3D8;
 Thu, 27 Aug 2026 09:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787823952; x=1819359952;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=WFWVBnHKmrr8D/Td2QGNk/gFs4EqGy0/eMkCBastRHg=;
 b=WjwdWSNKnt0biBCXwCCjeyyBVGFVhXzbkS7EXMOdTdolO3YiUOtDN+ZR
 jMjh7AxQbc/UIFIbolz0USVeI7kAZuQEaQrezPKMuTtwBhchda/4AzgdG
 GLOpdPcPrffglvzNVXd23tXTHYAvNOoLVqdc+641ab1Vy0d4+O3GSS86g
 Wign2U68tsHXZ/wxJPJgMcXUE+gl2vr5mr//hPY0PVE3V7z5lB4U853yf
 HlnHG1SeSn2FGMR/Sy9vPr+ht2Bbm37PlGBZtpxJqunIfQcRBTMErmKz+
 ujQUm5OLGgNv2Pk4XNf8VUU05g0nSRbfsJLZWhXHKOW/33emhzSTslptN w==;
X-CSE-ConnectionGUID: 9CA2NPLaSJSYLydXrOjS3Q==
X-CSE-MsgGUID: eXoaR6RNSJCOOS2QCtaJYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="92179277"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="92179277"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 02:45:52 -0700
X-CSE-ConnectionGUID: OamR2BdtQlyUAc5WUQgAng==
X-CSE-MsgGUID: s1Ye67hbQmKvvGiXEhpxHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="264054618"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 02:45:51 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 02:45:51 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 02:45:51 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.24)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 02:45:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O3L67gp516LuX7cMRt/+lRvcRxtl73REoNF+YmkeG4HB1f8WHPTfyJZneHQ7GUJAz9g2kDCZIRyeVIfmyncwk5FgBtrfRMWprAOGjp+fpiPSByPn4oIPsmGkaCjCYV2ByqgvYYhYCnw2hdI2wY4IFc3BdMxya1WoeIIehGDuZ8OafHxukubQNyrCbWaXJCIZu49BFNLaN4ig3WmrZAHFc0shYMbjvi7pnPDnY3XRakdgzDFb+sD9s48KBMkbVAz9MdymNRImf6/DQstmJWz0D6ptzWFhFc/TH6FmwJvrvXFn+nZ+OyATH9pKc1uk8IzwEqar3C8nxXat+bm/6B3BkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AiCjLq2qb14Psms5VBR3nE0RcmXtGl0moHTxBTHeZ34=;
 b=yv0gej/X4FZxauJSn21CAgYw5v1TXebNqaBqTR/lDTCjsUz0lgrEm1nO8LR4GBRJCsfkWSpq9l0/H4mnEYzdnItx5ANQVF5U4OnmEKeyZmkrNsEeYUi98fJkV/hju2C7cAK6aaolStiffEjM6SzrHxvgYBOIPpUDIdpw1dN6Tz6okxYAtPIkj0fbchz5Ai0C7E5MKZmhCEkv3hX4EY5PWegE9rKwlndHLImx6jdoKlr6jALf8DRy6GoRcrmOcP6FbuMVbUAK1MSc05IPgrP+bJnyefbglq/mdXZymoO0z/wpvtZbPcJoPR8fUZ8F9P3DxGmBlUGEVMcakas0FbuuPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by IA4PR11MB9129.namprd11.prod.outlook.com (2603:10b6:208:55e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 27 Aug
 2026 09:45:47 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0360.005; Thu, 27 Aug 2026
 09:45:47 +0000
Message-ID: <cf81a473-c630-4c7c-af91-849ab58deaf0@intel.com>
Date: Thu, 27 Aug 2026 15:15:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] drm/i915/cursor: Check joiner cursor commit status
To: Nemesa Garg <nemesa.garg@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
References: <20260821044755.2234490-1-nemesa.garg@intel.com>
 <20260821044755.2234490-2-nemesa.garg@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260821044755.2234490-2-nemesa.garg@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0059.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d3::10) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|IA4PR11MB9129:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dd293b9-592d-43d8-9e9a-08df041ff87e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|22082099003|56012099006|18002099003|3023799007|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: oXcMKXbptt2qgP51PayJW0PkUZ3bb9gc+/lbQMrn1RMEwx9kiIbR4RiW9SxCr5xKMLEwiXURwNHdP6h2rqLbeASPWDy/K1m5i1p+W9NEdYbT+R6HR85Jp6j71yiU+4wU273i+sOxQPtlWtMbi6vOpLLioVMHys8RWldtknc0D6fE7cBIe4gl5+vD9E4+AlvvAWY2Sk3CQoOtmSU2AIJSyZcAkVPZhcDIYMUyRv5T+JzMKy8bPPajX+AUvv5+bS8ZezGPep2RwNR/vELctNPIt3S5z1OD9JfFIp1JorhILDECbqk99uLHA6yndql9l7IrSXfbctqfCNkZ+m2G0wB83oazNcBNdXz70+QCgl8Zky0R0n/MEIRsce5sZq1vT6iYVIs45noLtLZPE0Sv0g6j4daxq7qh+VCKF8OIw/2xRDFR6Ryx2qsJ0QrQ0CR59GBL5CX/bJ8HRLpnmjw45uTAPAZqPHR67ijejtLoO0DFohZ/jrR3HU4onMdoYVTbWC1P7JTePGWy9TrThQnVW3lvjmjXtSh9JJui46FxEIa8DwWom4guRDFqqytBdVHlIIwSLIBnxrJKmMryeTLAubgqiDRE/6Z/mVYdUJs7iRk5vvtDmEGdqN08Ky1C5Caj4SrtBkmz2wzjrL7MYpN+RbVMX6iX8h705N6bfAjbk7r1CZc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(22082099003)(56012099006)(18002099003)(3023799007)(11063799006)(4143699003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEErWFhTcVBYUk5MY2tvc2RFWDl0VnNuaFVaZzNMZFJjRGR5NmJIRmtrSlI3?=
 =?utf-8?B?Nm1KYlA5cGprR3BhYUlQcG5LWVJQSElZZUVVL3JSalFrZkd1Tk1SMXVQeEFX?=
 =?utf-8?B?cTU5YnlQaU16TnAra0pSQjMxdUFta3lUTGNZSWJxcnJLV1N6Qm1ta3Y0VDZV?=
 =?utf-8?B?MHVzV1pqRzh3RE1leC9tOUJEbCt0NEdrSElTRGZFL3pzVzR4RmsxK3ExUjRy?=
 =?utf-8?B?blpEeStWWTdkVEp5cFlZeEZpM2J5cmdRZFhma2RZZ0gvMWdTem1scHpyUHpR?=
 =?utf-8?B?QU9TNnBUV3RGQUNNb2N3ZTdaaVFZQjE3YlRONFJqU2NJWldpNWJveERNNlZz?=
 =?utf-8?B?UGN5MUhqajZicG1WbzNVd1VmTFFjN1NML2ZUaEJaZ1JGNlpJb2ZYbWIrU09V?=
 =?utf-8?B?Szh0WmFnT3NxUXR0clFRUnZjQ1NSbCtjUURVV2I0VUUzamdpeDc0NUUzWnha?=
 =?utf-8?B?OGlOTHNpYmwrMDNwMVF4S1BzakdIMFNXd0RPR2x4c0xDdmVJckJlSlRYd0tR?=
 =?utf-8?B?U0F1R0R3V3E0b0FnclNIaEJYbHlscFoweHFNR0lYQld0cC96QXhUS1RsVWZK?=
 =?utf-8?B?YTdPTnA3MHUyR09LTmRqeTJDQVI3S0x4Um05a3dCclhlbDJFdU1sMXY0eGwx?=
 =?utf-8?B?MklxYXM0UVc3MFlqcEV6emtIUjgrZEhFRnkxcm1hZEwrQmtzM3J5NWhLeFJa?=
 =?utf-8?B?Y05oV0hHRTZkMHoyaUVNUlRRVkxERUk3SHBBcXB6dkl4bmJEeXZxUGtEeGM4?=
 =?utf-8?B?d01JZEZ0Tlg0Mlp5SkJTM2ZzVkpFMmJVa2oyLzR4TzZmWWF2TFBCeEJFK0d2?=
 =?utf-8?B?cDlUYWgxWjdSV0pJNXllalZ2bUxUcGV3RWZjS1RyMWpJb251bFhjZlIyQStF?=
 =?utf-8?B?TlVpYnpaaWVWSXRGWDZNVHFJdVQ3SXJIMTRyOE9vb092RlM0eGdCV3R4aUdU?=
 =?utf-8?B?eHVEN3dVU1pkWlVmWCs2aGNKTWVCQk5DcGlMSWMyNWtTMnYxSGQvb2wwQXY0?=
 =?utf-8?B?Z1IvSWs0M1ArVUZVa09zQ0RqNnVxeDNyWmdDYVhFekh5UXE2elFjWldDYUFT?=
 =?utf-8?B?bnI3S2VqWEN0V1NXMTZJdkl0dU1jNjVrdGlRVnlpSnBQZEh3VzhmT0lzSXpQ?=
 =?utf-8?B?SUp4MzlHSkV3M2R2WVdzRUo2OHFQTDFrU2JaVThuVEFLUGtOM00yTnR3K211?=
 =?utf-8?B?VzJZOEpNcGUzWVVJRDhXWUwxN25OSmVZVW5EWFhIbGhSTUlubXMwci9jWXMw?=
 =?utf-8?B?aW16aDlSWGxKSHdrNi9UQkVQK0t5NGliNzlKZVdhSWZVV01hS0g5OVFFOFk4?=
 =?utf-8?B?V2RMS1hDNkV6Rmg5dHdoL1lBV0tKMEZGcENoVW15b3NtYVBxZkRPSVBaeVlG?=
 =?utf-8?B?RnM1WCttZitOT2pEWnFkNUhkVnByUm92bVJQcGRod21JbEp5T2JGNCtnUVRZ?=
 =?utf-8?B?RUhGOTd5akdBUmE3WjRoVlBzY25pWDc5TWxURVpydlVDSGJLRWV4RE8rSjJF?=
 =?utf-8?B?Vi9LTXBVODFvQnRrY3FjU0RIUGhNNWhHSDJEb2k1WEpPNWsxQUFIVXcvNXhU?=
 =?utf-8?B?YU1HS01rU3FmcEpFT0M5R2xIZGg0TEtqaE13aXlXblBqTVYxN0VFNjZFeGhV?=
 =?utf-8?B?QXFFMndsYkFQR3EzYi91QmxMSEljZmpFblBqV1VUSzNXajJNQUNNVUlmWmpV?=
 =?utf-8?B?enJBZ0xPenVQQ3JSNnVWZzROOWtiSm5WcE42d1N0bGtEbFUvWUxSbWN4SGUw?=
 =?utf-8?B?cFdHZ05CZkZ3bTJ0QlRkeWh1cDJiNk84NzI3eS9samJ0Mlc1Z011UFFPL0dZ?=
 =?utf-8?B?Z3Z2Mzh4TitPY2duc1kvUUQySmVGb2JTb0NPQlZyYUxmZXdNbkRLTDQyTlRv?=
 =?utf-8?B?Q2hma2xwUElpWEQ4Yk1KY0s0K3pZdlJ3bjZaeTV1OS94dkcrV3I4dHd3UU90?=
 =?utf-8?B?a3BHcFpCdmFOSGs3bG1tdlZlM3hpMXlMQVlkWSs5NzY5TFptTnZlQm00T3p6?=
 =?utf-8?B?ZWVyRGlDZjRFZzVWK1JIcXNjcTVsc0V3bkwvY1oxd1NpMFNCSlJPNTlpejRu?=
 =?utf-8?B?Mm1kSS9xYW5idE91K0hDMUFCVVozWGxuRVl0K2dpOGhnckM1ZjE3T3ROSk1T?=
 =?utf-8?B?bitPbEtPMTNwQXVETm81a1JRWWVBaWlIYlQyYXdrWUVrSGVTMEUzWlFrM1ZU?=
 =?utf-8?B?VUdsQmNFOFVnbDB6YlM4MkdBMGFIUHJKbEVYRG9pOUo0emlabzlNK2NReG1I?=
 =?utf-8?B?K0pnZExhQWRkb1lLblZZQUVBajZRYldOZ2F6cWs5Z2pucW1JRWVMRlEyRVk4?=
 =?utf-8?B?V2FmUENOUXFPWkx2cUwwb3NPWUsvK3d1SUtseEszTHdXZmZtU1JpeVVDUmZs?=
 =?utf-8?Q?ecSHDw56rYcifixrzedhT6sNCSJXGFwzE8WUI?=
X-Exchange-RoutingPolicyChecked: Cn+BlRcyfsCAJZmCTuWLuDebp3Rr+46x4u/iFWSqHWdzp+HHuVnoCx5mIolrlCpQY4DDr8Jayk3rN4Qa0xJMViL2pesN3O7BA3Dz39ilBVDxjtswbCZ85dofb1YZXiBCUCC8DfEP83gU8IoN8MB0Gqq+7+3Y75GLQHY4T9Ycoz4ZtiRddgoQsvkCWgqbnyJmsn53ADHh1BO5ouorOb1nv1kbDhsC4oPoaGs7bUndtQ5uy6pz8BLc1kXOuk0/lOxaQd0KU+9xHZ56QMKDi65rzNi0WW1JGgsz1F7f4Ssq6PjQvFYf7N/DuKAmB7yqsSQG1v1I0fCoNUsH+UyTRtdvUQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dd293b9-592d-43d8-9e9a-08df041ff87e
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 09:45:47.3040 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d/YkH/WfEhxERIy0/sBQ14cG4jU6fOyZ+8lYCCIU7SgKpz8Ioe87LkECxZLFDEqRFD+NZN6GXsf1BryU4HZuD+ShEhqgGCqM6GPFWEH2DGc=
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
> In joiner mode, secondary cursor commits may still be running
> even when the primary cursor commit is done. Walking the secondary
> pipes also requires holding the secondary planes modeset locks.
> Add intel_cursor_lock_joined_planes() to acquire modeset locks
> for all secondary cursor planes. Check all joined cursor commit
> status before taking the fast path. If any commit is still pending,
> fallback to slow path.
> 
> v2: Use intel_crtc_joined_pipe_mask(). [Ville]
> v3: Lock secondary cursor CRTCs and planes. [sashiko]
> v4: Iterate the full joined mask uniformly in both helpers, no
>      primary special-case.
>      Move the parameter-change check above the lock acquisition so
>      we don't grab secondary locks just to fall to slow path. [Chaitanya]
> v5: Remove extra header declerartion. [Chaitanya]

declaration.

Other than that, LGTM

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

P.S. Please add version prefix while sending out the patches.

> 
> Assisted-by: Claude:claude-sonnet-4.6
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_cursor.c | 68 ++++++++++++++++++---
>   1 file changed, 59 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
> index 0673f16f6fd0..bc1e58d5c4c5 100644
> --- a/drivers/gpu/drm/i915/display/intel_cursor.c
> +++ b/drivers/gpu/drm/i915/display/intel_cursor.c
> @@ -796,6 +796,50 @@ void intel_cursor_unpin_work(struct kthread_work *base)
>   	intel_plane_destroy_state(&plane->base, &plane_state->uapi);
>   }
>   
> +static int intel_cursor_lock_joined_planes(struct intel_display *display,
> +					   const struct intel_crtc_state *crtc_state,
> +					   struct drm_modeset_acquire_ctx *ctx)
> +{
> +	struct intel_crtc *pipe_crtc;
> +	int ret;
> +
> +	for_each_intel_crtc_in_pipe_mask(display, pipe_crtc,
> +					 intel_crtc_joined_pipe_mask(crtc_state)) {
> +		struct intel_plane *pipe_plane =
> +			intel_crtc_get_plane(pipe_crtc, PLANE_CURSOR);
> +
> +		ret = drm_modeset_lock(&pipe_crtc->base.mutex, ctx);
> +		if (ret)
> +			return ret;
> +
> +		ret = drm_modeset_lock(&pipe_plane->base.mutex, ctx);
> +		if (ret)
> +			return ret;
> +	}
> +	return 0;
> +}
> +
> +static bool
> +intel_cursor_joiner_commits_idle(struct intel_display *display,
> +				 const struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_crtc *pipe_crtc;
> +
> +	for_each_intel_crtc_in_pipe_mask(display, pipe_crtc,
> +					 intel_crtc_joined_pipe_mask(crtc_state)) {
> +		struct intel_plane *pipe_plane =
> +			intel_crtc_get_plane(pipe_crtc, PLANE_CURSOR);
> +		struct intel_plane_state *pipe_plane_state =
> +			to_intel_plane_state(pipe_plane->base.state);
> +
> +		if (pipe_plane_state->uapi.commit &&
> +		    !try_wait_for_completion(&pipe_plane_state->uapi.commit->hw_done))
> +			return false;
> +	}
> +
> +	return true;
> +}
> +
>   static int
>   intel_legacy_cursor_update(struct drm_plane *_plane,
>   			   struct drm_crtc *_crtc,
> @@ -833,15 +877,6 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
>   	    crtc_state->joiner_pipes)
>   		goto slow;
>   
> -	/*
> -	 * Don't do an async update if there is an outstanding commit modifying
> -	 * the plane.  This prevents our async update's changes from getting
> -	 * overridden by a previous synchronous update's state.
> -	 */
> -	if (old_plane_state->uapi.commit &&
> -	    !try_wait_for_completion(&old_plane_state->uapi.commit->hw_done))
> -		goto slow;
> -
>   	/*
>   	 * If any parameters change that may affect watermarks,
>   	 * take the slowpath. Only changing fb or position should be
> @@ -855,6 +890,21 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
>   	    !old_plane_state->uapi.fb != !fb)
>   		goto slow;
>   
> +	ret = intel_cursor_lock_joined_planes(display, crtc_state, ctx);
> +	if (ret == -EDEADLK)
> +		return ret;
> +	if (ret)
> +		goto slow;
> +
> +	/*
> +	 * Don't do an async update if there is an outstanding commit modifying
> +	 * any of the joined cursor planes. This prevents our async update's
> +	 * changes from getting overridden by a previous synchronous update's
> +	 * state.
> +	 */
> +	if (!intel_cursor_joiner_commits_idle(display, crtc_state))
> +		goto slow;
> +
>   	new_plane_state = to_intel_plane_state(intel_plane_duplicate_state(&plane->base));
>   	if (!new_plane_state)
>   		return -ENOMEM;


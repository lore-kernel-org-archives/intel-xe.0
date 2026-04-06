Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CDCFFB5164
	for <intel-xe@archiver.kernel.org>; Mon,  6 Apr 2026 20:49:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EAC410E2A6;
	Mon,  6 Apr 2026 20:49:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KzmZV+5u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C112D10E2A1
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Apr 2026 20:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775508595; x=1807044595;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=3OlKeKCGHgW+s9yhtHixh4UtmxrBPluDsEeW3Ax9rBo=;
 b=KzmZV+5uKMI0Rr0mZX20d0r4v0rbqxuKsIEO7BBuWLyrxtg5FLnaQS3s
 5H09Pz86Mz6D+nUViMI6lKBu3ybF9pZQy9VNka381XYacgKHMhi7HML2R
 IvhmXBJdIBt52T4Qe0BwMKCH+BvR3tEs4wdwovPUBHaiPqlmgpD7MH9ZY
 QJNbRgtHklTJWAY1eO3AkfpP6epAZhCMQKCMVInATqyX6qmUTorarvHxR
 4fW1EI6wLvkEh2ggk+NTfLJvAav7LSppBAaSgA+HJS4mg56xRdN2Ne0OJ
 kUPh2GS+xgzRcHtv7UxxC3FAxe0Dz47RsOZVXRmeW3TYQ/dHP294E1CUU w==;
X-CSE-ConnectionGUID: /c4nFQfoQECvaI/Ycwk1/g==
X-CSE-MsgGUID: 2jaboXv2Sxyl/Am5FkhMNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="86755231"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="86755231"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 13:49:55 -0700
X-CSE-ConnectionGUID: WZYcEhlrSD+wtmF5j1pgrQ==
X-CSE-MsgGUID: 21h8szsQSeayny+9ecrvcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="251240826"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 13:49:54 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 13:49:53 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 6 Apr 2026 13:49:53 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.42) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 13:49:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mukObmtEDVRYEEOc8IxfY5JdG6MsEVG9uhpzRtjZ0Gj64Hvm/4n13Hq4RcSsNT84WDQDXpgBySZGT4PuyOOZQa+Rq2GXbfe6MzutJQggQKhbDIVy/waC+KFCkwxOrLmTgkrSVJKDChgRX8mNyH0UJLftSaOa0kj94HrUid/ci1ksnIaVp8qS2gsVSCwlgEB5gAG/K8IoE1z9W1/7SsNrx00crJ15mlHE6i0nKw7pD7IYDTnoBr82JZBiwq/L3FprtmWYbAVSz4YLyu/Y6Cetj/4Tn22koZxy9ByZPxgxxPtMo8wV5KMpVmgtMvALZo/AcWpT3GSBUvmKzifO2NWYHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8hoDxvYeG63ByhMVvc/PSzXxEz+Wfuuyy9lWVrdDmuc=;
 b=EmZ9HlTTChEeU07BTzz9AQ+Px2uNsIRHcALCxE44m19eQt7x0btY+BjaWIRIgDOxA4dZUIaXtcuxX6wlCvqyHACl1HgwMVd0NQmspmlDhPvVFa3PBBFCVRKBqs6cpznduzurAM5B3qAqmmu5q9+v00F061PcnVPuO4nT1thtjD/U92HsHIPpd/nOIqQ1afUojx1tVEQQnEKZH3oLW73UjoXsOfvPDgSf1DRUAtD4j7L6qVObwQV72TfEz8o4G5pj9faPlzxxV86m5rbKKKhcBSBwe5S3bGFXVMb7/46RfkT83ISMMVipz6PtLFsD7aW88s3T+WTxXk+Hd7JclJ/qnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH7PR11MB6545.namprd11.prod.outlook.com (2603:10b6:510:213::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Mon, 6 Apr
 2026 20:49:51 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9769.016; Mon, 6 Apr 2026
 20:49:51 +0000
Message-ID: <41877ec9-b20f-4f2d-b03f-760856f5654f@intel.com>
Date: Mon, 6 Apr 2026 13:49:48 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] drm/xe/guc: Recommend GuC v70.60.0 for BMG, LNL, PTL
To: Julia Filipchuk <julia.filipchuk@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260402224819.405728-9-julia.filipchuk@intel.com>
 <20260402224819.405728-13-julia.filipchuk@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260402224819.405728-13-julia.filipchuk@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR04CA0023.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::33) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH7PR11MB6545:EE_
X-MS-Office365-Filtering-Correlation-Id: 4973d6a8-7946-4978-a038-08de941e0c52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: /E7a/DeC78BjiCpj9eY2liCTtw8DlbrqcmaWZBzV9rFgUfXxDTuW4c1XU/o+vhGsHGinGEQszaLhmETUuTuwmBXQlQyBQ7MiNDZ9zXGLZkUIiHZJ4NoT3dCWoBb10YLUWzE5iaKRtC9W8Yh+mewFPYQTknEgY766/TOiMYSC/ATYluln/xeDqgI44I52nD2U5doFCPSviUTMhyx19UXCxyi9oGxxL7TUnduoBAd+vsE5GBi39tQd1Zfe7TU/m3DFZqUOm2n4xpqc/gpSddVmqqBQWQVfSpvD+ESpqxlIAt4Ow32Z2PxUOUVC7Td3GLJB7c9FdTvEOpDw6GdxfZsSa5WPfelZA/A3lwNGBaUsCuOakElrtGfJwi/113BOkTrdyCwZO9HGN9DmKp2/pn9iLgWTupC/bMeiY5PEtdqcWKRFSMKg4rwLncn5dpoox60MMjVekyQpHLukJiJg2VeYAA3arxQ+rinK+Y7Xw09A2MfXjUlG6toMd352do9Jl5qcG1QNTKKklk29pDZnDBnznrQCVP6xwb+swpmlJays/fy8OgWBT1M4c0yogGoC9rjCZnPkqxWh/iP3RUdmA1z0ysX12aUQNTgvYqAf0O0Kz4ULYH+IOb/SvmqJK2BbHcitoAsTKQl6jTxx0aFx7U3kOSximxzP2tn75Vo/TztFqY6Ud+lXDWl0LmmGtZ9eWx6rKXAMR3cNoKj+xkBsD6t3Na5FjgwnW0H56Lawgj89jkc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHhhbkdadE84NExLWUNLVTYwaDI5Tll2VGY3UVhoS2tGMmpNNzdjQjNrby9Q?=
 =?utf-8?B?QlN5a3lpTDZuNU94bDQyb1NBY3I1OTIrdGwyLzNpdXhDU3lLQnVEWWR1UXZF?=
 =?utf-8?B?ZkdhTzNrMXhDQVZ5Zlo5TWJxbFdEcllabHlHdm5MM2lqUjBNUWVtUTVRMjV6?=
 =?utf-8?B?ZkN4NEhBYVgzK0xpazQzMlNwZjZZMUhyS0JOYVoxdzk2WTZwYmVPZTBDdDZH?=
 =?utf-8?B?d0V1VXJyb29MOUdmbjZaMDZ2dTZlN25QR0JFb0szSjFNeC9JbDFFQUJoZnhR?=
 =?utf-8?B?Skptd1FWS2JKTDZEKzFYNHdYTjJ3YlhxK0NBYzMxemF0SVNvTUpTOWVuL25G?=
 =?utf-8?B?b0JIdkN2ZHpkd3JDekZvYnlEK0F2b3lNTXFYNElyV3p4b0Y0QzlHeGpHWjFo?=
 =?utf-8?B?UGhaRzh3SW5OcW83djBkUURsemlpak1DT01wK1pKRkNBbWE3dTZSbkx4a3Jq?=
 =?utf-8?B?aGkwa2FwWTlpd2xCREcrc3FOcnhsQ2lsQklZYU1EMGgvcXdKWlZTMXRVdzc1?=
 =?utf-8?B?bWEzRURKdFAxZjQxcHc0U0R3Rjg0M05mM3RmR0VtS3pHeUZabnU1R2NzdGNR?=
 =?utf-8?B?a3k2UUZnV0hSUUxYQjhmOERiTU8yNmQzdTAzMUZjZkFhMktUTjRMdWJSR2pC?=
 =?utf-8?B?RERmMzVCd2ZZdUFkS0RYRVV1bFVpZmdyOEpTZnlxYUNGdGo2MndWS1U5S1Ur?=
 =?utf-8?B?UnowbkgxZnVMK0V6dWpoNjh3OVpCdkMveUVGVzhGSytIY3Q3WmtQY01CME52?=
 =?utf-8?B?MmZhQm8wLytKb0NlYTl0VDVpSWdEWUVCcC9UNHFrTE92MzJrbmZHMmZ6dUE0?=
 =?utf-8?B?MzZ3RXlxcDZYYUp5Mk8ySUpRQ0NTWmtJQUhVcnlqelQyVHNIUlRZYUZkOTBE?=
 =?utf-8?B?bXVXR3BTYytqQVpsUGhkL2hGa1lDSFBXaWE2MVdhM2ttT0x1SkhJbkg4Y1JQ?=
 =?utf-8?B?eVlmWGorUXJ1NVJzSVg0TTlVUldpVys2WXlyWm1HWklsUTFDVGh2M1FqQjJx?=
 =?utf-8?B?Vy84WUpLemZtZ2VBdHppY2RTYjgzbFowdXFVdVhlTUpHSlJWai9VNzh3eGd5?=
 =?utf-8?B?T2FBdXQyWnVaYUpBSXBuN05ydTNmaFZMQnk2MG1zNTF2WVJ3d0hPNzF6eGhR?=
 =?utf-8?B?RmFheSt0Z3ppK0xqZWxtMFBoMVRxTUNOeGtXZmRlUFliRElNZkpsZW1jVUpB?=
 =?utf-8?B?b2lOVm9JVFBod2RyUGgxbnRmN2Q2NDlXTzEwaFYrcmx5ejlGMVVoUU0xLzlN?=
 =?utf-8?B?VWdYcnhVZW1CT01LOVd6c2ZJMzQwcHpaOHlnL052UUxhSUlURk5xRVNEM2tQ?=
 =?utf-8?B?bWhoZmJuTzd0aWZYa0dTeTdnRDc5NmwwYmU1eGZoaTg2L0J2SmhQWE5BTlZB?=
 =?utf-8?B?VW5FcXdKWW83Q1VsTUdpajRDcDdKZE83WDlsZERPUFp5SS9YK0g2VTlzdDdy?=
 =?utf-8?B?aTRqcWxPZm1taTFXVndIejYyaGtCajZ0VFNkZ2Z4WitIRVMxMnZRRVl2cGJU?=
 =?utf-8?B?WUVMTE52amYxSWJWdDBrWEZLeW5Tcld6enpGUFlDRnZpUVVqaUwzQTNEU1Bp?=
 =?utf-8?B?VVAzdnYvRWZxRnZMdTd1dmZoeUpzYk5Kem5udWJCV0xmd0w5L044Qkk3S05o?=
 =?utf-8?B?NkdnaTdaZDBnRkF5RXRudUh3WERldEwzVEhIM2k3c0IrVnZvdVVvdGV5dVRa?=
 =?utf-8?B?SHFSTjBuL0N4RDl2aThySmNQV3h0R0VRallhRVZIS05PYVkva3JQcjVqSi9z?=
 =?utf-8?B?WjQrb1hBbFUveGZiQWVZK1VzV0Z1Q0d4ekc5SGNqQmU3eStQNGtvQmdBR1U2?=
 =?utf-8?B?VGVnSUJocUhHcWNnTS9wOC9BTEpDUVQxUVkxRVRHRVAycnlBYUxKYjZ5aXg1?=
 =?utf-8?B?bG1xeUZwZkZDd0xlQnpYVnF0d1l6MkdxY29uVVBwd2JaS1BFSVpTNzc5d2lB?=
 =?utf-8?B?T24yaWRyZTRGT2JmVlJXZDl0YWR6cTBia3ZYMkVnd2VoQXpxNWF5RGk1Y0hy?=
 =?utf-8?B?NVBFRmROeWhZN1pPdVlPQlpjVDYvdmhPNmNITkdVdENpN0VMcDFxNlBZV1FC?=
 =?utf-8?B?QXk5bG1HUHQ2KzhPZy9LN0ZIK3orL3I1WVVWQzg1aTNVWVRCL0tlM0RtY29C?=
 =?utf-8?B?VWM5d3U4WGpsMkhkTmFVOTM2M0xHditGd0JQSjFNa3RUeUIvNUh0OGxSWitX?=
 =?utf-8?B?VFc3emlkSXZtODcrVVlEZmFlT04wVmdzNWx4dGFwK3VEWE8vY1Q3Qzgyay9V?=
 =?utf-8?B?M0s0Nmd2Vllmd1hxSWc4Vno5WHRUcnFTS0R2allocVhNMlhuSWI5L0x6WjhQ?=
 =?utf-8?B?UDkrYUt6UDh1VXo4VmJ4M3BwRnpDakFBTkRFaDNsVy9jZzdlckJRbHFnWFBw?=
 =?utf-8?Q?0KSwyA6jYuZonTSg=3D?=
X-Exchange-RoutingPolicyChecked: bKNtbsddMrWXrgts7Jd+FR6baSDF7/7ZeXzzc7L6dysBRzVqChCjfX2Ac/Mmf2/JiovH6yyZqsysPQjx/fzoYkBW1DhtZjWscfd33EGZaKm1us+S8haSFxnTkizNyzshZze9ecZ2NYa+p6WB/cy+1x9iXjUWtVrVaiF1tU5Lrp9w7lRqG6BxeVv+IYYcKBHjIRLvOqtLXGVbta7+eB8j5OEv938D2luIntqLqE1QidK8pmfy9hToMGgxb5QHWAVn/WFcE5J0rW6vPCNbBibmUW4S/9dUDQUhURGO22q6P1cagp9x/1RBxYLLPzzHzoc4Nb/0nm3EbZoWlWmfz31KqA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4973d6a8-7946-4978-a038-08de941e0c52
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 20:49:51.0959 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J5tfDrypgPBHentVlI3NWCITRJnaPOL6WjlEsK04CgNJxtZ3w50BOnA9hKBbnZWd2omctVgvSSdwYMhzCuF0ZWaRRCnU4N+qI7OdSPsgBP0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6545
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



On 4/2/2026 3:47 PM, Julia Filipchuk wrote:
> UAPI compatibility version 1.31.0
>
> Update recommended GuC version for BMG, LNL, PTL.
>
> Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/xe/xe_uc_fw.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index 498c89452779..eeca044d3aed 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -115,9 +115,9 @@ struct fw_blobs_by_type {
>   #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
>   
>   #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
> -	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 54, 0))	\
> -	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 54, 0))	\
> -	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 53, 0))	\
> +	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 60, 0))	\
> +	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 60, 0))	\
> +	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 60, 0))	\
>   	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	mtl,	70, 53, 0))	\
>   	fw_def(PVC,		GT_TYPE_ANY,	mmp_ver(xe,	guc,	pvc,	70, 44, 1))	\
>   	fw_def(DG2,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg2,	70, 53, 0))	\


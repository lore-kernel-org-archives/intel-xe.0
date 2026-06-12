Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2900CD98CE
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 21:46:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6109710E110;
	Fri, 12 Jun 2026 21:46:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="imvjLkH4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 777A210E110
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jun 2026 21:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781300764; x=1812836764;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=T0UUNtJ90zRZUBp8dRUNjT2Sorm2QfBIgydE8od2+Ys=;
 b=imvjLkH4HhcfSI+iIMCM1b3/DTZlHwitfoR8DPZ6lh9zeT9cGLKvyszV
 5fXCMD1L1OXdSVaZUV2zC01iZTlsifm7p4AXCkyX26fVChfa8daoWsjLc
 AdC0zunuxcONjPMO0yvOfkDgC7dnqTa3VkCZu+0gJFLtnApwZTg4589H+
 Vd4KCmjJdOu5uqy0Kc1tXmgwC5EYAe7ITarZ0M0jGY+y6DJPqJKD8M7ZN
 /8EFW6t432mUr1ZeLa8iblCnu1J6Dd7TtHXo8nc9h23g9UrENu628zLpP
 FDnNk1TsrDQHvOvOaXOmtwS+tg7oDuv3hEp8VWRi4wbqH6C47aPmYC3di w==;
X-CSE-ConnectionGUID: pXM1DrN1TxydVxOJCvL+Cg==
X-CSE-MsgGUID: OvLbMxWoTKuTU1PA+3Q+/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="81155270"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; d="scan'208";a="81155270"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 14:46:04 -0700
X-CSE-ConnectionGUID: hJyLMgB1S0uhNVfmVVg9UQ==
X-CSE-MsgGUID: ccZA1odDRSag6WHzrzuhIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; d="scan'208";a="246800004"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 14:46:04 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 14:46:03 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 12 Jun 2026 14:46:03 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.42) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 14:46:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hsbyBsKF3kZFuZkRyuGiEdrZQLcDD4g6IBxaN8ang1GMBoY+1epiPSsXWCnZFg0ALerOi0zpHXKEQkhzLerHstBlMcmZJVzqLVuCSy9K8zIsMrX2CT6/fGEV2pf3cDpXaQJb48cGezFNmVEJWdLRH1swdyBdIFFxoQwISyUp3Nt87F6lwIk8ghIKhnOtslPcrpviTU9lQi5GHLJnnuiEIOmkhcItAq/7WrKt6vaWyb/4ysOyDvcHESY2+83g4KbnfN2Ct52XvSYLs0vz03guhwGbMtDjwjP43fsSdhcsWmK3KY0mXTVk9ONVkgennEh1WSot8GRznD2oHjisk88gDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gVYXxoiA2IPffgxZauh+nC3pLbcbfPaZpsu85+6kCRw=;
 b=ilkN6QD0Eep2Ajbjv6EIgiEFxSwW16elLajLIARQ2pDWkhaJCvXtLGd7d0e55L7iYazZOHb6z3Z4E6e8kg77gsdYILAL26JwgqisatCn0D78WpZKf1xEXRiLE90qR+I1ZZKuaCYnNhn1v9jUgr5xEo/LVtGLltLTGl1eJWQWWnOwLTts9DxWAJfuJjgV6/bpdy2bjLR5ijKVNuhmpT/0n2Pda1h90ZWbkQ7M0pEaP4qxaL3iv2yulajSIp+8RWWWRaIvMwW4UL1/y5L8RYACYZrXYUUqiD/y++Uxzae0JSIWiwh7X3yZ1eK80FxRCKiQ3zBTiPd7n4XqSZEOmcAVhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CY8PR11MB7290.namprd11.prod.outlook.com (2603:10b6:930:9a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Fri, 12 Jun
 2026 21:46:00 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 21:46:00 +0000
Date: Fri, 12 Jun 2026 14:45:58 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 9/9] drm/xe/rtp: Ensure locking/ref counting for OA
 whitelists
Message-ID: <aix+Fs+LzT215Ih4@soc-5CG1426VCC.clients.intel.com>
References: <20260608223624.3711760-1-ashutosh.dixit@intel.com>
 <20260608223624.3711760-10-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260608223624.3711760-10-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0348.namprd03.prod.outlook.com
 (2603:10b6:303:dc::23) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CY8PR11MB7290:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ccf2011-d3d5-46a2-a408-08dec8cbfe0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 9hmDmvejJ/vl0Y0LQqXTS2rgDcBhzqktdzKOOe7Zpiqfm1uSIMHenaGj6nxt+4BGkKDszrYwTzVXUoPnlF//QsD1vxeWlVL7oKasp7UcewHk+70T1hN+xU1JZBsW/XwpU0xVtbl2CUetLaYeeXC2ojCOr6XdyPVvNQqKeZhB8byhsk4hGwwxDFs2firJ0JY0YT7h26/M30gveNVQsKynCAvz7FIhddKGgyxSTIUNsjth69Yl9VkUiy2R5bPWzOhQ9hj+mMgqDht3tG1wB8Fi8ZV6PmmAKciX8AAbFQlqD010StT2x3dDJJqR4HXz1b0t0gN0FJKcyuybmCIoLGeAzM5iovr/kmBd87DEYj1tPaP1xfdIAonjwho6PArK3IxdJIqkZJGLdUdh4DiPSB+Wl2YZPSvulkpzrGT3pmxxLC1XBNToHPDyBZEm495GPJFgN4qziTrjnYnp7I7Tu0CFJX2syMrS3kQpuQM/RlucAjTaBLdajMiW2r//YXbDs1X6KsbtMSB8LGwVv3DJVn28Csv3a3PY/GGJQY7hrrUQyf2nzUTpGhCiiriFDOO5mnM0qez2xtBvcKZrr4v1+7of/IvisEoidaFGoJyTzkbG0rQr7CVo4r2TAV7ueaKuJVGuAMCVbD/adgBuy11Ttq8QABW6OTXO7SCc2b6YnSVwXnb+uNtAh1g9nnFrPyZ8PPgr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGkxMEl4R0dOUWEvdy9JSG1jM0hZWTV5amxQaktqcm4xUWRabjhiZkNIMDRB?=
 =?utf-8?B?MUd2a0I4eWxZUlNCcm9QZ2YrUTRncTlaV1N3Tzg3SEF1QjE3WVllejhhN2xr?=
 =?utf-8?B?djdVS2NEUWY3MFZ5eU53Sm1zOFltSGpLdUVNVjFyU3dKSVJlN2ptU1ZISTlR?=
 =?utf-8?B?OHF5N0xqQVVlTkVxcGk2M1RycW9JVmhKUFpOVHJEd3kxUnNMOURGd3RCdG9v?=
 =?utf-8?B?S3YxMzg3dFZqbzFMcHcyVEZvSkJvakdkdStNUGhnR01ESE5KdGVuZitTS1Fp?=
 =?utf-8?B?bGdWLzZmbGQwOFN0ZkF6ek9idTIrSjBueGV6T2pTOWd2WDBJWUUvT3d5ZjZJ?=
 =?utf-8?B?Tll5NDNaeGJLWGNxVWZCZmRIWTJIUjZZWTlrWHR1L01iMHFZbytHTkJDZE8y?=
 =?utf-8?B?ZTlzZVhIZDJQd093UjhJZjRFKzkvclhsSmMrdjhLTk5EZjBvdkFueHhyNkcy?=
 =?utf-8?B?S2xQRDcxQ05HTWQyc2dKaCtLWXMzSUo5bUVVNnRQSSt5N2FmUkFtWjlDVUtX?=
 =?utf-8?B?K212VlNCUWR5TGNSNVlzeWJJQ3FMNjF5SzZSeE8rMkFqbmFjRVFoT1JNejBE?=
 =?utf-8?B?Ly92c2NLczFFblp4b01pTVphM0hoZkl2NFdxMTNHbFFiSUhMaGg0MFdrU1ht?=
 =?utf-8?B?Smg0NzBJbEx2em1DTUE0TkwyWHFuV0NZRG9MVm9iTzRlNWdjakhxT25ubldt?=
 =?utf-8?B?UXpIeWd5WXZXVDExcU03UndKeVZwT3NIenJGMWZoWTlrQyt0Wi9Bc1ZEODk3?=
 =?utf-8?B?dllYcFdQOWFMdDZsNDJCcUtMNVJjQXFDZUVTWld0VGVKVXZTdXJJOEpsR2VO?=
 =?utf-8?B?MDFYdFJzTnNXU2hoTjIrNE9NQ1FHSFhVQ1kyTzFuQi8ySUxZVWg2MEFPK3BT?=
 =?utf-8?B?ZzIrYjdSTDJEUzBjSTN3aHpNV0MxZEkxelNHOVhqSVRsUEZBeVhNdlh6NlpP?=
 =?utf-8?B?MzhNd0RHTW5aZ2UwNis5eW9UenpqakttM0FwRXgva3ByVVByZURHZ2ZTdmZR?=
 =?utf-8?B?b0NvOFhHTVZuUXpXVzk1ZzhWc1NSZVhncXhWYys2R3FMSFg0b3U1dVRVWVdD?=
 =?utf-8?B?K29UemJ0d0UvK28vTUhLVExnaEtHdHFDd0tUa3pjWnExdTN2Sld0MDhGVGZO?=
 =?utf-8?B?WHJvYUNZWXhXdktyb1FoOVBTaXVTRTAzSmFYTUJJc2ZjREdRNGFWcG53cnRJ?=
 =?utf-8?B?eXdCVzNGbmpPZnQxUFdPUlkwd2FPcTd1eDFDMGE5RnZ0cnR0YlllUGJ6a0d5?=
 =?utf-8?B?SUJtd0xPWDNMdTFwYThrazhDWW1Cdk1kSHBiV3VzVm5hNlYxS21WZHhzTmY3?=
 =?utf-8?B?cHFKc2l2WmwwMTJxKzFpODlKelMwUm9CSE9FeVliTTh5OWtsc0pNbW4zYjd3?=
 =?utf-8?B?UzBsQ3YvYTQ0MklsN1lOWVhZa3RPLzFBNmdBZHhCakU5Y0NxRU9uUmZpNytq?=
 =?utf-8?B?MWNIdExNMDBuNnI1dnlZS3hDcy9KSDJFRnE2VTROdUt6NklEdlZQWVQyNjRZ?=
 =?utf-8?B?RFc2blVMK2R0bmIyNW1XTytPdmJBY2VScWlyNTNEOVFONC9PdlRaSkZyNlN0?=
 =?utf-8?B?dkFKNWd5ZnJUUTZteEVMMHh6aEJ2V2x3WUJVV3BnQTc4WXFYV3RZUWVJd280?=
 =?utf-8?B?dUpBamlqcURxbVhtM3hkOEpnbnA5d0ZpQWQ4ZTdrVW1kRGNveFFvMTZ4MzZ2?=
 =?utf-8?B?T01WSER0cTVMQ1AxbmFCc2grR1BHWW1pVVFYRkRRc2MyQ25kNFRUVmZ6bTlq?=
 =?utf-8?B?ZkorWXdJZkMyYjlsaXFjRERCaG5sM1dKbzA4clhpS0hnR2YvRXo3YU0ycktt?=
 =?utf-8?B?M2tsd0lXRmFUcHdFYnJCckxxZ2lCUzV2RWorZDc5YnNhYlpXQVoxbDN4TFJy?=
 =?utf-8?B?T0thSWpWcENObFNXcVF0b1BRRCtWVk03OFFia2ZQaHpoM2xiVHBRbnZidzJO?=
 =?utf-8?B?VFFCSzhBYmwrU29zU29RamdWT20rdGlPUlVndnhJTVJ6cE5LSnFqSEdHVGxR?=
 =?utf-8?B?Q1lBMy9ZTHZmYU5MMG5XRTg3MXdjMWNtaWowa0hzMHQ3R1YrWFpPZkNQcEw0?=
 =?utf-8?B?cjdOR0VrcnhteDRkN012U1Q4VkhPbzJNWC9mcTE2VXRsT2NHVDNWeWorUjh4?=
 =?utf-8?B?MkpZYllpV2hkNXpkaHErOTd3eTRVZmtDMDdVdDFtMWdWNTkwOFl1amFxZ2V3?=
 =?utf-8?B?ZVo1dkxybjlaMzdGdFRpWjh3QWpvbmQ2M0Z4N2pCSUdqZmFxcjk5b2JjN0Vo?=
 =?utf-8?B?dm0yV2tZNysxbC9US0duaTVkMjNXek9jYUREUmU2YStUQ0x4N3k0dXJlT3Fs?=
 =?utf-8?B?a0hpZzFqMjcwd1pKTzQ0NmVvZUNxaGtOQXpocEw2N2hKWHpOcHdWdEdBVkFs?=
 =?utf-8?Q?hHktNI6zUUqM3YFU=3D?=
X-Exchange-RoutingPolicyChecked: tJgLVJoyoHcaJCi+iPFOyra9NfTNfksnMcYTFngCQRlwbX1RYFvYS0riXpHuDQ0dnp6Qd/v8pSm7o8S4W5QU91i+fWAKGv61Lcl5wlugcJiCDdC1TwCFRGFIijG3KJMptC9YEVSxpJdfpvwhPmqq3IohGIkdVgHarSvRLLSNEM7vvaGpwebKLtGJDYtl2X/bVy4J7stgGwgC9BFI8upIA0sg9ohtxFaUoAxhVDfirokpT/BVmLx2jGLQXtnLUhn3tUUukK+PUrR5/U9MwWtaTAbi9Vkzi0WHCU3YyYpu//SaVmsDg+p9ZKsjyEHigT7vSA2NvgQJEQX/YyxYhZjkcg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ccf2011-d3d5-46a2-a408-08dec8cbfe0e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 21:46:00.0442 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mQAhSLC0hhX9nAUBqpV3AShfQ2c7ktK1Q/IPJzCUFN4797sMiTkIpO99hp4JChkNUSlof5aluZpDTYOxNdRfhLS0dK5VZCqVdB2UracQsI8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7290
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

On Mon, Jun 08, 2026 at 03:36:24PM -0700, Ashutosh Dixit wrote:
>Since multiple OA streams might be open in parallel on a gt, ensure that
>proper locking is in place. Also ensure that OA registers are whitelisted
>when the first OA stream is open and de-whitelisted after the last OA
>stream is closed.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> drivers/gpu/drm/xe/xe_oa_types.h      | 3 +++
> drivers/gpu/drm/xe/xe_reg_whitelist.c | 9 +++++++++
> 2 files changed, 12 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
>index 3d9ec8490899c..e876e9be92ba5 100644
>--- a/drivers/gpu/drm/xe/xe_oa_types.h
>+++ b/drivers/gpu/drm/xe/xe_oa_types.h
>@@ -126,6 +126,9 @@ struct xe_oa_gt {
>
> 	/** @oa_unit: array of oa_units */
> 	struct xe_oa_unit *oa_unit;
>+
>+	/** @whitelist_count: number of open streams for which oa registers are whitelisted */
>+	u32 whitelist_count;
> };
>
> /**
>diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>index 65971e1526d0e..7e13697425c1c 100644
>--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
>+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>@@ -256,6 +256,10 @@ void xe_reg_whitelist_oa_regs(struct xe_gt *gt)
> 	struct xe_hw_engine *hwe;
> 	enum xe_hw_engine_id id;
>
>+	lockdep_assert_held(&gt->oa.gt_lock);
>+	if (gt->oa.whitelist_count++)
>+		return;
>+
> 	for_each_hw_engine(hwe, gt, id)
> 		__whitelist_oa_regs(hwe, true);
> }
>@@ -271,6 +275,11 @@ void xe_reg_dewhitelist_oa_regs(struct xe_gt *gt)
> 	struct xe_hw_engine *hwe;
> 	enum xe_hw_engine_id id;
>
>+	lockdep_assert_held(&gt->oa.gt_lock);
>+	xe_assert(gt_to_xe(gt), gt->oa.whitelist_count);
>+	if (--gt->oa.whitelist_count)
>+		return;
>+
> 	for_each_hw_engine(hwe, gt, id)
> 		__whitelist_oa_regs(hwe, false);
> }
>-- 
>2.54.0
>

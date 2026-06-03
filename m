Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB445CD6E55
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 21:01:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AD151123B1;
	Wed,  3 Jun 2026 21:01:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YJlIEkmZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C336D1123B1
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jun 2026 21:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780520458; x=1812056458;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=eamwpJROdpUwUTLUcuM2FMdJ6GWtVD4AnMi01q2OCW0=;
 b=YJlIEkmZCTaa6xIKNNjlBB/inDTCnyiXuRIXPzMjgSOVvJtMKoIuP/88
 WmG1u5s7iKJRe9ukVxQ3FBS+4LSNpsYiyGVd/K2loiZ/C/ZgzJaAvwUii
 euS4IxkOx0oLbqcj3ewEPSLheoNy3SsYKooNvp2S45dCktnGkFOQtm9Rc
 WwnEZitr0llpBCzSiKWQFJ0bu5FQ1Bv5hat9OTY8AEOdOgJa30Xo4N7bp
 3VLsTOITHH9XVjCgVjB67aXwKLqbeO9FBv2l9Io+83VRz33BHSpaSfspf
 dGg7YRdhh36AFInZ+lghJAFwW4e4E/knIhjlrZup/A4i+BQ/MhIrEqxAA w==;
X-CSE-ConnectionGUID: 123T7wIHR4+gVAkXf/eJug==
X-CSE-MsgGUID: ZDMFS2qwSiizxH/MPvjvrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="85195894"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="85195894"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 14:00:58 -0700
X-CSE-ConnectionGUID: d+owKpyNTvyIZDbr8m1DXQ==
X-CSE-MsgGUID: ppi5aLGjQe27k74wBIDl2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="243508206"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 14:00:58 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 14:00:57 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 3 Jun 2026 14:00:57 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.12) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 14:00:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jr+LcUeOxf0kh1xTKHDJHPGLkzl+5vMRjOCfthrci2J2aNCMar7dxtCrdfdd3sxH48SsnPLlffpPfDWJy56pM75B+RaKA1KXUaepvIZx8ZgYhZeDBbmHI9xKIjiSDcAKnRdO62TSFgTBfojgl/wHVtN74AlaTQtPXTVnqLiH+VterQhFulfHV0qBnoPh70IRcF/HnqKPjP5kgqrZKEgR/w5Z0rzIwr3A3yg+K86RCs4xDMqINPpt4JJKTSzvgW1j/PmRwcD9iiquWJ5RERMEH1ZqEYey9oysy4CnUVR9AKTvMu0J0erkgBfmCbXSuuf9qbQo/TcHvC3yPdofM892Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y6aKm9DF/wsKfKN9PsWip74P7XmfIO/bT/TVf4I58aA=;
 b=t0l68yv44fMUJsUgtYiRnoIHsqd48SBYViWteCgCGufXanhSRQzsqtA6Y98tB77wWiVhONLNVh+xwfetVp67gtEry/ElYeksNWJaba2talL987M0MfOyw1pCalYPVvwknsRwsizWwtuHVHjVAOP0aTz5aTgkxCqnpo5NE9R9P1cUnk3/fLKWRVt8v6Zu9x9EE8+W2Iefsw2pSG0x/FeXTFqgPkwf2CUIcXMVrxBa0Gda2s5HQlaLm7/XomuWvAjCjyD7+lbVlxhbGhTQP1AUTrUqdHPRgz4v8QjWD/WCaXntOsHAi2HdK+b8QrsE7gRJK9WWDh3VoQ2OsCfL/mTyWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA2PR11MB4793.namprd11.prod.outlook.com (2603:10b6:806:fa::8)
 by PH7PR11MB6859.namprd11.prod.outlook.com (2603:10b6:510:1ef::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 21:00:53 +0000
Received: from SA2PR11MB4793.namprd11.prod.outlook.com
 ([fe80::6037:898c:f5e:e256]) by SA2PR11MB4793.namprd11.prod.outlook.com
 ([fe80::6037:898c:f5e:e256%6]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 21:00:53 +0000
Message-ID: <61f82f17-1f19-4604-883d-9e6fb39489db@intel.com>
Date: Wed, 3 Jun 2026 14:00:51 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/multi_queue: skip submit when primary queue is
 suspended
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260601234642.817231-2-niranjana.vishwanathapura@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260601234642.817231-2-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0P220CA0009.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::25) To SA2PR11MB4793.namprd11.prod.outlook.com
 (2603:10b6:806:fa::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR11MB4793:EE_|PH7PR11MB6859:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cc41367-1676-447e-b3a3-08dec1b3333d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: i8cnx03ZePAnQakQQxj0zV7dUC+5PDDGQPsHyh+JTU5sn0iWb/HXlvNvpAEXLX+TsOOrQ5r563lSYBh/Q3mECHJgW/d8vYtFNGCQuYSDYJhHUExrwVMnBG2/keUMOr2SuhaqBUcmDD4vyPw/uB8Z28dmE+iJ/SD+VZvTAa7D62aANoccWIB7GpzFRB+xiMT0gUXYrIU9leH/LCMeVA4lB3d4YP/SfLVKK8v6AoQjTSU0tw+Jg2H4vYG0aQV+oCwks8vblZ5ZnQD/Spw4Dw18sQ3d3McHkXwCKOIX+sBAwCyRHJ4AyZxpsmddchQNgbLzfNvvQw+7vhBmkG3FwiE8jBj/G9K99byuhM0v9oFZStny0azTPaTskulAgzPzNmdg12hjYRBeFHW5aUi8CUBIEcEcN1VYx0NafIOL9MjjviLSv9DIU8HBSa+tXPuJ5EHmBGwF2/3O8TY1/pgSLy1ojT4Jvm05fz9B8aLbGXqtRrks6Ko971j5JkDrQbKjOudG3OGtKeVGMcKkqYDyW/jdqfOqBWWle2lG/6Hy4Uc64yd0mOIksEs9WtXtSEvb1T6dBEdx3MdykjuLxtaZy91gTmVn/5IAx/h06DhukEHZZoYzkbTyRTALQd9fINzV5zfi/bmzsS4B82qgAfoEv/rlDw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4793.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VnNPZk9ObGp4MDI4aHhSOTNaRnhjOSticmZJVDdtd2h2d3NkVjA1Z21sa01H?=
 =?utf-8?B?M1Y2TkdFVlc3ZjBWQlZDYnFEd01TcVh4aThZbTc3a011QzJGak9tYkNKRjdL?=
 =?utf-8?B?eUxHaFVKMGU1SHJVSDJhL2dZcWVZRmpiYTFTeHpVNnVPRkFFcjZTclNldUIv?=
 =?utf-8?B?MGx5SzFWZ0NmNHYveGJ0SEhxWDZJM3BVQjducyt3T3VKdXI4MG9lQkdJV1Bn?=
 =?utf-8?B?cC9vRU4yQ0dPZGhVYlRIbnRVc25sbXZLb2lUVnY2VzFVVzlTRDVpVkhWSFVn?=
 =?utf-8?B?cG9qK1RGQkovK1Avb3NUd3JuRXpPYmZnLzRlUDBxRFZMbXZkRTloYS9lb1pu?=
 =?utf-8?B?UUJrZi9aakdsVXRieWJyM2grTGZKaXlUaFhhaG9nT0RKS2p1Uzk3Mm4yV2R6?=
 =?utf-8?B?eWNmR1NmUFk1VUJyVWdHUktWd2g0MHdSei9tam51SUk2OHRhakw4anJIZU9D?=
 =?utf-8?B?MG5SSlg4V0E2Y2pxWXNOTEloOGUrYUZUb3ZwcUI4SnJJVDY3MktPTkdyVFNr?=
 =?utf-8?B?WVFFek5CVUpGcWNZU2JOckdkQitoUEFYOEQvUUhYZWZ1aUcwQ2hwVkRiV2JD?=
 =?utf-8?B?SlFabjFwR2dEaTZocUtOYStwT1FZbjFDbldJTEFnOENiTDV1ZUtSbm9OOExX?=
 =?utf-8?B?NjEvYnNhNk56cW43U3UwaGRJeVh5RlNmV3ZsM2sxZTBGK2NGbDZRVFl2UzdP?=
 =?utf-8?B?THMvQnV3VnB1UVpORktqeXByRU1MVGZ5TVVITllWaHBPdUNYcStrRTkwSUtn?=
 =?utf-8?B?Wlc0OHoweHpoYXkwWmR0U2NrbEFvS3hSNUtVWHFzNy9jbGhaSXZVYnJNL2wz?=
 =?utf-8?B?UjdQMnNmWHp0TEVlWFV5V1BYamtwTjgvaFhnSm1OUWgwQTkxbnptYXpnbGF4?=
 =?utf-8?B?UmVReEQzOUZrQjEzc1FXVU83b1JHTGZLcmp5L3JjeitEZTNxTEQ0QTd2U2ZS?=
 =?utf-8?B?dmlXYTMvWWdPVkVjbEg0MmtxeUZ3WTMzTGhnVWNWNU1DTnkvejBPNmtWblNo?=
 =?utf-8?B?bzdMT0Nlc05mYzJNTWc0enRzNkE4ZWZiWDlSaC8rZkpwek5SSVA3WXZMVTdF?=
 =?utf-8?B?MEpycXRUOE8rOVNwY2ZILytNc04ydVpiMG45MFhJT2N2aGwxS1RwTno5UmUv?=
 =?utf-8?B?b0VlRWROOW04RmJ5NW5HYk9Ed2xoeDJHT3R4eWJrNVpBSGczOG0vKytvT0V6?=
 =?utf-8?B?VTlLNW9HK2tMZGkyNGNCRVhERTZGN0dkSlhmR21RYk5KYlluV0VKbm00NmJX?=
 =?utf-8?B?bHRVWjJ5dkh4U0ozV1EyTDJXcFBLbVFoWndGdER1TThzZ2JOSFBFamR0blB1?=
 =?utf-8?B?RnNkZ1NVR2p0U29wY0Z4VjUvbzhGeSsyUFFUY01ZQ25yeDRJTTBSWmEvWWM2?=
 =?utf-8?B?OFc5d1ZVV3l5RVBvMDB2ekpKNnZGNGt3SkVwTUNma0RUdmlmS2gzRitJc25Q?=
 =?utf-8?B?SFlnSnBGTytuNzM2K0dicitOSlhhUFJQWUczTVhucnpSQlJjUjdtVEpHcTBD?=
 =?utf-8?B?Zi9tT0JEcHZMdUt0dGd2VXErWjhjTG93ZFJlNFN5SHZRV2todUJoMDAxZlNN?=
 =?utf-8?B?SzRyZkk0d0wzMWxScWF6UndiSzVsejJjNkJYbk9xL05SWVp2ZDA0V28zL1Q3?=
 =?utf-8?B?eFNndUp4dHpaZCtGZ1lVMWZibXBVUEVGU2VHb0NqMjhBQ1A3WGIrNkZkaTBE?=
 =?utf-8?B?RU14V2NyQUdLSUxFdzRoVXlkS2xneVZhanFBSjhKRkhJcDNTTGZEVEJZMXdZ?=
 =?utf-8?B?UCt4NThMK2txeHJZbFBqYVFmMUFyTlNqNWl0V1hQR3hkd3d0WTViY01PNFpB?=
 =?utf-8?B?VVoyUlU5N2JmTFRSeWZvbFNtWmxFZUVKRC9tbmRGSTRxSTFSNzBLQlhxUnRH?=
 =?utf-8?B?K2F2ZGtyQThmZEpDV0puanV0KzVoRzRkc0pOTmNsSHZUQi81aWp5WWdMZDU1?=
 =?utf-8?B?N3l5dkpFUGV6SVhjenp0ZHhSeERGQ2o5Y2ltOGEvL3pHQ1p6ZjB6NS9ic0dU?=
 =?utf-8?B?WEhaMklrOVpkM0JIbk54MndtWFlLN1l5dHVsWjY3Rk5vNkJVN3VONG1GeTdE?=
 =?utf-8?B?bEVhN1NQZzNhU0RpTHdWTnlTb3VlQTd3R3ppc3ptNjM0VkhBL2F2M3BQL0xE?=
 =?utf-8?B?ZnF1djBGR2xBWWtrUVpNbG9SRE5pblhzWmRnOCtFdmxuNHJ4V2o1NEZtdVo5?=
 =?utf-8?B?c0thOE5nWGZPNHRQcUo4MzZ2N1dFdU9QdStMV1VoajFmWTVleXJCcTJkV0NS?=
 =?utf-8?B?c2JPemFPMFd6K2FSR1pZdTUxSkoyaW53V3h4QThnQmEveG5vTEhHanVpSXVP?=
 =?utf-8?B?bG0rcklDQ2VMTkQzVUR2NjZVbUtZRDlpcWlvV0JOUFhtRXhMQ3RnSFM3Tk9W?=
 =?utf-8?Q?A+5bigeEA/1I7Pfs=3D?=
X-Exchange-RoutingPolicyChecked: LPcyJnSPvKea6zEJn1KOb/7tAgcDEOYKrF3lkUDluixwPQlNqASnM1YgEW0MCcPdcb0MOXLqn7M9omFWD9C8aYRc2JN4KqCyf1LWcZ6H9g6YHrmOf8vUSZuSejKi10RoSN4sWoK+f/V8uKO/72jszdYSi5cLcFadmR4qu/MD+zGU5iFLy7dTm+49fGyfaNIcm9FMh+tcuukRvHlb3oB5rj4kQgxF6DLWl+0Q9Y1z93IZhzfg6274GZRMt8H52UgAurGqme/ytYmjJ78iFR6nZCauoQ1ibqhS0+kz4J6dhFOhJ232PDnMvNTKYk58koFQXmrfjO9Z+eLmRPTulxGpjg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cc41367-1676-447e-b3a3-08dec1b3333d
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4793.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 21:00:53.7153 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gsbQhqLcOyKKzB03my4ITi06+YaFFEbAVFE/yOsPaJRhGCRhrPQQ8agrZ4EDHpAv6f6QdiinJZyjwASOSPPHtHnHkp0yHwlrj1NnJcyKnHg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6859
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



On 6/1/2026 4:46 PM, Niranjana Vishwanathapura wrote:
> Return early in submit path when the multi-queue primary exec
> queue is suspended to avoid submitting while suspended.
>
> v2: Remove idle_skip_suspend fix as that feature is being
> reverted here https://patchwork.freedesktop.org/series/167262/
>
> Fixes: bc5775c59258 ("drm/xe/multi_queue: Add GuC interface for multi queue support")
> Cc: stable@vger.kernel.org # v7.0+
> Assisted-by: GitHub-Copilot:claude-sonnet-4.6
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_submit.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index ab501513d806..30595ecc7f92 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1167,9 +1167,12 @@ static void submit_exec_queue(struct xe_exec_queue *q, struct xe_sched_job *job)
>   
>   	/*
>   	 * All queues in a multi-queue group will use the primary queue
> -	 * of the group to interface with GuC.
> +	 * of the group to interface with GuC. If primay is suspended,
> +	 * just return. Jobs will get scheduled once primary is resumed.
>   	 */
>   	q = xe_exec_queue_multi_queue_primary(q);
> +	if (exec_queue_suspended(q))
> +		return;

I'm not an expert with the suspend/resume flow so this might be a dumb 
question, but in __guc_exec_queue_process_msg_resume the jobs are only 
re-scheduled if !exec_queue_enabled(q), so is it possible that this job 
will just be lost if exec_queue_enabled() is true in that check? It 
seems weird for a queue to be suspended and enabled at the same time, 
but if that check is there I assume it is a possible scenario.

Daniele

>   
>   	if (!exec_queue_enabled(q) && !exec_queue_suspended(q)) {
>   		action[len++] = XE_GUC_ACTION_SCHED_CONTEXT_MODE_SET;


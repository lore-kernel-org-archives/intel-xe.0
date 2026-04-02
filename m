Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E73D39417
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 11:24:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EE3E10E416;
	Thu,  2 Apr 2026 11:24:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Aatpa/bJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 115BC10E416
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 11:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775129049; x=1806665049;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=8p7+xQKi4MHDAFD/uB827/krUOARR+vDrtPuTmNdF5Y=;
 b=Aatpa/bJcxKY05CLueTA3P272DkNNc+hu7d3YKaws7MwI90rzC2ELfxI
 Oqb/hH7aBX9oXa15ys2fTlg63Ry7vxXmY+v5ZrSYD+WHQ7Erdd5h92eIr
 IN5IN1Qi8BDuomu2XljOoPq58pcAnQjGt1+DXSjqfA4XB1NR9Z/5xLa9/
 xkINoWijNxAqOnRx98QtfnZz6Qp8nlZ18uKeOrYwswECOwnKwiTQ4YAgA
 Cb0nYGI9o9ERSiPy+C0V1MNcEuoESWPgDJVgNFp6CpSH1CXuvg+ejp+6M
 you1qbnbQKKg17OcAlyynhDa8tWPzUjeIxQh6VzIhgZmmukwv6RVBCmQF Q==;
X-CSE-ConnectionGUID: 3+x4uLBEQyWCkEWmqpF/JA==
X-CSE-MsgGUID: K14RVap6SduN/cilcenVXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="87258483"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="87258483"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 04:24:09 -0700
X-CSE-ConnectionGUID: v3HVGyozSPKDq9uWrrh4kA==
X-CSE-MsgGUID: SHqwszyrTNqDpxKNmz690A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="226823162"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 04:24:09 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 04:24:08 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 2 Apr 2026 04:24:08 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.12) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 04:24:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OdkvCTux74x/Vd8hs6ZAMwKYIn/cLrqcEAm8sh0MjWX/MbVdCPNcxBMOCj1fNaT6hJGmF0juR27QVuLTiQ3qyuvHZvBJc6X3Cq4aTGBKtZyubeG3a57UpZ2szT6iwdUiDESuprOjNSru/ryRMPfe6kBeNm4yiYT3oNMp68jnxffuar9SN4okm2b2xg+6c6YaflfC1gP5f9x5D230rKKai/9O0ylHFqAvNmpbaEbOwE87+TaboGjbpIbrgDMo7gNM22OvgBR0iXl9BUXUkB+VkTkpxFzTf6ZdbCi8VMwQHZ06js9lr3TzdOgl6djCaGvUAavcIWuSCL3d3AxfCX9tYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f28J+h/dTj1S2bVv8hcec7DCQ3or77Uux8v4V+9sxDw=;
 b=KBSWZBIGbNPiZmPyqvO925kbZO03/MNwoqfPDXR+z4E2ojUMvNKt+92cT2fFqmflqBMEVpgwU/EzWvmRNnZazWy1j4dJK61WNcLixbvX4/uXlopDiB9w85oajAA5anVwpS/xVEknQCp6+XHiBpbk3JgkmbV9g9wjri7X41ftp+lMHgZXTXENCdL7jsc9R8NMMW7GivYJU0BYR+k98bDrXYnwLUQddyO+4BaAnG95NxWGpckMXYRLlz2T5stIXyHj4aVWyVoeEMmaXGOeiPnOsQckR/9D7jPgI8YssVT7TG3T/VXCUyzsO64XIV74xP5Gh9LQi5/+fvhAsvs9T8274w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by CO1PR11MB5011.namprd11.prod.outlook.com (2603:10b6:303:6d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Thu, 2 Apr
 2026 11:23:59 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%5]) with mapi id 15.20.9769.017; Thu, 2 Apr 2026
 11:23:59 +0000
Date: Thu, 2 Apr 2026 13:23:56 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 06/13] drm/xe/pf: Don't reprovision policies if already
 default
Message-ID: <20260402112356.ou4tb4d3mspod755@intel.com>
References: <20260330204046.567-1-michal.wajdeczko@intel.com>
 <20260330204046.567-7-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260330204046.567-7-michal.wajdeczko@intel.com>
X-ClientProxiedBy: VI6PEPF000001F4.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::917) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|CO1PR11MB5011:EE_
X-MS-Office365-Filtering-Correlation-Id: c894e42f-e4e3-498c-1765-08de90aa5613
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: s07BmF+hLEHtBg+/phjldos+BTuIin+PZX7xoG2ir6+SCH3TnNe3Z0ePYptmuI9jk2qbpsRRTJ60HC7xOfoJzRoVIPANM/VXlbOZcgKWdwvKAaKM5DjtVYb2ZnksK4uy1v6KGa7SKVa8CG48+mDdNbabtOGl7dU/fm/E7TCILZv4diban7+6w3MESQLW+rr0vJ9RanGIVgOFrlSrEFOb1JKmU82UYkSXdbhmDkF9Bg56jsxFDm1OMwOkmPutU0hLL5NBQeEr+SITzpkHmWXfNkhUcmrznVZs7GmlBM2qC1r2/caMAstNBIwG/haAsWlxzhQmkGDbWwNqdCvI8rqaseV3ntLwvfCJ/l4TzPFYz51mhzkMWQOBdo1eHCXrrRxbp437jN/9kYoLxP3IuI6scmGcu+K0hmDMzfgo2GCu9Z/pLp720t7kFK0APfdUWXhnlwzkHpEbojFIZVddoLNgHADl6qcnWvUIMBJo9vd/vwuwyqGG53tcm3rEJBjC0FtYzemcE0y99mkc5+TAj1IWos6dT5ziJsp7o+6SfulqG+htcfZGb6Q9VsqJTjAUzcYGgWwpXqFTN0NSlvd19MF9VoNwuVTAfbbaqK0fDmPanXGTRiY4xUW//589J5dL8pkVDGQaZ6iFONuoz6ryw1Skk0KHxkLPOtzGmFVc4B0QAWAQt2Vs2cNsi4pIn1P/PzN5pe9XuQB6aYEiHsbkZS5NH0BTAvLV95qrA06oJpH5pdc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YStrSGpINEIrZ3NCRG5pWGVVem1vRCtPV2xZMlVtaW5UazU2Vy80SGV2cllq?=
 =?utf-8?B?aGs4bjV1d3JjUzJVUWV3OFQyY29FOXVlU2R2N1UxOXd6SFJPclFsMmhsVTd3?=
 =?utf-8?B?RjJwZUVxeHZGNEp6L1BZdVZ0dU1qVEdDQW1Tb3JmYWExM21ta3VXd2oyMlNz?=
 =?utf-8?B?NkM5MGNObndXRUduRUhpUnZQYnBQdGFtVG9MdHhyOEErK2wzRzd5ZDJERGdJ?=
 =?utf-8?B?bHVwdzJFS3NzeVBZVGNiRlk2SDhhUjdsbFJIQ3J1S24zZ3dLbW02MDFXcVZy?=
 =?utf-8?B?b3duNTFrSVNOVFc2bStQZ3VaSU5VTHpOWnJVT21zNkJZQnFGVzhUWlVqMmY1?=
 =?utf-8?B?bS83SVU3alprRHNoaGI4Q3ZFdUhWb2hkZ2lUckhGNmpibk84dUs3bSs2MmVr?=
 =?utf-8?B?N1o1VXhqb2lHVk56OVQ2TUVLbmE5WEhFWGp4NEx2dGZ4YzlKU2ZiNDdZM056?=
 =?utf-8?B?WllrbHBDL0NPZ3R3K1lkNFY5Tk5LQ1F3RGYzbDRFT1F5Q2F2VjhTNXlWRnVX?=
 =?utf-8?B?cVp5aE03SUplUUY2enliNG0xV095RlJUYmNJdC95b3gwR3JRMjNCd000OCtE?=
 =?utf-8?B?dnZoY1YzRWJRWXhvTHpwUkVYK2hJUlYveW5LTFUrSGt3ZFJvWmlocTZ5VkU0?=
 =?utf-8?B?aW5TVk1PZVpoNE9jT2NKakpiL3czVHZyOW1SSWlqQ2EyOG55TGhINk9LTTRU?=
 =?utf-8?B?UzFSdkdqMHhkQmk4dXNCcUkzWGZ0T0h4ZEZCeXpzVFNla2pseEl6UGFlVU5S?=
 =?utf-8?B?MGc1VWlpRiswY3Izc0NxMWN4b3llaXA3MUR2eFVFR3NTcWpWNUhiRUxpUFRJ?=
 =?utf-8?B?RlJVeE9PU2Roejd2aGZqVEpTa3FWNDQ1WTdyMEtJMUN6NU1aa1JJaFRmRmdN?=
 =?utf-8?B?SFNyOGdaeU5uYUtTZFBuYnkyNVMyMGZyQ0lTTmdtSUpLR1hhdG0wMUk5MGk3?=
 =?utf-8?B?WG9ZUVUxVytNcmZScTZnNnlPSFNneVJaQ2xxdVlmQ0tKSmNaQlpzQmhoZTV0?=
 =?utf-8?B?ejFzM21NL0VCS2dhcUE2amxDdnRjNG9TMC8xa1k0TnNYUE4vZXFxbnlyRjd5?=
 =?utf-8?B?MDllR1ZpR1hhcXJnTkJkS1dFODh4a0FmN0thZ05sWTdiTnROSzZqV1c2Z3Bs?=
 =?utf-8?B?Y0JOTzZyYzRFaXFvckdmVkdmTXFtdnE0NFcxb05pTXI2QStlSms2UlJLSDZL?=
 =?utf-8?B?VDhzMWhNUzVhK0crZHF0QjdUbEdsT01UdWFoeFJUUW5TL3dpUVhaaldNdm5h?=
 =?utf-8?B?MTNqM0s4eGREWXBzSkRRdTNJQVV2WVdtaGtTYVFwK0MxVS9VSXc3bXczaE1i?=
 =?utf-8?B?ZUFMc1JrekZySFpjR3BBbUpTbjkvRWlSVEU5UnUyalc4RXVQSXVBUzl1dHlX?=
 =?utf-8?B?aktqTERQVHRsZG5kWmNxY05DNTRTemtVSmFZNXBxcUJRRkRxZnZtUTAwQUQv?=
 =?utf-8?B?VEZZUGV4alNCblREeS9xZjB4WGZXVFpWU0ZIa1F1Vk9hMzFnNDFCYlNtNzhL?=
 =?utf-8?B?ZnJNdW1ZMm13Um1TMisyL2NaZVp3aWI1WE1icFVydXNYMm8vek1GVGIzK2t2?=
 =?utf-8?B?YUlRbmcvcVlmYitGZXJyUXFHVWtaNzE2bUpQM2RCQVcwU3FDTlBHTmlDZlBE?=
 =?utf-8?B?NDIvbEwvQXlVSEhrcC9xRU5nc21EZmUzbHBUZlJXSlhpVWt5UE1MMlpZTllC?=
 =?utf-8?B?MEErVENNSkVXU1p2WkhseVI3U0VsaDU4Tms4WGI1SElOYWFWajVYOFh4M2tR?=
 =?utf-8?B?RVdLNDZwQUliN1NMbDcvL0pBdkRxaTdiMFBSd1ZEcDFIWWw4aWlrYVhNYUxS?=
 =?utf-8?B?M0hzOGhSV2gyT1NObG85N0VjQ1pEUHpKcVp3WG1pNU9qcEU4REVaRm9MaWdK?=
 =?utf-8?B?YW5xTVpXYUxpdEpWdC9IME01SkxybDBwQUhieVQ5VVNvRS9rbHZySGpyc2JM?=
 =?utf-8?B?SzE0LzE3Qk9NaUpUN1Z5OWhkQUpETTBhejJ0VHdDSldzdnpNZHhMdHBnVmI4?=
 =?utf-8?B?WmYxWU1tRXJKekYyS2NzM2RHVXlwS2xmR1F5T05ZQllhNVgxS0xRak5kazVH?=
 =?utf-8?B?UzJwUDl0NVRRSWJ3MUluOVBHaVhTT3NLVjJEQVU4RzZibi9kMjU3RE1vek5T?=
 =?utf-8?B?cE1LbTByaE5aK3FJQzkzTHRNRlgrS0xsQ1VaK2RWR3VDaEVOa1l5RE9DZklj?=
 =?utf-8?B?bU5OdlV6VnV5TDNYdXpwTWtNanJjNWQ3NlVHYXNyZFA0Z1cvTS9oM1NMVHZr?=
 =?utf-8?B?dkNVN1RSNnVtSHRKcllrNVdHM1pjRFk4b2hxbWNLTDBWeG8yeloyNEhZVE50?=
 =?utf-8?B?aCsvT0JoejFDci9ORk82ck5BWHYvWStSbGRtNnZwTy8reGlPM0FGMHdrZVo5?=
 =?utf-8?Q?gVpyYUvwc6Iqc3Iw=3D?=
X-Exchange-RoutingPolicyChecked: NYdrBc2dfnE2verTE/yp30+oy491XspG3YXrxrlIQ8f8dfWiFMR9i5XstqVqng3gBc7UQIa0WY4YaW8tHEEoZB1jtb7fQVe3cIa4MeZ3lrbbF+l8OEQHnaNyFghY8QUWSTsCwm6EmQcR3pV9aU4KlB1/O/PC4dB4CHVeiDhYGcGePVXmzIFYUmhAfG8PAfR7Q9jJZ6390ULR0MaPNpEQ9rx0R9FzdsGNGp1qUFBwbOIP3k7hAFRn7RdGGqIfSRDwIquMdAbXGv6gn0+cAhKSH3TRWvhv2CHwFw5g7mEuym1O1K58ccRFUu3af+N6VTyp77fhELZ2SKY7/QVONcAR1w==
X-MS-Exchange-CrossTenant-Network-Message-Id: c894e42f-e4e3-498c-1765-08de90aa5613
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 11:23:59.7500 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OllJaG6TguTGQo/wRKPQvZsPefYsdf58E/en6BRReO9VrrwSlHphNghbGCFYfyXK+I0CKI5HFoRaEsruDsFAGp4t26IJXIJP0cpVjnvjioQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5011
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pon [2026-mar-30 22:40:37 +0200]:
> There is no need to send policy updates to the GuC if policies
> were not changed from the default settings (usually zero value).
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> index aa80b4abd42f..0007ed7e0d38 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> @@ -177,6 +177,9 @@ static int pf_reprovision_sched_if_idle(struct xe_gt *gt)
>  	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
>  	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
>  
> +	if (!gt->sriov.pf.policy.guc.sched_if_idle)
> +		return 0;
> +
>  	return pf_provision_sched_if_idle(gt, gt->sriov.pf.policy.guc.sched_if_idle);
>  }
>  
> @@ -255,6 +258,9 @@ static int pf_reprovision_reset_engine(struct xe_gt *gt)
>  	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
>  	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
>  
> +	if (!gt->sriov.pf.policy.guc.reset_engine)
> +		return 0;
> +
>  	return pf_provision_reset_engine(gt, gt->sriov.pf.policy.guc.reset_engine);
>  }
>  
> @@ -321,6 +327,9 @@ static int pf_reprovision_sample_period(struct xe_gt *gt)
>  	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
>  	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
>  
> +	if (!gt->sriov.pf.policy.guc.sample_period)
> +		return 0;
> +
>  	return pf_provision_sample_period(gt, gt->sriov.pf.policy.guc.sample_period);
>  }

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

>  
> -- 
> 2.47.1
> 

-- 

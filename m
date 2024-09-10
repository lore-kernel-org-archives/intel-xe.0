Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C683EDE9AF
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 18:44:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3265D10E161;
	Tue, 10 Sep 2024 18:44:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bLQfIz9l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A787810E8C3
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 18:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725993885; x=1757529885;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RLHW0CWFTtQhwOrQPJ+G0vFiMU1VeKHYLQzqzRGHnmM=;
 b=bLQfIz9lTQ4k2eUK9sye37ugm9L5Tr0QekhGPngmFut/d18pqWVRRdji
 L94mohUCwyHFfNjhEkztlidnln9mFZ1OAb52mlgkht29gifR/KwOfJhnp
 eGTHXX43rGhAV5Y5So7WYx5p2A0mRaJEZ/TPcjGLefBOomRFb8N5nxdlF
 1n4kMXNqKn1RbV566bOUdP+zprNrPewp7NrmgW4VPT1JtoDgbcLm3jyX0
 Yz8LFX8O88gZ29X0sSYRgTK6038eoGPHrvKjCufw7qV+ILlIRMoIjkMbZ
 j+Cse2712/zvhtkbvt9+EvPco68doDF2OiAQZeyRT5GCVuAmKmL5DetuE A==;
X-CSE-ConnectionGUID: mzeqb+TxQM6gHL40HVq+mQ==
X-CSE-MsgGUID: stClmj2pT4K18WyZ0f3XhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="27682835"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="27682835"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 11:44:44 -0700
X-CSE-ConnectionGUID: GVavkom1Q/SZk89bvW6sMA==
X-CSE-MsgGUID: rXJ1aiuKTLG9klcOYcaMGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="72095566"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 11:44:44 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 11:44:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 11:44:43 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 11:44:43 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 11:44:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rBVAn5O5hLy+qi44hMFf5HEiK4iUQbBFtymCO9lh9AhzwnX1Um2nb0BY2VzvmOe7fg3RanPpnjbwjV/lAd4SSjR1XDXAd1thGs+HGS+xfMJLYOJqRLtZ+xZQeyuUszU58Zqo5lu6eBY2m91B1pbfJq4jV4PklydKaBi16Ks1TpBkPtSvHFXIvTg90OlCP2iyCBzHQLiywmgJ/D1wUeOoWTqpYxzW0Yl3HipCiSSjZPSCc0Qcch+bs2PR96cJmL3251YXiUjFI0z8+cbpwhYizpgBJFXT5ZwS2ic6Z7C+4UenkF1Ppl6QaaRuLcmdrv1NKTOEv1OTKld6BpbF+ZHu2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mCFvGDfah9+XMwB7AM74/RR1QEQagojEYG7gVWkEwJA=;
 b=cDB8a8V+fJgd8agB2aYfN8reQziF8APGq5WZNnoGvn03HWFV3Hq2yLREHM/MXen/GFAIfEnQLPRcyW36pJDjNYydbnb/UAlp44TiJMymvLwLjBC6fGnm/ITj1oLZ7onfxGYpLwDTtwKKKrtsJjleqAiBdLSfxa50onmdQKFig5VVVD5XAwob+/fHSkWN2B5kwhw7W5iqN9NbNEv6PgrnwFsl5d/HATvWdT4x4qisIRwdeTqgqqz8snjEKOdZ+BRRx/08RZBgJqNUqwJmmwCBRaJXn2bDL/AtZvnSqsDHKzEp6cakJs9X+WpukzPe2MWUOpjMMU8sLwujzGw3QL+tew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by MW4PR11MB8292.namprd11.prod.outlook.com (2603:10b6:303:20c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Tue, 10 Sep
 2024 18:44:38 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 18:44:38 +0000
Date: Tue, 10 Sep 2024 14:44:34 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 22/43] drm/xe/huc: Convert register access to use
 xe_mmio
Message-ID: <ZuCTktHwufvNXxFq@intel.com>
References: <20240907000748.2614020-45-matthew.d.roper@intel.com>
 <20240907000748.2614020-67-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240907000748.2614020-67-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4PR04CA0231.namprd04.prod.outlook.com
 (2603:10b6:303:87::26) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|MW4PR11MB8292:EE_
X-MS-Office365-Filtering-Correlation-Id: fb7f6424-7ff4-4513-f282-08dcd1c89f73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aXmthF9WRCQHuscYIi4+iSVRP8e2fVWkD8jzZ6D+tF+TPvQyyIMzFLoJyOhM?=
 =?us-ascii?Q?8wOYmf/YgONMC0QoXxLkNw3zlJG0fUQbKKQNnMMDyRywP2t4rRZKkQ+KdD4x?=
 =?us-ascii?Q?7Nx3wKT4o4HcGQ0pvwy/PqclTwB9ui7czL/v0FMl8WNkn2ycaIbZnBqhRU8o?=
 =?us-ascii?Q?yUkGwHaayqV7wmivdNPyxrEIGq3HVG2uoCGcoLRbZQmFG0nT5ZkpZ/7fS/0v?=
 =?us-ascii?Q?WcRx5750672sAt5CCuM5vlWwMPleQACjfb2lEwHp0C1Pxmh/mG9th9cz6KVm?=
 =?us-ascii?Q?TsKPIsuR4zgTva6db+6Rld8BdtljnmXFH8fI4iein6HzC4R24rzyrpOR9ISq?=
 =?us-ascii?Q?f7kF0xQABsyboBvxFDiOMAoKpBA9eQNo3ot7GPx3r6ZxZd+uGDS5iv6+Sx60?=
 =?us-ascii?Q?Im5CjNpbD1ZjpCuLwZ0pPO6yALsYnqD+Kr8v9kUsyIyZUtCc7zmr+FSJyZGY?=
 =?us-ascii?Q?P3LF6BoZMoen6LzPgc6I+nSztrIN17I1odk2ZBfHfrISJOKaiRkeC72QubNR?=
 =?us-ascii?Q?xSsw+SdGBxxpRUfUfIVbjMtzTiKaSC/RrxwKGMh+1AVr7kE5hXdLuAX2HaiU?=
 =?us-ascii?Q?vsCQea9YjC7P8BGmbYpxAjmdMlLPp4C79g0yo9VtaTDVhpCOFN8sqSgAm5WO?=
 =?us-ascii?Q?uYkPYxF9veN1WTS94zY41gR5/WcYmpAazHkWLNwCu5LBpPPY2bbBENipsgss?=
 =?us-ascii?Q?ZLo0T3MUzsyraQ+Qnz1+kqKEsydscqFZKRKRppwPWV/JoRvuidUxpdkZTrxh?=
 =?us-ascii?Q?y0qeq9w+bTXMCGeVV0eyd7sky1igE20ei8OCwuITPgTmI3vkHikL+7feMIpW?=
 =?us-ascii?Q?XCnuw320PzafLo1cb96Baxw2O76uWQvECINcZg+Mp0DceICMU/loNQdETqIG?=
 =?us-ascii?Q?c8N5ug29m1MCjCyFxTv4D8O0Ow8rCnZN0k/9NH3JSO4Htm3IdYwqN4BiYpVA?=
 =?us-ascii?Q?4LacsxwPx9Kkti3RIo+8fM4SDYCG7EkrJ/EV9jOPFQ0ktuIamPVCj7xa0gwz?=
 =?us-ascii?Q?DQoq9D46vzMeQTtA4B/YnAxxk1haPqWTvXPEfWsxCJ6/fWd6Iao3lUgtysjL?=
 =?us-ascii?Q?BQtG9Mq5463p3APti2gjzuzJIhJFqkgTphNjyICZIRxnnwjrG2mnwYkCLuO7?=
 =?us-ascii?Q?On4hE8TgyYlQ94371NZwVmgjC4ICT8n5blr5OvJoZYJ0FVNthq//xRhKs5GQ?=
 =?us-ascii?Q?HYMOXNNyfnLSEyru3ErFRO4YG1ZktZs3Qp6Iy8/0nslQ5uGEYlbsqzaqPv1h?=
 =?us-ascii?Q?KQRrp/KpUiSnzJ/rOs7dTObeUHxJTD8ebuQ7Bzo2Ed5aKgk1zg3FBz6kiQpw?=
 =?us-ascii?Q?SBXgcnhryQKpwEJa+msWMXGzl6+Hpy+x9YanX0NfKFeBLQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?grrW8xJiThXYqoIJaj+qqh4FrteNY+PV7SicFe/q8gDBj3NsQXms4RU0fthi?=
 =?us-ascii?Q?X0EWJluVjmhUZvssupoblfiGu63sYAYiyiaNqXubSNK5+F9k50oy8nshDV/u?=
 =?us-ascii?Q?PIKNzBgXEyldwy8T64x8UEikQ7XZYyKE1GFP2ydm96sYXV42+RvcBCuH5rdb?=
 =?us-ascii?Q?V7vVrrLGriJoUiNKKsXXFzY1UpEdfvSofnjRZde5ng49INfJt6PgyOw7uvuR?=
 =?us-ascii?Q?zduFi/gOdIS2tE0EyiQh0+/68h5TlAta1ZKzJLYJqAAuTHR1snbErIoCGDDt?=
 =?us-ascii?Q?nMRIQZZgQiU3sGUkq4sxHvCVYiFRtHNdJGHBMSsIEMOnyQB1+wwilSVd9gao?=
 =?us-ascii?Q?YW8sEXr/beXvdrgocBRIVKm5+gkn+NTJS9obqFO7NYDDGfw0fFE37gQS1bcY?=
 =?us-ascii?Q?EvnTxo6pi9SydSAjgzOpZew7yNmQ+QlopndgCi31dY5GuYx0nth8/wWtjmXm?=
 =?us-ascii?Q?P2N+A1i5dufRKQT1c1s39G7EksGcKH0Eh1X74Nl1l/2DeSiUbym3wQYC9tc+?=
 =?us-ascii?Q?0yohAqBkJn9ErKwl53DddDcd+GTkrC2WMZAYUHCp9tYEG6Vm/vEw9uFQZqPG?=
 =?us-ascii?Q?jxJXwxLapX5OX8+W32+R5im88ZIQ1GrZjIFpS0vMr9S4r7l5qawRd4WzEemB?=
 =?us-ascii?Q?X7E7JM5O9tt+/sFeKnx1RqIIuqVkY/bTnkK/+y3smF+5KBIUOQx3sjtcICV3?=
 =?us-ascii?Q?gSVThgVgHmv4Lfi6Bv7pPUZ4MupSDqYkz2Obtl6xfYjAbRAvlk7Z+s5SPoHb?=
 =?us-ascii?Q?HPbv1cMi+Ex0Vp2oUjfGiBv+bxvTV7vUWoX1PuUGleFQtaZ3EIIrosnKhZjj?=
 =?us-ascii?Q?OX5lDvTOsFdkrdseabHGu1oYeusFn017TqlWU6R4eyqsUDFYVlQO2iwiMxJ6?=
 =?us-ascii?Q?PJfYua7vZfcwDHaJKYFx4bPcQVwdEu/yLcFRG5GaRmXu9Lnje5EYc3DBn5bc?=
 =?us-ascii?Q?afRvN1Om/iYaxL4bdOQLtlMSVgqc51fIQqJj0fqByoiVKnRp7rlW4y6UGVXQ?=
 =?us-ascii?Q?KfTZVHqIcJY1jbT/6kAi9KUmzIzH+Ds3ApADZL7kRELzW/0ra7fGBRn2k2/q?=
 =?us-ascii?Q?FYYUjVF3XPipLemALTuk/Wow8vBVOXwL5WT1pjhlQTv/+31Czr9I8xK7yXok?=
 =?us-ascii?Q?NaZnOJybn8+q1S/5p3bbjHaILwF8GLu0jv1F1Ag06VEuNe7Z/GY6CsJYBhJ/?=
 =?us-ascii?Q?chzbG6plmP+MXe5clG255mnXhTAGtlZaMNE/dFV6852Ia+qYn0ke1j8Q8apa?=
 =?us-ascii?Q?CuoNbMVvjf5eqKvCBHa2UB22jYd9umLag0LSp08h5fUjqQF2OoFF2/Wx5LnF?=
 =?us-ascii?Q?fX/1IJO8RA2w0Z5NL3fa8+0dJDCAv1703IPsqaM84t1FxmuwmhkxEKLjiRVY?=
 =?us-ascii?Q?JM0oalJyJOipHkSu1pWBuz6ZaOTQ2EyyBDyQ1tUrNyzQeflbPg4W/+7DQtqt?=
 =?us-ascii?Q?xzKFRxdexkzUKIuRnyym2UcrXtqOFxb0baIP5+aItT2K/3PuzlLtaq41n7cT?=
 =?us-ascii?Q?ONopbjJ2Bj52IdBe92lFWc2/cNd2JBzFKd+N0GTMreg012oPVI46sFhR81V5?=
 =?us-ascii?Q?CqRF98CJslodDwMA6aW1jEiYUxlidbB0Sfxj8in9jVcLFwM80kYlXpag/k7/?=
 =?us-ascii?Q?4A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fb7f6424-7ff4-4513-f282-08dcd1c89f73
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 18:44:38.5356 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cR2RgyV5AHw4g89Z/Dl2YHEnN2Jjka+Vdo9RnOXJw+WU7KEA/P+LjBfQf/LDf/6ZuXben4Gt8cpQVP9ef8JEvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8292
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

On Fri, Sep 06, 2024 at 05:08:11PM -0700, Matt Roper wrote:
> Stop using GT pointers for register access.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_huc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
> index f5459f97af23..77c5830309cf 100644
> --- a/drivers/gpu/drm/xe/xe_huc.c
> +++ b/drivers/gpu/drm/xe/xe_huc.c
> @@ -229,7 +229,7 @@ bool xe_huc_is_authenticated(struct xe_huc *huc, enum xe_huc_auth_types type)
>  {
>  	struct xe_gt *gt = huc_to_gt(huc);
>  
> -	return xe_mmio_read32(gt, huc_auth_modes[type].reg) & huc_auth_modes[type].val;
> +	return xe_mmio_read32(&gt->mmio, huc_auth_modes[type].reg) & huc_auth_modes[type].val;
>  }
>  
>  int xe_huc_auth(struct xe_huc *huc, enum xe_huc_auth_types type)
> @@ -268,7 +268,7 @@ int xe_huc_auth(struct xe_huc *huc, enum xe_huc_auth_types type)
>  		goto fail;
>  	}
>  
> -	ret = xe_mmio_wait32(gt, huc_auth_modes[type].reg, huc_auth_modes[type].val,
> +	ret = xe_mmio_wait32(&gt->mmio, huc_auth_modes[type].reg, huc_auth_modes[type].val,
>  			     huc_auth_modes[type].val, 100000, NULL, false);
>  	if (ret) {
>  		xe_gt_err(gt, "HuC: firmware not verified: %pe\n", ERR_PTR(ret));
> @@ -308,7 +308,7 @@ void xe_huc_print_info(struct xe_huc *huc, struct drm_printer *p)
>  		return;
>  
>  	drm_printf(p, "\nHuC status: 0x%08x\n",
> -		   xe_mmio_read32(gt, HUC_KERNEL_LOAD_INFO));
> +		   xe_mmio_read32(&gt->mmio, HUC_KERNEL_LOAD_INFO));
>  
>  	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>  }
> -- 
> 2.45.2
> 

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BCF5E6BF17
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 14:33:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEC6510EA04;
	Fri, 30 Jan 2026 14:33:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jtiZ3d0h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59E5C10EA06
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Jan 2026 14:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769783619; x=1801319619;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=9UoVQofMvW7A6TTGpbV0P+SQmfw3xf/yF1Q3Rfm7iaY=;
 b=jtiZ3d0hgfQG++2VHqtbuj73+biiKceWpLRzAiTD7Ttp2h7SBlAmeV96
 qgY87X5TlLnQhvMkKdS3SGfPRQ6IvpF1ONnVdxEBx89xDDh9ryRdHHw4T
 7rgyr/k2DOBzKiMcG1qQIYAsVzjIivrpKYh46NVxeIhahpniQaV48Yj+U
 m+TX6dV9UeK1iyPdzFGFdQqr24OEcvbWS/inPyi90AR5fmtydzpRFo7HS
 0eUO2q7/WAFi2bs3EyoAagEdTc0yGxIxMsjllbrDHaaoIfNS/8YMXlMNs
 oPgbR108jUtQFfRgUJuaeXRIWStHMJUCwlRXIZVSMWocHVnKl909XQ10v g==;
X-CSE-ConnectionGUID: VoZvROPLTOOgvgUklNj8uA==
X-CSE-MsgGUID: I/ciVgo2SVaL5lsGFuo5Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="70052480"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="70052480"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 06:33:38 -0800
X-CSE-ConnectionGUID: SiS050tTQA2n4PVyNrSO2g==
X-CSE-MsgGUID: PX/D7Nx6Q+6LTr2s1PpPvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="207989042"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 06:33:39 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 06:33:38 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 30 Jan 2026 06:33:38 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.37) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 06:33:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aup384TNgmm4bjmtucLcGbJZUZdWAQFdpJtuSZ94RH8UUXnkHRpBVK30x4iOZEj/ToYkHXgfcNly+ZXjdp3P641B40JJHt3UpH5cxNzC19LiBxkpj5WA4f15eD1BCPcwePu3/MLgW6zGnxToZmaNpu19NP575xF9BIEp8mmUOgMwXKAbc5+A49AvYV38zYQVeBQpg+vftSVjmznKR8PZPMz9i63SeFu9758oJ24PK3qtao7eMjdbod+YSoDxTGGKRXkp0IYN7bt4S8lnLr5QWuQiuA1lTWqo0OjJZAbDG9uvu4wfMtLiuBxRbPqJaAv5VNg4sZECbikss2xkNWjl6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4OTryrtJKMwP5CnSFNg+V70OyvEKO8uOxOK3A32D+Lc=;
 b=iL5FyFkW4OzNGePycv9Rn2JPHJ/GuEKAXSB+VCtETH1w1CmD08jgU3AMQjdxliMdjYwi4TFKFAD4ONJybjNC3LulhYi9ItbIcMVBt1J8cXenW5Sg1H1CBvYlW/Rsd1XVCVuumDmpdS+UMTwW4Xo4890CNkFXi0/f9ab1ssDwwm0MRhP2Ko1wvK116+xMRM8JwGt7ZuJPFEr7v+4vyDfQzI8u4txmVBZErMlDqSjhXtlTc8vYQChm9cglIsqoGSChLBOmjeSMu7IuT/PB77rYdFRVfheVAaXncaZe4s/n8rx+e6gLaxmn0k4x/PailSV24MQZrw1ys5ZYwXbTpkbuJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7164.namprd11.prod.outlook.com (2603:10b6:303:212::6)
 by DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 14:33:35 +0000
Received: from MW4PR11MB7164.namprd11.prod.outlook.com
 ([fe80::c9ac:7bd4:84c8:a7f1]) by MW4PR11MB7164.namprd11.prod.outlook.com
 ([fe80::c9ac:7bd4:84c8:a7f1%6]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 14:33:34 +0000
Message-ID: <7ea74d05-6766-461e-8a0f-45e3618e2c10@intel.com>
Date: Fri, 30 Jan 2026 20:03:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe: Mutual exclusivity between CCS-mode and PF
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251128171759.2775650-4-naresh.kumar.g@intel.com>
 <20260129172246.1106097-4-naresh.kumar.g@intel.com>
 <20260129172246.1106097-6-naresh.kumar.g@intel.com>
 <8bf19afa-44ab-458b-9cb7-178cfb8d0373@intel.com>
Content-Language: en-US
From: "Kumar G, Naresh" <naresh.kumar.g@intel.com>
In-Reply-To: <8bf19afa-44ab-458b-9cb7-178cfb8d0373@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0145.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::15) To MW4PR11MB7164.namprd11.prod.outlook.com
 (2603:10b6:303:212::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7164:EE_|DM4PR11MB6312:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d409578-1a0f-4a21-a300-08de600c8c91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d3JJcDJ2UUE4M2dUUFg0TTh1UUJkNnFCWmswWGhiSlZ1R3hDdWpBMGY2dmZJ?=
 =?utf-8?B?emd6a2hVbHIvMm9hTDNaZkZzVXd0V3BldFV4S2ZtVDdsWVFNM3lXU3R1R3lm?=
 =?utf-8?B?aHhoNFF2VmxVTGhHK2VYNEtyTTY4K2w4Z1l3dnh0YzhWbzNJVlkvdmJ6NHkx?=
 =?utf-8?B?YUxHWHg0TlVhQ0MzcTRhZXBESnRmQ1dpU2hwWndZWUxFMTNBd3ZUOFlzVmQx?=
 =?utf-8?B?Z3ZLd2d5ajZ3UEdlWTUwb3MxLzAvLzdkZ0wzL0ZqTHJhdDdCcVV3UitTOGxC?=
 =?utf-8?B?Q2NJU2k4V05KTlIxeVJvV1cvaXpJelB5bkpaT29OdWwrVXdSNkdIWHVuNzBC?=
 =?utf-8?B?bUphMlhubC80VEZ3aVU5UVlNTEwxanN2LzJPYjVveUFZSUZRVk42a2V3QXd1?=
 =?utf-8?B?N1ovaU5ib01VdC9EZEhjcURDZXhtMkQ1NXZLbjR2RnhCcXkxTUNiUThMbVVa?=
 =?utf-8?B?dEpPZmxjRzBIS3M1MHYrWmU0ei9UOXljaDlZbk95ckxnOFVTWUlLWElxc1d0?=
 =?utf-8?B?RVBPVmxLQzhBd0tnK0xncGFKOUxJUUJmSDNWbUZ0QWRGOXNOSlczVmcwNGRD?=
 =?utf-8?B?alFjdzFrNHppdWFEOU96UkptUXNpaU5MQ0s2WVZ1UzRsMU9HUEhkZXhicjhT?=
 =?utf-8?B?R0l5RmZzWVVyRzA0REVoTkpXU1k0SDlVNk4rSlJ6YXJ3N05pTWwrT09RdDUw?=
 =?utf-8?B?c1pXUWhhT0hxVUZRZmFBT1pjc3hFVFQwWU5XMHhmMEw0SGxEYllPVC8xZUNp?=
 =?utf-8?B?a2U3M0p5T3pWMVdDN0dyeW5ibnYvZUU1NUI3OGZtSndjZUpzVjVrd2svdXc3?=
 =?utf-8?B?VHF4bTdjTytieGpmQlJaU2JuTEp2VGYvSFFsNStkVDFUdUVPR0MvMWdPaDdz?=
 =?utf-8?B?bmo0R0p3NFZyeGtDWVdIT20wZ0tnQ1N3U3J5ZFpMU3g4bVJzV3ZPRHhtT0dR?=
 =?utf-8?B?U2xHODZqY3M4WFBwSUJuSkNmZUxmYVFlaWN0cUhydGNMMzM1bWJEVnUyaFY0?=
 =?utf-8?B?SFZvczRBY2w4TWt6aDhVMjBmRTJwak1lbTVnaHkxTDVQQ01CcTZ6dXl6bXlK?=
 =?utf-8?B?QnNmcTFCODUrcVVKY2FtWk9ZR2R4amt1R1V2M1lTZUNGbUVvbzJtQkxJQVN5?=
 =?utf-8?B?UXZPSklFUlkwZ0dqdDVnYTE3OEtEZkwyTjBpeVZGb1ZBVlpVRTdKNXU3ZVBv?=
 =?utf-8?B?b1EwazQvZ29tUGpZemlYR3ZNTDZZcEgzUEVoRUxMWTRoOXgrY2hteWpmVHh6?=
 =?utf-8?B?Rk9MM2lGK3BmMnI5eUE3SnN2YWkraUVjS2FoMnpZK2ttTDdjWkt5OVRRaFRa?=
 =?utf-8?B?anoxN1FFL3NUMHlhVVd3d25hS2pFVDNTRW9Sb3VtTmVrZFRPKzRZRXpVL3VZ?=
 =?utf-8?B?L3BvSG9CeWlZMWZHdjJKb3VubVo4d3pyVFNJSjRiUUo4V1lBLyt5VmpRVHMw?=
 =?utf-8?B?cmRSQU9UQlpxdzBJVkVndm9YVEhzRXBhYWcwVkxOMW1PM29yZ211bHAvN0My?=
 =?utf-8?B?L3ZNSjFKRFNpTWtTZmlMenR4RXZNWituU3B0eW5BSHBHMVhDYnpCa2pVdVVh?=
 =?utf-8?B?YUU0d1hPMllSSjdVaTZOZUJHVHVVQXhWMm83WW0xUmYxUVFhRk9EL08vNTh3?=
 =?utf-8?B?dlFURUN2eFNrWFdsL2hZSWp3b0tFUndJRTFlSktiUy94LzR6c1RvemhVOERU?=
 =?utf-8?B?Wjl5VlZiblFRTDMyaDNROHFOanM2WDFPNzBSM1I1MzJZQlpFR1lWMzJZMUhz?=
 =?utf-8?B?V0tTU3dxL0dIU3lMRmh2a0doMHBCZFovZUY1SEVYT2NKaEJOZk9pN2cvWjVV?=
 =?utf-8?B?YUZkaFFzOTlLTDJYdWJxRkdMQTNLWjZFZjFnQTlseElMYnVidFk5M3h3bWtz?=
 =?utf-8?B?TjU2Qm9EU0xBc3VCNDNlM0p5SjZIWWdrcEh2WDVWRHowckZrS0hGQkFqbFBk?=
 =?utf-8?B?VFFtb1NTMTd1OGhjL3VZaUVwM0pPOEFXVzAyNE80V1ZUcVJ4c0dhWUkrRGpT?=
 =?utf-8?B?TWp3dWFET1g3azY3eHhybGdzNlFCeHBmM3dldXpLUVE3U0FlTkxHRTZ0b3A5?=
 =?utf-8?B?c1ZZNTc0cGxrUWRoWS9iRm1zZjJleFVjQjIvLy9HcWttc2c0WVR3bDRNVzhU?=
 =?utf-8?Q?ARzc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7164.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzJKclMxcnlTTHh1UVdTVmdrSWQrcGlMRXpnVFl5dzFDZTJMK1FlMzg5V1VT?=
 =?utf-8?B?di83eUNYM3JTUU1jSzFKd00rWm1hYTBDVjJVajhKL2NKT1J0ejUyMU1CRmpo?=
 =?utf-8?B?S0hUVm5SaDZPSDBXV2ZrN0tXcGNMdEpNa0RVMzRXOWlkQzcxY3BFeWFqR2FX?=
 =?utf-8?B?d0NLZ1lQc1ZVdXk4VGtodk1wRDdtL2hhSXBPY1ppM2F4OWQ3MEVjRUJyclZQ?=
 =?utf-8?B?WW90VFVvQmdyNWZmcGJEQVJ2V0FsTnRrRzZYdmRmRXBNTHJWQ1lPcGliOTFo?=
 =?utf-8?B?VUtZKzlaYTRhclo5RUpxZmNLNFNBVWZVUG5sRlpFbnZJRFBlSVNpMURBR1l2?=
 =?utf-8?B?M1VyQlBydjNvbUxHVU5VZkFjKzRsZ3RZUVUrWHFRNXdBWFU0dWUvOTlTTTVB?=
 =?utf-8?B?andtemYwbVlRR1hSY0ZmdWtnWmRpaVdHSFpCUVZKbW9EcEtxcm5hbU9TV3Bm?=
 =?utf-8?B?SmlFeEpMWk4rSExBZGs0cS91UE9IdUJ2UWlFV1JZWEp4OGxXNXpVU1JSQ0Rr?=
 =?utf-8?B?UTQzeWhORUNoWFJCOVR4c21mSnJGMnFud0l6QU1xcldqKzE5dVhNVTlzRjF3?=
 =?utf-8?B?OVdTZU1LMHNYcExibmFnVEo3SGt6WXRXQTdqd3ZUMGUxNndBQkM0N1dpSVBn?=
 =?utf-8?B?RXVwdzB4cFZhY1h0Wms1TnNHeW1UbC9McWZlYnJST3FkbEYyRVV3alozSlZJ?=
 =?utf-8?B?VTlScHhNdGJiUWhZN1IxeDQwTDdVbnRHTDlKc21UeDIzckRCZ0hSMWVmYUoy?=
 =?utf-8?B?Y1hpR2J1dHUzY0VoSFk4amViNzRlb05peXB1ZlRMeWh3ekIrMHk4TGlOejZ1?=
 =?utf-8?B?OUdVL2dNZWhxcUFVdTB1ZmJaZStVUTZOMGpSOWl3RGdDa2JnR1dPTFEveEo2?=
 =?utf-8?B?ZVNISDhtUmpUQzZ1L3VON0xNdDNjdjczT1pZWWgrN2lEalNYUHl3WXd1TDdL?=
 =?utf-8?B?SHBXVm80NkIyS2wzS2FYUk95TDRpOHJJME9neGhCWG5CMEx3U3lObFJwQXlB?=
 =?utf-8?B?N1pxV240ZC9RRVhrbkN6NDJoYStsL1Z5cnRjUytmUjAyRWN4aVJweHRkd0VU?=
 =?utf-8?B?L3VMeW1jMDFmRGx2aFN4a0YzTmNIQW5Db1FjdncvUDk5bFRtcXVEMDNHdDhN?=
 =?utf-8?B?dmp5VHI4UHBJMjVIR0FBZTdBSEhTc0lxdXNrN3B6RUhKNVExSzBkeGZJUkYr?=
 =?utf-8?B?TXp0cjdFWkl1NnJ2Y3RGMGZEUHpIdFJjdUJrVDlzdHZBazIvekZNN05tZktp?=
 =?utf-8?B?SUVzMUVOL3FKUUtHWkFWa3JwcGpTMkZyT3BPN0ZwNTNjNXNyMnpmdEJuMDB0?=
 =?utf-8?B?aDE4aHZxdUxIQUpMY3lXcmx4VWo3U3VTQktLZGlCc0pJRTRST081VCtPRzIx?=
 =?utf-8?B?NitzRzc3RDcrUkZkM3JaRm1OaVR6ZU5DRytiZytFL3l3K1IvdHRYdzhPNTRT?=
 =?utf-8?B?bFBzY3VzcTQrc210YndseDYyamtiam5uSGNkQjlXaWV0TjA1WEhsOXMwRnFu?=
 =?utf-8?B?bDhFa2V0L0gxbXRyVFg2bjBVTmNzTWpCcEgwald5VzVPSG1HYUhVZm9ZdW53?=
 =?utf-8?B?cENtbE9BOWJUZ3BFK1F2bjlnYmptMHFROHIycGp5QnpZOTFabmtpeTdDOERD?=
 =?utf-8?B?UTBsejZZU002QXFybkFRNEN2THkvZld5QVQzRVBnYmZYSnV5am9zSkh3c0hM?=
 =?utf-8?B?N3lnSkV2T0pEVDZ4UVhmcUd1Z3JOdVUwRmcvZHV2Q0VObzhscUdsM2w0SHM2?=
 =?utf-8?B?NlVFYmNUSTVVOHVjVEJTb3ZQcVNFNU1LNDc5bFZIdEI4YXgxZ2tSZTExRFRH?=
 =?utf-8?B?ZFNFeERrSnBhZ3A5dW1ZbE5mOTFaSis2V1FGTGtQT3BVakJNSDBkeUR5dkkv?=
 =?utf-8?B?ZWswYUxGNk9tTG9FOUt4VkpuWTN3RHo1TkdINUxFUDIzSzFpRTU2VllpZGla?=
 =?utf-8?B?NXNmcmFUMWEwYnB1TDFLUVR0RmY4WFBTQlNZZitOdU1Vd1Nva1Q4d0FFcGM1?=
 =?utf-8?B?V1MxTlFBd3phRWFMOUhyajJGaEl5QUNITkgyV2Fta0VlMG11eE9TcFZlZzRm?=
 =?utf-8?B?MHd2Mkw4VkFrTWd4Z05YSDVUMDFTeTY4bmlzR3Zadlo5MlpoMnhUSWhkZm1v?=
 =?utf-8?B?aDNnUDM0UjJRTUxlK2h1NExlWDhSMzM0Z2Z1RTlrSUpyblp5R0h0Sy9XSENS?=
 =?utf-8?B?bzQ1ZjJiaWpVWW1CZkRWeWNVS280M1RCZUl3dGtOUFN6QUh5SmlyZzZBSUw1?=
 =?utf-8?B?RmFzOTczay9QcXR4cW8vUjdKZTExRWJnMCtuaWZOUmYrVDJmSjJXbFRNMnM5?=
 =?utf-8?B?SENzRlVTeGlTVWZNRzB2YlF3ZmZ4Y3RQWEJCdlA2ZUg3ZzJBazR3dz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d409578-1a0f-4a21-a300-08de600c8c91
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7164.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 14:33:34.9144 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qERgOeP2P8vJHbOtmzcYigG5cnNE8x4+0f6HAFWeciiTpczRrY9REt3kWLSNALafqo6bE6G0rVkGo7YeJthKR+2RbmDXuGpIOMCsNGNV7SQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6312
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

Hi Michal,

please find inlined comments.

On 30-01-2026 03:11, Michal Wajdeczko wrote:
> 
> 
> On 1/29/2026 6:22 PM, Nareshkumar Gollakoti wrote:
>> Due to SLA agreement between PF and VFs,the alternate CCS-mode
>                                            ^
> nit: missing space

Noted

> 
>> cannot be changed when VFs are already enabled.
>> Similarly, enabling VFs is not permitted when the alternate
>> CCS-mode is active.
> 
> maybe it's worth to mention:
> 
> "Currently we block CCS mode changes if driver is running as PF,
>   even if there are no VFs enabled yet."
> 
> above says "why" but what about "how" ? maybe:
> 
> "Use lockdown mechanism provided by the PF to relax that limitation
>   and still enforce above VFs related requirements."
>

Make sense, Noted.

>>
>> Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 37 ++++++++++++++++++-----------
>>   drivers/gpu/drm/xe/xe_gt_ccs_mode.h | 12 ++++++++++
>>   2 files changed, 35 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>> index e146e00b0ca2..52285a550f34 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>> @@ -13,6 +13,7 @@
>>   #include "xe_gt_sysfs.h"
>>   #include "xe_mmio.h"
>>   #include "xe_sriov.h"
>> +#include "xe_sriov_pf.h"
>>   
>>   static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
>>   {
>> @@ -117,12 +118,6 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
>>   	u32 num_engines, num_slices;
>>   	int ret;
>>   
>> -	if (IS_SRIOV(xe)) {
>> -		xe_gt_dbg(gt, "Can't change compute mode when running as %s\n",
>> -			  xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
>> -		return -EOPNOTSUPP;
>> -	}
>> -
>>   	ret = kstrtou32(buff, 0, &num_engines);
>>   	if (ret)
>>   		return ret;
>> @@ -139,21 +134,35 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
>>   	}
>>   
>>   	/* CCS mode can only be updated when there are no drm clients */
>> -	mutex_lock(&xe->drm.filelist_mutex);
>> +	guard(mutex)(&xe->drm.filelist_mutex);
>>   	if (!list_empty(&xe->drm.filelist)) {
>> -		mutex_unlock(&xe->drm.filelist_mutex);
>>   		xe_gt_dbg(gt, "Rejecting compute mode change as there are active drm clients\n");
>>   		return -EBUSY;
>>   	}
>>   
>> -	if (gt->ccs_mode != num_engines) {
>> -		xe_gt_info(gt, "Setting compute mode to %d\n", num_engines);
>> -		gt->ccs_mode = num_engines;
>> -		xe_gt_record_user_engines(gt);
>> -		xe_gt_reset(gt);
>> +	if (gt->ccs_mode == num_engines)
>> +		return count;
>> +
>> +	/*
>> +	 * Changing default CCS mode is only allowed when there
>> +	 * are no VFs. Try to lockdown PF to find out.
>> +	 */
>> +	if (xe_gt_ccs_mode_default(gt) && IS_SRIOV_PF(xe)) {
>> +		ret = xe_sriov_pf_lockdown(xe);
>> +		if (ret) {
>> +			xe_gt_dbg(gt, "Can't change CCS Mode: VFs are enabled\n");
>> +			return ret;
>> +		}
>>   	}
>>   
>> -	mutex_unlock(&xe->drm.filelist_mutex);
>> +	xe_gt_info(gt, "Setting compute mode to %d\n", num_engines);
>> +	gt->ccs_mode = num_engines;
>> +	xe_gt_record_user_engines(gt);
>> +	xe_gt_reset(gt);
>> +
>> +	/* We may end PF lockdown once CCS mode is default again */
>> +	if (xe_gt_ccs_mode_default(gt) && IS_SRIOV_PF(xe))
>> +		xe_sriov_pf_end_lockdown(xe);
>>   
>>   	return count;
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
>> index f8779852cf0d..53a595b0882c 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
>> @@ -20,5 +20,17 @@ static inline bool xe_gt_ccs_mode_enabled(const struct xe_gt *gt)
>>   	return hweight32(CCS_MASK(gt)) > 1;
>>   }
>>   
>> +/**
>> + * xe_gt_ccs_mode_default() - Check if CCS mode is default (single CCS mode)
>> + * @gt: GT structure
>> + *
>> + * Return: %true if actual CCS mode is single mode, or
>> + *         %false otherwise (CCS in alternate/multi mode)
>> + */
>> +static inline bool xe_gt_ccs_mode_default(struct xe_gt *gt)
>> +{
>> +	return gt->ccs_mode == 1;
>> +}
> 
> nit: do we need this as public helper ?

Currently this function not needed as public.
will move to .c file as a simple static function.

> 
> maybe it should be defined as simple static function in .c ?
>

Agreed.

Thanks,
Naresh

>> +
>>   #endif
>>   
> 
> but the code change LGTM, so with commit msg improved,
> 
> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 


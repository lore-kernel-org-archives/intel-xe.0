Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FCA7C25B78
	for <intel-xe@archiver.kernel.org>; Thu, 23 May 2024 00:39:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D9E410E037;
	Thu, 23 May 2024 00:39:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YrAmVnVh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAEBD10E037
 for <intel-xe@lists.freedesktop.org>; Thu, 23 May 2024 00:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716424742; x=1747960742;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AK3CL7EbUkBCtrlYA6dfv8J3aalCXM0kSEMJsVS1sWM=;
 b=YrAmVnVhPJAE1r2GkS4qzSllsSyVK2CFUO9IMXaQLwJkO5wZGMX/bFWE
 ONQccDTi5KRP/+nGBaoAUo/eTntFy0EWCjR7BVEogU1qq8XC4YB11kAC9
 y2qEXJl/OS5CGguZzrX1Fkv06avXmV+pOD8p/lb4nsCB+dZvUrnB0rZdS
 rVp0e0DZvH4jHIu7/rbj2GBXo4deI7uHQdvMJk8fUABP0c/NfiP6wEn8G
 wK3FrAp2RM7g85LisYiBio4+hux/1enjyFglbhH9FabmW2UvUF3dmRGWc
 kIkXWxnToKTlzPUbljBNucfDPjFTlVDr8R08o8PIp5zIhEj5rBOLatkHU w==;
X-CSE-ConnectionGUID: 5LMvVJEQT2+x2V+YVWp+jQ==
X-CSE-MsgGUID: EyEg5YYfQZ+A8DW66mWpnQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="12547716"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="12547716"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 17:39:01 -0700
X-CSE-ConnectionGUID: Rs2CAXjzSKuvENwBxJ505A==
X-CSE-MsgGUID: sW+Fm9KCRJm1AYnjXeOOHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="37946329"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 May 2024 17:39:01 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 17:39:00 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 17:39:00 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 22 May 2024 17:39:00 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 22 May 2024 17:39:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YP2K2UKGj8XABwpOFkG5ojUC1tLtSeFlRqgUZ7xSjQfN3LjzpgYBS+T9ePQyI2bAfRW0mGbam4vOLnHUzqNq6CTURGj6xv2g77NGSqM5yyZMvv9XdZ/Qiyq2UWrZZjdJVZZm2mdFEqvMzybo5PPbWP0S3DWEQgmA4Sh4xG2ng6/8ILzxZPB0VKOMo1A1lr/ecuTszrbetkTyb6tBagWO0X82PBpbBVPHDNxAVxmYwMrv9m0ajihqz/8MFOIJY/Ukr2B5QdfWmzZjHgfKMIhREUGkf/0PC06TeqxfcSNg4LAsvQSKKhBvKoesnxSHqrJexD+bWtpNalHZYXQ5mngs/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2zG/MLkZ7AAgau2s7gSrTHYC8vtfzQrH9xLHpHbxIgw=;
 b=nzxrcRwdjIykyLf2grGHX4soOwCXETThXwwBsQQWWezSdWse705Nk5rk+/dPJQ32mYTLlMZ8C0gnSgUgix/dpWgrL70BAth86Xm9ki2tLRvuR3Hp2yfXPKLDu6vuAM3WjDFNV3+3UXJVWVCNefCjZaWPizyvaP6j5Uh4Xq67atHdQsk5xDRBcdXKMJAOSqhUa4WF+y3TOJAlGxCbzjL2g75qBr9eJyipMTZQP3bl1WQHu++Xd73SZVP2CGzULhXdaYgNESzTQh9FPxFllbEQA6dgyPogE9igWRqGY0eFZ3Eon+as/sWPiQxIlDoObpKx8Y9/iK3tT6d/CFaRBJ9CPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by PH0PR11MB5061.namprd11.prod.outlook.com (2603:10b6:510:3c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Thu, 23 May
 2024 00:38:55 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.7587.035; Thu, 23 May 2024
 00:38:55 +0000
Message-ID: <572f443d-b76b-4c3e-aacc-ad1f4b5648ca@intel.com>
Date: Wed, 22 May 2024 17:38:50 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/uc: Don't emit false error if running in execlist
 mode
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
References: <20240521114857.712-1-michal.wajdeczko@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240521114857.712-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR11CA0046.namprd11.prod.outlook.com
 (2603:10b6:a03:80::23) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|PH0PR11MB5061:EE_
X-MS-Office365-Filtering-Correlation-Id: d5a72c83-d23a-4844-3b33-08dc7ac0ba30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K1RjeFhNUThQd3c3RnJZOVJCMUlrOEc2VzhmVjljYU9XaVRBZTZhbUxoelJ3?=
 =?utf-8?B?Umx2QnlJQWpFU2pFWlRGRkk3bHpGczI4S3RyK29VNUJtTUY3VmEzVFdEQ2RL?=
 =?utf-8?B?VEp2dlpOK1VsaDRYd0xuWjJjbnV1bWl2WnNwaTcrd1JLMTlWZmdrY281WWlM?=
 =?utf-8?B?VkFsbXBrRWlRY0hDS2xHYzJFSUdpNFI3SU03MEZxQ0tYdlNRbWRnb3FRZlgx?=
 =?utf-8?B?cHJWRFpMTzhoSjhIRjYrOTB2N0VVZ3AweGpUNXA4VkFRRzVxWVJ6Q0RncDJp?=
 =?utf-8?B?MXlnSHN1eFJMbTc1K3BRQjFKdGFOVklwTUVtU3RKNE0xUTlsaW5tYVplVEs3?=
 =?utf-8?B?bHhSL2xIODkzRU8rdi90bHdZVGgzK0tJVU9HTGJtTEpCb0F0cHA3Q25zK2RC?=
 =?utf-8?B?ZTVsUnlyczRkWGFIdVRDZ3Z6amowVGdHK2NyNmxKRzMrTDFobmNsMThvWk1n?=
 =?utf-8?B?QzRURml5aEhMRW82UmFKVW4ybUNDLzNaNDFuNVN1a21WWDRYOEswZEIxajVt?=
 =?utf-8?B?cHhmRmpucndZVm5Cc28zRVE2OGtlcllDdHNCTEEvKzZSRmVkWEFSNWM5MWhy?=
 =?utf-8?B?UzFNckVMRXR6Zk9sVHo5UWpMTlRFUWxXdTBVOFZCNnd0aHFRanBVY2pWOWIz?=
 =?utf-8?B?R0lkWmpzUW5OWWFqOEpCMk84d0RUQi9pU3NkYmhmZUdsd3E0T2dCaXNnV2NI?=
 =?utf-8?B?L3VldSt6b0tTNUNCRkJkeFA2eS96eGx1QmU4b3dUNFh6L2ZGZDM2YUpkU1Iy?=
 =?utf-8?B?Y3B1R1Vld2w0NmtpdzM5dmRxanZQNkswNmJrc0hmOWVZQkpEdythV2JTYWVZ?=
 =?utf-8?B?UGJxRVlTNnVWZU9Kdlg2WjRiZHIzRUFhL2x6d2hKRGJEczFELy93SzJqNm44?=
 =?utf-8?B?bXRLVUJTcHZTSTdJT1BBS2dmbU9PVUFiZEVzOVhPa284V056cWthK0NMbzdJ?=
 =?utf-8?B?VXRUQlBldzNVMWZZS0lqcjVpeFJDTEgweHJaZzh2KzNROVE1Z1JFRzVLRXRr?=
 =?utf-8?B?L21sMXhLeVRrT2E2U2tyOWFhb0JZSHNncnBaMUw5b2pySG1mdXlzVEE0VENs?=
 =?utf-8?B?S1VxV3BzUEhkS2Z6aHViTmFaTjBBUnlqSXBXMzIyZlZCN3ozNW9oYld0ZExk?=
 =?utf-8?B?aXVzNzNRYlluRnBtc2FUc1l0OWhNcFIxbFRFUHArb2wwWTdhWmhUM254RFIw?=
 =?utf-8?B?TTFoa2RyRG1OTVF0WDNaM2lXOWROOFJqS2hxTDd4S2lVb0EvMkF5Q1lHUmcy?=
 =?utf-8?B?K1gvMlhkaHMvNTEyQ216bE5ldkFpZkRZc2o5UW84OGp2NVZZODMvSENQTHpK?=
 =?utf-8?B?YUVJTEpvS04xNjZoUXpxZ0FJZHJldlNNNENBaURiNzJSakROUlhmd0ZqMXZN?=
 =?utf-8?B?U0pudi9HQTdEWHBsaEcvNFlHMkt6RFBlN3BxSnE0eWVEbGM2c2ovTWxHVlZY?=
 =?utf-8?B?TTRFS3JxczJ5TmxiK3hVV3hqcU1MTkh2SkFFRmE1eTFEUDVCbndMK0FWdlBx?=
 =?utf-8?B?K3FQWU81clNadXEydXJubmRpTG9KTkVCYS9KTy9tZ3pvMDhJdzRtZ0thcTVZ?=
 =?utf-8?B?a0dPbVBXQnlFdjN2MVBsaEx6OXAxNlp2UWpQU05tSGUzUVhkSmRNSkdnV0Nr?=
 =?utf-8?B?emxGeTM0bE15YkNma00ybEo4MVRMaE5QdzdkMUpwbnJ6QzlmdXFmcG1sT1hm?=
 =?utf-8?B?M0RQSk1kYTI0eU8xbHdEY0Jnc3pSRTI1OGF3YzArZ3hnMHIxMDR0ZzNnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVV4RzRuR0puUjc5bEs0SkFvSUpjbWhjd255ZEtoeXRncDJNYmo0QmhKZHlo?=
 =?utf-8?B?Z08zN2ZqU1k0MHlENUgwYnpTekY5c0Q4NFpFUldYMXoxUnFkNDAxM2drNkZ5?=
 =?utf-8?B?dDdTSzI4bzBFdnREbTdCME96cUR6VVFnRVl5aDg4SUFwVmQ3eDYweVV4TE5a?=
 =?utf-8?B?eWVmeWNJQWtCd044T2dDVzdSb2Z1dkJ4b1NoNGFkRlV4UmxudDRLaS9KbFVL?=
 =?utf-8?B?RkNIY2N1bXlDajhOWFFiY0xXYU9YeVJNdXFaZDlJZXZUbCsxUUdQcWxpRi9U?=
 =?utf-8?B?QVBuMFlqNHJtcGkxd1pQNnd0RCtna0xPNFJsYkZWd2lZbEVNSEdiRlp1TTJa?=
 =?utf-8?B?blFkVEFPY0s0UDRsRzBMaXlMWnBSbVdoY0xHanFCa2JuZmY2ZlYzVlhLWFAz?=
 =?utf-8?B?cVZHTk9Pb0FaeGtzemVka21lOURLdGY3cng0eEZBcVZSSHoyeEhJTUxicU1x?=
 =?utf-8?B?ai9IWVJabmt0NGJnUWtiY0tRa3lMSUczUjFQMUFrMUZRRlRPREpFSWQ5MWY4?=
 =?utf-8?B?WStJblYvRE5sMHJJM0xGZ2NudEtwMlZWRGdlL3B1ZmRVaEdGMGcrYmVZTjlJ?=
 =?utf-8?B?am5vNklDbTFhWkpUTUpZajhiOWtpcnE3b1A0ZXlTUjlWcHcrOE0wVGV2WnhC?=
 =?utf-8?B?WFR6b05TZy9hQ2l5QU9PS0k0TG5RMzlVS25JSHBxS3JGa2FyVDZwZ3h1L1hY?=
 =?utf-8?B?bGJmdThrL21RcVMvSEN5UVJvY1ZoMG94RjFwM3o4NkhJZGNIYlRsZGcwWkpl?=
 =?utf-8?B?Qmc1alBTSHpWUUpmV1grVnlGaEROdkNHS3BiN3JKRVhYT0VyalI5M3dwVldr?=
 =?utf-8?B?Sko1aUlvMVl5NFYwT09nYjl0TGFOWGIvUDRLcVZLOThRQlF3SWtNVHhtSEtD?=
 =?utf-8?B?MFVxRXB1TWtFTkxGaVdncFA0WE9VMEhIQ0krckxUNkxVNGJqa3dCbE9vSitq?=
 =?utf-8?B?b21hRXdMMVpEUVVSbTlpVWtDTXFraTA0QTNhenc4YjgzS0xHN3dxZ2VFN1A5?=
 =?utf-8?B?RUcvb3o1V3gzekh3dU1SeXUyWmV0SE96UXcvT1ovc1I4TVZSeFFqNGJVRzZi?=
 =?utf-8?B?U09wYk9kTEUzVWpYVlM3Ui8wKzNOc050OVNjckdjSmFvTUtCYjNJVUtycmJU?=
 =?utf-8?B?RmwyczhWTzlJWjR1WlNKTm5mL1Z0T2dOR2pwd2w2WG9XUUNUSHp0MGNzd2Fp?=
 =?utf-8?B?U3RTK0dtU2NLd09WVW0yVUFJdU9VMHNDTGJ4REQyNkIrWFZLdjg0Ymt3WDZH?=
 =?utf-8?B?RWdnK1ZOVTdyLy9OM3hSSXJqSjZ2RTNMQklSWVVON2ZJeDlFbHBudUpvcFNJ?=
 =?utf-8?B?YThyTW1xcjFiR3NEOXJjbzh5MGMvdEZhckNGRlZUTitOMVVGUFZjbmcvbDFE?=
 =?utf-8?B?M3VUUGdSaWNlc0tOejFCMmo5Q1BIaDFwUHd2L2RVSG5OK0dUVTlBR2g1aHFo?=
 =?utf-8?B?YitOcU9VNUNQbWsrZE9GSDEvcWxkM2YxcFdzTUU0UDVlOVBDb0RrZ2REeTlC?=
 =?utf-8?B?OFQ1RWtPaVhoS2ljemF5SXJRSzY5a1F2bE8xcFNlNmVuVS8vVlNoSGQrYXM2?=
 =?utf-8?B?eUhlTzFKZUV3cm5sRWYrSllSazBsL2dSUlhjdzRVUEdaOXlxSzZIMk9RNEQ2?=
 =?utf-8?B?SjlxN3ZBR3VQSWp3UTFCdFBpemZ0VzVSbDZGTGlLRDhRcjZhUzNraXN5NXli?=
 =?utf-8?B?b0dlUzlwVHBSVkVSdnN0ZWVXeCtXZC9jcGtLZVEzT3dJa0xwQ3FMVGMrTWFT?=
 =?utf-8?B?aUtBZ2tiSXpRTE52cktTSlJIOGxQeWNnODNPeXR2U3hMRVpuT0JTVE5wcFR2?=
 =?utf-8?B?VmYvUTJtSENUNzZCeTc1T1hUQnZPSmlnTE1PbGdqdTRxZ2pwVW5ZUGJNTlNT?=
 =?utf-8?B?dmM2SlBmbWphS09lUTdvbVhtaW5ITlpueEg2OXJQQWtwdUlCWGM4b2pxV2pW?=
 =?utf-8?B?QUxTbHZ3T1RpK1RDOWZaOEhCYk1YZ1FRNG9ZdVZOUFVwc1JaREdzeTV0NHZu?=
 =?utf-8?B?SGxNREl1S1ZHYXpKRG1PZUdwTTN3UUJyVnYxZC9QMEhtaFJVQWxhMklWVzFJ?=
 =?utf-8?B?Q3kzKzl1YUVubVZlTElPYzNVbmVvd1VhUzFZeVhpZ3V1OXlGT3hLek93REEw?=
 =?utf-8?B?bGN5NkJ3aWVoQnlDZVl3NDY4K1RYdTAvMllCSVVMdTRmRHdDRGRRTHJscGxV?=
 =?utf-8?B?Mnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d5a72c83-d23a-4844-3b33-08dc7ac0ba30
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 00:38:55.7544 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uKYQAElCJZvU0lU/UELfKZdmxypqnPhdz9DTOultUEFehqC/PSnPA+/qveLS1LIel47hrgvZlYwP0mxWLaM9YdYrskIYbfAvvmFmBGzgLMI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5061
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

On 5/21/2024 04:48, Michal Wajdeczko wrote:
> When running in execlist mode (using force_execlist=1 modparam)
> we incorrectly select the error path in xe_uc_init(), leading to
> an unwanted error message like this:
>
> [ ] xe 0000:00:00.0: [drm] *ERROR* GT0: Failed to initialize uC (0000000000000000)
>
> Fix that by doing early return like we do in other similar cases.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/xe/xe_uc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 0186eafc947d..85808706d1c8 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -51,7 +51,7 @@ int xe_uc_init(struct xe_uc *uc)
>   		goto err;
>   
>   	if (!xe_device_uc_enabled(uc_to_xe(uc)))
> -		goto err;
> +		return 0;
>   
>   	ret = xe_wopcm_init(&uc->wopcm);
>   	if (ret)


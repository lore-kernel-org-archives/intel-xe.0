Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C287C02194
	for <intel-xe@archiver.kernel.org>; Tue,  4 Feb 2025 11:38:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5572D10E0B4;
	Tue,  4 Feb 2025 11:38:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B2eQ0jHn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13B8510E0B4
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Feb 2025 11:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738669111; x=1770205111;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:to:date:message-id:mime-version;
 bh=xFVffu6dJuSmnCGbo4XBmp7o98o2SkbRWzqmmpao+qw=;
 b=B2eQ0jHnhYQwzoLlRVnm/HSjPshQYtkS/+uf55ToDhfV3s91d6icajUs
 DO7/aX/EgRvZ8DLKGD389qj8/jB+9FbeqPCikHPbvASCmUyB/X7eeIviZ
 F30g96VEztLGZVPfQNDn4nB9YUvnpXXUKJcb1I5Ve7JglRpJzBz3ZLQG7
 y2Z5ixs4ExlZMVxEUjzMZqEf8QA/QpTGyfR+jFMIRDg8tEtMzKXOuUosC
 XqsQDgC8hYNgoFhlw7B3tUEDEXR8OX2wKQOLtMKMHOXFrB6AM+w+6nW2M
 sq/MCPUQMkzihqXFR8QBdZlZrec130vnK5MbGDo0vV1xBn7PjK6AJMniL w==;
X-CSE-ConnectionGUID: yLzhjF76Sm2wSrCNyylZsg==
X-CSE-MsgGUID: bhCHjGIzRvCKESqE2WFCrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="39073952"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="39073952"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 03:38:31 -0800
X-CSE-ConnectionGUID: cxDveSKiQGW9x6yP63tHIQ==
X-CSE-MsgGUID: twwVjEtUTxm5DMdy9dpcxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="110412883"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Feb 2025 03:38:30 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 4 Feb 2025 03:38:30 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 4 Feb 2025 03:38:30 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 4 Feb 2025 03:38:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BJ3kH5CoxpeOcZNA9kIowMbg9Al1hepaAzOQMrfOhd+DSJi1Vkt6sY20YfXH6xR6FcpLMw7PXXUsCTDBOF9iJZFUEIrsNiLoPoZfLHYLMKSdff5vW4C38ahi4klTfNjTWAr4KH61WjGgURt7Ge1MqmshCCyidraHTXE4f5zHevteXe0gFZnZNXcOyJhQnOa/VePCKAYGZDKm5PLrwH41QLyFgIr/aa9GnkxTOOOtmfeYpFOLcdDRcmRlPha3wLFQAED1PnCddrnRjW8IhNobjPRdmr1BO8+NKV8pWrBr5LwgylqLLTfkwvj5rCCa2avbIGrijL3Tcc5KyuiyqCrJHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N7OX9asjeztz39xRHvgMEWoxCYeNLNX9Ozr8WweDMXU=;
 b=vg7iDejwtuKe07gp/m11F1gYxZjmBpcoeSH7BmUONSVykho/YhAaQ8v1rvALb5h7vt/yIM72yOj+8EZMURCXQuc8sQhr4S90fS6vUxTXhH6zLd5l/8JgzqAoPIYOykbzUmaRmQIaSp8THPWLRHeCbc8SpZHntxE5D/AUUxy+wr6yYEF3v6enjh6cx+IfLmzbZoRRVLf7aw5YEXHI/nlBiTwK8SLIiAlQ/RXppXPtGEymL27Ow3/QV6woiE3f/mflAO8BlgZ4UQ+b2xmI+L66C4+pvz6otcMiPtSIrcVaLyVxyUpbGl0JKT5tkOKtmsJpZU0Lpzc/Lo7FDgeODO6CCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DM4PR11MB6261.namprd11.prod.outlook.com (2603:10b6:8:a8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Tue, 4 Feb
 2025 11:38:28 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%5]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 11:38:28 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <173862856468.580579.24842388563941054@b555e5b46a47>
References: <20250203205941.251754-1-gustavo.sousa@intel.com>
 <173862856468.580579.24842388563941054@b555e5b46a47>
Subject: Re: =?utf-8?b?4pyX?= Xe.CI.Full: failure for drm/i915/dmc_wl: Track
 INITIATE_PM_DMD_REQ for DC5
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 4 Feb 2025 08:38:26 -0300
Message-ID: <173866910693.77773.9012256661431626045@intel.com>
User-Agent: alot/0.12.dev27+gd21c920b07eb
X-ClientProxiedBy: MW4PR04CA0308.namprd04.prod.outlook.com
 (2603:10b6:303:82::13) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DM4PR11MB6261:EE_
X-MS-Office365-Filtering-Correlation-Id: 4009d0b4-55f0-4635-0490-08dd45107172
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|1800799024|376014|16122699012;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R2VoTmZmTmxrSk1mZDJCcjVKdlJKL3g1VkVZVTdlS2Z2NkZNYzJCTWlWUkVW?=
 =?utf-8?B?cit5NXY4QjZDREpmRHZFOUJJQm8wbEt1MVhqTW5PcmhNaVpqcWRSV1ZCb0U1?=
 =?utf-8?B?Rk12MGYvWXNNVHlZbDZMT1RSRWZqQWJaNG05SXBBNE1PUG5RSDBBUUE0Lzkv?=
 =?utf-8?B?OC9PMWtGaGRCdy83cms2ZGo4eHkwWWJCR0NJeWRBYkhCZUJNMkt3Y2JzUUVp?=
 =?utf-8?B?MWZubko5ZzBaV3p6VndMb2lQTy9hYlhUMTJzTTZncUdDY1ZteEc2d0JXYkFj?=
 =?utf-8?B?bzJ2aUkzeFk3Uzc4VEVJOUV2KzhTSTcyR1RoNmt4RnZFNG9GTnQ2MkFwRkVP?=
 =?utf-8?B?RzM3cmpka1poK20yVHVuNE5Eb2ZPT2QzSUdLVHBrL1BkTkZsVXozcEtvWWZl?=
 =?utf-8?B?cFBoNHpDR3BFNk42N00xZ1NNMlY4Q1N1L21TMEJGQVFSRk1JYUdTTDhScldJ?=
 =?utf-8?B?ODVmZ1J4WG5hcGMvam5aVG9HcTJURzJQK1JyVU9KZldqL2drN21RTDc4ZVFs?=
 =?utf-8?B?bWxITXRIQ05seVQ0MzV3UjFzWlB6SXZlbThQV3JWVkVaZlFDcThvWFRtdGNz?=
 =?utf-8?B?bGRWdm8rUVRKYktSekt2b2ZOR043bFplWmdtL05uMjNuc3ZxRkxyZ1FicnFW?=
 =?utf-8?B?dUJTUU9hck53bnNWZk9wQmZCbnBMYWRvU2U1NXFPVU02Y21QMFR4bFJpVEFK?=
 =?utf-8?B?OU9CRFJlV1pjMWpJODBSV1ZESEI2QVNPRlo0bGdUY1Fka1ZNVzJoczRYMkpi?=
 =?utf-8?B?YlFvSmNoVGJDRXA2SHc1QW5aaE9NcXg5a2lqWSttZVZyY2EvY2o4UHllOWto?=
 =?utf-8?B?ZkNyOXlaUTR3Um44VkVQb0JpNW1zbHQvL0tTWGlRSXdrd2dtZndjWi80UTNo?=
 =?utf-8?B?QWZETWFqNVZZVHpHeFZkcE5nK0NJL2VCMEx4VXNSZmt6aTZOdXEvOGVYdmJq?=
 =?utf-8?B?UVZoRDREcFZFVjU1Z2dpWFh3UmR5RDJZcFJWMUZGVmlnUVNvcmFYeTkzNnkw?=
 =?utf-8?B?SnR2enhZWG5aWFA4VWtWZEpGOGtPZ3BLYWR4c1YrNzE3bWNsNEhJcjlZWk1W?=
 =?utf-8?B?dVZ3bzRZRFp3MjZVVTBZUGladytidTRKZWZ6UmhiQnFTVmtWd1RqYUZGZDd1?=
 =?utf-8?B?dTlicldtRUJZd01BYkdQMGkyTFNOL0dYVndDdVcxMTQ0aXpMYVpmOFFuTlBX?=
 =?utf-8?B?enJYTFVPSitiMFlObTRvLzliSWNtdEtRUlRBOVUxNjA3TnMvQmQ1akdMYUNi?=
 =?utf-8?B?NmhwSHFOQ0dYYUExRFBXSExZT0g4MUNacW5LcG4xcW8rRS9MeWZ5ZzMvTlN4?=
 =?utf-8?B?NzkvcVpmWG5qUk41c2V5NmJFS1YxaCt1L0Y3Y3ozS3dmcDhsM0tWZmpxWlNj?=
 =?utf-8?B?Z28wTkRHVlhJWDUyRkFyNTl3aFA1b0p1dlRYQkU4TnlRVUxqcWhuN0VpKzgv?=
 =?utf-8?B?YU9KbWtjdGQzTEtVeFhJQ3pEeXFDU0w1S1ZjMWFVUks3SHN3SDlwbHNQK29G?=
 =?utf-8?B?TGVYMEZwSjY5M01zV2tWeXoxaUEwYW9JQU9kQzFDK1VoU0JWVVZIQWJVN2ZM?=
 =?utf-8?B?T3BWKzI5eGVhMjNheDN0eU5UT3FJVUdsdFFVUnN3eXZ2cCtTOHVvNDEzQ1F1?=
 =?utf-8?B?d1hSZUwvcEZudWdpQ3VPK05YTHBBTDNkaXZyMVpPYTRMVkdWeWlDdXdPNTAx?=
 =?utf-8?B?T3Y2eWc3TkVERzV6dGxwUHdvdHZHNk1PYk1qQ3AxTktBTmJPSFc2eXFad2Rt?=
 =?utf-8?B?UENwM09Uam9LMlFlelprMFBNMHZ6NVN1RG1kTXU4R05MRHF0dGs3TmVvU2lq?=
 =?utf-8?B?a08zZTRRZVZvK2ZJWVMyNTJubkw4dHpESFQ1VWZqWjNBZ2pneHN6QUxUZzJh?=
 =?utf-8?B?VE5qVGNwQTZuN2ZQMVovRTdZZU9nT2k1aW5PM0FhV3o5Smc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(16122699012); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlVUUVJhbTZFNlowUkpVdlZzeEQ1elJLRmsyMFdzRDM0R1c3VFBrdVgxUXNj?=
 =?utf-8?B?V3BhMXltNFN6QWZoMjExNXJ6SGwrU3BRWCtjMFZzMHE1YWNGMUVMdzNRMkN5?=
 =?utf-8?B?WUdmOTZSaGNJcXBYZWlqcmJRRHlkREpaSEd3bVphZFNGUnc1RWJJK3U2VG1y?=
 =?utf-8?B?bW5IZDFOWjFMNVlOSU9ucXFDTitQR1ZJUWxsdDA0QkpndDJjNTlIVHlqSTlJ?=
 =?utf-8?B?K2wwNWZUMTBxa1haRGI3bjFEWGI3R0w1L0RzVHRyc3NqRitUb1JrbUZsQ2R3?=
 =?utf-8?B?R3N6b3BiRHQ1N1B6RStSMkV6L1lvWkNQeXFQaURFaUlkeDE5a2xvazdFLzQ2?=
 =?utf-8?B?dmtsTTJUU1lhSHdLYUs4Wmp2R1pXcmVpUm1LVlRMcUpiOURxVHFhTDBwWUQv?=
 =?utf-8?B?VVEzZjB2azJNc2IrT3hrRUp6MU5oQy9ySWdhYmUvZW5vVHdvdm5nblMzK2JD?=
 =?utf-8?B?UE9BeWFTb3BSSVQ2blZ0SUdTZzNzbGdia0ROdGN1ZnIvM2tDZHpmM2J4Vk04?=
 =?utf-8?B?OEMxS2tWYnRta0loMVI1aHNuNGZqTjE1c1RLSC9POW5pTGVSMURaek8weklO?=
 =?utf-8?B?VWlvWkdIbFphNStjakdKdXRFVXRjdXlNUGREdDREcWNLZzFGMHB2UE5XOG8y?=
 =?utf-8?B?NEkrWm52TDM2V1pxOXdPRXdNcUhPeDNSWVd0dHZOeldUZDlZV0hFcFVBNlUx?=
 =?utf-8?B?RzZNWlRRNDUydDFhbTRBaU5yYzIyeUNJZWJmTEI4Wm14QTlHSDExWHAvZGFu?=
 =?utf-8?B?MzFlNTVnUFVYNGc1TGlGN0dJaHB4OTZYOXhqdlE0dzNNVFp5N3lJR1ladnRH?=
 =?utf-8?B?OEQ4cDQ1NzZmaVpRVlJ2cXYyM1R0bnh4aXRxbiszbkI3ZENBL3RwR2JHa1hG?=
 =?utf-8?B?T2RTYkt3OVlTNjQrdXp5OFNNYmJETU01WlNBNlBKTWpKWk1pNnlCTnNuRnMw?=
 =?utf-8?B?Wk10eXlYdUQwZ0JlV0RLd3FIbnQydGk5L0RPTWdnVE8vbENRNlJHS1o4S0l2?=
 =?utf-8?B?NXlCMmhuVHZ4ZHo0WHpPeU9aK1J4ZGhrclRUbWU5OUxsb1hSNUlEaithUDZs?=
 =?utf-8?B?THp4RTdCa3dYOXFqSGptRUZBYmsySXFlekFCTGlpaXJkZE9iaUNaYnN2NCtS?=
 =?utf-8?B?YmdvSzc3WWVPZlpHWm1KbzNlaEdNQ3BWZlA2eVM1akdNWWxseDZ5eW8xc2hJ?=
 =?utf-8?B?QWVjTGI2bVVlUmdsUjdsQ1VjakFrbHgvRDQvTmdoWkVsRys0YlZxU1NYUFBK?=
 =?utf-8?B?QmphYW53RlJxREkrUEpvd040citrSUg1K2EyenNuMnlwNHc3KzNiN0FUZEVF?=
 =?utf-8?B?bzRJeE1PSzQ1U2VZTS9nUzcxcUw1VXRya01SZFlReG12ekZTTU8xVjhYUFZv?=
 =?utf-8?B?eTIxaTg0djhOcUxUYStvMkpXOERFS1NHdlQyNnFWRld5T3p6MUpVNG1TdWsw?=
 =?utf-8?B?elQxMHNjY1Z5VEpLOU80TEJxVml2dTF1b1c1bWtrdkNidzkva29Wa3dxNUgr?=
 =?utf-8?B?VEc0QmVSWlZYa2wxRnliNnZUc1Fia1pkUHFMNTN1d21lYk15SWZRSTMxOEhh?=
 =?utf-8?B?ZmNHWUNHZzdYL0tFTkVVNU52ZmVKTjZuT1BpUmNEU1lubGJzb2tSdHU2RzI4?=
 =?utf-8?B?WnlZWlpZU09OVk5sV0lZY3RMaHVnMm1TWFk4WDBObUxzZHBMb1d5NEh6ZXBp?=
 =?utf-8?B?bGoxZTFlNC84aVYwQmMxWDVqbWQ2QXNxQ1JyUXV2TDEzWWdVcFdYbW82cnRF?=
 =?utf-8?B?K1JhZWZmdUJpck1LSDd5SzR3YTNydmNMSmJwaVh6bWt0N3hyVytkMnFuaXhU?=
 =?utf-8?B?S3gxempHWmdRM1VXVlc1UHhjQnRCQ0tPdzJqbTR6OExBdFo0V1BmTmkxRmQr?=
 =?utf-8?B?a0Vrc0pYV1ZIK3RYN2FrUzhLcXcrc1VWY1dRdGRyMlNDR09zbGExU0dreUNV?=
 =?utf-8?B?emtMWEFSLzhrcVA4azNGSTdVTWptallUZjBoUTFMbktjMHFBQmxEdjZBYkJi?=
 =?utf-8?B?QTcrM3lxNFJVZE0yYVg2MUF1WG4xOFJ5NTdaVXE4c000K25ETkdMRDhjU1pN?=
 =?utf-8?B?NllKam1oNzhiUlQwbFlRV3dKZG56bkNBcDQrWEE3clpYQ0U1WTlTakNGRzM2?=
 =?utf-8?B?L2Z3Y1E0WkQ3TmZUQmY1NHpPV2pENE9FbmF0MUkvNXh6NVpKWGRGZ09BellH?=
 =?utf-8?B?eWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4009d0b4-55f0-4635-0490-08dd45107172
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 11:38:28.2594 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MXn7fYuvO/hQ2GfIrMZmLxqG4n685mhb3wfPomtFjHzlZAxRETXiuCKgYi21E7BLRT8OSHcjNRfnmuLW3UQdiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6261
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

Quoting Patchwork (2025-02-03 21:22:44-03:00)
>=3D=3D Series Details =3D=3D
>
>Series: drm/i915/dmc_wl: Track INITIATE_PM_DMD_REQ for DC5
>URL   : https://patchwork.freedesktop.org/series/144277/
>State : failure
>
>=3D=3D Summary =3D=3D
>
>CI Bug Log - changes from xe-2587-e4653d321048b16b1373c8ddf0657590963c5897=
_full -> xe-pw-144277v1_full
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>
>Summary
>-------
>
>  **FAILURE**
>
>  Serious unknown changes coming with xe-pw-144277v1_full absolutely need =
to be
>  verified manually.
> =20
>  If you think the reported changes have nothing to do with the changes
>  introduced in xe-pw-144277v1_full, please notify your bug team (I915-ci-=
infra@lists.freedesktop.org) to allow them
>  to document this new failure mode, which will reduce false positives in =
CI.
>
> =20
>
>Participating hosts (4 -> 4)
>------------------------------
>
>  No changes in participating hosts
>
>Possible new issues
>-------------------
>
>  Here are the unknown changes that may have been introduced in xe-pw-1442=
77v1_full:
>
>### IGT changes ###
>
>#### Possible regressions ####
>
>  * igt@kms_pipe_crc_basic@disable-crc-after-crtc:
>    - shard-bmg:          [PASS][1] -> [INCOMPLETE][2]
>   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2587-e4653d321048b16b=
1373c8ddf0657590963c5897/shard-bmg-8/igt@kms_pipe_crc_basic@disable-crc-aft=
er-crtc.html
>   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144277v1/shard-bmg=
-5/igt@kms_pipe_crc_basic@disable-crc-after-crtc.html

This patch simply adds an offset to a table and should not affect
platforms with display version < 30, so the above failures is not
related to this patch.

--
Gustavo Sousa

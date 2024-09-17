Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A4A8C3ABD7
	for <intel-xe@archiver.kernel.org>; Tue, 17 Sep 2024 05:49:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D85D10E410;
	Tue, 17 Sep 2024 05:49:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U/abIhR0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2896010E410
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Sep 2024 05:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726552139; x=1758088139;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=39FfwbwzEjz2EW5K8QNI9gpWfveaJ0y8wufEjw+PLws=;
 b=U/abIhR01KDBWYY6yrG+7dUGxFFw1NTlxMe7YHOSVDbZwxcwo24L2EN3
 Es2zL51wtWvGqWOO8Ftc27kvqo4JNOMwx0PXEqpOsHHAHl/Ys6ae5d79C
 FxXTc3jSHOBhlVUl0o1Uekn34jfqZ3LRSp9TW8FL2hXY7zA/6jJ03jRaa
 WodhlgWdWRoumai6oxCl+TGEhiLqjydvoeM6/wMjsgOsX1DtxwEVGMCGd
 P6IJmvM52zlcFCXkxyqT30snfQ/d4/XSlGHceJQ3D1MsOQp7oLKaWvRmd
 Ub/OasuaaZQODD5cgeOPP8WytX+mX2ODKbgSDsmez4CX2J1LO51iPmSre g==;
X-CSE-ConnectionGUID: it2PTQ/URDKqsj4GUNmfLA==
X-CSE-MsgGUID: aa1yg9OKQmC2WLPihYjT/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="42871309"
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; d="scan'208";a="42871309"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 22:48:58 -0700
X-CSE-ConnectionGUID: +9/kkgV7Rh2ItZdsP7IbpQ==
X-CSE-MsgGUID: J6TNa/tQS1uhG4HTxWR/fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; d="scan'208";a="69312623"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Sep 2024 22:48:58 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 16 Sep 2024 22:48:57 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 16 Sep 2024 22:48:57 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 16 Sep 2024 22:48:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HdOn+V4ITexpG14nR9u336XH6X1l5Mqqf8aFcNelXwLFA1B28iE/4PcX6vIpAkDWhmVYCohpLrTMuv9GAHY7SUQo5sXm4riuREFZLVMqnKZrK7T5Zwc2hLrcu69Ztw601Q8klBtBpypXbQuK5d8SAdIoZ9onggmWfdyhQOz1S4VuYy4VcPnIeNaM2SU3GXoJlcYXxEPh6uz6bOMOTQ+lIwHWu9ymgN8FmSFNkR3scF/XC10dJf320g5Mjf7sdLbeW0zjd4TrnyHNbMFmIRixsG+1sfxkDis/RsSapi4oTxW+Qr1/NqX7eQr/mRFeCS0LOaFNEubxYKJ0IGUxlfeq6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pwH84LjMW+zd0tT06KptxmbnNNBCR9R2HJdL6iE90Vo=;
 b=B/+1wnB51IljzFzKzPSK9C0YuMcfctvxy0JLPe2qej1NEmGCoRJCTS2FZ/yXDDFu6MBd9u+43rxO+KNPy87aIAUqYo2fFaQNSxdd+Zf7Ro0EDeCNRsuX9YCbNKpUcKWm35mcv434ASFGA9jCsNnR1+g2QNoPLVXlQ3qn9sIsWl7kkOCfZQCl3q2b+DvSO7zDWboIv+3EX17etf1BG9xpyZO60cESKmjVhy7GKpLyoYNr3BOnt/mKgylJm2GHCxekDpoxA00OjNPd1P+Ox3BARDHT4w1ZxO76hBZOy1QUZHTbb5DxaSB5xZB3F03fv3GbvMz21U5CwhBQDWKXkM42ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by DS7PR11MB5965.namprd11.prod.outlook.com (2603:10b6:8:70::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.20; Tue, 17 Sep
 2024 05:48:55 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%5]) with mapi id 15.20.7962.022; Tue, 17 Sep 2024
 05:48:55 +0000
Message-ID: <7d1e6ccc-3dc1-4cdc-a30e-f0f1b0f12193@intel.com>
Date: Tue, 17 Sep 2024 11:18:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/23] drm/xe: Error handling in xe_force_wake_get()
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
References: <20240912191603.194964-1-himal.prasad.ghimiray@intel.com>
 <20240912191603.194964-2-himal.prasad.ghimiray@intel.com>
 <ad2bb8fa-bd4c-4880-b4a6-f3483e6a2b7d@intel.com>
 <31983baa-d613-4a79-b39b-3d315b87a14d@intel.com>
 <6ea536da-fed3-429f-82d4-f118d53309dc@intel.com>
 <4853d43b-0eb2-414c-816b-96e25bc6d604@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <4853d43b-0eb2-414c-816b-96e25bc6d604@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0063.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::17) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|DS7PR11MB5965:EE_
X-MS-Office365-Filtering-Correlation-Id: 38461618-b434-4400-fb7c-08dcd6dc6a7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bVNUcnFldFpZU2NGa0RWb0ZFOXFjUXBjQzlPdzhJb0RZeXRNSFhzSytrYnkz?=
 =?utf-8?B?SkpKN3BDMm9Jdm90Mk8vT0Q5eFBhODZ2RFNWTGZFQzM2TlRXSzFzUVNFaEox?=
 =?utf-8?B?YStNaFRxSjVCVXZNNjZiNkZMVjJjWUZvUmdkVERzR01QYWFsVTlHWnVPNmFu?=
 =?utf-8?B?aG42UTVzalZibkZVM3EvVDdkVWtYZFd2SWNFUk5jSVBacHIvbTNJdGpTYyt1?=
 =?utf-8?B?SEoxMGkreG1LUHB3aVlOdmZFQlg5S2pHVWlMVXZITFFBMi81Njl2ZFBpczlZ?=
 =?utf-8?B?TlVkT2hBYzROUEdNRzRRaXVMZDRlRGJLdTA1UHlQZjBzU1k1R3hUZ0VSZk51?=
 =?utf-8?B?dXdRTXBBaHI0cFB4RTVUZDBpL2NkZVlDTFFDSXk3T1dDejM0UVJXam16dVIz?=
 =?utf-8?B?U0VzZEkyV1ZQZWxMdW1tZFVXN2FNeHp5RVdjYkFlNnN4S2ZDMmRhRjlDWjZG?=
 =?utf-8?B?akhZZjJFYXdhMVlYbm96cjZLNk9SaHZLcFo2cThCUVRuS0RWRlJObHh2K1pq?=
 =?utf-8?B?OFdDdjZXZXovOGlJMFVIRkxIdlY5b0Z1NVROZDdyYUNlZFlvZkxFY3IyeXpM?=
 =?utf-8?B?ZXFxZytybjZlMlVNYjhDRCtKWlljWit4RFhpTHY4amhRa2p4ZFJQWWtyenRT?=
 =?utf-8?B?cVZ5YkdVVW1yR0V3bkpPV2RUWHJQbXFnY25ud3JBMTZWbHVVZUlpOXhuUysz?=
 =?utf-8?B?SW0yTy91WVZ6NFNoNU9hZnAwc2NxMUx0Rk12Zm05UUlqSk52TGlaVVE4UnIv?=
 =?utf-8?B?WGxpNy9uNGsyQlNGOU9mb2pOakhBZ3p0VlJSbTh2WUthTjQrNSs5YkFDVm5z?=
 =?utf-8?B?UFZaTUNFaGFSU01FWlU1aElyWDJIODhFY1UvYnhqZXc0a3hscHc2a2xQL3ZK?=
 =?utf-8?B?LzZLM01RNmd6OHprMEUyTnk0L2VXR0FnU2d3OUY2djVNTVdBTHlSOEdYaklL?=
 =?utf-8?B?SkhieTFoT1ZkWDNBWmhpbmQ4M3I5am9HUEVSUFgxRDl5Y3RxUDhERjBnYXNK?=
 =?utf-8?B?Vm5wU1Zta1dPckt1Qk5HY3M5eWFRZlAwaE92TUZFQ1QxWmlLNXRLbzlTSStG?=
 =?utf-8?B?TjdhVHIzdFA4R2hSODUwMWhSZk1hNVpTZDYvS2JNaC9VSG9va28vU0dZQlJS?=
 =?utf-8?B?Wm5sTDBFY2dSd04xWW5VS3Vhbkg2WlNYTEhUdUErUW5QK2ZEc09rSW1CQ2pJ?=
 =?utf-8?B?NExuV2pOMURRNzVvaXQyQm03UFVCVDNYdTJIYXc3Q2RUYlNyNVFVKzJQTGsz?=
 =?utf-8?B?NVpEUmJBREFhU3JTSFJ6NGVJNTUwN3ljRVJjYWZtQklqUHZTQXVhbERSbVpQ?=
 =?utf-8?B?WXZDQ0lUdDdHaXlQZGhhS0dJVE5HbXUvdXRZZnp4ODM2QlFDUEpZTFhZc1Ni?=
 =?utf-8?B?MWpIQVVMWFNMVmFsenFHZmwwd29pRjk3dS82NTJYSHR2TE5UeXJSU21BcTRY?=
 =?utf-8?B?NnZ0TkxNdktiM3dLdDFncEwwNXRZKzJMZ01XWlMvYVJrbzVVMEl0MGp5TmFy?=
 =?utf-8?B?d29raTRXVDZDd0ZOaDREUVUxaWFBNVNUTjFFd3VaN0ZGUnhVK1crdWNiYzVt?=
 =?utf-8?B?ZWtoczhhWThlZ085OHVEb2M0SHZjQ3kxWmRWamxQWmQ5ZGxVejJtdEJ5bk5n?=
 =?utf-8?B?SlUrbXpVUEI3ZlVUV1U4eU1Kbk5BcUNpOEVpUGVXeTNSQmg4VHZVR3dGQVBk?=
 =?utf-8?B?cU1BVm12Wjh1UnlOQlljNXZQN1NPK2pFWktLYzIyamtQN0t4RWcyODU0RnlP?=
 =?utf-8?B?dkREdGhxdnhzL0tidkRPbS9WN1VaSU9SR1ZNMDdHVmpvRVZSd1JtY2VMMHpR?=
 =?utf-8?Q?oPSZg+N+1R1iXUqB7lLACV64/JIG6l475RSz4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkJpa1RrVFB3N0RZcnNFWTJMQjV0RCs2Qk9ZZGxtUXFaVDdCSGVsSUluUlNp?=
 =?utf-8?B?bERpc2Z4SXZnOGVQcHFXMjlMcXRPTEloWGZNbFF3emtDZ0l5aTREd0ZxNTJ6?=
 =?utf-8?B?QnBMWHZVV3pMVU56K2FVMkx3N2dGazNkdGNxYzRxSmx4em9tdk50MzNpcE5p?=
 =?utf-8?B?UU5nVEx4WFY1Smp3dGZKMEw1MjNuWFRrY0dUeUFyT0E2WHpNdjRva1N4bmow?=
 =?utf-8?B?K3R1S1dWdURyRW5IMitFNkJlYk5oODdGSTdQWWllbU13d3ZFaEQxZHJsaUsv?=
 =?utf-8?B?elRVMzFtcExHckZYVG9TdmxYWGQ5K3hOaklSR0I3cjhub1BMZ2c2eXdWcStz?=
 =?utf-8?B?c3BGdk5iRGl0aC9UUkhxWFI0eGZ0T2JSZ2hJZTdwdDA1aEZjVHlNMjVKZkV3?=
 =?utf-8?B?cmxGT25rVDVEb3dabUp1UXFuVkt2ZnlBQWxDUERFNmZPREJwWjBYOEdyQ0dW?=
 =?utf-8?B?TnFBcEVZUkZ3cFpjN3NaTytYUWdjQ2ZucXl1cXV3MEptQmpLSkxrbndwTkdv?=
 =?utf-8?B?ck1ibnc4Vm1BVjVKVDlYVVkxV09ldGsrWE0xRUVnazA1VEpUTlNybW9iM1ZB?=
 =?utf-8?B?V202UnlCeFlKZWRGNmJPVG03WFlob2NGaklYN0R2SHMwSS9ob1NRR1dldFVo?=
 =?utf-8?B?QzFSeXhZa3J5R2pGSkRvcUNEcGdMcDN5SXFrbW1vdU4zOEZGYkVUSDFnVzhu?=
 =?utf-8?B?ZGNKVkY0TnhTZ2EyQ1pGMzFobFd4OFd2aGphNTkxcWtUR21NOWJMVm1oenov?=
 =?utf-8?B?NlJDOTlvbUxMT0wvUEpFU3B6R1M3cFNpaUhBNGRiN3lTbDJZWkl2NnJYcEdF?=
 =?utf-8?B?aVpmdkFPa3dnUEc4OFNzeHBSbHFmZHhaZXMzM2ovclVhRUl5WXBnclZhaHhx?=
 =?utf-8?B?SGx3aEdaUkNYTHUxenhCNkttRDVVYUVLS2ZyQlF4eFlpSjcxTlhya241YUJJ?=
 =?utf-8?B?dE5yQm9GTElGcHU1M2tEVzdGUkEweW10MGkyWDVscVdNdzYybFZOUTZJalhv?=
 =?utf-8?B?aiswY2JaOG4rTGFzRjJ4NUhJbXk2VzRtR1ZHVVlMZ2hHQUNadi9nM2JOQ0Iy?=
 =?utf-8?B?N1h2bUFPVW9uS1JKNkVkVWxtaFdaejQra3JDd25jNkx2QU1FVk9yMHI4MWgz?=
 =?utf-8?B?WFZLVEE1eVdkTjFwWmRUMStWRDBnZkR5OVB6RS9pbnArcWROREgxbE42by9J?=
 =?utf-8?B?RDkrUlZCd1RmQ3hWdTQxWmJMSE1ORVJhQTdYTDY4NWlva0hhZ1VLZFp5akF3?=
 =?utf-8?B?RXRIZS80NEc5cDVtdG5YdFJ0T2dNWGRrYWdRTHl5OW9EeHR5Y2RpbXpLNUwy?=
 =?utf-8?B?VStYdHRETFUvVWJyb3VtbjVFVlIwdGNvRDNyb0E4SS9mR3loLy9yQkJWY0Vl?=
 =?utf-8?B?aE1NL3RyTUVvWktMWlE1d3hLMmFPTFAwc2ppNFRiU0hjK0hUT2FBb0s4b3NN?=
 =?utf-8?B?OURGdnNtdy83UTZMcG1sUXFFUXZOR1ZPYTFERW1uMnVvMHhTUUtZL3BpSXF3?=
 =?utf-8?B?dDFydDBOdEt2ejdDRkFLeUljVnJEb0NNOEJYSDFmTHlNTzhlaS93Qk5mNDQv?=
 =?utf-8?B?VGhSOUlzUEw4UWhVT2hzc2tmQW54aHNhclc4ZUJ1OXNGbGExZWY5a3VHRUhD?=
 =?utf-8?B?SEpUZ2FMQzFBZ3NLbXgxeWQvMVY1dWpVV3ByVU1sYksrUy9QY1FOamVHSkgy?=
 =?utf-8?B?Vm14aHk5TTJLNWYzR3N6U2F4eS9semVLRE1ldE1VNDhZMTBRaXBHTUt0V01V?=
 =?utf-8?B?RGRFZ3FzRm8wT25jMTZDMUNJOWlNSDQ5UTcwb04vSkF1QjZPV21zUkp0aFpi?=
 =?utf-8?B?aklUMTNvQU1YVUEwZUErS1l3VDNSaTJXN0xQd1lTQkxzY1RUT25mWndhKzVG?=
 =?utf-8?B?WGZGZFJFeUNxMGdyL2x6dWExVUZFQk1ZOEsxSFBaQUtkRnArTWxia0JXaGMz?=
 =?utf-8?B?bEJKY2dQZDE4VmcxV2NTc0RyRDQ3M2h2N1hxVmsycXFpOGRzNEg4ZUZtSDNn?=
 =?utf-8?B?cmlzNy9WMjdyYzlJaUNwQTR3VHZjN25SWURVejl1Z2t1MURHTjZyOXI5ZFJj?=
 =?utf-8?B?QkJnRlZRWG0rRGdmMm9Pc3lUdXpoWHM3azU0Z1hHN0xaR0t5RjM1V1RNNjd3?=
 =?utf-8?Q?DmRD5++DIfbkDdq+6aGYbm600?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 38461618-b434-4400-fb7c-08dcd6dc6a7b
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2024 05:48:55.0750 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NuBjq5C35PyV3s9R2yS8iHqSZewfXCNKpy0n7Ap20EggKvGxvMTyuM+0ouZ9Uxx9zTTMd28eZq8K3vourK01TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5965
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



On 13-09-2024 18:47, Ghimiray, Himal Prasad wrote:
> 
> 
> On 13-09-2024 16:56, Michal Wajdeczko wrote:
>>
>>
>> On 13.09.2024 05:59, Ghimiray, Himal Prasad wrote:
>>>
>>>
>>> On 13-09-2024 03:01, Michal Wajdeczko wrote:
>>>>
>>>>
>>>> On 12.09.2024 21:15, Himal Prasad Ghimiray wrote:
>>>>> If an acknowledgment timeout occurs for a domain awake request, do not
>>>>> increment the reference count for the domain. This ensures that
>>>>> subsequent _get calls do not incorrectly assume the domain is 
>>>>> awake. The
>>>>> return value is a mask of domains whose reference counts were
>>>>> incremented, and these domains need to be released using
>>>>> xe_force_wake_put.
>>>>>
>>>>> The caller needs to compare the return value with the input domains to
>>>>> determine the success or failure of the operation and decide 
>>>>> whether to
>>>>> continue or return accordingly.
>>>>>
>>>>> While at it, add simple kernel-doc for xe_force_wake_get()
>>>>>
>>>>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>>>>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>>> ---
>>>>>    drivers/gpu/drm/xe/xe_force_wake.c | 35 ++++++++++++++++++++++++ 
>>>>> +-----
>>>>>    1 file changed, 29 insertions(+), 6 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c
>>>>> b/drivers/gpu/drm/xe/xe_force_wake.c
>>>>> index a64c14757c84..fa42d652d23f 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_force_wake.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
>>>>> @@ -150,26 +150,49 @@ static int domain_sleep_wait(struct xe_gt *gt,
>>>>>                         (ffs(tmp__) - 1))) && \
>>>>>                         domain__->reg_ctl.addr)
>>>>>    +/**
>>>>> + * xe_force_wake_get : Increase the domain refcount; if it was 0
>>>>> initially, wake the domain
>>>>
>>>> while likely this is still recognized by the kernel-doc tool, this is
>>>> not correct notation for the function() documentation
>>>
>>>
>>> I assume you are suggesting %s/xe_force_wake_get/xe_force_wake_get()
>>> will fix it.
>>>
>>>
>>>>
>>>> [1]
>>>> https://docs.kernel.org/doc-guide/kernel-doc.html#function- 
>>>> documentation
>>>>
>>>>> + * @fw: struct xe_force_wake
>>>>> + * @domains: forcewake domains to get refcount on
>>>>> + *
>>>>> + * Increment refcount for the force-wake domain. If the domain is
>>>>> + * asleep, awaken it and wait for acknowledgment within the specified
>>>>> + * timeout. If a timeout occurs, decrement the refcount.
>>>>
>>>> not sure if doc shall be 1:1 of low level implementation details
>>>
>>> Does this sound okay ?
>>> This function takes references for the input @domains and wakes them if
>>> they are asleep.
>>>
>>>>
>>>>> + * The caller should compare the return value with the @domains to
>>>>> + * determine the success or failure of the operation.
>>>>> + *
>>>>> + * Return: mask of refcount increased domains.
>>>>
>>>> if we return a 'mask' then maybe it should be of 'unsigned int' type?
>>>
>>> Agreed. Will fix in next version.
>>>
>>>>
>>>>> If the return value is
>>>>> + * equal to the input parameter @domains, the operation is considered
>>>>> + * successful. Otherwise, the operation is considered a failure, and
>>>>> + * the caller should handle the failure case, potentially returning
>>>>> + * -ETIMEDOUT.
>>>>
>>>> it looks that all problems with the nice API is due to the
>>>> XE_FORCEWAKE_ALL that is not a single domain ID and requires extra care
>>>>
>>>> maybe there should be different pair of functions:
>>>
>>> I am not convinced with different pair of functions:
>>>
>>> In current implementation:
>>>
>>> int mask = xe_force_wake_get(fw, domains)
>>> if (mask != domains) {
>>>      Non critical path continue with warning;
>>>       or
>>>      critical path:
>>>          xe_force_wake_put(fw, mask);
>>>          return -ETIMEDOUT;
>>> }
>>>
>>> do_ops;
>>> xe_force_wake_put(fw, mask);
>>> return err;
>>>
>>> Above flow remains intact irrespective of individual domains or
>>> FORCEWAKE_ALL.
>>>
>>> In case of individual domains if (mask != domains) can be replaced with
>>> (!mask) and user can avoid xe_force_wake_put(fw, mask) in failure path
>>> since mask is 0;
>>
>> so maybe we should have (by reinventing i915?):
>>
>> // opaque, but zero means failure/no domains are awake
>> typedef unsigned long xe_wakeref_t;
>>
>>
>> // caller should test for ref != 0
>> // but shall call put if ref != 0
>> xe_wakeref_t xe_force_wake_get(fw, enum xe_force_wake_domains d)
>>
>> // safe to call with ref == 0
>> void xe_force_wake_put(fw, xe_wakeref_t ref)
>>
>>
>> // helpers for critical work that must be sure about domain
>>
>> // compares opaque ref with explicit domain != ALL
>> // can be used by the code that obtained the ref
>> bool xe_wakeref_has_domain(xe_wakeref_t, enum xe_force_wake_domains d)
>>
>> // compares fw with explicit domain != ALL
>> // can be used by the code that does not have direct access to the ref
>> bool xe_force_wake_is_awake(fw, enum xe_force_wake_domains d)
>>
>>
>> // helpers for checking correctness
>> void xe_force_wake_assert_held(fw, enum xe_force_wake_domains d)
>>
>>
>> then usage would be:
>>
>> xe_wakeref_t ref;
>>
>> ref = xe_force_wake_get(fw, d);
>> if (ref) {
>>     // ...
>>     xe_force_wake_put(fw, ref);
>> }
>>
>> or:
>>
>> xe_wakeref_t ref;
>>
>> ref = xe_force_wake_get(fw, ALL);
>> if (xe_wakeref_has_domain(ref, d1))
>>     // ... critical work1
>> if (xe_wakeref_has_domain(ref, d2))
>>     // ... critical work2
>> xe_force_wake_put(fw, ref);
>>
>>
>> so above will be very similar to what you have but by having explicit
>> types IMO it will help connect all functions into proper use-case flow
> 
> 
> Agreed implementation/usage will be same, will use explicit type for 
> clarity.
> IMO typedef unsigned int xe_wakeref_t is sufficient instead of
> typedef unsigned long xe_wakeref_t;

I agree with this.

Regards,
Badal
> 
> 
>>
>>>
>>>
>>>>
>>>> // for single domain where ret=0 is success, ret<0 is error
>>>
>>> This leads to caller only calling xe_force_wake_put incase of get
>>> success. so in case of caller continuing with failure, he will need to
>>> ensure the put is not called.
>>>
>>> for example:
>>> int ret;
>>>
>>> ret = xe_force_wake_get(fw, DOMAIN_GT);
>>> XE_WARN_ON(ret)
>>> if(!ret)
>>>      xe_force_wake_put(fw, DOMAIN_GT);
>>>
>>>> int xe_force_wake_get(fw, enum xe_force_wake_domain_id id);
>>>> void xe_force_wake_put(fw, enum xe_force_wake_domain_id id);
>>>>
>>>> and
>>>>
>>>> // for all domain where ret=0 is success, ret<0 is error
>>>> int int xe_force_wake_get_all(fw);
>>>> void xe_force_wake_put_all(fw);
>>>
>>> In case of xe_force_wake_get_all(fw) failure, how the caller will know
>>> which domains got awake and which failed ?
>>>
>>> ret = xe_force_wake_get_all(fw);
>>> if(!ret)
>>>     No way to put awake domains to sleep
>>
>> in case of failure, it would be the responsibility of the
>> xe_force_wake_get_all() to put all partial awakes immediately, since it
>> failed to awake all requested domains (same as in single domain case)
>>
>> but let's drop this idea
>>
>>>
>>>>
>>>> and
>>>>
>>>> // input: mask of domains, return: mask of domain
>>>> unsigned int xe_force_wake_get_mask(fw, mask);
>>>> void xe_force_wake_put_mask(fw, mask);
>>>>
>>>> this last one can be just main implementation (static or public if we
>>>> really want to continue with random set of enabled domains)
>>>>
>>>>> + */
>>>>>    int xe_force_wake_get(struct xe_force_wake *fw,
>>>>>                  enum xe_force_wake_domains domains)
>>>>>    {
>>>>>        struct xe_gt *gt = fw->gt;
>>>>>        struct xe_force_wake_domain *domain;
>>>>> -    enum xe_force_wake_domains tmp, woken = 0;
>>>>> +    enum xe_force_wake_domains tmp, awake_rqst = 0, awake_ack = 0;
>>>>
>>>> it looks that you're abusing even more all enum variables by treating
>>>> them as plain integers
>>>
>>> Miss at my end. Will address them in next version.
>>>
>>>>
>>>>>        unsigned long flags;
>>>>> -    int ret = 0;
>>>>> +    int ret = domains;
>>>>>          spin_lock_irqsave(&fw->lock, flags);
>>>>>        for_each_fw_domain_masked(domain, domains, fw, tmp) {
>>>>>            if (!domain->ref++) {
>>>>> -            woken |= BIT(domain->id);
>>>>> +            awake_rqst |= BIT(domain->id);
>>>>>                domain_wake(gt, domain);
>>>>>            }
>>>>>        }
>>>>> -    for_each_fw_domain_masked(domain, woken, fw, tmp) {
>>>>> -        ret |= domain_wake_wait(gt, domain);
>>>>> +    for_each_fw_domain_masked(domain, awake_rqst, fw, tmp) {
>>>>> +        if (domain_wake_wait(gt, domain) == 0) {
>>>>> +            awake_ack |= BIT(domain->id);
>>>>> +        } else {
>>>>> +            ret &= ~BIT(domain->id);
>>>>> +            --domain->ref;
>>>>> +        }
>>>>>        }
>>>>> -    fw->awake_domains |= woken;
>>>>> +
>>>>> +    fw->awake_domains |= awake_ack;
>>>>>        spin_unlock_irqrestore(&fw->lock, flags);
>>>>>          return ret;


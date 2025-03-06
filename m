Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D93A6C19F32
	for <intel-xe@archiver.kernel.org>; Thu,  6 Mar 2025 01:50:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5A5510E8A7;
	Thu,  6 Mar 2025 01:50:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F0MknFha";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6963610E8A7
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Mar 2025 01:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741225853; x=1772761853;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=vZijpJiAVUVjh53kYZgXgkFWXdEg/aYS1pw5BnkMsz8=;
 b=F0MknFha0abA7YtblLRNjZwcz9VvR/Eqq1h8hAtgNhHhNSUQsQ9FwXc6
 PxnQkY26KF+TBxYwSusHt7pgGGETwQaDBMvqmWBrJH2SXmnLmMZVf4g7t
 xjWO4/lfpzK3IxN8csYlSxQWpTzvGBpLunqcPHHbwpLhk/4Q9SLSZDWzM
 IAyBgP1EDuY1kSuuh1/7hdAVyiOdjMWuHsb/zyFz2/EspQPxUuYegNjDz
 M7RLK0x7AklWDaG6kNg4KmLaArrflkFdK1nNVvsvvBIRM1O5/q9bCgDF4
 +0Vp+7BJz1W4yhDIOBGexuFgQyRUbgCzaVChtpD9RGlIveugorAr7oop6 Q==;
X-CSE-ConnectionGUID: s+Hoj34oT9m35hY7Dlj6IA==
X-CSE-MsgGUID: SnFEMI4mT9qX69+sazZgfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42245332"
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; d="scan'208";a="42245332"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 17:50:53 -0800
X-CSE-ConnectionGUID: NL9SVS55TJmjyS0amnIXyA==
X-CSE-MsgGUID: 2qj5suFwSFSCBKZKtttfSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119375776"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 17:50:52 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Wed, 5 Mar 2025 17:50:51 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 5 Mar 2025 17:50:51 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Mar 2025 17:50:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a2LUNzMpuCFdkhdO4hsrdYzs9h6XBLG/M5ch8gxrPf5ZL51nKQKWlZ7fti0CQZPemHMUln1JfSI4wrf4gp225N86TIiHoCzCzypMVkEV382J+aC6Y5W8rWW+WHaybGWpvyQgVs5gU9TjBjcbO6ZcQZFcYKaMX6XzirHp/Qg7QaFWEsTyO0qOYpXesosIME9h/c/ElxLxK/KKS6tmSyn0o5XbN+84Mgas4GC48K4RpA3sun5f2uohjdYPYeHvPax9ipbv41ePEWfAuCp/S8KghT3b3wpeOjlxbPv3I+YV2ye+LOYURsLuU20Y7KAxc/nPqEkVN3eUeZdUZRSoaTJsvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Opq94Km2JcsStPDC/bcjtWa9ppxPt8E1ts9Fb6v8kbI=;
 b=xrQZuiTTY/IitCSPHyovOXQzTgngb6X/30xdWsPIqsN66kNJbqpkMjdGQOfG5lwzuYkqdchg1fVnvlHHGshk7UejjO0oemA7qAGYdBjaWhQDwCLUFYUm8+d+5TFVZXk3Qofe9KdPXhCStd567wQvQJ2/IVPzT4komJKBiET4luJvztA2DZjvz9EBKT+Asq7Baz3fSXufU9yseSDxVbtojg2IkltU2zs7vt26yislyKaqSo5G9Pz5XSPFtQ1puXxoDut6le65WUvpn3mGGOWBeJt9NOYvZf8Zm5ZLao0gRHlU0cojlN4oi46wRLIELv5GbbwajCm9VAWEY3qL12z85w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by DS0PR11MB8081.namprd11.prod.outlook.com (2603:10b6:8:15c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Thu, 6 Mar
 2025 01:50:48 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%4]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 01:50:48 +0000
Message-ID: <7c70d716-0d1c-4797-bf6e-65f00acf6c6f@intel.com>
Date: Wed, 5 Mar 2025 17:50:48 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Apply Wa_16023105232
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20250226032934.1789134-1-vinay.belgaumkar@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20250226032934.1789134-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR01CA0058.prod.exchangelabs.com (2603:10b6:a03:94::35)
 To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|DS0PR11MB8081:EE_
X-MS-Office365-Filtering-Correlation-Id: 6130fb80-077a-4769-9cc4-08dd5c51515f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dGl3eTRnMko0SWc5dmd2dUVtekZKQTEwNjNLMjZjVXNIYWhEdXRzTFRmdFZa?=
 =?utf-8?B?YkdNTG1GYTFsOVpkcWdZbG9oTDhOWFpNMkV4NlJNNnpMMUZXSHdLejAxSE92?=
 =?utf-8?B?ZDJEV3FoTk5mQm5zMlBCbVRiWkF3OEpNb2ZaWldsOXhMQm1pSWlLOVFGbThV?=
 =?utf-8?B?ZDVjTWdQVGhWV2w4blRmZWk2OW9YWFFidENrK01QbE15MlljVG0yK0N2UStr?=
 =?utf-8?B?T0xsNGdYaFJlWWN5ZmtaYlpPSU5xTFZSS2RhS2pnVGFRZEtDK1ZqUURzZ0tB?=
 =?utf-8?B?SkpMUUhjZkhYbU9EbHByd05DTFMvTG9rdWtITkZBUFVpWFNuU0F3Wm1HdFNK?=
 =?utf-8?B?RXBKWXBvdkhOTGtXVTBjdnVOSDdleWpVT1U2R1RvS0cvNUZQenFRLzNUWnAr?=
 =?utf-8?B?OFZmWXFvMXA5bWRlUTFla1laUTdSaURIOEhNakVvZnBTZUhUZmFpd3QwWFdy?=
 =?utf-8?B?TW4rK1VSWDE4T0huWW51OFVGQjFwSWJSUm5FbllGZXVaR1QxRTY4SUhnQWl0?=
 =?utf-8?B?TGxpTno5Wk80TDV2Zm04VGVLbWZYQnZKcnJGa3Rub1JiWDMyWkZJRytPUnhZ?=
 =?utf-8?B?UGZSR1lHSmg4eFEzc1BONHJSS3BUMkNZL1BDKzRrRlRnUXZUZE5WWU1rSGIy?=
 =?utf-8?B?aGZ5UWg0UmJaNWdxeTRONCtlN3ZtcHczQzRpb1lQdlN3L3V2WktuR2ExQ0J0?=
 =?utf-8?B?VTNnTSt5WGRtUUZlYUtHdXNzVFZLK3pQc2l6aTFYVHVEaDRDejJXK0VGaVUr?=
 =?utf-8?B?ZXFsM05nMnIzK2l3UU92elVmcGNYa29XZFZPZ1FYOU9ieDdoU3Q0a0VFN091?=
 =?utf-8?B?TVhXQU1lOS9BMUVLQWM0emJVdVBzemlHcFQ1QUF6RG1wODRQbmpHTk8vSUxE?=
 =?utf-8?B?ZVg1RDBkaVVwdkYweWE1YUJ4b010VVk0UVJDZitkODFvQmpuQ2IydTUzQVNx?=
 =?utf-8?B?Y2VqMzFPa3NMMFhFNkRvazRSTzZ1UXN2Q1ZmZ28zblNpeDZuaDlUczFRK01a?=
 =?utf-8?B?bTBlcXYrUDQ5V3BCaDdmY1IvK3VyN1pjSmEyV3dERFF2OW14dmFtVU4ydTFN?=
 =?utf-8?B?YjBXWlplNXcrUE9OR3hjZGxUaG1mMmZXVm5zRFRJbUpkUmNrdmtwMk5mL2to?=
 =?utf-8?B?R3FDWTNXUzBjbEZVTjJVSklIOUw3UVY0VFdremlTT0VKdlhONE5NUnVZemta?=
 =?utf-8?B?ZXJ4SXhlQmgxUk8rVFdGRkIxOGZVRzFZcnFLN0p3REFGNW9hdElyZW11Ymp2?=
 =?utf-8?B?ZTh1MkFvZGd0dDNrM1VRbUFwOGk0TVY1cHJqcHpSNnhGMWlYL2Vsemd1Sis3?=
 =?utf-8?B?SDR4dmNYeFpkQ1VLNGpLTmxhM01HbGtFK2hZOE14Ukt3UmVqMFlkandqUlYy?=
 =?utf-8?B?UERONGdMOVhtYlIranNGcWEyWUVaTXNzQjY5LzdqRWFRRUZBWHhFYUI2K3E0?=
 =?utf-8?B?bXRaUys2ZExqdDl5clVtb0dCNVFtL04zVFYxNlFxRnlNMWRsUE5DZVM5ZG1R?=
 =?utf-8?B?TEkrRHdndXFBRXFvMWZUTjBBSGVNTWl2YkNyZ0NkRG9aVXhwQkdwZURNSGkz?=
 =?utf-8?B?RjU4VkFmWEZ1bHZ3Z2piNjI0dDNQN24zRkFvVUNscnlhVVlVRDB4VnpjNzZj?=
 =?utf-8?B?aFNweUQrMjhVQ1d5dkhtMm1UNE5IeklWTGljWGxoVm9XV3pQbEFRRjBjV3ZZ?=
 =?utf-8?B?eDNNRFlGYlpoM3piYkkxMitLYytCZkdFTGlZZTJldUJrMVllZTRlb2QzM3Q4?=
 =?utf-8?B?VG1MbEZhVDRpcHhiMk8wKys0SEdGdlNzSVZFWjJ1UUhiWXJVL21GK29RSTJH?=
 =?utf-8?B?THRyQWVCbUNCenVkN2N5dnE3K1doQWZkMUs5WmJ0U2hMUllCV3k3cmoxT0Vv?=
 =?utf-8?Q?kUbSOowZYo/iD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmV4dnl1NFB5bkxvdzkzalVvbTAwbitRR2NXaE9lYUZ2c1JVejJIZnNtTGdQ?=
 =?utf-8?B?RitPd1lKTHJsUjJsNkVPWmxLV2RxOVU5dncwckpTRW5oRG04RVFmdTAzczBC?=
 =?utf-8?B?M3dGWGJIbkRNakhmcUU3aFUrNkRhMEhFR1hDdWxuUFg3b1NadHIzSlR1K0tG?=
 =?utf-8?B?MDBva3k4N0pNcnhqUEFicGFROXFVbHJGVEhUdHpNajgxSWFVamlLMXh3Yi9J?=
 =?utf-8?B?bHVDazQ2U0hGVFlQck1GMzhMcHo1TldadnJnUHlRL2tpSklLYUxHVjAvYUMr?=
 =?utf-8?B?QXhLYnJ5UW5kSFZyZzdJZUtaRGlMbG15UDMxb05MZnpFbUxKYjJwdGlHRUVJ?=
 =?utf-8?B?L1BXL3g1TEZwVnJCWkxDS2x0L2YyRUg1em9OQTEyTkdPS2h6a0RlUSt5RWxJ?=
 =?utf-8?B?cHhETWRJY01ZRUpHbVJJclJ0d1diM1l0YmR3ODltVVltT28rMDRmM3BUeXkr?=
 =?utf-8?B?c2RNemhrWDQrUU5vMTBxVit3UlgrZ1RRa1JTcjNkSHdnSEhJQzNhbnpscCtV?=
 =?utf-8?B?ZWNHblR3MXk1VzIwWTgxNUdIRkptL0xWeEdDYlB1TWVpRGVlNHMvL1ZxOVBa?=
 =?utf-8?B?TCtwRDVsM3JSRkFhaGIrV04rZjVHNWNrM0xRcGEyQWt0d1J1dTJJNFQ4QkF6?=
 =?utf-8?B?c05yeFVMZi85eW5IUmdGRGlja2FXWmZpdStXZTNJUlIra1lCTmtLMFhjRDlw?=
 =?utf-8?B?dlRGcFFQQmNtMFJ4ejhzdksreFR0NWRMVkVCMzMzWjVtcmhUdEo4OWJTbGhl?=
 =?utf-8?B?aUlOQnJSSiszdVB1dG92TUk0Q1diZnhLZUVkd1FhcExXYlJQem9oS0hsVUxM?=
 =?utf-8?B?aXJ4UlZwQ3RFanhmSjRhNllwY1hXYkVrUjVERWVXT2FJOXBEeG5vTTkrRW55?=
 =?utf-8?B?TnpVQ0JtQ1VmeEQ3bVEzNUdGZHJ0TkJlQWwwTndER0dNUUhKa2VKT2c5SDJ6?=
 =?utf-8?B?MXRsWkh1cER0WXpiUUV3SllLbUNlUEZaaEpTZ3RkMEJCMUh2WEdMTHB4Ulgw?=
 =?utf-8?B?eWl0ZHhNb3lvRUFVcTh5emdtQmFraGxqOElpQ0pLTTNqaytWa25pSlJTV3VO?=
 =?utf-8?B?WXNvd0hLRUpVMWxXa2J0dVRUTU12Vld4WWF0QXdqc3pEa2JaazhoeDEyZThH?=
 =?utf-8?B?K0VOU295dkZ1dktTaVErdE8rSlUyMHQwZDhQV0pwSnpGeklBNkhLMnBhaHFr?=
 =?utf-8?B?ZFk3Wm02cEJWalNPOVI1TE05QUJYWDJyMkVUQ1ZoOUthcWtsMnE0dmYxTWxV?=
 =?utf-8?B?Y0tWYUFyKzh1WnZZUm1IV2dYU0owOGFUZGRKSDczaHJZelRaYzJNdGlHSm5B?=
 =?utf-8?B?UGJTQ1kzdkZDdnh2Q0dyNzUrUy9GOTY0NGRNRmlmc1VvN25XQURmWnlCTUgy?=
 =?utf-8?B?WGJ5eFlaSmlEZm5pUFpVRG43OTdCNjZJelV6QVQzaTMvem1aSTk4WU1BZk9K?=
 =?utf-8?B?YXRvODJ4cGVrZDNObWY1Zk1ZRVhVaVp4V2lYR3dkM0xXT1UzQm5abWJBbXA3?=
 =?utf-8?B?d1BaT01mN2h4WEtVQ01VbEpYbDFLemhXclpXckdUVEUvaEN3eVBCZG9QV1Bk?=
 =?utf-8?B?YkMyV2VURjhTN24wWGdYUGxZWTFuNW85NTYwN0hmRFFnYm8vdWE3QTJKVkxI?=
 =?utf-8?B?MS96eDVRdkNMcTZhSEVjMk1TcXV6NEZNVEF3VWZlWnBKQ1piUE85M3ozZmRk?=
 =?utf-8?B?NXl0em9kaTFmeVE4UEhUMUdBd01XanRhUzZUSXkwV3VsaDNiLzg5NG9nNFJQ?=
 =?utf-8?B?RjQ0ZVZ3WFUrR1ZPeXl5RHhIblk5RFhHdDdMT2RWR1M4U2NiWXdCcTAwNUxM?=
 =?utf-8?B?c3R5enptVHNWTHZSNXM3dWExOHZXYjhZUlpJYTMzVjRRNDBkc3RzQzMyNmNq?=
 =?utf-8?B?NjV3Qkx2cEZ1Q1ZLNVltNG80Q1NORkJ3blZ4a0syeTIwU2RaWnpUNVh1QWRs?=
 =?utf-8?B?RTVXYmZVVTB4bm8vVURjY0prUkJMd3pXeHZXUHlKdEhlSlVFWlVHdDZ2ZkdL?=
 =?utf-8?B?SkRFWDRtZ2RJbDlsOWgxRnNBQ2hRSkxjaSttQkhpeEhlb2ZJVDlPUXlmREw2?=
 =?utf-8?B?NUFYOXlUTmo4b0FNMkdsUk4vdmlsbVp0blhmV1hUSVdXTXRYZTEvdVlQbFQx?=
 =?utf-8?B?eHRDYUo2R0g1MXM1N3poemE3ZzZoSFA1WU5hWHRwTFp1WlZRTGdSWS9XVEta?=
 =?utf-8?Q?7Ri69YGuwk89U1yshGMNKZc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6130fb80-077a-4769-9cc4-08dd5c51515f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 01:50:48.4985 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kBHqxlc8wfxYAPDDtqJ+LqQWTzBuZzhvNj1TobRML2dmBf4WY3bzrIbt2i/uyjY4HFzSvq4kQUKrhxDZUDPbUjcJioOV5KGLVOUEs9SnlFw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8081
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



On 2/25/2025 7:29 PM, Vinay Belgaumkar wrote:
> The WA requires KMD to disable DOP clock gating during a semaphore
> wait and also ensure that idle delay for every CS is lower than the
> idle wait time in the PWRCTX_MAXCNT register. Default values for these
> registers already comply with this restriction.
>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_engine_regs.h |  2 ++
>   drivers/gpu/drm/xe/xe_gt_clock.c         | 29 +++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_gt_clock.h         |  1 +
>   drivers/gpu/drm/xe/xe_hw_engine.c        | 30 ++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_wa_oob.rules       |  2 ++
>   5 files changed, 64 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index 4f372dc2cb89..067468c62adb 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -130,6 +130,8 @@
>   #define RING_EXECLIST_STATUS_LO(base)		XE_REG((base) + 0x234)
>   #define RING_EXECLIST_STATUS_HI(base)		XE_REG((base) + 0x234 + 4)
>   
> +#define RING_IDLEDLY(base)			XE_REG((base) + 0x23C)
> +
>   #define RING_CONTEXT_CONTROL(base)		XE_REG((base) + 0x244, XE_REG_OPTION_MASKED)
>   #define	  CTX_CTRL_PXP_ENABLE			REG_BIT(10)
>   #define	  CTX_CTRL_OAC_CONTEXT_ENABLE		REG_BIT(8)
> diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
> index cc2ae159298e..88e3df76a885 100644
> --- a/drivers/gpu/drm/xe/xe_gt_clock.c
> +++ b/drivers/gpu/drm/xe/xe_gt_clock.c
> @@ -55,6 +55,35 @@ static u32 get_crystal_clock_freq(u32 rpm_config_reg)
>   	}
>   }
>   
> +/**
> + * xe_gt_timestamp_base - Return the GT timestamp base
> + *
> + * @gt: the &xe_gt
> + * Returns: time in nsec

Might be worth noting that this is a rounded value (though the rounding 
maxes out at ~0.4%, so not a big problem)

> + */
> +u32 xe_gt_timestamp_base(struct xe_gt *gt)
> +{
> +	const u32 ts_base_83 = 83333;
> +	const u32 ts_base_52 = 52083;
> +	const u32 ts_base_80 = 80000;
> +	u32 rpm_config0 = xe_mmio_read32(&gt->mmio, RPM_CONFIG0);
> +	u32 crystal_clock = REG_FIELD_GET(RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_MASK,
> +					  rpm_config0);
> +

The xe_gt_clock_init function is already reading this and saving it into 
gt->info.reference_clock (with some manipulation). Can we re-use it from 
there? Or can we calculate the timestamp base there and save it in gt->info?

> +	switch (crystal_clock) {
> +	case RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_24_MHZ:
> +		return DIV_ROUND_CLOSEST(ts_base_83, 1000);
> +	case RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_19_2_MHZ:
> +	case RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_38_4_MHZ:
> +		return DIV_ROUND_CLOSEST(ts_base_52, 1000);
> +	case RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_25_MHZ:
> +		return DIV_ROUND_CLOSEST(ts_base_80, 1000);
> +	default:
> +		XE_WARN_ON("NOT_POSSIBLE");
> +		return 0;
> +	}
> +}
> +
>   int xe_gt_clock_init(struct xe_gt *gt)
>   {
>   	u32 ctc_reg = xe_mmio_read32(&gt->mmio, CTC_MODE);
> diff --git a/drivers/gpu/drm/xe/xe_gt_clock.h b/drivers/gpu/drm/xe/xe_gt_clock.h
> index 3adeb7baaca4..b78665b0b924 100644
> --- a/drivers/gpu/drm/xe/xe_gt_clock.h
> +++ b/drivers/gpu/drm/xe/xe_gt_clock.h
> @@ -12,5 +12,6 @@ struct xe_gt;
>   
>   int xe_gt_clock_init(struct xe_gt *gt);
>   u64 xe_gt_clock_interval_to_ms(struct xe_gt *gt, u64 count);
> +u32 xe_gt_timestamp_base(struct xe_gt *gt);
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index fc447751fe78..609ba19251bd 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -8,7 +8,9 @@
>   #include <linux/nospec.h>
>   
>   #include <drm/drm_managed.h>
> +#include <drm/drm_print.h>
>   #include <uapi/drm/xe_drm.h>
> +#include <generated/xe_wa_oob.h>
>   
>   #include "regs/xe_engine_regs.h"
>   #include "regs/xe_gt_regs.h"
> @@ -21,6 +23,7 @@
>   #include "xe_gsc.h"
>   #include "xe_gt.h"
>   #include "xe_gt_ccs_mode.h"
> +#include "xe_gt_clock.h"
>   #include "xe_gt_printk.h"
>   #include "xe_gt_mcr.h"
>   #include "xe_gt_topology.h"
> @@ -459,6 +462,12 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
>   		  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0), CS_PRIORITY_MEM_READ,
>   				     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
>   		},
> +		{ XE_RTP_NAME("Disable DOP clk gating"),
> +		  XE_RTP_RULES(MEDIA_VERSION_RANGE(1301, 3000),
> +			       GRAPHICS_VERSION_RANGE(2001, 3001)),

XE_RTP_RULES() does an AND of the rules, while here it looks like you 
want an OR. Maybe use FUNC() helper?

> +		  XE_RTP_ACTIONS(SET(RING_PSMI_CTL(0), RC_SEMA_IDLE_MSG_DISABLE,
> +				     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
> +		},
>   		{}
>   	};
>   
> @@ -566,6 +575,24 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
>   	xe_reg_whitelist_process_engine(hwe);
>   }
>   
> +static void check_idledly(struct xe_gt *gt, struct xe_hw_engine *hwe)
> +{
> +	u32 idledly, maxcnt;
> +	u32 idledly_units_ns = 8 * xe_gt_timestamp_base(gt);
> +	u32 maxcnt_units_ns = 640;
> +
> +	if (XE_WA(gt, 16023105232)) {
> +		idledly = xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base));
> +		maxcnt = xe_mmio_read32(&gt->mmio, RING_PWRCTX_MAXCNT(hwe->mmio_base));
> +
> +		if (drm_WARN_ON(&gt_to_xe(gt)->drm,
> +				(idledly * idledly_units_ns) >= (maxcnt * maxcnt_units_ns))) {
> +			xe_mmio_write32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base),
> +					((maxcnt - 1) * maxcnt_units_ns) / idledly_units_ns);
> +		}
> +	}
> +}
> +
>   static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
>   			  enum xe_hw_engine_id id)
>   {
> @@ -606,6 +633,9 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
>   	if (xe->info.has_usm && hwe->class == XE_ENGINE_CLASS_COPY)
>   		gt->usm.reserved_bcs_instance = hwe->instance;
>   
> +	/* Ensure IDLEDLY is lower than MAXCNT */
> +	check_idledly(gt, hwe);

Might be worth to add "wa" somewhere in this function name to make it 
clear it is workaround-related. Maybe just check_wa_16023105232?

Daniele

> +
>   	return devm_add_action_or_reset(xe->drm.dev, hw_engine_fini, hwe);
>   
>   err_hwsp:
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 228436532282..b45ec8bd0735 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -43,3 +43,5 @@
>   no_media_l3	MEDIA_VERSION(3000)
>   14022866841	GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0)
>   		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0)
> +16023105232	GRAPHICS_VERSION_RANGE(2001, 3001)
> +		MEDIA_VERSION_RANGE(1301, 3000)


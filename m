Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B7A1C2BD09
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jul 2024 17:49:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E683D10ED87;
	Fri, 12 Jul 2024 17:49:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I+I6PrQk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E35EA10ED87
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jul 2024 17:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720806583; x=1752342583;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=5IaNSf2emK09M0nXkXL3bvtMgvKNqcXIU7VtYDOQyqY=;
 b=I+I6PrQkiJOAMYrNCrduheS7zvx64Kav5n2gEaN7XG55dfbkCm+ia2ds
 zA/Ao3mmdzv/v+DC/gDOs2HvZgbmS+ctLYQFmybeDzyUTl5Er6lflx3jZ
 mepLXubP8Pwp2l7Gz70JZ/+qhHBHxz5Fpgt3W0V24SNR65NAERIvSaaGG
 v4o82O8vUYnPQtHPKg2fH6KcN5KhYUcBfR+cqpZq6ZlseR+puISoLRhdq
 0iy6StG0JuYJ81AP+mwj8NiqV1LY8QNfrOO+tF1nlDuVsIJwsSqpJ1YGl
 DdvnfH1jSdWCrcdmzTFgg+D2HBAOraZnPPy0LKxrQHXKzlNMkrO33rWby A==;
X-CSE-ConnectionGUID: QgVwN92FRbKvP9QlapwfIQ==
X-CSE-MsgGUID: PDWowNEFSBalmNyUokvqOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="18391175"
X-IronPort-AV: E=Sophos;i="6.09,203,1716274800"; d="scan'208";a="18391175"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 10:49:43 -0700
X-CSE-ConnectionGUID: TjuaDI5ITkGXivfbR6JAEQ==
X-CSE-MsgGUID: zhjNQSBATyagivk0SbJrvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,203,1716274800"; d="scan'208";a="48981996"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jul 2024 10:49:43 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 12 Jul 2024 10:49:42 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 12 Jul 2024 10:49:41 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 12 Jul 2024 10:49:41 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 12 Jul 2024 10:49:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R7MZ2OjahfU58NIFhmTuYodLUODl3sgHGkwt6ZGocn4F9VmTX0lTQYQmdCzL7T9yf0oscO9mR1TwUXTocza1n48a/kZvX5RBVn4h/MvWPFd6o+pgTxE7E5sl6SYP6bHQgKA6gO2cfWHVqfn/2WVfHTigl/DkPAi2dR8XyNAX+tECxTjhJ7klfAJQBqtT5viPVV0+uwAWH2GVjd1r+nn/vl2F822+BcHbKluRKLgxgyGthrykETYWCOkPMeu9AZ4VyX8wQ6qrvqTpf/w2wjEiidhaKjQB11M265kc+9AYYQyhYhl4p2jU5cv91f/z6JQmpSk3V0FALNtTL2fccyp35A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=baqNH4XLeOK0CNI4gakGC7aJ7eVvSzODBk2R51/gwGQ=;
 b=aDqoZgYBh8h8aMXeTIPsTgIUAOG7AGtnx2BMs3RMZHE5E0sv9o6gxJiEPRZZgAoqiUd/Tjpye/Y7lRifuawJmFs0qA/F4G2os1kahXWPqzjim+Whcf06AN4kkbRZQVNuTf7GDWCmzJGeAoqMd0PogcB4eU5kw9y4kAnAvBUTPkzHgnD+b9bnN6K/7Xvf0mAFzniXCtJE8mmS1M33k89tLjN1CgcTzsbFVSFDyzE1Ourkm1XRENnd3jJLbqg73OBm43MDJojNKEu4scKoVrMw/ej5fP1tXHGkMUCwjR728uERZa40/yX7VfdUfTY6XUpgGEnnoR1b39Gkrbo17NCOKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH7PR11MB6747.namprd11.prod.outlook.com (2603:10b6:510:1b5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Fri, 12 Jul
 2024 17:49:39 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%7]) with mapi id 15.20.7762.020; Fri, 12 Jul 2024
 17:49:39 +0000
Message-ID: <cdd0b14e-689b-4866-84fa-99696bd42c06@intel.com>
Date: Fri, 12 Jul 2024 10:49:37 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH xe-for-ci] drm/xe/huc: Define BMG HuC
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20240712173604.2660566-1-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20240712173604.2660566-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:a03:254::21) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH7PR11MB6747:EE_
X-MS-Office365-Filtering-Correlation-Id: 4aa62c47-cdc6-4ec3-9a16-08dca29b0062
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WUVkdm85dkVsNmg1RWlacCtwR09DY1E0eUFwY2VtUjFBWEVBUkh5ZWlnVWQz?=
 =?utf-8?B?WnBiSnNJL2h4dDJhK0RzSXBhaURwYlFOY0xqZ3pHNGg4VmNyenY1bFBqVUZF?=
 =?utf-8?B?dGFMdWlmZVdSancvRVRUaVN1MGR2ZDVMVFNZNFNVQWZGUHZvS25sMk9YeWVF?=
 =?utf-8?B?N3p3RjBJZThxalZkNklkMjE3ZFQ3TkVla1JMS2gyREpVVmZjazR1ek5LWEli?=
 =?utf-8?B?RFM0c21mZ1J2ZXUrczJHNUMwd25WQ05ya2NOeFJ4eFpwbGNyeXgrS2UxMnEw?=
 =?utf-8?B?VTRMRi9JcWF1d1pTSVUzeFhKQm9zOEc1S1A2dmg2NVVRVjNtRjF2ZkNYaFhX?=
 =?utf-8?B?WnowcGJXcjdMMjZkV0hKYXZQWmFnMldYNEx3ZlZyQm5Nc1c0SFkwK3RsdGUv?=
 =?utf-8?B?MVlWWmZvSDM3Y2ZIOWhCREwxWjhqZDdNQ1gyZTlJSjNWWGtUcUJzcGdlZnpo?=
 =?utf-8?B?RXNLZGxlamNUUXFJUmRmTmtoS2xTVjNxcUU0OG04OGxHdUkxbnZZOW5CWGdW?=
 =?utf-8?B?ZStWdjRnSndTbzdJM1p2bUpZY25oaXpoYW9mV1NJczlHa3d1WFRxNDl3N21p?=
 =?utf-8?B?RVUxMU1NVW54cXNzbEhyTU9tM0N6ZnUwQmVuckRQTUNMbmoycEJaenNzSjVM?=
 =?utf-8?B?M0hUc2RWRmp5bWxpbDdQRW1tNVFBblZObGJPZ1dNQU9WNkJwWW8vWVpIT2hE?=
 =?utf-8?B?Qk5TbWxaWDhTWnlYSW5TeFRQOVVKTXdTOUlzRy8vMEI1dml6VDJSZVE2ekxS?=
 =?utf-8?B?RFVTbWs3SXFTT3JtSmh1VzFoS2lmOEpHREhKeURUdFhITkJiUm9zRFhIb1VM?=
 =?utf-8?B?TGFrS2tEN1c2U2YwT2hUbTlUNlMwdExmOC9wK3JabUpIRHNhRUFjVU5NcHd5?=
 =?utf-8?B?bmNueHJMYW1CRXRlb3VaS1FMSzBqTzVPV2VJT013SmFvMXNIZEtBbExQTWRi?=
 =?utf-8?B?cFd2LzVSdHgwa2VkYVMvNDdUVFlHL3d5NjNUWHVkMFEzWWdkbUtQSEF6ZGJD?=
 =?utf-8?B?N1p3UnhsUTIxejNQZWlnbXgrbUNWeHE3MjFvWWFITHVGMlkxZVM4ZHRHUWJl?=
 =?utf-8?B?bUZ6Y215YnlPREovbExmaTJGZjNjcURjVFJoS1ArTzd1U3dZRS96a0tIRVA0?=
 =?utf-8?B?VVE3cjAwSmlSNjNFQnliTFEwWXF6SUc0YVZ1c2FoSE12cVAvTEk2OWNaZC9s?=
 =?utf-8?B?MkY4NHc5ZWsydTBxWWVUZXNGSmZ6UUFmSzdmV0xQVU1jb3kwYVZNTll2VFlE?=
 =?utf-8?B?a3FjcFFKbEZ4eDhxVy8xNkMwcTF5TTU4ek1mMU9YUjliZjdkNHB0OGh6a2tU?=
 =?utf-8?B?SnNhamg0K3pOZ2h0MWhleVMyaFpXWFgzTjJQVy9DbGcxSERyRGFWTmI1VytC?=
 =?utf-8?B?L1BNR3lSSkNvQUhJMUxzUVJxbytVeHQ0Y0FFWFJTaVpBYXJwNS9JN2lVTDVO?=
 =?utf-8?B?STJ5Y0xKb2FuWmo3ckI0RkpqUXNDMGM2U3NjMFlzdzhyWWJONDhQWXpCWGRy?=
 =?utf-8?B?REZ6blNjcDRSZlQyZ2t3YkgrY3VycEtqUzFpbHBhb0p0R2o2Tk9sQzFRWENu?=
 =?utf-8?B?R0N2UDE3NGZONGZ3SXExVko4VnpoQlJQTjVlK2wzaVMvdFk2SkljcVl2eFNG?=
 =?utf-8?B?WTBmUGlNYkdXZk1QTncxQTdydk0vNW5MQ3UzZ1ZDK3pGa2ZnVHp5QUE1eHNX?=
 =?utf-8?B?eE9oQzFiVGN4L1IxM0J0MHJiNkphVzV0Z3A2ZE9zQ3lUVmxyNkJNUnVHU1ds?=
 =?utf-8?Q?IGJapPjOh1Zla10swQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUZxdGtmcFRMamxYa2FNbSsxbjdneFgvdHpuMlBpdXBpOGIxWE1FR2ZiVnV2?=
 =?utf-8?B?UVNVM2FSMi8xcmQwUHk3V0xZeE1aRzVNcEV3czFVaUVCU21IYUxsQlhJLzZz?=
 =?utf-8?B?WXlZa3FsWnJLMWxDV044T2lITjJUSVZ4VldyS3crcE1hNHRlZHNOOWhZTnht?=
 =?utf-8?B?bzBOUUcyYVZBN3FuL0h4dzFjTHN4VW95N2pzNlNtbU56azRpOXgxZW9pNWpI?=
 =?utf-8?B?ZHc0M0Q1UFZFNUxremhKUDdCWElQVHljS00zTkpoa2VpTVR6bXRjZ096dmdy?=
 =?utf-8?B?YnFCWDVVOUVBUE9EejFVaHloczU2M3NQT1AxRm85Qno0WUFjbDNESmMzOEti?=
 =?utf-8?B?UHdTR0oyTy9sZWtFYWRDL2U2eTBjN0FmWWtXeW41Y2RyaVRuZCtNVGZJcWxP?=
 =?utf-8?B?ckNvNjVtUlBEeE1sUHlaWjlncjBRWDZXaVEyT09xWjF4WUpublZoNVlrR1Mv?=
 =?utf-8?B?SjgxM0xwSCsyT21DTnNPWkpLTk0vVlVXdzR5WUkxdG9UYWdoMWI0T1VsMFVE?=
 =?utf-8?B?NHN5aXlISkh2WlFJeXhndzNiZ3JGVWk3NEZhNVJSeFFEMi83QjN1OFJWUG5v?=
 =?utf-8?B?RGQzZW9ick1KeEMxUmc2emdsNmNnRUNLMit4Q3VOMHM5dVdjREc0MHBkdS9p?=
 =?utf-8?B?b2hZVlRjUko5d0YzdGtFSWVIdlhlOTJLcTZ5KzVwck9ZYnM1aG1JOHpxSEk0?=
 =?utf-8?B?cUVDRWRrdXEvMkVpMVRNMzc2bzM1TStPY2VQVStRS2doUllsc0FMek5xR2wr?=
 =?utf-8?B?cUtzUkFGT2YxQ0Jvd1NBWlR4cFE4S0c0eDFEd3JsOEROMkxyZ1ZsN3ZTajIz?=
 =?utf-8?B?RVJuM0lteVc3NzN1czZnYWdSajNISE1TZUlLNytxbFh3SGIvU1RPZDRDSkJO?=
 =?utf-8?B?anJwbVFsS09QUnBpRVhnVmtNOGYvSXJ6OFJUVjJxSXFqenUxNEorVUhUd1E1?=
 =?utf-8?B?YnoxSGVvUkg3MlJkZ1R3Uy9HWjNrYVF1MGlPY2NPOVJnQUdRdTk1VTRQenZY?=
 =?utf-8?B?UTNCNzZkNnN6QTR1ZlZQNlR0amdpVjRwbVhVUy9QRHVvNjlxQnJ4VWNMSFNS?=
 =?utf-8?B?bkdneWlocmNETWNXclhrMEsrVkVNb3k3alcyOWJXcW1YYlBBVklaS1NBT282?=
 =?utf-8?B?RW4ySWd5UFpyZDlWTGdvTFdQZVppVU9ZdGZXSDQ2bkNEWCtydFFrZzUxTFRO?=
 =?utf-8?B?S05zRi90dS9DNjcvQ3k2blB5eGY5bDQwV0FuVjQ1eUNnWG5hYnRvM0NKQlJa?=
 =?utf-8?B?b1BsTzlOc1ZZMjZWNmNLSFFjNFJzOU9VckZ2SkdtYkxpV0FrUWl5cEs5UnFm?=
 =?utf-8?B?anUzWFFiZmRKRFdEalJSY3ZCSUdxdVRTZXV5aDFZWFJ1R2tCTzdBazBZQ2l0?=
 =?utf-8?B?TUFDYzNnQTR1Sm9jVGlYS3BRQzhHSm4xZHFKeS9CUmhoeTJEQkplMkxOWmVP?=
 =?utf-8?B?UnBYdzhucTg1cDlsM245LzlMMWFrUW02OUlUeGFESHVZeXB3bXBWRnVkWFRw?=
 =?utf-8?B?VEVaVFRyMUpTblFseGsxR2pZaHJHYmFHOUZ3cUVWbGxKZVJ4eFd3TTZrcC91?=
 =?utf-8?B?aE55STA3WitwVjdvOVVST2xOWnd0bHNXTVEzTUkvSnZITTBTMVNRdGYzY3Nr?=
 =?utf-8?B?UDl6SStUMTB5Y0tzOUFlbENCZVlja0V5dVZlRWFmYmRDdnMrbXg5ZEpYQWYw?=
 =?utf-8?B?UDlkVklzOVN6UFV4dGI2OFJCaGYrLzdzUXhsWnZTZ0RXRVVVa0V1dHoySGpH?=
 =?utf-8?B?TDJxV1RVUTlWS3VhNFl2OVp0ajVQL2s3OEcyZnU5LzZkeUw2TVNyL1oxZCtI?=
 =?utf-8?B?eVpkMEQ1QUJ0a29HbFQ0blBRTDBnb2J6M0ViVXpTUEN0K2tpaFdDdlBzSnNK?=
 =?utf-8?B?cmwyM1VRRitrQVVLZXN1VUtpcWwwbXc1ZmFoa0FTS2F4VnhPNlpqcHVhWVlv?=
 =?utf-8?B?MjZwUWVRalVkdlIrd0JFeUh5SHZpV2NZUjBxNGtaOXlDVC9TUHRFQjIxR3hG?=
 =?utf-8?B?K0lrYXlQeXVnSGpaNG14UGs5RDFpNXpuV1gwV0JHUVdmaENXOUJsT1pGT05l?=
 =?utf-8?B?eHJBcnZPR3hndEc1ZVdZUmFiaWhJRmNqNjdDQzZZQzFJZjNvdnpIb051VkVu?=
 =?utf-8?B?bkFIZlkraW5vRURYQ3RhOFhLUm5RUUgzN2ZjSGw0VkdmdE1XSE90bjJRVzBN?=
 =?utf-8?B?RVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aa62c47-cdc6-4ec3-9a16-08dca29b0062
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 17:49:39.0809 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dQW6KPEeSOkeFKFSQOsc8VhCeHOzFhnzl1ut+G1dM9m44ctFpY5audqNohknyQD5FQ+oI2ToGziuQNeHp6N9MSTmib8iijZpoBn21baF1Ls=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6747
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


On 7/12/2024 10:36 AM, Daniele Ceraolo Spurio wrote:
> First HuC release for BMG.
>
> This patch will need to stay in the xe-for-CI branch until we're
> ready to publish the HuC firmware to linux-firmware, at which point
> we can change it to use the unversioned file name and  move the it to
> drm-xe-next.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Forgot to add the gitlab link

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2260

> ---
>   drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index 62ed413bf1c3..c1dcf58d25d7 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -118,6 +118,7 @@ struct fw_blobs_by_type {
>   	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 19, 2))
>   
>   #define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)		\
> +	fw_def(BATTLEMAGE,	mmp_ver(intel-ci/xe, huc_gsc, bmg, 8, 2, 6))	\
>   	fw_def(LUNARLAKE,	mmp_ver(intel-ci/xe, huc_gsc, lnl, 9, 4, 6))	\
>   	fw_def(METEORLAKE,	no_ver(i915,	huc_gsc,	mtl))		\
>   	fw_def(DG1,		no_ver(i915,	huc,		dg1))		\


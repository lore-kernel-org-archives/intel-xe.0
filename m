Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2034FCCD184
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 12:46:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5A1F10E30F;
	Tue, 21 Oct 2025 12:46:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kT59U7VZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C076110E30F
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Oct 2025 12:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761050801; x=1792586801;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MQySpxW0tnZPL81kR0Krd3vpo/QJvqQQuaCzic4ulpw=;
 b=kT59U7VZ+LSZYjrpzZbBKVCHk5qRPUtMSmLZH8xDQrB3J0QO4zwMIU8M
 xpE72ScGF6qqTIfNWezK+X3K2zdi3BZBkpA9B3jczUZo93v7WAaN4bW37
 zMFRYahCNBiPGrBq5MafNou6XraUHQn5tCNUf3XCDNw3Bw6C1p88PFvDO
 kN2CLmiBTT+YjnnJSuS7K1Wf4i/P5VCCbFUq+HgLfy2XzWx/iijFPoHh/
 FuhbXs6jRrAwU0Md/Au5GvgVoeUK43n431FeW3zxHRz5ondnbo029DYLZ
 YC4pp8svIUzIB2LS0lT4c+PkaTxIZjp3+aHJdve2+Q+wBOrpxusKzu+fy Q==;
X-CSE-ConnectionGUID: SV/aBTBYSOyFupnOevOHzg==
X-CSE-MsgGUID: 9ZfeyfyTRW2M3+jLdlgydg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63270985"
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; d="scan'208";a="63270985"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 05:46:40 -0700
X-CSE-ConnectionGUID: 13XuAaxZTPC9YO9LS78TyA==
X-CSE-MsgGUID: PTagEJ/OSMGrolcD9LrJBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; d="scan'208";a="220752502"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 05:46:40 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 05:46:40 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 21 Oct 2025 05:46:40 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.42) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 05:46:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oIxxta/u8Sm2jNaRmpzIoKzV7QpLG96dyL5k16H3ORAGpn1IK43EjfHEfDTn8DS7LedW8HnpTkh0NpEQ4BE1SVBCKEOy7jbTr62JmdGCT5osGDYIfo8HhiJC3/pvBwxLGlw4x3UfFtJL4gNRMhlMfo92zTyIuevKSsyQtxU0ePICT5pjYKxctY2LiRuGJtQeYfGND30AULnikM4n/OXs+RFE6uTvDRRGIdAKzPFOeVaoLG33c4RHfCW9sYIqRB46WFcLJxrCY7PcV7kCMABL7ZPgAxh2hebRkwYmVM2EqcY55J1efXMCE9+u4zRatJC1AjKHGa+TiPM3MZEXroxxow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yAne3Wsw8d0b0p0+aMsX+So2xMnxJ/0tRDOE/Ct4iNU=;
 b=goSdHoyJCZM3ex9MjBi0D09dQrAq9PvV0hSbxO3sTDouN6EKnnhwLa6jfO+N1fj6E7ZlTRlkN+wbTQzuIWxQ77bEcWAFkxfLxTGnz458VwdHXVfc1hCPOWEVQqcacpZHgkhs1HZcX14qKYmVzKW2JIi6NCEndcD0Uh9rGShe0rP36DaikIjmIAtTlF5dc60k1vS4IWfDQOH2Qb02kyEx7Vr4BYSILOKM7648R2AVCd9yYlz+/4gPAvUrWqxks91ioIQFSh2eL0xcGVBLvXLOQPD0dZJxjv7g+r7tG3Z2Q+jYwVSoZ/14I7JBMPMC0QoN3tm6K3BT0wYQSmxRoW5G+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by IA1PR11MB6516.namprd11.prod.outlook.com (2603:10b6:208:3a0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Tue, 21 Oct
 2025 12:46:37 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9228.015; Tue, 21 Oct 2025
 12:46:37 +0000
Message-ID: <11ea7192-9f72-419e-a694-3cf4aabf7be5@intel.com>
Date: Tue, 21 Oct 2025 14:46:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] drm/xe: Improve xe_gt_sriov_pf_config GGTT handling
To: Maarten Lankhorst <dev@lankhorst.se>, <intel-xe@lists.freedesktop.org>
CC: <Matthew.brost@intel.com>
References: <20251021121814.2193153-9-dev@lankhorst.se>
 <20251021121814.2193153-15-dev@lankhorst.se>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251021121814.2193153-15-dev@lankhorst.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VE1PR03CA0010.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::22) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|IA1PR11MB6516:EE_
X-MS-Office365-Filtering-Correlation-Id: ad3e4d0e-b4f7-4751-1a1f-08de109fdf95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TFp0RkVtMXFGa3lEbkdodWpKeE9UN3E4dWp1UG03cFIzYjZyMGxXNUZQT1hW?=
 =?utf-8?B?R3o4VUlnSW9kWk1XUDUyWmp3VHU0OVhqSlBVaVFNTURqVG92R1JlMlBDZ0tU?=
 =?utf-8?B?OVF1emlweUF4Tjh2dkREbm94aVhvSzlnSmFka1NoUUd0c2hvTFY0aXFSeSsv?=
 =?utf-8?B?ZkFJSGt5NUlneHcvMVY3ZWpUSUVNc2tDbDFPRFpHcDd4cU1BNTJuRlo1U0pC?=
 =?utf-8?B?V01VOVBEeVNMa3lyb2M2Rm1uLzJ1VlIvZnZiejd1RWhZWlBVTk9wbzFRRXY4?=
 =?utf-8?B?TGZaSWxiR1RPL3ZGZkprVFZPaFFSMERxejFQOGdCY2l6NTZFdmhxRzVpYlJ2?=
 =?utf-8?B?N2hOM1dPN0Y5WjdFalpaNjRMRmRaalE3QjJTQVIxQlBCc2pvZmJZZTgwVEQw?=
 =?utf-8?B?NUdOaGdKMk5FcEVGVFk0SzJCZHBIN3p3cjFFL1QwQzhjaVJoOHg3amI0MGlI?=
 =?utf-8?B?cmRtZksrUVRwb2psZ1RLOWpDREpjaHZzTjBmU0ozV2NiVDhtK3FVeGptMHo0?=
 =?utf-8?B?dVhJTXlBTkZXdERDVUpzV0FLeEZteGZsaG83OTlPWTU0UitYemhkM3pXUkta?=
 =?utf-8?B?dFlhdzlhVkFJMHFxcjEvVTEzMVUxV2FjQkcyVUhMUEVWWkFsV2RQdHhXRXNw?=
 =?utf-8?B?aFNDZnIzRnVWZnJ0Yk1sUGlTTmJFRUU3T0tQRWRkMm94ZXVzWnhLak9kTllQ?=
 =?utf-8?B?cVA1eTl4TStWQ0pJR3h1Z053ZUErZDQrVFdmejJVQlhXTDVtZjJGTGswdjhh?=
 =?utf-8?B?dVhFTXVmaVZGMFBjNVBXaDAyL2o4ZHlYTUdHNjFDWXdwQlREQmpveG1FcWJL?=
 =?utf-8?B?akdzYWduNC9zamRFNDExOUxBWHhZMUxpVTJLMjNNdG9NSXFtRHplN0lQVWNL?=
 =?utf-8?B?bWtZZXZ0S21KWEVYUEI0NHZyajU2Vm9Temx0dmllZzE3TVByTm44ZityNUpJ?=
 =?utf-8?B?ODRwNExGWjVQMDZBOXNHdDdITmdEbVQ4OG1xLzh0LzJsTGcwVkJBc3ZCUzlS?=
 =?utf-8?B?K1cvcFk1N0ZEdkhGZ3l3cG4zWDVScXlkdVNpUFhmQjNWTXYxa2VFQUExWmVi?=
 =?utf-8?B?SXkvdy9RY2JhSHlYdkxXU0lTTlNmTEtCSEN5aGdyc3ZXWkxDNmk1dzltMjYv?=
 =?utf-8?B?Y1ZCYWgvTFo3RmpQN0JTYm1Dck5RZDVVZ3ZmV3lNc2Z3TTlBTHFaMHFZQXJL?=
 =?utf-8?B?RGdwK1Qya3M5Lyt2OTRlaHBRQlo5TFppZHF1VS9xcW9VM2FlYXV5Nm5PZ1dG?=
 =?utf-8?B?UXo4V2loOUkwbnBlT3pFL3JIbEpGRTJpemxweEd5eURYZXRBYUNLdFVISVBk?=
 =?utf-8?B?U0xuY21BeVZGMlZRQnZCVEE5azIydXZQV3lCcTA2RmVvcHpQeXNrUG9qTWdJ?=
 =?utf-8?B?VDI1NUhScVZLR25qRTdUTkd6bzQ3aEl0TERFVmVwL2ZCTjJiYktSM3Y0L2w2?=
 =?utf-8?B?UXFiV3drekZyQXo1S3JKSVdkQTVsQlVNWnBXSHBFVzE0cWMyVktsVy9HT1BU?=
 =?utf-8?B?c2k2d1FNOUh2YXZNS0lzM2pCT21NbHF3RjVoM1VoMEtFZXhJdkFKMG9YSG8x?=
 =?utf-8?B?TTdSNVlZZUhJV2NhYTBXWHNMbDFUd3VJZTd4TlNsdHZEdFhTMzF5d0Q1Skla?=
 =?utf-8?B?ZkhJdmI4RHdSQzZmc016SzhVVjFOenlPWHNNYWMvb3lkYmMrU2Z3UVA5a0dT?=
 =?utf-8?B?Njl4MVp6QWx4T1ptZWxrVFNDSFdiMThHZmFEeEZ5dUJzeWs0eEtjeEtVaVk2?=
 =?utf-8?B?T0Y1eXJKMjgyOXNmRm9xbFJVR1Z0d2wrSzMxRzJOeHdYZVV6MVE5c1hlU0xt?=
 =?utf-8?B?NDhHT0pWaFoyYXFrYjFDWFp3bHlQbnJWcmZ0aXhZZlh0Vkg5UGdnWVZDaFRu?=
 =?utf-8?B?SENQOU1uSk5zcmcxYmwzUjJZZ1IwcTQydGx6U0ZGcEp6OW92NVpPTFZaLzVW?=
 =?utf-8?Q?j7zoTihe50STKJ05hPrNA0Fo8Dq+Mc3i?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGdLVENxbEZFMGxEQ3NiRWxsUXNGZXVVL05QbnZXRzVDbmlxZTVaTVZHcWFV?=
 =?utf-8?B?UTdiSGVTSGZMNzA2K3NOdldJcGQ0MHZwSUZiV2NFeFAwWlRZbDM4amwzN1lG?=
 =?utf-8?B?S2N3SDl4OGo1N3BRb2xGZTZjcVFXMllsWElmeFB1dVdWU3QwY0J4WUFJaHZj?=
 =?utf-8?B?eTlGcHI2eG5NVllWRHdnOHRrV1VVbm83RzRpVHVTZHhWVXVJaTg4R2cxY2Fx?=
 =?utf-8?B?UFpiWnF0N3doZEc3SWNWR2Q3YXRrSWlGRzQxVEI0QUt2bythTWZxUjcyYjIr?=
 =?utf-8?B?RlNxcS9yS2NlTDlkdjlyT0dpTFFEbnN0TmZnTmYyN3MzYlFNYmlwTCthZlRM?=
 =?utf-8?B?YmR0VXY3bkx0Mi91NllVeUJWWHQxWk15OGdWWE4vZFJxZ25TY1ZKV0R3ZVhI?=
 =?utf-8?B?RWYyWDJJdDlyRnhIUUNmVzRja0NtclBPSWZoTWFPWUdvdFVOR1czclhjUk4w?=
 =?utf-8?B?ZGMxazVpbFd4b1lTRDVzVzBSbytUU01JQ3M0by84RXZlMWRnR0VZelI2SUx2?=
 =?utf-8?B?VkFDYjBYeGZ3Z0locHFZb1NMNC9lN0hwaldFUHJRMld3Y2VyaGJOZTIvZis2?=
 =?utf-8?B?eDIvaCs5VC9hdGV2alk2TXozckI4MWs5RDVKSFFPZUd5K0hKeE1XajZaZ0tC?=
 =?utf-8?B?WGp6REUwNFJPSndYQzh2VnFvajltYkwvZnYyemVTUG9RZjNkU1JNVE03b1M1?=
 =?utf-8?B?cmNsaTR4SXVRU0lUVVlrMHdRVGk0UWNiTWlEOWRCTVFYVGJBY09NemlTdVhG?=
 =?utf-8?B?ZnBQVDVENjhnaFpNbHhWUGNRVExmN1pqTTdCSjhVR0dGYVR4blk0NzY1Ync3?=
 =?utf-8?B?NHNGOTVhNUxDMTJnTUdqWXk3Sndta0tSeTZwL2dzV3czUmhFbGw0MjFzQld6?=
 =?utf-8?B?V3RPV2htUlJXb2FWaENTVktCWXhrVUp6SXJjSWhBV2daMC9WdkRDb01yZi9m?=
 =?utf-8?B?RHBKZzk4MGlZK1lqUjI3K1JUL0VNRlYvWDNwdElMUU5US1A4NFJTVjVIUUpx?=
 =?utf-8?B?RmpCSFc0OFNFSVJ3aHd5OGdPR05GTzZFb2luT2FROFFHQm1CWXg0c3pkeERz?=
 =?utf-8?B?b1YvM0szeE5pQUxXd0tXL2lZUnJtT3hPUkNmNzlXWE1hYVplOHRSRjdOcHc5?=
 =?utf-8?B?STlDQlQ3N1A1S2NPQ3ZheTh4Y1pIL0hvekZEazNGRkIwdTBsUDFOYlY5UVVE?=
 =?utf-8?B?WkVDNmFJeGpFMDNyZUwvNHFOUGFEZlUrYkd3KytONTlvOWZXbUYyMUVndHFH?=
 =?utf-8?B?MHAyTUc2S3pZUzczSVNEN3YrNWdGMEFoMmd3Tlh2Qjh2UWtZTVByVktnSllO?=
 =?utf-8?B?aTUrWkduUGNuN0hvd3FvOXl4Nnppc1F2eHQ1QUFENWJFc3NvMlk5RXI4TEVq?=
 =?utf-8?B?ZTNMRWJmTWpFSWl4R1pMSkhQU3JpZVhwYmZ6R2ZsSE1pUCtSaEpFU3FIUnJ6?=
 =?utf-8?B?V2c3VDgvcllzS1E4ZlhOZUpidWxZcStMa1RHMlJTQ2Vwck5JZmhEYklzcUJr?=
 =?utf-8?B?VE9HTjVuOURjV2lLSnpqSDdLWk5DdU5USkh3b0RqaiszOUFvdUdwVWZKcVNy?=
 =?utf-8?B?UFdXWUd0dFhRT2lPb3Mzd2h4c3hCemovekx6cmxXanJTTG1VM2ROK2JqYkl6?=
 =?utf-8?B?TElNS2QrNGZYRTVReW9pRjB1d2hZVDlCaUl1L2sxZ2dOZU0ycitHNEZZL0lk?=
 =?utf-8?B?NzNiRm9IUU91cVdtdFNhRjNhdFlYeHQ4aFdyZ2c4QVJQcjlCcjFkVTFwZXRT?=
 =?utf-8?B?T2grU3VrOUFxcUI5blkwTjQrUlZGMDVEbnZ6azI5NWpGbnhwcmZ2SXc5Nnp5?=
 =?utf-8?B?bHhMNERIWFRrYzdlUU5XVzNaaDVDVTdXOXJJWnd0SnZSVzBkSCtDazNTdFNI?=
 =?utf-8?B?VVQ2ampmNi9tbkhjUENPZ25UR1FESlBHNTh3RTR2czBDc1puVWxYU0NKOXVp?=
 =?utf-8?B?WUJtRkZVK3BqYnZVLzYraWFFeVZXN1JCY3E2TXB0dm13UCtzSXdVdno0OWow?=
 =?utf-8?B?RCtDTThkaXg0VWR3MTZQZXduNjB2VklXQXFlbjI4cjEzRDZpSGdhcWxUSERU?=
 =?utf-8?B?VEsyZGxha2dwdkpUS1ZZRTdMYUUyNTdySGl4QVhWVzNXS3hZR0ZyQnJxZFM3?=
 =?utf-8?B?RTZFQUFKL1FSa0t5d2E4NWNvbnNNMVZNb1IvQ0p0T0JPNFVVZXJnelZOTHhz?=
 =?utf-8?B?QlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ad3e4d0e-b4f7-4751-1a1f-08de109fdf95
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 12:46:37.3332 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6DhskvCDOWHFenrIXBmrOTwHggmEvP7Ib8L2au9zBgYnB1CVFETJRWsiVPSrkEZSpVjDIDoqv6rxm4QwJ6Exh+PIZmmiL0cRdCqvWWf+nAQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6516
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



On 10/21/2025 2:18 PM, Maarten Lankhorst wrote:
> Do not directly dereference xe_ggtt_node, and add
> a function to retrieve the allocated GGTT size.
> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> Reviewed-by: <Matthew.brost@intel.com>
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>

double s-o-b

> ---
>  drivers/gpu/drm/xe/xe_ggtt.c               | 11 +++++++++++
>  drivers/gpu/drm/xe/xe_ggtt.h               |  1 +
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 15 ++++++++-------
>  3 files changed, 20 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 05515037e2d6a..81038d94b497d 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -1090,3 +1090,14 @@ u64 xe_ggtt_node_addr(const struct xe_ggtt_node *node)
>  {
>  	return node->base.start;
>  }
> +
> +/**
> + * xe_ggtt_node_size - Get @node allocation size.
> + * @node: &xe_ggtt_node
> + *
> + * Get the allocated node's size.

    * Return: ...

> + */
> +u64 xe_ggtt_node_size(const struct xe_ggtt_node *node)
> +{
> +	return node->base.size;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> index 4a8ef1b824156..b69f05a6adbf8 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> @@ -59,5 +59,6 @@ u64 xe_ggtt_encode_pte_flags(struct xe_ggtt *ggtt, struct xe_bo *bo, u16 pat_ind
>  u64 xe_ggtt_read_pte(struct xe_ggtt *ggtt, u64 offset);
>  
>  u64 xe_ggtt_node_addr(const struct xe_ggtt_node *node);
> +u64 xe_ggtt_node_size(const struct xe_ggtt_node *node);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index f96f96425c2ec..19d1013d0c4c8 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -264,7 +264,7 @@ static u32 encode_config_ggtt(u32 *cfg, const struct xe_gt_sriov_config *config,
>  	if (!xe_ggtt_node_allocated(node))
>  		return 0;
>  
> -	return encode_ggtt(cfg, node->base.start, node->base.size, details);
> +	return encode_ggtt(cfg, xe_ggtt_node_addr(node), xe_ggtt_node_size(node), details);
>  }
>  
>  /* Return: number of configuration dwords written */
> @@ -495,9 +495,9 @@ static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
>  
>  	xe_ggtt_assign(node, vfid);
>  	xe_gt_sriov_dbg_verbose(gt, "VF%u assigned GGTT %llx-%llx\n",
> -				vfid, node->base.start, node->base.start + node->base.size - 1);
> +				vfid, xe_ggtt_node_addr(node), xe_ggtt_node_addr(node) + size - 1);
>  
> -	err = pf_distribute_config_ggtt(gt->tile, vfid, node->base.start, node->base.size);
> +	err = pf_distribute_config_ggtt(gt->tile, vfid, xe_ggtt_node_addr(node), size);
>  	if (unlikely(err))
>  		goto err;
>  
> @@ -514,7 +514,7 @@ static u64 pf_get_vf_config_ggtt(struct xe_gt *gt, unsigned int vfid)
>  	struct xe_ggtt_node *node = config->ggtt_region;
>  
>  	xe_gt_assert(gt, xe_gt_is_main_type(gt));
> -	return xe_ggtt_node_allocated(node) ? node->base.size : 0;
> +	return xe_ggtt_node_allocated(node) ? xe_ggtt_node_size(node) : 0;
>  }
>  
>  /**
> @@ -2517,11 +2517,12 @@ int xe_gt_sriov_pf_config_print_ggtt(struct xe_gt *gt, struct drm_printer *p)
>  		if (!xe_ggtt_node_allocated(config->ggtt_region))
>  			continue;
>  
> -		string_get_size(config->ggtt_region->base.size, 1, STRING_UNITS_2,
> +		string_get_size(xe_ggtt_node_size(config->ggtt_region), 1, STRING_UNITS_2,
>  				buf, sizeof(buf));
>  		drm_printf(p, "VF%u:\t%#0llx-%#llx\t(%s)\n",
> -			   n, config->ggtt_region->base.start,
> -			   config->ggtt_region->base.start + config->ggtt_region->base.size - 1,
> +			   n, xe_ggtt_node_addr(config->ggtt_region),
> +			   xe_ggtt_node_addr(config->ggtt_region) +
> +			   xe_ggtt_node_size(config->ggtt_region) - 1,
>  			   buf);
>  	}
>  

just nits, so

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>


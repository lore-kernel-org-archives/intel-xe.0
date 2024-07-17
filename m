Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6CDCC3DA4B
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 12:13:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BD1A10EA7F;
	Wed, 17 Jul 2024 12:13:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gOSjcoLM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0745B10EA7F
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 12:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721218436; x=1752754436;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=UPdNHaWLRNaudZs9S46D0PbZGomz0GMZ/AQ5/rPU0Fo=;
 b=gOSjcoLMc+qdIZ6Vds/rxDLe/fUX1iy40079QOuTbNYYu+xJHLPpUZxG
 jkZBhF0h5mG4BOpNK5YVY7cjjI5UJb0ivXxgqNF7TmBgoTzQwpkdCQl53
 5V29aUETeXQRuePKfLr3CKu5XJJiD0siP8+W3oZ9YRDzFBP0z35aOTH+o
 SbEvctt5axNM3vB46I7ejbmwErFJu/razwy3iQI9frpBoI/J2Kh8fAXiI
 pEdowi1E6ZN/e/cuCgd1vDeGLEfLg6wRvakeg+iVaqA7bkL35EXPRGnT2
 IoYO3FyGya7i1Lxe44JQgBhBIZWQGscZj6xNwJC6ISXpAj1aMHmrLCiv+ w==;
X-CSE-ConnectionGUID: kQ+CKSofSbuVat5v6AwKqw==
X-CSE-MsgGUID: x2Gi1c6CQSyvGqYHzPwtkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="44141448"
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="44141448"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 05:13:55 -0700
X-CSE-ConnectionGUID: e4ZqJrRgRrax47zHtcc/5A==
X-CSE-MsgGUID: pehPnzbPTheM3qgC/Bev6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="50110749"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jul 2024 05:13:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 05:13:54 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 17 Jul 2024 05:13:54 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 17 Jul 2024 05:13:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WGNvtjaUj5TEgkul2WPi5+We8RcWb+QnW4JBYUDb4OMGdu1h4CPiZq78KyOxMWwMiO7zX7gTR+2opLxZmGXvd+GaNdaKzBydXtPaZo2r1h5f9V3arufoZJSRDBT6s7HB70xsvLzjna5c29Y0Kfpr67pL74Y/JxVQqxhlsibWdt2m+u64eIq/1J7RCk+Hm3FkyYiC4lswiRTawV150Y+Ttf+nW0VZJgMPjDqSwKp0S19vNPS932exkoWLtj8/sqL0zMYhNSolbHXdxMIMpMUWMD3NqHfzQc/5ZA9i2oG6kofjiWsPgWlrNFgGbR0FTS/tF18LjC82+703qiI1O0wn+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RjsZSMIDXhVxUMnSVzQFmlgoUR6knZTGMfdl5pUjy84=;
 b=aC5SBMrRiD6aGX4SC413i479z8mATUVS8hkDEpCAHHCb5uYQpGdm6ff7mZqXZ/SAUOFzw6+LjZxMsOEXXjSnYdh24Xmn6bROaKhqYNXjXdn0arEoTg2F39+jD8z24oaXAC6WRBmI2udnBVcmHtQocQOlPiKKPwTaJtU6Ny4CQwPJhlRoVyJfxErkDPMqfFaHe9Z99UIgbAkblQCscteFh73rwmEuAOqhjoctedObQa13zUd8p1ysKeaZ3FaFltmLSzZHMjdwe1lDBytaWZ2+/OJVcdKcc7iQETz7YvYCwWDyCO2hUUyaV9xlNgRZUXHir9OjFcReo3x65+V0mmDt3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB4853.namprd11.prod.outlook.com (2603:10b6:510:40::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Wed, 17 Jul
 2024 12:13:46 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.032; Wed, 17 Jul 2024
 12:13:46 +0000
Date: Wed, 17 Jul 2024 12:12:57 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <akshatajahagirdar6@gmail.com>, "Himal
 Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v6 4/8] drm/xe/xe2: Introduce identity map for compressed
 pat for vram
Message-ID: <Zpe1SYQMQzMaZKUP@DUT025-TGLU.fm.intel.com>
References: <cover.1721193361.git.akshata.jahagirdar@intel.com>
 <8168fd897d321f46ede7e932375119d2cb971911.1721193361.git.akshata.jahagirdar@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8168fd897d321f46ede7e932375119d2cb971911.1721193361.git.akshata.jahagirdar@intel.com>
X-ClientProxiedBy: SJ0PR13CA0085.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB4853:EE_
X-MS-Office365-Filtering-Correlation-Id: 762a41de-055c-4841-bef8-08dca659e8ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S1JaUXY3eUp0UTBQckI4OXJneDJIalY4SC9USkhvUFBPbUJqQVpnMkwrY0NP?=
 =?utf-8?B?Wm4yWW0waklyWFlRUU9UbGxScHVtUTZ2bjVaQkVnbkhHdTd4Yzh6MFFrcEFx?=
 =?utf-8?B?Rk9ZK0ZjRVM5WXhGOXpGS05JaVpFbGt0aUxWYWJySzhaS0tGeitaUGRPY3NC?=
 =?utf-8?B?YlZsQVV1UEVsVVkrNERDalFzRXpTeXNYUFFlN0crS1BhQUZEdjk0ZUtSb0RI?=
 =?utf-8?B?aU9zVytiaGhwU0hkNmVOZ2FlWFpsdXlyemNrUXRFYWdqM2pvY3FGOWhjSEdu?=
 =?utf-8?B?Rnk3TWVic1NuQTdwWGlkUzZkazd2MS9mRWhKY3QyTkRFNk1XRXcyVjNMek1B?=
 =?utf-8?B?UGFVbEVRM0ZsM2NvR1Y4N1FJcEZGa0dHOVhCc2RBNFR2emRoT2E4UjR4RlFW?=
 =?utf-8?B?cU5pdHRlbVZjMjhvQ0pSaW5hejhQUm4xY0lrN3hodE9LRkxrcmNOdCt5UytI?=
 =?utf-8?B?RUx2R0Vvei9hZ1E3SE9mYVdGTWVsbzFpREJvK2s2dklVQ3BwWXVUQjlmaG5p?=
 =?utf-8?B?YnUxRjVrV05KYVhDMHJIaXhqUXZJMHJQMVU2SzQ4d2VkUEdhVy94eWdWVmVK?=
 =?utf-8?B?a2pTTlg1b2tuQTlIU1lZOUp3eXdyZ1hvT0liWnQxQ2xENmRYemwzWUd5MHV0?=
 =?utf-8?B?cWp4WXM0aWIvVGdHTG1XZHZ0b3N1cnk2U3pidC9WYmV6RHhRbnVpUTNPU2Za?=
 =?utf-8?B?NHlld2lDR2I4ck85cWg5Mm1VRFJ5Z2dTeUhsRlF1K2IyWEhWU2pVZDQ1MW9O?=
 =?utf-8?B?S1Q2OWUwQmJFcmUzSUVGRnNwU0FmbWxSczc2ODM1WmFZVUxidmNkYmhrT1Mz?=
 =?utf-8?B?OFpBWEFCMndlNmozOW4yU1RrczNFdFBaQkg1aGdhU2E3ajZ0WElZdnplWXI2?=
 =?utf-8?B?aG55ekIrZDBQcFBTVDBvWXBBekZEdTZidE1lVVB3STVWN2Y3ZVljREM1S2Y5?=
 =?utf-8?B?Q09WWW1pci8vVjlKREpyWnBKUzhlUC9RNUljVDQyU3ZWK3lWdlo5TGdpZ3hk?=
 =?utf-8?B?YndOL0EySDZ4aC80YzFXbUYzVUU1ZFN6clZ5czZ6NUdKZWUvSWJVeWhxZFdQ?=
 =?utf-8?B?YjUycVFDOG1HU0YrUVZ5ZXpJRG9tSVBmZTFmU1FBaW5nMmI2d0tWRDRxYVZn?=
 =?utf-8?B?ZmJxY1BSbjZSa0MvMnMvdUdRclltRThoYjVZQTNsUTJTSlBSSnNsd3B3MlJS?=
 =?utf-8?B?VTl6SnB6cC9sN2kvVkUzUTJIRXZwQmtjZW5mTGlmc1JBcWY5WU5UTjFFZ0Iz?=
 =?utf-8?B?YkV4eUN4Q2VVNzBkeXJxaEdYbnVoOFpjcFcyYUwySkluSmVLNUVsKzlOSjR0?=
 =?utf-8?B?MFl2KzhnSmJjVDBvL0IrQXBYcG90UDB5UklVQ0tDU2k3L1ZHTUhtbmdCYlRi?=
 =?utf-8?B?RWpkQytLUGRjbFp2eGw3UEovMGt6bEVnTlBPcXNpRjg2OUJqUlJWakJVcEJr?=
 =?utf-8?B?OWhodFdqWmloOVoxcENzQlp2cFc3ZGh3ZDNSMnQ2Z05JZ29vTHVpR0pON0Jy?=
 =?utf-8?B?Rm5yaXdtRkhabFhqSGhPU2VxWi9pSFhtak82K2tLdERBN01RM3Vrd3RSN1hP?=
 =?utf-8?B?Ry9NUjJFSDFDQVFOaWdwYzVNVE5yNHBjalRqVHo3T2M4MHdBV2dXWitQRkRL?=
 =?utf-8?B?dmhrVWVIS3U4ZVhQYk9VbWo0NVErT2thUGtTUTFPSEtaVzlMZ2hraTQ1ODRi?=
 =?utf-8?B?cjdCN3RZdHNWK1JBZzdwSkxrcFA1TTFxVU1tcUVsZHRXWms3bUxPbkI2cmFj?=
 =?utf-8?B?Ynl0Uk12T3FyRktSSFQ5SVpIUURpTlMvQkV4WmM5ZUZPUE5wWWo4alVlT0dH?=
 =?utf-8?B?Nk5KbzgyRklGMGhiSTFkUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXdRWHJIOUlOdUt4SUh3bkFQM29ROHkyWW1PalFxblBjd3BxZW15Wlp0VWJw?=
 =?utf-8?B?NU8yVDdUejlxTGc0RFNUcnlXT20yeUo0c0dOc2dMVDV5Wlliak5nWjBoWHhN?=
 =?utf-8?B?WU1HQitCZTFteG9nNWFXWGJ3SzNtcWtFQnNpNENtQTliRFp1bTVqNDdFZHhX?=
 =?utf-8?B?SWFLeUlyMENJeGRFUENuQ0E0Qm16TmRvUW9ydmxsaWMvZjYzOXdHYjBnNXlX?=
 =?utf-8?B?cGY5VHc1NzViQVNoVUVhc1djeEpxdnM1YXBEbWhVYmVVeW1YTENncmtUZ1pL?=
 =?utf-8?B?UGNpS0ViU1Nkb0pLTnlrQW9jVmdZZWtNN2NqczFJN1p5UzRUUTY3aEZFak4r?=
 =?utf-8?B?L1RlVHFMNXIvVlJwcUhqOERLcDVBUzc5a0xMMFc5NXptNWQ2TDkyS2c1a1FY?=
 =?utf-8?B?TGhiUE1PSmtaVnBhNzRjYlJlSnY2N0h2QmFjditOa2M4SThDSysrYmhkczlB?=
 =?utf-8?B?NXA2LzBndG5NQmpMdkppckdxYXl3NXZkRkpXeFNnalJlVFVOUnpueUxmb05T?=
 =?utf-8?B?NzVTeU1aK3YxRkQwSFhVdDQ2eFhBZzVsSElNcUg1WWdWT3hWWEliakd2cW5G?=
 =?utf-8?B?Q2N2Wkc3UFVtZDF1TzJ1MTNqS1lwV2ZUYk94N3JrK3hSR0JFSGN2eVFlVHcr?=
 =?utf-8?B?cmdmR3ROOWJxUVRwL0NjcWJKZmR4VXJYVTBFay83TXdXblVRSEp3WmY5eEhx?=
 =?utf-8?B?aXhTSG9rc3k2a1RYZE16dTB0dExpU2pMcHlSZmZ1dEpUK25lYStDSVNsYkxj?=
 =?utf-8?B?YmRnd2NMRHlKV3JBWWxpY2laT1JIaGFmN1JDU3hScVYxNzUvQi8rUmJCYy9N?=
 =?utf-8?B?YitQaloxaDRLTjVRZUtEMHBDaHpRajlqQUZRNkdsakZIUFFvM2Ntc3dEcS91?=
 =?utf-8?B?djhDdUVQMVhBTDhYeS8xNmV1eDVrMDQ5SHRkSjMxYlA1MWtjdHduR2phWXI0?=
 =?utf-8?B?U3U2cldrQ0xGVFJ4djJqaXN4YWphbVhKMFBVVzkvREJpQ0w3N2NUa1plaC9S?=
 =?utf-8?B?YWRvY1ZHV1I1ZXR4bnh3NWtxWFJadFNDMlpMR1VWMGoreTRvL3FOaE5HS1Zw?=
 =?utf-8?B?UWtwOWNpTzM3Uy9RNkRXMW1UYW5zeXBGczB5R3d5TjVTUmdZSTV0UkFTRXVI?=
 =?utf-8?B?OWJKSkVQN2VRNlZzdXJRNDhxTDBaWTBDZkhyeXNUTFhTNm9WaUdyUHVyRTVC?=
 =?utf-8?B?RW54YzFpZXo2MnY4eG91RG5mQkFpc0JYMyt1TCsxZGxPeXhRVTI4SGtJaHB6?=
 =?utf-8?B?cEw3Z0pmQmxWL2JRUkVoNTE4eUdtZjNaVXRwZE5zZU1WRXkxK1RtdlZ5WTJp?=
 =?utf-8?B?b0NTU3l5eFVYNmlrSHNhS09TL1czYW1qZzV2R1R4U1AyWnFFc2ZwbFRTclpi?=
 =?utf-8?B?RXdsUXhPczZmN0IranZlY1ZtRXRWdWh2anNqbHRoM1RjVnBCN0hJZ0ZkS2pm?=
 =?utf-8?B?TUhTVTR1WXFua3R1U25KQXRjN1NGTld2L1drVTcwbk5DemRZY0dsVzBYNjJk?=
 =?utf-8?B?L2s3dnFISHJWdmdjenU4RklHQ01zNUlNMzVwZXJvSWU0UHhKNzZGTTkvMklk?=
 =?utf-8?B?ZU1kUUMrTGNYVjdWWm9lMWRTQkY1SGxjSVFQMnBtT0tXdEhCbnBWRk1Yeng1?=
 =?utf-8?B?ckpncmFLaGdlT0RWNHVhaXFWN2doaHBoeVQ1UmV0WW0vSjR4ZnVlY2xpRUZi?=
 =?utf-8?B?MWtMcTNubEtER0IxTzV4b0QxZXdVQWVZQjhDb25pR25GcncrQjdWdlFpMnFx?=
 =?utf-8?B?M0c2K3hvM1crWkxaWEhpNUU5My9lallQaDVMSDlUcHF6RlRIWWF4ZGlVV2dp?=
 =?utf-8?B?aGc0UzJhVnBDa2xtN3BqSzlYcUdMVWFiK09zdzBJK1JLZkNOUDhqbDNMQTNh?=
 =?utf-8?B?Znk2T0ZMOWhrTlhlcUZvSWkzRTdmd0dpWkc0Y1hGWEJreWl5czQxdmw3a3B4?=
 =?utf-8?B?enc3NEorb3o5eHBqQzVSTU1zOW1NZE4wZ2JVNGR4cWY5c0UrWWsyRFNRVnp4?=
 =?utf-8?B?SnE0QTNLNVpIbTFwRVhWTUI5T3c0Y1FFWFBUVlJTRUpoSTVYclNjbXNlMXNK?=
 =?utf-8?B?SnV4R0k4UHF5Y3VOU1ZUcFcyV2xuUVNnWXhrQnM0dmsxMStoN3hMditlajZL?=
 =?utf-8?B?SFYycHNhejcrcytnUHlKSXNNdm5PM2FydmZnU3Iwclo1ZW0zY0FyeUxwN0R3?=
 =?utf-8?B?L0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 762a41de-055c-4841-bef8-08dca659e8ac
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2024 12:13:46.6932 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4bP5QTEH30kWJAKphRDzgsDBA2UDSqIB5Y4NEZh09KPhiHv1/P6lga1AYRDhr7anE7E3ygFCf+msSasByYr0Fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4853
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

On Wed, Jul 17, 2024 at 05:21:29AM +0000, Akshata Jahagirdar wrote:
> Xe2+ has unified compression (exactly one compression mode/format),
> where compression is now controlled via PAT at PTE level.
> This simplifies KMD operations, as it can now decompress freely
> without concern for the buffer's original compression format—unlike DG2,
> which had multiple compression formats and thus required copying the
> raw CCS state during VRAM eviction. In addition mixed VRAM and system
> memory buffers were not supported with compression enabled.
> 
> On Xe2 dGPU compression is still only supported with VRAM, however we
> can now support compression with VRAM and system memory buffers,
> with GPU access being seamless underneath. So long as when doing
> VRAM -> system memory the KMD uses compressed -> uncompressed,
> to decompress it. This also allows CPU access to such buffers,
> assuming that userspace first decompress the corresponding
> pages being accessed.
> If the pages are already in system memory then KMD would have already
> decompressed them. When restoring such buffers with sysmem -> VRAM
> the KMD can't easily know which pages were originally compressed,
> so we always use uncompressed -> uncompressed here.
> With this it also means we can drop all the raw CCS handling on such
> platforms (including needing to allocate extra CCS storage).
> 
> In order to support this we now need to have two different identity
> mappings for compressed and uncompressed VRAM.
> In this patch, we set up the additional identity map for the VRAM with
> compressed pat_index. We then select the appropriate mapping during
> migration/clear. During eviction (vram->sysmem), we use the mapping
> from compressed -> uncompressed. During restore (sysmem->vram), we need
> the mapping from uncompressed -> uncompressed.
> Therefore, we need to have two different mappings for compressed and
> uncompressed vram. We set up an additional identity map for the vram
> with compressed pat_index.
> We then select the appropriate mapping during migration/clear.
> 
> v2: Formatting nits, Updated code to match recent changes in
>     xe_migrate_prepare_vm(). (Matt)
> 
> v3: Move identity map loop to a helper function. (Matt Brost)
> 
> v4: Split helper function in different patch, and
> 	add asserts and nits. (Matt Brost)
> 
> v5: Convert the 2 bool arguments of pte_update_size to flags
> 	argument (Matt Brost)
> 
> v6: Formatting nits (Matt Brost)
> 
> Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

A few nits that can fixed at merge but LGTM:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/tests/xe_migrate.c |  7 ++-
>  drivers/gpu/drm/xe/xe_migrate.c       | 81 ++++++++++++++++++++-------
>  2 files changed, 65 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
> index 353b908845f7..47c105263b49 100644
> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> @@ -393,17 +393,20 @@ static struct dma_fence *blt_copy(struct xe_tile *tile,
>  		u32 flush_flags = 0;
>  		u32 update_idx;
>  		u32 avail_pts = max_mem_transfer_per_pass(xe) / LEVEL0_PAGE_TABLE_ENCODE_SIZE;
> +		u32 pte_flags;
>  
>  		src_L0 = xe_migrate_res_sizes(m, &src_it);
>  		dst_L0 = xe_migrate_res_sizes(m, &dst_it);
>  
>  		src_L0 = min(src_L0, dst_L0);
>  
> -		batch_size += pte_update_size(m, src_is_vram, src_is_vram, src, &src_it, &src_L0,
> +		pte_flags = src_is_vram ? (BIT(0) | BIT(1)) : 0;

You should be able to use PTE_UPDATE_FLAG_IS_VRAM and
PTE_UPDATE_FLAG_IS_COMP_PTE here because this file is included
drivers/gpu/drm/xe/xe_migrate.c here those are defined.

> +		batch_size += pte_update_size(m, pte_flags, src, &src_it, &src_L0,
>  					      &src_L0_ofs, &src_L0_pt, 0, 0,
>  					      avail_pts);
>  
> -		batch_size += pte_update_size(m, dst_is_vram, dst_is_vram, dst, &dst_it, &src_L0,
> +		pte_flags = dst_is_vram ? (BIT(0) | BIT(1)) : 0;
> +		batch_size += pte_update_size(m, pte_flags, dst, &dst_it, &src_L0,
>  					      &dst_L0_ofs, &dst_L0_pt, 0,
>  					      avail_pts, avail_pts);
>  
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 49ad5d8443cf..746656dfc970 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -73,6 +73,7 @@ struct xe_migrate {
>  #define NUM_PT_SLOTS 32
>  #define LEVEL0_PAGE_TABLE_ENCODE_SIZE SZ_2M
>  #define MAX_NUM_PTE 512
> +#define IDENTITY_OFFSET 256ULL
>  
>  /*
>   * Although MI_STORE_DATA_IMM's "length" field is 10-bits, 0x3FE is the largest
> @@ -120,14 +121,19 @@ static u64 xe_migrate_vm_addr(u64 slot, u32 level)
>  	return (slot + 1ULL) << xe_pt_shift(level + 1);
>  }
>  
> -static u64 xe_migrate_vram_ofs(struct xe_device *xe, u64 addr)
> +static u64 xe_migrate_vram_ofs(struct xe_device *xe, u64 addr, bool is_comp_pte)
>  {
>  	/*
>  	 * Remove the DPA to get a correct offset into identity table for the
>  	 * migrate offset
>  	 */
> +	u64 identity_offset = IDENTITY_OFFSET;
> +
> +	if (GRAPHICS_VER(xe) >= 20 && is_comp_pte)
> +		identity_offset += DIV_ROUND_UP_ULL(xe->mem.vram.actual_physical_size, SZ_1G);
> +
>  	addr -= xe->mem.vram.dpa_base;
> -	return addr + (256ULL << xe_pt_shift(2));
> +	return addr + (identity_offset << xe_pt_shift(2));
>  }
>  
>  static void xe_migrate_program_identity(struct xe_device *xe, struct xe_vm *vm, struct xe_bo *bo,
> @@ -182,10 +188,13 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  	u16 pat_index = xe->pat.idx[XE_CACHE_WB];
>  	u8 id = tile->id;
>  	u32 num_entries = NUM_PT_SLOTS, num_level = vm->pt_root[id]->level,
> -	    num_setup = num_level + 1;
> +	    num_setup;
> +#define VRAM_IDENTITY_MAP_COUNT	2
> +num_setup = num_level + VRAM_IDENTITY_MAP_COUNT;

I'm suprised checkpatch is not complaining here.

Sorry if I was clear here, the formatting should be so indentation is
correct and 'num_setup' is initialized when declared.

 	u32 num_entries = NUM_PT_SLOTS, num_level = vm->pt_root[id]->level;
#define VRAM_IDENTITY_MAP_COUNT	2
	u32 num_setup = num_level + VRAM_IDENTITY_MAP_COUNT;
#undef

> +#undef VRAM_IDENTITY_MAP_COUNT
>  	u32 map_ofs, level, i;
>  	struct xe_bo *bo, *batch = tile->mem.kernel_bb_pool->bo;
> -	u64 entry, pt30_ofs;
> +	u64 entry, pt29_ofs;
>  
>  	/* Can't bump NUM_PT_SLOTS too high */
>  	BUILD_BUG_ON(NUM_PT_SLOTS > SZ_2M/XE_PAGE_SIZE);
> @@ -205,9 +214,9 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  	if (IS_ERR(bo))
>  		return PTR_ERR(bo);
>  
> -	/* PT31 reserved for 2M identity map */
> -	pt30_ofs = bo->size - 2 * XE_PAGE_SIZE;
> -	entry = vm->pt_ops->pde_encode_bo(bo, pt30_ofs, pat_index);
> +	/* PT30 & PT31 reserved for 2M identity map */
> +	pt29_ofs = bo->size - 3 * XE_PAGE_SIZE;
> +	entry = vm->pt_ops->pde_encode_bo(bo, pt29_ofs, pat_index);
>  	xe_pt_write(xe, &vm->pt_root[id]->bo->vmap, 0, entry);
>  
>  	map_ofs = (num_entries - num_setup) * XE_PAGE_SIZE;
> @@ -259,12 +268,12 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  	} else {
>  		u64 batch_addr = xe_bo_addr(batch, 0, XE_PAGE_SIZE);
>  
> -		m->batch_base_ofs = xe_migrate_vram_ofs(xe, batch_addr);
> +		m->batch_base_ofs = xe_migrate_vram_ofs(xe, batch_addr, false);
>  
>  		if (xe->info.has_usm) {
>  			batch = tile->primary_gt->usm.bb_pool->bo;
>  			batch_addr = xe_bo_addr(batch, 0, XE_PAGE_SIZE);
> -			m->usm_batch_base_ofs = xe_migrate_vram_ofs(xe, batch_addr);
> +			m->usm_batch_base_ofs = xe_migrate_vram_ofs(xe, batch_addr, false);
>  		}
>  	}
>  
> @@ -298,18 +307,36 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  
>  	/* Identity map the entire vram at 256GiB offset */
>  	if (IS_DGFX(xe)) {
> -		u64 pt31_ofs = bo->size - XE_PAGE_SIZE;
> +		u64 pt30_ofs = bo->size - 2 * XE_PAGE_SIZE;
>  
> -		xe_migrate_program_identity(xe, vm, bo, map_ofs, 256, pat_index, pt31_ofs);
> -		xe_assert(xe, (xe->mem.vram.actual_physical_size <= SZ_256G));
> +		xe_migrate_program_identity(xe, vm, bo, map_ofs, IDENTITY_OFFSET,
> +					    pat_index, pt30_ofs);
> +		xe_assert(xe, xe->mem.vram.actual_physical_size <=
> +					(MAX_NUM_PTE - IDENTITY_OFFSET) * SZ_1G);
> +
> +		/*
> +		 * Identity map the entire vram for compressed pat_index for xe2+
> +		 * if flat ccs is enabled.
> +		 */
> +		if (GRAPHICS_VER(xe) >= 20 && xe_device_has_flat_ccs(xe)) {
> +			u16 comp_pat_index = xe->pat.idx[XE_CACHE_NONE_COMPRESSION];
> +			u64 vram_offset = IDENTITY_OFFSET +
> +				DIV_ROUND_UP_ULL(xe->mem.vram.actual_physical_size, SZ_1G);
> +			u64 pt31_ofs = bo->size - XE_PAGE_SIZE;
> +
> +			xe_assert(xe, xe->mem.vram.actual_physical_size <= (MAX_NUM_PTE -
> +						IDENTITY_OFFSET - IDENTITY_OFFSET / 2) * SZ_1G);
> +			xe_migrate_program_identity(xe, vm, bo, map_ofs, vram_offset,
> +						    comp_pat_index, pt31_ofs);
> +		}
>  	}
>  
>  	/*
>  	 * Example layout created above, with root level = 3:
>  	 * [PT0...PT7]: kernel PT's for copy/clear; 64 or 4KiB PTE's
>  	 * [PT8]: Kernel PT for VM_BIND, 4 KiB PTE's
> -	 * [PT9...PT27]: Userspace PT's for VM_BIND, 4 KiB PTE's
> -	 * [PT28 = PDE 0] [PT29 = PDE 1] [PT30 = PDE 2] [PT31 = 2M vram identity map]
> +	 * [PT9...PT26]: Userspace PT's for VM_BIND, 4 KiB PTE's
> +	 * [PT27 = PDE 0] [PT28 = PDE 1] [PT29 = PDE 2] [PT30 & PT31 = 2M vram identity map]
>  	 *
>  	 * This makes the lowest part of the VM point to the pagetables.
>  	 * Hence the lowest 2M in the vm should point to itself, with a few writes
> @@ -487,20 +514,26 @@ static bool xe_migrate_allow_identity(u64 size, const struct xe_res_cursor *cur)
>  	return cur->size >= size;
>  }
>  
> +#define PTE_UPDATE_FLAG_IS_VRAM		BIT(0)
> +#define PTE_UPDATE_FLAG_IS_COMP_PTE	BIT(1)
> +
>  static u32 pte_update_size(struct xe_migrate *m,
> -			   bool is_vram,
> +			   u32 flags,
>  			   struct ttm_resource *res,
>  			   struct xe_res_cursor *cur,
>  			   u64 *L0, u64 *L0_ofs, u32 *L0_pt,
>  			   u32 cmd_size, u32 pt_ofs, u32 avail_pts)
>  {
>  	u32 cmds = 0;
> +	bool is_vram = PTE_UPDATE_FLAG_IS_VRAM & flags;
> +	bool is_comp_pte = PTE_UPDATE_FLAG_IS_COMP_PTE & flags;
>  
>  	*L0_pt = pt_ofs;
>  	if (is_vram && xe_migrate_allow_identity(*L0, cur)) {
>  		/* Offset into identity map. */
>  		*L0_ofs = xe_migrate_vram_ofs(tile_to_xe(m->tile),
> -					      cur->start + vram_region_gpu_offset(res));
> +					      cur->start + vram_region_gpu_offset(res),
> +					      is_comp_pte);
>  		cmds += cmd_size;
>  	} else {
>  		/* Clip L0 to available size */
> @@ -779,6 +812,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>  		u32 update_idx;
>  		u64 ccs_ofs, ccs_size;
>  		u32 ccs_pt;
> +		u32 pte_flags;
>  
>  		bool usm = xe->info.has_usm;
>  		u32 avail_pts = max_mem_transfer_per_pass(xe) / LEVEL0_PAGE_TABLE_ENCODE_SIZE;
> @@ -791,17 +825,19 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>  
>  		src_L0 = min(src_L0, dst_L0);
>  
> -		batch_size += pte_update_size(m, src_is_vram, src, &src_it, &src_L0,
> +		pte_flags = src_is_vram ? PTE_UPDATE_FLAG_IS_VRAM : 0;
> +		batch_size += pte_update_size(m, pte_flags, src, &src_it, &src_L0,
>  					      &src_L0_ofs, &src_L0_pt, 0, 0,
>  					      avail_pts);
>  
> -		batch_size += pte_update_size(m, dst_is_vram, dst, &dst_it, &src_L0,
> +		pte_flags = dst_is_vram ? PTE_UPDATE_FLAG_IS_VRAM : 0;
> +		batch_size += pte_update_size(m, pte_flags, dst, &dst_it, &src_L0,
>  					      &dst_L0_ofs, &dst_L0_pt, 0,
>  					      avail_pts, avail_pts);
>  
>  		if (copy_system_ccs) {
>  			ccs_size = xe_device_ccs_bytes(xe, src_L0);
> -			batch_size += pte_update_size(m, false, NULL, &ccs_it, &ccs_size,
> +			batch_size += pte_update_size(m, 0, NULL, &ccs_it, &ccs_size,
>  						      &ccs_ofs, &ccs_pt, 0,
>  						      2 * avail_pts,
>  						      avail_pts);
> @@ -1034,6 +1070,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>  		struct xe_sched_job *job;
>  		struct xe_bb *bb;
>  		u32 batch_size, update_idx;
> +		u32 pte_flags;
>  
>  		bool usm = xe->info.has_usm;
>  		u32 avail_pts = max_mem_transfer_per_pass(xe) / LEVEL0_PAGE_TABLE_ENCODE_SIZE;
> @@ -1041,8 +1078,9 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>  		clear_L0 = xe_migrate_res_sizes(m, &src_it);
>  
>  		/* Calculate final sizes and batch size.. */
> +		pte_flags = clear_vram ? PTE_UPDATE_FLAG_IS_VRAM : 0;
>  		batch_size = 2 +
> -			pte_update_size(m, clear_vram, src, &src_it,
> +			pte_update_size(m, pte_flags, src, &src_it,
>  					&clear_L0, &clear_L0_ofs, &clear_L0_pt,
>  					clear_system_ccs ? 0 : emit_clear_cmd_len(gt), 0,
>  					avail_pts);
> @@ -1159,7 +1197,7 @@ static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
>  	if (!ppgtt_ofs)
>  		ppgtt_ofs = xe_migrate_vram_ofs(tile_to_xe(tile),
>  						xe_bo_addr(update->pt_bo, 0,
> -							   XE_PAGE_SIZE));
> +							   XE_PAGE_SIZE), false);
>  
>  	do {
>  		u64 addr = ppgtt_ofs + ofs * 8;
> @@ -1493,3 +1531,4 @@ void xe_migrate_wait(struct xe_migrate *m)
>  #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
>  #include "tests/xe_migrate.c"
>  #endif
> +

Not related.

Matt

> -- 
> 2.34.1
> 

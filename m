Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12EA1CCF9E0
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 19:47:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAE5610E223;
	Fri, 24 Oct 2025 19:47:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ETKY7jU9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92B2810E223
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Oct 2025 19:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761335249; x=1792871249;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=iUmymtfRD1aq6TW5EHk4MS81TPkUFHk59fjLQBEd8/0=;
 b=ETKY7jU97gJLyXjy9qr8VTGgVOKy0WLXeb9fOtcPB16HtgfDUyNeKid8
 83h9Aai70wPQuOKQUFmIzkN8XSLMrqgnAd4tyWu3yCHp+i1+XViHBvISq
 n9lLyt4uWZPMz0svx8kW77FQL+ZUFyaz6BK7I4XTBAQu6LLSSqhJxaQfw
 ymvLYroC40tR2WU9nnqOBiDeQRliCThYQq5gUfmgu5cO0tUZ2pvxfhNMk
 f0nR63Z7Wfqzqjo4MdaSsCqeO3UkZVPIQsSUxuGNAiIunyB9m4mrKqveg
 oYUYmLN1bIOwcLoIqIgkINmp+zfLQPLIuFsVlj0Pb2sdOFn9a5AIfIz9h g==;
X-CSE-ConnectionGUID: u59mM6U7RZWvOlq0Zp5+3g==
X-CSE-MsgGUID: XOkaa3ilRW+uENt6Rez2Gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63671876"
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; d="scan'208";a="63671876"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 12:47:29 -0700
X-CSE-ConnectionGUID: KWfYp8erTIiOD8m+mBF3bw==
X-CSE-MsgGUID: yflnH3o5TieyVDf++N9WRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; d="scan'208";a="184411873"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 12:47:28 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 12:47:27 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 24 Oct 2025 12:47:27 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.20) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 12:47:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MsenIFCKkQ9aMCCtEMQKA0dgG9zuY+JqhLhHi00bAZVGT3ZJnjZ15XcjsNBNEdNBX0L2g4hyZcK3KS9LLWf2k0Gm/Xb4dfX7Fm3EEZIDLKd6QSHhVDbUX6QA/GFoGMVhd5DVSd3AEAMsDkmlnZcd/JVqIdZy4DsihH0JdYzOF3Ci1QHjykIHnqnXsioEoVR3bXTLLNwESS5mvyaqvZByqQrvOpGQkHa90MYRfJphE8dud4VWRXJLVjricAEhOLviEvckND4DEHPJZsVMNFX1DFmgDaiWxWqqsMX+3cJgXyKuIjG3bcWYdZkm0X1SMn0wtpYXIDAwf7UP7jC8MUdwuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YPman4AZZ/4wGOWCCYetXXoiYcbJtzDG2m3197p4a1o=;
 b=EDgHoK3hp2JBz3/N3AAXbCmhe732+Oll/5bsXK3uHqb8o3mnWaaOQdlh3YgMw1znB2jSQFt1CN57LVugUg4sHVxfQdcvWxdLqu2RCpX2l1K/shUgL2tsa/wXmJxGvQciqlxhRSvZ4fKCY/pR6yB8UqofJBJe7X2Q8LDmUdtBLY6uYHwdpdmLWFH2hRrkatiQbfuH5Cc4jMce8yhI0x1bIRlYfc2Agw4YSUh6zfPbwxxOwxbi3ZlmLO5H3R57/8AIfL5XTPaXokiPIFj9Iv0IgCAqDBnlVSmUIIWmli6ZV6mlv209N0xaZw17bH8BouNPBsRRU7e6tJUQ9WT0adx9Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SJ0PR11MB6669.namprd11.prod.outlook.com (2603:10b6:a03:449::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 19:47:25 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 19:47:25 +0000
Date: Fri, 24 Oct 2025 15:47:22 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH 10/14] drm/xe/pf: Allow change PF scheduling priority
 using sysfs
Message-ID: <aPvXyh49bwFILFEU@intel.com>
References: <20251020182414.576-1-michal.wajdeczko@intel.com>
 <20251020182414.576-11-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251020182414.576-11-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0179.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::34) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SJ0PR11MB6669:EE_
X-MS-Office365-Filtering-Correlation-Id: 608cc4ea-6213-4657-1324-08de133627cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cC82azZVUlVnUk1DZkNCN25MWi8vWE5SSjN5L3AwbWxJMi9SWnpLTkE4Nk9T?=
 =?utf-8?B?NThqRCtxeEdBR3JmMzRuQUducnhxTXM3TithQnAxNHhYZzFKMzdZYkNmVGZ2?=
 =?utf-8?B?NSsyN2Q3MlpsT29WT1FQSjFqK3lJVGFCT2d3dXlGNmZYVlhwY3lBUUhGYVBQ?=
 =?utf-8?B?ZmphUEJIbk1HOUgvMHhqNmd3a21KNXQ1VGtsa1dBYXhjUUVlR1cxeHBXaGla?=
 =?utf-8?B?VGl0QVRYMktJVWhvQXJjbTAwVFl5cWlQVVBERlJ5bU5MTWF0MlUxMGdkdlpE?=
 =?utf-8?B?NllwTWtRZExPZGxBYWxtVzYrbnpkb0lrdmxqUERydDdjZkNUa0hENnMvQVFV?=
 =?utf-8?B?WEZ3ZVJjendEQ3JReHNzOWJUT0RWSlFna1VYeHBJL2NVWjlKOVpDU25RQStm?=
 =?utf-8?B?MnAxSTArckcxUXUzekl1RzB5MUVFVU9sVE93WC8xQ3Q4L3FGSWNYMTlDQjcz?=
 =?utf-8?B?a01xMWFKVGM0S1ptZTkzRVArOHptbmo1Q0pybFgrSjU2YngzT0xOZXExb3pM?=
 =?utf-8?B?dnUreWFFL1ZFM0ZwMVArTDZMUm9kOEhjSkxWem9DeElLUXVJRmpLUjdPbllp?=
 =?utf-8?B?RTVMNWR5WUlNUUxSS2MyODYrektaU09MTTNHK1g2ck1kcStGbDdPMGJzZWJr?=
 =?utf-8?B?T2pFalMvU0VMMVI4SjB6VG1RQnJucVZYaHBhRDJTTXF1ckRiOEY3NWRMaEhR?=
 =?utf-8?B?bHZXOVRrZGZONEE5MTBWVmNqMnhoRnFOSmpMRUEwaW5pMFVhTDIwNXBoRnB5?=
 =?utf-8?B?QnYrMDlTZUI4aDFGaXErVHZCMm0wT2VuWHdBYWpJVDJ2SXJBRytTY1d4SmRK?=
 =?utf-8?B?ZDIvMzRDUUt5UVZzRFg2T2h6Y0wvL0JSSmFLVDVpM1NleERuM1Z2RnpQV0lB?=
 =?utf-8?B?a1pxSTgrbVlLOUdIeWJwN3MwV1N1R0dIZkdRTnlYTW1CRUk2V2FxdFhTWDB6?=
 =?utf-8?B?WTQzeFVieUpjQWphbmZqR2ZVWnhXdkdId2swdG9jYmVHN1phK0xFV0lJSXdJ?=
 =?utf-8?B?TStKaXpqWlAzY00wakhyMitaR0VNY0xMUnZUaStkZGNtcVBoTFRyN2JXYURi?=
 =?utf-8?B?VDNTNjhJeUlobGw1eElUd3lIWmo3WS9BYlVaNHphanFRYlJ0bVpGbGZNZElB?=
 =?utf-8?B?VXpWelVvMWE0WUdCaE9vV0EvRzhNNHNETXdjMzMvYUdUSStDUzh0UjFIcURI?=
 =?utf-8?B?S3Exa0Q3L0VHYURxTlVHYUxhMWc5ek9zVklvUDVocGJuU1RldFJIMUI5S25m?=
 =?utf-8?B?TVlRZU5HSisySkFBYzNpM250UUJLTDFPM0I4ZU1LZzZzNVlURzNFNWJhbkNI?=
 =?utf-8?B?U3VZTUFuTlFCSkJhc3l1a0RoREo5S1JnVXZrcklBOHA4U1g4Z2U5SHpzWERQ?=
 =?utf-8?B?QVZYSkVyQTh1SEQ4YmxHcUV2UzF4SzVrYllDNnYxd3pkUVYwMitpKzVUcFE5?=
 =?utf-8?B?SDZOL0FhYkZWNXAwVTNpREtXMTdEalJxMm5CYXhMUXFnMmQvekJLSU5Ba2p5?=
 =?utf-8?B?QjFNeU8xN3h2NDZuRjBLZXNGNWVUVWhlcGJCNzBlbzRydXBOODFBSkhkQk5y?=
 =?utf-8?B?STdYZlFnbzR4YUljUVJKSVIvR0RWd3VydGRDNm5ON2lhT3pUNVlvTG5GSHBa?=
 =?utf-8?B?TDVnVUxnNEJ1S0pESW10U1JGR3ZUZlFvOWZhNXU4QUZxMWtkUnFTeFNLc2th?=
 =?utf-8?B?ZmkrRUIyVkR1dGdJVy9XbVJJZ0hNcHFxVVpFS0YwVnpWK1lOdDBjVlI3bkxW?=
 =?utf-8?B?SHVqUjNNNlFSdi9BQ0VNUGJtay9HMVhmNWE1QkNsQkxySkFFMElmUWs0L09N?=
 =?utf-8?B?TkpuQzNuQXZJalAvTmxkOEN2eVJVZGxZdkI1VU04YlF4UVVZWUR0SVc1WW9E?=
 =?utf-8?B?VS80eFIrVkdWMDcweFpia0tSTzFHajVkbTFudlZSalZOVElWUy9HUmxyb1hX?=
 =?utf-8?Q?JsKXNT8T7cusfEYikCEE90YRhiE1p0Qk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTVmUVdTRUpCdUdPYmJNRGMxb3h6MWdqVHd4U2ErTCtRYmFWRHRZZHVFcGxu?=
 =?utf-8?B?NWdCWjNvTE9wL0F0dks4aFZjeVR3TlFkV2FMN01tYWFnejJpMWx6YjBVTkVC?=
 =?utf-8?B?RXY5cVVMMG1aQ0NoTG1ZZmNMM28wb0hrdTd1bE4wTk93eWExYW1haGtEMVFM?=
 =?utf-8?B?MitJWXVVWVg2QWkyeTdGRG1iWTloS0NHZ1AwNXQ5dXEyaWJseU0yUGphWHd2?=
 =?utf-8?B?cjFvdGVNdTZKV3lnc1lQTmVTdEhINDJHZHpSMjZVRm1SOTYxamdEN1VoWndF?=
 =?utf-8?B?OVYrTkVFR29JVkdFR1BQbUJ1VGdEQ3JnTjRVaGYrc2Q5NVc3c2hjZTN0Smx5?=
 =?utf-8?B?cHZlN1BtT1pxVHI5MTVmU21yYzkrR3dvMmZGVU9iSEF5TVcwL203U1N1enFU?=
 =?utf-8?B?RTVkT2lKSHhZR2xEOXdMcDI3MTFSY1NSc3IwRUZWeVZ1bWZ6VFJnZS9vR3BK?=
 =?utf-8?B?VU92cjVwdjZxMGJOd0ZSY0UvNFRMcXE0WldBajhkd213VEx5enZzeVg5dU0v?=
 =?utf-8?B?N3Q3KzczbFVhbks0Yld4MkZjSUtCeldHMk5lYjR0cko2dVp1Z2JENUc2ZStN?=
 =?utf-8?B?WU5KS091bFE3cHhJTlptSnJUM2FsaXgwWVV2QmpaVVk1NzROcHhOcWR3WldL?=
 =?utf-8?B?Z2srL0VNcGI3d2RCQ01TbjMvQjhsL0N1eVlHQUdpY1FqUFBNS05YODdSaDBP?=
 =?utf-8?B?dEJkMGk5THZLVjBobVVXTTc3N09nSlIxbGQ2WHZNczAvSk9DbUFXc2RPZmFZ?=
 =?utf-8?B?Ty9kU3JoMTFYZjZubnZoVVE2UlUyaWJmN0pSQ243OVkrS25QQnJJTi9pQjBF?=
 =?utf-8?B?QmN4cE5NWlFHbEVKMVE2Z2JveGxqZHdmYVg0S2NtUUxzenVoU0hPNmJJSkp0?=
 =?utf-8?B?TDJ3QVJ3U3RYaGF5OHAzTmNoSFJqVzltRmZtb3BhcUJtZjRRSGZxTVRZc1Fu?=
 =?utf-8?B?c2EzNTQwU0lSWUdtZjcrMTJHQmE5YUNrbmpTZjlKMEdvUXplTGtJd1YrUXVT?=
 =?utf-8?B?Si9EMEZKN3hGTEs5SUtkUHN5cmpYSFJDWFp1TGZYREFTNStORzQwN1ozcTdp?=
 =?utf-8?B?V20yTURySXJBQit3dXc3a0c1T0UvSFRVZ0lXamkwbDRiNExPbkZPOVcrVXNy?=
 =?utf-8?B?QXhBdWViS3JNY2ZEM1hpNWV5WnpnT3k4akZnS0UwUi9RczNSa09FNUhqbTNK?=
 =?utf-8?B?SGkvZ25zRjFYS3ZzQWFBWWQ5dXVwMWk0cHhlNHpZS05rdmVHZmdVV1JHRGlV?=
 =?utf-8?B?emkvdGwrbU9WeEZqY29keXJpcHhIYXYyeWFWS1g1LzhyVTM5dWVNZGdBcFM0?=
 =?utf-8?B?SjlvMTVIS21lUHdVQmFDL3ArcWQ5OFgxNzNFMkRSdVJXZWpQTFdpZzFoNkJQ?=
 =?utf-8?B?SG5qYTRNZ2hKQ2cwNUxkUTZqb0pBL3dOUHFqeHZaT2VVcjVmSEYyU0lBbjdY?=
 =?utf-8?B?UUpocHhYZlJzQzZ5OTNPZFVqbDZ0Z1JvbW1UWTBFdWtGenFRZnFhbXk1VStD?=
 =?utf-8?B?dFkwVXJMQUZWZEFLUWpDUHQ4dlFkUUNqa0psaVFMWWpJWUg2TDJqUmUvRmhM?=
 =?utf-8?B?UHNQWHIwUzBtM0JrZnFPWmh0UEhUZGU2RnUyT2tXMy9NU296L1IzOXNxY2dj?=
 =?utf-8?B?QUI5bFBGcmRJOTdQaWtlNldCS28zQnptSk5tUjJoZU5mdk54TDdHSmpqenBG?=
 =?utf-8?B?NDFKZm1va20yZFhWZEgrQisvaTUxSlVLRVR0NjBnai8rYXluUHRLRnZyWTY3?=
 =?utf-8?B?Kyt6UWlOaXc1QTVONlo4bHNQbnNaN0xUSmFzOWJIR1dBdzB4TEV2cVZJSEFi?=
 =?utf-8?B?M1dyQmVzYktLQ3B4WVVxYkk0bWdQcjFxeVVYS21RdWNDR0k0U040QkgwWGkz?=
 =?utf-8?B?UWVOZWJRczhBU3V2L0g3Q2MrUC9OSkJpOXArSzZ6OG5JL0tRZC9INXpWUjBx?=
 =?utf-8?B?emxjRWZNb2hTYTNHZG5tQnN3UEZnejlyM2MzZUlrK29EblMyYjI2aFdRa3p6?=
 =?utf-8?B?c1lLODllbHRRNDlqbHBFWm8rVk5CV2FaWmJ4R25KWjlreEdEYW8vNkh0MWF4?=
 =?utf-8?B?QjV5ZHJEdy9pdEgzbkZBVFdOcytwLzlyR3UzY1paaDc3QWkvaWlXU21LQndC?=
 =?utf-8?Q?bw30ljirwpnlwVl8/m4/JgRVS?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 608cc4ea-6213-4657-1324-08de133627cf
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 19:47:25.2917 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cOvCbZZNpYfzDivePYCZ66OY83Ts6xvU7a92dS3xB5Um5OmUWinml4Gn7Fv3YN7r9ZS6082ou1hH29LGLyG5vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6669
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

On Mon, Oct 20, 2025 at 08:24:10PM +0200, Michal Wajdeczko wrote:
> We have just added bulk change of the scheduling priority for all
> VFs and PF, but that only allow to select LOW and NORMAL priority.
> 
> Add read-write attribute under PF to allow changing its priority
> without impacting other VFs priority settings.
> 
> For completeness also add read-only attributes under VFs, to show
> currently selected priority levels used by the VFs.
> 
>   /sys/bus/pci/drivers/xe/BDF/
>   ├── sriov_admin/
>       ├── pf/
>       │   └── profile
>       │       └── sched_priority	[RW] low, normal, high
>       ├── vf1/
>       │   └── profile
>       │       └── sched_priority	[RO] low, normal
> 

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> Writing "high" to the PF read-write attribute will change PF
> priority on all tiles/GTs to HIGH (schedule function in the next
> time-slice after current one completes and it has work). Writing
> "low" or "normal" to change priority to LOW/NORMAL is supported.
> 
> When read, those files will display the current and available
> scheduling priorities. The currently active priority level will
> be enclosed in square brackets, default output will be like:
> 
>  $ grep . -h sriov_admin/{pf,vf1,vf2}/profile/sched_priority
>  [low] normal high
>  [low] normal
>  [low] normal
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c | 82 +++++++++++++++++++++++++-
>  1 file changed, 80 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
> index 26ba9a2efec9..a6be3c88fa4f 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
> @@ -17,6 +17,21 @@
>  #include "xe_sriov_pf_sysfs.h"
>  #include "xe_sriov_printk.h"
>  
> +static int emit_choice(char *buf, int choice, const char * const *array, size_t size)
> +{
> +	int pos = 0;
> +	int n;
> +
> +	for (n = 0; n < size; n++) {
> +		pos += sysfs_emit_at(buf, pos, "%s%s%s%s",
> +				    n ? " " : "",
> +				    n == choice ? "[" : "",
> +				    array[n],
> +				    n == choice ? "]" : "");
> +	}
> +	return pos + sysfs_emit_at(buf, pos, "\n");
> +}
> +
>  /*
>   * /sys/bus/pci/drivers/xe/BDF/
>   * :
> @@ -30,12 +45,14 @@
>   *     │   ├── ...
>   *     │   └── profile
>   *     │       ├── exec_quantum_ms
> - *     │       └── preempt_timeout_us
> + *     │       ├── preempt_timeout_us
> + *     │       └── sched_priority
>   *     ├── vf1/
>   *     │   ├── ...
>   *     │   └── profile
>   *     │       ├── exec_quantum_ms
> - *     │       └── preempt_timeout_us
> + *     │       ├── preempt_timeout_us
> + *     │       └── sched_priority
>   *     ├── vf2/
>   *     :
>   *     └── vfN/
> @@ -115,6 +132,12 @@ static const char * const sched_priority_names[] = {
>  	[GUC_SCHED_PRIORITY_HIGH] = "high",
>  };
>  
> +static bool sched_priority_change_allowed(unsigned int vfid)
> +{
> +	/* As of today GuC FW allows to selectively change only the PF priority. */
> +	return vfid == PFID;
> +}
> +
>  static bool sched_priority_high_allowed(unsigned int vfid)
>  {
>  	/* As of today GuC FW allows to select 'high' priority only for the PF. */
> @@ -199,15 +222,70 @@ static XE_SRIOV_VF_ATTR(NAME)
>  DEFINE_SIMPLE_PROVISIONING_SRIOV_VF_ATTR(exec_quantum_ms, eq, u32, "%u\n");
>  DEFINE_SIMPLE_PROVISIONING_SRIOV_VF_ATTR(preempt_timeout_us, pt, u32, "%u\n");
>  
> +static ssize_t xe_sriov_vf_attr_sched_priority_show(struct xe_device *xe, unsigned int vfid,
> +						    char *buf)
> +{
> +	size_t num_priorities = ARRAY_SIZE(sched_priority_names);
> +	u32 priority;
> +	int err;
> +
> +	err = xe_sriov_pf_provision_query_vf_priority(xe, vfid, &priority);
> +	if (err)
> +		return err;
> +
> +	if (!sched_priority_high_allowed(vfid))
> +		num_priorities--;
> +
> +	xe_assert(xe, priority < num_priorities);
> +	return emit_choice(buf, priority, sched_priority_names, num_priorities);
> +}
> +
> +static ssize_t xe_sriov_vf_attr_sched_priority_store(struct xe_device *xe, unsigned int vfid,
> +						     const char *buf, size_t count)
> +{
> +	size_t num_priorities = ARRAY_SIZE(sched_priority_names);
> +	int match;
> +	int err;
> +
> +	if (!sched_priority_change_allowed(vfid))
> +		return -EOPNOTSUPP;
> +
> +	if (!sched_priority_high_allowed(vfid))
> +		num_priorities--;
> +
> +	match = __sysfs_match_string(sched_priority_names, num_priorities, buf);
> +	if (match < 0)
> +		return -EINVAL;
> +
> +	err = xe_sriov_pf_provision_apply_vf_priority(xe, vfid, match);
> +	return err ?: count;
> +}
> +
> +static XE_SRIOV_VF_ATTR(sched_priority);
> +
>  static struct attribute *profile_vf_attrs[] = {
>  	&xe_sriov_vf_attr_exec_quantum_ms.attr,
>  	&xe_sriov_vf_attr_preempt_timeout_us.attr,
> +	&xe_sriov_vf_attr_sched_priority.attr,
>  	NULL
>  };
>  
> +static umode_t profile_vf_attr_is_visible(struct kobject *kobj,
> +					  struct attribute *attr, int index)
> +{
> +	struct xe_sriov_kobj *vkobj = to_xe_sriov_kobj(kobj);
> +
> +	if (attr == &xe_sriov_vf_attr_sched_priority.attr &&
> +	    !sched_priority_change_allowed(vkobj->vfid))
> +		return attr->mode & 0444;
> +
> +	return attr->mode;
> +}
> +
>  static const struct attribute_group profile_vf_attr_group = {
>  	.name = "profile",
>  	.attrs = profile_vf_attrs,
> +	.is_visible = profile_vf_attr_is_visible,
>  };
>  
>  static const struct attribute_group *xe_sriov_vf_attr_groups[] = {
> -- 
> 2.47.1
> 

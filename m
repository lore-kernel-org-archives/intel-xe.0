Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD3DC2BA1A
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jun 2024 07:24:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91D3C10E5A3;
	Tue, 18 Jun 2024 07:24:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mO9fipXR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1540510E5A3
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Jun 2024 07:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718695449; x=1750231449;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=hepcF8tuE4HSoKABhvYuTXsKBG2JNodDY3N/bhlMULs=;
 b=mO9fipXR4baFY4CYv7UOddG5mGfZOlENgLVbyjaZWsIwmWHMmYBcp+hX
 o7Aib2XGlwVkgohVHd+Z9eXQJTzOcIyH1K88LwfWh12Uq0rCikyaztxgn
 1ocW9P6bml0WecjDBWrNS2dOnt4vI7GdG2ndn5eSl0p9G1MhlVpwpnuXr
 v2JzXNMvHjggsGcToSlKZRZCGsSdH+P8r1sZ2xZCWGobJXla8QMbE+HAV
 EYZLK7UHs2BZM+1pWZjZF367VVufh9C7nRxag3DHauKsjV8dhQtV7kcdQ
 wfdMhVTpvXpeerrNX4IZ6SYJfxsnVMu4nqu4AEWMaITh+kQq7nEmr0NE1 A==;
X-CSE-ConnectionGUID: 6p3OXWdrT2KiQ1BMchNVkQ==
X-CSE-MsgGUID: fObPpCHbTm6xskXBt8Iwyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="26672451"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="26672451"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 00:24:09 -0700
X-CSE-ConnectionGUID: dfdxtL7OROa2ZgTh+I/uDA==
X-CSE-MsgGUID: uLVO+sWPSSypnpRSgGsY3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="41322794"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jun 2024 00:24:08 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 18 Jun 2024 00:24:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 18 Jun 2024 00:24:08 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 18 Jun 2024 00:24:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A+Dholqdx19BFm224IRC4301phHZJbyqVpqaYJypXv1A3+OR7ZoLZ8dcyUfItO+lu+BYOT05dZjJE+w7ZagdtSuDvg/u9JY9WbZx1lX4JMWWpaXOeOoV1PAznJy/GXFvK1t1AEJ2WsHKc+U42P7juNHlZXKFujVjEOQSFg6QmElKhS3jM2a1gOkxgnM+pbM6Xvn/iUPbJOJ2AFDFRRiG6Sg6fUUQIBdJT0RGNZiOXFEqpn1/RHpnSMKqdYDF11DYo10JgglPNlBaYHN3BCs+b6KHrfQJJx97eXcFKkTy9x62iiGjpETOon+JDAJHjLtE/7RelpVweSy6HNDEh23rlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MgSoaV1jeALxxT74Al8imZWbmisoL386qbGi1yK7boE=;
 b=LPU55yEO5b+UBLRp0hDTEbwWlTrhdJURlJabEyBvd3rwu0RFcGLaGjyPsukz1lRWAF/Y/6VQjODzjKNixF7udBFjv+0nTv9EuPoF7wUtVU3KnQuzIWa6YwYyJACvVTEBnNN2bMp48lEMGPa8LPZSCLKVDVmA4c08b4orpI3S5wMdwiASd+vbqFjsuJY8NiYMEE8tmAqGZ/BTbF3u1/Mile8ysze+Uyd/GoWpWHYTnJdsg/rziwk6smLZ1uOpF8fPlecEiL3MT/8FLQdD3UBknB7hl2qShcgeEAcxrUVqJNiGMkEU0i9fUjf/+wy9q5QIZI8hANj0l4ZuKObcVVJhNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6138.namprd11.prod.outlook.com (2603:10b6:930:2a::11)
 by PH8PR11MB8258.namprd11.prod.outlook.com (2603:10b6:510:1c1::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.29; Tue, 18 Jun
 2024 07:23:59 +0000
Received: from CY5PR11MB6138.namprd11.prod.outlook.com
 ([fe80::f24e:b21e:c458:4e74]) by CY5PR11MB6138.namprd11.prod.outlook.com
 ([fe80::f24e:b21e:c458:4e74%5]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 07:23:59 +0000
Date: Tue, 18 Jun 2024 09:23:51 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Allow const pointer when checking SR-IOV mode
Message-ID: <20240618072351.2jgamzb6dxdcjq26@intel.com>
References: <20240617122613.553-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240617122613.553-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: ZR2P278CA0081.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:65::17) To CY5PR11MB6138.namprd11.prod.outlook.com
 (2603:10b6:930:2a::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6138:EE_|PH8PR11MB8258:EE_
X-MS-Office365-Filtering-Correlation-Id: 899dcbc9-df31-4eb0-f05e-08dc8f679f25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|1800799021|366013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y2l0Y21OMjlWT0M2Ymx2WU1DL1R5YldRMEV1ODZ4WFpLditkbjRPQWl2MXRw?=
 =?utf-8?B?cUlhdDNGUmg0N0NxL1VOV2d4MWR4UmE0WXJvcG9QUnlpTmN0TjRBelU0Q0Ez?=
 =?utf-8?B?NEIvYS81ais2MVN2UzB5eU1mVDNYc0Y1bVNqdENEOWd6dFFmbXE5Q2E0NVE2?=
 =?utf-8?B?OSt6Q3lJZkNYdmw2UDdxeWlvNDNuazh3aWlMcTN1OHhGYmU1ak1oZ1BuTkhn?=
 =?utf-8?B?aE5Ha3pXclhlWmdpd2JUa3FHMnptMUVXd3pFSXVGN0JQb1BOV0wwV09BYkFI?=
 =?utf-8?B?V3FvRTBBdjJQOTdZaGUzbHVLZi9JbWJQck53RFBxMTlNeCsxZWtxVi81NlA1?=
 =?utf-8?B?VnErVlQ0NWNvN1JhWGhDcUxuRWk0R24yRDNuZU5KSS9ldVFkODhYZmFKOG1w?=
 =?utf-8?B?bGhvd1gyekdpRThNN3Qvb1lTV0NXQ09JNXVMNHBLaWxMZVZkZ3Z2cWFyTnB1?=
 =?utf-8?B?S3lIT1ltcVI5c0xIWndHUXFaYmlxaXZmdG1YcEl2NCt6dngxSC9ZdWxlbGNJ?=
 =?utf-8?B?SjRhdGFUUXg5Skp4L00zNmV4V1hTR2h3ejdrMStDOWVFTHF2YWR0L25Ga2s0?=
 =?utf-8?B?di9oQzNvRG1OV0xwMWVIRHZ6a0Fya25RVnp1a25aQ3VtUHRzQi83dHIzMllD?=
 =?utf-8?B?UWRLamQyKzVOd3FnZjR5VHNjWTYzUUQ5MzczZ09DRkRGU3pIRVhYazVFakk0?=
 =?utf-8?B?L05lUjQ0ZWoza0JHUkVhOVJyVEFYTzN5SzBuRkNvRFdJTHlYTitybTNpUGpi?=
 =?utf-8?B?MWN0dDlNMUFYTHFSRSt5TmVMRlRUeGU4VlZlVDdHd29DSjF4eHBFeUFTS1RK?=
 =?utf-8?B?RW92Njl2MC9qUlpDVXlka25wbzdTNjRDMW5ZRjQvNzNpNXc3T3F3Y1V5aXE5?=
 =?utf-8?B?dDZHMW5semhNWEZjYlRDbkFzSklMdnhyMmtMQ2gwQ0U2K050aFpodzBDWHFV?=
 =?utf-8?B?aVRBNUFDUkhUd3FFK24yRGV1NVNQREo4U0dwejNEdlJkQ2FsVXY4Mmt3ZUVM?=
 =?utf-8?B?Y2NsTjRxdUtkKzg5V2hOdHY1QlpiOSs1YnRicytSc0NFTjBJdVI4S2xTblg1?=
 =?utf-8?B?SlpvZ0VtWGttc3FseGJ4NktUM2t4UkhPeFZ2UWJOeHFudXlLKzhpNjNTYVFI?=
 =?utf-8?B?TFg5bk9STHFOWGZVeG1kNWV3RW9WRGNpM0xiYks4Q1VYSEtZNUNhUEhPTERo?=
 =?utf-8?B?SzJwVEVFdkR2ald0elozbWk3WXhPOGVMQ0dUTlBpbVp0WDF5RG9tdlljbGFk?=
 =?utf-8?B?cVZaaWtpcG52M0lsMXl5ZTRwNmkrY3ZTcmNjYzFKcWN3NHlnaUZlYW9tSHZq?=
 =?utf-8?B?QjBpQTVFTFlvUzc3c2sxcDJUelRxYTZyVDhsdWJOOHN3bk1nN3Yvb1EyOHB1?=
 =?utf-8?B?RmhNbXNSVGJ6NjRLNUZyVEtCZ0I5cGE1c09pM0d3aWZ4ZHhjbWUwQnJPNlBL?=
 =?utf-8?B?TW5Qb25yKzRjNWt5ajJsWXJNbnphSkhCRitmaEp2dFo4SXg4eUMzL3owREtz?=
 =?utf-8?B?U1d1Z1E4MXRudGtoeDZmUmFRZjJIK0dYVzhsa1JDSGlGdjFtUG5rR0sxKzQ5?=
 =?utf-8?B?aFhFTjF2ZHlJcUltdGpyWXgzME9CRy9ZQ1F1VEpRbTA4MzExb212eWJwRUlB?=
 =?utf-8?B?b0k2MEZXSURRRFpqU0tlaWNYaFBEd1FZWnBMS2FEdjNTRElBVWtsSm9CU0JH?=
 =?utf-8?B?UlNzTU91YTk5am1TVjN5ZmkvRjFSMnFUMS80a3BqQW1weXkyaHM5VmwyQ2tn?=
 =?utf-8?Q?aocCIWEvenBza1qbW38N8Zp2AxpUNs7Zr7gXe5a?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6138.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(1800799021)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWR5R2ZrUUpEN0prYlg5aUlUUDF0K0tGdml3cGp5VHoxL1NVUzhRZklRa3Yr?=
 =?utf-8?B?azBPTDFwcnhmK2J0b3oyTXgwMFB1OWs0cGkxMFFGWGorTlFUU3Q1VlE0S0E5?=
 =?utf-8?B?RkNrRmg4MG5ZdnR0OVhOZEUvaFFIL2VnTGxKSmdXNGZKQUpYZTFRL20vQkgz?=
 =?utf-8?B?ZjNEZ0U2ajBMN3BMc0tUbk1oQmlMR1RpUEJpVG9BWjkvZUVtODdocEg0NGNJ?=
 =?utf-8?B?TVkwNUs5cTZtQ0MvUnJSaHpHdDN4cW4xYXJieGFUME9tZzRvNXdqdHo3QXpS?=
 =?utf-8?B?b0VScUVHOUxXT3JJQks2d3c2QXhBa1Z3UW5YR3ZRb0x5OWZ6ZElrQlI0dE1q?=
 =?utf-8?B?MUVrRFVWWWpHMFI1Z2JIT21ub0dWdHJqakRnK1haMythQXowUDllK0VtTFVW?=
 =?utf-8?B?ZFJVSDAwd1Jnd21YTUhCQllNczIvNUdIMXBEdlltSnNCeHNvVDBmUmw2a2pH?=
 =?utf-8?B?c2NjR3I0ckhvOEJ6YW90TjFnc2NFcXBSRUpoNDFXcS9RdEx6YXhpY05xaFRD?=
 =?utf-8?B?bEtVUnluMUg0WHhtcm93L2VLYklGUG5TR2xCTEVhOGlVWE5JUHJDSEo0SzU3?=
 =?utf-8?B?ZTJkNWdvbExJOGhHb2ZmdzlIMWowR2dWV2Fuc28wUDJUZnFiZkxXQVEvY0hK?=
 =?utf-8?B?RUNwdDdjV2ozMnhCWWo1emdKcnhTY3ROazBqd2RXK1RrTHBmQVhzcjBnbWp4?=
 =?utf-8?B?QlNtbno0S2loaC82a0JzM1k2MHZSTTNkcGlyZ1JOZjdabVdZeUJ3TDR5RjBR?=
 =?utf-8?B?SzQ5dkl2TnpoT1JpQ21DVjk4eEp3bXd6WVh3aThtTnZ1bjJ3UVpMck5lZktE?=
 =?utf-8?B?M25zZExobjlYVDVlNThZRWVEQ3g0cjFwZnJlTUhBOEFFN3RGemMxdVRkUitn?=
 =?utf-8?B?WmpOcDRPNmhpbytQL2FsV21KMEJNSjQxdkg1WEJSN0RpdzdVS2ErVXhVNlkv?=
 =?utf-8?B?d20xK3JTLzRQVlJkWDVpTG83bC8vQ3BUQ2dITmFNVzJ5MytuSHByUVNsa0VB?=
 =?utf-8?B?VTJsRGtzTzBtUTduUDNmaEx3R01Xc05qcVdVQ2dIbzFCcDVEdFNhSkx5SG0w?=
 =?utf-8?B?em1YTkFQSFJjSFVuUE5VSGRUR2Y2UkZrMTRwQWN5N1BoMllDVEJnaUtVUGNx?=
 =?utf-8?B?NkE0T0hsbjljU1dyWXR0RFA0c0RCcS9SQ2EwZERlRGZjQVZvY2poRW9hZ0lD?=
 =?utf-8?B?WW9LTnp2dnk1dE1iaDUySS9BVlpXSTBxdVRDN2ZVa0dzQTI4aVFRS0p1ZDdF?=
 =?utf-8?B?Zlh4dGJ1Vys3NnBzY1FmYmtnRUxBaGNEYURnSlNGM1pOYnNIQUp3em1RZlgr?=
 =?utf-8?B?SDVjVE1qT1Bqb0ZFQ1hIYlN6aHpQS0pGZGgyTVlucVFsL29kdmNzcHVtMUFn?=
 =?utf-8?B?b1Bqd3pOTStqcGdRS0ZDNU1hY0MvUHd6S3JsN2NYYzdsTVJ0NW8xYmFmOWZR?=
 =?utf-8?B?dUdFVnAvSlFlTi93SzRmdUVsZmRaaklNZ3A5M1NVVXhiVWQwandVZjZGU2tz?=
 =?utf-8?B?SVQ5ZktKZG4wcm9pa2R1UHlLRWp6U3Y3T3huTlI3LzE2S2hZcXM0QlZWTk1t?=
 =?utf-8?B?d21ITktQVURsMSsyQXhuZmxXQVFDb1R1MFBZVUgvSUc3TGQzOXFPclp2aTlK?=
 =?utf-8?B?NHVYYng5NjYzNnUzbXUzNEIxYStBVnI1V0owVTlKYytjdlhOOEdvVVpCV2xx?=
 =?utf-8?B?VlZQS2JyWnIreWtOb2RlQXRaUGtNa2FkendsSE0rNHByZ2ZUNlk2THhVd3Rp?=
 =?utf-8?B?N2psQnVNZDRzRUkvUHUyWHBja013Qm01Znljc0VxSDMyUTZzTmMyMHdvK0Qw?=
 =?utf-8?B?UUNlTG5xUy9oTkdUQjkwdzFZWVNjdWRBK3YyM0ZMN09td3VyZVpidngyWFZt?=
 =?utf-8?B?WGw4WEdZY2NORUNTd1NRNm4zOHZHaWJObHdrRTQyWjBranBBL0ZLWGxJaTRK?=
 =?utf-8?B?Z1lkSGN4VWY5clpzTjBqcmtTNk1KTU1iR3FNRHJ0OFNuSDRZOW5Ta1FTbFJX?=
 =?utf-8?B?SC9JcGhVMmN1Y0Rva0Mwc29DVFhVOUU0eXgwZzJqdGFpRDZuRmJqc0RHNFRD?=
 =?utf-8?B?VTZQZmZrTHczZFRDQ1ZOOEVQN3Y2eXJrdkVza21XUlI5Zzh2MkxFWHorUUIr?=
 =?utf-8?B?bTNidTNzZU00UzdmbkVZemxpM2VzcmlYSXlVYWd2SHE3dUs0OVlkN2o3SlIx?=
 =?utf-8?B?T3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 899dcbc9-df31-4eb0-f05e-08dc8f679f25
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6138.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 07:23:59.5026 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uyd1I2LAmZRtXDp+28nXTHzNOdxIgGEroBB7hKHnsaMvm608yENOqJdBlUUJp6nL/wyfuX2QrBngwGZropUKthv1kMxmu/K1HtwxmjqHx34=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8258
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pon [2024-cze-17 14:26:13 +0200]:
> It seems that more and more parts of the driver code rely on
> having only a const pointer to the xe_device. Allow to check
> SR-IOV mode in that code as well.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sriov.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov.h b/drivers/gpu/drm/xe/xe_sriov.h
> index 486bb21c3256..688fbabf08f1 100644
> --- a/drivers/gpu/drm/xe/xe_sriov.h
> +++ b/drivers/gpu/drm/xe/xe_sriov.h
> @@ -19,18 +19,18 @@ void xe_sriov_probe_early(struct xe_device *xe);
>  void xe_sriov_print_info(struct xe_device *xe, struct drm_printer *p);
>  int xe_sriov_init(struct xe_device *xe);
>  
> -static inline enum xe_sriov_mode xe_device_sriov_mode(struct xe_device *xe)
> +static inline enum xe_sriov_mode xe_device_sriov_mode(const struct xe_device *xe)
>  {
>  	xe_assert(xe, xe->sriov.__mode);
>  	return xe->sriov.__mode;
>  }
>  
> -static inline bool xe_device_is_sriov_pf(struct xe_device *xe)
> +static inline bool xe_device_is_sriov_pf(const struct xe_device *xe)
>  {
>  	return xe_device_sriov_mode(xe) == XE_SRIOV_MODE_PF;
>  }
>  
> -static inline bool xe_device_is_sriov_vf(struct xe_device *xe)
> +static inline bool xe_device_is_sriov_vf(const struct xe_device *xe)
>  {
>  	return xe_device_sriov_mode(xe) == XE_SRIOV_MODE_VF;
>  }

Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.43.0
> 

-- 

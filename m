Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CBE9CA0EEB
	for <intel-xe@archiver.kernel.org>; Tue, 19 Aug 2025 18:47:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E14A10E64E;
	Tue, 19 Aug 2025 18:47:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UbBQv78r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BB6910E64E
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Aug 2025 18:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755629245; x=1787165245;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yopBdAattThmN5lZ1E9RzBk036H45qxAUm6WM4EJ1BU=;
 b=UbBQv78rMYok9yFgK3/dCG4A/pirt7/Y5gYvzzv9MvZFiVnTvwOZ2GmN
 jgyklZK4F9zpb59AGq4AzshFwCaMxv/hKn49Sb0GIlPVTnXH6rWl6YQU5
 nb0JEwwGWlAlUEBKNXUnI7YkR7n9WkqLa2HhH1yJM0xJLOXtFenQCq2Op
 TDVXRDdXJe52E25z50zJOMfIaefmoAv9U+l2Aj5qWWqOnQ0W004aUEv1K
 66RqugDdNgMGA65zmCye6O4URqR1aTHoewtEimWzLZQuO/gPnvNAXSo6L
 RWnzZR75ektkiIIZibYm+fw2EmxQrFNNt7GVvqFQ8nl8qtyh3Ozxzqapf Q==;
X-CSE-ConnectionGUID: uGksl0qeT02nS28o4drSTA==
X-CSE-MsgGUID: Az5YLM1TRaSWoGfJjy/qoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57952034"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="57952034"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 11:47:22 -0700
X-CSE-ConnectionGUID: iFnVnYD2QbeQ6ZMH0BDk0w==
X-CSE-MsgGUID: 1rbz4YWZTqKWfSRGg8myZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="167547498"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 11:47:19 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 19 Aug 2025 11:47:18 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 19 Aug 2025 11:47:18 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.52)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 19 Aug 2025 11:47:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jAbQ2POFSDHKOUIgEu1zp7SvWDzX0QW3Pzm7/T/txlssgngaix7nR6mUvbWldaJeuWY0zPnOH8aODzVn5Nv8XSYP6Gb5qX3Evb/LW//GS0QIJFxd1C54p6L+taCYQlacwHKxNeLF+ft9bQjcx6TNIW3jH6BDxt841cdzH679bllvvqpP7B9VCdmNZJS8+7Ui938kX/54iXbxPOK9FkcwjJwptI4AMBBa0Bvff97rFQiqTRgE3U12tznisgTgeL4wllfGuMpc3oEQ8ICcybbtLBK5Mah7vCQIqy8s0xc4e0eKPnHBYtqHlA9ZLqNYUfpnbkhVB0DLOq/hNeKVPySD8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CE+vY5hKpmpOCJRkYTZC7TQkkb/jNrFI3bE+Hyk5TY4=;
 b=xy2w7LN9JwmrA5H+rrRdcwEMlK1pcbhOr0g8N3oK+egLFDiiVzFAcK7T0+Qwtu/zN19FAs34cJ/i21IZhrU0HZiR8NNcZj3vqOq7BWw20LRfcGjtLYQwL1rF4fIHfD3N/UUJrPDqW6trXP3EuMWE0eZp5aR5tAMqeLTeIFKxMpbeoktnYsBVVo4Oe1R+vpphmqo6sQLCvIbwBUh/YRDtLFgtmiUguKElAQLJOB5jHOXPfx8Ue4EpxVMnurMhQ74eslg0VEqtD1q73G8EExOywijbkdTxN2vhR19O9TXAE+djE58uwAbQNEapfd8GiKM/KodAWy26Ya06yENJu2+K3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e) by PH0PR11MB7585.namprd11.prod.outlook.com
 (2603:10b6:510:28f::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.25; Tue, 19 Aug
 2025 18:47:16 +0000
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::d66a:6830:d9af:740a]) by SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::d66a:6830:d9af:740a%6]) with mapi id 15.20.9031.023; Tue, 19 Aug 2025
 18:47:16 +0000
Date: Tue, 19 Aug 2025 11:47:10 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Harish Chegondi <harish.chegondi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe/mcr: Make xe_gt_mcr_get_dss_steering() input
 gt a const
Message-ID: <aKTGriiLZ12CiBy5@msatwood-mobl>
References: <306e119c48afa00957bfa16b326bbe6882d10779.1755110252.git.harish.chegondi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <306e119c48afa00957bfa16b326bbe6882d10779.1755110252.git.harish.chegondi@intel.com>
X-ClientProxiedBy: MW4PR03CA0344.namprd03.prod.outlook.com
 (2603:10b6:303:dc::19) To SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF89507EDE4:EE_|PH0PR11MB7585:EE_
X-MS-Office365-Filtering-Correlation-Id: d6269e18-fe77-4c16-3462-08dddf50d156
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R3YxWE5qTUNmS210V0FqKzZvZHc2aHRUNVBvemYrRzZJTDI5RDIvUmNmdk43?=
 =?utf-8?B?Z0p6WlM3UnJZUVBHNDJWa2VJUytxMVhGcnJXc3dhNENPdTZ5THZnQU44a1hV?=
 =?utf-8?B?Ly8vNWNJNG5HejQ5bXd3Y25aTUV5WUdHQjZzKzc3RHdyUUJQSlNSOTNzWlNx?=
 =?utf-8?B?aHVLczRSOWxYQzJjNCtIZ2hYd25IWkh3QjFxUFlvSit3NjNXZlJqVzhwVTdK?=
 =?utf-8?B?VDRWaml1MUEvZUNMNVRTR21sTTRGNVZvNCtwbjBlWmdVWnlqb2Z2M1FFeS94?=
 =?utf-8?B?Tk40Q3d3bmtHcitWTjdzVFltTDdRdXpsYjhoL1g4N2JvTHdsZ3o2cTB2LzZI?=
 =?utf-8?B?ckE0QmlCQ1lPSVlEejlGOTM3S3VaRlpEMTBkNDUrZ3J3ZnFuQ241YVA4a2Za?=
 =?utf-8?B?N1BpQW1PYWluQk1hQ1NLa0dJSHdpNDJVclR5SXVrQ0Y3cm1oU1huYXZCOFM3?=
 =?utf-8?B?bUZFSnBDYWZYTVFXOTBJdS9XaGNkSk5KbVovSFUrMks5Qm5OZzBUclFvRnhQ?=
 =?utf-8?B?Nzk1NStYZFF3Z1lLSE5KdEFTMnkvLzZkSUhGWEI3QlYydGV2RUFsK1ZYM200?=
 =?utf-8?B?K09iNUZGR05HL0dpMHRZWitqQ2RsSWlKWHpqN1c1RFRPMVQ5TGZoQnpQTU1X?=
 =?utf-8?B?SzlGUW1EWkJnQWI3NDJncWJ4cmtXc091TUY1ZWl3aFZMM3RjU2FCTExadGpY?=
 =?utf-8?B?dkFzVGZHVUNnK1gyeDdXeCtqOG9VTm13Z095STR1STdPSnovRVJoRjBaUVJK?=
 =?utf-8?B?dERpZnBPRDNzTGlIM3d6YlBhQ2VzL2hqNVdpclE4Vi9DT3NzWW8zZ1o3WnhL?=
 =?utf-8?B?WWJiaFFIck4zZ1RBR0orekZTK3FPNU44WlRtT0lFK0dHSHlieFFXdGkwQjNt?=
 =?utf-8?B?MFZCMUREMzIwNlh0WGRtL01ock9rZGxJcklBOW5laVBiOHZQSHk0MWpsU0Ux?=
 =?utf-8?B?Mmt3Y0Q2TkthU2hHQVhYSEJ0TWJ6R0l0dzdYSFIzb2MySXluQXIrMXBKYmRx?=
 =?utf-8?B?d3VqczlyRHBUYVAzRXB4VjZQOXR3RmxBNzdhaFo0dkNOdGZWMzIxN3dwQndn?=
 =?utf-8?B?NnVBVXVBcjlXUC92V3JHVWwyRjZqcC9NeUhoODAxVjdEaWgzVW5xQ2RNRzJN?=
 =?utf-8?B?WE5WblR1ZGM1UXN0d2g1YVpEdkxHZmFJTU5TOWFsVDF0WUtjT2t6aTFXUVpS?=
 =?utf-8?B?WTR1ckdWdUVmZTRtWU9sV0lNcENjQ1hUZnZMV3hXSXpmeDQwNS81aVQ4RWgw?=
 =?utf-8?B?c3ZEYkxFK01yRVdObFI4MDNoN0czQ29FeWowQ20rWmJYOUQ0L1Q4VHNibE44?=
 =?utf-8?B?aEJ2T0VibytHVThuQ0NLMThyUjJNNTIyYmR1dFU2Q0JFV0tTRkYrdzZmanRl?=
 =?utf-8?B?ZU91VzFiT0VwaEhTRTBWRnpuOWZTSWJvNEZBSkM4TEhDTld4d3pZQUx5UzJG?=
 =?utf-8?B?RnZHcHZEUSs5cTdtdm40NmxmV2dCSzJSeGVBTWNrbEYyalFPWEhrd2tsQW8z?=
 =?utf-8?B?d0d3TUoyOUlydWlYU0dQeXA1SnpaNENiSmVmYmZRMU9xM0t1bE1DeXlKdUNR?=
 =?utf-8?B?YzVGSTJETUNnWUxZTHZEdFFCd0Z3MEsvZnAvOEg3bHU3RFlCaXR4T0lhNDNj?=
 =?utf-8?B?N092eXpnQUVzYTNZcmhVU1VCTWdmYWt4YU1jNkhnZjZYUDk3RnQxOHZjeWpt?=
 =?utf-8?B?ZUYrZm5LdDFyUTFiN29XK2NGR1FkZzczRzFJYWxLQ1NzTXpHRGFmM25sVkJn?=
 =?utf-8?B?RjBML3Fmb3IzdDNxdEk2Z2MycUd3WVhNUmZmRFRoSFJ2TlRmNVQrTnpKU3ht?=
 =?utf-8?B?Mk14dGhiVG5BMDhlT1BCS2hnSzNnaDRmanBjNVlKUUNKSkU0c2F4dTgzMmtr?=
 =?utf-8?B?eThweXY2ejdKcStOVisxM24rNnhWSkRnOWhkQTFYY3hIOTc3YncxTTA1UHM5?=
 =?utf-8?Q?bmF0JknSgpw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF89507EDE4.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTVldnNtUkM3VDgvVW9aaVVWeFdTdU5mY0JGdDY2bVR6NmZNRTQ0a016cENX?=
 =?utf-8?B?aU9jMTNnd0dxNnBibjNwZ1hmTkxjU2ZSQ1JkUC90QXFxS2h3azlac0I5Nmpu?=
 =?utf-8?B?MlBhQ2QzZ1hpbmtMVUw0bXptbnFNZDgySWprNnk1WGZJeUZwNnFKUk9PSWRm?=
 =?utf-8?B?RkdmMHJYSTJJTzZmWFRreUhCejhRdEtUc1Nua29WQUc4MmNMVXA3SVdDclB1?=
 =?utf-8?B?Tk82blFHT1FxM3BiY0RzdDJ2QWUvV2pDdHphbzE0c0hCK3paU1g5T25kTmxl?=
 =?utf-8?B?Vjd0NTRDWEtxa1RWNUorOUE0WUxXMVZNV1Y0UGpYYkNYUUExblcrVEhrbDRG?=
 =?utf-8?B?OGRUVEEwYW5DZ3phUnkrSmRMaFlNRTdzanBoQ2l3NHlxWjVXR3l2T2cwbThR?=
 =?utf-8?B?K2dmaE5ZWlg2SmdqZEVnZThZamJIV2NQc3RMTmwwV29renVGL01VOWt4Nzlz?=
 =?utf-8?B?N2dsZXhsWXJma3hOclFBblRHQ3Boa0JWS3FEci9sVVlkSzVUMUV3QS85eWxs?=
 =?utf-8?B?cHVBQ3N1eDF3QXRGeEFHSWRkdEhiYTJmeXJ5b3hpR09YcG9iK0xiZ0ZObXJH?=
 =?utf-8?B?bkFabjF0ZE9vQXAwUFpkK1l3bmUrNXplUTFyT20rVW52RTM2VGVSTGJaTUpQ?=
 =?utf-8?B?dFdVMC9jWGlVVlZpT3JHcWFqRXozOVJmNm5iK21POFNRM2tNUTMwVFhTQS8r?=
 =?utf-8?B?NmJUZ1BCS3h5cnBQdE9BVEkyRmdOeS9FVXVMQ25sWUQySDZkQlQreFpyanl0?=
 =?utf-8?B?ekcyeWttVXJSSHh2MGdTd2ZQTGhoYTZiNW1IR0gwSDBaaVZnOWxoSU9UQUVH?=
 =?utf-8?B?eHZWQ2NuS0FuUGx4cS85WjExV2dYYWlhV2Q3OWcxbndsWVoyU3RsTStOTHo2?=
 =?utf-8?B?SElkK0JrQnl5OXFXK2h5RnU5OTFHVjd6Y0NjVjdJNmZQM2VNWFkyM1RxZnAv?=
 =?utf-8?B?UUJsZ2ZZVUJidEowQUFCVjJKTnQxZFZiWmtSWTFLZ0FUUHNsU1JFd296T2Rp?=
 =?utf-8?B?bjVEOFY5dk9taXNhWmtCYmpiajk0czhDUnR5VHZFcVFtd0NZM0NMb09RVmRM?=
 =?utf-8?B?ZG5xcFp0S1JpLzlkNG56SlpXcEJwMjlsM0p4MStWVjJKOHI1ZGxUOFlkQjdV?=
 =?utf-8?B?YVpFa2QveEpFc3JTbEYrZy9zR1RFQkR6cFgyQ1hkQ2ZKaVZCUDV0THZqamwv?=
 =?utf-8?B?R1loOWl1K1BNaFVmdG5DTG9jMkVtcEpvaXZGMGVHempJQzNSZERBUkRrRjA1?=
 =?utf-8?B?MUdWcWpGZEUyNUNkV3RlQjA0NmUxbGRIRFlwMzJ5T2xITncrdko3ZitRUnZr?=
 =?utf-8?B?SGZyV2FzOWh1SUtNQ2JtWUlMdWdsR0lCRnNtZFhYcjRUZmhPZjZsTDVNa0sx?=
 =?utf-8?B?Y0RsUERrdUs5anRoYzN0ckxaWkVLTnc0c0djWUd1SmdiR0VvVXZRYnhNUWk0?=
 =?utf-8?B?SjUzYWo2OGpuR284Y3g4TzE2cDV1VFp1TTFDOUtHRE0vOEJxa3hxdnYwOUNM?=
 =?utf-8?B?cFRWNzI2emxtaEcyNGI5aWtNcFlmMy9NYW11VXV4MFEvY3BaNnhHTFpDVXZG?=
 =?utf-8?B?RzBJaHlVTmJFaTM4NGF3WjR3bUJsZGFPZ2JpQXd3Uk1mY2lDZHBTMHhYVzRl?=
 =?utf-8?B?RjgwQ1pFV2dsZTNvSzBrRU9nRmNjN0I5SE93NTdlWnUva3B1TXNiQ01rSlFq?=
 =?utf-8?B?b0xIQm1JMjZEMWZEYmNDck91QUMrbTlJdnlKby9yMGs1d3AvRVU2d1U1bE13?=
 =?utf-8?B?MkdBU3hvaXdUNytodDRGTUMyeWhCZU9NSGpoeFFnZ2ZrWjdBVFhEd0ZlZ1ls?=
 =?utf-8?B?aWFMU2U5dEthRjh3ZFEvNStvWElId2dseTh2cmttaUNkc2lDQ25odWVyMVg2?=
 =?utf-8?B?OHZUOE1POG1PcXh6endmTEw1TExQQjRhcFRCa254eGVkcEVPMkhvSS9jaGlL?=
 =?utf-8?B?NFA0STN1NEpGN25DakFvMWpDRWxYU3NXdU1UL2JPaGZsY2QrUXo2RHByTitC?=
 =?utf-8?B?RVN3cG44bjVVWFJYK3I3TzVCeE5EZVhCRVJlckZ6eDBwSnpqVDIzU1V1SVZW?=
 =?utf-8?B?dS9uRDB6N2FsaDFMbmdYekpwa3FjTWYvcy84UEl4OFVjamcrRGtMai9aekZx?=
 =?utf-8?B?d3VtRWNzK05JeUdrUlV1UUQzcDgwaFZYK3ViNkg4MmJ0RFdObFlnbWFYbWdE?=
 =?utf-8?B?c1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d6269e18-fe77-4c16-3462-08dddf50d156
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF89507EDE4.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 18:47:16.1400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8fa5GRbdOitmXuCoiGe2d2kYrerXrzw8c4CZUso9JjeqdxlOr+RB1cdZ45S0EV3rGbaiyDd7AkKmbEOmMLbGHNbndXwhxI85uqR5PvNNwj4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7585
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

On Wed, Aug 13, 2025 at 11:38:42AM -0700, Harish Chegondi wrote:
> Make gt, input parameter to xe_gt_mcr_get_dss_steering(), a
> constant. This would allow xe_gt_mcr_get_dss_steering() to
> be called from functions that have gt as const to struct xe_gt.
> 
> Cc: Matt Atwood <matthew.s.atwood@intel.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_mcr.c | 2 +-
>  drivers/gpu/drm/xe/xe_gt_mcr.h | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> index 683ac021a06d..8fb1cae91724 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -362,7 +362,7 @@ static unsigned int dss_per_group(struct xe_gt *gt)
>   * @group: pointer to storage for steering group ID
>   * @instance: pointer to storage for steering instance ID
>   */
> -void xe_gt_mcr_get_dss_steering(struct xe_gt *gt, unsigned int dss, u16 *group, u16 *instance)
> +void xe_gt_mcr_get_dss_steering(const struct xe_gt *gt, unsigned int dss, u16 *group, u16 *instance)
>  {
>  	xe_gt_assert(gt, dss < XE_MAX_DSS_FUSE_BITS);
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.h b/drivers/gpu/drm/xe/xe_gt_mcr.h
> index bc06520befab..283a1c9770e2 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.h
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.h
> @@ -31,7 +31,8 @@ bool xe_gt_mcr_get_nonterminated_steering(struct xe_gt *gt,
>  					  u8 *group, u8 *instance);
>  
>  void xe_gt_mcr_steering_dump(struct xe_gt *gt, struct drm_printer *p);
> -void xe_gt_mcr_get_dss_steering(struct xe_gt *gt, unsigned int dss, u16 *group, u16 *instance);
> +void xe_gt_mcr_get_dss_steering(const struct xe_gt *gt,
> +				unsigned int dss, u16 *group, u16 *instance);
>  u32 xe_gt_mcr_steering_info_to_dss_id(struct xe_gt *gt, u16 group, u16 instance);
>  
>  /*
> -- 
> 2.48.1
> 

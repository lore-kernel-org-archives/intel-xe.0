Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5F54D43361
	for <intel-xe@archiver.kernel.org>; Thu,  7 Nov 2024 14:02:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A220B10E859;
	Thu,  7 Nov 2024 14:02:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ddWeUcf8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C58E10E859
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Nov 2024 14:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730988148; x=1762524148;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9jkN+WdL7eQvIqgk9TTHW0evztP85EBqlKku1ReuCRg=;
 b=ddWeUcf8zfjWwXnLe4KyFGqnTNP2VLc4Q3/aczhS0pccXQc2K5AI0Vnn
 gYb8oV1LVdv3B7NDS5as4hBoe90nwRR/Xdsfqp8cFQQd4oSG5MI1PrPqj
 1dQTbdiMXHXTVL26KiaTB6L3ALsY5IvC1afzlwiPVyX10flFe/yOHBlui
 FCRwpi1LHbrMBP/zgoxSmOpLjiadn5D4CH3+As4PKxr1udu2FAkOGnJdi
 Z4dWjYw43tOoGdWfHFvWrHCYGJHaTu0n3DaLqHtQ7W7Q/4rhibpI4mOxW
 1H3s7hYJHIg/corprOCAlqWzkz6BlOlkQZehxLM/KgxnKuKz0NmiAPpYA g==;
X-CSE-ConnectionGUID: QKcySsXqRc60mAHXsfVWWA==
X-CSE-MsgGUID: UutreVupQfy2lrtFsuVi3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30991833"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30991833"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 06:02:10 -0800
X-CSE-ConnectionGUID: lEHnrsv9Tq2Jey2gLqiaBw==
X-CSE-MsgGUID: Wr2qGRMYT8y8WnIex3hVEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,266,1728975600"; d="scan'208";a="89741769"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2024 06:02:09 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 7 Nov 2024 06:02:08 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 7 Nov 2024 06:02:08 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.42) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 7 Nov 2024 06:02:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TO/0Juih0eVkKFTbMwQAH2eAX3kSyvpNYcEDiS0g8ZMgqG8CzNO0uNZ7z8uAqBgQYDR4b2yWYsaO3vxIJ4+TcC7Q6h9zGLmkV4KP9ssPmpZA+g04v2xsyG1SU3Y0zlgL0VDUorHINGdx6o2zmk2rhjH91dQT6X0vlk8P1iwZPcO8Hz85JsiJ8GXUfGuWnYkUh+Wi2R1fYGw983ebFRIB3aNOOwCxOlBOcZkvHXHoOyBD23M9Clrgq9WyKHBJE3c6waJuOTw7xn1fHdPbyDDKMBix7lmkd+KnAyV3Ns2yncRh1SOEwB+cN+PrutLWuZ5rrthY4A2vOA1Mxsnmz5DBKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lFNIJMBvJYh5MRx7HtctWGhpdVMJ3duqG3yofNfMLv8=;
 b=zTcPvpQmWbiqJodko4TcusoJ32iB5lE31DTWytQY9tnvK9/vWYq1WAyZEIgTNx5Z9SLTlSxpJ33AHz7Vxns/AtJtOWl8G1325K9YM/ElxcXlaTE//xe1s4X/976zMzaSDZzoFu+oJdorIW9YW/mJOOOMynRjpv1INeYr0YaAqq9hMCblUTlJgXkccywLz3nFWbeabSfWGcZJPR9nE6hhe/FQ4E7UKjN5QlDwEKX94rhWkPa/mZyjqB0td3s7BbG4BkAzMDgCQsEyd87149/6hpz9b7uyWpwdnBwkCIkgAnds4kGkNv1CVAC987aBya4Y0KfVT1qtK3lgwzKpZ8rkLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by IA0PR11MB7377.namprd11.prod.outlook.com (2603:10b6:208:433::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Thu, 7 Nov
 2024 14:02:03 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%2]) with mapi id 15.20.8137.019; Thu, 7 Nov 2024
 14:02:03 +0000
Message-ID: <ce3df96b-d623-4fc7-9845-ff5f636dfd13@intel.com>
Date: Thu, 7 Nov 2024 15:01:59 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] drm/xe/pf: Add functions to save and restore VF
 LMEM and CCS data
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <michal.winiarski@intel.com>,
 <michal.wajdeczko@intel.com>
References: <20241031151725.28315-1-lukasz.laguna@intel.com>
 <20241031151725.28315-4-lukasz.laguna@intel.com>
 <ZyOnG4quAkgxWsJ9@lstrano-desk.jf.intel.com>
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Content-Language: en-US
In-Reply-To: <ZyOnG4quAkgxWsJ9@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR0P278CA0127.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:40::6) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|IA0PR11MB7377:EE_
X-MS-Office365-Filtering-Correlation-Id: e48ca4e4-762d-4231-ca2b-08dcff34c1c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RElxQTJPbWpJeHMycllQM0lEUzJKcUdvWWZ1aXhlalptN29INkJETjRRSXVx?=
 =?utf-8?B?WFJOYzVvVWFqcWNyampwVHVHQ0JNTEJPS0JoODM0a0xZN0VlQjZDRk5aY0Vs?=
 =?utf-8?B?azF3cmFZS2ZZaXVQNzZvRjRZN3BpVzN6RUtFZ2JTSWEreHRWN2hpTEFyQmV3?=
 =?utf-8?B?N01NcWtMSkxuamM0Y3dQa1NtOFl1SzJyTC80cEh2Uk9PQWFxMEt2ay9USDJ4?=
 =?utf-8?B?bGxVUjBZWFZ5Q0loKy9DZnFMMUJGQmZaajlIY09KcWVUNTVSUkx0UDZ2YWRp?=
 =?utf-8?B?aUp2Y0UwdkV1dmF0cGVWYTl3K1RpRUNSZlFNbEl6NDBZR1hTcytBQzRlZU5q?=
 =?utf-8?B?dC93NVRBVFVSempRd296M3NPSi9tVHl1R3RUT2p0Y2ZmMjJzc011QWRIVFNr?=
 =?utf-8?B?K1JqQ010RXNHQU1EVThhUUtoN0lNV09wRzlqZy8zUzhTTytzK0dRV1g3VjdQ?=
 =?utf-8?B?ZmFhcytnOVBhejJjTWswUkM0WUVYdUdDb3dYNHh4MTNZZk84WVNTRzBzNWN4?=
 =?utf-8?B?cnV4TWdVaGNIaFN1bS9Jb3QzTGVDUnU1bVhEM1Bqd3lKVE1pR1FWZ1VDMDFI?=
 =?utf-8?B?S2RPU0k3V3dlU1pTdEJtOUVJcGQ4Q2V2MHloS1dlZjBhUXFPeWtOaFFGL0Nu?=
 =?utf-8?B?dlllWElic0RQR0FXc0JweC9WSlpGVThJd1lIU0VYNDk3aWVhQ1RHd0NuNHRo?=
 =?utf-8?B?dXVrZHJLMXp1VFZSbW9kYlZKOERVZkR4Q2xOSFF0V2tGUXF4aEJhM0h5dHRK?=
 =?utf-8?B?S2g1SHpIUE00cEhIdHlGWnNWU3J1d3YwdjNLNi9EWFdPVXladk1WR0Nhck1a?=
 =?utf-8?B?Z0pMSHFZcFNuQ0N6ajBYa252bG9LSW1oWGVRWXVxT3YvRmVPODNGN0MvNDBQ?=
 =?utf-8?B?S0NicGhlZS9IRm01YnpxcVV5ZGVqNjZKQWZEV1hoekprS21vRldMb0E1bVJj?=
 =?utf-8?B?UUR6ODFtZTZPVDJNeElQT1Yyc3N0ZVBzblIwSlRTQ1dnWVNvS1Z6U0xTVzNW?=
 =?utf-8?B?U0I1Yzg4TS84OEhXaWNWUGF6N09MN3JzSjB3T0MreHlXSnFCb1hnN1BXRE5E?=
 =?utf-8?B?eEJuTkx0SkdrcXNGeEMxcEFmcTN2L2ZXclhSbmdLRUFpbUhobmdiM3F3ckQy?=
 =?utf-8?B?UVgxUjZYbXFxcVQ5bUNxTnMvUVhLcVh3YzJFT2dRbWhhYmhQS0FtUjZpNzhM?=
 =?utf-8?B?KzNnMGlZamd0a1lBRjJidWlXSERnL2duN3J3MkcrR2xtczJrenArd244dlFr?=
 =?utf-8?B?M3libUVXTk9hU2pZa05qOUwreVdoaHRaN2xGVkVjb1k2bXo0NS9yNnBFenpR?=
 =?utf-8?B?UmhYcmZyZDhYZjVrK0xvdXowVUtEaFhycEI1V1dpSmNXeVJRNEtRaUpnV3N6?=
 =?utf-8?B?SjlJWXlJQ3RtM0l6YVpXdnAwL25wUS80dUg4NGFqRDU5N1NtUDFBZnpwRldY?=
 =?utf-8?B?eXF0SnpGd1oxNkFmaEU1cng4dkFJQnVtMTQzWk13bXBhTFd3aTdFcVZuU1do?=
 =?utf-8?B?bTY0Z2pYb2puWEtqQi9SYUQ0MGVnUGJyV2VialpXR0NQL29UaUJEKzJFVmFK?=
 =?utf-8?B?QWxtUVprd05aSElzMXRCYWdOejBYVGQxM21LZGNsZThJYXNCc0lWNmd4eUdY?=
 =?utf-8?B?OHR4QmVYeVdndEZHZFc4VFIxT0lvTlNjVUYwcXV1WGJVMnlQQU5zeXFGS1RP?=
 =?utf-8?B?VGQ3bk5ZMFZUTWpONkZyN3VTMHdjZ3MzOXdINmxOWUs4Z1h0cEJubTNGc003?=
 =?utf-8?Q?wmwPVGsenxHTLODXEG5JNUCpPg5BTeBOviGAX7G?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akdjR1p4WWw2WFlFOGVqU2MyQnUvMWlaRXlwd0dDQ2haVTNTVzFhdzMxY3B6?=
 =?utf-8?B?Qlg3SEx0ekF4YTlJdlp0Y2UrVzVQNmd5Tm9NL2x3d1pXdkFqNTJja1pjSW5K?=
 =?utf-8?B?Mkl6d2FIc2ZMV04xdlBGQzFSTThCUzRnOGx6SWZHSURiMzRzZkZFODRoZlJS?=
 =?utf-8?B?eVdjNVVyYkVlUDJieElPbGs2VndHbG5OeEVMM0ErWFpFSzArbHFGVUUxOEdV?=
 =?utf-8?B?R21sczg4OEdSVmZjaUdqakZHamd1NHVqSjgvUmtQOU5KTmR2cFdwczdzS2Vk?=
 =?utf-8?B?VWpmK2ZRRHJKR0J5MjlFS05YQzFPZzhuZnAvdCs4Z1RibEsvU1grdkhGM0k3?=
 =?utf-8?B?eDhTWEVYTEtGS3dlclIzV21MejhqU0VFbGJxTXBZeEhaVEhUdEUra0loWEJr?=
 =?utf-8?B?RWQ5Y05RNXh5bVg3ejcrL0N2eTViOEFvaDNqb25MY1FKcm1JVkI3V281T2kx?=
 =?utf-8?B?UVR4c3JtSWxCVVlFRHpmazhsYjRIVFQ1UUtkUlpvcmxXWXhrWVR1ZzZNdHRD?=
 =?utf-8?B?aEh5SjFubUEveFVSRDBjNkJuRi9ndWViSDdNWFcrQ1FzL3BrRVhyT1hRYzNS?=
 =?utf-8?B?UEJuM1FuS3dybTdwNk42bDFLQUJDYWtEWGlJRHE2VmFhOEpYZ0FoOTJGRVBr?=
 =?utf-8?B?NGZHVDRiQ1BCa05HOXJOVnRVeXRzS21TeGFWZGsxL3JIT3VqUEJyQ1FyZTMr?=
 =?utf-8?B?eUNxVG5hKzBXT3BONEdVY2VLalN6U3Q4UW1xQ2RBR2NaWjZWUlRvTFJNQmY0?=
 =?utf-8?B?NGdxSDA0WSs1aW01VFVLcmxVSGxqVTFvVlVuOC94TlBFMEk1cDJ2OE0yYy9R?=
 =?utf-8?B?WkVlN2tGc3JtN0Y0ZTVDMkcvaUFtSlpkczhuSzhRQ0NVMG5pNFdiOE56aWJZ?=
 =?utf-8?B?bWp0bGpSL09xbnBZcUg3SnlJb2lXbWJOeHBkUC9pT1haZXdBR1V2K1dCSDFP?=
 =?utf-8?B?T3pIOG5xeVVTNkNKMmNsajhHREhTZ01OT1NJL2pzUWVCL1hEZVBZOUNQT3hs?=
 =?utf-8?B?L2U0dVlVQ2NOZ3ptK3FLVUdhMXNpWDVUMW91U3lleFdIdUNlU3NpZzU3Uy9X?=
 =?utf-8?B?MFhaY0NhNFNobmRqbkVvVnFtYk5TK0ZSVXVzUmo1V25lazNaL1hhL0FHMzNH?=
 =?utf-8?B?czMxUjJqZ2NybDBTcGN1V012OER2RDdxaG95aGVZR2c1ZDFMVGZNWk00NTNp?=
 =?utf-8?B?OHhTN3pDblpKNUVxdGtxYUNwdTNHZ0E0YUY4dVdUYXVxWVNNeWQvWmhZaGJU?=
 =?utf-8?B?aWRHMlF6YjMrbFF6d3ZRc1d6dEJNSFhpdDhSb3cxZk9RNHl4SlJNSHJSVGdW?=
 =?utf-8?B?d1ovSnQrZ1ByNCtxM2NkR3A1WXZZY3daU1hiNVlUUnQ5SDFXaVNodzQrQnEr?=
 =?utf-8?B?bS9UWmhRZUxhSDYvV1NRa0x1RUcvS05EQ2hCRG1xRkhvdWwzZW1NREhaUldU?=
 =?utf-8?B?SmVkd0JLNEszRll6Q0RCT2JKRTVrRi9ZcjhOeXhaODJTUlowSFNlVDV4eEFE?=
 =?utf-8?B?Y2R2bmE4dDBaOWIvaVJvZ2RMb2l5RHlHa0xpallxT21wR1VmUGtpYUhSdlJ5?=
 =?utf-8?B?OXE0S09iZWpaUnNGRmxYd3FhTE5LeElGWG5DOWg2ZWpjRmU4dmY1WnZEaTlu?=
 =?utf-8?B?Rk5zRjc1RjlIWTJwMlV6YmkxK0FRWTY1bHNKM05ac2hoVUJjN05nSlBNREVY?=
 =?utf-8?B?Q0lUMVVXa2ZzWXU0dVBBbHRqRjFLdXRnTEtZdUgxbFFsVzdCOWtXNSs3bzJR?=
 =?utf-8?B?aEhHVjdZeklLMEl1ZzVYQ3ZWZnJDT3ZhNzBuRFBITmhEdVBHeitEUlhRUmZx?=
 =?utf-8?B?ZmtlQnlLQzRiUCtOMzkrb3h1WFBkZGdLOCtadVdhczFybHNPNlZ2VnVGa1U1?=
 =?utf-8?B?NWdoV0pPSmlJOXQ0TU9SWDIvSXQ5ZHd6OGtneGFyc296QXVQak9CWWFuc2tV?=
 =?utf-8?B?T3dUUUpJWlVEdlpiUEhoYjFFNFhnMzBMY3RBMGdmUmtyUW1jRldsdGpRMmtV?=
 =?utf-8?B?WFRxeGllVUdlOEtwbmhrUGpSSDZqUlJpZFhHNS93VWlMRWpYcTU0Y0JvQ3Jw?=
 =?utf-8?B?ODBudFM4TVRWWVRjUThjVCthamw4d3VOazJKa2RGQ0dDaVdKK0hHUWlVTFZy?=
 =?utf-8?Q?v+VaClKP3EW1QkQl25CzvwaOX?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e48ca4e4-762d-4231-ca2b-08dcff34c1c0
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 14:02:03.5757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 99LlfpupQnvtCcUdVO6WleMk0BZNUQKSrxguPYR5jYlYcyctG0pC4LuogBkcDubc/Eowx+eLkCGTKm7J5URHHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7377
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


On 10/31/2024 16:49, Matthew Brost wrote:
> On Thu, Oct 31, 2024 at 04:17:24PM +0100, Lukasz Laguna wrote:
>> State of VF LMEM and corresponding CCS metadata needs to be saved and
>> restored during migration of VM with attached dGPU VF. Add helpers that
>> allow it. We will start using them in upcoming patches.
>>
>> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 112 ++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |   9 ++
>>   2 files changed, 121 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
>> index c712111aa30d..eca01c96a348 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
>> @@ -12,6 +12,7 @@
>>   #include "xe_gt_sriov_printk.h"
>>   #include "xe_guc.h"
>>   #include "xe_guc_ct.h"
>> +#include "xe_migrate.h"
>>   #include "xe_sriov.h"
>>   
>>   /* Return: number of dwords saved/restored/required or a negative error code on failure */
>> @@ -382,6 +383,117 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
>>   }
>>   #endif /* CONFIG_DEBUG_FS */
>>   
>> +static struct dma_fence *pf_save_restore_lmem(struct xe_gt *gt, unsigned int vfid,
>> +					      struct xe_bo *smem, u64 smem_offset,
>> +					      struct xe_bo *ccs, u64 ccs_offset,
>> +					      u64 lmem_offset, size_t size, bool save)
>> +{
>> +	struct xe_bo *lmem;
>> +	struct dma_fence *ret = NULL;
>> +
>> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
>> +	xe_gt_assert(gt, vfid != PFID);
>> +	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
>> +	xe_gt_assert(gt, smem || ccs);
>> +
> For locking this, you and going explain and justify why you are open
> coding the locking with nesting / trylocking rather than say using a
> drm_exec loop to lock all the BOs.
>
>> +	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
>> +
>> +	lmem = gt->sriov.pf.vfs[vfid].config.lmem_obj;
>> +	if (!lmem) {
>> +		mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
>> +		return ERR_PTR(-ENXIO);
>> +	}
>> +
>> +	if (!xe_bo_trylock(lmem)) {
>> +		mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
>> +		return ERR_PTR(-EBUSY);
>> +	}
> Gut reaction - this looks bad.
>
> Here I'm assumng you use a trylock as xe_gt_sriov_pf_master_mutex is in
> path of reclaim thus it cannot be nested with a dma-resv lock which is
> reclaim safe...
>
> e.g the locking order is:
>
> fs_reclaim_acquire()
> mutex_lock(xe_gt_sriov_pf_master_mutex())
> mutex_unlock(xe_gt_sriov_pf_master_mutex())
> fs_reclaim_release()
>
> vs.
> dma_resv_lock()
> fs_reclaim_acquire()
> fs_reclaim_release()
> dma_resv_unlock()
>
> Why do you need 'xe_bo_trylock(lmem)' under
> 'xe_gt_sriov_pf_master_mutex' but not 'xe_bo_trylock(smem)' or
> 'xe_bo_trylock(ccs)"?
>
> All of this kinda screams to be the SRIOV locking might need a bit of
> rework to either...
>
> - Completely remove fs_reclaim_acquire from the outside of
>    xe_gt_sriov_pf_master_mutex
>
> - Or split that into 2 with a reclaim safe outer lock and a in path of
>    reclaim inner lock
>
> That being said I don't have a great understanding of the SRIOV locking,
> so may be way off here. At a minimum I think it might be good to review
> the SRIOV locking design with a few SRIOV people, Thomas, and myself
> because on its surface this looks a bit scary when things like this need
> to be done.
>
> Matt

Thanks a lot for the feedback. I've just sent the next revision, where 
I've refactored the locking.

First, I removed the trylocks - I wasn't familiar with drm_exec before.

Secondly, regarding xe_gt_sriov_pf_master_mutex - this mutex protects VF 
configuration and I was taking it to access config.lmem_obj. After 
further consideration, I realized I could release it earlier to avoid 
locks nesting. This change is also included in v3.

Lukasz

>> +
>> +	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
>> +
>> +	if (smem) {
>> +		if (!xe_bo_trylock(smem)) {
>> +			ret = ERR_PTR(-EBUSY);
>> +			goto err_lmem_unlock;
>> +		}
>> +	}
>> +	if (ccs) {
>> +		if (!xe_bo_trylock(ccs)) {
>> +			ret = ERR_PTR(-EBUSY);
>> +			goto err_smem_unlock;
>> +		}
>> +	}
>> +
>> +	ret = xe_migrate_raw_vram_copy(lmem, lmem_offset, smem, smem_offset, ccs, ccs_offset,
>> +				       size, save);
>> +
>> +	if (ccs)
>> +		xe_bo_unlock(ccs);
>> +err_smem_unlock:
>> +	if (smem)
>> +		xe_bo_unlock(smem);
>> +err_lmem_unlock:
>> +	xe_bo_unlock(lmem);
>> +
>> +	return ret;
>> +}
>> +
>> +/**
>> + * xe_gt_sriov_pf_migration_save_lmem() - Save a VF LMEM and corresponding CCS.
>> + * @gt: the &xe_gt
>> + * @vfid: the VF identifier
>> + * @smem: the sysmem BO to save LMEM data to (NULL if not needed)
>> + * @smem_offset: the offset of @smem BO
>> + * @ccs: the sysmem BO to save CCS data to (NULL if not needed)
>> + * @ccs_offset: the offset of @ccs BO
>> + * @lmem_offset: the offset of VF LMEM chunk
>> + * @size: the size of VF LMEM chunk
>> + *
>> + * This function is for PF only.
>> + *
>> + * This functions saves VF LMEM and corresponding CCS data into sysmem buffer
>> + * objects.
>> + *
>> + * Return: Pointer to a dma_fence representing the last copy batch, or
>> + * an error pointer on failure.
>> + */
>> +struct dma_fence *xe_gt_sriov_pf_migration_save_lmem(struct xe_gt *gt, unsigned int vfid,
>> +						     struct xe_bo *smem, u64 smem_offset,
>> +						     struct xe_bo *ccs, u64 ccs_offset,
>> +						     u64 lmem_offset, size_t size)
>> +{
>> +	return pf_save_restore_lmem(gt, vfid, smem, smem_offset, ccs, ccs_offset,
>> +				    lmem_offset, size, true);
>> +}
>> +
>> +/**
>> + * xe_gt_sriov_pf_migration_restore_lmem() - Restore a VF LMEM and corresponding CCS.
>> + * @gt: the &xe_gt
>> + * @vfid: the VF identifier
>> + * @smem: the sysmem BO to restore LMEM data from (NULL if not needed)
>> + * @smem_offset: the offset of @smem BO
>> + * @ccs: the sysmem BO to restore CCS data from (NULL if not needed)
>> + * @ccs_offset: the offset of @ccs BO
>> + * @lmem_offset: the offset of VF LMEM chunk
>> + * @size: the size of VF LMEM chunk
>> + *
>> + * This function is for PF only.
>> + *
>> + * This functions restores VF LMEM and corresponding CCS data from sysmem
>> + * buffer objects.
>> + *
>> + * Return: Pointer to a dma_fence representing the last copy batch, or
>> + * an error pointer on failure.
>> + */
>> +struct dma_fence *xe_gt_sriov_pf_migration_restore_lmem(struct xe_gt *gt, unsigned int vfid,
>> +							struct xe_bo *smem, u64 smem_offset,
>> +							struct xe_bo *ccs, u64 ccs_offset,
>> +							u64 lmem_offset, size_t size)
>> +{
>> +	return pf_save_restore_lmem(gt, vfid, smem, smem_offset, ccs, ccs_offset,
>> +				    lmem_offset, size, false);
>> +}
>> +
>>   static bool pf_check_migration_support(struct xe_gt *gt)
>>   {
>>   	/* GuC 70.25 with save/restore v2 is required */
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
>> index 09faeae00ddb..a4301574d92c 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
>> @@ -8,11 +8,20 @@
>>   
>>   #include <linux/types.h>
>>   
>> +struct xe_bo;
>>   struct xe_gt;
>>   
>>   int xe_gt_sriov_pf_migration_init(struct xe_gt *gt);
>>   int xe_gt_sriov_pf_migration_save_guc_state(struct xe_gt *gt, unsigned int vfid);
>>   int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vfid);
>> +struct dma_fence *xe_gt_sriov_pf_migration_save_lmem(struct xe_gt *gt, unsigned int vfid,
>> +						     struct xe_bo *smem, u64 smem_offset,
>> +						     struct xe_bo *ccs, u64 ccs_offset,
>> +						     u64 lmem_offset, size_t size);
>> +struct dma_fence *xe_gt_sriov_pf_migration_restore_lmem(struct xe_gt *gt, unsigned int vfid,
>> +							struct xe_bo *smem, u64 smem_offset,
>> +							struct xe_bo *ccs, u64 ccs_offset,
>> +							u64 lmem_offset, size_t size);
>>   
>>   #ifdef CONFIG_DEBUG_FS
>>   ssize_t xe_gt_sriov_pf_migration_read_guc_state(struct xe_gt *gt, unsigned int vfid,
>> -- 
>> 2.40.0
>>

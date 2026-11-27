Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D04F606A31C
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 21:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=emTzDyhj
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05DDB10EAD4;
	Fri, 27 Nov 2026 21:32:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E69B10E4F2
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Nov 2026 21:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795815130; x=1827351130;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aMRRnANBKkL3gQQkrJ8evGVy0Qy+6TNtTgF1oWKHMzk=;
 b=emTzDyhjXG+AG+SeOO08xRD7e4SgS9xw6y6WVnXYIc3yg2tXkoaNjwKA
 +wh7iL4NBgjhtwWhRfV7g62ohcIDLdchwbmHPzzh3ZMU4Gm7NF+4jZyWl
 oYz340BjttPZyu7d7fzLDE8Wh9frfgJSYKmdVPRjqDg4D0yMPId8C6hHG
 qw15Y9KP0Np9CXmp5k3qHS6DNx+hb90HJhGhtyZpxCD25aIYzDv5SzFsd
 cXEjSrg26d7KcGe3zUcn6ytimOqy/6QkqonCjzlcs+5m2Ij+25JgjYxeb
 QE/7DVkUdeCvibbpKGqHEs4xOJyFgpf3540T0a2+3D+UCJtImDgVKP8i7 g==;
X-CSE-ConnectionGUID: ychzMva1TLKiBsMszGodrg==
X-CSE-MsgGUID: AFgF29osRuec26NPzzRqOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4733744"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4733744"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 13:32:09 -0800
X-CSE-ConnectionGUID: ci1w0czkTvmpQFdSihm29w==
X-CSE-MsgGUID: wNTXGc4+QWWVDDdV/mHBJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; d="scan'208";a="12724157"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 13:32:09 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 13:32:08 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Fri, 27 Nov 2026 13:32:08 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.56)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 13:32:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fj0bTioGBVUFEfdl9o3R3cfdHXdK1m+/axvcoK+4/AA4iCNAYZ8vTDqBaCOmK8EtfGAG+Ze9OmtStK9AghpTes7+ihBkcDjDvGDubJellSvBQwwoHnoKEnJrK5otTz5sJpN0Q2L+Vh/qxtmOuc/vz7wUDi6btaPKFyheefGGtdKkg31uRK0hiLCY27zlRwJUuX8Np9SE5m7D5Yh14M+pSdK5ILt+BrzaxQG2NR6w+MG1ftWkRda7FA0wRDLscsf2N2X1eMU/g1UNPZmgsz/A89Wwsak47SHjnT3Wij4ERfq8RbN40dVFFHj5UWLzimc5vvKpddH7GA2ZqiSUN4EJZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=POJkSXer/906CCtJLcYBP7mz2uwZhpdX2nXL0G2J0JQ=;
 b=P6lq4n+1qAf/hHI9YbfjHF3gjytav6cHlXaLmiwt98osO1/3yhl4pyr2mXND0CvK4CyPZbDv8CvGSAF5wrnA4TXiI23uSffLNDMN+JVRSt5fhr6rdHatsCLukevNNTs+puw2hO0pVnA8jh735cMKsQCp7iQpMxl8FuHg7ZZLtpHPzImUVeMJSw8zk7q8lO2H+lj/Pc1VlQl7dT5TeOXeBzoxmy+C7SWhLmPGR3aWFgoskEQ1k1ww9zphP0okN/76VsJ5ICBG9gvAJx2aoQXviLCcKRUn6+3bvRWVTdjKMaw4jHzcOdN3pWeJBUpvBkbs5TGbFHnYeLyRWsDkQ8fKsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB087165.namprd11.prod.outlook.com (2603:10b6:8:4c4::7)
 by CH3PR11MB7250.namprd11.prod.outlook.com (2603:10b6:610:149::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.10; Fri, 27 Nov
 2026 21:32:00 +0000
Received: from DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f]) by DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f%6]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 21:32:00 +0000
Message-ID: <5bb1590d-441d-4a58-95c2-4498134e66e7@intel.com>
Date: Sat, 28 Nov 2026 03:01:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/10] drm/xe/hwmon: Initialize fan-control backend and
 table cache
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>
References: <20261124054811.798763-1-karthik.poosa@intel.com>
 <20261124054811.798763-2-karthik.poosa@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20261124054811.798763-2-karthik.poosa@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0097.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::15) To DS6PR11MB087165.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB087165:EE_|CH3PR11MB7250:EE_
X-MS-Office365-Filtering-Correlation-Id: 174329aa-811c-40f5-508e-08df4ccddeb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|261028144727099003|261102123227099003|261022075727099003|261022105027099003|261022113327099003|261021123027099003|261026121527099003|261026140227099003|261021121427099003|4143699003|11063799006|56012099006|10067099003|22082099003|18002099003|6133799003|261009223027099003;
X-Microsoft-Antispam-Message-Info: 8+H3YhzD8MsRg/DeHnWClcSKqcv+2oNSu98mhNjhyPv49oQREBM43x2m2xOWMuiHroLB9Hg8Xjr6sp04NNeasSi07+y2vwXfYbPqBBh+045ivUiTHzi8vwfTVaZUMtUk9gJg5J+tyPOA542fe3Pmwbh0gYcbmeVBuv2CLb8iwg8DeflzsJIqH3SPD4z+nKW0ChKEZjnYuXLnBvpRaUOGXIB9b0f/JS0sQnTvVe9j/aNhwTiVSlCU6qiiRFXJigQv9kAEYsUrnmBceBVC4XnmHz6z4mUmEeYC6U8Ed5/KeBvX7vVRbvlhEi4n3IiUBUB4rQDD/3BZGCGXHFm8olt9cHul5GKE5wopMjS2IONZ01UPwFRRm+NZGIvYr1xG0DLCxRBSWLODfoUN4Yqek/1n5ifDjqBknt4wrh28ufelzzQWqJKI3caRlp7DfxKIbKbwC7s4NaYAn/jpBPhl+514A8WKfvebQhYgGrcMjM2u6BppTCDMjWo++XtFXJ6A3PqD/+RNii5Kyq6Nwwtmgolz29OPY9XSHAzzSfnqOnPR68HApTGYkiEvJSVz8rICTh2AUwA1f72WNXM2VC2+0Ww7KaVebEKwVDiJV9FjuMjO4H7GpmQ3rU2NjRSvh6RpSGJGMkvF1AXeWzLCgZP1M9UbiZqhqatJu26wyQOAqRJX+YY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS6PR11MB087165.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(261028144727099003)(261102123227099003)(261022075727099003)(261022105027099003)(261022113327099003)(261021123027099003)(261026121527099003)(261026140227099003)(261021121427099003)(4143699003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(6133799003)(261009223027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0E3V2wycGlmbTEzVjgxN2p1T3M0alhuOFNpcnJXWkNjc2l2VTB0TlhxNUFv?=
 =?utf-8?B?N1F4aG1rZGRrbW9VM3FOMlplbVRac0w0VHduQmVPSjQwck9wdDVURzRjd1kv?=
 =?utf-8?B?WWg1VzZCTDMwYlFod29SUzFvOTlCVzV3d0hUK0J0cXk1NFptVG9GaXZ2UWNK?=
 =?utf-8?B?a0lwelhKSW50QXhsR1ZBdi9XNXRnbUh6ZjRnRlRxR1J0cmhRbkVMNXBsbEJI?=
 =?utf-8?B?cHpCNmpsYTY1OEFSLzhXTDhKZG12aFpTb1hVR2w2UHNUN1JFUnRHbDBiNWRW?=
 =?utf-8?B?WlYrOUZjSEJwZEJxa1ZZWTl0SmIwK2Q3WDNNN1V4L2RGYjRWQUZYV2I1Sktw?=
 =?utf-8?B?WUZnajJKL3U2S0hkNUt2SHFLaCtXWFhuL0pPaW5Iamw3ZTNRYU5YUUV6czNI?=
 =?utf-8?B?bFlvS09XT2dGTkRrMHdnM2xpZmswa3Joc3RhZjY2RGY0TXIwSU9JRUp5Rmg4?=
 =?utf-8?B?WGtEUjd1cHpqYzZaNFFRcXY0RVNZK0ovOC9iNGdHNFR3VGpjR3FaeXdWdVNZ?=
 =?utf-8?B?bjdMNVZBZ0Jma0cvM3BSaW1TWEpFdkdLSERGSXNkWlcyMjRxYUFuUzV2THJm?=
 =?utf-8?B?VGI1emYyMEkxaGlWNHhlbk9DQkJKVDBudlRWVlZCQTR6azdPYzFBWHIrdHM3?=
 =?utf-8?B?RC9mYVVqME5NSy9WTWNOY3RaM1VoR0c0Rm0xNE1FSGlVbThNMTVPbWhaeStJ?=
 =?utf-8?B?Qm9KYzNqV2dpNk1zaElPTVVIZmJ3MmxCMDBNRzd3bVRESDlNVmpqcEkzWXc1?=
 =?utf-8?B?Q1hnYllkVHZ2K1RDTXB0RS9vZDFUTDVGZ2RFcGZQS21ReVA4eFNHTGdQVW1T?=
 =?utf-8?B?bWpOVEdVMjRhWDV2VVQ1SlovSHdyY0ZOUWl1UnhDQVcvNDZqa3JwUUUzK01w?=
 =?utf-8?B?eGlSK01XWkZEOWtWOFdQVnRibDhrNUhLeTd0c2dDeGpYVytnK1FGMTYxTVVy?=
 =?utf-8?B?WWZsUHY0dnpjZ1p2SVIyUzVOMXZjMWdYVzBDQzErRFg1dk9lVks5R1dKSXVQ?=
 =?utf-8?B?NURHR2FDSlBNRUd5bkxkbWZoTGpvWVRmU2laYzRCaGFWYjFISHEzVjJMNHZP?=
 =?utf-8?B?VVRpNmU4MTMyOXp0YWgrc2crVGhxcVlidE9lMk9kZzdHcWtoSENPeVpnN2NC?=
 =?utf-8?B?ZGNVNTBwaG5vaDR1ZnhrNm1GWHdOc1pNY2todG8yM0dpc2d4RXN1WXJqa1dL?=
 =?utf-8?B?WVBnOGxEaDZyVnpISXUzRUdFSEowbE0yRGZDcVpTdUZWRWVzK1NISEFPSFNL?=
 =?utf-8?B?TDd3R0V3L3NoMDd5YUNuZVZGNjB6MDhFYTBQTlNIdHQ5YWJFZ1kxaGRFcC9E?=
 =?utf-8?B?Z3dKbHk2MlA3d0M1N1N3bWdaM2pjeGFiWmVFNDhmeTRPaG45SkxhNmF6T25a?=
 =?utf-8?B?YnAyclVLT1lWeDJGUnZnVE56cEF6ZkpHNnNDMzhaWno2LzMraW5sa245cnRU?=
 =?utf-8?B?ZTZGN1cybjc1NTRlZlhSQmJHaXVJeDZWeWcvWnlrcGdKVTNhYzk0WCtKZmNn?=
 =?utf-8?B?YWhyTDhxUUFXNEwvMmI3ejhseCtiSjBRaUVHVUVLL0FkYWp4UEhSanQ3OVR4?=
 =?utf-8?B?ZEJnZmNzMlVuTnpPdGFQOHdTMlFVc25qOGVPWHlnRlVEaFNxRHdpZVN6Y1cz?=
 =?utf-8?B?Nm5yNXJGRFJIUXVndWtVeS83NXMvalo0TWFMbmY2UFRHSXpka2N4ZmxTTXVM?=
 =?utf-8?B?WSthUFRuSzVNbURZdURBV2RKSG5QTlVva3p4NDNMbWtZRS9iUDdJbk9pUU9C?=
 =?utf-8?B?TzBxOGJNaGhjMXVhRVRlejBzZzZ0TVVqTzZNUEw3K2lYdTMwUEUrdzA4V1dk?=
 =?utf-8?B?ZVRNTmJ4ekRRNzVFTmtuZXhXMFJxeG5ZRnhsQUVFMlZkUmN6Q2d0cTZNYUIy?=
 =?utf-8?B?M2lNVlp6N2czWnp1T2REQW9Qc05KYVFyVGhQRHhEUDhCZTJ6YlZDTEt5SkRY?=
 =?utf-8?B?MkpiUHpySm9zU0FaSTRnbWtyVGIzRzJ1UVhwaE9UREhLM3ArUVlWMDVYeXFv?=
 =?utf-8?B?a1NKdGNlTVByUGo0eUx5MTZXUW5LZkZDV3JOZjFSakRaL053Yzl4d0w0ejRq?=
 =?utf-8?B?UnI1RFdQaitJTU51NksrQjNDcXB5M082akJ5eEJTZjVWUUpGVEVmdnc5MWlJ?=
 =?utf-8?B?MmJSL2U2L0hKTUZxTTk3Z1hTSUpLc2RpUDY5bWJMTzlBZ1NRWGVxYXVXcmdM?=
 =?utf-8?B?K2V4OXA2S3N2WGh0cUtBMjFHbEdLR0UvZ1A5ZitRLzVOZWhkQVhRRFN6d2ps?=
 =?utf-8?B?bmc3Q1l5eWtNRGxhcHRGTDE3STNkUTBEVytPY3BBWjUrVXdhWW9JNUtmNzkv?=
 =?utf-8?B?K3RuR0hEeVVIbDhWRmFYbGtzNEpPWURtdGhtRUk1ZWdZTFFFck5mQy9NQVpL?=
 =?utf-8?Q?sCkcIJEgyGrI888I=3D?=
X-Exchange-RoutingPolicyChecked: M4UbroVQW7/pUiknn1XovrdZHr/DLpuVXqqxuvKJPTw0W+ULvVFs4Ts+obYoCcCC+x90PVIL4Q3wtWxybUzvWNcSwrRLwVq870EsunwoWa97TY74wvWUT26De6w2j7IBT9iJmIkgN6XDKk8Rkb0EKA+dWiOmzNQ0nnPVPfyfqMYsR35yu0UgRRrN598RlfPMhI39YzNXR5MFPkRpw+qGIjb4Sz28nAJtpNhLYbwJK0JUhm1e8Lkqif+9AurTBSOgEyc6mK82SzVdmbTEk2hG2/YWmBQZ2DcDqJa8Q/RBAJjLq2rcAL/A5KCVEh+m3VRpQ/Oche68h2Q9/DM3O7iuJQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 174329aa-811c-40f5-508e-08df4ccddeb6
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB087165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 21:31:59.9475 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y573K+1r3caDCp/hBPcAVzoOs5mjlx4SRHzOST0GJtXLwx/4bTUYjtdX6YJOAeoMjdN29V5az6mXuMIMqlkxrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7250
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Karthik,

On 24-11-2026 11:18, Karthik Poosa wrote:
> Initialize Xe hwmon fan-control support by detecting enabled fans,
> reading stock fan control points and min PWM.
>
> FSC_READ_NUM_FANS returns a bitmask of enabled fans, so use it as a mask
> when exposing fanN_input.
>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>
> v2:
>   - Avoid user table initialization during probe. (Badal)
>   - Move unused code to appropriate patches.
>   - Use xe helpers for dmesg logs.
>
> v3:
>   - Rebase.
>   - Refine a few debug log messages and comments.
>   - Update xe_hwmon_read_fan_control_info() to return on any stock table
>     read failures.
>   - Avoid returning when num_fans is 0 in
>     xe_hwmon_get_preregistration_info(), ensuring thermal mailbox
>     initialization is not skipped.
>   - Remove XE_PCODE_FAN_CONTROL_TIMEOUT_MS which is unnecessary as default
>     timeout itself is now 10ms.
>   - Use xe_pcode_read() instead of xe_pcode_read_timeout().
>   - Rename fan_control_point_count to point_count in struct fan_table.
>   - Resolve kernel-doc warnings.
>   - Add valid check for stock table fan point count.
>   - Use the fan-enable bitmap reported by FSC_READ_NUM_FANS when enumerating
>     fans. This avoids assuming contiguous fan indices and allows masks with
>     gaps to be represented correctly in the hwmon interface.
>
> v4:
>   - Clamp unsupported fan masks and oversized stock tables instead of
>     failing initialization. (Soham)
>   - On stock table read failure, mark that fan's table empty and continue
>     with the remaining fans; fan_input stays visible. (Soham)
>   - Clear fan enable mask and min PWM on pcode read failure. (Soham)
>   - Fix FCP_INDEX() type safety and clean up macro usage. (Soham)
>   - Use xe_hwmon_pcode_read_fan_control() for fan mailbox reads. (Soham)
>   - Fix kernel-doc for fan_table_type and nested fan_table members.
>   - Skip min PWM read for fans without a stock table.
>   - Make xe_hwmon_get_fan_enable_mask() return void.
>
>   drivers/gpu/drm/xe/xe_hwmon.c     | 177 +++++++++++++++++++++++++++---
>   drivers/gpu/drm/xe/xe_pcode_api.h |   5 +
>   2 files changed, 166 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 42c2f9129da5..2ee4f89e7bf7 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -22,6 +22,7 @@
>   #include "xe_pcode_api.h"
>   #include "xe_sriov.h"
>   #include "xe_pm.h"
> +#include "xe_printk.h"
>   #include "xe_vsec.h"
>   #include "regs/xe_pmt.h"
>   
> @@ -139,13 +140,53 @@ struct xe_hwmon_energy_info {
>   };
>   
>   /**
> - * struct xe_hwmon_fan_info - to cache previous fan reading
> + * enum fan_table_type - fan table types tracked per fan
> + */
> +enum fan_table_type {
> +	/** @STOCK_FAN_TABLE: firmware-provided fan table */
> +	STOCK_FAN_TABLE,
> +	/** @USER_FAN_TABLE: user fan table written through sysfs */
> +	USER_FAN_TABLE,
> +	/** @FAN_TABLE_MAX: number of fan tables tracked per fan */
> +	FAN_TABLE_MAX,
> +};
> +
> +/* Check if a fan is enabled based on the fan_enable_mask got from FSC_READ_NUM_FANS. */
> +#define IS_FAN_ENABLED(hwmon, fan) ((hwmon)->fan_enable_mask & BIT(fan))
> +
> +/* Maximum number of fan control points supported by each fan. */
> +#define MAX_FAN_CONTROL_POINTS	10
> +
> +/* Fan control point index: bit31 selects fan table type; bits30:0 control point index. */
> +#define FCP_INDEX(table_type, point_num) (((u32)(table_type) << 31) | \
> +						((u32)(point_num) & GENMASK(30, 0)))
> +
> +/**
> + * struct xe_hwmon_fan_info - cached fan telemetry and control state
> + *
> + * Each fan keeps the latest tachometer sampling state along with two fan
> + * tables: the stock table discovered from firmware and the user table managed
> + * by hwmon sysfs writes.
>    */
>   struct xe_hwmon_fan_info {
>   	/** @reg_val_prev: previous fan reg val */
>   	u32 reg_val_prev;
>   	/** @time_prev: previous timestamp */
>   	u64 time_prev;
> +	/** @fan_table: fan control tables */
> +	struct fan_table {
> +		/** @fan_table.point_count: number of fan control points */
> +		u8 point_count;
> +		/** @fan_table.fcp: array of fan control points */
> +		struct fan_control_point {
> +			/** @fan_table.fcp.temp: temperature in degree celsius */
> +			u8 temp;
> +			/** @fan_table.fcp.speed: fan speed in percentage */
> +			u8 speed;
> +		} fcp[MAX_FAN_CONTROL_POINTS];
> +	} fan_table[FAN_TABLE_MAX];
> +	/** @min_pwm: minimum fan PWM */
> +	u32 min_pwm;
>   };
>   
>   /**
> @@ -194,6 +235,8 @@ struct xe_hwmon {
>   	int scl_shift_time;
>   	/** @ei: Energy info for energyN_input */
>   	struct xe_hwmon_energy_info ei[CHANNEL_MAX];
> +	/** @fan_enable_mask: bitmask of available fans */
> +	u32 fan_enable_mask;
>   	/** @fi: Fan info for fanN_input */
>   	struct xe_hwmon_fan_info fi[FAN_MAX];
>   	/** @read_power_limit_from_pcode: pcode accepted power limits write for the channel */
> @@ -1076,17 +1119,117 @@ static int xe_hwmon_pcode_write_i1(const struct xe_hwmon *hwmon, u32 uval)
>   			      (uval & POWER_SETUP_I1_DATA_MASK));
>   }
>   
> -static int xe_hwmon_pcode_read_fan_control(const struct xe_hwmon *hwmon, u32 subcmd, u32 *uval)
> +static int xe_hwmon_pcode_read_fan_control(const struct xe_hwmon *hwmon, u32 subcmd, u8 fan_num,
> +					   u32 *uval)
>   {
>   	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>   
> +	return xe_pcode_read(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL, subcmd, fan_num),
> +				     uval, NULL);
> +}
> +
> +static void xe_hwmon_get_fan_enable_mask(struct xe_hwmon *hwmon)
> +{
> +	int ret;
> +
>   	/* Platforms that don't return correct value */
> -	if (hwmon->xe->info.platform == XE_DG2 && subcmd == FSC_READ_NUM_FANS) {
> -		*uval = 2;
> -		return 0;
> +	if (hwmon->xe->info.platform == XE_DG2) {
> +		hwmon->fan_enable_mask = GENMASK(1, 0);
> +		return;
> +	}
> +
> +	ret = xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_NUM_FANS, 0,
> +					      &hwmon->fan_enable_mask);
> +	if (ret) {
> +		hwmon->fan_enable_mask = 0;
> +		xe_warn(hwmon->xe, "failed to read number of fans, ret=%d\n", ret);
> +		return;
>   	}
>   
> -	return xe_pcode_read(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL, subcmd, 0), uval, NULL);
> +	/* Check if fan mask exceeds FAN_MAX and log a warning if it does */
> +	if (hwmon->fan_enable_mask & ~GENMASK(FAN_MAX - 1, 0)) {
> +		xe_warn(hwmon->xe, "Fan enable mask exceeds %d supported fans, clamping\n",
> +			FAN_MAX);
> +		hwmon->fan_enable_mask &= GENMASK(FAN_MAX - 1, 0);
> +	}
> +
> +	xe_info(hwmon->xe, "Number of fans detected: %u\n", hweight32(hwmon->fan_enable_mask));
Other messages in this patch start with a lowercase letter. Could these 
two match that style throughout the series ?
> +}
> +
> +static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
> +{
> +	int point;
> +	int fan;
> +	int ret;
> +	int err = 0;
> +
> +	/* Stock table failures leave fan_input visible; tach readout doesn't need it. */
> +	for (fan = 0; fan < FAN_MAX; fan++) {
> +		struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
> +		u32 stock_fcp_count = 0;
> +
> +		if (!IS_FAN_ENABLED(hwmon, fan))
> +			continue;
> +
> +		ret = xe_hwmon_pcode_read_fan_control(hwmon,
> +						      FSC_READ_STOCK_FAN_CONTROL_POINTS,
> +						      fan, &stock_fcp_count);
> +		if (ret || !stock_fcp_count) {
> +			xe_warn(hwmon->xe,
> +				"fan %d stock table unavailable, ret=%d, point count=%u\n",
> +				fan, ret, ret ? 0 : stock_fcp_count);
> +			err = ret ?: -ENODATA;
> Only the last error is kept when more than one fan fails. Is that intended?
> +			continue;
> +		}
> +
> +		if (stock_fcp_count > MAX_FAN_CONTROL_POINTS) {
> +			xe_warn(hwmon->xe,
> +				"fan %d stock table point count %u exceeds maximum %u, clamping\n",
> +				fan, stock_fcp_count, MAX_FAN_CONTROL_POINTS);
> +			stock_fcp_count = MAX_FAN_CONTROL_POINTS;
> +		}
> +
> +		fi->fan_table[STOCK_FAN_TABLE].point_count = stock_fcp_count;
> +		xe_dbg(hwmon->xe, "fan %d stock table point count is %u\n", fan,
> +		       fi->fan_table[STOCK_FAN_TABLE].point_count);
> +
> +		/* Cache the stock fan table for later use. */
> +		for (point = 0; point < fi->fan_table[STOCK_FAN_TABLE].point_count;
> +		     point++) {
> +			u32 fcp = FCP_INDEX(STOCK_FAN_TABLE, point);
> +
> +			ret = xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_FAN_TABLE, fan, &fcp);
> +			if (ret) {
> +				xe_warn(hwmon->xe, "failed to read fan %d stock point %d, ret=%d\n",
> +					fan, point, ret);
> +				fi->fan_table[STOCK_FAN_TABLE].point_count = 0;
> +				err = ret;
> +				break;
> +			}
> +
> +			fi->fan_table[STOCK_FAN_TABLE].fcp[point].temp =
> +						REG_FIELD_GET(FAN_CONTROL_POINT_TEMP_MASK, fcp);
> +			fi->fan_table[STOCK_FAN_TABLE].fcp[point].speed =
> +						REG_FIELD_GET(FAN_CONTROL_POINT_SPEED_MASK, fcp);
> +			xe_dbg(hwmon->xe, "fan %d stock point %d: temp %u C, speed %u %%\n",
> +			       fan, point, fi->fan_table[STOCK_FAN_TABLE].fcp[point].temp,
> +			       fi->fan_table[STOCK_FAN_TABLE].fcp[point].speed);
> +		}
> +
> +		if (!fi->fan_table[STOCK_FAN_TABLE].point_count)
> +			continue;
> +
> +		/* Read minimum fan PWM */
> +		ret = xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_FAN_MIN_PWM, fan,
> +						      &fi->min_pwm);
Why does reading min_pwm depend on the stock table?
> +		if (ret) {
> +			fi->min_pwm = 0;
> +			xe_warn(hwmon->xe, "fan %d min pwm unavailable, ret=%d\n", fan, ret);
> +		} else {
> +			xe_dbg(hwmon->xe, "fan %d min PWM %u\n", fan, fi->min_pwm);
> +		}
> +	}
> +	return err;
>   }
>   
>   static int xe_hwmon_power_curr_crit_read(struct xe_hwmon *hwmon, int channel,
> @@ -1616,17 +1759,12 @@ xe_hwmon_energy_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>   static umode_t
>   xe_hwmon_fan_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>   {
> -	u32 uval = 0;
> -
>   	if (!hwmon->xe->info.has_fan_control)
>   		return 0;
>   
>   	switch (attr) {
>   	case hwmon_fan_input:
> -		if (xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_NUM_FANS, &uval))
> -			return 0;
> -
> -		return channel < uval ? 0444 : 0;
> +		return IS_FAN_ENABLED(hwmon, channel) ? 0444 : 0;
>   	default:
>   		return 0;
>   	}
> @@ -1859,11 +1997,18 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
>   		if (xe_hwmon_is_visible(hwmon, hwmon_energy, hwmon_energy_input, channel))
>   			xe_hwmon_energy_get(hwmon, channel, &energy);
>   
> -	/* Initialize 'struct xe_hwmon_fan_info' with initial fan register reading. */
> -	for (channel = 0; channel < FAN_MAX; channel++)
> -		if (xe_hwmon_is_visible(hwmon, hwmon_fan, hwmon_fan_input, channel))
> -			xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
> +	if (hwmon->xe->info.has_fan_control) {
> +		xe_hwmon_get_fan_enable_mask(hwmon);
> +
> +		/* Initialize 'struct xe_hwmon_fan_info' with initial fan register reading. */
> +		for (channel = 0; channel < FAN_MAX; channel++)
> +			if (IS_FAN_ENABLED(hwmon, channel))
> +				xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
>   
> +		/* Fan control tables initialization */
> +		if (xe_hwmon_read_fan_control_info(hwmon))
> +			xe_warn(hwmon->xe, "Fan control tables are not available\n");
A warning is already printed for each fan, so this one repeats it. Would 
xe_dbg() be enough here?

Regards,
Soham
> +	}
>   	return xe_hwmon_init_temp_info(hwmon);
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index 00c4fc7d0124..0349b24a8259 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -83,6 +83,11 @@
>   
>   #define   FAN_SPEED_CONTROL			0x7D
>   #define     FSC_READ_NUM_FANS			0x4
> +#define     FSC_READ_STOCK_FAN_CONTROL_POINTS	0x5
> +#define     FSC_READ_FAN_TABLE			0x7
> +#define     FAN_CONTROL_POINT_TEMP_MASK		REG_GENMASK(7, 0)
> +#define     FAN_CONTROL_POINT_SPEED_MASK	REG_GENMASK(15, 8)
> +#define     FSC_READ_FAN_MIN_PWM		0x8
>   
>   #define PCODE_SCRATCH(x)		XE_REG(0x138320 + ((x) * 4))
>   /* PCODE_SCRATCH0 */

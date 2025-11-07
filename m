Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 062D7CCF9F8
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 19:52:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDADC10EB66;
	Fri,  7 Nov 2025 19:52:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IadHQeTS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C80B10EB66
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Nov 2025 19:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762545165; x=1794081165;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xZ2IWoRhYfyqQ7pxmYcasAtQA3aaIDfJW+RBVgZE69U=;
 b=IadHQeTSqEHdaHSOdg1m4UaieVP+li+OLk3Gk51zCIUTjuAZ+LyrQy1W
 1EJgMcRy5gHXGMU8xxQhHcdDwPNyF5YXcqQ1FxZ25YlHtuGti9LEbi55t
 O/Hff5PKlvW14O7aXNA3k4pjJtdxM1INxd4koWHvs87TW7VQAQsKIfqM6
 ToskZOFP70z/LN0qq7vbxbI3s4Fj35e82nT8V8qVLrfqkM2TyIq75HX4O
 udbSAe4YW+SVOtMgWHZ/apdr2owKxzhTj+7Ctu21bD3x0ktjy6U6dbY7s
 nkKUC1eC/SkpmAf53dq8uRhO3e5Ta0BirIapjC/0bdUuFURjjK3EKd3sU w==;
X-CSE-ConnectionGUID: laCVIiW0Sn6vYaMUk+3+FA==
X-CSE-MsgGUID: UXEc5FlpSmWlnmsWN3u1RA==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="64399156"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="64399156"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 11:52:44 -0800
X-CSE-ConnectionGUID: eLyKOxE6SSOh53aIOAnZiA==
X-CSE-MsgGUID: vaRR6/z2QVycevjAZdw/0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="218857796"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 11:52:44 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 11:52:41 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 7 Nov 2025 11:52:41 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.27) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 11:52:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uKXZjVQephC4cWo2iXnnBWatGgkbmOwsdvGMcn7D+nBvKoPlAmUrlokL+8cIBI+yDNmr4ajV/lOmR8C9LBwrKQQFTDyn7JOFlKiqagCxeTTVXPhTY5T+udPKyQGXYEa7fBzWgj4svm2MMd3pHIKx+8WnKJlT5jHWnpYGYPLkpYC7WDTVB6Anp1YGz+hMZR/AHhlu/F2J0VoX7HPFcKGx1mkoxnh2MwVeJqbmKuY5RHlnd0WGLiZjS6dfQJnrCE9EROmLrj8Eg/c2VWOalr0N8apTXLqAtBA95Rc/NEckiYXd15N9Qh2TmNvYZzBvvRrQXaImkTMd4Fb7v+DXF8jjXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=81DJyHLmnHwNdc90V+A/+MaXALx7eKCVmGkiyfUzGNE=;
 b=K17GTMNi2oEuWibRUScNVSP83NcxRrBqnHbvc7Ooll0vcAQ0FK6YZRqfC93uTNSUYeox6nBfjh9WWho0P5osxrbpRCtXtWs3N2RlL/XksVB4axODmXIN8UmqBDkPrRNka9U5ulsXrA1R2atgx73ZFGJYkKAoezqx9lhbAA9/eIvYe2ait3UQjq8w1SfBsYsD7aQhLZ5LIiojVTDUOSOEKE48HnoCmxhr3hrJQvqlfLm8VyZUyfQ7fRa/oebk0xlYo97Pn87pONqhfBEP10I11pPrEfj5GDCgtW2hZhfozNldHOw/n2LlPKIMoNGD4jXJ0L7LhGwLtoaFZ3my8d+0zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by PH7PR11MB6908.namprd11.prod.outlook.com (2603:10b6:510:204::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.10; Fri, 7 Nov
 2025 19:52:37 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2%6]) with mapi id 15.20.9298.012; Fri, 7 Nov 2025
 19:52:37 +0000
Date: Fri, 7 Nov 2025 11:52:35 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 02/33] drm/xe/eustall: Store forcewake reference in
 stream structure
Message-ID: <aQ5OA2kHvJCkZlBe@intel.com>
References: <20251107181315.631642-35-matthew.d.roper@intel.com>
 <20251107181315.631642-37-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20251107181315.631642-37-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4PR03CA0062.namprd03.prod.outlook.com
 (2603:10b6:303:b6::7) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|PH7PR11MB6908:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a631ff6-a3ab-494d-fb3a-08de1e3733c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NnRaZjR1SEVxZGpMamdNWURidldaMmRURkRhcFpseE85dkhPWmJUd2xVRTJS?=
 =?utf-8?B?UnVGYzVLbnZBeW1XZll1R1Nod2psb00xSy8xLzQxN0Uwc3pCOEdOcTFVd20z?=
 =?utf-8?B?R0txZE9VcGdiYUxjR3dacG1qOU9HdEhXcFJPaVJRa01udENJVmdidENDc0ho?=
 =?utf-8?B?bUdsaHpNSW9URzZ3RGxPTFFVUmkwV0RCWWZ6cEtGK0tocDFkRVZod2ozT28x?=
 =?utf-8?B?OFNDOVpOanBTTUlMdFVQTUtGRkxVN21JYVlGVkdpdC8vRFZKRnNkeGtvS1Fp?=
 =?utf-8?B?WlZnTGdVVVc5ZjhTT2J1ZFlwU2dPT2dCeldqTjdTOUNnVk44aU9mNEEzSjlB?=
 =?utf-8?B?cFhHYVJORFE3K1kwVUcxaVZwYlV4VHU3SlJiUmxNeU9XUTdEeUVIMkNPaWpI?=
 =?utf-8?B?ZkFPNHhteHJwQ1NSN21yUVJNVHB0eW42OGFjeGMvTmx1d0diV3VyeFJUYzN5?=
 =?utf-8?B?REVsRUdFWEp4MVB0ZmM5dXp5QmFHa2t6WVhXL3lnVzlQWnY2VC91dUtZeThl?=
 =?utf-8?B?emd3bGFjeS9SN3dyLzFjZTYzcnNVYmN2YjFzWEVtUWM3alIvME8xblY0eEF6?=
 =?utf-8?B?azRiTExNMWo4MG5BakREQWw4bEVNamNqVTRMQ2VteWZva0grWmx4SDFyUzlZ?=
 =?utf-8?B?c1Rqak5iVWRML2hKZVhLL294YnN3bGFPOGRMd1pPVVczeXpaUWlHb1BCaEZW?=
 =?utf-8?B?c2xvVVJhVzd0MzFPbGR5cEFNOUY0S2FDTjJLN0x6K3NoVUdLSWNESVg5alIz?=
 =?utf-8?B?TmRDNlNxYXpPbnozazVESjliRE4vNlJNNGxGZDFZOU5TdS92d3VpK01XL1Qw?=
 =?utf-8?B?OU5LaUpsMU5IaGJFYnlWZFI3dFBQdVhCYWVTejRLWlNyOThpSnMwZlBDUGZR?=
 =?utf-8?B?Y09BSktDTkJmRWFwcTBSTUx2dHV4c1hsR1JSRk5Xd242TnJqS0lQR041MUdh?=
 =?utf-8?B?WFZnZlZuRDkzWU1mTGJ2MGdLS3FRRXRVVGs3M0twaU1ROE9pVzZEWXNEQ2do?=
 =?utf-8?B?cjR3TFgzY0VhbExtYzZLa214bXg0bXdGSGNkSUp5YzlCNEE0bFRJQ0ROZ3NH?=
 =?utf-8?B?ZEp6Ykhzd1M4dUxHa1VNMlkvSmEyejVUWkNLd0ZDZUhPUld3R3VJc05hU3FG?=
 =?utf-8?B?bGo4NTJTak83SmFPcXZiSTNudjY1SU0vUWZjQkQ0UUw2eCs5QVpMeUNSWGRR?=
 =?utf-8?B?b3JrWG0zUWlLYjZvMU15bzJYVEREdWwwM3hET0h4d1dUS3BKd3c0ZmVKSDJl?=
 =?utf-8?B?cDA1ZTJ4MzJrZUQ2ME8xOERMdW9weDNqYkIzcUh5NXNVSzVveTRUVlBTbVNi?=
 =?utf-8?B?ekl3WU9IRjhLaXVia20yWGtPZGxIMnZZSDhyU3hrbHkzc0NiWlpIMTZuMTg3?=
 =?utf-8?B?V21sdmtMSlV0Wmh6WEs1dUdRSVN6Zmp2RExrcFozaFBmRWFHQW5leURFdEZh?=
 =?utf-8?B?Q3o4SDlKWExMWWFPOW5KM25EL3RqbjMvbmtid2FUL2d6MTlWK1VpRk1rT0cw?=
 =?utf-8?B?QlMvd2kxdUVZMU5xU0dLR1RrNDBMN29PSUFyUmtyRTNOVXpTWFZwTUFLSmlT?=
 =?utf-8?B?U0pLNW9qZ2xJc1h5ODNjUE1zVzFyellZWENJdGRCRUNwejRMT2JsU3BZbi9m?=
 =?utf-8?B?dncxaDdEQkcrVDJNejBUVmh3NEtwQkdmaXNuRGtlSUlCVzRIcmlXZmRYeHcr?=
 =?utf-8?B?YXArbUtYbWJuT2x4Tnd2VllhOEx2WlZ6SGRHMG5ySkF3WU1SdzJGanJVaXBo?=
 =?utf-8?B?RkdEdEkzcnhvN21nTHdZeVBXa2M3dnhrZE5MaG1UQkcwbHpVc0lqZ2pMY3p3?=
 =?utf-8?B?ajVDZ0VBOGgyanBjYnpoZkl0d3gwZ3llM1lma1NjcHJlNzdSNGtadm9zRXls?=
 =?utf-8?B?dTYrdnpLL3dZdjVxRmV3VHFvTDVmeERYRjVmakVEYUVBSDNVMnFEYW9YQmVp?=
 =?utf-8?Q?/2mMnLDCFkLSpopHucXQ6Uyi50nk7NN0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTRqSXBqaXd0TFVzdlptSGtQQkc0bGNkWjdPaTVMNy82MkgzVEtLWmtZR0N6?=
 =?utf-8?B?dDlpME16Tnd1YnpCRk1LMlNuVkVJN1JmbmY0K1lZVndOK3h6b011NnhucmlI?=
 =?utf-8?B?K1J6V0xNQ0pHcUREc2h1b3Ayd2ZVVlZoanNrZFlZUzVLbGtFaFlWZmIzbFp0?=
 =?utf-8?B?YUczZ1hDeFIzaXNJRHMxSlNEaG83QXpCSlM1Y2tFQnMzeEszSjNMNlBJMk9O?=
 =?utf-8?B?SGhqaGw5am5iWU1ZZWx3MncxcUYraW85SnJ4NytsajNzQk5VdVZSU3VaVjl6?=
 =?utf-8?B?WTBDYTlUWVpJV2cxWk1rdEFnWDU0TE1BTGd5Wk5MQkVEM0Q2WmJ3QkVoYXFY?=
 =?utf-8?B?U1puVzgyOHFIMkEweDVycEU2djcrZnZRTW1ab1A4QmF3cVYzS0NsRmdJR3du?=
 =?utf-8?B?SEdncU5mQkZNWVlhd2NheUhNZmxBUHBJRFZoaWdTaVBnMTU4TU56YUFtWk9s?=
 =?utf-8?B?VGpNbUhBMnJhTUt2aGhHMDB5Uk5ERXZtSmR6bWg4bHFyQnlwMU9FNWhiTGpt?=
 =?utf-8?B?N1BrdEpKOW1jdHJvN01CbFhMVkFIdDB3Y0JBbkQ0a2Job3BDZWNLR2Z5N0hp?=
 =?utf-8?B?RHp1OVZVREw1ZnVQSkxwTFRtVzRVUDIxRDEwK1Q5N3NTdG1QUUpPVlZ0NmJV?=
 =?utf-8?B?VnNXVDRKWVd2QTdzSHdvNU9VNkM0am5IVFl2NURiMy9jOEhrTnljSWYyT1lW?=
 =?utf-8?B?SnV0c0cycUlTOTJXZVVmbnF6L1MxaWtaUVl5RVlaRnJObStld0ZTbkNNYjNi?=
 =?utf-8?B?MFJHcUx6KzZyZ0NvanY4QWZiVThRcUI3VW1oeE5pZXR1TzV0Q0hpOEZJbDZh?=
 =?utf-8?B?NmdrbDF2ZzFWTmE1djJnaERzeEsxZ0R0WDhVbEpKSXBsOXNVZzZ5VWZUWGh4?=
 =?utf-8?B?R21Uemg5a2txRWNPZ3p4Zng1RDU4QUhtcko2eTdRQ0FTc3hycERINE5WaEln?=
 =?utf-8?B?Mk9pc0YvUEh0a1JCdHIwYmVXUHYzVTBJTVVucmFrelo4RTdVcUFMS0Y0eVg1?=
 =?utf-8?B?cVp3eHpCdURGRjVEZERpandjTmttQWE0cW9Ia3VMM2pUWkZuV2VLRloxbzdM?=
 =?utf-8?B?L04ycmlBSUVFeEtEUmhOM2QwcXJyZkdVVythZlB5aUxoU1dqUmg5R0JSSk5P?=
 =?utf-8?B?YXpBWWFOMFA1TWVEVTZ2SVdTbVRoRGVuQ0xIeGgzWDQxU0ttWGtzZE1PTnI3?=
 =?utf-8?B?UDJpRVN2aGthN2pPZEZLYXRidXh6dnFwSVB2MkVMcUhyMU1CQmIzN2dPV1Jn?=
 =?utf-8?B?Q2g5L1JGQjQ0bjJ6Q1hLdEc3UmN5SDlBRnpGZkp2OXNqZnJORkhJc0JtWVhM?=
 =?utf-8?B?eVV0eC9VWUp5bGhDQmZ5T25FNmJ1cU1UNzBraUp6SVNsREdBNXdUTStFUlpG?=
 =?utf-8?B?a1JSZU5ka0E0QzA4Z0gwNFVJa2ZHSktwZVZmVXJFL0xnckt0ZVFGQVlVcldS?=
 =?utf-8?B?WUpOTXRkR21lYkJTWldUNU9CWlJOVEhTcnRoTy9RNVNmb3F4eURGanJBOEFZ?=
 =?utf-8?B?djRaWWhqdTNucThlTEtYYmhUd2lrR1BXY3hQTU9CYnFOSm40Qk51cVRLRFlz?=
 =?utf-8?B?bC9qSnoyTUhFWDBRYmlHaUUvVm9sQUo3d2JYYW5idUEwTFdrc1FvRG1OUGpM?=
 =?utf-8?B?c2hvUzllYlFqbDNVMUpMR3RqYWc4ZzUwRWhPYk1oTCtkK2VKKzN0VW5hWUUy?=
 =?utf-8?B?VFlHUnZlZkpjSFcxZjBjcEVINDVLVDA2dnRkUVdQR2taWi9UNXdTcUZ1YzZ4?=
 =?utf-8?B?UEU1aldGL2FpMGNZUGtremcxTndWMDNJbjBtajJuTTFyd2VrNkEyWEFRVkdP?=
 =?utf-8?B?b2k4K3dGaVoyb3hydW5mNUR6cGJobVBqSFVkdnJqbmdSVkUvNXlqUnFCdjBy?=
 =?utf-8?B?anJIdjU2ekZKeUFneG94UDhrWUUwZFpnUWVwWGdtTnNtdk9Vb2o0SHNQdU1T?=
 =?utf-8?B?NVBHOS9LV1J2VEwyWGI1d1BhYTE4N1M5c2dqSjZtWDlNbnc1R252OElvY3ZE?=
 =?utf-8?B?OUgyQVNCYm84YjhmQW5abTlwQ01KMzQ1bC9jejA3M1U3U3VZVG9rWXlQeGsw?=
 =?utf-8?B?eXlzU0kxK2JRc1BrUWhudUZKNlV3YWhyYk12YnJkMWlMbDJRZmtSMUZ5cHQ0?=
 =?utf-8?B?NGhWL21icmlOSHdXcmd1d0poYWRIV0ZoYUpGdkJnSWxKUFlLWmMzWDRhWU9H?=
 =?utf-8?B?VXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a631ff6-a3ab-494d-fb3a-08de1e3733c4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 19:52:37.4994 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g8Au2njs9wJXnY3H0nH+CZrnFQu1dFJrbwMYRR8SUUXZX9BRoIGiAAqmragairmEeCu58gILLc/CxOj2GKokDAfYViBlbOh14WTOZ4o+Cho=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6908
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

On Fri, Nov 07, 2025 at 10:13:18AM -0800, Matt Roper wrote:
> Calls to xe_force_wake_put() should generally pass the exact reference
> returned by xe_force_wake_get().  Since EU stall grabs and releases
> forcewake in different functions, xe_eu_stall_disable_locked() is
> currently calling put with a hardcoded RENDER domain.  Although this
> works for now, it's somewhat fragile in case the power domain(s)
> required by stall sampling change in the future, or if workarounds show
> up that require us to obtain additional domains.
> 
> Stash the original reference obtained during stream enable inside the
> stream structure so that we can use it directly when the stream is
> disabled.
> 
> Cc: Harish Chegondi <harish.chegondi@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Harish Chegondi <harish.chegondi@intel.com>

Thanks for the patch
Harish.

> ---
>  drivers/gpu/drm/xe/xe_eu_stall.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
> index 650e45f6a7c7..97dfb7945b7a 100644
> --- a/drivers/gpu/drm/xe/xe_eu_stall.c
> +++ b/drivers/gpu/drm/xe/xe_eu_stall.c
> @@ -49,6 +49,7 @@ struct xe_eu_stall_data_stream {
>  	wait_queue_head_t poll_wq;
>  	size_t data_record_size;
>  	size_t per_xecore_buf_size;
> +	unsigned int fw_ref;
>  
>  	struct xe_gt *gt;
>  	struct xe_bo *bo;
> @@ -660,13 +661,12 @@ static int xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
>  	struct per_xecore_buf *xecore_buf;
>  	struct xe_gt *gt = stream->gt;
>  	u16 group, instance;
> -	unsigned int fw_ref;
>  	int xecore;
>  
>  	/* Take runtime pm ref and forcewake to disable RC6 */
>  	xe_pm_runtime_get(gt_to_xe(gt));
> -	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_RENDER);
> -	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FW_RENDER)) {
> +	stream->fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_RENDER);
> +	if (!xe_force_wake_ref_has_domain(stream->fw_ref, XE_FW_RENDER)) {
>  		xe_gt_err(gt, "Failed to get RENDER forcewake\n");
>  		xe_pm_runtime_put(gt_to_xe(gt));
>  		return -ETIMEDOUT;
> @@ -832,7 +832,7 @@ static int xe_eu_stall_disable_locked(struct xe_eu_stall_data_stream *stream)
>  		xe_gt_mcr_multicast_write(gt, ROW_CHICKEN2,
>  					  _MASKED_BIT_DISABLE(DISABLE_DOP_GATING));
>  
> -	xe_force_wake_put(gt_to_fw(gt), XE_FW_RENDER);
> +	xe_force_wake_put(gt_to_fw(gt), stream->fw_ref);
>  	xe_pm_runtime_put(gt_to_xe(gt));
>  
>  	return 0;
> -- 
> 2.51.1
> 

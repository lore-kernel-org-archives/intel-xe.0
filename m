Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A74BDD1119B
	for <intel-xe@archiver.kernel.org>; Wed, 26 Nov 2025 21:49:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AC6A10E6F9;
	Wed, 26 Nov 2025 21:49:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YrpnlvsC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FFBC10E6F9
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Nov 2025 21:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764193749; x=1795729749;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mpQ8+qVInMkzD79z4hJId7BHMocKa8LWM22za9/Az98=;
 b=YrpnlvsCJ51eCDgQp60zYcHmS1DV4yw1I6BiJfBoEb+OZY8iLMmzRuts
 38HKZEYMET5uu0Hgl2DSxJr+fNpNAsSlg2938/Nz2kx5U+IUjSuJnUG6P
 ABvwqaf31RABP120nIq0pSJP0kdj+fSgDkI1uBjYLwCGWUGfh6ZP8DhVA
 9e9L1nYTdEzgly+Xo+E1TQXdQmeCQHp5H4YDSajga5staDUxvq0ZgKbs5
 cfPC9d5mqsTiIT1C8+d8l90ou9MPKUEEyCt0OM5fD9fUref4ZL4msc8r7
 bGZYsfbo0B3g6ZNETDyreJMaJu7xjCC833Q1RwbgiNwxrEVaGl0YnlvQ2 w==;
X-CSE-ConnectionGUID: 7LNO9TN6Q0SHGQEzIzm67Q==
X-CSE-MsgGUID: vVXwF+PuR2O9aZR1lXr7JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="76869460"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="76869460"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 13:49:09 -0800
X-CSE-ConnectionGUID: pfyn6Lp0Tb6b0cGVztfnRQ==
X-CSE-MsgGUID: myo9DEfETwC60eX/laYi6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="192182492"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 13:49:10 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 13:49:08 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 26 Nov 2025 13:49:08 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.8) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 13:49:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VcPRQsYz6kO//9aIKT24ozqQq5na+qJa7rqm0xlgk6j0uer9+tEF1k4mOcGKmha1PhfhGfOyl5cc9Cy8Guj5PQjMIPFxe5tvGcIA+/j+yluao5De7utSfM0s1V1/390eD/tw8ZUFbIlAtjNmKqY7ADDw2AXrCKZYOrYPQ4KHG1+iijYRo8uBQsrEtHlhbBefcOWIH0Xz/yHo22kvSZBXU+RgU862vOGTsBpI0DwwwjBc4IU7lyyAX4BucY1TaBuaua7TcNiZ8wHfnmgMwswPiA/JuPESRZsBvZ6EAF5ADtx6glDlFHvI3zZLICGCnRw2flkZwK1lab0Uo6TsFtQZVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XH1JuAZrj5TQClMBtklfMqplnMVEawVnK8y7WMFs90E=;
 b=n4Jm9bfhWm4L7N5r6Pv+5gdOOQCHtgmp4gCLIO7LpHxXiHQslAektFHgf3jnrDCGPyT2Qi9Uqdvjz3B1ksnYT7DGUZAFbVxpRSZAAOxUOIFQ8ZXuoXhrHG4NkH1SroPz+jjq9GfIaqK2Qysgo5EB1YxSqC8doH3bZnYanm0F9SxSSdrNf69Qnku/IILHUhxG2MKrjeResE9gbOJC8bUTKApHt3K8XNuk46R1gt7aaCSX0NwI0ley2DBvhjL79fYYFWFnmrTb0M/HRtvon4VmC1fK3fYSPMOp1sOyD9qKcOpBzmqDH7BCsJQO5lPwXnMXn4erJ6yW/Ww4SP6roYIQIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by MW4PR11MB6809.namprd11.prod.outlook.com (2603:10b6:303:1e9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Wed, 26 Nov
 2025 21:49:06 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%7]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 21:49:05 +0000
Date: Wed, 26 Nov 2025 13:49:00 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 4/5] drm/xe/rtp: Refactor OAG MMIO trigger register
 whitelisting
Message-ID: <aSd1zGM60E/v+CsX@soc-5CG1426VCC.clients.intel.com>
References: <20251126035220.13089-1-ashutosh.dixit@intel.com>
 <20251126035220.13089-5-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251126035220.13089-5-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0116.namprd03.prod.outlook.com
 (2603:10b6:303:b7::31) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|MW4PR11MB6809:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a40bb91-1596-4236-be1b-08de2d359ef3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YUFsRjRaV1J2Q1Y0cHN5VFhTc0JTaDZVeVVQUXVROGRnclJ4VHh2eU5wdXJ4?=
 =?utf-8?B?U2c4SXRGVmF4eHBReEhYT3NXWE5oL29xSjcwbmdzZ0tETzlPeFRHTzVSZ1ZO?=
 =?utf-8?B?cHdLVGRhZS9PeU5ncGU4WGd1MGFtYm5QVkVUOEw4ZDM3WTF0ZzgvVVBRUE9I?=
 =?utf-8?B?UUN4NlVoU3lQQ3JlOHM0QnFhMGRCalRiczhvZ1RZY1Vod3F3QU0xOEJKMFhj?=
 =?utf-8?B?SFF2Lzl4M2w2bGpJM0lMV0d0NVROWUY1a3hvaCtwUW9FekdsMExGeDMzMk9Z?=
 =?utf-8?B?c2hHaUFsRHBDMHN0Rm1Kc29CMmVHK3NENGRPUU5uVnBLSzd0djFQRzdrWUQ2?=
 =?utf-8?B?SUxaR1lHaU1DNEFwQ2tpVG43TEhoVnlHZUZzY0NnNENtbUJzT2VBRWsrUHRk?=
 =?utf-8?B?QVJwUWFGcGZOZC9PeUExYjZubTNzdVB4R3VrQnhQNFk0NUI0Y1Q5dHNrMHkx?=
 =?utf-8?B?QkhzZkN5cVM5VGJjejdMaWsza1pNVFprMFg1RTY2NEFJeHdXcDBqdHNTVTRp?=
 =?utf-8?B?K0VKVEo4UmVxVld0WUUvM2x2bXZkU1pTL3hXbTNqTXo0UlJOaUdSUEpxcGxK?=
 =?utf-8?B?RjJjZVBVZ3I4QWpXeEI3OEIyVS9lNEQxMW8wMW1BMHBWMTBOVVZmekxibnFM?=
 =?utf-8?B?S0NwSWppckh6VXJPY0thVVh2UGZWV2p5ejBjMXRIc0JjVVoxTE9KNU5iSGNF?=
 =?utf-8?B?TzdXS2VrUVZ6b04vK2VmZnFQekFKSk81eFowUDZJKzVMYUNTQkJQeUlEVWdS?=
 =?utf-8?B?SkZlMXJubGg4TnRqYlNKQXZERHF3d0J6VXNHMlJQTjFDSTNyZlJHQmdkdW40?=
 =?utf-8?B?eHRveFZkNmw1UXArVTJLWjk4OUpreExxRFZRUjlsdEpma1ZNVUdpeVZvemdU?=
 =?utf-8?B?L2JqSE1nRnd4Z0tYVXhCMTZMVElPV0RTNmNQeHEwMS8wSWZyMGpCaDZqNGYw?=
 =?utf-8?B?UGZPOGVCVVRSay84MU41K2hydytIc1VuSW1odUVRVERJWGZDUGVienFucFhQ?=
 =?utf-8?B?WkkzK2VZSThrajFsUjJ4T3dtMmdxdHVDNW44L1Z6Y05seEgvVTl4Tm4yRExG?=
 =?utf-8?B?d0pwSmt6UEJ0ZWkxYnJtdS82dVBteUc1Ym9NQVRUZ3pVMFRMYjkwTGJCOXpK?=
 =?utf-8?B?WVFJR0QwYnBMQllCcGtFZ3JBcTFGeE5jeVNEMVIwUW5mMmRkRDlhK0t5T0JT?=
 =?utf-8?B?WFA0NmdyNCszd05qeUN0azNKNzFlTTZwdkV2SVl6MERXT0UxZ0Q4eUs5eHB6?=
 =?utf-8?B?aDdlL0crakhHdVF4NTNLVDB2RXg5aGFzdWR5TjFGMm1vSnl0NnQ3czRUMmlV?=
 =?utf-8?B?M0gvZnlOc0owY2hPZ3BYeUVyQmwxdTFick01SmJ6UHJtSDlVYU1mY2YxcHd3?=
 =?utf-8?B?emlaMXpGdFZTdlhGYm0wTTBLajF6UFozbWtieHVkNHlIWU1SQXFHNW85WGJO?=
 =?utf-8?B?MStHR20va3ZIR3dIMWZUbDBjTUJpbmwwVHZsM2J5dzFIVTZtZ1VtU3RvMjdQ?=
 =?utf-8?B?TVJDWURKSWdLRzZPVC9TeHEramlhTFA5TWprb24zZVJlU3IzWWRFd0hHR0tE?=
 =?utf-8?B?WWdHaDFNQVJsZjRCSFNzTWtOSU9LUHMyb25nTkpzQ0s5RXlRY01iT0l2M0ZY?=
 =?utf-8?B?TlJJdWhMeFFHdityOERBcUlBakN0NC9RNTVLeEdKWk1TN0VpOU1nODBFSjhZ?=
 =?utf-8?B?dU5wK2tTMXpPcVg1a2hUTEdNa3Y1K2c3TFJRYmNHSE1PZ0E1QVBYN0NvV1dM?=
 =?utf-8?B?T1Z2QzNIZTF4SWxpR2crOVlKWEloSDY2bnpHS29zbnI0MXlaSU1WbnRnb3oy?=
 =?utf-8?B?WHFEV1BWVFRaNUxBZ1JCS2tGSDVwMUNSQ0N1ZmM1K0xBK2dLWSs3ekJBSk1P?=
 =?utf-8?B?VFlETEE1bE9hbVVDT3NUSzBWTFdHNWt4STN6RHhvaWRqdWR5TDRoSnUvTXI3?=
 =?utf-8?Q?mzrk06N6Ssx9KEF5mJZDye71VCId6bfI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ay9qSlZPaWNTVUpsUFFXaC9qY0ZvOEVEc0R1NmxRczFBT0FkTGVmand4UkZs?=
 =?utf-8?B?RXY0VzdZandCV2ZQT0dQT3lJWUlwdTQwakl3YWhWcXRNbDk3OWNtTzhhWGdU?=
 =?utf-8?B?Q05uTWZPbzhQNUFVNTVMKzdreUpKUFVJRUd2M0t1U2ZXeEZVNU9NMExUVHFG?=
 =?utf-8?B?NE9JRmhuNXdyT0NxQ3dCRXNwenp2cFNnUGRBZlUyZVM3UkxLVytsUHBCcHJk?=
 =?utf-8?B?RWJZNXJVQlJwS1J2U1dMYWNlQTZONXJZWGl1OW1YZWJmb1JQdnpXWXZrcjcv?=
 =?utf-8?B?Wk42N2dxRTlrd3N0dFNLRERaaXM4eUpTTmpoRW1FenFRMGY5UzBSR2xzd1VP?=
 =?utf-8?B?M0I5OUM2MmJUdU9EM0hKN3FUNmdTNTY2cHdBcEdtd2ZHTll6TEVFNTBXRjJE?=
 =?utf-8?B?RElwUVdib2dOSG9XYUlDRFArUWtUbENnRWxsR1JVMWRXZjVkaWoxeXNWUHNx?=
 =?utf-8?B?ZlBRaVQrb3QvaVF4TXdBWE85SlhKSHRoU0dGN0prcnowRHhiMzdmVVo4OTI2?=
 =?utf-8?B?OFJhc3dKWFFEeHk1VG0zVlZ5WC9XQnIwK3ZjVi92MU1UTzdLWTlkNHlqVHVy?=
 =?utf-8?B?R040eE1TSnVuMFc1UWc1ckYwMEFzRk1UWXVvL0JCSjZhUGVFOEpBRHhYWVBE?=
 =?utf-8?B?RFNnL1hQd3BZSTBHekxmN3pNTmlVYjNTZDJLOUY2TStTbXFyeS85WkEyL3pG?=
 =?utf-8?B?azFiNGpLc25lZWdTOXdUWjBObHhsS2VTTlByNnFaSldmVE5sZzB0OWtDaEJJ?=
 =?utf-8?B?NjdpQU1hOXBvYk1sVE1tQThaeEJlcjJYWWIzN25xUlNKNUNPVVk2TlRaRmFB?=
 =?utf-8?B?NnNSd1BIWmJSUmk3b2o4RVdpTXE4L1ZCbm9URWdoRlNFV2JrQkF5RFJ4bE80?=
 =?utf-8?B?MVZtK043Vm9vZHQ4d2dJbm9QeUUvbnZFSXlWZUd2MmlVZ2UrbGhxeFJmdmJR?=
 =?utf-8?B?anZVeGZaRlJoM1NFQjBGM2NKZ1oxNFNtd3JZdnJwUm5OMGZramx6dmJVdDNu?=
 =?utf-8?B?cGRLc1pzUmtzRjI5blV4L244MGhRSlQ5Y2dYaDFkQlVmTkZmRE5JMXYySFdu?=
 =?utf-8?B?TjQ1VzJTdlhkcXFIaGJpWFVwbWRKU1orQ0QyWGJUc3I5UUJMcEE3YlFEc0x5?=
 =?utf-8?B?UHEzQVRqSEFadlZNT0liSWhTVk1xc0tFQlJPVGpSTVRDOVBzMFkxNlV1R0tV?=
 =?utf-8?B?N0I3OFZoYkdxclNGTm1HcXdlZlp5cVUwWFh1aVY3ZGJjUHZRQU1BeTBLYWdF?=
 =?utf-8?B?TG9RUnM3VjNzeHg5ekRNckxURzhoRjZvMyt5Rk4zMTdCem01ODBqb3lYZUFU?=
 =?utf-8?B?bENyZ1BFUUt1TjJpVnBqV0wvUTAydTVaTkFvU2c0ejRIMGJBajVhbDRVbUZj?=
 =?utf-8?B?OTJaR091bE1PZExGMlFUaGdJcVBOSlRER1YyN1dUZGtkQ3A1eW1RbmVKck04?=
 =?utf-8?B?Skp1Q2F1b3A5RVV1cmlERzU3UnFXcTdlQzZUL1Vkenk1Z2t6UElKc2ZDNGNV?=
 =?utf-8?B?REhWa1ZUZ3VnaDF3OGhZcGV0NG5PUlFBakMzcmlMU2Jlellxelg2UnFYQWhZ?=
 =?utf-8?B?VG1UTDRMLzZTRFY4SUVNbEs0cmxUd0FYT04xWWh4MCtkeXY3Mk5GazVua3kw?=
 =?utf-8?B?b0tLNy9xUVlLdENZMEhIWGtjbzAzNCs0VkhIV0dXM0czcDVkb0tNZ29vR3JY?=
 =?utf-8?B?WjE1SmVLcWdZTjhZOHBNSkpDKzNuTFQvWm9McVlickg3eVJ5am1yVWF4dUYv?=
 =?utf-8?B?bGlSbHVPd3JGbmRyRlFIOG44R0l3UkZjcE95RzRna2YzRGxhdUt2R1FCRlov?=
 =?utf-8?B?MnpIdjBsUGJwVmdNcVhaMEVpSjI0QlFEMDYwSTdwNW4xYnNJSzdOZVgrS3FO?=
 =?utf-8?B?d2ZYQjRlLzNOUzRCekxVQnlrc2VmcmQyc3VJQWdYT0htdU1iZjFxUElKUlVM?=
 =?utf-8?B?dkdpeUtab2VVUTl0MEdGVG1yS3lWL1FHTDNybU1xdytSeVROM3k2RlU5UHNW?=
 =?utf-8?B?dUxweWxOMHg0VURKMXVZTnBLTGg5UWlpc2QvVDRFd29JMkpYdndIZ0h0aU9k?=
 =?utf-8?B?L3hrSEV0SFdUWmk3K1BneklyR3hTalluTVdhWmNxSlFDdU4yaTZuSkV3aUJG?=
 =?utf-8?B?NjZIQzl6cCtDcXB6UUhFMXdzSXN1M1ZSdXg0Y3QvTlBDb2ZuejRlTStyZFZa?=
 =?utf-8?Q?j4RW6yf0a3MEaMnD04cuFl8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a40bb91-1596-4236-be1b-08de2d359ef3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 21:49:05.8153 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zS9ddLG5fDnUeWexMJfsy+UrGxBjT7GhKFgoyMQHbYwcuW+MFGbKakdJ/EEeLWFC8K3ED/R9NWb4zfuyEy20Gp1t3sL/PbkXrcp6+u1uqdo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6809
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

On Tue, Nov 25, 2025 at 07:52:19PM -0800, Ashutosh Dixit wrote:
>Minor refactor of OAG MMIO trigger register whitelisting for code reuse
>with OAM MMIO trigger register whitelisting.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

LGTM,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
>---
> drivers/gpu/drm/xe/xe_reg_whitelist.c | 41 +++++++++++++--------------
> 1 file changed, 19 insertions(+), 22 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>index 7ca360b2c20d6..e8e47aa16a5df 100644
>--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
>+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>@@ -67,28 +67,6 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
> 		       ENGINE_CLASS(RENDER)),
> 	  XE_RTP_ACTIONS(WHITELIST(CSBE_DEBUG_STATUS(RENDER_RING_BASE), 0))
> 	},
>-	{ XE_RTP_NAME("oa_reg_render"),
>-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, XE_RTP_END_VERSION_UNDEFINED),
>-		       ENGINE_CLASS(RENDER)),
>-	  XE_RTP_ACTIONS(WHITELIST(OAG_MMIOTRIGGER,
>-				   RING_FORCE_TO_NONPRIV_ACCESS_RW),
>-			 WHITELIST(OAG_OASTATUS,
>-				   RING_FORCE_TO_NONPRIV_ACCESS_RD),
>-			 WHITELIST(OAG_OAHEADPTR,
>-				   RING_FORCE_TO_NONPRIV_ACCESS_RD |
>-				   RING_FORCE_TO_NONPRIV_RANGE_4))
>-	},
>-	{ XE_RTP_NAME("oa_reg_compute"),
>-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, XE_RTP_END_VERSION_UNDEFINED),
>-		       ENGINE_CLASS(COMPUTE)),
>-	  XE_RTP_ACTIONS(WHITELIST(OAG_MMIOTRIGGER,
>-				   RING_FORCE_TO_NONPRIV_ACCESS_RW),
>-			 WHITELIST(OAG_OASTATUS,
>-				   RING_FORCE_TO_NONPRIV_ACCESS_RD),
>-			 WHITELIST(OAG_OAHEADPTR,
>-				   RING_FORCE_TO_NONPRIV_ACCESS_RD |
>-				   RING_FORCE_TO_NONPRIV_RANGE_4))
>-	},
> 	{ XE_RTP_NAME("14024997852"),
> 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3005), ENGINE_CLASS(RENDER)),
> 	  XE_RTP_ACTIONS(WHITELIST(FF_MODE,
>@@ -96,6 +74,25 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
> 			 WHITELIST(VFLSKPD,
> 				   RING_FORCE_TO_NONPRIV_ACCESS_RW))
> 	},
>+
>+#define WHITELIST_OA_MMIO_TRG(trg, status, head) \
>+	WHITELIST(trg, RING_FORCE_TO_NONPRIV_ACCESS_RW), \
>+	WHITELIST(status, RING_FORCE_TO_NONPRIV_ACCESS_RD), \
>+	WHITELIST(head, RING_FORCE_TO_NONPRIV_ACCESS_RD | RING_FORCE_TO_NONPRIV_RANGE_4)
>+
>+#define WHITELIST_OAG_MMIO_TRG \
>+	WHITELIST_OA_MMIO_TRG(OAG_MMIOTRIGGER, OAG_OASTATUS, OAG_OAHEADPTR)
>+
>+	{ XE_RTP_NAME("oag_mmio_trg_rcs"),
>+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, XE_RTP_END_VERSION_UNDEFINED),
>+		       ENGINE_CLASS(RENDER)),
>+	  XE_RTP_ACTIONS(WHITELIST_OAG_MMIO_TRG)
>+	},
>+	{ XE_RTP_NAME("oag_mmio_trg_ccs"),
>+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, XE_RTP_END_VERSION_UNDEFINED),
>+		       ENGINE_CLASS(COMPUTE)),
>+	  XE_RTP_ACTIONS(WHITELIST_OAG_MMIO_TRG)
>+	},
> };
>
> static void whitelist_apply_to_hwe(struct xe_hw_engine *hwe)
>-- 
>2.48.1
>

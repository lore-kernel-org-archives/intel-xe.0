Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C88CD6E48
	for <intel-xe@archiver.kernel.org>; Thu, 13 Nov 2025 12:47:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BD5510E056;
	Thu, 13 Nov 2025 12:47:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tdpk+y5F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EA3110E056
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Nov 2025 12:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763038027; x=1794574027;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=o4xfY1hZ7QuZzDflS9+1JzSfYx5GCd8BpY1BgIfxe+o=;
 b=Tdpk+y5FRviIHDovX3nOospnxdnstesBtJFkUYiMVnJs3Hnk+FtY+LEl
 Pz5IJSMnKBm+FHW0gC/fy3tuxLJivzaHCPGh7q9q3HeJ/+NNi1EBnUyYL
 uJ7yRJrF6MNjmIKBQpzWPxvaiUzTj9ExgaPCXshErDmZ3knKg0KFqSaC2
 bJGR682AqDEWs6BDG4sGj29f44/f/3joVDuGMoIVnKNBgdx8b16/Nisuq
 91LmMbuCiyVatvbJf2FaCpeSiu7MxSPXRoMULHEszlnIY+ljoWqVW/kT5
 xZNfCtv2ltywrit9/bl/bGfphNzNlysT/kF7H7XTWUynh3swnyoWOfUVU g==;
X-CSE-ConnectionGUID: R26WKldXRkuCJk5qfepajg==
X-CSE-MsgGUID: BVK5QL7JR1eVJ2a55G1qZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="64123034"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="64123034"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 04:47:07 -0800
X-CSE-ConnectionGUID: jlTBF/lMTk67F0hWI8Y05w==
X-CSE-MsgGUID: hmcRGYQ2RTmmboQxp0rfDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="194491811"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 04:47:07 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 04:47:06 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 13 Nov 2025 04:47:06 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.22) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 04:47:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hj40nlAYFJ6z1OFOBbxEvzycQ+OTu6m3XqjYfWGZOQ5mh6YadY/IfLPWJnfwYcp/4oS1hcxPm8ChxvPKuVYNgYS/2sxA2JFzzOqWYoqKLk2XGstsZv+u8wlOSxWnTuXnNbipUnP0z7ByKqMLmLglyaF0dwqc6vqyAXiY6Z1QtdJ+59XEFHAITen66WOebCaiojqkKyOg9xVspBaCI1h09D23v9xH7LFPrZany1qqxWSgT83Il/PJ1gnyUCFWpk2/ZO4iVYh3xv8zl+Q8GTDzRhwkE0tSs8kVoovGPTXw1m92+gECapC5zyggBVrnkNnkxgg5Evh5OT6sUNi4/Wl6aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GyJoGxRM9C9mhcOZxdyYUbDjaU+awBUJLF7VqprnXy8=;
 b=eJsJZ4nfNc0qMDYwFlbvNlWz/SqH6eHLUJNWEqdDi2xKoh6BgO/Me6saZDbf/ILN+etO5/5jleCrXwtmYwKpXweqaU2dq5fMOVHdwa9sVtwbQIoJiH2cJ96Ltv1q+tYxfumT8m848m5+R86l0+mIeH3OqNUV3Q+3glGbmxuUdFey/Y8/LrBrePQfe7owE/ELQzto7XKi3FfV0/O9ox5woFU2S4REpmoFH8ShMgA8XDm954KTh0UMtaIVyBIYVbj0qRrR495XSz5l0eqygG9edWzT5hN5m7VstgUvEjFwJokUay+6ZTgMgvussVkh0HXruboVCU/oUYnxW4Cfi5Ndeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by IA1PR11MB8098.namprd11.prod.outlook.com (2603:10b6:208:44b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Thu, 13 Nov
 2025 12:47:04 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 12:47:04 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251110232017.1475869-40-matthew.d.roper@intel.com>
References: <20251110232017.1475869-32-matthew.d.roper@intel.com>
 <20251110232017.1475869-40-matthew.d.roper@intel.com>
Subject: Re: [PATCH v2 08/30] drm/xe/guc: Use scope-based cleanup
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Thu, 13 Nov 2025 09:46:47 -0300
Message-ID: <176303800763.3698.3441384462271096231@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: SJ0PR05CA0199.namprd05.prod.outlook.com
 (2603:10b6:a03:330::24) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|IA1PR11MB8098:EE_
X-MS-Office365-Filtering-Correlation-Id: 8833622b-af11-4d5e-1164-08de22b2bf2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YWRDNHVGNjlqeWE2ejlKeVo2VlBYdGdSajV2eTBoMjZrSWF3UVBYVEZpdE11?=
 =?utf-8?B?cHgrd1FFbkFLUnFjY2c4R3hWT0JxZGY2c1ZIdC95N04vaFlZdU1TdGk1N21k?=
 =?utf-8?B?UzhTZFZxcDdRanphSktidzB2QnFsbXNRZURscVJXU25hSmhCdklsWTN3VVFC?=
 =?utf-8?B?aUZMVGVKeW93OHdzR0Q4VmVUS0NBa1Rab3hESTFnejY2L0VQVWVqMHU2SkR4?=
 =?utf-8?B?T2w0M3JyeTFLRmFhYlR6TzgrN2Ird1hvd1duTEVOb3NzYzhFVmREZnJuZk1p?=
 =?utf-8?B?SEFIT0NLekhpY0JDbjZ2dGowV2IxRDZaaGtQUWo4MWIvV3hhUnlSdk5QTlZQ?=
 =?utf-8?B?cnR4RHBkbzYxMkN6V2hBUEhSSHRIeG1YVW4rRU1FVXFzRnc1N3VpWk4xYUZ4?=
 =?utf-8?B?QTdpWS96M2tnNWVjeWE4ZEFJdUdRNHRYVkNFZ2tXL2ZlTlVQNllJakpoSW5h?=
 =?utf-8?B?SlU3djdRcWsxUkNEcUxzRmJnY2V1eDlhME11dWhxU2Z0T2J2NnN3ZUpwS0Jw?=
 =?utf-8?B?eXI2ekEwaEJzZHhhaVhiV3I3QWp0MCtEWU9FcTlneStlazZGSlU4UVozTEh5?=
 =?utf-8?B?REVBNkowczRMM1lrMlNBcUNHd1dTUHNOUDg1MG1ETFBib2s1aDZpL2ZWTTVS?=
 =?utf-8?B?ME9RVkF2cGEreVFzRFlwS2U4cGIxeDdMa3lHbVVITGpjUUtSOTlsek9MYzZU?=
 =?utf-8?B?NUorcDI1Ykd3aUdFMm1aV3czbHRTQnBRTGsyb1JaaDA2M2hWeWdCQ3pNeERH?=
 =?utf-8?B?N0pnK2RFeCs5OGpTcU5SMDRrR0k1RWZPNG4yM0hqOFZ4dUd6MGFPSWUySWpr?=
 =?utf-8?B?M3dzQ0FiYlJjSXZEWllFR29oWnR5T1doQXFuYVFmQnVVeWJHVkRrY0dyYWlH?=
 =?utf-8?B?T3BwRkZIZTlMT0w4VEpTK1pMbllGQnlONzlLdXUrTkIya3hiZnZPSEVaZEE1?=
 =?utf-8?B?NDJsTGZweTNPOThNRFNyb1JwYWI0Z1RKNkdDVnpKeDlhU09pMDFFZjYzbThs?=
 =?utf-8?B?alczM1hOT2tya0hoL0xKSVVJQ2l6RXlRWXA3ZFkrdi9oV1d4M0d5TkhHRFNm?=
 =?utf-8?B?cU1wcldVMXZvOXNIZGkrNUlaSG5ZWUFqZXZzNG4xbEZwZ0k4VVNlWFpSRCtq?=
 =?utf-8?B?MnhTRUpZZlV0aGNFazkrdkxJaHhLcjRWekZvMXRiOTVCQUkxY0FCczRROVVO?=
 =?utf-8?B?TzdNcXpkMUpSNzhTdi94VytjOUFkUG9yemFBaTczaDZvM1EyNi9zL3NoNTZN?=
 =?utf-8?B?cURyMjUwZUxVZ3d1aWtDU3l0QnhLbCthVUhqZlMvTkdHYWk5NnJrZVdML0ky?=
 =?utf-8?B?ZXQ3ejlBZVFoUkMxUDJ5dkpPSFBaWnRobkw4NVUxNDllUkxEMlU1SWpHeUJW?=
 =?utf-8?B?b0VtaUVkSjBrQmEvUEZoNTgwMlJyajdUQkVvWlppdVptUmpZN0ZGMnRLQ09G?=
 =?utf-8?B?L3J5VVAxVEZmSG54ZTE4R2NCdk9aZXFYK1E1eFpQR0lvdjN5L0RxcDB6ZzhN?=
 =?utf-8?B?WUphcFlNZGlRK29PYjdhMzlwank1QjQwVVlxRkkzMzVrd04yLzZIY05FVWo0?=
 =?utf-8?B?TmM3K3lkcm9ZbzJ6NEZ3K0R6THJaZnRnQTZOVHVDdFN6UTZETEx0dzMvUXkz?=
 =?utf-8?B?Z2NVaUNpMkw0anI4d1BvSmNWYXZLRjh1SWFpTTF3YW9HY2xhMUE5TUtORzBI?=
 =?utf-8?B?dWNmNjZLVElCQkZiamo4bzlYa2trdHlrbFlMR21jOVNScmJBMU9uS0gwOXZV?=
 =?utf-8?B?UTdGa0xZZXVXM1ZMa0s1eHJzZ2h4ci9abVlHMzR6Wk95MENuRVgybHF4QWRS?=
 =?utf-8?B?aG16Yi94Tjc4MzRXUFQ2TEpxNVVHUHF6cURMTFc1djNRUHNhRWdXa3B6YzZF?=
 =?utf-8?B?K3d1ZW5DRlZ3dWU4QnYrdzVEL3RvbS8yeEJma3NTUDNLckdyK0FkMzZCNWFJ?=
 =?utf-8?Q?diI615UQIhgWW/2nNE0RUMxZNYbyCpms?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFhlTEtqbU1KMDlhVW8wYjdqSEtkMDhNOWsyV05hRlpJMDdLcGYvc3VlUzRn?=
 =?utf-8?B?Y1l5OWpoS2hsMWRxbVJ4T0p6TUtWV1I4R0tBNTZTUDY5S0FVaG9VQjIyeUVD?=
 =?utf-8?B?V2htOC90ZFNHOWU3Y3JRZ0VGY0xtUFFmd25QMDhxS2ltRkhsYkdhMCtBaEpI?=
 =?utf-8?B?eUdEczNJckREd0xJVDUrdStFdHhaUTN0TEltcXI1QXM3d0J0dTBSZXRwSVdh?=
 =?utf-8?B?MjYvNUVGNFdRWEJXdXN5UlVRYnBkY2g1bGpGN2N5SmJVYVJWNzYzYytHNjdB?=
 =?utf-8?B?QVhoSWIvYjRCMzJCMWlZM0ZXK25BditBU3BwSjJkYW1BZEI1emNtSTJzMmZv?=
 =?utf-8?B?Szl3RDNkRjJlb3l5N1pNTFFZNnRMbW1DMmljeHI1bGJIMmJQVk5sZ0dsMDM3?=
 =?utf-8?B?d244Ty9oN1hZUVFneUNTRFVSRFpLRHByVzN0UXRTYVdudVhacjlIYnJRQ3hO?=
 =?utf-8?B?UUw1VjVJRXNqdFdYZXZhWjVFUGZqbWtBcURwRkNXZENaWWY4V0p6Z3dma0Vp?=
 =?utf-8?B?MVIvWldlei92SlZEVGtwRC96NG16aGJlZG9XRmJNc052SlV1c0xoK2N0eWg0?=
 =?utf-8?B?NlFRWDYvckNZR2MwMVduc0hDZWE4dWNEZW42b0I5ZUxIbC82MU53VGF5clRH?=
 =?utf-8?B?QkdMK0R2VHRJZldQQm1JaTRSNTZlMGlKclJiMGtLOWR0UzQramtEWm44SkRi?=
 =?utf-8?B?TTBjZ3RvNS9CWlhndGo0S0JlSEdpSzJjMUJSK2RWOVNlTXo5d0pwamN0M0Va?=
 =?utf-8?B?T2RveGNHVTQ4RzU2dklyNmpNRkZ4WkpZNDYvZnlFNmxyZEZ0cUtLaUVwdDQ2?=
 =?utf-8?B?cnNoQW83MjVIT2ZUZGtRNC91T3p3Y0RXNUpPM1g1ODZuZDlockhzT2pSbzZt?=
 =?utf-8?B?OVBpaFdvZWFjbFRtazJIeUNJS3Y5SzV0WFRtVVozcWY4SzFoZlFkN05OQzRG?=
 =?utf-8?B?ajhmMm1acE9pL0tYeWJiZ0tqNzhyTjBxSVlBT3BYendJaHhyK1Vhck5uYXhY?=
 =?utf-8?B?ampDSTN2dUFuc25jNVIwUjY3Z2ZQYjg4L3JmRlpOQnd1bHpoRXhnVVFGdzhN?=
 =?utf-8?B?aGkyTjJOM25MOVBPT3VJcVB4VDNGNVAvVjJFS1ZXdnRCd1JySUV4cG9KS1hz?=
 =?utf-8?B?KzRqSzRXOUVqb1BaMW1pWGw5S21MSmd4cjhUTHRjbm05U2NwOXVjTklaMFFG?=
 =?utf-8?B?VFFqd3h4Q3NwdXd2eTFRenF3ZzhCSzdiQitjRVJ4MWFneEt3MmhDd3FXV0NS?=
 =?utf-8?B?VmgzTW5GcGlOaUVVa2Mra1ZmOVlTSXIya0dDNFBzOUdhd2x1WGtnSWF4Y1BP?=
 =?utf-8?B?MTB0WVdjR3dtRFRTU2ZPbDdVa2gyYUZ6eGYzM0hFMWRVMXErSHZsRHJxazdI?=
 =?utf-8?B?QXVzVHlNbVgwSGhNazM3bzhxV2FFTVVWN3BWbUIrUk4xTjhTTi9SZ2hEQVRR?=
 =?utf-8?B?Si9McGZERnd2MlRRYVhSSk1Kek9MYXNuM3l4WkQyUUFlWGlUY3ZSeStQRHRH?=
 =?utf-8?B?dWFvT3RUVzBzNXBKYlZ1SUNVbEZaektCUExvcit6bG5iMUZxLzZwSzFFMndM?=
 =?utf-8?B?c3hBbVFVZHlUazhnOVFzNmFRYmRhdHVlSEN2dGFra0pOeGl2WEt3aDEweVNV?=
 =?utf-8?B?YjNkMFZ2UEtxMXNmU3dEbzdZNWU0eVlZSU9adURMczRDWFVybDA1aHR4UEpJ?=
 =?utf-8?B?OStVNXBiVTlsRHNtWDhZZHFrUFBBWUlZTjMzVDJITG1SekRtanJlY1kzZU12?=
 =?utf-8?B?OG1nL2pnY2lTM1ZCV3R3ekRjdVJMc2poTUsrVG42SVkzaVJydXF6OGpzNmFW?=
 =?utf-8?B?ZmZvVUdaZjhlOUFNekIxMnFYbkJwTW9DU2w5YW84RURTT0NFczRKamtCNWtk?=
 =?utf-8?B?Wm1tSEQ1eXk3NVJnSlltVXhPcEFBc3hGaE9hbnIrQ2xIT1dIcmlDNm9US1ZO?=
 =?utf-8?B?emV6L3psZktndkFQaUxwNVMwMytPUnJPOGdTR2d1Rk81QWpiZUJ1ajVlRjJ0?=
 =?utf-8?B?RzZzb1BDZFlSa0hYR3pFd0Fpam9wc3h6TXJ4dnJ6eUVkQnlLWFlnUDhTRTBq?=
 =?utf-8?B?UnhwUURpbWM0RWdaK1F2RllnUE1FaE10QWx3V2tMUlh6eFI3aGJwT3RiVWI5?=
 =?utf-8?B?bWFVbkZWSzltalR1Q3dFRVF5THZ0V244dGFod0NXNGw3c084T0pmSnh1dEtZ?=
 =?utf-8?B?R3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8833622b-af11-4d5e-1164-08de22b2bf2d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 12:47:04.3118 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qwIqFPF4Ama1d/TE96X8axewzxv7OoqHkCGivsBHYR8F0h64aa5/pP+DkJ+qtD+QNRf+FF17MOLlzZ3NEi55ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8098
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

Quoting Matt Roper (2025-11-10 20:20:26-03:00)
>Use scope-based cleanup for forcewake and runtime PM.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/xe_guc.c           | 13 ++++---------
> drivers/gpu/drm/xe/xe_guc_log.c       | 10 ++++------
> drivers/gpu/drm/xe/xe_guc_submit.c    | 11 +++--------
> drivers/gpu/drm/xe/xe_guc_tlb_inval.c |  4 +---
> 4 files changed, 12 insertions(+), 26 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>index ecc3e091b89e..e47292b2aab0 100644
>--- a/drivers/gpu/drm/xe/xe_guc.c
>+++ b/drivers/gpu/drm/xe/xe_guc.c
>@@ -658,11 +658,9 @@ static void guc_fini_hw(void *arg)
> {
>         struct xe_guc *guc =3D arg;
>         struct xe_gt *gt =3D guc_to_gt(guc);
>-        unsigned int fw_ref;
>=20
>-        fw_ref =3D xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>-        xe_uc_sanitize_reset(&guc_to_gt(guc)->uc);
>-        xe_force_wake_put(gt_to_fw(gt), fw_ref);
>+        xe_with_force_wake(fw_ref, gt_to_fw(gt), XE_FORCEWAKE_ALL)
>+                xe_uc_sanitize_reset(&guc_to_gt(guc)->uc);
>=20
>         guc_g2g_fini(guc);
> }
>@@ -1610,15 +1608,14 @@ int xe_guc_start(struct xe_guc *guc)
> void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
> {
>         struct xe_gt *gt =3D guc_to_gt(guc);
>-        unsigned int fw_ref;
>         u32 status;
>         int i;
>=20
>         xe_uc_fw_print(&guc->fw, p);
>=20
>         if (!IS_SRIOV_VF(gt_to_xe(gt))) {
>-                fw_ref =3D xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>-                if (!fw_ref)
>+                CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
>+                if (!fw_ref.domains)
>                         return;
>=20
>                 status =3D xe_mmio_read32(&gt->mmio, GUC_STATUS);
>@@ -1638,8 +1635,6 @@ void xe_guc_print_info(struct xe_guc *guc, struct dr=
m_printer *p)
>                         drm_printf(p, "\t%2d: \t0x%x\n",
>                                    i, xe_mmio_read32(&gt->mmio, SOFT_SCRA=
TCH(i)));
>                 }
>-
>-                xe_force_wake_put(gt_to_fw(gt), fw_ref);
>         }
>=20
>         drm_puts(p, "\n");
>diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_l=
og.c
>index c01ccb35dc75..0c704a11078a 100644
>--- a/drivers/gpu/drm/xe/xe_guc_log.c
>+++ b/drivers/gpu/drm/xe/xe_guc_log.c
>@@ -145,7 +145,6 @@ struct xe_guc_log_snapshot *xe_guc_log_snapshot_captur=
e(struct xe_guc_log *log,
>         struct xe_device *xe =3D log_to_xe(log);
>         struct xe_guc *guc =3D log_to_guc(log);
>         struct xe_gt *gt =3D log_to_gt(log);
>-        unsigned int fw_ref;
>         size_t remain;
>         int i;
>=20
>@@ -165,13 +164,12 @@ struct xe_guc_log_snapshot *xe_guc_log_snapshot_capt=
ure(struct xe_guc_log *log,
>                 remain -=3D size;
>         }
>=20
>-        fw_ref =3D xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>-        if (!fw_ref) {
>+        CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
>+        if (!fw_ref.domains)
>                 snapshot->stamp =3D ~0ULL;
>-        } else {
>+        else
>                 snapshot->stamp =3D xe_mmio_read64_2x32(&gt->mmio, GUC_PM=
TIMESTAMP_LO);
>-                xe_force_wake_put(gt_to_fw(gt), fw_ref);
>-        }
>+
>         snapshot->ktime =3D ktime_get_boottime_ns();
>         snapshot->level =3D log->level;
>         snapshot->ver_found =3D guc->fw.versions.found[XE_UC_FW_VER_RELEA=
SE];
>diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_gu=
c_submit.c
>index d4ffdb71ef3d..7e0882074a99 100644
>--- a/drivers/gpu/drm/xe/xe_guc_submit.c
>+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>@@ -1225,7 +1225,6 @@ guc_exec_queue_timedout_job(struct drm_sched_job *dr=
m_job)
>         struct xe_guc *guc =3D exec_queue_to_guc(q);
>         const char *process_name =3D "no process";
>         struct xe_device *xe =3D guc_to_xe(guc);
>-        unsigned int fw_ref;
>         int err =3D -ETIME;
>         pid_t pid =3D -1;
>         int i =3D 0;
>@@ -1258,13 +1257,11 @@ guc_exec_queue_timedout_job(struct drm_sched_job *=
drm_job)
>         if (!exec_queue_killed(q) && !xe->devcoredump.captured &&
>             !xe_guc_capture_get_matching_and_lock(q)) {
>                 /* take force wake before engine register manual capture =
*/
>-                fw_ref =3D xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAK=
E_ALL);
>-                if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_AL=
L))
>+                CLASS(xe_force_wake, fw_ref)(gt_to_fw(q->gt), XE_FORCEWAK=
E_ALL);
>+                if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORC=
EWAKE_ALL))
>                         xe_gt_info(q->gt, "failed to get forcewake for co=
redump capture\n");
>=20
>                 xe_engine_snapshot_capture_for_queue(q);
>-
>-                xe_force_wake_put(gt_to_fw(q->gt), fw_ref);
>         }
>=20
>         /*
>@@ -1455,7 +1452,7 @@ static void __guc_exec_queue_destroy_async(struct wo=
rk_struct *w)
>         struct xe_exec_queue *q =3D ge->q;
>         struct xe_guc *guc =3D exec_queue_to_guc(q);
>=20
>-        xe_pm_runtime_get(guc_to_xe(guc));
>+        guard(xe_pm_runtime)(guc_to_xe(guc));
>         trace_xe_exec_queue_destroy(q);
>=20
>         if (xe_exec_queue_is_lr(q))
>@@ -1464,8 +1461,6 @@ static void __guc_exec_queue_destroy_async(struct wo=
rk_struct *w)
>         cancel_delayed_work_sync(&ge->sched.base.work_tdr);
>=20
>         xe_exec_queue_fini(q);
>-
>-        xe_pm_runtime_put(guc_to_xe(guc));
> }
>=20
> static void guc_exec_queue_destroy_async(struct xe_exec_queue *q)
>diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe=
_guc_tlb_inval.c
>index a80175c7c478..848d3493df10 100644
>--- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
>+++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
>@@ -71,12 +71,11 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inval *tl=
b_inval, u32 seqno)
>                 return send_tlb_inval(guc, action, ARRAY_SIZE(action));
>         } else if (xe_device_uc_enabled(xe) && !xe_device_wedged(xe)) {
>                 struct xe_mmio *mmio =3D &gt->mmio;
>-                unsigned int fw_ref;
>=20
>                 if (IS_SRIOV_VF(xe))
>                         return -ECANCELED;
>=20
>-                fw_ref =3D xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>+                CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
>                 if (xe->info.platform =3D=3D XE_PVC || GRAPHICS_VER(xe) >=
=3D 20) {
>                         xe_mmio_write32(mmio, PVC_GUC_TLB_INV_DESC1,
>                                         PVC_GUC_TLB_INV_DESC1_INVALIDATE)=
;
>@@ -86,7 +85,6 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inval *tlb_=
inval, u32 seqno)
>                         xe_mmio_write32(mmio, GUC_TLB_INV_CR,
>                                         GUC_TLB_INV_CR_INVALIDATE);
>                 }
>-                xe_force_wake_put(gt_to_fw(gt), fw_ref);
>         }
>=20
>         return -ECANCELED;
>--=20
>2.51.1
>

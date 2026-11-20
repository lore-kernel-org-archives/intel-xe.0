Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02B2606A325
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 07:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XAQcTkg9;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=AanY4G16
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 524DB10E1FA;
	Fri, 20 Nov 2026 07:29:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5058610E1FA
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 07:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795159776; x=1826695776;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=W5g+E5Z2vn2Bob3Ofn11Kq/amsPGdLHBXBsn4DobQro=;
 b=XAQcTkg9fWrjObRIrBCTDccAy+pu/IEwgDffwoeSuCLSHq5AABwCBWtp
 nDkQGy07Ia1ElR6NoFWBRqwvEIRTne2/RxoJbrDckZExQZ3dAJILoFJkZ
 94Sp1P061HyqpiP3IWZQF4gq8XpV1BddnFyz8lldZajdMRzzP0Ad9p0r1
 XADW+j2xhhKxW6N4lL4DNcYMFJ16bP85loZnhp6M6vVcDt+lMuTyOoCSZ
 4t5Tl0TrCyIByjU1q8XGphJbUfnSSIw5dr+3sxr6zha11whxb4v+n9pb/
 guK7PteKQDOvOT5o0jrVrDdmnFyll94Bz+14zQZyUltP+iU633a7QNxXe w==;
X-CSE-ConnectionGUID: NT6cEZeNS8uujQJ2ORftug==
X-CSE-MsgGUID: ZrcU1uJbQK2hWpxB7V2k0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3919377"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="3919377"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 23:29:35 -0800
X-CSE-ConnectionGUID: lyxOCX2eRJGIiaxmj/BI8A==
X-CSE-MsgGUID: NrDs5SmiR1OVa3OJukRLYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; d="scan'208";a="12349832"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 23:29:35 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 23:29:34 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 23:29:34 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.50) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 23:29:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=beiqRWQbAs/ElX7DDtEkx2E1+qB6bLWgjSNGbvrCxAEny38xUd7U27OJij72uspRhb4PHSaZpVR1NUY4GNLJ35B1DlMDSNI3FGXN9zXFmccduF0l+VAqytDRLhoFe7fvdw1qJIt37DiG/4MFQqaYysxgZ3212BEx+CZDtviokm3WpcY1R/sYm79ZchmxfA9ZtF16gxnXEx3vd0WjP5mu3mecLwwvJriJo1axBJrFtmF9LgNKqRQgap3+C5cUNBbIIJYeFouM2bzrJ1JLdLsHoHypDqIknsHAYPBj2FVXx+DjC/opOtmEi2kEbDZs5ZAI6pXAQR1vRuXjdr8xk0evrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lTGfP0E7/NSr9gCkh9b+Tozv6Cb1CU6cyhql1twM7Yo=;
 b=GqiJzKbsRUsddVocta0nf+WyLIvEGcuc7LQjx5LrRUhq2xRE4KdGCCTZOhNqTqqEBbS+/54sDX9htfG3gZPtpiMZM0jgh3Pu4g5DBdVDvgzXC2TpPnQ7hA2xja/2u8UHer/ZI/GAeuOjVBCsM/GTWP1uQF9QOJAJW7S7YjiTRFUY7bBPA1Ci1njG+E/IEPewtjSB5v0LWkifJBMAuNzyj9nz3HEjoEUQnZb7+7yReZCwAY4qDqU8tTNvBYIrxYxUbBEF0w221WBLZEBAbqkwmZIDY+tLrBzAlIQcUgvKSBAB/95ySV7fxPs5ZrTlwrROkV+QzRwGLGGipqCbIlJ6AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lTGfP0E7/NSr9gCkh9b+Tozv6Cb1CU6cyhql1twM7Yo=;
 b=AanY4G16pS4rH8L5F+gjIN9oqW69ytPSX5uScBWV8WmrWbife+aVB4JMgOZsCKvI7amUPZ8mgqs+LbNWXIbqojpAUSVlCD4TTYrJIqRq9b9ARLeu/dI72q5Jd/fCzjfRBiesZx1tBK0kVLOOGAXvCv6hDDEsPiD148sWFF7pP/Y=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9205.namprd11.prod.outlook.com (2603:10b6:208:573::7)
 by DM3PPFB0F355549.namprd11.prod.outlook.com (2603:10b6:f:fc00::f45)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 07:29:32 +0000
Received: from IA3PR11MB9205.namprd11.prod.outlook.com
 ([fe80::7a6a:5bf7:f1d9:dbe]) by IA3PR11MB9205.namprd11.prod.outlook.com
 ([fe80::7a6a:5bf7:f1d9:dbe%5]) with mapi id 15.21.0615.013; Fri, 20 Nov 2026
 07:29:31 +0000
Message-ID: <baec49d9-5e48-432b-baa2-f03723c08bd3@intel.com>
Date: Fri, 20 Nov 2026 12:59:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 7/8] drm/xe/oa: Free the OA buffer and the stream after
 the stream destroy
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <intel-xe@lists.freedesktop.org>, <harish.chegondi@intel.com>
CC: <matthew.brost@intel.com>
References: <20261119002737.3899877-10-umesh.nerlige.ramappa@intel.com>
 <20261119002737.3899877-17-umesh.nerlige.ramappa@intel.com>
Content-Language: en-US
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
In-Reply-To: <20261119002737.3899877-17-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0176.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::11) To IA3PR11MB9205.namprd11.prod.outlook.com
 (2603:10b6:208:573::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9205:EE_|DM3PPFB0F355549:EE_
X-MS-Office365-Filtering-Correlation-Id: 767f2c72-729d-4e90-ca4c-08df46d804a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|10067099003|4143699003|11063799006|56012099006|261021123027099003|261021121427099003|261009223027099003|261102123227099003|261022105027099003|261022113327099003|261026140227099003|261026121527099003|261028144727099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: ac/ndDluAMe+QbnFyfVVLZaLPF3//aD2IU2B4IpEneAoi00LVR5u1SWFhpx9gIe00ei+n/P2lhP9DQ5fNAnQmKxc90kwGPC5KsIXlRLm75+y2DZj0z9CVL0CPMf5M+JYAl01GMEpDhiQtTepUmbRbliN+Ab2fVI2+qN3TTYUiqRKS693pZXS7N8ivQyQq6tgqga0IYjYqRt3xzSH+pH2lFgv7ATYPWYlgC0tHVMvto5a6AB1N2hEbwAJjRxp52mZoeWM14JX38Iludeq9aDFqHk5icePjetDTaIJE2pF5SF7b/qgH/Byd6aUq/fVPVbTVPDF43SrrXEqvco9lmE3uAG3q/f0ngmzsJC02sXUuOGsjUtBMJ/VYh9U9uH2diobWyB9znqxQ1MGw2JVs1vOhLbJqT2oyeuwCgNMVB8egjH5LWSSIBKVk6i4qwlv4zosPzPMk//UlbkmcQCT31zl28aaNCMq24j5A7tHFb3qfoYLa7qhhubXRsGw/PETkWikFEhFyO4GeDNoy6RYgFRKEohnYYCG+T0e5du9w8R7yxF0COrs7g5NwrGa/E0cR9Ifv6olxj7ZGCN1nO7Y8KpMkz6TFsM6yVZOq4ao+cQ07OZbXfvRW3uBsaBRww30+m794S7QzAtc0ub3aL/tv2DyJddAabQ0LYz6sFdpGAW/FMo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9205.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(4143699003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003)(261022105027099003)(261022113327099003)(261026140227099003)(261026121527099003)(261028144727099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2NjdnZpUGNtSFdQM0FJajhVNmNGcXI3TDJ0YUNLSkdud1JJekM0NWZ3M3gx?=
 =?utf-8?B?T0lLdXAwVHpMRGJsV1ZhMlloczA2d3FCeUsya2ozYnppOVRtZUJkcmMrTFBS?=
 =?utf-8?B?ZzhCNjA0S0l3blgxdE1yYUwwVXlnWkt6NU9JdWZNbWxoa1VuRlZIeU1samgx?=
 =?utf-8?B?MldDRVRTMjkzSzRPNUpFS08yMGNJWDBFSE1xM2VIYUsrZlVlOE5ubk9UdVcv?=
 =?utf-8?B?Rk1IKzRZSGJGSWJDTXhYdStYcWhjWUdTUEREbHlrSytDR2M2QTBFTjFGcXk2?=
 =?utf-8?B?SWRPUXFaY2xxL0t3M01lQzRiTjM4dCtieENGYXJVRVdzRTZ0K2dEYVE3YnQx?=
 =?utf-8?B?d3dpNFVHU1FHZ3gxZjMrTXdGdFA2SFFlNnorMDgxaFVlNzY1MGFGemE0ZWNR?=
 =?utf-8?B?Y1dKWG9zc0Q5MTJPSzBXVG5pZjNuZmlqT1FmWVZpT2N5NktUMzhwSnJ2dDZQ?=
 =?utf-8?B?aVh5Rzc4QkM5MkQxTi9kTGllcVpKejNaeTI2YmxnNzZuaU9xMjA3TFNKRnBx?=
 =?utf-8?B?K05EOWhxZWNLdVFRTWE0R1luZDRLODVwUDg0T1QwVkFyUXp1REpnL3NVeWxx?=
 =?utf-8?B?ODJ2dFNCdk1NMG1qcExiYlU4TjR0eUZnSjZybTY0VUttSWtFUnJINHUwai9W?=
 =?utf-8?B?WTBQa1FGU1hZMXdTa0hRZkY1emV5SEJVVUtUWHhZbTQra2RuT3J5RGQwSCtO?=
 =?utf-8?B?SFdzc0FiYWZlWVB2eGlXSUlKUTFFS0NSbGMvR25ML0RHMmVhbllKUzJZbjEr?=
 =?utf-8?B?Q2cyY0V4eFlaL0dYVVMxbU5ScGhDQk9IL01mYmQ0dm9oMXZmbHpDQTcrUTN3?=
 =?utf-8?B?Y0hYdGZwL3k4aXBKMmRNWDYrWEUxdDNHcXEwZDVaQVRtNFV0d0dRV0RhMGdY?=
 =?utf-8?B?dWo0SmlNeWVmNUcvUlpHVGxub1RPOTZqbkxObzJudnZyeXNhZ0ViNGpIT3Mx?=
 =?utf-8?B?Y0JVT1VRN1JtczJmci9TQXdYQ0QxQUd3K3ZGT3pYZ0JHNzZMYm5Kd3JyTjNC?=
 =?utf-8?B?b0ZtWG1tbk11d0xRTTRaVkhzSzU0S0lhSlM5OUhvK0NhOUt1S01RWFBVNm41?=
 =?utf-8?B?NUxRL09jYkw1SU41eFJTQ1Y2WkV6bUV3MUNCeWFKYzduM1o3azA3QzBDQXhR?=
 =?utf-8?B?VVlzMDNzRW95cUVWbFJpb3Z6MS9jOGtGQVpuZ1JCK3IwMHJHbnVGMWhYTkJI?=
 =?utf-8?B?QTdtd1hXWXZFZ1VwRW11VWVSalQwdlZPUjl5enRzWXFPRFd3M1l4WlB3aWxR?=
 =?utf-8?B?VTRWcWtuN2IwV2FQMDdIamlqMVNEUzQxNUdjdW91N0x1a1NqNVBVeTVWUWJ4?=
 =?utf-8?B?L3h1U2VRalJva3ZYZWN4RnovZVpub1Jkd25EYWlIa0dzSEFkMjdURVdoK2Yw?=
 =?utf-8?B?clVsMjVOaHRGS000dTlBZUNHSEtzZnBqdjdmajFKYjZuMmcrcmF6cUVwZWMr?=
 =?utf-8?B?c1g5d2VvYWF3dkpndlQ3dXVJMVpuYlVqNGZwZTkxakhHbDlFV1prMU1hUnN4?=
 =?utf-8?B?d0JEdFEzSmtGT0FVZG9JdFV0OXM4SXdSRi9XNjdVOU4yWG1yVkhNeldRbzRI?=
 =?utf-8?B?NUt6bmp0WGg0RFBJeEs4V0o0NVlnMHlRclMvR2lYYXRzTXlJcXNhaWJUZHAx?=
 =?utf-8?B?cVdDSUJYdGtJOWphVHJkSitxdXV0dmFiYm16dW5qbnEzRWdZTlVEUldidExy?=
 =?utf-8?B?Z3pnQUdabUU2TFZwWnRuQmFVanlVZGw5NEF4eFlCMnhQNmtZTnV6ZTZvdXZV?=
 =?utf-8?B?TW5LQm5JNnFEMGp1cGhmSmRLNXdLK0ZVN0pqYmIwcWNLTnFkWUdkNStnUzZY?=
 =?utf-8?B?dm5IY0Q0bzBleXpJRWFCczdjajdJazB3aXdMaXZneHhGanQ1VFJ4K1ZscVQr?=
 =?utf-8?B?YUREck5QOGRmTmFrS0hXVGtOZ2U4Yi92bjZWc1kvRWYya1Q3d0tub3dkMTlw?=
 =?utf-8?B?djF2TU93RDNnUStHRmphMDE3amw0emFseEl5WEQ5MHdvak04U0UrcDBxOTYw?=
 =?utf-8?B?ZHIvQmRKdUtTbXUveitnTGhUeUtSajg5eENRcnBZZmlHaWd5ZDdNcmpsRVpo?=
 =?utf-8?B?WnVpMklhLy9vMzlydzU3a2RhSlRMa3NGbUJ0bVBVTE43c2NDUENjQi9iVSsr?=
 =?utf-8?B?M2FOMjg3RXhxTzhhaUhyZG8rdmZYSkY1OG51enZYcTVDMWxqYnVRL2VNaDhT?=
 =?utf-8?B?RG9KV3ZEdmoxQ2lveUJNLzF2dHZCUHNXbnJUQ0w4cUxRVGFkeXJPRzZlQnhm?=
 =?utf-8?B?U1dtSThadWZ2UTVqYjY0dmVuMmwwdDJvVDRDV0N1cG1MOXVsL0ZkM0x0MURn?=
 =?utf-8?B?YnlDSi9BWlgzTktEbFlEamR1VGdkL2dWYVZxV2lVMXUrVWt4anliUT09?=
X-Exchange-RoutingPolicyChecked: UxMQNWZCAJOWUaEvtBCPgJB//DLMjJ8jvqC871nfbCMJeqK5L5gPiZmM0dIqHcLRM0lmmsa0GKqEngAFQv9U+bpWEYwEDi8oMoIpzlTEQqnKXiZfEngyWTtjKklusxHq0tVM7wk+EJ8SFeCPr786hhD+UyF0pyCpos3nmuelsDT4O37pEFjJaOO8ngMiTQ6XB5G0fTB2rVun/rSMmwO/T/whhYI4FGex6f8Sct6AWYq2MhyHS7m4IuFkRE6JusbcV1dnTm+PB8tfyTY4T1EMQVh5crzShiaElfv4yKalF4DSYzHu47NUmHT7Jphm+eWzuunooMYNZS1mUBtLafFNbw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 767f2c72-729d-4e90-ca4c-08df46d804a2
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 07:29:31.8343 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ka/0hoq6HRzPUO5ge4OfozI2V4mQDgUKHQMjqe3bGMPDQIYd62sDdKtPF3qiHw5N4uy8UlQ2E+GuusDrBShU+Fg5FFr9xnzkKzBWpVvTGIM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFB0F355549
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


On 11/19/2026 5:57, Umesh Nerlige Ramappa wrote:
> Free the OA buffer, destroy stream_lock and free the stream struct in
> the callers, xe_oa_release() and the stream open error path, after
> xe_oa_stream_destroy() and xe_oa_destroy_locked() have released the
> rest of the stream.
>
> This lets a following patch release the stream resources when the
> device goes away, while keeping the stream struct and the OA buffer,
> which an mmap may still reference, until the stream fd is released.
>
> The OA buffer is now freed after the runtime PM reference is dropped.
> Removing its GGTT node wakes the device if it is suspended by then.
>
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Patch looked fine to me, but Sashiko has reported something. Please have 
a look.

-shekhar

> ---
>   drivers/gpu/drm/xe/xe_oa.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index f3eceeb34e7b..223419347eb7 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -929,8 +929,6 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
>   
>   	WRITE_ONCE(u->exclusive_stream, NULL);
>   
> -	mutex_destroy(&stream->stream_lock);
> -
>   	xe_oa_stream_drain(stream);
>   
>   	if (stream->sample)
> @@ -939,8 +937,6 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
>   	xe_oa_disable_metric_set(stream);
>   	xe_exec_queue_put(stream->k_exec_q);
>   
> -	xe_oa_free_oa_buffer(stream);
> -
>   	xe_force_wake_put(gt_to_fw(gt), stream->fw_ref);
>   	xe_pm_runtime_put(stream->oa->xe);
>   
> @@ -1772,7 +1768,6 @@ static void xe_oa_destroy_locked(struct xe_oa_stream *stream)
>   
>   	drm_syncobj_put(stream->ufence_syncobj);
>   	xe_pm_runtime_put(gt_to_xe(stream->gt));
> -	kfree(stream);
>   }
>   
>   static int xe_oa_release(struct inode *inode, struct file *file)
> @@ -1784,6 +1779,10 @@ static int xe_oa_release(struct inode *inode, struct file *file)
>   	xe_oa_destroy_locked(stream);
>   	mutex_unlock(&gt->oa.gt_lock);
>   
> +	xe_oa_free_oa_buffer(stream);
> +	mutex_destroy(&stream->stream_lock);
> +	kfree(stream);
> +
>   	/* Release the reference the OA stream kept on the driver */
>   	drm_dev_put(&gt_to_xe(gt)->drm);
>   
> @@ -2052,6 +2051,8 @@ static int xe_oa_stream_open_ioctl_locked(struct xe_oa *oa,
>   		xe_oa_disable_locked(stream);
>   err_destroy:
>   	xe_oa_stream_destroy(stream);
> +	xe_oa_free_oa_buffer(stream);
> +	mutex_destroy(&stream->stream_lock);
>   err_free:
>   	kfree(stream);
>   err_syncobj:

-- 
Shekhar Chauhan
Linux Graphics Software Engineer
Linux Platform Enabling
Intel Corporation


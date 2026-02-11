Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE60EB5945
	for <intel-xe@archiver.kernel.org>; Wed, 11 Feb 2026 00:02:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C7D910E062;
	Wed, 11 Feb 2026 00:02:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e17ghfXe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA39610E062
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Feb 2026 00:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770768144; x=1802304144;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=wdx5U5GKEoW4lKpCk6sB9tv89pjo6M5n/zFhONoFrPw=;
 b=e17ghfXefp3zb3U8cwUfldhXMmL98BaWPsPNSxp8CVqdEuIW91zM9gf0
 rqRv5Oj1Y/jQyD9kWvEESledTnkMMVWvOpEXkyampqZ+01EBc0losd+tY
 hN8S/OpOOX5jx2x8aXWjpjOe47EolOnTYOV7jrn6GJyDfeRdzZeKcwgA1
 /Sa0B0r8xCLF5nrF9YKst7jbSPTHC9BQ+/fhY18bDUPpNyZW2t/AMdTFi
 ArajhVSMq7uIDx0lVY0S1jMtqUtjj9kyNB1Pq7Qk1LGmecuFMuktS770c
 Hb6VyjsUb4jwZym1w4bf9eBWjWsPAhca+ZLwpsY4ts/0KQFMRHwSNExXV A==;
X-CSE-ConnectionGUID: o7CyfzfEQcmBxt7HSQFa1w==
X-CSE-MsgGUID: rfA5mfd5SMSeQfcDGzlI3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71808327"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="71808327"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 16:02:23 -0800
X-CSE-ConnectionGUID: 9n2L3M+SRWCYSfHm3CvGZg==
X-CSE-MsgGUID: adGagBrhQ2qosUJ0wg66sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="216391101"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 16:02:23 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 16:02:22 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 10 Feb 2026 16:02:22 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.26)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 16:02:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rS7EiHl95fNKO9ZakUeNeRYETxVBFSZSnTfUtRk+meoWoA4HiRxzwQJP95lumJK1Y/K0RXp0irTc+jhfs8o/na+w6yJaXf+44LETJJRBig3UVPLdaZQdBI+LozBWVoCTtAhOWKPhB/HsfAZN1rl+Im6UFyHktwwZknKXfK5eVSj59Z/l22YEKO47cmk9sh4TQJR2ZONhWSUaAiyOlp0+HDNlHY5Nbe9Xe7IbZuo+orOG94xyphqWOFU4B1K+BfFw3ulAfpyKRi0vs9hcD0cbVDag8SfumbNXaSa1+bZne2s74QGvpxoLuRxn4ifTBhazEVDVxK4b8nDtHsHpwJ1j3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4fRLnNaMZfbmaoK7oXDna1/OJnBsVjQdZLhW1Kqt+9o=;
 b=Xb51q1sUz5RqbR1SxUqyEXf0DPhOB67aFxTS3+8lQaPQFRTdXxch7Wh9RwNcCXIcWZOtH83HtuXMreTqIVrkvQye2Z0DJbxvY0twuZBASNd5FIaspV/OI4w4Pi/rEZBv/mrnBQhJnE3wDDcB0HtKX+jnw5XDrsWSrAuIK8l66vxWqQRr9T+uvl9xU7fN5rR8T9FzhkEt/Tpxdr9YfhdGCboYuREwSkbmz0MuvyeqdZm7Sf/tJuAYTRturconjymDcl32mqv0d4aqMcPNqHAZIa4eg/Zd+ahRHYL2uD+RF1gfZaaJEZstKBrNriw/IwGK0kZNfQSMzB1X7qhaqPva6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Wed, 11 Feb
 2026 00:02:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 00:02:20 +0000
Date: Tue, 10 Feb 2026 16:02:17 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 <intel-xe@lists.freedesktop.org>, <matthew.auld@intel.com>,
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 1/3] drm/xe/xe3p_lpg: flush userptr/shrinker bo
 cachelines manually
Message-ID: <aYvHCeTd5pOFo2p5@lstrano-desk.jf.intel.com>
References: <20260210125120.1329411-5-tejas.upadhyay@intel.com>
 <20260210125120.1329411-6-tejas.upadhyay@intel.com>
 <20260210210525.GC4694@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260210210525.GC4694@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: MW4PR04CA0180.namprd04.prod.outlook.com
 (2603:10b6:303:85::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN0PR11MB6135:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ed0c8f5-60ea-40ad-5d78-08de6900d35a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R1g1cDY3Zm5PbnZlN2pHNTFHMWkzN3h0S1FqT3M3Qk1CMzZqZlJxZjBJVko0?=
 =?utf-8?B?eFo2b1ArZVJoanE4aVdYdjFLVEFWaHgrZmIyVFlRNE1jVzZ5Y2pjRlVKUCtN?=
 =?utf-8?B?ZTBIbVpjT1ltUHFLRmg3c1B3aEVpTE1UN3FIU1cvc0xqYWE4RWpYZ3NBUWFr?=
 =?utf-8?B?eSs0WU5oRFY2dGs5TElrdFdZcHBFSkp3alFocVhrb2V0VmQxSHJaMGFGSE9D?=
 =?utf-8?B?bE54emppUkduOFc0K2h3YzVMMmNjcEdUN3NkaDJ2Vm1rcmFwOEZGUmRmb3dr?=
 =?utf-8?B?aXNDTkRuNFF3RXlhQTdrTTl4ZmhyQitocnI5UWFkYnNMV2FYTlQzOUh3SFp1?=
 =?utf-8?B?VnJDcWt2aHMrWUlXeGdtOUp2eHZ6SXJoNW5KQVN5Q2hYb1Ezakd0RXErcWI4?=
 =?utf-8?B?eG45dEdNRmNRY285cE9PVExUYlpMTkJDZ0oycnl6V3lESnRkNHc1NzlIb3RJ?=
 =?utf-8?B?bUdVNHpkMXV6aGFuR0ZlMG5hYUtueEFFU2xuejRtQkRLcjhPR213SXJXUkFE?=
 =?utf-8?B?S2ltWEY4ckVVZkNvNVJ4WVowNkNPS2FZc3BjWlpQRk1BY2FJYS9pVVZ6T0Vj?=
 =?utf-8?B?TUwzaUdLMVdJK2Z4dzJ5VEVwVlZiT2xSNk5OMEpzSkRYRTVwRlMyM1IrSmdy?=
 =?utf-8?B?dHFFaUhoVU9aYVdLZEVTbldCaEh1TTRjSjZQY3hBRHJ6YWVoaVJ6ZndJZG1M?=
 =?utf-8?B?TVJtUmM3SjVvODRuejFrNVJPeEdPM0ZCNVFKNEl2b1E3OVY1TnVxZHFoTEJY?=
 =?utf-8?B?SHYvZnZGd3EzRlIwTVF2RWhYK1Zmdnk2L3VrVWFvdlIzVVViWnNkYWd2VkxR?=
 =?utf-8?B?S2kyOUVyVkFKd0dESVBkcEhVbndKY25kd0cxeFV4c1dBcWt6aXJIZzIvdjdM?=
 =?utf-8?B?WmdNUWRXdlhZY0hycDM2Rit6SURDVlBsaWIvY3ZvVnZZS2ViMjhhZWxuWFVG?=
 =?utf-8?B?YThhNGhiaXEyUXBsV2U2dmxnR0lpMFdvVUZnWWQrWWwzdlNIeVZQRDlySEpv?=
 =?utf-8?B?Z2FuSmFvZXVWRlRhNnFLbjd0QnJmT3RNWW1CQnFFNk5YQXFnbEZjWFZqSHBp?=
 =?utf-8?B?eFdSanVPU0s4UUZtOTFGYjdNdU1Xd01jQ2Roc0JseVRTN0JFakVvczluMXIr?=
 =?utf-8?B?WEZ3MWg1WERCbGtsOHBRdmlURXpsSWxZQkU4MEtGNkZtdnBZMHk5eEt6RHl2?=
 =?utf-8?B?bmJkNFlFRGVFeDFqMmV5NWJSWWdma2wxbjAvakdWZmFKMU8wSGozNEI4QUE0?=
 =?utf-8?B?Vk5kOTkrZCtCNFRYSGZZRWJjMUdrazgxSjlyeGc0OHlqQzBGNml6ZWhSRlNn?=
 =?utf-8?B?R0xyUnNQUlVmTzlrYjJQYTllVjhxM1ZER0tkcW85NlhKTldxSVBRZTNGNGpU?=
 =?utf-8?B?YWNBMndudHNld0RBNGo0QnVBMHFDT094UUNGaEc0RUl1d2JzcmV0U25VeUFa?=
 =?utf-8?B?bHcwSnV0eHNJM1NTMi9yak5tRksrRzFwejJrTWlrTmJTZVQwcDlIQUVUOUNm?=
 =?utf-8?B?ZEFDNjI5YlVCM0M0bGsrRXNmck9Mb3ZJdzk4SVBIR0dCWkViNEppZkVnMU1l?=
 =?utf-8?B?eG5wTlViTUpVdmJwc2QvVVRoYi9yTjlLSlM3UjdldTlJTUxUb2I4NlFFRWt4?=
 =?utf-8?B?R3J2Tk5OVjNnYU05b2hyMEUxbk11Y1d0MVV1by9OSnFPUXRIQTZHL0VZQTVh?=
 =?utf-8?B?TU1iRjdUYzdjWWZJT2tISzlGYXliZ1lyUjlDWi8ycmNva1hWRXNyL2h4MnJm?=
 =?utf-8?B?VXpZZzNnTUZMOG5iV0N0T2dPUndTTzlOVUFwTjE3K1R4Qi9VRGVMaGc4Zlpo?=
 =?utf-8?B?NFBOUEpqY001SmpkejNFS0NJUTlUSGlnVWwrVFljeCtCM2FmOFIvQ2ZCMHR6?=
 =?utf-8?B?RG8rSkZhM1Bpb1dzWCtGZi8xSm1sYk80YkoxeDgyTFZBeHY3ZG93S2FuaDNN?=
 =?utf-8?B?RlFJRkl0NTQ4d3ZTMFBIREtuKzJBbnRmc21Pd0QyRWtsN01FM2t0NnJsQ1lp?=
 =?utf-8?B?Mkxtak4yN3RjaEUzZDhCMmtXei9GcWxVa2hkeE45cXJWL21XVzNzT3pTUjJW?=
 =?utf-8?B?L2dxeU04Zm53K3lldnFUOXgyY09FWWhWNnR6YUhFRnpBQVFWWHBmY2VId0x5?=
 =?utf-8?Q?xQxo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzZhanBMclhuUU1zZW54VnlTQy9zc3hRSmczekRFRWtLbGhHUGdvVXhuNFE3?=
 =?utf-8?B?ODFFYVR3dDlZUWFHZFFvQ2VmU0ZtdjlHNCt3alZJSm5JajkrSzBYR1gvdWxW?=
 =?utf-8?B?TDlmM3lLMUxISnFDMS9Dc3d2dEpIQndsZWdmamJzV2FrVTBBZFFya1BxYjlB?=
 =?utf-8?B?eWpRTFNObEtoaHhrR2haRSszYWQ2WUJqL0ZuOStoQ2VXK3pydkc4Z3lDTVZJ?=
 =?utf-8?B?YjFhVHJXcnEzbzZ0VllFeWtyQ0liWmJraGZOdVlDaXJrbWhTOFVwbWE3dHU4?=
 =?utf-8?B?VnFaaEhaOG9wYm5UVkcxdTdBNlpvamxRRk9XUzJjYUdtM2pWUjJYenhkODVB?=
 =?utf-8?B?M2lzVWtyVlhKWCt0cEdrOHAwVG5NKy9MbFQ0c3hrN2JZeEtmek9lYjlTNkxw?=
 =?utf-8?B?dXVhVllWSUFYUk5xZXVwMEVheGRVeEdwWVNoVERPeFZsVGQ1V0QxckhpWnpF?=
 =?utf-8?B?NUM2TXJIZ04wY0didnd6eTVQWm5xR3lZK29FcmEzcERBckk2dENEWHpiYmVE?=
 =?utf-8?B?YjJ4d0RPU2laVDd0YkpsNkJ4NUx6UzZnMHdSeE1FUjB6SlJ3SDVKVmdJMUZQ?=
 =?utf-8?B?VUd6aUZvd2ZQaGJOaHRQV28zZUpoRHR0dDlJY01sVW52M0kvcnpLUXdyQTFK?=
 =?utf-8?B?WE4xWG5wL2JvTmExeHFzZUEyZEI0OWgzYUdlM1VpOW9tMjRrTU45UHdXR2g2?=
 =?utf-8?B?U0N3SllVYlY1aVV6L2YwdlBsMGRyQXBuSlNNbjhoUmZ3OVUxVklNNlhPWmxL?=
 =?utf-8?B?eTRHTUFoYjRCUkFCaE14VENLM0dRaUxnWitiOFVYMExKTHp2NXRMckRmbEtu?=
 =?utf-8?B?WXN2VU81Nm1vbnoyVkhuQWRmeU5JOW5VT0tCdW9FamswUnpCTFNOVGd0VUlv?=
 =?utf-8?B?eHpoa29rcHRLWWRPdGhTc0tTTFBXNWk1V1N2eFdaUnQ2djk4djJRYkxlUzJr?=
 =?utf-8?B?RWVhMHZYZ216Rmp0Mndod04zUkxwQ3p6SmtOY2pvS1R0TnJKVWhrcFFJVUZs?=
 =?utf-8?B?ZURTVWpnRThtUkVnSy9UUWF6SlVpM2tRamRMcVliQ0J4Zy9vK0tNaTdBSElE?=
 =?utf-8?B?b01jUGRMYzNQcHY2cnZDQURndXBMUmZXalEwMVZIV0tvVzc2V2R3aWdoSTd3?=
 =?utf-8?B?OXhleUVHSU41MTVhaDFOQjVHN3ZuYWFPamFNT0JIZEN0Y0pDTzVHc2lWK1FZ?=
 =?utf-8?B?aFZSVGltTWVnNitBUzNhU1UvUDZzWThuQ1d0ZDFtL0Q1OVhMNG96K1UwaWZL?=
 =?utf-8?B?UVBTZXN3dDV2RHlseWNmaTd0UFByelM3VnFLZzJwbW5mOENuZW5SaS8xbnZk?=
 =?utf-8?B?NnVMK3psZjFMY1NlSE1lTmswUWwxa0ZDT0RYWXMxMGVHQ1V1QVdlQnVpOUVF?=
 =?utf-8?B?WVZuMzV0THVtOHhwRVB2Q2pkRURhOEdhdjUwUXQxT2xUTzBpN2JGVTc0c2I2?=
 =?utf-8?B?MFVPN3RoL2FZUU5mckg4VjdkNVFJTysvM1Y0QUhQZXc5T2VoWjBUUTBUaWk1?=
 =?utf-8?B?bnYyTWFFUnk3SWNJZzFodGVoUVlraVFpeUFqR2I1UDVUWGxibFprd3JxWEFT?=
 =?utf-8?B?dFZaUXVBZm1PZk1NcmxkaUJqRWw1N3RtN1o2ZWM3Ym4vbGd2VDFiY05RS0RR?=
 =?utf-8?B?cmdndHBOWHNpYVRFOEdQVjBacEFnMXQvbEpHanhVc1c2eG9jWk10U0ZkcE9Z?=
 =?utf-8?B?N2syeWk2S3cyWkVDR0pNZHA1c21XRzJjR1hsWkkvVlgvU0xsdGpHblV4M2di?=
 =?utf-8?B?S041em1VS3N3VVJjVktTc25WdU1TRlU3ckNDL2lKUzY3TE9KcndPSzM0ZE5N?=
 =?utf-8?B?OVV4NytweXEzYk9YVnJyaCtpdjZuWnJJRFdtRTRsZDljTlhCUmNOTjdLZWU1?=
 =?utf-8?B?K1lHWjA1QVUzRWVaL3M0TVRnZURJWGdWdXkwaWVQejFVMHI4VlFBeTQyc3Qz?=
 =?utf-8?B?UmFpVnpnZEhCQUtzTFhKK0U5L1JMdTlYSDdGQ2tYZFowbzJNUjk4RlQxSEVP?=
 =?utf-8?B?b3ZNb3RDSHNxamVQY1pDQklmdFFSS25SUFZZVlNubCtOQTN2TGJIN2o0Qk5v?=
 =?utf-8?B?cnhhNnl4cmlBdXJRNVNtbHNNY1ZFYWdYRXJuWTlibUhvWTRHMkRQY0wwRnpS?=
 =?utf-8?B?eEI4eFEzNFQ1aldtaHF2NXhhYWsvTGwvNTVKVmYvSlVBNnRZK2pBdVFmUXVl?=
 =?utf-8?B?OTVJcnRkd3dVaVQ4WDJRMjVURkE2aDg2RnYzTnM2ajR0c01QSmlWSUdVVlV0?=
 =?utf-8?B?bmxsUW5UR2QzZU92SStpbzdiRUpjbHd0VFZSTVZYdEhjeXZ2OFFIVE1ma0hU?=
 =?utf-8?B?VlF0ZFQyLzB1U2JBUkRGYk43eTRKS1pWTHMwUjR3VmpoU0l0dElHQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ed0c8f5-60ea-40ad-5d78-08de6900d35a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 00:02:20.2396 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tzavhr1WBXs53gQUFh8JhmPd+RF+VssuFL5r0AilWBr5acE8dvpQ7epq2OUYnQsvdGUz9KtGn8Q6DdI2vQEb+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6135
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

On Tue, Feb 10, 2026 at 01:05:25PM -0800, Matt Roper wrote:
> On Tue, Feb 10, 2026 at 06:21:22PM +0530, Tejas Upadhyay wrote:
> > "eXtended Architecture" (XA) tagged memory—memory shared between the CPU and GPU
> 
> I'm pretty sure this expansion of "XA" is wrong; where are you seeing
> this definition?  Everything in the bspec indicates that XA means "wb -
> transient app" (similar to how "XD" is 'wb - transient display").  I'm
> not sure why exactly they picked "X" to refer to transient in both of
> these cases, but I've never seen any documentation that refers to it as
> "extended."
> 
> > is treated differently from other GPU memory when the Media engine is power-gated.
> > 
> > XA is *always* flushed, like at the end-of-submssion (and maybe other
> 
> I assume you're referring to the fact that the driver performs flushes
> at the end of submission (via PIPE_CONTROL or MI_FLUSH_DW), and that
> depending on other state/optimizations in the system, those flushes may
> flush the entire device cache, or may only flush the subset of cache
> data that is not marked as transient.  The way you worded this was
> confusing since it makes it sound like cache flushes happen
> automatically somewhere in hardware/firmware.
> 
> > places), just that internally as an optimisation hw doesn't need to make
> > that a full flush (which will also include XA) when Media is
> > off/powergated, since it doesn't need to worry about GT caches vs Media
> > coherency, and only CPU vs GPU coherency, so can make that flush a
> > targeted XA flush, since stuff tagged with XA now means it's shared with
> > the CPU. The main implication is that we now need to somehow flush non-XA before
> > freeing system memory pages, otherwise dirty cachelines could be flushed after the free
> > (like if Media suddenly turns on and does a full flush)
> 
> This description seems really confusing.  My understanding is that
> marking something as wb-transient-app indicates that it might be
> accessed by something other than our graphics/media IP (i.e., accessed
> from the CPU, exported to another device, etc.), so transient data truly
> does need to be flushed at the points in the driver where a flush
> typically happens.
> 
> However when something is _not_ transient, then either:
>  - it's "private" to the GPU and only our graphics/media IP will be
>    accessing it
>  - it's bound with a coherent PAT index so that outside observers like
>    the CPU can snoop the device cache, even when the cache hasn't been
>    flushed
> 
> If media is not active, then there's really no need to include
> non-transient data when an device cache flush happens since there's no
> real need for the data to get to RAM.  So that enables an optimization
> (which comes in your next patch), that allows flushes to only operate on
> the subset of the device cache tagged as "transient" if media is idle.
> 
> As you said, we eventually do want to force a flush of the non-transient
> data as well once we're freeing the underlying pages.  So how do we do
> that?  It's not clear to me how the changes below are accomplishing
> that.  Is there a way to explicitly request a full device cache flush
> (ignoring the transient vs non-transient tagging)?  Since the GuC
> handles the optimization in the next patch (toggling whether flushes are
> full flushes vs non-transient flushes depending on whether media is
> active), I thought there might be some kind of GuC interface to request
> "please do one full flush now, even if media is idle."
> 

I’m not an expert here by any means, but everything above from Matt
seems like valid concerns. Thomas also raised some concerns in the two
previous revisions; again I’m not an expert, but reading through
those, it doesn’t really seem like he received proper answers to his
questions.

A couple of comments below.

> 
> Matt
> 
> > 
> > V2(MattA): Expand commit description
> > 
> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_bo.c      |  3 ++-
> >  drivers/gpu/drm/xe/xe_device.c  | 23 +++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_device.h  |  1 +
> >  drivers/gpu/drm/xe/xe_userptr.c |  3 ++-
> >  4 files changed, 28 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index e9180b01a4e4..4455886b211e 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -689,7 +689,8 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
> >  
> >  		if (!xe_vm_in_fault_mode(vm)) {
> >  			drm_gpuvm_bo_evict(vm_bo, true);
> > -			continue;
> > +			if (!xe_device_needs_cache_flush(xe))
> > +				continue;

This will trigger a TLB invalidation (and I assume a cache flush) every
time we move or free memory in the 3D stack if it has a binding. It also
performs a synchronous wait on the BO being idle. Both of these are very
expensive operations. I can’t imagine the granularity we want here is to
do this on every move/free with bindings.

Also, for LR compute with preempt fences, we would trigger the preempt
fences during the wait, so a TLB invalidation after this seems
unnecessary, though perhaps the cache flush is still required?

I think this needs a bit more explanation, because without knowing a lot
about the exact requirements, the implementation does not look correct.

> >  		}
> >  
> >  		if (!idle) {
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index 743c18e0c580..da2abed94bc0 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -1097,6 +1097,29 @@ static void tdf_request_sync(struct xe_device *xe)
> >  	}
> >  }
> >  
> > +/**
> > + * xe_device_needs_cache_flush - Whether the cache needs to be flushed
> > + * @xe: The device to check.
> > + *
> > + * Return: true if the device needs cache flush, false otherwise.
> > + */
> > +bool xe_device_needs_cache_flush(struct xe_device *xe)
> > +{
> > +	/* XA is *always* flushed, like at the end-of-submssion (and maybe other
> > +	 * places), just that internally as an optimisation hw doesn't need to make
> > +	 * that a full flush (which will also include XA) when Media is
> > +	 * off/powergated, since it doesn't need to worry about GT caches vs Media
> > +	 * coherency, and only CPU vs GPU coherency, so can make that flush a
> > +	 * targeted XA flush, since stuff tagged with XA now means it's shared with
> > +	 * the CPU. The main implication is that we now need to somehow flush non-XA before
> > +	 * freeing system memory pages, otherwise dirty cachelines could be flushed after the free
> > +	 * (like if Media suddenly turns on and does a full flush)
> > +	 */
> > +	if (GRAPHICS_VER(xe) >= 35 && !IS_DGFX(xe))
> > +		return true;
> > +	return false;
> > +}
> > +
> >  void xe_device_l2_flush(struct xe_device *xe)
> >  {
> >  	struct xe_gt *gt;
> > diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> > index 39464650533b..baf386e0e037 100644
> > --- a/drivers/gpu/drm/xe/xe_device.h
> > +++ b/drivers/gpu/drm/xe/xe_device.h
> > @@ -184,6 +184,7 @@ void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
> >  u64 xe_device_canonicalize_addr(struct xe_device *xe, u64 address);
> >  u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address);
> >  
> > +bool xe_device_needs_cache_flush(struct xe_device *xe);
> >  void xe_device_td_flush(struct xe_device *xe);
> >  void xe_device_l2_flush(struct xe_device *xe);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_userptr.c b/drivers/gpu/drm/xe/xe_userptr.c
> > index e120323c43bc..b435ea7f9b66 100644
> > --- a/drivers/gpu/drm/xe/xe_userptr.c
> > +++ b/drivers/gpu/drm/xe/xe_userptr.c
> > @@ -114,7 +114,8 @@ static void __vma_userptr_invalidate(struct xe_vm *vm, struct xe_userptr_vma *uv
> >  				    false, MAX_SCHEDULE_TIMEOUT);
> >  	XE_WARN_ON(err <= 0);
> >  
> > -	if (xe_vm_in_fault_mode(vm) && userptr->initial_bind) {
> > +	if ((xe_vm_in_fault_mode(vm) || xe_device_needs_cache_flush(vm->xe)) &&
> > +	    userptr->initial_bind) {

Same concern with the LR preempt fence as above — the hardware will be
interrupted via preempt fences, so it doesn’t seem necessary to
invalidate the TLBs but perhaps we need a cflush and TLB invalidation
is the mechanism for that too?

Matt

> >  		err = xe_vm_invalidate_vma(vma);
> >  		XE_WARN_ON(err);
> >  	}
> > -- 
> > 2.52.0
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation

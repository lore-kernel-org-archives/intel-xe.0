Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49DA6D7495D
	for <intel-xe@archiver.kernel.org>; Fri, 19 Dec 2025 07:39:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0822510EE33;
	Fri, 19 Dec 2025 07:39:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DFWBHF/p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB84A10EE33
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Dec 2025 07:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766129960; x=1797665960;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IHoKs1/6E10DeOy6ko6oRhyVfVUHFEEXL07Ub1YJc4w=;
 b=DFWBHF/phlmWzu/FncG0MiDZqzgyQ2lsE1bUl5MVhPGV4t7+aXEgax9T
 Tz2Bsy3nKf/bMBDwPDM5TlSWxcYB2tjf6yUBD91Em/Xh/KlJiy1DyWSaV
 db7Q6kGogIqmBJVb9EJRSDxxDlbKplWnD7uvU/4DKZDfCKev8lTVgzlAl
 keS2RoigtOugULwKvSuBz1b3sdovxFGGl0JB5iN6VIGCCkocWkUMMhhdv
 Euvg6OWyjwg3f9+mptQ9ErvS3wqGZqO08WJwh1zzrokDSjws5UPhKuVBk
 T2gwmcAXIfaqz8lTA0MIaEwMO/5O5AjBuqocfaTz5aenYAfDRiuKBc3m2 w==;
X-CSE-ConnectionGUID: wCno57UJSWCaFz29ZNPhag==
X-CSE-MsgGUID: Vo+wpKf7QEKsPEVRi74xMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="67287015"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="67287015"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 23:39:19 -0800
X-CSE-ConnectionGUID: 5pnwWQMIRT+52hMEbQgYNQ==
X-CSE-MsgGUID: VBw7XHrcSzOeLpom682CRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="198396349"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 23:39:19 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 23:39:18 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 18 Dec 2025 23:39:18 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.23) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 23:39:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xwftM+8aSupI0/BTtYM9eArsWj5kYpijyuOVbBfm45Ed9/KYqdZ+L4ut9YsXwfn99wAVaU8DbqIzzKx/LB+Y2BjbRZVM9xvSDelXlslAvULvpw+GLvtngvU/EIxUbxHKjDyIwb9eUPUYa4fgKYUKgferGZtT+utVH9rtQFK9/eVhgC9pSRvGgZSpoA1ncjMSy24rN6xfEphIxRHfAkH+nTf5vpuFDUREc2pVvkRT/GWYe3Fzbc2ykFRrIz0qQxh5N5hQpKmyI7dz6hdZ/uaz1UnF8ePm4aJJbzDFmB3UdR2gJSpvAwq/Bzml1yZAtLHf+JpJM3UMmI8pe5a3ls/NTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6skBmOWYPffuGVwCVNu26TSToYXcWw8/Y6GvxpIaWms=;
 b=V2ayTRwh82ofF0xNVUo2r7snFlAvuzL98yj/VvaJC+qgWhGGg5zapIFs4SgQNVwBk3NcYwJSrRFbLrM0OqKh+2SFblDGsSjSVg4nRjTEKXtOrLADuXad+WSE5ZxhFu0eBYmwOrdAB0t2Psurf6i02ZXP/1Aq3uOT1Cn3rDR4ThwYPUs95NRsmfDs3qzKprr9lukfmEUrUeSey+qtd7ydFtL4UyDacdWuoa/izDdU4mRrQNjJU7NFlszuMvkHlEU9Ubesi+WneUWWsXBzCkFgIrqnRI94UasAMkKQ1v1McNvjgOEORCgPeysZHGm29OQ1+rYiSSWhhlvwnqk6oplP3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7955.namprd11.prod.outlook.com (2603:10b6:208:3dd::6)
 by CY5PR11MB6488.namprd11.prod.outlook.com (2603:10b6:930:30::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Fri, 19 Dec
 2025 07:39:17 +0000
Received: from IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::7265:46ae:19a8:b31d]) by IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::7265:46ae:19a8:b31d%3]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 07:39:17 +0000
Message-ID: <4b42268d-6d60-4189-952b-a74b3d68b789@intel.com>
Date: Fri, 19 Dec 2025 13:09:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe/xe_survivability: Fix static analysis tool
 reported issues
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>
References: <20251218105151.586575-4-riana.tauro@intel.com>
 <20251218105151.586575-6-riana.tauro@intel.com> <aUSEOF9ka7KjunaK@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <aUSEOF9ka7KjunaK@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0010.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::12) To IA0PR11MB7955.namprd11.prod.outlook.com
 (2603:10b6:208:3dd::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7955:EE_|CY5PR11MB6488:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e32db19-bb0f-4a46-3521-08de3ed1b6b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QS9TaTFseEJ2WnJ1dmUrejlPbGZzYzVDSFZiQU5Ubit0d0pnQVM5QnIzbGZi?=
 =?utf-8?B?b3RmQkluTjJNamdvUVVYMjU5bFhMbmNZdjlPTXpOWnplbTV6aVpDUlEwR0tL?=
 =?utf-8?B?QnlJSDVBMGNPd0tOYVlGV014aEppeE9zRml3RUJCVEhiUXYyZ2k1bFd5bDZO?=
 =?utf-8?B?VS81ZTNBcGVHbkdJKzJHTyt0VkV0dlBCZTAzeE85NzlJYW40QTYxWG1wcVVQ?=
 =?utf-8?B?TzFVSDltSk9TaHpHU0lXMDNsQXdzai9mUHdHakxnbkZPSmxIN05FL3RUTGNM?=
 =?utf-8?B?SnA2c1dtbnkzM3dCN2phc0pWZVRVaVJDa0NJUWhZOUlhM2pZMHkydVIyWHJt?=
 =?utf-8?B?RWtJeFgwZnlNUTJlcHFUamp5WmJJSForUURKMlZsK0tZUmY1ZVAzcmZmbnRk?=
 =?utf-8?B?SHVFZU5XR2RVN3FqOC9rYnZJeVdWaFJvRmpjajdTZHJOVUFtR0VBUE9xcTB1?=
 =?utf-8?B?em1sWGFuSk52M0VBdTg1VkFrNlRQZHE0LzQ4UktmNWhJaEtadHJFK3J4dGVJ?=
 =?utf-8?B?OW5qWXd1QUpXUWhHMnEyeXhZc3RBb2ZjTDBBUXVhcWRVSXJYaEFzeXlIU3g3?=
 =?utf-8?B?TFpnNmVoRlpyekVhcWhqa2xwNTRaWTdZZnBSUFRCaVd6VG80S3FMWTVUQnBt?=
 =?utf-8?B?VytMOVo3T2htcWowZ1M0dnpTdXB3Q0thdXY5bHFJZTM0NTVLUVpSRWU2TGM4?=
 =?utf-8?B?RXBqMnBQRVhRd0l3ZnNnU3pGVFJ3b25XMVJRMjErWGRGZVRiQU5ianN3amZu?=
 =?utf-8?B?YmxDYmUwODl5c0RVSXM0Skp2a0lWWXhVQytCRlN5Y0lKcExJdklKcFE5ckdv?=
 =?utf-8?B?S21YdXBwYnRJU3NUbjI4SmZuUFNVMXltVy9PdFYrN2VlYUdpaWZybDVkVHpx?=
 =?utf-8?B?ZkJ1cGlUcWtYbmNBcEw3V201ckJuY3A2SGNTVldXY1JvUExsNWJRZnI4NGlj?=
 =?utf-8?B?VDc5WFRGZzJrMTVIVi9hVTVTa3VGZ1VEb1FSNk9ZMVYyK05vQ3NGVmZBVmZ4?=
 =?utf-8?B?amxrK2xsR20xRnFiWVl0VVpEcHY2anZiaG1qK1d1am1JUUZsUlREOXlRY1Ux?=
 =?utf-8?B?WHV4ZVUvR1hkY2VnUHpqSlNGeGVBbnZlMW9mNUdvL1ZNc0pOd0daR2dTVXJa?=
 =?utf-8?B?eU1LOG9lRzUzMkRoUEtGY0w1UFA4MU5MYkQ5dmdXWnBhU0NpdnpGUVBpMXhM?=
 =?utf-8?B?ck1NT1FDUytrN2NoNU5VWklKNENuL3E1SXRlNHRkN1JDbERxY2xMaExqZ21j?=
 =?utf-8?B?WEJMUVVMSExiZTFnQm83VHY0c1YzSjFyYWN4MEpuTXNXakhxeTVXdUwvRUJt?=
 =?utf-8?B?aS9iVkpyQTNvd1A1NzBNK1JDN0lMbG85cElIMlJ5S1ZPTDh4cTJRaEEzZFBB?=
 =?utf-8?B?K3VGK2N6aVp2UWI2dTBCaUlDZnVkOUhKL3lFeWd4VmxjakpxRTZiZG1GdHp6?=
 =?utf-8?B?QndNNVlTQkR2aHpXMmxmMGVRTEJQQWYrSWVaYWY0cUErSDdDSTlndUp3ekhS?=
 =?utf-8?B?QWdhUGttVU0zZkVTZkFnUEY3eEtpZ2FJUzZQQ0ZwbkZxVWtHRjNSbmRqQm9R?=
 =?utf-8?B?RnpRWkxCZnllL0o2eGFLV0EzVytZOHdoZXV3SHpYbDNlTFN2YVNtZm5yRmNz?=
 =?utf-8?B?WjhHaDU5ZFlXOWNKN2dmSTBXZ0RpcktGd1NzTFM5czRpQ2I3Z1VvSWI2ZVVK?=
 =?utf-8?B?d0tmTVhPTEU4NlEwbUV4N0ZJYjMxR3Z6RzdDV0lCVnYwdTBXWXVpZ3lHTFpI?=
 =?utf-8?B?QUZ4czllc21QM09RYlptcmFTSzR6NHJiLy9ybC9vTDJOVEVFZXFiaEZzVHp2?=
 =?utf-8?B?Tk41eFBpMjdiSk54cHRSR2VsajFqSG96K1ZqZU4wWFRTNHJSdFVUWDlKZUN0?=
 =?utf-8?B?MFBzaDBWQ1RLQWY0RjFpNzBnQ1c5OHl1cyt2VHUwSmNuZGd3aElERHNGVFo3?=
 =?utf-8?B?NEVLb3lyYVBTamRnZ0I5YmgxYi8xV2szTUE5VUNmVDNRaFF2b3JqVFJDem1i?=
 =?utf-8?B?SFVRallqeGJRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7955.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzhnbGZSVExVYUgyaktDRGZoc1YvWFJVT3NYYXprN0lXM3JPK09PSitiY3No?=
 =?utf-8?B?WWExVE1DbHJqbzcwRnhpUzQwcmszUSt5MTRoVmhQV0Q5endrUDJLRDZxM09M?=
 =?utf-8?B?RVNhV3RTMlYzbXZ4YXoreG0yRDdPa0JBTW52WnZubXNOakxCelRSOHdEY1o3?=
 =?utf-8?B?Q2gxd0VwNFZ6MGVIUU1RMzRGT0luWjdqUzZONnFHT0NuOURBRkFjMTdlODNE?=
 =?utf-8?B?clF1K0k5Y2lmMTJBVHI4Rm1DeEhmQ0dZbERXTVo0NU41TThsc0QvOEh1WHFw?=
 =?utf-8?B?OHh2K0JubzY0RnhJaXZEazBjTXJuckcwSnFHV2JmWE1VZWlOc2pEd0NFbTYz?=
 =?utf-8?B?OU5ERGxZejUrWFNYVWloYnJ4ZFpDZ3hXdnFnU0wwMEloS09PdzBOVlFNSFhD?=
 =?utf-8?B?OG5TVHgvQ3RKS3MxVCs0OHJRNThQMG5USUdVZWZBTFVGOGNqTnAzbHhqRW1s?=
 =?utf-8?B?N0dVOTk0Z1JvRHlDUXRXQ0YyRVd6L2xRZkdhaEgvc0lxYnV3UnJpWU0reGx5?=
 =?utf-8?B?RFdjUDNCYTdUWkxrRVZNMnVoWis4ckFnV21rUE94OFAzaWtOQkRBaDdRVEdy?=
 =?utf-8?B?N2pjMGxLTkFYY0pXdzdzT2prSDB5RzE5SmdKL1UyRHBBL1VteDFIYjZGNG1J?=
 =?utf-8?B?YXZiUllaMlVwVDFUY3Jnb29iYjBIQWtXaHpFRzNhaWpxVlFFbWNOTEpXYi9Z?=
 =?utf-8?B?cWlWQjVWVlZLUnd5VEJxVlJJZkFselVYREszazcvZWllenZBb05vdHlzSi9q?=
 =?utf-8?B?eDV6bUtzWWxRbmJnbEpzdWlzb0NGVGtSUFFub2l4b0pncllLS0JFd0tRRkEx?=
 =?utf-8?B?RGZ2R1MvZ3FZaHZab1Fqb0Vsa25rdXd4Q1IvVnFsZ204QzA4cDBna2xvZjZ5?=
 =?utf-8?B?R0NFQnl3d1k1Z3BOS21XUklZS2hxOXRhUFVpR0NBdk1KbG1oczljQkNSSXFX?=
 =?utf-8?B?S2locGRTUEFJQkM4YnZiT1F4UUtqY3A0VEQrUW1WRVNXTy9xZTRPM1VEQ3dB?=
 =?utf-8?B?dmVDbndEVVB4R0NtNmxNMUUrNDM1RFJEdXZkN1VKZlpkL0pRWGlUcUlhZFVT?=
 =?utf-8?B?T1pSaW1KSFJBNzRsWm5lbDRPMW1CVnFWcUZqZVZTZUZJQVN6Ymxoa1RrME1a?=
 =?utf-8?B?eXhJN2ptNnA2SFVwUkNjS3B5Y0VkSVdZTjF1VEY5MkJTUVlBTzV6VGkvNVox?=
 =?utf-8?B?TTFhNkJXakJiQTFWZTFiWTcvU290Ri95OFpsb1dQd3grWnNYbTVMcG1YWmpz?=
 =?utf-8?B?ZzhLVzZQdmRMSEszVGZXMkt2Zi93Yzg2czVWSkR3d09VVUdobklXcmtMOURs?=
 =?utf-8?B?b1h6WHRNWWxhWkVPU2pza2xaRXcrUzMzdFkyN2pNc21ReUdvaDU5TVRWdktG?=
 =?utf-8?B?WDdLWGVyYVhlNWdpaEh5amIrcnBibkV4WGJUOXJCWDBNUWNHcytqd2ZySHVG?=
 =?utf-8?B?YlBDN0oyTGJVdjYzeC9mY1p3dEN6eG9RZkpKUUdGNjFhUGRQeEJtUzFRNCtW?=
 =?utf-8?B?ME9YVHZHQ1VObmZsT0dkcXdsR1FLWmFJWFJMY1U5Yml3eVRUaERWOUlzS1ZB?=
 =?utf-8?B?TmdmVXJUK2FLVGY3cXFwY25jalRhcXRuNkExa291RmlOaUNaU3o3MnB4cFR5?=
 =?utf-8?B?TnZqT0kzZTlLOGxwSTlyRVZLaHhPdDZscFNJeU1mL0U1ZXlYaHNnMTdCd0Vm?=
 =?utf-8?B?Y2JTTlJRYkFzSVBFZjFLS0NLQ1NvTlJkV2MzTXdocWVVcGJ5V25WVkVKQ2VN?=
 =?utf-8?B?Z0tad3grTmgreHRydVgrb05qOVd1dmRGTHUvM292cGZNQUViZEZMc2RsZ0Q5?=
 =?utf-8?B?N2w0bHk1eWNWRTI3SmRra0s5VWxUUThjanp4K0M0RitTVTBwN24rcXRMSTVl?=
 =?utf-8?B?cFVDMVBEYmNMcUsyNWdGZWYzTUw4UkRDSHduYk9tdmdocEJkT1h5ZmZpS2dJ?=
 =?utf-8?B?eUtJNitHZE5uWnNKcU1QeHJxM2VERDRrTU4vWWtZWkZwVG9YWHczOGZrR1JK?=
 =?utf-8?B?YlF1YWJ3V3R2TEZCUEZRYmVBWDhsY0N2ZXJIb2xTbzlaK01XcDRsWm9kZEtT?=
 =?utf-8?B?Ri85cVI3ZTZ0VDBoTG9YcG1qRlFNUXZ5d2VxTjV3ajh3RC9RV1RyWDVIY2pU?=
 =?utf-8?Q?9NknlFXV/BpWDYKVg+PD2dJH4?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e32db19-bb0f-4a46-3521-08de3ed1b6b9
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7955.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 07:39:17.0948 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3CojyKXJu0mcIJqPmV6hIFnmG6Z+LlgOPr4juozHekPbOFAyX9c5X1Mm2L+6QrDrZoOzCkbRgostgDIpy7TU4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6488
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



On 12/19/2025 4:16 AM, Rodrigo Vivi wrote:
> On Thu, Dec 18, 2025 at 04:21:54PM +0530, Riana Tauro wrote:
>> 1) Use static survivability info attributes.
>> 2) Fix visibility condition
>>
>> Fixes: f4e9fc967afd ("drm/xe/xe_survivability: Redesign survivability mode")
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202512101919.G12cuhBJ-lkp@intel.com/
> 
> I don't see the number 2 above listed here in this report.
> What am I missing?
> 
> Also, I believe it deserves a separate commit with proper explanation even
> if it ends up with same closes and reported by tag.

Both were warnings so added in the same commit. I will split the patches

Thank you
Riana

> 
> Sorry for not noticing this on the previous revision.
> 
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_survivability_mode.c | 23 +++++++++++-----------
>>   1 file changed, 12 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
>> index 2869866537ad..a25a23bcacc8 100644
>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>> @@ -221,15 +221,15 @@ static ssize_t survivability_info_show(struct device *dev,
>>   		.index = _index,						\
>>   	}
>>   
>> -SURVIVABILITY_ATTR_RO(capability_info, CAPABILITY_INFO);
>> -SURVIVABILITY_ATTR_RO(postcode_trace, POSTCODE_TRACE);
>> -SURVIVABILITY_ATTR_RO(postcode_trace_overflow, POSTCODE_TRACE_OVERFLOW);
>> -SURVIVABILITY_ATTR_RO(aux_info0, AUX_INFO0);
>> -SURVIVABILITY_ATTR_RO(aux_info1, AUX_INFO1);
>> -SURVIVABILITY_ATTR_RO(aux_info2, AUX_INFO2);
>> -SURVIVABILITY_ATTR_RO(aux_info3, AUX_INFO3);
>> -SURVIVABILITY_ATTR_RO(aux_info4, AUX_INFO4);
>> -SURVIVABILITY_ATTR_RO(fdo_mode, FDO_INFO);
>> +static SURVIVABILITY_ATTR_RO(capability_info, CAPABILITY_INFO);
>> +static SURVIVABILITY_ATTR_RO(postcode_trace, POSTCODE_TRACE);
>> +static SURVIVABILITY_ATTR_RO(postcode_trace_overflow, POSTCODE_TRACE_OVERFLOW);
>> +static SURVIVABILITY_ATTR_RO(aux_info0, AUX_INFO0);
>> +static SURVIVABILITY_ATTR_RO(aux_info1, AUX_INFO1);
>> +static SURVIVABILITY_ATTR_RO(aux_info2, AUX_INFO2);
>> +static SURVIVABILITY_ATTR_RO(aux_info3, AUX_INFO3);
>> +static SURVIVABILITY_ATTR_RO(aux_info4, AUX_INFO4);
>> +static SURVIVABILITY_ATTR_RO(fdo_mode, FDO_INFO);
>>   
>>   static void xe_survivability_mode_fini(void *arg)
>>   {
>> @@ -252,9 +252,10 @@ static umode_t survivability_info_attrs_visible(struct kobject *kobj, struct att
>>   	u32 *info = survivability->info;
>>   
>>   	/* FDO mode is visible only when supported */
>> -	if (idx >= MAX_SCRATCH_REG && survivability->version >= 2)
>> +	if (idx == MAX_SCRATCH_REG && survivability->version >= 2)
>>   		return 0400;
>> -	else if (info[idx])
>> +
>> +	if (idx < MAX_SCRATCH_REG && info[idx])
>>   		return 0400;
>>   
>>   	return 0;
>> -- 
>> 2.47.1
>>


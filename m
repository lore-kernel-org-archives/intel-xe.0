Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D71ECA1010
	for <intel-xe@archiver.kernel.org>; Fri,  5 Sep 2025 07:19:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CF4110EB2A;
	Fri,  5 Sep 2025 07:19:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FDvxaa5I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D91DB10EB2A
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Sep 2025 07:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757056758; x=1788592758;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=3fIg4DzUbnqhVaSU++3GzOtrbTWIgxf8aNiNMtKS0Go=;
 b=FDvxaa5IpV+nUeO4Dy/Q0u7aZFVtWCKBVxejS7Kpnefgnz+HptPHu6vL
 I6s6BN+WvtMlT1rVkjalGmHr94/C5nMLcBrEogWDCgUxV6ZSvVTG8XN6Y
 NzvCTxx4nwpA5uqspdxIeQQHNNFQ6iGBfaMfJ34UcYIqqU8dV1OhUKIyN
 Rj0j9NQ2KsjiRKzaehrcsfVD8ykt5wy4a2JVn304aiMseNwPgjKpQ+M3J
 /a4iKHFakNWTY5xnSAxkHa3su8HQtcUE2bnzEjIefhUBIsshnSCP03eA8
 KaUL7Jktj1vDwhiRUVgubR3KUlUKd+CrLOOAjwur86LpdLxL80aw2qSO+ A==;
X-CSE-ConnectionGUID: uMbKEWdkRDifmwp8L9lggg==
X-CSE-MsgGUID: YW5sTRP5RKWdDAug5OE4Rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="70782865"
X-IronPort-AV: E=Sophos;i="6.18,240,1751266800"; d="scan'208";a="70782865"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 00:19:12 -0700
X-CSE-ConnectionGUID: xboFYtuGRpyfCQVfzO1ZHg==
X-CSE-MsgGUID: /QDA1cJMQT6HGgrJ4rHx3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,240,1751266800"; d="scan'208";a="202925754"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 00:19:10 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 5 Sep 2025 00:19:09 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 5 Sep 2025 00:19:09 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.60) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 5 Sep 2025 00:19:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZNZspuZIDsZEGtI+WscgBTWc3EGrRXMx8Jhuau+vURMlMLAPjW3q0r7tWZnZ/H2iRNmmlntr7kcRGdgBDtJSx3f0ruwSNRSv/ajW0DpHz9afgUaFEeWmFTJWp1WJBt4BbwX/ENdm7EfDsKfUOXegr/8lIxT9NdUJVS78rQMCEJA54t89h8D2SGYTWqdDO0K0THupey9qijYV9bsyiMacaR+YAS3nkuY6sLy337L1sP6vMTtLRYRYxbQo0qXtQunHmUsOYrhiIgSIfLNqQrrgMXf2vhSZnunKTfgrBKivaSkb09+MTxDnZ3rumwZb/mxy5STD6wlwAHG9VQPBvz6sxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n21/RuRjmaaOQGvn5RQZjJS0+bBtJYP2b1b1xh6PXcE=;
 b=LDgxAEO2xYO2RvFYePOmCYnWZs5PMXKNWFMN2wIRkSY2Cu8y1d4CcLJwTLBjiyXTQX7TlCmgnNK3x6ZXs2AsCGzl7vapk0v1bH6sjMgP4vRba/n86IwCWxECOX3S8NGOZeyd5wDVrlkgxc0oEBurAszkXYqeo8LJ8yBPTMJWeShl0c2H44wAzXe7/H8EXRnFIdMnODHLOF0+dMXaf07R0MpKiqsR7PVex6DO3H/eglFeE5fis+AHnm3JImE1l2N9GymaiFuUNoaO9qL+PY+1c21rApufGUYaSL3KQzPgyQR7KPNiMX6wkAKWPH2iPy/A5D3mxSya8LYcduVvHa/ZiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by PH8PR11MB7071.namprd11.prod.outlook.com (2603:10b6:510:215::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Fri, 5 Sep
 2025 07:19:06 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%2]) with mapi id 15.20.9094.017; Fri, 5 Sep 2025
 07:19:05 +0000
Message-ID: <3d4d2267-92d1-402c-b0d7-49b8034ebe39@intel.com>
Date: Fri, 5 Sep 2025 12:48:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/xe/vf: Drop IS_VF_CCS_INIT_NEEDED macro
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20250904192918.7346-1-michal.wajdeczko@intel.com>
 <20250904192918.7346-4-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <20250904192918.7346-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0021.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::30) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|PH8PR11MB7071:EE_
X-MS-Office365-Filtering-Correlation-Id: dd40c30d-b734-4e8a-57f4-08ddec4c7f62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RUcrNTZrMTdjeGI0YUY1NjhrTnZ1S2EvTTlkRndUS2ZWKzErbnRXb016ZmE4?=
 =?utf-8?B?ck9EK0pwRGhYWVlNQ29nK3lZWHkxeEp3QlRDdWVDb1hrUkZ0OUdIVVNXaHd2?=
 =?utf-8?B?aVZJU212ZEorbDFBZFhJSmwzUzUzV2ZZRENJRlk3WEFCS1Nzc2hUcU5ta0FL?=
 =?utf-8?B?VFhrMjVLSDluKzR3eDVETXkrdVFPeS93a1hrSTdybHlIbjdIUkFtakRkMGdT?=
 =?utf-8?B?UCsvL2NDSW9DNlo5UEx5dzdHc1ZxY2lNQ1FLZ2QybFBrc1BpNE1zWmlrNUE0?=
 =?utf-8?B?T1RFL3V2dzVJQ0tRSDZMcDVlN0ZncWtTQXh5WlFWK2lpZEo2cnBuU08vUXk4?=
 =?utf-8?B?dEo4VjFXZ0owSHorV2t5QlJLUDNJTThzZkNsbTVOeTF6amp5ekZMOTN1MzRS?=
 =?utf-8?B?SlB6Mll3ZHhTZ0NRRithblIxcEpkTnZTWWJXRmdXSm5BblhjN2ZNeG8yZE9L?=
 =?utf-8?B?SnBtRWZkN1JiY05SMVZld1RORXhsRUlqZTRva2g1Y1ROYnE1Misxc3l6Mm5J?=
 =?utf-8?B?WWdOUC9RUmg1enZ0Sm9zK0RwTTF0bU9sL2NhY2x1aTNyRytwYS9vanozWmNQ?=
 =?utf-8?B?d21hUW5iZVNUY2hTNVlMOUowZVVZbHNqaXpIcFVvdjFZMnZNZ3NJTEFKbFJw?=
 =?utf-8?B?cnRVbGZCRHRLaUhqVDBkMmtIVVhDenc2Wld1c0N0VFFrQjVoSFlrY1BiRHJm?=
 =?utf-8?B?TE96YnZ0UmxZNzZKQ2RyWUNJSnhXOWIyV3JJNXRPNWlmeUZZajBtZDRxN0dF?=
 =?utf-8?B?WWNxdjFkNitGYzlZck1mdTNPd3FLUXNKTmZQNU1GcUZBL2lkTDd5ZGllS284?=
 =?utf-8?B?U0xpRkJaWFoxU1NEZHYrL1MrVVpvUG5xYjQyS1l0cFhZTzdHSzhibzNCSnNM?=
 =?utf-8?B?NE1uTUtkWWQ2V0FNR24xb05RckovQVNTalBpajZ1TkJpbmlYNEF6enJoUDFG?=
 =?utf-8?B?aG40dm55TWNhMVltUWNlNGFUVXlvbVYrQTg5RHBNM1FKZHc3MzFiVGdLTEYr?=
 =?utf-8?B?QTVtZ1hDV2lmUENGT0JlUTlnUEZqalJ6SmNoNVpTeHl4T01LUFg2SlMxd1Jt?=
 =?utf-8?B?ZkVhNENUaWZzY3diaVJnT1lmSFB2UVd6WGpSMERIZE5HdUVjY29QckZaVWtn?=
 =?utf-8?B?bE5Vdlg0NVIvYW9GaW5NTmxnZ2VLYWN2YWZPUUZOWUVDZFBNcXhLU2JaU2Jh?=
 =?utf-8?B?S3Z3K2FwWWcyNnVtTUQwdWRPdzJqK0c3RHRWd2hDd0RFV2MwbDdZYU05OXdw?=
 =?utf-8?B?RHRnbm9nU3B1QiswZUkzc0lmZHJiSWNOQXJFMkMreTltU0VaUGVYR2wrVVFs?=
 =?utf-8?B?eUJ2RjNvb294TDE2bGlLbGlJWlprR0tiQzZtZys4dGJWUHhNb1BKUVFRbm5r?=
 =?utf-8?B?TDR0MlNVNGtER0Jrb000SlZrZDlWazE5ek9WcXF6OUhZaFpLcjlEcjRTTk1q?=
 =?utf-8?B?ZjVCelcwZWptN3JTTDZMREN1UVVuNXJ5Qjlua204Wm1oMkYxd1JFWkNyc3Vs?=
 =?utf-8?B?R3EzSDJLVjdnY2ZXZTVuNVdvdHpucnFLdXRZa3RQOGIxbVh4WWYwTnNrbG90?=
 =?utf-8?B?T0N4d0ltdnpwcW9iNFlwdlVGVDRka0tGWHZkMEwvMW5KU0hXSWowZkdnb0M0?=
 =?utf-8?B?ZzBucktMNFRxUVMzQ0hON3QzVHpLcVp3K09abVdnL1QweEVXWlg5bFRiUmRG?=
 =?utf-8?B?V3BGc1k4UnYybkM5UWtJMDZuZzlMNnZlYTdXUWFRUEkwbm5XUmllQitDOTBG?=
 =?utf-8?B?Y2hWL1pqNVp0bWNTWlU0dFJGSFhiR1hHck9HRmJac0JiLzE5MDl5VDB1UUZN?=
 =?utf-8?B?UHRDWVprNzdPNkpleDcrMHdqWThreXFWTEJjSmcwem0xVW9UakxqNEhDMkFZ?=
 =?utf-8?B?bmVlcGRUb1hUd2wzeU1OZXpCbW5NZDhndm9wQ29IZ2NMeHpIZFEwTWhZaDl1?=
 =?utf-8?Q?gQx85odWMiQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFFZSDgzdFl3NTBNT08zS1RpMXUxZWQwOGRuSlJBK2p4ZHpKVVB3ZHI2VWJ1?=
 =?utf-8?B?aGNObVpNRFBjRHpoYUZNUWtCYXRINFJySzlGWEdvRkZLT1I0N0hwRTBHZXFI?=
 =?utf-8?B?c0tJVjU5aVR0OUpyZUVSOERlVjFyNExiRmhmNEc5T01XeVNlK1BIYzhYNFZJ?=
 =?utf-8?B?Q2x0blFDMHhycjJwMmQrckZTallpNENMclFFdmRzZTBlbWJCMjBhR0prZjYx?=
 =?utf-8?B?VXVmdHJvaG5Xalg5RGxzU212WTNJRTdENnM3cHNzZUxWakEvY3BPdkJtWnFK?=
 =?utf-8?B?WkFzTE1oaEg3eUxzc1ZBRUZtcUpBM0tBS1Z4WENQeEFreDNyZWhDZmZHQ0dV?=
 =?utf-8?B?bGx1VFdBQzg2OWQvSXlIOVdLeTJQbHV6NVd5anpQKzZTaEdVaTBHbVFaNS9O?=
 =?utf-8?B?dkl2ZStJRkJLRkdSTFNqeUJwdHZnM2RFb3VvbzJnWUQzakZGVXNqUForY2ox?=
 =?utf-8?B?SmFwTmtpM1p6RUMxdDFncDMxeS80UVIwMFVDTFVBQm9tcUVZb2cxUkd6ZkJL?=
 =?utf-8?B?aUkvVGZOdDNVUS82dERrdWtsL25mWWRidFdDdDJDbnhDRThITWdUWkxoYlhw?=
 =?utf-8?B?b0lsNDkySDZoajZPK3JNbnNya25Zc2JtUVFiMk8xZ1dQUUl4OWdnaStvZ0Z2?=
 =?utf-8?B?Nys1ak9rbm5zSHRsZlFyeVg3L3oyVUJXM3RsTTFMT0dSTmFTQytwdjFhWUkv?=
 =?utf-8?B?anNZUnY5M3FGTXcwaG80aVNZOXoxZWN1WG5FaElKSW42TFFNV0xTYVJtUUkr?=
 =?utf-8?B?WTRPdUk1RUcyOWJQSWZVOWdHSWxRVEY3c1lwQkJ6azFmRTRNM0ZWa1lWUUd6?=
 =?utf-8?B?ZnVLUUt6QW1YTGlVSFVmbms5VDBrMGRveWR3MXJMUi9TRmV3bWdsY253UTM3?=
 =?utf-8?B?ZUllMW9BbVZka0h2dGQ0Y2RIWlVEMFFMVWNsSmVYVHBqR3gwZDI2ZmM2Y2lT?=
 =?utf-8?B?TzRXeDdQNFROeXl6K1ZsUlpEdFo5aFBndytDOU9UU2dCV0R4d0E3V1ZyY2lQ?=
 =?utf-8?B?cDIrZ3U5NHFneVNOU2xwU0psRlUyeExlR0psK1NRN25ONHNiMW8raFdwcmE1?=
 =?utf-8?B?bEFveEVXS1NxUnpaSlNHMTZYYnF2ZjVLZ1A4R3VUR1NiQmpoV3BucE5TM1gx?=
 =?utf-8?B?c3lFVUt1T2xYd0pxWDBaUUJ6L1hxK1J2a3gyN0lSNXp2Z2VGMW96WGhZTzYx?=
 =?utf-8?B?bE5uYUUyeS9sUTQvY1RkM3dIWUk5TGZQU2taR2tRaWI1Z3lLVzRZc3JkR2JV?=
 =?utf-8?B?dDhRZGVtZmxVZnBMUmdRS2pDTEhKQ1I1MkVNN3FJaDVnQzRLTGplQk54V3po?=
 =?utf-8?B?aU1wRGd0elFzeDRMM0dkNEhkZWtPQ3k1b2p5YTF2VFlyMjd3cExVaEtIell5?=
 =?utf-8?B?Mnh0TXR1SU1OTXBpZGxoSVRuRkdGd1BWeGxDakhRdUV0RzJSVnZZaEJRaytC?=
 =?utf-8?B?TkpNYWszT3BOdlRZWENCQXJvaVp6dDdYM0xGNTdKQjhZRGNkOUhmVDBpZmZi?=
 =?utf-8?B?Zk8zSDNFNS8xbmF3Ky9jQ0xNM2dRUUUwUlZUNnlIQ25EZUthR2hoeWl2aTNn?=
 =?utf-8?B?OWxZcXZzWVllbWxjQVYrZGZTd0RYNEVsUU1LWnNCZ1BtZWhMdlJHVVZXR3o0?=
 =?utf-8?B?akRhaXEzSnpHZWdJdzZzeTFlUkd1cmMxb1lHdmUvM0dxZnJGUnM2d1h4Y2J5?=
 =?utf-8?B?ejJDdHJNMlA1Z3NTSU9XSU51Vm9tdWFTQWl6cE5sc3lmRFRKeWtPQ0lsaEYx?=
 =?utf-8?B?ZHIxcVprUUIwQUxVeDMwNjh2dmZ5cldpcjRtT1ZNRE56YmJ6MWNRUFo4emhF?=
 =?utf-8?B?V0xLelpOK0xqcnBCN2x5VDlJTFdybGsvaWxPaE5Wd1hnSDZXdUxVNEhVTlZN?=
 =?utf-8?B?V3Q0cC9UQ3ptamJmVUp1RUdkaEI4aEFzd3pJVTJkT0kyUjJNRCsydGl1clB1?=
 =?utf-8?B?S1IvTVdNeTlDYnBPWUVMOWhKem5sZ1dyTkNsZ1hNTEVRTmU0cDNqdkNkUG1E?=
 =?utf-8?B?ZWV4aEdTU09HMU5kVXNhT1pKVzV2a2RWQkxBOXdNNFE5MGIyWElWZFc2NUR6?=
 =?utf-8?B?bUs3S1MvMkpkdlIzQkdMckhQS05tUlFGOGptd1ByRi9PbWEwUlVPNzlQMmZG?=
 =?utf-8?B?VEVwVkljdHZpQUFEdDlFWFhLdmNvM0wzb01CZGRqQ1BId3dvV21QTlhIUk9Y?=
 =?utf-8?B?OXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd40c30d-b734-4e8a-57f4-08ddec4c7f62
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 07:19:05.9248 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z+nO5arBgDMxTz7Ttru51QMMjlzmqyz18NbzNSZWxIRVcmmnjW3v8aH/+ithkpUAy02g5H3bE4G4wO4VR+C0OHO/iUXWMXmuJnwyswDTSl8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7071
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



On 05-09-2025 00:59, Michal Wajdeczko wrote:
> We only use this macro once and we can open-code it to explicitly
> show relevant conditions and avoid duplications.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       | 6 +++++-
>   drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h | 6 ------
>   2 files changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> index 19786f64a7da..b01bb3660fb1 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> @@ -15,6 +15,7 @@
>   #include "xe_migrate.h"
>   #include "xe_sa.h"
>   #include "xe_sriov_printk.h"
> +#include "xe_sriov_vf.h"
>   #include "xe_sriov_vf_ccs.h"
>   #include "xe_sriov_vf_ccs_types.h"
>   
> @@ -263,7 +264,10 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
>   	u32 flags;
>   	int err;
>   
> -	if (!IS_VF_CCS_INIT_NEEDED(xe))
> +	xe_assert(xe, IS_SRIOV_VF(xe));
> +	xe_assert(xe, xe_sriov_vf_migration_supported(xe));
> +
> +	if (IS_DGFX(xe) || !xe_device_has_flat_ccs(xe))
>   		return 0;
>   
>   	for_each_ccs_rw_ctx(ctx_id) {
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> index 93435a6f4cb6..0df6b4130e7c 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> @@ -15,12 +15,6 @@
>   		___xe->sriov.vf.ccs.initialized; \
>   		})
>   
> -#define IS_VF_CCS_INIT_NEEDED(xe) ({\
> -		struct xe_device *___xe = (xe); \
> -		IS_SRIOV_VF(___xe) && !IS_DGFX(___xe) && \
> -		xe_device_has_flat_ccs(___xe) && GRAPHICS_VER(___xe) >= 20; \
> -		})
> -
>   enum xe_sriov_vf_ccs_rw_ctxs {
>   	XE_SRIOV_VF_CCS_READ_CTX,
>   	XE_SRIOV_VF_CCS_WRITE_CTX,
LGTM.
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

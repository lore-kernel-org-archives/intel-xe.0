Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E2DBCAC5A5
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 04:04:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED97210E033;
	Wed, 24 Sep 2025 04:04:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UjDzyZYX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBB9F10E033
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 04:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758686679; x=1790222679;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=NPdsAEFaPC8YbTGcZmr4s0+Zgm9eqU85Xc67Q4yvgag=;
 b=UjDzyZYXArAif6mhWiRmLfs3qiqaAEyopankfIL3gamtvjB4gabOn+2d
 sj0yl1ZFhGVGvW1rdVND8+/Zt4bxMI2Mplg5i241PTGKkXrnSqMtQ2vQq
 LS4YtHiKwkU0cSwcti9l+QBJRwkhe/v7dhQdD0r7zN5nngscUdtVrdJwa
 5qgr6z/O6T5qKilvhXcUtrb1CxA308sLKsuyVfMDlJELwqWeaau6/oEbH
 IR7kOT1Uhm/IekdfC6Cx5VmEJCzKqSonsTezzUSsxUuijYEMnCKFYGokQ
 WloJRiyto7C3nFDFNETa5/4/5itb7kSzQ3U5SpLExl2c/UVbfSJ/qSnNN g==;
X-CSE-ConnectionGUID: +GSFuBIdRi6bMW7InUxexA==
X-CSE-MsgGUID: t9U9+mRbTte2q+j+mjVdQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="61033509"
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; d="scan'208";a="61033509"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 21:04:38 -0700
X-CSE-ConnectionGUID: Sn1V3QeeT4Cj00yNmS/dSg==
X-CSE-MsgGUID: Iy1Zz3QJR0OFMaObSr1izQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; d="scan'208";a="177324859"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 21:04:38 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 23 Sep 2025 21:04:37 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 23 Sep 2025 21:04:37 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.69)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 23 Sep 2025 21:04:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PdThQtiPDfoJv1VGmAZmkRk4CVtfCj3rvlRWTWy71hKp6WaohLQ+y0faD8pIOgRFQK+XmuowDEjoCjFFJrQ08jEjEnqvZk9yVIO5bCiLgkXPvGI0oSBApaCmkj7lr2GbltZ0M4Z4xqcwH0u5gbTjX1LUYaK1MtrypJoi0hpZwvI1WFH7Ep0ghFz/uQJZuBMLQ1YFqUko7Nr1ng6kNndUSifQRpIPB5HGaj37MVB+edGllqIMc/zZyzu9/PRlkdK5nAvMYPTpNZs4MIggkubMfjuRt5RyY8E+A00rLGApGneXqWR94bmjKizHyJ6g48iSxHPdXQE44sVrmYTEE4ZJjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bw4FqVWLA71eqfCKO15DeAd2Gfhp+y8xscXeXGz/6Cc=;
 b=A9IJOspTxcypZK2+pnCzUXVCQFK1cRK+meY2FjltRw0cGVKtxUjpHuqt6/xSZAtzBHE2ncoJG1iy+uysV+EmlXq13yWKsnyqvzCyALnRH4AxjuQgdR5RJ6nuPeqRIXRaNomD3FewF6aZfxnHnANEzbPxbQOGEJYxVrLwRHAphAFZpf1MlyK7+HwMSDozZcyllNPigCzCXYz7/jxo8GiIQMHcm4SOGBBlCkXPaDSN3UVTaWxRESKql8Oryx1fzHoehsuU9YdH3oZZK8AIcgA78nnYjm6clxTTjOZHBtxiVKOTb5Oy608I6C8saHX5bmGNu1AFBNEUlhEij3x+TdfECA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8686.namprd11.prod.outlook.com (2603:10b6:8:1a9::21)
 by IA1PR11MB7174.namprd11.prod.outlook.com (2603:10b6:208:41a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Wed, 24 Sep
 2025 04:04:30 +0000
Received: from DS0PR11MB8686.namprd11.prod.outlook.com
 ([fe80::18f0:f1a2:9:1932]) by DS0PR11MB8686.namprd11.prod.outlook.com
 ([fe80::18f0:f1a2:9:1932%3]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 04:04:30 +0000
Message-ID: <5ff075e8-fb77-4f4d-bc03-9c06c99831c9@intel.com>
Date: Wed, 24 Sep 2025 09:34:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 33/34] drm/xe/vf: Rebase CCS save/restore BB GGTT
 addresses
To: <intel-xe@lists.freedesktop.org>
References: <20250924011601.888293-1-matthew.brost@intel.com>
 <20250924011601.888293-34-matthew.brost@intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <20250924011601.888293-34-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0024.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::10) To DS0PR11MB8686.namprd11.prod.outlook.com
 (2603:10b6:8:1a9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8686:EE_|IA1PR11MB7174:EE_
X-MS-Office365-Filtering-Correlation-Id: d01b9acb-9a47-4107-4b27-08ddfb1f7624
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U1l0dlVWTWkyUDRNL3ExbEthVTU3RmkyQW9OdG9icGE1R2Y3NzlIcWxYaFMx?=
 =?utf-8?B?cUJQeFp3RTFOSlBuclBBTVFKL2MycVRocHQwaWxEM3pNUjlzdlFLTGZYTVRi?=
 =?utf-8?B?ZlhNSGZEUWZ2NStDWFQwVU1XcVJQdmhNRE1hakpsL3RmUVAxRFdpckFVaDFY?=
 =?utf-8?B?YStUM3Buci9ORURZRjJTdXdIU3NqZG54S0N2bFlQaTNINHBySWNrRmIrOGo0?=
 =?utf-8?B?cFlKcS9ObmUyS2ZRYTNNNmlobXIxd2I0Q0xoa1hOa1JOL1FqcFNJUzVFNGJm?=
 =?utf-8?B?WSt6VEVjQXJiYWVlTUJVQmtEdTFvUmcvNzFXRklqZnFQUUo2QUZXeisxM2JR?=
 =?utf-8?B?dGpIYURaeTFodFZPeXBHRzZjaGxVbTRwd1JhTVhDa3l4eEVDSnNFc1dudXNt?=
 =?utf-8?B?bnZDSWVJWnMySFU1Szk5azVid3pXbTdEVWo5ZDNoU3M2eWhDaUppYkgrL3E2?=
 =?utf-8?B?dVVyVU5OOHAvYkpUYUNlL05EV3dDS2JVT200V09ab1RVK0t1RFBsb1NOQmNn?=
 =?utf-8?B?andpeSttRDRZYjBwQ1JZemV2ZlQ0Yko2UWtKdUVpV2d4eUxjOCt2bTR6RUdk?=
 =?utf-8?B?M2NXdmpLRFFEVjU1REgvbmRVSXdsYnhGYzJhZUY1MmFkOTdMc1VUNG02Zm9v?=
 =?utf-8?B?NWJ0ZVpOVE9uS2d5NDhDOUIyTWdvVGpXS0NDaGZqakJHNHhEY2NPaGxSTThP?=
 =?utf-8?B?SzhlVnFQZy8rTVhya3g0dHBaVXN5dy9yQ0pNcXJHOGFxQkhzNTdhaE14Ymxo?=
 =?utf-8?B?NTU0V0tPNEdlcXQxcHBQcG1YVndyWEsvVjRJTldBamVmRGhaSU9oRmR2MFg4?=
 =?utf-8?B?b045Y1BZUnNCM0FsUExCRnZ1akMxZHR1Vmw1aDQySzRZZndLOGtXTzdkajdV?=
 =?utf-8?B?bVpTdkhoQWpRZm9BTnREY2NHYlEzcHlUaGZqY0Vsdjkwa1M3cHN1WEw4RTlk?=
 =?utf-8?B?ZkJmZnlSaTVpMlJRZDRsNVpacWpIUnpibWx6VHhnQTlVdFBzWVBPWGlZZkZn?=
 =?utf-8?B?VUNOYVZzaGpMVXlHVjhJMTlCUFVDK1dHN0tnUCtLalQzbzFjdEcrNVVDQkNT?=
 =?utf-8?B?bG1qWFNBV1VQS3JsaFJnU3JTa1BKMkZxUFhETGh5Zyt1Zm05eXpDMjk1UDlS?=
 =?utf-8?B?MVZtOXc0emNFQVIxQXliM3VwZHFRanVoYm9zQW1CYXJ2d1BqUnhMTEMza0tD?=
 =?utf-8?B?TEkwQXhoR0RwTWdRZXdPUGNFaGdISmZWSTNubmpYbk94WEpBQ2I3dzVEdUtv?=
 =?utf-8?B?blU1N2svSUhDaVBGNVYybWJvbkl3SjNWRWUrcENLcmxDQVExdXoxdHNLSlpO?=
 =?utf-8?B?ZkdOeGdhL3RkSmtzamJ4YWc4U2Exek51dkpWL3NZWW9Fc1B1Tkw2aUFjM3Y2?=
 =?utf-8?B?NW53Z2xyMkl3aUlycllJYUZ5S0twR3JsbXJ2ZjVJSkxFbjRqOUNUdFZTc3FY?=
 =?utf-8?B?Rm5MbVBVbHRON0tMaWN3eG5NS01qV1kycmFCbE51anpXK2pMcXB1WnRsZEk4?=
 =?utf-8?B?M1VodytETmx5QmlvOHVLV2NDamN4d01Yb3o5VFNvTU5hQTNobGw2ZFZZdVFj?=
 =?utf-8?B?bjF6dkV3eTJSRzFBeFpOeXBISjlPRnBtczU4dHhEUVNJWWlpaXdhVTVPd0RM?=
 =?utf-8?B?TUxFUVIwT2lpcVFrZ0ZjcXBCSHpsNE5RMnp6elNnb29QZkN4MEcxd0xSUjVx?=
 =?utf-8?B?eFJvUjNYNXIxRTVOVUVRbjBaTDJuc0l1VjF4SkdadzMySTVRNmRqOHExb3kx?=
 =?utf-8?B?MjVxb2s1VXRPQ1pJTFlsbDhFRnIzWEk1YUZqY1Y1d0hVRWxoUk01UjI0a2o2?=
 =?utf-8?B?eDFpZ3JWU2dHbERPTDBuUEJCaHJmTWRheVpCaVA4b0YrTUMzQktvMWRhQzRH?=
 =?utf-8?B?K2F6OUl0Ry90TXBrTXNBQ21RdGRobEJiTXRqSEdZdkdhd0NFNXBmekxPeFZX?=
 =?utf-8?Q?2HDevwuJaDI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8686.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnJTSlkrRlA5Rm9qWHRGbGh4VFZqa1h3MHE1SEVIMnE5SnY4aVVqajZSMEll?=
 =?utf-8?B?YzhzUnAwYzU5SFgyeUVqMzVxcmJNcVREQ3p5dk00Sy9kSmJYU0hsRitHZFk2?=
 =?utf-8?B?ZDFBRUZSVmNFQW0vK0Z3Zmg4cjY1elI4UXZZKzlxNVFGdGw3dllNYytXaW9J?=
 =?utf-8?B?NDNEKzEzQVpmcHVGN0N6d3ZOZ0RMYmM5b3JTcWFNb2tSMDloUnNNYS9OWDRj?=
 =?utf-8?B?OHNXTGYvWFhIOW1aWmFPaWc2MFBqTmJBczcvNjhrc2gvUm1DMEM5VWp1bENu?=
 =?utf-8?B?bUNsZjlIaExxYmNpcDJXWWJ4ZEhqQWNyQndsVzk0UTdkTnFlZnpjK3ZKcHEy?=
 =?utf-8?B?STNOeElSc0VMUkFVczVlc2pJRmp0S1l1Sk4xV0Q5K1BzdHVuTVpFTlhTMGVa?=
 =?utf-8?B?TG5aejBXUHlJVlB6ZktwNnBvbmUvbitkamdjeTJnK3pvdlZjR0FnTnJqczdH?=
 =?utf-8?B?OXIxTWZBTjdoSGlVOVJRZkdWK0V0NHAzMkhxWjVpRHlZbWd0K2xEWk9NYk9h?=
 =?utf-8?B?c0VESlo3U1NDUHZpYzFtVTMyMVE4SXlreDBTVnR6YWp4aHBlaUQ4bnZMSUU3?=
 =?utf-8?B?MGdQUXZodmExSm5COEc0dnpOVGV1Skk2dytSVWRjZElhSzhhTk5BTG1hVDht?=
 =?utf-8?B?MFcvSTJ5WlE5RHVHQ2YwK09VQjZXQ2YyNnlJaDF2NVlBK1ZrREdXQ1Y3UzJF?=
 =?utf-8?B?Wm95M0txN3VnODFmRDQxV3l2Ri9TMjUvSHozR2d3d2JyTkxTdUtsNmdPUjlB?=
 =?utf-8?B?Tlg0SUo1SVpLL3dZb2V1TFppbUFldEJXRkhKd0NyZWZoT1JWckNoU2x6M0pz?=
 =?utf-8?B?SG55Y1VPY3VHNHUwbFBvaERYK3orME1uOVJNeS9nSW5YTWpPQlFnL1ZCVXFo?=
 =?utf-8?B?NTFiSHdoL3VkQjR4Qkw0clBOanEyRFJ5bW5CR1FFMlRhOCtDampFQ09GemtN?=
 =?utf-8?B?OERaaWdPV0x2cUoxN1N3M2NMb0JEd0lhV0JJOGJvRXNpZnBmQ1hOWGFET1ll?=
 =?utf-8?B?aVRHWFVMay9ScWxWOS9xMXVUKzB1bXJpTlVIVitQWFlHMkUvbmVxbUk5Y0tX?=
 =?utf-8?B?Ylg5WnYvRml0WVBhMk5xR3FTdWZKTnRLdkFxbTBmTG9WSFd5M3EvcEphOVU3?=
 =?utf-8?B?alB4b1h4SlY5M24vVXhtSmY0SVNUME1oejNjWWp5VW5zNWxQL25ZUjE0TFY5?=
 =?utf-8?B?eVBnci9lRC9IR1NENlk2T1NpNWhmQU5mVlhWMUU4MkNrdjRFVzFDTE44QTVE?=
 =?utf-8?B?MWlzUVJtdzZNRlRqYTJWbldyR2VtNG5UUW9VcUJEVWFRaHloeml0RjdBU2k1?=
 =?utf-8?B?eTlodVdQNVF6ekNDZ0cyajVtSFhuUnJoLzhibmdiNWxTZURXMnVja25nVFhP?=
 =?utf-8?B?UytmdTVHQ2Y1Nk14NU56U0tYZkVpTlZBejBzMURRdE9tVitGUTIwejNndDNU?=
 =?utf-8?B?OTJHMTRVb1JnWC9QUmIxOGt6Sm9DblRDOHE3ZWlYV0Jib3NvM3RMSkgvRGd5?=
 =?utf-8?B?Z3VDc3hmWE9SKzkzY2QyL0U0akwyTlhkS21KSmZjRjhEeTVLdTN2b0VtSzI0?=
 =?utf-8?B?b2JnZjhreUFyaTRWL3lFaitIcHc5T0hWK3pub2ZUaFdUbU52cnAweEk5NTBK?=
 =?utf-8?B?VnBhRi8yTXJPckMrWVZJVS9ubnkxRUJoMzl6cmxnM0o3MkhrM3ByMzFwVlhq?=
 =?utf-8?B?d2pyR2ZTdStMb3N2YWFHV3dMaEZRUVhteU4vbVRibzAzdDlXZS9iVmtwQWMy?=
 =?utf-8?B?ekpmNmhZSi93cHR1TEpIblhPUmxRT3c3QW4xa2EvZVNIOVJKU3JvTFI4aDdv?=
 =?utf-8?B?R2l4MFpvVWhUREMyRy9WNDdUZ3RzNENDYVk2YlNoRTRpTEFzVndtQ1ZpNVZ1?=
 =?utf-8?B?SnY5YjI3dDI2M0l4ekloK1ZYNXZ5L1NpTmJsZEZaenZLNExWZG5JWjROVUZt?=
 =?utf-8?B?NVNFK0VSV2ZVN3pmWFFQT0FoekxLTEUzY2xUYzFiZnQrQWFqSkFWOHBQbFZr?=
 =?utf-8?B?UjVkN1prSjgvNEFwTWxwbDlhRWdBbm9lc09GUGxYaVBraEFTTHNJN0hzN0R2?=
 =?utf-8?B?RnpYTkZON1UrRnRaQWI2dytmN290OEd1NlBCLzRmYldjc25MUEdteW10Rk82?=
 =?utf-8?B?NGJ2Yml3eFhra21XNG9GNE5UdTlXQWZ5SU0vU3QwMzNWUDhrdzIxTmtkRUFk?=
 =?utf-8?Q?zzzwudM+DO+NKWdAtFFTrmM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d01b9acb-9a47-4107-4b27-08ddfb1f7624
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8686.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 04:04:30.2736 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UW2+NC2fH9s++9SBRcdJwp1qXBVZk2fMRAp95KlHiel2eTEwTXMYBtvmQt6SVWqAXWCTi4sE+rUGRkNG9mgq58H4KlVkaURUEd5xO+GcEo0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7174
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



On 24-09-2025 06:46, Matthew Brost wrote:
> Rebase the CCS save/restore BB's GGTT addresses during VF post-migration
> recovery by setting the software ring tail to zero, the LRC ring head to
> zero, and rewriting the jump-to-BB instructions.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c  |  4 ++++
>   drivers/gpu/drm/xe/xe_sriov_vf_ccs.c | 24 ++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_sriov_vf_ccs.h |  1 +
>   3 files changed, 29 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 46d1d1fa91b2..d8d96dd76c73 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -34,6 +34,7 @@
>   #include "xe_pm.h"
>   #include "xe_sriov.h"
>   #include "xe_sriov_vf.h"
> +#include "xe_sriov_vf_ccs.h"
>   #include "xe_tile_sriov_vf.h"
>   #include "xe_tlb_inval.h"
>   #include "xe_uc_fw.h"
> @@ -1228,6 +1229,9 @@ static int vf_post_migration_fixups(struct xe_gt *gt)
>   	if (err)
>   		return err;
>   
> +	if (xe_gt_is_main_type(gt))
> +		xe_sriov_vf_ccs_rebase(gt_to_xe(gt));
> +
>   	xe_gt_sriov_vf_default_lrcs_hwsp_rebase(gt);
>   	err = xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
>   	if (err)
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> index 8dec616c37c9..bffad45e655f 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> @@ -175,6 +175,15 @@ static void ccs_rw_update_ring(struct xe_sriov_vf_ccs_ctx *ctx)
>   	struct xe_lrc *lrc = xe_exec_queue_lrc(ctx->mig_q);
>   	u32 dw[10], i = 0;
>   
> +	/*
> +	 * XXX: Save/restore fixes — for some reason, the GuC only accepts the
> +	 * save/restore context if the LRC head pointer is zero. This is evident
> +	 * from repeated VF migrations failing when the LRC head pointer is
> +	 * non-zero.
> +	 */
> +	lrc->ring.tail = 0;
> +	xe_lrc_set_ring_head(lrc, 0);
> +
On lrc_init(), the ring may be pre-populated with some GPU instructions. 
Should not we keep them as it is? Making tail=0 will overwrite the 
pre-populated GPU instructions (May be some WAs??).
-Satya.>   	dw[i++] = MI_ARB_ON_OFF | MI_ARB_ENABLE;
>   	dw[i++] = MI_BATCH_BUFFER_START | XE_INSTR_NUM_DW(3);
>   	dw[i++] = lower_32_bits(addr);
> @@ -186,6 +195,21 @@ static void ccs_rw_update_ring(struct xe_sriov_vf_ccs_ctx *ctx)
>   	xe_lrc_set_ring_tail(lrc, lrc->ring.tail);
>   }
>   
> +void xe_sriov_vf_ccs_rebase(struct xe_device *xe)
> +{
> +	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
> +
> +	if (!IS_VF_CCS_READY(xe))
> +		return;
> +
> +	for_each_ccs_rw_ctx(ctx_id) {
> +		struct xe_sriov_vf_ccs_ctx *ctx =
> +			&xe->sriov.vf.ccs.contexts[ctx_id];
> +
> +		ccs_rw_update_ring(ctx);
> +	}
> +}
> +
>   static int register_save_restore_context(struct xe_sriov_vf_ccs_ctx *ctx)
>   {
>   	int ctx_type;
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> index 0745c0ff0228..f8ca6efce9ee 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> @@ -18,6 +18,7 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe);
>   int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo);
>   int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo);
>   int xe_sriov_vf_ccs_register_context(struct xe_device *xe);
> +void xe_sriov_vf_ccs_rebase(struct xe_device *xe);
>   void xe_sriov_vf_ccs_print(struct xe_device *xe, struct drm_printer *p);
>   
>   static inline bool xe_sriov_vf_ccs_ready(struct xe_device *xe)


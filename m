Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A309606A33A
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 07:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iTY4Ue/r;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=jE6pQJey
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 595A710E2BB;
	Fri, 20 Nov 2026 07:48:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EE0410E2BB
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 07:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795160898; x=1826696898;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=8XHtSHBO8Ydd5QIQRsM2SWpO8Ia5ZY1CgyX4fPf65Z0=;
 b=iTY4Ue/r853wUr6eRSLefrJiG1dAmcvYvw+QyJTrF8ZNDzatIBZ0njR9
 Jy7jIIvneBY/PSwOtSysY0GIR/N9pYsW3n5C3iIJfA8lqw2TTgfLHUnv8
 b014hot5kLwBEeiXTfaT+06l+BKdoRQLXOmMvBm6tk1GIHq5MYL2wC8NS
 nEkxe5j1FMm86gmwDmWj1GOSiNebcoLt5YAT3XP2ho2mT5E27HKVVi853
 pQ9qcV5d+Q6l5wKfc9NCmh4128MDAvZV7fhVel6qThCK5TGmExotGsa5X
 CDN/flpCueCSyI65lysHISovlY2DIjsxHVJgVtMVu5jOJsrUwE/xDRCgm A==;
X-CSE-ConnectionGUID: TuplGwxAS6KrnrGhjWiMiQ==
X-CSE-MsgGUID: TYaXaCqFSV2R2gUPQWFUlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4078629"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="4078629"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 23:48:17 -0800
X-CSE-ConnectionGUID: ZJtuLhtdSSOf86YuTH9MEw==
X-CSE-MsgGUID: UnkHWmfvTFKBvXSSncjdvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; d="scan'208";a="10652668"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 23:48:16 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 23:48:15 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 23:48:15 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.54) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 23:48:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KCZ4BqjSTzvDusWCXZX5WprEhAW61AzZP0PLkWj+B2aE/BuXBBbYpr55wryEtdWa/mTPnEbQBIwUImCQ01PgGCG0N2uneTRrJ64hdC4knBKp2FqcyHW3JEmpVB1hf7qtXI0ZkiNvlPHhNEiJr98W1d0Sy2QfGpp0xlnpnpllyG0TH/lmg/8hJqzYv5AI0XS14FLAULwTO5pLALpcNB4IhAGQovBckocKhZ5QJDv0NSZpleVmjpG7wA2hKnuKhhAJx7nUyl/L7Tyk8UQmMdUcj24yiEVXpKAI2h0Bav7b5sW1r+MhdeNxfidY38LmwjXGBzc7G0GZO6vudp+ig1i2JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qSUxsuRK/JmvpxMX5FGUqvy/6ujhp2HoHXL4DwTgTcc=;
 b=NYzr50UISzGifmQFyRULydw4rYdZ7y686Kb2G6XBplfXB6jz5+QtPNWU8R1fhdB2HSMaEpO1GPuqJ5Ie7SYZmx3pOl/JazyVRCzjkoyQ34LHvNSAkV2s3z/FyYkcaxJnK1E3oCO3JmmtoeOnLrlS+OpAKzEckxbKaOLBTs9B5Po1HffHW4aC+7vy0ahA8PzWclESOSSVwMDzf/Gg4R7PkguXBMcw9noGY0cqxge4rdvZdfAHiH8YiRajSkinmCxSCgLDtVKFqesu26xTmI8bahsmai5YoIThuOjunLcRxOI4/dW6A/g4wLih6xWPo3SeBlqnB18sG3v9CJVRHaF+Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qSUxsuRK/JmvpxMX5FGUqvy/6ujhp2HoHXL4DwTgTcc=;
 b=jE6pQJey+VRehs7QGw/CMBjeEqHM2B8z5dMFg6Qgy7kJZnXnzgDPt5SLqLBbgS06d2MX6VKBIblCUitWyLEkIv9ljrBYTBYLXnrXu2g9o/zJA0IsS51ecZHAOCWVWS8mtTKFbcSCj0Bf7ifsbqIsxj3kby7IRNFvBW4oYIk/ceY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6468.namprd11.prod.outlook.com (2603:10b6:208:3a4::18)
 by CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 07:48:08 +0000
Received: from IA1PR11MB6468.namprd11.prod.outlook.com
 ([fe80::c69b:dedf:a089:33e5]) by IA1PR11MB6468.namprd11.prod.outlook.com
 ([fe80::c69b:dedf:a089:33e5%5]) with mapi id 15.21.0615.012; Fri, 20 Nov 2026
 07:48:08 +0000
Message-ID: <1334be6a-b10d-48ba-acdd-81b54e0cc15b@intel.com>
Date: Fri, 20 Nov 2026 13:18:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/xe: Add MI_SEMAPHORE_WAIT_64 instruction
 definition
To: <tilak.tirumalesh.tangudu@intel.com>, <piotr.piorkowski@intel.com>,
 <jesus.narvaez@intel.com>, <daniele.ceraolospurio@intel.com>,
 <stuart.summers@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20261113155734.4164230-1-tilak.tirumalesh.tangudu@intel.com>
 <20261113155734.4164230-3-tilak.tirumalesh.tangudu@intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <20261113155734.4164230-3-tilak.tirumalesh.tangudu@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0183.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a9::10) To IA1PR11MB6468.namprd11.prod.outlook.com
 (2603:10b6:208:3a4::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6468:EE_|CO1PR11MB5073:EE_
X-MS-Office365-Filtering-Correlation-Id: 763a4a16-54f8-4400-8e5c-08df46da9e02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|4143699003|260925021911599003|11063799006|260925022911599003|260925021311599003|261009223027099003|10067099003|261021121427099003|261102123227099003|261022105027099003|56012099006|261028144727099003|261022075727099003|261022113327099003|261026140227099003|261026121527099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: zdwKkbkhIONZpR9ZROMVlEZjKHK7byU8SEiqNJxdtDj1UrpEPMu6jE0D8rDiN+Sts6AeYmCt0f26XP5XQx7hzNdhevl0NQLc/28DkE9UWkxT32ORykBotTcETz87BaBLvZiIqCvZI8xB3NlBzk/uzYtl+/RrIAklI/LiHt7p9BcoUWw/ckJ1/xdJjPchvaTMbUoImYlHoLz1rJvFU5fbptoGZZBEsH9KgPgO+KxKe+lbs+de0U86hp3gPfwqhgYLhtR58mST3xZXjBQruu9SXFZtW0B06QD5KIkC6PjECirXsbCFz+vl6N7csDeIgRsLIC3pMVxF1pVcm98okf2S9ujZA65yCDEbVBpaiH8DlP+fFA0gskmWsz3dc+SNGFEEtNtt18omAg/LoPUSueOjPfyX4Ndp11xfF6QRLPHVQtrSAGXqCgttU831xQwgnjy2r6e1zWksCnGiOclhre1TIVwpOUTZHWO5wjn1iPAd7M82OYgWNF9jC8psWQhhiAOa+Jwb9La20nKJJuw18wt/BkYHkYPFiCxDn+2WG1N61KIZLHcRh0ZOEmIswkMIc/3YEeOHM9mVsYpQ0YOEP3EZP6JrT+byDCSyQMytwGgcwjet2ss7ByDVl2lXiypW9xH7nr8VhrlQFvhPc4yrqJcHS8TRP8IHAVWIp9WEHLE/vWg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6468.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(4143699003)(260925021911599003)(11063799006)(260925022911599003)(260925021311599003)(261009223027099003)(10067099003)(261021121427099003)(261102123227099003)(261022105027099003)(56012099006)(261028144727099003)(261022075727099003)(261022113327099003)(261026140227099003)(261026121527099003)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGVKbWR3S21xMTlpbEtUdmlicHd6cXhFS0J1dlI4VUVhU1JCcm5PWmFCd05Y?=
 =?utf-8?B?aEdZYTcxcTNaaUx4Ny9oMjB6eExaZm1BWjMyUEFObm9XTDlKRWpiY2d5N1Ft?=
 =?utf-8?B?TmE3TjM0NkVSdlM3UHNKOHpqZnRHYjgzbXoyUVA4YTlxN0NjdWlaZXdBUmov?=
 =?utf-8?B?Q2JFcVhubVdMWVZUQlVrbjh3TkhFVnpwSTBoamRhdEVGQVJtN1V2UUp4ejdV?=
 =?utf-8?B?VHBnWm40d3MvbUhZU3VEdW5JeVYrWWZuYUEydGJqakszdE5ZbUJYaUlSZG5j?=
 =?utf-8?B?UGlId3AzZFlkOU80QmhOanZ0YkNXa001bmd4emlscFFBTGt0QnNQVzRrL01r?=
 =?utf-8?B?bVQyRTI0M00zT28wTGFMdS9xLzg0dS9RQWpmMzQreHBvSVViQmVMR2MvZWRX?=
 =?utf-8?B?ZzNhbS9aZk5FT0ltRXdIYWdBZ2NzMjR2eThQYW9LWVNUbFhsV0FUWklLcGM1?=
 =?utf-8?B?bGZBWXJGMitzMDg2eTFGb2xRaW5zYjdIWG9IUjcyZ3dYSW5UY1RUNWJEZWcy?=
 =?utf-8?B?ZUxLbVFaWFcvUGFVSG4rVkE4Qm1XbUM3Z2tFdVZWYlNQQ3ozWlRQalczOTlB?=
 =?utf-8?B?aGVrdUVLSGoyOGRmZmQvbFlUVC8ydU1NUERlQUlGY3VrdmFDUzR6eVdMTUIr?=
 =?utf-8?B?czZJTVJWSlA3dEd3bTE4WVhVNGV2S1VmRTVjc3FsSmZ4eTNUM1c2WnFDVksw?=
 =?utf-8?B?STUyY0tEZGxCL01pa1NFVnVXWStWVzl3R05LQWRLeUt0UUxIdTNNQVZBMWJI?=
 =?utf-8?B?RFNya1VuUkIzQmdmQmRSZWthOHo3a0FHdW4vdHVaRXRYM28zajNJMDNkNVQ2?=
 =?utf-8?B?ZFVYWnVhOVc5QjZhemF2NUY2YTZiVGNodm10enE2Q3AyQXpJMzJpSzd6TnI3?=
 =?utf-8?B?Mi9SR0UxdFBwSkJOWDExL1krVFl3ZTFvZytQaTRtUFptTnIra2pyTGlCemY3?=
 =?utf-8?B?VTNpTkR6VC9UZG41bnFpSGVyRGhYb3NJRVZKUGhDNlgxWVprdTRiWnAwY1lY?=
 =?utf-8?B?WGdMaDlIVi9ya09LZ1F4V0dOaGZEbDBmdjVEWDZ4cGRGaXg5aElRY3ExWThK?=
 =?utf-8?B?TjhpaVJETlR1YTVaMU1iajV3VFBvM1d2dTFJVXJXWHROalpCYy9NRU94aEcz?=
 =?utf-8?B?UlNzSzgreUNZSjFvRWN6UUJBV0NQem9ERVpxU3BPTnNMNjVSOXQzSEZKVFl2?=
 =?utf-8?B?QkFmdU13OVlHY3p6ZGRLVU13MHlPK2hYK0h5UUN2ckc5NVR4eHNQdExMMEZo?=
 =?utf-8?B?SEo2eW1ZTy9BVnlZeVowTHZHRCsvK25qR3lpcDdKOG8xSnJEWGJ3aVVxOHdU?=
 =?utf-8?B?cjhvakpuWXAxSVkvWDJWczEzNVQ0dEF5RE5IK2s2MVNnMXVGK0lpMC85b0E3?=
 =?utf-8?B?RWNwM1N2cHBPR0hJTE1Pd0hPcnl4RmNtQTBVQzQ4MWtpWTlUS3B6TGZSa0U2?=
 =?utf-8?B?blp3d0tnMVhQa3l4WWlXM2dpNDN0ZVpBVzloR2NiYitRWHpJN1hiWE5CQVNF?=
 =?utf-8?B?QXYvb1ZENWpjVXFPNGV4ZDk1aFlkZmplZGlKWkIzUzkyQjBQY0dmRUFUd0Fr?=
 =?utf-8?B?enNNZnUwL3pWSXl5Ti91azlhSFNXTGFheE5XWTdLd05nL0N2R1ZvS0NmZkNK?=
 =?utf-8?B?UUJRZllrUkRydjFSdzVLYk1BZmNEWWJzV0t4a0QxNTlRa2NrUFlHcEsyendh?=
 =?utf-8?B?SVpTeWl2RDErWVZFOGtucThBUDRXWDJOWHR5dElOUWRrSkQxem4vTmdzRllS?=
 =?utf-8?B?RngxSmVwb1l0dDFWaW1qTFM5Ui9PaGNxSTFxUlFPYzBiYzc3N2ZQTFF3cWwy?=
 =?utf-8?B?K0oxdjRZemp2aHNGUFFnY0JtcjZrNko4RkpuYngrS2xMODBJaTU1RnYzNEdD?=
 =?utf-8?B?VFNaeUQxWUprbjh5Z3RGYnIzVlhqYk90eE5MT2JTazQxZE1vYlkwa1RGV1Z5?=
 =?utf-8?B?NlZUOTRzSzRUaklCT0R2L0gxOEJ2TDhQU1RVVkt4dTZFdElvdEM1aTNodDJV?=
 =?utf-8?B?RUhibVdnMmw0aE1oUENKTU52S3ZZNmZkYnhHU3l5ek1nMXNmU08xK20rYU5i?=
 =?utf-8?B?Vm9vbEZLcjY1TGVOMzZVajc0S21iZlJLVlVERHpueWdWVitweHhzRjZXTVZv?=
 =?utf-8?B?bUJlRFNUKzNJTlVYcmZkYjBuc0tTam5kWGkxZHREcDhsUnQrRTNvTkphQ05X?=
 =?utf-8?B?K09FRzN5ajlZWHFOR0RMdUp3dy83dHpXMjN5YnJUYzFMRkZvN0xsN0VYRVJV?=
 =?utf-8?B?RDU3UTdXWkZTdld2RkY4YXRmVW5LYlhuSEx1ZERRaEFnZDVOMENzZ0RDUWg2?=
 =?utf-8?B?QkNCaGV6RG5GQUorQXNMRGVPZ0l4Tnl6T20wdERWdWFld3ZnNXpxL1VxL0s4?=
 =?utf-8?Q?xPLO91UBAjR3m7zI=3D?=
X-Exchange-RoutingPolicyChecked: MoLGLASD316eMG/pDs1TYi2cq86A/1wfo7/Y+Z+OGHNibGR99SpAgctKjbTCf+gOJ9vo9mHZBx2nt7M/VH0ss6Nwr2WcOy1DzoPe2HEAukHxmHP3PcCQUHLUU2ztRfOd2M4n9ZSFUUqNRt5tWRrtd3QK5fu5qRCp/Q7t9MkvOLaSRyLqinWAxFbI8Ztl4TAh6K9/4iMsVu5p+MJm/qZ9YA8zxU5RPaH8b6+u+BL5W5qqVXmIS8aL+QYFZByXx2O9u96gKRtUES3OVt8ovRuyRFKDIEo2w3Jn7sZz3DKwbrkUaV93BS6Yuo6jgq4DeJbmiRqxpYPmHu6yUt+VmiVedA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 763a4a16-54f8-4400-8e5c-08df46da9e02
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 07:48:08.2296 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2i3jxCVCNApXQ0MNJXk02CwVK0yvBKxVywYJGnk5QsMMTvMdTXtgCSJVk+p2/Dx5guTKxpf8YXcSys6blyWuSNH67CyDO2u2LTXSmuuwajw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5073
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


On 13-Nov-26 9:27 PM, tilak.tirumalesh.tangudu@intel.com wrote:
> From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
>
> Wa_16029281913 recommends using the MI_SEMAPHORE_WAIT_64 instruction
> instead of the legacy MI_SEMAPHORE_WAIT, due to an issue with the legacy
> semaphore on some Xe3p platforms.
>
> Assisted-by: LLM
> Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
> ---
>   drivers/gpu/drm/xe/instructions/xe_mi_commands.h | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> index 835ef75bbeb1..186c9ac35e5b 100644
> --- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> +++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> @@ -34,6 +34,7 @@
>   #define MI_FORCE_WAKEUP			__MI_INSTR(0x1D)
>   #define MI_MATH(n)			(__MI_INSTR(0x1A) | XE_INSTR_NUM_DW((n) + 1))
>   
> +/* Wa_16029281913: MI_SEMAPHORE_WAIT has an issue on some Xe3p, use MI_SEMAPHORE_WAIT_64 */
Do we need to mention this in the register definition file?
>   #define MI_SEMAPHORE_WAIT		(__MI_INSTR(0x1c) | XE_INSTR_NUM_DW(5))
>   #define   MI_SEMW_GGTT			REG_BIT(22)
>   #define   MI_SEMW_REGISTER_POLL		REG_BIT(16)
> @@ -48,6 +49,11 @@
>   #define   MI_SEMW_COMPARE(OP)		REG_FIELD_PREP(MI_SEMW_COMPARE_OP_MASK, COMPARE_OP_##OP)
>   #define   MI_SEMW_TOKEN(token)		REG_FIELD_PREP(REG_GENMASK(9, 2), (token))
>   
> +#define MI_SEMAPHORE_WAIT_64		(__MI_INSTR(0x3b) | XE_INSTR_NUM_DW(7))
> +#define   MI_SEMW64_INTERRUPT		REG_BIT(20) /* raises the semaphore-fail interrupt */
> +#define   MI_SEMW64_32B_COMPARE		REG_BIT(19) /* 0: 64b compare (default), 1: 32b compare */

Check alignment here.

-Satya.

> +#define   MI_SEMW64_INHIBIT_CTX_SWITCH	REG_BIT(15) /* poll in place, don't switch out on fail */
> +
>   #define MI_STORE_DATA_IMM		__MI_INSTR(0x20)
>   #define   MI_SDI_GGTT			REG_BIT(22)
>   #define   MI_SDI_LEN_DW			GENMASK(9, 0)

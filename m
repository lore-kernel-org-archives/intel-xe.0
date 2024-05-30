Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6DE9C27C43
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 14:44:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C82710E52E;
	Thu, 30 May 2024 14:44:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CsL9FOau";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D9C710E52E
 for <intel-xe@lists.freedesktop.org>; Thu, 30 May 2024 14:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717080272; x=1748616272;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yC2yqIksCCNezk3RZpp4dt1fwlDxyz7IZyZvcXIUSu4=;
 b=CsL9FOau1S6m0jVj7dLYp4lnB6L16Dv0oL+IUwyEOoAxdRarFvzzU/2S
 eB2x+ttEvkjLwteixvCZRXjGkiZ3fpHdUJPk7666PH96FZ97fGNYVxo9L
 N6P5G3eDkrjeLfrxJ46Xfb03hZHLqMY1ro/sDFQsgGLs11rMGmjuW/pa/
 D4xzxQdiLnfVH+JOaKzTkK+SFMz7J3v+AxyL5xNOfUP1g6Ct6uUT2QE9W
 CViuc/R11TDhsU8FH1sSsQnxU086Xp565TK5Eu9CzE5CGcDYFENUf5Xs4
 7EmNTdT6vnbDopFPyNMTc/yAnTg7vgETAVDj4LdzPmsLXbqxDG5osPRd6 A==;
X-CSE-ConnectionGUID: Q/fKgdRjQ1Sibu51CUjROg==
X-CSE-MsgGUID: WtIZA5cASsObqp8H7s3aYw==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="11811137"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="11811137"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 07:44:24 -0700
X-CSE-ConnectionGUID: 9dt6JC/CQWiIQKRIVMrikg==
X-CSE-MsgGUID: 5xO3ss0eTyem2Wqybm4ogQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="40282499"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 May 2024 07:44:24 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 30 May 2024 07:44:24 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 30 May 2024 07:44:23 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 30 May 2024 07:44:23 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 30 May 2024 07:44:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eb3mranInWBugSvTJZ2GlMhBjtL5yx5UByiFXtofIp6/5Ef3Dv9ZeJ3qiLWOBQFd/jfszAQPBfIQlSR1cRQdQgSpNHUaK8CLNx7nu1Idai3LWDk5Rqdb03NNd5Juplie2fVhhPuXAIXjMVbfxnq289GOVqqrffiLSUZyiXyUCWa1T8uk9ljSWsAS8tCtS6m4TkF/dIYQOucgiqiIslSsS7H5fhiKnX4FK6HALjO+U3ljXaotmMMOrN5sVZl44/I3DHcayMDsJggQ8B8ERyvx93ywMkKi85a5y3Mhok0NZf5BYTyDAPkX//uicu0jEvZJX0UJBkDw7Z9sGr4RSKRW9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xSQAhAqkO8W2jKMKUzGBsrKiFGECYBSz5WTMDIg5DM0=;
 b=JJyzokqdYU8A4DEDmK7Z0hHfoDS4z6S3+ON4cOmWMDFFJpUWBs28oalOn0mNy7krxc8NKeeL95qTYIkSt1gyhY6K8c429LMoFIBNWvn1Ajqq+S9pCWj6qkP9gpTmZGjam9zOaf/w0PLn7i8GfHWmAaCpBU4xhoOmUomECzTMaQxEYbPq3bQ0S+5dEzz+FtoVo6AUhMKT3RzAcgFim5fzzV2VFiSCVUWTiz1uHfhlqXlQP068lYX+2X6q+mqLQEnnK2/5nj5hBA50avhB/wxBRdsGGrEspYWJaSmxVl6C/YwWzNP6VmIv2vhUENgnQhY8pnN84Owgn8fDeY1uzDOY4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by DS0PR11MB6422.namprd11.prod.outlook.com (2603:10b6:8:c6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.20; Thu, 30 May
 2024 14:44:21 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%3]) with mapi id 15.20.7611.016; Thu, 30 May 2024
 14:44:21 +0000
Message-ID: <00281173-2316-4c6a-b69a-02b6902e08ec@intel.com>
Date: Thu, 30 May 2024 20:14:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fix xe_force_wake_assert_held for enum
 XE_FORCEWAKE_ALL
From: "Nilawar, Badal" <badal.nilawar@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240530142533.875437-1-himal.prasad.ghimiray@intel.com>
 <40338a61-40df-4d29-9960-e0f96e9c9e8a@intel.com>
Content-Language: en-US
In-Reply-To: <40338a61-40df-4d29-9960-e0f96e9c9e8a@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0003.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::16) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|DS0PR11MB6422:EE_
X-MS-Office365-Filtering-Correlation-Id: c60e1812-6506-4283-9204-08dc80b6fdfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c2g1U01kQmE4Q01sL3l6R2k2S1lWMjN3b0x3SXVPcHcyMWpiamNtVFgvWDBD?=
 =?utf-8?B?cWJldzdveThYdXRGNkFGdU4zU0hhcEFJN25XQ05kTnRIaTV5UU10a2xlRC8x?=
 =?utf-8?B?eUJhUi9Ebm1YeU1GUGxEcWNFRmhoZ0lhTUdOZXZNcDYrRGVwRmdQeWRMMG5K?=
 =?utf-8?B?eVRhSE11ZnB4MUs0b2FLQkoydXJ4R1JWNWtpamE2VEk1WkVPMUwrZ0NwUGVj?=
 =?utf-8?B?SmVybVZFTk9nS1dyejBLeEtpRHdPM3FYVEFCR3dEZW9uTXA4YWhRSFJSNWFQ?=
 =?utf-8?B?OGs3V2pNb0dsRTdkUDQ1ZG5ZYnBTQ1E2RWZYS2UyaDVzdFY4MmdScFh5b21W?=
 =?utf-8?B?bEJTVnNHdnVlUXpSVDhreXZjbmNPYUtxamtRRzJyUk5vcSszRVVnb1VCVWpH?=
 =?utf-8?B?dDhGSVRFVDlRemtuVlhNOHprMzhsaFIrVlRKSTRKSC9wSlJRUEsyNUdURk0y?=
 =?utf-8?B?dEdTWithY3pJYTNUbnRiYW5YQTdEVjJXS3lOZ09LM0pva3k5ZFRrMmsyZ0hB?=
 =?utf-8?B?dFZlcG1nZTYyQlZDczByZmFPdWt4aG9zK2I3MVhXdXRxR3NKbmlwbUpHVDlR?=
 =?utf-8?B?cUxXREVjNkhxKzVWZ1JqOWZveVlGNmdJUmdLSkI0cG44c1F5RDZSOHc4YzJO?=
 =?utf-8?B?Y3BKcytIQmdwYVdHbnlGWVRidy9SVU1zNjNXMjZtcVJzdStsSE5mYS9vNTBD?=
 =?utf-8?B?dVNPc1kvY2szdSsxTEVmelBaTzdjYnllRHRvQVAzdWZVYkMzZmxBRFRtYlRw?=
 =?utf-8?B?RUV1MzhCclhqQ3dTbktadnBzWW5OYkR6ODBNVWNZNFAyb0NXVDRMR3BaN2Jh?=
 =?utf-8?B?ZWNQZGdEcHZJVXFtZ3ErWGp1bDdvQUlhWTQwTEV2SFhrQUduYzRVdGwvR0ln?=
 =?utf-8?B?TDMwUUFaeFpYcVVzZWw0aXJHRzRwV2R0UG1wQ3pTWkk2Y0ZBQlRRUzBVL3JK?=
 =?utf-8?B?eE8vYmtFcFBQclBnMWpKTXRZc1ZRZjlJbGtBc0dDNkNXb2w1OFdEcmtzSE1y?=
 =?utf-8?B?djg5VVVDanQ0SWplazZzYjRLWmxlR3I0VWt6b1g2Uk5DZjVvYzZ5MTBkWW5y?=
 =?utf-8?B?d1hvcXkwVGRKNWZ5cTJnbDFJOHUvN2l0cFl6dWFzU2d0ME84SVA0ejQyYmdm?=
 =?utf-8?B?dHc5WWNrakhINmNaU0IxRXZIa1NxZ0RTVndIKzVLY2k4YmpuelJnWkFqbEJI?=
 =?utf-8?B?MkdOM0MxaXRnV0pBZTh6bG1Jc2R6YXlxc0V2ZkRqWE9uU053QVBEVFpPekZu?=
 =?utf-8?B?MXRhTjhUT0N5Mk9VY2lmelM3RkJqdUtnSUdERENYcTBqdk5DcjBrV1VmVytZ?=
 =?utf-8?B?MW1HOU1MQjNrZU80NDJ6MjBWNlRETXN1VTR0S0JPcGtReFNUcDk4aGxUcFRZ?=
 =?utf-8?B?SExQcGY2dzJ3MllnTWExdnVCVG1tUWpOK2UwMWV2QTdEdklSdkJyaGN2M1l1?=
 =?utf-8?B?d05QTWNRbEhGSHZYdjF4SHgvUThPQURORUlwVUhMS0hVMVJiUGlHR2cyUHl0?=
 =?utf-8?B?Rmh1UzFGMHdFa1lySVpoODZjVmwvNUozRFVIUXhFZEg3c0V2bFFMWFVweFJI?=
 =?utf-8?B?ZTd6SE1WK05SZGxpYVVPSjNzcHBJaEMzUGcvR2VTWHBYa0pHbEFjSmpyTWds?=
 =?utf-8?B?TkJLMWNHLzdEQXNZRWQwZTBrb2ZwWUtpSUhUWDVaczRCVjRsTWFrelFWeTZP?=
 =?utf-8?B?RjdSYkpDdDFiL0doRWhYaThOSXFsWDIvVEZyelV0d3VlZXhRYlYvd2lBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1ZZWnZpRHd2dFVsL2NYdlpKZzFzWDVkVytqMkp6N201a2ZMejBSN2R6TUpQ?=
 =?utf-8?B?MmZlbkFza1hZTzVVTUt3YWFBMnpTbDlVcis0U2JucEV1Rk9aRi96clIwekJs?=
 =?utf-8?B?N2w5RXpNUFVnS1ZUVzJwU2xkQnYvV3RPY0lMQWp1RGVFVVNQaUlWS1FpUWdv?=
 =?utf-8?B?aFIzNStiZlZGcnNXMmRuUFFzSGlSaFZwVU8vaXZzMVQyU0Q1VE9EL2tVNEox?=
 =?utf-8?B?b3QxZGwwNXd5Wi93TXdrQTAzeEU5N091TjYzUkZrd1lLbi9RWVc4SXYxZHJH?=
 =?utf-8?B?b0p2V0c2dHQzV3pWSW1OY1g3WU45U0FZUFVNcUVUai91dWthTlpaYWhYUXB6?=
 =?utf-8?B?UHpzRjlXYTY1MGV1NXpCNkpINDF2bXN2R0k1aEovczh6N2xoMlQ5aW11WENl?=
 =?utf-8?B?eGNBV21UdHNGZDBGTncwRjJyYURYVDJFUXdFdGVpK29IMGhLay91MWFjdFhs?=
 =?utf-8?B?bExGWWJUQUNXQmFuWm51S3B0S2t0MFIzSFVoT09EWnBrYTk1YisyUUFRVzMz?=
 =?utf-8?B?c0daSGJ0bEVCSEpDTC9zamdwVmN5cVFXaW9GeXR3V0FObnpxbGNncWhuNmFY?=
 =?utf-8?B?TmlrOURSTDhvRWpPQmpIYm1vM1BWb2RITnh6eFN0SkxYZDRVNG5DbURjalps?=
 =?utf-8?B?UkQ4aHlYRE5reS9QMnJlcElBQ1pUb2dNK1F1UTJNRlRzZHNYWUgxOWxPN2l3?=
 =?utf-8?B?Mm1wSDhSdVpEbkF4MnNCOGRrcWdrUTNhalhNZmU0VGlSMDVOWVlnM29ZWnZR?=
 =?utf-8?B?QUhqLzIzTlJxM1Q3WFQ1VFhPY2NPemFCditSbXFrVUVpemxNaERBaVd6ejZY?=
 =?utf-8?B?d0FPVjhQOXgvTU01TUtHMmovWjA4MFpUWEpQSmN5V3hRbVB6UFAzYlpIT2Z2?=
 =?utf-8?B?eFFYR0o4ZTRGQytKczJmOUI4RWtheXpadFRTdU5FUGJicEVsdW4wZjgrYzVz?=
 =?utf-8?B?UUg4aHJkbXFjKzZOZTNmUkZzdnQ1dXc4MW9ZR0RnWHlCZ0htbEtDb1F0Nk5l?=
 =?utf-8?B?eE5RZjg4Y0FHNEJacU5BNmNMR2tYQ0UzSjR2NWROQTJMRThhRmhBODhJK2wx?=
 =?utf-8?B?M2tsTjB3UGVMWjBZMXozR3dQeU8zT3FvckxZRTNqeTBMZlNVMWRYYlY4TEdK?=
 =?utf-8?B?YW5RendjenhaQUhBVDBYZEZqcVZCc2VTWXdGUTh4WmE2dzkzT2U3SG1GelZK?=
 =?utf-8?B?WWFOc25YK2Q0YmQ1VStZMmIzY2JEYkllcng1dkZMcmVkWW02NlhFTlU2elV4?=
 =?utf-8?B?NFBTNFVOTzJJdXlTYVpnWDdlKzFSZ2ZHQS9meTdDMThaRzlhaWtBMlRxTWtr?=
 =?utf-8?B?d1VPVGxzaEZuWXl3NmFIVFRxMXJhdDFHSkNXNi81c2Nxb3JITVZoazRGNDdy?=
 =?utf-8?B?TEJiRHdmcVBqckkzL1ZMS0hHMGRaUDRTYTdJbC9RaGR5RXJJOTFXYitVb3p1?=
 =?utf-8?B?djIzblFhVkh0RUpFTytUQTUwL0xnS0ozbklDb2hJK3NtL25hZ2VOdFA0azBn?=
 =?utf-8?B?dEg5ODVKWnpaZVVYZUJod2xjblh3NFpnMmt5S2xaSUVnR3dNOVhHcTNnKzFi?=
 =?utf-8?B?SVUzZmpzeFRGMFZGcGdZUlJoWUtuZGp1KzhKaVAyVFlRd0NWV0VJejVjTmpM?=
 =?utf-8?B?NEYwZjJNcS9uNnh1ZmNRTC90RU90RU5ndHgxdFlIU1J5a1N3WXM3VEJIUCt6?=
 =?utf-8?B?RmN5VmdKcVZMYlZYZTIvOEhPdktsV3A3RGdobzB3d1R6NXpYdDVPYjdGV3Ru?=
 =?utf-8?B?Z0N3K1c2bkZ4S2pGMEZvcGlvK0xsK1NHOTV4R1lFUTN2S3FBdTFqSm9aTGVR?=
 =?utf-8?B?cHh4MklRMG0vZHh0NzB1ZFlQWXRDdGpaNktoT2FhV2lLb2YxUWNTUnp1cno3?=
 =?utf-8?B?U2J3ZmxkdVNQTGxBRWVYUmhqK0VrVjh2dFpGMmsyRDQ3V2RpNEo0K3dYeklh?=
 =?utf-8?B?SUNJQ1FsSXJoT25sSUtKWFE4cGlPN2lnWG9RQTRldWtDN0xaV1lHR2JnR01O?=
 =?utf-8?B?VFdHKzhHZUFNcWNiRktkS1BBWGY3bTJCN01RRklmQmlNUnVFTXNaNWVRdkcv?=
 =?utf-8?B?c215cVZsNUkzZzFuZGdmNU9lbjhVZ09PZ1pRem1tZ3FEY1VPMEFNNDRHekNI?=
 =?utf-8?Q?VICFKaa55B9oXwxKuUwPw8Yzu?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c60e1812-6506-4283-9204-08dc80b6fdfb
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 14:44:21.6557 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bhw5WLFiTFlfKiI2okzBQ51EdfSfDXDkk9VjHPPBo/gLwVf5mQuBlbP5yZuubMpt0EATmOvxhfhxgSwanrUrpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6422
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



On 30-05-2024 19:51, Nilawar, Badal wrote:
> 
> 
> On 30-05-2024 19:55, Himal Prasad Ghimiray wrote:
>> Make sure that the assertion condition covers the wakefulness of all
>> domains for XE_FORCEWAKE_ALL.
>>
>> Fixes: c73acc1eeba5 ("drm/xe: Use Xe assert macros instead of 
>> XE_WARN_ON macro")
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_force_wake.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h 
>> b/drivers/gpu/drm/xe/xe_force_wake.h
>> index 83cb157da7cc..9008928b187f 100644
>> --- a/drivers/gpu/drm/xe/xe_force_wake.h
>> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
>> @@ -32,7 +32,7 @@ static inline void
>>   xe_force_wake_assert_held(struct xe_force_wake *fw,
>>                 enum xe_force_wake_domains domain)
>>   {
>> -    xe_gt_assert(fw->gt, fw->awake_domains & domain);
>> +    xe_gt_assert(fw->gt, (fw->awake_domains & domain) == domain);
> This will always assert for when domain FORCEWAKE_ALL (0xFF).
> Not all the platforms support all the domains.
> e.g. MTL GT0 support GT and RENDER domain. So for forcewake all use case 
> only bits for GT and RENDER will be set.
I think to handle this correctly in struct xe_force_wake you can add new 
enum xe_force_wake_domains supported_domains to hold bitmap of supported 
forcewake domains. Use this bit map to check appropriate domains are set.

Regards,
Badal
> 
> Regards,
> Badal
>>   }
>>   #endif

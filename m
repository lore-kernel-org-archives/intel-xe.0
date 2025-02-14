Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A32ACC02198
	for <intel-xe@archiver.kernel.org>; Fri, 14 Feb 2025 17:23:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DE0B10E0C8;
	Fri, 14 Feb 2025 17:23:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JUBZihK4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA82B10E0C8
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Feb 2025 17:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739553821; x=1771089821;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qjXQtgrTUlXR5fj5jrgwxkJ7ZMNda0+/6GYSYCLreQY=;
 b=JUBZihK4MLdE6l6E9C24xxd+p2y0DwFkDB7uz9aHck5os/JCU959r/Tj
 +f0KsADvDDUdtcVoC7H0oQGaCy/pcSvEqVXatYm3zjat3esEt1viQuGd4
 upTMIU9EISc76Nwbbd5rjTqTAkHFPOl+PhzLr4zlb+Klwp434THAC3AGF
 tW88lSWJZuKx5Wn0BNwAzHiDnRG0QmmrM9zxz0/w9YuocrDxYu5Nj4qa6
 hyYsN9IC68SKbHbhL8iaeGPc7Y0o06nUqre2QtNdac5zBAzpzqIQd+V9l
 q1qEl++hO7CfiOPtJeubANjpYQBSpnH4MFCarN0BiBSiQeNpX42/DH7RD w==;
X-CSE-ConnectionGUID: uMDG3mWVR16B9EaOUjURVg==
X-CSE-MsgGUID: Aetk/HBTQ3eLExEf+i1alw==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="50939340"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="50939340"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 09:23:40 -0800
X-CSE-ConnectionGUID: dWiTE8kuRcuhqqttB4yHNw==
X-CSE-MsgGUID: vB+2IrfcTfaY18B8CaDXbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118714979"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Feb 2025 09:23:41 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 14 Feb 2025 09:23:39 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 14 Feb 2025 09:23:39 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Feb 2025 09:23:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dxogwCEusarB5X2jxooSFi4eQDrKBUNfiQkspDgF7rZVDDZy3sCf9rK4zMSp5Kln+xpJs7nPkKslQ0lx5wKXtLahv/hKXeWnMO+aD6ln8vZdPt50kwpoSs837kimAuq5FfCckKQLjnl3DxjdjqcNSJlSQfIu/ASFhlhpKXSA/m7w17mptTqmTCv8osihuB4tmD1HGSvKYzxsK0qGTvw8jUGdcpdeYsNdSVz5I52Ms2RVTAcaOsX1XKMIw0oAdy5OlIvWaWlsiox2FUv6JXzPHisosdhS9acZA4c86VHPrHc5RR6U8hWVJ2VwLYTCbD5JL3DU+3J4Xd7ST1NPcKzOWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=63fuKGAY//UAFJbRwr/yfy0DfemkhrMV4CSdDKNwoTg=;
 b=te2VyoFgo6ND8zYEuY0ImE+b3KNHDT5lE+cmDYegssUIB0lhY0Yxp1sKVQ3Lq6kzFmKwV44ZGd3o4WPejYNVWks+TxWjQWEFItZMDByzcIL7b2Im3P/al3KuNC7fRn+tm0DUONWZ+f+B9OC1Wolf3Gq5sTjEB1YEgG54PzM8+yP96nt/A/ZcVxc/G+AWvEzl9QMLFFI35CQF9O/qVMqywQ1eRsZtfsCJxmzMZ3w+Qg8CuZXucmAwJoUqdP8fmaeoCNBBFGQmATrE/0YxMQBR7pUfavahl/F55xhj7auHDRjVZgTBZCKwPruISjqZ14ivj20CH0O0w8j/T1i4Zn4Qog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by PH7PR11MB7451.namprd11.prod.outlook.com (2603:10b6:510:27b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Fri, 14 Feb
 2025 17:22:56 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%5]) with mapi id 15.20.8445.015; Fri, 14 Feb 2025
 17:22:56 +0000
Message-ID: <c1441be9-0762-4aea-a7cf-908f6c59bf46@intel.com>
Date: Fri, 14 Feb 2025 09:22:54 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/guc_pc: Do not stop probe or resume if GuC PC
 fails
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>
References: <20250211200911.199213-1-rodrigo.vivi@intel.com>
 <46c8e0b6-59f1-44f1-b3e7-30075d86bcae@intel.com> <Z6zlUOQkRtA5RI7X@intel.com>
 <0c223a7e-7078-4905-abde-1e2924352937@intel.com> <Z69ams0A3W7BLHma@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <Z69ams0A3W7BLHma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0357.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::32) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|PH7PR11MB7451:EE_
X-MS-Office365-Filtering-Correlation-Id: 43db5b77-3708-403b-2829-08dd4d1c389d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M0pNaHpvcG1pVHI3Mzl1bkowR3dJT0FRNk9kSUlic2dNcmlQZ054dnZZa29K?=
 =?utf-8?B?UmVsTWM1WHNCT3FhL0s2dTBFU29QTEtMVEhKZVg0V0kxVjFjaHA0U3BnMWZV?=
 =?utf-8?B?a1JKdmNRV0lRamhRcDQ5SFhxWUp3YlZocXlCL1g0bmhNSkl3SlRCRkpUOWc5?=
 =?utf-8?B?MWthaXllZExxd0FJNFBncDBTT2c2dmJBck9nc2dzQnRjbEI1dDlUVzFEUnlZ?=
 =?utf-8?B?YW1McEx0a0NSeHVzVXBRMnpiUFhlaFU5cG93SmVnK0FJLzZLTStQak13OVA1?=
 =?utf-8?B?QWFDbGlJeVRtV1grVHpYREIwT0ovY1oyVVpXeXBxcmtuV1huUk5MQXM3Sy9h?=
 =?utf-8?B?b0VRSEo0c3VMMjRCajdRLzZPWHBBRnVlbEczYXo2M2hDalhJbVZJVWVoQjJs?=
 =?utf-8?B?Z3Q3b2ZXaWNQYTVHMjVWZGFvNE9SUC9NbXRWR0Y5VmpjTlNtSGEyQTRrMXI5?=
 =?utf-8?B?M3BmQkNoYkx6bnNZVFF2Sjk5cjV3cjBqSWsyNXVSVUNmVmFlWDlCZEZLbmZ5?=
 =?utf-8?B?N0FxL09BRW95bXl4Ym9pYUFkaUVZcm1leFdTTkdNZWloOVRGY0JYQzlKNUtG?=
 =?utf-8?B?OWV2L0hkUmNSSk1GOFY3Tjl3ZFJwdUFCcmdtVVdPZElvbEg3YU9hZDliNmtT?=
 =?utf-8?B?TEhIWFRTMnBKaDZ5bWRQcWxtam83OG9nbi9xOEg2aTRvd3ovTDAvNWs1U09w?=
 =?utf-8?B?OTIzdFhqc0U5RnJvQXRjZXZmQWpSaUpTYWtqNDE1QVBUc2VyaGEyNHFZc2Zx?=
 =?utf-8?B?ZUFMODZDMzlTN3ZOL3FsRTYvaFF0MHFCYWVMcUVQOG9QSjExYWQwSEIxRi9p?=
 =?utf-8?B?YnBHZktYMHVWT0FFeXR5U0p6OVhWK2hxOTNlcGs3YVZHaEJoeGg0WU94VzBK?=
 =?utf-8?B?dmVhL3dzUXk1VnFBaDltY1NZeG5LU2FHdEdINVoxQmlpLzQ3ajJRL20rYW0y?=
 =?utf-8?B?Vk9UTFZrb3FPUFF5Q2VadEFCSmdzclRDUU5TTHNDbDZNUW5hSVdMUDBLVy9Z?=
 =?utf-8?B?bm1JL2dDeHVYNklSS3NwdkNtZHdFVmpzNVBSbTF2aXdIT3ZEV2R5b2NnUzhE?=
 =?utf-8?B?OVNQSkk2TXJSOFY5cXJOWkNYRWVaMDlkQ3ExWTUzTWUwVkQxZEx4dEhEREsr?=
 =?utf-8?B?Nlp2UkQzcVlnQWNwanlMMytmYldkMGRsK2c3bVNwT0cyRVlaWmhSVnFUNkpH?=
 =?utf-8?B?T1BlaFkvWmJOSGE2TmEreWNkdFBoTUx2WExJdWRKMFFrQkJXUFJqUXFXcHNN?=
 =?utf-8?B?Rlo2ZDVxZjJHNGdMZUVUYTc4SFpQQnh0dWVSa0t5RzgrWEo2RlpPZ05LMWpQ?=
 =?utf-8?B?SHd2aGxBZTQ0aEgvQmU3S1N4QXk4N0lJQzk4STY0SjhqTkFSVGE4dFV2WWl6?=
 =?utf-8?B?cGo3V0tJRU9Kais0ZnVFYUJzWWNWTkw5OEJxNEpTbkJrdVVRaFpETmZTbzBn?=
 =?utf-8?B?THhNY25wbEU2N0dXdEU2T0lwbFkvaWVLYUdFMGZRSThLa3M5Q3h0UW1rOHdn?=
 =?utf-8?B?MmlUWHJETmppdHZmakhudWxJMS8vSGtWVzkwdjAxYzNnL0huWUo3QlFkQm11?=
 =?utf-8?B?dVUveVFxaU1sbVNXODN6MFdadXFtdnJoeGMwaFNrYVRLMDFadHpMV2ttMGpC?=
 =?utf-8?B?czh0SVBDeVJkbHhQWEl4K1ZSdlRSanhYUHd6cUl0a3hheWxZdVljS2FkVlU1?=
 =?utf-8?B?U1NJYWhqYkRaSG1PblZrSkVEaFNjRGJlWjJFR1J1Wk5EZ0lndi9Ib2ZMWHRj?=
 =?utf-8?B?YktSd1EzZVQwYUxTNUxKOXRGeUFGQVZnZlM3MmZWdXRQd3ovSURNZVRtVExy?=
 =?utf-8?B?cVFDdnkvUHdZQ2ozMFJmSEVCODZLTkxjR3Y4aWtLUEovUnp5b1VBRlkzeWJD?=
 =?utf-8?Q?Zhm/xHevk7iAr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFhSQzMvV3I3ai9rSGdRZU00a0dvRGlGcVVqbVljQ3lZRlFuajE3dUZDblJz?=
 =?utf-8?B?eU5YRUFJR1gyNDI0aHhaMk1wYTNsSTJtaFdMdmNjczBwTjc2cTZXTnpWbjJM?=
 =?utf-8?B?MVltU0lYUDNaQmE2MkkvWjQvSnpEbnhJNUZSOHd5MG5WQ0tUd2ZWcHFxeGRj?=
 =?utf-8?B?c2FycEdJZ1BqdVJHbktYSUNaeVg0ZURZeG1zeGZxTVBrOWlhZ1JUQlo5UDIy?=
 =?utf-8?B?eUF2ZE9lUUozbDc1Nm9Xc1VVeTFmeFgwd2gveVVkdnpudlJrNFZoRnIyc3BT?=
 =?utf-8?B?UTlmMXh4SDcydjVEczZ4dW4yVE9xSTdaMjgrcFFZa1l1NkxIWExPeVI3STdm?=
 =?utf-8?B?eHB0UDlOZ0dheWV1ZzhoOTUyQlVRZC9JSm50SXRrOVBPSUJVclFiYXNBcUxT?=
 =?utf-8?B?cUUwSE9RTGN5VVBicnVqT09tYWl6UUgrU1RUazloZG5PZFBRZUR4QnUvbU80?=
 =?utf-8?B?djN4aFFRbFhpOEMvalM3MUo0S3M1MU1DOE9OVWh5V1RSZTFmRGk1Y0N5VmNB?=
 =?utf-8?B?bC9WS2dUQlBLL09sTFlSQ1c0eWNoaXJGdnM2cUNGQWdHUEdmVzFUM2ljYnd4?=
 =?utf-8?B?R2R0bm5iellSay9ZWnJQSlphV3NOaCtIdURMSTZ6UGVuTVI2VE5MWVV6YVI3?=
 =?utf-8?B?RnlVdHptR1hleE5mSkoyRS8wVjJobFUvNVVBRlF0M1VwdmVMT3JXZi8veDd1?=
 =?utf-8?B?MFNycUl1OEJFb2E4SENhZDZKelNIQ0gwWEl6N1BVZE9HMVdkRVVLSVU3emtS?=
 =?utf-8?B?VHBwYUFqOTNjcVNoRlM3YzR4YzFhK1lEdXVWTitpZFRZckZQUlM1STBWVkJy?=
 =?utf-8?B?ZVV3cnhVZGU1MzMzVU8rQmkvTGVMSC9YcktBZ3k0RjhqdzJiempGRTJaVXor?=
 =?utf-8?B?cjV2OXlVdkt5RGsrR3R1Z2drNi9IakwvZG9uNU1BT2QvdU1mVFJRMncwSVE0?=
 =?utf-8?B?UFl1bUtZbW1nOTlhWjJHbnVPeG4ydllkbkxLVVVlblFJc2VsUXZyOWZTdVVX?=
 =?utf-8?B?allLV28rWUxMYm5iWEI0bytuSFJqRUVlbTUwTnBLUFBvNlJiUjgzWGM5a25o?=
 =?utf-8?B?Q1k0ZVZtUHdxQlV0VWRuVjN2MmI1THNOMGJ2OG5VeDdUZ3hPZ1dPUjB5SjVF?=
 =?utf-8?B?TGc1aU9jUzRrWU5CL0o2WjN3ZzZYZXFZWXVINFFLSnJCaTVyWGowYWw2OEtT?=
 =?utf-8?B?M3A2RWxLdjVQbG9Qd3YvZkhVOEx0aGI0SUJsWCtFUFRDSVlmb2tqMWNjVndB?=
 =?utf-8?B?S1gyai8ySGZnYzdNZEpEbTVFMXlhR2p0L0ZYNGtZV3pZK3RLaUdUdU1HaTFX?=
 =?utf-8?B?dW5hZC9yL3ZEZGpRbDVjeE81MHVnTkFhc3pvKy9SMHFCOWI0WEJieSs0R3ZQ?=
 =?utf-8?B?TXhFNmtrRGlKREhzRUNOaHNYK3FhWE1WWUtySm1zeFdnR3JGS0VONWJEWXBs?=
 =?utf-8?B?WndjcTBJOUJBdmdvUndKRkhiTTl6bWd0cUNwOVVMVnZ6b0RxRzJXbjRQN3B0?=
 =?utf-8?B?dDJGR3V5L0ZKU0lIcEdZbmRKdW9oRUlESWhEV2pWTTNmWjNvNUcvbGVPZnQz?=
 =?utf-8?B?cE1aaWFPZjB2N05SclQ1SGJHUU5QMWw3V1R6blh5N29vUlF1T1R4cGlyaHo3?=
 =?utf-8?B?OGx3MkRIK0hkVnBVd0dYc1BUWWx1aHZ1V0cvSndmaHNOd1VldmgzUTFVMkZN?=
 =?utf-8?B?Vk9Lckk1bExzQVpiTlhzckozZXdNNFdpL20yMGdPSGQ0WVBNR3h6R0ltWVpU?=
 =?utf-8?B?QUZ5dVE5Rlgza2lka3BpclRoUWRxa2xiY0dWZHJWQXdGejVoMWowS1hKMFNu?=
 =?utf-8?B?ZHkxZWpIaG5ZdW5sbVpKNGlzZE83Nm1yMmVUbnVvUnVDN09BSUUrVEIvczVH?=
 =?utf-8?B?R25ORXBYd3Y1Q0JmS29SazR4UWJlSjNJckUzUmJNZDdrS0llL21wN1ZTbm9j?=
 =?utf-8?B?LzdtNlpZeWVqc1VUWVJwMGJTbUd1WjB0QmhwOHMwV0VpRVZBUmE5K2p6SGJI?=
 =?utf-8?B?SnhNMkdGWkR1eVhURlU5emdvTGFFcGdRdS9PUXl5MHJaZmUzK0tGWGlWWGZJ?=
 =?utf-8?B?c0ZET0Z6V2g3bjBWNlVjUk1qd0hzV281eS9LeHN0NS9DSUpMNFVIdFUzbWsz?=
 =?utf-8?B?c2F6c1llSlFNcTJHZDdDTmpkSjluaGZxTVplRGhmc3k5aFdPWlF4VlQzUTE3?=
 =?utf-8?B?NXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 43db5b77-3708-403b-2829-08dd4d1c389d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 17:22:56.2934 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7F+MCjxn6EcHP2THX1zTP0D0l/pGRqdW95xQSbbId46V7ZN2aSfvikF72UakOOzm+HC/Pbc/bVaTDuYg6cXAnfJeeYVPnD6Ouzi0GIzi+E4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7451
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


On 2/14/2025 7:00 AM, Rodrigo Vivi wrote:
> On Thu, Feb 13, 2025 at 05:37:34PM -0800, Belgaumkar, Vinay wrote:
>> On 2/12/2025 10:15 AM, Rodrigo Vivi wrote:
>>> On Tue, Feb 11, 2025 at 05:19:14PM -0800, Belgaumkar, Vinay wrote:
>>>> On 2/11/2025 12:09 PM, Rodrigo Vivi wrote:
>>>>> In a rare situation of thermal limit during resume, GuC can
>>>>> be slow and run into delays like this:
>>>>>
>>>>> xe 0000:00:02.0: [drm] GT1: excessive init time: 667ms! \
>>>>>       		 [status = 0x8002F034, timeouts = 0]
>>>>> xe 0000:00:02.0: [drm] GT1: excessive init time: \
>>>>>       		 [freq = 100MHz (req = 800MHz), before = 100MHz, \
>>>>>       		 perf_limit_reasons = 0x1C001000]
>>>>> xe 0000:00:02.0: [drm] *ERROR* GT1: GuC PC Start failed
>>>>> ------------[ cut here ]------------
>>>>> xe 0000:00:02.0: [drm] GT1: Failed to start GuC PC: -EIO
>>>>>
>>>>> If this happens, this can block entirely the GPU to be used.
>>>>> However, GPU can still be used, although the GT frequencies might be
>>>>> messed up.
>>>>>
>>>>> Let's report the error, but not block the flow.
>>>> Can we expect other random CI failures due to this? If GT is not getting
>>>> expected frequencies, certain tests which rely on this will likely fail,
>>>> causing a bunch of noise. Is that worse than driver load failing in this
>>>> case?
>>> This issue which I pasted the log above is blocking the resume of the
>>> a LNL laptop. Everything goes blank forcing the user to reboot the
>>> laptop.
>>>
>>> I prefer to have to deal with CI noise with bugs that we can work on
>>> than blocking users resume.
>>>
>>> But well, we are still waiting one entire extra second there.
>>> That should be more than enough even with the thermal limited
>>> condition there. So, I'm not expecting more bugs than we already
>>> have.
>>>
>>> Also, our IGT test cases are prepared to deal with some EAGAIN
>>> returns right? The probe and resume functions are not....
>>>
>>> But well, any suggestion here on a more robust approach?
>>> Or can we go with this one?
>> True, this will unblock resume. However, if this is a pcode bug, we will
>> allow boot in spite of a persistent failure to get anything above Pmin.
>> Maybe we can print the frequencies again here and explicitly warn about the
>> loss of dynamic frequencies and GuCRC (and all freq/c6 related interfaces)
>> from here on?
> Your gut feeling that something was not right paid off... The ret = 0 and
> the goto out were in the wrong if. Even if the second wait succeeded we
> would goto out without doing the proper freq and gucrc initialization.
Yes, that was in my comments below :)
>
> So, what about something like this then:
>
> -               xe_gt_warn(gt, "GuC PC Start taking longer than expected\n");
> -               if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING, 1000))
> -                       xe_gt_err(gt, "GuC PC Start failed\n");
> -               /* Although GuC PC failed, do not block the usage of GPU */
> -               ret = 0;
> -               goto out;
> +               xe_gt_warn(gt, "GuC PC excessive start time: [freq = %dMHz (req = %dMHz), perf_limit_reasons = 0x%08X]\n",
> +                          xe_guc_pc_get_act_freq(pc), get_cur_freq(pc),
> +                          xe_gt_throttle_get_limit_reasons(gt));
> +               if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING, 1000)) {
> +                       xe_gt_err(gt, "GuC PC Start failed: Dynamic GT frequency control and GT sleep states are now disabled.\n");
> +                       /* Although GuC PC failed, do not block the usage of GPU */
> +                       ret = 0;
> +                       goto out;
> +               }

Yup, I think this will work.

Thanks,

Vinay.

>
>>> Thanks,
>>> Rodrigo.
>>>
>>>> Thanks,
>>>>
>>>> Vinay.
>>>>
>>>>> But, instead of just giving up and moving on, let's re-attempt a wait
>>>>> with a very long second timeout.
>>>>>
>>>>> v2: Keep the precision comment (Jonathan)
>>>>>        Use a define for the regular SLPC reset timeout.
>>>>>
>>>>> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>>>> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>>>>> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>> ---
>>>>>     drivers/gpu/drm/xe/xe_guc_pc.c | 26 ++++++++++++++++++--------
>>>>>     1 file changed, 18 insertions(+), 8 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>>>>> index 02409eedb914..3b04b62937eb 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>>>>> @@ -50,6 +50,8 @@
>>>>>     #define LNL_MERT_FREQ_CAP	800
>>>>>     #define BMG_MERT_FREQ_CAP	2133
>>>>> +#define SLPC_RESET_TIMEOUT_MS 5 /* rought 5ms, but no need for precision */
>>>>> +
>>>>>     /**
>>>>>      * DOC: GuC Power Conservation (PC)
>>>>>      *
>>>>> @@ -114,9 +116,10 @@ static struct iosys_map *pc_to_maps(struct xe_guc_pc *pc)
>>>>>     	 FIELD_PREP(HOST2GUC_PC_SLPC_REQUEST_MSG_1_EVENT_ARGC, count))
>>>>>     static int wait_for_pc_state(struct xe_guc_pc *pc,
>>>>> -			     enum slpc_global_state state)
>>>>> +			     enum slpc_global_state state,
>>>>> +			     int timeout_ms)
>>>>>     {
>>>>> -	int timeout_us = 5000; /* rought 5ms, but no need for precision */
>>>>> +	int timeout_us = 1000 * timeout_ms;
>>>>>     	int slept, wait = 10;
>>>>>     	xe_device_assert_mem_access(pc_to_xe(pc));
>>>>> @@ -165,7 +168,8 @@ static int pc_action_query_task_state(struct xe_guc_pc *pc)
>>>>>     	};
>>>>>     	int ret;
>>>>> -	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
>>>>> +	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
>>>>> +			      SLPC_RESET_TIMEOUT_MS))
>>>>>     		return -EAGAIN;
>>>>>     	/* Blocking here to ensure the results are ready before reading them */
>>>>> @@ -188,7 +192,8 @@ static int pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value)
>>>>>     	};
>>>>>     	int ret;
>>>>> -	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
>>>>> +	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
>>>>> +			      SLPC_RESET_TIMEOUT_MS))
>>>>>     		return -EAGAIN;
>>>>>     	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
>>>>> @@ -209,7 +214,8 @@ static int pc_action_unset_param(struct xe_guc_pc *pc, u8 id)
>>>>>     	struct xe_guc_ct *ct = &pc_to_guc(pc)->ct;
>>>>>     	int ret;
>>>>> -	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
>>>>> +	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
>>>>> +			      SLPC_RESET_TIMEOUT_MS))
>>>>>     		return -EAGAIN;
>>>>>     	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
>>>>> @@ -1033,9 +1039,13 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>>>>>     	if (ret)
>>>>>     		goto out;
>>>>> -	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING)) {
>>>>> -		xe_gt_err(gt, "GuC PC Start failed\n");
>>>>> -		ret = -EIO;
>>>>> +	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
>>>>> +			      SLPC_RESET_TIMEOUT_MS)) {
>>>>> +		xe_gt_warn(gt, "GuC PC Start taking longer than expected\n");
>>>>> +		if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING, 1000))
>>>>> +			xe_gt_err(gt, "GuC PC Start failed\n");
>>>>> +		/* Although GuC PC failed, do not block the usage of GPU */
>>>>> +		ret = 0;
>> Looks like we are skipping SLPC init even if we succeed in getting the right
>> pc_state on the retry? We should continue with normal init in that case(need
>> an else).
>>
>> Thanks,
>>
>> Vinay.
>>
>>>>>     		goto out;
>>>>>     	}

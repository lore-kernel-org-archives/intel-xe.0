Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE0B1C3601E
	for <intel-xe@archiver.kernel.org>; Thu, 10 Apr 2025 22:21:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 755A410E03D;
	Thu, 10 Apr 2025 22:21:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FWFOnUAv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF57210E030
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Apr 2025 22:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744323670; x=1775859670;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=eM861B8etPgWMYnFSKdFed7Gl05PBpwWPH/FWYkFh+Q=;
 b=FWFOnUAv/1TXT2zCzZ6zH/YsEwxB/tbo1KTo9RvHDDaxoEKZEIK3h6E+
 qklSKARZQqOMrT3LGNgQDSn+2c4mHEneRGNf3CblrvZfCUoU+z8SRSgeE
 91ppmCc7sUd+ZZTKhMyeyyxUctzgNVRlTAG8mXqYCeobwy2g+uEejAl9b
 PBPfr5v657rl6jwdRGHzr4tUfaGbluxyNGYs+QMuS1sk7DhTYbAkNwJui
 SY64SmAlEtBsMgjARhMrz0rDHAnYbQPIZ3Rp66V/638oDrUUnOqgdq2Rs
 SAFWEwOGpyzohKaHmGtcGlZeomTCuvKgW/DBYb9o+/If/X8EdBL/J+gld g==;
X-CSE-ConnectionGUID: a0SMF51bQK+kf7rUSuUphA==
X-CSE-MsgGUID: AX8r2caYRoa4VqfxkLy6Zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45755544"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="45755544"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 15:21:09 -0700
X-CSE-ConnectionGUID: ijeviwHaQoaOtU7v80nXpg==
X-CSE-MsgGUID: c3ssJmELQumwvDAcBxV9Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="129014519"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 15:21:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 10 Apr 2025 15:21:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 10 Apr 2025 15:21:08 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 10 Apr 2025 15:21:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LTMONpONpKX+/ghzSXSqxP93y9j2OwMKcYKWnnwPK4XoxG9H9wNKiBeXeKIpZk+Eaq8GIsd9q+rY+NnV5AMb897Wx0S8x4v6eO/rxo+tEDGufUssaSbj1UlJ84L3rTdkZZ3hrhX3C8/YeMf9EZ5LLNyWon4l8LOxvIKZlu5BJ5o+Bp93wiQtbKzrfHULi7kugJBErgpplQa+BsRRVBxjoOKh1VejsSvciTreM0NAs97aXnr4otvDFyd3Y6tCxyExdvZP/aznhydg/0Sq/+jNLiX4Fp+tUzFaVcnD/fXMRpA46n0t66Kxdbqln5UlBQLUYGzJQxJHlQo/fneOn+30/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zbkuj+csEYivayN9RvKhl+0x43uHFkEsrVE4fffdB9U=;
 b=UXmsBy3bxRjpjP2bw409kuBB62/gIxkhW5gFIIvakOE35hmPlNKis9r8+3gSKmZamP3cHAmqH7SOBHmrfJpe0rwCdVkDePgkvlnpFCLoutwmWrtRXcp+yKlIPD1tfMGtPO+l5FFIU/qhbGUhIhWb2aUZjSRjuqofo57ca1SMzY3+6mECdUllklH67p5Us0Idl3pK0HBhzitfEZqqz0T292Dy9JxQyFdXfjwttbGpLQnq/C7eDu8lC9TFJJYdNDfnU+ixwswG6rPQFTGS5Dl9cI4IuyUF9NLE3Wvrhw6wB2qaMyNcrVt+yPAAIA9VeUUA6zoFc7s2ElEAh6/SNrzp3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by PH0PR11MB7543.namprd11.prod.outlook.com (2603:10b6:510:26c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.25; Thu, 10 Apr
 2025 22:20:25 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%5]) with mapi id 15.20.8606.033; Thu, 10 Apr 2025
 22:20:24 +0000
Message-ID: <c29c4690-4540-4a6c-b375-0930408ee62d@intel.com>
Date: Thu, 10 Apr 2025 18:20:20 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] drm/xe/guc: Add LFD related abi definitions
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
References: <20250410155853.574830-1-zhanjun.dong@intel.com>
 <20250410155853.574830-2-zhanjun.dong@intel.com>
 <CH0PR11MB5444634E5911E9E199D30C8CE5B72@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <CH0PR11MB5444634E5911E9E199D30C8CE5B72@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0067.namprd04.prod.outlook.com
 (2603:10b6:303:6b::12) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|PH0PR11MB7543:EE_
X-MS-Office365-Filtering-Correlation-Id: 62bf32db-aa99-499f-b841-08dd787de3e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V3M5SWFzVGJQYmNSc3RHZXhneWUxRkY2MUp2SXE0NFRZcUdObFJLUUd3NUpn?=
 =?utf-8?B?aW9rYy9yYnI2cGZObndBdmE1bGljMUtMdytpOWo0aXcvYzRNUGhMOVJaLytJ?=
 =?utf-8?B?Zmx6SmdyeG8wbExuRWE2STJadTVSdmNoR29nMGZSMzBZNnZPTlk3Nm5YSU42?=
 =?utf-8?B?T0NZRU5mMFExN3cxVmEvVGxFS1hLVitDVTgySlM5YjY5Sy9mOVQwaWlIcmxI?=
 =?utf-8?B?VGNkWGQ3ZEVjV0o4QWh1TEpLcVhETHBHajE2VnpuUy9kU2hocGp2ZEhURUg2?=
 =?utf-8?B?VzN4VzE1YkhFZU0wMnFsWnZMN2k5STgxTmJ0Zk13bTVkY2txNUxWUWNKOUpu?=
 =?utf-8?B?cnMwUVhDVFhjMEM4UnczbGkyckVaRTJlWjR3WTBqZDA4UldJNVFYTytMbzZX?=
 =?utf-8?B?MEFFWnJ6ckZXNjJWS2F6WVczRllJKzRzWjRMYXBiZ3hQemtwTDBVRXhndmdL?=
 =?utf-8?B?Y3dLbGVMa0psWG0yeE1ydHlQS0Y1cGtlMENCN0M4UVFjS0hjeVdhUVlwZnUw?=
 =?utf-8?B?eTBOcEtyTmR3Q0thYlRUQWpHQXFsUFBvRHZKb3QyMFhpc2RQOS8yRUk1Zkti?=
 =?utf-8?B?U2Q5UmNOUjdtU3kwY204WnNyN2tob21IcGF1dllpZjRtTVZ3T1VRSCt1N1l2?=
 =?utf-8?B?bWFuQkR0bWZGTnJtU0JScmZKWVVxWkM1OE14QWcrM1FrMjVxcmZWbEZ3N09w?=
 =?utf-8?B?U1lJaXdJVm9rMkV3WGVTWUthQVVFTFpCRUREdy9zM2xtRjlHeW9vUFdwbnRL?=
 =?utf-8?B?Rlkwa1Nod1RiTHRFV05RWW9XVnpOR3VGQzVBQkZpaHcrWG85K2VGbHpyQ2pL?=
 =?utf-8?B?Y3gxOE83UHpwODNBNk5CTDJBTnBYUkJ4eFdmYXpFTFIyKzQ1blQrOWRQMUs5?=
 =?utf-8?B?RnhqMHgxZk9ObUIyNFVhelcyckpKcU1KZWpINXFKYktNTkNTVG14cWk5WXg0?=
 =?utf-8?B?TFpSbFZBcjJVa3owOWxmY1ZEUmUvYkxDQW53bHdQbzVpQ2k1S3RYQVZRNjRz?=
 =?utf-8?B?WDF4Q0kyZTZyQWtmemhpOTBjVDlxN0U1WXB1L1psT09BalJoRDRsV3JmLzFp?=
 =?utf-8?B?R05IbEZsN1lDdXBKak5ZdU5BWGM0Ukl1QWVBUWlYdU9sb1dCMlRQNml1ZWZ1?=
 =?utf-8?B?Z0VBekhkaFdRTVlUcWFuOG8vZTdyc0hnblZwYmpVMkd5YnJ6N09xSEx3ejZL?=
 =?utf-8?B?UEdNYXIvcFRqWUpwNWM4L2RZVzBJMHBEUEcxc2l3dGdRNEYycENUM1Z4YnBx?=
 =?utf-8?B?UDBrVjdkUTcvRFM5RG44T25jLytQSUYwUHZvZXpBTGpIYnJRNHQ0bzZodHpz?=
 =?utf-8?B?aGR0djFBNUhldFBmVmlTK3RBOEM5YkdJTlA1TEsvaS9mNEVGQmd2cGVrUTdK?=
 =?utf-8?B?ZlhkNW14QVFyUDRZTCtzK2dwM0dqQ1FiN3l1MmdIOXhRR0F3eG01a2NKdFFo?=
 =?utf-8?B?aDRhaTJRZUJzMnROd0lsS2FHQ3NlaFhRdWpnbDBnMC9hWnE2RFkwWTBnTU0x?=
 =?utf-8?B?RFo2TndrVGFyUVE5SGdYOVNWMTRmSUlvbTRxeWpiNVh6bDNCNElvTUJ6MVZl?=
 =?utf-8?B?c25rT2NiZWd2SWJOSWZnVC9SOXBoY0hVdksvVk9TcHIreXVkdkU4cTdjS3N1?=
 =?utf-8?B?Z0thTGljR3ZJZkhBWXlGSEhFcGdDTTg0M3JGSldod0ZLbVA3WFRrOGRIMU5k?=
 =?utf-8?B?OXRyK0VYRDh3RG1HNEdDOUsvRm1HQ2FhWlpHbUJwKzVPb2dKSmx2QmhLYXRX?=
 =?utf-8?B?VS9ic1ZCL2tDUE5DL1BWOVBBL3ZOZ1MvWUNNWTJoaExaZ2ZXV2tENjN1YU5a?=
 =?utf-8?B?Z3VSMjRmMXBXdXFYTTNjYW50d2hXb29hV1NTd1gzanVHR2NRREFqUFB2TFk2?=
 =?utf-8?B?R1N2K2hjTmxrelkwMis4b0xkekg4bi9yekE1S202QVBPMnBpa0RVbzNZbFE4?=
 =?utf-8?Q?jM0EsYnT1/I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzM3bHNLbEVlNDlsdnVqcmh4WmZ2NjhCdWg1aHZGNC9qek05ZnNpNHRUMkJi?=
 =?utf-8?B?MGl3a1o2T1NWaElsMzU2dWptbWtZbzZXbUFJdXlGclh3VlhHN1o0c3FmZU9X?=
 =?utf-8?B?aGtOd3F3ZVIxOU5jWTJ5SzBQdVd6N0pGbkVOZFZYUS9mZVVGbkExVlVvM1la?=
 =?utf-8?B?Wk5xRnErTEh1dWxWaVpYUitXVDNGdHVvOXNmdW5zUnJwOVZFSHJIWU0zcXdP?=
 =?utf-8?B?UHY2dkhoUWVXMDY3V2I3a2JXcEVrUW9OK2F6V2orWDEzSWc0ZkVqSEZOTGpH?=
 =?utf-8?B?bGttd0x4RDc1anJ6OFVEaGhLTSszcWsyVmxHeXg5S2NXMEJCWm9PV0R1dVk5?=
 =?utf-8?B?dXBqS1VrOXFFSFFOS3k0Ukp2dng4ckdmN2tJUWluZ21NQkpiOXV2RmFsVkdN?=
 =?utf-8?B?Q0x4UTVTMUN6MW9wbGxqcTNWcDU2L2w1UGhXYkNvYlJKbEk0ejBtdFFDNmM0?=
 =?utf-8?B?RERJZFRKMWM0N1hoUmtMdHNORW1MK3Awbkl2UXg3dWcvWEFnVHczTCtJRXdZ?=
 =?utf-8?B?SUM3TDA1MWx4dkpDSnFsL0NjdWNjczFoRjdsUVc1QlpXSVZadTBmcjhDdlVw?=
 =?utf-8?B?Y1FsdkdMQk5KVkFWTDR0RU5haVppZVoveksrWTZ0bktEQmUzZ0JMSFBrK3hw?=
 =?utf-8?B?UEVXcTdneUFnS2VmekF0aDFrTnBvazhhYWErQWIxWnpzSkIvSmRKUmlkSDYz?=
 =?utf-8?B?SVI4TFRWRWpqZnNaTlByWUJUbU12UGtHT0o0QnF1QmtzWlkvZXY0MDQveFcz?=
 =?utf-8?B?eDl4Q09SNW5DRlRwdFdrQWRWeERlTnl2MVMxdlg1TXdHeDNRczlsYjYrWWpO?=
 =?utf-8?B?VFpYWmVxZktmdlRqckQvQ09VSkc2Z2xVYUo0Wk55WmRXTG10N1BUT1k2TWor?=
 =?utf-8?B?VW1nbkowanB2Y1F5VlR4b3A0dFZZTzRNckhIN3htWDc0TlRQeTUxTVpvWVps?=
 =?utf-8?B?S2tBb2U2T1FFUERSdjAvV01Xcmp0S1hVdENEYXAwU1RSbXlYVktYZkRSZ1BV?=
 =?utf-8?B?Y2RWbmZmWFNFYkd6LytKYU1TVHU4eDNJbTc3OEhQNnoxQlJEZGFSaXFUOHNn?=
 =?utf-8?B?ZXpLSmZTYkJuNTdqVFFNWDZVRzBaOWNITzB5TkMwNW54K2F3d3RBOER5ZUpx?=
 =?utf-8?B?eFZSZHl2bVR3bkQ5MFpqNnMwVkMxa0RCMlJwZDhYNndONFFRUHRDditMc3Vr?=
 =?utf-8?B?NUlxdkJVdHFRUkFNSGNjYW4yNXlvRFdQVVZLRUJpRHFOaTNuWTBFUElKbWNl?=
 =?utf-8?B?UmZ3Zkp4dXAzMVVUQ0c4WUNhSThReGdyZ3VydEVFdlVxTDNNcWZqNFo3THFq?=
 =?utf-8?B?aFZ5ZmN3clJtSDllY1ZkUEVEU2NHcnJ4MjEzZ29WQ05JWERNOGdBdUVJNS9R?=
 =?utf-8?B?aEdTRXJsNFhkcUp5UHo2MjEwVFdjS2pxb3RKbDhJYzBJUVdSVWM5bmJzK2pi?=
 =?utf-8?B?RnpNODQ2VFhpYVh0K0VYSGdtckRpY3FySDJMaGxCL2lGbjNNK2VRcGtMYy9V?=
 =?utf-8?B?eUU4czRKT1FTSGJkeCtkYWlQbkNoYVdvK3owQzVtMlc3MDVza3dhYUhBRC9h?=
 =?utf-8?B?eHBiSmthMGpIZi9uakNkMHJlKy9PQ25nWEJ0OVNweUpROGdJVFVQSlpqRFBh?=
 =?utf-8?B?SmFEbzY0QWdvUVo5cEIwTVk1aVJsR3VjK1Fic0hRamhPOWVLd05laUQrWmJa?=
 =?utf-8?B?T0hKVksxVTdIdFJDcVJRYnRSQlhiS3NtcEhQMUZKTmU1dGVCdUpmaXZ5MVQw?=
 =?utf-8?B?dlJVUEdKczFOU0hxSmw5RFVzVHpRb3VoTXJ3VTA2UE9xVXk1aWdaNlpoNy9p?=
 =?utf-8?B?UjBJTVJBYU9QYWlWT2RsVlZEWFdqNmZZVi9pcG81bUJxOFFHRkZ4SUJFQ1RN?=
 =?utf-8?B?b0NkeERQeTlFOXlkU0g1WWJUOFViYlhFaWdsQW1TTVUxeFRWRFBuU3VoRldG?=
 =?utf-8?B?RE5aYUkyMXQ0MW5qQVZLSUdDbmlJZWtuaFcrUmxNSTJtRGVmdkV5QS9ONktl?=
 =?utf-8?B?TU5yVFdWVzd6dmxnOHF3UDdKL3pUNUExZVNaMkN3RHg0cG8xNURHcW5MUHQv?=
 =?utf-8?B?bE9uNWhJZHErQldHWEhxb3RxeWtSNi9KeFF4bmw3aGFqRXRnZzAyaVNkTzUy?=
 =?utf-8?Q?gDrctyeVeozRH/GCQSXna+MvF?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 62bf32db-aa99-499f-b841-08dd787de3e1
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 22:20:24.8100 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K+Np5lz/X21CZi4r/slkvysNqhZUnmMvQ0mNPEiO04LmM4bgJgu2SqZYUXISQXriC+o954s7p6Iybq7cFQi9mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7543
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

Thanks for take time to review.
Please see my inline comments below.

Regards,
Zhanjun Dong

On 2025-04-10 1:50 p.m., Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Zhanjun Dong
> Sent: Thursday, April 10, 2025 8:59 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Dong, Zhanjun <zhanjun.dong@intel.com>
> Subject: [PATCH v3 1/4] drm/xe/guc: Add LFD related abi definitions
>>
>> Add GuC LFD(Log Format Descriptors) related ABI definition.
>> Add GuC log init config(LIC) ABI definition.
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> 
> This probably needs a second opinion, but I'm willing to tentatively
> provide my RB for this patch.  Just don't apply the series quite yet and
> wait for additional reviews.
> 
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> 
>> ---
>>   drivers/gpu/drm/xe/abi/guc_log_abi.h     | 116 ++++++++++
>>   drivers/gpu/drm/xe/abi/guc_log_lfd_abi.h | 265 +++++++++++++++++++++++
>>   2 files changed, 381 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/abi/guc_log_lfd_abi.h
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_log_abi.h b/drivers/gpu/drm/xe/abi/guc_log_abi.h
>> index 554630b7ccd9..0b0c5631da93 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_log_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_log_abi.h
>> @@ -17,6 +17,122 @@ enum guc_log_buffer_type {
>>   
>>   #define GUC_LOG_BUFFER_TYPE_MAX		3
>>   
>> +#define GUC_LOG_BUFFER_STATE_HEADER_LENGTH		4096
>> +#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_LOG		0
>> +#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_CRASH		1
>> +#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_CAPTURE	2
>> +#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_INIT		3
>> +#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_COUNT		4
>> +
>> +#define GUC_LOG_INIT_CONFIG_LIC_MAGIC			0x8086900D
>> +#define GUC_LOG_INIT_CONFIG_FORMAT_VERSION_MAJOR	0x0001
>> +#define GUC_LOG_INIT_CONFIG_FORMAT_VERSION_MINOR	0x0000
>> +
>> +/** Log Init Config KLV IDs. */
>> +enum guc_log_lic_type_t {
>> +	/**
>> +	 * GuC firmware version. Value is a 32 bit number represented by
>> +	 * guc_sw_version_t.
>> +	 */
>> +	GUC_LOG_LIC_TYPE_GUC_SW_VERSION = 0x1,
>> +	/**
>> +	 * GuC device id. Value is a 32 bit. Refer BSpec symbol
>> +	 * GUC_DEVICEID
>> +	 */
>> +	GUC_LOG_LIC_TYPE_GUC_DEVICE_ID = 0x2,
>> +	/**
>> +	 * GuC timestamp counter frequency. Value is a 32 bit number
>> +	 * representing frequency in kilohertz. This timestamp is utilized
>> +	 * in log entries, timer and for engine utilization tracking.
>> +	 */
>> +	GUC_LOG_LIC_TYPE_TSC_FREQUENCY = 0x3,
>> +	/**
>> +	 * HW GMD ID. Value is a 32 bit number representing graphics,
>> +	 * media and display HW architecture IDs.
>> +	 */
>> +	GUC_LOG_LIC_TYPE_GMD_ID = 0x4,
>> +	/** GuC build platform ID. Value is 32 bits. */
>> +	GUC_LOG_LIC_TYPE_BUILD_PLATFORM_ID = 0x5,
>> +};
>> +
>> +#define GUC_LOG_LIC_TYPE_FIRST	(GUC_LOG_LIC_TYPE_GUC_SW_VERSION)
>> +#define GUC_LOG_LIC_TYPE_LAST	(GUC_LOG_LIC_TYPE_BUILD_PLATFORM_ID + 1)
>> +
>> +/** struct guc_klv_generic_t - KLV with multiple DWs in an array */
>> +struct guc_klv_generic_t {
>> +	/** @length: Length in Dwords of data. */
>> +	u16		length;
>> +	/** @key: Key value */
>> +	u16		key;
>> +	/** @value: Value for this key */
>> +	u32		value[] __counted_by(length);
>> +} __packed;
>> +
>> +/**
>> + * struct guc_sw_version_t - This structure describes the full version of
>> + * a software component.
>> + */
>> +struct guc_sw_version_t {
>> +	/** @dw0: A 32 bits dword, contains multiple bit fields */
>> +	u32		dw0;
>> +	/* BR[7:0]  Patch version */
>> +	#define GUC_SW_VERSION_T_PATCH_VERSION		GENMASK(7, 0)
>> +	/* BR[15:8]  Minor version */
>> +	#define GUC_SW_VERSION_T_MINOR_VERSION		GENMASK(15, 8)
>> +	/* BR[23:16]  Major version */
>> +	#define GUC_SW_VERSION_T_MAJOR_VERSION		GENMASK(23, 16)
>> +	/* BR[31:24]  Branch ID */
>> +	#define GUC_SW_VERSION_T_BRANCH_ID		GENMASK(31, 24)
> 
> Non-blocking:
> Perhaps we should split the dw0 into the 4 components
> it's comprised of?  Say:
> """
> #define GUC_SW_VERSION_T_PATCH_VERSION		GENMASK(7, 0)
> #define GUC_SW_VERSION_T_MINIOR_VERSION	GENMASK(15,8)
> #define GUC_SW_VERSION_T_MAJOR_VERSION		GENMASK(23, 16)
> #define GUC_SW_VERSION_T_BRANCH_ID		GENMASK(31, 24)
> struct guc_sw_version_t {
> 	/** @patch_version: Patch version */
> 	u8	patch_version;
> 	/** @minor_version: Minor version */
> 	u8	minor_version;
> 	/** @major_version: Major version */
> 	u8	major_version;
> 	/** @branch_id: branch ID */
> 	u8	branch_id;
> } __packed;
> """
> Or is that not possible due to some architectural reason?
Yes, for big and little endian, the byte order is reversed, that's why 
Mattew suggest to swtich from bit field to bitmask to get it works for 
both endian mode.>
> Same logic above applies to guc_lic_format_version_t, guc_logfile_lfd_t, and
> guc_logfile_fmt_ver_t below.>
>> +} __packed;
>> +
>> +/**
>> + * struct guc_lic_format_version_t - Log Init Config Structure Version.
>> + * Major-Minor is not a fractional number (i.e. Ver 1.3 would be older
>> + * than 1.12)
>> + */
>> +struct guc_lic_format_version_t {
>> +	/** @dw0: A 32 bits dword, contains multiple bit fields */
>> +	u32		dw0;
>> +	/*
>> +	 * BR[15:0]  Log-Init-Config structure minor version. Must be
>> +	 * GUC_LOG_INIT_CONFIG_FORMAT_VERSION_MINOR
>> +	 */
>> +	#define GUC_LIC_FORMAT_VERSION_T_MINOR_VERSION		GENMASK(15, 0)
>> +	/*
>> +	 * BR[31:16]  Log-Init-Config structure major version. Must be
>> +	 * GUC_LOG_INIT_CONFIG_FORMAT_VERSION_MAJOR
>> +	 */
>> +	#define GUC_LIC_FORMAT_VERSION_T_MAJOR_VERSION		GENMASK(31, 16)
>> +} __packed;
>> +
>> +/**
>> + * struct guc_log_init_config_t - GuC Log-Init-Config structure.
>> + * This is populated by the GUC at log init time and is located in the log
>> + * buffer as per the Log Buffer Layout (In Memory). The array of guc log
>> + * buffer states plus this structure must not exceed 4KB
>> + */
>> +struct guc_log_init_config_t {
>> +	/**
>> +	 * @lic_magic: A magic number set by GuC to identify that this
>> +	 * structure contains valid information: lic_magic = 0x8086900D.
>> +	 * Used to verify the information in this structure is valid.
>> +	 */
>> +	u32		lic_magic;
>> +	/**
>> +	 * @lic_ver: The version of the this structure. Detail description
>> +	 * is guc_lic_format_version_t
>> +	 */
>> +	struct guc_lic_format_version_t	lic_ver;
>> +	/** @lic_dw_size: Number of Dws the `lic_data` array contains. */
>> +	u32		lic_dw_size;
>> +	/**
>> +	 * @lic_data: Array of dwords representing a list of LIC KLVs of
>> +	 * type guc_klv_generic_t with keys represented by
>> +	 * guc_log_lic_type_t
>> +	 */
>> +	u32		lic_data[] __counted_by(desc_dw_size);
>> +} __packed;
>> +
>>   /**
>>    * struct guc_log_buffer_state - GuC log buffer state
>>    *
>> diff --git a/drivers/gpu/drm/xe/abi/guc_log_lfd_abi.h b/drivers/gpu/drm/xe/abi/guc_log_lfd_abi.h
>> new file mode 100644
>> index 000000000000..b4002f099fd5
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/abi/guc_log_lfd_abi.h
>> @@ -0,0 +1,265 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright (c) 2025 Intel Corporation
>> + */
>> +
>> +#ifndef _ABI_GUC_LOG_LFD_ABI_H_
>> +#define _ABI_GUC_LOG_LFD_ABI_H_
>> +
>> +#include <linux/types.h>
>> +
>> +#include "abi/guc_log_abi.h"
>> +
>> +/* Magic keys define */
>> +#define LFD_DRIVER_KEY_STREAMING		0x8086AAAA474C5346
>> +#define LFD_LOG_BUFFER_MARKER_2			0xDEADFEED
>> +#define LFD_CRASH_DUMP_BUFFER_MARKER_2		0x8086DEAD
> 
> Non-blocking:
> These two magic keys should probably be aligned with the other keys below,
> but I'm willing to concede that they may be out of alignment because of my
> choice in mail viewer and not because they're also out of alignment in the
> code itself.
You are right, it is aligned in code.

> 
>> +#define LFD_STATE_CAPTURE_BUFFER_MARKER_2	0xBEEFFEED
>> +#define LFD_LOG_BUFFER_MARKER_1V2		0xCABBA9E6
>> +#define LFD_STATE_CAPTURE_BUFFER_MARKER_1V2	0xCABBA9F7
>> +
>> +#define GUC_LOGFILE_LFD_MAGIC	upper_16_bits(LFD_CRASH_DUMP_BUFFER_MARKER_2)
>> +
>> +/** The current major version of GuC-Log-File format. */
>> +#define GUC_LOG_FILE_FORMAT_VERSION_MAJOR	0x0001
>> +/** The current minor version of GuC-Log-File format. */
>> +#define GUC_LOG_FILE_FORMAT_VERSION_MINOR	0x0000
>> +
>> +/** Log format descriptor type */
>> +enum guc_lfd_type_t {
>> +	/** Start of range for required LFDs from GuC */
>> +	GUC_LFD_TYPE_FW_REQUIRED_RANGE_START = 0x1,
>> +	/**
>> +	 * GuC Firmware Version structure. LFDs payload is
>> +	 * guc_lfd_data_fw_version_t
>> +	 */
>> +	GUC_LFD_TYPE_FW_VERSION = 0x1,
> 
> Non-blocking:
> Enum values don't generally repeat themselves.  You might
> want to convert this into a series of defines, instead of trying
> to fit this into an enum list.
> 
> Same with guc_lfd_os_type to a lesser extent, as well as all the
> other enums in this patch.
This ABI header is generated from GuC interface spec, the spec is 
designed for single platform, so some part might not followes typical 
tradition for Linux.
Due to cross-platform support, I would leave it as is for easy to find 
macro/enum in code vs spec.>
>> +	/**
>> +	 * GuC microcontroller device ID. LFDs payload is
>> +	 * guc_lfd_data_guc_devid_t
>> +	 */
>> +	GUC_LFD_TYPE_GUC_DEVICE_ID = 0x2,
>> +	/**
>> +	 * Frequency of GuC timestamps. LFDs payload is
>> +	 * guc_lfd_data_tsc_freq_t
>> +	 */
>> +	GUC_LFD_TYPE_TSC_FREQUENCY = 0x3,
>> +	/** HW GMD ID. LFDs payload is guc_lfd_data_gmdid_t */
>> +	GUC_LFD_TYPE_GMD_ID = 0x4,
>> +	/**
>> +	 * GuC build platform ID. LFDs payload is
>> +	 * guc_lfd_data_build_platformid_t
>> +	 */
>> +	GUC_LFD_TYPE_BUILD_PLATFORM_ID = 0x5,
>> +	/** End of this range */
>> +	GUC_LFD_TYPE_FW_REQUIRED_RANGE_END = 0x1FFF,
>> +	/** Start of range for required LFDs from GuC */
>> +	GUC_LFD_TYPE_FW_OPTIONAL_RANGE_START = 0x2000,
>> +	/**
>> +	 * Log-event-entries buffer. LFDs payload is
>> +	 * guc_lfd_data_log_events_buf_t
>> +	 */
>> +	GUC_LFD_TYPE_LOG_EVENTS_BUFFER = 0x2000,
>> +	/**
>> +	 * GuC generated crash-dump blob. LFDs payload is
>> +	 * guc_lfd_data_fw_crashdump_t
>> +	 */
>> +	GUC_LFD_TYPE_FW_CRASH_DUMP = 0x2001,
>> +	/** End of this range */
>> +	GUC_LFD_TYPE_FW_OPTIONAL_RANGE_END = 0x3FFF,
>> +	/** Start of range for required KMD LFDs */
>> +	GUC_LFD_TYPE_KMD_REQUIRED_RANGE_START = 0x4000,
>> +	/**
>> +	 * An identifier for the OS. LFDs payload is guc_lfd_data_os_id_t
>> +	 */
>> +	GUC_LFD_TYPE_OS_ID = 0x4000,
>> +	/** End of this range */
>> +	GUC_LFD_TYPE_KMD_REQUIRED_RANGE_END = 0x5FFF,
>> +	/** Start of range for optional KMD LFDs */
>> +	GUC_LFD_TYPE_KMD_OPTIONAL_RANGE_START = 0x6000,
>> +	/**
>> +	 * Binary representation of GuC log-events schema. LFDs TLV
>> +	 * payload is guc_lfd_data_binary_schema_t
>> +	 */
>> +	GUC_LFD_TYPE_BINARY_SCHEMA_FORMAT = 0x6000,
>> +	/**
>> +	 * ASCII string containing comments from the host/KMD. LFDs TLV
>> +	 * payload is guc_lfd_data_host_comment_t
>> +	 */
>> +	GUC_LFD_TYPE_HOST_COMMENT = 0x6001,
>> +	/** End of this range */
>> +	GUC_LFD_TYPE_KMD_OPTIONAL_RANGE_END = 0x7FFF,
>> +	/** Start of reserved range */
>> +	GUC_LFD_TYPE_RESERVED_RANGE_START = 0x8000,
>> +	/** End of this range */
>> +	GUC_LFD_TYPE_RESERVED_RANGE_END = 0xFFFF,
>> +};
>> +
>> +/** OS Type LFD-ID */
>> +enum guc_lfd_os_type_t {
>> +	/** Windows OS */
>> +	GUC_LFD_OS_TYPE_OSID_WIN = 0x1,
>> +	/** Linux OS */
>> +	GUC_LFD_OS_TYPE_OSID_LIN = 0x2,
>> +	/** VMWare OS */
>> +	GUC_LFD_OS_TYPE_OSID_VMW = 0x3,
>> +	/** Other */
>> +	GUC_LFD_OS_TYPE_OSID_OTHER = 0x4,
>> +};
> 
> All of the above defines and enums should probably be a part
> of a separate xe/reg file.  Say, xe_guc_log_lfd_desc.h?
This OS type enum is part of the GuC interface spec.>
> Though I'd recommend getting a second opinion on this, as I
> just recall it being a requirement for something I was working
> on earlier.  Though it might be a different case?
I didn't find similar defines (same os/value pair) from code right now. 
Let me know if you found something.>
> @Wajdeczko, Michal might be a better authority on this.
> 
> -Jonathan Cavitt
> 
>> +
>> +/**
>> + * struct guc_logfile_lfd_t - Log format descriptor (LFD).
>> + * A type of KLV with custom field-sizes + magic numbers.
>> + */
>> +struct guc_logfile_lfd_t {
>> +	/** @dw0: A 32 bits dword, contains multiple bit fields */
>> +	u32		dw0;
>> +	/*
>> +	 * BR[15:0]  Expected value: 0x8086. Helpful in detecting file
>> +	 * errors.
>> +	 */
>> +	#define GUC_LOGFILE_LFD_T_MAGIC		GENMASK(15, 0)
>> +	/*
>> +	 * BR[31:16]  File descriptor type (the 'T' in TLV) is used to
>> +	 * identify how to interpret `data` below. For the range of types,
>> +	 * see guc_lfd_type_t
>> +	 */
>> +	#define GUC_LOGFILE_LFD_T_DESC_TYPE		GENMASK(31, 16)
>> +	/** @desc_dw_size: Number of dwords the `data` field contains. */
>> +	u32		desc_dw_size;
>> +	/** @data: Data defined by File descriptor type. */
>> +	u32		data[] __counted_by(desc_dw_size);
>> +} __packed;
>> +
>> +/**
>> + * struct guc_logfile_fmt_ver_t - GuC Log File Format Version.
>> + * Major-Minor is not a fractional number (i.e. Ver 1.3 would be older
>> + * than 1.12)
>> + */
>> +struct guc_logfile_fmt_ver_t {
>> +	/** @dw0: A 32 bits dword, contains multiple bit fields */
>> +	u32		dw0;
>> +	/*
>> +	 * BR[15:0]  Guc-Log-File Format minor version. Must be
>> +	 * GUC_LOG_FILE_FORMAT_VERSION_MINOR
>> +	 */
>> +	#define GUC_LOGFILE_FMT_VER_T_MINOR_VERSION		GENMASK(15, 0)
>> +	/*
>> +	 * BR[31:16]  Guc-Log-File Format major version. Must be
>> +	 * GUC_LOG_FILE_FORMAT_VERSION_MAJOR
>> +	 */
>> +	#define GUC_LOGFILE_FMT_VER_T_MAJOR_VERSION		GENMASK(31, 16)
>> +} __packed;
>> +
>> +/**
>> + * struct guc_lfd_data_guc_devid_t - GuC Device ID.
>> + * This is mandatory fw LFD data
>> + */
>> +struct guc_lfd_data_guc_devid_t {
>> +	/**
>> +	 * @guc_devid: GuC microcontroller device ID defined as described
>> +	 * in GUC_LOG_LIC_TYPE_GUC_DEVICE_ID
>> +	 */
>> +	u32		guc_devid;
>> +} __packed;
>> +
>> +/**
>> + * struct guc_lfd_data_tsc_freq_t - GuC TSC Fequency.
>> + * This is mandatory fw LFD data
>> + */
>> +struct guc_lfd_data_tsc_freq_t {
>> +	/**
>> +	 * @tsc_freq: GuC timestamp counter frequency as described in
>> +	 * GUC_LOG_LIC_TYPE_TSC_FREQUENCY
>> +	 */
>> +	u32		tsc_freq;
>> +} __packed;
>> +
>> +/** struct guc_lfd_data_gmdid_t - GMD ID. */
>> +struct guc_lfd_data_gmdid_t {
>> +	/** @gmd_id: GMD ID as described in GUC_LOG_LIC_TYPE_GMD_ID */
>> +	u32		gmd_id;
>> +} __packed;
>> +
>> +/** struct guc_lfd_data_build_platformid_t - GuC build platform ID. */
>> +struct guc_lfd_data_build_platformid_t {
>> +	/**
>> +	 * @platform_build_id: GuC build platform ID as described in
>> +	 * GUC_LOG_LIC_TYPE_BUILD_PLATFORM_ID
>> +	 */
>> +	u32		platform_build_id;
>> +} __packed;
>> +
>> +/**
>> + * struct guc_lfd_data_log_events_buf_t - GuC Log Events Buffer.
>> + * This is optional fw LFD data
>> + */
>> +struct guc_lfd_data_log_events_buf_t {
>> +	/**
>> +	 * @log_events_format_version: version of GuC log format of buffer
>> +	 */
>> +	u32		log_events_format_version;
>> +	/**
>> +	 * @log_format_buf: If `log_format_version` == 1, array of
>> +	 * guc_log_format_version_1_t. If `log_format_version` == 2, array
>> +	 * of guc_log_format_version_2_t. Dword size determined by
>> +	 * guc_logfile_lfd_t.`desc_dw_size` - 1
>> +	 */
>> +	u32		log_format_buf[];
>> +} __packed;
>> +
>> +/**
>> + * struct guc_lfd_data_os_id_t - OS Version Information.
>> + * This is mandatory host LFD data
>> + */
>> +struct guc_lfd_data_os_id_t {
>> +	/**
>> +	 * @os_id: enum values to identify the OS brand (1=Windows,
>> +	 * 2=Linux, etc..). See guc_lfd_os_type_t for the range of types
>> +	 */
>> +	u32		os_id;
>> +	/**
>> +	 * @build_version: ASCII string containing OS build version
>> +	 * information based on os_id. String is padded with null
>> +	 * characters to ensure its DWORD aligned. Dword size determined
>> +	 * by guc_logfile_lfd_t.`desc_dw_size` - 1
>> +	 */
>> +	char		build_version[];
>> +} __packed;
>> +
>> +/**
>> + * struct guc_logfile_t - GuC Log Streaming-LFD-File Format.
>> + * This structure encapsulates the layout of the guc-log-file format
>> + */
>> +struct guc_logfile_t {
>> +	/**
>> +	 * @magic: A magic number set by producer of a GuC log file to
>> +	 * identify that file is a valid guc-log-file containing a stream
>> +	 * of LFDs: Expected value: 0x8086AAAA474C5346.
>> +	 */
>> +	u64		magic;
>> +	/**
>> +	 * @version: Version of this file format layout as per
>> +	 * guc_logfile_fmt_ver_t
>> +	 */
>> +	struct guc_logfile_fmt_ver_t	version;
>> +	/**
>> +	 * @lfd_stream: A stream of one or more guc_logfile_lfd_t LFD data
>> +	 */
>> +	struct guc_logfile_lfd_t	lfd_stream;
>> +} __packed;
>> +
>> +/**
>> + * struct guc_lfd_data_fw_version_t - GuC FW Version.
>> + * This is mandatory fw LFD data
>> + */
>> +struct guc_lfd_data_fw_version_t {
>> +	/**
>> +	 * @guc_sw_version: The full version of the GuC microkernel that
>> +	 * generated the logs as described in
>> +	 * GUC_LOG_LIC_TYPE_GUC_SW_VERSION.
>> +	 */
>> +	struct guc_sw_version_t	guc_sw_version;
>> +} __packed;
>> +
>> +#endif
>> -- 
>> 2.34.1
>>
>>


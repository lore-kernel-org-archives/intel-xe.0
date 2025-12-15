Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D1FAD5B16E
	for <intel-xe@archiver.kernel.org>; Mon, 15 Dec 2025 13:46:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08B7810E498;
	Mon, 15 Dec 2025 13:46:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ap1b1tCs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64F0810E498
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Dec 2025 13:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765806403; x=1797342403;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=k4rfEKEqioxJG+np7xCwjFwoN2RxcxVurR0ybPe/9NQ=;
 b=ap1b1tCsbRqcg1C7EPXdNPCl3Q42P5zdI6PyXtJvePQoar0H0Qs6R84h
 mgZjqCNtglt2PIx8mvVMJAKUF7tt6Ypge2MuhfIr+wyV50gLzWTr+zWnQ
 DtPWaogPqF4MvSsgv2zG7tHCc/jCM0FOTUiQt+PgAJ4LQe3bH+CIQ4UTp
 xDZj7mEDboBzvMZOeigbVNf/Nry8h7+YWcrr0Ec4BmEJzpOjRS2Ao1zqA
 bbfEuU3As3ZGu1Nrxz0Sbo0zXl5b/u4hWZ4oS1hZ2Il3HY64Kro9yHTRU
 7gHCkZIYrjNMqZQY8LKiGB0y4DXsfQkWnuy7SlOLSXt29EJFHtw2ddCda g==;
X-CSE-ConnectionGUID: lm3cnatgRKGYkb9ZtkGXPQ==
X-CSE-MsgGUID: w+k1m0KgRhi4okV1ln0Lvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="78344548"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="78344548"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 05:46:43 -0800
X-CSE-ConnectionGUID: kmortFhZQiCWbFTEjUCC7Q==
X-CSE-MsgGUID: ZqGz3TgqSnqRHJ4OFxLpiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="221107648"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 05:46:43 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 05:46:42 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 15 Dec 2025 05:46:42 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.17) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 05:46:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KbpTFa2qUeIzpMmW9b3UtF8dHhtuO+CdqU4x70Jhy+mij70gycHXY/zwlh0rZd/cEuAAN8wToqKqV5Pu1Cza2yPLUWvRqlCXKABdu1hW2/ZOX307LwEEo80zy1h/823e8XutA8flRAZZXrJQlS5/d8wqzdG7i/qY8f4GKFdnnTHuSRJOYueb5e7Kp2qFT06Y35wxC6o6LyrSBaQXW13oxOweZLX77RFmhM0GBlKNQttEf8bt4fltZwQWlueEDXFZSU09ak/6/i2amADDz5ixGI36TX3kcHn7vpAmMlx5oKLgBR/ZymCStftFUcLF8FiurS5JyVRnbswLi6xiAa0p4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OLBiO1EtVvbhkonwk0Zo/eb15Om1znZz0QzKJ/NPxWo=;
 b=MwWQz5K8Kk6un9sdcxSyW4qp8w3R7qLSGVKRqk7/3bCMc6Z/vtr0J4hx+5DXnqwvUMBH8sY1yPf9YEeQIxSBWvDbA25R3O5CsVtLx0gjPARh3QevKIELw16DiZy4sOHU4FGwwnr5gRHa+YUVdQ74w/LOX5elDFcyLwptfXhPXNA6o8JJkAK9iMAYNzTr0JgfpwhxQeeTUc5qFKneSk/VSKWsLioGMTyfbOr6k9nrZmumKvUeu6YEDZ3h8YoTNA24SgNnq3ceNCLxXKhlE2hAcbPugwY83i1eu6j34CREGZ5CuIYrOvs1yRzNpGZBQXUi+5iuRtMmtdwUmCBPRAUbdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SN7PR11MB7666.namprd11.prod.outlook.com (2603:10b6:806:34b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 13:46:40 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%4]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 13:46:40 +0000
Message-ID: <929ef11c-e59d-4237-83e3-665bcc9eb5a1@intel.com>
Date: Mon, 15 Dec 2025 14:46:36 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe/pf: Add handling for MLRC adverse event
 threshold
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
References: <20251212173449.192639-1-michal.wajdeczko@intel.com>
 <20251212173449.192639-4-michal.wajdeczko@intel.com>
 <d419d646-ffe3-486e-aec6-54f2b8c24a55@intel.com>
 <84f13b72-7210-47ca-a6ce-78329195ded7@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <84f13b72-7210-47ca-a6ce-78329195ded7@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR06CA0198.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::19) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SN7PR11MB7666:EE_
X-MS-Office365-Filtering-Correlation-Id: d402c2a5-ace9-4db4-1ea3-08de3be05fbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WTNYUS9TQkVFTWNaejBicDBIc3VOdUhtcEpZa2dVTnRXV0JHZ1MzY0NCbnlH?=
 =?utf-8?B?TnBUZVNiZEkzNXhWNDJPbjEvNUV4cjQxTzNqMU1nRU1hYVdYZnhXTy9yQ21G?=
 =?utf-8?B?bmVMLzVUT3BOR3FDTHc2cVk4WVVMeWdLZmw2NytBN3h4ZzBnTkVNS2R5aDZ5?=
 =?utf-8?B?MnpCNHNHKy9rb1pBTEpXK2RRV3RNa1hCSzJLQUVnUUJ1WmNld25zc2tQQkd0?=
 =?utf-8?B?ZjA4SitWQUVZeDMwNEFVS1VFQ2RvRDVSNk5jSnhYandSOWkrejZPajcvV2JH?=
 =?utf-8?B?aFZKRVRCVk01Z0xod25Ya2RlWGNuT0s2amhNTFVXL2xKUDNNYXorTFl0Vjc1?=
 =?utf-8?B?TkdmQ0tzWW41Y2g5NDM1NG5qRHdJZE5MdDBnekNOU2hiQUhWZVMvNzNRTEhO?=
 =?utf-8?B?UmVIS0tQdkFTMDFxZ0pTTlNTT3AybTBXT1g5eEQxUngveW1la0FCUlptM0Uv?=
 =?utf-8?B?aHdMKzEyM3E5WnIyTjFmS3VLT2NQVFJjQmQ0eWdoREdSd2pCSkZKTzA2L3pi?=
 =?utf-8?B?SWtEbDR0dXFGcjZDN2F0T0EraDlGS1g5Z2M5bWFGYXlzSDlqM211Y2Y3NGFS?=
 =?utf-8?B?QWt4Z2srSTgyS3JnZlJTTmJoRllWVTU2Y0JqRXJOaERtb0lmd1VoMWxod2tt?=
 =?utf-8?B?SzlYcVc4UkxvUTFiSFErT24vM1RvMVM5UkhhUEpGOVV3aWowMHlkSWplV0lu?=
 =?utf-8?B?U3ppa01yRlZNK3ducFpOcnBHaUNIMVNBYWNoTkhqaTF6Z1Vab2xXRkpuVDh1?=
 =?utf-8?B?Q2VlaGFTYzlnbHgzSnRuVVIrYlA5QitNM2FwWGRhSzRYVE5GdWNtR3IzVzY1?=
 =?utf-8?B?WCtiL2hPWTYyME9PS0lGeFUweVI0NkEwZVlrL3k2YnV6c3lWczB4MTNvM3Ri?=
 =?utf-8?B?TzYvWG5Xb1VuOU5kNTZ6aWVVWkV2R0lPMmtPbW5Razdqd21QOHFEWW9GTlli?=
 =?utf-8?B?eXJHN01Ea0VtUGdNVEQ4RUoyNUdFZFZvTnp0UDF0NlJpN1pscTZaUWxGU0Qy?=
 =?utf-8?B?UFBCcFNkN005eEZuWTBLZEVpbW9qQWkyZWVIcHZrMWdVVmpGNnB2ZWNVQ1ZG?=
 =?utf-8?B?elJQYUtuL296MWs2M1JHVzBGblltSXE2VEtYdWVNMGhLeWJLT015alRoVEEw?=
 =?utf-8?B?NzlUc0E3TzFYWDRPUFlEWGN4TFcyRE03YmI0U1lNOVVFeHdKVHdQU0xWcmVk?=
 =?utf-8?B?SysrNVc2Vm1oOWN3eDJtWUYxRVBXamQ2eEM2TDMyTThoOUlHYWdrbEJWS3Fv?=
 =?utf-8?B?cHJ2Mlp0UE0vcHEzR1g1a28rc2ZtRjYrU2UzOE1jREsveFNpVVgyZDNEQXJL?=
 =?utf-8?B?OEx4dTJiRkN5NngvZUMvSm56L3orb1FBV2VuWVhYWVJWWHlpaWQrT1dXKzNS?=
 =?utf-8?B?Z1FwcVAwNGQxaWRZdkZpR0Y4clJVM0EzTnM4dmUxazk0T2lqYWRpbEtSRUZ5?=
 =?utf-8?B?bzg4WUl4Z1dYMm9yaGYvaXcvMndhK0RFWEFBdWtTejcxSFVhT21XdVhxWDAx?=
 =?utf-8?B?cldXaXZTdkxlWER1VzM2MSt2Qkg4amVBWm80dUkzaG5keXUrdVhYMCtWRmt1?=
 =?utf-8?B?YWErTytPaFk0VXNMVlBGUjVpTXZKWUVuazcwNW9IUDFnekF1eno4NndkT0Ja?=
 =?utf-8?B?bTUxUGh5cGlISWFjMWs2SVBPRERsbjFBL3h0N3NibTFuZm1lRDl4SzVZbU4y?=
 =?utf-8?B?dTlOdXdOZGQxVFc4STFxT0RMcEY3TVM4bDZRSDc2eURxaC9DdGFLOFY3YnV0?=
 =?utf-8?B?cXlRT2RUT2lOSUxyMnk2VDdCT1ZZYTFxRjZMVHNkdjIrYXZtYXlwalYwdm9p?=
 =?utf-8?B?RnZKdFFTUHkxeHVzK3hucTlKc1pCM3dIYmVCY1RsK2ZjSU9oVkxhend5bVNw?=
 =?utf-8?B?ZE1tcS9YdTJUWlNBQ3dzR1pGaTBycDhONFhpNEJwbDVnY1E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWFxT1pEMUcyS0VDU3MxczkrbHM3bVJQTWxpSTZPTVc1NjdTaTBNZnBIYVgz?=
 =?utf-8?B?ZFA0VDdCb1Z6TFBHMEtCYjluTVBYVStrMEk3dmNYTTV2bjhPQ2pQbVlVSmNh?=
 =?utf-8?B?K1RQTnYzTVdkMk0xYmFKUVpMRHRuem5sVWJDYlVFRC9EbkdKMXEvQk1tU3k1?=
 =?utf-8?B?NVV5K2tnSlp4bVdLTnl1MkJhWkx2Q0NYaXlrMlg1Nnl3TFNmVExqTFFrczBX?=
 =?utf-8?B?UmNha1ZTNlNIWWFWTWhrT1lIU0RONCttTzhYTHJPYWU2TEJkUURyNWdncHBv?=
 =?utf-8?B?dGdZRUp5K0ZDK3Vvd2lvWktpd1dDVFZnNC82bDk1Y1AxQWpjTEw4TkZnNjFQ?=
 =?utf-8?B?bGZHbHUrMXVZdTh4L2JsWVQwaTc5Nk44Wk8xd2tqZ3puWktFVTE1QnQ4WDh3?=
 =?utf-8?B?dnVrTkNFSEtTSitlTWtYY3NKdlBUakgrWDJVa0N4dHlubnNSVDB6K25GclhX?=
 =?utf-8?B?S01pZi9kRERnU3UxSFFzSkI4RFBHWmJza3pQYzF1RHBBem4rZ1NRNlM0QjJD?=
 =?utf-8?B?NnZHWWdTTHI5b0pVY1JIQkZrSk5VK29aYSt1MjRQVlY1QjZpQlFZS1dkK3cz?=
 =?utf-8?B?U2pQaVZ0N3pmTWtnejlRRHVjMVRqZmE3OE4wY1d4WkM0bWNRaWcvMGc5Tjdh?=
 =?utf-8?B?b0cxUVltRVpLVW4vbUUwK0hsci9PV2J0WUhUUGppSk1GeWljZ1hxMHpuOTYz?=
 =?utf-8?B?dzl5QnZBc1F2dmFaTGhtUWdqWWROejd5Kzg5Ty9Ra2xIWlc1dk5tdnV0MTZD?=
 =?utf-8?B?QWtNeHgwN3J0Q29rTkYrdUhBMFIrRzFLU3RYR2JFaWw5NG9UZDE5ZGJ1Z3dp?=
 =?utf-8?B?UUZLNHpZYmI1YVlCL2hpd0UvbTBIV2hnTG9RbGFlem5IbFVoUzJDMzljOEZm?=
 =?utf-8?B?bkJablJKZWNjQkZnSmNaclF3dEt1enhDS1RZb1ZqM29aSUd3M0JJeVViUkoz?=
 =?utf-8?B?LzNIdmJDVW1DRmIrZVoyN0ZUVzlxdUNET0ZsZlJzdmIwUVZhdlpPQ1dXZmpm?=
 =?utf-8?B?QVg5bTRRci9HcnVJUmxtaGoveDZHR2xvTlYweDZmYXhVOHFWWktEUW9EKy9k?=
 =?utf-8?B?RmNwWktZc3B4YkpFQnZ4Y0c1YTd1TERDYmtwNGFLSmtVbXJNQVNRbCtaOG9y?=
 =?utf-8?B?eStpeXJGcm1aakxLaUx1OThZQjI5MGRwa1VVS0hKSkhxY1grMEtlKzluYjlJ?=
 =?utf-8?B?RllGSlY5RlBNb1VDamdHZ0Z3ZjRqRTdqNUN1b2NBWEZZZkQzb1ZEUTNPanVx?=
 =?utf-8?B?TUJrS1V6dFI2WkhhK1BPUjRkbkgyMDZzbnFqN0ZyT0NzSEVYbDQwRG1YM2ZR?=
 =?utf-8?B?U1ZMcWFGN0VZSGNtaVluazNCUnFpTnNxWnhaM0plYmpVVVY1ajlSdmhRY2hD?=
 =?utf-8?B?Vk9PVVlYNUZTTWVTNEsyL05WcE9ZTmp6UVJSR3hmQm5SOHpTWlpwNVd5K3lV?=
 =?utf-8?B?Z092dDh3eVNHWjJuNHFvaW5FeGRUS1UwMkwwNmxyc3JKaDlNcTRObExiL0Zz?=
 =?utf-8?B?alVISGc2UWVncmRqakFRRjZhNkR4cml4UFhaYkZldTdpUHVNUnBvMUNjRk9y?=
 =?utf-8?B?UXZ6ZkJwY0lDdldKc0c0YVJwdkZZY1pwYk9DQ2xBYWUxN1pXVEhkMUJ3Zm5h?=
 =?utf-8?B?RTJkSTlqYmdSTWJabmY0WWdNM2pUV0xlL01vWHMvMnR2S0Y5Yk9YdzVSNFd4?=
 =?utf-8?B?dWNzRmRIaExjTzl1ZWttOU1xSFIzRGpyYk5JdXVsZHlKMkpWYXRCYnJaMFZx?=
 =?utf-8?B?azVFS0lSdnl3V1plRm5NZGN4bG05YStDK3B6bmE5c2hNdEVRU3hGd0YrZXYv?=
 =?utf-8?B?QnplbjhYRHBsSlA5bURpWEc1d1lNUHgrYVZkbXl1cUQyL3dFQ1J1bm53S0ph?=
 =?utf-8?B?bHlNTEYxaFJ1TDM2dzVBYUYyYVR2U09QQTdsTkZNMk9xVmdmQWhaWW9uZDk0?=
 =?utf-8?B?UStRU1c5V2VOOEpvNkxZc1o1RzhCb05yZ0FVZFdxSzR2OFRYcXR4UWx1MjJ2?=
 =?utf-8?B?aG9ub0JYRGI0UEhSZ2NOL3VCM0NHQ2hXNlRXb3FwakZXLytqMlIyOXdsRVpl?=
 =?utf-8?B?SWdNRExxWXppSmFNbG5nSTFkT0M2U29zVlFLSldtbjBaNjJ1bHRxY3dqOEo0?=
 =?utf-8?B?dHUyZUFVMWR1UVhkNTJZMEpFOCtLSFlISmYxK3ZsYlAwNDBueGxWRjMzL1ZD?=
 =?utf-8?B?WWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d402c2a5-ace9-4db4-1ea3-08de3be05fbb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 13:46:40.1345 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rlMucfMeigg1kOpS94IBW23WpESHOtmGyXcySgEFqMq5/NktrL/hp90JlB/TkeH0lEUELmDg3pOi/ypvp/N3HKlstN3mUY3PNlfFqmbmCV0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7666
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



On 12/12/2025 9:17 PM, Daniele Ceraolo Spurio wrote:
> 
> 
> On 12/12/2025 12:15 PM, Daniele Ceraolo Spurio wrote:
>>
>>
>> On 12/12/2025 9:34 AM, Michal Wajdeczko wrote:
>>> From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>>
>>> Since it is illegal to register a MLRC context when scheduler groups are
>>> enabled, the GuC consider the VF doing so as an adverse event. Like for
>>> other adverse event, there is a threshold for how many times the event
>>> can happen before the GuC throws an error, which we need to add support
>>> for.
>>>
>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>
>> LGTM. Not sure if my r-b counts as the original author, but here it is anyway:
>>
>> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> 
> BTW, this patch is different enough from previous revs that you should probably take authorship of it.

it's not different - it's just smaller than original ;)

so I guess it should be my r-b:

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

+ Matt to resolve it this

> 
> Daniele
> 
>>
>> Daniele
>>
>>> ---
>>> v2: split from previous patch, add GuC version checking
>>> v3: don't move version code to its own file, call MAKE_GUC_VER from the
>>> caller instead.
>>> v4: cherry-picked from [1] and rebased (Michal)
>>>
>>> [1] https://patchwork.freedesktop.org/series/158142/#rev3
>>> ---
>>>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h                | 9 +++++++++
>>>   drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h | 1 +
>>>   2 files changed, 10 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>> index 265a135e7061..89a4f8c504e6 100644
>>> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>> @@ -352,6 +352,12 @@ enum  {
>>>    *      :1: NORMAL = schedule VF always, irrespective of whether it has work or not
>>>    *      :2: HIGH = schedule VF in the next time-slice after current active
>>>    *          time-slice completes if it has active work
>>> + *
>>> + * _`GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT` : 0x8A0D
>>> + *      Given that multi-LRC contexts are incompatible with SRIOV scheduler
>>> + *      groups and cause the latter to be turned off when registered with the
>>> + *      GuC, this config allows the PF to set a threshold for multi-LRC context
>>> + *      registrations by VFs to monitor their behavior.
>>>    */
>>>     #define GUC_KLV_VF_CFG_GGTT_START_KEY        0x0001
>>> @@ -410,6 +416,9 @@ enum  {
>>>   #define   GUC_SCHED_PRIORITY_NORMAL        1u
>>>   #define   GUC_SCHED_PRIORITY_HIGH        2u
>>>   +#define GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT_KEY 0x8a0d
>>> +#define GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT_LEN    1u
>>> +
>>>   /*
>>>    * Workaround keys:
>>>    */
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h b/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
>>> index 5f84da3d10d3..45ab5a3b5218 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
>>> @@ -37,6 +37,7 @@
>>>       define(H2G_STORM, guc_time_us)            \
>>>       define(IRQ_STORM, irq_time_us)            \
>>>       define(DOORBELL_STORM, doorbell_time_us)    \
>>> +    define(MULTI_LRC_COUNT, multi_lrc_count, 70, 53)\
>>>       /* end */
>>>     /**
>>
> 


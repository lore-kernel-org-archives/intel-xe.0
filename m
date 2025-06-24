Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ABFBC7EE2A
	for <intel-xe@archiver.kernel.org>; Tue, 24 Jun 2025 16:06:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 535D310E096;
	Tue, 24 Jun 2025 16:06:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dcbxtCOe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0804510E096
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Jun 2025 16:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750781173; x=1782317173;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=+EP8i29lIhNm6HLTlfZp1X3WX9HntI4LbzAPZQrZSdo=;
 b=dcbxtCOe28tJWsxyc7k52wSVRxJvrdPRoxDmeXCPiNL3zApaMf33wP4t
 jTm6q6DdhmDRcmeyqLLMwI4pFkzuM+qVNs9r0qtev6WwkYyqSFzy6B6vW
 gLtY+p2RfvvS2TixzUY7gSa9zoabdNQuYrUUNCS6BS4BE/JhOO0VNkVdz
 8CYDAiTRqUMoDgssYUBlvpQxOYBKZ3LIek6yM7MMpk55hY0SFotXdnKGG
 x3ODjDsk20mKhb/7xkE4SBses3HEY/uMvjyLwM979QypXOo//5UwWiXfe
 dUh+4FHv/9PMbnUIRV1Ycbk2CAjnZ3tycr6EpizM3h0Te2qApoVs75VDA Q==;
X-CSE-ConnectionGUID: 7A3SQ8jjSO2tDZoj64yIqw==
X-CSE-MsgGUID: HJE0eJp5QCyW1/qOSS3vqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="63630896"
X-IronPort-AV: E=Sophos;i="6.16,262,1744095600"; d="scan'208";a="63630896"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 09:06:13 -0700
X-CSE-ConnectionGUID: b8nOEgceSzqGoYod4aSKsA==
X-CSE-MsgGUID: +ar7ke2WQ46Xl6uU6MjYQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,262,1744095600"; d="scan'208";a="152249334"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 09:05:29 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 09:05:27 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 24 Jun 2025 09:05:27 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.58)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 09:05:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ej9AdA4LMddgUTlB+Wy6dqrTFkqIDqvDuq6wZc92Es/km6JztZe0RRC6ETfeBd2hkW1WO9O6yd4X9ADarB2uHKt5ai4zzjUtS88BTYPwX6sS5KilzDNsgz2qzTRBo32n+mffwXP/eIjMM0rQI3yDQJQKuc8goRby5teNxEHrj19AMl26Nj4b8ZZI58mM8/qceW5U+7GrGskDv1ZBH9DJ4NzwuR1MIBJCuVeulm6d8L2WYVKKpMd2M7pPiYGj9hbwFSR68AzEeki7JpnOoeXs+/wM4yodo8NsrL49h/70cyNNfzqSBvs+CDI9jpG2Rxf9+DTjpbzHo29zhkp1Pek+KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yio1+YCcBfcP3v9ekZTJyqag2rzt6xDJzH/RMdD1S7A=;
 b=pCDqUA6401C3J+/rB8WKLTGc3iO1C68BEz+5afP19dA/07MD47IatBCh40Z1jjCa37JiQpI/DdcjTEtWjc6YR+OluRroMO1kmijsb20Nhd9yOC4XdekwdGefv+FqvlFKbi4VLCTbVsv4UAQWfL2qkmyb4b90f4FAMXJCzk9TGEU8j+eXmSo+tCmqQGxOP6HRPZYZ8KztxQ57SR6RDAwt/7jOu1lmJZOjuW7iyDwO9RgVW4EP0zLvkc5wHmkeUTrYJZAOytXJTC5l4AfTK2snceOQL6gvVG6I2i+aprvi33uE1cpG78k0i0HrGpxv51j+18/clAxdL/pJy/lO4jeRjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB8455.namprd11.prod.outlook.com (2603:10b6:510:30d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Tue, 24 Jun
 2025 16:05:24 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 16:05:24 +0000
Date: Tue, 24 Jun 2025 09:07:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>, Tomasz Lis <tomasz.lis@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: Re: [PATCH v9 3/3] drm/xe/vf: Register CCS read/write contexts with
 Guc
Message-ID: <aFrNJxz8Q3LncNkt@lstrano-desk.jf.intel.com>
References: <20250624100010.12254-1-satyanarayana.k.v.p@intel.com>
 <20250624100010.12254-4-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250624100010.12254-4-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: SJ0PR13CA0222.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB8455:EE_
X-MS-Office365-Filtering-Correlation-Id: 638ca722-5b9c-48e3-44bc-08ddb338ed7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q2R4b0JWTmw0N2FjVFJwMkFZZ1c1TDgydElSWDUyUTIxeXJiUmVlYytKSEZB?=
 =?utf-8?B?SzZuZDVMNmkrRXZaZERJYm1mY1hacUc5TWV3eXluelhyRHhuWkVVK1pXR2JN?=
 =?utf-8?B?S1R6REFMVXZxSGZVenYvTVVEVUpGWS9jL0VLK21EdGZCOWljOCthWW52MEw1?=
 =?utf-8?B?NXdUUFhVZkxEK0E0MjlMVUQ0bWtsUFBKS2lqd0t1K3I0Sk52VWJXcGFUc3J3?=
 =?utf-8?B?NFV3ZHlwZ04ra3hGenlSdHNBTjVkR0hHTGd3Nmhrdmx0S1VBWmdKZ3RMaVln?=
 =?utf-8?B?ZVZLTjFnWHdIU0NYRTBISmFXNnlnVHEveWplYlZHVWc4cnJaVHVWTGwyMDkx?=
 =?utf-8?B?U1pLZUp4dko1UVNoZHBqUXNkb3hRUXphZUpaWlJ6NFRXQU1OV0p5R0xJdy9j?=
 =?utf-8?B?S1pJNWtoVVU0dlhobGJNbGNSSmR0bnoyMjFEZURTQ2UwQWxHcmpiTmRLNTNF?=
 =?utf-8?B?Z2s1WlhHVWpYemZKY2V3UUFuMGRVTjMzc0ZZUnJRUDVyS09Ua250SFZwVVlK?=
 =?utf-8?B?NHd5OXpxSW5DaWpGTTVuNGNjVUFRM1pPS2pxSjJPNWhHUE0yRmY1MHVNc0F2?=
 =?utf-8?B?SFFKVUVXdXNDcTFJUXd5UkNuK0p4MnM3bzlZWFZ4Ni8wMDRPYzA4RlNETnBq?=
 =?utf-8?B?eWNSZGoxYWpVSS9ObjFXdWc1ZHNLYlJrRVp4YnBXeWR4aTFSRWdTMW5GR09X?=
 =?utf-8?B?U01IaXh6dFdiSmZLcHFqOXJVOG4vWjBWS2VhendLL29Xalo1bHQzRlhnL0pT?=
 =?utf-8?B?VHZieVo5OGNQZ0pmNXZqVEJtYU5XY1p1cUxVRGV6c01MZG1IeUdxRzkxSlp3?=
 =?utf-8?B?UTBydEJ4d0hDVHpBYUttMmk5RXBwU0ZHc0FxVnM5K0E5MG9OdFd2SVhraFNB?=
 =?utf-8?B?MWd3TnlnVnowanZuditEeVlHKzJHcVZuSUpQUERIQVBCSWJXeXhHMVRzYzcz?=
 =?utf-8?B?Nit5SU42R0FHVjlXc2JwMFA4WnZoaEFoODNaSGFLeDJjcUZiZDI3UkdtRDd6?=
 =?utf-8?B?VXhlN2EvV3FsMG9Vdm0yVm9taEtzb1dJQ2RLeGNVWlJVQURjQzJQTTZrK21E?=
 =?utf-8?B?ZjN4MllIallqcC9sbkRmWmlRTG8zMDZzSEZYUVJxNk44dlpkbXBkYk5pTnJu?=
 =?utf-8?B?T2RHekZqYkFNbFUxaU8zcnQ0Wk0rSE93VDI5anZtTVZGaGVmY0JrY0FPd0R0?=
 =?utf-8?B?UU5DbjQzOXQzY0hENGxDRURYTXNibm9MU245bktGRkR3WEtPRS9xUUZINk1G?=
 =?utf-8?B?UGdGaStpZ3ZyWm1UenVnWGk4QjRkUmcyenBlZlRPS3YyMXBvcnIzUks4QUt2?=
 =?utf-8?B?cUw4RHY2V0NJcFlHU1ZhTXFwdDR2azNlK2FXWnBiTytRRFc4dGVXdEdvMzJU?=
 =?utf-8?B?WGZWekJpVTN1ckFjS0RwcDc4dDZHOXptclpSZ3VaLzBwMU1jVEp1eXBnQmZm?=
 =?utf-8?B?NVlwZnFnNXR6L3VzcnJuOWJZWUU3aG5LNlYvaVRUK2ZxSjliSGFFMnJiK3Zp?=
 =?utf-8?B?ci8xeVhDNjVOZTNIVllSN0hGS0FYUTV2aFNZeUZGZVZDYklqV0VQQjNVS21m?=
 =?utf-8?B?dWpjb0hVRWNnNGJuSFUxVndZdk9qRmp4VS85S3Q3RndPS0dzWXNKTmYreFpo?=
 =?utf-8?B?eExhcUFTOWV6TEovZGl3UmtoOHkvZ21WeWdaUittVC9oY3VoT0t5emxYYk5t?=
 =?utf-8?B?aTd1M0dJc3lTUUF3YjBEU0hvQ3ZmNWFSYW1OR2pHNEZNRDZhR0xPejZHTWYv?=
 =?utf-8?B?Wk8vUFVNZUFQUzhuL2pweHFncGZzTkhkNFMxZStJZys5SVVFWFc2K1gwcTQ2?=
 =?utf-8?B?M0RGeUVGeS81US9vZ044dXo5T24rNW1hNElkSUdxM0VkYXh1enVCNnprY1Va?=
 =?utf-8?B?L2tudXMxeURNT0VxeEpmTWFnR0w1ZnFvMll4Qjg3Y21yV01kYnR5Skt5YXZp?=
 =?utf-8?Q?Sq6XZr1W/aM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nk4zV1FxUElMRzIrWW16ejFLOUZaWktHeUliNFFDTjU5bWIxdVdnUU0xeGNE?=
 =?utf-8?B?Y0U4ZGRVeWoweElsbk1SaEV1YkNqTFpUZXhBZlhhbGRYMUlsSnExZDVFNG5o?=
 =?utf-8?B?cGlRT3VqT0c3cThpZ1FQSnk5dXpPeHpNK0dEQ3RYbTVhblcxODA5K1J2VU9a?=
 =?utf-8?B?SWFDQlE1WC9NdzZxRXhOYXZ4d3FsMFZwd3pDdkFGUVYvNVhiVm8yOE5hRFh5?=
 =?utf-8?B?eW15Z29tZXdTZ2w4V0taK0tYS1Y0QXM5M2F6RXdMek9wM0FPa0cxeWxRQmdj?=
 =?utf-8?B?ZWV3aXM5UnZJNGVHYUtuRGJMeVZzelYzQ2d0MWhwSCtWcEozbzc2WFlrTDZp?=
 =?utf-8?B?b1RxNGVwWTBHaGM2WEJZVDlxZkg0WTE5VWE2ZEVYTXRmSnNIRnNRN01SdTM0?=
 =?utf-8?B?RjFRNng0TExCMk8xZ1RSM1QyQjdBRjJ5WUJ3MENxVHZMN2RObC9heG9YOTF0?=
 =?utf-8?B?Rnl1dG9Rd2VQWjhWS0ozNlVLOUNrQ0Q4QjVLSU9nTm44a2pmZUJFaUV4Smgr?=
 =?utf-8?B?Z0hqTk5mM1k3QVh2Q3kwQ2RldkNpQS92blNuYzZzaUM4bWJ4Q2VCTURvcldL?=
 =?utf-8?B?dElkVmlMc1NOY3MyNzBaTUNtT1JrV21XdEV6V3Y1bFF6VFNGK1J6NlU0Wm5t?=
 =?utf-8?B?V0lmSnUzL0o4aUlBMzBCU1BOOHg4WThrNWYzV0czbjRtd3dyQzB2Z3dHbXpq?=
 =?utf-8?B?aHdqZlY4aGpzbzRSalpRNVJiczg5aDRUcjZIOEMwSHd5QjY1YVpEQ2dSWFBu?=
 =?utf-8?B?TTdFUngxVUNkVmVWRjRaOHRVSmVrMHAwSFYwdEdTcDBnTEY4Y3NsQVlzKzN5?=
 =?utf-8?B?NmpNTThpR2JtbzFRb01SMWIvNlc1dXBUYm5mTzVMb3JMaHFKeDVpSk5zdnJ0?=
 =?utf-8?B?V2dkRXdvUHhzb2hFZGh4UVplaVZseFQzU3lrWE5yZWZkVDQwbFdQWWxGVlpZ?=
 =?utf-8?B?S2ZpMndIQXpNbnFjK0tKM1Q2SlkvQnZHbEtHWG1GRk54bUpSdDZqblVnT2RB?=
 =?utf-8?B?VlZ0dnpmNUpHd0FESExuVHpoVmlZL0xUMWYzZ0JJdmFjcVFvT1hJaTZIQ1g4?=
 =?utf-8?B?Tlc1bGRoSGJCRlhGZDUwK096akVMMzU1K1NzdDdLWUV5YzRGTUlYZEFtMUU1?=
 =?utf-8?B?VjJUUDF2TzJRSGhBOWtEa05DL1kxbVJRM1ZVMjg0NEw3c1g1WTJIUkNySEFn?=
 =?utf-8?B?RG1YRksxN1J4cU9uSFhXdDE4cWV6czQ1Ui9RRGl5dnBGd2dmdUZYcFRsSmZr?=
 =?utf-8?B?UXNEME0vWDdMSUFSQTBoTFdBTmN0YWhpbXhrNmtjL2ZmQldVR3o1UUpmaHZJ?=
 =?utf-8?B?Z2hXVHNQM3QycWhEL0Nmd2ZUSGpnV2cwOElDSGlLeUxQdUNxTDV5ZlVpL09x?=
 =?utf-8?B?REdUQllNRVoxSWFFa2EwalNJNU1nWFV2ditDbEI0VmxHRFBVMm5Yb2NGcXdQ?=
 =?utf-8?B?dnZnWENqNlVsUmhUejhPRXd0RDcyRHZSeUUyVEdUUFNRbGoramlNaytVR0RT?=
 =?utf-8?B?RGtEZG5La2x1SUxHN3hSUEJGVitmd2E3M0JneEwza1BUNlhZSjNMNE91RGNJ?=
 =?utf-8?B?b1pwbVVwZXVYWmFHS0t5VS95SHF0bTJmWk5tTm1CejFBYUVpamNIbVlSV0JF?=
 =?utf-8?B?ZUxQU1dvVW1RZGJsVEw0UXJWOEFOUXpGenZFRUczN3hWeGRQRWRxaDBldTlo?=
 =?utf-8?B?Qkc0ekhFbG92L21LSnAxeXlEMFpyRlN3eWQ1NFRlOWc3dW5FOEFlUzRQckhL?=
 =?utf-8?B?OGVrb3BiQXF0OEFWNVFXVXJxK1AxakRGdm9aQ28yZ2pNK3g4eVVzNlBYWUdw?=
 =?utf-8?B?SUMxMWpkd2ZMYkR3Y1JIYWJBZ1ZnZ0diVnRkZFdiN2FJNURRUnZ0SGZEd0dn?=
 =?utf-8?B?NHRFOWNadUpzVTMrWDhQQUpZR2RWU2ZxM0o0bmdNMkI0aXpJNjV4bjBuMTNP?=
 =?utf-8?B?Q3c1dHpnTjZudVBmNTd4Qlk4Uy9UVnJuYnhzbWRWVVErMlNkdmhsckc2YVB6?=
 =?utf-8?B?YWVuQjVmSmZwU2tYZWg2b1hqbnZKcXhEOEYvTS8wSjFWWTF6Tkl6NzdlUk16?=
 =?utf-8?B?Z2N5VzE5S1NXVS9udjlBZnd6aUc0WlhUc0Y1RSsyUFJMbi9sNXQvYUJMRUdo?=
 =?utf-8?B?enRqQlFSNUhWd1hGQk4ySHVtT2JDeURuMXJPTmozUExvcmZGZUs4dEdTWHFB?=
 =?utf-8?B?bHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 638ca722-5b9c-48e3-44bc-08ddb338ed7d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 16:05:24.2337 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ns+gvdgIS0q6WuLjwnkGPrD6m4TQdlhLuc+POg5VzKrEozfpHIeQuRSP6yZs9HMYeHSs32SbMCiLb+UIgr0ZZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8455
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

On Tue, Jun 24, 2025 at 03:30:10PM +0530, Satyanarayana K V P wrote:
> Register read write contexts with newly added flags with GUC and
> enable the context immediately after registration.
> Re-register the context with Guc when resuming from runtime suspend as
> soft reset is applied to Guc during xe_pm_runtime_resume().
> Make Ring head=tail while unbinding device to avoid issues with VF pause
> after device is unbinded.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> 
> V8 -> V9:
> - Fixed review comments (Matthew Brost).
> 
> V7 -> V8:
> -None.
> 
> V6 -> V7:
> - Fixed review comments (Matthew Brost).
> - Replaced xe_tile_migrate_exec_queue() with xe_migrate_exec_queue() as per
> review comments (Matthew Brost).
> 
> V5 -> V6:
> - None
> 
> V4 -> V5:
> - Fixed review comments (Matthew Brost).
> 
> V3 -> V4:
> - Fixed issues reported by patchworks.
> 
> V2 -> V3:
> - Made xe_migrate structure private as per review comments.
> - Created new xe_migrate functions to get lrc and exec_queue.
> 
> V1 -> V2:
> - Fixed review comments.
> ---
>  drivers/gpu/drm/xe/xe_guc_fwif.h     |  5 ++
>  drivers/gpu/drm/xe/xe_guc_submit.c   | 34 ++++++++++-
>  drivers/gpu/drm/xe/xe_guc_submit.h   |  1 +
>  drivers/gpu/drm/xe/xe_migrate.c      | 35 +++++++----
>  drivers/gpu/drm/xe/xe_migrate.h      |  4 +-
>  drivers/gpu/drm/xe/xe_pm.c           |  4 ++
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c | 91 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.h |  1 +
>  drivers/gpu/drm/xe/xe_vm.c           |  6 +-
>  9 files changed, 161 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
> index 6f57578b07cb..ca9f999d38d1 100644
> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> @@ -45,6 +45,11 @@
>  #define GUC_MAX_ENGINE_CLASSES		16
>  #define GUC_MAX_INSTANCES_PER_CLASS	32
>  
> +#define GUC_CONTEXT_NORMAL			0
> +#define GUC_CONTEXT_COMPRESSION_SAVE		1
> +#define GUC_CONTEXT_COMPRESSION_RESTORE	2
> +#define GUC_CONTEXT_COUNT			(GUC_CONTEXT_COMPRESSION_RESTORE + 1)
> +
>  /* Helper for context registration H2G */
>  struct guc_ctxt_registration_info {
>  	u32 flags;
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index df7a5a4eec74..f17a63ea06e9 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -542,7 +542,7 @@ static void __register_exec_queue(struct xe_guc *guc,
>  	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
>  }
>  
> -static void register_exec_queue(struct xe_exec_queue *q)
> +static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
>  {
>  	struct xe_guc *guc = exec_queue_to_guc(q);
>  	struct xe_device *xe = guc_to_xe(guc);
> @@ -550,6 +550,7 @@ static void register_exec_queue(struct xe_exec_queue *q)
>  	struct guc_ctxt_registration_info info;
>  
>  	xe_gt_assert(guc_to_gt(guc), !exec_queue_registered(q));
> +	xe_gt_assert(guc_to_gt(guc), ctx_type < GUC_CONTEXT_COUNT);
>  
>  	memset(&info, 0, sizeof(info));
>  	info.context_idx = q->guc->id;
> @@ -559,6 +560,9 @@ static void register_exec_queue(struct xe_exec_queue *q)
>  	info.hwlrca_hi = upper_32_bits(xe_lrc_descriptor(lrc));
>  	info.flags = CONTEXT_REGISTRATION_FLAG_KMD;
>  
> +	if (ctx_type != GUC_CONTEXT_NORMAL)
> +		info.flags |= BIT(ctx_type);
> +
>  	if (xe_exec_queue_is_parallel(q)) {
>  		u64 ggtt_addr = xe_lrc_parallel_ggtt_addr(lrc);
>  		struct iosys_map map = xe_lrc_parallel_map(lrc);
> @@ -761,7 +765,7 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
>  
>  	if (!exec_queue_killed_or_banned_or_wedged(q) && !xe_sched_job_is_error(job)) {
>  		if (!exec_queue_registered(q))
> -			register_exec_queue(q);
> +			register_exec_queue(q, GUC_CONTEXT_NORMAL);
>  		if (!lr)	/* LR jobs are emitted in the exec IOCTL */
>  			q->ring_ops->emit_job(job);
>  		submit_exec_queue(q);
> @@ -2366,6 +2370,32 @@ static void guc_exec_queue_print(struct xe_exec_queue *q, struct drm_printer *p)
>  	xe_guc_exec_queue_snapshot_free(snapshot);
>  }
>  
> +/**
> + * xe_guc_register_exec_queue - Register exec queue for a given context type.
> + * @q - Execution queue
> + * @ctx_type - Type of the context
> + *
> + * This function registers the execution queue with the guc. Special context
> + * types like GUC_CONTEXT_COMPRESSION_SAVE and GUC_CONTEXT_COMPRESSION_RESTORE
> + * are only applicable for IGPU and in the VF.
> + * Submits the execution queue to GUC after registering it.
> + *
> + * Returns - None.
> + */
> +void xe_guc_register_exec_queue(struct xe_exec_queue *q, int ctx_type)
> +{
> +	struct xe_guc *guc = exec_queue_to_guc(q);
> +	struct xe_device *xe = guc_to_xe(guc);
> +
> +	xe_assert(xe, IS_SRIOV_VF(xe));
> +	xe_assert(xe, !IS_DGFX(xe));
> +	xe_assert(xe, (ctx_type > GUC_CONTEXT_NORMAL &&
> +		       ctx_type < GUC_CONTEXT_COUNT));
> +
> +	register_exec_queue(q, ctx_type);
> +	enable_scheduling(q);
> +}
> +
>  /**
>   * xe_guc_submit_print - GuC Submit Print.
>   * @guc: GuC.
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> index 9b71a986c6ca..8f64e799283b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -39,5 +39,6 @@ xe_guc_exec_queue_snapshot_print(struct xe_guc_submit_exec_queue_snapshot *snaps
>  void
>  xe_guc_exec_queue_snapshot_free(struct xe_guc_submit_exec_queue_snapshot *snapshot);
>  void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p);
> +void xe_guc_register_exec_queue(struct xe_exec_queue *q, int ctx_type);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 72f342924ad2..277221f005f7 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -84,19 +84,6 @@ struct xe_migrate {
>   */
>  #define MAX_PTE_PER_SDI 0x1FE
>  
> -/**
> - * xe_tile_migrate_exec_queue() - Get this tile's migrate exec queue.
> - * @tile: The tile.
> - *
> - * Returns the default migrate exec queue of this tile.
> - *
> - * Return: The default migrate exec queue
> - */
> -struct xe_exec_queue *xe_tile_migrate_exec_queue(struct xe_tile *tile)
> -{
> -	return tile->migrate->q;
> -}
> -
>  static void xe_migrate_fini(void *arg)
>  {
>  	struct xe_migrate *m = arg;
> @@ -1069,6 +1056,28 @@ int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
>  	return err;
>  }
>  
> +/**
> + * xe_get_migrate_lrc() - Get the LRC from migrate context.
> + * @migrate: Migrate context.
> + *
> + * Return: Pointer to LRC on success, error on failure
> + */
> +struct xe_lrc *xe_migrate_lrc(struct xe_migrate *migrate)
> +{
> +	return migrate->q->lrc[0];
> +}
> +
> +/**
> + * xe_get_migrate_exec_queue() - Get the execution queue from migrate context.
> + * @migrate: Migrate context.
> + *
> + * Return: Pointer to execution queue on success, error on failure
> + */
> +struct xe_exec_queue *xe_migrate_exec_queue(struct xe_migrate *migrate)
> +{
> +	return migrate->q;
> +}
> +
>  static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
>  				 u32 size, u32 pitch)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> index 96b0449e7edb..3754d9e6150f 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -118,6 +118,8 @@ int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
>  			   struct xe_bo *src_bo,
>  			   enum xe_sriov_vf_ccs_rw_ctxs read_write);
>  
> +struct xe_lrc *xe_migrate_lrc(struct xe_migrate *migrate);
> +struct xe_exec_queue *xe_migrate_exec_queue(struct xe_migrate *migrate);
>  int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
>  			     unsigned long offset, void *buf, int len,
>  			     int write);
> @@ -138,6 +140,4 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
>  			   struct xe_migrate_pt_update *pt_update);
>  
>  void xe_migrate_wait(struct xe_migrate *m);
> -
> -struct xe_exec_queue *xe_tile_migrate_exec_queue(struct xe_tile *tile);
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 26e95460af87..6c32412126d7 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -22,6 +22,7 @@
>  #include "xe_irq.h"
>  #include "xe_pcode.h"
>  #include "xe_pxp.h"
> +#include "xe_sriov_vf_ccs.h"
>  #include "xe_trace.h"
>  #include "xe_wa.h"
>  
> @@ -546,6 +547,9 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>  
>  	xe_pxp_pm_resume(xe->pxp);
>  
> +	if (IS_SRIOV_VF(xe))
> +		xe_sriov_vf_ccs_register_context(xe);
> +
>  out:
>  	xe_rpm_lockmap_release(xe);
>  	xe_pm_write_callback_task(xe, NULL);
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> index 7fde8aab3e20..d2f4a2674f4d 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> @@ -8,6 +8,9 @@
>  #include "xe_bb.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
> +#include "xe_exec_queue_types.h"
> +#include "xe_guc_submit.h"
> +#include "xe_lrc.h"
>  #include "xe_migrate.h"
>  #include "xe_sa.h"
>  #include "xe_sriov_printk.h"
> @@ -163,6 +166,84 @@ static int alloc_bb_pool(struct xe_tile *tile, struct xe_tile_vf_ccs *ctx)
>  	return 0;
>  }
>  
> +static void ccs_rw_update_ring(struct xe_tile_vf_ccs *ctx)
> +{
> +	struct xe_lrc *lrc = xe_migrate_lrc(ctx->migrate);
> +	u32 addr = ctx->mem.ccs_bb_pool->gpu_addr;
> +	u32 dw[10], i = 0;
> +
> +	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
> +	dw[i++] = MI_BATCH_BUFFER_START | XE_INSTR_NUM_DW(3);
> +	dw[i++] = addr;
> +	dw[i++] = 0;
> +	dw[i++] = MI_NOOP;
> +	dw[i++] = MI_NOOP;
> +
> +	xe_lrc_write_ring(lrc, dw, i * sizeof(u32));
> +}
> +
> +static int register_save_restore_context(struct xe_migrate *m,
> +					 enum xe_sriov_vf_ccs_rw_ctxs ctx_id)
> +{
> +	int err = -EINVAL;
> +	int ctx_type;
> +
> +	switch (ctx_id) {
> +	case XE_SRIOV_VF_CCS_READ_CTX:
> +		ctx_type = GUC_CONTEXT_COMPRESSION_SAVE;
> +		break;
> +	case XE_SRIOV_VF_CCS_WRITE_CTX:
> +		ctx_type = GUC_CONTEXT_COMPRESSION_RESTORE;
> +		break;
> +	default:
> +		return err;
> +	}
> +
> +	xe_guc_register_exec_queue(xe_migrate_exec_queue(m), ctx_type);
> +	return 0;
> +}
> +
> +/**
> + * xe_sriov_vf_ccs_register_context - Register read/write contexts with guc.
> + * @xe: the &xe_device to register contexts on.
> + *
> + * This function registers read and write contexts with Guc. Re-registration
> + * is needed whenever resuming from pm runtime suspend.
> + *
> + * Return: 0 on success. Negative error code on failure.
> + */
> +int xe_sriov_vf_ccs_register_context(struct xe_device *xe)
> +{
> +	struct xe_tile *tile = xe_device_get_root_tile(xe);
> +	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
> +	struct xe_tile_vf_ccs *ctx;
> +	int err;
> +
> +	if (!IS_VF_CCS_READY(xe))
> +		return 0;
> +
> +	for_each_ccs_rw_ctx(ctx_id) {
> +		ctx = &tile->sriov.vf.ccs[ctx_id];
> +		err = register_save_restore_context(ctx->migrate, ctx_id);
> +		if (err)
> +			return err;
> +	}
> +
> +	return err;
> +}
> +
> +static void xe_sriov_vf_ccs_fini(void *arg)
> +{
> +	struct xe_tile_vf_ccs *ctx = arg;
> +	struct xe_lrc *lrc = xe_migrate_lrc(ctx->migrate);
> +
> +	/*
> +	 * Make TAIL = HEAD in the ring so that no issues are seen if Guc
> +	 * submits this context to HW on VF pause after unbinding device.
> +	 */
> +	xe_lrc_set_ring_tail(lrc, xe_lrc_ring_head(lrc));
> +}
> +
>  /**
>   * xe_sriov_vf_ccs_init - Setup LRCA for save & restore.
>   * @xe: the &xe_device to start recovery on
> @@ -198,6 +279,16 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
>  		err = alloc_bb_pool(tile, ctx);
>  		if (err)
>  			goto err_ret;
> +
> +		ccs_rw_update_ring(ctx);
> +
> +		err = register_save_restore_context(ctx->migrate, ctx_id);
> +		if (err)
> +			goto err_ret;
> +
> +		err = devm_add_action_or_reset(xe->drm.dev,
> +					       xe_sriov_vf_ccs_fini,
> +					       ctx);
>  	}
>  
>  	xe->sriov.vf.ccs.initialized = 1;
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> index 5d5e4bd25904..1f1baf685fec 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> @@ -12,5 +12,6 @@ struct xe_bo;
>  int xe_sriov_vf_ccs_init(struct xe_device *xe);
>  int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo);
>  int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo);
> +int xe_sriov_vf_ccs_register_context(struct xe_device *xe);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 04d1a43b81e3..8f1a258912ea 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -953,7 +953,7 @@ struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma, u8 tile_ma
>  	for_each_tile(tile, vm->xe, id) {
>  		vops.pt_update_ops[id].wait_vm_bookkeep = true;
>  		vops.pt_update_ops[tile->id].q =
> -			xe_tile_migrate_exec_queue(tile);
> +			xe_migrate_exec_queue(tile->migrate);
>  	}
>  
>  	err = xe_vm_ops_add_rebind(&vops, vma, tile_mask);
> @@ -1043,7 +1043,7 @@ struct dma_fence *xe_vm_range_rebind(struct xe_vm *vm,
>  	for_each_tile(tile, vm->xe, id) {
>  		vops.pt_update_ops[id].wait_vm_bookkeep = true;
>  		vops.pt_update_ops[tile->id].q =
> -			xe_tile_migrate_exec_queue(tile);
> +			xe_migrate_exec_queue(tile->migrate);
>  	}
>  
>  	err = xe_vm_ops_add_range_rebind(&vops, vma, range, tile_mask);
> @@ -1126,7 +1126,7 @@ struct dma_fence *xe_vm_range_unbind(struct xe_vm *vm,
>  	for_each_tile(tile, vm->xe, id) {
>  		vops.pt_update_ops[id].wait_vm_bookkeep = true;
>  		vops.pt_update_ops[tile->id].q =
> -			xe_tile_migrate_exec_queue(tile);
> +			xe_migrate_exec_queue(tile->migrate);
>  	}
>  
>  	err = xe_vm_ops_add_range_unbind(&vops, range);
> -- 
> 2.43.0
> 

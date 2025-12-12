Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31637D59D92
	for <intel-xe@archiver.kernel.org>; Fri, 12 Dec 2025 20:20:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D937910E59E;
	Fri, 12 Dec 2025 20:20:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Knh7YZRP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A66CC10E59E
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Dec 2025 20:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765570850; x=1797106850;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=NaMC42hQFyj5zjjhoM9PB+dBRKjhTkR6llR4RGHlsT0=;
 b=Knh7YZRPD9OJ+Z8RYty4Oi5ZeByVh6aDA/VFMif+l9IT4YJHMvjp+xY7
 tZkOGcGimcomYf0T/E8vZj6O8edaxla/sw1gQFyXh/FECVpR1RJw6AoYS
 5lQhkw2mwsS7qgz6++vAWh85cXV53XVsmAkAyOA/GU9jcD1P37Ca/uqTB
 8DZ98hXIl9Xj2y0feBn8zVtHw4Gwdi+frrAcVnK6GhT5dHbK+SWQNoa2j
 5CVdyxZuvWybWJzGaNqJxq15ROb78Po/bEV5KxoILz8UijhE8+K95qTH8
 0T0fpPAkR8Q9aAdtTz/0iibnVkefutOTKRluQURtUyVL0x0keY+1hQiVL g==;
X-CSE-ConnectionGUID: 1LWLR1h8Qqy7OkXjfTS7QQ==
X-CSE-MsgGUID: Hpk94T3PTXmYPVhSn2o8rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67616770"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="67616770"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 12:20:49 -0800
X-CSE-ConnectionGUID: tdocRGnPRhqbPctAgiCN6Q==
X-CSE-MsgGUID: EQ1nsp+VTaSAYxK81kALWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="196931032"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 12:20:49 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 12:20:48 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 12 Dec 2025 12:20:48 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.66) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 12:20:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i8RFfQZp0POcRIWfysdunOGObYm9WHB0cDNopCmj7nrr2U/oDOICC8q0dShfiYGJpw4MAjAmz5TN3RO1z37pWN2HTR6EzrXgzS4BgzIuhBitzkkfn1sgu538SiHe72SwymTXLRTNFje7leXa/PtOUJbW34fp1IWYA/bLYcLJrAWCaykFTfBxPi6h8aLYD5SEYbpqoo9ir1N8u9yBkGHwBKrwlSloFSd/g7+u0WVPHVm4ZGJZHawMUtWy8Una4SfqT9QUc/+UcwI0ziPXywaJoBiQv3iXjR5INzNTDSKrS3dMztHMJ3AdXt51xrnkH2lN7Ll8gnqwDYHTtZAJfsk6Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MOq3ZELvrjZnAgXEHZ8oRp3sOB5Qx7Ei84iSm7cbdY4=;
 b=K4wVcO3oXH6ytmAgTZqLXZWBSlXhm/raQ9kXBdX8ARlDuZOfUjagSAL/FhwuiW3H2tLwXmUHbhEe0Y6g0G8betBZdrpfgc1koRm+N4Yirw82wC1mNBOpLf/bffmRmbSgl8nDrusPMB/ocp07Fg7QSmYqaZcs9d0+G3P6oaWaQBdCz4UdaUBHoDzRrkYIVQMMKlqis/YhW4JHALppN7vOcKimGpFyk03JSgnXl+LD5DX+oy12jcMXyua4XOr1WmXeMsPNQbegQCB6+GG2shi4jMr/dCg9JiZt5+HnOh4WzhIWxgL3ln21Py0ol3SRcZJBwNaujTOl2afuDczOJG8CNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by MW4PR11MB5870.namprd11.prod.outlook.com (2603:10b6:303:187::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Fri, 12 Dec
 2025 20:20:45 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%5]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 20:20:45 +0000
Date: Fri, 12 Dec 2025 12:20:41 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <francois.dugast@intel.com>,
 <michal.mrozek@intel.com>
Subject: Re: [PATCH 5/6] drm/xe: Wait on in-syncs when swicthing to dma-fence
 mode
Message-ID: <aTx5GYTVRtWJgETz@lstrano-desk.jf.intel.com>
References: <20251211210032.1520113-1-matthew.brost@intel.com>
 <20251211210032.1520113-6-matthew.brost@intel.com>
 <97f524d334045e0819cee861e6e7d21598509424.camel@linux.intel.com>
 <aTxDwLgkmycUKk+S@lstrano-desk.jf.intel.com>
 <94cda006-0fc4-40e9-a34c-5c16ea7b1c58@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <94cda006-0fc4-40e9-a34c-5c16ea7b1c58@linux.intel.com>
X-ClientProxiedBy: MW4P221CA0029.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::34) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|MW4PR11MB5870:EE_
X-MS-Office365-Filtering-Correlation-Id: 4be0af95-7b49-4f9a-8dda-08de39bbee0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WmV4MldKTWJZci9TRENmMXorM2lUNDJTcVhrMjFPK0JqMXZoazdlY2pBMlA2?=
 =?utf-8?B?dXBZYmw4dDk1RnBaeE5rdmxWdWpsUG5ocnVrSDJZeUIxUHRna0JDMnVoSFV1?=
 =?utf-8?B?OStGcHZYNmkzZG9UZFhMa25vMGNJRTAxMzlHS0VWL0kvV0NFVHZMQ0FyaWxa?=
 =?utf-8?B?VVpIK3g5Q2lUM2pRV3p1ZmlyRVJGb1ZBeFJrOWhZNnNFQVAvNkx4ZkYrd2dp?=
 =?utf-8?B?MjNPbGpZZ09BTFp0WlJ3YVVTM2JtN2xzVitTaEQ2bXQ5VWVQb0d6ZUJtdVQy?=
 =?utf-8?B?eDd1dVh4TTNzQ1M0cUJLUEFzQ3VUNHljQUFRc2pZZjFieXYxa051N0JDbmYv?=
 =?utf-8?B?VmtyZTQzS3NtdVR6M29HNXB6SXRHZ25IQ0JMVTBuc1orSHNySGN5Nk5kN1Ri?=
 =?utf-8?B?dnk4b08wQVk3c0lDV2ZwdnFGRHIycXhwMUMxbWVLdkp2cDBLTzZBS0FCNnF5?=
 =?utf-8?B?NldDdEp2MFRLblRwS0o4ODh6RDVSR1BJVjNPd3owNHd6WDVZV2dBV0hiYmNw?=
 =?utf-8?B?U0s5VVE1KzI1SDlBRTIwWXBEOFplQStwT0ltekthS3R2UCtPS3ZUN1hoODBL?=
 =?utf-8?B?WE5sbmU5RGtjSHdzRmZXRmZKNUlJL2ZaR0F4d2x3WUhWQ2hGVkNZWHYvZkR5?=
 =?utf-8?B?R0FxVXNOMTJURkM3V1daZGxwUTJsSXB6SXlBMWc2d1QxS1o3TnN5U0xDNndN?=
 =?utf-8?B?MHNOcFlKVGJDaC85cFRZK2xqeDBjT2Z2RW5aTGc0RmhpbDlvcGdqNSt1RWtS?=
 =?utf-8?B?bHdSOWZFVEZndmhrQk5TZ0ZFNVBmVU5RTU52TSsxRWxkR2R0OVlRVFJyZXhS?=
 =?utf-8?B?SWpWL2xuU2E3VEdOQTFVQ1pNZkhFR0hrTkdEdmg0Y2VmTmxreVNHZk5GdlNX?=
 =?utf-8?B?TFVZZTFQV1FSMTVRZ1Mrcjc3eW1sdHFhdER4M0ZISHY1WHdNNlcwUk5rT2cv?=
 =?utf-8?B?ZFhUZllKNFBBbC8yY2FRMitEL1lZVVRHamRaNUMwc25Ic25HbW94QXJBVTNh?=
 =?utf-8?B?L1A5YllqRUtPR0llRXEzLzRpWXBiOEVDUGUyVG9lYjREMXdqNzVjRTRqanFR?=
 =?utf-8?B?cUZTempLelUyOHYycmhvdFBrajFhV3U2c2N4ZkI0UVFTN2VTQUp2dkhSNmk0?=
 =?utf-8?B?UlhFNzJZaFhTNjNuNzV0bUJKSVQ0Y3Z5Q3IreG1uRnlVMXZtSWJHODIySzNZ?=
 =?utf-8?B?TkVlY0JsNk1GY3IrK2Yxc2tYYjVLYVlXYU5mbTR4RnhLQ1MxblRmSmFqU3la?=
 =?utf-8?B?VnBhQTBXYm02OE5JS283VDI1N3AwWi9wckR0cUVHREY5SnY3QXpCMmVleDRZ?=
 =?utf-8?B?R2hFQW50THFuNmVIUXJxdFFGTXA3S3BvbDlRbkJTWkQ3RHpyeGRUNFJrZktE?=
 =?utf-8?B?SGk5WUdKcWtENEhBdmJONUtrTW5nMjNqZ05lZW9ncUdXUm05MVpLdExmd0VH?=
 =?utf-8?B?bUNGeVFGOTI4alZIcUVKbFJ0SUptd0RpTnhsYWthT1ZQa1c2Ny9IWFdhTVlt?=
 =?utf-8?B?K0YrcmN0SThUVzVkMG8rdVdnTHpLOGxpazV4aTNuK1ZKSnFyYXowbnJDa2ZD?=
 =?utf-8?B?aWpnRW41V2xRQS9uYnoxOXBYTGRzcXEwcUhuN3RWQ0gwUjU5Zzlaa0tYYzR4?=
 =?utf-8?B?cHVJSlM5QnI3WnJNUXRORFF5Mm1xKzA1WjJ3YUtOaXNjblFhdHBBQkNhWVVq?=
 =?utf-8?B?aHVacFJCUzNCSzdObzZXRmVJMUVKNW5kMmc4ellhZHRzOEhUQ3lTcmkvZVdR?=
 =?utf-8?B?WTZzYWszdU0zeCt6d1I3TS9TV3QxMGVscVFTTEdaYW5BZ05QVTNaTlJVOTc2?=
 =?utf-8?B?QzlYOUVLajdLUlhQNEd3R2x6K3JjSmQwRU41dkZwemp6VCtwKzRPU29hcHk0?=
 =?utf-8?B?SWRubXRaRTFHUXNsTFZORXhyYWJqVSttZmZkWWlyMVZRQ3NyaEtaeW9WQ1Jv?=
 =?utf-8?Q?mVv3QIJcTSZS+vJIWnMM38O1gyARX9W/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b054SWlRRTJmT2kxT2JFWDk0Q1dvaDJwbVJ3WGxkMEN0R01XUWJoekJaalZW?=
 =?utf-8?B?cmpmcUg0SEtzd3RPWGovRTFRbm1sam4rQm9yYUZzSXhaVElyaUFaRFRqWDI3?=
 =?utf-8?B?aG9ETUFBVjJHSXJOd1lpMDZUMjFzUnlwZ1ppNlNJTWpzMlhGRVFDWjhIcFNH?=
 =?utf-8?B?cjVaNUxuYUgyV3hqVzBaSkhZTlFuT1I0SHdRcXUzVjYwTW50NGJNZDFXMmsz?=
 =?utf-8?B?bWVUeTQ0d05VcUxRUExsa2VHekU1ZlEweUJabENLcXRKbTBWd3pna1B2bnRp?=
 =?utf-8?B?TTRRa0tlNzhyWXB6b0VoY2lNNDY1MGJnZ1lLVll1Zko5NVJHVk9VcTE5TVhS?=
 =?utf-8?B?UTFRY3A2RHJUb0xRMlQ5TW1wMDdDa3ZwRmxNN1VQVWhLRlIxalh0SDd3YkQ4?=
 =?utf-8?B?emJYeEFUZUJaS3NaWC9IeU1uWFB2elRwUm4xb1lHdDR6SkRLQlVpT2wzenFX?=
 =?utf-8?B?dUxTak9NL0twNndxazA5azJMTlIwc2tQcHVkc3JZbTRGMCtaRldkM1lMYkpS?=
 =?utf-8?B?M3lPUkZtL0J2T3psM21QOUcrQ3B1aDJ5QU1GREQyNEJrNmpKYUxSN1NSdHls?=
 =?utf-8?B?ZnNPV1Fuc25mNlZuY3lXak1EeC9oazN2eWh0QVM5Sk9YVzlwYW41eXlueTE1?=
 =?utf-8?B?ZXh1TENyeFlCNG9yT2xJNjh6eUJuVFdNWlFJemovYTc3OTQ3aWRubm5QWXdm?=
 =?utf-8?B?bnpjTmlyZFJkc3l5YkgwUEtROEk0ZklVRTRJcGhNMHBmUkYzbldBdndmZjNl?=
 =?utf-8?B?akswNnhLOE1LRWUyRTVIcnNhVVN3N0lxbWRKWkx3Y0JLdURCN0h5MURWSklD?=
 =?utf-8?B?aHZVSDhzMFhsdVhsSjZ3cVJ1RmgrTUVTM3BCaGxweG5OZnJXbGVMTnpleWxZ?=
 =?utf-8?B?b2pSa3RSWDRXZHFwWGN4WU40OVlzWW9Ta3N3cWRjSmNOazluL3crZlNHdVBJ?=
 =?utf-8?B?a1MwZUhubklxNDhTYVRoRjF2dUVsaitJNXRZRzFBUEVxWWZQci9keGZONk91?=
 =?utf-8?B?VEZ1YitaSUNkSlplVk5iY1JVN1hjLy9kaDNxN0JhMzRrY3ZuTWVVdjNFL2Nq?=
 =?utf-8?B?VTk4cHFpQ1BBR3d5MGoxRVdTQ3k3YTNRbVJsUXRDZ1JhZzlhWW9SWm1sWTVY?=
 =?utf-8?B?alkvUExHVEtDSHhkcU9XZTFwRjZ0RVd3WWUzY3M4WG5NcytSdmx0QSthTE8v?=
 =?utf-8?B?UmhiaU52UUp6OE4zRWhwd1RZUXNDc2FXd3VnU0hpM1o4Sm1qRSt5VE9lcVBF?=
 =?utf-8?B?cWFUQzEvMUc3aFlKSlEwSEllVFQ5eFEvNUM1ZXpwMWY1dzV6cko2bk5DNXZw?=
 =?utf-8?B?eGp4VGYwTkhJZGE3L20yMm10VXh6L2RnTG9sV3RFTDVFWktESjV1bTFIWlFs?=
 =?utf-8?B?L0lLbzNxbDVnTWVkQnNiWkVIQnRuOGUvN1RFY3ZVYXNsUFkvNDZDbjVpS1BU?=
 =?utf-8?B?ZkwxVWlxQXN1SUpOR1NlRDBSSStqc0cwbHM0V2daUnZGZDU0Y3BTcUpRQ1FT?=
 =?utf-8?B?cDhyYlV4K2ZOSnZEYzZmcTJUN2FQeFhkZTI1dE5jSHl5WnZIaUkvcHRweG1Z?=
 =?utf-8?B?Z2x5T3h0NDRPNE1lTWdiSVByRk8zdUNORHMvazNOcW5wWVAvQnZQN2ZhL3FN?=
 =?utf-8?B?ZitSZDV0T3JyRjNJSUU1Y1lMTjI5SWE3b0VXUC9aWmltREVHN0RRc25uMEFF?=
 =?utf-8?B?Y2tmUzF2TU1ING1IYVVMU0gyU1BhYXFMUmZuY2RhdWxsditOZHhFODI0SnRk?=
 =?utf-8?B?NFRCNTlFRXVuNFBHYmlheHY5eEhtRUtkaHhjeitnNW9wa3Npai9heXBPR2xT?=
 =?utf-8?B?UEMxeFlxOERIZS9Md2JPdlJvaHBZaFNsTWVYV3FFK0VadkZ5dW5QN3lGbUZ3?=
 =?utf-8?B?NWRCUEZYZkdlRGE4bk9za0dLUTlUaVZ4bURETWlxUW1QTkV2bFZHNkxJS0dr?=
 =?utf-8?B?Rmh0blp5cng4eW9oMnpTOVJDbFBlUit4QUhWUTJsTmQ0T05MM0h2bFhlK0VH?=
 =?utf-8?B?b3N2WEZ6dzBFMUY4YnFLYk1pMEdrOThYSnZQZ2J0WHdvOFFkOWt5QjNOM1lq?=
 =?utf-8?B?cG1HZkhXM3Z6Vm52WlkxZE1zN3dpS1p1YkU5K3JCbjZiQzV0K3VXdmduUFQ2?=
 =?utf-8?B?TW1sVk9ZL1hQMWlsWjNKWGhHVWIzMHphSEpRY2NOUWljVUk5d2IxckV4bi90?=
 =?utf-8?B?R0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4be0af95-7b49-4f9a-8dda-08de39bbee0b
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 20:20:45.0614 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fM5yT8OIUAuFYIAtNRMsrHFBn0cg6nERxOtV2rlojXsDeJ73YglGOJQs0hKL2ok5rsPdoEgfK8fqR27dEcxYcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5870
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

On Fri, Dec 12, 2025 at 07:41:35PM +0100, Thomas Hellström wrote:
> 
> On 12/12/25 17:33, Matthew Brost wrote:
> > On Fri, Dec 12, 2025 at 10:22:54AM +0100, Thomas Hellström wrote:
> > > On Thu, 2025-12-11 at 13:00 -0800, Matthew Brost wrote:
> > > > If a dma-fence submission has in-fences and pagefault queues are
> > > > running
> > > > work, there is little incentive to kick the pagefault queues off the
> > > > hardware until the dma-fence submission is ready to run. Therefore,
> > > > wait
> > > > on the in-fences of the dma-fence submission before removing the
> > > > pagefault queues from the hardware.
> > > > 
> > > > Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >   drivers/gpu/drm/xe/xe_exec.c            |  3 ++-
> > > >   drivers/gpu/drm/xe/xe_hw_engine_group.c | 34 +++++++++++++++++++----
> > > > --
> > > >   drivers/gpu/drm/xe/xe_hw_engine_group.h |  4 ++-
> > > >   drivers/gpu/drm/xe/xe_sync.c            | 14 ++++++++++
> > > >   drivers/gpu/drm/xe/xe_sync.h            |  1 +
> > > >   5 files changed, 46 insertions(+), 10 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_exec.c
> > > > b/drivers/gpu/drm/xe/xe_exec.c
> > > > index 4d81210e41f5..5bc598ba6afa 100644
> > > > --- a/drivers/gpu/drm/xe/xe_exec.c
> > > > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > > > @@ -202,7 +202,8 @@ int xe_exec_ioctl(struct drm_device *dev, void
> > > > *data, struct drm_file *file)
> > > >   	mode = xe_hw_engine_group_find_exec_mode(q);
> > > >   	if (mode == EXEC_MODE_DMA_FENCE) {
> > > > -		err = xe_hw_engine_group_get_mode(group, mode,
> > > > &previous_mode);
> > > > +		err = xe_hw_engine_group_get_mode(group, mode,
> > > > &previous_mode,
> > > > +						  syncs, num_syncs);
> > > >   		if (err)
> > > >   			goto err_syncs;
> > > >   	}
> > > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c
> > > > b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> > > > index 4d9263a1a208..35966889c776 100644
> > > > --- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
> > > > +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> > > > @@ -11,6 +11,7 @@
> > > >   #include "xe_gt.h"
> > > >   #include "xe_gt_stats.h"
> > > >   #include "xe_hw_engine_group.h"
> > > > +#include "xe_sync.h"
> > > >   #include "xe_vm.h"
> > > >   static void
> > > > @@ -21,7 +22,8 @@ hw_engine_group_resume_lr_jobs_func(struct
> > > > work_struct *w)
> > > >   	int err;
> > > >   	enum xe_hw_engine_group_execution_mode previous_mode;
> > > > -	err = xe_hw_engine_group_get_mode(group, EXEC_MODE_LR,
> > > > &previous_mode);
> > > > +	err = xe_hw_engine_group_get_mode(group, EXEC_MODE_LR,
> > > > &previous_mode,
> > > > +					  NULL, 0);
> > > >   	if (err)
> > > >   		return;
> > > > @@ -192,20 +194,32 @@ void
> > > > xe_hw_engine_group_resume_faulting_lr_jobs(struct xe_hw_engine_group
> > > > *group
> > > >    *
> > > >    * Return: 0 on success, negative error code on error.
> > > >    */
> > > > -static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct
> > > > xe_hw_engine_group *group)
> > > > +static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct
> > > > xe_hw_engine_group *group,
> > > > +						       struct
> > > > xe_sync_entry *syncs,
> > > > +						       int
> > > > num_syncs)
> > > >   {
> > > > -	int err;
> > > > +	int err, i;
> > > >   	struct xe_exec_queue *q;
> > > >   	bool need_resume = false;
> > > >   	lockdep_assert_held_write(&group->mode_sem);
> > > >   	list_for_each_entry(q, &group->exec_queue_list,
> > > > hw_engine_group_link) {
> > > > +		bool idle_skip_suspend;
> > > > +
> > > >   		if (!xe_vm_in_fault_mode(q->vm))
> > > >   			continue;
> > > >   		xe_gt_stats_incr(q->gt,
> > > > XE_GT_STATS_ID_HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_COUNT, 1);
> > > > -		need_resume |= !xe_exec_queue_idle_skip_suspend(q);
> > > > +
> > > > +		idle_skip_suspend =
> > > > xe_exec_queue_idle_skip_suspend(q);
> > > > +
> > > > +		if (!need_resume && !idle_skip_suspend && num_syncs)
> > > > {
> > > > +			for (i = 0; i < num_syncs; ++i)
> > > > +				xe_sync_entry_wait(syncs + i);
> > > Here we're in the write-locked mode, right? Ideally I think we should
> > > just check for idle here and return a retry if not idle, and wait
> > > outside of the locks. Perhaps also always wait if there are pf jobs
> > I think waiting outside the lock would be okay. Let me try that. I also
> > forgot that xe_sync_entry_wait needs to be interruptible too.
> > 
> > > running on the engine group. Also we might want to include the other
> > > implicit dependencies as well, like kernel fences.
> > > 
> > > Although perhaps this is good enough for now, and this would be easier
> > > implemented with a scheduler?
> > > 
> This is pretty much exactly what I had in mind as well. I started to doubt,
> though, if the drm scheduler would be a good fit since the dma-fence jobs
> wouldn't necessarily be ordered, since they wouldn't have published their

Yes, if you have mutliple 3d / display users with different sets of
dependencies this starts to fall apart a bit if single scheduler is used
for flipping a group.

> out-fences when in this "pre-scheduler". Also Joonas has mentioned at one
> point that pre-scheduling (like we already do, but this would be a more
> sophisticated version of) was disapproved by some arch or perhaps upstream
> decision at some historical point. We should find out exactly what that was
> all about before proceeding with this.
>

I'm not exactly following this part of if we circle back to this, I can
dig in here.

> > This is a fairly large rework, and the likelihood of me personally
> > having the bandwidth to implement this in the near future is low. Of
> > course, if you want to take this on, I can provide guidance on the
> > refactor.
> 
> My bandwidth for this is also zero ATM and up to end of January at least.
> 

Mine too. If someone else in group wants to pick it up, that would work too.

> > So for now, let’s tweak things to something we can live with and perhaps
> > write down plans for a long-term refactor.
> 
> Fully agree.
> 
> I think our backlog of nice cleanups and improvements like this is starting
> to grow so it would be good to have them documented in jiras and perhaps at
> a list which we can prioritze and have someone pick up when there is
> bandwidth.
> 

+1. Yes, I'd prefer stay on top of clean ups to avoid driver becoming
unmanagable mess.

Matt


> Thanks,
> 
> Thomas
> 
> 
> 
> > 
> > Matt
> > 
> > > /Thomas
> > > 
> > > 
> > > > +		}
> > > > +
> > > > +		need_resume |= !idle_skip_suspend;
> > > >   		q->ops->suspend(q);
> > > >   	}
> > > > @@ -258,7 +272,8 @@ static int
> > > > xe_hw_engine_group_wait_for_dma_fence_jobs(struct xe_hw_engine_group
> > > >   	return 0;
> > > >   }
> > > > -static int switch_mode(struct xe_hw_engine_group *group)
> > > > +static int switch_mode(struct xe_hw_engine_group *group,
> > > > +		       struct xe_sync_entry *syncs, int num_syncs)
> > > >   {
> > > >   	int err = 0;
> > > >   	enum xe_hw_engine_group_execution_mode new_mode;
> > > > @@ -268,7 +283,9 @@ static int switch_mode(struct xe_hw_engine_group
> > > > *group)
> > > >   	switch (group->cur_mode) {
> > > >   	case EXEC_MODE_LR:
> > > >   		new_mode = EXEC_MODE_DMA_FENCE;
> > > > -		err =
> > > > xe_hw_engine_group_suspend_faulting_lr_jobs(group);
> > > > +		err =
> > > > xe_hw_engine_group_suspend_faulting_lr_jobs(group,
> > > > +								
> > > > syncs,
> > > > +								
> > > > num_syncs);
> > > >   		break;
> > > >   	case EXEC_MODE_DMA_FENCE:
> > > >   		new_mode = EXEC_MODE_LR;
> > > > @@ -294,7 +311,8 @@ static int switch_mode(struct xe_hw_engine_group
> > > > *group)
> > > >    */
> > > >   int xe_hw_engine_group_get_mode(struct xe_hw_engine_group *group,
> > > >   				enum
> > > > xe_hw_engine_group_execution_mode new_mode,
> > > > -				enum
> > > > xe_hw_engine_group_execution_mode *previous_mode)
> > > > +				enum
> > > > xe_hw_engine_group_execution_mode *previous_mode,
> > > > +				struct xe_sync_entry *syncs, int
> > > > num_syncs)
> > > >   __acquires(&group->mode_sem)
> > > >   {
> > > >   	int err = down_read_interruptible(&group->mode_sem);
> > > > @@ -311,7 +329,7 @@ __acquires(&group->mode_sem)
> > > >   			return err;
> > > >   		if (new_mode != group->cur_mode) {
> > > > -			err = switch_mode(group);
> > > > +			err = switch_mode(group, syncs, num_syncs);
> > > >   			if (err) {
> > > >   				up_write(&group->mode_sem);
> > > >   				return err;
> > > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.h
> > > > b/drivers/gpu/drm/xe/xe_hw_engine_group.h
> > > > index 797ee81acbf2..8b17ccd30b70 100644
> > > > --- a/drivers/gpu/drm/xe/xe_hw_engine_group.h
> > > > +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.h
> > > > @@ -11,6 +11,7 @@
> > > >   struct drm_device;
> > > >   struct xe_exec_queue;
> > > >   struct xe_gt;
> > > > +struct xe_sync_entry;
> > > >   int xe_hw_engine_setup_groups(struct xe_gt *gt);
> > > > @@ -19,7 +20,8 @@ void xe_hw_engine_group_del_exec_queue(struct
> > > > xe_hw_engine_group *group, struct
> > > >   int xe_hw_engine_group_get_mode(struct xe_hw_engine_group *group,
> > > >   				enum
> > > > xe_hw_engine_group_execution_mode new_mode,
> > > > -				enum
> > > > xe_hw_engine_group_execution_mode *previous_mode);
> > > > +				enum
> > > > xe_hw_engine_group_execution_mode *previous_mode,
> > > > +				struct xe_sync_entry *syncs, int
> > > > num_syncs);
> > > >   void xe_hw_engine_group_put(struct xe_hw_engine_group *group);
> > > >   enum xe_hw_engine_group_execution_mode
> > > > diff --git a/drivers/gpu/drm/xe/xe_sync.c
> > > > b/drivers/gpu/drm/xe/xe_sync.c
> > > > index 1fc4fa278b78..127e26129933 100644
> > > > --- a/drivers/gpu/drm/xe/xe_sync.c
> > > > +++ b/drivers/gpu/drm/xe/xe_sync.c
> > > > @@ -228,6 +228,20 @@ int xe_sync_entry_add_deps(struct xe_sync_entry
> > > > *sync, struct xe_sched_job *job)
> > > >   	return 0;
> > > >   }
> > > > +/**
> > > > + * xe_sync_entry_wait() - Wait on in-sync
> > > > + * @sync: Sync object
> > > > + *
> > > > + * If the sync is in an in-sync, wait on the sync to signal.
> > > > + */
> > > > +void xe_sync_entry_wait(struct xe_sync_entry *sync)
> > > > +{
> > > > +	if (sync->flags & DRM_XE_SYNC_FLAG_SIGNAL)
> > > > +		return;
> > > > +
> > > > +	dma_fence_wait(sync->fence, false);
> > > > +}
> > > > +
> > > >   void xe_sync_entry_signal(struct xe_sync_entry *sync, struct
> > > > dma_fence *fence)
> > > >   {
> > > >   	if (!(sync->flags & DRM_XE_SYNC_FLAG_SIGNAL))
> > > > diff --git a/drivers/gpu/drm/xe/xe_sync.h
> > > > b/drivers/gpu/drm/xe/xe_sync.h
> > > > index 51f2d803e977..1c08f9ed9001 100644
> > > > --- a/drivers/gpu/drm/xe/xe_sync.h
> > > > +++ b/drivers/gpu/drm/xe/xe_sync.h
> > > > @@ -29,6 +29,7 @@ int xe_sync_entry_add_deps(struct xe_sync_entry
> > > > *sync,
> > > >   			   struct xe_sched_job *job);
> > > >   void xe_sync_entry_signal(struct xe_sync_entry *sync,
> > > >   			  struct dma_fence *fence);
> > > > +void xe_sync_entry_wait(struct xe_sync_entry *sync);
> > > >   void xe_sync_entry_cleanup(struct xe_sync_entry *sync);
> > > >   struct dma_fence *
> > > >   xe_sync_in_fence_get(struct xe_sync_entry *sync, int num_sync,

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 294CFCCD193
	for <intel-xe@archiver.kernel.org>; Thu, 23 Oct 2025 20:54:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCC6210E94A;
	Thu, 23 Oct 2025 20:54:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Coyt1YLP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1732C10E94A
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Oct 2025 20:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761252877; x=1792788877;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=+eoDH9cueBc9LooAKP7FQimAErhpRuwYV+M7U/wMI8M=;
 b=Coyt1YLPH+MKSK8PF0eRcxIz/5JwABnkr8vC9TLASvVD8/k22//u5lqL
 qUrMrVKRsLtaNhrKUxJrFt5M1kIT1kasLlNUIl2mVcnm6LBCIKWFPhk7d
 r61cT0rzlz4pKSELJcVBIpRE3fDepke9C+kIUpbBR/EogeQOCzOl3+oae
 0GU12ywSzWGe8MYzFqwcwu3Biq1DmSdTs8UZrw1EzUI7IrwnDASHFhm3O
 7jKfqXNJfkacQ5FGqumA+ifhJ8YZn6itQidtySRxlbHVeoFVShwMNys2b
 eb+9UAjtjs/LPkS4oJW84cEuaJby8Y8ONDe0/IY2EN2YEV9R7V3ATIZoK g==;
X-CSE-ConnectionGUID: Vc8NytKpR5KJc5b45Hn6Tg==
X-CSE-MsgGUID: H52qC94UQ1y6W4b39Atmzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63358796"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63358796"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 13:54:36 -0700
X-CSE-ConnectionGUID: 7BBd+mwkQ9KGQaevYZspOA==
X-CSE-MsgGUID: tdUfT0bFRm+TYxYj947P6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="184153590"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 13:54:35 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 13:54:35 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 13:54:35 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.4) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 13:54:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ils58IJhZLfXqD5Dx/rSBd5Jm+N6zU85EQfa42uF8WgEDHPrhyx2b5U4eCgffHMBwNYAJfgLt6Ye+pFmxJ/ijuX7Y8iWAhRS3Hnbpi7GF1zBlTylr77AGdtkM3uhdanQQCpim6KvBINiMHAXblon+Bk90fU6PJ5fH3N+pKnv/C0EODnc/HS/3IHUpYizbRKD/mvJ0qzOP2TSgm7ky9s2Z0bf7m/mALSMIpI1X7CXVRfNKU65hGDW3sJnRfy6uyc6OJZX+ciIYdvBZyYq7pbDCSMhYDxKXASk1159QZjgDbdE9VCDa4dK6t55uv1oVT9TXpyJd+pnWVEPzjwT7l0DTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1HQAXEb7CemE5S/F7gaYoCYq8zBy2W35orZspEi4pic=;
 b=x1HIlyOvgiFxWZqReMMfT48EUB3ZytiqL8Q4M6CQV3LGivLbiddJ47hXPNU2W7s0Rrq3xtqZQegzWo802GIXtXcesoDMCQBRZpakM3EFeO854p9PowTlbxS1jcRJWBZu/DJIZvK8qPu31r/PIBYnc1O5KKus1cD5p/MQDU3UsBUZspRMvGK2Z1bb72KoCgUlZ8irt69DsuVlALb9czjLhW2lU9ghhTt4zAN7xagOeOrvGXO1/mF0QXz3yR8dKfyxV+G1MGiEpZyCjmlcPSv/ScZsrDgLRXbhUz9BMzTSyLKe2eucFj6/4ePOYeatNzSH5j1//uXHYoh0XaqaseC5jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7171.namprd11.prod.outlook.com (2603:10b6:930:92::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 20:54:15 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 20:54:15 +0000
Date: Thu, 23 Oct 2025 13:54:12 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe/vf: Introduce RESFIX start marker support
Message-ID: <aPqV9KkURocMje+S@lstrano-desk.jf.intel.com>
References: <20251023153616.3790-4-satyanarayana.k.v.p@intel.com>
 <20251023153616.3790-5-satyanarayana.k.v.p@intel.com>
 <aPqSDVJ4QR7kzT07@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aPqSDVJ4QR7kzT07@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR03CA0085.namprd03.prod.outlook.com
 (2603:10b6:303:b6::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7171:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a368949-5f2a-4ab7-8b6b-08de1276536c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TXBIemRRRnJZY0UxeEQ3dzBiVW01R1paZXdPcjJlc0hFNEF6TWpWK2lYVGZO?=
 =?utf-8?B?cXRTcDFlYm5IeXpYL1FPWituNUZuWm1jbXlhaEh1UXc5MmtKN3RxTnJrOUZU?=
 =?utf-8?B?YXJzcHNSR3FkTnhldFVTcVF4enArOXEvMWJMckh2L3d3NVZiRHFzaHVpNDNJ?=
 =?utf-8?B?WWo2T1hFUlYyb1YyaXY3QVIzWjZlRXVTNmhIUjFHN0hoT0hzMkNzcmNWbE5S?=
 =?utf-8?B?SDNOK0huNUlrMG1ubGJ2aDVmZEJYdFg5eEova3J4dkRrM0Vjd0ZTYVRLWk41?=
 =?utf-8?B?Tzh1SEhqQjRXWTlIQk1mUWR0dkNVSWJXOFZBb3E3Vy9aVzA3TVhreTNZbTBB?=
 =?utf-8?B?VmNCY2NNYm1mUG5CNnBsOW5qUEM3Z1FSZEdxUkdpL0ErL1hpS2pPSHhrelNH?=
 =?utf-8?B?bmY5QVlHL2krdGJvK2dvN2Z3TFFjelFVZmZHTE0wc0hSZGdxMHg5R0J3cTZK?=
 =?utf-8?B?N24wQ01mZGNiM0JrWXBrNTl0VFIya3pvbzNNbU8rK2RBVzQxZWdIWkl4bThJ?=
 =?utf-8?B?ZmE4aXdNaXczYkZsLzlMaU9IR3h3c1BST3NpTzdMaTU3dFNaUHlFczBKSENO?=
 =?utf-8?B?L3NvU0FTWDY5OEY1NDJLNmdocXVoYnlwU3FaUDZ4dGtTNzJuQ28xMVhSQXdV?=
 =?utf-8?B?WjVVVkt2RVF3OU1nNnFTaVFIZUhTc01zV0tFcm5FQW9ZVzA2ZFF3NFZnUVQ1?=
 =?utf-8?B?TDdzMzVLMzFHRDFrN3RERXRtM1FSeW02cmhhcHJ6UTdnUVFpL2EvZFJhbzA2?=
 =?utf-8?B?WkphZlF5RUlVbkFPY2N2bzRJT0dNZGZreUVaNTlGdjNXWnRjSVVFV3dQOVla?=
 =?utf-8?B?N0pJa0FKWm85WUtTQk44OGpvUzgyWC8zOUw4VXJuU3g2VmhHeGNZMmNsenpF?=
 =?utf-8?B?QzJFaWNha2dpTS9HYnFZY3FlV1BTaUlkQlR5Sm9jZ0dVb2dMcmhzOG1DSVNG?=
 =?utf-8?B?MVdYS1liMEFNWmVOUEVJY2h5cmNxMW9tZVh0VG1lWmdQWk1GMnc5dXJaMjdY?=
 =?utf-8?B?RlFDUmlHQUw1NitSeUYvMmRzeHVzU1BYa2M3bVVTdjYzakFHYzhuYk03Q1hU?=
 =?utf-8?B?dmFzbDBrcDdVTUN2RzRJZ2cyUmNXQjJZalBhUURiZmhOa2VTUHF3YlV1ZmNS?=
 =?utf-8?B?djMxNWZSSVRheXlyVTNwc0ZTU2x1TlVWdXVkTDJ4U1FEMXlWRnpaZGNwY2U3?=
 =?utf-8?B?bEhEbDNOc05UMHRjd2hSc0thWHdTcnl4MXF2T1FaYkw1cUowb3o1ZjZYRmtT?=
 =?utf-8?B?YXd0bVVnOFJnUldJdzhzR3hLVHF2c2tnZTJ0T3Zvd0hpQ3ZuQ2JGL3kwc3Ur?=
 =?utf-8?B?NkJmNFRjdXJHK0RIZWlsYkd1UzFwdlp5VHBmcFRNT1ZOWXAzdUI0Ni83T3NU?=
 =?utf-8?B?aHpCN0JDd0k3cERXL2NLa1JxTFYzSjFYRXdpZEhEb1FkeDJxNExObUJXZmNt?=
 =?utf-8?B?d0owZVFmNkQwMXVBQ2ptSEFPbnF4K2Q3TnkxUzU0MXlrMlVZMHBiQkdHa09s?=
 =?utf-8?B?VU5BZ0huaFNDK3ZYaDlzUEFYeSs5TGtydVhqMmpxalBYQ0dsMnF2Ly96UGZ0?=
 =?utf-8?B?emUxN0RHYkdUUi9SOU1ReVV1SzZJUXBXamhtaUt3RTIyKzZvb3dZMy9TRDZm?=
 =?utf-8?B?UUwrRm50aTBLV2c4WFBsQ3dCTXdlWWpEMU9LbGdPdzcxOVJRRGdERXRTalY0?=
 =?utf-8?B?a2d0M09qbU80ZkJYQXY0VHp0MFJzTFVvcHh1TWlTZHRaUm1tMzhlb205Qnoz?=
 =?utf-8?B?TnR1R1haK0Q1T1VIOUhVcVFnaktmZWhoMTc5bWN6LzJSeHoxR1R2V2taVUtW?=
 =?utf-8?B?aEdmdy9yUVR4KzZwWW4wVVdxMTZIL2ZRZ0ptd2gvbzc0RXlQamNmYjAwcVhJ?=
 =?utf-8?B?YUJZRzVUT2o1SnRrdDFDcnhvUUYzT2kxZktLL0Y3djZOWTBGaVozaU9qdTVB?=
 =?utf-8?B?MzF2N1o2Mk1iSTRVL1F0aXVsNURVRDF1L2ZPZW1SZVcxMEZ3M1BFVlN2amtE?=
 =?utf-8?B?dUxhaThvNEJBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkpzOWdXRzJ5cXVEcG10R2dvQ1NWNFowakkrQUpyUytkMlkvQ2YvaUdmcExi?=
 =?utf-8?B?UzVLVmVCWlNobTlRaHQ1OVk1SkllOG1wbjBkbXVQNVpMVVFaUXRXTWFtUUY1?=
 =?utf-8?B?bUlFVGt6QytXWWgzYnBTa21jTzU2V3c0SG5GaDdqeDRIVGpVaDRzaXRlbjU2?=
 =?utf-8?B?eFVRUmw2MDh4cldlVUZJdzRoZFNqNWZjVGE5bFFZNXQwNkFOanBIZUFrdGh1?=
 =?utf-8?B?N0pBeGdCUDY0SVNCTHhTdEpKK3RqcHh1eVpHNFVVSkU0WDU0dkliK2pSbW1N?=
 =?utf-8?B?Z0lEd0d4RGZiL2ZHanlNUVlPclVYUFJrUzFaSXlEcE5pWTU5U0I2MW1SUlNR?=
 =?utf-8?B?QWlwWW04V1J5bnZZU296aVFpaFJ4MndxamtFc3V3eHFEMjJPWXRJTmFLZFky?=
 =?utf-8?B?RkpuUy85RzJwcC9zRjVaV2Q2ZENoa2JWVjY4OHY4UnJ0NFhvR2lOZW1hZTNE?=
 =?utf-8?B?QVdyVXQ5WDV0alB6QmppVWMybk90Y2xXTUlwcmVlVzhSMnZ2dTBFWkdZN05v?=
 =?utf-8?B?WFJxWXl4VzVQcEF0bWhXckpTZDg0NG9PS1hBYjRaaGZhajJXak1FdUJkL0Jr?=
 =?utf-8?B?d3N3SU90UWE5Ykpqc3o2L2VmYS8yblc0RXNxVmhvRDR0a3ZpRUNXUFRzcUZP?=
 =?utf-8?B?YjdoMXI2dkczeWpQTklUMld0bkhnUzQ5eDF0cktNcTZNUTAzRkJaQllCdUVm?=
 =?utf-8?B?Mi9BZTRTQkJjUnF6V3pBR3BFTWMvOWFGMUt2Y0NjOVhMdXp6VUJhWFhjSGdD?=
 =?utf-8?B?TUdqNTRPTWVJZUtGSGJEbVcyQ1Y4dFBZQ2xCSkRTUzdOYW1oTEpQYlNlVDcw?=
 =?utf-8?B?MVJ2QnVlZWZUWU02TEhqWDVpeVdQWVRpb1R1dENpTzlsSm1aWDViMDJMdHJh?=
 =?utf-8?B?SU9wZC9zQm5UalROeGRQQkhxT0loL0RyL3M0Y1lvMFpYa2RPSnhIQUVkRG1R?=
 =?utf-8?B?cElyRFpLMUVvenRsd2tCYzdvTnNlaEJZY2dYQ3V2Z3F3bVIxNTRVc2E1TVJX?=
 =?utf-8?B?bW9JbVNyYTFGcE9tdzJJWnExakhzMHVhbm5VL3dFSTFlOTFsL012eXVMdDYv?=
 =?utf-8?B?bzdtNWZmM3JGMFNTaWxpdDN2R2VRRlMyd0Q2Y3lUWklIUnFGV1YwVUp4MGNh?=
 =?utf-8?B?NHZkcFJUbHNNTW5OMjI2ZHNDTmVWdVhpc0ljWXRLaWNZNzNEeHpSL0N0emVD?=
 =?utf-8?B?Y3pQSVBzekcwRWphRjBqemhuL0NHcjd5UTVOMmpRTlcveFBGYXg0VE5pWG0v?=
 =?utf-8?B?VXF1KzBUNDNyaTY3amxzcXVCSEtqQnlMM1ZjOTRuQzlBZU9sOGJ6QlNyS1NE?=
 =?utf-8?B?aEFvSXJDaFBRTmNEVTVNclhDRjNsbHNxMVJXYlNYenpvQ05sQWY1WGp3dDJR?=
 =?utf-8?B?all2Z09NckVsR0JXZTBHTUdhL2lhTG5VMGZSWERkbEM5V3RQSTVFR3VRcjFJ?=
 =?utf-8?B?RjdDaEhZa3p6WVh2YmxYUFVtdmwydU4rZnloKzNYa1VPbkUzT2w5cTAySEQr?=
 =?utf-8?B?Vm81TWcxSUR4dFp2MEgwcVpyZzdUTDV6ZnVPYi9PQ25sNUNZVmdPdlJXWGg4?=
 =?utf-8?B?R0M3U01aZGlvdkxxYU9PclhFa2Fya0htbGdyVkRUQ1c3d1k5WjROek9nTUdJ?=
 =?utf-8?B?STUvTWZDMnAxc3BmL01FTjlpRGY3YWZ2SnZ1TW9UTkhDL0VrYXNnVDJxM2VW?=
 =?utf-8?B?eGhzVWMxaWNSLzVPN05HS0hwM3ZmV3ZDNWNMaVJVSi9uMW1XUlZDRlhIcXlG?=
 =?utf-8?B?NkkzMk51RjNPQjBJNkVxWTI3VFdla0lnbWZhVkRxaHJTRUpUQmNZZkpxRUVG?=
 =?utf-8?B?N29OcUN4ZldaWi82TEREc0Q1SlZSYXZhN1ArbmNjUkxmQW5wUkNXTXdnV1dY?=
 =?utf-8?B?TlQ3NVVML2FodEg5TlpaRHVWQzV4TnMrdTNyRnFnTUxMc3dkTWJYYXp4YUps?=
 =?utf-8?B?SGZnUWhUaG5RWHN6ZHR5QVZDK3U4aHZTSXlNeFNWVjNNdzBuOWFadFRKVi9w?=
 =?utf-8?B?Z0VGdFpaVW0zSjB0WFltQWYzRzdtY01TNTNnVFlJSXBDclJkNzdwSG45cXNK?=
 =?utf-8?B?RXpJTDFGejYwcnI3SGJ0V0NQRVowVG13WWoybXBOb0J4TFozZk14NW5hL1Ni?=
 =?utf-8?B?amRHcDRwRDlYeEI3UVdWZGVaNnNFUlpLeW9NTGNtR2RFOEdDOGpFVnVjSkQr?=
 =?utf-8?B?T3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a368949-5f2a-4ab7-8b6b-08de1276536c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 20:54:15.1281 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rT3ZRnaErqBNMiuWGDiOy+8+JCHyxsVNPmW9VgEM12VIl94NXsAqSBwxFpJQ7sioHHg27+ND3FYcWi5s1pVeGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7171
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

On Thu, Oct 23, 2025 at 01:37:33PM -0700, Matthew Brost wrote:
> On Thu, Oct 23, 2025 at 09:06:11PM +0530, Satyanarayana K V P wrote:
> > Post migration, a marker is sent to the GUC prior to the start of resource
> > fixups to indicate start of resource fixups. The same marker is sent along
> > with RESFIX_DONE notification so that GUC can avoid submitting jobs to HW
> > in case of double migration.
> > 
> > Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Tomasz Lis <tomasz.lis@intel.com>
> > 
> > ---
> > V1 -> V2:
> > - Squashed "Enable RESFIX start marker only on supported GUC
> > versions" commit into a single commit. (Matt B)
> > ---
> >  .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    | 38 ++++++++
> >  drivers/gpu/drm/xe/xe_gt_sriov_vf.c           | 87 +++++++++++++++++--
> >  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h     |  5 ++
> >  drivers/gpu/drm/xe/xe_sriov_vf.c              | 42 ++++++++-
> >  drivers/gpu/drm/xe/xe_sriov_vf_types.h        |  5 ++
> >  5 files changed, 169 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> > index 0b28659d94e9..b9141497bfd5 100644
> > --- a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> > +++ b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> > @@ -656,4 +656,42 @@
> >  #define PF2GUC_SAVE_RESTORE_VF_RESPONSE_MSG_LEN		GUC_HXG_RESPONSE_MSG_MIN_LEN
> >  #define PF2GUC_SAVE_RESTORE_VF_RESPONSE_MSG_0_USED	GUC_HXG_RESPONSE_MSG_0_DATA0
> >  
> > +/**
> > + * DOC: VF2GUC_NOTIFY_RESFIX_START
> > + *
> > + * This action is used by VF to notify the GuC that the VF KMD will be starting
> > + * post-migration recovery steps.
> > + *
> > + * This message must be sent as `MMIO HXG Message`_.
> > + *
> > + *  +---+-------+--------------------------------------------------------------+
> > + *  |   | Bits  | Description                                                  |
> > + *  +===+=======+==============================================================+
> > + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_HOST_                                |
> > + *  |   +-------+--------------------------------------------------------------+
> > + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_REQUEST_                                 |
> > + *  |   +-------+--------------------------------------------------------------+
> > + *  |   | 27:16 | DATA0 = MBZ                                                  |
> > + *  |   +-------+--------------------------------------------------------------+
> > + *  |   |  15:0 | ACTION = _`GUC_ACTION_VF2GUC_NOTIFY_RESFIX_START` = 0x550F   |
> > + *  +---+-------+--------------------------------------------------------------+
> > + *
> > + *  +---+-------+--------------------------------------------------------------+
> > + *  |   | Bits  | Description                                                  |
> > + *  +===+=======+==============================================================+
> > + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_GUC_                                 |
> > + *  |   +-------+--------------------------------------------------------------+
> > + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_RESPONSE_SUCCESS_                        |
> > + *  |   +-------+--------------------------------------------------------------+
> > + *  |   |  27:0 | DATA0 = MBZ                                                  |
> > + *  +---+-------+--------------------------------------------------------------+
> > + */
> > +#define GUC_ACTION_VF2GUC_NOTIFY_RESFIX_START          0x550Fu
> > +
> > +#define VF2GUC_NOTIFY_RESFIX_START_REQUEST_MSG_LEN     GUC_HXG_REQUEST_MSG_MIN_LEN
> > +#define VF2GUC_NOTIFY_RESFIX_START_REQUEST_MSG_0_MBZ   GUC_HXG_REQUEST_MSG_0_DATA0
> > +
> > +#define VF2GUC_NOTIFY_RESFIX_START_RESPONSE_MSG_LEN    GUC_HXG_RESPONSE_MSG_MIN_LEN
> > +#define VF2GUC_NOTIFY_RESFIX_START_RESPONSE_MSG_0_MBZ  GUC_HXG_RESPONSE_MSG_0_DATA0
> > +
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > index d0b102ab6ce8..8c1448d6c81d 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > @@ -299,12 +299,55 @@ void xe_gt_sriov_vf_guc_versions(struct xe_gt *gt,
> >  		*found = gt->sriov.vf.guc_version;
> >  }
> >  
> > -static int guc_action_vf_notify_resfix_done(struct xe_guc *guc)
> > +static int guc_action_vf_notify_resfix_start(struct xe_guc *guc, u16 marker)
> >  {
> >  	u32 request[GUC_HXG_REQUEST_MSG_MIN_LEN] = {
> >  		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
> >  		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
> > -		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE),
> > +		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION,
> > +			   GUC_ACTION_VF2GUC_NOTIFY_RESFIX_START) |
> > +		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_DATA0, marker),
> > +	};
> > +	int ret;
> > +
> > +	ret = xe_guc_mmio_send(guc, request, ARRAY_SIZE(request));
> > +
> > +	return ret > 0 ? -EPROTO : ret;
> > +}
> > +
> > +/**
> > + * vf_notify_resfix_start - Notify GuC about start of resource fixups.
> > + * @gt: the &xe_gt struct instance linked to target GuC
> > + * @marker: marker to identify the migration.
> > + *
> > + * Returns: 0 if the operation completed successfully, or a negative error
> > + * code otherwise.
> > + */
> > +static int vf_notify_resfix_start(struct xe_gt *gt, u16 marker)
> > +{
> > +	struct xe_guc *guc = &gt->uc.guc;
> > +	int err;
> > +
> > +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> > +
> > +	err = guc_action_vf_notify_resfix_start(guc, marker);
> > +	if (unlikely(err))
> > +		xe_gt_sriov_err(gt, "Failed to notify GuC about resource fixup start (%pe)\n",
> > +				ERR_PTR(err));
> > +	else
> > +		xe_gt_sriov_dbg_verbose(gt, "sent GuC resource fixup start\n");
> > +
> > +	return err;
> > +}
> > +
> > +static int guc_action_vf_notify_resfix_done(struct xe_guc *guc, u16 marker)
> > +{
> > +	u32 request[GUC_HXG_REQUEST_MSG_MIN_LEN] = {
> > +		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
> > +		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
> > +		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION,
> > +			   GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE) |
> > +		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_DATA0, marker),
> >  	};
> >  	int ret;
> >  
> > @@ -316,18 +359,19 @@ static int guc_action_vf_notify_resfix_done(struct xe_guc *guc)
> >  /**
> >   * vf_notify_resfix_done - Notify GuC about resource fixups apply completed.
> >   * @gt: the &xe_gt struct instance linked to target GuC
> > + * @marker: marker to identify the migration.
> >   *
> >   * Returns: 0 if the operation completed successfully, or a negative error
> >   * code otherwise.
> >   */
> > -static int vf_notify_resfix_done(struct xe_gt *gt)
> > +static int vf_notify_resfix_done(struct xe_gt *gt, u16 marker)
> >  {
> >  	struct xe_guc *guc = &gt->uc.guc;
> >  	int err;
> >  
> >  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> >  
> > -	err = guc_action_vf_notify_resfix_done(guc);
> > +	err = guc_action_vf_notify_resfix_done(guc, marker);
> >  	if (unlikely(err))
> >  		xe_gt_sriov_err(gt, "Failed to notify GuC about resource fixup done (%pe)\n",
> >  				ERR_PTR(err));
> > @@ -1183,7 +1227,7 @@ static void vf_post_migration_abort(struct xe_gt *gt)
> >  	xe_guc_submit_pause_abort(&gt->uc.guc);
> >  }
> >  
> > -static int vf_post_migration_notify_resfix_done(struct xe_gt *gt)
> > +static int vf_post_migration_notify_resfix_done(struct xe_gt *gt, u16 marker)
> >  {
> >  	bool skip_resfix = false;
> >  
> > @@ -1206,12 +1250,27 @@ static int vf_post_migration_notify_resfix_done(struct xe_gt *gt)
> >  	 */
> >  	xe_irq_resume(gt_to_xe(gt));
> >  
> > -	return vf_notify_resfix_done(gt);
> > +	return vf_notify_resfix_done(gt, marker);
> > +}
> > +
> > +static bool vf_resfix_start_marker_supported(struct xe_gt *gt)
> > +{
> > +	struct xe_device *xe = gt_to_xe(gt);
> > +
> > +	xe_gt_assert(gt, IS_SRIOV_VF(xe));
> > +	return xe->sriov.vf.migration.resfix_marker_enabled;
> > +}
> > +
> > +static u16 vf_post_migration_resfix_start_marker(struct xe_gt *gt)
> > +{
> > +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> > +	return ++gt->sriov.vf.migration.resfix_marker;
> >  }
> >  
> >  static void vf_post_migration_recovery(struct xe_gt *gt)
> >  {
> >  	struct xe_device *xe = gt_to_xe(gt);
> > +	u16 marker = 0;
> >  	int err;
> >  	bool retry;
> >  
> > @@ -1227,13 +1286,27 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
> >  		goto fail;
> >  	}
> >  
> > +	/*
> > +	 * Increment the startup marker again if it overflows, since GUC
> > +	 * requires a non-zero marker to be set.
> > +	 */
> > +	if (vf_resfix_start_marker_supported(gt)) {
> > +		marker = vf_post_migration_resfix_start_marker(gt);
> > +		if (!marker)
> > +			marker = vf_post_migration_resfix_start_marker(gt);
> 
> Nit: Maybe just don't zero in vf_post_migration_resfix_start_marker.
> 
> > +	}
> > +
> > +	err = vf_notify_resfix_start(gt, marker);
> > +	if (err)
> > +		goto fail;
> > +
> >  	err = vf_post_migration_fixups(gt);
> >  	if (err)
> >  		goto fail;
> >  
> >  	vf_post_migration_rearm(gt);
> >  
> > -	err = vf_post_migration_notify_resfix_done(gt);
> > +	err = vf_post_migration_notify_resfix_done(gt, marker);
> >  	if (err && err != -EAGAIN)
> >  		goto fail;
> >  
> 
> Nit: You missed my comment skipping kickstart if err == -EAGAIN but I
> think that harmless, in existing code, and can be done in a follow up.
> 
> Anyways patch looks functionaly correct to me:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Actually it is not functional. This patch has the same problem [1] which
was fixed in:

git format-patch -1 c88634339757736b86ed45c08bae74b4f47ed9d9

More on that below.

[1] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v2/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-on.html

> 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > index 420b0e6089de..ccd850313328 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > @@ -60,6 +60,11 @@ struct xe_gt_sriov_vf_migration {
> >  	bool recovery_inprogress;
> >  	/** @ggtt_need_fixes: VF GGTT needs fixes */
> >  	bool ggtt_need_fixes;
> > +	/**
> > +	 * @resfix_marker: Marker sent to Guc prior to starting the
> > +	 * post‑migration.
> > +	 */
> > +	u16 resfix_marker;
> >  };
> >  
> >  /**
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> > index 39c829daa97c..10d6e43fffce 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> > +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> > @@ -55,7 +55,21 @@
> >   * When the VF driver is ready to continue operation on the newly connected
> >   * hardware, it sends `VF2GUC_NOTIFY_RESFIX_DONE` which causes it to
> >   * enter the long awaited `VF_RUNNING` state, and therefore start handling
> > - * CTB messages and scheduling workloads from the VF::
> > + * CTB messages and scheduling workloads from the VF.
> > + *
> > + * In scenarios involving double migration, the VF KMD may encounter situations
> > + * where it is instructed to re-migrate before having the opportunity to send
> > + * RESFIX_DONE for the initial migration. This can occur when the fix-up for the
> > + * prior migration is still underway, but the VF KMD is migrated again.
> > + * Consequently, this may lead to the possibility of sending two migration
> > + * notifications (i.e., pending fix-up for the first migration and a second
> > + * notification for the new migration). Upon receiving the first RES_FIX
> > + * notification, the GuC will resume VF submission on the GPU, potentially
> > + * resulting in undefined behavior, such as system hangs or crashes.
> > + *
> > + * To avoid these hangs, a new VF2GUC action `VF2GUC_NOTIFY_RESFIX_START` is
> > + * sent along with marker and when GUC receives the same marker with
> > + * `VF2GUC_NOTIFY_RESFIX_DONE`action, it starts scheduling work loads from VF::
> >   *
> >   *      PF                             GuC                              VF
> >   *     [ ]                              |                               |
> > @@ -102,6 +116,11 @@
> >   *      |                              [ ]        new VF provisioning  [ ]
> >   *      |                              [ ]---------------------------> [ ]
> >   *      |                               |                              [ ]
> > + *      |                               |   VF2GUC_NOTIFY_RESFIX_START [ ]
> > + *      |                              [ ] <---------------------------[ ]
> > + *      |                              [ ]                             [ ]
> > + *      |                              [ ]                     success [ ]
> > + *      |                              [ ]---------------------------> [ ]
> >   *      |                               |       VF driver applies post [ ]
> >   *      |                               |      migration fixups -------[ ]
> >   *      |                               |                       |      [ ]
> > @@ -169,6 +188,26 @@ static void vf_migration_init_early(struct xe_device *xe)
> >  
> >  }
> >  
> > +static void vf_resfix_start_marker_init_early(struct xe_device *xe)
> > +{
> > +	struct xe_gt *gt = xe_root_mmio_gt(xe);
> > +	struct xe_uc_fw_version guc_version;
> > +
> > +	if (xe->sriov.vf.migration.disabled)
> > +		return;
> > +
> > +	xe_gt_sriov_vf_guc_versions(gt, NULL, &guc_version);
> > +	if (MAKE_GUC_VER_STRUCT(guc_version) < MAKE_GUC_VER(1, 24, 10)) {
> > +		xe_sriov_notice(xe,
> > +				"Resfix start marker requires GUC ABI >= 1.24.10, but only %u.%u.%u found",
> > +				guc_version.major, guc_version.minor, guc_version.patch);
> > +		return;
> > +	}
> > +
> > +	xe->sriov.vf.migration.resfix_marker_enabled = true;
> > +	xe_sriov_dbg(xe, "migrate: Resfix start marker support is enabled\n");
> > +}
> > +

As with:
git format-patch -1 c88634339757736b86ed45c08bae74b4f47ed9d9

xe_gt_sriov_vf_guc_versions isn't available in 'init_early', so this
step needs to be moved 'init_late' like the CCS check. I suggest
following Michal's suggestion of start with marker enabled, then disable
it late.

Matt

> >  /**
> >   * xe_sriov_vf_init_early - Initialize SR-IOV VF specific data.
> >   * @xe: the &xe_device to initialize
> > @@ -176,6 +215,7 @@ static void vf_migration_init_early(struct xe_device *xe)
> >  void xe_sriov_vf_init_early(struct xe_device *xe)
> >  {
> >  	vf_migration_init_early(xe);
> > +	vf_resfix_start_marker_init_early(xe);
> >  }
> >  
> >  /**
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_types.h
> > index d5f72d667817..626c11a6dd1b 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_vf_types.h
> > +++ b/drivers/gpu/drm/xe/xe_sriov_vf_types.h
> > @@ -38,6 +38,11 @@ struct xe_device_vf {
> >  		 * was turned off due to missing prerequisites
> >  		 */
> >  		bool disabled;
> > +		/**
> > +		 * @migration.resfix_marker_enabled: flag indicating if resfix marker
> > +		 * support was enabled or not due to missing prerequisites.
> > +		 */
> > +		bool resfix_marker_enabled;
> >  	} migration;
> >  
> >  	/** @ccs: VF CCS state data */
> > -- 
> > 2.51.0
> > 

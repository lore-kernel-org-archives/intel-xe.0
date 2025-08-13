Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA5AC87FCF
	for <intel-xe@archiver.kernel.org>; Wed, 13 Aug 2025 15:51:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95D5A10E07F;
	Wed, 13 Aug 2025 15:51:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JVusArZF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E6C010E07F
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Aug 2025 15:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755100261; x=1786636261;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=eQK+giGJudWVSmH/yrdUC8crwdtFsDK449yKmd6Y/BI=;
 b=JVusArZFUEQrQOSwoJkgk//rfHfb5z6LFWzherdE7YUHR4WNRjMfUJD4
 Lid3uyetHhkrEBJP2W9bIuANDS30xlBw8ySKt6/vh+ysXDiqVISGCjwvA
 3wNvPsPzb/fVA3n4qFyt6BRav4KMwmpZrRJUlkEBWKsH5ZJL/ClYTbzEs
 +Dvowwodk2evk7NQkLHnuunVE2q51v/1lT6PjRdGOcHI6rudhRxvh39OE
 HMBylhM3u4oU5jAHawa8CROmlRExtNMQwGJedvytr2c5GrsoRl3Zdesat
 IMjz3t2MUi8yOGfIfmB9XIHgGufEk/99l9CRqg4N5WiEhM8u9iDb1iz7E w==;
X-CSE-ConnectionGUID: 74IjzwupT+adsL0V/fJHxg==
X-CSE-MsgGUID: 1rcuemA2TWOYb5xeXE/26A==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="82834690"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="82834690"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 08:51:01 -0700
X-CSE-ConnectionGUID: VLW7QJUBTmKPO4/J8Sb1cA==
X-CSE-MsgGUID: Rl8EfRDaQX+k+RHZyAci/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="166000615"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 08:51:00 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 13 Aug 2025 08:51:00 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 13 Aug 2025 08:51:00 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.68)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 13 Aug 2025 08:51:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WUIZsqmaJHngiVD92MgD0+heQBO+miXN4UuMMoYpvozbLmVR3V8e8UDH4OSZh8Xj8A2K1dEOiTJgWEb9PO4pQWlKZhqmEWBu0EkMea8R3q2H3TJob9inViInlVi8FfNNun9TUQzCwxI8HIYia1mIl6T+S7zOqpOMtGFHORfCPgyK+Mc4EGz8WPTQjN9N35lj2IzrVKTTeZoZ84G1lH0kIY1vmJ/s0c5IqoW456sgoqize6yHXqsG0dwjIXHEVRm0Q1F99KelgRz0MgLw72i9IRiihnw64f2F0VJ6DtxawcVPWLzHpvGOaRNtJvsCWDnf92y6k6qihkydYRYNC9E9sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6luOWg6fmBCmOeAdJ+ZPGEPTnPu9Wp4KX+ZUXUGLdPc=;
 b=G6prra4P4TKDfCDlmqZ6qz/IMBEuZpHBhvgeN2HPI1VFVSWY9tMS9Hw6xaai5SunbomrHPZlGLj1DGhDqr/dJfQNkuqFS6eOImgRHnsDSw4TYEBJn8wgHW95L4jRvUAo//wJBRmAMuJE4AlX4AKpBufnxzQxFOBkF/HkGqXHWaWkOeJtxtADBLPNVidxBCSBKSHwhaGQbUbLx7JErEbxEC4aWjUi9RQJm0cH+MVP/pojLvSxokM1Nc19L+rvJdGKLSGb3WLvfLVwjddW5HC619q8E7W8isclPiqTwmKQ53+JvqGBxUdlplHbz+g15zokcxdYLPBEWYCW2VeCwrtvQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CYYPR11MB8330.namprd11.prod.outlook.com (2603:10b6:930:b8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.22; Wed, 13 Aug
 2025 15:50:58 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9031.014; Wed, 13 Aug 2025
 15:50:57 +0000
Date: Wed, 13 Aug 2025 08:50:54 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Christoph Manszewski <christoph.manszewski@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Francois Dugast
 <francois.dugast@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe: Fix vm_bind_ioctl double free bug
Message-ID: <aJy0XtJk5OgglU6Q@lstrano-desk.jf.intel.com>
References: <20250813101231.196632-1-christoph.manszewski@intel.com>
 <20250813101231.196632-2-christoph.manszewski@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250813101231.196632-2-christoph.manszewski@intel.com>
X-ClientProxiedBy: SJ0PR03CA0339.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CYYPR11MB8330:EE_
X-MS-Office365-Filtering-Correlation-Id: 73482204-392a-4405-ea32-08ddda8131ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?QVz0Jjyp6rWQijJDBuRrtYAn2v5rsuHliu4L7DeAifamhaZ7sSWS5pMJA2?=
 =?iso-8859-1?Q?RQijUY6tseqz9RDIDegYBG5SbgISBgPs9dkOV98U0DN2LRAikPQQdrUNZ3?=
 =?iso-8859-1?Q?3zKJPqsnIwDT9942QsQ+pRXjOqPPBbn1+YUSmCMw2RQpJpM9IFKcPtmD2E?=
 =?iso-8859-1?Q?iXspW8a4+Tf6/mjiSkLkmVDN7A8nNrogsF6rlvsMZQXaYOgOfhMB92TsLG?=
 =?iso-8859-1?Q?wfdSboblNv+r0xCXpgWEKHp4C2LRPRxnJUwUbUuewEbQa/veYb6im6vsjp?=
 =?iso-8859-1?Q?ydXMuEqQi4CTPTpYZijEPi/eCPcMwgdZbKPHIYnnA0mCMcjeGpR7lfsLmI?=
 =?iso-8859-1?Q?ahR/BQGVgMm4jdJ9T57PuJu3CRLYVEn2SSIsMpdbBpLfkPopx7KAX4+zAH?=
 =?iso-8859-1?Q?XQw/JS2iAv8Ei5JL1ey0gNQCjwTmSRenvUx9Uri2ky1LCKhfVjB7HYR/cy?=
 =?iso-8859-1?Q?9f2PJDwVNUVC4hzvvMvA0e7W61grwODVs/E1A3Uh8z9EUrbijYIbObzK/L?=
 =?iso-8859-1?Q?/UZbRDlD/vGVlXbnQj4u5xJ3BNxqdda8p3cqio5dJdO3gWnja3DuyB4sgS?=
 =?iso-8859-1?Q?n8U/SYP7vFFs8QAUZNopY2jVcMZPnodZSi7BJS8IcXNabdW+3UTsdBRvqs?=
 =?iso-8859-1?Q?os6Wg3mj4kljoDNYhs1VsxoS1PWkD6N2604LkTRKHNff85STc8nDfWxAHp?=
 =?iso-8859-1?Q?rZwZZjw4B8lMyVhonBzkE2DWrQ3wS/I0e8uju5N799ofMPCRcJLpVhFbjY?=
 =?iso-8859-1?Q?BGembRmiHABuNHlTOiM9pftWS98/zMWG5fhUe6XCTaR0Bj0+g5BS+QIBhz?=
 =?iso-8859-1?Q?GIc2a6SFLah0jknyhwjw7TrnUXcrtjwSb5kyjtDwdWHlCqvfGNQNX7a/TY?=
 =?iso-8859-1?Q?H0wVltZEB1gX0U3kMcQYvQJFkoNyoib+B7oRprmn7XSvYz0bFXoeBlWZa3?=
 =?iso-8859-1?Q?QfKWbetnunqhcFZWtlB0QVVwKTDc+gbfn8mS4fsG0r9rfd1WdjDrOJ8sWu?=
 =?iso-8859-1?Q?sIoR1QiJn0m2p5LP9135TlGAvdesvryB/1HTfc9eNpiAkRs5B/lS6mOhY8?=
 =?iso-8859-1?Q?Zr8B2OSVE7TaCs2rLRAeWVFu93hHmalDbqbsmnLtkB9jvV74TTcI/z0szw?=
 =?iso-8859-1?Q?DmIUNXAXXeRwdZYqwTAcgMJQ1X97buFOHSDZatZ4HdrNQJKkBgm/9O34vv?=
 =?iso-8859-1?Q?M6fAxAcMeTSQcMfwGxXAWqmLxeIlYcy4rgfP4S7lLM0A1ixNDTU1mGVDQk?=
 =?iso-8859-1?Q?1lF5S6ErhIML16mfu6IX81NGyHXDzNUJBIZqPPBO6rGi4/9WMXqC+//NYQ?=
 =?iso-8859-1?Q?XLRzH8PIz5AfbWHeQbupgs1Jn3wMBT36ZF5+U0ZRWPoCiq1J9R1UgM69Z2?=
 =?iso-8859-1?Q?VpMbOr+k0wCO7j4VO8j0XKMhUQtLKkHjqQATjgbAg6fYMrK1ygjJk5f1TN?=
 =?iso-8859-1?Q?CEqxHCbhnMR2k9H3AjEZXyXtVEKoHMDlcWErKLA1kNfgA38CqZJM45nxDs?=
 =?iso-8859-1?Q?o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?S7RasYsfg7RzF+3Arlyz+S0z5Vy0/pUxmEWxXBxEvM7RkXK4GLBnO+ywfZ?=
 =?iso-8859-1?Q?fnR9P6+cdnJScb2nxstdQbTXm4654s9GihHStAeUy+SYyv/YyqRqvhplXh?=
 =?iso-8859-1?Q?153lumqtMlMk5vPFPfeZUOuCZWLrYC4AwaaxilGKkIdrprdGM4GdECOK7a?=
 =?iso-8859-1?Q?/ZHi3tWfYCfE7uDH1awVwy/tm/46Cv8i+9TJvAa8CnUjuiBnbojkvrlLdp?=
 =?iso-8859-1?Q?Vsh1jLzxwqENqlvGZ8a+OMMTtEu9hhh/86V9HVZX1+i0cEcMqfKJFIbVu/?=
 =?iso-8859-1?Q?7TKzvCpV3gmrGomz2lQowdYU2+3DMog6aZModygIvf0RM7CL7Sx1zSEYnb?=
 =?iso-8859-1?Q?hR1nFIWB991FC5uNb8XaUMkVaVl7ksVHrVP93V3unUnEh/WQeoPJzhD/sF?=
 =?iso-8859-1?Q?sqHzxgSoMmNWdhhcXoxXybOylXbCjlIGTwpC8blsb9LKpVHwaWSoTj8/nv?=
 =?iso-8859-1?Q?9pFWPcwJXPWA3W3YVCySsuBfbwVJ/tKyPEyFIPaBizUHW4+yqfUQp/j99Y?=
 =?iso-8859-1?Q?eMQiXzUApltRD0qqOHriox5qMdddWt/9VDoMXSe5gkdrbq3Lz1jMft7YCy?=
 =?iso-8859-1?Q?hGtCeagQpwLS/0EE0ONqHXBMjzNOMWNT4rZbQonDWrD/6+QA44PhjuK2cW?=
 =?iso-8859-1?Q?49wS1LyXC2/+xiaXsqni6VDuscDZKz7bfsg1wlFKDzVQvHNhlZFekuIIhD?=
 =?iso-8859-1?Q?st2k8TtAqvbxODIoi8Dlf76U+Z4JyC9utqEoGCdtuJqbRrLP51Zw4iW9YY?=
 =?iso-8859-1?Q?ZQiu13KRb2wnrVFRIJCEOdUc5VIpWeCtB9Yxqib2+aVD/ahFEhXQGJqoFV?=
 =?iso-8859-1?Q?8UQ8hIHSiUj73W89ds+2coSYIJbh//cIyEN+z/3+jdt7Pb5zB93jszsIvX?=
 =?iso-8859-1?Q?W9w6a4FVNdM6d906gmRQiu5j8PT/NPMkLbtZKxLgBEIx33YBFb1KdpwO/j?=
 =?iso-8859-1?Q?WpcwOPTTAu5mjDaPBMaUDBRQii98zo8SW39mYJPRYSKzC8EqweS9b08qCE?=
 =?iso-8859-1?Q?G/8kw4ePmn/4gXfpnt95UGLCnr1ZxFycrKydFSKicxRgIQYQxkW5rcvqWo?=
 =?iso-8859-1?Q?jpqATEM5fORkS1W5kxGCvKLQEhnqw3BK6xSSCVBtpLM8E+YRKma/Ao1i17?=
 =?iso-8859-1?Q?MXw9J+y1nTN1sRj/Qb1gXioc845p6vVRXyLq1jUknKoeijL5FxiHPUTtRQ?=
 =?iso-8859-1?Q?RZZmOTK07t2U2Uz3czBVIlZcUJ8E0aCvDutoli6sqCOPzCV/ckIx/OSewF?=
 =?iso-8859-1?Q?NnB+O4QRtmzl8dFrAM+E2tYQ06k7rqGgpFnw8MsT09HwXT1Ar5HH+opZOn?=
 =?iso-8859-1?Q?EzcImRmetmrYqkXr7iA/UYzpKkUVbCvBlcU15HqXVHEvTMVNy4KKxOLVyd?=
 =?iso-8859-1?Q?BWWUWLfiM2mL7WqFTNw2tj1pR+nMIJe/ZQwMEyvKu3ytrprD8ksIajCfFD?=
 =?iso-8859-1?Q?+vyA0DOLW36EPsHEfzljCn82mljIykn3f4s8W5IX75IKOpveHldZcGR1tr?=
 =?iso-8859-1?Q?unnOQhSPp1jAhXh2weACPrhCtYXI1jBr0DA8xce6fpHuPpJL3liEH38BJk?=
 =?iso-8859-1?Q?q6OINUIl+drlsrgI3+dGBjV3AKlNwdZujnr0RCkC4/OACoR5llhsPaB6E9?=
 =?iso-8859-1?Q?7mOfbb3O9yNEVjU3jOqrnDz0vLBvm67vDT/X57Ns13H+8M1nWR35CRbA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 73482204-392a-4405-ea32-08ddda8131ad
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 15:50:57.8573 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +YSPd1QfuNOFubpuRvXKSOn3c9tlCHuNv/U9y1kCleCDpHPUyM3h5HGjxfejUnhjCApnwGtBsOGvvlVSq9Gs3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8330
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

On Wed, Aug 13, 2025 at 12:12:30PM +0200, Christoph Manszewski wrote:
> If the argument check during an array bind fails, the bind_ops are freed
> twice as seen in [1]. Fix this by setting bind_ops to NULL after freeing.
> 
> [1]:
> ==================================================================
> BUG: KASAN: double-free in xe_vm_bind_ioctl+0x1b2/0x21f0 [xe]
> Free of addr ffff88813bb9b800 by task xe_vm/14198
> 
> CPU: 5 UID: 0 PID: 14198 Comm: xe_vm Not tainted 6.16.0-xe-eudebug-cmanszew+ #520 PREEMPT(full)
> Hardware name: Intel Corporation Alder Lake Client Platform/AlderLake-P DDR5 RVP, BIOS ADLPFWI1.R00.2411.A02.2110081023 10/08/2021
> Call Trace:
>  <TASK>
>  dump_stack_lvl+0x82/0xd0
>  print_report+0xcb/0x610
>  ? __virt_addr_valid+0x19a/0x300
>  ? xe_vm_bind_ioctl+0x1b2/0x21f0 [xe]
>  kasan_report_invalid_free+0xc8/0xf0
>  ? xe_vm_bind_ioctl+0x1b2/0x21f0 [xe]
>  ? xe_vm_bind_ioctl+0x1b2/0x21f0 [xe]
>  check_slab_allocation+0x102/0x130
>  kfree+0x10d/0x440
>  ? should_fail_ex+0x57/0x2f0
>  ? xe_vm_bind_ioctl+0x1b2/0x21f0 [xe]
>  xe_vm_bind_ioctl+0x1b2/0x21f0 [xe]
>  ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
>  ? __lock_acquire+0xab9/0x27f0
>  ? lock_acquire+0x165/0x300
>  ? drm_dev_enter+0x53/0xe0 [drm]
>  ? find_held_lock+0x2b/0x80
>  ? drm_dev_exit+0x30/0x50 [drm]
>  ? drm_ioctl_kernel+0x128/0x1c0 [drm]
>  drm_ioctl_kernel+0x128/0x1c0 [drm]
>  ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
>  ? find_held_lock+0x2b/0x80
>  ? __pfx_drm_ioctl_kernel+0x10/0x10 [drm]
>  ? should_fail_ex+0x57/0x2f0
>  ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
>  drm_ioctl+0x352/0x620 [drm]
>  ? __pfx_drm_ioctl+0x10/0x10 [drm]
>  ? __pfx_rpm_resume+0x10/0x10
>  ? do_raw_spin_lock+0x11a/0x1b0
>  ? find_held_lock+0x2b/0x80
>  ? __pm_runtime_resume+0x61/0xc0
>  ? rcu_is_watching+0x20/0x50
>  ? trace_irq_enable.constprop.0+0xac/0xe0
>  xe_drm_ioctl+0x91/0xc0 [xe]
>  __x64_sys_ioctl+0xb2/0x100
>  ? rcu_is_watching+0x20/0x50
>  do_syscall_64+0x68/0x2e0
>  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> RIP: 0033:0x7fa9acb24ded
> Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d 45 10 c7 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25 28 00 00 00
> RSP: 002b:00007fff189e1370 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: ffffffffffffff68 RCX: 00007fa9acb24ded
> RDX: 00007fff189e19f0 RSI: 0000000040886445 RDI: 0000000000000003
> RBP: 00007fff189e13c0 R08: 0000000000000000 R09: 00005561d3fb47d0
> R10: 00007fa9ace29be0 R11: 0000000000000246 R12: 00007fff189e19f0
> R13: 0000000040886445 R14: 0000000000000003 R15: 0000000000000003
>  </TASK>
> 
> Fixes: b43e864af0d4 ("drm/xe/uapi: Add DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR")
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index d40d2d43c041..6fd28b205453 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3442,6 +3442,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
>  free_bind_ops:
>  	if (args->num_binds > 1)
>  		kvfree(*bind_ops);
> +	*bind_ops = NULL;
>  	return err;
>  }
>  
> @@ -3548,7 +3549,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	struct xe_exec_queue *q = NULL;
>  	u32 num_syncs, num_ufence = 0;
>  	struct xe_sync_entry *syncs = NULL;
> -	struct drm_xe_vm_bind_op *bind_ops;
> +	struct drm_xe_vm_bind_op *bind_ops = NULL;
>  	struct xe_vma_ops vops;
>  	struct dma_fence *fence;
>  	int err;
> -- 
> 2.47.1
> 

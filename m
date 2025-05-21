Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E70C54E90
	for <intel-xe@archiver.kernel.org>; Wed, 21 May 2025 20:41:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3300810E038;
	Wed, 21 May 2025 20:41:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AswBVgVf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2840010E038
 for <intel-xe@lists.freedesktop.org>; Wed, 21 May 2025 20:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747860100; x=1779396100;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=xeMjy2ObTV5E7DOtSXDeERyPdgkGt/G/+Jk5bZ8vKwI=;
 b=AswBVgVf0CZK1YdfO5LWwwZ8jtEz5DeJQH9FtXhQkBG5afxrGS2Zo6dy
 5V9o2TlVhS4qvkB0yxrB1WraFb+5N/eOuFD0XSRF8odrlOAk5qZy/nA/W
 N7i4BMAYHbEMJyZbimrtq37kabGmFV9mJDUyKwIjOHJWEXIm+7dEJ6kXo
 J4XvLCnHQULNcRGrWRDDnkX9UFI9KxbhqdTCDiXM13IsQZninN8uED2kt
 zZl3LqdjbBWALNx08t0MuzHtCYlrSGDh1OkM2De5tt16DqCbru/FppDDv
 1+YhifYO4jh8Qh/YH3ThRjGw9+aWrByC6/6HCzO609OIsHtnT+jjlloDk A==;
X-CSE-ConnectionGUID: bceO7kccQXW2NOA2UNi16A==
X-CSE-MsgGUID: osat+JwSSKalXaiXgofA5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="67415685"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; d="scan'208";a="67415685"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 13:41:40 -0700
X-CSE-ConnectionGUID: 6BXL4rDST0+Mg0Pr45gF8Q==
X-CSE-MsgGUID: pkwMc90XRCuMnzqtFCLLkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; d="scan'208";a="140089019"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 13:41:40 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 21 May 2025 13:41:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 21 May 2025 13:41:39 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 21 May 2025 13:41:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qevwVLBcOcHCKEEuWSMSE3xACbRJ9iYrGUqr/Zc55+O7lkkbVMJkfJbe5NHAE6uT8hmePD5zyBwWEcRRQcPgt9ozJvMZMXDx+Bm/APdGVB4+Oq2qt+b0VB9VbO0ozGe8DaoK7n07BuQCPzNF97dwfv6oOwWVVaHxwQJa+BZpuPh/gjf+nnbsA1FLc3UJq4pJkPatgm44JdNVyW/S2kHWpJ7L2CcN3TV5JEaviVqBrpgbhwLZ8F/MX4E2qisvmVcKt4HERgtkNDbrMq8Q5l7ljoazjn97Hsm703LvGoI4NS6ITQpnyO78+mSWLRT72Vdhes+QFeStGZ6wxBXtklOt3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XF8bYlGMQlQw9dzbCWj5Ca6iZj18B7vgqFtC+ywlI3A=;
 b=rYjFRgPPpyxQi8p5EF5gf5jbSvfuUlgwJBL8lPb3EWLb0/rwEzKhhKwVOMusPHCgqmbAA0h5cgxXbPtaLIVGvJMbjcHFknLyrr0ryQxIOZpS/TeOq5tAjwhtYrgbMprJ4jmzaPvjwsST6eBbeGen0NZFcVMcNNZ1VHs+oK1m7H2clAFpB0EUksQqgIfXsmtpm8UQxNxYFn47C30aNHBdlmnF4+Pbj+YAv+64cAta2dWKPEsk94G5lKMkk/egINMu6W5NZloN8ModF1NsDaQd0nexv8NurbRpYnIe+a6zsjBZQfdIn+J5IQPTrqYfHxJPXlIv73XUeUqkhOLMWVR8kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by DM4PR11MB6067.namprd11.prod.outlook.com (2603:10b6:8:63::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 20:41:09 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%7]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 20:41:09 +0000
Message-ID: <7d61fdb5-c061-43f3-ace8-d35619761d8c@intel.com>
Date: Wed, 21 May 2025 13:41:07 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe/pxp: Decouple queue addition from PXP start
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20250519233228.3754667-5-daniele.ceraolospurio@intel.com>
 <20250519233228.3754667-8-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250519233228.3754667-8-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0087.namprd03.prod.outlook.com
 (2603:10b6:303:b6::32) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|DM4PR11MB6067:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d5578e7-6f8e-45e8-2251-08dd98a7d147
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QTBxSDNJK2VISHBmSC9VclE0ZWJ6U1NEYnBiaWpFMWcvRG1IK25DZUZWMjlq?=
 =?utf-8?B?Y0lEV0t2WXNIeEVCUGNsalR2NGZZa1MraGlTenRoakZ3WlNodHRwR2NLNWIz?=
 =?utf-8?B?YjkxNDJTZUIyU281UXdJV09xcXRIWEVFOHVkM1Y5NlBBamVEZ0o1Z3FRVEpt?=
 =?utf-8?B?N2dCc1N4TnlubkVENFZreTNOV1Q1YWhJUlZ4ZGhFNEhBWUNiTzFiQWpPenR2?=
 =?utf-8?B?RmNRUklFV1lIaDdoT3N2YTFKTmVrVE9aQWczSUUyMHpkVS9jN05JODBYOHE1?=
 =?utf-8?B?VGJEajdNV2dKejhEUEg5ZTlHQzhOUmdnYVlNN1pIYkcvRUQwbnVsdGF1K3hm?=
 =?utf-8?B?ZmFFOCtQU0RwTncrdEk5KzFpVTM2bnRrNjlKbjREb0t5U1lpVHBnSXBNMlQ3?=
 =?utf-8?B?dlp4UmRXMVBCWHcwMXc4N1hIbkYwKyt3d1JKclFvajdHbHdBV0tPVk1hUHBE?=
 =?utf-8?B?UUQrRC9YS1NMUHZNK1BOWkJuZGdOc1k3c3Zpa1I5TUJoRUV0dXcyTWFVWjVh?=
 =?utf-8?B?OFhDcSs5ci90VnpKc1AyczJsMTVKTDRqZno1VXJBZHh6MnBLOVMwKzAycEF5?=
 =?utf-8?B?L2QyNVp3N0NoSTRaMU9Ud0lwVXBjRzgxR2pOTUFJeTJlNTFiNU9zdHdFbi80?=
 =?utf-8?B?L3BYclpxSWYwRk15K1h6cURNeVlLL2VWZXdqT3YxVWMvVlhSN2thSVdXZ2NN?=
 =?utf-8?B?WG00MU5MdUNFeU1iSHVRYVpwR0o2VmtwSTZEV0tuanMwdnd1bHNvWHc3NjF4?=
 =?utf-8?B?MUpvQUU4cVQ5QlpmdTVWRmIraUpCUGNyam84TmorRlZHWmI0bThVeDNpTGpj?=
 =?utf-8?B?MmdTTjFZNmhPYWI3NG1kMC9GYWlDZUt5Q0w2UUMrVHRyc3ErTVJZTTdOR3E0?=
 =?utf-8?B?UmVieWJ2Z2srMFBnQ3c2SzRxN1ZTRllQOUkwK1dxbXhJRjhOcXk0SU44SGla?=
 =?utf-8?B?ejFPa2tlaVJwQkpzWE0weXhRTDFPeWlORzZyYU14TjRCbm9hQXNSTThIOFY1?=
 =?utf-8?B?eFZudVNhS2lJSWRrdkREYklnS3NVRHk0QXJ6YXNhRkN4UnJPQnYyeFlSRkt6?=
 =?utf-8?B?OUJDS1NRWi9CellFS1g1cTlxbVg0VzhyVTZ6SVhFL05lcW5lS2U4N1ZmVDVJ?=
 =?utf-8?B?YXJQR0w0aTFEWnR3N0tXaTJwblAyTXZtMjdGMUkvK0M2TExJOE5abTU0Nzh2?=
 =?utf-8?B?endLbnNiMUFORnBEdEJFbUY5SjZyUDhOL0JWaVZzKy96U3pTTTVyRk9PTGpK?=
 =?utf-8?B?YXRkd2tIbi9hbldJNUs1K0w5SkRKRTFFMUVyQ203T1c2dDlVb085RTZIZzFt?=
 =?utf-8?B?ZVcxa01yV2R0YWozZzdFZWZIWEdnckZ4dXRvZWgwTVF4bEJ5emwzWEZXOEI1?=
 =?utf-8?B?OUxqQWFyK21GdGU1TGNFdkVsOTBVVGpoM1JkVm5CUk9hNStkM1VLa1hSVWxQ?=
 =?utf-8?B?Z3F4cU5CSmh3UnpkYjE3d0cxNnNpOFpHeEk2dnA2Z3RkUjlyNjhIekRweUhj?=
 =?utf-8?B?SUFqSzk3eklHTzF2YzVwdXIycnBnNVBjUkF3cDZ4SzhHa2xnaXh2OGk0WTZF?=
 =?utf-8?B?UnFPUENDTnBrZHVmZCsrRGRLRkl1V2NxWkpyZzNEaTNZMU5LVHA3d0IvaE1H?=
 =?utf-8?B?TDZnNWlUWVUyOS93d1E2Z09uV2pIaHVYVnhxcnBaZG9ib2lzU3hZemJLY1hL?=
 =?utf-8?B?SFBQL2NKY2l5Y1hHZHVrY280U1JFOEtqQ3ZxR2MwSTB4b3RsNkQvMzJjSWJX?=
 =?utf-8?B?SnViRzNXcXZONllSV01Qb2pEaGlJa1RMSU1MWFkvQXhYOXNaNkVoeXdFVGZQ?=
 =?utf-8?B?RmwycjFRQTVNT0JINi9VMFdsQmFsYW9mc1hUOVp3VHVlVmp0cWtWOUN6M21m?=
 =?utf-8?B?L2gwaFdQa3NxYlhOalZQN0ZDSVJ6cFFWY0hBbm9hOExxdkZFR2NycnB4L3Uw?=
 =?utf-8?Q?wRt+fXJuXJM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nit0MEJxRTd6ZzJFUlJaaXlTOWcrYU4zS3NLdFQ2RC9HanVWb3laTjJnVUpH?=
 =?utf-8?B?R0NBcTkzRjdUOTZtdlUvQ0ZJSlpsc2JQeldhYS95RmNYTVhmRHkxcXZaOUY4?=
 =?utf-8?B?RWpwSmxINzM0UEhUSXhkOWNBeWYvM3l3ZVpaVTc3aXlMR3hMUlRSWmRQS3oy?=
 =?utf-8?B?TmtNY0FoWXQ1ODVLRzN0alp6VWxXVlZwSzJ3VjZnck45VHlHQ05ocWYrVnJR?=
 =?utf-8?B?WkxVakR2cTVCMHFMUTRZcHpROHRWTitKeDc1akJkSzgyaWtpbU1sZlhURU1U?=
 =?utf-8?B?VXMvNll0UnVwbXBRajFpZmdnMkdmczF2bFU5cysySWRsRG5venZ5dDJXU1VH?=
 =?utf-8?B?WWZvdFRsblFaLzFoak5NT3pWN3VxVTB4N2IwaXdBa3Boa3VDUkpZMVB4THpC?=
 =?utf-8?B?YUVtUWFZTjkzeXV2VFEyOXpBS0lUU2lBYi9OV1RwdHNpalZEb2xWSVJjdktn?=
 =?utf-8?B?ZHpXdzFlakFlLzZrbWRuRW1xK1VKYS8yT015U0xMZU9LVnBDeFVsMXQ5UmRV?=
 =?utf-8?B?QkpwYm5NeC9sNHB3TGtBeHlJN0FDd3RuVTBPaVgyMjA2T05DVmpRbkhqNmpw?=
 =?utf-8?B?WEp0cytsaDl2MVFPT0EwajdDaTBPOXFrZkhwb1FXY0xVZFUyL2EvVG5Xajcy?=
 =?utf-8?B?QzJkL0NkSitsYTlZWjcwL0MrMG1mS012KzhGdURZTk5CQWQ0K1FXN0kwd2Mr?=
 =?utf-8?B?aWZaVEl2TkxiMHZPMFVDMGxRSy9lYW5LaHdHODV0LzhlZXc1Z2hRamplTitI?=
 =?utf-8?B?WDlLb3FNWXExV20xa0paSlkxQU9jcHNUL3lIWnRDbEhEU1ZEZTFOZTJyd0Ji?=
 =?utf-8?B?R25nU0VKUCs5dXFiRmNiRFAvcEdweE5vNXFwdzJKNDNWNHJKbG4vaEwxc1Vj?=
 =?utf-8?B?dUx2MTN2Ykk0QWhmSXJNSTRMeGFjclRvQWxZWWpuUmRrRXpCSk42WWVIcDRj?=
 =?utf-8?B?eGJGMTBOMktPWk5QK09KVmQzZi9IODB0ZFJxcVZ3VDVMRXFIc1V0aTV1VEla?=
 =?utf-8?B?dFk1V3FEM1BXdmFpMGg5SVRseWs1eldYWEJlTFNIUktURFpzUzVlOHN1enNw?=
 =?utf-8?B?M1J3QktIazhZR0gwMFY3SCt3R3c2NWJhaEtFUWlNdTVMd0R3b2loWjNvTDZv?=
 =?utf-8?B?dGg1R2xlZVMyWE5mZERpZlNLTVFCMnlScnZWWnl2SWhkM3E4QjQ5N2xGRnpl?=
 =?utf-8?B?bzhkM2VaL0ZhTmZUVFNTOE52TzJvYkNFa1oya3luT1JlN2k1WVFnSzg3a1Qr?=
 =?utf-8?B?N3BId2M1bUM0ekNGOGVkejdSbWNjYVg3WUxGZnRtRjBCcDFockhvMEZEZ05Z?=
 =?utf-8?B?R0pRbjZmMnM1b1VPMVBxMndrVGl0bGkzRFAydzhoQ2ZoQjFkUnBPb2xPdzFB?=
 =?utf-8?B?K1kzZng0YmdReGJ1b1l3dGpoWkozUVIwSno4TkxwWWZlNS9nLzNFcWlsVzhh?=
 =?utf-8?B?L2l4U05kQVZMTXlZSzVlbTRMR0xaVFZxK0ttOFBWcTBSMzVSSWxJek5VeW81?=
 =?utf-8?B?djN0a093NG5SNGpBYWIwNW8wbDFqc0xIZ0haR3VKMWVnS3Q4Mk00citWVUhV?=
 =?utf-8?B?bEg2eTFtKzJVQjB3RXh3ckRMVlpQay9pTEhIQWZac2hiTEgyRkZXWEJ6WWl1?=
 =?utf-8?B?ZTlyMXlMR1EwTE9hZm9wMXR2cUFER09VRFYzNjNNNjFRRm1ZaUFxbGJGZ2gz?=
 =?utf-8?B?Sk9PM21uQ2JyUlZ2MlFVUzYvVS8xb0RPRnk0QzdhRGJKMk40aFZ1MVlkTWps?=
 =?utf-8?B?cmZoaldCdm5DYVZjc3UvVXI5R01pL2ZyZVBJVU9GZFA2Mnp3aXVhQ0VPeU1N?=
 =?utf-8?B?K1lDK0lWS3ZtTTZxZjNCTk5qb3pQNmFvS2UyakJ5UnVHc0x3VHR0MGFyUlpD?=
 =?utf-8?B?a0IzTm1zaGl3dlpMamxzSkZmUUl6OVQ2cFJBUDUzQkhNQkU5NnNvM2pkWGtq?=
 =?utf-8?B?bmEvZGE2VDRqMERQQ29RRklEKzZFTDlOckVlbGRnckdRUE81MlVmQnpZYVNC?=
 =?utf-8?B?Y0kxSXQ5UFlZOW1DTHRkNll0Z282UVJwRHlyeEZQSldjNVFFcmc0ZHN2ZWpQ?=
 =?utf-8?B?M3BGVlU1cmRyc2gvbFpVTFdUS0tKOWZjRk80L09wdVlkd0UwMjNhaEYzaGJk?=
 =?utf-8?B?UTBzaHJhUk1iMEVBTFlkcWsweEdYNUlxQ2RtaGEvWEQ0cG9rY1BrblpzcXY4?=
 =?utf-8?B?ZEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d5578e7-6f8e-45e8-2251-08dd98a7d147
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 20:41:09.7924 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ypk0dgwYPtRdu5o4+lN4a5WZEu2zw2+3BpGp986B7oFbqwdvFDI0pk1aF+4AQlXist3ZuaNvqxkZZgHdhS3rMWgYmEnzvYBVCSfotBu9/xE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6067
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

On 5/19/2025 4:32 PM, Daniele Ceraolo Spurio wrote:
> Starting PXP and adding a queue to the PXP queue list are separate
> actions. Given that a queue can only be added to the list if PXP is
> active, the 2 actions were bundled together to avoid having to
> re-lock and re-check the status to perform the queue addition after
> having done so during the PXP start. However, we don't save a lot of
> complexity by doing so and we lose in clarity of code, so overall it's
> cleaner to just keep the 2 actions separate.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/xe/xe_pxp.c | 143 ++++++++++++++++++++++--------------
>   1 file changed, 87 insertions(+), 56 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
> index b5bc15f436fa..32ee38e11811 100644
> --- a/drivers/gpu/drm/xe/xe_pxp.c
> +++ b/drivers/gpu/drm/xe/xe_pxp.c
> @@ -504,36 +504,41 @@ int xe_pxp_exec_queue_set_type(struct xe_pxp *pxp, struct xe_exec_queue *q, u8 t
>   	return 0;
>   }
>   
> -static void __exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
> +static int __exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
>   {
> -	spin_lock_irq(&pxp->queues.lock);
> -	list_add_tail(&q->pxp.link, &pxp->queues.list);
> -	spin_unlock_irq(&pxp->queues.lock);
> +	int ret = 0;
> +
> +	/*
> +	 * A queue can be added to the list only if the PXP is in active status,
> +	 * otherwise the termination might not handle it correctly.
> +	 */
> +	mutex_lock(&pxp->mutex);
> +
> +	if (pxp->status == XE_PXP_ACTIVE) {
> +		spin_lock_irq(&pxp->queues.lock);
> +		list_add_tail(&q->pxp.link, &pxp->queues.list);
> +		spin_unlock_irq(&pxp->queues.lock);
> +	} else if (pxp->status == XE_PXP_ERROR || pxp->status == XE_PXP_SUSPENDED) {
> +		ret = -EIO;
> +	} else {
> +		ret = -EBUSY; /* try again later */
> +	}
> +
> +	mutex_unlock(&pxp->mutex);
> +
> +	return ret;
>   }
>   
> -/**
> - * xe_pxp_exec_queue_add - add a queue to the PXP list
> - * @pxp: the xe->pxp pointer (it will be NULL if PXP is disabled)
> - * @q: the queue to add to the list
> - *
> - * If PXP is enabled and the prerequisites are done, start the PXP ARB
> - * session (if not already running) and add the queue to the PXP list. Note
> - * that the queue must have previously been marked as using PXP with
> - * xe_pxp_exec_queue_set_type.
> - *
> - * Returns 0 if the PXP ARB session is running and the queue is in the list,
> - * -ENODEV if PXP is disabled, -EBUSY if the PXP prerequisites are not done,
> - * other errno value if something goes wrong during the session start.
> - */
> -int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
> +static int pxp_start(struct xe_pxp *pxp, u8 type)
>   {
>   	int ret = 0;
> +	bool restart = false;
>   
>   	if (!xe_pxp_is_enabled(pxp))
>   		return -ENODEV;
>   
>   	/* we only support HWDRM sessions right now */
> -	xe_assert(pxp->xe, q->pxp.type == DRM_XE_PXP_TYPE_HWDRM);
> +	xe_assert(pxp->xe, type == DRM_XE_PXP_TYPE_HWDRM);
>   
>   	/*
>   	 * Runtime suspend kills PXP, so we take a reference to prevent it from
> @@ -543,30 +548,24 @@ int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
>   
>   	/* get_readiness_status() returns 0 for in-progress and 1 for done */
>   	ret = xe_pxp_get_readiness_status(pxp);
> -	if (ret <= 0) {
> -		if (!ret)
> -			ret = -EBUSY;
> -		goto out;
> -	}
> +	if (ret <= 0)
> +		return ret ?: -EBUSY;
> +
>   	ret = 0;
>   
>   wait_for_idle:
>   	/*
>   	 * if there is an action in progress, wait for it. We need to wait
>   	 * outside the lock because the completion is done from within the lock.
> -	 * Note that the two action should never be pending at the same time.
> +	 * Note that the two actions should never be pending at the same time.
>   	 */
>   	if (!wait_for_completion_timeout(&pxp->termination,
> -					 msecs_to_jiffies(PXP_TERMINATION_TIMEOUT_MS))) {
> -		ret = -ETIMEDOUT;
> -		goto out;
> -	}
> +					 msecs_to_jiffies(PXP_TERMINATION_TIMEOUT_MS)))
> +		return -ETIMEDOUT;
>   
>   	if (!wait_for_completion_timeout(&pxp->activation,
> -					 msecs_to_jiffies(PXP_ACTIVATION_TIMEOUT_MS))) {
> -		ret = -ETIMEDOUT;
> -		goto out;
> -	}
> +					 msecs_to_jiffies(PXP_ACTIVATION_TIMEOUT_MS)))
> +		return -ETIMEDOUT;
>   
>   	mutex_lock(&pxp->mutex);
>   
> @@ -574,11 +573,9 @@ int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
>   	switch (pxp->status) {
>   	case XE_PXP_ERROR:
>   		ret = -EIO;
> -		break;
> +		goto out_unlock;
>   	case XE_PXP_ACTIVE:
> -		__exec_queue_add(pxp, q);
> -		mutex_unlock(&pxp->mutex);
> -		goto out;
> +		goto out_unlock;
>   	case XE_PXP_READY_TO_START:
>   		pxp->status = XE_PXP_START_IN_PROGRESS;
>   		reinit_completion(&pxp->activation);
> @@ -586,8 +583,8 @@ int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
>   	case XE_PXP_START_IN_PROGRESS:
>   		/* If a start is in progress then the completion must not be done */
>   		XE_WARN_ON(completion_done(&pxp->activation));
> -		mutex_unlock(&pxp->mutex);
> -		goto wait_for_idle;
> +		restart = true;
> +		goto out_unlock;
>   	case XE_PXP_NEEDS_TERMINATION:
>   		mark_termination_in_progress(pxp);
>   		break;
> @@ -595,29 +592,25 @@ int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
>   	case XE_PXP_NEEDS_ADDITIONAL_TERMINATION:
>   		/* If a termination is in progress then the completion must not be done */
>   		XE_WARN_ON(completion_done(&pxp->termination));
> -		mutex_unlock(&pxp->mutex);
> -		goto wait_for_idle;
> +		restart = true;
> +		goto out_unlock;
>   	case XE_PXP_SUSPENDED:
>   	default:
>   		drm_err(&pxp->xe->drm, "unexpected state during PXP start: %u\n", pxp->status);
>   		ret = -EIO;
> -		break;
> +		goto out_unlock;
>   	}
>   
>   	mutex_unlock(&pxp->mutex);
>   
> -	if (ret)
> -		goto out;
> -
>   	if (!completion_done(&pxp->termination)) {
>   		ret = pxp_terminate_hw(pxp);
>   		if (ret) {
>   			drm_err(&pxp->xe->drm, "PXP termination failed before start\n");
>   			mutex_lock(&pxp->mutex);
>   			pxp->status = XE_PXP_ERROR;
> -			mutex_unlock(&pxp->mutex);
>   
> -			goto out;
> +			goto out_unlock;
>   		}
>   
>   		goto wait_for_idle;
> @@ -639,27 +632,65 @@ int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
>   	if (pxp->status != XE_PXP_START_IN_PROGRESS) {
>   		drm_err(&pxp->xe->drm, "unexpected state after PXP start: %u\n", pxp->status);
>   		pxp->status = XE_PXP_NEEDS_TERMINATION;
> -		mutex_unlock(&pxp->mutex);
> -		goto wait_for_idle;
> +		restart = true;
> +		goto out_unlock;
>   	}
>   
>   	/* If everything went ok, update the status and add the queue to the list */
> -	if (!ret) {
> +	if (!ret)
>   		pxp->status = XE_PXP_ACTIVE;
> -		__exec_queue_add(pxp, q);
> -	} else {
> +	else
>   		pxp->status = XE_PXP_ERROR;
> -	}
>   
> +out_unlock:
>   	mutex_unlock(&pxp->mutex);
>   
> -out:
> +	if (restart)
> +		goto wait_for_idle;
> +
> +	return ret;
> +}
> +
> +/**
> + * xe_pxp_exec_queue_add - add a queue to the PXP list
> + * @pxp: the xe->pxp pointer (it will be NULL if PXP is disabled)
> + * @q: the queue to add to the list
> + *
> + * If PXP is enabled and the prerequisites are done, start the PXP default
> + * session (if not already running) and add the queue to the PXP list.
> + *
> + * Returns 0 if the PXP session is running and the queue is in the list,
> + * -ENODEV if PXP is disabled, -EBUSY if the PXP prerequisites are not done,
> + * other errno value if something goes wrong during the session start.
> + */
> +int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
> +{
> +	int ret;
> +
> +	if (!xe_pxp_is_enabled(pxp))
> +		return -ENODEV;
> +
> +	/*
> +	 * Runtime suspend kills PXP, so we take a reference to prevent it from
> +	 * happening while we have active queues that use PXP
> +	 */
> +	xe_pm_runtime_get(pxp->xe);
> +
> +start:
> +	ret = pxp_start(pxp, q->pxp.type);
> +
>   	/*
>   	 * in the successful case the PM ref is released from
>   	 * xe_pxp_exec_queue_remove
>   	 */
> -	if (ret)
> +	if (ret) {
>   		xe_pm_runtime_put(pxp->xe);
> +		return ret;
> +	}
> +
> +	ret = __exec_queue_add(pxp, q);
> +	if (ret == -EBUSY)
> +		goto start;
>   
>   	return ret;
>   }


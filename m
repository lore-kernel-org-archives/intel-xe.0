Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C30C369DC
	for <intel-xe@archiver.kernel.org>; Thu,  1 May 2025 15:32:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F83D10E871;
	Thu,  1 May 2025 15:32:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b1+iD2tE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C779310E870
 for <intel-xe@lists.freedesktop.org>; Thu,  1 May 2025 15:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746113563; x=1777649563;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nc0V+R0Bk2d3Lr2qrpylZpnxLkW5X9SUjeyZMo30FBg=;
 b=b1+iD2tEwbw3uJ+SYVXqu/qHksrg2UybiV+EqPWa6YJi1PeWU3u7FxfG
 NKf8WtUwTIxlfIogb+9KOtpZBHZ+xS1+RjESvP7+R0MfwBqQNVpOHMQep
 w63bvkxbYgEXXMQhVPEnpBgSDEIlP9Gx8OXG4AGb3zLnH+8kHvP4k4l3X
 hWOSW+3RU0ipXtkHylc3iaEFsFOCq7GaDSJw5IskM0hhKLQLxZE1YFawQ
 Ki3D4BxAfJDlkdAvthwP1NxylEv9uRsAscRi9trQkR/VS3ltrekYzeLmZ
 5RR0NQRFH0E5p7wsZehsnhPRCwEPLHNV3beqC/MeMu0jE1uOCFlR/Uw1G w==;
X-CSE-ConnectionGUID: rbOMVfCBSzWnie4EgqFcDw==
X-CSE-MsgGUID: qx2VKIl8SVuGWvfdtv1cmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="51611960"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; d="scan'208";a="51611960"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2025 08:32:40 -0700
X-CSE-ConnectionGUID: BkEo1b9DR6SoL+X/DE/SxA==
X-CSE-MsgGUID: xMRP1UNOSdmBDY5c8i7oNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; d="scan'208";a="139226284"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2025 08:32:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 1 May 2025 08:32:39 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 1 May 2025 08:32:39 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 1 May 2025 08:32:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yCu6Jtw7d3PrGHl0xzqOmom5IXribspwENHFp3Rndbp/MpUWUauoVYBD/FQ7rixH3fIkSePGameDiVNeon9FRNDn4Q2XNPgH36FUqUnxB9RDi5e80qMLEdOpw257QY7egw8J6tgrlQhGuREChknvvR0pTjfw/fHHuscJ7fa7TfCuQ32MFv2iQyFkzGZbXvqsGnsA9sJpFWHfxd/YIOLY7VKF6vm3kEVzjtUwl0XmxthNx0wqKdgeWDGlndmxRoAsKPa9AjyESy84vSS7+eE+7GzbJASsusnLB3rNaCnhIC5cABKlqc/5Dz8EIXwo+0lkttF6CPBNq8OlhgsVt8OlVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eO0kaeK0T+nUz4w1BJs5Qolwj6Jqyf0wEJHGBijkfJk=;
 b=Lhd3v85YMRRtyRKfRzQQ+ohvjbxN5VSJ8e5BYIWKurP29anbhOIP1azRBYezjd5Sje3HQ+BStRV8DEZmE2TZiv8OREW3vBiXHqTsqePKO07hSiewN/V4Yo0XMlgunXeUPDgS0N0P/6lADBAoUdWc2YavwAq0yzd1yNegtAx9OSTp66xHDySw97WxMbVZ8y+vgoQaqM4WVB1VDfV5dvMrbqiyPzS0vZLlUpF1vt75v6k+ZKmkkBAPnNr2Cx4Ver8pfK07XFS66ogapkPHK0BuiOXTr7c2wWNbINTYFZKndUkR/9sulNcvzo2Eu0yFkl+NX+zYAifwWyr2r0rYvUESqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH7PR11MB6836.namprd11.prod.outlook.com (2603:10b6:510:1ef::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Thu, 1 May
 2025 15:32:36 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8699.012; Thu, 1 May 2025
 15:32:36 +0000
Date: Thu, 1 May 2025 11:32:31 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <arnd@arndb.de>
Subject: Re: [PATCH v2] drm/xe: fix devcoredump chunk alignmnent calculation
Message-ID: <aBOUDxJBRGxGJZxX@intel.com>
References: <20250501012545.1045247-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250501012545.1045247-1-matthew.brost@intel.com>
X-ClientProxiedBy: MW4PR04CA0388.namprd04.prod.outlook.com
 (2603:10b6:303:81::33) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH7PR11MB6836:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b2b923f-843b-4081-a6bb-08dd88c56627
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yd0nU9Z3sPUQDImNi0WgH1HJ5+yJWFxk5YX3m4H+JyUsSQYkZKbls/Xci2vF?=
 =?us-ascii?Q?+1GrH/6XKeR4oWe9SwSkgihwAUs4BqhcaivmEnBwmti80+9TX6NTu+1X575e?=
 =?us-ascii?Q?J8eb9/S6hSDJJ13gf6p0t9Bb7wGSWcJWkQT/KxrxOCSOttSHlNyDz6mjJmja?=
 =?us-ascii?Q?+xhqtAWtutccn+KrQV5gZ8ct5QqUOYpq1mqYKoP0CGvHgA18OWHTdueZH1gG?=
 =?us-ascii?Q?gyV166+JXfkyVFBiNDfd+8M1CxpzaZxulPYWiA4/ELY5zIyTSpKgul11VQET?=
 =?us-ascii?Q?cmuceq5InBXU6CEqc851uolpSHzDJwB3ZYC1pnU0AcnLn+3YvA3+CbOyPAXu?=
 =?us-ascii?Q?t5VrRPwsdaCypX7lI5AWi6996RNCWlB6xBfeTTwvbICyGCb6ivcaGQLE6cnv?=
 =?us-ascii?Q?h1ZdOjW83KgK9cKjRkFo4JJuJ02OcikLMwErQxJT9c23K8cRPpulTcKdRVpo?=
 =?us-ascii?Q?exTSOLcu2hHaxTzc0j/WM4tVI7RZVGu29MkjdKrY24uKR69FwLI5OFeEGw2A?=
 =?us-ascii?Q?0FtEYSrAZ0Dv+fss7BPxD/6QRHn/D17rGjhcA6yhqxnH9mkcnXQloSZErqY5?=
 =?us-ascii?Q?p0jQ7med5jhqocYwaCfDse4cI2T2pZhPqPdrliq9ryWc7JKgv7Cz9O0gRmPv?=
 =?us-ascii?Q?B2zwp8tmvPjHhbLHgzZkYpuN8iQ2988eW1VobnNG1hP+0paIVWcejvrBIb6f?=
 =?us-ascii?Q?0vUhdbFhy6d0mVVaOiJogikvQw6yM7nScH+OUJ/0D6xUAueJhKUoHF+0SikC?=
 =?us-ascii?Q?QmvDDyIQcp1UqNxNc/Ly22tjDRTkxbGyX+mKPuS74HFvIF4qM9SHu46u00EQ?=
 =?us-ascii?Q?QLSCuZpD/UIP480xSnt3relDqQs7tsiBG12cUywkTuMIF8GD1Ckbo4B8v4Bx?=
 =?us-ascii?Q?/owfZmUsbr0LVz16JmZo4U6vZ3QVoL59aaNF0ZcW61FC3Xp4xBbxdd9G2RQS?=
 =?us-ascii?Q?0asJsHYjomxGFY12RYG5+tSrVYY/VMp+qfyk7tlw6fy8hTNMel/h3gQ1iqzF?=
 =?us-ascii?Q?4TTrMuyNv8N8blSrHV5hGz9XjCVktr0/vOPO3L13p3OYawEckzxGqUbrcTqS?=
 =?us-ascii?Q?os9js32CDTWm4FXRwk9gIcxZCniBZYCo4wWL0jM/6+K/4e+Wb7EJr3B3uMuM?=
 =?us-ascii?Q?hFbwbpk+ZyFTFj1B50KbNzoZxMHDXrfLyCtiNWDJIFLY8IAFpFX7l+NQSZr9?=
 =?us-ascii?Q?dzs4opTMeSdDVHm13hp1+Lw0CZrvDkjmh++Gwlx0P18Eq0g54NwMW5PBnEHr?=
 =?us-ascii?Q?XjNXlaYmfiQHEjtgYMDQ3Lh1StLQKy/wCj4WcSuaGSoFSgOxazlJfXDalLF4?=
 =?us-ascii?Q?K7va27FpH5bsi2pW6mq+7v0hEwrrtnFmqj2JfaoSvNXqcwQwCelgPjmekf3x?=
 =?us-ascii?Q?vX9Tl5T3jfcuqr+xZvVB17IoD01VoIFuRaBCON/MYa/opqNbvBMMAuOKuPtu?=
 =?us-ascii?Q?A8mqrEFL1hQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?t5FVsHAJxIhgIfg/6Y4UHv9etuF2fZhDjzEdQzSgsgtHKdIv1TDIwxeS2Phr?=
 =?us-ascii?Q?U561BGzXhRMxCksZ0KVeecK5SFl7SWAind94CdNXK9Vm5/+9LeHv3dAA9lHr?=
 =?us-ascii?Q?Kv+xEqMuTaFSBwj7O10t8AyQAgTxshY9ZYPYACj8i8VAin7n1CckEugQ+6O4?=
 =?us-ascii?Q?7w4d+MSQtsrpH19MlV+xghgf0hT3U31z+Dsyfpwz8AWEexJexl2kyHSHck2V?=
 =?us-ascii?Q?rvl2TlexznwbqxGD7q7p3q0NJQghiijyqxf4urF41pXBKBLvSfUTZ5m7StHq?=
 =?us-ascii?Q?H2YJK1l7R+kj3p5h7luz9c+o6ByN4PrTdZZKxT85ADn7+01CkIr4Pb4diIpr?=
 =?us-ascii?Q?4dfgmjCAQP2JNBWb5miMv4CPTlV9JnTNk6mxsCREI+s1blgmY28Obv4UA/HB?=
 =?us-ascii?Q?QN1nW2bi1+F/wBeBPzLx1/y4QWVJPKhVBmHjHY3jASDzZw6ftHoFBB5lWh1c?=
 =?us-ascii?Q?ny/5Mo8Z3mkfTeW2iW5k7ZIjH+l0lZZJNWB25jC1h5ZmWGzk2ejkJJ0oLRus?=
 =?us-ascii?Q?vsOay7PUJGZVpRR04+1brKQ5rPDi3+fOS7N3eGxSjeEwliXu9xbBl+X8Pwc9?=
 =?us-ascii?Q?eeXqIwNTlF1DijccfPmb99yr0lm8Uk3iP4Yo11XoSwo3aj5tvUuOb108XmfM?=
 =?us-ascii?Q?64Gc/faIwXLyr8RnUu7IFUUEV+QZ5kPPszW3FBNzDcdaGzwyXuvzzVX/u6P1?=
 =?us-ascii?Q?faSBU1xLXsFlAc5JMhmJdNRhPLssEpgTk3HrkrW7W+a2cwLGvF13INa0Jnxs?=
 =?us-ascii?Q?S1emW1oMWW7CMGRBvyW1vo/EaSYGe9ZZAIS8Iox8zAXII5CSRWVXtWzvRY65?=
 =?us-ascii?Q?JgMP2oodESIdNbDu3QmmSF26LjdT+R9hJyo9ofv83vwnJeJDLJa/PXOCWtvo?=
 =?us-ascii?Q?nB4QjRVLE3BMPIhWxeQEkyb2+bulBoPRGbIoJR4Usmn4UXHvsJusAutPw5K3?=
 =?us-ascii?Q?+FjmhvYjJpHTQEtCoTf5yn7ICF0iZjaQupj+5wzydjMtA21c4xX2GNDyruU3?=
 =?us-ascii?Q?+AXIllFIFVUWqZr6eB9G2VRe+3nmwvc9QvU9jhs4t3F/MaE8jXK2YDtS4I64?=
 =?us-ascii?Q?93E0ggdCQY8VlINfRjnrGYqmNAFGLTpUQsXdRTtbC8grcpqRHI+s/Kz5+SmM?=
 =?us-ascii?Q?cDAtDLAlx9l8EY+WDQq2OAj0cYOy7aimMUuGcinnVqd57XlmhoZpHVaQwtgN?=
 =?us-ascii?Q?UXWjt4jTyYuXQN9G5bAlmpx95dx4fFUr2h/NyqrSq0dqYlrZatUL6G7PA+9j?=
 =?us-ascii?Q?Rj/DLbDVfIUpy8jySX/QpBRCpB+zkoX+s9yu7tXFHYWQs6C1gI2IOlusHZFt?=
 =?us-ascii?Q?0i0tgVStbiAhucjsVE+hr9UgcfQKeWjjwpL8qtOywdpY+RXfPkGA6qeDkjVx?=
 =?us-ascii?Q?q39wZ+kVYsss8I35tgEF+RlTp5N0QjDqMb4emKsqidqK3uWKixXRtqCI5Yza?=
 =?us-ascii?Q?H034pbBdRsOPMzm2iaGkFaD+BnC3ZV79xhTJKpkWW/rk85jbiwdfN0x4BlWX?=
 =?us-ascii?Q?lyWte6kZhW/LE7aMFntNH2jcWakflTkExwmYo7UcBwuT+G6O5MMo/h88e4vn?=
 =?us-ascii?Q?b11ldxmNm2gLAFba3Ci0/HIg5yHsACsKJMWzy7Ny39L/s08AIrCn8YOum5zH?=
 =?us-ascii?Q?ug=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b2b923f-843b-4081-a6bb-08dd88c56627
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 15:32:36.3422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J5g+t6uY1JOG4/bGWKFquYru7H2ccK0M97073e+VSNrDnhiSMengIobWzrO8YluuKLNreGt/H6SK1dAKuBFbsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6836
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

On Wed, Apr 30, 2025 at 06:25:45PM -0700, Matthew Brost wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The device core dumps are copied in 1.5GB chunks, which leads to a
> link-time error on 32-bit builds because of the 64-bit division not
> getting trivially turned into mask and shift operations:
> 
> ERROR: modpost: "__moddi3" [drivers/gpu/drm/xe/xe.ko] undefined!
> 
> On top of this, I noticed that the ALIGN_DOWN() usage here cannot
> work because that is only defined for power-of-two alignments.
> Change ALIGN_DOWN into an explicit div_u64_rem() that avoids the
> link error and hopefully produces the right results.
> 
> Doing a 1.5GB kvmalloc() does seem a bit suspicious as well, e.g.
> this will clearly fail on any 32-bit platform and is also likely
> to run out of memory on 64-bit systems under memory pressure, so
> using a much smaller power-of-two chunk size might be a good idea
> instead.
> 
> v2:
>  - Always call div_u64_rem (Matt)
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes:  https://lore.kernel.org/oe-kbuild-all/202504251238.JsNgFeFc-lkp@intel.com/
> Fixes: c4a2e5f865b7 ("drm/xe: Add devcoredump chunking")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_devcoredump.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index a9e618abf8ac..7a8af2311318 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -177,6 +177,8 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>  	struct xe_devcoredump *coredump = data;
>  	struct xe_devcoredump_snapshot *ss;
>  	ssize_t byte_copied;
> +	u32 chunk_offset;
> +	ssize_t new_chunk_position;
>  
>  	if (!coredump)
>  		return -ENODEV;
> @@ -201,10 +203,14 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>  		return 0;
>  	}
>  
> +	new_chunk_position = div_u64_rem(offset,
> +					 XE_DEVCOREDUMP_CHUNK_MAX,
> +					 &chunk_offset);
> +
>  	if (offset >= ss->read.chunk_position + XE_DEVCOREDUMP_CHUNK_MAX ||
>  	    offset < ss->read.chunk_position) {
> -		ss->read.chunk_position =
> -			ALIGN_DOWN(offset, XE_DEVCOREDUMP_CHUNK_MAX);
> +		ss->read.chunk_position = new_chunk_position *
> +			XE_DEVCOREDUMP_CHUNK_MAX;
>  
>  		__xe_devcoredump_read(ss->read.buffer,
>  				      XE_DEVCOREDUMP_CHUNK_MAX,
> @@ -213,8 +219,7 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>  
>  	byte_copied = count < ss->read.size - offset ? count :
>  		ss->read.size - offset;
> -	memcpy(buffer, ss->read.buffer +
> -	       (offset % XE_DEVCOREDUMP_CHUNK_MAX), byte_copied);
> +	memcpy(buffer, ss->read.buffer + chunk_offset, byte_copied);
>  
>  	mutex_unlock(&coredump->lock);
>  
> -- 
> 2.34.1
> 

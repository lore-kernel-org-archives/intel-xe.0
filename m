Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E4A606A31E
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 19:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Q+T3olnA;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=jA9U2Czd
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1813A10E590;
	Tue, 24 Nov 2026 19:48:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFE0A10E590
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 19:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795549688; x=1827085688;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Sp2lyD7eLKgbdotU4LG2wUvrDg8x1YvJjfWhIrPhRxc=;
 b=Q+T3olnAIW0qRXmV3TArmsSi/Jjaky/iiXCEd58vHh1WFsMYA/iKaxL1
 I26RIBTCkUBqaoo9o4WFZYWHq8Xh0Sk4JBB3dSzR3SmjMPBKxxJ1y+xFu
 xmExULjshGLvegEdeNQak4bjsI/+bcsVOy1uvY9cIji8uC7UxCiKFgn08
 8MXiadmXnfVYaxOcQkaeXLVoATqsQ4lWO/ntg3gYGsPJpr1ynxGxt881L
 vOXR5gkAlxP49ekbZ543RCAbICYusSiHoyyKh/fNxSaccaFaeul/IG8ki
 j8SOIIi/lVo9cDILppZKFD6DPGYPWo9cMbboDIzsimRXJE1qPK1IMoeOp A==;
X-CSE-ConnectionGUID: djCZvV4IRi+MKiOqcK0PEg==
X-CSE-MsgGUID: OJTguZh7QvGzLL6Dfb/Gow==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4307903"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4307903"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 11:48:08 -0800
X-CSE-ConnectionGUID: bujVfdqtTUO/LYet5vjPnA==
X-CSE-MsgGUID: WrAgSd8TT5+BBFaCKn4U2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; d="scan'208";a="11753113"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 11:48:07 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 11:48:06 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Tue, 24 Nov 2026 11:48:06 -0800
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.71) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 11:48:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HQuGRqvqAOElRSSFL8xwnmPAnuLBnbvGuMrg3cYaJUSKy2WxpnqWAZs/ELryr+UjQOGfjFPFAlADSq7hRoKsVFy8eB8ag/eUTmxRHnyah9/fc3qpiM/y63OYNaqerWimz3l/VooP9XQYqMKACe7PZTBcUabNl1lc8+MIcMiSohtWkvgbGRek/B9v9OvbTgvmHdusx3VZEvnQUVdnYeEZVPmvsNIxQr0kLlfXEfTohJdjAHYjAhEJh042rXUwwNvVBnEqq8uAwAexSjxqRV1dO86Zg1a6xwm6n1ugQGfbA7aKRcZ0MwbsO+iwOmDq1jnoIItW6tQVlNmY2k7DTMzYng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bs/FPjVIW4ABSGUWX5PapiBM+WoaOguD2Ti+QUxb4N8=;
 b=QQi7Xk6dmyy9iBn1/TgtVEtSvuCWyqUr3lk1i4GhJD91w5HKtMVhrvoZtwAc+NJUaZzfWePS6FX9zd7v4fa3MABBnnEabxHx6euXYm9RMYpFMmCa/vjd0m6B6N8nNOJoNjgd5JYigEU7jsb9fzt+DHbAoBKW5PxNmAfVivWZlvo6qUpupsRwXeESqnzg0wKhVA6mXcF8T0IdYchMMd8iE7ear0Cbtie3R1heIqTGvvttPASUyiMaHOhsVZ1Xbpbjpe0NZHMftxR2PKCl0A8mo1pDUqG6Iy0PmKiRYkVF4yBHg0KLxKWAtIvxmCCEB71OsT9mkqqWBFweHvbT2WFJXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bs/FPjVIW4ABSGUWX5PapiBM+WoaOguD2Ti+QUxb4N8=;
 b=jA9U2CzdPXYb1RPOa9QGli2ZOqbRferLco3eMjxpxibUF/5Gyy4wlgQ1oy9gcyMiFeq2mKU9I3xRZ+aweAwKMGM+xrtf/4qMINGHcIkxMZJMHzqai7A7Q2gtWYLqNv9OE8abVIwF1Ub34JHkT1nWCk+STljCrrUH/wOuaJxJ32U=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by DS4PPFBA72E12AE.namprd11.prod.outlook.com (2603:10b6:f:fc02::48)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 19:48:04 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 19:48:04 +0000
Date: Tue, 24 Nov 2026 11:48:02 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/ttm, drm/xe: Drop the ttm_tt on null moves to VRAM
Message-ID: <awXp8nbFKlXWG3vJ@gsse-cloud1.jf.intel.com>
References: <20261107-oom-fun-v1-0-be9eb05b82ed@intel.com>
 <20261107-oom-fun-v1-3-be9eb05b82ed@intel.com>
 <avctByO+qRX9FQ+l@gsse-cloud1.jf.intel.com>
 <4cfd3d47d3029380cc4757ecdebb844658f93940.camel@linux.intel.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4cfd3d47d3029380cc4757ecdebb844658f93940.camel@linux.intel.com>
X-ClientProxiedBy: SJ2P220CA0003.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5da::6) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|DS4PPFBA72E12AE:EE_
X-MS-Office365-Filtering-Correlation-Id: 667ddbed-4bc8-45ef-32c8-08df4a63dac9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|261026121527099003|261102123227099003|261026140227099003|261022105027099003|261028144727099003|261021123027099003|261021121427099003|10067099003|261102130727099003|11063799006|56012099006|4143699003|261009221227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: dT9xbP39zp9DcQlR6h1Xczqvj4m11wyxg963e0mfWNPCBPK0alamXrhpnm/O5rBJiRwlAVhmJk6Iay/i4/mzVYTbETz2VxeHECxUiGw2BIjrzvzFZ3lRCnnxSXwKk6KyI3yQ1ApBymmnQRNmTH0ehv8OnFlnwHNkj/iDbCgGX5+7JiDqGOVzNswQaiGLQ0T0WVpR8AcoMFklWp+nC7q9inQYXfvJ8uza1U4ifARyUoWFWSsLRhQXEZBFQSnpjxLXIiT690/46EuuWKEbUd52kHoZN5NZTq3FINXD1dJmVk1UM0GNSkRriuuKNr60yqAyV+msn/6Dd9p24LG2RI5EmEu6iSrcFzzVyDXQB8zqHWp80mEP5LRbG466OoFofi45gdimhe3ACZQgjZfvRAWXHYSrirurlbnAuj3rfGWb/QSuAAAcuO4jhqBhYucdzYhfEok9Mpuqp72dRHkDcFiGr8A/2DaCfxLmKi4O1vVL7u5xDkglaQMC97H8in544wiM9IhgWHc0TqCgH8MCG0rfKcGyO4ZmSnIA3juN4KTJV0YARuTErt0HY1lX0gHuNEBFLYuiRrXfA4BNRKQaeZrzC2haEXSz6+8+o/7/K4m+7ZZoHOYfzkhxnxgr3ySM1U+t+WQVC7gK6hVsL0Io7OjYib4OT6qUU3VCBDY+C9x9lmg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(261026121527099003)(261102123227099003)(261026140227099003)(261022105027099003)(261028144727099003)(261021123027099003)(261021121427099003)(10067099003)(261102130727099003)(11063799006)(56012099006)(4143699003)(261009221227099003)(261009223027099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?5tyZF4BmMV6siK3ZwZ9M0D1hAR2cwNp1HQOS5jxZY2AQishR8AhiqulMbU?=
 =?iso-8859-1?Q?wZ3QqwwbrjcBdhRuMdsOopRQe1oUUaae7dNAJVSqCnPMN55kXz+FVgI1cX?=
 =?iso-8859-1?Q?bFo6y0vN37yjFhlgBg+aRS4RRyVDbrAHeh8BUYGRkXwep0N2MJC8w0yui5?=
 =?iso-8859-1?Q?leW9eGagbGaJ9oBZRFzRYO2/SqyjJR09ThB8Cl2LdmBaG39GW6zbWR4drL?=
 =?iso-8859-1?Q?IAZHEvnakyOZJLh3pF2A9yrPQ0fJedFkumLcFpdXDE18NH0oIGE5kQzat0?=
 =?iso-8859-1?Q?PfO99opJ+lvbz4sFIHOezvDV/mfFXind3IkQH+keJPx8sgx29xHL0gLBht?=
 =?iso-8859-1?Q?jq9WU2sYKiZFh8xWTbr4v+JfNHaQViH3lTaNLUcskNTVwOg98S7Eiir34N?=
 =?iso-8859-1?Q?vvGuSiJEwlIA16YtaouZV6puZWcN/KcSE9pDa1ZrRlnl3ApcbiQ2Wps8p9?=
 =?iso-8859-1?Q?gSb2P2yE+1+xpml5EEZhBHvi+AI4HcheoDRhKOR/oK00eD2CsF+jMLNyW5?=
 =?iso-8859-1?Q?0802WX1wsZaUanLQd5qpfw5B+/mYi10gMGtFMrodWEwa71ZbRJyvh2a6tb?=
 =?iso-8859-1?Q?DwtJQBDtTqB1GXajT3fobQzm0a9cguuGKNO6kWv75QOWSdbzNqPHS+cCVa?=
 =?iso-8859-1?Q?/qMNq7aWfDx2fkMiy9T4GourAaTOC4kbis3gMCMXS8cJArJRPg1UMSC63a?=
 =?iso-8859-1?Q?q1vJN/s9CDjhnsQybJEGTRglXs6ahKO0e5BAMFfUvr3fjvDAvlV/a7ByH2?=
 =?iso-8859-1?Q?uR1wQzWtZemD95ZIqZhdsis2R6y5zZtcf7qZfsjka7V4ipNp7iC89Y1V5C?=
 =?iso-8859-1?Q?Ug2MPEFUkEzoCAHDQy3PuNkwqMGgu6ffxEi9SklxN5IZTmXC0JU9n08ND6?=
 =?iso-8859-1?Q?ch//nVRPWZizcXRsMg5T+jgtMdR9kDj/6aD1Y7zq9DQAqeFDCVH4MiRMux?=
 =?iso-8859-1?Q?7eh9MY75qxgA3ZDHfq844ClC8XM+8LDbE8T3Sca7FhDRqoUXoP7exkyMjJ?=
 =?iso-8859-1?Q?4EKx20jSMGgCu4aIDpydoSKpPF/3Nk1/DdNyBoSXcpkMyF49aJ3ORt6oP0?=
 =?iso-8859-1?Q?msanPSYjJ6aL+4BZy8yy7b1FmDodwMGLWgyJjZI0yUe2ZoQh9C0mTE6wKr?=
 =?iso-8859-1?Q?b00yM/SqlTUURIs6fTXwy7j1vvR7oJ7nacYVSwn2lqy/czPSfLTHoBLYe7?=
 =?iso-8859-1?Q?568WzVq1rrlhNnWoJQaP1zIpospn9WVhy/qhFeONlUkPRZEejsU2CIrAgL?=
 =?iso-8859-1?Q?F7VomIH6MliDx/lWa87THbJDorjxYzeeArNcKre1CZ9AHkkuRSe6OITodp?=
 =?iso-8859-1?Q?20/tCzfJUpywxkaDZ3RlxwbAIJl3kts+LXL2OAh7ybetBufN9e4SRRnDuY?=
 =?iso-8859-1?Q?2scWvQhoHuKP6dxohp3mG6ZLNmqM0LVmEin6XYyUyr0f6pi1dNFi5khFS7?=
 =?iso-8859-1?Q?DC7yn6+24gtkQqhzrhXYMQiIsq5Q5pOksL43Wsv3bkdjKEOfy99FuThfeW?=
 =?iso-8859-1?Q?EPEJ8znrs+8SRgPKX/DeF7pG1qzcAviNBi59Y+FSqKkGoTzs6Jsgen17Od?=
 =?iso-8859-1?Q?xpxl99Vy8I+uny/8Mre621Kie+B6hntl/ETgiVNupeUsNVshUPti4El3KH?=
 =?iso-8859-1?Q?s1Rwuh96zoqpobKsDmQMu7yhD9HZvcslJDDE0GfXGb9R5sZp26oze5vlRb?=
 =?iso-8859-1?Q?5/NM/44Dq3BHQDqirFCWKIUo4RGeaZvrf7K6j3hBvsvTgvfjY+ZWVGK9S/?=
 =?iso-8859-1?Q?WfkAr7FfpTMtI4bZHmFmNH4rCQIFhlLq6iQUCGYTeZvS+ZrVliO2fCWMdt?=
 =?iso-8859-1?Q?i25ynjHebQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: ZdYAYIFFKoqGMVAk4S/V5tlJ7jO3WTA5UqNNxRWzx5QJPu6wMPeTtU4AjVpM7iqQPQxR57pe/qoUSFO2mgQQVfJW4boxEwijKn5Wl75zW9AlpKpdPWA6E2RxfOzOcq7s13c5Y3d0Dm9PzlfuzG7zANLdlbUjWeu7Sw8X6Tb5gbbt9LwzpSQC0g7DxesQ2fMqPTv2LfpHSt6xGH6HN/gMqCk9BTJcHGVytIm32t+4+f2TSA64RHuykYG/1op482sqGnTzci9Y2SXH4MwNkKtdux0iNj82dD2S5ZtBsLtPWORJz8vbgB5rhh2TCBeUScQ/FAMkQTDq7muaFZKOcT28VQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 667ddbed-4bc8-45ef-32c8-08df4a63dac9
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 19:48:04.4159 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: avJ8qU2qU6fLpO89QDn6Sw0XP9yqxb8sSIimhrISHrx8P4tH6rnumwZ7/uirB8DVwAfNpEwY8BtTWnwCjJT6oA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFBA72E12AE
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 24, 2026 at 08:20:00PM +0100, Thomas Hellström wrote:
> On Fri, 2026-11-13 at 07:30 -0800, Matthew Brost wrote:
> > On Sat, Nov 07, 2026 at 05:26:52PM +0000, Matthew Auld wrote:
> > > From: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > 
> > > A BO created with DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING starts in
> > > system
> > > placement with an unpopulated ttm_tt. Its initial move to VRAM has
> > > no
> > > source data and uses ttm_bo_move_null(), which unlike
> > > ttm_bo_move_accel_cleanup() leaves bo->ttm attached. If the VRAM BO
> > > is
> > > later exported, ttm_bo_setup_export() populates that stale ttm_tt,
> > > pinning unused, unshrinkable host pages equal to the BO size and
> > > potentially exhausting host RAM.
> > > 
> > > Add ttm_bo_move_null_drop_tt() to destroy the ttm_tt when moving to
> > > a
> > > manager that doesn't use one, and use it in xe_bo_move().
> > > 
> > > Fixes: 91494dee1091 ("xe: populate buffers before exporting them.")
> > > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > > ---
> > >  drivers/gpu/drm/ttm/ttm_bo_util.c | 20 ++++++++++++++++++++
> > >  drivers/gpu/drm/xe/xe_bo.c        |  6 +++---
> > >  include/drm/ttm/ttm_bo.h          |  2 ++
> > >  3 files changed, 25 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c
> > > b/drivers/gpu/drm/ttm/ttm_bo_util.c
> > > index f9458a4d5a09..0ab52be3a5f7 100644
> > > --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> > > +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> > > @@ -756,6 +756,26 @@ void ttm_bo_move_sync_cleanup(struct
> > > ttm_buffer_object *bo,
> > >  }
> > >  EXPORT_SYMBOL(ttm_bo_move_sync_cleanup);
> > >  
> > > +/**
> > > + * ttm_bo_move_null_drop_tt - assign memory without moving data,
> > > dropping the TT
> > > + * @bo: The buffer object.
> > > + * @new_mem: The memory to be assigned.
> > > + *
> > > + * Like ttm_bo_move_null(), but if the memory manager of @new_mem
> > > doesn't use
> > > + * a struct ttm_tt, also destroy @bo's ttm_tt, mimicking what
> > > + * ttm_bo_move_accel_cleanup() does. The caller must hold the bo's
> > > + * reservation, and the ttm_tt must not hold data that needs to be
> > > preserved.
> > > + */
> > > +void ttm_bo_move_null_drop_tt(struct ttm_buffer_object *bo,
> > > +			      struct ttm_resource *new_mem)
> > > +{
> > > +	if (!ttm_manager_type(bo->bdev, new_mem->mem_type)-
> > > >use_tt)
> > > +		ttm_bo_tt_destroy(bo);
> > 
> > This is certainly right, as I have seen TT leak.
> > 
> > I do have question - should this just be built in ttm_bo_move_null?
> > 
> > IOW...
> 
> The problem happened only when moving a "lacks_source" bo to VRAM, and
> I was a little afraid of other drivers regressing when moving to
> stable.
> 
> But this should be safe, really. I've sent a new patch.
> 

I agree this should always be safe.

> "drm/ttm: Destroy the ttm_tt in ttm_bo_move_null() when it's no longer
> needed."

Let me look.

Matt

> 
> /Thomas
> 
> 
> > 
> > mbrost@gsse-cloud1:xe$ grep -n ttm_bo_move_null *.c
> > xe_bo.c:892:    ttm_bo_move_null(ttm_bo, new_res);
> > xe_bo.c:1110:                   ttm_bo_move_null(ttm_bo, new_mem);
> > xe_bo.c:1137:           ttm_bo_move_null(ttm_bo, new_mem);
> > xe_bo.c:1146:                   ttm_bo_move_null(ttm_bo, new_mem);
> > xe_bo.c:1163:           ttm_bo_move_null(ttm_bo, new_mem);
> > xe_bo.c:1173:           ttm_bo_move_null(ttm_bo, new_mem);
> > xe_bo.c:1195:                   ttm_bo_move_null(ttm_bo, new_mem);
> > xe_bo.c:1272:                   ttm_bo_move_null(ttm_bo, new_mem);
> > xe_bo.c:1283:           ttm_bo_move_null(ttm_bo, new_mem);
> > xe_bo.c:1340:           ttm_bo_move_null(bo, new_resource);
> > 
> > Why are some call sites in Xe in which use ttm_bo_move_null_drop_tt
> > vs
> > ttm_bo_move_null?
> > 
> > Matt
> > 
> > > +
> > > +	ttm_bo_move_null(bo, new_mem);
> > > +}
> > > +EXPORT_SYMBOL(ttm_bo_move_null_drop_tt);
> > > +
> > >  /**
> > >   * ttm_bo_pipeline_gutting - purge the contents of a bo
> > >   * @bo: The buffer object
> > > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > > b/drivers/gpu/drm/xe/xe_bo.c
> > > index 0181f73ef66d..6628db44951f 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > @@ -1178,7 +1178,7 @@ static int xe_bo_move(struct
> > > ttm_buffer_object *ttm_bo, bool evict,
> > >  	}
> > >  
> > >  	if ((move_lacks_source && !needs_clear)) {
> > > -		ttm_bo_move_null(ttm_bo, new_mem);
> > > +		ttm_bo_move_null_drop_tt(ttm_bo, new_mem);
> > >  		goto out;
> > >  	}
> > >  
> > > @@ -1313,7 +1313,7 @@ static int xe_bo_move(struct
> > > ttm_buffer_object *ttm_bo, bool evict,
> > >  						new_mem);
> > >  		if (ret) {
> > >  			dma_fence_wait(fence, false);
> > > -			ttm_bo_move_null(ttm_bo, new_mem);
> > > +			ttm_bo_move_null_drop_tt(ttm_bo, new_mem);
> > >  			ret = 0;
> > >  		}
> > >  	} else {
> > > @@ -1324,7 +1324,7 @@ static int xe_bo_move(struct
> > > ttm_buffer_object *ttm_bo, bool evict,
> > >  		 */
> > >  		dma_resv_add_fence(ttm_bo->base.resv, fence,
> > >  				   DMA_RESV_USAGE_KERNEL);
> > > -		ttm_bo_move_null(ttm_bo, new_mem);
> > > +		ttm_bo_move_null_drop_tt(ttm_bo, new_mem);
> > >  	}
> > >  
> > >  	/*
> > > diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> > > index 32791c4db2a9..123ef68bd849 100644
> > > --- a/include/drm/ttm/ttm_bo.h
> > > +++ b/include/drm/ttm/ttm_bo.h
> > > @@ -480,6 +480,8 @@ int ttm_bo_move_accel_cleanup(struct
> > > ttm_buffer_object *bo,
> > >  			      struct ttm_resource *new_mem);
> > >  void ttm_bo_move_sync_cleanup(struct ttm_buffer_object *bo,
> > >  			      struct ttm_resource *new_mem);
> > > +void ttm_bo_move_null_drop_tt(struct ttm_buffer_object *bo,
> > > +			      struct ttm_resource *new_mem);
> > >  int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo);
> > >  pgprot_t ttm_io_prot(struct ttm_buffer_object *bo, struct
> > > ttm_resource *res,
> > >  		     pgprot_t tmp);
> > > 
> > > -- 
> > > 2.56.0

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9281BCA0EE4
	for <intel-xe@archiver.kernel.org>; Mon, 18 Aug 2025 16:22:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 526F810E07F;
	Mon, 18 Aug 2025 16:22:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eH9K7vIk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58AFD10E07F
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Aug 2025 16:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755534122; x=1787070122;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0wGfFzSae77ktlG0S2zepMIIIQAd5Rx/rUN0/dthFg0=;
 b=eH9K7vIkMkXZuUCnSepgHTR5DsAeC+OrgTNwLryxb+s2F1zIXuKSi6lO
 pbJGkZYThcJU7o7KpEFr37Z8oNOCQB2eHlgCelbvG4seLYQ5dFAXp2ThT
 6RqyVmjkf1HPyKkNLMM83txyqw4R8PLxif8HNZl0ZFQolsKifts4E+Inm
 Z7fJAbAcZRg90hhrUOwhRjtbp3t82nzGVhPfVafpQRQNIPkj/BSqRHWiL
 RtDqjP78LWGIhj98tQr+izJS6Q26JURbuyZ6Tb3t82rEBAG5bQYhbEJey
 FqXdh0L41lyhYg4a2mCs1AjHJfdHZChmgBjQGF4LXPyu8La9b0ZQPtD1C A==;
X-CSE-ConnectionGUID: rqqo4+UuSbGgigSTBHjGTQ==
X-CSE-MsgGUID: 1goHWbMRTBC6467yp8UsZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="57834992"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="57834992"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 09:22:02 -0700
X-CSE-ConnectionGUID: Lg5IBaaTQ6ObhCr0Bk5ccg==
X-CSE-MsgGUID: LERj3e6cS6mwvSmXcDyDLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="167127712"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 09:22:02 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 18 Aug 2025 09:22:01 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 18 Aug 2025 09:22:01 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.83)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 18 Aug 2025 09:22:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pe2Z+EZkIGucrjDpoHEFtNZDYh/FUyf3jHJHE3GWRhxxwovPRqHw1/tj5ll4HcUwccoEqVHb4gp8Jgj8hBCvzwMWfGie6HMAF8ttST+LCMHUZaW/kisaxfwSeZHEjyGkLlhfHhjPzz80zvHgzKDg4AXKfhEQZrSYOazENdflae7BXntyFa2BWLQtCNrIe0pYzZJKqCCyzWekJCswVnWVZ6aYaWt0e4xG3l/qjrBxUJGNROAAIdMWmYVdN2jQZmKvGcZjEmhp9hCepVhfUnBmy/yHBqv0g66lSyTpGWKL8MIoJ0v+lFLcMVuPN5OqEDCX/Piglh4+7hGCdjimA1oyiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0wGfFzSae77ktlG0S2zepMIIIQAd5Rx/rUN0/dthFg0=;
 b=caPRkZ56DS8SbPyQQ+1KMNKCXSPo7XbAqSh1Hc0vMvGp2wzrOxKdqW+/6xSWoQyOfXmtyy/JyzAoje6Fp9Xt9oyjNe27OZ1uBGjD8yJC8gRdKm7BxNOVgu8wPe7brglY7MVoBGPEL/tHxNI6VkQN9qlkAfBYYBuO+Rxmkyug3iPEJ3UuwEwlwRh8Ba3F+6W0azg2SlTu6R8Tt4CnClRSSxiiNgaT5rF4bF5RKbcOFP6kMqjNou5ZreWvb5QwrU2STK4/QWLezkKbQkXVmyNXbZf0sLbzonkjUdy34Yoqg2sgn1ZKZij7yAy/l2u+PF7hzIuilOK5ocvn7EniTHCcDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB6381.namprd11.prod.outlook.com (2603:10b6:8:bd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 18 Aug
 2025 16:21:58 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9031.023; Mon, 18 Aug 2025
 16:21:58 +0000
Date: Mon, 18 Aug 2025 11:21:55 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/6] drm/xe/kunit: Drop custom struct platform_test_case
Message-ID: <vtmydotrjlx47mdt4dejjyyhgnx6u3r56vchlwc7tbb22j2itn@df337xtbp3yl>
References: <20250801181350.180780-1-michal.wajdeczko@intel.com>
 <20250801181350.180780-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250801181350.180780-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR05CA0052.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::27) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB6381:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f0b8cb6-a383-41ae-47a5-08ddde735af6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Llfrsigi0PPLPE5IrcPQE17se40uXx9xnaykGplWv/JsEE3aSb51zhmZSPB0?=
 =?us-ascii?Q?W/ARiARQFoUH6+Hyyp6c9w+nWE3yVugqEbSkZKT9QAmOD8fnqeCUxKfHsEDm?=
 =?us-ascii?Q?K68bomoxP1Nz+KtvO1Ug6jG3HQwVycKm2xuHXAR5yuKv7j85O7gW2xK3X2ZV?=
 =?us-ascii?Q?oyccBhw5mRTW0Uqs2hxkIsAwoZSfj0TMMRl+4RkGCLirqQ2cBBP65mpGkEcJ?=
 =?us-ascii?Q?5Kop9PHZFVDVZBJlvCraJJIL1QyPy0VeCztcMJG8utjZd25cafOnWCkfYAq7?=
 =?us-ascii?Q?PhDeSGFCYN5N8W8q9IsVkKXkJh0yj3I3yabFEZ8zjkSGqTbf8D7ZkCEcdOGP?=
 =?us-ascii?Q?CHHvNay8LLYnUSHFqmlxAMmWM9bs2ccDtXpvxkiadtkIKBCp/n1Yg/6XCSYC?=
 =?us-ascii?Q?5CUX36tM3ZSEIXAdneOCRm8hUsPGsnFfs3xldAnDdy0xyOn30JgzQsgqYsI/?=
 =?us-ascii?Q?W7JvsnfHlVrklKPNzJvlPrNNxBpA67aENHEjcxhaZPs6eHSWqDZSRuQfk5FK?=
 =?us-ascii?Q?KQWTSHm8MjZSSARN6pGrg9sCHrmVzwjYrzhrAPQ6AGWFo0VY9Ma16Qvkzpwd?=
 =?us-ascii?Q?fZ/t+YtJ5hak7rJYPIHPx+2N4q1CaQ7RTwRwJR/jpLESQ80Szx3ugsUX9Mhs?=
 =?us-ascii?Q?HgROVFl8vnSPOIMuTVX30YXPsqSZsF5P5x3hiobKm8GPHhzphvPUAvrlrGLW?=
 =?us-ascii?Q?6aX33qFaVDoO5o444eeug82f2+DoJpGACdVASoatEOrlIhuGNxX5sKxC/BVw?=
 =?us-ascii?Q?EPCI/KOT8jdonTXV7DCGyfPUfADhpihfJCAZiidC2cBVHxVXu9/iiJCMwdiz?=
 =?us-ascii?Q?csezu586FQlfEYhmg+wZ0maGi+XySk3kxCoFbABsk1EgokYifd93vOgTy33v?=
 =?us-ascii?Q?BR0kXykt/nT4T3HO03eURlMd+5LPmL8P98IlBtdoQPkSNQg/cicql//BwhF3?=
 =?us-ascii?Q?z8/EHfzGmGHsZY3tMPuAq92sDtcRHYVLkC5J2H4VIpPQcJf0U62XTEGP8YP0?=
 =?us-ascii?Q?D1r1e2XWn2oBShxZFts0e2jRPYD2/Isevnjm232oC0iYySVMkLk9gjyDp/zX?=
 =?us-ascii?Q?NJS3L4UnODffOdPj3/NLzJIQt78hubB2jDMuxVNi8rowAF1yHhNn36jFfwfA?=
 =?us-ascii?Q?8kMqHPyOPKg5DMc9ZbqkF14sTAoixrCEQphOAYTRQYu1etXFUDtbxEq30A4P?=
 =?us-ascii?Q?SF9nZJ7r0xBm5+YC/W+vZ/xz1h01kDxVYmGVVY6HQGt+bPg9B6nlJVZq3tQV?=
 =?us-ascii?Q?Jf0AYJNTy7KajPfFl6BaGA4L6bWHRKXFeu3zo1eWwMMJSYnLP+xWB8mN3pSF?=
 =?us-ascii?Q?SIACdYBVmpHl6CQgt6SY53q+VehcDXDpgV326rZp2NWI+ETaW9dKLm0a+9W5?=
 =?us-ascii?Q?vEvh8GMqw602AquFGWkFMlZDkzNz+bso4uF2mfCjlcY7k5r6NGY81Xfljfm/?=
 =?us-ascii?Q?VXxcZ83hg3M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yLDMserM1wpdwAbiywACL9YgnwUCrgfCypEfLT40eNItN4i/ao4SilWueYA7?=
 =?us-ascii?Q?K2usZAjVrqw8yZTy8xb2kU4/ySxThy2aiJ3WESPNZIu0BsEd+bZBxUCeuMJy?=
 =?us-ascii?Q?qKq61GTi8YkRQZX9sVE+zxH/pSrnbw6zhll2y4z8M/0d3xlkoJiCd3cHWp3/?=
 =?us-ascii?Q?hSvojOUTFjFp28stAyQirR1SKBUp6vEJqrMrEpl0zVci80wYD0q5q4hBXq/O?=
 =?us-ascii?Q?1gSqDt+g5a6YJIBKfrH7KOC3UXEbUMiiB7dkSztjI+RApQ3qXBXrntH6zsLH?=
 =?us-ascii?Q?UiF4FaAzcviSEUNcBSVYT9R7E0rO2IwYTFdRtyZo1vxG8YNa56dGqGvrNcCE?=
 =?us-ascii?Q?DHnN0GRaH1OO9tRPpxvd1Xu6PpHPmF7PpaWYBjqTlsHGya/9tfOFweWP8aQ7?=
 =?us-ascii?Q?yedH1c9Zq60bwjplyCEXocogoAAMZ6Q3p1Q7agea8nMsRk2DXYCxpSGYc9Wp?=
 =?us-ascii?Q?kVqwghIADc1wVO+0a+QdwKdDYunFQotmht56iszHvsh7t6ymhfQCdxptxX2H?=
 =?us-ascii?Q?+dZf7nFkxKvek11kgI98vwz5/bnfnuZbWUJC2V73v0+ynyAbUfUUDf8eQmVk?=
 =?us-ascii?Q?LalzFS95pqTLwqh178Ncq9bCHgJ/jEy0WELLPWcNiYkupZ9OpAiSpWVe6fUO?=
 =?us-ascii?Q?D0e+3dUI7vpjUFK2nCuzP+St5zn8HHyoRpmrasbipMZ8u7TFnH1KyDxO75st?=
 =?us-ascii?Q?kotFA1mYn47+WAMrHgvzppVZm8aJkhjsPCLCj0N0ygivLHk6O4GOCKUrOEiZ?=
 =?us-ascii?Q?UN6OHu7uGePRQ4BMh839/4haAkdtxTmvxovwYpoXGA67ynVbMAtIlRt5VX44?=
 =?us-ascii?Q?cGE3l40YKCHSI9EGvUNa3p2zC53Nn8vC+KgcSl5z3dl+3nY0ShxStwgU27mh?=
 =?us-ascii?Q?lB999rBdPsr3K/xwf3Qcq76FKYPT5ap9OtVt7bjHkytA1hY/BE8AhVvD8buq?=
 =?us-ascii?Q?X0XzJslPuebXyDAMJk8hxnE+tc+jTF3gNR2VjwUS6sA1QzteJoChimTOcFty?=
 =?us-ascii?Q?9jHeKZBjVsl0ZHgWq+95OfJgyBhETs4tZmZDid/Sft1RvxwIr7voATRoyrf7?=
 =?us-ascii?Q?FGxZ5xz/pgXWhbuj33hEZV0wN9K6C2NvBvISw/mVNFrvePA0miaCD+ad+26z?=
 =?us-ascii?Q?UO+uvStF1l6GOqLrBZXcB1AtQE/jEbnXt6WBu8n6UM90z/enNt4IuvyBfpEz?=
 =?us-ascii?Q?DO7ml2FXlMMvwS4W3PUjuu6w7XaMxFTbgb/HUic3WS4dSBlO7UAuTYElYVRx?=
 =?us-ascii?Q?7lO5YPxqaFIcf94W8DStAUjGY845mAGNZ4rr6u/4YbMS8UMM3LXBa28vEOWp?=
 =?us-ascii?Q?WNTNcyqxIOOJKjN/NuRgvnDKBvMg0BEbVok73SSRQkvxrJCCA7MK60FX6BM+?=
 =?us-ascii?Q?Pb5678ug6zimWTmIBUHAaNsabEenOGWNlJws700Dp1KgyCwHBB8mkVc6Xd/P?=
 =?us-ascii?Q?p4pJth1hWTkuut1Ujh5XrzK5mLq3LvHmlEkZpI6ht6qRoEa7fZ7mnTCViGIn?=
 =?us-ascii?Q?vcvmZF+KOR8TY4LUkHJVnu4bMrmWeECBO4GF2lF7hhup3nDbEbLnKftp/wRQ?=
 =?us-ascii?Q?b19Hvfkr3lyikZMtak8sPKVFzFnpv6yiJ+n5pQ17pKQ1IN/U7+Uzjf7p6hQ1?=
 =?us-ascii?Q?Xg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f0b8cb6-a383-41ae-47a5-08ddde735af6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 16:21:58.6052 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QQoRXrUjwb6QFpQyOIr2ixbfHrLOtlyG1beYk5A5GKPU9DjfQquRI3af9bX0EGFGNP1cGvGAMXlACUsHyI4ICSfbtDId/CPF4yYtwJVMW1U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6381
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

On Fri, Aug 01, 2025 at 08:13:47PM +0200, Michal Wajdeczko wrote:
>Custom struct platform_test_case definition in xe_wa is now almost
>identical to generic struct xe_pci_fake_data defintiion except the
>.name member, which could be generated by xe_pci_fake_data_desc().
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>

regardless of the outcome of my comment in the previous patch, this
would still remain the same. Only the location of the generator would
move from xe.ko to xe_test.ko.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

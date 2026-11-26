Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3486B606A31E
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 18:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GFMdO2Oo;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=iQKTE7wS
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E98C010EA37;
	Thu, 26 Nov 2026 18:12:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6010E10EA37
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Nov 2026 18:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795716769; x=1827252769;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KTI1Ls1nJT62pJUwA7P0iH9rpB9o1jUkwHTLhqlW/n0=;
 b=GFMdO2Ooh1vGC11ZWrDEBPGsKaMq5WZ4PSfNEL6tCCYz10tI3cQQhv+f
 MebQScaDonYNFlog9eP8Ruv20G+iNvW4bfYRG4VZPuzF+X50hNn1MH/5t
 6mCjFGOmJEMuSRA0N64tm95VmEderWzJGKX248Fn+Y5EiVrGo47Qz6iwA
 SCjEV5z+jWU6c9IlhmZsGTafG1VxJRe05qvpbBCm/PcLy9EKNcfU+OGVk
 caxpZRb8YWB+JjKzO8ZnhGmbDJOj3Lx1wzJ71Me/EShTNrfPYxSwccboY
 NQVzYUpPgKsulV4ez5r90eic5JY6GUZu66uojt+sS8Fe7QzoADr9VECsT g==;
X-CSE-ConnectionGUID: cKv7MDNqTgyoWJrs0lm0Zw==
X-CSE-MsgGUID: UFBbLOKuTv+LRnjtbqNiOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4644513"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4644513"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 10:12:49 -0800
X-CSE-ConnectionGUID: uET44pzlSHitVHL2DjF/rQ==
X-CSE-MsgGUID: 9wZISN/PQymBNrqOQzKXZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; d="scan'208";a="12083218"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 10:12:49 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 10:12:48 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 10:12:48 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.64) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 10:12:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q1p6YxOl5WxPA7rmZTGuY5L4a5l/mgOc4MQJ19Q59tvnXu0ePRnd9jRqIl6YnrdcM0xuN4P6cEfusr8nUQFldWyTOEmpMYSrKHaP2z1PKilXJeUT7FXM34Fq64QaoZd1lV/llQtT+H9KXeULro+Lj7FYhLMqtaTnxaFr+Iw7nmUl4Mn6csH/bjbKgfTbGCVlko3LeGeCK/0HcOmQF4Tw3irLnxALSGZK9zvPmmiS4lZarmB1hC9fJRVL3odIkvT4wuJ9oxd9hSC6v7je6qafnh+wKeGsVDYlRhshLAaZ4JErQ0YMUpsMqw1CQeZmzKQf6TLhWp4FGNDlSe/v1zNsHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ioZzEXsi0s0RQiplwjzIfhO9aXMnExJs7ARjb067m4w=;
 b=CtSOiz998mobxFcSSMyIZpT4xUEGLguYAZJlmCm5FYyXtGkDsofbHZzuv6BKFMKnK2WC2QSlgAPj2IcsnngMqsMFL5z+RkvLXynOQJCEDKbl/7QVnBIRsrO+e63cxM2ZhpAmQqkDYsQwlDnCRPT+LzaW+2tGh+bQ47WlkbuSsWJ6367emi385xcjQWBOPrb31e2FldVr5/H/TDGTdBzYVpulJ9RHGBorU8oxZE5HPx/B44pBOC8Fsdyvqx0O57GX3cMU9z5misELK3u2sc4xlbwh1+UJYdG1TvdKYYV/E31X60HZJabtWr68nfA+1JUgvnJZjody+GwYUP/Hb+4TQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ioZzEXsi0s0RQiplwjzIfhO9aXMnExJs7ARjb067m4w=;
 b=iQKTE7wScVnYi/TJMOki8xGjSI6r8kTYn24eudF5S9Gqme9aMj4wG9226u8Xk421JhMb0hRYfz5ywKgWVKzoNeMVI8JgUdDlJ6EZ8iH46Jg10mHyJpfO4pXBNoGyY0CbkDEELTgRpjE9UNyunib/SjyV6ecmaUCPW4Qhf8QuLH0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5990.namprd11.prod.outlook.com (2603:10b6:8:71::5) by
 CYXPR11MB8754.namprd11.prod.outlook.com (2603:10b6:930:dc::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.7; Thu, 26 Nov 2026 18:12:45 +0000
Received: from DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899]) by DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899%3]) with mapi id 15.21.0639.011; Thu, 26 Nov 2026
 18:12:45 +0000
Date: Thu, 26 Nov 2026 13:12:40 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>, <ravi.kishore.koppuravuri@intel.com>
Subject: Re: [PATCH v3 0/2] Expose power1_cap_max
Message-ID: <awh2mJ_DuK2eI3a7@intel.com>
References: <20261126055530.1629019-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261126055530.1629019-1-karthik.poosa@intel.com>
X-ClientProxiedBy: SJ0PR05CA0128.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::13) To DS7PR11MB5990.namprd11.prod.outlook.com
 (2603:10b6:8:71::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5990:EE_|CYXPR11MB8754:EE_
X-MS-Office365-Filtering-Correlation-Id: c07f0752-d8f9-4f94-a237-08df4be8de7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|261102123227099003|261022105027099003|10067099003|56012099006|11063799006|261026140227099003|261026121527099003|261028144727099003|261021121427099003|261021123027099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: 3KVjxy75nQ3WXgIQ7CtVdbOWZIfOpD0OuqfKHd/rtKTOPCTASDbOa5bB+sKdhBa1YAdIkdB1o+dOTb7YJfjR7a2Zd31Hc9V04BfF11q4ZPA1liiSH79BOBrqtvjDHybt3avpqQAdKEnGmI1uw3YMIVMFssgZkg3T2QQrOGULUuI/4C0uhZ/S5QJeZvpag9EoAtedcW26k3WIihE9rOSj1MeuH4KsO/8hVmTOGOy4lCTUjS/dt8Hjd4PcSW6+mRVjng0uO+lipQPg88vmHaVUTmqx7De49CAksZSBzG1tA1NaT2aJU8JGhnpEOQKRxO4LGPjVu4TRBAl9HhMCgIAutAlffLkid9cdAPY1l1uoFmSihLqmvc8ztGQWTuweLQgTSKXdql9eurrv4CPr0zRJ3B2Bjnx9FrPRv4u7qO+j+ic3/fzhxQv6GiscvD3iYIop07uY9Xvr4sd9tvV+kraH4DyhdPBVk9is2JxkDuI+JruFIU3G3MqSqsyLqF6q0/no8DnmzOQvv2oB2W3JSQJ6TC3aPAqvWMMk7Tf+bNk0jF118iD95+/3zEbMHvxcHmEUloaTAaezTvVVTOpt/CyWXJZqLBXOhHi1arfWNeBIjiU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB5990.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(261102123227099003)(261022105027099003)(10067099003)(56012099006)(11063799006)(261026140227099003)(261026121527099003)(261028144727099003)(261021121427099003)(261021123027099003)(261009223027099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?glmB3pnUKTUADllPZCBLrdK/bhuzrqxuXzbJCRM/mD3deL4fxIvBP9+2ofD/?=
 =?us-ascii?Q?izVSvrC6tptHZRDfbvm5oCJJRoF99C2yRUvzsh4ElPpVRIoSq/VWURUHTq78?=
 =?us-ascii?Q?o42kQythDh6sURWAnKBI2WW1iXY4DLdhxdK0BGH3pYYdUiwTPYTPdu/Sz6aI?=
 =?us-ascii?Q?RVCDU0ZATA5AJRfJnfBjl9mKuhRE4O0wlU/5zlPKRu71HDpelopOUNNBWbzp?=
 =?us-ascii?Q?yh//VnMor2qdslmIQXDoupvxk9dTQvdTyzIg9h50y/tuGZvWI41x+F/bADqY?=
 =?us-ascii?Q?TBg18EDg5ehQthrYz9d8RyCyw/p3lueZ26kCaR+vs18qfQnV9zZ/ZwmdOIAq?=
 =?us-ascii?Q?Tk/2zL0DArtXz2Dy5z6wF0wPmhF7T0g38u5xFo8AgfBcMd9mKviTvfkDUV72?=
 =?us-ascii?Q?oizvuoXiLZnoEjtzeFkUStt4go+R7+X2DiEjnmAweuipw6RVJw6we2Si2nMG?=
 =?us-ascii?Q?bcoUNEyfUgYQRVuwmAocwmYYMCJ6el0NpFNAvCEpVmvxnMkBsuMRnvFzjXzW?=
 =?us-ascii?Q?0kxzWqOTYX+zdh4r7wn+VwuqAJF729A2NOWy3+cuKy8rrm9+JQ4fODOhDjaq?=
 =?us-ascii?Q?Ld1uIHo+YpAhGgeBiV447R1fTPAgJRHO73IEypGRLjOcKQ7WSgKKk2qtntfr?=
 =?us-ascii?Q?iGBhLT+0GigiO29dqgU9+S0iKIvUanv6rnh4UbUN73c515pRIAsWZiKkMs93?=
 =?us-ascii?Q?hpT/Xvn+FJ4LJ6XhL6z9yhrBnIJ7/sCTlu3ki7Dm8QqkeVlUOBO4ZgqUS90r?=
 =?us-ascii?Q?oD5bQkSvkjHUMmRDjB+q9lt2GPg6oFzvYv9JZNa/AGIFuStmwJ5++1YsAhTj?=
 =?us-ascii?Q?87QjaPdFI4J6/RAuVdOUOHcPttWrE78WKUo2u8PWmqJXfFXh0taTawpC67LU?=
 =?us-ascii?Q?zTsNRknF2TWepr0GFocGoA2LbnUM7uJ8PNhlzDzwO5YOZJFLRcV7RTQFMW2J?=
 =?us-ascii?Q?ik9toI6NV/Y7lb9unawYOP3hRI83LtzSTjPxfq4btNizN2yC+gQJgQPyRjvV?=
 =?us-ascii?Q?1SobNwMoPngYqMDi+pfTV4KmUk5XcalHJDxB+ejsItM++d8EKODSddPtHctu?=
 =?us-ascii?Q?+DUU7bJUOSWD5msxox5HO+xOSjC1RpNAPNFQ9TawJCQQ2iesRh9HDrQwGahT?=
 =?us-ascii?Q?mfCi3hSNg/Reavg+4WLMa0SeLZQPzhAk3BHFtKj3J+COiE+krvm+4srC/erX?=
 =?us-ascii?Q?Xr/NP2fzHez+0VZ4HX0Q5KahFb36skQ8RWCk/ml1ucCWxq6yv/+ZodEGR6iE?=
 =?us-ascii?Q?/s22QQurFjWYsKpJBt5gLvbVd1YOdpyQmMmY73mHIp6JYZYcN//2QqfuMl1q?=
 =?us-ascii?Q?rF2DsPojnBKdgPlpKR9y/TxQp7S3irVKJDKpRCPm0ab2P53iTMqP8vwOYGdp?=
 =?us-ascii?Q?HTK2Vh7JCimvRl/ce5FFb02MNfl0G/wJbVsMVgdw1KY2ebL7BWQK7F4Tje4d?=
 =?us-ascii?Q?BKTzQo5g4UhfDfA25ReQVGZlQaKLsH65xdEvCEHkDrqrhfOUcv/M52S6P9Z6?=
 =?us-ascii?Q?w9ukUii4x1cHcHujUtMcSEFDEntacYyj+RYHdbrZRc3TabculWDy2evbAU27?=
 =?us-ascii?Q?bhrNjEbZkaPahH1DVfnAt/5el+WqjFUt6f+xv+zrhw0/HVaRemv+qV4LKwqb?=
 =?us-ascii?Q?9YitjZ/yv43sQA/WctJ4R61YZOWaH2sMDrgj9CSgqRgEZUnIEaAU5ngVySku?=
 =?us-ascii?Q?DMPy5xNjyrbxJoyxJe/GgooaS2Bmu+W6mfZ0FCnMfKMKS1YypRGWzmHJH/FN?=
 =?us-ascii?Q?+UyjHjsmjw=3D=3D?=
X-Exchange-RoutingPolicyChecked: JjE2WdOPhbt9roqOugkctPQGRIgeyxRUoyrsnLWT6cCMCaAZZAD5WJThOcnPksegT8l7OTJclXY7HoDX0SJ6zXXwvFo+5qDR5YEdfaOiqWoUtrDzpxBw5Ygk/IX14vdn4bjMHlmThs8NByWQtDGQ0hBvcsJMpSaENzYqdRuYT5XpSikCEsjEs1LgjyKdin4BF7uaMtRTPHzW6ZnaPBvV2JG1GEBY98Uae9zRh4tLn/GO1Yn+CII7hfv3LT8sdBO0nXrJK7cISP+0P/DtcM2+QTqGOe+76ON3gGfgpyAh8vD6HWITXrrcQKKUP9ndbHFfL9WmTg0yfztneUaMV9bbTQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: c07f0752-d8f9-4f94-a237-08df4be8de7c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5990.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 18:12:44.9254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n9/GnQfTAiTliDmecfqZsh4EcgRZiJWh3jcavRraK+Ywe6wdHqJHquwLkFxq+aN1dv2XrxET6P6ZPv65aUV7Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8754
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 26, 2026 at 11:25:28AM +0530, Karthik Poosa wrote:
> This series adds a power<i>_cap_max attribute and improves how mailbox
> power limits are handled when a boot-time limit read fails.
> 
> Patch 1 adds a read-only power<i>_cap_max attribute for the card and
> package channels. It reports the PL2 limit that firmware sets at boot,
> which is the highest value userspace can write to power<i>_cap.
> 
> Patch 2 always sets the mailbox power, energy and time units. Before,
> they stayed 0 if any boot-time limit read failed, so power was reported
> incorrectly. It also bases power_max/power_cap visibility on the boot
> limits. That way, an attribute whose boot read failed can no longer be
> written, which would have set a 0 limit.
> 
> v1: https://patchwork.freedesktop.org/series/179047/
> 
> v2:
> - Update KernelVersion to 7.5 in Xe hwmon documentation. (Rodrigo)
> - Add patch 2 to address review comments from Sashiko.
> 
> v3:
>  - Address minor nit comment from Mallesh.
>  - Make patch 2 as first patch in series. (Rodrigo)

Thank you, pushed to drm-xe-next.

> 
> Karthik Poosa (2):
>   drm/xe/hwmon: Improve mailbox power limit init and visibility
>   drm/xe/hwmon: Expose powerX_cap_max
> 
>  .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 25 +++++++++++++++++
>  drivers/gpu/drm/xe/xe_hwmon.c                 | 27 +++++++++++++------
>  2 files changed, 44 insertions(+), 8 deletions(-)
> 
> -- 
> 2.34.1
> 

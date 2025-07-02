Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B8CDC83013
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 05:26:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14E8C10E2F2;
	Wed,  2 Jul 2025 05:26:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GEEqz0ud";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3505210E2F2
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 05:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751433983; x=1782969983;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wIlyYDhanRgZMY2LqcTjOznLtVK6wTbh8eoCQHXJDLY=;
 b=GEEqz0udDoGzfj5vZ20vMuUMXgYN4qthoHLZqhjGOLJ6OaRkp04UjJcf
 XVMUhz24LhxEwpzXr/c02YxAps332Rm7N6Z9iSMbfGFy58uDWhrh1xXvT
 zDtfLflGoU/Cl3j8O+4bsG46UndLv9aIDQcs6BcK6bP41xFur3YArDiha
 2e123A6/Mth4KqYNDQ7JGh+NIdllN0Rc6b3TlbzerUANe7crzkMCryj//
 X1F+T0NK1adJx0VeNwAxouZT5EIuRWANNZELqN+Fl7ExiK1O4yMrdTzPl
 FbBIPi8o6RGgkwpFQ3m6IYyJeA9WxzP0qijOkWWl4tvr3TVuGKp+w/BRz g==;
X-CSE-ConnectionGUID: 7MIy11cmTL2FxkvXTeqwjw==
X-CSE-MsgGUID: e7hSz1aQSWaXigUSnWtC5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="79157100"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="79157100"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 22:26:23 -0700
X-CSE-ConnectionGUID: wewCtHLcSd+Rvo8/8WZWvA==
X-CSE-MsgGUID: G1JePSmdTtKCeGZekCpHBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="154519839"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 22:26:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 22:26:21 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 1 Jul 2025 22:26:21 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.51) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 22:26:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YbKajSly/6oUEmslX1r895IhuoeqsMc7BAT/wiWhKtRLeiXRDHZdnYBAjzbMqhnKx+Nws+j5lREv6eWJne55x8iAaIpQ9yP8uGqKEtneRUdU2fptuz7cT1yUiMusAO3oXIN9mKF3CTO0v1nPJY38b+4ap4ErbQFtZc/DYdyc+ZkmCbghNEQ+XkjYLCjVtvx8fUfbHdPzm6X2YXxjVQmNAR+MFXYyGgnvZ0Dawpsdw2HpkfPsAMvm8ukX6SNSNJMNufSZlnF5cEdtQiq1KLfFlcMSK2x8cuxvCugYTz1FTkJYe+MWKPixZxkXqkeqOLfY+E5Jow7/r5MIxEEHg9RMeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FdykpMBLJKD/hhN+F9bwlFLABkaBQqC3rR9lOkMY0h4=;
 b=A3T6QT/uu5+1GCTQhfVoY4+v/ZNFEhURqXpewE74Ns6qCAn+K6tWZYFYwYNIna9NsbBK8PbHN7Y6aDrjxyxWKHOWX32qt9PFZcVPuwCZlo9vqxVDhZqe65xdCt2/+CQYjBQdGNNmgui8u8+g9ABIki/kaUhkigvAX8wlXfO88crAbxdu5zPhq2J3qh0ho0gfIEEHFndqWkCjAZ8rwDGmsymgssddYDO/8GBCpyihLRXB6aiqsGqBzYep2Cpwg0W65ADbQC+4cFt1LZAUENfrnGOgovd3OjlF7Y1oB4SaZyAQnk1XssAYgaNoS2Dl4e9W+uTWNS6xWJIZj+8AWeEyTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB5128.namprd11.prod.outlook.com (2603:10b6:510:39::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 05:25:51 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Wed, 2 Jul 2025
 05:25:51 +0000
Date: Wed, 2 Jul 2025 00:25:49 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>, Matt Roper
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v7 6/8] drm/xe: Add plumbing for indirect context
 workarounds
Message-ID: <m3dx7y75i72hrso7syvqzixgprf7g6bpnt3nwzouw7l357uov7@n2fhb6ungkmj>
References: <20250630122244.7949-1-tvrtko.ursulin@igalia.com>
 <20250630122244.7949-7-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250630122244.7949-7-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: BYAPR04CA0023.namprd04.prod.outlook.com
 (2603:10b6:a03:40::36) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB5128:EE_
X-MS-Office365-Filtering-Correlation-Id: 008b815f-3bb3-407c-3548-08ddb928e8c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?11qCoT+ykHp2Kc9v2ddqla5CvZgJHG1wKl8lQRb1NnX77bnhhVKIF/jrCliq?=
 =?us-ascii?Q?0GEbgC+2XaZVG00b7sAXPAm3OI92wspQLVoJhotq5YML/ZlIBnG97cOPbg0y?=
 =?us-ascii?Q?swS1R1K84RqmNArzzLG4KYZG3ohfOo8kVBpbLV+bjAlj6nbu4xWbzzdTueup?=
 =?us-ascii?Q?W5EliU6lrGSfo3leJRIYOXRyYlb12njSJiSFid7pDipjYi/PhLtAPj1KdojN?=
 =?us-ascii?Q?YF9A6kFGwlNWasL5DxpaCHIfdI+a1kHcf7DqJwMI/JnzZBJVymnk418oE9f1?=
 =?us-ascii?Q?6u+JSsCVuGD7gB5rFoj5UWIiJJ8/EpssIXfxR3vlow+jowYQCKG805x/WoUo?=
 =?us-ascii?Q?raGDAxo7xb8JKkUWcD5MwSwDiKiBURVmQSE//opn3vlqz7NE3ecapIDKCQtm?=
 =?us-ascii?Q?KbkE0lbpl/bXsaSXGkXAhyNjrOFSsC40c5JDDxJhdkvmW8V6xpVsLXmADObk?=
 =?us-ascii?Q?AWANB4fgIX3rjhKByKx0lyHEhdOM68AlDJ+Unr4UQlzu65D7qS5lhJuUg/oE?=
 =?us-ascii?Q?/qhVMKVWk7t0ZBjrl+9NRQ90wTxAOa3hJPyAOrU2PbGiwzRFmE9a5Vf8/Daj?=
 =?us-ascii?Q?FnDcU2tFSi83fkVnJOqmSFxTnrAnbP+ReRO2+pUAwqxJnV3DOHZTT7nH1Tn5?=
 =?us-ascii?Q?8FdEIga9armSzv9UgRevTb5yoC25R/1/wuj7EyOdN0Hq6D+qkUwfvmA8zdyz?=
 =?us-ascii?Q?uoll8Ic7pI9fLroq1yxqjIBrSScVbAqL9K6OY244nXr3qfrkvuLg8HYxDBN/?=
 =?us-ascii?Q?dq47vUg6Nq3Vij1N9NxoyP90E8oKv1BL0hxx1H6heMZAYkYArW4NGztm4JJk?=
 =?us-ascii?Q?xgkZGYeyDGFeiZWs8vIdVYSz6+xFtbQM5w74z3kn3Xz0wFjBO1madDk4cD4k?=
 =?us-ascii?Q?pVT9r7WNca6AaYE7FgpMq62JkSZb6OcLo56VtkhYsPsAM4n//jmrG7ZBDI2R?=
 =?us-ascii?Q?JySDFA/uf76BwtkAs5hBeuGklIj7R+Gfi0KsuKymrpVPPJY6UL0T3Ssf2nLZ?=
 =?us-ascii?Q?ywlaAOaE9zWKqcWNowniYNnaelLD1mIR83XAtFoC+/RE+676kKH+RPVJvAgT?=
 =?us-ascii?Q?xyTATZSeaNWcLSnhVTwDenseDdSewAorbkpMAJtjNybRsJZlhijef7ENTkxo?=
 =?us-ascii?Q?iwE7XVMWTT9XKWyCwW4PhJtgVkwj0iA2/2StBjpvNErmGiGV33B6ytHENq0X?=
 =?us-ascii?Q?iKwjDrF0gJgcQBPZFlj9tirsggZuTuIhKALBI8EPQl3YG6A4P0YqAeL7H5v9?=
 =?us-ascii?Q?Ax0GOhPQhfy+4CgQRcytLeMFH+aOI8knxHyu7+uSkQnRFjQ/6f56OVU4yjG0?=
 =?us-ascii?Q?/g6KLh/nQn2ddP80vXIvHh7JXjNPl+1Nj834ralG276RelJ+1IcpeGYkdV8U?=
 =?us-ascii?Q?qUoFs3g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pxVS2vS8ErQtZ5ASOozUG3jTscHNbk8JrkNKxoyaBU0EOMIP/gaodb4xG7hr?=
 =?us-ascii?Q?LebJYqqj2yaM/Pjlq5RYLBSzBAT1wT00z3OWFb708X6Wkmt8fvPS6FPZNEH6?=
 =?us-ascii?Q?owSnkhx9dII6kAPYwHGa54iFJTb7HomsRLLc6FlomeL2r7bGzSNRifhLDKLA?=
 =?us-ascii?Q?LEs7f0A0q9SITz9B4p5dbk8TEY6jxaGtw324t/WRszg9yLfucPcMwYJTej7Q?=
 =?us-ascii?Q?TNyR3043iQJmpWWFaBSLWqeQst96lZbhkKYogtrETgeDrjY6Iu0+j6bjYxsB?=
 =?us-ascii?Q?xxIZIg4IT7G4VEx+JLAZPj4qTa1pkWIkGymVXoCOfJ8VQ8vc5FQ9hGi9IYRC?=
 =?us-ascii?Q?BwiQt+7FVSpJbcj8gjDeHp+c3l3C0SSZ8st/65/YUFj5nfjFB9y4StWoOL4D?=
 =?us-ascii?Q?ER+w0Q+2FYZeNLWcF74Tg8yeRFIuyPEEB/27LfKj38jTcpt6J/PMZ+BUHHxM?=
 =?us-ascii?Q?ko1+EDKPqRs4CZ0fOsoC2opwAi4b84GeopyZx1svQ58GTBV5Heidoosy5Qxh?=
 =?us-ascii?Q?o+HsFDm667LXZGrwxwW7pBVPgDJbVWaT3ORmX/6EpaQmjWsppN1he+sWzG0q?=
 =?us-ascii?Q?BWH4HbcpgNEwxCNQpI0V/7/XRuCwLXpyYiXVPDBKbTU7MZAsO0B/igHXuZnp?=
 =?us-ascii?Q?WGazAF/VN0XZwwUI7tk+qLXONB4blOmq7TRihZ7M+a/orcJt5Qbo/7YanqgM?=
 =?us-ascii?Q?8cboeGi2y/H2ggKa6NYk/qYN50s3zVIMlZtnt8m2+BXVAsBERCQbfOPpNXeP?=
 =?us-ascii?Q?qHSfKtxT1fyE0w91mu6zROvLGFqRkyjPYBAzWZbldCAQndLXy4UrUj24eEvO?=
 =?us-ascii?Q?NNOhPY/F73E3TfXqQ4QgfLoDsp1UcfKifcqXyC7wcBAj9YDG5EF0eloPGE4c?=
 =?us-ascii?Q?TZeC8mBn1pQOuS5ZJ0zJV5b9Wg8qsdRpucztRljx7zxivnszGZ69NIn81fqG?=
 =?us-ascii?Q?UXjToYxZV+UAse9HdlGKyjfr+lfvhL7shEHi9ztXZkEw4wXNbvdSSlkohd8L?=
 =?us-ascii?Q?pfOSEPMXJDSRgbea+bYq0QFsPd+NKE1laEb5JtbkHZ+Rxfcw/a/SAPvnhxhn?=
 =?us-ascii?Q?AOifbqG9dG+AEI7XtgTcimEFFFhdjsSbq11vHYGHyvQZb6sug84+sikkeEgr?=
 =?us-ascii?Q?9hlhdbygPj5L8Cz4KjzORnVxkk1mS6B3kY8SVmX3hxrORirqTOqMzimPIznu?=
 =?us-ascii?Q?JBVpMebuRTc8nJyj6/SdQCbP+PDRrNTGkwNgq8/zmRHTzwe6idEaoECS96mk?=
 =?us-ascii?Q?MVWwA4SMLw1e3/FFj0p10O04mM/4YLmvZgw81FBa5FVn0Wlrv9VFPM0lp0W7?=
 =?us-ascii?Q?bpjNT3toAAsqIMwVFFsPJz1/P2QmuPQbkBO5vl9bzx2LcrJLXK8Ym09dvojD?=
 =?us-ascii?Q?6B49uWfI1br6b8//HUIy+qaz0qqTeIEOZT/wZckx+fGAY8/FsrrCqjRgc2G2?=
 =?us-ascii?Q?TI2HVfqcJSPwm12EZCzWeTM4OtWmjrUOqepvUi0if5UnryfV6qV2CjZjhyot?=
 =?us-ascii?Q?LpmEw0u8beeHM05J62PGYKhoRKBn2YqEs9e2h2BBQonUtgUORFNhKNTapKpH?=
 =?us-ascii?Q?p4bijIIWY0/nO4s3S6hb22VLtHBUwzQ7ZTecnA1fxA8kYawyRUfOZ+MNrbjk?=
 =?us-ascii?Q?2A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 008b815f-3bb3-407c-3548-08ddb928e8c9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 05:25:51.3894 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mihefBgBxlgEeGnkXx2aRaRBqVPFLLBllUiHoJySYddrRm5AmUXWw7WWYDhG/3oxL7Jfj2sf5sTaGRDLr1qJ8y+XNAvOyB9lRSqOjKCsrrI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5128
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

On Mon, Jun 30, 2025 at 01:22:42PM +0100, Tvrtko Ursulin wrote:
>Some upcoming workarounds need to be emitted from the indirect workaround
>context so lets add some plumbing where they will be able to easily slot
>in.
>
>No functional changes for now since everything is still deactivated.
>
>Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/regs/xe_lrc_layout.h |  4 ++
> drivers/gpu/drm/xe/xe_lrc.c             | 80 ++++++++++++++++++++++++-
> drivers/gpu/drm/xe/xe_lrc_types.h       |  3 +-
> 3 files changed, 84 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>index 994af591a2e8..06c3a24ac381 100644
>--- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>+++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>@@ -12,6 +12,8 @@
> #define CTX_RING_START			(0x08 + 1)
> #define CTX_RING_CTL			(0x0a + 1)
> #define CTX_BB_PER_CTX_PTR		(0x12 + 1)
>+#define CTX_CS_INDIRECT_CTX		(0x14 + 1)
>+#define CTX_CS_INDIRECT_CTX_OFFSET	(0x16 + 1)
> #define CTX_TIMESTAMP			(0x22 + 1)
> #define CTX_TIMESTAMP_UDW		(0x24 + 1)
> #define CTX_INDIRECT_RING_STATE		(0x26 + 1)
>@@ -36,4 +38,6 @@
> #define INDIRECT_CTX_RING_START_UDW	(0x08 + 1)
> #define INDIRECT_CTX_RING_CTL		(0x0a + 1)
>
>+#define XELP_CTX_RCS_INDIRECT_CTX_OFFSET_DEFAULT	0xd

	  ^^^^

no real need for prefix. Like the ones above, this is just
the first platform/arch

>+
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index 39047c94ecde..a06c458fb84f 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.c
>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>@@ -39,6 +39,7 @@
> #define LRC_ENGINE_INSTANCE			GENMASK_ULL(53, 48)
>
> #define LRC_PPHWSP_SIZE				SZ_4K
>+#define LRC_INDIRECT_CTX_SIZE			SZ_4K
> #define LRC_INDIRECT_RING_STATE_SIZE		SZ_4K
> #define LRC_WA_BB_SIZE				SZ_4K
>
>@@ -48,6 +49,12 @@ lrc_to_xe(struct xe_lrc *lrc)
> 	return gt_to_xe(lrc->fence_ctx.gt);
> }
>
>+static bool
>+gt_engine_needs_indirect_ctx(struct xe_gt *gt, enum xe_engine_class class)

I don't think it's really that an engine or platform needs indirect ctx.
It should rather be: check if there's anything to write. If there isn't,
then don't... We can either keep it simple by allocating the extra 4k or
use the approach of counting words before writing.

My old series to be rebased:
https://patchwork.freedesktop.org/patch/655559/?series=149447&rev=1
and extended to indirect ctx... So I don't think this needs function
will surive long.

>+{
>+	return false;
>+}
>+
> size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class)
> {
> 	struct xe_device *xe = gt_to_xe(gt);
>@@ -717,7 +724,18 @@ static u32 __xe_lrc_ctx_timestamp_udw_offset(struct xe_lrc *lrc)
>
> static inline u32 __xe_lrc_indirect_ring_offset(struct xe_lrc *lrc)
> {
>-	return xe_bo_size(lrc->bo) - LRC_WA_BB_SIZE - LRC_INDIRECT_RING_STATE_SIZE;
>+	u32 offset = xe_bo_size(lrc->bo) - LRC_WA_BB_SIZE -
>+		     LRC_INDIRECT_RING_STATE_SIZE;
>+
>+	if (lrc->flags & XE_LRC_FLAG_INDIRECT_CTX)
>+		offset -= LRC_INDIRECT_CTX_SIZE;
>+
>+	return offset;
>+}
>+
>+static inline u32 __xe_lrc_indirect_ctx_offset(struct xe_lrc *lrc)
>+{
>+	return xe_bo_size(lrc->bo) - LRC_WA_BB_SIZE - LRC_INDIRECT_CTX_SIZE;
> }
>
> static inline u32 __xe_lrc_wa_bb_offset(struct xe_lrc *lrc)
>@@ -1066,6 +1084,54 @@ static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
> 	return 0;
> }
>
>+static int
>+setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
>+{
>+	static struct wa_bo_setup rcs_funcs[] = {
>+	};
>+	unsigned int offset, num_funcs, written = 0;
>+	struct wa_bo_setup *funcs = NULL;
>+	u32 *cmd, *buf = NULL;
>+
>+	if (!(lrc->flags & XE_LRC_FLAG_INDIRECT_CTX))
>+		return 0;
>+
>+	if (hwe->class == XE_ENGINE_CLASS_RENDER ||
>+	    hwe->class == XE_ENGINE_CLASS_COMPUTE) {
>+		funcs = rcs_funcs;
>+		num_funcs = ARRAY_SIZE(rcs_funcs);
>+	}
>+
>+	if (xe_gt_WARN_ON(lrc->gt, !funcs))
>+		return 0;
>+
>+	offset = __xe_lrc_indirect_ctx_offset(lrc);
>+
>+	cmd = setup_wa_bo(lrc, hwe, LRC_INDIRECT_CTX_SIZE, 15, offset, funcs,
>+			  num_funcs, &buf, &written);
>+	if (IS_ERR(cmd))
>+		return PTR_ERR(cmd);
>+
>+	/* Align to 64B cacheline. */
>+	while ((unsigned long)cmd & 0x3f) {
>+		*cmd++ = MI_NOOP;
>+		written++;
>+	}
>+
>+	finish_wa_bo(lrc, offset, written, buf);
>+
>+	xe_lrc_write_ctx_reg(lrc,
>+			     CTX_CS_INDIRECT_CTX,
>+			     (xe_bo_ggtt_addr(lrc->bo) + offset) |
>+			     /* Size in CLs. */
>+			     (written * sizeof(u32) / 64));
>+	xe_lrc_write_ctx_reg(lrc,
>+			     CTX_CS_INDIRECT_CTX_OFFSET,
>+			     XELP_CTX_RCS_INDIRECT_CTX_OFFSET_DEFAULT << 6);
>+
>+	return 0;

back on my argument in patch2: I find strange that both wa_bb and
indirect used setup_wa_bo() and finish_wa_bo(), but both of them contain
multiple things before, in the middle and after each of those calls.

>+}
>+
> #define PVC_CTX_ASID		(0x2e + 1)
> #define PVC_CTX_ACC_CTR_THOLD	(0x2a + 1)
>
>@@ -1075,7 +1141,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> {
> 	struct xe_gt *gt = hwe->gt;
> 	const u32 lrc_size = xe_gt_lrc_size(gt, hwe->class);
>-	const u32 bo_size = ring_size + lrc_size + LRC_WA_BB_SIZE;
>+	u32 bo_size = ring_size + lrc_size + LRC_WA_BB_SIZE;
> 	struct xe_tile *tile = gt_to_tile(gt);
> 	struct xe_device *xe = gt_to_xe(gt);
> 	struct iosys_map map;
>@@ -1090,6 +1156,12 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> 	lrc->flags = 0;
> 	lrc->ring.size = ring_size;
> 	lrc->ring.tail = 0;
>+
>+	if (gt_engine_needs_indirect_ctx(gt, hwe->class)) {
>+		lrc->flags |= XE_LRC_FLAG_INDIRECT_CTX;
>+		bo_size += LRC_INDIRECT_CTX_SIZE;
>+	}
>+
> 	if (xe_gt_has_indirect_ring_state(gt))
> 		lrc->flags |= XE_LRC_FLAG_INDIRECT_RING_STATE;
>
>@@ -1214,6 +1286,10 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> 	if (err)
> 		goto err_lrc_finish;
>
>+	err = setup_indirect_ctx(lrc, hwe);
>+	if (err)
>+		goto err_lrc_finish;
>+
> 	return 0;
>
> err_lrc_finish:
>diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
>index 2c7c81079801..e9883706e004 100644
>--- a/drivers/gpu/drm/xe/xe_lrc_types.h
>+++ b/drivers/gpu/drm/xe/xe_lrc_types.h
>@@ -29,7 +29,8 @@ struct xe_lrc {
> 	struct xe_gt *gt;
>
> 	/** @flags: LRC flags */
>-#define XE_LRC_FLAG_INDIRECT_RING_STATE		0x1
>+#define XE_LRC_FLAG_INDIRECT_CTX		0x1
>+#define XE_LRC_FLAG_INDIRECT_RING_STATE		0x2
> 	u32 flags;
>
> 	/** @refcount: ref count of this lrc */
>-- 
>2.48.0
>

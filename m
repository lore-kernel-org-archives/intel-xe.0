Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B8B6CD98E2
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jun 2026 20:13:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14FAD10F102;
	Wed, 17 Jun 2026 20:13:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U52BiwD5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D40A910F113
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jun 2026 20:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781727231; x=1813263231;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=dvBru9mAiFx/k7YroS602VY8rknzXqhyhgHz+8bflSo=;
 b=U52BiwD5nibSYEN5c59VKcu+M3tR2uYet/kgJQctygm/Sc1nll3NVoYi
 X4DUmRd3TpTGe6s7zUVAgJNnFsTX8c5d45mTBLyw7gxpMjtDpHZq5yyBK
 qClKjh2dXP9ReOHlUWuqizJ0JBBCFMY9VZV+FxVnoBvg6R6UljLgMo2NH
 m+oQ+tBGcnrc3LWCwkhk10EGC4lE9qWgKGP7Jrbdao1cXJInRMkIRCCK6
 sfsCAD+BCkt9uREgdg/GFMi4VFVwY0i7dD9pFV2p8uZA+iAgpqFR2U3na
 0u1G7jUt82O7uTJgBBcrxcP1ru8+eHZTG/gPT2eXErhq2mGKTmrdUKeu9 w==;
X-CSE-ConnectionGUID: cX7IyfOGTgmO8ebjDNGP9g==
X-CSE-MsgGUID: BqbJy2bkR/W/lrEtd0HDLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="86386691"
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; d="scan'208";a="86386691"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 13:13:39 -0700
X-CSE-ConnectionGUID: 9iA8s4fMSvaVliJjP1JQXw==
X-CSE-MsgGUID: zwdKaOT8SceXHxadXvCSXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; d="scan'208";a="272236659"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 13:13:39 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 13:13:38 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 17 Jun 2026 13:13:38 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.4) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 13:13:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jvwCgf9Ueq6pt1iZMhMuvDQjikOzdXQDrZVP3m72RvP/U40ebJaOSfooHt4aXpA1PmTBfdYrbKGYkubZBrb2AgRVRPjVfz9yRSoaQrC8Eroa9kCO1qtm+nRRqI14RrB7VFq2JE8LcBK7yghL/gLzHe5UFWR78Cxb5X4Y4brAHszZKMYYgc4ET5SzUZFyAe6y51+3F5xx4uhaHT//NTo2Mzu6oCcdkETb/mJcDCLyGGv0sBAvSKpTp7eOcODrbItMfm+b6bppj8/WDB+9kBkYKhV8wNm3wpI0PhGhAJRRHEzCR3TJluD19vr/QWCy7Cmls1SrHj3a7ABBN821TmcZcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xg1l9zZXuJUiH/17wAi3PBKGCsuN3m2UdF2KvgSteUw=;
 b=Kn+nkweZLyB6J5ZZhh5aQDAbAh9KHtUI/8qpPH0UWrPQrFihZq2qskYaRM3NutYnu77ZGZgyfH2zsRgGcCftG1LZHFXzOXIwmdvIGKvBYZGbpkkuhlKbHoZYtbeO0fw21mkQX63uJN93t6f+tqZzDCOhVPxHQYBN111m/K06qiYMjXTiUQtkQfrmGK3sNCoLb1mLtFhyZL7RB/ZY+Sy2WmoesWVgVl0X8t6O5YDGPZcDjO9W58o5Ez4lDqKZq05zQv6jkJ3DUryMeAj//z8ztLV6IcP8Uir0e7eeUrQSVtDRrMoZbDUFN5m7h28jhB/xHvLZS7gzfFfKCp7SFIob6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SA2PR11MB5018.namprd11.prod.outlook.com (2603:10b6:806:11a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 20:13:35 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 20:13:35 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Violet Monti <violet.monti@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v2 5/5] drm/xe/rtp: Add kunit tests to exercise
 FIELD_SET_FUNC action
In-Reply-To: <20260617-rtp_with_dynamic_vals-v2-5-3f4cb34c2ea1@intel.com>
References: <20260617-rtp_with_dynamic_vals-v2-0-3f4cb34c2ea1@intel.com>
 <20260617-rtp_with_dynamic_vals-v2-5-3f4cb34c2ea1@intel.com>
Date: Wed, 17 Jun 2026 17:13:30 -0300
Message-ID: <87ik7h0vth.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0170.namprd05.prod.outlook.com
 (2603:10b6:a03:339::25) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SA2PR11MB5018:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ed55573-b2a2-46ec-713a-08deccace90a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|18002099003|22082099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: eRHTuUKhnf8DKAm52enDeFBTljKpyfHWUaMThhVjyuch66AwlO0Vk2x7bKK3DK3GeISOCM4D6BiL7KQ/BNhDU2tTjyDc92XuW2WIGlURCt1HSaz8xevBPwoYn5PyDKND1gOtdo7JEQYEdxCi9IQDhGPgenEBTcoTkHEPrPVsgKJ5CZ36vWqICweR3QVye6j8e1yoXgm50Omc2cajClywT5qsRHoxiCWXPLCXGQ7xZY/vX189eUcLBffPIQ4b609ZgAsRBnXH5gPZGY6RICbzQ9/tPARub+3CpJps1fvi5EOOvcMF5/R284/uDc1lTzIVP21SxWBiQgYjLs/H1rHfcg5Vq+0PK1wYCj+eLZbhP67VV5Wl8Jn7Jrv2zvFytxW09mNLIXh9mjipH+QdBe9pE4VjmUf800PKgeod89PqVsux6jB2veMuZ6MoP7UnzOHeoq2S1LH70jk5fP6/vXhrDX4rLN8OhdhmhCYamyQxRqHZK7PgoBtriSmglRFg/lHT39HVX6cyBTUqgBViJEmGuqJttj5RBhQp2356WfDF9V1a6ZTpniwUmmnm9FD9dNxLj72woF0uaIclgKXc3YUFWayXdHjnXUo5/mE9IZv2sB9JryGpUgoFIr4Tl91NYAc4HpUhcOonQkep8IgxzYGYck+Gpw05lufzPkXz4nJJXK4djitHljOolcnqsdI6CAn+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hhw4kAMv+mcb2FgUmJpfDTPWNqE5hduJc2EXAbxsYlVIDpSS/wspKotNUlVE?=
 =?us-ascii?Q?4ZRKW4Y6PzEET8meM1dYywok0NJWDWoLWbHxnUWvaBx/GWjuFzKVGIobJ1Te?=
 =?us-ascii?Q?GWjf7zMcMdBgRlENYXuTXT/2rW+cYrTkJa7NZDzLewTTqWkEq2zXd5dHAwC7?=
 =?us-ascii?Q?yFE0Lo77JYsfhPQXvXaqrespq1I8Flxv6+1eqF0TSgGR4jirRQ9lhVtf5im6?=
 =?us-ascii?Q?/4p92Gs7def8OMiX1E10bAQawCLWlVd+dBknbSBt7gwFKMBiszNp5nIgQ+Pv?=
 =?us-ascii?Q?nL6OYJKAjo7C/SOyuEKbMwvaaWJh/U9o4Pv0178WoYAqWowTPorBWtuv52Yt?=
 =?us-ascii?Q?QJXWGS1HnpbCUbqdBnf7KPb2Pnr9W+uaKWAdUjMD4DO/APuT+zIwMLa1qu8n?=
 =?us-ascii?Q?gxdCAw1pWt7LYkI4MBNJN0+ERKIPmMZrXbBXRtFX/+H0ChO59IZc+3/oh3K8?=
 =?us-ascii?Q?xJ8oPEwaiGR9bkDeX1uRUZHPVSdf3Paeh1UOZq9hrKuLewHsGHMoHSyoLm2K?=
 =?us-ascii?Q?zzqD21ZLfoEg0V+oTueixsau62p1WQ5fSX6GeixLTgfFTKvPY4v///To6k+H?=
 =?us-ascii?Q?SCJz9FCQ3cBh5kK7DwBkkREzMRSWZV1xqxWs8ZOof2dHpCqz25+Gt4FSfaDR?=
 =?us-ascii?Q?nLdz5DsWZhbIVlrlUwWpzp/tC2VyjHQRyr46RvJgZRZ6jZuqXTKRP9V61EXI?=
 =?us-ascii?Q?zmqXeA3EZc7VAQVqGi+Bgf5fbsB0R1a4IDeIaz9X7cfr54QEehc87m0fk8G1?=
 =?us-ascii?Q?iv8YlHWMIlj4LefAjCvyquM/rZDS+Pom25Ew/5adHl27Y4JdKoecHUAyZeDd?=
 =?us-ascii?Q?6FB+wrXMcUljJfm7brcHqpY5JTSzuouOVpd8Vmrlgb8AHt37RmBOUhLTLrvx?=
 =?us-ascii?Q?Uiz9Q4l5PqP8nkR83jaT8b3WPOt7btT8KtH/B/yHm9MigCi8nnHwGT/ugP8B?=
 =?us-ascii?Q?jsT8lkOCQa8qKQIeXuZ8egFrkiUHKrt9APC16hvClHR47vSWRjJFFPpIpCWE?=
 =?us-ascii?Q?QEZvWFDwaDR47/yZj7RguCX38ZZi4l83i/plARBPxrKquOS9XKUsfAD+7XWk?=
 =?us-ascii?Q?uLEUFXpNl4yd6mma5skRc7xtoQTiDNTJM/RzKgjRwdHJUa0K6q/pwK3yONB3?=
 =?us-ascii?Q?mqFt+CHh7QJaKOCjDPVS1ysGMRvXlV9vTLJTRlK0VvI4z/d/rLxfiK7A8gWm?=
 =?us-ascii?Q?lUqOCnP3jasWPUk8baOG1M0e8vkEl8QyGkyuiQAm6oIspKqUcLXB9dkNCPP/?=
 =?us-ascii?Q?6dEF+Pdhu9sCNDPMtH3AdGV3tUqiWHcluR5CINfCty1CYTSlac3rWPHtqCLb?=
 =?us-ascii?Q?lQNEJlGV6LfeZmNDRMy8ReAA6zWeBQ4+elnVVBjTw0CeMBRLofjucNo2XLd7?=
 =?us-ascii?Q?Lcvq87HAvZVSjp+M4MYYU9UrX5Sl6bQvMc7nX8j4osG/nHjTVPkvdRzslojT?=
 =?us-ascii?Q?LkDLCKDE5mqj10GETtUo7hmCWgOlnsWNS08H3QUarIs0joVF+YGP3JqWn0AX?=
 =?us-ascii?Q?6Hu5DgwAYJf9awgM6LJYjzGdnuS2V0eNjnAjJ/DJkHyTcepYLxt0HMHqxubC?=
 =?us-ascii?Q?N9NKWccBy1brd0LohUavn8kHylOXrteqIX+V1F0rUpVsiPgnKpRDXkKroP4V?=
 =?us-ascii?Q?BvnnE5m2uYPkYpF+yQ7LpnkkHom5cJBhWWcTjeyvB3DtXjjUdXN/69Pww2xS?=
 =?us-ascii?Q?HlaTxMBcwwF1QfjAteNpRRcGOzBptizvPphPe9XBN9PdOlAAkzoPsoirp91z?=
 =?us-ascii?Q?ylIFPIhGCg=3D=3D?=
X-Exchange-RoutingPolicyChecked: d0x4eD6ssl3Boj9BM3sQXCZgohY4ufGWxMeCq7FnrBTls5j8EQKUwCDi+9tQnRzM7fiZig2PbijyjqO5HUIt1/kffOOE1FRo8Cxsrj+4qw60uFqujvqwjQTWN1A0oVc8m1kzf3Az+PoneMWHFutYyrBjMrWqKencQO7Qtx1AvLRGjzBQcjpxPOBt21e5TN5jWtb/EJn+0OXC5j6ToGvSHaEGWaN7XUGrH9WD3XsmiuZoF7U/W1vA6VALaducPS5ko1DM8uFtfkh72BU9qy8NQGfDzx7/XmTRqPrBa9ePwQqWn4UUsemRbarvHa47So4tXbFDFvzb2sKrz4SzbPuZLQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ed55573-b2a2-46ec-713a-08deccace90a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 20:13:35.0973 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u8SKMW/wkUybEyisSs4bKMmXTodyEWMDsz675uQA3nVXEpBDAhPfBTdu02ddkUc2US97PFXGmCtXuwdKeDlLUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5018
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

Matt Roper <matthew.d.roper@intel.com> writes:

> Add a couple additional tests to the RTP kunit suite that ensure
> FIELD_SET_FUNC() actions are evaluated properly and the values properly
> consolidate/conflict with values coming from other literal SET/FIELD_SET
> rules.
>
> Suggested-by: Gustavo Sousa <gustavo.sousa@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

> ---
>  drivers/gpu/drm/xe/tests/xe_rtp_test.c | 52 ++++++++++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> index 3d0688d058d9..367811621880 100644
> --- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> @@ -280,6 +280,11 @@ static void xe_rtp_rules_tests(struct kunit *test)
>  	KUNIT_EXPECT_EQ(test, err, param->expected_err);
>  }
>  
> +static u32 bits_2_3_set(struct xe_gt *gt, struct xe_hw_engine *hwe)
> +{
> +	return REG_BIT(2) | REG_BIT(3);
> +}
> +
>  static const struct rtp_to_sr_test_case rtp_to_sr_cases[] = {
>  	{
>  		.name = "coalesce-same-reg",
> @@ -300,6 +305,29 @@ static const struct rtp_to_sr_test_case rtp_to_sr_cases[] = {
>  			},
>  		),
>  	},
> +	{
> +		.name = "coalesce-same-reg-literal-and-func",
> +		.expected_reg = REGULAR_REG1,
> +		.expected_set_bits = REG_BIT(0) | REG_BIT(1) | REG_BIT(2) | REG_BIT(3),
> +		.expected_clr_bits = REG_BIT(0) | REG_BIT(1) | REG_BIT(2) | REG_BIT(3),
> +		.expected_active = BIT(0) | BIT(1),
> +		.expected_count_sr_entries = 1,
> +		/* Different bits on the same register: create a single entry */
> +		.table = XE_RTP_TABLE_SR(
> +			{ XE_RTP_NAME("basic-1"),
> +			  XE_RTP_RULES(FUNC(match_yes)),
> +			  XE_RTP_ACTIONS(FIELD_SET(REGULAR_REG1,
> +						   REG_BIT(0) | REG_BIT(1),
> +						   REG_BIT(0) | REG_BIT(1)))
> +			},
> +			{ XE_RTP_NAME("basic-2"),
> +			  XE_RTP_RULES(FUNC(match_yes)),
> +			  XE_RTP_ACTIONS(FIELD_SET_FUNC(REGULAR_REG1,
> +							REG_BIT(2) | REG_BIT(3),
> +							bits_2_3_set))
> +			},
> +		),
> +	},
>  	{
>  		.name = "no-match-no-add",
>  		.expected_reg = REGULAR_REG1,
> @@ -417,6 +445,30 @@ static const struct rtp_to_sr_test_case rtp_to_sr_cases[] = {
>  			},
>  		),
>  	},
> +	{
> +		.name = "conflict-not-disjoint-literal-and-func",
> +		.expected_reg = REGULAR_REG1,
> +		.expected_set_bits = REG_BIT(1) | REG_BIT(2),
> +		.expected_clr_bits = REG_BIT(1) | REG_BIT(2),
> +		.expected_active = BIT(0) | BIT(1),
> +		.expected_count_sr_entries = 1,
> +		.expected_sr_errors = 1,
> +		.table = XE_RTP_TABLE_SR(
> +			{ XE_RTP_NAME("basic-1"),
> +			  XE_RTP_RULES(FUNC(match_yes)),
> +			  XE_RTP_ACTIONS(FIELD_SET(REGULAR_REG1,
> +						   REG_BIT(1) | REG_BIT(2),
> +						   REG_BIT(1) | REG_BIT(2)))
> +			},
> +			/* drop: bits are not disjoint with previous entries */
> +			{ XE_RTP_NAME("basic-2"),
> +			  XE_RTP_RULES(FUNC(match_yes)),
> +			  XE_RTP_ACTIONS(FIELD_SET_FUNC(REGULAR_REG1,
> +							REG_BIT(2) | REG_BIT(3),
> +							bits_2_3_set))
> +			},
> +		),
> +	},
>  	{
>  		.name = "conflict-reg-type",
>  		.expected_reg = REGULAR_REG1,
>
> -- 
> 2.54.0

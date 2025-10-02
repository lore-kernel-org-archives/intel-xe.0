Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD62FCAC5B8
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 17:24:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 561BC10E0CB;
	Thu,  2 Oct 2025 17:24:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HzOw/l6p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A68610E0CB
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 17:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759425898; x=1790961898;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=01JCzObTWSFniPJ6354zwHycWg4Cq8Sg2ErPWcb/vlw=;
 b=HzOw/l6pddtpU7bbVIJff0sVQI36XBqlkz38Ow+yFn8bR6RUa2jhYh5G
 C0wgQr91H8AH8fSIrv8PCS1QZaNv0r8oVmc7Fwcp9e5yvstfhedVx+nz9
 TK0r5bsvC1YKnh9VubGawzLQYDr5MTJgng16oaEmVuQ37rSAarcLD0brn
 hl+gbzXFq0ztaXiSqSO/fXpirq0/eT1ZkPlJkVVZPRKzFyGayUooGUg6O
 /MQCQxrDnyh92b72EypxwXAtXgGj+oCEKTKMM/cZkpFzf+qxn4cl63kQW
 npSsztnkq8FWthfeYbI3milxm+BbsBAcSjokj5OQtAnAj0aWz0vGdDfSm A==;
X-CSE-ConnectionGUID: Iu9KwhawSSehhkC1r0SFtg==
X-CSE-MsgGUID: eO9PBObxRrq2JIc9kaarsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="61426721"
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="61426721"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 10:24:57 -0700
X-CSE-ConnectionGUID: ypyTv+ljQ7qy2XHzc/DxEw==
X-CSE-MsgGUID: fdwJPSWGQWWVOEF7JwchdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="179507088"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 10:24:56 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 10:24:55 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 2 Oct 2025 10:24:55 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.2) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 10:24:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RdfoLsk8TdTZI2XK7qlaopWo6NpPNFsmDt5ydju5UrtAJ9R/VnD5vwiVnRDA9Vce7MZlbpCjF5B9sRSMbH9Il/NoqZd/iWklHySKfZ1HO4CfvAUF1vD7UbvtEZOrIpKrLGaghPq1sxJCY98kynkDW1zb/4sX+HmAlMXlhO/J0kpBn0bR0wnCIoV1PCan4ypq/iFK7aRq9627YhS7dJj+ytdtwbj7iAdc3/61OTi9N8DcuNtCZv2387OoQRNAzFPNjrf9dkiBQL6nIv/cUixGhFQLgZyrtvm9qUUBdnrrbWKm7y3xZXNWz1iSvk47r1WMVJ7RzWIe6SlkzddCG/xMPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dOi1pdpWrf6L4e6LMqsxjUPOcrHhIZXsWd08D8xWANs=;
 b=NAMithEIyz+WZc6ZwYzumGi9N8RVUOMYKfu57lTYr6tdwbDx0hKUMnBgv3g5YPaSrsVHZ3LSYX+jpSHBxYwIVWvLY0qvDRcvRleLbNtUlzmrPD5EmEmkYh2o8U7bowJDiIeembks2Lp5kd9sABB1BtAC4F8XkVGQ4kptJ1tX3IZOobH1B2UvYVyZ64zVEePqa8jH5UIGnzC6JXJib/bNDl1TfSdzf5tA11yCIMv5yCPRAvlHduxkFsVZack6hJSovnB0I/2ccqFAw7JTgPOpJPiOkg+s7LskXp657X6cm+6veUStWTG0JcGqJJA5iSnxXinia193f6Ck9St3ZankKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Thu, 2 Oct
 2025 17:24:52 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9160.017; Thu, 2 Oct 2025
 17:24:52 +0000
Date: Thu, 2 Oct 2025 12:24:49 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Zhanjun Dong <zhanjun.dong@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v4 1/2] drm/xe/guc: Add prefix to guc log buffer macros
Message-ID: <nzf63ujiyl3wg3kg5zkjpd2rtkhmvqozvxy7ef7qvmbaywe3rv@m2z3gal2tlio>
References: <20251002150302.99524-1-zhanjun.dong@intel.com>
 <20251002150302.99524-2-zhanjun.dong@intel.com>
 <pfqh62crf6qveer36aofmwom2zh7ihvqezaedmnsvb3lof7rjk@rnkpsetbrsb6>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <pfqh62crf6qveer36aofmwom2zh7ihvqezaedmnsvb3lof7rjk@rnkpsetbrsb6>
X-ClientProxiedBy: SJ0PR13CA0121.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::6) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB6974:EE_
X-MS-Office365-Filtering-Correlation-Id: c83229da-d6e2-4e1b-5838-08de01d898c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?O8Y4/VlWc5F/tkCdH1jk8dFWduK5xT+qO4iq5Mo4l1yngNAo7W8l0dByXz6M?=
 =?us-ascii?Q?Qd/02E5jbNRsq8SSdARQEtaOQvmsJVopsBgDfpiDrm/beim2Nx0lqUoFb+Ga?=
 =?us-ascii?Q?KAKyRtPWtVGKNAfG819F2eD8D2BZW7PPX4Fk75tAqHh3OhYKEFkD6N3ShfbO?=
 =?us-ascii?Q?an1BE6+urC9YUpxkTh3yAoxejV4aWi+JDnoO4RKA77Q6JDKDToaU1HlEAo4S?=
 =?us-ascii?Q?0gebTMLfnbirl1FbYRlik5RJsUe+DimIRNTvpMNB7LScm0JRjJe3CnUQgg2i?=
 =?us-ascii?Q?w3qPjsacvaZgg3X3Em5JNQyjZs+zIEmT/vjGQGsmfqFAgLkWHJVu1n9OkUX4?=
 =?us-ascii?Q?NpX8mWln3HkkbSVn/UwYRse3i9Zw2O4Gyb2DRfzq6DmolvuSuroDZtLZ8n3e?=
 =?us-ascii?Q?Ro4WuQDSJAMX5VgmJx+GAqAxPq1xRcbOV84cSvxCzlNxGzAkhleNtKHkV9jx?=
 =?us-ascii?Q?pxcOk//DyOGDhjB44ocxdo9X/6VPIqCRFiAHmb4piVbYTYK0kQ2IieajQKUm?=
 =?us-ascii?Q?X+0VMEuJ9IsLzgn5LstM7A7X0pZyMzGHZNfy0xAYyiNKE9AGZUHfDj4U+pAG?=
 =?us-ascii?Q?N/mge8ty1OlAUa0eQiO7n4kh8XSEot/Sl8jUg6sek077Ma+T0W9FNZEq5hoV?=
 =?us-ascii?Q?PcKjucIqUQoSOTteOAOwQlBgyn6BTqZOUhax3cXzI9u2m4LX2prIeXlXH4Gv?=
 =?us-ascii?Q?Seaaxi/0A1wN0huFlfLckO1s7LbrEzcGXpScu2aZ5AFcpTORWYNOE9sROJtj?=
 =?us-ascii?Q?UlxtP0b3Vre2QNuMOUB3CBrgKkFzlClxBXLgqcfjA8ISpQCfTXiG56OM0Q7A?=
 =?us-ascii?Q?NytcSXfAgK9+OztfBV5n8vaGQbf1Qq+yQm2nh1GMsnFMllR/nzCgV32eL7f+?=
 =?us-ascii?Q?/vOrWhNQcs4br2pVe1mEEOXeh9+YZ8DvCcxeF+j/F1eg560vbPfrkv1zYFQv?=
 =?us-ascii?Q?8cxNjAbXklbzijFeGpPzmDPD8E7/piaeO6/KRufEBWzdbgh6ZtDeLfu5N0MK?=
 =?us-ascii?Q?wGMSEdjh/iTCI3YEA1ibzI6ukndlyFuXofoTeu+Jpttpx2FqlAhQvpOZKyol?=
 =?us-ascii?Q?GzpWYvDJPqtfyETU3IfwdrddoTAoTEgkVq8u+ENOIc6ZVWpL0EWNMj4SvHBF?=
 =?us-ascii?Q?3pSFQz25eMKYhHctRT2JK5JaXDreekYTopaKci4XCo7BeGuOAouIKIuIEnGw?=
 =?us-ascii?Q?yKtiCRkmzq6vPX+AoNqpqFZo7TUzfTbcEONxzRks5nT8ClcwLvIPFAb0jYit?=
 =?us-ascii?Q?IanRJZhccGVT1pN1WRwSMoPUkDnQPlpqqj1GP0cbx4Xtdqf7zHlYxb24DguL?=
 =?us-ascii?Q?aEUleDQ3etahqxeKA9ZiaPwRhrg1F/vLEr1J4IzeXVmn6NavE4q7uf8p8s5o?=
 =?us-ascii?Q?4WVqyN32GHx0ekJ+KXh3Eytvs1/uI7Y3aRvVZ9ZIEGX7xL176CjA3jUq0QvZ?=
 =?us-ascii?Q?ekZE/xV84aO8oKJYHYQu253LStUFm13k?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yF1Amn1ZhS7riRtou4QW4NpBeDyTLUa1mFfvTKHATASV0JY/NG4+Imctaoiw?=
 =?us-ascii?Q?O8lMvlAQ9800kSSseNkU31w1umYilbO/JsyZP6CjD+thpsgIG2LprDuZbhU9?=
 =?us-ascii?Q?+4QiUlRtPhGORziIiFyXK1aah0oAsEleQqjcTPwD00QBy0tIicc/Btt40VI+?=
 =?us-ascii?Q?QZl3Aa2zXJhV33BFV56j68wO7Rlc2rQdIDMiU9c1VNr7WTqdfOz0zkA6Cvo5?=
 =?us-ascii?Q?vJejPv0gGs3lwWTNerijsJbOqX/EM3NussjUSCQZq8vQj/NlZcD6gXFgvFy8?=
 =?us-ascii?Q?7eKpnJZ1XHoo60x1SpoxhN/Cm4ZpLN6FudmFY0wPFsOsPBlVEz5jm+yLYzP8?=
 =?us-ascii?Q?zsUb+8LOK9ONIMKiP6138nzoySeJk0jC9/dWOv9hRRtWJm29NWoUf98OR1GJ?=
 =?us-ascii?Q?DrQZemdJl52rXLoVwp0bje4r2pcuPx7h10okwpWu25xo6ylHUwuF37w7Nxwf?=
 =?us-ascii?Q?fhpaOQhN0PJzGlG7hMHnwgg5bXwf1qeDVrVmcIWni1okZ5YXpuhp1+nT1w9r?=
 =?us-ascii?Q?lrVExrsvbSrojHDg6BQa1Ef7pkkDhVuuu2birTpM+Xi7Lk2PVKK7OAGiO0XU?=
 =?us-ascii?Q?bhfjvutpvBfqbwsFIMeHfMXLDk9Sl4nMP+9tiFLApVqTCnl6oxvTAtLB46Qt?=
 =?us-ascii?Q?+pPTIDo5bciP2w5dxoTv4FsoPmR2E2Bt3uvBPGynhJn5sQSmpy4t/8Of0kWO?=
 =?us-ascii?Q?1rdJMFG7ulqCvZ8rbch1Zb/VXl8pSBAPz6jlQRCMP52FJrMMK3DVFkkDzDEl?=
 =?us-ascii?Q?nAXCe+a4Edu/KaCDv4XgVRv5a0Yy67mw1u2iflY4CpqtAsLDosAdVpLLYXV1?=
 =?us-ascii?Q?mdPYygYv4fLD/FDmYDkLDTx8dTFYQg06Hjifrw/9uy9mwgS1jXP6bXyUHa2E?=
 =?us-ascii?Q?krJ8Ku0mYPPqJ2HCYFbqe16zfT3apBWwxkRzY996iblqBWASVrw1ta/Ozl9a?=
 =?us-ascii?Q?EqNF9YhwK8cSyvmSVoMoZdwOPGcD3hswQlzH3xFvdiLWWqHmCPPagOoUUoPC?=
 =?us-ascii?Q?gX3lFQeucVee7zjeksHVT0TZ2ssvNPbH5zQ2bs0xpBhp8DyYsE/AP1g1Hz+K?=
 =?us-ascii?Q?Ld/xVmLqTmFSWqH4wu6f4pFxVWG++16/mFuZ920/RMzb1Lr+6QRdp1fuIrFp?=
 =?us-ascii?Q?hWTucb73adIhz8slQkqFqKE9B1KXOL2mXBNwMXQCYv9IpUYhTDFNgBSCO/3T?=
 =?us-ascii?Q?chQ+6cIvCWQBBKapTREb7xhgJNGLMU7xZSw6JhY8Bvb4UGoZtWPfbqpkAQDP?=
 =?us-ascii?Q?OCdV85J9BWoDUPiKm+gcf6/8YEloLaWklbkyG+4+/0aRTc+BM2EiEy+8npbe?=
 =?us-ascii?Q?sA4hbaOiVF7znc4MOd5hIhiWTu12K40aHCfJjvlPTXApmQHQ+SXHDC2Qus/0?=
 =?us-ascii?Q?7tZJ4qEKmvPur2JTrpdcA/FuHv8EgM4X4qrX3GeRkyLpoQIdhxFFomgkkCsS?=
 =?us-ascii?Q?/yEcGSUmIsy0Ff9QhZRTRCgyylF7nVDwOo1Be5PVsj1hwcT0TRkZee0Oj2IW?=
 =?us-ascii?Q?+QveZvvAPiiDoUpSURV54bkioR0foxmA3U9PSgkGc+fdMyaDHfUWu3Zjkoku?=
 =?us-ascii?Q?MMvxtw9tkvMhSgifdI3xbFPUMqvc7QjB8bB9cvIyUlEmhlQJllSX7nfGHAyM?=
 =?us-ascii?Q?bQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c83229da-d6e2-4e1b-5838-08de01d898c3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 17:24:52.3414 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WcnRuFPhh1sccqcjFiIp/e3U9uAeZqDPlphzDX+ZjjSadQk/fbM25HHOZKrJp0xfhzq6WslEQQbnFMfHTe33e0gshpZsjY896LrBzWNOVlI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6974
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

On Thu, Oct 02, 2025 at 11:00:55AM -0500, Lucas De Marchi wrote:
>On Thu, Oct 02, 2025 at 11:03:01AM -0400, Zhanjun Dong wrote:
>>diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
>>index c01ccb35dc75..fa1d490dca0d 100644
>>--- a/drivers/gpu/drm/xe/xe_guc_log.c
>>+++ b/drivers/gpu/drm/xe/xe_guc_log.c
>>@@ -50,16 +50,16 @@ static size_t guc_log_size(void)
>>	 *  |     Capture state header      |
>>	 *  +-------------------------------+ 96B
>>	 *  |                               |
>>-	 *  +===============================+ PAGE_SIZE (4KB)
>>+	 *  +===============================+ 4KB
>>+	 *  |          Event logs           |
>>+	 *  +===============================+ + XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE
>>	 *  |        Crash Dump logs        |
>>-	 *  +===============================+ + CRASH_SIZE
>>-	 *  |          Debug logs           |
>>-	 *  +===============================+ + DEBUG_SIZE
>
>what happened with DEBUG_SIZE? in drivers/gpu/drm/xe/xe_guc.c it's
>referred as DEBUG_BUFFER_SIZE

ahh.. it moved just above as "Event logs". I think this squash doesn't
make much sense as you only rename it on the next patch, making this
confusing.

Lucas De Marchi

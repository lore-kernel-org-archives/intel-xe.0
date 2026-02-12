Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECCE1EEA84B
	for <intel-xe@archiver.kernel.org>; Thu, 12 Feb 2026 20:50:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A935B10E2AE;
	Thu, 12 Feb 2026 20:50:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YlrRVUNo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C1DA10E2AE
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Feb 2026 20:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770929420; x=1802465420;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0ACuxcNV+VdO/Z4xYxfnO0JIbLEGx39rb7txs5TUAS8=;
 b=YlrRVUNoehz6wDIFtItyUm4Knf+h3roCXx9TmNCtidlMVyzy7IgIwfOd
 lqug3F+Uvd9RTiFQyYa2bM7rkvubO2Ty7DBlN8G+FPDAl1IDdghjz7Ibz
 FTm6Y3lUpDlRmouc3l+EbjGPXtjdmmu3L4X8cCzzmtAfA0G1hYxLLILbZ
 KbyWu+/0LUVVAptOjS8H7RjN2PqSHLtItsALmZJKT5RFIvr+z0RN7y+mA
 wzfnBL/s2aUeCCXgypxLPaAGDh+0fbdI6MDUlSCcBhO48BUpwRiuh0pq1
 +fBrR3NzYokKN735sA6U+2/miJAllBPwGceFIfJYs4aoY2TBKTHgUERb/ w==;
X-CSE-ConnectionGUID: HgE852alSFSSgSgikrLPNg==
X-CSE-MsgGUID: OStuLNS2R2iF9ibw9Hlq8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="72186563"
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="72186563"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 12:50:19 -0800
X-CSE-ConnectionGUID: 2PSXg1xlQpqiQlrJ0sRi2g==
X-CSE-MsgGUID: jlyJ2GxqTnKZyLZ+kW41SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="243310607"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 12:50:19 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 12 Feb 2026 12:50:18 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 12 Feb 2026 12:50:18 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.8) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 12 Feb 2026 12:50:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lgKzmvSXL4ZoylzEEBk4DBYyafga6q+6j/XagLpQP2d+8ViVFRIUhPWh3P/3G5EGi7UK7ggnSYNH9YNVY2/oq2kJrtva8OS8FF50N7s7BbPVl7SDI0YJVz64r+Zy3bCmOf7glJoN+lfSFLUtXpe4PLzoqGYpLiifwvx9Jne0dWM8ZcSG2wkRncZDKoERYIVsEt6BeNZ4v91DeNkEri6oyBmImxkdhkrjZdzahy0hr+sbrmr8H5/YAsr3nWUGt+aX5FhDPrPb0jKjrcFjqHDBLAIN/40HzodrPPadhf7BOy6PANYLQXLgFJnexCki0zjGK1d9qM8dbapYspuGVK/Krg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HYm30++Njss22liPkTtOUD+xm3J9dnGkLIyDpf5YdXQ=;
 b=W9BQRtFwMlQ/H4qDgiA7O7U/5AL3vjqNCCRd+xyN1TOQ7IY/1AoSIrBNBj2Ht98BpTeen8KDECt+V8SlNg/gf5D9ZVUq5crsNIiWbQ+oWvth3cXvfHO7G80rJqvweUpC5yVuRvt6eqAjDaeBkdO5V40BXLas3mktz88TPuh2wG3A9uqrflLqgx8ggVf2nJeq97TkrYkTRLp7ez+agxW1mCVwTzZQiBkCXDCuBPAGL7QltKk34MTfJaxC8jR/ewJRG96zi6I8irRwpvoyhug5Fk89Mm8+/+hj2lU26r5FnAPN7YXwC4oHeJPwiPuKaTUjHmI26oGcSKQkJYfmTHku7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ2PR11MB8324.namprd11.prod.outlook.com (2603:10b6:a03:538::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 20:50:16 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 20:50:16 +0000
Date: Thu, 12 Feb 2026 12:50:13 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Allow per queue programming of
 COMMON_SLICE_CHICKEN3 bit13
Message-ID: <20260212205013.GN4694@mdroper-desk1.amr.corp.intel.com>
References: <20260205185248.994531-1-lionel.g.landwerlin@intel.com>
 <aY4nBdcGgCpUoS7W@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aY4nBdcGgCpUoS7W@intel.com>
X-ClientProxiedBy: SJ0PR03CA0036.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::11) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ2PR11MB8324:EE_
X-MS-Office365-Filtering-Correlation-Id: 29059c69-bad0-4747-9edd-08de6a785369
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UYtC61mygwKriGHvMw8HE25tSzZCLXBeYn3+1tE18p57n4AlGBbv4DE0usL0?=
 =?us-ascii?Q?eTRIoPNYlv7xk/iX+SL7KAI61kqtf4WWB1thoBTYcCcA0nZRXK14g+DJikjY?=
 =?us-ascii?Q?V6jDtklXLLUxd1XbTxJQ5sPEt0BhY2SbyEwtQzFOQBOMPqJ9y1kwlzhJjhr/?=
 =?us-ascii?Q?GaaF1/LW77wnMO/gzgO94GaqpRvtzlEau68YHfZ7oNNLM8EiC38HRLIzi7sA?=
 =?us-ascii?Q?YWygqEQhb8auzGRwYjlF/6QcfbadBd5LA5D+BBURMR67PihApKyjZfavS1GN?=
 =?us-ascii?Q?9sT7vYhNF52SkULr7b2vGRg6G72XI/mwn/PxbcSeuKmpstngmtKXuNhk3bfT?=
 =?us-ascii?Q?tt97gKTyw316wvZ3k7XmWC6wsZAvgfDkklwSMzcvs8HnUUOISqejtbko4Rmf?=
 =?us-ascii?Q?xjn01CSzMltBVs3XeLfTWMQFkq5dGhH3ykrsuutCbuH9MJJPnJ9acuEUaUoR?=
 =?us-ascii?Q?1aJS7pdlGJy83I1Due8krVEGRjZJQZ293EeiKHs42y+9NPSc/1xQH6KAbIaM?=
 =?us-ascii?Q?wOh7FUXS6TqZNw/9fYIrZOXZeR9uKAD7VLmDzzVBvcycXTwModwgD0vTECyD?=
 =?us-ascii?Q?/bp6+DqrHklcQ9BSjPXLCvFepOSJHkNIQ0aN0SKkY8TcJzxm9e84R039MHhD?=
 =?us-ascii?Q?t/iFAHwgkCFVnQvTfEfFbNplG4hG2ORJEsfdRDREUdgcQYMb2XTIzYdxn63M?=
 =?us-ascii?Q?TYAMNMsBtkXUxHx7PSRCDt4MjYO4jNyqWrgc3Ql0R3oXv24SuwrapCdQ9tVA?=
 =?us-ascii?Q?JQXy+D+Exk3G8XSz5lxgII0yBnOjA5WXaxxG04rYBffkt3gxZb07bRNKP405?=
 =?us-ascii?Q?E/gcGUVw5ZEOezEbKu5Qk6t9ahWkx5lUCMikWba7VhyO00e3Gziu8IoNVRyL?=
 =?us-ascii?Q?QEtBkhQzuFzJu5q+myOYjtvkcMo6nJFIbwRMekZW4QMJC3u1yjkg2f7ofD6Y?=
 =?us-ascii?Q?/b8qckAYWd0uYiT1jcMpEl15MLwefZYn9ZF1lAgvEOz4p6ERFDSZpLWHaSSP?=
 =?us-ascii?Q?kCou2rqSXdH6CNmHpI7pMsLtnI6AriDD0+X9dABvQZRgxDIpxqrnCjgzwRB6?=
 =?us-ascii?Q?nnNaeDJ3O/csq5G5ox94hSTzL4ykPEwyGM3aO41ymDfBcYxcdclEaHKiSHy6?=
 =?us-ascii?Q?OyxOa/gc8zKc2S4joSGpScz2Tha1XHEzbkLcrMuguN5h/KVCvzinm4szFevQ?=
 =?us-ascii?Q?Vgru7B+z3j3JjbdsL0WQuPOq3Q0Twx8Ev354tBbHsv+5o2djK+rsEsPE9s2/?=
 =?us-ascii?Q?KJqE5FyeaLQCWtfSy7tgr+1dOmULnt8iOIiizYrlybJuUFxEvKn/p9/YpmHr?=
 =?us-ascii?Q?AKPvsNpeC1KuMgTjW+A/s3qzPkuKp8xWHFjNp7+nXbXB3rwR93TVFGblQq2b?=
 =?us-ascii?Q?0dlT8DLPAib5jlOVFay2hEcSBl/Ik1/kFPwuV6nz3QLCeBZPZGotqk1nAJBt?=
 =?us-ascii?Q?kpRjjVVqhQYu1JkaN2p6/fAVxSo3vT+Ri5fl5fNaLwPhnNCR8uMzaB9grDRj?=
 =?us-ascii?Q?q3jbllliLIytkZITo7L1P9USBJ/cO6+Fw9yyKYc07Dlq8NL1KwTlhz3vur5T?=
 =?us-ascii?Q?BK4fh5H5P5wliqhrnW4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZjK6ypf/zZQzB/HqRiWd0YU9xawtlgZ+qhEgKRqqln9BXSVcN23ccSQC1n/o?=
 =?us-ascii?Q?4bzy/6GR0viMSx5EHTDhJvSVjn5SSK9Nr+acuPPGKXvGNP+z9LeA0bAcZpBs?=
 =?us-ascii?Q?8+mFa7FcVsVirlqj9IINx1GZlAhSAtEW1AgwgpyaSOe71lBpGMqet/5PqpQ3?=
 =?us-ascii?Q?NNfLweSa37ndJHM1hpfdgxONjvOb3UbsUK9BoTFkO7IqPgQU1G4Vyff+okLO?=
 =?us-ascii?Q?vN5jzA1+MLWvcZfjm6N4dVxwpXMGxZrC19ut+4q9DEERfEp+2eBqAZEoQ+5+?=
 =?us-ascii?Q?yUZscjUNbO2pfsXFembpWnX3lb+/hBAb+Mdxlnd6NlTQ7TheHhWHJfb2NRc3?=
 =?us-ascii?Q?Ogta4pgDY66GKMj/T5t3Xm0tR17bUx+CAHooB37w6lq4fg3vWl0MKhP6wqpQ?=
 =?us-ascii?Q?1yXM+JWHzNqI19XAfijmymyhA6i9gMM2EySeEtvkqwMNSfT4A/lNK4IyxzJr?=
 =?us-ascii?Q?Kv8IcSnt+E/lfaWUWKrwc+1H47VIvOu6OZRfhWHIIzfwU1NRDA7ihE1TO62o?=
 =?us-ascii?Q?FnKu9krRa69sY5q5Oy3lo6QCHUnn8Pa8yI1mJymrGcK/J7HApsNgf81+r7xX?=
 =?us-ascii?Q?sGBKQJTIwuY5axmEJvzN0XaYBzwfL2joXrM0ZqnLx/Kuuu1mfVElTQXPq4t5?=
 =?us-ascii?Q?dBWKa5Qe6AY/kUS+c0lui0SW2QJ9j+vbaoeNnyPxF/USOd3rgdu+88GTfP0U?=
 =?us-ascii?Q?i/jikmk2h1dNmMwthkNoJSzR7LVJNiN+AiDVE/TR7JbEIKWnAXcDwoIXvQ97?=
 =?us-ascii?Q?qbJNhWX7eYikp6fRrprTFX0f18qWK3Zg8QqQByFEb3GnqymYaBS486W/O8ZE?=
 =?us-ascii?Q?kMUsM7nppCc2CPuCreORP9QVeUDN7QlrfXiDuOlO8zXrnoYhlVJPsiffMIh0?=
 =?us-ascii?Q?tVX/We9iUPU3KPhowtMEZzv1eWUtsIQPJoLSz0Jqqnc+0VeYpZ6roW1ho7x3?=
 =?us-ascii?Q?v6+hxSSAuCPOjb/HBZy5PZWCR78MoeJMTz5PbLB4oIlmFBTUvF9DmHdMVk6N?=
 =?us-ascii?Q?qm6Bc5GooaHo2XfhpvC5gJ+QY/76uc7fCTSGRqrHjghWVs+XVWPEkGzUTDqw?=
 =?us-ascii?Q?ejSB4g7ko0uOZnzExd2dDgxiJnHcCY+FSpt4PZOcJw1WasexJL5aBXvRNRuU?=
 =?us-ascii?Q?HauyBJIccaY6sguAL698mPvwdkBOYCeYMokBMibiXwchdI6BZuB/iyqlx7vQ?=
 =?us-ascii?Q?9CT4yNrXOnDljd/ueclwF5xrFr2Q+PGdYOfb0pg8ySBEFgqvr1bWMHCNBTId?=
 =?us-ascii?Q?C0AgkxcwTfrut7ipSZbnfMn4JAJbZy1jJY3++5+appsqNx8LEhq1DNXQPbDz?=
 =?us-ascii?Q?Wi8TDb6uCp8I1X/lMjp2NGfUpD6aUyqPHMq6dZ+3QQ2xEeG19Qin6JYuTykj?=
 =?us-ascii?Q?A0wHJJpARD3E1WD5AMuMZVEinAFxtjQj5cZwV4Xup0hIZ4dyCSKB7NgaR8kW?=
 =?us-ascii?Q?KgJiXhDGJAoO/GrXKUc0yKoYZ6bWzRrsIglgKHi3I8LVzCcepSEnoKYUUBih?=
 =?us-ascii?Q?WaN7+KBvDKXde7BOkqI3jdisO6gn9esfA5wh0ujLdzM+8jX7b6Qb0VG1sMU6?=
 =?us-ascii?Q?UFhuwFhNrrHid+USKDdWDcksLQQW1aPXsxFoaPeMBK+CKLWrBdJF4MXJ3BV9?=
 =?us-ascii?Q?hox3OSDMJqq+z7hLDg5b0+bSe2vaFqLzs2vjj3WWofFaOPceeSZKHZ5angT0?=
 =?us-ascii?Q?pY+T2zk34Dv9jURdvti9A7xzwt6lQO9z5RoQxXUDXnZ+sc/PnabyCAfaRKfL?=
 =?us-ascii?Q?sQ+0PhscVokzMJSZmJH2yjL26vc1qwc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 29059c69-bad0-4747-9edd-08de6a785369
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 20:50:16.3457 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WiiEqU6APOn0joyCRkzD4a6FjPdzB1NE4GLk9Ny4iqsH5WtTl4RRztxZmOdBlcRV6fYJQ00+7laXybQcVIMRNR6R8Hwj6xJGHARxbkJYNsQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8324
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

On Thu, Feb 12, 2026 at 02:16:21PM -0500, Rodrigo Vivi wrote:
> On Thu, Feb 05, 2026 at 08:52:48PM +0200, Lionel Landwerlin wrote:
> > Similar to i915's commit cebc13de7e704b1355bea208a9f9cdb042c74588
> > ("drm/i915: Whitelist COMMON_SLICE_CHICKEN3 for UMD access"), except
> > people have decided to not rely on putting the register on the
> > allowlist for UMD to program and instead have context/queue creation
> > flag.
> 
> Could you please be more specific here?
> 
> I don't understand why we cannot simply add an RTP rule to xe_reg_whitelist.
> 
> If we really need to go with the uapi, it is fine by me. Just attend to
> all Jose's request, plus fix this commit message and then ack from my side.
> 
> I mean, I'd like to understand this a bit better on why and change a bit
> this message here, because 'people' just seems to blame someone
> without being transparent about it. Not good in a commit message.
> Not a good 'why' reason. The commit message should be about why, not blames...

I think the reasoning is that COMMON_SLICE_CHICKEN3 isn't approved for
whitelisting according to bspec 73995 (whereas it was approved on Xe1
and older platforms on their corresponding pages).  We (the KMD team)
are only ever allowed to whitelist registers that are explicitly listed
on those 'approved whitelist' pages, or that are requested by a
documented workaround that comes with its own formal approval for
whitelisting from the security teams.  There have been some mistakes
made here in the past (OA is a big area that we really screwed up on and
it snuck by our code review), but it's good to be more vigilant about
proper handling of whitelists going forward.

It looks like the motivation for userspace wanting to adjust this
register in the first place is the performance tuning setting that just
showed up on bspec 72161.  That tuning guidance was just added one week
ago, so it's not clear to me whether whitelisting was proposed and
rejected (in favor of a KMD-driven solution like Lionel is adding
below), or whether there might already be a security review in flight
that will eventually lead to it getting added to page 73995. 


Matt

> 
> > 
> > This is a recommended tuning setting for both gen12 and Xe_HP
> > platforms.
> > 
> > Bspec: 73993, 73994, 31870, 68331
> > Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> > ---
> >  drivers/gpu/drm/xe/regs/xe_gt_regs.h     |  1 +
> >  drivers/gpu/drm/xe/xe_exec_queue.c       | 20 +++++++++++++++++++-
> >  drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 ++
> >  drivers/gpu/drm/xe/xe_lrc.c              |  9 +++++++++
> >  drivers/gpu/drm/xe/xe_lrc.h              |  1 +
> >  include/uapi/drm/xe_drm.h                |  1 +
> >  6 files changed, 33 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > index 24fc64fc832e9..a1b89f0a22e14 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > @@ -172,6 +172,7 @@
> >  
> >  #define COMMON_SLICE_CHICKEN3				XE_REG(0x7304, XE_REG_OPTION_MASKED)
> >  #define XEHP_COMMON_SLICE_CHICKEN3			XE_REG_MCR(0x7304, XE_REG_OPTION_MASKED)
> > +#define   STATE_CACHE_PERF_FIX_DISABLED			REG_BIT(13)
> >  #define   DG1_FLOAT_POINT_BLEND_OPT_STRICT_MODE_EN	REG_BIT(12)
> >  #define   XEHP_DUAL_SIMD8_SEQ_MERGE_DISABLE		REG_BIT(12)
> >  #define   BLEND_EMB_FIX_DISABLE_IN_RCC			REG_BIT(11)
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > index 66d0e10ee2c4a..d20b4d84bbe06 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > @@ -292,6 +292,9 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
> >  	if (!(exec_queue_flags & EXEC_QUEUE_FLAG_KERNEL))
> >  		flags |= XE_LRC_CREATE_USER_CTX;
> >  
> > +	if (q->flags & EXEC_QUEUE_FLAG_STATE_CACHE_PERF_FIX)
> > +		flags |= XE_LRC_STATE_CACHE_PERF_FIX;
> > +
> >  	err = q->ops->init(q);
> >  	if (err)
> >  		return err;
> > @@ -850,6 +853,19 @@ static int exec_queue_set_multi_queue_priority(struct xe_device *xe, struct xe_e
> >  	return q->ops->set_multi_queue_priority(q, value);
> >  }
> >  
> > +static int exec_queue_set_state_cache_perf_fix(struct xe_device *xe, struct xe_exec_queue *q,
> > +					       u64 value)
> > +{
> > +	if (XE_IOCTL_DBG(xe,
> > +			 q->class != XE_ENGINE_CLASS_RENDER &&
> > +                         q->class != XE_ENGINE_CLASS_COMPUTE))
> > +		return -EOPNOTSUPP;
> > +
> > +	q->flags |= value != 0 ? EXEC_QUEUE_FLAG_STATE_CACHE_PERF_FIX : 0;
> > +
> > +	return 0;
> > +}
> > +
> >  typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
> >  					     struct xe_exec_queue *q,
> >  					     u64 value);
> > @@ -862,6 +878,7 @@ static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
> >  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP] = exec_queue_set_multi_group,
> >  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY] =
> >  							exec_queue_set_multi_queue_priority,
> > +	[DRM_XE_EXEC_QUEUE_SET_STATE_CACHE_PERF_FIX] = exec_queue_set_state_cache_perf_fix,
> >  };
> >  
> >  int xe_exec_queue_set_property_ioctl(struct drm_device *dev, void *data,
> > @@ -946,7 +963,8 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
> >  			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE &&
> >  			 ext.property != DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE &&
> >  			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP &&
> > -			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY))
> > +			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY &&
> > +			 ext.property != DRM_XE_EXEC_QUEUE_SET_STATE_CACHE_PERF_FIX))
> >  		return -EINVAL;
> >  
> >  	idx = array_index_nospec(ext.property, ARRAY_SIZE(exec_queue_set_property_funcs));
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > index 3791fed34ffa5..f4f72d01eb8c8 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > @@ -134,6 +134,8 @@ struct xe_exec_queue {
> >  #define EXEC_QUEUE_FLAG_LOW_LATENCY		BIT(5)
> >  /* for migration (kernel copy, clear, bind) jobs */
> >  #define EXEC_QUEUE_FLAG_MIGRATE			BIT(6)
> > +/* for programming COMMON_SLICE_CHICKEN2 on first submission */
> > +#define EXEC_QUEUE_FLAG_STATE_CACHE_PERF_FIX	BIT(7)
> >  
> >  	/**
> >  	 * @flags: flags for this exec queue, should statically setup aside from ban
> > diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> > index 3db7968aa5e22..571d7ef303e1e 100644
> > --- a/drivers/gpu/drm/xe/xe_lrc.c
> > +++ b/drivers/gpu/drm/xe/xe_lrc.c
> > @@ -14,6 +14,7 @@
> >  #include "instructions/xe_gfxpipe_commands.h"
> >  #include "instructions/xe_gfx_state_commands.h"
> >  #include "regs/xe_engine_regs.h"
> > +#include "regs/xe_gt_regs.h"
> >  #include "regs/xe_lrc_layout.h"
> >  #include "xe_bb.h"
> >  #include "xe_bo.h"
> > @@ -1443,6 +1444,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> >  	struct xe_device *xe = gt_to_xe(gt);
> >  	struct iosys_map map;
> >  	u32 arb_enable;
> > +	u32 state_cache_perf_fix[3];
> >  	u32 bo_flags;
> >  	int err;
> >  
> > @@ -1575,6 +1577,13 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> >  	arb_enable = MI_ARB_ON_OFF | MI_ARB_ENABLE;
> >  	xe_lrc_write_ring(lrc, &arb_enable, sizeof(arb_enable));
> >  
> > +	if (init_flags & XE_LRC_STATE_CACHE_PERF_FIX) {
> > +		state_cache_perf_fix[0] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1);
> > +		state_cache_perf_fix[1] = COMMON_SLICE_CHICKEN3.addr;
> > +		state_cache_perf_fix[2] = _MASKED_BIT_ENABLE(STATE_CACHE_PERF_FIX_DISABLED);
> > +		xe_lrc_write_ring(lrc, state_cache_perf_fix, sizeof(state_cache_perf_fix));
> > +	}
> > +
> >  	map = __xe_lrc_seqno_map(lrc);
> >  	xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> > index c307a3fd9ea28..083a2167aeef8 100644
> > --- a/drivers/gpu/drm/xe/xe_lrc.h
> > +++ b/drivers/gpu/drm/xe/xe_lrc.h
> > @@ -49,6 +49,7 @@ struct xe_lrc_snapshot {
> >  #define XE_LRC_CREATE_RUNALONE		BIT(0)
> >  #define XE_LRC_CREATE_PXP		BIT(1)
> >  #define XE_LRC_CREATE_USER_CTX		BIT(2)
> > +#define XE_LRC_STATE_CACHE_PERF_FIX	BIT(3)
> >  
> >  struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
> >  			     void *replay_state, u32 ring_size, u16 msix_vec, u32 flags);
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index 077e66a682e29..b69b95a56bd82 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -1329,6 +1329,7 @@ struct drm_xe_exec_queue_create {
> >  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP		4
> >  #define     DRM_XE_MULTI_GROUP_CREATE				(1ull << 63)
> >  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY	5
> > +#define   DRM_XE_EXEC_QUEUE_SET_STATE_CACHE_PERF_FIX		6
> >  	/** @extensions: Pointer to the first extension struct, if any */
> >  	__u64 extensions;
> >  
> > -- 
> > 2.43.0
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

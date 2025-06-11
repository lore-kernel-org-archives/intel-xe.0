Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C791DC71136
	for <intel-xe@archiver.kernel.org>; Wed, 11 Jun 2025 20:18:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AE2210E720;
	Wed, 11 Jun 2025 20:18:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aouj/rtu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4AC010E720
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Jun 2025 20:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749673134; x=1781209134;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=d8YyW5LDlI499zinhklyLgUbrwiZDOBYE5nai6cEFns=;
 b=aouj/rtub5AbL2lMF+tQVtf5aXY/fsgLMei//1MdVW3Yb6pOOKQENTg6
 5Imb4Msd2ndbiImzeT4qWKV18n0bhj9/tYNCK5DLJl6GYwUg5K9O2yYIe
 GmC9wyKdAbm4iUAXUZFq1k1kk5QP0/c5f7PA2LgsO30Pn59S2Heqei9OF
 UPt4Y0V8bJBosKC9q2TZqsDGDs+22TSPlGj7QQBcXN5p/SyPs9cekrS+1
 FGvA1j0TyCIqgqbDhdFuKwsytRwx2GzhnUYrDJ2WlKI6zYEKild4wKxiR
 Y/P+3HHPtCu3iglYVWET/uSIpFPFU1bozfKeK1ZO8SieQNBc0MBrkSCpj w==;
X-CSE-ConnectionGUID: ZmmHZTbXSbKFWAGUdGctgw==
X-CSE-MsgGUID: bObndUoGRkCDrJ9OfQeQeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51708797"
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="51708797"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 13:18:53 -0700
X-CSE-ConnectionGUID: S3X/a+GETzy57gZCLWLWgw==
X-CSE-MsgGUID: YG6NxMX2Qlewhhqj/XMzGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="147196011"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 13:18:53 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 13:18:52 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 13:18:52 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.52)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 13:18:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KQqdyVWRpmEqnYgGBPkqih6U95oL5RrDAOPmqntptLZOiXy+nJ8oB8afKOXbdBo/emRA3OpJiSZHr1bP1E7HEcJeGit+bPmAzYrkcJcpugwBsyzaHCDpomuYYCFoQs/U1n9P3BRAmiuFHQ9jEvA5RdKTmcYQdsC7dDmNjT5+u8Qn/yQ3wx1e2nbCcAT9jwAPWf6JDWLH+WNzFmcuf9boeb+QsumfUOWK6tTHuSm2LPT+9aPyr4jvsJU5schcjrSTlan5U7Z2lFAOyO35BT6E7iw6f67fzU+WL25VTXJjQG+gxFGsEsstzIn7F/3okWVqTKtntVJpP4hNLjX5ckxzZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xhnDRvv/orHb3WTzsx2+L3H66p/KYTSACpzL9ZeV+aE=;
 b=YsKdl78lZ2PBgcpnJ8+r9ppJds1+yLVCED7UdUfygSlI5y+7Cp/SZupiixgmLlAGJjngDFEQk50vnstpGhHH3wJTDOroCugSGm5I6We9iog7QadUgOmq0zpUQ+8KCw2nf3bl7yUr2B8fWrqZEQH0rDXAtR9tzXL3nk0C/BYaQuuX681MVRHTjNbfpGtsATdVVT3J4lySJ9Fq97aM3nxiaeTRqBliLQ5fMBgrytLVXubPlEzQEPUbzVwmMRb8+nXs9ckNjW6qXJLqrLCjwjrK/DkQChy6DgpR992sf9PoMhan47LzLH0oXdGyxOdHUKhtzRZJQLmV092kJFC962K/ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA0PR11MB4765.namprd11.prod.outlook.com (2603:10b6:806:9b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 11 Jun
 2025 20:18:45 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8835.018; Wed, 11 Jun 2025
 20:18:45 +0000
Date: Wed, 11 Jun 2025 15:18:42 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>, 
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/lrc: Prepare WA BB setup for more users
Message-ID: <km7hclspp5nxwnbrwal2r3bbrep3qw5casj2xsuvb2lsggeulv@m2noyiptlctl>
References: <20250604-wa-bb-fix-v1-0-0dfc5dafcef0@intel.com>
 <20250604-wa-bb-fix-v1-2-0dfc5dafcef0@intel.com>
 <49b2fe81-24dd-474a-8030-ee692919a68d@igalia.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <49b2fe81-24dd-474a-8030-ee692919a68d@igalia.com>
X-ClientProxiedBy: SJ0PR03CA0213.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA0PR11MB4765:EE_
X-MS-Office365-Filtering-Correlation-Id: fe71ca1f-4902-47ff-9218-08dda9252a75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?l3v/F95O1oifwfamvwe4ZwOhBW6QB+mNWzTo5KVwrh49BLHlHtRR6s+oUc1m?=
 =?us-ascii?Q?CtPrk7IE8wEXmvGJQR6XpXJo/X0T1PHRcT8WS+KijOyuPFmN0hswmafmdnNI?=
 =?us-ascii?Q?qxJi2lQ9+5uJLmKpeYsr5BK69rp2mUVYMpPnVUZl3gAgy0wzljy9PwJoJI7R?=
 =?us-ascii?Q?75MHqcrct9r/MHcDGmPcPQh5DlZIgavVMeNFfz99skqVtO5iaJRwLizIPkFY?=
 =?us-ascii?Q?3k7PPQd8WzbiFVQIYeYNLNv7rbMjtQO7siDm1XXVoD7tovpda/EzHxsaj82l?=
 =?us-ascii?Q?lDEuDsgvtVHvdBh3sNeYL/NO8I4RZ3t/ZT6tqyM3AfyyXrD2Lhprcuze5Ihb?=
 =?us-ascii?Q?k5E0HbA+GvDaCwbHcgsCgtGaDS+an4RiQflvB7sMFL2fWmPMF7I8MSktaafP?=
 =?us-ascii?Q?tpYXYM1IbmcC7OTajKHgsJeZZbBRZDFEF1AnQTaYQ+qCVQtH1d6zw36y/4Yy?=
 =?us-ascii?Q?HHAzn9sSX+l4Rc4ypZcX6XFb47iAIYrbYIEZsKNK8oFhP1gLuj/LinWG3AWg?=
 =?us-ascii?Q?pYxFiGZLJMN6W1qRXsWpvPc3UaVEYg4zpmRkilDsUh1oOhaUbzvIlipyL56i?=
 =?us-ascii?Q?Ai7JPidWqUBOkSzqbJ2lujyER1EyoGLyMsjDeyw8T2IDWlI1wV8LaJtvjntd?=
 =?us-ascii?Q?vgfE81GRFOA0eascrijNn31GZOaV7Dwpp2nUB4MSjqaybXJ58cvIFUj8Ek6Y?=
 =?us-ascii?Q?PA1YMmGVxyiTMa3Y1+2NeA4gE8AVm4D4NAVuHJFHO7qqOWFxwUQezxQ/7ZZZ?=
 =?us-ascii?Q?8PIIusHXIS0Y7YWUEcVYP0MP4H9qEyl478QUbFDgFRZ0zRB88bNUzrghTDu8?=
 =?us-ascii?Q?J8WHcxCQiJrl9MMVrUbBKD/Ff51CE1BQPoirpanlUmVvhA5Hd5dmAYAVXxAi?=
 =?us-ascii?Q?MT1KS37V79HCyw1aVkZEeugLyiNU0p1OGYJ1rlyVxBI1PmVIGihKPN/n8/J1?=
 =?us-ascii?Q?BGTCyx1183diIYoDNjCseq4o0TJ96A3rIHdKITi/zfhHBL8qOGyVBsSOPvV/?=
 =?us-ascii?Q?BaqkWFySIOSWlibXJDI8i66ZdtSPNtwptaYVixOG45nbGMV2mAcDCQcRj2I6?=
 =?us-ascii?Q?uytCAZ5LF08M6630BtaTBaaEtBUPZR1fbPk0adlq8bXYpCMGCHr6Nd0BdVci?=
 =?us-ascii?Q?iacJ67c/KMMqTBneTbIHwNLCTfXsK4dJYa2fjJ+UMgMYSEwggOPkGpUGTwTg?=
 =?us-ascii?Q?XHjztwMrlSpR8eBhUCR8aYBK4lUO5mDDEI7tFHOQgc6GnH1wlBjM11JZ289u?=
 =?us-ascii?Q?2a6sBHU7YvKg+F2ZlPzcJF2hHTPRTIZkQZ84SmGaoZhS/blRE/rDMug0zKgr?=
 =?us-ascii?Q?qQaqzX20nReWwiaJogTJ/1lbh4NIkDaIdC0tK+XRPQ5qt7efqtGBRwoehzgf?=
 =?us-ascii?Q?xcfDerLxoSzxorY2ft+o9RpTZSATmXPAxHZxlGHN0z3+sAPw6Zq8HtsGdg1R?=
 =?us-ascii?Q?U3UrN6DkPx8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/QBJPVnEcRZpn8xRIMRgdh2XdgLaSmy1Lu5lt01lQOc2neo+VUxAjtoxGJT5?=
 =?us-ascii?Q?BsD2Dfe5aEWCHZ/YFIYDO4Jb/4HMdd4veTU4RqTMi6TWN/LaVjfI2WXS1Om4?=
 =?us-ascii?Q?Z+uVR5V2phDQld0040/MJD5XJLv57vEYTTN7vnYDm0xgojJJUF3kXH6wC5kk?=
 =?us-ascii?Q?zDuxV5uWBknwucINsW65A04udn7tJ3Km9vJHZOjTB8EZh3uehiiGA0b65EhM?=
 =?us-ascii?Q?yok/ani/dotNde5r4Y/3GCFfuuyCvObnw3nUGQfBWfYwFCRhxBxicKKY6wgy?=
 =?us-ascii?Q?tvcYcd3EtEjfClQsa7c/5wF9oP1TzwtvZru/JXsHHplVoYoDnJvU6pGo6zvA?=
 =?us-ascii?Q?DA4bLEWV13sqPbTie4uoGUK8E59QtT5TBHkeTpWg07FB5WiNWbj/JjrwrO2y?=
 =?us-ascii?Q?9v7d8R7B5ZTEMyR7fujH7HHHvMrm8AIQW4gTwA3y/XLI2cwb6iyg2eeu0wKh?=
 =?us-ascii?Q?IuOSQTbzwfzWH9bNCtamhGsntc6mUiDlsfD0GnJro/cBTXGAFz+muCDiz6dF?=
 =?us-ascii?Q?3Jic+nb5ZlLkPt6guphNLvctgYQ0h4MASusHB7mi3tHx43Hi2P93dgKF0DpD?=
 =?us-ascii?Q?yYdm7QWrDS/iU1N3ssdyIElnUKkvtJojoLiVJ93GG6QbzTOegRXf3/HtcwDW?=
 =?us-ascii?Q?JrEubzhfibr7ikSqd2DhreciL6v6cYg62xMHyCNEkJYPO07Xfie1rimk1zKB?=
 =?us-ascii?Q?jh9/VrNzdWrv2YHPTMf31M89eTYfqK3XmWY3Qw+HSmrLqzr+4QCKwLvXcJLf?=
 =?us-ascii?Q?ya0SdS93FiC2S2xviwhNodBIEJeaKFzI7zjRyA1AS8LCFoxZrrLs4aHMp4L1?=
 =?us-ascii?Q?DAHpO+8TzUDc7Dqmm3RjfrpP6CVTFSVqx6/1sGbErxSxgr0tuoylM+n2yszS?=
 =?us-ascii?Q?Ee9zkMTYM6S1jycuLjtCq14ph1QyPTa/oMJZKOixGpPPOMs+dVhLNHNyP/zP?=
 =?us-ascii?Q?5zOMiuRZDBeVBBN+RY9PR6U9VX2tlGqEjPSjCfud2v1aiWgACs/h4mI+Hk8m?=
 =?us-ascii?Q?QS9X2BqwAkwoF1l6uYbsxA/Ai0v6mirpG1aSBjSwO9B+dh3MtVmDd+/7ScpM?=
 =?us-ascii?Q?QBYPmy9sZXR6BLR06mtacZndemLY4oCgCeC4x0GB7vNqqsSVfo+nxLkCXe+y?=
 =?us-ascii?Q?CLl35WV5SyUigqt9VtkjWM6UlPvCjVJIpe3IXypuhEG1GIYFfSc8L6zVD/YD?=
 =?us-ascii?Q?Q4rw2sBeA+ImbbkLm9CJntihm4PgsZIeeU7g4lqmgZV5FdSpfxlyaj/qe6Rj?=
 =?us-ascii?Q?oHGmnxE5HMqlZwj0RsDXFM4HUtd0s0Q4kITuWDf6gTCA0p4V6koKBIDYP3Cz?=
 =?us-ascii?Q?SwLZIEtpccIWgHwglHW9v2ONaSihTczXd1ObfMk9TDWc0PMQnfss+JVPsBdc?=
 =?us-ascii?Q?bGptICKtrxYQtKPBFyDjna43WGa6FuzBWH6G6A3rzUIY8AUIM5F+4Z41qrTo?=
 =?us-ascii?Q?izsKUduIfacDL348FSZQmV+Q8lDjx6YJL43Dl4kdgkFFYBCTfq0wcHJd/4wh?=
 =?us-ascii?Q?JM46zzB8moX+kDvIpmFVXrPKxxMUlEdAqgqKxwrnbZ2gyqr5yErAvUj7UdKY?=
 =?us-ascii?Q?wO6DpLgv9DOPwampcG/IPmVSe8+vlOPuz2B/F4K3FwSEE0+gSwQhw2Qt8png?=
 =?us-ascii?Q?Og=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fe71ca1f-4902-47ff-9218-08dda9252a75
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 20:18:44.9643 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KNz4oA5tFzR9XdJHdnwQyim4zIIHnIZagamsUAfjlKU7j5EfD3ESSddoVqKpEYVlyHworIZrPF8GkCVGJDrSyu6IvbN+fH2aLqGZuTISE/0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4765
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

On Mon, Jun 09, 2025 at 01:01:49PM +0100, Tvrtko Ursulin wrote:
>
>On 04/06/2025 16:03, Lucas De Marchi wrote:
>>The post context restore (WA BB) is a mechanism in HW that may be used
>>for things other than the utilization setup. Create a new function
>>called setup_wa_bb() that wraps any function writing useful commands in
>>the buffer.
>>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>>  drivers/gpu/drm/xe/xe_lrc.c | 69 ++++++++++++++++++++++++++++++++++++---------
>>  1 file changed, 55 insertions(+), 14 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>>index bf7c3981897de..529c6a972a55b 100644
>>--- a/drivers/gpu/drm/xe/xe_lrc.c
>>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>>@@ -914,9 +914,8 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
>>  }
>>  /*
>>- * xe_lrc_setup_utilization() - Setup wa bb to assist in calculating active
>>- * context run ticks.
>>- * @lrc: Pointer to the lrc.
>>+ * wa_bb_setup_utilization() - Write commands to wa bb to assist
>>+ * in calculating active context run ticks.
>>   *
>>   * Context Timestamp (CTX_TIMESTAMP) in the LRC accumulates the run ticks of the
>>   * context, but only gets updated when the context switches out. In order to
>>@@ -941,18 +940,13 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
>>   * store it in the PPHSWP.
>>   */
>>  #define CONTEXT_ACTIVE 1ULL
>>-static int xe_lrc_setup_utilization(struct xe_lrc *lrc)
>>+static ssize_t wa_bb_setup_utilization(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>>+				       u32 *batch, size_t max_len)
>>  {
>>-	u32 *cmd, *buf = NULL;
>>+	u32 *cmd = batch;
>>-	if (lrc->bb_per_ctx_bo->vmap.is_iomem) {
>>-		buf = kmalloc(lrc->bb_per_ctx_bo->size, GFP_KERNEL);
>>-		if (!buf)
>>-			return -ENOMEM;
>>-		cmd = buf;
>>-	} else {
>>-		cmd = lrc->bb_per_ctx_bo->vmap.vaddr;
>>-	}
>>+	if (xe_gt_WARN_ON(lrc->gt, max_len < 12))
>>+		return -ENOSPC;
>
>Hand counted check is a little bit error prone or could go out of sync 
>but I have no better suggestions apart to maybe removing it altogether 
>and relying on the main warning in setup_wa_bb() catching all errors 
>during patch development?

humn ... but the main warning relies on each individual function to
report the count. I don't think it's a good option to overflow the array
and then later warn about the overflow.

Here it was easy to just give a max. In other places where the size is
more dynamic (coming from configfs) I use the 2 steps approach: first
count the number of entries needed and second write them to the output.

>
>>  	*cmd++ = MI_STORE_REGISTER_MEM | MI_SRM_USE_GGTT | MI_SRM_ADD_CS_OFFSET;
>>  	*cmd++ = ENGINE_ID(0).addr;
>>@@ -971,6 +965,49 @@ static int xe_lrc_setup_utilization(struct xe_lrc *lrc)
>>  		*cmd++ = upper_32_bits(CONTEXT_ACTIVE);
>>  	}
>>+	return cmd - batch;
>>+}
>>+
>>+struct wa_bb_setup {
>>+	ssize_t (*setup)(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>>+			 u32 *batch, size_t max_size);
>>+};
>>+
>>+static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
>>+{
>>+	const size_t max_size = lrc->bb_per_ctx_bo->size;
>>+	static const struct wa_bb_setup funcs[] = {
>>+		{ .setup = wa_bb_setup_utilization },
>>+	};
>>+	ssize_t remain;
>>+	u32 *cmd, *buf = NULL;
>>+
>>+	if (lrc->bb_per_ctx_bo->vmap.is_iomem) {
>>+		buf = kmalloc(max_size, GFP_KERNEL);
>>+		if (!buf)
>>+			return -ENOMEM;
>>+		cmd = buf;
>>+	} else {
>>+		cmd = lrc->bb_per_ctx_bo->vmap.vaddr;
>>+	}
>>+
>>+	remain = max_size / sizeof(*cmd);
>>+
>>+	for (size_t i = 0; i < ARRAY_SIZE(funcs); i++) {
>>+		ssize_t len = funcs[i].setup(lrc, hwe, cmd, remain);
>>+
>>+		remain -= len;
>>+
>>+		/*
>>+		 * There should always be at least 1 additional dword for
>>+		 * the end marker
>>+		 */
>>+		if (len < 0 || xe_gt_WARN_ON(lrc->gt, remain < 1))
>>+			goto fail;
>>+
>>+		cmd += len;
>>+	}
>>+
>>  	*cmd++ = MI_BATCH_BUFFER_END;
>>  	if (buf) {
>>@@ -983,6 +1020,10 @@ static int xe_lrc_setup_utilization(struct xe_lrc *lrc)
>>  			     xe_bo_ggtt_addr(lrc->bb_per_ctx_bo) | 1);
>>  	return 0;
>>+
>>+fail:
>>+	kfree(buf);
>>+	return -ENOSPC;
>>  }
>>  #define PVC_CTX_ASID		(0x2e + 1)
>>@@ -1139,7 +1180,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>>  	map = __xe_lrc_start_seqno_map(lrc);
>>  	xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
>>-	err = xe_lrc_setup_utilization(lrc);
>>+	err = setup_wa_bb(lrc, hwe);
>>  	if (err)
>>  		goto err_lrc_finish;
>>
>
>LGTM, I did not spot any mistakes and I can easily rebase mine on top 
>of this. And follow the same pattern for indirect context.
>
>Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

thanks
Lucas De Marchi

>
>Regards,
>
>Tvrtko
>
>

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E62ECA0EFF
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 16:42:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F54D10E869;
	Wed, 27 Aug 2025 16:42:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gCNSduqw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8977210E869
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 16:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756312966; x=1787848966;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jyjdtt3bjhyzc7BsFhnsHeeBIrRt5pk3GecRLQXRGxE=;
 b=gCNSduqwk0sfZxX2hQ0gBo56JSKiySnJWXzmIkZt6v0fnxD1wLShWTO2
 mULH3Dom5cS6NrL9ziv4r7AZ6Mt+9H5C8XGefsBsRHdpo2dWVO6ND7d4h
 kngRjcNwljHQDrexM/NKeO+85rhSJSzTOS3/d5I+Ux76yL4idCO7cuzes
 q8lQTDEb1rWzDszLYYZV50icjl/WDUTxD0xSyQpD4m3wZC4+z8pf88kbi
 ocjs5ec3CDqPbOPS2UpoTvF8pg4ybklX/vLlKFewwvf5ziEB9uvH1Rtx6
 fqv77/t8TSmoNkkBvspMCK5ZY/qxQ4uNZmfbUOL+q8TI04q+ymjgxcEq6 Q==;
X-CSE-ConnectionGUID: CPDhyZIzQRifRv+zacL+HA==
X-CSE-MsgGUID: FJGZsTiEQUqq2sLNnAZD3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="57591766"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="57591766"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 09:42:45 -0700
X-CSE-ConnectionGUID: iZs8g7XWRc6YmAL9WZINpw==
X-CSE-MsgGUID: i2mvNlvrTbKk6f9gc984kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="200780674"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 09:42:45 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 09:42:44 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 27 Aug 2025 09:42:44 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.50)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 09:42:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zMndLMN2O7AVRtBT+NszLHdf5dZTWWzGFamZtsEWCXeehmauQODINaUxZdamD5k1mZfEwTMm6yzYdqYtYbjLciP3mqgRO0QzYrSjWgYcknQCaNrSCd+AlPuNoQ/Ln26bYPKISamH/w2XOSmMlqYuMsehDKr3Cjqo7EY9OsdacPeR2JHTsW4gR3OX9rhBw5rYLeS56Ogej7O/FDG9hEMS+FWkarYM55RQAJc1xwfYqWuTSKsXjk+1UziVkcgTEbkwMGBjejS3ozHMES4RTYCLhWKP5NMNLMgueVyGsJ48dT7txZPub/aZtabmoj8LhpD3lQe9+vG0TmXiyecU9eLaRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QBP7JI3BlUsXeNrMD9r3MRsHCMrwDUSUEwAvE6pQZX0=;
 b=uQgTmEz06Zi6+rJOGzzAm7GRtigMB9qiV8oqr3Xrmj/Bn2baqNdrpfdzcFTMz/o+cLsyndjylwYca5pimaD99DiTxQwEryoAEkfIfstKW/2qfXNXuG9Z8sMLQuXQuGQD+S92AaKt2Z6GQ09eiqjNam5NUgcSySgtXqRYEfHaZC0h4X5hleDLIGhFwtCA/duCiEZRJJBP1wvTm7VYGx8RZWVEErvK/cdim4crelZjBZv9iYBy3z1hShnhBhTCMdFm81YKGpxXz1+GF8Pwvo7n4HythRZJjC9R5SpOstGi9weZmJi4wWLAWPJeT9VOkl6Va4yHb7RTuRB6hG95sZzSIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB7467.namprd11.prod.outlook.com (2603:10b6:806:34f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 27 Aug
 2025 16:42:41 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 16:42:40 +0000
Date: Wed, 27 Aug 2025 11:42:36 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 1/2] drm/xe: Add clear_stats GT debugfs
Message-ID: <jtyrwedlxl5lsmvnokk36yl67riozdoaouevaqodsqseshiymk@s7gckoneoexq>
References: <20250819185349.2837153-1-matthew.brost@intel.com>
 <20250819185349.2837153-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250819185349.2837153-2-matthew.brost@intel.com>
X-ClientProxiedBy: BY3PR04CA0013.namprd04.prod.outlook.com
 (2603:10b6:a03:217::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB7467:EE_
X-MS-Office365-Filtering-Correlation-Id: f5c9b110-f9a5-4ff8-41c3-08dde588bced
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0UO3guGI2M0guYY1JJRZ7cwZ8mvs5WeONyAoIS66pEk7wcb4HQgdVkJU9Sc0?=
 =?us-ascii?Q?L/OZLza8GyYvUiAnq5yaJPxz2+/d8q7CpQGQArkIASTOBtMjZkTRJj5TReXC?=
 =?us-ascii?Q?NUsJEgXOELVZnG2IUpr1grDyakJPNBtGCTuRXUW5j6RiKN1nTp0CQrIxi/bN?=
 =?us-ascii?Q?K/Y9obFdfXu0j4BkMe+WcyriENAls66JbLkcdW/kceE0GAEZrH2cWpgRgRKr?=
 =?us-ascii?Q?dkWobL8gCVQwobwnZgllk1l1aSIEGVTLaJSPr5Ukmo30C6cJBAePX4zDtd65?=
 =?us-ascii?Q?c9BgiWwMkEGBHZxGkMcznDVLkUkfwxM5P6FWzehCeMz79A+uzSyV6W/rNHCz?=
 =?us-ascii?Q?mM10pejE3KfH4mPx4DQQ7261OcBDADd1ErClJDrQEqYxrXYBw05AB2zIq2AU?=
 =?us-ascii?Q?sBxXK8w5UiBrsv+5jkV2d1nrs79iyIouOs158IijwEq+Q6XtBRsm5i1LjXdC?=
 =?us-ascii?Q?W0x31mXWp9JMYB3GfDGEcuD1+EtqI2KcECdwKxZPSdP/BWNOHc2GwH899RK3?=
 =?us-ascii?Q?ZBGCqY7Bt8G+Gh6FV+yqz/C7x1iFkz4AYO8h9xzk5g26WhbxQ+2+w/Kh9lJE?=
 =?us-ascii?Q?XpSeAqisgKRL8JjvhiIP18IUnq+VuE4nrzSpy228UPZu64RayYHOSAemdv+8?=
 =?us-ascii?Q?M3lqTklpefriYbX4Wu/aEviHPLi0L7tWaz76WnkTTcEHeyPr7wznHO3Ruu76?=
 =?us-ascii?Q?nCwdM2+5rGlRaHMZ8KKt8lBKFmyA+Seol46sRmGjA5HXxm3nQeEbzSPx6uFK?=
 =?us-ascii?Q?VYlgIrbiZnyfScKrR8b8cFAPGZ76QePyny36ZSSY9lKpDn37VO4nRwQeMjYK?=
 =?us-ascii?Q?xFVGlOkZtAOCP3oGI8bNBf34x/rgmLn2j/tHcnAf4LyD8JjoTbtc0amlqcuB?=
 =?us-ascii?Q?5ZvvpSRSYicyQnrFAjcoPsgCluIM3Jqy/tkf2MuPqPycWsO/g8y+cmQ43ElU?=
 =?us-ascii?Q?8ll7px34nukkm5VEJQp1EBAkAje45Xzhji9zLvmCoi4bN2Lnh7a5l56GRhTq?=
 =?us-ascii?Q?RKLO8f68AQQP7+xfjZlWEthFfgTHk7cjYelcjzLPZLC3ubn/ODMv8j7XGoRE?=
 =?us-ascii?Q?UYqxOstpU/gRfb/Au9/5i7R/aG3lQvK1z3TSkMEpTBjkTwLLp9+upoEvTAEh?=
 =?us-ascii?Q?jE18L6vUqvHzmKEU9iYjAItcmqFX2804qXcJP5wxwEjp1Hj9jkFjTVl8k8wT?=
 =?us-ascii?Q?iUcQ0DR1+0V62AsUd0eZCzjQzI2xic/fbq0J1bs2jDEUCvb+PXcp86GKCvNd?=
 =?us-ascii?Q?b9m5XZLx11N/MNSfRt/Nu8GpdO8hBoxsndndhGn4ArDzNpEa4FUujpfdb4WB?=
 =?us-ascii?Q?xkoAInuDYLAwSmal/JlQsIINm1hnh1de77gyVpu1Cf7wvDgQup4q7iihuvId?=
 =?us-ascii?Q?GBPL6i6jsXXKJ3kWjAOhTAXoS+Ul5U/Nlff3G9NUZLxfa24bt07blHQeUwX0?=
 =?us-ascii?Q?5odSQlocfxY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pghTP7DT1u8cp8p1wL+kpf2UITCEXNhiexcarFYBdH3mpbfiNVrSMSQV37/d?=
 =?us-ascii?Q?vj/cnQqqI2yZIll6rRe3MPouc8wCt5JKRSQa2vUIyeqJbB5ZFjJJOdQBIHlT?=
 =?us-ascii?Q?LJKjqOmOXlxD48HNF9O/fg/btM+2brEhjBNwtdzOyFgiLBkIsPVs1gOM3NRf?=
 =?us-ascii?Q?TInSlewZUcaRxzu5eOjHyAYfc9gBa8XaQXEOKkGy26aGAYppOpkz1BzQUCuv?=
 =?us-ascii?Q?PIsDWknW5+sAaqzJ+x+5lxYCQJ7RAF4gNpvPRKLSRZVmBNmzyRCKyae8Mkiy?=
 =?us-ascii?Q?FgdToboUODXKUeuF2wKAmaNzHCbBqF55sMnH4eAGjmJayQiUwcYGrs1uONRc?=
 =?us-ascii?Q?5xOnoU/f31667AmOgJDInXIx0uwjt05qMOd7cintMhKVXKCWkbXY4Z3MsaMF?=
 =?us-ascii?Q?EjA6P3nKxnZhrE9v7XbwZsM3ECII1lvkXKhB9rghI/cxPGFBGaNHUsHmLjKr?=
 =?us-ascii?Q?Gx05fHe45x+2vWfRQsfrNMn+Da8L51BJIFdqAt0FzPjYCZ7gQKUYNcf5jEBV?=
 =?us-ascii?Q?GhzpJ9R6K1TMDkn6xCH4rgLIT2rwbsSn72e5XNzXRuaTI6K+jdP3HsE5tLkc?=
 =?us-ascii?Q?isGYnxZNk7UOjU5dtEvXN9DAWKBZ7Val9AYe9dZdfcBOle3lkt2RO/c1nzq7?=
 =?us-ascii?Q?zNaQSzeU2waPPfSWLlmPKi1HKsq2T+4o2ycAGvsPFKTY05PuCB25wbAIYSR2?=
 =?us-ascii?Q?Yk5ooLRjpqXlb6PDjwuLNFh/IVonmsPGaKjVuxk4PPZMgoEJi5IBP/2ScWVp?=
 =?us-ascii?Q?Izxh3h5UikCeuou0olAmVMnyenHnHimmixnSMxKjr/uUH4OAWxglflH1ZKgy?=
 =?us-ascii?Q?c62NJUlY9MoclUrwpsVbFBFCypW6ahKURBLj3R91khVk31OaeQpiP7tbWma4?=
 =?us-ascii?Q?aB0guwGXTyAAEfvCuoEH/LdRah1jUnE5oCGCHvVDUgnj4rSuidoXn4tzPgCG?=
 =?us-ascii?Q?3DzgReIKMp6omuPd2BGe01Cf+kS8Ys6oyHfjyPWO+pjGxOkTBF3Qk/fJ3p6E?=
 =?us-ascii?Q?AMIOA2WlPe+HK73z7o8yrts1wSRI4gTtdXTrAR1QyyxmecBJH4OXT0Wuy2QS?=
 =?us-ascii?Q?5HbtMk7piHiZAcRFliGnRFy5/y3Svx5uWoyWv79/iWFFKrdKzwYnhAMhp2Gq?=
 =?us-ascii?Q?ACl0YWZsmtqIeAykVwScTHKd/5ehMC8l7ZvinmiiIVeECu9aFNAcEAUEfAD0?=
 =?us-ascii?Q?fqk1sODK48lr1vvGk1/TfBFs32OSmBhmVJzAUeKi+RtQX290wvo8wOrVKfvf?=
 =?us-ascii?Q?lPi0uT2z7tvnf+jpsnCXrNr488u/h4sfP1Z8HRU/n3V7CbmyXuXVWS/VECk9?=
 =?us-ascii?Q?jVZ1HoJUP39TAAjpvNafV5bl/def988XmkmXCqvptAy3KUQ39L8NvwDw8KiR?=
 =?us-ascii?Q?IL1pbb/3DLBZv8i7k2xHUYnZQE6HB5WtWMzwVqXuVHLcfCVvOfqqtuMMWZzs?=
 =?us-ascii?Q?5uOhNu1qYf0WFMFS6SVt11/DMY6Fa1vzGt2OmLE/1+AJa0rl5gWpf6BKuP/8?=
 =?us-ascii?Q?L0DUVPicF5VUvNVV8YuxWmlalV7Ces7oQmzPFGNWcwJe6z9t7aievLkvCLj6?=
 =?us-ascii?Q?iHmxfEr+rHaBvTt2nq3Efwiycffh0lVwJYcXlFfb+3afjd5f0VQuN2f+62KK?=
 =?us-ascii?Q?8Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f5c9b110-f9a5-4ff8-41c3-08dde588bced
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 16:42:40.6881 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oa4J41RxwdUV2Il6PBfhre1SbS3oAhVWxtcJdPCiErCd8biFsu1mjPXsFuQ0EDF/prvt0K7e2FSkg656naY7S4JcX+5l9pO6xuemLiBG3ls=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7467
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

On Tue, Aug 19, 2025 at 11:53:48AM -0700, Matthew Brost wrote:
>It helpful to clear GT stats, run a test cases which is being profiled,
>and look at the results of the stats from the individual test case. Add
>clear_stats GT debugfs entry whih allows the clearing of GT stats.
>
>v4:
> - Make clear_stats write only permissions (Himal)
>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>---
> drivers/gpu/drm/xe/xe_gt_debugfs.c | 22 ++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_gt_stats.c   | 14 ++++++++++++++
> drivers/gpu/drm/xe/xe_gt_stats.h   |  1 +
> 3 files changed, 37 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>index bf3a67b5951c..2cd14b36c75a 100644
>--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>@@ -363,6 +363,27 @@ static ssize_t write_to_gt_call(const char __user *userbuf, size_t count, loff_t
> 	return count;
> }
>
>+static void clear_stats(struct xe_gt *gt)

why do we need a clear stats rather than making stats writable so we
can do:

	echo > /sys/kernel/debug/dri/0/gt0/stats

	or 

	echo clear > /sys/kernel/debug/dri/0/gt0/stats

	or 

	echo 0 > /sys/kernel/debug/dri/0/gt0/stats

unfortunately with debugfs we can't just truncate the file like we can
with tracefs since we won't end up receiving a call to the store()
method.

Lucas De Marchi

>+{
>+	xe_gt_stats_clear(gt);
>+}
>+
>+static ssize_t clear_stats_write(struct file *file,
>+				 const char __user *userbuf,
>+				 size_t count, loff_t *ppos)
>+{
>+	struct seq_file *s = file->private_data;
>+	struct xe_gt *gt = s->private;
>+
>+	return write_to_gt_call(userbuf, count, ppos, clear_stats, gt);
>+}
>+
>+static int clear_stats_show(struct seq_file *s, void *unused)
>+{
>+	return 0;
>+}
>+DEFINE_SHOW_STORE_ATTRIBUTE(clear_stats);
>+
> static void force_reset(struct xe_gt *gt)
> {
> 	struct xe_device *xe = gt_to_xe(gt);
>@@ -448,6 +469,7 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
> 	root->d_inode->i_private = gt;
>
> 	/* VF safe */
>+	debugfs_create_file("clear_stats", 0200, root, gt, &clear_stats_fops);
> 	debugfs_create_file("force_reset", 0600, root, gt, &force_reset_fops);
> 	debugfs_create_file("force_reset_sync", 0600, root, gt, &force_reset_sync_fops);
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
>index 30f942671c2b..7e12fc3759e2 100644
>--- a/drivers/gpu/drm/xe/xe_gt_stats.c
>+++ b/drivers/gpu/drm/xe/xe_gt_stats.c
>@@ -50,3 +50,17 @@ int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p)
>
> 	return 0;
> }
>+
>+/**
>+ * xe_gt_stats_clear - Clear the GT stats
>+ * @gt: GT structure
>+ *
>+ * This clear (zeros) all the available GT stats.
>+ */
>+void xe_gt_stats_clear(struct xe_gt *gt)
>+{
>+	enum xe_gt_stats_id id;
>+
>+	for (id = 0; id < __XE_GT_STATS_NUM_IDS; ++id)
>+		atomic64_set(&gt->stats.counters[id], 0);
>+}
>diff --git a/drivers/gpu/drm/xe/xe_gt_stats.h b/drivers/gpu/drm/xe/xe_gt_stats.h
>index 38325ef53617..e8aea32bc971 100644
>--- a/drivers/gpu/drm/xe/xe_gt_stats.h
>+++ b/drivers/gpu/drm/xe/xe_gt_stats.h
>@@ -13,6 +13,7 @@ struct drm_printer;
>
> #ifdef CONFIG_DEBUG_FS
> int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p);
>+void xe_gt_stats_clear(struct xe_gt *gt);
> void xe_gt_stats_incr(struct xe_gt *gt, const enum xe_gt_stats_id id, int incr);
> #else
> static inline void
>-- 
>2.34.1
>

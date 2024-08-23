Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC281C531DC
	for <intel-xe@archiver.kernel.org>; Fri, 23 Aug 2024 13:43:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A74BD10E893;
	Fri, 23 Aug 2024 13:43:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C4akMmFA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A021810E893
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Aug 2024 13:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724420603; x=1755956603;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=40q7ENhOdxNjIPSgrcphJk+JdydZ897aIVzFEBRK2Jo=;
 b=C4akMmFAhwudvrrECRzmCRq43LaxE0NZF11zid1bVo1F3r692gTuq25b
 JMllx0gF3IqqCGFZhfk5bpg7jYe1WekHOWn+t40dK5MyjgseojdwJ6BAp
 /PTbMoo4QN0NuYhWs+wrv/zKF6d8E6ndVUYINdEWr1HyQ8qqmyUg5PGsL
 WwWD7nQLHVAp9yeU0nYqMFm8Guh9qbYzGg3pz+Y5vJLkrDihNH7ujSyQ5
 b6OytfDoSmbv48F1DtHsAGuSK/BZklH+a3F1+wY23OU5w/o2q1RFn6K7J
 ItbGvcxiTTYnI4eUj1Oq24kwreYlELDjvVFyTW98JL9vLGFtolOGsZNWJ A==;
X-CSE-ConnectionGUID: zfg8427UTFeD5QOl5ZBgIA==
X-CSE-MsgGUID: uNfq0DQEQAmM4bIZl2Iv6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="23041807"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="23041807"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 06:43:22 -0700
X-CSE-ConnectionGUID: lpFxpaZ9SG6gyeQZWYuCwQ==
X-CSE-MsgGUID: +m9zXybTT5CsssqByp9ENQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="99319596"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Aug 2024 06:43:22 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 23 Aug 2024 06:43:22 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 23 Aug 2024 06:43:21 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 23 Aug 2024 06:43:21 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 23 Aug 2024 06:43:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BHFVpkUjYidXY3dcn6HODw4BYeKATXQst2nKfs0d5x7z+6tbibo6vNLs1kbsIoyJxJXNkUii7dJsmVoJ4WPsKP3cp6WX9d8ZXHPM/mx17oeapJezJgyzY63jGqKLb3vW1edELX3bCmoZC2xgTV/46Roi3tqGMbyIXMF/sG2xEGjdBsLOXVliPr8zWLfj8nnLbPne4lRZfH2bmVEHYHU1an9TZ7xoSbxVG/CmAdub/X7/EioNAE9rEOH/2RDaM7ir82dhuxeAwf7ZMLRaSJFHeWSozp6pZSbGHsbFVctt9Ad2jtjxFQb/O3gRCeT9Cwo7M+UF0Nz3SGTphFQO+kmlow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G4mBNKylRT5fquzGIN/MhaP7nvjdHXXYX5g5OFMqfLA=;
 b=xO4ERjwKgRQ3L9NkyjRhOWAomINbJEsjmEndEOxmTiVcqocOsl36HfA+AkoOT+Uz/dmeWY5M6Rt8of/Ea7ufk9liVn72Hk83IqwQfFg+hQKggpFADRpTSsOzNdj8P7bRZEm5GLgdPcOro40kJ2cOVXrKktur1fWclZBT9X0t4A77rsp5X0nSUFjDDvyNkCr9JeSrY+xOVm7g3F2p4zY5XLBNlnxUWKJz3ULCeW657SsdZQ1GynmOmOg4dkRkuxOcwnTgRPsTCCtZbOLsj+2hec0u0tD4X8HXhdNRXplj6qmICS+77HVzrvxGo4aEBjhqs1MFktPD/mzFMgmwLF3daA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB6567.namprd11.prod.outlook.com (2603:10b6:806:252::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Fri, 23 Aug
 2024 13:43:18 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 13:43:18 +0000
Date: Fri, 23 Aug 2024 08:43:14 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/6] drm/xe: Move ggtt_fini to devm managed
Message-ID: <pjwv5znl2qo4rzzwj6r6itfj4mneqb5emkdcrfaxbdggwo4trm@r3obpag5fn46>
References: <20240820172958.1095143-1-matthew.brost@intel.com>
 <20240820172958.1095143-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240820172958.1095143-2-matthew.brost@intel.com>
X-ClientProxiedBy: MW4PR04CA0051.namprd04.prod.outlook.com
 (2603:10b6:303:6a::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB6567:EE_
X-MS-Office365-Filtering-Correlation-Id: 3561c144-efbb-4505-f026-08dcc3798bc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MblPSw6i6le5i2zUzH8xnTplCJPsBZp/o9KgY6Zth4m4yz9+G6aBxb+J/+OG?=
 =?us-ascii?Q?rmDHrxPaP7JzR+yLdtZWNb/Pxf69oEzi281nb2e5jRc1BeqJMQle0xiGoPMO?=
 =?us-ascii?Q?cpG5++zzVxs1CQKBRTbKQWzDA5I/6k1HC2YaFLkwSXUORPD6rVoG1EcWIj+K?=
 =?us-ascii?Q?AgJQOv87uF7HW9GnDQ9mgrdqw4jSzUzS4KgbyX7kYPiFnfwfp4P+x3yQGFx6?=
 =?us-ascii?Q?+5AElzopKKNFGul8i+QB4pxxzhLbNBLhg+A8t0lp9n/FSqUPA3loY4tocL61?=
 =?us-ascii?Q?8ZBnEtJ0R4E3yQMNhx5SMsoBRleqAe/EjsocGEdscvsYVfr1OEjVMw8pjypc?=
 =?us-ascii?Q?4MJA/YajIfjBLCRWJIDRADLviC48B3N6tvfqETddZTvHrv1Olk6ndcvZe6rm?=
 =?us-ascii?Q?VnKoEmrdmhSIRWXTGHG7yfbowQuX/STcWzYElEZgHLs7syzocK+RfkytCNpc?=
 =?us-ascii?Q?xPT4/lqIwc96gV8S7f+dUNyaLcrW3lN0hyKOtNF3rU9HnVCMjfFADjELdJoO?=
 =?us-ascii?Q?nLToKW5AhXK2Gf24iHlAkXikLzTyMNwlHJtsG9K1IsipU4orMpNKZgGrhhu8?=
 =?us-ascii?Q?yD7xEahmnXvCn0EpWdl4qV8jCqhqPk5VhRjteyr+qGT2CB/zl7WTYGhsHi/t?=
 =?us-ascii?Q?Db4BVykwXkGlOdgUrqUXGnfsMP+yVVV+Jd5BtMGrSBVnT+zm0Cirjc/D9el3?=
 =?us-ascii?Q?zlM0JPT//rFzRIdMOEaHY1rvUW7p1/873pZoUZ/ImyABzHV71JRrzcnaOzcR?=
 =?us-ascii?Q?OpUMrW+GR4HGNBkNHPf/mwppI+Ux6+hbXcCTwLa5sUGj212E++fiPCnMCHrR?=
 =?us-ascii?Q?Ki84kePZQV4B6jd1tZFC2oZ9wyYsvvbLtjw6rN1I7UwEgiAUXVHNc0vyvXiY?=
 =?us-ascii?Q?VWAB5bADQWYIDTcI1xv8WVWWRsmMGkAWuFM3Wv0iU8Zt6+fU7mcD/kXJDXeR?=
 =?us-ascii?Q?iaQoIj7HGoTkzhvinyOnWLKkoAiTG6Q33gYOyf5wJW+3CuZI0/YYIaugAjaF?=
 =?us-ascii?Q?skfz1Y3SxXEUF+uBxqgXjNcsTl1wzXAipYCHwl4VYu+IgZCWUxc+uyIxaam+?=
 =?us-ascii?Q?Qx5Jw2tDb3in+fZLjN5J0zfa8udzwWxkRT+1uDO1j6zxKQQ1Wm2lwl3xLrgt?=
 =?us-ascii?Q?MsmP6Q3BPmnHIz7XeyDkNTeJMBVi8NwWlJXNANChbfYEoiAqIQN/BI4I5Enh?=
 =?us-ascii?Q?RoTXllT8+XClv3WF2vF4Apu5YulX4n+gAxzPh1LIh/ZbmN4Qy6iIgjRUsgF6?=
 =?us-ascii?Q?JNqIIl/Lm977xL7dGjgRwd/buZ7BgACjPM8VGM6OD2ImxQ1wfhT58l3xmmL0?=
 =?us-ascii?Q?CNsngOftNqvvtv462QCE3EENJwyGcOIDsUhtjsQ5i8kPGg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wHjrvIjGIPLJtytqJqrwJhZzeDc35P62A3nPYdvAi75fEHr+AuKcO2HiDaN5?=
 =?us-ascii?Q?V5vShhOEZoD1MfIah5J5WdL5+tIgKsIHlBvMxSXi0Yuh2a3X6Zxh8PWwYt/y?=
 =?us-ascii?Q?/IOnhqVxrvWXkUaEuitHk2IA/W4PRktAxmdqvssscsECGvXSo2Nb3nnT2AdU?=
 =?us-ascii?Q?JCqScmcBVHAxz9JPYU0ToHGuQ1d8EzCFncRdUqLxfSfLEsuEwXfQzjhNfxk0?=
 =?us-ascii?Q?l3+YCXxve7IGpQiq4OfS5GMaZE+ALdDzNlYtAi5FTxrQwTaUgltAT/veiUDu?=
 =?us-ascii?Q?o55Yh5mVzJ3aebQpNB3ALlu4LSB/ReElzzn2h6pKqbR8TepF6pkC+gZmDO16?=
 =?us-ascii?Q?Y3XQsJ29wegMpShWJJQoPVO5+4hHFQl5dW8aOyiIaJqKWZ838MZTrWbmWa40?=
 =?us-ascii?Q?9wXrNOiOSFXtqMUpmz9ziws8MNRWZjjVkXU/Ej+rcCBSoN/arGq/2QiG4J/V?=
 =?us-ascii?Q?mdBTGwT7M/gemxUmIAr8tFUlqjYq4GQS/r1/9ZCYY7ZWNOKt3VHZMc/kub3X?=
 =?us-ascii?Q?kkgmhSVrMQaMa+oowHbBAthbO0XHgMtRj5BEnAQXMaupGOY5xoTb5HSZuCAW?=
 =?us-ascii?Q?g490hcsdu7UaiGgnsWKqnTRG3+yPNvrYfHsWxXoagPzPcaMD+FSS4+tJj+FI?=
 =?us-ascii?Q?gN1AUjvtx0eT3q2T08vjB3gzffWz+F2y01dCDFo8+HnwR5lDNN7XkzNfqbpp?=
 =?us-ascii?Q?ayye0KfB07AkAN7ZrZInaHULTvmFec4JzDGIaB6wfca/Ocqr4U2NgoKYcicE?=
 =?us-ascii?Q?QxJ9c8ZLNW4OJkKF8zFTSuCEQXmJ09JiR3L4VtulP5/eYqxSX6gZegUXKjqB?=
 =?us-ascii?Q?PvHi2XnZ8gue9EJJaJbOAI7wkabNDJnBHoEdGUQQc7TEhwmmVtQ+UHy5s2US?=
 =?us-ascii?Q?Jb68BqyoxknNubsiY+EdDQSv6IcY9iJY6rOjNqb9L8b8Jzz8ooJVhnb3frAh?=
 =?us-ascii?Q?dQj590bRXrm+gdlH8Z8Jbrl7Tn8t8olLQi1At/UrPJ1cbDeDktj7W3LvWdPe?=
 =?us-ascii?Q?vdjfYleDSx9pLCT+gMN+/gE9rpx/HqW3UZiKNeA9ptAnydgdTFnTa+KOBJ63?=
 =?us-ascii?Q?eVFZuzVS02v5wESel3p8/yPeynMbSSOgUSdqfxHXEX8XsN13oK2ZgcHsXBXx?=
 =?us-ascii?Q?q0AgysU8Jhdvy0O/LaqQSH/omueyQ4CnEbqLR9r9y0zdB1MSDddUJzVudGSu?=
 =?us-ascii?Q?ZIL7u0lxPJdCgVMxI4oCU62fJlGN6c9SDpnx669nXonioKrzDcJnM1I0ONTV?=
 =?us-ascii?Q?rM9PiHD63tk8VjjiCHeQ7sxrrHdNdYjcmxxK0uAkcmU3bmWwzNWW1DpMUKvQ?=
 =?us-ascii?Q?T+U6/vfLfIA8wel4PaKr2KjPA2cGzFcPZ5MNzZ80CBu16RAqRR/pIFtvvTAy?=
 =?us-ascii?Q?C0ng8jwG5Cn6UL2PZnkROHsaa2+0zCoo+Pd4oemgZtb8WYoVpKYRql4jWDCP?=
 =?us-ascii?Q?1qEIURYZGjXemGHGaahwseWThtJtIHWfhJOG+pRGHgXRW6l6iMwdVNdef5+Z?=
 =?us-ascii?Q?92Pad4DjrU0DAr/FpeED/Y56wfjLV2DiyRIFdrGk4KP8pL3NQjUIIGPHJnv2?=
 =?us-ascii?Q?e9RNDQg4IKjMrSbWZd/S5DJ+OQpBxEMNe1jwv6NPflt28WY/4Th8HUYt8ZeP?=
 =?us-ascii?Q?PQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3561c144-efbb-4505-f026-08dcc3798bc0
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 13:43:18.4481 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 25Y4WiniiR5X0AgPMuGtRtt+BgJobVBguJM9uRaUXd8cSwjKrgUuiV+vOdu/J7Rc36ATZUS8ErOey3AlP7Y+LAaRnP7W/nXVxz6c83u/Q90=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6567
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

On Tue, Aug 20, 2024 at 10:29:53AM GMT, Matthew Brost wrote:
>ggtt->scratch is destroyed via devm, ggtt_fini sets ggtt->scratch to
>NULL, ggtt->scratch in GGTT clears, so ensure ggtt->scratch is set NULL
>before the BO is destroyed.
>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_ggtt.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>index 0cdbc1296e88..21cc9ffcef1c 100644
>--- a/drivers/gpu/drm/xe/xe_ggtt.c
>+++ b/drivers/gpu/drm/xe/xe_ggtt.c
>@@ -132,7 +132,7 @@ static void ggtt_fini_early(struct drm_device *drm, void *arg)
> 	drm_mm_takedown(&ggtt->mm);
> }
>
>-static void ggtt_fini(struct drm_device *drm, void *arg)
>+static void ggtt_fini(void *arg)
> {
> 	struct xe_ggtt *ggtt = arg;
>
>@@ -289,7 +289,7 @@ int xe_ggtt_init(struct xe_ggtt *ggtt)
>
> 	xe_ggtt_initial_clear(ggtt);
>
>-	return drmm_add_action_or_reset(&xe->drm, ggtt_fini, ggtt);
>+	return devm_add_action_or_reset(xe->drm.dev, ggtt_fini, ggtt);
> err:
> 	ggtt->scratch = NULL;
> 	return err;
>-- 
>2.34.1
>

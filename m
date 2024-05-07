Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9614C10F1A
	for <intel-xe@archiver.kernel.org>; Tue,  7 May 2024 13:24:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97BD010FB33;
	Tue,  7 May 2024 13:24:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iHA/VPRu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E298610FB33
 for <intel-xe@lists.freedesktop.org>; Tue,  7 May 2024 13:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715088271; x=1746624271;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UH4UH8U6BEaScbltISNeL/rSpaXE8pgBqgTohwtrIeI=;
 b=iHA/VPRuYYtreNLlH5N9eWgDndwQ2toSF3Y1OqZK8XMxwtrDIX/uI7bn
 i6xd2yOBQGEtHln/O/gTRGBNnf6oogshNIXiLCvoVAcixLYolsOsQup5m
 5Wg82oQnkal59MHXKAsA4liD7+eXRc7FhAW4R7rlu7sbKj5U7nlZMInnL
 BCl5LjNH2Wm88s3YnxSOmuslPP/eHKpxesoG8z9AY58NnCzdsdsA49xH7
 dD5ceamHgtbtibcg9ZddR42HmPHWgSS8vmQwyrcT2dTdscKbrZxZm/jCz
 bC752a0z6PgzFpxvMhlCFFFyzEGlO5dtgvmykYGkeOjNMDjblfBjDsHaS g==;
X-CSE-ConnectionGUID: rlr6zpbqTBeeZwxpkT3jUw==
X-CSE-MsgGUID: fet08rZbRMugoVnA6jCwjQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="21550835"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="21550835"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 06:24:30 -0700
X-CSE-ConnectionGUID: +tovn7MBSiKSaE2xfUOZhg==
X-CSE-MsgGUID: WhAOZevORZ6N/Bw/cYjtUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="59375060"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 May 2024 06:24:30 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 7 May 2024 06:24:29 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 7 May 2024 06:24:29 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 7 May 2024 06:24:29 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 7 May 2024 06:24:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pdx0QYC71Cp67mMnP4khFhySCQcPOcmcIxMSDLTu5S2xuqCpIjVp6H1Xa1j5Wyf8bzDFKRIwBdeF2EUwttLeiC0wkzOkex07L524G79bfbUseMZVfSqJw9ECPagGGLGtQIxgA01cTkeGkF+zB8MtoHzpIyUPZUZk/d60yZt5pJmnJwldsim3i9gd/p2LhTCJn73MZ+a/qtzTCEaFMf041Al608WfOcZPOlXJv/SkMMIU4Jti4a4vShpZN1xl4RRSzMGYkWL5oxUCyGiOQOhpAhylm9pvaT4p2cAVAohJ0jo/APy5d25hD9GziAhk5CgqMn3NuUbYm1C9Q/FiiZ4gWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1JHBOOKHAIEac6UHX9d9PzvAyYUZnZserX87BC8RerE=;
 b=g7cD5xH0j6JTX+U1KeFyAn58Q4VcgfAvltqwUDp7xoNqSEFtUubs9WeS+Dr9xf3DF9SnXCgrDqMQBEmCpEDWRedMfKvhgS63foMpRAcgxNfuJ2YfJenOghxSwdcaIwy+41K9JER+mB7O3furYqax2iLaXelwwKzZJDCP+HLNmn7hgES82mhukOxskAiC4dAcVGw24FWwslkKt7WAvTsUeN7qAKkBT6ixYJc+k8vaEM3gs9kDKlpEGab2aOiE5a7EWNsm52TztmR30d0gTUD7XRHIM+bSg3rJHtTyC9zVRMfKG5Gel7N5oDYFhYQ9Hit5lqKn7/O140qUVbSot118Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ1PR11MB6132.namprd11.prod.outlook.com (2603:10b6:a03:45d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Tue, 7 May
 2024 13:24:16 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.7544.041; Tue, 7 May 2024
 13:24:16 +0000
Date: Tue, 7 May 2024 08:24:13 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Rename few xe_args.h macros
Message-ID: <c5meihr4bizvba6yxyuiygwzvwzb7njqbhpblvqbl2vakoygrs@tnmfpt4i4v3j>
References: <20240506215618.2703-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240506215618.2703-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR03CA0259.namprd03.prod.outlook.com
 (2603:10b6:303:b4::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ1PR11MB6132:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b0c8dc5-8762-4330-f785-08dc6e98fe7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?alHnF5+BaoiW5tnRmX7g7iEAkkdVy7gvB3S244E79weSEUurgExc3+szIiN9?=
 =?us-ascii?Q?q6POXQqJQxISX9Cn58DWzM95Zq1PJ6td+3+xOTizKGw5ZCpH0V5B21mtrHZK?=
 =?us-ascii?Q?bmbb9NVNmfNXVQEWn/l9iOaW8knPykeLg9hU4TAyb0pxkdqGyTt8uifpjm37?=
 =?us-ascii?Q?baqkUEc9/PmVIZM+6chHHV0fhj5jg9dYHJ1+If8TeB82csXMazBjFrX3+kL9?=
 =?us-ascii?Q?Kqw8q19aq30ZOFZ7uMXnWiGuljXwFTNmoVghtNwDicgJpOfvEB34MSBb4ipp?=
 =?us-ascii?Q?2UK+NtNKSq9bLhfq2lypick8lNiuC4B/FJOQRPJMJ2cyl+ta/OeozFVZdx8T?=
 =?us-ascii?Q?CKUf/5MtLTlAgFeR7A14+qbQC5X3PxE7pPlQ5a89BaoiRfsiJs8cP3pb/8h6?=
 =?us-ascii?Q?FqYOA2QR3Rc8iH3o8afI05oN+Y/ZRrC/r2ZhVdflh4xZoTcgAUjNr4lU869s?=
 =?us-ascii?Q?5wiIYUQIh7oyLRKfYZYRT1ezOaA3CrahjtNTjEwVWlfWT5rbiDc6tgtkUhxI?=
 =?us-ascii?Q?AU1DzZ79Ol7fmEWEY6iYf2qJKR+KnMitxrC4DS6o2QZB1kLgcelK+mDYDqDh?=
 =?us-ascii?Q?1I5Ne37eWXuuZTf8h+JPvKAunOjBhc65WwXpdcLMd7yLsc7eMZpqPp5yKl3D?=
 =?us-ascii?Q?H+yrddtDkHp9N9F9KUxcVrASw1a0St8nxNfxJLiZv/sr59NULs+cvml8JL/3?=
 =?us-ascii?Q?F/TNb04Byst1zitvYc39YHgvfLPO+ljJ/myr1zL0QrloHCjntLovGh3mHEKR?=
 =?us-ascii?Q?NW//RHhD22ZrWMclTVTTlvpIg9NKMLHBOcjRjPIBkWjYEASuvsw1rBZJizeF?=
 =?us-ascii?Q?20oNnybxbovRVlxgRogCBdrv5yH4vObNE5p4rVgK9AeGC158mazFSXYxY1mj?=
 =?us-ascii?Q?p9Et8+2jHAznSBYJTe2+4fjdkScnCYvS+7RI38Sh4zXijfH9h3+1uaL8nNjA?=
 =?us-ascii?Q?o+GLn3EDH0QxKc1lMEbUvmf73D/zPgij3sX1vfGXml6b9QjGs4cAC/z4eqR2?=
 =?us-ascii?Q?srDAvfV67VfA2fzXxJJ0nQakBbFosUAj4HZYp3NA4Q1uix8EmCHMoRpQRfz4?=
 =?us-ascii?Q?1QLqcs28Fwpg14MLnv9tCjaNPmmjKU5V/lxzh8g9Uz82qWFYwwej4Hve2vDS?=
 =?us-ascii?Q?Mv7QLNj6SutY8a9nY5LaUzo1VOSgfIzH/dpyl9yShDX8h7kcRpjt3zJQNxUS?=
 =?us-ascii?Q?6kbsUqP5I3/SnBuvRFvFIhJcyiLJMBqefYS4bxn89Iamu7M0Osfsrifn/Sux?=
 =?us-ascii?Q?WWCt7NAmElQ7qIh9rd4KsxDy/4pFU4RJ1YDOEtYDLA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mse+hMWJAma6RdYsAi1405sPZN8lx+dZ5zLZpYT0IxR9b7u3ujiXJfRdIx2X?=
 =?us-ascii?Q?/vvfiQZp0UFI48LTG2/QxG1UA6tKV5gnmqS5SkTjvghph30jg5qiuqpdHeUf?=
 =?us-ascii?Q?/X2F6FiD28wXNpRBrIBTO3sZmYmB061Pjdg4fDlRcTeciZ1q65YCvzO3Ls/q?=
 =?us-ascii?Q?H+3ruAe7OC0kDBkqCzeIBy6papKH3sDeyzy5KasBBW4uCjyjcql81byCOInV?=
 =?us-ascii?Q?9s/oOZV5u8elgBoamTfSHqOmiroJ+XJIg5Bpgvl8eS8BnLXKLsNy6rZhQhLo?=
 =?us-ascii?Q?/IhOL0YDGEZAEhaaxhJBizr5I/wHBjkjYszYfd3WzjTCd8/jMj3tgGf2MMEm?=
 =?us-ascii?Q?A0ebBm2K0KQXuCYheUGrBznKcWd0mr6NC9CuhIVfRAXtFb9XSc9QJsznMvHe?=
 =?us-ascii?Q?5b+2NiFNNYAB6NoOwfeoAYTJwwbLHV5Qs9GBE0YXCYsOcazXIsU5SM17hg/N?=
 =?us-ascii?Q?Z6f7KrSwOEBLEbaP3e0II42kMVrdgz+39vPeL7MyYFL9aR6rMBsSMYWxP/lI?=
 =?us-ascii?Q?G+R2+pDKVRA9KrhurN391KdJ0I4NZ1XPCBqGbTiO2nepVDdYbo5IpG9ns8pP?=
 =?us-ascii?Q?SYjYJHBlMNoEE3eU9ar1PmV/JcJrPmLNCIBijkpVDxYn/+7wGCIbnykluqB+?=
 =?us-ascii?Q?4o3kVey8Q44Se9HHh+6WuEI6kMDtugPQr3KnBmNNVKx3amwsib4EqfMtaCeM?=
 =?us-ascii?Q?jI6DKixgwIqq7wzSWTj9lryNUifzgWfki7ELpzwskCW26t1P3XR6wZ/O4DzV?=
 =?us-ascii?Q?ThMH/2RW6Jknm2Tq2hDj08B0bOOtanYAgkLQMOV5ItdFCC+Ns5R0kophIOuU?=
 =?us-ascii?Q?01P2HaL/zsPsngRoD7aeHV5IXR7ZkQKBSULFUguvt9slu4c/j2xG8N2BQvFD?=
 =?us-ascii?Q?16xzjcxD3WQgjyxaDbWElBqiPa0qZqAi3emHxXHnSmL0uVL3r7DXBBJp6BCt?=
 =?us-ascii?Q?huCjrNoRTtT/NoyMuQ2sbRJzb+PQFH/JqMLzO2oqcL23tN1fUhNLPly5f97S?=
 =?us-ascii?Q?A+TempF6bo6AfOI8hL3Y3h6zevbSUuYP8gC2y66FBhtYZLHjI8f0Vh8UA9HF?=
 =?us-ascii?Q?BC/kIl1B8y6m4MF6Zd2kAZc6yHNqwI9Gt2qVAiFxYkBpVo8xoQR1VX8Vubtm?=
 =?us-ascii?Q?IdyqgkKl6L2+wM6oqcm84Zc4SssOiRtjoiSq9vQHbtrN17Z/jcIiD8tRcfvA?=
 =?us-ascii?Q?+aPqphI7XCKZ3KS4vq/m/tcZnSqARz1IrlgP/3TTfgDE4d4MBk7YBknASOGq?=
 =?us-ascii?Q?qKGRYJ6m/yqBVeVIQUFMYgxpmqVn2ZlEZY1SvzCZB5HEWeM1bpfWIiBE+go9?=
 =?us-ascii?Q?7jeZFO3Mg84dDLwNKZmY0ZH+G+7efjcE5r9ncxpy6vcNrNCKF91ouYA0DsR5?=
 =?us-ascii?Q?OzkSAnSm6gkE+7EOrMzuA/M1oVMvuslvo4CoF4Yu4qotd2L/yohJMlik+9gW?=
 =?us-ascii?Q?kIhvvSD83jGaI+N3BHE2B08TqZogzl/7OIp86hAWjyhFZXXztjHww0e9ffQ4?=
 =?us-ascii?Q?Xu71JI3WNdSIWqUeV93ORF9kSMiApHSW0FLeFxhsSTnKYfYqBbSuwt0C0JUT?=
 =?us-ascii?Q?3/BfMn72tjJSM1Ydhyc90KUfZb4vdcIqJ8rqS3TVKCIbSw32wPbX6Fs4JkzY?=
 =?us-ascii?Q?Sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b0c8dc5-8762-4330-f785-08dc6e98fe7d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 13:24:16.5446 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B6WrQ9APQS9jhBwHS7T3zv3cT5Ot1HuirhhWJDqHyp4/k2MS1Hrz28JEAQ5Sz9pjdX565Ovguuqhh+TUKmHrlmYX97rACx3Eq3xITC0By8c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6132
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

On Mon, May 06, 2024 at 11:56:18PM GMT, Michal Wajdeczko wrote:
>To minimize the risk of future name collisions, rename macros to
>always include the ARG or ARGS tag:
>
>  DROP_FIRST to ARGS_TAIL

this one is odd. When I read DROP_FIRST(1, 2, 3), it's immediately clear
what it means. It's not with ARGS_TAIL(1, 2, 3) as I have to read the
doc to know if tail == everything but first arg, or if the first args is
the length.

I'd rather prefer DROP_FIRST_ARG if we are trying to add _ARG suffix in
the others. It's longer, but it's also unambiguous.

>  PICK_FIRST to FIRST_ARG
>  PICK_LAST to LAST_ARG

these are clear, so ack

Lucas De Marchi

>
>Suggested-by:: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> drivers/gpu/drm/xe/tests/xe_args_test.c | 70 ++++++++++++-------------
> drivers/gpu/drm/xe/xe_args.h            | 50 +++++++++---------
> drivers/gpu/drm/xe/xe_rtp_helpers.h     | 12 ++---
> 3 files changed, 66 insertions(+), 66 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_args_test.c b/drivers/gpu/drm/xe/tests/xe_args_test.c
>index 9b44c1ab6364..3b25688e4da7 100644
>--- a/drivers/gpu/drm/xe/tests/xe_args_test.c
>+++ b/drivers/gpu/drm/xe/tests/xe_args_test.c
>@@ -21,10 +21,10 @@ static void call_args_example(struct kunit *test)
> #undef buz
> }
>
>-static void drop_first_example(struct kunit *test)
>+static void args_tail_example(struct kunit *test)
> {
> #define foo	X, Y, Z, Q
>-#define bar	CALL_ARGS(COUNT_ARGS, DROP_FIRST(foo))
>+#define bar	CALL_ARGS(COUNT_ARGS, ARGS_TAIL(foo))
>
> 	KUNIT_EXPECT_EQ(test, bar, 3);
>
>@@ -32,12 +32,12 @@ static void drop_first_example(struct kunit *test)
> #undef bar
> }
>
>-static void pick_first_example(struct kunit *test)
>+static void first_arg_example(struct kunit *test)
> {
> 	int X = 1;
>
> #define foo	X, Y, Z, Q
>-#define bar	PICK_FIRST(foo)
>+#define bar	FIRST_ARG(foo)
>
> 	KUNIT_EXPECT_EQ(test, bar, X);
> 	KUNIT_EXPECT_STREQ(test, __stringify(bar), "X");
>@@ -46,12 +46,12 @@ static void pick_first_example(struct kunit *test)
> #undef bar
> }
>
>-static void pick_last_example(struct kunit *test)
>+static void last_arg_example(struct kunit *test)
> {
> 	int Q = 1;
>
> #define foo	X, Y, Z, Q
>-#define bar	PICK_LAST(foo)
>+#define bar	LAST_ARG(foo)
>
> 	KUNIT_EXPECT_EQ(test, bar, Q);
> 	KUNIT_EXPECT_STREQ(test, __stringify(bar), "Q");
>@@ -63,8 +63,8 @@ static void pick_last_example(struct kunit *test)
> static void sep_comma_example(struct kunit *test)
> {
> #define foo(f)	f(X) f(Y) f(Z) f(Q)
>-#define bar	DROP_FIRST(foo(ARGS_SEP_COMMA __stringify))
>-#define buz	CALL_ARGS(COUNT_ARGS, DROP_FIRST(foo(ARGS_SEP_COMMA)))
>+#define bar	ARGS_TAIL(foo(ARGS_SEP_COMMA __stringify))
>+#define buz	CALL_ARGS(COUNT_ARGS, ARGS_TAIL(foo(ARGS_SEP_COMMA)))
>
> 	static const char * const a[] = { bar };
>
>@@ -123,61 +123,61 @@ static void call_args_test(struct kunit *test)
> 	KUNIT_EXPECT_EQ(test, CALL_ARGS(COUNT_ARGS, MAX_ARGS), 12);
> }
>
>-static void drop_first_test(struct kunit *test)
>+static void args_tail_test(struct kunit *test)
> {
> 	int Y = -2, Z = -3, Q = -4;
>-	int a[] = { DROP_FIRST(FOO_ARGS) };
>+	int a[] = { ARGS_TAIL(FOO_ARGS) };
>
>-	KUNIT_EXPECT_EQ(test, DROP_FIRST(0, -1), -1);
>-	KUNIT_EXPECT_EQ(test, DROP_FIRST(DROP_FIRST(0, -1, -2)), -2);
>+	KUNIT_EXPECT_EQ(test, ARGS_TAIL(0, -1), -1);
>+	KUNIT_EXPECT_EQ(test, ARGS_TAIL(ARGS_TAIL(0, -1, -2)), -2);
>
>-	KUNIT_EXPECT_EQ(test, CALL_ARGS(COUNT_ARGS, DROP_FIRST(FOO_ARGS)), 3);
>-	KUNIT_EXPECT_EQ(test, DROP_FIRST(DROP_FIRST(DROP_FIRST(FOO_ARGS))), -4);
>+	KUNIT_EXPECT_EQ(test, CALL_ARGS(COUNT_ARGS, ARGS_TAIL(FOO_ARGS)), 3);
>+	KUNIT_EXPECT_EQ(test, ARGS_TAIL(ARGS_TAIL(ARGS_TAIL(FOO_ARGS))), -4);
> 	KUNIT_EXPECT_EQ(test, a[0], -2);
> 	KUNIT_EXPECT_EQ(test, a[1], -3);
> 	KUNIT_EXPECT_EQ(test, a[2], -4);
>-	KUNIT_EXPECT_STREQ(test, __stringify(DROP_FIRST(DROP_FIRST(DROP_FIRST(FOO_ARGS)))), "Q");
>+	KUNIT_EXPECT_STREQ(test, __stringify(ARGS_TAIL(ARGS_TAIL(ARGS_TAIL(FOO_ARGS)))), "Q");
> }
>
>-static void pick_first_test(struct kunit *test)
>+static void first_arg_test(struct kunit *test)
> {
> 	int X = -1;
>-	int a[] = { PICK_FIRST(FOO_ARGS) };
>+	int a[] = { FIRST_ARG(FOO_ARGS) };
>
>-	KUNIT_EXPECT_EQ(test, PICK_FIRST(-1, -2), -1);
>+	KUNIT_EXPECT_EQ(test, FIRST_ARG(-1, -2), -1);
>
>-	KUNIT_EXPECT_EQ(test, CALL_ARGS(COUNT_ARGS, PICK_FIRST(FOO_ARGS)), 1);
>-	KUNIT_EXPECT_EQ(test, PICK_FIRST(FOO_ARGS), -1);
>+	KUNIT_EXPECT_EQ(test, CALL_ARGS(COUNT_ARGS, FIRST_ARG(FOO_ARGS)), 1);
>+	KUNIT_EXPECT_EQ(test, FIRST_ARG(FOO_ARGS), -1);
> 	KUNIT_EXPECT_EQ(test, a[0], -1);
>-	KUNIT_EXPECT_STREQ(test, __stringify(PICK_FIRST(FOO_ARGS)), "X");
>+	KUNIT_EXPECT_STREQ(test, __stringify(FIRST_ARG(FOO_ARGS)), "X");
> }
>
>-static void pick_last_test(struct kunit *test)
>+static void last_arg_test(struct kunit *test)
> {
> 	int Q = -4;
>-	int a[] = { PICK_LAST(FOO_ARGS) };
>+	int a[] = { LAST_ARG(FOO_ARGS) };
>
>-	KUNIT_EXPECT_EQ(test, PICK_LAST(-1, -2), -2);
>+	KUNIT_EXPECT_EQ(test, LAST_ARG(-1, -2), -2);
>
>-	KUNIT_EXPECT_EQ(test, CALL_ARGS(COUNT_ARGS, PICK_LAST(FOO_ARGS)), 1);
>-	KUNIT_EXPECT_EQ(test, PICK_LAST(FOO_ARGS), -4);
>+	KUNIT_EXPECT_EQ(test, CALL_ARGS(COUNT_ARGS, LAST_ARG(FOO_ARGS)), 1);
>+	KUNIT_EXPECT_EQ(test, LAST_ARG(FOO_ARGS), -4);
> 	KUNIT_EXPECT_EQ(test, a[0], -4);
>-	KUNIT_EXPECT_STREQ(test, __stringify(PICK_LAST(FOO_ARGS)), "Q");
>+	KUNIT_EXPECT_STREQ(test, __stringify(LAST_ARG(FOO_ARGS)), "Q");
>
>-	KUNIT_EXPECT_EQ(test, PICK_LAST(MAX_ARGS), -12);
>-	KUNIT_EXPECT_STREQ(test, __stringify(PICK_LAST(MAX_ARGS)), "-12");
>+	KUNIT_EXPECT_EQ(test, LAST_ARG(MAX_ARGS), -12);
>+	KUNIT_EXPECT_STREQ(test, __stringify(LAST_ARG(MAX_ARGS)), "-12");
> }
>
> static struct kunit_case args_tests[] = {
> 	KUNIT_CASE(count_args_test),
> 	KUNIT_CASE(call_args_example),
> 	KUNIT_CASE(call_args_test),
>-	KUNIT_CASE(drop_first_example),
>-	KUNIT_CASE(drop_first_test),
>-	KUNIT_CASE(pick_first_example),
>-	KUNIT_CASE(pick_first_test),
>-	KUNIT_CASE(pick_last_example),
>-	KUNIT_CASE(pick_last_test),
>+	KUNIT_CASE(args_tail_example),
>+	KUNIT_CASE(args_tail_test),
>+	KUNIT_CASE(first_arg_example),
>+	KUNIT_CASE(first_arg_test),
>+	KUNIT_CASE(last_arg_example),
>+	KUNIT_CASE(last_arg_test),
> 	KUNIT_CASE(sep_comma_example),
> 	{}
> };
>diff --git a/drivers/gpu/drm/xe/xe_args.h b/drivers/gpu/drm/xe/xe_args.h
>index 40b9eb4151d8..e17a41f9da0b 100644
>--- a/drivers/gpu/drm/xe/xe_args.h
>+++ b/drivers/gpu/drm/xe/xe_args.h
>@@ -35,7 +35,7 @@
> #define __CALL_ARGS(f, args...)		f(args)
>
> /**
>- * DROP_FIRST - Returns all arguments except the first one.
>+ * ARGS_TAIL - Returns all arguments except the first one.
>  * @args: arguments
>  *
>  * This helper macro allows manipulation the argument list before passing it
>@@ -44,15 +44,15 @@
>  * Example:
>  *
>  *	#define foo	X,Y,Z,Q
>- *	#define bar	CALL_ARGS(COUNT_ARGS, DROP_FIRST(foo))
>+ *	#define bar	CALL_ARGS(COUNT_ARGS, ARGS_TAIL(foo))
>  *
>  *	With above definitions bar expands to 3.
>  */
>-#define DROP_FIRST(args...)		__DROP_FIRST(args)
>-#define __DROP_FIRST(a, b...)		b
>+#define ARGS_TAIL(args...)		__ARGS_TAIL(args)
>+#define __ARGS_TAIL(a, b...)		b
>
> /**
>- * PICK_FIRST - Returns the first argument.
>+ * FIRST_ARG - Returns the first argument.
>  * @args: arguments
>  *
>  * This helper macro allows manipulation the argument list before passing it
>@@ -61,15 +61,15 @@
>  * Example:
>  *
>  *	#define foo	X,Y,Z,Q
>- *	#define bar	PICK_FIRST(foo)
>+ *	#define bar	FIRST_ARG(foo)
>  *
>  *	With above definitions bar expands to X.
>  */
>-#define PICK_FIRST(args...)		__PICK_FIRST(args)
>-#define __PICK_FIRST(a, b...)		a
>+#define FIRST_ARG(args...)		__FIRST_ARG(args)
>+#define __FIRST_ARG(a, b...)		a
>
> /**
>- * PICK_LAST - Returns the last argument.
>+ * LAST_ARG - Returns the last argument.
>  * @args: arguments
>  *
>  * This helper macro allows manipulation the argument list before passing it
>@@ -80,24 +80,24 @@
>  * Example:
>  *
>  *	#define foo	X,Y,Z,Q
>- *	#define bar	PICK_LAST(foo)
>+ *	#define bar	LAST_ARG(foo)
>  *
>  *	With above definitions bar expands to Q.
>  */
>-#define PICK_LAST(args...)		__PICK_ARG(COUNT_ARGS(args), args)
>+#define LAST_ARG(args...)		__PICK_ARG(COUNT_ARGS(args), args)
> #define __PICK_ARG(n, args...)		CALL_ARGS(CONCATENATE(PICK_ARG, n), args)
>-#define PICK_ARG1(args...)		PICK_FIRST(args)
>-#define PICK_ARG2(args...)		PICK_ARG1(DROP_FIRST(args))
>-#define PICK_ARG3(args...)		PICK_ARG2(DROP_FIRST(args))
>-#define PICK_ARG4(args...)		PICK_ARG3(DROP_FIRST(args))
>-#define PICK_ARG5(args...)		PICK_ARG4(DROP_FIRST(args))
>-#define PICK_ARG6(args...)		PICK_ARG5(DROP_FIRST(args))
>-#define PICK_ARG7(args...)		PICK_ARG6(DROP_FIRST(args))
>-#define PICK_ARG8(args...)		PICK_ARG7(DROP_FIRST(args))
>-#define PICK_ARG9(args...)		PICK_ARG8(DROP_FIRST(args))
>-#define PICK_ARG10(args...)		PICK_ARG9(DROP_FIRST(args))
>-#define PICK_ARG11(args...)		PICK_ARG10(DROP_FIRST(args))
>-#define PICK_ARG12(args...)		PICK_ARG11(DROP_FIRST(args))
>+#define PICK_ARG1(args...)		FIRST_ARG(args)
>+#define PICK_ARG2(args...)		PICK_ARG1(ARGS_TAIL(args))
>+#define PICK_ARG3(args...)		PICK_ARG2(ARGS_TAIL(args))
>+#define PICK_ARG4(args...)		PICK_ARG3(ARGS_TAIL(args))
>+#define PICK_ARG5(args...)		PICK_ARG4(ARGS_TAIL(args))
>+#define PICK_ARG6(args...)		PICK_ARG5(ARGS_TAIL(args))
>+#define PICK_ARG7(args...)		PICK_ARG6(ARGS_TAIL(args))
>+#define PICK_ARG8(args...)		PICK_ARG7(ARGS_TAIL(args))
>+#define PICK_ARG9(args...)		PICK_ARG8(ARGS_TAIL(args))
>+#define PICK_ARG10(args...)		PICK_ARG9(ARGS_TAIL(args))
>+#define PICK_ARG11(args...)		PICK_ARG10(ARGS_TAIL(args))
>+#define PICK_ARG12(args...)		PICK_ARG11(ARGS_TAIL(args))
>
> /**
>  * ARGS_SEP_COMMA - Definition of a comma character.
>@@ -109,8 +109,8 @@
>  * Example:
>  *
>  *	#define foo(f)	f(X) f(Y) f(Z) f(Q)
>- *	#define bar	DROP_FIRST(foo(ARGS_SEP_COMMA __stringify))
>- *	#define buz	CALL_ARGS(COUNT_ARGS, DROP_FIRST(foo(ARGS_SEP_COMMA)))
>+ *	#define bar	ARGS_TAIL(foo(ARGS_SEP_COMMA __stringify))
>+ *	#define buz	CALL_ARGS(COUNT_ARGS, ARGS_TAIL(foo(ARGS_SEP_COMMA)))
>  *
>  *	With above definitions bar expands to
>  *		"X", "Y", "Z", "Q"
>diff --git a/drivers/gpu/drm/xe/xe_rtp_helpers.h b/drivers/gpu/drm/xe/xe_rtp_helpers.h
>index 8129d6d9ef37..5e699455c32f 100644
>--- a/drivers/gpu/drm/xe/xe_rtp_helpers.h
>+++ b/drivers/gpu/drm/xe/xe_rtp_helpers.h
>@@ -17,7 +17,7 @@
>  */
> #define _XE_ESC(...) __VA_ARGS__
>
>-#define _XE_TUPLE_TAIL(...) (DROP_FIRST(__VA_ARGS__))
>+#define _XE_TUPLE_TAIL(...) (ARGS_TAIL(__VA_ARGS__))
>
> #define _XE_RTP_CONCAT(a, b) CONCATENATE(XE_RTP_, CONCATENATE(a, b))
>
>@@ -54,10 +54,10 @@
>  *	XE_RTP_TEST_FOO BANANA XE_RTP_TEST_BAR
>  */
> #define XE_RTP_PASTE_FOREACH(prefix_, sep_, args_) _XE_RTP_CONCAT(PASTE_, COUNT_ARGS args_)(prefix_, sep_, args_)
>-#define XE_RTP_PASTE_1(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, PICK_FIRST args_)
>-#define XE_RTP_PASTE_2(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, PICK_FIRST args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_1(prefix_, sep_, _XE_TUPLE_TAIL args_)
>-#define XE_RTP_PASTE_3(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, PICK_FIRST args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_2(prefix_, sep_, _XE_TUPLE_TAIL args_)
>-#define XE_RTP_PASTE_4(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, PICK_FIRST args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_3(prefix_, sep_, _XE_TUPLE_TAIL args_)
>+#define XE_RTP_PASTE_1(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_)
>+#define XE_RTP_PASTE_2(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_1(prefix_, sep_, _XE_TUPLE_TAIL args_)
>+#define XE_RTP_PASTE_3(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_2(prefix_, sep_, _XE_TUPLE_TAIL args_)
>+#define XE_RTP_PASTE_4(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_3(prefix_, sep_, _XE_TUPLE_TAIL args_)
>
> /*
>  * XE_RTP_DROP_CAST - Drop cast to convert a compound statement to a initializer
>@@ -70,6 +70,6 @@
>  *
>  *	{ .a = 10 }
>  */
>-#define XE_RTP_DROP_CAST(...) _XE_ESC(DROP_FIRST _XE_ESC __VA_ARGS__)
>+#define XE_RTP_DROP_CAST(...) _XE_ESC(ARGS_TAIL _XE_ESC __VA_ARGS__)
>
> #endif
>-- 
>2.43.0
>

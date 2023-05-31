Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B6C4C7EE2F
	for <intel-xe@archiver.kernel.org>; Wed, 31 May 2023 16:45:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F53910E4F2;
	Wed, 31 May 2023 16:45:15 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB8C810E4F2
 for <intel-xe@lists.freedesktop.org>; Wed, 31 May 2023 16:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685551513; x=1717087513;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kEZh6enXLeEzSgh/lwTPFEB+bQ0XShnicmDAuV3rpwY=;
 b=QZoGok3+sY2v3dcKWStEw+Lt8I8txHjqyQgz66MkESGYIRTQjSwn8Pyj
 CWtRtnEy+QGzEbMNroprheXW5zKhLeH5/FKUkeUCE+jkzhAxgJMe+5ubD
 peD79w6e0JEfgIMZqWVVYR4hDzGCLj5PFV96aNxQys/fZAuQQbAD+JBnc
 /XhKfi8ithLMdx0bMk57CQSREM4MlOPGc9UyP91r69Fw0Q9t7ZZVag/Dj
 3PraP/sVkSJRqghrMf+plqpl7kUbhm1LXWwYeEulL3dIekDWqrb7Y0D2v
 9xs6bPzzbbQaaa3lRo3sq7eAJvZm/v7OibV9wN2GgNIhIWszLaeYpNSO9 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="441652831"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="441652831"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 09:45:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="776828143"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="776828143"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP; 31 May 2023 09:45:12 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 31 May 2023 09:45:12 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 31 May 2023 09:45:11 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 31 May 2023 09:45:11 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.46) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 31 May 2023 09:45:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kvsrvUbEYWjyZ8w9Sxx4DLKZ7wwL9HDaQnvvpNJv8SCtRY+lzicaDfZ4ttPlfca0klFWAWf6Q1RubotfoL/NXEOgOdvPRasJlnmUK9jFJCPYonOfes5dyZc643yyzVvhyxzsGzzEcWGhDdp27dJFMqyHIDESlde1jdthpQHpnlV38gMJcp85E6NQyjoaKwFlClXTVECm0OnLcw6k6H577rq+I3uBG4GMWhAgZUuw3vtpMOrTh3Nsjd1yb7ZKXPBQgwLy0d9LkBDVfhPNPpHzg7AHFbtWYq45Wg7NwwGvhO8AERgvH95JxLBnz8Xt1xakfpksPMMhqQUNYJEao+zuiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ASOU7qDmm1J16WRUUKrsfG/jEco6rcDE9hFTKhF2SMk=;
 b=g7bL+lzoR8xOWvjaF7im4Ffcc6U7W2lJ3Enq73TA7WYf5Xp8O+gjYem3driE9V9yXWJn6mbejJcFUithikZ7cfdJinYkG4ssfyJePW88JSmAuaNiK2zrhef8zOb7ATuQlNU+diLWe+uIJSKC4eaGDDEh3luyIADxGUQ4X2zSkAPcDR8vnHIrlaYthNcjJvE1FoagUD0q2To/ZS2Qk+gug0gYlHsJZv1JP1OTgSEpd0Ira51a/2SC7twfFhlE8DHibPTGLnpi47Uylwvn6rDiI2L9LP/fcEhwTtviDzdyd/3Dez3BCVK6nL9UB32cJ40k21b+29LEkoxuM8Y9ws2knQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO6PR11MB5667.namprd11.prod.outlook.com (2603:10b6:5:35b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Wed, 31 May
 2023 16:45:10 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%5]) with mapi id 15.20.6433.022; Wed, 31 May 2023
 16:45:09 +0000
Date: Wed, 31 May 2023 09:45:07 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <jxctfqc4627xgu3nxumherp724kyqiz6iqhtxkrbp3ibtagpjn@mqeyghmdhwvf>
X-Patchwork-Hint: comment
References: <20230525161643.7-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230525161643.7-1-francois.dugast@intel.com>
X-ClientProxiedBy: BYAPR05CA0038.namprd05.prod.outlook.com
 (2603:10b6:a03:74::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO6PR11MB5667:EE_
X-MS-Office365-Filtering-Correlation-Id: 64fba0dd-3ace-4e68-ef92-08db61f6658d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fxZSZy7KahaVn6HijsBiG313JVEeM9gWoCgqR1tVRuJ4FnX46qkoENk73Pg3r7j/RKl1IqyqBRB8i3ctzIc6amf2C9VQCd9TlF9byxQCd/EzFC+IW8OVVG3xZYsJaZy8glmWmd9vaUIBvzfuYxskjuJT1udErtBSmi5epYJ8Groh+IWUpPCphFKe/io0pG5AGwmHRPSXx9K1fqcfHyngkH6w0LJXWPtOu5F7X2NOqzWs3xDYBfrurem9/U/MizX0FVRHxfSnbvWtErsjGjCjKeAeEmI7QgYV8RMVbn0Yi/pQw+zniv0vUvvhH4ZKCe0Mexn9C/8w+jX9XcDCCO4yDufZmEHxiBc2DjFOEERTmMCXGWUy+MrjESwZ+1UOlHRTlEVoSlW5ua9G4/PnNNk5SQ3Qr8JS9v2q+lEvOteHSH9by1vKsA1WqHykpkF888yw3YgH/eheeoyK4Y6zl4dQO6YwYmKaqKmP1ivvD7sIjVi/DFcjHrk3WpLncW3eIK2U2Co5eAy0cFxYETObdUNFTQvqXBLSWTpje3Vl96iSmik3UAoOTD6GibnJNg6ZkzZP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(346002)(376002)(136003)(39860400002)(396003)(451199021)(41300700001)(33716001)(6486002)(5660300002)(186003)(6862004)(8936002)(8676002)(38100700002)(6506007)(6512007)(966005)(9686003)(26005)(4326008)(6636002)(66476007)(66556008)(316002)(66946007)(2906002)(83380400001)(478600001)(82960400001)(86362001)(27256005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?niUyD9IKgEzqz5c2ag6GG6W9VCf/1N5pS/oQimUSEEHPvGVeovDsJJtwhT5T?=
 =?us-ascii?Q?xgba4S/A9z0LC+iEDAjesQcWa5fNG+RIgl11+UC+XvPaNa0IAsYRFtfTvoIk?=
 =?us-ascii?Q?8cYa4z6HGHwOZY8MXavuSt8MHsrMuzIygvBEy64+/VZszwCgrYeIvKuhpkMu?=
 =?us-ascii?Q?CA7jvSa7lL1VG6CAlHjK/5XbftvyQTJH2k5ZCXkBFS4/+9BbhBVKXAP2qabN?=
 =?us-ascii?Q?Z+KcN+88MFp4YTuzu1UJ1Dtc9DZW935mIvXlUgBeDEk2ZqY//7qfGnfnQOq7?=
 =?us-ascii?Q?HOVndksB0n6+zj6eKiguClr0yNpzk9rfqaJwNz7IZUDyozK4LZ43nLwW1Qm2?=
 =?us-ascii?Q?vivp+KCdkYY98iTX9GvXwcO/1KWGn3tP/EKOzP04oBuH5AnUpTEgwXxHJH/7?=
 =?us-ascii?Q?OhJifK/vsOl+OTTppX+8SpH8ad/napyTD9rn5xqQAaX7I0U3qSpzGSGDwjSi?=
 =?us-ascii?Q?sO9rdFpTuyoOfQ+IeWKOzWACvJE1QO7E8YiVk0Estjdu6h3Huzxf8V6wLmnW?=
 =?us-ascii?Q?xDRqzYBBhuw5ZFrevJ/SQIPnhTqLawjpqrCCxx+wCJV5sYaDL3d3vbcBTO4S?=
 =?us-ascii?Q?obiQaqNyHUnl8C7uu3naUPINXrRBnOpmtgu4fpr4fvUWFmkZA8Qqz7zFZj8m?=
 =?us-ascii?Q?tm4EajzNz9U0WV5xIG16TXFsUFOybD2Zd/evTzxAgiZxE7Tgr0asDEO6nxmi?=
 =?us-ascii?Q?IUApoHYYx42l9rlX39XfL/AwFh5iDT+/y2pQ6qk/L4UMEwNlkoV5vrRre+Jx?=
 =?us-ascii?Q?2R+pUv4N8iaOxct6Qe3YegfYw7b9ea/r6s7k2S9Qw6RDXZTrPOj+dbd80gXp?=
 =?us-ascii?Q?HLZPS2nRKzN4OS7NcQilgPEXhPhrFLSi8IzYxX2zaPdgBR6k1SHsMta3/p1U?=
 =?us-ascii?Q?wmVuTnad8euAgXhfRpvLDOdwQRnslsD+vrpaB3TaTxevhRu3UjOMaP0dz2oE?=
 =?us-ascii?Q?y2AUF3lT6aHGnAgKqTUf0szJXdoKTA6/08GmBq3lSwg5vVGm2alORThd8+zQ?=
 =?us-ascii?Q?VDKSatYYClXcNhSKTr+RMMXhUIuusLJNPFtoy4NPIV/2Fv+P9WdeKxFyQLPY?=
 =?us-ascii?Q?/w+kRarnchuWP7bBYEkaXVqgbvjCEk7uWzitwHOvOqvxtY86xI4VZV40LxaW?=
 =?us-ascii?Q?OYCJ10Fd1fyjS8v2yzCRYdgxYepkK+Ax7u4d6zeMJja1XzCy9Vopf3iSSnVr?=
 =?us-ascii?Q?EkmIdbdwYsVM1huS4IpdtiHangKBqWkK7kYwKTLs2Hmr5iGQIhSQ6SGOwzrP?=
 =?us-ascii?Q?FOHLMcjveJlpMA2NmdsGhIZTc//X5HEtjSHJ+xesPGEl1U1+WfVSg+Ella9+?=
 =?us-ascii?Q?ImrnQeYz6jMJf08B0wVUGQTW8G21mwFvDQqSr3DpgbspKvoJJsN9QqfTv39l?=
 =?us-ascii?Q?5NIgxjAbdPFFdRE8hpgGHl3xyzCAfh+P/idZjCiTKb0G8AIuQVkPRwBV2Xp3?=
 =?us-ascii?Q?2KSBFdGq30SilzBckPwCL7bcqZzRCgYHiVZOD2gYKb8WQpt6PybJH+gcQD4z?=
 =?us-ascii?Q?hxQ2kJNmu0OWuviO8My3HK1n9G455l5LR45XDwO0EmxcNbbDqM+bl14fpsuW?=
 =?us-ascii?Q?0FLleUw3e30z2in6fpa2AN5fV0a3g+GMBBrR3U+o1I1COe+ddsscrQix9Hr1?=
 =?us-ascii?Q?nQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 64fba0dd-3ace-4e68-ef92-08db61f6658d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 16:45:09.8931 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H6Ph6m9S6Pa/YxpBwmjYskSB5SmufYDc5kA3VxHkbMLQIBRaV5Avkb0qKrAxJjN7/vMZBK2eO2DRYCsKqrQ7nR7YhKvmfBdccDW0XSni8Ow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5667
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Prevent flooding the kernel log with
 XE_IOCTL_ERR
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, May 25, 2023 at 04:16:43PM +0000, Francois Dugast wrote:
>Lower log level of XE_IOCTL_ERR macro to debug in order to prevent
>flooding kernel log. Rely on drm_dbg macro output which includes
>function name, so removing file and name macros.
>
>Reported-by: Oded Gabbay <ogabbay@kernel.org>
>Link: https://lists.freedesktop.org/archives/intel-xe/2023-May/004704.html
>Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>---
> drivers/gpu/drm/xe/xe_macros.h | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_macros.h b/drivers/gpu/drm/xe/xe_macros.h
>index 0d24c124d202..2b8a46ffb93e 100644
>--- a/drivers/gpu/drm/xe/xe_macros.h
>+++ b/drivers/gpu/drm/xe/xe_macros.h
>@@ -13,8 +13,8 @@
> #define XE_BUG_ON BUG_ON
>
> #define XE_IOCTL_ERR(xe, cond) \

		   ^^^

>-	((cond) && (drm_info(&(xe)->drm, \
>-			    "Ioctl argument check failed at %s:%d: %s", \
>-			    __FILE__, __LINE__, #cond), 1))
>+	((cond) && (drm_dbg(&(xe)->drm, \

			^^^

now you have a mismatch.

 From a quick look we already have
several places with mixed usage. See e.g. engine_set_timeslice(),
engine_set_preemption_timeout(), engine_set_priority(). There are also a
few places that will log on ENOMEM, which should not be there, but is
not caught by checkpatch since it's obfuscated in the macro (see
scripts/checkpatch.pl - "# check for unnecessary "Out of Memory"
messages")

Can we get away simply removing it?  retsnoop is a thing nowadays and to
understand where the error is coming from, userspace could simply run it
on the side... something like

	# ./retsnoop -e '*sys_ioctl' -a ':drivers/gpu/drm/xe/*.c'

which returns more useful things if the error is farther down the
call stack.

Lucas De Marchi

>+			    "Ioctl argument check failed: %s", \
>+			    #cond), 1))
>
> #endif
>-- 
>2.34.1
>

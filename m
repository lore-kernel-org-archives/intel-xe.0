Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 424FEC7EE29
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 21:44:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 123B110E780;
	Thu, 25 May 2023 21:44:48 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F313010E780
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 21:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685051086; x=1716587086;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=j4go68TcKg0qOzCxtDSLCWXCk4qiTL3Y3WMYcoOxUfw=;
 b=X/bs4BsqCz9YteA0jcL6bMfMHLa6Rs8gvNR5IAkHDdeQkUxMV+BVHlrs
 ub9t89gjLD2nVPIX4QfToIYjjnQTTHVlyfZLfc49Qss6omyWEE6z467lR
 76jicL0XFk/tAzpWxN92j0nfdDiVH3Cj+dbrt4+oGJ0d9WxmJmzKEaVZS
 B1K0sD0YSeJWU+DsYUG7rFy00QrjjOVtn3VMhTX5sEZh707gFVSyKIQIf
 9zqikhCutLH8hivM7JUx4Ha1fFUqxrgEUDjirtC5YtJQL2UO0PyWcaPnJ
 EQCkHpIyZApx8L/pMDxSgXMKJCn5dz6N2KboP4Kt8Fgahq2GzHfbm5HDF A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="354053810"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="354053810"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 14:44:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="794829541"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="794829541"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP; 25 May 2023 14:44:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 14:44:44 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 14:44:43 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 25 May 2023 14:44:43 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 25 May 2023 14:44:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cpxrMJOI3PjJetlsPvxC4CfOe314EJUCrtvnt4TMFacp1safiqn0MFkRMR59ZykMj9ngR9z0W/YYo24rbbTQzL2OeDlwGLFNsaHDG7QJCqyQjJmTWF11RPoVv1rUQE8F4UJX4DMTdiASoBUCztY753eLKeYF8Uva6ZZGHtJ+1dAQAzwP4QehSyDwUVDIgmD2hPQppI5UGwZtIywrF9G9w9ZrxAewAuAej5QEQprPnc4rR/Kh/H0PuML1DVoMNesqNBwjsZrh3SnMUDqLbsg/DFIvBF05vOj/enO4JSvpmtjyleYqPILrXVTZWt1hctuEygH12qSb/BKdiCED3Oa9+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DJS2GiSpu3tUvAcRJtmcoaPVVnMxAZ2yp9tYx40DAdI=;
 b=cr5iyR3xQf3nWTllKGEHAmi0drz/Yi/8EzRcEeGQhrb3mHEQnc7etdWqjQjMLIgsrRdKJVTYBobFSw7zX5hMCSOonL1rnMTpJzaUWBRhMj/wWB3N54Rw1gQ8bQfgDa0fuCysRV8zq/sy+33Od857RON7dRVBdbr16nuV1tY//DvYpjYTSPyCrl12ishM17UdmUBXjr4luCPdWfZOwcQcq7pzW+6d/nrkJ1lsfk6Fmj+cnUfp/SHb9JuwY9OfA/sOD9sGOK5h4HW/RRg3WBO7rR2F/+kgN+nIzi5mEv4GmwfW2yDY6UH6mDYJeNKosA0jpKE0UQZS310iLtZorwY3EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB6969.namprd11.prod.outlook.com (2603:10b6:806:2a9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Thu, 25 May
 2023 21:44:42 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6433.017; Thu, 25 May 2023
 21:44:42 +0000
Date: Thu, 25 May 2023 14:44:40 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Message-ID: <qt7wwy7simksvnn5yx5upezxavsrfdqp27sjqvesqdpiltxbnk@rkn2pe7nfeql>
References: <20230525213407.3907094-1-lucas.demarchi@intel.com>
 <168505074292.5913.16949510448486812796@emeril.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <168505074292.5913.16949510448486812796@emeril.freedesktop.org>
X-ClientProxiedBy: BY3PR04CA0014.namprd04.prod.outlook.com
 (2603:10b6:a03:217::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB6969:EE_
X-MS-Office365-Filtering-Correlation-Id: 079a3e30-7376-46c9-fe90-08db5d693f46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S5hgzSoRF89Q2oUcsfN45SLkBWB/5s9iKQzWPZePmmqXi+2t7pkJavdz6sGLo8nFCKDhDvjHgeZ8vQCc2wNBmO2yR+G+RPf/7tDEhFOYFIn+Gip4wb+0Y06Z0dDHawCwQ/69vxJwaZwgPrbyhygza20PBg1NzPzLnrjElpQkuaXdR/ORsHieckJU+w2MqCKgglMlMvaaT/AuglLOUcs1Fz/n3OcvcDnKr15PmvnqQTCSyKMbw3eUF2HeS5n0ac9+e66Ph6xwUSFN7aIbDjLG103VSOiKZj8LNP/Mz1Vxuw33MHD+YezVrl7qiQDS7Ftfbr/dk6q6ylnr6mpj0e9pOhlVvs7zgxUoKiB2KuOeJrcKBi+AfBrSiSEA2n4avxVM6oqp8xZbsFfOo93CPY1Fvirs4+d0fKPZGB8uXkoZX+o4vdVDAE9L4hapVV+3QuwjbqHS4Ou/7lz1kcQESCEd6Bph5zwpJpqE2cZNwAKAWZndVVLNfwhdCCf7O44+qFrN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(136003)(396003)(346002)(39860400002)(376002)(451199021)(66476007)(66946007)(26005)(6506007)(6512007)(66556008)(966005)(6916009)(316002)(6486002)(41300700001)(478600001)(5660300002)(8936002)(83380400001)(82960400001)(86362001)(9686003)(2906002)(38100700002)(33716001)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fd3BYl9LgJWQAVv5PpVJuU7k6L8BKTc1q/qjHSE1z/Ff1bIoTAa05WAV0FSJ?=
 =?us-ascii?Q?lGxFRqxY6ItYJZe2sRclZZEFpFrEfet5/496zb9spMK1979p8OG+i3DrbbFx?=
 =?us-ascii?Q?qZ8QGvxIPn/FugjQn5B5wT9EFzLxE6k0he0GnDOrd25ztCHuVSWCUpheY9mU?=
 =?us-ascii?Q?l9KgGVMjbLhPBUrn6wEJZG20fYegCDejNIu0X7d1kpVTgTsoh3bYemuq/DZI?=
 =?us-ascii?Q?df7X5E9xBYxB5zpgwFVzC7bN1dPb2XlUAlRcKCy0CgpT/ToL+fpZfUND3xjc?=
 =?us-ascii?Q?UfWfX4/hXJJrrSRSoFs//7w6geCcg6+wTi79rssEOdY3Lnur1AWS8icwmFqj?=
 =?us-ascii?Q?2mh75wB0YjFsAxxF7a8F1sKjpfpjg0Bm2azdhQugVV7HwGGvQ6zJdIWh4/5e?=
 =?us-ascii?Q?kxAeEg818/gxXyZz0waw8XdNP6DIw72aPDuQmw49A+SH1kJMyvumEphrJOPz?=
 =?us-ascii?Q?rdNrC81i2a4PuUXiy3VzQ9hLTeWDTEoYY/UZczRt4zcT5Pb5Rf+97smTCZbJ?=
 =?us-ascii?Q?Yy0cWnq953DsIuGH6s4oI9hChCCbNshHaGRaW/jia0zln6TyvcA117XauZir?=
 =?us-ascii?Q?38XQyvU4BU/atjzpiRk7/Q7FSc0sYfGv0yl6+vzvYZUyX8PXRvwcF9Ceffcj?=
 =?us-ascii?Q?tUsz2i3lQ+b+LrHzlrcKVUQ35CMPBfEGStlo66BR+9UepdLkTM4zGvRVk19s?=
 =?us-ascii?Q?PJ/WNNC0OWM4Tcp7QvdId5HP88C0op/Ipx1YIX8YKdrRwEFRqpGBuVwsFj5E?=
 =?us-ascii?Q?qujuG8Dvw6P2094cxwWa6IYFd2w962MtWbdW0EC1E6mf48u92RSONUZh9qOL?=
 =?us-ascii?Q?WgRng8iw48kGVR04hOeaHdhjl+/wsTyhtPiBoBdFRegJoSfaoejWw5lJ3ugA?=
 =?us-ascii?Q?zLS6DnMUkG9SUoR9JdNv7aR3NX76QJqZAi7mBayXOHIWEitOObT1K4uP1sFJ?=
 =?us-ascii?Q?HcVk0rjA3kyLiurWKBDi1MMDMwY2pZu7DwJnqP5h2Na6rx/hGCDTheMdAMJf?=
 =?us-ascii?Q?j+szekbHACSoXZ545OjN1/2RyjNHiUoCBuO9l8ZDKZpdVO53hbPvn2sTFSLb?=
 =?us-ascii?Q?ybBgi6yU3kK8pl5QgytFf7HLDheglPAIZfZ4NJjQHjNrP8wAdMx4+0baMs4e?=
 =?us-ascii?Q?UkysGEBF9CdtF19B41YHxZ21fpP2tTZ/1wmR6whJFwLDgep1bAvmfmdZVz1O?=
 =?us-ascii?Q?e/NNtGWk/ELOYnh5WSD92Gpou4yu3AoH7iC3+SkYtbdbCABJ3rl8ETFPakUN?=
 =?us-ascii?Q?obd9sPZgDTLmKIwlPK6+CyG8DfSU53BbxYLmDHHSJY12FMqVzUTwUHIQazss?=
 =?us-ascii?Q?A7Uc2eH1OuyGJKfTceXNDCXzhfGRanF43rHtq38wjgL4D4d/KYR/bUyWJN+Y?=
 =?us-ascii?Q?H1zFtaOYPROobMuu0BFvXltkDp44/fhlNIMb4BZ1lXBNBvh0Lu/JtqiKVtlJ?=
 =?us-ascii?Q?hIlhTz1FXHezdpLoPSyUcM4D3mLA0+i4uepip6FtM7OldvCumRBGqq/cA2W1?=
 =?us-ascii?Q?dYgjpnoJQsAQo6G99FLwc29x4Rrdsx2DFokgwrGc12g6vHsW2PvdiEEaRR8d?=
 =?us-ascii?Q?CFEjCysbKyT/1lLVoQUuJnAzd0iNTbWU5rSvdeUL8y7APOt+giakt3CD8LOg?=
 =?us-ascii?Q?QQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 079a3e30-7376-46c9-fe90-08db5d693f46
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 21:44:41.9118 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cyRUfNvKt1aJKFZZqg7zZRlKQ+Vgo+mhZ3K7lENW/Zo5lrUBLQH/1UG12qyExn64IH5gERbenFxpwTIBNNMPA1XujbWoRlezFeGE2cwfI7A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6969
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] 
 =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_Dump_+_?=
 =?utf-8?q?OOB_workarounds?=
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

On Thu, May 25, 2023 at 09:39:02PM +0000, Patchwork wrote:
>== Series Details ==
>
>Series: Dump + OOB workarounds
>URL   : https://patchwork.freedesktop.org/series/118399/
>State : failure
>
>== Summary ==
>
>+ trap cleanup EXIT
>+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
>ERROR:root:../drivers/gpu/drm/xe/xe_guc.c:8:10: fatal error: generated/xe_wa_oob.h: No such file or directory
>    8 | #include "generated/xe_wa_oob.h"
>      |          ^~~~~~~~~~~~~~~~~~~~~~~

./tools/testing/kunit/kunit.py run --kunitconfig drivers/gpu/drm/xe/.kunitconfig

this passes consistently for me, and also building it out of tree

Lucas De Marchi

>compilation terminated.
>make[6]: *** [../scripts/Makefile.build:252: drivers/gpu/drm/xe/xe_guc.o] Error 1
>make[6]: *** Waiting for unfinished jobs....
>make[5]: *** [../scripts/Makefile.build:494: drivers/gpu/drm/xe] Error 2
>make[5]: *** Waiting for unfinished jobs....
>make[4]: *** [../scripts/Makefile.build:494: drivers/gpu/drm] Error 2
>make[3]: *** [../scripts/Makefile.build:494: drivers/gpu] Error 2
>make[2]: *** [../scripts/Makefile.build:494: drivers] Error 2
>make[2]: *** Waiting for unfinished jobs....
>make[1]: *** [/kernel/Makefile:2025: .] Error 2
>make: *** [Makefile:226: __sub-make] Error 2
>
>[21:38:39] Configuring KUnit Kernel ...
>Generating .config ...
>Populating config with:
>$ make ARCH=um O=.kunit olddefconfig
>[21:38:44] Building KUnit Kernel ...
>Populating config with:
>$ make ARCH=um O=.kunit olddefconfig
>Building with:
>$ make ARCH=um O=.kunit --jobs=48
>+ cleanup
>++ stat -c %u:%g /kernel
>+ chown -R 1003:1003 /kernel
>
>

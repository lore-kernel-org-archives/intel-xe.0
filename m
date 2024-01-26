Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2214C48260
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 14:56:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6EB110FB59;
	Fri, 26 Jan 2024 14:55:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C426410FB08;
 Fri, 26 Jan 2024 14:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706280958; x=1737816958;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Q1kP5MqwvWWfjTXjfA5iwr8sShnNbOD+LVwVHQcFBls=;
 b=M68YijVMWECRThwzfZNRqxXm5XRshzmKjaJwBA90RdemVMFWqEnXau/N
 9xVeYqCZ82p+1uMctWIJ0fsFpGtTONcWpZwbyIAwRqLJ12wpca9GsITIi
 Bd6sT6zSIPuGmf2SiH1rwTd9gQ1OgM9AS2r5fCgC0wbM4EcPc6EYIk9ux
 mBohqJpIBz/efEeZhfi22V5ZpudWLqq/bHs42ttY9Llgb8Pu3q27ct9pz
 AR/ZdmOXA/cPFshEDFgH0EG1n+Db/nU/+Ij935oulSrXDn/K++lMJiDD9
 TEaVsC7JtxT01OkmhkVmBZt5PoGo709yiR3G5q8qjMnuLa1xNvVvN5e72 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="406219145"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="406219145"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 06:55:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="821162908"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="821162908"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jan 2024 06:55:57 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 06:55:56 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 06:55:55 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Jan 2024 06:55:55 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Jan 2024 06:55:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oW3lRueioqn8f0f3CYrR8YjVj2QmIBXO+AxEQV3VJKL11Jki6DI62zxLtVC5qdNmiHGww6t95RwMaxdOJma52dchS89H5uyYl4tFX2pri38SYsVK3kdkkHfj6mBFmRc396ISua5FUXC38Cav5Khpk9vrzPQXf9OVDuKUioHQm9BYRmmoT0+on++s6xWd94PNjZkZRROffnp6w6yjC/Jv1teWZDh2YdOt4T47TRL2kpcH0z2stFWYktJURlSgmq2PuHC6itVBRKW35avx7MG2/Mzcci70N5jwvxCZdfx1Zz4I70iUHXR+Bz7OnaeKgkZxZN1XQj/M7UN6X7qZupf38g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OiIsT0pVxGamwMbZXiMyeavjyZnJiMhy+HWlKAt1smg=;
 b=HqAokTCT+PvQ5m0Fe+KnKMtOoUi6lHGz86SXns4UnRT5Be6l9nr+QyJkGTTkoGutsZc5Dwxfmo9V+QxpktMFt/DUIiIH6l0XM6yRwSL2pjg/66Xduk+HiQKvgpEzW5aF38FaK0rhYtVLNSmEWv+AdHqQzta2I85963ci0g06KtbbzQkuhUfoAqLbyXP/urgC99OTORW3bjgosPrif98XhLSIIbt/AqSW3+Q+f1FgQPU1XQwtF8Z2TZ70YuhcCogbkFo0zgq54efIMv4XRTCF9wy+H9wlS2PUR78v34cIMaePuCiuIx6RkyOqenAVFNoTIpsXHW0dQtDx4szlI5SeqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB6101.namprd11.prod.outlook.com (2603:10b6:8:86::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.27; Fri, 26 Jan
 2024 14:55:51 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7228.027; Fri, 26 Jan 2024
 14:55:51 +0000
Date: Fri, 26 Jan 2024 08:55:48 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: Re: [PATCH i-g-t 0/3] lib/kunit: Support writable filter*
 parameters of kunit module
Message-ID: <hegcmxzximjhe23sm36wwipvjy5hytipiaesitqstffjfydnr3@udqcjs6bmj3u>
References: <20240125165749.15599-5-janusz.krzysztofik@linux.intel.com>
 <o5um4wakpooxbxd5algtfpgqmwar5lb2dkahdrc5zkma3nvlul@j6jyzvai4aht>
 <13875046.RDIVbhacDa@jkrzyszt-mobl2.ger.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <13875046.RDIVbhacDa@jkrzyszt-mobl2.ger.corp.intel.com>
X-ClientProxiedBy: MW4P223CA0006.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::11) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB6101:EE_
X-MS-Office365-Filtering-Correlation-Id: 8606c091-3c2e-43ae-357a-08dc1e7ee3c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IWSIXdPd9xBDliX4obkT1hA+D2GdQznnbi2wpNdnzaYHBWZ22mbal2ed5reinsSYAitn8Z9SoUt3vH8/tN2ryBBNEKqd2aSSldt7Hs6qkb/EMEBgzF0S9asf60pXJkhelf+R2P3BnnQXu0xPiV0ovrO7hP8MHh4ddtvfgqwF4zRl+dcHM4MVqjIyBmHJBTiQPP7oTvZMpe+Ka7lLIRZKeWfh5bE6VfGzDnv+KZStdIzUwlSzs/OFD5n2XmFEuy3LwbjAvhQXPFd4cF5Bgc1vrIzvQ7lJdrsD9//NVEB2ESOsRhJ/lw1Ic6tWdCw6zEbkUyxhtnvMW4c6xlXdG0DBDED65bgQpkn9JgSsj66Yqfdt6P0goMawVXqz/lynGUqimNmZzLPqhPw9CiPSQGbeBa33Vbh3IfCr/f8Wo1s/oaPAkNJLY+7F+NLDzoBR1I4f1U60OA2Du4Ot0XU64bgj5yp4wrCK2q5xGsyCsiBRKgMM/eLglI/h4JlexrRwmDRA+I9DJ5dR4L6q7FG145kfENJpRb3O1UmCYVsEifolEpFKRiIFPESeEqPBQjZVHsgu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(39860400002)(136003)(366004)(346002)(376002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(6666004)(316002)(5660300002)(82960400001)(2906002)(38100700002)(8676002)(8936002)(4326008)(83380400001)(9686003)(6506007)(6512007)(41300700001)(86362001)(66946007)(33716001)(26005)(66476007)(478600001)(6916009)(6486002)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uk6k2YcECl6HUlfC6QeFZta/5FPm5YKvpXxXIU1DP1LBrpYPsq/Q5zhB+doy?=
 =?us-ascii?Q?tr/QOR3LV/l/wQHJV1CVGyVpLIhgyA3wDQSAKcZgeM5k1Tz8j3l0NRhfKmHy?=
 =?us-ascii?Q?0tGFNGlpJ3YVG7pY/Mv/JZkldm3HhiY25OfhF6n9X7HZMDzx/6ZGE4yBFGej?=
 =?us-ascii?Q?cF/3xR1w5eJfHHbCQGLV0z0zRd6yEozyRlMQUwtmEPcoWD6SRF4L/PB9mk2G?=
 =?us-ascii?Q?rWKHvoaWns4j2E3x6j32ychpIZ+l9huZ9w9/ullAS9MmgQTejPtyVrKJsHYV?=
 =?us-ascii?Q?eC20LuUjIY/e95UTeboAShXZm4abTZQxPE348SOeqSYuCyWnQxk5uG9ZZxkL?=
 =?us-ascii?Q?0TnwIpj/eHoSMhFlqgr/9WnOAFIqkhCUMxG1iUcdRh86iMDmk+MHk4sD0NHl?=
 =?us-ascii?Q?idU1LgG6dK+5N0xNJptgcHYMCJtXAlHNewgCM27zQWIUUlVueJg5U31n9FOJ?=
 =?us-ascii?Q?50+2ql1PGw4DKH0HUK0tU8bUdNwDuOXhaW0ETkg/tU+q93liDSN8ddH8sC6t?=
 =?us-ascii?Q?4l94H5vt5DSM/j0Nui2Yisgpve4j5FxjdFTMJL85hXuQfs6rBcYJmrMpdoWt?=
 =?us-ascii?Q?ulu1KgiI7UeC+7gzUpBYmFPY+oqg4dYUdKarXLoAohPT0mt1F62Ap5MWAkgK?=
 =?us-ascii?Q?OVKtR4w1d0tybBu62YA9w00OmnOkPNiSYUtoRmiPhXF2PD8tQLx3CsobdupO?=
 =?us-ascii?Q?BFrVtO/RQUq9fchYS5HZX7ehnoh571FZEh5KvMXW6djJry1a8dqFpaxtUcof?=
 =?us-ascii?Q?1Ro7p8NkMQCNs0ZIefT65zPhPCZqRg3wmdApNmMDXtVxLHX+vo5JKsIOPicP?=
 =?us-ascii?Q?TrUsblkBJ9bi0MNnnUVPsHq2BB9waUSnVHxynrAx9btoGZUIebULsmU97tgq?=
 =?us-ascii?Q?8dcdOdUz1QWs+RQ7nnPyQKwuzJgCWnq3D4OAtCcc/P3A/mj/SDsIysmQF5lA?=
 =?us-ascii?Q?PFRf8MMW/bvJ+3oasx0hw5G0m6U5l16id6ZNrwL8KcCquTPPUneUyOlhud7d?=
 =?us-ascii?Q?yL4IdfGyh1nNlh4O8JSohj1yKOo+9ZJV9hY6e/UuWfDyAwxIYD1edmSPgQE7?=
 =?us-ascii?Q?2RvV1dBxYoxBIca5zWfYPw+GaLyoIiQa92ig3MDmNeYjAucN0XTYNsNthaQO?=
 =?us-ascii?Q?hMlTZK5HVuBeX73MW8tI+4pmGVg1wWIEVsS+h8euyOR/L3GMG+RNkKhTjarz?=
 =?us-ascii?Q?Cn+iBjrVZyknQADsEjZXkua4c2RBLKrhKvulbnmjer9SIKfpVup3glXKwahu?=
 =?us-ascii?Q?IOsfCPnwRAOTNllsWt2W9WUTyegwZLklo4wHIY3yrkoxRfb5MN32FuKSEKiZ?=
 =?us-ascii?Q?okYsq9b+eEzt+TlE/XBjzntWbk3hvnpTYQ4A6xtDrTDM5k5MkfCymuUrQF5e?=
 =?us-ascii?Q?By93nVjMzfYaT+iPwY+L1YVQS0kBu5KeHuEB/Ddd0AX7A+idFvyljoOK3JBi?=
 =?us-ascii?Q?6vfP4xIm0dFt5Hi9EzLueoAZKJVdUA7aqiWCsDXe/YV+PpmzAj67bKvHtIqc?=
 =?us-ascii?Q?2x1t8hbtrx8Yc/RSVyyE9T8HgYBfLm5OogwH4d5K3yGgqcYv7szBKL7n865c?=
 =?us-ascii?Q?HbI4xzCPSrB4jiYS5TWUG3IaMCpJ2tfUHp4Ymqud8g6KcFvaREVQAZN7nCvC?=
 =?us-ascii?Q?kA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8606c091-3c2e-43ae-357a-08dc1e7ee3c2
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 14:55:51.7252 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8B3ZFR0iGGAEN5rdppP+0A+mzqcKpRpkH/cD0mpIOGn5kSTS66DJFMS0AsViVBQz99yyQeL9cJGqj2EdWrMhVGyHEpxHsCiXtmAcytFASs4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6101
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
Cc: igt-dev@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Jan 26, 2024 at 02:14:34PM +0100, Janusz Krzysztofik wrote:
>Hi Lucas,
>
>Thanks for looking at this.
>
>On Thursday, 25 January 2024 18:25:55 CET Lucas De Marchi wrote:
>> On Thu, Jan 25, 2024 at 05:52:09PM +0100, Janusz Krzysztofik wrote:
>> >Instead of wasting resources on reloading the base Kunit module each time
>> >a different set of filter parameters is needed, try to write the required
>> >values to sysfs representation of those parameters.  If that fails (e.g.
>> >on older LTS kernels with read-only filter parameters), fall back to
>>
>> we can't really execute anything on LTS kernel.
>
>Yes, we can, and we do, since modules of DRM generic selftests like drm_buddy
>or drm_mm and a couple of KMS related ones were converted from i915 selftest
>format to KUnit and our IGT counterparts that load those modules and execute
>those tests were updated accordingly.  Maybe our CI no longer exercises IGT
>tests on LTS kernels, but the community may still do, I believe.

there's very little benefit on that IMO as these are tightly coupled to the
kernel side.  Distros don't even ship kunit enabled so people would have
to build an lts kernel for that.

The way this compatibility is coded intermixed makes it
much harder to get it right.  I'd rather just add simple skips or add a
compat layer that takes a totally different path if compat is desired.

Lucas De Marchi

>
>Thanks,
>Janusz
>
>
>> I don't think think it's
>> worth keeping the multiple fallbacks we have now.
>>
>> I think trying to maintain compat is good, but I'm not sure it makes
>> sense for these tightly coupled tests with the kernel.
>>
>> Lucas De Marchi
>>
>
>
>
>

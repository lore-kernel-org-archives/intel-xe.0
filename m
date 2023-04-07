Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA936C77B61
	for <intel-xe@archiver.kernel.org>; Fri,  7 Apr 2023 14:04:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A53310E040;
	Fri,  7 Apr 2023 14:04:59 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDFD010E040
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Apr 2023 14:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680876296; x=1712412296;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OoYHuFT3Kz6P3LbuCxu7u3r4+zbsPbV0W4Sk9zS0mCA=;
 b=he6Mr1GcD6EvTibHBmhgal/DCtLgZGK1iuqJtY/xa5U0bt+stXXo1IS3
 GoL5EFo8HiYfF9zBnUZyp98uU0EANKQPEXa6WHUmI4XDvsfycYsTtyt/C
 pmm9CpEtUoy4vl1CRKxP4wc3VIlyMn3T+llGrjcVv7CkSeDwj9WDr41qT
 9U6xf4ibT42T/NCtDcITQy89FcfiZvpt2HlLnmmv7imWXPPobP2W12BT8
 Pwu9Zmp90P9FSmZuH7S/YmKTDl7tBShSp6rFKxvqT51QLvPAoUj7XHY29
 2b/V7YUFjz9v94soVZVuiFoIOxykYocZkmQlr/N2lBNHspq4Qxpz2TMn0 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="323361140"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; d="scan'208";a="323361140"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2023 07:04:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="933596143"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; d="scan'208";a="933596143"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP; 07 Apr 2023 07:04:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 7 Apr 2023 07:04:55 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 7 Apr 2023 07:04:55 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 7 Apr 2023 07:04:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bh9YxvDUeuvaWDChWTnxos4RAhzWQsF5gdJf8uTB9HyTfkZ8I3+laTUktlMKwQ74PIoap5HRoNYf+4Nm5eA8x3VbQNCa6oCVlFgk6g1GsTiBYQZFHEiC9IrwpXpRL9tSiW+pZwOsH1y8UMvBzYsdNYIuDkQD/kgj1t0b0bXmoAL60zDZ2/7/jdFI/TOH/d15qLxl2gRSzanu6S+wcTbzKLgEr8tbL/lboLf5KJIfv8Q1YBBGudII8vH/k2fjNc8ACtm55i1rpORQzPRDBNW2bErfqpvtGiDmQJqMe0+Euv9Yaq/ARtUswVp/65JuY/H6FRM19aERIawVzPNOtvVepg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/WNWlt166EKwvJiWd9/xMTEdinnEh5+0OInAYblY56g=;
 b=FqWTGh6tAhNNq4Dc2yLNbAdLEFX/jWIAs20jUi6X+uuAKEvZjx+Wn0UKXjOKz8nZAE4Ksq+V+JcTNrbuCvAZtXjazBqzy5DU609DwUMitj1WF1ehvQd2UNSu1820wjOLLIs6yZI7lCGaL5vhsPRsr+3BPPM/ROTGDdbUlG89/JUaONXAm+TuJeNnyD/Tycqz4osTkJgzISkN0RayDCqoCHHgSb9wW8/ywgjlPTbYwjXhO91ONiob0Z8F4p7g7xRtZ//zQUnTHUjygvSFSWiAcpUPG/bs2RlBshBBjhphMJC9XJS9olZxwFDIxonypuaQuWxx4UCBBzd1PEqVFv9oQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB8041.namprd11.prod.outlook.com (2603:10b6:806:2ec::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Fri, 7 Apr
 2023 14:04:54 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%6]) with mapi id 15.20.6277.030; Fri, 7 Apr 2023
 14:04:53 +0000
Date: Fri, 7 Apr 2023 07:04:51 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230407140451.b64s2algaeb2eqvs@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230406235621.1914492-1-matthew.d.roper@intel.com>
 <20230406235621.1914492-10-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230406235621.1914492-10-matthew.d.roper@intel.com>
X-ClientProxiedBy: BY3PR04CA0015.namprd04.prod.outlook.com
 (2603:10b6:a03:217::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB8041:EE_
X-MS-Office365-Filtering-Correlation-Id: fc0336f3-f377-4e46-1743-08db37710f44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d6LhMLYnwP4Xs5w/RnTLjwhAjLPFdc10GsrAagbpNSObwx/3JfxsPyjOcPAVKLtCHwxSMt6hYuqBej2uttflyFGMU0aVzaRL9AZYEy2gv5lpOQZf944bihRnjVVncM+hSj44s4/ryCTRbVERx73HkP8e50uXUMSDOsDf3XkAQ+QzvAinJhcFc3vuRZ1BwjrWPoEHu9BTOBGGLmINgpNgenicTdJMmgre6MewdjzqWrI+YLM7/wAsy2wF7mI8Dn7t66khMOqy4GPmdpot3s09ygbvGvNn5NbYZ6eISLQSgG+qmnStKhqs6l7hxaBxU0kwz7fSoJHnU9otjmYel31rKtqjjse0wv6dUHe1RaGou35GymkNkEh7Gabwo98ApjGvyZW3B3UXSZplzcUl9oDdtTnSg067lGd+1LhFa91TYrAlmyhFZWkDlPgrOBx8ebdLahawPkBBrfZL0i9IA/5f/xqG65i3anNt4IpeNc3sXro1dAAOtslcVggId9IMFP22is39gB5WjqJ7igzoFjXr6UX9GrpLmLcwTDSzyCvZ4HAXoo34ysM4O3TIRVeqbGC4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(136003)(346002)(366004)(396003)(451199021)(86362001)(8676002)(186003)(26005)(1076003)(9686003)(6506007)(6512007)(4326008)(38100700002)(66946007)(66556008)(82960400001)(2906002)(41300700001)(66476007)(478600001)(316002)(6636002)(5660300002)(6862004)(4744005)(6486002)(8936002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CIOhChqwKhaetnEqVCgqrm2/akT5TO3BtH1VzMPP5hnfRYJC1e76+RqsZEVk?=
 =?us-ascii?Q?QpltQAD2fvx0gH4X+SDMcobJvzZZScz5qsC/68qC+vvcocVaatGAMXZSQghK?=
 =?us-ascii?Q?pOrunDv4B6qBuwRZfKKtpLDghCth09JXP9Z4lBo26rm2zn/bQN0jtJbPDHIt?=
 =?us-ascii?Q?KIGhpNUjwJGirLDIWuMjhE7RSKu7pnykmRmgDV8xmtf+NplS5MgAdrTs67Yb?=
 =?us-ascii?Q?rGH/JmoyHcXuJRE+t6AlIyQiv202DCgtgN339dJy7zl2J2F3vSvj84rBPyc5?=
 =?us-ascii?Q?1Hx5d/GCMzTQ0fgHm+/q7JrPMh1p/XqYnS3pIsyf18A4m/JXBx3xOoYQcl9M?=
 =?us-ascii?Q?fGMak4sla6kQXKSLB8WQLft/xCtZ3vcOTyLjQlhOXTN+r1ez4NNFDb7jWBJf?=
 =?us-ascii?Q?iXelh5qf/3Oq2qJjD0J7n45iiOYMZySaHFNyKFlMGBliad15gUORJsAd2Qqn?=
 =?us-ascii?Q?Ddv7WQeVSIc6mj2Fl0uWS8eS6rpVzHJfrWmqsetLYV+hT6abYhT9K6mKgNX5?=
 =?us-ascii?Q?blHVqs4nrwX0iRPP9Ji4JPKodf+KoNSTsuBrK8+KvXG8CZPUDwjnJPv6mTmP?=
 =?us-ascii?Q?eT0aylJnl8wZTG23k0RBsp9TQTeTUcUUFTa6VL+UQO0wDdMZo6SUWZbny0xV?=
 =?us-ascii?Q?37VjJ33bwspOEWDSzZWN3n3e5Eom69kK5KotVma9quO6quF4Ee3S8CgUNaUd?=
 =?us-ascii?Q?e4/ctKfZ/P5spEifMUNCqMEFqBev6Y0f14q4NBTVHshsQRNs98+QuJLuShqd?=
 =?us-ascii?Q?Kyw1OH61Ch9ryC6yp9bxdPzYCrLWeAuFDz3Q2ysJWkk2sWino2oUiDg7kzrf?=
 =?us-ascii?Q?uqVFb3IG1MTpO29pXYYCVsHUTNUzhHAqht+COZxmjmGOIw0/voDLWgYtm1Wb?=
 =?us-ascii?Q?mnuX9OR52WHQM2k9Q6Oi+4pTcfEoWQ/Qv92qDSpuqjdizj59lPGK0+C2nae2?=
 =?us-ascii?Q?C7Hpph+KctNr4j0KnAT+mIEEB1nDyzY+bffkvGnqCECCavAAgfqGokf6W9aw?=
 =?us-ascii?Q?nRDhNk5SG4CEmaXi6PJdio4rnkCxCd511zzmIVqvFl9GbpGSM/ArNOERvI2r?=
 =?us-ascii?Q?wnwv58jGVP+LisqkxKbx0UJvkpVSyBcBxtGiVxbjASNvyczAsrqmezKzxY5r?=
 =?us-ascii?Q?qB2KKhuaLmB0WV+t3QPZVySgWyFaXKWZtIcxpR4wOZr1p5RENhk0tDfupPzR?=
 =?us-ascii?Q?B2o1nw2igMZm2Z92uY1MYkQ4bxj+2P7tpZ//Xx86Z5NIYqprz6JxOb4h7b2X?=
 =?us-ascii?Q?dwrAX/UEl4W54bvrqltswdm/AjWDU+Sc/czSV3htLkPDo/oE84NXk6y45IS8?=
 =?us-ascii?Q?KCJQElMrxhnmcQhj40Kga5WHMDx4GpZDwiF9AOD7yI0H5yOg89PlxB8tMhZ7?=
 =?us-ascii?Q?QGkgQpWi+TL8p2SQqijQasvNnVBrL0WuR5MRILhrQvJGgPPea7BpM0CvurHl?=
 =?us-ascii?Q?LGewAb1FO6/WlYUhENbi9Nxm4vs8LJCpeiYc+KOz80M5OqMMp1VTydG0wsfm?=
 =?us-ascii?Q?EIQmiM3ndxSwvB8XATRdmZWgeX2cQ1YCOP15K/pfZ6vbhsMF328yF8MXQ7TE?=
 =?us-ascii?Q?tFqbwCUeNn2c4sLUlmvl56DZBlOlVSqhOGO3vFMp1so1+hVh/j3IkUExn8f9?=
 =?us-ascii?Q?ig=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fc0336f3-f377-4e46-1743-08db37710f44
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2023 14:04:53.2555 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JbdfO2ARKb+Df3qjEFpntHuU3lCmRifmIy8lvjFoMWEwPtRh/LRCZyK5AwgphQdBLdbJl5yyv1LeWtOJJU7P9WiZWdvIfac9WvOH5gFsDLo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8041
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 9/9] drm/xe: Clean up xe_device_desc
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

On Thu, Apr 06, 2023 at 04:56:21PM -0700, Matt Roper wrote:
>Now that most of the characteristics of a device are associated with the
>graphics and media IPs, the remaining contents of xe_device_desc can be
>cleaned up a bit:
>
> * 'gt' is unused; drop it
> * DEV_INFO_FOR_EACH_FLAG only covers two flags and is only used in this
>   one file; drop the unnecessary macro complexity
> * Convert .has_4tile to a single bitfield bit so that it can be packed
>   with the other feature flags
> * Move 'platform' lower in the structure for better packing
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

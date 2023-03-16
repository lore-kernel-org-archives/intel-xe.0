Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F696C6FD19
	for <intel-xe@archiver.kernel.org>; Thu, 16 Mar 2023 14:07:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A5FB10E268;
	Thu, 16 Mar 2023 14:07:05 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE9FD10E268
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Mar 2023 14:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678975623; x=1710511623;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qPLhQOdDEeth087AphUn4CTiPl7qarYck38p9G2egJI=;
 b=M8fHRB/cHBz9xJO0ID3uJUcXHumQUA9ATVuVr5E5X93b1LA7x1SL4nVY
 /oOctHOQyKF/FHUpPNFjaY//XlVZnnucn+0vBqaqariD7w8+ZRuKi4pqM
 JNliazYrIMhNrKeTR9Nb9bkV029dHzL+7NjBWd3poPNvZ8GCE96pHrgbU
 EGMWDjpyFyH7UmZT3xV65xsd/7sSMNMTPpq6W7zCt7Y1EFAiCOKs9uEO6
 rf4gJ7nyGtI4ZjLGy6kFIUz7ZkAUgqMfrk2TR0BtdutQ887QWFEbUeZYN
 MMkz+WsvWQxfw/E4fpFT8H2KjZajF8NddY0YvXjS6PWvh9/uYMsAzmTHx w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="365687714"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="365687714"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 07:06:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="748888062"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="748888062"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 16 Mar 2023 07:06:56 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 16 Mar 2023 07:06:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 16 Mar 2023 07:06:55 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 16 Mar 2023 07:06:55 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 16 Mar 2023 07:06:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U6Sey5x7w07lqlwtxfrmjCvECIqPgYXvLcPiMjL3rWynm0VwfWnQZesXxfRadnwYiaDveOt7pn0atBXl+VUfcPYM934tU0hv/i2lur5G+Fk3CIEGjj0Ce2wDPtphKPVfZzTygiu5aOZvUhzZsHZ4AeRzYNp0gyKKqh22rSBHKEuOlJaWo7+HZ5YBFT4t+MFjGCcoFfg2VYF9ZnXCmB+vN7nmIPo7IM9/ySI0UbQHwsRMnYi6soIqjoQ+oe0BmE1TKvZOOccYjlJjh8zlVChLTrqxstaGXS1Ft08vaddW5euWtpM/kgHKgfbEC9Y8QlO98BcCt0g7jHHX2MI5CGZedQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=otTqeqh6qz8Dj40pc9XFf1NGmxinjduJvs6k3YlgAAQ=;
 b=Q1g8FVs48oRnxIwGuKWsJ1fE9JeDxJT9xfsTgmTA94+heQyWBnYwVvzORzeutHVRajJ2770TYaaH9TZrZTfrAIr6nAld5cDcl7+CJb9NrC9lmd7EkXILNO7E5DY3cGhoXhyCTinArArc7a2IAbLItl4SU/oMgkEdDgUERYn6RTjq8SrEIPf9I0MTRUDhWeXGVfgfPXOfiy3p5Is+/W5kE+HoYWTFG8yK0PizsBV9WDEzJICOZTfHMKh6jCDO+B3qg7AmO6kHJMET7neJNyIpmGB1TtXuDtpgV9UKIVSSI76tlPXpw2bZ1ZvvBMlibZ7dwsfqIgsqYPE0RN4zS4TF/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB4942.namprd11.prod.outlook.com (2603:10b6:a03:2ac::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.31; Thu, 16 Mar
 2023 14:06:47 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%4]) with mapi id 15.20.6178.017; Thu, 16 Mar 2023
 14:06:47 +0000
Date: Thu, 16 Mar 2023 07:06:44 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Message-ID: <20230316140644.nav7kebd2c3plckr@ldmartin-desk2.lan>
References: <20230316110752.129831-1-maarten.lankhorst@linux.intel.com>
 <167896599936.19096.18035302423700589234@emeril.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <167896599936.19096.18035302423700589234@emeril.freedesktop.org>
X-ClientProxiedBy: SJ0PR03CA0360.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB4942:EE_
X-MS-Office365-Filtering-Correlation-Id: 754fa5af-b86a-425d-bd97-08db2627ae48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wyLdbuI7gVQlOhbji2M2d0mafjBreHoP2SIoC/g4Dv+UVMZulJyeKjsL95OYiASF2HmTh6io2NZuoVcrAV2yXTahkx8KjZG4tc3BTe0J7P4702YeRHH1TqxhJrIvY53kQGf9/oG8jU65NATB8gCXx3YEV/8eVA4LJt4qSzwHqYAubOXYjv3CWFDVifqs8ov+WX64kEHy1YsrTk1WFIErzIh8w7ZVlnTWJz8gFwDmz131uZ/BTP/e6uMB+/9M7eu1Ayvz9ghc00mW4wk4aCTNSBzNxmc8qso+mUS2AB89RLILUfD1RusRY2ciiwPYdWHgLp/BKbKBexbR43WOdD6jQ9ak2n4Qb18GKZeGsz3ttUFCWYXQzvHOUvNeNkiADxY03HbBqnUET9uX0XbjztqI0gAX0OcW2WV0sKQTQx963MFPwWF3eAg+Kzfkjz8o0isWoOAISqCwihiHBnWXHeQbuw4gFY9TtD8FJXdytjXHA4rSNPSjMFzNrzFmosxMp7rpwMXgnZp+sEqImJaFdBV+8ISzCi5VEmYg9sZdHV8dWpDbqxLDwq4oJZ2SezgjZL8yIzYFkujvVZpUdtrr9flLguk9yJjhuWNQhYD+58ULeTkjFKd4GdF3eonttHd2QbGg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(136003)(376002)(346002)(39860400002)(396003)(451199018)(36756003)(41300700001)(4744005)(5660300002)(8936002)(2906002)(38100700002)(86362001)(82960400001)(478600001)(966005)(66946007)(66476007)(66556008)(6916009)(6666004)(6486002)(4326008)(316002)(186003)(9686003)(1076003)(26005)(6512007)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wiMnT6pJLy/sOOHoJfdUracJPisUl+X2Rj+Avhqo6wAr64LxK8iddZmjkmrl?=
 =?us-ascii?Q?hKzL84MHZw47KQOAAddQerMB0l5Gj2U5wM2NNH4nQXY7COZ2+pCckI7C+rPG?=
 =?us-ascii?Q?7N1ZXCNUG7Jv6O9hOuQcvJN2ScvwokFSz/aMrbh3qql0LlnPpgDl+b3S0JLc?=
 =?us-ascii?Q?M3djLaZqcfshXNrMQrllCk1/OoU8mfmbwdDmXv7QL9kw/XddmzZkmCzgIevz?=
 =?us-ascii?Q?AQ4+oXaZiR2a75wn1tOAIqi8GCWn5SrM7IGkMWgPhf9CGcEuYj6zde6DoslT?=
 =?us-ascii?Q?zCkwaQMwR0MzZmdpgazuv59P855dfOo2448IorvyC5tcG2Ubzr5HIC+6gfVy?=
 =?us-ascii?Q?YQXUWKbuhtljjQzqt2ymSC3ac0CjhpN/DaelNRhLpCsYvQa34T0y6ZG1KVbQ?=
 =?us-ascii?Q?L81PYz4m6onGRS/z3vNqbCGDMgwLsFqKd0Q4/uJbJK2URU6w+GlLvt+3b23d?=
 =?us-ascii?Q?7i5DtSblYZmFpZVfX32qMxdNPCSEmUKtwnfX5MjSoZH5kM9gclyGK1jVQTNr?=
 =?us-ascii?Q?vsEQnXEPo7fSJsoJ8J8XelxjIkeJ7MpZdEg0aMdmii+gVhmxAsM+ycPTY3B7?=
 =?us-ascii?Q?knb0Fa4z53phz/OLRXT53ld+devLxWJWAfDJP+XC05cyBT/qZ4vhKFtnQK1A?=
 =?us-ascii?Q?WJwIOlfcNLhv3BYf2DC2rY2x8q4/WaoEwCK6tzxkUEdOn4ExAszuWUrjG0d5?=
 =?us-ascii?Q?zmqFfGjyLRb+IUVT06jHpae/etp42Rn08K3s1fq/GAe20Xp6ZZhM6KIO3pT1?=
 =?us-ascii?Q?vY3KFjZDh+/P1+zRnwuQWhruEkUKKPdmaAkrdQkLM+u1QfddprLSrFCquHrL?=
 =?us-ascii?Q?Ll4DdkdtVf7d532arbwYzL9QOjkqLP/n2SiQ1E9R0yWiwtwtF2/HugLpUSRw?=
 =?us-ascii?Q?Jo/yersgwWNas5oI3fzwD9gH54/EIfgSo/A2nBODxMD/WxKU3rTzh5kSUhsf?=
 =?us-ascii?Q?DdMLKDClGcjoBveBzVpbog2U+HErNM2QVvZrNW11xAxoJ73JpEbUZ385pd39?=
 =?us-ascii?Q?2s4Cm7AcGAEoIoEQXLg9bvEDMiM2rDKXsR94I2JT3+dIGEADszmOO37Xd1Bz?=
 =?us-ascii?Q?Ms1GJ2VjgPQFMj5PSeZ/fYEsiQrixZM4cRf0esM3cZSIfFyDpD30LL5GQPGo?=
 =?us-ascii?Q?Fl8t5/lRC6I9uMpWMpY1dHKPEfKE6jSMaw8WgEhoCm3pGPufz+26rYuTgpE0?=
 =?us-ascii?Q?nxxx/d12un29u1oYOmDNqfmDQfU0QyvOO0O5GyrsgjNgpFMm6oAfwgVOIzcc?=
 =?us-ascii?Q?B5oMd9CcLPxyw6yvY/cuMXO+dGBsNdm9BzOvoqY2c1mMLcM8EcE5828fdgmi?=
 =?us-ascii?Q?zs9wD7HfkWN+/rB2zwEZL/D24mPGDoIYXXdwnyEWF1Gom8DaPnDWmpJDMQ6H?=
 =?us-ascii?Q?0XO6AvklKd2l1IT2yNquIZtD8WJw12uPRbFQ7OfCBL8nR6Y4I05yA2H2yt8p?=
 =?us-ascii?Q?8QCCmNObprp4nUUmO6yNxLdgIRRuQc2rOw/oPg7wA+bBIFwOHeZ+1WqA8Q79?=
 =?us-ascii?Q?UFHuiOsia6ArZMMAut6gAjls90mm5h5JBjf0I/ddl16TJVbQnzt1v1obfgUd?=
 =?us-ascii?Q?frJjIDwhq609d8lQqnUvXGMY/fcDakILqY40ccpjvJKISspkCYI3gvoZYqPR?=
 =?us-ascii?Q?LA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 754fa5af-b86a-425d-bd97-08db2627ae48
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 14:06:47.6545 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F6QNTh3ZqECgzBgBdad0o/aDwqQwV8Eu3T1Dwdxw4+qfGA0K64obiHg5KYt4Am5cxSY0brt/N2HTsgdnMsYTjaD9ByxaQTnl4YpxwUDuzcE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4942
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] 
 =?utf-8?q?=E2=97=8B_CI=2EBAT=3A_info_for_drm/xe=3A_Fi?=
 =?utf-8?q?x_Alderlake-P_and_DG2_display_info?=
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

On Thu, Mar 16, 2023 at 11:26:39AM -0000, Patchwork wrote:
>== Series Details ==
>
>Series: drm/xe: Fix Alderlake-P and DG2 display info
>URL   : https://patchwork.freedesktop.org/series/115255/
>State : info
>
>== Summary ==
>
>Participating hosts:
>bat-dg2-oem2
>bat-adlp-7
>Missing hosts results[0]:
>Results: [xe-pw-115255v1](https://intel-gfx-ci.01.org/tree/xe/xe-pw-115255v1/index.html)

great, now we have ADL-P BAT green :)

Lucas De Marchi

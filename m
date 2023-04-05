Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A069C7619A
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 17:30:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FFF510E148;
	Wed,  5 Apr 2023 17:30:07 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95C3F10E148
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 17:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680715805; x=1712251805;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Tkpp0bCN4oaSqIgyPNqTsZIE3mdpoSyf0JK+WEtGMO4=;
 b=Xobjq6kGPE0MYq+Ripm1Dyzi0nRYZGrZX4MR2/obiseRCZ6XTupEY6bI
 E35LR/RRncZSaWjjHEjSm3OhOx3uZ0JzwKLO7oEM2Mc9MnS6sWGuwjWOy
 eVs9wraEszvkaZc5HnJqbh07F1TkZZiCjfQ32GWnWriDXDC+c1h7Oi8bz
 M9KKfO6XjQwvpz6WnIS7EHDyRqi9gM72gVSGPtVL2+D5FI2+Mdj8mpYAb
 nWT3DOUU8n08MAVZ3oSkfla7eVrCpgCGAuPKBZvQvzGHcGeqhkjEeZaR0
 D4CYPjk2jxjH3LNszjqcsAZUDhlqDkjlCMvrIWbODScJaMnov52J/Yndf Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="322170975"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="322170975"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 10:30:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="717123013"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="717123013"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP; 05 Apr 2023 10:30:04 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 10:30:04 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 10:30:03 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 5 Apr 2023 10:30:03 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 5 Apr 2023 10:29:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=USYcz0sW/C/4lzYdbnxtfkcIunZIENviu29mFwZNEaUmoKvCGLncDmv9OE8enA4KUTxm/BXdpXJnrt5bLJ7xtCZOLIfxCA5sKuQVrWlc1ebgoeH71Pvqg0hvvHpxK14CxP3tqg81/0rSgc3KxrNb/HMCGGh4caZEZFidGTtlhcn/q/qGCRy96qZfZ0p7nsElJt1TM8joQ13buNR3wEBxWwr5iA/HFFDEIt/2d8bMG6CDeRxPVVHpBNll2oXh0r+gKA8sjKTCluBqrJz3dmC0/8fHtUfWpFbM2lexkPBc3ecSepbDnxPg9R+d0AkoOvwBXh71w6D/ddv4r/IUdlHWIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tkpp0bCN4oaSqIgyPNqTsZIE3mdpoSyf0JK+WEtGMO4=;
 b=ULIo0Zt1nY+uj9GJkwLuPDZFZ4HaMi1duZKfwJ+Q+NQ9Gd1vniVUiBrfhgoSW1QJES8Y2Ak9WUvlaL+kl0ovG3edsroKeGl4Cp8imXqVOwPUsRClEd3OTGF/TEKfyhl4aIV2v+Yb5v92QMFRb9p6jL6DTYzdYfgqoJZVkJXroMEPFaUaf39t8iTF8FC+nSIJ9k/cWVlZflXr+7FYMW8fLrZZuWXnU4/iTT+rh/F4CUKKp1rYsNzmWbY+9X0F7Gt1Trw/Sr7wtR98xojUqipSeDhEGZtjYbls216bYuPk3tXxjTkmH4QdeAEi38aDfegm0SauUzWxyKAHfULzL12Gag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN0PR11MB5964.namprd11.prod.outlook.com (2603:10b6:208:373::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Wed, 5 Apr
 2023 17:29:48 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%6]) with mapi id 15.20.6277.030; Wed, 5 Apr 2023
 17:29:48 +0000
Date: Wed, 5 Apr 2023 10:29:46 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Chang, Bruce" <yu.bruce.chang@intel.com>
Message-ID: <20230405172946.6oygrokx6bbwf5qb@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230405171303.525412-1-yu.bruce.chang@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230405171303.525412-1-yu.bruce.chang@intel.com>
X-ClientProxiedBy: SJ0PR05CA0114.namprd05.prod.outlook.com
 (2603:10b6:a03:334::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN0PR11MB5964:EE_
X-MS-Office365-Filtering-Correlation-Id: 688fa077-8749-43ab-e6b2-08db35fb5b22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v7Iu4bCTTyAYTTtBUE4ZW3LWDPeRmd14xYpslCaBTkZ45ZG2iHyl/gbZhncJ3sZSJ8exGJ2BP7LFUsuwhd90g2d222CWc/d4BtXYBVX6FKpkTj2e2gaFfkCcm26HgA/sk2o9nHTWtW3Mo/Q0HzJWj/PnpkXGNwdIbbcjfEXB2bUp+r/VPJRh7czk8GeBKKIOoonRp/qM+fD1WjcX2G0nZwmyL4TRknBRQcJhGrW5cDsbdt3CEpAqg8QC2X0VLMW8jrjZuI2cFQzFLzTbqU40Tp3sAFV0BdBsOqHiACuPk+STWqSUf5dEioOJWIbqHWnH56dzfX8i+YLzU3t3kcDTt12PcoAtQ4syYrpf6KYwLqrw7OSsHJeLf8HtKZXRZut9ZLgQ2nu/jd3cM6pYPiIks4CgwaCFcmtUVtl7K5poPooV+0JLBYFvCGSknPNuGZLmG7WIylqHtZoGtc5kupAxaO9m6+XLqJZGrkD0M4FyabExx/LWO5qvbVf2gjL5srbs5fPsdjtOFo41hFMzuSRxz+qETbU9NKPlvOC529WZu4gAuwkXIusa8U23J3zXxSIJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(136003)(366004)(396003)(39860400002)(451199021)(9686003)(26005)(186003)(107886003)(8936002)(6862004)(86362001)(5660300002)(2906002)(1076003)(316002)(4326008)(66556008)(6512007)(8676002)(41300700001)(478600001)(6506007)(82960400001)(83380400001)(66476007)(66946007)(38100700002)(558084003)(36756003)(6486002)(6636002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xJQDcPOojsSTdGAHO7D+pgl38KYvek8kAq7soImok207qcQeWkS7Sp4G9IZF?=
 =?us-ascii?Q?6M2t8Udi8Kw90q9OHze2oFfbA6WHl8eyWK7VaOtvY1W+lrthFkUlr/gklzSs?=
 =?us-ascii?Q?sJUl37aL4KPo8enPYheVYruSGdUglbS5okgDwFOa8rBpz8CcoyDFQjttKC25?=
 =?us-ascii?Q?8sFQaKw6Mix1d9ZJax2gYXYdXRu7gLEQEAyPjhdKVIBsx9yRdmye6mDENzfp?=
 =?us-ascii?Q?3Tq0IbXprgGzLpADIQi6zrHYtvBXxfPFrGRW57aYfgdIv/MrXm/01Soa2AQn?=
 =?us-ascii?Q?hu3XlLxlHbl7sZLd2+iGLkFSJg/+9QjvXMRRSmcK9D1AD0MwuiAfaqR6sA19?=
 =?us-ascii?Q?D2cHTky/t9GrUoOZEuOiNM6pwZJsVEhUJtQqAq4DXv9TObKGkW8yDhnF6Fan?=
 =?us-ascii?Q?JIkoELtipwHwGAU34Wpm1XvuLKDT8m6G4TjUXw/s1XS66e9lyoFfenVM0vlb?=
 =?us-ascii?Q?Z0tQOMzc3pz+lM38G2ylmr+SFNVpEC/AosJRR81kQdQgMg6H9oU5daOqp5xy?=
 =?us-ascii?Q?q0RsFwshQpaM5pA4I43jJEsoZh73AMiFhWjXh5y9N6D+j3qz2I1f+6//mitb?=
 =?us-ascii?Q?se+9+WKa11TAsWycuSMQUSBegEJVkG5t8giwsyNchaREXR2FQgdszlGmuE/E?=
 =?us-ascii?Q?qD6DQdWtYRy0QbNpASWloxVyZnPJWo5BUgcUivZRYomQxqFjVxUN5Hcoyifu?=
 =?us-ascii?Q?ajcvy4B2INfRMfrob8OSigfbkObjuRDTaOkMLaarAij7eX+t5XLZEbDGTG02?=
 =?us-ascii?Q?soUkJUe1KNM81So1ry7LZxpJ3q4D0Au1Hh8g2JMQrBtzDPRlJ5fEkrFMxw59?=
 =?us-ascii?Q?pF0w+ybhvBl6aEigKiDjjgUVMWEQ/V5KJpNVQcAZqUUZD0B3PHjAPoUD9tlX?=
 =?us-ascii?Q?UzDKUfWltFP2yXFRFmButUvumki0GMIyfgJaSCKS3rZIjn4IfSJcZe0YBoCn?=
 =?us-ascii?Q?JtlstEUROOyVmy0lvMEMbpVgTzwtodBROkwmIUgCl3J524TkINInQXKvBCRq?=
 =?us-ascii?Q?OQ9GN+NcalR/fi45u0MdZhGa6sKHkftzqW7U5dEuPbYYTnaknz9tQM+USL8e?=
 =?us-ascii?Q?wV0AfDul/e6Rw6IpkKy50nDqOWz4t80MJanB4N0yGIUNmYkGTF1McGq7VpLX?=
 =?us-ascii?Q?OkFfH/TloZaKpS2ucwpUgy1gOniDP29B7nOllirpu+mAMQ0DHs8pGvLvzoiH?=
 =?us-ascii?Q?2cARpFyyhIcGgWXyTTol790y2FuxSkqhbTVc1Ff2vE6IrVInS9hj3jXHLHNj?=
 =?us-ascii?Q?OTxjrEsU0LXyzExZxAFwFZD9QKZgBR1X0nLioIpYUOF7MiiieogAHyMKr70r?=
 =?us-ascii?Q?cXvr0+GHol7hvZ9/06vDxAi99DaduD5Ji9sd+QDr2WIYzUHXSbXn/Ksl17Ut?=
 =?us-ascii?Q?qBe5BiCOWzx857FzSZlhoaVXL/5WPODKT1u7/HyCnys1CehdncrQoVFlUa6z?=
 =?us-ascii?Q?m3XJtchtE3q7UOlWHDhzyzvqoH6tlramN27y04Ea4roBw2FkxhVnhDopfuE7?=
 =?us-ascii?Q?Wk3VZgEGq+NozAji0eGwtRfbEiKkjx1Z2QsT15/sBQeAwqNve9KaYR2DKbN2?=
 =?us-ascii?Q?uTWP9628FOD6VdZKNDxpxDT14C/M8gXwGaxmMqAoSWtkLi2O6b4Zmye9aFLq?=
 =?us-ascii?Q?Ig=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 688fa077-8749-43ab-e6b2-08db35fb5b22
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 17:29:48.6779 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vmVgERbwOoOw+zbYMShR0EBv62hr2hsM1kjvo33tCtOOzPlbUToXnBMboTvOqMowv1SBtAG+JU071OjAA2xRjTBX09EQv+Z2Dm+e944BWsc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5964
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: follow up on the patch to fix pvc
 unload issue
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Apr 05, 2023 at 05:13:03PM +0000, Chang, Bruce wrote:
>created xe_ttm_sys_mgr.h as suggested by Lucas
>also fixed a compile warning found by Lucas
>
>v2: fix a comment format issue

just sent some comments on the previous rev, but they also apply here.

Lucas De Marchi

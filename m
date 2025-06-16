Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25615C71136
	for <intel-xe@archiver.kernel.org>; Mon, 16 Jun 2025 16:21:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9A5510E3DC;
	Mon, 16 Jun 2025 16:21:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mUpjgI+x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B3210E3DC
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Jun 2025 16:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750090876; x=1781626876;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=EM4LzAM95Y5LL/nSaRdzRqH8A5osr+ZFh7DxWtSL13M=;
 b=mUpjgI+xNhV269KiVkI46q3xfXnT2IYLmMpnv111cmfou5Pm/jsdKYQX
 0wsBm9oeP6QJ5b/FHzeI2Wc/RO1e/q/b9StpUZyAiaJWfzeALMLqeVshW
 WfyFDkbsyw5oYB+sxlO1dtF+fGmLf+lNO//gubRjeelxBpA4o5iXudhkL
 SnuC1AQ1uNfF7noER11WW7iZn8Zv5SoF3YNSU3//Sic9YcYuM7wZXrz6n
 wfqHRehSxUyklCrCuraBl/6vWei8UYcZKxOIGFBK807q9leAZl+Fjf7ls
 fqzX4RqO8hg6tvSHpTKtAiGPuCGUxkgxGcmQWXdzPfcvXU8zm+0CewPtN w==;
X-CSE-ConnectionGUID: IoQ4Cz6NSNaNUeQH7vpuCQ==
X-CSE-MsgGUID: O7kOCkzpQIWRpR5EeYdWLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="69685370"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="69685370"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 09:21:15 -0700
X-CSE-ConnectionGUID: gHEIcPe4Ruqv98D7EA6F6w==
X-CSE-MsgGUID: pLPrm2laR0OAYMwxlkaLzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="153817203"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 09:21:15 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 09:21:14 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 16 Jun 2025 09:21:14 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.60) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 09:21:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ugcj05ZrMaW71isAy3IuJNGSYV4cNzJ08KtLMrpaeSG3OQ3GMJoZuZCJLwdK3tN8xNyeeFbWkfrZo/7FXBNAHHhPUr/mf9zLIaJ1WfoQ0Tynby74u2Uf/7dFaA2rxuJ0UpakDi4IPvdd0mywWBvAMPt5av2kjGeloLX9ztBPiJp1r6Oqv1OewCSG5KpRK2T8lJmPVxxiasD/uqfHYgsKmijCtV5hJUD2Vg4TQsnmegLN8QijbJgRU27+ezLbHDweZRuYEqEixrWJnn65RI05k2XjvgD36m3IcbngQX0av/xmU7AKOXCDGgt5b35ZtiqRPlk+scgOClzdlJWi9PzeOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uIkKIETxcAQ/wCSttmoPPRzaXGo6uIlQ7NAO7cfIB0w=;
 b=AxuM0XWKXL+hZhJz97IstI0Ic/PK8DqVkSwArAZm9xlkTrUjOFFNz3rjnSXFX4tA/vmndFmyBt9QME/fLvAQigvB0iQMFc4Qm5UFt4ieQ0Waa1hLKxuHdjwZKU+tasSy6X+8j3wz12HgtqUPiVZkG7zH87NZnjnxQFMkqVhViQSjmKjOAOOAAMDFVkE3H3BciQIW29h4l/HLsVD0ugd3Q9OrYwoWa++Gk22i5mfON3HYyHMvbnVuqEbFNPe4Y4rVC5Kx43XsHTh+ub50DpA5eQQxiMX/fzm85TjKJeR93018hMqEv1AOnZyBoT+QRtYblB51bPwi5VWUhf2DQCtq8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH8PR11MB6802.namprd11.prod.outlook.com (2603:10b6:510:1ca::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 16:21:07 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8835.026; Mon, 16 Jun 2025
 16:21:07 +0000
Date: Mon, 16 Jun 2025 09:21:04 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyTIFhlLkNJLkZ1bGw6IHN1Y2Nl?=
 =?utf-8?Q?ss_for_series_starting_with_=5B1=2F2=5D_drm=2Fxe=2Fpat?=
 =?utf-8?Q?=3A?= Determine ATS / PTA programming during early sw init
Message-ID: <20250616162104.GZ5080@mdroper-desk1.amr.corp.intel.com>
References: <20250613214751.792066-3-matthew.d.roper@intel.com>
 <175004261243.80558.18033238985770038249@1538d3639d33>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <175004261243.80558.18033238985770038249@1538d3639d33>
X-ClientProxiedBy: PH8PR21CA0009.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::26) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH8PR11MB6802:EE_
X-MS-Office365-Filtering-Correlation-Id: ec752ee6-d696-4e5a-2620-08ddacf1cc1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BkPXYtOnjA1jTtb+pU6xdcYgg5RJbX3sNvzfleeo+503fOWUijoKfkVTmBtH?=
 =?us-ascii?Q?HNVa1zlJx6DP0Gp8OAMnrN7wvC/5BN8YTrkY7nu2g0Ca1B8gtMfe9VodD7GD?=
 =?us-ascii?Q?ZfF7fUyXTupRiXZhMEeQWZOp2W6YZJkPxBE58It8IZyWvexjUCftXll2CJGp?=
 =?us-ascii?Q?Zk4Wmob5oMYB6KPOq7xFO4SwK93ifzAqZaYwPjpjQn9kcCNAkuG53jd+WXMs?=
 =?us-ascii?Q?wS7kzoPMqtuoKKFr9zmoMQq0LKMXFxgpye0Uf4F7WcAK45sOpFK9bmPAEgpW?=
 =?us-ascii?Q?wFRQPY28pFU7EgtjvkbD/Ynf456beTQTqISCgGyiMiQxzNf7AOZ0Edmage6j?=
 =?us-ascii?Q?wSGdcQBLFDOjF7R0nV0ZKivJXig1ceGkr4AJfnzAvF7PFsZPDjz67LBIoQjr?=
 =?us-ascii?Q?+laD0Yl1uLZNz23D0cGN4P6n9z2ysjMGVlaq3X1zNkCbrz2MzAYTw5186dmM?=
 =?us-ascii?Q?q+pEEJr0n8AJMRcSZ8N2qzDC7EmJg3h/GcDGfMdT0zr8pu9/Oo8HnupF3ppl?=
 =?us-ascii?Q?jCoOK2FOBZJrGLRLdgNfMmdaHJf3BwU+b7+JHPbJ7+OB1t+H5aAYOHQEcW7K?=
 =?us-ascii?Q?AL6L8tsdftAAZjerilGXdGtGNskDb9Qi3W6YmYTHFolyLr9qjcGJGKvoxfEv?=
 =?us-ascii?Q?fhjLqJO7cQVoSNPcegHipwNCCTKAmZK57tnLm7m++wJ1qnfQp3cguUgm4Ycp?=
 =?us-ascii?Q?xeY4LOyMBsAANjK6sWKdfVQoDv91yPentocRHDt1oUvvzHhnIiR3s5Qr5/Hv?=
 =?us-ascii?Q?kNJN1iglHVJhkNB4lyCjtC6naloZF9sesgByca17cY4qgW7eoApwzW87ZXrW?=
 =?us-ascii?Q?BEy2TmmoAt0tHaNk1VFYArRUZOQijIMcAoDpixgJY/vLsgfYRO/KiORE7J+H?=
 =?us-ascii?Q?HlvPO0d1gb7Me+FmoQdWxmJ63cxG71Zxom8f4wHOFNelWkZhhICvRisJ/BAp?=
 =?us-ascii?Q?C5za6bIOQGHeXA7lqdEhNfzpgU50eAuDF+SMcOCTqblF5JqbtX4+XV5S+itp?=
 =?us-ascii?Q?EJ3FEImyk10f7+NN181bFtM86k6EbY5zrN4f7o3Wd4YM0JZYnSPcL6HT9SqX?=
 =?us-ascii?Q?PsdlcZTeDvQiQhd/W76jBA4UalhaEUoIgcGR9aGNB4LplNekqucwqfWxXdZA?=
 =?us-ascii?Q?DHqJ/xPQgHLnTrihrhPdk5sCidYT1qT3ELQVN0tC1RButzg/j/w2cF42sA3+?=
 =?us-ascii?Q?a1ztqCV8tQUd4aqULcd+xBrZHsjh0d5KSMLfqASlygLehBhH5f8udZz+7yrr?=
 =?us-ascii?Q?4wO4MbsXBkMq9/gPsHmj4ALB4NprVefvX+FylTCyvKCd887owqWwj0uzAiDl?=
 =?us-ascii?Q?nT+b1Xpp2FxiWkQfjIeQea7e2dizhEcqqG/xk3MFG0fqhvZlZq39yiGN0jgu?=
 =?us-ascii?Q?797FZho=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GBK+utudq57sMJOfONodNdRwmrn/fBuXk1akRxHA8ER7vTLq+BxaqarXvJHf?=
 =?us-ascii?Q?MbP6srabTChJoJRknN8N+5s41hnIfAiWF6kjlhh9FzllfFpCEdak+yZiZ3tG?=
 =?us-ascii?Q?pMIhnfSjIEu6VgwyNTb0CK94egOnqCgvBgqhVnmptMLCQ5ojhXJ6DnzqxQSP?=
 =?us-ascii?Q?FnsvwCjt9jxaRWRZ/JFp2jy+om4eLlsiFcchUC/zDbOSI0nz+PQj62nXt3WZ?=
 =?us-ascii?Q?itqM5ANj0Vr+txOnVpuykzTjVyljBiXoqoQmlQBWONC+h7cfTFqfI4HEzDHZ?=
 =?us-ascii?Q?eD0WpMUgdoATiIH5uiKB76xt406yjFVrxvDoZ7ESRw/+JR3rrX42DH4oUbeA?=
 =?us-ascii?Q?CGXdYsYJO8TO+dsmnsZSvd1MEZ/Rt0OSK67cUY0q++TKuRAop2kt5FQT6e40?=
 =?us-ascii?Q?8R8NhtjwUqAYo3UAuOTBvL6SX1TWSq/+CN3tHQnhHGnlG8encwUXnoaZcCYL?=
 =?us-ascii?Q?5GttJTDvCAH5/ceQKJgDDzYlcjGfplf6E3zareYHwkuArk7dw6sjo4kj3R9q?=
 =?us-ascii?Q?iGkzrvDcvxRyydmkVaZNjWoTEELiKTifSQZh2+ahzuhQ/IUfUQcxPJSekrYk?=
 =?us-ascii?Q?b4cdSZNk9EUdiE9ZEHV83ExSfFnwWWcVEqahkcR50KchgVEUdaVKPMFXbGgl?=
 =?us-ascii?Q?c3kTLF5U4Oc/YAaJAIZAzxX4LObpaEFdka5NFfUIZmn4OfWTq2wFy59ROmmC?=
 =?us-ascii?Q?bauREAtsG9xPMdidSMNowOEb+x6EgLQnwpyzPHYRxbJPj89FWb/ftDH7disk?=
 =?us-ascii?Q?Uj8vhGNrKWeXthrsGvko/xDreZbhB5e6SfVcjAPduoCV4iHov5JlH812wLMK?=
 =?us-ascii?Q?odVQ2qZsa3AKH6wjtUD/cLK/+5esINOlEVD7lkhleeX7EuwS0hW+Xugdjstc?=
 =?us-ascii?Q?iejw3esOq+7LIp80MT4zHLyQGyUt0Er1xT4De1QwevXW/8ABIciRgdcXamd5?=
 =?us-ascii?Q?yscDtxA5TdKOLsGW/OXwzkFcoTJZNnot2hg2AYRxdPDzCDimTOPRS4G2oLxM?=
 =?us-ascii?Q?sZeQ9xtjjz1CM7KZSyue2khRmw0W6cQVlmqU3zx0yyvAytk6d6EFUWZ4xjcd?=
 =?us-ascii?Q?612jNB7OstKxBpqYuYTtXm5vKT8mDKlRPryfPkh4HaNffWhgxa18jpoAWGgV?=
 =?us-ascii?Q?B4EQ8uAFA1O2vyspSviFoPbHvbSIqUD18BlrH42f4Wp9jDtnv7TCHB48wNmE?=
 =?us-ascii?Q?VsqNbrXivrA/eScWnC/zRmVUuPEW9cym02w1aPgJk3AfQs1SUYYvfCQ50dD4?=
 =?us-ascii?Q?TvpzA4yIV9SLovJEyx7MJcSg5TgHzKPsPBUGabpZQG3/aoVYgD2U3ipApsM9?=
 =?us-ascii?Q?O77PVQxe8NwWBDJZE520JhImk1DO+rQjTwf6L9E/VT/z7WJdCtLqKPshrbCi?=
 =?us-ascii?Q?WXtktBMRLdeS9Cy92U2WBxoyw49ws5odMbK+T/439DG03yQ7JOnLYv5+kqWZ?=
 =?us-ascii?Q?JNI11qHENrSHqcwFUodggCa/BhRwwoDuFk8CAkNlpxY7zDu+dObmNtVu5g8m?=
 =?us-ascii?Q?1IPfoZp3azM8qHTp4cB06xkUIEqAYL2ut6JYcTsepOh9OVETmDbxEO2bEHU/?=
 =?us-ascii?Q?L7E5mdvqsMj/Qv9+V6JD+zSjIPe/jN3AjLgIDsHBfP7L+rQdIf9BKQxfW1Wl?=
 =?us-ascii?Q?Lg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ec752ee6-d696-4e5a-2620-08ddacf1cc1f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 16:21:07.0584 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MatY4UGCdaymuS0MtOi+QyCToDN9wd/sA6S8gOiq1jVAIWWYZZg5LTTWDIpM61qI0F1xKfy520L+BHhXd04N07DXwGNtVCOmO3Ue6vY1bSM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6802
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

On Mon, Jun 16, 2025 at 02:56:52AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [1/2] drm/xe/pat: Determine ATS / PTA programming during early sw init
> URL   : https://patchwork.freedesktop.org/series/150262/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-3252-4d016d6e602638e0ebc3895331224e057508c07a_FULL -> xe-pw-150262v1_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.

Applied to drm-xe-next.  Thanks Tejas for the reviews.


Matt

> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-150262v1_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][1] ([Intel XE#4427]) +1 other test fail
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-435/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4.html
> 
>   * igt@kms_async_flips@test-cursor-atomic:
>     - shard-lnl:          NOTRUN -> [SKIP][2] ([Intel XE#664])
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-lnl-4/igt@kms_async_flips@test-cursor-atomic.html
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-270:
>     - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#2327]) +1 other test skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-bmg-6/igt@kms_big_fb@linear-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-90:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][4] ([Intel XE#316]) +1 other test skip
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-435/igt@kms_big_fb@linear-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
>     - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#1407])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-lnl-4/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-0:
>     - shard-adlp:         [PASS][6] -> [DMESG-WARN][7] ([Intel XE#2953] / [Intel XE#4173]) +3 other tests dmesg-warn
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-6/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-adlp-8/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-overflow:
>     - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#610])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         [PASS][9] -> [DMESG-FAIL][10] ([Intel XE#4543])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#1124]) +4 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#610])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#1124])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-bmg-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
>     - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2314] / [Intel XE#2894])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-bmg-4/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#2191])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#367]) +1 other test skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-435/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
> 
>   * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
>     - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2887]) +4 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-bmg-6/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
> 
>   * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc:
>     - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#2887])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-lnl-4/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
>     - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#3432])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#2907]) +1 other test skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-c-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#787]) +41 other tests skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-c-dp-4.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#455] / [Intel XE#787]) +11 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][23] -> [INCOMPLETE][24] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) +1 other test incomplete
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][25] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_cdclk@mode-transition-all-outputs:
>     - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2724])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-bmg-5/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>   * igt@kms_chamelium_color@ctm-blue-to-red:
>     - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2325])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-bmg-4/igt@kms_chamelium_color@ctm-blue-to-red.html
> 
>   * igt@kms_chamelium_color@ctm-red-to-blue:
>     - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#306])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-lnl-4/igt@kms_chamelium_color@ctm-red-to-blue.html
> 
>   * igt@kms_chamelium_edid@dp-edid-resolution-list:
>     - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#373])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-lnl-4/igt@kms_chamelium_edid@dp-edid-resolution-list.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:
>     - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2252]) +3 other tests skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#373])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-435/igt@kms_chamelium_hpd@vga-hpd.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-0:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#307])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-435/igt@kms_content_protection@dp-mst-lic-type-0.html
> 
>   * igt@kms_content_protection@lic-type-1:
>     - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#5176])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-lnl-4/igt@kms_content_protection@lic-type-1.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-32x32:
>     - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2320]) +1 other test skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-32x32.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x512:
>     - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#2321])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-lnl-4/igt@kms_cursor_crc@cursor-onscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-256x85:
>     - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#1424])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-lnl-4/igt@kms_cursor_crc@cursor-sliding-256x85.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x170:
>     - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2321])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-512x170.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
>     - shard-bmg:          [PASS][38] -> [SKIP][39] ([Intel XE#2291]) +3 other tests skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>     - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2286])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-bmg-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_display_modes@extended-mode-basic:
>     - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#4302])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-lnl-4/igt@kms_display_modes@extended-mode-basic.html
> 
>   * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#4422])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-435/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#4156])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-bmg-6/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_fbcon_fbt@psr:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#776])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-435/igt@kms_fbcon_fbt@psr.html
> 
>   * igt@kms_flip@2x-blocking-wf_vblank@ac-dp2-hdmi-a3:
>     - shard-bmg:          [PASS][45] -> [FAIL][46] ([Intel XE#2882]) +2 other tests fail
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-3/igt@kms_flip@2x-blocking-wf_vblank@ac-dp2-hdmi-a3.html
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-bmg-2/igt@kms_flip@2x-blocking-wf_vblank@ac-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@2x-dpms-vs-vblank-race@cd-dp2-hdmi-a3:
>     - shard-bmg:          NOTRUN -> [INCOMPLETE][47] ([Intel XE#2049]) +1 other test incomplete
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-bmg-5/igt@kms_flip@2x-dpms-vs-vblank-race@cd-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-hdmi-a6-dp4:
>     - shard-dg2-set2:     [PASS][48] -> [FAIL][49] ([Intel XE#886]) +1 other test fail
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-hdmi-a6-dp4.html
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-436/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-hdmi-a6-dp4.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
>     - shard-bmg:          [PASS][50] -> [SKIP][51] ([Intel XE#2316]) +3 other tests skip
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:
>     - shard-dg2-set2:     [PASS][52] -> [FAIL][53] ([Intel XE#301] / [Intel XE#3321])
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
>     - shard-dg2-set2:     [PASS][54] -> [FAIL][55] ([Intel XE#301]) +12 other tests fail
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
> 
>   * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
>     - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2316])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank:
>     - shard-lnl:          [PASS][57] -> [FAIL][58] ([Intel XE#3098] / [Intel XE#886])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1:
>     - shard-lnl:          [PASS][59] -> [FAIL][60] ([Intel XE#3098])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1:
>     - shard-adlp:         [PASS][61] -> [FAIL][62] ([Intel XE#2882]) +2 other tests fail
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-3/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1.html
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-adlp-3/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-bmg:          [PASS][63] -> [INCOMPLETE][64] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip@plain-flip-fb-recreate-interruptible@c-dp2:
>     - shard-bmg:          NOTRUN -> [FAIL][65] ([Intel XE#2882]) +3 other tests fail
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-bmg-5/igt@kms_flip@plain-flip-fb-recreate-interruptible@c-dp2.html
> 
>   * igt@kms_flip@wf_vblank-ts-check@a-edp1:
>     - shard-lnl:          [PASS][66] -> [FAIL][67] ([Intel XE#886]) +3 other tests fail
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-lnl-3/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-lnl-2/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
>     - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2293]) +1 other test skip
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#651]) +2 other tests skip
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#651]) +11 other tests skip
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#4141]) +3 other tests skip
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#2312]) +4 other tests skip
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2311]) +7 other tests skip
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#656]) +2 other tests skip
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#653]) +11 other tests skip
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#2313]) +7 other tests skip
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#455]) +7 other tests skip
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-436/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@kms_hdr@invalid-metadata-sizes:
>     - shard-bmg:          [PASS][79] -> [SKIP][80] ([Intel XE#1503])
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-3/igt@kms_hdr@invalid-metadata-sizes.html
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-bmg-6/igt@kms_hdr@invalid-metadata-sizes.html
> 
>   * igt@kms_joiner@invalid-modeset-ultra-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2927])
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-bmg-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html
> 
>   * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
>     - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#4329])
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-lnl-4/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
> 
>   * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
>     - shard-dg2-set2:     [PASS][83] -> [FAIL][84] ([Intel XE#616]) +1 other test fail
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-464/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-435/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
> 
>   * igt@kms_plane_multiple@2x-tiling-none:
>     - shard-bmg:          [PASS][85] -> [SKIP][86] ([Intel XE#4596])
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-none.html
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-none.html
> 
>   * igt@kms_plane_multiple@2x-tiling-y:
>     - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#4596])
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html
> 
>   * igt@kms_plane_scaling@2x-scaler-multi-pipe:
>     - shard-bmg:          [PASS][88] -> [SKIP][89] ([Intel XE#2571])
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-simulation:
>     - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#736])
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-lnl-4/igt@kms_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@kms_pm_dc@dc5-retention-flops:
>     - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#3309])
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-bmg-4/igt@kms_pm_dc@dc5-retention-flops.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>     - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#1439] / [Intel XE#3141])
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-lnl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
>     - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#1489]) +1 other test skip
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
>     - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#2893] / [Intel XE#4608])
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#4608]) +1 other test skip
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#1489]) +1 other test skip
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-435/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_su@page_flip-xrgb8888:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#1122])
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-436/igt@kms_psr2_su@page_flip-xrgb8888.html
> 
>   * igt@kms_psr@fbc-psr-cursor-plane-onoff:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-435/igt@kms_psr@fbc-psr-cursor-plane-onoff.html
> 
>   * igt@kms_psr@fbc-psr2-cursor-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#1406]) +1 other test skip
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-lnl-4/igt@kms_psr@fbc-psr2-cursor-blt.html
> 
>   * igt@kms_psr@fbc-psr2-cursor-blt@edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#4609]) +1 other test skip
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-lnl-4/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html
> 
>   * igt@kms_psr@fbc-psr2-primary-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-bmg-6/igt@kms_psr@fbc-psr2-primary-blt.html
> 
>   * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>     - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#2414])
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-bmg-5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> 
>   * igt@kms_rotation_crc@primary-rotation-270:
>     - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#3414] / [Intel XE#3904])
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-lnl-4/igt@kms_rotation_crc@primary-rotation-270.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#1127])
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90:
>     - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#3414] / [Intel XE#3904])
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-bmg-5/igt@kms_rotation_crc@sprite-rotation-90.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#1435])
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-bmg-6/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#1500])
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@xe_compute_preempt@compute-preempt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-436/igt@xe_compute_preempt@compute-preempt.html
> 
>   * igt@xe_eudebug@basic-vm-access-userptr:
>     - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#4837])
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-lnl-4/igt@xe_eudebug@basic-vm-access-userptr.html
> 
>   * igt@xe_eudebug@basic-vm-bind:
>     - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#4837]) +1 other test skip
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-bmg-4/igt@xe_eudebug@basic-vm-bind.html
> 
>   * igt@xe_eudebug@discovery-race-vmbind:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#4837]) +3 other tests skip
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-436/igt@xe_eudebug@discovery-race-vmbind.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
>     - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#688])
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-lnl-4/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:
>     - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#2322]) +3 other tests skip
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:
>     - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#1392])
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-lnl-4/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#288]) +6 other tests skip
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-435/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate.html
> 
>   * igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#4915]) +95 other tests skip
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-433/igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck.html
> 
>   * igt@xe_exec_system_allocator@threads-many-stride-mmap-huge:
>     - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#4943])
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-lnl-4/igt@xe_exec_system_allocator@threads-many-stride-mmap-huge.html
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge-nomemset:
>     - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#4943]) +6 other tests skip
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-bmg-6/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge-nomemset.html
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:
>     - shard-lnl:          [PASS][119] -> [FAIL][120] ([Intel XE#5018])
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-lnl-6/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html
> 
>   * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
>     - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#2229])
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-lnl-4/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
> 
>   * igt@xe_mmap@pci-membarrier-bad-pagesize:
>     - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#5100])
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-lnl-4/igt@xe_mmap@pci-membarrier-bad-pagesize.html
> 
>   * igt@xe_module_load@load:
>     - shard-dg2-set2:     ([PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147]) -> ([PASS][148], [SKIP][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173]) ([Intel XE#378])
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-464/igt@xe_module_load@load.html
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-464/igt@xe_module_load@load.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-464/igt@xe_module_load@load.html
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/igt@xe_module_load@load.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-435/igt@xe_module_load@load.html
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-435/igt@xe_module_load@load.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-435/igt@xe_module_load@load.html
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-436/igt@xe_module_load@load.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-436/igt@xe_module_load@load.html
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-436/igt@xe_module_load@load.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-464/igt@xe_module_load@load.html
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-436/igt@xe_module_load@load.html
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-464/igt@xe_module_load@load.html
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-464/igt@xe_module_load@load.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/igt@xe_module_load@load.html
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/igt@xe_module_load@load.html
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-435/igt@xe_module_load@load.html
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-435/igt@xe_module_load@load.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-435/igt@xe_module_load@load.html
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/igt@xe_module_load@load.html
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/igt@xe_module_load@load.html
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-436/igt@xe_module_load@load.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/igt@xe_module_load@load.html
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/igt@xe_module_load@load.html
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/igt@xe_module_load@load.html
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-435/igt@xe_module_load@load.html
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-435/igt@xe_module_load@load.html
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-464/igt@xe_module_load@load.html
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-464/igt@xe_module_load@load.html
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-464/igt@xe_module_load@load.html
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-436/igt@xe_module_load@load.html
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-436/igt@xe_module_load@load.html
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-436/igt@xe_module_load@load.html
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-436/igt@xe_module_load@load.html
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-436/igt@xe_module_load@load.html
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-435/igt@xe_module_load@load.html
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-435/igt@xe_module_load@load.html
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-436/igt@xe_module_load@load.html
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-436/igt@xe_module_load@load.html
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-435/igt@xe_module_load@load.html
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-433/igt@xe_module_load@load.html
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-464/igt@xe_module_load@load.html
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-464/igt@xe_module_load@load.html
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-433/igt@xe_module_load@load.html
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-435/igt@xe_module_load@load.html
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-464/igt@xe_module_load@load.html
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-433/igt@xe_module_load@load.html
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-433/igt@xe_module_load@load.html
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-433/igt@xe_module_load@load.html
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-433/igt@xe_module_load@load.html
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-435/igt@xe_module_load@load.html
> 
>   * igt@xe_oa@polling-small-buf:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][174] ([Intel XE#2541] / [Intel XE#3573]) +3 other tests skip
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-436/igt@xe_oa@polling-small-buf.html
> 
>   * igt@xe_pm@s2idle-d3cold-basic-exec:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][175] ([Intel XE#2284] / [Intel XE#366])
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-436/igt@xe_pm@s2idle-d3cold-basic-exec.html
> 
>   * igt@xe_pmu@fn-engine-activity-load:
>     - shard-adlp:         NOTRUN -> [ABORT][176] ([Intel XE#5214]) +1 other test abort
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-adlp-6/igt@xe_pmu@fn-engine-activity-load.html
> 
>   * igt@xe_pxp@display-pxp-fb:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][177] ([Intel XE#4733])
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-435/igt@xe_pxp@display-pxp-fb.html
> 
>   * igt@xe_pxp@pxp-termination-key-update-post-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][178] ([Intel XE#4733]) +2 other tests skip
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-bmg-4/igt@xe_pxp@pxp-termination-key-update-post-suspend.html
> 
>   * igt@xe_spin_batch@spin-mem-copy:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][179] ([Intel XE#4821])
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-435/igt@xe_spin_batch@spin-mem-copy.html
> 
>   * igt@xe_sriov_flr@flr-vf1-clear:
>     - shard-bmg:          NOTRUN -> [SKIP][180] ([Intel XE#3342]) +1 other test skip
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-bmg-5/igt@xe_sriov_flr@flr-vf1-clear.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-1:
>     - shard-adlp:         [DMESG-WARN][181] ([Intel XE#4543]) -> [PASS][182] +1 other test pass
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-1.html
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-adlp-9/igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     [INCOMPLETE][183] ([Intel XE#3862]) -> [PASS][184] +1 other test pass
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>     - shard-dg2-set2:     [INCOMPLETE][185] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [PASS][186] +1 other test pass
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [INCOMPLETE][187] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [PASS][188]
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
>     - shard-bmg:          [SKIP][189] ([Intel XE#2291]) -> [PASS][190] +1 other test pass
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
>     - shard-bmg:          [SKIP][191] ([Intel XE#2316]) -> [PASS][192] +4 other tests pass
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:
>     - shard-dg2-set2:     [FAIL][193] ([Intel XE#301]) -> [PASS][194] +4 other tests pass
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-dg2-set2:     [INCOMPLETE][195] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][196] +1 other test pass
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
>     - shard-dg2-set2:     [INCOMPLETE][197] ([Intel XE#4842]) -> [PASS][198]
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-bmg:          [SKIP][199] ([Intel XE#1503]) -> [PASS][200]
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-5/igt@kms_hdr@invalid-hdr.html
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-bmg-7/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_vrr@negative-basic:
>     - shard-bmg:          [SKIP][201] ([Intel XE#1499]) -> [PASS][202]
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/igt@kms_vrr@negative-basic.html
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-bmg-4/igt@kms_vrr@negative-basic.html
> 
>   * {igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute}:
>     - shard-bmg:          [ABORT][203] ([Intel XE#3970]) -> [PASS][204] +1 other test pass
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute.html
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-bmg-4/igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute.html
> 
>   * igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-unmap-nomemset:
>     - shard-bmg:          [FAIL][205] -> [PASS][206]
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-7/igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-unmap-nomemset.html
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-bmg-4/igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-unmap-nomemset.html
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:
>     - shard-lnl:          [FAIL][207] ([Intel XE#5018]) -> [PASS][208]
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-lnl-6/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html
> 
>   * igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate:
>     - shard-dg2-set2:     [INCOMPLETE][209] -> [PASS][210]
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-435/igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate.html
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-464/igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate.html
> 
>   * igt@xe_pm@s2idle-basic:
>     - shard-adlp:         [DMESG-WARN][211] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][212]
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-3/igt@xe_pm@s2idle-basic.html
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-adlp-3/igt@xe_pm@s2idle-basic.html
> 
>   * igt@xe_pm@s3-vm-bind-userptr:
>     - shard-bmg:          [INCOMPLETE][213] ([Intel XE#569]) -> [PASS][214]
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/igt@xe_pm@s3-vm-bind-userptr.html
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-bmg-6/igt@xe_pm@s3-vm-bind-userptr.html
> 
>   * igt@xe_pmu@gt-frequency:
>     - shard-dg2-set2:     [FAIL][215] ([Intel XE#4835]) -> [PASS][216] +1 other test pass
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-435/igt@xe_pmu@gt-frequency.html
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-dg2-464/igt@xe_pmu@gt-frequency.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][217] ([Intel XE#2311]) -> [SKIP][218] ([Intel XE#2312]) +9 other tests skip
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][219] ([Intel XE#4141]) -> [SKIP][220] ([Intel XE#2312]) +2 other tests skip
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:
>     - shard-bmg:          [SKIP][221] ([Intel XE#2312]) -> [SKIP][222] ([Intel XE#4141]) +3 other tests skip
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:
>     - shard-bmg:          [SKIP][223] ([Intel XE#2312]) -> [SKIP][224] ([Intel XE#2311]) +7 other tests skip
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
>     - shard-bmg:          [SKIP][225] ([Intel XE#2313]) -> [SKIP][226] ([Intel XE#2312]) +5 other tests skip
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][227] ([Intel XE#2312]) -> [SKIP][228] ([Intel XE#2313]) +6 other tests skip
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_plane_multiple@2x-tiling-yf:
>     - shard-bmg:          [SKIP][229] ([Intel XE#5021]) -> [SKIP][230] ([Intel XE#4596])
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-yf.html
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-yf.html
> 
>   * igt@xe_module_load@load:
>     - shard-adlp:         ([SKIP][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240], [PASS][241], [PASS][242], [PASS][243], [PASS][244], [PASS][245], [PASS][246], [PASS][247], [PASS][248], [PASS][249], [PASS][250], [PASS][251], [PASS][252], [PASS][253], [PASS][254], [PASS][255], [PASS][256]) ([Intel XE#378]) -> ([PASS][257], [PASS][258], [PASS][259], [DMESG-WARN][260], [PASS][261], [PASS][262], [PASS][263], [PASS][264], [PASS][265], [SKIP][266], [PASS][267], [PASS][268], [PASS][269], [PASS][270], [PASS][271], [PASS][272], [PASS][273], [PASS][274], [PASS][275], [PASS][276], [PASS][277], [PASS][278], [PASS][279], [PASS][280], [PASS][281], [PASS][282]) ([Intel XE#2953] / [Intel XE#378] / [Intel XE#4173])
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@xe_module_load@load.html
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-1/igt@xe_module_load@load.html
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-9/igt@xe_module_load@load.html
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-2/igt@xe_module_load@load.html
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-9/igt@xe_module_load@load.html
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-1/igt@xe_module_load@load.html
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-9/igt@xe_module_load@load.html
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-9/igt@xe_module_load@load.html
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-3/igt@xe_module_load@load.html
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-8/igt@xe_module_load@load.html
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-8/igt@xe_module_load@load.html
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@xe_module_load@load.html
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@xe_module_load@load.html
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@xe_module_load@load.html
>    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-8/igt@xe_module_load@load.html
>    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-6/igt@xe_module_load@load.html
>    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-6/igt@xe_module_load@load.html
>    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/igt@xe_module_load@load.html
>    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-6/igt@xe_module_load@load.html
>    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-2/igt@xe_module_load@load.html
>    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-1/igt@xe_module_load@load.html
>    [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-2/igt@xe_module_load@load.html
>    [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-2/igt@xe_module_load@load.html
>    [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-3/igt@xe_module_load@load.html
>    [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-3/igt@xe_module_load@load.html
>    [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-6/igt@xe_module_load@load.html
>    [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-adlp-3/igt@xe_module_load@load.html
>    [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-adlp-3/igt@xe_module_load@load.html
>    [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-adlp-4/igt@xe_module_load@load.html
>    [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-adlp-3/igt@xe_module_load@load.html
>    [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-adlp-2/igt@xe_module_load@load.html
>    [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-adlp-2/igt@xe_module_load@load.html
>    [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-adlp-6/igt@xe_module_load@load.html
>    [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-adlp-1/igt@xe_module_load@load.html
>    [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-adlp-9/igt@xe_module_load@load.html
>    [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-adlp-9/igt@xe_module_load@load.html
>    [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-adlp-6/igt@xe_module_load@load.html
>    [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-adlp-6/igt@xe_module_load@load.html
>    [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-adlp-9/igt@xe_module_load@load.html
>    [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-adlp-9/igt@xe_module_load@load.html
>    [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-adlp-9/igt@xe_module_load@load.html
>    [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-adlp-6/igt@xe_module_load@load.html
>    [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-adlp-4/igt@xe_module_load@load.html
>    [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-adlp-8/igt@xe_module_load@load.html
>    [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-adlp-8/igt@xe_module_load@load.html
>    [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-adlp-1/igt@xe_module_load@load.html
>    [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-adlp-1/igt@xe_module_load@load.html
>    [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-adlp-8/igt@xe_module_load@load.html
>    [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-adlp-2/igt@xe_module_load@load.html
>    [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-adlp-1/igt@xe_module_load@load.html
>    [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-adlp-4/igt@xe_module_load@load.html
>    [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-adlp-4/igt@xe_module_load@load.html
> 
>   * igt@xe_pmu@all-fn-engine-activity-load:
>     - shard-adlp:         [FAIL][283] ([Intel XE#5219]) -> [ABORT][284] ([Intel XE#5214])
>    [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-1/igt@xe_pmu@all-fn-engine-activity-load.html
>    [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-adlp-8/igt@xe_pmu@all-fn-engine-activity-load.html
> 
>   * igt@xe_pmu@engine-activity-all-load-idle:
>     - shard-adlp:         [DMESG-WARN][285] ([Intel XE#5214]) -> [ABORT][286] ([Intel XE#5214]) +4 other tests abort
>    [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-9/igt@xe_pmu@engine-activity-all-load-idle.html
>    [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-adlp-4/igt@xe_pmu@engine-activity-all-load-idle.html
> 
>   * igt@xe_pmu@engine-activity-most-load-idle:
>     - shard-adlp:         [ABORT][287] ([Intel XE#5214]) -> [DMESG-WARN][288] ([Intel XE#5214]) +3 other tests dmesg-warn
>    [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-2/igt@xe_pmu@engine-activity-most-load-idle.html
>    [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/shard-adlp-4/igt@xe_pmu@engine-activity-most-load-idle.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
>   [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>   [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>   [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
>   [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
>   [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
>   [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
>   [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
>   [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>   [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
>   [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
>   [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
>   [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
>   [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
>   [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
>   [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
>   [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>   [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
>   [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
>   [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
>   [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
>   [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
>   [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
>   [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
>   [Intel XE#4427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4427
>   [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
>   [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
>   [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
>   [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#4821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4821
>   [Intel XE#4835]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4835
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>   [Intel XE#4842]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4842
>   [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
>   [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
>   [Intel XE#5018]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018
>   [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
>   [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
>   [Intel XE#5172]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5172
>   [Intel XE#5176]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5176
>   [Intel XE#5214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5214
>   [Intel XE#5219]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5219
>   [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
>   [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>   [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
>   [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-3252-4d016d6e602638e0ebc3895331224e057508c07a -> xe-pw-150262v1
> 
>   IGT_8411: d5b5d2bb4f8795a98ea58376a128b74f654b7ec1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-3252-4d016d6e602638e0ebc3895331224e057508c07a: 4d016d6e602638e0ebc3895331224e057508c07a
>   xe-pw-150262v1: 150262v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150262v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

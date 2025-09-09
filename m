Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7DAACA0FED
	for <intel-xe@archiver.kernel.org>; Tue,  9 Sep 2025 13:57:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78EF010E73B;
	Tue,  9 Sep 2025 13:57:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aOiumS87";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76A9A10E73B
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Sep 2025 13:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757426237; x=1788962237;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=gBSQvwCqAaA9PL9V8O4LmrwGwt1T58b/hh8i+MY9ehY=;
 b=aOiumS87K4qWnjgdlPEVrEC9tm14mEdfilKR0m2ppuMSf5ssuvXDehY/
 yMy7GxUUmlmObypVuJ1/KW8XCAUmkWEX6Cp3hAXbBaBtJRj+KQsPKSk54
 tKEbB83VQomrJwsRfkXwI+7+6r+CXUKdF2mCYF0+nALqXEpgkcVK8fcEb
 Jrs5mmzuuzd60eO3Bq1OB8RBCWslETIsMsgT3wiSs4rrFlyxfHjNc7owY
 MyxU2jYhhLYq9JFmIkW4t2n0Z22HUCjsNgYaGYXSH2pUqzbhav8HaLOhB
 JKwc1GMNWXKLCVuqVmmK/ri/sAHGeRe3nOB8E7KLv+K5W0seeKh7l8H9T Q==;
X-CSE-ConnectionGUID: lfOwGj6XRIWU0FmumGI/9g==
X-CSE-MsgGUID: TNozu+M7SWiK6kFs2FwXXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="63538374"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="63538374"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 06:57:15 -0700
X-CSE-ConnectionGUID: KubwB9gtQ0Cjb8uvOfz7IQ==
X-CSE-MsgGUID: yuE3dkKnROa2f/JQpnllXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="173211169"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 06:57:15 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 06:57:13 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 9 Sep 2025 06:57:13 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.83) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 06:57:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HX8G2XwQTOLVhi/k3TvN+VW5ke6igrK133dM2BTNMxsQw2Md3TqeRZMIiOZpMnpV4zx6XPyN3GPrZ1rIF2L82ofMfcDiwRj+UgFeJb0q/n5zQzk+x/SZ07v4V7ot8js8fJ7m88g/cb+5rE3cxV+2J8XCcwHi0hM65Fu3KpSTniziKynhbpJTmFeu6+A+T9aW72SNpHjkuOZ1HRLCbQxd0C8MIvoARgtTlc8BkenlrtxdPjZFJI5O3+Dv5H3j0Z9nrxXGeh4L66pUZT24vp8vfVQ6pfl1o2Z++hus9OLV+P5qOvIYablbW0xZox/uUJPltOOypawNSwXf1Vkla7rSxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ChPtjBtJ6xuWBvR+fXcKyqqEVC3ivCVdHJFNtMrUiM0=;
 b=xB/R/OMXIrUQ4fDXErZ2l+WDREO+0IE2ldKdMBpCQhOezvC9V0C7bS4KXi5bpHEY2dnv1PVEQX+F8rRz7LmWHhwAhxpiU04Dvte0S8XQ1o1/Jm9kG+B/30iFs5dS0r88y8peTYI8Jj3JgMQpZL7Evelf2wxUxRzD0Fz0Q3qq8WPan8LxMjBB7dZct4c/IUMc1v37IonaFom3cnQliX9udP5GqsFRXGh7FEUMREYI1mgsy5DSKU4pB2/5yrnReTqr4dTYJ1c3u3Xc5IG0RGnMgP3A2qjfU1G5FQqK93c0PGn9JfSCVzA3CyVautxul7Z4NXi98q8vRUMLb5GnFFuHtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CY8PR11MB7686.namprd11.prod.outlook.com (2603:10b6:930:70::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 13:57:12 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 13:57:12 +0000
Date: Tue, 9 Sep 2025 09:57:08 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 4/7] drm/xe: Add dedicated printk macros for tile and
 device
Message-ID: <aMAyNIn2yVK1bLN1@intel.com>
References: <20250903213712.6364-1-michal.wajdeczko@intel.com>
 <20250903213712.6364-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250903213712.6364-5-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0342.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::17) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CY8PR11MB7686:EE_
X-MS-Office365-Filtering-Correlation-Id: cb942459-f51d-4089-7826-08ddefa8c5e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?jiqS0uxAl1sqXQyFd9c9jQv3WrvoJ50OCINxVsXetp/oTbE55sa7yMM7q7?=
 =?iso-8859-1?Q?Lfbyv9ds5HQtlIgukwnIBX6lDx2Dy0ne/NzU3cHK3nxCKjw/DzcKmHVEDP?=
 =?iso-8859-1?Q?LONPozJICKtfYd3Ha6fDZSLMvlFp0vYt8AguFxjZalacSQvGHbo0GiGwsS?=
 =?iso-8859-1?Q?o2tyYWncenPWxGJmZn+WPl85uIpbkr0VRTwE3OlLVN910WJK3TDx3jkvmD?=
 =?iso-8859-1?Q?Av5FOQ67MELHoIHR6vIg98E9QMK/L2e5GIKaMF4qoFs4kg9SRhGe2KQdOK?=
 =?iso-8859-1?Q?L+Fn5slukjoHfX5uzJIF1PLjL3tK0Ga0vAw2GjGISwihX2sleDmT3Fr5YV?=
 =?iso-8859-1?Q?XjIlFc7qsKsg5w++HW9RPQng4Yr7Zysdfm96lV6rRS57BZA89IuL3WUUvM?=
 =?iso-8859-1?Q?oRtnSz6mjK5XDRNwUxYH+vrfVnmMflpD2xscIEs9+Bm9OOw/HdTbUURbNi?=
 =?iso-8859-1?Q?upwf+Q74yi5hCXshLFCqlIsGOzsGFWdfbUwbF4SB3iVH1H4nee2wE47wrT?=
 =?iso-8859-1?Q?UAPCIy5Lq+uZg7c/rvdNkcAhw0mcvoFfT284DJctoiKm009KkbIWtB/8LV?=
 =?iso-8859-1?Q?Oxn4dj81SFdlXPtX1oFrgoGHSvTO0zb4rLgGd9KbtLtII21hCDZ4sdsiAO?=
 =?iso-8859-1?Q?3fOLTdB9vkmiujjQMyASiN/T1qta2lMMnVInjpK5WUD0tw4oJ+9UNjxacy?=
 =?iso-8859-1?Q?3tC0QAH9rdoAxmBcmxfVK5taCyMV1HJvgNiqxVIX7owVFOdC2ow8Kci9kZ?=
 =?iso-8859-1?Q?CtMQqxnIEtxMosClQn3bMTkoboWiK1HppK2m/Uf2qsgFKHVCXvSLZGNQfL?=
 =?iso-8859-1?Q?HwKSqP2DnRcISgW8bdlj283iaWgi/f/U2/1hzUk1tFOiLtUfhxd11EP0Xq?=
 =?iso-8859-1?Q?ep65AEd6IyECDWGNWuI6eiGMzmiUDZ/Bx8ZQx6rlRFIZidkkOq+uI/bDW9?=
 =?iso-8859-1?Q?2axKHQI3US1fE5OaKGjXb+7ZiBcmJ/tTlH58ytpkXAAk8E4XpTO+3Y+cT4?=
 =?iso-8859-1?Q?TqR0zgxDhm9l9wjexS4j3XNU+TyoB/ITlmEbdyEwRgbJBZfYQ/eLCFZvlg?=
 =?iso-8859-1?Q?+Bs//s1o0kRN4PahMT+g510ZdisxsLTsUnXinOwcu3KFt/ZQiimrs4UrwN?=
 =?iso-8859-1?Q?CXXGzUO5oHLX2sH+P03n7dm84CnxgEnqYaSVWClL9AvW237jMALaWQrZWR?=
 =?iso-8859-1?Q?v0T7CneTXf28SJ1yz97s9CGnb50J+wKpYQtNVdEuvgs0d8qgaH4FV/Ly9T?=
 =?iso-8859-1?Q?ndTWhCEtVJ2A82+0oXkRRuHnsaw970JXAk9tvlkHbvk5Kh6cGzsZaMmShn?=
 =?iso-8859-1?Q?gJUifjrYTMnYOFZQIBkCxZzd6i3x5oR3UGpx43NtuAnmGb1zFopA06hjyP?=
 =?iso-8859-1?Q?wJYKBA0Uqh4nWzgAd786ANCkfdMgzwwdfgW1sxFy4XaOyMh+9KID2xv9Lb?=
 =?iso-8859-1?Q?6ief1gZio46qLYRky9Bvr79nYwiPmkUsNb2Qo2Mf65F+qe1puEOC3/s0WM?=
 =?iso-8859-1?Q?E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?2LXh1Ya4OVZLDIjoN2AniB07NtJX5MaQQYqGZbXGClJ6ZLFKm8T1kouw0S?=
 =?iso-8859-1?Q?xB/R7df9uWuNOpmWmTe1yVPMd+8ZvpWbGryVGkN+FwoflJKwrfySAlcEsZ?=
 =?iso-8859-1?Q?CVMJpcAKMoVq5NNvGBmonflTU3mvi/mgu08yGxNED3ptaSzXl9BaPd8SaV?=
 =?iso-8859-1?Q?Wiyc9Oz2WRdkfiUD+lD7ckrBQpqRPJV7qH62io51T3y/p6JXW2JsQZau8Q?=
 =?iso-8859-1?Q?rhzznMyuuYiHtpnNjMu2sXjmKkP7+emQhilnXaNbi2TsyZxjtnyLkDq6Zt?=
 =?iso-8859-1?Q?+H4/j2yUPp4xotFV6CEWKsYiEmyUNLKDNkvIoFAUZdmqxOPiYaUhq8zvHE?=
 =?iso-8859-1?Q?bqLx6PSBeZqu7TBUXb1lhdYeHkyywVtJEAnWu8YMal/EXXeXhLhGkrleCB?=
 =?iso-8859-1?Q?hqC/0EW+fzqPVqlPt3LBHCOPcRq2jcYeh0KXyQGKEv52t48E0kesvrBZOS?=
 =?iso-8859-1?Q?EeQUg4rfpedrSjw/bSkWX2qCQmrXkZfQHyS88uQvTuS5GetKmTyntKTqAR?=
 =?iso-8859-1?Q?+Sj3CFJVRWaCpIdf3An1tZ6EyXhIPdZZCcKgMgr0fyPe83IaMWXZTKaR/Y?=
 =?iso-8859-1?Q?yc6RCjT5IjFLzLr3lsC3vblu1bFery1smChdPDISM4ms+Urf+XxVozwuRw?=
 =?iso-8859-1?Q?Jwv+JJOc9VsT3ToeiOAvEjqvhYX0+lmnIYTGjWdMefQzc15UOJK/GKwiPP?=
 =?iso-8859-1?Q?hWx/jdaAIH1MFhMp1YsTG5FwZaLDcpvhX2c1CErJzeUuc/1l88PgJcwlEU?=
 =?iso-8859-1?Q?CRxmxHYjsA8EfZlE+l6otJBx94WThPrX+Ke0MutqyiWA2WpE2ttdYwbX+Z?=
 =?iso-8859-1?Q?m0plGc4o4YW1RM2uJ8GKThq39/6zq3LQhWR7vwOLAbNL5c4Kru9j447zVM?=
 =?iso-8859-1?Q?goR4nawWfrbnnS2DMBVeBuaGy217n9lnq+8UFV0NjR97iqs3XLM24tuB2o?=
 =?iso-8859-1?Q?s+ttOlIQp1K2GGtveEuR/FbLpVUJ9G8ExiKxl0eG0+GVF1bghPHqpVVJvi?=
 =?iso-8859-1?Q?hVPShuEHDZBpeqBdgtYwpnhh2fSnd6fs/sXSX6dB+fjjjLxSl6knMu2yYV?=
 =?iso-8859-1?Q?kT9F4hKmwiCIqwluanSgbj4cXFi6Yi5gwRrLo/vjMgPbvdhJd0VTxIMDwK?=
 =?iso-8859-1?Q?GUGhhe5YttmpbrvP+c3XxXIUo4u3dKMN6ZV2ZDeRU237qSluYXyNwlgWcA?=
 =?iso-8859-1?Q?Mw1kwL3+K4woOWrD2KDrRlVSljUmIEipkCDUGbeEMDT1U8FCXqtEfNzd/h?=
 =?iso-8859-1?Q?6ANlqDm9YuabcBv7kFFHCqsTqVlCIeCD+c7OCYLzDSsx0w97TgOtkjucsO?=
 =?iso-8859-1?Q?peAT6fY2AXM1TiSqwJP/dyvXkX0+epv7diATRcOUigmJP/Bk+H525/tRcU?=
 =?iso-8859-1?Q?djUQxYIeTMn275Voq2pvOzO2H2VZkNjJsnGwxhoi/zjnecGjfzLSCfhIdX?=
 =?iso-8859-1?Q?9nJ3rJkiTggvw5p7Popf8WZbNcI1RXgblWXmdhMNCFfbJ3mTQrX/jQX/ig?=
 =?iso-8859-1?Q?v7Q5HP3zTWpJTkIwAaNgmnR0rUo1jffRqSfCpKT7XUpiDDVESv0S2RiZrj?=
 =?iso-8859-1?Q?07ZuRlOC+1qq6RPt0dFssH4Sko2eX8NVo3Cp+lqj4hhCGGMHJWxFgZhp1H?=
 =?iso-8859-1?Q?HKfMQ27rPF5SOoMdiTJDPurV+kZvvDQbQPxBdb6eq4zGcxqX4ToYq+Kw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cb942459-f51d-4089-7826-08ddefa8c5e4
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 13:57:12.0685 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IsrpIUO2WYbiFvt3Vv06C9Qu1+PceNyo2pKSLhwVflC3LKlHgpAQmIoxs/+0BM0EVyUhalqWj67qcykB7LcrNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7686
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

On Wed, Sep 03, 2025 at 11:36:09PM +0200, Michal Wajdeczko wrote:
> We already have dedicated helper macros for printing GT-oriented
> messages but we don't have any to print messages that are tile
> oriented and we wrongly try to use plain drm or GT-oriented ones.
> 
> Add tile-oriented printk messages and to provide similar coverage
> as we have with xe_assert() macros. Also add set of simple macros
> for the top level xe_device, which we could easily tweak to include
> extra device specific info if needed.
> 
> Typical output of our printk macros will look like:
> 
>  [drm] this is xe_WARN()
>  [drm] *ERROR* this is xe_err()
>  [drm] *ERROR* this is xe_err_printer()
>  [drm] this is xe_info()
>  [drm] this is xe_info_printer()
>  [drm:printk_demo.cold] this is xe_dbg()
>  [drm:printk_demo.cold] this is xe_dbg_printer()
> 
>  [drm] Tile0: this is xe_tile_WARN()
>  [drm] *ERROR* Tile0: this is xe_tile_err()
>  [drm] *ERROR* Tile0: this is xe_tile_err_printer()
>  [drm] Tile0: this is xe_tile_info()
>  [drm] Tile0: this is xe_tile_info_printer()
>  [drm:printk_demo.cold] Tile0: this is xe_tile_dbg()
>  [drm:printk_demo.cold] Tile0: this is xe_tile_dbg_printer()
> 
>  [drm] Tile0: GT0: this is xe_gt_WARN()
>  [drm] *ERROR* Tile0: GT0: this is xe_gt_err()
>  [drm] *ERROR* Tile0: GT0: this is xe_gt_err_printer()
>  [drm] Tile0: GT0: this is xe_gt_info()
>  [drm] Tile0: GT0: this is xe_gt_info_printer()
>  [drm:printk_demo.cold] Tile0: GT0: this is xe_gt_dbg()
>  [drm:printk_demo.cold] Tile0: GT0: this is xe_gt_dbg_printer()

Although I hate macros I like these results ;)

> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_printk.h   |  11 ++-
>  drivers/gpu/drm/xe/xe_printk.h      | 129 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_tile_printk.h | 127 +++++++++++++++++++++++++++
>  3 files changed, 261 insertions(+), 6 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_printk.h
>  create mode 100644 drivers/gpu/drm/xe/xe_tile_printk.h
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_printk.h b/drivers/gpu/drm/xe/xe_gt_printk.h
> index 5aaacaa6780c..8dc4217ddb4e 100644
> --- a/drivers/gpu/drm/xe/xe_gt_printk.h
> +++ b/drivers/gpu/drm/xe/xe_gt_printk.h
> @@ -6,14 +6,13 @@
>  #ifndef _XE_GT_PRINTK_H_
>  #define _XE_GT_PRINTK_H_
>  
> -#include <drm/drm_print.h>
> -
>  #include "xe_gt_types.h"
> +#include "xe_tile_printk.h"
>  
>  #define __xe_gt_printk_fmt(_gt, _fmt, _args...)	"GT%u: " _fmt, (_gt)->info.id, ##_args
>  
>  #define xe_gt_printk(_gt, _level, _fmt, ...) \
> -	drm_##_level(&gt_to_xe(_gt)->drm, __xe_gt_printk_fmt((_gt), _fmt, ##__VA_ARGS__))
> +	xe_tile_printk((_gt)->tile, _level, __xe_gt_printk_fmt((_gt), _fmt, ##__VA_ARGS__))
>  
>  #define xe_gt_err(_gt, _fmt, ...) \
>  	xe_gt_printk((_gt), err, _fmt, ##__VA_ARGS__)
> @@ -37,7 +36,7 @@
>  	xe_gt_printk((_gt), dbg, _fmt, ##__VA_ARGS__)
>  
>  #define xe_gt_WARN_type(_gt, _type, _condition, _fmt, ...) \
> -	drm_WARN##_type(&gt_to_xe(_gt)->drm, _condition, _fmt, ## __VA_ARGS__)
> +	xe_tile_WARN##_type((_gt)->tile, _condition, _fmt, ## __VA_ARGS__)
>  
>  #define xe_gt_WARN(_gt, _condition, _fmt, ...) \
>  	xe_gt_WARN_type((_gt),, _condition, __xe_gt_printk_fmt((_gt), _fmt, ##__VA_ARGS__))
> @@ -72,9 +71,9 @@ static inline void __xe_gt_printfn_dbg(struct drm_printer *p, struct va_format *
>  
>  	/*
>  	 * The original xe_gt_dbg() callsite annotations are useless here,
> -	 * redirect to the tweaked drm_dbg_printer() instead.
> +	 * redirect to the tweaked xe_tile_dbg_printer() instead.
>  	 */
> -	dbg = drm_dbg_printer(&gt_to_xe(gt)->drm, DRM_UT_DRIVER, NULL);
> +	dbg = xe_tile_dbg_printer((gt)->tile);
>  	dbg.origin = p->origin;
>  
>  	drm_printf(&dbg, __xe_gt_printk_fmt(gt, "%pV", vaf));
> diff --git a/drivers/gpu/drm/xe/xe_printk.h b/drivers/gpu/drm/xe/xe_printk.h
> new file mode 100644
> index 000000000000..691d3611b889
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_printk.h
> @@ -0,0 +1,129 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_PRINTK_H_
> +#define _XE_PRINTK_H_
> +
> +#include <drm/drm_print.h>
> +
> +#include "xe_device_types.h"
> +
> +#define __xe_printk_fmt(_xe, _fmt, _args...)	_fmt, ##_args
> +
> +#define xe_printk(_xe, _level, _fmt, ...) \
> +	drm_##_level(&(_xe)->drm, __xe_printk_fmt((_xe), _fmt, ## __VA_ARGS__))
> +
> +#define xe_err(_xe, _fmt, ...) \
> +	xe_printk((_xe), err, _fmt, ##__VA_ARGS__)
> +
> +#define xe_err_once(_xe, _fmt, ...) \
> +	xe_printk((_xe), err_once, _fmt, ##__VA_ARGS__)
> +
> +#define xe_err_ratelimited(_xe, _fmt, ...) \
> +	xe_printk((_xe), err_ratelimited, _fmt, ##__VA_ARGS__)
> +
> +#define xe_warn(_xe, _fmt, ...) \
> +	xe_printk((_xe), warn, _fmt, ##__VA_ARGS__)
> +
> +#define xe_notice(_xe, _fmt, ...) \
> +	xe_printk((_xe), notice, _fmt, ##__VA_ARGS__)
> +
> +#define xe_info(_xe, _fmt, ...) \
> +	xe_printk((_xe), info, _fmt, ##__VA_ARGS__)
> +
> +#define xe_dbg(_xe, _fmt, ...) \
> +	xe_printk((_xe), dbg, _fmt, ##__VA_ARGS__)
> +
> +#define xe_WARN_type(_xe, _type, _condition, _fmt, ...) \
> +	drm_WARN##_type(&(_xe)->drm, _condition, _fmt, ## __VA_ARGS__)
> +
> +#define xe_WARN(_xe, _condition, _fmt, ...) \
> +	xe_WARN_type((_xe),, _condition, __xe_printk_fmt((_xe), _fmt, ## __VA_ARGS__))
> +
> +#define xe_WARN_ONCE(_xe, _condition, _fmt, ...) \
> +	xe_WARN_type((_xe), _ONCE, _condition, __xe_printk_fmt((_xe), _fmt, ## __VA_ARGS__))
> +
> +#define xe_WARN_ON(_xe, _condition) \
> +	xe_WARN((_xe), _condition, "%s(%s)", "WARN_ON", __stringify(_condition))
> +
> +#define xe_WARN_ON_ONCE(_xe, _condition) \
> +	xe_WARN_ONCE((_xe), _condition, "%s(%s)", "WARN_ON_ONCE", __stringify(_condition))
> +
> +static inline void __xe_printfn_err(struct drm_printer *p, struct va_format *vaf)
> +{
> +	struct xe_device *xe = p->arg;
> +
> +	xe_err(xe, "%pV", vaf);
> +}
> +
> +static inline void __xe_printfn_info(struct drm_printer *p, struct va_format *vaf)
> +{
> +	struct xe_device *xe = p->arg;
> +
> +	xe_info(xe, "%pV", vaf);
> +}
> +
> +static inline void __xe_printfn_dbg(struct drm_printer *p, struct va_format *vaf)
> +{
> +	struct xe_device *xe = p->arg;
> +	struct drm_printer ddp;
> +
> +	/*
> +	 * The original xe_dbg() callsite annotations are useless here,
> +	 * redirect to the tweaked drm_dbg_printer() instead.
> +	 */
> +	ddp = drm_dbg_printer(&xe->drm, DRM_UT_DRIVER, NULL);
> +	ddp.origin = p->origin;
> +
> +	drm_printf(&ddp, __xe_printk_fmt(xe, "%pV", vaf));
> +}
> +
> +/**
> + * xe_err_printer - Construct a &drm_printer that outputs to xe_err()
> + * @xe: the &xe_device pointer to use in xe_err()
> + *
> + * Return: The &drm_printer object.
> + */
> +static inline struct drm_printer xe_err_printer(struct xe_device *xe)
> +{
> +	struct drm_printer p = {
> +		.printfn = __xe_printfn_err,
> +		.arg = xe,
> +	};
> +	return p;
> +}
> +
> +/**
> + * xe_info_printer - Construct a &drm_printer that outputs to xe_info()
> + * @xe: the &xe_device pointer to use in xe_info()
> + *
> + * Return: The &drm_printer object.
> + */
> +static inline struct drm_printer xe_info_printer(struct xe_device *xe)
> +{
> +	struct drm_printer p = {
> +		.printfn = __xe_printfn_info,
> +		.arg = xe,
> +	};
> +	return p;
> +}
> +
> +/**
> + * xe_dbg_printer - Construct a &drm_printer that outputs like xe_dbg()
> + * @xe: the &xe_device pointer to use in xe_dbg()
> + *
> + * Return: The &drm_printer object.
> + */
> +static inline struct drm_printer xe_dbg_printer(struct xe_device *xe)
> +{
> +	struct drm_printer p = {
> +		.printfn = __xe_printfn_dbg,
> +		.arg = xe,
> +		.origin = (const void *)_THIS_IP_,
> +	};
> +	return p;
> +}
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_tile_printk.h b/drivers/gpu/drm/xe/xe_tile_printk.h
> new file mode 100644
> index 000000000000..ed951cdb08cb
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_tile_printk.h
> @@ -0,0 +1,127 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _xe_tile_printk_H_
> +#define _xe_tile_printk_H_
> +
> +#include "xe_printk.h"
> +
> +#define __xe_tile_printk_fmt(_tile, _fmt, _args...)	"Tile%u: " _fmt, (_tile)->id, ##_args
> +
> +#define xe_tile_printk(_tile, _level, _fmt, ...) \
> +	xe_printk((_tile)->xe, _level, __xe_tile_printk_fmt((_tile), _fmt, ##__VA_ARGS__))
> +
> +#define xe_tile_err(_tile, _fmt, ...) \
> +	xe_tile_printk((_tile), err, _fmt, ##__VA_ARGS__)
> +
> +#define xe_tile_err_once(_tile, _fmt, ...) \
> +	xe_tile_printk((_tile), err_once, _fmt, ##__VA_ARGS__)
> +
> +#define xe_tile_err_ratelimited(_tile, _fmt, ...) \
> +	xe_tile_printk((_tile), err_ratelimited, _fmt, ##__VA_ARGS__)
> +
> +#define xe_tile_warn(_tile, _fmt, ...) \
> +	xe_tile_printk((_tile), warn, _fmt, ##__VA_ARGS__)
> +
> +#define xe_tile_notice(_tile, _fmt, ...) \
> +	xe_tile_printk((_tile), notice, _fmt, ##__VA_ARGS__)
> +
> +#define xe_tile_info(_tile, _fmt, ...) \
> +	xe_tile_printk((_tile), info, _fmt, ##__VA_ARGS__)
> +
> +#define xe_tile_dbg(_tile, _fmt, ...) \
> +	xe_tile_printk((_tile), dbg, _fmt, ##__VA_ARGS__)
> +
> +#define xe_tile_WARN_type(_tile, _type, _condition, _fmt, ...) \
> +	xe_WARN##_type((_tile)->xe, _condition, _fmt, ## __VA_ARGS__)
> +
> +#define xe_tile_WARN(_tile, _condition, _fmt, ...) \
> +	xe_tile_WARN_type((_tile),, _condition, __xe_tile_printk_fmt((_tile), _fmt, ##__VA_ARGS__))
> +
> +#define xe_tile_WARN_ONCE(_tile, _condition, _fmt, ...) \
> +	xe_tile_WARN_type((_tile), _ONCE, _condition, __xe_tile_printk_fmt((_tile), _fmt, ##__VA_ARGS__))
> +
> +#define xe_tile_WARN_ON(_tile, _condition) \
> +	xe_tile_WARN((_tile), _condition, "%s(%s)", "WARN_ON", __stringify(_condition))
> +
> +#define xe_tile_WARN_ON_ONCE(_tile, _condition) \
> +	xe_tile_WARN_ONCE((_tile), _condition, "%s(%s)", "WARN_ON_ONCE", __stringify(_condition))
> +
> +static inline void __xe_tile_printfn_err(struct drm_printer *p, struct va_format *vaf)
> +{
> +	struct xe_tile *tile = p->arg;
> +
> +	xe_tile_err(tile, "%pV", vaf);
> +}
> +
> +static inline void __xe_tile_printfn_info(struct drm_printer *p, struct va_format *vaf)
> +{
> +	struct xe_tile *tile = p->arg;
> +
> +	xe_tile_info(tile, "%pV", vaf);
> +}
> +
> +static inline void __xe_tile_printfn_dbg(struct drm_printer *p, struct va_format *vaf)
> +{
> +	struct xe_tile *tile = p->arg;
> +	struct drm_printer dbg;
> +
> +	/*
> +	 * The original xe_tile_dbg() callsite annotations are useless here,
> +	 * redirect to the tweaked xe_dbg_printer() instead.
> +	 */
> +	dbg = xe_dbg_printer(tile->xe);
> +	dbg.origin = p->origin;
> +
> +	drm_printf(&dbg, __xe_tile_printk_fmt(tile, "%pV", vaf));
> +}
> +
> +/**
> + * xe_tile_err_printer - Construct a &drm_printer that outputs to xe_tile_err()
> + * @tile: the &xe_tile pointer to use in xe_tile_err()
> + *
> + * Return: The &drm_printer object.
> + */
> +static inline struct drm_printer xe_tile_err_printer(struct xe_tile *tile)
> +{
> +	struct drm_printer p = {
> +		.printfn = __xe_tile_printfn_err,
> +		.arg = tile,
> +	};
> +	return p;
> +}
> +
> +/**
> + * xe_tile_info_printer - Construct a &drm_printer that outputs to xe_tile_info()
> + * @tile: the &xe_tile pointer to use in xe_tile_info()
> + *
> + * Return: The &drm_printer object.
> + */
> +static inline struct drm_printer xe_tile_info_printer(struct xe_tile *tile)
> +{
> +	struct drm_printer p = {
> +		.printfn = __xe_tile_printfn_info,
> +		.arg = tile,
> +	};
> +	return p;
> +}
> +
> +/**
> + * xe_tile_dbg_printer - Construct a &drm_printer that outputs like xe_tile_dbg()
> + * @tile: the &xe_tile pointer to use in xe_tile_dbg()
> + *
> + * Return: The &drm_printer object.
> + */
> +static inline struct drm_printer xe_tile_dbg_printer(struct xe_tile *tile)
> +{
> +	struct drm_printer p = {
> +		.printfn = __xe_tile_printfn_dbg,
> +		.arg = tile,
> +		.origin = (const void *)_THIS_IP_,
> +	};
> +	return p;
> +}
> +
> +#endif
> -- 
> 2.47.1
> 

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 935CCC982FA
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 15:14:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BEA710ED71;
	Tue, 22 Sep 2026 15:14:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L0cmZuBi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B4E210ED71
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Sep 2026 15:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790090078; x=1821626078;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GjJodGaScHN3ki0evBR7Ye+Lk1TLwmt3uXpFkKa+hWA=;
 b=L0cmZuBiTLIecoYII+XS4uz6CYErrHLPcHOHtJqy45he6qlSkjeOc18M
 nF6Hmxz7KgLqJVtFi1mQshE6h3s8dSoXqv+IYyh/8JDVB4RaLdGTgg5lE
 nUzy9tHvoj+69FYRT6EkOsMwgfEaqieizf3esaBdRuPN9Hx8yOkTysrEZ
 HI6LPYRCU4apl4/Halsh4rysrq2yLMGoZOBo4Z8gMzHT2pabBPerdH/9f
 UXKDOItAlCJdntk9ERD/6chSDRXWmKny5hoXd804qCkP5nbbljcrBVzls
 NxgX6tWRh3SY1dal5SyXSmYrjlFmCYVAWVfhWyL7dCkI88CCRWHgBQypW w==;
X-CSE-ConnectionGUID: ZUW95LuUTuaGjJ/IinC+ng==
X-CSE-MsgGUID: sFhMSo+SR+u5XnnHe12Icg==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="101362963"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="101362963"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 08:14:37 -0700
X-CSE-ConnectionGUID: w1xuL3v5Ra6EdpXFCZ1kpw==
X-CSE-MsgGUID: FK09Rx67Tde7M6TV2wv7EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="281243525"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 08:14:38 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 08:14:37 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 22 Sep 2026 08:14:37 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.24) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 08:14:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lNRNvLPsAekAEBjZVlmkT/7V21DCxP6KbzpUFkPnvXZbetICzU1VFqYisGL3fXyb1q3/iQep4SFnbn3mIWFTbaHXFVWNTuXvWUxP2nJoeRkVPAOVyynh42QzApJaAnns8x/b0W1C7bpjucHDTwcHuyGPCfdu6XhMG4TbzveSVCYshC6/MnNiDL1UQt4tCx5AtpEvyJ9djZZJ/bosTf20W/7hZSUJuZc4dSDNEEO4n5kg+be2j2auHEyNHPE4tAgFIQeca6s1A9zDJ1MnosJonnyQXGOraCMivssaSDJZgbSusYcBm6/q++dt+3tpvN/B4bg/zKmMA5ruAcyb4Fz2ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iEmVnk8At7LD6Ye5mmgXMS12t1NL1zeBLhCXQUNG/KQ=;
 b=adOueio+ci6nWAT5VybnojOAVhk+Bgd/TNu6bI0UBCE6DTqetaQZuJha7vG91jpNowKIKLj8Iyc0fGHV7Kt5dQ3vbowbxHnCpcvdm7/Ox8CMHnWLZa8l6cSWrFt7zBuXtamyNX1p+H2Y38CMttPmOsFp0duaGtlcCXuYdhdL1XxR9XRIEFSkBloWgBoe8ZEtXyLuZ6Z0o2RAcT1gMrzvivto2di6EN62j6/82GeByGXCjXTDimkwUq5nhx8Bj14WB6ISWumdKzMD3f0rPxF3cOvYFyMNneadi1pTq6IgAEjuX6sN6DWacopotajiNorGeLW9G0AHdDkb+cjTTESLZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by LVUPR11MB9857.namprd11.prod.outlook.com (2603:10b6:408:38b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Tue, 22 Sep
 2026 15:14:32 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%6]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 15:14:32 +0000
Date: Tue, 22 Sep 2026 08:14:30 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <tilak.tirumalesh.tangudu@intel.com>
Subject: Re: =?utf-8?B?4pyTIFhlLkNJLkZVTEw6IHN1Y2Nl?=
 =?utf-8?Q?ss_for_drm=2Fxe?= =?utf-8?Q?=3A?= Add wa_14025941587 to xe2, xe3
 and xe3p platforms (rev11)
Message-ID: <20260922151430.GF730887@mdroper-desk1.amr.corp.intel.com>
References: <20260916100545.779894-1-tilak.tirumalesh.tangudu@intel.com>
 <178956447463.171945.2288526611957058162@61270ab9df2a>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <178956447463.171945.2288526611957058162@61270ab9df2a>
X-ClientProxiedBy: SJ0PR03CA0043.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::18) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|LVUPR11MB9857:EE_
X-MS-Office365-Filtering-Correlation-Id: 44a9f92a-0f79-4332-e374-08df18bc3457
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|4143699003|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: lo7cCMTFTpWt0HNTiNydvam4ksxg04I6nAYT+d2IE0gd0OFFpTqxcVQ5PyWHEvpeUtdFxnwzOveO35NgP+F+B3986Fo91TpAAfIp3LrAHNzesh8EwVtyDvoDNPnlLxuLp084s7esw+qrXzkvk6dXb5Ek6NqvKz5SoS1Y0O007Glz8pRYbpIXBo96NTmE4d97HzVtxVPz01jonuZvtdcfZmhWn/88AEM5VKQ9Hb4zC0fwnT6BpJqp7e+IBGjGQyJaBSobasomv+0lOiCLIP/hB+tl+dxQyPB6NrHbKb5oZbYKY0wXjMJ+oWgdzgN4hb6KX6yOmtX9R591XuXUWJqrmqF+b3c1ThDNLMr67LGmQFeYps2rYKfQ2RRDN6PXkepuT50dTNYerBOWSyx81sbo74GX9oInlNPwipBf9D/WSeHTU6JIIio0v5xK8s7ZaF3DD/KUXQQRMxnFd5GNLSvAZQ94MMr4+YZsJddYeyZ2iexJKAgLZpTiQQs9b14qScQak1bAloH9OfAHvbuW0gYh0nUEdoKOn1LO+livW28y0IQdJdx/8GERjmzlMVM2E0nk8ltW97fIiyMkFAcgLT9xQgXHTL3A1ZJ8HB3HejoOnQo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(4143699003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9H/6qCh1Z9Plsb55jSq21LaKShh3O5Q+fmM6l5JF5S6Kn9uD3Ow/XnAklgIZ?=
 =?us-ascii?Q?GoCLeDcwjwkgAhkxOow8zcGfkWRnhJiCjCp39DKXP+QagFNF8DDGSDkcPTBm?=
 =?us-ascii?Q?k0bVQUAcTakDlMf6o1kwrOLmF8hytQPvCdLAY/vkBXa1C1l5l1dibJ4kOusp?=
 =?us-ascii?Q?gCyAmOg998KO5ErOCdELoR2xoMBTQSBBfhq3ZpzqPri8Lr6prKWoGZCJh/kk?=
 =?us-ascii?Q?SgQBzz2PWXHBXggKe3jKbAvJ8+Cz16GxK+bM5OlRvvsOFoGPHw+5qItTloHO?=
 =?us-ascii?Q?Epz/vRLLOnF1rLcQUFpMImnszedtjPb9+9+eJtEto0wDW811eL/TAcyjk8qU?=
 =?us-ascii?Q?qAsZ0cL8VyYBhx3j2R43D3xxkiM6KbNhy/cT0OEMpWHJ4FEWp/IEfMY/WYLB?=
 =?us-ascii?Q?A+TiTL8srNpfut2ZwGKkgNPu6PIiYfiStpz6R9dkJ9yU7Nujd1Wl19MrJ2AO?=
 =?us-ascii?Q?vgEyLxBYJSOTWCuxyMD3PdJR5AodDvJC/E8ktqChHmXe6QD0BInU8XvU3SC1?=
 =?us-ascii?Q?XEdnRDL0yPBsopv2w/b0nqm7ySxyMY4scwMIrzZazY+mSyxcTq3qloLbIbIt?=
 =?us-ascii?Q?s65eru9p5RGyaRirwKejXW+UuamRfvY1SYq/8qef6C0xMBb8ZzV+h+LJDILj?=
 =?us-ascii?Q?melF5VKJF5+YmUZZfKdjJGHUJQr6JRArf60/ysmzefeA/dd5CgGNE2bdV9pm?=
 =?us-ascii?Q?/Z9qYMxeJcAXRCmic8H02Gq0QOlP9cyzIU/oKGJNXcPcMPveMjRS4XbeARuq?=
 =?us-ascii?Q?DZiKigwROyMC280cCdAci4hM36+ImwaFVjRVkR+hWoZi0qp40BgQftgZx/iF?=
 =?us-ascii?Q?eNrReQO4FJ4h4G+VdoMBLvXaxMmndAYRk9GPlA2AbWpFuzoRI/Lc3ARcVzCY?=
 =?us-ascii?Q?LXouOBwUtdIdz0kFQ8aWJbSCDJsxBgzxs0dQQLY66kvgPmCbvV+539tQVrHH?=
 =?us-ascii?Q?sWMA51Xsjp61A42BUG1B3QONm0zmGwjd1BinhC4LJDibNJS8nzq1DpXyqL+9?=
 =?us-ascii?Q?gYeXiRsQH6dSvrkv6LW67gLPganDLWKFLkaNp7K88SB1cb6gOJrVp1YfEb7U?=
 =?us-ascii?Q?2e7QaSAg2/NVNoadZSMFvNf5Pi96ucf5/14vtl93nY73jbkUylmSsElK4tZv?=
 =?us-ascii?Q?DlcfUl6Ov6ENtjKawxRoRMhnNK4VQgS6/e39ZhuJhyytAQUZlnVC59kHuIKP?=
 =?us-ascii?Q?S8a4Rkzvcc9hvIv+Dmjvvu7uscZEFw7GDqStqjR/ohKy5vNaV+poMsuzGXvT?=
 =?us-ascii?Q?4I2XigJhltryWRn8vYTiCH9//IRmky4cuYtIY5liMYhB9vfrPwvwCK4moh/J?=
 =?us-ascii?Q?LPKSOggpzO/KBRZQtr2vCub00+udsNzcvYbyj8zdWF60cNbClvSS0aYQSGmc?=
 =?us-ascii?Q?cKi6ONyzEy+WVbDBPLf+oTrh1jhbBsJXbK5Eb7RRxMrBo9m39lUwkd2UsSuz?=
 =?us-ascii?Q?6YaeIpO38CiSZzMEfhOh+S5W6qDkuHo3TvgdWZo/ZM+33YXgepx4EE0WXu6K?=
 =?us-ascii?Q?4uNAvcB8F+ji4pW/4QtfJ3jzP4O49GjuuH0Xujd+BB5I275mAqahw4PYK8tt?=
 =?us-ascii?Q?KOrOOVBVPV8fxppwZV7QyslG7KSiYeWn2230qO/QjwYs3SHKIsNbIMZCFrJN?=
 =?us-ascii?Q?7QtXafArBZTp33COtiCqmn7lR5rReVUpq4mDxqLhdyWRGWJmEJKfq6CRQynJ?=
 =?us-ascii?Q?AvE4+G9bSAO1hK7a1/Z2DZYBCLfIffzkmHedz9CYVMBFO2nNWfk7T9XhTQ9H?=
 =?us-ascii?Q?5ehNigMGKZ7lDHmGBLKhGjHif5tGL1A=3D?=
X-Exchange-RoutingPolicyChecked: Le8+6HvUECirYal6FNkDWA7s3/w+bLTc2XLaA/+HG9FiLmMpsExR0LALA2gPNcWPrkntGQcoJpfghnexaKuDMtGcYt0jnJ8ih7jkxSc84Mq+ftdjLs5pfVou33XnQrfIwAb1ezWBuyNBMtnEJk+Xy4car05QwrkyuiWnq1THVtDCuyUA5DEZ7PQ0d5bdPoJcsTjsnVHCzAS2Z8EzpxqLMX3B7wZS5vVLrFwSjOS1AkxxFfP/zmaOQGaEG4X+nemcMa1P1Oos8klNsPR3ETaRZdspUnNgHaVyfbG0Pu2rmhJyHNEr/i+3WAEucr+iI9NPmRLgh7xkNiIDxfWYfflugg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 44a9f92a-0f79-4332-e374-08df18bc3457
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 15:14:32.4816 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oLZ3brSf+qFklrwUb1jwiC8aBMUUAAEmrn0HlzY0A9OIBBCXHlZwUzdjrulSwQrk1BhPinw3aBqRCOMum8Pu8+eIS+0qaPDgeFKZq8IA1hU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR11MB9857
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

On Wed, Sep 16, 2026 at 01:14:34PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: Add wa_14025941587 to xe2, xe3 and xe3p platforms (rev11)
> URL   : https://patchwork.freedesktop.org/series/167706/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-5755-0fb8d1900f1a6b9d21aadbfa5f784979b950bcf8_FULL -> xe-pw-167706v11_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.

Applied to drm-xe-next.  Thanks for the patches and review.


Matt

> 
>   
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-167706v11_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@intel_hwmon@hwmon-write:
>     - shard-lnl:          NOTRUN -> [SKIP][1] ([Intel XE#1125] / [Intel XE#7312])
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-2/igt@intel_hwmon@hwmon-write.html
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - shard-lnl:          NOTRUN -> [SKIP][2] ([Intel XE#1466])
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-4/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
>     - shard-lnl:          NOTRUN -> [SKIP][3] ([Intel XE#3279]) +1 other test skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
>     - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#2370])
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
> 
>   * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
>     - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#1407]) +5 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-2/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>     - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#3658] / [Intel XE#7360]) +1 other test skip
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#7059] / [Intel XE#7085])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-3/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
>     - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#1124]) +12 other tests skip
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-7/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>     - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#607] / [Intel XE#7361])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
>     - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#1124])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-bmg-10/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb:
>     - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#1467] / [Intel XE#7367])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-6/igt@kms_big_fb@yf-tiled-addfb.html
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p:
>     - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#7679]) +1 other test skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-1/igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p:
>     - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#7679])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-target-2560x1440p:
>     - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#367]) +1 other test skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-1/igt@kms_bw@linear-tiling-3-displays-target-2560x1440p.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
>     - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#2887]) +17 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-8/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>     - shard-bmg:          [PASS][16] -> [INCOMPLETE][17] ([Intel XE#7084] / [Intel XE#8150]) +1 other test incomplete
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5755-0fb8d1900f1a6b9d21aadbfa5f784979b950bcf8/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
>     - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#3432]) +3 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
> 
>   * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2887]) +4 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-bmg-6/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html
> 
>   * igt@kms_chamelium_color@ctm-max:
>     - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#306] / [Intel XE#7358]) +1 other test skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-4/igt@kms_chamelium_color@ctm-max.html
> 
>   * igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d:
>     - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#7358]) +2 other tests skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-4/igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd:
>     - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#373]) +9 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-7/igt@kms_chamelium_hpd@dp-hpd.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-storm:
>     - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2252]) +2 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd-storm.html
> 
>   * igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-b-plane-3:
>     - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#6969]) +7 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-bmg-5/igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-b-plane-3.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#307] / [Intel XE#6974])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-4/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_content_protection@lic-type-1:
>     - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#7642]) +5 other tests skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-8/igt@kms_content_protection@lic-type-1.html
> 
>   * igt@kms_content_protection@suspend-resume@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [FAIL][27] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-bmg-2/igt@kms_content_protection@suspend-resume@pipe-a-dp-2.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x512:
>     - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2321] / [Intel XE#7355]) +1 other test skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x170:
>     - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#2321] / [Intel XE#7355])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-3/igt@kms_cursor_crc@cursor-onscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
>     - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#1424]) +4 other tests skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-6/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html
> 
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
>     - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#309] / [Intel XE#7343]) +4 other tests skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>     - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#323] / [Intel XE#6035])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
> 
>   * igt@kms_dp_link_training@non-uhbr-mst:
>     - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#4354] / [Intel XE#5882])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-5/igt@kms_dp_link_training@non-uhbr-mst.html
> 
>   * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
>     - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#8265])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-bmg-5/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
> 
>   * igt@kms_dsc@dsc-with-bpc-formats:
>     - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#8265]) +4 other tests skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-7/igt@kms_dsc@dsc-with-bpc-formats.html
> 
>   * igt@kms_feature_discovery@dp-mst:
>     - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#1137] / [Intel XE#2375])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-3/igt@kms_feature_discovery@dp-mst.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend-interruptible:
>     - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#1421]) +11 other tests skip
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-5/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible:
>     - shard-lnl:          NOTRUN -> [FAIL][38] ([Intel XE#301]) +1 other test fail
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
>     - shard-lnl:          [PASS][39] -> [FAIL][40] ([Intel XE#301])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5755-0fb8d1900f1a6b9d21aadbfa5f784979b950bcf8/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-bmg:          [PASS][41] -> [INCOMPLETE][42] ([Intel XE#2049] / [Intel XE#2597] / [Intel XE#8155]) +1 other test incomplete
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5755-0fb8d1900f1a6b9d21aadbfa5f784979b950bcf8/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#1397] / [Intel XE#1745] / [Intel XE#7385] / [Intel XE#9144]) +3 other tests skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x:
>     - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#7179])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#1397] / [Intel XE#7385] / [Intel XE#9144]) +3 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#7178] / [Intel XE#7351]) +1 other test skip
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#7178] / [Intel XE#7351]) +1 other test skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2311]) +9 other tests skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-wc:
>     - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#7061] / [Intel XE#7356]) +2 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#6312] / [Intel XE#651]) +20 other tests skip
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-shrfb-pgflip-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#6312]) +16 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-render:
>     - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#7905]) +61 other tests skip
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff:
>     - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#7865]) +34 other tests skip
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-3/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render:
>     - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#7061]) +6 other tests skip
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-1/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
>     - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#656] / [Intel XE#7905]) +47 other tests skip
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2313]) +11 other tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-bmg-10/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#7061])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-bmg-9/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-render.html
> 
>   * igt@kms_hdmi_inject@inject-4k:
>     - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#1470])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-7/igt@kms_hdmi_inject@inject-4k.html
> 
>   * igt@kms_hdr@static-toggle-suspend:
>     - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#1503])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-4/igt@kms_hdr@static-toggle-suspend.html
> 
>   * igt@kms_joiner@basic-max-non-joiner:
>     - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#4298] / [Intel XE#5873])
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-2/igt@kms_joiner@basic-max-non-joiner.html
> 
>   * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
>     - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#7173] / [Intel XE#7294])
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-5/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#7591])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-bmg-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:
>     - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#7283]) +1 other test skip
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-bmg-2/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html
> 
>   * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier:
>     - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#7283]) +5 other tests skip
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-2/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier.html
> 
>   * igt@kms_plane_lowres@tiling-yf:
>     - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#599])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-8/igt@kms_plane_lowres@tiling-yf.html
> 
>   * igt@kms_plane_multiple@2x-tiling-none:
>     - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#4596] / [Intel XE#5854]) +2 other tests skip
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-4/igt@kms_plane_multiple@2x-tiling-none.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c:
>     - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#2763] / [Intel XE#6886]) +13 other tests skip
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-4/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
>     - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2763] / [Intel XE#6886]) +4 other tests skip
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-framegap:
>     - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#8395] / [Intel XE#8396]) +3 other tests skip
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-2/igt@kms_pm_dc@dc3co-vpb-framegap.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-framegap@psr2-xrgb8888:
>     - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#8396]) +3 other tests skip
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-2/igt@kms_pm_dc@dc3co-vpb-framegap@psr2-xrgb8888.html
> 
>   * igt@kms_pm_dc@dc6-psr:
>     - shard-lnl:          NOTRUN -> [FAIL][72] ([Intel XE#8399])
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-2/igt@kms_pm_dc@dc6-psr.html
> 
>   * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
>     - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#1439] / [Intel XE#7402] / [Intel XE#836])
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-bmg-10/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
>     - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304]) +3 other tests skip
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#4608] / [Intel XE#7304]) +3 other tests skip
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#4608]) +3 other tests skip
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1.html
> 
>   * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
>     - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#2893] / [Intel XE#7304]) +1 other test skip
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-5/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
>     - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#1489]) +2 other tests skip
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-bmg-3/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html
> 
>   * igt@kms_psr2_su@frontbuffer-xrgb8888:
>     - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#1128] / [Intel XE#7413])
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html
> 
>   * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
>     - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#1406] / [Intel XE#7345])
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-6/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html
> 
>   * igt@kms_psr@fbc-psr2-cursor-plane-onoff@edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#1406] / [Intel XE#4609] / [Intel XE#7345])
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-6/igt@kms_psr@fbc-psr2-cursor-plane-onoff@edp-1.html
> 
>   * igt@kms_psr@pr-no-drrs:
>     - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#1406]) +7 other tests skip
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-7/igt@kms_psr@pr-no-drrs.html
> 
>   * igt@kms_psr@psr2-sprite-plane-onoff:
>     - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-bmg-2/igt@kms_psr@psr2-sprite-plane-onoff.html
> 
>   * igt@kms_rotation_crc@bad-pixel-format:
>     - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#3904] / [Intel XE#7342])
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-bmg-8/igt@kms_rotation_crc@bad-pixel-format.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
>     - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#1127] / [Intel XE#5813])
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>     - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342])
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
> 
>   * igt@kms_scaling_modes@scaling-mode-center:
>     - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#2413])
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-bmg-2/igt@kms_scaling_modes@scaling-mode-center.html
> 
>   * igt@kms_vrr@flip-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#1499] / [Intel XE#9271])
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-bmg-7/igt@kms_vrr@flip-basic.html
> 
>   * igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all:
>     - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#8866])
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-2/igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all.html
> 
>   * igt@xe_cw_post_sync@walker-post-sync:
>     - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#8608])
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-bmg-10/igt@xe_cw_post_sync@walker-post-sync.html
> 
>   * igt@xe_evict@evict-beng-mixed-threads-large-multi-vm:
>     - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#6540] / [Intel XE#688]) +12 other tests skip
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-7/igt@xe_evict@evict-beng-mixed-threads-large-multi-vm.html
> 
>   * igt@xe_evict@evict-small-multi-queue-priority:
>     - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#8370])
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-bmg-3/igt@xe_evict@evict-small-multi-queue-priority.html
> 
>   * igt@xe_exec_balancer@once-parallel-userptr-rebind:
>     - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#7482]) +23 other tests skip
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-1/igt@xe_exec_balancer@once-parallel-userptr-rebind.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
>     - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#1392]) +9 other tests skip
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
>     - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#2322] / [Intel XE#7372]) +1 other test skip
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html
> 
>   * igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch:
>     - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#8374]) +1 other test skip
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-bmg-10/igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch.html
> 
>   * igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind:
>     - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#8374]) +11 other tests skip
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-5/igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind.html
> 
>   * igt@xe_exec_mix_modes@exec-multi-queue-spinner-interrupted-lr:
>     - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#9003])
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-7/igt@xe_exec_mix_modes@exec-multi-queue-spinner-interrupted-lr.html
> 
>   * igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem:
>     - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#8364]) +7 other tests skip
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-bmg-3/igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem.html
> 
>   * igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr:
>     - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#8364]) +34 other tests skip
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-4/igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr.html
> 
>   * igt@xe_exec_reset@cm-multi-queue-close-execqueues:
>     - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#8369]) +1 other test skip
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-5/igt@xe_exec_reset@cm-multi-queue-close-execqueues.html
> 
>   * igt@xe_exec_reset@cm-multi-queue-close-fd:
>     - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#8369])
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-bmg-2/igt@xe_exec_reset@cm-multi-queue-close-fd.html
> 
>   * igt@xe_exec_reset@gt-reset-fault-injection:
>     - shard-lnl:          NOTRUN -> [ABORT][103] ([Intel XE#9145])
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-7/igt@xe_exec_reset@gt-reset-fault-injection.html
> 
>   * igt@xe_exec_threads@threads-hang-userptr-invalidate-race:
>     - shard-bmg:          [PASS][104] -> [FAIL][105] ([Intel XE#9096])
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5755-0fb8d1900f1a6b9d21aadbfa5f784979b950bcf8/shard-bmg-3/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-bmg-6/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-rebind:
>     - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#8378]) +11 other tests skip
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-4/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-rebind.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-userptr:
>     - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#8378])
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-userptr.html
> 
>   * igt@xe_gpgpu_fill@offset-4x4:
>     - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#7954])
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-2/igt@xe_gpgpu_fill@offset-4x4.html
> 
>   * igt@xe_mmap@pci-membarrier:
>     - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#5100] / [Intel XE#7322] / [Intel XE#7408])
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-5/igt@xe_mmap@pci-membarrier.html
> 
>   * igt@xe_multigpu_svm@mgpu-coherency-fail-basic:
>     - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#6964]) +4 other tests skip
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-8/igt@xe_multigpu_svm@mgpu-coherency-fail-basic.html
> 
>   * igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch:
>     - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#6964])
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-bmg-10/igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch.html
> 
>   * igt@xe_page_reclaim@basic-mixed:
>     - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#7793])
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-bmg-4/igt@xe_page_reclaim@basic-mixed.html
> 
>   * igt@xe_page_reclaim@binds-null-vma:
>     - shard-lnl:          NOTRUN -> [SKIP][113] ([Intel XE#7793]) +2 other tests skip
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-8/igt@xe_page_reclaim@binds-null-vma.html
> 
>   * igt@xe_pat@l2-flush-opt-svm-pat-restrict:
>     - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#7590] / [Intel XE#7772])
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-7/igt@xe_pat@l2-flush-opt-svm-pat-restrict.html
> 
>   * igt@xe_pat@pat-index-xelp:
>     - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#2245] / [Intel XE#7590])
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-bmg-3/igt@xe_pat@pat-index-xelp.html
> 
>   * igt@xe_pm@d3cold-basic:
>     - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#2284] / [Intel XE#366] / [Intel XE#7370]) +1 other test skip
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-5/igt@xe_pm@d3cold-basic.html
> 
>   * igt@xe_pm@s3-exec-after:
>     - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#584] / [Intel XE#7369])
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-6/igt@xe_pm@s3-exec-after.html
> 
>   * igt@xe_pm@s3-multiple-execs:
>     - shard-bmg:          [PASS][118] -> [INCOMPLETE][119] ([Intel XE#8175])
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5755-0fb8d1900f1a6b9d21aadbfa5f784979b950bcf8/shard-bmg-10/igt@xe_pm@s3-multiple-execs.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-bmg-6/igt@xe_pm@s3-multiple-execs.html
> 
>   * igt@xe_pm_residency@cpg-basic:
>     - shard-bmg:          [PASS][120] -> [INCOMPLETE][121] ([Intel XE#9202])
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5755-0fb8d1900f1a6b9d21aadbfa5f784979b950bcf8/shard-bmg-9/igt@xe_pm_residency@cpg-basic.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-bmg-6/igt@xe_pm_residency@cpg-basic.html
> 
>   * igt@xe_prefetch_fault@prefetch-fault:
>     - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#7599])
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-5/igt@xe_prefetch_fault@prefetch-fault.html
> 
>   * igt@xe_prefetch_fault@prefetch-fault-svm:
>     - shard-bmg:          NOTRUN -> [SKIP][123] ([Intel XE#7599])
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-bmg-1/igt@xe_prefetch_fault@prefetch-fault-svm.html
> 
>   * igt@xe_query@multigpu-query-pxp-status:
>     - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#944]) +1 other test skip
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-3/igt@xe_query@multigpu-query-pxp-status.html
> 
>   * igt@xe_query@multigpu-query-uc-fw-version-guc:
>     - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#944])
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-bmg-9/igt@xe_query@multigpu-query-uc-fw-version-guc.html
> 
>   * igt@xe_sriov_admin@bulk-sched-priority-vfs-disabled:
>     - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#7174]) +2 other tests skip
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-5/igt@xe_sriov_admin@bulk-sched-priority-vfs-disabled.html
> 
>   * igt@xe_sriov_auto_provisioning@fair-allocation:
>     - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#4130] / [Intel XE#7366])
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-4/igt@xe_sriov_auto_provisioning@fair-allocation.html
> 
>   * igt@xe_sriov_flr@flr-twice:
>     - shard-lnl:          NOTRUN -> [SKIP][128] ([Intel XE#4273])
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-3/igt@xe_sriov_flr@flr-twice.html
> 
>   * igt@xe_sriov_scheduling@nonpreempt-engine-resets-low-priority:
>     - shard-lnl:          NOTRUN -> [SKIP][129] ([Intel XE#8339])
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-8/igt@xe_sriov_scheduling@nonpreempt-engine-resets-low-priority.html
> 
>   * igt@xe_survivability@runtime-survivability:
>     - shard-lnl:          NOTRUN -> [SKIP][130] ([Intel XE#8415])
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-4/igt@xe_survivability@runtime-survivability.html
> 
>   * igt@xe_vm@overcommit-fault-vram-lr-no-overcommit:
>     - shard-lnl:          NOTRUN -> [SKIP][131] ([Intel XE#7892])
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-5/igt@xe_vm@overcommit-fault-vram-lr-no-overcommit.html
> 
>   * igt@xe_wedged@basic-wedged:
>     - shard-lnl:          NOTRUN -> [DMESG-WARN][132] ([Intel XE#8963])
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-6/igt@xe_wedged@basic-wedged.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
>     - shard-lnl:          [FAIL][133] ([Intel XE#301]) -> [PASS][134]
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5755-0fb8d1900f1a6b9d21aadbfa5f784979b950bcf8/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
> 
>   * igt@kms_pm_dc@dc5-psr-suspend-resume:
>     - shard-lnl:          [FAIL][135] ([Intel XE#8399]) -> [PASS][136]
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5755-0fb8d1900f1a6b9d21aadbfa5f784979b950bcf8/shard-lnl-4/igt@kms_pm_dc@dc5-psr-suspend-resume.html
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-lnl-6/igt@kms_pm_dc@dc5-psr-suspend-resume.html
> 
>   * igt@xe_sriov_flr@flr-vfs-parallel:
>     - shard-bmg:          [FAIL][137] ([Intel XE#6569]) -> [PASS][138]
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5755-0fb8d1900f1a6b9d21aadbfa5f784979b950bcf8/shard-bmg-4/igt@xe_sriov_flr@flr-vfs-parallel.html
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-bmg-2/igt@xe_sriov_flr@flr-vfs-parallel.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-bmg:          [SKIP][139] ([Intel XE#2426] / [Intel XE#5848]) -> [FAIL][140] ([Intel XE#1729] / [Intel XE#7424])
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5755-0fb8d1900f1a6b9d21aadbfa5f784979b950bcf8/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-bmg:          [SKIP][141] ([Intel XE#2426] / [Intel XE#5848]) -> [SKIP][142] ([Intel XE#2509] / [Intel XE#7437])
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5755-0fb8d1900f1a6b9d21aadbfa5f784979b950bcf8/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
>   [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
>   [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
>   [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
>   [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
>   [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
>   [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
>   [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
>   [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
>   [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
>   [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
>   [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
>   [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
>   [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
>   [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
>   [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
>   [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
>   [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>   [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
>   [Intel XE#5854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854
>   [Intel XE#5873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5873
>   [Intel XE#5882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5882
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
>   [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>   [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
>   [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
>   [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
>   [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
>   [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
>   [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
>   [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
>   [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
>   [Intel XE#7173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7173
>   [Intel XE#7174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7174
>   [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
>   [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
>   [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
>   [Intel XE#7294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7294
>   [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
>   [Intel XE#7312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7312
>   [Intel XE#7322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7322
>   [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
>   [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
>   [Intel XE#7345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345
>   [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
>   [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
>   [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
>   [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
>   [Intel XE#7360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7360
>   [Intel XE#7361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361
>   [Intel XE#7366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7366
>   [Intel XE#7367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367
>   [Intel XE#7369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369
>   [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
>   [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
>   [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
>   [Intel XE#7385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385
>   [Intel XE#7402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7402
>   [Intel XE#7408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7408
>   [Intel XE#7413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413
>   [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
>   [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
>   [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
>   [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
>   [Intel XE#7591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591
>   [Intel XE#7599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599
>   [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
>   [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
>   [Intel XE#7772]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7772
>   [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
>   [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
>   [Intel XE#7892]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7892
>   [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
>   [Intel XE#7954]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7954
>   [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
>   [Intel XE#8155]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8155
>   [Intel XE#8175]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8175
>   [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
>   [Intel XE#8339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8339
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
>   [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
>   [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
>   [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
>   [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
>   [Intel XE#8395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
>   [Intel XE#8396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396
>   [Intel XE#8399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399
>   [Intel XE#8415]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8415
>   [Intel XE#8608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8608
>   [Intel XE#8866]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8866
>   [Intel XE#8963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963
>   [Intel XE#9003]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9003
>   [Intel XE#9096]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096
>   [Intel XE#9144]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144
>   [Intel XE#9145]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9145
>   [Intel XE#9202]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9202
>   [Intel XE#9271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_9098 -> IGT_9099
>   * Linux: xe-5755-0fb8d1900f1a6b9d21aadbfa5f784979b950bcf8 -> xe-pw-167706v11
> 
>   IGT_9098: 9098
>   IGT_9099: 9099
>   xe-5755-0fb8d1900f1a6b9d21aadbfa5f784979b950bcf8: 0fb8d1900f1a6b9d21aadbfa5f784979b950bcf8
>   xe-pw-167706v11: 167706v11
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v11/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

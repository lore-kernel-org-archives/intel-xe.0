Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87233C2BA15
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jun 2024 19:27:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29A8910E778;
	Tue, 18 Jun 2024 19:27:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LudjzIBG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D1BB10E778
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Jun 2024 19:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718738837; x=1750274837;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wPOqDe099cfr33YsupvZIgb+3NjvEozgwhOhtNeugfM=;
 b=LudjzIBGXDjFmZ9LN5d65f5Q28i4Bnha5I6LK//fZqKRJRGmK2L7Cd0T
 ozEh0Nj4u8i9RNsMq4DQcR05hsqU+mExqdPYDdG7FgY3F8zIgcuVr9Wz+
 K7G4dKwv/6BZu8omIxswYjrE8z1qLQMJL9Bz/+Nh+CZF9NwODFkXwSrx8
 CGazUBWOs6CGNK/QO3UR5ltqdZTolQfC7u7fOlzXCR+3Ro31cDtg9uOrn
 MFjJAbfP0gT+V+4GYTVIa7lHanvMWy3mvm1QuJ8GMTb5Ch0xXp2EsIVLU
 8zjUWriY0ACvBpZ+3pTdA8PP355HrKF1wRUru4sIiEW/si7woq8p3b6AN Q==;
X-CSE-ConnectionGUID: faq8/gmETg+KIQFUquDyBg==
X-CSE-MsgGUID: piJp8PbsTL+d1kk7eJ/W+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="12137141"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="12137141"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 12:27:16 -0700
X-CSE-ConnectionGUID: 5i9KTL0dR7OxCwAPzGtOaQ==
X-CSE-MsgGUID: uFmCcdDnT0a9ZJ0HxjO8mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="41789513"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jun 2024 12:27:17 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 18 Jun 2024 12:27:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 18 Jun 2024 12:27:15 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 18 Jun 2024 12:27:15 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 18 Jun 2024 12:27:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OmUAFHIPH1A5igOo9ggIHjwEE50TiW77OLe/MnoHr6v0EUM6NBhvv1Z9R9fhOhW59ZYQyz9V+uyQasub/g1nxBcYK/RlMUzQBaCYbk18E5zx2tCrczpR/rj7wSNK2tAnD3hXnGFBcotABezkATEm+WPu1XOZwGG7zyzJ1n+gwLmiDyj8QvMjlh0q6Xx3Iv+R3dmM2LldPT6ik0WDnQ74jpNnTbuWqHdLkFslTQD56GiYJboSj+R0hvYozi3SZZpVdvQHQEfSgLtxA9kRFoj31fUKO0nnJjyqY4/KiVJWF02DkWQ+N8MyDXPdA1KPcVWJewYeMkSZgoU6/uZbd1wkkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WeTYFGPX1cm3ydzfJShcT2obOYz9G5ugAztbugEgNbc=;
 b=DFHPcsF/BoQ0sYB+leUA5RFWzhCimU8hB8rU4jn9gvz1g38vlaU+86okkb6xwfmy2a0iHeXRzfsG13h0dSWDHqQyFpVGzooIbfVz8yn7DWI6v4/vH6J5g9Bn+Zre6TrXCAycwGIpxN6WRKEPeRU2KQHRBempoL/OnXBmwsZBc5uff1mKjkN5xJG6+qdq3s6XfTu8IxiaN1WnpNBao2ZphhsNM5t8Lg69frHM7L9wGXovwr1IEMDsbhiyl+t54cPfDD78mFFhGB4goQRpbb2j+SJLRaok7S+AqtWTEieTMq3aRDbHnu9wnwr74LdsYVQIiawbdyQKQPdft/aeWS+eoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS0PR11MB7442.namprd11.prod.outlook.com (2603:10b6:8:14d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Tue, 18 Jun
 2024 19:26:57 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%3]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 19:26:57 +0000
Date: Tue, 18 Jun 2024 12:26:54 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: =?utf-8?B?4pyTIENJLkZVTEw=?= =?utf-8?Q?=3A?= success for
 drm/xe/rtp: Allow to OR rules (rev2)
Message-ID: <20240618192654.GQ2905419@mdroper-desk1.amr.corp.intel.com>
References: <20240618050044.324454-1-lucas.demarchi@intel.com>
 <171873476149.104453.15236230977511021913@a6498e030952>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <171873476149.104453.15236230977511021913@a6498e030952>
X-ClientProxiedBy: BYAPR11CA0046.namprd11.prod.outlook.com
 (2603:10b6:a03:80::23) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS0PR11MB7442:EE_
X-MS-Office365-Filtering-Correlation-Id: ef6b4776-80fd-45fa-c3c6-08dc8fcc9e43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|366013|376011;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vPWLRa59lybQRutM4+IwSjAT+9dnnGgSdzAEYzNPRY8QeCjmM/Xlq6bNnkZh?=
 =?us-ascii?Q?K38+gSa3uVk9yFyLQBAST3FSLbR07q3N1qumhijwgoZW5RuEJeuy6I/dzrI8?=
 =?us-ascii?Q?yv97e/QvJ8ebP1vKrqjaHyoHQFmkWSvAMsch4s/wwC5SfZMD24NW7C2ZxhbY?=
 =?us-ascii?Q?aghe+Ak4NCKPhpjz1HDtfoVP5TOi5iNufmWGD6MmVZnipo91TdVspXv9hxa7?=
 =?us-ascii?Q?Zx948WVkFj9lpSt6TtZNv72yaNAa3As6WQA6Z7VSIRNDX5hN+f8E/BcvO0Eq?=
 =?us-ascii?Q?T/iSRNzBmD4ZjOxPORa06R3+++trjbii9RAT8a3SuVPOJQEi8lpgUiyATgUB?=
 =?us-ascii?Q?R0aKRXbEl7UmKR0n6g+xtMrA5W3VOVyrq+DK6rawU+6urzQn3+/R5CSwN2dB?=
 =?us-ascii?Q?2sGYqAOej2kMA+ebohZt2GJ7byQDPycxytASIKIt2mWYlPpc/qVtvmdHMecS?=
 =?us-ascii?Q?V072IXm/zAUoOESP4JSE9yR8z1/7lrEzG0rfQ4O7ZR+CRCb6/1KYmW+yFI2g?=
 =?us-ascii?Q?CR260OnD6Y04DR55R+V6e1/kt7WIYuInpmmhx+9VsMgp0fRLZX/sTM/sKaUM?=
 =?us-ascii?Q?wRQ3owWZ52fhueR9x7v6UvwdC6BuzKmn0TEVHd8RwJ0XbZYtsNTSxd3mKdsY?=
 =?us-ascii?Q?MpTNL0BA3KWvmt2VzO8Uk8vPjRiB2bpHCorOsspwcsc466cfl5bMrcUgvS/t?=
 =?us-ascii?Q?r1NymO+/PY1xwu/1PTMhZt2TFb2aK6wT0VLPXNmUrKNv6R1D7Tf03ZjpUbPZ?=
 =?us-ascii?Q?Fx730Rm6zxOqIZh5GDmt+dBDSbuh7uilV+JiH1FN3WE3aBrgnkjIZetV3Gj+?=
 =?us-ascii?Q?3JmScV1mIevUqFApbeNx4Su2iHv8k8xvk8nO9deySwNn3n0VgEelOsPO4hyr?=
 =?us-ascii?Q?ByeD8eHbfvvUqullim0oGVGPGiIOWbB36J598AMTsBeQ3sl/6S+tp96K66L5?=
 =?us-ascii?Q?lE19arNfupUAZEqOjILq/80EPLw07UApnZK9VxYlD0xz31qU2xsKbRbHfjE3?=
 =?us-ascii?Q?tE3/oxpjowyg2vGIHG09PvTZ96qx5+8aZnywVMHimT1XwHxC4YC6P/OaX5PD?=
 =?us-ascii?Q?KwtjPpHMdrpuwpBmCp3iMzz0KcFMHCkBAfTtIiq+apX8fxWfBUr/0zs/QZGZ?=
 =?us-ascii?Q?nFutiP6QF7SGpgrPGE8RtJV1KDJQSf1pYG2qRFYLFq1o9vXV/1wgVlqgUSS+?=
 =?us-ascii?Q?tb3X6sBsSN0QhFVGKtJTkXIqSIIUONV56RGcSx+fw9sUMN9EYkfR2XM4xIE1?=
 =?us-ascii?Q?igjJnUzE8avXJSaYZWxdHMOwd0Nr6JbWN+VmCNkY0w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(366013)(376011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TjWOmwmdLNqfrgtXtCICQkfz8JROCblDnnAhd+F8ejL2bytoW5ZW5g5dbXmh?=
 =?us-ascii?Q?j3RWV3a8pjbV5kfP+2LTCeEFTFAgMNLkdWH9RYcHoy8dwZZK9Wsv+qVZDmDb?=
 =?us-ascii?Q?CJzU1eobIAtddUWMvxCrrWvlVZW6u59XLlFO7E7v0kTOTAG+dt54XqVQS/O8?=
 =?us-ascii?Q?36E4qHMZV0RpamkeoMkRyVAM44VQ4Zwgjpz7BCXr1A+/95X57CyYavTzkQH5?=
 =?us-ascii?Q?1TVfya79W/qQ5QJx0U5ih/r9I9tI9T02NyN96KNm0Ou07+5I8HeWkKiGp7nP?=
 =?us-ascii?Q?vvoWpVIJ0c3LEQLPPToXmfZ1bhsoyn03opR9b5m4nQh1YkN/Lu749oqIfYe6?=
 =?us-ascii?Q?6zRVDlIOWcZhat/pNDAtdIvkQip3Jmq/fSKhSxv/WyIu43PtN5gQfq/ax5gv?=
 =?us-ascii?Q?9z6zEJeupOaB7unPjbrEJRr2VUotyFR3RrKA22Ao6Giso2PaNIKz/HvBqwYY?=
 =?us-ascii?Q?A9+wAaNiALAR2k33bXNvp4hl9HKiqQaRGCoeHPNf/viQgVQ9xLTmaJ04KSXv?=
 =?us-ascii?Q?v+FwMlf4ZAyCQyWkBcUlM38J/bFM40yt/n0MPgEaaYUtZCmGoViJn6IlPB//?=
 =?us-ascii?Q?Aj5a7g9igFYNESdbH5F1qZpWD+JNnw7zW3jrkmT7FARr4UxY8kdIosjHv4CV?=
 =?us-ascii?Q?hVtStlAn+T0a2yFufDBmaCsE7HBE2Z7+hu4LlJRooK1MNmO2ZpurQAS2iHC8?=
 =?us-ascii?Q?7t9e6xW3+ZJKaGYh0CC34V3cw1CMY7yoa3nE42sCVmzJC5P+8NIY4gv6PeiN?=
 =?us-ascii?Q?Dg5ewVhPdKz/Ob+hNdGVCJNAn+tNvLG27BD3ApP3adbSY/Hhggt1x+bqJ03m?=
 =?us-ascii?Q?0FUDcWxt3sDqgobkVyOmfKb3qgdOtAmppIVkrF8JMT0SOoPfLaxkzHcLYhNg?=
 =?us-ascii?Q?O5oDI3hUZFSkUsff5vyXReGSPoxvlrwNABz9USdxKuTTWnatMjx9FB3hJod9?=
 =?us-ascii?Q?7ej39BpJahi3LpN8BPT0G/cZ/o/n/vCLn9LmAhl4mQLoKwik1/sCkyfy/17l?=
 =?us-ascii?Q?leHBKab7iF4Af2cmKKoTu3YPvVdK26l9AKhI8M0CriwTX0k6Xg9eQ5z0wjoL?=
 =?us-ascii?Q?KSQQBsQK+zICAJXVK72ve6AG2NgN/9Nm7fCQXryH89TBcUS8lOWHa/nzyDds?=
 =?us-ascii?Q?UwunHsKa8plUOkSVXagL09JDSf1EY44WfuU8pyckGH5+o20qn7ViD8AINGDD?=
 =?us-ascii?Q?bSSwxGCilXquAtD7MEKYqyv4LsIfNUoZMVZRQhcs4VUC+crIjoL/DBVW03iA?=
 =?us-ascii?Q?QIAe2enV7VAPhA79Xl4pPlMih9HnWVPWdr5+2hnYPwfbFqO/rheqQVFs/lIL?=
 =?us-ascii?Q?ZPoFCfGyybYnUFLf/aMx4gk+ybz8KFX/HuAgJUUr6LvY8tNGv3UtbOoc/dEw?=
 =?us-ascii?Q?9Fef03i5HS8qlz+4uanuhHjyoP0BKMp9OQIXP7hqX2NMV5w7DyfYPJ0W8H3X?=
 =?us-ascii?Q?yAD/wZgV6BqE8iJjkRIFenIjOuD4PlT4iy1qwSzeoj/jvZ51jn3PGPbakQAC?=
 =?us-ascii?Q?lpRddskLVORkm8xD40tF9tePo34OqescrujCpt5Iu97Sh70/9GJa3mGDz9Ho?=
 =?us-ascii?Q?9+QllXCH5+CVHIC2BsXxPR+sv/J20tJo2waS86FoTY8SQw56zHDbH4AjfeJh?=
 =?us-ascii?Q?0w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef6b4776-80fd-45fa-c3c6-08dc8fcc9e43
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 19:26:57.2985 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E9uJDvhzMPG8GXrfffC/FGPz2oa9IUbHIXFwc/gxyYSgum07Jl2M2ytwPYYI7d0ant+RuPDj7cTzOlzbLfVxn9+aGKy3IZp11uk08MOdSi4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7442
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

On Tue, Jun 18, 2024 at 06:19:21PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/rtp: Allow to OR rules (rev2)
> URL   : https://patchwork.freedesktop.org/series/134967/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153_full -> xe-pw-134967v2_full
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.
> 

Series applied to drm-xe-next.  Thanks for the patches.


Matt

>   
> 
> Participating hosts (3 -> 3)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-134967v2_full:
> 
> ### IGT changes ###
> 
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_pm_lpsp@kms-lpsp:
>     - {shard-lnl}:        [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-lnl-6/igt@kms_pm_lpsp@kms-lpsp.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-lnl-2/igt@kms_pm_lpsp@kms-lpsp.html
> 
>   * igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-system:
>     - {shard-lnl}:        [PASS][3] -> [DMESG-WARN][4] +4 other tests dmesg-warn
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-lnl-6/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-system.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-lnl-2/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-system.html
> 
>   * igt@xe_gt_freq@freq_reset_multiple:
>     - {shard-lnl}:        [DMESG-WARN][5] ([Intel XE#1620]) -> [DMESG-WARN][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-lnl-7/igt@xe_gt_freq@freq_reset_multiple.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-lnl-3/igt@xe_gt_freq@freq_reset_multiple.html
> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153_full and xe-pw-134967v2_full:
> 
> ### New IGT tests (1) ###
> 
>   * igt@kms_plane_lowres:
>     - Statuses :
>     - Exec time: [None] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-134967v2_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_big_fb@4-tiled-addfb-size-overflow:
>     - shard-adlp:         NOTRUN -> [SKIP][7] ([Intel XE#1201] / [Intel XE#610])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-adlp-1/igt@kms_big_fb@4-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-90:
>     - shard-adlp:         NOTRUN -> [SKIP][8] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-adlp-2/igt@kms_big_fb@linear-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-adlp:         NOTRUN -> [FAIL][9] ([Intel XE#1874])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         NOTRUN -> [FAIL][10] ([Intel XE#1231]) +1 other test fail
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
>     - shard-adlp:         NOTRUN -> [SKIP][11] ([Intel XE#1124] / [Intel XE#1201]) +4 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-adlp-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
>     - shard-adlp:         NOTRUN -> [SKIP][12] ([Intel XE#1201] / [Intel XE#367])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-adlp-2/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html
> 
>   * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-b-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][13] ([Intel XE#1201] / [Intel XE#787]) +20 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-adlp-1/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +13 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-adlp-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#1201] / [Intel XE#1252])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-adlp-2/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html
> 
>   * igt@kms_chamelium_frames@hdmi-crc-single:
>     - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#1201] / [Intel XE#373]) +5 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-adlp-2/igt@kms_chamelium_frames@hdmi-crc-single.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-32x32:
>     - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#455]) +4 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-adlp-1/igt@kms_cursor_crc@cursor-offscreen-32x32.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x170:
>     - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#308])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-adlp-1/igt@kms_cursor_crc@cursor-sliding-512x170.html
> 
>   * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
>     - shard-dg2-set2:     [PASS][19] -> [DMESG-WARN][20] ([Intel XE#1214] / [Intel XE#282]) +4 other tests dmesg-warn
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-433/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-435/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
> 
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
>     - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#309]) +2 other tests skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-adlp-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
>     - shard-dg2-set2:     [PASS][22] -> [DMESG-WARN][23] ([Intel XE#282] / [Intel XE#910])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-432/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
> 
>   * igt@kms_flip@2x-nonexisting-fb-interruptible:
>     - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#310]) +4 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-adlp-1/igt@kms_flip@2x-nonexisting-fb-interruptible.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc:
>     - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#656]) +19 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw:
>     - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#651]) +10 other tests skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:
>     - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#1201] / [Intel XE#653]) +7 other tests skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [FAIL][28] ([Intel XE#361]) +1 other test fail
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-adlp-1/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#1129] / [Intel XE#1201])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-adlp-1/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf:
>     - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#1201]) +3 other tests skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-adlp-1/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html
> 
>   * igt@kms_psr@psr-cursor-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#929]) +7 other tests skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-adlp-2/igt@kms_psr@psr-cursor-blt.html
> 
>   * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>     - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#1149] / [Intel XE#1201]) +1 other test skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-adlp-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>     - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-adlp-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel XE#362])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-adlp-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][35] -> [FAIL][36] ([Intel XE#899])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_writeback@writeback-fb-id:
>     - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#756])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-adlp-1/igt@kms_writeback@writeback-fb-id.html
> 
>   * igt@xe_ccs@ctrl-surf-copy:
>     - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488]) +1 other test skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-adlp-2/igt@xe_ccs@ctrl-surf-copy.html
> 
>   * igt@xe_evict@evict-beng-small-multi-vm:
>     - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-adlp-2/igt@xe_evict@evict-beng-small-multi-vm.html
> 
>   * igt@xe_evict@evict-cm-threads-large:
>     - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#1201] / [Intel XE#261]) +2 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-adlp-1/igt@xe_evict@evict-cm-threads-large.html
> 
>   * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
>     - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#1392]) +2 other tests skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-adlp-2/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
> 
>   * igt@xe_exec_fault_mode@many-invalid-userptr-fault:
>     - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#288]) +12 other tests skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-adlp-1/igt@xe_exec_fault_mode@many-invalid-userptr-fault.html
> 
>   * igt@xe_live_ktest@xe_dma_buf:
>     - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#1192] / [Intel XE#1201]) +1 other test skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-adlp-2/igt@xe_live_ktest@xe_dma_buf.html
> 
>   * igt@xe_module_load@many-reload:
>     - shard-dg2-set2:     [PASS][44] -> [INCOMPLETE][45] ([Intel XE#1195]) +1 other test incomplete
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-433/igt@xe_module_load@many-reload.html
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-435/igt@xe_module_load@many-reload.html
> 
>   * igt@xe_pm@d3cold-multiple-execs:
>     - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#1201] / [Intel XE#366]) +1 other test skip
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-adlp-2/igt@xe_pm@d3cold-multiple-execs.html
> 
>   * igt@xe_pm@s2idle-exec-after:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][47] ([Intel XE#1191] / [Intel XE#1214])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-adlp-2/igt@xe_pm@s2idle-exec-after.html
> 
>   * igt@xe_pm@s2idle-mocs:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][48] ([Intel XE#1214])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-adlp-1/igt@xe_pm@s2idle-mocs.html
> 
>   * igt@xe_query@multigpu-query-gt-list:
>     - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-adlp-1/igt@xe_query@multigpu-query-gt-list.html
> 
>   * igt@xe_vm@unbind-all-8-vmas:
>     - shard-adlp:         [PASS][50] -> [DMESG-WARN][51] ([Intel XE#1214]) +3 other tests dmesg-warn
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-adlp-4/igt@xe_vm@unbind-all-8-vmas.html
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-adlp-6/igt@xe_vm@unbind-all-8-vmas.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
>     - shard-dg2-set2:     [DMESG-WARN][52] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> [PASS][53]
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-433/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-435/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
> 
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
>     - shard-dg2-set2:     [DMESG-WARN][54] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][55] +9 other tests pass
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-436/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-436/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
>     - {shard-lnl}:        [DMESG-WARN][56] -> [PASS][57] +4 other tests pass
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak:
>     - shard-adlp:         [FAIL][58] ([Intel XE#771] / [Intel XE#899]) -> [PASS][59]
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak.html
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
>     - shard-adlp:         [FAIL][60] ([Intel XE#899]) -> [PASS][61]
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [FAIL][62] ([Intel XE#899]) -> [PASS][63]
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-dg2-set2:     [INCOMPLETE][64] ([Intel XE#1195] / [Intel XE#1473]) -> [PASS][65]
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   * igt@xe_exec_compute_mode@twice-userptr-invalidate:
>     - {shard-lnl}:        [FAIL][66] ([Intel XE#1069]) -> [PASS][67]
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-lnl-3/igt@xe_exec_compute_mode@twice-userptr-invalidate.html
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-lnl-6/igt@xe_exec_compute_mode@twice-userptr-invalidate.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race:
>     - {shard-lnl}:        [ABORT][68] ([Intel XE#2097]) -> [PASS][69]
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-lnl-2/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-lnl-7/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html
> 
>   * igt@xe_gt_freq@freq_fixed_exec:
>     - shard-adlp:         [FAIL][70] ([Intel XE#1414]) -> [PASS][71]
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-adlp-6/igt@xe_gt_freq@freq_fixed_exec.html
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-adlp-1/igt@xe_gt_freq@freq_fixed_exec.html
> 
>   * igt@xe_live_ktest@xe_bo:
>     - {shard-lnl}:        [SKIP][72] ([Intel XE#1192]) -> [PASS][73]
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-lnl-3/igt@xe_live_ktest@xe_bo.html
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-lnl-6/igt@xe_live_ktest@xe_bo.html
> 
>   * igt@xe_pm@s4-basic:
>     - shard-adlp:         [ABORT][74] ([Intel XE#1358]) -> [PASS][75]
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-adlp-9/igt@xe_pm@s4-basic.html
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-adlp-8/igt@xe_pm@s4-basic.html
> 
>   * igt@xe_pm@s4-vm-bind-unbind-all:
>     - shard-dg2-set2:     [DMESG-WARN][76] ([Intel XE#1214]) -> [PASS][77]
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-466/igt@xe_pm@s4-vm-bind-unbind-all.html
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-434/igt@xe_pm@s4-vm-bind-unbind-all.html
> 
>   * igt@xe_pm_residency@toggle-gt-c6:
>     - {shard-lnl}:        [FAIL][78] ([Intel XE#958]) -> [PASS][79]
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-lnl-3/igt@xe_pm_residency@toggle-gt-c6.html
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html
> 
>   * igt@xe_vm@mixed-userptr-misaligned-binds-3145728:
>     - shard-adlp:         [DMESG-WARN][80] ([Intel XE#1214]) -> [PASS][81] +3 other tests pass
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-adlp-4/igt@xe_vm@mixed-userptr-misaligned-binds-3145728.html
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-adlp-6/igt@xe_vm@mixed-userptr-misaligned-binds-3145728.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][82] ([Intel XE#316]) -> [SKIP][83] ([Intel XE#1201] / [Intel XE#316]) +2 other tests skip
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-433/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][84] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][85] ([Intel XE#316]) +2 other tests skip
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][86] ([Intel XE#1124]) -> [SKIP][87] ([Intel XE#1124] / [Intel XE#1201]) +5 other tests skip
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-433/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>     - shard-dg2-set2:     [SKIP][88] ([Intel XE#1201] / [Intel XE#607]) -> [SKIP][89] ([Intel XE#607])
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-adlp:         [DMESG-FAIL][90] ([Intel XE#324]) -> [FAIL][91] ([Intel XE#1231]) +1 other test fail
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>     - shard-dg2-set2:     [SKIP][92] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][93] ([Intel XE#1124]) +7 other tests skip
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_joiner@invalid-modeset:
>     - shard-dg2-set2:     [SKIP][94] ([Intel XE#346]) -> [SKIP][95] ([Intel XE#1201] / [Intel XE#346])
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_big_joiner@invalid-modeset.html
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-433/igt@kms_big_joiner@invalid-modeset.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
>     - shard-dg2-set2:     [SKIP][96] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][97] ([Intel XE#367])
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
>     - shard-dg2-set2:     [SKIP][98] ([Intel XE#367]) -> [SKIP][99] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-433/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
> 
>   * igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     [SKIP][100] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][101] ([Intel XE#455] / [Intel XE#787]) +13 other tests skip
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-dp-4.html
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][102] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][103] ([Intel XE#787]) +48 other tests skip
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-6.html
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
>     - shard-dg2-set2:     [SKIP][104] ([Intel XE#787]) -> [SKIP][105] ([Intel XE#1201] / [Intel XE#787]) +62 other tests skip
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-433/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     [SKIP][106] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][107] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +17 other tests skip
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:
>     - shard-dg2-set2:     [SKIP][108] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][109] ([Intel XE#1252])
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html
> 
>   * igt@kms_cdclk@mode-transition@pipe-c-dp-4:
>     - shard-dg2-set2:     [SKIP][110] ([Intel XE#1201] / [Intel XE#314]) -> [SKIP][111] ([Intel XE#314]) +3 other tests skip
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html
> 
>   * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
>     - shard-dg2-set2:     [SKIP][112] ([Intel XE#1152]) -> [SKIP][113] ([Intel XE#1152] / [Intel XE#1201]) +3 other tests skip
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-433/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
> 
>   * igt@kms_chamelium_color@ctm-0-75:
>     - shard-dg2-set2:     [SKIP][114] ([Intel XE#306]) -> [SKIP][115] ([Intel XE#1201] / [Intel XE#306]) +2 other tests skip
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_chamelium_color@ctm-0-75.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-433/igt@kms_chamelium_color@ctm-0-75.html
> 
>   * igt@kms_chamelium_color@ctm-blue-to-red:
>     - shard-dg2-set2:     [SKIP][116] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][117] ([Intel XE#306])
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@kms_chamelium_color@ctm-blue-to-red.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-432/igt@kms_chamelium_color@ctm-blue-to-red.html
> 
>   * igt@kms_chamelium_frames@hdmi-cmp-planes-random:
>     - shard-dg2-set2:     [SKIP][118] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][119] ([Intel XE#373]) +6 other tests skip
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-432/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html
> 
>   * igt@kms_chamelium_frames@vga-frame-dump:
>     - shard-dg2-set2:     [SKIP][120] ([Intel XE#373]) -> [SKIP][121] ([Intel XE#1201] / [Intel XE#373]) +4 other tests skip
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_chamelium_frames@vga-frame-dump.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-433/igt@kms_chamelium_frames@vga-frame-dump.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-0:
>     - shard-dg2-set2:     [SKIP][122] ([Intel XE#307]) -> [SKIP][123] ([Intel XE#1201] / [Intel XE#307])
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-0.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-433/igt@kms_content_protection@dp-mst-lic-type-0.html
> 
>   * igt@kms_cursor_crc@cursor-dpms:
>     - shard-dg2-set2:     [DMESG-WARN][124] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-WARN][125] ([Intel XE#282]) +7 other tests dmesg-warn
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@kms_cursor_crc@cursor-dpms.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-432/igt@kms_cursor_crc@cursor-dpms.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x170:
>     - shard-dg2-set2:     [SKIP][126] ([Intel XE#308]) -> [SKIP][127] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x170.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-433/igt@kms_cursor_crc@cursor-offscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x170:
>     - shard-dg2-set2:     [SKIP][128] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][129] ([Intel XE#308])
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@kms_cursor_crc@cursor-onscreen-512x170.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
>     - shard-dg2-set2:     [SKIP][130] ([Intel XE#455]) -> [SKIP][131] ([Intel XE#1201] / [Intel XE#455]) +12 other tests skip
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-433/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
> 
>   * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1:
>     - shard-adlp:         [DMESG-WARN][132] ([Intel XE#1191] / [Intel XE#1214]) -> [DMESG-WARN][133] ([Intel XE#1214])
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-adlp-4/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-adlp-6/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>     - shard-dg2-set2:     [SKIP][134] ([Intel XE#323]) -> [SKIP][135] ([Intel XE#1201] / [Intel XE#323])
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
>     - shard-dg2-set2:     [DMESG-WARN][136] ([Intel XE#282]) -> [DMESG-WARN][137] ([Intel XE#1214] / [Intel XE#282]) +4 other tests dmesg-warn
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-433/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>     - shard-dg2-set2:     [SKIP][138] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][139] ([Intel XE#323])
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][140] ([i915#3804]) -> [SKIP][141] ([Intel XE#1201] / [i915#3804])
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-433/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_feature_discovery@display-3x:
>     - shard-dg2-set2:     [SKIP][142] ([Intel XE#703]) -> [SKIP][143] ([Intel XE#1201] / [Intel XE#703])
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_feature_discovery@display-3x.html
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-433/igt@kms_feature_discovery@display-3x.html
> 
>   * igt@kms_feature_discovery@dp-mst:
>     - shard-dg2-set2:     [SKIP][144] ([Intel XE#1137] / [Intel XE#1201]) -> [SKIP][145] ([Intel XE#1137])
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@kms_feature_discovery@dp-mst.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-432/igt@kms_feature_discovery@dp-mst.html
> 
>   * igt@kms_feature_discovery@psr2:
>     - shard-dg2-set2:     [SKIP][146] ([Intel XE#1135]) -> [SKIP][147] ([Intel XE#1135] / [Intel XE#1201])
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_feature_discovery@psr2.html
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-433/igt@kms_feature_discovery@psr2.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:
>     - shard-adlp:         [DMESG-WARN][148] ([Intel XE#1214]) -> [DMESG-WARN][149] ([Intel XE#1191] / [Intel XE#1214]) +4 other tests dmesg-warn
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:
>     - shard-dg2-set2:     [SKIP][150] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][151] ([Intel XE#651]) +25 other tests skip
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-suspend:
>     - shard-dg2-set2:     [SKIP][152] ([Intel XE#651]) -> [SKIP][153] ([Intel XE#1201] / [Intel XE#651]) +22 other tests skip
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-suspend.html
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
>     - shard-dg2-set2:     [SKIP][154] ([Intel XE#1201] / [Intel XE#658]) -> [SKIP][155] ([Intel XE#658])
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
>     - shard-dg2-set2:     [SKIP][156] ([Intel XE#653]) -> [SKIP][157] ([Intel XE#1201] / [Intel XE#653]) +19 other tests skip
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
>     - shard-dg2-set2:     [SKIP][158] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][159] ([Intel XE#653]) +26 other tests skip
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_getfb@getfb-reject-ccs:
>     - shard-dg2-set2:     [SKIP][160] ([Intel XE#1201] / [Intel XE#605]) -> [SKIP][161] ([Intel XE#605])
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@kms_getfb@getfb-reject-ccs.html
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
>     - shard-dg2-set2:     [SKIP][162] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) -> [SKIP][163] ([Intel XE#305] / [Intel XE#455]) +4 other tests skip
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][164] ([Intel XE#1201] / [Intel XE#305]) -> [SKIP][165] ([Intel XE#305]) +8 other tests skip
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6.html
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_pm_backlight@fade-with-suspend:
>     - shard-dg2-set2:     [SKIP][166] ([Intel XE#870]) -> [SKIP][167] ([Intel XE#1201] / [Intel XE#870]) +1 other test skip
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_pm_backlight@fade-with-suspend.html
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-433/igt@kms_pm_backlight@fade-with-suspend.html
> 
>   * igt@kms_psr@fbc-psr2-primary-blt:
>     - shard-dg2-set2:     [SKIP][168] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][169] ([Intel XE#929]) +15 other tests skip
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@kms_psr@fbc-psr2-primary-blt.html
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-blt.html
> 
>   * igt@kms_psr@pr-cursor-plane-onoff:
>     - shard-dg2-set2:     [SKIP][170] ([Intel XE#929]) -> [SKIP][171] ([Intel XE#1201] / [Intel XE#929]) +13 other tests skip
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_psr@pr-cursor-plane-onoff.html
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-433/igt@kms_psr@pr-cursor-plane-onoff.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-dg2-set2:     [SKIP][172] ([Intel XE#1149] / [Intel XE#1201]) -> [SKIP][173] ([Intel XE#1149])
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-dg2-set2:     [SKIP][174] ([Intel XE#1500]) -> [SKIP][175] ([Intel XE#1201] / [Intel XE#1500])
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend:
>     - shard-dg2-set2:     [DMESG-WARN][176] ([Intel XE#1214] / [Intel XE#1551]) -> [DMESG-WARN][177] ([Intel XE#1551]) +1 other test dmesg-warn
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@kms_vblank@ts-continuation-dpms-suspend.html
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-432/igt@kms_vblank@ts-continuation-dpms-suspend.html
> 
>   * igt@kms_vrr@flipline:
>     - shard-dg2-set2:     [SKIP][178] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][179] ([Intel XE#455]) +9 other tests skip
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@kms_vrr@flipline.html
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-432/igt@kms_vrr@flipline.html
> 
>   * igt@kms_writeback@writeback-pixel-formats:
>     - shard-dg2-set2:     [SKIP][180] ([Intel XE#756]) -> [SKIP][181] ([Intel XE#1201] / [Intel XE#756])
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@kms_writeback@writeback-pixel-formats.html
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-433/igt@kms_writeback@writeback-pixel-formats.html
> 
>   * igt@sriov_basic@enable-vfs-bind-unbind-each:
>     - shard-dg2-set2:     [SKIP][182] ([Intel XE#1091]) -> [SKIP][183] ([Intel XE#1091] / [Intel XE#1201])
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@sriov_basic@enable-vfs-bind-unbind-each.html
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-433/igt@sriov_basic@enable-vfs-bind-unbind-each.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0x3fff:
>     - shard-dg2-set2:     [SKIP][184] ([Intel XE#1123] / [Intel XE#1201]) -> [SKIP][185] ([Intel XE#1123])
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
> 
>   * igt@xe_evict@evict-mixed-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][186] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392]) -> [FAIL][187] ([Intel XE#1000])
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-463/igt@xe_evict@evict-mixed-threads-large.html
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html
> 
>   * igt@xe_evict@evict-threads-large:
>     - shard-dg2-set2:     [INCOMPLETE][188] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) -> [TIMEOUT][189] ([Intel XE#1473] / [Intel XE#392])
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-466/igt@xe_evict@evict-threads-large.html
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-434/igt@xe_evict@evict-threads-large.html
> 
>   * igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm:
>     - shard-dg2-set2:     [SKIP][190] ([Intel XE#288]) -> [SKIP][191] ([Intel XE#1201] / [Intel XE#288]) +17 other tests skip
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm.html
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-433/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
>     - shard-dg2-set2:     [SKIP][192] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][193] ([Intel XE#288]) +20 other tests skip
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
> 
>   * igt@xe_huc_copy@huc_copy:
>     - shard-dg2-set2:     [SKIP][194] ([Intel XE#255]) -> [SKIP][195] ([Intel XE#1201] / [Intel XE#255])
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@xe_huc_copy@huc_copy.html
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-433/igt@xe_huc_copy@huc_copy.html
> 
>   * igt@xe_module_load@force-load:
>     - shard-dg2-set2:     [SKIP][196] ([Intel XE#1201] / [Intel XE#378]) -> [SKIP][197] ([Intel XE#378])
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@xe_module_load@force-load.html
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-432/igt@xe_module_load@force-load.html
> 
>   * igt@xe_pm@s3-d3cold-basic-exec:
>     - shard-dg2-set2:     [SKIP][198] ([Intel XE#1201] / [Intel XE#366]) -> [SKIP][199] ([Intel XE#366]) +1 other test skip
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@xe_pm@s3-d3cold-basic-exec.html
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-432/igt@xe_pm@s3-d3cold-basic-exec.html
> 
>   * igt@xe_pm@s4-basic-exec:
>     - shard-dg2-set2:     [DMESG-WARN][200] -> [DMESG-WARN][201] ([Intel XE#1214]) +2 other tests dmesg-warn
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@xe_pm@s4-basic-exec.html
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-433/igt@xe_pm@s4-basic-exec.html
>     - shard-adlp:         [DMESG-WARN][202] ([Intel XE#1214]) -> [ABORT][203] ([Intel XE#1358] / [Intel XE#1794])
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-adlp-4/igt@xe_pm@s4-basic-exec.html
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-adlp-9/igt@xe_pm@s4-basic-exec.html
> 
>   * igt@xe_pm@s4-d3hot-basic-exec:
>     - shard-adlp:         [DMESG-WARN][204] ([Intel XE#1214]) -> [WARN][205] ([Intel XE#1639])
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-adlp-1/igt@xe_pm@s4-d3hot-basic-exec.html
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-adlp-8/igt@xe_pm@s4-d3hot-basic-exec.html
> 
>   * igt@xe_query@multigpu-query-cs-cycles:
>     - shard-dg2-set2:     [SKIP][206] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][207] ([Intel XE#944]) +2 other tests skip
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-464/igt@xe_query@multigpu-query-cs-cycles.html
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-432/igt@xe_query@multigpu-query-cs-cycles.html
> 
>   * igt@xe_query@multigpu-query-uc-fw-version-huc:
>     - shard-dg2-set2:     [SKIP][208] ([Intel XE#944]) -> [SKIP][209] ([Intel XE#1201] / [Intel XE#944]) +3 other tests skip
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-huc.html
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-dg2-433/igt@xe_query@multigpu-query-uc-fw-version-huc.html
> 
>   * igt@xe_wedged@wedged-at-any-timeout:
>     - shard-adlp:         [DMESG-WARN][210] ([Intel XE#1214] / [Intel XE#1330] / [Intel XE#1760]) -> [DMESG-WARN][211] ([Intel XE#1214] / [Intel XE#1760])
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153/shard-adlp-8/igt@xe_wedged@wedged-at-any-timeout.html
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/shard-adlp-2/igt@xe_wedged@wedged-at-any-timeout.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
>   [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
>   [Intel XE#1045]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1045
>   [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
>   [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
>   [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
>   [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
>   [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
>   [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
>   [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
>   [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
>   [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>   [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
>   [Intel XE#1414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1414
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
>   [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
>   [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
>   [Intel XE#1639]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1639
>   [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#1960]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1960
>   [Intel XE#2097]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2097
>   [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>   [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>   [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
>   [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>   [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
>   [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
>   [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
>   [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>   [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
>   [Intel XE#736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
>   [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153 -> xe-pw-134967v2
> 
>   IGT_7890: a137e386eba9f46f838315f5d93b87561691d45e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1486-7f26b37f8cb73f5cf2251d7fff5b55240e04f153: 7f26b37f8cb73f5cf2251d7fff5b55240e04f153
>   xe-pw-134967v2: 134967v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134967v2/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

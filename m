Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF2B6C47DDB
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jan 2024 16:49:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9370F10E739;
	Tue, 23 Jan 2024 16:49:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8531010E445
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jan 2024 16:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706028554; x=1737564554;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=k6V4FcBvltVlCRmk4d6jz1Cnt8XLwzshW4o+4I1bP54=;
 b=HM9LN78JHAr1HIGJzUXfZk5Kr81kdUU+FcU6fWxKZzt1M+FN6TZSL+cU
 2h0PDPoFE3RdwbToNQwgxs9K6dWv6HQPAY/H42mPOqycQ87gRKMiSmbTT
 VnXf5+FWzCj/KO1YI9P4pdz07LoPUSTOtYvJpSZKeMrcfEVY3KqQMS506
 pqgwDFRBi0TR7cp7VHNtamzMurZgBPrRAG/zbi6d47jNJuBW6YXTblOwj
 z4TvPaXK6UbTzFwC7+pFSoJ8RW84SAOX7vHUBWAQltwlhsJLgr+WL+HAN
 kUQwwkNI1XUN00m+dELXUzUYbPxciByzh9FBOGPwOSuOfBKT88FjF3Afo A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="405333612"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="405333612"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 08:49:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; 
   d="scan'208";a="1706703"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2024 08:49:11 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 08:49:09 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 08:49:09 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Jan 2024 08:49:09 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Jan 2024 08:49:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X2YfDYQpGuvBvwh3RnQpBsFZXJbk5D5IYjNxnaKq6aZwsZlk5kXnHEEaQ1qamV1nFSZ/frILUGB25jS9DeMEEIojAfKszS1UeRjnpHrnrC9gGiIcibTXPoEfkwbsV6Ys2nOxGcCXK0e8sK1rSuE4JtHepijSDV/MPVe/7O6RRLvjCvKe3mfgTwwn/SAaqSZXcxK34lccx8qCVQ0IQaPiv0Ior7T4kvxiZl+AAncAccKM/a6tXXqd47bNggCFxvIoJ3YTFr5JKkC7AzOLiqjuaMDY4HXX34o8xACsG/YF2CJmfbQu4SJI79BklgRNf6R1HxlNHEG2efdmEi8FOH0q/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gkG1nRugpddGoCbhNK3BWaDUXRENYS1G8wMVX2Cum+o=;
 b=BhyJ0QZ3Mudt1SALKIbGnqJyF8SwhSVdSQsbStM6OZahfM3pe27XbMGskYfXm6/hWeYAHkqDt1vt1eWzJi1inyglTD+HVTVwB4gBxr9hvmuNBWkgngDHYNHhk0ludaPqrU6aWw+DZGl1SNCQjVYMoaijFiNYdehC7krKhGG0CpuiGiOZIhqWV6hO4jSBPUmCbFX0WXoeUcGOSU5QO8xpfe0Jw4W98QqD2jusLEbHue2Zz+2c0PQpm4q+xF2yy2KksTztqyk8tAKv7ekSoQ1d1MlLM3ySIhF3a5m17filAKgWlb7axJb9joD5OPnuc21gO+dlOA4Kb/wNePqjeVeknA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Tue, 23 Jan
 2024 16:49:07 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7202.035; Tue, 23 Jan 2024
 16:49:07 +0000
Date: Tue, 23 Jan 2024 10:49:05 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: Re: [PATCH 2/2] drm/xe: drop display/ subdir from include
 directories
Message-ID: <663d25vngq6zcee6vupweq7dohhmftpaggtnfl7752sn6qhdao@ypgsfn62skob>
References: <20240122101428.2683468-1-jani.nikula@intel.com>
 <20240122101428.2683468-2-jani.nikula@intel.com>
 <47hzp5ya6cwdcidq7cwid5ykpkn6wavxtf3ynjf3xgirbgulsc@afsk7pgae3lx>
 <87le8hnu6r.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <87le8hnu6r.fsf@intel.com>
X-ClientProxiedBy: SJ0PR03CA0063.namprd03.prod.outlook.com
 (2603:10b6:a03:331::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB5423:EE_
X-MS-Office365-Filtering-Correlation-Id: 3076ecc7-67ea-416f-02f3-08dc1c3336d9
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hAb6SS838vA2xmiktHmhVc3slZRvMdBwdcYJVw14YjUHAG0im10QZ4XRI4Psit0WMXx8u3ikxCzqvyATQhiThyk3XKpqW0EN1LVNaST2fpSb4rTqDF7N4zIwOdGmSf8rZjbwodzz/nTkqVnUewfgdo934KUXkUqGb0zX0LBZ3VNBN3wZKZ6MoAQxdqr1pEMafPuDKYrLstvkfay6UqO/74bOguRkkyqCHybymemYsVa0g3LJqeCN7J0Jfpy39xWOrEs4e8zXNnFdJBN/+h9QXhTclaJ+ho2swNhrKKsJ17yKEfKLSZHHAudWv9SjlgkBqPBWsXheGqHJtkRzX+EuAkrH771p/xQINupPYnuORwlQX2DTQhYaIxXhr5KZbsfEvkHSg59l3/9LMvRwUTD6KIu0RT2Fv3uAo1y4HnSwvuZYkkuLgWeJGwpiUXTIpH2w05UspYojmJqF+dyxxoTJ7Yj03AtDs6nTetvClB3YAV5Au7cmktuVrONddMMaD9XN6NNmXrSSVbAjlLCsnFJoNNS4mTI1+LSJaIpsS8Jya+1HKBd+g8eoTtoXoFK3kuBh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(366004)(39860400002)(346002)(136003)(376002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(33716001)(66476007)(66556008)(316002)(6636002)(66946007)(6486002)(4326008)(6862004)(38100700002)(8676002)(8936002)(82960400001)(86362001)(6512007)(26005)(6506007)(478600001)(9686003)(83380400001)(41300700001)(5660300002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?b3pq9MIhvQXhXSLNRLo6yyBi0tfT8ivq87u9FvUVQ8a716L+ToeU6D1EZ+Wa?=
 =?us-ascii?Q?9U/ofwewSEvLjIsJoSMAoecfydiolMkd1Gzzq9K+7XMOyx7zOBUbkCKOIrSF?=
 =?us-ascii?Q?pewsZzzVFuOPstRMFqokMximdD0gi/kIkHJ4c3D7dZPoAAVO5jcXmgfEpYax?=
 =?us-ascii?Q?MFZAMkxOsUQkmXdwI8K4Qv2v6EHA1DwCROD1OphYzgxJmKeYUDkjEYFFYhqz?=
 =?us-ascii?Q?P7XwsoNlZCnujvXJp/zXQ6cyWnQ1mzBwnVl/WpaglOpRX9IV6CwLG8xI6NWk?=
 =?us-ascii?Q?nTrsgFWt36rEO1gChE4BlS1wO44BUvph6oJDcZMTE7fYoW1Z160uZqJDhYXm?=
 =?us-ascii?Q?nd+Gc8V5l9bh4h1h9m/0a+OUz5a8WE+XS8BPELSmUgHTTcQx7xGvKhYkIRxi?=
 =?us-ascii?Q?4NddxYEtcW48pFde/XVsfKq9JLqhOBW4zxROxvb/zoj7iqOT/jmdFcf9/m8K?=
 =?us-ascii?Q?v7sqIqRmW+IKRRIyRxeehJwaDnx6kMPLcyEWRpgvxtoVTKtxrCrblIgmZJCP?=
 =?us-ascii?Q?syzoDfdYGKIdvyIZw+nALCxHrvKBJBBUfvysDxvBmXwmd8uX+37VAOrqsfUt?=
 =?us-ascii?Q?7BmmCxq5z2APFoBLyjCPUgGrCbOUgjA2+Q3rD5488ke0x2HEStR/SLyWMXb0?=
 =?us-ascii?Q?1AroAyf88hT0kbYCzbCM2skmUdVfMz5eMr0HnMrMP7wDe8yFpo1tQ1mN9PZs?=
 =?us-ascii?Q?r7DGp+kLmAl3APZ/t2VPcCmvzz8ey5QrQQAbzvtpF4tzcz+AbSn/xLq8V4DD?=
 =?us-ascii?Q?/EINHIlxscmN2zIiH+nRu78HvaF5L/GHdpc91iVuxeIEFd5pE9Aacf+6O/Ru?=
 =?us-ascii?Q?S7Pqi3c2Rm0CIVnNK8mUAl72yH6KtJWLVwY4H1Hp9FRobKXMkaZHThXDoXqb?=
 =?us-ascii?Q?GtjZVwn/fIOnDExrGi+TL6GkBWA3Rb7vO57XgpuLy+ONhyUIrHUKg2l/bm/8?=
 =?us-ascii?Q?Sw0yc9Tgfx0cPQnS+hoAWq1qnJMD0C6HlFkagGmJoTJBOxBmSDF1IGhBce3V?=
 =?us-ascii?Q?T3/j8zbRTXEXGAhlsvdwxDShyFUaFTvBhkONlSNglkKuUC26xlZrk+rmqmL1?=
 =?us-ascii?Q?RY/I8e4k8Y3D6aNQxeynhDhTcwuR2a8KYzWmWDeCxNBonANuExiuHiNjKoTI?=
 =?us-ascii?Q?K7e6NDihHkiJx+8PVTKxW2WUElkq9jGs79B+r7MPRpnF+ytBavYYA0g6J4nz?=
 =?us-ascii?Q?1DgFOovsNPuoH7qweJXRSGZQR5Bj55kCz/L6g036kdLAjtbCMf1L98pHtuSM?=
 =?us-ascii?Q?vPk6+VPt5JW9oBorLtLg+XSnUUGH5JP8bZgRFo4wRRtw4LXHPwXbRSV07HUe?=
 =?us-ascii?Q?/fWChXQf0Q8EthjLNduS3fh2wQtND7Fc5Dz3V/qV39ehR9k0SrvShwo9bwhI?=
 =?us-ascii?Q?E+piTHe+i/HX9rpgCNyfgj6BCJCTFCFWMVTzRG73MkLMBn7NT/pgxbiGApos?=
 =?us-ascii?Q?1kR6+klJgMfPEi4cOZxfQR/AbWMisn7ar6dAEJS84cxHywNqMKjuHAO/Iwxs?=
 =?us-ascii?Q?utcoXpVpXQJQDVwHlJvt/4upE0u/w0nF2yE2oRlO+RdHrhiNy4BHXbheGBRe?=
 =?us-ascii?Q?NHGeCuttNfUAlXNutC++9A5gtY5OmG8rKO582ZJxvs5dlwIA+mnznqzzbl5E?=
 =?us-ascii?Q?YQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3076ecc7-67ea-416f-02f3-08dc1c3336d9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 16:49:07.0896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VrwiAu2IpP+SdB7xJ2KHSPR7gRYpdTzyrlV4UcvlED2qNN/gBjonHNWhgWG81zg0eXbN1HLDBqoptlQz8obf7v+Z+vMD54xux+hf9ZiKRww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5423
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Jan 22, 2024 at 07:39:56PM +0200, Jani Nikula wrote:
>On Mon, 22 Jan 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> the downside of patch 1 is now that core xe code can include any of the
>> display/ headers, but only xe_display.h is acceptable to keep the
>> interface sane.
>
>I'd say xe_display.h remains the only interface towards xe core, I don't
>think this patch changes that, and its location doesn't really give any
>guarantees. It's been a matter of sticking display/ in the include
>anyway, and enforcing that is a matter of maintainer vigilance.

I just thought the previous split was slightly better: No code in xe
should include display/ and should rather use the xe_display.[hc]
interface.

Now with #include "display/xe_display.h" spread throughout the code,
this could serve as example for people to start including stuff they
shouldn't.

I'm not entirely opposed, so if you and others agree, please go ahead.

Lucas De Mrachi

>
>> Or are you thinking about changing the interface?
>
>I agree the interface should be in one file only, but changing the
>interface is an orthogonal matter (I have no plans atm).
>
>BR,
>Jani.
>
>
>-- 
>Jani Nikula, Intel

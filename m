Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52666C3DA6E
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jan 2024 09:12:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC2AB10E0B4;
	Wed,  3 Jan 2024 09:12:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9710E10E0B4
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jan 2024 09:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704273124; x=1735809124;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FcUfukDv1uhdyZzO3ueDrCJYsAyeSeS3k4HHBqaJk10=;
 b=FuWRv3fV96iLzX2QxhmHG3liuvxLW+XmUPttRIjN/VRAkeQm2iSK0BQy
 cGJ87acZjTReWEQCsxIU2R3psNUTSZ+T07PdxsQCr1/SkMYTyEj/1bblh
 qb6PCZbJ0Za30RuVyix+1jnMg75G2kEeBSymWGdl0STbKxHHsp3MjiXeM
 Yh9ZbiHzeyH02PwNDvpWxYYicoeX7TGg/2yeMkKqLi3egchiDORmnKFhj
 m7VTVkASDcFl53ah+6Y9hd0g1G4RP2km/b1kNDYCCqZVkuS8XiCoIhzOE
 zBQzgFGvDXVqdwRrReUWVjRUtfwabNevCYjwr1Owbky4sTGe9SJXbptBx w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="18510167"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="18510167"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 01:12:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="903384793"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="903384793"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jan 2024 01:12:03 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Jan 2024 01:12:03 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Jan 2024 01:12:02 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Jan 2024 01:12:02 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Jan 2024 01:12:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QwdXZB7/4yTAXPJdpx2Lp43WpmdkapEDKoXl8AidhQaC8zjMuMIdv7EPSS/6jgga0LqfXgVAtJijgbG7zAHezAjl0yDMh/zcGYciJDYn7m2J60YA+MQQ4+GEFpykBsAXoCKJGGX1F6dmC6UC4pz0bcJgRADLxxLPntnn1s/99DBUVMakEJxG75cMf/mhaX2cqRXx7zz5sHWCYBnz40wsgb76IbV2i36yWlgq3A5uhVu7uMoM57Wyf18fZj3QWMp0EFgRpyi0WARQbBcnYrQ01DN4i9f0qxmTQp/e6duyBRGK1FnesWd1uiXK/bX5pJmNCXNaKt/Wrqnb3dV57V8Jug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cZn9OIpK9samKT009QyMZfiYc12Fs7PXscYVuvjbSLk=;
 b=jxTThJaztOfpqGLmG03zaZmZqOOKNOy5IMhxrH8lt8jfZvsDiJyAbe955vGDIq2zqxdZ+v194z9CngU/QMOOp07F/HwmYnXpQRafIJ+apEyIzx8CG2Gfd/n9UuiDjK02IHQ1v383k/3ujqFmn81wBxVNtkdg3stKBatYOzNPkuiXr2HwFZ9HY7Oe9sD123x6jZCM5W1hqM0GQzBfgy/46DFcXlVpL+XTZMV8nUCazDIEpwkl6lg0qEHabKZf7w6acZLhsGeerrD5lro6SEsYGZmXktF0vi9B6VbOJ+gGFqvlGQkUpozayHWxK5O9z3e21l0tG6C9is/mI8QgzLFkEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB7397.namprd11.prod.outlook.com (2603:10b6:8:103::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.25; Wed, 3 Jan
 2024 09:11:59 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7135.023; Wed, 3 Jan 2024
 09:11:59 +0000
Date: Wed, 3 Jan 2024 03:11:57 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [RFC] drm/i915/display: add support for DMC wakelocks
Message-ID: <b4oniygofj4a2dua3nn2ivic5v6yjlklxrxga3wipf47h7cmie@wayqwwwnpkqo>
References: <20231228110934.383623-1-luciano.coelho@intel.com>
 <d1025642c5e47fcf8338bda82d3d31930877848b.camel@intel.com>
 <877ckyk1l9.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <877ckyk1l9.fsf@intel.com>
X-ClientProxiedBy: BYAPR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB7397:EE_
X-MS-Office365-Filtering-Correlation-Id: 20303209-3527-4f10-4be6-08dc0c3c0a24
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sf7sHPJAt4z9n5pscjoh798yNHoO3W6cdY+YWcTTyG87OT/dAHHjcXmcRi2zQ352KgIJtDH9TAIGP2wE3nFvoDAD6ZKWBIiDbxN9a52HtnKGZ45iCMHvNfkxsX74Xa8QYPrrjglpErKJ8r/+qh/772lQWZfGxgDScUsCAlkqOz1Vh++AB4ec1kWzZJdOH6ypOTmKn3Ucj+3nNe63ib19QNq2OttFltnkfUgrGjSLhxaYUJsXtzMlT1/D6KcBzyiey3wf6d8V4Cb86WXiQewpIa71rApGln+m9juMWtP019VI4YnEB6HAXpQkxLXovu3igut8IgP5NpeET7Mbjd267Uxx/e1cfVcpF7QmmCI+Wp7VsQZaOq3S6c8/d8ZbMMnAIvLiFoxtumt5lQgE8G+mBxNGC2I2WAUOFozFEI22tN7eP0WqlMMJau87oaWUnoO8tkdDRc9SbUYxyO/5p2W+y/BFwXayso+AdE8c3o0sV2GkDBXj9RadZk3BoewzXr0Wx4T54nNe/+WP3FxCmzba4ydZRC2V/gsB8Z/sOrv2yj/+yobskN4GWLOZYRg2RsfrmYIdQCNXLk0xJsuUHgBmrDfU4lvviI9BjuAF7aS78vfbIG7qbZ+kJRKVU0CPJKPq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(376002)(346002)(39860400002)(396003)(366004)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(66556008)(66476007)(66946007)(6486002)(4326008)(6862004)(316002)(8676002)(8936002)(54906003)(26005)(6636002)(83380400001)(478600001)(9686003)(6512007)(2906002)(41300700001)(5660300002)(33716001)(6506007)(38100700002)(82960400001)(86362001)(27256008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Oo5Q4EZiZ0LRe908+sgefWhu6XxQvubhPYsQerDTc7jCSBTIkRdgmou9X1Dq?=
 =?us-ascii?Q?aY3DUXO/7Kos2H0AN+hAWKhSh9vkBM6AwBx281T4rFQAH8cRXOHzLvia5m1T?=
 =?us-ascii?Q?YYX8FbU+yRFEPExNoXyhhLpZAruNdylDPqFGHRE0/KOI9gE/tNbAFQDNxAC+?=
 =?us-ascii?Q?CZspnKd3gmcRs5R7RtZmDhHy36lHU992CosyjrBUSg8Dfl9ZdTtcUHz/pB3y?=
 =?us-ascii?Q?M070ebZXr5EhdpyWEeybxU0WXVjucH/jyKL6DrGWdVQblVcIqC07PACAvaAG?=
 =?us-ascii?Q?6Uh6o1KKVhugEZmhzJzaS7gRvv7ttFY0mn8FZANZ0edFa6c4KZxJxU5SCNjO?=
 =?us-ascii?Q?eSpz0m93xfqTT/PHC2roknQmz/ReZUUXdJEzYeOLAtgY0Z6Sbt1jsy6MHv4E?=
 =?us-ascii?Q?5OLUZ78N1VFd/WNgN2D4wLGnffXwVgoURRE35q07BDDMlST1kY/SrI9CzoU3?=
 =?us-ascii?Q?9hIRGBVHK5zL9iAL4iD18mpvbewT4mvC6W3xg702k6XUXAB0XLZT8PyLXxcg?=
 =?us-ascii?Q?J8gAsIYqGTbTtT7QRod7slkslF80/95dAFREyUOYEhCqXlcRCcF9DBUZ8nRP?=
 =?us-ascii?Q?q6jD20Rv0qpqVneogneGwq3qpD5xCYAeOuP1NC1WMDh6c6ns+y7lPG39OsZv?=
 =?us-ascii?Q?Q2GRXJn13izzg6yDUCx57n5nkMQK70IxsPP1r7FjsvYNeSaY5bO6lpslIzpO?=
 =?us-ascii?Q?BrXDT9TLL7d6M/HAFhViqQeYLkq2awiRDj+WGgycFrjXHJTEHj1KYcXUB/Wf?=
 =?us-ascii?Q?/OqK8RQypzYvM7dDoK3OBtlrXNpQ+x3Yx31WBeHofuf9y7fHkj1QafxM1d5R?=
 =?us-ascii?Q?sG0+yYY16M/6LIdkiBon2sB03ebKZikR4AjwHICg727Flfbmj0ssmrOY1ejY?=
 =?us-ascii?Q?tm1peJV2mZEMCJtvv25vIhmCpN9dlQ3CM42kyyZ8Qp6Jo0kfIN/3AVEckfRA?=
 =?us-ascii?Q?czzPDplUFMe++efRwfsiIfRjjf4po36xEWAeq7hP9p8a220YrERA32OobH8J?=
 =?us-ascii?Q?Vg/tdBK7O0A72vr2b/crqL3wm1mK5tDtq5pQLI1NyCAKFquyiH8rucuqNh4n?=
 =?us-ascii?Q?DOeM424gqZJXQZVZMeW/Mv/s+ZXGZ0507rDDkQb1ex6UD5sPhkTrYv+QxK3J?=
 =?us-ascii?Q?4q9L7KaukLrKGur9GTo8UPNUiBQYzv3l5Ov5Tyyb5Dq1QlIlkZO6xgZtK32R?=
 =?us-ascii?Q?MS+RQRoWFaenNTuN1Zaig0vMPeR1HNpvlyCjDhzhSZdtiJT3wMVruHVMRkII?=
 =?us-ascii?Q?ApdL5B34s8PPDdboOuZePM9xMT39svOeEcFO1LluFgSP4/13DaJhk+TJrkvT?=
 =?us-ascii?Q?qQM12G/ZKKrqJzGEE441/LGeoI4ofxlN0aJPO6F85PQBI8t6RyBjU74h7Edy?=
 =?us-ascii?Q?kFPsugOlMICRGg7w5JQQyv4gfMWdGPPbHwTpjUJNnQhf2rM/vS0zO5et8U4S?=
 =?us-ascii?Q?V039YNHdk7Vtd/yzDO1BW92bJ0ka4Gy8wR9QdRWGSgy2Fh60NouVL5oBHtsh?=
 =?us-ascii?Q?GZCWr5UMSB7IQDFNeRTVgHEWLojNdlXsP+eT0TJSsJUFQpdK02B6lgtRtc5+?=
 =?us-ascii?Q?0x1yT8bCJw4BuGJH1XAIoKxyExbpT23DEdF1vXotGb+4egUmJBEgxERRwL46?=
 =?us-ascii?Q?wg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 20303209-3527-4f10-4be6-08dc0c3c0a24
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2024 09:11:58.9636 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 23uuocXbERUPilJ+0W4S9VvdBttZi8eEOPtyLrp5dAVK4W/xrNQqmEjKwy2yY4/iKzM+iyCQN9GWgUNLvC67EyAQCqqHm7VojHT3L+RKvVg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7397
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
Cc: "Coelho, Luciano" <luciano.coelho@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Dec 28, 2023 at 01:28:50PM +0200, Jani Nikula wrote:
>On Thu, 28 Dec 2023, "Coelho, Luciano" <luciano.coelho@intel.com> wrote:
>> For some strange reason, git-send-email didn't add Uma and Ville in CC,
>> even though I specified it in the command line.
>
>Everything worked as expected, but it might seem a bit surprising. ;)
>
>Mailman has a personal setting on whether to filter your address from Cc
>in messages sent to the list. I have it disabled, while apparently Uma
>and Ville have it enabled. You're probably looking at the copy of the
>mail that you received via the mailing list. It only has me in Cc, and
>Uma and Ville have been filtered. The copy I received directly has all
>three of us in Cc.

That "feature" should be considered a bug... I complained about it
several times, but I'm not sure the proper channel to get that
changed/fixed.

It's terrible when you cross several mailing lists as then people
getting the email from the mailing list will "drop" people from Cc. And
they usually add other people (outside drm), which means now each thread
has a different set of people Cc'ed 

Lucas De Marchi

>
>This is one of the reasons I Cc all of my patches directly to myself, so
>I also have a copy that wasn't modified by mailman.
>
>
>HTH,
>Jani.
>
>-- 
>Jani Nikula, Intel

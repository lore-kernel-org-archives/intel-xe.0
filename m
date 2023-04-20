Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 406BCC77B73
	for <intel-xe@archiver.kernel.org>; Thu, 20 Apr 2023 18:53:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14FBC10E086;
	Thu, 20 Apr 2023 18:53:15 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B717110E086
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Apr 2023 18:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682016792; x=1713552792;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZBey2U9u4S0OZKspQB/oba1GLonQcBeNmD4e82gkyqA=;
 b=aXLRHcMJsYQwOFs9I7e9TTRqd0dB8ni57t5i7ReGlNVzFkJxeo8WCmiR
 /QAoGRR5bory4nLNT/aw4Y+uhdeX/nmoYojWysE+xktq1pNLgDz/V79k2
 qCab1Tj07zxuT73yiJBKdzWw9K9MsWGmrIaQZ2TSNRROBsBHHd2AZkvnP
 wyvAUKybBuephNY4f8M5i2jFxg7uz1m9gmLcCd8FHy+PHiIpxbt/YUFM6
 E5UH630Q9DaHXH+phd/Ja5WRYxfS/k8+hYazOhKjwQ1OJEkFgX3xzaST+
 eL7AD5jWyUNltyokLbTULABB9Uh9metbmah8vmvm4mkwVG4zHhIcmf92G w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="344577385"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; d="scan'208";a="344577385"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 11:53:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="685478233"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; d="scan'208";a="685478233"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga007.jf.intel.com with ESMTP; 20 Apr 2023 11:53:11 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 20 Apr 2023 11:53:11 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 20 Apr 2023 11:53:11 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 20 Apr 2023 11:53:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B8zES1yKrI99PA+MWN2BV/oCzlt2LecQ9HAPI4w4mLVVu/whETysGJAQnHey1bwfXhj25qs0ZnkDtrXfmBy6XhqE1Xey8G9im6vzqhIU9H38ywMmS7KRziF8sZ4JFrsDtosLqT/9E2zrc+1AM9oRu//rwRUHIu5trcELAZS78mrXY3EZpzIS+BR9OrGnEqCgUH9eK1IUD1ryBi2N+E5XvP+mGtmg/vxZ+EZYs7Iq9u154+jYLA9rs/GtC6BWw9r/YnoANVm12lUGi05Tulk7F7HQ2CTN766W8Qq75osqhPwFt5zcM1oKdKVebIdJJi8QppahbPirhEJ2jK0tUVkA/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tAzw6zK8Uu3RwcnG+t1umuRLvMJmgRyewLllDuDi6U0=;
 b=dt2MCuLQk+NrFHHV9bTk1BqsyBd112nSl0htgqr/xY8cHoWZTVpM3i41xKcqccOcdEVAa9t6rd7NI10VoR09DviypwW7s1FvyWSHO+UqU9lK+xDRZb+2esmHZ6xoxTTpyydbBspZrctxRpDcnsg6yIvIUh9/LLN48Xeg1tnF/FEduY2WCWX0MzvFZ79CHw5OEKr73UVE3E8l65P6KvlZQGmTYPkDhLqq8eYU6xvaL637/MlbLCTmJ2Odit9WNRTVbD1QYLs9P6mDyfCVL3FEKn3bS9huDRskMxvAgPeAGYdcUUtOS2BkSz6A/UNiEavgPL1fdUF7O9hKzlAhzFB6vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB4803.namprd11.prod.outlook.com (2603:10b6:303:95::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Thu, 20 Apr
 2023 18:53:09 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 18:53:09 +0000
Date: Thu, 20 Apr 2023 11:53:06 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <pofqujdm6esn74xfl2eiphxquupoolbqnttbnjs2hmqvtkwspo@4yqkzpqat43m>
X-Patchwork-Hint: comment
References: <20230419175501.155319-1-stuart.summers@intel.com>
 <87mt32x5iw.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <87mt32x5iw.fsf@intel.com>
X-ClientProxiedBy: BYAPR05CA0071.namprd05.prod.outlook.com
 (2603:10b6:a03:74::48) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB4803:EE_
X-MS-Office365-Filtering-Correlation-Id: 57dd8812-049d-43e5-3a13-08db41d07c19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4pleB14LHItXCxfI/GzrTJj9mTjVebEyUVgFznFaa+CrtfjDfMlGYwPDdoSftJFZLN+UJ2x2xFKn/ZzU8aPXs/2/9wuyZztiIIZ6SGvPz+FMizgDnULLnd3OISgxy/sFwwXfjPJew/R2RId5nYe0c9exwB7EeTIzdxHxZv9h3NFzimoKIKZ6RI45oalvc5JgrnGkmfLIDBwx0vun7UDQ+fUi0pKY5kqYGJ0dCYRpOuk5Je6Rz2Nq1nhEuwv/QVrX92D8CwRQG4Wsyw/BZSI4FIkV/4UMLBOUBxe+66D/LcWUE02Yik3/t+n8/DInv/cMsOtu7RWOpEMq5sLZ1LayoI/b8DBsyEPhiU7Sm9XRBh18WAjPBuG5JPH41Jf27O8oJOOAMJJ+c3WompGyj2bk6/pgR3zXWZMISH5o8HJB55AJ5WF4KN+TjX4aDmcQ/1qcWOC1ezYg7VRm17rFqH/lIeyD+DuGzVwH4Ni5zmbn5sU7MRhGYD+0OcFSjLQULu0zM9l1YO1sCRlsA4rXCYgUgA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(376002)(346002)(366004)(396003)(39860400002)(451199021)(2906002)(8936002)(38100700002)(8676002)(5660300002)(33716001)(86362001)(9686003)(6506007)(6486002)(6666004)(6512007)(966005)(478600001)(83380400001)(186003)(316002)(4326008)(66556008)(82960400001)(6916009)(66476007)(66946007)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+nARsy/Nk4qX7nCwokyzl0HuC61msHB3Vh3HjBnn0T/E5eXy7w7qgp1kL3FR?=
 =?us-ascii?Q?XMM0LP13danCy3re0Cfb+L8+0apxsDQ4FaLYzJ8pL7oeo7gVBnxK5YZihxzM?=
 =?us-ascii?Q?4703D8/gvbTaF+pUehiP+SUOv3ISPog48GGE30+rsS+qlrrGDgKFNGM+jaHj?=
 =?us-ascii?Q?E8bkHRf/A5pdbd9vBe4HU9o9gDH6KgFmJ7xwkhnxHabc5eX0Blw5J/0Kdgiz?=
 =?us-ascii?Q?wUzUl2JO7ifmQkofoVQ1QfM32++dgUDoRFemz4E2rObw3XTcgwRBka/fTw6W?=
 =?us-ascii?Q?Dtkr0UxPR3wz+/NlB5YsW0k6rQasO2hwscz/M3h9ZHGwhzsKKlUc29bvBA8w?=
 =?us-ascii?Q?8anRfNWfDqz4/FylHBVK/AF4DnAt52pBhVxzZ9LK51DFkYNReyegZJvqZm8x?=
 =?us-ascii?Q?uK3koppDmutQRtMaHN2eQMMNkH1NaCHPFduKOPcaQWKyJ/ecpSCevLfLA+k7?=
 =?us-ascii?Q?YbEKLiHspuc6anTHe1rMjeZY78nLy4ycbo7sFVJIyDDXQoEnMTl04xZ1BOnX?=
 =?us-ascii?Q?59HWuQM+N0+89gBRjcVYxC0jaMwBWRd+6s4g0yq9NUUXfcL7By+OgRAAJMV/?=
 =?us-ascii?Q?7P2rpSdsXOU5UyLJJ+ozwXf6ZkS+2B5CNDg2zWXx4LjPKJhvZe86bWlZh/0r?=
 =?us-ascii?Q?PxEyLkwV5YWNSY6ckGQXrLwoU73D1e/ijbgpi0iFceoDsyTzbYCn92FOB7nF?=
 =?us-ascii?Q?q8+gzxSUht81qp1X87Jr8OyB+LOZhl+DOOxcdtNLU+EgSDO4v5Ul/2+7EyMO?=
 =?us-ascii?Q?pWa/p5oRPAwFmMRPlwarhZhZT7NZ3SHzPfSwEfRjUwrnW0GfItvs6Y0NazMb?=
 =?us-ascii?Q?jYEkzB6QEGnMpc4KsyrS6J7ZYTpHWzNSNqUdPvueLfKnAWLz0im5BW5MQ15R?=
 =?us-ascii?Q?peGAA8TokCUnHeugpH4FTQFl2m+82e8hV4ahpK9xKxrRqnHF7UumZyl/yjPd?=
 =?us-ascii?Q?eWXCTz+NFCNWowEepBgST+8eMvK+MiulKwGlVO8y0kzxnIcAgSt6v7VASVKP?=
 =?us-ascii?Q?/W6BPPhuIbXHt2RHhBvJZ2v3SJ1usAzuup5RzaS7oz1sNNJuQgprkfT3GGTW?=
 =?us-ascii?Q?l6rAzV+20t4MtI04KB/h3eVpldKYjpQr/Jj8c2fUadyAWFthllLA3pFp7n9F?=
 =?us-ascii?Q?ZGs1WwPiGBb0eNTUjFn2SUqi2vPATbRQ/fz+MhDHTKEQrwcsRSHq/xB38xn/?=
 =?us-ascii?Q?78QDX8KqbrAqVfZsbXPGRq8FkaqvnIJ015oY/JQFoBZzUC4zM2OiHB2f1TVe?=
 =?us-ascii?Q?s1yoeGEjFymjYSYmz2wVfVq8Cb92mIoWEuZpgjFY0XaspwciOzqNTMpQSFM7?=
 =?us-ascii?Q?sFGi+y6v38S4sUKXxwranSFy+2TFZKdIRMAgusL3EPKrGlmgPQWMJzF3Miml?=
 =?us-ascii?Q?6sjJhqgiB5wvQVIzbUc9q2jla09iXQRgUTSsXHzFlvCTCsHYgeZsROkM0YAB?=
 =?us-ascii?Q?KGTXrjiSrFI7VAyTqv2gXKPnQGzwQMR64H9xp2J4RtQ7QheUnXsQKya1nnDu?=
 =?us-ascii?Q?/Ta0cm2WX5NmFiNxqhsq5RO0MpGvxdEnZ8rxEGep5NI3/CJeowLbv1ZegKvR?=
 =?us-ascii?Q?MUlZyTorWQQBKplJSuEiLbajq37zQJwrZTmYP56qY+Yt55k0yv/7R8KO9jJR?=
 =?us-ascii?Q?mp1kjYZgrrf60NtN5BqGDQDOAy2HKLiPIZEovP2jJNwZIrK3Sp8erxPXhN1h?=
 =?us-ascii?Q?aiSjNw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 57dd8812-049d-43e5-3a13-08db41d07c19
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 18:53:09.5659 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Juzh7cbKwLReaH6HukEIA0kBFHyjTinAGwGyFFxb/ABySUWioY6mo2yoWTtqxa7PxvIOAFvUGoRvwvWWreUsfufe/Uox4SlBkpg1FafoBL0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4803
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 0/4] RFC: Add new device configuration
 infrastructure to
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
Cc: Stuart Summers <stuart.summers@intel.com>, matthew.d.roper@intel.com,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Apr 20, 2023 at 12:32:55PM +0300, Jani Nikula wrote:
>On Wed, 19 Apr 2023, Stuart Summers <stuart.summers@intel.com> wrote:
>> This is attempting to take the best parts of i915 module parameters
>> (minus the actual module parameters) and add to xe to allow for better
>> debuggability and configuration in order to help isolate problems
>> on a per-device level instead of global module parameters.
>>
>> Note that I did review a few options here: configfs (not generally
>> used by the drm stack), module parameters (we have some negative
>> history here), sysfs (not the right approach given the focus on
>> user interface here). Debugfs is used in various drm drivers to
>> configure various device characteristics. The infrastructure being
>> presented here has at a high level been present in the i915 driver
>> for some years now, so provides a good starting point for quick
>> debug additions without exposing users to some of the challenges
>> faced with module parameters in the past.
>
>Looking into configfs has been on my todo list for a long time. It's
>something that often gets recommended as a replacement to module
>parameters, but the documentation as well as the existing examples in
>the kernel are, I think, less than stellar. Basically would require
>implementing it and seeing how it actually works.
>
>In any case, I don't think it should be dismissed with just "not
>generally used by the drm stack". A decent implementation could set the
>example going forward.
>
>The main problem with debugfs is the inability to set the default values
>prior to probing the device. This is where module parameters are handy,
>but they aren't device specific (and, as you note, generally
>discouraged).
>
>Looking at the patches, I'm not sure I understand what the procedure for
>setting the debugfs values before probing the device would be. Can you
>provide an example sequence on the command-line please?

I think that for any solution != parameters is:  split the module load
and the module bind phases.  I've been using that for a long time since
it's a general solution for attaching tracepoints on early probe and
it applies to any kernel module (differently than e.g. adding a "nomodeset"
parameter to achive similar thing). For a debugging thing, usually for early
bring up that would be acceptable I think.

More context:
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/230

Lucas De Marchi

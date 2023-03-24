Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC7BCC6FD20
	for <intel-xe@archiver.kernel.org>; Fri, 24 Mar 2023 15:15:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54F6B10E4E4;
	Fri, 24 Mar 2023 15:15:49 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E9E210E4E4
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Mar 2023 15:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679670946; x=1711206946;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8G8nQnlcwGXxOqKlhqHl42P3LsXcc8fKhBobQFVkABk=;
 b=BMNdyARG8TQaxr1hmGMNLwmQefKcRFZilx90iinfLYI/ySQsf8KHoWFK
 hFM3g5HrNWyqaxWWYt5YoJmpi2M+Or3G9iEMOqPy2JSIOZBThUF5LWXP0
 ZXQcotOAPlzMmQPeAfNbGIW0u2KpfQhKvKUYmXtvSqfyZCdAwbC5IaINT
 ejtdWR85BBHrzHJCLjTCAUEVF5UFAZ5VzELPWhyO1TmS7mFmTgV+vX64E
 OpRckd1VOP8Me8BZw0nCB8b5/tHOeL5xjc3OXi2ARKxf8Ii/JGdqc0+3I
 qRK3VJ2AxcYIaneYYuIBf/10JXp11emwsJW5cDNDp+SXsVpve8qW0j7rW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="320197643"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="320197643"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 08:15:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="715264996"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="715264996"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP; 24 Mar 2023 08:15:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 24 Mar 2023 08:15:44 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 24 Mar 2023 08:15:43 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 24 Mar 2023 08:15:43 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 24 Mar 2023 08:15:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZE7bF+cyIVWSoPUm+n8nDHh6CAFBsYHbj7MYdHfYLTVwTlMPFkSPfPmvXPPQrEYH0AUMr13mpilVkdlgpRlFeT3cyD+a0cNkbayktNtGuOC2S3dtAJYgxQ5+xGxv1RagfhjobzCwAyw7Pz97zw87mczjLk3hyd5AoUFKS5Cj+iFsoh/WyobKlxW3jQSdzyNqKSCDIXmozPuY4cZgXqQq1jzZFWBddMj4vx+MzEIP674p3Tbibdybpgs15UsKvi7wG7S28J5jgj/dVP8b9ZTyNVEdAw6TanUGXrGSLYMh5+BeXo8UlBEUR7/c9qUFBC6+rKa0qyec7vfDEXk9Ovd/dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XbllnwJ9YEsMWNcLLrcsOCQ2oBYRbw4kOb48NNHopwo=;
 b=MkF+MrbolovOtyLcj038W9PpJ8kfEGbPyg/IpReRno2BpHxrZ0mziATT9qe6qVZWvcPvFwkYIIWQGjkosFMwn3WciUJMEEDQ52SUwFEa6RoZioV290sPv987QAm9BWbF8s82ZbC6wH6HOp6XQdYVRRosoFPUyAFZ5lWcdWr0wgrxg9nbDb25J19k2gxW2U7bmmFX2m4o2ahlB/+OfvWqxC2+Kux3zBz3WAv2rBxcoJuI+lLLDm4gr5LlJJf2zNule39JtCQttLukWSBDXL1cx3UPWOZdKvSJt0S0htzFoXL+4dw+wF0zMQLFhsYAKKcgL3fl+7+s9jwxJHQBUOza4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by LV2PR11MB6024.namprd11.prod.outlook.com (2603:10b6:408:17a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Fri, 24 Mar
 2023 15:15:41 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%5]) with mapi id 15.20.6178.037; Fri, 24 Mar 2023
 15:15:41 +0000
Date: Fri, 24 Mar 2023 08:15:38 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Message-ID: <20230324151538.kijwken2272uznwy@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230323202313.3523-1-yu.bruce.chang@intel.com>
 <ZBzYPLlnwL86qo0d@DUT025-TGLU.fm.intel.com>
 <PH8PR11MB6950295C09940BD29EE7EF52C3879@PH8PR11MB6950.namprd11.prod.outlook.com>
 <20230324083704.645a667c@maurocar-mobl2>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230324083704.645a667c@maurocar-mobl2>
X-ClientProxiedBy: MW4PR03CA0277.namprd03.prod.outlook.com
 (2603:10b6:303:b5::12) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|LV2PR11MB6024:EE_
X-MS-Office365-Filtering-Correlation-Id: 455bd6e8-f777-4db0-a352-08db2c7aa14f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OWNILlBjplSVv6tyvwOE3j9hWzD4YTAnhteRpLanpyIlbtSiMq91MpA2wA0qKzRhgiYDf8ymG2dQ4TFoh4SYgmsuCiNs3UPJr6s4aoaCiReZrYHP89JnjK3UTcsdzVUN0YGp89/m4G74rxoxjqrTu0jwWo61intnluXHtf5agfFPdm8oVj/2peV9PNfrPNrOkkDmTcgskQFmAyT+589ovvin25HBo5QS3+ff+ffeToivVJD6uqTWam48wNgQBkjUWBXvkgs47XId4AjnNEICLEvOw+1ik3Mdn67L2mkngIDhzdN01Q8WJT48OrARyeqCkrG8O/XJL3IO8yM73+RYv6C2uyfYRiY2cFoswqnpjeXH3NTJgE1fmiR+XvO5lFeM9dBI+F3ebROYgivAvqkWye37pEg/KcPscxPckJEvwRe4gGsTw6L11HlpBpoQarqVyXtltqhE5d3NPsDimjjssA8KEjQLtlYlS2jQNwUZObxx3y5vQfSFt7yE3BFjkuldQKd9f7jeFHk4oH/9IjbB/I+wyhcLCubXI7deezduuoOOe+YKBFBSzGvKTLQO5WVO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(376002)(136003)(396003)(39860400002)(366004)(451199018)(66556008)(6916009)(66476007)(4326008)(66946007)(8676002)(8936002)(36756003)(41300700001)(53546011)(38100700002)(6512007)(83380400001)(186003)(86362001)(9686003)(6666004)(1076003)(6506007)(26005)(54906003)(316002)(478600001)(6486002)(82960400001)(5660300002)(30864003)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OC98B3ejTHytQTC6/H3kXxyQsNxvvvJeTvmOlZtDaC8x9cBd/utdu+eaKrZ6?=
 =?us-ascii?Q?Yx0DHO60iqhHx50CqhwC49Ka8T19icVr8Xn4VLvQd0nG5NRSYNM9ay5GRLnV?=
 =?us-ascii?Q?QFGMp1jz5zUkafzn9uv4IDrUig0dznV4mou0F7oFNvh7g9Z3dUWdzXbJIboS?=
 =?us-ascii?Q?XfxPg6EPBvYXAkMisngkGaV/zgNZahaE+PCy3caDY0e/NjSbGv1VzY1VnxSi?=
 =?us-ascii?Q?S6fSLJc7fA8VDdyG0qdWDDZUM9EUcJB9KKlTqn09/srKifls7eVu3ujXQrAL?=
 =?us-ascii?Q?jm3aOgIgdraD5QOEZeZAUFCKgx+IpakCAAx/iBbHjCoX2ji/OtJ6tOZ0MBzp?=
 =?us-ascii?Q?sghOg3hifiJ83KS64ZwJZX/Wiyhg2iLTiu5xXJYYSf0H344pTvmz26sAwrZi?=
 =?us-ascii?Q?GbpMt8D0TObJkSn7m/yLQlwh12XfmmI5XQfuGaSHQnb4NKFuVRG4+kBRfLlx?=
 =?us-ascii?Q?BATTVP3sPkI4xyE43EopQFYv9pM2gRiT+hV/G/OS9WkklnQmJFGHB4oA2LD8?=
 =?us-ascii?Q?0GM3fKNTiIOvGzukbDAJ59xA6/a0slc5TiN5celYew3bick8DpqrLx5PKsmb?=
 =?us-ascii?Q?YvATQpqjR3bvLvDf65tkJ8hGsyOHERsduh/FLnsEcvvaatCHpVCQDRBhDWf5?=
 =?us-ascii?Q?jDBn4nzvPauUHbDimQMCEnfl8Y4tSBdQ3O2USXBcDUZo2IINTaxopwadNny5?=
 =?us-ascii?Q?f75cyodrSdcu2kTnEuNiCe8WiREBHg+NeAyu68u/jzq38FKPUSpPt9n5Wtpl?=
 =?us-ascii?Q?oLgelIF3RLpPONRe8EIu99nv6LYHnQLiCT22B2f/S6Dlycdvlh1IvwLz5Sqm?=
 =?us-ascii?Q?xPqP82JqU6rh7fCZQU0P6Pp4/TZTwGd+ENB9cGBy4fc8VMl6cpDkuznWCuTl?=
 =?us-ascii?Q?XNAEl1J3Is5X3xsqZ0GWQzpPXtXR02F2uesCH3toBXtNZaEgcxbwNzjHiQAc?=
 =?us-ascii?Q?qvbiSaOzbLjaERDbw3GZeinka5+Ie4B4RVzDgJpPzzsU4WbtqKBAIU2W1H9x?=
 =?us-ascii?Q?ujG0wHhtnfexnF6/jK3aP62F1LtBbrR/o5Jjbi3BuAAUaAFPrZm0aTl0lg/r?=
 =?us-ascii?Q?hn6MW+bsFDtvR4ZHqUPZCBITDp9pIDcEzWQmFn6SdtIexaZ20s+lyBlTREJz?=
 =?us-ascii?Q?pwpVRy9vogh8QQbi4+RUalyBk3UyMg3N6i4dehMtQ7L4+5Rh0KYGoRDq/Jlu?=
 =?us-ascii?Q?O6mhwu6gKBS2nkLNuN/TKlljCmA5w9juiK3UvvMpLsNfJC+RAP1mesZDuWnp?=
 =?us-ascii?Q?pX4NKBLuQrT5NKW/7/IEPEkzOxzSXbtOkrHYOO6HY7PjPaWqY6PyfXzwf0Wt?=
 =?us-ascii?Q?OEK4sKNf1UWgDrV1hA+lZD52ywDvdkf9kBtKr3iIEfYSWazZ6HfAuwPdQmPd?=
 =?us-ascii?Q?KUPUqy94EZv8phopjcKEefmsnOGSOa3hfU5d/OTNfW6dll9CFzXXepEyKUbL?=
 =?us-ascii?Q?00lvvnDl11Ty46qDz8LcmgtSNgoq1eh/b5b6O9xL8msGIP8sh5ctBYtl44AO?=
 =?us-ascii?Q?k2F1K8TwIFJo0N+LLMqhUz2FKRdUvbPZVyoGBwQ9JLoLRYI7pm2jlqNvhp5L?=
 =?us-ascii?Q?PMQFrpi6zYDoHcxyOZMXs+J+2MNt8GGdFLx39KOQA27FZbWY4P8CXoMaZkQ4?=
 =?us-ascii?Q?0Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 455bd6e8-f777-4db0-a352-08db2c7aa14f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 15:15:41.3272 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: paMWmHh7zr0046CcJCy50UNzb/PwGqlw9J7MNMD9jPvVQmjhb6e4ufUaD+WgWm01DSHMErizH5z/y/0sz7SsmLy/oKGfm92uLhWPp+AY4RE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6024
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: don't auto fall back to execlist
 mode if guc failed to init
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
Cc: "Chang, Yu bruce" <yu.bruce.chang@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Mar 24, 2023 at 08:37:04AM +0100, Mauro Carvalho Chehab wrote:
>On Thu, 23 Mar 2023 23:08:58 +0000
>"Chang, Yu bruce" <yu.bruce.chang@intel.com> wrote:
>
>> > -----Original Message-----
>> > From: Brost, Matthew <matthew.brost@intel.com>
>> > Sent: Thursday, March 23, 2023 3:53 PM
>> > To: Chang, Yu bruce <yu.bruce.chang@intel.com>
>> > Cc: intel-xe@lists.freedesktop.org
>> > Subject: Re: [Intel-xe] [PATCH] drm/xe: don't auto fall back to execlist mode
>> > if guc failed to init
>> >
>> > On Thu, Mar 23, 2023 at 08:23:13PM +0000, Chang, Bruce wrote:
>> > > In general, this is due to FW load failure, should just report error
>> > > and fail the probe so that user can easily retry again.
>> > >
>> > > Cc: Matt Roper <matthew.d.roper@intel.com>
>> > > Signed-off-by: Bruce Chang <yu.bruce.chang@intel.com>
>> >
>> > I have not tested this but assuming you did:
>> > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>> >
>> Yes, I tested on PVC and it used to fall back to execlist mode and constantly
>> print out EXECLIST_STATUS. Now all those are not showing after this change.
>>
>> There is still other unrelated issues during __pfx_ggtt_fini_noalloc, and need
>> to be fixed as below.
>>
>> [  223.839894] BUG: KASAN: null-ptr-deref in ttm_resource_free+0xe4/0x140 [ttm]
>> [  223.847211] Read of size 8 at addr 0000000000000018 by task systemd-udevd/566
>>
>> [  223.856141] CPU: 0 PID: 566 Comm: systemd-udevd Not tainted 6.2.0-xe+ #4
>> [  223.864921] Hardware name: Intel Corporation WilsonCity/WilsonCity, BIOS WLYDCRB1.SYS.0020.P84.2103030140 03/03/2021
>> [  223.877365] Call Trace:
>> [  223.881707]  <TASK>
>> [  223.885658]  dump_stack_lvl+0x5b/0x85
>> [  223.891200]  print_report+0x499/0x4aa
>> [  223.896690]  ? ttm_resource_free+0xe4/0x140 [ttm]
>> [  223.903268]  kasan_report+0x99/0x1a0
>> [  223.908683]  ? ttm_resource_free+0xe4/0x140 [ttm]
>> [  223.915210]  ttm_resource_free+0xe4/0x140 [ttm]
>> [  223.921621]  ttm_bo_release+0x3e5/0x550 [ttm]
>> [  223.927811]  ? __pfx_ttm_bo_release+0x10/0x10 [ttm]
>> [  223.934530]  ? ttm_bo_kunmap+0x11f/0x160 [ttm]
>> [  223.940775]  ? __pfx_ggtt_fini_noalloc+0x10/0x10 [xe]
>
>Xe driver release is currently buggy. there's a just added test on
>IGT that load/unload the driver 10 times[1].
>
>[1] this is a good way to check if object references are properly
>    released and that the object lifetime cycle is correct.
>
>This is what happens if you run it (tested on TGL):
>
>	$ sudo ./build/tests/xe_module_load --run many-reload --debug
>	IGT-Version: 1.27.1-g0682c2b07c7e (x86_64) (Linux: 6.2.0-xe-1ae4dd9e8+ x86_64)
>	Starting subtest: many-reload
>	(xe_module_load:3070) DEBUG: reload cycle: 0
>	(xe_module_load:3070) igt_kmod-DEBUG: Module mei_pxp unloaded immediately
>	(xe_module_load:3070) igt_kmod-DEBUG: Module mei_hdcp unloaded immediately
>	(xe_module_load:3070) igt_kmod-DEBUG: Module drm_kms_helper could not be found or does not exist. err: -2
>	(xe_module_load:3070) igt_kmod-DEBUG: Could not remove module drm_kms_helper (No such file or directory)
>	(xe_module_load:3070) igt_kmod-DEBUG: Module drm unloaded immediately
>	(xe_module_load:3070) DEBUG: reload cycle: 1
>	(xe_module_load:3070) igt_kmod-DEBUG: Module snd_hda_intel unloaded immediately
>	(xe_module_load:3070) igt_kmod-DEBUG: Module xe unloaded immediately
>	(xe_module_load:3070) igt_kmod-DEBUG: Module drm_display_helper unloaded immediately
>	(xe_module_load:3070) igt_kmod-DEBUG: Module drm_kms_helper unloaded immediately
>	(xe_module_load:3070) igt_kmod-DEBUG: Module gpu_sched unloaded immediately
>	(xe_module_load:3070) igt_kmod-DEBUG: Module drm_suballoc_helper unloaded immediately
>	(xe_module_load:3070) igt_kmod-DEBUG: Module drm_buddy unloaded immediately
>	(xe_module_load:3070) igt_kmod-DEBUG: Module drm_ttm_helper unloaded immediately
>	(xe_module_load:3070) igt_kmod-DEBUG: Module ttm unloaded immediately
>	(xe_module_load:3070) igt_kmod-DEBUG: Module drm unloaded immediately
>	(xe_module_load:3070) DEBUG: reload cycle: 2
>	(xe_module_load:3070) igt_kmod-DEBUG: Module snd_hda_intel unloaded immediately
>	(xe_module_load:3070) igt_kmod-DEBUG: Module xe unloaded immediately
>	(xe_module_load:3070) igt_kmod-DEBUG: Module drm_display_helper unloaded immediately
>	(xe_module_load:3070) igt_kmod-DEBUG: Module drm_kms_helper unloaded immediately
>	(xe_module_load:3070) igt_kmod-DEBUG: Module gpu_sched unloaded immediately
>	(xe_module_load:3070) igt_kmod-DEBUG: Module drm_suballoc_helper unloaded immediately
>	(xe_module_load:3070) igt_kmod-DEBUG: Module drm_buddy unloaded immediately
>	(xe_module_load:3070) igt_kmod-DEBUG: Module drm_ttm_helper unloaded immediately
>	(xe_module_load:3070) igt_kmod-DEBUG: Module ttm unloaded immediately
>	(xe_module_load:3070) igt_kmod-DEBUG: Module drm unloaded immediately
>	...
>
>See the dmesg for the above below.
>
>Regards,
>Mauro
>
>Dmesg:
>
>[  330.190943] **********************************************************
>[  330.190947] **   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **
>[  330.190951] **                                                      **
>[  330.190955] ** trace_printk() being used. Allocating extra memory.  **
>[  330.190959] **                                                      **
>[  330.190962] ** This means that this is a DEBUG kernel and it is     **
>[  330.190966] ** unsafe for production use.                           **
>[  330.190970] **                                                      **
>[  330.190974] ** If you see this message and you are not debugging    **
>[  330.190977] ** the kernel, report this immediately to your vendor!  **
>[  330.190981] **                                                      **
>[  330.190985] **   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **
>[  330.190988] **********************************************************
>[  330.260128] xe 0000:00:02.0: vgaarb: deactivate vga console
>[  330.302169] xe 0000:00:02.0: vgaarb: deactivate vga console
>[  330.306461] xe 0000:00:02.0: vgaarb: changed VGA decodes: olddecodes=io+mem,decodes=io+mem:owns=io+mem
>[  330.312251] GT topology dss mask (geometry): 00000000,0000003f
>[  330.312259] GT topology dss mask (compute):  00000000,00000000
>[  330.312264] GT topology EU mask per DSS:     0000ffff
>[  330.321566] xe 0000:00:02.0: [drm] Finished loading DMC firmware i915/tgl_dmc_ver2_12.bin (v2.12)
>[  330.682290] xe REG[0x2340-0x235f]: allow read access
>[  330.682307] xe REG[0x7010-0x7017]: allow rw access
>[  330.682334] xe REG[0x7018-0x701f]: allow rw access
>[  330.683282] xe REG[0x223a8-0x223af]: allow read access
>[  330.684245] xe REG[0x1c03a8-0x1c03af]: allow read access
>[  330.685168] xe REG[0x1d03a8-0x1d03af]: allow read access
>[  330.686083] xe REG[0x1c83a8-0x1c83af]: allow read access
>[  330.805598] [drm] Initialized xe 1.1.0 20201103 for 0000:00:02.0 on minor 0
>[  331.008489] ACPI: video: Video Device [GFX0] (multi-head: yes  rom: no  post: no)
>[  331.056568] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:00/input/input8
>[  331.064576] xe 0000:00:02.0: [drm] Cannot find any crtc or sizes
>[  331.075111] xe 0000:00:02.0: [drm] Cannot find any crtc or sizes
>[  331.077136] xe 0000:00:02.0: [drm] Cannot find any crtc or sizes
>[  331.321351] snd_hda_intel 0000:00:1f.3: enabling device (0000 -> 0002)
>[  331.340407] snd_hda_intel 0000:00:1f.3: bound 0000:00:02.0 (ops i915_audio_component_bind_ops [xe])
>[  331.469991] input: HDA Intel PCH HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input9
>[  331.473074] input: HDA Intel PCH HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input10
>[  331.476405] input: HDA Intel PCH HDMI/DP,pcm=8 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input11
>[  331.478857] input: HDA Intel PCH HDMI/DP,pcm=9 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input12
>[  334.010143] ACPI: bus type drm_connector unregistered
>[  334.130906] ACPI: bus type drm_connector registered
>[  334.656848] xe 0000:00:02.0: vgaarb: deactivate vga console
>[  334.683973] xe 0000:00:02.0: vgaarb: deactivate vga console
>[  334.690364] GT topology dss mask (geometry): 00000000,0000003f
>[  334.690373] GT topology dss mask (compute):  00000000,00000000
>[  334.690377] GT topology EU mask per DSS:     0000ffff
>[  334.692551] xe 0000:00:02.0: [drm] Finished loading DMC firmware i915/tgl_dmc_ver2_12.bin (v2.12)
>[  335.042555] xe REG[0x2340-0x235f]: allow read access
>[  335.042574] xe REG[0x7010-0x7017]: allow rw access
>[  335.042580] xe REG[0x7018-0x701f]: allow rw access
>[  335.043634] xe REG[0x223a8-0x223af]: allow read access
>[  335.044892] xe REG[0x1c03a8-0x1c03af]: allow read access
>[  335.045951] xe REG[0x1d03a8-0x1d03af]: allow read access
>[  335.047052] xe REG[0x1c83a8-0x1c83af]: allow read access
>[  335.120059] [drm] Initialized xe 1.1.0 20201103 for 0000:00:02.0 on minor 0
>[  335.283192] ACPI: video: Video Device [GFX0] (multi-head: yes  rom: no  post: no)
>[  335.342193] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:00/input/input13
>[  335.349695] xe 0000:00:02.0: [drm] Cannot find any crtc or sizes
>[  335.363384] xe 0000:00:02.0: [drm] Cannot find any crtc or sizes
>[  335.365528] xe 0000:00:02.0: [drm] Cannot find any crtc or sizes
>[  335.414725] snd_hda_intel 0000:00:1f.3: bound 0000:00:02.0 (ops i915_audio_component_bind_ops [xe])
>[  336.447397] snd_hda_intel 0000:00:1f.3: azx_get_response timeout, switching to polling mode: last cmd=0x200f0000
>[  337.448522] snd_hda_intel 0000:00:1f.3: No response from codec, disabling MSI: last cmd=0x200f0000
>[  338.456521] snd_hda_intel 0000:00:1f.3: Codec #2 probe error; disabling it...
>[  339.463518] snd_hda_intel 0000:00:1f.3: azx_get_response timeout, switching to single_cmd mode: last cmd=0x200f0000
>[  339.465715] hdaudio hdaudioC0D2: no AFG or MFG node found
>[  339.466992] snd_hda_intel 0000:00:1f.3: no codecs initialized
>[  339.475013] ==================================================================
>[  339.475109] BUG: KASAN: use-after-free in snd_card_free+0x99/0x130
>[  339.475125] Read of size 1 at addr ffff88814252ccda by task xe_module_load/3070
>[  339.475143] CPU: 1 PID: 3070 Comm: xe_module_load Not tainted 6.2.0-xe-1ae4dd9e8+ #2
>[  339.475157] Hardware name: Intel(R) Client Systems NUC11TNHi7/NUC11TNBi7, BIOS TNTGL357.0062.2021.1203.1108 12/03/2021
>[  339.475171] Call Trace:
>[  339.475179]  <TASK>
>[  339.475186]  dump_stack_lvl+0x5b/0x85
>[  339.475197]  print_report+0x171/0x4aa
>[  339.475210]  ? snd_card_free+0x99/0x130
>[  339.475219]  kasan_report+0x99/0x1a0
>[  339.475230]  ? snd_card_free+0x99/0x130
>[  339.475243]  snd_card_free+0x99/0x130

seems to be a different bug though, with the snd_hda_intel doing a
use-after-free on the release path, triggered by the removal of
snd_hda_intel rather than xe itself.

So... 2 bugs (at least) to fixup:

	1) null-ptr-deref in ttm_resource_free+0xe4
	2) use-after-free in snd_card_free+0x99

+Maarten, +Jani have you seen this second one?

Lucas De Marchi

>[  339.475263]  ? __pfx_snd_card_free+0x10/0x10
>[  339.475278]  ? azx_remove+0xb4/0xe0 [snd_hda_intel]
>[  339.475303]  pci_device_remove+0x66/0x100
>[  339.475316]  device_release_driver_internal+0xfa/0x1c0
>[  339.475330]  unbind_store+0x13c/0x160
>[  339.475340]  ? __pfx_sysfs_kf_write+0x10/0x10
>[  339.475351]  kernfs_fop_write_iter+0x1bc/0x260
>[  339.475363]  vfs_write+0x57d/0x760
>[  339.475374]  ? __pfx_vfs_write+0x10/0x10
>[  339.475388]  ? __fget_light+0x9e/0x100
>[  339.475399]  ksys_write+0xc7/0x170
>[  339.475409]  ? __pfx_ksys_write+0x10/0x10
>[  339.475421]  ? lockdep_hardirqs_on_prepare+0x128/0x230
>[  339.475433]  ? syscall_enter_from_user_mode+0x21/0x50
>[  339.475446]  do_syscall_64+0x3c/0x90
>[  339.475457]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
>[  339.475469] RIP: 0033:0x7ff883d14a37
>[  339.475479] Code: 10 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff eb b7 0f 1f 00 f3 0f 1e fa 64 8b 04 25 18 00 00 00 85 c0 75 10 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 51 c3 48 83 ec 28 48 89 54 24 18 48 89 74 24
>[  339.475504] RSP: 002b:00007ffcaa4f7068 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
>[  339.475520] RAX: ffffffffffffffda RBX: 0000561562a83f58 RCX: 00007ff883d14a37
>[  339.475532] RDX: 000000000000000c RSI: 0000561562a83f6b RDI: 0000000000000003
>[  339.475544] RBP: 0000561562a83e80 R08: 0000000000000033 R09: 00007ffcaa4f6ef0
>[  339.475556] R10: 0000000000000100 R11: 0000000000000246 R12: 00007ffcaa4f7100
>[  339.475568] R13: 0000000000000003 R14: 0000561562a83f6b R15: 00007ff88415b040
>[  339.475583]  </TASK>
>[  339.475596] Allocated by task 3070:
>[  339.475605]  kasan_save_stack+0x22/0x50
>[  339.475608]  kasan_set_track+0x25/0x30
>[  339.475612]  __kasan_kmalloc+0x82/0x90
>[  339.475615]  __kmalloc+0x5f/0x1b0
>[  339.475619]  snd_card_new+0x60/0xc0
>[  339.475623]  azx_probe+0x14c/0xf90 [snd_hda_intel]
>[  339.475632]  pci_device_probe+0x100/0x210
>[  339.475636]  really_probe+0x143/0x4d0
>[  339.475639]  __driver_probe_device+0xc7/0x220
>[  339.475643]  driver_probe_device+0x49/0xf0
>[  339.475646]  __driver_attach+0x101/0x200
>[  339.475650]  bus_for_each_dev+0xeb/0x150
>[  339.475653]  bus_add_driver+0x2a0/0x2f0
>[  339.475656]  driver_register+0xdc/0x170
>[  339.475660]  do_one_initcall+0xbd/0x400
>[  339.475664]  do_init_module+0xe4/0x320
>[  339.475668]  load_module+0x3011/0x3320
>[  339.475671]  __do_sys_finit_module+0x110/0x1b0
>[  339.475675]  do_syscall_64+0x3c/0x90
>[  339.475678]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
>[  339.475687] Freed by task 89:
>[  339.475695]  kasan_save_stack+0x22/0x50
>[  339.475698]  kasan_set_track+0x25/0x30
>[  339.475701]  kasan_save_free_info+0x2e/0x50
>[  339.475705]  __kasan_slab_free+0x109/0x1a0
>[  339.475708]  __kmem_cache_free+0x221/0x400
>[  339.475712]  device_release+0x5a/0xf0
>[  339.475715]  kobject_put+0xde/0x270
>[  339.475719]  snd_card_free+0x114/0x130
>[  339.475722]  process_one_work+0x527/0x9d0
>[  339.475727]  worker_thread+0x2d1/0x640
>[  339.475730]  kthread+0x183/0x1c0
>[  339.475734]  ret_from_fork+0x29/0x50
>[  339.475743] The buggy address belongs to the object at ffff88814252c000
>                which belongs to the cache kmalloc-4k of size 4096
>[  339.475762] The buggy address is located 3290 bytes inside of
>                4096-byte region [ffff88814252c000, ffff88814252d000)
>[  339.475786] The buggy address belongs to the physical page:
>[  339.475796] page:ffffea0005094a00 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x142528
>[  339.475801] head:ffffea0005094a00 order:3 compound_mapcount:0 subpages_mapcount:0 compound_pincount:0
>[  339.475804] flags: 0x4000000000010200(slab|head|zone=2)
>[  339.475810] raw: 4000000000010200 ffff8881000433c0 ffffea0004c77210 ffffea0004abb410
>[  339.475813] raw: 0000000000000000 0000000000020002 00000001ffffffff 0000000000000000
>[  339.475816] page dumped because: kasan: bad access detected
>[  339.475824] Memory state around the buggy address:
>[  339.475833]  ffff88814252cb80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>[  339.475846]  ffff88814252cc00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>[  339.475858] >ffff88814252cc80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>[  339.475870]                                                     ^
>[  339.475881]  ffff88814252cd00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>[  339.475894]  ffff88814252cd80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>[  339.475906] ==================================================================
>[  339.475932] Disabling lock debugging due to kernel taint
>[  340.320483] ACPI: bus type drm_connector unregistered
>[  340.438735] ACPI: bus type drm_connector registered
>...

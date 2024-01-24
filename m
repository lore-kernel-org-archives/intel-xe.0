Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83DB6C46CD2
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jan 2024 18:28:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48B4710E1BD;
	Wed, 24 Jan 2024 18:28:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0076D10E1BD
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jan 2024 18:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706120884; x=1737656884;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=AK+q/V7z45bOjM7ICpea2Z8gtzF2HaJoNYA9M9KYP9s=;
 b=ZuubXNwQNkmry51+s4b5Bp7QowsiL0cSwu6R8KuGV1n0nQZuSeayDymh
 j0jtOWrPPgoOstcA32t4/aRIF6w2eC5mHeh2bdGmamMP1CgY0vppwKgsW
 hOO0fg40Bk1KhOdjyuK0v5bq3LA5AvMcEHrZtaxwrIsVA1Qwnu+0jx8BK
 Rvdr4Z2mGELimMv0TUR5I2Xg3KsLIPVTQIiXDxbGyPk+9lEUBA3Z5pZk3
 hC56xq9cf3F1gFTwrxeNR5cB8jJxK2oa3d9Nk5dU0x0I8VzRZazQROCy4
 i0gSchEtU71WT5AaBt48NC2SExTWhYawUM2IKThssOVnBrq0zSTSa7aBl A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="23400721"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="23400721"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 10:28:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2012975"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jan 2024 10:28:02 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Jan 2024 10:28:01 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Jan 2024 10:28:01 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Jan 2024 10:28:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lmNQtRCKZNS9hqD0OE/ofaC8s+xRmQ8YrWTeSVZSe/dTysp7qRM5cDO8BDVqkOJu4Camv5BEZtLRRmQ//X80Rxnqj9yDqhke524MrZcOKndIz94yHBvvka2DInpnivv1slYpb4A0udPuA73UqRhOyZIWzBukgel2noDX3+1pPWWFcrOvq3AXkEWtHsm50kvtIZDZPnCF3fUXulYYe7bGbIiHAm3G8bDgOjQaIJXcUkgUhgWpBfSPTXs6TMIB661tBw7ya39BsQ5wWAr0EaPwpo58FiH4qOXR5FLkKU4/ln7X7CZKYjzZXO83YBizJ012UimOnjB1yxYgf++Y6qWZ5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rriNTJkClVeNIN9tnraJs0c7glCn4es/thvF0ii2EXA=;
 b=c2q0NCVo3CH/NBrP4jPXX3Za7Bbpx3g1q/dlNyPEG45kLHvy0zeXjIC1oXEjicIKJAy/dqy6sjeKEo0hytvCM3pV+OIFGJRE01oRYpeWpnlX5RRTOhyJkHlnpxkzd69wkUxvEvTOchszdJ2gy2HCplphC7D6LImBQupXh9RjFvHfwODNsZZozTiI2sNDcgnfqwDqHvTPumG/coUpsCg3UdL2M8pBa2tWkAvePfRjiLnshqzwzjEtDqxPI2DysbzATtPIuyTMk+Ep6wcVCSDnmgprcVcZvwL8wu3qqOIjSLbzMtljonB0gDWAzQMLuQP2ES1tchF19jluhIb7ltiK5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB7918.namprd11.prod.outlook.com (2603:10b6:208:3ff::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Wed, 24 Jan
 2024 18:27:58 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7202.035; Wed, 24 Jan 2024
 18:27:58 +0000
Date: Wed, 24 Jan 2024 12:27:56 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: David Gow <davidgow@google.com>
Subject: Re: Re: Re: [PATCH v2] kunit: Mark filter* params as rw
Message-ID: <tmrstqs2okfzttk2tqedjphjcaampmmltehwjfhxeicfarknw7@idsjipdtsjbq>
References: <20240122171408.3328510-1-lucas.demarchi@intel.com>
 <CABVgOSmjyCf5DSh+LJtaLubHN3F_mrFo=ZRk23u2PEmmkLBUjA@mail.gmail.com>
 <gi2oosfohy3jjjvuazlg76se6m4w76ys5gxtmj5ngquxwqzz46@s7vgxulxzhao>
 <CABVgOSmm8Arj2RvHcsQYMssrK_GKq-wNixjFtmB6AAxhs2hgMg@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <CABVgOSmm8Arj2RvHcsQYMssrK_GKq-wNixjFtmB6AAxhs2hgMg@mail.gmail.com>
X-ClientProxiedBy: SJ0PR03CA0278.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB7918:EE_
X-MS-Office365-Filtering-Correlation-Id: 8788b0d1-653e-43cd-05ae-08dc1d0a30df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GCdVDSaD3Z1B+WYIg7B+iPWY+rj4mnhRfv3MsWsjwcSyLMpNUNf/F0/B7Xy1ZivxxtFwyuofUQnTNJnJO1cOHzw+Oh+MkDMBaltqD4XBIaID7PQ70VG3LWXTcNXeIxN+P0IzHseWcBIGaBhk7p7dgMYLMxo4fYb5XegDjk8VqvrQF3CHPOVM60BgANU85akAJ8/aPX45MOB0UgA7nkktp02JTqIerOZu7GdZVlSUCOsWVuok7zBNc3zrGdCN9gtHlLsyOjCz7RZlMs5GpJ84FdeUCUoP8UoW/kEMo21G85QoPN4kAFKdNoCwb5/1qGijDzYqal1RF++xdlUw7d9cPWtgl6RD+Hg+VtE6gtl8CjOv/SCMRPFzulZ9qq9rc4aT2PJJdGDmvNfHJOO5IyJ1k+CUwFUn3N8a042NIaO7RfjhgdN8k5DDacuaO3ngsaTOjKGZ+wlJ+svVq733rINU0ba+zYQcM7JBTPVhvID0Q0jwj9ENOqKrsgv7kaHk0ADXIPFsRHO7br4JWDfKU2RPw75Ug3lvcbqW5exRtJvSHvg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(136003)(376002)(396003)(39860400002)(366004)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(8676002)(5660300002)(8936002)(4326008)(2906002)(966005)(316002)(54906003)(6486002)(6916009)(86362001)(66946007)(66556008)(66476007)(6506007)(38100700002)(82960400001)(6512007)(9686003)(478600001)(26005)(41300700001)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cSwa7zOpHTr3tiBRQV+owt+13/PESX6y5JWetr23TmHVBGoT1A3rsq4/Oyb/?=
 =?us-ascii?Q?Eqsz7tm+c6NZK4mblzpfKxbOX0MSg0Tyk9sM/J2XeES6FOlbpjz5zk3HfSAU?=
 =?us-ascii?Q?o9EBlophvc1qcPw1lb0cZiSAUW0lqbdWXNJunw72Jj+wtBAGE8D0qCcbtEUw?=
 =?us-ascii?Q?UGx69tSwSV+AB8xHUwgBWjI+9Ih8jg8DHlBDnaUqwxVw3H9LjMrTzS5UmX2z?=
 =?us-ascii?Q?mLBJZsXrx248lSE4qWxVUjT1YaNtMyVJNNJGvfG4lUPzc9MRTmZvOROkR3mX?=
 =?us-ascii?Q?QIjDAfJDN5vy6bwk4vw4jOHjjgwqDPuBTF5xY+a4Tq4l+J47yDOkNz3zt3J+?=
 =?us-ascii?Q?9Yp2P5bhUoeT1e235qy3AN6DdVozkC00ZfY6oTmA44VsVZoSQMHXt0Zx3ZHS?=
 =?us-ascii?Q?nXLT65q3Yxbax79PhSvziTpH9RTJAL8nGoLVCwl2nJ6dtkaiPB3L7E0uzUkc?=
 =?us-ascii?Q?xCkt5+J9Sior4j2jwvrrNCtSO0nnvwED1r5yyaYTKj5nDTvKZzp6JFqfUo7v?=
 =?us-ascii?Q?3tYkc1jbGFRkksEiiSbnvN7Gvbw2E0TnV95GBZftT3o3Fv7FL5P1OFHcO5uH?=
 =?us-ascii?Q?gVTHOg/WS86Af5QfM9IFprOq6yu7hlnHoOCT33WdkauWFKdWn8ZX0JU0Ggec?=
 =?us-ascii?Q?4nRZLcjXaf/YZj3lt10cxSCssU6tY6lzuRqmUARdbvX9KDTTyZsiRXcnWTIM?=
 =?us-ascii?Q?AeD6Gb6P4uFwIf4J5d3Os60CviXrdU3AookfWfmpg/PpmPu2lZ4Gfah7jugs?=
 =?us-ascii?Q?QoW2ZhF69Fw0SGorGGdmNfob3A2O6k0SZwYXBff7rTcMZkVy3iPZZ7TOif09?=
 =?us-ascii?Q?77cCxCgkjKttGtxVJCx+ESf5j/+JC6ZRJc/b4HQNAVQPlgY9mT8brjeMoK3f?=
 =?us-ascii?Q?2XziQyculWAQU9Yw1j3+403HpTahgheH3ebYdnU32BvhnmaIad1Gk13dNp7a?=
 =?us-ascii?Q?wOd+Zdsa2y2p5CNBsSUDJKMkw/Axwb0gxgqaD4YxdX+0s7rocAGVK+soUwOk?=
 =?us-ascii?Q?jjHWJN2RM2E7x6cN/hfNCdGRd9/i8fns0ATAjDMhhNrIOI4sX7spRGNaGhdo?=
 =?us-ascii?Q?XJVw1uofbEOO/n6rcI61JPtwC7WlrhlNy1DX2R7P9D8m5d/MSYcswwAPBuQu?=
 =?us-ascii?Q?TMnBo9EJDxZoBsobtRrRKG+rtnkLeAWOMXgQ0D5/sblc+Agty69LcNS+a5H/?=
 =?us-ascii?Q?xjMbfu61s3slg1vCtk/fbKkk9I9G2n5KsRolwaw3sJJcEjEFebJjnyfz7YZi?=
 =?us-ascii?Q?sSkwCyRIjT3FSGxZJcuLEHOgHnJS3AWnDZL47ik2EmBi5jUjw5YPfaYJzQl6?=
 =?us-ascii?Q?I1/NNvQSVFEzAhidw8n2UYBhXZLq3W18Ie2uIDXv1A8h6G5nNKBR27wGltj/?=
 =?us-ascii?Q?hAZPBnWsBPhxHYpCwIOmFVKzWm3gx4xxBuQZbTpBlerDW4TsiCk53e0ID188?=
 =?us-ascii?Q?Jv7H68D22YNAGANBAB0Gz+N0nHASbAUbkQvhX8UPb5sKeBUNFBQGYPM0IX64?=
 =?us-ascii?Q?1yDQf3S0/FZK5K3xOVCq1Gp1GYE4tQR2in3SLVqTW8v9IFma6O70tASUyM+q?=
 =?us-ascii?Q?exUlS3CpsV3oRc/zUS6sU8lWL3uojJ3GZoGeEl7c6BdvMslXXRLG3nJE768Z?=
 =?us-ascii?Q?PQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8788b0d1-653e-43cd-05ae-08dc1d0a30df
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2024 18:27:58.7985 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jaPAI8YoHjXX3E4m/nrAlC3tyAjKcSgBU9qSgc5dBTBrGCH9dN7+PtPbw6vuU+uC0kBqyg45B1TcZsx9rWuFOJF3VdrNCr8EyEXoGgcNnA0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7918
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
Cc: Rae Moar <rmoar@google.com>, linux-kernel@vger.kernel.org, Brendan
 Higgins <brendan.higgins@linux.dev>, linux-kselftest@vger.kernel.org,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 kunit-dev@googlegroups.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jan 24, 2024 at 11:49:43AM +0800, David Gow wrote:
>On Wed, 24 Jan 2024 at 00:31, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>>
>> On Tue, Jan 23, 2024 at 04:01:49PM +0800, David Gow wrote:
>> >On Tue, 23 Jan 2024 at 01:14, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> >>
>> >> By allowing the filter_glob parameter to be written to, it's possible to
>> >> tweak the testsuites that will be executed on new module loads. This
>> >> makes it easier to run specific tests without having to reload kunit and
>> >> provides a way to filter tests on real HW even if kunit is builtin.
>> >> Example for xe driver:
>> >>
>> >> 1) Run just 1 test
>> >>         # echo -n xe_bo > /sys/module/kunit/parameters/filter_glob
>> >>         # modprobe -r xe_live_test
>> >>         # modprobe xe_live_test
>> >>         # ls /sys/kernel/debug/kunit/
>> >>         xe_bo
>> >>
>> >> 2) Run all tests
>> >>         # echo \* > /sys/module/kunit/parameters/filter_glob
>> >>         # modprobe -r xe_live_test
>> >>         # modprobe xe_live_test
>> >>         # ls /sys/kernel/debug/kunit/
>> >>         xe_bo  xe_dma_buf  xe_migrate  xe_mocs
>> >>
>> >> For completeness and to cover other use cases, also change filter and
>> >> filter_action to rw.
>> >>
>> >> Link: https://lore.kernel.org/intel-xe/dzacvbdditbneiu3e3fmstjmttcbne44yspumpkd6sjn56jqpk@vxu7sksbqrp6/
>> >> Reviewed-by: Rae Moar <rmoar@google.com>
>> >> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> >> ---
>> >
>> >This looks good to me, and works here.
>> >
>> >Reviewed-by: David Gow <davidgow@google.com>
>>
>> are you going to merge this through kunit tree or should I carry it in
>> drm ?
>>
>
>I think we'll merge it via KUnit for 6.9, but if you need it sooner, I
>doubt it'd cause problems if it went in via DRM instead.

I think it's fine to have it on your tree.  For our CI, we can just
apply it on the side to have it working before the 6.9 merge window.

thanks
Lucas De Marchi

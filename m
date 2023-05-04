Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 934AEC77B78
	for <intel-xe@archiver.kernel.org>; Thu,  4 May 2023 17:08:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E84710E4F3;
	Thu,  4 May 2023 17:08:22 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1CA710E4F3
 for <intel-xe@lists.freedesktop.org>; Thu,  4 May 2023 17:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683220099; x=1714756099;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gIgL678a91TmaAnH1ieddzwb0wDPjCjFL/fOZ2uPqmM=;
 b=aAuc/1fp8w6Pcui0PiILnin/quB/OpXHsyEVEOP0NRp8V40xS7OIAvYa
 Y9WSX49AVuXLY8nXbm0Xgkv+mUW7ZFK+206oiHx7r6hnC+Q2UvCSOn2zh
 K6JLGtDiQF1LJBCEMKtwPEOIwAXUrBuKl6XvM2y0ZTlo3uapShMwLvRlf
 HD1F1Y7zI8DMGnCEoXDlHoFJ50ezcyRLQC+HAhYhfTVNjpyrJePMFeks3
 oWCcNuFASvzLkIHYBwqmGIImfEmo/ZykN2xoldlDsPQUD0h0aNJ5BGIGj
 xXspaiquY7tAvU79MvGE7cwb9MgN57twRO35tweE+PrUXIQ+dgLMbdL42 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="333401848"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; d="scan'208";a="333401848"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 10:08:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="766656635"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; d="scan'208";a="766656635"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 04 May 2023 10:08:19 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 4 May 2023 10:08:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 4 May 2023 10:08:18 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 4 May 2023 10:08:18 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.43) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 4 May 2023 10:08:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZMbz7RJ7pPHiFSSS6+ou2gSUVJkQgtIwYhlUAgDdkRThTHzirpHzsSC29KywL+q5Lv5wMBD6BWx2Ogf2KviIm73wVOorzaHQhbz27HZ1vXsflmHUQs/XFyZwYkFnM8pmd47U2rrGtJsBKDI+M/ppUnp+i6KubI95jEc2gnb+J366mPHvUrejJGq+mAXVd/yJdK99EUvR9vmiXjZpcjIrBXu4ACqbJZYVK9/XrAVjdJAWmuPgqKtBf2rawRjHoaPk2+R/5JP7u95myxC3cGfLpfdM/oYn/TG4L8ttQTqJY8DdATC00QMvzCQyuJNmbZLDxAfgfhJP2Lpu0b3dSyxZFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gIgL678a91TmaAnH1ieddzwb0wDPjCjFL/fOZ2uPqmM=;
 b=JN/XGvGSfak4xoa+OPS0JHluh4OubRscrjg8ZQjbgDYzt2FN834H8QcW97fAq1CAFBs/VJMo+2nGq/w00zy6ZQPbjEXS9ufGpx5Q/pp0GD7MibtHDChluSZHE2CbG0bfDWkHCkh/m2oxuVaAn3LolewNXUQY7Bw1cpjVmPeWjSzPZKqZC1NRQawVFQDKyM/En5nJre68xUvgclDRsNh2oY/lABKEbVG5zrSoBvGOGPmgWhi9bWx9+JmS3hLkeijtoMOjJnFNSA5bUPin4UsVpVXPP0u6BT78H7ERCMCFfIfqUngjCCumNcGg9rpnlOsaRozUaJtOCgqoXi1LImv84w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB5422.namprd11.prod.outlook.com (2603:10b6:5:399::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Thu, 4 May
 2023 17:08:16 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6363.026; Thu, 4 May 2023
 17:08:16 +0000
Date: Thu, 4 May 2023 10:08:14 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@kernel.org>
Message-ID: <l2e67b3su2nplof5y6xe3jq3ikmab6bxtah74t4xwz7netl7os@m5e6vh6t3gnq>
X-Patchwork-Hint: comment
References: <20230504073250.1436293-1-lucas.demarchi@intel.com>
 <20230504073250.1436293-6-lucas.demarchi@intel.com>
 <ZFPaqpYbfbtB/5kx@rdvivi-mobl4>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZFPaqpYbfbtB/5kx@rdvivi-mobl4>
X-ClientProxiedBy: SJ0PR05CA0080.namprd05.prod.outlook.com
 (2603:10b6:a03:332::25) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB5422:EE_
X-MS-Office365-Filtering-Correlation-Id: 20ac252a-4061-404d-75fc-08db4cc226d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X0d3EBkvjDaY/ds8QGqOQj3O9sXYr1q6g7sLuAm+5pNvZv6c9Cd3mOZOcCyGlQafUknFRsRzbBGJrn6MJbtjxcTsE2fz5s+QzPeB6UIWEaa2iyHa5jy40+P4O8GB7gjKIqMw6y7Eaj4m0xv1JFuO2ZvBFlkYh816V7jj4GT5hMQ1lBYfG4QqWuwmZ6zAk73ytEEuDcfKEXOeKwwOkYAL1wV40iguKhh68HkkzEBmXE2bPNyqMqHUL9rbZCBRuepW/rST21gsVSmtprpvj9xat8X/bZZ7vWbryPxEDJADEswTl4ZHIAYUAZli85gX+4IaqORdl2CDePH6HvsuEY2Vk5m9kZLR+FYHAfGk6TTe64wyne+QRlVh8nhl7jLrDl/mx6mFjNFuafLGUB8zY9DZAvkE0aSE9kIvQbf5zRHapr7Y+LV6DKaWloCy3sMJhofRDQNFUEuWlsKYD+PaOFoW+KTW7EDumz4MpNLZk2YK9dS2ZbtbNkty32qWNhFckTjRLKB9T/j7C87zoB1L1N/z9JrM0DoV7DZJtTWJ+JGpii8/N8qUv40kPBAjxywyt7SH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(39860400002)(366004)(396003)(136003)(376002)(451199021)(6512007)(6506007)(26005)(9686003)(186003)(33716001)(478600001)(41300700001)(38100700002)(6486002)(316002)(5660300002)(8676002)(8936002)(66556008)(4326008)(6916009)(2906002)(66946007)(4744005)(83380400001)(86362001)(66476007)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6P1kxF7B3oELmPSa5ohKfKYome3AgFF1GbTQf1/wuQEAycGW+SKdtQ4jSSY6?=
 =?us-ascii?Q?m48Lf86HBnzqJg6IZOdC5PNa7evTI0gY3Hvh7Pr1IKdXvtL9HTMCyuZcrdHd?=
 =?us-ascii?Q?JSFS2piVJXqldCjIM9x+cULLsVMSvJ0pgs81tM/iurvpp15u9X9q1Nqn2DJc?=
 =?us-ascii?Q?mOlbhlwIXou4012KyP5cH9i9mDHb8EFcNPl+kqsbr3boNimGR4B7mPFL30Zn?=
 =?us-ascii?Q?Wo++XtgZ1aupAC8hWitFRh5qXp3mmUFyy2gCSPXdqeXRIa/+N7ivFpNd0lfC?=
 =?us-ascii?Q?GuLZncpg0CZlYINNn3q0C5d5lJ///+KKzfxUHTU724SabBA1vLMzrQFbTPww?=
 =?us-ascii?Q?ylGYOjlxM2mY/PGQWFxLwvgsPWX3oefMumcJ8/hmZjlpMVWfgX+Uxo/b61XV?=
 =?us-ascii?Q?jQ0GBJkSzsn3CiJF5z0X4BVkjQe41tzOvlELdduvszuwCJ9imBL5k/d3+6pS?=
 =?us-ascii?Q?GZAHFebdq1Q4RdACk76Vl3QJAlgbPj+0szESGTY+T8DrNoTfWJW88YTPUqTA?=
 =?us-ascii?Q?juU8JMmv8vo1vjSzq/tXWF0QvI59+aFqnJJE9RPrFZO8mrpIMcXd0kN0Aopm?=
 =?us-ascii?Q?CH9wg6OysHXPgUHxHAfiD8dCHJy2wBNJCAtXSemi1IMSrHmu0s8HiFrPNXLV?=
 =?us-ascii?Q?onvrHOTrkKXDeny1nPV3YZrGJoEB7PVapOOT0lNXMYwiGtvubd5luXerAiOi?=
 =?us-ascii?Q?n65B5t8Iw4dX/HOYE6+SeqbQqK5n8vTF0Hnctpatbp/ngMBHH+tEOG/sD+yQ?=
 =?us-ascii?Q?6PrANFQUsmuki0PLgG1ZOaDc8AHDzi2yIwuXoH0g1lRi7aH11pgyly5QjmlK?=
 =?us-ascii?Q?cicbZR3PMp7KybwqcJ+fTVI4CV2ZlVYpJAhvvUa7XTyI/AISxE/o8EHzyiGu?=
 =?us-ascii?Q?iD/LGNQzssTfstAx/TpY7gRPPF6Fifkam4uyEp79vgywsyTlM6r3SCCq5782?=
 =?us-ascii?Q?zTVQANVixNNHGAMG337vbRqWpj3bUM+YnfjoJb80ZMv1I5QF0slFVlrMMg6g?=
 =?us-ascii?Q?0tIvvi3lO67xEQ3X20RJ2OB3Tlu1G/VRnb7zmuHdiZTvn5BsRge5vsbGOOzo?=
 =?us-ascii?Q?OqDJTshP9KtKp/+GlfgU2u0J+NjLkGHk+f5bcoLrtmu60aqYn8nFeCItUE4y?=
 =?us-ascii?Q?L2Rud3Jq0/v4ZXMa0faeKzQV2N6JIEQKcRktKK3cAnLIalekqpYP7raE+1wM?=
 =?us-ascii?Q?4b7BFSb+QzSXE4SWWXBFWhLFtAcoTfYOWGbQ/TFJnz1ZZJ3t9FIA0ww93KCv?=
 =?us-ascii?Q?0nsy7igmlPu2tntaNNd3yWj7kCxQ0k7oN2+McmOe2jjMs/VJWNEcfDnQQLfu?=
 =?us-ascii?Q?bNSUCa5yTrWBIK0l+iovKcZMSkrzWo5Ysz2DIgRsSIhSjh72W7Q8AZdWDEpn?=
 =?us-ascii?Q?7vhn4a/azmMT3mbS97mIRLv4UtuEJcKnJ1PUL0/3/mOXXXJ2MnBM6YMhBnFQ?=
 =?us-ascii?Q?V1aldQjdYZe7VbZzN5OE5T26kCOwfYqR70hbATC0Cg40Bym/erzaQff7w94G?=
 =?us-ascii?Q?0VY35Npsyz/hg2jMd75U7Zu9DKIiDYZl4WlRfI+/a9+vk18VWl0WESJOwCzm?=
 =?us-ascii?Q?zs+m4nijqhY/3MXIC+Mm/CAFQGgGTIxMJDb6ati8D3ZYYO0CECLGumWc9/qq?=
 =?us-ascii?Q?jA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 20ac252a-4061-404d-75fc-08db4cc226d5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 17:08:16.3765 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pxXd4obWOmxtwvOad10aVnCIskJ8lc2Q4mdR42Ht0UaXvsFsGlQ8hxrXki3+323jRJhdpSECkKzzchVuSZ5xCksmvWDerJ8tOJOz4BV0kv4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5422
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 5/7] drm/xe/rtp: Let rule_matches() receive
 xe_device
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

On Thu, May 04, 2023 at 12:17:46PM -0400, Rodrigo Vivi wrote:
>On Thu, May 04, 2023 at 12:32:48AM -0700, Lucas De Marchi wrote:
>> Since some rules use xe_gt, rule_matches() uses that for matching the
>> rules, even if most of them are actually checking flags in the
>> device/platform layer. In order to allow the device-centric rules to be
>> checked for out-of-band WAs, let's pass the pointer to xe_device, too.
>
>why? if we can infer that from gt...

because in those cases gt can be NULL. Same reason why we pass both hwe
and gt. We could infer hwe from gt, but hwe is not always valid.

Lucas De Marchi

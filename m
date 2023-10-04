Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B41E7C4D9
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 15:51:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A87D810E10B;
	Wed,  4 Oct 2023 15:51:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51DE510E10B
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 15:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696434677; x=1727970677;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ynhyxIC3997dxEn6DfcTNz6+jCABgFYIHP9nPUPcXKY=;
 b=E7LNgJ9THcJ613bGKNhUrRj39NXfNV+aOiatL3X9qfQcFw4bzeL4WTZ9
 YMf1Klh5RMhX2NvNIGBcybOPUIPK+7thEWTHxygke3fzAuICVmrhhhv+W
 ICUKX/OQ4OLNdRSg4bpInKa5evyQXls2WiHR0UdgmVPPsvzHnvHzkktxa
 MsPa47Tx1qTcL73s8fmOyCrwFKB8BRzwxJwjZaFV/Ay41SmMaYiZ11brM
 lEHP2eRmsbt0QcuFyPh7wv7laY5YulH8jwmkiVnlqLAq6B9aZhx9csFDl
 ELeLApd9gnGQ7ZIERxh0xH+9LeVLJl73BtaGVtm1dhhUBRINRgPeqjXv5 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="368265376"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="368265376"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 08:51:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="841915388"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="841915388"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 08:51:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 08:51:15 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 08:51:15 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.43) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 08:51:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XSyLFZ88GAIi9TA2ZNco0RGuj+KSLmdHmWcjKgMfWEaJ/XsSq51AAJe7+OCPlDBbNQNEAFs6IsoHBXQ5ftwWUJ/e118OgC10iKPuYV7TbRKIMvoepwxfLHKeCiPV6xqn3iQigESi6Formmj7rRp7UBuRGohMecpgTS4x6EGluzjf1/5xsHaaHVxBEPePwp9VB8DtjOujXAVNLnoiLihF5OxrEHcgDLisw9vzTgjWS+vziBPRoe5/psLEQJG9X0rXX7EfHepMCzOxrLLRYH2X6JLpX3s7ReUyCoUNyOyBRYkCgrCV0PT3bCH18ZnM+KcKgco+Z9jPoq3QQ0MsTARc/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Unlds1ZTCBck3VtKLMqysuDyNXRpHtKoGPzKUT1375Q=;
 b=T9wgkAxW6gW0/AJ0NY+HnEA+D2zM7NDkXHYfNaamYfhy9RS2xe8hWjKR20kVrzHONfUoNG+oIpXL/IpVgVfjbzAhq3Hy0R9XVVn5qyJ7/QbiEvLE896qM2PLuOgWKPAV8UJl2J+Q7hQI9ec7mYUDzg8Nckg1viz0ur+2vd2TttFeMUQM7eG81ZfpSukLSVlcA1DQyYg4+2e8qhngkI2JOg/xbiD0CUMZS+C/kJ48dcENiTABOk+hQ200l1d6lZE3rleLn2HPKpWA+MmQLY5ePrzHl7LWhwLgHniuph8b0dn0m6eYcc6Ho1rr0DZCtbYPF7H62hO/Fdau3K4Q5u3Z9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA0PR11MB4687.namprd11.prod.outlook.com (2603:10b6:806:96::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Wed, 4 Oct
 2023 15:51:07 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.029; Wed, 4 Oct 2023
 15:51:07 +0000
Date: Wed, 4 Oct 2023 11:51:03 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Message-ID: <ZR2J57sjcPPZm7Gj@intel.com>
References: <20231003180909.3241390-1-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231003180909.3241390-1-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: BYAPR07CA0003.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::16) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA0PR11MB4687:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b2fdd90-8e81-455c-a8b6-08dbc4f1b92e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: deEHmqaUkGP7cIMk6Wxl8N3TyF3jx1aCgI8xmjIXH5rdo8PG39czSXbUndfoAud9b+HiESehfKEA5AMLeQb2Z5HKBiRurftCY+8UbjvSD/NLVOdHU8bKJTiRePW0HM0XwXyI24w3UsyMFtXLGId1v5s8x0zIT4SsGnXuM9ODkD0uA0gHqKU/go6Rzn3CQfco6HXsXazl3Z4Ux0VM1bckm1AiEJlmTf+cxWUZ4ukB3qwp3hox9lINXPHxImj6FD+Y9PSFgmQdeBNyJabvlqEkx+JOSlAukwbLUWdJAgqv08bP4QkTdTGO+0N6egEKIXKfHfyd64hplzheJeFvS12A6IEvvTQmI+aYYEJinWuF9/x6sNgpidOJf002U8aoOvRHT5ga2ZZ8WkJ6uj6Al/a1sCGAdfm18QlUZx9fnMUVirIFf43FiLR8HG9HAw7Yd7O0WNE+zn45SrrLu/IEiso425hHGyaRv3Nn2sU82N8vyqN+xPaDi/j3LVM82ryea7R7gRwX0IGbXwzuIKWRRJIz/LsxHGNk8uF/x4px/p5ZsCY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(366004)(376002)(39860400002)(346002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(107886003)(41300700001)(6486002)(966005)(2616005)(316002)(6506007)(66556008)(6636002)(37006003)(6512007)(66476007)(66946007)(44832011)(8676002)(6862004)(4326008)(8936002)(5660300002)(26005)(45080400002)(6666004)(478600001)(2906002)(83380400001)(36756003)(38100700002)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Bwgmlt+YH1yJgzfO7SpAukRbsnb5tNDHMxcoppyqsvFTNSMP2HguFI5ytQ95?=
 =?us-ascii?Q?qfhWEGEhTYurmIgRSwG7m9EXA2G+Ug8k0ZkU+x4HaFHsLLBUhycfMOGh1GiA?=
 =?us-ascii?Q?ufBSgJPMGpvoe47EdPujFoXmZyLL8huxQgZpJ1APCKolmEPhZEtblZP9q5ti?=
 =?us-ascii?Q?V9ddTUgiY05S8dUI0Lxz3KwQkd1ABG1YP+gtZJxXh6ptthbtczDDjoG9G5wK?=
 =?us-ascii?Q?RrElnzxtOaIzvyMONshZggdKloBqmjMnU37QGZYmLL6SzcQykF4lacTQrPTg?=
 =?us-ascii?Q?KfevgNDG9XSgjpeS93ugs/FxIzaRm5l8GHDcWRwKnoGDOdHA4/k76iQwWDye?=
 =?us-ascii?Q?FdUln0EHTBqN+GfiBZGQevy+GdVGgxk4iFBhQEG3kH4iwMFCnmrnn3YzPES6?=
 =?us-ascii?Q?kRtadPxvox3bCSe8wQjuREUDfC6LvgKh2N82gtwxi17q5Juv7C/kKiEn9io7?=
 =?us-ascii?Q?zAKNKIlOp6iTWNbldFY6awpKtTszR1g0FwdYVBV+PG0XiBdLrHDufnMM/lhU?=
 =?us-ascii?Q?5LJ4NNmWUx8609RkJzTEOpx5GI0Q44Akl7q+A2FUxd91GzMMrc+doLytH59i?=
 =?us-ascii?Q?2LuDQP1nRSjF2nXbZcEaRnLSokiSguTWuqxz79VHh7KY4/8ZH+hlpbm8xFRN?=
 =?us-ascii?Q?pbOguU4eIQErv0Xo7bvGHSCcCLNP4zaf7/iX2/n3RkhIsJEOf6seBHhthXlm?=
 =?us-ascii?Q?cZnaJyX6fyiAr8/jVHZmw6fIq4HFrsSHTyEpNx4KQWyjnNHNzzQU2duPV1N9?=
 =?us-ascii?Q?snvy67dEphJbI8t2SNzXJRexMG3RYbJqETmqjQUTCtF1x2pAf8+Se9ElTPH+?=
 =?us-ascii?Q?yHXMtnyv2YQaME9YPDeVj5AwAdW9g1ibDhxfHYO1KiCHQAuxoguZKneIQlvo?=
 =?us-ascii?Q?gbytdRAFjSw3kgkdPULJ+x3xnNdva8PwPILKZvGU/Q3u9c8pQdeTNPBS6DJq?=
 =?us-ascii?Q?j9uJXerf5Zb/VdxWdvi08XYp3HwXng+VKapOuwW453UjFdEjqNOD89W93N4X?=
 =?us-ascii?Q?FtVlH2HrtYogUzrNQM2U3hD6pZmzUsuyHAap6L0q5Ob+XkAsGU3XBoFzTLXj?=
 =?us-ascii?Q?nkWWsS7+t3DFOS22Eq348ZvxgaJKOlURGe5XvD8HmYuduRI6fQS0/2b6C/tN?=
 =?us-ascii?Q?m5yq2NWr2GaEa7QlUyqWQwWM8+nGF6nTQKOs6ZObHS/edzc2V055icFKG+lk?=
 =?us-ascii?Q?oBeRb1IV1XDLkxJf/P0XP9sZMZT9UFEq4qySovUIt357JUD1LHYl68iwDpeC?=
 =?us-ascii?Q?jb5bA9wWCWK59byoWRa5qkEXIy1L54EwX0tS9Jhs7bxO/qdN4OfRDEsgYxXf?=
 =?us-ascii?Q?52Qdu/7nVF9Q32e7oBCsuXfxVF2Lg8E3xcWqBZBY0o18NEzOzhzztSmV5HF+?=
 =?us-ascii?Q?KEc4RGE6kuJTIjkRrIwwy/UcbTL82Pa3DocPEk/n6iqqyaJ6XRylyHSWcuwx?=
 =?us-ascii?Q?pjgyI5nv0ypfKc8kUZyM3Xf0h9tRIIf1awijfZFX74p73qQ+Fd7i4FHhqLwF?=
 =?us-ascii?Q?RPaXonLCHEuhzzBH/pSMn3H0PUhbv3+e1YHixHvmee1KFA9Vwqrhn/f6YBro?=
 =?us-ascii?Q?U7k5z1uTEib6U1TgEQOyNFwyEwj7eXxskBv5B0af7R5GPwH5J27DQokk68Aa?=
 =?us-ascii?Q?2Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b2fdd90-8e81-455c-a8b6-08dbc4f1b92e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 15:51:07.8556 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O7hzBEV03Qr9axChTuAc3LxYSI3UUYy74yVW6mzPMKjGYMfTPFH0ajUEQTODWzQ2ln7z/an9F9SFYk4LVv9FGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4687
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 0/3] Port CPU-GPU timestamp correlation to
 XE KMD
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
Cc: francois.dugast@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Oct 03, 2023 at 11:09:06AM -0700, Umesh Nerlige Ramappa wrote:
> This is a port of prior work from i915 to support fine-grained CPU-GPU
> timestamp correlation. Prior work is linked in this issue:
> https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/384
> 
> Mesa and Perfetto are the consumers for this and the issue documents the
> need for higher accuracy in correlation. 
> 
> v2:
> - Change commit headers to fixup!
> - Fix kernel-doc errors
> - Include review comments
> 
> v3:
> - s/rsvd/pad/ in struct drm_xe_engine_class_instance (Jose)
> - Initialize pad

Please do not push this series and sync with Francois. This should
be part of the big series that he is pushing soon. As soon as all
the UMDs are aligned there.

> 
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> 
> Umesh Nerlige Ramappa (3):
>   drm/xe: Fix array bounds check for queries
>   drm/xe: Set the correct type for xe_to_user_engine_class
>   drm/xe: Correlate engine and cpu timestamps with better accuracy
> 
>  drivers/gpu/drm/xe/xe_query.c | 147 +++++++++++++++++++++++++++++++++-
>  include/uapi/drm/xe_drm.h     | 104 ++++++++++++++++++------
>  2 files changed, 224 insertions(+), 27 deletions(-)
> 
> -- 
> 2.38.1
> 

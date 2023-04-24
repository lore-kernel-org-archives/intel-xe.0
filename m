Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD17C7618E
	for <intel-xe@archiver.kernel.org>; Mon, 24 Apr 2023 22:50:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33A5710E1F9;
	Mon, 24 Apr 2023 22:50:43 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6084410E1F9
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Apr 2023 22:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682376642; x=1713912642;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bWctiiKmfqJv/ClziqN863TkYg0GdqCfIXt5hV3sYdg=;
 b=j7KqP48PUskJwMR/iSY+jB9SOwYJMymFeiyK3LXIi3mCO4WKE4p0fvl3
 WETUm4GZDdQgWYhn14OymqPCcEcdSkN2PuyHZ4vBsvP8lKamwTRu4D7ey
 kNX9dT+zkZyjFwLGZBgbOvRMd1LN3avVic8CDzbU4pUMJQtNg+jqOzx6Y
 fA06U1sqDhiURMMy3CYRArpZHN2jCK2gxcTZUGEDYjT12OucRGhZc1L2b
 J64kCzXe9ptZI2wQpjln5lErA7kisQ7xAf48NDdrS6qcLAgfrHoqfgxqw
 34HJjOc3isxeDw85q7AGrzX6yWSLypJelNJ1hDXiIHWC8Cm5RCx4aVu0C w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="335485293"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="335485293"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 15:50:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="867653339"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="867653339"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP; 24 Apr 2023 15:50:41 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 24 Apr 2023 15:50:40 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 24 Apr 2023 15:50:40 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 24 Apr 2023 15:50:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TNZ3UogZWRfRXarX1rfIU6FZC+DS9IlfpxAT1SFKVAwpw5awwUMfCMhelBMpe2ZRkjgQaUMyqUEg8gz1J9V/J4UyBfa6sNWJfS4QWdq/ZCajisdUTZlkeUm37fzgDSfqaBcM+QSBiTgX6gOY4d7+WwXcDIWXqiMuiODIFPI8DjKJztvNdUp4HqrMXjkZh+HIL4kwQRRTm32tbXA/V1iyj/QDdYB9jiGf9HmsEfAsFC/eYSbwuDnjnkMvr6cJj6BI8L2wX1oOmHs+KGJIwM2vw9I65U24MZdXg1EcnVtvgJMmpwWDI+ke7yt+cHxKUQtScNIUKWVwFw1IaHW7yW3IIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3bTRP7OjKi7saV+GgpzCO359fVVvau+iYUPJrBmcKI8=;
 b=gZlikwflvAvCHyfNcG6Y073ysqM4pW/9X1u4yH8Zm32zt/IsTXsWfh5QT04PotT+ZLj/KNPSU7no1rsC7tfuTkizDAa1b8Nd+MK1XDDkb6ateXJhkKl8gJRLn5zQVREvwVAmTX+EH6V2riodSxM750orulNkXCG9KWO6F70jp/sXDUYBkEnsww0MhXePHQUXz5rB3ImPbYvvfQWaLUccTvYwaU2y5mN/qWxhrbjqu/t1GXwEOWyniOFRRfZDMnowAJLeBWubP+PNZUiOP5Z3RRnK109qX9cZw3zY+HBb74qG4iwaxGDQyW+MmbvfIoXpkaWa0f4Bb169bPtWoigdRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by MW4PR11MB6737.namprd11.prod.outlook.com (2603:10b6:303:20d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 22:50:38 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::e15f:6c7a:7fd1:d63a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::e15f:6c7a:7fd1:d63a%7]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 22:50:38 +0000
Date: Mon, 24 Apr 2023 15:50:34 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <rl4znzdiv3poheqpgfx4uvsdqqyg35fo2ydovy4jyu6y42smxw@fxffc223lmfl>
References: <20230421223258.128781-1-lucas.demarchi@intel.com>
 <20230421223258.128781-17-lucas.demarchi@intel.com>
 <20230424212052.GE10045@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230424212052.GE10045@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR03CA0289.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::24) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|MW4PR11MB6737:EE_
X-MS-Office365-Filtering-Correlation-Id: 608a21d3-8910-4dfc-2ea4-08db4516521b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QdOrH8YeRzz7gOhgyz5qXayMTcj1Bljr9Wx0JI/mhT8+klOk8e+vPzD3S96wswywisiBahjKswHw2T60tC6NeDsLj9wd1vAbF+UfGPgh3xmGyZvmmSpX9UWkKy0jxh2deS3Frl9zEEh/MjemSMmauaPtT/+zP5VGvmOlOR4LyT/lMUM7kW3FlXq72nWF6PF1TrOwKLxt2y63LIUTe0L0ms3v3noPpxoncSOpZaXVeNZXFtOZnf7cn30m52ZtBw7YZZU7iAUO7lCN0sc64yZjMDKlfbnWLr4oIFvMpd6naOcV1L7cy1gJQN90AKrykW0OuJAmsE65wTAhDOePWXooMni0PCK/DVPjr3GdLq+VrRGoBIzRKMjUhxv27RibVffQMVMYAzb9YiLUD0DgYK1RDdvDc2UO1Rfo9Q3tAZWhXe8DkOfXauOb5u9EvCah4xl2Yh+9cNaq9n9ogbnHYrqGi6DJjP/oGRpi2vCNzVrei5RJWIa3dOf6fOlScmc6m3Z8rq1uOSLV619f4gLHi0bES3Ekr9f6QNFF7XiCdRd3fFmoxMkXCREUWfOsLB5pAsjD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(396003)(366004)(136003)(376002)(346002)(451199021)(9686003)(6506007)(26005)(6512007)(83380400001)(33716001)(186003)(82960400001)(38100700002)(66946007)(478600001)(86362001)(66556008)(66476007)(8676002)(6862004)(8936002)(6636002)(54906003)(5660300002)(6486002)(41300700001)(2906002)(4326008)(6666004)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NDqXsf6Qzi8BtUa4z76GMNuT95tCvSkgLp3H6NDBQWmYr9evPgVrT4H/7Htc?=
 =?us-ascii?Q?YtmVqp0Lej9HQUMGkzKuJEup6J3tDULCMNWsZG+ey5r3RitcdiVXvrFykOXj?=
 =?us-ascii?Q?cSca0drnXd3NzcocpB6JfiUDVnBL3mY4eMzOCtrOmx5815lPwgbRNqHtleMg?=
 =?us-ascii?Q?Neuh+a3xIo+0ioIZgBNy0RqeLaSprrU0LoU5Zv5v3JHVLFNPvcMC7Mrzqdwn?=
 =?us-ascii?Q?eQVjPeWYjHPV8iTAEC7rX0ajIpdkHzGZiaeY/3+/ZDrO4qpTtiEZlsSOp3Sx?=
 =?us-ascii?Q?Y9tspZfxMU+h0li1vJ3Fe0sM2vrntNeBK+qCdZgrKbOg4Fh7LBgqJt4ITJ3u?=
 =?us-ascii?Q?Wg0lC+LRZX4b8x0aKdqQ8JKDMdUtC+KSEjaUUi3z+bZG74PYgvXlAZcbcj+d?=
 =?us-ascii?Q?gNV4ghMdHgNaln7HWQFIvviaDrlHZNgl4x8AhKB77d1ie5iDRYJXIQvcFGB2?=
 =?us-ascii?Q?/K/cQ7Vtfx8zbBOyaYR9gHfqZ3ktgtUgBgh9HWM7pnrlSqx6BUNnAjlkPLVp?=
 =?us-ascii?Q?A7zC0KcHaqpuY+QHOjnE4BTRjv9akFNlmRwgoCsun+gzmX5RCjsTqUaKhpMQ?=
 =?us-ascii?Q?DMwrGkMwehBmMufulSQT2TAPzLAKqn9yV689IXnBTHRk+6pV4ujsWatmw8NQ?=
 =?us-ascii?Q?CmS/szHFWD+Z2BjTMtZGQ3/pZTMqJNSWql2UW5EXCKJbjHZYVMAlDvV30HJS?=
 =?us-ascii?Q?KyM/c4gssYakXLDB7d8yYPf21c22B6+5RQI40h0dtB8UWjQUzGILQ8/u3HRB?=
 =?us-ascii?Q?Y5EPThUS93udT4VkoP1SHmvMfHJxTJrcMTNQug0khQ+OxlZrAXcy8RcSL6dY?=
 =?us-ascii?Q?R9GqvaThK0gXKD0YgNRmnkzJ/3B/CSehWXI986nTtrETRn0TQl+bOdVczG1Z?=
 =?us-ascii?Q?WlAvprtPo4sPXuQ9CUAptw4MUCrFoU+ZlWT/yOTnzKrAOj4JZJnNfhQi8Z1V?=
 =?us-ascii?Q?/tmxz30tyZnSsu4a6O3dNoIJkEp9GgtoIzHV+7Oqzpnse+VCiDDMWQhwdXMc?=
 =?us-ascii?Q?M6mGdCFIN6BgPOOtHva72TrtJaqIvcc1EeY3BHc4mly3usPGPFp8G+3tZI/T?=
 =?us-ascii?Q?SfAqOZKhNJz17LX37gUgx1DfW5LxkoZ//2+EjPShTLLVgn3UdlmdE2vgWIZY?=
 =?us-ascii?Q?tZZ78FVEwRB6vwLxaJF9uldxRVXxQbPoG/ZVI7Y7soI6iriSns4Q0t4WVoRw?=
 =?us-ascii?Q?ac/hUBfmcQHgr44cyOh6pmFt3Bh81SojPkDgIt9+zTtEHYAS0eW1lW1TJMTj?=
 =?us-ascii?Q?xeGHeAMys3AL7mu8gNNcME1lwNJofLVSXXZnqoWRreKq98eY0YH4XFwLlE8R?=
 =?us-ascii?Q?GQIdxSP2Nv0IN1rW+f5c3G2SpAsGSWlrV9gSq7HUtUGGy/HAIl03usu8F4F+?=
 =?us-ascii?Q?h0BhVxhiedU+ysnfQbkW8Zbl6YuICAX9VFAXwVt4OlxAKMMire75w8v3nXwR?=
 =?us-ascii?Q?3h6iR8BXZoLArG160gl03fBGrV6Xk02ADVQLQwzLAhoTmNQztzT/WyNbiBP3?=
 =?us-ascii?Q?srpNHLh04wr9UcJTiZrRx6bWnH1fFbGyahtOSNXks4Qxj5Rzlc3tUdjukdPN?=
 =?us-ascii?Q?aj45wSqnNjrl8iwWHzNjonpan8O2l2Cv2qWwf5vurfPwvJiWJG3JJT0Lj2l3?=
 =?us-ascii?Q?+Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 608a21d3-8910-4dfc-2ea4-08db4516521b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 22:50:38.2450 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LuXGiGsW9d+0c6eTsa9aKLJX3s++eV4od3QumbKMdOCcCQoTUk8f1OJxcvsld6ftCg2kmVnXFBxaa4ewz3QvE093ev9Hq8T9VRxoAwVmD5M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6737
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 16/17] drm/xe: Plumb xe_reg_t into WAs, rtp,
 etc
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Apr 24, 2023 at 02:20:52PM -0700, Matt Roper wrote:
>On Fri, Apr 21, 2023 at 03:32:57PM -0700, Lucas De Marchi wrote:
>> Now that xe_reg_t is a type that can be used by xe, convert the rest of
>> the driver to use it:
>
>s/the rest of the driver/more of the driver/
>
>We still need to fix xe_mmio_*() to take this type instead of a u32
>before we consider the conversion "done."  I assume that's coming in
>another series after this one?

My plan was to convert xe_mmio_* on a follow up, but then when I
finished this series I noticed the one thing noted in the commit that introduced
xe_reg/xe_reg_mcr: now the latter doesn't have a .reg field anymore, so passing
a mcr reg to xe_mmio_* already breaks the build

That left me wondering if we just go ahead and do the conversion to
avoid the uses of THIS_REG.reg or just leave it as is. More from IRC:

<demarchi> mattrope: rodrigovivi jani next version of my register cleanup
series will retain the strong type for mcr. I also found a way to make calls to
xe_mmio_*(gt, FOO.reg) error out, even if xe_mmio* only receives a u32, not a
xe_reg

<demarchi> so... the incentive to make xe_mmio receive xe_reg rather than u32
is actually smaller. I want to do a s/.reg/.addr/  in the xe_reg struct... but
if we are going to end up converting xe_mmio_* to xe_reg (even with the smaller
incentive now), then maybe I should wait for that?

<demarchi> thoughts?

<demarchi> to see what I'm talking about:
`git grep -e "\\.reg[^_s]" -- drivers/gpu/drm/xe`  (with a few false positives)

<rodrigovivi> I honestly don't have strong preferences there... as long as we
get rid of the 'i915_reg_t' there I'm good... and a bonus if we combine the
mcr...

Lucas De Marchi

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD7CCEB64D9
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jun 2023 15:51:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72EF010E076;
	Tue, 27 Jun 2023 15:51:19 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6953310E076
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jun 2023 15:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687881078; x=1719417078;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=a6dukEpxsCzNVNNzS7Xa2z3Lz1HhfAdvem8WTBKY6JE=;
 b=OtjFoyjI0ijOtqw2eGmwXV/B6KAprQ+vCfgSHRUjzA4PcGAhUxLjpYAf
 Y5ySdDO0HxEWnIWVBVVkb/UXDhXZuizvU8Me61HeYeUasEYUg4oNm2zQp
 qlMZLTJcaoCXUtpuBMyUPhGjjLqc/BFae2Gerj74JnKafm5sc6fSc9Rr6
 owSqnJaF/spEizhUqqTKB2zFjj3ACxxIypv8jGr5LPYuA3/r1pRChq9vt
 80Q2BwHYYH6Ju/Mt4PJSe35UXX1iMEYQu66ytwDoDHw2wGw37ffnnUZ76
 XHvpgcESFoKIClBuxY2NMJOiXDR1KpyoGy3GZHfNQM859fcc7qv7xEkZx w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="359100227"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="359100227"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 08:51:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="781910252"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="781910252"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP; 27 Jun 2023 08:51:16 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 27 Jun 2023 08:51:16 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 27 Jun 2023 08:51:16 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 27 Jun 2023 08:51:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CfBFFeyKRgRmR/qywRxf6EAAh8lurMslpHXBoKyM8x2hyLEsIg/BkLDiqaZ3a9Wl23hqGQOB8nHbWPNxE3Im5dPb0+SKDrdfI4o3MFDjoDMlpO+8ujiaCZlQU6FicVAEtwxs1fKT8wvYOO6ASEPGBnjQpOUjW98PFlbbwluWsiDG06OfiuasV42XEGKh3p9wTV5oRJJsCvWNcDhBzDkzsLtoYgsv1xLhi3mwnNFw2xEmaKCg/oQqd1sRwXqmQOiYeecA9vfQu2KgWDiwL/ZQEPZ8JDlysjZbtt6hIYD8BF//lSVpyleLzJeY7b+TleJU6hcjX4YVbhme8t6Jwn4MHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KwmMYZrZO+9RgKWCq3IcmM8pNDv9ATJAEj9jaXbIIOs=;
 b=ZecsB5EjAcEhh2gnHVNH+NQ+taAw20DbQdiF5yvWk6o/FhyiL8UHgMHmP1mvyy2yLze7/wkL4KImiYH/+phJRN5F95iiLaCmKR5KtwbSBfBaDR8Cq9QNRoM162A8WN5q69z47dr8YVKcAEgKFmoj36uMBJNNydZRqK/9s+y6pSeeihobwHJse4Sd2r5tk/1JQnE+gMzLgTHv/2o82Vzb68Z7iyxzRKfCh6OdspTJhXuc/50tb/ydSxbOW/v6NTRUscH3L566Z44M0DL8RoAt3ppGrVdSypWDVV7EE2d35KR0BN7q22QelavL1nWrVC4V+JAr9smKbvbBTJ+zDEL1Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB6309.namprd11.prod.outlook.com (2603:10b6:8:a8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Tue, 27 Jun
 2023 15:51:13 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%7]) with mapi id 15.20.6521.023; Tue, 27 Jun 2023
 15:51:13 +0000
Date: Tue, 27 Jun 2023 12:51:09 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Message-ID: <daevz6hon5xabm72wzyw3ztzihtdrveaxehe5bdgoo5qacd5dm@xfu24obyt4ev>
References: <20230627102223.260893-1-jani.nikula@intel.com>
 <168786504446.2457.9445918478693831865@emeril.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <168786504446.2457.9445918478693831865@emeril.freedesktop.org>
X-ClientProxiedBy: SJ0PR03CA0255.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB6309:EE_
X-MS-Office365-Filtering-Correlation-Id: 6109cc6d-be1a-4a97-ced2-08db772655d8
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nqnT6BBB2B8jn2v1rNeK152cV1/qKdAzRnhmo3Row6csY5T4VHkUd9niMw2FZ0p/MbHvSalUjuWRZMxM5h/K0SA2+HL8vfk9tiXJ1tvCuw5la79A0NCKHYuDY6+e+HcLDQxu4Q2cdRUYy0mGJeWNcCh3jvK+l/xAjbPpoOByNm/7p8Q5VNoyrMLESJtcRUL1F1WGhDTNHkQXLA3qVxUjqyNkChWP8cOXo8qast+mgsplHVnm8lnxnhRuZUl5prlHiA9skhX+OxzhvjrX90DeObq5HxLXF7LivdTb2/nz8hggDQNr0z3oulMTEIIwaEjXxQH4YT9kN7+P+qWGTum0xiKQJVcpVyNXh2gWBeFhCYlgyz4u4WtLE5h9ZTiMcxUOViT3hJLMovWMiW4Pxg1VEizwS4YUPw5zkGR9bTA1xfBgvMicq1eT02EGnH6OGKrN2mLyvxC5LjdB9mkFwSNk13FGSQOq5vbm13RTxwMhzgLTO2GMoJQZaT5AMGcpmcM/ClH3LJGnyxv+FlN1Zdym4pckwGCXoEsVIInYF3uwiWyPrMNEWnUNoWBq2n7N+RTGd1nrdfX0Ajq/ehGFbPTbrg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(136003)(346002)(39860400002)(396003)(376002)(451199021)(186003)(2906002)(5660300002)(66476007)(33716001)(82960400001)(6666004)(6916009)(316002)(966005)(6486002)(86362001)(4326008)(478600001)(107886003)(38100700002)(9686003)(66946007)(41300700001)(8936002)(66556008)(6512007)(83380400001)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5o3ApI5QFH1BrJRWc5Owl2aMTMFgwOV29po3JCpb5y2cjxwuVAIcxv4QApaP?=
 =?us-ascii?Q?QItLAHWwnJPXtd6uTiUXK12m7HuIT7XBO0PcDEiRUzk7FTj57CD2PeZ/A4fu?=
 =?us-ascii?Q?Tu/DL9bycPIgnudTVdxX1o62e0hM4qP3rThG6vh4K5REHScRiFB4nJbmD8A+?=
 =?us-ascii?Q?J3YGFCHsYRtnl0dNySSQHPSYrbAy+ingriWIZYYcHvRKzLjV02rn2xlZZ96X?=
 =?us-ascii?Q?EBgo+6yPkdXQzXx4a1FrynQPtd9v3CDIt2Df/9OjVeCPSJS6NH3Lv5sKA7ZR?=
 =?us-ascii?Q?/GtcFwyVz8d1W7LVSdAkDkhsny5PvcBSqWg8m6+UpSe+CA2tRlhy/D2aloC6?=
 =?us-ascii?Q?Prt/msBhqS3jMs3TwUJf//R+fc9Vf6b0uq2jsuuR3ZVN9SWaBAJY7i1XO+B8?=
 =?us-ascii?Q?LQ87RPDXxRv/ih34ALeHdtZKLFiPI5hFq2wmeCDj/FpCvM4OVIygySjE0T+I?=
 =?us-ascii?Q?M26uNM5CI8uPPxYv3XYOXFxrOwrrGt0IGQmhF/JxkMVLauSqAOXsrhvoNgXJ?=
 =?us-ascii?Q?3WuTPqygN8WBk7ENbTQQTvVcicOKhYjv6xAaNsV0wSjONpzHWl0vLNOMxs2D?=
 =?us-ascii?Q?bbWXQkbx30twrN/G+FdlE8oWwe9UgLS3/OkDaBe9eHoBgX40hnug1YIWkuq7?=
 =?us-ascii?Q?9EkE9bbwPhum1ddTEadcqL3qmzRH2osERu7mwrR7LbnSWO/hHvvrsfQaVMFA?=
 =?us-ascii?Q?zSd/TXHslLfM9MnBlp1dw4mC4IcCdo+odHW5EXI1xBjy98RWU+u2xZDTpdma?=
 =?us-ascii?Q?J3otaCFOba9YFQdCRPINmkBVyxJUhIEk6m8vkMLSRn8/nwRg9V9Dir7GMZVh?=
 =?us-ascii?Q?Y/jgXoH9Zlp1Letl2z0u8U7jUmmMGkpNBTrAzunvC57wDyMZfeIUvCwMqMH2?=
 =?us-ascii?Q?/1PlulfD1tio4z1dUMuZn/Bi6LGDzvRW/cjwzoDG9aFKbB3Cbtmj+jvQ+2RJ?=
 =?us-ascii?Q?2arlvMSmLmAccGOaS1ba8H08VCEERbagaMb/MlGzAoWv0DXebs9PYac9agyt?=
 =?us-ascii?Q?QTMdd/C17RYDai3AEyZWhsWsP0/l2eZeYUApq7/pZsvcKa2n9c9VW4qcI8IN?=
 =?us-ascii?Q?kxPIDMBmLjG2pJe95GKzOp4PG9sAQVLx/ytTuOoW8b2F/NTwTGqI68iDI/7p?=
 =?us-ascii?Q?kC1HBe37XeNmkEEFLRZPdfsFlnc+HjEWKyyQM4xVlH/amg4TDZHIFCObDBDJ?=
 =?us-ascii?Q?a4Jlor2mWRsH3SSrjKlVmz0mgpuzFPVPqRNoqP7Xy+kVSOHX2/jW2vCF1umD?=
 =?us-ascii?Q?3fAw476/LYj7AM/uN9K6wjS75d8ErUIkGGExFLuXQ7tEIi58odXj1N+QVfoX?=
 =?us-ascii?Q?4UxxU6MfbJmk39Sg0UUUADQRoM09EYAEQDeWc7thqjgjBwhcTOcP87Oe2+5q?=
 =?us-ascii?Q?OH8Jp0DwsajFLciZp+6FzlQrZWopf47IoHdk0E/63YXPTvlRSGWfofkGq79X?=
 =?us-ascii?Q?Rj80IRLvF1HxPkdzcxxy6LbiXBr3IB1MnLtguQLs5NPT6jTSbeaxKxkMjIZF?=
 =?us-ascii?Q?xvbbvz944Y8E+HZFoDFERicGd7mSyFHyImqtywYvsQ09TGLlavz4j4/HJpAf?=
 =?us-ascii?Q?6f1SBebPy4asxxiZQCGpDWm8i2dXlYB3lnfq46AxJeRfY8+iBVnQcKvjKO/d?=
 =?us-ascii?Q?LBi5O5WCJ6XxrywQz4pSAxMoPtWY05ms7nRwm3cQd43+4U+hRHGa53GUcsGb?=
 =?us-ascii?Q?+B77ZQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6109cc6d-be1a-4a97-ced2-08db772655d8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2023 15:51:13.7597 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q8ojnGwF+0c/2Qa3mDS/BIQZw2dJ05aL7RnDDVN6hrBiCv0kUmgg2gECIoLCv2IuXp7yVpJaOOrK5yeCpSlDvN1/Me4UnQyGE1BWJeJrh6c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6309
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] 
 =?utf-8?q?=E2=9C=97_CI=2Echecksparse=3A__warning_for_?=
 =?utf-8?q?xe_=26_i915_display_integration=2C_display_irqs?=
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
Cc: Jani Nikula <jani.nikula@intel.com>, ryszard.knop@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jun 27, 2023 at 11:24:04AM -0000, Patchwork wrote:
>== Series Details ==
>
>Series: xe & i915 display integration, display irqs
>URL   : https://patchwork.freedesktop.org/series/119909/
>State : warning
>
>== Summary ==
>
>+ trap cleanup EXIT
>+ KERNEL=/kernel
>+ MT=/root/linux/maintainer-tools
>+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools /root/linux/maintainer-tools
>Cloning into '/root/linux/maintainer-tools'...
>warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/

is the warning because of this redirect?

Lucas De Marchi

>+ make -C /root/linux/maintainer-tools
>make: Entering directory '/root/linux/maintainer-tools'
>cc -O2 -g -Wextra -o remap-log remap-log.c
>make: Leaving directory '/root/linux/maintainer-tools'
>+ cd /kernel
>+ git config --global --add safe.directory /kernel
>+ /root/linux/maintainer-tools/dim sparse --fast f135580b567158b23349db5544259730dfb91e78
>Sparse version: 0.6.1 (Ubuntu: 0.6.1-2build1)
>Fast mode used, each commit won't be checked separately.
>+ cleanup
>++ stat -c %u:%g /kernel
>+ chown -R 1003:1003 /kernel
>
>

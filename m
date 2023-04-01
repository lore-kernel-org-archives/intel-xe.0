Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B52C6FD1D
	for <intel-xe@archiver.kernel.org>; Sat,  1 Apr 2023 08:59:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB69810E03E;
	Sat,  1 Apr 2023 08:59:41 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94C9010E080
 for <intel-xe@lists.freedesktop.org>; Sat,  1 Apr 2023 08:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680339578; x=1711875578;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=08hHCJwEJNP1nMHPRl8Cc/XxeML/U9ZOJUJ7wEofaEg=;
 b=fOTnDvwqIS9b4m7Ls/T0EPZzJm+5ZrYCIXOVd67OFkohZpE6erU3c2aY
 aD7Ebihj2XySvtHPFm0jsQhXHFG6ELsJBwObuaIBAPR55n/SRAkQgpm2c
 TKureUn38pV6VPRcbcXK+33GcUojMAwa39XBJaC9c85uvtW1eAB58dU+q
 vmKZ+R9nHMgO4VxdnegZ0Q7Lk0Qarc/Aru+ds/JiKBby/VaSg7O2Nk8D9
 AC+PBQGH9H8L9/nca2KA7ZxdfpTAnqTKjmp7JyT3Agm3u5YqFJ7gfcyaA
 Hj7qcG6jxRRmTP1NJgB/8lbvkVJrlbXD0MPP0VcI9bqZrzvLr++yCq8Zo A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="321286703"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; d="scan'208";a="321286703"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2023 01:59:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="662654423"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; d="scan'208";a="662654423"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 01 Apr 2023 01:59:37 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Sat, 1 Apr 2023 01:59:37 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Sat, 1 Apr 2023 01:59:37 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Sat, 1 Apr 2023 01:59:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O8L+iZRo3AxeWUEY0Zmzz89lOYUj8tsP6yv+8l3ysHe/stDt/MseNSGT/n6IDZnavnxgN1x95Z1MaVsfV/lyWcPukPdTHYrEWiz8Ca0CNCogxCChdz9IpWBJLqg2VldstY5LeqRuL6K+QRms8IErl00Zd/AxbElcnZWgCv/CLKEn80kj0Hx2Q7JpfrSglTt3+Vc0w2agR8HwQdkyDJC+dlMjtu36DIG3Ki64F7Oat/YUkDYpynq4jPVh6k8QANqlcgKF9YtvoNgv9icMfffqEltMboMQSppEMIi/Ywt58k54j29jgqflcrQ3P1/PEEC6tpIkP+vHJMvNYwoGZf8znw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZOddVIrEHW+FrisJ5ZehIgFe60JbH0t2agRHxR0y0IU=;
 b=oWOLnu3swB7VX0E0eK/KYXWm1VjOcIoMeSO54wG/P9oeAwaEBVtesUVG7fsW+alGQkDPkqhAU0ubulIePriBPrre4mU9LIYNFwJCYLgY5yVOtTYe1PXcshsdpB9qUN3I48gLvXIzlR7pzliU6NuTO/B5IHyYUmZClD/PMrQ15Ueh9DU0TleVcpL/0E0InluqNkImezNLRuEUKhuIqAzKk6oDx0ccUcZTU8BcdOBS4GMpbUVivPdnr4L9pXsQFL2wUe+PZCLQ7iSA2T7MsjuGdZ+83PXvbPnjjbyj7E/PePFkPyIR1y7zv4K6/EqRzp5t20vMCziRokq3eULAYHnb4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN0PR11MB6279.namprd11.prod.outlook.com (2603:10b6:208:3c1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.26; Sat, 1 Apr
 2023 08:59:34 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%5]) with mapi id 15.20.6254.022; Sat, 1 Apr 2023
 08:59:34 +0000
Date: Sat, 1 Apr 2023 01:59:32 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal@hardline.pl>
Message-ID: <20230401085932.g6d3zn5th64hxdya@ldmartin-desk2.lan>
References: <20230321220527.595462-1-lucas.demarchi@intel.com>
 <20230321220527.595462-2-lucas.demarchi@intel.com>
 <adnojpupaqnivif7aqblxkuiwyiexskk4h3b36bsktbpifoip3@b7xazecr7exv>
 <20230331134334.x5u5ixt7nnr666mc@ldmartin-desk2>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230331134334.x5u5ixt7nnr666mc@ldmartin-desk2>
X-ClientProxiedBy: SJ0PR13CA0102.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN0PR11MB6279:EE_
X-MS-Office365-Filtering-Correlation-Id: 7678c1dc-819c-475c-040d-08db328f6a08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aoUDgzwKjihlP5qhlaAcKzMdP8f7L7aUVx7vxF34Jzq6UWg+L4j4IH9x6blWDhNt2VJqYIWeQr3KmalwrQPuS/whW5OVWH/gJ+bvC6m1iuN4jH/g3M+ISD6npMBEesrhdjwBK0p4I+BYDvw3DioCt2cDDoS4ISSRrNd0zwSZP4CvdNGIbHa89hG8eQ317YRzYq9RTsbXpTy5+DJLCO0jtYl9W7TcZwlnz8J6R1fWyoK29cS/RAdvQRTSxKH2I1uJ592iUdBMHouzylO0rSiLmUNVxt0R3/1h8rfOSDoRNlExnEw7ASXEazZWDKwcxAKrxNp8oz3xSXtbxLzNCC+isylFESgujUNNFhP2v7WRaS+fgYkP6Cj/MnKf11IGfybnZLIxFoJWpC8Qdjl6BY809zcCWlJocrihwC+Tu3T8l2z7iHojLWV6WmFpuGBvk8DqKE4xy/esM2amEFrvcX20Wf23KPALKr08TltAKnzMXWpl4DVBHsc17vmi8UwdfGp9assHJ59Y/aFnmRGitMVF9JEXJXq+4AB6n8hfY0k89uMnZ8EAlMtuTdknkES0XJG2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(136003)(39860400002)(376002)(346002)(451199021)(4326008)(66946007)(66556008)(66476007)(316002)(38100700002)(5660300002)(82960400001)(41300700001)(6916009)(8676002)(8936002)(186003)(83380400001)(478600001)(6486002)(107886003)(9686003)(6512007)(6506007)(26005)(1076003)(86362001)(36756003)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGovbU9jRXJFTm56QmJHWUlRMko3UTZHMkhSZndTbHd2b2MyRWdsRldXZzRP?=
 =?utf-8?B?SGsxVWxkc2FrWVdyV1RXdnpwMndJeXJyODU4ZmlaQTlQNUJvT3FndEFDcGJW?=
 =?utf-8?B?WWthUGJVZlhhTktQTGpRdUQwZDRCNXZOekZPaFk1dFA2UytTNEtEUTZjbVl3?=
 =?utf-8?B?Ti9ibXFmSHo5R2UzWFdkOTN1RmExZFF0UmZiL2NuOGRzdXh2bUl3bWNMZ0hh?=
 =?utf-8?B?TWFJbzhsNHNxZ1REa0h6VWpFcEVLT0tVYjNudXRZSDlVK0ZBaVRWanFudnZr?=
 =?utf-8?B?dENpaDlmRGp0SWdpVFVtYlluaEJxRnllNXlXN1pOQUlGZXdBSFRhTzQ3Qi9G?=
 =?utf-8?B?TTV3WitPeVFpTDFSVkh6VFA1QndMVG9MaTZsNVdlcjZZdEl2U3ZFRHROa3Yx?=
 =?utf-8?B?S1R4OFFxc3doZTZncEtYeDhZSnZzbThseXI1cnJmRTViOHUzVUJycmZwVXhV?=
 =?utf-8?B?L3dTVURjTk9IaVZ6bGRCUjdsUHZNUWRxVUF2b2FTWkVvTHFVa1BuVWtFdjI2?=
 =?utf-8?B?QTdCRHZ1U3VUM042SUZCcXhUcmQ2U1ZwOEJPbnZVWld2MkJQZ1ZrRHlTT3pZ?=
 =?utf-8?B?U1pFS29IMklHbG0reGhVRGtNcGtvZFpEdlFFSmVaN2srTHBEb3l4VW5EbWE5?=
 =?utf-8?B?YWhxZzl2dVU5R2hGSFpnZzYxVk9DTkpHcXJnazdTTWd1bjVvZGliblJMZW0r?=
 =?utf-8?B?bXEwdWNBMXBJVGVXRkVFMTlQck4wc2xEOE9Qam9TVmIxM0o3WFI2QS9JbkN6?=
 =?utf-8?B?akR4UGY0eFd5ZUxCdWVOQWNISytKRXlkMkVVS1YzM3EycG1zT3p5cFIzeEdO?=
 =?utf-8?B?YVZ2MDU4QXpLamE2eEFEU2E4VXFIN1N6OTNVZ3ZiT0dqbjNiajBQaEVoUHlI?=
 =?utf-8?B?RzVpRXN3a01NbENRZ2IvSWhoZWhtMmtscWR5bStoR0V4SzhtU1doZXp1ZVdz?=
 =?utf-8?B?SzhUeEovYWh3aitKT3B2VVorRElIZWRaM2VGbnBUa3FTQkhJdTU3ZmZhZEJh?=
 =?utf-8?B?V2ZIM09BYlg0NmZGeWJucjlTVTdpNE9IM2ZKOUMwNGsyQytWQTZub2V0di85?=
 =?utf-8?B?R21mWTUxSFBCVEppT1lwdk9qTkU5dVVsbS9rQ2N3QVpvaXdQWFFFMStTdXVL?=
 =?utf-8?B?OVI1WUtXcS9VZ0NyRW0wby9sR3FKWEZTdS9DTUFLWWJ5Z2tSeTZQWk8vTSts?=
 =?utf-8?B?MXFhZDhMcWZvQWdNV095MWRzeDFMZ3dJaEVQcVR1N0FTeFE4am1naFZlVnJW?=
 =?utf-8?B?dXZWbmpveUE1THZDbktVcVBXSENBejJyWDU0R2xKV3hCYlE1Qzg0Rk83cjJ0?=
 =?utf-8?B?TzdOQ0NkOHpnMGFZNEdjbXlZOWFJZnovMDltcFFTdkN2QkZmNXlPWkpmVzZH?=
 =?utf-8?B?VjFMSno4cTA3em9HejBqMzBURG43Tkh4TE0yRitFbWt2ZnY2c2tCbndDMVMr?=
 =?utf-8?B?WnVXYnVib0JiRG1MT3ZubzY2QUdnY2h2eTZFc2g2RWNYRG4yU1I2QmZMRE1r?=
 =?utf-8?B?WjQ3aEtrdC9vZUVRUGJmRlJZMmFNblFiYm1vaEZ3RE45OHpZaVVxNStMUHVF?=
 =?utf-8?B?TXY0djRiWDhLSzI2V0hQY2ZsTnJOeWJEaWxid2ZSdllObEEwOG16citQRXZh?=
 =?utf-8?B?aEliM1RDRTJjYjZGQXBOKy91a1c3aEsxVlp1S3JkMlVMZlFuVyt0QzdhaTNB?=
 =?utf-8?B?aEp4dXl0RmVla3p2OXlrQ1BmTnlFR2lPWmhlTWtURm9kS283ZTZPNURGUjRn?=
 =?utf-8?B?cUxONHZjbDlWbkJIOXdmdkRQQ0t1ZmQvUnJ1YmVkdlNqYy9xdWJ5NldXQWFT?=
 =?utf-8?B?dGRadUd2VTZBMTlQN0s1OEpHQWNib2tQbndZNWZmWm5vKytUQnU2SE05ZVc1?=
 =?utf-8?B?MDdFL1BSY0o2U2puVDhXUDJUNTJHOXFyaTl5YnVIa3lCdHREaHZkVmdaMHdt?=
 =?utf-8?B?UmpkdzFUL0grSUxlWlFqUm9GVWFOOEpCZTVQYnB0RkFpZlBSUTJBMXJDVWN5?=
 =?utf-8?B?d0tMSTBPM0h6LzBldUw4TzNBR1dQQ3NORVhiTFB4TWxNeFkvalIzaG1FaWFD?=
 =?utf-8?B?aWxxbFF0OXp6LzRaR2kxejdZbVIzbi9NZ1J1NWUwT2tEOFpBWkdIZjlOd3Nr?=
 =?utf-8?B?YnhycG9ESEpiYlU3aHUzQVBNL2syTUJKVXJCcTRueUNBamhZbFZrWXd3U3ph?=
 =?utf-8?B?aGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7678c1dc-819c-475c-040d-08db328f6a08
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2023 08:59:34.5858 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u6/xiMXnC5QJzRyk/MJ+HRDu8Kcje1rw8jU3y3ZkeGNOAflMZDWYzUfLaTWt4RYAClLa8qiBQogIqaBP8MFlDbitzSr/c94LAVQO5iRfmGs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6279
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/7] drm/xe: Add basic unit tests for rtp
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
Cc: intel-xe@lists.freedesktop.org, maarten.lankhorst@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Mar 31, 2023 at 07:43:34AM -0600, Lucas De Marchi wrote:
>On Mon, Mar 27, 2023 at 07:56:01PM +0200, Michał Winiarski wrote:
>>On Tue, Mar 21, 2023 at 03:05:21PM -0700, Lucas De Marchi wrote:
>>>Add some basic unit tests for rtp. This is intended to prove the
>>>functionality of the rtp itself, like coalescing entries, rejecting
>>>non-disjoint values, etc.
>>>
>>>Contrary to the other tests in xe, this is a unit test to test the
>>>sw-side only, so it can be executed on any machine - it doesn't interact
>>>with the real hardware. For that a mock was provided with the minimum
>>>initialization needed. Running it produces the following output:
>>>
>>>	$ ./tools/testing/kunit/kunit.py run --raw_output  \
>>>		--kunitconfig drivers/gpu/drm/xe/.kunitconfig xe_rtp
>>>	...
>>>	[13:46:14] Starting KUnit Kernel (1/1)...
>>>	KTAP version 1
>>>	1..1
>>>	    KTAP version 1
>>>	    # Subtest: xe_rtp
>>>	    1..3
>>>	    ok 1 xe_rtp_process_basic
>>>	[drm:xe_reg_sr_add] *ERROR* Discarding save-restore reg 0001 (clear: 00000001, set: 00000001, masked: no): ret=-22
>>>	[drm:xe_reg_sr_add] *ERROR* Discarding save-restore reg 0001 (clear: 00000003, set: 00000003, masked: no): ret=-22
>>>	    ok 2 xe_rtp_process_dup
>>>	[drm:xe_reg_sr_add] *ERROR* Discarding save-restore reg 0001 (clear: 00000001, set: 00000001, masked: no): ret=-22
>>>	[drm:xe_reg_sr_add] *ERROR* Discarding save-restore reg 0001 (clear: 00000003, set: 00000003, masked: no): ret=-22
>>>	    ok 3 xe_rtp_process_incompat_types
>>>	# xe_rtp: pass:3 fail:0 skip:0 total:3
>>>	# Totals: pass:3 fail:0 skip:0 total:3
>>>	ok 1 xe_rtp
>>>	[13:46:14] Elapsed time: 6.800s total, 0.002s configuring, 6.682s building, 0.073s running
>>>
>>>Note that the ERRORs in the kernel log are expected since it's testing
>>>non-disjoint or incompatible entries.
>>>
>>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>>Reviewed-by: Maarten Lankhorst<maarten.lankhorst@linux.intel.com>
>>>---
>>> drivers/gpu/drm/xe/Kconfig.debug       |   1 +
>>> drivers/gpu/drm/xe/tests/Makefile      |   7 +-
>>> drivers/gpu/drm/xe/tests/xe_rtp.c      | 201 +++++++++++++++++++++++++
>>> drivers/gpu/drm/xe/tests/xe_rtp_test.c |  64 ++++++++
>>> drivers/gpu/drm/xe/tests/xe_rtp_test.h |  15 ++
>>> drivers/gpu/drm/xe/xe_rtp.c            |   4 +
>>> 6 files changed, 290 insertions(+), 2 deletions(-)
>>> create mode 100644 drivers/gpu/drm/xe/tests/xe_rtp.c
>>> create mode 100644 drivers/gpu/drm/xe/tests/xe_rtp_test.c
>>> create mode 100644 drivers/gpu/drm/xe/tests/xe_rtp_test.h
>>>
>>>diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
>>>index 93b284cdd0a2..11bb13c73e7b 100644
>>>--- a/drivers/gpu/drm/xe/Kconfig.debug
>>>+++ b/drivers/gpu/drm/xe/Kconfig.debug
>>>@@ -66,6 +66,7 @@ config DRM_XE_KUNIT_TEST
>>> 	depends on DRM_XE && KUNIT && DEBUG_FS
>>> 	default KUNIT_ALL_TESTS
>>> 	select DRM_EXPORT_FOR_TESTS if m
>>>+	select DRM_KUNIT_TEST_HELPERS
>>> 	help
>>> 	  Choose this option to allow the driver to perform selftests under
>>> 	  the kunit framework
>>
>>But now we're mixing proper isolated tests with HW-interacting ones.
>>Can we move the HW-interacting ones to a separate Kconfig which is not
>>included in .kunitconfig and doesn't set its default value using
>>KUNIT_ALL_TESTS?
>
>I'm not sure moving them to a separate kconfig is good, because that
>would mean people building without one or the other. The only case it
>makes sense to build without the hw-interacting ones would be for when
>we are building for UML.
>
>I want to make sure the kconfig from CI includes both and people can
>run under !UML both of them.
>
>On the positive side for your approach, we'd be moving the
>*HW-interacting* ones to a separate config. This means we can create the
>split between the true unit tests and the ones just using the kunit
>infrastructure. I will give this a try and see how it looks in the end.
>
>I've been advocating for a split on a name-basis, calling these unit
>tests as sw_* and the others as hw_*. Then running just the sw ones is
>simply a matter of passing it as argument to kunit.py

I will leave this for later as I don't want to stall the tests on
something that can be converted later and... this is not making the
situation any worse: actually running this in CI will provide an output
a little more useful than it actually is giving: a skip on all tests.

I'm almost convinced we can make it work with separate configs as you
suggested, but we will need to sync with CI to make sure it fits
everyody.

>
>>>diff --git a/drivers/gpu/drm/xe/tests/Makefile b/drivers/gpu/drm/xe/tests/Makefile
>>>index 47056b6459e3..c5c2f108d017 100644
>>>--- a/drivers/gpu/drm/xe/tests/Makefile
>>>+++ b/drivers/gpu/drm/xe/tests/Makefile
>>>@@ -1,4 +1,7 @@
>>> # SPDX-License-Identifier: GPL-2.0
>>>
>>>-obj-$(CONFIG_DRM_XE_KUNIT_TEST) += xe_bo_test.o xe_dma_buf_test.o \
>>>-	xe_migrate_test.o
>>>+obj-$(CONFIG_DRM_XE_KUNIT_TEST) += \
>>>+	xe_bo_test.o \
>>>+	xe_dma_buf_test.o \
>>>+	xe_migrate_test.o \
>>>+	xe_rtp_test.o
>>>diff --git a/drivers/gpu/drm/xe/tests/xe_rtp.c b/drivers/gpu/drm/xe/tests/xe_rtp.c
>>>new file mode 100644
>>>index 000000000000..92e2c2b8b44d
>>>--- /dev/null
>>>+++ b/drivers/gpu/drm/xe/tests/xe_rtp.c
>>>@@ -0,0 +1,201 @@
>>>+// SPDX-License-Identifier: GPL-2.0 AND MIT
>>>+/*
>>>+ * Copyright © 2023 Intel Corporation
>>>+ */
>>>+
>>>+#include "tests/xe_rtp_test.h"
>>>+
>>>+#include <linux/string.h>
>>>+#include <linux/xarray.h>
>>
>>This test is not using xarray.

it actually is. See the uses of xa_for_each

thanks
Lucas De Marchi

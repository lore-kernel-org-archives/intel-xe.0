Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E258C27C7B
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 21:11:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 631C410E568;
	Wed, 20 Sep 2023 21:11:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E890710E55F
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 21:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695244264; x=1726780264;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=i63uwOnecm++OO/iActMo1IrdkbIg3uqI0dLhgPHIIo=;
 b=IxQ3aMqgTsZJ8Dg62H4SxZ2tBbNhvpZ64YCjlxtsbGL3189ec+stQqjX
 qwodKOyLa8c9Y9VA9JuDjp6Xp6x6T9SUFgVoT8v/rphbr70TtPESok1/Y
 DfQ68P4GSv3qGZRrP35AfugSMPgMMguIyvAqwMS/8ahZyr41dNAyetWtk
 tdN0Vhtk95lGBJzX7pbsrkqtznPTOPnXNFIXScuvHK2GntbJ0S4s+0IvP
 WdxfNYGQNV9ySk5/E8OCm7EeaIuaaSdF3iIONNtodxkh7F1OUngfwcLky
 mWb4zzOVBV4PdZJ0RPjuhCcxxfTNV3R6zykUmuNEpC1BebWU+lrJjQHvf g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="411287768"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="411287768"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 13:58:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="746793274"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="746793274"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2023 13:58:37 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 13:58:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 13:58:37 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 20 Sep 2023 13:58:37 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 20 Sep 2023 13:58:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VjyyTW7Ct6xhShBJisb62yyEAfcZ7MYCQgUFFXyv/RyfL50WX+SNKr/o+ZbUfhJlVNXP2kMBA5hmrK8sCHLSQYBYDF8ZjpEYbNBO11fFWhmuLGPM2k7NjF6hGVKdWLsfE0kRGolKoKp1Ht3KqLwQC21Nq63ZQkiMWXc6uTA25zRU/fOsdQoh9Y6bSBGrrzw0R38+zXWSPPzWYJ5igHbU+r5H817NAmD944fmUpPo6u98qbKh6hz1WS4kAwJhcc/MMJ3uHAuwa3Lkrbr6ZVdIWOsKcCdkGAEFTUHOs0TGI7uAGVol4Tw4kRht/ICGVEUFaNNzoGKAwqj1VUl29/psDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5cVxcF7F5qV8qB/TQHjfhRPkwfjxWyxQzd9MUuXHYXk=;
 b=BosCBuEAW1Br1w3Cj8gV1nN1octt4Opw+q5mmmlM6k3VAILLd1u4KZ2YQ9o/TsGfX3TmbFy6jtUISQ3ZtBLAT0e13Q96f6e6mSYEPdK0q6pMVqdg5WlNCzLgB+85b2WZXIl1Di7oxA7NrHZ2kUWv9VZGnmkbvd0ypr4A6/E0ky8/55SRisrgqlMIYDjHbAvxsLWN7XN2JBrMyXr0u874E9TIE25mvzhEdKYW14OqF7ipnSPrRS39jI6rm0XBzFbTN1VeKHIiUH9z5S5BySg7jpSHsjlOVpYkDHWrpEGhhyfGle4EyOs9su1fIer09T1WSK44VTrFi7VCbT5d6IhKeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB5551.namprd11.prod.outlook.com (2603:10b6:5:392::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Wed, 20 Sep
 2023 20:58:28 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Wed, 20 Sep 2023
 20:58:28 +0000
Date: Wed, 20 Sep 2023 16:58:24 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZQtc8NUtdAHuHdol@intel.com>
References: <20230920082217.2093-1-thomas.hellstrom@linux.intel.com>
 <ZQtLTgnMqyKNSb5j@intel.com>
 <b954e58e-88ae-fba4-74cb-6f5c5919a4ca@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b954e58e-88ae-fba4-74cb-6f5c5919a4ca@linux.intel.com>
X-ClientProxiedBy: BY3PR10CA0002.namprd10.prod.outlook.com
 (2603:10b6:a03:255::7) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB5551:EE_
X-MS-Office365-Filtering-Correlation-Id: 4688ea6b-300c-4ddf-8d6b-08dbba1c56c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7DUnVf0AWyUzQhxCbVAq3laCeGbvV3VqBcX89Ppj9OGCIej1wxKguQxW5NsVXk+33zC8ePLW7wufDygYZzmlB5slO/wTcFkuA/TgyrXNOqyK3QkHEJncAg5zGgKFyO9eZaCtG4CuDjltBkHE3S0SUIFrUNxTwDtGtdib2qb572+OsCvxqiW9dFlztD2X+RLv3SJJ6WH/wN+YWDtdESK9zesoP+BvZRSBLsS+RebMcxUtVsZSg0xu9j1sn0uSI3k1uPtqi4YWl0+mqOnxn1Urt8vATVOaEcU6KEcgl2UTbwloPxfLhAaH4CYV+aW0/zsb7RVb30vkoEB9L+Fllf7/k7yC7SJa5v3a0LTMW9Z3rfojXyCyU+/nCPcUkfmH5c7MJnxm6Fyqb5HQ6KJjqg8+V56/mx//4vBVPC4+8dLFAHAh74xKIHiM9TGCFB16BKKQ2xtlRcYNIPPSGO9qy+VgVThVMPdVEs691//HqfjIfwdJvtWGVS44rWi1eilQrd6c7nRn1Qn8ZnWeQjgp/AUFE53cugM11Nwo8uMJuUSxOIq6ZwR3H47x3qKdzMVlZvX0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(396003)(376002)(346002)(366004)(186009)(1800799009)(451199024)(8676002)(6486002)(44832011)(66556008)(66476007)(6916009)(316002)(478600001)(6506007)(2906002)(38100700002)(66946007)(8936002)(41300700001)(86362001)(5660300002)(83380400001)(66574015)(2616005)(6512007)(82960400001)(53546011)(6666004)(4326008)(26005)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?hcLBIW09+X+CbkMmH7NY6nPLMNn1m75EeFM6wYo4m/VEds1VX8AhajNCBC?=
 =?iso-8859-1?Q?pzMVGUbheR4Rll2cdGaE7tMULjPPE0LLey0zzkr9Czo28QywRHhN41kGxS?=
 =?iso-8859-1?Q?/ERX8cSJji1EJPwFQ+vPL7yD1K2NMSgRJXTWQVge0xm9vtu1Nb5Imjm/EM?=
 =?iso-8859-1?Q?V+X1lNQ8KJ291F76xZ9tR+ok0eKNm6hqsgI7ssmNRzzaTuYoK4RLtfcP3Z?=
 =?iso-8859-1?Q?CY/Likq4zkPle7cxrLLZFgR0FSqjIJQvfQvqVGnosw9NjTDuedDdf0LEw4?=
 =?iso-8859-1?Q?vV1yuZpAUnbG0sbmR8wiaR4+IhFOmKP7UaUoNZglZKfVE4uUdKgEgvNpPI?=
 =?iso-8859-1?Q?dPqLdqzDAVz1OirlHqTRL9TwZtTcT9oUiyYroEoQX8Wg1IaeI5akXt5bMh?=
 =?iso-8859-1?Q?LMkMJ4/JKtqtLUkK5iNEhrlirVxVCDdlKhO0lMdgX6VhlKxNnjsAvlLoYO?=
 =?iso-8859-1?Q?aha692OmnbTz52zIKY/iWw9MVE9caWRoac1ijzH/ZVCHaF/+kDga+Kbkte?=
 =?iso-8859-1?Q?lM20SdfHDd4Yw+JqYD2BcqbSrEjqoKicEaPRKGkQRunLwKqVWisXQE5yOR?=
 =?iso-8859-1?Q?SkLGMm/NQ/+c2ccbM3BdtXwfMmUlc9MyjxFRxhW+iwmk/HX9XOEo705iWE?=
 =?iso-8859-1?Q?VLlVp7QpVd+TBnVT45Z071tpDI9IfhvijUkBtcn9Izbx/+U5f4dlrf5oeo?=
 =?iso-8859-1?Q?FSE380pNIM7C2x3k93Hpv4smG95xMbAhKXwpIctNP9dphh48PjkaU2PcCQ?=
 =?iso-8859-1?Q?64JgFIF6tAa9Qf+AJe/geauD5kX9AI4TKjcUoJaC1Q80uXtQbVFQHggfMr?=
 =?iso-8859-1?Q?1vcNze+K4xr/PRVrzlBt+EtDTR0Cj4i3MvJ3NsuMnEXrvtC0vXOi8Fjupf?=
 =?iso-8859-1?Q?v+So6Pn8+JU/O8lN7C0mzfT+lBp6g9fhFQZxpHBFQGIqr1600VdJD3r9Ay?=
 =?iso-8859-1?Q?sRv3wyuq4wl+C69seOwlDHYBzit1wMy5cTxi+hK7YCH1HSB2GMaqquZ0w0?=
 =?iso-8859-1?Q?yD80qzfvfefhuRobzrHfZ2xaq1gYvsluGiZV2Y1jN3EWffmPR2UT1C4XI3?=
 =?iso-8859-1?Q?uh1ulp+ZT8AJZrgOHezvMUSVSfTP+Ig9EuC42B5EqRs4azF9UtS1K46Cc8?=
 =?iso-8859-1?Q?QXiFnVNGHSwL1W44L4b/vQXS89usaJ2emmN6udpbxF5xKsHUkqUqwRVj+L?=
 =?iso-8859-1?Q?3BGwnd20A+HAMKJghWrtcujY+Qg5XXck+51/7BdSbvRha6XUrmys0wTkVP?=
 =?iso-8859-1?Q?P5KHHwk7zLFc6PtQn1IMbuN0fGbCY5z04MperxebEa1afh3Pp0D5pELO/F?=
 =?iso-8859-1?Q?Wd/BxqkR+GHv3yStdOWm5d0Xc+iz37GRq1rMSyKQ+epgDJfDSf73dYVp3q?=
 =?iso-8859-1?Q?RP0MCQyrBpjeIsLinIOBxu4CZOkpI85kIupW1+9dwL2Ot581dSX3qVetJU?=
 =?iso-8859-1?Q?J+mgTWBQlX088VaSllZuK3gW1UGAPYjL+W5mAyJUK9KjJjx6Ulp8SSxKhU?=
 =?iso-8859-1?Q?5NP2oXLyO91J/BkguNgClrGrEeqJzyrryo5Qtsji/d4lIm73/j6Y2ipLDL?=
 =?iso-8859-1?Q?hpA3MhL54t/ztfM7RCe6S0CE8BJBTE2ond0ChLyaM+L3beO6SWUBOfcFbU?=
 =?iso-8859-1?Q?DRE5ebjzjFXacZmLL8vvISEfYT1T4Rj/Ikt82UeCAp1Nj3S2pI3TlYMw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4688ea6b-300c-4ddf-8d6b-08dbba1c56c5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 20:58:28.7525 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nJCvYxyuvdTB09wyndWrHx5UJgcft0Bal1mYakzQV8RQ+BMBbtn2exbgQ2zbmFX46nqShNJlSwXxbpwSEHjOLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5551
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] fixup! drm/xe/bo: Evict VRAM to TT rather
 than to system
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

On Wed, Sep 20, 2023 at 10:07:18PM +0200, Thomas Hellström wrote:
> 
> On 9/20/23 21:43, Rodrigo Vivi wrote:
> > On Wed, Sep 20, 2023 at 10:22:17AM +0200, Thomas Hellström wrote:
> > > The dma-buf kunit test and to some extent the dma-buf code assumed
> > > that all bos were evicted to system. Fix this by having the dma-buf
> > > code not assume anything about eviction placement and the test
> > > code assume that VRAM bos are evicted to TT.
> > I believe that we should minimize the fixup patches now and use that
> > only for the display ones that still need a lot of work.
> > 
> > This could be a simple Fixes: case. And even the commit message is
> > very good for a standalone patch.
> 
> Thanks for reviewing, Rodrigo.
> 
> So are we done rebasing, so that the commit hashes are stable? Like

oh dang.. good point... because display code will move up that hash will
change. let's go with fixup for this case. sorry for the noise.

> 
> Fixes: <stable commit hash>
> 
> /Thomas
> 
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > 
> > > The patch applies using automerge conflict resolution.
> > > 
> > > This fixes the following errors:
> > > 
> > > [  102.102086]     KTAP version 1
> > > [  102.102102]     # Subtest: xe_dma_buf
> > > [  102.102113]     1..1
> > > [  102.102377]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
> > > [  102.106167]     # xe_dma_buf_kunit: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_dma_buf.c:76
> > >                 Importer wasn't properly evicted.
> > > [  102.106327]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
> > > [  102.107136]     # xe_dma_buf_kunit: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_dma_buf.c:98
> > >                     Expected xe_bo_is_mem_type(exported, mem_type) to be true, but is false
> > > [  102.107691]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
> > > [  102.108099]     # xe_dma_buf_kunit: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_dma_buf.c:76
> > >                 Importer wasn't properly evicted.
> > > [  102.108158]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
> > > [  102.108294]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
> > > [  102.108742]     # xe_dma_buf_kunit: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_dma_buf.c:76
> > >                 Importer wasn't properly evicted.
> > > [  102.108800]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
> > > [  102.108908]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
> > > [  102.109080]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
> > > [  102.109842]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
> > > [  102.109941]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
> > > [  102.110131]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
> > > [  102.110236]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
> > > [  102.110402]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
> > > [  102.110731]     # xe_dma_buf_kunit: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_dma_buf.c:76
> > >                 Importer wasn't properly evicted.
> > > [  102.110790]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
> > > [  102.111498]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
> > > [  102.111793]     # xe_dma_buf_kunit: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_dma_buf.c:76
> > >                 Importer wasn't properly evicted.
> > > [  102.111851]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
> > > [  102.112302]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
> > > [  102.112580]     # xe_dma_buf_kunit: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_dma_buf.c:76
> > >                 Importer wasn't properly evicted.
> > > [  102.112638]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
> > > [  102.113292]     not ok 1 xe_dma_buf_kunit
> > > [  102.113296] not ok 1 xe_dma_buf
> > > 
> > > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/tests/xe_dma_buf.c |  5 ++---
> > >   drivers/gpu/drm/xe/xe_dma_buf.c       | 11 ++++-------
> > >   2 files changed, 6 insertions(+), 10 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> > > index 1c3f4bc72b99..1c4d8751be69 100644
> > > --- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> > > +++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> > > @@ -72,7 +72,7 @@ static void check_residency(struct kunit *test, struct xe_bo *exported,
> > >   	}
> > >   	/* Verify that also importer has been evicted to SYSTEM */
> > > -	if (!xe_bo_is_mem_type(imported, XE_PL_SYSTEM)) {
> > > +	if (exported != imported && !xe_bo_is_mem_type(imported, XE_PL_SYSTEM)) {
> > >   		KUNIT_FAIL(test, "Importer wasn't properly evicted.\n");
> > >   		return;
> > >   	}
> > > @@ -91,8 +91,7 @@ static void check_residency(struct kunit *test, struct xe_bo *exported,
> > >   	 * possible, saving a migration step as the transfer is just
> > >   	 * likely as fast from system memory.
> > >   	 */
> > > -	if (params->force_different_devices &&
> > > -	    params->mem_mask & XE_BO_CREATE_SYSTEM_BIT)
> > > +	if (params->mem_mask & XE_BO_CREATE_SYSTEM_BIT)
> > >   		KUNIT_EXPECT_TRUE(test, xe_bo_is_mem_type(exported, XE_PL_TT));
> > >   	else
> > >   		KUNIT_EXPECT_TRUE(test, xe_bo_is_mem_type(exported, mem_type));
> > > diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
> > > index bd8d51e7f93f..cfde3be3b0dc 100644
> > > --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> > > +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> > > @@ -98,13 +98,10 @@ static struct sg_table *xe_dma_buf_map(struct dma_buf_attachment *attach,
> > >   		return ERR_PTR(-EOPNOTSUPP);
> > >   	if (!xe_bo_is_pinned(bo)) {
> > > -		if (!attach->peer2peer ||
> > > -		    bo->ttm.resource->mem_type == XE_PL_SYSTEM) {
> > > -			if (xe_bo_can_migrate(bo, XE_PL_TT))
> > > -				r = xe_bo_migrate(bo, XE_PL_TT);
> > > -			else
> > > -				r = xe_bo_validate(bo, NULL, false);
> > > -		}
> > > +		if (!attach->peer2peer)
> > > +			r = xe_bo_migrate(bo, XE_PL_TT);
> > > +		else
> > > +			r = xe_bo_validate(bo, NULL, false);
> > >   		if (r)
> > >   			return ERR_PTR(r);
> > >   	}
> > > -- 
> > > 2.41.0
> > > 

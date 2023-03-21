Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53E70C6FD1D
	for <intel-xe@archiver.kernel.org>; Tue, 21 Mar 2023 14:07:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DC3710E203;
	Tue, 21 Mar 2023 14:07:02 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFF1210E7AB
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Mar 2023 14:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679407619; x=1710943619;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=1y5h70MjXgWUS2tBjc+44ZyvBspsQbuz0asi2Uge4vQ=;
 b=RJQNetxS43xPRY72Ei2vabl2nLRRUquH2vivLMlO1gYPY/iZKgiH+o7u
 bp1p5up1LfI0+a3e3cDeg476CDYoPT8elvSKDXcJGfxVz4xCsNaKamExX
 rbUACMwoeG5JnDUQZsDl8EydoXBRHuHlpLu9MGJQBo7LQaBia3kzCxhrj
 hnuQMTwx0/W66VXYaJ9UM86/Em7trtc/3yGrEXVQgusu5Jb3MtHpWEKzR
 l01hIx2Tm3rKGmmjEeJctNw6bUuXxpkuJm7aq1YN/yicvkohkRgT6ibuF
 NATZCo904xw/PS0zC8BQ4qwWhwUeBSN2LmbCa4vJcKMGZ3j+EjuW8gd/4 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="341307408"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="341307408"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 07:06:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="927423570"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="927423570"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga006.fm.intel.com with ESMTP; 21 Mar 2023 07:06:52 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 21 Mar 2023 07:06:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 21 Mar 2023 07:06:48 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 21 Mar 2023 07:06:48 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 21 Mar 2023 07:06:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=InzYy7m1hQQbm5sdeJoods0pNEwcrtpLZPVS4f8sORJTvEK4emgjbAemaHp/gJ43B0LqyMC2SKWL5yPD9YK84xJ27/wsRQTbS6rAB25QjwLWsQi2tCBal+7oyRRS9a0I4b8BhfDcz3jrDxFwsY/MwPr8Uyr5+Ok4RF5E3t0Zu3J4CqxrYaFYHClY0aBuCFL+5Y+tBe1GbRFhRIvEgADNI+u4/LKCvR3NhXTZ9ZugjtkroLCQrZCOJAUw6WPtaXqO2uGFwWnmVxTa/MXx+Mbeq20dnQSKFPxfukr1c1Oxo1PqcjvuEW/KR5oPdAWzuCXdqK4F6svC58GwP5hIG3C+Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NORDidyPLU1nA8rsn2h1uwqMC1/sDDt8ahOFIxBzgXI=;
 b=RBYNkyFQW2iMVUBNfmSafuUk35vWJ4k4rysgzINu3kGNUVWhbbfgBSuz1D4pgOgiPwO/xhlYYMYgx03Q2p3tGr7Xrlv0mD2Q12HKralWF7coYhAOHyxxQ+mgkVmkN2aWozLLN3GLLh58aSCrKnh4dJZCcmx5nlbrqVEQSn5SvBflg6KUHQHq/yjhuAYMKcGK+zF29LDvs5Y5ERHu8BiI98OJu7vHdvCN4L5LJD5PCFZD5w7M17s2FAGMvKeXD5Bx4q95aOLvjZsckp0l6ipbesOkh/EGwa8fCRz0qXcOOZLLo9AhsgUbC7LX7gXCz9hxe5Rx/PndDbS4UfbG40w8Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5054.namprd11.prod.outlook.com (2603:10b6:a03:2d3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 14:06:44 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%5]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 14:06:44 +0000
Date: Tue, 21 Mar 2023 07:06:42 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <20230321140642.yfgkw4hjo2h3nol3@ldmartin-desk2.lan>
References: <20230316210341.3547058-1-lucas.demarchi@intel.com>
 <20230316210341.3547058-4-lucas.demarchi@intel.com>
 <7f6b73f8-24ee-bb58-96ad-7cbdc60f7092@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7f6b73f8-24ee-bb58-96ad-7cbdc60f7092@linux.intel.com>
X-ClientProxiedBy: BY5PR04CA0013.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5054:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fa96845-44f2-43b8-88e0-08db2a15806e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FjrcLB0AE1uoquttcb3zJppwIcIG+hCBMZy99B68ld9uYlGdrlsU3zsLFw0Bjx33lEhmArkGADUWqxdPn0iRfsAslgnXf4Gjk5QKudHuesEzny+wqNVlsKa84Qv7R6LsvIC7u2yTswdznganK6Qs3/aUnnkYardlhLSXY4VLsWIrD6N9RvfWt7HH7B21m8YIuvVPW0jkWmVEuIv12eCvvnXMm5uVI/53GGzAqKQqXLbHBBQc8umbRV+f8zQk0E//VycTvIUQWTVb7Tff1/Kql29TVIaoIKjlNS+PMgYoV0HsAUffYnEi4c9AVhx41ugKlKS7J7hEEH4fN1aVTZyZZh+EfFTO/7D3cFT67PlIZC31FN9AUG28PGxIHZaXCyWom4gF66BsmN1mn3xVn+eO0fwYaUCO946MaT9UCIoThSn+pGDrLbwgHgt33Be1B5GTrjGB55xWXGAxq2ATL1MunVMF7yK9ET6sFJpxqbW2ejIUXMxXzVOl361KDdOSsYXTBRe85p2eH344lqVYah4X8vt1JumS7/2uaM5b1Yt2JgPWgNkzF5fWgAci/62/Jpf/CwiqZmO4tM4ZopFj0oJECmSKV49xa9zQ/y9q3hjlT8TNJyuyJZSpda2xXVauUxjcZqKH/P1Fdg+WKds9n0kwcA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(396003)(39860400002)(136003)(366004)(376002)(451199018)(186003)(1076003)(82960400001)(6486002)(26005)(6506007)(9686003)(6512007)(38100700002)(2906002)(478600001)(86362001)(83380400001)(8676002)(316002)(30864003)(8936002)(5660300002)(66556008)(4326008)(6916009)(66476007)(36756003)(41300700001)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?fRlGH4TDGvTV0z+OvJ5oZowMoByu6su/79PXaP4ty4XANx/vdMIS4dDRty?=
 =?iso-8859-1?Q?EMaIFZyvV/2QKUorivAl5iJdzJlWGxSyMZF6X5HbYNnM+9rWhWgcgInCqV?=
 =?iso-8859-1?Q?OXuwZrG8DbHObdVNBKt3BeNsWNgzLmLvXfYOVpJKNDwtjzJ7q9vXYQo5sQ?=
 =?iso-8859-1?Q?RWwRCEqd2FaygVvR+cQWCpbWiAk7Pa/czQpIo2v6C4XRfoss9cJ/15+RuQ?=
 =?iso-8859-1?Q?glcsNr9oTKiiJyoMO+4SMaLUvLvxN3jUXSql1HPNNFqo22r9UE1wVWTjGM?=
 =?iso-8859-1?Q?tQIIcuMCcrDK7NSE+yCOaCFJmL1L4/ny9x8esZebwgBvdpYspZxZ70K1gX?=
 =?iso-8859-1?Q?fDfVDIwOt4CKrnq+EYvlb1b4F+EbZJYCNq4Q8IUTE/PgrJcL5n0uRb5fiK?=
 =?iso-8859-1?Q?dVY1TNd5DCpILxA5Liqh9McdkhTDmZkCJqlu3yijR3HuzGQmJEnotZyr87?=
 =?iso-8859-1?Q?i7Tn2U44/aY4sNuR+AqaAC7ufdKLN8WmXTBfxS6ggE8Ni6AQIfilv+pvvO?=
 =?iso-8859-1?Q?yw8EBHavVNaMlheyqgvBLPym1WhercRdw9r7rFewFlu8l+FRI0mmsZw6hb?=
 =?iso-8859-1?Q?PftsxTLvVOnvTyLMXdBexhEDy+JNohlBFNw5IuJHCLV7kn1Tnf3LdOWmKu?=
 =?iso-8859-1?Q?pNzXYOKAav57bFfpq+gGgeKb8ld3OQV+9xc0bBZAwylSorWzKBlIaW8CKo?=
 =?iso-8859-1?Q?NzVtD+38+8UdkHL+7FbDg2V64tlPbnp+o1CW4FVp41Xs0urBZ6l702LIFh?=
 =?iso-8859-1?Q?w++NvEUaKXC1oX31jDPAffEic2YqVT8uNxZYS7VW4YlGmRk2+o88F2X8Uu?=
 =?iso-8859-1?Q?aVOlRJsDnd2IsQKu8N8V2mzjp8HzMHfDtV1dwYkY/ggYS49Y+Prx4JPwlX?=
 =?iso-8859-1?Q?v/Hpy6d7Ls+5G3rpfYYXapMaHX/M751Vgq+5L4Kaay/ULSGgDZkARTZpT1?=
 =?iso-8859-1?Q?mrOybPUtP7DXdyvFIJLjQFX6HAA0ujFykKSXs/cQ6ATy1lcB/FVnxArC9Z?=
 =?iso-8859-1?Q?GAyYpRhzkeRYXpGUZlsL/v3LZALhcyOEzFuIEsDLd0wyTlFjP8+XnhBN3J?=
 =?iso-8859-1?Q?SOKSj3H50/4hp4QYJCd+y0YpE4sdTfvQurQuodZ7/x+g6Ecqso9npp933U?=
 =?iso-8859-1?Q?LX3kM7/WFr2U4ajLEC3YzpuAmQDh38ALtW2mR0ZsQjzXa035nO3jpfSwbD?=
 =?iso-8859-1?Q?BlYP6WEcP/qV8nM9GytNxjiHhdgdyCxyckiZLnqzHgiGOS/zWWUeaKYDfG?=
 =?iso-8859-1?Q?19HW6vee1oT/cQWPaUoJ+ibPVvCvPbW3cLz+bkfEFP9jE6ykUWPprmxlis?=
 =?iso-8859-1?Q?k2X5K7v2lfa5wp4PjCA11t3iC2G9hlnLjXWjXfiCLxuq/oCpuE9Fa73By4?=
 =?iso-8859-1?Q?edEVOdI0mb9XfzmwKJfSq0bz6plhIhF0KMtTg0fAkWwdUuJ7sQ58KbbT6V?=
 =?iso-8859-1?Q?H8b079pEaoaXWH49HHz954RFuOKD2KKTXFWcqKYctia26cZa3RT8pdaoah?=
 =?iso-8859-1?Q?0wuV1W+tk4nd2/4/6KwXbpX1H+rEsECn1g2RiGsbV83CyxJBxvlXeuSbDl?=
 =?iso-8859-1?Q?KPzdqq22ltlc46m8nIcoY14tjb/1DvAC2gZIszczwUqxDX6FmrT8MzLEcH?=
 =?iso-8859-1?Q?VpqsnERr3+8WebQhcZlvMrjp6VH9J+ZTPCZLOKUkCkNQwdFrneBSQ3Ew?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fa96845-44f2-43b8-88e0-08db2a15806e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 14:06:44.2821 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0i6TmS8mNJ0xYv/6rK1Aws8sd+N2oeMkN3FGRE1bGid6sgG97aBNZHT/2VhlfOZp5zJl+p34DcDZ8HhnRLwLgmmyDaoljVz2KzwrxZPzPjk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5054
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 3/3] drm/xe: Add basic unit tests for rtp
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
Cc: mauro.chehab@intel.com, thomas.hellstrom@intel.com,
 Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org,
 maarten.lankhorst@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Mar 21, 2023 at 02:11:16PM +0100, Maarten Lankhorst wrote:
>Hey,
>
>On 2023-03-16 22:03, Lucas De Marchi wrote:
>>Add some basic unit tests for rtp. This is intended to prove the
>>functionality of the rtp itself, like coalescing entries, rejecting
>>non-disjoint values, etc.
>>
>>Contrary to the other tests in xe, this is a unit test to test the
>>sw-side only, so it can be executed on any machine - it doesn't interact
>>with the real hardware. For that a mock was provided with the minimum
>>initialization needed. Running it produces the following output:
>>
>>	$ ./tools/testing/kunit/kunit.py run --raw_output  \
>>		--kunitconfig drivers/gpu/drm/xe/.kunitconfig xe_rtp
>>	...
>>	[13:46:14] Starting KUnit Kernel (1/1)...
>>	KTAP version 1
>>	1..1
>>	    KTAP version 1
>>	    # Subtest: xe_rtp
>>	    1..3
>>	    ok 1 xe_rtp_process_basic
>>	[drm:xe_reg_sr_add] *ERROR* Discarding save-restore reg 0001 (clear: 00000001, set: 00000001, masked: no): ret=-22
>>	[drm:xe_reg_sr_add] *ERROR* Discarding save-restore reg 0001 (clear: 00000003, set: 00000003, masked: no): ret=-22
>>	    ok 2 xe_rtp_process_dup
>>	[drm:xe_reg_sr_add] *ERROR* Discarding save-restore reg 0001 (clear: 00000001, set: 00000001, masked: no): ret=-22
>>	[drm:xe_reg_sr_add] *ERROR* Discarding save-restore reg 0001 (clear: 00000003, set: 00000003, masked: no): ret=-22
>>	    ok 3 xe_rtp_process_incompat_types
>>	# xe_rtp: pass:3 fail:0 skip:0 total:3
>>	# Totals: pass:3 fail:0 skip:0 total:3
>>	ok 1 xe_rtp
>>	[13:46:14] Elapsed time: 6.800s total, 0.002s configuring, 6.682s building, 0.073s running
>>
>>Note that the ERRORs in the kernel log are expected since it's testing
>>non-disjoint or incompatible entries.
>>
>>Signed-off-by: Lucas De Marchi<lucas.demarchi@intel.com>
>>---
>>  drivers/gpu/drm/xe/Kconfig.debug       |   1 +
>>  drivers/gpu/drm/xe/tests/Makefile      |   7 +-
>>  drivers/gpu/drm/xe/tests/xe_rtp.c      | 201 +++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/tests/xe_rtp_test.c |  71 +++++++++
>>  drivers/gpu/drm/xe/tests/xe_rtp_test.h |  15 ++
>>  drivers/gpu/drm/xe/xe_rtp.c            |   4 +
>>  6 files changed, 297 insertions(+), 2 deletions(-)
>>  create mode 100644 drivers/gpu/drm/xe/tests/xe_rtp.c
>>  create mode 100644 drivers/gpu/drm/xe/tests/xe_rtp_test.c
>>  create mode 100644 drivers/gpu/drm/xe/tests/xe_rtp_test.h
>>
>>diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
>>index 93b284cdd0a2..11bb13c73e7b 100644
>>--- a/drivers/gpu/drm/xe/Kconfig.debug
>>+++ b/drivers/gpu/drm/xe/Kconfig.debug
>>@@ -66,6 +66,7 @@ config DRM_XE_KUNIT_TEST
>>  	depends on DRM_XE && KUNIT && DEBUG_FS
>>  	default KUNIT_ALL_TESTS
>>  	select DRM_EXPORT_FOR_TESTS if m
>>+	select DRM_KUNIT_TEST_HELPERS
>>  	help
>>  	  Choose this option to allow the driver to perform selftests under
>>  	  the kunit framework
>>diff --git a/drivers/gpu/drm/xe/tests/Makefile b/drivers/gpu/drm/xe/tests/Makefile
>>index 47056b6459e3..c5c2f108d017 100644
>>--- a/drivers/gpu/drm/xe/tests/Makefile
>>+++ b/drivers/gpu/drm/xe/tests/Makefile
>>@@ -1,4 +1,7 @@
>>  # SPDX-License-Identifier: GPL-2.0
>>-obj-$(CONFIG_DRM_XE_KUNIT_TEST) += xe_bo_test.o xe_dma_buf_test.o \
>>-	xe_migrate_test.o
>>+obj-$(CONFIG_DRM_XE_KUNIT_TEST) += \
>>+	xe_bo_test.o \
>>+	xe_dma_buf_test.o \
>>+	xe_migrate_test.o \
>>+	xe_rtp_test.o
>>diff --git a/drivers/gpu/drm/xe/tests/xe_rtp.c b/drivers/gpu/drm/xe/tests/xe_rtp.c
>>new file mode 100644
>>index 000000000000..196a7223c807
>>--- /dev/null
>>+++ b/drivers/gpu/drm/xe/tests/xe_rtp.c
>>@@ -0,0 +1,201 @@
>>+// SPDX-License-Identifier: GPL-2.0 AND MIT
>>+/*
>>+ * Copyright © 2023 Intel Corporation
>>+ */
>>+
>>+#include "tests/xe_rtp_test.h"
>>+
>>+#include <linux/string.h>
>>+#include <linux/xarray.h>
>>+
>>+#include <kunit/test.h>
>>+
>>+#include "regs/xe_gt_regs.h"
>>+#include "regs/xe_reg_defs.h"
>>+#include "xe_rtp.h"
>>+
>>+#undef _MMIO
>>+#undef MCR_REG
>>+#define _MMIO(x)	_XE_RTP_REG(x)
>>+#define MCR_REG(x)	_XE_RTP_MCR_REG(x)
>>+
>>+#define REGULAR_REG1	_MMIO(1)
>>+#define REGULAR_REG2	_MMIO(2)
>>+#define REGULAR_REG3	_MMIO(3)
>>+#define MCR_REG1	MCR_REG(1)
>>+#define MCR_REG2	MCR_REG(2)
>>+#define MCR_REG3	MCR_REG(3)
>>+
>>+static bool match_yes(const struct xe_gt *gt, const struct xe_hw_engine *hwe)
>>+{
>>+	return true;
>>+}
>>+
>>+static bool match_no(const struct xe_gt *gt, const struct xe_hw_engine *hwe)
>>+{
>>+	return false;
>>+}
>>+
>>+/* Basic entries: same register, only one action, disjoint values */
>>+static const struct xe_rtp_entry basic_entries[] = {
>>+	{ XE_RTP_NAME("basic-yes-1"),
>>+	  XE_RTP_RULES(FUNC(match_yes)),
>>+	  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
>>+	},
>>+	{ XE_RTP_NAME("basic-yes-2"),
>>+	  XE_RTP_RULES(FUNC(match_yes)),
>>+	  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(1)))
>>+	},
>>+	{ XE_RTP_NAME("basic-no-3"),
>>+	  XE_RTP_RULES(FUNC(match_no)),
>>+	  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(2)))
>>+	},
>>+	{ XE_RTP_NAME("basic-no-4"),
>>+	  XE_RTP_RULES(FUNC(match_yes), FUNC(match_no)),
>>+	  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(3)))
>>+	},
>>+	{ XE_RTP_NAME("basic-yes-clr-1"),
>>+	  XE_RTP_RULES(FUNC(match_yes)),
>>+	  XE_RTP_ACTIONS(CLR(REGULAR_REG1, REG_BIT(4)))
>>+	},
>>+	{ XE_RTP_NAME("basic-yes-clr-2"),
>>+	  XE_RTP_RULES(FUNC(match_yes)),
>>+	  XE_RTP_ACTIONS(CLR(REGULAR_REG1, REG_BIT(5)))
>>+	},
>>+	{}
>>+};
>>+
>>+void xe_rtp_process_basic(struct kunit *test)
>>+{
>>+	struct xe_device *xe = test->priv;
>>+	struct xe_reg_sr *reg_sr = &xe->gt[0].reg_sr;
>>+	const struct xe_rtp_entry *rtp_entry;
>>+	const struct xe_reg_sr_entry *sre, *sr_entry = NULL;
>>+	unsigned long idx, count = 0, set_bits = 0, clr_bits = 0;
>>+
>>+	xe_reg_sr_init(reg_sr, "basic", xe);
>>+	xe_rtp_process(basic_entries, reg_sr, &xe->gt[0], NULL);
>>+
>>+	xa_for_each(&reg_sr->xa, idx, sre) {
>>+		count++;
>>+		sr_entry = sre;
>>+	}
>>+
>>+	/*
>>+	 * Same REGULAR_REG1 register being used: all the entries should
>>+	 * coalesce into a single entry
>>+	 */
>>+	KUNIT_ASSERT_EQ(test, count, 1);
>>+
>>+	/* Only bits in the entries named *-yes* are set */
>>+	for (rtp_entry = basic_entries; rtp_entry && rtp_entry->name; rtp_entry++) {
>>+		if (!strstr(rtp_entry->name, "-yes"))
>>+			continue;
>>+
>>+		clr_bits |= rtp_entry->actions[0].clr_bits;
>>+		set_bits |= rtp_entry->actions[0].set_bits;
>>+	}
>>+
>>+	/* implementation detail of RTP - SET() also clears */
>>+	clr_bits |= set_bits;
>>+
>>+	KUNIT_EXPECT_EQ(test, clr_bits, sr_entry->clr_bits);
>>+	KUNIT_EXPECT_EQ(test, set_bits, sr_entry->set_bits);
>>+}
>>+EXPORT_SYMBOL(xe_rtp_process_basic);
>>+
>>+/*
>>+ * Duplicate entries - same register register, only one action,
>>+ * with actions trying to set/clear bits already changed in previous entries
>>+ */
>>+static const struct xe_rtp_entry dup_entries[] = {
>>+	{ XE_RTP_NAME("dup-entries-yes-1"),
>>+	  XE_RTP_RULES(FUNC(match_yes)),
>>+	  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
>>+	},
>>+	{ XE_RTP_NAME("dup-entries-no-2"),
>>+	  XE_RTP_RULES(FUNC(match_yes)),
>>+	  /* should be dropped as it's the same as a previous */
>>+	  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
>>+	},
>>+	{ XE_RTP_NAME("dup-entries-no-3"),
>>+	  XE_RTP_RULES(FUNC(match_yes)),
>>+	  /* should be dropped as not disjoint */
>>+	  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_GENMASK(1, 0)))
>>+	},
>>+	{}
>>+};
>>+
>>+void xe_rtp_process_dup(struct kunit *test)
>>+{
>>+	struct xe_device *xe = test->priv;
>>+	struct xe_reg_sr *reg_sr = &xe->gt[0].reg_sr;
>>+	const struct xe_reg_sr_entry *sre, *sr_entry = NULL;
>>+	unsigned long idx, count = 0;
>>+
>>+	xe_reg_sr_init(reg_sr, "duplicate values", xe);
>>+	xe_rtp_process(dup_entries, reg_sr, &xe->gt[0], NULL);
>>+
>>+	xa_for_each(&reg_sr->xa, idx, sre) {
>>+		count++;
>>+		sr_entry = sre;
>>+	}
>>+
>>+	/*
>>+	 * Same REGULAR_REG1 register being used: all the entries should
>>+	 * coalesce into a single entry
>>+	 */
>>+	KUNIT_EXPECT_EQ(test, count, 1);
>>+	KUNIT_EXPECT_EQ(test, sr_entry->set_bits, REG_BIT(0));
>>+}
>>+EXPORT_SYMBOL(xe_rtp_process_dup);
>>+
>>+/*
>>+ * Incompatible types: same register register, but entries trying to set the
>>+ * same register passing incompatible types (masked / mcr)
>>+ */
>>+static const struct xe_rtp_entry incompat_types_entries[] = {
>>+	{ XE_RTP_NAME("incompat-types-yes-1"),
>>+	  XE_RTP_RULES(FUNC(match_yes)),
>>+	  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
>>+	},
>>+	{ XE_RTP_NAME("incompat-types-no-2"),
>>+	  XE_RTP_RULES(FUNC(match_yes)),
>>+	  /* dropped since has incompatible type with previous entry */
>>+	  XE_RTP_ACTIONS(SET(MCR_REG1, REG_BIT(1)))
>>+	},
>>+	{ XE_RTP_NAME("incompat-types-no-3"),
>>+	  XE_RTP_RULES(FUNC(match_yes)),
>>+	  /* dropped since has incompatible type with previous entry */
>>+	  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(2),
>>+			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>>+	},
>>+	{ XE_RTP_NAME("incompat-types-no-3"),
>>+	  XE_RTP_RULES(FUNC(match_yes)),
>>+	  /* dropped since has incompatible type with previous entry */
>>+	  XE_RTP_ACTIONS(SET(MCR_REG1, REG_BIT(3),
>>+			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>>+	},
>>+	{}
>>+};
>>+
>>+void xe_rtp_process_incompat_types(struct kunit *test)
>>+{
>>+	struct xe_device *xe = test->priv;
>>+	struct xe_reg_sr *reg_sr = &xe->gt[0].reg_sr;
>>+	const struct xe_reg_sr_entry *sre, *sr_entry = NULL;
>>+	unsigned long idx, count = 0;
>>+
>>+	xe_reg_sr_init(reg_sr, "incompatible types", xe);
>>+	xe_rtp_process(dup_entries, reg_sr, &xe->gt[0], NULL);
>>+
>>+	xa_for_each(&reg_sr->xa, idx, sre) {
>>+		count++;
>>+		sr_entry = sre;
>>+	}
>>+
>>+	/* Just the first entry is added, the rest are incompatible */
>>+	KUNIT_EXPECT_EQ(test, count, 1);
>>+	KUNIT_EXPECT_EQ(test, sr_entry->set_bits, REG_BIT(0));
>>+}
>>+EXPORT_SYMBOL(xe_rtp_process_incompat_types);
>>diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>>new file mode 100644
>>index 000000000000..9340ce44c7be
>>--- /dev/null
>>+++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>>@@ -0,0 +1,71 @@
>>+// SPDX-License-Identifier: GPL-2.0
>>+/*
>>+ * Copyright © 2023 Intel Corporation
>>+ */
>>+
>>+#include "xe_rtp_test.h"
>>+
>>+#include <drm/drm_drv.h>
>>+#include <drm/drm_kunit_helpers.h>
>>+
>>+#include <kunit/test.h>
>>+
>>+#include "xe_device_types.h"
>>+
>>+static void mock_xe_device_init(struct xe_device *xe)
>>+{
>>+	xe->gt[0].xe = xe;
>>+}
>>+
>>+struct xe_rtp_test_priv {
>>+	struct xe_device xe;
>>+	struct device *dev;
>>+};
>>+
>>+static int xe_rtp_test_init(struct kunit *test)
>>+{
>>+	struct xe_rtp_test_priv *priv;
>>+	struct device *dev;
>>+
>>+	dev = drm_kunit_helper_alloc_device(test);
>>+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
>>+
>>+	priv = drm_kunit_helper_alloc_drm_device(test, dev,
>>+						 struct xe_rtp_test_priv,
>>+						 xe.drm,
>>+						 DRIVER_GEM | DRIVER_RENDER |
>>+						 DRIVER_SYNCOBJ | DRIVER_SYNCOBJ_TIMELINE);
>>+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv);
>>+
>>+	mock_xe_device_init(&priv->xe);
>>+	priv->dev = dev;
>>+	test->priv = priv;
>>+
>>+	return 0;
>>+}
>
>Would it be a good idea to put dev inside xe->drm.dev instead? I'm not sure if it
>has side effects though.

yep, I already did it for the upcoming patches:

	o drm/xe: Generalize mock device creation
	o drm/xe: Use XE_KUNIT for symbol namespace
	o drm/xe: Move test infra out of xe_pci.[ch]
	o drm/xe: Extract function to initialize xe->info
	o drm/xe: Add basic unit tests for rtp

I will send it later today.

	static int xe_rtp_test_init(struct kunit *test)
	{
	       struct xe_device *xe;
	       struct device *dev;

	       dev = drm_kunit_helper_alloc_device(test);
	       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);

	       xe = drm_kunit_helper_alloc_drm_device(test, dev,
						      struct xe_device,
						      drm, DRIVER_GEM);
	       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xe);

	       mock_xe_device_init(xe);
	       xe->drm.dev = dev;
	       test->priv = xe;

	       return 0;
	}

Later in the series I move mock_xe_device_init to a common helper.
I'm not sure about the name though. kunit in general seems to prefer
the "fake device" terminology, but most of the drivers use "mock"

>
>Alternatively, assign test->priv to &priv->xe and put a container_of macro inside
>test_exit, so this works regardless of xe_rtp_test_priv memory layout (struct randomization).
>
>With this fixed in either way:
>Reviewed-by: Maarten Lankhorst<maarten.lankhorst@linux.intel.com>

Thanks. I changed a few more things in the next version, but they are
mostly cosmetic.

Luacs De Marchi

>
>>+static void xe_rtp_test_exit(struct kunit *test)
>>+{
>>+	struct xe_rtp_test_priv *priv = test->priv;
>>+
>>+	drm_kunit_helper_free_device(test, priv->dev);
>>+}
>>+
>>+static struct kunit_case xe_rtp_tests[] = {
>>+	KUNIT_CASE(xe_rtp_process_basic),
>>+	KUNIT_CASE(xe_rtp_process_dup),
>>+	KUNIT_CASE(xe_rtp_process_incompat_types),
>>+	{}
>>+};
>>+
>>+static struct kunit_suite xe_rtp_test_suite = {
>>+	.name = "xe_rtp",
>>+	.init = xe_rtp_test_init,
>>+	.exit = xe_rtp_test_exit,
>>+	.test_cases = xe_rtp_tests,
>>+};
>>+
>>+kunit_test_suite(xe_rtp_test_suite);
>>+
>>+MODULE_AUTHOR("Intel Corporation");
>>+MODULE_LICENSE("GPL");
>>diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.h b/drivers/gpu/drm/xe/tests/xe_rtp_test.h
>>new file mode 100644
>>index 000000000000..a2f1437d6299
>>--- /dev/null
>>+++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.h
>>@@ -0,0 +1,15 @@
>>+/* SPDX-License-Identifier: GPL-2.0 AND MIT */
>>+/*
>>+ * Copyright © 2023 Intel Corporation
>>+ */
>>+
>>+#ifndef _XE_RTP_TEST_H_
>>+#define _XE_RTP_TEST_H_
>>+
>>+struct kunit;
>>+
>>+void xe_rtp_process_basic(struct kunit *test);
>>+void xe_rtp_process_dup(struct kunit *test);
>>+void xe_rtp_process_incompat_types(struct kunit *test);
>>+
>>+#endif
>>diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
>>index cb9dd894547d..f634558b6e50 100644
>>--- a/drivers/gpu/drm/xe/xe_rtp.c
>>+++ b/drivers/gpu/drm/xe/xe_rtp.c
>>@@ -186,3 +186,7 @@ bool xe_rtp_match_first_gslice_fused_off(const struct xe_gt *gt,
>>  	return dss >= dss_per_gslice;
>>  }
>>+
>>+#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
>>+#include "tests/xe_rtp.c"
>>+#endif

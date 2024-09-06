Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B00CE7AA5
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 01:51:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45B6C10E83B;
	Fri,  6 Sep 2024 01:51:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n50lcQvA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFAA910E83B
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 01:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725587514; x=1757123514;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5+lIdBKe3L7NX4yrgoqKa9MKVy7kZItUXcZUywXU3iQ=;
 b=n50lcQvA9Qg9NgDN4ous/1cLiXdecz/B4Zl5ZVyuctOiGIrO3q2twlD9
 SwH3igh65eUMP97tM1XBURoAH73/XqeNl/Cj/MDFO91rwZxSqtLYqGG44
 rGJB1WZHpZGckpvkFcsDP4Auidsv7t7/c7w13Ij1e0szITHDI0O3gmi4D
 gKUPMOVX5RJ2lg4Th77JawKklh9yIieIhQgEeHxJarINHm+p73RFEtcNT
 jcLe7o0HLjF0KZUlSvAb+T52nJLLCjO3TJgZvOsh+OItSQ7sYz9MQEGVh
 ns2MZRuGriPhPaq0081/mBGeTLJj9MeUSIAdvFW2rXlsAV2sRJZztcez5 Q==;
X-CSE-ConnectionGUID: Am4xl9anRSGkV903MhajsA==
X-CSE-MsgGUID: cwC5cvYgQxe94YA1p/ysHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="24210451"
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; d="scan'208";a="24210451"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 18:51:46 -0700
X-CSE-ConnectionGUID: n5Q0NuFUT76qiyfcvMaiwQ==
X-CSE-MsgGUID: oxpYWdWnSamDmQFqd86L+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; d="scan'208";a="70242469"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Sep 2024 18:51:34 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Sep 2024 18:51:34 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Sep 2024 18:51:34 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Sep 2024 18:51:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t9WU1qjPgv0NqMnrAM1T8WdBK2IenPaZQv7/x2by2upMaX0E4C4qXvM244q348JS+IIb+r5zss07KZQEZLw1poZSQr3pPS00wTUw/6zECmWK3AcQMeiup8piO93d/MJOE1iV4zBs9lopcbmxegY6OrflfZpbo67xjplHl5K9ocy6G3oJOC+aXk5Y3Z8h9YHpfATSQ3UZnGpbt7S3U5haabWGMxDrxCm8aPoc2rONZp1GRzvZ3/Y+wKGvapUsmF+/DtHdnG70y4GVmjtsm1339VsrmbB5DMwZC+MfeGgcgP5GmDWysI/qigNKEFM09iaH44Kl0F8ir938N4XgfCTjOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5+lIdBKe3L7NX4yrgoqKa9MKVy7kZItUXcZUywXU3iQ=;
 b=Jz0tZKB9/PS7lmq1NphyYEh5SQGl+NSr8ZYvDEEJDITwDSlAQpLio3rpJOLlifHMeM5tWg7aazHELxyFcOp1e+pCqgN7bFJu0/jKfZ4GUccEgJd+Azqdl+nWNqN2Tbhq4gzadL2Bpm6fprGbsLTkc63yG3hTEJ1iMypBpBmvjt1IUMbeHgQgPqSjXTGlHvSBcgNRxWfNN1RAtvUrp3hNXJ6lXRyGK2L/Y9IgnbinZW8P2On8DZ6pgvvdAMGGZOJwB3tm16SDgElKeupxfXlTdwtiVVH27esoeKcc8TcA8ryh7SJHblAkTWLvuc2xBXrWvNSSp0MG+hMJKBakgCpWWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB4806.namprd11.prod.outlook.com (2603:10b6:510:31::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Fri, 6 Sep
 2024 01:51:26 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 01:51:26 +0000
Date: Thu, 5 Sep 2024 20:51:23 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 07/43] drm/xe: Add xe_device backpointer to xe_mmio
Message-ID: <vnsxsmhrjem4m7bs32ldgaojkbb3ckcm4rzesidmug2cud4fo4@jngagkzsj7l7>
References: <20240904002100.2023834-45-matthew.d.roper@intel.com>
 <20240904002100.2023834-52-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240904002100.2023834-52-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4PR04CA0252.namprd04.prod.outlook.com
 (2603:10b6:303:88::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB4806:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a1f9d88-930e-4fe4-32e0-08dcce166b27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?s9VE/OtBVXWM/BZzMNa7nNPkuu/c/pte4ocxbiAI0cmVc516HiyYxZCZbECw?=
 =?us-ascii?Q?vuykpNPwCmDUdmHVRlMX/mDj9CJqfGslHbfvLQ0su5Efp5dXCVs3XViq36fs?=
 =?us-ascii?Q?wk0h0evQvEAfQzXPggSqIrqi/Jcjr6XTc09CuK2QRbUlOmnlhAqh86nGSgE2?=
 =?us-ascii?Q?Taz8Y7CU9KiLp0hqInZcQQxD6PZ+rDwTtBMNWuIVV6/I7cduBuKTwCCpSuqa?=
 =?us-ascii?Q?0mnai6N7XMM/utdPQzxXEzQobant3e4FsH17Pa9J05cLOHRwEtxB5+dgqCUZ?=
 =?us-ascii?Q?nWDKbGLoQxmPxxnu2E1KcEakgFhNSVt+Zye+ai5115AGA6KJro/yJruQQAoR?=
 =?us-ascii?Q?X42wzq5kJeOK4TmUzTMOH2ajwRjrcz5wOTWDP7db+PUb2ppn7TutykNg6EY/?=
 =?us-ascii?Q?1Vs54c1JE8ZbCZODaxuyuQdWQkbSAsgc4IG0et9m+vhitDA509FZBQTpQUue?=
 =?us-ascii?Q?MTR0LIiPyJZPQw3rPz5Fq7gRmgfrJ6vbv0VPn1Z7OQxSi2jh7Q0t563yLJJ2?=
 =?us-ascii?Q?FAH3a6TdjtqqjAJx+PRhJ4qLtvumkXG37HB2M0CImFbG19ZZWAdHxSO2mjQl?=
 =?us-ascii?Q?K4IB1oJITrHQaDAB7AQ1V5L7xrSYNj3aLXj4hvsBVdnkuPWi1L4VkglIltrC?=
 =?us-ascii?Q?h1wZoWO1CP0tMktUNN+eGtusKKHtufLdQ/SXB3pntarNhOxJJ8yrzTNx3wYn?=
 =?us-ascii?Q?Tpdc6upn/1aZFPy+ZSuGVkzjcQdNCRN2IgYuxgplK+8rvF/raucSHn6s+nNe?=
 =?us-ascii?Q?aJsH3hbXcOBAoUIA07xTwtOlXHoiYnEXY0UregSXxNUDBRoHV/IVOFkBXrU1?=
 =?us-ascii?Q?3zyuGR7R6Wow9vjxyeUYzwxa36QBbJ/ySrTxNhTzHn/DTf+r/hqo49dJ0TrM?=
 =?us-ascii?Q?jsahYKkLFy4H/S5wCzW+YoliOgbOsLhH3jp5T68Vv9Cj+BMTMlsleLKd3Q6e?=
 =?us-ascii?Q?D78nTihTdpTg1GfhZeDuR7YJTq/qqtj546To/sUFdEMK3VKb0btGxjGFIhsu?=
 =?us-ascii?Q?qSr3gds/5zlpfH2fTvZU97fhZvmG7ypVLgz5SQXxN26hgqySTIoB1MHarN+x?=
 =?us-ascii?Q?Wu5kO3nO6ZGufQSDSrbsuiMVoB5UwmXcWbgnVRfzUe1Cqch7dQBbnEmaj+cN?=
 =?us-ascii?Q?iMyv0rvxVgZUDdwX9saFSJ2CAvZ64mBnVpty52L3fYM6P7YTGyE6osc/Jpnz?=
 =?us-ascii?Q?Yb3Glpr/RDlgH97pTrGhVYAHWZIODy3MawV1ho6ZQCqBrgy2+bTBY7DptpXs?=
 =?us-ascii?Q?RiZ+8Z3HuUS0LSC6o1XJLyGf3mZq2X/fptxHdbCbWw/lW85M2BzLIlCE2LWf?=
 =?us-ascii?Q?uvVLVNT7VFw9+shWiestAdxcwwYRqrYc41P0blkTFjoqWg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WeIx5iNUUPV8Z8dgoZkrUihhj+UHzownVA9ZJ5A6Zk6VvmM59A76QMuTlBHe?=
 =?us-ascii?Q?xqGGwSlMBDXrQYMXHcC52z8kq+HP98F4gEAMfteG0+m2KSbawalgaaaJ34Cw?=
 =?us-ascii?Q?EkjysSKAxzi+9WsTalbvWvO8qspp9WSa0CJ1mkagYIdgw7IANMLgA1M+6kQN?=
 =?us-ascii?Q?j9zNugpYCssXkD88fq/2p3bSECync4xqNwpgwAFY2XCp+1pBd6A9TqiqdbA9?=
 =?us-ascii?Q?CzdwLLZgr3DLJ1e1uFhvFTPx1zzdqY0lhi6MYcw9s3eK8GmWT/RXEDhoTB7N?=
 =?us-ascii?Q?CRGEClUFGspqg5A3ybYSbOzNj/qRmy4Cvq54QQJUJPFvJnmZptUaRWuBgCU8?=
 =?us-ascii?Q?tuuCH4DCvXF9oFwupaYmCDG+5s0Ebu3wJgFH8PbPwHvsLtlZrAT36p1jQSHu?=
 =?us-ascii?Q?7v8IZE7pGjquS7yGh4mYWzJk61MKaEGAq0Msh12pF6SI72wnXH3Pd7fGZuWF?=
 =?us-ascii?Q?hozflaZozdC4D4NDs1p3zTdpg8fYYHKNYhoLxp5K4D3NZJOSYFGr2korDxKu?=
 =?us-ascii?Q?RcQhVx3ZkZuYSHJfzexrTOUNQaWPfy51gIw2PosipLK1VNwCunm/a7gynfLX?=
 =?us-ascii?Q?gWVomJ2z81cm0RiDG0XFE2pH5n8IyzzUXvqwqLqYMyvqh07k+hNMRoIxQLOF?=
 =?us-ascii?Q?7kAY/DGG3IQuuLW30NwelDZf3NOrhVVbk4JovvehReznhKOJsgl7R1xoAwM2?=
 =?us-ascii?Q?+dp6bbYgaw4DkdKE0IeVajVuZQEOcq7AebeaqPoXZ53FJcn9j80eCHFWobuo?=
 =?us-ascii?Q?upxfw7riVDoi24WbiQ1GmKB0n28eH0d6mNzq1EZUDljXPkvpIjjNoGei670U?=
 =?us-ascii?Q?n8suxL9ilxnalepoKIUcDRsAaNa9R8hUi889UhXuiM2TTvklGuJBpl06cl91?=
 =?us-ascii?Q?9ROpbeI1mK5pIitmrr4SJDdQcEn0Bi+64JJB2J7Y3gV7eclSKWQtEhJ1Gm4Z?=
 =?us-ascii?Q?Ionc+bNDUOGFHOIge7wYAfMYj8horTJKE5ScAHAzRXsYl9l5dryE3ufHBlmw?=
 =?us-ascii?Q?d7Eq/Lkut9tnyeKX7CXWnmoG3VXQdwowSl/YOwmk2wijaAOGzs35zGc3AkRR?=
 =?us-ascii?Q?O3UWHhQWT8hpWhVHf3/cqVRJnVisFm4509uHrRhBycnIOkc3cFjLbuDOffPt?=
 =?us-ascii?Q?w7q5uwjimIjMQvOhpOJtDu/Vis+OhX+O6MQLnu04hf18HwcaL1bcy9ZGrSzp?=
 =?us-ascii?Q?7d/drvq/Bk+dqdiXWql/cRkZNu6pWVOFCIyruq0186QnwDP+nJDYDnKoHM/B?=
 =?us-ascii?Q?W1jt0+/VoT69CS7VDLJbEu+Uhn2/MPdcb6q7sC/URVKs7/7nQMcqassKye62?=
 =?us-ascii?Q?SXrcPXMI9ELJVjqI2XAx4YtUBIfKfHSKneLs6DOKDgBuKPrQ2T8PDLYegdG/?=
 =?us-ascii?Q?f5OBECsY1rrzez1yUD6XpwExNj5zEshigJkxJsy0pue5yX++rYasGX3g8Gn5?=
 =?us-ascii?Q?CuoIQb15FGEbwJrNm2vJT1WH2V/qUTyQGQtRjjsKqltWtZbX2lAU9sROnqkN?=
 =?us-ascii?Q?/1JjJbu83CC55KbmBdbHTWgeE2q8LRP6SF1oqJ0KqZh3njzq27PL0iO1L1yf?=
 =?us-ascii?Q?p4sXAXO8I1RPbpjuh8iXlehxvB2lIddax3tsnlCb/6zBc/u5usLBuzm/j/gi?=
 =?us-ascii?Q?kQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a1f9d88-930e-4fe4-32e0-08dcce166b27
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 01:51:26.3070 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tiycn9BSdzgZ2fhQQhQqRe29/R2O6j1WsyD2hVi66I54JO1f8wDC/u9VDVyyqxWaP+tHsMSok/fOUcJFKWLxOPV8ENCcPa1evjKiTzzGYcY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4806
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Sep 03, 2024 at 05:21:08PM GMT, Matt Roper wrote:
>Once MMIO operations stop being (incorrectly) tied to a GT, we'll still
>need a device backpointer for feature checks, message logging, and
>tracepoints.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

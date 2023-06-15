Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D11EB64D9
	for <intel-xe@archiver.kernel.org>; Thu, 15 Jun 2023 17:52:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5F2510E0A0;
	Thu, 15 Jun 2023 17:52:03 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7C1310E0A0
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Jun 2023 17:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686851521; x=1718387521;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DLGvFexNRuYaB/t46soiWSd48b8zB6LagMb7VT5O1i4=;
 b=kIE8r5//MSm+eii8vPh7UxcMq2ZbftkjFhsXbXGo1IFwUKNMb4+RyGdQ
 hk1gjyyl4NbIYGNWjVfgpt+o9SI/Qicg4UrkbkDxOyR9mNzjFjt/C0ujh
 9n9qqvpc+5xFBhjah4D0NcLBtwUa4ZflB2kT+yi0vl8i7O5ChdIqITzeR
 XHFxZSmevCqyaQD0/yMZ2eBHagAHHEmljkW5GO/7r/IgRvHsnD6yxcKQc
 7VH/SrwLF7Jp8DtGcHHHanOxsqa3Wy6EsqJLftbAFGM4Z2ijvSSXcO2Ky
 bK/t/LY4zjm5rBkWOMqlvolN/zaOvotYQc2VIA/yWDnToO1NuhDPFdOW4 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="445368300"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; d="scan'208";a="445368300"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2023 10:51:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="825377209"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; d="scan'208";a="825377209"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP; 15 Jun 2023 10:51:05 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 15 Jun 2023 10:51:05 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 15 Jun 2023 10:51:04 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 15 Jun 2023 10:51:04 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 15 Jun 2023 10:51:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DIPCAGw8SKr4x9qVPn2miPYdQqDI69/4HZsQY9hexf4casM2kFjzqL8QQfjhRF7/n0xSL7Y2DTg/+cVw0uZE1uGnRt/rDN2oPGS75lnA9JzBjHtaGl22V12P3rH6EH5S4QwRhgE0bIlCWKF0JDv6waQNA2UaC2/dfsqOv1wUEv0LBkZMxLXobdhPj2l1gnTbavn7a9RNj7gK+rMzrwgJuP5kfJb0lnxlySMd81B+OFkEiKiZyh565wo4B6LAGS/MR6gAchJBYjgHreWynvdReYereEmyHk5kmVZxfgWqMH60hSJGI2PvZE9v2Fg64mU6nJz5nP6zhurE3U/mm0B96Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GTQwa1C+x3XGMYVr1pCVMUcE0tUO8ooWscJl+kv83lU=;
 b=ggFx7+qsJh0wv+9gQ7R+NX8gviRcIOHXDdUkMNxjiTQAShpKFCQ1Ckflet1TF+uCog2Ab66wFheZMELYcVoTndCkTr4c+gidyUipuUkbR8aDmNPQPbh+eV3tp/7yWYYZZR+uQH3GFnZeTLp8boaZ+nsJDDSX6LWKu1Egz0dnT7i160qTngVjfv0RXa8gqcJxTgMW+gRXW4dfcMY6e774ji/G3OYVslWGA/qQXcFxBCxpohU6QDGvUQTDeIpm/B07CSERAvX5KJ7e+BhHdKZhR1bBLRfGu7wjqgq7fpYmyM4jmBQWfFcFspwp6bx7gTzbZtPCSxU2OXpQp3Wx2/APTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB7086.namprd11.prod.outlook.com (2603:10b6:806:2b3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.46; Thu, 15 Jun
 2023 17:51:00 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%5]) with mapi id 15.20.6477.037; Thu, 15 Jun 2023
 17:51:00 +0000
Date: Thu, 15 Jun 2023 17:50:29 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Message-ID: <ZItPZXvkpup8jApZ@DUT025-TGLU.fm.intel.com>
References: <20230608050333.37581-1-matthew.brost@intel.com>
 <20230608050333.37581-4-matthew.brost@intel.com>
 <ZInzzIxdAQHJ9KGQ@nvishwa1-DESK>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZInzzIxdAQHJ9KGQ@nvishwa1-DESK>
X-ClientProxiedBy: BYAPR06CA0009.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB7086:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ed547f4-f3f5-4b9b-a1e9-08db6dc91437
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cXCwH0vapyy3k/fA64nOTmg/yUsfw0sUMcZw3k9Pl09o/WJCeNqI2FAs8nq5fCUZxAvnId4P5dzYNZArKZTtZ+HedUOAeMnaC5aK0LkRvYKPIKsqkdjSk06AHgOQ/DO3yb/amPPJbMEkxYJpotji7byMW1PdQibXLAVuu1CvIz4kFuWYMoHy74O5ipx/gU5pPUBYx7cU+7Kd7xFk2AOAtEMUrhYAF7+36uIdPwoINfib7fCoDxIn1xgAabrPJMZEC/qtD9T/tXwxQSPod2sR2meHJfXgWkBoZShIQpuxiwaisfSZQ4NYdntc6LVpTLicz1HSEqEZdWbywwqVi1GdDGqx2xPbgi1nVAGZ72VkyJnO//PY3lCNgqFSSw4FExUJ3E7KtzuB+kxfHsgQLQXudAnhPsuLP8HytJS2je5IM4Uxe87KCHUyUtYgcDCu+20JB2EdmLaNBOmxyGki1BrUiiNTv6e9iRIa+j0U+kDjxs4XsNZ+3H6iSUda7jspIOIy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(136003)(39860400002)(376002)(396003)(346002)(451199021)(66946007)(66476007)(4326008)(66556008)(6636002)(186003)(478600001)(2906002)(4744005)(8676002)(966005)(41300700001)(86362001)(107886003)(6486002)(6862004)(316002)(6666004)(6506007)(44832011)(8936002)(82960400001)(26005)(5660300002)(38100700002)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yZMwNsFnsGyKrwJJHy48kM5V2TFsCRF2mjvy/jPntgarO8U+qmN+3cm1X1QT?=
 =?us-ascii?Q?Muihe4jLPzb4pJCSuuKb1C1eZuocV4mo4PaDpy/BMZIpvKcbICNPCDx1JoqJ?=
 =?us-ascii?Q?tlucmxB9gtN1Fjm0oLZ/qATWbPuLiiSWO1FV/PBeQaF80+QoywFW55jJDByh?=
 =?us-ascii?Q?u+hNV0fwYdsdeRhlnhYVhu5YbE7SEBq7yh7LPMCw6MQsg/9L7afRzILz93sb?=
 =?us-ascii?Q?1aKmrR9Y7Ah+2vIHbHghwtjEXs1Dn6seWi4OTFEFIKh1g47lFaxJPix7eAzF?=
 =?us-ascii?Q?wh2LE4RO71lhtIQrf8ZHjw7EtFIS1WfbZ6u9097zmGRTm2lT+YMMzXgpu7aH?=
 =?us-ascii?Q?D+KSRXlTKTSaZ7I2nFa5hyvB94iooYUT3Ty35L3plfo2hpUswiipxYOP2mDe?=
 =?us-ascii?Q?LfaBUobm/WgLDnF+iuwI4WzrSD/Bzzu0rd1vFfG/ei8aG+3bVKBjZcgz7CE/?=
 =?us-ascii?Q?MjRsmxWpCJEVPSO6O864aN3qPHOR4Zzm6Z1PGBthqZX2kh1kEB+UKmypPpQF?=
 =?us-ascii?Q?rYr2OrzhadvfyGs32cZhgwKikpt/n6UQLsoSX3SdE5c26VZGUBHfJYhkoSIY?=
 =?us-ascii?Q?wpsNq/SDz/IRS46ehGRpjICipPHFzXZTLrU17iLWv+FdH0G7vonp+dlV8DYX?=
 =?us-ascii?Q?rNcsVoohksV6ZM5m0nvy98aBusnw6NpugYL1+cRa0I62zc69bErLppPfkdHD?=
 =?us-ascii?Q?W16YS6KdKFtlrbg1E7JEYqeLXu9bFuOSAtLrt60YhQfDrrZZ7PdKxckn204m?=
 =?us-ascii?Q?ujcSDL1tF5adb4Bxn27FFtjwGSt1y48VQ1dQk55W+rf9syoLPaSGHtoa4ygV?=
 =?us-ascii?Q?ttctXlP9DcZ6yR+Iv0JWddUpD91t47mD4YydkgvpIWA47zVXZSabZzOMZiJH?=
 =?us-ascii?Q?nAOst0XfUg324luSG1FYdXaPUkI1h/mf40vQfIwXq+ptCkyQVqnlRsB6uDZM?=
 =?us-ascii?Q?1TaLfLM1FhbxP82vNyem+PdCMbVUYX1Zb/WP4hHGvUMK22naCNA+k7KfNktz?=
 =?us-ascii?Q?Hr0qDySEYQJQDOt3ehPkUymasL77xWI2QyJ5L75D+s2kPeApBwnf+175BGsS?=
 =?us-ascii?Q?i8tzeYrMjZDXmaQBMRhzKicIOpcqNz/edRgNbpbInoyGzBZ4QHMGKt+gsOoD?=
 =?us-ascii?Q?1LiiC/of1i5+NF+LLwVut4FDg0bIKKRLlgrANdsiO7rjRs3HAlDmnkPrH06D?=
 =?us-ascii?Q?Q5ZwZSXO4tq6qsWxir7NnAtnDj7v6j/+UfiRgoYFl7s+uphzlhIN//jmQyfH?=
 =?us-ascii?Q?TESkBh9CwEOfvVD5JBXael3rAmXOrM+Jaz6Z7fkXjC5bqMHI6gadmZeym1Up?=
 =?us-ascii?Q?8AX59SKU3qWdDR35ZqZuadvmlm1wFJ5OQJ1hVp3bunkj61ZsdE02v2XHQrRD?=
 =?us-ascii?Q?rzLnkXUcSSr+r/kBBPKHWewyxrbpNGSq/t3J7ePO1f3ud+YG8WSQhdbOGGiZ?=
 =?us-ascii?Q?cv06ta2ZdlnKHVpTmq8Zxc5gbP7bOqS0WIyAaWdmb2WVNBnmwDqs7G8m9hiu?=
 =?us-ascii?Q?zC0Km2mJ40GDPLbnrRJ3i2meBSi5IPlPMcVV9Zmmq18n3V9FgrfcQM9ckBZ7?=
 =?us-ascii?Q?bn/nSA73SvKPD9LcXbW0bUEzj7obDjjMAUExyll9IEaVEuDmY+nQy9q4XlJD?=
 =?us-ascii?Q?kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ed547f4-f3f5-4b9b-a1e9-08db6dc91437
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 17:50:59.9797 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Qflkjm6/KepvU4TVbzM3OrVMP0ccWeEpdBApevSoSKBm5eTWKKku7atrJ8ghVUsclgDrqyejOgkixBdthxSmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7086
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/3] drm/xe: NULL binding implementation
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

On Wed, Jun 14, 2023 at 10:07:24AM -0700, Niranjana Vishwanathapura wrote:
> On Wed, Jun 07, 2023 at 10:03:33PM -0700, Matthew Brost wrote:
> > Add uAPI and implementation for NULL bindings. A NULL binding is defined
> > as writes dropped and read zero. A single bit in the uAPI has been added
> > which results in a single bit in the PTEs being set.
> > 
> > NULL bindings are indended to be used to implement VK sparse bindings,
> > in particular residencyNonResidentStrict property.
> > 
> > Suggested-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> Also, do we have IGT tests for this?
> 
> Niranjana

Yes, https://patchwork.freedesktop.org/series/119080/

Matt

> 
> 

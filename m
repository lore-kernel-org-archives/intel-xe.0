Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0EDDC021A4
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 16:29:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B3DD10E464;
	Mon, 24 Feb 2025 16:29:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Eej8Datx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3198F10E464
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Feb 2025 16:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740414595; x=1771950595;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=XP+HIegZzbtYuRCMf9VQ0HJf1VglDqsH5NMkW+pbeq4=;
 b=Eej8Datx5RI0JqZBak3vhrSAzYtxarn3tt+7XruwMrZTTKWuzT8sm2jf
 /BhgzmvAZjxPfc5xKcvrq+N4XuH/7cb3OUF65DwwhLDHbwc7UXimEK0Ar
 w2dND50Ln/Bc09HT1PzS9Aoj5xb9hAKrnnxYYg+/f+G7BSErbikvamLNR
 3SrkpkZvipkSVis9o9P8OiYEFW8/LOr4/QPSfctBFFWW9r3hb8BH8BYCB
 GXrzslTQEsTcAKmS2lJ2cl6tsEf4u6DGy/KHgjkZULw3qmthsgbIIawXK
 UaE8efyRJTihiiiQe3CUJsZCspx6mJeWzKp+YwnSNUmfPMqOHEUye0lvi Q==;
X-CSE-ConnectionGUID: E7QzY8FNRTmQmrbkL4tfmQ==
X-CSE-MsgGUID: O8juOdrEQj6XUcgailHO3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="41197028"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="41197028"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 08:29:51 -0800
X-CSE-ConnectionGUID: yhxxMQBTQ7Cl6ZK5oNxAWQ==
X-CSE-MsgGUID: 1Hwlu6CiQSyqpAS2qW17bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="153314962"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 08:29:51 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 24 Feb 2025 08:29:50 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 24 Feb 2025 08:29:50 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Feb 2025 08:29:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gxmL5zN7gI6roaxX0HZxVzMNga4HJcyMtCJa/GEqtmhMM9+JKlS1DanP5rrEqJJD+qxeYRKrBjpoT2brIO7uWZ/PBgYoHx+TBtPug386Z+SMGPzy7G4f1jwsm56zfdyzSjW2q6Licv3toxaRbERGU5PXWaf8iiNSXZk2SHDTeU1ut8jjf64hyiHG1zOi5tNfWi8CiXC2dVjgKQ+IYbiXBaw+Qy4D3pxlFRb4+AQI8nRxfhVbPGSyJMY/su+ExS37+l5y3fiJksqf2pGOxamPk974EnM/AQJMGoepZf7QE9uRreh/3zhrtFE0wtPkt7bBAOsW5ztOTzVPluW4nxygeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vasyAmjTFndpOjDpRuDXbfRJ8DGuxOjzipuen6psuCM=;
 b=bMP2Anzjw+PWgomfZ53sgWSLQ4WuWxVV77L6WNAbbDYFyemerHdfAao1pr8SiHRIrHl5LgjGREfEeRojyMtVDbA4ci/aReVwPNtlEX4uiGJ9vV+iKzUlHCBUn09OHpxfMoCl81FHD81fjJUa2YXZ1EBkpKIyESGxBz7cFamwx2VJr3gF/iFm2bVHbVcCMWK6Pb9S4OWReg92vLZ3/pFuUgrxFyHeQjIWTZocTdfIA7E0xuuCpHAj7LsdgJqY1JDVprsIBfBaYBL/k3Kgp56wl9qEHBUxk3YhCjvcXxnbKHZtugIhbfwequ37WLGMO/lPVWsq5fGelzVgRz8D4CHAEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB5890.namprd11.prod.outlook.com (2603:10b6:303:188::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Mon, 24 Feb
 2025 16:29:33 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 16:29:33 +0000
Date: Mon, 24 Feb 2025 08:30:36 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.auld@intel.com>
Subject: Re: [PATCH v2 2/3] drm/xe: Userptr invalidation race with binds fixes
Message-ID: <Z7yerE+QOJRVwX0+@lstrano-desk.jf.intel.com>
References: <20250224040529.3025963-1-matthew.brost@intel.com>
 <20250224040529.3025963-3-matthew.brost@intel.com>
 <e5e829157edf3f4e1f4ea3178216ba400ff6f314.camel@linux.intel.com>
 <Z7yLDpCcS6jGBM/w@lstrano-desk.jf.intel.com>
 <2f1e88d3a2e6041a49684025b037f2ee4098a369.camel@linux.intel.com>
 <Z7yRtqjxmFUcTWVG@lstrano-desk.jf.intel.com>
 <5514d8b6b2305581014fcfe178e40449758c1e7f.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5514d8b6b2305581014fcfe178e40449758c1e7f.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0057.namprd04.prod.outlook.com
 (2603:10b6:303:6a::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB5890:EE_
X-MS-Office365-Filtering-Correlation-Id: 9943f5ed-e0c3-4a3a-ce60-08dd54f06b9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?bRPuvamEQG4Di0H3TYT9TIb+BT0xSbotsTk4izKk/D8NXS/7ITNlhDVGva?=
 =?iso-8859-1?Q?ShzszPKZRMOXfnzI332HhFdhDqe7QGi8vEndP4EOKcb1ca/MxCeprrWY4V?=
 =?iso-8859-1?Q?iTO52ZfAr1V1m85JYHqhocegPdcD6NUZpS3YiJKSvxdOCDuyg20wK+tsO+?=
 =?iso-8859-1?Q?ax5ZRNEenxQdhOqOvWUjGp2zBmIwVniNiPzZ21Wylm+svglYzNPWZMf2Tm?=
 =?iso-8859-1?Q?c0NY7O2Y2SEQseSZ4gyqoQT4MCxWFGDblaVJWs6CkgG26aCdNv62dxEUwq?=
 =?iso-8859-1?Q?czuIG+aMixtDEMSD1xVvxCpHz3jPIU4jVfFreCQ+m9gnQbghn7H0IfpZzv?=
 =?iso-8859-1?Q?jEe2SWcLvK7FCcRE2Mb5pNIxO/7ArT4ack/jd4PZJ4tp6OX+zUYd3nVa/V?=
 =?iso-8859-1?Q?RyrhdykLOymJUxOMbh0ByoWjoLsMl4l0AXNBKPw9VP0cSXQvT5CdALYF6e?=
 =?iso-8859-1?Q?B7nf6K82XzSUXmeXLBRtsRVz1FueWbPHwHKMCVyOuQpHapqEX35oOeoS2N?=
 =?iso-8859-1?Q?iYFqOrIxZQx/ADEd86wILpTdji/gVw+b4vQzv7BRuiq1lSG1+tz/AdU+L/?=
 =?iso-8859-1?Q?IcNzY7mB/jVZ/n7zKD6OjSKfB97BFaqp/qmMZSPCbSmAwZOoJnhzlnzdPJ?=
 =?iso-8859-1?Q?GF4hMDVRmntvVGui6bP+g9435TsQlEOF1t/fnaKk4+wSS2LiJGc4Z9fAEC?=
 =?iso-8859-1?Q?9N20V8TdMvZFVtTpR7gNOhHGqarO5RHoh9COkMvBe/zphJ1QIVHGJ6yv/Q?=
 =?iso-8859-1?Q?NLgbL9o9CpkE/5ZfpVgfcG/JFSzTFMEnCmsuMe7K/E3eK0X90HLys6fWtW?=
 =?iso-8859-1?Q?G5tqUx54S9ddx/p3RHVQRRtvmVEO6NSA3wm6VmIf5O372WqY9yFqxM5uEw?=
 =?iso-8859-1?Q?8gkEiztzQveWGkbKW5hFxQDB1xa2xMeTe0DfWHVXT/x7+hpQQ3pIwhsuP/?=
 =?iso-8859-1?Q?reL8U79W3KMktXPIKPlu4N8pL/L9uDMNfRonjwIrtCiNTb0enPZsCRBX5F?=
 =?iso-8859-1?Q?URCVzggQ6VIKssMpegQX0QQrKEs8ei2MPp1bNMUGEBpVk4JwC4m+WHu7g5?=
 =?iso-8859-1?Q?ryNS1mfo4oR19OIuztRUWF5vlVEFUdjLltF/avtiwbO2MUNvVGQii4notz?=
 =?iso-8859-1?Q?qSA6hoHTtnPGF/d9cOoKptaAQRIalHU+0zmHB5Lx8U678dZmCBBqSFeGLk?=
 =?iso-8859-1?Q?hZR7lBg1G98JjZ+0BmqUvJ3eoVr0Y0JL2OrXefuLkSNss0JK8EJX/alDAH?=
 =?iso-8859-1?Q?99BNWXSpb8tKu1qC77GmXXYOH2Ul5Om+gvdSyFDE/ShiahPL3gCVew0vko?=
 =?iso-8859-1?Q?nw68X7elCfpwdpC4GpINKL7BLuqrqeSsjRerYpwIkmcoOANVAsHR6qOw7g?=
 =?iso-8859-1?Q?T6Kkrfdl/KGDP3xkeH/vEzs076S2q31TQcQHssT5yU/l9gWfSjSe97OFn/?=
 =?iso-8859-1?Q?5+tDTI4EkzyLb+Uy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?OB41BxfUNcLc9XRxAYJZLY4jGlcQvJl6hCVA7ZP8cfmUpdSF88Ls0Eebz7?=
 =?iso-8859-1?Q?AoR/Z1MH//pgEGNxfkyzs/JKtDHCNNOAGEhGwYdQn01veG+zFqaJ3uiV6P?=
 =?iso-8859-1?Q?I/tjcIe2qbuVXaqy1+6oe8C1GsO2lxCerm8aoRhT6cjyXp7GSWNNWrd0FI?=
 =?iso-8859-1?Q?2Qb6MTDTdnq86VIJRrsxe/7nOMVta+Aw+lBEclj6YVcn4t+PWBmYiAbYfZ?=
 =?iso-8859-1?Q?1O3imLBcgchAG8JVvwvdnh2Cxc4PUaioYArO5PLG7Xi1I68fR/cJIGbS1i?=
 =?iso-8859-1?Q?fCSq3SGpwfw1XA4cDczZBJi1a6/JFguKyDhq81S3JhbDyjfh3a2NdBz+Bf?=
 =?iso-8859-1?Q?OkYWSswJC7hOX5uWf1dEZS4Lv4iQf+pHd8gMGuXcwRaICn1zYb3NRxcBkU?=
 =?iso-8859-1?Q?qpxEdROmZOVinsR/nO3gzLM5E6G8HCauX5r21nVObLXTsn/KEC7CeJfh9r?=
 =?iso-8859-1?Q?kRw2phrMhWnjiZzC8G4JeNjfatv69qE7XsN9qxJwP3l756gWL3zkn9ndz1?=
 =?iso-8859-1?Q?iKkFar/WWWso2kThzDqbihWNerMdJNN471TjIrmSm+iD2DCtSJnueXeLQ9?=
 =?iso-8859-1?Q?WUMSWaHHqIk16d7d2RCWc+WXUnqKsimcSnGHReqVsYqgtWy6SWOndfrgV0?=
 =?iso-8859-1?Q?xrdy/sl0gx+eLeG2ZJu1tHOD+092rdtJfin7teRPQ74FjfyS0lK+sqsZrA?=
 =?iso-8859-1?Q?oydZk/UJoDx0TTaRKpSU17mDyH9eoZ/aQchiTORD0grRGOzfzsONt80sxT?=
 =?iso-8859-1?Q?KCto0NWK1hcJQe365ZIwJmv+rBA00MxshmMN/+rubV6DAc4fL3yo6JqmuZ?=
 =?iso-8859-1?Q?5M5+b91XhzZ7XDYVZ2OjLXbDnwO0Q1k1OfccMs268d4Z6HGSMnJLEg3pjc?=
 =?iso-8859-1?Q?obSNVCtZbp9fpORtGiix7hkJ8RVTarXf1MHXibX520s7W024PZn/XCrr5v?=
 =?iso-8859-1?Q?RnMjqCN5gNMcb6procliHCOIQGPqUtKAqCzZOKWsqcbkXqKAbzZquqIore?=
 =?iso-8859-1?Q?n98L7wLvYF7nbJ1SRr03l3NftxJ+bTWEPliEAInx8Nas1iaZus92DsfAif?=
 =?iso-8859-1?Q?sDBr2GUDCbbTVeWZ1aCXePAl7O0bS7KSmyDe4k3OYJcyH5xjQhac5Tbrvs?=
 =?iso-8859-1?Q?TLkc2e5psJEhJjhKNMZ0AZxxY8WnErnZ/qbAL6Cqo2tvWC8wfMqEtqctW7?=
 =?iso-8859-1?Q?y4GNRsO7djUWUeSIoFQ4wF2LmzWzoV5AALozAu64Db0IqATWb29aeXgXwD?=
 =?iso-8859-1?Q?54RoXZ873GeuV2Dlh5RzjxxwMlet43ujZSaiOgBmnOiQM9VOniPAyk5Ukh?=
 =?iso-8859-1?Q?y+6INKOA2EsJ4xBbfA1L/9btfrzirxg2L1QfM8cdwMiOTkL0Cr5VYsivYr?=
 =?iso-8859-1?Q?gFU9jcH75c2MMQU46boCH5Tct5Sm31+C0LlmBdqyISCabVn8xRcdfjiQe5?=
 =?iso-8859-1?Q?06OSPEoSxYeRjsmj5wuWuOaNCyublnIVQAc7P/FWHgpjb2qqVcb5o9Igns?=
 =?iso-8859-1?Q?u6/Tdk/D+gOu8x9Gs/kqVKlAXeXizvj/Kr8s9JaOeXI2X/mrStIx5YTnGE?=
 =?iso-8859-1?Q?StDaOuPOB6sq7uhv/vBjytjmjUT+LBp1tLXFuNk/uhiWOC/81YIfmTuJ2a?=
 =?iso-8859-1?Q?bFxVzfXZn4NYryudf4djNo1n1pVcO0ksl7HQu2JuKN7DuRTtFefj462A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9943f5ed-e0c3-4a3a-ce60-08dd54f06b9d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 16:29:33.2521 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0fEQvX0b2iyb4lkAX+IAEAR4jMM7bZogGhG3GvrruwEeCcoBZ1Yxvz0MQO0AuAaq3D4bCewM6v2pLHBfrSSI1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5890
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

On Mon, Feb 24, 2025 at 05:22:40PM +0100, Thomas Hellström wrote:
> On Mon, 2025-02-24 at 07:35 -0800, Matthew Brost wrote:
> > On Mon, Feb 24, 2025 at 04:20:07PM +0100, Thomas Hellström wrote:
> > > On Mon, 2025-02-24 at 07:06 -0800, Matthew Brost wrote:
> > > > On Mon, Feb 24, 2025 at 09:21:09AM +0100, Thomas Hellström wrote:
> > > > > On Sun, 2025-02-23 at 20:05 -0800, Matthew Brost wrote:
> > > > > > Squash bind operation after userptr invalidation into a
> > > > > > clearing
> > > > > > of
> > > > > > PTEs. Will prevent valid GPU page tables from pointing to
> > > > > > stale
> > > > > > CPU
> > > > > > pages.
> > > > > > 
> > > > > > Fixup initial bind handling always add VMAs to invalidation
> > > > > > list
> > > > > > and
> > > > > > clear PTEs.
> > > > > > 
> > > > > > Remove unused rebind variable in xe_pt.
> > > > > > 
> > > > > > Always hold notifier across TLB invalidation in notifier to
> > > > > > prevent a
> > > > > > UAF if an unbind races.
> > > > > > 
> > > > > > Including all of the above changes for Fixes patch in hopes
> > > > > > of an
> > > > > > easier
> > > > > > backport which fix a single patch.
> > > > > > 
> > > > > > v2:
> > > > > >  - Wait dma-resv bookkeep before issuing PTE zap (Thomas)
> > > > > >  - Support scratch page on invalidation (Thomas)
> > > > > > 
> > > > > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > > > > Cc: <stable@vger.kernel.org>
> > > > > > Fixes: e8babb280b5e ("drm/xe: Convert multiple bind ops into
> > > > > > single
> > > > > > job")
> > > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/xe/xe_pt.c       | 146
> > > > > > +++++++++++++++++++++++--
> > > > > > ----
> > > > > > --
> > > > > >  drivers/gpu/drm/xe/xe_pt_types.h |   3 +-
> > > > > >  drivers/gpu/drm/xe/xe_vm.c       |   4 +-
> > > > > >  3 files changed, 115 insertions(+), 38 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_pt.c
> > > > > > b/drivers/gpu/drm/xe/xe_pt.c
> > > > > > index 1ddcc7e79a93..add521b5c6ae 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_pt.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > > > > > @@ -351,7 +351,8 @@ xe_pt_new_shared(struct xe_walk_update
> > > > > > *wupd,
> > > > > > struct xe_pt *parent,
> > > > > >   */
> > > > > >  static int
> > > > > >  xe_pt_insert_entry(struct xe_pt_stage_bind_walk *xe_walk,
> > > > > > struct
> > > > > > xe_pt *parent,
> > > > > > -		   pgoff_t offset, struct xe_pt *xe_child,
> > > > > > u64
> > > > > > pte)
> > > > > > +		   pgoff_t offset, struct xe_pt *xe_child,
> > > > > > u64
> > > > > > pte,
> > > > > > +		   unsigned int level)
> > > > > >  {
> > > > > >  	struct xe_pt_update *upd = &xe_walk-
> > > > > > > wupd.updates[parent-
> > > > > > > level];
> > > > > >  	struct xe_pt_update *child_upd = xe_child ?
> > > > > > @@ -389,6 +390,9 @@ xe_pt_insert_entry(struct
> > > > > > xe_pt_stage_bind_walk
> > > > > > *xe_walk, struct xe_pt *parent,
> > > > > >  		idx = offset - entry->ofs;
> > > > > >  		entry->pt_entries[idx].pt = xe_child;
> > > > > >  		entry->pt_entries[idx].pte = pte;
> > > > > > +		entry->pt_entries[idx].level = level;
> > > > > > +		if (likely(!xe_child))
> > > > > > +			entry->pt_entries[idx].level |=
> > > > > > XE_PT_IS_LEAF;
> > > > > >  		entry->qwords++;
> > > > > >  	}
> > > > > >  
> > > > > > @@ -515,7 +519,8 @@ xe_pt_stage_bind_entry(struct xe_ptw
> > > > > > *parent,
> > > > > > pgoff_t offset,
> > > > > >  			}
> > > > > >  		}
> > > > > >  
> > > > > > -		ret = xe_pt_insert_entry(xe_walk, xe_parent,
> > > > > > offset,
> > > > > > NULL, pte);
> > > > > > +		ret = xe_pt_insert_entry(xe_walk, xe_parent,
> > > > > > offset,
> > > > > > NULL, pte,
> > > > > > +					 level);
> > > > > >  		if (unlikely(ret))
> > > > > >  			return ret;
> > > > > >  
> > > > > > @@ -571,7 +576,7 @@ xe_pt_stage_bind_entry(struct xe_ptw
> > > > > > *parent,
> > > > > > pgoff_t offset,
> > > > > >  
> > > > > >  		pte = vm->pt_ops->pde_encode_bo(xe_child-
> > > > > > >bo, 0,
> > > > > > pat_index) | flags;
> > > > > >  		ret = xe_pt_insert_entry(xe_walk, xe_parent,
> > > > > > offset,
> > > > > > xe_child,
> > > > > > -					 pte);
> > > > > > +					 pte, level);
> > > > > >  	}
> > > > > >  
> > > > > >  	*action = ACTION_SUBTREE;
> > > > > > @@ -752,6 +757,10 @@ struct xe_pt_zap_ptes_walk {
> > > > > >  	/* Input parameters for the walk */
> > > > > >  	/** @tile: The tile we're building for */
> > > > > >  	struct xe_tile *tile;
> > > > > > +	/** @vm: VM we're building for */
> > > > > > +	struct xe_vm *vm;
> > > > > > +	/** @scratch: write entries with scratch */
> > > > > > +	bool scratch;
> > > > > >  
> > > > > >  	/* Output */
> > > > > >  	/** @needs_invalidate: Whether we need to invalidate
> > > > > > TLB*/
> > > > > > @@ -779,9 +788,18 @@ static int xe_pt_zap_ptes_entry(struct
> > > > > > xe_ptw
> > > > > > *parent, pgoff_t offset,
> > > > > >  	 */
> > > > > >  	if (xe_pt_nonshared_offsets(addr, next, --level,
> > > > > > walk,
> > > > > > action, &offset,
> > > > > >  				    &end_offset)) {
> > > > > > -		xe_map_memset(tile_to_xe(xe_walk->tile),
> > > > > > &xe_child-
> > > > > > > bo->vmap,
> > > > > > -			      offset * sizeof(u64), 0,
> > > > > > -			      (end_offset - offset) *
> > > > > > sizeof(u64));
> > > > > > +		if (unlikely(xe_walk->scratch)) {
> > > > > > +			u64 pte = __xe_pt_empty_pte(xe_walk-
> > > > > > > tile,
> > > > > > xe_walk->vm,
> > > > > > +						    level);
> > > > > > +
> > > > > > +			for (; offset < end_offset;
> > > > > > ++offset)
> > > > > > +				xe_pt_write(tile_to_xe(xe_wa
> > > > > > lk-
> > > > > > > tile),
> > > > > > +					    &xe_child->bo-
> > > > > > >vmap,
> > > > > > offset, pte);
> > > > > > +		} else {
> > > > > > +			xe_map_memset(tile_to_xe(xe_walk-
> > > > > > >tile),
> > > > > > &xe_child->bo->vmap,
> > > > > > +				      offset * sizeof(u64),
> > > > > > 0,
> > > > > > +				      (end_offset - offset)
> > > > > > *
> > > > > > sizeof(u64));
> > > > > > +		}
> > > > > >  		xe_walk->needs_invalidate = true;
> > > > > >  	}
> > > > > >  
> > > > > > @@ -792,6 +810,31 @@ static const struct xe_pt_walk_ops
> > > > > > xe_pt_zap_ptes_ops = {
> > > > > >  	.pt_entry = xe_pt_zap_ptes_entry,
> > > > > >  };
> > > > > >  
> > > > > > +struct xe_pt_zap_ptes_flags {
> > > > > > +	bool scratch:1;
> > > > > > +};
> > > > > > +
> > > > > > +static bool __xe_pt_zap_ptes(struct xe_tile *tile, struct
> > > > > > xe_vma
> > > > > > *vma,
> > > > > > +			     struct xe_pt_zap_ptes_flags
> > > > > > flags)
> > > > > > +{
> > > > > > +	struct xe_pt_zap_ptes_walk xe_walk = {
> > > > > > +		.base = {
> > > > > > +			.ops = &xe_pt_zap_ptes_ops,
> > > > > > +			.shifts = xe_normal_pt_shifts,
> > > > > > +			.max_level = XE_PT_HIGHEST_LEVEL,
> > > > > > +		},
> > > > > > +		.tile = tile,
> > > > > > +		.vm = xe_vma_vm(vma),
> > > > > > +		.scratch = flags.scratch,
> > > > > > +	};
> > > > > > +	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile-
> > > > > > >id];
> > > > > > +
> > > > > > +	(void)xe_pt_walk_shared(&pt->base, pt->level,
> > > > > > xe_vma_start(vma),
> > > > > > +				xe_vma_end(vma),
> > > > > > &xe_walk.base);
> > > > > > +
> > > > > > +	return xe_walk.needs_invalidate;
> > > > > > +}
> > > > > > +
> > > > > >  /**
> > > > > >   * xe_pt_zap_ptes() - Zap (zero) gpu ptes of an address
> > > > > > range
> > > > > >   * @tile: The tile we're zapping for.
> > > > > > @@ -810,24 +853,13 @@ static const struct xe_pt_walk_ops
> > > > > > xe_pt_zap_ptes_ops = {
> > > > > >   */
> > > > > >  bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma
> > > > > > *vma)
> > > > > >  {
> > > > > > -	struct xe_pt_zap_ptes_walk xe_walk = {
> > > > > > -		.base = {
> > > > > > -			.ops = &xe_pt_zap_ptes_ops,
> > > > > > -			.shifts = xe_normal_pt_shifts,
> > > > > > -			.max_level = XE_PT_HIGHEST_LEVEL,
> > > > > > -		},
> > > > > > -		.tile = tile,
> > > > > > -	};
> > > > > > -	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile-
> > > > > > >id];
> > > > > > +	struct xe_pt_zap_ptes_flags flags = {};
> > > > > >  	u8 pt_mask = (vma->tile_present & ~vma-
> > > > > > > tile_invalidated);
> > > > > >  
> > > > > >  	if (!(pt_mask & BIT(tile->id)))
> > > > > >  		return false;
> > > > > >  
> > > > > > -	(void)xe_pt_walk_shared(&pt->base, pt->level,
> > > > > > xe_vma_start(vma),
> > > > > > -				xe_vma_end(vma),
> > > > > > &xe_walk.base);
> > > > > > -
> > > > > > -	return xe_walk.needs_invalidate;
> > > > > > +	return __xe_pt_zap_ptes(tile, vma, flags);
> > > > > >  }
> > > > > >  
> > > > > >  static void
> > > > > > @@ -1201,7 +1233,46 @@ static bool
> > > > > > xe_pt_userptr_inject_eagain(struct
> > > > > > xe_userptr_vma *uvma)
> > > > > >  
> > > > > >  #endif
> > > > > >  
> > > > > > -static int vma_check_userptr(struct xe_vm *vm, struct xe_vma
> > > > > > *vma,
> > > > > > +static void
> > > > > > +vma_convert_to_invalidation(struct xe_tile *tile, struct
> > > > > > xe_vma
> > > > > > *vma,
> > > > > > +			    struct xe_vm_pgtable_update_ops
> > > > > > *pt_update)
> > > > > > +{
> > > > > > +	struct xe_pt_zap_ptes_flags flags = { .scratch =
> > > > > > true,
> > > > > > };
> > > > > > +	int i, j, k;
> > > > > > +
> > > > > > +	/*
> > > > > > +	 * Need to update this function to bypass scratch
> > > > > > setup
> > > > > > if
> > > > > > in fault mode
> > > > > > +	 */
> > > > > > +	xe_assert(xe_vma_vm(vma)->xe,
> > > > > > !xe_vm_in_fault_mode(xe_vma_vm(vma)));
> > > > > > +
> > > > > > +	for (i = 0; i < pt_update->current_op; ++i) {
> > > > > > +		struct xe_vm_pgtable_update_op *op =
> > > > > > &pt_update-
> > > > > > > ops[i];
> > > > > > +
> > > > > > +		if (vma != op->vma || (!op->bind && !op-
> > > > > > > rebind))
> > > > > > +			continue;
> > > > > > +
> > > > > > +		for (j = 0; j < op->num_entries; ++j) {
> > > > > > +			for (k = 0; k < op-
> > > > > > >entries[j].qwords;
> > > > > > ++k)
> > > > > > {
> > > > > > +				struct xe_pt_entry *entry =
> > > > > > +					&op-
> > > > > > > entries[j].pt_entries[k];
> > > > > > +				unsigned int level = entry-
> > > > > > > level;
> > > > > > +
> > > > > > +				if (!(level &
> > > > > > XE_PT_IS_LEAF))
> > > > > > +					continue;
> > > > > > +
> > > > > > +				level &= ~XE_PT_IS_LEAF;
> > > > > > +				entry->pte =
> > > > > > __xe_pt_empty_pte(tile,
> > > > > > +							    
> > > > > >   
> > > > > > xe_vma_vm(vma),
> > > > > > +							    
> > > > > >   
> > > > > > level);
> > > > > > +			}
> > > > > > +		}
> > > > > > +	}
> > > > > > +
> > > > > > +	__xe_pt_zap_ptes(tile, vma, flags);
> > > > > 
> > > > > As mentioned in my previous email, I'm pretty sure if we modify
> > > > > all
> > > > > the
> > > > > ptes in the entry array, not just the leaves, (that's basically
> > > > > all
> > > > > ptes of shared page-table entries) that will be equivalent to a
> > > > > zap.
> > > > > 
> > > > 
> > > > That doesn't work. I had that way originally but IGTs fail with
> > > > IOMMU
> > > > CAT errors (e.g. xe_exec_basic.once-userptr fails like this [1])
> > > > 
> > > > Let me explain with example.
> > > > 
> > > > Array of bind 0x0000-0x1000 (A), 0x1000-0x2000 (B)
> > > > 
> > > > - (A) hits userptr invalidation
> > > > 	- If modify all ptes in the entry array, highest level
> > > > PDE
> > > > is
> > > > 	  invalidated. Both (A) and (B) either are 0 or scratch
> > > > - (A) does rebind in exec
> > > > 	- We only modify leaf entry, not the highest level PDE
> > > > which
> > > > is
> > > > 	  0 or scratch
> > > > 
> > > > Matt
> > > 
> > > Argh. You're right. What would happen if we don't do anything to
> > > the
> > > ptes, then? It looks from the code in faulting mode we error and
> > > unwind
> > > with -EAGAIN.
> > > 
> > >  In preempt-fence mode and !LR we could instead ensure properly
> > > stop
> > > gpu access and put the userptr on the invalidated list in the
> > > notifier.
> > > 
> > 
> > In dma-fence mode we'd have a window where existing (previously
> > submited) GPU jobs could corrupt pages which have been invalidated.
> > Unlikely but a very subtle security / data corruption issue.
> 
> Agree we should not allow that to happen however small the chance is.
> 
> However, I was thinking of something along the following. I can't see
> any dma-fence jobs accessing the invalidated pages here, since we wait
> for already submitted jobs to complete, and no new ones could be
> submitted unless the userptr has been rebound.
> 

Yes, I missed this. After my change to wait on dma-resv in dma-fence
mode too, there shouldn't anything running so it safe to temporally
setup the page tables pointing to the invalidated pages as we will fixup
the pages next exec. The original code before my patch had this window.
Let me respin this patch simply wait on the dma-resv and drop
the complicated invalidation.

Matt

> Or are you thinking about the iommu issue where we should really
> dma_unmap() in the notifier, like the SVM code does? 
> 
> Or could you describe the race more in detail?
> 
> /Thomas
> 
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index d664f2e418b2..c90c0687be51 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -605,12 +605,6 @@ static bool vma_userptr_invalidate(struct
> mmu_interval_notifier *mni,
>         down_write(&vm->userptr.notifier_lock);
>         mmu_interval_set_seq(mni, cur_seq);
>  
> -       /* No need to stop gpu access if the userptr is not yet bound.
> */
> -       if (!userptr->initial_bind) {
> -               up_write(&vm->userptr.notifier_lock);
> -               return true;
> -       }
> -
>         /*
>          * Tell exec and rebind worker they need to repin and rebind
> this
>          * userptr.
> @@ -623,8 +617,6 @@ static bool vma_userptr_invalidate(struct
> mmu_interval_notifier *mni,
>                 spin_unlock(&vm->userptr.invalidated_lock);
>         }
>  
> -       up_write(&vm->userptr.notifier_lock);
> -
>         /*
>          * Preempt fences turn into schedule disables, pipeline these.
>          * Note that even in fault mode, we need to wait for binds and
> @@ -642,11 +634,13 @@ static bool vma_userptr_invalidate(struct
> mmu_interval_notifier *mni,
>                                     false, MAX_SCHEDULE_TIMEOUT);
>         XE_WARN_ON(err <= 0);
>  
> -       if (xe_vm_in_fault_mode(vm)) {
> +       if (xe_vm_in_fault_mode(vm) && userptr->initial_bind) {
>                 err = xe_vm_invalidate_vma(vma);
>                 XE_WARN_ON(err);
>         }
>  
> +       up_write(&vm->userptr.notifier_lock);
> +
>         trace_xe_vma_userptr_invalidate_complete(vma);
>  
>         return true;
> (END)
> 
> 

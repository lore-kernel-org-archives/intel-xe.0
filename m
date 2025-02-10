Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E91C02198
	for <intel-xe@archiver.kernel.org>; Mon, 10 Feb 2025 17:08:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B53B10E05D;
	Mon, 10 Feb 2025 17:08:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gMdlK0No";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77E0710E05D
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Feb 2025 17:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739207305; x=1770743305;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=/c7WvgumWWxFiEGovxNbKvHZkuz42Lw3hzv5ba4VeIM=;
 b=gMdlK0NoLOXB+F7tt1JU01CXJdHJUbVDp58/fEjk62L8YAWmPHkseGkd
 U1kZrG7xJ5V+96VPdiMsQT0dL7qM2h/OA+AWFNnUKdggwScI4JZZxjgPt
 3DnMrQ3T2AA3rQDXlCvE811wImJoxsGsNaktBuF0oU759J427uSHBNZkV
 WbSkKO0lUYpPVXcG6XFpj2EmA5hrjlDAq6N3SAwEehHrV6VhWh0hy5T+7
 JJKGs1qjMSrWLp00FUx8WwgbB6Gz3iEd6UP6esA0t9cpV0aDuQJpGtas3
 Od5xFjJJk91BmLZknGVmPLVAHy/8IMKatca6d3PtReMSQxtGxXWIWTtUc g==;
X-CSE-ConnectionGUID: DKTnj653RnelvRU+q2f8vg==
X-CSE-MsgGUID: syM9VzcRSImtWUO3UWA85A==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="65151627"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="65151627"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 09:07:27 -0800
X-CSE-ConnectionGUID: 9bImOzWpSxmdFZoipYiaoQ==
X-CSE-MsgGUID: uLCmXmD2RTGcm4uUYkCdLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="143137180"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Feb 2025 09:07:27 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 09:07:26 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 09:07:26 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 09:07:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eZOGGXiJpMRXl0CL7vTBlB43Vlmhsx2MFuCud/gH0wSpVstzQ7BhLxAmNZUMZaWXgq6cWdvygT8Kn/vbl2Mt9lAfJMh4gLCYqxuUVafn1Qc8OE0lo1ibhnGYG3HlK0ilGdjujWyni9ypnF1hz1F/phNO6mmtO6ONIFb3lIwmgos10fBhQbZE7l/PuZZX3MTP9qnzKzo+EmO8TfL+sB/irG6sflmltuFiskKBgUQ1AiXCXXVH7jgCNEIShcXSlPGQZjcjVrG4xt0lTu7wEoJEuRlAzP+clv4VDVB2okspG14j4CxEmafp31DKzPIydH1wEcFdkAaNa8IF0XZhg3GuZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qy+Yr35+1eRAKS4NvM3rti6ycrFi6O698b/CggFbobU=;
 b=a7mHjC6RcgwB/h8zDwx5xRSLEPpFOyhDSR+IBkwq3Ix4bBiKt48hxo27iIVeToSpsg5VckMCSPiHMcpE5Db37vRePfiaS4MsfyO1WPlfGz2LKfihpscnx0OvG4X7qnMsh8LUHe91PEl7EykvCGq1B9pCHMmA8CNbEi095+ZiZMtIUxuUHkOuLbiJq5bXMo/yMM4bhLbc/lUQliA7XzgvINebECMjeddOdrrfZpnPtDFkHAqXeY3XZVSxOoqj/GrCbHT+9wRPr1sTyb3tPoHhsuQAO/4OaiMM1YNnNW17GTczXe4ELQDK9O4wCcIC2FNwLVawMUVXW/oLXQRq2twzBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB8520.namprd11.prod.outlook.com (2603:10b6:610:1af::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 17:07:22 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 17:07:22 +0000
Date: Mon, 10 Feb 2025 09:08:21 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: Oak Zeng <oak.zeng@intel.com>, <intel-xe@lists.freedesktop.org>,
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH 2/3] drm/xe: Clear scratch page before vm_bind
Message-ID: <Z6oyhZmGqemMm4+U@lstrano-desk.jf.intel.com>
References: <20250204184558.4181478-1-oak.zeng@intel.com>
 <20250204184558.4181478-2-oak.zeng@intel.com>
 <Z6SQSHJQL+M8FvA2@lstrano-desk.jf.intel.com>
 <85ed97f350a07e9964907563ca300c9918fb3b86.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <85ed97f350a07e9964907563ca300c9918fb3b86.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0187.namprd04.prod.outlook.com
 (2603:10b6:303:86::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB8520:EE_
X-MS-Office365-Filtering-Correlation-Id: 727a92e2-dc35-415a-08ce-08dd49f56254
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?PiCMAedNJehYSn9jUY1X5dWp752MTjWKVq7KWjv+378Lx71J78Lih07Hkq?=
 =?iso-8859-1?Q?f5twToyQ0lP17vqlbN0PQEgqIEhhm2t0Pw0wdagfeUQr7K7lHRdeUHXm4t?=
 =?iso-8859-1?Q?C4EUA9QJgsgdol48ElOm4g9i8B3GqfHpLsBa67pgu+P1zC1WoV+PJdeOlh?=
 =?iso-8859-1?Q?NLvTnr/vOQH1CQ0q4QAFXAZJDCUewHvNReS6xFFWXISWkGJtQV4f4zPiCN?=
 =?iso-8859-1?Q?3/m8V5g4ruMrXe6D9BVRdAlvLkiGxMJeW/qLhPcUGpc6iEt/+KtaAVUReL?=
 =?iso-8859-1?Q?dL/B1MHXUuPFPmkNspzW52THswPKNb8gLvYb3qPMLAiQBlzopfc+lR1y75?=
 =?iso-8859-1?Q?/FcryIVpsZOIfo7/i6DCHjGXfnknSKhRl8B+KPWfOXNJfySTE+NIZBvWVm?=
 =?iso-8859-1?Q?d6WHnO5isBGzRabWpDTVZ50b4bLVeN/u+laJjHxfFJ4HeWKUkykDu/1rTJ?=
 =?iso-8859-1?Q?mtlgWScjOK4p0VAzU4lwS+4CM7nkYTSqbub/mQ4Q0DBUeBuSxQtkIyeOzG?=
 =?iso-8859-1?Q?LUJedrcsAfkfjCsDT2Q0unyi3B01X2alQ6sPwvYNy4Jj7tsbY2YPhYDuzs?=
 =?iso-8859-1?Q?9Y4iLIK80wnuDdPElrlogvicIvG55hMLxdbNcgaMDGJVjdr8kG0ZUN9683?=
 =?iso-8859-1?Q?4AAyW0JiJw8HxOx61RvGbU4x7yjExpJT+J71wv5/tVhDnvyrleEO+NHC3W?=
 =?iso-8859-1?Q?GUJqZKnEoMqbqxtT4Jxfj+eaQKEECRH88ZrPKxin96/hL7cWkuVTkRye+l?=
 =?iso-8859-1?Q?y0d8qyIv9E/NKPIgwXvDuN1x2RqqiCPSQ18xIJNwHtgmR/wjQtdCjZJ2rt?=
 =?iso-8859-1?Q?ieFrH7NsCdn/6js+XBqre2qBRIzXo7SEa1Uiq8I3lRZYWeZIUB3uiiY/nG?=
 =?iso-8859-1?Q?OXzdzTcNhUhxCMNLmwOjPnTnqNYtbClWk/cJMomsMn7gEN74bmzDl28JS8?=
 =?iso-8859-1?Q?EgT7VVRTgTecOooiomfjDd5verI++POvmNvGN5z4QRBzux0rkY88kptDls?=
 =?iso-8859-1?Q?rrBZOw6AbPm7+NtM/52mQmlBpC2+5ugHux+EY0RYxfmf9clCzjLK3LCLWy?=
 =?iso-8859-1?Q?s/Se1Ayfx3YNmVekK+1oWZDiCo6egsVnUgjfVQSxnwuWyTGb8i0CSYLIAD?=
 =?iso-8859-1?Q?cR6wVWTFX5hleRrY6yZoelztffCs4+QjagxOVqxlCO8SQNXHjWKglP1Y08?=
 =?iso-8859-1?Q?FlCfiScRz5b2JvVqCG15b1j+2afQsiD9xslKVj9tYhiJPLI+ieA3+TGQ9R?=
 =?iso-8859-1?Q?KqOU85euUV5l5ZiEOqQ92cBxV1Gim3H7065qqVFoWgGPEl4Pl6Q4iIyXAd?=
 =?iso-8859-1?Q?E4YC/QjEkqMT0D8v/K0FzZGAl3b3sc7P0wxbJ1ni9/amAdgGCgcbZ4dLsg?=
 =?iso-8859-1?Q?aNZ66W+8jdC2xsyr5Ihb3JhRFDZ+tTmFmLELN/Q1GuC+O5JMThJyC33PMb?=
 =?iso-8859-1?Q?xlfh6Gry2Fyf8YMq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?GpTt751ogmDAhBnRbiG74eyynulcrfdqBGm+POK35msf81eEqP48plR29/?=
 =?iso-8859-1?Q?wOkt5qGKh84gnlFonXjFEjzjDMJ1fAa9G7fQK8MiMBhLVZARBkImBu3uQ5?=
 =?iso-8859-1?Q?Ki7Q9tVX3ue3/b4AzCPoC7aZFqtSiSnVojduJRwkKjaoyjqBOcZDtcsfcH?=
 =?iso-8859-1?Q?M9icSSyhUMUoWnzcQ7WdUiKQxlFSaJcX6G+7JXOSlNbxrqgdQ31cPhK5v3?=
 =?iso-8859-1?Q?DEiWs7Vc1mXDNcb9mATL5AvfZyePY6Sj0HxlooSHRzq2rmhF7xKiigy3st?=
 =?iso-8859-1?Q?IcprhNDt6jv3cpeMFanyU4nS81OfgSaBJMQxOx76HhCKRIBvUtZQ1eX5Z8?=
 =?iso-8859-1?Q?naLvQHbNqG42Y3mm10zxONOYEz3RCSkv+XnEHXkIIEgjAAVU6kboBH/SHx?=
 =?iso-8859-1?Q?Orj9CeUyz+4LVCqCsP7IDUIOJLSUu2r4cWg30RVfWDqaCOrN0hP7QFwXhB?=
 =?iso-8859-1?Q?bMBeva77B/PdFwzklDmFoEMciNZruKiQmVtdM6wxfqTcVEJv56kAj+Ro/U?=
 =?iso-8859-1?Q?G/0Trw2GQbFL6Gql4eQJnEfGlT9ZtOdjAoNu8ZwpDwsu9wdoBEhM5rlKZC?=
 =?iso-8859-1?Q?kaiHxXZ5b3jGuGsPht2tGG7uI40wfS1Abf8mTQaoiVFfYgJb4VTQ24NFQv?=
 =?iso-8859-1?Q?/W5WDkNvfaCGUEe3IvPRIy0BJs2yaPmAsyRX69IpPKt7js0WMLqPjq0mYN?=
 =?iso-8859-1?Q?T/xqs7sXidwd9GR79d3xqIF+CYyEB6Og6K2GokEAh22cg3Lxg/AdH8eQZy?=
 =?iso-8859-1?Q?/hSE5fjveojgpsgIvZQPwxG4C7zOokh+Mq2nQFHS7BHXTXQVFMEnBwZy+1?=
 =?iso-8859-1?Q?+NUa0w1LOlK6O7/gIREHlf2Oo5cw75QnZ/ZGybw7V2myLDgODbwaLvP+8Y?=
 =?iso-8859-1?Q?Gvo8V6IWi65Eh5nrlPwDaAc4uRZfbm+2wdDThgcRijeOlRGzoBIf5lgk1v?=
 =?iso-8859-1?Q?WRHgDb5ooqloBcYnYqgCwXD44bb22cKOqkictBc4iDbroa0TOvm+X1s1Ge?=
 =?iso-8859-1?Q?HbQCXP280FZufOtgK7e7A+2MkOvh8opTaovJeEf3cIr3J0uvnu6KdsluJl?=
 =?iso-8859-1?Q?h0IXdq7X7cmkbvebSBiM4MdgbtTg9QzbUPOrd8+TQvhfYPLUuPbxGDnW3H?=
 =?iso-8859-1?Q?+iAchOOQH6d4JFpAZOOi024VKL+cSEv4LyA6IToUC9SfP/GXHv/jz8vdc9?=
 =?iso-8859-1?Q?KISNUtITTkdvFIbarBMlzP6zgE0Pk1TWJHwujNpG9yPg3kOiGE8xL5WbBm?=
 =?iso-8859-1?Q?SXD6mtR5nPIlVwz8uo60DDP+8fgDy47HX1kXsRrIfepZ7e90s90VAAtxD9?=
 =?iso-8859-1?Q?saV03Z95KTcB5xWTH+nhWDbTpvEDkkxivfqnWE2xlb5YG3NJ+TY4Yag+rD?=
 =?iso-8859-1?Q?F7ex5IbIfklIiU+g2r6iV52btfKZonVldkDYIUpBR5jfEOl24A54+VCG48?=
 =?iso-8859-1?Q?DAk7estLaY0zrjf2P53F5deYUI6JiZy9jQThhuykz7CRd/ckBeQTSNmDE9?=
 =?iso-8859-1?Q?ObajJN6neX8oruDm/LaYVJYIVVKXGSAEP1GBAJbOpamYI5AsnCiKJXyKbb?=
 =?iso-8859-1?Q?kF/tVY9Hqi3vxnVW8CYXI6N0t9YdkO1ffdV2b38wzaA5DE3KMJgEl4AjB6?=
 =?iso-8859-1?Q?KUMlnH6BZ7RScf4Dun4ez4KbZ5xYNdKvzgFKj1VlttfAbrmo+Ac6YJLw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 727a92e2-dc35-415a-08ce-08dd49f56254
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 17:07:22.4439 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T3cX49Bl1V786TkyKA0EKfe0SRgtmRPoXFg7Etr5L1zU82kui+XJDuAY+99br1GzgTidzs+/qI+pEz5ffIdLBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8520
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

On Thu, Feb 06, 2025 at 11:43:10AM +0100, Thomas Hellström wrote:
> Hi, Matt,
> 
> On Thu, 2025-02-06 at 02:34 -0800, Matthew Brost wrote:
> > On Tue, Feb 04, 2025 at 01:45:57PM -0500, Oak Zeng wrote:
> > > When a vm runs under fault mode, if scratch page is enabled, we
> > > need
> > > to clear the scratch page mapping before vm_bind for the vm_bind
> > > address range. Under fault mode, we depend on recoverable page
> > > fault
> > > to establish mapping in page table. If scratch page is not cleared,
> > > GPU access of address won't cause page fault because it always hits
> > > the existing scratch page mapping.
> > > 
> > > When vm_bind with IMMEDIATE flag, there is no need of clearing as
> > > immediate bind can overwrite the scratch page mapping.
> > > 
> > > So far only is xe2 and xe3 products are allowed to enable scratch
> > > page
> > > under fault mode. On other platform we don't allow scratch page
> > > under
> > > fault mode, so no need of such clearing.
> > > 
> > > v2: Rework vm_bind pipeline to clear scratch page mapping. This is
> > > similar
> > > to a map operation, with the exception that PTEs are cleared
> > > instead of
> > > pointing to valid physical pages. (Matt, Thomas)
> > > 
> > > TLB invalidation is needed after clear scratch page mapping as
> > > larger
> > > scratch page mapping could be backed by physical page and cached in
> > > TLB. (Matt, Thomas)
> > > 
> > > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > 
> > Given the complexity of the VM bind path, I think we need an IGT
> > posted
> > with this series before merging as I suggested in v1. Without it, it
> > will be fairly difficult to ensure correctness by reviews only.
> 
> There is an igt posted that exercises xe_exec_fault_mode + scratch
> pages. Although you might have had something more elaborate in mind?
> 

Ah, missed this as generally look at cover letter to find associated
IGTs.

A quick look at IGT and thinking we need to do slightly better. Off the
top of my head something like:

- Run a batch which does a DW write to scratch address
- Bind scratch address /w IMMEDIATE cleared
- Run a batch which does a DW write to newly bound address, verfiy
  result

Matt

> /Thomas
> 
> 
> > 
> > Matt
> > 
> > > ---
> > >  drivers/gpu/drm/xe/xe_pt.c       | 66 ++++++++++++++++++++++------
> > > ----
> > >  drivers/gpu/drm/xe/xe_pt_types.h |  2 +
> > >  drivers/gpu/drm/xe/xe_vm.c       | 29 ++++++++++++--
> > >  drivers/gpu/drm/xe/xe_vm_types.h |  2 +
> > >  4 files changed, 75 insertions(+), 24 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_pt.c
> > > b/drivers/gpu/drm/xe/xe_pt.c
> > > index 1ddcc7e79a93..3fd0ae2dbe7d 100644
> > > --- a/drivers/gpu/drm/xe/xe_pt.c
> > > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > > @@ -268,6 +268,8 @@ struct xe_pt_stage_bind_walk {
> > >  	 * granularity.
> > >  	 */
> > >  	bool needs_64K;
> > > +	/* @clear_pt: clear page table entries during the bind
> > > walk */
> > > +	bool clear_pt;
> > >  	/**
> > >  	 * @vma: VMA being mapped
> > >  	 */
> > > @@ -497,21 +499,25 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent,
> > > pgoff_t offset,
> > >  
> > >  		XE_WARN_ON(xe_walk->va_curs_start != addr);
> > >  
> > > -		pte = vm->pt_ops->pte_encode_vma(is_null ? 0 :
> > > -						 xe_res_dma(curs)
> > > + xe_walk->dma_offset,
> > > -						 xe_walk->vma,
> > > pat_index, level);
> > > -		pte |= xe_walk->default_pte;
> > > +		if (xe_walk->clear_pt) {
> > > +			pte = 0;
> > > +		} else {
> > > +			pte = vm->pt_ops->pte_encode_vma(is_null ?
> > > 0 :
> > > +					xe_res_dma(curs) +
> > > xe_walk->dma_offset,
> > > +					xe_walk->vma, pat_index,
> > > level);
> > > +			pte |= xe_walk->default_pte;
> > >  
> > > -		/*
> > > -		 * Set the XE_PTE_PS64 hint if possible, otherwise
> > > if
> > > -		 * this device *requires* 64K PTE size for VRAM,
> > > fail.
> > > -		 */
> > > -		if (level == 0 && !xe_parent->is_compact) {
> > > -			if (xe_pt_is_pte_ps64K(addr, next,
> > > xe_walk)) {
> > > -				xe_walk->vma->gpuva.flags |=
> > > XE_VMA_PTE_64K;
> > > -				pte |= XE_PTE_PS64;
> > > -			} else if (XE_WARN_ON(xe_walk->needs_64K))
> > > {
> > > -				return -EINVAL;
> > > +			/*
> > > +			 * Set the XE_PTE_PS64 hint if possible,
> > > otherwise if
> > > +			 * this device *requires* 64K PTE size for
> > > VRAM, fail.
> > > +			 */
> > > +			if (level == 0 && !xe_parent->is_compact)
> > > {
> > > +				if (xe_pt_is_pte_ps64K(addr, next,
> > > xe_walk)) {
> > > +					xe_walk->vma->gpuva.flags
> > > |= XE_VMA_PTE_64K;
> > > +					pte |= XE_PTE_PS64;
> > > +				} else if (XE_WARN_ON(xe_walk-
> > > >needs_64K)) {
> > > +					return -EINVAL;
> > > +				}
> > >  			}
> > >  		}
> > >  
> > > @@ -519,7 +525,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent,
> > > pgoff_t offset,
> > >  		if (unlikely(ret))
> > >  			return ret;
> > >  
> > > -		if (!is_null)
> > > +		if (!is_null && !xe_walk->clear_pt)
> > >  			xe_res_next(curs, next - addr);
> > >  		xe_walk->va_curs_start = next;
> > >  		xe_walk->vma->gpuva.flags |= (XE_VMA_PTE_4K <<
> > > level);
> > > @@ -589,6 +595,7 @@ static const struct xe_pt_walk_ops
> > > xe_pt_stage_bind_ops = {
> > >   * @vma: The vma indicating the address range.
> > >   * @entries: Storage for the update entries used for connecting
> > > the tree to
> > >   * the main tree at commit time.
> > > + * @clear_pt: Clear the page table entries.
> > >   * @num_entries: On output contains the number of @entries used.
> > >   *
> > >   * This function builds a disconnected page-table tree for a given
> > > address
> > > @@ -602,7 +609,8 @@ static const struct xe_pt_walk_ops
> > > xe_pt_stage_bind_ops = {
> > >   */
> > >  static int
> > >  xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
> > > -		 struct xe_vm_pgtable_update *entries, u32
> > > *num_entries)
> > > +		 struct xe_vm_pgtable_update *entries,
> > > +		 bool clear_pt, u32 *num_entries)
> > >  {
> > >  	struct xe_device *xe = tile_to_xe(tile);
> > >  	struct xe_bo *bo = xe_vma_bo(vma);
> > > @@ -622,10 +630,19 @@ xe_pt_stage_bind(struct xe_tile *tile, struct
> > > xe_vma *vma,
> > >  		.vma = vma,
> > >  		.wupd.entries = entries,
> > >  		.needs_64K = (xe_vma_vm(vma)->flags &
> > > XE_VM_FLAG_64K) && is_devmem,
> > > +		.clear_pt = clear_pt,
> > >  	};
> > >  	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
> > >  	int ret;
> > >  
> > > +	if (clear_pt) {
> > > +		ret = xe_pt_walk_range(&pt->base, pt->level,
> > > xe_vma_start(vma),
> > > +				       xe_vma_end(vma),
> > > &xe_walk.base);
> > > +
> > > +		*num_entries = xe_walk.wupd.num_used_entries;
> > > +		return ret;
> > > +	}
> > > +
> > >  	/**
> > >  	 * Default atomic expectations for different allocation
> > > scenarios are as follows:
> > >  	 *
> > > @@ -981,12 +998,14 @@ static void xe_pt_free_bind(struct
> > > xe_vm_pgtable_update *entries,
> > >  
> > >  static int
> > >  xe_pt_prepare_bind(struct xe_tile *tile, struct xe_vma *vma,
> > > -		   struct xe_vm_pgtable_update *entries, u32
> > > *num_entries)
> > > +		   struct xe_vm_pgtable_update *entries,
> > > +		   bool invalidate_on_bind, u32 *num_entries)
> > >  {
> > >  	int err;
> > >  
> > >  	*num_entries = 0;
> > > -	err = xe_pt_stage_bind(tile, vma, entries, num_entries);
> > > +	err = xe_pt_stage_bind(tile, vma, entries,
> > > invalidate_on_bind,
> > > +			       num_entries);
> > >  	if (!err)
> > >  		xe_tile_assert(tile, *num_entries);
> > >  
> > > @@ -1661,6 +1680,7 @@ static int bind_op_prepare(struct xe_vm *vm,
> > > struct xe_tile *tile,
> > >  		return err;
> > >  
> > >  	err = xe_pt_prepare_bind(tile, vma, pt_op->entries,
> > > +				 pt_update_ops-
> > > >invalidate_on_bind,
> > >  				 &pt_op->num_entries);
> > >  	if (!err) {
> > >  		xe_tile_assert(tile, pt_op->num_entries <=
> > > @@ -1685,7 +1705,7 @@ static int bind_op_prepare(struct xe_vm *vm,
> > > struct xe_tile *tile,
> > >  		 * it needs to be done here.
> > >  		 */
> > >  		if ((!pt_op->rebind && xe_vm_has_scratch(vm) &&
> > > -		     xe_vm_in_preempt_fence_mode(vm)))
> > > +		     xe_vm_in_preempt_fence_mode(vm)) ||
> > > pt_update_ops->invalidate_on_bind)
> > >  			pt_update_ops->needs_invalidation = true;
> > >  		else if (pt_op->rebind && !xe_vm_in_lr_mode(vm))
> > >  			/* We bump also if batch_invalidate_tlb is
> > > true */
> > > @@ -1759,9 +1779,13 @@ static int op_prepare(struct xe_vm *vm,
> > >  
> > >  	switch (op->base.op) {
> > >  	case DRM_GPUVA_OP_MAP:
> > > -		if (!op->map.immediate && xe_vm_in_fault_mode(vm))
> > > +		if (!op->map.immediate && xe_vm_in_fault_mode(vm)
> > > &&
> > > +		    !op->map.invalidate_on_bind)
> > >  			break;
> > >  
> > > +		if (op->map.invalidate_on_bind)
> > > +			pt_update_ops->invalidate_on_bind = true;
> > > +
> > >  		err = bind_op_prepare(vm, tile, pt_update_ops, op-
> > > >map.vma);
> > >  		pt_update_ops->wait_vm_kernel = true;
> > >  		break;
> > > @@ -1871,6 +1895,8 @@ static void bind_op_commit(struct xe_vm *vm,
> > > struct xe_tile *tile,
> > >  	}
> > >  	vma->tile_present |= BIT(tile->id);
> > >  	vma->tile_staged &= ~BIT(tile->id);
> > > +	if (pt_update_ops->invalidate_on_bind)
> > > +		vma->tile_invalidated |= BIT(tile->id);
> > >  	if (xe_vma_is_userptr(vma)) {
> > >  		lockdep_assert_held_read(&vm-
> > > >userptr.notifier_lock);
> > >  		to_userptr_vma(vma)->userptr.initial_bind = true;
> > > diff --git a/drivers/gpu/drm/xe/xe_pt_types.h
> > > b/drivers/gpu/drm/xe/xe_pt_types.h
> > > index 384cc04de719..3d0aa2a5102e 100644
> > > --- a/drivers/gpu/drm/xe/xe_pt_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_pt_types.h
> > > @@ -108,6 +108,8 @@ struct xe_vm_pgtable_update_ops {
> > >  	bool needs_userptr_lock;
> > >  	/** @needs_invalidation: Needs invalidation */
> > >  	bool needs_invalidation;
> > > +	/** @invalidate_on_bind: Invalidate the range before bind
> > > */
> > > +	bool invalidate_on_bind;
> > >  	/**
> > >  	 * @wait_vm_bookkeep: PT operations need to wait until VM
> > > is idle
> > >  	 * (bookkeep dma-resv slots are idle) and stage all future
> > > VM activity
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > > b/drivers/gpu/drm/xe/xe_vm.c
> > > index d664f2e418b2..813d893d9b63 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -1921,6 +1921,23 @@ static void print_op(struct xe_device *xe,
> > > struct drm_gpuva_op *op)
> > >  }
> > >  #endif
> > >  
> > > +static bool __xe_vm_needs_clear_scratch_pages(struct xe_vm *vm,
> > > u32 bind_flags)
> > > +{
> > > +	if (!xe_vm_in_fault_mode(vm))
> > > +		return false;
> > > +
> > > +	if (!NEEDS_SCRATCH(vm->xe))
> > > +		return false;
> > > +
> > > +	if (!xe_vm_has_scratch(vm))
> > > +		return false;
> > > +
> > > +	if (bind_flags & DRM_XE_VM_BIND_FLAG_IMMEDIATE)
> > > +		return false;
> > > +
> > > +	return true;
> > > +}
> > > +
> > >  /*
> > >   * Create operations list from IOCTL arguments, setup operations
> > > fields so parse
> > >   * and commit steps are decoupled from IOCTL arguments. This step
> > > can fail.
> > > @@ -1991,6 +2008,8 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm,
> > > struct xe_bo *bo,
> > >  			op->map.is_null = flags &
> > > DRM_XE_VM_BIND_FLAG_NULL;
> > >  			op->map.dumpable = flags &
> > > DRM_XE_VM_BIND_FLAG_DUMPABLE;
> > >  			op->map.pat_index = pat_index;
> > > +			op->map.invalidate_on_bind =
> > > +				__xe_vm_needs_clear_scratch_pages(
> > > vm, flags);
> > >  		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
> > >  			op->prefetch.region = prefetch_region;
> > >  		}
> > > @@ -2188,7 +2207,8 @@ static int vm_bind_ioctl_ops_parse(struct
> > > xe_vm *vm, struct drm_gpuva_ops *ops,
> > >  				return PTR_ERR(vma);
> > >  
> > >  			op->map.vma = vma;
> > > -			if (op->map.immediate ||
> > > !xe_vm_in_fault_mode(vm))
> > > +			if (op->map.immediate ||
> > > !xe_vm_in_fault_mode(vm) ||
> > > +			    op->map.invalidate_on_bind)
> > >  				xe_vma_ops_incr_pt_update_ops(vops
> > > ,
> > >  							      op-
> > > >tile_mask);
> > >  			break;
> > > @@ -2416,9 +2436,10 @@ static int op_lock_and_prep(struct drm_exec
> > > *exec, struct xe_vm *vm,
> > >  
> > >  	switch (op->base.op) {
> > >  	case DRM_GPUVA_OP_MAP:
> > > -		err = vma_lock_and_validate(exec, op->map.vma,
> > > -					   
> > > !xe_vm_in_fault_mode(vm) ||
> > > -					    op->map.immediate);
> > > +		if (!op->map.invalidate_on_bind)
> > > +			err = vma_lock_and_validate(exec, op-
> > > >map.vma,
> > > +						   
> > > !xe_vm_in_fault_mode(vm) ||
> > > +						    op-
> > > >map.immediate);
> > >  		break;
> > >  	case DRM_GPUVA_OP_REMAP:
> > >  		err = check_ufence(gpuva_to_vma(op-
> > > >base.remap.unmap->va));
> > > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> > > b/drivers/gpu/drm/xe/xe_vm_types.h
> > > index 52467b9b5348..dace04f4ea5e 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > > @@ -297,6 +297,8 @@ struct xe_vma_op_map {
> > >  	bool is_null;
> > >  	/** @dumpable: whether BO is dumped on GPU hang */
> > >  	bool dumpable;
> > > +	/** @invalidate: invalidate the VMA before bind */
> > > +	bool invalidate_on_bind;
> > >  	/** @pat_index: The pat index to use for this operation.
> > > */
> > >  	u16 pat_index;
> > >  };
> > > -- 
> > > 2.26.3
> > > 
> 

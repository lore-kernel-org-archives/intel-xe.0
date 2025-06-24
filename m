Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B649C71157
	for <intel-xe@archiver.kernel.org>; Tue, 24 Jun 2025 05:33:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73DB910E148;
	Tue, 24 Jun 2025 05:33:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WpWWHYKQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96CA410E148
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Jun 2025 05:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750743201; x=1782279201;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=JdeSqQS7OcZvtWxCGR0iBIsgvE0s7LzyGl/UwHg0J9U=;
 b=WpWWHYKQbjf/7kcG+9j+hnU5D+5tZOv/qQslLSB201oh01282KowiJg+
 usOi4n2OpxDl/pApYm1gSm0M9FCG45Mea/8EFcqRLsCrcxZjXidyYUkfw
 kst6wzk+21X+gmaxO0HajX1K5qH1K0HI3QdUaDRcv4VFvIw0IwcMF9GBu
 ryTfmd3/pAQJlFoicB4R/32ucpEnKVrJxDGeoN9wZG6JMpwMreEKJRHdu
 PHjnZ9aDnunQ+3YewKik6FI/mkjqhkLLTq5KSdjq8J6R9phSOF9O02yH+
 Hz/4Gft5qcWttlbTBg3Jz2C/vZqKbyEsEaQGvOv24AT21DlV2BALqttOa w==;
X-CSE-ConnectionGUID: cLRcT5cjQUWdLOw7DDP/kA==
X-CSE-MsgGUID: PaVFeyx9RA2aJfNE/l+pNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="63235073"
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; d="scan'208";a="63235073"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 22:33:19 -0700
X-CSE-ConnectionGUID: GDHKLUQ8RcmoxzogrexSGw==
X-CSE-MsgGUID: Y46govnWREicB2xVjoyIow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; d="scan'208";a="156198356"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 22:33:19 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 22:33:17 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 23 Jun 2025 22:33:17 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.78)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 22:33:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o/Jdi56dkAJIr1M4yEig1Wuuznsa8PMFXqjF9Ztj4SmQnfctPsgahQO/x62wzD96d1c3XnHZSGJE/Pkg4Ui8zuWU69x+eg+KQd/7lcZpV0AZ/Gp004iHyCJobhbZo/FJzmE5Z/ZOvGtZiRE791z20fb40PMHELrBENNhjvsAHX5u9DX7OgEL2a936IPvtAvY1cCzDMqDr5JfVQTNhwV6/w0TEyZic/anD/gkjjsHPhwdqxdDvxkqYKAuIeOZ8NKpvC1FwYrjekqflI7cSrXimhwvr8VOXnzkEih37lMX9NY17fR4np9ENH/uFxk/DhPMD81ZuxsajLXoirwtSK0fhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NNJy86NpWMewxip6wHcUl+n94nX4H1U9O2mnTBQ2L28=;
 b=YCYxXO6B4Z7XUdNnLrBv3iiXcU/O/Pf5cdY37Z3CVLGCfaDNegYZF3p3fEjCUByx0L/n4LCsZvq/KFrLfUnoWhCWgs/Z3uB3K82Mh3xeSxTxYWuwEGTBMaJPAfOpsEFu+sHxhAkQ6QKDeDmHbhLT4jpRZrTY1WeImOaxCJu5GBJAk1lQVOfJlXQGCFbaAXpoYrKa11epFXzz6PsNxc/gec3mGYf2v9Msqk8vOuY8qZIFZYJHeR7ajClwYGBx2kw+2CB/vTtULMksU/wfGnkO+OdXhViA2xJPRUiKyMx1w0JuYl5W9Mmv1H+xAJB581zd5RmVqUA+Gp53entBZnk98A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB8206.namprd11.prod.outlook.com (2603:10b6:8:166::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Tue, 24 Jun
 2025 05:33:10 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 05:33:09 +0000
Date: Mon, 23 Jun 2025 22:34:48 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <matthew.auld@intel.com>
Subject: Re: [PATCH 2/6] drm/xe: Add generic dependecy jobs / scheduler
Message-ID: <aFo4+IHdxPcX/bQZ@lstrano-desk.jf.intel.com>
References: <20250617153730.2136174-1-matthew.brost@intel.com>
 <20250617153730.2136174-3-matthew.brost@intel.com>
 <84bee0bf7f0bc7bff3127e45da1b3db1862fba25.camel@linux.intel.com>
 <aFLIzZX/NRd43t9A@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aFLIzZX/NRd43t9A@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW2PR16CA0005.namprd16.prod.outlook.com (2603:10b6:907::18)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB8206:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d148d0e-f91c-47bf-1fd2-08ddb2e09a4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?fUhbsAfOt7ApK3w3N8aoeQE5OyadIs+DsjW3ycYCnlj4Lp5bCeP7DcYLqR?=
 =?iso-8859-1?Q?YkaspuTamMIJk6Mo/lpzDVPIcpm7fF6wJPhoIl1cFU0vJyVIRsflo2kkkN?=
 =?iso-8859-1?Q?fhzJPD/D9eKpUQRzBxgLRqZ7gq8AR3n0lNspQquk9huTZqHY93SNcUDIDB?=
 =?iso-8859-1?Q?XLhW3hwNMaHUhBGHgrAxWAiiyeEvYWCa9uPdPXSm+YDtYCIYdmw3PPhGS2?=
 =?iso-8859-1?Q?fVXu/1y/9ulzxTVTV40RYJwDrh3SgALOsH/3BTdOZXQDBUItbttkh/lp5k?=
 =?iso-8859-1?Q?ts0jcAoGnZsAzq/x6Iz5naCaNlJe065V0gaxVNLFwvQC31cbVZ/4b2lEx0?=
 =?iso-8859-1?Q?NNDIO3PvE8Y09kN0sY+pebRAAoMGu18By2wZtduxkSnNsbBD1TubS0rLf0?=
 =?iso-8859-1?Q?8PxvXHL1LJ5B+Ns4raHhjlezvJ7aLSuppA5ZRFq5+04nojBJxTgDCkw9G7?=
 =?iso-8859-1?Q?MXgcvaw++pyrdWFJc7QQ5cfLuGjDYdf5+ICxI3rYkAtRBy9yWMYMAzpegF?=
 =?iso-8859-1?Q?BCbU+qAQXFicw0gKAV4Wo2GcBrZ9IXQrbpOa1/01MgpD8auuxWn6Yspv7L?=
 =?iso-8859-1?Q?a4aVVPqwZS5iT6lt69cNrshxzLv4ftvdFlyWwSWRGoeH5nZkDDBcPWgb8/?=
 =?iso-8859-1?Q?WOwWi5JMSmi+vh9PLX+sEQTrftDQVcAUpxcmBoxXuxswLxG05o4T4SpeRT?=
 =?iso-8859-1?Q?gXrM1yGzvJwTnCgZwcDfyJZwJC6OG1g696qoGYED5MVTm7P+tokidnJV9H?=
 =?iso-8859-1?Q?0RzsVhyc7CsSXtLgobDsGvluuZcgxV1/Dsh5gjR7imBruHOHm4T3iE3vsk?=
 =?iso-8859-1?Q?6GEGaKuxAf2P/mQ6DPelyZKEJFxeWRXY/EjTpgSAHriyebG+vcFJy5Ltf9?=
 =?iso-8859-1?Q?YKUWdmYB7sK/XMFDbLs8N4r5Uo31e4NrsW92cSUvL86r94n94xZm3olmvc?=
 =?iso-8859-1?Q?Lh160gV07TPMqa56a31V794/DnkgjdKDGrO4JB5HnePwv2BtK5j4gV0sN4?=
 =?iso-8859-1?Q?UwLpkL0oC/yO9789x1A8cOmUnFb9Wo3y1AZeQt4W5ff7WFfHLhaCo6ugQB?=
 =?iso-8859-1?Q?kRqWNtW9Ww2i/8fBSMtXvqXEerfdEqLswBOBk8m2ZMoAYRMNR7nmQQGrzf?=
 =?iso-8859-1?Q?OuFmPO4pwf0FZjqC5jFN2o/heQ/fiYE+tMW0s1ZyghxEGsRdpCLwFntE49?=
 =?iso-8859-1?Q?yGoKJ7SLM//vz7WRc8JTynhBHw9KlBH+AGGuBdW0MCvnoLh7M6uKuquqSa?=
 =?iso-8859-1?Q?oJuPwFg+Uw6WfQD2PQgmqrnWIhJdgDNTM87zqfhnZaFbXh/kPpAsQZ5+mK?=
 =?iso-8859-1?Q?3EvxuImzvVBaiOSUhuakAKejWmJalf2HymkHmSEJZ2WMbctBGObu0MbPpY?=
 =?iso-8859-1?Q?XO51yFehWTWk6r+ADPER1c0RBVjjPMO73cg9plguyUDp+n5L16iCDZmX0i?=
 =?iso-8859-1?Q?x7bwvoSXhA4yw+HwIQ6p9VxHhAqlrKloYP8EaPDeF5QjrLeeT5wZb0WH5t?=
 =?iso-8859-1?Q?w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?+sjNhJsWIouNgUrk8sIadUFIRyLCe+VbXtzfiH9MJ52PreUrG8ueboZIgH?=
 =?iso-8859-1?Q?NxPtGk443ITbCcqQlO7mgTo2/8QPWqrNjTRm/fTPrzn2KfVu4Fsh4OwYDV?=
 =?iso-8859-1?Q?RtPSAJKFHQtsZpbpVJjfJNm1XYXKDBn1GxHBHARTljgxGAHrSmPdn2wiaI?=
 =?iso-8859-1?Q?3nNr5j2ZXTUsAu2ZqEZzU0l+gNx8niP6fP+f5GtdhMa4LmkevjkTgR6nVJ?=
 =?iso-8859-1?Q?504dzxI+Ozz+iIn4myBuvj6eIk14e7vwVY2nEIerc5ybgTDCVe40wvUDwq?=
 =?iso-8859-1?Q?3AiU4CRWCN9sVMFHzTXzztKgK+vjUHfmW2/WyN2erUu1BO574F6rwk8CuP?=
 =?iso-8859-1?Q?rFDyLseE/WqZoTXNOlh/rxig1MG6lPbRUfXHyK4JwjR4nW3ZHKqV5TSuVv?=
 =?iso-8859-1?Q?qy1pHeL0v2/liFy/XSePWffSc3PwsYJlWYtrR7Fky6zUNQoH56SAxbepw+?=
 =?iso-8859-1?Q?A+yiM0FZ6mpgkxZ3l0+2PXxJvF+KDI+x2Ezsl449zmilQ/r3JGV8WuESLC?=
 =?iso-8859-1?Q?lgVglZRw0wDvAhCN83WpPNn2i18mvvwEVmTBV5v9VSBdviQ0bhqKa0z6md?=
 =?iso-8859-1?Q?ds743DsbsW4z6UF5Oc7QT0n8LmOaLgAF3VDH8yYhL1BRxfpOjIGAsludyD?=
 =?iso-8859-1?Q?riq5GyfiTxDggMkuWTh2767BLE6LxRV7VkiPd1uQ46mu2CKbgdZ2kQYyAl?=
 =?iso-8859-1?Q?ak2gQKn+S2eUonJqRsJBEeBL5Le62ORzXLAHk1slToSWPFLKi8Uc0EVOXk?=
 =?iso-8859-1?Q?epVAXiSiOsRgaljxS7VmaqdVVFd0UydymsjiU2NpV/lOVuQG8phoN74RM4?=
 =?iso-8859-1?Q?iyaEic5bYRhsleRuTNVdv84U/UkNJ/e8jmlYqgbod5BXj91TtuvnS6iEVP?=
 =?iso-8859-1?Q?4GV7dpnvRh3gekBi5IeZ/8dVh39qV1zJ817GWRxCJx+3qsEn20U76ywKew?=
 =?iso-8859-1?Q?Pc+MjnD4Xf3W4G3kiakJY4Uade/MGWnLnBm7E+lucvlwyMjXgB6g6nyV6l?=
 =?iso-8859-1?Q?bPY16WS2mp6peRgofKaCbcDmhHFEZUvS/TzjnirWenR+h326rI8Ram3wOI?=
 =?iso-8859-1?Q?gC0DbJB0F3vciA/nKIr55/WREb+m4FSH37Bh1p8JqEATtudAVWFny8uowK?=
 =?iso-8859-1?Q?bAbLxYFsTXrefuFYZd+Q8Y9EHiemibN35oO97s3APhIKx52HYx1acCsyPJ?=
 =?iso-8859-1?Q?iw9jOy21GkPegoIMnUQFzRp/w5kz48ZsQbq5QJFGD3uFmeySskeA2yBSDZ?=
 =?iso-8859-1?Q?wnxbe68DHVV0q3Z2fHiomz4bupSMPQbVuPVL1RF6gz5UwTcWpIla3d5BHB?=
 =?iso-8859-1?Q?vju+aXytIgcUVNINCO4SwyD45g6cR6eKfn5tAz28JLzUbLd9G8VebC8O9n?=
 =?iso-8859-1?Q?hBs3POJhcbAO5Mt2liXIew7uiLqhGJeGm0ipYmnvKzr7Oehytq1S/etN/m?=
 =?iso-8859-1?Q?7XHJN+z4rdZ8vkWICpLjVIQgPj1uFS+NYQ0dcuZqRTcjAvKfvtz1sTdHVe?=
 =?iso-8859-1?Q?PTiW0fm06m8niJrLOzqI1K3iNnD8anTumZlVpcGmF93VhilsMlJL5LA3qY?=
 =?iso-8859-1?Q?XE8usK2kQJCKu3GBH31V4U+Szt5gKchWkr0/QbrrESgQrD6usrVe9xc7PY?=
 =?iso-8859-1?Q?TonDJDk/iG5R+e4AW0PXVGrf3x/Mxy3CJjKuJOmMfkhjzUGHJw5OF2kA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d148d0e-f91c-47bf-1fd2-08ddb2e09a4f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 05:33:08.9805 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hIZFrjAd9Y8aXe9rlBkL/0InYW/FY/lRYFBswyBV9AI1/v7uOeJjdDHeAby/7P8+vSk5blqc5JbmFh/InMm4Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8206
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

On Wed, Jun 18, 2025 at 07:10:21AM -0700, Matthew Brost wrote:
> On Wed, Jun 18, 2025 at 01:20:42PM +0200, Thomas Hellström wrote:
> > On Tue, 2025-06-17 at 08:37 -0700, Matthew Brost wrote:
> > > Add generic dependecy jobs / scheduler which serves as wrapper for
> > > DRM
> > > scheduler. Useful when we want delay a generic operation until a
> > > dma-fence signals.
> > > 
> > > Existing use cases could be destroying of resources based fences /
> > > dma-resv, the preempt rebind worker, and pipelined GT TLB
> > > invalidations.
> > > 
> > > Written in such a way it could be moved to DRM subsystem if needed.
> > > 
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/Makefile           |   1 +
> > >  drivers/gpu/drm/xe/xe_dep_job_types.h |  29 ++++++
> > >  drivers/gpu/drm/xe/xe_dep_scheduler.c | 145
> > > ++++++++++++++++++++++++++
> > >  drivers/gpu/drm/xe/xe_dep_scheduler.h |  21 ++++
> > >  4 files changed, 196 insertions(+)
> > >  create mode 100644 drivers/gpu/drm/xe/xe_dep_job_types.h
> > >  create mode 100644 drivers/gpu/drm/xe/xe_dep_scheduler.c
> > >  create mode 100644 drivers/gpu/drm/xe/xe_dep_scheduler.h
> > > 
> > > diff --git a/drivers/gpu/drm/xe/Makefile
> > > b/drivers/gpu/drm/xe/Makefile
> > > index f5f5775acdc0..3523bd093b7a 100644
> > > --- a/drivers/gpu/drm/xe/Makefile
> > > +++ b/drivers/gpu/drm/xe/Makefile
> > > @@ -28,6 +28,7 @@ $(obj)/generated/%_wa_oob.c
> > > $(obj)/generated/%_wa_oob.h: $(obj)/xe_gen_wa_oob \
> > >  xe-y += xe_bb.o \
> > >  	xe_bo.o \
> > >  	xe_bo_evict.o \
> > > +	xe_dep_scheduler.o \
> > >  	xe_devcoredump.o \
> > >  	xe_device.o \
> > >  	xe_device_sysfs.o \
> > > diff --git a/drivers/gpu/drm/xe/xe_dep_job_types.h
> > > b/drivers/gpu/drm/xe/xe_dep_job_types.h
> > > new file mode 100644
> > > index 000000000000..c6a484f24c8c
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/xe_dep_job_types.h
> > > @@ -0,0 +1,29 @@
> > > +/* SPDX-License-Identifier: MIT */
> > > +/*
> > > + * Copyright © 2025 Intel Corporation
> > > + */
> > > +
> > > +#ifndef _XE_DEP_JOB_TYPES_H_
> > > +#define _XE_DEP_JOB_TYPES_H_
> > > +
> > > +#include <drm/gpu_scheduler.h>
> > > +
> > > +struct xe_dep_job;
> > > +
> > > +/** struct xe_dep_job_ops - Generic Xe dependency job operations */
> > > +struct xe_dep_job_ops {
> > > +	/** @run_job: Run generic Xe dependency job */
> > > +	struct dma_fence *(*run_job)(struct xe_dep_job *job);
> > > +	/** @free_job: Free generic Xe dependency job */
> > > +	void (*free_job)(struct xe_dep_job *job);
> > > +};
> > > +
> > > +/** struct xe_dep_job - Generic dependency Xe job */
> > > +struct xe_dep_job {
> > > +	/** @drm: base DRM scheduler job */
> > > +	struct drm_sched_job drm;
> > > +	/** @ops: dependency job operations */
> > > +	const struct xe_dep_job_ops *ops;
> > > +};
> > > +
> > > +#endif
> > > diff --git a/drivers/gpu/drm/xe/xe_dep_scheduler.c
> > > b/drivers/gpu/drm/xe/xe_dep_scheduler.c
> > > new file mode 100644
> > > index 000000000000..fbd55577d787
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/xe_dep_scheduler.c
> > > @@ -0,0 +1,145 @@
> > > +// SPDX-License-Identifier: MIT
> > > +/*
> > > + * Copyright © 2025 Intel Corporation
> > > + */
> > > +
> > > +#include <linux/slab.h>
> > > +
> > > +#include <drm/gpu_scheduler.h>
> > > +
> > > +#include "xe_dep_job_types.h"
> > > +#include "xe_dep_scheduler.h"
> > > +#include "xe_device_types.h"
> > > +
> > > +/**
> > > + * DOC: Xe Dependency Scheduler
> > > + *
> > > + * The Xe dependency scheduler is a simple wrapper built around the
> > > DRM
> > > + * scheduler to execute jobs once their dependencies are resolved
> > > (i.e., all
> > > + * input fences specified as dependencies are signaled). The jobs
> > > that are
> > > + * executed contain virtual functions to run (execute) and free the
> > > job,
> > > + * allowing a single dependency scheduler to handle jobs performing
> > > different
> > > + * operations.
> > > + *
> > > + * Example use cases include deferred resource freeing, TLB
> > > invalidations after
> > > + * bind jobs, etc.
> > > + */
> > > +
> > > +/** struct xe_dep_scheduler - Generic Xe dependency scheduler */
> > > +struct xe_dep_scheduler {
> > > +	/** @sched: DRM GPU scheduler */
> > > +	struct drm_gpu_scheduler sched;
> > 
> > Would it make sense to support sharing a single drm_gpu_scheduler for
> > many xe_dep_schedulers? Thinking of the first use-case where we'd
> 
> So do you mean sharing a single drm_gpu_scheduler for many
> drm_sched_entity? If that's what you mean, I think that would work. Each
> entity gets its own dma-fence contetxt and that is what we want - so
> we'd assign an entity per GT, queue tuple.
> 
> > probably want just a single drm_gpu_scheduler per GuC since
> > invalidations are ordered anyway?
> 
> A scheduler must be ordered in at job completion from job issue order
> which fits here too with a single scheduler per GuC.
> 
> That said, I'm on fence about the ROI of doing this type of refactor so
> it would make dep scheduler API a bit more complex given entities now
> need to dynamically allocated, added, and removed. I can play around
> with this restructure and see what it looks like in code I suppose.
> 

I thought about this a bit more, what actually might make a bit more
sense here is share scheduler a WQ for all TLB invalidations on a GT. We
fully contend on the TLB invalidation anyways, so little sense in
scheduling these on different WQs. All the interfaces exist for this,
just need pass in WQ argument when we create the xe_dep_schedulers in
the exec queue.

Matt

> Matt
> 
> > 
> > /Thomas
> > 
> > 
> > > +	/** @entity: DRM scheduler entity  */
> > > +	struct drm_sched_entity entity;
> > > +	/** @rcu: For safe freeing of exported dma fences */
> > > +	struct rcu_head rcu;
> > > +};
> > > +
> > > +static struct dma_fence *xe_dep_scheduler_run_job(struct
> > > drm_sched_job *drm_job)
> > > +{
> > > +	struct xe_dep_job *dep_job =
> > > +		container_of(drm_job, typeof(*dep_job), drm);
> > > +
> > > +	return dep_job->ops->run_job(dep_job);
> > > +}
> > > +
> > > +static void xe_dep_scheduler_free_job(struct drm_sched_job *drm_job)
> > > +{
> > > +	struct xe_dep_job *dep_job =
> > > +		container_of(drm_job, typeof(*dep_job), drm);
> > > +
> > > +	dep_job->ops->free_job(dep_job);
> > > +}
> > > +
> > > +static const struct drm_sched_backend_ops sched_ops = {
> > > +	.run_job = xe_dep_scheduler_run_job,
> > > +	.free_job = xe_dep_scheduler_free_job,
> > > +};
> > > +
> > > +/**
> > > + * xe_dep_scheduler_create() - Generic Xe dependency scheduler
> > > create
> > > + * @xe: Xe device
> > > + * @submit_wq: Submit workqueue struct (can be NULL)
> > > + * @name: Name of dependency scheduler
> > > + * @job_limit: Max dependency jobs that can be scheduled
> > > + *
> > > + * Create a generic Xe dependency scheduler and initialize internal
> > > DRM
> > > + * scheduler objects.
> > > + *
> > > + * Return: Generic Xe dependency scheduler object or ERR_PTR
> > > + */
> > > +struct xe_dep_scheduler *
> > > +xe_dep_scheduler_create(struct xe_device *xe,
> > > +			struct workqueue_struct *submit_wq,
> > > +			const char *name, u32 job_limit)
> > > +{
> > > +	struct xe_dep_scheduler *dep_scheduler;
> > > +	struct drm_gpu_scheduler *sched;
> > > +	const struct drm_sched_init_args args = {
> > > +		.ops = &sched_ops,
> > > +		.submit_wq = submit_wq,
> > > +		.num_rqs = 1,
> > > +		.credit_limit = job_limit,
> > > +		.timeout = MAX_SCHEDULE_TIMEOUT,
> > > +		.name = name,
> > > +		.dev = xe->drm.dev,
> > > +	};
> > > +	int err;
> > > +
> > > +	dep_scheduler = kzalloc(sizeof(*dep_scheduler), GFP_KERNEL);
> > > +	if (!dep_scheduler)
> > > +		return ERR_PTR(-ENOMEM);
> > > +
> > > +	err = drm_sched_init(&dep_scheduler->sched, &args);
> > > +	if (err)
> > > +		goto err_free;
> > > +
> > > +	sched = &dep_scheduler->sched;
> > > +	err = drm_sched_entity_init(&dep_scheduler->entity, 0,
> > > +				    (struct drm_gpu_scheduler
> > > **)&sched, 1,
> > > +				    NULL);
> > > +	if (err)
> > > +		goto err_sched;
> > > +
> > > +	init_rcu_head(&dep_scheduler->rcu);
> > > +
> > > +	return dep_scheduler;
> > > +
> > > +err_sched:
> > > +	drm_sched_fini(&dep_scheduler->sched);
> > > +err_free:
> > > +	kfree(dep_scheduler);
> > > +
> > > +	return ERR_PTR(err);
> > > +}
> > > +
> > > +/**
> > > + * xe_dep_scheduler_fini() - Generic Xe dependency scheduler
> > > finalize
> > > + * @dep_scheduler: Generic Xe dependency scheduler object
> > > + *
> > > + * Finalize internal DRM scheduler objects and free generic Xe
> > > dependency
> > > + * scheduler object
> > > + */
> > > +void xe_dep_scheduler_fini(struct xe_dep_scheduler *dep_scheduler)
> > > +{
> > > +	drm_sched_entity_fini(&dep_scheduler->entity);
> > > +	drm_sched_fini(&dep_scheduler->sched);
> > > +	/*
> > > +	 * RCU free due sched being exported via DRM scheduler
> > > fences
> > > +	 * (timeline name).
> > > +	 */
> > > +	kfree_rcu(dep_scheduler, rcu);
> > > +}
> > > +
> > > +/**
> > > + * xe_dep_scheduler_entity() - Retrieve a generic Xe dependency
> > > scheduler
> > > + *                             DRM scheduler entity
> > > + * @dep_scheduler: Generic Xe dependency scheduler object
> > > + *
> > > + * Return: The generic Xe dependency scheduler's DRM scheduler
> > > entity
> > > + */
> > > +struct drm_sched_entity *
> > > +xe_dep_scheduler_entity(struct xe_dep_scheduler *dep_scheduler)
> > > +{
> > > +	return &dep_scheduler->entity;
> > > +}
> > > diff --git a/drivers/gpu/drm/xe/xe_dep_scheduler.h
> > > b/drivers/gpu/drm/xe/xe_dep_scheduler.h
> > > new file mode 100644
> > > index 000000000000..853961eec64b
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/xe_dep_scheduler.h
> > > @@ -0,0 +1,21 @@
> > > +/* SPDX-License-Identifier: MIT */
> > > +/*
> > > + * Copyright © 2025 Intel Corporation
> > > + */
> > > +
> > > +#include <linux/types.h>
> > > +
> > > +struct drm_sched_entity;
> > > +struct workqueue_struct;
> > > +struct xe_dep_scheduler;
> > > +struct xe_device;
> > > +
> > > +struct xe_dep_scheduler *
> > > +xe_dep_scheduler_create(struct xe_device *xe,
> > > +			struct workqueue_struct *submit_wq,
> > > +			const char *name, u32 job_limit);
> > > +
> > > +void xe_dep_scheduler_fini(struct xe_dep_scheduler *dep_scheduler);
> > > +
> > > +struct drm_sched_entity *
> > > +xe_dep_scheduler_entity(struct xe_dep_scheduler *dep_scheduler);
> > 

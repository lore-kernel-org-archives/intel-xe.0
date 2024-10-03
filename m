Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB8B8CF854C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Oct 2024 00:41:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64CB410E07D;
	Thu,  3 Oct 2024 00:41:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ed5X9a5z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 969DB10E07D
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Oct 2024 00:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727916092; x=1759452092;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NeMeR7qYIA+ZkLAsb85AekHfyjW3vTFLap6fLy+GZ3Q=;
 b=Ed5X9a5zMNhr3GzWQvji5z3D7lZEhMEwCKOl+c0OZlMfI/muEpWzPF7B
 jQtSHUZnaSKfiCI0BJfoR+Vq2bqZXBnw0COEvqInXV1iqxDWfs2QoKgeb
 OcuhUQ92UopDq3o4/x9LGFQX3GKYA1+9pp1d8KVpp49u//s6YIFqfZk7M
 ISYciT6690xcX3rC+Bnill3Hz9vTPe+gqy0QbprGEa37k/UBGOylIQoUG
 jorYDKpsAE+GP424VCUkYwIjLyDg7G1CXs6S/ncXvK4eEP5cOVaQVj+Jh
 4+bOZCvdPLc7f/Fv2eSl2o9r1N2pVo042gmsjV2rIwsW+QkwltNZDIl/w A==;
X-CSE-ConnectionGUID: mTj3hf1uS3mCAwvOm/s7zA==
X-CSE-MsgGUID: Tm4L81yNTaeF5BVvDGsElg==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="26568792"
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; d="scan'208";a="26568792"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 17:41:31 -0700
X-CSE-ConnectionGUID: NTnSFtAHRba3Ym9aBITAVQ==
X-CSE-MsgGUID: r/YTxtVORAeGRVDPyodPKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; d="scan'208";a="78601349"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Oct 2024 17:41:31 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 2 Oct 2024 17:41:31 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 2 Oct 2024 17:41:30 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 2 Oct 2024 17:41:30 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 2 Oct 2024 17:41:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bzuzXa/0VyQAnUJG668TwrVi/8Ym9/PGmDBoyXvGOPrlQz2SnH4Zq0z1t3bkwd92amz8g5x4INdpdzu9jWdLWvXfntrWOtQJunMuuPD3Q5rjAJtU/7BpuAqaifYSkgga/Dd8eswfXwo0Nipql50yz2RDgsQe0rO4ydK8tKVsmX/qBKWGOrnHrlkuxQjiflgN1fb23ATNs7sa/84rXMO9yupc565wWYuFu0QryrTTGSW84d3W2XgYpCq7Uz2UONU1ikwtpHAahV3OvF3ee5uz80f0dz6nq863xEtTXxl2IZVTsARccfLyF/q6xXaK+WlorGy5Z54h7VhGfXVZGZF+hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LXSj6/Lvpscb5GgJgvJ0AKEQR7CT0bUz+39QEenVSEQ=;
 b=w7r6FtkudKcYGO6duhR/mYANfxZjkEVBHcTIia74UwC46xnTvqSFFzXideEuNS6/KSTvtmKwOA04p/TNR7jcujT4BJQd/RFDC0y3Zvvk2GtspSIvhHSKMWqf9jNOXwvBL6YKljmHJEBKJ8EjFvqnftQk8SDqBD+k17rJKnS31YYJPhtgtxdARDJEHtedaTG8pGChcCgrWPSNDNQ2JpMo3JVlAWA6LUJtto6yix7xpy7PMtIaUd6HjRlZXcc3Fz8tY5+Oxp+mPpnB7mCytuojryTL/Ym1mPb6bgJn9zWzQLDm3Q45Q6nr5vtWF/vFg7w3h6aubf8zFxjP8lGbElG2xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB4780.namprd11.prod.outlook.com (2603:10b6:806:11d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Thu, 3 Oct
 2024 00:41:27 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8005.024; Thu, 3 Oct 2024
 00:41:27 +0000
Date: Thu, 3 Oct 2024 00:41:22 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Dominik Grzegorzek
 <dominik.grzegorzek@intel.com>, Maciej Patelczyk <maciej.patelczyk@intel.com>
Subject: Re: [PATCH 03/18] drm/xe/eudebug: Introduce discovery for resources
Message-ID: <Zv3oMj4rkhZHw5JZ@DUT025-TGLU.fm.intel.com>
References: <20241001144306.1991001-1-mika.kuoppala@linux.intel.com>
 <20241001144306.1991001-4-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241001144306.1991001-4-mika.kuoppala@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0209.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB4780:EE_
X-MS-Office365-Filtering-Correlation-Id: 14754fe2-1682-44ad-b57d-08dce3441d6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ou5ahn6hYfOODBm3I6dLwhFBJ1lyvRdZkFCL44z7S9c2e7N5085bpodJMiv4?=
 =?us-ascii?Q?0PQ+aeKQFjE3lDZ642qLA8B9+GlqrQ58XETidU7yKMP5HNd4EHgiaC++mv/3?=
 =?us-ascii?Q?YeC5jhFY2DRiCEnhoe/rpuWHAKy4iz+S+Rab96ok4ZhlQY60RQMiTC2mEyG9?=
 =?us-ascii?Q?Yzxdr0KaIJ2CItbIthP7jz3HbIOHLb2LDK0Vq6dEQ9NbGHLWE2GZVMW/IX2M?=
 =?us-ascii?Q?eHta5aS4p+cE2CSyta+nERTd4MQ/nD3bCIm2cMCzvwqZxN5XUNmHOY6tAs2k?=
 =?us-ascii?Q?mOIGWhOqNy5BaLvn2Vejf4+PRFOvTCflsvfQ3Er1Awua2Auevou+ur/5US0K?=
 =?us-ascii?Q?MMjrbwW9sizCTXp1otLc2pQiPJ4BRFey0B2hcdP3ZRaBWzJSYgqlDT/HBqP9?=
 =?us-ascii?Q?v5WGS7Wc+CHPEBHbUq6zzqeY9/augyAHIQqumNkWz5qwIqCHcca+gzVVmE6I?=
 =?us-ascii?Q?KiVvAKCQxTh6OWaTLVYGqnZ9PaAQWz0ARJpDx46Z0FNtRNWwh9Dd1D758PIf?=
 =?us-ascii?Q?o6qBGkZ8ZXtq8Xztcf+LZnSfBojnmHR9PTcRITxrVEBzaMHiU+nHXsDQnXMq?=
 =?us-ascii?Q?3TodPHMza1IppCGPaSfAhzEoDromEzxGdeemGhLOdgRN8y6CJVu2TXPvtN/s?=
 =?us-ascii?Q?iLKm/UcjxGkB1RoZenPGdMQCDN2RexuTwCw2eoIWXYy4H+xjFBxN/ZvPqDpk?=
 =?us-ascii?Q?F2iwIumvXmcOOh9PRbR/lE8HNK2AWuV+d04UZK+gKMr3HYUNVbnsRfDsLIBW?=
 =?us-ascii?Q?mNlL1Z5SQV4Cjh8dgC2HZFR7FhB2wG3oGp0g6+aBA8xOSzTHOkPMsWtv6dfw?=
 =?us-ascii?Q?VKdym5U9Q6QZM9IiLbPl9VR/fZ6Bev3CT8zUFN2n1qGNITDpQcMWqAiloQXL?=
 =?us-ascii?Q?+KHqcC7iqVDRpyGmpPbhWTdt11xvhjeM2W1iJPDhHV/Cxzhb0rAjq1O/zmuU?=
 =?us-ascii?Q?PT6sIkeNXBpnpelWiLZOGIIIACFIBTMQ84l068kc+JyrVCd4h2/iRUE6x+/I?=
 =?us-ascii?Q?hrd2BYC8GBvDq/nn5KHM8pbaf8okD+oe/cvuVNU8C7Z0Ik/DIlxparv/YtB8?=
 =?us-ascii?Q?/kPJue8ws6SyKojrjvv0CdtXuCy6seb7NI7ERUodlLWWQFpPBFkpUPWgrHGq?=
 =?us-ascii?Q?SY9PLxTNjGbuTvGMLb9q6b66Tnm7UprtfKVewyKzl9+PyZoHEIlRCN4m8uzu?=
 =?us-ascii?Q?jwBONqoSbIX/ur10WR/NH0NC3+YZwxB6bhmdZGPGt9jWEPoM+TrUiMqYP/dy?=
 =?us-ascii?Q?VXshmz1ThDlXgr4+Dm0ZQRdvTbVu+KpQQsllncrdLg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e7J9FFWgE8c3/kQbPL4pJrJ926vjX98Zk/1O2QmXDYiNZfxj7hI0bFHhIuSC?=
 =?us-ascii?Q?svHssbfpJAnzzSTV7ErMyph5pSClOnAn46PQeOR1XEbo+2/CTtuQf9sExOAo?=
 =?us-ascii?Q?uf4niRdx0auxq9l09ixzkdPM+HQjU2TKe6mm35XSGclofvafitQ+eLE/KlFq?=
 =?us-ascii?Q?JRZHF1562HSvyXD63gRje9bz9FSJLG60dziOHvo6Dl+AzZpAbOGLRMYdJgy4?=
 =?us-ascii?Q?+aKUSypGZVZBdAkz/ZKsAssCy5P786ENACgBNZn3N6YUK3fTHbkduo/Jw4YZ?=
 =?us-ascii?Q?VIZXmVHBOr1+nJF3Z1BnYcRsxJZwthxKtj0LAYtzK8VOyB+H7qgOChdzXhqD?=
 =?us-ascii?Q?5sr0MJappCYUhEHlele08iPcZ8C6Fz64lmiwUQ5ZcIUt1pT9fJmk22A2nFqQ?=
 =?us-ascii?Q?9IgrCX7J5zLLN1t1Vh5tA9ud9X3Q9iy30H6qWMkeBogJRxu2Uhhvdv+TUIwi?=
 =?us-ascii?Q?z7ixgj3edqVKP3Nd+c8uBmvSFQ6H7oN9RF8utXpfPP51X6+eUT0Uor5SLp5Y?=
 =?us-ascii?Q?IJ4BZhSmLQTCDZ0FlbvQh/xxdqr1YLeevsYMQOy/opu46DsAfCHBIDqJRugF?=
 =?us-ascii?Q?HnIIazH+4jcvZxstAoKVDAGS32KUcHMWy97s8dVq2rHmS3bKvkfcVJsXrzwE?=
 =?us-ascii?Q?aDVFVgt/MzwKTdpQxCIaTqGKF8CpnsAAEmvetutdHZ4p/LVAvZQhP/wGmkF3?=
 =?us-ascii?Q?wwht8G9QCYkNc4yHqXDs1nMcC39PiWIhh96mJC3ck6gRrKcz9fs2ywkBwiqi?=
 =?us-ascii?Q?vq2mavZOpIRQSsn86NNyIrZhtpIuNY3WIeUtJMWdlbj1/VCDwbQh0LaUbICI?=
 =?us-ascii?Q?/b4sQIIlEUcZFwZLPRhSlk+eQsBzuS0LsoE/KUlG0bBFVAzD6HsZcxzWHDID?=
 =?us-ascii?Q?e6Kf+UlgdLbIVl3RZXJx64qG0vvU2HIFy4P+SL41de8XkEi8khMs3mr7eH8+?=
 =?us-ascii?Q?bDtEPAD/Ymy7oVC8D0DSphAdMjyfcZxP7DZfZv2IDZSYiMUVlCEhLzylPYxz?=
 =?us-ascii?Q?BXKRtSeLtAntLXA0YxSX1AJzIohqDlBIouTaqjrNgJUK+v0dB696z337byYB?=
 =?us-ascii?Q?ihLyy6TMFS8eGXvgL6okXi0pEhls59F95HOqbtxFxfAzWhK7FPvrPvWMoApj?=
 =?us-ascii?Q?tax8xfPX28KRfU29+rxeTUuJyCF/ff8zJ3CpYo0VTTvchp54gBAwBex5wsQO?=
 =?us-ascii?Q?ahEBJw0CzMxCAPsLpHmJ5wjNBB3tdMcVvudqTaPZcUA8qrZBj5g2bszBzrrq?=
 =?us-ascii?Q?uUQGJu91O8djqZxp8+4WznCpm58mtM1GEWw8K5Y/bgGj1O02YEAvHfXgS3v0?=
 =?us-ascii?Q?ndN1+88FnydgX6eEg7wvC0nye7MvfGRISpIj+Qwy2401FIV2VVmS3yJ/Xom5?=
 =?us-ascii?Q?z9Jo9cBq7MyAyhReMrq2/cua9c2ejzvA+XODsx8mDy4hO3OdgvFFGxlOnhp/?=
 =?us-ascii?Q?8O/Zy+psJuxi/+ttGvR6H54I1yj5luIrb5BR6Uq49cb08sJJeWeLtk0U9cM3?=
 =?us-ascii?Q?5kjk+xJrIEGmCw3ftCYWl/pjaXKZ8klrTuQlGV68cvdrrEfKLLzLH7eEM9mP?=
 =?us-ascii?Q?RDhXtfMIenxW1Opnbdcvr/GYM6/vTWAqujWeqiqzfDV1XWEJHxH2nxjoSb7x?=
 =?us-ascii?Q?4A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 14754fe2-1682-44ad-b57d-08dce3441d6c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 00:41:27.2061 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4pz0ey5kL/BaAuWRKL3QVJdN+W3mKcAMgvVdH1wgKP8YfaZ+2gwjziM7WShkT4osg10oG1+w+VcNqDcmKm8VyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4780
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

On Tue, Oct 01, 2024 at 05:42:51PM +0300, Mika Kuoppala wrote:
> Debugger connection can happen way after the client has
> created and destroyed arbitrary number of resources.
> 
> We need to playback all currently existing resources for the
> debugger. The client is held until this so called discovery
> process, executed by workqueue, is complete.
> 
> This patch is based on discovery work by Maciej Patelczyk
> for i915 driver.
> 
> v2: - use rw_semaphore to block drm_ioctls during discovery (Matthew)
>     - only lock according to ioctl at play (Dominik)
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Co-developed-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
> Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c        |  10 +-
>  drivers/gpu/drm/xe/xe_device.h        |  34 +++++++
>  drivers/gpu/drm/xe/xe_device_types.h  |   6 ++
>  drivers/gpu/drm/xe/xe_eudebug.c       | 135 +++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_eudebug_types.h |   7 ++
>  5 files changed, 185 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 5615e2c23bf6..ec5eedbbf320 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -215,8 +215,11 @@ static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>  		return -ECANCELED;
>  
>  	ret = xe_pm_runtime_get_ioctl(xe);
> -	if (ret >= 0)
> +	if (ret >= 0) {
> +		xe_eudebug_discovery_lock(xe, cmd);
>  		ret = drm_ioctl(file, cmd, arg);
> +		xe_eudebug_discovery_unlock(xe, cmd);
> +	}
>  	xe_pm_runtime_put(xe);
>  
>  	return ret;
> @@ -233,8 +236,11 @@ static long xe_drm_compat_ioctl(struct file *file, unsigned int cmd, unsigned lo
>  		return -ECANCELED;
>  
>  	ret = xe_pm_runtime_get_ioctl(xe);
> -	if (ret >= 0)
> +	if (ret >= 0) {
> +		xe_eudebug_discovery_lock(xe, cmd);
>  		ret = drm_compat_ioctl(file, cmd, arg);
> +		xe_eudebug_discovery_unlock(xe, cmd);
> +	}
>  	xe_pm_runtime_put(xe);
>  
>  	return ret;
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 4c3f0ebe78a9..b2fc85b1d26e 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -7,6 +7,7 @@
>  #define _XE_DEVICE_H_
>  
>  #include <drm/drm_util.h>
> +#include <drm/drm_ioctl.h>
>  
>  #include "xe_device_types.h"
>  #include "xe_gt_types.h"
> @@ -191,4 +192,37 @@ void xe_device_declare_wedged(struct xe_device *xe);
>  struct xe_file *xe_file_get(struct xe_file *xef);
>  void xe_file_put(struct xe_file *xef);
>  
> +#if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
> +static inline int xe_eudebug_needs_lock(const unsigned int cmd)
> +{
> +	const unsigned int xe_cmd = DRM_IOCTL_NR(cmd) - DRM_COMMAND_BASE;
> +
> +	switch (xe_cmd) {
> +	case DRM_XE_VM_CREATE:
> +	case DRM_XE_VM_DESTROY:
> +	case DRM_XE_VM_BIND:
> +	case DRM_XE_EXEC_QUEUE_CREATE:
> +	case DRM_XE_EXEC_QUEUE_DESTROY:
> +	case DRM_XE_EUDEBUG_CONNECT:
> +		return 1;
> +	}
> +
> +	return 0;
> +}
> +
> +static inline void xe_eudebug_discovery_lock(struct xe_device *xe, unsigned int cmd)
> +{
> +	if (xe_eudebug_needs_lock(cmd))
> +		down_read(&xe->eudebug.discovery_lock);
> +}
> +static inline void xe_eudebug_discovery_unlock(struct xe_device *xe, unsigned int cmd)
> +{
> +	if (xe_eudebug_needs_lock(cmd))
> +		up_read(&xe->eudebug.discovery_lock);
> +}
> +#else
> +static inline void xe_eudebug_discovery_lock(struct xe_device *xe, unsigned int cmd) { }
> +static inline void xe_eudebug_discovery_unlock(struct xe_device *xe, unsigned int cmd) { }
> +#endif /* CONFIG_DRM_XE_EUDEBUG */
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index cb4b52888a4b..54ceeee7cf75 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -542,6 +542,12 @@ struct xe_device {
>  
>  		/** @available: is the debugging functionality available */
>  		bool available;
> +
> +		/** @ordered_wq: used to discovery */
> +		struct workqueue_struct *ordered_wq;
> +
> +		/** discovery_lock: used for discovery to block xe ioctls */
> +		struct rw_semaphore discovery_lock;
>  	} eudebug;
>  #endif
>  
> diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
> index ea0cfd7697aa..c294e2c6152b 100644
> --- a/drivers/gpu/drm/xe/xe_eudebug.c
> +++ b/drivers/gpu/drm/xe/xe_eudebug.c
> @@ -299,6 +299,8 @@ static bool xe_eudebug_detach(struct xe_device *xe,
>  	}
>  	spin_unlock(&d->connection.lock);
>  
> +	flush_work(&d->discovery_work);
> +
>  	if (!detached)
>  		return false;
>  
> @@ -409,7 +411,7 @@ static struct task_struct *find_task_get(struct xe_file *xef)
>  }
>  
>  static struct xe_eudebug *
> -xe_eudebug_get(struct xe_file *xef)
> +_xe_eudebug_get(struct xe_file *xef)
>  {
>  	struct task_struct *task;
>  	struct xe_eudebug *d;
> @@ -433,6 +435,24 @@ xe_eudebug_get(struct xe_file *xef)
>  	return d;
>  }
>  
> +static struct xe_eudebug *
> +xe_eudebug_get(struct xe_file *xef)
> +{
> +	struct xe_eudebug *d;
> +
> +	lockdep_assert_held(&xef->xe->eudebug.discovery_lock);
> +
> +	d = _xe_eudebug_get(xef);
> +	if (d) {
> +		if (!completion_done(&d->discovery)) {
> +			xe_eudebug_put(d);
> +			d = NULL;
> +		}
> +	}
> +
> +	return d;
> +}
> +
>  static int xe_eudebug_queue_event(struct xe_eudebug *d,
>  				  struct xe_eudebug_event *event)
>  {
> @@ -810,6 +830,10 @@ static long xe_eudebug_ioctl(struct file *file,
>  	struct xe_eudebug * const d = file->private_data;
>  	long ret;
>  
> +	if (cmd != DRM_XE_EUDEBUG_IOCTL_READ_EVENT &&
> +	    !completion_done(&d->discovery))
> +		return -EBUSY;
> +
>  	switch (cmd) {
>  	case DRM_XE_EUDEBUG_IOCTL_READ_EVENT:
>  		ret = xe_eudebug_read_event(d, arg,
> @@ -832,6 +856,8 @@ static const struct file_operations fops = {
>  	.unlocked_ioctl	= xe_eudebug_ioctl,
>  };
>  
> +static void discovery_work_fn(struct work_struct *work);
> +
>  static int
>  xe_eudebug_connect(struct xe_device *xe,
>  		   struct drm_xe_eudebug_connect *param)
> @@ -866,9 +892,11 @@ xe_eudebug_connect(struct xe_device *xe,
>  	spin_lock_init(&d->connection.lock);
>  	init_waitqueue_head(&d->events.write_done);
>  	init_waitqueue_head(&d->events.read_done);
> +	init_completion(&d->discovery);
>  
>  	spin_lock_init(&d->events.lock);
>  	INIT_KFIFO(d->events.fifo);
> +	INIT_WORK(&d->discovery_work, discovery_work_fn);
>  
>  	d->res = xe_eudebug_resources_alloc();
>  	if (IS_ERR(d->res)) {
> @@ -886,6 +914,9 @@ xe_eudebug_connect(struct xe_device *xe,
>  		goto err_detach;
>  	}
>  
> +	kref_get(&d->ref);
> +	queue_work(xe->eudebug.ordered_wq, &d->discovery_work);
> +
>  	eu_dbg(d, "connected session %lld", d->session);
>  
>  	return fd;
> @@ -918,13 +949,18 @@ void xe_eudebug_init(struct xe_device *xe)
>  	spin_lock_init(&xe->eudebug.lock);
>  	INIT_LIST_HEAD(&xe->eudebug.list);
>  	INIT_LIST_HEAD(&xe->clients.list);
> +	init_rwsem(&xe->eudebug.discovery_lock);
>  
> -	xe->eudebug.available = true;
> +	xe->eudebug.ordered_wq = alloc_ordered_workqueue("xe-eudebug-ordered-wq", 0);
> +	xe->eudebug.available = !!xe->eudebug.ordered_wq;
>  }
>  
>  void xe_eudebug_fini(struct xe_device *xe)
>  {
>  	xe_assert(xe, list_empty_careful(&xe->eudebug.list));
> +
> +	if (xe->eudebug.ordered_wq)
> +		destroy_workqueue(xe->eudebug.ordered_wq);
>  }
>  
>  static int send_open_event(struct xe_eudebug *d, u32 flags, const u64 handle,
> @@ -990,21 +1026,25 @@ void xe_eudebug_file_open(struct xe_file *xef)
>  	struct xe_eudebug *d;
>  
>  	INIT_LIST_HEAD(&xef->eudebug.client_link);
> +
> +	down_read(&xef->xe->eudebug.discovery_lock);
> +
>  	spin_lock(&xef->xe->clients.lock);
>  	list_add_tail(&xef->eudebug.client_link, &xef->xe->clients.list);
>  	spin_unlock(&xef->xe->clients.lock);
>  
>  	d = xe_eudebug_get(xef);

This looks like this could deadlock.

- discovery_work_fn is queued with &d->discovery not complete
- This function runs and grabs &xef->xe->eudebug.discovery_lock in read
  mode
- completion_done(&d->discovery) is waited on xe_eudebug_get
- discovery_work_fn can't complete d->discovery) on
  &xef->xe->eudebug.discovery_lock in write mode

The summary is - it not safe to wait on '&d->discovery' while holding
&xef->xe->eudebug.discovery_lock.

Matt

> -	if (!d)
> -		return;
> +	if (d)
> +		xe_eudebug_event_put(d, client_create_event(d, xef));
>  
> -	xe_eudebug_event_put(d, client_create_event(d, xef));
> +	up_read(&xef->xe->eudebug.discovery_lock);
>  }
>  
>  void xe_eudebug_file_close(struct xe_file *xef)
>  {
>  	struct xe_eudebug *d;
>  
> +	down_read(&xef->xe->eudebug.discovery_lock);
>  	d = xe_eudebug_get(xef);
>  	if (d)
>  		xe_eudebug_event_put(d, client_destroy_event(d, xef));
> @@ -1012,6 +1052,8 @@ void xe_eudebug_file_close(struct xe_file *xef)
>  	spin_lock(&xef->xe->clients.lock);
>  	list_del_init(&xef->eudebug.client_link);
>  	spin_unlock(&xef->xe->clients.lock);
> +
> +	up_read(&xef->xe->eudebug.discovery_lock);
>  }
>  
>  static int send_vm_event(struct xe_eudebug *d, u32 flags,
> @@ -1112,3 +1154,86 @@ void xe_eudebug_vm_destroy(struct xe_file *xef, struct xe_vm *vm)
>  
>  	xe_eudebug_event_put(d, vm_destroy_event(d, xef, vm));
>  }
> +
> +static int discover_client(struct xe_eudebug *d, struct xe_file *xef)
> +{
> +	struct xe_vm *vm;
> +	unsigned long i;
> +	int err;
> +
> +	err = client_create_event(d, xef);
> +	if (err)
> +		return err;
> +
> +	xa_for_each(&xef->vm.xa, i, vm) {
> +		err = vm_create_event(d, xef, vm);
> +		if (err)
> +			break;
> +	}
> +
> +	return err;
> +}
> +
> +static bool xe_eudebug_task_match(struct xe_eudebug *d, struct xe_file *xef)
> +{
> +	struct task_struct *task;
> +	bool match;
> +
> +	task = find_task_get(xef);
> +	if (!task)
> +		return false;
> +
> +	match = same_thread_group(d->target_task, task);
> +
> +	put_task_struct(task);
> +
> +	return match;
> +}
> +
> +static void discover_clients(struct xe_device *xe, struct xe_eudebug *d)
> +{
> +	struct xe_file *xef;
> +	int err;
> +
> +	list_for_each_entry(xef, &xe->clients.list, eudebug.client_link) {
> +		if (xe_eudebug_detached(d))
> +			break;
> +
> +		if (xe_eudebug_task_match(d, xef))
> +			err = discover_client(d, xef);
> +		else
> +			err = 0;
> +
> +		if (err) {
> +			eu_dbg(d, "discover client %p: %d\n", xef, err);
> +			break;
> +		}
> +	}
> +}
> +
> +static void discovery_work_fn(struct work_struct *work)
> +{
> +	struct xe_eudebug *d = container_of(work, typeof(*d),
> +					    discovery_work);
> +	struct xe_device *xe = d->xe;
> +
> +	if (xe_eudebug_detached(d)) {
> +		complete_all(&d->discovery);
> +		xe_eudebug_put(d);
> +		return;
> +	}
> +
> +	down_write(&xe->eudebug.discovery_lock);
> +
> +	eu_dbg(d, "Discovery start for %lld\n", d->session);
> +
> +	discover_clients(xe, d);
> +
> +	eu_dbg(d, "Discovery end for %lld\n", d->session);
> +
> +	complete_all(&d->discovery);
> +
> +	up_write(&xe->eudebug.discovery_lock);
> +
> +	xe_eudebug_put(d);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_eudebug_types.h b/drivers/gpu/drm/xe/xe_eudebug_types.h
> index a5185f18f640..080a821db3e4 100644
> --- a/drivers/gpu/drm/xe/xe_eudebug_types.h
> +++ b/drivers/gpu/drm/xe/xe_eudebug_types.h
> @@ -19,6 +19,7 @@
>  struct xe_device;
>  struct task_struct;
>  struct xe_eudebug_event;
> +struct workqueue_struct;
>  
>  #define CONFIG_DRM_XE_DEBUGGER_EVENT_QUEUE_SIZE 64
>  
> @@ -96,6 +97,12 @@ struct xe_eudebug {
>  	/** @session: session number for this connection (for logs) */
>  	u64 session;
>  
> +	/** @discovery: completion to wait for discovery */
> +	struct completion discovery;
> +
> +	/** @discovery_work: worker to discover resources for target_task */
> +	struct work_struct discovery_work;
> +
>  	/** @events: kfifo queue of to-be-delivered events */
>  	struct {
>  		/** @lock: guards access to fifo */
> -- 
> 2.34.1
> 

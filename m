Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 526F7CEE343
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 17:26:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11DAF10E10B;
	Tue, 18 Nov 2025 17:26:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nne51JEg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AE1B10E10B
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 17:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763486774; x=1795022774;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=74YmRu/lgjZo2nD+W6pW3UwYAUqllvRhLVwsDB7USM4=;
 b=Nne51JEgL6tUk4hEJ6Z6pNd3uoQyuXIpaVWfoE1x54umqVy2dfkap8xX
 RB4g2cvnbjrnkvL/W/H08Bo8Ad2NvyfSjv9+T0k5a/NJ5aQQG9LV3baMt
 S7DdEfcExGBQZzbX4FlTQknt6yNz+NpGsHgylMpuWRLREr97BxffgKneH
 3ouIpoadt2ZXgzQ6MK4cQAVJIVk/aDsuybW4AdvlOcurn2KC9+lQhjbXj
 A5RZ2DlEpD2c+GTse4O9O1fvInaKE/NVErjFfstwSLtw8VkBJjSEYsiuX
 deTPFmN8DlXkIdT7advfh5jyboHRRdJjWFsI1zhDHA8IPR/+fhaPWmaUV A==;
X-CSE-ConnectionGUID: MbX0OI8MQkKIxTttF0b63g==
X-CSE-MsgGUID: 20VXN9qaTJuUroRxQiQyig==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="76195016"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="76195016"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 09:26:14 -0800
X-CSE-ConnectionGUID: HgjONwvNQMm6+hAWgtrAkw==
X-CSE-MsgGUID: psPtkNrDQBKN1d/83phH9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="228151252"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 09:26:14 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 09:26:13 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 18 Nov 2025 09:26:13 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.51) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 09:26:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DAnRRIqmnRnMb0nDFpd8bLO9WcwVNL2N7ipTAUzs8hOGxfFuHbnaboTG+02ab7HORPLYHuMeqPd4qy800Trjr3TFCTiQGBZPkPxiAZgVLSjgJdZ8WSc5QQmGIXQ+C1VyruaShHWjWAlvCmJMr6ZCIViR+9kkwIUU9U4rGPQ6UqUqsdU63z6VRqcori15NgVQbnSXD03L05CPAmtfJIx7E9316TX2w1rd2dT01n0je1lEvw/298M0PEinaKlAG5PinvlA72KD9+vxFvhftscHsxJdtABXbq2TObNEziV6USMxciAFXohYJPR9mP22hN77Yemjt6wvJrqfmXlLnj6Log==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DQft6f0gzMdD0HAfc2YfE3uhskrd+kOCfH3DGcUBvso=;
 b=qYo+Aslj9QaNplJCtckXsXsUT51eGGGcz7g2ByDk1xCSYuMfnJc3psZwBiaC5qxMjM5J5K5ofkqQTWtW9YVQdlprH0+ZjJb/YvY0cpoyoGDBu1YC8PeVHS4dX8HJbgSb0zrB20R46hRBhOWE1vrbAqhQVzwyBA/1mx/Blb9NVEWpax9rNnVdME6umQYafvwov3C6CVukIpwdY9L5O42n+zSyqdcmfAApg2DCHj7WD8Q1lTX2yIZhHnkjIcks0jJEcGEJ6hb7dZ6tkNwPltbSMd4K9q9q9cXkTwsjDxiW9S6bRHBetcUajMW0+fRj3eBKIGgCyHkGH5VaHWgVHheuLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS4PPF0BAC23327.namprd11.prod.outlook.com (2603:10b6:f:fc02::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 17:26:06 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 17:26:06 +0000
Date: Tue, 18 Nov 2025 09:26:04 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Michal Winiarski <michal.winiarski@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>
Subject: Re: [PATCH v3 2/2] drm/xe/vf: Fix up GGTT mappings on S4 resume
 across VFs.
Message-ID: <aRysLDZftpISbTpr@lstrano-desk.jf.intel.com>
References: <20251118124741.3504754-1-satyanarayana.k.v.p@intel.com>
 <20251118124741.3504754-3-satyanarayana.k.v.p@intel.com>
 <aRyn+7n0vqtEc5jC@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aRyn+7n0vqtEc5jC@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR03CA0243.namprd03.prod.outlook.com
 (2603:10b6:303:b4::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS4PPF0BAC23327:EE_
X-MS-Office365-Filtering-Correlation-Id: 91110540-5294-4755-35fe-08de26c78e85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dnKMElCGGSzeSKxN+5WuUKi6fbG3sg7tdhIHmid2nYh1iaP7wOEmQvW18PfP?=
 =?us-ascii?Q?mpPfeYFhXiTwf2MV+HtO8eiR1O56lGiygCFuPJQs2wrT82yuh4pOispYrYY0?=
 =?us-ascii?Q?WA+FywTAkOfRvqdB3Zvkrx6D1Es8H+RlIaOrwtcv3+D8jaiGjy7BGS8kYrB1?=
 =?us-ascii?Q?OZysWyR+hGt1TcBa3S/aY8PXWqa7dJwTM6P4jglxLrocLG9wD+RqCp36JlIc?=
 =?us-ascii?Q?pQuJV1Nw7zc+hBbFJo9wlOQztVWXXhWaLLaVFqgt+G25wjuhWGvKtGBYtEWn?=
 =?us-ascii?Q?Eeh9y8/0w21kHFQhB1hgXmh20a1GLWqYQ9qqjXAx9CQR+YzGK/vPNFWp4wu+?=
 =?us-ascii?Q?rUcWLnkfpY9gK398Iue1QDszhExMvnH6OMMSUJhpKlPPRo5Yq5QC0mY4+Fx7?=
 =?us-ascii?Q?qQeynxBpUw4JEl0w1/Q5if4lkCRX0stMLdH56BC2zXDlZRY/8VPvzw4iI86K?=
 =?us-ascii?Q?glbMI+PgTe1eAXLLIs4y7PcUDtYokBcW4pL1VoqRMpFq8BqfuAS1SiEfyXhY?=
 =?us-ascii?Q?RJMItXJT8l/hcY5U7Ps/UBHRfkt181bl+EYPnhlg3KSKzn0Zw8taOTMxT1Km?=
 =?us-ascii?Q?dbOx0udDb+kSVCKjD6ZdEDFAQ37/mowb5wifIvjcON/F0BYlmdJFeWb8zCVR?=
 =?us-ascii?Q?MrxvD2ejHNkeiWZcXf3hrH9OD+aQbhuBhcbREc8P67JqZMX42Be/8UADzge/?=
 =?us-ascii?Q?WSi/bYquQ75K3rJEZ1vYw53PU5Iz870eTJtP3MhvCfHcinQrdXLPxVOoUc2S?=
 =?us-ascii?Q?NnQBASqSeD3qMI+OJLN+iBrb7btufzVjBrqtHsLm2+BnOPqN/5188kEWLEyR?=
 =?us-ascii?Q?AC6ztlOdinxnXw9Yr4J1F3d5/MPuG9hVoEiREbfAUt7bqaAQDmuyWUY2J8Ze?=
 =?us-ascii?Q?R7xZLCNazjm4F3VWRe0C8FpAedqJ8/GD5gQNfnyq4UZJLfjfzmhXZeVb1+Dr?=
 =?us-ascii?Q?16MygNR3GIfKaT9a3sFgYPQ3VHrLSnk9kE8YGUfXc5AIrPxYIPoMRzAdNNkM?=
 =?us-ascii?Q?tjSNPf+WGWgeNNPOJ/jPhT0gEbL9jxZio/moGRDcfwZrqq0c6kOpEZKaAPpv?=
 =?us-ascii?Q?bP04DRfgioZWRdOC/vrSSlkIe3icR6zXb49ew6eM6klcq1ZnqzfFzmuQ+nf7?=
 =?us-ascii?Q?JNMg9cX4WmY+zj7TqJ++w5E1fyR84VNswS6cQHehxI/7ilFV4SM5svItnOn0?=
 =?us-ascii?Q?C+d5BcPBn/0Ga2VY1VoFUwnlBUn1GkvA/emEVfAPYQBdjw3VK6ugNp2U5uCW?=
 =?us-ascii?Q?wOp+zM3KlhCCPLCJC2tUlZt+Hx9J65HsMIkMlU2fiQjxUlvBEy3LM6dCXjrT?=
 =?us-ascii?Q?lTKkbGu4hvqYiE9duRykI4BfSQ36fUp7fTIrEbIBkXoVt6OSgklE18T39agh?=
 =?us-ascii?Q?7ZjrVuZ7rBMdjqomywdl7CMwAqSM2uIPX3qaCX/lVJQo2bzuCBzZoP/eHUTX?=
 =?us-ascii?Q?xCVfRPi42nD4Sx+w1r1s5Rk240w6z/KU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GIIjJfKTRv9QqN0k1cyO28hLyW6bZi9xMMa4avIewK8hGQUfmaQ+Rc9hciX6?=
 =?us-ascii?Q?nbTMkry72iIzlElaPTdaEd2qw5/9U21ZvSJwVrdx78SI1WEWJrUznvjwutrE?=
 =?us-ascii?Q?nPwnZq0iDbY/0FHKnrPqb7OMvgcnCeqJ0daKoihg0MxplAxixlJrsgAdXW+h?=
 =?us-ascii?Q?iREzUdshhbpInqmJhcEQ/8EFoWNRB20m/1eqKTIKImRmdm7JMYigUTsboEbW?=
 =?us-ascii?Q?8cmJYkgSvYjY4TH5l2D40Dqr2RD8+nkYzlvOjO7YeB63HJyUeaJsdbHieyO4?=
 =?us-ascii?Q?hKROdjtn0RB/4yEwLJgu1OvJnU7r4fA4vTIRxrYfH/Uc5Vi0jOK4QrqhNb0K?=
 =?us-ascii?Q?p/4nvaCaovzHuVpgGUipQ342f79GCxqU5z7zeS3GH5Md5sa0LZOQPRIl928S?=
 =?us-ascii?Q?ooTqgNhm9ySdo2su2zzhNM7H9PPkrR35Ih1evTr1bc3Udlbij6qujEjFMCOu?=
 =?us-ascii?Q?oFobGCpmpYE30tF4NEvbckDrermdZngBl0kPy/lP200KQnmqnXhv0chAQn4c?=
 =?us-ascii?Q?/Sz1emMp8CeQfnysEcClcIrDdSW6hOGd8x5/FHtjTH3/aK6avaHq6KwdSUov?=
 =?us-ascii?Q?n4Oi63fSojxirgEwyVBPyo9zN+u7JCedQlfq6fbS3eGeFrW+bS7whf38gqdM?=
 =?us-ascii?Q?7EDCrqgYvtOTUoodE0CQfyx0/kMQRB+QMB6w8OqsLbFgkE6z8ZLFp5m+9xQH?=
 =?us-ascii?Q?6aSHeMvY+gvgAF4igl3x0H1twnMVxu9tJucdkiDJZju7sVMRNWE8r6U5clN4?=
 =?us-ascii?Q?qOWHKtd2a7EL0XpBYHWUktGb9NHEzGnmvHuEGyA6fi5m9TKYbw9XGnxCsOEn?=
 =?us-ascii?Q?486/i8QThwf/Pw5aMqDAzFE94JdCO+Ho60oibWFJ++OzBzzszmgsmKwNoVhg?=
 =?us-ascii?Q?qdik+E0Z3ZH/A7fBdXfnazqheY3LR/RK14tnLlWVPT4m+Tu1CAY9Fsc2KvYy?=
 =?us-ascii?Q?a3ZPC1k2GOshAtM5K+keCZigKLzC6B+Stb2QDYCfi6x2ULtVe6FFgRTfDH3F?=
 =?us-ascii?Q?vGStEGS324WNX1hMEgpzPrV+oblwzQDbwUbAvMwzlqyj0ixckPt9KQ+tQ4M0?=
 =?us-ascii?Q?UK8CIYK+cy4w11q/pKnkiAkUzJZhSelOzJ1cOolhQQVhExCQ6fHvi0WFh2z6?=
 =?us-ascii?Q?IJMVcUd/6e9puYcxZ0PzoJxZjvsFBzTEoFmp/yjCDFXSTdxuW3Z9W5oyYnQM?=
 =?us-ascii?Q?c/CRuvtsjNUAoykmQUkZX1hscE5F0zJZ/ikC4BaQ8Y27boR5DRa7ljSMOhgg?=
 =?us-ascii?Q?U8lcbjOnHctSMShBTyWJ6GtRtoqDNZ3jDC34smmZffAV/EArrS95+Tvryb8y?=
 =?us-ascii?Q?bItqf+Xj030DSv/LnGyPK02GAVm0orf50KOtpwyMU8u1MebYUZxbHWv/+idO?=
 =?us-ascii?Q?bGO+s/hqmudTS0ItxsHQCYCiopfft1SeE4ggjK+lMW7uhI5Omnr/8VJIpEMC?=
 =?us-ascii?Q?b8HFAB/9RCp+s+WY2oszNg8vFN8ZMprclUY/gp68d63jiQhEbYiG81bS0qDO?=
 =?us-ascii?Q?hJaTr3OZ9/XpKrRo01lREIx/dG3FAQ2akS5kHtNZb7w37SFbt3idePwoRUmB?=
 =?us-ascii?Q?Y+X4r5cZ0fRwY6XEyCzUVc0ljIgEZpHPKtsWA8XnfvU+GO9es635C+okQwrn?=
 =?us-ascii?Q?RQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 91110540-5294-4755-35fe-08de26c78e85
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 17:26:06.6047 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NYU71sEb4Cxd9GWSYefz/qKJFoIYvzoW9QMyHvSdA+Pi99IXEe2GSlRwOhtSRqz2OHdR0+owOcC0JXCIYphGuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF0BAC23327
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

On Tue, Nov 18, 2025 at 09:08:11AM -0800, Matthew Brost wrote:
> On Tue, Nov 18, 2025 at 12:47:41PM +0000, Satyanarayana K V P wrote:
> > When SR-IOV is enabled, a VM may suspend on one VF and resume on a
> > different VF after S4 sleep cycle. Because GGTT space is not virtualized,
> > this transition can lead to incorrect GGTT references. To address this,
> > validate the GGTT space during resume and apply necessary fixups if the
> > VF has changed.
> > 
> > Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Cc: Michal Winiarski <michal.winiarski@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> 
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> 

I was little to fast with the RB, one question below.

> > Cc: Tomasz Lis <tomasz.lis@intel.com>
> > 
> > ---
> > V2 -> V3:
> > - Fixed review comments (Michal).
> > - Added a new function xe_gt_sriov_vf_resume_fixups() which handshakes
> > with GUC and does GGTT fixups.
> > - Updated commit message.
> > 
> > V1 -> V2:
> > - Rebased to latest drm-tip.
> > ---
> >  drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 38 +++++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_gt_sriov_vf.h |  1 +
> >  drivers/gpu/drm/xe/xe_pm.c          |  7 ++++++
> >  drivers/gpu/drm/xe/xe_sriov_vf.c    | 30 +++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_sriov_vf.h    |  1 +
> >  5 files changed, 77 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > index be7986537aad..87aa1d6576d6 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > @@ -1335,6 +1335,44 @@ int xe_gt_sriov_vf_init(struct xe_gt *gt)
> >  					vf_migration_fini, gt);
> >  }
> >  
> > +/**
> > + * xe_gt_sriov_vf_resume_early() - Resume from S4.
> > + * @gt: the &xe_gt.
> > + *
> > + * This function shall be called only by VF.
> > + *
> > + * Returns: 0 if the operation completed successfully, or a negative
> > + * error code otherwise.
> > + */
> > +int xe_gt_sriov_vf_resume_early(struct xe_gt *gt)
> > +{
> > +	u64 start, size;
> > +	s64 shift;
> > +	int err;
> > +
> > +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> > +
> > +	err = xe_gt_sriov_vf_bootstrap(gt);
> > +	if (unlikely(err))
> > +		goto out;
> > +
> > +	err = vf_query_ggtt_info(gt, &start, &size, &shift);
> > +	if (unlikely(err))
> > +		goto out;

Now that this function has split out query of shift into 2 functions,
don't we also need to call vf_fixup_ggtt_nodes too - the function will
set the set the base, size, and shift any existing GGTT nodes. With
that, why even split this function as it seems to do all the steps we
need here.

Matt

> > +
> > +	if (shift) {
> > +		err = vf_post_migration_fixups(gt);
> > +		if (unlikely(err))
> > +			goto out;
> > +	}
> > +
> > +out:
> > +	if (unlikely(err))
> > +		xe_gt_sriov_err(gt, "Fixups during resume failed (%d)\n", err);
> > +
> > +	return err;
> > +}
> > +
> >  /**
> >   * xe_gt_sriov_vf_recovery_pending() - VF post migration recovery pending
> >   * @gt: the &xe_gt
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> > index af40276790fa..68026b561d7d 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> > @@ -25,6 +25,7 @@ void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
> >  
> >  int xe_gt_sriov_vf_init_early(struct xe_gt *gt);
> >  int xe_gt_sriov_vf_init(struct xe_gt *gt);
> > +int xe_gt_sriov_vf_resume_early(struct xe_gt *gt);
> >  bool xe_gt_sriov_vf_recovery_pending(struct xe_gt *gt);
> >  
> >  u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
> > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > index 4f8688fd3f00..a6fcddc47d62 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.c
> > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > @@ -24,6 +24,7 @@
> >  #include "xe_late_bind_fw.h"
> >  #include "xe_pcode.h"
> >  #include "xe_pxp.h"
> > +#include "xe_sriov_vf.h"
> >  #include "xe_sriov_vf_ccs.h"
> >  #include "xe_trace.h"
> >  #include "xe_vm.h"
> > @@ -248,6 +249,12 @@ int xe_pm_resume(struct xe_device *xe)
> >  
> >  	xe_display_pm_resume_early(xe);
> >  
> > +	if (IS_SRIOV_VF(xe)) {
> > +		err = xe_sriov_vf_resume_early(xe);
> > +		if (unlikely(err))
> > +			goto err;
> > +	}
> > +
> >  	/*
> >  	 * This only restores pinned memory which is the memory required for the
> >  	 * GT(s) to resume.
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> > index 39c829daa97c..a33f86b7986d 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> > +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> > @@ -191,6 +191,36 @@ int xe_sriov_vf_init_late(struct xe_device *xe)
> >  	return xe_sriov_vf_ccs_init(xe);
> >  }
> >  
> > +/**
> > + * xe_sriov_vf_resume_early() - Early resume operations for SR-IOV Virtual
> > + * Function.
> > + * @xe: the &xe_device to resume
> > + *
> > + * This function shall be called only by VF.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_sriov_vf_resume_early(struct xe_device *xe)
> > +{
> > +	struct xe_gt *gt;
> > +	int err = 0;
> > +	u8 id;
> > +
> > +	xe_assert(xe, IS_SRIOV_VF(xe));
> > +
> > +	for_each_gt(gt, xe, id) {
> > +		err = xe_gt_sriov_vf_resume_early(gt);
> > +		if (unlikely(err))
> > +			goto out;
> > +	}
> > +
> > +out:
> > +	if (unlikely(err))
> > +		xe_sriov_err(xe, "VF resume early failed with (%d)\n", err);
> > +
> > +	return err;
> > +}
> > +
> >  static int sa_info_vf_ccs(struct seq_file *m, void *data)
> >  {
> >  	struct drm_info_node *node = m->private;
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.h b/drivers/gpu/drm/xe/xe_sriov_vf.h
> > index e967d4166a43..54fe6eedeff6 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_vf.h
> > +++ b/drivers/gpu/drm/xe/xe_sriov_vf.h
> > @@ -13,6 +13,7 @@ struct xe_device;
> >  
> >  void xe_sriov_vf_init_early(struct xe_device *xe);
> >  int xe_sriov_vf_init_late(struct xe_device *xe);
> > +int xe_sriov_vf_resume_early(struct xe_device *xe);
> >  bool xe_sriov_vf_migration_supported(struct xe_device *xe);
> >  void xe_sriov_vf_migration_disable(struct xe_device *xe, const char *fmt, ...);
> >  void xe_sriov_vf_debugfs_register(struct xe_device *xe, struct dentry *root);
> > -- 
> > 2.51.0
> > 

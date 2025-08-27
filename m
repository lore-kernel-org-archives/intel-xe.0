Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21586CA0FED
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 16:47:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C34FD10E097;
	Wed, 27 Aug 2025 16:47:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UEDM11aN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52BD210E097
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 16:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756313267; x=1787849267;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pizSrWOPdsta/teaoRommEaeceTXCMQUs1SoEppf/Co=;
 b=UEDM11aNn4bMUCVm5Asf9DlHNB0pxxaWXFHJdf7aBAEwyKM/eKgHG5KD
 AWVbkLAxUu2Arcqe/kgbuCGM/uHk1xd51c6nBoRCHe+uKH0Vjtho+5TV6
 FzLcCuEHtBpIuct1j4rpLTm8W+uCqikJ3TdotcS/IRL9UyDqAJFO5MByw
 eKBXks2KNHhWhB5THHZpMYSGHEMgSjJ3GeoqbIa/slHTqmsESL+UfzTs5
 NCNDFQfz6vpyTvLo/ikYd/BXmSCWDY1YhKmY/DUzWcvSlN+Im92sQJeLH
 wjZGwLJHb32nwTAk4vWW7749ihXQHSUe5MOyvx5MQvRqA+3f2MXNkJfGi Q==;
X-CSE-ConnectionGUID: lkF4ahOlRFy+NlbI9UcOHA==
X-CSE-MsgGUID: 8JdVePG2QFWK+Tohfl2MhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="76169873"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="76169873"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 09:47:47 -0700
X-CSE-ConnectionGUID: SWh+FNyoTlWRpaOr9BGxzg==
X-CSE-MsgGUID: qMT92AE5RRmfs83sUUOVog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="169791794"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 09:47:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 09:47:46 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 27 Aug 2025 09:47:46 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.57) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 09:47:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ng55Sp7oFK8pMRQoACJrdg0FBCqeo9in4qaJQbZdBGnHyXuXQ1xg5V4CXdHhr26Chq4AtztIhG599UUFw7ZPLJqboeWPELBx0a5a1QmhXBzHnyjVV/fsuTSOKS9HO17+Cod3mGAnMnalylRAOEE4xGFE8i2caRS2ubiTwILd8rhSjhtB3PXNTWFO8V0x0U2MuHT7fk4MrpaK/1Je+Aq0QL09ucJceNkyEDaZ8nNOYuIempy4i0PI4ffRmGuwq8WacOxZPPPlY7d43G1oRp9TkdmDuNFZprw5uMKDIkjmK0/UhCwC3OK1Bp46BZG3DcMSrf/RQwvckBBndj1QWucYVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jPP7HvDzlSzAVdSQotxkkU7H47ZEs58h9+LW7l+tK1E=;
 b=oCQP43UNVsslPtE7zQFjmX++jIBzKKWBiV1Yqz78lPWcGUt0+28aHPtfkEuP8qVzeseC3iH5RpU88csE0YvZDIASOQSpB7vO1o5r0M/z8AXmIBJDIoH7E0iQWwboABlwTs1oM9zS9VqSIXLoOFMApawKm943WhqW27g1pjaKzJ12pMy0pRP8V75xhx0RIK4T8ySyQ2/QfnTQCC9H7ny8FOhogL230b1DxquxUX7bLMLiUCUo4CoxU5LsVFlmczvn6aLj7mAOxi1mmOrSNOJ+ENugCC2N602CSoK8NAqclRjjbinrzukbc0+hLGHyYV9hxq9ZFGhnhzMtaocBWdDGLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DM4PR11MB6454.namprd11.prod.outlook.com (2603:10b6:8:b8::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9009.18; Wed, 27 Aug 2025 16:47:41 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 16:47:41 +0000
Date: Wed, 27 Aug 2025 09:47:38 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 1/2] drm/xe: Add clear_stats GT debugfs
Message-ID: <aK82qgz+3xFQzjbq@lstrano-desk.jf.intel.com>
References: <20250819185349.2837153-1-matthew.brost@intel.com>
 <20250819185349.2837153-2-matthew.brost@intel.com>
 <jtyrwedlxl5lsmvnokk36yl67riozdoaouevaqodsqseshiymk@s7gckoneoexq>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <jtyrwedlxl5lsmvnokk36yl67riozdoaouevaqodsqseshiymk@s7gckoneoexq>
X-ClientProxiedBy: BY3PR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:a03:254::25) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DM4PR11MB6454:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f1b6a7f-9a0e-4b14-cb28-08dde5897045
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bCx6pomH1IRQYObQCicZtKGYh/3Q96wpJR+Yqm7m9LovDLZki1eLyTf6kfCH?=
 =?us-ascii?Q?Ywk5dWN5uA+4ZMujqK/XV5qWoN3wE/CmS3SCpFIWo4B2JmtiE3qlssk9PL0c?=
 =?us-ascii?Q?lFRsIq5NAfrsi60SvQ8HVo6MsCs+b3Au7Pvjd20MGywTeptE7jL6iVM4gWl3?=
 =?us-ascii?Q?HGwIVmG2p3b5bk1SNSsqBXS/gi++oQAG5vp/RG8JqrA7UsR8Wo1YKsL2/Ruw?=
 =?us-ascii?Q?Hf0UKhngN8i9gwd9VEHm1S0P3a9OBZcL5mgbOIbnrgJHTVjtSLPP6WjxeNSP?=
 =?us-ascii?Q?wU+0Z4xKFeKnsg0Yv1HknihXYEV4r2u8by0gAxFF0R6yc0SFLj2MJThAie6U?=
 =?us-ascii?Q?qrqrk1Efb2vnj6rvpDA6DR/w8oNiKw3ymWnVubWwFTzErUvEZnYNeucFz7Tu?=
 =?us-ascii?Q?KfHJ+n8oorMFOXmjI393vZzo5s+fTdEIuxrHbK9PbQvhee6PqrGblQxRdxGf?=
 =?us-ascii?Q?beSvufVcuhMJevGkd49qjxbP6u+l1uA3bHonYWOHJUyR5JHxR/Sb6MFz35pa?=
 =?us-ascii?Q?CSeE8s/mK8NHsCLVr1dVdOZBJU8MEy5W9MjwXGlKxd0ZyLJwIMgkt47jQ60G?=
 =?us-ascii?Q?kOJi/Z9D03djX4oLYkdQ+0fmmSSp8nDDc6FhFAV9cbBgx0JVkM5EcydabTyY?=
 =?us-ascii?Q?cDH7LscPn3cvIEefMUZoJYZi5wzK0D2Cw700aWvA88uTfnlEvFPWP3i9DyUS?=
 =?us-ascii?Q?BrmScMMxuZPkYQYXClP0dAwqcfqFxwSGpehxqP3NTkVS4bz/c8C4rCXf8WMw?=
 =?us-ascii?Q?GB6M7/zYTSUNqQK/tTzA0k5y7YIff5GBIs7zDHsZbsTml6W+6XxgnoOdnjc5?=
 =?us-ascii?Q?ew1VAVZb/RnJym/QZft6dxmezrO8WUSf7GBHPOjikC9ybLitYADRbszYZyqz?=
 =?us-ascii?Q?+pbDc/H+431psTy3kDkA0yX+K3qyns1EkQs7Ewr3c25FShaK1tRqJ8DWL4yG?=
 =?us-ascii?Q?87+JfxLnGZIfgkC9Xe75qm9sbFizuoCrKFfmk6WI3UZiQbjfd4FW9owzPwpA?=
 =?us-ascii?Q?J5o0cJMOwLmZAwVN/R6X2DFDA+gQK0WtXrKFjtrG7sUWS6ZapvX8QT40NHMd?=
 =?us-ascii?Q?rHY6TgDkWWi1aIMv8dmq5/7pi8FvtvC28379fl3e9Og8J9cVWhKqvjOpcygG?=
 =?us-ascii?Q?oXFWQ/Ea43nu+s0y/81ZJCFRXKeZbjbmSS4ZBErgRYBWcbRsAvcvd0TfUE/i?=
 =?us-ascii?Q?oCBfmCrlaU/mZ9LIiDjUQI4dX/ZzRQ1/NhpphrrKsOxBYnzxJQolRZZZF1I1?=
 =?us-ascii?Q?FKPu0QDF5d8ZWKr0zF6wEeicd7EQ9+YRJ7oWkgJUsdvH9OY3ir69hZHIyjvh?=
 =?us-ascii?Q?Wvunmj5qXcz1PhHdtmMYTl8gWvuJV5hbZ51M3tiNsJFxY6bE5OEMKYEKJa2X?=
 =?us-ascii?Q?TTMucVWzquuxuJ15NojO9LuMhnOBokB5ZwmKdk8ZCFKXpMB3PsF2612bDFsZ?=
 =?us-ascii?Q?8iTEW77QSf8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pttDMuuJUGKgnugUfsNdwXnI6sDSOCouwjKXKs0SLYQiX41+GIJt+S3Bgumg?=
 =?us-ascii?Q?Pj/4kz50uah2YAGZCxjZtrJaVah9iubRbiJkqrPQUB/d7U9/La2QcZzzSVlI?=
 =?us-ascii?Q?dULCyiJQkTRqQAIdn4aTn+tTcVOgZOSszZfvMUTicp1GJYqaA4ftmFYaRkSS?=
 =?us-ascii?Q?p4L/sJh4uHVH/SfPATMY3kjlcQbHhv3PvNCrFcyjwg6JBaEuKp5oE2qNYfJj?=
 =?us-ascii?Q?HT5Y8glcgLhuDRBq23YfB4/qTS9FF0r1oahTgnhIrygDIJRsidih+8jadBRU?=
 =?us-ascii?Q?bTLcbxDIkUkqfySd1EtWnYGwsb39VPm0sf2lyqtKpnJrqkxzMt2JOl/0VpFq?=
 =?us-ascii?Q?BB3ZiWnJtegjxMXjy1V3r3oyPCRAnNo+G68lirAbaBCXCaoDTv3kUzPSaTH2?=
 =?us-ascii?Q?7SGHpeY33snjpaXjAZB3p85Zutwt8qpzyM66Une1QvxV0+qLoSv7KE3r6Hl9?=
 =?us-ascii?Q?EF+VGn/Dbx2Q4/cIuwdBlMURkjvhgG+1UDHuGjWmCKSVE2Aqv9Y3C0o+iS0n?=
 =?us-ascii?Q?qoFYIA07FREEdnCCozUSP2xXuGc1TfUffgrihEn3VAGLr6hxHDDRxoUb7D+C?=
 =?us-ascii?Q?rsqelGtbP7gETODS5wTSH3qH3GCgf6GPV7S4yTLj+mEyTMFY5o0woYUY8rro?=
 =?us-ascii?Q?0up0pvvUFw3lJktFOedb4A0ly7cVF0K5GQUAaQobNkDD+Ozbc8xdq8ieMRcr?=
 =?us-ascii?Q?aOMoffFGFnAucaZSaFrGaPYjjre/xqCyTmn/jibFqkH1WEn5zdCr2YMJo3Xd?=
 =?us-ascii?Q?Nj9q4U3M7UBPBlrfnjpqI4F1M/krOn1tpyc9HuvIEQl8EKMV1vGaVTxUm4qv?=
 =?us-ascii?Q?Tr7MMUZowjzsK2CP9WjlzEbNoHlnUWX8NlyZ5772eBrl+6kgsTMt7ttpZek4?=
 =?us-ascii?Q?659SuW+aeLA4LnUU+dWZOBmKlgvkcSPF9+EHv7PchcZOwPN/Y42HtUxrmmUX?=
 =?us-ascii?Q?nlvpIOKjRhL7vxEGAUnHlaWENB1F4V33EJugiMGE3cmXXte0rluE/uzNvSMQ?=
 =?us-ascii?Q?W/jbd/wlnxOWLDVktE4zbN9N1k8Q5/Au8NYQTXfHj9x0TOkXAmknWjK5/mKJ?=
 =?us-ascii?Q?fji+eEy5JesxPgUTi4FshAi543UBnGtrNNrGkxa626jYLDNL6Q9LoahuelDY?=
 =?us-ascii?Q?+8HcL2WwxUlsunznvLP99P+RweVOKTXIB9E20cQMSY5CMi+x/S5NjW0fVXFA?=
 =?us-ascii?Q?NyNf1iBWATpE4hPjWAQ/lftspjbJfSU2ljtILaGK6i9H7fiPxZzaFQo2DyQd?=
 =?us-ascii?Q?R9jsfY9aBsEDHuYZ8vCwX8n9FMMXmIwStpdurcOcIRbsQmt/zhI7U1SxNPBd?=
 =?us-ascii?Q?t0iNvHLRCdmIKdxeh0QecIIpNib23DqMLqXYXNPg8HmCq6msOOOsOZYkC969?=
 =?us-ascii?Q?JfJpa0eRnX9ST8hAEIIMaBVOyvG/dDn6YL1yklaAUUR30Se69B0XEOIGlb1p?=
 =?us-ascii?Q?b1xyHa2gB3L7dus+CPfvlUkByyZ/GweIBoEhbQZabTv497kkYdpDncypEnLG?=
 =?us-ascii?Q?+xq7WBc48+MlZ/vhKWMCdgO+dZOBcwSIPAZqlXoWvyGy3id4FBd98N03Tr6E?=
 =?us-ascii?Q?e6EH3vFvgVZDUFVjwy3gsbzXgiFUVcN/n8e8pOAIipbE14gCS/ha92GEollO?=
 =?us-ascii?Q?QA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f1b6a7f-9a0e-4b14-cb28-08dde5897045
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 16:47:41.6063 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gpfaNj1juKVkDoS/bGD7TlKOq0WJSq5RMusDyOFG0T5LEm+DMpFl8qp97VDG4//VFGelpAZVya28Ox8mRESPWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6454
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

On Wed, Aug 27, 2025 at 11:42:36AM -0500, Lucas De Marchi wrote:
> On Tue, Aug 19, 2025 at 11:53:48AM -0700, Matthew Brost wrote:
> > It helpful to clear GT stats, run a test cases which is being profiled,
> > and look at the results of the stats from the individual test case. Add
> > clear_stats GT debugfs entry whih allows the clearing of GT stats.
> > 
> > v4:
> > - Make clear_stats write only permissions (Himal)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_gt_debugfs.c | 22 ++++++++++++++++++++++
> > drivers/gpu/drm/xe/xe_gt_stats.c   | 14 ++++++++++++++
> > drivers/gpu/drm/xe/xe_gt_stats.h   |  1 +
> > 3 files changed, 37 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > index bf3a67b5951c..2cd14b36c75a 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > @@ -363,6 +363,27 @@ static ssize_t write_to_gt_call(const char __user *userbuf, size_t count, loff_t
> > 	return count;
> > }
> > 
> > +static void clear_stats(struct xe_gt *gt)
> 
> why do we need a clear stats rather than making stats writable so we
> can do:
> 
> 	echo > /sys/kernel/debug/dri/0/gt0/stats
> 
> 	or
> 
> 	echo clear > /sys/kernel/debug/dri/0/gt0/stats
> 
> 	or
> 
> 	echo 0 > /sys/kernel/debug/dri/0/gt0/stats
> 
> unfortunately with debugfs we can't just truncate the file like we can
> with tracefs since we won't end up receiving a call to the store()
> method.
> 

So you are suggesting making the 'stats' file writable and upon write
clear the internal counters? I think that should work. Let me try that.

Matt 

> Lucas De Marchi
> 
> > +{
> > +	xe_gt_stats_clear(gt);
> > +}
> > +
> > +static ssize_t clear_stats_write(struct file *file,
> > +				 const char __user *userbuf,
> > +				 size_t count, loff_t *ppos)
> > +{
> > +	struct seq_file *s = file->private_data;
> > +	struct xe_gt *gt = s->private;
> > +
> > +	return write_to_gt_call(userbuf, count, ppos, clear_stats, gt);
> > +}
> > +
> > +static int clear_stats_show(struct seq_file *s, void *unused)
> > +{
> > +	return 0;
> > +}
> > +DEFINE_SHOW_STORE_ATTRIBUTE(clear_stats);
> > +
> > static void force_reset(struct xe_gt *gt)
> > {
> > 	struct xe_device *xe = gt_to_xe(gt);
> > @@ -448,6 +469,7 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
> > 	root->d_inode->i_private = gt;
> > 
> > 	/* VF safe */
> > +	debugfs_create_file("clear_stats", 0200, root, gt, &clear_stats_fops);
> > 	debugfs_create_file("force_reset", 0600, root, gt, &force_reset_fops);
> > 	debugfs_create_file("force_reset_sync", 0600, root, gt, &force_reset_sync_fops);
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
> > index 30f942671c2b..7e12fc3759e2 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_stats.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_stats.c
> > @@ -50,3 +50,17 @@ int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p)
> > 
> > 	return 0;
> > }
> > +
> > +/**
> > + * xe_gt_stats_clear - Clear the GT stats
> > + * @gt: GT structure
> > + *
> > + * This clear (zeros) all the available GT stats.
> > + */
> > +void xe_gt_stats_clear(struct xe_gt *gt)
> > +{
> > +	enum xe_gt_stats_id id;
> > +
> > +	for (id = 0; id < __XE_GT_STATS_NUM_IDS; ++id)
> > +		atomic64_set(&gt->stats.counters[id], 0);
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_gt_stats.h b/drivers/gpu/drm/xe/xe_gt_stats.h
> > index 38325ef53617..e8aea32bc971 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_stats.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_stats.h
> > @@ -13,6 +13,7 @@ struct drm_printer;
> > 
> > #ifdef CONFIG_DEBUG_FS
> > int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p);
> > +void xe_gt_stats_clear(struct xe_gt *gt);
> > void xe_gt_stats_incr(struct xe_gt *gt, const enum xe_gt_stats_id id, int incr);
> > #else
> > static inline void
> > -- 
> > 2.34.1
> > 

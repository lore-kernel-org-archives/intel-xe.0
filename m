Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D618C87FDA
	for <intel-xe@archiver.kernel.org>; Fri,  8 Aug 2025 17:58:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8C0810E0BB;
	Fri,  8 Aug 2025 17:58:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DWPfQnFU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76B2210E0BB
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Aug 2025 17:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754675879; x=1786211879;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=pDzJaWmZQxdfwDYPs2XWAgyF31M2eHhjaG03fPmdubo=;
 b=DWPfQnFUU22wz4CHEBhNZTzUfYdbh4vKO8YE7xNqFUCJpcTbZVs6fg6r
 Yq0KE74hRJkFFatWx8G5rfkYVPpGDS4LZ8xkTOFM9IZJrRnOKfDpoEZQ7
 i84aR9sKcEUueXlG8KCrJp8pXAO2KEcGyfVWlIbUiw5oMRzQ7XCLgNigH
 ntE0lQIegKYEetn9nlfOCsFkFa2WnOog0sarux4sDgOphLAXYlCv9s5Y0
 8VgCCIEoMoHoHgJCSs7E6Q80G1MkD3X9Tu9vmoLKZdDlG7oAv4FVMFRuK
 rqHRMmiKBrI58D0HB37yaCBP+4ANriFd90Ij5SpqQOdrFdBbijzBmkIOI g==;
X-CSE-ConnectionGUID: bDnkxePDRDO6hHVro8ofxg==
X-CSE-MsgGUID: mrO1gQAbTSWjyzhkFy9hJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="82474620"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="82474620"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 10:57:59 -0700
X-CSE-ConnectionGUID: EfFM7M1ZTra08XefqeY2Mg==
X-CSE-MsgGUID: jswubJ3uTsCRvf9I3Ow3nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="170756677"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 10:57:59 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 8 Aug 2025 10:57:58 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 8 Aug 2025 10:57:58 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.71)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 8 Aug 2025 10:57:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RCLq6bLeMTI3wNe1TjtSBK77Cvmd17zFRNY9ubv8WKzlmOoBAnTZOf8SO2aiVehwuJqtg3ARkBToiEeixt8i1tmCK8Njiz5/3QDJcUYwvFkH0p6Mab9/LEoMBwpvaC0I+F/+jxaen98I7B3PbkPRI8gMG6U0ytqR4lTRae0GuLjhZ4hn1iqvTaTYjx0sRh4hNnnbuNYz+HoAR8oTTlUCQENoRSX+l2ONs/R/f54pNGkhhS9rgfkwQGtGzb35QzoC3P6qhbEpjFf2ituCpSwR5oorie4jmF4gB4o4obw+j2ehTBKtaOlg3wcWis1WQoaZ6C3tq47hJscriJK9sJPUZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cOL4M8z1r3lUCz7lY5jHSUZ7NAsLVhiZfYvf0wveb4I=;
 b=udXSeftcGMSgmGJGmTPxqZ0bq2lITsjaJW5PYUFSeUdgH1YJCJI7iS3tHE44ABzvaUACWAvddpqEygr1/uNxPDjuqOfEYy0oY7D9rrmbYMidyR6boS4gKifZUNZAtrBtYIdXr2JPNXihLxoJkA9Z8oTLELE2/yl9crwxjs5zSgbb+UvSYWMCZyXEyoY4eFLcTTJKqxoupRTTFJdjZfk0Mmxq4/Wl2IcLVcV8uWdE3NJDGdVrh3hNFONAeTZcnkL5mHsqvM1ERLHSPoBk31+hzoaP7YAlmM4CKcrIeWkOT9nOTsIotUbkksZ38mT8+P1uqt2B0/1X2f3KtgKELwGzDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CH3PR11MB8547.namprd11.prod.outlook.com (2603:10b6:610:1bd::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 17:57:56 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9009.017; Fri, 8 Aug 2025
 17:57:56 +0000
Date: Fri, 8 Aug 2025 10:57:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: S Sebinraj <s.sebinraj@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <jeevaka.badrappan@intel.com>
Subject: Re: [PATCH] drm/xe: GPU frequency tracing support
Message-ID: <aJY6oEcB65HKvgrX@lstrano-desk.jf.intel.com>
References: <20250808161920.3542415-1-s.sebinraj@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250808161920.3542415-1-s.sebinraj@intel.com>
X-ClientProxiedBy: MW4P220CA0020.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::25) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CH3PR11MB8547:EE_
X-MS-Office365-Filtering-Correlation-Id: 852a4cbe-47c9-46fe-f1c2-08ddd6a51a87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?SZAL3ilwgFl/ohcoAkoLc33iPERgOPWgQbGsbnERgnwWlEz5e69kBALSzj?=
 =?iso-8859-1?Q?dr43Jo4casSrwh1lLfYDXJP7dhNdTy7tjjYZaE8DUE9FKM/tOvbQFro8u7?=
 =?iso-8859-1?Q?BtUMZNU+j7U+viKmBr692BWLvQXre0PqFb7ZBOoQSK93i58RD2rr7iWLu9?=
 =?iso-8859-1?Q?MVOMnsalT66QDNERxDK+l210dSUBPo2tTNRtFLOt1AllnRsTyjMbYK40c+?=
 =?iso-8859-1?Q?VCqNTVDWPht0zbbZUBhU8Hk1Wo3G1JE52PLSvmmaey5aMjdHYoMS5wB4AS?=
 =?iso-8859-1?Q?E+Ux1xKzOhcdkChsdgi8QZuS+tlakX7+ncd5TsfxoDrwVab8A6cbZF2ggL?=
 =?iso-8859-1?Q?M3qf7vpP8D1JylaK3o5iUGOiG7xfGL8OZFZ5/tCOQhiPlSu7n5ZZU+eWuJ?=
 =?iso-8859-1?Q?Qiy8w1UTUJBD1Vck9odZw0//QyKFenV03CAtoGQDz8t5LoEhL3GfMqxVuS?=
 =?iso-8859-1?Q?xXf7e4cGzF8wktsHNJ1adWqiSo1QMOld6VPlCpGWgHoL4sQf3dZm/ekk/a?=
 =?iso-8859-1?Q?I4ZzUswtkc3flXDh6m3Jy2VUjVXCQLZPSWHDW5/Y1TPNUMqR3Tgb0w1BMn?=
 =?iso-8859-1?Q?rDFgUTsPEntKYBSrjPv06fKkd3xyL4jy74C16JL3l9Jlub3E3TXvSltGAr?=
 =?iso-8859-1?Q?EeUBjQtZufjf/WW0PELWu0AopO/CBMBXOEr0nEVrHeQTRRFyTiyHqXPb3p?=
 =?iso-8859-1?Q?U54ZcwAbwj8xBabDBzQTpikAF5qdXRTYei+k92xk6fvy6afhN47L6zvC8h?=
 =?iso-8859-1?Q?2tOnBqsUEkC/5k88DjJFWICONkzjAE0bGZFqycp+6km1hED5Sr8oB/omYw?=
 =?iso-8859-1?Q?NBekRPJATaCnGoi9f8K2o6ZUzDptPnRrt0rheeF+ohKpziEDnq3jNL1MKM?=
 =?iso-8859-1?Q?aW6dejxrWRWymFenBJdj5/bPmQDmJ0+xt5TTuwyIdqpHhWtvDl3sUAvM5C?=
 =?iso-8859-1?Q?0x1hcYo2Gn3+fTole2DEHe3Elfz56lgaO45yYB2LXw7J+DnvxR91l+XCB3?=
 =?iso-8859-1?Q?Ye4HVnH5LiTnyAUVNJeTng9g53TumOa+EnNPW6+w7iavdm43DDQfOyIIlF?=
 =?iso-8859-1?Q?f8V9GNaBAMEJ9mx74DBP5T9bYHNsjE17i4g34qc28xbezXjKurpG29KB06?=
 =?iso-8859-1?Q?oZ5YID4jORsH115i8xWxvezsPzK8mm1PO6ce+rabBvqds5G+5Zkzeh61Bz?=
 =?iso-8859-1?Q?ZnZ8rMG+HMXfyRstn7T5j9XArRsUdYehW4XsPh4mmia4WYLzYte0OWF1dS?=
 =?iso-8859-1?Q?CrBULjwws/h+s140NTYH99FGn1ZTZkeiUJMBAUuAYK6jEjekZ+loZKY8iG?=
 =?iso-8859-1?Q?VXk9kRtK76qM9CfrC8bx/oJWQdvzrh/DW1xvdmHEpNUU1pQ2mHo5rXXEm8?=
 =?iso-8859-1?Q?o6H34Qyt1m7moNtZNbhnbWO145XsKt0AOj+M+lPpzXgiQVXfbp/5alKFtt?=
 =?iso-8859-1?Q?RtQnRIRQaxl+qC++DgytTf1UrznD2QRzt0ojKu+agXP6EAp+bcFMTvJ9oP?=
 =?iso-8859-1?Q?8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?gG5qcusUop0UIg/Q7BIEjBdWSD1CphCMgekQ5agxMJY8D3i6zAv/PooK7N?=
 =?iso-8859-1?Q?EkWMB3C+NLbpIyGkBb4XMC18EXox6+uRzGY/sf1VIX6jjU4mFALA3c6qn2?=
 =?iso-8859-1?Q?V55kJaDhox+6odf6AgwmFUaFEhxAyhMDvlfQadKxfE+cKIa8v8nFRYvT6k?=
 =?iso-8859-1?Q?MiRr44ddJXx0o7X8+G9FeWxipE7V7afcweWc9DK1k7DsSObx3JWL6OX636?=
 =?iso-8859-1?Q?DGRiVrajnbLOS86a/pmtqQhzgtvmJvWsC94JNjPHcjEuJDmIbQK5Ssljsw?=
 =?iso-8859-1?Q?bHas7dizduh3c77HJd5fQ9LBO4m6taqqOtSnOK6f7PSpzqds1wMkswRZYg?=
 =?iso-8859-1?Q?VIrv9QqvZvRjuwTgk9cdhhp7LxtCHBwhn7Ze6pBEz6EonXHy8kCxXr/jU4?=
 =?iso-8859-1?Q?DnqRJqAqbxpQEYHmnOY7U8J158/jb8BL+Xkfse+36ASZ5dOH+F5Wzn+BYI?=
 =?iso-8859-1?Q?itNm+0KrxiQUb5mLk4ZNj4Mu41YhSi7CA+hnr3N6QUejDJvXu3UtqzovsP?=
 =?iso-8859-1?Q?vzk8jI6O31yUivUV657JrgnGL0e8CpXA/fVhQPAqF2fDTi+uBG/ECCJa92?=
 =?iso-8859-1?Q?ZA/uIzXFiwkMN/5Oph70ZpJu1vP+EA20p6lbXmhxS+Zjablaik9fXVx7AQ?=
 =?iso-8859-1?Q?q5njonBAE30YgLWdCmjQbKhSxIcwZaR8C13O2ttgoGA2VyPzWsbjQmSB6E?=
 =?iso-8859-1?Q?ToR3eTGZehli8WpJPZhjDV+uc7OXQgAzAk3ctcIb5I5oESaRbWphaxAV6Z?=
 =?iso-8859-1?Q?FRkWz+nvf5WaF5yPyGdlLZ/mLwJpPuyW/wQ+Zc4dCGJ6o0o3hQG1jS5n5q?=
 =?iso-8859-1?Q?0pd+6VK78BCuuP9XakuqW+HfjqdpYBKIO9CXwZ8RwgpGMqsspnLPtFKEbC?=
 =?iso-8859-1?Q?i+l1D69VNQK8h4hDbVrROCdg+5Esq5IiVrlDytkdwoajazLg+3mNMwu6/N?=
 =?iso-8859-1?Q?IaBglbGhR679bPFunlsEKTFvwnj7NYnzn/F1Ju22qTXQdmVtmix/38K5Qi?=
 =?iso-8859-1?Q?aIjARL0TMlcW0uiGdSqbZwo0K+aNfvGYjx9JRrgXFdINs12hDZX/2PvrE9?=
 =?iso-8859-1?Q?SgJo2V3BgaIykE94ayciuH8tdgoXcakUmTlW6mqTMeJs11hGyxfDIbxTlG?=
 =?iso-8859-1?Q?ARCuviexLWyN7z+2v2EsV7ZYdxInqjh7iiKYuFTXPVei6cL/iw5NnQrfpK?=
 =?iso-8859-1?Q?nfRIV+FlBjgKHZeXt38sxVnDn6v+d8IOLQjCh8wnnamRvxrN8dz+VU4PHQ?=
 =?iso-8859-1?Q?Y9wGf9SyNiJXHhjXUu89pMRk+lDacKMFEJtwZDYnRP0xD+HivE4bYwO0Ip?=
 =?iso-8859-1?Q?xMndzs19eBjoLiuk+7ntJvmL7Z6D6UpEhs1H9rGwxY40jMWkkiOD5tfKKD?=
 =?iso-8859-1?Q?FyFfDAs/1eHKcw7r/jnZmMZmE64uOR/trTepOVyH2jXKLD4S2A7fobHyMy?=
 =?iso-8859-1?Q?kKoJRwYmSg7XDRti/8mMmloTcmXMk6lBSWMTJd+q5WodPL+kuDdtJVgOyj?=
 =?iso-8859-1?Q?b5JOKS7T4cWFTAXoL+0doVmEjoLQaF5n14rqkiUP7+Vt7DcRHMzsDN9L9t?=
 =?iso-8859-1?Q?fXRM1cZTmQmlyoSGwiRToJ47GlX8X8JK6XZZPyxSkTl6IIR+O+lweKFKmq?=
 =?iso-8859-1?Q?zpFM/qFwp9HgoUde5zHXC9hE7EZQsQyePzqmdMz0U3rUqw934z/8RVbw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 852a4cbe-47c9-46fe-f1c2-08ddd6a51a87
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 17:57:56.1457 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +1li6ZJ8LXF0hxmd9EU0e8nxQoUZTcPNMpDHTjcw6T3ZznVHB8KrEop3iI8a978Gx/T4lL3QH3fy2S7VnJBspw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8547
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

On Fri, Aug 08, 2025 at 09:49:20PM +0530, S Sebinraj wrote:
> A periodic GPU frequency monitoring and tracing program for the
> Xe driver. The implementation provides periodic sampling of
> GPU frequency through the Linux ftrace infrastructure.
> 
> Key features:
> - Periodic GPU frequency sampling with configurable intervals
> - Immediate frequency change reporting via tracepoints
> - Integration with Linux ftrace subsystem under 'power' events
> - Per-GT (Graphics Technology) monitoring support
> - Dedicated workqueue for non-blocking frequency sampling
> - Configurable via CONFIG_DRM_XE_GPUFREQTRACER kernel option
> - The monitoring interval can be configured at runtime via the sysfs
>   (default 5sec).
> 
> The sysfs entry is at:
> /sys/module/xe/parameters/gpufreq_monitoring_interval_ms
> 
> The tracepoint is exposed at:
> /sys/kernel/debug/tracing/events/power/gpu_frequency
> 
> Format: {unsigned int state, unsigned int gpu_id}
> - state: GPU frequency in KHz
> - gpu_id: GPU clock domain identifier
> 
> This enables userspace tools and system monitoring applications to track
> GPU frequency changes for power management analysis, performance tuning,
> and debugging purposes.
> 
> Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
> ---
>  drivers/gpu/drm/xe/Kconfig                    |  22 ++
>  drivers/gpu/drm/xe/Makefile                   |   3 +
>  drivers/gpu/drm/xe/xe_device.c                |  20 ++
>  drivers/gpu/drm/xe/xe_device_types.h          |   6 +
>  .../xe/xe_gpufreqtracer/xe_gpufreqtracer.c    | 289 ++++++++++++++++++
>  .../xe/xe_gpufreqtracer/xe_gpufreqtracer.h    |  73 +++++
>  .../xe_gpufreqtracer/xe_gpufreqtracer_trace.h |  48 +++

Does this feature warrent its own subdir? I'd say no.

>  drivers/gpu/drm/xe/xe_module.c                |  40 +++
>  drivers/gpu/drm/xe/xe_module.h                |   3 +

This is pretty large diff, I'd break this into smaller patches if possible.

>  9 files changed, 504 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_gpufreqtracer/xe_gpufreqtracer.c
>  create mode 100644 drivers/gpu/drm/xe/xe_gpufreqtracer/xe_gpufreqtracer.h
>  create mode 100644 drivers/gpu/drm/xe/xe_gpufreqtracer/xe_gpufreqtracer_trace.h
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index 714d5702dfd7..a2c99c0a01a4 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -129,6 +129,28 @@ config DRM_XE_FORCE_PROBE
>  
>  	  Use "!*" to block the probe of the driver for all known devices.
>  
> +config DRM_XE_GPUFREQTRACER
> +	bool "Enable XE GPU frequency tracing"
> +	depends on DRM_XE
> +	default n
> +	help
> +	  Enable GPU frequency tracing support for Intel XE driver.
> +	  This adds an ftrace tracepoint that reports GPU frequency changes
> +	  at periodic boundaries (default 5 secs, configurable via the
> +	  gpufreq_monitoring_interval_ms module parameter) and
> +	  on direct frequency change events.
> +
> +	  The monitoring interval can be configured at runtime via the sysfs module parameter:
> +	  /sys/module/xe/parameters/gpufreq_monitoring_interval_ms
> +
> +	  The tracepoint will be available at:
> +	  /sys/kernel/debug/tracing/events/power/gpu_frequency
> +
> +	  Format: {unsigned int state, unsigned int gpu_id}
> +	  Where state is the frequency in KHz and gpu_id is the GPU clock domain.
> +
> +	  If unsure, say N.
> +
>  menu "drm/Xe Debugging"
>  depends on DRM_XE
>  depends on EXPERT
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 8e0c3412a757..7bbaac7de867 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -170,6 +170,9 @@ xe-$(CONFIG_PCI_IOV) += \
>  	xe_sriov_pf.o \
>  	xe_sriov_pf_service.o
>  
> +# GPU frequency tracer
> +xe-$(CONFIG_DRM_XE_GPUFREQTRACER) += xe_gpufreqtracer/xe_gpufreqtracer.o
> +
>  # include helpers for tests even when XE is built-in
>  ifdef CONFIG_DRM_XE_KUNIT_TEST
>  xe-y += tests/xe_kunit_helpers.o
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 57edbc63da6f..cfc81d4c7c82 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -34,6 +34,7 @@
>  #include "xe_exec_queue.h"
>  #include "xe_force_wake.h"
>  #include "xe_ggtt.h"
> +#include "xe_gpufreqtracer/xe_gpufreqtracer.h"
>  #include "xe_gsc_proxy.h"
>  #include "xe_gt.h"
>  #include "xe_gt_mcr.h"
> @@ -896,6 +897,21 @@ int xe_device_probe(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> +#ifdef CONFIG_DRM_XE_GPUFREQTRACER

#if IS_ENABLED(CONFIG_DRM_XE_GPUFREQTRACER)

^^^ This is the preferred way to use config options.

> +	err = xe_gpufreqtracer_init(xe);
> +	if (err)
> +		return err;
> +
> +	/* Start periodic monitoring on all GTs using global module parameter */
> +	for_each_gt(gt, xe, id) {
> +		err = xe_gpufreqtracer_start_monitoring(gt);
> +		if (err) {
> +			drm_err(&xe->drm, "xe_gpufreqtracer: failed to start monitoring for GT%u, err=%d\n",
> +				gt->info.id, err);
> +		}
> +	}
> +#endif

I'd put this into a single function that compiles out if
CONFIG_DRM_XE_GPUFREQTRACER is unset and drop ifdef here.

> +
>  	err = xe_oa_init(xe);
>  	if (err)
>  		return err;
> @@ -959,6 +975,10 @@ void xe_device_remove(struct xe_device *xe)
>  
>  	xe_nvm_fini(xe);
>  
> +#ifdef CONFIG_DRM_XE_GPUFREQTRACER
> +	xe_gpufreqtracer_fini(xe);
> +#endif

Same here, just have a version of xe_gpufreqtracer_fini the header
doesn't do anything if CONFIG_DRM_XE_GPUFREQTRACER isn't set. We don't
want ifdefs scattered all over the code base if possible.

> +
>  	drm_dev_unplug(&xe->drm);
>  
>  	xe_bo_pci_dev_remove_all(xe);
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 01e8fa0d2f9f..760db7cd25d3 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -35,6 +35,7 @@ struct dram_info;
>  struct intel_display;
>  struct intel_dg_nvm_dev;
>  struct xe_ggtt;
> +struct xe_gpufreqtracer_data;
>  struct xe_i2c;
>  struct xe_pat_ops;
>  struct xe_pxp;
> @@ -529,6 +530,11 @@ struct xe_device {
>  	/** @oa: oa observation subsystem */
>  	struct xe_oa oa;
>  
> +#ifdef CONFIG_DRM_XE_GPUFREQTRACER
> +	/** @gpufreqtracer_data: GPU frequency tracer data */
> +	struct xe_gpufreqtracer_data *gpufreqtracer_data;
> +#endif

You don't strickly need this ifdef. This is a poiner, if it
CONFIG_DRM_XE_GPUFREQTRACER is unset, it will be never used and we just
waste sizeof(struct xe_gpufreqtracer_data *) in xe_device.

> +
>  	/** @pxp: Encapsulate Protected Xe Path support */
>  	struct xe_pxp *pxp;
>  
> diff --git a/drivers/gpu/drm/xe/xe_gpufreqtracer/xe_gpufreqtracer.c b/drivers/gpu/drm/xe/xe_gpufreqtracer/xe_gpufreqtracer.c
> new file mode 100644
> index 000000000000..6d1941b4a5f3
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gpufreqtracer/xe_gpufreqtracer.c
> @@ -0,0 +1,289 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright © 2024 Intel Corporation

Did you author this code last year?

> + */
> +
> +#include "xe_gpufreqtracer.h"
> +
> +#include <linux/workqueue.h>
> +#include <linux/timer.h>
> +#include <linux/slab.h>
> +#include <linux/jiffies.h>
> +#include <linux/kernel.h>
> +#include <linux/moduleparam.h>
> +#include <linux/types.h>
> +#include <linux/container_of.h>
> +#include <linux/gfp.h>
> +#include <linux/atomic.h>
> +
> +#include "xe_device.h"
> +#include "xe_gt.h"
> +#include "xe_gt_types.h"
> +#include "xe_guc_pc.h"
> +#include "xe_module.h"
> +
> +#define CREATE_TRACE_POINTS
> +#include "xe_gpufreqtracer_trace.h"
> +
> +/**
> + * struct xe_gpufreqtracer_gt_data - Per-GT frequency monitoring data
> + * @gt: Reference to the GT
> + * @timer: Timer for periodic monitoring
> + * @work: Work item for frequency sampling
> + * @last_frequency: Last reported frequency to avoid duplicate reports
> + * @monitoring_active: Whether monitoring is currently active
> + */
> +struct xe_gpufreqtracer_gt_data {
> +	struct xe_gt *gt;
> +	struct timer_list timer;
> +	struct work_struct work;
> +	atomic_t last_frequency;
> +	atomic_t monitoring_active;
> +};
> +
> +/**
> + * struct xe_gpufreqtracer_data - Per-device frequency tracer data
> + * @xe: Reference to the XE device
> + * @gt_data: Array of per-GT monitoring data
> + */
> +struct xe_gpufreqtracer_data {
> +	struct xe_device *xe;
> +	struct xe_gpufreqtracer_gt_data *gt_data;
> +};
> +
> +
> +/**
> + * xe_gpufreqtracer_sample_work - Worker function to sample GPU frequency.
> + * @work: Pointer to the work_struct representing the scheduled work.
> + *
> + * This function is executed in a workqueue context to periodically sample
> + * the GPU frequency and perform any necessary tracing or logging operations.
> + * It is part of the GPU frequency tracer subsystem.
> + */
> +static void xe_gpufreqtracer_sample_work(struct work_struct *work)
> +{
> +	struct xe_gpufreqtracer_gt_data *gt_data =
> +		container_of(work, struct xe_gpufreqtracer_gt_data, work);
> +	struct xe_gt *gt = gt_data->gt;
> +	struct xe_guc_pc *pc = &gt->uc.guc.pc;
> +	u32 current_freq, last_freq;
> +
> +	if (!atomic_read(&gt_data->monitoring_active)) {
> +		drm_warn(&gt_to_xe(gt)->drm, "monitoring not active for GT%u, exiting",
> +			 gt->info.id);
> +		return;
> +	}
> +
> +	current_freq = xe_guc_pc_get_act_freq(pc) * 1000; /* Convert MHz to KHz */
> +	last_freq = atomic_read(&gt_data->last_frequency);
> +
> +	/* Only report if frequency has changed or this is the first sample */
> +	if (current_freq != last_freq) {
> +		drm_dbg(&gt_to_xe(gt)->drm, "GT%u frequency changed, tracing %u KHz",
> +			gt->info.id, current_freq);
> +		trace_gpu_frequency(current_freq, gt->info.id);
> +		atomic_set(&gt_data->last_frequency, current_freq);
> +	}
> +}
> +
> +/**
> + * xe_gpufreqtracer_timer_callback - Timer callback for GPU frequency tracer
> + * @timer: Pointer to the timer_list structure associated with this callback
> + *
> + * This function is invoked when the timer associated with the GPU frequency tracer expires.
> + * It is responsible for handling periodic tasks related to GPU frequency tracing, such as
> + * sampling or logging frequency data.
> + */
> +static void xe_gpufreqtracer_timer_callback(struct timer_list *timer)
> +{
> +	struct xe_gpufreqtracer_gt_data *gt_data =
> +		container_of(timer, struct xe_gpufreqtracer_gt_data, timer);
> +
> +	if (atomic_read(&gt_data->monitoring_active)) {
> +		queue_work(system_highpri_wq, &gt_data->work);
> +		mod_timer(&gt_data->timer, jiffies +
> +			  msecs_to_jiffies(xe_modparam.gpufreq_monitoring_interval_ms));

Do you need a timer? A delayed worker seemly does the same thing.

> +	} else {
> +		drm_warn(&gt_to_xe(gt_data->gt)->drm, "timer callback for GT%u but monitoring inactive",
> +			 gt_data->gt->info.id);
> +	}
> +}
> +
> +/**
> + * xe_gpufreqtracer_init - Initialize GPU frequency tracer for a device
> + * @xe: The XE device
> + *
> + * Sets up the frequency tracer infrastructure for all GTs in the device.
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +int xe_gpufreqtracer_init(struct xe_device *xe)
> +{
> +	struct xe_gpufreqtracer_data *tracer_data;
> +	struct xe_gt *gt;
> +	u8 tile_id;
> +	int ret = 0;
> +
> +	tracer_data = kzalloc(sizeof(*tracer_data), GFP_KERNEL);
> +	if (!tracer_data)
> +		return -ENOMEM;
> +
> +	tracer_data->xe = xe;
> +
> +	/* Allocate GT data array based on actual GT count */
> +	tracer_data->gt_data = kcalloc(xe->info.gt_count,
> +				       sizeof(*tracer_data->gt_data),
> +				       GFP_KERNEL);
> +	if (!tracer_data->gt_data) {
> +		ret = -ENOMEM;
> +		goto err_free_tracer;
> +	}
> +
> +	/* Initialize per-GT data */
> +	for_each_gt(gt, xe, tile_id) {
> +		struct xe_gpufreqtracer_gt_data *gt_data =
> +			&tracer_data->gt_data[gt->info.id];
> +
> +		drm_dbg(&xe->drm, "initializing GT%u (tile %u)", gt->info.id, tile_id);
> +
> +		gt_data->gt = gt;
> +		atomic_set(&gt_data->monitoring_active, 0);
> +		atomic_set(&gt_data->last_frequency, 0);
> +
> +		INIT_WORK(&gt_data->work, xe_gpufreqtracer_sample_work);
> +		timer_setup(&gt_data->timer, xe_gpufreqtracer_timer_callback, 0);
> +
> +		drm_dbg(&xe->drm, "GT%u initialized with global interval=%u ms",
> +			 gt->info.id, xe_modparam.gpufreq_monitoring_interval_ms);
> +	}
> +
> +	xe->gpufreqtracer_data = tracer_data;
> +	return 0;
> +
> +err_free_tracer:
> +	drm_err(&xe->drm, "initialization failed, freeing tracer data");
> +	kfree(tracer_data);
> +	return ret;
> +}
> +
> +/**
> + * xe_gpufreqtracer_fini - Cleanup GPU frequency tracer for a device
> + * @xe: The XE device
> + *
> + * Stops all monitoring and cleans up tracer resources.
> + */
> +void xe_gpufreqtracer_fini(struct xe_device *xe)
> +{

Any reason this needs an explicit fini function? Can you not use
drmm/devm cleanups?

> +	struct xe_gpufreqtracer_data *tracer_data = xe->gpufreqtracer_data;
> +	struct xe_gt *gt;
> +	u8 tile_id;
> +
> +	if (!tracer_data) {
> +		drm_warn(&xe->drm, "no tracer data found, nothing to cleanup");
> +		return;
> +	}
> +
> +	/* Stop all monitoring */
> +	for_each_gt(gt, xe, tile_id) {
> +		drm_dbg(&xe->drm, "stopping monitoring for GT%u", gt->info.id);
> +		xe_gpufreqtracer_stop_monitoring(gt);
> +	}
> +
> +	kfree(tracer_data->gt_data);
> +	kfree(tracer_data);
> +	xe->gpufreqtracer_data = NULL;
> +}
> +
> +/**
> + * xe_gpufreqtracer_report_frequency_change - Report frequency change directly
> + * @gt: The GT instance
> + * @frequency_khz: The new frequency in KHz
> + *
> + * Reports a frequency change immediately through the tracepoint.
> + */
> +void xe_gpufreqtracer_report_frequency_change(struct xe_gt *gt, u32 frequency_khz)

Where is this function called, not seeing used in patch and this is the
only patch in the series.

> +{
> +	drm_dbg(&gt_to_xe(gt)->drm, "direct frequency report for GT%u: %u KHz",
> +		 gt->info.id, frequency_khz);
> +
> +	if (frequency_khz > 0) {
> +		trace_gpu_frequency(frequency_khz, gt->info.id);
> +		drm_dbg(&gt_to_xe(gt)->drm, "traced frequency change for GT%u", gt->info.id);
> +	}
> +}
> +
> +/**
> + * xe_gpufreqtracer_start_monitoring - Start periodic frequency monitoring
> + * @gt: The GT instance
> + *
> + * Starts periodic sampling of GPU frequency for the specified GT using the global
> + * monitoring interval from module parameters.
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +int xe_gpufreqtracer_start_monitoring(struct xe_gt *gt)
> +{
> +	struct xe_gpufreqtracer_data *tracer_data = gt_to_xe(gt)->gpufreqtracer_data;
> +	struct xe_gpufreqtracer_gt_data *gt_data;
> +
> +	if (!tracer_data) {
> +		drm_warn(&gt_to_xe(gt)->drm, "no tracer data for GT%u, not supported", gt->info.id);
> +		return -EOPNOTSUPP;
> +	}
> +
> +	if (gt->info.id >= gt_to_xe(gt)->info.gt_count) {
> +		drm_err(&gt_to_xe(gt)->drm, "invalid GT ID %u, max supported is %u",
> +			gt->info.id, gt_to_xe(gt)->info.gt_count - 1);
> +		return -EINVAL;
> +	}
> +
> +	gt_data = &tracer_data->gt_data[gt->info.id];
> +
> +	if (atomic_read(&gt_data->monitoring_active)) {
> +		drm_warn(&gt_to_xe(gt)->drm, "monitoring already active for GT%u", gt->info.id);
> +		return -EALREADY;
> +	}
> +
> +	atomic_set(&gt_data->monitoring_active, 1);
> +	atomic_set(&gt_data->last_frequency, 0);
> +
> +	/* Start the timer using global interval */
> +	mod_timer(&gt_data->timer, jiffies +
> +		  msecs_to_jiffies(xe_modparam.gpufreq_monitoring_interval_ms));
> +
> +	drm_dbg(&gt_to_xe(gt)->drm, "monitoring started for GT%u with interval %u ms",
> +		 gt->info.id, xe_modparam.gpufreq_monitoring_interval_ms);
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_gpufreqtracer_stop_monitoring - Stop periodic frequency monitoring
> + * @gt: The GT instance
> + *
> + * Stops periodic sampling of GPU frequency for the specified GT.
> + */
> +void xe_gpufreqtracer_stop_monitoring(struct xe_gt *gt)

This is only called by xe_gpufreqtracer_fini, so this could be a static
function, right?

> +{
> +	struct xe_gpufreqtracer_data *tracer_data = gt_to_xe(gt)->gpufreqtracer_data;
> +	struct xe_gpufreqtracer_gt_data *gt_data;
> +
> +	if (!tracer_data || gt->info.id >= gt_to_xe(gt)->info.gt_count) {
> +		drm_err(&gt_to_xe(gt)->drm, "invalid tracer data or GT ID %u for stop request",
> +			gt->info.id);
> +		return;
> +	}
> +
> +	gt_data = &tracer_data->gt_data[gt->info.id];
> +
> +	if (!atomic_read(&gt_data->monitoring_active)) {
> +		drm_warn(&gt_to_xe(gt)->drm, "monitoring not active for GT%u, nothing to stop",
> +			 gt->info.id);
> +		return;
> +	}
> +
> +	atomic_set(&gt_data->monitoring_active, 0);
> +
> +	timer_delete_sync(&gt_data->timer);
> +	cancel_work_sync(&gt_data->work);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gpufreqtracer/xe_gpufreqtracer.h b/drivers/gpu/drm/xe/xe_gpufreqtracer/xe_gpufreqtracer.h
> new file mode 100644
> index 000000000000..6f0f88aec2ea
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gpufreqtracer/xe_gpufreqtracer.h
> @@ -0,0 +1,73 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _XE_GPUFREQTRACER_H_
> +#define _XE_GPUFREQTRACER_H_
> +
> +#include <linux/types.h>
> +
> +struct xe_device;
> +struct xe_gt;
> +
> +#ifdef CONFIG_DRM_XE_GPUFREQTRACER
> +
> +/*
> + * Initialize the GPU frequency tracer for a device
> + */
> +int xe_gpufreqtracer_init(struct xe_device *xe);
> +

Looping in all the other comments, I think you only really
xe_gpufreqtracer_init to a public function. Everything else looks like
it could be handled internally in xe_gpufreqtracer.c.

Matt

> +/*
> + * Cleanup the GPU frequency tracer for a device
> + */
> +void xe_gpufreqtracer_fini(struct xe_device *xe);
> +
> +/*
> + * Report a GPU frequency change directly
> + * @gt: The GT instance
> + * @frequency_khz: The new frequency in KHz
> + */
> +void xe_gpufreqtracer_report_frequency_change(struct xe_gt *gt, u32 frequency_khz);
> +
> +/*
> + * Start periodic frequency monitoring for a GT
> + * @gt: The GT instance
> + *
> + * Uses the global module parameter for monitoring interval.
> + */
> +int xe_gpufreqtracer_start_monitoring(struct xe_gt *gt);
> +
> +/*
> + * Stop periodic frequency monitoring for a GT
> + * @gt: The GT instance
> + */
> +void xe_gpufreqtracer_stop_monitoring(struct xe_gt *gt);
> +
> +#else /* CONFIG_DRM_XE_GPUFREQTRACER */
> +
> +static inline int xe_gpufreqtracer_init(struct xe_device *xe)
> +{
> +	return 0;
> +}
> +
> +static inline void xe_gpufreqtracer_fini(struct xe_device *xe)
> +{
> +}
> +
> +static inline void xe_gpufreqtracer_report_frequency_change(struct xe_gt *gt, u32 frequency_khz)
> +{
> +}
> +
> +static inline int xe_gpufreqtracer_start_monitoring(struct xe_gt *gt)
> +{
> +	return 0;
> +}
> +
> +static inline void xe_gpufreqtracer_stop_monitoring(struct xe_gt *gt)
> +{
> +}
> +
> +#endif /* CONFIG_DRM_XE_GPUFREQTRACER */
> +
> +#endif /* _XE_GPUFREQTRACER_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_gpufreqtracer/xe_gpufreqtracer_trace.h b/drivers/gpu/drm/xe/xe_gpufreqtracer/xe_gpufreqtracer_trace.h
> new file mode 100644
> index 000000000000..8dfb6c442630
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gpufreqtracer/xe_gpufreqtracer_trace.h
> @@ -0,0 +1,48 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM power
> +
> +#if !defined(_XE_GPUFREQTRACER_TRACE_H) || defined(TRACE_HEADER_MULTI_READ)
> +#define _XE_GPUFREQTRACER_TRACE_H
> +
> +#include <linux/tracepoint.h>
> +
> +/*
> + * Tracepoint for GPU frequency changes
> + * This tracepoint is exposed at /sys/kernel/debug/tracing/events/power/gpu_frequency
> + *
> + * location: /d/events/power/gpu_frequency
> + * format: {unsigned int state, unsigned int gpu_id}
> + * where state holds the frequency(in Khz) and the gpu_id holds the GPU clock domain.
> + */
> +
> +TRACE_EVENT(gpu_frequency,
> +	TP_PROTO(unsigned int state, unsigned int gpu_id),
> +
> +	TP_ARGS(state, gpu_id),
> +
> +	TP_STRUCT__entry(
> +		__field(unsigned int, state)
> +		__field(unsigned int, gpu_id)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->state = state;
> +		__entry->gpu_id = gpu_id;
> +	),
> +
> +	TP_printk("state=%u gpu_id=%u", __entry->state, __entry->gpu_id)
> +);
> +
> +#endif /* _XE_GPUFREQTRACER_TRACE_H */
> +
> +/* This part must be outside protection */
> +#undef TRACE_INCLUDE_PATH
> +#undef TRACE_INCLUDE_FILE
> +#define TRACE_INCLUDE_PATH xe_gpufreqtracer
> +#define TRACE_INCLUDE_FILE xe_gpufreqtracer_trace
> +#include <trace/define_trace.h>
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index d08338fc3bc1..2252d0f762bd 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -18,6 +18,13 @@
>  #include "xe_observation.h"
>  #include "xe_sched_job.h"
>  
> +#ifdef CONFIG_DRM_XE_GPUFREQTRACER
> +/* GPU frequency monitoring interval constants (in milliseconds) */
> +#define XE_GPUFREQ_MONITORING_MIN_INTERVAL_MS	100
> +#define XE_GPUFREQ_MONITORING_MAX_INTERVAL_MS	10000
> +#define XE_GPUFREQ_MONITORING_DEFAULT_INTERVAL_MS	5000
> +#endif
> +
>  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>  #define DEFAULT_GUC_LOG_LEVEL		3
>  #else
> @@ -41,6 +48,9 @@ struct xe_modparam xe_modparam = {
>  #endif
>  	.wedged_mode =		DEFAULT_WEDGED_MODE,
>  	.svm_notifier_size =	DEFAULT_SVM_NOTIFIER_SIZE,
> +#ifdef CONFIG_DRM_XE_GPUFREQTRACER
> +	.gpufreq_monitoring_interval_ms = XE_GPUFREQ_MONITORING_DEFAULT_INTERVAL_MS,
> +#endif
>  	/* the rest are 0 by default */
>  };
>  
> @@ -93,6 +103,16 @@ MODULE_PARM_DESC(wedged_mode,
>  		 "Module's default policy for the wedged mode (0=never, 1=upon-critical-errors, 2=upon-any-hang "
>  		 "[default=" __stringify(DEFAULT_WEDGED_MODE) "])");
>  
> +#ifdef CONFIG_DRM_XE_GPUFREQTRACER
> +module_param_named(gpufreq_monitoring_interval_ms,
> +		   xe_modparam.gpufreq_monitoring_interval_ms, uint, 0644);
> +MODULE_PARM_DESC(gpufreq_monitoring_interval_ms,
> +		 "GPU frequency monitoring interval in milliseconds ("
> +		 __stringify(XE_GPUFREQ_MONITORING_MIN_INTERVAL_MS) "-"
> +		 __stringify(XE_GPUFREQ_MONITORING_MAX_INTERVAL_MS) ", default: "
> +		 __stringify(XE_GPUFREQ_MONITORING_DEFAULT_INTERVAL_MS) ")");
> +#endif
> +
>  static int xe_check_nomodeset(void)
>  {
>  	if (drm_firmware_drivers_only())
> @@ -101,6 +121,21 @@ static int xe_check_nomodeset(void)
>  	return 0;
>  }
>  
> +#ifdef CONFIG_DRM_XE_GPUFREQTRACER
> +static int xe_validate_module_params(void)
> +{
> +	/* Validate GPU frequency monitoring interval */
> +	if (xe_modparam.gpufreq_monitoring_interval_ms < XE_GPUFREQ_MONITORING_MIN_INTERVAL_MS ||
> +	    xe_modparam.gpufreq_monitoring_interval_ms > XE_GPUFREQ_MONITORING_MAX_INTERVAL_MS) {
> +		/* xe: gpufreq_monitoring_interval_ms %u out of range [100, 10000], */
> +		/* using default 5000ms */
> +		xe_modparam.gpufreq_monitoring_interval_ms =
> +			XE_GPUFREQ_MONITORING_DEFAULT_INTERVAL_MS;
> +	}
> +	return 0;
> +}
> +#endif
> +
>  struct init_funcs {
>  	int (*init)(void);
>  	void (*exit)(void);
> @@ -110,6 +145,11 @@ static const struct init_funcs init_funcs[] = {
>  	{
>  		.init = xe_check_nomodeset,
>  	},
> +#ifdef CONFIG_DRM_XE_GPUFREQTRACER
> +	{
> +		.init = xe_validate_module_params,
> +	},
> +#endif
>  	{
>  		.init = xe_configfs_init,
>  		.exit = xe_configfs_exit,
> diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
> index 5a3bfea8b7b4..fd60de38d24d 100644
> --- a/drivers/gpu/drm/xe/xe_module.h
> +++ b/drivers/gpu/drm/xe/xe_module.h
> @@ -23,6 +23,9 @@ struct xe_modparam {
>  #endif
>  	int wedged_mode;
>  	u32 svm_notifier_size;
> +#ifdef CONFIG_DRM_XE_GPUFREQTRACER
> +	u32 gpufreq_monitoring_interval_ms;
> +#endif
>  };
>  
>  extern struct xe_modparam xe_modparam;
> -- 
> 2.34.1
> 

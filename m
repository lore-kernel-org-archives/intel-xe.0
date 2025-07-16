Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 943CEC83F27
	for <intel-xe@archiver.kernel.org>; Wed, 16 Jul 2025 01:09:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EAA410E69A;
	Wed, 16 Jul 2025 01:09:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AIAvEKx1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9F6C10E69A
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Jul 2025 01:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752628198; x=1784164198;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=+n0sX8L+3zjQrAVTmlHOnUBkaSUgD3ChqluHEWQ6R5U=;
 b=AIAvEKx1e/TtyBIrF4ciFMdpGEONVSeeAv5C9ECu/3ZWr+cxxHOzAxFC
 ZIBeqF7G1x6u4mlfI4DUFLVVxl+5CMyIanCKhrJ9p8tuXMMexFsKGGyoi
 K6bNqbMZeHauYtpD/YNJR3bb49N4Sumr+6s7OaBFKgJ7gHBjIfxVRHHAR
 daanGRbgToT1jVmz8YT1CSJ8owg4E4lYcHS90zAzlt77v31PHcv4pfSeE
 tPaTNQVVy3ypIj/nldhsEiR4VJrfmgB9fybJfAtjsClFzXqbFijtGy73Q
 EumB9fFwNIswkdv6KuTxSDB5lckdt/aNjJtlkqcIrSHoMrIkmzyjN5E81 g==;
X-CSE-ConnectionGUID: c/luHuMITV+TReO5rj4KCQ==
X-CSE-MsgGUID: ejdq4qojRh6T+n4xWVl1WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="77396606"
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="77396606"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 18:09:54 -0700
X-CSE-ConnectionGUID: ofHue3O2QeSjzbKj/E9haA==
X-CSE-MsgGUID: /ovxAg6tR82ecQPToZizHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="156770147"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 18:09:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 18:09:53 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 15 Jul 2025 18:09:53 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.69)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 18:09:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nDpB2Xq+YCcdDKLmdwggPkrm3EYATLGT5zt73r28B0rS8nyKGHhU8+OyZRo5PyL+RvqWdKOHLBl7c71c0eMrOPRNaNSNHCkKVkqhqU6DrMib3/+v4X5qvrGGSnTuo5tgJjWaP1wjgCDzMcpqI+9mMopK9+nJ5/AFXxXqb7WPkiRymo3ERu8sQ/YOxamqa0srbC2lSIxL5FI5JnnqpTh8dvUf1T2WXYCm3GwagMFA1NZF0SUvs057rWWIF16DYbOiJ87FrN7+i2hkn/kMTIxhVCeqF8gjoT56YdZ2W6Sj/6fVDJVYimzeBLM0MUeqfJzwAJ8SGHupmdbU0elr8+Z2uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a5eF4isodywzA7D0l719q7hHp2XUtkHu/U9wstXkdfA=;
 b=iEpfGqpYCHbkooFsWVXmWDIUnKx40nxPyiM8yPobj2kjtsb/KJvWH4ZYx1Q3DG2O2VqcJ4h9GNcyqU6ghyh5+SFYFTvp25Ql2ZvS5vRK3zQtBoVvARBnnuC7yTYQst0vWbXS6zSZ0HBtyCcbGXuUrMR2dNrjPviZrC/Ty4iuB/MxhmfCzNKg4tkK5vVnutneMy1LNOjnTahC1YW8D0U0+feSaxwiPA6QT4QVvA4jKvcZ8yPQWzArVA7EO7mK1IRF2NDNiX7TdE0ewV1G9Zt7Eg/zPVr1CwdB+XrvVn4aDp9GhwcOKBxdacYLUlQg5zmtIkZTTNu+cH/fYpzebLSZMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by IA1PR11MB7775.namprd11.prod.outlook.com (2603:10b6:208:3f3::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Wed, 16 Jul
 2025 01:09:34 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%7]) with mapi id 15.20.8880.021; Wed, 16 Jul 2025
 01:09:34 +0000
Date: Tue, 15 Jul 2025 18:11:19 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "Auld, Matthew" <matthew.auld@intel.com>
Subject: Re: [PATCH v2 6/9] drm/xe: Add xe_migrate_job_lock/unlock helpers
Message-ID: <aHb8NxtAnO1ZsMy+@lstrano-desk.jf.intel.com>
References: <20250702234222.3278264-1-matthew.brost@intel.com>
 <20250702234222.3278264-7-matthew.brost@intel.com>
 <f66c835a70e50969e9a4068cbd5c060839f340a1.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f66c835a70e50969e9a4068cbd5c060839f340a1.camel@intel.com>
X-ClientProxiedBy: SJ0PR13CA0147.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::32) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|IA1PR11MB7775:EE_
X-MS-Office365-Filtering-Correlation-Id: cdfd0c24-9c57-4a97-d78b-08ddc4056d52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?xCBuXWCVcUnzy+B2JlbkfL6u9z17/AbFCENx7KhEViCu3ByQ38s3o81ndP?=
 =?iso-8859-1?Q?WY5ABU1aHggjZdl3wgdK4hC+yh+J8CPg5JlDnYPLPsGXOdvxRCw2lXBIp7?=
 =?iso-8859-1?Q?hPI4OfKEEQVIb+NvZcx6qeEhQJ4IVL0vXIrsykWMRjXT8IxDS2B4M0C7bE?=
 =?iso-8859-1?Q?Hick/TaCeHWUk2M8u3EJ/HRGNNd5Eror1cjMXlypp6dJQ/aWPwVZjDb6Br?=
 =?iso-8859-1?Q?MTwxnyUCiOTRLvy4KYfEeK0Fjz7grzGhTmiPGBRgW68OSCX5GvlKPsxSCA?=
 =?iso-8859-1?Q?d480XEcerx5embjUE/pjD40MdxLAvMg924YGmKfme2rNnuC6gVEtDEkKv8?=
 =?iso-8859-1?Q?VsnP8z/Wea2uunxuy4l2e1UfY6IHge3EoGAEgr+URms5EcqkaYOLkU+UhR?=
 =?iso-8859-1?Q?Q3rtbvqMd6FofzSr7wy21l7eib9/xcn7C5NCXoBMywZdFaPgK7FmMlnrjh?=
 =?iso-8859-1?Q?s2ymrP92g0KXkfVW/+edeoBMntLJ+0gCl0ejfcBhLxwPFgCiBuSG5zJaMR?=
 =?iso-8859-1?Q?CIlxQu52hqViVzOMvp22voyYiMnUgENzepMl4G1GGRcmL8p/D0boXl51N5?=
 =?iso-8859-1?Q?kihM2lQPcvVn2Ve7++zEUTQ1u3eG7ZHeLFiotJ4Bad/D2COxEqNvhgGAba?=
 =?iso-8859-1?Q?T7Du0ze3V1RdW14P/lmUPNz8JEw5YrwqlTm/42ffmYBnJNxsNI0xT6bT9b?=
 =?iso-8859-1?Q?N/8IEQu+mbp35ZLn5LhcV9rzq8q/muahxb80sYI9EcmMQqtOLZbDXV5adw?=
 =?iso-8859-1?Q?8A06u1xQD5yFpWWhD95imSlOG0Nu6chPLbybdCFLAhy2kBne1PRK67jL2a?=
 =?iso-8859-1?Q?4P4juotteEgyC8Cl0eh/oFiHtwi1LRHHQ4tc3Mo+FtA996mV1NN7dTnJ+F?=
 =?iso-8859-1?Q?g32R+fbZnNgNRpadtU4mgIf1TzJ++/tPtBDfulZJ3lwv5+wivOJRpEz28U?=
 =?iso-8859-1?Q?4zSDcv1nwsr3/UOjBuFCZYYtAqPx4lOWzv2YcKQu+VfDiNIGNFs5EW+XeL?=
 =?iso-8859-1?Q?t0Fw9PH+p0FnF4QlJiC3M0QZgB4+v4+zzTg+WXJRi+x8Mlihy5wlLLZUKa?=
 =?iso-8859-1?Q?Tk966V4JqQTqSgG4kiSS+ulG4nkql+d2+qnlJ/IanlsyRPwAGR+vFj7rHI?=
 =?iso-8859-1?Q?1Gsi1/uq42JcdZur9N6wNidem3HMRY/ZxGjwmFiIA287cEnnHGpObHR4TU?=
 =?iso-8859-1?Q?Lb3iO2IA9QWYmju1sJWZ+QMM5TbEsOc/vTZNhuLk5a/dAf2bkI6db/S+o6?=
 =?iso-8859-1?Q?QBJWCaA8j2Odkj3m1kBFLLrvHyO+/FvWmqXV30PGnY294Q5LnaEW9bRVWc?=
 =?iso-8859-1?Q?oyEzNBdiL2HGShnIFe0GEGdazoOvdKGBnTPP/r/juE3ftBSq1dQQE8hvEM?=
 =?iso-8859-1?Q?ioeYxSpEOhuZdEn5csSGDYQrALYeRgvMvgzsv28Wb/J6+0Q+h2eHANeAqG?=
 =?iso-8859-1?Q?I0NaAvjfAIc85U//9eOXVbT0WfYIUbEQJ5WMiVcUEnjGv1IB2V++M3ADWK?=
 =?iso-8859-1?Q?k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?csqWedFLeQsEglE7HtbmcdByaIWaK2np8gVwYtQaSz/e6w8TrZcTm3FwLi?=
 =?iso-8859-1?Q?Cfvg0Ojkeafs9UgDj+fYOtq1Ph+cSZX0rKIX4lXCw+I8RIfgrjiwAHEBwv?=
 =?iso-8859-1?Q?ur6RxhbQIBvPrgVGfzFiEvJ2oyp4eLrSiMQFofVg08sH99p+rYEwBeZR6q?=
 =?iso-8859-1?Q?UtIgEcHc8a+r0IY81IlGFOUhCMGbx/Mu0sAJuHwan5itiCfXdoLKZ1QrhP?=
 =?iso-8859-1?Q?IwGfUGPSca9c7VGxaXwuM1WIkUjophzIqxH8lrKSM9bd3ctfYck9IKKYbI?=
 =?iso-8859-1?Q?EadKb4I5CNvf014TkIHmRlae5W++7Tazi3jmxVtqIZqixLx+iKuN+ZSV6V?=
 =?iso-8859-1?Q?m/slQ14UIZSvLeZ7tTzlI33Uf7OOGcHp+rWjmE+iE9Bh6xRGg2Vn4hPrYb?=
 =?iso-8859-1?Q?DMxuT6KmrIZh02FBYSLzV4Oxthy8tePVlcv6IkrrpFjTa4WZpHb0k0sT4s?=
 =?iso-8859-1?Q?peOehOCcnqeVmqDQZ30VCN4heYGsZlywzMu4lEFFkfqu92Up0zJBXRT63L?=
 =?iso-8859-1?Q?FjAyTGzub8fTKMzPJvM4jB+1Pe9oJY0XAkIXlSn7KOyvd6L6x4aVQiS6or?=
 =?iso-8859-1?Q?hAJNnb5ynpajqObpMoF6wQNzTWfKtESqq+N4am4sDExv4H8v0QNHETlOjK?=
 =?iso-8859-1?Q?1ZuLKVygfB/wD4Q+hU+EvhF6oeb7FJNRPUhynR2iwilSU9TayMoT+fB3Iq?=
 =?iso-8859-1?Q?bb891R8jK+i5o2DI+A2FyJcXmYYAjg4epFbSdcu3cs89RyxTUOyKocLesw?=
 =?iso-8859-1?Q?5kszUzpuxLy3LkAS91PSjXIykqbiGOPqHSgu/rGzMJxkE8d70303i6PUtT?=
 =?iso-8859-1?Q?2dW+D4xysuMNrPc3xypEeWKx1+QHdvOZq+7VkuOmHwtCWq8E7v/zHrSFnm?=
 =?iso-8859-1?Q?+kpTdnwGFrGza1L3n3wYZe2yKr8GnYbe82Ll/wY83IKc7kqLN376jMriMZ?=
 =?iso-8859-1?Q?OIbt3qgnltV5hWZ1mixdLCk85i8K+w3Ui/rFr2c9aapPJ9orkwv9V9fY3O?=
 =?iso-8859-1?Q?cdq7skycdI5sSQ/xplB+/MfEWOPpO/Cnn+FDDSGLTcF9pJmcTaQepp32Cp?=
 =?iso-8859-1?Q?L3ZT6Fk9y/8XSAymK8I4xUaC1Vr6Kvfns1wCvudkUI3tUbwBuXwUDjkpID?=
 =?iso-8859-1?Q?hvoGlyqDMKIPs9hBxubP2tT+2EJzIJCkrnsNB0nCC7EX0jM0V+Touqoceu?=
 =?iso-8859-1?Q?FiHnMAa1xl+AHTh+bXnluHR/B1zcPLXRMltroLw5SrSkhrnyXXoqTAq7iv?=
 =?iso-8859-1?Q?C1PqDMFzoij8yZgTmgpDpYargXRfNj0HEC18T2Tb4HDT2aCkF7mdhHUBCM?=
 =?iso-8859-1?Q?c++AOmDhrEjDilDCX1p0ANTUPXEcMAfEnL/UWVoLf8anf5wUcBtO96VnAh?=
 =?iso-8859-1?Q?TTolRO/hTsMwtqB+Xx/1ge3rrAQBqhc66OJ/j3aRBZ81PMCtaI4EzT30lE?=
 =?iso-8859-1?Q?eFbtAgeG1ancpw+QPRW6eYQPz0PCr1AKbCxctGXHYdJa6BKZrNTuVOn2/F?=
 =?iso-8859-1?Q?fRU5RvtW2UxDeFmOIqXks2IIYdUetubAhLjH9GzBZZj4Mh5GhPKovNpn1I?=
 =?iso-8859-1?Q?7DwdurNTwl1y60rMmC/oFlLRsWChvr1+rjBUhsqSwFbc/EloXrbyYas7hQ?=
 =?iso-8859-1?Q?YbD9ZqmoKuP7ofLrJosH6YHNQexjpogNPF8vGMMnjsRoHqxqN2EOABfw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cdfd0c24-9c57-4a97-d78b-08ddc4056d52
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 01:09:34.7486 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MkH1HMzxnrcEhVG1CvYjHsxHqbm4mi4L0lvDawpruM4EEK5SNfvIUjpbsA3kb7PyK/FlFeNczwvvQPNIUPZR9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7775
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

On Tue, Jul 15, 2025 at 04:48:00PM -0600, Summers, Stuart wrote:
> On Wed, 2025-07-02 at 16:42 -0700, Matthew Brost wrote:
> > Add xe_migrate_job_lock/unlock helpers is used ensure ordering when
> > issuing GT TLB invalidation jobs.
> > 
> > v2:
> >  - Fix multi-line comments (checkpatch)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> IMO this could be squashed with the patch after since there aren't any
> users in this patch. But the code itself looks ok to me.
> 

Sure, I'll squash into the following patch.

Matt

> > ---
> >  drivers/gpu/drm/xe/xe_migrate.c | 36
> > +++++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_migrate.h |  4 ++++
> >  2 files changed, 40 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> > b/drivers/gpu/drm/xe/xe_migrate.c
> > index b5f85162b9ed..1f57adcbb535 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -1917,6 +1917,42 @@ int xe_migrate_access_memory(struct xe_migrate
> > *m, struct xe_bo *bo,
> >         return IS_ERR(fence) ? PTR_ERR(fence) : 0;
> >  }
> >  
> > +/**
> > + * xe_migrate_job_lock() - Lock migrate job lock
> > + * @m: The migration context.
> > + * @q: Queue associated with the operation which requires a lock
> > + *
> > + * Lock the migrate job lock if the queue is a migration queue,
> > otherwise
> > + * assert the VM's dma-resv is held (user queue's have own locking).
> > + */
> > +void xe_migrate_job_lock(struct xe_migrate *m, struct xe_exec_queue
> > *q)
> > +{
> > +       bool is_migrate = q == m->q;
> 
> Maybe not worth it, but we're doing these same calculations in
> xe_migrate.c. Should we just add a helper?
> 
> Either way for the above 2, the code looks ok to me:
> Reviewed-by: Stuart Summers <stuart.summers@intel.com>
> 
> Thanks,
> Stuart
> 
> > +
> > +       if (is_migrate)
> > +               mutex_lock(&m->job_mutex);
> > +       else
> > +               xe_vm_assert_held(q->vm);       /* User queues VM's
> > should be locked */
> > +}
> > +
> > +/**
> > + * xe_migrate_job_unlock() - Unlock migrate job lock
> > + * @m: The migration context.
> > + * @q: Queue associated with the operation which requires a lock
> > + *
> > + * Unlock the migrate job lock if the queue is a migration queue,
> > otherwise
> > + * assert the VM's dma-resv is held (user queue's have own locking).
> > + */
> > +void xe_migrate_job_unlock(struct xe_migrate *m, struct
> > xe_exec_queue *q)
> > +{
> > +       bool is_migrate = q == m->q;
> > +
> > +       if (is_migrate)
> > +               mutex_unlock(&m->job_mutex);
> > +       else
> > +               xe_vm_assert_held(q->vm);       /* User queues VM's
> > should be locked */
> > +}
> > +
> >  #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
> >  #include "tests/xe_migrate.c"
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.h
> > b/drivers/gpu/drm/xe/xe_migrate.h
> > index fb9839c1bae0..e9d83d320f8c 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.h
> > +++ b/drivers/gpu/drm/xe/xe_migrate.h
> > @@ -134,4 +134,8 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
> >  void xe_migrate_wait(struct xe_migrate *m);
> >  
> >  struct xe_exec_queue *xe_tile_migrate_exec_queue(struct xe_tile
> > *tile);
> > +
> > +void xe_migrate_job_lock(struct xe_migrate *m, struct xe_exec_queue
> > *q);
> > +void xe_migrate_job_unlock(struct xe_migrate *m, struct
> > xe_exec_queue *q);
> > +
> >  #endif
> 

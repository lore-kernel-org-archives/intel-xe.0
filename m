Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BDDDC25B74
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 05:43:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F068510E0FC;
	Thu, 30 May 2024 05:43:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eWOG08+r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 072AC10E0FC
 for <intel-xe@lists.freedesktop.org>; Thu, 30 May 2024 05:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717047802; x=1748583802;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=QEZJqDoK/UqmjPw2Wf8njxm0Z75KKZZPRYwxgR1Ovmw=;
 b=eWOG08+ryQ1autsbmHeqEyaGyJ2Srvvfkcj4OgeznBLyVMOzzbwRf47h
 rrjWD9c9Y3dNk463NlfMICuWHt1I9zT6fIKSmfc06wcWwQe7HBn945Ten
 QkeICoMP3EaDgLvDxz+zCGsZ3ju9dUK6AHruIyvYBeGNbCc8FX11tLovL
 EhYFsYh6JDZ3lC1xK/iFh8+MXtZqQU3u52Czk4ZJWA6iXALIlbBRYWg8D
 cBpDn82QQDmzD55iCbGrk1T5TIDmVz/QgmdT6p0cfCL/kLwlosrd9bZ0m
 7Kov0FFrZONy/vONN5pIh+xRwoJ5mtss8Aa9mkOLyIOcOFNyGAB/Na490 w==;
X-CSE-ConnectionGUID: oxPWphcjQ9m5u92dIB2Exg==
X-CSE-MsgGUID: oq1PHprmScWMtP2Glpkoag==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="17337934"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="17337934"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 22:43:22 -0700
X-CSE-ConnectionGUID: olAQq6v/SxWHHV9LgpgVyw==
X-CSE-MsgGUID: MpJgvqHgQiqUx6HyPHNHCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="66551963"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 May 2024 22:43:22 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 29 May 2024 22:43:21 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 29 May 2024 22:43:20 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 29 May 2024 22:43:20 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 29 May 2024 22:43:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CWCl+MjSQVAc5EqU2sfzxCGT2YgVTGIAJu4LQqCdzmp9KpxsS+TL9+CfwYzeR4Rc22Elnj85BcbpVU8lDuD089ABX+Oz6aBiRd03tGUUa9iHpo4IPDm2ncSTqECZzulKF3VCqdlJDNP2386Q9ZY0geCZBOH6QWu3CcJmHQYvsBbXtRNTXCWpgSYxfH3oI3yiKphoJ7AH2z3qVW1f2gIePZ7rjlNoK6B54KHM0zOf2k3Z3QWw63RkVRAmgBbqnfxt9cqLx/+lLUI3CatpZnEAkHwEuFTDroxEFPAu1dmIAh+9hjSPoBQ4qa82sITURmyuYML6SJioYXcifs1dDL8eMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K9lPnMigMCNk46ynni9gdpPrNruW1z9Q/ImQUOLR3cE=;
 b=G2rc8CbZwDq349h8PL0iMfVJVMrkRsyzVJ4GDW/YKTuIbAkG89fJmOLCR82CZocNdd3b4KBZNc7dJ5DzfjwnhkL1Ig77T6swAuvHWDJPrI7y9iVrQEqjxSnzxbrWQF/iJFVRGbidxsjOQCEMOo8K5mn054A0cEENhdErKh+q4ChpbGDfZW1BVsxsPNOu0pbjbGJUR3JjcBh7jOJbb8tDYxD3LHxV0v6vb28bPjOHhxJ2BozqZ4Ss3hshkuQzBfPa5OWvyqMWtLXUq4nH2POjV4g5kJhJ30kRwXgBwL/5NmmNu1zcYpSB4yP7USFkbgt7YHBQ+KRRBjL7Lk2CUX2mEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0092.namprd11.prod.outlook.com (2603:10b6:510:2b1::6)
 by PH8PR11MB6878.namprd11.prod.outlook.com (2603:10b6:510:22a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.26; Thu, 30 May
 2024 05:43:18 +0000
Received: from PH7SPRMB0092.namprd11.prod.outlook.com
 ([fe80::2ad4:4a5:b333:6ff7]) by PH7SPRMB0092.namprd11.prod.outlook.com
 ([fe80::2ad4:4a5:b333:6ff7%2]) with mapi id 15.20.7633.018; Thu, 30 May 2024
 05:43:18 +0000
Date: Thu, 30 May 2024 05:42:54 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Paulo Zanoni <paulo.zanoni@intel.com>,
 Francois Dugast <francois.dugast@intel.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Add missing runtime outer protection
Message-ID: <ZlgR3gA9ye8MhPEw@DUT025-TGLU.fm.intel.com>
References: <20240529215603.105082-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240529215603.105082-1-rodrigo.vivi@intel.com>
X-ClientProxiedBy: BY5PR17CA0040.namprd17.prod.outlook.com
 (2603:10b6:a03:167::17) To PH7SPRMB0092.namprd11.prod.outlook.com
 (2603:10b6:510:2b1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0092:EE_|PH8PR11MB6878:EE_
X-MS-Office365-Filtering-Correlation-Id: 87455adf-ace7-4fe9-345c-08dc806b6841
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?1hwO+pU3CHurggYMofRst3Qsw2YJCwbLP1lyEJJdUVANHnH8CrYV9EIME2?=
 =?iso-8859-1?Q?D4vRTdbPTZd29TT27Mj4wffj54gETtE4rHPCMVQTaaLnEcjRYcVNQd+7F3?=
 =?iso-8859-1?Q?58MCkDosRImkLDuivNLIVEindtGqpEeskRBkqv4USSq0s60Vb1R/CoFH82?=
 =?iso-8859-1?Q?azTn24VvMhCewf3iHAb1AenwUFQuQVFJydy1nvxBfRbKqe7jYqJ6+Z+c9N?=
 =?iso-8859-1?Q?gpaq8uxMp5s1GeNsmvtHZtQCGo5T7iEBLJSQoAPC3g5H/pR/gegwHCptbr?=
 =?iso-8859-1?Q?Z4llWNKUMglh/SnG9EtMdx83sp7fE/eMIKSBB1SXgDk9EKpBy9sAX1pkMS?=
 =?iso-8859-1?Q?VcZBrBnQp+IYW7hqcS90lodRzSQFl/1/VpmDUkNn421wn6kYLnNRGyCOed?=
 =?iso-8859-1?Q?ZzPjJu2Cg5n4aJ2lLtVOPjcd3do0Uc3L0BkdnGI0KPR2P8cBZGcBWWc7tc?=
 =?iso-8859-1?Q?sceUw6uY+heaRgP4k9xaDVb8K8cy/uPP0f8EP6VZQ1aSiaN0Z5G+bYP21R?=
 =?iso-8859-1?Q?M3vOFPdU35xaleABQUhrQoA7elF5VnQGHEoCaSNKRjsggAV7DEMOcjHRqT?=
 =?iso-8859-1?Q?XlLFDwT4V7w9q2JXuMFb2++JQDlNY7PRzCwdkPd3x8lPbD/xRDFaC6K2D2?=
 =?iso-8859-1?Q?m4LM4edzpS2px8O1PXboHreuBoXrms7oh6gk5hUYdgoK8kfh6jE1C+6OLk?=
 =?iso-8859-1?Q?lGYqvC57vJaX4k4UJ5QJb23tDaYwyVreDMbe47clsPbnG/cbCpeVlc0jUz?=
 =?iso-8859-1?Q?uIwBiCH4WUbB7Fgx9GC0E+E3qUF9zvRNHhSqF4B6aHh0YeXA9s/UEkQ0Gg?=
 =?iso-8859-1?Q?IyohkTwrX+QhUZAOQYY0EGzLPiopu/oc7Az4qGazN55LIi2rcABkGq37cC?=
 =?iso-8859-1?Q?elBrnG98H8NtI/Y2jVs5Pcu+lSNKDBdIhpDX2b/1y+egAXo7Veu39snzTJ?=
 =?iso-8859-1?Q?WhVM2eBav+9gmefvvTUZDOCoc3glYX2jIqp7/EBjDKwKDlzIfRA+y+0QRf?=
 =?iso-8859-1?Q?6PiRW5MX2REKo8mGFCubmJpOpZJz7R2M0hmsdnSPL4gXGvxMcoA9LNiFjC?=
 =?iso-8859-1?Q?E33AOF+UnG7GvfjiKpeJyu+twMN+kgwimam1rOl2BufOoBu5i0SN//7fLB?=
 =?iso-8859-1?Q?W9H+vccJN95kjaBJfXEx14lfIvEz1Af4spOsg5qi0YnztS+th93XxPcA4b?=
 =?iso-8859-1?Q?1+eR7CdRq0UwGCbwO6Kl4IMca9PhILOaGLzuOu4wSnUGSL593lCWZGvRZt?=
 =?iso-8859-1?Q?0BpPTDUvikkDt5qf0cs7YrghCN0oB7HIuYoXYIixj0YiBIwcyYcwahV3gK?=
 =?iso-8859-1?Q?DXYmfQAN8hhZdCkxLf5p3w5+fA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0092.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?eyVKPri3kTBbwrQEa7ZZ68hjQ4n64AUhi7n4GmPP8KbqUQz7USc9O06ZvD?=
 =?iso-8859-1?Q?3Onz3xldXOEH1DhbFA0KnmPX308DtqvnK9+Suz5HvzNpsxVUqaWDwmeCWF?=
 =?iso-8859-1?Q?CJklj2FK8brdnc7ZLkeyvxGM3ocNaYyYx9PmAI3RwamNaeiVqAOg7F8koI?=
 =?iso-8859-1?Q?Y5PWtSPRgg8GmVtJIfYM1wHr2XGb4H2AUf8VOwpDLUwwdE13Tz/tNiE+2X?=
 =?iso-8859-1?Q?A8RVaPI3aLWkOvaZVlrn3URKeH3JGkbCbQQlxFCUJZhK6MwhLs2/xc6Isv?=
 =?iso-8859-1?Q?Rnlxei63wLKsjuCK/ot5YfwT3BKMJ0gSE3AaNXIBUfkgDY1dx5BBUfK7zF?=
 =?iso-8859-1?Q?W1hwLatZW4OxI4AdOamp3cw/iUEpXQGTunjRpm9FNwhxJ+dk6mmIiCFREt?=
 =?iso-8859-1?Q?hSR4ljVPrivxJBrUN2T9YzyfITHXCKL9bHEkeX/sip/2bUPDCxoRvtLxzs?=
 =?iso-8859-1?Q?+drMParWBX4DLIcu2VQOLA2b0UGGzcWzKaC6+HF3uzdGDLf4blo/JeQSp5?=
 =?iso-8859-1?Q?q3sfgNdg3ZI/mCNuED/LQUAuuFMzuPni8RxgmojGkksZvkn/CuZ2Z5JQP+?=
 =?iso-8859-1?Q?RTcEg9dsXBmem/xVavrszQaDMYEyHsyk2pexX2ilhora8m2g5ZDZgli+KU?=
 =?iso-8859-1?Q?yM7Uz7jIpntWsoyojTJ7HfcjEGoA3HeHA/gBI20im1T8EnDrnkLZbe4ugP?=
 =?iso-8859-1?Q?k2TLjTxiM1NVNtp0NDZtvd3e/f+HjRbzA2HHvtEESGCtJLtmZGUGOgOfEz?=
 =?iso-8859-1?Q?goIZOAwubhCA1Ry7BfsVVYdmv7Np89RnqIxbVQjhmjxN4b3p0kJ+g+0Qvb?=
 =?iso-8859-1?Q?GuOtbq0qdZbMQVhO41yKckF45CKRwLnzmAcMWZFUtXoYZtcH4CFw+AEjH7?=
 =?iso-8859-1?Q?cK1xIqVIBDJGVS1XZ7pzVmOcoHjHadUbEYZs05VuF3GVWM7z4ujeqoQK+G?=
 =?iso-8859-1?Q?jHKkOPS7yXtnb6Y40nq13Z2Ar0UyxieLB3ApDPqAV7NYmSqPzFVpzuE6rZ?=
 =?iso-8859-1?Q?t+iKTR+NQ01nt7j0nVv/rJBkR8LK97tvk6KauqNB+BGmZhslLLDfPK5xBp?=
 =?iso-8859-1?Q?Y6+qn2uWGiWbMROqGhhf3mEA9sUtB7Jsp5CIp73qF5K0+B4hG+PIzR7ezQ?=
 =?iso-8859-1?Q?Y2u0wkWM6+VLaeCoGoBP1wT3lmS2BUQJbeu2QKD8hA7OZLpUBsYGeCyuBI?=
 =?iso-8859-1?Q?p/prBAUvVYiIcELctrs7hlUGYTva6x94Oh/9tB3EYHyjrDqAoYxs7lCecA?=
 =?iso-8859-1?Q?RYvGmlq9RkFDtHDWENe/RPW50b1NwJvKhR4kywXLVu/HowR9DRWA1jpMAk?=
 =?iso-8859-1?Q?1Ww5DF6iL8Lv+Kcqy9IEWx3MEsCYyd7tOC1OqYoti4bXlQ8G36V7C0zwGD?=
 =?iso-8859-1?Q?y8xD+IIOTrY7eGbu9JjxASMMzuBu3Ug0xBQIFbb1wmFDdxKoRF6yILkaPy?=
 =?iso-8859-1?Q?Rnb45Tw/DSy2mjU2oyBojau9+rt+PRO4Vn8Jpkz25qU9yQmRe99ryFoR5R?=
 =?iso-8859-1?Q?viPCw/FPQTpWK1SinbPeg4x+uxXsXaCjGwIdBKwZOs6AZr7vBeGiQ8e88Z?=
 =?iso-8859-1?Q?V64rjNxNhOs/VIk2B0tFZYWTJGn9Sn6S+4Jb+oSgZQ8lRGYvkyFl5/+0oE?=
 =?iso-8859-1?Q?WUFvF8Du9rNlOmQcY53UECMJDraHwyuaD+Gm4bSjMWcY2mpd2PTalJgA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 87455adf-ace7-4fe9-345c-08dc806b6841
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0092.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 05:43:17.9659 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7TTszQGcsGOA5s8S+MOLZeSSjr6uNliFFicW+alb7sAiDCg4h/H0eXtuJvEpksirFFfuulVfWaW5P1KS4W9v9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6878
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

On Wed, May 29, 2024 at 05:56:03PM -0400, Rodrigo Vivi wrote:
> TTM BO destroy is called unlocked as a ref count worker when it
> gets 0 users. When that happens we could be runtime suspended,
> and waking up from inner locked places like ggtt_remove_node,
> could potentially lead to deadlocks. Our warning system against
> this case hit this case:
> 
> [ 2295.891269] xe 0000:03:00.0: Missing outer runtime PM protection
> [snip]
> [ 2295.891604]  ? xe_pm_runtime_get_noresume+0x5c/0x70 [xe]
> [ 2295.891717]  ? report_bug+0x18d/0x1c0
> [ 2295.891722]  ? handle_bug+0x3c/0x80
> [ 2295.891724]  ? exc_invalid_op+0x13/0x60
> [ 2295.891726]  ? asm_exc_invalid_op+0x16/0x20
> [ 2295.891730]  ? xe_pm_runtime_get_noresume+0x5c/0x70 [xe]
> [ 2295.891816]  xe_ggtt_remove_node+0x93/0xf0 [xe]
> [ 2295.891870]  xe_ttm_bo_destroy+0xe9/0xf0 [xe]
> [ 2295.891935]  process_one_work+0x225/0x730
> [ 2295.891940]  worker_thread+0x1d8/0x3c0
> 
> Add this outer protection to avoid any potential deadlock.
> 
> Reported-by: Paulo Zanoni <paulo.zanoni@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 2bae01ce4e5b..a902f23bec0c 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1066,6 +1066,8 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
>  	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
>  	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
>  
> +	xe_pm_runtime_get(xe);

Should we only do this if we are in a kthread? i.e. !current->mm

Matt

> +
>  	if (bo->ttm.base.import_attach)
>  		drm_prime_gem_destroy(&bo->ttm.base, NULL);
>  	drm_gem_object_release(&bo->ttm.base);
> @@ -1089,6 +1091,8 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
>  	mutex_unlock(&xe->mem_access.vram_userfault.lock);
>  
>  	kfree(bo);
> +
> +	xe_pm_runtime_put(xe);
>  }
>  
>  static void xe_gem_object_free(struct drm_gem_object *obj)
> -- 
> 2.45.1
> 

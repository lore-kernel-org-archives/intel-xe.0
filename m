Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD664C3ABC9
	for <intel-xe@archiver.kernel.org>; Fri, 16 May 2025 15:53:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7ABC10EB03;
	Fri, 16 May 2025 15:53:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OxBsdvnX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EFE110EB03
 for <intel-xe@lists.freedesktop.org>; Fri, 16 May 2025 15:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747410817; x=1778946817;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sAHnPElCUuml/nAO7dilaVGSLup8WEbv29XZ8bn/oqI=;
 b=OxBsdvnXjWRZzJn20SyR3OnuYN9iG7bqU1HXs8t+Jff9T9iBHXkw0WDN
 IpHhQs5XXX2sp5BKZPmZffxBFP3XcFKJj+o84heAUu1NiurvHeCWEbNUt
 +/Z+vUDsZEbgEYYk5Sla3YBQJGntlIgal6lNUcM5mbsF4ASybG+lO7Odw
 WLYl9Cjq2U5b6GHHukKvvHEEC6llpAn3an5IWlSCvXt2h7zLK1sfPQrq3
 OEQGyKCagZaHh780igG9u98DJfTOpnA0HuOUpPrLIT3wWgUbc6/BAWZ3X
 zAiOHlJdIxInKruUE2BM+C4HcyzTe+5gODYtwnzVradUogMoLV/G4CE3S g==;
X-CSE-ConnectionGUID: HtvudO9jQ1q8zQTvch45JA==
X-CSE-MsgGUID: mSW3QzEpSSKZxaP/pVPzHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="49528789"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="49528789"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 08:53:36 -0700
X-CSE-ConnectionGUID: LOPNVKofQyGPBjxHJvd6Bg==
X-CSE-MsgGUID: CA5VHoy4QSWELRYEHGpXPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="175856639"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 08:53:36 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 08:53:35 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 16 May 2025 08:53:35 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 16 May 2025 08:53:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OvLr9WUGCUwuY7JZholOqvF/m+zcoaZY5Y/qj6d6lW+9BKsFS04GcqzzkrSNvPI78NTZ/8iUn8In6oD4/Em1+iwR2GUXupjSYwYNSBXuj23ZOdVoAnk8SC2O4IDkQqIpM/rC9aTuvDo75YpF0s7ckX2njZr6cr4RbmR5xTiDE/PAVv3aw4atfrCsisoST+ZLopLm7I8wHKzB4Op9IY8Zdhmqk+a9oheMAtNpEL1f8eBDzzw/MtiImAOEDk8ZPaLUIrYc8fVlJ6aedHGd89qWE/IYTig2u+K6NgeFBZ2aFIXvBO0o/O/mujYcp2SBLvYIkj5rstG4JbFSOijkAN/PYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d0p1DJTqLRgJIcL5510DezPmOk/JQfpetcBZF59JBB0=;
 b=EFUiQmlGwcL3lw6+e5gp1PKUz8UhLc34lHwerxWuIEWZezVHlaOnPgTbao8DjRcs09+jA7TDfPkrCcWmWGdGQdwIUoC1bbT0l47L5xr+qdENAc849jRtz5h1GZOYsZdipPD/gLmz4eSGAOfWMsQDYnJIxaM5DyJsNAyjoWnHhQKM5wWjaB/Kd7X1I3uQGUA94Ut64GlHfsNMvtqjc/vZvBxcrQP2vLcyqye4btH68QWxe+UPPN7HsWPdAH3wPtzv9gsBAAEiElSmq3uz/upVYCWaCpDpPsD2bZLN1x0r325e6b8SM27BdlDf025+PATY27Tp7E0pkxF0PI6f7/37sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB6663.namprd11.prod.outlook.com (2603:10b6:806:257::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Fri, 16 May
 2025 15:53:32 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8678.027; Fri, 16 May 2025
 15:53:32 +0000
Date: Fri, 16 May 2025 10:53:28 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Marcin Bernatowicz
 <marcin.bernatowicz@linux.intel.com>, Adam Miszczak
 <adam.miszczak@linux.intel.com>, Jakub Kolakowski
 <jakub1.kolakowski@intel.com>, Lukasz Laguna <lukasz.laguna@intel.com>,
 =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>, Piotr
 =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, Tomasz Lis
 <tomasz.lis@intel.com>
Subject: Re: [RFC] drm/xe/vf: Allow to inject VF provisioning errors
Message-ID: <it3s66p5seteqe7o5yv7jyvsmj3ii7yvmmj3bnmuolgoncl4ww@p7tecz6zzm5i>
References: <20250415075647.29295-1-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250415075647.29295-1-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: SJ0PR03CA0294.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB6663:EE_
X-MS-Office365-Filtering-Correlation-Id: a79699fa-0d44-4b79-a8a4-08dd9491cf18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DK1IXC9skAN1f/6r0FBjt+w/4go8RJYSN2IhhwkKe1qdRHkO+TCHgdLMYnWC?=
 =?us-ascii?Q?XU+sJowakFgbLh/audKK6KJJeZGaX93yhaleGjdUUADiBOU/X8JL8ePN/gQ0?=
 =?us-ascii?Q?CqaETzk+XbN8Sr2iUoeL17idKudruQXQVMFqoIgumnCeeujJVpSEzNDnAL9r?=
 =?us-ascii?Q?pen6Rx6wlEl0hZvfXEjjj7U3O8mGjpIvat3i5J4Hf65dlI62VSuYCR0tSnzb?=
 =?us-ascii?Q?5Dd3IQ8bMkHPUg0rJ6OSUJEKLAvagkpvn9nPV41k8Woz75/7p39/KC4l9Dlc?=
 =?us-ascii?Q?QA4/yzVZ+vx6ZkuguIP/g8z0bslhWGjo/xBPwBmIt0M5WkYHANUS52gEPTIq?=
 =?us-ascii?Q?MtDGbHE8V9jJ/YAh6gHTAjezkpjt2rllvqvoKP4nuuJcYmwH1uKzxr/+Y9w/?=
 =?us-ascii?Q?akkm58XFKgHrtaDLxoYdrFCL35HLb7jMBxoMGkY6tHkfkvfr+4Tlo3OiFSVb?=
 =?us-ascii?Q?abViHfB2n3Lfxnt9dBe4vVJ7tCa4ucnGuosPPyrGaiIz+IpFUpBw/PqnAxMW?=
 =?us-ascii?Q?nVTXBYc6Zoos7LYhsgHosCmeR69hAJzzzZ+HhJDNBcmBlGHlqnOgBAmE4GJy?=
 =?us-ascii?Q?Z5Uc3H/YqBb5mNWisVWdWsgT6AKrpgZn5ne58EuGBNbruXz/NvdvkrSMGkP9?=
 =?us-ascii?Q?QoW5o8B3CmtGZnkqAUy6hI+6Mj473IV7wlaGv5S8P6+gXI/LSp60fm0Oh0JW?=
 =?us-ascii?Q?xoC9mZcil24Z6WwohMlYs2btA+vkuc/M7rb/xb87A+qy4vayB+wIBWqRoZwL?=
 =?us-ascii?Q?Xg+zVhC452EAfMgxuQfEwomsKmcovIfuW0Qs9wd868nJlRoq58MNf2TVusRw?=
 =?us-ascii?Q?fMpXUeObN5DaW9vPxifDrV0gCXRFz4BDqnksk5c07AVgBNkIFXuB2a/yQv/i?=
 =?us-ascii?Q?NsbOUQ8HUmZrSZC2iWRa3cy0coV3cisiT5Cj5Bxf3Ty/E6cm40ZerulYsAzC?=
 =?us-ascii?Q?dSTP3HxjoHtO1rkFSZQfN7yK1pIK2V+ez4pS/e6cvCxQqOLXXe5FU3KHXq0S?=
 =?us-ascii?Q?gaDSPUuElerEYIIFKZTh4sTi7hdXLEjOSmsozJTVthr58zAko9qWoo5aVzQF?=
 =?us-ascii?Q?YmmpuB8kuY7qrI9MvFEnEwH8ivMvbDUr76BNXfoiM7eiepcE/AAZjB49J/ai?=
 =?us-ascii?Q?knA0sTrRlCVM1KDr2DTU6in0W1cClceMGdw4eQql3MkBY8QRR+B1ATQCJgNL?=
 =?us-ascii?Q?pCOAuisrvRYOK1FL4RqVYIAYxj/5cRj/pOql76NWlXJQ22ylrAK6JVmQH7Il?=
 =?us-ascii?Q?bliidSEHGGpDJN7H5arroAaDwmLdtO3d1Ec3E2XQrHF2bAb4HBmftoy1ILyH?=
 =?us-ascii?Q?ZNLPcKdWh+P9UDq2axQn/W2W8QIjRmeg7JbZ1Xe3jy9teffhFNwSZjqwIa51?=
 =?us-ascii?Q?qVZA5csryKIJpYyW+vdjeMqQhCKx1kKkY1U6qHeBQKps6f58vtc1FxPONqBJ?=
 =?us-ascii?Q?USsoquZFfnI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LZOmOw223F0A8SZit6C+O4rb380yTfeOOy+HZF7FRbRxnqGSJFb7TjJsTNo5?=
 =?us-ascii?Q?/ZIh6mlUk8mczoyYNpSWAe+b6djMWAi0XgnQTpID4cEG7cWCneyusfspbsVA?=
 =?us-ascii?Q?bnrtUOEt8unakiLVuFX6a3m+yyAAJR075VzJwcakIV387vGgQxgKEjvl89Az?=
 =?us-ascii?Q?hJcI2ebD7QcZ2rvzq0A4pqYAFjs0iE6v4Lf+HIxf8/6sYVVQrKUJ5acFMyYn?=
 =?us-ascii?Q?mFzIXSfhILOqf12xZso0JQxmHXTZG2NDfG9XbjvGpognHPNJhLG+XB8pMgor?=
 =?us-ascii?Q?FZKFTvbIvUn3QTUKvG0wFphsdvoyatVaAv/5VGXFk/B3eA+yY/maFh9hG8ck?=
 =?us-ascii?Q?2yaMqA09kLej+E1IKt5IDsUhVIrN8G6k7wkDeqKy+NpXbX8M8KlTl2jluyty?=
 =?us-ascii?Q?CHL4zbNQ/1LJhPJ5GR59UpI3F+zNb7uv7+1ZnVeiZMlpoEmMq+cjEYdvNBSy?=
 =?us-ascii?Q?UGKVohJ/9gu4XkWviN1PX49V1P4vBCgIoGno4Nl3iliQz/WPSXukVXiaZh6O?=
 =?us-ascii?Q?MYaCVXaVbz/Vuf0s8wbBbKShvT5rR8lvXFqteyQXISaifPtZZGPt4mJ8Smqb?=
 =?us-ascii?Q?xZmMEKzxGYXY6xRcqfNakN5FxfeUQD5xmiJ0a6ZBOT1cUCBC4wCkWqd246Qc?=
 =?us-ascii?Q?FWdf2DeQarrvCX1LS+OhGVEKsPwTHBJ9OSFCZgzabd9J23xLKzyRcfUplX7F?=
 =?us-ascii?Q?t9q6mbUwL5kRE6tby6z+WUeniS/7UQ8vAYCstVSW9NTcNq3pevlPTnjDzTPC?=
 =?us-ascii?Q?g52Ip+c8sQq3vhBm0oOgIKIxlJnkJ/qWeoehLR3rEr6DYrWLMREy9N/lSdyo?=
 =?us-ascii?Q?jS5he/x4YUoWU8QGGkPN8MFS4Dfo+azkq8RzOT3AZQSPztADXPABANPzFQdA?=
 =?us-ascii?Q?h21IINpx/dbh3cUjg6O2B0KFkAWAHfcn4eQes21ssbkB/QxCafXeiFMlC/vb?=
 =?us-ascii?Q?Eg6PSsIuugZnajjeGCg3iefRH37PdWhrJkWK1ara3U1oFwhzpTahgHKdBusr?=
 =?us-ascii?Q?oBAspT2m6cvg9Ne5AWcEm69Okp6FalsZuiZMVaY1j8kFLXrcjz5jpGDZ8TY8?=
 =?us-ascii?Q?PjXMGhI152yv33F9ObGuCjUbD5BGD7REvH5YehMoN7NecWF2YmLixoPPk3xj?=
 =?us-ascii?Q?MC99EtD5XINu79qYhm/kBiYSuKhZnpnUiUv+PtDBsWz5B/UwPBcqw/gZUBNZ?=
 =?us-ascii?Q?NZpwRxx7iuIacL1N17n/mxgYMAe42ZUNJCiwUwVVCgu541+uN8/PdlL0oRko?=
 =?us-ascii?Q?gU180D0oWu2oQSuCubAejkczXdzMWYgBRW1s9qsa4YclUjPzawPGJUfi82X2?=
 =?us-ascii?Q?Cb2MDpOV3d9yBLYznFbT59nlj4u6h6NLeK/rHwvZcCUFmO1G53h32CyVg4kG?=
 =?us-ascii?Q?/IbFbAAnBk8xy552IqQUcKKLkqOB7I4Uzcj4UP1ITSudjgVPbI3F3Zmc4Dav?=
 =?us-ascii?Q?cEfjU2TFy84XQY44e8i+duLTuT2LfA3omNhfp9Z0LJE9yaJn8hrWJfGSr4S8?=
 =?us-ascii?Q?04xcZGYKDXANszjbKCg/6zEItDf6LFImU1S4XFNa+KOGpWZa/wa9FjiSYuuA?=
 =?us-ascii?Q?2dr8wr8SLKTPCMZMAPMTu0utZdi637c/g/CAmQ7qT1hnrU8Pj/MfKre0Cz2Q?=
 =?us-ascii?Q?zQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a79699fa-0d44-4b79-a8a4-08dd9491cf18
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 15:53:32.4200 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G24N79a6JflKqH+D/uTwE+qC5A1hZr+vGiJ0Cr0ysbt8MjApI2NJH2imxJ6V7CEXxrnd6z+87hjBXwPPrRPIke3FNjgiEJn0Y4Gni6+o7QA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6663
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

On Tue, Apr 15, 2025 at 01:26:47PM +0530, Satyanarayana K V P wrote:
>In unlikely event, due to PF malfunction or misconfiguration, VF may
>receive incomplete or invalid configuration and it must be prepared
>to handle such cases without causing a crash.
>
>Since we believe that our PF implementation will not provide invalid VF
>config, reuse existing FUNCTION_ERROR_INJECTION framework to alter VF
>provisioning to verify driver reaction to unexpected or invalid
>configurations.
>
>However we can't use FUNCTION_ERROR_INJECTION directly on functions that
>query VF provisioning, as all detected error conditions will cause
>immediate abort. Instead define dummy functions, where we could inject
>error using FUNCTION_ERROR_INJECTION framework, and any errors from these
>functions will be used to adjust the received valid provisioning data into
>the invalid one.
>
>The following errors are recognized by these functions and to trigger
>specific provisioning misconfiguration.
>
>-ENODATA (-61)  : Force resource size to zero (unprovisioned)
>-EREMCHG (-78)  : Force resource size smaller than received (should be
>		  harmless until driver detects inconsistency)
>-EINVAL  (-22)  : Force resource location invalid (like GGTT base
>		  below WOPCM)
>-ENOSPC  (-28)  : Force resource size bigger than HW limit
>-EDQUOT  (-122) : Force resource size larger than received (will cause use
>                  of unassigned part of the resource)
>-ESRMNT  (-69)  : Force resource size larger than received with invalid
>                  base address. (Will cause use of unassigned part of the
>                  resource).
>
>Fault can be injected with below steps (using GGTT resource and -ENODATA
>error as an example)
>
>$ FAILFUNC=xe_should_fail_ggtt_provisioning
>
>$ echo $FAILFUNC    > /sys/kernel/debug/fail_function/inject
>$ printf %#x -61    > /sys/kernel/debug/fail_function/$FAILFUNC/retval
>$ echo 100          > /sys/kernel/debug/fail_function/probability
>$ echo 0            > /sys/kernel/debug/fail_function/space
>
>Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>


Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>


>
>---
>An IGT will be developed to further test and validate the functionality
>introduced by this patch based on acceptance of this RFC patch.

yeah, looks like a good/clean approach.

Thanks
Lucas De Marchi

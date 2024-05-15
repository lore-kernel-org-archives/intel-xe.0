Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5465CC04FFE
	for <intel-xe@archiver.kernel.org>; Wed, 15 May 2024 02:59:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D02810E12F;
	Wed, 15 May 2024 02:59:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D6L4Mwbi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2539510E177
 for <intel-xe@lists.freedesktop.org>; Wed, 15 May 2024 02:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715741963; x=1747277963;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RlrZdVzbWJ6Z5Y8A4n9vJyUa40+b+LTlTB5NB+LDf2c=;
 b=D6L4MwbiNNrLDedzcsxDBJQymFTg1nx9IyMD/23noadF8dCVmdT3nYVu
 8agwucV/JlVSBJOJce+1PrKCUkev/HAzEhhdz1zDwTLsxawCRgFbDgqAD
 rDOWg4mP4BPWjksbP8aSw2otYRbdWRowqUlDJvuKYKCBZ1cuDWZ+zKLJF
 W28IS49mQQYGPWT/c9LBT00t971+kbYpdRbztJE697Byjtigf21M1LZfS
 OjfDRolnt18HKvnQmoEck1/7Y91iM8yLUUAtAWmq7L2jLdh9WucM2zc3i
 JXvG4TZwUObDVK1bsh1Bge2p9nFjquLyi280QL0tIZIiRUQmre9roMCdt Q==;
X-CSE-ConnectionGUID: BzwvbhkZR+C16fwoKw/ZqQ==
X-CSE-MsgGUID: YdzSlRLVRASNXN0rq+7V4Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="15589410"
X-IronPort-AV: E=Sophos;i="6.08,160,1712646000"; d="scan'208";a="15589410"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 19:59:21 -0700
X-CSE-ConnectionGUID: tKGDAFJzSpSxRi13W2me2Q==
X-CSE-MsgGUID: KdGwpAx1QgywTwJtg4vu6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,160,1712646000"; d="scan'208";a="30967428"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 May 2024 19:59:21 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 14 May 2024 19:59:20 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 14 May 2024 19:59:20 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 14 May 2024 19:59:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gxOdfyiUHr0Ppb+SEWCOBsrtJGj5mGZMiyKVDCM+x9mQSiwSl+acZC8aOrYDDTjZNWIa8y1d+l3RB0QZJKrHxDEZMvMkGgdfGyertLV3nawmzxKJP/iM+OhzW3nfCD5YKtbnAHJrm+8gpvdbtuHbpFoU5zJf3A+6CM3RvnhFbWFSvipOt1DTOX9U0IndJeJRWEygNKWCEJMporm2+fEFRLJdxIVLuFYl043x/zq/iyCaHNwINEsY66I3d++muUn8Smw1Ktc8tqxYFIl6TQV+toAVaBmRutm0lKUybPKeCIyWqNj23PCzWTzAnBzNkoDFzvxgmoRDIkWeoKDJVrhDUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJPb7z42CCrw4t5CLPgzcm2qiF318Im/8YOTlGHiIjI=;
 b=kQdI6hk6v5/zNfA0MK8cEMQuB0tE/m1WYRF0jKwcCShHbELv3uai5On6/G4ZulUCNtrvriIaL9UuPpf6YSRDpf8zWcqb9uY4xQp1dyk8Q0Fw9lkcggZ8FHq3ZxxgA/jPqTqcAtZuOlsHBMm3pmJ10G+WNUxFGuSqBmLULlulIMSl8xeSCAka6E8vKpnfXtgjzjhf1Uu7IfC9ZRENOFQRWdLvj3zdgvGbz74pA7CSEYQCHPrWfSLLOYvmAd3KKS0vCKJc9iTLrP0y1jOmKK27Sxhjtss5g8RDW0nipa5z0Bro0HF3Yi8lOas982P19iCV/36+dJCd2nzrvoIbGO4XQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA0PR11MB4656.namprd11.prod.outlook.com (2603:10b6:806:96::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.26; Wed, 15 May
 2024 02:59:19 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.052; Wed, 15 May 2024
 02:59:19 +0000
Date: Tue, 14 May 2024 22:59:14 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: change the power gating register names
Message-ID: <ZkQlAj0h4v1s1u9I@intel.com>
References: <20240514064309.3819722-1-riana.tauro@intel.com>
 <20240514064309.3819722-2-riana.tauro@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240514064309.3819722-2-riana.tauro@intel.com>
X-ClientProxiedBy: SJ0PR13CA0220.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::15) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA0PR11MB4656:EE_
X-MS-Office365-Filtering-Correlation-Id: edb50ff2-42ff-4af1-fb14-08dc748b0374
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?p2mk5WP/Z7uRpKo1YzRuz1If/j+PYS7xfAe7ordLhWDVrgJwQ5Y0SoTaC4Mj?=
 =?us-ascii?Q?l/EDBCT8u6lIHODs2a4AHK7c+dmuiYZSp2rsKg3ZGO7oqhFv/8jOKhqKo9H8?=
 =?us-ascii?Q?S+npCoeDRimed3CLsLUr6a+Mgw+DjfcgdaGNpEpB8jZDMe7AS3tyEwynlJI9?=
 =?us-ascii?Q?Dm1rZaI7k2rlBJ3GQzTgCgenpZoK99pzi3PdY819bDvavzV1RobAL/GXC+/c?=
 =?us-ascii?Q?Va1tDPKGb1OPoI5UaURjvD8wQIzH5B8d+/s/T2i6Io/EHs18HkyPJIifFrQ+?=
 =?us-ascii?Q?oyOmWbmv36wkLcDaY8bbGQiMS9+OFeNNplngdmrZmnd+M/IZ8eqo3stGj91U?=
 =?us-ascii?Q?TMzPt8+QjFAHKUI0sY6Uj3nQQsopDg9uTNf8auPM+yyFo1H4+7XC1y0BJM6B?=
 =?us-ascii?Q?FlGsPyDlr8nOFkJ4cFu1+Ac4gX55MEfHipIdCn2KkOwA+0K5S00ykkvEwkPI?=
 =?us-ascii?Q?RyOd1DyZWOCPVYucZlLcmeWFj98TJgnUfGGIA4AS1tasMK0BVc2sXPOXdo82?=
 =?us-ascii?Q?8XtLkIcsAYvkqkLprhj2VYfIkoAKFjbd0LQjqxDap8p3GnPYdP5S8bzJAC0I?=
 =?us-ascii?Q?EonpXE4qmNuAIuNJW7IZVC2mMU8DKQIBlda/lP6wLJvjs4uJB1D7u/JvU6yY?=
 =?us-ascii?Q?RHTtmjDH8JlX3yG1HyOsj1m3V4iSLpdiVcCYq/2eExMTRUrhNJdsgzaG+byP?=
 =?us-ascii?Q?L6CifpSmaYM8bDMIpI1vzunC70WQr/gA7LkTMv40PnkdXi1nFbEkzgpvH6R1?=
 =?us-ascii?Q?vVUNX9JfX+PSWkQZa4FtPzkF8+TshUjhxb3M3adVHc0mn8TIfh81w+KC/lXW?=
 =?us-ascii?Q?3HPJt4OA8owoXssEg4kPNL1cwRWz2HNDDMnrmikzJwu3BRDf0AgaN5zbj529?=
 =?us-ascii?Q?4oiHLQuAUpjH2LgOyPAbrT/ZvHgjPKtYZJ47snv6PmvcU1whaqxXqSWgz7PF?=
 =?us-ascii?Q?zPCX6kcKzpMHcx6JztzDbrSIMMaktaTJgcDEm9xMjBaiKigXvsHrLWjmHA5O?=
 =?us-ascii?Q?bbctK0XmP8rUKXQHall4MzW3/HeLBs6F6lqeQ6uN6+DwbElfJX0ZshKz602F?=
 =?us-ascii?Q?oBpMxKdgmaYSEW7Y0HXubYZgLvPEUL81zPYusUs50jqYpMOGGqrSisO2qmfd?=
 =?us-ascii?Q?8EC9waD8UUWhM8Yn/F1wduK0JOaq5NYNuIx+Z9MWnqYZ5OD62+JKCpXo4xxK?=
 =?us-ascii?Q?uJO0iQhX0LJFLBybXoEoadwNTVbNOFffWcRZY9yov9nyzFMrEIsGdosmCswc?=
 =?us-ascii?Q?hD20vAXILEd/mbBBnqVAxYZlg8r6rooPdy2GMUDqkw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?c3o4r0gIBvpQ+4hxKUCtuRyenbX0yi2VKfEfsgcpELKp4Xnp96wt/zW3tK9A?=
 =?us-ascii?Q?Vv9GF+j0p9NS9T8pvSnH5r4gXy+h2HcguZN2GabkrWqi8XjosCRjA/Rh1aOz?=
 =?us-ascii?Q?XJ652ZzJUSJ/e0XQeS5Bj7Gjc8dgYZIWChtPfCRkfcHEqwGN7bDrXhqomwSv?=
 =?us-ascii?Q?3YnZaFK4dKoeWXXrJBnywRnpxzyDdQkd1w1oS5JMUDSrILGx2J3KT/KpuNV3?=
 =?us-ascii?Q?Kn9IpZ2c/4LTifcxRTr2nNRBzu7yob3CpL3KBUCRey8yWCWNNxFQSURnPtw2?=
 =?us-ascii?Q?oKQWArcxJdxU8EgbJWfJcxFEcisEfupzE7U2v62kXTGkCIJxfMvfEBDjftrj?=
 =?us-ascii?Q?qA/maRrnvxdD+0uSAzP23rn4uRAs25CJLVCPOjZZ2r79CeMyKjNkRWVi9PVx?=
 =?us-ascii?Q?ULJ/SVa+M2myDIMaerTq2OFrDYBpuH3zfIYRCDscpe1ja5vdXz1m8b71N0EO?=
 =?us-ascii?Q?mbbPsee76cAjNnvGcsXy5d8R1Q04fOyb9rTkZza5lgjbBVhwCZV0COtSnXnI?=
 =?us-ascii?Q?C45Bn33y1j9Bf0jFOJcF7rxiKoHBMTM34B1h8FnpEcWhrLPs/lp8O6uFiQbq?=
 =?us-ascii?Q?Z5H7Svnllrc//2d9JOayytgx1MBsWXX2UflMWPZsGZh2/IZfHURVyEISL4z7?=
 =?us-ascii?Q?6PBh8+lk5RIET/4Ajce0etMUJuARePJ+3wKPAkf1G8APVmlV0YDUIx69dm/r?=
 =?us-ascii?Q?d9ZCDthDIeOXVIxuYYnwb/tgRdzjO4tjOPEVullYf1fW8n90c3fJLmLel8Ig?=
 =?us-ascii?Q?yeOnVF+8wBispzRDcI4eEGS7ZGYxifU1vfi3aM5I207czmV1aCXxrbtlbrda?=
 =?us-ascii?Q?5crR/nHSev7sBp3hAbFiSNlmmbWyw0CAUXs+lbAg9nwy5lIDGLHnTNCjv/ZR?=
 =?us-ascii?Q?2BZ6Pvux+KPS8vq8p8btlsRdFknS7GWDa5cqqPS5ikeoSJpnBZuYmTot8w/F?=
 =?us-ascii?Q?TcqLoumyjPbKCh7ZcfO63cKesfoawwv0ZB5Oi/L0ad7tpBwoR2Rj4Xml5RKO?=
 =?us-ascii?Q?xv0Oag+BvoTYP5TNspEOT8yETd40uVV4TcovZdVyRkQShEG8G0dP8ehHpOPY?=
 =?us-ascii?Q?s/d+8JhcpYegyTvr9leDCw22flY3JxcyKCGtzR8GRz0NnHj8/OSu4hiuCLcA?=
 =?us-ascii?Q?dLrRfPlCHcRV98+MVbWG0hjpPh+HNzFscpvtBNY7Pn+zjCBodj3opE6Gh0KS?=
 =?us-ascii?Q?LALiYwAJlmsqZQq7SBfQfnT5cVEY5UX5l52wMS+F8ieO9v3BuC9TlwPUoWYL?=
 =?us-ascii?Q?xNUeHa0qyV2Boo7OolFZU0XbhQ/ufZwbhc3yg1wb04RQoo0E/Z2weJawP3i6?=
 =?us-ascii?Q?4f2uHuligmmbcl8ij9bCg4B+L/6VnM2sGjPCnK1BfPx3eqQsVuNnmFiFA5Vg?=
 =?us-ascii?Q?AtIb0l8YCePGrzY/bAccFNx8f3RLb1CbjCPXaciIIy1ast/+Q3EMd/puaiRX?=
 =?us-ascii?Q?1ndPGVO5cNOnEHjZx7XsGuion6eKGsoSvFFNYSJnQSjovurroWJVXou17W50?=
 =?us-ascii?Q?+AeDrI1tH+I+MZoZ1SRsHAKa9QCh05FZhfoQxe5mICfSI9euMCaAuw+p+L9p?=
 =?us-ascii?Q?ovVj+1ePgGdYFxS0TLXKW2Ud+GC8vufn7TM2zTUn?=
X-MS-Exchange-CrossTenant-Network-Message-Id: edb50ff2-42ff-4af1-fb14-08dc748b0374
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2024 02:59:18.9874 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Db195rxGEtb0nw7P//ozwpXXIFVQq0mmSHjRYg4y9sjx9PzZliASe1I0JJmTwzOVB+O+6uzpACK+yuCTYZyJDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4656
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

On Tue, May 14, 2024 at 12:13:08PM +0530, Riana Tauro wrote:
> change 

Probably good to start with Capital letter here and in the subject.

(not that I follow good standards myself on this, right Francois? ;) )

power gating vd registers naming to n-form

reading here I was thinking: What's VD? What's n-form?
Only after reading the patch it made some sense.

Perhaps only a message saying:
"Standardize power gate registers." should be enough.

> change PG_ENABLE to POWERGATE_ENABLE.
> 
> No functional changes
> 
> Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  8 +++-----
>  drivers/gpu/drm/xe/xe_gt_idle.c      |  2 +-
>  drivers/gpu/drm/xe/xe_wa.c           | 10 +++++-----
>  3 files changed, 9 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 9cacdcfe27ff..7c173db7d585 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -316,11 +316,9 @@
>  
>  #define FORCEWAKE_GT				XE_REG(0xa188)
>  
> -#define PG_ENABLE				XE_REG(0xa210)
> -#define   VD2_MFXVDENC_POWERGATE_ENABLE		REG_BIT(8)
> -#define   VD2_HCP_POWERGATE_ENABLE		REG_BIT(7)
> -#define   VD0_MFXVDENC_POWERGATE_ENABLE		REG_BIT(4)
> -#define   VD0_HCP_POWERGATE_ENABLE		REG_BIT(3)
> +#define POWERGATE_ENABLE			XE_REG(0xa210)
> +#define   VDN_HCP_POWERGATE_ENABLE(n)		REG_BIT(3 + 2 * (n))
> +#define   VDN_MFXVDENC_POWERGATE_ENABLE(n)	REG_BIT(4 + 2 * (n))
>  
>  #define CTC_MODE				XE_REG(0xa26c)
>  #define   CTC_SHIFT_PARAMETER_MASK		REG_GENMASK(2, 1)
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> index a4f6f0a96d05..4384f7e80258 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> @@ -202,7 +202,7 @@ void xe_gt_idle_disable_c6(struct xe_gt *gt)
>  	xe_device_assert_mem_access(gt_to_xe(gt));
>  	xe_force_wake_assert_held(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>  
> -	xe_mmio_write32(gt, PG_ENABLE, 0);
> +	xe_mmio_write32(gt, POWERGATE_ENABLE, 0);
>  	xe_mmio_write32(gt, RC_CONTROL, 0);
>  	xe_mmio_write32(gt, RC_STATE, 0);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 05db53c1448c..64bc595fc727 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -238,11 +238,11 @@ static const struct xe_rtp_entry_sr gt_was[] = {
>  	},
>  	{ XE_RTP_NAME("14020316580"),
>  	  XE_RTP_RULES(MEDIA_VERSION(1301)),
> -	  XE_RTP_ACTIONS(CLR(PG_ENABLE,
> -			     VD0_HCP_POWERGATE_ENABLE |
> -			     VD0_MFXVDENC_POWERGATE_ENABLE |
> -			     VD2_HCP_POWERGATE_ENABLE |
> -			     VD2_MFXVDENC_POWERGATE_ENABLE)),
> +	  XE_RTP_ACTIONS(CLR(POWERGATE_ENABLE,
> +			     VDN_HCP_POWERGATE_ENABLE(0) |
> +			     VDN_MFXVDENC_POWERGATE_ENABLE(0) |
> +			     VDN_HCP_POWERGATE_ENABLE(2) |
> +			     VDN_MFXVDENC_POWERGATE_ENABLE(2))),

For the patch itself everything looks good.
With the commit message improved:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

>  	},
>  	{ XE_RTP_NAME("14019449301"),
>  	  XE_RTP_RULES(MEDIA_VERSION(1301), ENGINE_CLASS(VIDEO_DECODE)),
> -- 
> 2.40.0
> 

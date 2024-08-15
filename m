Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4EF5C3DA7F
	for <intel-xe@archiver.kernel.org>; Thu, 15 Aug 2024 15:32:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AA5D10E471;
	Thu, 15 Aug 2024 15:32:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SfOf2+Eq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F2810E471
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Aug 2024 15:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723735978; x=1755271978;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LUGmbSWF9Ba+BoanvLV88I2hqWK+xwBNUJt+A2aLs38=;
 b=SfOf2+EqJKKGc3DFk9+dA+S555e82RyNypIiJ3MHii96MhHS2m1mFApt
 BDkasmOiVGAgIFzAQiWLdH2mjbgi/VQDBVGNTF5ag6JUBHXzH0XeLqYtH
 PF/btzMeDinRsFK2I5KbAQ7CrC5AgsCxm4JsvKVdM4LxIWALSdZD2yfFX
 2c5z9Qq4Nctsh7MJFEgNQ428EU0O5xi+8zOKzgA5X1QxGITaLi1592zlO
 ohhyjRBjwko9QpxUX84uo7KNzENvlaQu4CI+PofU0053dwLhKqZw3n79Q
 ixo5xjZCMMoNvthm2Gb193pt6Ig5U8tePUewqjAS4+02Ds9rlHd8johDy A==;
X-CSE-ConnectionGUID: NS4JJf/nTi68xI8+lUrXfw==
X-CSE-MsgGUID: a1ckp8zHR8GEcRs8Y8WMUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="22160815"
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="22160815"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 08:32:58 -0700
X-CSE-ConnectionGUID: NNWO3FPxQAC+KRDW8AMLQA==
X-CSE-MsgGUID: ngmdVsecQZWT0ee5P86V2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="59532234"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Aug 2024 08:32:57 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 08:32:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 08:32:56 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 15 Aug 2024 08:32:56 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 15 Aug 2024 08:32:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PtRztKFOC+S1Z+V2SzmAmu7oxn4mzP9HrobOG0FXUis33z/ZxGlz2PlAFrRNbTPLusemWH1mpnfL0Gp003zkLYwQmR2etFlB6pNCM6CgOeqR0hhHvOZ2bVYss0Pm0qh6CYgcoQCK905g9tj/LLRmbnLN9QK5seG68arR8kgsYDt2m0MN/goVC4FubbLhPL3W0Xib9H0i+NNxfxFzobsR8kK5gw4xRCUNFTc4fCWBT0ULqe/F66bvVd4zlJRlrMlA7W77GamV3iSI7Y2Cwr+50/UqJXhO95RouPQBMJShFouxpSX6jQAQlYQRxMgoWw6XyF+UmxvOUEOZmlnbtRItNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s1GC8QbvLyy9b8nthgUoSngHhDWt9ux7GCxWQ1nNiTI=;
 b=PSnxinhSh0NwpejtnNGCPsmQpZX3FEYbnV9bQK93FE8bzTXkOj/DKXGZz0tZ29F2gdbMeOix8MTHkqF87tMNIwgrm59///aknvp3EcSkGfOagtSnMZ6JAEdJ5Bk1MnRet3p1DtrlVQLUdu528GC/ZCEeFHLlJ4K90hwnrRyK6Cf2TP0ZW37JN3Fa8oq+zv/FZQTxSHEKYgwS9+51CFHDBVWPJ2l+l/wZmxPWYkoH030wkAajQFhf5mHkcQED4a5qgFL4PIeO6cqdhppYal2IIytCw2rMEK7gJQYrCc/oYbA18o1+6oMbxuWb0rfEhmazpkcUwcEX0X88IuDGA9Ghqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by MW3PR11MB4714.namprd11.prod.outlook.com (2603:10b6:303:5d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33; Thu, 15 Aug
 2024 15:32:54 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7828.023; Thu, 15 Aug 2024
 15:32:54 +0000
Date: Thu, 15 Aug 2024 11:32:50 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <michal.wajdeczko@intel.com>,
 <karthik.poosa@intel.com>, <lucas.demarchi@intel.com>
Subject: Re: [PATCH v7] drm/xe: remove GuC reload in D3Hot path
Message-ID: <Zr4foqJV28sXjJRH@intel.com>
References: <20240814105919.2408428-1-riana.tauro@intel.com>
 <Zr14g9D2jxQ2nKm5@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Zr14g9D2jxQ2nKm5@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: BY3PR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:a03:254::14) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|MW3PR11MB4714:EE_
X-MS-Office365-Filtering-Correlation-Id: 81e3c19e-9a8d-4330-6eb1-08dcbd3f87e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?T7oLOhDv74lJuziDB21WHtuJbU00FAsVXc9CXRDhRif75OlGTnWk1Ne6KcdW?=
 =?us-ascii?Q?5n3Dw69CZnVgSW7IEa/j5k54dT4S/vxLFhpZn/QSp/bGjErjJNqdd2liB1AM?=
 =?us-ascii?Q?L82Czh/nQCPyPC2RcIAi8W4l3yprAR2YjXI883jXKFcKFbx9/psHsEqacaZQ?=
 =?us-ascii?Q?6OSHE8EgRtxQw+qQIoNImBhLvF6RExntET52DsR3VfWw36903IRk4NmEWIg7?=
 =?us-ascii?Q?iCSXjrKYAChp11ZVmbVEOVEihpxA7gPO6Jlm8kz+Q7Ol1wjbxXohq2qW01Z9?=
 =?us-ascii?Q?F7OxynVUBcwg4vRtVePtA05Q4b41UiGm8QMOHqIOuw7iX1HYjLCKQSw4Uykb?=
 =?us-ascii?Q?UPySnRG5ce3HcnOn52brPnN3Ikxg/XtjNCkVLSUJiXEQ3bJBcawphGweKp3e?=
 =?us-ascii?Q?VMfZFdnHdw4GDJLkQ0SE1SbiBhm4HjOY3yO8AboWTPMeyrQYgCsVpoBVBaer?=
 =?us-ascii?Q?DcNyCpkCKOT8sUltS3pZIBVU7FlHz23Mg42D74mdThvLHgv+8x8d6hI19xwS?=
 =?us-ascii?Q?hCmM03E3w2U+jiy3iDeG5/2tNu87XLMCuq7K33jMBeclKuRO/ffJArey5aLy?=
 =?us-ascii?Q?iH33YmI4ETVoX9I6nF+20k2LCsOWzRMXdnyCsEkzc41OFWfQLkRNkpGx+9NA?=
 =?us-ascii?Q?cqBo8mBV9IMcci0dINeTrel/m2Um9pYViTmvEgavTXhIZkJmdFajB2XaVkrl?=
 =?us-ascii?Q?p389mE/W1d0K5As0YffbnQfNI9O0kVww9KoHZqylSX9MdkNYwZ4m0Vjlo3m2?=
 =?us-ascii?Q?Z5Rs8aP+jQQTV7cKNuAUjSZG8wcehLlN7gDK+BeEO+xYE9eQ8Q/ix1qrkqxz?=
 =?us-ascii?Q?MePmbopysjLR1PVUxDDIPyx8tLOfuBgjh2/fpqQ9czSn7A1+Ddgw2tlbHS9r?=
 =?us-ascii?Q?ULjZ7TiOk8DwnV36/2xlBatJDJFLmUKnSjuIhJIrvs9N9U3LQQivUwwkU3b8?=
 =?us-ascii?Q?ke86Fq1NLUniOvDGAI3Vvgs23YSKV5aftAbNO/IqpeV/l735LOeSySpnIhSU?=
 =?us-ascii?Q?MACRuTmgdnsucBrcl3VezoeJHROUbKkamE335jq/cr6rVGkWZJRJR8XYMS/3?=
 =?us-ascii?Q?rNy+jQJYqdlxsDXPBViSyx2K+0Ld4PbQgR7bXa19sPTAtZAXE5xO308+xjDL?=
 =?us-ascii?Q?mLn5ClU9KKI5I9LYMCShNBeW5/7jS1CaK9XiWhc9g+CSxJ13JMoQnxHNrG16?=
 =?us-ascii?Q?o5Fgo6WKtT+FgGHcecU9divQEL8F35t1ij3QE6luuGH5uvPB6fPVgHxurqG6?=
 =?us-ascii?Q?n2MamNYsvHDvv6uaN68CbqwyC+aQOkIVWMOROTDuD1Bonm9pRoLe2HkYQofs?=
 =?us-ascii?Q?GwErr9jmxWC/bMA1CvxFkY2yYj057dJ06/puNvzmfcss8g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TYPazBP0nW/WpFJEUy3wrDprc1kP0lHlSfHTz1uXfaYL0xWB3mMd+PHJLWVN?=
 =?us-ascii?Q?/SO8NRL7BHLCvbHdTHuVbqKBSXIMUGV1eOn9o7eTMtUNcjBZ/+7XsH4190TX?=
 =?us-ascii?Q?3jcx8E7qvDRJKqjCMoYVohtFEw9y4qKmB2upNZbQzwS8zuorrzCJCdr68JbJ?=
 =?us-ascii?Q?yZi4avuByHtw7x3AE2zzOccjkPVbA3Laa/FJb4RHByDM4A0pQqDIvjDzq7JT?=
 =?us-ascii?Q?2O8jgCKmi7avumbJwHx7/25Mbbz1ZfLVA1/NnqlXoSXWtKA3+2F/EA9CBNvl?=
 =?us-ascii?Q?0gvDzijqw44D2OXV8cfusujb/CxO7VPYiq9YzW/GlBUywUP3X61hgFfpuQ/z?=
 =?us-ascii?Q?rnEYsl5VfbXQaj5t9O8GbjEN7mq4HaGCawmipGNcXail/FuIvY/EEyg9ojbI?=
 =?us-ascii?Q?/57hEh4YTsh77Kf2gosRKia0r9jWa0BS67t52vIzIvyqc/qy0/KdiNHUeEYM?=
 =?us-ascii?Q?zdkRb+R8p3CArFIDZuzu2f8SIXS5LTJcaWenNZp+qVZsmhBCpSTJOZsrKw0M?=
 =?us-ascii?Q?WKoNN/lQY753ruGKT1QthIaD7DwK/T4iQTcD6Oe9wESF0sGY9DnokiQSWo7a?=
 =?us-ascii?Q?oDFiHSIZSjGlGtDZ0F2ujOqT1bvtqKd1tnuQS+IMFhot6R1eCiv54ZYE88WA?=
 =?us-ascii?Q?u2IAZwljm+odhWE6xIHZy0FVLxlEVYZWJwfR//rWVzlokS4Fv1P1y/aEeXzN?=
 =?us-ascii?Q?kKw2nAJsam2dcsbvyq0aFShjD4gVOBgC/DTSUQIXbnmETXq5KJriTgY2Fli/?=
 =?us-ascii?Q?maUjafOENQxSR09FCk6lCXeUN+w4p1RbaVNUmxuUpG8rirhAP2CfScawKl8C?=
 =?us-ascii?Q?Y3UPNeocNvbptFUC+s+FSDZyoOPjm4cu7KrPz3ENwtdLy3dgv2cDsZMKT+na?=
 =?us-ascii?Q?HwZfziQ3CKHYfij9CksjdmCUnvXS4MpOvXxoT4/NCa6CV/Sa872e+2B8ty2Y?=
 =?us-ascii?Q?uD+bxo+o+5ZAilkwRnyMtxFtEjXpL2eeJXunwLJv6YrzZ7VZOluJJ4A4HCce?=
 =?us-ascii?Q?XIJZDKaYKGEi2KFfs8C68B9x3ovBPqSSx1QeMFaT9sDrH7aUz5Hi3MX0noI3?=
 =?us-ascii?Q?Mw/8kuXzT5g2SjdV5ZEqAS4WrYH0dV6YlyjxpBPrOiAbobeRMkG20bkFqdlO?=
 =?us-ascii?Q?OsDPm+3YhKrTpmC5L+oGWcag3QCrLtk+ezFnHGzMXTuiIqAPAjTfNAaPb5NK?=
 =?us-ascii?Q?azVYqgFjFyZL7FiJpNqW0eHeNj9pb2lMk4tF+vW40l+DND4GyO1p9t3aFXDi?=
 =?us-ascii?Q?j3CghrhRzwkGVEv3x50FxD9KFU14xDtF7/af4IMF4xsoZ+YkuZLRaiqa8Gq7?=
 =?us-ascii?Q?niMDm2InBkmN7+lqsmLS459adZFn+IOnucgpjI77BI45hEYKOE8O7ZgonDwO?=
 =?us-ascii?Q?E2OAH1HEF66in4btGQ0ka1LV2n2sEDb4V4tW7cwEqQsViZY/+IpJpIqTpU9j?=
 =?us-ascii?Q?02VLAqHfnLclDmwftyhnfN9k+Nz3lFMoFFQjfjJyToNXYZfS/rih53kAlUtk?=
 =?us-ascii?Q?9yZrFdNx+fBwqI0XyGUEIXg/ldZBCj2j7axoYkwyI8iLQ58pwsa2791Ts3is?=
 =?us-ascii?Q?wQnS18eQr+lc+TYupO+ot1HVmoPPbdMF3EuBlxOd33/XEVZXOsgaE3qOEJaQ?=
 =?us-ascii?Q?pw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81e3c19e-9a8d-4330-6eb1-08dcbd3f87e2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 15:32:54.2996 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S/RgA6ARXiduZJemhuSJAYczDTPIhW4PFMWeSiT3Rs5IiR6BFYNmvuVgL75ODlPndx7Fsboop5GoGLudFcfUYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4714
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

On Thu, Aug 15, 2024 at 03:39:47AM +0000, Matthew Brost wrote:
> On Wed, Aug 14, 2024 at 04:29:19PM +0530, Riana Tauro wrote:
> > Currently GuC is reloaded for both runtime resume and system resume.
> > For D3hot <-> D0 transitions no power is lost during suspend so GuC reload
> > is not necessary.
> > 
> > Remove GuC reload from D3Hot path and only enable/disable CTB
> > communication.
> > 
> > v2: rebase
> > 
> > v3: fix commit message
> >     add kernel-doc for gt suspend and resume methods
> >     fix comment
> >     do not split register and enable calls of CT (Michal)
> > 
> > v4: fix commit message
> >     fix comment (Karthik)
> >     split patches
> >     correct kernel-doc (Rodrigo)
> > 
> > v5: do not expose internal function of CT layer (Michal)
> >     remove wait for outstanding g2h as it will be always zero,
> >     use assert instead (Matthew Brost)
> >     use runtime suspend and runtime resume pair for CT layer
> >     (Michal / Matthew Brost)
> > 
> > v6: use xe_gt_WARN_ON instead of xe_gt_assert (Michal)
> >     assert and queue handler if g2h head and tail are
> >     not equal (Matthew Brost)
> > 
> > v7: split functions into runtime suspend and resume (Lucas, Rodrigo)
> >     move enable irq code to ct runtime resume (Michal)
> > 
> 
> I know this has been a lot of revs, moving target, a bit conflicting
> feedback but IMO looks really good and ready to merge. The CI failures
> are a bit concerning though, can you hit retest button or send a rev8?
> Hard to tell if noise or genuine issues.

Looking to all the test results for all the reviews I'm honestly
concerned with this change. It looks to break exactly in tests
that exercise suspend and resume with some strange kernel warnings
right after it resumed...

> 
> Matt 
> 
> > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt.c     | 76 ++++++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_gt.h     |  2 +
> >  drivers/gpu/drm/xe/xe_guc.c    | 45 ++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_guc.h    |  2 +
> >  drivers/gpu/drm/xe/xe_guc_ct.c | 36 ++++++++++++++++
> >  drivers/gpu/drm/xe/xe_guc_ct.h |  3 ++
> >  drivers/gpu/drm/xe/xe_pm.c     |  9 ++--
> >  drivers/gpu/drm/xe/xe_uc.c     | 30 ++++++++++++++
> >  drivers/gpu/drm/xe/xe_uc.h     |  2 +
> >  9 files changed, 202 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index 58895ed22f6e..466908c91f44 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -831,6 +831,12 @@ void xe_gt_suspend_prepare(struct xe_gt *gt)
> >  	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> >  }
> >  
> > +/**
> > + * xe_gt_suspend - GT suspend helper
> > + * @gt: GT object
> > + *
> > + * Return: 0 on success, negative error code otherwise.
> > + */
> >  int xe_gt_suspend(struct xe_gt *gt)
> >  {
> >  	int err;
> > @@ -881,6 +887,12 @@ int xe_gt_sanitize_freq(struct xe_gt *gt)
> >  	return ret;
> >  }
> >  
> > +/**
> > + * xe_gt_resume - GT resume helper
> > + * @gt: GT object
> > + *
> > + * Return: 0 on success, negative error code otherwise.
> > + */
> >  int xe_gt_resume(struct xe_gt *gt)
> >  {
> >  	int err;
> > @@ -909,6 +921,70 @@ int xe_gt_resume(struct xe_gt *gt)
> >  	return err;
> >  }
> >  
> > +/**
> > + * xe_gt_runtime_suspend - GT runtime suspend helper
> > + * @gt: GT object
> > + *
> > + * Return: 0 on success, negative error code otherwise.
> > + */
> > +int xe_gt_runtime_suspend(struct xe_gt *gt)
> > +{
> > +	struct xe_device *xe = gt_to_xe(gt);
> > +	int ret = 0;
> > +
> > +	if (xe->d3cold.allowed)
> > +		return xe_gt_suspend(gt);
> > +
> > +	xe_gt_dbg(gt, "suspending\n");
> > +	xe_gt_sanitize(gt);
> > +
> > +	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> > +	if (ret)
> > +		goto err_force_wake;
> > +
> > +	ret = xe_uc_runtime_suspend(&gt->uc);
> > +
> > +err_force_wake:
> > +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> > +	if (ret)
> > +		xe_gt_err(gt, "runtime suspend failed (%pe)\n", ERR_PTR(ret));
> > +	else
> > +		xe_gt_dbg(gt, "suspended\n");
> > +
> > +	return ret;
> > +}
> > +
> > +/**
> > + * xe_gt_runtime_resume - GT runtime resume helper
> > + * @gt: GT object
> > + *
> > + * Return: 0 on success, negative error code otherwise.
> > + */
> > +int xe_gt_runtime_resume(struct xe_gt *gt)
> > +{
> > +	struct xe_device *xe = gt_to_xe(gt);
> > +	int ret = 0;
> > +
> > +	if (xe->d3cold.allowed)
> > +		return xe_gt_resume(gt);
> > +
> > +	xe_gt_dbg(gt, "resuming\n");
> > +	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> > +	if (ret)
> > +		goto err_force_wake;
> > +
> > +	ret = xe_uc_runtime_resume(&gt->uc);
> > +
> > +err_force_wake:
> > +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> > +	if (ret)
> > +		xe_gt_err(gt, "runtime resume failed (%pe)\n", ERR_PTR(ret));
> > +	else
> > +		xe_gt_dbg(gt, "resumed\n");
> > +
> > +	return ret;
> > +}
> > +
> >  struct xe_hw_engine *xe_gt_hw_engine(struct xe_gt *gt,
> >  				     enum xe_engine_class class,
> >  				     u16 instance, bool logical)
> > diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> > index 8b1a5027dcf2..402322ab8096 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.h
> > +++ b/drivers/gpu/drm/xe/xe_gt.h
> > @@ -55,6 +55,8 @@ void xe_gt_record_user_engines(struct xe_gt *gt);
> >  void xe_gt_suspend_prepare(struct xe_gt *gt);
> >  int xe_gt_suspend(struct xe_gt *gt);
> >  int xe_gt_resume(struct xe_gt *gt);
> > +int xe_gt_runtime_suspend(struct xe_gt *gt);
> > +int xe_gt_runtime_resume(struct xe_gt *gt);
> >  void xe_gt_reset_async(struct xe_gt *gt);
> >  void xe_gt_sanitize(struct xe_gt *gt);
> >  int xe_gt_sanitize_freq(struct xe_gt *gt);
> > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > index de0fe9e65746..bf365c6cea4d 100644
> > --- a/drivers/gpu/drm/xe/xe_guc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > @@ -1101,6 +1101,51 @@ void xe_guc_sanitize(struct xe_guc *guc)
> >  	guc->submission_state.enabled = false;
> >  }
> >  
> > +/**
> > + * xe_guc_runtime_suspend - GuC runtime suspend
> > + * @guc: GuC object
> > + *
> > + * Return: 0 on success, negative error code otherwise.
> > + */
> > +int xe_guc_runtime_suspend(struct xe_guc *guc)
> > +{
> > +	return xe_guc_ct_runtime_suspend(&guc->ct);
> > +}
> > +
> > +/**
> > + * xe_guc_runtime_resume - GuC runtime resume
> > + * @guc: GuC object
> > + *
> > + * This function enables interrupts and CTB communication
> > + *
> > + * Return: 0 on success, negative error code otherwise.
> > + */
> > +int xe_guc_runtime_resume(struct xe_guc *guc)
> > +{
> > +	struct xe_device *xe = guc_to_xe(guc);
> > +	int err;
> > +
> > +	/*
> > +	 * Power is not lost when in D3Hot state, hence it is not necessary
> > +	 * to reload GuC everytime. Only enable interrupts and
> > +	 * CTB communication during resume
> > +	 */
> > +	if (IS_SRIOV_VF(xe) && xe_device_has_memirq(xe)) {
> > +		struct xe_gt *gt = guc_to_gt(guc);
> > +		struct xe_tile *tile = gt_to_tile(gt);
> > +
> > +		err = xe_memirq_init_guc(&tile->sriov.vf.memirq, guc);
> > +		if (err)
> > +			return err;
> > +	} else {
> > +		guc_enable_irq(guc);
> > +	}
> > +
> > +	xe_guc_ct_runtime_resume(&guc->ct);
> > +
> > +	return 0;
> > +}
> > +
> >  int xe_guc_reset_prepare(struct xe_guc *guc)
> >  {
> >  	return xe_guc_submit_reset_prepare(guc);
> > diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> > index c3e6b51f7a09..cb062f8ad868 100644
> > --- a/drivers/gpu/drm/xe/xe_guc.h
> > +++ b/drivers/gpu/drm/xe/xe_guc.h
> > @@ -32,6 +32,8 @@ int xe_guc_upload(struct xe_guc *guc);
> >  int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
> >  int xe_guc_enable_communication(struct xe_guc *guc);
> >  int xe_guc_suspend(struct xe_guc *guc);
> > +int xe_guc_runtime_suspend(struct xe_guc *guc);
> > +int xe_guc_runtime_resume(struct xe_guc *guc);
> >  void xe_guc_notify(struct xe_guc *guc);
> >  int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr);
> >  int xe_guc_mmio_send(struct xe_guc *guc, const u32 *request, u32 len);
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > index beeeb120d1fc..41bdb9437634 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -419,6 +419,42 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
> >  	return err;
> >  }
> >  
> > +/**
> > + * xe_guc_ct_runtime_resume- GuC CT runtime resume
> > + * @ct: the &xe_guc_ct
> > + *
> > + * Mark GuC CT as enabled on runtime resume
> > + */
> > +void xe_guc_ct_runtime_resume(struct xe_guc_ct *ct)
> > +{
> > +	struct guc_ctb *g2h = &ct->ctbs.g2h;
> > +
> > +	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_ENABLED);
> > +
> > +	/* Assert if g2h head and tail are unequal and queue g2h handler */
> > +	if (xe_gt_WARN_ON(ct_to_gt(ct), desc_read(ct_to_xe(ct), g2h, tail) != g2h->info.head))
> > +		queue_work(ct->g2h_wq, &ct->g2h_worker);
> > +}
> > +
> > +/**
> > + * xe_guc_ct_runtime_suspend- GuC CT runtime suspend
> > + * @ct: the &xe_guc_ct
> > + *
> > + * Mark GuC CT as disabled on runtime suspend
> > + *
> > + * Return: 0 on success, negative error code otherwise
> > + */
> > +int xe_guc_ct_runtime_suspend(struct xe_guc_ct *ct)
> > +{
> > +	/* Assert if there are any outstanding g2h and abort suspend */
> > +	if (xe_gt_WARN_ON(ct_to_gt(ct), ct->g2h_outstanding))
> > +		return -EBUSY;
> > +
> > +	xe_guc_ct_disable(ct);
> > +
> > +	return 0;
> > +}
> > +
> >  static void stop_g2h_handler(struct xe_guc_ct *ct)
> >  {
> >  	cancel_work_sync(&ct->g2h_worker);
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> > index 190202fce2d0..0cf9d77feb35 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> > @@ -16,6 +16,9 @@ void xe_guc_ct_disable(struct xe_guc_ct *ct);
> >  void xe_guc_ct_stop(struct xe_guc_ct *ct);
> >  void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
> >  
> > +void xe_guc_ct_runtime_resume(struct xe_guc_ct *ct);
> > +int xe_guc_ct_runtime_suspend(struct xe_guc_ct *ct);
> > +
> >  struct xe_guc_ct_snapshot *
> >  xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct, bool atomic);
> >  void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
> > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > index 9f3c14fd9f33..0b8e984ffb5c 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.c
> > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > @@ -374,7 +374,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
> >  	}
> >  
> >  	for_each_gt(gt, xe, id) {
> > -		err = xe_gt_suspend(gt);
> > +		err = xe_gt_runtime_suspend(gt);
> >  		if (err)
> >  			goto out;
> >  	}
> > @@ -427,8 +427,11 @@ int xe_pm_runtime_resume(struct xe_device *xe)
> >  
> >  	xe_irq_resume(xe);
> >  
> > -	for_each_gt(gt, xe, id)
> > -		xe_gt_resume(gt);
> > +	for_each_gt(gt, xe, id) {
> > +		err = xe_gt_runtime_resume(gt);
> > +		if (err)
> > +			goto out;
> > +	}
> >  
> >  	if (xe->d3cold.allowed) {
> >  		xe_display_pm_resume(xe, true);
> > diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> > index 0d073a9987c2..7bbc8b3c556f 100644
> > --- a/drivers/gpu/drm/xe/xe_uc.c
> > +++ b/drivers/gpu/drm/xe/xe_uc.c
> > @@ -288,6 +288,36 @@ int xe_uc_suspend(struct xe_uc *uc)
> >  	return xe_guc_suspend(&uc->guc);
> >  }
> >  
> > +/**
> > + * xe_uc_runtime_suspend - uC runtime suspend
> > + * @uc: uC object
> > + *
> > + * Return: 0 on success, negative error code otherwise
> > + */
> > +int xe_uc_runtime_suspend(struct xe_uc *uc)
> > +{
> > +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
> > +		return 0;
> > +
> > +	return xe_guc_runtime_suspend(&uc->guc);
> > +}
> > +
> > +/**
> > + * xe_uc_runtime_resume - uC runtime resume
> > + * @uc: uC object
> > + *
> > + * Called while resuming from D3Hot
> > + *
> > + * Return: 0 on success, negative error code otherwise
> > + */
> > +int xe_uc_runtime_resume(struct xe_uc *uc)
> > +{
> > +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
> > +		return 0;
> > +
> > +	return xe_guc_runtime_resume(&uc->guc);
> > +}
> > +
> >  /**
> >   * xe_uc_remove() - Clean up the UC structures before driver removal
> >   * @uc: the UC object
> > diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
> > index 506517c11333..0beec5efde6b 100644
> > --- a/drivers/gpu/drm/xe/xe_uc.h
> > +++ b/drivers/gpu/drm/xe/xe_uc.h
> > @@ -15,6 +15,8 @@ int xe_uc_init_hw(struct xe_uc *uc);
> >  int xe_uc_fini_hw(struct xe_uc *uc);
> >  void xe_uc_gucrc_disable(struct xe_uc *uc);
> >  int xe_uc_reset_prepare(struct xe_uc *uc);
> > +int xe_uc_runtime_suspend(struct xe_uc *uc);
> > +int xe_uc_runtime_resume(struct xe_uc *uc);
> >  void xe_uc_stop_prepare(struct xe_uc *uc);
> >  void xe_uc_stop(struct xe_uc *uc);
> >  int xe_uc_start(struct xe_uc *uc);
> > -- 
> > 2.40.0
> > 

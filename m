Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89DCAD2126E
	for <intel-xe@archiver.kernel.org>; Thu, 17 Oct 2024 09:53:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 530F710E30F;
	Thu, 17 Oct 2024 09:53:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ViF2cRrL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5778310E30F
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Oct 2024 09:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729158801; x=1760694801;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gX69uDxDhmYsz2OUGH0d0AcEdz563IM5b4Vof47n12M=;
 b=ViF2cRrLymjwJoc7xNkWePO6WLVqjDJmQCxQjpHuf8HPFdA4NPFp33AE
 71nC1Ism0DiqRpS2wyyflgLNX2vlTeJLBwgEiYFgGTXCmDKw3IzDEj5na
 v5nMAWmn8iwqqTDYXxd/PblF/FtpphxhWa3yzaGrKlgjDdofb0Csy7zqc
 D5DUoyeHkDr85atVQ7p6NYaTk3qoYe+3yw49zo6OKUjlu6MScKcTsC+tM
 xpqFVApQrSxfnX1RhXjKfrXHz65oGrXpYUkuytVOR0OoF/FFK72HaS3Db
 Q2d2F8KL1gfnylukRycYFCedTKIQLEVMlF26BPppkkzU/dUccrqJgEJ3c A==;
X-CSE-ConnectionGUID: j59In4JXQf+oooZ8+ua5vw==
X-CSE-MsgGUID: Oxr7NhlTRAaTEiE1hAKlKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28734747"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28734747"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 02:53:14 -0700
X-CSE-ConnectionGUID: sz5CEP40Ry6INulFi9FmMQ==
X-CSE-MsgGUID: UjscSYOyQEGEbKPt/sTQFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; d="scan'208";a="78523896"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Oct 2024 02:53:12 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 02:53:11 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 02:53:10 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 17 Oct 2024 02:53:10 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 17 Oct 2024 02:53:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eh2FEl2TGGpel2q0TzzdFUeXZK3PXSosR6fNqW9hZzzEQwJSDTtg2N8AoVbXh+f0cpn0GVcRA+Wqhgci0nuscqPHd+6KFfyz8qi1DLWnQ7RFwxBsGIkkA2kDpWGSG8Yu/TEzYn/AMUU1ehrdbD5H+dNCs2JQAUreiB7Y92e12Fd5fjhdHxGYILPbmxrLYMSDhZH0HMRnUrlr+ly3ysnWl3/PKjsn/RYO5imZvcrrOKuBP6egZB3SAGjOg+Ra3CfivrJgf4R+XmbCKekBA5ncfSmfk15OFmzkEsq1ZoRNirEaUAtNdHOQG44Ujl/tdbFhSGgJ9aqIP0NHG+4/bCpPPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PfoPLQOs9OKIpeNtlGxNbj9LDgQVSCRhRabg0PrinI4=;
 b=wXeofNBPkgPsmoElB7KrLPGuJASd0eSZIttIm/71SxKtuXz9Zw/dJ8+NkepRm5tPNYrDeVhBsf+JkJT7iqvPmYMWpi7N64Lu1pEzAv9hNF2UuFpCXEn/9GnDadwOI7y5lBTRlh2PI17V8tSemQX46nehSDtWSZS9UtRRrCk5iShGxVoopVC33NYjcFOocPAgwiJDqga3NpJTVwPrNKpQZpb0ZDkDZqlUbK0XTubuBxnZxuVgynDLa2SynTZjkIJWNMDsdzcrKnAv88gmJgU4L7FZA4sgbsP3K/0ZoZ79ucK0zGQF4ntQLn7zSHV9d8iAsCNgmNz/r5F0j2vVIUyRoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by PH8PR11MB6562.namprd11.prod.outlook.com (2603:10b6:510:1c1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.17; Thu, 17 Oct
 2024 09:53:07 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1%5]) with mapi id 15.20.8069.016; Thu, 17 Oct 2024
 09:53:07 +0000
Date: Thu, 17 Oct 2024 15:24:13 +0530
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>, John Harrison
 <john.c.harrison@intel.com>, <intel-xe@lists.freedesktop.org>,
 <rodrigo.vivi@intel.com>, <matthew.auld@intel.com>
Subject: Re: [PATCH 2/3] drm/xe/guc/ct: Increase wait timeout for g2h response
Message-ID: <muhiyw3mtpq2dwbp5dcal3eu3hyadluzecxgpu7gvntfnfqrvm@uf63u73utvpr>
References: <20241009105645.1416588-1-badal.nilawar@intel.com>
 <20241009105645.1416588-3-badal.nilawar@intel.com>
 <8711d85f-6bf3-4e7f-8c71-5a838aae588f@intel.com>
 <Zwhd56R8t69f9hLi@DUT025-TGLU.fm.intel.com>
 <38aad4cb-e4e1-45e2-a8a1-e0f24fac51a3@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <38aad4cb-e4e1-45e2-a8a1-e0f24fac51a3@intel.com>
X-ClientProxiedBy: MAXPR01CA0113.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::31) To CY5PR11MB6211.namprd11.prod.outlook.com
 (2603:10b6:930:25::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6211:EE_|PH8PR11MB6562:EE_
X-MS-Office365-Filtering-Correlation-Id: fc91abfd-e5f3-4ad8-eed2-08dcee918085
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?W0nad5RcTJbrXGcLk195kLkyiAGDwV/m3i9RSzKG3RJ4RD7EjgoKPvaEfQxh?=
 =?us-ascii?Q?t2gAb6LAFFrFX6B2yLERnTZODaPkpgBNLUY74RQfBnzXsj8741q2jRBfuQmf?=
 =?us-ascii?Q?KuFoxAL2SD3LjT9PArkZ9xxohAx6zTtQHMUYKuewKxUv+BVcFK0RAze4zCmz?=
 =?us-ascii?Q?1kGpt05TrdoPBiZ2VdCz2Hx1kLMFiDv4lqDRTf+1ESZZHE9MadNE8G74X2A8?=
 =?us-ascii?Q?Zc7ziMa/IUnyN5ax1Esfh0ue5+ss8pdWy7pjVPcxLioyTuo/FPdma/oOA+Fy?=
 =?us-ascii?Q?K+PhfomeQMkIu6aH0dB90P7dYEOAHsgUnsaqwpXlDwUAyerMaaICgiXSuzfz?=
 =?us-ascii?Q?A58g8vjEFpqC4mI2KvpNpjgIVGxQHc+E2+W1sp1qIBVuNNc5+BSzoM2gu4HF?=
 =?us-ascii?Q?ONYnMAzrMszZiTRuNuls6wAqEo0oICUI+uU1BokE+d8bvuGun+JcQ98W3CI0?=
 =?us-ascii?Q?nf4J9aSDHMeuPy9Yh2u6hPMRk6/uckjyPpxuE/29lnqmWSTHvVHj2RbPTwpL?=
 =?us-ascii?Q?Z/MMNpq8E5s8AJW+/x5WAKmw8o/TnIRZiSaV7CgG//ZtQpvMkx6vQA+sA2IX?=
 =?us-ascii?Q?bDsFhFxuE8DsjHZj8pMaVb0zf/axkPmkOdcHrOGBz736V3wLRtQEyHgshe00?=
 =?us-ascii?Q?k/5n/AmiQ4/Htwlja7yDrJaFB8KEe28WMGVtVrqFZXKSbdFVBEy0wICM+lZ2?=
 =?us-ascii?Q?9siJjWO6+ySQwUKdMeIFvW69EBixceXDG3UdvIL2fCNex3lDeDRaQUu6howP?=
 =?us-ascii?Q?KCUJnhdPNkqDGA6Z80aWKRPkhIJ8iP9up7UyXeSbEzYXZ++EQ7u3YyhRtqXu?=
 =?us-ascii?Q?g/QNuqvJAisUherIMZOgSNjeCuyhefaZr62RxZxjAChtk7TldQ+R4Hr/5h6S?=
 =?us-ascii?Q?NXtMRfe126wMxdQYHBhy8eMFZDKJS54vlFxA8JKbtK5qzdJFSStJJQ7OS7Cn?=
 =?us-ascii?Q?HmMrD7L7tGxAKryZLk6kXYHE8AiV6vX/bvfPI3Q3CZaMjfip7CsOaFdSLVLo?=
 =?us-ascii?Q?bPHk0hb4Kl+FiEfOzWZkPs8vZK2Ar9PWUg29rdYI4D69LrnxhSRi3YcQgd8V?=
 =?us-ascii?Q?nKjs9JDoz6WlN32SKbxqXmnb9mL77Kill+4FRh8cQf79q3qA3QzlvQBgDF2i?=
 =?us-ascii?Q?FgOGllcJgxlNX2HqDf/RLFryo1CxIUlcghwrr/Qv/Vb9/I0036GMiLmNaSBO?=
 =?us-ascii?Q?xHJWPwQrGSlmzCUR4X6pfvK7USuKc0tV+H1KIPATMlnw/CZtI7/etQ/+2mAh?=
 =?us-ascii?Q?dnvoINXRKEukxTBxk7kcFgr/GsW4ko74uHuiQoNGpQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8RS+7oiclFte/pj+ugxJOzLYpbME6B6lTsf64zSRrsFReRzFlc3lhTOlClhD?=
 =?us-ascii?Q?s6hlBiA+ateydO+6zDc267dxPAgne5VJMgrTUOff9p7EwwjvEw5SNpeHb3F8?=
 =?us-ascii?Q?qdwMFt8xfB12oETt1ip0Hv5+nYRsl9KU/lkptibotUgiA0GjBmYWDP1nRyqC?=
 =?us-ascii?Q?d7ZaKddh9FYfQRmntAoQbca/ikx2RbTAKNZ+V7HUl9HID25UuyFCblNUDWmu?=
 =?us-ascii?Q?+iNfi2juGPp4suAy5amSmYeKzd7YLAoav0EI9dor1CUe+47N/vkmXpGNl3hT?=
 =?us-ascii?Q?bCEc5fWsN5f3iFOiSgsglshdA/4uYYFL/86wmmgGiy2VEZVLxi0sqsas0z8k?=
 =?us-ascii?Q?POhND7x/eB+iYYHcKpV/Gy4TiWYB2FnOvjtljWgz3/JD2pzwTo6lMBXKpWxX?=
 =?us-ascii?Q?Iq/NGIMJ1vYucv4qqPwqvK8TJkQij/wJgz4kTFOpl8q0GXGnO4qTsFzoW2w/?=
 =?us-ascii?Q?vKqtYKfldOVqRHTKUxLr6iXAI1TdRcTNOAyu772TmMRmoMvXH6lXUimfaaQW?=
 =?us-ascii?Q?j46S2OmZI5AYNtxqnd5POGmtTYZiJBaEgrbx5PPth4bQeJ0q4X+hxuAo80kS?=
 =?us-ascii?Q?VntZQvVa/zsPwyysIHk0Cf5BQ1N6UNKCoMQIX7ZKF2YfqTGIqv1vCUmdNy5I?=
 =?us-ascii?Q?7dx92ZGOivbZvhKJPacxIuG0ycEob7EiDqhriZUWRaJM3BjMXBUbrcqcFa6r?=
 =?us-ascii?Q?9dh4+RCsOU/VsZuZ3CkHJkAPKfX0daBXdmwCrS27acvtsM/CmGPmnvr055LC?=
 =?us-ascii?Q?qLMST8uy980OwYp+MZTbKZTEO7GHWHhIUwj7+6Vk3oAvthQUDlmxhwuAlvLN?=
 =?us-ascii?Q?PGIkddJWp6AgE67pNDPK8mzVupZfUuXdo+OiFXbJSSURqyFXF4TQPS85iv78?=
 =?us-ascii?Q?AvTDH1HlWkqf7DUrtEECjRUAR5ljLRi7KWaPE0jhLKW/Feu8U26qx8Q1bUNM?=
 =?us-ascii?Q?XHKVcrepvielWiQTMYmPCkmOfX2RBXsccX8poaJfaQ+QyGJRs069rLCWP2iy?=
 =?us-ascii?Q?Io26srebv4DjvjRLuHe/IAT1vb7ex8nSBTubMx8cFlEbR9COIwUmeJrJ8zcg?=
 =?us-ascii?Q?9SN75n3vFKLIiQ2MMZ61+uP+XbEGwDKbJxakxIaLnoDJo+lP0h63wAvhnQDo?=
 =?us-ascii?Q?ErNmZO8fHSZpccBDT6qcyS8VqCMS4Qx24Le0CNGsMZwRs/HPMWhRdRTgO8tO?=
 =?us-ascii?Q?81HZ+AP7Bg+T4cSUYR7hj52AZwsiLIm3duLD16QwDrzQsZXnxU57EhgDUPdt?=
 =?us-ascii?Q?D5pTFwBr2n5Fj+KTDSWQaR4tQEMDgkTlPBOU7AEvlPNoyDTmNDRdC32G60M+?=
 =?us-ascii?Q?tFcmQyqhPwoGzyR4Dy7YsFHJFHg2g7cS+/Q70WMj7DhEgkTyvqMAX/P87gi6?=
 =?us-ascii?Q?TbPdAvnHkP5RWGeVtRMTI8YK1e78HqU/vmkVHGCgoYzwfKdyve5hBz6fmW5L?=
 =?us-ascii?Q?goVm4E4jqXHZpCe9A9iy4/hdEhXqn+YGMZUiX0xJj/g7Wlkpn3NP7ZHeCdOj?=
 =?us-ascii?Q?mPc7zmUkYZ12g4VUuCzypLE9vA42JsTOskQqbjlrdNO5bp4A+/z2YruqOJnm?=
 =?us-ascii?Q?N7VDa6GlkEoEFEYYOafLbWf5unsu1heOPsMyKmQ2tCqjhDyXr5Ley7W62b24?=
 =?us-ascii?Q?BA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fc91abfd-e5f3-4ad8-eed2-08dcee918085
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 09:53:07.4675 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LmXAKYYKuq5I6LcFtOGWMXiAc/cuu9oGfJSsbYCpaETd1sAtUD91AXBMeyPP1tP25soxRLJKCnxDe0b3P/GCrvR+LMH+GKDwOF0al4hwPCk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6562
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

On 2024-10-14 at 17:42:29 +0530, Nilawar, Badal wrote:
> Hi Matt, John,
> 
> Thanks for review comments.
> 
> On 11-10-2024 04:36, Matthew Brost wrote:
> > On Wed, Oct 09, 2024 at 12:43:36PM -0700, John Harrison wrote:
> > > On 10/9/2024 03:56, Badal Nilawar wrote:
> > > > Occasionally, the G2H worker starts running after a delay of more than
> > > > a second even after being queued and activated by the Linux workqueue
> > > > subsystem.
> > > > To prevent G2H timeout errors, the wait timeout is being increased.
> > > > 
> > > > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
> > > > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2902
> > > > Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > > Cc: John Harrison <John.C.Harrison@Intel.com>
> > > > ---
> > > >    drivers/gpu/drm/xe/xe_guc_ct.c | 2 +-
> > > >    1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > > index b93b2821e4e8..dcc95c01b6f0 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > > @@ -1019,7 +1019,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
> > > >    		return ret;
> > > >    	}
> > > > -	ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ);
> > > > +	ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ * 3);
> > > Is this change intended to be temporary until the fundamental scheduling
> > > issue with the workqueue is fixed? If so, there should be a TODO comment to
> > > that effect so that we remember to shrink the timeout back down again later.
> > > Three seconds seems like a long time to wait.
> > > 
> > 
> > I fine with this W/A until we root cause the work queue scheduling issue
> > but agree this needs a comment explaining why this large timeout is
> > needed (work queue scheduling issue), how to trigger the larger timeout
> > (tests which can trigger this), and saying once we root cause issue
> > reduce the timeout.
The root cause of this issue is lies with scheduling latency of lnl hybrid cpu.
This is beyond XeKMD, and issue is disappears if we disables lnl atom cpus from BIOS.
Agree to add a TODO comment here to remove this WA, once lnl hybrid cpu fixes this 
workqueue scheduling issue. 
But why do we need to explain the tests and reproduction in the code comment ?
if needed that can be added in cover letter.

Thanks,
Anshuman

> 
> Sure, I will add the comment here and in patch 3 to explain why this is
> needed and change need to be reverted once this is fixed.
> 
> Regards,
> Badal
> 
> > 
> > Matt
> > 
> > > John.
> > > 
> > > >    	/*
> > > >    	 * It is possible that the g2h request may be cancelled while waiting for a response due
> > > 
> 

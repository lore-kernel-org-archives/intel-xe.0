Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01552CAC5B8
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 19:09:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B11FF10E0AE;
	Fri, 26 Sep 2025 19:09:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mMz8r77N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 356A610E0AE
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Sep 2025 19:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758913776; x=1790449776;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=E7FoCxIcABceT4i64lZQqWTOw/8BJGVBtEDuLf7Ab88=;
 b=mMz8r77Ngea4hXobBe28uSZ2LkiTiWKKECWK+Wi+fsqn5hmK1zfmjXy9
 Aqcv4jkAoP0edqUEWKWmUBskfX1DeiW3EXaZP/7BGCpXDo9pbl5oh7kt4
 NEZtkAN/1ebpmLZw2u3vJ5lqNhLH3ilWKlyKLvDPkEc+GQ7tdgNdFc3AU
 h2BIvKsl0rPRcxRHL2yTUcsdpAImr1Vgib2scF2Etg5adhRm7152uBicx
 rE+0wPtMQD03w0NnQmw1W+vU8hTzRJ6exogSQFpFHNEYFxUgji/IWELnd
 hNPpqZKY4lI3LKednSI0zMJboLe4y+nApFPUcY+6m3eUSK0TU5FBrxapl w==;
X-CSE-ConnectionGUID: UZ11X//BS1WkIhVxnAoPcA==
X-CSE-MsgGUID: TmquC11ySzObBzBQtIldJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="78895134"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="78895134"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 12:09:36 -0700
X-CSE-ConnectionGUID: tDLm+w+EQYq1C5oZAQdSHA==
X-CSE-MsgGUID: 8LVbku0YQu24yuCrxx9GeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="177626472"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 12:09:36 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 12:09:35 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 26 Sep 2025 12:09:35 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.45) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 12:09:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DqTgwzm/xDuYZ4Iq2SNZrCgS4JuCrJpEGWGQY21cxZvRFovOopNKj5CDp/p68VOT+vKfiykLUPc+4xVMqZL1r1abldhCzBqSCktItOOFjA6Bf5fHxRNYhcvkN1qsM08JUbBhRmB2hTSGld2Yr6zvWIWcQSVgNnHX57gtGAK0TaojwT6JhQld3avDQKALgmx8s6weU/hxbIrl0acH4cf/szuPCONxfBd2yyUSuvHy03uE7EAF36lurFBb387JIDHQ0QMcahlci51lDr+1KnaMhHnRroZZJ2UMClwoGRURqtuIzguJDHfc0ZTQoShy9tTjI1GQe3B9b8LjDUWhVHH2YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KeCQhkGQUaWvzsl/OMuk6bRSBFcMRwMmXBGh0Iei5c0=;
 b=nIFBBrcvvVZ3NE+l3x3m9/yWffENfBViyoPA5rrDVYgygvzu2fudBjqZRk9K1fi0fbZnR+CxUBFg+k9cQwaS3N457T8p4depCZswhkotCaRBosM6+ArrbgMVB0GILPpegx2IEXetBaDuKVbob4G2DprgbVrBIm5gb/JNMBGnNa6S4R1JXK9/eb9z8G93QWhOKNU+v5DUh+afGbz3AvKYr9DwD5dfem+CtRG82WHDoPF7unzjWhZU10okKqZPyU4el/HZxJBbSfsaY5qc1aYLJWKxRG1rC9uED62ib5wQ7VJyOCgTTrsKc1+xeIv+wRDXlYwnBtc5nDtdFZrGpgaY2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB8471.namprd11.prod.outlook.com (2603:10b6:a03:578::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Fri, 26 Sep
 2025 19:09:33 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9137.018; Fri, 26 Sep 2025
 19:09:33 +0000
Date: Fri, 26 Sep 2025 12:09:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Lis, Tomasz" <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 15/34] drm/xe/vf: Close multi-GT GGTT shift race
Message-ID: <aNbk6qny9pi5R019@lstrano-desk.jf.intel.com>
References: <20250924011601.888293-1-matthew.brost@intel.com>
 <20250924011601.888293-16-matthew.brost@intel.com>
 <35a54c4b-b824-41c4-b9e2-b57a6aa1280d@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <35a54c4b-b824-41c4-b9e2-b57a6aa1280d@intel.com>
X-ClientProxiedBy: MW4PR03CA0116.namprd03.prod.outlook.com
 (2603:10b6:303:b7::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB8471:EE_
X-MS-Office365-Filtering-Correlation-Id: a8827362-3731-4433-7800-08ddfd3039f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OO4gjfqt3AFWyaEqZbQI0YiOekyM/TOVpzLQpjj1hAMY1+n1EPfP8rj4wJzM?=
 =?us-ascii?Q?nT5tnIs4t2LgLi09sWth1bsbLCbNCxGqmzEb2SYxH0mM/OEz19+NVBdhkX77?=
 =?us-ascii?Q?GwMWl9F2RcMtsWoXLgcu3TM0s4vYdaLktRVRo5+exXr/atjSnvFCG4ENWAr1?=
 =?us-ascii?Q?tq6iaZL8QxVtmdK0DkEMoOIAx0e1HP/M5LzctbHGqqpQW+XaLMhVBN4hqwUD?=
 =?us-ascii?Q?5U8cZjEot3g1hDvg2onI4J2dZRpsPKW0RfYNqPfDHh+ITnb0Mo5HSOrOsIZz?=
 =?us-ascii?Q?Mdnofi9uDWYhxHz7LCreDNpDO3pCiHvykIjkGu35oq++YQCLuQRHBXSNBlaD?=
 =?us-ascii?Q?GBCnC1AUd8wsqzXg6ErytMqYRxb38aMBh2Wiloa3piKof8i1I8iQDpEtLnuT?=
 =?us-ascii?Q?a5ybv57S1W20re2l5Bg2FeLJV54ZvjYNTSZgOnBdsjMwJVQEblI8Hnja9UdM?=
 =?us-ascii?Q?UHWXAYN6NG1iszEZH8Vt5Mljxrt7GreSc5660Fz6G4NjC4LT7SdV9GvkuaVN?=
 =?us-ascii?Q?aJj1QyIq6i0wxm/XpRWTeW7YUiraP0TiI4hzjms1SPHMLbx2uaieax5zOtmd?=
 =?us-ascii?Q?6h7ii8YKpj2Z7OpzLrLybQst4nLjJSbuAZmSX4yJmUYEE+w8+iZU812ffWBh?=
 =?us-ascii?Q?H+McZlV+BomSwK7a3wI/UPInuMT+A/C1mUKWjIT8jqGAKBS4t5/iyBhFCo7q?=
 =?us-ascii?Q?KpB2ghoGiSildgeHXFjMHX1vRIwtenqrBJzbkiE2lsOy0ZK7LRUBh70afBe9?=
 =?us-ascii?Q?D7g2zldEyb31LFPF+USOfhpKMS1ntQfPrjt2XUwyJ9GDs1dJMvydM0KBALdg?=
 =?us-ascii?Q?d3u+8J95bRcVju5MA1CwRC9TxzyfrlSJEJh/dOP0TffKo2+B5HdRZIc+SwV1?=
 =?us-ascii?Q?WPxlOoYJUS3/iR4NMoPEEBpV4GAdsuUS7NZSd6ittjy53qG3ySsrtXxH8S2f?=
 =?us-ascii?Q?buASO7XZEIxtOBxbkMOcWlwO6kf3LDAc5vkpWLBx1h4IAjqsHGafhatMxjxz?=
 =?us-ascii?Q?ZxwNIb9iaLbXo1R273w4btWUraF1pSDNSJ6ja0z3MTIxnsqZ7+Z9t4rsq+1y?=
 =?us-ascii?Q?iAHbUMJzZql9RF8ayZ0vwc70nfmBNuXZCjYxGG+AUmkLn2LqmNfl+HvzmPXN?=
 =?us-ascii?Q?E4thhYHLHu4Gwla4zJ6miYp+CQpOEmgN20ggxa0QVOBm/wYXALQXV8vimDq6?=
 =?us-ascii?Q?+FhAp+tItZX2hZKGl5Ic2onuOSgbZn3jVF+UkuL6+TLPaL3szY6JoayjAK/S?=
 =?us-ascii?Q?jGs3PiNjeHRkKkHrNUVNsyR3Vclwx0BCdzO5JECPpDiv2l55tUzeMaUd16UX?=
 =?us-ascii?Q?JKFrxd4T0eDcNv8V6Ek4R/XjDpXl65qmmzkBaGj0z2pz63sgtS0MV6GAE6SU?=
 =?us-ascii?Q?Rl0wuCWW//nbrczXtZkarFQxStl4jgu6B9Tsrc09IsintrqfSA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jLkV5D1iir72unLNGH9xoEohixr1/B//EaZt6j/DJLr5y40F7PSJGwd5BSy0?=
 =?us-ascii?Q?kDGvXgfuuDK9wSSwGXlxCv++9LDP2cx53vPJvNiqBMGaMCGoE//HOw9QJX0T?=
 =?us-ascii?Q?LuFpsB6BEPN2iR/NgVBYh/B3c4wbOgCFR3vhdbRs8UPD0z/PtVRsDbMwXYso?=
 =?us-ascii?Q?CukjGVbF+4SrJK5ZaesG3x/MxbrDpMYdBA1N90by9aNVFeprXjItzUkAN31J?=
 =?us-ascii?Q?CxguGhMX0s0LN7TaQRMLAEkKDuJUrIygghW8kpx6dHb/Xi7BUGlFGTjZ/w04?=
 =?us-ascii?Q?A1olqHLpRHYPrut8mtIhs95R5+U46G80rWfTuzB5xih+vwERe/EV8IeA9Upu?=
 =?us-ascii?Q?8De04GibaamucsPZ6ahe+/KTzlDnp5/eBtk7z/D4qWarkl8K9s5bJNGKBmuY?=
 =?us-ascii?Q?9l/W8NIVHV1ePpYQYuoRIEQzKGmjGtfw4W3r8FcxWMfTGoFnE1rCAI4hoH2f?=
 =?us-ascii?Q?vVcoYLdexbGup/atD6Bi1ECPbktFC5Fwg8hS7/LKJUiL8YTAzRN1L9Jm9nmc?=
 =?us-ascii?Q?ATRVHo3D2NbV3Hy5z8hS2bZJOyKnMXwbn6e2tpXYWe7Su3qBiTHPk2q2tqgt?=
 =?us-ascii?Q?XboxibPa5E8cDT1KwMwmwMgveyIg1hTVcVt7KoQjfD0wOUm0errzugmnT73r?=
 =?us-ascii?Q?XmlRrr20p1cqYI+2cGbqOPIYhENGm/Aj7FSHb6JSkeOQe6ZLI38jFRfb0T05?=
 =?us-ascii?Q?/ltxy5SoC5qXfyVwLlP3/zGmLGJwgyaQAOncEpffrircYFNrmk1whdyf1Y6L?=
 =?us-ascii?Q?cpkuwCSpvunQCLaDHzOfLs8XJDCknN3S/pvOe9/RiQ2c4/hgFtUlM5MzYBaS?=
 =?us-ascii?Q?iEs0zQkJ63lXKTgXYgxJ3HXtQ/VCloEokp0i0Qhwq6YbbU+BRhu0r8U/1/El?=
 =?us-ascii?Q?yDYE8Xsqp8RS7yan+Y3i3srIwRpTNQywjBUtgW1jjCNaOuch1yFYP55x+yad?=
 =?us-ascii?Q?35CO9s/aFEf6eKC1Dedo9cKIK9pswQ+ayLXDIvVz906qbJ6AGNGy61HqRZca?=
 =?us-ascii?Q?W6UIKewNjGJFbHQiS4jeYGB27GfJBXEqjo5odyoiJwYObE5F1tDcREmigz/i?=
 =?us-ascii?Q?9a5tBaRBFZ2HEtlrNP0sv6lQ1HY9fbwsZTOwyba6I1CIxmTX0Z5q3bqb6Umy?=
 =?us-ascii?Q?DQvfhd8QTp0OUXL8ftlYbrM0e0K5TRMCzM9u53RtlsRkmyYiKagxtPFDfXD8?=
 =?us-ascii?Q?56llkA8hz1dZiWETv3X9BzKrlQPCXZgBa1CTqYw79zm8vmAKaQe/uGqVakAn?=
 =?us-ascii?Q?j0aFqIJ41Om+oCUo//p4Tr9NtEe1aejghM1PlFUcAFYooG9g8yTlF7ek5Oos?=
 =?us-ascii?Q?32S/t2lk5Py6bXNM5QDfHyQimpsXUZfckS1H/K5Z5BHXvNBLzmgrIjpfaLBn?=
 =?us-ascii?Q?YlBJeslVmX1KngMcsBQJ9er88zm0wVLV4DaDulAgFppgJbTBhybvXVLr/koL?=
 =?us-ascii?Q?psnHN3HKz8u2hkRuomGPwMkk3yX1bQ1lszfC9p5uBsfFkAU/mflE//S2LlrU?=
 =?us-ascii?Q?hTx1S4qwQXCGBGozUopBcYfWoTWdzq0rX1Nhns4EcssfIKLJKaIkABKtTlkj?=
 =?us-ascii?Q?KuPHzQqg/xaO7h4utXrjR99UaM6UDyInqHkKDZUBpFlkNVCZhHbXToIW9AqK?=
 =?us-ascii?Q?Dw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a8827362-3731-4433-7800-08ddfd3039f2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 19:09:33.0502 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3wsR+BnFpeN6ogA6gZ4zlnKtTGMkxwYTLgfHansNLaXs5net1pLNlDRHPmEgjfoK5GU3WPpnRDbzv1rNG+QTmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8471
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

On Fri, Sep 26, 2025 at 04:33:36AM +0200, Lis, Tomasz wrote:
> 
> On 9/24/2025 3:15 AM, Matthew Brost wrote:
> > As multi-GT VF post-migration recovery can run in parallel on different
> > workqueues,  but both GTs point to the same GGTT, only one GT needs to
> > shift the GGTT. However,  both GTs need to know when this step has
> > completed. To coordinate this, share the VF  config lock among all GTs
> > that share a GGTT, and perform the GGTT shift under this lock.
> 
> The description does not mention removal of ggtt_shift variable; this
> removal is not related to the locking change, so should be separately
> mentioned.
> 

The shift doesn't really need to be stored when shift is done under
config lock, rather just calculated there. I mention something like this
in the commit message.

> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 95 +++++++++--------------
> >   drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  3 +-
> >   drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h | 11 ++-
> >   drivers/gpu/drm/xe/xe_guc.c               |  2 +-
> >   drivers/gpu/drm/xe/xe_tile_sriov_vf.c     |  6 +-
> >   drivers/gpu/drm/xe/xe_tile_sriov_vf.h     |  1 -
> >   6 files changed, 51 insertions(+), 67 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > index 8304c26c076e..807fdced0228 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > @@ -436,16 +436,19 @@ u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt)
> >   	return value;
> >   }
> > -static int vf_get_ggtt_info(struct xe_gt *gt)
> > +static int vf_get_ggtt_info(struct xe_gt *gt, bool recovery)
> >   {
> >   	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> > +	struct xe_gt_sriov_vf_selfconfig *primary_config =
> > +		&gt_to_tile(gt)->primary_gt->sriov.vf.self_config;
> >   	struct xe_guc *guc = &gt->uc.guc;
> >   	u64 start, size;
> > +	s64 shift;
> >   	int err;
> >   	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> > -	down_write(&config->lock);
> > +	down_write(config->lock);
> >   	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_START_KEY, &start);
> >   	if (unlikely(err))
> > @@ -465,13 +468,17 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
> >   	xe_gt_sriov_dbg_verbose(gt, "GGTT %#llx-%#llx = %lluK\n",
> >   				start, start + size - 1, size / SZ_1K);
> > -	config->ggtt_shift = start - (s64)config->ggtt_base;
> > +	shift = start - (s64)primary_config->ggtt_base;
> >   	config->ggtt_base = start;
> >   	config->ggtt_size = size;
> > +	if (recovery)
> > +		primary_config->ggtt_base = start;
> >   	err = config->ggtt_size ? 0 : -ENODATA;
> > +	if (!err && shift && recovery)
> > +		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);
> >   out:
> > -	up_write(&config->lock);
> > +	up_write(config->lock);
> >   	return err;
> >   }
> > @@ -485,7 +492,7 @@ static int vf_get_lmem_info(struct xe_gt *gt)
> >   	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> > -	down_write(&config->lock);
> > +	down_write(config->lock);
> >   	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_LMEM_SIZE_KEY, &size);
> >   	if (unlikely(err))
> > @@ -505,7 +512,7 @@ static int vf_get_lmem_info(struct xe_gt *gt)
> >   	err = config->lmem_size ? 0 : -ENODATA;
> >   out:
> > -	up_write(&config->lock);
> > +	up_write(config->lock);
> >   	return err;
> >   }
> > @@ -518,7 +525,7 @@ static int vf_get_submission_cfg(struct xe_gt *gt)
> >   	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> > -	down_write(&config->lock);
> > +	down_write(config->lock);
> >   	err = guc_action_query_single_klv32(guc, GUC_KLV_VF_CFG_NUM_CONTEXTS_KEY, &num_ctxs);
> >   	if (unlikely(err))
> > @@ -549,7 +556,7 @@ static int vf_get_submission_cfg(struct xe_gt *gt)
> >   	err = config->num_ctxs ? 0 : -ENODATA;
> >   out:
> > -	up_write(&config->lock);
> > +	up_write(config->lock);
> >   	return err;
> >   }
> > @@ -564,17 +571,18 @@ static void vf_cache_gmdid(struct xe_gt *gt)
> >   /**
> >    * xe_gt_sriov_vf_query_config - Query SR-IOV config data over MMIO.
> >    * @gt: the &xe_gt
> > + * @recovery: VF post migration recovery path
> >    *
> >    * This function is for VF use only.
> >    *
> >    * Return: 0 on success or a negative error code on failure.
> >    */
> > -int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
> > +int xe_gt_sriov_vf_query_config(struct xe_gt *gt, bool recovery)
> >   {
> >   	struct xe_device *xe = gt_to_xe(gt);
> >   	int err;
> > -	err = vf_get_ggtt_info(gt);
> > +	err = vf_get_ggtt_info(gt, recovery);
> >   	if (unlikely(err))
> >   		return err;
> > @@ -610,10 +618,10 @@ u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt)
> >   	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> >   	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
> > -	down_read(&config->lock);
> > +	down_read(config->lock);
> >   	xe_gt_assert(gt, config->num_ctxs);
> >   	val = config->num_ctxs;
> > -	up_read(&config->lock);
> > +	up_read(config->lock);
> >   	return val;
> >   }
> > @@ -634,10 +642,10 @@ u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt)
> >   	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> >   	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
> > -	down_read(&config->lock);
> > +	down_read(config->lock);
> >   	xe_gt_assert(gt, config->lmem_size);
> >   	val = config->lmem_size;
> > -	up_read(&config->lock);
> > +	up_read(config->lock);
> >   	return val;
> >   }
> > @@ -656,11 +664,9 @@ u64 xe_gt_sriov_vf_ggtt(struct xe_gt *gt)
> >   	u64 val;
> >   	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> > -	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
> > +	lockdep_assert_held(config->lock);
> > -	down_read(&config->lock);
> >   	val = config->ggtt_size;
> > -	up_read(&config->lock);
> >   	return val;
> >   }
> > @@ -680,34 +686,10 @@ u64 xe_gt_sriov_vf_ggtt_base(struct xe_gt *gt)
> >   	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> >   	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
> > -
> > -	down_read(&config->lock);
> >   	xe_gt_assert(gt, config->ggtt_size);
> > -	val = config->ggtt_base;
> > -	up_read(&config->lock);
> > -
> > -	return val;
> > -}
> > +	lockdep_assert_held(config->lock);
> > -/**
> > - * xe_gt_sriov_vf_ggtt_shift - Return shift in GGTT range due to VF migration
> > - * @gt: the &xe_gt struct instance
> > - *
> > - * This function is for VF use only.
> > - *
> > - * Return: The shift value; could be negative
> > - */
> > -s64 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt)
> > -{
> > -	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> > -	s64 val;
> > -
> > -	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> > -	xe_gt_assert(gt, xe_gt_is_main_type(gt));
> > -
> > -	down_read(&config->lock);
> > -	val = config->ggtt_shift;
> > -	up_read(&config->lock);
> > +	val = config->ggtt_base;
> >   	return val;
> >   }
> > @@ -1115,7 +1097,7 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p)
> >   	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> > -	down_read(&config->lock);
> > +	down_read(config->lock);
> >   	drm_printf(p, "GGTT range:\t%#llx-%#llx\n",
> >   		   config->ggtt_base,
> >   		   config->ggtt_base + config->ggtt_size - 1);
> > @@ -1123,8 +1105,6 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p)
> >   	string_get_size(config->ggtt_size, 1, STRING_UNITS_2, buf, sizeof(buf));
> >   	drm_printf(p, "GGTT size:\t%llu (%s)\n", config->ggtt_size, buf);
> > -	drm_printf(p, "GGTT shift on last restore:\t%lld\n", config->ggtt_shift);
> > -
> 
> Right.. so by that we're losing a useful debug value.
> 
> I'm not very attached to it as I did not originated the idea to have it
> there.
> 
> IMO the GGTT config is printed to dmesg and that's enough, shift can be
> computed from that.
> 

I added this message [1] so when shift the occurs we can see it
happening and also see which GT won the shift race. I've manually
verified on BMG either GT can safely win this race.

Matt

[1] https://patchwork.freedesktop.org/patch/676386/?series=154627&rev=2

> 
> For the main change - the lock and the multi-GT support - looks good, no
> issues.
> 
> -Tomasz
> 
> >   	if (IS_DGFX(xe) && xe_gt_is_main_type(gt)) {
> >   		string_get_size(config->lmem_size, 1, STRING_UNITS_2, buf, sizeof(buf));
> >   		drm_printf(p, "LMEM size:\t%llu (%s)\n", config->lmem_size, buf);
> > @@ -1132,7 +1112,7 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p)
> >   	drm_printf(p, "GuC contexts:\t%u\n", config->num_ctxs);
> >   	drm_printf(p, "GuC doorbells:\t%u\n", config->num_dbs);
> > -	up_read(&config->lock);
> > +	up_read(config->lock);
> >   }
> >   /**
> > @@ -1215,21 +1195,16 @@ static size_t post_migration_scratch_size(struct xe_device *xe)
> >   static int vf_post_migration_fixups(struct xe_gt *gt)
> >   {
> >   	void *buf = gt->sriov.vf.migration.lrc_wa_bb;
> > -	s64 shift;
> >   	int err;
> > -	err = xe_gt_sriov_vf_query_config(gt);
> > +	err = xe_gt_sriov_vf_query_config(gt, true);
> >   	if (err)
> >   		return err;
> > -	shift = xe_gt_sriov_vf_ggtt_shift(gt);
> > -	if (shift) {
> > -		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);
> > -		xe_gt_sriov_vf_default_lrcs_hwsp_rebase(gt);
> > -		err = xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
> > -		if (err)
> > -			return err;
> > -	}
> > +	xe_gt_sriov_vf_default_lrcs_hwsp_rebase(gt);
> > +	err = xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
> > +	if (err)
> > +		return err;
> >   	return 0;
> >   }
> > @@ -1313,6 +1288,7 @@ static void migration_worker_func(struct work_struct *w)
> >    */
> >   int xe_gt_sriov_vf_migration_init_early(struct xe_gt *gt)
> >   {
> > +	struct xe_tile *tile = gt_to_tile(gt);
> >   	void *buf;
> >   	buf = drmm_kmalloc(&gt_to_xe(gt)->drm,
> > @@ -1322,7 +1298,10 @@ int xe_gt_sriov_vf_migration_init_early(struct xe_gt *gt)
> >   		return -ENOMEM;
> >   	gt->sriov.vf.migration.lrc_wa_bb = buf;
> > -	init_rwsem(&gt->sriov.vf.self_config.lock);
> > +	if (xe_gt_is_main_type(gt))
> > +		init_rwsem(&gt->sriov.vf.self_config.__lock);
> > +	gt->sriov.vf.self_config.lock =
> > +		&tile->primary_gt->sriov.vf.self_config.__lock;
> >   	spin_lock_init(&gt->sriov.vf.migration.lock);
> >   	INIT_WORK(&gt->sriov.vf.migration.worker, migration_worker_func);
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> > index 195dbebe941e..535237003915 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> > @@ -18,7 +18,7 @@ int xe_gt_sriov_vf_bootstrap(struct xe_gt *gt);
> >   void xe_gt_sriov_vf_guc_versions(struct xe_gt *gt,
> >   				 struct xe_uc_fw_version *wanted,
> >   				 struct xe_uc_fw_version *found);
> > -int xe_gt_sriov_vf_query_config(struct xe_gt *gt);
> > +int xe_gt_sriov_vf_query_config(struct xe_gt *gt, bool recovery);
> >   int xe_gt_sriov_vf_connect(struct xe_gt *gt);
> >   int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
> >   void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
> > @@ -31,7 +31,6 @@ u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
> >   u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
> >   u64 xe_gt_sriov_vf_ggtt(struct xe_gt *gt);
> >   u64 xe_gt_sriov_vf_ggtt_base(struct xe_gt *gt);
> > -s64 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt);
> >   u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg);
> >   void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val);
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > index 496b657119de..61484c7c9a36 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > @@ -19,16 +19,19 @@ struct xe_gt_sriov_vf_selfconfig {
> >   	u64 ggtt_base;
> >   	/** @ggtt_size: assigned size of the GGTT region. */
> >   	u64 ggtt_size;
> > -	/** @ggtt_shift: difference in ggtt_base on last migration */
> > -	s64 ggtt_shift;
> >   	/** @lmem_size: assigned size of the LMEM. */
> >   	u64 lmem_size;
> >   	/** @num_ctxs: assigned number of GuC submission context IDs. */
> >   	u16 num_ctxs;
> >   	/** @num_dbs: assigned number of GuC doorbells IDs. */
> >   	u16 num_dbs;
> > -	/** @lock: lock for protecting access to all selfconfig fields. */
> > -	struct rw_semaphore lock;
> > +	/** @__lock: lock for protecting access to all selfconfig fields. */
> > +	struct rw_semaphore __lock;
> > +	/**
> > +	 * @lock: pointer to lock for protecting access to all selfconfig
> > +	 * fields, all GTs point to primary GT.
> > +	 */
> > +	struct rw_semaphore *lock;
> >   };
> >   /**
> > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > index 00789844ea4d..ac60da51da2c 100644
> > --- a/drivers/gpu/drm/xe/xe_guc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > @@ -712,7 +712,7 @@ static int vf_guc_init_noalloc(struct xe_guc *guc)
> >   	if (err)
> >   		return err;
> > -	err = xe_gt_sriov_vf_query_config(gt);
> > +	err = xe_gt_sriov_vf_query_config(gt, false);
> >   	if (err)
> >   		return err;
> > diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf.c b/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
> > index f221dbed16f0..dc6221fc0520 100644
> > --- a/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
> > +++ b/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
> > @@ -40,7 +40,7 @@ static int vf_init_ggtt_balloons(struct xe_tile *tile)
> >    *
> >    * Return: 0 on success or a negative error code on failure.
> >    */
> > -int xe_tile_sriov_vf_balloon_ggtt_locked(struct xe_tile *tile)
> > +static int xe_tile_sriov_vf_balloon_ggtt_locked(struct xe_tile *tile)
> >   {
> >   	u64 ggtt_base = xe_gt_sriov_vf_ggtt_base(tile->primary_gt);
> >   	u64 ggtt_size = xe_gt_sriov_vf_ggtt(tile->primary_gt);
> > @@ -100,12 +100,16 @@ int xe_tile_sriov_vf_balloon_ggtt_locked(struct xe_tile *tile)
> >   static int vf_balloon_ggtt(struct xe_tile *tile)
> >   {
> > +	struct xe_gt_sriov_vf_selfconfig *config =
> > +		&tile->primary_gt->sriov.vf.self_config;
> >   	struct xe_ggtt *ggtt = tile->mem.ggtt;
> >   	int err;
> > +	down_read(config->lock);
> >   	mutex_lock(&ggtt->lock);
> >   	err = xe_tile_sriov_vf_balloon_ggtt_locked(tile);
> >   	mutex_unlock(&ggtt->lock);
> > +	up_read(config->lock);
> >   	return err;
> >   }
> > diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf.h b/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
> > index 93eb043171e8..4ee68d1fb28e 100644
> > --- a/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
> > +++ b/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
> > @@ -11,7 +11,6 @@
> >   struct xe_tile;
> >   int xe_tile_sriov_vf_prepare_ggtt(struct xe_tile *tile);
> > -int xe_tile_sriov_vf_balloon_ggtt_locked(struct xe_tile *tile);
> >   void xe_tile_sriov_vf_deballoon_ggtt_locked(struct xe_tile *tile);
> >   void xe_tile_sriov_vf_fixup_ggtt_nodes(struct xe_tile *tile, s64 shift);

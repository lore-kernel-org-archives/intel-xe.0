Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF44C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 21:38:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 117C010EA07;
	Fri,  9 Aug 2024 21:38:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hGErZcM0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4354110EA07
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 21:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723239532; x=1754775532;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TpWhsHI3QnOQyuqBmoBFG/mD8b2HU7/Bg1rkTzfD30U=;
 b=hGErZcM0xdNHC5WzhHevMbEWE4FAbB8rq54BdXgNP2uA5WCXWnFqXBdd
 7bThZVfRlpiEliZk1lgryU3mum/0FuOsI0vdOiWXXMuNy8t7+EInChO7e
 LMiG164KRrTY35P3Tz1Rm66Z/dcp64eUpJpRc0SCwi0mL0HlKwYy8OLWC
 0L+uGzOryPZdn2A4eKy+r5moHNPUWmhnuyNFilqP4Rb0HJvtCwchfK/le
 pmrMUAwtJsZ1J29kgrT18CjFyLniny7Uub4rWGmc6gMZIurmLxb7kodKK
 hLMdQEXgFzrQSfTgjV7ap3M8jURA6+7p2NLuLl4VdfYZvMJ3AKI6lwn9m w==;
X-CSE-ConnectionGUID: Z973pOJ8SF6ArjRaV6Zjxg==
X-CSE-MsgGUID: nXvCq5PcTtSrxexkA7Cvhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="32822744"
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; d="scan'208";a="32822744"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 14:38:51 -0700
X-CSE-ConnectionGUID: U1+ONJCQQkaIi/ZvSxLVHQ==
X-CSE-MsgGUID: v1PYwS2RQh+V7kfuvRXE0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; d="scan'208";a="57572374"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Aug 2024 14:38:51 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 9 Aug 2024 14:38:50 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 9 Aug 2024 14:38:50 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 9 Aug 2024 14:38:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EKWbXAnlOua9R2y01AJIBhgtQ/Vs863YVguSPCTx+ENtZ33/VEDHtIlLw1Xq0HoKAsPXKngK2AX0kmlrH6naYbxShQZADeVLZzZIdJj5qpS/5w9qVJ0LJrN7JrUYC9ghGSBJneIOFVLBXrXS1IhTC3JF/CJ6uPzqjVcHPnSYpNIXQbQFeAZQNjTDCTlnMMhBpibJfsw4WNy61SrflUNJ6N9DBbcF4k4VNT9T/jz8er7wHulehsDjaACWdEjkzzIgkrsY9OXelskfAHB/MUDFkrqkerf94FtGaMPZDyKohKrovzITyFZIHkSLwS74Jfho3HN8ukjDuPL58OrIQYMung==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R0bAf8woxnE8+0qqivKhSNo7x49lMx0AR6v3L2G9MfI=;
 b=ESdpulhRmx/x16daYDxwBHPRxZZvglXZb6T8i2raZ0uQHX8p3QKj0JtCOL4RT16/zSFX6u88fV/ZvMKWvuITvBhKBdUvWC8KtRjUq2PrctWizFjYz5RELb2zGpdMBYdhj5AEC0xyi/7oajKV2veZvJp7+d6byTMdvo/uZyszyNNMqYU9xijfP+RD5KtzLoAxyoCRIPnIijBtMg+MCJ2PQa4mxAF6uYKCxYk92g5jNzimFxHIQtHecnG5PrTF4a3XxVyjDDCATI3g1tc7FYPer2AZIkW0E7GAK+PXSuuse04BxE1Wjc5YYLI67jXTKv9uvttx3JqyjO6E9plntswH8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH7PR11MB7718.namprd11.prod.outlook.com (2603:10b6:510:2b6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.20; Fri, 9 Aug
 2024 21:38:46 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7828.023; Fri, 9 Aug 2024
 21:38:46 +0000
Date: Fri, 9 Aug 2024 17:38:43 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 09/12] drm/xe: Introduce xe_ggtt_print_holes
Message-ID: <ZraMY9cBHYQGL8HE@intel.com>
References: <20240711171155.173717-1-rodrigo.vivi@intel.com>
 <20240711171155.173717-9-rodrigo.vivi@intel.com>
 <09a7eb4c-23fa-481e-ba44-8d3a127e13a1@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <09a7eb4c-23fa-481e-ba44-8d3a127e13a1@intel.com>
X-ClientProxiedBy: MW4PR03CA0059.namprd03.prod.outlook.com
 (2603:10b6:303:8e::34) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH7PR11MB7718:EE_
X-MS-Office365-Filtering-Correlation-Id: 76162209-fabf-490d-864a-08dcb8bba603
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JnF7xEPuiXQfcmVkpDgKh7twz00U31XIiCj2QP6YZVbvXEl3uFuZIYDyraVz?=
 =?us-ascii?Q?1RaiI/a1FWwENuyeh9xnpSTGtnVEZZ5PgIxwdU/9vic6Eh7KYSik2RNvgHlZ?=
 =?us-ascii?Q?NfKDHj24e7X3d3QK9hnfAWkuVW+R/IzaeSy+8fpaOjmK4Ko3W6B9WrDJ3zQ2?=
 =?us-ascii?Q?LeoBskRIsudgWpgWmlI8/4qc+xgbfpBslexB8MFJqELD6QmhKeoEcPZmRGZT?=
 =?us-ascii?Q?xkLCtVsROh3lukL529D6kB/vC2uF6O7HCtrOTEXbG75pQQiwTIJ9gMZfwMif?=
 =?us-ascii?Q?L5w3DgOfk4oIuF7gyirijsR2UYCZ25Lo+SPW7n7uTvGxWiQiF6shEuGfOhlI?=
 =?us-ascii?Q?qwJeE0G2dbSDbhWY+VgP7cMaWPUS2bRssYIkX8m4bEzA9f0vTTznSTlkEbr7?=
 =?us-ascii?Q?jvzFVl27s0ePQmvjdG0C3XBqVWmzjcNFrRbiN6EvO7zAWegVQnsK+nRZQoKp?=
 =?us-ascii?Q?Tnkauq680gy3h5gXCBxMthRbqmEISj2nXp5e8Imnym1AEcCfe4olvasVSJuq?=
 =?us-ascii?Q?kzKN0pWQXGsYX371vuUQ81D/mvLuLQAH73z1B3Rw/I6DT8uV2OiFeRv9yEkz?=
 =?us-ascii?Q?cTxUVrrhq3pocs1wTkVoKoMO93LwPPEyt7vRQ2WpgC+GB6k1Qsc5GsrJVKGn?=
 =?us-ascii?Q?7w56HXOC1FfjhnRUm23E4KxkT7tnp3+jdG6wVc3yXN7nK5D5O268Xp8iDbI1?=
 =?us-ascii?Q?0cr5lX0B08fg5v/Hy707sSqD8rLh4srBdSfg2BLUtqTA0pe2l9q72ypLIUSg?=
 =?us-ascii?Q?r+xs3fhOmJH0HpFzVjApbD/YddVUswqZXj/X0CyYjvt2RJHpbr49Q/W82F7I?=
 =?us-ascii?Q?G3FCr+D+lIEOWdG2LIf+gKkcWr4EO8mr2HONIfbtQH4HXPvsHWgYcz9zohrM?=
 =?us-ascii?Q?Yw+M89rrhTnWWamNZpUlqlMJliAWjds5sBJWrDpl4cfbkuuw6EyTeOPX27xV?=
 =?us-ascii?Q?XS03nA7OJ/NL4bxrnfriA7i1w8dip8xCtjO5fNQ/yh0EsvjffADleeJp56Ry?=
 =?us-ascii?Q?PnnUn+rNtbUO0BnYwW5f7jLwtfavwjNVxAtx0T070+nncsP9iO4hYyVFK5le?=
 =?us-ascii?Q?ffBZ4HaP14jkWlEpCOOVOiKV2vPtMiWY6JfDzfy4tvSfRs1ICd2xjxwlshuN?=
 =?us-ascii?Q?I6/etw7Fkmlhf3mllNBer4ImbNuHrIYod3NGMr0rmakvS3wxJvPXnyRFM/cW?=
 =?us-ascii?Q?AJoG8ByOedt3wKP6iseTBRwb4jFapcliYXcfYHQPZFmXbSuEVRmZfjZSJ2ox?=
 =?us-ascii?Q?JeYL5Hf92D9M7fngwhRLzwKQwlBapxUDEKepKsIh4MaqgnQsdY9gdYaSgGy/?=
 =?us-ascii?Q?an5ahIWAWefCG9NMyehHsdeKS396YjFz8l4sSRoxMxSGrA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Tw1PwZaMU9Fh48jbx9Te3DlEARDRJNI/z4qKWfmwL4gxIo3FxykcgGNVcp6/?=
 =?us-ascii?Q?TvLAhHOvH2m5IIemQVzI52OvUcm8MiQXY593cxOuqhPQyH8ZujSvOYmH4Rzh?=
 =?us-ascii?Q?SZQNjEB+f2AJUkv0QHhzQ/ECAb6A1qQoqhf/iv1rOXUGL/HYux/TwevdfE+2?=
 =?us-ascii?Q?7aGx9XBHFaxGwMlgT3Brtw6KxXeZTlivPGeC1DgcgZFfXijyzbwKMrrxG4nS?=
 =?us-ascii?Q?kJZgOVt1tlR47LXPiENvpxHuP3CCBDSlQRri0DHII36ELRoP5X4f+nEYp4P1?=
 =?us-ascii?Q?gyqdYaZlSw5uWd7cbAqkSuRlqhC1wbHEx3IsX89MG9t9mH0OpWobLeo2NK6J?=
 =?us-ascii?Q?b3IJHcR6jTXwhtUC88hlwItK/F/JBAViC25jnVxYnvXgB18hQ6i0BnSENMqr?=
 =?us-ascii?Q?O/LBheZ00cYp3D0e+xQ+PzYMSLXpfyRAVzFSnoeNEyoBRsReOxyhue+H1Rzy?=
 =?us-ascii?Q?4X2R0XPMrje5vZTu3usckrClC/XIaDE9JhDnZ9r2l2kc4YxuHReWZpHDpMy/?=
 =?us-ascii?Q?v34Nr3s/iEEPE01I69TwgaFXICsQclCxKkHo1z1RWBjBOsrTWQybKoGELUqD?=
 =?us-ascii?Q?sTw9evALMbbqP0xOhqWpWXVwPjadHakoLyr6bR9ZDUfsbEpGR6J/b/PP7UPF?=
 =?us-ascii?Q?Sv0QLUU4q2n1LlWLRp+0OT6yjGr8gs955q/dKZ1PY12PcswrqPE+KdQ1aLli?=
 =?us-ascii?Q?rZh8lHo19bXn7GxHuww3fSO5THIcPAc+oMWja8CvjCgbM4uJGhbu6BrwsVc0?=
 =?us-ascii?Q?Z+1LcSQtMXhcW6V+jbJg8BYWRxFsk/MAnQO2uU9VCoFmKZof3RZsYqGxaDYh?=
 =?us-ascii?Q?CEBmRqjD8sVtttbQTfqNicL5cqEY9ey0yIvKUbxRrX3dAzDXPZ8Ne7lqHQxt?=
 =?us-ascii?Q?GVcXleuMZ56Z3mlxecdym5377S5DYOpFTlCOZJSajXEdZoY+btsxd3YiKq6d?=
 =?us-ascii?Q?/BDxddh1xFmbIieQrb3XB26NTngia2+XBXkIHlSeIKYZhayR52HBWTzp6qq6?=
 =?us-ascii?Q?eV/0HIAZpXIffTCwcnIyX3DANDjQ5IAvvUyoyZuSSLwEwwij72ZgcXETgMi+?=
 =?us-ascii?Q?UZpdEy4lPoTyRvjXHwq1PL+VtV5vMZ70XLnxOkQtWqS+vR3SCg2ucPUk4baa?=
 =?us-ascii?Q?6VV/e8obHrd0UzDno/k3ozt8oRVqj74/gNHn6j118ke2AwfkAGvSGkJl2+mJ?=
 =?us-ascii?Q?OJlSUDenw1NQ01/tOjay8dPHbgRiQ+IdZv8Wam5+I9WN/c9bUZbR6XQlNk++?=
 =?us-ascii?Q?xz1eKC7TnenJNoxvSZNJQzjgRnCSi3qOA/+r6s8fy490yAEAVbivdYdw4BCq?=
 =?us-ascii?Q?TeBzxbQrX5sUkAFKodxJsAiWo9XBPA4SOpGiuXmj+k+TQnijK6hmaC8ET5IZ?=
 =?us-ascii?Q?6gQz+u7HZlZcZZYyy3nStNLEECP7vT7Dhk28/GFZvNoA9ytlcC9kkeCObcSw?=
 =?us-ascii?Q?he3cN1+LSLlGiIK/fWW7i28+96wHytLPIZCigtuFmMhoYaZVfiEJuK8aspoh?=
 =?us-ascii?Q?dNKhVX6O0yjLBbyqo/+0blDisduXm6LfmPwYjX2rJNjXq27EvdpUf0F4/Aw2?=
 =?us-ascii?Q?I1TfiuwvmgtReU9Pynrzx3MGFMTv20ZmjCM6jSppDD0WqbJcqUXq8znIKPok?=
 =?us-ascii?Q?mQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 76162209-fabf-490d-864a-08dcb8bba603
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 21:38:46.5321 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NJbC1D+AprsqFamfMfYEXITElVgysU8QYTkoYAWEuaglN5DmtOdv9oNs12fsf3nJMzGjRU/HqzHTmGk1xRHIgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7718
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

On Thu, Jul 11, 2024 at 10:09:01PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 11.07.2024 19:11, Rodrigo Vivi wrote:
> > Introduce a new xe_ggtt_print_holes helper that attends the SRIOV
> > demand and finishes the goal of limiting drm_mm access to xe_ggtt.
> > 
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_ggtt.c               | 40 ++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_ggtt.h               |  1 +
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 25 +-------------
> >  3 files changed, 42 insertions(+), 24 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> > index dbaf1ce87fb4..5b51753fe1ba 100644
> > --- a/drivers/gpu/drm/xe/xe_ggtt.c
> > +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> > @@ -682,3 +682,43 @@ int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p)
> >  	mutex_unlock(&ggtt->lock);
> >  	return err;
> >  }
> > +
> > +/**
> > + * xe_ggtt_print_holes - Print holes
> > + * @ggtt: the &xe_ggtt to be inspected
> > + * @alignment: min alignment
> > + * @p: the &drm_printer
> > + *
> > + * Print GGTT ranges that are available and return total size available.
> > + *
> > + * Return: Total available size.
> 
> I would rather prefer to lost that info than make the 'print' function
> return some real value (which may be immediately stale as it will be out
> of mutex)



> 
> > + */
> > +u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer *p)
> > +{
> > +	const struct drm_mm *mm = &ggtt->mm;
> > +	const struct drm_mm_node *entry;
> > +	u64 hole_min_start = xe_wopcm_size(tile_to_xe(ggtt->tile));
> > +	u64 hole_start, hole_end, hole_size;
> > +	u64 total;
> > +	char buf[10];
> > +
> > +	mutex_lock(&ggtt->lock);
> > +
> > +	drm_mm_for_each_hole(entry, mm, hole_start, hole_end) {
> > +		hole_start = max(hole_start, hole_min_start);
> > +		hole_start = ALIGN(hole_start, alignment);
> > +		hole_end = ALIGN_DOWN(hole_end, alignment);
> > +		if (hole_start >= hole_end)
> > +			continue;
> > +		hole_size = hole_end - hole_start;
> > +		total += hole_size;
> > +
> > +		string_get_size(hole_size, 1, STRING_UNITS_2, buf, sizeof(buf));
> > +		drm_printf(p, "range:\t%#llx-%#llx\t(%s)\n",
> > +			   hole_start, hole_end - 1, buf);
> > +	}
> 
> or we can print that 'total' here, as it is still kind of related since
> it is "sum of all holes" ;)

it is actually used in one of the cases after this print...
string_get_size(total, 1, STRING_UNITS_2, buf, sizeof(buf));

perhaps print is a bad name then... but I'm out of ideas...

> 
> > +
> > +	mutex_unlock(&ggtt->lock);
> > +
> > +	return total;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> > index 31060fe7644b..67ae5f1602a3 100644
> > --- a/drivers/gpu/drm/xe/xe_ggtt.h
> > +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> > @@ -32,6 +32,7 @@ void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
> >  u64 xe_ggtt_largest_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare);
> >  
> >  int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p);
> 
> hmm, maybe xe_ggtt_dump() from prev patch should be xe_ggtt_print() ?

hmm... likely, but this needs to calculate the whole...
but we could perhaps

s/xe_ggtt_print/xe_ggtt_get_holes_total
s/xe_ggtt_dump/xe_ggtt_print

?

> 
> > +u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer *p);
> >  
> >  #ifdef CONFIG_PCI_IOV
> >  void xe_ggtt_assign(struct xe_ggtt *ggtt, const struct xe_ggtt_node *node, u16 vfid);
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> > index 1d17c34fe5a4..d0995680f53f 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> > @@ -6,9 +6,6 @@
> >  #include <linux/string_choices.h>
> >  #include <linux/wordpart.h>
> >  
> > -/* FIXME: remove this after encapsulating all drm_mm_node access into xe_ggtt */
> > -#include <drm/drm_mm.h>
> > -
> >  #include "abi/guc_actions_sriov_abi.h"
> >  #include "abi/guc_klvs_abi.h"
> >  
> > @@ -2096,11 +2093,7 @@ int xe_gt_sriov_pf_config_print_dbs(struct xe_gt *gt, struct drm_printer *p)
> >  int xe_gt_sriov_pf_config_print_available_ggtt(struct xe_gt *gt, struct drm_printer *p)
> >  {
> >  	struct xe_ggtt *ggtt = gt_to_tile(gt)->mem.ggtt;
> > -	const struct drm_mm *mm = &ggtt->mm;
> > -	const struct drm_mm_node *entry;
> >  	u64 alignment = pf_get_ggtt_alignment(gt);
> > -	u64 hole_min_start = xe_wopcm_size(gt_to_xe(gt));
> > -	u64 hole_start, hole_end, hole_size;
> >  	u64 spare, avail, total = 0;
> >  	char buf[10];
> >  
> > @@ -2109,24 +2102,8 @@ int xe_gt_sriov_pf_config_print_available_ggtt(struct xe_gt *gt, struct drm_prin
> >  	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> >  
> >  	spare = pf_get_spare_ggtt(gt);
> > +	total = xe_ggtt_print_holes(ggtt, alignment, p);
> >  
> > -	mutex_lock(&ggtt->lock);
> > -
> > -	drm_mm_for_each_hole(entry, mm, hole_start, hole_end) {
> > -		hole_start = max(hole_start, hole_min_start);
> > -		hole_start = ALIGN(hole_start, alignment);
> > -		hole_end = ALIGN_DOWN(hole_end, alignment);
> > -		if (hole_start >= hole_end)
> > -			continue;
> > -		hole_size = hole_end - hole_start;
> > -		total += hole_size;
> > -
> > -		string_get_size(hole_size, 1, STRING_UNITS_2, buf, sizeof(buf));
> > -		drm_printf(p, "range:\t%#llx-%#llx\t(%s)\n",
> > -			   hole_start, hole_end - 1, buf);
> > -	}
> > -
> > -	mutex_unlock(&ggtt->lock);
> >  	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> >  
> >  	string_get_size(total, 1, STRING_UNITS_2, buf, sizeof(buf));

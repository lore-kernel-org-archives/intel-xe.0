Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51664C282DE
	for <intel-xe@archiver.kernel.org>; Sat,  8 Mar 2025 00:49:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0025010EC37;
	Sat,  8 Mar 2025 00:49:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DztcNhte";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D21810EC37
 for <intel-xe@lists.freedesktop.org>; Sat,  8 Mar 2025 00:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741394951; x=1772930951;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZQzlxw0oF8cuk5DY10zd/Zi4oufctVq1Mwa7DxpCvTk=;
 b=DztcNhtem9PYfrTuRBjXQHkRFoj7jxGpjxqLWqpBgu3jFFhjVjX7feio
 W0cvnqVcxRcceYb4fksmjK3cBDvIPR+X13UgYQyde8f3otRJGyrGsymzw
 HC+wM6aAqnmb5i1jgPJqe37Hfd6n8Y0tuR6Zyz4By5IbFYNL9VJjQAmHG
 7Uxl5TuTDf9QOM3J3Q0iXfj0O1XTaRAckuCGGLWJ5mBTVMet51XdhWNNZ
 E4eQlfFUR7PhRWsvxzJy6xsrA89TCMw5igpW+7t82BWQ4AzMG0qY6oxH7
 wlX3Va5RhppMAdEU8FJdiTIcEXztLkAIPeIieEV4O8kvV6gB4dfZDqhz3 A==;
X-CSE-ConnectionGUID: wwYrVcmHR7Gp0zKojJ/bZQ==
X-CSE-MsgGUID: 41to7V9uS7ysV6tVZ88nVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="30034814"
X-IronPort-AV: E=Sophos;i="6.14,230,1736841600"; d="scan'208";a="30034814"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 16:49:11 -0800
X-CSE-ConnectionGUID: 9KMy/o9qSOaNRWYvDBKqyA==
X-CSE-MsgGUID: GylV7KJTQYaOKxBiipcx0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,230,1736841600"; d="scan'208";a="119450297"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 16:49:10 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Fri, 7 Mar 2025 16:49:10 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 7 Mar 2025 16:49:10 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Mar 2025 16:49:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bmAHZVNoVRfe5eLMgokE8Yq10x1lr/UAqkkQPlXrmBkP7bH0ZKP33oPx2JfE3kHB+lHxO6A+AreYCAlFHU2ulxQoe+iiSUfPBeTEYfg/LyJ/qrPTydLSaiLt/y4g1+bEBm0L/xcLVzsalS+DjZ41jbgSZyYCmlLV+a7a/BfmNeM+VtNNk1RCgSBNCOhjqvDD2H8RjS2xsxSChan+HohGIYxJ7E2TrmPDqQOiyo8kqt0H6W5z2CnAcOMJqJfspkgy3IiH4MDrKeoXn1dEHtDOI6/kAdfZLb70ecMRfoqcAvhI6GxAwxUVbf1gBvyRWrgALdBNOtbXW5e7S4TLvpKIHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aCS0ZqV6dT53nE+fGe9fCwS1Ukx9nUblK1vCogOlJtk=;
 b=AX/lG29EHrPqx64Ydu7q6T9yzqDoAS/+yQeT3npfjprvjd9BIlO4bRooLREuPKHoX40/CL6NkUAbltC2NnWPoJLjYsCzMFa97M/VWU9ofoE7E8dkM8sF1qkKeBNbzmQyyBMetCbQ9ehTl2k0iTU0yrWipnOb/1a9AmVidr8o15ht+OJNIjGC1QNWISnSmXpu+X5PYCHPD+Zo8NNGa+8av0hNx066bAMfSVSuEPdVFTqEVeZqXzLGIhVvj0DEY+uFi1QWCTyA/Esaws5gDPz+ZFoMJ42FGzoGNNf3KqnvgedtVLoe+62fs3GpoUdxGfvnua0LgPtnVzNPbgE/QpWs2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DM4PR11MB6455.namprd11.prod.outlook.com (2603:10b6:8:ba::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.22; Sat, 8 Mar
 2025 00:49:07 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8511.020; Sat, 8 Mar 2025
 00:49:06 +0000
Date: Fri, 7 Mar 2025 19:49:03 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Karthik Poosa <karthik.poosa@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/pm: Temporarily disable D3Cold on BMG
Message-ID: <Z8uT_3sWc3p5LYkc@intel.com>
References: <20250306213615.1004502-1-rodrigo.vivi@intel.com>
 <20250306213615.1004502-2-rodrigo.vivi@intel.com>
 <vvxsj5qz5dp2hwpizgduejrvvzqlz4bvjlaljuezpqarjmgvwk@bxnbmh6quo3r>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <vvxsj5qz5dp2hwpizgduejrvvzqlz4bvjlaljuezpqarjmgvwk@bxnbmh6quo3r>
X-ClientProxiedBy: MW2PR16CA0059.namprd16.prod.outlook.com
 (2603:10b6:907:1::36) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DM4PR11MB6455:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fead936-3d8c-4c34-ec54-08dd5ddb07c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ykLysWKIdbMHItDsbyEDEtFjjSim/FqBMiXZPSx2InGvQoeaMZhJVWG0Ng6V?=
 =?us-ascii?Q?+g0Owxdz3akgSoeEBbs//RH/VfRSdwbQweOmEQop/J0pow+G2P9C5diyVE2h?=
 =?us-ascii?Q?B2T5BnmiLEhPxH5EYy0mfH1FvaGPZtoVKn9SVC6Uev5mrL6p40eAHMKJ0Qpf?=
 =?us-ascii?Q?PGX0H5QHHBj3y4iWiiStW/NnNoCrBR7kLMYcgmIuU8AHLsugGpAkLJq4lAIf?=
 =?us-ascii?Q?Hnqq0rx8j9+aKkkm8my/pWlBqUwKINbtd8v2FMcyaz16ZMLzJi5Ql+j9yXqv?=
 =?us-ascii?Q?BHuct5u4v5XjOpEJqrPGW80lidu6DDFsxiJummzVnReuYgcO8xAShl2gXM7K?=
 =?us-ascii?Q?L2scz9vcPGvEFgCBRw1qbCT8lSCM9NJQsRc91OSCFOfLPRZ3R2Al7D2eDFcX?=
 =?us-ascii?Q?cHVVjMlRP1/GBgA/9MYJZ0f3eMepZKiRLOpbS1tpHwCK7QrpotU41Evz1CUb?=
 =?us-ascii?Q?n2Lc40n0gbdxqRMdunmQwrnAgOuaAbfjwUwZFRZ5o4yy6r+3W8dEwu6Si0rj?=
 =?us-ascii?Q?WclIGZz9B+6AnfFo2Bv/lLW3Pn3UOpd43RBjI+woOMKYNqpSQU7H2pO33vlt?=
 =?us-ascii?Q?kNmIH4Gq+Nt55khL38KUea0SJequlvseQcISPeymfGZL3oQcrl3/Q/KEq+7Q?=
 =?us-ascii?Q?8R/kEPhqS7Yt9u4doc7LDQXOlgWMZGcZD7hWXkeo2XOQCycpYXFikUv4/qda?=
 =?us-ascii?Q?9pMDmjrcdpyi+kWTu65AM8ts9iG14GhpDNzhvOHYdg1aT2qyC4vPn1P/L/VT?=
 =?us-ascii?Q?2RgL6qSF62+nVsg93vqIKa5UorlnY/bs0Cy3gk9ZO4jUQxh8YTviLt7rSRZc?=
 =?us-ascii?Q?O4vBeRRQKg5xJZii+UpSr9XWJRJJ4YBZH9JHwohNU4VKGMTAy0sAGp6XL5wr?=
 =?us-ascii?Q?bLEMyXQ+EFeHQMlN0P+8Jlh0DSesTHGJQw2xQAaeNdxjYgY1+MZi/9GdiAOu?=
 =?us-ascii?Q?gf8B402FpDncyE0yry25DwS/DeQA1Am7/+dP67vy5ED9doS5RYfZ/CVoK4BG?=
 =?us-ascii?Q?uhFQ+aX0iHVx0eVWmzrVrNtHKvUOMFlOhpQg3N5THmQn1VQ/dpbU3CE4ICLx?=
 =?us-ascii?Q?DggSppVGIN+d+UkDQrIsc+JATFo6q+MvzKZhFOWlHZh+yNUyuA9R/GpKYt05?=
 =?us-ascii?Q?Za0rxL6VB4ImIie9WVd0rBTyX253v2ZChShZDHJRrYHUlyLg7OqLJOekBPfB?=
 =?us-ascii?Q?neC2ke1Q0a5OCSjqkMRIIUIVEGUqV1K1DoUBAKa6ED8nQq9h3Us3uZ8mOPDw?=
 =?us-ascii?Q?jwTpzqdt1MKzYD0Kt7Gzsc6dPD+/q73Z28AUAUOhLdy1ApOR+rb9YfW1Ozbm?=
 =?us-ascii?Q?eQZ0laxtwg6MD3oRar7EAW9a9gKdN5PszWdsl19II5DGrw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WrA+qT4/CCZKrGaGcEsxGbunGMajHE0ehFGc2A3mCirxDWsmndIYWkOgn1BC?=
 =?us-ascii?Q?fncoP6Oz2T6s8Q1ChRseMHwrxZaYd+ObtLAE3dQe7nI8RC158gqLI82/rsSN?=
 =?us-ascii?Q?1ENLgx2RSZgdU7VcOItFtpBCcHRDIkZI+7h2wffVYBKYPRwLSHxt/BOzRZ6B?=
 =?us-ascii?Q?aJ//zb5Tw9ujzGgIcrScJ1TlWsbzq3tfvx242zmVMidfT2vk7tb6YISPEPbA?=
 =?us-ascii?Q?knYdiU/HBlJj8DYIEyH9VKAUbqNN0+tCDXTs042UrR8wxfBg9fxQKlmh7e+/?=
 =?us-ascii?Q?rSd8ap6PadFscSdWX1SzUmdKalsSn1sLmbfOaC+1rxhq9K79zp1rQyJwWrSz?=
 =?us-ascii?Q?eXp6vZYOUwM6z1OnednZU5E1jSNLShaCPovr7Vo57ohjw1/ZxIjd7+NAu55/?=
 =?us-ascii?Q?VStM6L/S6o1U+3CLyHwdOt6ojMJ3OLQaxcSrMkMlzh2PBXGZXCr7P93UP5R3?=
 =?us-ascii?Q?ZvQIytXjQXJeOBEYiZYcahqaFHSxXT7P5/uGX6Oh6gslJxbf7NnxYZOKmMfx?=
 =?us-ascii?Q?rxGsbuamm1Gvugu7SCKDsQh8qFsJ7fLHCrxvt6Hd30sHEFJOcOtRnyDyoJqq?=
 =?us-ascii?Q?RHbAUppxj+Nei/cBwFptZfGF+Q3abiL1z6r8gfE2D9bewjFWbnFHgfqDDxYF?=
 =?us-ascii?Q?yswWPHVhh5PkTf9U7En4vHcGAC/iy3ESWjdIm0i4M8e6CJTuaRURCc266OqE?=
 =?us-ascii?Q?5QOGjoYtaZB79zcJJD5EJLmSFSibBdblWMy0yytvpxwwPIRqm9sH35jQndX9?=
 =?us-ascii?Q?jStwpo2j9dRm61xeW2fRlpUIy92pc8yd+mw5/NQrnJLMcBF2eGB0m6xXinaq?=
 =?us-ascii?Q?fsW8SpcW+OxHCQmDCCmL68Uk5H7T5RkQrDDoiSZilK8okA/y5+TrSMwDepqm?=
 =?us-ascii?Q?hKg5WLa0lyH9H3nvbNBgMRiwCcHeSlRt/1Zl7swevefh7IJY8F00+qwynNxo?=
 =?us-ascii?Q?4S3RiGIJD/eYxkAtw83LrpUokGfMBLTOhbULLLc/E6S26Z1UKPo58784iyxJ?=
 =?us-ascii?Q?fMeUAlaJtThsJ4uwmA/LrGc+DwIEhaFw5A2mEzUkF0KbssPcBkDCxsS/f193?=
 =?us-ascii?Q?EKM6NGglnti8M+BiDFWJDsJ34Zd8Bz3qqwNILiHCOtItYp3/E2CPhGbyDYI9?=
 =?us-ascii?Q?4LCAHRWs0kK8f0dJvQFfvwVIsl8Sl9+cnfqm9NEhXlLzR7eWYG+tFPVnnpU+?=
 =?us-ascii?Q?dzKTAv9pP75tYP56aKrHI3ste2DgjUIsKt7DdzQaSokWnf8pBi1wGUUBV8zY?=
 =?us-ascii?Q?zW9tlf6rcP9L3Lda0l1M5lbn786v7g7gyKoIWnuhaSlCpVaNIShIhV9dDc3/?=
 =?us-ascii?Q?ryr9/2ip6fqBGha+Aa1u6l32DtOy8KeN1VSkYi2j00OnGawijwKNlq93kRIN?=
 =?us-ascii?Q?1EiRQk8gOnJElIbEKEnYZyZM/d93t+LlOGsVdK3nQPVNHAvrhF89jB2MQ+wy?=
 =?us-ascii?Q?zG/0GGD+tJHSd7LooPcxRa04J8wqrD/GJsju44Ws1Pfk7Tkh5BAmqHmcZ8cB?=
 =?us-ascii?Q?6jGZMpSNrVqC/i4G6Lu/kv+KJceUOmifow+fsAUIShyuXgHfxiy6NMU++Wem?=
 =?us-ascii?Q?4KSZsIqRu40HXe3wH2UhmqCSrxYXePbKSs/eDj8mL01N9kCaSC7wQ4hhh+A3?=
 =?us-ascii?Q?RA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fead936-3d8c-4c34-ec54-08dd5ddb07c3
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2025 00:49:06.7949 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: acQLJuiPOzoSoUsrR46VrMcY16N+x1WLHZSDR21XHM26MEB1J51c1OjRqmlB6E8o+54r8Dqmf4N5kvV2c1jJ8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6455
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

On Fri, Mar 07, 2025 at 04:15:01PM -0600, Lucas De Marchi wrote:
> On Thu, Mar 06, 2025 at 04:36:14PM -0500, Rodrigo Vivi wrote:
> > Currently, many instability cases related to D3Cold -> D0 transition
> > on BMG are under investigation. Among them some bad cases where
> > the device is lost after 1 to 3 transitions from D3Cold to D0
> > on the runtime pm, with pcieport upstream bridge port link retrain
> > failure.
> > 
> > In other cases, it works fine, but with some sudden random memory
> > corruptions after D3cold, that could be 0xffff missed ack on GT
> > forcewake or GuC reload related failures.
> > 
> > In some other cases though, D3Cold -> D0 works pretty reliably.
> > It looks like it is a combination of GPU cards and Host boards at
> > this point. So, there is no possible/available quirk at this time.
> > 
> > This patch disables the D3Cold by default on BMG by reducing the
> > vram_d3cold_threshold to 0. Users and developers who wants to enable
> > it are still able to via
> > $ echo 300 > /sys/bus/pci/devices/<addr>/vram_d3cold_threshold
> > 
> > Fixes: 3adcf970dc7e ("drm/xe/bmg: Drop force_probe requirement")
> > Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4037
> > Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4395
> > Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4396
> 
> are these Link: or should we use Closes: ?

I don't want to close them while we are in the investigation.
So it is either Link: or References:, which check patch doesn't like.

> 
> > Cc: Karthik Poosa <karthik.poosa@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_pm.c | 7 ++++++-
> > 1 file changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > index 12200be7b43d..a9f61a5fc971 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.c
> > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > @@ -287,6 +287,7 @@ ALLOW_ERROR_INJECTION(xe_pm_init_early, ERRNO); /* See xe_pci_probe() */
> >  */
> > int xe_pm_init(struct xe_device *xe)
> > {
> > +	u32 vram_threshold;
> > 	int err;
> > 
> > 	/* For now suspend/resume is only allowed with GuC */
> > @@ -300,7 +301,11 @@ int xe_pm_init(struct xe_device *xe)
> > 		if (err)
> > 			return err;
> > 
> > -		err = xe_pm_set_vram_threshold(xe, DEFAULT_VRAM_THRESHOLD);
> > +		/* FIXME: D3Cold temporarily disabled by default on BMG */
> > +		vram_threshold = xe->info.platform == XE_BATTLEMAGE ? 0 :
> > +				DEFAULT_VRAM_THRESHOLD;
> 
> we usually have to extract this for different values per platform, so
> maybe just go ahead and do that?
> 
> 	u32 vram_threshold_value(struct xe_device *xe)
> 	{
> 		/* FIXME: D3Cold temporarily disabled by default on BMG */
> 		if (xe->info.platform == XE_BATTLEMAGE)
> 			return 0;
> 
> 		return DEFAULT_VRAM_THRESHOLD;
> 	}
> 
> 	xe_pm_init()
> 	{
> 		...
> 		vram_threshold = vram_threshold_value(xe);
> 	}
> 
> Then the second patch simply removes the first 3 lines of that function.

Good idea! I will change. Thank you!

> Anyway, I agree with the approach to get things working. We can try
> enabling d3cold again when we understand what's going on.
> 
> 
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> 
> for both patches.
> 
> thanks
> Lucas De Marchi
> 
> > +
> > +		err = xe_pm_set_vram_threshold(xe, vram_threshold);
> > 		if (err)
> > 			return err;
> > 	}
> > -- 
> > 2.48.1
> > 

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3397CAC5BB
	for <intel-xe@archiver.kernel.org>; Wed,  1 Oct 2025 22:31:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2369510E05E;
	Wed,  1 Oct 2025 22:31:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dwsb6Y79";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4704B10E05E
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Oct 2025 22:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759357910; x=1790893910;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XgLIYc3KebpQ3tEZj0GTWE6+fzRZ4ELHH2DO2b0IDDA=;
 b=Dwsb6Y79JY7T3cWZwwzLk4jnxbrCUQsChKwoh1+vN0RNxHCGNjAS2o+Z
 A8eDGwh6FGj+/X+U9ff7UR/liS8BGn5DwOOGMFVE/BwvEZnTmY3Aib7Rb
 1iYbKDJ8r7K+5Dj0WVnc7RhtkM1gr/QoWBVOwoSqDHUlFkU4lSPPC/uzF
 2J0Yqa02VbVEYDPX78d2bbDpnIoO6hcb/3wVzfj7Ksd83WwAVxRalo6k+
 10OiQeW0byxuURAnHiEcPTZNmCoLJvuLYQBUf7UEnbV4c+acyFzudnxdT
 eDPwi8eXzN+uc42j5aFqPvo7widHdHArhCuR/br5WkddgG0jv0m58DBsb g==;
X-CSE-ConnectionGUID: 8a1MJLU2R860OzG3+N5Z4g==
X-CSE-MsgGUID: Kiytkm8URIK8Tes/uC3a3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="61684524"
X-IronPort-AV: E=Sophos;i="6.18,307,1751266800"; d="scan'208";a="61684524"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 15:31:50 -0700
X-CSE-ConnectionGUID: CcFazIX9S/uEuJS8rZYxuQ==
X-CSE-MsgGUID: e+5nRjV/QMWsGZYR1BnuKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,307,1751266800"; d="scan'208";a="179672553"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 15:31:49 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 15:31:48 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 1 Oct 2025 15:31:48 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.41) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 15:31:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XRadtuEp4m0/Jk1mSDKZP90feOABIUluOS81qK9c9W/UywmpSklZPl8ebPy30XxbTE3GVjXHS5/6DMuKrKDvFHKKEYgu6BDb5WjgcDl3JsBYsxQiIflSxM8tpaXneL6JmtjvdmQYkq6Kdzy/0tkXmtpxmW2tVH1VIKFehnXuIb/8NFKRErJxoOS+bxalTIj6+vnYW8bfyVnpuei4qhhzpAHRvtIVWxKml4XgTrRpS4eWacrkCJuNhvIJqkOiiho2GahfyyE3WqaKL+cZnnIY1gJZz90uNnG/bXhaHlN5YY4eLpda1J4GoqyZUOYN7jtFWoapA3vcHuosl8ijg6N6sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gprA1NBZ8w6T61V+x+meJr9X4vFmLYNnpydCFXQAcDA=;
 b=tG3/z3KVKFu5FGfvsOB87xBwJVe/2uulNHcA6gvhmbSENZh+nWJzHM0AWbz60pzW/ck+fRxNPX+muuvFmJKTNqbiUj4BHNe2RvFGoFBcuMx2kx96R7xBhkbC/QWly2zFRnWtVmIWf3LSg594Qm51vbATO0kUcqv+oidX3/FLtzDJrIEWcD35Fz1HdUIjDOh+z3l+L4FjJvRjCxD5nczprSj5/Gse1BGwh0RQcu94DUSv15zmEraT4ty6iRx/IfhDD4lIn2347XdLsD2+n4nSnis+sg5nAXr3KG0wPg5ZGpR8wmXzmsAeUUY4MbLIvJanD5/cws94V2mCcEmTT2FDiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by DS4PPF706C623D2.namprd11.prod.outlook.com (2603:10b6:f:fc02::2f)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Wed, 1 Oct
 2025 22:31:41 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb%7]) with mapi id 15.20.9160.017; Wed, 1 Oct 2025
 22:31:41 +0000
Date: Wed, 1 Oct 2025 15:31:38 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <fei.yang@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/1] drm/xe: TileAddrRange registers are being deprecated.
Message-ID: <20251001223138.GC5409@mdroper-desk1.amr.corp.intel.com>
References: <20250930232645.600251-1-fei.yang@intel.com>
 <20250930232645.600251-2-fei.yang@intel.com>
 <v6n2utoszshbmafm2feeghgbyte34ackrurhogrvlgqooobd35@rapdbux7fc3k>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <v6n2utoszshbmafm2feeghgbyte34ackrurhogrvlgqooobd35@rapdbux7fc3k>
X-ClientProxiedBy: SJ0PR13CA0039.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::14) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|DS4PPF706C623D2:EE_
X-MS-Office365-Filtering-Correlation-Id: 15ecf1ad-3d6d-4623-711d-08de013a4b0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2WO8yY2vUujYKlLAEGlnySGikwKQrERdlKIjibyoXR6DcbP/FZhLMu4H72aM?=
 =?us-ascii?Q?eNUEG6Isc75y9LOZCRhpuV3wR48B/mEfmStWZz5S/WZIzS3ruLFTA8UEL/Mn?=
 =?us-ascii?Q?N5sJuto6a9eVJW7SRxcs3YzEh6kRs48J1au67QrsRF1wXAjNnKYitYx9NAy9?=
 =?us-ascii?Q?cocXpfFSIN6FWl305URD9m6MOUhuimYWj/fVHEGmEYrhpt6wF3PVT//BOBMy?=
 =?us-ascii?Q?LhO930zNdOihIQJ+goeXLYbq4p5RH+xybXqscd5Hf1fUvXUcfYSRxmKngrzb?=
 =?us-ascii?Q?XyNl6ZBgrtBKvb0n6Wrpj3jBtEPQ0vT1QDo7bDhyR9YZuK3+iCPxtiuiU37S?=
 =?us-ascii?Q?by4tcqbckyvLiZ7pJi5xSCHgyfsXp3NIJPn+ITxk8eq6UYe2esZaF0zYIyxZ?=
 =?us-ascii?Q?6qq9hjYlN9uOsufiNDFMLDQDYSkMtynpX2yQyOIgLdGgb2RkhCOYKalaZPlN?=
 =?us-ascii?Q?U+Rnr5ahhoKLKPJ3vGmrZHFlcAkDdio7occ3jex7v1St54HaXhc1dtb6YJtG?=
 =?us-ascii?Q?QSBJCZiV0H/Frz2EfqN8qZOxGkXtoHrhKfUyvCT3WSt4M9z6bColYkwrOz+H?=
 =?us-ascii?Q?opOYZ4YWHEiKSDstgZ9wa4Gj0Ua2nYb7xeilBPuwFomDfT99PRW0PLyaLRaE?=
 =?us-ascii?Q?DYBLKMzCssednGZSdtfl42lujU4diIpNz8Sa8wvTZ16lwWVybxUYv/PLNshN?=
 =?us-ascii?Q?eJ7X81i7sSYPEOhTpin+Z4eG+0hEjVgh4HkUrq4MN4gEkade02HCPdKuFyOz?=
 =?us-ascii?Q?C8tAi5SUnuul/ozP+4AcZ+gqkMPzYAnutrxJBkOSzoGenE+ZnFoogGUf1RG0?=
 =?us-ascii?Q?PI8p9wX5cVevHueVDWQ+6tvcxI9kF8AV6VyVEKsVIw+c9Ivp+XZpjZ1Eg3U1?=
 =?us-ascii?Q?F1XlwPtpC3bGV1CoWdqvWq2mZ1dJoaVu1VCrMi6DzNu/A9jvDLwwcY9TAEEV?=
 =?us-ascii?Q?ejypFLHStfcXGs9m7B9QHrYECBh3kervdzBwmP9HqcEFfh3bEoOkfqPS6DkG?=
 =?us-ascii?Q?ij2nR6fsXimXngRgZKCG9+Iade5lE6Ctsa9dokOuFWuvyNfa7siEflX08Fel?=
 =?us-ascii?Q?pcGaVSEyPWOsxyvFO4Nt4uDbApOcCwIg9ZArvb6pL9ed3s3XBVkoryea4/1r?=
 =?us-ascii?Q?1M9MvCw4JQA6VTP1lKSYZVsIaiNbo3hY/2FTC/69QEtYEnqMV3//wfC/N6Cr?=
 =?us-ascii?Q?n7m20PSdQpAaKUycPKGJJVznzjdEQZYWVU1KP2s17xMPdoBil02ROC1U9hSx?=
 =?us-ascii?Q?rXuGU/zc6gR6HWmhROr7svhZZg7znB2Vy4eYvp/ejw0QoGHj/hNbfLo3PNj7?=
 =?us-ascii?Q?zNE1lYGK+b0z8OrQtqpPmjWsH1BpKzPEq0D4nWHvT9CTyELYtMIwRYgIB59N?=
 =?us-ascii?Q?7Bnl40XA5w8fsmMptaTpK6V7XKupf5BNQAh9+MLP5WRz6gsWiu+38cnL8Jct?=
 =?us-ascii?Q?V4zUxPB86CTzgIP9keThIvLHHtryeNKR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LmB+PBW5+FgMUjHvc4/wRZZo2lXeNEtBjFhKkCqRapT2Kryu9Jx/w2xmVH5/?=
 =?us-ascii?Q?HxZrlPa/QUMWqtFnwwJyXYtZevlfqiEC3Zfo0yZvraGNACcbURITmcPchFpG?=
 =?us-ascii?Q?Y74NBMzF2cfpTOHTVlWiR48vJd6kwhRYnt/1SpUKT383LyJFbk7g0xupzs2z?=
 =?us-ascii?Q?qfk5/9kZXleRNyTgDluHgcz+YU/s66i9rR0wwiECwX6NhLFfzjLm6OF6mN3l?=
 =?us-ascii?Q?PJEpNgFbcDWHIxnHgbekWRhX2tn1fb6e+aZ07/w2VnvUudrdBUq8tK5Dmmmz?=
 =?us-ascii?Q?K/is6r8TTfDMReKDjWGc4o7dj4VHHp4FcGeflpk/jfdwikHugOPU/HH9DGQi?=
 =?us-ascii?Q?Rojb+zXghQhpBZoPA6LKVnfxMei8GGKYgicsugcn4mL0yREaqO4SM1JKLXGp?=
 =?us-ascii?Q?tLcIvo6HxFZUvchvJ1P2UvZFSC53Dkui3LIkY2eJY/wRJ6i/7H9qTvd/Oz2f?=
 =?us-ascii?Q?Uyi0IR/pHd3FgUJDeY6jsz8uNCsUTSxlyQFY2jIB10q/jPwCIEzYZl0BdFuI?=
 =?us-ascii?Q?X0suK2svXROSZGldKXIDSkigLXeboEb230rBwYTrTuhcF3lfBn65L4eSRxSl?=
 =?us-ascii?Q?EAcoHM4g0ers/fIk82lAjIJJo/ezpDiSH/bDGRp6djJ7+9WF+JclspenN09Y?=
 =?us-ascii?Q?8D/gISWmp28Sa7bd8ObOtBlkldyPXv197lQ5Usx1DJI3NZHwOC8BaHzinp71?=
 =?us-ascii?Q?zDi2ULKYX0lzvXovbM0uwTzoEXsT2ojM6Ql2Fpu3Z9dEO2LCOs9aO1Bvn+cQ?=
 =?us-ascii?Q?dSfo0HGBwhnkBeMpDDObzvxcsDPu7Cr3KhXg5zI+5vtx9RUDLy7sF3zJ6u62?=
 =?us-ascii?Q?vforaloxAshXoA8me7Ceo3YD8wrhgLxtzYuGclXWF5Ze4SYL8lG1FtB64pDR?=
 =?us-ascii?Q?4FYJPPGOdn4N5kAaAK3GYewzPmmJs/IvFqiybINJp49BKeQwBx6lvwqP1Is8?=
 =?us-ascii?Q?uVWXKZM4LhIxtW0xOz9gohC3FrkuKWHgfl5KFmaSXy2o1UoMHbv8lwqeiu/b?=
 =?us-ascii?Q?pkOdEsmb4A5LIsdWlqm/veOGYon1r65h0kUrkfxG9BXeXyvtDPmO2jJVRH5j?=
 =?us-ascii?Q?NlViIr6B47UbW/h5HA/DgBY0PWXFbEqFTm2TYFVn3tdtdehQSNeO8JVT7aC+?=
 =?us-ascii?Q?V9tAD+XCLxAwMq3CRq0P+sf/Coi8SyC5q16JfJmMow2mWJ4IqdYkiqjZVoU+?=
 =?us-ascii?Q?bU3gcHn2taQQM+Iz2UK7xGJNBGg6BSML6860i0aX5o62YrszykUpeaDcjii4?=
 =?us-ascii?Q?D48pc4PfaPx1kwPFp4W22CtJpl5/awoRV5FKhIg6B7sWJ7TGc0voJHHc2C85?=
 =?us-ascii?Q?hdnKWDD/j7LONOqgw4lr39AFMSR9q8P0IPak99Ihh++SKmMgw1+WAUEvmO/B?=
 =?us-ascii?Q?A0wRcQbx8YryE0BWtP59rH3wC9d1qnO8ASZSKkk/bi5l3Qmu8bRjSqwWczlu?=
 =?us-ascii?Q?trhruYllAHHHAJ3oRmjNknJzj5rDvmOYTpzXJoU0AhrJMKRj+GhbGQl0hj6D?=
 =?us-ascii?Q?YuoJRTjLobr5Ji6g53/G6KrppB/utk7rS9p2eUChiO9SL3xqv9Lqqlz2WbSs?=
 =?us-ascii?Q?zhpqRUVNMLwyKODSFHgwUPzJr+js+h1L7zT+BD02VEmPbFd+0MLsiAN2DMTS?=
 =?us-ascii?Q?hQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 15ecf1ad-3d6d-4623-711d-08de013a4b0d
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 22:31:41.4198 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zvl1++KTiGmFywipFJu80D9JN3CB7h9e5AsQIhTJGgwOaPuc/PW7jDBxAgY4Bxvf/81JxLVQNwh8l80uWWSVZayLrVCzamzOniq9tmcPuog=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF706C623D2
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

On Wed, Oct 01, 2025 at 03:15:14PM -0500, Lucas De Marchi wrote:
> On Tue, Sep 30, 2025 at 04:26:45PM -0700, fei.yang@intel.com wrote:
> > From: Fei Yang <fei.yang@intel.com>
> > 
> > Quoting BSpec: 59353, "The TILEx_ADDR_RANGE registers no longer have any
> > impact on HW behavior. They now function only as scratch registers for
> > communication between SoC FW and the GPU driver, and will eventually be
> > replaced by equivalent registers within SoC MMIO space. At that point,
> > these registers can be deprecated from XeTLB.".
> > While the transition is ongoing, the SGAddrRangeforTile continues to be
> > valid and works on all platforms supported by xe, reading that instead
> > to avoid potential breakage.
> > 
> > BSpec: 59353, 54991
> > Signed-off-by: Fei Yang <fei.yang@intel.com>
> > Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > ---
> > drivers/gpu/drm/xe/regs/xe_gt_regs.h | 3 ++-
> > drivers/gpu/drm/xe/xe_vram.c         | 2 +-
> > 2 files changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > index 06cb6b02ec64..484598d81cce 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > @@ -95,10 +95,11 @@
> > 
> > #define XE2_LMEM_CFG				XE_REG(0x48b0)
> > 
> > -#define XEHP_TILE_ADDR_RANGE(_idx)		XE_REG_MCR(0x4900 + (_idx) * 4)
> > #define XEHP_FLAT_CCS_BASE_ADDR			XE_REG_MCR(0x4910)
> > #define XEHP_FLAT_CCS_PTR			REG_GENMASK(31, 8)
> > 
> > +#define XEHP_SG_TILE_ADDR_RANGE(_idx)		XE_REG(0x1083a0 + (_idx) * 4)
> 
> so... this is not a GT reg, it shouldn't be in xe_gt_regs.h

We should also probably move the forcewake get/put from this function
down into get_flat_ccs_offset() since that's the only place we're
actually touching the GT now.


Matt

> No need for arch/platform prefix neither as we will always use it.
> 
> Adding this diff as a fixup:
> 
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 484598d81cce4..28df6dbbf0d31 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -98,8 +98,6 @@
>  #define XEHP_FLAT_CCS_BASE_ADDR			XE_REG_MCR(0x4910)
>  #define XEHP_FLAT_CCS_PTR			REG_GENMASK(31, 8)
> -#define XEHP_SG_TILE_ADDR_RANGE(_idx)		XE_REG(0x1083a0 + (_idx) * 4)
> -
>  #define WM_CHICKEN3				XE_REG_MCR(0x5588, XE_REG_OPTION_MASKED)
>  #define   HIZ_PLANE_COMPRESSION_DIS		REG_BIT(10)
> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
> index 1926b4044314e..ad93c57edd17c 100644
> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> @@ -40,6 +40,8 @@
>  #define STOLEN_RESERVED				XE_REG(0x1082c0)
>  #define   WOPCM_SIZE_MASK			REG_GENMASK64(9, 7)
> +#define SG_TILE_ADDR_RANGE(_idx)		XE_REG(0x1083a0 + (_idx) * 4)
> +
>  #define MTL_RP_STATE_CAP			XE_REG(0x138000)
>  #define MTL_GT_RPA_FREQUENCY			XE_REG(0x138008)
> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
> index 74cc04412abc5..4c35c41c91c73 100644
> --- a/drivers/gpu/drm/xe/xe_vram.c
> +++ b/drivers/gpu/drm/xe/xe_vram.c
> @@ -255,7 +255,7 @@ static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
>  		*tile_size = pci_resource_len(to_pci_dev(xe->drm.dev), LMEM_BAR);
>  		*tile_offset = 0;
>  	} else {
> -		reg = xe_mmio_read32(&tile->mmio, XEHP_SG_TILE_ADDR_RANGE(tile->id));
> +		reg = xe_mmio_read32(&tile->mmio, SG_TILE_ADDR_RANGE(tile->id));
>  		*tile_size = (u64)REG_FIELD_GET(GENMASK(14, 8), reg) * SZ_1G;
>  		*tile_offset = (u64)REG_FIELD_GET(GENMASK(7, 1), reg) * SZ_1G;
>  	}
> 
> Lucas De Marchi

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

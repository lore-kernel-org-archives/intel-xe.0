Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F63CCD184
	for <intel-xe@archiver.kernel.org>; Thu,  9 Oct 2025 19:50:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1077210E23C;
	Thu,  9 Oct 2025 19:50:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RFqYq35Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5449510E23C
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Oct 2025 19:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760039431; x=1791575431;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RtwBogD+lkDYo8IkN7I0cl4oBBkpK6b5ua5MWiq3y6U=;
 b=RFqYq35ZkjHTRSzOiVy88FYXrseAX35eGSVKCx9XA1qEI8z5IVGCExMs
 nHrzf/wfyyvoeFIdu87069unPAm4Fff8/TbvuQw141Zo5jfjwKvXIU6UE
 +7V/bASQ3Xk1ghK63HAzy9rE6vtmL+NjVjNH/vUeu8dKx+dABeObCV63t
 AEIDginxwfzpW4axrjkSo89q8KYhuPRNf0sg9812KZF0lXQUCsfU7iimw
 Q4OYqZCUAIsVD+NLOHpAltCWNkWma2HYZ8gkkllqu0Yom7YVKWRN/z5wa
 OVych2/H/XXVnSi594MHIy9kr7cNI/I8y40+uXK5Y0la0V7YXzk+HC4W3 g==;
X-CSE-ConnectionGUID: fENg7QFSRACdUhPmwkUpJw==
X-CSE-MsgGUID: IMAR0EOlQTG96cuDICT6rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="49821082"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="49821082"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 12:50:30 -0700
X-CSE-ConnectionGUID: 0Pffwk5LQ4OGdmLlib65jQ==
X-CSE-MsgGUID: +kxzZxX9RcuASRtbuvjdHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="211445461"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 12:50:30 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 12:50:29 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 9 Oct 2025 12:50:29 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.59)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 12:50:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HPHUq4nHAgsC+boMfSx3uxLD/8SWq0vwymOsFJVSzUjlOlrDITAJeKkmT/3vrbDxh7wwE+lXW9GX0JbHSwAngx3DFQ/hUhXfJtDo0N1y52XOzM+KfUFlMetrEpupw1eANE/4pHJESS15KqOkkcG4ZgDT3uC0H2g+2YSPa3jGzs5EYDVRoH9xfHfV21cB2CEGgdQ8AVLP06Sk1rVsHHfCJq0HrNeOzdrlpQXIiBz5Md5+mzTdvy1d5L6VQnhp1gIs6SkSdnTeYcWBIVs1NDwTEE3ZYPPG1Mmel4xB/Ur2kaLBQG5wiRO8cFOE+bzjJlasaT3OlQO1B+xgrFR60IzCxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=idBM5wveHLbzzbQ3HapI+OB/9pofEAnjvrBiL+EHDaQ=;
 b=VWcX8RUHPjYz5RUl5jQmAgRyTMuB+iX2QtmZcJplox5OBCFMdgKf0xRIRA0UigteTG8wER/ywBmLyNLi7vaq8cLEBdDFo8s//7W3Fbwa3UvBqm2BX/st/tLER2Ceztm07/swUDvCoJl9JztDmSukEx5owc4W6jWostK94pzA9Y7SsKD4uNye7KcvrExt996XmogRX3UFQk7f2isQ8GnTtTtUU53o6nFxO08x5/JTj1gIKFJ7C6rUhCjKAoMc4SQ7bcwZhwn8GtGqOWsxY/fQvfxjEB1KYDiBf+Q6JFXGPA+ADgT+nfrpxSSEPpkjoOU5BkDHktriJjNc3oZI4CxZxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CH3PR11MB8590.namprd11.prod.outlook.com (2603:10b6:610:1b8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 19:50:27 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9203.007; Thu, 9 Oct 2025
 19:50:26 +0000
Date: Thu, 9 Oct 2025 15:50:23 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3] drm/xe: Enable media sampler power gating
Message-ID: <aOgR_x2r9a_L1Pgm@intel.com>
References: <20251009184235.1929975-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251009184235.1929975-1-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: BYAPR03CA0032.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::45) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CH3PR11MB8590:EE_
X-MS-Office365-Filtering-Correlation-Id: bf50b34d-39e5-4380-4cd4-08de076d179c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KDoWXjG5UyzEvXypIUtOdI6DP4+leG8BiSvbep9LNkG4WgZymTtr69bIRpLA?=
 =?us-ascii?Q?LTofef834OYyl7NFE7WjvtfjOdF5D47W8BuIZzJjSc38ctU5DARHkEV9hHnj?=
 =?us-ascii?Q?K9YGN5sd1LHgkPDGUrphsMN7ksKeZJ1CVZ2Pnk9L9K2UdaWHcc1YWNsYFIsp?=
 =?us-ascii?Q?neJ3LnvmhiEZ26zmw9j6GJ00WPeeogRiR8CDCpWzL4XUV4iwlxSVSOMCbwVZ?=
 =?us-ascii?Q?zp5CFT7Umgpgd2KEx6jcNgVSHQKvRf8WdnN3OycOKdJiVjOueW34UuGKUyLn?=
 =?us-ascii?Q?PJgsNV/vWhYYZd3wtbi+RAp0BlvyrVsAz69SDuxjQ8ENpUYT3x6yadGMSb4c?=
 =?us-ascii?Q?CUhbDIAu4jh8/RjkY9SF7fV/L3NarY3FhjjUmY18tGhkpJKUDfNFoN85b8VR?=
 =?us-ascii?Q?mWpdDC9521F0jPSWJY25chvBxfZ9qlUljezRZt/4UVNMtn/+j/J27YgjQa8E?=
 =?us-ascii?Q?0bL2rPE40Ms5N0XleUBuXkBfrXyUhB0xfEm0uKK1rvVFV1QVIUoNRwDaNSCC?=
 =?us-ascii?Q?cIp5EBBZkYJbOttBTPat2Mwth9+riBHA4myRMd4b2Tz1weACJfxyeh/5VyoY?=
 =?us-ascii?Q?V2UGlPJSmtSdgIZGK2uyVO6MnEKemMpFdJbRvA570TZu8e22lbdXdVbKd4Ml?=
 =?us-ascii?Q?b4nNbnsvbE7QDUHq+9pxYnGjoMvqp/VN56Mv1UL3GZhCP+4ZLfZ3MtBivleV?=
 =?us-ascii?Q?zOc/qy/BMu2JEZyYvu66M1rHYv9p4nksuzKWpucco7/gqNCXBuufyZrm3kWx?=
 =?us-ascii?Q?kj251bAs1wDR5gUvZTb6udO5Xrea9142sd+5lR4f3WvWUR5j8HcH9/YOYZ4D?=
 =?us-ascii?Q?RsOpv5YCMk/uqpOU2b7/vgsjjvhPSuPt6oTa6QFJQyfWhlhG3uItlY26+hxz?=
 =?us-ascii?Q?+5KJn/AajF2x6+kXsQa3zKxaAIU0iBqHXtiVyTb38+22lVekJeMp8STrZEls?=
 =?us-ascii?Q?I1wag7O6LoCGFwLJ3bt/ezmQBrM51yyzphI/ZQkDa1zpSz2MUhwpr/BcG81E?=
 =?us-ascii?Q?0ItAg1ckvtQXbQhPCgA23/je6j420mycCmsbkbTgck8Pr5yzMsoiGOgrFT5O?=
 =?us-ascii?Q?9HHA94AIDrHxo8tIBhoveGc3SO9Emf31DZTWFS5W0+9kTs/PXVRt5+fCMM2q?=
 =?us-ascii?Q?KDJLAq7LNTAMrUL7fcahRl/59vukH7oAja8ye/xiWaw6n1NKrjhEtqOFM/NG?=
 =?us-ascii?Q?iLl/jOQz/guVpDWrq0RRHmMg5xxfFx7BTqgddes+HwTVJM2ZpLXSDli8OJ2f?=
 =?us-ascii?Q?H03g+aXZWWuy7tFGxjYLheBG0gKL6cgPQSTAebP0h35i45ZEEDOPDMMlF7h/?=
 =?us-ascii?Q?l0FgTy7u+sfpMRnIzhkxp9hWCntcBLFNj6oq3qPHRprUgRm7objgR5Kiqvlx?=
 =?us-ascii?Q?/qPx3+LzaAv3ephYjM/hqhI4zRUAEg/DhrfZJRNioubdF5CLUsW43Uy613AD?=
 =?us-ascii?Q?URiiUeL0zdthBDeDR0UeurpQRyfpAtzE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vpq64cdAjBiuapoGNuGPUvoxxmuA8zL+6MMShStyfQz2jzKE+ujZfxuU937I?=
 =?us-ascii?Q?4oK2CO7wpgEq9DtHVdkDAV3DjvJqGyjKbfBUPeY9ldT/lVtBiNGKl1m8wpNQ?=
 =?us-ascii?Q?FZj355hHTYRl/wutuXbNFG057py7Qu3Q7iwNxsjSfhpd3yst5G6AU2jItxdO?=
 =?us-ascii?Q?OIlDMD0kn0R3rlZLdS9mkG2U5Moup36ifcgrUus5UypoUlGQZULsC7KyNi2J?=
 =?us-ascii?Q?mZWwWebdNGphwMSX/plTINihYNMvQlRcpxz66jBJCslbuePI7T80slQBXTWW?=
 =?us-ascii?Q?wwIWXwdy1GzNzEbw7ewOF4T/N5WWfj3Ankyz3iqk/T6GroLemaJbN3SKZ/HU?=
 =?us-ascii?Q?3CJtVL3oc9GGsGfTQct3Hu9MFlZQny5t6z9qVsXG/5l20Jq4qMLzwgz2TZNe?=
 =?us-ascii?Q?O78EqvBQripqFfuVUfsLR3gSZAIleHKcqPW7/EyE9xmyih0s41bz/NZyqFcu?=
 =?us-ascii?Q?pDdz689WRrinfBDMP6zKwI6cDesP448xkztn9GJbkiSNRcItdvAAWoEUfTdp?=
 =?us-ascii?Q?dyjtLizlNKxPRzQ+8P3laCY5ptkm6zxrBDf2msj+sJC4Sc4Pd0qy+ywgonLI?=
 =?us-ascii?Q?pyUM0qNKzqVlq1iZvhAvePjGd4L2jcI8zxFlbZs1xDWYq7TQvl9IwOdUf2+1?=
 =?us-ascii?Q?AVJ0Pwdkp+dYD7SHKWugvWuIZYcPhlLUeht0HKk/8qCZd/Be5erTRXFzRwBj?=
 =?us-ascii?Q?odTjsubV/2GyvJDJ6ekewZRnZIB6snl/mdzxPHd6oHNN3bL2mhqpLqhUO6qV?=
 =?us-ascii?Q?FkWJLLhja18OpbNmKIjQupkV8Djjwrx5Z5xJi6GWRmRx3jD9NyfvByFaBExQ?=
 =?us-ascii?Q?iX/IL/BUvxGMKL+UP5g80N0A5b6QWzBOoq31xQEbdvY4U/jJe0c7ENgto2k/?=
 =?us-ascii?Q?4Jnh9oe3njmDX8rPx/mnffacJSBKERvjnBBl3WS1J2+fkh2Fyykwyqj1ldv5?=
 =?us-ascii?Q?IqjiURq7vrdW8AoeMDb6pUOBHQ4+kiQpJVaUk4DY0IvkYUUTM0sq4v971ilt?=
 =?us-ascii?Q?qcmYQG2iAkTgjsX0QgSK1MqbjSt30IUx1MY0fqhTotlFkiHta7DZHPrZRlQH?=
 =?us-ascii?Q?g3rNUO/z4YatPlxUiYUEgXkG0Kc+cP1jtbzgsrjk+IDfrRul3zKETQ/7PaqL?=
 =?us-ascii?Q?7cR9dnctn174cAWbR0KhrukqsVXXJ0stOdhauMeRf7Q/pNvW5huJ2h+/sanb?=
 =?us-ascii?Q?DbBSpN2dp9xHOrj1vTxwZjVHP+pXxuhmAQ4Ctg5p/5dCBJNvo1/uxdgXmkpy?=
 =?us-ascii?Q?10XtIXPC7N+MuLKddoCteoeBNoUNxp6nndPKz8avvy8hofLKU8oFlOoDOrYc?=
 =?us-ascii?Q?Mvb8pNaCkgUVYEv3QEUdyOQOp5g4yJ+CU69TMZe9BTetCAowRvbl1heNd8bj?=
 =?us-ascii?Q?r4caUpXP3zcQrxedl5jslYStfuvoMzkOViao0B+xyxH7a0Z3WcwJi8CBxOKA?=
 =?us-ascii?Q?E9FCeDro/BmhJ0NhcPnjgKNlIpkC2a1xX2CA3+c641yZK9/lRnvYUfWro3kl?=
 =?us-ascii?Q?NvFDiS6rFbA3e7kNdgAAtV+sF5gf63x7UEe0eeRzP3bfjeJWOmuiJkoOmYqG?=
 =?us-ascii?Q?W8XR6njBrsn7LJ5hnkquoFZmhsf7DTiGPSNdQDvdb9N9fuE6f+YOortVV7XZ?=
 =?us-ascii?Q?6Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf50b34d-39e5-4380-4cd4-08de076d179c
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 19:50:26.4276 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4YmVn9TT/nEjkXv/zIk4D6kYc+5+Jg0rhBViqqiOXkuz6HIOjS2WTXiYkyvVJEo0V3YiplyQkSrTS2oQwZ/DCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8590
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

On Thu, Oct 09, 2025 at 11:42:35AM -0700, Vinay Belgaumkar wrote:
> Where applicable, enable media sampler power gating. Also, add
> it to the powergate_info debugfs.
> 
> v2: Remove the sampler powergate status since it is cleared quickly anyway.
> v3: Use vcs mask (Rodrigo) and fix the version check for media
> 
> Fixes: 38e8c4184ea0 ("drm/xe: Enable Coarse Power Gating")
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 +
>  drivers/gpu/drm/xe/xe_gt_idle.c      | 11 ++++++++++-
>  2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 06cb6b02ec64..51f2a03847f9 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -342,6 +342,7 @@
>  #define POWERGATE_ENABLE			XE_REG(0xa210)
>  #define   RENDER_POWERGATE_ENABLE		REG_BIT(0)
>  #define   MEDIA_POWERGATE_ENABLE		REG_BIT(1)
> +#define   MEDIA_SAMPLERS_POWERGATE_ENABLE	REG_BIT(2)
>  #define   VDN_HCP_POWERGATE_ENABLE(n)		REG_BIT(3 + 2 * (n))
>  #define   VDN_MFXVDENC_POWERGATE_ENABLE(n)	REG_BIT(4 + 2 * (n))
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> index f8950a52d0a4..0a112b8943b9 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> @@ -118,12 +118,16 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
>  	vcs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_VIDEO_DECODE);
>  	vecs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_VIDEO_ENHANCE);
>  
> -	if (vcs_mask || vecs_mask)
> +	if (vcs_mask || vecs_mask) {
>  		gtidle->powergate_enable = MEDIA_POWERGATE_ENABLE;
> +		if (MEDIA_VERx100(xe) >= 1100 && MEDIA_VERx100(xe) < 1270)
> +			gtidle->powergate_enable |= MEDIA_SAMPLERS_POWERGATE_ENABLE;
> +	}
>  
>  	if (xe_gt_is_main_type(gt))
>  		gtidle->powergate_enable |= RENDER_POWERGATE_ENABLE;
>  
> +
>  	if (xe->info.platform != XE_DG1) {
>  		for (i = XE_HW_ENGINE_VCS0, j = 0; i <= XE_HW_ENGINE_VCS7; ++i, ++j) {
>  			if ((gt->info.engine_mask & BIT(i)))
> @@ -245,7 +249,12 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
>  			if (gt->info.engine_mask & media_slices[n].engines)
>  				drm_printf(p, "Media Slice%d Power Gate Status: %s\n", n,
>  					   str_up_down(pg_status & media_slices[n].status_bit));
> +
> +		if (MEDIA_VERx100(xe) >= 1100 && MEDIA_VERx100(xe) < 1270)
> +			drm_printf(p, "Media Samplers Power Gating Enabled: %s\n",
> +				   str_yes_no(pg_enabled & MEDIA_SAMPLERS_POWERGATE_ENABLE));
>  	}
> +
>  	return 0;
>  }
>  
> -- 
> 2.38.1
> 

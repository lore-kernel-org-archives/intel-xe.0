Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E8CE6BF2B
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 16:50:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AB8A10E36B;
	Fri, 30 Jan 2026 16:50:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IEFu1I3A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A0FA10E0AD
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Jan 2026 16:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769791801; x=1801327801;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TnHLwlB7WTo/g/s/h6RXWHiMYvJn5v/RwwA5HPnVdkw=;
 b=IEFu1I3AKM2rcNCzcyf2wDsfO6LCxlBNKpKmgKBkVl+WKEdf2RR4Tt/7
 uRSw4IEC4tpTNdHDsrrbSpQZqfFtJ5mPmcJE6oAdnIhsTMnNpc+CZC7fW
 T98csCZmiJMqB2GIC2VTLws6Pupgfkd6Mu913TKUAB+GtpdM5/KNP8kTS
 1BI1B+FlGPPnZvs1FCB0PE9oD+ufZ2klQnF8HzQviUTQhnP3+4lGEs0fK
 2INwylJSxXveXUFiLrToA1zT1dgV4KCTsDCFCTTfk6Uv0UwyTHnr2B5WR
 FxKD2CBxqNGAz1CqIyF0Wjsy2eYGZ/8VHCu7aqdZrvsoBTCV32M7wyzwV w==;
X-CSE-ConnectionGUID: gjd087UqTpGx07ev8gG3Kg==
X-CSE-MsgGUID: oc0VkK1OQ4+ettYjE3Mh3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="70245450"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="70245450"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 08:50:00 -0800
X-CSE-ConnectionGUID: vbzdceUSTSqSnuZFYq4f5A==
X-CSE-MsgGUID: 0GXpdcByRNGz6TtS/BgJSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="212970112"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 08:50:00 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 08:49:59 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 30 Jan 2026 08:49:59 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.22) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 08:49:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aqza5CwNGw79hOIP5Z/Okw4WHWF5WiTEWqZc9jqOFRQ30rHcNmowYopN+q2BMbJDpiD1pH2ZWfm7tbxE8l7VtR286fC4EdSSFqCeiklRJ/ehovMAPU9tNIciaE10gzBnEW1UK7HBhMNdg2Ye+BU/MRCBC9hngiV2fjoGPOi+4splWzFRXAaYsNfRH/zloAOZcnCIXEU0bOlr0AkxKSGhgIFiL1k8GROFI24YMM9HGNrB2lmjRCOy3+Zl5DDk5wnQepWDPzx5LQOGvOhdtNVyFfBipoGMu4XkAMboMUIkXO3eNDgcq3xc3colw2TWYqQI7AB3qBff3E7gapRWVc44PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G3qthtrNFSCnbPffZNCsG6l9lDYRx8coMCv56kSDrJc=;
 b=MDteNDuFP8FGcLspAzU3mab/NhS/C8E8D8pE4fQI+KFt1fFoDLA/cwN9bGIgStVSvfU04JedQivqeT82ZcVnb8sCEmzaU+vVBVisn5kIW27FTAeMNcrgLuKnydiKhbQ3eB93aYLKBehjH7Z80jYHxquFCdY/s8kDfW+2t0OvL4GMvMqpev+RvRLmeNal9MdA0xd4F2ThXTG555H+zo+RbyHwOhJTTexCiU5FwXRyXlky4dym1f57kT0xMLVwo0W2qb+Z6KcoxpgRSNEZVb5WBqaGyJa+/EkqJS52ugy2ClNbjv4RI/vzzw8uhHQmFKS+gxJXbDgt1ToQPVsiq4NkdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM3PR11MB8733.namprd11.prod.outlook.com (2603:10b6:0:40::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.12; Fri, 30 Jan 2026 16:49:57 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9564.007; Fri, 30 Jan 2026
 16:49:57 +0000
Date: Fri, 30 Jan 2026 08:49:54 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2] drm/xe/mmio: Avoid double-adjust in 64-bit reads
Message-ID: <20260130164954.GZ458797@mdroper-desk1.amr.corp.intel.com>
References: <20260130021816.442958-2-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260130021816.442958-2-shuicheng.lin@intel.com>
X-ClientProxiedBy: BY3PR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::31) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM3PR11MB8733:EE_
X-MS-Office365-Filtering-Correlation-Id: cf03ddfd-20a5-478a-21e3-08de601f9970
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Z+6B2iNvHhCGQeyq580sQsVqt2LCvkp4GbFT39UcNBb9H4SHZqPw/0buVpmZ?=
 =?us-ascii?Q?AgKn7vnEqTafxQIupac0oEsDjkSWi91nvFKixOBfhY2cqQxS0MKNVH2Af5YL?=
 =?us-ascii?Q?1x70po7/8nch5yhSiaIl8kLtPzdFWBIPJ3gd+CZ9wpbnAF04kI/q7hV9pF44?=
 =?us-ascii?Q?ce1BJArymldq6qvQvGpKKqM69Zi3IoHONZG2uLRl4nBlD4nxbGIVkUFRuDD4?=
 =?us-ascii?Q?v3BkGJ4t9XMEPjq6TP/zN9C2Dvr9RvZEY9g2gkpUvmUN3JhtHW3aKVmQR0vk?=
 =?us-ascii?Q?Vj55eTbWFzG1KfEQZT8KbnHZalJggjJ/0EImXDieBx9eE3c60MBfB2UFubFa?=
 =?us-ascii?Q?OTltlfquoQu4D0fOkztWfkR5VqGZt0CsuGXacr8FpVS7Ky93AwUVm85HI32j?=
 =?us-ascii?Q?Lb6BMF2jWQfNyBHZyhPEX4b89K46LMjcvAM7BKjhEyKGbbr49cLYU95PdDwB?=
 =?us-ascii?Q?wG7etRr4Q2/pzTO3sBCImUpF58EWRj6B3PmsjwL9/4TVdEMnv2vrjggQToHu?=
 =?us-ascii?Q?vGBfAJPWDgLRPjcC8D5Baq8mNBTN7gfqu/j0uR9pBGTAX9sZABZEZABYh1SE?=
 =?us-ascii?Q?SyLmseA68LLMniffjYx/P7ZdR2+ejzBm1br/Y1gl9CAElRHJpCpfDCPAK5Hf?=
 =?us-ascii?Q?WIzPDMEp53ig6lTTNw8S/Rtc2AYoh75KN4eJlLpcCGD+5tn0inq1mgbqDgUA?=
 =?us-ascii?Q?0vXiojfPkr0SPUywJuBIEZCnDY9aYWLaR60aJCyDy8OesznifbjRcWVdFYae?=
 =?us-ascii?Q?K0L5Atvwlt9Pk3p8hcLHtjzKcqBJQhuu9eJahgtv9js8L45vtkx2sVxQ8+S/?=
 =?us-ascii?Q?ZGU91o2788xPlmHY5y5Y6p5KiQs9ZYCoNgFb5odHzey8H2ParfgHWiH0fKmX?=
 =?us-ascii?Q?RSZ/eSRAttRMQBOWvHTWm8jxISqE+nfMje2vTje8FxtBXT6jw0Ab3SgOB0pC?=
 =?us-ascii?Q?hdQPnG7EoupXkfEVsePxTFq2NmgzBml6uDK3Wkp98i/6bjq/HFNqt1ZuggEK?=
 =?us-ascii?Q?Vct3neOj8w3+O3AefGoBWTA3WaPUVGxFByxNtG2u2+t7Gq0YZIREKAVeD6Nf?=
 =?us-ascii?Q?AWseg8o/i3Xlgvh4W+SHpX0nVn6M/UT+8wibSqRM0O9LkRujPwLExef4qbSf?=
 =?us-ascii?Q?XfQ3mRHOOMdLgX0CUnGGajxOhzidgwhFRD3PBNdgRKCF1+VVFXTqKswNQ06N?=
 =?us-ascii?Q?mI8v5tutlZKYBpR9ykIIthZ5aMcBtwBN2rjLFWMbdWAcsl6R+aiod0E7qiez?=
 =?us-ascii?Q?5YpukEUO09HtEgv6xGLlk8KMCImSro0iniXvGQ/dYIltge4B56h0xuZuXQdI?=
 =?us-ascii?Q?EgblnWI1ALOVkKSpeCOiustrd2jsLpZDVe7x0MaIt10RLNV1B1jqPxH+IjaH?=
 =?us-ascii?Q?PbN5MpNWhpvvEiZ4PINFPMBIB+4T/M9nQ2TkLAk/DeskiyJBWXu4Py0WXvwH?=
 =?us-ascii?Q?8EwYxl2QgfmG7KGac3YmFiuHxRCFjF12tIwddzY8LYPeHbk1QA1RnHaOSHoJ?=
 =?us-ascii?Q?r31DIJ0pn/CMqgLSUg1ZMVKig+njwai6jD/yfQ7LrLMJjOVQKEAw0/orgjkN?=
 =?us-ascii?Q?Ve+yADxSTy2VDlOAqqk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tArFlGFf5lTLXjIluA8N13Qb/ntMujVkuo27Dt469/uUh2NAqJX0ACcXCOlc?=
 =?us-ascii?Q?3+q0DxWc0uU6+7TTr790RWiXKUwmxJEKud/kbdExDPS2m1B+MSgHNDgM4h3+?=
 =?us-ascii?Q?N1EzsOEKxdJxghXna1YinrcDCZTqRwOkcilxVbcEExDkOGHyMDnAAyguTT/+?=
 =?us-ascii?Q?Scr+o0w1oVjZbLHdMZ1bqouhMxIjgNiliMioOqTPUWRD7A+ZRWZ9h0ujEz1a?=
 =?us-ascii?Q?zHwn8WbKiAKqDwC0AsN3dXWb3zFGVH1TAOu5kD26tks9o8Dl8oUm+1JfrGJG?=
 =?us-ascii?Q?SfDsJzT8g/O3JCaBOjsWNZc3a0HeIkDrVsBc6BXJoqcYIR4RuKo9YBs8MMwo?=
 =?us-ascii?Q?DMzP30oMuPIFBxvp87axtc0rc+Ap3gdCaSnrS2Gn+itJdKxQKtlYMJW6Y1UA?=
 =?us-ascii?Q?6phNjZ9NtHA7t0vx99WUBWHL1CTIBGxkdqFIfHJPMTr6LqOU6Epc+Rh19n3q?=
 =?us-ascii?Q?UbXAIXSDbEBP6z3DdUE4EKLbF6V02F9wk+RxoxwXuQ2A7y4wYoEoJN/aG8Ur?=
 =?us-ascii?Q?A8sa9olYFeRaocT364hHDcSz7yBsIYYsQD5iwMVbJUiiws0v5zMnN8Gmrq9V?=
 =?us-ascii?Q?4V8eMv7yRAhpeN42AbROGYrmjpIHayjnNaZEg8kp68ocYRFljeTEQXkrTuSB?=
 =?us-ascii?Q?xuFKTuidbfxGf7ufiJgBvHQZk48lw9fRHtLRoXqZIBbUr4XADChNxTTZIYXb?=
 =?us-ascii?Q?ZMLtHo6ZcI7xUh15k5gj00CeWgHjV2iUzwnc0NjwVGUXPOujincJuMFd/SxB?=
 =?us-ascii?Q?j3+9WgkZaU/Kac8cVxktx4UFVUFl/iRKLl1l0S36n7gXglaArs5uExDsRS5d?=
 =?us-ascii?Q?DATL0jUrF54hQxHwWB1bL+J3WfGEtnebY1OPXz1alHpZFugtu0hQ+bHVG4n8?=
 =?us-ascii?Q?Bh/dr7wKY8Vxm3PqizVQd3IizXnVGr2Uc2ZyAOQJCGI+CjnqOI8MIjfMgSP9?=
 =?us-ascii?Q?VHOf/yUXOrWcb81xu+NLM5erXupSN3Xpy1Kk/v4yCYm80G8bAIZHwBFhXvYf?=
 =?us-ascii?Q?q9H1OxaarN4+avPvp76qQZycOpOPK2IHgWzCLeec2KsJgbZAY5XAPnTK+tt4?=
 =?us-ascii?Q?cku01ll6NZPRW9AUVshgGDGnKtnAtTDpxOwLTdneILGBglZIcnmF+SP4CysB?=
 =?us-ascii?Q?AKKBWZz7TvJuwjVo7iVAC/+4EuNLDpbP8ca/H3Kf/8pGmXPZ4xkRw5gjUUct?=
 =?us-ascii?Q?uFZAOMJABj3UDoqI4r4QoFs6///TOE94oSoPM56yC6bk25JQbue2g7LUl2uw?=
 =?us-ascii?Q?5QDdum191LwVgeYkakEGTjXQNGwrdMvHf4UeL/9OVNP8jqXXR0qXb/7H7EyE?=
 =?us-ascii?Q?JHHmLA+oD2tUR/PJYKahZWbgxdWeqNlyzbpx524dtWpm9PyDs7P/rVKwb2kL?=
 =?us-ascii?Q?FLdmoxysx6JmryFHutr7Xm9PIIgVDlxCnw5b4oWBSWI9lX5NsL3FH61Y+S8R?=
 =?us-ascii?Q?X4tpy8fZwBYGwh8qd9khbQlAy2Ea3Bf0LVlChCL9xCEYTOzQsXtgrRlbwuUq?=
 =?us-ascii?Q?3yVVqB5VFLU1NGhI2IkasGrHagiSG092BobB8wnsDgwsbJzHpF1jDlokYjxT?=
 =?us-ascii?Q?70I2dkx9aqtYeMAwQUoEL5Xjvr0nCMzwNTewDwecnhm5kIbiFd9EUG6dZv1B?=
 =?us-ascii?Q?EnYPXWZ1iRRqHfkoFoOuNYy5PlMkRr/2RHQo23ATrcF3YinEs36u+MaXOQff?=
 =?us-ascii?Q?+SnyZj9wQ49R+dr4LW+ubzRMTRmtB+SgdcOgIROhMiE9rBAZwORXiMnV0zsE?=
 =?us-ascii?Q?fTnIIeMFjA5VX93JrwmjXkhuTN+5ZTw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cf03ddfd-20a5-478a-21e3-08de601f9970
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 16:49:56.9607 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CUT/UZUByJESiNhi9seUT6a0aVPre1gxczqbKleJONCd57LNGIB3HtJn3ZRDh4tuPgqwqu6vte5LN8Qp991UK12TGlcvZcznoyHGRVZH7ms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8733
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

On Fri, Jan 30, 2026 at 02:18:17AM +0000, Shuicheng Lin wrote:
> xe_mmio_read64_2x32() was adjusting register addresses and then
> calling xe_mmio_read32(), which applies the adjustment again.
> This may shift accesses twice if adj_offset < adj_limit. There is
> no issue currently, as for media gt, adj_offset > adj_limit, so
> the 2nd adjust will be a no-op. But it may not work in future.
> 
> To fix it, replace the adjusted-address comparison with a direct
> sanity check that ensures the MMIO address adjustment cutoff never
> falls within the 8-byte range of a 64-bit register. And let
> xe_mmio_read32() handle address translation.
> 
> v2: rewrite the sanity check in a more natural way. (Matt)
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_mmio.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index bcb6674b7dac..a1a05c68dc7d 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -256,11 +256,11 @@ u64 xe_mmio_read64_2x32(struct xe_mmio *mmio, struct xe_reg reg)
>  	struct xe_reg reg_udw = { .addr = reg.addr + 0x4 };
>  	u32 ldw, udw, oldudw, retries;
>  
> -	reg.addr = xe_mmio_adjusted_addr(mmio, reg.addr);
> -	reg_udw.addr = xe_mmio_adjusted_addr(mmio, reg_udw.addr);
> -
> -	/* we shouldn't adjust just one register address */
> -	xe_tile_assert(mmio->tile, reg_udw.addr == reg.addr + 0x4);
> +	/*
> +	 * The two dwords of a 64-bit register can never straddle the offset
> +	 * adjustment cutoff.
> +	 */
> +	xe_tile_assert(mmio->tile, !in_range(mmio->adj_limit, reg.addr + 1, 7));
>  
>  	oldudw = xe_mmio_read32(mmio, reg_udw);
>  	for (retries = 5; retries; --retries) {
> -- 
> 2.50.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

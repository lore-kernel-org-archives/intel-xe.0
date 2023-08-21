Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75EDEEE4993
	for <intel-xe@archiver.kernel.org>; Mon, 21 Aug 2023 16:06:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 351B310E1E0;
	Mon, 21 Aug 2023 16:06:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8B1510E1E0
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Aug 2023 16:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692634008; x=1724170008;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=igvbPafB6X63fa+i3TLSPe+LcBed7VL0orqkqCcQTq4=;
 b=h7kN4Rgyy24XvoKcs15RExARfREE7ePNhJi6MAHZPdf3o+HNyYYyOznA
 F0TGUgCt6acoPHjfyqgFcdZYZ/KBopCwvK/mcnMhqgCRhar39QJ1tGeaZ
 cpN2plpH1xHEQOlxNKyJwLZbwn1nLWyv9RE8txi1Ywgw2HFeeZ/mjS59Y
 zBRcds+dBLR51qmo2fugrLVeXq0dAq9KdlaDN/WiUOdqGvmPE/papE6e+
 o/tvUo5+yh67+0ni54VBSgb2N30RmVspMIoDjBrP/5UEFdYjLd1pE4KcS
 HFR6f94g2oxbfv9UbfYa+Q46WiocgwVlNI6QYiOxN7oPK+gxxmGuA3VV7 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="371062740"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; d="scan'208";a="371062740"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2023 09:04:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="879561578"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP; 21 Aug 2023 09:04:21 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 21 Aug 2023 09:03:58 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 21 Aug 2023 09:03:58 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 21 Aug 2023 09:03:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AVBpZTTgasO3w68FEhpohwqOoDrj55rrQl+fcJxT9shR60fKq/nTxmNeQcKWUC5PN4eJ1VVuOyNClkoUhdWWAMfsK08jUWgZC0+nzluOuFnj506YrHIjKpJVmv6DIZbnHKQ1GhKOb9HBuX8Vcg5U1mrBbRSd+wPnIT5dp7x5fN8HAxQQCoQJJSPoRDYC2Dt22kBzlkG0R62AlK8J65tB4WlWDRHHsQMY+vq00RDYHQof42+0Lu9qfyghpq+wtNszxEWjuvItcr/pVnQkneZVS0OcijG4QYWLTL0uKiGiPgyWInohDEyG7qESngdDPiSjyL6gLyx7D+WM1aGhZqQDGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6V2VpyL/Gq7emEWGbGdsL+SJU95cOX7WOA0sQM0xifw=;
 b=kkc72UxKKBpgRwtnY9aH9+MY7g9fZrgPtAbHtoEe1cvx0oMFgwjDECGeWMpSJsliO7Y/dL0JBYYtm/B3ovBJ5F49aIi13DWp9i/89u5Hs26oUJGCTPV3NgR82nFDXlQlGyCCFnH3FVgNGo8NwX/TCLl6NCY2yJbGeLARqaNbrw6RgSQUmPs7GuS0sdjgFULGC9fHPbSWFuRKRxt1jONArrhk6E1n3Ha10nHsAB9WxF9C4zW4Em9YJRmJAYeIdBUH15yoSclW+6fF8viIvSMvuD+nskkXoEZVeo6TuDOd+undgJ2MpNXRoOB3Z/qUesZ1SOKmaymhgN6GizrEYzNMuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB4782.namprd11.prod.outlook.com (2603:10b6:a03:2df::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 16:03:19 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79%5]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 16:03:19 +0000
Date: Mon, 21 Aug 2023 09:03:16 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Message-ID: <hwe6d7pbsibj4lf46gsherwfsq3pzayxvofwlvhj3k6ahwradi@hhwryrzxq2ty>
References: <20230818220824.700519-1-lucas.demarchi@intel.com>
 <20230818220824.700519-9-lucas.demarchi@intel.com>
 <ZON7pQL3RH8ZSaPH@bvivekan-mobl>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZON7pQL3RH8ZSaPH@bvivekan-mobl>
X-ClientProxiedBy: MW2PR16CA0021.namprd16.prod.outlook.com (2603:10b6:907::34)
 To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB4782:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a838b06-b35c-4ca7-b72e-08dba26022ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xgn9Fzu1P9UyAkI9mwYUAWdMKnpE3ko2o8nRExFoAZrQVGXoswGxi4FeVJV5isMuAgH7F7teqmpLb8bhvYNpoCX2seofl9WJ4LsB5fii+IpnlMH7H4BpqHZtDDadRQ0wOHsVv/dJG7NDYmkbFagGVkXYejDm9Tdxpnb2MJJ8vzIX9jjmPBOF0msmozFpQRHBlRfAF2o0apSTUyusUGjI5xlQLaFD/4IYcveLTdZy8cDpZCXtUTFGfffFZI1ggsVwvH74rvM8Z1YcZHOlWfVB2WmE56Srh4uvvD/eNSAL/vx15KZMsExSJMRzE10japijePLMXq6vIUXjH04uH2V9tOxQABg/a0/m9ekc8nqCgavV7G9i5Sfmdq2O6CLD2BJBKFtdB2UwxeULGLGhwK6CFuMD8KyOu40OFqGlAnF/rA36zMVN2FQ2P/rzz2ApUmmTrQJQR7Yij5+68kGMDWHUu0NG/E43hg+SN+ncYn9Ty25Xa8Qa8uoQiAWknJn5Ixs3PaAmdS2kZGHvAAW+nyxeGjrU+bC1wV+wxWeI0Gd4tTYUshVuXiMSiqn/Tu6zLZaT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(39860400002)(136003)(346002)(366004)(376002)(1800799009)(186009)(451199024)(6636002)(66476007)(9686003)(66946007)(6512007)(66556008)(316002)(82960400001)(8676002)(8936002)(6862004)(4326008)(107886003)(33716001)(41300700001)(478600001)(6666004)(38100700002)(6486002)(6506007)(2906002)(83380400001)(86362001)(5660300002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U1mO9G9RDXWU7Z8ONiuokqxeFXqofCjf2zLfpBVsxKC7FzqkdeIvKeWkg83O?=
 =?us-ascii?Q?2TeZPiAFxXXU6KGfWlqcoKyjrEnB1HlLxxE2dmHCos8mpj5W2rhDXElw/qLT?=
 =?us-ascii?Q?ab0RtGJaeeypNBHo1vSshLdm/PIZFEsH43bvgLVJJD307Kw5376ZIluTs9OZ?=
 =?us-ascii?Q?qeArqq6FqImHtm0VfDZmFb/rp5mTC+jAkBRIAN2+GUv1k3I10XV9DKQhGZUg?=
 =?us-ascii?Q?iwLuRJtgn1jJvc3dqcNPQHsrMfPt/LLpuk4eTQBH4mq7nWujNHi+qSQWdvg7?=
 =?us-ascii?Q?A2kixoZZnImGMT6HABKxXDxc11ZxXxXZYPc+yJ7SZKVLvc5fb7Zse1pA2PyG?=
 =?us-ascii?Q?r6n2sMoWsnSwZIyXe+5EOttn8uFog6hk5OBeR4ryqGxRj2kdNpEkFOsOnlgD?=
 =?us-ascii?Q?Kvwv4O3YrCBEHeW3+g+6VGMKoydfoIsmFEn/AipfjW1n/0HZcQpgl6s782yM?=
 =?us-ascii?Q?0P9dRjQAwYDcyrwtxjNi7SM8+eRiSzd2IDomMIqHcJ5Vh5POqyCmQcwrsR70?=
 =?us-ascii?Q?VqBg+l6SIorVHoj9qS+lYS8KQrho28DMpH8wEWLMS1fBQAHeRDZyvc0kxh9E?=
 =?us-ascii?Q?wZqHz6AsVe8HfOMhXb5yn90iJz8nu+qMNBMfD54xYivHhItkDJ5Bzyokwlnl?=
 =?us-ascii?Q?QVvaVPjkWsM95Bv6n9dn3NdcVAfVehWBIKFA2+gq5lbVNqbmHomAMWjnV9do?=
 =?us-ascii?Q?2rGZkCXbZqW3UowQDecMlkhioQPsBbEBZjASk62SUYz6oc4y0oe1Z8fNFeCa?=
 =?us-ascii?Q?sFf+0xINX/cVf/wxHNz9lZNFaHbXQinzoANfmEsG9GdOosTFmKydCH7M705Q?=
 =?us-ascii?Q?Fr9M5Q4R8O18StsbA/8HDC6XPvCxNZtwFLYKZWd0miaRolKGxoUwUnPKohz8?=
 =?us-ascii?Q?rf+xVbu9uhcFSun2TrkhmW64PqZcT+7kSzKs3cfT2Ufqe+dJkZ1YG8BAEcEb?=
 =?us-ascii?Q?ukOkNcad0rQUve8ehcJofS+paFnx8z6Sun0PT4+lyawJrTRN2lmHdmmBlxwc?=
 =?us-ascii?Q?y3dOwbygh3kp9WfQUz2dMB8+PI47LZ0j5IrUsrzb0yIDltqNM2jWmGM42KwF?=
 =?us-ascii?Q?3WOj5nhAhcJ0HxIKjUEGZAIu+KLqZcfy92zRDen4xPQY0F4cp2AVbB65U3ch?=
 =?us-ascii?Q?sVhI4+srmfBn3c1XK8i/2tlY/hqV9suZiNzBrGnbo62j1CscEeCYEJaaqzhx?=
 =?us-ascii?Q?DO5WoYwBwlflQEw+PcXhip6bBe0nvGcUZUuFL/OlM9Xc+J2Xnt1Xj4QUhU/6?=
 =?us-ascii?Q?wQmH901z2jTia1R+4631vZUzJyTdRNSNf4KAeXXuTrJgu2Fm/yjNhohKaeK2?=
 =?us-ascii?Q?EHQ1wB61FnZ28Ks8m/7If/TpzlfIw84I/77vFvUES1zAf5NVmf0EVWguuZkP?=
 =?us-ascii?Q?5wcnAKaIPolHRiPMKXem6FZav7MFhnHBJrBwEi/Rr1i4bhkZaBxUAQZpcoJr?=
 =?us-ascii?Q?vK+bp34Xrj8Ojg8lVXfF3CHznnLq8wK4pOIS8oEmt811RTVQq32GHjKJGyGp?=
 =?us-ascii?Q?IkVhH0Zh/Yolq2sDeyqYuye6E686YTFUoaBIsAgldwc4uchEgvfvJe5D89ja?=
 =?us-ascii?Q?gNRJ0Imp3J/75IuqxNjZMkTOFvClSWV7Gyzkf92GI4yj0XvsNioSmlu4LoRL?=
 =?us-ascii?Q?LQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a838b06-b35c-4ca7-b72e-08dba26022ed
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 16:03:19.2470 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wKLPR+JbRV65aFEbZVDKZFaPeRj3dVIljAvAQJhn3iUbgkUjNPY3xHPUr5CWaISNhbrwvPHxfNEtlmsiAZLr1DraStjc31/QvxMWNT3cHd8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4782
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 08/15] drm/xe/xe2: Define Xe2_LPG IP
 features
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Aug 21, 2023 at 08:28:45PM +0530, Balasubramani Vivekanandan wrote:
>On 18.08.2023 15:08, Lucas De Marchi wrote:
>> From: Matt Roper <matthew.d.roper@intel.com>
>>
>> Define a common set of Xe2 graphics feature flags and definitions that
>> will be used for all platforms in this family.
>>
>> Several of the feature flags are inherited unchanged from Xe_HP and/or
>> Xe_HPC platforms:
>>  - dma_mask_size remains 46   (Bspec 70817)
>>  - supports_usm=1             (Bspec 59651)
>>  - has_flatccs=1              (Bspec 58797)
>>  - has_asid=1                 (Bspec 59654, 59265, 60288)
>>  - has_range_tlb_invalidate=1 (Bspec 71126)
>>
>> However some of them still need proper implementation in the driver to
>> be used, so they are disabled.
>>
>> Notable Xe2-specific changes:
>>  - All Xe2 platforms use a five-level page table, regardless of the
>>    virtual address space for the platform.  (Bspec 59505)
>>
>> The graphics engine mask represents the Xe2 architecture engines (Bspec
>> 60149), but individual platforms may have a reduced set of usable
>> engines, as reflected by their fusing.
>>
>> Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_pci.c | 19 +++++++++++++++++++
>>  1 file changed, 19 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index 46e3a9632efe..ed6c4bf8c63b 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -176,6 +176,24 @@ static const struct xe_graphics_desc graphics_xelpg = {
>>  	.has_flat_ccs = 0,
>>  };
>>
>> +#define XE2_GFX_FEATURES \
>> +	.dma_mask_size = 46, \
>> +	.has_asid = 1, \
>> +	.has_flat_ccs = 0 /* FIXME: implementation missing */, \
>> +	.has_range_tlb_invalidation = 1, \
>> +	.supports_usm = 0 /* FIXME: implementation missing */, \
>> +	.vm_max_level = 4, \
>> +	.hw_engine_mask = \
>> +		BIT(XE_HW_ENGINE_RCS0) | \
>> +		BIT(XE_HW_ENGINE_BCS8) | BIT(XE_HW_ENGINE_BCS0) | \
>> +		GENMASK(XE_HW_ENGINE_CCS3, XE_HW_ENGINE_CCS0)
>
>Bspec: 60149 lists more BCS engines than what is assigned here. Is it
>intentionally limited to only BCS0, BCS8.

That's only the mmio address offsets allocated, it doesn't mean the
platform has those engines. See BSpec 70815: there's one main copy
engine and one paging copy engine.

Lucas De Marchi

>
>Regards,
>Bala
>
>> +
>> +static const struct xe_graphics_desc graphics_xe2 = {
>> +	.name = "Xe2_LPG",
>> +
>> +	XE2_GFX_FEATURES,
>> +};
>> +
>>  static const struct xe_media_desc media_xem = {
>>  	.name = "Xe_M",
>>  	.ver = 12,
>> @@ -320,6 +338,7 @@ __diag_pop();
>>  static struct gmdid_map graphics_ip_map[] = {
>>  	{ 1270, &graphics_xelpg },
>>  	{ 1271, &graphics_xelpg },
>> +	{ 2004, &graphics_xe2 },
>>  };
>>
>>  /* Map of GMD_ID values to media IP */
>> --
>> 2.40.1
>>

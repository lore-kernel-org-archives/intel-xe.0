Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 234E9C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 00:43:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B64B710E7D2;
	Thu,  7 Dec 2023 00:43:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9ADE10E7D1
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 00:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701909794; x=1733445794;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=8TFg9ySZAX9ib7oq9m2NX8VDf3H41ltfql/MZkNV7P0=;
 b=SZsUTvSgzREQdTVgDVwqf0sxikSGSEX+CofvpuAztqqAP9i9Lbf84IlR
 tlKmGTdTRc/K5sdZGLI8fQHJGp5FeIu3YutJhUUGqQP7zTw64wDw46mSm
 89tAdrMcZlykvoQE/0Vhm6y7iFQX0rkjarJcXdExJ0V27LgTKGAmqHowT
 4AVyqwLTYEczC7l6wnIzUKysdI7+/UmhZ2g5bgmK4MKhkAkVu/n/Od6Gu
 o+LJnJEg7H4gxeUkb9+jjLAIrwmKNxnl1m3LiwWWvHObu5+54Fh/8BJgD
 4IrYq9hQ+I+de8T5afVdd8QMbvTzGdrnmelpwhUJfzGzoXKH/NJXOwLw/ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="1035524"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="1035524"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 16:43:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="915373208"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="915373208"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2023 16:43:14 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 16:43:13 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 16:43:13 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Dec 2023 16:43:13 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Dec 2023 16:43:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MqgWLN8aCNpyP/dwgXbqfhIYYbg9C2YPUHYK/zMqB5Aoy23E4vAxotSvbc8tUsoC41HyLYynhKAoQiUP5i00g4uhhnSesiqbcN2KN/uWxr4TTFiN3b2Y8y77dfQsVHQBhwP/eIx+1xG6+6u66DO3H9TbSkZSqzEJWLU5VAyoxYQgNrgWS5cZJKBxznrGT5fXcN2GsRfdXhy78m3ipRaGdvkgk5B5LKlw1G9gonDOrUlwsfXl863nLZRqE5xhSOPsBK6xtJXCq6ha1Fp/AJXKEVjMKLTtkFI2ZVkIbeZrlhaKepx5QD81zHobcSrko8h9oYQyaDs+bDTikOj4H3CNIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qE0q7DHAjErBPKFYlbHzYHwVEY7rkL5+evUoZbQUAqs=;
 b=P6cXMlK+W97GB/UX2yEsodNS+gPLJQMgUKvpz5lTlmhHKPEOTdU0UEbE2Cb82yCYZB7Izrm0+AJcM9gMW+PmKqmYEyFwprzEtrKgtd8U1g243G1Gucq8H0JEySK0ZdPfWVlzlIW3F40cdTw+S0G2abWRm1lKxzvf28satU8XJ2m2LDqqNejyaE2YnTPqvGxOsKU2INfMvdC/zJSe+bXCH7EWAqSUSExGP8uPx57IuCpDSie2BeiIL8Nqac1hy0iyTubg3bW2U1stybYolW4Jpf1beLk3oQe+WMB+bwJmFLAdiDRskgG1Pkzsx8ZotjrZ0LQSltnyTIokIe+qAQz2Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5365.namprd11.prod.outlook.com (2603:10b6:208:308::18)
 by PH7PR11MB6548.namprd11.prod.outlook.com (2603:10b6:510:210::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Thu, 7 Dec
 2023 00:43:10 +0000
Received: from BL1PR11MB5365.namprd11.prod.outlook.com
 ([fe80::a5ce:4516:92b4:43ae]) by BL1PR11MB5365.namprd11.prod.outlook.com
 ([fe80::a5ce:4516:92b4:43ae%6]) with mapi id 15.20.7068.025; Thu, 7 Dec 2023
 00:43:09 +0000
Date: Thu, 7 Dec 2023 01:43:07 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <yskn43rwevdtoffsdpj54dcqsvltjf4mu4ubog7cv55cytmgvl@okedhpmnqnij>
References: <20231128151507.1015-1-michal.wajdeczko@intel.com>
 <20231128151507.1015-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231128151507.1015-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: WA2P291CA0015.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::28) To BL1PR11MB5365.namprd11.prod.outlook.com
 (2603:10b6:208:308::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5365:EE_|PH7PR11MB6548:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f29f10d-10d0-4f8b-fe7e-08dbf6bd7c28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qc+dSljqpUdHzS+3lccvnu4r3PKXoBNQKP3UsvDSM4h89BCuIxvvy4iXhzjSpqL3bIyjriMOAjRwCITm5Ua2nh0cD2eoLS/ou5aQDVHRsGUN7pm6rLNDeGDOXGFIjttocWOEJz5D94lUeSg/zxi2Ud3rKv4HxC+37benMG01zJtXfYzSQaIpUyg9yK26tVOJr7Dcl1bZ6h5P7uEfmh0qXpPnVC7vwkVewfyUtXdv0CB26CgIa5p6CQ8UR1WbcNvqgPIFDzW3IuUx0Hk2x/pXy3FgzJEjdrFLWXIFHzwKE9lvXNBGUcV0piAJruVix3Rz7eWJ/Sy5IN/LOyHCOYz4Oa+Hu3yb+THDtawwGfBwv+Tw2dxxiWG/lUx1Suhjo7SN52pAdvTNSdMO+q0KJEa2IUQ55oVxrZjHHPufxv4YRN8zdp7NAovpDP7AIwTzTP2paO2AJLGqq/SxxA1VAHJGYh3klA4EfS9EIvaaPzpzo12UwnWNA0hT0XWoKE23/UZ0r9nvc6pBA5C5Pqk/s1oosFsgvXtOqdfv8Lg2tUmsgdI5lxNGRlaYlfKJtzHOYu/pzUDV3krENrqOepJlMTfdrtFSLJ3bflZjTD9iDdGkkZY4ri8eNjui1wWTjnTMHyHp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5365.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(346002)(39860400002)(366004)(136003)(376002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(26005)(9686003)(83380400001)(33716001)(6506007)(6512007)(38100700002)(8676002)(41300700001)(4326008)(6862004)(5660300002)(8936002)(2906002)(6486002)(478600001)(316002)(6636002)(66946007)(66556008)(66476007)(82960400001)(86362001)(27256005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFdNUDdqNnVPbHJ5QkplcU5LdVNud1QvV0VMOWR4YTIrTkhJbWZobVk1aDc3?=
 =?utf-8?B?UWxsR1h2anJzSEZiYmhrRVNHWXZNM3NxWjY5Sll6eVp5SjlCRzFPbWFYUWl3?=
 =?utf-8?B?TS9BaDFEaG1ybEdXamg0ZHNHdGl5RFpSYkxqemhYYTZyeVk2SzVNMDJXSjZN?=
 =?utf-8?B?ZDBjdGh2WlloenBUQ2sxTzM3MzhQUE1LZ09jZWcySm9YR3hMalRjVXhzdEo1?=
 =?utf-8?B?T0RLUnhhTE9kNE9yVGRoSVJlMEdxK0xNUi96WFFPTzdwUlFyNjkrdG0rTS84?=
 =?utf-8?B?T0hZRkpLYlJQSVFwM2l4THNFMW1ucWlPSVphNzFiL05HOGJHZ1FQRi9oYW1Y?=
 =?utf-8?B?UmhxSU51S1kyN3Zub0tLMmh2dWRZVDEyMGtHWTRiZm1LR0ZLdE5IK3dpVFZi?=
 =?utf-8?B?TnlpMlR6YVdaM3dhUW11d3hUV1ZjMVRCajAvYld0T2YvTHdZQUpabEJxbFBy?=
 =?utf-8?B?eWJOLy84ci9uMnlLMGUrUTNVRFBKRmNkNUN4WmhDdml2c1Z6SmVTblpHT0N6?=
 =?utf-8?B?eHBQOEJWRnl0d0FtR25OMlRWcjdrOURGdVNSR0hFcTNieFBFWTFsN1FXZkhH?=
 =?utf-8?B?ZHh2N1VleVVIQWlnZ1hBZ1FxaTBsbmpoblhrUWtMMjB5M1c2cHBSRVVYOHcr?=
 =?utf-8?B?NkRLZlYzSEJWNHgyaGRRa09SN2lZcUM4Z1ViT2VlM3lxcmV2emtxSDN3djZE?=
 =?utf-8?B?MFY0RnhOSnVxaUJVL2I4TCtNYVhhbkZvQ003SkQyd3VXZGdpLy9NbHNrb2dX?=
 =?utf-8?B?NERmNk1DODJFcXVKRTdTa0d6WUxtQnQ5VHZQRUlCTTloN3prNms4QWxSWlhP?=
 =?utf-8?B?b3pmdDQxTG43bHlBMXpLR2NYQi90RitreGtoZkhrYnhhdFhOUFA1WStsY1Ux?=
 =?utf-8?B?aEFtSTMzc2xKeDF4dm1qcTYvSko3bnFnbU96cG53NlVuam94UVVKUlRhcGxt?=
 =?utf-8?B?bzBYbDVpZElEVTFGVURUM3FjMWh4aFVMZE42NHdYT2lPU0hGQzMvUk1LQzIw?=
 =?utf-8?B?dlkxZVF4YzZZWFpDYWFIVnFmWkc5N1Rlazh4OTdTK1kwblJ3MS9aK3RrRGoz?=
 =?utf-8?B?Y1NIWVUvQTY1UFdNSkNqdHd3VUdzdHNUMThaUkFBNTFaQm1RbkxrWVVhdmRn?=
 =?utf-8?B?Yjg3a1Jwc05rd2ZoYmJkeGRYcXJVY3NMOXA5TE0rMi8zQU01bXF0TldBdlRx?=
 =?utf-8?B?bEFHRlhQSlZLcGx5MjRKRDBsUnhTMWVjeG5jSTRHY1N5ZWdlUHMraU9pa1dN?=
 =?utf-8?B?aHkzKzNGWHkrS3Z5Tzc3Wm51eTZlRjhlMWdXcHlMeUVjVGprb2R0RGF2VVVF?=
 =?utf-8?B?SUVLZUt6OVB6WHdtTHdYR0JBVHp4VzZLOFB0YnRvUnB6M21FT0FKb0FuZi9P?=
 =?utf-8?B?UVVUQzVQT0FtKzB5dU9SNHFKbkdJUWxSWXV5NWlTMVNDY3lZQTBOZ01wVFd2?=
 =?utf-8?B?Z2F6UjBWMksrM2ZQUTgzN1d2OVdFeWJYRzMwTFpqRVZKQUE4ZXhDR2dmMXpm?=
 =?utf-8?B?MHdybWRCWkFXTTNNK1Ird21ZYXRseDhITWRRV0Y5b3hlaHptTDhwL296VmZ4?=
 =?utf-8?B?ZUpxN3VRVFpEY0syTE1nS3lpVWFLZEFkYXpSVGRJUGpRVklUV1FTaGp4dmN1?=
 =?utf-8?B?RExwVW16MG0xV0dqclJROWNzYy9WaTFucmZVQXhrWnczOGswalRTV3JMRjlJ?=
 =?utf-8?B?YWNFZHdPcUlSeVdrZFhwWnFoUGJweEdTZGVnbFVlRlZOS2JXTCtMNWJPVzg1?=
 =?utf-8?B?bVFEN3ZoanE2V0VMd25ZN1cwL1BPQXEzd1FoYUp4WWxqMStSdDBjZW1kTjk1?=
 =?utf-8?B?Y3hZSVBLY0o2aTlobXpTeWU0c2ZsTHNFcnBEQkZnY09GeW1jbFJvNVhQbWps?=
 =?utf-8?B?cSthN0hOanIwaW4wUS9BM2V6ek45dDM4U0FCaWJpWUI0clk4SmR2NUlaUjMw?=
 =?utf-8?B?dnFrNnFYeUhSNFlPN0wvZmtOWVF5K0hsakQvaVNBTmR6SVp4NzMwU1lRRHVQ?=
 =?utf-8?B?cThWU3RydXpuSmJjdU9Ta00vb2ZjV3ZJZ3p5RHBhNDArY0w4OU9FYkZ3OFBD?=
 =?utf-8?B?RkZ3blZNMkZjWk5wbEtlN3p0VUVnTFh1L1Q1WG0yc3RGWTFtZ2RkbzE5em50?=
 =?utf-8?B?aENOWWJMWU54ZkdubjdlSHJaUXIvTVVPTG80NkJlcWNmR0R2aVFGekdrQStu?=
 =?utf-8?B?c1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f29f10d-10d0-4f8b-fe7e-08dbf6bd7c28
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5365.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 00:43:09.7253 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EcV3wIDsyWnEBLb7s9bHciOz1qOA4zlLkysEnbTWlSguVVttgx6OXROo356B/U6kK5FybiezoRgPxw1vEEIupN5VFrlfWsDI4nuisnFLSdI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6548
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/5] drm/xe/pf: Introduce Local Memory
 Translation Table
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Nov 28, 2023 at 04:15:05PM +0100, Michal Wajdeczko wrote:
> The Local Memory Translation Table (LMTT) provides additional
> abstraction for Virtual Functions (VF) accessing device VRAM.
> 
> This code is based on prior work of Michal Winiarski.
> 
> In this patch we focus only on LMTT initialization. Remaining LMTT
> functions will be used once we add a VF provisioning to the PF.
> 
> Bspec: 44117, 52404, 59314
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

One small comment/question below.

> ---
>  drivers/gpu/drm/xe/Makefile             |   5 +
>  drivers/gpu/drm/xe/regs/xe_sriov_regs.h |  17 +
>  drivers/gpu/drm/xe/xe_device_types.h    |   8 +
>  drivers/gpu/drm/xe/xe_gt.c              |  10 +
>  drivers/gpu/drm/xe/xe_lmtt.c            | 502 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_lmtt.h            |  27 ++
>  drivers/gpu/drm/xe/xe_lmtt_2l.c         | 150 +++++++
>  drivers/gpu/drm/xe/xe_lmtt_ml.c         | 161 ++++++++
>  drivers/gpu/drm/xe/xe_lmtt_types.h      |  63 +++
>  9 files changed, 943 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/regs/xe_sriov_regs.h
>  create mode 100644 drivers/gpu/drm/xe/xe_lmtt.c
>  create mode 100644 drivers/gpu/drm/xe/xe_lmtt.h
>  create mode 100644 drivers/gpu/drm/xe/xe_lmtt_2l.c
>  create mode 100644 drivers/gpu/drm/xe/xe_lmtt_ml.c
>  create mode 100644 drivers/gpu/drm/xe/xe_lmtt_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 551adbc22b5a..cf1237a148b1 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -125,6 +125,11 @@ xe-$(CONFIG_HWMON) += xe_hwmon.o
>  # graphics virtualization (SR-IOV) support
>  xe-y += xe_sriov.o
>  
> +xe-$(CONFIG_PCI_IOV) += \
> +	xe_lmtt.o \
> +	xe_lmtt_2l.o \
> +	xe_lmtt_ml.o
> +
>  # i915 Display compat #defines and #includes
>  subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += \
>  	-I$(srctree)/$(src)/display/ext \
> diff --git a/drivers/gpu/drm/xe/regs/xe_sriov_regs.h b/drivers/gpu/drm/xe/regs/xe_sriov_regs.h
> new file mode 100644
> index 000000000000..58a4e0fad1e1
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/regs/xe_sriov_regs.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _REGS_XE_SRIOV_REGS_H_
> +#define _REGS_XE_SRIOV_REGS_H_
> +
> +#include "regs/xe_reg_defs.h"
> +
> +#define XE2_LMEM_CFG			XE_REG(0x48b0)
> +
> +#define LMEM_CFG			XE_REG(0xcf58)
> +#define   LMEM_EN			REG_BIT(31)
> +#define   LMTT_DIR_PTR			REG_GENMASK(30, 0) /* in multiples of 64KB */
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 2712905c7a91..bded80c50027 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -15,6 +15,7 @@
>  #include "xe_devcoredump_types.h"
>  #include "xe_heci_gsc.h"
>  #include "xe_gt_types.h"
> +#include "xe_lmtt_types.h"
>  #include "xe_platform_types.h"
>  #include "xe_pt_types.h"
>  #include "xe_pmu.h"
> @@ -186,6 +187,13 @@ struct xe_tile {
>  		struct xe_sa_manager *kernel_bb_pool;
>  	} mem;
>  
> +	union {
> +		struct {
> +			/** @sriov.pf.lmtt: Local Memory Translation Table. */
> +			struct xe_lmtt lmtt;
> +		} pf;
> +	} sriov;
> +
>  	/** @migrate: Migration helper for vram blits and clearing */
>  	struct xe_migrate *migrate;
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 0dddb751c6a4..2c311b0e49ee 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -34,6 +34,7 @@
>  #include "xe_hw_fence.h"
>  #include "xe_hw_engine_class_sysfs.h"
>  #include "xe_irq.h"
> +#include "xe_lmtt.h"
>  #include "xe_lrc.h"
>  #include "xe_map.h"
>  #include "xe_migrate.h"
> @@ -44,6 +45,7 @@
>  #include "xe_ring_ops.h"
>  #include "xe_sa.h"
>  #include "xe_sched_job.h"
> +#include "xe_sriov.h"
>  #include "xe_tuning.h"
>  #include "xe_uc.h"
>  #include "xe_vm.h"
> @@ -344,6 +346,8 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>  		err = xe_ggtt_init(gt_to_tile(gt)->mem.ggtt);
>  		if (err)
>  			goto err_force_wake;
> +		if (IS_SRIOV_PF(gt_to_xe(gt)))
> +			xe_lmtt_init(&gt_to_tile(gt)->sriov.pf.lmtt);
>  	}
>  
>  	err = xe_uc_init(&gt->uc);
> @@ -451,6 +455,9 @@ static int all_fw_domain_init(struct xe_gt *gt)
>  	if (err)
>  		goto err_force_wake;
>  
> +	if (IS_SRIOV_PF(gt_to_xe(gt)) && !xe_gt_is_media_type(gt))
> +		xe_lmtt_init_hw(&gt_to_tile(gt)->sriov.pf.lmtt);
> +
>  	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>  	XE_WARN_ON(err);
>  	xe_device_mem_access_put(gt_to_xe(gt));
> @@ -543,6 +550,9 @@ static int do_gt_restart(struct xe_gt *gt)
>  	if (err)
>  		return err;
>  
> +	if (IS_SRIOV_PF(gt_to_xe(gt)) && !xe_gt_is_media_type(gt))
> +		xe_lmtt_init_hw(&gt_to_tile(gt)->sriov.pf.lmtt);
> +
>  	xe_mocs_init(gt);
>  	err = xe_uc_start(&gt->uc);
>  	if (err)
> diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
> new file mode 100644
> index 000000000000..d5ada31ae633
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_lmtt.c
> @@ -0,0 +1,502 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include <linux/align.h>
> +
> +#include <drm/drm_managed.h>
> +
> +#include "regs/xe_sriov_regs.h"
> +
> +#include "xe_assert.h"
> +#include "xe_bo.h"
> +#include "xe_lmtt.h"
> +#include "xe_map.h"
> +#include "xe_mmio.h"
> +#include "xe_res_cursor.h"
> +#include "xe_sriov.h"
> +#include "xe_sriov_printk.h"
> +
> +/**
> + * DOC: Local Memory Translation Table
> + *
> + * The Local Memory Translation Table (LMTT) provides additional abstraction
> + * when Virtual Function (VF) is accessing device Local Memory (VRAM).
> + *
> + * The Root LMTT Page Directory contains one entry for each VF. Entries are
> + * indexed by the function number (1-based, index 0 is unused).
> + *
> + * See `Two-Level LMTT Structure`_ and `Multi-Level LMTT Structure`_.
> + */
> +
> +#define lmtt_assert(lmtt, condition)	xe_tile_assert(lmtt_to_tile(lmtt), condition)
> +#define lmtt_debug(lmtt, msg...)	xe_sriov_dbg_verbose(lmtt_to_xe(lmtt), "LMTT: " msg)
> +
> +static bool xe_has_multi_level_lmtt(struct xe_device *xe)
> +{
> +	return xe->info.platform == XE_PVC;
> +}
> +
> +static struct xe_tile *lmtt_to_tile(struct xe_lmtt *lmtt)
> +{
> +	return container_of(lmtt, struct xe_tile, sriov.pf.lmtt);
> +}
> +
> +static struct xe_device *lmtt_to_xe(struct xe_lmtt *lmtt)
> +{
> +	return tile_to_xe(lmtt_to_tile(lmtt));
> +}
> +
> +static u64 lmtt_page_size(struct xe_lmtt *lmtt)
> +{
> +	return BIT_ULL(lmtt->ops->lmtt_pte_shift(0));
> +}
> +
> +static struct xe_lmtt_pt *lmtt_pt_alloc(struct xe_lmtt *lmtt, unsigned int level)
> +{
> +	unsigned int num_entries = level ? lmtt->ops->lmtt_pte_num(level) : 0;
> +	struct xe_lmtt_pt *pt;
> +	struct xe_bo *bo;
> +	int err;
> +
> +	pt = kzalloc(struct_size(pt, entries, num_entries), GFP_KERNEL);
> +	if (!pt) {
> +		err = -ENOMEM;
> +		goto out;
> +	}
> +
> +	bo = xe_bo_create_pin_map(lmtt_to_xe(lmtt), lmtt_to_tile(lmtt), NULL,
> +				  PAGE_ALIGN(lmtt->ops->lmtt_pte_size(level) *
> +					     lmtt->ops->lmtt_pte_num(level)),
> +				  ttm_bo_type_kernel,
> +				  XE_BO_CREATE_VRAM_IF_DGFX(lmtt_to_tile(lmtt)) |
> +				  XE_BO_CREATE_PINNED_BIT);

I know that we have WARNs for misaligned objects, but do we actually
have a guarantee that PTs are contiguous and 64K aligned at this point?

-Michał

> +	if (IS_ERR(bo)) {
> +		err = PTR_ERR(bo);
> +		goto out_free_pt;
> +	}
> +
> +	lmtt_assert(lmtt, xe_bo_is_vram(bo));
> +
> +	pt->level = level;
> +	pt->bo = bo;
> +	return pt;
> +
> +out_free_pt:
> +	kfree(pt);
> +out:
> +	return ERR_PTR(err);
> +}

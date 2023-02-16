Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 721F9C61DA4
	for <intel-xe@archiver.kernel.org>; Thu, 16 Feb 2023 21:27:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51ABE10EE36;
	Thu, 16 Feb 2023 21:27:28 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 579C610EE36
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Feb 2023 21:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676582846; x=1708118846;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=y82JDB17H7ulAEdrpZMm1seaNMOlxIth4ma9mooU5Xo=;
 b=gMYilsgl+j3zG5W60RtYC8PsYu42XshFAQS41j+V3FZ5ZRvULAhPoVcE
 fJPG3Yp8VlDsw4PTxTdNB+PXBH7VvxeLwXaOVBGWJo2TQCy8QqDme+U78
 yKL053165mR0lVuri/oTgg0NdXMeSQerPmHFdxM3ld72YfGRyW68D+ruN
 6ccEcN236l0PMtYQPQLwNlx9iIMRy2V84Aix5EAmdxh44RtIW5Ze/xxo5
 J/z0fCzGPxZyz0XR9v64xCd2UXC4NMBvOOVWq6gfTgbc4vqQjWQVgG5jO
 vm+CSN20AJ18mVNqcvlwBTJkNHZDOhOhx9CfExk4K9CpyN+PPmsXShiJx Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="418064008"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="418064008"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 13:27:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="759128032"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="759128032"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 16 Feb 2023 13:27:25 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 16 Feb 2023 13:27:25 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 16 Feb 2023 13:27:25 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 16 Feb 2023 13:27:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YtB+KzgbuhTIBWQ9DsrC7/q7GucsKUdEdeCc9lJUS3lxjF1BxM9kadk0lucYFBp/KAkR4QHyqLoNleUJSfnn1l4FyYE9RkJdNfTyCFxIo/AqH/h8GZm5f/p/XKcQ9yz4VXe05tWYvlghtVYu36yQxNicwaukpmwW6dQYzZlULVJIE5LxuwcvTNrIB+Rw3OtMtd7KkFRR04qVyI8eZ0qGzKHCWekgt/R6uqZbhyOwUrqNDyq0ra2ICEfAdfAt8yQpaBZPMx0FbbSoW7ntAlDclY0gXSiOY5uDBPXpIRYOV4Hx5O3rPx+S/0+OSglUJ2hkV8GM/yU9Ooapr4CFBuOevg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bAOuzh/xdgzC4mYHAAZioSosGAlL1hIWR/+z7T9Dg/c=;
 b=al4C6CRQGs5B+wkaCR0A/yjoIx8kjVqm8cgpP7hcFZXhIJknPhBatQb+0MO3p5dB2lHMFrdNyyif+J7YlUGH2vQJ5k+90HHciBpGMvnudUrpfsrje6c+CtLh89jH2Ut0w5NEnrg5LoW2X1Pbb25xQ4o0lK8p6t49w871jdDKFx3SecBzy/k3V3yCIskQsKwBqbGQRNTg4OUvXK+43E3sz/Yq6kRNAfa8n9PTJtt3FwbLox1m51VCzt5ighiAuYQb7zfk1zVAHj7NjjWSJVVNr2dSYr+/SSmWlCeF8JvbxVjUE8Ph4T81ZlfvMpcLpE5AcnHIwgraefU2fPN2RWmG7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB6095.namprd11.prod.outlook.com (2603:10b6:8:aa::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13; Thu, 16 Feb
 2023 21:27:23 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%9]) with mapi id 15.20.6086.024; Thu, 16 Feb 2023
 21:27:23 +0000
Date: Thu, 16 Feb 2023 16:27:12 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Carlos Santa <carlos.santa@intel.com>
Message-ID: <Y+6fsPHMoftyRsl2@intel.com>
References: <20230215203425.1996229-1-carlos.santa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230215203425.1996229-1-carlos.santa@intel.com>
X-ClientProxiedBy: SJ0PR03CA0144.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::29) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB6095:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f176246-8c78-476b-fbbf-08db10649738
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p/loUUN1VGaAXC8dEPfAVQgi+ZzX36J5bwiCYblJNBJdYNjczMdte8iyD4GLcOS4MQcLji87FRR2XTsQsbbgO1gKof7rk8kymfJSS4zW8Uj+D0MTUFSEvySX1ChEEOxC7KWMwx52QuhmpC5RQZvCcWPp/c0IoZOZXXTms+jzP0x0yfADClH2GuD89rrX2S58RdTPxWC+5iw0+nMSiVkuV376wlYXZ8fsFsoQJ6fR3hNG385iL5jqGj3RgA8iWXLp5pRfryc5R6QsNqmIvOnEQ3r9uPanj0ozTjkApwJgbhVlypBvAA0wD4KyHSddTjAvWlDs5O7myQ5aQAV2ipPVDyNMh9OMR5RRRb1x/R2KqO6bk4gskBWdHx9y0bdTEZu7kHT2W58xuuZX2j8A/npHzOXoodtX/qhXwlqw1ivs5sPr9bObCQVFQjCepzhre/1H/z+jvqX4ZhRTOyAfH9/Ogmtt3S1wLZinK6G1dYB1Jj+7U6tjk6HBX4eULE+0nVZ3lKSYoKjtU5uAdL4a1gNMhW12cn7psx9Jdu/rjSWNWkg/OE/ZsLfg8gCMYOhVt59PpIwQBaDbPcdRimob+FWKQIZ/8i0LQYHgWHDqzpLgZFkS6e41m1mzQ4Tjng2f5+CAjpNJLfbvx2IuHJlve5nrYA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(366004)(346002)(396003)(39860400002)(376002)(451199018)(83380400001)(86362001)(44832011)(6862004)(4326008)(8936002)(8676002)(41300700001)(5660300002)(6636002)(316002)(37006003)(66476007)(66946007)(82960400001)(36756003)(66556008)(38100700002)(6666004)(186003)(6512007)(26005)(6506007)(84970400001)(478600001)(6486002)(966005)(2906002)(2616005)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m2QNfASI+JZAVkMZpVjNkhrrgtt5bvGkeDD99VE/Sr/JoY/z/k/NB2tcn4TV?=
 =?us-ascii?Q?KJO9ifjiq3YrJletAb5GrOBnshGCFdu3IePqg0C6kwhqnI/kh/9rrA4YR0KH?=
 =?us-ascii?Q?E0QNjnsaM5gyhuq8w0Urg4j3SgUNRHW4uBmy3oC/U5FORKXp/ZOwTIRx7Yhu?=
 =?us-ascii?Q?GQlR+tP61BW9l6ws4IRzN5Gx/4Fr5V6/2IKdWj0fGqXG0FpgrhHPp5l6/O41?=
 =?us-ascii?Q?yTGvUpjqPdBeBcxxBA/2cQqSow/tqHk7SGI/QsQ+8Z4vi5AfdTHODNkn/GIK?=
 =?us-ascii?Q?LbEZ2/z2BJb1WBjjW5sWa6WFMngyHlqSVESXOPM/tJ+6f+I/KeampM9dtYFf?=
 =?us-ascii?Q?YQ1pdsrEdZrAxyOWIG96qgV8Qc31gf2Dnw962qqN8DBOJ51obiP/hzmsQ/o7?=
 =?us-ascii?Q?XzJ/zuWZhrJi0an9t4sjzdZEh4EthRk72SXS43Q7DSNd/lFGgCtJfus189YT?=
 =?us-ascii?Q?GIo1rOCFQNUtLYg0Hl3VbdYiEiOYplj1YgfF/yEZ/hlBNlTiBQZLN8oo6P0S?=
 =?us-ascii?Q?4z0jpKCDuMS0D8Y7FFl7n6yf30UQx/ji1rpatKaH8mAVAOIcjf032G6N0Vtg?=
 =?us-ascii?Q?ewJ3jB6J0/2pRgLi/AfAheZUqjRkonqd/JPOCEcVT3tj8uIa6/FI3Qb/00OY?=
 =?us-ascii?Q?gB1Uxk8CtpAyA1u/kfNoAcCpu7IqGU/a5AYbe52ialhHPlrCviLU0nyF3ZDb?=
 =?us-ascii?Q?aNa5ys0VDhevrzX1ue7vqtKcDZnGounMprUrLW/c/GNJ/U++Z7q4gQ1QwYs8?=
 =?us-ascii?Q?gRQGZxSFVUU9Jol8Bp3li6BoumLOEmy90TEjMOdcceVzBg2s2Z41u0y+TNaK?=
 =?us-ascii?Q?JsDZEXvw0Y2Ji4DLCwDlGP8bkE2ZCqiIdBGhyjP0j0HyP6KBnbFA22Gt5uew?=
 =?us-ascii?Q?S2hdAOcXGvkTTFabd+nIxjBr9WfZY60smhe2fSuMC1RUtT2ItOm5K1ATdSHz?=
 =?us-ascii?Q?YMJ0WMWlO2DyNI082pXw9arfTwsQeQJYz9WdaGNwmMmDs/qEcI+BJmDelC0B?=
 =?us-ascii?Q?+taVtxOEmb9HxWBLRUkUoKjwyTZdMhP7YJR5YaifP/77D69TEDqD+0X4hFcT?=
 =?us-ascii?Q?l2iHvm62tLN3q8v6yBVPU/X9ywdmfJlmg3eTjgKKuylBFO7uisuA+LHcnItP?=
 =?us-ascii?Q?FU/yyk1mvTlivpQFjhb6w0htUKNUh4v3xhF61VJFi2IVs0prXIXEGQizIL/d?=
 =?us-ascii?Q?wvQKLATw1Mpfn+RuPHcwduVolgWweOcFhKo9MqGuTkVcUqZ0+wuSJc3fmM8W?=
 =?us-ascii?Q?pJqZ+6pkVnrPtIsoFfFjIHG7N7QaqNBD7NOUPORoOo9+WWdMu6Ic4ZIKEwyi?=
 =?us-ascii?Q?k3g/TcJkn841JxRvQKQo83oHu3adMC3qvsaXczYD3qiBxXPBtiHIqdSfm1ap?=
 =?us-ascii?Q?M8RQoqlJm4HIdq/TGac2yLNPidpsq86sAGVvZEiGlwyiea60XkpkPGKv7L8F?=
 =?us-ascii?Q?9c72TFJoNt5F0dDndmcHCYd9FlulXeURNZ2/ZXjysguqkya9Yaj9ASaCTPRs?=
 =?us-ascii?Q?EyLhnynoO4gkcci49YT2Jw2SOUQBskcdzWSzWjhDlWtw33l32k36DA68JcOP?=
 =?us-ascii?Q?v6cZBR2Fw+r9WaKYGEkeX4iji9rnk7lzSnesbF+XaZrkHjCPCBeTOkvRFiZk?=
 =?us-ascii?Q?vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f176246-8c78-476b-fbbf-08db10649738
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 21:27:22.7590 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bn4JpKdNRBMwiXSfdlGQ0ZqkC6+9Py3COGtWxvlCwjBf7AdqX+WsuGXPv07QAFeb50UcF5sLjcyuvAC48yrMHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6095
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Update the list of devices to add
 even more TGL devices
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

On Wed, Feb 15, 2023 at 12:34:25PM -0800, Carlos Santa wrote:
> The list of GTs got splitted a while back between GT1
> and GT2 on TGL.
> 
> See here: patchwork.freedesktop.org/patch/388414

I will change this to:

References: https://patchwork.freedesktop.org/patch/388414/

> 
> CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Carlos Santa <carlos.santa@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

and getting this merged right now.
Thanks for the patch.

> ---
>  drivers/gpu/drm/xe/xe_pci.c | 2 +-
>  include/drm/xe_pciids.h     | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 291561a8f5af..b769cd5ba6db 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -354,7 +354,7 @@ static const struct xe_device_desc mtl_desc = {
>   * PCI ID matches, otherwise we'll use the wrong info struct above.
>   */
>  static const struct pci_device_id pciidlist[] = {
> -	XE_TGL_GT2_IDS(INTEL_VGA_DEVICE, &tgl_desc),
> +	XE_TGL_IDS(INTEL_VGA_DEVICE, &tgl_desc),
>  	XE_DG1_IDS(INTEL_VGA_DEVICE, &dg1_desc),
>  	XE_ATS_M_IDS(INTEL_VGA_DEVICE, &ats_m_desc),
>  	XE_DG2_IDS(INTEL_VGA_DEVICE, &dg2_desc),
> diff --git a/include/drm/xe_pciids.h b/include/drm/xe_pciids.h
> index a857af1a0b1f..df1b977763be 100644
> --- a/include/drm/xe_pciids.h
> +++ b/include/drm/xe_pciids.h
> @@ -41,8 +41,8 @@
>  	MACRO__(0x9AF8, ## __VA_ARGS__)
>  
>  #define XE_TGL_IDS(MACRO__, ...)		\
> -	XE_TGL_GT1_IDS(MACRO__, ...),		\
> -	XE_TGL_GT2_IDS(MACRO__, ...)
> +	XE_TGL_GT1_IDS(MACRO__, ## __VA_ARGS__),\
> +	XE_TGL_GT2_IDS(MACRO__, ## __VA_ARGS__)
>  
>  /* RKL */
>  #define XE_RKL_IDS(MACRO__, ...)		\
> -- 
> 2.25.1
> 

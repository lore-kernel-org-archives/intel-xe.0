Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55DF2E732FD
	for <intel-xe@archiver.kernel.org>; Thu, 28 Sep 2023 18:11:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E9CF10E034;
	Thu, 28 Sep 2023 18:11:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 242A6890CE
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Sep 2023 18:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695924715; x=1727460715;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7slLlrIX8p4t9/coPxzcjyJaFKufMqkdk4VOI2jFgao=;
 b=OcylRnORG9xwPXAfSedbOTmgbpnc6gUp6ZHqZ7SLKGLekoQbVw9XAO3R
 KJJv3ArPGyWbLUGSjYBvXMsnaBP8oXeDVULndpUEGb6dnN8oO4/R2+ovv
 WWj+w39t1LETe4dUdj8Dy0Kr+4JTh0LWS77Bia0vRWEUxOHEUll36S1YS
 q57fzk/cJouPCEKJFAmpvH2bD2+BuE9cpj+fF8gg8YfX1XcEh2iEtucO+
 3VMrqZ+L9aYExBoy4/xRr2dT8mSAEdff8XZp2Hbuar8gt/1Doabm3YtQF
 bOgQ8X8DEQ00yhxmGugdEfV+9yjjHxprxtbx8kmpY+6CD7NU/2Wf43VkX A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="384950454"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; d="scan'208";a="384950454"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 11:11:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="784801407"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; d="scan'208";a="784801407"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Sep 2023 11:11:45 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 28 Sep 2023 11:11:45 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 28 Sep 2023 11:11:44 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 28 Sep 2023 11:11:44 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 28 Sep 2023 11:11:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n2C+AcF6bJ4/MNctK0ZKPFuhfFJlOCHEdd/pECvbLImfXfulstUoVKneoaCqSjlQT3DbGre7nkqISV20dIhZUoNPJm1FfD0Di8HUReR25gcjo0RDC0oFCSoPzpA9oR/2KBfY5DxswDTYq3WaFYoArsfclKdKYOX4PfACWbUMMIozb1R4vjWhn9PS9Ds21dQChMCoHnu46kkb6ki1PWDXaisc2cu3Qd+fnPwnDwcPh4OV2NwGuzVIJA2lAL5onyxJ8ra80ULhPS5IXVKxeGprCbLhc9Psp+TXjvqUYE8MYDcENFUxYMIA/47spc5XykTBUz86kG0iXp3OsYMCsGCx8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YrQ9hfjaumfmWbCGsbql8h1oUpqrGO/4apXMJBB7cE8=;
 b=TLw1SxflHn32k4gAwUoC4GYEbd0AdPKE4oAo2Dp3Jg/ciPwoavRViKdi3i1+PHbkHqvDb34O+wvAP+FHt78CsEnTNtspo9wgsSzHd3po5ml1pY7ElP4UEqxvVDpMyzvYyZxtFGI1zjapbGt0BwShTfHOFX72l8me1J1fOtx1t8Ymn+kwECOm7xIX4xxIOXDwi2uNmFHrJrW1GNVLzF2KlAP7P5p28aCR5J/RRlgO+Hv2GhcE/EXQ23H1glLnc+Kpgnepoqx1m/3+lGmONCjSjCmkYPVLd3Ix3IgnPqbg/f1XeZB8q2lLk00g+Ys9QY7uYOkRNfNu4VDpydaUe/kDCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 MW3PR11MB4746.namprd11.prod.outlook.com (2603:10b6:303:5f::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.28; Thu, 28 Sep 2023 18:11:37 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::14ea:3a78:f950:d6d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::14ea:3a78:f950:d6d0%7]) with mapi id 15.20.6838.024; Thu, 28 Sep 2023
 18:11:37 +0000
Date: Thu, 28 Sep 2023 11:11:34 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <fei.yang@intel.com>
Message-ID: <20230928181134.GJ2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230928044335.1474903-1-fei.yang@intel.com>
 <20230928044335.1474903-2-fei.yang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230928044335.1474903-2-fei.yang@intel.com>
X-ClientProxiedBy: SJ0PR03CA0032.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::7) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|MW3PR11MB4746:EE_
X-MS-Office365-Filtering-Correlation-Id: 437f5ec1-4d36-4382-4814-08dbc04e5b29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QtehdC+Iajqw746uaLVxtJKucQcEaqjJTo/k6TYQYVZ5LwbM8J1cRHgP5D3t0rLA/DiBGn8nsq2lCIfhOm9E1i2a1lc+KN0aoXmDR0T1qNjF1icBvgPfzxO2nPo5hoIer+onIr7Zv9umVYWxefsRBcD6neKbC+NwZK4bp2VTPgdlW5KOqg2J/b1WlsCAxoVAyBI9q8El4Xw+tiYxuhKOFw3EszOAUGgIB5QvXS/HfNVmj8ACmcaF+mJSkvL6PgDHZBpK4lBlw0efd5ly84j3s7++cMvqoZN6E3pypstBC1puEwXAOyOPUsCRqyqHNWGeZuN3SMH05fU2PsICbpuRHf7RER1jpUOtIM5ay+jeJneUx/kimCMXvHvWp4AabpPURw5W0Y42dRuPiMtHdy78Tz15nxJB9pZM/MTINE/fdFvgq4guvOrTedBSUPbsZt+e02EDxH8iHURcv+qYcc08Lzt/J6HLpSZ/ZkGw3OlDlsC1dGpMUMRiRq9MdjLJax1z36i/uX73oZHAbNG7dZZghnHRknCkigLUT9cVDwNpGtxDfqzxRJCvPazFcZFfftvc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(39860400002)(396003)(366004)(376002)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(66946007)(1076003)(6486002)(26005)(6506007)(6512007)(38100700002)(82960400001)(86362001)(33656002)(316002)(6636002)(8676002)(4326008)(41300700001)(83380400001)(8936002)(5660300002)(66476007)(34206002)(6666004)(2906002)(66556008)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M5dxL31fkiovAstL3f048YZp+qO/ioZTLpDBNTLdm+8S1IEoZCkUIt/U8svI?=
 =?us-ascii?Q?VtObpTV+SfrU+0W1686a2eFZ4sOYGbV4fUGazvHRkDhXzTzoA18SHLbLJQvh?=
 =?us-ascii?Q?Jjzwn9umwNscMuzXrs+EF4MTeFm0w+wal+hvn7/dgm8TJMVXTmczFP0qz6Tc?=
 =?us-ascii?Q?PYV4OZ8ArYA313be03WbZUOJgoAOgolEinGe9KSZ9eCTrONgbu/TRqrcwZi0?=
 =?us-ascii?Q?m3ovx+3gAZfriaAxSsj67EIEeuFCQpilxgV5UWIe/ijdxvmeoR7MnQw3WT1+?=
 =?us-ascii?Q?i4RyYTdbvPcqDJjE3BxtMMS1MPNbl7hRUuAfZzSVcTWT71ImKJM7IdVHV0xw?=
 =?us-ascii?Q?75DIF36ylXz4EXmCjfEBFK6c5ebENVaElDWbo8UXexm4CSPHjG7xlrOdpq92?=
 =?us-ascii?Q?xZn/xDLNFQSV4CfgP8mOWBBBTK/uPiqgjZoalZChoaMwWmjGZxtzgi11qna7?=
 =?us-ascii?Q?iV3BqtpjGAGYGNXKI38oWP8cFIA0tfRArFZsZIEbxACe9r4xwWF14noZovwR?=
 =?us-ascii?Q?JZyyqFKMR9tlDSf6a7Dv/d7zd6x5X7WWnRXmWFGeSmCEXCFBs1TWVhX5bNHA?=
 =?us-ascii?Q?CsKpZabEJsUvRz5k0gwN/zqdlmtFwnBSGHTGOiMlRtH6jDeSXKEr7ORLVb7o?=
 =?us-ascii?Q?bouYwHgbO46nCpOBqOY3Lz4B0da0/4KBqYQGnRe2YKfHQejxw81sw7+Gt79O?=
 =?us-ascii?Q?HFT5kriNvaEN2y+RmaBImp71+5gzCGNKHpEf5nBzncctukC0d3lNhoQfxTmS?=
 =?us-ascii?Q?EOkmAqIMp6Mh1rxe+utgBMxWaNxiv68dO+na0SLZIlnSwYI8h3roalTTnsBx?=
 =?us-ascii?Q?zjSlBjnBLYdUusdzPbX/93j+rfJ8/BVv+IxN/EuyocwO6eu20C+xHrbc4gtv?=
 =?us-ascii?Q?pMxgITv/P+OHAXROuualr9t6qUDQjnUP8Toexx2N2ZXrM4ppayRDCPoMVCtC?=
 =?us-ascii?Q?yVIig1MSMP/W+TfzkuNWBy4bwdXQpsc2ULoZfOsi/2gWd6Fejh4sueumQeSd?=
 =?us-ascii?Q?BUnknkSb096287VmgZA3gQjs72981XGcjlYUYe122UhXSMGF8hYUFXr/WDYw?=
 =?us-ascii?Q?AMyche9421ua1hb8HeYuqWFw76oKo9j2XkcXt01lAAoxRbKPG4weEptO0X1K?=
 =?us-ascii?Q?13kctm6c5JwtMCfRKQUQ+J00WC1ZnGndu1yaa6H0836mY705oC8e6HbMvf0w?=
 =?us-ascii?Q?lM/KlXR+CIS62rpzZYXOvz1AJ7RFPRhMegERaN8D1Rzu2iISdUZB5cfvXxMZ?=
 =?us-ascii?Q?TXnp3MaszLBeOGYAFKvQfteGE8tQfD9vRkiccIRk5iCixkjOuvnjbUFusNcg?=
 =?us-ascii?Q?1rIG2HMw1Cj0+ZnTSJBmfAR7bZA9MKyyvejJykOiXg0C1evQHhaA6yYOGt3R?=
 =?us-ascii?Q?aX9enXMZK4we0QuOUURju8ztr+JKvJV7TqPglw97+Ac2q+glmo0dwXITJ9nL?=
 =?us-ascii?Q?Hv1rXp0dax6mNRq23eT9l/bvbc+DQOsOwkQrzNbMA5CmNjMqMjE1tZN5gMHe?=
 =?us-ascii?Q?qq0vdjoD71ALi7hvrzm9MSTMj+Oej594qNu2tPReV/+CSNwH5pSK4rCu3rwA?=
 =?us-ascii?Q?N1/F6RpV6hE/nDZekuouKuIP6hlUKDA7Kh2vW84JLxJAjZF+HFODLQ4V5GIy?=
 =?us-ascii?Q?oQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 437f5ec1-4d36-4382-4814-08dbc04e5b29
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 18:11:37.4132 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yhQp/E75o3Ue/0iyu2p98XDj3GyZd5qcHakWkzeOJXRk+6gX37s6KkXLzeY/HyRNA0znWW2C7qRWRf6kmIsf8p9D7pElTK0inuMSNjwEgSA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4746
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/1] drm/xe: set PTE_AE for all platforms
 supporting it
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

On Wed, Sep 27, 2023 at 09:43:35PM -0700, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> Atomic access is supported by PVC, and became a common feature for all
> platforms starting from Xe2. To enable that XE_VMA_ATOMIC_PTE_BIT needs
> to be set, then pte encode will eventually set PTE_AE for devmem.
> 
> Signed-off-by: Fei Yang <fei.yang@intel.com>

Matches the PTEs for Xe2 documented on bspec 67095, so

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

It seems strange to be setting this flag at this layer of the driver
before we know whether it's even the correct setting for atomic enable
(i.e., we don't know yet at this point whether we want to get pagefaults
for atomics or not).  At some point in the future we may want to move
the platform checks down to the same layer of the code where the actual
atomic enable logic happens, but that can wait until later.


Matt

> ---
>  drivers/gpu/drm/xe/xe_vm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index beffbb1039d3..5f700c0d5ef9 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -897,7 +897,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  			vma->tile_mask |= 0x1 << id;
>  	}
>  
> -	if (vm->xe->info.platform == XE_PVC)
> +	if (vm->xe->info.platform == XE_PVC || GRAPHICS_VER(vm->xe) >= 20)
>  		vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
>  
>  	if (bo) {
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

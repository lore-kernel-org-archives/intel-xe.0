Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F58C4332F
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 18:58:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D13C10E229;
	Thu,  9 Nov 2023 18:58:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8939910E229
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 18:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699556325; x=1731092325;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aO1Z1UYxYKB0WyZAId9ev35wS6RaleHMq85zd1IBBMY=;
 b=eJoUU+AMPBIx/RzZaLaG3ZPBtkmpvAftKsZxrntK6J7UCwWJsPOPDXkx
 k/Ob6cHOQtqXydniTl8xCFFUaxQJt78wu3XCfh4VfQ2LnaFNeXEqytwV5
 tZAFRAShz9YZll1/zWYr7x6B1iV9KQUE1iy/MSCjLFQ5yOVeZLlaRj/h4
 PnrJz7ueqcUDTx2YxRsZE5fVvKjK7O+OETCBotgoQnFHODBLMPiyYQfwf
 qwGo8jIO/7rQdwXpjZdb+pre1KtNvBGcn+R0eulIC/cCQ1zgOXQB/HgTv
 ATHtToGMCqKsZxo5vp5aCDCVa3hbtQ8TKS3WU4sM9+2kB4BRI8bxdDEWH w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="392929108"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; d="scan'208";a="392929108"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 10:58:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; d="scan'208";a="11235822"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Nov 2023 10:58:44 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 10:58:44 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 10:58:43 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 9 Nov 2023 10:58:43 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 9 Nov 2023 10:58:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ugk94JYf8oBW5IzrUssEtTVI6xNgKE0wILdnAY+UlynWcQl5kPe7vVYZOl8FddtWKNPiEwIdrs62it2OMMmE5A6957x/ev8AETYtF0l2PYeM9HIL7VyMm6PL/NkNY5gKEPMBiE7nbCqi4V9b0uiIL/8c6HbNz8W0yHmZvxeIgDg5WiKFpiWoCKUxI89MLRq11fgCJdfq0Wpk52iV/DpMtLwWQUpOSfKl7d5TvMisHYRlhQqgtspMuPOzaq4wYKvkpAJb8CoAsJgLwQUvYNeS5bMImkF43JPOJfTZJu2shrzUqKu/hW5TwzxevkMTQuVrxU2Aukgc07gctVtGxiY0cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BEH61Iic3UQDelpt9uaVpFI9Y7P4rHbtNBf15L5k0wg=;
 b=XtjFV3h0aljkcWi98oNiXuhe7dmIpVgrIRADiv0CmzNwelydWFihUFC7qkdZ45XS7nuSuXSGiBB4mw23g64xaimRy+ZFc/z+Cu0MqyB/DaNrYoOleP0n72BPB3v7s2yn5/hpyEsAN0+21QnrITtlq5D9DLmpunoNS7PRle9naPbgUMhjlrln2LuRnqMlx1vsujrrVGzAQ/+hnLHl1v7CJnt7Gf/HABzG4JFGo3YmwMqsxRucliQLspGw1nL5k2hmMXfndGtLtxnFo9Yd2I/KRD3/8/XvMtF8canSFYBpC52COuArnOnaIRxMDoIsaVlwW4hFWLOM9AlTwULU8dQC0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB5200.namprd11.prod.outlook.com (2603:10b6:a03:2df::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Thu, 9 Nov
 2023 18:58:40 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.6977.018; Thu, 9 Nov 2023
 18:58:40 +0000
Date: Thu, 9 Nov 2023 13:58:35 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZU0r221fWnY8erP6@intel.com>
References: <20231109175132.3084142-1-lucas.demarchi@intel.com>
 <20231109175132.3084142-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231109175132.3084142-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR03CA0002.namprd03.prod.outlook.com
 (2603:10b6:303:8f::7) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB5200:EE_
X-MS-Office365-Filtering-Correlation-Id: b519387d-7ab1-429f-e7c6-08dbe155e324
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1p8vrtwPmWr5S1PohktlUztcAoed7BE3v8I5LkJsxPOeCpuhgUPEKgnkmwT+caZpbpNnTmdkVU7huKegpAEadfxGCkxsmrTS49Zu1HcVKNd1PovBpJaucMQdmIWs51LaDVKP2untkJWU1RmKLeCq3yYaBou9utTVPPe0d+HrmI5Y5c82wXmYVuOgvi81gcym9gFVCpj3thBXV9qCyO3TO3J+Rqmuft7jcPrboUsxZb+gdFhPc1gBHqvsaeDUTQp5MyS324jVakTasQZe0yMyzHzxgWW2D6oA4hycrY0Q0uz67qvUbBpsOzm3HGBdPPgGU9Xho1GNXn1zQksw2I+YEfqUO4Zjc7lrBmb5C5CZ4BBachGkc9zPwR+8f8VFc8IkZgRoT7nkLIkIRIhzU7CeMLDEzOsXRtSAmbkOPsvJgTOsJzaOyTDX0NY/YMiZcrl9s5rop9XoVB0vSR4/AIo3CeXI57211S4w+HOM87pQ5TY8E12zyQoHFzAEkF5zzzdys8jw0uwQs1va62h8aDWZBK72J9YhxrBZNlbIpJO3dtv/6gAinQccacyLYNb5zu6C
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(136003)(39860400002)(376002)(366004)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(2906002)(82960400001)(41300700001)(6862004)(44832011)(4326008)(5660300002)(36756003)(8936002)(8676002)(86362001)(2616005)(6486002)(478600001)(26005)(6666004)(6512007)(6506007)(83380400001)(38100700002)(66946007)(66556008)(66476007)(316002)(6636002)(37006003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DKcE/xd22f0WTo4tyv5BvCiwp2ZWRNlfcEdIuejuvOmay+PakheUVEo+34PD?=
 =?us-ascii?Q?UI70WDb9vUEefv71bhF4IOyhKQ1W62k+E5wvjJg7YE1+QyDg6at55SANnNiD?=
 =?us-ascii?Q?LA+XIID7Etj3jCmuNI0H9Bmz+fJGUZArsUESrGcyPFgM7t3DAcfWc/yMO8bH?=
 =?us-ascii?Q?I1zBksWR2sUrNzS/obeOq9Xp4OAQ05a53b/QQPYSBuxrAhUwRVWGULWOcjED?=
 =?us-ascii?Q?Hmxd+nwEcBeVg04fnVNOfJq50+MLw2qBOtw+uoXiV5nMADy+W2TdAyGry4DG?=
 =?us-ascii?Q?izL2EsTxKHQuPCHM31DSCu8Tybxk9aDXXpJ426Dr/t6idgXSphn+4cp6tOov?=
 =?us-ascii?Q?lbNgxvVTnT1SrJaDr9cSpaE3+Q6ZFitHYQMXA9euiPA24VdM4R3yyWqCAG46?=
 =?us-ascii?Q?rCJaio2wuTUsAZbX8FHFj+CpasHRWOkSU5MTW5sYfbfCJUXpupgxwrnzmv0p?=
 =?us-ascii?Q?Oq7hf7rBRY85efpFknlxYQxQmQld1qtVhMWE8Z2eOQRqulz3TfcwcF24WJyG?=
 =?us-ascii?Q?N7Jw8Zp3rTtuQ+zLhX4OVeZrft63qhy+QDFKpWnZnPjIIul92ReKfi7YJVDD?=
 =?us-ascii?Q?dUKMkPTJG3kJe18kEELf4pEDQp7QL6iPCcZM9qwgW7D70ZiNsMAX/s/aWPQJ?=
 =?us-ascii?Q?8/2x1fNmhRM5C4A261WAfWcwfVnjMMmDENOLVkXdCPlNI5TyclUv3zO4y5C1?=
 =?us-ascii?Q?6E9Fb4TwoBHhAsu53eG7iUuhNmVmIjM2C7lE9GBfibqNj9in9lFxAmmGdJGC?=
 =?us-ascii?Q?RJufXnu2ApIfD2n4PF98RdLgF75kIsKdzIzfQZAevEq9/Qbu55aGQS2P85aX?=
 =?us-ascii?Q?1b/PNC+nnPT6NiGPnL2GGL8UTBYtr83lkfF1gNxo2EwhyYmfPRlifyTTIkIM?=
 =?us-ascii?Q?Hxm6af/gfcmgEA3ChApAsELDfweUGUPxKfGtkSHAJ1NsWtl+dBa3scwS2d6L?=
 =?us-ascii?Q?LhxdoRnVpV4IEqj/Z9neiE4bJPWe0KcfdabtS9HyNX6Rzwx8jQKbPszVbPzC?=
 =?us-ascii?Q?zi2HYZ5oaEVhqCj4uPz0pnTj3sTdkyww/zBLxXUtnBpPtcKJm3w6s9iJrOue?=
 =?us-ascii?Q?wu1hyYNhKdlfP+M7eOg1H7wCvvmZzW567JTAbUEc82FzNRjL9lN97rlM7IDe?=
 =?us-ascii?Q?1i53dQrpN3SCc0kaVHx1FK8cYB0QK3cBoiBUaYmpVSThoAPIXj9Z2BfnXAfV?=
 =?us-ascii?Q?g7pMTN0jIEexNjoyHCb76S/Zj9Gnx1y+9qL4jdN0jaBiuNCDk0ovAtbrGiZv?=
 =?us-ascii?Q?X3AbdmlCU/hUVaygCLDoNIHmSeDn/eglznfOfQqqOvedw0WvNsCbQntKSIZM?=
 =?us-ascii?Q?58abE/YiQvNzZaPnYM4y5Oy3QqDiH2y9NbsAUnJq65FoK9SLW27EzQrx4+Ln?=
 =?us-ascii?Q?8E/rZzevEFTMclJhWBaAGeXFeY3XsopMj3619edBunuJs+c6xIqi3nbCX6oF?=
 =?us-ascii?Q?uJzW/9GvPUYQHBlDlOll0evjLiiW65bWACUhUOzGrDKh29gLUweVeNtghRh9?=
 =?us-ascii?Q?gxggsWP0b4aeaZn6wkIBjkYhiHzY5qiBBPuxxOZUBAbqFj/0DiO5hs2XY5bl?=
 =?us-ascii?Q?xMXHj1laNZ0tFu29IFzUj+3pPjaKIO/gscLm5q/vF5upng5D/wGjOIaVP8/D?=
 =?us-ascii?Q?/g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b519387d-7ab1-429f-e7c6-08dbe155e324
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 18:58:40.7083 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V35tDf11Etl9uwkXuIGcp2BMCWTdqWEcaco+lEosuH7JvYN1aQfbySk9F7sH9WJ7ZAtFeDIaqosmApGgfzSSQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5200
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] fixup! drm/xe/display: Implement display
 support
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

On Thu, Nov 09, 2023 at 09:51:31AM -0800, Lucas De Marchi wrote:
> Due to the way we build i915-display for Xe, we can't have both i915 and
> xe as builtin, otherwise there will be symbols defined twice. This can
> be improved later by renaming the symbols in the source (redirecting via
> macros) or during build via linker/objcopy.
> 
> For now, just fix alleyesconfig. If i915 was not selected it could
> be left builtin, but it'd be a weird dependency on another driver. So,
> just make de dependency be "if display is selected, xe must be built as
> module".
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index c66c4466e8b8..2fa2d6dacb96 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -47,7 +47,7 @@ config DRM_XE
>  
>  config DRM_XE_DISPLAY
>  	bool "Enable display support"
> -	depends on DRM_XE && EXPERT
> +	depends on DRM_XE && EXPERT && DRM_XE=m
>  	select FB_IOMEM_HELPERS
>  	select I2C
>  	select I2C_ALGOBIT
> -- 
> 2.40.1
> 

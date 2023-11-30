Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C46FC4167B
	for <intel-xe@archiver.kernel.org>; Thu, 30 Nov 2023 15:36:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D02DF10E377;
	Thu, 30 Nov 2023 15:36:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 638CD10E377
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Nov 2023 15:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701358606; x=1732894606;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lVhgsruK3SdoIOIu8ufPTpxj3/medT3aN1O2z/fjOEM=;
 b=KDlk+c9KPplrGRaCTK7RcsdkF9jiFHS+LmySPWh7fMlWWG9f3cFLGXkg
 /uMkk841HyV2yFVPbMsdeaZDTTowSxh/dUc1NnroPz1JF8AlQGb14Qy3A
 TrmRNq0NKpKApQ+Z6IvvOy39eLVP2ct2aayGNMPR4rUOLEfI0ejlqm/b7
 Wz1cKW4BZWeTN3KlmbFmmr5jbgbHxoeY4s5ZaBlTs6dAsFuCjUOEU5dTd
 TT5UX1AkANvFPCRKiSpXWuxN2hiAr7mwuUc2A2rOClzrgMMGu54GtnaGI
 EjqxgPvz81/gQOwUbsLAfiFwDJJuWN2BHijkZYynQ2Pf0pvjXnBfsDQXR Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="329391"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="329391"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 07:36:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="803738644"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="803738644"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Nov 2023 07:36:45 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 30 Nov 2023 07:36:45 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 30 Nov 2023 07:36:45 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 30 Nov 2023 07:36:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WU9lXeQT/4KIIzLglGOtE/JJ9vsi+9BVeqm3+eUaHV6poAfNorrZosRI7OdmoUWanpHtUKTR8X+BpN1TBNJrB0W8dNVEVqIizNtPxBZlndnFMSfjBXsEuvHDjihGOrmd1CR8iMtvpkmpCvL/36wPRDu9BsZTduRjuUy+KXqBeG48/3gwGWhhbJEh3Cjf1fYNzG2vB1gHW/Je5ILG6jVz0q7tPLthbrA7yP236+dY1gGqyOt76CBhxZ2ztBe59t+zVjqioJtI1HLC7pLGPYVPP3f4W8Mbs0rk0Et9RCCVNXMeN824+Li4QN8Y18pWv/tS8giSYpg4922kaeiwYjnHtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aKybCXtLUXP+H/6bJAJZ1gaQkPwQzdal362hUAAXAK0=;
 b=d4GhirvHagVHLikNUoDXsmfid54gwfXg1pzV2R375UXeUgBDD2QhHxfUjlFDcR9uf1MR9WupE1HsnKQt1nas+NTNtCKEdlD/rWkIBjm7+DZKAIU4joyNB4agO4bUzJUnYWxwQONrsYZLV/cwZBx+7To0DGr4749Bz4Mmi41Ka3qhk/aGXmEP1/YXt7LqjA9PS8aKivoICNj+ORmr51BjE/HYZqhp7BgKdcVYQp2YCYpqHjl8a+ubWojmUy85QYQHnu2Ja9XHfoVsO6HEOncIsgI1vPhkNPGsd1hcg45/enpr2oKqnoxt385SaLt3U0j5iK/d2hQpuR4PZJujh2m41Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB8094.namprd11.prod.outlook.com (2603:10b6:610:156::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24; Thu, 30 Nov
 2023 15:36:42 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7046.023; Thu, 30 Nov 2023
 15:36:41 +0000
Date: Thu, 30 Nov 2023 10:36:38 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Koby Elbaz <kelbaz@habana.ai>
Message-ID: <ZWisBhKOxjq8Ixbp@intel.com>
References: <20231128165316.3142184-1-kelbaz@habana.ai>
 <20231128165316.3142184-2-kelbaz@habana.ai>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231128165316.3142184-2-kelbaz@habana.ai>
X-ClientProxiedBy: BY5PR17CA0026.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::39) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB8094:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dad4e56-8236-47c7-c16c-08dbf1ba268b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZSgfSY8YgjY9KnAi25iOaK0M5FFDL/oTN4/U8+2kI7gnqAkbJkn/jw+GAbqsVOtnhBixvL/pWmQVs2DPcxdNtAHUIN0v9dkXx/9dY+GeNU2qzeY194FOMBvgfb+aBn1G9XbKW4ciWHtklJUMaxCNJm7KgVkzENjBDb0lVXqugylpN/t8tdyIXgSXiVIvX4CfJaa9XbUTk4eyrDLn3iPe/jicGvjYhkV6byuTw5JxxI4yVR2EjtenVwLWXxla15H7egKsak1Xf1yJA/qi3Uhg7YEnzB3HwF4as1Nzdqa2Ow/EqosW0Cns8EWQL2NA1Z+5efqsE94NiQcXpEr+dY5BXAdseIFKrjzuE3q70GlR4qdstsZV+bK9QAJ/CuwKSH02lWMgigFpYmHA6TDfr6ym6MtkGsAhTAl8veI/f20DBub9lmR/Sst1WDEnFJcdFw3PuexuoglEXeDfYrplm2sPao2WJeHTYymoiBdbJeSVuqGXSgJ/n4vWYKcQPK9WnRTr+bHtsU6Fk1UWz4EocdzVFamWLH3soV+v9WWnHPcTChLH/GZMwQflUoK36tc7rqGu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(366004)(396003)(376002)(39860400002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(86362001)(66946007)(66476007)(6916009)(82960400001)(38100700002)(36756003)(26005)(6506007)(83380400001)(2616005)(6512007)(6666004)(2906002)(316002)(66556008)(6486002)(8676002)(5660300002)(44832011)(478600001)(41300700001)(4326008)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EYjvbf0UfZpO5ZmFiI11zRZhs2EfXol/4Vbms7p6qXrKSI3ABZWn6QUGqRfy?=
 =?us-ascii?Q?5UHi4vIk7cxRBTnv0onE1eUdC+KiqK7oplUVrIUDa+sxNcJqGkrBRIRceK/x?=
 =?us-ascii?Q?LbSBLEWki+gZnNlGjw1fn+WTCNWM9WkkT46SPNmBIiO1XBK5D0X1VsyayQe+?=
 =?us-ascii?Q?C+76BjaNVwJLCuZX6pvwSyhaHQocVGNXpSkrwau4HylLwqbkiOht9Mg8VbH9?=
 =?us-ascii?Q?jcCaI2AZWbOh0E3J4/sdUjFFqsycje56fjqSusoGuapyIOYAR+lwjdo/qRLI?=
 =?us-ascii?Q?6XOyVVkAxREAxnWImlFP7N78mIL1qM1L7eGmfVCEeRv9Qmkg4zRz56wbl6Ec?=
 =?us-ascii?Q?hxeu1Tz9+uysv/JfvLLBj/8UowAZxLLmfllCEkxinRIe4YeYgQK+DvyVhMfJ?=
 =?us-ascii?Q?wWqeeMik+04sgxEU16o6Hji+n4gMs+eaoBGQFbMcz8JJNFhxd1hY9etHpaQZ?=
 =?us-ascii?Q?lZpZQ5cR18gtvjvSqIgBdKgb0s0rvPrL1XcgvAu49HCkhiDXsDGJlhuCMjVr?=
 =?us-ascii?Q?IUuLgcIjP+PGmwwOV0/yXM22m5tMWu9l8zzJFyokAYM1W1lF22NfphCAdTfv?=
 =?us-ascii?Q?T53QUx/tGaeF6ndisUs4vOdoEgjZsU7dvt7DsY8WMuZEk5d0IPoSdMBfeBTb?=
 =?us-ascii?Q?Of82xg+Zf0FlXdd3mnYVXGskxat1h+3X0QIQKBFBh3v18//R83XGG7Opm+Ql?=
 =?us-ascii?Q?77bNc/EbLq50bKRPp7dqB3N7iAz4mEXxsptnBh6tErNT2CODjsLk8No4pY+h?=
 =?us-ascii?Q?w3mPdBeZDty4yX9OlKYOHzhQ1rowyuazNWT6dRjJVYDhLttevGy8n8wLisle?=
 =?us-ascii?Q?SXBgBDK+VjOTQj7klT5nZfHalKMMuONdkfJjJFfsdhJSEgmVLFSZomgYnQbY?=
 =?us-ascii?Q?lqzF/UWW6Sseg4Kq8wag/0xwQ3xeHtnPSQiIKaIcK9sLgCIyRMb9hmXipnz/?=
 =?us-ascii?Q?fw1c/WYO9Q4eSacegV+Ol9zkSwslEvixcQyY8au0I6Mtzuxu+IQ46N0mYECC?=
 =?us-ascii?Q?SrpJiXsb7THNhMEbAeG6zPZJCaBYtfbONIZd3N7p97fYlk1WySE1Bzd9FxkZ?=
 =?us-ascii?Q?dGprRbQcn4ptQkCzpNF5KyAY5O/qfK7yHyrQROoD2r+AZhskeCxlg1Wv3kT1?=
 =?us-ascii?Q?o7T55fGkyka+7imOkOsPdMixwwVIneRB26y+vZBDF+dQx2/iM/vVyYowNBBh?=
 =?us-ascii?Q?VG5VsFmDmYqG+h4mpiVDG4xfIYOSuOjanpt8JAdPhkHt6nkrzRkbOG+eZDsA?=
 =?us-ascii?Q?EmPL/490UFEQVjblwEOYm78VqaXLnhEQzunPtkBXV9NVi8jbXvM2g5gFQj1i?=
 =?us-ascii?Q?J8mXuZGVobltY/qCEdp6QAmTIguN5PE1f/lOjryRXJsB4tW8XGFS/6iCLgsW?=
 =?us-ascii?Q?3q2QJcBAu/CPBSW7clPm0uAxCK/f1EC2Tq1AMKy1digE00Qzg4H4Jks+op1C?=
 =?us-ascii?Q?lXg4cjEEC/pPjDO1u5Wm8oet7SOLe+hrqojkvR6NtSaE1nBk7pgG4bk/62s1?=
 =?us-ascii?Q?Zwd6cKDuItvcf7SvRL5nd/lyYNWkgLIFbr03JP8xUQXKWOSdnUGLlVz+JMIh?=
 =?us-ascii?Q?GkLfpmGmzWc9vZP6KKZ36hWKwwAbOXjXsg5huSLD?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dad4e56-8236-47c7-c16c-08dbf1ba268b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 15:36:41.8606 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZpdSgUhfLHSrFcgN/T/OQgyflg9pQLbURxOAqonVWZb48njw4nfFynkDmgnl9w0+Q7Wy05yOGt9wxe9mMrBubQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8094
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: rename bypass_mtcfg to skip_mtcfg
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

On Tue, Nov 28, 2023 at 06:53:16PM +0200, Koby Elbaz wrote:
> Per device, set this flag to access the MTCFG register or to skip it.
> This is done to standardise Xe driver naming if an access to any HW
> should be avoided.
> 
> Signed-off-by: Koby Elbaz <kelbaz@habana.ai>

Both patches reviewed and pushed. Thanks for the patches

> ---
>  drivers/gpu/drm/xe/xe_device_types.h | 4 ++--
>  drivers/gpu/drm/xe/xe_mmio.c         | 2 +-
>  drivers/gpu/drm/xe/xe_pci.c          | 4 ++--
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 72ab96869659..58876e694f47 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -258,8 +258,8 @@ struct xe_device {
>  		u8 has_sriov:1;
>  		/** @enable_display: display enabled */
>  		u8 enable_display:1;
> -		/** @bypass_mtcfg: Bypass Multi-Tile configuration from MTCFG register */
> -		u8 bypass_mtcfg:1;
> +		/** @skip_mtcfg: skip Multi-Tile configuration from MTCFG register */
> +		u8 skip_mtcfg:1;
>  		/** @skip_pcode: skip access to PCODE uC */
>  		u8 skip_pcode:1;
>  		/** @supports_mmio_ext: supports MMIO extension/s */
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 0f846272e39c..883610fc0abf 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -330,7 +330,7 @@ static void xe_mmio_probe_tiles(struct xe_device *xe)
>  	if (tile_count == 1)
>  		goto add_mmio_ext;
>  
> -	if (!xe->info.bypass_mtcfg) {
> +	if (!xe->info.skip_mtcfg) {
>  		mtcfg = xe_mmio_read64_2x32(gt, XEHP_MTCFG_ADDR);
>  		tile_count = REG_FIELD_GET(TILE_COUNT, mtcfg) + 1;
>  		if (tile_count < xe->info.tile_count) {
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 20ca30bf58b1..2824085e7742 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -62,7 +62,7 @@ struct xe_device_desc {
>  
>  	u8 has_llc:1;
>  	u8 has_sriov:1;
> -	u8 bypass_mtcfg:1;
> +	u8 skip_mtcfg:1;
>  	u8 skip_pcode:1;
>  	u8 supports_mmio_ext:1;
>  };
> @@ -581,7 +581,7 @@ static int xe_info_init(struct xe_device *xe,
>  	xe->info.media_name = media_desc ? media_desc->name : "none";
>  	xe->info.has_llc = desc->has_llc;
>  	xe->info.has_sriov = desc->has_sriov;
> -	xe->info.bypass_mtcfg = desc->bypass_mtcfg;
> +	xe->info.skip_mtcfg = desc->skip_mtcfg;
>  	xe->info.skip_pcode = desc->skip_pcode;
>  	xe->info.supports_mmio_ext = desc->supports_mmio_ext;
>  	xe->info.tile_mmio_ext_size = graphics_desc->tile_mmio_ext_size;
> -- 
> 2.34.1
> 

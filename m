Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1E72C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 21:41:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A49A10E6AC;
	Tue, 12 Dec 2023 21:41:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B678510E6AC
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 21:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702417285; x=1733953285;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rAwolxGESJxpatcG3sgPOOgRA2buQcp8N5qi/TxhxS8=;
 b=ZKCTg+C6X5a7075D3Uak4c3W3ip83kLt7q1zmb/5Gu88r/dySYh+nxoW
 EthDz25eucJfVM67cLVZq3sI0jri8pqjnKBhr3cp44rOTJTkTnBzAXTuP
 UhDPbI2PL1dFGMMhVqkGEOo3zn7SlblFShh2CJwhPos4QuCOQfXo6wR3g
 r1Qa8AUcd+zgN/5pH5x0cnmPsurVKO6fcL032Ih+i2o87J/YS6tVMfz3v
 XwUWUypt7vXpV08ZO/upnOgPoLIEPGsLhKMWh1+SH38IpCEpJSF7AXjG9
 gVte3xWluAopfaP9NytQmhIx19Dzxy80jfFXFkv8qo4VuhX8Os8Mcf8W1 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="398715576"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; d="scan'208";a="398715576"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 13:41:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="891773475"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; d="scan'208";a="891773475"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Dec 2023 13:41:24 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Dec 2023 13:41:24 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Dec 2023 13:41:24 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Dec 2023 13:41:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fw68ZTK22XBB0DGo+aS9XZlUfuwuyOatvOd1IAAjl7Q9AajQc4FUyhQnEvJNNG0/BxTdgS+NvAUEcx5p5NRl0v4oUYEOXZRh1dazZZ2DNnWJgpSaAMEBL5/79pzV5V/kFmeTMgux35HLvyDXG9A61/eCugMa7C3taAh53ffwEAZtH94hptOZrWTvBSJCxsjDpr4VjYqmJfW7gh6ayDSJiplMHdayB9PNi7c6rzRci0aOISaNlDQ1cPYDU8M12BjI9snVgjqTzIi9cgZEW927CxLBNUN7TU4YgpaF9Mw6eZKAK0PnV2CQ5BVHT0Kv3C0NmZ7TYwUvS16+MbbQrac0rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/VmZiooV24kLdh75AFkkweCtnjhMqd+2P8Y5GJOeTCE=;
 b=dDs9mqMVpyPDGW3p0+aoMkFI+GhCwWW2ONhEXog8DfWFStXZF3G3oRYx/oi+9TD3SyzFgvSJfag7oKwSQ9Q6PTl56Dtl3d7eY1xNBVvP0ocY+QJiejsH1NQ2W8IvfCEtPZF4VPTugbVlkHOrqZK5UDX7/tcNxbD8wMKD26rPpj/GAyld1iqWxIOulhJ9T02vvFOMgnoIihe7eUUDfUR6zl0wCbY0O6/nfj4tw46v06L4PeAVn24k1QfzQrdBk80CpBi3KEKh1OgOxeX5yY77xSliqdYd0xdXKiU6qjiVzu8CLSZCWziWzXNepjz20k3K89DqsweVrt92rh0+/KHMRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS7PR11MB6040.namprd11.prod.outlook.com (2603:10b6:8:77::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.32; Tue, 12 Dec 2023 21:41:17 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7068.033; Tue, 12 Dec 2023
 21:41:17 +0000
Date: Tue, 12 Dec 2023 13:41:14 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 01/10] drm/xe: Add device flag for memory based IRQ support
Message-ID: <20231212214114.GH1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231212210054.1747-1-michal.wajdeczko@intel.com>
 <20231212210054.1747-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231212210054.1747-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0234.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::29) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS7PR11MB6040:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f70bda7-9888-4c97-2aa3-08dbfb5b121d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oz2F00yjBNECgcA7eOl8lpbD9XWHXX+tG20WJPN5QNEnuSUmFQwWiKR/G9K2DsTpCOYMaDmrLplJquBFuVZKIIULXFODk/KWx//SmXv9jfGij5j5vZvtzHFiWXuNS9wIUPKzNp9ZRexIqSlKqiECkZlhvydUr3Fy7AIA8hJr6Zbq0IE+6cujCETuiAk7BrjXsyta8uyu4dVg3CPIAqt9iQqme7IzuiqPq20UV5iA02mPpXJlQgThURlSAdjZka1IoZ5A3QeHca5NHRgOmKG+7EiLtWvtexH637bTnZaie2O9MS30RVyYMm3GVeGjgxkoeufaD3gS6VHTaT+NQalczmFXnMLtHfnWjXzixHco1SCa4x+w/DXNGukkKxaapS7a1nLRWJkqaaibnoKJQP7N4ImI6GhIgwaVki78TpzAcMnjs9NEBAHQBWEGaSGK/v9NsaI9lKQ58jj1PGHFXt6vdTkjjhoeKVaOfEpWyQlaa4PT1e5lx6/A8+Zlm9rbcZ3j+6KEznWUyiE5DSUIWCLSRoc/7yy5P4nwVwu+KmVTz3fZiakrhrLrEegZwvBxy5Us
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(396003)(376002)(39860400002)(346002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(26005)(1076003)(82960400001)(6636002)(38100700002)(33656002)(86362001)(5660300002)(6506007)(6666004)(6512007)(316002)(66556008)(6486002)(66946007)(8936002)(8676002)(66476007)(2906002)(478600001)(4326008)(6862004)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lvSFXdPmyiuG/R0z9/JIhuidhex/Q2Kr61KDkYdsj6XGmVw4u7HLbwt6Ussg?=
 =?us-ascii?Q?5DXtS6xKHbo6UWVDeqgbuW89JHoDJQMuT340r0wiThYEyPvSRVpPBx2OF1zH?=
 =?us-ascii?Q?6zFU/lKdqmaskCstnFzoIKIReQg1s+RgTHJbuen25zFVVTTT/FrFX+ZzPt+5?=
 =?us-ascii?Q?ja5Gs2ArMj2LtId8rY2pmyOn/d2S7g74pD/jSp60Pr2y6FP7kF60YilcghM1?=
 =?us-ascii?Q?BvDfI1/xFJxp3Q24t5qzqiotYLb6puwNgcON7/dPpS8/Zo4qcoV/+tYUZYnP?=
 =?us-ascii?Q?KG6FZpAb15TXrJKrOCr0Jjx0Lk2qvyHx+sEw5w2IbhxlwFxv20IpPg25Hzlp?=
 =?us-ascii?Q?OYBEvZdOergWDbImQHjZSREprjlvD/ahivc9KJ9NXBe+KKinqdvg5lFXXk4M?=
 =?us-ascii?Q?oChXKAPnTnZFa8FH+V0uvo4xlORL3Q3NOeZtT7g6d2Jupb58ITLfc13TGZHU?=
 =?us-ascii?Q?R9z5Kbqy7liHWhWhVy9ah1tO7G2mB6tEP6tBtQP0TbQKaZn6pEtj3/e9WJs8?=
 =?us-ascii?Q?GuUxctUoq6qbn9gihs62QI9kZ2VB5iWkXCbqOSRO0R66R/D+Gbf3hW9sOMOG?=
 =?us-ascii?Q?wJBsBt0nNz5A58gY8XO79InK1LftR//nryVHMT+qugkeiwgjRQqt0D3ik1ZL?=
 =?us-ascii?Q?Q7WTM47SWmF8GUNqsOsmCJM25JM0QZHE0Zet4nVD/OliKdmivVRd/PJeS+v8?=
 =?us-ascii?Q?Fte7g5xpzZu0JLAKTlLamQtxXb4NHQ88u/LwWXzHERv6N8EucefNuXi3R8n3?=
 =?us-ascii?Q?bhxyiJzsnDNlPE2ezB6FZeDpWoDL9E5GpQbhuhUMogQ0Um3nKyH4kYtmVR3X?=
 =?us-ascii?Q?QU1m/RWtuPAugoLkvG4ixcPAMJSsVX8FgUEKaFDjzd3A/f4LmXDs0u5w/giJ?=
 =?us-ascii?Q?l/XrXQvOoyQmb1qpogCz+9i59tksRcTwZU3nqURcQDCGtpuOO6uFfpQ9xeOA?=
 =?us-ascii?Q?q8XUNnEXm+S63z8X17LUsN0HAtrT+hKU6ViN6dmyjO4PpU/cQ8novyOK9Jmy?=
 =?us-ascii?Q?YBZZtcId2NzmqlAM1GO2JvEUr4nCwXNZOT36P5volGNg1SSS3kHZTU2f83hW?=
 =?us-ascii?Q?TbjrUofbLBXAtzhp34X2/UDTUxsIDdchQB9GAjSMZ2AhPdHgcXPXx67pzsnH?=
 =?us-ascii?Q?1brFWi0a53l8gPbeRjWU7mu4pjaq95PaCynwu4BgNhBfk3p0b+sUqh3zlPXB?=
 =?us-ascii?Q?T1FEO4XjY9bf+5Ubz1sL2REPSqqh1dlP+kTMqaLSPohnBX5p3QoCN6EyHkC3?=
 =?us-ascii?Q?6/PmRQa+GVX/0F4U4FJ5U+kkgCcJ5JSCODFgNNqgcLkIGlhjsgcDhyfeZ0fL?=
 =?us-ascii?Q?QcKgYoPIV32TGfrIs+nPdXJRzmRXGQJxTe437p717kBihhou3e5VlP+665sP?=
 =?us-ascii?Q?GJHvKQxET7f22eksSU9W38jEAGZF/7McGTAoN88ehCY6wZ9CT1VIg0ZjK01V?=
 =?us-ascii?Q?JlGUT9djRP+P7m6g6BXsPuRUJenHpCyMtETqc4TuTPsz7PUJfffGyqiuSUL/?=
 =?us-ascii?Q?crysVgt/GFs5befZyR2kF0KbX+grKDvBrESXHjg2rhRewz+js9rceBLUnkxJ?=
 =?us-ascii?Q?69TpTkg6Q37zUJ8TRgtUC+7+gSwK8vcqkdwNY2Hq8RaxHzlkY7dA4fA1jagJ?=
 =?us-ascii?Q?Cw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f70bda7-9888-4c97-2aa3-08dbfb5b121d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 21:41:16.9020 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wJrCEdj6Lt2OPSE46THYPv2Gy3tw747lEQC//XWDb6E+6NwlfpO7h18HE8cwi0oT2u0MqvchTP9LlUB1bcXfuOjESD9m+JXfWpv88Maceao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6040
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Dec 12, 2023 at 10:00:45PM +0100, Michal Wajdeczko wrote:
> The register based interrupts infrastructure does not scale
> efficiently to allow delivering interrupts to a large number
> of virtual machines. Memory based interrupt reporting provides
> an efficient and scalable infrastructure.
> 
> Define device flag to indicate which platforms will use memory
> based interrupts for delivering interrupts to VFs.

It doesn't look like this flag actually gets set on any devices in this
series.  If I'm reading correctly, this flag should apply to every
platform with Xe_HP IP onward, right?  Do we expect there to ever be
future platforms that don't support memory-based IRQ?  If not, I'm not
sure if we even really need this feature flag and we could just do

        static inline bool xe_device_has_memirq(struct xe_device *xe)
        {
        	return GRAPHICS_VERx100(xe) >= 1250;
        }

instead?


Matt

> 
> Bspec: 50829
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.h       | 5 +++++
>  drivers/gpu/drm/xe/xe_device_types.h | 2 ++
>  drivers/gpu/drm/xe/xe_pci.c          | 2 ++
>  3 files changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 3da83b233206..0b158d0d04e4 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -168,6 +168,11 @@ static inline bool xe_device_has_sriov(struct xe_device *xe)
>  	return xe->info.has_sriov;
>  }
>  
> +static inline bool xe_device_has_memirq(struct xe_device *xe)
> +{
> +	return xe->info.has_memirq;
> +}
> +
>  u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index d1a48456e9a3..0c48e3686837 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -259,6 +259,8 @@ struct xe_device {
>  		u8 has_flat_ccs:1;
>  		/** @has_llc: Device has a shared CPU+GPU last level cache */
>  		u8 has_llc:1;
> +		/** @has_memirq: Using memory based IRQ */
> +		u8 has_memirq:1;
>  		/** @has_mmio_ext: Device has extra MMIO address range */
>  		u8 has_mmio_ext:1;
>  		/** @has_range_tlb_invalidation: Has range based TLB invalidations */
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 260e8a6034a7..11559669cb8a 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -64,6 +64,7 @@ struct xe_device_desc {
>  	u8 has_display:1;
>  	u8 has_heci_gscfi:1;
>  	u8 has_llc:1;
> +	u8 has_memirq:1;
>  	u8 has_mmio_ext:1;
>  	u8 has_sriov:1;
>  	u8 skip_guc_pc:1;
> @@ -551,6 +552,7 @@ static int xe_info_init_early(struct xe_device *xe,
>  	xe->info.is_dgfx = desc->is_dgfx;
>  	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
>  	xe->info.has_llc = desc->has_llc;
> +	xe->info.has_memirq = desc->has_memirq;
>  	xe->info.has_mmio_ext = desc->has_mmio_ext;
>  	xe->info.has_sriov = desc->has_sriov;
>  	xe->info.skip_guc_pc = desc->skip_guc_pc;
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

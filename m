Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDCBAC77B6F
	for <intel-xe@archiver.kernel.org>; Tue, 11 Apr 2023 07:01:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0E5710E4C8;
	Tue, 11 Apr 2023 07:01:43 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9102610E4C8
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Apr 2023 07:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681196502; x=1712732502;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=buwFTAKrrTCPb+YNBBW10mj/TNUqWI7yXaf2G4iEizo=;
 b=PpCUReQ8044PunhlMOGGBWL0ncoNaICJqHoEfiJ7jwpN8HvtJoOHiHLu
 hue5nI+Jw26ZyUVWh6RNjq7P/3fMf47PxnEqeBnKf0Z6f+EpBR/N9cNz5
 Vnty60CvvBhG1sobOnwX4tIYQCVNb2aaj4YxLpsTxcWMWsOXszPrnVgem
 JOlLnpkRviUqajO+dh+0j2FN7Om2pPP+tam7hViOZeHe8qaagA5PJvsuk
 A3ToMEjzuTRVca5sGw9lGzyO0SNnuDEnll46OyU2EtsMDoyJ67d9iA6HU
 Nqq2DOOleRGBgI5rEwiA18vfwAt/K/quJWf3Bao5ln7q/FvKNA+gjumvt A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="341031149"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="341031149"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2023 00:01:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="1018258714"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="1018258714"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP; 11 Apr 2023 00:01:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 11 Apr 2023 00:01:41 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 11 Apr 2023 00:01:41 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 11 Apr 2023 00:01:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SigASEU6qqTEk78hg+EuoqczwhC4JRL2nITfxq3WtorA80bODkWJtTo73PiEDqxffWjz2i+uXBIwzxmmMlI/lczjIkw69Eo/4aYUPMikb+L2ImxbBteSJy8F+QSUy8sg/iVfkB73Hjx/XSHPmpsrlLv2jjYRhseaMtS58gwpkalG9+1Ou/SXrIuY5kRPfqVReKmZGS4a1erHmPNX5sMrznpm4ljKw9pm6uPwzKVuyPcfGQA9oV7UKMNFsAJ9pHEBEuLEt0Cnl4cJCwKwBdSiivHSHJf0P6JzfWdhKYurPX6R6N0FPYce6o21kwkEoV84NO3+jlX0avgnNjyVRFtRWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nW4OShnemJbnpKBMopxxT8rM7TjDGwjQdafghG7VQg0=;
 b=TxQRWN8KHjfYWTYaAfDtYeSYQTGVw7JKxjLldSHWYi/Zokxv8v5cOfWHJ5kyHjrZFF/KcG73ReV4LX7pzgo/4d54OQkVYUXl0DzR4QcuVqOJaJyxl5a7PLiC4ZEWcs6DRnPJ6NStdN9qV9RNR6H82EW7jwVtjjkD2gltJbq1C9AcwmptRzhrcl8gdf6CNOeb9rx5OxGM2LaThMJu2aGM9byD2dHcVvkV2q51mw6HTREXP1WSEWHBVITq1GWrtHXx+rr/eyoXdsjxZqB4DkzH8gc9F4aSVcVbKIRy5X5K+Kew31JJwVJnltNsqWdXhoPDVRvskZvCpq0NTQ1x9zfoNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB6570.namprd11.prod.outlook.com (2603:10b6:303:1e3::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.35; Tue, 11 Apr
 2023 07:01:35 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%6]) with mapi id 15.20.6277.038; Tue, 11 Apr 2023
 07:01:35 +0000
Date: Tue, 11 Apr 2023 00:01:33 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230411070133.byyciicbo4a7z3qt@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230410183910.2696628-1-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230410183910.2696628-1-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0P220CA0003.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB6570:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d7a2190-4b49-4ef4-7738-08db3a5a9687
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eaoXGDOmPT/txlmwueZNJlO9RV0FNZRbUDsWc+CvhSwcZncmm41IzKm7sqzXKkjTIkWhJ3xxDpgbTvgAuIvJ3FWuYzYGZAu34ODwxJPt7DwRCAuBJNGmSThIsb0CwGxiy86sRLdl3Ss4zyPSCCdYjKo6QrcaGmSeWrxiInz40yMsqUIi4U7vJy22nxZesrjqr3HMBsnT0Z4hcIx8JkcaWF0k+B36Izp1p+F8RuhkmYnfp9x7Nt0CYyHNxDlEbHVE5R6eSSXT+38QbeyiFg5JpARnG7l2Z3kdUMASSAPa8Z5z/5w56RKoBanuaEmIzs4IJAoFhJl+VlGqVAradBbcw9dj6wgTJ2jOB6EgNRr3jQPhA3yhCzK6/UxxN9Jm+u/2HXhUwUrO5N0XSmmKKVUe5Poimdk7Rbtlp6GP/bWTvvW5P2wcSrCNKCaLk1A4xWYh84dy2tz20+nm6Tx8CwSt7T2DhEplkU+Q9hz2gIP4vB6iNmUcyJVDVY5BJxyxJzYilkI7exRoyDdwA6kiN721eBzB8JCYtM6W8H9RRQm31JFqoDrKdWjsoaGsdSPSQhlw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(346002)(39860400002)(396003)(376002)(136003)(451199021)(8936002)(6862004)(86362001)(66556008)(66946007)(4326008)(66476007)(8676002)(6486002)(82960400001)(38100700002)(478600001)(316002)(6636002)(83380400001)(41300700001)(36756003)(186003)(9686003)(6512007)(2906002)(6506007)(1076003)(26005)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nVaDiOS7nZwnZ6HJF1fZHuw30IKjVYXntWUvqRCvtcSJ8qZen63Qj83qU65O?=
 =?us-ascii?Q?0A+OeknJaheoc2nuV5GloqIAJ7QTohNpIvST/bzuxpFjLvDWNWIJI7A1G2F5?=
 =?us-ascii?Q?cUS+Gt7fHIy/uYh/763hGYI7Y7JOLgqUJ5vTfVMT0Pk4b1fP2M+MMJSACdOU?=
 =?us-ascii?Q?C0QNHf9zKBf+cqCID3EHffgMMmY6iIEDIRvcwqMlvL5105jo5k+RlpdS4n6A?=
 =?us-ascii?Q?JQ3AadX0yx2XRNsXnyw9KHA0EQsavryf57BjPp3NBntJncpva1De1JOsTQRg?=
 =?us-ascii?Q?l0bwX9WFZEpitNjhhTgZN3SsNUBAbRtxrf7WaVLxC7hqCUwI+iZ2fRKanvDp?=
 =?us-ascii?Q?RSeK0BFi0XSUxGdBOI4soQeyLS6ykOovy7vGCMi4MWSkAOnl8+sCld4IJt3s?=
 =?us-ascii?Q?KUkIvkAJC4JyeC2yHyhX0o+cDQmtrErJkMdqOf8PX3E8veWwqHaRiLMs4L9I?=
 =?us-ascii?Q?k3SgbxX0h1RkNsRQhu4WJMEGAUnWPKvpvAuc6k0tO2bn5j/4xPibrsq9JkBf?=
 =?us-ascii?Q?DpzETn4qSMpfXIFUN9GwfRFLi5QIzUix7iBIB8Jowm87/s0RxNtg2TptwdMy?=
 =?us-ascii?Q?cS7rLOKe9Qh39uLr6RNRxJcam5Poa4P6CUp8JthGvrFZ6pDh99j7cbzSzkcL?=
 =?us-ascii?Q?zAza36MhQCZtMuUCOPQ0XBceBmxuaxqTpemYE0q6XB4o4DMEmdCr4V1pyKzD?=
 =?us-ascii?Q?dJqPru0ATgWBI1sFs8+78j9s8AsxIE90TmxGxmddoJKmq4IhArTzjnfhya43?=
 =?us-ascii?Q?98Gae/OHO58Us5OTIBz3bVbyPNwrZ/7lDzq1iRUwYWRGG3ZDfZ4R2qG/rKR3?=
 =?us-ascii?Q?Ow8q/QLJQjLQSM+Bpw4Kld08mH1B+pancKRyjx8YUtSglfVYNXYJlKM9Q2Va?=
 =?us-ascii?Q?9oJIYb6oxA90ZR6epZlVBp4mh15UUgm/AZMuFn8lJ7q3oKHSY2VVayKs7Nh+?=
 =?us-ascii?Q?e7pvRv8JK3XWtq14ZjYX6rG6yTxde49Zp6E2HZNBX1iLZ0IKi2rSUMmNsvAw?=
 =?us-ascii?Q?ZV2Netrd4wbkiqJhuzXrupCmL1Y6HZ+F4n6nNAeefVL3EVv5d49Le0lO++4/?=
 =?us-ascii?Q?RkO+kjJRyTn2kNk6U+thnUzmUIkiKZRWQR86PyN+NzjG62z1Qun5eAFd9Sfa?=
 =?us-ascii?Q?kBx1uhHS2tEjfU2oeOJkby4d2It8caQ3YwzBr14a6//Rdi0ouWxOZvMLySt/?=
 =?us-ascii?Q?G9vju6lOCjh9A9zlI9uWZe+QGxCEQQD+RgQSNu8DRMNsa+s9fJcdmE3oM4NI?=
 =?us-ascii?Q?s5kvHlt2qcRO6ocLxWTpk0XJe0YWtK6IdnXuEDtG6vxVVjirl3CGSdJcC5Z4?=
 =?us-ascii?Q?fTM8jYhzpdGw/3MbBNAt4VN8fhNFf3bxQUSX361PkP9NvublkyyRmux/BOUe?=
 =?us-ascii?Q?yyfpTy+qGpsetMRfOvZtMqvfeAKM1p+oBwSLxcWFeSgPge/wxsQUFth4z5xQ?=
 =?us-ascii?Q?yCUspx8GajoxS0up1JzoZGfjPp571nAdRaAfDbWbqRlY767BKaunrdUjYzjL?=
 =?us-ascii?Q?42bg5sqnXVq3hQzXATbXeIAmwljAo9P5OcgIuSgITeb916/gyD7QsZEKIYz0?=
 =?us-ascii?Q?BfMrRTuhaSHrSJhKTg/KJLBqNrUZoRceVHSSK4q0Z7w9AkEYoetWviaWb7zn?=
 =?us-ascii?Q?Lg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d7a2190-4b49-4ef4-7738-08db3a5a9687
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 07:01:35.1977 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: moDKJm3YGLtOid1KUvFzHoKgS39l2H8s/JxC5mBUnpTnt1fOgz2bRpFjcFaYNuP8KsuFCVV4nBhfjzX1ygIY53KcKbVtxQKdn9vrRPXdKgQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6570
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/3] drm/xe: Use packed bitfields for
 xe->info feature flags
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

On Mon, Apr 10, 2023 at 11:39:08AM -0700, Matt Roper wrote:
>Replace 'bool' fields with single bits to allow the various device
>feature flags to pack more tightly.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

but a  digression:

for structs like the descriptors in xe_pci.c, this justification is
enough as we will be maintaining several of those as they extend to
each platform. Also the access to struct members is contained in
one place.

However this reasoning can't be generalized to structs like xe_device,
that has one allocated per device. The gain should be very minimal if
any at all.

1) Each place accessing one of these fields will have more
instructions generated to use the right bit although in most cases
the compiler should swap a cmpb with testb since we are likely just
checking if the feature is available or not.

2) It also limits the ability to pass them by address.

3) We also need to be careful when changing
bool -> u8 as they don't have the same semantics in cases like
`b = true; b++;`, which may not be obvious in some cases.

for (1), the pro/con should be really small, (2) we should get a
compiler error if we tried. But for (3)... we need to check all the
fields we are converting to make sure this doesn't introduce bugs.  I'm
on the fence on the need for this change, but I'm ok with it.  I double
checked all the members in the struct and didn't find use cases that
would introduce a bug, hence my r-b above.


Lucas De Marchi

>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_device_types.h | 21 +++++++++++----------
> 1 file changed, 11 insertions(+), 10 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index f5399b284e3b..9ce6e348dd29 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -67,8 +67,6 @@ struct xe_device {
> 		u32 media_verx100;
> 		/** @mem_region_mask: mask of valid memory regions */
> 		u32 mem_region_mask;
>-		/** @is_dgfx: is discrete device */
>-		bool is_dgfx;
> 		/** @platform: XE platform enum */
> 		enum xe_platform platform;
> 		/** @subplatform: XE subplatform enum */
>@@ -87,22 +85,25 @@ struct xe_device {
> 		u8 tile_count;
> 		/** @vm_max_level: Max VM level */
> 		u8 vm_max_level;
>+
>+		/** @is_dgfx: is discrete device */
>+		u8 is_dgfx:1;
> 		/** @supports_usm: Supports unified shared memory */
>-		bool supports_usm;
>+		u8 supports_usm:1;
> 		/** @has_asid: Has address space ID */
>-		bool has_asid;
>+		u8 has_asid:1;
> 		/** @enable_guc: GuC submission enabled */
>-		bool enable_guc;
>+		u8 enable_guc:1;
> 		/** @has_flat_ccs: Whether flat CCS metadata is used */
>-		bool has_flat_ccs;
>+		u8 has_flat_ccs:1;
> 		/** @has_4tile: Whether tile-4 tiling is supported */
>-		bool has_4tile;
>+		u8 has_4tile:1;
> 		/** @has_range_tlb_invalidation: Has range based TLB invalidations */
>-		bool has_range_tlb_invalidation;
>+		u8 has_range_tlb_invalidation:1;
> 		/** @has_link_copy_engines: Whether the platform has link copy engines */
>-		bool has_link_copy_engine;
>+		u8 has_link_copy_engine:1;
> 		/** @enable_display: display enabled */
>-		bool enable_display;
>+		u8 enable_display:1;
>
> #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> 		struct xe_device_display_info {
>-- 
>2.39.2
>

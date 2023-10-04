Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9699BE8FDC6
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 02:13:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43A6F10E331;
	Wed,  4 Oct 2023 02:13:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13C2910E331
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 02:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696385629; x=1727921629;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=HWZCwjmnSR+yvaMlXqxr/2H0H4/0oOlC164nRz4uN/w=;
 b=nBr8mANVlW4gQy87DUzGsrqtX5ShW0W+xoDYOLheqx7cHQP4INYqMdi5
 aE6941853p/DGwqR/IgeaYaKrzDN0keqnDODuJpTgu50PwRNdl79yfVx0
 Hp7dU+I8j7njWjnveBaM0uTURqhdBQAqMggsMe5z7hDe6UuBOaIlolIOf
 0tChhcyIw78BlVM4la101gQtQBJqaF03Ul0nVhv6lgu3vxYcJp50/wAjj
 rV3Okad8J4ankdT+AkeBkS9qhp2VRYj4giepfdgGq7RWAE+a3ZZBZksfo
 Nm+34iny7VqN5KtolBKZizsBQDLY3hHiUtPwHXlcEvmuzhR09ySXpoP+P w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="368084002"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; d="scan'208";a="368084002"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 19:13:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="998275906"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; d="scan'208";a="998275906"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Oct 2023 19:13:47 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 3 Oct 2023 19:13:47 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 3 Oct 2023 19:13:47 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 3 Oct 2023 19:13:47 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 3 Oct 2023 19:13:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GmYj2/AJL7VeFyZApfYKVu25I+uFPSwCT5aR/qF8M1yixbZcW1mcat+sLn9gKFA9SRvQfp/UMclP1ndXK0LDjUrFdnNSHKX/fGBw7dNtYUXudVVQzBiOQCiohNiB3eSrzXb0boBKb5kuatn3VdDInGVKT3/2VBCjEMWVOfbpPt3I9BXVPKJtIJzoAjg43R343HOirzPBc58ki72CcylYIHEh5r3L8oG3LM1b/qI5xa07PcziOh6uBc5tzIzfcAWWaZJ9QFa4/Z+SFiwGEUPn4I6l7xxXDbse3gbSSZZnNSgWuFIdpLuq+i3q3CPuWd/bOlGXzaYriJz9InD3VMaJyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ei5foB04OHe6K0vzOtpDLKf0uy1PhHQEmQfsp+noprE=;
 b=XohcLgf1F4QHR5UjwyLr3RTsGhfcmtBle7CVW5oIOeV0zSopB3iRV3a41p6ie2uzp6Fwld8XVgjjFdyRWkUCHNS1Q9cVa2PSCLFqEqMkfCp9uxa6R340XAFEZMKlhoZOW8XVlGcvv0oCDqntyNd2mQnnOorZ8PBQQfJIDV6x/rdmnO+5V2GmqyByl7tyPeehOUEtTdKbwWLtvEqOksh4e6eo4BsFNXA+DlDDNha3ASRtYYJCAg41TJJiDrtXHRkfgzy37BDxHc+WPHzaQZZQXtayYbPLhtepTMuwprq+9dqR10E4mCehrcNBDhq8WsQXih26CCuZ5vGiorrQ2y5PbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 PH0PR11MB5925.namprd11.prod.outlook.com (2603:10b6:510:143::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.23; Wed, 4 Oct
 2023 02:13:42 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::8d1:d53c:a9f7:852b]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::8d1:d53c:a9f7:852b%3]) with mapi id 15.20.6838.033; Wed, 4 Oct 2023
 02:13:42 +0000
Date: Tue, 3 Oct 2023 19:13:31 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Message-ID: <ZRzKSyTTIiW46n58@unerlige-ril>
References: <20230919161049.2307855-1-ashutosh.dixit@intel.com>
 <20230919161049.2307855-13-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230919161049.2307855-13-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BYAPR04CA0006.namprd04.prod.outlook.com
 (2603:10b6:a03:40::19) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|PH0PR11MB5925:EE_
X-MS-Office365-Filtering-Correlation-Id: f75ca35d-ac50-4c37-4694-08dbc47f87ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Iy+IP3+kZZQR2ULrJcY8tj71GU4I8ih28ezdu/DTsAamT6jxAk11E9w/BDSdFmV5V8w6EN1jkCbe6tZIyB8SfpkJJSHnNME6Do8dEvxKOTCb1A0wo9pPKLUi0UAq2/iSj9ga9h7vFW/yKYlBvnEoo2163f2VSObmMFuiuwt/dby/uKIbTHHbc22EDcyYmhbONn3WwMDFBi8+GpziKhBIRMjK95pMmgDzMvxw89lXBtKL2XVGGjca07014MDjnP20syIe067XQ1Dj/o7aNQ4rP5QZpoEThDJ4nMbo97ZgIbAg5gEBxVs6L0X+8iMn/rZ+9ww9LPgNzvYs3LA+0ZZQtzNOk6xNh3qRqoqKViwvBT9LXOegrCYbcoz5zqmB7STYOGlcMjdhBeJbvV2j8yre64FPQCfUuKZIdAbKL64ekN8JRdcRFend/Vf4Oy62vcCoTpeeeculupMXNsZiu0ShFwRgCRKtxevyJy9Nf7iRbndQhlQrmVoDaT47N2XfajQZ6MXMWVdXPKA/fRhFpHiQV//VDdbV8M6ccxFPbuIJorKRqnAN+AM+4fLDaw4iE4Zs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(366004)(346002)(396003)(136003)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(86362001)(2906002)(33716001)(41300700001)(38100700002)(4326008)(6486002)(8676002)(82960400001)(8936002)(6862004)(26005)(6506007)(6666004)(9686003)(316002)(66476007)(66556008)(66946007)(5660300002)(6512007)(83380400001)(6636002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZnlXN1NoUGc4Tm1rbjFzMDdiajgzcHZUN2ZmZ1QzM1A0eUIwR2ZNd2tsSmdj?=
 =?utf-8?B?WDJEckhINHhUSk1jU2ZSaHJQWTc4V2l2c2xvenptVXRQMkpqVitqZ1c2RHRu?=
 =?utf-8?B?NHFxSlIrZEhiSy9NYnBQUlVQTk93aGN6QWsrU3VvbktNU2dMenNhempiYkli?=
 =?utf-8?B?RGVYQ0MxSnZVcWlvOGhHVDQ4OHZlQkMyUDFrUWY1blRyUy9iN3FBWG9vU0kz?=
 =?utf-8?B?RkxxeFdPZVEveS9VY3VxbnNDSjRBVGtRYXBBcjU1L29lTWJBL3J0bUNUT3Vs?=
 =?utf-8?B?MFdBaEZMb2FGYlFqZDZ5S2hkQlhFc3BiVmdjdWNKMHIwSGVkS2R1c3o3MHlE?=
 =?utf-8?B?SXVsZGVSZUdBM2MzeE9oSjh3QUpmZWVCRldaSUlRZDBtSyswMmlyNkZrczA2?=
 =?utf-8?B?cDN6TDZFVWtmQitpQ1EweEtyZFRvdjBKRHM3aER5M2R1RUxMaENvRktyeU1h?=
 =?utf-8?B?UmlTUUFHS1pub0d6andzSmxCT21hcUdXT0JwTitYa0dOZENIaURPeGVsQ3ZF?=
 =?utf-8?B?aXQ1SnBrT0o1VDdMTjlZenc0S01lcW5nVll4MnN3eDJUMzd4Z0hqbHBlUFhk?=
 =?utf-8?B?K01hS0R3Rlh6dG84UTRnYTRXd2FRb09jcWtsNUdsUlVLVmxUQmZ3U1BObFJU?=
 =?utf-8?B?Mk40cTYraHVCS1JYUW1RRHFkNkhJVGhUZDFWTzh6d0JLNVhSZWVXSGozMDFh?=
 =?utf-8?B?VU1ZbE5iYjdOSkJONFFEMkh0VFJRZ2tGNTJiTTVoVlgzQ1ErRE00MXd2bmRp?=
 =?utf-8?B?aG15SFNURWx5WU94OUlXdHhIaVZWMkdSVHlnK1pBM0FCNno2cmE4T3J3RlBS?=
 =?utf-8?B?dWQvRHh4anZFT2s0eW1jOURrQU9VYUM4ZmFYd1l3MW5hRXRMcVVldlU4bmJF?=
 =?utf-8?B?ZUxGbERQOVJja3lPRWpKUjNDREdaNUpVNnpGR0xBTlRMMVE1azNFWjYxa0hH?=
 =?utf-8?B?dmtHa0xPYnArSWxrUG91ak5hVFl4N0dTQ0RLenkwVGFwa3NyOWFrOUFpTnFW?=
 =?utf-8?B?SkRDMFR2RS96UVp5VzNMWE55MmxkY1JxM0ZQcUZaUHZtRXZjZUsrbnNEa1Js?=
 =?utf-8?B?M0hhaDZMcEtsWXdxeWsrUkYvSlRJMVUyeG1jQTBxaDRkVmdhSXVrZDI0SHQz?=
 =?utf-8?B?OWs3d1NoYnZPUmdUMUVhQVZhRWdibS9nRUwwRFUxdTIwMlgrbitBOWNDN0ZT?=
 =?utf-8?B?c1BpQ2tnTVhlbWRoR0t1Y0FDMjR0RWQ4WnNlb2RlNGV5L3ljT0lwRldoNEpu?=
 =?utf-8?B?emoycFZKeGdPTHk2blZwSnBoc3grb3ZIMlpPQ29yWGpuSUlrRDhQR1Q3MEFo?=
 =?utf-8?B?S0pGdXhvc3U4YVhsRnhLUy9VL09vZThYUDFEazEvSU1QSGVoQ0xHcjRRdTFK?=
 =?utf-8?B?cUhBR01vbUtqTDUrYVpFdTBtc1NucVAxNllxbzBtajNRZnBiUktYUUV2TDFM?=
 =?utf-8?B?NFhhdFRkUlJkZjQ0UVdKcnJnQWRJU2Zsd1YzZmM2V2dCV3hCMnpXbW1IQVVJ?=
 =?utf-8?B?MVV1NXlVYzkra2d6b203TmRBNHNZT0ZWKzlSaGJldGdUVmVvdlJ1UGU3SEhF?=
 =?utf-8?B?dHdRdnU0b0ZGYktkNmorUUluUUdXbi9PbXMrbnRwSEFjNkZUVW8wbWhnWWRY?=
 =?utf-8?B?QVl5bGhITytLOEF2T25MaXYzNWdoMUJHaGhxcTc0RUh2cG1RRkt3T0J4T0NG?=
 =?utf-8?B?a2cwSWU2Q0hCMmtEeEplWkY2a3h4V3FkeFduYzNGUHBZVG5McFB1YXVwejN5?=
 =?utf-8?B?elVOdnF5TVhiUUdWSmpTQVBTRVFsMWkrVk85azJmWjY0VnV0U2IvRDkyeTE5?=
 =?utf-8?B?QWRvczVFNjlSOVBiNHd2c2QvSHVWMkZvck84SUh5OE1oZWVEczdCWVVLMDFV?=
 =?utf-8?B?cEtKdHgzc2hsY0UrcTB1Q21OYTV6SWZQK3ViSksxRjVxZXZwZHdYNTdzUEtq?=
 =?utf-8?B?WDRoVGlPcjF4NXViVHhKa0tyM2JYR0cwTkU5K1dsbm9qUTlUQlg4eW1VTWJ6?=
 =?utf-8?B?dDV4OVhkTmlRRVRhWHNKaXRiZGJpZTFBeVJoc2FBanR6OFBHMFArRklDR1hN?=
 =?utf-8?B?dGI0WlJtWkFYbCtEdjU0SFdldWt5OWhaN0dkRU1GckxCRlF0M0ZsZmM5Z3Er?=
 =?utf-8?B?dkYzUHdZQ2dPWU5ZaFBmSktmSjVha2tnMWJQWlpVNFNoaVZpN1dVcTAyR0ht?=
 =?utf-8?Q?NExwhEP2kj3AvhX9FF92p4g=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f75ca35d-ac50-4c37-4694-08dbc47f87ed
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 02:13:42.5325 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ySeonHB3is+4y31dB5ddCqt+epbYHg+tCQzq0OHm3FnNPlkMIHXwuv2r1iLAyKDWbqeRlEbilaCEX7WTy8os+SXr0Eb4FMf2aNWVtLgn4Q4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5925
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 12/21] drm/xe/uapi: "Perf" layer to support
 multiple perf counter stream types
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

On Tue, Sep 19, 2023 at 09:10:40AM -0700, Ashutosh Dixit wrote:
>In XE, the plan is to support multiple types of perf counter streams (OA is
>only one type of these streams). This requires addition of a PERF layer to
>multiplex these different stream types through a single set of PERF
>ioctl's.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> drivers/gpu/drm/xe/Makefile    |  1 +
> drivers/gpu/drm/xe/xe_device.c |  8 +++---
> drivers/gpu/drm/xe/xe_oa.c     | 43 +++++++++++++++++-----------
> drivers/gpu/drm/xe/xe_perf.c   | 52 ++++++++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_perf.h   | 18 ++++++++++++
> include/uapi/drm/xe_drm.h      | 44 +++++++++++++++++++---------
> 6 files changed, 133 insertions(+), 33 deletions(-)
> create mode 100644 drivers/gpu/drm/xe/xe_perf.c
> create mode 100644 drivers/gpu/drm/xe/xe_perf.h
>
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index a40c4827b9c85..294874681cc6c 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -88,6 +88,7 @@ xe-y += xe_bb.o \
> 	xe_pat.o \
> 	xe_pci.o \
> 	xe_pcode.o \
>+	xe_perf.o \
> 	xe_pm.o \
> 	xe_preempt_fence.o \
> 	xe_pt.o \
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index 7a179c4515633..770b9fe6e65df 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -25,8 +25,8 @@
> #include "xe_irq.h"
> #include "xe_mmio.h"
> #include "xe_module.h"
>-#include "xe_oa.h"
> #include "xe_pcode.h"
>+#include "xe_perf.h"
> #include "xe_pm.h"
> #include "xe_query.h"
> #include "xe_tile.h"
>@@ -115,9 +115,9 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
> 			  DRM_RENDER_ALLOW),
> 	DRM_IOCTL_DEF_DRV(XE_VM_MADVISE, xe_vm_madvise_ioctl, DRM_RENDER_ALLOW),
>
>-	DRM_IOCTL_DEF_DRV(XE_OA_OPEN, xe_oa_stream_open_ioctl, DRM_RENDER_ALLOW),
>-	DRM_IOCTL_DEF_DRV(XE_OA_ADD_CONFIG, xe_oa_add_config_ioctl, DRM_RENDER_ALLOW),
>-	DRM_IOCTL_DEF_DRV(XE_OA_REMOVE_CONFIG, xe_oa_remove_config_ioctl, DRM_RENDER_ALLOW),
>+	DRM_IOCTL_DEF_DRV(XE_PERF_OPEN, xe_perf_open_ioctl, DRM_RENDER_ALLOW),
>+	DRM_IOCTL_DEF_DRV(XE_PERF_ADD_CONFIG, xe_perf_add_config_ioctl, DRM_RENDER_ALLOW),
>+	DRM_IOCTL_DEF_DRV(XE_PERF_REMOVE_CONFIG, xe_perf_remove_config_ioctl, DRM_RENDER_ALLOW),
>
> };
>
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index 506dd056805b2..63db0969a86b2 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -1173,13 +1173,13 @@ static long xe_oa_ioctl_locked(struct xe_oa_stream *stream,
> 			       unsigned long arg)
> {
> 	switch (cmd) {
>-	case XE_OA_IOCTL_ENABLE:
>+	case XE_PERF_IOCTL_ENABLE:
> 		xe_oa_enable_locked(stream);
> 		return 0;
>-	case XE_OA_IOCTL_DISABLE:
>+	case XE_PERF_IOCTL_DISABLE:
> 		xe_oa_disable_locked(stream);
> 		return 0;
>-	case XE_OA_IOCTL_CONFIG:
>+	case XE_PERF_IOCTL_CONFIG:
> 		return xe_oa_config_locked(stream, arg);
> 	}
>
>@@ -1692,12 +1692,11 @@ static int xe_oa_read_properties_unlocked(struct xe_oa *oa, u64 __user *uprops,
> 	return 0;
> }
>
>-int xe_oa_stream_open_ioctl(struct drm_device *dev, void *data,
>-			    struct drm_file *file)
>+int xe_oa_stream_open_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> {
> 	struct xe_oa *oa = &to_xe_device(dev)->oa;
>-	struct drm_xe_oa_open_param *param = data;
> 	struct xe_oa_open_properties props = {};
>+	struct drm_xe_oa_open_param param;
> 	u32 known_open_flags;
> 	struct xe_gt *gt;
> 	int ret;
>@@ -1707,14 +1706,18 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, void *data,
> 		return -ENODEV;
> 	}
>
>+	ret = __copy_from_user(&param, data, sizeof(param));
>+	if (XE_IOCTL_DBG(oa->xe, ret))
>+		return -EFAULT;
>+
> 	known_open_flags = XE_OA_FLAG_FD_CLOEXEC | XE_OA_FLAG_FD_NONBLOCK | XE_OA_FLAG_DISABLED;
>-	if (param->flags & ~known_open_flags) {
>+	if (param.flags & ~known_open_flags) {
> 		drm_dbg(&oa->xe->drm, "Unknown drm_xe_oa_open_param flag\n");
> 		return -EINVAL;
> 	}
>
>-	ret = xe_oa_read_properties_unlocked(oa, u64_to_user_ptr(param->properties_ptr),
>-					     param->num_properties,
>+	ret = xe_oa_read_properties_unlocked(oa, u64_to_user_ptr(param.properties_ptr),
>+					     param.num_properties,
> 					     &props);
> 	if (ret)
> 		return ret;
>@@ -1722,7 +1725,7 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, void *data,
> 	gt = props.hwe->gt;
>
> 	mutex_lock(&gt->oa.lock);
>-	ret = xe_oa_stream_open_ioctl_locked(oa, param, &props, file);
>+	ret = xe_oa_stream_open_ioctl_locked(oa, &param, &props, file);
> 	mutex_unlock(&gt->oa.lock);
>
> 	return ret;
>@@ -1918,7 +1921,8 @@ int xe_oa_add_config_ioctl(struct drm_device *dev, void *data,
> 			   struct drm_file *file)
> {
> 	struct xe_oa *oa = &to_xe_device(dev)->oa;
>-	struct drm_xe_oa_config *arg = data;
>+	struct drm_xe_oa_config param;
>+	struct drm_xe_oa_config *arg = &param;
> 	struct xe_oa_config *oa_config, *tmp;
> 	struct xe_oa_reg *regs;
> 	int err, id;
>@@ -1933,6 +1937,10 @@ int xe_oa_add_config_ioctl(struct drm_device *dev, void *data,
> 		return -EACCES;
> 	}
>
>+	err = __copy_from_user(&param, data, sizeof(param));
>+	if (XE_IOCTL_DBG(oa->xe, err))
>+		return -EFAULT;
>+
> 	if ((!arg->mux_regs_ptr || !arg->n_mux_regs) &&
> 	    (!arg->boolean_regs_ptr || !arg->n_boolean_regs) &&
> 	    (!arg->flex_regs_ptr || !arg->n_flex_regs)) {
>@@ -2035,7 +2043,7 @@ int xe_oa_remove_config_ioctl(struct drm_device *dev, void *data,
> {
> 	struct xe_oa *oa = &to_xe_device(dev)->oa;
> 	struct xe_oa_config *oa_config;
>-	u64 *arg = data;
>+	u64 arg, *ptr = data;
> 	int ret;
>
> 	if (!oa->xe) {
>@@ -2048,22 +2056,25 @@ int xe_oa_remove_config_ioctl(struct drm_device *dev, void *data,
> 		return -EACCES;
> 	}
>
>+	ret = get_user(arg, ptr);
>+	if (XE_IOCTL_DBG(oa->xe, ret))
>+		return ret;
>+
> 	ret = mutex_lock_interruptible(&oa->metrics_lock);
> 	if (ret)
> 		return ret;
>
>-	oa_config = idr_find(&oa->metrics_idr, *arg);
>+	oa_config = idr_find(&oa->metrics_idr, arg);
> 	if (!oa_config) {
> 		drm_dbg(&oa->xe->drm, "Failed to remove unknown OA config\n");
> 		ret = -ENOENT;
> 		goto err_unlock;
> 	}
>
>-	WARN_ON(*arg != oa_config->id);
>+	WARN_ON(arg != oa_config->id);
>
> 	sysfs_remove_group(oa->metrics_kobj, &oa_config->sysfs_metric);
>-
>-	idr_remove(&oa->metrics_idr, *arg);
>+	idr_remove(&oa->metrics_idr, arg);
>
> 	mutex_unlock(&oa->metrics_lock);
>
>diff --git a/drivers/gpu/drm/xe/xe_perf.c b/drivers/gpu/drm/xe/xe_perf.c
>new file mode 100644
>index 0000000000000..0f747af59f245
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_perf.c
>@@ -0,0 +1,52 @@
>+// SPDX-License-Identifier: MIT
>+/*
>+ * Copyright © 2023 Intel Corporation
>+ */
>+
>+#include "xe_oa.h"
>+#include "xe_perf.h"
>+
>+int xe_perf_open_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>+{
>+	struct drm_xe_perf_param *arg = data;
>+
>+	if (arg->extensions)
>+		return -EINVAL;
>+
>+	switch (arg->perf_type) {
>+	case XE_PERF_TYPE_OA:
>+		return xe_oa_stream_open_ioctl(dev, (void *)arg->param, file);
>+	default:
>+		return -EINVAL;

Wondering if a different unique error must be returned to indicate that 
a particular perf module is not supported. Other than that, this lgtm,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh

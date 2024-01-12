Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A83DC4707C
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jan 2024 04:30:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1822C10E02D;
	Fri, 12 Jan 2024 04:30:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6BDE10E9E5
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jan 2024 04:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705033819; x=1736569819;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xFKkUZUStQtgwck3mHN0nSSlohOrzPxvI2S04P0eK04=;
 b=bsczXifDFStyrKmx75RPBWZCMtRcfsyv1RHWiy6D4xyCHnt4vf2a7QDT
 7toBcL75MPgyRisdtGYAjoda1qwLj2RoIbr7GJ9J33VtTEVtkoapRO/46
 dSOEZZhOFKpAU0ToWiBvFSjaNAg8IME97ZH0soCkymY1zllWzgsGDYOmm
 WYaAa2C4yBrwqD+IJncFp08MJFj+2sT/lvSb6LlOn6eMDxz8aLS6VlncF
 i0H7Li4HhHAQERCUQSMgEVI37nSF0FJXf2jnZa1XpBTt9ZnQjWyidu5hQ
 GY7TGQwGvJmVPLXESa0dNNH+S7YdLrPfPgSVlTtbZxtQu+ik5851DqzKP g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="5811206"
X-IronPort-AV: E=Sophos;i="6.04,188,1695711600"; 
   d="scan'208";a="5811206"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 20:30:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="1029800427"
X-IronPort-AV: E=Sophos;i="6.04,188,1695711600"; d="scan'208";a="1029800427"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jan 2024 20:30:11 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Jan 2024 20:30:11 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Jan 2024 20:30:10 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 11 Jan 2024 20:30:10 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 11 Jan 2024 20:30:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PSBc2nW7SoxdgC3DfY5/jSsTEmKRaIDXYFzVuZvHcWRK3s0FEvTWWJWx/8Ffdggy8gNlkLnarPXbDjd66yuq5wgTJQXenGIkbrOCzyURs1qqmhQLDV1Np8d99jGNOKPo7H4ckAa/CT2ObkLO2cLU7yqjH5Pl8X5BS5L+hEb0jAvqU+3KQtru9Epr3JTn93TXIv892MkbQWRs6SrGeNxpJ5I9HCC7CusiJSxdo0hLUpxCtk9T3y6HIp4BaRA71HFNrBAuZryQBi908k21z1jyIcVEHR+3ZS+zVJN5Lk3Yn21/+PETtvZf/6xpV1+4IWTD/tQ2dP88eirfhpAa3KyQ5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K87OsNuZvS7ihLLaFKVk6lUH7n5IzvsmjC8yTElKhKk=;
 b=n6KpexfNSyE+/mKtg1pgiecTQfzg4wBDXqQaWTccA106YmDG2QO1JyptMcVkoreZBk2xo7CmylP9lrv33DE6Ab3i225ORRS1gNliEiHo708R8KGzka4jQaxLpbw56VXgk7DH/Ebn69RATF9APqruj72p0t8Xy3fpJOvV0JeNKsbvzpNXRoWLbxAnoLsbMVrg/1d9Y3FHBeD8/xBZjMhiK+PF5AXv5T53uLUwuWlPlTtwGeAvfTum0SVEurvp0JoDpfVqdeeaNjUOsT1mGaoDkx5daf175pZLESCFbBQb7qOqEVd3fJxRkPAMmtLydlM/pm0m+e7IwwQMatO/q8uQvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB8597.namprd11.prod.outlook.com (2603:10b6:510:304::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Fri, 12 Jan
 2024 04:30:03 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7181.019; Fri, 12 Jan 2024
 04:30:03 +0000
Date: Fri, 12 Jan 2024 04:28:44 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Brian Welty <brian.welty@intel.com>
Subject: Re: [PATCH] drm/xe: Fix bounds checking in
 __xe_bo_placement_for_flags()
Message-ID: <ZaC//DS4MIk5was6@DUT025-TGLU.fm.intel.com>
References: <20240111002111.10190-1-brian.welty@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240111002111.10190-1-brian.welty@intel.com>
X-ClientProxiedBy: BY5PR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB8597:EE_
X-MS-Office365-Filtering-Correlation-Id: fa186d67-fd5d-4c07-56d2-08dc13272581
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +/g6QQb/xOg6pIf2Tiko0oeQc9F+wu/6uDR9FoHoRCJO64SC0bc2iHkZmntlCwoomwC4t85scaN0s/v7a4sJsWasZfuQuYPu3SXFaNCudbGyUs4Wwy8OXLpOzLbJy6xXHQLUCyp6mjKiFPg2S7ZoPW0PVB0ysa5bx4eQjMjMLZch0RwrTyCrA5tVrB5A4NkMwM+0NNiW/ro9H+RKGGG/Ni3GPttZ0WoV9/X2hrry9bkKGV+/oTbkWLuPWq0HrGGula5QWGDaUAGWzUt5fsIfl47aFKVO7OVFHJ1PZjpNMh5sTKUygW6jXtwXe1RZKLZhImUHg5qh9XBMo0HsVR5CmiX7hGQBOuP84cvSlzEcnVlp/4W5xasvAgu1BkKbP+i3T02217zLEH2g1gfgDysCIlGGsJebAL6hAPskqgdSYB1oZsBxH9sMTfltrpdS01Xxh8UDIzxalOQEBYu7proKlwbeP70dYgNOGgDr5aLiGnUalHOPxrpcTDyFZxrr9D7gAi4TkP61rpYnZh253TIBwLsadyLHL7x5vmx++dp+UcwEwP741pN5qG1o0PoGbXyQSVqFCXE3mek7yLP/4whAKjgGSV0U8917IRYv5EvYUIut/8cztYGfcpQE9dSipMkI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(376002)(136003)(366004)(39860400002)(84040400005)(230922051799003)(230273577357003)(230173577357003)(186009)(64100799003)(1800799012)(451199024)(5660300002)(2906002)(86362001)(82960400001)(41300700001)(6862004)(4326008)(478600001)(66476007)(6636002)(6486002)(6666004)(316002)(66946007)(66556008)(8676002)(8936002)(38100700002)(6506007)(6512007)(26005)(83380400001)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8i0osdIGIXxc7UEaklLRSa+VOt5851Ghv3wIHqjVZ1jTa5ucBgGQoL0QD02A?=
 =?us-ascii?Q?0NEeeZ4EfVXBf7l0cmfbk2Hn0gqPIvOkVvMs827xGoOa28xmSDi19wsILV2+?=
 =?us-ascii?Q?vPfIS90QXMb2RIJi0hKMhfNeAX5RliRzFlXOMUYsAI128JFh9gI13oCHYdze?=
 =?us-ascii?Q?knHT2rtG0HramgpMEjZfrXA+/a9TK/REne7eW1ye+p5a7FvhaV7XSJzJIXNA?=
 =?us-ascii?Q?5r2KB6KClo8JwhztREPMgUEm87TzP44VKmue6Rt+ZB9xIKDD+wAAXc2JUlqe?=
 =?us-ascii?Q?ZFG9VV22I1rZHlnceLj+rY8Xp6K4h3XYDehWhNN47F5OtIfD5DwJbtwn++Sq?=
 =?us-ascii?Q?Q+l86Bt4ZdsrRq64kbxsUzsmXZinJSn5Dkt8BHO9rr9KJkJhPa2p+1ckRvcY?=
 =?us-ascii?Q?tptxbBOXA8X3yS7byumqhvyqrSL7h5OTe6SQZIk6oxqEHW9XtdU+pxzuviG+?=
 =?us-ascii?Q?NigeJW7GQp4nI+ow2MsTBSkNGEegHj4L5Cr11RI/2xEL2ZmPVpcHH3my8ErD?=
 =?us-ascii?Q?QHvncEcuCuNBXUm8x8oMpZ5890nDowoDiOt1ISh7nBG2W4J6yCvcKV54BJFa?=
 =?us-ascii?Q?YwCgz8Vi/wNpRaXNi4JcDmqVoGP0iusUVE583lozt230bK37PXQ8NPb3LkEn?=
 =?us-ascii?Q?2PBxVjTtyKjehLoGciqiz9gZFcIKffpsu3b4Y3K/H3QlrA7g1zDyqBJT428A?=
 =?us-ascii?Q?Rt85kZ/ILNteaSCuB2UGiUVF+nbIpKKubegoumB4V9jCHVYK/vDmmOMDPOLd?=
 =?us-ascii?Q?0Hl1swS/wJOtl+6p5fmpncLp6bn/w1/Vcw5X2Yz5UHi5/lmCRDR4ujtgxSug?=
 =?us-ascii?Q?4hY7mt+Xc7M41BMqDgEkUlrQf+2SQumQdz3/hc/+w934M1OV0ndhAziNHSH7?=
 =?us-ascii?Q?vee5fhPRrRe3KOFxIwmxlk9TVi8jKIyulDwrCgC2Lyku5ezUlQDa5A7McoY3?=
 =?us-ascii?Q?8gDqywocEaIpjsuZxpR+Vn1ykdNy22vddkyDoZ1Tp6A+B37jRr89AG04138N?=
 =?us-ascii?Q?x+uwmuaUcSplI2VUPxbZOqqxrjfh9awAKUHjoTjszHEskCU3da6Iuye5Lz6J?=
 =?us-ascii?Q?eUKndF7eV5/fx/ClH+AiHpZdw8upoBTi1FJk39qQQYtMWotVH35zq55Tx45o?=
 =?us-ascii?Q?g9+wQUCKwdVE4R+fOcX4/z1//HtPKkpNP+ZYWDCHjqZkO08PQoEAdi+gt4rE?=
 =?us-ascii?Q?VPLxrP5a6Uc87D8H1XCpD4+E5uGr2yj7Udz7GN+O0/HKEVlxcGc+qGmdcGHv?=
 =?us-ascii?Q?Xp56j/ENJhgdiTfMgL9rQVGf3csyuj+jVKNAd63msQzHEQsOnN3v4iIdut4y?=
 =?us-ascii?Q?zmHEtP4jTD6iYjlUC6AA+gTy4UosSIzVWVL/OZ+n5xkWf5rHSlPyU0OCXxCL?=
 =?us-ascii?Q?6UkAH9iB7TNMyX5hLd/2iE03+LspAeBwwn06cQyR3Psbo+NREeGslCx8zSdd?=
 =?us-ascii?Q?DQBuyhKuehN1R6xfT+8SQ4TfwQ4IleUfo0hHTHycXP8F3DsLza9JBZXnnPZl?=
 =?us-ascii?Q?YjNqjCLfAPY10TEPM0aez0fYnyb3KGriXSszaR484vJSf0SR2Ez2PknGjDj4?=
 =?us-ascii?Q?B7pB2YO7UnbAHKCTrwgdAcu/WsAZhMAzIEFKaH00pfpyEo9zpL3MhadyAUha?=
 =?us-ascii?Q?CQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fa186d67-fd5d-4c07-56d2-08dc13272581
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 04:30:03.4853 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aaBeoqqPWNQ/OYPqq0BCCn5vxMmiYR5tbmDN0yTUuOQ5EBi1U8m9V2WD+Y9RKUZcVvHBzud3Ld3wkxz31Xya1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8597
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

On Wed, Jan 10, 2024 at 04:21:11PM -0800, Brian Welty wrote:
> Requesting all memory regions on PVC will fill bo->placements up to
> XE_BO_MAX_PLACEMENTS. The subsequent call to try_add_stolen() will trip
> over the bounds checking even though XE_PL_STOLEN is not expected to
> be used in this case.
> 
> This is hit with igt@xe_exec_fault_mode@once-basic-prefetch:
>     xe 0000:8c:00.0: [drm] Assertion `*c < (sizeof(bo->placements) / sizeof((bo->placements)[0]) + ((int)(sizeof(struct { int:(-!!(__builtin_types_compatible_p(typeof((bo->placements)), typeof(&(bo->placements)[0])))); }))))` failed!
>     WARNING: CPU: 30 PID: 6161 at drivers/gpu/drm/xe/xe_bo.c:203 __xe_bo_placement_for_flags+0x218/0x240 [xe]
> 
> Is fixed here by moving the bounds checks closer to where we actually
> write into the bo->placement array.
> 
> Fixes: 8c54ee8a8606 ("drm/xe: Ensure that we don't access the placements array out-of-bounds")
> Signed-off-by: Brian Welty <brian.welty@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_bo.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 338f9688a2c9..26fe73f58d72 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -125,9 +125,9 @@ static struct xe_mem_region *res_to_mem_region(struct ttm_resource *res)
>  static void try_add_system(struct xe_device *xe, struct xe_bo *bo,
>  			   u32 bo_flags, u32 *c)
>  {
> -	xe_assert(xe, *c < ARRAY_SIZE(bo->placements));
> -
>  	if (bo_flags & XE_BO_CREATE_SYSTEM_BIT) {
> +		xe_assert(xe, *c < ARRAY_SIZE(bo->placements));
> +
>  		bo->placements[*c] = (struct ttm_place) {
>  			.mem_type = XE_PL_TT,
>  		};
> @@ -145,6 +145,8 @@ static void add_vram(struct xe_device *xe, struct xe_bo *bo,
>  	struct xe_mem_region *vram;
>  	u64 io_size;
>  
> +	xe_assert(xe, *c < ARRAY_SIZE(bo->placements));
> +
>  	vram = to_xe_ttm_vram_mgr(ttm_manager_type(&xe->ttm, mem_type))->vram;
>  	xe_assert(xe, vram && vram->usable_size);
>  	io_size = vram->io_size;
> @@ -175,8 +177,6 @@ static void add_vram(struct xe_device *xe, struct xe_bo *bo,
>  static void try_add_vram(struct xe_device *xe, struct xe_bo *bo,
>  			 u32 bo_flags, u32 *c)
>  {
> -	xe_assert(xe, *c < ARRAY_SIZE(bo->placements));
> -
>  	if (bo->props.preferred_gt == XE_GT1) {
>  		if (bo_flags & XE_BO_CREATE_VRAM1_BIT)
>  			add_vram(xe, bo, bo->placements, bo_flags, XE_PL_VRAM1, c);
> @@ -193,9 +193,9 @@ static void try_add_vram(struct xe_device *xe, struct xe_bo *bo,
>  static void try_add_stolen(struct xe_device *xe, struct xe_bo *bo,
>  			   u32 bo_flags, u32 *c)
>  {
> -	xe_assert(xe, *c < ARRAY_SIZE(bo->placements));
> -
>  	if (bo_flags & XE_BO_CREATE_STOLEN_BIT) {
> +		xe_assert(xe, *c < ARRAY_SIZE(bo->placements));
> +
>  		bo->placements[*c] = (struct ttm_place) {
>  			.mem_type = XE_PL_STOLEN,
>  			.flags = bo_flags & (XE_BO_CREATE_PINNED_BIT |
> -- 
> 2.43.0
> 

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD98E81E1E
	for <intel-xe@archiver.kernel.org>; Fri,  6 Oct 2023 17:14:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37DB610E544;
	Fri,  6 Oct 2023 17:14:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72F8110E540
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Oct 2023 17:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696612491; x=1728148491;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xIzDthfJVLgQ9OJP+FXnhnBVPwqqZQjt1VekV0Me5Og=;
 b=cniu+QptsEaoLONeENIlkuiu8ZdNga/ILr1oz+bUIM8Lx6S2+yhn5YIW
 gcnt4WQqtr5KV/NwKzmuOtP8tWQWViRdNoqRJ1MlruHXQpAbDBiuF7TL8
 oBZeuZRVNxGwjVC2j5a3vLtgBMkug7P25aDu8syR+maNoOn4IEYOebFCo
 Tt80cR6pOdKpmfbsDLoca5/ED3uf6UWfJTdfmdtPKlI4eCn+hfW4G/MqC
 lM8+lHEv2e4uHfJelBID5w6o/sV0ty0Z8qcBOgMhWDkunJb0h/fk5+FlA
 ksXEAiBQB7Qt3MZ/RGWsml2NiWtkpQDew2EBzTZdUA1g7tanmT19cb9Aj g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="450281208"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="450281208"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 10:14:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="868408244"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="868408244"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Oct 2023 10:14:09 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 6 Oct 2023 10:14:09 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 6 Oct 2023 10:14:09 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 6 Oct 2023 10:14:09 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 6 Oct 2023 10:14:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MkL2368P2V7QgoBjmC7U/qnxgPVMfeOcpOChA114GWxC4Ls6BmKWFc5FuAcgJM1MVXfnVrTwWbe0AXEx94Y+WY8RHkU8wtyDy1rrGdyeh9PAOw6ceMHckPA8MoAOFSjx+XLNmxZZqjy7mPsQyLH5IcFfKlhUl6+i5rvGzvMnoccsg9G39heRX5r7JcuFZsSrkZtoIRBmGiGg5Kx29ewsBjOzhRbQ9eHYLcUASGvLMJGa9iJUOxxm/dbQdr1dGR2KTIonepqts+BNS64uDyFobAnNJEYYUC/sKNOGwvtpQ9y94DmFUXQXf9A1W0vM17tRnqATFjdwvAscXPLxnExvOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lRWn+vtSyWvhKfYEP0VmIYMn0iSysssF5LNMZXnfnUQ=;
 b=UYEwJta9O1G3QZ/1UnP9+NV4V/FraDymEjoI7+E4aLxoQmWGEa9RIWOPR5RY03AuJ8Z2dobvHrLu4jYvbkeXb4owKcCpI3GSSMOeaoxEEeQxpJL4+JqJrSieBHf5DYmGcGLf+D2o8+5ZOVR4rCEZ4lpez3Frs7E2e6HnBNcaEmG/bLvOUMW4mNEElKm/+jEkQcvzy6jJEsy4u3XwctbOmqZkOVrVPq5LTDh6YfrBsPKrvntIaor//ybzeGr3v5HVtAYkiaBOr/Jtc7i3dxAg+iOxngHH5Ebe6Kud2N0Th+QUUm1SogUKu7FlANDt1ySlIVJmTtl5DOyu9qKupC7Scg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by MN0PR11MB6182.namprd11.prod.outlook.com (2603:10b6:208:3c6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.39; Fri, 6 Oct
 2023 17:14:04 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::4182:281:404a:1042]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::4182:281:404a:1042%3]) with mapi id 15.20.6838.033; Fri, 6 Oct 2023
 17:14:04 +0000
Date: Fri, 6 Oct 2023 10:14:02 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: David Kershner <david.kershner@intel.com>
Message-ID: <ZSBAWobPIH/+9hnu@nvishwa1-DESK>
References: <20231005220040.552765-1-david.kershner@intel.com>
 <20231005220040.552765-3-david.kershner@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231005220040.552765-3-david.kershner@intel.com>
X-ClientProxiedBy: SJ0PR03CA0142.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::27) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|MN0PR11MB6182:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cdff9e5-6406-4b82-b28a-08dbc68fa492
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0ykUH7vO9QVyc8ZRPz+lRaktDbRMebCzFEIJzcugACJtKO2K3x+rlU2+JRhFyD5HGZ5xGpDTJKu5gvrs9m8aexsCiCEW+ktXBRW8y/3YCCMxe5mGfxmBtVXgmsjf74h9BbaPAM42QdObm+i+s3C1oCG+IsRc8msHEgEC2L51JII+r5/+jI26x4eB/YglilFF7NkRe51DXlCT13BC6H+ju9HzfudP8VRuHZgY5gcaByKnljBd/0RJ3/SzERXp/MoBejHoxrUinZEFauLxpb17AI8PDiYD+dGUmgVs44dqam+lnLqeNIK5GXHkVIId0gpponbP/t/AjPztancgtT2TmD/vlcMf8T7xCZosx9qua2EF9OBPfUOU4XN4mwIACRbOKsCgMlcWrzYeoX7aPhVnsnFJbye8Co8C+ggEp5J8moxUs5SeO+xQFECq6UdKMKvqLZU1xhOptDRYRtxx02OBCWBhlxP8SCq+dAurRFkvwte+pYiN76xh2t8lzOOOvmu3m8ZNNnhw110JOf+qAHafN0aiDoL3eeYhzZ5my+Y+ukxihAYYXLxCbotRYjLjGV4o
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(39860400002)(346002)(366004)(136003)(376002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(83380400001)(6506007)(6512007)(6486002)(478600001)(86362001)(38100700002)(82960400001)(41300700001)(316002)(33716001)(107886003)(26005)(9686003)(2906002)(44832011)(66946007)(66556008)(66476007)(5660300002)(4326008)(6636002)(8676002)(6862004)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ad8spo4euG9RQG3aAuf1w9R7t3+gGKByDxG5pSKShM6IoOhM6cCC+rErHOia?=
 =?us-ascii?Q?0UJM5JwXft9GP1K5Y8gSpMFTYHbI9yXV4BR2oh+MMD+t41N8omL+qgCJByXW?=
 =?us-ascii?Q?z/X3FFqrhzib7Gv5HnXjNfT5PsCxv31QyRv2NfCC/9tDslyG8OxUpC63/2eS?=
 =?us-ascii?Q?JX3cRCq8ScEpLtmtz5s/rWJ1s7OGHHTScMIEBRbQrMIN8YEa2BSTGDF1zpXS?=
 =?us-ascii?Q?GaizTUXUjZzjteRakoL0olgjNuDp2VmiMfAMFu8bAB3wxftYehc7hwdkZTDy?=
 =?us-ascii?Q?XduIs5EZNDH1mbExNddHAK9q+OwESRVnwjDEM8NfxWkqNXR8f2vVnPiC42Us?=
 =?us-ascii?Q?eKrkOdonhvml4V265+SdrMBpbh9WKOXIUN61XF3eD6E4MKC+C56H2yC9jlqf?=
 =?us-ascii?Q?yjPDFrj77cSXKy00NYB5CY1lEtn+0hJcuP3KYZ3elbvI+YSdD1caY/CcOxfw?=
 =?us-ascii?Q?9oPTRaUeYqxrNfaDcwpC+uxt2UAGMpxno9V6JFkJ3zfoEjYPaRnqYflONhsC?=
 =?us-ascii?Q?xjUhWY4mzVGnA7uiloJlnVHgBZizBaQqcTGNZGlxeYtnmaJXDE9RkDIe42D7?=
 =?us-ascii?Q?CXa9zl75kSOeOPfYEjCwu9GnRgQgrWsLzMUR1FyUPSJecLQZzsi295WJmEd1?=
 =?us-ascii?Q?BsNxmZ1ki9bNF08C4IyncXjw9RyTOp4ySIwQnEjNRH27k5xQf6DKd9DrfTo7?=
 =?us-ascii?Q?nqdoEs4xmYyKnRtdaDOGlY13w5GRN8ebPBb2H/k9H1I6r4yUaLawzRkXdODm?=
 =?us-ascii?Q?y5r3QFwghV7axhaYcqyMpl3swVS54tX7Kbqfu+4u8z9bMpXmcN9Y9v8ZjPIq?=
 =?us-ascii?Q?Ax7gmqmOnjeMiukprCOj3zZOBJgZZsGO5J4H3rNWbwtVns2l6vkVX2fYWncz?=
 =?us-ascii?Q?e5omB35xnMIoPsyedVKv7KdBV+SI0ub8P6gfp0SkbDHMEcmQIVKVcE7++Uzp?=
 =?us-ascii?Q?7eF00PAfDrP6NoYo1iz34f26YRMsKWbDoUlqVVfTFTfZioppHthS0FeJS7b0?=
 =?us-ascii?Q?pzVklidkAnV3NLqa8dpe1ZjkguZdXtM+ZFNVSJ5Qo96/OyJ6XoOf5vfKhoqp?=
 =?us-ascii?Q?bymC74/BfX8Pfur6GwbZaRLvxZQVkZzt3V6XN2qaRCBLuHUBQDWRKLX0lCpA?=
 =?us-ascii?Q?/5VpScSxJe+tMwyJfbxvT0U0ENc2qJ7B//P2t/aaTJspNQ1KBaFk5akw3mMo?=
 =?us-ascii?Q?MRRwlBHn9/+DZaeDgSSwMmbKAwzcIZqo5Q12rsbu7w+Z/WNvl0xT0Ogk0nu0?=
 =?us-ascii?Q?U+86Ua8hR2C42ttfJxuxMNeL41WWLU5P/FPXmqylkQ0SruftW1eqIH3kw3k/?=
 =?us-ascii?Q?ZFVNWjSZ5yJ9PoHb4hD4nk/mqkyZ6CAI4ZK6jYokGpmCY6Ry38JC/ox9jwpw?=
 =?us-ascii?Q?eSe/TLxKhGBG7edHihf8vwVj1MV6kQhEYhyWhDq7Y203CIsTnPYt2ENBk+12?=
 =?us-ascii?Q?CGT9o1ENP1dtJ/zJeHPsoNXFV1SaCu+8oTL8qyzdE3QCNmeOjipCqfxf2gvL?=
 =?us-ascii?Q?LpdD66Gw8K1jYbGSCpG4ll9Wenjk3t8LLTeQJjxlrS0fl6nxtiaSan53ysgZ?=
 =?us-ascii?Q?3GYPn55dS0uBrwjFWMmrbJNdDI/Vq3Olx6kJEz8RRF/WzeyQYEx/tVdoX4VU?=
 =?us-ascii?Q?r9euJ+WYpctICsp2zPyG1bQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cdff9e5-6406-4b82-b28a-08dbc68fa492
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2023 17:14:04.8001 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S3BjnVrnUUFXlfrUlW89QhSNy7NY23Ggtu8JeEncgRrCXhKs0V0bEPM4GcVg9kPuciCwRrzWZjTXP0ZMZafi4hfxNeMHqP/72GA9b4HPdthVdX+qugE+8t8J45CUiTcv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6182
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 2/2] drm/xe/tests/xe_migrate.c: Add vram
 to vram KUNIT test
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
Cc: john.fleck@intel.com, stuart.summers@intel.com, matthew.d.roper@intel.com,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Oct 05, 2023 at 06:00:40PM -0400, David Kershner wrote:
>Add missing kunit test to migrate a bo from vram to vram
>
>Signed-off-by: David Kershner <david.kershner@intel.com>

Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>---
> drivers/gpu/drm/xe/tests/xe_migrate.c | 103 +++++++++++++++++---------
> 1 file changed, 66 insertions(+), 37 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
>index 6906ff9d9c31..0db4b651ff1a 100644
>--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
>+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
>@@ -99,7 +99,7 @@ static const struct xe_migrate_pt_update_ops sanity_ops = {
> 		} } while (0)
>
> static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
>-		      struct kunit *test)
>+		      struct kunit *test, u32 region)
> {
> 	struct xe_device *xe = tile_to_xe(m->tile);
> 	u64 retval, expected = 0;
>@@ -108,83 +108,104 @@ static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
> 	const char *str = big ? "Copying big bo" : "Copying small bo";
> 	int err;
>
>-	struct xe_bo *sysmem = xe_bo_create_locked(xe, m->tile, NULL,
>+	struct xe_bo *remote = xe_bo_create_locked(xe, m->tile, NULL,
> 						   bo->size,
> 						   ttm_bo_type_kernel,
>-						   XE_BO_CREATE_SYSTEM_BIT |
>+						   region |
> 						   XE_BO_NEEDS_CPU_ACCESS);
>-	if (IS_ERR(sysmem)) {
>-		KUNIT_FAIL(test, "Failed to allocate sysmem bo for %s: %li\n",
>-			   str, PTR_ERR(sysmem));
>+	if (IS_ERR(remote)) {
>+		KUNIT_FAIL(test, "Failed to allocate remote bo for %s: %li\n",
>+			   str, PTR_ERR(remote));
> 		return;
> 	}
>
>-	err = xe_bo_validate(sysmem, NULL, false);
>+	err = xe_bo_validate(remote, NULL, false);
> 	if (err) {
> 		KUNIT_FAIL(test, "Failed to validate system bo for %s: %li\n",
> 			   str, err);
> 		goto out_unlock;
> 	}
>
>-	err = xe_bo_vmap(sysmem);
>+	err = xe_bo_vmap(remote);
> 	if (err) {
> 		KUNIT_FAIL(test, "Failed to vmap system bo for %s: %li\n",
> 			   str, err);
> 		goto out_unlock;
> 	}
>
>-	xe_map_memset(xe, &sysmem->vmap, 0, 0xd0, sysmem->size);
>-	fence = xe_migrate_clear(m, sysmem, sysmem->ttm.resource);
>-	if (!sanity_fence_failed(xe, fence, big ? "Clearing sysmem big bo" :
>-				 "Clearing sysmem small bo", test)) {
>-		retval = xe_map_rd(xe, &sysmem->vmap, 0, u64);
>-		check(retval, expected, "sysmem first offset should be cleared",
>+	xe_map_memset(xe, &remote->vmap, 0, 0xd0, remote->size);
>+	fence = xe_migrate_clear(m, remote, remote->ttm.resource);
>+	if (!sanity_fence_failed(xe, fence, big ? "Clearing remote big bo" :
>+				 "Clearing remote small bo", test)) {
>+		retval = xe_map_rd(xe, &remote->vmap, 0, u64);
>+		check(retval, expected, "remote first offset should be cleared",
> 		      test);
>-		retval = xe_map_rd(xe, &sysmem->vmap, sysmem->size - 8, u64);
>-		check(retval, expected, "sysmem last offset should be cleared",
>+		retval = xe_map_rd(xe, &remote->vmap, remote->size - 8, u64);
>+		check(retval, expected, "remote last offset should be cleared",
> 		      test);
> 	}
> 	dma_fence_put(fence);
>
>-	/* Try to copy 0xc0 from sysmem to vram with 2MB or 64KiB/4KiB pages */
>-	xe_map_memset(xe, &sysmem->vmap, 0, 0xc0, sysmem->size);
>+	/* Try to copy 0xc0 from remote to vram with 2MB or 64KiB/4KiB pages */
>+	xe_map_memset(xe, &remote->vmap, 0, 0xc0, remote->size);
> 	xe_map_memset(xe, &bo->vmap, 0, 0xd0, bo->size);
>
> 	expected = 0xc0c0c0c0c0c0c0c0;
>-	fence = xe_migrate_copy(m, sysmem, bo, sysmem->ttm.resource,
>+	fence = xe_migrate_copy(m, remote, bo, remote->ttm.resource,
> 				bo->ttm.resource);
>-	if (!sanity_fence_failed(xe, fence, big ? "Copying big bo sysmem -> vram" :
>-				 "Copying small bo sysmem -> vram", test)) {
>+	if (!sanity_fence_failed(xe, fence, big ? "Copying big bo remote -> vram" :
>+				 "Copying small bo remote -> vram", test)) {
> 		retval = xe_map_rd(xe, &bo->vmap, 0, u64);
> 		check(retval, expected,
>-		      "sysmem -> vram bo first offset should be copied", test);
>+		      "remote -> vram bo first offset should be copied", test);
> 		retval = xe_map_rd(xe, &bo->vmap, bo->size - 8, u64);
> 		check(retval, expected,
>-		      "sysmem -> vram bo offset should be copied", test);
>+		      "remote -> vram bo offset should be copied", test);
> 	}
> 	dma_fence_put(fence);
>
> 	/* And other way around.. slightly hacky.. */
>-	xe_map_memset(xe, &sysmem->vmap, 0, 0xd0, sysmem->size);
>+	xe_map_memset(xe, &remote->vmap, 0, 0xd0, remote->size);
> 	xe_map_memset(xe, &bo->vmap, 0, 0xc0, bo->size);
>
>-	fence = xe_migrate_copy(m, bo, sysmem, bo->ttm.resource,
>-				sysmem->ttm.resource);
>-	if (!sanity_fence_failed(xe, fence, big ? "Copying big bo vram -> sysmem" :
>-				 "Copying small bo vram -> sysmem", test)) {
>-		retval = xe_map_rd(xe, &sysmem->vmap, 0, u64);
>+	fence = xe_migrate_copy(m, bo, remote, bo->ttm.resource,
>+				remote->ttm.resource);
>+	if (!sanity_fence_failed(xe, fence, big ? "Copying big bo vram -> remote" :
>+				 "Copying small bo vram -> remote", test)) {
>+		retval = xe_map_rd(xe, &remote->vmap, 0, u64);
> 		check(retval, expected,
>-		      "vram -> sysmem bo first offset should be copied", test);
>-		retval = xe_map_rd(xe, &sysmem->vmap, bo->size - 8, u64);
>+		      "vram -> remote bo first offset should be copied", test);
>+		retval = xe_map_rd(xe, &remote->vmap, bo->size - 8, u64);
> 		check(retval, expected,
>-		      "vram -> sysmem bo last offset should be copied", test);
>+		      "vram -> remote bo last offset should be copied", test);
> 	}
> 	dma_fence_put(fence);
>
>-	xe_bo_vunmap(sysmem);
>+	xe_bo_vunmap(remote);
> out_unlock:
>-	xe_bo_unlock(sysmem);
>-	xe_bo_put(sysmem);
>+	xe_bo_unlock(remote);
>+	xe_bo_put(remote);
>+}
>+
>+static void test_copy_sysmem(struct xe_migrate *m, struct xe_bo *bo,
>+			     struct kunit *test)
>+{
>+	test_copy(m, bo, test, XE_BO_CREATE_SYSTEM_BIT);
>+}
>+
>+static void test_copy_vram(struct xe_migrate *m, struct xe_bo *bo,
>+			   struct kunit *test)
>+{
>+	u32 region;
>+
>+	if (bo->ttm.resource->mem_type == XE_PL_SYSTEM)
>+		return;
>+
>+	if (bo->ttm.resource->mem_type == XE_PL_VRAM0)
>+		region = XE_BO_CREATE_VRAM1_BIT;
>+	else
>+		region = XE_BO_CREATE_VRAM0_BIT;
>+	test_copy(m, bo, test, region);
> }
>
> static void test_pt_update(struct xe_migrate *m, struct xe_bo *pt,
>@@ -349,7 +370,11 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
> 	check(retval, expected, "Command clear small last value", test);
>
> 	kunit_info(test, "Copying small buffer object to system\n");
>-	test_copy(m, tiny, test);
>+	test_copy_sysmem(m, tiny, test);
>+	if (xe->info.tile_count > 1) {
>+		kunit_info(test, "Copying small buffer object to other vram\n");
>+		test_copy_vram(m, tiny, test);
>+	}
>
> 	/* Clear a big bo */
> 	kunit_info(test, "Clearing big buffer object\n");
>@@ -366,7 +391,11 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
> 	check(retval, expected, "Command clear big last value", test);
>
> 	kunit_info(test, "Copying big buffer object to system\n");
>-	test_copy(m, big, test);
>+	test_copy_sysmem(m, big, test);
>+	if (xe->info.tile_count > 1) {
>+		kunit_info(test, "Copying big buffer object to other vram\n");
>+		test_copy_vram(m, big, test);
>+	}
>
> 	kunit_info(test, "Testing page table update using CPU if GPU idle.\n");
> 	test_pt_update(m, pt, test, false);
>-- 
>2.35.1
>

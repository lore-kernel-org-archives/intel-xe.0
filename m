Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF148C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 16:18:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB7AD10E91B;
	Thu,  7 Dec 2023 16:18:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 232BA10E91C
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 16:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701965880; x=1733501880;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=dCWMFisIcw2E9ENsfjXQbHGKPpG+jIeyUZ8jJcHxmYI=;
 b=I3YY1E6p9Zwqnp8VFJuehg+8BWft/9eYhcgrNNVzMy3pg8wiG+zGDMWS
 Hzjsj7z5B9W20KlpR3mq5e7hwAFYZHV1Ut5MR4/M7Dr0F48HAALfIuZNV
 w8IfUOAesc5OT+a930+AO/6Z/1CP3IyGEqfn7zFIZCnOc2Q6cYpWkP7+Y
 BoLymS2zJzAjfUSCXq9LtEkNEFFqWvhVJZMxWVpwpmXVwqB30a2agAvnV
 T/d7/m/Uzcgsnj7h47oDCH6Xco4EHHoVk1bRpvT6r/KANGd3dfdZW4k8+
 OUUiR3da5Z1/G9UvSe+awkZvums8SE5m71KMJjh5OsbDi6a3UH/mJMvyA w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="1084651"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="1084651"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 08:17:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="889798805"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="889798805"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 08:17:55 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 08:17:54 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 08:17:54 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 08:17:54 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 08:17:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QC8H4NtvXqBPPm0pQGWdOtQC8li0OWUbP6yC8gCFDYpVhc4HDN51wNskQx4DnEJEUdcnA2K0XtyN8Z79xk91aU0DSnBjm+74rWIqkGW09RucyzErvkzVLO/SiOcB6N/W2z3PFSZGLzborCcHyqMvS641rhRWwwoSvJKBgp9zJToF9r8Hs2AEC3tqgthdkTjQeE3LCo0fXN62gNnU453pJrrT5Gjtr53KDpQBlzBdNuvNs1/c9MRhhX+CCKqGqsY5FQvPomJLxFm+6pV5Rh+cAiE18Kt5Bva8m0OJJDCYOWklB8a9F+gzs8LxqoV0H1cO5GXPchMJRA5BD81qsq61wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xEYAiaccQzrJxIJbGri9ACqAx76IiqqMLHp5JLr/z6o=;
 b=b5d++S6/xEOvuZppDfTADStxtWnaw5WY8YK8CmFmcWcuSkx18GNxKVDCSx4cZF53tdonvLDZtnC1xKah2yDVZgmDQJpoJe+MsfsPjeN+zI/sEkh80LOuwfT6uuHbiP5VxrhaGApkumcPo9fxj5U5/CcoGlo1Rnu1RaP2gEZBadmef4fLYfSiHPVAedfhS4EgBBeQFt9k+XvYgs21PFwmWzdSxKUW/ZW92VZ8ZPXA8pGt+nUxynIrBl+jkpmcYyjBG+WyNB8QOfNUo/7DIFcFLsPjE9rdTETRlslFaknw48gx0eU5uqN9xZODi2PHbI6Vg30xcAN0FwBSUxFsu5bSGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB4934.namprd11.prod.outlook.com (2603:10b6:510:30::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Thu, 7 Dec
 2023 16:17:47 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7046.033; Thu, 7 Dec 2023
 16:17:47 +0000
Date: Thu, 7 Dec 2023 10:17:44 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Replace the scratch pages with NULL PTEs
Message-ID: <dktre5juul24vbetvhi67r3n2gnlnjihppf74vddyrobxetxc7@5nha57x4mdwb>
References: <20231207154423.35666-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231207154423.35666-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BYAPR08CA0054.namprd08.prod.outlook.com
 (2603:10b6:a03:117::31) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB4934:EE_
X-MS-Office365-Filtering-Correlation-Id: e147b135-2db1-4097-a036-08dbf7400cb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1LefZbzzKAhHORZTQmkJmjt1P8DBPMk7YYaINDOQ7gMFfEDRA+teRRcHoXf4vlh3WkEUwo/2s6sSRiAS6a74iS1aJb9nFr2CUvlMUn5hyxe8iDIIjeZ1O0JxvxvcjEEuziUUoj7WT9gric8klx3ZjcGF+IUNr6KNObtZa4DZCywTJXgNOxEWhpqmFmNnmo1CoZJ4B/Dpx1rQdbaNrwPCJwVjznoHjffYuV2rZdMuAkCppBKc/Bc6WNfgT1fB1N/1I7zYliYzNjUIgHoXNDhUUvXXnax1qGFAmV3Hl11tL+/H0AcPfY7jGUfgmIBPo0WEw4wNXpLMqpmPWrNUaethPxLr0exhdKTZdlL8bP16m3priyDQoH20/4A4COielkJn07Rq7qzR0oaEpdH/UxmdPxuAmYYW5ILEmdZ6VBtry8Xp6Jj8uCyWjrdToL72K1/fSLCrQewXevJc9XnMbD25LDfVdBMxmFRD+cX7QPDMC1ZnM2c9Qq40sqYGjowP4Tyg8ukNylIasPPQ8VZ0qNc8ewGYKm/MYePFu8xzti0CwuSSSIZ8TcQe4A19iC6jngLU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(396003)(366004)(136003)(376002)(39860400002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(316002)(66946007)(66556008)(66476007)(6506007)(9686003)(6512007)(6666004)(41300700001)(26005)(478600001)(6486002)(38100700002)(86362001)(33716001)(82960400001)(83380400001)(66574015)(6916009)(2906002)(5660300002)(66899024)(4326008)(8936002)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?9Mq5QkRiEl20yMJSvVSZwglJ2OI5Gn/PW9xJZkq99csHt3X8bNuvgoF523?=
 =?iso-8859-1?Q?6exfrnwGNK2SOBbOAjp2tgWvxYdwRA48KBkyY++hMl7ChIdeK6uv+e9TDg?=
 =?iso-8859-1?Q?ymxPxACKIs3KDdbw5z8PD8uj0lnH4iMtyxtPFGrpy6LPQDNvWDa1EP25j5?=
 =?iso-8859-1?Q?54rsX1/nU1F3jSaMT3FqEH1TsKvc68+onTtiEI56/ulBzaV3XvAbQ5mK2x?=
 =?iso-8859-1?Q?IwGuocM+jm6zZI5GraDU6WXBbwo9E3TGvEOuz3j9BRL9vpT6yPLfenrrHv?=
 =?iso-8859-1?Q?foze5GG4JoREf5s5hFwj6haVRUUj/Qz0wWIDjQvASRvUSoQpttsPH6EM45?=
 =?iso-8859-1?Q?Mur3suZuZtyPb1T1ao2LhSR/l9IAFwBbExhwobb92qTTi8poEM4+A5u2l1?=
 =?iso-8859-1?Q?0ft+rO2IcUrVfaQyceIQX4bZrkjSVUGfDaVZw9dS3/JLjiymqqIm7677jq?=
 =?iso-8859-1?Q?h1ugX6Y4ab/ZvKl168cy5TPfmtuYYuO/ZyUHGzKeGFNoiQbLA8GlriV/tY?=
 =?iso-8859-1?Q?61UxfC7X5JIzzyG6w9GZS3JZZ8NG0C0EKKSNiZt4k/5E6BJYV+woxwJrgM?=
 =?iso-8859-1?Q?z18Mp5SBvzcFpnWxcIKtE8uE/3TL//19Ia8dHuVLl3urAaUDAfKLLXL7jL?=
 =?iso-8859-1?Q?+t8WyuInvWZzXbZR38+mbkzVU8TZKAwNe1Nk7axS+Tt/kW4qqxZv13PcBf?=
 =?iso-8859-1?Q?F/yfudBsy4ZUNV3Y2MljDXDwOS6TSc2bbyNTG8uT0YhY7w+gDXbGPUobdm?=
 =?iso-8859-1?Q?k/kaFZAod81m9T1OyS2AMHFn8wGmbJjj33pQPC0l9IFyiM6n9vccBlVqR9?=
 =?iso-8859-1?Q?xdks2Qo62k2uHp0y/2a7JG7+eoqBCo6Tbo1sIx8udjGec2RdQW4zda9nev?=
 =?iso-8859-1?Q?mH7LHfGJ46sUAy4TJabFV04pTUlLEQ0Jnr8NNSJddR/e8sSw3j1OuBBsz+?=
 =?iso-8859-1?Q?zBeTC7iWOY+XYzf9z8jshV+dvq/Un9xmVDrdnUsHOea6zI1+Mb4LeVNeZt?=
 =?iso-8859-1?Q?SQGjt4KDdnoqHJ6TYSMJfWKwvvqoOFaOdqLeRNyAsd/KOw8oFZPTpm+qhw?=
 =?iso-8859-1?Q?CQwOUjs9XqHixmK87cS+ZOSSlPoisQJ6P/gAAvu7xEke8JV+u6KRGi3aWo?=
 =?iso-8859-1?Q?tXlQnPGQBtnxtdvBksCCQHHXB1gBdwD7FC0IH2BWi1EEy7xnsiAf7uS8OI?=
 =?iso-8859-1?Q?67rekW+A0hzMwWrNbSmZ1VtiqStMamCXYUd5HH5Z4/ekBBnT5v68ARZvOK?=
 =?iso-8859-1?Q?G2T7lbgegFgmcOk45CAWdojGL46lfMu//XNhpMwqzIylvjQkVgGOsAC6JC?=
 =?iso-8859-1?Q?FFUUyRQndFpOBsJsCJcn56ZBgIvtV7j2D5nFU7kiiyoDVy2VstltDtPDme?=
 =?iso-8859-1?Q?isYZFD2Cu/d75qtbiSvYb0kLlS4pDBIi9an6jxkTJxFmTCe8thBQZyLsB1?=
 =?iso-8859-1?Q?CfOFNPNJpnhWCdEOkoEBN7D8/39RmRJf0RusxpqOy+gRkbQD2zINVXWxEb?=
 =?iso-8859-1?Q?YOihFvTKVSQ4SqWyGmc6VDpbU5KQ95/yQjGoLkPwE5XWTSPozaMtDKff0d?=
 =?iso-8859-1?Q?yUOgA9v8CDkMwvsSVF5TRnbWM81NXuQccCByqmay5WorlFsdOCaJUw7jcu?=
 =?iso-8859-1?Q?mxBDEVJEgOf1tjJnOyKSt69ZSVAdG/n2wfOfUEbtqQiDCDziS2hdDqPA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e147b135-2db1-4097-a036-08dbf7400cb1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 16:17:46.9571 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uvIXQyUCPVjwMDM7yFtVXvjQ3atrFZ2qnnT+MV8802Ymh+ZrpXqV6SCM16rNFjdugaLs4K1EbVPc7ybQn6mOXCIZhS67yfhiEmkFHdxmbWo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4934
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

On Thu, Dec 07, 2023 at 04:44:23PM +0100, Thomas Hellström wrote:
>Replace the scratch pages with NULL PTEs that return 0 when reading and
>do nothing when writing.

but don't we want to keep scratch so we can check when things go wrong
and writes go where they shouldn't?

Lucas De Marchi

>
>Cc: Brian Welty <brian.welty@intel.com>
>Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>---
> drivers/gpu/drm/xe/xe_pt.c       | 68 ++++----------------------------
> drivers/gpu/drm/xe/xe_pt.h       |  3 --
> drivers/gpu/drm/xe/xe_vm.c       | 45 +--------------------
> drivers/gpu/drm/xe/xe_vm.h       |  5 +++
> drivers/gpu/drm/xe/xe_vm_types.h |  2 -
> 5 files changed, 14 insertions(+), 109 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>index 35bd7940a571..ce2846d56b04 100644
>--- a/drivers/gpu/drm/xe/xe_pt.c
>+++ b/drivers/gpu/drm/xe/xe_pt.c
>@@ -50,17 +50,14 @@ static struct xe_pt *xe_pt_entry(struct xe_pt_dir *pt_dir, unsigned int index)
> static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
> 			     unsigned int level)
> {
>-	u16 pat_index = tile_to_xe(tile)->pat.idx[XE_CACHE_WB];
>-	u8 id = tile->id;
>+	struct xe_device *xe = tile_to_xe(tile);
>+	u16 pat_index = xe->pat.idx[XE_CACHE_WB];
>
>-	if (!vm->scratch_bo[id])
>+	if (!xe_vm_has_scratch(vm))
> 		return 0;
>
>-	if (level > 0)
>-		return vm->pt_ops->pde_encode_bo(vm->scratch_pt[id][level - 1]->bo,
>-						 0, pat_index);
>-
>-	return vm->pt_ops->pte_encode_bo(vm->scratch_bo[id], 0, pat_index, 0);
>+	return vm->pt_ops->pte_encode_addr(xe, 0, pat_index, level, IS_DGFX(xe),
>+					   0) | XE_PTE_NULL;
> }
>
> /**
>@@ -135,7 +132,7 @@ void xe_pt_populate_empty(struct xe_tile *tile, struct xe_vm *vm,
> 	u64 empty;
> 	int i;
>
>-	if (!vm->scratch_bo[tile->id]) {
>+	if (!xe_vm_has_scratch(vm)) {
> 		/*
> 		 * FIXME: Some memory is allocated already allocated to zero?
> 		 * Find out which memory that is and avoid this memset...
>@@ -194,57 +191,6 @@ void xe_pt_destroy(struct xe_pt *pt, u32 flags, struct llist_head *deferred)
> 	kfree(pt);
> }
>
>-/**
>- * xe_pt_create_scratch() - Setup a scratch memory pagetable tree for the
>- * given tile and vm.
>- * @xe: xe device.
>- * @tile: tile to set up for.
>- * @vm: vm to set up for.
>- *
>- * Sets up a pagetable tree with one page-table per level and a single
>- * leaf bo. All pagetable entries point to the single page-table or,
>- * for L0, the single bo one level below.
>- *
>- * Return: 0 on success, negative error code on error.
>- */
>-int xe_pt_create_scratch(struct xe_device *xe, struct xe_tile *tile,
>-			 struct xe_vm *vm)
>-{
>-	u8 id = tile->id;
>-	unsigned int flags;
>-	int i;
>-
>-	/*
>-	 * So we don't need to worry about 64K TLB hints when dealing with
>-	 * scratch entires, rather keep the scratch page in system memory on
>-	 * platforms where 64K pages are needed for VRAM.
>-	 */
>-	flags = XE_BO_CREATE_PINNED_BIT;
>-	if (vm->flags & XE_VM_FLAG_64K)
>-		flags |= XE_BO_CREATE_SYSTEM_BIT;
>-	else
>-		flags |= XE_BO_CREATE_VRAM_IF_DGFX(tile);
>-
>-	vm->scratch_bo[id] = xe_bo_create_pin_map(xe, tile, vm, SZ_4K,
>-						  ttm_bo_type_kernel,
>-						  flags);
>-	if (IS_ERR(vm->scratch_bo[id]))
>-		return PTR_ERR(vm->scratch_bo[id]);
>-
>-	xe_map_memset(vm->xe, &vm->scratch_bo[id]->vmap, 0, 0,
>-		      vm->scratch_bo[id]->size);
>-
>-	for (i = 0; i < vm->pt_root[id]->level; i++) {
>-		vm->scratch_pt[id][i] = xe_pt_create(vm, tile, i);
>-		if (IS_ERR(vm->scratch_pt[id][i]))
>-			return PTR_ERR(vm->scratch_pt[id][i]);
>-
>-		xe_pt_populate_empty(tile, vm, vm->scratch_pt[id][i]);
>-	}
>-
>-	return 0;
>-}
>-
> /**
>  * DOC: Pagetable building
>  *
>@@ -1286,7 +1232,7 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queue
> 	 * it needs to be done here.
> 	 */
> 	if ((rebind && !xe_vm_in_lr_mode(vm) && !vm->batch_invalidate_tlb) ||
>-	    (!rebind && vm->scratch_bo[tile->id] && xe_vm_in_preempt_fence_mode(vm))) {
>+	    (!rebind && xe_vm_has_scratch(vm) && xe_vm_in_preempt_fence_mode(vm))) {
> 		ifence = kzalloc(sizeof(*ifence), GFP_KERNEL);
> 		if (!ifence)
> 			return ERR_PTR(-ENOMEM);
>diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
>index d5460e58dbbf..6f7359ac55bd 100644
>--- a/drivers/gpu/drm/xe/xe_pt.h
>+++ b/drivers/gpu/drm/xe/xe_pt.h
>@@ -26,9 +26,6 @@ unsigned int xe_pt_shift(unsigned int level);
> struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
> 			   unsigned int level);
>
>-int xe_pt_create_scratch(struct xe_device *xe, struct xe_tile *tile,
>-			 struct xe_vm *vm);
>-
> void xe_pt_populate_empty(struct xe_tile *tile, struct xe_vm *vm,
> 			  struct xe_pt *pt);
>
>diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>index e09050f16f07..868b9a2a5d02 100644
>--- a/drivers/gpu/drm/xe/xe_vm.c
>+++ b/drivers/gpu/drm/xe/xe_vm.c
>@@ -1332,7 +1332,7 @@ static void vm_destroy_work_func(struct work_struct *w);
> struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
> {
> 	struct xe_vm *vm;
>-	int err, i = 0, number_tiles = 0;
>+	int err, number_tiles = 0;
> 	struct xe_tile *tile;
> 	u8 id;
>
>@@ -1397,17 +1397,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
> 		}
> 	}
>
>-	if (flags & XE_VM_FLAG_SCRATCH_PAGE) {
>-		for_each_tile(tile, xe, id) {
>-			if (!vm->pt_root[id])
>-				continue;
>-
>-			err = xe_pt_create_scratch(xe, tile, vm);
>-			if (err)
>-				goto err_scratch_pt;
>-		}
>+	if (xe_vm_has_scratch(vm))
> 		vm->batch_invalidate_tlb = true;
>-	}
>
> 	if (flags & XE_VM_FLAG_LR_MODE) {
> 		INIT_WORK(&vm->preempt.rebind_work, preempt_rebind_work_func);
>@@ -1415,7 +1406,6 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
> 		vm->batch_invalidate_tlb = false;
> 	}
>
>-	/* Fill pt_root after allocating scratch tables */
> 	for_each_tile(tile, xe, id) {
> 		if (!vm->pt_root[id])
> 			continue;
>@@ -1465,19 +1455,6 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>
> 	return vm;
>
>-err_scratch_pt:
>-	for_each_tile(tile, xe, id) {
>-		if (!vm->pt_root[id])
>-			continue;
>-
>-		i = vm->pt_root[id]->level;
>-		while (i)
>-			if (vm->scratch_pt[id][--i])
>-				xe_pt_destroy(vm->scratch_pt[id][i],
>-					      vm->flags, NULL);
>-		xe_bo_unpin(vm->scratch_bo[id]);
>-		xe_bo_put(vm->scratch_bo[id]);
>-	}
> err_destroy_root:
> 	for_each_tile(tile, xe, id) {
> 		if (vm->pt_root[id])
>@@ -1556,24 +1533,6 @@ void xe_vm_close_and_put(struct xe_vm *vm)
> 		vma->gpuva.flags |= XE_VMA_DESTROYED;
> 	}
>
>-	/*
>-	 * All vm operations will add shared fences to resv.
>-	 * The only exception is eviction for a shared object,
>-	 * but even so, the unbind when evicted would still
>-	 * install a fence to resv. Hence it's safe to
>-	 * destroy the pagetables immediately.
>-	 */
>-	for_each_tile(tile, xe, id) {
>-		if (vm->scratch_bo[id]) {
>-			u32 i;
>-
>-			xe_bo_unpin(vm->scratch_bo[id]);
>-			xe_bo_put(vm->scratch_bo[id]);
>-			for (i = 0; i < vm->pt_root[id]->level; i++)
>-				xe_pt_destroy(vm->scratch_pt[id][i], vm->flags,
>-					      NULL);
>-		}
>-	}
> 	xe_vm_unlock(vm);
>
> 	/*
>diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
>index 9a0ae19c47b7..b92d8f54011d 100644
>--- a/drivers/gpu/drm/xe/xe_vm.h
>+++ b/drivers/gpu/drm/xe/xe_vm.h
>@@ -61,6 +61,11 @@ static inline bool xe_vm_is_closed_or_banned(struct xe_vm *vm)
> 	return xe_vm_is_closed(vm) || xe_vm_is_banned(vm);
> }
>
>+static inline bool xe_vm_has_scratch(const struct xe_vm *vm)
>+{
>+	return vm->flags & XE_VM_FLAG_SCRATCH_PAGE;
>+}
>+
> struct xe_vma *
> xe_vm_find_overlapping_vma(struct xe_vm *vm, u64 start, u64 range);
>
>diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
>index 23abdfd8622f..a5762e99e6aa 100644
>--- a/drivers/gpu/drm/xe/xe_vm_types.h
>+++ b/drivers/gpu/drm/xe/xe_vm_types.h
>@@ -158,8 +158,6 @@ struct xe_vm {
> 	u64 size;
>
> 	struct xe_pt *pt_root[XE_MAX_TILES_PER_DEVICE];
>-	struct xe_bo *scratch_bo[XE_MAX_TILES_PER_DEVICE];
>-	struct xe_pt *scratch_pt[XE_MAX_TILES_PER_DEVICE][XE_VM_MAX_LEVEL];
>
> 	/**
> 	 * @flags: flags for this VM, statically setup a creation time aside
>-- 
>2.42.0
>

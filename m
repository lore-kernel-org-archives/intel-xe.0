Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28EA8E71D33
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 20:21:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEEC110E157;
	Fri, 29 Sep 2023 20:21:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 842B110E157
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 20:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696018911; x=1727554911;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ee3Q1IgnIjfnQ3rny77RWY6gc9yxSnIhDYfuPa5zIG0=;
 b=oFbbhSD6O+ksuxkjPPs3e4exRvI2OcOsynqluqWfyRwPMtN6bJEiE2Mw
 900QR6++EiX6JqqTXqB5R1izs0Je02IFFyFJWQJ3buuZXkF/JmflrkLNF
 IkfbPOf0xw0oie57enS9t6LcXIJz+uJ6hOuImePUTGgbwGJuwvqbAeaHw
 hDIH4Of4Ex+oGfz0+EENNon02qgcSYVIR+noQBLLuhPACgMxEBhjqEtqp
 dN5jkhGhgWkQvB2J0Rg2MjbryHPYo2uDriRnJW92B/0A8ZlwsGh6AQW1Y
 Xi6t4VTkcLWCOE2GzVx4svEKZYSJbn2w7z/wlLXxlmhK5BRJOsQq+50bM Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="413261229"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="413261229"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 11:59:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="815685677"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="815685677"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Sep 2023 11:59:31 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 11:59:30 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 11:59:30 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 29 Sep 2023 11:59:30 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 29 Sep 2023 11:59:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EtuFhrch7HpjGsWVNILcxP1/kdCytZU6vywDQMSvtvczE1Md5W3RqTdC1Lln2dWOro92iekArlIhjG0aR7sMQ8fw2ZvjC45Gz8dLyqyoy4FrEy9byvXG4rvM2IPR+QuyIisK8l5Ffslyfabbl/BOsxyhZjv97YgOyMqdsUUgzyf/F++TMAbjT8O2OymaqSb5WrlbEWPwl6819t1qENaB6c+vERtkH4mwKOal00U1lDdwCN5mD7vV2yPnZTanhm0xBhnSyYFVcprvx4iaZaEp9SrOj+RfNCfTypIMZrTnwsqYDighg9V0ROToQ2A/y3ZOOG3YZyTr9+yV9ZDCT/TJwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RBBzXzOPP3umUYrnbtabzlFeeKAPwTlfbBZnCalDnCc=;
 b=R7TPfXO7ddRoHlf5JLN0fNxD0d4yX05IEdANGKnCD2NR1cY9lO8UxBGoE++zNjjOGzeVkSPl1zRnqfm4X3zYznbvcPxC1ELDvZZSD1TEmlZ1afbsN6xkko5gwL6Yum7QjqLBUfyPN2Ul2Gb0NYZraIseyhYDJvneypEvXhhjpWi5tlkj5iMAxxPYJ57mtG73kPLDZCybQk2vlhYeDjdZPNuTo+1s/QznJVnqvBq8hhy5j2xeWDeptKg7jRrX15zWHE7z2qi79SC7CDgq5g2yFpMtXHvpQfaG6zUFfDlzDnclCR2A2pA8igwVOszLdd5k10+Psom/VKkM4dxbfiXd5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by SA0PR11MB4576.namprd11.prod.outlook.com (2603:10b6:806:97::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Fri, 29 Sep
 2023 18:59:26 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::4182:281:404a:1042]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::4182:281:404a:1042%3]) with mapi id 15.20.6813.017; Fri, 29 Sep 2023
 18:59:26 +0000
Date: Fri, 29 Sep 2023 11:59:19 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
Message-ID: <ZRceh0kYnudtJpJJ@nvishwa1-DESK>
References: <20230928134816.881379-1-david.kershner@intel.com>
 <ZRYtJxlhG/nU36n0@nvishwa1-DESK>
 <IA1PR11MB64189D31B23DF1F4667BCBB7C1C0A@IA1PR11MB6418.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <IA1PR11MB64189D31B23DF1F4667BCBB7C1C0A@IA1PR11MB6418.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR05CA0163.namprd05.prod.outlook.com
 (2603:10b6:a03:339::18) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|SA0PR11MB4576:EE_
X-MS-Office365-Filtering-Correlation-Id: 34e4d2e8-ddad-4011-38bc-08dbc11e3372
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ndm92Qxmfrs1lyQFbPleL4Xz6q51fnGHQ6OnHP+H4dh8PIa++PVnJmYj5VGMbuyV1g9t9paqayIg0Q1WGEThRBgMZoF2Zrfhpd388v83PoUZzuKLPlDbAAzqmHaGyLGZadpsSzPp6XG+okbYnFW8ig4yAsKkpbU3gO8R38gvxeE/kiA9SlklcmmUZ4KFsMO4SC3w5I+i1eyVW9nJg4sAoxDeAejlmbRxLnpXDi+hEyz1/eDJAHa0ETl7nW38srAn3jWP550hEAWwlVEPu5JCLabGt6OmCQtoynQv6JaRt7NnQCbzOPbTJKJd0y0bs8XpBL/rQLByScwijrUKCQwUPftfa5S1U9L29KMvwQsCJRwkbi2PKEj54Q7IDglaSglBxSW/5bf8AQ8AvGwpvlxe1Tc7AZGAWi2Vgrx8yDHaagLKmUbWrBuEbL450IOPyxMArkT3F7KLd4ZpcMvPZBpFcYsEgXKaahNhBq+cM7P1MJVcudlqT9OMd5LvcocIhQ5A3+lD7uYJEq+nHKlZvguZx3UO0RibxAv5SLX5n5kTKlaJtnhzUuPX6hzEE61dobOx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(396003)(346002)(136003)(376002)(39860400002)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(2906002)(44832011)(5660300002)(66476007)(54906003)(6666004)(33716001)(478600001)(66556008)(6512007)(9686003)(66946007)(107886003)(26005)(6486002)(6506007)(6862004)(6636002)(8676002)(316002)(8936002)(4326008)(83380400001)(41300700001)(86362001)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W1ZiT+fcSRBJItmz6ZEhSF8K/dDnA0ODFhHuutBUetCFIvWG38ckH+8eHL8f?=
 =?us-ascii?Q?qoTGUUpaMPUXEc7QjUxX96Ti00A/eWVR1jEYQnNkBnZVXBcK63rl6ibDKe4e?=
 =?us-ascii?Q?GPzHzsvFWWkpuhEyF3paucPYTEQlQYgvuPDKqO/fjepa9yVtIxju2dnK2M0W?=
 =?us-ascii?Q?bQ3OfDvRfAmakzE8tKJdspLo8InJzt/1h6XzbT8iqwbFj2h2a+NcUQgibT2F?=
 =?us-ascii?Q?YE1KPvcFeJyUGGeuXklOSv9idGVE27vhsWLfhstPv8EnGwpkcZHlIbVcItQ6?=
 =?us-ascii?Q?fo+UnCLGkwczITNlk5phZ3AqRnFqSoGBHJbuPI5sqR+ebCgs7d/Bf5EBpBX0?=
 =?us-ascii?Q?eC4gNg1Wln5kGeAzqKTH/hv+zZXqaFdVTv1pSKckxJuPJJyBo6fFN1LnshgC?=
 =?us-ascii?Q?ygE0sizw/JqC5UUHn8ylSS8mdeYvfwhSgGpMIqReXiXUCULXOm0RdYnfHMKY?=
 =?us-ascii?Q?2+FahUwPZCccl0hI78JcMNSu3UfIO61dxVsEhiVMzcsL2+iBj7vEqOFL2TwA?=
 =?us-ascii?Q?Me+N1rQluRRRURQ7c8QfCZ5gEnAesQgTkdunFkpjmr5/p3IFu4cVDP7rSRzh?=
 =?us-ascii?Q?GyEQcZ9vLopSxfL0vQb6dTvy6PFovWZodRWsY5v9OcgQo8Fuc3ByNyPPewNA?=
 =?us-ascii?Q?S2BcnfR1RkAb2SI4gklDAeYp+gV+ZVHSVV4PH16FXfLb/TueHC3QXd5RVXvW?=
 =?us-ascii?Q?pqGJ/POrFAjOwNuMQBKTNFDz+JZqHeAqC9obzNo6l35XhmmQMFs77G7c57A2?=
 =?us-ascii?Q?jTkotpOyIuLPmT5mRqjiXgP2KV6F59XzUXaQb6lTcKZ9trFb+YNzOotpRCLk?=
 =?us-ascii?Q?nIL6pH2mR+IDGwH98A/LrgultCrBfGUBb+Cpfv6bIlnup7mV3cc5Z2+ePffl?=
 =?us-ascii?Q?5KCfyGmt43G2XoP4MjVUkV7dubYwZ6Ahl/lwfDt9kPLlAN/ts8wZtHU4tyhJ?=
 =?us-ascii?Q?qyAOt+XIQQOUQRT9QswTasJHE+j0g68US6ij829t8f3pBPlxCq+LyF/jK3ry?=
 =?us-ascii?Q?/Uvt7NCd9RBLX1sXR8Zrndh2drhd6o60uBrG4jdd7wI9GEl5rxZWxR2QA9bk?=
 =?us-ascii?Q?HAut/WYiAJ/CRSzBDNUEO4cRGJmDF/kDkG+bgkNGPIep8lXvF+vWBA4dunrl?=
 =?us-ascii?Q?QGED3+RKC8vXltJPp/zL9VS6OkcgPdMWf9nXnTzqA3OdNZaOED59wmqdJhQg?=
 =?us-ascii?Q?sdTt1G3uBMLWcZPgTeGmS+GusUT91HTVkgnq4xxsdBsza6cdbhTPsQ95tdCm?=
 =?us-ascii?Q?wqbyS+0BCE837DpLGDm2SMYUouDhkTImpcKmPt3Vc6T0tKBxLR1qD5HHXrBL?=
 =?us-ascii?Q?rYs60dzWAGxj9CTLpe+ce76YRAu9z8TdY3eU9TJpOeXn4uXxPOdUOrVYIah4?=
 =?us-ascii?Q?TXjWv2GIln41WphLa2PrHr/B6vxJSK3hfhA30V0LNE36iVHCYKLBB8Z06Yn0?=
 =?us-ascii?Q?dlB+0fSpbshSY0aaZ0oz7fZKpdzBgx7AbtjpKxO8JWy7jIqxSty7W4vegvEH?=
 =?us-ascii?Q?cEeh+15QXSwcHV1dGY3ZfR4jI/88o6okvY+nZaFGe+N1nTl9GyRwDR2LJq+/?=
 =?us-ascii?Q?+k1W03PN96DqTsBSx6rKf9yQG5zuAi0LLqN69GXR9N5Pkl+GQkHZWnzrqDPR?=
 =?us-ascii?Q?wIs61hWUN0Tg26tMFc3Evq4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 34e4d2e8-ddad-4011-38bc-08dbc11e3372
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 18:59:26.0758 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l5lXDcQ/LoougqltRljMRjQ8PI8LGz62bu/1N8zxZE8yR8nE9QXkrkgsByrEP2Rk2YuXdjg2Sl1XzC8RAE3DcvvXqrchCt1FADgO/Jy5lJ2oSMLh0M4rqaMJl/+GNyho
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4576
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/xe_migrate.c: Use DPA offset for page
 table entries.
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
Cc: "Fleck,
 John" <john.fleck@intel.com>, "Summers, Stuart" <stuart.summers@intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Sep 29, 2023 at 08:01:47AM -0700, Ruhl, Michael J wrote:
>>-----Original Message-----
>>From: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>
>>Sent: Thursday, September 28, 2023 9:49 PM
>>To: Kershner, David <david.kershner@intel.com>
>>Cc: intel-xe@lists.freedesktop.org; Ruhl, Michael J <michael.j.ruhl@intel.com>;
>>Fleck, John <john.fleck@intel.com>; Roper, Matthew D
>><matthew.d.roper@intel.com>; Brost, Matthew <matthew.brost@intel.com>;
>>Summers, Stuart <stuart.summers@intel.com>
>>Subject: Re: [PATCH] drm/xe/xe_migrate.c: Use DPA offset for page table
>>entries.
>>
>>On Thu, Sep 28, 2023 at 09:48:16AM -0400, David Kershner wrote:
>>>Device Physical Address (DPA) is the starting offset device memory.
>>>
>>>Update xe_migrate identity map base PTE entries to start at dpa_base
>>>instead of 0.
>>>
>>>The VM offset value should be 0 relative instead of DPA relative.
>>>
>>>Signed-off-by: David Kershner <david.kershner@intel.com>
>>>---
>>> drivers/gpu/drm/xe/xe_migrate.c | 19 +++++++++++--------
>>> 1 file changed, 11 insertions(+), 8 deletions(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_migrate.c
>>b/drivers/gpu/drm/xe/xe_migrate.c
>>>index 9438f609d18b..848cdb6af2e6 100644
>>>--- a/drivers/gpu/drm/xe/xe_migrate.c
>>>+++ b/drivers/gpu/drm/xe/xe_migrate.c
>>>@@ -114,8 +114,10 @@ static u64 xe_migrate_vm_addr(u64 slot, u32 level)
>>> 	return (slot + 1ULL) << xe_pt_shift(level + 1);
>>> }
>>>
>>>-static u64 xe_migrate_vram_ofs(u64 addr)
>>>+static u64 xe_migrate_vram_ofs(u64 addr, struct xe_tile *tile)
>>> {
>>>+	if (tile)
>>>+		addr -= tile->mem.vram.dpa_base;
>>
>>See below...
>>
>>> 	return addr + (256ULL << xe_pt_shift(2));
>>> }
>>>
>>>@@ -149,7 +151,7 @@ static int xe_migrate_create_cleared_bo(struct
>>xe_migrate *m, struct xe_vm *vm)
>>>
>>> 	xe_map_memset(xe, &m->cleared_bo->vmap, 0, 0x00, cleared_size);
>>> 	vram_addr = xe_bo_addr(m->cleared_bo, 0, XE_PAGE_SIZE);
>>>-	m->cleared_vram_ofs = xe_migrate_vram_ofs(vram_addr);
>>>+	m->cleared_vram_ofs = xe_migrate_vram_ofs(vram_addr, tile);
>>>
>>> 	return 0;
>>> }
>>>@@ -223,12 +225,12 @@ static int xe_migrate_prepare_vm(struct xe_tile
>>*tile, struct xe_migrate *m,
>>> 	} else {
>>> 		u64 batch_addr = xe_bo_addr(batch, 0, XE_PAGE_SIZE);
>>>
>>>-		m->batch_base_ofs = xe_migrate_vram_ofs(batch_addr);
>>>+		m->batch_base_ofs = xe_migrate_vram_ofs(batch_addr, tile);
>>>
>>> 		if (xe->info.supports_usm) {
>>> 			batch = tile->primary_gt->usm.bb_pool->bo;
>>> 			batch_addr = xe_bo_addr(batch, 0, XE_PAGE_SIZE);
>>>-			m->usm_batch_base_ofs =
>>xe_migrate_vram_ofs(batch_addr);
>>>+			m->usm_batch_base_ofs =
>>xe_migrate_vram_ofs(batch_addr, tile);
>>> 		}
>>> 	}
>>>
>>>@@ -266,7 +268,9 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile,
>>struct xe_migrate *m,
>>> 		 * Use 1GB pages, it shouldn't matter the physical amount of
>>> 		 * vram is less, when we don't access it.
>>> 		 */
>>>-		for (pos = 0; pos < xe->mem.vram.actual_physical_size; pos +=
>>SZ_1G, ofs += 8)
>>>+		for (pos = tile->mem.vram.dpa_base;
>>>+		     pos < tile->mem.vram.actual_physical_size + tile-
>>>mem.vram.dpa_base;
>>>+		     pos += SZ_1G, ofs += 8)
>>> 			xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
>>
>>I think this is incorrect.
>>We need to map the whole device LMEM, no just the tile LMEM for each tile.
>>This is because we should be able to move the bo from one tile to another.
>
>My understanding, is that the page table is created for the tile (there is one per tile),
>to migrate data to and from the tile.
>
>How is this different from moving from sysmem to vram? Where is the PTE info for
>the sysmem side of this?
>
>If this is for a general purpose page table, should this be created for the device,
>rather than having two page table with the same info?
>
>I see that the only tests that use this are sysmem -> device and device -> sysmem.
>
>Is there a use case test that shows a migration from one tile to the other?  Would like
>to test this.
>

We can have xe_migrate_copy() function getting called with same object for src_bo
and dst_bo, but different lmem regions for src and dst.

We may not have a good IGT, but I can think of VM prefetch (XE_VM_BIND_OP_PREFETCH)
and access counters as use cases that can trigger migration of BO between tiles.

>>And the identity map I think should start from device dpa (xe->mem.vram.dpa_base)
>>instead of 0-based. The xe->mem.vram.dpa_base gets updated based on whats
>>is >programed into PKG_ADDR_BASE.
>
>This makes sense if there is only one table.  Since the created for each tile, it will
>have some over head.
>
>For instance, the offset for the VMs are currently need the tile offset included.  The
>new code does not need that.  If we use the identity mapping with the full space we
>will have to break the tile offset out as a separate value to keep track  (will need to be
>added per tile..).
>

I did not fully understand your question. xe_bo_addr() has the dpa_base included (not the
tile offset).

Niranjana

>Thoughts?
>
>Mike
>
>>Niranjana
>>
>>> 	}
>>>
>>>@@ -441,8 +445,7 @@ static u32 pte_update_size(struct xe_migrate *m,
>>> 		cmds += cmd_size;
>>> 	} else {
>>> 		/* Offset into identity map. */
>>>-		*L0_ofs = xe_migrate_vram_ofs(cur->start +
>>>-					      vram_region_gpu_offset(res));
>>>+		*L0_ofs = xe_migrate_vram_ofs(cur->start, NULL);
>>> 		cmds += cmd_size;
>>> 	}
>>>
>>>@@ -1027,7 +1030,7 @@ static void write_pgtable(struct xe_tile *tile, struct
>>xe_bb *bb, u64 ppgtt_ofs,
>>> 	xe_tile_assert(tile, update->qwords <= 0x1ff);
>>> 	if (!ppgtt_ofs) {
>>> 		ppgtt_ofs = xe_migrate_vram_ofs(xe_bo_addr(update->pt_bo,
>>0,
>>>-							   XE_PAGE_SIZE));
>>>+							   XE_PAGE_SIZE), tile);
>>> 	}
>>>
>>> 	do {
>>>--
>>>2.35.1
>>>

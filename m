Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C243D148A0
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 06:01:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12C6F10E2F7;
	Thu,  8 Jan 2026 06:01:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="KPaQrJx3";
	dkim-atps=neutral
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011026.outbound.protection.outlook.com
 [40.93.194.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 208F210E2F7
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 06:01:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qhDQKf7dfpcepUX9bjd+Hvc2nqdB4rSNJg/XTVTCL0K8jCmokuQgRQ3tqMd/tz+qfriRldv1yEkSf6iWgXVaLT2uhSeLH8HaehKFsxQyr5I6RFP+WoH9zy40rlb0p2F/SnLckOhVfV/KCvbmNekTNZJ8ZXsluMBcxTD8H1BfBrmrLIV+ahR9YdrkWbi6HsgPC3SCeOhAtW1Cgf1yGAv8fm8aG6NgLpc0CngcPzB9BfYLo/Vu6neksieZbvXtU9Kef9w6wkY8oudZjy+IS7638P8tBlaLGzI1nYZ1wl/J6LLArm5fDzrf0/zRWY+0nDZAaIjPGyv4+fGmvDMq8EOpdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4DmkQM9N1LNsIYK1YdS85If0Y4aqS7pgwmVr9MnFFOw=;
 b=OB7e4wKayG0CJPkrEOde7E5WWpABTvrewoPC/6nIJbFFCY0BZxR10TrIKO/r9RC3tf3tQWQXHq9ugYz9+/s6ppE/OX0e8fmE3to46S/eLbl5rjmFhB2ZdXn/RBfsi+QVCBaBmhomG6KJ/iycCIA29LAUnvLTxO5oJNOs3E7pueU1eDtnQTcd/UvpeVly9qLtnhxHGUzo+yn7ri8bSWMLZDbeUphvaOTw9P/6c5EkORU3dK9jYL1QD+79L+lL0YWaGqxXt3+ATzSJd+nINHGPYkh5/wd5bxS/z7bI5Wxp89VRKwpTermZW4xkKLsvoLygwjwSKfibkq4pW6Sqrl1f2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4DmkQM9N1LNsIYK1YdS85If0Y4aqS7pgwmVr9MnFFOw=;
 b=KPaQrJx32frynb2R/RvjjC6SNmTs39pLG+Xhxum3aSTNSpwkORuasJ1hJCIHp1RkBztC6zVCIcJcvwKh/TQ8HFb7p2mmL4hZ211aK0UBkm9n0ttHcce3rDZpbnXNgXcMOKyR5Gtyz+0dDS2cIdAYR4QbJoVjCjHbkeMC9vFxrYcvdB/FXv2TZ81mhz+6WdebLvd4kzlVt4Cu4oFtD4iI7JIU9mCMETRQDciwD7lH35lEZYWmSGiSnMytzZ2ZjMlG7AzFeDcbvoITcAgvCjcocT5k2FzsqWJqjz3jnU60FmwJWM3DYQt08MUgEc2BjjgIlxQVmhb3JeJaM5Bu7cp0sg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 BL3PR12MB6618.namprd12.prod.outlook.com (2603:10b6:208:38d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Thu, 8 Jan
 2026 06:01:10 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 06:01:10 +0000
From: Jordan Niethe <jniethe@nvidia.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [RESENDv2 v2 01/11] mm/migrate_device: Introduce
 migrate_pfn_from_page() helper
Date: Thu,  8 Jan 2026 17:00:52 +1100
Message-Id: <20260108060102.41357-2-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108060102.41357-1-jniethe@nvidia.com>
References: <20260108060102.41357-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0046.namprd11.prod.outlook.com
 (2603:10b6:a03:80::23) To DM4PR12MB9072.namprd12.prod.outlook.com
 (2603:10b6:8:be::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|BL3PR12MB6618:EE_
X-MS-Office365-Filtering-Correlation-Id: 763c9f21-0f25-4f7c-74b9-08de4e7b5298
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nr/hZOMi3T9zNnmm7rDIMjX3kkaBATGlUq5Ld5ER1Txf7yhwDrfKFo9MMfO9?=
 =?us-ascii?Q?qNHJAF+ABIbpx2dbf/22L6/E5DDZnWjjl1IgYS+DY3TWBbdUCzkGzNY6s++p?=
 =?us-ascii?Q?NEJUofPES5diY59z5c4HbfbkPc8VISBJsZIgBVn2r0PaLpmtJe1FnQ5hxHe1?=
 =?us-ascii?Q?RDQihf6EMkGxJ5mDmvsaA0NwZEOdaKdZmEo0pOTUl/ncopzISWWqih4x0hUq?=
 =?us-ascii?Q?wGtr6sD0c5tQgtWxMK/8FTcG6KRHy4jn2QrhKa1FUNJsIxRfeRPVprwcMji5?=
 =?us-ascii?Q?3jzSKk5b/DBrpUOg6caL8APF52qxtYhNw+Fv33zk335CPk/Kn2AizaDCf0ZZ?=
 =?us-ascii?Q?kZJYjVzvZC+aqUPeOmfdR3Fc8Pmfe5onFt1rC2l1kp58cjHne4qp4Q8AtXIe?=
 =?us-ascii?Q?nqUF7LzJLhfjBCEWlKTiWW1XZAAfl97affrLf1CNTTvDqEbgpwF+wF1gz0CI?=
 =?us-ascii?Q?Vr1jtUYEAS+ixa3C/oyiA4T7YFvYEpAHLIBZExT3f38gCNre37BzqXDACyVp?=
 =?us-ascii?Q?HVCkjS0PhsnU3MYIHiV7opXDCRbE1HzmYhu4HA6OkzRePHS8x76PN2QFwlKM?=
 =?us-ascii?Q?mzWwperiaEWkygCo5T87+HgdMbA3JxVpwQvrpbLa2mtephJe15yBLGt2fhB4?=
 =?us-ascii?Q?/WbflnUZnNujKniSaTzlFoDc3aUpFNm/zhmUs6TSZ1Ko7yha3uQUo2H/kER/?=
 =?us-ascii?Q?fc7szb3vh6Y3QarbPvNArC6kJtbFzXrwKWC2ed/RMGL76KJM2ivTDiZkbV4G?=
 =?us-ascii?Q?PUCOSh2LRbarb0Vqz6+KsxkxTJSdY1OjI3t6aNuZt5z+A7tGLAwGhX3uQZ8V?=
 =?us-ascii?Q?zhH7G7aWUuG5GP69MzTeIMZThnevaF2upYe8H5aje71w8nff7/CiCiI5j4EY?=
 =?us-ascii?Q?PYa945UQ+NXJrYtLJv3f2hu2K24v5iDflXiRLCYW52cCc9labcVxqFHbkORo?=
 =?us-ascii?Q?rU4/oQpd4vbPy3mHlyA1L+HQ3JojCSHcG2LrJYO9k9WoTZkJafcRTwpZ3kBh?=
 =?us-ascii?Q?qerJWo9tf6SEZGHJGo4+xzP7HOba+mpN20p9AiRk/L247EAF9OfHu0YKdNOy?=
 =?us-ascii?Q?3OW/3b/aBDb7ECMITwAVkyYNZKV3Nt19rsp+xVtBnpnaMpql9yoV7S5JxHXE?=
 =?us-ascii?Q?wAByKQWk7nNRapQh2UljVHpVo3jxsRcPfPPdU2cRZPBJNanicIpAyZ3l4yhc?=
 =?us-ascii?Q?LYHY1n6o+HxUwEjaYVHweCF+vP9D1yoqkB0G3ATMskZK7If78Cr9vLR5SMLf?=
 =?us-ascii?Q?tcQeKraQo9kXLqARwSWVsCz4xdi2zRWAI3S0Qx3JEW7Hdte01B7knLwH5GvZ?=
 =?us-ascii?Q?7ST+//Tk2t9mS65kyW6WV4/Jxr4k14uNpxumjGOHML3FtRvv3rym/gkqld6F?=
 =?us-ascii?Q?1Qf7Ev5Lf2FG92Rv48n8dlEnD7AEGnTX+pBgKl9JslKwYzjnzse825zKsWq5?=
 =?us-ascii?Q?KxOq8dK9z6IHTRxohoFiOjnxDeVptlj9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB9072.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TQoWTi/sgjbCmb5T42ds571eEofwCuCe5p34TcI7Sgu9wAhs71/u6gkt3hkD?=
 =?us-ascii?Q?vnEHpAw4vRNGZSJFK9RJip6Stgge/pZl7DO6m2S5my6Jq0TRJzShLlCKB7Bi?=
 =?us-ascii?Q?oZntGR6iUJOeGPVIFQ+gTYqXMntsv63QP5WNmXXr/6MJTm+DCzPf5M8ECQ7T?=
 =?us-ascii?Q?SUrgE357WokWu1OtWZoG8416mr6xmvIf7F/BkinjywuFkUiM0wv/7Cqn8s52?=
 =?us-ascii?Q?NSQBFAwJf7ezWudIv7OIMgNzy7keEFw0T3RPtbV5XDvAzJJ0kSOFnvhAXTfw?=
 =?us-ascii?Q?QmiRPxGSLIL7hk8ig2LsPAKoE8I0WvShfvAXpHggSsQNgNFqp5KDmWmi454B?=
 =?us-ascii?Q?k8lxK3KgVDffTVJMrN7atqaoL9EdqfBOlDOa4YYkTsfjznKck0s/DIMNdZgV?=
 =?us-ascii?Q?I00YahbRQ/6MpU+2IZdEtTNkBgPrx/74Jl9zdcxgHKrJ4jCx1NiVpxOqV15V?=
 =?us-ascii?Q?KK0DppWA0xlE+9DFfc+o7o2pvFF1GWJ+EAMGchypiRWI011v1uS3g9hxKPU1?=
 =?us-ascii?Q?FAXa8rHalyiMYjazAQlOJMvg8DOFv4f+9V6sd0tJCv78Ge0YyI9zLbJGCETx?=
 =?us-ascii?Q?uoPOqwLprVunKStqYFwJpFbAZlhs37LiwYNphpTQnG++9lnXHP+GB8TXnEu0?=
 =?us-ascii?Q?WgBMLRXqGWMU5RkCAfnK6bHl1Suw+sNF5MhaXd5DaKwX71/5fkniytmqrayZ?=
 =?us-ascii?Q?aCVpCRaz3dXDAwDUseKIRetwEPjlOl4v6gegbNGg9ARz0IMxQtREAL1xbOMS?=
 =?us-ascii?Q?NdD6fEV/Ehsy/1TVWWUXrjFt31nTm5Dvvd0YHAi61SpkBkkS0Zf24vJiy2+d?=
 =?us-ascii?Q?2SA+Zbwn9kKMULNQt4E7kNSAg4DpYp967K/AZyrd/FF/owU9mMo6o3LlzFpY?=
 =?us-ascii?Q?Kxsy3aLHP3Bp4upj8RbMckYdL9bqcQ5zxupg0TbYr4sh9J3Lm/ka6ldbBbyN?=
 =?us-ascii?Q?gXNkpWnCDO/PrbQNFKYRePKEJWNZlpPTMgNWJfs4YtNFPWoAW8fBnlVfEkX9?=
 =?us-ascii?Q?frFNicvn6p2/jgFnLUUY4a45OmNLf6EpSPCsBch48e7dqJEMqFC4xO0mRbYn?=
 =?us-ascii?Q?UJNWZJGSDXBVH6yVpbW0igRhCeS+n9XVtPhXCd7Nz6FgCgCiBoyMlJxmLpJu?=
 =?us-ascii?Q?lqCWRTEs91VZ8lebJbDINfPxFbDlTXvDyKL5zCiTMRTmQ9p2cVD66TkWAUuL?=
 =?us-ascii?Q?Kr//CpeXozGwJMDI/YQuStkJ4evtWi79Kkafv6E3WxxD9Dv5qMgju+USmTMq?=
 =?us-ascii?Q?72YaOSwspDH61Hr+ON68ppZPVe9f0E9ijPQQM9mLWs5F3r58WXGVC9ptFL8n?=
 =?us-ascii?Q?EZ2lVer0XBXhfMr+f/8pkoQu9TEQiRXQuyNC0w1zqkDuSElJ5R8ozZeTblvS?=
 =?us-ascii?Q?bZLSyjZ/8yrHWqeARrG9Q8Oe3iz3mFTNL1OT8RTj6OkKtxGjBbA+1OySiLnG?=
 =?us-ascii?Q?LxT1uNn0RJ4GHVebiqjRFLf7lWZQ8hEzGgMlpXtQ4Kt95KtKLqFxgjDvvwfs?=
 =?us-ascii?Q?dRdkZhWzpGpemzwVqt1lcsaqO/Dy6NwQ0mqVGvXWs4DFIY95cOp4WsNed6cO?=
 =?us-ascii?Q?4JpmYJFrRyjkmceqaTXjRv7/lvmm84U/njqItIywEfwZVy1GuqPCif4pyaHG?=
 =?us-ascii?Q?jEHyOozyTD5E3ANp9EW4G3SytaFajC2NZYgj6FQ4sO0hOY45HssGEDRIcBN0?=
 =?us-ascii?Q?5F9sFpT55r/UWpJIGYYPHKK17+GaF41dNaBC43gf36LA7jcsPKoMekpFdKmk?=
 =?us-ascii?Q?8mS5v00VWw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 763c9f21-0f25-4f7c-74b9-08de4e7b5298
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 06:01:10.7864 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wJt/tudJVCnr2IOd8v6f4/aTX+7qYiG26+ckKDxh5g4iEVGAx8wwL7AVVY9jgdvJMxgfy6EpwtmIbluIQOW/Sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6618
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

To create a migrate from a given struct page, that page is first
converted to its pfn, before passing the pfn to migrate_pfn().

A future change will remove device private pages from the physical
address space. This will mean that device private pages no longer have a
pfn and must be handled separately.

Prepare for this with a new helper:

    - migrate_pfn_from_page()

This helper takes a struct page as parameter instead of a pfn. This will
allow more flexibility for handling the mpfn differently for device
private pages.

Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
---
 arch/powerpc/kvm/book3s_hv_uvmem.c       |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  2 +-
 drivers/gpu/drm/drm_pagemap.c            |  2 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c   |  4 ++--
 include/linux/migrate.h                  |  5 +++++
 lib/test_hmm.c                           | 11 ++++++-----
 mm/migrate_device.c                      |  7 +++----
 7 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index e5000bef90f2..67910900af7b 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -784,7 +784,7 @@ static int kvmppc_svm_page_in(struct vm_area_struct *vma,
 		}
 	}
 
-	*mig.dst = migrate_pfn(page_to_pfn(dpage));
+	*mig.dst = migrate_pfn_from_page(dpage);
 	migrate_vma_pages(&mig);
 out_finalize:
 	migrate_vma_finalize(&mig);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index af53e796ea1b..ca552c34ece2 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -646,7 +646,7 @@ svm_migrate_copy_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
 		pr_debug_ratelimited("dma mapping dst to 0x%llx, pfn 0x%lx\n",
 				     dst[i] >> PAGE_SHIFT, page_to_pfn(dpage));
 
-		migrate->dst[i] = migrate_pfn(page_to_pfn(dpage));
+		migrate->dst[i] = migrate_pfn_from_page(dpage);
 		j++;
 	}
 
diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index 03ee39a761a4..526105aa4b05 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -742,7 +742,7 @@ static int drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
 			goto free_pages;
 
 		page = folio_page(folio, 0);
-		mpfn[i] = migrate_pfn(page_to_pfn(page));
+		mpfn[i] = migrate_pfn_from_page(page);
 
 next:
 		if (page)
diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 58071652679d..a7edcdca9701 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -249,7 +249,7 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 		goto done;
 	}
 
-	args.dst[0] = migrate_pfn(page_to_pfn(dpage));
+	args.dst[0] = migrate_pfn_from_page(dpage);
 	if (order)
 		args.dst[0] |= MIGRATE_PFN_COMPOUND;
 	dfolio = page_folio(dpage);
@@ -766,7 +766,7 @@ static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
 		((paddr >> PAGE_SHIFT) << NVIF_VMM_PFNMAP_V0_ADDR_SHIFT);
 	if (src & MIGRATE_PFN_WRITE)
 		*pfn |= NVIF_VMM_PFNMAP_V0_W;
-	mpfn = migrate_pfn(page_to_pfn(dpage));
+	mpfn = migrate_pfn_from_page(dpage);
 	if (folio_order(page_folio(dpage)))
 		mpfn |= MIGRATE_PFN_COMPOUND;
 	return mpfn;
diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index 26ca00c325d9..d269ec1400be 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -140,6 +140,11 @@ static inline unsigned long migrate_pfn(unsigned long pfn)
 	return (pfn << MIGRATE_PFN_SHIFT) | MIGRATE_PFN_VALID;
 }
 
+static inline unsigned long migrate_pfn_from_page(struct page *page)
+{
+	return migrate_pfn(page_to_pfn(page));
+}
+
 enum migrate_vma_direction {
 	MIGRATE_VMA_SELECT_SYSTEM = 1 << 0,
 	MIGRATE_VMA_SELECT_DEVICE_PRIVATE = 1 << 1,
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 8af169d3873a..7e5248404d00 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -727,7 +727,8 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 				rpage = BACKING_PAGE(dpage);
 				rpage->zone_device_data = dmirror;
 
-				*dst = migrate_pfn(page_to_pfn(dpage)) | write;
+				*dst = migrate_pfn_from_page(dpage) |
+				       write;
 				src_page = pfn_to_page(spfn + i);
 
 				if (spage)
@@ -754,7 +755,7 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 		pr_debug("migrating from sys to dev pfn src: 0x%lx pfn dst: 0x%lx\n",
 			 page_to_pfn(spage), page_to_pfn(dpage));
 
-		*dst = migrate_pfn(page_to_pfn(dpage)) | write;
+		*dst = migrate_pfn_from_page(dpage) | write;
 
 		if (is_large) {
 			int i;
@@ -989,7 +990,7 @@ static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma *args,
 
 		if (dpage) {
 			lock_page(dpage);
-			*dst |= migrate_pfn(page_to_pfn(dpage));
+			*dst |= migrate_pfn_from_page(dpage);
 		}
 
 		for (i = 0; i < (1 << order); i++) {
@@ -1000,7 +1001,7 @@ static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma *args,
 			if (!dpage && order) {
 				dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
 				lock_page(dpage);
-				dst[i] = migrate_pfn(page_to_pfn(dpage));
+				dst[i] = migrate_pfn_from_page(dpage);
 				dst_page = pfn_to_page(page_to_pfn(dpage));
 				dpage = NULL; /* For the next iteration */
 			} else {
@@ -1412,7 +1413,7 @@ static void dmirror_device_evict_chunk(struct dmirror_chunk *chunk)
 
 		/* TODO Support splitting here */
 		lock_page(dpage);
-		dst_pfns[i] = migrate_pfn(page_to_pfn(dpage));
+		dst_pfns[i] = migrate_pfn_from_page(dpage);
 		if (src_pfns[i] & MIGRATE_PFN_WRITE)
 			dst_pfns[i] |= MIGRATE_PFN_WRITE;
 		if (order)
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 23379663b1e1..1a2067f830da 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -207,9 +207,8 @@ static int migrate_vma_collect_huge_pmd(pmd_t *pmdp, unsigned long start,
 			.vma = walk->vma,
 		};
 
-		unsigned long pfn = page_to_pfn(folio_page(folio, 0));
-
-		migrate->src[migrate->npages] = migrate_pfn(pfn) | write
+		migrate->src[migrate->npages] = migrate_pfn_from_page(folio_page(folio, 0))
+						| write
 						| MIGRATE_PFN_MIGRATE
 						| MIGRATE_PFN_COMPOUND;
 		migrate->dst[migrate->npages++] = 0;
@@ -328,7 +327,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 				goto again;
 			}
 
-			mpfn = migrate_pfn(page_to_pfn(page)) |
+			mpfn = migrate_pfn_from_page(page) |
 					MIGRATE_PFN_MIGRATE;
 			if (softleaf_is_device_private_write(entry))
 				mpfn |= MIGRATE_PFN_WRITE;
-- 
2.34.1


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B35C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 16:42:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40E4910E92D;
	Thu,  7 Dec 2023 16:42:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E889110E92D
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 16:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701967330; x=1733503330;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=pMtHT9WJ4JiIEuhUzyIFAlEiSrCh2A2mT+9vbd8nRQ4=;
 b=nKKO3Q+uqc620+BTaZZoikOTwZ8jC4i2rBDXIvDn9aD7qtGyfeqtlY20
 6DIjEPVzXhmWuqAbTMXUA9LaXucqLVKWpq3MpeGwpYA2xDln6OQyobLWC
 PCtsmCvsSMu+8l4UsR5sHVsPCZuf22+v6BQV2RnjR1dLI/cHrxKpT56YN
 3gyOOVH2A0jbj0MJkkOg7/4a1cjqlUj4farbV2JI+N3Jd7tmXiBgf4vKR
 fEuGW5GdUBVuMtrwKGazkhboMjkoiXVw40db6gwAFohNXLp7oGW25eJa8
 cJPr/GZaDG/zdwG97+QDkUcgpcRo/w1dN82EBi1NTkdHtzSRD+I3JV5He w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="480452552"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; d="scan'208";a="480452552"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 08:42:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="837784700"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; d="scan'208";a="837784700"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 08:42:05 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 08:42:04 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 08:42:04 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 08:42:04 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 08:42:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j1rmxOS7rv/2rbqotnJy8kuwXc0qN+dKyNMb1/sWlP0NYSXnaG2LsqwcGtSLDtlT6hQWPJx2xKTuuBRlFhKlTD54W2Gd0QKBGpjh6d6lm4lKRhQZYhphZ3KLnd1dSFY4kOTkteghq04Z2tJW6+qtYI7Ogsg3fula0tq3uw/U6+jqN9n2W3+Sfsir/LRMYzFgpfxkavU/XFlZc0sV55+NHRR5qM9YmJVe2nUc2wUJ41NJUWvBWKm5gdzjTHkl6P2LhR6GpDjA4l8y5qRCXU2qE4A/LmmF/P/u1/nGK4L+8LgMwCh/t8RTK1lEjUqs3GrL6S1pelAFjV7/kkkG1a5+cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y8CdKsJ4QafRaBhs1vtPYcXTF/Pjak6jCg5hccU+vcU=;
 b=QacfE1ovgMe3W6LWIDG6Xg+PSTaYkalJIcn+lrKaeno+ZY8q3a7kUEbbgOCerieVmSh3GJ/922Ul3g6MR1ljrnRF7it5UTxp6S3WDIwxOFN1KGfzPC5dghmHTTp3EHnfEHyXhfL48/x+XwB5bJoRn1ciniAXpsekhvMrFMXHBqYg52ZWpy6qJ5PpeqMJ95uKY9y8tqg3BAuW4gayN7es81v3mFqzU1eYCAXCWBhXu10H3bDQRd/FvYsu7mrm2MbYOEkCy4wp0NWFbeRlFL6tHUWLXv/OwAcfZ/mVc6uPiRKKIM8mjaIr9wsdFRXufP0XsbcjagUq3D9jBCMVaesF5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL1PR11MB5400.namprd11.prod.outlook.com (2603:10b6:208:311::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Thu, 7 Dec
 2023 16:42:02 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7046.033; Thu, 7 Dec 2023
 16:42:02 +0000
Date: Thu, 7 Dec 2023 10:42:00 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Replace the scratch pages with NULL PTEs
Message-ID: <la25ljwtfjk5aj72t77i6b7pdntaiu6ei7wlmafmrcxhkkso3x@kwc4v6xz5pbf>
References: <20231207154423.35666-1-thomas.hellstrom@linux.intel.com>
 <dktre5juul24vbetvhi67r3n2gnlnjihppf74vddyrobxetxc7@5nha57x4mdwb>
 <301e0414-c632-dd88-b67c-87a3d24544a9@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <301e0414-c632-dd88-b67c-87a3d24544a9@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0062.namprd05.prod.outlook.com
 (2603:10b6:a03:332::7) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL1PR11MB5400:EE_
X-MS-Office365-Filtering-Correlation-Id: b10717a5-c73b-46b3-5ddc-08dbf7437041
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9omzWCgZZGxduiOqlvWslQG8DEaLwolvzo+26sV+1pVdvC+eCN4oqufu1Ngk9w7tZCP0CWGV8+GUQwxaSeEt4DmW4SNOXzI1yiL/XzT2JKuRb/pb5yMb1PbmsUa1ccSUy+ZGQ3ckFAXuuUdjGc1HUGK21d1hbh2XzjUbCndnS5RC5zAK1mnyeSu9Hb0ykiXNWZUaxFMCf+AT7l7MHGRq7NoH3L0vse1SB1efKngCRdGl3e6URA2KDhigbzF5/Mk/soQxpofG8ceKbXVVqRi26JTkqGEsr3qXpxoiHvYN1xlbwFMpXpVD1bYbOS2RbMfF5JxKtQpS2TW+S2N0YxMAozRoyExfs63rO47YUSzmu1m2ELlAdWZgkhymBF/G+IX2HerQySjLqJEZ4OV6HiR3yZmMXSHErjyVOeVFZECmaB+v6sZbJENWFp5TX18rhaJ1gVBaLX5LCU5yLvWPuxetgzVHAV97vEilezUcb0OBhu76qsmdc4d3rd0dz1rs4JWiYh89v7oBDDztP7ep+liL1DMGua6OuAIMloDoNw2/DRtu3glJ28iEoWJc/FEyD5+/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(396003)(39860400002)(136003)(366004)(346002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(66556008)(66476007)(6916009)(316002)(66946007)(5660300002)(86362001)(8676002)(26005)(4326008)(8936002)(2906002)(478600001)(6486002)(6512007)(9686003)(41300700001)(6506007)(33716001)(38100700002)(66899024)(66574015)(83380400001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?QrCsf5HIUGscrA3ZnyJW6SRHH+Yx43/o437gF2Ljxo4zwcBSwVi/k8eZpf?=
 =?iso-8859-1?Q?FRJYRW2H+SKtyvVeWjB72RpPPs+GPwykoYtTgmwCTcad5P9XNIFQ85L7I/?=
 =?iso-8859-1?Q?04GwdscEfNhS0HBOe7zQH2C9WCV4KR2d9H/X5l1QIb/mloS6C9PNUoK3hL?=
 =?iso-8859-1?Q?TP7uUg2HpR5UFqRt/xqGXBtmahnJdz0lrccSYuGRNpJ0I6+9mIr4/51dYB?=
 =?iso-8859-1?Q?wLZsrHBIKr5f0Ht/74Jv33Y6aw5A6H665KQbHKEcAOewXqABlBYMECqehE?=
 =?iso-8859-1?Q?Z9MWJ8JarzzWdKFzwG2lXUHKlUHCFa2QbEUsUILaH0d2NMSZmrvvY7Dxtd?=
 =?iso-8859-1?Q?1Nha3KQUMkchjbWBVGo0khCmH5NqZQqpwOOMYfgF/RwTcRFuGkjfNoIQtt?=
 =?iso-8859-1?Q?sD4Lhzwq8JgqrQ4c/Mqq+5Tk6Uge0Ku2PhDQw/yJ3ALt1ZZ6t5SVfMmA9h?=
 =?iso-8859-1?Q?zC8xGEbtFxGXeX0MGfSMFVKk8+ktA11h5HE+Rh2cLm648mbF0MVDB5sISd?=
 =?iso-8859-1?Q?G1D5FhLUwYFx6MeCNWIA0tsDnihaJYJ4Ku9bZ3nt9pfNpcdco+iqDZuhsR?=
 =?iso-8859-1?Q?Tu6suoNpWnD3GdoV23uBYkQlb86XgVNqrKzIOxJXXKa221NZKiJxdtrRNN?=
 =?iso-8859-1?Q?GhL6PcQ4ojveCgqUL07kmJEI+Um4Aqq7xrnw88K5ZKPWdgwuG3xSYZSfs9?=
 =?iso-8859-1?Q?iGrCewt+SQ2dssBIClu7UG+/MmZU/aPml1vyWEfQZ5zAfQOb5Az0nWPewB?=
 =?iso-8859-1?Q?SQx2oHKCM0upzlHpWnmVhrEwf34V4xRU2nmi1mMoXOjOYp7/ZAWCfrRWTZ?=
 =?iso-8859-1?Q?fiQZalqqsjBruo5BDd5TciQvFYju+e8rMu6f+6C0wH9mpYwn6Dj8YUimqB?=
 =?iso-8859-1?Q?MhcTda0BMaTZE2XmSYhpL+rBHkdckMz9MD29KC23Hsfa2UMNfnIuYMK4OH?=
 =?iso-8859-1?Q?PDkfc3/wFZPtw2ha7fLPNRjG+l/4KT/482isIa6yV51CoQeC1Yw8ndbE66?=
 =?iso-8859-1?Q?xasCfOmwk8vcE3MljnHow+hN2a6OYOWRFfn7o2/bYQEgURUbb2avJCCOOf?=
 =?iso-8859-1?Q?2H/o0VElpBd4eAPEfMdyHGiSGBXwSDtpanQGYDL8m8RB1W1CG0sNA84u2M?=
 =?iso-8859-1?Q?6ydrBmSAWq1NDB5dIqqPUT4r1wcXBm/uWSy6zdUMut9TjhZ9AlWOAlu9ho?=
 =?iso-8859-1?Q?rV7suJ6yEYsReikpl0L39FEe93K7ZQ4aWzz/HKZcVCYQ20Q0576+qdz9lD?=
 =?iso-8859-1?Q?dRPpKrIdBQIMnTm+6bNByjHOzhBmsY3leDuMT3vYkXBWEenEUMFjavQYAu?=
 =?iso-8859-1?Q?98U5Mml1LHoFFBUYoCitsEygNVV2gZF3j1bZQQF8N/8DefpBYROXJ1qtGe?=
 =?iso-8859-1?Q?pG1+8/Ezg5rrxgEiHOnC4Ss/0ky7dgOoKHkHeUNVUZuEFjC79GBfm3sN8d?=
 =?iso-8859-1?Q?Kq46g/DdOapFaPwH+mKMOzwNb0OFPsnnF16pLKqYFWCvJajiwhPTXHJpqv?=
 =?iso-8859-1?Q?g23n8EKCFkLDgtT2nD17pGU7pZEywf8y0oloFzRYzOWpIn3PMas7tJXxZU?=
 =?iso-8859-1?Q?CviNIbCl3yZGnmNIa3T32Me4J7ZfjAVCd/0+7tBXnKmRD3DIHHCaqAl0Jt?=
 =?iso-8859-1?Q?8lTd00XmjC/Lp05hEFOmxofunUSpzGtIAVuF2ENQFBb2JC5vEK324vKw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b10717a5-c73b-46b3-5ddc-08dbf7437041
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 16:42:02.3445 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 15QNp2HftT3ZpVMpXu0NVcVIeZk2X94X2F6sVEqMhUaFx9aNaKeUxuFm0YK5m+xKxV3ipBLN1En8SdJsYsLL/2Z2qO/4zBPEQjm2P1MOUSw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5400
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Dec 07, 2023 at 05:25:01PM +0100, Thomas Hellström wrote:
>+ intel-xe cc.
>
>
>On 12/7/23 17:17, Lucas De Marchi wrote:
>>On Thu, Dec 07, 2023 at 04:44:23PM +0100, Thomas Hellström wrote:
>>>Replace the scratch pages with NULL PTEs that return 0 when reading and
>>>do nothing when writing.
>>
>>but don't we want to keep scratch so we can check when things go wrong
>>and writes go where they shouldn't?
>
>The argument against that was that apps that incorrectly writes to 
>scratch and then reads back the same value wouldn't notice that it did 
>something wrong, and the case you mention would to some extent be 
>captured by not having a scratch page at all and check for pagefaults?

maybe... But if we have a null pte where we had scratch mapped, aren't we
actually masking the pagefault? What about platforms where we don't have
pagefault? Relying on pagefault alone I think would actually be: use a
null pte to account for HW prefetch where applicable, but don't use it
elsewhere, and only if we support pagefault on that platform. But I
may be misunderstanding to what degree this patch is replacing scratch
since I see you kept xe_vm_has_scratch().

Lucas De Marchi


>
>I admit I haven't been following the discussions around scratch pages 
>long enough to know the historical uses for it. Cc'ing Joonas for 
>further discussion.
>
>/Thomas
>
>
>>
>>Lucas De Marchi
>>
>>>
>>>Cc: Brian Welty <brian.welty@intel.com>
>>>Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>---
>>>drivers/gpu/drm/xe/xe_pt.c       | 68 ++++----------------------------
>>>drivers/gpu/drm/xe/xe_pt.h       |  3 --
>>>drivers/gpu/drm/xe/xe_vm.c       | 45 +--------------------
>>>drivers/gpu/drm/xe/xe_vm.h       |  5 +++
>>>drivers/gpu/drm/xe/xe_vm_types.h |  2 -
>>>5 files changed, 14 insertions(+), 109 deletions(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>>>index 35bd7940a571..ce2846d56b04 100644
>>>--- a/drivers/gpu/drm/xe/xe_pt.c
>>>+++ b/drivers/gpu/drm/xe/xe_pt.c
>>>@@ -50,17 +50,14 @@ static struct xe_pt *xe_pt_entry(struct 
>>>xe_pt_dir *pt_dir, unsigned int index)
>>>static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
>>>                 unsigned int level)
>>>{
>>>-    u16 pat_index = tile_to_xe(tile)->pat.idx[XE_CACHE_WB];
>>>-    u8 id = tile->id;
>>>+    struct xe_device *xe = tile_to_xe(tile);
>>>+    u16 pat_index = xe->pat.idx[XE_CACHE_WB];
>>>
>>>-    if (!vm->scratch_bo[id])
>>>+    if (!xe_vm_has_scratch(vm))
>>>        return 0;
>>>
>>>-    if (level > 0)
>>>-        return vm->pt_ops->pde_encode_bo(vm->scratch_pt[id][level 
>>>- 1]->bo,
>>>-                         0, pat_index);
>>>-
>>>-    return vm->pt_ops->pte_encode_bo(vm->scratch_bo[id], 0, 
>>>pat_index, 0);
>>>+    return vm->pt_ops->pte_encode_addr(xe, 0, pat_index, level, 
>>>IS_DGFX(xe),
>>>+                       0) | XE_PTE_NULL;
>>>}
>>>
>>>/**
>>>@@ -135,7 +132,7 @@ void xe_pt_populate_empty(struct xe_tile 
>>>*tile, struct xe_vm *vm,
>>>    u64 empty;
>>>    int i;
>>>
>>>-    if (!vm->scratch_bo[tile->id]) {
>>>+    if (!xe_vm_has_scratch(vm)) {
>>>        /*
>>>         * FIXME: Some memory is allocated already allocated to zero?
>>>         * Find out which memory that is and avoid this memset...
>>>@@ -194,57 +191,6 @@ void xe_pt_destroy(struct xe_pt *pt, u32 
>>>flags, struct llist_head *deferred)
>>>    kfree(pt);
>>>}
>>>
>>>-/**
>>>- * xe_pt_create_scratch() - Setup a scratch memory pagetable tree 
>>>for the
>>>- * given tile and vm.
>>>- * @xe: xe device.
>>>- * @tile: tile to set up for.
>>>- * @vm: vm to set up for.
>>>- *
>>>- * Sets up a pagetable tree with one page-table per level and a single
>>>- * leaf bo. All pagetable entries point to the single page-table or,
>>>- * for L0, the single bo one level below.
>>>- *
>>>- * Return: 0 on success, negative error code on error.
>>>- */
>>>-int xe_pt_create_scratch(struct xe_device *xe, struct xe_tile *tile,
>>>-             struct xe_vm *vm)
>>>-{
>>>-    u8 id = tile->id;
>>>-    unsigned int flags;
>>>-    int i;
>>>-
>>>-    /*
>>>-     * So we don't need to worry about 64K TLB hints when dealing with
>>>-     * scratch entires, rather keep the scratch page in system memory on
>>>-     * platforms where 64K pages are needed for VRAM.
>>>-     */
>>>-    flags = XE_BO_CREATE_PINNED_BIT;
>>>-    if (vm->flags & XE_VM_FLAG_64K)
>>>-        flags |= XE_BO_CREATE_SYSTEM_BIT;
>>>-    else
>>>-        flags |= XE_BO_CREATE_VRAM_IF_DGFX(tile);
>>>-
>>>-    vm->scratch_bo[id] = xe_bo_create_pin_map(xe, tile, vm, SZ_4K,
>>>-                          ttm_bo_type_kernel,
>>>-                          flags);
>>>-    if (IS_ERR(vm->scratch_bo[id]))
>>>-        return PTR_ERR(vm->scratch_bo[id]);
>>>-
>>>-    xe_map_memset(vm->xe, &vm->scratch_bo[id]->vmap, 0, 0,
>>>-              vm->scratch_bo[id]->size);
>>>-
>>>-    for (i = 0; i < vm->pt_root[id]->level; i++) {
>>>-        vm->scratch_pt[id][i] = xe_pt_create(vm, tile, i);
>>>-        if (IS_ERR(vm->scratch_pt[id][i]))
>>>-            return PTR_ERR(vm->scratch_pt[id][i]);
>>>-
>>>-        xe_pt_populate_empty(tile, vm, vm->scratch_pt[id][i]);
>>>-    }
>>>-
>>>-    return 0;
>>>-}
>>>-
>>>/**
>>> * DOC: Pagetable building
>>> *
>>>@@ -1286,7 +1232,7 @@ __xe_pt_bind_vma(struct xe_tile *tile, 
>>>struct xe_vma *vma, struct xe_exec_queue
>>>     * it needs to be done here.
>>>     */
>>>    if ((rebind && !xe_vm_in_lr_mode(vm) && !vm->batch_invalidate_tlb) ||
>>>-        (!rebind && vm->scratch_bo[tile->id] && 
>>>xe_vm_in_preempt_fence_mode(vm))) {
>>>+        (!rebind && xe_vm_has_scratch(vm) && 
>>>xe_vm_in_preempt_fence_mode(vm))) {
>>>        ifence = kzalloc(sizeof(*ifence), GFP_KERNEL);
>>>        if (!ifence)
>>>            return ERR_PTR(-ENOMEM);
>>>diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
>>>index d5460e58dbbf..6f7359ac55bd 100644
>>>--- a/drivers/gpu/drm/xe/xe_pt.h
>>>+++ b/drivers/gpu/drm/xe/xe_pt.h
>>>@@ -26,9 +26,6 @@ unsigned int xe_pt_shift(unsigned int level);
>>>struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
>>>               unsigned int level);
>>>
>>>-int xe_pt_create_scratch(struct xe_device *xe, struct xe_tile *tile,
>>>-             struct xe_vm *vm);
>>>-
>>>void xe_pt_populate_empty(struct xe_tile *tile, struct xe_vm *vm,
>>>              struct xe_pt *pt);
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>>>index e09050f16f07..868b9a2a5d02 100644
>>>--- a/drivers/gpu/drm/xe/xe_vm.c
>>>+++ b/drivers/gpu/drm/xe/xe_vm.c
>>>@@ -1332,7 +1332,7 @@ static void vm_destroy_work_func(struct 
>>>work_struct *w);
>>>struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>>>{
>>>    struct xe_vm *vm;
>>>-    int err, i = 0, number_tiles = 0;
>>>+    int err, number_tiles = 0;
>>>    struct xe_tile *tile;
>>>    u8 id;
>>>
>>>@@ -1397,17 +1397,8 @@ struct xe_vm *xe_vm_create(struct xe_device 
>>>*xe, u32 flags)
>>>        }
>>>    }
>>>
>>>-    if (flags & XE_VM_FLAG_SCRATCH_PAGE) {
>>>-        for_each_tile(tile, xe, id) {
>>>-            if (!vm->pt_root[id])
>>>-                continue;
>>>-
>>>-            err = xe_pt_create_scratch(xe, tile, vm);
>>>-            if (err)
>>>-                goto err_scratch_pt;
>>>-        }
>>>+    if (xe_vm_has_scratch(vm))
>>>        vm->batch_invalidate_tlb = true;
>>>-    }
>>>
>>>    if (flags & XE_VM_FLAG_LR_MODE) {
>>>        INIT_WORK(&vm->preempt.rebind_work, preempt_rebind_work_func);
>>>@@ -1415,7 +1406,6 @@ struct xe_vm *xe_vm_create(struct xe_device 
>>>*xe, u32 flags)
>>>        vm->batch_invalidate_tlb = false;
>>>    }
>>>
>>>-    /* Fill pt_root after allocating scratch tables */
>>>    for_each_tile(tile, xe, id) {
>>>        if (!vm->pt_root[id])
>>>            continue;
>>>@@ -1465,19 +1455,6 @@ struct xe_vm *xe_vm_create(struct xe_device 
>>>*xe, u32 flags)
>>>
>>>    return vm;
>>>
>>>-err_scratch_pt:
>>>-    for_each_tile(tile, xe, id) {
>>>-        if (!vm->pt_root[id])
>>>-            continue;
>>>-
>>>-        i = vm->pt_root[id]->level;
>>>-        while (i)
>>>-            if (vm->scratch_pt[id][--i])
>>>-                xe_pt_destroy(vm->scratch_pt[id][i],
>>>-                          vm->flags, NULL);
>>>-        xe_bo_unpin(vm->scratch_bo[id]);
>>>-        xe_bo_put(vm->scratch_bo[id]);
>>>-    }
>>>err_destroy_root:
>>>    for_each_tile(tile, xe, id) {
>>>        if (vm->pt_root[id])
>>>@@ -1556,24 +1533,6 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>>>        vma->gpuva.flags |= XE_VMA_DESTROYED;
>>>    }
>>>
>>>-    /*
>>>-     * All vm operations will add shared fences to resv.
>>>-     * The only exception is eviction for a shared object,
>>>-     * but even so, the unbind when evicted would still
>>>-     * install a fence to resv. Hence it's safe to
>>>-     * destroy the pagetables immediately.
>>>-     */
>>>-    for_each_tile(tile, xe, id) {
>>>-        if (vm->scratch_bo[id]) {
>>>-            u32 i;
>>>-
>>>-            xe_bo_unpin(vm->scratch_bo[id]);
>>>-            xe_bo_put(vm->scratch_bo[id]);
>>>-            for (i = 0; i < vm->pt_root[id]->level; i++)
>>>-                xe_pt_destroy(vm->scratch_pt[id][i], vm->flags,
>>>-                          NULL);
>>>-        }
>>>-    }
>>>    xe_vm_unlock(vm);
>>>
>>>    /*
>>>diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
>>>index 9a0ae19c47b7..b92d8f54011d 100644
>>>--- a/drivers/gpu/drm/xe/xe_vm.h
>>>+++ b/drivers/gpu/drm/xe/xe_vm.h
>>>@@ -61,6 +61,11 @@ static inline bool 
>>>xe_vm_is_closed_or_banned(struct xe_vm *vm)
>>>    return xe_vm_is_closed(vm) || xe_vm_is_banned(vm);
>>>}
>>>
>>>+static inline bool xe_vm_has_scratch(const struct xe_vm *vm)
>>>+{
>>>+    return vm->flags & XE_VM_FLAG_SCRATCH_PAGE;
>>>+}
>>>+
>>>struct xe_vma *
>>>xe_vm_find_overlapping_vma(struct xe_vm *vm, u64 start, u64 range);
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_vm_types.h 
>>>b/drivers/gpu/drm/xe/xe_vm_types.h
>>>index 23abdfd8622f..a5762e99e6aa 100644
>>>--- a/drivers/gpu/drm/xe/xe_vm_types.h
>>>+++ b/drivers/gpu/drm/xe/xe_vm_types.h
>>>@@ -158,8 +158,6 @@ struct xe_vm {
>>>    u64 size;
>>>
>>>    struct xe_pt *pt_root[XE_MAX_TILES_PER_DEVICE];
>>>-    struct xe_bo *scratch_bo[XE_MAX_TILES_PER_DEVICE];
>>>-    struct xe_pt *scratch_pt[XE_MAX_TILES_PER_DEVICE][XE_VM_MAX_LEVEL];
>>>
>>>    /**
>>>     * @flags: flags for this VM, statically setup a creation time aside
>>>-- 2.42.0
>>>

Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2450606A31A
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 19:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JFGIac1v
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DA71112091;
	Wed, 21 Oct 2026 19:41:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CC08112091
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Oct 2026 19:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792611706; x=1824147706;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=8HM8IAy949vGgx0nIZWASbLeawTY/wm5/e98acWU6xE=;
 b=JFGIac1vM8BndD+yYKCuZ0A1K4cn1BWG/RUmod7VkZSf2PF9WHfNPd4C
 8V7s8XE4diby8+i0AGS+0eX+j1zkHCKGj6m3Bv7kxxwAtYazqFQi0jB8l
 1cYPrz8/SfF9GKixbNZzQS9/b+dDc4GZkRK+YawARtJ4GPiajAxC4EfDG
 oPnEJBr0LA6LMgCbF9mFQ6A0qTw7LDp+bShSLQ6mhWHX6TonI/5fjrtdD
 +CoDRAlDjj2qrDXosEh+uKMVnNbbQJdRpqXOzD8QBSWf5GxPqXpvrzU2e
 O9jsliXupT8VPjUjfz5TLJX4GXQ9+ikEujME6c/AOGDetR5r6/8ZaAPff g==;
X-CSE-ConnectionGUID: OCjFdWXpSx28YqJHqo3qnQ==
X-CSE-MsgGUID: FUGi+/G+RS60SkOQuwRUWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1239280"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1239280"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 12:41:45 -0700
X-CSE-ConnectionGUID: tzs3IqFrTWC9BL69FAuusw==
X-CSE-MsgGUID: u8SpVmfATh65YQGsX5oPpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3112993"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 12:41:45 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 12:41:44 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 21 Oct 2026 12:41:44 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.44) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 12:41:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gwYtypZ0yauCbhCGZan3Y2Yt41E91nU5nFtlzUWuPqWSxRS7o/ktQeD2y+ZgvFkHlvtyycIR+fub42mKavI7NoEKtm/WvRJWhO9WUDjYk99E7vrGQP/ZkqSLZ+VkXSB6vfAVJSHGVJCJbHkVSiI3qQ5XChLqC5Jd35D9QmrQf4xgqWEzW950zveG17AD26FPo6bBN9eLc5iJVUP0GGJHlTm+am2aOmRSZ6xvW3/6xtnxX8YiqQdJAcJe2Q/8sb3P7m2N7t10rOYqUXWB6NZmu2O98sLpTnrRtJZfjrBem2fCULBqd1SZOd/6A6lOJTOIF+jq9fGCH46Qwb437DBEag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P6amSm9A7M4ZrwCZlhV1lXJAVG9eVTrx0U7uR4RV14Y=;
 b=TNXO33QGtu15mDb440nq2vMtmP6GWkORvaCYeAtMEskW2czC2s/pJKWHK1uuVkG8hX65+0lqCcDV4+Hk1mfmOSIiAUrhtNIZgTkmg3VimjsTbgWCxq1WY+2zJ7fEMOBMKvPMcUcrG5KU/0A/aY1i3Qwji8OLw2510ux4+RDOlyMwcAq3kKqD/7qKLhGSJmNEVZ1K/7pAKLimOMDuTpepX4OZl0u52L/9baKi7ynV6m5Zx2ciEK8/exfHM3xsOjIOTI7WjEd5ltTMODuoHX0TpCmQ/d2G9smasfbdqae5vlTj8ZGXlF/me1ypno2prWSQqYHsjo7P7NR8bFvni7g96g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by SA3PR11MB420097.namprd11.prod.outlook.com (2603:10b6:806:531::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Wed, 21 Oct
 2026 19:41:42 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 19:41:41 +0000
Date: Wed, 21 Oct 2026 12:41:39 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Tie BO TTM LRU priority to DONTNEED/WILLNEED
 madvise state
Message-ID: <atkVc5MRkQ65VmEL@gsse-cloud1.jf.intel.com>
References: <20261020165137.765886-1-matthew.brost@intel.com>
 <bd07d276ef1a575fc8bdcd37e1dd80552fb52a69.camel@linux.intel.com>
 <ate9TVShDPYAF2L/@gsse-cloud1.jf.intel.com>
 <4687ab193a1a1c83f653463e680d21ab15936974.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4687ab193a1a1c83f653463e680d21ab15936974.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0344.namprd03.prod.outlook.com
 (2603:10b6:303:dc::19) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|SA3PR11MB420097:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f0fd50c-3feb-4db2-5ec8-08df2fab54a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|10067099003|261009223027099003|261021121427099003|56012099006|22082099003|18002099003|261021123027099003|5023799004|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: tPaCfRoZyHaOPz30EDT308xGFJX0cVaOCYaeihyneCcjhp8ecXXF8o8uZXZadK4Eywk5vMLZTwAcxFLgOa8jH8xgxieJEWWYA6inx2T5m1oLtk8IlR3giw4PaT9WG4fWYuj3BExCHc7pHqth/jPJ6q1YKKBRB06jdgR79U+/38WSn1fsZUEfzdfrEPv8+L03a8gTDom37crHSpMVU3jWEdytbU7lB8blzShx9/5iHsARcHlJ+WR1MyopfoeBACuCh8hjdkKg6W+6W06RScoeWizU3yxhGQK/CkAYO4pKfLc+jn721jOPSXk9A+vOmSIdjhXoS8IrEGmWLk2jhDZoeGNUGvVXxC/XFcEZmLhY8yBzpH/i3+f8rILtufWk3DrkPUME+fOnIrzULSMidh9iBGZNGSEZm7GzdBL4NXI6PHOxuUT9VZa2RmWSm7VqRI8FO9dXlfdlSlkxcBfgzlN54/BjF+z3OBPv8mEfuE7V0YXLJTp0S9x9TlJ7fhfGZfzMa2s0A1vH4rtval+rwyu74Uw7AcXPHTUNiHbejEW206s6oFqOaU5OsyydbptPODwyo2mKlIRdquFaO6VWRLEwL36Jv0pIiTli/PuwNE6IOd0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(261009223027099003)(261021121427099003)(56012099006)(22082099003)(18002099003)(261021123027099003)(5023799004)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?jHzrO22PfeqOMW2e4HipWnwNLZ1iW3hlI+/inQrjeJXjp7zzQw4sAZ6Nwj?=
 =?iso-8859-1?Q?2vF2avIZ54JrJJX78K80xBTmMwyN04tq2ucSjf+dHy1o837U4QAJcJB5+a?=
 =?iso-8859-1?Q?f5hBieTgTh9gKT8X9VFsAKLchJSL4Nq05agpzgmedx80XUSQcqKNNPa0zU?=
 =?iso-8859-1?Q?GOR/Q4T4wSf/Ii9JnWQIq7vNbpBymTMs14Uy5eeYzZWF2QioORu9ddm0fr?=
 =?iso-8859-1?Q?gJVH3fT+zeIsHyMF05P5k/jb/pQOZP9gaUC3rt11IVAju2MlYWZWC/AyMb?=
 =?iso-8859-1?Q?tfJZnjDsZfOCQJmJaFSIaHjZU4hpoOof7vi9SIcdS8jIAjXTEV7nwUlCa9?=
 =?iso-8859-1?Q?8fZckYiUURnjE5OokoUN0MiZdugGFEUeZyGlBeaphAMGMfZCV8uA2ltznn?=
 =?iso-8859-1?Q?sFS1J3FRU8e+Z6v2zAA+EJFR+7k+Xfl0VPcJIOJHf0laRpexyOcNvqu07p?=
 =?iso-8859-1?Q?8rtqkzukenqhdp9PeClH+r+E2lb/wFDc31Y4i9Q8GfBdbpKAGSFf83ILdP?=
 =?iso-8859-1?Q?GMYYRqhPUVF+hnbfxFqvWNApLskVCXn6eenv9oG+R/UCvHihxjFaVDo7ft?=
 =?iso-8859-1?Q?8xu57bvkqwGLuP1lAnK+qOykLqjsRz3U7AQqSBNmMSOMxNxJ9x2ig+coM3?=
 =?iso-8859-1?Q?NmVNo+xdaeZMwgAStHoBgsmbfxNXEqXejrKJz+QHJRDKl7vzbFQY9AsEx1?=
 =?iso-8859-1?Q?USGBnzj6jRRsNzBHcGgSpNSu53oR1YNtcRNJvFfyrNiHL92fkIbrOeRkbl?=
 =?iso-8859-1?Q?YepMcGEs4QbgEwUWXBVx1Himk5CQFdKBFTolz4tCfIlfJuLSQWqHjmzzDq?=
 =?iso-8859-1?Q?/1qiXDjl6l53m3j8syaNgJfze/oDDjP+AqR8C7VhZ9NloxlTWsIaa77wrT?=
 =?iso-8859-1?Q?NY/FJAkjn1v2fuE9T+vbErd+HfISC7GigalbViAEnp3SnF9BPGyMdJ98Hk?=
 =?iso-8859-1?Q?S2qi1teDPP0FjA+Lun+jQan1eflre0VNuZO32nsD6BPErf4mD1eGun16Yt?=
 =?iso-8859-1?Q?ru8hCuzCboxZwuXdmoXV3fXo4WgaYeppk5IpiM+3CSgOZVtoxQjGBpqki1?=
 =?iso-8859-1?Q?FXuuvBYEpdCKyFbR2Pp2xXGxPmfp47dSxJRQgqh0+PKLZYohAs2ShhN0TD?=
 =?iso-8859-1?Q?2TvW2wmmeUlFGZ7kemgGE67NUuCWgkfsScX2HE3llDdCboKB0vUFowa/tQ?=
 =?iso-8859-1?Q?qQ0afifvbx1mAw9wnokzO4GVx0ewU5OWytPKlln/qXDog+bNUG9BfrV49y?=
 =?iso-8859-1?Q?TG5b0pyL97hDidpIqVaOVVVbv0Pw0/+CzMEnvnKA9iErYcZ7B5JimiTrLZ?=
 =?iso-8859-1?Q?xeWlcW7OsFNMF5nR0kBdPUhVAYGa2y752KTwv0JkgdzdmzplszTYMeUcc5?=
 =?iso-8859-1?Q?3Whf7drSTV7AclPdF5cFR8chx1GKnGco/1tve2bDiNRRus29oNO8nZLchO?=
 =?iso-8859-1?Q?C15G11PvQI2MW8/oKWIhgs9aygKklQJ7ODkqpVX3fnR7XmJSeTdsPDfy0O?=
 =?iso-8859-1?Q?Ci0sH9D+9dKRNywpmvwUJUntFokOEw3y8qbRhNaGrqCKKMdaKmG71KxwIK?=
 =?iso-8859-1?Q?ziwvWmJ0Sd0to1XWEwg2oCN8KvNTr9BF/MzxmFqmCbNtcz3ZNPodkJGpdG?=
 =?iso-8859-1?Q?pmKEDRA1pyapCFBbXCeYJKu/ZPFnhlfgaSanFZ1a9cePDCInskCPiM8r9m?=
 =?iso-8859-1?Q?hBts57fiyH7xpaITzf09+jbtNGt7mQA9CboIOJRTYqv3CYxfUawY2WJVHN?=
 =?iso-8859-1?Q?qI24PVCrVylDEArpPgC6sl4+D5noBCsNLA+tQhyXZ9I7z9FUkPydbPqzKi?=
 =?iso-8859-1?Q?GyBwYMw+Tw=3D=3D?=
X-Exchange-RoutingPolicyChecked: tJbLhXMO865UsTA7S2pH5jpmaYfsU75HF7wJdMFoPPlhL7LSemTSxh3drEgehSbzfSjDPHzHHLxOfi+QPRDyKkm0aGezj+avzc6nEC7OFX1eYjKfur/y2UJtgjvZyBLY0EggFynJTDHYQMoL1W8yM1ZcgkXgoAEXjzd8244YtMFDOG2g0Yype9MMghuQww3L1DFUKB320zQ6A8yIV0BjzvRJomfWnpgbTQyb+QY7x97YjhwiDFjKa73i5O37YzzASbqkyRMwbHpr+7QI5ozB7vLjsWM4U5hhuTHZBci2qvUvyY9ciOvgr685qETfcG2wvPlHO1SvyneJFB126tmP5w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f0fd50c-3feb-4db2-5ec8-08df2fab54a2
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 19:41:41.6821 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hVzioKrmIBT6BUHJPGkKSNBAHQSlSXHwQ5NeoVNDBF/1ddAa/0I/VF8N6ZnCDPr5oKgaiLVmwwJteFZ2M5OR3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB420097
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 10:57:00PM +0200, Thomas Hellström wrote:
> On Tue, 2026-10-20 at 12:13 -0700, Matthew Brost wrote:
> > On Tue, Oct 20, 2026 at 09:00:09PM +0200, Thomas Hellström wrote:
> > > On Tue, 2026-10-20 at 09:51 -0700, Matthew Brost wrote:
> > > > The DRM_XE_MADVISE ioctl lets userspace mark a VMA's BO as
> > > > DONTNEED,
> > > > signalling that its contents are not needed right now and may be
> > > > discarded under memory pressure (see madvise_purgeable() in
> > > > xe_vm_madvise.c), or restore it back to WILLNEED. This is a
> > > > stronger,
> > > > explicit signal than a plain unbind: userspace has told us the BO
> > > > is
> > > > not
> > > > just unused for now, but that it is actively fine to lose the
> > > > data.
> > > > There is no reason to keep such a BO competing for LRU space with
> > > > actively used buffers, and conversely, once userspace marks it
> > > > WILLNEED
> > > > again it is back in active use and should be reprioritized
> > > > accordingly.
> > > > 
> > > > Give xe two TTM LRU priority bands and tie them to that state:
> > > > XE_BO_PRIORITY_LOW for DONTNEED BOs and XE_BO_PRIORITY_NORMAL for
> > > > everything else. Since the TTM LRU is walked in ascending
> > > > priority
> > > > order, DONTNEED BOs become the first candidates for eviction and
> > > > shrinking. The transition is driven from
> > > > xe_bo_set_purgeable_state(),
> > > > the single point through which a BO's aggregate purgeable state
> > > > actually
> > > > moves between WILLNEED and DONTNEED (PURGED is terminal and left
> > > > at
> > > > XE_BO_PRIORITY_LOW).
> > > > 
> > > > Changing bo->ttm.priority cannot be done by a plain store:
> > > > private,
> > > > user
> > > > BOs have bo->ttm.bulk_move set to their VM's LRU bulk-move range,
> > > > which
> > > > tracks a contiguous [first, last] run of resources per (mem_type,
> > > > priority) bucket. Writing the priority while the BO is still
> > > > attached
> > > > would leave the resource linked in the old priority's bucket
> > > > while
> > > > the
> > > > bulk-move code looks it up under the new one, corrupting both.
> > > > Add
> > > > xe_bo_update_ttm_priority(), which temporarily detaches the BO
> > > > from
> > > > its
> > > > bulk-move range, updates the priority with a plain non-bulk LRU
> > > > update,
> > > > and reattaches it into the new priority's bucket.
> > > > xe_bo_set_purgeable_state() is always called with the BO's dma-
> > > > resv
> > > > held, so this is safe.
> > > > 
> > > > With DONTNEED BOs now clustered at XE_BO_PRIORITY_LOW, the
> > > > shrinker's
> > > > purge pass no longer needs to walk each memory type's whole LRU:
> > > > nothing
> > > > beyond XE_BO_PRIORITY_LOW can possibly be purgeable, so
> > > > continuing
> > > > past
> > > > it just wastes time trylocking BOs that can never be purged in
> > > > this
> > > > pass. Break out of the per-mem_type LRU walk in
> > > > __xe_shrinker_walk()
> > > > once a BO's priority rises above XE_BO_PRIORITY_LOW during the
> > > > purge
> > > > pass. Behavior of the non-purge (regular shrink) pass is
> > > > unchanged.
> > > > 
> > > > Assisted-by: LLM
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_bo.c       | 46
> > > > ++++++++++++++++++++++++++++++++
> > > >  drivers/gpu/drm/xe/xe_bo_types.h |  8 +++++-
> > > >  drivers/gpu/drm/xe/xe_shrinker.c |  3 +++
> > > >  3 files changed, 56 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > > > b/drivers/gpu/drm/xe/xe_bo.c
> > > > index 6d2ac986e98a..b723addf071d 100644
> > > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > > @@ -1086,6 +1086,38 @@ static void
> > > > xe_bo_set_purgeable_shrinker(struct xe_bo *bo,
> > > >  	}
> > > >  }
> > > >  
> > > > +/*
> > > > + * Change @bo's TTM LRU priority to @priority. @bo's dma-resv
> > > > must
> > > > be held.
> > > > + *
> > > > + * Private, user BOs of non-fault-mode VMs have bo-
> > > > >ttm.bulk_move
> > > > set to their
> > > > + * VM's LRU bulk-move range (see xe_bo_create_user()), which
> > > > tracks
> > > > a
> > > > + * contiguous [first, last] run of resources per (mem_type,
> > > > priority) bucket.
> > > > + * Writing bo->ttm.priority while the BO is still attached to
> > > > that
> > > > range would
> > > > + * leave the resource linked in the old priority's bucket while
> > > > the
> > > > bulk-move
> > > > + * code looks it up under the new one, corrupting both buckets.
> > > > Temporarily
> > > > + * detaching the BO from its bulk-move range moves it with a
> > > > plain,
> > > > non-bulk
> > > > + * LRU update instead, and reattaching afterwards re-inserts it
> > > > into
> > > > the new
> > > > + * priority's bucket.
> > > > + */
> > > > +static void xe_bo_update_ttm_priority(struct xe_bo *bo, int
> > > > priority)
> > > > +{
> > > > +	struct ttm_lru_bulk_move *bulk = bo->ttm.bulk_move;
> > > > +
> > > > +	xe_bo_assert_held(bo);
> > > > +
> > > > +	if (bo->ttm.priority == priority)
> > > > +		return;
> > > 
> > > Hm, what about (pseudo code)
> > > 
> > > spin_lock(lru_lock);
> > > bo->ttm.priority = priority;
> > > ttm_bo_move_to_lru_tail(&bo->ttm);
> > > spin_unlock(lru_lock);
> > > 
> > > If that works, we could also shorten the comment a bit.
> > > 
> > 
> > This doesn't work. IIRC this explodes in TTM, hence the way this
> > coded.
> 
> Ugh, you're right. Should probably resurrect the conversion of bulk
> moves to sublists....
> 

Yes, we should resurrect this, as we really shouldn't have a TTM API
that doesn't behave the way you suggest.

Anyway, I've pushed this patch with a kernel-doc fixup.

Matt

> https://patchwork.freedesktop.org/patch/746362/?series=170311&rev=3
> 
> /Thomas
> 
> > 
> > > > +
> > > > +	if (bulk)
> > > > +		ttm_bo_set_bulk_move(&bo->ttm, NULL);
> > > > +
> > > > +	bo->ttm.priority = priority;
> > > > +	ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
> > > > +
> > > > +	if (bulk)
> > > > +		ttm_bo_set_bulk_move(&bo->ttm, bulk);
> > > > +}
> > > > +
> > > >  /**
> > > >   * xe_bo_set_purgeable_state() - Set BO purgeable state with
> > > > validation
> > > >   * @bo: Buffer object
> > > > @@ -1095,6 +1127,13 @@ static void
> > > > xe_bo_set_purgeable_shrinker(struct xe_bo *bo,
> > > >   * transitions. Once a BO is PURGED, it cannot transition to any
> > > > other state.
> > > >   * Invalid transitions are caught with xe_assert(). Shrinker
> > > > page
> > > > accounting
> > > >   * is updated automatically.
> > > > + *
> > > > + * A WILLNEED -> DONTNEED transition also lowers the BO's TTM
> > > > LRU
> > > > priority to
> > > > + * XE_BO_PRIORITY_LOW: userspace has signaled it does not need
> > > > these
> > > > contents
> > > > + * again soon, so make it one of the first buffers considered
> > > > for
> > > > + * eviction/shrinking. The shrinker's purge pass relies on this
> > > > clustering to
> > > > + * bound its LRU walk. Conversely, a DONTNEED -> WILLNEED
> > > > transition
> > > > restores
> > > > + * XE_BO_PRIORITY_NORMAL, since the BO is back in active use.
> > > 
> > > Is it possible to make this comment less verbose and focus on what
> > > the
> > > function is doing. Perhaps we could put the LRU priorities and what
> > > the
> > > shrinker relies on in a separate DOC section?
> > > 
> > 
> > Ok, let me adjust this.
> > 
> > Matt
> >  
> > > 
> > > 
> > > Thanks,
> > > Thomas
> > > 
> > > 
> > > 
> > > 
> > > >   */
> > > >  void xe_bo_set_purgeable_state(struct xe_bo *bo,
> > > >  			       enum xe_madv_purgeable_state
> > > > new_state)
> > > > @@ -1112,6 +1151,13 @@ void xe_bo_set_purgeable_state(struct
> > > > xe_bo
> > > > *bo,
> > > >  	xe_assert(xe, !(bo->purgeable.state ==
> > > > XE_MADV_PURGEABLE_PURGED &&
> > > >  			new_state != XE_MADV_PURGEABLE_PURGED));
> > > >  
> > > > +	if (new_state == XE_MADV_PURGEABLE_DONTNEED &&
> > > > +	    bo->purgeable.state == XE_MADV_PURGEABLE_WILLNEED)
> > > > +		xe_bo_update_ttm_priority(bo,
> > > > XE_BO_PRIORITY_LOW);
> > > > +	else if (new_state == XE_MADV_PURGEABLE_WILLNEED &&
> > > > +		 bo->purgeable.state ==
> > > > XE_MADV_PURGEABLE_DONTNEED)
> > > > +		xe_bo_update_ttm_priority(bo,
> > > > XE_BO_PRIORITY_NORMAL);
> > > > +
> > > >  	bo->purgeable.state = new_state;
> > > >  	xe_bo_set_purgeable_shrinker(bo, new_state);
> > > >  }
> > > > diff --git a/drivers/gpu/drm/xe/xe_bo_types.h
> > > > b/drivers/gpu/drm/xe/xe_bo_types.h
> > > > index 8ec4a01a0092..0265fb314c77 100644
> > > > --- a/drivers/gpu/drm/xe/xe_bo_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> > > > @@ -24,7 +24,13 @@ struct xe_exec_queue;
> > > >  
> > > >  #define XE_BO_MAX_PLACEMENTS	3
> > > >  
> > > > -/* TODO: To be selected with VM_MADVISE */
> > > > +/*
> > > > + * TTM LRU priority bands. The LRU is walked in ascending
> > > > priority
> > > > order, so
> > > > + * XE_BO_PRIORITY_LOW objects are the first candidates for
> > > > eviction
> > > > and
> > > > + * shrinking. BOs advised DONTNEED through DRM_XE_MADVISE live
> > > > at
> > > > + * XE_BO_PRIORITY_LOW, everything else at XE_BO_PRIORITY_NORMAL.
> > > > + */
> > > > +#define	XE_BO_PRIORITY_LOW	0
> > > >  #define	XE_BO_PRIORITY_NORMAL	1
> > > >  
> > > >  /**
> > > > diff --git a/drivers/gpu/drm/xe/xe_shrinker.c
> > > > b/drivers/gpu/drm/xe/xe_shrinker.c
> > > > index 772dab9b3ed7..c86455ea08d1 100644
> > > > --- a/drivers/gpu/drm/xe/xe_shrinker.c
> > > > +++ b/drivers/gpu/drm/xe/xe_shrinker.c
> > > > @@ -133,6 +133,9 @@ static int __xe_shrinker_walk(struct
> > > > xe_shrinker
> > > > *shrinker,
> > > >  		}
> > > >  
> > > >  		ttm_bo_lru_for_each_reserved_guarded(&curs, man,
> > > > &arg, ttm_bo) {
> > > > +			if (flags.purge && ttm_bo->priority >
> > > > XE_BO_PRIORITY_LOW)
> > > > +				break;
> > > > +
> > > >  			if (!ttm_bo_shrink_suitable(ttm_bo,
> > > > ctx))
> > > >  				continue;
> > > >  

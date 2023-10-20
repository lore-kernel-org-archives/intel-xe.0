Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA49FCDB474
	for <intel-xe@archiver.kernel.org>; Fri, 20 Oct 2023 17:48:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB92610E0FB;
	Fri, 20 Oct 2023 17:48:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32FED10E0FB
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Oct 2023 17:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697824110; x=1729360110;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=K3W1Gchc2WC5zQq9X3r4hT1XwMxh9M5qHb7yoJui8zM=;
 b=HmV2hkfScr712TEPpzPskBV4yADR81hmZuiTF7bk9erxa1Ar+1txW4t6
 UFjLP0qNStGMYzBoUubXflWpZPQbN7jKHl2YH3QydKM0XUBZ8DmBYaGWE
 4UzNoEH6EkG1O7+4GELw94rYkhVvPB//EtRSOybCU4T/nbZBDLvp4NCK1
 M9OQ20mHWQKVTyV0ZGvgK+3Q5dqDpOofQyEm8HJsu462oYmDiAtUDNZ6r
 nXE8WLtSCtVXsHCngRwC6ZgDb5LmCxpXYNSwopXisOZAo7px77yQggVTD
 AmbVB90bebvGuSY44tGeZhyOEUI2R8oOfHGGXlDJ+1ZcU+YXKSICXiQJl A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="453022913"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; d="scan'208";a="453022913"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 10:48:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="757533187"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; d="scan'208";a="757533187"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Oct 2023 10:48:29 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 20 Oct 2023 10:48:29 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 20 Oct 2023 10:48:28 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 20 Oct 2023 10:48:28 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 20 Oct 2023 10:48:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=haso1ZxTDMPbwVS2g3b6ebC5W1fnNE7q0M/kQQQR6ampKXDv2LE1u/cFGqCttLxurMnacSqMQ58/y3nG6mli2rdP5k8nwbdOImgspLh27rdFsLIiZ2CZNAGhKFYXWFy9FrF0ctZ7uIlh5xO+t+EaDbeLtXHX3V0vh3yI0Zsp27DRO+8BQc3Pw64F45veMWbMJ69Lm86BZdiw5Kiw7D3dftz1X48fM3bkLLfn8mtJPIYclv8u5WZt8a+erb0wxEvKOE9kyuK7V6ccXAo+dNkEgwcrl9mPaDdJZFNs9ZRi+sA3fhGhJDzsNNCQzdlpaexvbKtWm+huQjr+DIbupa6Rdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eei5L6fMo22nHgK4e8wizLq6OngpUtIGJOymp7mltY8=;
 b=mM9ElLFga3P2g8uDKRzsOb9Nbczj3l93wwDGUJG9t4A3CSvGQi8zEFQqjAlSYFCLYwNy+q2MUlO9qgZeDOPuqMPEcS4h1QYNweBIlaw2MCBfikg5K1PAuUIB1pYlEkdocjpPGssKML+Jn2J0+JE2cqBpDxL4LGekWMHV+NZHFQb+XVJrdv0yXJnTKkifRv2PcYZZbDDm2BilepNxUxp7vrv1dBJpV/wqBfemM/13tADGToR0C8E8YZAUT3GRkrhxJDY6UPBU6Ho5a9uj3STmcslstmBturPWgVPXZKS6mePMUwwNa1k04MK/vzGCxNFjKoE19hgFYlDLTRMR9HsniQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB5577.namprd11.prod.outlook.com (2603:10b6:510:eb::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Fri, 20 Oct
 2023 17:48:27 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::c228:5055:b7da:d0bf]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::c228:5055:b7da:d0bf%6]) with mapi id 15.20.6907.021; Fri, 20 Oct 2023
 17:48:27 +0000
Date: Fri, 20 Oct 2023 12:48:42 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
Message-ID: <xmbfukrlh3m3anwz2lthj64wblyah44dqwjeukiqvy67fbhw7t@mbzqkc2i65sd>
References: <20231020172155.97172-1-stuart.summers@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231020172155.97172-1-stuart.summers@intel.com>
X-ClientProxiedBy: SJ0PR03CA0090.namprd03.prod.outlook.com
 (2603:10b6:a03:331::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB5577:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ed95f36-b042-4a94-29a7-08dbd194c381
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pCToq5wxK4WrMBzpBMKIzh2GkZBIOdntF0sEnvZ/ZRcHIYg3jPcbK1MiG/Fwy1zBFDpCdou+w3hORdYdsXDz18akxBB5NHxg0YMeaizFDu8/Woetx16bdZqt1zWi4iGLBzWSoFcCAaMOuI8MAfH6TmfcmLuCehSyD3tIaRTIuG96Ptlvgr8D2jbnNwN7REMleqmwm/zYNTpar86kaOF92iPajyIM+P18GO7oErnRjuADFnmjKw57/RI/tj/d+8UnoVbqWky2at4kOh2siVCOUk7OA3tGuu5e0r3O4FFiZzXWwjTFCPHyeXo5fR++9fTRC6LIs6ZGUBxGTOl+qxbQ+CiO5Yoo8cVIQlxIdTtKbBFQsX0xmaqZJzpvr9veLHZKxrQEj0Kgo9LyixGQ57RSaS3fjBypUZfgMmN+fWRBEKTvsQPI4JFS4MS1xXBp92/s7ASZapu0wV7456ham/3j1G1i3uUP6i+ILzHiqxYA6Kb7BpzTiL9K528wOjScepDjOWI9EuWE2tI7vm91N4Vhe6hGyDz/5tUEXBQsby98mj8k5S39EWBg1zoXBHcbYfOd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(136003)(39860400002)(366004)(396003)(376002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(66476007)(66556008)(66946007)(6636002)(316002)(33716001)(41300700001)(8936002)(8676002)(26005)(4326008)(6862004)(82960400001)(478600001)(66574015)(6512007)(9686003)(86362001)(6666004)(38100700002)(2906002)(83380400001)(6506007)(6486002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?92aneXRkO9McpfZKdtdTshRMlZHx5BgluQyHeusdKMA8PnvQns2VX7XTms?=
 =?iso-8859-1?Q?kS4FyNlF+GLEw1eZyJJIViySM+xaCUoug1s3u4phevGkPXeaVhAnMUX2VP?=
 =?iso-8859-1?Q?NpgmhU+9Gq2TAaTRg+wyXv+qCba5Pd+MOfOr3DTqo9Q+qmT1I+LOuBH9UT?=
 =?iso-8859-1?Q?l57GE+vowSaoA+n94GbC+duiAy3JgtH7eHm7un1zZBkP7wrJ10xeQvu142?=
 =?iso-8859-1?Q?YdkGc3LRjNuX+5C7KquzObZLlgvw10TMOH8r6ZM/93k7G8oUWAIHMi2J4L?=
 =?iso-8859-1?Q?jMJZJR3C41xd5PLlau1al5WsctWJzV8IOZBBC9EMAKUllVl3L0mvvTIvQ9?=
 =?iso-8859-1?Q?PWQY60ZkhbKacddAz4LNcMTGnflOifA0P4fqH1fHCHzMLOVIpcuPBV9gdo?=
 =?iso-8859-1?Q?JfBNKbiPHzZ8irKmqEDRTcN3ps7dMSykoL/8h76D6RfoUw6SzYHrF57aEp?=
 =?iso-8859-1?Q?UNnw4f76+5nwdGY0zUw33U8izSdHhexzRao90yeHiTiPEGcq2kR4m98WnH?=
 =?iso-8859-1?Q?JVdbCZ+3z209nHberFzg00aEnH61ZCUeP96YrkPxvVjEp6V0U3GQ60mk8j?=
 =?iso-8859-1?Q?tI+XnFxTf9wYqpS7kKFctrzUxgxBZJkjuS2uJVOdbsEanjg4yE3qfksfF4?=
 =?iso-8859-1?Q?g/R9km0Mq6N4+4ukYxAomKZQbDjLJTD+9uBYHrcyN4ymcyHtCe9I+ao6Cz?=
 =?iso-8859-1?Q?dyNDx/hi3d++XfHfsh8ugcShfWD3i/py3FoZK+Uj23DQJNpcf9Y4TJ0AVl?=
 =?iso-8859-1?Q?F3iW0PNVT8ALI8ReZpS9x1mw+eurWkaFV8voyxYvIV+ascMWBxz2u/EoWd?=
 =?iso-8859-1?Q?SCShpIck5kQMU3T64A7h2MYL7j2gGr1b4gv/MSq61uZpbeUD3UugcGNeWP?=
 =?iso-8859-1?Q?mwQEtEAirqMMGIeuw0Eq4RnTSqA3v18lstAxGGVlkTfst0aabatwIo+/CU?=
 =?iso-8859-1?Q?vMs3Czop5dJjXgvHKd87ATkvxkaj/aRyyr5hSIbrQGDzyVc/vLIt8t9Pvj?=
 =?iso-8859-1?Q?3eB9ZLaNfzumZN99fawznwxhDlg8EKnuUEPEqduXQ3RxN2D5IHGM7idvqJ?=
 =?iso-8859-1?Q?tFENR1fBbE6d8IJICHkBJ4mI8Rf01nf28lVaulQEj7GZNoPEWjKQG4d09B?=
 =?iso-8859-1?Q?m++kIQkNYv93LwCaNk01rRsHIwwTVNYBXiH4CGmuL27Z+OdWgJu9Rj6SJu?=
 =?iso-8859-1?Q?5GeDRZKTX5OW/C27dCBD4+dYnX+7p/z4ARm363oWUTr6wSoFYCw19IIyeS?=
 =?iso-8859-1?Q?0EwCgWoU28/UwMRxT1UPcgez9NrlWNHrzILKNuWHX1rbKFRgBbUgrOQqH8?=
 =?iso-8859-1?Q?Gn3BXqQufamamS8NfKa0Pqc5GG20hT+Ia4/BFpKV/hB0TveIJSEp8RiTVW?=
 =?iso-8859-1?Q?Q4N38o3CW0V8zIIt7/hopQlHIXxkVvIt/r6OZC4RpyNxJ1pfDlBOY/A9YF?=
 =?iso-8859-1?Q?Nyqs52zccfYI22wcdum05RPXI51ZOKiet1TZO6gFUIFsi0ebeGqSmELZOx?=
 =?iso-8859-1?Q?uehr1rGUws7rb+Bts3MvKX/58dM/KHbl5dEHIWUeQuWkgkiBtvHLYwWJKk?=
 =?iso-8859-1?Q?Oip8X7BQ9zWjbsDKKnldlKFRudRUpQxJdTjzRTPIYVLtigj8uZD1yyJI5x?=
 =?iso-8859-1?Q?Jk3FRn90aG2LzllRCikdht2V2UNUkHPQAn0lpHd/6P10zEh1dAIdDHPA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ed95f36-b042-4a94-29a7-08dbd194c381
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 17:48:27.0445 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3fO5n22bewWGQSJtyy4oNUKReAyIIE9+fud+dBxH/O9q2IF2iWMu/1le9bnmjdJF+1dA/mzfRY6DT98evN4lMxDoVarZx8z5LoykFyO/yTI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5577
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Move VM entries print to a trace
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
Cc: himanshu.girotra@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Oct 20, 2023 at 05:21:55PM +0000, Stuart Summers wrote:
>While this information can be useful for debug, it is a little
>verbose to dump during a CI run, resulting in test failures due
>to disk limit issues in the CI machines.
>
>For now, move these debug prints to a trace for manual debug.
>
>Signed-off-by: Stuart Summers <stuart.summers@intel.com>

I think this is the right direction... maybe get an ack from
Thomas Hellström / Matthew Brost. From a quick look at the git history
(you will need to look at the xe branch, not drm-xe-next),
it seems they are the original authors of those debug prints.

Some comments below.

>---
> drivers/gpu/drm/xe/xe_pt.c    | 35 +++++-------------------------
> drivers/gpu/drm/xe/xe_pt.h    |  8 +++++++
> drivers/gpu/drm/xe/xe_trace.h | 41 +++++++++++++++++++++++++++++++++++
> 3 files changed, 54 insertions(+), 30 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>index 31afab617b4e..eb905878c4cb 100644
>--- a/drivers/gpu/drm/xe/xe_pt.c
>+++ b/drivers/gpu/drm/xe/xe_pt.c
>@@ -908,6 +908,9 @@ static void xe_pt_commit_bind(struct xe_vma *vma,
>
> 			pt_dir->dir.entries[j_] = &newpte->base;
> 		}
>+
>+		trace_xe_pt_commit_bind(&entries[i]);
>+
> 		kfree(entries[i].pt_entries);
> 	}
> }
>@@ -929,34 +932,6 @@ xe_pt_prepare_bind(struct xe_tile *tile, struct xe_vma *vma,
> 	return err;
> }
>
>-static void xe_vm_dbg_print_entries(struct xe_device *xe,
>-				    const struct xe_vm_pgtable_update *entries,
>-				    unsigned int num_entries)
>-#if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM))
>-{
>-	unsigned int i;
>-
>-	vm_dbg(&xe->drm, "%u entries to update\n", num_entries);
>-	for (i = 0; i < num_entries; i++) {
>-		const struct xe_vm_pgtable_update *entry = &entries[i];
>-		struct xe_pt *xe_pt = entry->pt;
>-		u64 page_size = 1ull << xe_pt_shift(xe_pt->level);
>-		u64 end;
>-		u64 start;
>-
>-		xe_assert(xe, !entry->pt->is_compact);
>-		start = entry->ofs * page_size;
>-		end = start + page_size * entry->qwords;
>-		vm_dbg(&xe->drm,
>-		       "\t%u: Update level %u at (%u + %u) [%llx...%llx) f:%x\n",
>-		       i, xe_pt->level, entry->ofs, entry->qwords,
>-		       xe_pt_addr(xe_pt) + start, xe_pt_addr(xe_pt) + end, 0);
>-	}
>-}
>-#else
>-{}
>-#endif
>-
> #ifdef CONFIG_DRM_XE_USERPTR_INVAL_INJECT
>
> static int xe_pt_userptr_inject_eagain(struct xe_vma *vma)
>@@ -1276,7 +1251,6 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queue
> 		goto err;
> 	xe_tile_assert(tile, num_entries <= ARRAY_SIZE(entries));
>
>-	xe_vm_dbg_print_entries(tile_to_xe(tile), entries, num_entries);
> 	xe_pt_calc_rfence_interval(vma, &bind_pt_update, entries,
> 				   num_entries);
>
>@@ -1563,6 +1537,8 @@ xe_pt_commit_unbind(struct xe_vma *vma,
> 				pt_dir->dir.entries[i] = NULL;
> 			}
> 		}
>+
>+		trace_xe_pt_commit_unbind(entry);
> 	}
> }
>
>@@ -1627,7 +1603,6 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queu
> 	num_entries = xe_pt_stage_unbind(tile, vma, entries);
> 	xe_tile_assert(tile, num_entries <= ARRAY_SIZE(entries));
>
>-	xe_vm_dbg_print_entries(tile_to_xe(tile), entries, num_entries);


> 	xe_pt_calc_rfence_interval(vma, &unbind_pt_update, entries,
> 				   num_entries);
>

so now we are tracing the entries individually on xe_pt_commit_bind()
and xe_pt_commit_unbind(). However there are a few direct users of the
previous functions this was printed on:

drivers/gpu/drm/xe/xe_gt_pagefault.c:   fence = __xe_pt_bind_vma(tile, vma, xe_tile_migrate_engine(tile), NULL, 0,
drivers/gpu/drm/xe/xe_vm.c:             fence = __xe_pt_bind_vma(tile, vma, q ? q : vm->q[id],
drivers/gpu/drm/xe/xe_vm.c:             fence = __xe_pt_unbind_vma(tile, vma, q ? q : vm->q[id],

Are we goint to miss those events now?

If we have dedicated traces for all the interesting events, maybe we can
go ahead and a) remove vm_dbg(); b) remove CONFIG_DRM_XE_DEBUG_VM... the
trace calls will be just NOP instructions unless they are enabled.


>diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
>index d5460e58dbbf..c7e5f7111227 100644
>--- a/drivers/gpu/drm/xe/xe_pt.h
>+++ b/drivers/gpu/drm/xe/xe_pt.h
>@@ -18,6 +18,14 @@ struct xe_tile;
> struct xe_vm;
> struct xe_vma;
>
>+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)
>+#define xe_pt_set_addr(__xe_pt, __addr) ((__xe_pt)->addr = (__addr))
>+#define xe_pt_addr(__xe_pt) ((__xe_pt)->addr)
>+#else
>+#define xe_pt_set_addr(__xe_pt, __addr)
>+#define xe_pt_addr(__xe_pt) 0ull
>+#endif

did you forget to remove those from the .c? But as I said, maybe we can go ahead
and simply remove these, replacing them inline in their callers

Lucas De Marchi

>+
> #define xe_pt_write(xe, map, idx, data) \
> 	xe_map_wr(xe, map, (idx) * sizeof(u64), u64, data)
>
>diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
>index e32f1cad51d9..24d898061d04 100644
>--- a/drivers/gpu/drm/xe/xe_trace.h
>+++ b/drivers/gpu/drm/xe/xe_trace.h
>@@ -17,8 +17,49 @@
> #include "xe_gt_tlb_invalidation_types.h"
> #include "xe_gt_types.h"
> #include "xe_guc_exec_queue_types.h"
>+#include "xe_pt_types.h"
> #include "xe_sched_job.h"
> #include "xe_vm.h"
>+#include "xe_pt.h"
>+
>+DECLARE_EVENT_CLASS(xe_vm_pgtable_update,
>+		    TP_PROTO(struct xe_vm_pgtable_update *update),
>+		    TP_ARGS(update),
>+
>+		    TP_STRUCT__entry(
>+			     __field(u64, page_size)
>+			     __field(u64, end)
>+			     __field(u64, start)
>+			     __field(u64, pt_addr)
>+			     __field(unsigned int, level)
>+			     __field(u32, ofs)
>+			     __field(u32, qwords)
>+			     ),
>+
>+		    TP_fast_assign(
>+			   __entry->level = xe_pt_shift(update->pt->level);
>+			   __entry->page_size = 1ull << __entry->level;
>+			   __entry->pt_addr = xe_pt_addr(update->pt);
>+			   __entry->ofs = update->ofs;
>+			   __entry->qwords = update->qwords;
>+			   __entry->start = __entry->pt_addr + update->ofs * __entry->page_size;
>+			   __entry->end = __entry->start + __entry->page_size * update->qwords;
>+			   ),
>+
>+		    TP_printk("Update level %u at (%u + %u) [%llx...%llx]",
>+			      __entry->level, __entry->ofs, __entry->qwords,
>+			      __entry->start, __entry->end)
>+);
>+
>+DEFINE_EVENT(xe_vm_pgtable_update, xe_pt_commit_bind,
>+	     TP_PROTO(struct xe_vm_pgtable_update *entry),
>+	     TP_ARGS(entry)
>+);
>+
>+DEFINE_EVENT(xe_vm_pgtable_update, xe_pt_commit_unbind,
>+	     TP_PROTO(struct xe_vm_pgtable_update *entry),
>+	     TP_ARGS(entry)
>+);
>
> DECLARE_EVENT_CLASS(xe_gt_tlb_invalidation_fence,
> 		    TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
>-- 
>2.34.1
>

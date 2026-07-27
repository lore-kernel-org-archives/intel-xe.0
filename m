Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1DC7C531D0
	for <intel-xe@archiver.kernel.org>; Mon, 27 Jul 2026 19:46:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD6E410E6D9;
	Mon, 27 Jul 2026 19:46:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iB5WiJaI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F176D10E6D9
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Jul 2026 19:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785181578; x=1816717578;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=zsc00wEJLXu8hTZg25vK8g3013f2nPX20zDUF7zbW0I=;
 b=iB5WiJaI26QuIJvtHmya1N0TmahM7hcHAEMzfkpSysiPGGFTnehLarG4
 GbkYDHExlk1yMruXACdE5GUQ9Ft69h46ef6smNM0AeBSHE3rZu19CvH3i
 JbzfIeYWc6v0x121DGV3IrrGYEP+m4GdXUTkwRaaoG62ilwqVAuVliVpY
 i5k2scWHOmKPFszt/kaJ3sBa4g0bW1j5xQWfHB/GYv3SmY+HshfT5pPBC
 sEnv+ghfKDoHgcFHUyKJ+wCNIXx26X1TlaYU/MEdChcAbuI+u5dgX1E5/
 5eHYOobWowx0XX/mDMSkyaMEJfaM/7UIPjO455YxjkhAUzBr3gNmuMZaS Q==;
X-CSE-ConnectionGUID: WSbjydMuSbqnFG7AJma08g==
X-CSE-MsgGUID: V4aPojQHTXm2V7mUc0oaaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="85842745"
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; d="scan'208";a="85842745"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 12:46:18 -0700
X-CSE-ConnectionGUID: ypoV221xRmSGy1VhHX8PkA==
X-CSE-MsgGUID: oku2rf4OTi2T9q8UDDze/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; d="scan'208";a="264482102"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 12:46:17 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 27 Jul 2026 12:46:16 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 27 Jul 2026 12:46:16 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.37) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 27 Jul 2026 12:46:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nca9/8UBSTdvSWWC6KK23FOLXiQNxP9I3iSV1FsBwqeY62pVFYMpp0VDRVLJnPP5O+VNgh+RAGNK6qCdlX4ahNL8zurbX/QhYlFWbTkfiGTMwdyDEktrS7pUPLTrlNoivKhjTGU18JMKIzwdm4YvSQED+hSpw26WX6nzRqPXgIpTVFeQZFWul1y6Pkw9FFPStbUGxFKyQ6gWI4y1i+gK1Bh8QlKwG4Gidnv3ISvn71HE+r3dz5lqe8culBJhJz7279/BYJD4ZzZrV6eCdYGCKODJvzD9/PkAofxOdjDqWdo+q+DjMJ4sRXLhSP5v9hWt4Hr2kOAQbkgTeREQpNxFww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ks2RtUDskKchJmba5keqiVXV4J+dJdszbrvx299RlEI=;
 b=GIcCb0pENaDA0HUv6fjzilHcu11vm5bSOAxjTPnh+WBcvL872LwBFvdSlaSGsg8fBTw5mfM7CGkie8eQMsiQ6H5lZafwKa1oS7J8cVJHlTiafFqFA2huiRrq5FsieKtmDjSLCH8/8YN6imYEQJ9Cd8VOyZKyAVtP6J7Wk9ZttqRrunmk4vkbhjNNf9ZidkFwZV9y64uLHNX7sGl0aZ3y5BoDngQHnDRAERBO5W5Gf6eR+EJeOkBmANWLFyOHoJ3SWofZDkz5ve9DKGSxjrII0S7+4idspU0EhpsPkNe2b9yxeuCsVbymz6bZFTHM0Tpx0ZKZE0gW4dM3JsPHNl205w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB9723.namprd11.prod.outlook.com (2603:10b6:510:3a2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 19:46:15 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 19:46:15 +0000
Date: Mon, 27 Jul 2026 12:46:12 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>, Copilot
 <223556219+Copilot@users.noreply.github.com>
Subject: Re: [PATCH v8 03/12] drm/xe: Thread prefetch of SVM ranges
Message-ID: <ame1hJx78+xqQ4v4@gsse-cloud1.jf.intel.com>
References: <20260724232601.1753977-1-matthew.brost@intel.com>
 <20260724232601.1753977-4-matthew.brost@intel.com>
 <ameKMjpyQQuDWL5X@fdugast-desk>
 <amevnA0mPEBNWp9Z@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <amevnA0mPEBNWp9Z@gsse-cloud1.jf.intel.com>
X-ClientProxiedBy: SJ0PR13CA0033.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB9723:EE_
X-MS-Office365-Filtering-Correlation-Id: 93a11430-5e0a-4bed-46a1-08deec17b7ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|6133799003|4143699003|22082099003|18002099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: IDnGA7nFn2fFCI1BImEY43/UYeinMybhepPsaxKjjcEpP2zV0GqtHkBtQRU3AuowPNRpeHwVBplTy8tm7/jCEZToL9j4ObczuQ626pNTFR7gMSC79Xztgr0Z92H1y8TjP6RJt8reHkoQZb3k3S+4yBbA8+RFNNVZyhraYkyiuqynAi0sBoFje2HiwO+TVy0GHndfgSIDsfz3qgP6Dkzb5wbwX0ff7et87yVuGwYH14vWg+did5Jv38PJUL/IeeHRxeyiXMw4DjbCo7VNdL+qN05OZTonPJ/tbZfUEBnz1lIpuufPEpOCEGJXQbl+mP9UOQOS5O7bTW6n679wC9K+LBFzg6Ov1okk02UTljBLTF9QqcR34YQ3vU7TVXH1i0+a5CVUsix5nZoq3d+XuZic/ZzzTvImtjWZhGquoSLpeM/9TOnt+j3Yac5wfv97PcC9KL2YaS5mWXwACR85BLrGYD+2/lYeS6HzOg8o52kHUMtIc24sIgRs+UPUNosAQS9VxSVvfZXQMPXfcU80eg4TqGkcTuC6RvaiZDtFeGV/rfQCzAdBcdPELa8mw1HRAOSuAekUHwv5zXmAYqJm22ZHR4y1q9ye5GSO5LCvkeU8mSXGQlS7rGUOfPjzktk+tY+yqiOs6aUEGT6d/AW8YdVZbAYYoR4qIllenUSgFQ77u2I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(6133799003)(4143699003)(22082099003)(18002099003)(10067099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?7gT+4Iynl138caiObXkepfUMUMqcB5xZCH9idiYnrpH73g26WfY887eDF/?=
 =?iso-8859-1?Q?W4yln9raqjwWfpRvT2lxs7gZn9tg+fzCNXZsox5H+vWsVCmftcV8rpDGfn?=
 =?iso-8859-1?Q?cacGZ3Ce3s3ZNJO1bGVFuUl926rzsmiGtj5ExMGT1tKDgaTQmtxIOIOFRm?=
 =?iso-8859-1?Q?9UX/NpihAVX97u/6iF+jirn0KnoQK+TZxVQxps9FK4oZFIeskLMfxZxxd8?=
 =?iso-8859-1?Q?jtDU2ntzhG7/EAirm3Zv7e9Q1T1qjyGdISKMUsGorvsrtfk09LVwaTX0e4?=
 =?iso-8859-1?Q?AJrWb47qcCRVV1lL7CKKkDFGda+19BtspQl4t9r/XLOXeEC3OhSTj4zoEf?=
 =?iso-8859-1?Q?q2kNzCelSwajfpqSk62YyaW0vdXyQg3DWvlE8siD7dGMV7Cktv/qYHkwzu?=
 =?iso-8859-1?Q?a+8DgfZZZexWKbFUWdurreSLVWjaR6mE5N9cfKo2LJxgvOk6GHHDVY2J2F?=
 =?iso-8859-1?Q?G99pcIgaFRGlCFfySDxWqRmdOdzPVxTnFDeWz0LSH1Dtns0OoF929ftNol?=
 =?iso-8859-1?Q?63Z66IcEH89t/sI9QBj52lC7ZjtPPElpBSa8jTlfgjBWOkPDOfpFrLpCkE?=
 =?iso-8859-1?Q?TY0rHsOrrbe/GY6xO5MDzyrljuQcrn/tL/as61+rf9AdQXrTbh9tAjvekn?=
 =?iso-8859-1?Q?l52hoa7phkPm3AgCOjjyHhY1rRUVUHAlkcc//DFjlYbTzs6wM3toQ8K6rv?=
 =?iso-8859-1?Q?c8teURWIzzPNeV7FfHl58+oVQkUwn+cDRjFS4w31DZb8ldlVHuMJJFf8IV?=
 =?iso-8859-1?Q?LGKerw4ee9Gpg6h6HAMrbOXoKJOW+xZMNqvIvTAJCcRmPMigNNOyCMCOSF?=
 =?iso-8859-1?Q?pwGicZt5gPuH6mlS27ldwe+/vZv4K5WNWOKaG34EJYMZN7mH3WybATzj1s?=
 =?iso-8859-1?Q?9x+WrYo7GsTEIKBJ48xERTDc6686JHFRApAExgOzNlLir8YRl4hD979td7?=
 =?iso-8859-1?Q?Yr+EMNowIZI9eQwEaiG4d0SgnRPrbKi9OkMVfQp+zL3Szk1xlX4VOX1SMV?=
 =?iso-8859-1?Q?CWare4RcBTots/DA/Bpnn3y6oz7vi5ANP0ewyVFPzDroml27kDzLrxHVWr?=
 =?iso-8859-1?Q?jgb/1zOi4GSqt32QOIz5puTY5mcXwc0KIhJQUP3jLp0vvhhRGHSnJI/cKC?=
 =?iso-8859-1?Q?NjZG3SohbGjYbzpwaQ67TyAZXFSiiH/6Cc54OFYvSF/ztCF00BjSplQTqB?=
 =?iso-8859-1?Q?kM1zkAk2+VAk7Wdffiu8bPXm1OO9wZFrMCwK4+p/2bzDc0MFs/bGWewh4v?=
 =?iso-8859-1?Q?0JKFrvURUD22HMlQopHJWrUFHlNZB5ltfQPFIOl++yAiRNjEQ3GYY0ljYA?=
 =?iso-8859-1?Q?O1yiAlXCgdoTI4kcboQvEbGpLpZSKcUqG6HXK1AFfpQ2gu9Oxem7/IRaq5?=
 =?iso-8859-1?Q?BbBuBYDDqhzqWombgyurkG0qFeRDtoa3TZryxa460pujHif0AVQpAcWXKp?=
 =?iso-8859-1?Q?06OjPD2QzWVg0vDpfelnT3AlL0BgYsVl9WeKofDxpzv82bmNgguhwsYG8i?=
 =?iso-8859-1?Q?OcpXQvfV1RnfgxKNYyHeNDT+4gn1sTtjkTUtJ53jFzqaSI+onMKxMysp8f?=
 =?iso-8859-1?Q?X7x0hFUEGrE51mWzVxvgZ1j5dh4SohrnSSLYwCNLwPlyk0wcb12xH5zU02?=
 =?iso-8859-1?Q?VMxNDVnMVihdmab9Biwj+k6EPxAlPnD2zc3zFJDZAzdaOar2/sCTES/24m?=
 =?iso-8859-1?Q?gvJqCaKizjjsP6lQtJ67S0asYoSyD8lBJCF1EI1KKlilOs1gF0tLTWBBfp?=
 =?iso-8859-1?Q?hLl39M7ZOWBCuxOgP8JSjGNbfJ43e5obM3ykbM9zIak2uG2bzwCEkWFt7q?=
 =?iso-8859-1?Q?k146cbIJjQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: cOsoAGbJ4mDkOOA/Bx9FsCZBD8jth4h484HuE4/eaXDbJitTNAPWa2MHh6/lc2farTs689Fuga5P305DNKeP6UzofdR3Y0vM7lvyWXzlr9bkw71rdZdUNhaJggSoe1PDp5yQFjow9bytbNYN071jGJWrO5soM27HQHIeAZaN6vC/4R1GCg0MVmgcDtGVLWVOL//z2V3JanLp1KFIs3NYhSzjXZVSBHWQb3XRinp8KEKViBTYzgtvqlzU8UfklgMtZMwaCPeJ/xobRX6eWPkkOrAZQKZvhSqEPAjEyKftxkF0gF+yBeL9P5NGP0pyNL5Hu8Zxr27d6J6qPBH9WwoVdg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 93a11430-5e0a-4bed-46a1-08deec17b7ec
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 19:46:14.9340 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: opzYFzLL36sQqEOFv5qvvYpiD9bFvNs7Ut4Gv7LUJCGIihzirdH4apukFwdDAYDbxXvl68B2/n6LW7vleopEqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9723
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Jul 27, 2026 at 12:21:00PM -0700, Matthew Brost wrote:
> On Mon, Jul 27, 2026 at 06:41:22PM +0200, Francois Dugast wrote:
> > On Fri, Jul 24, 2026 at 04:25:52PM -0700, Matthew Brost wrote:
> > > The migrate_vma_* functions are very CPU-intensive; as a result,
> > > prefetching SVM ranges is limited by CPU performance rather than paging
> > > copy engine bandwidth. To accelerate SVM range prefetching, the step
> > > that calls migrate_vma_* is now threaded. A dedicated prefetch
> > > workqueue is used for threading so prefetch work is never mixed with
> > > page fault or garbage collector work.
> > > 
> > > Running xe_exec_system_allocator --r prefetch-benchmark, which tests
> > > 64MB prefetches, shows an increase from ~4.35 GB/s to 12.25 GB/s with
> > > this patch on drm-tip. Enabling high SLPC further increases throughput
> > > to ~15.25 GB/s, and combining SLPC with ULLS raises it to ~16 GB/s. Both
> > > of these optimizations are upcoming.
> > > 
> > > Since the dedicated prefetch workqueue is not shared with page fault
> > > or SVM garbage collector work, page fault servicing and garbage
> > > collection can keep using a plain down_read() on vm->lock: there is no
> > > risk of a blocked reader starving a worker that a pending writer is
> > > waiting to flush, because that flushing is now confined to the
> > > separate prefetch workqueue.
> > > 
> > > v2:
> > >  - Use dedicated prefetch workqueue
> > >  - Pick dedicated prefetch thread count based on profiling
> > >  - Skip threaded prefetch for only 1 range or if prefetching to SRAM
> > >  - Fully tested
> > > v3:
> > >  - Use page fault work queue
> > > v4:
> > >  - Go back to a dedicated prefetch workqueue (usm.prefetch_wq) rather
> > >    than reusing the page fault workqueue (usm.pagefault_wq), so
> > >    threaded prefetches and page fault / garbage collector work no
> > >    longer contend for the same workqueue. This removes the need for
> > >    down_read_trylock() based lock avoidance in the page fault and
> > >    garbage collector paths.
> > > 
> > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > Co-authored-by: Copilot <223556219+Copilot@users.noreply.github.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_device_types.h |   6 +-
> > >  drivers/gpu/drm/xe/xe_pagefault.c    |  29 ++++--
> > >  drivers/gpu/drm/xe/xe_svm.c          |   8 +-
> > >  drivers/gpu/drm/xe/xe_svm.h          |   6 +-
> > >  drivers/gpu/drm/xe/xe_vm.c           | 147 ++++++++++++++++++++-------
> > >  drivers/gpu/drm/xe/xe_vm_types.h     |  15 +--
> > >  6 files changed, 154 insertions(+), 57 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > > index b8d1726c0513..159ee16ee6d5 100644
> > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > @@ -307,8 +307,10 @@ struct xe_device {
> > >  		u32 current_pf_queue;
> > >  		/** @usm.lock: protects UM state */
> > >  		struct rw_semaphore lock;
> > > -		/** @usm.pf_wq: page fault work queue, unbound, high priority */
> > > -		struct workqueue_struct *pf_wq;
> > > +		/** @usm.pagefault_wq: page fault work queue, unbound, high priority */
> > > +		struct workqueue_struct *pagefault_wq;
> > > +		/** @usm.prefetch_wq: threaded prefetch work queue, unbound */
> > > +		struct workqueue_struct *prefetch_wq;
> > >  		/*
> > >  		 * We pick 4 here because, in the current implementation, it
> > >  		 * yields the best bandwidth utilization of the kernel paging
> > > diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> > > index 80196e874e06..fd7ef0718153 100644
> > > --- a/drivers/gpu/drm/xe/xe_pagefault.c
> > > +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> > > @@ -303,8 +303,8 @@ static void xe_pagefault_queue_work(struct work_struct *w)
> > >  
> > >  		err = xe_pagefault_service(&pf);
> > >  		if (err) {
> > > -			xe_pagefault_save_to_vm(gt_to_xe(pf.gt), &pf);
> > >  			if (!(pf.consumer.access_type & XE_PAGEFAULT_ACCESS_PREFETCH)) {
> > > +				xe_pagefault_save_to_vm(gt_to_xe(pf.gt), &pf);
> > >  				xe_pagefault_print(&pf);
> > >  				xe_gt_info(pf.gt, "Fault response: Unsuccessful %pe\n",
> > >  					   ERR_PTR(err));
> > > @@ -318,7 +318,7 @@ static void xe_pagefault_queue_work(struct work_struct *w)
> > >  		pf.producer.ops->ack_fault(&pf, err);
> > >  
> > >  		if (time_after(jiffies, threshold)) {
> > > -			queue_work(gt_to_xe(pf.gt)->usm.pf_wq, w);
> > > +			queue_work(gt_to_xe(pf.gt)->usm.pagefault_wq, w);
> > >  			break;
> > >  		}
> > >  	}
> > > @@ -376,7 +376,8 @@ static void xe_pagefault_fini(void *arg)
> > >  {
> > >  	struct xe_device *xe = arg;
> > >  
> > > -	destroy_workqueue(xe->usm.pf_wq);
> > > +	destroy_workqueue(xe->usm.prefetch_wq);
> > > +	destroy_workqueue(xe->usm.pagefault_wq);
> > >  }
> > >  
> > >  /**
> > > @@ -394,12 +395,20 @@ int xe_pagefault_init(struct xe_device *xe)
> > >  	if (!xe->info.has_usm)
> > >  		return 0;
> > >  
> > > -	xe->usm.pf_wq = alloc_workqueue("xe_page_fault_work_queue",
> > > -					WQ_UNBOUND | WQ_HIGHPRI,
> > > -					XE_PAGEFAULT_QUEUE_COUNT);
> > > -	if (!xe->usm.pf_wq)
> > > +	xe->usm.pagefault_wq = alloc_workqueue("xe_page_fault_work_queue",
> > > +					       WQ_UNBOUND | WQ_HIGHPRI,
> > > +					       XE_PAGEFAULT_QUEUE_COUNT);
> > > +	if (!xe->usm.pagefault_wq)
> > >  		return -ENOMEM;
> > >  
> > > +	xe->usm.prefetch_wq = alloc_workqueue("xe_prefetch_work_queue",
> > > +					      WQ_UNBOUND,
> > > +					      XE_PAGEFAULT_QUEUE_COUNT);
> > > +	if (!xe->usm.prefetch_wq) {
> > > +		err = -ENOMEM;
> > > +		goto err_pagefault_wq;
> > > +	}
> > > +
> > >  	for (i = 0; i < XE_PAGEFAULT_QUEUE_COUNT; ++i) {
> > >  		err = xe_pagefault_queue_init(xe, xe->usm.pf_queue + i);
> > >  		if (err)
> > > @@ -409,7 +418,9 @@ int xe_pagefault_init(struct xe_device *xe)
> > >  	return devm_add_action_or_reset(xe->drm.dev, xe_pagefault_fini, xe);
> > >  
> > >  err_out:
> > > -	destroy_workqueue(xe->usm.pf_wq);
> > > +	destroy_workqueue(xe->usm.prefetch_wq);
> > > +err_pagefault_wq:
> > > +	destroy_workqueue(xe->usm.pagefault_wq);
> > >  	return err;
> > >  }
> > >  
> > > @@ -495,7 +506,7 @@ int xe_pagefault_handler(struct xe_device *xe, struct xe_pagefault *pf)
> > >  		memcpy(pf_queue->data + pf_queue->head, pf, sizeof(*pf));
> > >  		pf_queue->head = (pf_queue->head + xe_pagefault_entry_size()) %
> > >  			pf_queue->size;
> > > -		queue_work(xe->usm.pf_wq, &pf_queue->worker);
> > > +		queue_work(xe->usm.pagefault_wq, &pf_queue->worker);
> > >  	} else {
> > >  		drm_warn(&xe->drm,
> > >  			 "PageFault Queue (%d) full, shouldn't be possible\n",
> > > diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> > > index cc36addb4f4f..6a470a02fee7 100644
> > > --- a/drivers/gpu/drm/xe/xe_svm.c
> > > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > > @@ -148,7 +148,7 @@ xe_svm_garbage_collector_add_range(struct xe_vm *vm, struct xe_svm_range *range,
> > >  			      &vm->svm.garbage_collector.range_list);
> > >  	spin_unlock(&vm->svm.garbage_collector.list_lock);
> > >  
> > > -	queue_work(xe->usm.pf_wq, &vm->svm.garbage_collector.work);
> > > +	queue_work(xe->usm.pagefault_wq, &vm->svm.garbage_collector.work);
> > >  }
> > >  
> > >  static void xe_svm_tlb_inval_count_stats_incr(struct xe_gt *gt)
> > > @@ -1051,6 +1051,7 @@ void xe_svm_range_migrate_to_smem(struct xe_vm *vm, struct xe_svm_range *range)
> > >   * @tile_mask: Mask representing the tiles to be checked
> > >   * @dpagemap: if !%NULL, the range is expected to be present
> > >   * in device memory identified by this parameter.
> > > + * @valid_pages: Pages are valid, result written back to caller
> > >   *
> > >   * The xe_svm_range_validate() function checks if a range is
> > >   * valid and located in the desired memory region.
> > > @@ -1059,7 +1060,8 @@ void xe_svm_range_migrate_to_smem(struct xe_vm *vm, struct xe_svm_range *range)
> > >   */
> > >  bool xe_svm_range_validate(struct xe_vm *vm,
> > >  			   struct xe_svm_range *range,
> > > -			   u8 tile_mask, const struct drm_pagemap *dpagemap)
> > > +			   u8 tile_mask, const struct drm_pagemap *dpagemap,
> > > +			   bool *valid_pages)
> > >  {
> > >  	bool ret;
> > >  
> > > @@ -1071,6 +1073,8 @@ bool xe_svm_range_validate(struct xe_vm *vm,
> > >  	else
> > >  		ret = ret && !range->pages.dpagemap;
> > >  
> > > +	*valid_pages = xe_svm_range_pages_valid(range);
> > > +
> > >  	xe_svm_notifier_unlock(vm);
> > >  
> > >  	return ret;
> > > diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> > > index 0d1f1107af5f..46be2e5c6f7f 100644
> > > --- a/drivers/gpu/drm/xe/xe_svm.h
> > > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > > @@ -134,7 +134,8 @@ void xe_svm_range_migrate_to_smem(struct xe_vm *vm, struct xe_svm_range *range);
> > >  
> > >  bool xe_svm_range_validate(struct xe_vm *vm,
> > >  			   struct xe_svm_range *range,
> > > -			   u8 tile_mask, const struct drm_pagemap *dpagemap);
> > > +			   u8 tile_mask, const struct drm_pagemap *dpagemap,
> > > +			   bool *valid_pages);
> > >  
> > >  u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 addr, u64 end,  struct xe_vma *vma);
> > >  
> > > @@ -376,7 +377,8 @@ void xe_svm_range_migrate_to_smem(struct xe_vm *vm, struct xe_svm_range *range)
> > >  static inline
> > >  bool xe_svm_range_validate(struct xe_vm *vm,
> > >  			   struct xe_svm_range *range,
> > > -			   u8 tile_mask, bool devmem_preferred)
> > > +			   u8 tile_mask, const struct drm_pagemap *dpagemap,
> > > +			   bool *valid_pages)
> > >  {
> > >  	return false;
> > >  }
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > index d7e6644df4bc..7eed38b78e5f 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -2525,6 +2525,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
> > >  			struct drm_pagemap *dpagemap = NULL;
> > >  			u8 id, tile_mask = 0;
> > >  			u32 i;
> > > +			bool valid_pages;
> > >  
> > >  			if (xe_vma_is_userptr(vma))
> > >  				vops->flags |= XE_VMA_OPS_FLAG_MODIFIES_GPUVA;
> > > @@ -2569,9 +2570,11 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
> > >  				goto unwind_prefetch_ops;
> > >  			}
> > >  
> > > -			if (xe_svm_range_validate(vm, svm_range, tile_mask, dpagemap)) {
> > > +			if (xe_svm_range_validate(vm, svm_range, tile_mask,
> > > +						  dpagemap, &valid_pages)) {
> > >  				xe_svm_range_debug(svm_range, "PREFETCH - RANGE IS VALID");
> > >  				xe_svm_range_put(svm_range);
> > > +				xe_assert(vm->xe, valid_pages);
> > >  				goto check_next_range;
> > >  			}
> > >  
> > > @@ -2586,6 +2589,8 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
> > >  
> > >  			op->prefetch_range.ranges_count++;
> > >  			vops->flags |= XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH;
> > > +			if (valid_pages)
> > > +				vops->flags |= XE_VMA_OPS_FLAG_HAS_SVM_VALID_RANGE;
> > >  			xe_svm_range_debug(svm_range, "PREFETCH - RANGE CREATED");
> > >  check_next_range:
> > >  			if (range_end > xe_svm_range_end(svm_range) &&
> > > @@ -3151,16 +3156,80 @@ static int check_ufence(struct xe_vma *vma)
> > >  	return 0;
> > >  }
> > >  
> > > -static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
> > > +struct prefetch_thread {
> > > +	struct work_struct work;
> > > +	struct drm_gpusvm_ctx *ctx;
> > > +	struct xe_vma *vma;
> > > +	struct xe_svm_range *svm_range;
> > > +	struct drm_pagemap *dpagemap;
> > > +	int err;
> > > +};
> > > +
> > > +static void prefetch_thread_func(struct prefetch_thread *thread)
> > > +{
> > > +	struct xe_vma *vma = thread->vma;
> > > +	struct xe_vm *vm = xe_vma_vm(vma);
> > > +	struct xe_svm_range *svm_range = thread->svm_range;
> > > +	struct drm_pagemap *dpagemap = thread->dpagemap;
> > > +	int err = 0;
> > > +
> > > +	guard(mutex)(&svm_range->lock);
> > > +
> > > +	if (xe_svm_range_is_removed(svm_range))
> > > +		return;
> > > +
> > > +	if (!dpagemap)
> > > +		xe_svm_range_migrate_to_smem(vm, svm_range);
> > > +
> > > +	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)) {
> > > +		drm_dbg(&vm->xe->drm,
> > > +			"Prefetch pagemap is %s start 0x%016lx end 0x%016lx\n",
> > > +			dpagemap ? dpagemap->drm->unique : "system",
> > > +			xe_svm_range_start(svm_range), xe_svm_range_end(svm_range));
> > > +	}
> > > +
> > > +	if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, dpagemap)) {
> > > +		err = xe_svm_alloc_vram(svm_range, thread->ctx, dpagemap);
> > > +		if (err) {
> > > +			drm_dbg(&vm->xe->drm, "VRAM allocation failed, retry from userspace, asid=%u, gpusvm=%p, errno=%pe\n",
> > > +				vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> > > +			return;
> > 
> > We should set the error code like below with
> > 
> >     thread->err = err;
> > 
> > to propagate the error to user space.
> 
> So this was part an error handling fix - here this error occurs most
> likely from racing CPU access and you don't want the error to be sent
> back to user space, rather just don't commit the prefetch bind for the
> affected range(s). Later in the pipeline should handle this but it
> actually is 100% right there either as it will return -EAGAIN (retry,
> possible livelock) or -ENODATA (squashes error in IOCTL, possible leak
> in memory). Let me try fixing this part a bit better in a seperate patch
> but this is all pre-existing issues actually so I don't think it worth
> holding up the series.
> 

Actually a partial commit while it would ideal, creates another set of
problems too. Let me revert this to returning an sential error like the
previous -ENODATA behavior which is unwind safe though.

Matt

> Matt
> 
> > 
> > Rest LGTM.
> > 
> > Francois
> > 
> > > +		}
> > > +		xe_svm_range_debug(svm_range, "PREFETCH - RANGE MIGRATED TO VRAM");
> > > +	}
> > > +
> > > +	err = xe_svm_range_get_pages(vm, svm_range, thread->ctx);
> > > +	if (err) {
> > > +		drm_dbg(&vm->xe->drm, "Get pages failed, asid=%u, gpusvm=%p, errno=%pe\n",
> > > +			vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> > > +		if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM)
> > > +			err = 0;
> > > +		thread->err = err;
> > > +		return;
> > > +	}
> > > +	xe_svm_range_debug(svm_range, "PREFETCH - RANGE GET PAGES DONE");
> > > +}
> > > +
> > > +static void prefetch_work_func(struct work_struct *w)
> > > +{
> > > +	struct prefetch_thread *thread =
> > > +		container_of(w, struct prefetch_thread, work);
> > > +
> > > +	prefetch_thread_func(thread);
> > > +}
> > > +
> > > +static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_ops *vops,
> > > +			   struct xe_vma_op *op)
> > >  {
> > >  	bool devmem_possible = IS_DGFX(vm->xe) && IS_ENABLED(CONFIG_DRM_XE_PAGEMAP);
> > >  	struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
> > >  	struct drm_pagemap *dpagemap = op->prefetch_range.dpagemap;
> > > -	int err = 0;
> > > -
> > >  	struct xe_svm_range *svm_range;
> > >  	struct drm_gpusvm_ctx ctx = {};
> > > +	struct prefetch_thread stack_thread, *thread, *prefetches;
> > >  	unsigned long i;
> > > +	int err = 0, idx = 0;
> > > +	bool skip_threads;
> > >  
> > >  	if (!xe_vma_is_cpu_addr_mirror(vma))
> > >  		return 0;
> > > @@ -3170,42 +3239,49 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
> > >  	ctx.check_pages_threshold = devmem_possible ? SZ_64K : 0;
> > >  	ctx.device_private_page_owner = xe_svm_private_page_owner(vm, !dpagemap);
> > >  
> > > -	/* TODO: Threading the migration */
> > > -	xa_for_each(&op->prefetch_range.range, i, svm_range) {
> > > -		guard(mutex)(&svm_range->lock);
> > > -
> > > -		if (xe_svm_range_is_removed(svm_range))
> > > -			continue;
> > > +	skip_threads =  op->prefetch_range.ranges_count == 1 ||
> > > +		(!dpagemap && !(vops->flags &
> > > +				XE_VMA_OPS_FLAG_HAS_SVM_VALID_RANGE)) ||
> > > +		!(vops->flags & XE_VMA_OPS_FLAG_DOWNGRADE_LOCK);
> > > +	thread = skip_threads ? &stack_thread : NULL;
> > >  
> > > -		if (!dpagemap)
> > > -			xe_svm_range_migrate_to_smem(vm, svm_range);
> > > +	if (!skip_threads) {
> > > +		prefetches = kvmalloc_array(op->prefetch_range.ranges_count,
> > > +					    sizeof(*prefetches), GFP_KERNEL);
> > > +		if (!prefetches)
> > > +			return -ENOMEM;
> > > +	}
> > >  
> > > -		if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)) {
> > > -			drm_dbg(&vm->xe->drm,
> > > -				"Prefetch pagemap is %s start 0x%016lx end 0x%016lx\n",
> > > -				dpagemap ? dpagemap->drm->unique : "system",
> > > -				xe_svm_range_start(svm_range), xe_svm_range_end(svm_range));
> > > +	xa_for_each(&op->prefetch_range.range, i, svm_range) {
> > > +		if (!skip_threads) {
> > > +			thread = prefetches + idx++;
> > > +			INIT_WORK(&thread->work, prefetch_work_func);
> > >  		}
> > >  
> > > -		if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, dpagemap)) {
> > > -			err = xe_svm_alloc_vram(svm_range, &ctx, dpagemap);
> > > -			if (err) {
> > > -				drm_dbg(&vm->xe->drm, "VRAM allocation failed, retry from userspace, asid=%u, gpusvm=%p, errno=%pe\n",
> > > -					vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> > > -				return -ENODATA;
> > > -			}
> > > -			xe_svm_range_debug(svm_range, "PREFETCH - RANGE MIGRATED TO VRAM");
> > > +		thread->ctx = &ctx;
> > > +		thread->vma = vma;
> > > +		thread->svm_range = svm_range;
> > > +		thread->dpagemap = dpagemap;
> > > +		thread->err = 0;
> > > +
> > > +		if (skip_threads) {
> > > +			prefetch_thread_func(thread);
> > > +			if (thread->err)
> > > +				return thread->err;
> > > +		} else {
> > > +			queue_work(vm->xe->usm.prefetch_wq, &thread->work);
> > >  		}
> > > +	}
> > >  
> > > -		err = xe_svm_range_get_pages(vm, svm_range, &ctx);
> > > -		if (err) {
> > > -			drm_dbg(&vm->xe->drm, "Get pages failed, asid=%u, gpusvm=%p, errno=%pe\n",
> > > -				vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> > > -			if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM)
> > > -				err = -ENODATA;
> > > -			return err;
> > > +	if (!skip_threads) {
> > > +		for (i = 0; i < idx; ++i) {
> > > +			thread = prefetches + i;
> > > +
> > > +			flush_work(&thread->work);
> > > +			if (thread->err && !err)
> > > +				err = thread->err;
> > >  		}
> > > -		xe_svm_range_debug(svm_range, "PREFETCH - RANGE GET PAGES DONE");
> > > +		kvfree(prefetches);
> > >  	}
> > >  
> > >  	return err;
> > > @@ -3336,7 +3412,8 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
> > >  	return err;
> > >  }
> > >  
> > > -static int vm_bind_ioctl_ops_prefetch_ranges(struct xe_vm *vm, struct xe_vma_ops *vops)
> > > +static int vm_bind_ioctl_ops_prefetch_ranges(struct xe_vm *vm,
> > > +					     struct xe_vma_ops *vops)
> > >  {
> > >  	struct xe_vma_op *op;
> > >  	int err;
> > > @@ -3346,7 +3423,7 @@ static int vm_bind_ioctl_ops_prefetch_ranges(struct xe_vm *vm, struct xe_vma_ops
> > >  
> > >  	list_for_each_entry(op, &vops->list, link) {
> > >  		if (op->base.op  == DRM_GPUVA_OP_PREFETCH) {
> > > -			err = prefetch_ranges(vm, op);
> > > +			err = prefetch_ranges(vm, vops, op);
> > >  			if (err)
> > >  				return err;
> > >  		}
> > > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> > > index 2f5f74fed9d2..68588b624212 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > > @@ -556,13 +556,14 @@ struct xe_vma_ops {
> > >  	/** @pt_update_ops: page table update operations */
> > >  	struct xe_vm_pgtable_update_ops pt_update_ops[XE_MAX_TILES_PER_DEVICE];
> > >  	/** @flag: signify the properties within xe_vma_ops*/
> > > -#define XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH BIT(0)
> > > -#define XE_VMA_OPS_FLAG_MADVISE          BIT(1)
> > > -#define XE_VMA_OPS_ARRAY_OF_BINDS	 BIT(2)
> > > -#define XE_VMA_OPS_FLAG_SKIP_TLB_WAIT	 BIT(3)
> > > -#define XE_VMA_OPS_FLAG_ALLOW_SVM_UNMAP  BIT(4)
> > > -#define XE_VMA_OPS_FLAG_MODIFIES_GPUVA	 BIT(5)
> > > -#define XE_VMA_OPS_FLAG_DOWNGRADE_LOCK	 BIT(6)
> > > +#define XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH	BIT(0)
> > > +#define XE_VMA_OPS_FLAG_MADVISE			BIT(1)
> > > +#define XE_VMA_OPS_ARRAY_OF_BINDS		BIT(2)
> > > +#define XE_VMA_OPS_FLAG_SKIP_TLB_WAIT		BIT(3)
> > > +#define XE_VMA_OPS_FLAG_ALLOW_SVM_UNMAP		BIT(4)
> > > +#define XE_VMA_OPS_FLAG_MODIFIES_GPUVA		BIT(5)
> > > +#define XE_VMA_OPS_FLAG_DOWNGRADE_LOCK		BIT(6)
> > > +#define XE_VMA_OPS_FLAG_HAS_SVM_VALID_RANGE	BIT(7)
> > >  	u32 flags;
> > >  #ifdef TEST_VM_OPS_ERROR
> > >  	/** @inject_error: inject error to test error handling */
> > > -- 
> > > 2.34.1
> > > 

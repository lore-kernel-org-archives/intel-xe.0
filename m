Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70AA4C5DF7D
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 12:59:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C73710EB47;
	Tue, 18 Aug 2026 12:59:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MVY5scxI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB7A310EB47
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Aug 2026 12:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787057998; x=1818593998;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2nCZhFZnAVsppNYCwLIl7ngNUMEABfES27Ugiguh5ns=;
 b=MVY5scxIjlqXsujNQyX03UoPVfSsn1GyZP2cETr/psrn7chfkR/IAV0l
 mCK2zp1nTuTxxMxMkCCLevyF6CFCePYspXO8oUzAvBgSdIJ1ReaLTuTjC
 cjyvQKt26qFO8Pm6RzG/b60WxptJxCXXvepkD86Bb85BDJzbQy/N6XZc5
 glCybCkMVD1WZJhEHaWpmcKI2aeLu+XE61l4AJw3jgJf2m8FU/X/JBCRD
 b2wXeSO6O3nV1V/QcV7YMKwOs3a+V6rqD9Z8VUNYP1PWqFJxFBa96JQRg
 1hyY4JVXKTHCaWvxki9e10VOed7Dsz7VaEUy2HA2noeXyTrNuy1WUhg41 Q==;
X-CSE-ConnectionGUID: pvoycYRbQl2LbzzlNf1iMw==
X-CSE-MsgGUID: rRsCbMswT9i2a0XlKkeI5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="104930562"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="104930562"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 05:59:58 -0700
X-CSE-ConnectionGUID: 8KNWNQ3DQsuwcdAVn2I4vg==
X-CSE-MsgGUID: 2LbmM2RqQyqU9hN2fR4CMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="265831525"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 05:59:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 05:59:57 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 18 Aug 2026 05:59:57 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.1) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 05:59:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PvO8DA3UCYeR+oYju6Pzq+qYH8Lh90HWOPKEaVJ+dZn7HziP5P6SvktN76U567qCNaOX42XtSGdfjcDXAK90NH+ZpH5xL76aE+6WphvT4nPGWke5bA++jAXgx6lsuh6a6R5Xlfx6TyFLDkJ2KsTShthyRxJc5x43mTcLRrSC8Ict65hkk/ZjpCHFu1uwMrZmGldrlLy0gDRXGlbxj9vDI9nXmHzRsfzQNmQbKl00u1aYKfeRyMEF07fbu6vFUbwylf+z/AosT4gFfQ30nzxz6wY+QDx2/e44fnwQxag2gFLqOgsL1iDoWjPJ7Xd9FexpLbmyD/e2ov297R5Vm/71OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DHASGWvxXoX02pl+cbEQWuIoD0LmBQ3t6R4IkeVM9DI=;
 b=qEninCdikjiG4WhQrd4zOZjiKtQUFiTZr5N9NL9dCXrHvFS6N10cwYRjJJesHB1UFzyFyDB/0qZi77SYE1JwygxPZoYnXTgPLP50hPf9P5ECvWJKh7OgClh+FMYI+U2Wz9zxJZEbX5pStc/QzhMWLEiUxxG7xsQ7gacE0TUaGrVSdu4X25XpIhL6dQQX97s+dMA88yy8SqWJQD+PQkWSrxmfhl8vyGYeixgJp95PvkIhX/W/uYV4SEsBUVnr98YKWg9TOX5h+0nzHTG4A1kkbfbAeEvt3pSWEoHAH61nGBzfD8PR3yvHsPnA/Z5Izcxcr69c+kAo4SDO85/xCxM/fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7752.namprd11.prod.outlook.com (2603:10b6:208:442::20)
 by PH7PR11MB5863.namprd11.prod.outlook.com (2603:10b6:510:135::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 18 Aug
 2026 12:59:54 +0000
Received: from IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce]) by IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce%7]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 12:59:54 +0000
Date: Tue, 18 Aug 2026 08:59:50 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH V17 00/12] Add memory page offlining support
Message-ID: <aoRXRpXwjoRULfpG@intel.com>
References: <20260818104055.3833974-14-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260818104055.3833974-14-tejas.upadhyay@intel.com>
X-ClientProxiedBy: SJ0PR03CA0367.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::12) To IA0PR11MB7752.namprd11.prod.outlook.com
 (2603:10b6:208:442::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7752:EE_|PH7PR11MB5863:EE_
X-MS-Office365-Filtering-Correlation-Id: e68e0266-db38-4a69-ffac-08defd28991d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|6133799003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: YP9MTNBkkslNhMLiiK7PuwG7JocprWxXZBT1RKvIHutoo2bxsVYseN6yp2p13vrlPlSGfX5kcJuvVAP5CEKWasZybhVObJLJzCBAxCXMdmCdqZ0acDouJc+uRWknKdQiuQP2NqPQu2nrXJunAQYyawMFTzNV2qSxuDUdXMAtt516tYKdX2sc+fa0m9wlhAEux2pGyEH2B2t5G6Rb0BRpETMWkaaOaAlTmKBlJZdHEpPls97Yr1ulL1EHuQA835eIBwBHBnXd3gUNsB/Us4VXWs15lAtqqvwSgBQSqeqKKYLfJmPKUx3iq515sPU14zxfEjAVsxlW+/2ALlPRy/Ffvh94ijp1PcGgyuUxxcJfpHCMdP3jtjvChN+zI80vA1CYMTIdkzDHmb1IQGR3jIo/y0DKccSBr5IuQ7KnHnDQ94u/+UgfMEfwrJy3QKlMyIK6tWkh4AbJ2LJ75NaLP8ZRpxN2sr8lwgOosmLZA8k/3WqIZMBGimNF39pdVjkd91/YPQY/P7Sk4+Z2xin/+mKwnV0pMhAQ93VsSa8oSAngJtNRnEPZnCVbYo0uE1LEuaddjbYob662vNgzW5mU9X2Dxn7iLAZT2w1wGTxw6pqkhA0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7752.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wZXfMeBhFWt/qgs77GGYYKsWCB5Ma4WzYYBGz1fpj7lk7TCYY/5gYF73K5HJ?=
 =?us-ascii?Q?n2ib/04tBsKccSJ8AJFGCF6o5LTQA4Mbrd7prygv+5c2GQuqkcrqDDFltzQI?=
 =?us-ascii?Q?RLKg8SlVsE6zF1AaLO+h2nXsTjuzXAlmWPYLelv7Po0d1ryww/2nRc4Z3+CQ?=
 =?us-ascii?Q?LvQWDOVlI8fnf4d4JIfy9Vc6mMcDyA1/G61pN9q0W/CpOLYoeTR5Th1sfLyn?=
 =?us-ascii?Q?24aRiJzoxG/O7sup5fxuAEBQlPYgtfDdB593EgqEU6mUuEEpnC/lkH9IVG2x?=
 =?us-ascii?Q?tqadM+ha5IeS2CEbK2ILCRguH0WPh0j3SwHMz9y5tSOHvZyHP+rg+FlnLnDW?=
 =?us-ascii?Q?qIowQ4T7s8riQL7eYCI2oAGnroCxFOTAH43jEpbr6uvog4Vr313FBFgtQeE7?=
 =?us-ascii?Q?bgE/i37R9Xhf0kkan4CJYLRmToq8ixBLs5E9/v20qhxHtgNR+n1zi4wImwgl?=
 =?us-ascii?Q?0h5zrdohhATzgafvGkmo9faYaVXpMy7p7eyMqiQbIRr7hJSDdRZdj1rAH1gY?=
 =?us-ascii?Q?XhMh0KicZDOhuCecGp6qFhtTiLeMjAqCoR/cz9U883LFp7l/XCE6oxEPAe6N?=
 =?us-ascii?Q?zve5jAYB9a5TxzuJHWjCooIatf/064VZx/Lxn3J0IJ+PoQTTBUim6xz/D6Xn?=
 =?us-ascii?Q?bcA2oxlDDpoxwFwolbLhL+hGj8njhSNy1MCF07L3SdSS/PaIlIIaJYcOnEt8?=
 =?us-ascii?Q?C5Fkp0NTmQRw8B46yv4DPFPnpARLx/6JBDuEFoKvSuZ+CMx4RzSfJ4B2hXPf?=
 =?us-ascii?Q?2zv3xaq9Q2Uqmdj/8oW2RdKjT3GDYyf15Fk/cGWHzc0w6P03tDng0SJP38md?=
 =?us-ascii?Q?8gZSHwOWl/bSj6tpc0k/oEB7z0XOsmzWoiAzRJVdbzW1ZpJpXNXt9DGd2elR?=
 =?us-ascii?Q?Whl+0FsDhtyS4zauAHsvRxtGIA7oBCnR/ZYT+y2UhX0sCElD2U+O9xqCHWyc?=
 =?us-ascii?Q?w8vq/DMerKm0G+9TQ30ctC2nOTmvgGZYGVMg9lh4KRagZixK0kyiqWazdHuC?=
 =?us-ascii?Q?Cfv+9/5Z0IMgXNV632gajYPrT8+clg0Gwbr5JAisrOLuqSuD41rj1C5jE7D9?=
 =?us-ascii?Q?WoV5GQ710qppxNo+Bq/lShyxPBMeUGudabiFxBA3mcgfaINtwktxd0Ztu9Iy?=
 =?us-ascii?Q?3u4y+J0VeS5WoCeZY4dZBdsXDpF45gh/irwiMUnRBdT3nZyUVmJlPJ4kdU6w?=
 =?us-ascii?Q?H+HNnkh6rHW0dtwAym0EbrGLQgZFK6yr/NILp6ACOj17EsDOrnMVht78PeE9?=
 =?us-ascii?Q?1FkfL8CftnhqOY8RwYpe1AwJNQujTIa36bpdvDme1WwTl0cJXtCJ0LyRGRRa?=
 =?us-ascii?Q?Njs9f+m0qFX136b3nUZLpd0oPSBT/hauPXQa8KdofQCwI0I41Nqdol5uAMSS?=
 =?us-ascii?Q?2dycvZIXxUQFx/NLkzImJ2iAsHdwVOJ5KnEL7Kos/iB6ZHbl0ZI0/nEPGJu3?=
 =?us-ascii?Q?Xq55qnVupK6Ox4BlCLPyxj0/RBZjPzdkk0W13jhpEqer2YMyZQpsOmHtr6tX?=
 =?us-ascii?Q?fywQXPM6Y8Y423bklN2a4FwUFHDbLgfqUk/Kil0idDDpLdra7FGDPvsEU+Mb?=
 =?us-ascii?Q?+JnhQZC/rxfYM2FznBZ61zWxvBs7Up/Rc6mCkPoDvzoepjI3+ZhB9H1L6QWb?=
 =?us-ascii?Q?lKp6Awhc+GzcI1XrMoja+ffDT718ViJxQuZTe1k5njk3mC7VuJNrd6kpFVAy?=
 =?us-ascii?Q?a8aGhKOwhLVrNqM1Naw6Q3tL9rJlLLH63eG66ZtvqU0necK0DBV7Xvz/AfU0?=
 =?us-ascii?Q?IoUO+rUD7w=3D=3D?=
X-Exchange-RoutingPolicyChecked: H7FqBYP3xrDAHPFl/jU3Tugi2HhKURCMBlLT6YYsEE7U/Qlxgtd8Daub/1wJGXLSV/YsJGnUaYJdzi0u61a9V05KpdQijtfCpTtaGfVs85dVigURfw8bkDUELvKap0rz19IX4FmmYLJafs6oUkKsMbV3dWXTUWaJTxaLYanYgFLKyhMCGeH5jtPs/4DfEWqNYN//EZmIcrvpmbrkDmdA5r7WjEBO7+0+E2SPvk7057VpH1bnHcaVRti4FZVT60EXHEYUGuV5rA9tNXRgsvl87odjMu31zKWiJMw8oRDcfyFnyKHPQy3V/CjIxrch0p8q7X7pN1YzTGAH+E8aa5cVig==
X-MS-Exchange-CrossTenant-Network-Message-Id: e68e0266-db38-4a69-ffac-08defd28991d
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7752.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 12:59:54.6709 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4jdP/1lEAXxjik42Lc6QvbQrNvV0tF4WHIFD5oXAuJK1ZmgCV2oXT1DNRJCs095ojSiIZSVoIWp9buOVXkEQrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5863
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

On Tue, Aug 18, 2026 at 04:10:55PM +0530, Tejas Upadhyay wrote:
> This functionality represents a significant step in making
> the xe driver gracefully handle hardware memory degradation.
> By integrating with the DRM Buddy allocator, the driver
> can permanently "carve out" faulty memory so it isn't reused
> by subsequent allocations.
> 
> IGT tests for testing this via injecting simple single address and
> duplicate address fault to unit test functionality:
> https://patchwork.freedesktop.org/patch/740601/
> 
> v17:
> - Rebase on drm-tip
> - Enforce CONFIG_FAULT_INJECTION_DEBUG_FS for fault inject

Please stop quickly spinning revisions. That may be counter intuitive,
but fast revision spins might delay the progress.

Also, please ensure that any blocker raised by reviewers in the
previous versions are addressed before sending a new one!

And, it is always a good practice to CC the people that engaged
in previous reviews. Trying to respin without cc'ing them and
without addressing the previous asks or blockers just sound
like you are trying to by-pass the review process.

This series has a big blocker and should not get merged anytime
in this current format. Please go back to the drawing board and
fix the documentation and sync with other components. This is
not getting merged.

Thanks,
Rodrigo.

> v16:
> - Correct sysfs patches with moving code with rcu lock
> - In case purge fail let next alloc decide final failure
> - Remove addr_to_block API, its being pulled from drm-tip
> - Remove some unused code and replace where existing API can be used
> v15:
> - Split few big patches into small
> - Avoid vram_mgr lock in sysfs
> - fix missing queue_pages counter increment
> v14:
> - Solve sashiko reviews
> - Remove SOFT->HARD offline patch, decision is taken based on -EEXIST
> - Dump gpu buddy allocated patch dropped
> v13:
> - Add fault inject and remove standlone debugfs
> v12:
> - Fix Sashiko review comments
> v11:
> - Add BAN reason for UMD to know about offlining
> - Add support for soft offline mode
> - Rebase and remove dummy lockdep annotation patch, as it merged from upstream
> v10:
> - Remove RFC
> v7:
> - Improve debugfs warning messages
> - Use scope_guard for locking(MattB)
> - Adapt addition of queue member of LRC BO(MattB)
> - Extend and use xe_ttm_bo_purge API for vram pages(MattB)
> - Handle dma_buf_map requests for native and remote(MattB)
> - Address if in never initialized block, set block to NULL
> - Add lockdep in gpu buddy (MattB)
> - Correct allocated_addr_to_block logic (MattA)
> V6:
> - Add more specific tests to noncritical bo sections
> - Handle smooth exit of user created exec queues
> - Break code and make purge specific static API
> V5:
> - Sysfs "max_pages" addition
> - Reset block->private NULL post purge
> - Remove wedge, return -EIO to system controller will initiate reset
> - Add debugfs tests to trigger different test scenarios manually and via igt
> - Rename addr_to_tbo to addr_to_block and move under gpu/buddy.c
> V4: API reworks, add configfs for policy reservation and apply config everywhere
> V3: use res_to_mem_region to avoid use of block->private (MattA)
> V2:
> - some fixes and clean up on errors
> - Added xe_vram_addr_to_region helper to avoid other use of block->private(MattB)
> 
> Tejas Upadhyay (12):
>   drm/xe: Link VRAM object with gpu buddy
>   drm/xe: Link LRC BO and its execution Queue
>   drm/xe: Extend BO purge to handle vram pages as well
>   drm/xe/bo: Make xe_bo_is_user() public
>   drm/xe: Guard teardown paths against purged BOs
>   drm/xe/vram: Extract buddy alloc and free helpers
>   drm/xe/vram: Add page offline data structures and lifecycle
>   drm/xe/vram: Add VRAM page offline fault handler
>   drm/xe/configfs: Add vram bad page reservation  policy
>   drm/xe: Add sysfs interface for bad gpu vram pages
>   drm/xe/uapi: Expose ban reason in EXEC_QUEUE_GET_PROPERTY_BAN
>   drm/xe: Add fault-inject based VRAM page offline injection
> 
>  drivers/gpu/drm/xe/xe_bo.c                 |  13 +-
>  drivers/gpu/drm/xe/xe_bo.h                 |   5 +-
>  drivers/gpu/drm/xe/xe_bo_types.h           |   3 +
>  drivers/gpu/drm/xe/xe_configfs.c           |  67 ++-
>  drivers/gpu/drm/xe/xe_configfs.h           |   2 +
>  drivers/gpu/drm/xe/xe_debugfs.c            |  49 ++
>  drivers/gpu/drm/xe/xe_debugfs.h            |   2 +
>  drivers/gpu/drm/xe/xe_device_sysfs.c       |   7 +
>  drivers/gpu/drm/xe/xe_dma_buf.c            |   3 +
>  drivers/gpu/drm/xe/xe_exec_queue.c         |  14 +-
>  drivers/gpu/drm/xe/xe_exec_queue_types.h   |   7 +-
>  drivers/gpu/drm/xe/xe_execlist.c           |   4 +-
>  drivers/gpu/drm/xe/xe_guc_submit.c         |  32 +-
>  drivers/gpu/drm/xe/xe_lrc.c                |   1 +
>  drivers/gpu/drm/xe/xe_pt.c                 |   5 +-
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 604 ++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.h       |   3 +
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |  40 ++
>  include/uapi/drm/xe_drm.h                  |  18 +-
>  19 files changed, 834 insertions(+), 45 deletions(-)
> 
> -- 
> 2.52.0
> 

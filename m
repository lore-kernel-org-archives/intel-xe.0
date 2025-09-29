Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14DECAC5B0
	for <intel-xe@archiver.kernel.org>; Mon, 29 Sep 2025 13:39:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6365810E424;
	Mon, 29 Sep 2025 13:39:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TzfrmB3/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E97110E424
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Sep 2025 13:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759153148; x=1790689148;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=16Zo2SNYqjKFQt5XcYsy5VMqDLxaQbdA9HHJON5yLuU=;
 b=TzfrmB3/yBkmGfG3rLXHDud/QpvKe4pZEovHhH2CuKyI7j77YSg6xHv2
 bOy4BcHnGgz0jpxkliEMi+cZ+zWXiJ6CPK/B8vQ66IWgYlLF0qW7vylL2
 T9HcpzqylYbRw6O+2logkDRWb7jH/3pNT+nFqv1BxTkjYICHnJYnSI1iR
 9h5+Cw2Nmm4EemrmHkxd3LRuq3EeQFaGCM4hZbcrCCqzmS4MMVGNcoCnw
 sYI9xl5n/f7aRWsXH2ZHpm08JlM69vNYT+BcPIosSg2KJU8vneFVgIzVO
 XxR/IxqVAZE9jXW/dqrX0ViAayvXpfftFsKtk0eDcCa8blYlX1TIzPbkD Q==;
X-CSE-ConnectionGUID: DzrSBo+LRs+a+2pNMDhabw==
X-CSE-MsgGUID: vqStV39kTpSiCgpMK+W8Ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="61503055"
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="61503055"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 06:39:08 -0700
X-CSE-ConnectionGUID: 6DTgMKhFR2yYHfaaOAU/EQ==
X-CSE-MsgGUID: 6Zc+hHTVRZ2717ShU+sl3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="178179555"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 06:39:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 06:39:07 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 06:39:07 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.35) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 06:39:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ANbgllJGfgY6ugOPOVHCAzhm7tBsaLZDR0kF6Q9FZ6loegQt5n//dhRLNmiXZb1+qaMj1X14q1rqADoDRKoYvGoxn3PNEcIKX1DdrolnRKE7z8mqdvE6bg+QyXjmTUzRLL9F/Ui/xz6oXWaYHCJU+KUu2jhUW7UQTLe4bA1ZGyyNA9mXOGBuf9IxwOh3WXgH3yqEEpVrYAjFnslb0xrMGTdGBRbT738YISxim2dWWlbqhDfv8aJZEZ3t0XC+o8MPeGmcHwCzESX5GXzs/mF6/dOXpVHUdwAghN5T2vqik9/SeSALi6qNRxMUF5XVMXFqgx/vzwQk5kVGdK7nvBX4Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SHLmwWU2I6Xdd9iwN76kMj9pBvqQ6yGLRrNi+2DoK9M=;
 b=XOtUqyzP8lCuiAa9V/hgPFQSEe8c0PvxVCyc9rMyaqX5yhuPX6VcoCbF8mM58NGrinWHYciE7SOUX3l1z+R3iW43ZP5sQStkHadgPvmyqojYS3yiHteSv53l/9s8v+3v2fa18ace1fgRtDe0eT4JprbGHsivcsR/h6U7fb7WaCLwohDm5sHiYFt+XLz+PW20JzBmjvPLnycVXBEyUQg3umRoby1I3pwCDS68v8khxBom29oU5Y1FzJJ6a+0rYCItcQPxQNpbmQK/74a6nkOBwmFGtKYmBVos8O4o0+tn4c4kDTLMx0eccM8a/o2gpKRsBG2NWurRWRiWRDM1Iy4+qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM6PR11MB4658.namprd11.prod.outlook.com (2603:10b6:5:28f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 13:38:58 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9160.014; Mon, 29 Sep 2025
 13:38:58 +0000
Date: Mon, 29 Sep 2025 06:38:54 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/bo: Fix an idle assertion for local bos
Message-ID: <aNqL7sD5WtV/6Lxk@lstrano-desk.jf.intel.com>
References: <20250929112649.6131-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250929112649.6131-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0156.namprd04.prod.outlook.com
 (2603:10b6:303:85::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM6PR11MB4658:EE_
X-MS-Office365-Filtering-Correlation-Id: f1c0b7cb-417c-4b64-5eb1-08ddff5d8a29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?wBuGJV2uFaGmJ5tgizBSd9uuY1pQSm5OcpGXwVVTqS3Z3clg2TKpXw96Ep?=
 =?iso-8859-1?Q?qUpioicBn1OPB3ghfZgHHaZzOmAbqhfjitXTNyl8bX3ZJMUZgBUY6jGUi6?=
 =?iso-8859-1?Q?P6Fu2ELy/cRIEsP22NvaEhCu2QUKQmLEz9jvN3zV88guznmysk5gc4T7uT?=
 =?iso-8859-1?Q?A9k7AKE/dqxjjrYK09wf0UHw15A3dInduKNEC5u/YLnkEw6YBJa+H6ln1B?=
 =?iso-8859-1?Q?BeqaDTizHhjFedTh2dtO58v+M9eVmJ+PnXK5lj71d7xVYpwtnS2pLL4ZA+?=
 =?iso-8859-1?Q?chtazcOeWEoZo2mXhT+sUPLu9d8bdvr9+DVqRXr0uipTjTJNofdQ/Au/d8?=
 =?iso-8859-1?Q?Fh5px+OVPQBYZagTaaiyUeDgUQMsFZdKiVqZFTBkpqB8zL5Z7kHFQVdWCJ?=
 =?iso-8859-1?Q?9aEAsMqvmyQk+HkxLyZWpzirzVMR8o7HI0zZ53oycQnMjT0dzrTyH+hdyN?=
 =?iso-8859-1?Q?F+l0wDLGdspADsTKrEyx0ZD3LURRhzPwWXop2Y/cHMcB08y3zlakwqkgt+?=
 =?iso-8859-1?Q?L9qm8zXbouYtDSnqM3Vtrrd6OQsm3pJG2ijfQK0nqaUeoldbYRtumG1BJz?=
 =?iso-8859-1?Q?DRjqkBXBbRVZlNKx10GkxPBfuQFJqOOCAiGNuts4qPxK5uLcn6rw30Qp/j?=
 =?iso-8859-1?Q?wj3JNiWQwfuuMw97bWyrpTwRv0n2pPtL4dK5yOJ9H3Q2uM0pZP6u6r2dvo?=
 =?iso-8859-1?Q?xhMBqmYNLTPgs0ff5LnDzLJIiUCojdMje/0a0RpcRiDMZvhwUOHju6lbBR?=
 =?iso-8859-1?Q?Bqwq5HyeRHoNSBlCf/UIvhAQQmtVpx/BlPwJT1AGIEDkGaI6+entjfh1Gz?=
 =?iso-8859-1?Q?DQ8TlnJb3CbzMKG+KQJoWHKL1hTtRDnZo92aBma2bh4v5Sdi0fz/9135Iv?=
 =?iso-8859-1?Q?PNYH7y7HlVvNhhvON3ZTYwS1S7B2kd68xxDVnvRQgXbbCOXH0qSMsSNGfI?=
 =?iso-8859-1?Q?pJokqpo5nDfUD8spnRfPygAFbsrG7to/+BWvHPnfcTGBiKwofiojtKgm4v?=
 =?iso-8859-1?Q?rvHiZaY9rgEtC4kDPRI3ske2XCJkQD2tVIc1HJdY3CVUp3ZiBf7EUD9sBb?=
 =?iso-8859-1?Q?9kasKezg40rIn0Hfelf+o7/9Cl5Y18eS3WhjI/XuIgiiKyFA0q3Lld4SnJ?=
 =?iso-8859-1?Q?agiGjEG3hro8Ck4HNWO21WA0fcWAhr4hbIvxDvqdOjGqa9FeBYdeibWvpI?=
 =?iso-8859-1?Q?MFRtdt9s6mkQ7DBhzOc/4DdMgbeLYlqMFIdkAGov9UIjwj2sATuanl0a5b?=
 =?iso-8859-1?Q?35a/nteue6+4Hr5i1q9NjDQfjTk1s5XGwUG9rP+TFSMzW9csWBKft5ZCjB?=
 =?iso-8859-1?Q?7j1s6WFbD50RjAjg+EvA4Si8zYIJm8/oR3rKw+sdHWHCDfozAHTz53DEsX?=
 =?iso-8859-1?Q?U27ILpyYNqVIOw2rMAYVX3YnIgageYF+BAh0JBbLe/DzKe9Ar0Ae7K/42d?=
 =?iso-8859-1?Q?nAu9aZKmFUGqxTKlYs2F99/VcEXm+CcwxJrgfrqRIZOiC1yy8WI0DaTfeP?=
 =?iso-8859-1?Q?aM/FYC5g5iDECX7aO/ikGt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?IPqeOHbkiEEXyfZ8vzmyGP07hKHYIegUvezeeRsHsiPXnYd43GmZIkn2Vh?=
 =?iso-8859-1?Q?IWb8SsDXDf+22ep0FvUc0fLFd4AdgrY6ah+e1nKI2k0zQEFq2dZ9gRPTTf?=
 =?iso-8859-1?Q?PVMpUhnnYFandBbieguRCv0+pGTX7oH3SX8o2Hhou9faStN5elehoJwX3V?=
 =?iso-8859-1?Q?6vQOJhNqrDtV7WAC3gJOEBjbiYVrBJEFktwmy+8J0CN9KqgyVYx/hN5Cjc?=
 =?iso-8859-1?Q?VLXUd+o/As/E7pVvYLTT09DEiw7zCGaDFaxWbgGrycDsgXJTB/szZ52CNg?=
 =?iso-8859-1?Q?4pil0KbSrE4AEwDt0TQVzyV1dcFDCesf0gCXHfc6EAzWrAgwllu1MVaXz7?=
 =?iso-8859-1?Q?8e+D4Hq8mX5qhIfwzSZihSiSYHgv/nqUUtQxof8getmuWWbPbWVTNDAnaH?=
 =?iso-8859-1?Q?RNFM5eFIfEERyYUV5umDWNyvuO2aQZtwJKyyunZ6rgE9vMDZx05lrS7DEN?=
 =?iso-8859-1?Q?zETJ7D9gCXdgGp9NrtEjeyQaNFzndB7iB5QwwZLDG0JFsV2V3HQq61uDtu?=
 =?iso-8859-1?Q?fH9YpcyUqAA4P6aZ/AAZFBB+6S4WpwzjbGM5brhgb4h4dwoLvkCxzNE2Ub?=
 =?iso-8859-1?Q?h1GG27NY9a+B5LAvVY5hzh3WVZNJcijKFL+8PAj+MXmjijHY2cJFduDbwM?=
 =?iso-8859-1?Q?LvyM117NGPeK7pab32AQyoM/dAa8c1ffwXt4jukZnHYUkftjLbMIweDses?=
 =?iso-8859-1?Q?iWtOGRooQRSy1K24AR2ddhxxi7rIpD48AQXTfp6pbmcBVN8Ge/CmZBVCaz?=
 =?iso-8859-1?Q?Z4LYpaYA2HYOeQz07iZBoN+dGbpQqDj53XCijxq9zkjXx6pfRW0+z3pbFK?=
 =?iso-8859-1?Q?r/OfyFXkhibeoZIMIV5dp7rxhiYf+2e+MKJbatob6g8/PiuLrMeCZHb+YU?=
 =?iso-8859-1?Q?WMT7FAf4WyFdlh038lNXLmERolLM/zxQatl3o9HUa5dAwbdWOEmXjtwwxW?=
 =?iso-8859-1?Q?af8aSXBNSJ85CCuHcqu26tLeOZ0K2D9X5LcezG2f19PA7VSOL+l4ppakBj?=
 =?iso-8859-1?Q?zYpW491TIpCHi9UvZjkCKsMU9sEDaG8sGiN+ekc8N5z5uiKxyGGVrG5BUw?=
 =?iso-8859-1?Q?2Uh8ROXNXDDHk31Kyf5wBgkQRpyt2vJgzPgvmUa3Q1Q4+NxVsZTTodmGsb?=
 =?iso-8859-1?Q?GwFO0RPJDvGTcXnIDaUkj3wkVtzPBFCfnky+Ae4Pe5imH6T9gTRT1jMJlP?=
 =?iso-8859-1?Q?iQ1FPuriMi2abTYsKBDEyZw4kjKhOCoDOotCUTdLRltn51IH3mRLRqD6y2?=
 =?iso-8859-1?Q?g+fSuraFRJQ2DbuEwGw6H8YdyGcKXeANZ/AfJ76tkElBw9kgMFJl7J3RXe?=
 =?iso-8859-1?Q?7a3uNk5QjQZdGE3x1ODaRVZadJEbqfipO1cD9ShJgP1n1EtPqu5ZFKZosr?=
 =?iso-8859-1?Q?pj/rXjmPfTHWGjdqASazUDHr0T/MT3KXlMNIEupDnerbB2gAzhlyV/2IJ/?=
 =?iso-8859-1?Q?m+u2SBrO3raxTxIMeyVAg3/PZT58vl7SGAWq9SfxF8LohjWyCblmKkfQGQ?=
 =?iso-8859-1?Q?RYPp41FusfImPK3UFqkukZYx54LxDBykouMfzRXeEoVb7QkBIbB1FrhzYc?=
 =?iso-8859-1?Q?O7mRciPmuK027vURyMEOmKDtcKC6UMApo1TYl5iSF5HFzs0qiipABSHmUo?=
 =?iso-8859-1?Q?z/HHpQ4FtXEcd+Ad/ROsNvCxcnhuhhhNc/35CYhmc/wtgLWrpU7DoVNg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f1c0b7cb-417c-4b64-5eb1-08ddff5d8a29
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 13:38:57.9175 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L8eCu2TRUS2AGUsB8Nx0+dq1RxjVBkoMAeLQYXwqjJJGobuW1lZk5Y9qlv5FZeWuMWbKH5Zym2ssVpp0TG2eRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4658
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

On Mon, Sep 29, 2025 at 01:26:49PM +0200, Thomas Hellström wrote:
> Before calling ttm_bo_populate() in the CPU fault path of a bo,
> we assert that the bo is not being migrated. However, for
> local bos we share the reservation object with other local bos
> that might be in the process of being migrated. Also some VM
> operations may attach USAGE_KERNEL fences to the common
> reservation object and trigger false positives from the assert.
> 
> So remove the assert and instead wait for bo idle. This may
> unnecessarily wait for idle in some cases but since we're
> doing this wait later in the fault path anyway we might as
> well do it here as well.
> 
> This fixes warnings like:
> Sep 25 14:56:23 desky kernel: ------------[ cut here ]------------
> Sep 25 14:56:23 desky kernel: xe 0000:03:00.0: [drm] Assertion `dma_resv_test_signaled(tbo->base.resv, DMA_RESV_USAGE_KERNEL) || (tbo->ttm && ttm_tt_is_populated(tbo->ttm))` failed!
>                               platform: BATTLEMAGE subplatform: 1
>                               graphics: Xe2_HPG 20.01 step A0
>                               media: Xe2_HPM 13.01 step A1
> Sep 25 14:56:23 desky kernel: WARNING: CPU: 6 PID: 24767 at drivers/gpu/drm/xe/xe_bo.c:1748 xe_bo_fault_migrate+0x1bb/0x300 [xe]
> Sep 25 14:56:23 desky kernel: Modules linked in: cpuid dm_crypt xt_conntrack nft_chain_nat xt_MASQUERADE nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 bridge stp llc xfrm_user xfr>
> Sep 25 14:56:23 desky kernel:  snd_soc_sdca snd_seq_midi prime_numbers coretemp snd_seq_midi_event drm_ttm_helper snd_hda_codec drm_buddy drm_exec snd_rawmidi snd_soc_core snd_hda_cor>
> Sep 25 14:56:23 desky kernel: CPU: 6 UID: 1000 PID: 24767 Comm: steamwebhelper Tainted: G     U  W           6.17.0-rc7+ #32 PREEMPT(voluntary)
> Sep 25 14:56:23 desky kernel: Tainted: [U]=USER, [W]=WARN
> Sep 25 14:56:23 desky kernel: Hardware name: Micro-Star International Co., Ltd. MS-7D36/PRO Z690-P DDR4 (MS-7D36), BIOS A.A1 10/18/2022
> Sep 25 14:56:23 desky kernel: RIP: 0010:xe_bo_fault_migrate+0x1bb/0x300 [xe]
> Sep 25 14:56:23 desky kernel: Code: fa 64 29 f9 48 c7 c7 40 e0 d3 c1 51 48 c7 c1 c0 e3 d3 c1 52 4c 8b 45 c0 41 50 44 8b 4d c8 4d 89 e0 48 8b 55 a8 e8 25 27 95 ef <0f> 0b 48 83 c4 40 4>
> Sep 25 14:56:23 desky kernel: RSP: 0000:ffffae1ca88c7b10 EFLAGS: 00010286
> Sep 25 14:56:23 desky kernel: RAX: 0000000000000000 RBX: ffff8d7cfd7e6800 RCX: 0000000000000027
> Sep 25 14:56:23 desky kernel: RDX: ffff8d845019cec8 RSI: 0000000000000001 RDI: ffff8d845019cec0
> Sep 25 14:56:23 desky kernel: RBP: ffffae1ca88c7bc8 R08: 0000000000000000 R09: 0000000000000000
> Sep 25 14:56:23 desky kernel: R10: 0000000000000000 R11: 0000000000000004 R12: ffffffffc1db1faa
> Sep 25 14:56:23 desky kernel: R13: ffffffffc1db2ab4 R14: 0000000000000001 R15: ffffae1ca88c7bd8
> Sep 25 14:56:23 desky kernel: FS:  00007fb1baf31940(0000) GS:ffff8d849c870000(0000) knlGS:0000000000000000
> Sep 25 14:56:23 desky kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> Sep 25 14:56:23 desky kernel: CR2: 00007fb1b2860020 CR3: 00000001705a9004 CR4: 0000000000772ef0
> Sep 25 14:56:23 desky kernel: PKRU: 55555558
> Sep 25 14:56:23 desky kernel: Call Trace:
> Sep 25 14:56:23 desky kernel:  <TASK>
> Sep 25 14:56:23 desky kernel:  xe_bo_cpu_fault_fastpath+0x11e/0x220 [xe]
> Sep 25 14:56:23 desky kernel:  xe_bo_cpu_fault+0x84/0x410 [xe]
> Sep 25 14:56:23 desky kernel:  ? __x64_sys_mmap+0x33/0x50
> Sep 25 14:56:23 desky kernel:  ? x64_sys_call+0x1b2e/0x20d0
> Sep 25 14:56:23 desky kernel:  ? do_syscall_64+0x9d/0x1f0
> Sep 25 14:56:23 desky kernel:  ? __check_object_size+0x4a/0x2e0
> Sep 25 14:56:23 desky kernel:  __do_fault+0x36/0x190
> Sep 25 14:56:23 desky kernel:  do_fault+0xcf/0x570
> Sep 25 14:56:23 desky kernel:  __handle_mm_fault+0x92b/0xfe0
> Sep 25 14:56:23 desky kernel:  ? ktime_get_mono_fast_ns+0x39/0xd0
> Sep 25 14:56:23 desky kernel:  handle_mm_fault+0x164/0x2c0
> Sep 25 14:56:23 desky kernel:  do_user_addr_fault+0x2cb/0x840
> Sep 25 14:56:23 desky kernel:  exc_page_fault+0x75/0x180
> Sep 25 14:56:23 desky kernel:  asm_exc_page_fault+0x27/0x30
> Sep 25 14:56:23 desky kernel: RIP: 0033:0x7fb1bc388bb7
> Sep 25 14:56:23 desky kernel: Code: 48 ff c7 48 01 fe 48 8d 54 11 80 0f 1f 84 00 00 00 00 00 c5 fe 6f 0e c5 fe 6f 56 20 c5 fe 6f 5e 40 c5 fe 6f 66 60 48 83 ee 80 <c5> fd 7f 0f c5 fd 7>
> Sep 25 14:56:23 desky kernel: RSP: 002b:00007ffd7814fad8 EFLAGS: 00010207
> Sep 25 14:56:23 desky kernel: RAX: 00007fb1b2860000 RBX: 0000000000000690 RCX: 00007fb1b2860000
> Sep 25 14:56:23 desky kernel: RDX: 00007fb1b2860610 RSI: 0000556eda79f4c0 RDI: 00007fb1b2860020
> Sep 25 14:56:23 desky kernel: RBP: 00007ffd7814fb60 R08: 0000000000000000 R09: 000000012be0e000
> Sep 25 14:56:23 desky kernel: R10: 00007fb1b2860000 R11: 0000000000000246 R12: 0000556edd39a240
> Sep 25 14:56:23 desky kernel: R13: 00007fb1b2dcb010 R14: 0000556eda79f420 R15: 0000000000000000
> Sep 25 14:56:23 desky kernel:  </TASK>
> 
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5250
> Fixes: c2ae94cf8cd8 ("drm/xe: Convert the CPU fault handler for exhaustive eviction")
> Cc: Matthew Brost <matthew.brost@intel.com>

I see the original oversight and the fix makes sense to me.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c | 34 +++++++++++++++++++++++-----------
>  1 file changed, 23 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index edc6e29f0cc1..0e2bd719226d 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1737,6 +1737,24 @@ static bool should_migrate_to_smem(struct xe_bo *bo)
>  	       bo->attr.atomic_access == DRM_XE_ATOMIC_CPU;
>  }
>  
> +static int xe_bo_wait_usage_kernel(struct xe_bo *bo, struct ttm_operation_ctx *ctx)
> +{
> +	long lerr;
> +
> +	if (ctx->no_wait_gpu)
> +		return dma_resv_test_signaled(bo->ttm.base.resv, DMA_RESV_USAGE_KERNEL) ?
> +			0 : -EBUSY;
> +
> +	lerr = dma_resv_wait_timeout(bo->ttm.base.resv, DMA_RESV_USAGE_KERNEL,
> +				     ctx->interruptible, MAX_SCHEDULE_TIMEOUT);
> +	if (lerr < 0)
> +		return lerr;
> +	if (lerr == 0)
> +		return -EBUSY;
> +
> +	return 0;
> +}
> +
>  /* Populate the bo if swapped out, or migrate if the access mode requires that. */
>  static int xe_bo_fault_migrate(struct xe_bo *bo, struct ttm_operation_ctx *ctx,
>  			       struct drm_exec *exec)
> @@ -1745,10 +1763,9 @@ static int xe_bo_fault_migrate(struct xe_bo *bo, struct ttm_operation_ctx *ctx,
>  	int err = 0;
>  
>  	if (ttm_manager_type(tbo->bdev, tbo->resource->mem_type)->use_tt) {
> -		xe_assert(xe_bo_device(bo),
> -			  dma_resv_test_signaled(tbo->base.resv, DMA_RESV_USAGE_KERNEL) ||
> -			  (tbo->ttm && ttm_tt_is_populated(tbo->ttm)));
> -		err = ttm_bo_populate(&bo->ttm, ctx);
> +		err = xe_bo_wait_usage_kernel(bo, ctx);
> +		if (!err)
> +			err = ttm_bo_populate(&bo->ttm, ctx);
>  	} else if (should_migrate_to_smem(bo)) {
>  		xe_assert(xe_bo_device(bo), bo->flags & XE_BO_FLAG_SYSTEM);
>  		err = xe_bo_migrate(bo, XE_PL_TT, ctx, exec);
> @@ -1922,7 +1939,6 @@ static vm_fault_t xe_bo_cpu_fault(struct vm_fault *vmf)
>  			.no_wait_gpu = false,
>  			.gfp_retry_mayfail = retry_after_wait,
>  		};
> -		long lerr;
>  
>  		err = drm_exec_lock_obj(&exec, &tbo->base);
>  		drm_exec_retry_on_contention(&exec);
> @@ -1942,13 +1958,9 @@ static vm_fault_t xe_bo_cpu_fault(struct vm_fault *vmf)
>  			break;
>  		}
>  
> -		lerr = dma_resv_wait_timeout(tbo->base.resv,
> -					     DMA_RESV_USAGE_KERNEL, true,
> -					     MAX_SCHEDULE_TIMEOUT);
> -		if (lerr < 0) {
> -			err = lerr;
> +		err = xe_bo_wait_usage_kernel(bo, &tctx);
> +		if (err)
>  			break;
> -		}
>  
>  		if (!retry_after_wait)
>  			ret = __xe_bo_cpu_fault(vmf, xe, bo);
> -- 
> 2.51.0
> 

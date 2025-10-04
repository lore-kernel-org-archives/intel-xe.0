Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D90BCAC5B0
	for <intel-xe@archiver.kernel.org>; Sat,  4 Oct 2025 04:33:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAA8010E1F1;
	Sat,  4 Oct 2025 04:33:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="geMyZhrA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35C7F10E1F1
 for <intel-xe@lists.freedesktop.org>; Sat,  4 Oct 2025 04:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759552383; x=1791088383;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=eCpjhS6eln6W+yXQlZPdAXCzHyqvjeU3slNH9LpknAk=;
 b=geMyZhrAbcwrrCYNrfgmIaHoxp99ELGoV/m45Bh0iOzJmtUa6WIlTVss
 5cCesrJ+CgBQzDgzYawrRncYLLwzpRFeh64ox54u8MrowoVH+JDOUiOl3
 CBBwqZWdBVFmDMFQg2sf2Z2voeDXjvb3gvpNKXL1ShzwIoj6meQHNI4Db
 xlVBcxUzGHMWxHVfqiQAssyypa1d0w9kO9ghRNhyFt11FbJ1wQ4QvRaND
 1q5JDdFe+4CZ2CTz6rJ9af/w/DZE3uaKlBZ680LjdMnMmmsO33WVO59NH
 fbExdzKNxBmxB1w4agkpFHrUzrUDNBmWFH98ZqYbvLbd8UH/xrXs3VQiw A==;
X-CSE-ConnectionGUID: I5IppNPATtG36IlUihRlCQ==
X-CSE-MsgGUID: RvpLt7SxSo2YSAV54dq5Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="73181211"
X-IronPort-AV: E=Sophos;i="6.18,314,1751266800"; d="scan'208";a="73181211"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 21:33:03 -0700
X-CSE-ConnectionGUID: TJ/vQVYYSZSdyTRePblx/w==
X-CSE-MsgGUID: mVZiXUDxTvCGP35LC5EF7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,314,1751266800"; d="scan'208";a="210419831"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 21:33:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 21:33:02 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 3 Oct 2025 21:33:02 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.15) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 21:33:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aha99Yv4z3t3rvkbVkFJnJVIe5dxbIbcGl5A2XJvh9MquShvjmpdqWiYtLwm+M5aDS3+xDScs2g6KIgi8F2R6DERmtrGVe05bmnvSzRHgYaAKlSkzyMoPm2xR94gW1qpDVRUDGdepQtui5SwrWfC7SGBCcSFVNV/p5JVr8IMbxoL8/TkcVN4qULDNwLe5cpqCPA7d9qQFQQpNqQGjxuCq08zCEm+7qcgEQ+mtrIHIv8Rj5gH6qz1Rw7+cqGpUkfdKzeKfc+pNpt2U0ekgpSitu16bs+jr0A6+TnJD/PLwK6dcTtfTDoM1/ucrHYBBvMsfhg+c5Ij+gIzCp8HTiW3kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/BQfxaQC6ukEyiCCx9CgyqQR9WBcmE4nAuEXq3cmVE8=;
 b=n+cqhDEk0s4vCViNyKvGTpGLkG8PkCjgaP2z4ZKnqCqiZ+v1WksxAYW13ZTGkobdcKVYHjJ9Ye54qLLX0ORYxQFbWXNj0r1hCZ6Pk5AgyAcbipkueXc082OAw1nWN0nLwDQBbADYMPADqn9iK4SttVsMkblNAwm5GZa1DatbW2tc0ZT4R1s+40HqIqiwu51gj/mECYzSw3Klxbd5PVs2XeAO6yOzJSe0HAL/WXXgEYCDC2gCAkrpEVSNrSH6XtWVuwjY95V9RAZp+wb2rTO/omu9iWBt951bTKZFtBAtqofMT5RJ6y7RHv5n3aXw0wk9yvZqsgo9I7zjHhvYNT2Ihw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB7739.namprd11.prod.outlook.com (2603:10b6:8:e0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Sat, 4 Oct
 2025 04:32:55 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9160.017; Sat, 4 Oct 2025
 04:32:55 +0000
Date: Fri, 3 Oct 2025 21:32:53 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Lis, Tomasz" <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>
Subject: Re: [PATCH v4 11/34] drm/xe/vf: Add xe_gt_recovery_inprogress helper
Message-ID: <aOCjdTKFjbNBBFI6@lstrano-desk.jf.intel.com>
References: <20251002055402.1865880-1-matthew.brost@intel.com>
 <20251002055402.1865880-12-matthew.brost@intel.com>
 <fcf3bbdf-e100-4b7a-9280-a056dc1dc478@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <fcf3bbdf-e100-4b7a-9280-a056dc1dc478@intel.com>
X-ClientProxiedBy: MW4PR04CA0138.namprd04.prod.outlook.com
 (2603:10b6:303:84::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB7739:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bf7896a-9e64-4df8-8e8a-08de02ff16db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3ly0Rj+MQ7zeVpH8rZBFxv4qRIdRJmcto5e7ttztrku6lYPd1dvtJekCF8FV?=
 =?us-ascii?Q?SQ2Q0E6Ie7crXEdrINhYHigg1gpZcjLYf9TDfidW0+MaCB7sKSxNoNZ8MQms?=
 =?us-ascii?Q?pAHdigjKVxfxjA2XnPGIBeAiTCogMZj9mLT8LqErWuYigSHzrnYolJ/gnjdr?=
 =?us-ascii?Q?Btq2WgnKu+NKVrUOCchNgDf03Q8H3xtKtXd8lM2zYTuMtZOUueDvtAslLvci?=
 =?us-ascii?Q?A2VRG5M5w+KfygllR2dcx5ajG0+UQ9ewKZb+evbV3xJ503JjOVeHiJiCf5/j?=
 =?us-ascii?Q?tCnnHDiOJk3BOdAop+PSCTmtuEDo0zQ+DY5usYR3+TfS2RtTSIZmVyd97yMJ?=
 =?us-ascii?Q?D2xkt0cJ0c3fdmC2ncQNQ1S79JFAoH4+a9tgG+KP9nrIZHRugK5n5GlaQSQn?=
 =?us-ascii?Q?ej7aL9k66uEQ1HDmLG+wPj+8mrE7/xYvUzm4HHS7AAAnwnQlRW/kiLutGEO6?=
 =?us-ascii?Q?Loe6UZcMmb1jis8RGQKdWhNkx8ibNdFUCWirqsbazGoYoPJ10QBvzB8acQ1n?=
 =?us-ascii?Q?+JwXBFfYzLxwh5jA2CHUngeG05l4DAVBDLxZaVKTPa/I+AcK6oOwty+oLp9l?=
 =?us-ascii?Q?ypxSyt7yliPG0x55l6dYV54NnF9ymf7DGjfQi6IqZJ6cPXugpIimY/e5sMkj?=
 =?us-ascii?Q?ohwgLr6IvVmsAMoI58F82t1iaogt5MXIfhEL/QF9hrai4DfIscAL5REh1Oek?=
 =?us-ascii?Q?iwdWF29lbi0mJ8qiPNmvZUdxdJloROTLdlTBLXHMk0SKlCBYenj2bVmz4Y2q?=
 =?us-ascii?Q?PKSK1ZPh6amPjmEi0G6FWGoDVyV3Z9am6ntpRehwzPvF5pjuUpHOYBwf3Izb?=
 =?us-ascii?Q?mfULfDPBx5PgW8xFC873kTWu79V4pSsV0evZPn5lwBPwPDGKwtUJyocTeZ9I?=
 =?us-ascii?Q?otgoVt7IPImPi4R6Wt7lfNOCM8I/E3jHBDzPRJaGGSWqL/a0uInkf+dTeUNy?=
 =?us-ascii?Q?ZW5bY0tkYoXncHiVkRCKYuRAU6oJ00MNS3OwB6q3PJ5nnalApo3d30vaiaH3?=
 =?us-ascii?Q?zjPoUBYa3CFqE+uP4DXOpe0jY9Co3jZ+wzFCO56Ekres9UlPqAK8qM8wDfh8?=
 =?us-ascii?Q?njK7BWQ1j1EoB7tQ6CMFD6dKIxUK1OWQOlZDIMiVVXkprpnHdaKiakKcmCja?=
 =?us-ascii?Q?CdW6xVIYWgN5pH1j+scUwhFAzAEHPEx3+j3Uz5wzpwPzdw4ieRIDct1dK4Pp?=
 =?us-ascii?Q?cbt9kevxSpHky5mjczvSqLWM3oQLmambFBgdCLJEACr2KlsRB8qV7Vm0EhbM?=
 =?us-ascii?Q?+tU9LEZjDly2kVfpSKyV22BYHap5NVSrMYHGuNZwcD4pa4b7wzzJZs5/6l3A?=
 =?us-ascii?Q?I/kS5ZKeZ1kn7LBBDJO/ux9V3UpOtZCfKpTBjjRWRyk/VTSZSGQcf1i/pN1j?=
 =?us-ascii?Q?BarEGpTenWN6Ag0IL7SVStIVSwG7zhNH06+cjUDk6QS6BkGWav96a8sBVdD+?=
 =?us-ascii?Q?ECA74U8X2GUvG6+rPbBhBaPU2drWNe+R?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NDDhmm6lt5mY7vkiV+xWuNy9GE5Fe7aUKGaPzDw88Lyh4hCAYG7AYz4mNJPg?=
 =?us-ascii?Q?hunXbR1VVpnTtf9LcS9Jku7ikDfvF39cWp9ucEYgHoT5dqBfXNdzMA8IiKRx?=
 =?us-ascii?Q?eLh1NgkgI8nK3/DM48gggCfvKlCymZnKoCT8k8SoqAYKrP2Gj5FKJSRPy79g?=
 =?us-ascii?Q?gtbF3fen0Vwm3j5jzsoy1KAmujx4B2+f2v5hI7ONjsXAXZKZnjcqiRSMa8lk?=
 =?us-ascii?Q?TVDXwCQKmK+yAh0ng1sonxaYqSku9dOHCMXnd/LJJm4Kei9/qS+KmG3Ioi9d?=
 =?us-ascii?Q?kh7qQCWNgUwSbKXhHugkLd5V5d6EXVcHKvKSjGDX5KtP9X0Sve6KlkXmLLwM?=
 =?us-ascii?Q?+U63fkAuq77KQNbzM+/98uaGxMECM924YFTj00rTBh5bmCXVMJ26lXW3XR5I?=
 =?us-ascii?Q?6XLmkFgXoFtg58n/bb/Z1CDf12Qt+farjB3yK9dVX9R4hLuSIlztLpFJieEx?=
 =?us-ascii?Q?sWg+GfKMexpm4ZQ3t/Q41qQLn6BqCRgDdJyFMKZyu7sL6woBcOZoUy/dIEmS?=
 =?us-ascii?Q?S36xNqxwNR02d1pwzVaeEirUkQ+Axn1SEbej1lkgEcH6GKl8ZVoM9PNOwky0?=
 =?us-ascii?Q?WzUuZnhr2KGx8Wfu1Mz3OxFi+4k89VPRRB4QMU3uDH1qr8lVF7xtk6/2sJfn?=
 =?us-ascii?Q?iMe2XITslJgUfKl8Xnags5KxzNWdq7SZDZh2JZxD7DLwUCOb7jBGkh53swXc?=
 =?us-ascii?Q?vzznmkgk5CzJognqowkngrjp/tAkCF8egW682+hJhn4NVqA2DO0qiXLiHn2Y?=
 =?us-ascii?Q?H2gIJZpgWh4c5pwPALtecsWJa2FIbmhhnnSJTt51ZyHkQuM4/1ryf/QqRfiR?=
 =?us-ascii?Q?OwblOrEV0DDmmZRJbRMa+uae8pQaNXWnpQ2zlfIDBtNq4RKdV5Li09gtgdUn?=
 =?us-ascii?Q?I5NxkaF/0l7vg1d2xN0hoJ8vwxO3A9j0+GKOyZBHgP9UR7FDJOcyVbVecgP5?=
 =?us-ascii?Q?8eTxXPyFtwWGF97Mdno9Uz9cQFZe72ONJk6oPgvlb74YP9JOoVTVMo2vxGwb?=
 =?us-ascii?Q?FngjBeUoU882GVL8gPUMhq8ZUsNJWC+cjQ65j+QYgJPo4loTdvBmYeqw/DYt?=
 =?us-ascii?Q?eFxGUakAl0KeYkiTAVCsihfMCP8075UzNcnKqz/kDqRuG17+Va+8YLY9EbPh?=
 =?us-ascii?Q?CA6dxE0tXfhiHx2/rLF89XwPpmrKqNf6OV2N7ePojgtqPyf29Xn3K6vqHpNV?=
 =?us-ascii?Q?4lia25T17SDs7G4w8OMkcjTOydacQGfCGFSWdnEDrD+X4hvlaGkgkkEp7uQW?=
 =?us-ascii?Q?5hEfHUUKXO6nnPADNpCsU1/KvWEqzHkVLxS20pfi3PIyhG+8DLjKyxQllDkq?=
 =?us-ascii?Q?PKEyMxGYh1hbeDRKxCUfdRJR0mRavw6VDJnYrNCgd4sykW6qwyc/KqhPTuB8?=
 =?us-ascii?Q?VR1hvCTSTURPtlHcv27LqK86pp6x2KF38EH3Ca7r9xBqt3+NKbUYlzaIZpmD?=
 =?us-ascii?Q?X+9t3rAIS41rRhs4dbtsBzp3u/XsasUZYvkV4cHpzo2LHQqiaMjweBbNRONX?=
 =?us-ascii?Q?dGpMibKIOH96TbJeQ31p4XeDtPZ9B1wX0mSYf7ypTUmVFzJncXQO9ypY4zkw?=
 =?us-ascii?Q?aq6l+3kEod5EwApL+W+iSn9/+sXJtIRcffBg7uBOt8+dzD9KO3BCCP9QTNlO?=
 =?us-ascii?Q?ag=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bf7896a-9e64-4df8-8e8a-08de02ff16db
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2025 04:32:55.7935 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wM7xuOuByhivD13HOXs/yd9xgGtnn5jWVvoR3/3khvWy0KDOfmelPHFbzZY7K3Mj5P5cgnrHDu+p983VBtTOLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7739
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

On Fri, Oct 03, 2025 at 03:39:08AM +0200, Lis, Tomasz wrote:
> 
> On 10/2/2025 7:53 AM, Matthew Brost wrote:
> > Add xe_gt_recovery_inprogress helper.
> > 
> > This helper serves as the singular point to determine whether a GT
> > recovery is currently in progress. Expected callers include the GuC CT
> > layer and the GuC submission layer. Atomically visable as soon as vCPU
> > are unhalted until VF recovery completes.
> > 
> > v3:
> >   - Add GT layer xe_gt_recovery_inprogress (Michal)
> >   - Don't blow up in memirq not enabled (CI)
> >   - Add __memirq_received with clear argument (Michal)
> >   - xe_memirq_sw_int_0_irq_pending rename (Michal)
> >   - Use offset in xe_memirq_sw_int_0_irq_pending (Michal)
> > v4:
> >   - Refactor xe_gt_recovery_inprogress logic around memirq (Michal)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_gt.h                | 13 ++++++
> >   drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 22 +++++++++++
> >   drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  2 +
> >   drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h | 10 +++++
> >   drivers/gpu/drm/xe/xe_memirq.c            | 48 +++++++++++++++++++++--
> >   drivers/gpu/drm/xe/xe_memirq.h            |  2 +
> >   6 files changed, 93 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> > index 41880979f4de..ee0239b2f48c 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.h
> > +++ b/drivers/gpu/drm/xe/xe_gt.h
> > @@ -12,6 +12,7 @@
> >   #include "xe_device.h"
> >   #include "xe_device_types.h"
> > +#include "xe_gt_sriov_vf.h"
> >   #include "xe_hw_engine.h"
> >   #define for_each_hw_engine(hwe__, gt__, id__) \
> > @@ -124,4 +125,16 @@ static inline bool xe_gt_is_usm_hwe(struct xe_gt *gt, struct xe_hw_engine *hwe)
> >   		hwe->instance == gt->usm.reserved_bcs_instance;
> >   }
> > +/**
> > + * xe_gt_recovery_inprogress() - GT recovery in progress
> > + * @gt: the &xe_gt
> > + *
> > + * Return: True if GT recovery in progress, False otherwise
> 
> ```
> True if migration recovery is pending or in progress
> ```
> Both the messages we log and spec clearly establish that migration recovery is the queued work, not the whole period after vCPU starts.
> 
> > + */
> > +static inline bool xe_gt_recovery_inprogress(struct xe_gt *gt)
> > +{
> > +	return IS_SRIOV_VF(gt_to_xe(gt)) &&
> > +		xe_gt_sriov_vf_recovery_inprogress(gt);
> > +}
> > +
> >   #endif
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > index 0461d5513487..c2be8fc14c88 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > @@ -26,6 +26,7 @@
> >   #include "xe_guc_hxg_helpers.h"
> >   #include "xe_guc_relay.h"
> >   #include "xe_lrc.h"
> > +#include "xe_memirq.h"
> >   #include "xe_mmio.h"
> >   #include "xe_sriov.h"
> >   #include "xe_sriov_vf.h"
> > @@ -776,6 +777,7 @@ void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt)
> >   	struct xe_device *xe = gt_to_xe(gt);
> >   	xe_gt_assert(gt, IS_SRIOV_VF(xe));
> > +	xe_gt_assert(gt, xe_gt_sriov_vf_recovery_inprogress(gt));
> 
> If the handler was called, then this will always pass. It does not fully
> verify the solution, as it doesn't mean the MEMIRQ was already set on the
> first vCPU cycle, which the patches rely on.
> 
> It only verifies that:
> 
> * the IRQ type is MEMIRQ
> 
> * the IRQ handler does not clear bytes which indicate source of the request
> before calling the handler
> 
> So this assert is ok to stay, but requirements on the IRQ raising moment are
> not established by it and need to be explicitly stated. Currently this is
> only mentioned in commit message, and not as requirement but rather.. a
> fact? Hard to tell even, as the sentence lacks pointing a subject.
> 
> I think we need this plainly stated, and not only in commit message but also
> in the sources or kerneldoc.
> 
> I don't think it would be a problem to expand the solution to IRQs with
> source in MMIO, we could expand the function to check MMIO bits if any
> platform requires that.
> 
> I also now think the requirement on IRQ bytes being set from first vCPU
> instruction is reasonable, meaning all VMM systems will meet it because it
> is required to finish VM memory restore of all types before GuC restore, and
> GuC needs to drive the HW to trigger the IRQ during its state load, it
> cannot defer it. (btw the MEMIRQ buffer seem to be in sys mem, not in vram
> as I previously thought)
> 
> So not sure if Michal will agree, but my perspective is: this is ok, and
> just needs comments to emphasize the "IRQ source data visible from the first
> vCPU cycle" requirement.

Will do.

Matt

> 
> -Tomasz
> 
> >   	set_bit(gt->info.id, &xe->sriov.vf.migration.gt_flags);
> >   	/*
> > @@ -1118,3 +1120,23 @@ void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p)
> >   	drm_printf(p, "\thandshake:\t%u.%u\n",
> >   		   pf_version->major, pf_version->minor);
> >   }
> > +
> > +/**
> > + * xe_gt_sriov_vf_recovery_inprogress() - VF post migration recovery in progress
> > + * @gt: the &xe_gt
> > + *
> > + * Return: True if VF post migration recovery in progress, False otherwise
> > + */
> > +bool xe_gt_sriov_vf_recovery_inprogress(struct xe_gt *gt)
> > +{
> > +	struct xe_memirq *memirq = &gt_to_tile(gt)->memirq;
> > +
> > +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> > +
> > +	/* early detection until recovery starts */
> > +	if (xe_device_uses_memirq(gt_to_xe(gt)) &&
> > +	    xe_memirq_sw_int_0_irq_pending(memirq, &gt->uc.guc))
> > +		return true;
> > +
> > +	return READ_ONCE(gt->sriov.vf.migration.recovery_inprogress);
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> > index 0af1dc769fe0..bb5f8eace19b 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> > @@ -25,6 +25,8 @@ void xe_gt_sriov_vf_default_lrcs_hwsp_rebase(struct xe_gt *gt);
> >   int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt);
> >   void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
> > +bool xe_gt_sriov_vf_recovery_inprogress(struct xe_gt *gt);
> > +
> >   u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
> >   u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
> >   u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > index 298dedf4b009..1dfef60ec044 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > @@ -46,6 +46,14 @@ struct xe_gt_sriov_vf_runtime {
> >   	} *regs;
> >   };
> > +/**
> > + * xe_gt_sriov_vf_migration - VF migration data.
> > + */
> > +struct xe_gt_sriov_vf_migration {
> > +	/** @recovery_inprogress: VF post migration recovery in progress */
> > +	bool recovery_inprogress;
> > +};
> > +
> >   /**
> >    * struct xe_gt_sriov_vf - GT level VF virtualization data.
> >    */
> > @@ -58,6 +66,8 @@ struct xe_gt_sriov_vf {
> >   	struct xe_gt_sriov_vf_selfconfig self_config;
> >   	/** @runtime: runtime data retrieved from the PF. */
> >   	struct xe_gt_sriov_vf_runtime runtime;
> > +	/** @migration: migration data for the VF. */
> > +	struct xe_gt_sriov_vf_migration migration;
> >   };
> >   #endif
> > diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
> > index 49c45ec3e83c..2391993634b5 100644
> > --- a/drivers/gpu/drm/xe/xe_memirq.c
> > +++ b/drivers/gpu/drm/xe/xe_memirq.c
> > @@ -398,8 +398,9 @@ void xe_memirq_postinstall(struct xe_memirq *memirq)
> >   		memirq_set_enable(memirq, true);
> >   }
> > -static bool memirq_received(struct xe_memirq *memirq, struct iosys_map *vector,
> > -			    u16 offset, const char *name)
> > +static bool __memirq_received(struct xe_memirq *memirq,
> > +			      struct iosys_map *vector, u16 offset,
> > +			      const char *name, bool clear)
> >   {
> >   	u8 value;
> > @@ -409,12 +410,26 @@ static bool memirq_received(struct xe_memirq *memirq, struct iosys_map *vector,
> >   			memirq_err_ratelimited(memirq,
> >   					       "Unexpected memirq value %#x from %s at %u\n",
> >   					       value, name, offset);
> > -		iosys_map_wr(vector, offset, u8, 0x00);
> > +		if (clear)
> > +			iosys_map_wr(vector, offset, u8, 0x00);
> >   	}
> >   	return value;
> >   }
> > +static bool memirq_received_noclear(struct xe_memirq *memirq,
> > +				    struct iosys_map *vector,
> > +				    u16 offset, const char *name)
> > +{
> > +	return __memirq_received(memirq, vector, offset, name, false);
> > +}
> > +
> > +static bool memirq_received(struct xe_memirq *memirq, struct iosys_map *vector,
> > +			    u16 offset, const char *name)
> > +{
> > +	return __memirq_received(memirq, vector, offset, name, true);
> > +}
> > +
> >   static void memirq_dispatch_engine(struct xe_memirq *memirq, struct iosys_map *status,
> >   				   struct xe_hw_engine *hwe)
> >   {
> > @@ -434,8 +449,16 @@ static void memirq_dispatch_guc(struct xe_memirq *memirq, struct iosys_map *stat
> >   	if (memirq_received(memirq, status, ilog2(GUC_INTR_GUC2HOST), name))
> >   		xe_guc_irq_handler(guc, GUC_INTR_GUC2HOST);
> > -	if (memirq_received(memirq, status, ilog2(GUC_INTR_SW_INT_0), name))
> > +	/*
> > +	 * We must wait to perform the clear operation until after
> > +	 * xe_gt_sriov_vf_start_migration_recovery() runs, to avoid race
> > +	 * conditions where xe_gt_sriov_vf_recovery_inprogress() returns false.
> > +	 */
> > +	if (memirq_received_noclear(memirq, status, ilog2(GUC_INTR_SW_INT_0),
> > +				    name)) {
> >   		xe_guc_irq_handler(guc, GUC_INTR_SW_INT_0);
> > +		iosys_map_wr(status, ilog2(GUC_INTR_SW_INT_0), u8, 0x00);
> > +	}
> >   }
> >   /**
> > @@ -460,6 +483,23 @@ void xe_memirq_hwe_handler(struct xe_memirq *memirq, struct xe_hw_engine *hwe)
> >   	}
> >   }
> > +/**
> > + * xe_memirq_sw_int_0_irq_pending() - SW_INT_0 IRQ is pending
> > + * @memirq: the &xe_memirq
> > + * @guc: the &xe_guc to check for IRQ
> > + *
> > + * Return: True if SW_INT_0 IRQ is pending on @guc, False otherwise
> > + */
> > +bool xe_memirq_sw_int_0_irq_pending(struct xe_memirq *memirq, struct xe_guc *guc)
> > +{
> > +	struct xe_gt *gt = guc_to_gt(guc);
> > +	u32 offset = xe_gt_is_media_type(gt) ? ilog2(INTR_MGUC) : ilog2(INTR_GUC);
> > +	struct iosys_map map = IOSYS_MAP_INIT_OFFSET(&memirq->status, offset * SZ_16);
> > +
> > +	return memirq_received_noclear(memirq, &map, ilog2(GUC_INTR_SW_INT_0),
> > +				       guc_name(guc));
> > +}
> > +
> >   /**
> >    * xe_memirq_handler - The `Memory Based Interrupts`_ Handler.
> >    * @memirq: the &xe_memirq
> > diff --git a/drivers/gpu/drm/xe/xe_memirq.h b/drivers/gpu/drm/xe/xe_memirq.h
> > index 06130650e9d6..a6fffdadef88 100644
> > --- a/drivers/gpu/drm/xe/xe_memirq.h
> > +++ b/drivers/gpu/drm/xe/xe_memirq.h
> > @@ -25,4 +25,6 @@ void xe_memirq_handler(struct xe_memirq *memirq);
> >   int xe_memirq_init_guc(struct xe_memirq *memirq, struct xe_guc *guc);
> > +bool xe_memirq_sw_int_0_irq_pending(struct xe_memirq *memirq, struct xe_guc *guc);
> > +
> >   #endif

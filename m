Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B18E0D3B99E
	for <intel-xe@archiver.kernel.org>; Tue,  9 Dec 2025 22:10:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BADB10E214;
	Tue,  9 Dec 2025 22:10:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EKw1NqRN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABC4710E214
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Dec 2025 22:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765318209; x=1796854209;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1WyCMwuFBRj4pp50uZ4Zd1gshI6PV3eKTW4OWgAyKco=;
 b=EKw1NqRNRdAvmsgHOa1B8FW7xUbz1Kh2axmvd7G14cJ9sgKuo/t0BODy
 UbzpOJQc/R2n1/Ikhd0/bWHoBp17+hW/F59qAHcbjJEfIqjwohiKoflUh
 CJE+i4tiM+OoC+Iw0te9rM5vj52/sy1mr/SYhxph4ZcfgpYNGJJXgxywi
 kDT8mJ4n6bvcJavweltEDMsnmZwxAPAhw/V2eVPQUB0wamkT+Aqm7q1z9
 xxST5V2Lu1WJAP/a4WwNFCvuyBxzT0ZaUPNty4IdY+3nL6MSeo10NCxsj
 F8rQt1SCXfVZWWakIEXH6QRx5ErmKsVxKujqsSubo0oNSM+acDjUqRCeP g==;
X-CSE-ConnectionGUID: rs+NzTOcQw+tADQGY7nvAw==
X-CSE-MsgGUID: WVPMnPGHSge/Sx8Lz3xaEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="92762712"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="92762712"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 14:10:08 -0800
X-CSE-ConnectionGUID: U2fZuCcqSvCyhTx+FDSKOA==
X-CSE-MsgGUID: 60qN3wdFRfy/mE1ZkowTDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="227001813"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 14:10:08 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 14:10:07 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 14:10:07 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.62) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 14:10:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Enq4yCm5+yUZvl3vH2jraSITiYYKAP81hPfAJRUiv0PGBIOCbcv5LWAea3Z9l6cn8HuEIBCJe3icw4AQshFq89DdJn02AleT3S18nSXElQjLS9CQ2bZWoNmobQJvUa1or6UXVqHkxqsgT3MQYEyZA3iPsR1ex6t6h6dcOB+WtgApccXvqHQFqsSKd6RiBEtVUKbS90iBqKPBgQT4YWG7AAyvurNSQH1x6aaeP20Sz6Cp3f6+mp9ZcjZ+gLe/eaCpcw9rgGS8WSm74YdD7DdK/Rpt4ZPgNkUrgDcPYARJVKBZ8gvEfLHbkqXmlOYfrxK8o5oJ9z0dTk/15USU9ddn7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TACv/gD7UwBSAm6w1c4HjSyuqEtFHULGyUhcKogyEPM=;
 b=IVsBPgaDPJLTPddlP6VZB6ulwLoBH1Cz49e0Dh9hpp7n3Wm45TshgW3D/esnVZcVf3WcHBW6f1qilO2IQzfqbRJpJwGVfK7U3r2ZeW21jALvRoWJHG1DGz/VbCRfTtUWQv4wgqhLVXTRNVD/7dd5mbLxv61ADhh0zhMNDCVckFvrPbCyPc5TtwwT51yp5ATt3QSBAqQDWsNzILxpanVicZ+Xd8TVyjHwAhvMmfdGU7x+6W/hB53PqdEYZ6G8GBz5+IdHFPigxb55P/n/NLcti5aVPUIEenzwvU1GeR29lsmO+qfIc/HsK0MYWI4My1xgBbbDSHlHPy8No4zWEYQMNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV3PR11MB8580.namprd11.prod.outlook.com (2603:10b6:408:1ae::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.13; Tue, 9 Dec
 2025 22:10:05 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 22:10:04 +0000
Date: Tue, 9 Dec 2025 14:10:02 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.d.roper@intel.com>
Subject: Re: [PATCH v4 09/18] drm/xe/multi_queue: Handle tearing down of a
 multi queue
Message-ID: <aTieOtMN+Kzmf6aD@lstrano-desk.jf.intel.com>
References: <20251209032055.1539229-20-niranjana.vishwanathapura@intel.com>
 <20251209032055.1539229-29-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251209032055.1539229-29-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: MW3PR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:303:2b::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV3PR11MB8580:EE_
X-MS-Office365-Filtering-Correlation-Id: 05db9a02-0a3f-4b47-f6ce-08de376fb4c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JSVAy7JzPlhqc+OjTTJdi2Mns8VHgR6myD2ut2+CxXmwZ1rSps9g87etNgNt?=
 =?us-ascii?Q?9+bJbWEF8ZZChnHOQ2yH5f8mYdpqHo9IMfGgBoFUtZlHuguut49PXkbeuTrn?=
 =?us-ascii?Q?vhmb55OgzeaVoXTYrfp154NJ8OlXJjCUGB0jWVIsFKCmnftxTXd0LvSsHCxL?=
 =?us-ascii?Q?Hzu5X9jmNqxA2fnI8besYhxNWXtpHN/H33Z26NQPXv/3r8kbFOZ0V/u/a0jY?=
 =?us-ascii?Q?gcGqtt3+hcd3Z4LvAFhVVRVddmgTicfrATzTr6Qd53QL2hQEt3Y6mRZ97NkC?=
 =?us-ascii?Q?MXyJN94dJEt0aTJdw5K4pe3/OHmPF8lDkfP2EN2c37cdFUmuU5duIHzo+tql?=
 =?us-ascii?Q?K1//kvgTJQm97/73m9is0pcMoNLQbj5zkDQOYcnNHsifFWXl6XfIhtuG/Ynt?=
 =?us-ascii?Q?If0+b6uhi740qSdwcfRExy6OLeKMT8pUy1KHvd0sAZHIcSWtmV1ETJvBiIlh?=
 =?us-ascii?Q?eKQRXFQwZXLj1IFUG/yanQSuRMkinlDLlp33Eb5hbGTOJZw8MvJXNN4bwgi3?=
 =?us-ascii?Q?/1yDtddeqQXBedrRU5OJMqS45zEUomV193cQAEV2mfoD7AnSMW9HLaqhMGep?=
 =?us-ascii?Q?Ebdynyf7b91TfVWyeL2ob3YE7DjYOyAw7hJSXPo1lsJBkBAGPt4Eg4tHFgiR?=
 =?us-ascii?Q?DTBCdh0htO/AXGm+leOhwn5bCvELusyKhygre3VYZfhxWgU1mf2a5Yk74nWo?=
 =?us-ascii?Q?szJ7xJcChCdNI9zJgI2J7UfJ014bWqyIvmZrumh/Iv+xHsvPTyEE9MNA6hLD?=
 =?us-ascii?Q?UPmj2cCldTQmL9vtc7P1SBKzfvvdFVbAXqAbDS1gj6vQmWFdMKCwqYCFozsM?=
 =?us-ascii?Q?jqMezjycYwI4ng5QZcZmaQDS1x+j/bgbbrw0bAh4Fn7YHO6gZiZuqICFrEc4?=
 =?us-ascii?Q?ovts3fBPzNQgJxI9GlQZRDW8dfMjQD2E0kQPVaYf+Wb56Lr2Lq6QDoIB5SJh?=
 =?us-ascii?Q?rfK7bQYT32EdwZGYzmIAR7AsnFgK2K4Ezbt4bEqCZPjeBPtNPEbcqod2TNuu?=
 =?us-ascii?Q?ucNORHJSEgZTHcQYQJJRy4tXnO5UthjsNWGmHzn00XS2Fz5obwp05HFbRFJh?=
 =?us-ascii?Q?jmpC7K2wRpxcvLLAp/iUv2GE9V3Rr+tO/D/f/P+6A+NyjgKT00RPIet4Udvv?=
 =?us-ascii?Q?YVAfRrTivxqE+cgkeq3UnNthVgP+cT8AC0KCEfsYfBprvRPRUzzYdj2lfi8t?=
 =?us-ascii?Q?YLBpCgCkwFNoRYKpzoKL5KR8KgKa0Q0TndEVMlCgCREtLU3isS/uy25nKQFF?=
 =?us-ascii?Q?YK7pySEpUETNUJLuoHPQ0VUgOfY9LJBdPOd+AiGiORrk7uROt3sKHpHtm4dI?=
 =?us-ascii?Q?i3PWn2e+OqTsjmp++1KMd1pI0J4aubu5EEwNAgxM5V+VbjtVza63vXhVopst?=
 =?us-ascii?Q?rnpYLLyPs0NBC2W8t7EuswYAfntgC+80ssdwnSL9a9lEGYNKlg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?08IBkOllFHrzzKovlfcGDvJrrmcxb3U8O6oZiSFmop6PkhmYHhNCTgDcu1kD?=
 =?us-ascii?Q?3RS0K7iLZIqp2F7e4epPbGk4rkAWBNf+sORw3z0+e34nvjXIUCURc6xopLsd?=
 =?us-ascii?Q?LqNtjkqjCMkr7vZhWPILIogCQoO3Ag7CKO5EMl9BbI9eS1o7vuBgrM4UfxWC?=
 =?us-ascii?Q?Gc+to2Z5ah7bwqlLtK3GiaJ9elPmlnbj7hsKMczTeO67RHyqOToD9AUsYChg?=
 =?us-ascii?Q?bpf28Gdty+iUIqIGNDef45mPcNoj+OZEBlNKullHbhoyLsrc3xWyMotC+S2J?=
 =?us-ascii?Q?e6kUP2H5t21zqhV2ic8lU3zcEUbwrGi2uuNuIQfsWsmey+Gw5G9aueTjlGkT?=
 =?us-ascii?Q?YlbGKoQf10KNHKKv9oGYj8ahMHzUp5szzsPO9kETMD8ueJ12ETuqjpSch51S?=
 =?us-ascii?Q?F7gMXyomZrs2lEnhzTxazEUxFluYrYyfGSO095D0hfXfabFjdXLebrAdl4JF?=
 =?us-ascii?Q?f4SAymIk8pDAft7snfMxySd+GEatZdzOTY/4X7zIYK+LShMIOI5S3tJgAMQW?=
 =?us-ascii?Q?SUSacZnzoCxwNNUVJGfoYla7nNOTAlA9Le0gubwcYxIyeJtT/SMGILHY1Uy5?=
 =?us-ascii?Q?wexqkWvnrZo8z00+Wp9QGChnUHjBwSSTeHQLsgh2VIriJJhY0Etv2pplaBN0?=
 =?us-ascii?Q?9iedMkbwHs7Te4kc64EB7bM4k25NUx7HWO9QdFV5+OPknu/AImLGuiI6/U8d?=
 =?us-ascii?Q?CiPU40d5nIY7okPWXtQenFwaWAhs/vyhuoVn+Y986x/59YyWn0iLLDzOWb2v?=
 =?us-ascii?Q?sQeXn3FQhSldHyRTjbLyRXa77h729ko8gggRyOeH/3BmV8TcTDOSkcgr8PST?=
 =?us-ascii?Q?i1pCYCq6FkzAVUWU8onm4ui0kU3P7n7a9zTp42ujWJ7eSN2aCW9mCpD14qpR?=
 =?us-ascii?Q?DnVUrpAHgCglh0l4U3KdZGYiVLcP7/J7IqmQaXb4lopwGajCPx3UgJtJUU/G?=
 =?us-ascii?Q?mJBlJK0A6eMtlT95S9QlBL8ZBJxu8jPMD5FM4tOcsP8EiSardC319tn3RjW/?=
 =?us-ascii?Q?/1pp+zFMCPX70lknlpk/hREPafg+Q1zUsmKx+prUkhpF6+wvcspMo0GEp3TH?=
 =?us-ascii?Q?ye29QBbnM23F5IExj/GLTP49IDUXRfja5MR3ZY39+wZBtEPTiC6jvbMLqoFR?=
 =?us-ascii?Q?CxcnYFwd7R0agQl788LKhJ6gyhh3+UsxKvMJ/DcJvoIR6l3XUqHppkUF/J8z?=
 =?us-ascii?Q?3I+kWtPYKsMpkP/eKZ/C/vo5U9fT16HfcxIHzM29PsldSYpET/7D0xxxiLYa?=
 =?us-ascii?Q?jRGb3vlivuB/xxRvrtu/mW8xp3JA8U6WpNOKrYv+IVgHUNostMLcxXaYCD2B?=
 =?us-ascii?Q?qxmxxyFHVEPQ+hT3vDcsb2XCOZ2w1ZV77Cjw0TtbftwM86RYelmq02JvG4U4?=
 =?us-ascii?Q?QSsX7sWeHeHsTTfvOnRQ65CSuXtkRLpnp1of00Cv6TCLrJfpIpSeSXGXSffR?=
 =?us-ascii?Q?tlkFKtMsss92TXZnFKKjjBhXyMFvuMKStofHLoDfXSDCH0YR/T6TcjuI9t58?=
 =?us-ascii?Q?CMcXSa2We/Y847I5c3hZWVhzlxOMUKt6zVAwUC2u2hpK4RFoLPAhcsJRiUuX?=
 =?us-ascii?Q?OqJO/Bv/S01quhv+0ysA/LgKv4O2pyQGiQd5EHTWOGiH66wR2CWzWB8Qk4WF?=
 =?us-ascii?Q?jw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 05db9a02-0a3f-4b47-f6ce-08de376fb4c2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 22:10:04.8783 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wXWvs0QScAnEKZlYLtcjPGTzSyhxCFlZvMsLJhiQKNZFrC/2YpyBTgN3ZTtBdd/pAj3n9jKCatPO+mwv3/AkOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8580
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

On Mon, Dec 08, 2025 at 07:20:59PM -0800, Niranjana Vishwanathapura wrote:
> As all queues of a multi queue group use the primary queue of the group
> to interface with GuC. Hence there is a dependency between the queues of
> the group. So, when primary queue of a multi queue group is cleaned up,
> also trigger a cleanup of the secondary queues also. During cleanup, stop
> and re-start submission for all queues of a multi queue group to avoid
> any submission happening in parallel when a queue is being cleaned up.
> 
> v2: Initialize group->list_lock, add fs_reclaim dependency, remove
>     unwanted secondary queues cleanup (Matt Brost)
> v3: Properly handle cleanup of multi-queue group (Matt Brost)
> v4: Fix IS_ENABLED(CONFIG_LOCKDEP) check (Matt Brost)
>     Revert stopping/restarting of submissions on queues of the
>     group in TDR as it is not needed.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

So either in this patch or patch 13 we need a fixme for the TDR part to
avoid possible memory corruptions in convoluted scenarios. We can fixup
that part in this series [1]. Since we don't have hardware yet for this
feature out in the wild, ok with this series going in.

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

[1] https://patchwork.freedesktop.org/series/155314/

> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c       | 10 +++
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  6 ++
>  drivers/gpu/drm/xe/xe_guc_submit.c       | 86 ++++++++++++++++++------
>  3 files changed, 82 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 256e2ce1fe69..d337b7bc2b80 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -87,6 +87,7 @@ static void xe_exec_queue_group_cleanup(struct xe_exec_queue *q)
>  		xe_lrc_put(lrc);
>  
>  	xa_destroy(&group->xa);
> +	mutex_destroy(&group->list_lock);
>  	xe_bo_unpin_map_no_vm(group->cgp_bo);
>  	kfree(group);
>  }
> @@ -648,9 +649,18 @@ static int xe_exec_queue_group_init(struct xe_device *xe, struct xe_exec_queue *
>  
>  	group->primary = q;
>  	group->cgp_bo = bo;
> +	INIT_LIST_HEAD(&group->list);
>  	xa_init_flags(&group->xa, XA_FLAGS_ALLOC1);
> +	mutex_init(&group->list_lock);
>  	q->multi_queue.group = group;
>  
> +	/* group->list_lock is used in submission backend */
> +	if (IS_ENABLED(CONFIG_LOCKDEP)) {
> +		fs_reclaim_acquire(GFP_KERNEL);
> +		might_lock(&group->list_lock);
> +		fs_reclaim_release(GFP_KERNEL);
> +	}
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 1c285ac12868..8a954ee62505 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -58,6 +58,10 @@ struct xe_exec_queue_group {
>  	struct xe_bo *cgp_bo;
>  	/** @xa: xarray to store LRCs */
>  	struct xarray xa;
> +	/** @list: List of all secondary queues in the group */
> +	struct list_head list;
> +	/** @list_lock: Secondary queue list lock */
> +	struct mutex list_lock;
>  	/** @sync_pending: CGP_SYNC_DONE g2h response pending */
>  	bool sync_pending;
>  };
> @@ -145,6 +149,8 @@ struct xe_exec_queue {
>  	struct {
>  		/** @multi_queue.group: Queue group information */
>  		struct xe_exec_queue_group *group;
> +		/** @multi_queue.link: Link into group's secondary queues list */
> +		struct list_head link;
>  		/** @multi_queue.priority: Queue priority within the multi-queue group */
>  		enum xe_multi_queue_priority priority;
>  		/** @multi_queue.pos: Position of queue within the multi-queue group */
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 0282c8642a13..ec9571ddef08 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -577,6 +577,45 @@ static bool vf_recovery(struct xe_guc *guc)
>  	return xe_gt_recovery_pending(guc_to_gt(guc));
>  }
>  
> +static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
> +{
> +	struct xe_guc *guc = exec_queue_to_guc(q);
> +	struct xe_device *xe = guc_to_xe(guc);
> +
> +	/** to wakeup xe_wait_user_fence ioctl if exec queue is reset */
> +	wake_up_all(&xe->ufence_wq);
> +
> +	if (xe_exec_queue_is_lr(q))
> +		queue_work(guc_to_gt(guc)->ordered_wq, &q->guc->lr_tdr);
> +	else
> +		xe_sched_tdr_queue_imm(&q->guc->sched);
> +}
> +
> +static void xe_guc_exec_queue_reset_trigger_cleanup(struct xe_exec_queue *q)
> +{
> +	if (xe_exec_queue_is_multi_queue(q)) {
> +		struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
> +		struct xe_exec_queue_group *group = q->multi_queue.group;
> +		struct xe_exec_queue *eq;
> +
> +		set_exec_queue_reset(primary);
> +		if (!exec_queue_banned(primary) && !exec_queue_check_timeout(primary))
> +			xe_guc_exec_queue_trigger_cleanup(primary);
> +
> +		mutex_lock(&group->list_lock);
> +		list_for_each_entry(eq, &group->list, multi_queue.link) {
> +			set_exec_queue_reset(eq);
> +			if (!exec_queue_banned(eq) && !exec_queue_check_timeout(eq))
> +				xe_guc_exec_queue_trigger_cleanup(eq);
> +		}
> +		mutex_unlock(&group->list_lock);
> +	} else {
> +		set_exec_queue_reset(q);
> +		if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
> +			xe_guc_exec_queue_trigger_cleanup(q);
> +	}
> +}
> +
>  #define parallel_read(xe_, map_, field_) \
>  	xe_map_rd_field(xe_, &map_, 0, struct guc_submit_parallel_scratch, \
>  			field_)
> @@ -1119,20 +1158,6 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
>  			       G2H_LEN_DW_DEREGISTER_CONTEXT, 2);
>  }
>  
> -static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
> -{
> -	struct xe_guc *guc = exec_queue_to_guc(q);
> -	struct xe_device *xe = guc_to_xe(guc);
> -
> -	/** to wakeup xe_wait_user_fence ioctl if exec queue is reset */
> -	wake_up_all(&xe->ufence_wq);
> -
> -	if (xe_exec_queue_is_lr(q))
> -		queue_work(guc_to_gt(guc)->ordered_wq, &q->guc->lr_tdr);
> -	else
> -		xe_sched_tdr_queue_imm(&q->guc->sched);
> -}
> -
>  /**
>   * xe_guc_submit_wedge() - Wedge GuC submission
>   * @guc: the GuC object
> @@ -1625,6 +1650,14 @@ static void __guc_exec_queue_destroy_async(struct work_struct *w)
>  	guard(xe_pm_runtime)(guc_to_xe(guc));
>  	trace_xe_exec_queue_destroy(q);
>  
> +	if (xe_exec_queue_is_multi_queue_secondary(q)) {
> +		struct xe_exec_queue_group *group = q->multi_queue.group;
> +
> +		mutex_lock(&group->list_lock);
> +		list_del(&q->multi_queue.link);
> +		mutex_unlock(&group->list_lock);
> +	}
> +
>  	if (xe_exec_queue_is_lr(q))
>  		cancel_work_sync(&ge->lr_tdr);
>  	/* Confirm no work left behind accessing device structures */
> @@ -1915,6 +1948,19 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>  
>  	xe_exec_queue_assign_name(q, q->guc->id);
>  
> +	/*
> +	 * Maintain secondary queues of the multi queue group in a list
> +	 * for handling dependencies across the queues in the group.
> +	 */
> +	if (xe_exec_queue_is_multi_queue_secondary(q)) {
> +		struct xe_exec_queue_group *group = q->multi_queue.group;
> +
> +		INIT_LIST_HEAD(&q->multi_queue.link);
> +		mutex_lock(&group->list_lock);
> +		list_add_tail(&q->multi_queue.link, &group->list);
> +		mutex_unlock(&group->list_lock);
> +	}
> +
>  	trace_xe_exec_queue_create(q);
>  
>  	return 0;
> @@ -2142,6 +2188,10 @@ static void guc_exec_queue_resume(struct xe_exec_queue *q)
>  
>  static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
>  {
> +	if (xe_exec_queue_is_multi_queue_secondary(q) &&
> +	    guc_exec_queue_reset_status(xe_exec_queue_multi_queue_primary(q)))
> +		return true;
> +
>  	return exec_queue_reset(q) || exec_queue_killed_or_banned_or_wedged(q);
>  }
>  
> @@ -2851,9 +2901,7 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  	 * jobs by setting timeout of the job to the minimum value kicking
>  	 * guc_exec_queue_timedout_job.
>  	 */
> -	set_exec_queue_reset(q);
> -	if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
> -		xe_guc_exec_queue_trigger_cleanup(q);
> +	xe_guc_exec_queue_reset_trigger_cleanup(q);
>  
>  	return 0;
>  }
> @@ -2932,9 +2980,7 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>  	trace_xe_exec_queue_memory_cat_error(q);
>  
>  	/* Treat the same as engine reset */
> -	set_exec_queue_reset(q);
> -	if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
> -		xe_guc_exec_queue_trigger_cleanup(q);
> +	xe_guc_exec_queue_reset_trigger_cleanup(q);
>  
>  	return 0;
>  }
> -- 
> 2.43.0
> 

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FFE4C88E72
	for <intel-xe@archiver.kernel.org>; Thu, 17 Sep 2026 20:10:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2ABF10E4BF;
	Thu, 17 Sep 2026 20:10:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IWGnywud";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D77D10E4BF
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Sep 2026 20:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789675814; x=1821211814;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3PFtYi4MDFDxKvZfXb4kS9uRxrt2LvyMZxfWTEPl96o=;
 b=IWGnywudA1F+3jYI+UmfK3sOyYyrkzQ7wIyFHVurar0YEvHxIkpdryB+
 TgE7bAwoTmV7RO9outkS/bMzidG+tm8YI/0xRKDkUXi48UmcPfoSCxT6L
 2RUt9osF6ClOr+E1xizENMQHlD1oeoqJEzlISlAjPfN87RuMmxt4ssxmn
 2ezL6hoK2Xrw3vvUui8f578tyA5X8BKFDEwMHB4ae3LtNW26OKG1/Bybf
 cf2WOdnr8bYwaaQv8NtDHczUeYzHgabB0IsF1FaYzyBbWD+8TxRHyId8k
 V+Wu93w/Du9x5sJb4NumzeDRubDhSoLom2x/bdAq+dmSSr/o3d2SSJ3aP Q==;
X-CSE-ConnectionGUID: iLPEG/3MRZy2QwYfmTskwA==
X-CSE-MsgGUID: L3MXlYszRiiEC0ojMaCpEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="101486344"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="101486344"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 13:10:14 -0700
X-CSE-ConnectionGUID: qV5rfgDkQI+jFjQmiFw+xA==
X-CSE-MsgGUID: ca3ZKW/fSkK0CbNOz5/pHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="2208070"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 13:10:14 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 13:10:13 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 17 Sep 2026 13:10:13 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.15) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 13:10:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KdFzYf6wc68CXq4DCor3PJTG+ubf54oXqwUNeRFdggtX3+c9WcATbQKg1JvmCLVLhOzjM+4YMUnx4j/7zBo7l3GyElpKDRy9Kpn0CGrGDsgLFLfEC8ORIwakrjybJ5Y31aVY0iUD96pzowevUwkjqdLKTCrzuWfDPR27t9lJma5vnypc8TEfCzVhyIgW/tr/MTCUjXfOdzt64WDyWj0UKYAoK5F1g10kU1PvZhm4Wf0alVmeuTDcerBrzvBAnWOawYIvjWX6k5bSP5g31Jkf0c7Ngw8r0cO9nWBVilYgwHsuZZIEMoStmN0cQBiy+KXdecY5xF5C3NPPFO271LqQ+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WMe8Yumh3pHnrlzlIGCECUShzDCjkPyb/tNiAsQPM00=;
 b=avxkxrgsjQAe3KbAtINoy7p1dc6Zg4OHpDvGZfD+j2Dr3NLe0VotIrzmxj67SFrHjsImV+ZemIutMZZrVbGJB7UTRlpGkE4Y47FAv6HRBtH3Yf1tlWfeQwv5QANv2JcsUT45ku48n0dairBMDfmnvn+uqsG3dDa55Bpj58YVEgqxXbKU0XMVrEmIzgG9yNWdExii7YcPAGkogn9EFQynuz4F9lHEn0Ukz9gPp0tppywZgAXnnF6K8xXv3E3svynIg4DBOju7Eym3niOsXMDhrKTtXVn4v+SncjLP9gf067oyoK+U5gmQqemgnKIgKPt5uQ68ouBsfgMtZXw3M7g5Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by CY5PR11MB6416.namprd11.prod.outlook.com (2603:10b6:930:34::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.13; Thu, 17 Sep
 2026 20:10:08 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0428.011; Thu, 17 Sep 2026
 20:10:08 +0000
Date: Thu, 17 Sep 2026 13:10:05 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stuart.summers@intel.com>,
 <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH] drm/xe: Skip schedule disable for an already reset exec
 queue
Message-ID: <aqxJHcGb0Krg2ccC@gsse-cloud1.jf.intel.com>
References: <20260917193838.564857-2-jagmeet.randhawa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260917193838.564857-2-jagmeet.randhawa@intel.com>
X-ClientProxiedBy: MW4PR04CA0110.namprd04.prod.outlook.com
 (2603:10b6:303:83::25) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|CY5PR11MB6416:EE_
X-MS-Office365-Filtering-Correlation-Id: e520b2a9-1da7-46dd-e346-08df14f7aba1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|56012099006|5023799004|11063799006|6133799003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: w83EwLYEXyB/27q22/xYs2+2DO4Cqn5Ap4/pBM2CP/Q5kbk+3LUnTGArlRuPbVHCG9BIpuTEGx50bkyuM+8kpkiFjXcqeMcQeq8LpLl2Nct56PSiY0jaBiQwDPQRtXZxhNXMokYMC1m+vORLtB8dRqH3d7q6JiV9edk0kH/4nljshkUaSuVIsHW4dJ9Q4gM1YYqR5ZNzUE4Pnhbpv4Ysc1tPfeptu0BymSAD6qpiCE0GyZ9fA2v3x39brELUgFd+B3iQ3i+HXHGpZR0uvhIP7ckC3v6WgmYgR4LABLTa9eEFHgE3vuXtJ92HFoj7LFZOgHmVHTDd91cifJhmLQzsEutZagvTh/oPb2BEVZ12+lxGY/CrlaUas7t3XXiQuAK0kRrt1ERU9X0bf2Gs+TykYn3GsYidRi9td0ExhNkMelyqKHr9m/9x/nNqxn08Aed4QDzDbVxlOIf/yarUKKy+1JLxS/Pju/MtD1NyjlhvehqsfDcId5NExqOljPyhPAQOGxlinFgH+GKS9aAxxm7qvMrE2lDQgPYcDBUc+pUqi0zfVy7gE7fqKCtbcSJXzkxtlghGg/3mslpJSBpwfF+i+x5JpfDEaQ4x6YsRUUiDAvaR22L5NE+m7wn7duw24WzBhvHsytC8v2hJfZPtAITWoF0l0owior255jjwBJGRXvk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(56012099006)(5023799004)(11063799006)(6133799003)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LaIHuSP9KlsKS7kjndSjjB7+o79v0VwDDZqj0KK1A6xe4cnoifj0sMecAGbX?=
 =?us-ascii?Q?cvVR5vbRz07Pt36WvqNrmTBY6FttcB0ZZatTDzmJrwEr8DgbFgh0nwSpoIP7?=
 =?us-ascii?Q?qBqaJteQ9iLyAm0beCWK8GdK9XLcECNxk3oKSx5lwN+ZztAUhWGL6SfqS2su?=
 =?us-ascii?Q?CPNB43TfwqQwgXJbNJCL8/1lYUyrm8dprl7d+ZUAf8IYpzVlyKWFqtdQctlM?=
 =?us-ascii?Q?PpFJ1/y7IjEE5HTDCnHMFMeaKt+qy4PoCL8BJPODqh+z/ZuLTOW+BQ1LZYc9?=
 =?us-ascii?Q?SMa+AcigfcyMkzGXj1xCwCgWwrnLl1I+RTK2DZaJBRCm4CR/TeyoPv9FQw0c?=
 =?us-ascii?Q?huwZf0WWOO24/eNPEgGw0isXYKKCtecDipkbc0sEOf6LYV+EVJskIU3biAiG?=
 =?us-ascii?Q?2pMy16KyBsjslmj99qPb2ohHE9Bff9DR1PUfvzW0gVCAtafTOrb9R+t23pVs?=
 =?us-ascii?Q?9NNRUcsk8FPR3t/rEm7G1N8lzQGkuDNsrjcIBfsMHrhQkeJrLsSjRKm55d/k?=
 =?us-ascii?Q?sAcCzr9PitsKhfN4FWO6ihvsFyjBJ6T+9eog2HdtB8Km4MVEu+hQK8K7HJsA?=
 =?us-ascii?Q?JwZWX9r2GSTpSXOTfCNkArT/XSRRGdp5JvaS/0R7SKc+dcInrD/GrDbwdewH?=
 =?us-ascii?Q?6Zt2A+cfS+tNVvptUSdawDOCjHh0v0N/P/U2+62hv10BXKL6zvuomSX4/1Ev?=
 =?us-ascii?Q?fcK0rG9w+Vwj5OWrkpT5KIqgVgP1bfVfPrqSxeUPayhKFY30l4fQIVUS2zyy?=
 =?us-ascii?Q?ZHcMD63wSipkEdOOMsg5I6MIvGYq20jlLPQ4lxfdsVqQUNbcPw4l1hJ/FEdY?=
 =?us-ascii?Q?v/qsHPEuzGZc3tte2uY6us0puR2uaTO879jhPlDI9AQrKt+Rq/CvHk5h530z?=
 =?us-ascii?Q?Zwtg2p3X+hcW2/IKkouZeKvOzzLFWQz7bfOQts9qzm/IlCsKctsFNSJ6wZYP?=
 =?us-ascii?Q?SHwwb1BylK07pIJ9zZxnLfb0FXn8mzcRIRPFJjdKPOWH9LoBFjZrmoSSZ2bD?=
 =?us-ascii?Q?G+hMltAsY2hinAsdphkt48TDAZqIjZSu4b80+Df8sWjylJmKTMdRpqi+9KY2?=
 =?us-ascii?Q?it8wfTcY/tZIhoV4oP6DCkrfj+L88uGPClD57e0MxVXuTAClSYuqZqr5WeNn?=
 =?us-ascii?Q?m1JBzq1GrApQ79e0EAsGvOXB1l52FWPBYifkUCeAteentTZz8V9fI8pI3FEC?=
 =?us-ascii?Q?gAgoVwBsTybgI0oAcoz5yp4Sk3nmnmVApNhLQk756CKh1IYOO1BVo92CnCSl?=
 =?us-ascii?Q?MRvOPwcqVJ3XpMSsKbCo5Jjch7gYEYlYv8hMpZPiBEMI1gDMG9EtFtu0cThw?=
 =?us-ascii?Q?P/XLM+LIjAwx3F0RdnGRDqKhCk7yjYGkK71BN3wwGaZnB2V6Y050ikNjlC9Q?=
 =?us-ascii?Q?BKAO9tlPgvUXJFXzkZScnHrnr2wTe7nxREDKn3p3CP3jaa+88zK7j+EeRpnp?=
 =?us-ascii?Q?cgZE0wqnzdsDTX3sSpymC0BXrIxyTXfVPuRbahw2sEUXy8qOW69asGyVA+H5?=
 =?us-ascii?Q?vDm9F5u4rHtHuuB2FuaOc4kigJ1THUu3ehUuD03Er2/v62u+KWGbtgTaeitQ?=
 =?us-ascii?Q?aSyj9oTMxOzR7cXZvjc12yH1Q+vcO/f31QUVeadNxzFjcHh6Djy3l7oaE7wA?=
 =?us-ascii?Q?Af3FLpXcen0vmFgOueXMFQQe6ulgU8b1OyA/AtEQmfaa7cppFbYRlZZndjeu?=
 =?us-ascii?Q?rC/tFoRctz3jYRi4Hnnm5q1tYhm/oAdJnjk78L0y6x8M7wkwlIg0bz0df6ka?=
 =?us-ascii?Q?0Vmgk9NUz0qrFy8SqkqtTZAKbeBqpL4=3D?=
X-Exchange-RoutingPolicyChecked: JoZMRN0TewV1qwHAQIH1n3/aWPj0IS0MDq3KDVUfFiuXDLGJWW0Qm3yc0wOf7HaE4tXzvabhyaLI/t86yWfh1iHvS8nUScFb9HmxEBqwuimVl0JyF0fFmlPwTAKK/FX6zwapxM+nRf8VFO7zlj0oJezIoubDWnAE5ulCvC3grM0Be4FImOHZwLpawoN1QkeAWw58LR7sXrKy2mhRJWcQh+3hJ41nx/dGu09OTQh+6GYR7ZB2fTVcXJacDnVwhP+XsHogrZYBW/D6Gvt/0rSADjMXqM61MCvjsfuNZjtD7JgXrvmb6DwPm4glQHwr9rXdwIW6YXka4vkmCYvs5YWVLQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: e520b2a9-1da7-46dd-e346-08df14f7aba1
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 20:10:08.0366 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /9HueUO5c03JdJAaZbyFSF0qXzZm1VLOQmZUPCSfDs9Zzs7xrEzNMyMynf2L+YUuEhgc0zVIv7ET/r27rO3Nwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6416
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

On Fri, Sep 18, 2026 at 03:38:39AM +0800, Jagmeet Randhawa wrote:
> A memory CAT error causes GuC to reset the offending context and notify
> the driver. xe_guc_exec_queue_memory_cat_error_handler() treats this the
> same as an engine reset and calls xe_guc_exec_queue_reset_trigger_cleanup(),
> which sets EXEC_QUEUE_STATE_RESET.
> 
> Roughly 200us later the TDR runs for the same queue. It reads
> exec_queue_reset(), uses the result only to set err = -EIO, and then sends
> a schedule disable (H2G SCHED_CONTEXT_MODE_SET) anyway. GuC has already
> destroyed the context, so no SCHED_DONE is ever returned. The TDR then
> waits out its HZ*5 timeout, reports "Schedule disable failed to respond"
> and calls xe_gt_reset_async(), escalating a per-context failure into a
> full GT reset that kills every context on the tile and reloads GuC.
> 

There is a mode where a CAT error or GuC queue reset disables scheduling
or tears down the context, but we do not enable that mode.

I see there is a multi-queue related issue mentioned below, and it is
certainly possible that we have a bug there. However, I'm fairly
confident that this patch will break non-multi-queue flows.

On my BMG system running drm-tip:

On my BMG + drm-tip:

cd /sys/kernel/debug/tracing/events/xe
for f in xe_exec_queue*/enable; do
    echo 1 > "$f"
done
cd -
cd /sys/kernel/debug/tracing/events/xe
for f in xe_sched_job_*/enable; do
    echo 1 > "$f"
done
cd -

root@DUT6235BMGFRD:mbrost# xe_exec_reset --r cat-error
IGT-Version: 2.5-gaccf33cc6 (x86_64) (Linux: 7.3.0-rc3-xe+ x86_64)
Using IGT_SRANDOM=1789675008 for randomisation
Opened device: /dev/dri/card0
Starting subtest: cat-error
Subtest cat-error: SUCCESS (0.027s)

The in ftrace:

 38    kworker/u64:2-130     [012] .....   265.216703: xe_exec_queue_memory_cat_error: dev=0000:03:00.0, 0:0x1, gt=0, width=1, guc_id=2, guc_state=0x3, flags=0x0
 39    kworker/u64:2-130     [012] .....   265.217326: xe_exec_queue_scheduling_disable: dev=0000:03:00.0, 0:0x1, gt=0, width=1, guc_id=2, guc_state=0x249, flags=0x0
 40    kworker/u64:6-154     [011] .....   265.218858: xe_sched_job_free: dev=0000:03:00.0, fence=00000000ba06a299, seqno=4294967169, lrc_seqno=4294967169, gt=0, guc_id=3, batch_addr=0x0    000001a04a0, guc_state=0x3, flags=0x0, error=0
 41    kworker/u64:4-134     [000] .....   265.219506: xe_exec_queue_reset: dev=0000:03:00.0, 0:0x1, gt=0, width=1, guc_id=2, guc_state=0x249, flags=0x0
 42    kworker/u64:4-134     [000] .....   265.219507: xe_exec_queue_scheduling_done: dev=0000:03:00.0, 0:0x1, gt=0, width=1, guc_id=2, guc_state=0x249, flags=0x0
 43    kworker/u64:2-130     [012] .....   265.219518: xe_sched_job_timedout: dev=0000:03:00.0, fence=00000000f8118031, seqno=4294967169, lrc_seqno=4294967169, gt=0, guc_id=2, batch_addr    =0x0000002a0000, guc_state=0x241, flags=0x0, error=0
 44    kworker/u64:2-130     [012] .....   265.242149: xe_sched_job_set_error: dev=0000:03:00.0, fence=00000000f8118031, seqno=4294967169, lrc_seqno=4294967169, gt=0, guc_id=2, batch_add    r=0x0000002a0000, guc_state=0x241, flags=0x0, error=-5
 45    kworker/u64:2-130     [012] .....   265.242154: xe_sched_job_free: dev=0000:03:00.0, fence=00000000f8118031, seqno=4294967169, lrc_seqno=4294967169, gt=0, guc_id=2, batch_addr=0x0    000002a0000, guc_state=0x241, flags=0x0, error=-5

Lines 39, 43, 44, 45 are the TDR.
Lines 38, 41, 42 are the G2H handlers.

It isn't safe to signal a job's fences until scheduling has been
disabled, as that is the point at which we know the queue is no longer
accessing memory. A job's fence is what prevents the associated memory
from being moved while the job may still be touching it.

After you change, the above test takes ~4 to complete too.

Please rethink this patch.

Matt

> The failure is intermittent because the enclosing guard is
> (exec_queue_enabled || exec_queue_pending_disable): it is a race between
> the CAT error cleanup and the TDR. When cleanup wins the block is skipped
> and recovery is clean; when the TDR wins the disable is sent and the
> timeout fires.
> 
> Skip the handshake entirely when the context has already been reset. The
> send, the HZ*5 wait and the GT reset escalation all live in the same block,
> so a single condition removes all three. err = -EIO is preserved so
> userspace still receives the correct error, and execution falls through to
> the normal cleanup path, which performs the deregistration.
> 
> This matches existing behaviour elsewhere in the driver:
> xe_guc_exec_queue_reset_handler() calls the same
> xe_guc_exec_queue_reset_trigger_cleanup() and performs no disable
> handshake at all. The TDR path was simply inconsistent with it.
> 
> Evidence, captured with existing ftrace events only (no instrumentation):
> 
>   Healthy acknowledgements take ~350us:
>     4806.244755 xe_exec_queue_scheduling_enable  guc_id=2 guc_state=0x7
>     4806.245126 xe_exec_queue_scheduling_done    guc_id=2 guc_state=0x7
> 
>   The failure:
>     4806.245395 xe_exec_queue_memory_cat_error   guc_id=2 guc_state=0x3
>     4806.245592 xe_exec_queue_scheduling_disable guc_id=2 guc_state=0x249
>                 <5.18s, no scheduling_done for any guc_id>
>     4811.425872 xe_sched_job_timedout            guc_id=2 guc_state=0x200
> 
>   guc_state=0x249 is REGISTERED|PENDING_DISABLE|RESET|BANNED. The RESET bit
>   confirms the exec_queue_reset() branch was taken and the disable was sent
>   regardless. scheduling_done never fires, so handle_sched_done() never runs
>   and the acknowledgement genuinely never arrives.
> 
>   With the fix, scheduling_disable is traced at guc_state=0x2d9
>   (adds DESTROYED|KILLED), i.e. it now originates from
>   disable_scheduling_deregister() on the normal cleanup path, and GuC
>   acknowledges it every time.
> 
> Testing:
>   igt@xe_exec_reset@multi-queue-cancel               0/10 failures
>                                                      (baseline 10/10 failures)
>   igt@xe_exec_reset@multi-queue-cancel-on-secondary  passing
>   Subtest runtime drops from ~5.2s to ~85ms.
> 
> Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index f3ba8abfc228..03450590042a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1609,14 +1609,20 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  		atomic_or(DRM_XE_EXEC_QUEUE_BAN_REASON_GPU_HANG, &q->ban_reason);
>  	set_exec_queue_banned(q);
>  
> +	/*
> +	 * GuC already reset this context (the CAT error handler treats a CAT
> +	 * error as an engine reset), so there is nothing left to disable and
> +	 * SCHED_DONE will never arrive. Skip the handshake rather than waiting
> +	 * HZ*5 and escalating to a full GT reset.
> +	 */
> +	if (exec_queue_reset(primary))
> +		err = -EIO;
> +
>  	/* Kick job / queue off hardware */
> -	if (!xe_device_is_in_reset(xe) && !wedged &&
> +	if (!xe_device_is_in_reset(xe) && !wedged && !exec_queue_reset(primary) &&
>  	    (exec_queue_enabled(primary) || exec_queue_pending_disable(primary))) {
>  		int ret;
>  
> -		if (exec_queue_reset(primary))
> -			err = -EIO;
> -
>  		if (xe_uc_fw_is_running(&guc->fw)) {
>  			/*
>  			 * Wait for any pending G2H to flush out before
> -- 
> 2.53.0
> 

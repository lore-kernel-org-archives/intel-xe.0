Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 214EDCD98CE
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 17:04:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8F8910EAA4;
	Fri, 12 Jun 2026 17:04:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IToA7kHn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E77110EAA4
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jun 2026 17:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781283845; x=1812819845;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=LzCdOQomHIjIJyfeQiXX5UrP71CGAwkrVug+EAsrego=;
 b=IToA7kHnrjx/v8VMZoDc5HyhN9+aXrfZ4jcGvgbZ8xzmuyCSdML1na/4
 UbUPOIRrFsYSMos1SnDXvoM4zj6P2P9o/1fILrvy2vNoxGgDPMGkAsVLQ
 5YUT791+z8O4py9+QDayeQ0ioIieHIdcn5mmoyyzAXzbXly10jQxzrJGt
 BKDFw9X3L/2OzXljSZ7XArWE4p2Na7FPI0dig4qO/rfFgmECsV0ARUSKC
 D/9tXdCl+s5+yB2D2eQjOCXfMGFairKLxY3eo4GNfzy7mGBZ8sCDqibke
 kAN6WsHY0cnIKXsxt1d0YO1pLFiEJMNujCMDS9JUE90aSweaN5QJzYZYz g==;
X-CSE-ConnectionGUID: ShcVfX9XQra0aPwKCr0Mvw==
X-CSE-MsgGUID: ATIGVlGjQ0KvcoQhL9t/hQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="92683374"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; d="scan'208";a="92683374"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 10:03:34 -0700
X-CSE-ConnectionGUID: VNWTohnsS0Car4lmZK7pMA==
X-CSE-MsgGUID: Sr/EFQ/9SmqlICwTZFag8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; d="scan'208";a="284971784"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 10:03:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 10:03:33 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 12 Jun 2026 10:03:33 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.52) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 10:03:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f/pcTGR7NrXz0j/kHDuUs99HLchh5dzToshyZXrV7aVKunuoLrxdv4C8FJaiRYtRZqzGrf6Sqipa/E6IJdrbGCbkANKV6Fq+DTn25uXLCATvhYivMIIatwgER0oCX8RTt/H/piiigPEsRvS3FpoVqLMmuqxezOI6fty5iSrAM4UuoG7TLM55I48xWsNMb0vHCTf1EWEbORrIzG+N54R2wUEEOJt0q4cNDNSA8yd+3h/Xxs0hhxoSkCyFuBMh0rzVSr5uvoKN4OwRIasECxuNPYTdjsM/JpEUjB5Pawf+e4nNFm43eM/Ns/gs/wNGJ8OFTl6pgW1WeggGmqa9L+1d1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YtAyimzo4T+BV69bN+fYKcdFdcMb2+DwsUveADa05zU=;
 b=dQFXa8Mgpu7J2adAWIlMaV3A6Na+2590aUwLxF8gCZzmC/J5rv9V2z+HyH/Ko8ZL9pymcKUwAF5oCrQeyJ07IojgNkmYpIOFp7EbafmdY0W0OZGuRZkuTQJAYd9PijR71eRziAI2Ytd0QHDFMIBACMXNMV/FurP8NWy1EOfb9T/hctlhwcYQozrTVHcooQ4J/F2KLMF6my+8+oInNUP3VVbO6OEtYQd888hEepwBJiWAQYiRCTUv5qhXMj2oZgfEi7Sh/AByehd+eHbvj6CpGeceRd8piGcfwdNouEy3+EBHQYG9c2teZVK2S8lr71pY1CpLTiioNeExbCWMIMd6Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB4794.namprd11.prod.outlook.com (2603:10b6:806:f9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.15; Fri, 12 Jun
 2026 17:03:30 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 17:03:29 +0000
Date: Fri, 12 Jun 2026 10:03:27 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>, Sanjay Yadav
 <sanjay.kumar.yadav@intel.com>
Subject: Re: [PATCH] drm/xe: wedge from the timeout handler only after
 releasing the queue
Message-ID: <aiw73+FQFObSqx33@gsse-cloud1.jf.intel.com>
References: <20260612162414.287971-2-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260612162414.287971-2-rodrigo.vivi@intel.com>
X-ClientProxiedBy: MW4PR03CA0235.namprd03.prod.outlook.com
 (2603:10b6:303:b9::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB4794:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c13726a-f107-45d6-b956-08dec8a486ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|11063799006|56012099006|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: ER6aXh80MwTTf3SAlb8V3XCA6Jf7kkr3A/P5oel7aFbFtd8iA9MqYU4lpAkKrxmUwqA95KbC0vkagkhbUB0m6PLZnpYsRpp/m6ZGafTSA7ZTeCIolrVBAaW8Zvupns+8eAp+/x4JNBngS9C0sAWBbf+cjx/r/TGIctIpRE0TG/bL0mrg+zpHHBUMKds0RtShs6zY0/p62vH86e9jPc0jGmoKPXZFDfa9Wn7jbU7vWv7e2CGmwHTLBEovOlkCdv1d9WQXe9sBzdFer3XDXjFR3BsHqqjlZLZO7z4+nQVl9HV6FXddUi0Ini4fQ8ECBgm8ZH1jU6SGDsB7BUuVKmfvTvJZVwulP0XVV1j895v6zlTcKPn/TF2tqc+/O++Q5hfaoP4CG+8g8wAWoWZvamZbTiqooWJFphBvo71uXDFaP+W7H/jYjsDtgsX5LiXRzGNgvQHClS9dusaxtrYMZSkmMUdAhEqt3OB30OXwb5AlSi8JmUe3a+hWzPaE4zCdLbwYbKG8Ibrof5yCs3H4v5y0z73frM1x8x1oVRVHG2iUPV9rMtA8MjC3fzmmsuGQWL6THEF/q0gpG5ehidNn5hbNmnHg2jMe/osXxvpyOf5uWWbAlaupM1N0EKT2MxEAhmj8BzcBeVAvb7nat2/uMirecqMZx6qysQ6TdQ6knmQIOUEjYLl5mgBV6aSPxLdL/uGi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(11063799006)(56012099006)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHlTeExuUUtrTzZjVGZ6QW0wT0I1SDI0UkVjOGRRcjV5MGtNUmp4RjZQcUM0?=
 =?utf-8?B?OGlTMmtpZlJodEFwczJkTFFUd2d4QkNJSkxCSWNEWG9rZDYrOVNOMHJEK2Ji?=
 =?utf-8?B?MmljeXdnaVBZQlE1RUt4RVZ3Y2hRTHdIMnZ0cVc4aWxsSkQzemEvZVlUakYw?=
 =?utf-8?B?eDg0UVA5R1dZeER3cnRNellyM3Jta0hQbU10Y1ZuUHdVdCt2Z2pER2dGSkN2?=
 =?utf-8?B?YkdzUmlxd1JRVEFSSXBzVlNieXpvd3FXb2Z5SGhXc0FDbERscmlGN1NxT0E1?=
 =?utf-8?B?bmlLcXhUMjRUQmdZTEI0bm5HSVVxcG5IWnNIOHhjUjBtRk85ME96Y2ZNT1Qx?=
 =?utf-8?B?MnB2cElEeVpValFTVkh0dlJqcHVzNmoxMnIyYTFSYzEzQWJ0anFDRHp5KzI1?=
 =?utf-8?B?RVR6ZGNSSysxMVhNbHB4NXh3K3grWUNDcDh1NXpiWG5UTVNiMzJYaHBTejNk?=
 =?utf-8?B?b0szQTBhQmRvdmgyRGVDeUhjSmlxS1BSQTFKcEc3WkgyeHRjUFhIOEhkQ05t?=
 =?utf-8?B?MUlOeHgzbnlUVVpFeUJOTGNFSXFFVEU0UExQbS9iWjlycVlqbElpdjE5WTFF?=
 =?utf-8?B?ZEpiZ0lWU3l6cGgrdTYzZytBT29OVlBmTFR2WU1LYS9rUENXMEJRc0pubUYw?=
 =?utf-8?B?Rm9udlM2aCtjbjZycjVyVzdhY0U3UnZQNnRnS3FsbTAweU82VUVRa0t6YXBp?=
 =?utf-8?B?bm1kaHhxYWZvUlZ6d2pQcVBoQWlYdkNIZk9FMGRiMVBmWHpiUnJHL3FNdmlC?=
 =?utf-8?B?cEZxaUFjVEVBbnIzTUxKUVNYaHVaQW1BM05BdlZHNnpuanhCcFFNeFN2a3Qr?=
 =?utf-8?B?a1BRYldaS09jT3lMR25uWFFkZ2d5cHRVTXM0eFNlTzY5U2dzeTRPWjExWkNn?=
 =?utf-8?B?cGdLYkwyaTFYNTBSdkhIV1o4Q1NFU3pqZzdDRGZuUC9BYUtxRExuOGZ3Ym9B?=
 =?utf-8?B?YngraUgwU2dVZEpuZWNBV1VZUEVOcU5pYWpGekNNcHVsOGNpenBoNGFPU0hW?=
 =?utf-8?B?M2QvRkdWY3loa0NqVzZjODNtT1FXT0YrWXIyQVl0M1JsMW5zVWNCWnUzWENq?=
 =?utf-8?B?dFNnRGFWcE1iNkMyMGgyeUN0T3c2U2NGNHhicS9paHkrL3lhbWJtZ21WdEJY?=
 =?utf-8?B?UUVkYXhwa2lWMmNKeVRhcDF4N3Q0OWw5K3FwdXd5bjRrNExoclNOWGVJZ095?=
 =?utf-8?B?MmVCakdETmJSbU9mUmJISVBDejJQZS82UVBncWY4TkkzaStUdmRTN0xMUXFO?=
 =?utf-8?B?L3FsSmxod3FQZklhOTA4WDl5RnRoQjVZVERlYjZSTWgxR1YxbWNxT3FCUnBT?=
 =?utf-8?B?elVxem5MYitBUGZ2VUM0cWdaWHpLdUtyL1A3bXdQQ2dkdmtQUzR6eHRIM3NS?=
 =?utf-8?B?SWNNbWQ5bk5YTlplSzJERzU0MnNrdzllWUp2ZlZwR2NpZzJqNVpqYVhSRkFh?=
 =?utf-8?B?dERLS1lIWk1PSFNJcmhsRlNOYTU3YzVhb09jYVV2OE1ZeUhUdFpQdVRVY2Jx?=
 =?utf-8?B?YVU3KzNpYUNoN3hDaHdxMUVFUUlVMVlkTmpjVkxidWhWUUJwdmZCQmRmd2FB?=
 =?utf-8?B?anhYWHIrODVXemZSV1VnSlhRU1hlUWF0bUE3QzQ1aHlyTDhRb09oZzhyVVdv?=
 =?utf-8?B?Zys2cmt4ODRObDBUQjhxYUNsNHYxSnFoRGFOeWY0cWF0eVBjNU82Q0RqQnpE?=
 =?utf-8?B?ZkxkNWJTS1g2TW1sMGNLV3hjK2pxYktFUjFMcngzaEFnOUtYUEpkMUxGY05C?=
 =?utf-8?B?bVZiOE9qT0Z1dDVYZnd0RUdoeWd3anA5WFo1Z3o3aXFxNHBycjcrZ2ZBVVlS?=
 =?utf-8?B?TjU0cy9NdTgyaVNQTlJEL1BXdlFtOWc5VWFtM1hEdldRODZUMGZkZnFlRGZ1?=
 =?utf-8?B?THcrbUwxcnhYbFZ1dHVsYjBTeGtDZTlJWVg1cGlGM0dBL1ZuQjRBa0o2K0hC?=
 =?utf-8?B?Z3Jmd2VwYWY4K2Q1T2Y5OWFtTnd1elVwZTh4elhuNFJuaU5yNmJyazlWTCtV?=
 =?utf-8?B?YkhQWlBjbEZpSzFLL0NJZk5tVXcrRlY0bjErWmZoWm5Mc3NuV2c2enkrVEtD?=
 =?utf-8?B?VEhhK0gvTm5lTHdqTW5lTk8wOFlFUGdWSXdjTlVaS1lROFFmZE5kUC9wczJN?=
 =?utf-8?B?dGU4VUpIQTkxdGhMVlh2NkMweWx2WVlKYWJQTi9IbkljU2F2NG9USDJSVG1u?=
 =?utf-8?B?VHRpSjRCZHpNaU9iMWtyWVo0M1RDaXJzNDU4TVp2SDdNa3JhbG4zdXdkZzF2?=
 =?utf-8?B?L29iM2hwQ0VSTjE5aHB3c01ZRjNHbkpmSXRLcjBCQjlGLzNHNStURzFCRnht?=
 =?utf-8?B?WmdPUXZocDVCMHJPd0JscFlVWU9lejcxdjhEdVJmNUJuL000SlZiUT09?=
X-Exchange-RoutingPolicyChecked: kMvtbrSSHkRUFHPuGKZXaKBVZm3GChqasH7ary/cGJQxsh5zXnRapbPF/1abe58BrApBLyTX1BA92q5IC1EBPhQAdYKuuHJHsBvZN6MQcmlo33rZ3tNKWwlmj3czmtcdAGTY3GO4fUn5IaOFJyC4UksSqmdTXf2yKqOwEmi8+w+zkvtMtjp8m5k3t85tFCKGlnfJSZSHIsQFg6VegQvkxjeCASfdfXjNlX8EfMoZWzVZlsoFgpC4PivEMNGS/CSueC5isngSdRYjGcnEcQ4IGc4t0mXmumi1/MEbNHEF7yFDbxzVRNPktG6W1fokxAlZOqlx8kaF8bj1/0qhCFWDDA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c13726a-f107-45d6-b956-08dec8a486ec
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 17:03:29.8558 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i321Bll4KFuwSkPMjdM7Guj3MeJhBXs7VyG6Ow8+3gQmbGzQLtwkL3SAHOS40DOFJS3DOs0xD1dR4kMoBqHg/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4794
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

On Fri, Jun 12, 2026 at 12:24:15PM -0400, Rodrigo Vivi wrote:
> A kernel job that exhausts its recovery attempts called
> xe_device_declare_wedged() directly from guc_exec_queue_timedout_job(),
> while the handler still owned the timed-out job and the queue scheduler
> (sched = &q->guc->sched, stopped at the top of the handler).
> 
> In the default wedged mode (XE_WEDGED_MODE_UPON_CRITICAL_ERROR),
> xe_device_declare_wedged() takes the destructive path in
> xe_guc_submit_wedge(): guc_submit_reset_prepare(), xe_guc_submit_stop()
> - which calls guc_exec_queue_stop() on every queue, including this one -
> softreset and pause-abort. That tears submission down, signals the
> in-flight fences and restarts the schedulers. This is the correct
> behaviour when the wedge originates outside the TDR, but not when the
> TDR itself triggers it: every queue should be torn down except the one
> the TDR is currently operating on, which it still owns.
> 
> Control then returned to the handler, which kept using the now stale job
> and scheduler:
> 
>   xe_sched_job_set_error(job, err);
>   drm_sched_for_each_pending_job(tmp_job, &sched->base, NULL)
>           xe_sched_job_set_error(to_xe_sched_job(tmp_job), -ECANCELED);
> 
> drm_sched_for_each_pending_job() warns because the scheduler is no
> longer stopped (WARN_ON(!drm_sched_is_stopped())) and the iteration then
> dereferences a freed job, faulting on the slab poison:
> 
>   Oops: general protection fault ... 0x6b6b6b6b6b6b6c3b
>   RIP: guc_exec_queue_timedout_job+...
> 
> Defer the wedge until the handler has finished operating on the queue,
> right before returning DRM_GPU_SCHED_STAT_NO_HANG, so the teardown no
> longer races with this handler's use of @q.
> 
> Fixes: 347ccc0453fc ("drm/xe: fix job timeout recovery for unstarted jobs and kernel queues")

Technically, your original fix is exposing an existing bug in
xe_guc_submit_wedge()—it should not be toggling queue state from
anywhere other than the ordered workqueue that handles TDRs, GT resets,
and VF migrations. There are also a few other places where state is
toggled outside the ordered workqueue.

I’d like to fix this and harden the codebase by adding assertions for
functions that should only be called from the ordered workqueue. This
will require a larger rework, and perhaps some core-side support for
something like am_i_running_in_this_workqueue().

This is larger refactor and this patch looks good to fix the immediately
problem.

So with that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
> Assisted-by: GitHub-Copilot:claude-opus-4.8
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index e82018445b7c..afe5d99cdd8b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1493,7 +1493,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	struct xe_device *xe = guc_to_xe(guc);
>  	int err = -ETIME;
>  	pid_t pid = -1;
> -	bool wedged = false, skip_timeout_check;
> +	bool wedged = false, wedge_device = false, skip_timeout_check;
>  
>  	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
>  
> @@ -1638,7 +1638,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  			}
>  			if (q->flags & EXEC_QUEUE_FLAG_KERNEL) {
>  				xe_gt_WARN(q->gt, true, "Kernel-submitted job timed out\n");
> -				xe_device_declare_wedged(gt_to_xe(q->gt));
> +				wedge_device = true;
>  			}
>  		} else if (q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)) {
>  			xe_gt_WARN(q->gt, true, "VM job timed out on non-killed execqueue\n");
> @@ -1658,6 +1658,9 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  		xe_guc_exec_queue_trigger_cleanup(q);
>  	}
>  
> +	if (wedge_device)
> +		xe_device_declare_wedged(gt_to_xe(q->gt));
> +
>  	/*
>  	 * We want the job added back to the pending list so it gets freed; this
>  	 * is what DRM_GPU_SCHED_STAT_NO_HANG does.
> -- 
> 2.54.0
> 

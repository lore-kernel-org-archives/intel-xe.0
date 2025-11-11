Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3414CCF9E3
	for <intel-xe@archiver.kernel.org>; Tue, 11 Nov 2025 00:04:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ED1C10E101;
	Tue, 11 Nov 2025 00:04:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bLJY4JxQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D79C10E101
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Nov 2025 00:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762819443; x=1794355443;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RXskotU0of7Qe5XuU8GcPkk8nx4n6hwCCPUJTC9kc2c=;
 b=bLJY4JxQcS9wjlgzuDnqDcTQtNYvkAFPFWnMvuU2OMI64QM6pbDBdJ6E
 /IW9UMVTTcKS3Hq9/s9K0IYd6xp6X3y8/UbFDH0H3CbY/0LJP4LsGal0Z
 MH4hmecdTsACE/OufoSa4yPw14fz/kaJZgGwDMxAEvVKWXwPI+Ptb/VJg
 jRkmDdDhWYlv5u5KPJanKDnVQdJrJ32fnXEGRLQnXylSP6x3bxkLmB9d2
 xzHXQyVTyo4kVOBQxsLo/+ZxzFcBvsyp9jVRFq3YiKCtIP7gbDMmfVD9u
 J9JZabp+giBemt9ykr8W1ncfsSa7wUOFz9WQtNLw4JNur1ocfMyX/70CX Q==;
X-CSE-ConnectionGUID: ntq+S0PkRDyDjcLI4q7HEQ==
X-CSE-MsgGUID: fj7/Ra90TyOMIn49Ry9Lyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="76224009"
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="76224009"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 16:04:02 -0800
X-CSE-ConnectionGUID: tOuTBjf9R2qIX9zq1/W7nQ==
X-CSE-MsgGUID: LMRV7mY2Rb6nEh0t8U56Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="192925377"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 16:04:02 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 16:04:01 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 16:04:01 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.3) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 16:04:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xes4g2qvPNkPO5MaAQkRCOabqE7IMznKebuacc7lEePWv06NNFDf39nXSIK1+BzUfjtKmYvrT74CNXMLAxcJneOLwLnfUq734eG3VYNpUAiKJ2oWtNgBc/BAba+Ph4Ct2rMLLtYgc6yGwnrcRvACcBnYrYEKaTWZUtetH7/VM7jbLRwo6EBT9rUQMxwcrHyN2syoxPguZvUOWqd/5o4rqjmIG3iEZYraKN3AxmlcpLVHoCA7mfRT+ZeikWDDelM0l6ccJxerLV+P5EUGDs8tjtUJnLnZ8dmSHn3uPNuknCKECpe+mrvXpoFePefTCK6hkSy3wuPTccTdJbDXHTNlqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZlEOerrYPGufiWF6BHMGnLDTXrDzbSZt1c1f2+8QN/o=;
 b=jyXwkp2FSqjmEIizmY+EjAtMMkvGgJqGw5sL+2r0j/M+jensKc7mz2QfWwMl7i+hNy4tmvGycEueAp+TPAafqEEUx0WkiR7caA4dB9Px2HohhwL6JYj7vPuYR1d3/uDWZJS5eu9LqeGC+hxqoFT3ApG4su4QgFkySV5vi1HKvPWHJ0+kdw0FB5uzT/TXss7pSybv3lPIMKzxoR0WEMOHfwKgvGFgsr0P4o246DMVqWUKRFCD6pP+ARnror2PUqejBzHlxhM4L3BnaqW75OpFW40j0JY8fbsGadUVT45jrAHm/IxqUDp+weTIEIS+1zcpNhDJoj1zHiZA684/S0jOrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MW4PR11MB6958.namprd11.prod.outlook.com (2603:10b6:303:229::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Tue, 11 Nov
 2025 00:03:57 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 00:03:57 +0000
Date: Mon, 10 Nov 2025 16:03:54 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Xin Wang <x.wang@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <shuicheng.lin@intel.com>,
 <alex.zuo@intel.com>, <nitin.r.gote@intel.com>,
 <sanjay.kumar.yadav@intel.com>, <matthew.auld@intel.com>
Subject: Re: [PATCH 1/1] drm/xe/pat: Add helper to query compression enable
 status
Message-ID: <20251111000354.GM3905809@mdroper-desk1.amr.corp.intel.com>
References: <20251110221458.1864507-1-x.wang@intel.com>
 <20251110221458.1864507-2-x.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251110221458.1864507-2-x.wang@intel.com>
X-ClientProxiedBy: BY5PR03CA0025.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::35) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MW4PR11MB6958:EE_
X-MS-Office365-Filtering-Correlation-Id: 5423a51c-48fc-4218-3273-08de20b5cf2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uK4hxxNliEWJ605nomzlYXgjjXyCWzftRNWY7PwxQNF7znqsiiaYMTBVzatc?=
 =?us-ascii?Q?EobAoiFPS6QEqSk7BtMBO1jPvxlY7ZfFyuVH4mQ8JGrOeF1M6zoQxLFKb6ji?=
 =?us-ascii?Q?id9fIhEd5TdkiqSAvlfWqMAa8NSIsQjoqV8rf5987rjsYIIVtccQ+ep87ont?=
 =?us-ascii?Q?ARkbhdvTqt/14gdlJ43HvxXk8ChLfQBFxm3KMwSqDPkz0lUTcoBhBnmaJ/J9?=
 =?us-ascii?Q?VCCS1sBsamc5GGHrV9TbJSUJa+89LDRI8ETM/K3wYmRC45xO+XKfdpUfzoJj?=
 =?us-ascii?Q?CsE0i066mdlAsX38rbf8bUK4s1HpwjU3Ap2vvpdqCHQWq7ab0Ay2zEiPFUQ4?=
 =?us-ascii?Q?CzFReh3o4RWxO5Ugqf7ULuAxRlR9Y531CGPPV/ra6Tc/HuaGaOGeSNUIDFSY?=
 =?us-ascii?Q?LmCPsQetCyIZtH6aYdr/sfnvo+0BcCQTp3TBEZdVwPCHHx1cmeQrNt5vxk6P?=
 =?us-ascii?Q?NKHn6Nooc+zvrkx9u/4hLZgC/pksJaiDRQTJPTIoupQHSY9zfxpTYN0SSUrH?=
 =?us-ascii?Q?V4KYQjkODW2Wdxei6PPNUaBFe6mx7kNe1+JqxquOaUo0CzCa9W0ziLbPkdPW?=
 =?us-ascii?Q?zRKxpGr4O5Z0e85o+ebCTszy4GL3FBBSiTxRYIDaAlm0/kN6IW8mf5V9Yy4I?=
 =?us-ascii?Q?bkD+JXR8hKcHa5PgiBJj9UbrtARVt6q7V+Sv42lMthDfLadws1UF1VJsqGEB?=
 =?us-ascii?Q?BRjOUFi0H77FJG8zNmOsecpCCTUAWRXl+1BfVCKpentkDlufeomhKMkFkhzl?=
 =?us-ascii?Q?1AxPY45JhpvPCle6XB4dX9q4qWO+2uA+YXF4bSgbK34aKcSM0zgQVHajgHgq?=
 =?us-ascii?Q?Vt7kC1DJMKGuPnY1N5R5phsrj8pTbY3thPpbRaZH6nhqD6pazY1QKhmQ4XGZ?=
 =?us-ascii?Q?bQ2Tq4XHnepvPlZ+ccC/UczQEsBSfFVlqevHC9IA3omS6cqmet02+ZimJ5QS?=
 =?us-ascii?Q?N4TchriEohdaSmQgzoWigRNtnFykV16pzkHd79ICKqVXv7UAO7SFl8Uf1bb4?=
 =?us-ascii?Q?c139xXYMe/BsrrjqnE8J4uNtPCwpm2aDJ7Moccncu4qb4tZyRCrzas0DBR6v?=
 =?us-ascii?Q?u1eZlEuo2besdW9dihitNsbYZMqUTGEGjqeSJI99bVqBYyZ9R2NDnNzGNimO?=
 =?us-ascii?Q?JuRWhSKT+SFVcFMiQmdcRinViuBZbyjjbJo5x1SDA2EQ2X7iqdfc3k9ktoqs?=
 =?us-ascii?Q?YtxBjBtqK73NmqS1hE8hje+cjL7RWg93iVsriUAvM6K6E18yUj9Z2fbOErpv?=
 =?us-ascii?Q?TswlewdE2sMmXcnMUJNr2LK+7OQJpye4Ppc7xjzZhAYjQ4QkkvyXoAM1rdwz?=
 =?us-ascii?Q?qCUUZhrXWKqzcG4dNJoWvZM+UOcDUQJQfiaFFz3ihHV59ZJnBNhxo8WL8E5k?=
 =?us-ascii?Q?QdKM70cTeNkZzXjseENJWm9dNyau+Mu8e3apeaM4MMALPEbZrDAWcu3QMS0k?=
 =?us-ascii?Q?wghrl2ZceXqMZ6/NROyOr+KTMRnKXkrC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E9L8QWhwJzWTqGqDFXt4kCAiZgFID0J0wqLzzqHUBVZI7vgdjK9xPgaIrG6k?=
 =?us-ascii?Q?0cq5iknIR1lhukXfEx2aIurL+F80jGHk/kLvqkrDvn9pLcrAadC4eNdSOUFS?=
 =?us-ascii?Q?ClhQJ0zknln3XiSUo0GELG9YCyFV5rOoRZiZX/YWugAeM8OVqySZZYf3vCXm?=
 =?us-ascii?Q?bLbqJ0bQ9dAqifM5fq9eVDaK89/xdDw9X0Qv20COgu9+7+tcp2oY9yNUjlal?=
 =?us-ascii?Q?R8M47mCLqpw5q40Z1pGiWOkL95Aj1yyK7nqiF7T4zqq8Y1r97NEiqliPy5Lx?=
 =?us-ascii?Q?JXlv7XEiYrP7+FMwwa6jMVLibQq0TcsKk4061XNltcet5vA1i+kzAI16SAD8?=
 =?us-ascii?Q?nPZPKEkdVHxmTnhS8NBSDaJdsMKzi+/rFlh6o2+u4PLrzolApts5D4jkO8rn?=
 =?us-ascii?Q?v4GuH1eas8bECPZ9BRpLpwsu+c3YQrSDAZG3Fz63dWPSvP8RW2dFmE+FttOC?=
 =?us-ascii?Q?XWDZOVBHpLEi/qGPWLkeeSvkaLV4Q38EpN+n3CZZu308ZIH02ZlzQlOwcDh1?=
 =?us-ascii?Q?7XVvaVQ1yuW0woueb6Hi/8VAuTs2rb+FN91P68aC2KVb9Yh1tEshkWH+wwRm?=
 =?us-ascii?Q?jjnfqK35VxskQqpSk4g9pcH0Z9VL7XaiCxNSb3O0pbw+WnR2/hl7mdanMRsk?=
 =?us-ascii?Q?MiZEz4HtiUqiNcyMqOV2uOtcSnn/IVndzU6xmNpRuSyKeqG2Lxei4NBYl4ce?=
 =?us-ascii?Q?BHdDrilbRpQWXJpQxOFWSI8LYd1FyXFBimZMQ+5sMwhMTQ3ICwBBgLUVTn62?=
 =?us-ascii?Q?A7nqWW0UMxxcl0qbqXIp5VmVjwDAFYHvNANItD+l+c7hRzkEk6M+jf2nabfc?=
 =?us-ascii?Q?Mp/QqnI3lB+yqjWq2jEos2vpTRzgdS7HQWVTC+Hmjzv20CXJHVNFHU75Ohjd?=
 =?us-ascii?Q?fpYYIhyD7Bfs26ZcFup1YZ146vZoPosHHuZH82JbDg4JI40/roMZgG2SD9Jl?=
 =?us-ascii?Q?beAYVhGoXo/tP2yrT0QoZWZowuczHuA2pU0GzlV/igUse7aobt6KFTMB/h5G?=
 =?us-ascii?Q?IMquQVBtAyesS6SqsZHYse2zCg8mhYC2Hrcsom1Ot1ZNoSFTmEesBKki96dv?=
 =?us-ascii?Q?huc16ck0Es1Bs8oo4gNYgWMnBnfz3JobZYuiFdNtcuo9RRmDT4S5z+wnmy8T?=
 =?us-ascii?Q?fEUrX8/VfHitFORCjbGZR49ZgOleEZ8qa+0wFKeJmmokBqJo1YQzKXhrN7QG?=
 =?us-ascii?Q?U4s0fzx53QVhVmH9XSrBMn2AkoFNdbqHEXfo0+/pDTkjvIUzKnqI5UE+031j?=
 =?us-ascii?Q?fCjfXli6NaodAnO4+cfrqSFji6oUcfDek7aokSlT9i1oFcJw8Ahiga8TuLNY?=
 =?us-ascii?Q?qKk4QdtXXXyjlm+XCCOJW+1rht/FQeejZCh/B8gNyM1uY9fKXNRHrCohXyoA?=
 =?us-ascii?Q?+NPBs38ve09SNoV2I7Pv1lD0sgnDhnNN84jixTo9/SdqEDcIe9VvsUnRNboc?=
 =?us-ascii?Q?xEG/9hYvakG4cvwNE0xIytGDJopn3RIpiSYASc9aOQKmo5gOrdDSlhqOCFyc?=
 =?us-ascii?Q?T39l4US0Wea+leVqoNuZp+KfigfzXUCUugoc0cqTfDzqbHnEpIS7AMbLlDEX?=
 =?us-ascii?Q?YFs206I3Wx6zPFvWP9DYGnw5WhY4bRianuPgpWEKUd3n0/AFwbRuZbtahyMC?=
 =?us-ascii?Q?Kw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5423a51c-48fc-4218-3273-08de20b5cf2a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:03:57.1989 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AGHgN/Rr5vrVmwv0CmW0dmUywef15OQvL3VU43Y+y9hCdXXYARDMDJtiHjJJh+YnUC6hYjaohotpNQlS5nzRDu0brcXQVW+PRfyY5wX1QTQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6958
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

On Mon, Nov 10, 2025 at 10:14:58PM +0000, Xin Wang wrote:
> Add xe_pat_index_get_comp_en() helper function to check whether
> compression is enabled for a given PAT index by extracting the
> XE2_COMP_EN bit from the PAT table entry.

Xe1 platforms have a different PAT_INDEX layout than Xe2, but it looks
like bit 9 is reserved and guaranteed to always be 0 on those platforms,
so this helper should still work fine.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> 
> CC: Nitin Gote <nitin.r.gote@intel.com>
> CC: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
> CC: Matt Roper <matthew.d.roper@intel.com>
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Xin Wang <x.wang@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pat.c |  6 ++++++
>  drivers/gpu/drm/xe/xe_pat.h | 10 ++++++++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index 68171cceea18..1b4d5d3def0f 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -196,6 +196,12 @@ u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index)
>  	return xe->pat.table[pat_index].coh_mode;
>  }
>  
> +bool xe_pat_index_get_comp_en(struct xe_device *xe, u16 pat_index)
> +{
> +	WARN_ON(pat_index >= xe->pat.n_entries);
> +	return !!(xe->pat.table[pat_index].value & XE2_COMP_EN);
> +}
> +
>  static void program_pat(struct xe_gt *gt, const struct xe_pat_table_entry table[],
>  			int n_entries)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
> index 05dae03a5f54..b8559120989e 100644
> --- a/drivers/gpu/drm/xe/xe_pat.h
> +++ b/drivers/gpu/drm/xe/xe_pat.h
> @@ -58,4 +58,14 @@ int xe_pat_dump(struct xe_gt *gt, struct drm_printer *p);
>   */
>  u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index);
>  
> +/**
> + * xe_pat_index_get_comp_en - Extract the compression enable flag for
> + * the given pat_index.
> + * @xe: xe device
> + * @pat_index: The pat_index to query
> + *
> + * Return: true if compression is enabled for this pat_index, false otherwise.
> + */
> +bool xe_pat_index_get_comp_en(struct xe_device *xe, u16 pat_index);
> +
>  #endif
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

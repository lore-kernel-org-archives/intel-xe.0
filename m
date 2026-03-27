Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D713A10F2867
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 20:27:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BE5A10ECF6;
	Fri, 27 Mar 2026 20:27:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="muz2ChBa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F9F10ECF6
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Mar 2026 20:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774643246; x=1806179246;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tFIbfFAIGaRuL0iVr+YlNKy59a/onmFF7Ze2RwU2G7E=;
 b=muz2ChBaMNZ/yUHb4R8YEM8MWaqSNlQqFQOMkmqvXtrnsb1J/xZDKnI2
 74YEMUIwZAItNQER0riMuG0npcS6bmCwDeW35Wow4n/Z7t6XeGqUBlv2f
 RakD3fVn9TAUemxB0gxVxON1JPf+Az6bU4X1WX5ND8D3ICzWuC7K9l0rm
 VU+WhBplwL+ho4Nn/9QLWmekPG+F/kvKAVQ8MSutM9PjhoLiZv3mBgXY9
 qprzZzpm4D863Rw1a1WxsW6BiVxvQ+RjbQwExtaO+wGws8wlKiNigm4pj
 6Mbh0GZO4Lizdw5rGc9Y8sipBiaGu3b1YZHGOrLvc11lqPfOdw4wM7AV9 A==;
X-CSE-ConnectionGUID: /748UjTPR5e5HOji2U/ifw==
X-CSE-MsgGUID: +JMVJbvGQbyQMSUHjcfKfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="79629929"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="79629929"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 13:27:26 -0700
X-CSE-ConnectionGUID: +to4uNskTRGTo1ob/SNjCg==
X-CSE-MsgGUID: CXvSaKXUQp+LjYTHM4zuqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="248454857"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 13:27:25 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Mar 2026 13:27:24 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Mar 2026 13:27:24 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.69) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Mar 2026 13:27:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MvdjIXfoFvdxjBZSH/PMypOyESZMUpwEH0mCkUBcOHcN1ZjUiFEGlqU9aRktZs1LdPcItWXGZeKknPAD9fU1RSNnKly3F4jnPX+QJfzJdtGM8tvVGJCSarfDJQzldy0nNhOZIOQy1+ZBmk7y/Ez2TPsOyG5nOfjqxsPEW2W1qwYL5jrDUxs57kfgTzHbfVUzGJxbEYkhcIhtR8cw8pce5s3VOZe0vXn2i/C55QYADrzuGLvILdTT3p2BlS0ge6dYub2CgGDpQYewptwDoqGO+81uZuBJibi5gKsKH9E7qV2ZDtgWH01muu8oCjcauqe6HOxumlXpGC8j3JpTpGPaBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mHNRKqoxCEUlzILqip+OmY2siUEmkRUBYc/zBLu3Qgo=;
 b=k9RT7vs+bjHfk9eHayqesc3PHGPZMiQcox/ABUMmtCWgUL6zxYFO1DXXfJd8zH4XZ2ww5O6tuDczlf9sgp9WcpT58R2FtL8GI+U/KaaKuoOpTc227QfVplhRDBslCSRXlZ9ZfIGO2gvhe60O7Ggb4XrsDGoQh7qFQank1AU6Xb9g8RnxxUUqDeQVzOxs0B80Q0G0k8Un6Epw/IiBwJ+9CEIz6VZmLk+YoCYt02X4k5epVNxJmiHs+kFtKryrHPaYabHxhHiePv4udLo0Ajtgsgg7QS5w9jqLlt8v0z54H2DrHruO3FUb6O7dlIW8Sa7ACaHqd2ApMQlDhv0jLCOyAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DS3PR11MB9865.namprd11.prod.outlook.com (2603:10b6:8:366::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.11; Fri, 27 Mar
 2026 20:27:23 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9769.006; Fri, 27 Mar 2026
 20:27:23 +0000
Date: Fri, 27 Mar 2026 13:27:20 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/uc: Track uc firmware state changes
Message-ID: <acboKBsCwHzot/nY@gsse-cloud1.jf.intel.com>
References: <20260327202407.563-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260327202407.563-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR03CA0200.namprd03.prod.outlook.com
 (2603:10b6:303:b8::25) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DS3PR11MB9865:EE_
X-MS-Office365-Filtering-Correlation-Id: 32521450-4439-4db8-719b-08de8c3f40f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: pveOcTnsAL0AUm+9zAle7xx+rAtl7dtPyckW3P3YjfbYOPteoGQsZPvtNYPVQ7/kizXfFTykzcy7wMi/X5OpAlJlgnzTvJQaxY+m+NQHVJFP6bfhjEhndBef8LErZmtZak6su6wg8I/m8I/qnelli5ENg+8T98HGHYzgXwGX/2zvUUlYGKnjF0BEccrGHskuZCX+9bTlmddttiVMC8r69XZs31kQ3lW1O4Lr0HtbDQxewHchJu4dKa3b3AIfR2eXgYvdBa5Sxb4zj7ixdz40O3GnYodoRukVCOX2L1uB6HsauF05TzT8/XKcegtaD1nWhhUw/+hSl8YptSzLOBFON+Ca64OQGkyNkXd7P3B6JPwUh/ie1rblP9V+hy7RYACiXah/ahUUXX5WNXBK1Es9frEFHgvoIARdTYfmI9zUrZV9LNQZsO/sbpvFQi8y16fqjwMyx/7UJjw6gEVZR2kkxKFWy+9i3quQza8lM7wjtJYzJcHn9xKsSfiWZMhF1B+DE/MpbU8TzgsRPZTC8sJ72u5QH9RjEuO+2BSgEOr4X/PuecmZufJShXja4loK2RMjZQFLzayZU0Txlf6C+glxBsNyyjzrq2dFPsZvBb2SPIfld+ptRRnT59XjXnRqakdHqCH2vNlR9nLMbEFY8T5BOBprbZaEEZmduKbCdo1Sa2X1bSVwn7rZMvrSKRt5hVHRDf23rPoOKvTv83pltJQYA0xue/AlUihH1CnsDGs0Zh0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+GramoM18GJLmoEM75yru94/V/B+eFi50mp/1JeqNHl4cp0rjL6k+DeAfxjv?=
 =?us-ascii?Q?dmPbKLx6jYHIkRgkWK41P7YVxsv/bSvDecUnIig6HEjEdAOScAmDspsTTeuY?=
 =?us-ascii?Q?OLo20jUug9ZHUty3Kj5ejqN6Obzohcw0zVEqpJNf31sBZ4AH4ibh9HrxB8ZT?=
 =?us-ascii?Q?Gl9jjGpeOqaJq56ijvwAj2tKUz2H1ky7m2o5ZlZvn8prvuVvM+GfRs+pLbBF?=
 =?us-ascii?Q?JgsmOn67jlhFx1YCUa1GD80eYmr4LzPX4ot1FuXJZvGsTWVyM0Lh0Q3DWVIO?=
 =?us-ascii?Q?yYkoWk19UBKR0Llk9sZAIME7MsI8HFrw1gBHH7TzgV/ttDtxtACD8e19nHuR?=
 =?us-ascii?Q?Os3zhalTOnP4Y9HPpPsrdv/Tcy4Tg8LfaTKW7ULuS5ilxDXJTbNESvl5tXI/?=
 =?us-ascii?Q?u2PTdLDIzaUrReiJjyG0JjaTl1zUJ++GyOIagjYV+CrYrUK8yHmeYXFSw3YI?=
 =?us-ascii?Q?Ccydd6IcqM9DZD/yAO0bzJf/paW+yaKOYgEc+DzFrMnUXKg1heBF6YGDeAEA?=
 =?us-ascii?Q?SYa8AezdFJyEXEehAp6E2/pdOaP4YUopV0ZtW9QLQ/kF3b1qynNk95Eo3MqH?=
 =?us-ascii?Q?yK1+cDM6ufqU6P1ozLJSmmu6GN+2SeGXtXI+aedZaOr77mZba083Z7vaxjkh?=
 =?us-ascii?Q?L3BmQmRrqszGWjhLX2eG4ydh6/Xhze97RdYet+6ATqs28sNNo+OZrldkntxX?=
 =?us-ascii?Q?YnSh++rYa+O3no5VF2d4c7I+0GtsB8OHZ0gsAZbfbwLan5V5Ia+8bAWzWPHR?=
 =?us-ascii?Q?piQgfVyesOFiXAvXo+v3zO9qtgOAnhMqNAy1Rjf2H8GWKb+lzf3HAhsPMbN2?=
 =?us-ascii?Q?6d4HqqKmxjLM1c8mOCz0481Pwu7zIOVKZ3lKpOOsArQsMFsSWWtpcWtsIgQh?=
 =?us-ascii?Q?Lo1UK9MYw8yzj7O1SvHXfRXH3X1j166J7wPZA+5gVXUhKUdz5MBKg8T4DIJ7?=
 =?us-ascii?Q?Or4J6K//LBya1o7aL2YYblfe2PkKVenRHVltWxDa+mIXj4JzLA0hhnhf2bDS?=
 =?us-ascii?Q?fgVHfsQ+f9Usz8pf7orWIyv9MhrFPEgUZr5fomnuIFjScW6dTQ/c92vIEpPD?=
 =?us-ascii?Q?4P8ckPjfe3umIpjctGUNO+W8MPu2CkHdh76pRAMsHFSvhW9+bLv3FhvMdId0?=
 =?us-ascii?Q?IBBXjUcoY7Ms0imVJERdaAiCUtXyISC7CKUIi390ndcxCe74yhZqORWwv2jH?=
 =?us-ascii?Q?kF8OlgcJseCm4BRwaMMRnbs+AFLr0gKXr1ehujZy+7Ok4Q0euyx2rT+QQAvj?=
 =?us-ascii?Q?MDcl/SGIRSCy/WcInKsDSF0flE7LEKQK4dO1/diPSuAVNANlqIbUbF1Aa3yu?=
 =?us-ascii?Q?lvdLVFVtZ7hw4B/4BhjPr3Prwb470D7mNRWHPzeeUkgCDvvSVCNmK2YT8po1?=
 =?us-ascii?Q?FJXZdvX+f0MCD6JSO08LYefuxsrdF9if6kFa87f7BfkG5Zz/t8H1qhfg2IMN?=
 =?us-ascii?Q?b24uW/Ab3h+St/NfPreDB86rYO6SPVXWMPDF8J9k/zTkiXG3ZobKOxNzC4Sx?=
 =?us-ascii?Q?i6CKDPKPJmNjvgibtacPRwqid0QhDHmH/QbipRjjMrXd180t6zHvRfAVl4ub?=
 =?us-ascii?Q?4tI9YpYo6jC1Vs702ythRwbM1S6RoJIdU74qDkF0+uVthoHF+it2PESQ+zMe?=
 =?us-ascii?Q?XUQX688pNmjBOMQb5aJUWaVP0l1O8QAACAj1M8BRkWIBWLikjxiFJUypX8E/?=
 =?us-ascii?Q?Tfvu/HLlVStsPqlIMMBZv8xZ6DoaR7y0BO5qj2142hS+w0tWBu8VMN80EK4L?=
 =?us-ascii?Q?0uv8Z9qI8bSc6QX5XUtjgH4oNX+4NeI=3D?=
X-Exchange-RoutingPolicyChecked: wJLLzrv7ymsZ18mjSZdK9PP3lD09iarsiiFzOolKfTp083mFBH15BSwE6T+Ojy7cn26ldltSqch4ZtSOkIRiYGSGqIWyQDe9N7TOQt2rkox6imCGgBag1qw8PHDYkNFLdtzLKEpE/zk3LH2cfL9bRq9JuC8zGZlGk6Heg4puPZH+FJMQtWf5J7VbcwENml670eCG/F7ugSQl1U0mYVxXDNgFgxrcNNoo30BOC5BHT06OCghdjEF8lpFt7WCOZx5lgf38RsMs/cuyayaskfr87VnIAohObqQW6HdPkYDgz/Uc9WsEd8f/0ykBwnPwYKPkH5sk2hUJ7rLdv7xDHMYhtA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 32521450-4439-4db8-719b-08de8c3f40f9
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 20:27:23.6200 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: od+AZx6sQNMf6fF+sRsI5Fyt2oug+1XfvZjbWQE+MpfDVrQKf6bQKzbeoCA/dZCXTVNKxmX/5+D9JSKp7ETDLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR11MB9865
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

On Fri, Mar 27, 2026 at 09:24:06PM +0100, Michal Wajdeczko wrote:
> Under CONFIG_DRM_XE_DEBUG_GUC print debug messages with each uc
> firmware state transition to better visualize the changes.
> 
>   [drm:xe_uc_fw_change_status [xe]] Tile0: GT0: GuC UNINITIALIZED->SELECTED
>   [drm:xe_uc_fw_change_status [xe]] Tile0: GT0: GuC SELECTED->AVAILABLE
>   [drm:xe_uc_fw_change_status [xe]] Tile0: GT0: GuC AVAILABLE->LOADABLE
>   [drm:xe_uc_fw_change_status [xe]] Tile0: GT0: GuC LOADABLE->TRANSFERRED
>   [drm:xe_uc_fw_change_status [xe]] Tile0: GT0: GuC TRANSFERRED->RUNNING
> 

Seeems useful.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_uc_fw.c | 11 +++++++++++
>  drivers/gpu/drm/xe/xe_uc_fw.h |  4 ++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index 42d290e8585a..b5a49ef9dafe 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -218,6 +218,17 @@ static struct xe_device *uc_fw_to_xe(struct xe_uc_fw *uc_fw)
>  	return gt_to_xe(uc_fw_to_gt(uc_fw));
>  }
>  
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
> +void xe_uc_fw_change_status(struct xe_uc_fw *uc_fw, enum xe_uc_fw_status status)
> +{
> +	xe_gt_dbg(uc_fw_to_gt(uc_fw), "%s %s->%s\n",
> +		  xe_uc_fw_type_repr(uc_fw->type),
> +		  xe_uc_fw_status_repr(uc_fw->status),
> +		  xe_uc_fw_status_repr(status));
> +	uc_fw->__status = status;
> +}
> +#endif
> +
>  static void
>  uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.h b/drivers/gpu/drm/xe/xe_uc_fw.h
> index 6195e353f269..bb281b72a677 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.h
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.h
> @@ -25,11 +25,15 @@ static inline u32 xe_uc_fw_rsa_offset(struct xe_uc_fw *uc_fw)
>  	return sizeof(struct uc_css_header) + uc_fw->ucode_size + uc_fw->css_offset;
>  }
>  
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
> +void xe_uc_fw_change_status(struct xe_uc_fw *uc_fw, enum xe_uc_fw_status status);
> +#else
>  static inline void xe_uc_fw_change_status(struct xe_uc_fw *uc_fw,
>  					  enum xe_uc_fw_status status)
>  {
>  	uc_fw->__status = status;
>  }
> +#endif
>  
>  static inline
>  const char *xe_uc_fw_status_repr(enum xe_uc_fw_status status)
> -- 
> 2.47.1
> 

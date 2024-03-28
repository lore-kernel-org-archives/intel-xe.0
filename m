Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C44C54E67
	for <intel-xe@archiver.kernel.org>; Thu, 28 Mar 2024 08:44:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF91C10F46A;
	Thu, 28 Mar 2024 08:44:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RDuz6lmm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A18D10F46A
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Mar 2024 08:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711615440; x=1743151440;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=kFB21DAFeAqNlnf56a4E4QRl+4Z8NbFIbEC/v2z+4dk=;
 b=RDuz6lmmFePwXP+j2W/8cfCEUWfRKg27zrjA+4IJ9Pr7+3UhXW0K0CNm
 wKV8VjGXgMBBooCAROVqZ5KdgjyHnU9kEjHYrofapUlm71/1nZIBfMHsE
 Biwcvev02PLg/JOWTfwXWQ9Llxt3EPspHPJW2x84HGWOr5qOAwJAlQfT4
 gVBfIM7aT4OrR5nd+LdxBcdkXanWKp3P3mBNMmx22zu7AH34KHd+bg4vv
 JGVfRW6jPMl7DZXxdZgV7NbOQHM3nmPdE4fQYcmvugh9OoT5/1x4I+6hE
 Kbj/hd/ZZvdL9T9lq00xyyBtCYGZHwqS492n0Xw18wgz/ejG7C4/JtQuY A==;
X-CSE-ConnectionGUID: 5wpwWLnORK+AJzNSP/Dv3w==
X-CSE-MsgGUID: vyTtoXKVQgSWmivXRjeYuQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="18139408"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; d="scan'208";a="18139408"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 01:43:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; d="scan'208";a="17030550"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Mar 2024 01:44:00 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Mar 2024 01:43:58 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Mar 2024 01:43:58 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 28 Mar 2024 01:43:58 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 28 Mar 2024 01:43:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jKzY1duimJ0V8YfdMrR18NTSO677qsjsqffI+10zDPVUXbZlyziyiai8gLlK1URqt4zwndQBUrXKZhOpHf0RBxpS4fLo4Ms6VywY5iEdn3UmRc7WwYs9VcttgUeLYKpBg7cGTOgizCRE5tQCMTB3zSwlIV7w+tdRjb1d2412Ego7gCY0AX7HZzAXs/Dpu9hNYHl4YJypmhE7N058/Jv2QQ0+E9VL3ijtplAJq3+bacD4RUfm0xWkXUp10ZOaaKg04C9PY1hfi0kuHFpkYJ7R7AEq4TJF9qYwlA4xJxSuHrbJx2KuZr03oe7G3TaFqsnikm4JIZOnc0YgWg1GqFF0kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S55kHeweBaNIhXH+l2LdgVh/mZtJkZ8JQr1NYV0CQ9k=;
 b=Ol4CRgWBix4FVltmVlzjDx9yN2tF60l9d6nKsT2uHmGnWH3cVUUjS9U81GTg3rhyoP1LXPlbbITaapwQJcwDYeLbLWC4AxVZj86uEEoodeI8T1JZr943WvCQJPCygsYlgtIq1zjRyCCL8f8Bf6llGhLdDpcxsQ1QWeFbCN9VDdxRA2tm07aL0sCugTGD7pRXSFY/nH0aanlnOvxa298eQUiwihRELEHm16tYXHNXoAvuEmFaJpw7ZSxHA2MJZmf6OxXnAp2/ES9MMu4nW3vQ3esWfEmN3EqrBF/cytVYKVp2ZuOCmrXmNowQ6jDZL0N4XD0rCft5F0rp7klUZussTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DM4PR11MB5280.namprd11.prod.outlook.com (2603:10b6:5:38b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Thu, 28 Mar
 2024 08:43:50 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::6c14:55af:8583:6ba7]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::6c14:55af:8583:6ba7%7]) with mapi id 15.20.7409.031; Thu, 28 Mar 2024
 08:43:50 +0000
Date: Thu, 28 Mar 2024 09:43:47 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe/guc: Add VF_STATE_NOTIFY and VF_CONTROL to ABI
Message-ID: <20240328084347.aurc5owoijcqt2qe@intel.com>
References: <20240326191518.363-1-michal.wajdeczko@intel.com>
 <20240326191518.363-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240326191518.363-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MI0P293CA0011.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::11) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DM4PR11MB5280:EE_
X-MS-Office365-Filtering-Correlation-Id: f50f2cb1-1029-4ecd-d837-08dc4f0330cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0yWYO7+iv+WnLqAo15DMvWGONRG1InRtMnFdC0Upu6oWiZn9STvQz/PVkKzFIOOGN1bCQmXYoNO78rwHWo2or1u4hTG4XQK3YRcozmX00e8PriB31cfxTHJ+Ico3ggdRTBTR8fZTFL16l7xvZyOhG/w+55I2MTyTt9t3swYmBaQ7W4zKbSYd8IPmEznJIbFlNSYaxzmhucGcan6smq4VU35FZf9HS8SH2aSFE74FejQbhfVV6o6t4JX1QnQH7X3ftPLqruJwjusi3GiSTku7Lu7ajPgUHskpojU0OjeycG8H8MadsX16DQqzuZql3M72plVxOKYseXVXBqDM+A6+4a6Is6abx9rTKCT336v7KZXMEHHtfzU9/NiyJJcyTfhcjTmIAXuixqeBQ5ZGyKTokizaovE/efDXG/TlzkP9EFvQOPOMfNYo8hly8h2+ogXISUo9idU9ld/dBfG+lhc4KfWUGS46iwErPr9+etWRe3APhjH6NZm1h6R8jBeCaIwbjCR45xLr6qt7nI05GR9Js7xomKuEjsOt3MY/moujtp3GElmYPV9EnKL5h66Aa5wyKq7UZMNqgfplm+z3WTVr53jCgP20nIm5SYIVKIdddQjhd6wD+uxaNmN3QOJvSnGHKt92bbas/d1E6kNqsCnFZ/aAE6ZGgIfkHPbd1slusUw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VG5UaDBjSTdyWHRZc1d4V1pXRFA3ck44VkhuakRKWk9IWUJXaVp1SUEvenZU?=
 =?utf-8?B?SzVIWkhuNWdiNVI5R3o1RWpuNnM1bGNjb2N2TTFaQkN0UDhJTW9rZXJsYXJk?=
 =?utf-8?B?SStKOWMxdjYwaFY3TVd3dUVxUE5QWXViUjlhUG1kaUw5dzdhN3ZyeGI4WDMw?=
 =?utf-8?B?ZTcrSHA4N1JZSGRKQUVuQW1PZ1VuQ2dncmVvM2pNVXZoWEwvU0t1K0ViMzBm?=
 =?utf-8?B?bHdkSW43bkQrSEpFR01sbDVXczdxdENNZ2xHNkVJOWNSM3FGKzdIN3grNnRo?=
 =?utf-8?B?WVdXWXBNcWJQL3NWa0k0Mkk1cmszczc1ZGw3MjliK1JQK2tBRGZQUFM0dHRp?=
 =?utf-8?B?dE0zdXhQK0kyeGF2SHAycjNmWUw2OGg2cGFDaHg0dmNtYnRZNHRXYmpZK0V1?=
 =?utf-8?B?bDRHWTd5STcxaTA4ZEJDbjBxQUVzay8veDlkaVovTUZ0V1l6aWh4ZzIzOTA4?=
 =?utf-8?B?enZtN0NRckRweitkcEUxa1o0RTB0NVFHejJRdWg3eWV3eUJrWFBBWWJQREZV?=
 =?utf-8?B?ODB2aDFySkNRdzRZUDdNa3NLVS92YmlyaU82MHl1SlE2azk5RFplU2E1Um9v?=
 =?utf-8?B?Z1BDLytSdzMrZU5pTUsvQlJONm95NHluam5IVTVrajNxRWdVUzRXaXJHRFhw?=
 =?utf-8?B?UFM3UFQvVDdzbkk5TTdTQm1BOUxyd0xGR2tLRmdDazBmaXFDNHRudTFoaVdH?=
 =?utf-8?B?dDNxVG5LbzAyeEN1UDY5RlRJVlBKUjUvYVNKOW1FQUh4bkdUTURjY3B4ZDU2?=
 =?utf-8?B?WXdFZ3NZeC9iV0VkQmZJdnFZZmNNV3ZTNmtmNFU4WUl2UHNmVkkzRU90cmVM?=
 =?utf-8?B?MDZEODZ4clhYYWlpM3A3alFIN0tmeVRTdGtvQ1JHdlpmc1BXMlIzN0tMVC9n?=
 =?utf-8?B?a0pXUXVMc29tbWd6SmNKS2JhcExqNzYyWWxYVFRKWHdvYlkrcEl1S05Kc1hm?=
 =?utf-8?B?NlN3bS82UXdUckUxVVhtVVFiMW1naDgweUtxRVhub3F2QXVNM1FsUzFJQWln?=
 =?utf-8?B?V0FGMXlNaGQ2amhEODBPQVh4Skg4cE9FS3RyNTZYQ2JCN0FKVkptOVB0L04w?=
 =?utf-8?B?aENub2hCd3RSUzNKaUlrN1hJRFczY2FvcGpJOGJxM2YvaE5ZUmo4R0tTaWRR?=
 =?utf-8?B?N1d6bGlUQk5PdHZOTlNPbDZOUFo1Vno2RWpLSTk4eUNIcUEyM2hxZXp6TVoy?=
 =?utf-8?B?UWlKaTRoY0FqZnk5WWNxL3dlSEdYbUxHN2tOTmljYVRRMVZrUWl1OW9pQXBR?=
 =?utf-8?B?Z3hqTFNTV3p1OXNHZU8zR0xSVHR0bFNpKzRLbWZLRVp0bjZkeDZZdkI5WDJv?=
 =?utf-8?B?aUlWb0pYQzA2eHBjTCtYbjduQ3BnM2xvTTJ4eXpMWWpUTlExcmxVTTVZbU9W?=
 =?utf-8?B?d2NldWU0N29yZzFFOERueHdYRzN2T1RpNmF1aG9VMDhOWVNMajBVelhUL1JP?=
 =?utf-8?B?dnJKUjRWYnhhc2Z5SlByQmJhbjhXb09iQzRHOWYvYzBvRUhTSlNGWXpqZ1hY?=
 =?utf-8?B?VkZYNmRwRDgyYVJxVjh2dW1xMUVPMVB3R0t5OWcrbkttdVJoOTZibitEdFdz?=
 =?utf-8?B?d2xkZ1NXN2ZHVDB2bmNkZVRNSmhWK3ZLb293UnhNU2xzT1JneVRzb3pjZGFU?=
 =?utf-8?B?cUVvVVdUK3VxZExXc1ZYNGF0ZFY4c1RNUHVsUElScmRDMXptcUdXRk1QUUJ1?=
 =?utf-8?B?THFKQ0tGUFZJWlVtbnl4RWJSRUxBaEl6RitaMlUwZWNzWFd1dTVhYy95WnNQ?=
 =?utf-8?B?QzB2Qk9mUjJqMjJmYi9HSGcyRks0V1BPY2JoZTFKdldoWkxvNFdVMkhqODdl?=
 =?utf-8?B?OXo1RVdnK2dsV29BZlVTWXJzZ0lBSlJCamp3T2lRc1RWVi9BRnpBYTVwNjZ5?=
 =?utf-8?B?YTlxeThMUDVsZjBRK1NnYUl3WGp0cFM3dGdvVlZJL0tNZTIyQ0hIWDJXZ3FM?=
 =?utf-8?B?TmVVYXVYd1lHemIrcER3bERKb2VlbzJxYVBPc1NjNEt2aU1TRllGelRNdEd4?=
 =?utf-8?B?M0ZCb1R6ekx0Rjg4THpxdlhQOFkyV2hUMld1TVNocUYxK0J5NWVCTWZuM0Nh?=
 =?utf-8?B?K3ljc2Rmd0hDWXozSlhaSStxaHVaT0NGZXpzWUdPcm1DRHJURy8vSjF4MDdU?=
 =?utf-8?B?bmRWTkg3YlZUOCtYQjNtaDBibTdxRzhiSS9XZHRqSG96RTJTN2k3dE9KMWIr?=
 =?utf-8?B?VlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f50f2cb1-1029-4ecd-d837-08dc4f0330cc
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2024 08:43:50.3267 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hxX2hLd70zUjMRAtRzXK8R+QIp/Sczov14qQZFxnflKCzWnIIqgWQuLgo1/W21j+vz2BcEe1h4wwgtuAtSREyEPbegkS93CH4PSu+9SSs0E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5280
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on wto [2024-mar-26 20:15:17 +0100]:
> In upcoming patches the PF driver will add support to handle the
> GUC2PF_VF_STATE_NOTIFY events and to send PF2GUC_VF_CONTROL request
> messages.  Add necessary definitions to our GuC firmware ABI header.

double space

> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
>  .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    | 94 +++++++++++++++++++
>  1 file changed, 94 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> index 5496a5890847..f4914cf8be08 100644
> --- a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> @@ -171,4 +171,98 @@
>  #define VF2GUC_RELAY_TO_PF_REQUEST_MSG_n_RELAY_DATAx	GUC_HXG_REQUEST_MSG_n_DATAn
>  #define VF2GUC_RELAY_TO_PF_REQUEST_MSG_NUM_RELAY_DATA	GUC_RELAY_MSG_MAX_LEN
>  
> +/**
> + * DOC: GUC2PF_VF_STATE_NOTIFY
> + *
> + * The GUC2PF_VF_STATE_NOTIFY message is used by the GuC to notify PF about change
> + * of the VF state.
> + *
> + * This G2H message is sent as `CTB HXG Message`_.
> + *
> + *  +---+-------+--------------------------------------------------------------+
> + *  |   | Bits  | Description                                                  |
> + *  +===+=======+==============================================================+
> + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_GUC_                                 |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_EVENT_                                   |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 27:16 | DATA0 = MBZ                                                  |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   |  15:0 | ACTION = _`GUC_ACTION_GUC2PF_VF_STATE_NOTIFY` = 0x5106       |
> + *  +---+-------+--------------------------------------------------------------+
> + *  | 1 |  31:0 | DATA1 = **VFID** - VF identifier                             |
> + *  +---+-------+--------------------------------------------------------------+
> + *  | 2 |  31:0 | DATA2 = **EVENT** - notification event:                      |
> + *  |   |       |                                                              |
> + *  |   |       |   - _`GUC_PF_NOTIFY_VF_ENABLE` = 1 (only if VFID = 0)        |
> + *  |   |       |   - _`GUC_PF_NOTIFY_VF_FLR` = 1                              |
> + *  |   |       |   - _`GUC_PF_NOTIFY_VF_FLR_DONE` = 2                         |
> + *  |   |       |   - _`GUC_PF_NOTIFY_VF_PAUSE_DONE` = 3                       |
> + *  |   |       |   - _`GUC_PF_NOTIFY_VF_FIXUP_DONE` = 4                       |
> + *  +---+-------+--------------------------------------------------------------+
> + */
> +#define GUC_ACTION_GUC2PF_VF_STATE_NOTIFY		0x5106u
> +
> +#define GUC2PF_VF_STATE_NOTIFY_EVENT_MSG_LEN		(GUC_HXG_EVENT_MSG_MIN_LEN + 2u)
> +#define GUC2PF_VF_STATE_NOTIFY_EVENT_MSG_0_MBZ		GUC_HXG_EVENT_MSG_0_DATA0
> +#define GUC2PF_VF_STATE_NOTIFY_EVENT_MSG_1_VFID		GUC_HXG_EVENT_MSG_n_DATAn
> +#define GUC2PF_VF_STATE_NOTIFY_EVENT_MSG_2_EVENT	GUC_HXG_EVENT_MSG_n_DATAn
> +#define   GUC_PF_NOTIFY_VF_ENABLE			1u
> +#define   GUC_PF_NOTIFY_VF_FLR				1u
> +#define   GUC_PF_NOTIFY_VF_FLR_DONE			2u
> +#define   GUC_PF_NOTIFY_VF_PAUSE_DONE			3u
> +#define   GUC_PF_NOTIFY_VF_FIXUP_DONE			4u
> +
> +/**
> + * DOC: PF2GUC_VF_CONTROL
> + *
> + * The PF2GUC_VF_CONTROL message is used by the PF to trigger VF state change
> + * maintained by the GuC.
> + *
> + * This H2G message must be sent as `CTB HXG Message`_.
> + *
> + *  +---+-------+--------------------------------------------------------------+
> + *  |   | Bits  | Description                                                  |
> + *  +===+=======+==============================================================+
> + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_HOST_                                |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_REQUEST_                                 |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 27:16 | DATA0 = MBZ                                                  |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   |  15:0 | ACTION = _`GUC_ACTION_PF2GUC_VF_CONTROL_CMD` = 0x5506        |
> + *  +---+-------+--------------------------------------------------------------+
> + *  | 1 |  31:0 | DATA1 = **VFID** - VF identifier                             |
> + *  +---+-------+--------------------------------------------------------------+
> + *  | 2 |  31:0 | DATA2 = **COMMAND** - control command:                       |
> + *  |   |       |                                                              |
> + *  |   |       |   - _`GUC_PF_TRIGGER_VF_PAUSE` = 1                           |
> + *  |   |       |   - _`GUC_PF_TRIGGER_VF_RESUME` = 2                          |
> + *  |   |       |   - _`GUC_PF_TRIGGER_VF_STOP` = 3                            |
> + *  |   |       |   - _`GUC_PF_TRIGGER_VF_FLR_START` = 4                       |
> + *  |   |       |   - _`GUC_PF_TRIGGER_VF_FLR_FINISH` = 5                      |
> + *  +---+-------+--------------------------------------------------------------+
> + *
> + *  +---+-------+--------------------------------------------------------------+
> + *  |   | Bits  | Description                                                  |
> + *  +===+=======+==============================================================+
> + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_GUC_                                 |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_RESPONSE_SUCCESS_                        |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   |  27:0 | DATA0 = MBZ                                                  |
> + *  +---+-------+--------------------------------------------------------------+
> + */
> +#define GUC_ACTION_PF2GUC_VF_CONTROL			0x5506u
> +
> +#define PF2GUC_VF_CONTROL_REQUEST_MSG_LEN		(GUC_HXG_EVENT_MSG_MIN_LEN + 2u)
> +#define PF2GUC_VF_CONTROL_REQUEST_MSG_0_MBZ		GUC_HXG_EVENT_MSG_0_DATA0
> +#define PF2GUC_VF_CONTROL_REQUEST_MSG_1_VFID		GUC_HXG_EVENT_MSG_n_DATAn
> +#define PF2GUC_VF_CONTROL_REQUEST_MSG_2_COMMAND		GUC_HXG_EVENT_MSG_n_DATAn
> +#define   GUC_PF_TRIGGER_VF_PAUSE			1u
> +#define   GUC_PF_TRIGGER_VF_RESUME			2u
> +#define   GUC_PF_TRIGGER_VF_STOP			3u
> +#define   GUC_PF_TRIGGER_VF_FLR_START			4u
> +#define   GUC_PF_TRIGGER_VF_FLR_FINISH			5u
> +
>  #endif
> -- 
> 2.43.0
> 

-- 

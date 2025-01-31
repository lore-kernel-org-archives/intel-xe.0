Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 675A4C0218F
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jan 2025 19:30:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F75B10E431;
	Fri, 31 Jan 2025 19:30:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U+LjnAg/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2B1510E1D1
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Jan 2025 19:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738351849; x=1769887849;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Y+/86HivsalZnpMZa+5mVSud6xBN+Qy5x+huiLnAW/4=;
 b=U+LjnAg/vYpFdXMl+4FwofUU9XZN1ElniFqCQzMFEEd4FiY7NCdlC9HN
 6SaOh5JUf/8FeS/iiIDAxe7aWlWyqlWCHszh6sPM8eP388kQITsqi8v4R
 0/jA1ZyNPe4bft1fWhaKtB8wyQ+JC6yer/WEdp+ALqtCOqgEIcuWS3le0
 fhCECVH19a/lEM6ZI5XmN0hxHXQ337POW2pM9BWsnxLr8PPw/pEvBzUgx
 p/r905sAmZPFHVPm078lCsccGAoQ3WvHysMGzIN5vpkMGwUyKeLoVYwgh
 GAsq3DFn3KM3g1kHmit2WrIcXvIJaQU+WGBFJBZBSZqafYx82kV9Pbrum Q==;
X-CSE-ConnectionGUID: hP/J01FnTBSu8eAdD5N4hQ==
X-CSE-MsgGUID: 0WnynKMUR0aCREJ1SuZleQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="49527722"
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; d="scan'208";a="49527722"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 11:30:43 -0800
X-CSE-ConnectionGUID: xxloRN5/Smmf0QgavummSQ==
X-CSE-MsgGUID: PwwaX2yyTk6hOnzlTdHLMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="114308909"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jan 2025 11:30:12 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 31 Jan 2025 11:30:11 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 31 Jan 2025 11:30:11 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 31 Jan 2025 11:30:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y/zk7ux/GTCMu+P99vqaa+VWQisY4g3uHv9s8kjifwbAuU9T4WJV+ZCTReNh3UrviSNjG5lZTZFtM0gWDPFSW/yMLkR96fZhHh6IwN9YBhBJAQ1PhL2DB0R/S9sWdcZ7A1FgDRTFasJlW6KVJiwg1Lt+FzCcif8MYIq4kut1yegvOdmuMBo/s4N7Wrug2dRB31sbYMWVhg9hkxbH9HfexPihIhtFQgVVIzbT2pzfaVqD8MR1fX3eF/Gss0IJaTz5jd3YiIGCyhlrsQt+10QeCBBS6xxLRvEg6Jwo2GIztdkv0u/0gNzrctFoBVyAadH7p4RmziILvLMrFZ3NUnpJQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PlrG72tnvTUj/PIg4sSGGak0ifkO+zJzXuNxmtIlVgk=;
 b=mYXFbyYKHliMcqOWdWyXgizltLCeLX/LEEx+FgKoi4FAM5HGl6MNPpDi45MxKLpfXHlZ3AjbNRxPsg5gBglWjEFrzdGkrJmNhHEIAAyDBPT4kn3mKBZ7tUdLfH50ZQD8qcGsMo747hOPEeXzy97yiLBHf0YBxTq3uyguzZAW988NuRz/xQtoVFvM8FEa7U4uMtyepNjjcrw6V7huzvTr6Xyt4pna5TI2arEjkdVDd7bi6fCuHN7rknendRD9saXPlv2fq61ZDFuIwYntASeLgEm1rt5nkww3MADmnskwrnKDJx1Xfg16djpRaG2E7MoQNwn3XmZrWk6k+yRHCxv6aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by PH7PR11MB6055.namprd11.prod.outlook.com (2603:10b6:510:1d3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Fri, 31 Jan
 2025 19:30:07 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2%7]) with mapi id 15.20.8398.018; Fri, 31 Jan 2025
 19:30:07 +0000
Date: Fri, 31 Jan 2025 11:30:03 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v8 4/7] drm/xe/eustall: Return -EIO error from read() if
 HW drops data
Message-ID: <Z50ku-fhUr3ip6lz@intel.com>
References: <cover.1736970203.git.harish.chegondi@intel.com>
 <9dc0f747ae215f9704fe1edec2e7007e19f8dd0b.1736970203.git.harish.chegondi@intel.com>
 <857c6cgb94.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <857c6cgb94.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR05CA0190.namprd05.prod.outlook.com
 (2603:10b6:a03:330::15) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|PH7PR11MB6055:EE_
X-MS-Office365-Filtering-Correlation-Id: 1088d7f8-c6d0-4617-2b49-08dd422dab1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SWJmZExyS3lKdU1tM0d0NFp3a3JvL0FBVnRZbkVDQWlZcjl0ZFRnclR6Nldj?=
 =?utf-8?B?bmVKaWZpQUFhOHJwcGt5ZldjdjlGREhtMHdqcTVjV1U0a2NqLzJ0dFVySm9n?=
 =?utf-8?B?TUZsckNaU0h4WXBKc0Eyelg5SUlmbnlnUnlXRXY1cDB1eHZMdTVBTlR2NzVk?=
 =?utf-8?B?dURJUGxJNVc3dStnYzQvc0JVdnJ2KzZyb2RWa0lEeHlOVjJIVTN6L0lEQ3pW?=
 =?utf-8?B?WE1JSWRLUFBldFE5VlFrZkpjMWhvYk9lU0xGZHJJYzNpREFaeW1ueEp1WlJK?=
 =?utf-8?B?VkM5ODF1ZUtmM3hKNDBTNC9hMU5vUUs5RWthWEhUMWx2aTZBajA0RWVWUG5O?=
 =?utf-8?B?TEk0cmovWGJxaUJkV2dIYUtWRW5hQWovTFlUN1NDUDVxanhvUXd4RGsrVGZK?=
 =?utf-8?B?TmpGb3krVk1Sd0xZY0o4SWVKQlNieWlDYlQwMStwUjZ1R2E0bzVNcWplbHk2?=
 =?utf-8?B?WExtQzFuTW1jVER0SVJoWTYrT0dMVmxRU0lkeGYvaUJZOC93d3I2WTkrdUVG?=
 =?utf-8?B?MzhmcVYxdkxDL25hWlJFUXVjOCs3V1llK01oU2Z1SFFFbjJNYUkxK21pSEdO?=
 =?utf-8?B?RkdqU1pCN3BHQm10R254eTJyakhkd3ZhZGFQTjJrem4xbmlrMHBsNlh3VXNQ?=
 =?utf-8?B?YnNHZmY5STBtRUtvME5ENG5OcUZsSU1tdUIya3luTTVIdUF6YWtGZUhzakJZ?=
 =?utf-8?B?YVlUVS91SHFsVjhNMVJqeFJOek05cldPWVNSSGl0aG9nMTIwSXRxY1FZbWxU?=
 =?utf-8?B?NVpyejI3ODZ4M1d3K0R0UUVGNzBIbno4UGl0cGQ3R2VleVk5MUxEaS9yb2U1?=
 =?utf-8?B?cHBaVGVYeWxhVk5BOFpwcHhYTGlWY2FKeGRoRDErQnM0a080Z1lER0RwZU9D?=
 =?utf-8?B?U2ZLblQ5QVVwcjNFVHV6QVloeGdFeHZ1RGNKWklManF0WWZzTG9oWlFucWtr?=
 =?utf-8?B?YTZzaGRPYWdyV3kxS0VERUVlNEJ0MCtsMjdWcXN4R1dZcXJqVkxZQjhHNTJk?=
 =?utf-8?B?d3c3ZkpNTjVhNjluZEkrRHF2L3ZOdVp0QTRSZ1JqRFJQRnlJcnZrTXpEdU56?=
 =?utf-8?B?NklGcjJPQzV5b1VRQ0xwdVZDQUxLVGVtbUM0N3N1Q2tTblVOVVRTSlAzRmg0?=
 =?utf-8?B?azJtMGt4RzIyanJtd2RadnRvaS9GK0dHMXFMdWdhcFhVaFNvN3N1UzV5UXBz?=
 =?utf-8?B?dExMWHlWemE0QXFZRy9UcjFPb01vTC8zZ0U2K1pQd0V2OS9nbk5QQ2N5ZEdt?=
 =?utf-8?B?Yi9wbFFtVlp1V1Q3RGZwd1Y0enV0Sld3Y3ZrWnEwSEZzSGNiVDQwOUgyTUUr?=
 =?utf-8?B?QnlaREFZaEZzR094Z0xYOERSeUVWcFVTQ2czeFoxdzJIdmRnK1l6djBuUGtN?=
 =?utf-8?B?em91ZkZlbnNYT1NXbXdRcVFCdFRzVmUyNVVtcEV0U1dUVklNSGwwZW5BM1VM?=
 =?utf-8?B?R29KNlpYTWtUOE5QU1ZmNzVtVjB1cERyaVUrdjl6SjRPOEZoUFJLU2FKbGNz?=
 =?utf-8?B?aXBFSlN4cnZDSlgzVHVOVDdxZ1krZTFnOGpLQ3o5aFRaL3NKSXROYndycEwv?=
 =?utf-8?B?R0JSaVc2aW1pVWxWc1FkNC9NV3laNmRMM0xObHc1MElhRjA0aW1aaTJRcXZo?=
 =?utf-8?B?cEdzQm9YQlhKYXM0MVRzQ01SL3lVK0NJVXJBeFlhQ0N0WHJRSDBQWUMzTHhn?=
 =?utf-8?B?ZkpUS1hsNFczTUIxTjRsU3RLajhkMG1rVHptSVdCdnA0Y1FnVFNMbGM0VVMw?=
 =?utf-8?B?Q3dvY1dDY1JDWXVzZFljYlpnYjRuNFdZVXNhWHFoSTdxMENkQmFqcEdwYlFL?=
 =?utf-8?B?ZmtRaUdJSXdSVm5sd0xsaDlFSEU5Ulc5NmlSNHRmWCtCVm9McVE5dko5Z1dC?=
 =?utf-8?Q?2rcJdOwmFvWKF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjQ5ZzJaUjRYYzlieENIMERHNGdlaDVpRisrRFJ1ZzlJM09Yb0IyeUcwZU80?=
 =?utf-8?B?RStIdEpaQmVObzFMaDgxRkloWkVVVy93SlZXYXVqdy85OHVBZFA5UzNGTWdk?=
 =?utf-8?B?cGI5R1NoRWdPZXBqbEFyQ2UzY2p1bUtnaXkyZGY0MmRmeFBIRG5aRk5UV0Iz?=
 =?utf-8?B?T0pFRXVDT3kvUitoUmNpbkVUY3JvRVNHL1N3cFphaitTTGFmUm1kTEwwQ0Qx?=
 =?utf-8?B?cVlwMi9iWFM0Y0FWQzJwU1R5UEErV25CZDBXODhFNHJackVrcDc5QUQ1dkFI?=
 =?utf-8?B?eTNSblJOblM0allDZFI4M2xGOTd1ZVp2U05PY3E4VEU4OTUzQTBjWXYxdXRJ?=
 =?utf-8?B?SHdTUzZtQjYrOW5JSW5oRG9CTUZlcDU2d01WVWUydU1LMXVnVGQ3dEhHNkRZ?=
 =?utf-8?B?aUc3K2V1c0lnK3JnUzNNc0xIQ2JXYm5DdXN5VTNCM1ZVYVRheWxKYzhlSGg1?=
 =?utf-8?B?VlJmZ0RaVWIzeEpjRElTUXBRNTVqNXduUVVRTHZJbFpxc0pKbGRDeTBwSjhX?=
 =?utf-8?B?VHVnUjBxOU1ENk9vSGRKNFY4b3ViaTlnZDZvUEpJNkE5MVdQakQyZFlYcEpS?=
 =?utf-8?B?cHRWQUlyb2RJT0xGaUpaVXRyV3JIakZxSEN2NlZSVkRmOWkzQlB0TU5uczJX?=
 =?utf-8?B?cElYa0Z0bUhnZ0NwcWtmMm9JZFlyQ200WUF1dW9ILzI3VlpaUkFCNnVLU2sy?=
 =?utf-8?B?K0dPcEFlZndIbzNuUGVRZFI4VFlDR0RvQTJxRnhjQ2xBTEhyWjg0RzlWNVBK?=
 =?utf-8?B?NitvaW4yWHNNVmduTnBrV1dyOUZoNzlHVGphMmJHMERGa3hmR3phUUxtb0Qr?=
 =?utf-8?B?QWhPUUlLNHBtMHc3SkgxcERVblAyOEpGbGRVNkltTFc4V241c3Y4THNyNytD?=
 =?utf-8?B?U2NCTEozN2Ntc09RZks2a3Rxek5FdzVvdFFjcHBYVm1hTjdIWGpmVFQ5UGdI?=
 =?utf-8?B?QWMrekRWSElrRjh1S2FHUjVnYzNvNDlMVEdJYjhDRHBGdFp0ZThNbkpoTFRP?=
 =?utf-8?B?THRHS1N4dnZwWU9tdU9vTU84VjlDZ01DYWFIYnFwdElNT0tBRThSWmJqTG5x?=
 =?utf-8?B?OEtNdFRpUkZyYTRpVWJGalAwWWdJKzZoUFVWVGpaNElJVUN1YlNSRVBpakRz?=
 =?utf-8?B?ZW5Jam9tMWR1Ull1cUQrUXhEZnh1OGdIWGk4cFlkSE1QQ1ZXdXMxZzBWay9Z?=
 =?utf-8?B?a3A2bXgzbzdkVXJEU2xoZEdWZmRRRUdzL2w3dk82ZU1XanNaRlk1ZlU1OUNu?=
 =?utf-8?B?K3pmWDUxeVNWc2s2ditCemhjQ2NhNGRMK25aK1NoZWNHZHViNnU3dC9JOXVU?=
 =?utf-8?B?Qks0MkF2U0pqTGptVHV1T0h2QkNrSHpWVTVQcTUrME1QM284Unp3WWkxQ3Fq?=
 =?utf-8?B?a2o3R3VMMHovVEhyMnR1NlhpRXdEOFg2VVZmYWM2WTR4NmV5enRWZkFIcW95?=
 =?utf-8?B?a1gzKzAzM0RGUmZOZHpMdlhPWFVhZE9hZmRtR1J2QTRLbnhYQlRON2FUSUkv?=
 =?utf-8?B?aGRqVCtxWVY5QStjMFFVSkJUaW9GbGZ3ZHgzMUV3YXM2QjNHcXlSS2x0dnY0?=
 =?utf-8?B?dDh6eERSbnh3SlR3VVFPOHJEZWVhWW9HbUFLTlFNd3dEMS9COUxCZDhiYkdz?=
 =?utf-8?B?TmorSGRieHppMWEyalR6Ykw2RE1mUVhMR1BJMDRTbDV2N3RzdCtUSVBMQWpH?=
 =?utf-8?B?cXdranZmaDNlM3lya20weVNKK2pDUmY1dHQ3YUMwSUVhaW93NlJ1ckE1VHNI?=
 =?utf-8?B?NlA0L2V5SkYzKyt0NDZ6U1ZFRVIyQ2FiOUpxRmVCUGMzU0ZzWnIxQ2RkeHpa?=
 =?utf-8?B?NHVuaGxXaCt2MHkrYVF0Nkh0Nk9RVjVVQUY3bUVndys3eXpsQlpudnllY0xz?=
 =?utf-8?B?c0tpc1VIaDB0RXRHMCtiOG1mMUtESC9ERXF6cXNTRzFUSXllWElGS01TN04x?=
 =?utf-8?B?aVRzVytGOEtEVkl3bHVLSGFzYUFRNFU3Rk5YOVpmdzNkdUNKRGxkc0RsaUtu?=
 =?utf-8?B?aUdseGt3S2VmMmljOXU3OHBocGlwSk9xMVlHNTRNUVVMVHBVS3pMcXFxcHdr?=
 =?utf-8?B?Z2RhRkZsaVFNUjB2YnkwM29wS3FwZzFzMTdYMktYbnFQUWdCZGYvMWs0T1hp?=
 =?utf-8?B?eWYvM3BWQVhqckZpbDY5QnIrUlUwTEdGa1ovR05pMm9LaVpFNVN1V2RrM3g5?=
 =?utf-8?B?Rmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1088d7f8-c6d0-4617-2b49-08dd422dab1c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 19:30:07.0123 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wFaqWzuU457eh5RWE/zBc7n11Jabm/H9LycQj7v2VRzwP+H98bRHy3E0tpMqFg4vCVvJ4rCutZ0dMKwMOVUPOfa503vFa1cQqGrlWq40OHM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6055
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

On Wed, Jan 29, 2025 at 08:45:59PM -0800, Dixit, Ashutosh wrote:
> On Wed, 15 Jan 2025 12:02:10 -0800, Harish Chegondi wrote:
> >
> > If the user space doesn't read the EU stall data fast enough,
> > it is possible that the EU stall data buffer can get filled,
> > and if the hardware wants to write more data, it simply drops
> > data due to unavailable buffer space. In that case, hardware
> > sets a bit in a register. If the driver detects data drop,
> > the driver read() returns -EIO error to let the user space
> > know that HW has dropped data. The -EIO error is returned
> > even if there is EU stall data in the buffer. A subsequent
> > read by the user space returns the remaining EU stall data.
> 
> As I mentioned earlier, entire dropped packet handling should be in this
> patch, so we can see the entire logic around this. So data_drop struct
> should be defined in this patch.
I worded the commit message that this commit is about read() returning
-EIO when data is dropped. So, I didn't put all the data drop code in
this patch. Sure, I can reword the commit message and move the code
into this patch.
> 
> >
> > Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_eu_stall.c | 12 ++++++++++++
> >  drivers/gpu/drm/xe/xe_eu_stall.h |  1 +
> >  2 files changed, 13 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
> > index c388d733b857..437782f8433c 100644
> > --- a/drivers/gpu/drm/xe/xe_eu_stall.c
> > +++ b/drivers/gpu/drm/xe/xe_eu_stall.c
> > @@ -472,6 +472,7 @@ xe_eu_stall_stream_read_locked(struct xe_eu_stall_data_stream *stream,
> >   * before calling read().
> >   *
> >   * Returns: The number of bytes copied or a negative error code on failure.
> > + *	    -EIO if HW drops any EU stall data when the buffer is full.
> >   */
> >  static ssize_t xe_eu_stall_stream_read(struct file *file, char __user *buf,
> >				       size_t count, loff_t *ppos)
> > @@ -485,6 +486,16 @@ static ssize_t xe_eu_stall_stream_read(struct file *file, char __user *buf,
> >		return -EINVAL;
> >	}
> >
> > +	if (bitmap_weight(stream->data_drop.mask, XE_MAX_DSS_FUSE_BITS)) {
> 
> Since data_drop.mask is being touched elsewhere under xecore_buf->lock,
> here also it should be accessed under the same lock. So this returning -EIO
> should probably be moved into xe_eu_stall_stream_read_locked?
data_drop.mask is being accessed via set_bit(), clear_bit(), test_bit()
and bitmap_weight(). set_bit() and clear_bit() are atomic operations,
but test_bit() and bitmap_weight() are not atomic. So, not all the code
accessing the mask need to be under lock. The code that is under lock is
under the buffer lock, whereas xe_eu_stall_stream_read_locked() is under
gt->eu_stall->lock. So, moving this code into xe_eu_stall_stream_read_locked
would not make any difference. I think this code can exist outside of a
lock. If one read() just misses a data drop, the subsequent read would
report the data drop.
> 
> > +		if (!stream->data_drop.reported_to_user) {
> > +			stream->data_drop.reported_to_user = true;
> > +			xe_gt_dbg(gt, "EU stall data dropped in XeCores: %*pb\n",
> > +				  XE_MAX_DSS_FUSE_BITS, stream->data_drop.mask);
> > +			return -EIO;
> > +		}
> > +		stream->data_drop.reported_to_user = false;
> 
> I don't think this logic is correct. We should set this to false only after
> we have cleared all set bits (e.g. only after bitmap_weight) otherwise we
> might keep returning -EIO multiple times?
If the subsequent read() reads all the data from all the subslices, it
would clear all the bits. But if the user buffer is small and it doesn't
read all the data from all the subslices, some bits can continue to be
set and can cause multiple alternate -EIO returns. Ideally, the user
buffer should be big enough to accomodate all the data from the kernel
buffer.
> 
> If HW continues to drop data and keep setting the line, while we are
> resetting the bit, it is possible bitmap_weight might never become 0. I
> think that is ok, we have returned -EIO at least once to indicate to
> userspace that it is not reading data fast enough and HW is dropping data.
> 
> Or we may return -EIO multiple times as is happening here, where
> reported_to_user is set to 0 before all bits might have been cleared. So
> what is happening here might be ok too.
> 
> To see this clearly and evaluate it is why I am saying move all of this
> data drop handling and -EIO return into this one patch. So we can decide
> which approach to take: return -EIO just once or return multiple times.
> 
> We can also maybe defer this patch and merge the other stuff first if it's
> a separate patch.
> 
> So maybe this is ok, maybe not, anyway something to think about.
> 
> > +	}
> > +
> >	if (!(file->f_flags & O_NONBLOCK)) {
> >		do {
> >			if (!stream->pollin) {
> > @@ -680,6 +691,7 @@ static int xe_eu_stall_stream_init(struct xe_eu_stall_data_stream *stream,
> >	if (!stream->xecore_buf)
> >		return -ENOMEM;
> >
> > +	stream->data_drop.reported_to_user = false;
> >	bitmap_zero(stream->data_drop.mask, XE_MAX_DSS_FUSE_BITS);
> 
> Stream is kzalloc'd, why do you need to init these?
> 
> >
> >	xe_pm_runtime_get(gt_to_xe(gt));
> > diff --git a/drivers/gpu/drm/xe/xe_eu_stall.h b/drivers/gpu/drm/xe/xe_eu_stall.h
> > index f97c8bf8e852..8bc44e9e98af 100644
> > --- a/drivers/gpu/drm/xe/xe_eu_stall.h
> > +++ b/drivers/gpu/drm/xe/xe_eu_stall.h
> > @@ -31,6 +31,7 @@ struct xe_eu_stall_data_stream {
> >	struct xe_bo *bo;
> >	struct per_xecore_buf *xecore_buf;
> >	struct {
> > +		bool reported_to_user;
> >		xe_dss_mask_t mask;
> >	} data_drop;
> >	struct hrtimer poll_check_timer;
> > --
> > 2.47.1
> >

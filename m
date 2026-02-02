Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9427AE7DF16
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 18:05:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 244AA10E12C;
	Mon,  2 Feb 2026 18:05:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aa5Ft406";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0AF210E53A
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Feb 2026 18:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770055555; x=1801591555;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7MVFNVyFvzuxNEN4iTgqoFkH0q7aFGG5oYv4k9Jy7Hw=;
 b=aa5Ft406vreezLfkmXeJrkD1RhvetEebAmzjC64CxEcLYHMW2quqXTrw
 TGlDBEJEUcNY/4dZ/pU6UsmqjYRgj8lhD2XwW1X0hGr/tZAnTNIUwON/F
 +gKxEjiZ0Q/MC4Qxm7az4beFceKXerJy8askvRSldGwy6/BQh4m2Lw3BP
 K+N5KdI4v4sDpZEl8XwQ3PGjdPmvbERiiObsntmH+T19rH9V89Dvob+aS
 pIpkGGPV7nK5eCShLbSuBGxYrSnWF9JjxfKTkRfpHYnxi1uMMW/sdOE4S
 UnzxQhhpEOAFLTQikptnrThhJ0BWzZ0k8mLZRiqC30j8oqBqVRn8lmZ5/ Q==;
X-CSE-ConnectionGUID: BqZbbWtqRIaQ83Y5winiuQ==
X-CSE-MsgGUID: 6bx59rQrQ7uZTglkz7FDzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="70239787"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="70239787"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 10:05:54 -0800
X-CSE-ConnectionGUID: PYSrfvxaTF2p4F5XQ0IAFA==
X-CSE-MsgGUID: D5MOODZJTZmMNsmiBCVjYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="214554195"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 10:05:54 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 10:05:52 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 2 Feb 2026 10:05:52 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.70) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 10:05:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iZ3OeoWRwqUo6BcJthZxp00OGxk9KEF4dd7PmDcPX21bvi+Vthw6XONe6L95kWm4CCiehYzyEWMWV4E+vR/5S8E0GtIBWXB527HcAcJltTSeoTgK2sujyYgbDxv7LpmDj4v7A+JCMULXTz7oHPxDJCzOAyJ3V7e48z4bnTTYcAsEqnHjaBCtuUUOfQHQ66MJ/y/YmVpWLOQkMj4GiLjx/WTw3outM/ck5H15m0n5NcS2t7VNvf6gEl4JjGDIyV4Emmr6Wsdl/0sbbtS0tiNkYVvP0bOszaFjJJ68Xk0uKqGLxRh2HVbzGJQGnNYRU78xuzRc9Tow4ShG+bdfKdTpyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eQyNiZiARDc/6jH4RE1qsgpl4biXcjLQ9Q3j7e6N7d8=;
 b=Jkd3gkuqfjcN1UpSQlC1Z+c1s9+O9/yzEKr1wDYHkTxUXewuel6ZxachZgqIglZrlUGqZzwNKtIJCZwV/PIwYyxqJ0t3S2nGd0WTotFgxqE3+Xgt75B7aHPK+IhDyx+wrbPTxgZydXulrED37U6vA3NyiEstE3xZc7TjxACatqanVubQfvWPbeKnkCt9G9n2NkUioDsmHqgNOr6qqkt0eQYEAX3s2AxT1wtf3BQ7ZBUNrteagP07bG3XGevNjv+cxaMc8qNldKcpdD1YXdg5b0+gYh1QHO9fPv14izZyE4BPh7pFm0dnur1aA/B2P3QLxopd4DzpdHaaWpyhZBOOsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CH3PR11MB8138.namprd11.prod.outlook.com (2603:10b6:610:158::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.15; Mon, 2 Feb
 2026 18:05:44 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 18:05:44 +0000
Date: Mon, 2 Feb 2026 10:05:41 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: "Wang, X" <x.wang@intel.com>
Subject: Re: =?utf-8?B?4pyTIFhlLkNJLkJBVDogc3VjY2Vz?= =?utf-8?Q?s_fo?=
 =?utf-8?Q?r?= drm/xe: use entry_dump callbacks for xe2+ PAT dumps (rev4)
Message-ID: <20260202180541.GG458797@mdroper-desk1.amr.corp.intel.com>
References: <20260130175349.2249033-1-x.wang@intel.com>
 <177005017979.217225.16216786973290446077@a3b018990fe9>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <177005017979.217225.16216786973290446077@a3b018990fe9>
X-ClientProxiedBy: BY5PR20CA0022.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::35) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CH3PR11MB8138:EE_
X-MS-Office365-Filtering-Correlation-Id: e3430fb7-12cc-432a-c996-08de6285af11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?I/hxu6i3I7pLCUTFc13XIzN+xmoJMJvrOJ+5ACkhu7BG4lprxIv1fXGXUHkD?=
 =?us-ascii?Q?+Z3zeahxlmdNxlOGc6p1eJ+FUAr4EKGnXdgwNJJu3g+IusVywVVIS+uZW9ey?=
 =?us-ascii?Q?/0iSgaTLMDxmzGUK1lriQrkhDA+USIqs9xZIO+pbVWaj9YYQZyolBJNDS980?=
 =?us-ascii?Q?Wi4n+iLR1VzXcuVfZ45v/S5I5odnZRCRJQ9jPNl2HxdWhRDJLEYf3hoVUlVg?=
 =?us-ascii?Q?f6rAJhNep/PG0Oc2eiJXBnWbEfEDS9yo+8n+I8TYqBQrHWaPY6m3j7JVp7eh?=
 =?us-ascii?Q?yPqnFIbHDNhiCgmG6H3T3iUtgQYMxEDeODwHhe5S32tiuXGFYmp4ub6gTZYP?=
 =?us-ascii?Q?5vqDfqp0XJYuSYOtDN9QYpfDla/88oF26tj8IGKJE7AzGL6tvZaee84BAHUc?=
 =?us-ascii?Q?s0DQ5rqnnvZKJAWTj92qCgNsE+pK2TuA4a5vK4zV11+ZGbQsIOS6WGlVz4af?=
 =?us-ascii?Q?lZHqFAtHfRL8fGdja3LIRwo2euzbJytDrc64eKSl/9jS2HJXD43cXvQX0axA?=
 =?us-ascii?Q?okXHHxuoackat683BtnA3PMlZaUKFG89j/+cqBMgpAyXq3PiQ2wj8/Z9NU/e?=
 =?us-ascii?Q?dti9pWlks9HKUTlsPKjwzlDq4kWBQ2Z9KKigWcFpyXbCYLAcct018mcQwNHU?=
 =?us-ascii?Q?PE3/+3SlyUt/W9QrvLnlBRg3MdTOEjLu2GNB2yCBYazxKyPQh8X8akbhKYtF?=
 =?us-ascii?Q?Qypq/JJiLZdTK9OoQOC8Ok2FsrYz0t0279JxJe4xd9qajfRGMASmSXaTFFV6?=
 =?us-ascii?Q?XSKd+47U50AMjvPn6qGGTNk/t3hcU5pXnd0WSmTDqw443uTnJk641KTWY/+n?=
 =?us-ascii?Q?cJOflHqgSn6V2/AApLBO+gfb2SU4c0v/DVWgwouhIExNtoy5iTQyIX3eytYF?=
 =?us-ascii?Q?Z7qKbzsI86tHp4qkrxbTs+5JWdfphVKuQswmVY1k32I4Pm5z5g7uNw3klQRf?=
 =?us-ascii?Q?NPkVjpte1jPcGHdLO4hX75uQVeLx3K5Fval2dtkUFd/6GgpGZ+w5NXvSyodE?=
 =?us-ascii?Q?14jEfwtUwX1K4GLkVky4VlvSwhZEGpDruurpDdP6XMkdeySNTA7O++bcUvN9?=
 =?us-ascii?Q?xQvwf5mPuqynVet3AI6zdoO+6Q9upnRh1Ahv1l+ah0cSzjfgwCkpREZmmFXD?=
 =?us-ascii?Q?d8LbllAttgmHQc81fJlwbC9wwyE7ruywqq1LFge6msis/E8iY6CrqpbC04j1?=
 =?us-ascii?Q?7gqqvIln6hGCEsfEurEnfJquYZ+NTj5S/QPk2qTgUcYj1IHeUUG0T2oCdPuV?=
 =?us-ascii?Q?VrpOvRAKAilDlumpFthTVygO977E4AgRqg2yz63468U1PrR0TP1KhzLXE97H?=
 =?us-ascii?Q?krJP2Vz9UCpzei96skcaD/ctuVZ4jwzFw/dj+/7ltTR1b6sWPOGxrvpf7H3f?=
 =?us-ascii?Q?DZK+xvyUudwubd7CyoF3opwCRtU48fd7FGBAG1fQUG5V7eshmZoStOnSHwe1?=
 =?us-ascii?Q?lvEa3c2ljnJviqhXPKnGXM5pahq33bPBBKxHfTi6ar50QM62W6hFt3zA5/BS?=
 =?us-ascii?Q?yx4M5sA9RGn29D3n/ypGDVru/7JNf4DOuz40?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LspKq8+GCOhQO4aZHqrmoUUweecSL501YyD86rsnVGYvoJlB1ci0lJBhOp+h?=
 =?us-ascii?Q?gj/lM86hFFt54GGbT2OYTaaZIS9jS2O6OUw0jq16Zmfkpz526lsUCnLWNSNI?=
 =?us-ascii?Q?qlN/gvv/uXZo3vgzeeHd1B2vbZzzKtw3YOWFXNXIAm3vd/ZiJtLyAyyFb239?=
 =?us-ascii?Q?n62D+Vc0toIqm5BBHEsD54oLqaHfd4uYLClrWGYvQR1ZGCDzF0BP8zH/rocI?=
 =?us-ascii?Q?e+DhuCJGL482rUgmwD2LvFwk5tK/bXcz50cl15U2AXll3I+PAg0JdcOeUq0S?=
 =?us-ascii?Q?ug7vwTLuSix5zK+8tnr9vw7eW7zpLCtv/YsyLnDJuLIvZdh2pptr7J48EbZX?=
 =?us-ascii?Q?d+WTW2O1WqpJzp658nrNKP5M76b+pzPZlKIBfiDnx+U4Q4Utg7F/BzsXZojj?=
 =?us-ascii?Q?Aajg9XCj6ctoAZh0eqVWxRKkkyBdqOeHUI146846SAltWauqfP/kflha+9hh?=
 =?us-ascii?Q?ehWfWgYogcH2esqWLjuOCce+l5vlo5xVK8r59efb5C/nH4aySeKvvt+Y0Is4?=
 =?us-ascii?Q?M8ZR9r/YH9lufUIXA0qI74y+/nq2mPIifC32PNPsHEgixzvuXueptSrP+GTt?=
 =?us-ascii?Q?oXmyYqQbZwju9PdfObGYhko/LLb/z4vK+g7Fjy+bY8whI/lDpN2BZ76XxCFS?=
 =?us-ascii?Q?tHrQwEiYcp2xeTRbIr8FaBn0TdX/g/hAzv0lbNntoOmxzko1qNGlcnnjSJsh?=
 =?us-ascii?Q?MB0k5nVcbPqW7um6d1RmljupZFck8HBoRLXzzqNwcJ8dxOVRmQrV1PR2OD1X?=
 =?us-ascii?Q?NVl5GAKrVEcCGwu2n4GkMjJFLF+B9s3htmW5cr0r5QT9XY0uB6UQfe9lkFq4?=
 =?us-ascii?Q?Qde1q3SPrppJNxUdq739IH9qV88m+B+yjrSyMunGIHVI361wNv5ic8QL2wjU?=
 =?us-ascii?Q?wCcKQdTV7hcXkK/IieaQikNmPTuRSAg9UUMdEKZp0N5YGhMmp5e0xKucJk+k?=
 =?us-ascii?Q?KWeJnFFbUt2tNANlW99C0Os4AeFrWnhKzr4ObrMeGbnEzClrZfDGwxSKklz+?=
 =?us-ascii?Q?wlD7GBbGxiUD1aeKaQQWEo7tNzO+NEa7+/GLGQTQetZVUpbRn+rSdPStV7LO?=
 =?us-ascii?Q?iDJKeGixcDNje5xAeT1AJBe5dhhg1gRxqO4Eg15jEf8ZDS4E5jSMC8bNV5Yw?=
 =?us-ascii?Q?o+pkaG8UFhiAsxpPsF8Rf5zOvtCvNcmts+DHHpXzMKFnWolwaHs8DFUlZ6Ed?=
 =?us-ascii?Q?PB14sVuuqxjly84ULCqWl2dN7mpRUj9NfNEVJEhOWUc/WUV3v+ElPXHtXINK?=
 =?us-ascii?Q?2wlEwODhEAWNmSk/pDcz4mi38O9un0Vnlx5/nZk40v3wSdUITw0H9w7Eze0Q?=
 =?us-ascii?Q?dfOdmD8rJm9bcnIyUTCqS73ZpLrTAhkZJcDLVm1/d9ihTMfhaVHPVDvmlUWA?=
 =?us-ascii?Q?+mhGoC9x6ci2LwMBT3UZQu9FXnhKaoSclLdgLYodxeQyrIAwQSpOlHPzU3MF?=
 =?us-ascii?Q?f/M+1Fc0MN+yOpJEqsGs/dvDaqclQiskj/ZqyyEWOuCI9ke8Rjrl5vTd+NvS?=
 =?us-ascii?Q?jntVyTZ040yHAjOSsToeoLSG1cUj6FTKSC1175Mrpdea2+jSpLJ9dqrN1yj+?=
 =?us-ascii?Q?1ezF8maVYqHfL6Rk1zV61WKRra+JGjTBh67NEsXIaYTExW8JbdR5CEe4NJQp?=
 =?us-ascii?Q?OOYj9jN6mQc2CKsJ2exe20ONJWLAclqSwQGVL8u5O5yxuCNNTPkfSoQv6PRQ?=
 =?us-ascii?Q?xGjz4LswPQ8TaQqKjJMgTDqE23hn7Mpms9BoV9w1BmoSi9paEeDn828XD/GA?=
 =?us-ascii?Q?Yjn10qm9I9GzA4K6qJ+6Qd2db8W5Brk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e3430fb7-12cc-432a-c996-08de6285af11
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 18:05:44.4383 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i++gGNran0InM1aIcnIefuvYO1+evthzFrCWcVqlgPJXlUjQ8TJuDAXxUEZMdnIwqLdF7sU+3JpofRiVI9BIjMxJL7t5AQ01ggOyrlVvMAs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8138
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

On Mon, Feb 02, 2026 at 04:36:19PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: use entry_dump callbacks for xe2+ PAT dumps (rev4)
> URL   : https://patchwork.freedesktop.org/series/160868/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4476-feea7da320aa6950f02d3c4633ab678e6e61f7e9_BAT -> xe-pw-160868v4_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.

CI.Full results never landed on the mailing list but they're available
in patchwork.  The failures there are all for display tests that have no
relation to PAT entries.

Applied to drm-xe-next.  Thanks for the patch.


Matt

> 
>   
> 
> Participating hosts (12 -> 12)
> ------------------------------
> 
>   No changes in participating hosts
> 
> 
> Changes
> -------
> 
>   No changes found
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8726 -> IGT_8728
>   * Linux: xe-4476-feea7da320aa6950f02d3c4633ab678e6e61f7e9 -> xe-pw-160868v4
> 
>   IGT_8726: 8726
>   IGT_8728: 8728
>   xe-4476-feea7da320aa6950f02d3c4633ab678e6e61f7e9: feea7da320aa6950f02d3c4633ab678e6e61f7e9
>   xe-pw-160868v4: 160868v4
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160868v4/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

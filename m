Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 724B8CEE341
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 17:05:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3961210E4F7;
	Tue, 18 Nov 2025 17:05:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Elu7/wVC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF6410E4F7
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 17:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763485521; x=1795021521;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nzSiNgm9t/maTqtUx1x59g5mzuVzAla0/IoYIJKlCUM=;
 b=Elu7/wVCTyKgEuo0fRbeZ9wqPowhgo3NCXGfqa3ctr8Earxyo2zNQ/7t
 Vh55SmCL3N/+LPaUgc1KIoC0QZWWgYiioQ1OhAPjbjqRlvR0wUAJON40D
 t5DFGsLdDA+mjM+s5DyEj/P5U1MLexlkiFvlvkeEDAPyJkL3Med94DSlo
 XKyGSbLfJfdwrwsN6uIoKnbx/CFvI1QYmt88EAUBbDHzTLV5J+u9n3dh/
 UCXQhjFidM0k+FxWdzRG4nc0KvIRm1zktI44iNAiJmNcLM0lzLK8ykqTW
 DAFqKR/dhV4TjgySHO4JnBVq0Ou6LEeGEuGq9wbvn6iP/C+SOTaX+3qpk A==;
X-CSE-ConnectionGUID: DrqM1i6oR+yjuVojM0s/+w==
X-CSE-MsgGUID: AxGQKhV7R4azkK23xycS3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65453932"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="65453932"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 09:05:21 -0800
X-CSE-ConnectionGUID: aykXqOiBT5GuRJ0zwRuG6w==
X-CSE-MsgGUID: l62pxk8LTtKC/lA4YS5Wdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="195263875"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 09:05:20 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 09:05:20 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 18 Nov 2025 09:05:20 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.12) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 09:05:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IUZGe7FZaqGUSDoV25ZkdiGhPTWvGA6H+aqpdxAsx/drOgTHG9ZHjbzf6SfwYMbDlUghnn3UV5ifWdV0024XXstG+m4ibM0C+Iz4pg/3y5p0X32xBYaJv5s2rJpAamPVFczmzo6i2RFKzA4g2WrqrfKil8C5Ikfz2e9TRxS+ccg2I26LchG+X8iKtMcJNJyZA1gwAds4ZDsnpx2+Ekg/MBO4gigPj0OUksJnnCEiqju8KZty/Xsq8a3kr9XCy/tOqre2KoXAD58n/9pCwwd+ok0O5ZhchbWVZ7ryQJEFd5k5Ts0baAy38BjS3BBRO7Jjb29yU3lGpVcniCOHyO31ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HRzYSb//YLyGxn7i+EfcU7jkkIAxre6fUK93lckfimE=;
 b=QZQWcuAhlYb/FdPWES+UGJklavB9/PIPSUiYXOnPKVmpeqBOZnDQWt3Tytt6ENCwFfEE2xVGqhHWxCGT+QjbSLqJ8owdKga4OwRTRfY4Ifk+deHgPBWKmz0KXbO9RAwqn1CbQbihxGjjOrvLYzu+o/04chocCb38e52I46pqEztxenK5YMSlK3NgFosvUhKh7bweW0A9hMkG26cwbTI/66DRfdBW+OfWcY0W0n7grnsk7mr+3orFH6R1ndKLP0C8cALgUXcjjx5v1HTagpJDALhd6YX+CWCqC7G046LUErqGdN13HMBLBMdbYLojJQlHqzfwMnvS8RPTJSiwrOOrxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB4847.namprd11.prod.outlook.com (2603:10b6:a03:2d9::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 17:05:18 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 17:05:18 +0000
Date: Tue, 18 Nov 2025 09:05:15 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [bug report] drm/xe: Enforce correct user fence signaling order
 using
Message-ID: <aRynS3MfRj0V0VGh@lstrano-desk.jf.intel.com>
References: <aRyNbk3D91Hzb9Cy@stanley.mountain>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aRyNbk3D91Hzb9Cy@stanley.mountain>
X-ClientProxiedBy: MW4PR02CA0010.namprd02.prod.outlook.com
 (2603:10b6:303:16d::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB4847:EE_
X-MS-Office365-Filtering-Correlation-Id: 919e17c0-8338-448a-1d0e-08de26c4a653
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?de7B+UPSlcvVRfW81VXXQZ19RJ8e7FUoDOjRcaKWg3D8d9q4X9+8czxddaNF?=
 =?us-ascii?Q?U/5pE/jDrVQahNpSxg1G6o2joDa5fR+f61xfofDiZ5hg6S9WAdWa3nCI8YP5?=
 =?us-ascii?Q?LGAWo2dcknGkdGcJOwN4ZewMOshXJpa++QBQBi42m3PgGhyQF8FdwNgFjNXd?=
 =?us-ascii?Q?eIp6XAMZT+FVHwwj8r8rfNVVKQ/TU36cJ2XJQCzWiE97lyIKYDliXL1LcDKH?=
 =?us-ascii?Q?QMb9B4mWDfnQQOGo5Xzugk0z8plra1gK31TyFIzvv5m0b9NITHujMSxMQr0K?=
 =?us-ascii?Q?xhiAmGezd6oFOnHSOi1T0QWbaSNKTDIhAEDMzTPwlMkBXwPmuKCcStFqVcXQ?=
 =?us-ascii?Q?d46ACfF/F9VkfbX+I1V7ryIF45n9Z9X3A5qtVQA8K3quebGbAneCG76iDlQr?=
 =?us-ascii?Q?OfKnTeeNZYVcwKi2gFDz+UrXYZVrNlszW7k2YJt+wQr/+w56OWzC4bMLUntX?=
 =?us-ascii?Q?vNWk36YTDICbAktuf3SKTjCPld2lcNMvbwurKz6LY8eUY5KLXy8E0Tr7VSfG?=
 =?us-ascii?Q?HSlUQvECqjLslsIS0Jn0GRQUMSicjRns/MkrxfzgEeVHhokm8UEYmbpsgobc?=
 =?us-ascii?Q?6QBNpvx/AmkLgvoLfbmp9rOIAMI7hXH9Cmef3JsbDOs3jNDeRh8ID8tem7pw?=
 =?us-ascii?Q?Ts5jqX5RqCofZupMXbiEM71vwsJCPuPyL4AwuRPiEz6TxfogPxIiKz7yDVjy?=
 =?us-ascii?Q?91CFQA/N3fn66Yb46wmvz0kf25UTUeLTZMA0wpYlxfaMsABZ4yVkO5qtZOem?=
 =?us-ascii?Q?Xw6eK2AvKkqg9hOauJwBwwbWTdLDOpKprKbZor59/uRxSb5li8NdSDPUuxoH?=
 =?us-ascii?Q?7z2Jd3mrY0wuTRoPywvpyHd9kOv712hZ8njW8HWvsZ5Btf+1mkaG/7v3Z3Q+?=
 =?us-ascii?Q?by45BOEMlJgWx+tuys8b0l/LJMFL3Z/XKOcKot+6hoiM8lh+uMRbySStOdKz?=
 =?us-ascii?Q?UjFQ47t0WoCnW8NisNWKhRpWpao50pV9vPIspPRwLii/UB7CAZGaCHndFz/b?=
 =?us-ascii?Q?OeuAdvwHqEADNXYwcWM7vLffZWXbyWLtnBf0HbQHeHF7Cx42tgiKRwegVMO0?=
 =?us-ascii?Q?k3niVb9Bc977fMLJ51nK+OdIVpXFa8XzBycY2EIDI3PsRQiyUUfQHWxdthA0?=
 =?us-ascii?Q?RrefJXbfr6u7ENAfBTBZ7w0oXCpGt5zaJ/BwCeQzExxY7bLWiCNMNy3x4S+Y?=
 =?us-ascii?Q?drhuu+uNwb/EAdKqE1cl9KxTDHEoeuxxSdGxIysY47Qr3xtJjJeib9Wcw7Vm?=
 =?us-ascii?Q?BufJF3M6RW3naM7147JlnTBHRyqDHTzhCoWtj/tk2ff5hI9UWCtdYE3C+Xxb?=
 =?us-ascii?Q?fLOfsAE7BKMdB4T0AaDaWEU8JEKCQtsEkPhIjyVHIqmAFrf+ZXZenWGPHVwU?=
 =?us-ascii?Q?+JD19JTyjMJxTmlqmYLLGF19z/nT3wZhwp1xULOG5zcdCTahR59eCg4ayhJ+?=
 =?us-ascii?Q?HkIXdMhNhuvmnnJkG7VSXPtJR9qV1p1D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?opdvDLTX5YWmqtKtHn+qrwJloP1oBQujQGvLn5jmmF+VUPoKTv1QuGV3Y4k7?=
 =?us-ascii?Q?l3PL+/TT2zd4Rgp9e7RxtjnCM4i0RH27E7XuCt9I2qt+/SPj1cVLI8LGmOK9?=
 =?us-ascii?Q?11G7QmclvUgJoMMvWK9H5pu0ob7qkjgM73JfxUL02A2DmpX+VEANW082CZCQ?=
 =?us-ascii?Q?ZKnrNRRZ9tDyjGSN7t4eCBfC2c3jVGs6jUxLeSVEpekry5/x0udmRcbpBeyW?=
 =?us-ascii?Q?iPEQH6V9AJv+u2ZxvjHLdFbmtJs0rNpKfOyzbQsme/qiFT+NoollDF8n8sKc?=
 =?us-ascii?Q?VlVE0mxEl01k9L5Bqnl2EpmUd0L7y8XPKsZK3iNBdSayugijDvHiAxSic9ez?=
 =?us-ascii?Q?4jXfBWb87heKDGPFL7/fQdLEsxNO/mCMP0G3pvz6QuW1y3LuyF8fkFCZb66P?=
 =?us-ascii?Q?xXTbSAF0yacxutYeIDPvbr9Y0CmpIVqK5v6hAxQc98+Ombv+1MWPenyHfZMC?=
 =?us-ascii?Q?nD1zvo7ZclU3piiZRWwJwf6fwQn6gVUchhoezjGoVirl265TY80UwB7h15mM?=
 =?us-ascii?Q?V0QgWu6kO7p4wqHVn9HX0pbi9BF4n9sS1pQ932anus60N4NQ0+jRmD1/O/u9?=
 =?us-ascii?Q?2VJHmDHzdlojoCCFAKd1q4aut21dxBySUazPDdXlHOcHNK6ah4BAoIISedhp?=
 =?us-ascii?Q?TKMhiT9RSLVczwDakQWuufts14I5Iw+nC8SWb/8ctHWvYe5IvkrC3wh3sQKq?=
 =?us-ascii?Q?Q1mQ1n2B1QPq7fpOnxC6p1FeG906O5q9Td/f6jjGYIKI2JIwy05j7S9RKDSL?=
 =?us-ascii?Q?tOyrjwwLQhyIx1/ia2lcRfuqK9U6yLIgAxUg5WfR6dy9PC2UtqZfZNB1HmJ7?=
 =?us-ascii?Q?mUrlqC0f0bEPvh+PpmVsF7pziux2uS8yGmutC49pt/nWddBI0F4l94IjvpJZ?=
 =?us-ascii?Q?jcPlMcLeRUJLnkRl0nkvzQOURKXk1bWlHoB4TofUu5EIAF2yl1lSMZbjmWdf?=
 =?us-ascii?Q?Ke2+zjgodnUBWOM+0oCL6Lzqo55CrXpBHdL+FHMTkI04gDsVTi1uKxISAeLY?=
 =?us-ascii?Q?w1IRey4sk4U1LW9XPpHcR6rqLvFPpHXZamL4lblQUSBIu3dSfIAvAh6ELgzV?=
 =?us-ascii?Q?YU9u7UxBqi7TGZMYgRonitaROW+muyRTHvb4ejG5XT8mD87RDap/KYB7AyEo?=
 =?us-ascii?Q?H/zff++VJNnkXOY7Aki4UBxISXVr0kWoendybk6bF8K/GeHwMyPonS1SAh77?=
 =?us-ascii?Q?0PL0u05F3PQQldZzBmtoc8LlQKIaU8yqHquiIGP11/wVQTE5LYZ/CaImCbmb?=
 =?us-ascii?Q?oPECgpQ8HGSiCV3L97fE8VPY9vIOU3LiYn5RvA9vpWKUHKOQldyBOnh6+P0N?=
 =?us-ascii?Q?Esi5qr0IaIL6ROnZm+QIkfjpLXkpRyB2nHYw9p84Eex/R/5lo+CnlIayEnCN?=
 =?us-ascii?Q?V7rXKwZ7chtctLzkNWozgm0CPccnbP608y28E86ICWV8nwHGMHvUewQvdZLH?=
 =?us-ascii?Q?7WkiJtj9nZMb/gVtZFWmv8lqhVswncOPBEFXGgTYD3snI8ojE223xLyTUFa1?=
 =?us-ascii?Q?IjUvcbU4BPtSMIJbO2F+Xf0bImlu8PMGhyOSGpEoRLTyQFH3LpvrBGfpdV82?=
 =?us-ascii?Q?/YNUjImi8Fsct+TDP0vKAelg/zCHHtxhwQvJ4NMRvlZXrfcfWeB5++bV2nkh?=
 =?us-ascii?Q?vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 919e17c0-8338-448a-1d0e-08de26c4a653
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 17:05:18.0263 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XslmfYwqbHcGjxhK1Dgf03yHzRkYkglg7ewvTxseh2qj1uPYGPesOPzjqAryZyK7SB9AGqozIT7co3Fycpmxeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4847
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

On Tue, Nov 18, 2025 at 06:14:54PM +0300, Dan Carpenter wrote:
> Hello Matthew Brost,
> 
> Commit adda4e855ab6 ("drm/xe: Enforce correct user fence signaling
> order using") from Oct 31, 2025 (linux-next), leads to the following
> Smatch static checker warning:
> 
> 	drivers/gpu/drm/xe/xe_oa.c:1867 xe_oa_stream_open_ioctl_locked()
> 	error: double free of 'param->syncs' (line 1863)
> 
> drivers/gpu/drm/xe/xe_oa.c
>     1831 static int xe_oa_stream_open_ioctl_locked(struct xe_oa *oa,
>     1832                                           struct xe_oa_open_param *param)
>     1833 {
>     1834         struct xe_oa_stream *stream;
>     1835         struct drm_syncobj *ufence_syncobj;
>     1836         int stream_fd;
>     1837         int ret;
>     1838 
>     1839         /* We currently only allow exclusive access */
>     1840         if (param->oa_unit->exclusive_stream) {
>     1841                 drm_dbg(&oa->xe->drm, "OA unit already in use\n");
>     1842                 ret = -EBUSY;
>     1843                 goto exit;
>     1844         }
>     1845 
>     1846         ret = drm_syncobj_create(&ufence_syncobj, DRM_SYNCOBJ_CREATE_SIGNALED,
>     1847                                  NULL);
>     1848         if (ret)
>     1849                 goto exit;
>     1850 
>     1851         stream = kzalloc(sizeof(*stream), GFP_KERNEL);
>     1852         if (!stream) {
>     1853                 ret = -ENOMEM;
>     1854                 goto err_syncobj;
>     1855         }
>     1856         stream->ufence_syncobj = ufence_syncobj;
>     1857         stream->oa = oa;
>     1858 
>     1859         ret = xe_oa_parse_syncs(oa, stream, param);
>     1860         if (ret)
>     1861                 goto err_free;
>     1862 
>     1863         ret = xe_oa_stream_init(stream, param);
>     1864         if (ret) {
>     1865                 while (param->num_syncs--)
>     1866                         xe_sync_entry_cleanup(&param->syncs[param->num_syncs]);
> --> 1867                 kfree(param->syncs);
>                          ^^^^^^^^^^^^^^^^^^^^
> 
> xe_oa_stream_init() already frees param->syncs when it calls
> xe_oa_emit_oa_config().
> 

Admittedly this coded poorly but I think this a false positive.
param->syncs is only freed when xe_oa_stream_init returns success.

That said this should probably be refactored a bit for clarity.

Matt

>     1868                 goto err_free;
>     1869         }
>     1870 
>     1871         if (!param->disabled) {
>     1872                 ret = xe_oa_enable_locked(stream);
>     1873                 if (ret)
>     1874                         goto err_destroy;
>     1875         }
>     1876 
>     1877         stream_fd = anon_inode_getfd("[xe_oa]", &xe_oa_fops, stream, 0);
>     1878         if (stream_fd < 0) {
>     1879                 ret = stream_fd;
>     1880                 goto err_disable;
>     1881         }
>     1882 
>     1883         /* Hold a reference on the drm device till stream_fd is released */
>     1884         drm_dev_get(&stream->oa->xe->drm);
>     1885 
>     1886         return stream_fd;
>     1887 err_disable:
>     1888         if (!param->disabled)
>     1889                 xe_oa_disable_locked(stream);
>     1890 err_destroy:
>     1891         xe_oa_stream_destroy(stream);
>     1892 err_free:
>     1893         kfree(stream);
>     1894 err_syncobj:
>     1895         drm_syncobj_put(ufence_syncobj);
>     1896 exit:
>     1897         return ret;
>     1898 }
> 
> regards,
> dan carpenter

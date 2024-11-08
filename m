Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E6B3D6406B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 17:21:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12C8710EA1E;
	Fri,  8 Nov 2024 17:21:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aZGm8LJK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1B8810EA1E
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Nov 2024 17:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731086469; x=1762622469;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xEAu8pPtVlXwjNsRwYLbudwSRi3oWpLwsYswv+gNU+0=;
 b=aZGm8LJK9kQYabyLp6X7ougKJiyo3ll11Ji726KP8TvH/f0kRe/Y3dOB
 Sn3CZg4MsjQ4AQf9vp+AXddl5QQTMsTKYnKgkJxZ2VtZHDsDcHh6MWrry
 YKUjApuhkj+ry1eukerj2E9StsP9P+K4ktIrpCUrgkuhjDZjuPueMeRjj
 GD08lvODyYZhyKoOoJT7XFxz01r7iZrT9XTU89sgKo1NngxgHRncI3bXR
 GfYhj3chg7D9H9r1AV9rOaecGTv0fhlDPRLzXgqjiHUgx0sHOmURGdUip
 I5JO9eXMseIw65GzA8/l0CRVTUuLXCiSa4NINqRpzLCTC5AEpqO3DCZLZ Q==;
X-CSE-ConnectionGUID: okcDw+fORCKXn/1iBNML1w==
X-CSE-MsgGUID: NtwDK6c/S1m9oBXdpJBxLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="30376474"
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="30376474"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 09:21:08 -0800
X-CSE-ConnectionGUID: G2U7zkKbQeejNtkJgrFbAw==
X-CSE-MsgGUID: 7CqFVx/+QwKvXtrEXVu65A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="85649385"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2024 09:21:08 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 8 Nov 2024 09:21:07 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 8 Nov 2024 09:21:07 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 8 Nov 2024 09:21:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ByQat1GARVa17R6iurzhkS2vUkwOG0V/Zqu1lBl1hcTnFqrwf3G0CSPo4GhJt9R7rOIFyYIiyCSQEEIPqQ8fUvVLNsCrgjXmO0ZdR/DtujSJc8bozrEdpO9cTPLtgoM4+JkZmBGQyXw6dd9QF7PCQcqsDor94xc8ePKFktLjrUCvHKJT/qHo+lcQkn1a4hthw7BArXlInkqIZDFPAKbn6Cc0UBi53gmlNnh67I+zZdwND0jBEb1D0hPAYTHWgCOdXeFRfQ0nlawHJESz1iVGncU/tNKksKyw0HMQN38QTJKLn6bDwpHMiV8yRDfBvHhfbEkCJvC8WkO6XrDG1Ie+rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=keeEI0efVBqfotiE5J4qJ+AfsEsksvnSOnCAZ1+zs/w=;
 b=s2fAQ6MIlyqRKrwYki2uEh0EvO3c/tkfwDXR6Edi6nyhPnaMtPHzpHI8psoOikOpakIsScMlARi40T9cH1jnxmyZQXPTcc822U9ROnQR4zNh21odQVkn8ydGYUgdrK7Xw2JixYwo/giICTsw6t7NWGtrBFLdgZLfx9rjnAEsD1a2CYVkStXz096ICzWUrvgoZLc2L+opsuqODahjWQ3ARj8FZ7ErdaVdgNhqub9YJgHJ25HahiAqeMrSwY91PXYFWAabOlJMb961FOdnN9BwZh1wc6M9X+pumEfMBsUhNUzsUAV22Je3HjZtCyEH11cru2CHFPhsEeQWiUQIGcpERA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by BY1PR11MB7983.namprd11.prod.outlook.com (2603:10b6:a03:52b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.21; Fri, 8 Nov
 2024 17:21:04 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%6]) with mapi id 15.20.8114.028; Fri, 8 Nov 2024
 17:21:04 +0000
Date: Fri, 8 Nov 2024 18:20:56 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [RFC v1 1/1] drm/xe: Allow fault injection in vm create and vm
 bind IOCTLs
Message-ID: <Zy5IeAwHVCSMr2A6@fdugast-desk>
References: <20241108161307.1203967-1-francois.dugast@intel.com>
 <20241108161307.1203967-2-francois.dugast@intel.com>
 <Zy45chxLtJGTR7aA@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Zy45chxLtJGTR7aA@lstrano-desk.jf.intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: MI1P293CA0004.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:2::13) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|BY1PR11MB7983:EE_
X-MS-Office365-Filtering-Correlation-Id: b52b47ef-9693-4df5-1fa0-08dd0019b99d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TrJbiA4GsfHwQjbB2tXhcGxECsz0AhdZtkd1cdCc5NSNQDw9jfPK09FlKyIs?=
 =?us-ascii?Q?PWa3+9O9SJ9qvwL1wDytIt3Z14nM9hey7bt/El51fzoP15u4BY/cfdpkC8rz?=
 =?us-ascii?Q?WS54v3siE91z6cZQih8xWCaPYau5V5G+3aHKjr7u2HmYbNEtMYCxnxJZyy+6?=
 =?us-ascii?Q?5VTx2Ku8RIwKF0KI8EQMc+NvO9BliAd+jrKPXpqOmudpq0fDG17H7KK1FkyU?=
 =?us-ascii?Q?goTlhumkVNCdTr27o0IAT2LcB7q5Y7c/S8qWJY6s8iUg421PxegAVNazbqvu?=
 =?us-ascii?Q?l4bBy8QhCMR43GcomStitsaFiNQFtCk6orPYNRYGj0z50MHWt60ZyQCqgQvg?=
 =?us-ascii?Q?DZC86n1pVH7N//AsEpxYCQ/C1+AhLsyTcWs6l5ACgRqPOl64GcBdgbkLEoYL?=
 =?us-ascii?Q?oxvFa4VbktBmGhZoTcATp9MkG2VKfBmJHYRE6PviWUIkGJUkzFoPgjIWUhYB?=
 =?us-ascii?Q?ewOEIGikJaX/pnxo9VCzYvS7qqmSzLf3aqQxsOu4CIeqo/LCCHmrp4Y/BdX4?=
 =?us-ascii?Q?5l+UQTX7hKKy9kuVhUWwNCVoizg452hPqvCbpsbGhkp/3HpIHAuSe1n6KCDW?=
 =?us-ascii?Q?ZQIzSrYlYGhSsF37B3yIHn8WyDLoux6OuUI9KU1Go+LFGdVD4/ouyMYN6AZe?=
 =?us-ascii?Q?J0lTZ4wMJwxABrlXNfO4q9KAydinLcLDyqMXTBSvO0BU1pxVesglHEGXjYCX?=
 =?us-ascii?Q?qeCLD1UqGKna4LvAs9yX+Mx9ivxJyFgtrY7gHM1jq72wZvUpey+fTD9eZ35U?=
 =?us-ascii?Q?PrvsBG9f43VWZ4nEmkIutC0xHQsWPoNuSt9qGp368zAkX/B9XbzTNw8K1/Wi?=
 =?us-ascii?Q?mYiS3CgougYnEelHTJvcpYzUkZsC0+t6vGoiMr8dtPjmsOywCv4Uj09eb/TM?=
 =?us-ascii?Q?bkrcHlA0vR8/TUGFOaYXLPrwbHFDeyhmxGWHF1vLbmnC1NfeNY0x5owZaKni?=
 =?us-ascii?Q?bDmm7cjAJ2esI+O2fj/RrtpQuU8kNGX4Ty/QSv/Xsh8Y5Fze0HErCXR/JUn6?=
 =?us-ascii?Q?tsYYd7shV4Hre4fLMm3G8Pz18+bMFp/WoH/QsOmguVDJAX8T9zha6GRnll3r?=
 =?us-ascii?Q?71UaAI1kN8lOyqmUZcNghtzrkx2bPljxYqhDrBBhMcrug3Q6SLridgtTaJcf?=
 =?us-ascii?Q?nkA3Tz/xJNEf51x+fIbeimFcfHXrASRuxye1QVk9TTc4uPErMBGgGHRtUXh9?=
 =?us-ascii?Q?NjOkJBrdimIieF8sM9zyWy7zHKBY8jnVEIbJUz+TqGh6TugcItRUX+vgmysp?=
 =?us-ascii?Q?js4yhsgnOJES95Aw4UYQRAjNnJDfqCwQf8e6xRY/FZkbUtidObl6ArDdw3Kf?=
 =?us-ascii?Q?h7RzKxHC28Ow1ZdrHVBv5i+x?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ntFh/OMDYZYS/CzYnsRombRXSSTr8Y6WOUKjmRkVxm1ALYaUXEpIGhJYj5/G?=
 =?us-ascii?Q?3lU1RSfG8I/7zTrWSpjkvDVCsimASp1BwWnUu+TesqsNvGNOzMTONGgbRjvA?=
 =?us-ascii?Q?MQxBHrDvCrMP7hAceJSD7vt7wnlG78XSRgnFMyLEhfWgLL6IrQ738hMqu0PQ?=
 =?us-ascii?Q?8sFQzpd1wDaNtMZsqPqCWnIyHdJthgwLa8C0Hlih0Y3SvLlO0Xc7wpJpK1x1?=
 =?us-ascii?Q?jjE/sPXVQLhTWg0YKBYf8jybiZaBdZEpKfTuXJN4xcxbZK4HdRjyWXyKbvkY?=
 =?us-ascii?Q?4t/H1WcUxO0E17sMj5ewmlkryuPnW1jKtmLgn8X1vmwpLL2dLzX7qE6o/Gfl?=
 =?us-ascii?Q?WOe0urwMprboDgthkfbKrCVomVZj0DFe5CZnDJFN6Wjuyw27L9H1UhdFIcTt?=
 =?us-ascii?Q?J88rSEBoR/WwPOOIt1tbYCaOF/HNUrYyj2Ma1pFgDZ5xZo0iPtMMJo35IGFv?=
 =?us-ascii?Q?haLaH83Z6nf5j0sq4zv7nwDaZ/46Fo6rfhURDq26Ca31VdbDeAGlrMP1uUsL?=
 =?us-ascii?Q?H3d8qNek5bjKogy78mCQzH4/RS/Vy0JEXAeRVDYGutkmZHgMlDTFeJRLXCla?=
 =?us-ascii?Q?Wun35wiXw2nRGeurmKlM0YhtMXK4ofVx1N6dUCDjYWmvt8yDC0DS/dytxI5E?=
 =?us-ascii?Q?MWAl4AnYJne/3QKnuKD91YfzWv+Uj64RicIqTfrqeb6K/WJ9Hq2glyHwLKNL?=
 =?us-ascii?Q?mYygfYmmpHb69Om/GIsYiXQXppvn6VCzYaaMJhu5TE/qAiIFk5IzzD6Cy3ju?=
 =?us-ascii?Q?/8FxE8hImbG525UcuWo7yz/XVKQiYvuoTR+F7rtak8gfygw6jZ9uWb4lQF6l?=
 =?us-ascii?Q?IDb8b+NHaapa7ArbUVE0lFHn+Zhcp6qKrKZMzd/LPEL0mpvHneZ/WHFUGF9Z?=
 =?us-ascii?Q?gh3sndvTILgxVRsGfC7/pDnyt9tLW85QNxX3dn3phEHyloD9OLN6xelKxwLQ?=
 =?us-ascii?Q?d9tiOplIOrPK8+cbTLlD8N0g+mr2ICyqwcPCvBIS8ZUUHiPQvd67PRATJw79?=
 =?us-ascii?Q?hb1JrV2fxDDXIUhXM1DKYqnQsJZJEiHJd99YpkxmDuhEbMla43a3RVEtzSSj?=
 =?us-ascii?Q?NmojiKkEhY04vk/dYgkJTDoa9N0ZS4RplOB0Lh6hOGpSgoHfKYMLiEa32FjZ?=
 =?us-ascii?Q?KXlv27XTVd74TUVdq8iGh+rIWlmsjFVAfcRqDjdXNEGiOtFem7B3H1frNAsc?=
 =?us-ascii?Q?oSOuPs8mXr8toxEzcMNOybAWBZWMeIo97Jt+nJz13stTMrn3elc3XqQqG3eL?=
 =?us-ascii?Q?1rAyS97S8vcwBao8RIxfvG8NUWgmt2DgJ3bOMltDpQxzlUTF9j3gqjFC1umW?=
 =?us-ascii?Q?l1MXttBLs5QSo6/OhLtd8aT2Gcs7xZU7W70TZsBKqfhR6qcpy1dCXTeX2T1M?=
 =?us-ascii?Q?kngxCKn8STN36cPEFhImD27GPy5BNXnY9WUmbDONpCfLOZvuNmZHo8WNEmbw?=
 =?us-ascii?Q?OmsymxWzdkzvL9v1yXv1xjPK/Olb4jWTiitjwVKCPHw2OPlCY3cdz9qFjwGK?=
 =?us-ascii?Q?tvQ0ZKF8C85LCslhBFiQOCh5+pxRcQeGayg3EROpqPohIE64Pvp/VVZNAtYa?=
 =?us-ascii?Q?c47NBjhhscmciDlUfzXMI707F/VXyV1s5f5GuwKjOZtZ6EWV6LLBovZ0e7Ap?=
 =?us-ascii?Q?Lw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b52b47ef-9693-4df5-1fa0-08dd0019b99d
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 17:21:04.6463 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dGyQu67lo+6C5LkL/hvpioAW22djKm/5Vo8eoVAIfMSCiNKMPH/R0AiyQ4uEGUw60LDssMS+D5aGCU6nPwKyqHbc4NufjZHoHh6r4mRUSgg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB7983
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

On Fri, Nov 08, 2024 at 08:16:50AM -0800, Matthew Brost wrote:
> On Fri, Nov 08, 2024 at 05:11:56PM +0100, Francois Dugast wrote:
> > Use fault injection infrastructure to allow specific functions to
> > be configured over debugfs for failing during the execution of
> > xe_vm_create_ioctl() and xe_vm_bind_ioctl(). This allows more
> > thorough testing from user space by going through code paths for
> > error handling and unwinding which cannot be reached by simply
> > injecting errors in IOCTL arguments. This can help increase code
> > robustness.
> > 
> 
> Let also add xe_pt_update_ops_prepare and xe_pt_update_ops_run if possible.

This was just to show a couple of examples but it is straightforward to
add more, for instance this is enough to add xe_pt_update_ops_prepare and
xe_pt_update_ops_run:

	diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
	index e111698abbd9..684dc075deac 100644
	--- a/drivers/gpu/drm/xe/xe_pt.c
	+++ b/drivers/gpu/drm/xe/xe_pt.c
	@@ -1852,6 +1852,7 @@ int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vops)
	 
	 	return 0;
	 }
	+ALLOW_ERROR_INJECTION(xe_pt_update_ops_prepare, ERRNO);
	 
	 static void bind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
	 			   struct xe_vm_pgtable_update_ops *pt_update_ops,
	@@ -2132,6 +2133,7 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
	 
	 	return ERR_PTR(err);
	 }
	+ALLOW_ERROR_INJECTION(xe_pt_update_ops_run, ERRNO);
	 
	 /**
	  * xe_pt_update_ops_fini() - Finish PT update operations

and in IGT:

	diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
	index 43d3a2da0..ced6edaea 100644
	--- a/tests/intel/xe_fault_injection.c
	+++ b/tests/intel/xe_fault_injection.c
	@@ -233,6 +233,8 @@ simple_vm_bind(int fd, uint32_t vm)
	  * @xe_vma_ops_alloc:			xe_vma_ops_alloc
	  * @vm_bind_ioctl_ops_execute:		vm_bind_ioctl_ops_execute
	  * @vm_bind_ioctl_ops_create:		vm_bind_ioctl_ops_create
	+ * @xe_pt_update_ops_prepare:	xe_pt_update_ops_prepare
	+ * @xe_pt_update_ops_run:	xe_pt_update_ops_run
	  */
	 static void
	 vm_bind_fail(int fd, const char function_name[])
	@@ -282,6 +284,8 @@ igt_main
	 		{ "xe_vma_ops_alloc" },
	 		{ "vm_bind_ioctl_ops_create" },
	 		{ "vm_bind_ioctl_ops_execute" },
	+		{ "xe_pt_update_ops_prepare" },
	+		{ "xe_pt_update_ops_run" },
	 		{ }
	 	};
	 

Then in the next IGT run:

	...
	Starting subtest: vm-bind-fail-xe_pt_update_ops_prepare
	Subtest vm-bind-fail-xe_pt_update_ops_prepare: SUCCESS (0.042s)
	Starting subtest: vm-bind-fail-xe_pt_update_ops_run
	Subtest vm-bind-fail-xe_pt_update_ops_run: SUCCESS (0.048s)
	...

... which triggers vm_bind_ioctl_ops_unwind().

I will wait for more feedback and bring in those changes in the next version.

Thanks,
Francois

> 
> Matt
> 
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_exec_queue.c | 1 +
> >  drivers/gpu/drm/xe/xe_pt.c         | 1 +
> >  drivers/gpu/drm/xe/xe_vm.c         | 4 ++++
> >  3 files changed, 6 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > index fd0f3b3c9101..b999db5f5c19 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > @@ -240,6 +240,7 @@ struct xe_exec_queue *xe_exec_queue_create_bind(struct xe_device *xe,
> >  
> >  	return q;
> >  }
> > +ALLOW_ERROR_INJECTION(xe_exec_queue_create_bind, ERRNO);
> >  
> >  void xe_exec_queue_destroy(struct kref *ref)
> >  {
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index f27f579f4d85..e111698abbd9 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -136,6 +136,7 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
> >  	xe_pt_free(pt);
> >  	return ERR_PTR(err);
> >  }
> > +ALLOW_ERROR_INJECTION(xe_pt_create, ERRNO);
> >  
> >  /**
> >   * xe_pt_populate_empty() - Populate a page-table bo with scratch- or zero
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 624133fae5f5..2e67648ed512 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -740,6 +740,7 @@ static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_binds)
> >  
> >  	return 0;
> >  }
> > +ALLOW_ERROR_INJECTION(xe_vma_ops_alloc, ERRNO);
> >  
> >  static void xe_vma_ops_fini(struct xe_vma_ops *vops)
> >  {
> > @@ -1352,6 +1353,7 @@ static int xe_vm_create_scratch(struct xe_device *xe, struct xe_tile *tile,
> >  
> >  	return 0;
> >  }
> > +ALLOW_ERROR_INJECTION(xe_vm_create_scratch, ERRNO);
> >  
> >  static void xe_vm_free_scratch(struct xe_vm *vm)
> >  {
> > @@ -1978,6 +1980,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
> >  
> >  	return ops;
> >  }
> > +ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_create, ERRNO);
> >  
> >  static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
> >  			      u16 pat_index, unsigned int flags)
> > @@ -2697,6 +2700,7 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
> >  	drm_exec_fini(&exec);
> >  	return err;
> >  }
> > +ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_execute, ERRNO);
> >  
> >  #define SUPPORTED_FLAGS_STUB  \
> >  	(DRM_XE_VM_BIND_FLAG_READONLY | \
> > -- 
> > 2.43.0
> > 

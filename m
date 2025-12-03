Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB77CD12688
	for <intel-xe@archiver.kernel.org>; Wed,  3 Dec 2025 00:53:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DD4A10E527;
	Wed,  3 Dec 2025 00:53:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="duQJC06y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0233210E527
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Dec 2025 00:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764723187; x=1796259187;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=p9cy/ezvdw58PXSJ74kCukbdSFW6KqSNaw0biV+00oU=;
 b=duQJC06yhsOe5V5bRTWI63R2yt5DytFZO+pFIE69nLNzNMo9f9kaJugt
 6Tmk+BqVtM6HbRI9GMJXZFJV6v/ZqL6H+28jlqdr9zwxq0FnSrFSAWFCF
 KEwtStvUwjfT4leAcQLjqOPaIOPuxbPZxz9aFRXWy1Lqntv4jlhKveDxF
 WuNu+ahw/U+DbpmQrLmAU44RQDvW4GYhDdRSj5YSENXNVWCQ9HukULiF9
 6IU/eGavZXPNsaaiUSjCFSCKwAKa7RvdeMPEaSpVA5HLX7m5Tfms+e1+9
 /iHeAxzhjH2H6y0C78uSaUOaKIJpzG5KJwvs2QwtEQ8sOfQTNhA+eh7ys A==;
X-CSE-ConnectionGUID: RCuz+rc+TF2+jYhfGpqvug==
X-CSE-MsgGUID: HVRlSBsgRUG0meZALgQpog==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="54258602"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="54258602"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 16:53:06 -0800
X-CSE-ConnectionGUID: yPgEpdswTnyCMAUh5dFMdg==
X-CSE-MsgGUID: /VGgB484T3C+DHrv6ZUePw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="194524660"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 16:53:06 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 16:53:05 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 16:53:05 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.29) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 16:53:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DjoY4rqUcoVBrzasc/SM395UOXdd1V4KwCr7OfnLQ28F93cx7ciV0c1STkXuqt7S5371WjI5nWBN6fOTDQasmF1qv6ykmmKzLqZ02Vbdx3vvW2eN18EB5EhOU4WPUND911HOD5wmDEAZapFiA05+rfXd/GbFRv8nZqmGJTrfxn5Emqyf/ZqPAjHYsGdevfGeZyeyoIhSmZQ1PyrTsr/HPCBV3uRFmTMtQmpC5mnwVuVXnsscG/lX8ZSJQPmSxulNxJLZd7rpj7xmHBzzNlMyG15oSd0n4Lcz2apbK4LAul96je/eZMw1Q6NO62glsGeBNnas22WdYIvsTmtd4wokNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/NSxT8eGcY7YdXl9jSLzoIeNsCj7xcVyHB2yRfRIT5A=;
 b=DfzLlLVFdf7f55b2vEXJ6jYN9GppUvO6+c9LZLet9mU+PwQo0HPRQJt3MADYP26O9FGAVN5eZYbGPSW+hDCSnKt/cDFjIilIJDagGPmN6b0uga8Ks7ucv3B5L535VIhMALQ8ZhMR/ypjorklS+88AVQ6eUiL8n7Hu8zy439NSonrVBSQ5z5maiAgZWlAJLV99Yp299DG3g9/cz95joD+rha8xYix/ntejIfhv7CwwoE5ma1WJ/FFULzQvFxEKLtZ2MEpI3f6LJbfdSB00m8tqCzWUnA9Ou+JinE6S2Kt2vWY8SX7fFaE8sV2R7sZxLyIRHSH/y5abhtOwITd5gx1XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SJ2PR11MB8515.namprd11.prod.outlook.com (2603:10b6:a03:568::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 00:53:03 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%7]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 00:53:03 +0000
Date: Tue, 2 Dec 2025 16:52:56 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@intel.com>, <riana.tauro@intel.com>,
 <badal.nilawar@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [RFC 5/5] drm/xe/sc: Add system controller component for Xe3p
 dGPU platforms
Message-ID: <aS+J6IqvkEQDK+Y6@soc-5CG1426VCC.clients.intel.com>
References: <20251122045803.3616201-7-anoop.c.vijay@intel.com>
 <20251122045803.3616201-12-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251122045803.3616201-12-anoop.c.vijay@intel.com>
X-ClientProxiedBy: MW4PR04CA0068.namprd04.prod.outlook.com
 (2603:10b6:303:6b::13) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SJ2PR11MB8515:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a90ff16-31c7-4756-06a4-08de3206502f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WEJzTi94UGtXbGh4WUNjb2ZTQzVTRWJiYmpXMHAyNUkyKzJubzJ1M2F3YjZq?=
 =?utf-8?B?QmYvNXFXelVwK1d3TnZYNXRWOVd3dGdMK0JjaVl4UzVBOXlEbUFTMEJhRFhn?=
 =?utf-8?B?NnFhUzJKNCtsQktJeStGVndTeVpCdSs5ekNGQnpGSmlkamVad3NaMkl3bFBh?=
 =?utf-8?B?RzExOW9neFdETUJIbTh6MEJuZDgxazk1SmdxM0ZrempreXR5UnVvNzV6ZGpv?=
 =?utf-8?B?dHlXSTIzaHdlYXZUUzNnNWordktnRllZMGNuQjNIQnJFbUN6TGJzNHVhR08v?=
 =?utf-8?B?N3k0Y0VraDM4SEMzMGxoeDVLUGRYY2UzeGZDRFZ2N3RMN0pvckJSM0tsbnpO?=
 =?utf-8?B?TXFRT2VyeUNENlQ3WThnMUw5elF5ZSs4d1NHb0F2ZzExRk9hL3dHSjNpUUZu?=
 =?utf-8?B?dFpmZnlRTktyUWhYamhKU0M5UWhVd1VnK2k3T0FKUmJlRi9MUmV1ZW1NR244?=
 =?utf-8?B?OGJZYlpaZ3FYeWFsczhWVHF1QXFHQmJBNlZsL09wTHlXUFltNi9yeEZsSndZ?=
 =?utf-8?B?L29aZXVIRnYwQUsrYXR4dU5BaWMwU0dHb0ZRY21zbHFSV21zU2YvS3VkUXBo?=
 =?utf-8?B?VFQ0bWpZMmNOampuM1JKUTZ5N2lDR0JMNXBOSE5ueEV2SmZSaUpGR09DYnhF?=
 =?utf-8?B?UWliUHBMbnh2L1dHeGVjbVp0RlVPZ01sczFUallHYVh3dmk2TG1acmlpOXZk?=
 =?utf-8?B?OFZrY0FrYnRlYXJCWHJrV1dWcDZkUzRUN25Wb0RXbkdTZnFneXlUcnFQeUo5?=
 =?utf-8?B?WjNFaEpQM1lMclRzWU0vdCs4QmJyQVpOdmZuTTZLWGt2aVd4YmJHdWRzMW9L?=
 =?utf-8?B?L2hHL0ZwYW1mTEZxR3o0RFBwVWwrblZRUWpjK0NQZVBDOTY0bGVDdzYxaDhm?=
 =?utf-8?B?eGRCbW9lN0NtMkZnS012WkNnckdTMnZZNTd3TUZyVW9wckUzajJtejdoRHhP?=
 =?utf-8?B?aUtVU20rdVh4NlJyNjQxcms0eHR4cGxhM281RDV2NE5FSkFidEIzK0pQblZB?=
 =?utf-8?B?MjB6bk5KRllMczZnaGdkenU1NUw4dENZY1ZvSXZGK2N0cW10WEQ0cmNZeVVP?=
 =?utf-8?B?Y01jQnM0UjhzclpPZEZnSGRRQkcwRnlQby8rS3pWVWtpUjJjTGVmaDRCRDVw?=
 =?utf-8?B?S3BvV05ocW5Gb004MFo1Z2lzRzd2ZUdLV0c2czBCaTRHRnVwdVY3eUFLQXJw?=
 =?utf-8?B?M20wU2x1M3NKQ2xSQ3l1ZG1zbER6WWJYZ2FsNmpXZ0Yra2ZXRWtYRGE2ZXVG?=
 =?utf-8?B?d0hVMXpFSUQ4UHBQK3Nla2ozZEhRMGp1UG9FMitrd21rb1o3WE9YQnFNZ1Fm?=
 =?utf-8?B?V0hQNXg3RHR4MkF2QUJZcmh0UzBXRHMwZ1ZaS05EaTF5KysrQXNDNVorWFZk?=
 =?utf-8?B?RHZIcUN5YUFxT1FZZ0lvQ04xYTkrRHh2akhFRFRpdzVXTEpDZ28xSmtJYWxm?=
 =?utf-8?B?VDhTYXNOYmxSTnVBMWpuNXdyVEtSWW9FWlNLVy9iTXhxd1l3QndFaGRzYXRy?=
 =?utf-8?B?c2F4VXhMcFhBNy91bWRkaXU2dDc3YzQzVUV3bU5TWjJZSnhuRHJsL1VyYU5a?=
 =?utf-8?B?b0pEVVc4Z0YraUFhZWxHa3kzR2ttdHp3ZitKa1hoOGdHdEVPbHFJRmQzWVZM?=
 =?utf-8?B?QUNFWWVXbVRrTUgvOHk0UlRienltTDQxSkUwZEpjdyt3T0JMcVF2M05Rck02?=
 =?utf-8?B?UVZZWi9PU3NVbFg1cU1DcFcycnk2RHF4dlRScmx5L0Z6SkJzdGxWbmROQXBH?=
 =?utf-8?B?MFZFZ3g4TWY2NERJYnZlcDNGOFBpUzFqZG41TmZRcHlQRkZNNnMyVW1SVlVT?=
 =?utf-8?B?bFd0eC94ZzQ4SXRORlloWE5vNjFJeTY4eklaTkVyYXJZTThXcWpqejdVMVVZ?=
 =?utf-8?B?cXd0OUZKTmkrN21WUWFGRmYyNThzZzVNT095VnlRTHF5SDFRSjIrU1BkOGND?=
 =?utf-8?Q?9WGb5sF/Xf4dreweXfsucnbCRbdagSGW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U241OWkwdXVZSU03YUpzN2hnWGVHTEhwdzBuRjNsazBvTC9id0pkcWpBY1ov?=
 =?utf-8?B?emkvVnBXQlM2OTRRTGtDblJrb1dDNHVBcnZwV2wra2c4UkRTVVk5N0dBVkNa?=
 =?utf-8?B?U05PL293VVBzR1RmUHkxZ2JkQUxGREFWVy81SmdXeWdCN3BrYmI2S3dDczZh?=
 =?utf-8?B?aVhzWnRxWWN5VXdXZjR4b3BYbEtJNGN4RkovdjBlalB3Sk1hOGxvdzREbGRn?=
 =?utf-8?B?TWpPK2UyTDMvakxLOEdYZWVJN2drOFNNRHhNVHhBeUNYUVlNZUcwNXJZRHZW?=
 =?utf-8?B?RGE5RklEYVc5UXNmQ3B2RkhhazhtWnJ4YnRoZFUwRGxROFZtQ2VnTW14VU82?=
 =?utf-8?B?Q0RtSlptdmtzUFpEVS9QNytMYW9jZVJwSmdjdFJSK242RDFUQysyRWVWbjM2?=
 =?utf-8?B?TmRnYnV2aUJRVkRnUmZvL3hLaTJrQWt1QzdHM21DWi9yVVpkQXJlQjZHVFU2?=
 =?utf-8?B?M2d1TGUxR3U3MGw0WFM0VGQweEFTeFBKaEsreWZyRitmUGpBWWpkUHlnTUV1?=
 =?utf-8?B?aFZaOFhjM3BZVUU2c0hIVXdjVkZUamtGWTQ2S2VLSDJLZ1ViWFF4dkJ5OGZz?=
 =?utf-8?B?QnNQRHFJTUpGYzJpU01NQjNmd0dKbW9BY2hMVkFXZmN6TmZVaFluZkFwRVZq?=
 =?utf-8?B?dUxZcGFJbnhWUE54VEdCdExDbWpHNE45V3Vqb0IzWE41ZU5RcWdscmxreGZZ?=
 =?utf-8?B?VmJ3Sjg0OXQ5cnJoRjJObyt1SHQxcFBmald3akNIVHJOT1N2ZDFoUzJCR1Ji?=
 =?utf-8?B?azZBZ3V1RXkyOXkzZ1k4cTkwR1pxZndoR3U1bjFndDJCU3lQbldzeE14d2tv?=
 =?utf-8?B?Sk9UK2dBeS8wckxTeUV1L1RWWnZQaWlqZ2tQbUhhcEhHZEpDZDYycFF5RVFx?=
 =?utf-8?B?N3lOMERZeS9UcFlPamoyT3h4ZU41TUc4RWVDVUt3ZVNpZERnYUczODlyL0tl?=
 =?utf-8?B?MXA0TmlMWnZNbFE5T2RSMlIzVldkRjJ6MmQrRmI4bm1XbkxNQmJwcWFIQTNo?=
 =?utf-8?B?VGVRcGh1N0pDRWhpQUhHUXIySGFCMHQvZURhVXNQMm9vZmhNQVVtOFJzWTdh?=
 =?utf-8?B?WjU4Q2l3b0RqNDc4bmRBV0UxZndGYTNRYXhHTFl3RWduZ09PUmhmRy9mY2hH?=
 =?utf-8?B?MlZPZmxzeXJMQVg4ejhGRjFmRVI3TVBYaENGMFZLRWNUMlYreGc3OVVlcG42?=
 =?utf-8?B?M1RLQjJ5bCt2c2NVeDhBdkZXbk9vY1FuTlQvZWhMbkxkdXlwVUt4QndHemJp?=
 =?utf-8?B?UmtDeTZZZlAxN1hKRytlVnBtMFBWMXZwR0NzVTRNWmcwcHhQT2NyL2hCT2Ev?=
 =?utf-8?B?WTNLdVFXVXRBKzZrb3RWcDJ6OU1oRDhxQ1Y0Q3cweFlwTU11YzBORHF6VURi?=
 =?utf-8?B?YmhIOHBNeVcvOWk5VjVlMGsxNmhDYVJZdUoyS0o2OW9uRVVVbGlhYTFJOFV3?=
 =?utf-8?B?R2NScXJnaE1Qa0RyRVhYcUdnd1VNNmY4QmFzcEQzMldHSnRXV08yWFFNNzF2?=
 =?utf-8?B?aUNHcXVRODI5MjZRd0gxVG5WUGJaNk5UZ1VENlA2TVFtZGFlWHVBdUdDUkVt?=
 =?utf-8?B?L2JiNTFZZUxVcFZacTdsZTNzdE9pWmhyU0UrQWR6eHJ5ZEV2ZFV4VU5peFRO?=
 =?utf-8?B?TWZ6dTh6MFZ0RlN2WnJQNDNWU2xwamR6aFJsZU0wL0NjWUhWWnZaUW5tYks4?=
 =?utf-8?B?c21IM01Xd1BUOWd1L08zMG83VnBHVzhXWm9BeUR0QUdkS3JtTDMvOUJUNHpn?=
 =?utf-8?B?RWVPRHRqVHFKRFdxNXBHdWxjcWNZZEp4K1Q2S1VNRGw2RVNIbFVza0tST2hX?=
 =?utf-8?B?VUxpSWZKTDZGWjN6NHEyajRreGYzN3o1TllTLzlybTZyQ3NROXY2OUZUSk5S?=
 =?utf-8?B?b3lVdnJkZkg1Ry9nMFIvenl1bWpOb0NXRG1XOEtyZXlRcTQ4elM0ZmxIZXdE?=
 =?utf-8?B?QlRVaTdBSWFBNnZCVDVFYkthendRRk5Nc3pSbHJSK2ZzZDh0bDBMWG5UVkdC?=
 =?utf-8?B?VDdDVUJzZTh2ZzJsNlYwajZaR01yTFdPTXowOVJpcEFSYVovUi84bFdFOE9J?=
 =?utf-8?B?S1QwNndvYXNEbFA1R2hscUpnb3FpRDdobkFkQXFrNkpHVjZ2am5QNUJRWVNP?=
 =?utf-8?B?SE1wNmRRemh2TEVYbloyMUY2OEVHTnlvVjZOVGNQVFFyb3BCa2N5RzA5V0NC?=
 =?utf-8?Q?ePjmx8xWRus0jOC5bX/Dh8k=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a90ff16-31c7-4756-06a4-08de3206502f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 00:53:03.2111 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nUDCZmDG9glMs5UjKPr5jMNtQOfI5ogUV0Liqy7iFxHDUxjh5vNHJ8s2YWBGPd4eKTC2JaSSdhXVs9T+2MKhvARMmiPZUokZLrae8eowdeM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8515
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

On Fri, Nov 21, 2025 at 08:58:07PM -0800, Anoop, Vijay wrote:
>From: Anoop Vijay <anoop.c.vijay@intel.com>
>
>Add a new system controller (SC) component for Intel Xe3p dGPU platforms.
>
>This component provides the foundational infrastructure for communication
>with the SC firmware using the MKHI protocol over a mailbox interface.
>
>Key features introduced:
>- Detection and initialization of the SC interface on Xe3p dGPU platforms
>- Mailbox communication with SC firmware
>- Fragmented message transfer for large command payloads
>
>This implementation establishes the base for future SC feature
>enablement and firmware command handling.
>
>Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
>---
> drivers/gpu/drm/xe/Makefile          |   2 +
> drivers/gpu/drm/xe/regs/xe_sc_regs.h |  49 ++++
> drivers/gpu/drm/xe/xe_device.c       |   5 +
> drivers/gpu/drm/xe/xe_device_types.h |   5 +
> drivers/gpu/drm/xe/xe_sc.c           |  89 +++++++
> drivers/gpu/drm/xe/xe_sc.h           |  15 ++
> drivers/gpu/drm/xe/xe_sc_mailbox.c   | 374 +++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_sc_mailbox.h   |  61 +++++
> drivers/gpu/drm/xe/xe_sc_types.h     |  35 +++
> 9 files changed, 635 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/regs/xe_sc_regs.h
> create mode 100644 drivers/gpu/drm/xe/xe_sc.c
> create mode 100644 drivers/gpu/drm/xe/xe_sc.h
> create mode 100644 drivers/gpu/drm/xe/xe_sc_mailbox.c
> create mode 100644 drivers/gpu/drm/xe/xe_sc_mailbox.h
> create mode 100644 drivers/gpu/drm/xe/xe_sc_types.h
>
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index 7ebfbf9051bf..50e8dc86d915 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -114,7 +114,9 @@ xe-y += xe_bb.o \
> 	xe_ring_ops.o \
> 	xe_rtp.o \
> 	xe_sa.o \
>+	xe_sc.o \
> 	xe_sched_job.o \
>+	xe_sc_mailbox.o \
> 	xe_shrinker.o \
> 	xe_step.o \
> 	xe_survivability_mode.o \
>diff --git a/drivers/gpu/drm/xe/regs/xe_sc_regs.h b/drivers/gpu/drm/xe/regs/xe_sc_regs.h
>new file mode 100644
>index 000000000000..2b7053586197
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/regs/xe_sc_regs.h
>@@ -0,0 +1,49 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2025 Intel Corporation
>+ */
>+
>+#ifndef _XE_SC_REGS_H_
>+#define _XE_SC_REGS_H_
>+
>+#include "xe_regs.h"
>+
>+#define SYSCTRL_BASE_OFFSET		0xDB000
>+#define SYSCTRL_BASE			(SOC_BASE + SYSCTRL_BASE_OFFSET)
>+#define SYSCTRL_MAILBOX_INDEX		0x03
>+#define SC_BAR_LENGTH			0x1000
>+
>+#define SC_MB_CTRL			XE_REG(SYSCTRL_BASE + 0x10)
>+#define   SC_MB_CTRL_RUN_BUSY		REG_BIT(31)
>+#define   SC_MB_CTRL_IRQ		REG_BIT(30)
>+#define   SC_MB_CTRL_RUN_BUSY_OUT	REG_BIT(29)
>+#define   SC_MB_CTRL_PARAM3		REG_GENMASK(28, 24)
>+#define   SC_MB_CTRL_PARAM2		REG_GENMASK(23, 16)
>+#define   SC_MB_CTRL_PARAM1		REG_GENMASK(15, 8)
>+#define   SC_MB_CTRL_COMMAND		REG_GENMASK(7, 0)

For MASKs (the above 4 defines) , use _MASK suffix. Same applies to any 
masks below.

>+
>+#define SC_MB_DATA0			XE_REG(SYSCTRL_BASE + 0x14)
>+#define SC_MB_DATA1			XE_REG(SYSCTRL_BASE + 0x18)
>+#define SC_MB_DATA2			XE_REG(SYSCTRL_BASE + 0x1C)
>+#define SC_MB_DATA3			XE_REG(SYSCTRL_BASE + 0x20)
>+
>+#define MKHI_FRAME_PHASE		REG_BIT(24)
>+#define MKHI_FRAME_CURRENT		REG_GENMASK(21, 16)
>+#define MKHI_FRAME_TOTAL		REG_GENMASK(13, 8)
>+#define MKHI_FRAME_COMMAND		REG_GENMASK(7, 0)
>+
>+#define MKHI_HDR_RESULT			REG_GENMASK(31, 24)
>+#define MKHI_HDR_IS_RESPONSE		REG_BIT(15)
>+#define MKHI_HDR_COMMAND		REG_GENMASK(14, 8)
>+#define MKHI_HDR_GROUP_ID		REG_GENMASK(7, 0)
>+
>+#define SC_MB_FRAME_SIZE		16
>+#define SC_MB_MAX_FRAMES		64
>+#define SC_MB_MAX_MESSAGE_SIZE		(SC_MB_FRAME_SIZE * SC_MB_MAX_FRAMES)
>+#define SC_MKHI_COMMAND			5
>+
>+#define SC_MB_DEFAULT_TIMEOUT_MS	500
>+#define SC_MB_RETRY_TIMEOUT_MS		20
>+#define SC_MB_POLL_INTERVAL_US		100
>+
>+#endif /* _XE_SC_REGS_H_ */
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index f15489c100af..9fbd0b084c74 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -60,6 +60,7 @@
> #include "xe_psmi.h"
> #include "xe_pxp.h"
> #include "xe_query.h"
>+#include "xe_sc.h"
> #include "xe_soc_remapper.h"
> #include "xe_shrinker.h"
> #include "xe_survivability_mode.h"
>@@ -963,6 +964,10 @@ int xe_device_probe(struct xe_device *xe)
> 	if (err)
> 		goto err_unregister_display;
>
>+	err = xe_sc_init(xe);
>+	if (err)
>+		goto err_unregister_display;
>+
> 	for_each_gt(gt, xe, id)
> 		xe_gt_sanitize_freq(gt);
>
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index 3f118c64a124..86a0c83c802d 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -314,6 +314,8 @@ struct xe_device {
> 		u8 has_range_tlb_inval:1;
> 		/** @info.has_sriov: Supports SR-IOV */
> 		u8 has_sriov:1;
>+		/** @info.has_sysctrl: Supports System Controller */
>+		u8 has_sysctrl:1;
> 		/** @info.has_usm: Device has unified shared memory support */
> 		u8 has_usm:1;
> 		/** @info.has_64bit_timestamp: Device supports 64-bit timestamps */
>@@ -576,6 +578,9 @@ struct xe_device {
> 	/** @heci_gsc: graphics security controller */
> 	struct xe_heci_gsc heci_gsc;
>
>+	/** @sc: System Controller */
>+	struct xe_sc *sc;

(1)

It would be simpler to just make this a non-pointer.

	struct xe_sc sc;

or struct xe_sysctrl sc (if you renamed the structs)

This way you don't need to back reference xe from sc. Most of Xe KMD 
code tries not to back reference to parent structs, unless it is 
essential.

>+
> 	/** @nvm: discrete graphics non-volatile memory */
> 	struct intel_dg_nvm_dev *nvm;
>
>diff --git a/drivers/gpu/drm/xe/xe_sc.c b/drivers/gpu/drm/xe/xe_sc.c
>new file mode 100644
>index 000000000000..18448efc173f
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_sc.c
>@@ -0,0 +1,89 @@
>+// SPDX-License-Identifier: MIT
>+/*
>+ * Copyright © 2025 Intel Corporation
>+ */
>+
>+#include "xe_sc.h"
>+
>+#include <linux/mutex.h>
>+
>+#include <drm/drm_managed.h>
>+#include <drm/drm_print.h>
>+
>+#include "regs/xe_sc_regs.h"
>+#include "xe_device.h"
>+#include "xe_mmio.h"
>+#include "xe_platform_types.h"
>+#include "xe_soc_remapper.h"
>+#include "xe_sc_types.h"
>+#include "xe_tile.h"
>+
>+static void xe_sc_remove(struct drm_device *drm, void *arg)
>+{
>+	struct xe_sc *sc = arg;
>+	struct xe_device *xe;
>+
>+	if (!sc)
>+		return;
>+
>+	xe = to_xe_device(drm);
>+
>+	mutex_destroy(&sc->cmd_lock);
>+
>+	xe_soc_remapper_set_sysctrl_region(xe, 0);
>+
>+	xe->sc = NULL;
>+}
>+

If you made sc a non pointer (xe.sc), then it would look something like 
this:

static void xe_sc_fini(struct drm_device *drm, void *arg)
{
	struct xe_sc *sc = arg;
	struct xe_device *xe = container_of(sc, typeof(*xe), sc);

	mutex_destroy(&sc->cmd_lock);
	xe_soc_remapper_set_sysctrl_region(xe, 0);
}

static int xe_sc_probe(struct xe_device *xe)
{
	struct xe_tile *tile = xe_device_get_root_tile(xe);
	struct xe_sc *sc = &xe.sc;
	int ret;

	ret = drmm_add_action_or_reset(&xe->drm, xe_sc_remove, sc);
	if (ret)
		return ret;

	xe_soc_remapper_set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
	xe_mmio_init(&sc->mmio, tile, tile->mmio.regs, le->mmio.regs_size);
	mutex_init(&sc->cmd_lock);

	sc->phase_bit = 0;

	return 0;
}

You could merge the probe into init below and rename xe_sc_remove 
xe_sc_fini().

Also, like Michal mentioned, maybe we should rename functions, structs, 
files to xe_sysctrl. The variable can likely stay as sc. 

>+static int xe_sc_probe(struct xe_device *xe)
>+{
>+	struct xe_tile *tile = xe_device_get_root_tile(xe);
>+	struct xe_sc *sc;
>+	int ret;
>+
>+	sc = drmm_kzalloc(&xe->drm, sizeof(*sc), GFP_KERNEL);
>+	if (!sc)
>+		return -ENOMEM;
>+
>+	sc->xe = xe;
>+	xe->sc = sc;
>+
>+	ret = drmm_add_action_or_reset(&xe->drm, xe_sc_remove, sc);
>+	if (ret) {
>+		xe->sc = NULL;
>+		return ret;
>+	}
>+
>+	xe_soc_remapper_set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
>+
>+	xe_mmio_init(&sc->mmio, tile, tile->mmio.regs, tile->mmio.regs_size);
>+
>+	mutex_init(&sc->cmd_lock);
>+
>+	sc->phase_bit = 0;
>+
>+	return 0;
>+}
>+
>+/**
>+ * xe_sc_init - Initialize SC subsystem
>+ * @xe: xe device instance
>+ *
>+ * Entry point for SC initialization, called from xe_device_probe().
>+ * This function checks platform support and calls the main probe function.
>+ *
>+ * Return: 0 on success, error code on failure
>+ */
>+int xe_sc_init(struct xe_device *xe)
>+{
>+	int ret;
>+
>+	if (!xe->info.has_sysctrl)
>+		return 0;
>+
>+	ret = xe_sc_probe(xe);
>+	if (ret)
>+		drm_err(&xe->drm, "sysctrl: Probe failed: %d\n", ret);
>+
>+	return ret;
>+}
>diff --git a/drivers/gpu/drm/xe/xe_sc.h b/drivers/gpu/drm/xe/xe_sc.h
>new file mode 100644
>index 000000000000..0e5c89ddc957
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_sc.h
>@@ -0,0 +1,15 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2025 Intel Corporation
>+ */
>+
>+#ifndef __XE_SC_H__
>+#define __XE_SC_H__
>+
>+#include <linux/types.h>
>+
>+struct xe_device;
>+
>+int xe_sc_init(struct xe_device *xe);
>+
>+#endif /* __XE_SC_H__ */
>diff --git a/drivers/gpu/drm/xe/xe_sc_mailbox.c b/drivers/gpu/drm/xe/xe_sc_mailbox.c
>new file mode 100644
>index 000000000000..6f2500c63a3c
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_sc_mailbox.c
>@@ -0,0 +1,374 @@
>+// SPDX-License-Identifier: MIT
>+/*
>+ * Copyright © 2025 Intel Corporation
>+ */
>+
>+#include <linux/bitfield.h>
>+#include <linux/errno.h>
>+#include <linux/minmax.h>
>+#include <linux/mutex.h>
>+#include <linux/slab.h>
>+#include <linux/string.h>
>+#include <linux/types.h>
>+
>+#include <drm/drm_print.h>
>+
>+#include "regs/xe_sc_regs.h"
>+#include "xe_device.h"
>+#include "xe_mmio.h"
>+#include "xe_pm.h"
>+#include "xe_sc.h"
>+#include "xe_sc_mailbox.h"
>+#include "xe_sc_types.h"
>+
>+static bool sc_mb_wait_bit_clear(struct xe_sc *sc, u32 bit_mask,
>+				 unsigned int timeout_ms)
>+{
>+	int ret;
>+
>+	if (timeout_ms == 0) {
>+		ret = xe_mmio_wait32_not(&sc->mmio, SC_MB_CTRL, bit_mask, bit_mask,
>+					 0, NULL, false);
>+	} else {
>+		ret = xe_mmio_wait32_not(&sc->mmio, SC_MB_CTRL, bit_mask, bit_mask,
>+					 timeout_ms * 1000, NULL, false);
>+	}
>+
>+	return ret == 0;
>+}

The above can be simplified to: 

static bool sc_mb_wait_bit_clear(struct xe_sc *sc, u32 bit_mask,
				 unsigned int timeout_ms)
{
	int ret = xe_mmio_wait32_not(&sc->mmio, SC_MB_CTRL, bit_mask, bit_mask,
				     timeout_ms * 1000, NULL, false);

	return ret == 0;
}


>+
>+static bool sc_mb_wait_bit_set(struct xe_sc *sc, u32 bit_mask,
>+			       unsigned int timeout_ms)
>+{
>+	int ret;

Same here. Can be simplified without conditions.
>+
>+	if (timeout_ms == 0) {
>+		ret = xe_mmio_wait32(&sc->mmio, SC_MB_CTRL, bit_mask, bit_mask,
>+				     0, NULL, false);
>+	} else {
>+		ret = xe_mmio_wait32(&sc->mmio, SC_MB_CTRL, bit_mask, bit_mask,
>+				     timeout_ms * 1000, NULL, false);
>+	}
>+
>+	return ret == 0;
>+}
>+
>+static void sc_mb_write_frame(struct xe_sc *sc, const void *buffer,
>+			      size_t offset)
>+{
>+	const u32 *data = (const u32 *)((const u8 *)buffer + offset);
>+
>+	xe_mmio_write32(&sc->mmio, SC_MB_DATA0, data[0]);
>+	xe_mmio_write32(&sc->mmio, SC_MB_DATA1, data[1]);
>+	xe_mmio_write32(&sc->mmio, SC_MB_DATA2, data[2]);
>+	xe_mmio_write32(&sc->mmio, SC_MB_DATA3, data[3]);
>+}
>+
>+static void sc_mb_read_frame(struct xe_sc *sc, void *buffer,
>+			     size_t offset)
>+{
>+	u32 *data = (u32 *)((u8 *)buffer + offset);
>+
>+	data[0] = xe_mmio_read32(&sc->mmio, SC_MB_DATA0);
>+	data[1] = xe_mmio_read32(&sc->mmio, SC_MB_DATA1);
>+	data[2] = xe_mmio_read32(&sc->mmio, SC_MB_DATA2);
>+	data[3] = xe_mmio_read32(&sc->mmio, SC_MB_DATA3);
>+}
>+
>+static void sc_mb_clear_response(struct xe_sc *sc)
>+{
>+	xe_mmio_write32(&sc->mmio, SC_MB_CTRL, SC_MB_CTRL_RUN_BUSY_OUT);

Are you intending to write 0 to bit 30. This looks like it is setting it?

>+}
>+

will continue review from below tomorrow...

Regards,
Umesh
>+static int sc_mb_prepare_command(struct xe_sc *sc,
>+				 const struct xe_sc_mailbox_app_msg_hdr *msg_hdr,
>+				 const void *data_in, size_t data_in_len,
>+				 u8 **cmd_buffer, size_t *cmd_size)
>+{
>+	struct xe_sc_mailbox_mkhi_msg_hdr mkhi_hdr = {0};
>+
>+	mkhi_hdr.group_id = msg_hdr->group_id;
>+	mkhi_hdr.command = msg_hdr->command & 0x7F;
>+	mkhi_hdr.is_response = 0;
>+	mkhi_hdr.reserved = 0;
>+	mkhi_hdr.result = 0;
>+
>+	*cmd_size = sizeof(struct xe_sc_mailbox_mkhi_msg_hdr) + data_in_len;
>+
>+	if (*cmd_size > SC_MB_MAX_MESSAGE_SIZE) {
>+		drm_err(&sc->xe->drm, "SC: Message too large: %zu bytes (max %u)\n",
>+			*cmd_size, SC_MB_MAX_MESSAGE_SIZE);
>+		return -EINVAL;
>+	}
>+
>+	*cmd_buffer = kmalloc(*cmd_size, GFP_KERNEL);
>+	if (!*cmd_buffer)
>+		return -ENOMEM;
>+
>+	memcpy(*cmd_buffer, &mkhi_hdr, sizeof(struct xe_sc_mailbox_mkhi_msg_hdr));
>+	if (data_in && data_in_len)
>+		memcpy(*cmd_buffer + sizeof(struct xe_sc_mailbox_mkhi_msg_hdr),
>+		       data_in, data_in_len);
>+
>+	drm_dbg(&sc->xe->drm, "SC: request: group=0x%02x cmd=0x%02x payload=%zu bytes\n",
>+		mkhi_hdr.group_id, mkhi_hdr.command, data_in_len);
>+
>+	return 0;
>+}
>+
>+static int sc_mb_send_frames(struct xe_sc *sc, const u8 *cmd_buffer,
>+			     size_t cmd_size, unsigned int timeout_ms)
>+{
>+	u32 ctrl_reg, total_frames, current_frame;
>+	size_t bytes_sent, bytes_to_send;
>+
>+	total_frames = DIV_ROUND_UP(cmd_size, SC_MB_FRAME_SIZE);
>+	if (total_frames > SC_MB_MAX_FRAMES) {
>+		drm_err(&sc->xe->drm, "SC: Message too large: %zu bytes (%u frames, max %u)\n",
>+			cmd_size, total_frames, SC_MB_MAX_FRAMES);
>+		return -EINVAL;
>+	}
>+
>+	if (!sc_mb_wait_bit_clear(sc, SC_MB_CTRL_RUN_BUSY, timeout_ms)) {
>+		drm_err(&sc->xe->drm, "SC: Mailbox busy (RUN_BUSY timeout)\n");
>+		return -EBUSY;
>+	}
>+
>+	sc->phase_bit ^= 1;
>+
>+	drm_dbg(&sc->xe->drm, "SC: Sending message: %zu bytes, %u frames, phase=%u\n",
>+		cmd_size, total_frames, sc->phase_bit);
>+
>+	bytes_sent = 0;
>+	for (current_frame = 0; current_frame < total_frames; current_frame++) {
>+		bytes_to_send = min(cmd_size - bytes_sent, (size_t)SC_MB_FRAME_SIZE);
>+
>+		sc_mb_write_frame(sc, cmd_buffer, bytes_sent);
>+
>+		ctrl_reg = SC_MB_CTRL_RUN_BUSY |
>+			   FIELD_PREP(MKHI_FRAME_CURRENT, current_frame) |
>+			   FIELD_PREP(MKHI_FRAME_TOTAL, total_frames - 1) |
>+			   FIELD_PREP(MKHI_FRAME_COMMAND, SC_MKHI_COMMAND);
>+		if (sc->phase_bit)
>+			ctrl_reg |= FIELD_PREP(MKHI_FRAME_PHASE, 1);
>+
>+		xe_mmio_write32(&sc->mmio, SC_MB_CTRL, ctrl_reg);
>+
>+		drm_dbg(&sc->xe->drm, "SC: Sent frame %u/%u\n",
>+			current_frame, total_frames - 1);
>+
>+		if (!sc_mb_wait_bit_clear(sc, SC_MB_CTRL_RUN_BUSY, timeout_ms)) {
>+			drm_err(&sc->xe->drm, "SC: Frame %u acknowledgment timeout\n",
>+				current_frame);
>+			return -ETIMEDOUT;
>+		}
>+
>+		bytes_sent += bytes_to_send;
>+	}
>+
>+	drm_dbg(&sc->xe->drm, "SC: All frames sent successfully (%zu bytes)\n", bytes_sent);
>+	return 0;
>+}
>+
>+static int sc_mb_validate_response_header(struct xe_sc *sc,
>+					  const struct xe_sc_mailbox_app_msg_hdr *msg_hdr,
>+					  const struct xe_sc_mailbox_mkhi_msg_hdr *resp_hdr)
>+{
>+	if (!resp_hdr->is_response ||
>+	    resp_hdr->group_id != msg_hdr->group_id ||
>+	    resp_hdr->command != (msg_hdr->command & 0x7F)) {
>+		drm_err(&sc->xe->drm, "SC: Invalid response header\n");
>+		return -EPROTO;
>+	}
>+
>+	if (resp_hdr->result != 0) {
>+		drm_err(&sc->xe->drm, "SC: Firmware error: result=0x%02x\n",
>+			resp_hdr->result);
>+		return -EIO;
>+	}
>+
>+	drm_dbg(&sc->xe->drm, "SC: response: group=0x%02x cmd=0x%02x\n",
>+		resp_hdr->group_id, resp_hdr->command);
>+
>+	return 0;
>+}
>+
>+static int sc_mb_receive_frames(struct xe_sc *sc,
>+				const struct xe_sc_mailbox_app_msg_hdr *msg_hdr,
>+				void *data_out, size_t data_out_len,
>+				size_t *bytes_received, unsigned int timeout_ms)
>+{
>+	u32 ctrl_reg, total_frames, current_frame;
>+	size_t payload_size;
>+	int ret;
>+
>+	*bytes_received = 0;
>+
>+	do {
>+		ctrl_reg = xe_mmio_read32(&sc->mmio, SC_MB_CTRL);
>+		current_frame = FIELD_GET(MKHI_FRAME_CURRENT, ctrl_reg);
>+		total_frames = FIELD_GET(MKHI_FRAME_TOTAL, ctrl_reg) + 1;
>+
>+		drm_dbg(&sc->xe->drm, "SC: Receiving frame %u/%u\n",
>+			current_frame, total_frames - 1);
>+
>+		if (current_frame == 0) {
>+			u32 temp_frame[4];
>+			struct xe_sc_mailbox_mkhi_msg_hdr *resp_hdr;
>+
>+			sc_mb_read_frame(sc, temp_frame, 0);
>+			resp_hdr = (struct xe_sc_mailbox_mkhi_msg_hdr *)temp_frame;
>+
>+			ret = sc_mb_validate_response_header(sc, msg_hdr, resp_hdr);
>+			if (ret)
>+				return ret;
>+
>+			payload_size = SC_MB_FRAME_SIZE - sizeof(struct xe_sc_mailbox_mkhi_msg_hdr);
>+			if (payload_size > data_out_len) {
>+				drm_err(&sc->xe->drm, "SC: Response buffer too small\n");
>+				return -ENOSPC;
>+			}
>+
>+			memcpy(data_out,
>+			       (u8 *)temp_frame + sizeof(struct xe_sc_mailbox_mkhi_msg_hdr),
>+			       payload_size);
>+			*bytes_received = payload_size;
>+		} else {
>+			size_t frame_size = SC_MB_FRAME_SIZE;
>+
>+			if (current_frame == total_frames - 1) {
>+				size_t total_response = (total_frames - 1) *
>+							SC_MB_FRAME_SIZE +
>+							sizeof(struct xe_sc_mailbox_mkhi_msg_hdr);
>+				size_t remaining = total_response -
>+						   *bytes_received -
>+						   sizeof(struct xe_sc_mailbox_mkhi_msg_hdr);
>+				frame_size = min(frame_size, remaining);
>+			}
>+
>+			if (*bytes_received + frame_size > data_out_len) {
>+				drm_err(&sc->xe->drm, "SC: Response buffer too small\n");
>+				return -ENOSPC;
>+			}
>+
>+			sc_mb_read_frame(sc, data_out, *bytes_received);
>+			*bytes_received += frame_size;
>+		}
>+
>+		sc_mb_clear_response(sc);
>+
>+		if (current_frame + 1 < total_frames &&
>+		    !sc_mb_wait_bit_set(sc, SC_MB_CTRL_RUN_BUSY_OUT, timeout_ms)) {
>+			drm_err(&sc->xe->drm, "SC: Response frame %u timeout\n",
>+				current_frame + 1);
>+			return -ETIMEDOUT;
>+		}
>+
>+	} while (current_frame + 1 < total_frames);
>+
>+	return 0;
>+}
>+
>+static int sc_mb_send_command(struct xe_sc *sc,
>+			      const struct xe_sc_mailbox_app_msg_hdr *msg_hdr,
>+			      const u8 *cmd_buffer, size_t cmd_size,
>+			      void *data_out, size_t data_out_len,
>+			      size_t *rdata_len, unsigned int timeout_ms)
>+{
>+	size_t bytes_received;
>+	int ret;
>+
>+	if (rdata_len)
>+		*rdata_len = 0;
>+
>+	ret = sc_mb_send_frames(sc, cmd_buffer, cmd_size, timeout_ms);
>+	if (ret)
>+		return ret;
>+
>+	if (!data_out) {
>+		drm_dbg(&sc->xe->drm, "SC: Command completed (no response expected)\n");
>+		return 0;
>+	}
>+
>+	if (!sc_mb_wait_bit_set(sc, SC_MB_CTRL_RUN_BUSY_OUT, timeout_ms)) {
>+		drm_err(&sc->xe->drm, "SC: Response timeout (RUN_BUSY_OUT not set)\n");
>+		return -ETIMEDOUT;
>+	}
>+
>+	ret = sc_mb_receive_frames(sc, msg_hdr, data_out, data_out_len,
>+				   &bytes_received, timeout_ms);
>+	if (ret) {
>+		sc_mb_clear_response(sc);
>+		return ret;
>+	}
>+
>+	if (rdata_len)
>+		*rdata_len = bytes_received;
>+
>+	drm_dbg(&sc->xe->drm, "SC: MKHI message completed: %zu bytes payload received\n",
>+		bytes_received);
>+
>+	return 0;
>+}
>+
>+/**
>+ * xe_sc_mailbox_send_command - Send command to System Controller via mailbox
>+ * @handle: XE device handle containing the system controller
>+ * @cmd_buffer: Pointer to xe_sc_mailbox_command structure
>+ * @rdata_len: Pointer to store actual response data size (can be NULL)
>+ *
>+ * Send a command to the System Controller using MKHI protocol. Handles
>+ * command preparation, fragmentation, transmission, and response reception.
>+ * Optimized to move memory allocation outside the critical section.
>+ *
>+ * Return: 0 on success, negative error code on failure
>+ */
>+int xe_sc_mailbox_send_command(void *handle, void *cmd_buffer, size_t *rdata_len)
>+{
>+	struct xe_device *xe = handle;
>+	struct xe_sc *sc;
>+	struct xe_sc_mailbox_command *cmd = cmd_buffer;
>+	u8 *command_buffer = NULL;
>+	size_t command_size;
>+	int ret;
>+
>+	if (!xe || !cmd)
>+		return -EINVAL;
>+
>+	sc = xe->sc;
>+	if (!sc)
>+		return -ENODEV;
>+
>+	if (!cmd->data_in && cmd->data_in_len)
>+		return -EINVAL;
>+
>+	if (!cmd->data_out && cmd->data_out_len)
>+		return -EINVAL;
>+
>+	might_sleep();
>+
>+	ret = sc_mb_prepare_command(sc, &cmd->header, cmd->data_in, cmd->data_in_len,
>+				    &command_buffer, &command_size);
>+	if (ret) {
>+		drm_err(&sc->xe->drm, "SC: Failed to prepare command: %d\n", ret);
>+		return ret;
>+	}
>+
>+	mutex_lock(&sc->cmd_lock);
>+
>+	xe_pm_runtime_get(xe);
>+
>+	ret = sc_mb_send_command(sc, &cmd->header, command_buffer, command_size,
>+				 cmd->data_out, cmd->data_out_len, rdata_len,
>+				 SC_MB_DEFAULT_TIMEOUT_MS);
>+	if (ret)
>+		drm_err(&sc->xe->drm, "SC: Mailbox command failed: %d\n", ret);
>+
>+	xe_pm_runtime_put(xe);
>+
>+	mutex_unlock(&sc->cmd_lock);
>+
>+	kfree(command_buffer);
>+
>+	return ret;
>+}
>diff --git a/drivers/gpu/drm/xe/xe_sc_mailbox.h b/drivers/gpu/drm/xe/xe_sc_mailbox.h
>new file mode 100644
>index 000000000000..d5ca43c40f1a
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_sc_mailbox.h
>@@ -0,0 +1,61 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2025 Intel Corporation
>+ */
>+
>+#ifndef __XE_SC_MAILBOX_H__
>+#define __XE_SC_MAILBOX_H__
>+
>+#include <linux/types.h>
>+
>+struct xe_sc;
>+
>+/**
>+ * struct xe_sc_mailbox_mkhi_msg_hdr - MKHI protocol message header
>+ */
>+struct xe_sc_mailbox_mkhi_msg_hdr {
>+	/** @group_id: Message group identifier */
>+	u32 group_id    : 8;
>+	/** @command: Command identifier within the group */
>+	u32 command     : 7;
>+	/** @is_response: Response flag - 0 for request, 1 for response */
>+	u32 is_response : 1;
>+	/** @reserved: Reserved field, must be zero */
>+	u32 reserved    : 8;
>+	/** @result: Result code from firmware */
>+	u32 result      : 8;
>+} __packed;
>+
>+/**
>+ * struct xe_sc_mailbox_app_msg_hdr - Application message header
>+ */
>+struct xe_sc_mailbox_app_msg_hdr {
>+	/** @group_id: Application group identifier */
>+	u32 group_id  : 8;
>+	/** @command: Specific command within the application group */
>+	u32 command   : 8;
>+	/** @version: Protocol version */
>+	u32 version   : 8;
>+	/** @reserved: Reserved field, must be zero */
>+	u32 reserved  : 8;
>+} __packed;
>+
>+/**
>+ * struct xe_sc_mailbox_command - System Controller mailbox command structure
>+ */
>+struct xe_sc_mailbox_command {
>+	/** @header: Application message header containing command information */
>+	struct xe_sc_mailbox_app_msg_hdr header;
>+	/** @data_in: Pointer to input payload data (can be NULL if no input data) */
>+	void *data_in;
>+	/** @data_in_len: Size of input payload in bytes (0 if no input data) */
>+	size_t data_in_len;
>+	/** @data_out: Pointer to output buffer for response data (can be NULL if no response) */
>+	void *data_out;
>+	/** @data_out_len: Size of output buffer in bytes (0 if no response expected) */
>+	size_t data_out_len;
>+};
>+
>+int xe_sc_mailbox_send_command(void *handle, void *cmd_buffer, size_t *rdata_len);
>+
>+#endif /* __XE_SC_MAILBOX_H__ */
>diff --git a/drivers/gpu/drm/xe/xe_sc_types.h b/drivers/gpu/drm/xe/xe_sc_types.h
>new file mode 100644
>index 000000000000..5ec2126cebe4
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_sc_types.h
>@@ -0,0 +1,35 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2025 Intel Corporation
>+ */
>+
>+#ifndef _XE_SC_TYPES_H_
>+#define _XE_SC_TYPES_H_
>+
>+#include <linux/completion.h>
>+#include <linux/mutex.h>
>+#include <linux/types.h>
>+#include <linux/workqueue.h>
>+
>+#include "xe_device_types.h"
>+#include "xe_sc_mailbox.h"
>+
>+struct xe_device;
>+
>+/**
>+ * struct xe_sc - System Controller driver context
>+ */
>+struct xe_sc {
>+	/** @xe: Back pointer to xe_device */
>+	struct xe_device *xe;

You can drop this when you do (1) above.

>+	/** @mmio: MMIO region for SC registers */
>+	struct xe_mmio mmio;
>+
>+	/** @cmd_lock: Mutex protecting mailbox command operations */
>+	struct mutex cmd_lock;
>+
>+	/** @phase_bit: MKHI message boundary phase toggle bit */
>+	u32 phase_bit;
>+};
>+
>+#endif /* _XE_SC_TYPES_H_ */
>-- 
>2.43.0
>

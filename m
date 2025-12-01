Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 142AFD116F3
	for <intel-xe@archiver.kernel.org>; Mon,  1 Dec 2025 23:10:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3A9810E4C3;
	Mon,  1 Dec 2025 23:10:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SI5NvFxx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2588910E4C2
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Dec 2025 23:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764630658; x=1796166658;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=U01J8p+A5d+I6EvOHAXQf+K5/v1S4tnCAgpj3ionobk=;
 b=SI5NvFxxLPcJlFe4mPwWSTurO1sxIrw4M30eqpTTXyNjVZe4oVR+WzOO
 gKz0zHGNOywOFW53i2mfW4YgNV5xOUlpdhn7UnPmwU6wU5cF+IAy1gAjW
 i0t6+m2Bl6oWgC3+PVuU82OBrB81C9nOuuEXfJC3/sG3PshaIEZi/JemP
 SmIrSf5Zffe7Icoc7AEw5gTZCG/F8BfqRGtIHmKn4n4st+kqo6m46dMTV
 CZzkf4o4bvo/G/rxKfQLn4CnP+5t5/paT2vrCdJgwlhlKd+KQugJzPBUD
 y32JBRNlAWGB06QHRaYKJsoeC34k+WqLnuPX2nOGzqhNNwvkmTZ06Z92G g==;
X-CSE-ConnectionGUID: BHCj9mRMRjmKC3UF+UgO3A==
X-CSE-MsgGUID: RQqMW1r5R5GjFvfAaI9ySQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66623028"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="66623028"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 15:10:57 -0800
X-CSE-ConnectionGUID: kwZ5PLZaQ1KUcC17ddNnDw==
X-CSE-MsgGUID: HCIMxD89Siuj8riuIJCSOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="194404136"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 15:10:56 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 15:10:55 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 15:10:55 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.33) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 15:10:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WztYvrnypbhZh6pWTw40H67KvWd+T/E24WQs0LG+SkpuoIJg7Wdm3PQXridV9oXW4Vs/fuq/CA7JVdH4bwCKYZTTe6r220SMr33zWT2JwBJMuOCqs+Gc6mX6Kb9cRve9W7F0Ux5syxJIooqqGW34fGhBOnSNFhExbMercCXIe0yUqHObfWRTJqq5UD5l3Qj7jDtv8jS+t04MgG8w2f1E7KR/aTrx36pVHHaJRMoqgW/Nn/+92APmNbhqqIJAEASiyIiS3Q1jlaXlgWG6/ZhoQO0VS3EQqtKqmYf7QQr3KYAcFdQcNbvs6r4H6IOFh6y+0e1f+Tcqr48f8hXevHUozw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R7R8+rKGdUDv6ix102/A0kgTChlYUcMe2US+IwoMdL4=;
 b=ScBlhCy37pkrncZTQT+Ep1399nToR5C/3UQaVii/HatIAdipyIwTCnMljahSGlpffecSzWSdGNb1LF0XHYSUnfA63Q/I+Nl0e9Vj2oPqbvzLlt6Ac/xGa5a2LxbYL9+dxU1aXPAXRC4AftvREXhW05p1rt4wHhPl7UelCZp2u6RJXixH8Nrofkvt5qmVft/2MedkUV3HzyQwhkriSFu7SXhP8EsHDcEmpWued4FqM44BGpu3z7A5SNwf7ZigQKXqZQlvtWpZNjlBTaPtq5d7jau3X35tBCPlbTtKF4X7FIck1wOy0KucLIVkjRPtwsbgviTOHsi8YHZLnoWiosIWIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL1PR11MB6050.namprd11.prod.outlook.com (2603:10b6:208:392::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 23:10:53 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 23:10:53 +0000
Date: Mon, 1 Dec 2025 15:10:51 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pallavi.mishra@intel.com>
Subject: Re: [RFC v2 3/9] drm/xe/bo: Prevent purging of shared buffer objects
Message-ID: <aS4geyZDuwlcyc9R@lstrano-desk.jf.intel.com>
References: <20251201055309.854074-1-arvind.yadav@intel.com>
 <20251201055309.854074-4-arvind.yadav@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251201055309.854074-4-arvind.yadav@intel.com>
X-ClientProxiedBy: MW3PR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:303:2b::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL1PR11MB6050:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a0d9e9d-4375-4c41-c713-08de312ee050
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?h4ixPteZL65FyvUuVB1KEHflKWy263l2QinZStur44ZzLK3t7M0x/QnFgj?=
 =?iso-8859-1?Q?07nos6LMp1hrCW6s7xD89EnSMQuSyvQ5CG5pePAQCnwvczV2EW+pB2m6DB?=
 =?iso-8859-1?Q?HRRN6X5ejOUfpBuhXRA2DRRa50iNOtsz8ZA0qrPbKnkkwyfIWq33kvHwLb?=
 =?iso-8859-1?Q?E2Vs7KoT4Y/l8PluPn6qwkPM7bG9eJYpv75zTLKO/5ae80aSi+GwD+rFvM?=
 =?iso-8859-1?Q?EI81gkW19wzpHXJjM6FLHhySB9usQKTxbto7WA4/21nRHvTLbjXCijxWqs?=
 =?iso-8859-1?Q?6sKJlC1S/WvpCgvzrCoVgxd1hGdYqsbL4PX/fLUneD1Y0HmA+2LIvNZjox?=
 =?iso-8859-1?Q?qcFgjCTHiFi8YwPJ8ElvIsF0rhZzTbEgsOu7YkF2u6Uu7V8Og53rME4T0W?=
 =?iso-8859-1?Q?zBKpqGx5WwbzUubDV6OiF26DfAfzwTRjge1X5lvp8H1mWMRIzQvPAN7agY?=
 =?iso-8859-1?Q?cdhqIBy4h5qcem8L8Qx8w/u04DD8iSkGd+UbCldXsN68wieyh7md3TaUVN?=
 =?iso-8859-1?Q?yHJhBsux8+ODPgLEpmDuvbbJiNzF9kCafJ7+y30cN7iaBGfFHr5KkUY0FC?=
 =?iso-8859-1?Q?WKIZg1pZenhjIC4k3CnV8asfDBbtBEfuyMonRVRae6cbPgjdUBpcs7nn+1?=
 =?iso-8859-1?Q?IOGoR8VBvub4IgF4agMh2Jjr5tlquW8WDA1c2vrmDRk4GV4iNEtaXE+0lF?=
 =?iso-8859-1?Q?4nQjbZz4m5JZ+hqxWOqcfLXO+ouHDvNrzopiVmbPXiPEzAIDAmZekUPjAj?=
 =?iso-8859-1?Q?+alNsYc+1+/St75oLSI1IXwla2iInYhz1el0gMrvpGzbzCBS3GPiFQp4bd?=
 =?iso-8859-1?Q?vOSe/TjHOltLgws5fC9UYbyNk9Jue2+XjXqVFTJjZbmZyBnjYMsIfuwqt8?=
 =?iso-8859-1?Q?5pOOyXetkL8IVIXHqkjHZ4S8GqS2ZE0gII6yy8NAZgnfPgRsXlR0VOm+ZK?=
 =?iso-8859-1?Q?bLAC7fFPCHHsT7vnxskojktd+U8E1Of8Yt6jIFy8R7Am0w9weqceHTZ6mk?=
 =?iso-8859-1?Q?+/6AlnGAYUKZeFD9V31yrwbMrGXWO4drvsj7qG/4+IHemC/eKeaxy2kA3w?=
 =?iso-8859-1?Q?jw2fr70U9QycSNnvlhpBcj3jvTUNKI9jv3U3BKUHIxZiK7vUHxCu/rML9f?=
 =?iso-8859-1?Q?h3h1ymKtEitrmYE7u9LsalFAPgLL1nXQHUMHIx2kcBcEKUJtQXy14ggbnb?=
 =?iso-8859-1?Q?8mTURoqiq0ZT+4DbdUoh6DEUi7TMaRAbzCgR6Axq+XIWJdqo0ZapiV7W5V?=
 =?iso-8859-1?Q?FOfzqpgIpmY8qe6yXRuIT9phWlWOEqswMjpgyFxbNjLkxoNmm7ra+v5ljB?=
 =?iso-8859-1?Q?4yy103wCeo4qlkxI/Sq430aqFO/1kxys+5Ifz1lAY0DKj3CRSgWhcqH+ZZ?=
 =?iso-8859-1?Q?8+ukhNq1Q4q5flyxIFaV682I5AaN+OxDXejagBNrzgc7JwJuJAU3P7ynlA?=
 =?iso-8859-1?Q?pA9Yy1jt2nkDNntSAeXu+A8aZ7FFkjnvBnrIPSqYo0L4Q5YkLwV4hv3gJ9?=
 =?iso-8859-1?Q?82alylID5veN6lz1XZO7Os?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?WjjQ9pISE/K5gfFfvOf0Mb1F+UxVfm4x2TOwblzzZeZsQ40vNxvOjLs0bp?=
 =?iso-8859-1?Q?Ko/ubXXy5KROLsjmCPDAIGdCRZ1vgGsjP5pBQQ9PsOdW+wOvT5RrUfFxJI?=
 =?iso-8859-1?Q?DAID+jrYrX4YXpdshYrk8pQ63Gj7Y7i+h2zmzbInl+k1BCS3YdPj7bXH3U?=
 =?iso-8859-1?Q?bARmtNHbs9B64QOBSi6xer523jkq/0CWfB9OXNEZnR9+HD1WdNvi2ACnUM?=
 =?iso-8859-1?Q?3YFcZJ4HHN2WyqsJ/0I8HwY2UU18Dey7kXL58xMxFMz9fk3vDb8IgT1BVr?=
 =?iso-8859-1?Q?gGHfCi3QTWMY23ghJPnYxzZBOuTCBJtwn7+q8e3aXllFBBqphPUqRwsUBN?=
 =?iso-8859-1?Q?mnURIxBPxkXXmyoDz9CwmVvYUFOPTZswWYAYPaYDCkQIwmuIc49AQxeQ6K?=
 =?iso-8859-1?Q?92DA20Pzb/9iUluNfgIH45Xpy5grejRt4jshSDjM0B18uaHyz7sT0nhWJE?=
 =?iso-8859-1?Q?YF2Bt1XSxwF3bWmpAraho57WIFqtAkevosBI4x3Gb36eD0d3FSYl4xiHsl?=
 =?iso-8859-1?Q?a9AqdO5kVpIEwuof5ciX3UXx7ruPiE0DesQOeIzWAq4Z3N/HSqHeNdpbbh?=
 =?iso-8859-1?Q?9pzTu9QpR9/lguyf0BKds9uHjQMm3TdOaiYHHXvn4sh0K9izTf1ZeAivY9?=
 =?iso-8859-1?Q?mmaN4V2y+VmAybdy1hk5HrEOlD3sjUB4+liXdDdmkRt8MkhaCKMpue6JzU?=
 =?iso-8859-1?Q?umaaM5Wa8141cH46RuUkPxsXzJrGKg0PA7wKmgoKZ9wg2QyNRWMFKuSRjK?=
 =?iso-8859-1?Q?akbcElWlK1AGBHuTQ14QaitiHRqaXphDGsPF/tj4Z1nVlSBqt8jTAzjnHz?=
 =?iso-8859-1?Q?XLOqf7xK4oEBrJL5XaqwMWbJfR0LB9qEgo20dJhCMT2zULi0dT+pyT3BDf?=
 =?iso-8859-1?Q?BTFgCtBmMyrw9Z4LJh/QerRH+FZBH+hZR1XT6m2GrWzPK+KhMnFcd63vEB?=
 =?iso-8859-1?Q?jtdh5wWvkwTp2/HGZ9cHYjoRsSnPXGVVcujoJolDECi7+Qzf/3GdMYjnHZ?=
 =?iso-8859-1?Q?WMcNevcCAcMZEPYQGzftvItILbrcjKOGVW7rQVPsTVEd38oVKJ5luSR7nv?=
 =?iso-8859-1?Q?cnOCQ9daHNhhTBKl/bKTcCGVKEc3Sw0DIIPX39Z3jpuv6adJK/o4A4kPV2?=
 =?iso-8859-1?Q?x98jYPS7hCKm6+uXOOiuWoDTgTpA+GUuOT3Lsa8bpa0LU6GKFamj13Q75r?=
 =?iso-8859-1?Q?CljDVh4vqVoia2MTwrMlCEF3hx1Ih1whVp4Ucuf3qsl9DjOIlO6I3jkqNd?=
 =?iso-8859-1?Q?ot1FK48IoxY+NhOAZfLGeQj7the/f5XwId2VgV/MMP7izhvPineYOnIlYr?=
 =?iso-8859-1?Q?GTefq6mNaISSn6eHGRn2LuEoAISHYTULIELfxr/3Vt4ZJFJPlM9LwQPhOp?=
 =?iso-8859-1?Q?HfCoD2nPVaCNxsYNv9CdZotuJT78DgwiOrGQQbukVF71iX6Kh+vh8LXwcJ?=
 =?iso-8859-1?Q?D49DF0rJkcNjcwPv7Cd79ROjK505ghGwSrjYWoTT9FvBwy57gWVjff1Jnb?=
 =?iso-8859-1?Q?dZXgwr13JXyGVyLD/XLRgx12Kj67QRg826mHTMLyS3U6Qsozlho02aXeCs?=
 =?iso-8859-1?Q?Euw/wa4eFH2xfjcyddL8ZnY+ZRmg7fU2tUkY2c1M5YAyn8H4TQGdWhh8VQ?=
 =?iso-8859-1?Q?Ww51HMcjcnY5v+WikTG8jTAc73Ck4QjtTR1aPXpluTK5XGpa0w9gP6bA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a0d9e9d-4375-4c41-c713-08de312ee050
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 23:10:53.6152 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aYvUyImDxz0+vv0m8nik+bEhCqij/HOc8OQerBkfcZqgWyitwTmXu8YCqEujRzay6q+tsp3aO6ZQ+c5pXolzrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6050
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

On Mon, Dec 01, 2025 at 11:20:13AM +0530, Arvind Yadav wrote:
> Introduce the `xe_bo_is_shared_locked()` inline helper to determine if a
> buffer object is shared across multiple clients or drivers. A buffer is
> considered shared if it is exported via dma-buf, imported, or has a
> handle count greater than one.
> 
> This check is critical for safely implementing purgeable memory. Purging
> a buffer that is shared would lead to data corruption for other clients
> that still hold a reference to it.
> 
> The kernel cannot safely determine when all clients are done with a
> shared buffer, so shared BOs must never be marked DONTNEED or purged.
> 
> The new helper is used in two key locations:
> 1.  In `xe_vm_madvise_purgeable_bo()`, to prevent userspace from
>     successfully marking a shared buffer as `DONTNEED`. This is the
>     primary safeguard against incorrect usage.
> 
> 2.  In `xe_bo_move()`, as a final safety check before the kernel
>     initiates a purge during eviction. This ensures that even if a
>     shared buffer were somehow marked `DONTNEED`, it would not be
>     purged.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.h | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index b0a31c77e612..97edb38bf1ed 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -478,4 +478,34 @@ static inline bool xe_bo_is_mem_type(struct xe_bo *bo, u32 mem_type)
>  	xe_bo_assert_held(bo);
>  	return bo->ttm.resource->mem_type == mem_type;
>  }
> +
> +/**
> + * xe_bo_is_shared_locked - Check if a buffer object is shared
> + * @bo: The buffer object to check
> + *
> + * Determines if a buffer object is considered shared, which includes:
> + * - Exported via dma-buf (obj->dma_buf is set)
> + * - Imported from another driver (obj->import_attach is set)
> + * - Referenced by multiple clients (handle_count > 1)
> + *
> + * This check is used to prevent data loss on shared content by avoiding
> + * certain operations like purging on buffers that other processes or
> + * drivers might still be using.
> + *
> + * Return: true if the buffer object is shared, false otherwise.
> + */
> +static inline bool xe_bo_is_shared_locked(const struct xe_bo *bo)
> +{
> +	const struct drm_gem_object *obj = &bo->ttm.base;
> +

It seems like everything below here should be a new drm gem helper.

> +	dma_resv_assert_held(obj->resv);
> +
> +	if (obj->dma_buf || obj->import_attach)
> +		return true;
> +
> +	if (obj->handle_count > 1)

So this covers the case when we prime fd to handle but we resolve to a
BO (i.e., we don't do a dma-buf attach, rather just take reference on BO
as the BO is from the same device)? I just want to make sure I'm
understanding this part correctly. If so, maybe throw a comment in here
or update the functions kernel doc a bit with a better explaination.

Matt 

> +		return true;
> +
> +	return false;
> +}
>  #endif
> -- 
> 2.43.0
> 

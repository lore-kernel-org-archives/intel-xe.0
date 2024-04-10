Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD630CD1299
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 13:50:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ADA810FD41;
	Wed, 10 Apr 2024 13:50:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MX2DG0yX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4273710EAEB
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 13:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712757033; x=1744293033;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PZCe8crpKBWfOo5u4oViOUt/rrHKDEN4xwHRM0OZTB8=;
 b=MX2DG0yXfQ/BvE8cZbQ76bOPWD3Ny3F4Xfip1RoAcFenzhSnmmG9d1as
 I8MlNUG8P8KLR2y0p73QROpYEw55B7ztaKEskKlh6TSrAPfqZGF4KNEqX
 WfDSDAi8ZIWdmQ7vyALUWEu0Kje4OrLrg9H1+11GK+9HnqRqtpan/QFPh
 0hefOGPtI9c4nhFqCs3VpndhantofAp9KOGdTlepXLiTHozxlthxNXMv2
 ddWcFKJvWApNhsyp3SXNPWX26A11Lq2N6dC9ngMiDyKC+ur16VY5Ghiln
 navwfNK1KXbbvQiXGRIP+fqN66/NCzs6oH3I7HoMl4JLD14rmQX2SE60H g==;
X-CSE-ConnectionGUID: /Ne3d2dpSp2j3cNomRfvfA==
X-CSE-MsgGUID: nWoldnwcTUqT+j1oa1JiOQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="7973656"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="7973656"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 06:50:33 -0700
X-CSE-ConnectionGUID: Vi7mBxWFQpqdp75mabTtgw==
X-CSE-MsgGUID: qng2xXu9TdmHSu8pSxy9iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="25339699"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Apr 2024 06:50:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Apr 2024 06:50:32 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 10 Apr 2024 06:50:32 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Apr 2024 06:50:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oZCv2kSCsLElUot2zMu6qR9v6TnK0edEraPLDTS33irhXnWYlJRhIhjKgSXIT8x9rvUH8JEUSCqIQEmyTtb0BFWA6ZDkABfQOpbfhtKVy332+lHqAEPQKXzVH3Aa1+twT62Pezn7DBFvdIGjlnbh6w6qgVZdyKS9OVhn63wJ8imTnfcMKY4X7tRJSyEYeO59ky/A51rhCW9VTRvw38fbU/NrbEsOj6Ir2Vorr8bom8vvvljOTXZbFlu/SAp4amdS+YoUfNCSxKg1417S4QlFtEmJRWqEbl9RnvGup2OMQKw8c3Nu7rJxNF/c3tYPgXqDMqL7fxXUM7eck1Lh0BUTNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=De//hiNgNkJqixf/RHpKKbWfsQE3Dl4xVFijPBKTmS4=;
 b=TIdw3dyItnYMfaJq7KhON+te3eHusO5Cp4j5u+oDfP8vfd0Cv3xmwFoQGXQ6ngnUwb4JzY8gudeFc1owa3+lWMaJfBVDXCT7jf7HjIPwYqzrIBpNFE9QY1/yPsjwwafy7HZAjL55DvTItUdhXw0hPvqU8PM2FfOO85nHQzwSo3Y50Y8mWuXcJaW/GWKz+zdyUx7nCUbN9VRhKmugsbKB9UqsFVYYKjFDgA9LjnjRv3mWNSoeZAd9juGmOXX/euE9A6NtWTWxnzhyId77v6LGfAzczVquog2SveOIo+HllKDUoWaasyf7KPUADU/cHOjCFOVIMaHo3aS00nGPCvjpPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6649.namprd11.prod.outlook.com (2603:10b6:510:1a7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Wed, 10 Apr
 2024 13:50:29 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7452.019; Wed, 10 Apr 2024
 13:50:29 +0000
Date: Wed, 10 Apr 2024 08:50:27 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Check result of drmm_mutex_init()
Message-ID: <2hakctnmdt45up36qcwhw43c5m3x6nvrflwfhp47owpshe56el@qpdl7rdt6t4x>
References: <20240409153132.1111-1-michal.wajdeczko@intel.com>
 <yzab3rps47j7t5o7cbi22yek7xzfmne2c6fa7bhgmsnedtpt5u@b2aje4vank6e>
 <c420106e-d516-4317-9ab6-462d9d72bd61@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <c420106e-d516-4317-9ab6-462d9d72bd61@intel.com>
X-ClientProxiedBy: BY3PR10CA0015.namprd10.prod.outlook.com
 (2603:10b6:a03:255::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6649:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mHz13i7ggSJgDMd0g/I6q0+ombQt1Ga/+UXFjVvRGa/93VM+Il4xxEv7ySmO4uepjgZXMHtiQ2H7kRKY7893S1kO7k1HbA1aidXEhrwTWX8nf90syAtgepROE5aVVvsahRL8bsP/dcmdxCmTrpBzrgtPXiUrfvohZsV66thAQcerb5ZrdMOJcpNrbvJrxiPuyfl3EIJUyA6kxDIdt99J8pz36TsZsdDVWlM5CFlqPjyHN7qdXovY4TNQUK/CiV3DZ/l3Q5wvSRohuYN9H/tnvInG0vpSkm+4EiFNWQf7HTN5rGtpOLs5QKuy6y2NWu6seWs0zxwCUWsGCm9TP6jpPm6x8kJvGfZi4zFzjyN751vdLAVv/IwpzfwLf1vERAPTrdN4uxtV3KESJkPyZ+FX2LfoBwguR5vWE+mI96t4vtOn6FLuKaR4x14DDf6olf+06yuyNBGmloodrMLBy9t0WWVmG5Zs98cA0oyFRXZZvzCJIcLBhRdG8Hw73+hOQ1rLOPITD9jBnLKG96pV6giSCklmG7BQWQP2E9LTgxUIRoy1sxHAZhU1w7p4UtIlfz548HNIEYGIOlv6125MJ7m2W7XgfEEfHBFENwP6JiQ4Ow29rNqXcM9qIj23P3kWP9zk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7KLJHnvfQvBe262w5X4qr1vagDDIRMZjW4Sk1qs0HT70DuuH7VY2lRbc55xo?=
 =?us-ascii?Q?7/61ZacYf3sSBlnCZmSDDPKCUH8C8hZb/SomqWefkf8CHwpmwgXeDh8TeBGQ?=
 =?us-ascii?Q?9yTneWFgKGWO4UHtQlv5+r6OCEr4nwXjGhITEi05NfmfIb1nw8/wi3GIq0ke?=
 =?us-ascii?Q?9tPBhQu8eg6D8QT+PdFdccemI2BstEiw90mP+2M/wS8zJ7/MjqmTsAqvYeH3?=
 =?us-ascii?Q?nX7W+r5YC8OW7KNcT5WC14LgEzaB03+30PE4gpA/WNCCIGlKAZ3WicKsf1ML?=
 =?us-ascii?Q?zIAVkhGeiPutWW6eoiJoIfHZsKbon7clOcnsjiFGSKLIZ3vmEsr2GetV/VCw?=
 =?us-ascii?Q?b4znkj7JHcCw2dJ401IzV8eSMgv3Q6CPxXjVUE/8G5cslwVtYqhPwy811SiZ?=
 =?us-ascii?Q?6yy8dpARoWvt5tLyGSMwxT7AeU45s9wZWloFCY6nXM6A6tKrgPBMpKTGM0uJ?=
 =?us-ascii?Q?dLV1cwBO3NqKsf6MTuKqJXbxETPPpUUMxobZ0/MhR+BbRb7QBIgJjDFyEIwf?=
 =?us-ascii?Q?9HHHY9Bs/lEt3gBHjlzi5r4UnyXazSGIEReuApTXb24mndjhicdpLDz62zL0?=
 =?us-ascii?Q?57/R09/Pe8aN5Ts6vpJGnozCKj0uxk1DDmu6l15rfq/u2oP4R02/ztTNIEeu?=
 =?us-ascii?Q?gsdLCToLx31pxgPH7fHdA+8icye5J+vEtvu7Ne6ZqCTFexc6nLTL0U9bdSCq?=
 =?us-ascii?Q?5eM27CeAHjFpHwC60NjW7wutf6kHnM1g8hnH9xuRMOvMgM2sgaxLEurzDbaA?=
 =?us-ascii?Q?bfIPDb6p1hz4xGFpp1/TCoEyDGs3OvB5/X7JDSK/PvZBW6dalGOmNBIvPIfr?=
 =?us-ascii?Q?rDW6x4Ki3+E2iFMR61vHQUpcUPd3XrJiSivSup6Jm8CLk2TDVTB+UGd1gH4T?=
 =?us-ascii?Q?svMBhDednUy9Q/b8RWisURDITwd4JsZ6KhmXZtltetOAJB9XSIDh+gH2xtLq?=
 =?us-ascii?Q?33MAihKimFSMwY+In9MWSKxq4W8Tdf0ecXSqpWhN9HxX9HQTOAQ7TPeOtvQ3?=
 =?us-ascii?Q?kVyDU3t/8ik8o6M//NN4oZEpVtgezPLAoyftx7vjfWIy/1YoZmiCoSEiAraM?=
 =?us-ascii?Q?IX5wkS1HO5Z3MR3e86SPgGbtIuBlZGjwgBcUtmfUsA1VN5FK1NrBYtTsaV4L?=
 =?us-ascii?Q?ZXVLHVs6nwJdfxnSujOn4MnL2Lno2eIcFGs3X9FimEvqFfipwAcHEtbd4E+t?=
 =?us-ascii?Q?S62rn+EebTrjdK9xlKIXmJ88291utAu/iUQ6K9mooGTJoYr+aHzfMe4fLM51?=
 =?us-ascii?Q?M6cZxi9hDxAAZrxB04vrOEKU1jzHC4Z0It4nmNyRX2FFf5YKxTC7EyenN0lP?=
 =?us-ascii?Q?ndNbAY8NyH1Gu3gr915TZ170hrfVT6n6wlAdf+CLKRwmOHaTliCmZ3eFz4qV?=
 =?us-ascii?Q?PbQPX3LoN+z/uDNVCp4Xvywbb2Hln09eLUuoiCK+ucaU5AxGMpwSQH3EwxKX?=
 =?us-ascii?Q?9tWSWrk0xkFwdJnurqD/++ZcAnsYvBTMn2XhTeCR6gsPeU0Qgirvg2LRHaz/?=
 =?us-ascii?Q?BcVL+4lJaE+VPlKtiw6lZbewirQd9bqqoPCKVnL8gAfO2Uj8z/U7awJW6mBQ?=
 =?us-ascii?Q?PmxPe+4aWC3ri8t8E3prcL9GFlPkOhrJiMCgWnqpcJs9tAv84T24KtjccU2H?=
 =?us-ascii?Q?Mg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ae76d7e-5220-4e61-ac41-08dc59652eaa
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 13:50:29.0428 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AVzK032eWS9R6qZJO3Da8yungFYlGLzFlzj1wYwqw48z0m7n5FGi/gwcyv1RoCo6m0pvkr2uaH0lFc3EmxzztZkb9TsuZxNYpm5bricXUwQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6649
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

On Wed, Apr 10, 2024 at 09:58:45AM +0530, Ghimiray, Himal Prasad wrote:
>
>On 09-04-2024 23:31, Lucas De Marchi wrote:
>>On Tue, Apr 09, 2024 at 05:31:32PM +0200, Michal Wajdeczko wrote:
>>>Although it's unlikely that drmm_mutex_init() will fail during
>>>driver initialization, however we shouldn't ignore this case.
>>>
>>>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>
>>there was already a patch pending for this, but got stuck because it was
>>trying to do something similar for all the display mutexes, that
>>shouldn't be there in the first place. Not sure if we take that one with
>>conflict resolved or this.
>
>
>
>If the patch mentioned is 
>https://patchwork.freedesktop.org/series/131300/, it does not resolve 
>the mutex mentioned above.

https://lore.kernel.org/all/buobxdew2jnbfblawfvnzwntexvhxkslqstsgp3xsxpexdtdem@gwnlli47tdkc/

Lucas De Marchi

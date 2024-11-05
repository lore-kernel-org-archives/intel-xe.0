Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA16D2B92D
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 14:01:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5752310E5BA;
	Tue,  5 Nov 2024 14:01:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y/a9GX6V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BEDE10E5B4
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Nov 2024 14:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730815266; x=1762351266;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IO7Sgdz69yZu+TULN4rljttdkJMbmdWQ15izr6GqR9Y=;
 b=Y/a9GX6V1v/CQ1rRmbGv+LxYep12gqvJRZavPybIvbD2q3kx04wsPwlp
 6RxTJQYFUPMRVA7CNdRh4FQHMb/k1WFJsx7Krp0bnGuctrmbx/hZJQ6AZ
 CwsoJMGbF1SX7kBg6993MzuICCj8RNDLSHW2p7MNUbjcRb7DUla1skIZ3
 x4caPcyDPXnp9yo2GgGdkV8IN2RKkyyRbb1bzdz+NjBbvQvnqJ36lhACz
 DUE5Z7X6BcW9jRthgzPULupEFrMGVSoCISU+WeHotHrnUoSbTovXJyJZa
 cs9GltTZgvH4vF38bAKmLJqpUEDNy5FEeua1uS6pPQJq9Bf24OiUix+YF g==;
X-CSE-ConnectionGUID: h3UfNV4dQ4a93CTo3dUQcw==
X-CSE-MsgGUID: 9RfNyzh4QZSCwReM8uuyAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="34347291"
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="34347291"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 06:00:44 -0800
X-CSE-ConnectionGUID: 8dFno2e7Q8GujNX/pBU5Vw==
X-CSE-MsgGUID: NloFv2ZzSxKdemAZuJcmbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="114821740"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Nov 2024 06:00:41 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 5 Nov 2024 06:00:41 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 5 Nov 2024 06:00:41 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 5 Nov 2024 06:00:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jRU20klTkjW9fay3GrryiicXBblTumBxZkqvO8gsZwqII9lZuS1aP2ZwVigZRXR6yNKRBi04ssOYWDZItgB55H/CoxnjuQSBp9pqYOY+FlVvs203LsNYiWRju2+KO4FSxmM+JhVjxyXWQ1KrkUWu1VgVp++NABkOoUjsRMn++ToXH93TMauFndsAyhAzKBTyxcIMwe7K+Qirc3kB+9o4ajHaDaG3thSmlm3IUgJQ52XuuXo/vM+Ofugvj1hryA1qlD9qfxc9XHOp65C3Ukw6wu04vh1J+aeOD3ZzX0vJE5kjorMI/AgPvfI04b5lSyjEkejMrBp9vFC4Agtd6f0GfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IO7Sgdz69yZu+TULN4rljttdkJMbmdWQ15izr6GqR9Y=;
 b=F7TM7z1562CFR9J3E1hb7lrMkJDiaz2h1hiDtBqMQniLdSv2Cwbkgs3IY84Yb/JeODJvJlLgqFcM3pvEgaJ+bjhhVRBci/2e208ppoqEzx/naNVqxUijsoSA+qtAOhP3xqNvYjCk2n+FPqp8FM7MEe0lpTW4IFXbt8JdJFnsiovRiiNdIDIsjE5IHy5TQsviwJbUT6vfhubRAvluaWnLo+Z6UkqIj5FQJxqiuVAUvS7QwQkxd74zf0ZTe32vg2/uBxWaHItDae+WxgfFOCeiIrOJJaad88gFL8P/jmOJ+NYcL/+JbPdJD+TtJbzpbD0AHHVaVBiSmNV955SWDJIhKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL3PR11MB6364.namprd11.prod.outlook.com (2603:10b6:208:3b7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 14:00:33 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 14:00:32 +0000
Date: Tue, 5 Nov 2024 08:00:30 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH] drm/xe: Fix case for asserts in documentation
Message-ID: <6rufdjgykdabh5snik5kheyygwnips6avoaa2gnkv6ts3kpbfm@4ubv4xp4id2z>
References: <20241105071539.2623727-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20241105071539.2623727-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR04CA0102.namprd04.prod.outlook.com
 (2603:10b6:303:83::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL3PR11MB6364:EE_
X-MS-Office365-Filtering-Correlation-Id: 19122292-c862-47c2-279e-08dcfda236d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HNF13YXrJUI6ucmiRUtaj1hWOrM+8910HbPkXmBLvCERHCe95Reraq6qrSfl?=
 =?us-ascii?Q?aQfx2UaynJCFNkG3ObqC5VfhgJrExaAS8GaY1qkM+1G+Bi73fEbC0+jkEgV4?=
 =?us-ascii?Q?VLf2m58BfnhVtfPDHfMl79rYoALaQwyn5UPWVWVbOn75cyrOOxCXBYCo676i?=
 =?us-ascii?Q?vOYQNh0ne/WY8hcY/cyK3Q0ttwGrgbM9LxEx8rmDmWJLjYymEr2DYQVAoWSX?=
 =?us-ascii?Q?w5X0iIH010h+BQAEPYrOZo9XhJpBxTT1kb1y1kVPTYGsBwKvLfpRiBR/Jw+B?=
 =?us-ascii?Q?KDckLus5iEzYXl1c4CXvS3+r2puy3Rv0NikgH0L5euVLcTO8m+UxaeyuxqJt?=
 =?us-ascii?Q?/QpMB4JNl0AsjLx2EQigHNfjLgGuHOmcL0iEEabsHt8YrSOkpF2R25ct5J5d?=
 =?us-ascii?Q?KvAPYN0ANKHJdloEYtplvdCGLfwhHYvW/HSLCGN99wQHOtsK+DwsiSt12uje?=
 =?us-ascii?Q?7AyCsQT5Kk8NZFEjOKMCq9W0oaiyL7T6QwyJSxtXm4Q0g2Gnpft9lBKlz7J4?=
 =?us-ascii?Q?m+4TWjhG0ti+znEJ3dLRFq+GxgHHuU8+4UgLcE82j9u+1VCk5B0DBRN2Y0et?=
 =?us-ascii?Q?/E1hVPrM3imNUVAanen/Q3wLHwRTN0Ft2wJKidomtBijhyGpWR654AsUCnwQ?=
 =?us-ascii?Q?dvIT7oCoTLZs8tP9nDvMghE5vGYddGWAZq7k9EGT6fLA4EB21zfeVbreSH8O?=
 =?us-ascii?Q?G8BVafKoYNvrXzJrhCLe+UDokZ5U1DA0aj+Zrkc99yq+mvp28WWM/lNk1XaQ?=
 =?us-ascii?Q?yPXNqTakw8fIkQgusQHYhecXH3uchujtFy+rqUQgQBKGoL+dcjx39AaqEz6x?=
 =?us-ascii?Q?gs1UU9QNZeGpfJc6Ncx4ecScmNFvA5/H7BCXY/FfohjxZ2JKml6FRBmxvMP1?=
 =?us-ascii?Q?gnsNbIyHAgKHN6cSmzfmzSQZ1WyO/ao0v8HXwI1TCBH7z5G5mdyZgsQbyExx?=
 =?us-ascii?Q?dkfIObFlEKEwW5lP5PMl/UlTLyrq96CzNSjYbaCizkQwQ9JfyVsjbfwxu+oI?=
 =?us-ascii?Q?nNd3FLo0qeHRZTdgNdya5pcPjj21BGRwg5eo8h563J53HTR8HS1ouJ/teptO?=
 =?us-ascii?Q?HtpBAXWQQtzZnFfz/nr5Npv2HCX705PZXPXEXyyN/JRbx1if/KE7m3mPzoaE?=
 =?us-ascii?Q?ZE0bEz8b2pVozIGW4UKuPhyFBJW6VWXGG33IeouB82CRMFG509kikmw+wNiM?=
 =?us-ascii?Q?Qa/JnYQ92yPd4afgnVCRtsTZ6+4MKxRXAA3xiHXBGXz0VHTXM33m9F5ploPN?=
 =?us-ascii?Q?oe4RxZn6aOCWboxBdcHn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YQ4vlBKCEzWHWQiV3Hq5YqyUWkH322DLpiCLkdaE95b4EpJgSe+vJrrvHovU?=
 =?us-ascii?Q?l6Qi1KWvgmkyA2zYFZE1qgKTiT88KtazxhxA/jObTzEtMhpiRqw2PMhVkOBt?=
 =?us-ascii?Q?nVgbjcZKTD3mZm5XB4L+yBdx4cuGyZKXxrwJ4sbDyq/AUeRZGj8zImNwoFz8?=
 =?us-ascii?Q?JPaViY7yValM4mRw/N3fX8cjwRw3EkxSQe0vBldBQFVe4+vdP8wpIT1ldLdv?=
 =?us-ascii?Q?cSTbPe6EnjiebLf0x7AwUWoGqnXBIkdMjUv+pSbDupbtLSBKDkiZQY8Aa6MH?=
 =?us-ascii?Q?JD8urzaykeO3gQPXYMf4HbxG145HK3kJEDwElMcOWRtXgefUfPij8ziz/JmP?=
 =?us-ascii?Q?4MTFhgKpDgZS+8ClZ2BiTaLcAeoGlf+m8YFC/aipuVEdgJ/xI6TuwZObIakY?=
 =?us-ascii?Q?zploQZGT15Rz7h9AH9+MakuisB/UH4xCoHBTtr8KNw8i7ekTLVCKdPfpbCxX?=
 =?us-ascii?Q?C9LufXXsABDkL0e0EefNn9+xGKx3MZAmvOXl3vmFdIceIIhq/ZxW3aYVhxvy?=
 =?us-ascii?Q?+pxN0UEq5Ir30pUypE4+fuODGVzG1nqWuc5YpVpX+72KdVhWGC6ocvdmuIsA?=
 =?us-ascii?Q?QYmTCziayQDQpz7gvg3zE4CUUzL6a58dddZhRygUAoRyezZbO7xrG5bwtZZc?=
 =?us-ascii?Q?5ZUcusA798+J6W9a+2qHjE4DiWsX6OX13DMibq70d3V5GMsOaABdV9fn5F8V?=
 =?us-ascii?Q?aOml8fuw6S4bw0KZL/VvajTYDXALyJx+37Nkh9StvZjf6Ry1T3OkCWlbVYjL?=
 =?us-ascii?Q?DuewFrkeJ17S+G6xNXZdbkl2Rz4WjGzSoG8ZK0n/rWj9h4WDDpWXMeCRCZJf?=
 =?us-ascii?Q?zqKYB7s5yGrvA1cvzs9RQRBmAE88Fi3uGKN/7w7/zE4h83pyvrBonG87xuvk?=
 =?us-ascii?Q?NS4uZQpy0RDyrlB4gXkyTCUzOdwyLqHUJU+xp4uVTJiSdHTVLcaKqrK/unVu?=
 =?us-ascii?Q?T5VAAJhODluCBDRvdiKgkBGbX/D2BtuYE8AsWxLHR6Jd/mj+0ody4DRc2C8M?=
 =?us-ascii?Q?1GhWqChU246vo9VLP0/WqzEzVu0JzGU7xlGsrrXWqnM4JD6/TbHarZnphj8C?=
 =?us-ascii?Q?7QxXCVFiRvs+ToLCAQog0xKdN/VGrT5rpv3MGkpHR/lcWoZqdcmpR42DdWqD?=
 =?us-ascii?Q?KUEz5SBLeIs8XBaAB4oQP+wVZcBXQenB9AEFgFbyJjkdc6TFOfngFrymRJz6?=
 =?us-ascii?Q?yAda8gnSAMAR1lxXwzOPTU5Y12ekuFOwHZxDbZyFglZdOi3vbTltC4184B7m?=
 =?us-ascii?Q?rry7G9YUvHnjhbvNqolLz32/C34V0CzHrWkVL2k/xNn00ct2yM650o4A6N5f?=
 =?us-ascii?Q?Xx9Hupneksp0BmyJ4pdkNWD3lLvjp3onhyJ5MM4bSFUvgymdPZmH3OG8Qqni?=
 =?us-ascii?Q?5veTbVibOxrjupHQxDxFvDkgdkzJUTkyzXnj8dpINiYxGfHPKmMTbKBB26N4?=
 =?us-ascii?Q?UstwbdGSJHKitNUv9HzPrCXob7jq8WSYwK2iDHCWAojdqfUbejU45TiHuXE1?=
 =?us-ascii?Q?z8Z1ZKwl7C22Rx6S3w7sKPWszA+EIhr1o0CaBNC3l67y9ui9crGwr8DdDVop?=
 =?us-ascii?Q?AeomLF2+j+99ar1J/G37cirL8lpA+5EdNtjv7hXpi4J7PlLXw3CT8mp+igQr?=
 =?us-ascii?Q?qg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 19122292-c862-47c2-279e-08dcfda236d4
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 14:00:32.8694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: unJQ9kRoKVUVIkc6cfzFtdxzA+EI0miZotFkP+8/5IyD0vBDicy3pq/QsJAiwQjWfacKXW5+j4G1lCl7RupaB1lh43m6ZZITEIrB0TQeQNE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6364
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

On Mon, Nov 04, 2024 at 11:15:39PM -0800, Lucas De Marchi wrote:
>The rendered html documentation for "Xe ASSERTs" doesn't look nice with
>the mixed caps and gives the impression it was a typo. Use Title Case
>Style.
>
>Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Link: https://patchwork.freedesktop.org/patch/msgid/20241104140813.1992885-1-lucas.demarchi@intel.com
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Applied, thanks.

Lucas De Marchi

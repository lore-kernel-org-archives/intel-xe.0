Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A985C83F26
	for <intel-xe@archiver.kernel.org>; Tue, 29 Jul 2025 03:29:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C11B10E5B2;
	Tue, 29 Jul 2025 03:29:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xlb2JsnO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A055E10E5B2
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 03:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753759778; x=1785295778;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=BuosasLg6DprxoQ9o2Y35UHIgboIJU+fhTHwCLwSLxg=;
 b=Xlb2JsnOcoEFQQEJsQVYJTAznPszxvTfebv3kvf6ba/1wfDPNPC+qyMh
 A+fKYnoHw+DJ+S4OpHSFteelGR/Pz74r66jMoOb6jiomoc/EpL9MWs0iX
 tSMTNAh5wX3znk76j7I+sB0ZJZwWXW9GHCwm9PHfsreLE2Plq8MqPDw8T
 fFUFezOqi7srJa0m9BzD4OyXWyBvW/znhIRXSeFqjlgoyWYRAuy6oz9Mg
 vlE+MZJIULVUnwVA4fHltIh8W3T2hdQcKXtNljf8dEpXnh5Vwr4s3Sy/t
 zP9t10V6H02slYjnefIXUQYdsKx5a59vmICzkP1jJf23ZXCZt1XK6gOaH Q==;
X-CSE-ConnectionGUID: DaRo92DSR3ay5xc6aa6cEA==
X-CSE-MsgGUID: s+F518UUSbKuTDVo3EuW6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="73468002"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="73468002"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 20:29:37 -0700
X-CSE-ConnectionGUID: uO1v3kedRJysui7MIh5qUw==
X-CSE-MsgGUID: 9fkv4DLJT+aceCgs8wnbjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="162628364"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 20:29:37 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 20:29:36 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 28 Jul 2025 20:29:36 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.81)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 20:29:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TCiVlRIjdRrq9DDI1V5DQC5bEuYHsy3rSHm67rR1p2nvMbwqLu980yJkmVrK2BmW8BmPxpWlddFVIvjiXO2QpguevbUQ7CEuus0qA6uh3HOGf1kauhVckkYcJMsvHtJ0ntD0h0a2AXyuiZlk9TULfQLDHw1C0uvLcEy8cVsQP1XNeoCyM58IEiSXDkaVGi+Sj/AKn44AHbNDAPSPzS4wAoZraRD3smeU9RicU3TCk0KxhKl7QJDh0hzewkoyKII5D/iPly+nUBQML0mIzlpczlWOU2N1mr1MrzoHQGyewC4k7hHW4Ta7rSLNXF5xI/7DPYzyIN5KYnbjQIF2dytaoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z0Z8Qeg6q7ly2iBhnxJVqZkvfAlssg6b/YseCW60XI0=;
 b=PrBBfGrcISUo5v98FUpH//UU+TmvJ8C5WvNEUmLBVpZ5sqj0Pu9kTNcT/hVGpd3rZNNA9Plt/HR3lsDq+LoDm/PbLc5h2WdJV/XLswBhLdIUZ/9Q2hxK8Z+SJVMN7Dfvvo4Z0hfu7D0+JnlBlkii8od512/Rvya8LJDI7otcV2tvqUO+6Mm8SehiZ/jco5iqUcrVpUUue3uQuMPAaGq370NbPx91Xyopp/WTxCRliY37aKQZU8YZUil1iQtFC1tU4dc2OxBdWNrDcSOzADgb4kwlNWJKBxAGVSe3vKcP+iEz87WMJiUmFzaEYqmYh7lnn6fg0m0NYpxGWOYQS//23g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB7591.namprd11.prod.outlook.com (2603:10b6:806:32b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.24; Tue, 29 Jul
 2025 03:29:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8964.026; Tue, 29 Jul 2025
 03:29:20 +0000
Date: Mon, 28 Jul 2025 20:29:17 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v5 02/23] drm/xe/uapi: Add madvise interface
Message-ID: <aIhADaWMFfId3v3O@lstrano-desk.jf.intel.com>
References: <20250722133526.3550547-1-himal.prasad.ghimiray@intel.com>
 <20250722133526.3550547-3-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250722133526.3550547-3-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR04CA0294.namprd04.prod.outlook.com
 (2603:10b6:303:89::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB7591:EE_
X-MS-Office365-Filtering-Correlation-Id: e6d9fce7-ca54-47f4-b58e-08ddce501ae3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?RKIialmYnQSAWXSUnY0MuxqICVFJ6UYE5VRI00D63Ev55wZbOR55pKEYJ8?=
 =?iso-8859-1?Q?OqVb5llbVkSi1Rwq1mpcTUGcuG9qJJZsBg6OAtsLtOLo0qq5ec4xe3i9mV?=
 =?iso-8859-1?Q?MGrU9p8GjgUroWhYqjYuGZdV6setMoS6YvYZjFbYw2WHWtmK09elzsQqJK?=
 =?iso-8859-1?Q?SV3kndC40FTAqELo3yRXH8/DxKgFMb04QADPxnND1wREvAt0P59429RN68?=
 =?iso-8859-1?Q?iUjGp1RPmOqSDYxDQQRh++rlV0evtGMplhzwDjDiWZKvRRhOVrQ5yds8tt?=
 =?iso-8859-1?Q?wnABiOSiP20N8KYDenidim471x/rr1SsBwD4AAjWbI9Ng51KtqUvL7E/OL?=
 =?iso-8859-1?Q?YF2gVl07YhlPBumnVD+kAtpxLw0SDcZjVT+mtfh7+k5sj4lU0I16XRMT4M?=
 =?iso-8859-1?Q?tES+i1aVZ7GME3YcBJKqrNlflWdYf0KSApS/ZZ/+lTSzikeMjtNT7ZJXyB?=
 =?iso-8859-1?Q?UcHlI+TGVChVQJGd5jSQPgDmqNfkK9xPjLotrxwV3nIiCZLRsZKYBktkks?=
 =?iso-8859-1?Q?ej/WLiqLP+EXpmU4RgYkQKAYHTIMTtsvtv+ijBWjOqtttxxnCEsi/OvLBG?=
 =?iso-8859-1?Q?5RMDBO9lMRqPIX7T48ZVj4rIcYr5oJ47ZUE8Ja7iQB7nMROfu3V8TiLt0J?=
 =?iso-8859-1?Q?qfou1zw7SMfWJo8pxbwpa0IGyg32YjSY+27zBgQA5U0pBKtZaUJT/LpgYm?=
 =?iso-8859-1?Q?VVax8f9rMJ0+na7oLcat+Lf5/PPemcZvrgfL2MDB/UDVcjl8WUEQZUC7kd?=
 =?iso-8859-1?Q?cQyMwuHSP3EfLNrYCNjLCT6Ug9FemeLRjVjedUAEnuza/161L+XHHWUU9f?=
 =?iso-8859-1?Q?vPEuvfXMv1hkZ3Ipg7iBacmdy1IgRHU9COLgPo75GsXSjDZkAyZ8zrU9Y6?=
 =?iso-8859-1?Q?DabcdGCYrUgRUIUi1MPYTAhBXspazUciV4rR1GfGBod/beiFr15xAGwX6C?=
 =?iso-8859-1?Q?FqbKnKDs5ySniJCEZdLKliK5b0xLXJFzdzDueauh9Vn/+HMm5dE8CQm2r5?=
 =?iso-8859-1?Q?JvMAxvR5sasuu1APkZKQk+Doyss5W5YtqUJETPr/pDPdkd+7uk0KjoXxFv?=
 =?iso-8859-1?Q?rV9G23CBCEOzC1ADnOSwRzTqEBo0obbw95pxp1kC8Gt3raJlVnzLhRqmlR?=
 =?iso-8859-1?Q?kTGu2Vu+XkvHg/g4bPW+dBPjJQXzTulQK/nclW4PxTFiZgXK8SmshobrpO?=
 =?iso-8859-1?Q?bIgidvGWCbPt4zXo/N/9iVlrJV1Eldj7Vt1U7rRjIVuPIRZpEgCEr6qzbF?=
 =?iso-8859-1?Q?jHNwbmqm8MO0eeT6x9nbFCiDKbccnazHwFHBprnMCJ7H3OflZMhKjoSP/+?=
 =?iso-8859-1?Q?za7/dEdW1hj76MzMWA6ovIS/pI4aX2aS20cbSJNXQzNQjlUaf9d7D3rJpD?=
 =?iso-8859-1?Q?tT62Y4z1I4d3rvvl3xg3CI819qyo7m42Srw3/1iPyWxBohbXcKWjHurtHs?=
 =?iso-8859-1?Q?gFtuhyZjtXrbUQT7HgV7yrpTErIjAlVt3gFciA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?x/77YbYPdNiI6tboOFk/B94uIGJO8JMGf3RZTBdH4vGW84cBiIGU5ORHz8?=
 =?iso-8859-1?Q?yMzEsEbKNeGJTfpyUUWp/9CORrseG7CTDlzTsaJOA91VGumUtX3v1QGK1z?=
 =?iso-8859-1?Q?JezqQRIyDbGgY1iL1prces7a8u5LalC7kkZ0QOs1zzukjOX8Z7dyu6NCsx?=
 =?iso-8859-1?Q?C6/l7ZyPbDcZ0IJQmMgoe3vLkPD3GxbKbnS7s1dPs7Pv9npklTm9fviD+r?=
 =?iso-8859-1?Q?pSQ47P7qiVt3mASCEaOW8c6QszIaofhZ9MdP7BGY8S+FGmbwH4NsXOMDRO?=
 =?iso-8859-1?Q?TSkOWbX2zaD6LZ9h3VfhkldVugyjAaTOIULz8jVRyIRP4HJ01lzZDe5X8e?=
 =?iso-8859-1?Q?d747o+RjIEuRbzT7Xpe7q/7aYvdcQW8nZPnihj6vdS1GAoTf5yDKdRx3FX?=
 =?iso-8859-1?Q?B3xoZ00Y/EhGY/LZ99i+8zyBAzQ0H2O9riZgEJ/GSdJLukWJvvYGpmr9F8?=
 =?iso-8859-1?Q?pyXgm1dOob4Bd+/HfFE2O9PDcZU1nHBMeM+ytDUtpj0g6f0ODAdn12vtxR?=
 =?iso-8859-1?Q?fsv7HqR8afa+kx41FHATkRgIUdUIczIF/3jsxvwLf8zuQds/jjFBn/og09?=
 =?iso-8859-1?Q?eLhuLtV9WS591I/lJfB6yW7NK8OE16B86ATU9q5rmn7zZtDsSWJWUvw3x7?=
 =?iso-8859-1?Q?Qb51+tsS5MW7SoT7NO106VjzG7GKOIr/iVDBw+XJlHC8bvR8aHpV2zYs2Y?=
 =?iso-8859-1?Q?Wo1TFuYAOJHI9hr3lzOC13eYRzg1cp06PLhaZ3NsdaK+/RkM24sdF2hhnn?=
 =?iso-8859-1?Q?Y3mX6EUR7XaAACoNzrdzEhlLHIDZPXl5ib2x83WAFLHf8/pJ1nqjKwOFzb?=
 =?iso-8859-1?Q?VlETFDkfYZ45u8f0mCJ3Jc8NGmBILAdwcHSiBDh7T7FCxBqA+9ARP3G8iG?=
 =?iso-8859-1?Q?sdJ+1w0oAG0Q6TerrkOpIcURsjpaDxisheRUB/omhKYLpRFOAspKwHBds8?=
 =?iso-8859-1?Q?I7CWto06205MfT/mO730SnKZdJ4BlPpWmJ2hk9GUoRH/ZYHV17tdT19jBp?=
 =?iso-8859-1?Q?sBLjdzvIj73kYwX4fv+Pg6R4SS+mW+P7WG2Zuygv518/YV2Y8MXjMq9eBl?=
 =?iso-8859-1?Q?8o1/WjHOa/nQi/jMYxZsZYFG6VU/4dfLSKl5HRRculeaBUiAmmWMvcqRiq?=
 =?iso-8859-1?Q?WYoO4Jld4mwnuz4TdPKc70yV4WaynY9k39APCXBAM+Y4egdjjuKXjCtBzo?=
 =?iso-8859-1?Q?fghlIXa0rtkUU2/5ok8i7aNP+ic0OK6upO36FEJBtXKSyUe1O89GpO3aT6?=
 =?iso-8859-1?Q?0mJEfnexQSpEsvOHZJ/L/lQKF5jfY9YkQjUJqTpPW9lrGR1/4cxfks56BA?=
 =?iso-8859-1?Q?Mg1/556c0z1hgT0K3H6RSdBI/njdYTzu6kEQQzT5JtuERMRHNv12CO/fdv?=
 =?iso-8859-1?Q?opVl4uYFuL9J3Enfq3uXHFojTqZK+1WOzLI6hnAU+s7erSc6gwPv1SUzaz?=
 =?iso-8859-1?Q?geOBQ3KLKSAYnu8f7L8hhjRDe7PhZr9aumFQFebdLMFA7Al8RH/JH7istz?=
 =?iso-8859-1?Q?Rh9ita2Q1rLtDcBZblaKjdKxj0ubpGLKgm2Sgez3V09blxiyJyMpvG9Yav?=
 =?iso-8859-1?Q?C+UU1uSemgyHzoLBuKpp+oEF5djeus3oxTJ/AFNwFI4ZKAqa0C8KKeW+iw?=
 =?iso-8859-1?Q?efOEPI1C5oq0XDxp2pFt3t58HE+RIwFt963LfW9zdnTGi3k3MB1kt1eA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e6d9fce7-ca54-47f4-b58e-08ddce501ae3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 03:29:20.2546 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lWIHED8e1qMYgq35PoAK91sadIUoGXTg++PvAoMXDHzga2ayl+/BAB+4e635ss7Nt77+6iDzrqwBjdPB6ZTmSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7591
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

On Tue, Jul 22, 2025 at 07:05:05PM +0530, Himal Prasad Ghimiray wrote:
> This commit introduces a new madvise interface to support
> driver-specific ioctl operations. The madvise interface allows for more
> efficient memory management by providing hints to the driver about the
> expected memory usage and pte update policy for gpuvma.
> 
> v2 (Matthew/Thomas)
> - Drop num_ops support
> - Drop purgeable support
> - Add kernel-docs
> - IOWR/IOW
> 
> v3 (Matthew/Thomas)
> - Reorder attributes
> - use __u16 for migration_policy
> - use __u64 for reserved in unions
> - Avoid usage of vma
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  include/uapi/drm/xe_drm.h | 131 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 131 insertions(+)
> 
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index e2426413488f..51dcf63684b0 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -81,6 +81,7 @@ extern "C" {
>   *  - &DRM_IOCTL_XE_EXEC
>   *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
>   *  - &DRM_IOCTL_XE_OBSERVATION
> + *  - &DRM_IOCTL_XE_MADVISE
>   */
>  
>  /*
> @@ -102,6 +103,7 @@ extern "C" {
>  #define DRM_XE_EXEC			0x09
>  #define DRM_XE_WAIT_USER_FENCE		0x0a
>  #define DRM_XE_OBSERVATION		0x0b
> +#define DRM_XE_MADVISE			0x0c
>  
>  /* Must be kept compact -- no holes */
>  
> @@ -117,6 +119,7 @@ extern "C" {
>  #define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
>  #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
>  #define DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION, struct drm_xe_observation_param)
> +#define DRM_IOCTL_XE_MADVISE			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_MADVISE, struct drm_xe_madvise)
>  
>  /**
>   * DOC: Xe IOCTL Extensions
> @@ -1974,6 +1977,134 @@ struct drm_xe_query_eu_stall {
>  	__u64 sampling_rates[];
>  };
>  
> +/**
> + * struct drm_xe_madvise - Input of &DRM_IOCTL_XE_MADVISE
> + *
> + * This structure is used to set memory attributes for a virtual address range
> + * in a VM. The type of attribute is specified by @type, and the corresponding
> + * union member is used to provide additional parameters for @type.
> + *
> + * Supported attribute types:
> + * - DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC: Set preferred memory location.
> + * - DRM_XE_MEM_RANGE_ATTR_ATOMIC: Set atomic access policy.
> + * - DRM_XE_MEM_RANGE_ATTR_PAT: Set page attribute table index.
> + *
> + * Example:
> + *
> + * .. code-block:: C
> + *
> + * struct drm_xe_madvise madvise = {
> + *          .vm_id = vm_id,
> + *          .start = 0x100000,
> + *          .range = 0x2000,
> + *          .type = DRM_XE_MEM_RANGE_ATTR_ATOMIC,
> + *          .atomic_val = DRM_XE_ATOMIC_DEVICE,
> + *          .pad = 0,

Nit, you don't need to show init of zero fields.

Nit aside, uAPI looks good to me.
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> + *         };
> + *
> + * ioctl(fd, DRM_IOCTL_XE_MADVISE, &madvise);
> + *
> + */
> +struct drm_xe_madvise {
> +	/** @extensions: Pointer to the first extension struct, if any */
> +	__u64 extensions;
> +
> +	/** @start: start of the virtual address range */
> +	__u64 start;
> +
> +	/** @range: size of the virtual address range */
> +	__u64 range;
> +
> +	/** @vm_id: vm_id of the virtual range */
> +	__u32 vm_id;
> +
> +#define DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC	0
> +#define DRM_XE_MEM_RANGE_ATTR_ATOMIC		1
> +#define DRM_XE_MEM_RANGE_ATTR_PAT		2
> +	/** @type: type of attribute */
> +	__u32 type;
> +
> +	union {
> +		/**
> +		 * @preferred_mem_loc: preferred memory location
> +		 *
> +		 * Used when @type == DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC
> +		 *
> +		 * Supported values for @preferred_mem_loc.devmem_fd:
> +		 * - DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE: set vram of faulting tile as preferred loc
> +		 * - DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM: set smem as preferred loc
> +		 *
> +		 * Supported values for @preferred_mem_loc.migration_policy:
> +		 * - DRM_XE_MIGRATE_ALL_PAGES
> +		 * - DRM_XE_MIGRATE_ONLY_SYSTEM_PAGES
> +		 */
> +		struct {
> +#define DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE	0
> +#define DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM	-1
> +			/** @preferred_mem_loc.devmem_fd: fd for preferred loc */
> +			__u32 devmem_fd;
> +
> +#define DRM_XE_MIGRATE_ALL_PAGES		0
> +#define DRM_XE_MIGRATE_ONLY_SYSTEM_PAGES	1
> +			/** @preferred_mem_loc.migration_policy: Page migration policy */
> +			__u16 migration_policy;
> +
> +			/** @preferred_mem_loc.pad : MBZ */
> +			__u16 pad;
> +
> +			/** @preferred_mem_loc.reserved : Reserved */
> +			__u64 reserved;
> +		} preferred_mem_loc;
> +
> +		/**
> +		 * @atomic: Atomic access policy
> +		 *
> +		 * Used when @type == DRM_XE_MEM_RANGE_ATTR_ATOMIC.
> +		 *
> +		 * Supported values for @atomic.val:
> +		 * - DRM_XE_ATOMIC_UNDEFINED: Undefined or default behaviour
> +		 *   Support both GPU and CPU atomic operations for system allocator
> +		 *   Support GPU atomic operations for normal(bo) allocator
> +		 * - DRM_XE_ATOMIC_DEVICE: Support GPU atomic operations
> +		 * - DRM_XE_ATOMIC_GLOBAL: Support both GPU and CPU atomic operations
> +		 * - DRM_XE_ATOMIC_CPU: Support CPU atomic
> +		 */
> +		struct {
> +#define DRM_XE_ATOMIC_UNDEFINED	0
> +#define DRM_XE_ATOMIC_DEVICE	1
> +#define DRM_XE_ATOMIC_GLOBAL	2
> +#define DRM_XE_ATOMIC_CPU	3
> +			/** @atomic.val: value of atomic operation */
> +			__u32 val;
> +
> +			/** @atomic.pad: MBZ */
> +			__u32 pad;
> +
> +			/** @atomic.reserved: Reserved */
> +			__u64 reserved;
> +		} atomic;
> +
> +		/**
> +		 * @pat_index: Page attribute table index
> +		 *
> +		 * Used when @type == DRM_XE_MEM_RANGE_ATTR_PAT.
> +		 */
> +		struct {
> +			/** @pat_index.val: PAT index value */
> +			__u32 val;
> +
> +			/** @pat_index.pad: MBZ */
> +			__u32 pad;
> +
> +			/** @pat_index.reserved: Reserved */
> +			__u64 reserved;
> +		} pat_index;
> +	};
> +
> +	/** @reserved: Reserved */
> +	__u64 reserved[2];
> +};
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> -- 
> 2.34.1
> 

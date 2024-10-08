Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 652F0CED276
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 08:27:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30FE910E4A3;
	Tue,  8 Oct 2024 08:27:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Va/KLJGv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8227110E4A3
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 08:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728376022; x=1759912022;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5ZpUUB2sytw+ysIAGJcaTLo+nvoakzqrjIR+l+Gk1Cs=;
 b=Va/KLJGvwdTt/Kcuru/hrpgUtkMg4lF2KM26qx42iqQgvgL99rcGm11c
 v4huvIQaAR379UvpZtdjlUOH94pZdjruAv5Nhoh1O5vlaEjBVQSKLgmWM
 QVguYfLHFUEOjua5cng34ktrWgecIpdJA0QtHd4z8LPDBrzwzKxhSGQcZ
 vZQmimngI9KzagU46Q7iE01V7DtBjoY743W66RQaDkSFBlVYRxLVuF/cd
 rgXluI22g65dSpkl+ZavKzZYEr6eYGjuhbdjKN+Qy1jfJORZ2U9Sbta42
 NdZ3gzvEmOhwDluH5JRydPkmEyUzA7kLOR0Z6HQpTT9y9azvrGlG8bh3Y A==;
X-CSE-ConnectionGUID: ciaJ4ZQ0Qj+NOSVnE0Ypdg==
X-CSE-MsgGUID: WO2I/0XARSOEcQAD67QEGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="27438872"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; d="scan'208";a="27438872"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 01:27:02 -0700
X-CSE-ConnectionGUID: tp04xmCnS3qaX+cHGkNPrA==
X-CSE-MsgGUID: McmAvLupTmS05ugM+/5pfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; d="scan'208";a="76589839"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Oct 2024 01:27:03 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 01:27:01 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 01:27:01 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 01:27:01 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 01:27:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MkYx5fDyySyiMeHb7TQMUWar8CWRlvGOxCtQmVjwGd73i3yLX3KN16BvsWRoQE4Ewlu0PM+NQiILbN+THBeLv9jLHqoLZhPIsIWHnvLWsvTeyxbUOGGBzReyCR3RzIoe2ZOLEj6XB0O4SNH+om6b/j7Sg3P0zTX3q3ex4nCzDQUGUQDoWqsTC2FiKANKx0ZZe3ixRzhjlhqnkU5e+M0nXdKk3Vgz0Wzbk0wHnC2yWP1Q32eRtd+Xy74FWtcFKo5ih7tqihrpPIM7n1PtyFoXeeVcHYCI5GZyATM2OUTMYHYjhwFJlqDhUrPETT/NeEgG/Gm1o9yz8JEH1L6hj9umbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PsWpwhsrxTwbkm8WazKioGTfIOS07QBofVg1uj0/t/I=;
 b=lBWYj/p+Xg8H52D7SNXGQjT8PvTohSJImyDicS9uILSb9bewlMOOkt1BLf5o1gWnzXYrJsQQrbhCvkyUCNZ5afxn2v0nii0r44YNfWWn4uaT5rxo/QB+Nu+dOhj2jFOpZ2acF3CHCx2Ov7eyTedJyZqAEjJKVW4awuafd5asiDHMxSv551x5rqzCdFgPihXD4HmRu0cKOjVsPhm99542q5VeacRr58pW1AEqEBph4s5xIIlR/PWw+c16zsznp2WDyGSGtsRz+imZXC9O5KDXyqdI63CWAonp1M9ATnjlWaB8uUOLpQAPNsDMdojy71WVVihApESUV8IzyRAt7C2x7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by DM6PR11MB4660.namprd11.prod.outlook.com (2603:10b6:5:2ad::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Tue, 8 Oct
 2024 08:26:59 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%3]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 08:26:59 +0000
Date: Tue, 8 Oct 2024 10:26:43 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>, Matt Atwood <matthew.s.atwood@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: [PATCH v2] drm/xe/ptl: L3bank mask is not available on the media
 GT
Message-ID: <ZwTsrLMb9_jqh17o@fdugast-desk>
References: <20241007154143.2021124-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241007154143.2021124-2-matthew.d.roper@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DB7PR03CA0094.eurprd03.prod.outlook.com
 (2603:10a6:10:72::35) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|DM6PR11MB4660:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a773b60-089b-470c-01d5-08dce772f9ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jagZdoqDrAtm8EEtjgqjFMj+JEDVeQaHbbyBr+D5ujzLKJs6ZJXta+PyVJlS?=
 =?us-ascii?Q?qhHo+itUuOUYV5KFXbf5JadvA/1RW6CVq9ow58m2SC+BFCoLWuH8QUbTVP5C?=
 =?us-ascii?Q?5sCqC1vMYNMZiayqBjFM+GVlFsOphYbCVoefqPkMXTlEAZRWtE8W9SI+XjwF?=
 =?us-ascii?Q?pxaa88XknTH/XrwxR7RtXFEMsuheq01h0nPOGp5qVRIseCa06B2atsduv+K+?=
 =?us-ascii?Q?QdO6cRtBFYJDhLArZ1vqeCZ0IpYyaB3JwyQuVBYM0jOgincPvk29QoPBUDBr?=
 =?us-ascii?Q?swO5QDMtkodpsS2x0ktlKRgSxqp9BJ8Yua5mJ7/Domi+wVMFVQUpk4XN8CKm?=
 =?us-ascii?Q?O/R6YLQKGyociD1yUuPfbAJ7nlC6QeyIJ+Vqw5lDsaqv3MDShp21frAhDiwn?=
 =?us-ascii?Q?jUs1M+qq67gxWb9xhBCm2Kdg3SfBB1Xp8Xqzyou91ykUTjM1zXHiBo7WszRP?=
 =?us-ascii?Q?jhP/+QBeHQBLzyjWWbbk/9gEy77MLYSOY0Q3G97PEar81xXRczgY2t7BzOQU?=
 =?us-ascii?Q?vVpDp8VVh8+1KWjXi/3yTS6wTylXzbWvgfIbpkozcrtUfffbQxrDp8LxXbNv?=
 =?us-ascii?Q?GhrrnAO+pcm0KosgewAViQiY/Ibt+BQO9+bygfFckNyCjw9knEBS6R2I7mmm?=
 =?us-ascii?Q?K7XpzSdCRzntnCUaZ+su/PYD76+rFLWin+Byk3XDS1VABGZSN0vmZzXFpZvt?=
 =?us-ascii?Q?v/SfqTykdITg7nkFff2h1BxobtKjaAe9nPHfEcwnW5Y2Z8NOuuYJOWvdNAzb?=
 =?us-ascii?Q?SBm7gwUf7q9CwKAOaNqyzosTUASkTSWXVBxmJo+rF9IJs0Bn9+1k/uaSsfdV?=
 =?us-ascii?Q?8y8RHeuCkpjxBvSY6z0S6kosU+6pJsKfHcIY7WcMB8c8p/jJgfRkrKDwOLwU?=
 =?us-ascii?Q?Wtd6sM/lYMCJBPQKvFLrLwLgWDI7DzCLld4QwgCLMO0jUfWXNOunOSr2lS67?=
 =?us-ascii?Q?60nze0N23A6tgCWO8QmBSxMEVVkSr+gbaHzZy8sJeHAr6KMuWWL3ZNFs2zHy?=
 =?us-ascii?Q?CDIGHP5Ewq+FpwBpVE17RhS2UC/yK33X9m4iFpk8mKxh5m5tomTqvvUa+JCs?=
 =?us-ascii?Q?f/ujgJR6RdaTLMadnDj1QXszKtH67Cwq1H6QcGkaMKLH+D09PmmlsvGel4dJ?=
 =?us-ascii?Q?VK9s/ROKj1LUo+mCoD9ylDLgXL/se2GbMNGv1zUxRIIsi6cSNh0JzforpKbQ?=
 =?us-ascii?Q?PSPmOsujNvGpGvJGcSYlU5wyd83H4thBm61m+GFL5Xk+XReMsfly1t1DT/qX?=
 =?us-ascii?Q?Lf34iII7XvQy+C+tZLRFeyctUfbbiaG5o8YkjTN0xg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LWe+Hjl7PSZJgJsGm9HETDoKm/XOUWqGeniLpMWUYo2MpWq4UMJxq3jZBYlL?=
 =?us-ascii?Q?16vesiA2PDiTg3uejE+hITxE6+VapW/aTH72HipMTJKdSBL5MKBh0yArI1DY?=
 =?us-ascii?Q?e6495PPAREm+6Rl3ZHwOLI3Ikwa+GMxnmmU10rhlO8w9AANLD+l5i7K17qm6?=
 =?us-ascii?Q?FpgouwzzZNHp33Qg3TrVWl14in2HLAUT7n6ZTTN1XM2iSa4b1egrepWuTEqJ?=
 =?us-ascii?Q?c5VWuwLofMxvOwP8vSC+4RZXcp3oTMjyucewnGjgSKmRtYDzgxVS8gkANexb?=
 =?us-ascii?Q?bs/x1/Bv52gOIAKOwPjDJdyW4D2sLb39bugx9To/qL1+aY6g2cyTAfBkZ7AW?=
 =?us-ascii?Q?pBRp2jPSPbsu6AEdYGcMZ44sIE0F4BawaaQZyXmp7wJvrZ9n+0j68UrTeOZW?=
 =?us-ascii?Q?EOCc45XU97uKUgfkYIZDAcy5ObtERAjv7FwI3A0Ga7n7VieoF5+cdWO5IHz3?=
 =?us-ascii?Q?bnkkKes4utB49PSCilpRC4mHihkYkxmNLlpKRlmpFjoleEXMhw48w5ZRAkT3?=
 =?us-ascii?Q?+/PdVMfszDTnaBGE0wO+D7J1MqIJOv91HXObb84PX/dSmFQqYa2usOCCuKap?=
 =?us-ascii?Q?i0NqyHDYr7FIefoLrJkeoc9sQJG8pkVozub37mmw+dPb7rJxYn4fx4InvfrN?=
 =?us-ascii?Q?z8DoqTDBJ45EAE6ISPXJzIjj/w8NNpZ/gXqkIqRQjlUULOuYbcL0oYURWR4g?=
 =?us-ascii?Q?lGMR18y0Phor5YVONC1UoUMukznsCO7KH+JEszdv67xoyBQFb+coHWECa/2n?=
 =?us-ascii?Q?OZ+71DhoNtQNZrQLdNNdbmyGxRxSPVHONuXRIIM3rTElbMn10LRr7h9vPnxJ?=
 =?us-ascii?Q?xK3w9wV3VwCmhU0Lz0NyG6EqOAayCABnRfbxV7AduKL/HxvGdpuTENdPJdI3?=
 =?us-ascii?Q?Krt7XCX1fvcSa5B6LAsDgppbVeZ/9ckf97BiqAz2P38zwkAH+HNpuxhS68+e?=
 =?us-ascii?Q?O7c1XcPqFfOHhAh3Jeqm4apkgJ8MLthlWWP+JgNcnuV75vPjHtEXozx2Cj6W?=
 =?us-ascii?Q?wZHvYI+6KnwS7VKKOb4qgq55PZyoVinqSrekInXwiPSFOEaEHf6NDPIAxZfe?=
 =?us-ascii?Q?lH8E1GcmMyYCkmKRwFmYCEoAJS/mhg05X8AjClnUWn1O6mZkSX0Pylfkr7bC?=
 =?us-ascii?Q?/iYq+E0H750sg8eKfRug1cEA6KP6AsLxtZ6p3pk/5QcDFrVR/5r49TtqwkR8?=
 =?us-ascii?Q?01VZ0o250IGwuafKho6p8EwkdZ9HtF/VOK0avxh3pdguKq9AMQRhM86Smwi4?=
 =?us-ascii?Q?GjAf4G1e5vPnVIOdzxNAth6IGSx/6hN9OW0NJtYOdSwq0C+BX69VgZq8EaYG?=
 =?us-ascii?Q?iw/BysuBjHqmARecMsLOsSSWpes9ZQ/RBPNzSFRtS/FnHXjZ6SL3/Y+yumKS?=
 =?us-ascii?Q?FMHsm1f6CEsQtbSeO+y8BHGVt+RGoLj4Y+Rk9raxBG62wWsHF+oDI0wgWg3X?=
 =?us-ascii?Q?flT/Wvv4ceC0C5exRVeFTriikFMlh2j1I3oemC5v715HMoRtjDBJ4NIF3JeM?=
 =?us-ascii?Q?WP2LwDfrVYSAPcJFomS68aRknSYQtMqwrkegiTZWFivwI+gMSlXiv9NCphEI?=
 =?us-ascii?Q?UXxPN/9I6057W/ZPs3C1KZcDiKu/X69dDcQcwB81nKe88st4eGtdnSXxmXgz?=
 =?us-ascii?Q?8Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a773b60-089b-470c-01d5-08dce772f9ec
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 08:26:58.9864 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /CTUDn9BMiLnM+buU2CMag9NexZCyqhJK1sRmwsCazolwjpIax19TfZqCGLUVvMPdeA2xphdT6a5ZYiYwX1YRJfuk44aC0UAYXjVt0VKurw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4660
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

On Mon, Oct 07, 2024 at 08:41:44AM -0700, Matt Roper wrote:
> From: Shekhar Chauhan <shekhar.chauhan@intel.com>
> 
> On PTL platforms with media version 30.00, the fuse registers for
> reporting L3 bank availability to the GT just read out as ~0 and do not
> provide proper values.  Xe does not use the L3 bank mask for anything
> internally; it only passes the mask through to userspace via the GT
> topology query.
> 
> Since we don't have any way to get the real L3 bank mask, we don't want
> to pass garbage to userspace.  Passing a zeroed mask or a copy of the
> primary GT's L3 bank mask would also be inaccurate and likely to cause
> confusion for userspace.  The best approach is to simply not include L3
> in the list of masks returned by the topology query in cases where we
> aren't able to provide a meaningful value.  This won't change the
> behavior for any existing platforms (where we can always obtain L3 masks
> successfully for all GTs), it will only prevent us from mis-reporting
> bad information on upcoming platform(s).
> 
> There's a good chance this will become a formal workaround in the
> future, but for now we don't have a lineage number so "no_media_l3" is
> used in place of a lineage as the OOB workaround descriptor.
> 
> v2:
>  - Re-calculate query size to properly match data returned. (Gustavo)
>  - Update kerneldoc to clarify that the L3bank mask may not be included
>    in the query results if the hardware doesn't make it available.
>    (Gustavo)
> 
> Cc: Matt Atwood <matthew.s.atwood@intel.com>
> Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
> Co-developed-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Acked-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_topology.c | 14 ++++++++++
>  drivers/gpu/drm/xe/xe_query.c       | 42 +++++++++++++++++++++--------
>  drivers/gpu/drm/xe/xe_wa_oob.rules  |  1 +
>  include/uapi/drm/xe_drm.h           |  4 ++-
>  4 files changed, 49 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> index 651ba53623e5..df2042db7ee6 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> @@ -5,6 +5,7 @@
>  
>  #include "xe_gt_topology.h"
>  
> +#include <generated/xe_wa_oob.h>
>  #include <linux/bitmap.h>
>  #include <linux/compiler.h>
>  
> @@ -12,6 +13,7 @@
>  #include "xe_assert.h"
>  #include "xe_gt.h"
>  #include "xe_mmio.h"
> +#include "xe_wa.h"
>  
>  static void
>  load_dss_mask(struct xe_gt *gt, xe_dss_mask_t mask, int numregs, ...)
> @@ -129,6 +131,18 @@ load_l3_bank_mask(struct xe_gt *gt, xe_l3_bank_mask_t l3_bank_mask)
>  	struct xe_device *xe = gt_to_xe(gt);
>  	u32 fuse3 = xe_mmio_read32(&gt->mmio, MIRROR_FUSE3);
>  
> +	/*
> +	 * PTL platforms with media version 30.00 do not provide proper values
> +	 * for the media GT's L3 bank registers.  Skip the readout since we
> +	 * don't have any way to obtain real values.
> +	 *
> +	 * This may get re-described as an official workaround in the future,
> +	 * but there's no tracking number assigned yet so we use a custom
> +	 * OOB workaround descriptor.
> +	 */
> +	if (XE_WA(gt, no_media_l3))
> +		return;
> +
>  	if (GRAPHICS_VER(xe) >= 20) {
>  		xe_l3_bank_mask_t per_node = {};
>  		u32 meml3_en = REG_FIELD_GET(XE2_NODE_ENABLE_MASK, fuse3);
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 5246a4a2740e..158629971eab 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -9,6 +9,7 @@
>  #include <linux/sched/clock.h>
>  
>  #include <drm/ttm/ttm_placement.h>
> +#include <generated/xe_wa_oob.h>
>  #include <uapi/drm/xe_drm.h>
>  
>  #include "regs/xe_engine_regs.h"
> @@ -23,6 +24,7 @@
>  #include "xe_macros.h"
>  #include "xe_mmio.h"
>  #include "xe_ttm_vram_mgr.h"
> +#include "xe_wa.h"
>  
>  static const u16 xe_to_user_engine_class[] = {
>  	[XE_ENGINE_CLASS_RENDER] = DRM_XE_ENGINE_CLASS_RENDER,
> @@ -455,12 +457,23 @@ static int query_hwconfig(struct xe_device *xe,
>  
>  static size_t calc_topo_query_size(struct xe_device *xe)
>  {
> -	return xe->info.gt_count *
> -		(4 * sizeof(struct drm_xe_query_topology_mask) +
> -		 sizeof_field(struct xe_gt, fuse_topo.g_dss_mask) +
> -		 sizeof_field(struct xe_gt, fuse_topo.c_dss_mask) +
> -		 sizeof_field(struct xe_gt, fuse_topo.l3_bank_mask) +
> -		 sizeof_field(struct xe_gt, fuse_topo.eu_mask_per_dss));
> +	struct xe_gt *gt;
> +	size_t query_size = 0;
> +	int id;
> +
> +	for_each_gt(gt, xe, id) {
> +		query_size += 3 * sizeof(struct drm_xe_query_topology_mask) +
> +			sizeof_field(struct xe_gt, fuse_topo.g_dss_mask) +
> +			sizeof_field(struct xe_gt, fuse_topo.c_dss_mask) +
> +			sizeof_field(struct xe_gt, fuse_topo.eu_mask_per_dss);
> +
> +		/* L3bank mask may not be available for some GTs */
> +		if (!XE_WA(gt, no_media_l3))
> +			query_size += sizeof(struct drm_xe_query_topology_mask) +
> +				sizeof_field(struct xe_gt, fuse_topo.l3_bank_mask);
> +	}
> +
> +	return query_size;
>  }
>  
>  static int copy_mask(void __user **ptr,
> @@ -513,11 +526,18 @@ static int query_gt_topology(struct xe_device *xe,
>  		if (err)
>  			return err;
>  
> -		topo.type = DRM_XE_TOPO_L3_BANK;
> -		err = copy_mask(&query_ptr, &topo, gt->fuse_topo.l3_bank_mask,
> -				sizeof(gt->fuse_topo.l3_bank_mask));
> -		if (err)
> -			return err;
> +		/*
> +		 * If the kernel doesn't have a way to obtain a correct L3bank
> +		 * mask, then it's better to omit L3 from the query rather than
> +		 * reporting bogus or zeroed information to userspace.
> +		 */
> +		if (!XE_WA(gt, no_media_l3)) {
> +			topo.type = DRM_XE_TOPO_L3_BANK;
> +			err = copy_mask(&query_ptr, &topo, gt->fuse_topo.l3_bank_mask,
> +					sizeof(gt->fuse_topo.l3_bank_mask));
> +			if (err)
> +				return err;
> +		}
>  
>  		topo.type = gt->fuse_topo.eu_type == XE_GT_EU_TYPE_SIMD16 ?
>  			DRM_XE_TOPO_SIMD16_EU_PER_DSS :
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 920ca5060146..0154fbe154e9 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -37,3 +37,4 @@
>  16023588340	GRAPHICS_VERSION(2001)
>  14019789679	GRAPHICS_VERSION(1255)
>  		GRAPHICS_VERSION_RANGE(1270, 2004)
> +no_media_l3	MEDIA_VERSION(3000)
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index b6fbe4988f2e..c4182e95a619 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -512,7 +512,9 @@ struct drm_xe_query_gt_list {
>   *    containing the following in mask:
>   *    ``DSS_COMPUTE    ff ff ff ff 00 00 00 00``
>   *    means 32 DSS are available for compute.
> - *  - %DRM_XE_TOPO_L3_BANK - To query the mask of enabled L3 banks
> + *  - %DRM_XE_TOPO_L3_BANK - To query the mask of enabled L3 banks.  This type
> + *    may be omitted if the driver is unable to query the mask from the
> + *    hardware.
>   *  - %DRM_XE_TOPO_EU_PER_DSS - To query the mask of Execution Units (EU)
>   *    available per Dual Sub Slices (DSS). For example a query response
>   *    containing the following in mask:
> -- 
> 2.46.2
> 

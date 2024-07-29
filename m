Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B57DAC3DA61
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jul 2024 13:02:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85B6910E3C4;
	Mon, 29 Jul 2024 13:02:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BEs9eJUG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C47710E3C4
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jul 2024 13:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722258124; x=1753794124;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=T+3TWenv6dYScc+ybFbGdmpnPpd3I4fkmOqAuMERbnA=;
 b=BEs9eJUGOy9c8J5TbJs4RWbCLly9o3S4hi8HyAt05cKv2N/r3HQftv3C
 cRFr4t5MkT3JliQc5tAY73ERhWgkvU5Ew2MOCXXtHdqCSOZYfT2cyChOg
 HC5JfX572cUfrL788bwrw4NFzRNKl5lbk0mgYrNL2HLW3MyXc/5W/685a
 Yuh7MUYY94uwg4VgAHjxF/NRyFNe9LCnD5dK7rG2Xxw8QgmqcwQpAV2lU
 RLa0TRr89Xr2nmvj+FPe84Iw1uQc8naqDOgcCIBRHV57ATqz3dRMAKE+B
 0nxd6MnkVNfxIVTBMJ/fmt/AQkbXyatuV1b8bdagFCi3sFpo5Km9i0n+u g==;
X-CSE-ConnectionGUID: hZ9aSI9DRlqdk1+8TX1GKQ==
X-CSE-MsgGUID: 56N493GnRACjn9xzRLd5Gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="30676974"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="30676974"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 06:02:04 -0700
X-CSE-ConnectionGUID: OVlXJ2iKReSk5iJ/yPAJag==
X-CSE-MsgGUID: +tdvtDszTw2/YtTXkKUjgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="53870321"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jul 2024 06:02:04 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 29 Jul 2024 06:02:03 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 29 Jul 2024 06:02:03 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 29 Jul 2024 06:02:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SDRMcJXqHvV7t+U8OUvf7EG7gYdgxxmL4WG9ZFkHzaeQqLx8/aL9yzUuxZ5QeURa7DWHRwqhVPucpnziu4jv9lWHul8vZNGnnXFJulayR/59P0yZogq5vrPddkCbbvClbfaLRIRwzDisj9Wr7YlZ/W5uTcSTHCjUbnCxfWHbovK6aq8+t4QJK48fs9oOtWphoQmRWhushVPz1udY7Gt/fEHURgLnzzuYJySdqRy4Y44axUPfm1e/03eZvF8IuRgfg6SuvfgeAu/hHu0VjkrjkSmIsJ39bCzcgGy+Lj28CsK2ykaSo5QIi6/VDzCLa6kScU5i5CJYID58my0Jj10mMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IHTSleUo4qSXvP3JjdiPHRgEGmdf5gE1UUK74ulkwAo=;
 b=RsJqKDJrtD5QmR6x+38COutt13HqxMk/sTA+aTh2lozEiKeLze1tURtNvQp3H6nrXKr3krZRiC+8I87rX4pTjss5QuEmw0CjRfyBri5UUYatq8NAj5VEhBsUX7Ktm0dvH2CNwDB/WY2MI40X0JJyQAKxAwVjzMZUg1rpNMkL9yUtONXEudr8oQ2Z8qUjGB9eN9DMMGFihguO7UEmermmbHKfFEzPffALllPvMg8TvM+FFgtBj5+g3UTbtYgaEyB8qHjzuJQrWUTgaGZSlmtkPAzo/g6pEwFVfraORIUFpSFVOoBaAtlUukLbCsloDmynuneOqhyDpybS9nYYCkJffA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB4863.namprd11.prod.outlook.com (2603:10b6:a03:2ae::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Mon, 29 Jul
 2024 13:01:57 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7807.026; Mon, 29 Jul 2024
 13:01:57 +0000
Date: Mon, 29 Jul 2024 08:01:53 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Ohad Sharabi <osharabi@habana.ai>
CC: <intel-xe@lists.freedesktop.org>, <obitton@habana.ai>, <kelbaz@habana.ai>, 
 <gustavo.sousa@intel.com>
Subject: Re: [PATCH v2] drm/xe/uapi: restructure query config types in an enum
Message-ID: <gqffceiac2b6r5nsgmzixccfc3o4xsy4n5x2rsrnxxkca2nukv@whe7y5cqyv76>
References: <20240729121526.448199-1-osharabi@habana.ai>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240729121526.448199-1-osharabi@habana.ai>
X-ClientProxiedBy: MW4PR03CA0315.namprd03.prod.outlook.com
 (2603:10b6:303:dd::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB4863:EE_
X-MS-Office365-Filtering-Correlation-Id: a3fc8806-23bc-499a-2f29-08dcafcea0d9
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?07PPjAXjaKc0ikCcXsLtGpDa8ZbEGze6TugF/V2xfnUT42C1J77p80ycLApI?=
 =?us-ascii?Q?pDEyHwZPQ190yr7LL/vRW5dh9OBKKCCpqM3gmHp5O9mOJCbqh1D88zPtwaC5?=
 =?us-ascii?Q?X9T0GIpCNeDqufY2YFkDB/CNN0vqea9B6sVMO2J+l2Q3Oo//QvgdqFxCapTC?=
 =?us-ascii?Q?FD4oCY4fKIvxf6IrgmYw47rOVQntPbY5BDgSz30qaW2jRMB5ADrfHwGODFpH?=
 =?us-ascii?Q?nL74vQHa7VPW8AMy9mii5anm3WfnRWoG77rCNR87OeWpLyk87JCu0LuGrwOS?=
 =?us-ascii?Q?ZkjIt1UwbRYwL2+tIhrK7SRmG/Q8yFmUxV3H9WKXdSVrc3ZkxUyTvKsnLNC9?=
 =?us-ascii?Q?33ioe4wGLSu4Uh+M0P77pGeqS2JGTCDa4UOEvduvi7+GcQ0GiJvXLLXDBI0t?=
 =?us-ascii?Q?pp+FSH2rnSsLwO/35fI68R65sN1TmM1kvcXzZijMYzvo7+RzfUmK9y2ACaC+?=
 =?us-ascii?Q?FLReDylbTj8wsUs33J3XsYDqP0MnDbSBM4te3z1alahqy4t0hUc1MCNZCbJi?=
 =?us-ascii?Q?CxtwYyfcz0Af4mnQYTR7qkvOwddWbVEgsfxoepiTZtSLKrP66C9Il+LAqErM?=
 =?us-ascii?Q?K2W/ovb79ath1Iko/vB+HfD4vnMfXz7ofzmEq2PqUwBi6tM9ANajhNz9204V?=
 =?us-ascii?Q?7NMV5kCdkV+ydoEhd1R9NwCTdp7qgH8+Skv8NYHMYXrONA1TcyfyHroX2iN3?=
 =?us-ascii?Q?v3zAwuXrIG3PVzC/Zh/13UlzCu/WnExP0PcCiSmkcbN8hlJZnflpvO7+d5lx?=
 =?us-ascii?Q?E1Q5sTPsQNEZIqAjkVUE0ryP6vg8feoyY9UCrGEkkEIpa0FNORngKTD3GLy8?=
 =?us-ascii?Q?NlZtfQQwskLtkP3uZrEDhID8behF/+iWFm5n307sqhqJtDg+nCrum5ki0R37?=
 =?us-ascii?Q?uMWPoFDlzkvUhXtFs8cJvVHnW8L5TlJoWjD663+Pao66hRv/hgkXoCF3u50A?=
 =?us-ascii?Q?p1Hhkp6HPVeL9yWRYwtnT+lqub+Up+I7R/sEQzFDWiIIxc1GE7YO0p39u3K6?=
 =?us-ascii?Q?w2q+3ga7H3dyblm3vDZ7ut8c+ujIHjt1YMXIExSHVybNJ9UN1tI17jRpn6lc?=
 =?us-ascii?Q?BPILD6MvTUhE+AKiwdWBBudzMulfrmF0YOYeyIHrCv/WtTUmNUrZp9eGysZ7?=
 =?us-ascii?Q?4eI5Ct0EFCoDm3vJX93/zdcLvNzpFJll1KEz+OJAHl1uTnjZKQsAfdA2tmmh?=
 =?us-ascii?Q?SxVBhFiz0WSdDVplGqdAlLFQq9stO7Dwl1wAtSY3BHRkVMtGR9Cdcfi/NoGQ?=
 =?us-ascii?Q?CMNqCJZDwRpz8pvDw754Zfc/gKlToPPGiRBWAiwqiruokf7X26UkSfWEUKWt?=
 =?us-ascii?Q?KIS5+3SaytPgSsNgoO68DxyLfFhX4PlgkGkpbSsGbjgSyw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A8wf2JmGgxXC6SrCfUkE7T5xeLZuSlIZGGxwdWmjPMPlmtBAtgUGm8QwSE2q?=
 =?us-ascii?Q?Y5vAOuTDwPiZzbxP9KIg7/beJ0DiCA5u07fcZgmDskTu/m9dyuQqS65jLZGC?=
 =?us-ascii?Q?nF9UyZQBgkfFwg30bb5zviD4IaXQL2WWR0ivvSzG/x7V3dYGqwA8deAInDre?=
 =?us-ascii?Q?S5Zw9sHV4ngjkhtZgoYnHdiyMhSA0ZSYb5IFle6/9VbyTR6ZD4QrG/6ttCb4?=
 =?us-ascii?Q?jhP6/QKnqwSk3DAI0zdAUdDQM9PR1zFr393IuGeSDpApjwlAwrKRMrYDn7gG?=
 =?us-ascii?Q?p1ZLhWz4EGonZGw8GnH+3xj+mZWUyRXqv2oDu7tMsJjcHcuZXKbIbrfaO5iS?=
 =?us-ascii?Q?04kqQEZ3I4L7R8pXYxPnJ6yPR5PtfffGDuVHgVn4/Jz420Rgv7opsjOw72ch?=
 =?us-ascii?Q?L3X3Rh3hyBXfo1l7jr0z6EUJSjAvtz/MnmGPNy0XcqVzjNBdaiBVo0yOxviL?=
 =?us-ascii?Q?aBp57+R+1lS6A2hxiE0PBuRY25NqrcaqwYV7qL8FD4rxULcAXX6i6zUi63Ie?=
 =?us-ascii?Q?a9K9ChEU4m9P8Kvwna1pxJkTSfQ6XUbwM0SMAHUBflpsX4WJqnOCE9WpvyVg?=
 =?us-ascii?Q?C5MqJXUGhN/j9mn2W3HaZr8q3UQ5DnLjn8M5a7l7MXHrdmMMI3UR8eDsso/B?=
 =?us-ascii?Q?JO51o47WQTmvzar4si8R2qCZDdvt1hg41C1NzCykcKLNaUEfgWn/3RqtW8au?=
 =?us-ascii?Q?9KEFmWG8gO7ugN3tYUZcCBmKlyljre8JdlfCGf+i/OzxUeukTn+/KXOIofjz?=
 =?us-ascii?Q?USZcVlCUcaNzxOSgTWpJkKIehE/Y9W3vbBy7FYSNWzT5uLkItrH3wA7HnXDp?=
 =?us-ascii?Q?FhhVRuerKOoD33LNFUGzMAWGeF/4W5BYh7S1/pRTqmcXGk/aifdA/CL+nh/8?=
 =?us-ascii?Q?6wcRtubQFuW+W6E2hGecO1e2dE36EHVRiCiPmNJH/WEaioVyS7E/TEoiFx+e?=
 =?us-ascii?Q?6DKMXMH7soalqom3pfQ/6nJGK9qubUkw4HiPR3Jv6/nKjINB/RDQ6SBI3Q6w?=
 =?us-ascii?Q?RQxAjoeS+roBNCqwIWWTNG1B9LBSYdVnVAMrA6QxLLUunlO2qoDcSMSMcS++?=
 =?us-ascii?Q?ljiWxWZ7vE08TGL4S6DY9LQNFjaJMWL7qv79260HRMZ/IIkUPYw9QdLc+qHj?=
 =?us-ascii?Q?f2VbaHLyQlp6qsLsdHnsfz5U7uPGH7z4+pvzDHzmiuW9E4qLzSwj1VXDJOVs?=
 =?us-ascii?Q?dBP0tWPZFobZNkz8J7d+SDYhJZl1RmMOTPj6Q6F3eZ+zbjxtwxzfPsHCICdn?=
 =?us-ascii?Q?7ppSTYDGbpw/RpeCcaRimj/u3FYl8MVqxZ+7g2XO+lMC/3WMxSs7veKh5adv?=
 =?us-ascii?Q?/SaDOyak1EILiuCddraSRVb7QkGc0Q2cE6ur8hGwzkE+GQEJzqs6AsGQw5Uy?=
 =?us-ascii?Q?qy3N8jytInP49AKW5zMbgefgoJuEeBm9eC/2wCXvZzHLVXJBEwOmn/Alq5G4?=
 =?us-ascii?Q?oJ/ZDSVIqU9udq+1qfwpCP3PsrvlCdN5s3KpEaGl6yuKfh24AXECTkEOZXpE?=
 =?us-ascii?Q?RORyqWclYU1ZI4+F1gKkqKsj1O2JZIl95+gNNML2RuBXRReWK1g4xrCSgoR2?=
 =?us-ascii?Q?fDihOsXFQW4/soBg9t2OeKAvpqkITNiDTb244/zWZhePvKXJ30TCWZBYnFbd?=
 =?us-ascii?Q?Cw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a3fc8806-23bc-499a-2f29-08dcafcea0d9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 13:01:57.8468 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hqxoi8kcGX7rJ+0YpnCYKhO9fsLJRAeQjbcbmDaa7qk9w438tI3LMHLx7Etb/QWEHteptBJaUKAIBpF2DVMY3XAlRK8xLtfW1O6ZaIz1yMs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4863
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

On Mon, Jul 29, 2024 at 03:15:26PM GMT, Ohad Sharabi wrote:
>The config query has entries per config type.
>
>In query_config(), an array is allocated using the last element of
>the query config to dictate the array length.
>
>Instead, a more robust approach would be to use the standard "number of
>elements" last element of an enum such that one wouldn't need to modify
>the ioctl each time another entry is added.
>
>v2:
> - modify `enum drm_xe_query_config_type` doc
>
>Signed-off-by: Ohad Sharabi <osharabi@habana.ai>
>---
> drivers/gpu/drm/xe/xe_query.c |  2 +-
> include/uapi/drm/xe_drm.h     | 58 ++++++++++++++++++++++-------------
> 2 files changed, 38 insertions(+), 22 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>index 73ef6e4c2dc9..aaa60ff764ee 100644
>--- a/drivers/gpu/drm/xe/xe_query.c
>+++ b/drivers/gpu/drm/xe/xe_query.c
>@@ -313,7 +313,7 @@ static int query_mem_regions(struct xe_device *xe,
>
> static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
> {
>-	const u32 num_params = DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY + 1;
>+	const u32 num_params = DRM_XE_QUERY_CONFIG_NUM_CONFIGS;
> 	size_t size =
> 		sizeof(struct drm_xe_query_config) + num_params * sizeof(u64);
> 	struct drm_xe_query_config __user *query_ptr =
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index 29425d7fdc77..9222563cddc3 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -378,6 +378,42 @@ struct drm_xe_query_mem_regions {
> 	struct drm_xe_mem_region mem_regions[];
> };
>
>+#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
>+
>+/**
>+ * enum drm_xe_query_config_type - Indices for the supported configs returned
>+ * in &drm_xe_query_config.info array
>+ */
>+enum drm_xe_query_config_type {
>+	/**
>+	 * @DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID: Device ID (lower 16 bits)
>+	 * and the device revision (next 8 bits).
>+	 */
>+	DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID,
>+	/**
>+	 * @DRM_XE_QUERY_CONFIG_FLAGS: Flags describing the device
>+	 * configuration, see list below.
>+	 *
>+	 *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM - Flag is set if the device
>+	 *      has usable VRAM
>+	 */
>+	DRM_XE_QUERY_CONFIG_FLAGS,
>+	/**
>+	 * @DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT: Minimal memory alignment
>+	 * required by this device, typically SZ_4K or SZ_64K.
>+	 */
>+	DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT,
>+	/** @DRM_XE_QUERY_CONFIG_VA_BITS: Maximum bits of a virtual address. */
>+	DRM_XE_QUERY_CONFIG_VA_BITS,
>+	/**
>+	 * @DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY: Value of the highest
>+	 * available exec queue priority.
>+	 */
>+	DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY,
>+	/** @DRM_XE_QUERY_CONFIG_NUM_CONFIGS: must be last. Number of configs */
>+	DRM_XE_QUERY_CONFIG_NUM_CONFIGS,

But then when we change from 5 to 6, we are changing the uapi.  It's
very possible that userspace was using that number and then when they
update the header the build breaks.

I believe that's why none of our enums contain a max/count/num element
at the end.

Lucas De Marchi

>+};
>+
> /**
>  * struct drm_xe_query_config - describe the device configuration
>  *
>@@ -385,33 +421,13 @@ struct drm_xe_query_mem_regions {
>  * is equal to DRM_XE_DEVICE_QUERY_CONFIG, then the reply uses
>  * struct drm_xe_query_config in .data.
>  *
>- * The index in @info can be:
>- *  - %DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID - Device ID (lower 16 bits)
>- *    and the device revision (next 8 bits)
>- *  - %DRM_XE_QUERY_CONFIG_FLAGS - Flags describing the device
>- *    configuration, see list below
>- *
>- *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM - Flag is set if the device
>- *      has usable VRAM
>- *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
>- *    required by this device, typically SZ_4K or SZ_64K
>- *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
>- *  - %DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY - Value of the highest
>- *    available exec queue priority
>+ * The index in @info are the entries in `enum drm_xe_query_config`
>  */
> struct drm_xe_query_config {
> 	/** @num_params: number of parameters returned in info */
> 	__u32 num_params;
>-
> 	/** @pad: MBZ */
> 	__u32 pad;
>-
>-#define DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
>-#define DRM_XE_QUERY_CONFIG_FLAGS			1
>-	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
>-#define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
>-#define DRM_XE_QUERY_CONFIG_VA_BITS			3
>-#define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
> 	/** @info: array of elements containing the config info */
> 	__u64 info[];
> };
>-- 
>2.34.1
>

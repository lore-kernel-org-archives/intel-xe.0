Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BEF3C282DE
	for <intel-xe@archiver.kernel.org>; Mon, 10 Mar 2025 13:31:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D76B10E466;
	Mon, 10 Mar 2025 13:31:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dHTUIbJ2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D182810E466
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Mar 2025 13:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741613476; x=1773149476;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=wD8GNhuLeCfs4zLDQtOiwVKAofpmTY99JQEFAqLHmJw=;
 b=dHTUIbJ28SGo8luEemYZq15CSZj9ADhXX63d0P4tSr1XGNpj/sD63Roj
 H2Emnjhceyu8tCvAK+RApsjcmin7IWrqeisTGQfvP3Gs52SX74jCC8T3R
 TRuy2UlCGeWIZbqtIeT0ZmYaf9PgNMI6QVLsQTjf9QgFKi98gGRTjhw+n
 0q9zlYDqatYiWifV7WjhItYMwuFe6evufO501M+ran+fzoo2zraIkX4kq
 7udH9rGTA+D0ftFtVSN9HBq9OF9s2HLttDTRKXqU8g760z/ChXnEpG8Lm
 wvll11xrCLFd1zKoBWypQV/dqtWdaWR/SkQpMQJntzjJnkNWftXT9wy3g w==;
X-CSE-ConnectionGUID: IjHRYnW8T8OTzL7a9CbQ0w==
X-CSE-MsgGUID: DkfhFDynTEm7dooxk46q5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="42518011"
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="42518011"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 06:31:16 -0700
X-CSE-ConnectionGUID: /SxNVkWPTlqfR012Yd1rjw==
X-CSE-MsgGUID: oO4GOyaMTeyFLg0rce6+Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="150942058"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 06:31:15 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 10 Mar 2025 06:31:14 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 10 Mar 2025 06:31:14 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Mar 2025 06:31:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=itz6fTsPrBTE0VfndNXBq9xJSX+L4p+PjbEKxr3wcy4SyhhBz4iz9crysaohgZqMstILyKBJfyNNoXlIrqoKPFMtDQUpW7JDeO5IfsVQzewH0KHDYMbkt5Z1zK7pe4omWF1CJN309UdZdCTxok/PzFjF04mrUewDMcoVP7dIqAcGKWGP7MJc64OTGyOF9wBTMtqlGz0Jrcm3nsZGnYKWZt0SsoHXpKBRDl1tD/0+IN9G0ZsW60HWrlfq8dKerEPLm3qy31k4M/tD658NwqagobRpashXcQYX6cVZNVb100FcXNObZL7EZWUW2eiQr6Tc7KoLLH8OfDAQqp1LJB/ynQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2/FEv4WlcQ9xjY38xDfAKzG2RfDg9BMgSfrv1Oratqg=;
 b=Rl5U3qsIXjZ4gWXeeFUoyL8wV0VuOWhKbO8y8ybg6Z7MObcrQo7cr0CAvFefVwsZcv2G3cdiN/siyH3XR1Ol5nka4eykUyP0sTkG6A4YifAeT8m10wbWoiOzNdYcMJA4o35gr2T+drG0NF2SvRoA5Ly8urtmrt2YJm8a7fohcDkNZ7I5JLriHQkKA+cWt8qNUj4Ta1yQwty0JXnPZNU+yfxeabCEEGOz1OG3Jcltm+lwSShyxqd4cwyXfh2jRkHfNK+6rt7KHCeUz9Y/hVkigUa1OIiwbCPAeq1YtoCp+dMcOcsMgV4ESMucEEJf7IyCjUSzbDVpBpbTfYFr5nx35g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA3PR11MB8073.namprd11.prod.outlook.com (2603:10b6:806:301::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Mon, 10 Mar
 2025 13:31:12 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 13:31:11 +0000
Date: Mon, 10 Mar 2025 08:31:08 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <matthew.d.roper@intel.com>
Subject: Re: [PATCH 1/2] RFC drm/xe: Add configfs to enable survivability mode
Message-ID: <xgmworhkqvbo3gr6toa54occ7tanxjimgyx43pzoojf3li4wxf@7imyzpy5vurl>
References: <20250307142446.1790715-1-riana.tauro@intel.com>
 <20250307142446.1790715-2-riana.tauro@intel.com>
 <txoeuk2zlt4gotrzltt3cjtzf2u4ebsjtjicvtsa4a4iz5o5eo@oqgl43byhdoe>
 <bb979148-ec3d-43c8-b73f-e22476f9a809@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bb979148-ec3d-43c8-b73f-e22476f9a809@intel.com>
X-ClientProxiedBy: MW4PR03CA0345.namprd03.prod.outlook.com
 (2603:10b6:303:dc::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA3PR11MB8073:EE_
X-MS-Office365-Filtering-Correlation-Id: 13b459ed-0d60-49eb-ab10-08dd5fd7d2cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?/NZrwUZjj6+70S18To45G13W9xr4adlzpNyKUH9wZhyKciW/w+FB9n6XJA?=
 =?iso-8859-1?Q?/p+D3uyjV5MtmB2rCAQQiQyr6ZA1yA3cpeWEbHmto+ZPz/x3GAUvV9BlQv?=
 =?iso-8859-1?Q?j9QFjj4KyXGH6d4jdN6j04Ln0BeA/nQXE6LkMMyzTGp85E8UzcanD4hrUN?=
 =?iso-8859-1?Q?xbgvCyKiD2aIQJCEKG/zYANVZCaev3EoTZUpDoK0hbu2M/Z3FyqrhwT3Xy?=
 =?iso-8859-1?Q?q9V0mRe2vumyCOy9A4Edtpcgar6/9k7nA5wY9ydcwZBAwW3asOPdG9tqXb?=
 =?iso-8859-1?Q?nkabdJQxPAFEkAsdju/WPAsf+N88pK0Gh74zi6hzjNnBfNOlaf7kAz51Tu?=
 =?iso-8859-1?Q?I6WNwcdq6oLrNO+al2CP1o8w9c7iMe41NHu9e8O7hu7xfp6J8MA1RF5wy0?=
 =?iso-8859-1?Q?x/AWB4QtU/G6zEWOQim6waIy0k9FEMgDuJ7yqkSpmashWvO0ODhfx5f9RV?=
 =?iso-8859-1?Q?JVutgjaiP8g7m4oLEfoM6z/0o0Mkfxx3nKLVHzDL2552nbitOmIX/FAIHA?=
 =?iso-8859-1?Q?dj9mPaGqRwAuEn5BpXLStPUob09QsnEk3+Szx7R5gXKOxSVG1ictQbuiwx?=
 =?iso-8859-1?Q?dVW5r5+6rAue4UOYDJT5v+xVODdNaoaDgqBm9Ovo7KgDFVgTXfpCZskLXz?=
 =?iso-8859-1?Q?iCOgLauy3VZxM97E2d+JjTrd+5G5/oiC0487MLUslHL0i+Drn1IKLOaWnI?=
 =?iso-8859-1?Q?iTJOTUfBvZPxfL2r4Jiklq1MPD4C2dI8vKqQ/dWwtc0bR+2Zj2180RoT+f?=
 =?iso-8859-1?Q?Vv2CavhUxu/onhon3rxVlLq6mydeWoovfmakoX8dU5m6fsP1WsS1b0VrQT?=
 =?iso-8859-1?Q?NImQluidjwx70nWeQMvKOnPfVvuKYdFr/R0BpFhDvgFZUzd3oQIfWpYoIk?=
 =?iso-8859-1?Q?mi3bR3QtNaCr3Ylk7Ak/CAltXQbvRTzu00LmmGmS0VN0UuTfuUTN1xPyfX?=
 =?iso-8859-1?Q?7fWU6x2Hrdj0iQLt+b/bXDdFzdhG30iBRSs4gaFMD0FKY+4N09ugALyyNW?=
 =?iso-8859-1?Q?Co7ZlLheczJ3jm+hif7dPQULYQ7i+Qt2p/M6BFG4vaNZDDzpSwLu1yvPmS?=
 =?iso-8859-1?Q?RZGx4PzAs/GT/49Q8sRkXURivbaX1tWw6zWioxHN5r2kpDidCO7B5/BkLt?=
 =?iso-8859-1?Q?yNNPlmYviHEbgnzopdKMkBYZPI+2+qVGsIR4tnyk+SnqzuLxuLhiF/P/gm?=
 =?iso-8859-1?Q?ucmvlxIqhH9k32rOKb9K2fKKy4CD7FLnpJ6HA7ekQfB8f0VfPSCh1S1n50?=
 =?iso-8859-1?Q?WN1cB4UnLuzWnWYKEFwe2rW4z8uqNTJ6kDM0Di3XsXcwKsu/Kd3KiFMsg6?=
 =?iso-8859-1?Q?/afeiLI5wKZEWYyEwIRek16ViZWGPLPcchimgbyyae9uP/S+X1YhaxsuWo?=
 =?iso-8859-1?Q?nlnEnO8yEvX17iMQC4iH3jFTM9dkOxtg0SN2SHGbW/6wKrg427/2hdeGLh?=
 =?iso-8859-1?Q?gY94VF3FfeEi/sSl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?TK4pnUy+97S/P18Dey/vGWFGbH4Qa8FI+zFnp7BGZJosN4R7mTNyj1lqez?=
 =?iso-8859-1?Q?MihPlgFxlD9y365773CzqoRAGgt/VET8B3tdxnYWUBXAWcPX4gix5/Jw4L?=
 =?iso-8859-1?Q?zkaE5wXwsIwUnAuOKsShe9bPVJzfmmYMb/h9u7pRMkY9IsSdrBuUNxFLwV?=
 =?iso-8859-1?Q?vaQ7cTyZ5Ius8ypkiSy1q9KIbWEoF1YoeGUy+hnkT7WFEb802uuXwN6gl0?=
 =?iso-8859-1?Q?5xEuW5HJclSIkQ5oaABcJj+Ofn4zE2D723zXCwN43YzGwTtlAqAWQRSDmb?=
 =?iso-8859-1?Q?luSmktYMgBVOXzagniPe55gFJCRKGIEq/Aya1JXgPFdTTQXsi4wLJtnuUy?=
 =?iso-8859-1?Q?/Yj9DHqWE0b13deDVMHIYEKZY+Ag4MhjQEG+6MEZfAZBe8A8iMEwSKW0Cd?=
 =?iso-8859-1?Q?/s3eIB1gzAGzSxOb14I26NRiDFsWqxTpJI4p1ccdIXIk5w7OpQgL9Waagc?=
 =?iso-8859-1?Q?dEVsovuqTAwZuaGHIv9t+1gtb5p4hNFXc5wytBc/YXbxXd4I0rmh/d0gNM?=
 =?iso-8859-1?Q?7sbh727eUYVvW+SYZZQWOth+/D7vKth8KOZf/nkSnStjYzulz2UljRrKPC?=
 =?iso-8859-1?Q?OZQKQH8PiWPn/QMzlmp1kW9NplX3Atw3GFvocOVS9iWH4R7Q+CUMH6y3Up?=
 =?iso-8859-1?Q?0wuVIcZBJkd1MLv7xSStpYYzT5tTNTGiHRSkw/8jCQpGB1EBvHfWzUEZrI?=
 =?iso-8859-1?Q?Rn59iuJeSVFz7N6pn5MJIWvoBiEZGOmaZ0+s+7VQq2J5zFxaRAcuerkcrj?=
 =?iso-8859-1?Q?6uvEh3ZElLPttvHBJsJnXV6n0Jty7gjZHJcBxhfijtHNXV5et4c7DxltPB?=
 =?iso-8859-1?Q?7uKZiGYToCYtH1ZI2NWezCTO2+nMoEmNE+x/zoiuUH/K9f+2dW8XtlMedu?=
 =?iso-8859-1?Q?seu/wD5aUdh9jPnkTWf1he8zAchdArgLCiyLcZGHbF2p9gnSbxC+5p+GJI?=
 =?iso-8859-1?Q?1cZx9+8JloLliLyJ+qY2umML5NKu67KTVxjSC+pL8h9WF8hX0ElqgOK/Na?=
 =?iso-8859-1?Q?SVvBpMt1kg52hW9bsDgM6zAiXk2FeYgn5vv2DqhToqnevKGnXoCq8JPqxz?=
 =?iso-8859-1?Q?h5BB8ofYayuM7DlMs9okE7jqL/1E/jyEBgtCM1d2sfcu1y6+dXVKIOiVNJ?=
 =?iso-8859-1?Q?LX+4b55BnWqQ3KjIpCm7xrG3paEO+6eKOAwHLnKeFA+WjZUl6O5gcQKJlS?=
 =?iso-8859-1?Q?+6gLPXtKysfJChS1yd/ZixE8rQznHMd41FOPZSDyshf7BuPMJaI862CyFA?=
 =?iso-8859-1?Q?r3ofeTaqm5MgOZ1PRjQSyTVy+x/Ed4IlC6ONdGMPQfxS0jVlzg/yDDY4HV?=
 =?iso-8859-1?Q?1bkvHW/mKH+N96FuZ3wPWQI3zDHGY2biEVqvo/QYfE3Y16y4sOA3M1lihP?=
 =?iso-8859-1?Q?DTWaljju3JGtNG6RSDrTqQR4jtkEmY7tolRxB+831ynV3FusZSWm8QI5SU?=
 =?iso-8859-1?Q?9hBvVLkgNz6uqkucb0lcNaXeOlbxLfb/2Ozx5CUyrUo/DVGSMCnk0kzGTr?=
 =?iso-8859-1?Q?d76mxpS4q4wWlyUI5amUEHZHH+uoC561kEya8HjzbaFh6uYXix3IOhcPkk?=
 =?iso-8859-1?Q?m/xRdM9Plk6ZM8hxG+7lnm5A5eFY2DI0raanIpi6MXtyPm7BRnRDg1vOQB?=
 =?iso-8859-1?Q?dXhlKIWDi9jqoVW15eJoct2z5ZyR4S8my3Ugi4pp0ZUYrYSTnAjA7ptw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 13b459ed-0d60-49eb-ab10-08dd5fd7d2cd
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 13:31:11.8415 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mo0pTuAyh7YTvMacKD7TxG8N3mNlNgsBAUM4dV/NS452MS3fqul27VVNMrm2L1ui4D3vVr8UzSYbrCJqbkMlrdTEscuMnE80XDXQ92jT/9E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8073
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

On Mon, Mar 10, 2025 at 11:01:50AM +0530, Riana Tauro wrote:
>Hi Lucas
>
>On 3/7/2025 8:46 PM, Lucas De Marchi wrote:
>>On Fri, Mar 07, 2025 at 07:54:44PM +0530, Riana Tauro wrote:
>>>Registers a configfs subsystem called 'xe' to userspace. The user can
>>>use this to modify exposed attributes.
>>>
>>>Add survivability mode attribute (config/xe/survivability_mode) to the
>>>subsystem to allow the user to specify the card that should enter
>>>survivability mode.
>>>
>>>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>---
>>>drivers/gpu/drm/xe/Makefile      |  1 +
>>>drivers/gpu/drm/xe/xe_configfs.c | 95 ++++++++++++++++++++++++++++++++
>>>drivers/gpu/drm/xe/xe_configfs.h | 12 ++++
>>>drivers/gpu/drm/xe/xe_module.c   |  5 ++
>>>drivers/gpu/drm/xe/xe_module.h   |  1 +
>>>5 files changed, 114 insertions(+)
>>>create mode 100644 drivers/gpu/drm/xe/xe_configfs.c
>>>create mode 100644 drivers/gpu/drm/xe/xe_configfs.h
>>>
>>>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>>index 9699b08585f7..3f8c87292cee 100644
>>>--- a/drivers/gpu/drm/xe/Makefile
>>>+++ b/drivers/gpu/drm/xe/Makefile
>>>@@ -28,6 +28,7 @@ $(obj)/generated/%_wa_oob.c $(obj)/generated/ 
>>>%_wa_oob.h: $(obj)/xe_gen_wa_oob \
>>>xe-y += xe_bb.o \
>>>    xe_bo.o \
>>>    xe_bo_evict.o \
>>>+    xe_configfs.o \
>>>    xe_devcoredump.o \
>>>    xe_device.o \
>>>    xe_device_sysfs.o \
>>>diff --git a/drivers/gpu/drm/xe/xe_configfs.c 
>>>b/drivers/gpu/drm/xe/ xe_configfs.c
>>>new file mode 100644
>>>index 000000000000..8c5f248e466d
>>>--- /dev/null
>>>+++ b/drivers/gpu/drm/xe/xe_configfs.c
>>>@@ -0,0 +1,95 @@
>>>+// SPDX-License-Identifier: MIT
>>>+/*
>>>+ * Copyright © 2025 Intel Corporation
>>>+ */
>>>+
>>>+#include <linux/configfs.h>
>>>+#include <linux/init.h>
>>>+#include <linux/module.h>
>>>+
>>>+#include "xe_configfs.h"
>>>+#include "xe_module.h"
>>>+
>>>+/**
>>>+ * DOC: Xe Configfs
>>>+ *
>>>+ * XE KMD registers a configfs subsystem called 'xe'to userspace 
>>>that allows users to modify
>>>+ * the exposed attributes.
>>>+ *
>>>+ * Attributes:
>>>+ *
>>>+ * config/xe/survivability_mode : Write only attribute that 
>>>allows user to specify the PCI address
>>>+ *                  of the card that has to enter survivability mode
>>
>>I think the desired interface is actually that the user mkdir the bdf in
>><configfs>/xe/. This populates the available config entries that the user
>>writes to.
>
>Initial thought was mkdir bdf, but since it was a single attribute and 
>after a offline discussion with Rodrigo, did a simpler version to get 
>comments on the RFC patch and if configfs is okay to use
>for survivability mode

I disagree on the conclusion as then you are moving away from how
configfs is commonly used and also making it harder to add new
attributes in a uniform way.

>
>For survivability mode, below procedure needs to be followed
>
>echo "0000:03:00.0" > /sys/bus/pci/drivers/xe/unbind
>add bdf for survivability mode
>echo "0000:03:00.0" > /sys/bus/pci/drivers/xe/bind
>
>After the device is removed directory has to be created, the bdf has
>to be checked if it belongs to xe driver and then attrs populated.
>Even i think mkdir is better in case other attrs have to be added in 
>future, but for unbind case the check of the driver might be tricky .

I think you are talking about the mkdir in the wrong place. It isn't
related to unbind at all. The sequence you mentioned is just because we
lazy and let pci auto probe the driver. Under the hood you are doing:

1) load the module
2) bind the driver
3) unbind the driver
4) bind the driver in survivability mode

The sequence we should actually have is:

1) load the module
2) bind the driver in survivability mode

You shouldn't create any directory when unbinding. It's the user who
should create it. When **binding** the driver we should check what are
the extra configuration available and adapt the probe according to that.

For that we have to disable pci driver autoprobe and tweak the
configfs settings:

1) echo 0 > /sys/bus/pci/drivers_autoprobe
    modprobe xe

2) mkdir /sys/kernel/config/xe/0000:03:00.0
    echo .... > /sys/kernel/kernel/config/xe/0000:03:00.0/...
    echo "0000:03:00.0" > /sys/bus/pci/drivers/xe/bind


Lucas De Marchi

>
>The attr is WO and any value can be written, only if the correct bdf 
>is added in the attr then it'll be used on probe to enter 
>survivability mode.The current patch only checks the format and does 
>not check if bdf belongs to xe.
>>
>>>+ */
>>>+
>>>+void xe_configfs_clear_survivability_mode(void)
>>>+{
>>>+    kfree(xe_modparam.survivability_mode);
>>>+    xe_modparam.survivability_mode = NULL;
>>>+}
>>>+
>>>+static ssize_t survivability_mode_store(struct config_item *item, 
>>>const char *page, size_t len)
>>
>>once you handle the mkdir mentioned above, this should probably be
>>a boolean attr like this:
>>
>>     drivers/nvme/target/configfs.c:CONFIGFS_ATTR(nvmet_, param_pi_enable);
>>
>>>+{
>>>+    char *survivability_mode;
>>>+    int ret;
>>>+    unsigned int domain, bus, slot, function;
>>>+
>>>+    ret = sscanf(page, "%04x:%02x:%02x.%x", &domain, &bus, &slot, 
>>>&function);
>>>+    if (ret != 4)
>>>+        return -EINVAL;
>>>+
>>>+    survivability_mode = kstrdup(page, GFP_KERNEL);
>>>+    if (!survivability_mode)
>>>+        return -ENOMEM;
>>>+
>>>+    xe_configfs_clear_survivability_mode();
>>>+    xe_modparam.survivability_mode = survivability_mode;
>>>+
>>>+    return len;
>>>+}
>>>+
>>>+CONFIGFS_ATTR_WO(, survivability_mode);
>>>+
>>>+static struct configfs_attribute *xe_configfs_attrs[] = {
>>>+    &attr_survivability_mode,
>>>+    NULL,
>>>+};
>>>+
>>>+static const struct config_item_type xe_config_type = {
>>>+    .ct_attrs    = xe_configfs_attrs,
>>>+    .ct_owner    = THIS_MODULE,
>>>+};
>>>+
>>>+static struct configfs_subsystem xe_config_subsys = {
>>>+    .su_group = {
>>>+        .cg_item = {
>>>+            .ci_namebuf = "xe",
>>>+            .ci_type = &xe_config_type,
>>>+        },
>>>+    },
>>>+};
>>>
>>
>>so... it seems you are missing a configfs_group_operations.make_group.
>>
>>>+int __init xe_configfs_init(void)
>>>+{
>>>+    int ret;
>>>+
>>>+    config_group_init(&xe_config_subsys.su_group);
>>>+    mutex_init(&xe_config_subsys.su_mutex);
>>
>>this mutex_init seems odd, but inline with other drivers
>yeah it is not used anywhere but the sample and other drivers also 
>initialize it
>>
>>>+    ret = configfs_register_subsystem(&xe_config_subsys);
>>>+    if (ret) {
>>>+        pr_err("Error %d while registering subsystem %s\n",
>>>+               ret, xe_config_subsys.su_group.cg_item.ci_namebuf);
>>>+        mutex_destroy(&xe_config_subsys.su_mutex);
>>>+        return ret;
>>>+    }
>>>+
>>>+    return 0;
>>>+}
>>>+
>>>+void __exit xe_configfs_exit(void)
>>>+{
>>>+    xe_configfs_clear_survivability_mode();
>>>+    configfs_unregister_subsystem(&xe_config_subsys);
>>>+    mutex_destroy(&xe_config_subsys.su_mutex);
>>>+}
>>>+
>>>diff --git a/drivers/gpu/drm/xe/xe_configfs.h 
>>>b/drivers/gpu/drm/xe/ xe_configfs.h
>>>new file mode 100644
>>>index 000000000000..491629a2ca53
>>>--- /dev/null
>>>+++ b/drivers/gpu/drm/xe/xe_configfs.h
>>>@@ -0,0 +1,12 @@
>>>+/* SPDX-License-Identifier: MIT */
>>>+/*
>>>+ * Copyright © 2025 Intel Corporation
>>>+ */
>>>+#ifndef _XE_CONFIGFS_H_
>>>+#define _XE_CONFIGFS_H_
>>>+
>>>+int xe_configfs_init(void);
>>>+void xe_configfs_exit(void);
>>>+void xe_configfs_clear_survivability_mode(void);
>>>+
>>>+#endif
>>>diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/ 
>>>xe_module.c
>>>index 475acdba2b55..15b3cf22193c 100644
>>>--- a/drivers/gpu/drm/xe/xe_module.c
>>>+++ b/drivers/gpu/drm/xe/xe_module.c
>>>@@ -11,6 +11,7 @@
>>>#include <drm/drm_module.h>
>>>
>>>#include "xe_drv.h"
>>>+#include "xe_configfs.h"
>>>#include "xe_hw_fence.h"
>>>#include "xe_pci.h"
>>>#include "xe_pm.h"
>>>@@ -91,6 +92,10 @@ static const struct init_funcs init_funcs[] = {
>>>    {
>>>        .init = xe_check_nomodeset,
>>>    },
>>>+    {
>>>+        .init = xe_configfs_init,
>>>+        .exit = xe_configfs_exit,
>>>+    },
>>>    {
>>>        .init = xe_hw_fence_module_init,
>>>        .exit = xe_hw_fence_module_exit,
>>>diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/ 
>>>xe_module.h
>>>index 84339e509c80..c238dbee6bc7 100644
>>>--- a/drivers/gpu/drm/xe/xe_module.h
>>>+++ b/drivers/gpu/drm/xe/xe_module.h
>>>@@ -24,6 +24,7 @@ struct xe_modparam {
>>>#endif
>>>    int wedged_mode;
>>>    u32 svm_notifier_size;
>>>+    char *survivability_mode;
>>
>>drop this.. We want a  config struct in the xe_device. It's actually
>>allocated by the mkdir in the configs and when we are probing, we should
>>find the config instace based on pdev and set the pointer xe->configfs
>>or something like that.
>
>Will add a new struct
>
>Thanks
>Riana
>>
>>thanks
>>Lucas De Marchi
>>
>>>};
>>>
>>>extern struct xe_modparam xe_modparam;
>>>-- 
>>>2.47.1
>>>
>

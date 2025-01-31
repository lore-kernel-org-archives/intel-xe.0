Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D4E6C0218F
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jan 2025 21:51:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B73910E211;
	Fri, 31 Jan 2025 21:51:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eMKVU7Zp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 378B010E211
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Jan 2025 21:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738360260; x=1769896260;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1Aa86UF5O8T0WeGYJDhhgvZwCC95EjpOEuLv7uYpZZU=;
 b=eMKVU7ZpqmOndjhhg2VKJdsolUE2dxOLUZZlX55kxJql3IOimhnFUzlX
 fivF/7Zciwh+6eQsHH31zLDPqhJdOaT+NpVxds3dRaftmdmJJrhnSJ+Y2
 ZyeAfV9OBa+E4Xn6zpcEPA7CFNNHPBDuVCd2UE/QvlcSF1bHy7A9ctUmL
 ncK07kNCzlvYerLCu9/EZyIkHkrwqLYEVLZdVoQKu2P57KowE1t04bwZL
 E12cj6wqmWWR9+1PQ8lEs6kLsFGwDBwwEhexcFxBKv6h+0LtwvCdKpnFq
 Z2afWaLgCiGQjkY6/kR7jQfwK4sbUxE+IExRVw3GBaCtngINuUEXc1BIh g==;
X-CSE-ConnectionGUID: uhzZjj+lSJ2VsyqBdvtCQQ==
X-CSE-MsgGUID: OgaTuOL3TrK8CT/36tpVEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="38826960"
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; d="scan'208";a="38826960"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 13:51:00 -0800
X-CSE-ConnectionGUID: Tsp/CE8YTfqVk3x22p0wWQ==
X-CSE-MsgGUID: Ng6ge8M6Qvm+mVFiU/1VxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; d="scan'208";a="109632026"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jan 2025 13:50:59 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 31 Jan 2025 13:50:59 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 31 Jan 2025 13:50:59 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 31 Jan 2025 13:50:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lQvV/eJmxonRu8/xCm4AmEMF0o/b+fG2b1usKgThTW3FXdOb11W0K3XRb5C/SlBNPGNpu8vl4/0umdBG1TzXFkslnr0uFIin3cdMvBi2QkBMz7+6ltIWIgpLgJexhULEed5G4DJEKp1NrLe4Pw7qgq+V+DzMAvwACvXyKkPsByswpP4BxKZINUgr81kX7A/sd/Mw3h4acNDmZrPgSQa7M+b+XaczpqVgHKPsX/V9rSMsbvjXVNYWAodk9LlCn+DNSxnFQuWlnza0dBLTO7BDT/gDDxsZjWb6mNdnK7miaQ8gtuOBnglC2RsMkdDwxkCUKarkvUJsYCoPY9hsrRF9Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U0aUj1F2gE9wLOvSFE8kvLKTDOPI01V3UfDwsP206Eg=;
 b=c1vLjsC2k6TwtPzqFdThxZ+6iobjxzz6qHH28GNKFxKpxyDwqDvymx6qokcIYRgx3To/1pWQARTjdnZdaKpHZflFEDo8wlmm0qsmULmL/Yqkv7WJ5ne+Srgls2ElHmqP+AUrVX0OKdyhOfDuPBwHIN2524RAH+bdzsvSe/PCtDgazVCtYHRefglEfAhJJcbAf4IPvi5cI72gY399AH6M7i7yTdX6zNRpXmeXM9orDprkQQASIFkkjFawDe5mkzJveUi03lff3LfQIMzj3KftUyG4WKwzYf5RUhqbjoIb1R1gAuUxe0Tl8I2nbvKzsmio8D0EK4HDk3cYJxE/iaxTJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by MN2PR11MB4743.namprd11.prod.outlook.com (2603:10b6:208:260::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Fri, 31 Jan
 2025 21:50:28 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2%7]) with mapi id 15.20.8398.018; Fri, 31 Jan 2025
 21:50:28 +0000
Date: Fri, 31 Jan 2025 13:50:26 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v8 4/7] drm/xe/eustall: Return -EIO error from read() if
 HW drops data
Message-ID: <Z51Fov7dt1mjtKK-@intel.com>
References: <cover.1736970203.git.harish.chegondi@intel.com>
 <9dc0f747ae215f9704fe1edec2e7007e19f8dd0b.1736970203.git.harish.chegondi@intel.com>
 <857c6cgb94.wl-ashutosh.dixit@intel.com>
 <8534h0fd15.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <8534h0fd15.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BYAPR07CA0061.namprd07.prod.outlook.com
 (2603:10b6:a03:60::38) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|MN2PR11MB4743:EE_
X-MS-Office365-Filtering-Correlation-Id: 81c35831-2484-46ce-8382-08dd424146ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TVh1em1iNlRRbWl1RWxqSmZUMzk4cmczM0tHaFZwbTZGSmhBS3lZZUpuUnRm?=
 =?utf-8?B?ekZUQzRlMjh4anF1TEY5TlJBQThYOVc3U1FOKzFLK0xCMXV0dGdDbG1WOWtF?=
 =?utf-8?B?M2JTQmJkNkp3ZnhNUXZsRUtVeXJTR0dIT25JWTFxdkNHamxjTzVlSzdkYWx2?=
 =?utf-8?B?azlNSFkycG9tUjlIQW1WOXBIa21vU3JTUXd4dHdlN3JXcFpuS1l3Z2xNWWE1?=
 =?utf-8?B?YUFsZlpXYTZUbU8xdnRiZERBWjNOWXpsdk9kOXlwcWl0cGNlMEF6WTJ0OXVV?=
 =?utf-8?B?dkxlTFpUaUJVeCsyL3d6OCtXNk9HRkpWY1pkY0dzOTBBRGxoVHdYR1hTbXVK?=
 =?utf-8?B?UFViakNzYVozY0lEd2N6eTNlWU02VHhsR2gyR04zVDRCcjE0YjUwUGhRWVBn?=
 =?utf-8?B?akQ3dVZCSVlWVFZjVkwyRUk3RW9wRkxUaU1kK282SWYrTXV1RFNnRU1KWnYz?=
 =?utf-8?B?QWRrNU50Wk9UYld3MTQ3R292d2JGN3VkNmx5Sk1GOGx5aS94OUtmSWpENWcw?=
 =?utf-8?B?Z1FCV1J4Wm1UdHBvTGdTSllIaGZtbFdrdlYzYUMreC9xdmtOVjlES04wdUdn?=
 =?utf-8?B?RFRuMk1yS3ZTSDV2eThxelZjUHlDc0dlcGFaMWdhdUZxdWxsR08ydWJGeUJR?=
 =?utf-8?B?dTJqZHVBVGJXMlVBNW40M2RPaFhoRm5nZWpFdndjM0xNTnpjczdNUzNGbFYy?=
 =?utf-8?B?dXdWenhXN3V2ckFobUVEMjdVMDAzdW9SRjBFS1pvdkJOYm1iN1FSNUZUeHB3?=
 =?utf-8?B?cFNiV3dZZFRFY1M2TlBBRDM4RjZHYzFNUytTR04xMGhLMGlHblZHZllSSGR6?=
 =?utf-8?B?bGNvYm9FMVVVaEVaNDNRWmxtMC9CQldUaDNQS0RKWm9FdUxXNk1BNmpncjVI?=
 =?utf-8?B?UzREWlVoV0pocTdhQ3U4SlhJM25YNGp5WDJFaFdhY1EwOXovVEMwOG1oZUJY?=
 =?utf-8?B?UXZES3FzY1FSRk1JUEpJa1MxQ3JpNitWaERmeHh3MVRoUzVOZExXUmh0LzQ5?=
 =?utf-8?B?V3pGcjRwZnhYRkJFVWRPcm9iaS9RdjgxWG5ZUTBYS0graHRZekZxOENUb1VQ?=
 =?utf-8?B?VlprL1RGdXQvdDc3dklMeUVRa3RTNE4wNFdnaTgvTkM3NFA5NndBQWRWNngv?=
 =?utf-8?B?WWVnenpJWUR3dFcveTRFeU1JeXZiYm1SZUVLZlRVYUlaN1hIMCt3U0tGN3ZT?=
 =?utf-8?B?L29sVC90THVIMFlyMVdNZ2xGV1k4SmVNVWVyVTdXVzU0OFhpNk9rWFZ3SWUx?=
 =?utf-8?B?NFlSWlg1TlN2cjQxaHZRWGMyNzJ6VVcrQVpjSVBtam5ZUEtTdkprR2Z6d3RO?=
 =?utf-8?B?VnpkM0NYazBTcGhvYU9mamZWZXduMUM0czdYUG84Mk5pM0d3dTVkNDFIeHo5?=
 =?utf-8?B?L1oyaTNuN2x4TWdKdXdOdURWK1Q2blducVVTSm9BT21zSU1HU2x4Q1M2LzNn?=
 =?utf-8?B?ZHcyekNpNWRwbU9NUE1BcnJkRnRSQzlzVUNOM2JxMFVUMjZnSk12SWRLaGV2?=
 =?utf-8?B?bU1VUGwxN29pZ3UyTEgrRkkzS1h5aW5qWFBuTmVKWlEzcGh4emlxVGxqRXgr?=
 =?utf-8?B?dmp1WklDVm56cE9mcE1IakdkVkttUHFHeSs4TjdzYVcrbE04NUxrVVVpaTdw?=
 =?utf-8?B?dFErTjhEMGZZaFlUUStuU2YyZFAxeks1dEFwWkgrd1lxSDBMNlpiR0FxSmRx?=
 =?utf-8?B?V203bWlQaFZYbWVNTERzeW41SjJtZU9oN1ZOYjFhbXYvS0pXekRCNE5zb1Zh?=
 =?utf-8?B?d0YzVmJOQUVSSGtWSlVlRCtZaFVqWnE1QWpLek9FcDFJcW9uYjdrV2Y1NE1D?=
 =?utf-8?B?NXpGZWV4aE1QTG0vaVZvOXE4eXV5L3ZDdEg2d2w2TWJ5SC9yd0ZZSm96OWp4?=
 =?utf-8?Q?AVexE7WcUSV4s?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWFMOG5uc1YxdGdkZDB2dUFmL0lSTWhHdTdsSHBLMVBQem1NQlo2c2FTaTJ5?=
 =?utf-8?B?TG5oVU1DRzcybTF1eittMXVGM1VrSTRXNHlhdnRwSE5LRlZhV0orTlQwVVZ1?=
 =?utf-8?B?OTFsMzlPNVk3Y2ViTFBPbHgwUVVjZHRXcUlOcFFyOURhanBwVjNiTFJ0T2ln?=
 =?utf-8?B?dTZ4N0llVW9UdjNRZDc2dDA1TE5LbkJveEtoQkJGd29OWnBQbW4wQmRyVXpF?=
 =?utf-8?B?RjVzRnFlU1NFVDUxK3RIRGJadDdFSkV0enliYWVQK0srUERCMUU1cjY1S1FY?=
 =?utf-8?B?UWg1RTUxNjlET3NyR3hvTldCbWc0akJzZnVtamlwMFZRQzlkZGV4akxsVk92?=
 =?utf-8?B?RjM3M3k4RGU5bnU4d01OWXd5UWVBUkZnQmFQU3hoSWZoUExuUlA4K0xMcC9w?=
 =?utf-8?B?MHJkT2dnemVDVGQ5VmNZWVArWE5id3VPRE1jWlZMZW9OUG9tbjB3NmZEVGYv?=
 =?utf-8?B?R1BvTkJpYnc4am1UTEhLQUJmemVlOWt1NTlpQXN2N1pqS01PcnJWRmVhZU5Y?=
 =?utf-8?B?ZVVxSC84UkxtZmdaNDVhSDFpT2VHajV6cy8xbXk5NTJSS0lyRmlKdExQamdw?=
 =?utf-8?B?aTFUQkR3S25haEs2S2M1Rm1ONkg2dkc5Nlh3K1JxN2s0R0tHR1FodWUvN3V0?=
 =?utf-8?B?ZjlNSU9IUmVOYSt6RDk1ejN2UktnTyt2TWxkbUpRUzVjQ0VHVFo5dGwwMWYv?=
 =?utf-8?B?NmNpLzQ5ZE1mTGJkWU12dmRmQ2pvM0YzdklJUkdYRU9aalppWHBkS0xNTzhh?=
 =?utf-8?B?U1Bydzk3aXQxQXpLcG9iTm8wTEVwNUFFa2ZLanRJa21PcXY2a0tYeGJkcWJO?=
 =?utf-8?B?dUR0aWdwZ2ZLcVE1bXAvaGxLZC9XSDdlQTIzcUdzclpJK3hIZUx2THEvdkxI?=
 =?utf-8?B?UlVPSE5GcWN2YTJOejNGbnVBV2hyVG5PVWFtSzd2dW03TkI1aFVpU1hnMC81?=
 =?utf-8?B?WEYzNHdhenFsY1psZGh3a1NXbjVqZkhPaWhJSDNQUCs2RjB3cE95eW9rY0V2?=
 =?utf-8?B?UTFBWVNLdzRoQm5EQytwUnFJVFhKSzJVSm1VbWNtUUpPQ25lSkU0blBiNVBU?=
 =?utf-8?B?QnVhMm11YkZRRkRnRlpFTlpleVJHa0VsSnRubUNtYjhsZnZNcTE0Wnk1T1ZJ?=
 =?utf-8?B?ZllZVUFyaG15ZHphUUF5eDU0SHhEalhPR3FkVzVVUnJ5UlhMWjJTakplblZY?=
 =?utf-8?B?WmtXS2xyZlJRdnpWM1dtbC8zY1BzTVVEVzRRYnJVZU11TktQdFpITWUycEp0?=
 =?utf-8?B?OUU1ZkNLeTJPQzhMSnluL2RlUmF0T2hBb21IQWpEZGRNOWV6N1ZKWHZsR2lO?=
 =?utf-8?B?dlA3ajBXcC84clY0OEZEeEJxbnM5bWlpYzJPN2FtRlRwd2xBYk5CMC9wMHB4?=
 =?utf-8?B?ajNVaHRJK01FYlcwMDdha202TGk5bDFCS3JCQjMrV09MSUhncnpwN21WM1lI?=
 =?utf-8?B?ZFRXNmZ5RTNSWnFqczV0OFNtVTBFRlJ1RkNDam5Oa1RoSmxxeDRyK3BoSUJi?=
 =?utf-8?B?bERSS3MrZ0FHRzNBbVFoQ0FuVEh4aHJoSGJmb0RmcnZuZkRNVENlc1MvTWNV?=
 =?utf-8?B?akQwU0NPQVB2enIyNnJOWWc5UjdFTkR3SzN1VmEyYk14Z3lIVHZQK1hGaUhX?=
 =?utf-8?B?Z1ljV1JqYXpMOUlzbWJRaE9wYlJHblVMd2FwamMvT1h0Yi9mTkRSNVUzQ01l?=
 =?utf-8?B?V0o5bGx2NjNvT01XS0hHK0JxQ3pnc3VBSGw5anFYZUg4cEg5YWJ0cUNYblpY?=
 =?utf-8?B?aEwvUDFSL1hDYWRQc3kySHd0YVYvVmJ4QldCaitEUlBkSE1ZMjI3OTIrMWov?=
 =?utf-8?B?SXdVZlc0TC9ZL2tNMFhhTXJkZEFOV0Z6WVJDRENWMWpmRW1NNnB4TzZ3NzZu?=
 =?utf-8?B?b2ZjYUJGTnQ0V01qSWM4ckswZUVkdjZ2OWlLMmdNSU8yaUhLUXNXVmpORldv?=
 =?utf-8?B?U0RadVBPdVRoYThTTS90OFFDUkdlV1R6bzc1aWlVL3RuZVFDWDhTOGRYMFp6?=
 =?utf-8?B?ZlY4RVhUaHltL2NSRjZmTmY1Sm5UQnpKT0dwM2VqL3VLY3hmS1JVZEZudDlt?=
 =?utf-8?B?ci9nUzk4SGk2S05vS0tqZzBvaTdJaFUzTFdoVHhMbUR5RVdPWUlRQlUvMWFh?=
 =?utf-8?B?U2NKbTQ2UEtQRVZPSGhuK1RGdWVOUnVIUnlxbEtSN0EzcjQwY3NtY2NYUFVB?=
 =?utf-8?B?aUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81c35831-2484-46ce-8382-08dd424146ca
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 21:50:28.5789 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CusU3d+mzvSsrgeRgG0U6GTY+afG2vlBwywyb8LWDEvS53ve64iDbhuYI2WBtiTjaFalN5UhV485w8baHeKBMXS0kitaSXYccdvRk2ZHm8k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4743
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

On Thu, Jan 30, 2025 at 09:05:10AM -0800, Dixit, Ashutosh wrote:
> On Wed, 29 Jan 2025 20:45:59 -0800, Dixit, Ashutosh wrote:
> >
> > On Wed, 15 Jan 2025 12:02:10 -0800, Harish Chegondi wrote:
> > >
> > > If the user space doesn't read the EU stall data fast enough,
> > > it is possible that the EU stall data buffer can get filled,
> > > and if the hardware wants to write more data, it simply drops
> > > data due to unavailable buffer space. In that case, hardware
> > > sets a bit in a register. If the driver detects data drop,
> > > the driver read() returns -EIO error to let the user space
> > > know that HW has dropped data. The -EIO error is returned
> > > even if there is EU stall data in the buffer. A subsequent
> > > read by the user space returns the remaining EU stall data.
> >
> > As I mentioned earlier, entire dropped packet handling should be in this
> > patch, so we can see the entire logic around this. So data_drop struct
> > should be defined in this patch.
> >
> > >
> > > Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_eu_stall.c | 12 ++++++++++++
> > >  drivers/gpu/drm/xe/xe_eu_stall.h |  1 +
> > >  2 files changed, 13 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
> > > index c388d733b857..437782f8433c 100644
> > > --- a/drivers/gpu/drm/xe/xe_eu_stall.c
> > > +++ b/drivers/gpu/drm/xe/xe_eu_stall.c
> > > @@ -472,6 +472,7 @@ xe_eu_stall_stream_read_locked(struct xe_eu_stall_data_stream *stream,
> > >   * before calling read().
> > >   *
> > >   * Returns: The number of bytes copied or a negative error code on failure.
> > > + *	    -EIO if HW drops any EU stall data when the buffer is full.
> > >   */
> > >  static ssize_t xe_eu_stall_stream_read(struct file *file, char __user *buf,
> > >				       size_t count, loff_t *ppos)
> > > @@ -485,6 +486,16 @@ static ssize_t xe_eu_stall_stream_read(struct file *file, char __user *buf,
> > >		return -EINVAL;
> > >	}
> > >
> > > +	if (bitmap_weight(stream->data_drop.mask, XE_MAX_DSS_FUSE_BITS)) {
> >
> > Since data_drop.mask is being touched elsewhere under xecore_buf->lock,
> > here also it should be accessed under the same lock. So this returning -EIO
> > should probably be moved into xe_eu_stall_stream_read_locked?
> >
> > > +		if (!stream->data_drop.reported_to_user) {
> > > +			stream->data_drop.reported_to_user = true;
> > > +			xe_gt_dbg(gt, "EU stall data dropped in XeCores: %*pb\n",
> > > +				  XE_MAX_DSS_FUSE_BITS, stream->data_drop.mask);
> > > +			return -EIO;
> > > +		}
> > > +		stream->data_drop.reported_to_user = false;
> >
> > I don't think this logic is correct. We should set this to false only after
> > we have cleared all set bits (e.g. only after bitmap_weight) otherwise we
> > might keep returning -EIO multiple times?
> >
> > If HW continues to drop data and keep setting the line, while we are
> > resetting the bit, it is possible bitmap_weight might never become 0. I
> > think that is ok, we have returned -EIO at least once to indicate to
> > userspace that it is not reading data fast enough and HW is dropping data.
> >
> > Or we may return -EIO multiple times as is happening here, where
> > reported_to_user is set to 0 before all bits might have been cleared. So
> > what is happening here might be ok too.
> >
> > To see this clearly and evaluate it is why I am saying move all of this
> > data drop handling and -EIO return into this one patch. So we can decide
> > which approach to take: return -EIO just once or return multiple times.
> >
> > We can also maybe defer this patch and merge the other stuff first if it's
> > a separate patch.
> >
> > So maybe this is ok, maybe not, anyway something to think about.
> 
> Because we don't want to complicate this, here's another simple idea:
> 
> In eu_stall_data_buf_check(), when we see the drop bit set for a particular
> dss, move the read pointer (effectively discarding any data from that dss)
> and also clear_dropped_eviction_line_bit(), but the dss with dropped data
> is saved off in data_drop.mask. So basically we are clearing and saving the
> error condition. Discarding data from that dss might be ok, since HW has
> already dropped data.

I don't think driver dropping data is a good idea.
> 
> Now in the next read_locked, if any data_drop.mask bit is set, return -EIO
> and clear data_drop.mask. This way we don't need
> data_drop.reported_to_user. So this way the entire situation is cleared and
> handled once we have returned -EIO.
> 
> If more data gets dropped before the next read, same process repeats and
> -EIO will be returned again.
> 
> >
> > > +	}
> > > +
> > >	if (!(file->f_flags & O_NONBLOCK)) {
> > >		do {
> > >			if (!stream->pollin) {
> > > @@ -680,6 +691,7 @@ static int xe_eu_stall_stream_init(struct xe_eu_stall_data_stream *stream,
> > >	if (!stream->xecore_buf)
> > >		return -ENOMEM;
> > >
> > > +	stream->data_drop.reported_to_user = false;
> > >	bitmap_zero(stream->data_drop.mask, XE_MAX_DSS_FUSE_BITS);
> >
> > Stream is kzalloc'd, why do you need to init these?
> >
> > >
> > >	xe_pm_runtime_get(gt_to_xe(gt));
> > > diff --git a/drivers/gpu/drm/xe/xe_eu_stall.h b/drivers/gpu/drm/xe/xe_eu_stall.h
> > > index f97c8bf8e852..8bc44e9e98af 100644
> > > --- a/drivers/gpu/drm/xe/xe_eu_stall.h
> > > +++ b/drivers/gpu/drm/xe/xe_eu_stall.h
> > > @@ -31,6 +31,7 @@ struct xe_eu_stall_data_stream {
> > >	struct xe_bo *bo;
> > >	struct per_xecore_buf *xecore_buf;
> > >	struct {
> > > +		bool reported_to_user;
> > >		xe_dss_mask_t mask;
> > >	} data_drop;
> > >	struct hrtimer poll_check_timer;
> > > --
> > > 2.47.1
> > >

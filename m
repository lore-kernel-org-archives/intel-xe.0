Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46792CF9C69
	for <intel-xe@archiver.kernel.org>; Mon, 23 Sep 2024 10:35:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1342C10E3D6;
	Mon, 23 Sep 2024 10:35:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EVTdOJOi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D032310E3D6
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Sep 2024 10:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727087709; x=1758623709;
 h=date:from:to:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=jZEeFwYrhK7fi7l2poCDG58E8864FDoqLyEgfOGsicA=;
 b=EVTdOJOiTlRxL4dEALfWPN8QXONmi2VwekOMXcSIVaEIxyfU7LdNtLbz
 lFiufwh/GHgVY8KP+47XM7NncOSawNm7u4FlFOUw+935nNALgNl67q2Pk
 g8cjH0vdMXE2tPbdoomKWiktMuYYV2GRcq7qcrQAX8OIeLisCgIKhJ0JS
 q+lFLFihK5ixNldUFC6/uKV6uXLu6uM5GHBselYef5wjJ577UA273+Moz
 VzGDb5cdZL/SSJDe66aZklvSaUJ8P29vcs6lMnygQQ0riT/raqLCRbOIt
 v2r2cVrMDI5JFP9F6ZMyabp9caPR4RZzs+oZbiWJvQY9Wp1Y8yfBPAGPr A==;
X-CSE-ConnectionGUID: 7n9C9NEoToG1+nETxf3p0g==
X-CSE-MsgGUID: P4w+rg+hQVePvMCzaD2axw==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="25904994"
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="25904994"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 03:35:08 -0700
X-CSE-ConnectionGUID: ey66zTt/RuKFRA1qkHzLrA==
X-CSE-MsgGUID: Uk/XviNAQ+mYu4OOBE/UQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="70610370"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Sep 2024 03:35:06 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 23 Sep 2024 03:35:05 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 23 Sep 2024 03:35:04 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 23 Sep 2024 03:35:04 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 23 Sep 2024 03:35:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J4W7QtljN0J2bx1oNw0VtHNxFss4aUI7CAfeaPLxVswxqEtellot38upKeTY4j2ikrfPagn0UR2cUNWz8O5QvO3+h2dlTXW+o+9kdsTY7XJu+oTwpPVJl2OFOn/zPsU1xeCAoKi/CXZAYnpawvxDEJaB+FaCvWt6WnpaH70Nw+DmpKFS+X1ySbhZUsdZNsMOpjyHALGxj7fz2BZfmE8BFQWfB4km890kixq1b3J890k8GpAHT9hVmdL893Nw0ogr/SK8DDJB05FVuKXy1GwbzgH5dbIw6AMWtFhFTH3EjB9oTSQH04AeowU+dfO+rcY79JX+KpLgpIC+xVS5gfdb4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a5uv+PB/yqVUcQc+JkFh9YNCSRka0sFQDA7M4Wapn28=;
 b=qF06VizpebT87wDDeAgiPLnZXVRyJUFzjMQ0y5k3DClOlG40Jso4O51a27bhwiwu9TOv27rctMa4ph9lt288j5driePLRFqLZgZ5RAw/rD6PexhvkWuVSF+ItrRW1HofS+r8gKQACntqN+oVhHyYdkFBOOy7IaV1vUP0QNbwRnI9tjL9H9yKHpBFRozkCzHR+cR/+iHUMik6hJir+CHeF6hEOJLKmPsUAZB7LX+Kett8YtYla5dvnBUNoYnwkgeZiiZa8b88EaK4ksjxxqb8ITxWgBbFieHrGIktWLE4/UcKZoYsCGCqg9c1V0xNMB+94W+9MjW9Mm15fg9YHa+DaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SN7PR11MB6800.namprd11.prod.outlook.com (2603:10b6:806:260::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Mon, 23 Sep
 2024 10:35:01 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%3]) with mapi id 15.20.7982.022; Mon, 23 Sep 2024
 10:35:01 +0000
Date: Mon, 23 Sep 2024 12:34:48 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIENJLktVbml0OiBmYWlsdXJl?=
 =?utf-8?Q?_for_drm=2Fxe=3A_Use_faul?= =?utf-8?Q?t?= injection infrastructure
 to find issues at probe time (rev2)
Message-ID: <ZvFESJTCV91MrTfg@fdugast-desk>
References: <20240920131834.3368299-1-francois.dugast@intel.com>
 <172684033706.1051009.16907296846862410987@2413ebb6fbb6>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <172684033706.1051009.16907296846862410987@2413ebb6fbb6>
Organization: Intel Corporation
X-ClientProxiedBy: ZR2P278CA0035.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:47::20) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SN7PR11MB6800:EE_
X-MS-Office365-Filtering-Correlation-Id: 219526c2-824c-4aa2-4b60-08dcdbbb60b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eWUxRExLSWFKeFQ4SHpmQjcvZ1JuakRuRFBsaWJlS1F4Z0lsQWgxUEE4dkI2?=
 =?utf-8?B?a0Y2UFNNdDc1ZTdHbU81TGlDeks1d0N5V0hTV3dyQmlxU2pLNGR0S3VSbitC?=
 =?utf-8?B?Z2NBY0ZvaFRIVzlGNHZ3MytYeDdSSFBhYVIzcm9lZ0hIL1FWVWFhSVdpZUhC?=
 =?utf-8?B?RFI0bDlzbnRMQVFoWWJVWDdyd2dkWjZNR1dqSFh1elFXS3R4YTlicHYxOEQ3?=
 =?utf-8?B?c3ZmQTFhaTlmaldvTzAxRFRjYWtEZnZzcm5hSVhjRXJLMTkxS291RGJRNVlH?=
 =?utf-8?B?NC9lNVBWdGg0RUZHOTREZDF4NldlVm9DNE9pZ0tRSTVGWkFHMkQvS3NYMjhq?=
 =?utf-8?B?OFZvdG1XZk5SSld0aVRxWWJQN216Vm5iTHZxRGdzZHY0elg3eGJIWjJXUHhZ?=
 =?utf-8?B?RVBtYm95NDBrV3Q5VkZ5eHZsb2NMUWRQUURlME9BeVkrUzBrVFlXd04rMmkz?=
 =?utf-8?B?aTV6WlEyb0ZuVkprT3ZTd1VOR3FaeFdLYktweU5aTHhGejltblZDOWZod2tL?=
 =?utf-8?B?T0VHZmF3YlZlOGErRGo2T00yd2dsZFBra1RHdXpiUFZDMytUWVU3WVZBRDF1?=
 =?utf-8?B?bWpLWjZQeUFzelJiTjBQYlBYL2NXS3lGUWNWa2dQcEpobzhtZmhDaTJ3ekdR?=
 =?utf-8?B?Rm0yaVY0UFFzQmwwTUNvTUtROVU5Nzh2T0dHUmw1dmJ5RDhuZXFKemhGREZI?=
 =?utf-8?B?V3BvVzNZSjlHYkFTUlBxbDNML0hrSytmYktPVDNvTDN0cVVSRG1GSWR0Nlow?=
 =?utf-8?B?a3RZbkZlTUllWWtQWG1FQzY3V2JBRmQxK0ZSdy9PclY3NmpBTUorc215TDU3?=
 =?utf-8?B?bFdwS2ZoMWpzQTFZbHdXZWpxY1gzUzNYTXhYRHNXS2NxdTBDQjFZM0paRzNN?=
 =?utf-8?B?SzhZZTFWWXRTNFpVU29VNXpncGR6ZjQycCt3eFJtVDZ2K25vb282N3Q2ZlZM?=
 =?utf-8?B?OTMzdGx0dmFCQ3hDU21uN2Z6R0Znc2M0RThuT1dKNzhvYk9CU1RQckJWOGhO?=
 =?utf-8?B?S1RCKzlHckxXSzI2clk5cDhpZDJ3N0ZydUN0N05zeW9VWisxMndTMUo3WC9J?=
 =?utf-8?B?aTJZbG1ySVFyWEphNmg4VXJxWGdXUitVZGcyVUpzV1VBNTFEYlMwZVhEbnpa?=
 =?utf-8?B?MG51VUQxVWFPcWVFano1S0M1TjBhZmFJNm9Pc1E0M1IwNnk1TUxNTmd2czBl?=
 =?utf-8?B?QTZudGEvMnkyeVQ1MzRJajd3ZTNDbHlSOURydzRDVTV1ZXoyMVVMalo0WTNR?=
 =?utf-8?B?YTRpbEtVakdvZFk0VGxrOUE1WjBYYjJpN3A4UDlSNmlTY1pmQjJ6UmhWOUFK?=
 =?utf-8?B?dGlFSjBhdFRHaDhBNXdlandXZEhrVzNYdjlLYk9paGVERW9ZdjJYNzJ3a3Qr?=
 =?utf-8?B?bTA4cmxYWU52SWtNWDhXWUwwa2xjTjhLdUI2Y1FPdXV1RHZCTmdNVkc5dENr?=
 =?utf-8?B?WGFMZytHc203SVpCNnZZa3JzTUdtcStkWC9TdVZjRm1oakViK2hxc0JtY2FO?=
 =?utf-8?B?VVNyZkt0M0p6UHZ6cmQvWDVWaXRYaTlaTndoOE5SMjZPVThoaGMyT2hTemp5?=
 =?utf-8?B?WFk1TDErWVc0N01TTTZDL2hjWnNydkV5YTUwK2hCYlFjUEs4bDRGUmt2ZzNi?=
 =?utf-8?Q?mNVYjMuqLGQ7FlQp6NXyEF/d/WbVbLxWSQhNJfL67+nw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0tlYTFSQkltRE5pR1dqcWZOc1BISW5KR2Q4ejNKTWpITmhqZjcxdTJDdllT?=
 =?utf-8?B?NU5MbnFlRWZUWmMzVjJtNjJZc1dmMHo3Szk5NEVya0U0cnIzLy9pM3JJZGh2?=
 =?utf-8?B?Q0hudXFiQytyb2hyQ3pPZml5VVY4NnZOZVovaDVlVVN0akQyaVl3OVpTR1RB?=
 =?utf-8?B?eHkybDJkZFNRbHdycjMvU2xPUzB2aldMYlB2b285cFAzQjB4MnBUYlVVbzRB?=
 =?utf-8?B?MzdPRjdaci9UYm1pRG83UGp5WU5SVURrMUFUWUxHY2xrcEYrNk9NakVHK1BR?=
 =?utf-8?B?VGFQYWtqUE9SdFRESWVmQmlwMEM0UHI5em81Qm1qYkhGQmt5endsRHVuazJh?=
 =?utf-8?B?d1dmRzAybDd6MS9jQzJWaHc0akp3bWRnb1RZQmpIc1l5Q1RXZ2MxRU9hNTd3?=
 =?utf-8?B?YTlDYnlHTFEraWNIMXFhb0lkemJNQ2E3dVVkeEJjdnlWQTlXbGtwUFJ5ZWl2?=
 =?utf-8?B?VlVrTWx5T2NvS0NOTlltOHRzZlFHN1dJanI3a0xzUlUyT0F2eTAzcFRtSzFG?=
 =?utf-8?B?MVIreU9jNHZxQWZWZ0Y1TUtQUVpCblViK0g2U3NLZUh0TUpoWnV0eXZDMTRj?=
 =?utf-8?B?WGVETnJRb0xhZmJaTXROemRMOFQrQzE2RXY1R1JMVjE2ZDRvMWs5eFg2a2VY?=
 =?utf-8?B?clBDWlVwTEFBMGFsMHdZaUZPQ1BKa25UQUFWUGFybnZ1cmtBM1N4dWZ2azFw?=
 =?utf-8?B?ZlRjMk5wcE1UVmRUVEdFSlp5Rks2K01rR3ZCTlNUYnJDTUJNcDNyM3grelRr?=
 =?utf-8?B?dm1LS0tlc0o3YzB4Myt0MjJSeGVrLy96bnlsTlRCYy90Mm1QZGltMlZLcUtY?=
 =?utf-8?B?SmVLekhUVEd2MU5nbXh6NXQyQllLaXBSMy8rWEplSExtVXplY3RucWh2QkJ0?=
 =?utf-8?B?M1V6enoxN1ZaL2RFYTZaLzlpcUJ3djB3V3JUL1JYdS9ML1RYb0QwRUhCTFVq?=
 =?utf-8?B?clUzVHR1Y1hxazBONFFZeEhOWVlMODRlOWZ0SUdkY0V6OXc4dFV5N0M0Nzc1?=
 =?utf-8?B?aHFTOGE5NWcvOVFrU1BxL3N2ZFcxOWxPSjR1Zk5KSUtydm4zaEhHNnZOMWNE?=
 =?utf-8?B?QWZBWlRFeVVRbU4xUHVCWnlaNlhmOC80T0tUcmdHVUlRZ0cvejZXTEhjaXBt?=
 =?utf-8?B?Q1REVjZ0MGwyblZFMnkzYVc2ajNvaDdKa3hhazcwVjRrL05lUXV6SjB3MVd5?=
 =?utf-8?B?enlsQW9Kd0dRbHUvMXB1cEd1Si9Pd3Zid3lNaWNRUjZGRUFKOEMxd2ZHNklG?=
 =?utf-8?B?RGgrN0pJVTlkQ3VQME9xcHIxTnNNYUR5WmNOeXJCS21WWWtibVA4RzVPT2xp?=
 =?utf-8?B?UEV5VGRrWGZqcnJFVzFJbndlTnFZQXloMVI5TS8rNlV4Mk4xZUdJcEZXdGpx?=
 =?utf-8?B?L3Jpd3g2RUg1bDFyV3EyN28xVVdRQ3hNME92b2REazg4T1ZVYUlIeWl3Njlt?=
 =?utf-8?B?TUpEczVOQVVGcnZicnY4aWFYVXQvemVtV3gwUFZ3V3p5OXFhZGFMai9vbEVM?=
 =?utf-8?B?L2VQOUgzbERSVk95ZEJCWXkzT2N0bm4yQ2kyT3BHSWxBT3ZkTVZqckU0M3BW?=
 =?utf-8?B?NU1XOEpCVG4zYkFWeW5xanVxaDl1dFFqY2VXVVM3SGk1UEYvdGM0bFYwV3Er?=
 =?utf-8?B?UDFvQWZRYkR5K0RMS0FobDVOaGE5ZkFrMDFqbkJnSEV0V28wTDdqVVhYRmtX?=
 =?utf-8?B?OHJNY2hHVlZXdzMyTXByUG1zOHRiaWlNM2M2NlpDZlc3YWJ2QmRiSjJPVEx5?=
 =?utf-8?B?ZFBSM0xqSkx0NVZxWS9CQ2FSdWtkS1lGMFYyU2JFVmhkR0J2SEJMbldYNzJO?=
 =?utf-8?B?UWtjV1BrQXNPV0twZyszUmFpWmNnNzhnajNyYkFZTTdUeHlRTFg4cjJaT09U?=
 =?utf-8?B?YkVod0JTRnlHRGpacGoxVjNSSG9HWGswbnMrcG4wV3BJc2FtTXRJdWl4YTVz?=
 =?utf-8?B?L0VUSG90aGppdmdKQlZ5L1RHM2VBaCtpdEp0SU1sUTA2VDE5RzRmdk9MZkJX?=
 =?utf-8?B?VnBoSU5ZVTh4YW5uL2RKem9oWnFPODVjTWI1Y01KSGpDck5GUjRNOTNxRjU4?=
 =?utf-8?B?eDJ6RUhrOUp5ajAwNC9haGxERnFZTGk4dlhjMlZMNjY1ZmFRZ21QRTJYMGcr?=
 =?utf-8?B?cG1JaWF6OUpUdWIvRVVrd1pDUW9EQ1FuWHllMm52K2FWMHl4aHJVaU44SXJD?=
 =?utf-8?B?R3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 219526c2-824c-4aa2-4b60-08dcdbbb60b8
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2024 10:35:00.9627 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9lxTy9ClEbNv0glw4kdON1rGfB7uWCFONnpS/nWbsGv7EqJRSMthrwPxS2uV9nD0Ys+uI6Zzn2RlL0ngynEgEdR9a334lN0VxT8ynIuPSXM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6800
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

On Fri, Sep 20, 2024 at 01:52:17PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: Use fault injection infrastructure to find issues at probe time (rev2)
> URL   : https://patchwork.freedesktop.org/series/138654/
> State : failure
> 
> == Summary ==
> 
> + trap cleanup EXIT
> + /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
> ERROR:root:In file included from ../drivers/gpu/drm/xe/xe_guc_ads.c:8:
> ../include/linux/fault-inject.h:97:15: error: unknown type name ‘bool’
>    97 | static inline bool should_fail_alloc_page(gfp_t gfp_mask, unsigned int order)
>       |               ^~~~
> ../include/linux/fault-inject.h:97:43: error: unknown type name ‘gfp_t’
>    97 | static inline bool should_fail_alloc_page(gfp_t gfp_mask, unsigned int order)
>       |                                           ^~~~~
> ../include/linux/fault-inject.h:106:57: error: unknown type name ‘gfp_t’
>   106 | static inline int should_failslab(struct kmem_cache *s, gfp_t gfpflags)
>       |                                                         ^~~~~
> make[7]: *** [../scripts/Makefile.build:244: drivers/gpu/drm/xe/xe_guc_ads.o] Error 1

This build error occurs when CONFIG_FAULT_INJECTION=n due to missing inclusion
of linux/types.h in linux/fault-inject.h. It is solved with Jani's series:

https://lore.kernel.org/intel-xe/20240813121237.2382534-1-jani.nikula@intel.com/

Francois

> make[7]: *** Waiting for unfinished jobs....
> make[6]: *** [../scripts/Makefile.build:485: drivers/gpu/drm/xe] Error 2
> make[6]: *** Waiting for unfinished jobs....
> ../lib/iomap.c:156:5: warning: no previous prototype for ‘ioread64_lo_hi’ [-Wmissing-prototypes]
>   156 | u64 ioread64_lo_hi(const void __iomem *addr)
>       |     ^~~~~~~~~~~~~~
> ../lib/iomap.c:163:5: warning: no previous prototype for ‘ioread64_hi_lo’ [-Wmissing-prototypes]
>   163 | u64 ioread64_hi_lo(const void __iomem *addr)
>       |     ^~~~~~~~~~~~~~
> ../lib/iomap.c:170:5: warning: no previous prototype for ‘ioread64be_lo_hi’ [-Wmissing-prototypes]
>   170 | u64 ioread64be_lo_hi(const void __iomem *addr)
>       |     ^~~~~~~~~~~~~~~~
> ../lib/iomap.c:178:5: warning: no previous prototype for ‘ioread64be_hi_lo’ [-Wmissing-prototypes]
>   178 | u64 ioread64be_hi_lo(const void __iomem *addr)
>       |     ^~~~~~~~~~~~~~~~
> ../lib/iomap.c:264:6: warning: no previous prototype for ‘iowrite64_lo_hi’ [-Wmissing-prototypes]
>   264 | void iowrite64_lo_hi(u64 val, void __iomem *addr)
>       |      ^~~~~~~~~~~~~~~
> ../lib/iomap.c:272:6: warning: no previous prototype for ‘iowrite64_hi_lo’ [-Wmissing-prototypes]
>   272 | void iowrite64_hi_lo(u64 val, void __iomem *addr)
>       |      ^~~~~~~~~~~~~~~
> ../lib/iomap.c:280:6: warning: no previous prototype for ‘iowrite64be_lo_hi’ [-Wmissing-prototypes]
>   280 | void iowrite64be_lo_hi(u64 val, void __iomem *addr)
>       |      ^~~~~~~~~~~~~~~~~
> ../lib/iomap.c:288:6: warning: no previous prototype for ‘iowrite64be_hi_lo’ [-Wmissing-prototypes]
>   288 | void iowrite64be_hi_lo(u64 val, void __iomem *addr)
>       |      ^~~~~~~~~~~~~~~~~
> make[5]: *** [../scripts/Makefile.build:485: drivers/gpu/drm] Error 2
> make[4]: *** [../scripts/Makefile.build:485: drivers/gpu] Error 2
> make[3]: *** [../scripts/Makefile.build:485: drivers] Error 2
> make[3]: *** Waiting for unfinished jobs....
> make[2]: *** [/kernel/Makefile:1926: .] Error 2
> make[1]: *** [/kernel/Makefile:224: __sub-make] Error 2
> make: *** [Makefile:224: __sub-make] Error 2
> 
> [13:51:49] Configuring KUnit Kernel ...
> Generating .config ...
> Populating config with:
> $ make ARCH=um O=.kunit olddefconfig
> [13:51:53] Building KUnit Kernel ...
> Populating config with:
> $ make ARCH=um O=.kunit olddefconfig
> Building with:
> $ make ARCH=um O=.kunit --jobs=48
> + cleanup
> ++ stat -c %u:%g /kernel
> + chown -R 1003:1003 /kernel
> 
> 

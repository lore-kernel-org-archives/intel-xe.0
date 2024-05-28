Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 768BEC25B78
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 05:09:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B506110E980;
	Tue, 28 May 2024 05:09:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N9mLLLui";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7640010E57A
 for <intel-xe@lists.freedesktop.org>; Tue, 28 May 2024 05:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716872990; x=1748408990;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lkLm3ooO4+A9luy4li/59tkFElW98xh2TOnGUVn8yaE=;
 b=N9mLLLuiKmb1uv7HhJnpRZEg+LBUkzAIkWCBLpd+RmT655CmPhRxjj/0
 OLREi8QZo74mftTaUo1X/S5wxHAw3h4l7ZBFsukP3+zNxMIdlUD8MD7Il
 SZQWIj9jyArxvT8tZtoTswalsIz+RgcGhoL9tiqIzoziEFTOi/J5GYNdS
 MSMK5jXBPi4za+yCQ3lVuTLt9fH6+iejO2rQtFkF8VeiyQUBsYq+5s22+
 eWnd/3BP6d9IOdRJvaN7XeHILJviUeH0noo6iEzZyV4psZBryheAlf3/5
 VLsM+u+cKmdFfU2Aox1IbJ+nceMsbHKDXcOVgdizrYLdyBTw1ZBuxomqA A==;
X-CSE-ConnectionGUID: xPPQWwuZTgKNxtMvlCL2jQ==
X-CSE-MsgGUID: gOLot8xKTviBU+OnJj9zEQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13320882"
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; d="scan'208";a="13320882"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 22:09:49 -0700
X-CSE-ConnectionGUID: x5VjA8XMTsGR7duocpsalw==
X-CSE-MsgGUID: GwW/o3MgSPedmCr9904XOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; d="scan'208";a="34842225"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 May 2024 22:09:49 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 27 May 2024 22:09:48 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 27 May 2024 22:09:48 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 27 May 2024 22:09:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c7VjFc0jdnxo34BCmcmdxcLkLh1gBbjJ5OQEjrBag7xerCoh7RitHxNoGMFlNPWHDhZtx/3yA1Fg2sSVBBZbLe82IoyouT2pQEIcIRcxMx/UXzQsoda29p8WUh4Y4WRIHCox5KXecbnRI575xIfvhs1UKdDn67Zny3QTGhr0eQHoMBp8eHuyurk2yiSt+TNq3YnIt6HCZQbnCmltRp2j05NdZTSun+a8vfHYiHjFsErxl/hhwvBGcFlDsJsDQA0O0ANu1qkpPIUlH6FpHj4dkJOnQqEBf/7Jyl0uvGluoSiGC/uJ92kYeY1DXH70B4CsXRjIMqjoculooTr8W8q/rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i+Xd4bieXng+os83BQJeZKxBeRfGvayyrV/oX7V0CBU=;
 b=KKcge7h3mr4PMIlY2RbCy2aIv23IOOHNtn2AbEXgIXn2XlsZfGjDTDUwF/k0YPRFMpDLsFArDk2jcyW4VfqgalC8nzGBXvVecqk14UUAPt6ElUj7v9/DdhOX7HhlSvXSD86cAAzoVnlRXq6YsGJwgpn863F3qOSJuzuWthvmYMtzYQps3W902Cmv6Uzp8LoYewrVS8eXpLpcMcp4qdxvPtuY+3GXf8TiAVgxo0UT0KGm8BOw5BXjobprEeORTOEOFDB8cxGmXufekvtRhGFdsKxWhMRDw5mxD0jpLFSGz3Yk+nVrljAN3dnykffDSvvyhwS10S1NnfmVp977dCU/uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by DS7PR11MB7905.namprd11.prod.outlook.com (2603:10b6:8:ed::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Tue, 28 May
 2024 05:09:46 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%3]) with mapi id 15.20.7611.016; Tue, 28 May 2024
 05:09:46 +0000
Message-ID: <a29034db-6b73-4cd5-9a1c-60cb43ed15d9@intel.com>
Date: Tue, 28 May 2024 10:39:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/hwmon: Expose card power and energy attributes
 of BMG
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Karthik Poosa <karthik.poosa@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
References: <20240523144351.4040131-1-balasubramani.vivekanandan@intel.com>
 <20240523144351.4040131-3-balasubramani.vivekanandan@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20240523144351.4040131-3-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0009.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::19) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|DS7PR11MB7905:EE_
X-MS-Office365-Filtering-Correlation-Id: ae0c0ca4-93e4-44ba-8ecf-08dc7ed4645a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d0dycFJpMDN4T2x3U1Rpamp4T2RRRDlxZTA3eDIvTWNyanFUQTdHK2lSOUxO?=
 =?utf-8?B?SE96cmxCaEVuM1VqUkR4QXY5Q0ZCZThsa0t6N3JSR0U1aW5VaURzUEdzdjZ2?=
 =?utf-8?B?b2k2WjRxem9HWXBGVVY4OWpYZ3A1NitBa1UyMVlJZTRkeVhPa0t1Sk5Qdk5h?=
 =?utf-8?B?eDFzbE92YzdjTEhnaFUrVmhjSHMxMVo0czh6cWlZOFBUSDRjL3pqTlZhU2cw?=
 =?utf-8?B?UkRUYk13dG5sREJLeHhMcjd1MFcrYXAvTklxMFN1WWw0MkNLOXQrNVZQbHNw?=
 =?utf-8?B?bU9xZW43REFuRitXWG4zM0lkWXJWajlkSWZvdExMUVBHeTZZNjNEaUZyL09E?=
 =?utf-8?B?YnphNmZYa3NiNmpZMlpFTmdHcGJHT1ovcnpudXN1c1JxckpKekJzbHl2dUI2?=
 =?utf-8?B?Y1oxZzE3ZGlaVjhPekRCeWJHcU5td0Y4RnJRTXBaVDJxRWFyb0ZjSW9QOTRt?=
 =?utf-8?B?Vk5CS3ZHVnIveG1hL1JPeE5GWHIzM1F3Wmh5K0V1VWRzRHNhc1QyaU5RUGdz?=
 =?utf-8?B?WWJnRXVCK2Q4ZytoWC9IVmlWWVB6dDRPZ0w0SFZzZ2JTcTFialVUd29weXBx?=
 =?utf-8?B?UFFnUUZiRmhXQTc4blM4KzhqM0RkcjdOTVlEaEJvakZIbU1KZVlQT3pVcGJn?=
 =?utf-8?B?OTRxNitsTTVhWGxrbW16aFpGaWRUY2hncFZxSG40bTg0M3JkamhaZ0hSajdH?=
 =?utf-8?B?N05GQnpzMS8vOVNrWEJ1UDk1UEtHclEwUWJVWE82MWE5L0VkQ3ByVTZiTHdP?=
 =?utf-8?B?b1FCc1lmMmpXOEh6R2txbkE5T0diOEJ1UENYQmFZNFo5a3drSHYwUFh2V3Z2?=
 =?utf-8?B?ci9PNXJUem1ieUtscm9OZjlRTzhwNGM4ZlV0ZitLeFpkSVdCc0hwWE1WbzBR?=
 =?utf-8?B?OG8vMllvM0NKa1pxQjlGMEIrc1I5VllrZUY5bGRwbEpyNjRMUjlvQlFOTndQ?=
 =?utf-8?B?Zk1uWi9sV09EWTlXb2hveVhMeXlmcVdIRzF1eE1yc1I2c2J1eVpsQnNpdjBn?=
 =?utf-8?B?NXY0VHhKeTRISGV1S3kzRlpCMi9nUUwwcUJJWnFTUjVaejZBUHQwZy9UQUMz?=
 =?utf-8?B?OWZPakZreWo3UnRBcXRMdW42Y3hDcXdoZ3dHMmx0bXQycGpTSG5IenpEdWhF?=
 =?utf-8?B?RnRaTTR2RVoxeUI2Szg2REZTTjhzTWEzR0FZdjJ2RkRRK2xOdmptQXZKU0ZT?=
 =?utf-8?B?VWdicUJ4ZGNYa1ZnMjNuM3AyQmlSZVZBUzBXYnF1bE5jUjUrQkJxdTVTVW5w?=
 =?utf-8?B?cEExU2Q5dnFHVi9vamVZcWlMRzlaTTEra21SN0dML3R2aUdlUGRzUy91dE8y?=
 =?utf-8?B?MHlaeVBtSVZyemV5L0h6V21UYjROYUprQlJIdzZQZFZwbC9XVjR6anFjQjd6?=
 =?utf-8?B?UGRha2VqNXBISDJFNnduaFVQbUprRkV3cW9PUXRhTjR2Y0Q3QWU0aUlRUi9M?=
 =?utf-8?B?a28rTTVPUWhFb3gzSzNJVUJocHlKZHNhVWNZQjUzQ1BwWS9iazQ3d1Z4ZDN1?=
 =?utf-8?B?SnhxWFpxVUx6Y2FpOE01bXprc3krYzI3WGtKaGJ5dVI3eXlKa0VkbGJwd1RK?=
 =?utf-8?B?OXE0bEZLVGhpUFBlVE5kbS9GS0xrWFNIT0pLNUR1SHd0ZWFLckNMOE5VZ1NN?=
 =?utf-8?B?czJDWFUxLzhBaE13RVU3ajQvall2b21ubitpWGNXbi9lckVhQjZYM3V5bTlG?=
 =?utf-8?B?ajdEaE4xMDV3NGZmNGZiMlFTVjliditYb0ovMURqc1M3RFM2Si9hYm93PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVZkVlBKOTFjS0Q3TERHRWFVeUwzVUg4T3J3VjA5ZTVJQm9tQ2JZTGQvdHZs?=
 =?utf-8?B?TWNRblU3SFFjWTNVV0NqaXNySmxGVHZMd1pOMWxkSmNINWhma2lUbDNsWVBX?=
 =?utf-8?B?NEZLaWErYnhBTkFUUEtoSEhIU2NHZUpkVW4zVm52UFdNTE5vVGxtbWovYW4z?=
 =?utf-8?B?OHNpNmdLcnlxTVVMTnpmSlVsMDZsSmxJTGxTejQ4azloZTlOSjZocXl1YzU1?=
 =?utf-8?B?emxIejY2WERFN1VwV01XNEdBeUZETWEzMjNLaVN1MFdRTmdlbUhDT1ZIc3hz?=
 =?utf-8?B?RTFJayszd2w0YUhRWXA2RmhoekNlOUNUUnhTVzJtMlNiNU4vWGoreGIwQkMy?=
 =?utf-8?B?c200TGg2Y1hueGg2L1ZFKzNqNTZoTHRrNFZFN3JpRFJLSElORFV3NFB2THhu?=
 =?utf-8?B?MXd2bTM2RnhRR0tpMnEyYkljZis1bzJNdnhjM1JycEVQeXVTNU9IUmZUVjJt?=
 =?utf-8?B?VXlSWHpwVnJ1TmlOVTE0MXhVOUNuUXMwZXhhT0ZFaFlvVndoNlRHaE9JKzZs?=
 =?utf-8?B?UTAvTGxINEFJNzBMdTFQRnI4dHcra01yK0l5eXUvVFhRTmtjRUJkTmtBTTAz?=
 =?utf-8?B?WXJwcENaZW1DMUZIdFBodXhXNEtkcFdSRkVlSTgwSlBnQTV5N2J3UGx1Q0FE?=
 =?utf-8?B?WU9wV0NtOEZiOWJncFNLUnJCOGt1S3k3QU9qSmlyblROU2RwL1NIdGhaRCtC?=
 =?utf-8?B?Z28rRlpPa2U0Ny95b3BxT3RpVG93NEN5MU4vWXliUkdpKzRENkxCNmIxdnk0?=
 =?utf-8?B?YkQvZmJkUm9CSHdVamhYTjVoTmVzM1o0ZUFnOHR4cmIvMXZPT2pORFRjYnc0?=
 =?utf-8?B?dHdFR0FNTFQ4VGVDREVFd2VKV2NwRHZ4ZnRCYVlFMkdDNnFOZExIL2ViSjE3?=
 =?utf-8?B?K21WZmJmbXhQbW8vZ0NNME8zMXZVaXBibUFnWkVQallwcEIxcEZiQVF6UldQ?=
 =?utf-8?B?ZWNuVTNLTFVjT1hPTGlSelhhNUFyWTBOaGVQRUtLOEhCNVlQUHRlUUpDK0k0?=
 =?utf-8?B?Q01ZSFEzZ0c4WnFKVStPbk9xU29TOGpOOWhnc3RqVXEzZGV3c2IvNWVETlY1?=
 =?utf-8?B?Mk8wU2UzTnQvQVdvdkgyRG92SjdGZ0RxRkc0U2czWTJkdk1GOWlJSHZHVVY5?=
 =?utf-8?B?VThWSGZXY2ZHWkZiQTg1bmtiYjBZUjE0TnEzemZZWjlTODFnRzJMYTdibEJX?=
 =?utf-8?B?SlQyNWgwdmJPZGxJUExPTWluSjJkWjdwSk1mZTZCSWVneVA3QzZBanJVNEsx?=
 =?utf-8?B?SnJkTVZJWXpWZm9DRUNtbTh3QUdsZmNwQnhsUjB6VUtIamJCK2p5ZmJrZ0x1?=
 =?utf-8?B?c0RPTkUralQxSnFDdGtxSVN5SUxsMHhRVFBSWTlxSWFpTVh0ZVF0ZzQ0ZkIr?=
 =?utf-8?B?K0p1eUJpNVZPSEhaamtMUy96dGx2L3BjVHVqWjRWTWMzc21RZ0VMQTRzSlN3?=
 =?utf-8?B?SHUvb1ROMXdmVUxoOVZxSHIwVWZjcWx2TUdPQy9NOG5SZ1VMeTRWRmIrWkpN?=
 =?utf-8?B?NVBGMGlQMy9oN2R3cnloSGFjOThZNzdHdlhML2E5RHZlanhPMWpqcUtYaStn?=
 =?utf-8?B?UHpjZlhKWjhlaTc3WW9CNjhrMVFuTGVibW9Jb3JEQnBVTjVqOGRRMGxpSU9M?=
 =?utf-8?B?bVlmaGkvQS9tbkpLcUxyZExPUVhuQ3I4NWx1aUxadmpLMFc5ZFZFMGpEc2VH?=
 =?utf-8?B?dUJTelIwVkhDbWY2MW5IUjU2M3JBQUUrblFjQ3QrQVEvYXRNVVhXZWtNdGFz?=
 =?utf-8?B?Y2JiS2l0MzVGdU5LN0ZiSzNwWVl6YTZGVHdQdjBaL2dhbDVLT1BvWVE1dmU5?=
 =?utf-8?B?NHVTb0k3Zm1zSE5pRkJ3SnE4TzV0U2ZlV241eUNZNjF2S2kxeTdseTFzYURO?=
 =?utf-8?B?bnpLRmRSc3NQMGExV0kySjBEelVtMEJtNloxVjVCczMxYmg4VnBtTVlmM0NY?=
 =?utf-8?B?bERyMTA1QzZOQ3BPaHN1QjVLRjR5Y3ZSVHhwdllxUDFnb3BmYnVDWVFBdkxG?=
 =?utf-8?B?T1RkWlNzWm41b1pTd2hFOS9JY01FTXVKdGhOZWY1aG1yWU1BRUVtcmNMQWJu?=
 =?utf-8?B?cU8xeXVhSFhBeCt5Vms4Uk42aUFyQ3UzcFl0eVRaaHUxSzUxbGxkRU9XTmky?=
 =?utf-8?B?WUcvUVhHTldJeUwxbGZMeHUzMnBnajJWeHBtNlJ1Szc2Z2hGYm9HUUl6bDlk?=
 =?utf-8?B?N0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae0c0ca4-93e4-44ba-8ecf-08dc7ed4645a
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 05:09:46.4423 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MnqvWhKouvDdaYjjQaxVPJA/rCHS8gpHxAqH+PnUE/LfkmICH66f8So6jgwU47qnzcKMKroTkbqcmUGRnE0Puw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7905
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



On 23-05-2024 20:13, Balasubramani Vivekanandan wrote:
> From: Karthik Poosa <karthik.poosa@intel.com>
> 
> In BMG there are separate registers for card/platform power and
> energy.
> These are exposed through channel 0 i.e power_1/energy1_xxx.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> ---

LGTM
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

Regards,
Badal
>   drivers/gpu/drm/xe/regs/xe_pcode_regs.h |  2 ++
>   drivers/gpu/drm/xe/xe_hwmon.c           | 26 +++++++++++++++++--------
>   2 files changed, 20 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> index beba16d592fc..0b0b49d850ae 100644
> --- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> @@ -22,5 +22,7 @@
>   #define BMG_PACKAGE_POWER_SKU_UNIT		XE_REG(0x1380dc)
>   #define BMG_PACKAGE_ENERGY_STATUS		XE_REG(0x138120)
>   #define BMG_PACKAGE_RAPL_LIMIT			XE_REG(0x138440)
> +#define BMG_PLATFORM_ENERGY_STATUS		XE_REG(0x138458)
> +#define BMG_PLATFORM_POWER_LIMIT		XE_REG(0x138460)
>   
>   #endif /* _XE_PCODE_REGS_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 8daa070d7b1a..aae9670428a3 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -86,12 +86,17 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
>   
>   	switch (hwmon_reg) {
>   	case REG_PKG_RAPL_LIMIT:
> -		if (xe->info.platform == XE_BATTLEMAGE && channel == CHANNEL_PKG)
> -			return BMG_PACKAGE_RAPL_LIMIT;
> -		else if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG)
> +		if (xe->info.platform == XE_BATTLEMAGE) {
> +			if (channel == CHANNEL_PKG) {
> +				return BMG_PACKAGE_RAPL_LIMIT;
> +			} else {
> +				return BMG_PLATFORM_POWER_LIMIT;
> +			}
> +		} else if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG) {
>   			return PVC_GT0_PACKAGE_RAPL_LIMIT;
> -		else if ((xe->info.platform == XE_DG2) && (channel == CHANNEL_PKG))
> +		} else if ((xe->info.platform == XE_DG2) && (channel == CHANNEL_PKG)) {
>   			return PCU_CR_PACKAGE_RAPL_LIMIT;
> +		}
>   		break;
>   	case REG_PKG_POWER_SKU:
>   		if (xe->info.platform == XE_BATTLEMAGE)
> @@ -114,12 +119,17 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
>   			return GT_PERF_STATUS;
>   		break;
>   	case REG_PKG_ENERGY_STATUS:
> -		if (xe->info.platform == XE_BATTLEMAGE && channel == CHANNEL_PKG)
> -			return BMG_PACKAGE_ENERGY_STATUS;
> -		else if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG)
> +		if (xe->info.platform == XE_BATTLEMAGE) {
> +			if (channel == CHANNEL_PKG) {
> +				return BMG_PACKAGE_ENERGY_STATUS;
> +			} else {
> +				return BMG_PLATFORM_ENERGY_STATUS;
> +			}
> +		} else if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG) {
>   			return PVC_GT0_PLATFORM_ENERGY_STATUS;
> -		else if ((xe->info.platform == XE_DG2) && (channel == CHANNEL_PKG))
> +		} else if ((xe->info.platform == XE_DG2) && (channel == CHANNEL_PKG)) {
>   			return PCU_CR_PACKAGE_ENERGY_STATUS;
> +		}
>   		break;
>   	default:
>   		drm_warn(&xe->drm, "Unknown xe hwmon reg id: %d\n", hwmon_reg);

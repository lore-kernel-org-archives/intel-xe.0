Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B06CA0FF9
	for <intel-xe@archiver.kernel.org>; Fri, 29 Aug 2025 14:33:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7B3910EBD5;
	Fri, 29 Aug 2025 14:33:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QeUPcjbQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA9F710EBD5
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Aug 2025 14:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756478015; x=1788014015;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=wj5E741/I9io5qE4qkWohC/piWPXlgyzdhHgfrXgKuU=;
 b=QeUPcjbQY3s9kCkjHithqwHM6Kj6IDtUzhY66ObpUOwzbgUn8vx1ZRKL
 0GhlabF92NhjWnfDlp7ulM4JZKMPRQTgEsNpFMeYr0G9tiQntnzJvpydI
 szLhcdXBcO/IVZMZ2QOBo9+1yX32AhWsn3ND0pqYgon+5e4EVKjaeAsxN
 xMa/GkzIBVR2eUd33SHYHG20fi+bTmpSsly2BZRjqYqmk15ioF0OOAbXD
 zn5tHXzylmH7yMvOL5V41AHnZSggNBjtARa0fbU85aLbAmKO41tW6wI2b
 GhX+rV13sL8QGfA1NqG55mLtuEMow00+6ZxQXWNy1NTCQ2OtKQZw8VQ5J Q==;
X-CSE-ConnectionGUID: xJoYFZzRT/GjCozQnng0+w==
X-CSE-MsgGUID: n2IYgFbiQfK8VPHTqvrJ/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="76362452"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="76362452"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 07:33:34 -0700
X-CSE-ConnectionGUID: YPukt693RKWCWYnICuFx5A==
X-CSE-MsgGUID: 4LJTQ7O+SXqZNMNq/Qs6HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="175672867"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 07:33:34 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 07:33:33 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 29 Aug 2025 07:33:33 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.67)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 07:33:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W6IByqyvymB1HwcUSf0eEWRmNn+okYdrkP45AeV7VgNv3Cip3ppCfM+eaRB2u8DNUQ2SIzPW3P992gHfq4Tswsckw3MuNQ+OmRRd65ZcWlwVl+fJIadPdGMMNbkVEo0t1JQEFOsYAGv7QQUz20Zjddtyqx0RBC5+qBXHoSZ7gey123dixfhLnaswDXWy/kDXmdCoutZpmI7d6Uj0btf9k2MeVulhMFQXdQBjtZUkGHOswZWuE2ucg7AeBvZxRAWCWsbYx2HGFHixgdtRrRrjIVdzdydKKo/3Gw1JO1bBhzXiEvUH+fTgshQMdXDkMTR53P3ta2f42HYx+FwvJmfFfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6hTa0Eh3PgcsxbExg/9Pz/nN7eR6+JkmLa1EP4Bwed0=;
 b=FZq0rDoVaVIVckbFqGSwHkBEiRbRMa5Fwjwz/wUDk6LWEqQ3Zk36h1k/HEm3lqUtHjzWFfE1rNi4E1MKu1fqc4Lm4T9yujK6hbT3PZeyiHp46/YMk2fCVjSJ5MXekmmKTXotqCAzvH+zMMDaZbwQDjCU5w6RTs42XLmtgA/FUSmz8tKbn243ZjWvgdaVP4VjHNM9Ejk4ovkehbhw1SuGO8HBQosmCNFyp3kJrirH+e9IdD9bfNKKdh14d9GDcIna7fowut+iz0XTnpbPT9WTNt/TU7A8XqhLw+73H9sa4cKgXmdpLTJgb0Py6yrVDlpwLW2QtCZOpcvCuv6HORrX8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by LV8PR11MB8680.namprd11.prod.outlook.com (2603:10b6:408:208::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.25; Fri, 29 Aug
 2025 14:33:25 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.9073.017; Fri, 29 Aug 2025
 14:33:25 +0000
Message-ID: <868b5a8a-4899-4800-a4b7-9e4cf21c0fb9@intel.com>
Date: Fri, 29 Aug 2025 10:33:22 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Update GuC log buffer type value
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, "Summers, Stuart"
 <stuart.summers@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
References: <20250827215217.1030775-1-zhanjun.dong@intel.com>
 <658967b09cecdf0f20ad3547d4ab5ed3e016964d.camel@intel.com>
 <0b71e049-bdc7-4ece-a978-26e4f538efc6@intel.com>
 <d0da1a9e-b4f9-4885-a5e3-0b03d001d12b@intel.com>
 <5d8a7ec4-8827-4e50-9cdd-5f485a28bc32@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <5d8a7ec4-8827-4e50-9cdd-5f485a28bc32@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0246.namprd03.prod.outlook.com
 (2603:10b6:303:b4::11) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|LV8PR11MB8680:EE_
X-MS-Office365-Filtering-Correlation-Id: c3d6a01f-3109-40d4-8369-08dde7090368
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YXVPN0hYOUxWOG1KTU53OGRIWHZuanBrK002TUJNd1Urb2dzSlRlUWlscHFW?=
 =?utf-8?B?anVtWXhocTVLL1A3NVdqTlpGckF4dmFiVTVFR0MvMXNOYk1zMWJkeFo4L0Na?=
 =?utf-8?B?c3lSRHV4R25qQ1V2WmtURXRhVk10NFlmYVA2ZytQK0l6aWF0L0l0Q1R1bmxY?=
 =?utf-8?B?ci9zU1BPYnlDSk02cTRJOUJRVkVrSzN2RDhDN24vRmFKa2tiblFONGhPNUVt?=
 =?utf-8?B?LzQ3dGVLSVNvUngwNjZURWdsMVdPaHl4VXVnV3hEelpEd2NDWE13aklQY0lD?=
 =?utf-8?B?Rlk4TWhRZmE1K2d1bmpTMU9oN2hzNUIzNzBpUFZLQVdEM1dXMFNtQWc2ZXMy?=
 =?utf-8?B?OWdvQ1RJZkU0VExaTHl5d0l3TGc1eGxLMnU4d1ZQbk9tZHVZQ0hWWE11ODY2?=
 =?utf-8?B?TTU4ZUgwcUJ6M0J0RUc3UzR4TGVQcFZXbGdXN2hDRlE5cTdWWWtUVWozcnM1?=
 =?utf-8?B?Yk9COVg3MndxVlVLcGdOaUpNY2ZxRWtUOHAzd2pqQ3REamhlOHJzWngwM2xK?=
 =?utf-8?B?QytDVzJ1bVdGY21vdUlZZDRXSVBkSkJLblFqekx0SmxQM3JBWVlpb3YwRThw?=
 =?utf-8?B?bUVHdDQzbTh2Y0c4clFHTDdxTVJkeFJaeCsrNHJiZDZSdVFtbjE2VGVNZ2VF?=
 =?utf-8?B?ZTFRajVFaEJzaTZHY0pVY3RGbWFHREszOEhkOHgzUlMyd3BLSXB5clRITlow?=
 =?utf-8?B?U3NlckFHZHlPWU1mc0VlaWhPL1dXTnEwZy9JazZXdkY4dzNHem9TckFhSFE4?=
 =?utf-8?B?TmdzLzRHN3pIQUU5R1dhV3pYd2NVRlRyVEZHMXRPaWk0WmhiY0xtZEd3UFIw?=
 =?utf-8?B?VVNrZGk4UUNLcTBSRUk5MjFkTGpSdFR0K2dPR2xsUTBKQThwM05ZT0xDWk5p?=
 =?utf-8?B?RkE5OTkzN2dpcG9YRG1aYnJKQkN1bG15aERsUDBxd28zcmprbjZ4QnNaWmRY?=
 =?utf-8?B?anp1Nzd5VllZdklpNzJKMXhMS3RKc3ZXUUVhVVhWRHdEMDRUMFBVS2lxM2hC?=
 =?utf-8?B?alM4cnBRNXc2bVFOZlR6QkdDSFlaM0k2dUEwL0RGbUEzL3RNS2d6enJ4WDhR?=
 =?utf-8?B?RnovNUlBdHYwQ1NqbEFadnNrMW5XdDIvTllrTHpRMGFJOHVMYW04a3FkWHV6?=
 =?utf-8?B?ZHNtV0UrMlRZZnI0NkUrSHFENTRKWHo0dFdLclRuejFHVHpEb1dUQ1dBY0pr?=
 =?utf-8?B?RXZaZHl4djIrakZmVVUyUXBySTY0cmsvdTg1VUNYZjR3dnVPdURaZVF5VUsz?=
 =?utf-8?B?M2tvc0xBZ1RQMkZpUTR3ZTJwK0swc2tpYXlLQVJRc3lNRU4rdGNVbmd4NVZo?=
 =?utf-8?B?dEZjR2hRTks2cnp0VXdYb29ubVBveEUzbXNnZ3JGbDR5NzlUZkhMR090MERT?=
 =?utf-8?B?UGh3M1dsalVNOUZpZ1orSnV5a09uZjJrYVNSMmVveitmd0Z3Z05xclJSRWl2?=
 =?utf-8?B?MjdwWTB1VU5JeG9rS3JIVjNGaHNMckIzTFZJNTVYbnpVOStVd3NmYnkrUEZZ?=
 =?utf-8?B?NVZOK2lSaTBkYkMyeHNINDlETkdOL05NQTNJVmZpT0laZGlGT3pacXNvTjRn?=
 =?utf-8?B?TVdpMTkwWndyVjZ0MTQwMld3UmxMb3VkRE84c2tXMmlNa1dBbGN2YWtKd3ZP?=
 =?utf-8?B?b2ZIS2R3K3d2Zk55MlkwNjE0a3hKRkxGbDdaRHR0WGJhVGwwczRFdXZLVlBs?=
 =?utf-8?B?UFFUOGVvRHJsbkwyYmNOajg4dzdEWEh5WDhua1JRNjh1MEgrdTRZWDdzRjVC?=
 =?utf-8?B?R0lDSDQ4c3EraWNsNE8wVzN3dklYTHYvZ1pnQVhiWGtPRHk4L3ZueHc0R0ZF?=
 =?utf-8?B?N1FkY2FXdmZQOEk3a3NCOTlOMGVqQTMxamJ4V3FteDdWVldYOXpFeFNPeDU1?=
 =?utf-8?B?MVFLQUdUZGVHbkVuNm5BSDF5UDc4eFR5YTV6ODlJUlBaZytOWXE5S01OSTJr?=
 =?utf-8?Q?Zb7y3VnrMUg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHZyYVpvajgvOE9rSjMySVFIYWZJK3dMQmQ2N2NaTWdLSmYrRzcxU2cwUk1G?=
 =?utf-8?B?ZDRxNWd0aXVObHNjalFGTmlNZGEyZ3ptaGFvQjB4NzU1RXIzQmx5VDlJSk9v?=
 =?utf-8?B?a0lzWUhQQ0RWUGozS1dVdENGMWptdVAzeVlrSVNRb2lQMlhsa1F1Skk4L0Ro?=
 =?utf-8?B?Y1ZseFFVREE0eGJuUEJ4Y3A2NGU2VW10ekVnL25Zc0tlK0drSlRmRVp3MW40?=
 =?utf-8?B?MTJCV2hkUUZOTlpwVFJyemRyZ1FhdG1jYm5ON2JRWVVWTjFXRWxlcU5GeWth?=
 =?utf-8?B?bDEvSlZsTEs3MUhsOVFQb21ZbzZ3TjlEQTRwbHVBSC91Y1E1c1pNV1dMVzhQ?=
 =?utf-8?B?K2p5N0VpajRMRCtlNEpzQzlIT0JJeno5QVR0aDQ4VEhjM0NtZVU1OXZKaldC?=
 =?utf-8?B?dGNvWXNGM2dtQlh4NVUwVlNET3UxaTJsWFZoS2ZNR0RqMG5ya1RnQmhNWHps?=
 =?utf-8?B?VFNJRGU4WlJaNWhnOGxONGJCY1ZpNVRIUVF0Y2FtMjZyR1gwc3IydGZ6NTA0?=
 =?utf-8?B?M0c1WXFxV2tORGhndndjRHpqeWlWUUhkRXJOTUkwcCswTlVsODYvV1NicWtr?=
 =?utf-8?B?OU1lUUZBaUErR0NWZ2NYTzVKSmNhYVBud0hRQVRiU3JPU3E0VUJSNG1SY3VC?=
 =?utf-8?B?QzBEb2ZFajdlcTlRTTh3ZFRnVWRzOVZEamJGSHUxMjUwQmtmcXBCbllMTytu?=
 =?utf-8?B?bEQ0UmxVdm5oQS9wZGRPblArS0oyemp2UmNSWXp2M2g1U1dNa2J5UTJoM1di?=
 =?utf-8?B?RG94VHUvTTZJZW9qc05KcWRLdkJZSVhhd25EaVZPZ2o2ejJMU29EYVZhT1Zm?=
 =?utf-8?B?OUhUZC94SnJabkZVVk4zZVcwZVZaYjhtOVFLMlJUbkhVcy9aMHVGZ1NGUXpV?=
 =?utf-8?B?NFdGTFRmZVpBZ0QwMjFmYTBLQVFUV3drcGpCQ3RlZkwxeWhRcDh1QUtZdmFu?=
 =?utf-8?B?T0hFVUhRbGtRUlZEVHZKajRRNG1MdmVBMFIyaEVOcDhDS0cxUGxnRWxlK3FD?=
 =?utf-8?B?Q2JodHhpTVk2Wkh5cDNaZXpnbWFlelIvR01TVUdmemF4VEpkVk9uZEl6SUpX?=
 =?utf-8?B?QVVQd1EyWDZneDNGMEZmOVlwd3Z4WS9saWQxQVNZYSt0S211NnV1VXAwcmJn?=
 =?utf-8?B?aGF0eGhDVHErbnVNdlBUVDEwZ2NlRDNvTHFRYXFITjE2U2ZheHR3ck1uU05u?=
 =?utf-8?B?QU85ajd3T1dwTWtrQzdPUWdkTkZNVzYwKzg0cHJUbGxVdmVaMjVaeHdEQnJI?=
 =?utf-8?B?N2sxMWxlTm82Z21qZStuOEQvUnFuczdDVExLcWJuTkNSUk5ZSTdlVmVWN3FP?=
 =?utf-8?B?bXRmM2MyV09TamFmT0lDa1lwUUEzbnhLS1dvdGF3cDF6eEF4K1Jla2NPazdY?=
 =?utf-8?B?dmtNSTluc3JETkVwS0MydkIyOERPL1pIdHcwRE94THdaY01UVkovK0dsN0dG?=
 =?utf-8?B?ZnNjNllYcXRuaEUyK0VodjY5Kyt5ZElFN3ZiUnVDdnBGNFVBdTNkdk9JS05I?=
 =?utf-8?B?VytDYnd3U3RMUGJHL2tHengrSElpbnlLSElEblhEWDE2SDRBUDE3TlRYV0Iv?=
 =?utf-8?B?UzVBVUlpVEI3WDQ1d1lkZGlhK2MyazV1cExuaXIxV0NyQ0ZGOHhteFU0aDFa?=
 =?utf-8?B?Y2sxK2pOeVBLSldmZkkzOEs5TlV3OUpXTjY1WUFmSTlqclIvajVNTWRWQXc4?=
 =?utf-8?B?dDhTUm9nVzY1djM4c2hFbDFaQlBnUlg0eFRzNkZCTGtCaEw3NTlQb3R3NmRt?=
 =?utf-8?B?ZUpPQ2FVRHNVdGw2M3FVZmovRmlWd0Z6QjhSYnRFTVFjMXBzUC8yWWp6SzZG?=
 =?utf-8?B?a2M0d3htRkIxK1RUWWtEOGFHWVd1WlZFYmYwMGJ3Q1dWUmYvT2VhYzE5QnBY?=
 =?utf-8?B?MWtPeXFXakhGU1ZQaDVGZnc4UExhTm9MUzlOU09WaGlJcEhHbmxiNjkya3NF?=
 =?utf-8?B?aUZlUHJSdWhneGg0bGc0OGI1MStEdjdBSWJqcDRCUWtHL1dSam91Z3ExOWsr?=
 =?utf-8?B?ckZLL2VNY1A5MnJZanE0QWtUWmtVZEVhNDNLeWJjMGhEbUlNZFZYV3JqL0xE?=
 =?utf-8?B?ZlNkQ2N4VUYrS05sdVlDMjhjK3NTT2FwQzc1NjlHMEFSV25QTlJ5UnRmdDVy?=
 =?utf-8?B?ejZMbk0yR1ZRTFE4bTBXUmowZUlCL3ZnQkpFUHQxNWhhU0RjTUltSG9qMktY?=
 =?utf-8?B?alE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c3d6a01f-3109-40d4-8369-08dde7090368
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 14:33:25.7224 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OD3tRF5Oys632AsDZZC6IGIWoBTNG8NAEV6uGOtGJFOsJw5XDfv52UqREqMuh3KqKL77kC/1liwluEo2zQR/sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8680
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



On 2025-08-29 6:20 a.m., Michal Wajdeczko wrote:
> 
> 
> On 8/29/2025 2:00 AM, Dong, Zhanjun wrote:
>>
>>
>> On 2025-08-28 5:49 p.m., Michal Wajdeczko wrote:
>>>
>>>
>>> On 8/28/2025 8:59 PM, Summers, Stuart wrote:
>>>> On Wed, 2025-08-27 at 17:52 -0400, Zhanjun Dong wrote:
>>>>> Update GuC log buffer type value, make buffer types equal to
>>>>> guc_log_buffer_type in intel_guc_fwif.h.
>>>>
>>>> This is just to maintain consistency with i915? Can you add in the
>>>> commit message that intel_guc_fwif.h is in the i915 driver?
>>>
>>> hmm, but looks like a FW definition (it's part of the ABI headers)
>>> so IMO better reasoning should be:
>>>
>>> "to align with the GuC ABI specification"
>>>
>>>>
>>>>>
>>>>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>>>>> ---
>>>>>    drivers/gpu/drm/xe/abi/guc_log_abi.h | 2 +-
>>>>>    drivers/gpu/drm/xe/xe_guc_log.c      | 2 +-
>>>>>    2 files changed, 2 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/abi/guc_log_abi.h
>>>>> b/drivers/gpu/drm/xe/abi/guc_log_abi.h
>>>>> index 554630b7ccd9..b1819679fa35 100644
>>>>> --- a/drivers/gpu/drm/xe/abi/guc_log_abi.h
>>>>> +++ b/drivers/gpu/drm/xe/abi/guc_log_abi.h
>>>>> @@ -10,8 +10,8 @@
>>>>>      /* GuC logging buffer types */
>>>>>    enum guc_log_buffer_type {
>>>>> -       GUC_LOG_BUFFER_CRASH_DUMP,
>>>>>           GUC_LOG_BUFFER_DEBUG,
>>>>> +       GUC_LOG_BUFFER_CRASH_DUMP,
>>>>>           GUC_LOG_BUFFER_CAPTURE,
>>>>
>>>> Can you move GUC_LOG_BUFFER_TYPE_MAX in here as the last enum also to
>>>> align with i915?
>>>
>>> GuC spec does not specify MAX
>>>
>>> it's our implementation helper (so shouldn't be part of ABI)
>>>
>>>>
>>>>>    };
>>>>>    diff --git a/drivers/gpu/drm/xe/xe_guc_log.c
>>>>> b/drivers/gpu/drm/xe/xe_guc_log.c
>>>>> index c01ccb35dc75..470c83ead543 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_guc_log.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
>>>>> @@ -330,7 +330,7 @@ u32 xe_guc_get_log_buffer_offset(struct
>>>>> xe_guc_log *log, enum guc_log_buffer_typ
>>>>>           enum guc_log_buffer_type i;
>>>>>           u32 offset = PAGE_SIZE;/* for the log_buffer_states */
>>>>>    -       for (i = GUC_LOG_BUFFER_CRASH_DUMP; i <
>>>>> GUC_LOG_BUFFER_TYPE_MAX; ++i) {
>>>>> +       for (i = 0; i < GUC_LOG_BUFFER_TYPE_MAX; ++i) {
>>>>
>>>> I see that i915 is going from i = GUC_LOG_BUFFER_DEBUG and not from 0.
>>>> Should we do that here too?
>>>
>>> actually if "i" was defined as "enum" then we shouldn't use 0
>>> nor TYPE_MAX (since it is also not part of the enum)
>> Sure, will avoid to use 0, to be changed to GUC_LOG_BUFFER_DEBUG>
>>> maybe the implementation should look like:
>>>
>>>      offset = SZ_4K; // don't use PAGE_SIZE!
>>>
>>>      switch (type) {
>>>      case GUC_LOG_BUFFER_CAPTURE:
>>>          offset += xe_guc_get_log_buffer_size(GUC_LOG_BUFFER_CRASH_DUMP);
>>>          fallthrough;
>>>      case GUC_LOG_BUFFER_CRASH_DUMP:
>>>          offset += xe_guc_get_log_buffer_size(GUC_LOG_BUFFER_DEBUG);
>>>          fallthrough;
>>>      case GUC_LOG_BUFFER_DEBUG:
>>>          break;
>>>      }
>>
>> In spec, layout split into 4 sections:
>> First is 4K buffer state structure
> 
> hmm, I would avoid calling it "first" as then it should
> have its own enumerator (likely 0), maybe just say "fixed
> header" or something
The buffer type is used when processing this 4K header(section 0), to 
get info for section 1 - 3, not for the header itself, that's why we 
don't have it here.

> 
> btw, as you just said, it's 4K, so stop using PAGE_SIZE
> to define its size
Good point, will use SZ_4K in next rev.

>   > 2nd, General log event
>> 3rd, GuC crash dump
>> 4th, Error state capture
>> To get the offset for the type, it need to add up offset with previous section, the loop is needed.
> 
> the code above does exactly just that but without using the loop
> note the "fallthrough" between the cases
Oh yes, it should works.

Regards,
Zhanjun Dong

>>
>> Regards,
>> Zhanjun Dong
>>
>>>
>>>>
>>>> Thanks,
>>>> Stuart
>>>>
>>>>>                   if (i == type)
>>>>>                           break;
>>>>>                   offset += xe_guc_get_log_buffer_size(log, i);
>>>>
>>>
>>
> 


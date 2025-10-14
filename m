Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ADC5CCD187
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 08:13:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3D3A10E578;
	Tue, 14 Oct 2025 08:13:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l5ZQGwlo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BEE910E57D
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 08:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760429592; x=1791965592;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=q+l5Nft1sucZQuHSwTHkdZYD1JRWTjnmSZSh5o5WnWQ=;
 b=l5ZQGwloncUFi6njQ0ssIKIUPe2dnnCve3EW2IBcMrIHU4Mbb5lERs5s
 Vn3GkBssoFntycjjXU6/1uTgk+pErEYc3J7Viu+n2f5A3XwDdC7INRMhA
 +0aSh4IgRrROZ7IvkmsWLZcrYkaXeioWiLHQZvrQSSu0mRn9OCWoE7+Z/
 8XfcAE01AYQ6mZ9GfuRgY/stywdK/AIs68/SipNa/mG2Byc3Ai0Gsld+9
 RENeMDkbiaFbVBmLSFtpLwjBjzlQPzTCNMegnn4RyI70NRol1Gzl53IZb
 U4iCvV/NekPtdMTtBQOqEOaIp/0JAg5q1AulLFOOG082ZET21WORhIv+B w==;
X-CSE-ConnectionGUID: 7y210MO4S56kxr5e/YyTnQ==
X-CSE-MsgGUID: Hnx0w+mPTJ2/ScjIX+TtAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="66238662"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="66238662"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 01:13:12 -0700
X-CSE-ConnectionGUID: 68mj+TIFT8eM7N93oDiLCA==
X-CSE-MsgGUID: EZCynuwQQJyTiSsdUWYT+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="181498525"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 01:13:11 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 01:13:10 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 01:13:10 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.3) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 01:13:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CMPgkYol0Rq52/gAkTyA/yRH6skiWqeK27zKVL/3QVL0Zov8foYBn9+lUZ+qURMw7P4Xn8ivKCv7B7b/aKwCmG/JxZgyLYddDkH4cgfM1woYOlEitC4HhOVJBjM+FJ+7sivZC7hhpfoy85ZcsETMGvkLeV+Hj9H/GQ965qdG86E/Pk40baIBUdn01kFyIl4vGzfpy1XbDnlo6MKeZ9/uXTHxQsN4ejMLePUEGRyBtZuQyopuLXHfV62KmCBM4jLks6o3TmWf0LTF5QKZnKaiQlj1vhoW8WNPqzwKdBZzXR+5NvDQR4bXR4947V6DI77K3ZmlR6ZsmJsehaHsExBq5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nqn5PuEh4YxCxg0oxaAtQ1LV0c/cipMpgyxoMLOhXcg=;
 b=F3OWoqyp1B537fCjarVjeDgn6S0oJEFr2NULB6kjkuf9K6V8h0WNtXeNf+oq5U9MKt76fzBYsYHLnlrQVLP1a9SEqS0D3V/BXdHjUhpYfYFSLOGSEBXr9d+OGZueZGov/oaDkmbH4nIMImqpqqc2FwaPqviuaLNkm39UOEK0esJjCcA5Tkbko/hVhz99+FVFWRwt3Zy2Zo2FthBNfb/XXJSAlPpzDEW8gA27K+ZZBxjPflOtN0xdu23sxVEVRa0+6POC4QnzAyiXUUZbiGTSsNt9/lFHNSrE8OfHVftpveWVYzpg4bhzBt9+HOdvwkFf+CXLN/4Utd7Yp4p25BauzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by MN6PR11MB8172.namprd11.prod.outlook.com (2603:10b6:208:478::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Tue, 14 Oct
 2025 08:13:07 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3%5]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 08:13:06 +0000
Message-ID: <2aa089ca-a8a9-4f89-8dd1-b37df0adf31e@intel.com>
Date: Tue, 14 Oct 2025 13:42:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/23] drm/xe/xe3p_xpc: Add Xe3p_XPC IP definition
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>, "Matt
 Roper" <matthew.d.roper@intel.com>, Tejas Upadhyay <tejas.upadhyay@intel.com>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
 <20251013-xe3p-v1-17-bfb74f038215@intel.com>
 <e06bc7ee-e672-41b6-b911-51c90e73e8c7@intel.com>
Content-Language: en-US
In-Reply-To: <e06bc7ee-e672-41b6-b911-51c90e73e8c7@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0091.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::13) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|MN6PR11MB8172:EE_
X-MS-Office365-Filtering-Correlation-Id: 4610d326-64fc-4691-4c4b-08de0af98146
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dnVEcjZ0eWZjaXJDVFFJMkNQRy8vN3dGU0FJNFA0TUt4ZUtzZ09OQkYvSStJ?=
 =?utf-8?B?bDZ2RmVZSzRDWjJlNjRncUdKN0RtaHc0bUJ2anNrQjVNYlh4TWdUUVY2OWxm?=
 =?utf-8?B?SHZoeEN0YzRvUmk3MFJzOG1ZMkpTMFdWWjJ5Wjd0aTh4Z2FpMTdOa1hPNjBX?=
 =?utf-8?B?ZzIvSlRpdFk3a2tJZXp2QnlyTEl4UWE5MzRUVkRoVW83STIzYUsyMVhaTkp6?=
 =?utf-8?B?Qlk4NE5RVUpDd0ErNEE5NzBBUENtM2t3amtuQ1FyUk5XbkdRSFNEeTh2cXlp?=
 =?utf-8?B?dHozQWxIOTZUdlRTQUovTitwQnBNbW5yRnBnemxDS3pubEY4QVhCYzBVQ1Fy?=
 =?utf-8?B?UFljbzFuc1R5VEZIVGxRUThCdWtINFh5WFpZTVhESVZ3VHJDVzdFNHJwb0Mv?=
 =?utf-8?B?dE5ZbmVFSC9JVjRHRGprUTUyZU1CbllSdDU3SG9PSk9xYW9TdUhLWCtnT0NL?=
 =?utf-8?B?L0JHSUMrQVVrK0dYUVQ5MXdHSys5aE5vQ0p2YlFUZ0kyM1h1bWRPa05maG9n?=
 =?utf-8?B?bE0wcVplSjI1czBCdVUxczlHVmlRUmpqL1k3djl6WUhXdUhCdnBESThGZkdk?=
 =?utf-8?B?Rm1vc0EwdVBqaGIyWi9iRU5CbHlwcmFsb0pCcHVtMmhJeDhiTXFCSDJiVHI3?=
 =?utf-8?B?YjhHaVhWWXRodmdhNmJPdUtacW50enIwcXpPb3AzNzBkcDVkYW50SlJ2V1V6?=
 =?utf-8?B?TlNwYVFxMWQxQXR1QUhidGs0SzdwdDVtaVZZdnJadXZsUWVpNEtQRFFGb1Nk?=
 =?utf-8?B?anQ0ak92TkQzbzVPbllNNE80MXlWeUhycndIbnV4S3N6dVd0V2ttM2dmQ3pC?=
 =?utf-8?B?SEY2VWNNeDdKai9adVcyUThjQXJZczVCTUtldDJ0NElmMzlqNWRhc0d4d3RV?=
 =?utf-8?B?WndwQ1h5N3Z6QStDYTBkcWM1M2laMHNiSEI5MWFYUkVRYTJsSzZYTXcwekE3?=
 =?utf-8?B?a0xmUHV5bHZuQUVCWWYvNjc0cGVacUN6NExXR0tEYm9Cb04ydmNWUWoveUhr?=
 =?utf-8?B?M3RTT0JjV2M3OXRTNVUwS2xtcHA5VnR0eTV6VkozUGQ5bW9CMFZubUdpZEE1?=
 =?utf-8?B?T3gxTW5keFZrb0JLZE9KOWNZWjNndjdmeUdxZC9ZWGNwNXBpNkk5ODVZNFA1?=
 =?utf-8?B?QTUzV2NqZlFDbHVqUWwybjhZNFIrUitBUXpMMnBCRGxFYkM1QzNqN2VodDlY?=
 =?utf-8?B?RzVvNHd1QVB5MkxReWFMMk9nMkE1MzN4K3czMGZkRHBxVDBLSS9WRDA5VWdZ?=
 =?utf-8?B?dW1yMXBIbW9QQ1MvbTA1QTQ1TDd6K1NaNnF3R2tWQW50b0J2Y29pdHpkeTNM?=
 =?utf-8?B?RldFKzQrcjNjMitGbElJalFYaDRRV2x0UCs3S1Rya2NsamYzMVN4UEV5TWxS?=
 =?utf-8?B?dHJWRDFrQ1Y4UC8yMC9vWnA5UXBQblA0QTlKNEhZRXFEdWJ3UTRuUkM1T3Ru?=
 =?utf-8?B?L09kTlhTZnZEM0VpSVQ1L0hhS3U1djJFTmF6WURpekYxQi9mNjM1MTVFT2dG?=
 =?utf-8?B?Z0RJNVJUOGxhUXpkT1FuMXJGZm9tdnVtU1NYS3hleXFVM1AxNnN0S2ZpeCtv?=
 =?utf-8?B?UkZCRHZjUS9hWHMwWnlRaDQ3R0Y4Z2dYdmxNeSt2Um9XN3k4QW9oVllCZEMz?=
 =?utf-8?B?U3Myb281V3crQi9WTzFNUE5Qb2p2clFGSzA5NTI0RWJWUjNmK1BxSGRHUzE1?=
 =?utf-8?B?eFV6Q3JKZHMxQ3hkUUFqODcyZU1jZDBhbEN0NXU4RTZCRXRNTjREZmNjUUhB?=
 =?utf-8?B?Z05GN0NRYk5mSU5XV0R0eEFUUWZReVBkdXBJS0lCbHhoMXE0Q3VqMEd1bzd2?=
 =?utf-8?B?aU9ISWZrYVNsb2RwZXBpWEVIRVZ5aHF1dlJObUdCL09DVVRkSVQwNkY3UFZY?=
 =?utf-8?B?aWhxUUNzdUxpU3lJSHhtejloV3dvT2dZS2haa3J5ZXY1L0Y3NUZnWkRRWkR5?=
 =?utf-8?Q?R5CUhEVWq9Z/XZVNwyblzUelIYYe2PpB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTRyUWZTeEdpUVZ6dHE5NFVRelViUHVXWENpdDdqRFplQlJ6MlZNenIxTWk5?=
 =?utf-8?B?RGhvclVKV2pRa1dSZFloa1JhRjd6SmJBUlhuNi94azFCSVhSeUg5UmxGNnFK?=
 =?utf-8?B?TElqUWlCM2VHb3JmNkZBUjN6MW1JbXRrMnZabCt5OHJoQjhjc29Qb1l3SjRx?=
 =?utf-8?B?UjRkZTBzQWxjK1dMZVRrWldBYnVkay8vQnJ4NHVzNlVBSm1FbEJMMGo2QmtV?=
 =?utf-8?B?TWsxbnNzTnR4blF3eG9EaGF4RmFjNlYxNkNFZWFYZmxJTGlZcTdLbW52S1Zu?=
 =?utf-8?B?ekJIMEd2T0oxZ3A5VTB2dVpKb1NKd1h4ZWVNSHlWSUVQdGJRZjIzN0M1VzhE?=
 =?utf-8?B?NnlyVkc0TndGZ2NKQzhDYWdxYnc4bmQrWHdtRzdiNFljc0hmVURxMVFTTHJ4?=
 =?utf-8?B?bDdvQm9UMDZuRHc0NENqVnBmdWlHbGlhVk1VZjdxL0pRbjhnUDRoRUUxTTFi?=
 =?utf-8?B?L1p6RkxUYi9vK3J4MjRSd1E3QWdYVFZvd3Rzd25Ma08vODBtcWNJUm1xN0Zh?=
 =?utf-8?B?KzZtM3Uvb2twMzI0ejM5dFFDdlpxYmc4Mk13bTlBYVhmWjMvc0E5bmpOUUh5?=
 =?utf-8?B?amIwcVhwbXZUeUNZc2tFNUhlcGNrd2t3bHNlb20yd0x2MFJ5dFpuRTh2MlVi?=
 =?utf-8?B?bzU1V3pIQjY2REovQ1JSaDRzSTdCMmoxYUR3alRBNHRoY1Fxd2FrbXliTXgz?=
 =?utf-8?B?QU8xWnNoUE1HelBUcnRMVFN6ampQN1JTVjFoUGR3dGN2cDFRZ1d0MFg3cmJi?=
 =?utf-8?B?Q25jZlN0TDJONWk0WmJVZlphdHZWNGJOd3hrYWgrU3JsNWhHQ1gwNm15VUdt?=
 =?utf-8?B?ajZZZE1JbnVZc3VUNmJWWTFOaWxXQmF4Tlo1QzVQNzlzVit3ZDJlMlVrODlr?=
 =?utf-8?B?Q1UrVklQTVQzQit1N2d3Z1ZtTU15K0J1M2JuWkE1NklleXBjSC9XdFRnaDRG?=
 =?utf-8?B?ZjBubTNLOURYaUY0M3JybkJEaE92QXRROC80N1FiSEFndi8xMGVnNmJtQWxW?=
 =?utf-8?B?MjBDNmJ1MWJxWTdHaTEybkFzcnQ5c1FzamVqOTJreXZwQkE0MmRVQy9OVm9P?=
 =?utf-8?B?TU9hR0loYStGeHJWVlpkcWZzT0RoRVZNVnBuWXhqYzVZUVJtcDBvUENOaWV1?=
 =?utf-8?B?QTR1eHVJbU5FQjhPOHVNWVB6LzdldDE0V0dmdW5aQTExVk40NHVYTDRIc1Bx?=
 =?utf-8?B?cG9FTW1yTjc3a3dPY3E0ZnhWdU9UK0tiZXkzOHdMbnFCdG9DQ3VFNXN3OTh3?=
 =?utf-8?B?d1RkUU5hUWNzaTh1blNPOGdKL3lIMENmYnR5b3JvQUtZMGVTQlJ1bnBnOUVl?=
 =?utf-8?B?NExkUkFhengxc0hTQmJ5ZW9KaUlLM1hpcnNlVm1XeW1uTnFxRnEzdDR1amRM?=
 =?utf-8?B?dTBHc0t1U2tZSE1rTHRWTzdIZk5hbzBTT1k0cWl4eExydHlyMEF4NWErM0or?=
 =?utf-8?B?Y0tPY2pLV3ZrN1NlVTZlVmhNY1VKeitySGxjdnpuWTBCTVBITko5YWVzTlVk?=
 =?utf-8?B?Mm03Mm41VDduREh3MCt0RDRsaDQyOVd6TVdBTnVwWVZaMFRZZGxvTWhmUEF4?=
 =?utf-8?B?NDJwQ3VrM3lRNWN2TDZtT1d2c045VStTWUJtUWMyWEpBblZYQ1lNMFR3bGVJ?=
 =?utf-8?B?VmZOcW1FYzlLSmtZWjVRT3dZSE1DckdNdUJWUUl0TmNwWlY5Q0J1eFZoV3NS?=
 =?utf-8?B?VEVLZndlWkNTNEswRUw0OXlmc3hNNXRRaXBtSWNFTTR5eWFUTWFwb1FLeXFz?=
 =?utf-8?B?cjd4MnBMUkFWaWpUVk9ZeTFoWlNoUkUzaERBd1g5cCtqVy8zRzgzdjF5Q2dB?=
 =?utf-8?B?NzhuT3pRWS85SHZWelFHcjlGZm5iblpHRjZMQ0w3bUowTFdqUGhyV2dDbHdH?=
 =?utf-8?B?Yi9VYkJlZEpESC90MWpqU2FQVWZ2N0xEMGFhYU1JREJSdWd0clptUzZOY0xa?=
 =?utf-8?B?MStEZ2FOK1M4TkYwbGRSUHBOK2U2ZWRpVzRyQ0MzaHJzcS96b0tQR2NHdisy?=
 =?utf-8?B?R2JaaHZQR3FLeWwvWmthMnBlYlBoZUdMelRhb3JTK0s3Zi9lek1qcllNOEhE?=
 =?utf-8?B?YklIVDhOY0JSSEplT2Z2ckxrT2dhSFpDa3NlR2JCYUw3a2txMFhIUVpyK0k5?=
 =?utf-8?B?NUdPeFpGck9FYlpZSTJYODZMTUZvcXRjdE9sUFdlVHRGdi9EWllUNTdwbHJo?=
 =?utf-8?B?T2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4610d326-64fc-4691-4c4b-08de0af98146
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 08:13:06.8723 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4pboyOuaDx0Pk4n2RgX1tpvNeborgNDNKezNR07GeTxQfccayKE7gQZbDbdtx+jvEoJIPVMuSf36wcOq+rwzOxF4SaoHBGSM8x8EkpGEFdo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8172
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


On 10/14/2025 13:34, Shekhar Chauhan wrote:
>
> On 10/14/2025 8:54, Lucas De Marchi wrote:
>> From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>>
>> Add support for graphics IP Xe3p_XPC having IP version 35.11.
>>
>> Bspec: 77979, 77975
>> Signed-off-by: Balasubramani Vivekanandan 
>> <balasubramani.vivekanandan@intel.com>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pci.c | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index aa8359a4c5594..83e5e0c314a42 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -119,6 +119,15 @@ static const struct xe_graphics_desc 
>> graphics_xe2 = {
>>       XE2_GFX_FEATURES,
>>   };
>>   +static const struct xe_graphics_desc graphics_xe3p_xpc = {
>> +    XE2_GFX_FEATURES,
>> +    .hw_engine_mask =
>> +        GENMASK(XE_HW_ENGINE_BCS8, XE_HW_ENGINE_BCS1) |
>
> In Bspec, I see the number of RES_COPY_ENGINES as 0, which signals 
> that there is no BCS0. But, at the same time, I see 
> SERVICE_COPY_ENGINES as 0. So, why are we having a mask from BCS1 to 
> BCS8? Maybe I'm interpreting the table wrong in some way.
>
> But, aside from this change, other changes look fine, I can provide 
> the RB once the above query is clarified.

Forgot to add the name/signature here, so, for future conversations and 
references, adding it now,

-shekhar

>
>> +        GENMASK(XE_HW_ENGINE_CCS3, XE_HW_ENGINE_CCS0),
>> +    .va_bits = 57,
>> +    .has_flat_ccs = false,
>> +};
>> +
>>   static const struct xe_media_desc media_xem = {
>>       .hw_engine_mask =
>>           GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
>> @@ -151,6 +160,7 @@ static const struct xe_ip graphics_ips[] = {
>>       { 3003, "Xe3_LPG", &graphics_xe2 },
>>       { 3004, "Xe3_LPG", &graphics_xe2 },
>>       { 3005, "Xe3_LPG", &graphics_xe2 },
>> +    { 3511, "Xe3p_XPC", &graphics_xe3p_xpc },
>>   };
>>     /* Pre-GMDID Media IPs */
>>

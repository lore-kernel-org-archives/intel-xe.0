Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78DC3E77188
	for <intel-xe@archiver.kernel.org>; Fri, 20 Dec 2024 21:15:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4539510E4EB;
	Fri, 20 Dec 2024 21:15:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jvnLgJ5t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BA8C10E4EB
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Dec 2024 21:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734729325; x=1766265325;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jrcq9MVn604YKWShfvba3G5BbqZzJ6AtxIO+W4Ww9hw=;
 b=jvnLgJ5tvmWea9S20y9o2J0Qd5+R3Mi8jHi0Gdc0yR8E0mlOCalDie9y
 O6joNPWhDj40jsTXEFgEC7CVz+YNpb2mLHBWHXU7wHhBW093t8G71FR8B
 b4OerOgFdGwpxBw6J0uLOXKM3/Jf2BG4udngYPAjupGan940lt8i4lZQ7
 X8DQAZXkDci5krqPDJdpWXa0ZbiiYaxk6uH1BGAr5Wz6KIjptXQmsG2Zn
 nhvjZEFnZZzD11YKtWzdfYa5cCq7JkBcsz6zQcwebvSZitEvY9lEjAoXq
 ov6l8F3m+TjFfafBJUArcMlDEpibPA5hfrfU7W9/uqUrUswi1i+/W9/gs g==;
X-CSE-ConnectionGUID: QEGxBaxTRSazEBZJYjIing==
X-CSE-MsgGUID: aIg+kCPtS+a3N/mJxwbg3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="60672604"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="60672604"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 13:15:25 -0800
X-CSE-ConnectionGUID: 4GiHLrp2To+ab/MNJ+j3QQ==
X-CSE-MsgGUID: t9dGqo2ESueo4ogQu2rAww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="102730928"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Dec 2024 13:15:24 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 20 Dec 2024 13:15:24 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 20 Dec 2024 13:15:24 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 20 Dec 2024 13:15:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lO17LwPXhBbvqmRwN3U6cEO23EQugyLKl7CV8y2cjwUzwxMDS4RZVQ4DC1S+MzQfn0+Et9Z0vHDAXoTQKxcVhOmSfhs0F09i98NFDO4kTJ1u/0TCjd39giLQeNWjOjujISoZfahY0BSYdvbhAIfgGQY6MDxcpWzx0GO+Gvn/j26+qn9ivQ4lge+fqkAezEGNomrJFjdEEfM7RzztSzkSuOsdJ16G5ABe/NqnCquNVOMEKyBU7bC8A2TObnSPTtLFQAkkMaUIxQ0kuyew6YLIUzeRZlgCoydlWM06AUQxGtN/AUNvmmGyRirxteUpLiYom/aiDYav6geoRxFDw39Rlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LbhPg5lomexVvSnhcD46oLp5dnylDuPaxjcZ+V4UBZI=;
 b=SnS8zruCTBP7Fi/RBFImSRMr70ncJQBPIg42a/0PlJoTKbJ+Tmn7Pqp0cL2gFgWp1js8OylTi6i0HfBN59Vphx+mvm+S5M6UZDLJgRl1h5rnoRUZ71Dm9m3JLKTwzf+/E70Uk/14354NyQ97DYvoNPmmM8EK3yObksKlPerOw6h4eDGfLTsyUajrmwk4t5mI3y1TyfnZdUXsmsQKHljoDvx3TZpjERjhqHE/ZLux/ed0G6HtAgn57pwBLFmDw70UXqW7yI5rvdbYTOmDX8Gu1IMjpX7S9Fd4q4SzREYgXRYvlhA+pr5xa/Hdz5g4//iXW1NJcwhAQU0321eF8j4kfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by PH7PR11MB6650.namprd11.prod.outlook.com (2603:10b6:510:1a8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Fri, 20 Dec
 2024 21:15:08 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%2]) with mapi id 15.20.8272.005; Fri, 20 Dec 2024
 21:15:08 +0000
Message-ID: <1035f01c-92dc-430d-a87f-2e7ac12fdb35@intel.com>
Date: Fri, 20 Dec 2024 13:15:07 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/4] drm/xe: Add locks in gtidle code
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20241220205927.441082-1-vinay.belgaumkar@intel.com>
 <20241220205927.441082-3-vinay.belgaumkar@intel.com>
 <Z2Xc8GpN297TI169@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <Z2Xc8GpN297TI169@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0218.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::13) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|PH7PR11MB6650:EE_
X-MS-Office365-Filtering-Correlation-Id: 38f99cdb-7cd4-41c2-95c8-08dd213b61d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eGMzVmxCdXI4ZlQ4azBFNmRuYmpXYUZERmxIMTF0YnRLcit4Zis4UjIxZzV4?=
 =?utf-8?B?RFBwSXgyK1JQVGdLSmlwaEl6SHl5eG1FQTJIMnYzYTV0SmVoOStWYkNPU1NZ?=
 =?utf-8?B?QldxelI1OUt5R0VkTW9pL3JyMnc4WDZWcURoemxvVUlVTHFIRGcraDh5UTho?=
 =?utf-8?B?NEo3U2Y1V05lbTNUTE1xQUt1MGYrNEhVb01qRkVtZVB6SC9kcnpxLzJSSTg5?=
 =?utf-8?B?VEdrOEJtYzR6TEx6UDBsanJVNk5Yc3RTRVNNeC9kbFRjU1JSUC81SmhHQmtE?=
 =?utf-8?B?SlJ6cnJOS3V1QVArUzZSZWQrZThIRW1LSmZKNWR0TTRnQ1kyWHdRZ0dEb1Bu?=
 =?utf-8?B?VkJCNDM2bFI3ZU9VdjN5MEhDOURoQVJ2cVV1aFlJcTAwVjBGZC9ESi9meEJV?=
 =?utf-8?B?SG5iSEhFY3JxQXBuVDJlcDJQdnc4SlhXZG4zeHFnZ092eUN2emVrOGJFYi9B?=
 =?utf-8?B?MHlydkdDM000R2pSUFJxYnlhQ3dkbStUT01WSkhxRHpOd3NBRkJGdmVaYVV0?=
 =?utf-8?B?Ty9menN4TmFVMTlpK2gzdmM1ekpmS0FIenB0TWJCWHhiRzlDVC9SckZrNjNW?=
 =?utf-8?B?TWVxWCt2bldLMW9PNWFpT0pXZTJIdUZJNkZQb2NFRGRIbDJ5WUVZYmRMc1RH?=
 =?utf-8?B?Ym12Q0hMa1ZiVWlQa2dLNmdOeGJiWXkxWHlJeTNUNGVvSExyQzd1WEUyY3R0?=
 =?utf-8?B?TFZpRHg3S3ViWUNOYXJTZUZMdXlHR0xOSUJydHoyQXNqMzNKSHpBUVE0b2Fy?=
 =?utf-8?B?dVg3ei9BYmsyb0lyOG02dlY3N3ZlSVlPcUpDcHc3UW9TZ01BbFpDKytPN1Iw?=
 =?utf-8?B?a3lkQWMxemNNb1RsZFFTRGFMK1EwWW9nMVViN2xXbUROWTNMOGhlaDc2eXhk?=
 =?utf-8?B?bERURlYwV1I0OWZCek91RGFZR3JGa1hhWmtRdGY3YmMrdng0blpiZE5KRUVu?=
 =?utf-8?B?WnVmV09QK3MwWjRCWVJMb016WDEvb3pkbUZHZnNwMVljR1M0WStPUU9HTUIx?=
 =?utf-8?B?Wm4vaURlU0JBak9Zb3lERnBsZG93emJhbEovMWNDTjFhZGlkY3B3TWVGcFZN?=
 =?utf-8?B?VldHcnFFRHVJbldlTFViRzNwcnAvL3BqRk5oU0JEc2pCVm5FVEs5bEpUOGxw?=
 =?utf-8?B?WlFJWUtOQjRLMUFTL1h5TVpsYTMzUFZBdWNVKzJ2Y0duQ2l1VGIxLzU0eldm?=
 =?utf-8?B?UmlDNEhaaTNxSFhnN3IzdkQrSmQvOVArZlg2VFV3OWl1QUhyNyt1MEdINFVv?=
 =?utf-8?B?T0s1ZGwyRTFMbXl6eS8zMFVHYWNhTWRYbmUvYTAvSUhJdWNTMDlaQldZSGhB?=
 =?utf-8?B?c3NreXFiRjR5czBheFhaSTMrS0h3WEI3OEpZTEwrdlNqRHZKTFZTbXpBa09u?=
 =?utf-8?B?ZTg3NFcrNWZ1Y0tTVEtpVGxrNU5yaXA3Ti9LZE5aQ3FQSnNhQmNqSjFtSzNl?=
 =?utf-8?B?TWFudFNzNFdzMVJMWkN5RFJBYi9BYkJ0RHBsM01LZFd0ZEUrZkt5VXpxMkxD?=
 =?utf-8?B?RkhIRmI3WEgzVVFsYVdUeUs5dVp6ODFMQUd3RU1CN3ZEVktKV0ZTbFBpZ2pR?=
 =?utf-8?B?TDVZSFUwdXBYcXhkb1dQWEJqa1FNT3R4dVJMWFZYVlN1bEJ3Smt3WFJ0SkZS?=
 =?utf-8?B?YjdNSVdxaTh4b3hQSFZYYWZxbzNRd3lIN0hPZHpMUzhqaFpDMkU5eDFFeDc5?=
 =?utf-8?B?WEFlZjNaR2J4U0xkRGExcUNZMW05T2hvZ2x0QzJVT2NHL28waWxCdXBXVDZj?=
 =?utf-8?B?bHh4ejRUdUxRMmZWaXR3RnNNb2xwRm5BajFHMzAwVWkwdGd0UkowTWhLWWJE?=
 =?utf-8?B?QldiZWtDK0xtT0pHQ2o5bllVOGVvc05PeU1ZeFpXd3BLRmhFSVhIdGFWTG9V?=
 =?utf-8?Q?zTGvAqSoOhkvF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHl5WjUrUEtlamp3cUs3bHFXbkJwTldvckJXTzJaR2JheDV1bzZ0RHVvaVFW?=
 =?utf-8?B?ZmVZM2gvYW9jNGdZb1ltcTk3Smp1eTdUSVFMS2NhWDhaZEFEUDVJcjBmeWx2?=
 =?utf-8?B?V004bXE4bHRCUmFOc3A0a2hxVTJhUHJjSDNYNUNML2M4UHBrdjJTbE50Y1hS?=
 =?utf-8?B?NkxzSmtBcGx2c0sxNC9xQ1l6OCtCTUJ1TThWN2sxRTlMMVJUS1ptMk0rZG8v?=
 =?utf-8?B?TnRZZURxcU0zSG53b2JwUG1KTXNTL1ptaW82Nk4vL3o2YzlIYzI2SVVrbWVT?=
 =?utf-8?B?bElPOFAwUUVNUUpoZUhtcGJ6aTUwMGxnTGk3blYxOEdTVjFpbm9rWkJ0UGMv?=
 =?utf-8?B?R1pxb3RvZW1nTWJoQnhRUWZrSnJzTm10S3dXc0V3c1d1OFZVbHI4ZEhUV3J0?=
 =?utf-8?B?M1hQdGpDaGI3dXh5YlcrSVU1MHN4TlRYWTBGRGppUjNSSVFTODlERDBJTDcx?=
 =?utf-8?B?MExPeUVockdhNVRrRzZKNG1BL3UzRmQrTS8rRXVUY0xFaUJmWnNVK3Y5eUMr?=
 =?utf-8?B?ZTdrbmpPeGtNK1RyT0lJdWZyN3RGRGFSVGRwQzJoQWNlRHU4cW8wUVEwZ05E?=
 =?utf-8?B?L05zaGM0V2VEdmRxNytBc2ViQTJJako0MXlWOTV2bXJiUDUvM3UzWG4vNlF3?=
 =?utf-8?B?SUx2bSs0Y0xGb2VYWmJYUU1jemt5Y1Y4SzJHTmpmUzQ3QUZUSkxZTFN6S25T?=
 =?utf-8?B?ZnZDaEFOMVMyUmFlV2NTUU5scGtYT0NhU1J4dm00U2tWa0JMOHlYUVd5OGZB?=
 =?utf-8?B?QjlkWC9WYkx0UG01VWROUjY3dzJHTWlmY1RRWHdGSzdwQisvQUJBcHo4bmJl?=
 =?utf-8?B?YmZ2d2d2ZmJxcUVEYVVnMlREWkZiWjFLU0lFMGwvcVRvNTgzYy9SNTY5MXpa?=
 =?utf-8?B?VHVCUi9aSHNiWUV3MktzRzRVdkxxYk5PQ2pLUVFsM1FvaWs5bmlKalJqTFls?=
 =?utf-8?B?RzIxTmZOMjBhSU1Pc0J6cUNhc0M0ajQydU8vYWZ6ZUxrOWxYVVVtQnhxMWFK?=
 =?utf-8?B?S1dWWGNheDdMQkZHRkNEZmQzK3JyYklVZHNxZktlWVBaRG9SL3h4Q1VwQjRB?=
 =?utf-8?B?anNSZEkyMks3Sm5iY2R0dEEzZkl2TkRXdHZhYVFuVnhBb2piNXlCaE5aai9L?=
 =?utf-8?B?L1pjQWdPSDdwRVdleVRqWTZ1NGpMNFZ0TGFVY2xJYVBvemhyOW91QmloVmN5?=
 =?utf-8?B?Vkl5UVJRZk1BTEljZTJsbzBabGdzRFo1UG5qNFYyYlBzY1pNRXk2UHpVMUFL?=
 =?utf-8?B?VldxeEgzUWJLeFl1NnBWS290WWlLc09tK3ZvNVVGclNTZFFMNkxCckZSOXhY?=
 =?utf-8?B?cGY4cElXdUVCaENXYW0yU05xN0R4bTdwZHBsMEVVdG85cjl1UG5yaVVzcTV0?=
 =?utf-8?B?QjQ3ZU5BVERTUDQ3c1pzSFA0L3c2NGs1dVJPVStJeEdFdEZCcytJVzdsdElB?=
 =?utf-8?B?R3UyWlJGVDh4VDFjd3E4amZnbW1iZWRYVytjTnJtbC9DUlNPWnhqNkdFb1Er?=
 =?utf-8?B?K2EzeWtya1JJYmVqS05iZ0RQdEpqSWNQdkhJNUpwalYyMDZHRGJMT0ZUMlA1?=
 =?utf-8?B?Zm9GMlRXa1RWaDVjTzE5azdxMktGVVlxMWlKS3hCaWVocEQ5RjRNcVRBYklP?=
 =?utf-8?B?NjUxdVJIVlIxYXdOYWxKSko3b0xub2h3VGVhMitONnN5UTFObXV0MnFtRThX?=
 =?utf-8?B?ZzVtSHpPV0RMTFZUR3BNalZBcWtZdVV2ZFRDTlZEQUMrczNLOHZPeW9iUzBy?=
 =?utf-8?B?NTdlbytRUkdHL2huU0NsVlliTHkxMU9DclpncjJsRGpUbGlCY2RNaXhKejBQ?=
 =?utf-8?B?anBFMldxbkw3VUtWYjNXZ1NnL3pmS21mM0tLczNNRGdUL3BGcTA5c2xTSTRh?=
 =?utf-8?B?ZGtyc09jak5oTEFxSEl2WlpacTRvakxNUzJJWDRMZlFPQWJ6eVA5SDBhMHIv?=
 =?utf-8?B?T0Z4QkVsZTdDSm9xTWtndGp5b2o0eFZEdXc1V1pUb1dmRVlvRTdGTFhYd3N1?=
 =?utf-8?B?RWc3dlgwYVVjaG1iT1hTdkF2aGY3bjlHWmdKWW1Vb210SVJQQzR1dnJXSExT?=
 =?utf-8?B?NUhDNDFLTzlRUkducXFjWWovYmQ2THJmVUlxTkp3eUpUQXJzUEQ5RTRTV2o1?=
 =?utf-8?B?N2RTeUxyclhrUTlid1B5K0poNTQ3dktZYkNhUEs3U0czbUZseXBJRmVEaDBM?=
 =?utf-8?B?Q3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 38f99cdb-7cd4-41c2-95c8-08dd213b61d9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 21:15:08.6635 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cnjM96dv0Xnm7RUa0MbkvivztO/dQNmjcC6vkqB0fMJ3x/PQanP45devhhGbdfIrBbF5mCbYZ04XARPmN3HGbDc+Y8lE87oeiKaBdyUVPMY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6650
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


On 12/20/2024 1:09 PM, Matthew Brost wrote:
> On Fri, Dec 20, 2024 at 12:59:25PM -0800, Vinay Belgaumkar wrote:
>> Another entry point is added so PMU code can call into the gtidle
>> method for residency. Add locking so that parallel calls to this
>> method from sysfs and PMU don't give inconsistent gtidle states
>> for c6 residency.
>>
>> Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_idle.c       | 23 ++++++++++++++++++++---
>>   drivers/gpu/drm/xe/xe_gt_idle.h       |  1 +
>>   drivers/gpu/drm/xe/xe_gt_idle_types.h |  3 +++
>>   3 files changed, 24 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
>> index fd80afeef56a..1f32ac964abe 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
>> @@ -69,6 +69,8 @@ static u64 get_residency_ms(struct xe_gt_idle *gtidle, u64 cur_residency)
>>   {
>>   	u64 delta, overflow_residency, prev_residency;
>>   
>> +	lockdep_assert_held(&gtidle->lock);
>> +
>>   	overflow_residency = BIT_ULL(32);
>>   
>>   	/*
>> @@ -273,8 +275,21 @@ static ssize_t idle_status_show(struct device *dev,
>>   
>>   	return sysfs_emit(buff, "%s\n", gt_idle_state_to_string(state));
>>   }
>> -static DEVICE_ATTR_RO(idle_status);
>>   
>> +u64 xe_gt_idle_residency_msec(struct xe_gt_idle *gtidle)
>> +{
>> +	struct xe_guc_pc *pc = gtidle_to_pc(gtidle);
>> +	u64 residency;
>> +	unsigned long flags;
>> +
>> +	raw_spin_lock_irqsave(&gtidle->lock, flags);
> Why raw spin lock rather than just spin lock?

Lucas suggested this as  the perf subsystem uses raw_spinlocks, so we 
cannot use spinlocks when the perf calls into Xe.

Thanks,

Vinay.

>
> Matt
>
>> +	residency = get_residency_ms(gtidle, gtidle->idle_residency(pc));
>> +	raw_spin_unlock_irqrestore(&gtidle->lock, flags);
>> +
>> +	return residency;
>> +}
>> +
>> +static DEVICE_ATTR_RO(idle_status);
>>   static ssize_t idle_residency_ms_show(struct device *dev,
>>   				      struct device_attribute *attr, char *buff)
>>   {
>> @@ -283,10 +298,10 @@ static ssize_t idle_residency_ms_show(struct device *dev,
>>   	u64 residency;
>>   
>>   	xe_pm_runtime_get(pc_to_xe(pc));
>> -	residency = gtidle->idle_residency(pc);
>> +	residency = xe_gt_idle_residency_msec(gtidle);
>>   	xe_pm_runtime_put(pc_to_xe(pc));
>>   
>> -	return sysfs_emit(buff, "%llu\n", get_residency_ms(gtidle, residency));
>> +	return sysfs_emit(buff, "%llu\n", residency);
>>   }
>>   static DEVICE_ATTR_RO(idle_residency_ms);
>>   
>> @@ -329,6 +344,8 @@ int xe_gt_idle_init(struct xe_gt_idle *gtidle)
>>   	if (!kobj)
>>   		return -ENOMEM;
>>   
>> +	raw_spin_lock_init(&gtidle->lock);
>> +
>>   	if (xe_gt_is_media_type(gt)) {
>>   		snprintf(gtidle->name, sizeof(gtidle->name), "gt%d-mc", gt->info.id);
>>   		gtidle->idle_residency = xe_guc_pc_mc6_residency;
>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h b/drivers/gpu/drm/xe/xe_gt_idle.h
>> index 4455a6501cb0..591a01e181bc 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_idle.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.h
>> @@ -17,5 +17,6 @@ void xe_gt_idle_disable_c6(struct xe_gt *gt);
>>   void xe_gt_idle_enable_pg(struct xe_gt *gt);
>>   void xe_gt_idle_disable_pg(struct xe_gt *gt);
>>   int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p);
>> +u64 xe_gt_idle_residency_msec(struct xe_gt_idle *gtidle);
>>   
>>   #endif /* _XE_GT_IDLE_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle_types.h b/drivers/gpu/drm/xe/xe_gt_idle_types.h
>> index b8b297a3f884..a3667c567f8a 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_idle_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_idle_types.h
>> @@ -6,6 +6,7 @@
>>   #ifndef _XE_GT_IDLE_SYSFS_TYPES_H_
>>   #define _XE_GT_IDLE_SYSFS_TYPES_H_
>>   
>> +#include <linux/spinlock.h>
>>   #include <linux/types.h>
>>   
>>   struct xe_guc_pc;
>> @@ -31,6 +32,8 @@ struct xe_gt_idle {
>>   	u64 cur_residency;
>>   	/** @prev_residency: previous residency counter */
>>   	u64 prev_residency;
>> +	/** @lock: Lock protecting idle residency counters */
>> +	raw_spinlock_t lock;
>>   	/** @idle_status: get the current idle state */
>>   	enum xe_gt_idle_state (*idle_status)(struct xe_guc_pc *pc);
>>   	/** @idle_residency: get idle residency counter */
>> -- 
>> 2.38.1
>>

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7037FE9A03B
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 11:31:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25FD210E242;
	Thu, 19 Feb 2026 11:31:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dq2sYVnj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9680310E242
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Feb 2026 11:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771500660; x=1803036660;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GB5UonLVjFR6cGyeQxtbF9VEAikcPggC0CqjyD4/0RE=;
 b=Dq2sYVnj3x6V94ZIc47i+OAPaKhUhahycO/cptiSCvdh4pLssu1qChsk
 dxeifzjeRdA6Rxi9GcO8zthv5JKaYmFtJySNc3i2TzqNachGAOPS9IT0E
 OPdoOPwdwStwZZggiuc5C5AuaEAZn87csvc/Af8MLtxdGyw4uzkvd8k+h
 TQC9fSiOB+7vvW2aWfrZIAycLDNLwYDypE+ErHCC3MDw4IffIGD4DMKQr
 TYZEXpBgJXYhnIWF7Chp7iaXwZaDp5LJkM7gPx0czkqogw/uuYBlomk5c
 bC34BwtHKngQ4NXgmgKa40TT08lqBX7QIH4+9B5hT4R3ZQvI4lUoWggAe Q==;
X-CSE-ConnectionGUID: UuDVFJUtR0SMPmcfSAT6Aw==
X-CSE-MsgGUID: AzW8IFYgRVa3xYgVfACTwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="76417082"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="76417082"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 03:30:59 -0800
X-CSE-ConnectionGUID: Z4dBonO/SMyw9cKhfRA9yA==
X-CSE-MsgGUID: htPZJ6SmRwWxaAIvPF8zaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="213578762"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 03:30:59 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 03:30:58 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 19 Feb 2026 03:30:58 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.33) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 03:30:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UXPSFD9ODZj8hxJuxMOzuZLqFFtxuhx0BDxTRglnQlgYRoOxof5suQuw5Ht5iqAqYG17R9Rrye5kq6r6M5Gst5vbsFGk8IPAhI0rajn7ScQ3l+hm1SSMg30DSuJcOp4P5DQBcXEWav3OWzX3/qrhkArPNj07iunBLMGC6YUNrSdtv8UsgZA2rW4qoDpztm/IYymqWgjev1ZHWtFlIC8EjZGugoQNNLEgz0wCy6QtOWkTcSj0TvIFYic08HAun1cyGkkqUQy7KqoXSfoQ46z3jf2DTEgMBk7Avgle8fQGd11TM0qxVJ3zqbkLw1gXLIkM2Mz9QiWxBo3ftCR4Yvkh1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nk85cSqYzVq/zvOzd0SxN0taTO7i5ZH904AaW5fKjcs=;
 b=B2oIoV30p2jskCIJHYw9Hmn2u3dEcdqhmcxfr4+AJKeI1qaHWyWq4BsK/PTdBGN58Bk5U9ms+elRpd38NoxJT/U4KYqYGOhHIWZFewEO4ZPi1JPeERgGiDbuC8iOst82ZtkPyacCkd7ZSPDXJ8C+Jtj6mJCPdB99JkZuskAGwUs4+Dmn5QVkz9tN3qHKf2wtRm+uJQUCJqI5cf+D4TX99l8bWtKg3PB4mBBpZJ5p5KBt5i9aZIugq0CZanyB7hvAUX/r9BDYJya4ADvkxDorvLWOPVHHuSFXsY66eQ9WusaQ5D07ctpjhvMkf5z65JzCFOVnUuAxiH1WQT2BXbXkLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by SJ0PR11MB4782.namprd11.prod.outlook.com (2603:10b6:a03:2df::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Thu, 19 Feb
 2026 11:30:50 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f%4]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 11:30:50 +0000
Date: Thu, 19 Feb 2026 17:00:38 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: drm/xe/wa: Steer RMW of MCR registers while building default LRC
Message-ID: <aZb0Xt67X519vK9p@bvivekan-mob1>
References: <20260206223058.387014-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260206223058.387014-2-matthew.d.roper@intel.com>
X-ClientProxiedBy: MA5PR01CA0229.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f4::8) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|SJ0PR11MB4782:EE_
X-MS-Office365-Filtering-Correlation-Id: d7443e9f-79d1-45fa-6888-08de6faa5596
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bkJJSy80MUs2Y2hnN3AwYnVoYmcvZ2RGbVBiNjZ3K2Rhczd5ckd1aFYzMDI5?=
 =?utf-8?B?RjFKOHJVWkZ1R0s2Tld3ZURIZmVnYUdqc0xMSFBzZlBGRWg0cUNoTkQ2Y3FV?=
 =?utf-8?B?MnNmTCtnZ0JGQmVJbnV1NC9rRmFkTWRoanIvcy9qT01CcFFLL0o1T3U1UGRu?=
 =?utf-8?B?Y3diemg5eWNBZTdpY0cvSUhIT0xycDlta0E4cnBOTUsvVGpwZ25oTzFjcDll?=
 =?utf-8?B?ZWlYSTR6ckFCZldEUHVJYjBpMDRVdUt0U0k0WlpPSlN2dSs5RUZ0NldBdzM4?=
 =?utf-8?B?TlRocFB0QU5rN1BSNGhmUE1tZlJMcHV4OGswYkl5M3dnM01YTEt4OVhLMmJV?=
 =?utf-8?B?KzlyRU8wSzFGME50dnk5My9FSGkrQWlzUUhwR3dYbkd1QkQ5WkZDVmthNVhv?=
 =?utf-8?B?eXpGMWx6ZTJpR1JRb3hNK0p0NndKWGQ5Y0FZcE85ZldxeWVlS2RJcWNLdTNu?=
 =?utf-8?B?V0hsZVVTWkphZmpNYXU1ZVRrcTRORXAySkhBb085VGp2eHlSK0NPU2t1VkYx?=
 =?utf-8?B?Qy8wenpQNXN6a2RjUll4VXBKcWxwS21CTi9hT1pZRlpRTFNpRDI0Y3RTV2NT?=
 =?utf-8?B?a24zR0U2MDdkcnJ5R2w5cDcvcWlxbjRjZ044MzNRRWJXMlVBTHhRanZHUTRo?=
 =?utf-8?B?Vk1mcWd1RDlRQUlIeEFEdmcxMVZyYjl1WDczRXRwSUZFUGxFYmNVLzNFaHVz?=
 =?utf-8?B?Y0hZOURHQms5T29yaXRHa0xJcDE2SVZmQmZNeTBvZVlnV2R2RDRqcEhNWkxt?=
 =?utf-8?B?N1c5Z0tEWk01QjVDZmJxY0ozOXNMK0JBcWJtOERPSTc4VmtnT1IraHJuTEZh?=
 =?utf-8?B?T0hNSkd1UTBybnpxMGJycDFiSVFDQU0rQ1F3Q0pzNkdrandINUwvQkNkR0F6?=
 =?utf-8?B?UGNFR3IxQ1FBMXBJUnViZDE1UHdqaWFkVTVGNXdpVlM3ZHF5NGZzOEg0RHpS?=
 =?utf-8?B?K2Q1QkJzMjlkR2VhQ2tnRGVjUGVZWFZGOVRJTGNyWkI2UXVTY1V5ZGNkanNx?=
 =?utf-8?B?UDR4MUpaNm56YzhoZVF6TlhEQ3IydlZjMDZJSW1XbW9zRmhPaXIzYkpKTjZR?=
 =?utf-8?B?RG5KcFpRWWpSMUlXdDRFMWxoNkZIWk1Tc1NvcEpXeExkSzhzbmMyc255R1Rl?=
 =?utf-8?B?ZG9MTFBrVU1BQkgrWGEzWGJ2b2plUTFVVkRmamFFejZWNDZzdHRZcnJiSG9u?=
 =?utf-8?B?OTU2YTVVVXU1Um1oQXZkaDBCbHdRUlJlZ0ZCK1g4QVFLQkQ2Q0VJa2FCUDFt?=
 =?utf-8?B?TVVYbGIxajZhbG9TSERHdm94ZFBEektDL3E3UHorTS94NDNqeUFjaXloWE9x?=
 =?utf-8?B?L1RjMEdLVHZtbUxUTzV1enM5MDZyeEhkNm5jZzFHU3ovaTRoaVBUY2JXcFc3?=
 =?utf-8?B?MXdPdmV5TStkTDZtQzVyUTc5OXo0TlFSanhMSlRqaVZTS0g0MHIwWEwrRHpU?=
 =?utf-8?B?THRmb1YxWEp4NHpiL0lENXFqUituZUl2dGVCZGlpTXBrMStQQnpjZVgwdlRl?=
 =?utf-8?B?MDA4djJIS0FPajVQQnN0NGQ4VFhVdjZSUDdSVWxpeXFEWCtEZis0S2d0Qmhl?=
 =?utf-8?B?bnU0UDNHbFhvUmV0bXVTcmxCZkRRQUUxRm1BSzlES0E4NitNd3hsbXIyTG5u?=
 =?utf-8?B?UFVKNlF5S1NLL2IwelBrWFFuRTBORnROUkJYajhpVXh3aGVIa3V6anVGam1t?=
 =?utf-8?B?YWRqMEZSem9NZzM2NVhkRkE1b2FUSTFmNlY0RE1OR3JVRWphSXBmS3dmeUpQ?=
 =?utf-8?B?cU5udStYeGN1a3lYUnlsUHpTdVNVa0ZEMUpscnpLK2pJdnZjZDhUSXhtWm9B?=
 =?utf-8?B?SEVWdEVZVXhPN0hCUU5hRDgyWTRBanpNM3VadHNrNHEvcjZiZkpESmF3WDZP?=
 =?utf-8?B?R1FZQWNYQjZLd3pXeExic3dvNHBYTjAwa095bFl4RU5Ic2JSU04zeXJ6di95?=
 =?utf-8?B?RUpLZ2h5RGJCOHpScHk3Z2hVYklMVXdJQldnNGM5VDVyMUEyMGtGbVdsZkpF?=
 =?utf-8?B?eVg0RVlqWlNEcUJXb213RGxVM01lYm1HR0FwTVZuL09ObFQwb0pORC9HQmdo?=
 =?utf-8?B?K1Z0dW9ETmJnNzR6Qis5ZHRabnlLME5qenBUOEtXdGxDbzdQMi9zQ1Y1RXlV?=
 =?utf-8?Q?fqJA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dStMWnY0NWdUMmZtVmdSRzJIaG84ZWMzMHBqUjRYckJuSW1WNTZkN0ttWTd3?=
 =?utf-8?B?VWNRN2V0c3I0a1I3Rkk4RlpTcUd5a083WitFTEU4SDdXREZsZGl5ZWR6U0tF?=
 =?utf-8?B?WUM0UTljbDBId0ZLNDRCYmhaK05oR1U2RjBHOURONDU4cWdKUEtoOWROSlJ4?=
 =?utf-8?B?cytrYmlFNEg2MjhCaXRLWXptVmxJaS9FY1Z3QVZVRy81WVUxSTFVZllKUXgr?=
 =?utf-8?B?Q05ocXIrOUdUZEFVSXdPK2lmNEF1RHlyRThMRmh4MVhjTHNXS3o1aG80OFB0?=
 =?utf-8?B?NFdZM1RpbFdnK0t0akxLZmZFVmF5QVNTOUtiZ3JXZUNnOEpLN0Y0djdTQlFZ?=
 =?utf-8?B?a3dDbi9pQU9IY3AvVDBKNW0wMXBNN3pDeXRCRVRtMmlyUTdFQjd4azhGUDlI?=
 =?utf-8?B?VFBQZVNNVWJKcWlydVhGeEJVQ1FLTGJVSWtQSDNHbkkyTHRINnhlZFBPUzl5?=
 =?utf-8?B?OFRzN2ZQK2I5ZjVNdVJmS2JsNGtQd05iRzQzaEZ5M2VUczlpREV0Tlg0eDBJ?=
 =?utf-8?B?WVdsRTVaZW5qWmVtZEpVTUpSR2pBTWdvSWxKbVVXS3VjSjFaV2pUZm9FL1hw?=
 =?utf-8?B?Vmp1NHNqRFpEV2I0V3ZtaEFkcVU5QWEwSG8rUEhRWGRlRE5hTmRaa0RpaWxI?=
 =?utf-8?B?UFhUU09jQ2hLNk9hcTZVZ2R1bGJ3OGtSMnI1bW9KckZoMzNTYStsQVkvdzgz?=
 =?utf-8?B?dWsvSmpxTUdhUlYvRGRxQm5tanRINUxYdXhWK29EcmtiWW1tYzF5T1gxREZN?=
 =?utf-8?B?aXlRLzJOODFBTkkvNFR4QS9VSm8xZ2JxK2tBY202RmZUZlMva09obGlTOXJi?=
 =?utf-8?B?Y2lnVmkzOXJ3Mmdpa3VEd25YR1g5bnpMWHZCY2U5d1VNa3JYRFo0MXhpK0Zk?=
 =?utf-8?B?NGVJUTluSzk4VFI5MnoxU1ZwZHdZWm9Hb3h2TE9QMnpvT0c4MFRTVnJOcHZW?=
 =?utf-8?B?L1pjZCtLb0RhdjhjaCs1cE94bFIzZnV5VmRKUGFQSlpSS0dPWkVaU290elhK?=
 =?utf-8?B?WDg1a0hOUXovZU1ROUswd2NnN2lxQjU1N25NNmFZd2Fwam4weFQ3TDJWd3Qr?=
 =?utf-8?B?ZThpQ3lzN0pmaTI1TzFpUE5PU1VoVm9SUEk5MTF2aHNyMVc1NC9HaEpNbmQ3?=
 =?utf-8?B?NFdVeTY4WEk2VmVBYzVUSXorQWM4ZjhRR0UzQkJvTDJYUGNXYnRtNVZYNUI1?=
 =?utf-8?B?UEZmZFcxQ2p2OFZQNnJqOXhGRDlwODNJZUtrOUlWSldOdFMvV2JUMXdEWmpx?=
 =?utf-8?B?WHpxWXNnRW1jWDdtV3hGc1BRV2EyU0FJSlJySkkxRU5jN0QrVWV4NXlMY3ZX?=
 =?utf-8?B?aCtwSExNRUhBYVJRbzZoUkV1R3Z0LzczUUxqby8rWU91T2xMOTc3YXoyUDAw?=
 =?utf-8?B?aWpoY0JSeExlYm5xSlJiRVI4ekRLbXo5SjhJQ01zbkNaekZPKzBPZ20vR29X?=
 =?utf-8?B?c0dtRGdDa09NM1BtZ3R6L3hOc1ZmTXhOcHlNVFh1dCtJWExUYU5mTTY2ZTYw?=
 =?utf-8?B?a2FGUFVXSWoyUWZybzJZTXEzYVRNMUNWRSt0S1VZRXFrVHhxOEt2dVl5Y2pm?=
 =?utf-8?B?V09BTlJHSzZRb2tDYURqWVlpaTF0ZjRhdHV0T3oxMW1Ub0ZQZk1aWHlPLzhU?=
 =?utf-8?B?dWliSHAya2cvMmdxeEtyelZieTB3eUhsa2UrR3Ftb043c2dLTE0rMXBvMm9k?=
 =?utf-8?B?a0lhSDUySnFZdndNRUMxNGg1dlNJMlRwZmpXdnMvVysrak80VzNoY3VQNmJr?=
 =?utf-8?B?R0VYMHNZOWRvOEZTVXRrcjQ3ZVZjVmtCL25IS29zd1RzTktjQzNEdkdldTRv?=
 =?utf-8?B?S1dZSXpibHNQN09sajN2ZWNNYjE2eDhCNW1HbGJqWnpTSXNuTCtNak4vYWxP?=
 =?utf-8?B?MWJFOGFER2FudHhZSDg4MU4yc3lNMjhScGZYWWJuMUxzOWM1WnlXM243eDlv?=
 =?utf-8?B?SjcvQTN1NmxhSXlkMUxjazc1UUlhcXFoS0o0NXk3emdLRnV0TDkwcGFqQVBK?=
 =?utf-8?B?R090cTNVa3hTbWUwazZMK2pOZ2d4Q3lyei9VdHMvcnZtUjF6ZHFvR05GVDgz?=
 =?utf-8?B?M2pKRE51R25ITUdSc1B1Q3lES2QvTUFTbmdabmw4Q1VBNkhJdExlV3p4SGdL?=
 =?utf-8?B?UnNrNTAzYlpLMG5udVV5WW9VL1NtNXpOUWFJZFNQZlhWa09pdE42WGx1RUhC?=
 =?utf-8?B?N0xGRXdJeGZoQ3p0eTlBeE1tLzFSRHI1eWw4LzQzaVBZV1VMSHhya2NKZnpp?=
 =?utf-8?B?Z3JBaW9uTGljK1JYL004SElkVGgvT3FEWVpVZmkvY1NtbXNJWFk5VWx5a1pq?=
 =?utf-8?B?MnRZdW9DdkJ3SzFCcFhIaXhXWGZxUGhGY01WRndRcFE5N2UwaW5jT2UySkdp?=
 =?utf-8?Q?3+mc7hhnNwaCOAdT4JrcRCt1UR3T2dBbhrm49?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d7443e9f-79d1-45fa-6888-08de6faa5596
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 11:30:50.7654 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AulscyAyc/2KAlfQfNf/fqPlBL24CFlXS5cYtEOkbEkfsIwdYuiOkZ/qdBrPXWspJ9JSb52LxZlU8aVne+0Q0GvY3Q85elHAfHHSUBUjvXe9UDHOYvTns4xZsiUa/y41
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4782
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

On 06.02.2026 14:30, Matt Roper wrote:
> When generating the default LRC, if a register is not masked, we apply
> any save-restore programming necessary via a read-modify-write sequence
> that will ensure we only update the relevant bits/fields without
> clobbering the rest of the register.  However some of the registers that
> need to be updated might be MCR registers which require steering to a
> non-terminated instance to ensure we can read back a valid, non-zero
> value. The steering of reads originating from a command streamer is
> controlled by register CS_MMIO_GROUP_INSTANCE_SELECT.  Emit additional
> MI_LRI commands to update the steering before any RMW of an MCR register
> to ensure the reads are performed properly.
> 
> Note that needing to perform a RMW of an MCR register while building the
> default LRC is pretty rare.  Most of the MCR registers that are part of
> an engine's LRCs are also masked registers, so no MCR is necessary.
> 
> Fixes: f2f90989ccff ("drm/xe: Avoid reading RMW registers in emit_wa_job")
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h |  6 +++
>  drivers/gpu/drm/xe/xe_gt.c               | 66 +++++++++++++++++++-----
>  2 files changed, 60 insertions(+), 12 deletions(-)

Looks good to me.

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Regards,
Bala

> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index 68172b0248a6..dc5a4fafa70c 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -96,6 +96,12 @@
>  #define   ENABLE_SEMAPHORE_POLL_BIT		REG_BIT(13)
>  
>  #define RING_CMD_CCTL(base)			XE_REG((base) + 0xc4, XE_REG_OPTION_MASKED)
> +
> +#define CS_MMIO_GROUP_INSTANCE_SELECT(base)	XE_REG((base) + 0xcc)
> +#define   SELECTIVE_READ_ADDRESSING		REG_BIT(30)
> +#define   SELECTIVE_READ_GROUP			REG_GENMASK(29, 23)
> +#define   SELECTIVE_READ_INSTANCE		REG_GENMASK(22, 16)
> +
>  /*
>   * CMD_CCTL read/write fields take a MOCS value and _not_ a table index.
>   * The lsb of each can be considered a separate enabling bit for encryption.
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 22132467ff4f..ae041168fabf 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -207,11 +207,15 @@ static int emit_nop_job(struct xe_gt *gt, struct xe_exec_queue *q)
>  	return ret;
>  }
>  
> +/* Dwords required to emit a RMW of a register */
> +#define EMIT_RMW_DW 20
> +
>  static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
>  {
> -	struct xe_reg_sr *sr = &q->hwe->reg_lrc;
> +	struct xe_hw_engine *hwe = q->hwe;
> +	struct xe_reg_sr *sr = &hwe->reg_lrc;
>  	struct xe_reg_sr_entry *entry;
> -	int count_rmw = 0, count = 0, ret;
> +	int count_rmw = 0, count_rmw_mcr = 0, count = 0, ret;
>  	unsigned long idx;
>  	struct xe_bb *bb;
>  	size_t bb_len = 0;
> @@ -221,6 +225,8 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
>  	xa_for_each(&sr->xa, idx, entry) {
>  		if (entry->reg.masked || entry->clr_bits == ~0)
>  			++count;
> +		else if (entry->reg.mcr)
> +			++count_rmw_mcr;
>  		else
>  			++count_rmw;
>  	}
> @@ -228,17 +234,35 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
>  	if (count)
>  		bb_len += count * 2 + 1;
>  
> -	if (count_rmw)
> -		bb_len += count_rmw * 20 + 7;
> +	/*
> +	 * RMW of MCR registers is the same as a normal RMW, except an
> +	 * additional LRI (3 dwords) is required per register to steer the read
> +	 * to a nom-terminated instance.
> +	 *
> +	 * We could probably shorten the batch slightly by eliding the
> +	 * steering for consecutive MCR registers that have the same
> +	 * group/instance target, but it's not worth the extra complexity to do
> +	 * so.
> +	 */
> +	bb_len += count_rmw * EMIT_RMW_DW;
> +	bb_len += count_rmw_mcr * (EMIT_RMW_DW + 3);
>  
> -	if (q->hwe->class == XE_ENGINE_CLASS_RENDER)
> +	/*
> +	 * After doing all RMW, we need 7 trailing dwords to clean up,
> +	 * plus an additional 3 dwords to reset steering if any of the
> +	 * registers were MCR.
> +	 */
> +	if (count_rmw || count_rmw_mcr)
> +		bb_len += 7 + (count_rmw_mcr ? 3 : 0);
> +
> +	if (hwe->class == XE_ENGINE_CLASS_RENDER)
>  		/*
>  		 * Big enough to emit all of the context's 3DSTATE via
>  		 * xe_lrc_emit_hwe_state_instructions()
>  		 */
> -		bb_len += xe_gt_lrc_size(gt, q->hwe->class) / sizeof(u32);
> +		bb_len += xe_gt_lrc_size(gt, hwe->class) / sizeof(u32);
>  
> -	xe_gt_dbg(gt, "LRC %s WA job: %zu dwords\n", q->hwe->name, bb_len);
> +	xe_gt_dbg(gt, "LRC %s WA job: %zu dwords\n", hwe->name, bb_len);
>  
>  	bb = xe_bb_new(gt, bb_len, false);
>  	if (IS_ERR(bb))
> @@ -273,13 +297,23 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
>  		}
>  	}
>  
> -	if (count_rmw) {
> -		/* Emit MI_MATH for each RMW reg: 20dw per reg + 7 trailing dw */
> -
> +	if (count_rmw || count_rmw_mcr) {
>  		xa_for_each(&sr->xa, idx, entry) {
>  			if (entry->reg.masked || entry->clr_bits == ~0)
>  				continue;
>  
> +			if (entry->reg.mcr) {
> +				struct xe_reg_mcr reg = { .__reg.raw = entry->reg.raw };
> +				u8 group, instance;
> +
> +				xe_gt_mcr_get_nonterminated_steering(gt, reg, &group, &instance);
> +				*cs++ = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1);
> +				*cs++ = CS_MMIO_GROUP_INSTANCE_SELECT(hwe->mmio_base).addr;
> +				*cs++ = SELECTIVE_READ_ADDRESSING |
> +					REG_FIELD_PREP(SELECTIVE_READ_GROUP, group) |
> +					REG_FIELD_PREP(SELECTIVE_READ_INSTANCE, instance);
> +			}
> +
>  			*cs++ = MI_LOAD_REGISTER_REG | MI_LRR_DST_CS_MMIO;
>  			*cs++ = entry->reg.addr;
>  			*cs++ = CS_GPR_REG(0, 0).addr;
> @@ -305,8 +339,9 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
>  			*cs++ = CS_GPR_REG(0, 0).addr;
>  			*cs++ = entry->reg.addr;
>  
> -			xe_gt_dbg(gt, "REG[%#x] = ~%#x|%#x\n",
> -				  entry->reg.addr, entry->clr_bits, entry->set_bits);
> +			xe_gt_dbg(gt, "REG[%#x] = ~%#x|%#x%s\n",
> +				  entry->reg.addr, entry->clr_bits, entry->set_bits,
> +				  entry->reg.mcr ? " (MCR)" : "");
>  		}
>  
>  		/* reset used GPR */
> @@ -318,6 +353,13 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
>  		*cs++ = 0;
>  		*cs++ = CS_GPR_REG(0, 2).addr;
>  		*cs++ = 0;
> +
> +		/* reset steering */
> +		if (count_rmw_mcr) {
> +			*cs++ = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1);
> +			*cs++ = CS_MMIO_GROUP_INSTANCE_SELECT(q->hwe->mmio_base).addr;
> +			*cs++ = 0;
> +		}
>  	}
>  
>  	cs = xe_lrc_emit_hwe_state_instructions(q, cs);

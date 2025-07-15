Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B31C83F1D
	for <intel-xe@archiver.kernel.org>; Tue, 15 Jul 2025 06:56:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E53E110E526;
	Tue, 15 Jul 2025 06:56:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YQ3dlWM0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DAC410E526
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Jul 2025 06:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752562585; x=1784098585;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Ht4yHD3athE1ohJtWq5vW21Bjj92+CFBQxRZsU38S0g=;
 b=YQ3dlWM0HTFScyyqPl89jtUbU/WQ0r+A/y7yPQWq0t8px/FkcU9HbPLZ
 iW07fvW7yk+1myDtYn+kSpKN8uaGNtG+h3Xy20BbQ2B4k0ijjF4+PD1xL
 l2yb4N4QpHGBLtwZHssGzz5GG6ifXCBOweFlu5dtGdS7B3yOlYieVeVed
 qoTlizqxsl9DX5kD0i2mHyqjZ+/QUQzN/gnBjb9SrYzUbLEhACWU2qrKX
 mdt7zbIKUnvpc8nq/prR1QcdqsJC8X2uBGa/NG3YNrFOVgHIfO76JomG9
 pmQ3qxJizmlm+R9wkt4sV1SpN4sEvTUn1qSh2B/1XNtHVgP9q+fl8drCZ A==;
X-CSE-ConnectionGUID: kYW92Ce8ShiJJEiMg0+3uA==
X-CSE-MsgGUID: ohHnpneXRE6JHI6Ue6JY5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="53882868"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="53882868"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 23:56:25 -0700
X-CSE-ConnectionGUID: Zgbv1rIAS1anzXQ8tWaMBA==
X-CSE-MsgGUID: uY8fFl+sSEK6nQLN6EHAjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="194297277"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 23:56:25 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 14 Jul 2025 23:56:24 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 14 Jul 2025 23:56:24 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.52) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 23:56:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ftnyF2wrxIpMFJr2SMyNRWTFeztxDZ8K36kX+eqOi7lcHdbwIY3kmOMxYxgE+LyeM7Kway+boyK9bcuXiH/FegSf6KqoKm9Dttk3wgJjYepYys/384C36OQmca2TBw7x3JQs5M+T4PKbz3Cw73PcfMM8oJ+L3auSehrdl0EvEwJ4cFK24KwEwsi8Zu6vLSb7N6aTxK/NSXH/uCz5aNamo2B5jrW6rmqK27xgA9ivMrprV2Or3WkGofudgAd6raaWl4sCSFMe5b5wpNOc/eT/lUHeyzl7GyurJWbZbhHeaMEQ76GJ04kXAhAhWuRAb8/ThLP/Oy44evIpDY7mG2AsLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iqah4LFgsjsYDjTTZtYql3Ao1FKl3w2I7av58gyGg7Y=;
 b=Bm0ywVLdiZHXQbSBA0xsYBb4glRUsEKIiGpdLFgL2Rr5Uf9aE3sKxKNNQTQrAJLPjHF7dsLCE4D13/pkOLJPB1Z0Lgog0oPDgfBxoQe3Cn/cZ3f6WW2cP5B5+utNxd7kQou2DsFdz+hhxCsNc5rXi9rTazwuFvxCEUY+Ir/kACbbMge+sxB3xnU2uAH1uhcUSoAnpopcW9ZgkAamubnfOgsnXaJa0nI2JZFSqX7BalEiuz6+DHwZ36+Io+v0NXSueJ9LoBkH/QtxdFwUWkCHlYRT05P/qfD15D8LDtupfyh1Vq8QUgp8xxr6L7+CR5dc0wI5CRs1PqjVq4PxE0i0dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6138.namprd11.prod.outlook.com (2603:10b6:930:2a::11)
 by SA2PR11MB5003.namprd11.prod.outlook.com (2603:10b6:806:11e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.33; Tue, 15 Jul
 2025 06:56:20 +0000
Received: from CY5PR11MB6138.namprd11.prod.outlook.com
 ([fe80::f24e:b21e:c458:4e74]) by CY5PR11MB6138.namprd11.prod.outlook.com
 ([fe80::f24e:b21e:c458:4e74%4]) with mapi id 15.20.8857.025; Tue, 15 Jul 2025
 06:56:20 +0000
Date: Tue, 15 Jul 2025 08:56:17 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 1/6] drm/xe/pf: Prepare to stop SR-IOV support prior
 GT reset
Message-ID: <20250715065617.pc3qnrjvakiiajfh@intel.com>
References: <20250711193316.1920-1-michal.wajdeczko@intel.com>
 <20250711193316.1920-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250711193316.1920-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: DU7P195CA0027.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:54d::20) To CY5PR11MB6138.namprd11.prod.outlook.com
 (2603:10b6:930:2a::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6138:EE_|SA2PR11MB5003:EE_
X-MS-Office365-Filtering-Correlation-Id: 7979c341-e45a-4c54-1214-08ddc36cb453
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eVRuNXlLM25yV3JVbkllak5HcklRQXFnZ1NwS1VXd1JEVTlKVFJDcEcxdUVR?=
 =?utf-8?B?a0pIS1ZieTlJdVNTZDBWSTVVWGJTbDJMYW95M21SS09pRWNvSks4MkFHWk9Y?=
 =?utf-8?B?cHg5YnpHa0FkSnlycW01bnliYlhCRC95VjZnUHRydjdJUjhDMHgrUEZjVUh5?=
 =?utf-8?B?dlAzTWlaRUU4Z2thalZXZHdxbVVXWmZiVlpnZ0s5elFSenFUUG9KVHQ0ZGpk?=
 =?utf-8?B?VkVvWjUzL25KVEtpSmhBMXhNSHphZFJSZFNDT2dMdWZwenNETEs1RXlaVDda?=
 =?utf-8?B?dmlLdmwyUTRrRHFZNlY1OTBpekRCcmgrN1phMzBSUXA2cGQrSHV5QWFQY2lQ?=
 =?utf-8?B?YUlHZlZhTmNaVklVeHhtY3p3Z2t6VWtoeDdiSklMWGpjRzFVQ3ZiY3hNbHY5?=
 =?utf-8?B?bDF1SjJ1bjAwelBoWFQvT3NoMG94bjlKVmJtdEFEOHcvWXErZlhiYjVBVzZk?=
 =?utf-8?B?UlAwZTFIMzQzNHJvMnMwSTczTDJONlo1V2p6ZFlwNjFvbXZLeTVtbGFPUjdH?=
 =?utf-8?B?Z2p5Q2Era3pjeDdBdEtpcS80SHhiRHRlVFFXM09zeTBZc3hRb1AxM1NqUVBP?=
 =?utf-8?B?Z3llcXVNR2o5VTYxamd3UWNXUDcrQmROM1JhMjdyU2ZwYTBxRjNRU2VwcjhI?=
 =?utf-8?B?S1h5NFBsQTBQYkpLb0VpUVNCb3FTUmpqMmFNQXZkUklwa1MxeVFlUkIvVU9X?=
 =?utf-8?B?bFRUSExTb0xYMzhndkNVb25acHRGYzcxbDJKeGJaTHJiT2JsNmZMaml2T3Zv?=
 =?utf-8?B?dXhKV3huTW0yV1J0SFlBT1R4Z3pUYXk5OG9Kek9IZjluRHNITEdYYXo3Q1k0?=
 =?utf-8?B?Z0MxWFgwQjNUV2NneW9xMFFlNmFlcmY3RFZuOEZnRmpVZ1BNM1lPR3FwdlJw?=
 =?utf-8?B?RXZMWEdmZjdYbkJmRGNQSU94UnFwWVJvd3dUUDVlS1NiaVpXcjNCYmk3b0s3?=
 =?utf-8?B?QlNIVDNZb0tVVU4yeW1QaStuSTFEdmVVWDhhYit6U3NIY0hpeHhsU1hBZ0xo?=
 =?utf-8?B?a3dTb1IwSG1TZWhBcmZibnN3clZiQnNpVmZpdzFpOEU4L1NwUUdiTFJ0YXFk?=
 =?utf-8?B?TzZTOGJPS3RrMkZsYzhWMERzTU1EU004WjFlcWRKRWlLbTFzbVVkamhCK0Vr?=
 =?utf-8?B?R0ZxQ3A4VXllKzRZSU9LcGN2Lzkydi8wNCtLUHR1MFJSN2tWTlN4Q3RQUkJn?=
 =?utf-8?B?dWd3SWJxeHRyaytPZzJHbmpKWS9LNHk5RHlDU3JVVXlUazF1RDc2Y3lySEll?=
 =?utf-8?B?ekhPSjNvQXpzRHZKRXdzazlVSXpPWmtneXdydTBtT3VEc0RicEtuWldHN29O?=
 =?utf-8?B?VG8yMEpmVG1yeGZVWWxYb3NMUW54a256UmRUcCs4NFFQTGV5bXI1dTBHSnA0?=
 =?utf-8?B?MTZFN0ZOR0E2S1U5N01zSXdzS0lGTHRueWVUbVZvaWdVQ0VOQ2tFclg5aGky?=
 =?utf-8?B?bTBCRmJVcDRHM05TY1ZEQ1krME1sRzhLV1MvL2pYYVdjRHRqL2VGZnk5VjRu?=
 =?utf-8?B?N2M1STdldXFMcHJWZFRZbThoaHNZY00zcXpFa3NSNkhSNzAydlZWUTAyTnoy?=
 =?utf-8?B?aEZJRkxUVG5tUzVGYjN4dHRLNFd6WTZzaFpUMllZQ002MHAraGZhNEtiVEtH?=
 =?utf-8?B?L2FUanZ3WVU2Ni9zL3Q4MHlEeG81ZW51OUh0dE94TjVBQmNTdG96VW56Sis3?=
 =?utf-8?B?YU05d1NWM3lJVGlYUlh5QTU1eDB3YUdpTGpLUGFITkVwbjBRU2dwd21iWWNG?=
 =?utf-8?B?eWg5V2w2VjlxNHFNTTNzcnExSDgvTVpNdnZOZjZPekpTQjdzUzVRai9URFpH?=
 =?utf-8?B?Njh0YmZoV3VqY0tSNUpqbkhGaExYNmxrUll6QWoxd2NtYWpsei9VVjB5U1BE?=
 =?utf-8?B?L25mRVFGYkx6K3hpTnNJT3lKZ0FyQXdFMHhscVZBMWNCNjVGY2RoZm0xTHZN?=
 =?utf-8?Q?GljBNN+8ovI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6138.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUJibWxUa3RFSFJ6UkhUZlB0TGhPUkdrN1hjRkJnQ1pOREY3RnJoRDJ2VTRP?=
 =?utf-8?B?RVgwVWJDdHRscldic0QyaCtRSGFVMnZMQ3J5c09UVmx2bktVREVVVGs0dmgx?=
 =?utf-8?B?T25JWXFhZnUrNHBzRDlWVEJkMDcwaitXcU9ldlU2alY1U3lzVk9kYm04QkJp?=
 =?utf-8?B?WFN3OFN6cmZPQktIbVo1aU5vMUp2TmdJT1U2Q004K3RlZEY2OWV5WHlXWElN?=
 =?utf-8?B?RXp5WEcvZ3pGbmNtczhqcllsSjJWUmVGSWVsRjY3dDlrZ3IzZVVHL21iRmhD?=
 =?utf-8?B?N0s4Y29JbGdWU1VQa0hCNmI2UzVCam1vSDZObFB4REFZWCs5a0FrZHFBdGFS?=
 =?utf-8?B?ZStwZjdkVlJ4ay9VM0EvVUl5VVhaWHFsWENRMDdMTE9WUVN6djR2UkU0L1Jr?=
 =?utf-8?B?MVl3YnVsb2VITThsSWVpNXcyamE5QlRxV0VFbXIxQmZoQ1RTczFjZ0lSYjcv?=
 =?utf-8?B?NDlRbS9ONFlzcno0ZXc0RkN2SDA0cUMrVDVuWjNHZEgyR2ZrNWY1R09qRjR1?=
 =?utf-8?B?cjU2U3JiMk9GQzJEYi9scGxUa1NFRlQyM0hwZzhreXVpU2VsdGVVaHZHV09N?=
 =?utf-8?B?UVVzU0NMNmF2ZXFpQzMrQlc1TlZFNUJzZUNGL1NlVmxpdm5iVThqU1AwbFB6?=
 =?utf-8?B?cmpSOGhxYVdpMWdYL2tCK2ZsSlBkRXpLNUtOWEE5SWRYUCtxRnR4MDl5a1Nx?=
 =?utf-8?B?RnpIN0c3cWsyajIyR0VvWStCN3dSWisreWJZdm90dWlORUVvQmtRYVVUb1pq?=
 =?utf-8?B?MVA1VjFYUzRwQXQ3c0NIeW9KdURmVElFb2hhRE5rd05FWnE4MmREeU5NY2dL?=
 =?utf-8?B?RURaWml2SWRpTjd3cmc2dUFHWUNId3ZQMnlidzJPdFRaSmszU29sSWxINGo1?=
 =?utf-8?B?RDgzMkJWRjNKNzNQaTFFWDFCWmd0cjdzYkxFQ3FIa29nZXdNaHFSNG8wL2tC?=
 =?utf-8?B?dkUzemxtWlFCZHpCcFlIV3gxN0JsbUkweWVZVERDOGhwN21CQjZMMVJMK0R2?=
 =?utf-8?B?d2JOTU11SmI0ekp5V0RWOHVpZlhKSDh6WUg3d2JnNCtBR0FRZUpaR1N4OFZD?=
 =?utf-8?B?MkdkVTFCdkFTMzdtNkc4a1VnUXRJZEZsbnNjenJCbzVWQUtlS0cySTZnSWFk?=
 =?utf-8?B?QytvMnZvcHg2VGRCeW5Uc1phbUlpaHFuSjFaOUsramU2dTBwNHBNYTlzZGQ2?=
 =?utf-8?B?QWNyYnlPclZmS2QyZytmUVkvUjJxNDJDdjAwblRiUEpVQm5UVVNUSWprZnBm?=
 =?utf-8?B?bm52QTFla0c5QWc5ZGR3TlJVeThscDlNVXd5MTc3WE4rUkNrcGZZOWFXS050?=
 =?utf-8?B?M2pqVEZsMWZsSHFyeDl3S1dPQXhVTEJqTEVBMzY4Z1pUUnpLK0g4V1JLaTNo?=
 =?utf-8?B?dmgzSkUyNlNEWGhRd1JtN1hkaHNaTVEvY1g3aE5VOXJzV0s2YXJlc2hrUEJk?=
 =?utf-8?B?OVVnalY1cmdkTzNzVUd6N3pwVDltUEpnaEpYckdBWkM1T2JlYWh6RnEyN0Rm?=
 =?utf-8?B?V1NKb2prS04yVkUxbTFIVnEzTWNESEFTNWJ3V1BDWG9iK2JWOXpxL1RhSks2?=
 =?utf-8?B?R05BSllXQm1KOXdHWkdKbUJ2UTlFajJWM0ZaQU4rMkFvK0F4ZE42eXBpR1FK?=
 =?utf-8?B?czIvWTRZeWcxVGVnUXFMVjB4cXVUNU9vWHRUOU1sVHBvdUdEL0EvdGZMcWR2?=
 =?utf-8?B?R3lCN0FCM1NzZDRPWisrRDFJYnpibXBZTzhJRlcrZC9BTFN2VDVPZ3FRMkJx?=
 =?utf-8?B?d2lIZEd0RnQ5RzA4OUsrYXR1YzlQcUtXWUFROTdpZERTQW5vSFQzaGdheHhs?=
 =?utf-8?B?TDdrR2NWZXJwQnIzTGtoN2xJazVoUzRRcXBFZGt0T0VnZytQbXZUT1dLMW9Q?=
 =?utf-8?B?MXRnY0tZL2lZd0RnV0hxdXNGK0FKTTdtUkVXUURUVUNNS1hNYjM5MFdlWmgz?=
 =?utf-8?B?bTF1VERyOWRicng4QTJiZk9MTWNiNUw3ekI3eVRBR2tWSkxSWnRHMFJuOEtU?=
 =?utf-8?B?SFNLQWFxTVZMdlhUZ0tNU3NkeENMcVUzUVYvdzBnOEllUFV6SU9hWm5FZ1BO?=
 =?utf-8?B?ZHNGWHR4T1NxUllVb0lRcllXUHBmRzJ4K3Q4T1J1d2VsUzRMOUJ5dnIxWTht?=
 =?utf-8?B?S0hQZk1uQ08zMWs1WkVhamVpem1aQjVoWUZyU3hXNGtkQng5YVpZaDJJU3I2?=
 =?utf-8?B?Wnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7979c341-e45a-4c54-1214-08ddc36cb453
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6138.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 06:56:20.7461 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z4AXcxS/2rhAVA3Q6igKtUnFmle07DMuSbuD4VTOMOc9MyDnc5Y0DfVd0eo5lzwABmeeEk/Ptz64jUVuSuRc7o17khk0+552M4cbfKac4yw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5003
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pią [2025-lip-11 21:33:11 +0200]:
> As part of the resume or GT reset, the PF driver schedules work
> which is then used to complete restarting of the SR-IOV support,
> including resending to the GuC configurations of provisioned VFs.
> 
> However, in case of short delay between those two actions, which
> could be seen by triggering a GT reset on the suspened device:
> 
>  $ echo 1 > /sys/kernel/debug/dri/0000:00:02.0/gt0/force_reset
> 
> this PF worker might be still busy, which lead to errors due to
> just stopped or disabled GuC CTB communication:
> 
>  [ ] xe 0000:00:02.0: [drm:xe_gt_resume [xe]] GT0: resumed
>  [ ] xe 0000:00:02.0: [drm] GT0: trying reset from force_reset_show [xe]
>  [ ] xe 0000:00:02.0: [drm] GT0: reset queued
>  [ ] xe 0000:00:02.0: [drm] GT0: reset started
>  [ ] xe 0000:00:02.0: [drm:guc_ct_change_state [xe]] GT0: GuC CT communication channel stopped
>  [ ] xe 0000:00:02.0: [drm:guc_ct_send_recv [xe]] GT0: H2G request 0x5503 canceled!
>  [ ] xe 0000:00:02.0: [drm] GT0: PF: Failed to push VF1 12 config KLVs (-ECANCELED)
>  [ ] xe 0000:00:02.0: [drm] GT0: PF: Failed to push VF1 configuration (-ECANCELED)
>  [ ] xe 0000:00:02.0: [drm:guc_ct_change_state [xe]] GT0: GuC CT communication channel disabled
>  [ ] xe 0000:00:02.0: [drm] GT0: PF: Failed to push VF2 12 config KLVs (-ENODEV)
>  [ ] xe 0000:00:02.0: [drm] GT0: PF: Failed to push VF2 configuration (-ENODEV)
>  [ ] xe 0000:00:02.0: [drm] GT0: PF: Failed to push 2 of 2 VFs configurations
>  [ ] xe 0000:00:02.0: [drm:pf_worker_restart_func [xe]] GT0: PF: restart completed
> 
> While this VFs reprovisioning will be successful during next spin
> of the worker, to avoid those errors, make sure to cancel restart
> worker if we are about to trigger next reset.
> 
> Fixes: 411220808cee ("drm/xe/pf: Restart VFs provisioning after GT reset")
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c          |  3 +++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf.c | 19 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf.h |  5 +++++
>  3 files changed, 27 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index af03e19ef9be..58fe2c4168b0 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -835,6 +835,9 @@ static int gt_reset(struct xe_gt *gt)
>  		goto err_out;
>  	}
>  
> +	if (IS_SRIOV_PF(gt_to_xe(gt)))
> +		xe_gt_sriov_pf_stop_prepare(gt);
> +
>  	xe_uc_gucrc_disable(&gt->uc);
>  	xe_uc_stop_prepare(&gt->uc);
>  	xe_gt_pagefault_reset(gt);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> index c08efca6420e..35489fa81825 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> @@ -172,6 +172,25 @@ void xe_gt_sriov_pf_sanitize_hw(struct xe_gt *gt, unsigned int vfid)
>  	pf_clear_vf_scratch_regs(gt, vfid);
>  }
>  
> +static void pf_cancel_restart(struct xe_gt *gt)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +
> +	if (cancel_work_sync(&gt->sriov.pf.workers.restart))
> +		xe_gt_sriov_dbg_verbose(gt, "pending restart canceled!\n");
> +}
> +
> +/**
> + * xe_gt_sriov_pf_stop_prepare() - Prepare to stop SR-IOV support.
> + * @gt: the &xe_gt
> + *
> + * This function can only be called on the PF.
> + */
> +void xe_gt_sriov_pf_stop_prepare(struct xe_gt *gt)
> +{
> +	pf_cancel_restart(gt);
> +}
> +
>  static void pf_restart(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
> index f474509411c0..e2b2ff8132dc 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
> @@ -13,6 +13,7 @@ int xe_gt_sriov_pf_init_early(struct xe_gt *gt);
>  int xe_gt_sriov_pf_init(struct xe_gt *gt);
>  void xe_gt_sriov_pf_init_hw(struct xe_gt *gt);
>  void xe_gt_sriov_pf_sanitize_hw(struct xe_gt *gt, unsigned int vfid);
> +void xe_gt_sriov_pf_stop_prepare(struct xe_gt *gt);
>  void xe_gt_sriov_pf_restart(struct xe_gt *gt);
>  #else
>  static inline int xe_gt_sriov_pf_init_early(struct xe_gt *gt)
> @@ -29,6 +30,10 @@ static inline void xe_gt_sriov_pf_init_hw(struct xe_gt *gt)
>  {
>  }
>  
> +static inline void xe_gt_sriov_pf_stop_prepare(struct xe_gt *gt)
> +{
> +}
> +
>  static inline void xe_gt_sriov_pf_restart(struct xe_gt *gt)
>  {
>  }

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.47.1
> 

-- 

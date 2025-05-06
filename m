Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DACE3C3ABBE
	for <intel-xe@archiver.kernel.org>; Tue,  6 May 2025 18:00:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6E9610E023;
	Tue,  6 May 2025 18:00:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M0nnXTPQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AA8F10E023
 for <intel-xe@lists.freedesktop.org>; Tue,  6 May 2025 18:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746554411; x=1778090411;
 h=date:from:to:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=QNhXe1NDStIrxAzDAGJq0abSCtBFzZ+9sMQ0436g6ho=;
 b=M0nnXTPQRLMwToV2FPDgPCZWViSJ4vnWy9MKXs7z9m11S1u7GxBTnXw3
 wTn6MHFKNow23VIVARVyF6zoS+hj5nraOZC12gITlLmOFlM+Jxg+94IQ+
 9cvGu9WDkbXeoZI/Iy/XbEEXy+K2aIyk9RNComi5bNzhxfo/St1UZpkwb
 6UEXkUBWy6KWmwVF2ZO2dsD7N9GVxE4dmIcQceoEUNyvCUnMRcvM2x5dg
 3Mk9Aa/6fbEXnSELt4GMVqdo9iw1Br5DIBI/xkRaoFHLvGEItUkpZhYwH
 DowSZ34utVaCmzBr2v61Dapi9ajgRvgMxSZrcTKQeQ/BYMpBWVG+Q6B3J Q==;
X-CSE-ConnectionGUID: OIqX3KJjQaCvNrFBUcv/LA==
X-CSE-MsgGUID: uPH6e6OjQauwCLuRWuZvPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="73637452"
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; d="scan'208";a="73637452"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 11:00:11 -0700
X-CSE-ConnectionGUID: olPdBJPpQeqLbxi/hxq+wA==
X-CSE-MsgGUID: gkFOpe3jT52xPv3SU7AVbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; d="scan'208";a="140545903"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 11:00:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 6 May 2025 11:00:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 6 May 2025 11:00:10 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 6 May 2025 11:00:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sZ+wlxjRV88TQjZyjow7THqqMgLymhvmLSlQK8Kcf48X1sMxjygslQjLhYY3Pc+eov0rzDhWbXvFldOiL6imEmUZkEoS11Jg3BWjo4LLWdhZf2bZWTo29zJSCYnCtneG3hvsZ31hNVYJZ1WiHYYZB82WGB9DsoXekJ9Tz8Iuxx96rmJas7vocyhfmdtmWBMh7qlGdx9PvxT8r9sbMZS0QBW+BRXJrjI/Oi+Cp6P1PxFKzBO/bCFNN+e5Wv/3NYyqx38oWB5rEpReAz1Fr4Ix9UEShaZ3gPcWSzicLErbnfmIs3sq+/n8Xo2+fOLysiYMzyHgwJF6vanRyeNSqP+k0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BdL8Cu2Tdu1uFyU4+xZ7LNINn4l3cs+SpkxN6YcKjdQ=;
 b=y/EJ0EeVHI7AiLuHEmor5yvqIbTg01Qm+QHZCyuhrCTNcSkboBC38Z90uMduSeFJIA88WaFOl8eDRwXvxTkl2wuteFvJRSUPww7oi+FccKKAsFnq66X7clBTPineurz0flg5UEfKazymPGbV14GqBShqMoJ7nPQ+C7ZGXLAXzZ1Br3lnE9F4sKmplsidxveuVsLwDK3eJC+MQxwK2Aw0TcgaIyzGZCcyaKnFgqL5YPqM//urTJyYkDLciJyN7j1Ldg+VEIQUUH7HPl+yxk5FgZ7Wx2COn0qo5AfQzaIPqsK97taKexPBeP1w5f2JB5RIlvZbWsAato+THS7aOPJjxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CY8PR11MB7035.namprd11.prod.outlook.com (2603:10b6:930:51::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Tue, 6 May
 2025 17:59:35 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8699.022; Tue, 6 May 2025
 17:59:35 +0000
Date: Tue, 6 May 2025 10:59:33 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkJBVA==?= =?utf-8?Q?=3A?= failure for
 Support active context utilization (rev2)
Message-ID: <aBpOBcSwtUbaEbut@unerlige-desk.amr.corp.intel.com>
References: <20250505225852.1994431-6-umesh.nerlige.ramappa@intel.com>
 <174649015077.49740.6203793500643244684@c664b1dc75d1>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <174649015077.49740.6203793500643244684@c664b1dc75d1>
X-ClientProxiedBy: MW4PR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:303:8f::22) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CY8PR11MB7035:EE_
X-MS-Office365-Filtering-Correlation-Id: d293cafa-f8a0-45fa-8908-08dd8cc7c2a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Mk9QM0NnVUw3c1l0cHdoNEVrYXN0MEtMcmRYRUQvZElUMXVZWU9pREFzOTVQ?=
 =?utf-8?B?WGtRdk1EUTZJbnBiZ3pJd3BKcTVNcGJ6WGxmWElZMytNYWlJSFZQekRlZHp2?=
 =?utf-8?B?NWtKNm56cXhJQTRhWlNSQTB1bkFrdHI0SHI2RVJsQlRqUTRMNXd4Q0F5TE9W?=
 =?utf-8?B?MEpnSUo5ZWZQRW5zcWdQVVVLUnpJMENMVDlTbHFlRC8rak5wYUVhM3FHMGRN?=
 =?utf-8?B?dCt3N21hSjM5QW1sczJPZXQyODZYNldsRVZnVVJHbllsUDRwajRkVWNKQ01Y?=
 =?utf-8?B?YXA4WWx4SWN0TEZ0L3VPYVBqRWhoZFE0TXBYVThKK0E0NHVkanM5R0dyTDVG?=
 =?utf-8?B?VFZSbUx6TGdqV2s5NkRCNE01Tit0YStGbXRJTmpXRk02V1JXVTErYytHbVBa?=
 =?utf-8?B?bmw2ZGJZR0xobUNRRlE4V2tkcGlzcDRlVFFmbS9EWVduWmk0UlNIVWxGcHZv?=
 =?utf-8?B?VHRiMHdLcDdBcWhSeUpUcEJiT1c2TDR2Z25xVTZ0Q0lOYklLcWhyZng5L1pN?=
 =?utf-8?B?TEUwMDJ6VkErSVIyN0NzQVJOT3UzNXplMjhLV0dKVUNpQkk2SDhYMEo1QWZl?=
 =?utf-8?B?TjRnRm1qQUxJWURJU2J2SUoyck5zc2M3NnQyVm9IRGV3dWZOdHlXVWtna0V6?=
 =?utf-8?B?NGU5ZjFtWWplS0JwZFRvV1I0ZStNZStpamhKNWVnMGoyNnJWKzhsYXhaS1Vn?=
 =?utf-8?B?MWNuZnJpT0EwNDRMU2d3Yk5vYTlGK05jNUZibWRmQzVvNkMwWkJpZUZkK0pB?=
 =?utf-8?B?ZmZhaWU5S0EyVVUyYUNJYUd0OUVReko4VHJuU2pFeGI5MmVYUUlFd2VnZ1dq?=
 =?utf-8?B?czVSVjBGVFlPZXVYMkg1M2ZhM1hQSDBLaUlTNUxEM1duN1RwSnloL21LVUox?=
 =?utf-8?B?RWVXZ1dzZlgzM2VSZ0U0UmFTV3E5VHl1bnlVVVVxR0RXMjdhamdJekw2VGxK?=
 =?utf-8?B?bXU5ampEdDVFNnlScUc0YkpTRnFaYU9QSE9OOFBNMU8vZFFySkU4eWNMUUdP?=
 =?utf-8?B?VEdHTDdlMCtGR2dTZ3BwcUNTVzZ1YnZvdjEyaUlWRERtdERqK01udU1sRm0y?=
 =?utf-8?B?eklJbDdUMmhGVG1DdFVjb3FQdlAwREpkdkYwUGFKdVZIaytOZlowcHhxVHU0?=
 =?utf-8?B?RkdSeG5WMjNGUWdoUTIyWnZNZW1JUnBEekY1L1RNejF2alZ3ZFVKMVM0dUhH?=
 =?utf-8?B?OWV3VGoxWVVLdWg0Tm8wVWhJKzZkUjRvR1RPN2R1Vjd4Z1czWTBmSkFGYnJp?=
 =?utf-8?B?YnMzMmNPWUsvK1dISHlSWUw2bG5OZ2llc05hdHZ4dUIxd2dMS2xsT3lqcXlT?=
 =?utf-8?B?YU5uVEJJaGJ0SjNuWDJwN2lSenZFSTNJSFVucWZObFFHYkV1UzFQazl2c0I4?=
 =?utf-8?B?ZUQ4TjBTOGc4TkMzOUkvRVNIZXBpdGlVS1QyakdhV0xpbjJiRlhtcnB6dCtz?=
 =?utf-8?B?b1drZVhRaWRMaEdUN29EdXZHTTJHbkpzQ1hTUXdZRXc4OHlyUVQ2OHN4Wm45?=
 =?utf-8?B?TVdUYVlvS05ua2lsTkdBRjhlMDFzV2ZQU2JwTFduNktpck5PcXRYdzN1aGNR?=
 =?utf-8?B?aEdHY0RKK1BKQ09UeUNkcFRzK0FsVWFtVUp3a2xsOVpOd1l2TW9zQnAxbXpx?=
 =?utf-8?B?QXFjc2lQT25hTnZKZzVIS1hjSEpVUy8vWDltMjVBU0dnOCt2YnBDdWtndUdB?=
 =?utf-8?B?N0R3TXFqOXpjaFlNR2REOTVyeVZhL1oySDNQYlNmUnFFNllPR01qazJ2bGs0?=
 =?utf-8?B?U2l3bkpjUHU0NTFnazUvYmJXMSs4b1hyZWVyWmdFdHViaVp6T1Z6VmkvZndo?=
 =?utf-8?Q?wjGEYm/KbsMVrfliYqH/0E/r0lsrqJdxS0Gcs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFEzb08wVzQ2NjlJc1gxV0lBNHZMU2xSSTFxa2oxSVUzSFRGU0txUERISUE2?=
 =?utf-8?B?ZE5NZDVKZXNyRHBSRjN0RHFzaVdZUTVaUWFubW9YZm03YzNWR0ZhbXZ0RDdL?=
 =?utf-8?B?ejMrdmU2VWhBTExKVFkyNjJVTE9STUxVandkblVYS0JLaytRZUZjK2pvQzY4?=
 =?utf-8?B?VzZUTXZ3NlJnOTdvWjBNaXdVUHhUK3pzK2dyV3YxS3EzM0R1OXZESmJvZGZR?=
 =?utf-8?B?VlpzWDRHKzB1cXFhclJHZUpyLzdqVGozQms2MkZCZThnaEtiRERBRllmMnNq?=
 =?utf-8?B?UVdpK1RSd01mUWUyZlpPUDNpYkU1SVlHZFBCcExkZ1QvQ1pOcWc4NkJuc0Vz?=
 =?utf-8?B?em1ab1IreHhVMExOQzZoRUptcGU2Tng5dlBNeSttSTMwM0NlTjZoUGxkOTRV?=
 =?utf-8?B?dEt1cnNjbThBQ3g4N24ycGZnTStvbHd4b3VDT2hUVFJqTDdHZmxpbHRIaFB3?=
 =?utf-8?B?WEo5THRFaUwxZ001dndqNVptTk9aMmlqeHRZN2JIUVN0NlN4Z05CM0JmYzlo?=
 =?utf-8?B?NWsxb29HQlRNc0gzUzcxMi9pTkY5eGVPR0M4WGQ0OEF1Nyt1ZGVZVUhQNjNK?=
 =?utf-8?B?dHBlNnVnYXpIS1BZbktaQjRtZk50QzdMaVVNK1pWZG5QVkhmenFEYW92TWZy?=
 =?utf-8?B?SXRTVGxuVm1iVHJBcmNWaGF4Znd4Tnp1WDVlNm0yVk1aVkNjc1FEK1ZaeDd3?=
 =?utf-8?B?SElCTk1mRDkvc0Y2TzZxL3FnYzQzWFpROTNkTktQN29FeWZreVZJSGhHV3Zw?=
 =?utf-8?B?R3pRRWZLYk5PSzJvN1J2RWttVEVnS2ZYMnA5aUtxeU5IeVVpdTBsNUlvOGEv?=
 =?utf-8?B?eno5UWV0aXh1Q3lBaFNjUGJGOVMzYXdRUndSZ29ocjY4QnA0OWE1YVVkQXdu?=
 =?utf-8?B?eDhLeS9XNDMzb2lBbHMyc3FYdUlKclFHS3hHREg5K2M0OVhJeStIS0xaeHpB?=
 =?utf-8?B?ZkI2OU9vZHNJUjkyem5vOVM1cEdvRElzQUVOOEd4cFQ5UERGTUMvMXNqVmVv?=
 =?utf-8?B?OWZ3ZVdXV1Z6VGVNVnFWWGp2U05tQUdiYnRrUEdoOWs0TG9UY2k0QlU3VVU4?=
 =?utf-8?B?RnljcG5Eemwxc1h2Sm5MeHkvczZOMFJqODI2WWhMYWRHUnMzdXltUEl3czRO?=
 =?utf-8?B?VE5CTS9ndkJTNGxRWWNteExud3pxUCtXN04vRHAzcEx4S2VwMVRSZXhEdjJ3?=
 =?utf-8?B?S3FEb2tyT2pPRFo1cnlJT21vUHNtQzR5TWgwMUlpaUJmRzQvbDlOdTE4Wm9C?=
 =?utf-8?B?WEdNMGxQcnhOQkdsU3NZV3pWV3ZZVXFJYVhGdXh1c3hvemxRZ2xRTGRFNXNs?=
 =?utf-8?B?U3JuNDhuZUdSZUpVZHQ0WG4rbFp0MmRiYXVyeGdONVI5SmpTcWRVQ2pnNi9O?=
 =?utf-8?B?VTNRNXZrNE1XOW44MUZ4V3U2TDM2QjRmUlVTV2NZaGkzNCs2RzVOWlRoMkh4?=
 =?utf-8?B?VDAzdXVWV1VuVFc2dURMQkpGVEdUbFlMaDh0Q3JibWtoZ3NNbGVHbUhzWjlx?=
 =?utf-8?B?SzdpRGNtQW9jcXFlZjN3eFBJWG1tRFNGYUY2MGhXRnBybC9kbXphZGI2Qkhx?=
 =?utf-8?B?d0N0cEdTdGQ3NHRDNDU4bXlDT1NKd201RFpxRWxWcFh2bXNhTitJSjlrZzAw?=
 =?utf-8?B?OEd1TW8xMmU3UkJlY3RTTGoraHdBejg4UGZCZXhmUS9DQmVqQUd5ME1NSzk1?=
 =?utf-8?B?TVhNeW8wV3p1MzZkT0ZhcUFqcStwbGQxSEcwazNVd0t5T01Za0JMeStuV0Zt?=
 =?utf-8?B?V2hFYjZwaktKWVJKNUFNeVE2TjZ3eGtwV2lEM24zWWZUcWZyRVdyWFAvQVU1?=
 =?utf-8?B?dThNQ1J0dFdEbE1FRzNFWUgyQzRtKzAyb2ZnVkk2eW5FcFBMaG9qZUtMdVlB?=
 =?utf-8?B?MDIzUXcwUndOWFE5WkFlWlRROUpvb0RPQ21GS2h0K2hVTTVRRXhzK0dpSTNB?=
 =?utf-8?B?WXdTQ1FsbXgrb3VCTXVOTk1Id0Q5N1NCa0pUV0JjTEREWUNSR0ZRS2xBUElV?=
 =?utf-8?B?S2ZBTS9LaVU0TUgzd3Q4K0ZmdGRpdnFJSjhYb251SDhCRDkxQjk0OEtVME9D?=
 =?utf-8?B?YmsvNENnWEw3Z1huWnV3ajE1WFJjT0o0TFg1bG1ONndSei92Y0VBRTBiVWU4?=
 =?utf-8?B?WGxNZEFnTFJkaVIzdDNUUE9CS1J1c0JGRlMweVdQSUNsS2c5dFZVdk00MUFl?=
 =?utf-8?Q?Mi/S56uXwwmAG7NzoApli9g=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d293cafa-f8a0-45fa-8908-08dd8cc7c2a1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 17:59:35.0266 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KHgM3UPj1USYmdT/Mnk503pCleyI+ksRC8ucBRHzdsa3Kro5ZMAqzx2jomidcVopfzCGmwMULfBvQimgRYbUCbjIv9ifCRRSLy1S3GxVxn0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7035
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

On Tue, May 06, 2025 at 12:09:10AM +0000, Patchwork wrote:
>   Patch Details
>
> Series:  Support active context utilization (rev2)
> URL:     [1]https://patchwork.freedesktop.org/series/148302/
> State:   failure
> Details: [2]https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148302v2/index.html
>
> CI Bug Log - changes from xe-3038-47bf2b0a07ce766d4e893762e02be4a2646e0179_BAT
>                             -> xe-pw-148302v2_BAT
>
>Summary
>
>   FAILURE
>
>   Serious unknown changes coming with xe-pw-148302v2_BAT absolutely need to
>   be
>   verified manually.
>
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-148302v2_BAT, please notify your bug team
>   (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in
>   CI.
>
>Participating hosts (9 -> 8)
>
>   Missing (1): bat-adlp-vm
>
>Possible new issues
>
>   Here are the unknown changes that may have been introduced in
>   xe-pw-148302v2_BAT:
>
>  IGT changes
>
>    Possible regressions
>
>     • igt@xe_create@create-execqueues-noleak:
>          • bat-adlp-vf: [3]PASS -> [4]ABORT
>          • bat-lnl-1: [5]PASS -> [6]ABORT
>          • bat-bmg-2: [7]PASS -> [8]ABORT
>          • bat-bmg-1: [9]PASS -> [10]ABORT
>          • bat-lnl-2: [11]PASS -> [12]ABORT

Regression from this patch series. Needs fix.

The CTX_TIMESTAMP register is not accessible from SRIOV, so we need to 
block that in a VF and fallback to using the LRC value for both 
utilization and TDR.

Will post a fix in next revision.

Umesh
>
>Build changes
>
>     • Linux: xe-3038-47bf2b0a07ce766d4e893762e02be4a2646e0179 ->
>       xe-pw-148302v2
>
>   IGT_8354: 59f7153426484367f58edfafb6567ce4e6a9e499 @
>   https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-3038-47bf2b0a07ce766d4e893762e02be4a2646e0179:
>   47bf2b0a07ce766d4e893762e02be4a2646e0179
>   xe-pw-148302v2: 148302v2
>
>References
>
>   Visible links
>   1. https://patchwork.freedesktop.org/series/148302/
>   2. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148302v2/index.html
>   3. https://intel-gfx-ci.01.org/tree/intel-xe/xe-3038-47bf2b0a07ce766d4e893762e02be4a2646e0179/bat-adlp-vf/igt@xe_create@create-execqueues-noleak.html
>   4. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148302v2/bat-adlp-vf/igt@xe_create@create-execqueues-noleak.html
>   5. https://intel-gfx-ci.01.org/tree/intel-xe/xe-3038-47bf2b0a07ce766d4e893762e02be4a2646e0179/bat-lnl-1/igt@xe_create@create-execqueues-noleak.html
>   6. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148302v2/bat-lnl-1/igt@xe_create@create-execqueues-noleak.html
>   7. https://intel-gfx-ci.01.org/tree/intel-xe/xe-3038-47bf2b0a07ce766d4e893762e02be4a2646e0179/bat-bmg-2/igt@xe_create@create-execqueues-noleak.html
>   8. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148302v2/bat-bmg-2/igt@xe_create@create-execqueues-noleak.html
>   9. https://intel-gfx-ci.01.org/tree/intel-xe/xe-3038-47bf2b0a07ce766d4e893762e02be4a2646e0179/bat-bmg-1/igt@xe_create@create-execqueues-noleak.html
>  10. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148302v2/bat-bmg-1/igt@xe_create@create-execqueues-noleak.html
>  11. https://intel-gfx-ci.01.org/tree/intel-xe/xe-3038-47bf2b0a07ce766d4e893762e02be4a2646e0179/bat-lnl-2/igt@xe_create@create-execqueues-noleak.html
>  12. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148302v2/bat-lnl-2/igt@xe_create@create-execqueues-noleak.html

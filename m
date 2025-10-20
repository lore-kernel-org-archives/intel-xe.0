Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE7FCCD193
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 16:22:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D47FF10E2B0;
	Mon, 20 Oct 2025 16:22:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LmvT9ldz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5F6D10E2B0;
 Mon, 20 Oct 2025 16:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760977364; x=1792513364;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=JeLGvKWrzZGhrfgdznjsvLIMrEDB6Kv119Tn1e7vUr8=;
 b=LmvT9ldzFLs6RWelp06o3OhJHmNRQMzMLWdE/WFQK2IxBqgHlRReqqHc
 hg9BM4Xg+1OmxmqAlw+aHmePsn9nSd5bi4RR+PVPMaoGJfEq2UKM28EvM
 xwo16S6Vtsj1D6Em/MdRDd5PeUIIdY6N15HUP6LTThktwvhW9GXEH/oSJ
 Fzabfnuou+2tRePE477IsYkqPT7zziau0pnQRMs4AWQAMGMAYd+2GDqAx
 h+dcaLyKb6wOH+TBuHo2NnzFVpLX7HurtJNAA0w2RVC9XEanG1jMAT5aO
 V/gpGtZlWPkf2Z24oNAQGj2HwC7YrVUHnllgJ4LRNkio4i/+6ptCjPMSz Q==;
X-CSE-ConnectionGUID: Mf1AC6NxRHicZrfK+iAVkg==
X-CSE-MsgGUID: yllQh4HTQke8XOrRblH2jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="88563614"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="88563614"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 09:22:43 -0700
X-CSE-ConnectionGUID: oLMwJghUQZSYlxHzFuf37Q==
X-CSE-MsgGUID: hdDnHaZ8Qs+Qtg4MLuuM+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="187386024"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 09:22:43 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 09:22:42 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 20 Oct 2025 09:22:42 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.67) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 09:22:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BBjd9s0PzgxoKuMxcdYdrdloagU8QQrhHRPULta9LnyATSNCl6XkGvfAOAp4d/PWQzk6TeFDWFDZoo5pb68mADIz0U4BFJHm6SmWlIPR6QXcFnsEE6ZFOD19JwHyH2ZU6UylQVXFT8xy4X34sh6G141jMBMo2rP9AmNPeXrSR/M72qda6gVW+Hz0di6ahvJwOgqk/ZuBR9WPRtOTPQBLjXjkJGnS33wAfT7NFXd+xtxjJv8AuW8t0CpuOCG/NLs6x0xlF6Kn03IOrabLwJH6naHpQahHVW8BvqMQ2RSv+a03kESuvgeHPIkuhjNZpjEGswsQVds5ikAuiJnZaEkQWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eZ30Au6KYI5ZvycVfgvv3RJf0lFs0D9A/ktD6/k0fFs=;
 b=WqphRLRk87WHtVG/j5/ts+yEEr6084lZbiJMiVe49RjzfqYv1VR4orMs6O08cU/pdrWLYjGlvO9STRYHqf6m4VhxusJmMnUbKrgEclAy/Llrsvo53MVCpQVN7+W480mu7ULqK+dNZCDrd+hvkIUU9yvCVG3F73X7UN3V+dMkYESXnu/RC01T4ofD4sdudzPDVORW/1Dl8ILIXYj0+s/g4RK3tRaDoP/TJFB5lWpW9PazlN/o9i4L632FciPoFR1Lz/YPzAWsQAWwlicRstlZVV6R6emkRi56Wi/HroIw+v5JODS5txYz3K/JXLplmtgmMQWlXUXMGhBLfUhqC23aFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by MW3PR11MB4636.namprd11.prod.outlook.com (2603:10b6:303:5a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Mon, 20 Oct
 2025 16:22:40 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 16:22:40 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <176070661163.27103.4001099300688690431@97596180aaec>
References: <20251016131517.2032684-1-dnyaneshwar.bhadane@intel.com>
 <176070661163.27103.4001099300688690431@97596180aaec>
Subject: Re: =?utf-8?b?4pyX?= Xe.CI.Full: failure for drm/i915/xe3lpd: Load
 DMC for xe3lpd 3002
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 <I915-ci-infra@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Date: Mon, 20 Oct 2025 13:22:35 -0300
Message-ID: <176097735587.3231.7707637789897773279@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: BY5PR17CA0031.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::44) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|MW3PR11MB4636:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fd27067-7293-45a6-c336-08de0ff4e3c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WnhZaGxqeG4vYVJ1OThVVDlKS2h1WmZqRUtGaS9HdlpMNTN5SjF5LzE4SFg0?=
 =?utf-8?B?NlBUNDBocGpXbjZwQzJCb0ZSMXEraFRreitJRmZKdGo5blhQT3ZOTDJOTDhF?=
 =?utf-8?B?ckV5a0N1eE1Md2g5YjBEamliSGNUNERFaU9nMjRSeDdKaFNvMEZzWjQ4Wk1y?=
 =?utf-8?B?Z21JQVlDUVFWdnRKQnBlY0orTUZiWlZUV0hVZ25DMFJ4OWVMYThhbS91YjND?=
 =?utf-8?B?WnM3bW0vNkdRZCtEQTNIZU91TnA1aEtoSmpVNUhNaTNZQnV2SDJONktvaVFX?=
 =?utf-8?B?SFJLUXhEQVBGMTdPc1h2OC9PaCtlbC9sNVJ3UUs2SjFoMmRSYVk5UzRTdzFi?=
 =?utf-8?B?OVhDNXk1WlVmbUtRVzl1SElVVVRrVDFuemowY1kzVkN4ZkxYRkl2ZXh0ZDJo?=
 =?utf-8?B?eUtjdUl1ZW1IczA3OUZyMFNYbzdndnpZMmU5RkpsUzRrWEc4VjVXd1hITzN0?=
 =?utf-8?B?VzZtTVlpTHM5SnVTVUl1OXVSdGhUL0JNRkpTeW13aGdyam5NeDI0eFlDNVhQ?=
 =?utf-8?B?RTRlWWN4RzZaM0ttcWwvd3Jyc3J4cStTZ1FJL3gycSsvdG1nZ2RUOG41Y3Vj?=
 =?utf-8?B?SGkyM0d1RXRNK1k4bk0yV3BBcC9uU3c2VWFjQWdWT1dndXR2V28wT0pUM2Qx?=
 =?utf-8?B?OXBQUzZXVEFid2lNeXZ1ZDlaVFlHVzRLM0xGc2wxcnh5TTRoNXVONlh2S0dN?=
 =?utf-8?B?YWpoTnc0ZzFuajF5ZEVFUmUycnBSL1dpTzF1TnpsNWMwcE1naXhwVkxjQ1E2?=
 =?utf-8?B?REMvWEhyK0FDT0RRTHlFdkoxUTFyak5OWGhtbXdMbjdLUzdNd3FkR2lESkZG?=
 =?utf-8?B?M3I1WUpFV2NSYjNqNG9FRk40aHBySnNlMGMrVHk3USszcWJKYmFBb1JIaFMv?=
 =?utf-8?B?dEhwMzJLcDVPaVFhckFlTWMycWtNVk1QdmdwR0w3RlV5UlJLcDQ2Qk44bUYx?=
 =?utf-8?B?S2VaNXFUQ2swMFhoejB6OEltaWp2Y2JRNU50ZWxEUkJQRmZLb0g4V3JXeFlS?=
 =?utf-8?B?c1NBdnpwaWpSWUVPMmFoSTlPUktEaTFTb3YxcDVVek9VZ2pWK0lHQjZDd2Jj?=
 =?utf-8?B?WFI1bEpJQzNJYWpPaUxZL21JM2ZzKzhCZ0RrbXJGVTJUM0d6TkFSUm5aV2c2?=
 =?utf-8?B?a25NbExVYjFTdnNpeGxQNnNJU0tZc2dHS3RZYW10Sk5wODVBcG00QU1lNjF3?=
 =?utf-8?B?MEN5V0x2emJsbTIwZzRtTWV0N1NJWjNtZjExbktrN3dNdTgvalptQjVxQTBB?=
 =?utf-8?B?STRNL2Y1b3h2ZzRDZGs2SUl4d3J4TnJzSC8xTFkwV1V1RmpZMmh4Y2ZzNnJw?=
 =?utf-8?B?aUZteXBLQUt5RHhtT1FoWmNRVGRDWSsybFczTnRBSVpRbklTdFdROHpkYmQ4?=
 =?utf-8?B?MGZ3Tk5nS0p4ZHUreUhrTk9iNnRCZFlxOEJsVDV2eFJ2dnNlK2VEdmorOU5m?=
 =?utf-8?B?SHBiRGtiUThHalhLbnZBTzQ3V21LN3U4MEo4ZXVlY09kSHkzMGoreUF0WVJt?=
 =?utf-8?B?SEhhbGVIVGJreHNucHhrV0k1WnRRYjdYMVZ1cWdGTVJwakV6MTVXdmsrQVY0?=
 =?utf-8?B?THB2ZVRMUnhQUE5NdGFrSGl6ckpiaVVwZE0yd0ZRTzgySk94dXBqWUthaHFL?=
 =?utf-8?B?SWxZWmFybUxwWSs1UzZNOUVaeDZCK2w4Rk9IRittL0htNnNBOFRCaUp5b3da?=
 =?utf-8?B?aHNQdUtNV2QvbW41Uk1RU1ZwN1dZcFo1U3pYNVpaOFJmWWZ2ZVJTbndFQVNj?=
 =?utf-8?B?Y2l0ZXNyVERIYUdiVHJkcXV5Ym9DTklmeS9Sb1kzajhyanNQTXZWVHh2aFhK?=
 =?utf-8?B?aTEzOURBUm9vL1dCbFRRb3d6N0ZiZll5aWN5a2JNeW4wYnV6NmY3amJzQ0tX?=
 =?utf-8?B?MUIrYTBNRVpMbG84N2N2TTRMT3BIdCs0VlJLaWx0dXJHK1E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1F3Uzc5YkhiWDRoS1A5NG5oUmtNNUJCZllZendncWhQQW1Jb3VwOEM2Wmdt?=
 =?utf-8?B?djFvTDNmMlpmbVhIOHJ4ZkFORlhockt6Njg0STdhTFBZOHBZMVBsTUdtQlBk?=
 =?utf-8?B?bVZYTDcwd2laWW9aVVkrd1BtSkxoR0hBdjNlMzFSMEpabGtTYnlkaGN1a3pV?=
 =?utf-8?B?OWV5bjVWSnY4Ym9iRXAxQTlpWVQrS0pzZkFSci96VjFhRDVOUE1PVGRZRVNa?=
 =?utf-8?B?VU5zMVlpYmZoNnk3RktIV0Y2NDlSd1RQcTJhdkhQR0pnR0d0d3hPd1NUc0RZ?=
 =?utf-8?B?VUZqa0FoY3oxTFZKZGhscnAwRW96TnIxSVg0S0x2VFd6MVc2MkdUbjRXU0xM?=
 =?utf-8?B?ZWlaL0N1d2E5aUtXZklGWFlCZ25xTkY3UzFSVzhKQVRLcWVKMm5VcnU5WVV0?=
 =?utf-8?B?cjJ5ckFxSTJCdlp5N2FhUjFBdWFKckdDYXRZMm1KSzNkVWJDaVc5MlBsTXlo?=
 =?utf-8?B?ZDdtaEExUDdudlFHcnROVDl2cWpyV1pYOVF0dlYvbm5vWnhoM20xSFhCVmVI?=
 =?utf-8?B?MkhjNExRQ1RxM2hRTWZ3QU5KMXN1NklzbFQ3c0wyQ3o3RDArdS8rOHVBa3l2?=
 =?utf-8?B?SThDZS9jUys1WTlaVTVyTm04cXlHUmJRKzFmRnhxWGhNbktvK2dYRFV0aCtC?=
 =?utf-8?B?RUhJajVXNnNaRThjSFFWbHdYMyt1SCs2MllCc0RybndtOEY4a1JheWtaZUF0?=
 =?utf-8?B?S21Hbi8xR0M1bzlYWXNyRDB0STZQd2hHZkRDS3VCSjlRZW9kRHFid2psT1RN?=
 =?utf-8?B?Szd2cVdIanQwYTNuazNoNTlQUExFZ082Q1pDS0NsbUFBME5nZnBoUXhCZEpB?=
 =?utf-8?B?aU5xZ1ZQWWxtY000T0g4SkNjaGJHU1QyNWJBV2QrblZIVHVRODNRTDR2cjhj?=
 =?utf-8?B?NWJabnVQN01yODBhaks1d0hTQVp5bW9GRGsybVlvY1ZPS1NKNDcxRUhnZHpX?=
 =?utf-8?B?eldQWWxFU3hUeFV5eFQ0S1RvQzhrT0NXNzlCcGFBNC9tUXc0emdDZVFGV0h5?=
 =?utf-8?B?UXhRTlJ1WjhOWjBBTGM4akQzbU5JMC83YjFkRVFWOXpSZU9zN1IycVBQVHJK?=
 =?utf-8?B?V2hKbWhCR0Fub1F2QUVwbkpBaklKMXpvMldnd3NVOU03S1d5Q2RQT09rKzVD?=
 =?utf-8?B?NDg4ZVFFTTkwelZFSDBYL0RKNVFSOEd5TGxpbGRUa084dlVDdVBnb3pUZTlj?=
 =?utf-8?B?Qmhpb0ZvTVFqRjZITnJtbC9jT1ZBUjh4Q000TXlaRDJFcXQyeTNCVk1MRXN0?=
 =?utf-8?B?QmN2c2hFeHI5T1ExeXYrN3JqWWZXcFlsN0lucGlQems3NlFXVWtKbUZuNEVw?=
 =?utf-8?B?OFVRY0NsQUJPYkJ0aXo5bGtrOVE1bXlleXQ1aXdTcEJpVWtyRi9PSzd2WGNY?=
 =?utf-8?B?WllyN0JpZjNYTW54UzZtNFZoUm9SYUNmVDlGMkJZOHJzOXRxUlhKdU9nMnp1?=
 =?utf-8?B?VmdPTklBSGdSMmhwMzdLb3hOd05rT0dyMFhPRlVxSmY5VDFITFptaktmM2Q0?=
 =?utf-8?B?QUhqYmJ2VWF5UFlmenJBaTRKeWp2VzRZeVpyMTNTNDZ4ZVI2Q1JYVzJPU3I4?=
 =?utf-8?B?R2RUN3BjalRHM1RZWmo1RXg0NmxJRDcwR2YzVm5lckdlZzg4VW5scWVZNDZr?=
 =?utf-8?B?RFIwRStRM1BMaVQzU3hxd0lhTGh0Tnh4cG0xMitscUg2Q01XUW1tT2M3UXZk?=
 =?utf-8?B?aEIzVkpQUUROQVluV1IxZ2R6YXNuQlgrVEhZU3F1R1AvWStIQjk2Ynh3UTNs?=
 =?utf-8?B?aU1uWHlpd0RLczFjS2F1WG9zbVNIKy9RNGtNSDdEbG45VTd1dkhSanowMHJP?=
 =?utf-8?B?Z3JON1VkUElrT0Y3VThuWUNBczdCdU41VVF0Ty9xUlUzQ1BvOXRqTUE5NWRL?=
 =?utf-8?B?ODNQblNGR3E2SWZleWpZL2JMNldDdFZrVHlkWTR1TGtQYWFVTlNRbFQ1QUJv?=
 =?utf-8?B?Zm5OQnFHcEo4ZldzZkc1bU5ncXUza2FEaEowK01MTjVUZ0lWeGFkaTRhVGpN?=
 =?utf-8?B?WDcyMmp6YmVPSy9pVVNhdlVNdTc0UnM0Yjczc0JmTmpEZFNTc1VNT1pyTlNO?=
 =?utf-8?B?Y1JOem9KVUNJaFhqcEJvN2NWR2RCa2U0dFZOWnBQUDY2ZHdUV0hWbVVCL1Fz?=
 =?utf-8?B?NWZUU2VBa3l6Y1I3M2gxZ1oxNExVTTRKWVkyQ3J0VjZobWZSVUdhUWpMRzJJ?=
 =?utf-8?B?U0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fd27067-7293-45a6-c336-08de0ff4e3c0
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 16:22:40.2054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0WfMp8xHZ5XDvhj2UDfLlRa7Z4VJ//aeWk8FtrhgXN1SX69Jkfjh8Tn8tsmEG2KAf9eo+ZQ9yJaSCokMRDEwfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4636
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

Quoting Patchwork (2025-10-17 10:10:11-03:00)
>=3D=3D Series Details =3D=3D
>
>Series: drm/i915/xe3lpd: Load DMC for xe3lpd 3002
>URL   : https://patchwork.freedesktop.org/series/156062/
>State : failure
>
>=3D=3D Summary =3D=3D
>
>CI Bug Log - changes from xe-3931-c381038b8c345fb0313a67c6eef0a596e5e91070=
_FULL -> xe-pw-156062v1_FULL
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>
>Summary
>-------
>
>  **FAILURE**
>
>  Serious unknown changes coming with xe-pw-156062v1_FULL absolutely need =
to be
>  verified manually.
> =20
>  If you think the reported changes have nothing to do with the changes
>  introduced in xe-pw-156062v1_FULL, please notify your bug team (I915-ci-=
infra@lists.freedesktop.org) to allow them
>  to document this new failure mode, which will reduce false positives in =
CI.
>
> =20
>
>Participating hosts (4 -> 4)
>------------------------------
>
>  No changes in participating hosts
>
>Possible new issues
>-------------------
>
>  Here are the unknown changes that may have been introduced in xe-pw-1560=
62v1_FULL:
>
>### IGT changes ###
>
>#### Possible regressions ####
>
>  * igt@kms_frontbuffer_tracking@fbc-suspend:
>    - shard-adlp:         [PASS][1] -> [INCOMPLETE][2]
>   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3931-c381038b8c345fb0=
313a67c6eef0a596e5e91070/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-susp=
end.html
>   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156062v1/shard-adl=
p-1/igt@kms_frontbuffer_tracking@fbc-suspend.html

The above is not on WCL, so it is unrelated to this patch.

--
Gustavo Sousa

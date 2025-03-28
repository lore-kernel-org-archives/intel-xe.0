Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4046C28B20
	for <intel-xe@archiver.kernel.org>; Fri, 28 Mar 2025 10:24:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3C4710E9CC;
	Fri, 28 Mar 2025 10:24:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DDW0LlZR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71DFA10E9CB
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Mar 2025 10:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743157489; x=1774693489;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=bzhlg6ePbkNCU8jJs36oEw9notZyN655ifLB7h/7TFA=;
 b=DDW0LlZRrWp5mHB8QFWgkk8iN/q4wzu9YZT6fAy9Ozc8EpFa06Y3rF89
 MX2yRAwXzsGoZk/UaWKMgYkdpkRyNLp5QAhjfI76x+DscbDpOTK2MhxvR
 08OOy6P7t7YobWFQtO0vbStCeMMP2yCa9IfxD44ulx2mji4dRXoIisu5n
 gEnfjn1NdohnHzhtShb89Uzm45rcW+UuDvd0X4bxAQJA9K7ENTZiejAvf
 4LRvbR7wNo9Ik5HjL0ViX9uJhMwTZGQNuQBP3i7JWzc5VEWL0YhqCi+fE
 y4xlrBBYCbAPLSgPynvm2aTRgEWW6pK0zkMlamJKls3rCKOAqJ2BUeeVw Q==;
X-CSE-ConnectionGUID: 6wvyBiJ6Rl+zQGO5xNyRrg==
X-CSE-MsgGUID: gQ3JIvX5RAan9AXPEbN0mQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44697352"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="44697352"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 03:24:49 -0700
X-CSE-ConnectionGUID: Z+fIQ389TK6DE8Pq6WXf/g==
X-CSE-MsgGUID: rhHJlBTvSZW7Dt5Zzuwp6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="125400213"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 03:24:49 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 28 Mar 2025 03:24:48 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 28 Mar 2025 03:24:48 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Mar 2025 03:24:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vkU35P+QgqssBhRaxMm2wJYH0yvIuw8JYlDJGhyF0TAhZ4g1q2B50N6xjid58rm01iCl1AHfHur/He81TALiCof9Y+zKeBw8pQ5l9rrtk0gwZgSH5zOB6ggLp7CNfVHj6sOrouiuNMsIEQBbCHBIMQ5Jh4wVhHkVd1fw2t7PECCMgPDauZm/qIjBE4KC3ufxVFXwA/jtkmqTeIYOIvyN5fNwtl85M5L6iIykBWXQMV+ggS91Nu//hrSXpKK38ICB+QXzIqKS9jAgzlcLhggskZ6gTMwVxUSRp1c5APJQsuN2Co5ZW3+VnejJFhcubaQFRd8I/n9wfbgciScha/4+Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7hXKt5fJLmUXT4hvUo0b1RV95fUHTGvqhiqmBXXXSpQ=;
 b=mDBpKWW1/xdtVIniMfWONqCva48MAK8mXsT10FzbinrpC2ppPQsBYRdjvgCJBxxZ9zDGoG+3USuMesRfsqi85kGxr8TvkpgKOrQ0nznEhzEDXKL7YrZa6wMeHcoeNatVBYuqZVoHNnmgI9+SLPLGA4MPZ7yKGrW7f5hv5cPnqWTB2Ig1LlQz2ZmVSfNGYEDegTxBQni+UinS4sKu1eLWpPrImGOTxgCSwteqSuXVoak0gcrrWeKVUt4S2NBIXsCRSnfsG7dgacTI61fT/uOmli6ZGN9usPm0+LfAPZyXOmmnpcS0t2VwxHnFT7dw9XSe2uvSDd9QH5XMGnKKCkodLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH8PR11MB8106.namprd11.prod.outlook.com (2603:10b6:510:255::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 10:24:05 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%7]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 10:24:05 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH] drm/xe/pf: Don't allow LMEM provisioning if LMTT isn't
 available on the device
Date: Fri, 28 Mar 2025 11:23:57 +0100
Message-ID: <20250328102357.2391877-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0040.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::24) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH8PR11MB8106:EE_
X-MS-Office365-Filtering-Correlation-Id: a7944d3e-7e04-4929-ec36-08dd6de2ab21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wk9GZjFhbTQ4VThqcFVqVXQ1dkZZZWpOM0cvMWFjOUlsWDlvK3hTQ3hqMUhm?=
 =?utf-8?B?RjJzdXc4VzVqSGtwOXFDVVNleDB1VnBndzFvK1k3TW9IUTc4bHhVdyswMm82?=
 =?utf-8?B?REx2RzlhdzZGN0pIamtOZTBMR3ZMYURKRkd1Z1JOdHFBY2t1SVo5MlZhU1da?=
 =?utf-8?B?TE14a3ZBcXoyQUpQZlR1NW5NTlkzbTFtRlhta2h3aWxoKzk0TWFjbkxyOTNN?=
 =?utf-8?B?aCtmWXJZZzFSN1VoM2pzQmRKaUxnWVJMZnBBZllqRVpSSTFUVE5NcWRTalFE?=
 =?utf-8?B?RVhwckVITjBZSzlRcmQ3SVYwY3RSTW9FY1FJdmZlMjVkQVZFTzBNWXh3MUFs?=
 =?utf-8?B?NmhMOW8vNlNERjhKdVZ2SmhhbnZPaGdoVU1NenJYL2VrclVFT1V1djM3cWFy?=
 =?utf-8?B?OTNGUDNYcElZWm02Q21tdnZNbTVLc1ZtQVJaSkVlUlpZK2Z6UmJHaUdWd3JD?=
 =?utf-8?B?NlZHYUh3cldRcVU3QWZYbnBlZTBjRk5LbUc0cGdwTklKdFNiaG9GcDZnNTBP?=
 =?utf-8?B?cTJXY0pwSklZUmkxYytmeG5oWVRCS21yelBFSFJkR1o3aVFNZE9zMXI4d3U5?=
 =?utf-8?B?dndDN3JlL0tXVGIyK0RrcHRWaC9SSk5aNWxrMU91M0J1dXo3aUdMSllGV2Ix?=
 =?utf-8?B?WnJPc09CL1ljWmJxSUdGTFdOUVdHYWVpVm1WNHFja3VnZm9ZMUtVMllrRTNE?=
 =?utf-8?B?WjZzc3pNbmZnamxvSmhsNzNyaS9wWmNoZ21tNjArVG4reEdZZ3B2Sko4ajlQ?=
 =?utf-8?B?WTh1bllGdGxrRHpLdHlFdHROTTVCdWxUY1kzUk9pTFA3bkJPSXcvaWllaW1T?=
 =?utf-8?B?NUlRQmppUzdCZ1lEWjh0c3BRRk02bzQrc0tjcmdQbkNHU3ZVVkpQQmtiQzRX?=
 =?utf-8?B?UTUvOG90ZjVqcWhNQUFONWhoSlpaZHQxSUR1ZEQwMWw2OTZTdExzT0FkVTlL?=
 =?utf-8?B?Vmx1ZjJFVTRLQm40cFA0ZXkxK1YwNlFlZUZnV05XNlhyTExydm1mQW1zbU5F?=
 =?utf-8?B?TmN5TzBDQ1ErVVYrUm9ydjQwdlFNMlNVNlkrYXZZcG91cGVkaW5pcC9PWGow?=
 =?utf-8?B?R3FJMFBqNmNFVlFiVnBVQzVpMVFBQWpINlMvcWNUZ3U5Mm4zZFVvSk10RmJx?=
 =?utf-8?B?N2k0dUE3NkhWUTVnaC80bTlYZE9rWHh2aHFMVzhOSWhsWk41cFB3Y0xOd3Rx?=
 =?utf-8?B?S0FRRGlyZHRIRjJaMHNrWGJxbEVjeGRJc2xJWGYwaFRJMEVlSmNMQm9pcnlC?=
 =?utf-8?B?YkZEWmZvRWJCRDJKc3JmS1loZ3FvMGVCWW1JS21pa1ZKMDFwNU5KMlFvVVhM?=
 =?utf-8?B?U1Z1aEdEanUwY0UyVk02bzNlS2R0cDczWW9tWWh6Y1VpK1pPMnU5dy90eklx?=
 =?utf-8?B?ZlFUZ0VTN3AxalBtbmhhZmhPL3pPVVpvRlJEWDJ5MEhjMVhENW9ESS8xYSts?=
 =?utf-8?B?Y1NjSGZUc2FyVi9LbTJDYUozM0QwaEVkMXdSaDIwSlhlNDRDQy9RSlU3cG5y?=
 =?utf-8?B?cjlrdmI5Wkl6U3FoSWtlNlQxSlJJSitpZWtoVXhXRG5heWZFU0FYaG1KSkRM?=
 =?utf-8?B?SnlqQy9nWXV2UlZtODhvTkwwNjZ1TXlDeGtnRzNBeXB6OWRLeUJhRk5SWjUv?=
 =?utf-8?B?L0QyZnVvYSs1dFdWdldvZDdUYmtBSy9nc25kL2hsbHlCMlcxODdSZEMvd1Rk?=
 =?utf-8?B?OEFVRzRMaHc2azhEZ0VoUTdrKytYbmJFdTlldUpRNGlwTEtMZ3ZJTStoWTNG?=
 =?utf-8?B?UDRzTVpCNjNRUDlkMUluSncrUTN6QTFnWTNOQy96LzlRbXc1Wm5qS3h1MVM1?=
 =?utf-8?B?bm5GZ3pLc1BNanZ1c0lBTHVTMWV1Ylp4bWFKWXZHUmFPSThYWmRaeXJ3M2ly?=
 =?utf-8?Q?A9kbpoAzmTr7i?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWR2YnNnQzMwRzJ3NjgyNmxLdXY5TXp1UTBORVBGVGxuNmhRTTRNcVRWSzVM?=
 =?utf-8?B?UTB0OG4yOStVMm5mcXM3MHYyVm1tREgzSTNqMzVMRTFuS0FaeHRzMlhvK3RQ?=
 =?utf-8?B?RmdzRU0rUFlBN2FIc0oxSE9OTThOT0pLMkE2OWJzSDgxT3MweE1KVTVEQ3kx?=
 =?utf-8?B?ZjBpNzJ0d29Ka2VJcFBuVU0yQUozT3ZHSThQLy84VEFBZTc1NC9XZXA2M2tG?=
 =?utf-8?B?UE5OMk8zL00ranYzWWxFOEFXN0dWbURuRmJ0MUkvemI3R0pJMzhubkhiaUF5?=
 =?utf-8?B?allQVEV1cU1WUmtGbUJWT25lYVhXOGN0SEJDZEp6ZThHd1FBUVlaY3BKdU5t?=
 =?utf-8?B?bGRDTjhHQndYQUdpUGppOURtYmR1YWxra2YzS09GMWNja1Vpenh0V2IwVzZL?=
 =?utf-8?B?MWVRZGdLWGNITFJZT0EvdmJVTTZLcGZRWVNVQmJReS9XZTFJejlwbXY4OHRz?=
 =?utf-8?B?aU9HK2UrVEN0K2xDa3I4bjJ6Z1NWWG9uemJPT1p6cWxNblVsVjhxT3N2eWYy?=
 =?utf-8?B?aGNEMmt5NU1ESGJqTm9ycjA3VmxjNVd5bTVLdlVBanFkbVdGZGM5RG9DMkRo?=
 =?utf-8?B?cmZ6Y202UmJYaU9sV1VPcG5kS3UwSGx5RWZWbVh2Q0hNSEFjVEpWbnZvR2FT?=
 =?utf-8?B?OHBxQTNpa1ZXL3psQ3BtQ0g4Ui9rNzJKVkNXT1d0RWpWaVRCcWx6SGFBdnJ6?=
 =?utf-8?B?QUZHNlRaY3JQTWFMTGtHUVZGZk5yaDMwMVdKLy8rdm95RDJobGRINzdzYjZJ?=
 =?utf-8?B?RExWMnAvMkJnbktLQ0s4Tkd4MXJGei83MkwvS3NhZ1RzcitzZi9IMDJLSDkx?=
 =?utf-8?B?UDdsZkwwUGpuVWJHRG44UCs4Q1BCc21OZS91QWFKOHp3aUcrU0ppVWRLV3du?=
 =?utf-8?B?TTdjZTVKUVNSazM3dURMTnI1aE9oUmxoRG1YdDZoREx5LzVIbXhNdmovVW1o?=
 =?utf-8?B?dUR5eVVFeCtEVjVackQvNU5YRnFQSFh2THpDMkNYYit6bk85KzRsV1h1WDU3?=
 =?utf-8?B?NWx2QWtvQTJkUTlZejh3dis2TXFPS1cvd21uSEkrNHRyRmNJOU1nMGRRYjAy?=
 =?utf-8?B?K3JKbGxiMytFQTgzc2hLNmZSVk1adHV1dnRqcWhkR2VyZXZnV29tcUtEVzBp?=
 =?utf-8?B?U3MyUjdWbnQ1KzEzS3NUYlF5eG9CaG1qb1I3ZThCZmZNVllKS2c2ZVE1alJE?=
 =?utf-8?B?bHRvcGlDR0VweXV3VlpTTkc2dVp5RDJhdStOK1pxNm84Q3c2cWg4VjY3Qk91?=
 =?utf-8?B?enBDallaSTFjaWZGeC94dVlnQWFnV1BNTkYxQ0YvVlR4ancydjM0aDBJd05k?=
 =?utf-8?B?WWtZUWR0SElNVWNDb1RtMUF0T29VRFYyRFVFV2pTWXpjWmp6UVYzcVFxSGRw?=
 =?utf-8?B?WWErU3c2Tk5vaXBuTkFvM3krVjJhR0lpSTZPSkE4d21MR0dXeEIzTkx5K2pW?=
 =?utf-8?B?OHBKME5SQUd4VzFxYjEyb1NYdjcrcVc1R2V4TEVBNXVidUUxZ1RpU1c0RWZ0?=
 =?utf-8?B?Q3V0MFdJK1hyTVR4OFdtZ05zMHozM0hIbUdMdXljejh1WkI2TnNONEdCc3dt?=
 =?utf-8?B?RmZGNllVL20xRDdzU0szRmFuOW5NV042czFDTC9hWkg4S2ovdHdPYUhaVFpy?=
 =?utf-8?B?cEQ4WGllVnZ3R2NGQkZwZUF4LzJGd1hlaEo2dk5HS0xHRDNsOVRnWk16RURG?=
 =?utf-8?B?dWt6QXAvYmN3SDM1bFpBL2VjakZMc2ZQbnFwZStreHlCRXFTZW8rRFc1TExQ?=
 =?utf-8?B?MjUrOGhtK3krYXY3cURiU2tTRUcxTDZscE1XWWNMVGV2UDlPcFl2ancyNy9B?=
 =?utf-8?B?M2w4dzIzUWFVNUJHbjcweHNTVmVwTnErclJWV3k0aTl1WWxGZStoa2dzajZC?=
 =?utf-8?B?WER5cHhKTnpmU2swbVRIRk9MVlpIcU9ZOU80VENCamlSeStBV2RnampwRDBT?=
 =?utf-8?B?cFpCYXJqYUNmbjZIYWhObEJ1WW9WSnFuanlHanFoaG43TGFmc0k0NVlEODFv?=
 =?utf-8?B?cUNkK1I3VnJlcFBqdHczd3FmOTgyaldJK01WdFlub3ZCZGp4WDN6MXFFbDdY?=
 =?utf-8?B?dDErV2YzOVZxWStsdHRJYlZHZHloU1Y0Z1lYZUQxQ1J2Vm0zeHBENzhOaGI3?=
 =?utf-8?B?NnJBWkZJRTluL3dkUmIxNVh0aDVMRUpObFNaSlBaWEwraHlsSm9MOEhzczlB?=
 =?utf-8?B?dFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a7944d3e-7e04-4929-ec36-08dd6de2ab21
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 10:24:05.8426 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TGLQe2UZHh86fY1oBUUJqRjiCTTuUCgOJnXwKrbehcvTHPEcOsuT/S0VNDye32ye8Apvlf3XxJbpvL0aBybA22WVCP0aAJ/kiaUQwiv8sfs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8106
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Currently, LMEM provisioning is fully dependent on LMTT, and we are
unable to make useful LMEM provisioning without LMTT.
Let's don't allow LMEM provisioning if LMTT is not available on the
device.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c  | 8 +++++---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 10be109bf357..265e58c55c6d 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1513,7 +1513,9 @@ int xe_gt_sriov_pf_config_set_lmem(struct xe_gt *gt, unsigned int vfid, u64 size
 	int err;
 
 	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
-	if (vfid)
+	if (!xe_device_has_lmtt(gt_to_xe(gt)))
+		err = -EROFS;
+	else if (vfid)
 		err = pf_provision_vf_lmem(gt, vfid, size);
 	else
 		err = pf_set_spare_lmem(gt, size);
@@ -1621,7 +1623,7 @@ int xe_gt_sriov_pf_config_set_fair_lmem(struct xe_gt *gt, unsigned int vfid,
 	xe_gt_assert(gt, num_vfs);
 	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
 
-	if (!IS_DGFX(gt_to_xe(gt)))
+	if (!xe_device_has_lmtt(gt_to_xe(gt)))
 		return 0;
 
 	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
@@ -2155,7 +2157,7 @@ static int pf_validate_vf_config(struct xe_gt *gt, unsigned int vfid)
 	valid_all = valid_all && valid_ggtt;
 	valid_any = valid_any || (valid_ggtt && is_primary);
 
-	if (IS_DGFX(xe)) {
+	if (xe_device_has_lmtt(xe)) {
 		bool valid_lmem = pf_get_vf_config_lmem(primary_gt, vfid);
 
 		valid_any = valid_any || (valid_lmem && is_primary);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
index b2521dd6ec42..5f41381df860 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
@@ -286,7 +286,7 @@ static void pf_add_config_attrs(struct xe_gt *gt, struct dentry *parent, unsigne
 	if (!xe_gt_is_media_type(gt)) {
 		debugfs_create_file_unsafe(vfid ? "ggtt_quota" : "ggtt_spare",
 					   0644, parent, parent, &ggtt_fops);
-		if (IS_DGFX(gt_to_xe(gt)))
+		if (xe_device_has_lmtt(gt_to_xe(gt)))
 			debugfs_create_file_unsafe(vfid ? "lmem_quota" : "lmem_spare",
 						   0644, parent, parent, &lmem_fops);
 	}
-- 
2.34.1


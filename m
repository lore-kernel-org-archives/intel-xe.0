Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23F6ECCF9E0
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 12:22:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3FA810E0DF;
	Tue, 28 Oct 2025 12:22:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NeFP5+I5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEDED10E0DF
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 12:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761654138; x=1793190138;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Vg2WybzpMNYfA7uhsgHkIbIiqFJZIuPv8G2bGEvcw9w=;
 b=NeFP5+I5rsOGk0u2DggdUXO4qhShFXQ8oyVOuISd4PG39z/bMc8dANZ2
 9NJrAauvAFmwaJ4H26SzZBWZ9/Ls1zjsQQU6wpoIFbTBGLjxh77nP4qOF
 LKOBfg36GSs4XmySSc0WzjNY3LNRT8P+G1abk+qXke2mJyItT1BeJ0YVn
 gNrBlRJNKIGVHZOFuRctSQj5YXw898tMDg9w5MbWUD1L7JOczaJpOeaDw
 jfapFPm9HtbfXBHhKSlFzc4WebZev7iE66KevQ2Xkxb8/PDId/CSxStir
 Kz5kZLfVX2qdyLrldlx45DfdKOVpWc+L8xUmENG/+36pgwINxaDCS6W0j g==;
X-CSE-ConnectionGUID: wNzX6Z5NTLGLctGUYA7IdQ==
X-CSE-MsgGUID: ++2LXSzRTN6Y+y5K+UBWgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66368124"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="66368124"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 05:22:17 -0700
X-CSE-ConnectionGUID: sTpA1rIIQV6uXRSD/RYkKw==
X-CSE-MsgGUID: mRE1T9rHSkeQTp+oAi8N3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="184566591"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 05:22:17 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 05:22:17 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 05:22:17 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.23) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 05:22:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mXaWrkHOXb64ehxpCBxfUZB40uhkK5nFu/cePgeo49l4Q/JB1UPXHAyJh7XEGghIUMgWKSVrgR/T7gUlynfMxp0Mk1cqEtPexWNbDvOFghg8oGTflg16M9mG5VnNN4/jtRwuff2+rc1RORR1w96bj8jGq7BVDa/U1bInv7RKDuXKmmkJ/FO9CHilf0ntto8pJ3otd8WO2VPSMdHF6XQ8t2jJUUUgqtTveoswkk+zurJZ7nr+mGX4SDq6rJb4VZxsSaTwir58cEXjaXwCHZ/+dneTd4+NAXIKxI6OX3uKJn7apuLiYI9u0WSV376vPWGuMWArCpJdIMq5fjDcSGK7PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ofv3bf24GbgeT+OgPn+VVx4dL1brWfyfVVymg8/tfJA=;
 b=JBX5AkGXDoQs2YmjeB/+Iu4iGChnL290WlmdMbeZnfeVQesdBqsYSJ5scCNxAAWZGJ38FF0FG1mgLvsTxUYjNAKrLagL/RhbKIOn8HwWY4sQUwp+o7HqGnL13RqDrZ8eAPonoruIO2RcY1vH+3tNuDl22mtjvFeM5NoAMEoh99DzccKga39Vq/v3NiZkh8JcHwR0hfblxtHrr+YQUdBBeHrTzxiSgzQ/yNiPXqXUvk4hu95NocdUBfeB7G+H8xjYRByHBsAbJahl9VHbexgxBBHSNQEdOEjkf0U54/ujZvhb+b+7jYMTzpwCygnOsPxKIa8rQkDtrXL0hzbTFCj9iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH7PR11MB6474.namprd11.prod.outlook.com (2603:10b6:510:1f2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 12:22:13 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 12:22:13 +0000
Message-ID: <fff931c7-f60d-4e14-a01c-1a4291d352e8@intel.com>
Date: Tue, 28 Oct 2025 13:22:08 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/14] drm/xe/pf: Promote xe_pci_sriov_get_vf_pdev
To: =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20251020182414.576-1-michal.wajdeczko@intel.com>
 <20251020182414.576-12-michal.wajdeczko@intel.com>
 <20251028095734.yfyfszbo53xdlgeh@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251028095734.yfyfszbo53xdlgeh@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0192.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8d::14) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH7PR11MB6474:EE_
X-MS-Office365-Filtering-Correlation-Id: fdd47ea1-806b-4431-64fc-08de161ca00a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q2NPSXZkTmdMTE1VaHliWDcrM1FGazlIekVvUGZBd2JmclRLUGt5ZU1QRWlG?=
 =?utf-8?B?TERVdUFoZGMvVjE5eVJ0SFlUa0Y5L01PYWk2S1YzT01EUHluSkhnN01kL3BJ?=
 =?utf-8?B?SlIyV2JESkM3TmJXTjFOeGJHVDJUMTd3a3lYa094dEdrNW94em10LytCWmxE?=
 =?utf-8?B?emxnMUxGSmFYa3ZPUjlYdWZpWGhoRHZSNFkyOXBKL3o5VzNYT2ZxQTlNczNo?=
 =?utf-8?B?QkVPUDdQK251RTBGakVCSC9UbnJEMVJIc05YcVhCZDFzU3A3SzlqVXlCQTk1?=
 =?utf-8?B?ODh0QzZ3NzRIZlpRUU9XV2ZicERyci9jUW5yLzlDcExZRXhDL29Sc1pCaFdY?=
 =?utf-8?B?akJ3YURLeSs3aUllTmpjN2p1RFNJSG9VK1ZTb05ZckpnR2o2TFhTQm5rYjdD?=
 =?utf-8?B?Si9xZWY1ZGhCZTBJTzZ2SWU0YWwxUHFjTFFBYU5pN3ZHV2F1Z0sxaDFWRjQz?=
 =?utf-8?B?UnF5VkM2Q3FnQUozTUREbnJZYTBwVmhUNk5mOURFNXFwTnRiVHpFeGtCQXRQ?=
 =?utf-8?B?Yk0xUXFvVmtUbHlUa2VmNW9QR09TVUFzd2p0QXlBYkpIQWN6VEVWR3BNWVJW?=
 =?utf-8?B?QmZCeHpva0o5V0Q3bGlFSEFiQWlGTHpLa3dYVjYxNkpaaWhVT1ZtNitqVDJQ?=
 =?utf-8?B?VVIzZEVLR0hhQUpPd2ZGaFdNenpwMUNFbVIxc3B1eXhaOGRKUFVrbzZoTmdE?=
 =?utf-8?B?SXFHSDlPdDQ3K3NMeWdFYTNkYllWdEwzUEpINVdIM0RiL0tJTHFVeitncXB5?=
 =?utf-8?B?L3VqOGRjUzhUVFd4UWdDNzQ4Rk1sdzdBZ3Vmb1VMd3ByM3hSRGZtWlBYZHNz?=
 =?utf-8?B?aVJHY2FXbzV0bCtDaENVbVFWZWdhTzBvWnoxaTJuTGlXWmhsczBDdlkvczgr?=
 =?utf-8?B?K2NVZmEzaUF1M0Q2S3RBZGZLQnRyclNrR3kzeXRMWGNPU2tScXBKOGtzRzN3?=
 =?utf-8?B?VlBZdWJWZE9QVW5zN0NIOHFsWC8zQ2h5U1dFQWtEcldQdjZ0K2IvQmNSWGE0?=
 =?utf-8?B?NHFVWFFlTkNwYmxiSnBDNkNlU1pGTytBS3MzTUd0NUJPSCtkeUhRMGptRkpx?=
 =?utf-8?B?UGw0OXkzZW5WTTFhcnVNNlJUV1Z3WGJaT1RjNlFGb014N0VvUFZVekdnb2Jm?=
 =?utf-8?B?R3lmVEx2RC81UnZqcmRZYkFrblpaMlg2dHplcmk3WWJ1d1pkQXl2T2REYUdS?=
 =?utf-8?B?YmluWml4dEhQT2o1bGdtb2VyTFBQdnpkRzk1dEV5YllrcHJYU0wvN3VHM0JB?=
 =?utf-8?B?cUVpbVJscnJHc1psQ1BFODFHUXBralhNZ3M3WDZvbFRvK2xvMVVadEpqTzhC?=
 =?utf-8?B?S09KYnNQeFZib0R2U2F6c2tOaGt5eDVKYzd3WXhaLysxZUZ6OEVMNkg0WkZE?=
 =?utf-8?B?M1FXbDcrOXkrUXVJNWN0QkV6S291R28yUi9rTTRpWS9RV3IwUGJ6bUs1cDh4?=
 =?utf-8?B?TS9HNFlRNVhpNzhnY0RXS3Q0T3k5Z1M3Tit0Y2xlMHJJMVJ1MEg4cUs0dm1L?=
 =?utf-8?B?djFqdWVsVnY1ZEJrZGJ0Tnl3WFRrdDJjc2xYSlNnT1g1MHJRUzZxSVR6ckhU?=
 =?utf-8?B?OFIzUnFGU0ZldGNidXo5Ty8yK1BwOHc2Y1hTemFqVE83Q2V1S2VramFSM2Fh?=
 =?utf-8?B?ckFyUnFFKzFaOEpRb3RBR3NpSmhFWXVQNTFqMWZjUUM0UUt4NnZvYWlvWGJD?=
 =?utf-8?B?eUdLZk9yZ1A1S2JJRDlqcnNPaVRjOFhJVXg4dlBqcjhMdXYyczBac0Y4dlA5?=
 =?utf-8?B?UmNCQktlaGdlM1RXWmVxd0JGL1hGMHp2cDdYdWlsOUZhS0V6cTVuandUY1d0?=
 =?utf-8?B?Sk5KREVjSTJwZ2lyem1jWnI5cGpkdjRpUE9uVWZoR0ROditpMUVqek1VVk1V?=
 =?utf-8?B?UXdnRUJEdkRqMjRTdnB3U0JKeXJwUVVEQVlvalJvcEYyS05aNnpmSFRmWnJF?=
 =?utf-8?Q?x+hbCQJO4Kws/MtwVBUkmYq3Yd1oJb1k?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWEwaWREc3JWaS85dm5TS25oNzl4SFJrVGhaQVBydVR0RVE4R3BTUUlCVEU0?=
 =?utf-8?B?TUwvZ1RQaGp3TXgvK1VBc01lY0NXNGZGbTJiblhtV09helZFcUpucHZFUDly?=
 =?utf-8?B?MXRPa2plNjcyUjZKNGhSU2J1WEVwZDJoaU9VTHpXNG9TNmFObHNCcG9qamJQ?=
 =?utf-8?B?bEZxZCtyVEVNb1k0MUxkQnAyOUVpRGVva2Y5cWtaY1Y2REk4UVBHMk9xbmdw?=
 =?utf-8?B?WGZUTXYxei84R1ZRV2hnb2JrMXM4ckV5V012RzFJME9qTncvdzlya2JIN3V6?=
 =?utf-8?B?ZW9FRnUyRUIzcGdCQkpzS1h3a0xsdU5sbHdoZS9pRyswekt3MFdBS3JCQWhV?=
 =?utf-8?B?MHl1cGp4ckMzNDJqcHV5S2ZJL3ZUVHhUYndaenNleGgxa2loRlJIY3R0MzNz?=
 =?utf-8?B?UFdNVU5BTW1PMDNuZGpKeWhJVUhvclk5WEFyTDVIdTRZS1NEdERhdUg2V2JC?=
 =?utf-8?B?TUZSZnQrVUdORnBRZlhTc3dJWXI3c1J0WjJocTBBWng1bHRZTnZEMmxQM0t2?=
 =?utf-8?B?bG1qbjdUdlNVTGVxdTR0YTFVd1E4R08wMmkwWUxhRmNvZVNTUTBXQUNYN3pj?=
 =?utf-8?B?ZkQxRzFNL3NuQWFwMUhJTE83NE9TTmRWcDV3TE1kaFBHMzZwY3NOOWZzL2lm?=
 =?utf-8?B?RkF6VC9pOWlXWXNqN1ZNYnRyekQ3T2syZVdGZ29UVWs1K1hmUURDUEtlUnk2?=
 =?utf-8?B?MnNWcWJRemwrZUtVZ0FKY0IzekZ2aElKeng2TmhEdzBHSHZHTmZqYTJja1lR?=
 =?utf-8?B?OUt5akwreU1zQnYxWWtxQ094WkJQSVVHRHB4c0RNYkdLVEl1MldCbzNWL05P?=
 =?utf-8?B?VkV6OFJyaHRmcnpwVzJtajlWVDhrWEgwbklINjIrZElZaDJiWVNUenR5TlF5?=
 =?utf-8?B?WEtsaWFLbEhNRjhVKzdZKzJVYnZzbjNscnB0WUtJS0U3UklrTGlTNTZMOWZq?=
 =?utf-8?B?YnJxZXJWZThZWGxxaW43bUFQTUVHTGt2VzJtcW5ZbUM5ZEM1TkJOelNaS0dU?=
 =?utf-8?B?NTY5TVZ2Q3poV1kwcmNHaHd3TFpEMEhDUC9UZnhiTHNhaHNKbk9OaC9UdGdi?=
 =?utf-8?B?MkVxUVBUZVdZdTJYWlVDNjhrYWcxUyt1dDVTWUIvcmRrdk5JaExMZ1FHbk53?=
 =?utf-8?B?SmJNR1c4UVJDaHR2N1pOeFJhWnlzcGZmeDdUdXM1eGxNSFFxUmNpZGNrWG1y?=
 =?utf-8?B?NUVlbE95RFdZTDlMTFFycE5QR3ZacDduTXU1MlVXWURSc0JTQ1FFM2NQYzV4?=
 =?utf-8?B?OXZLREhUQ1VGSndSN2tycytMbU02VUNmTWhVRXViODEwakNxRFRkRkVxUHVL?=
 =?utf-8?B?M201Q2dMTTA5YjNwejVaNjM4MVhqT0xhSnZlam5oZ0ZaOVBQYWdyd2ZxaHl2?=
 =?utf-8?B?SGREVUh6Q3NodXNIenFnN055TnczeDlTMVoydjkwdlU0S0RNVW1xRDdYWkI2?=
 =?utf-8?B?QVl6dTBUNmUxUEZGbWFZT1dROFFLaEhibU1uWWhYdDJGUlU3ZzBBM2wwZmUy?=
 =?utf-8?B?VzJJeVpGYTBmeFl5U0laY0F6a2NvU3pNRUtOb0ROTFdWdFdmZXhLLzAvZjNj?=
 =?utf-8?B?ZVE0L1pnQjZzRzUvZkswK05GUmNGaVdtdWNsNVJNYUVIYkpkVzN5RnJSNG00?=
 =?utf-8?B?ZlkwR2ViRXJqL0l6QjJaL1c4a1NtZHVBWmR6V1FOb0czRDZuVGZxWU02L1lx?=
 =?utf-8?B?aTlNUEk2YnJiNEtLaVN2U2crT1cxbEhnNmFwQUdZZ2tYM2tjYVFJTW5WcTA5?=
 =?utf-8?B?Q3hod0tVQnNnb0ZCRmpka1JuZVBrck41dXYwbHVabWg5ZHRwR1lmVkFJVzZY?=
 =?utf-8?B?TVl3WTc1WFlxdkJ0UGZNNHNBZ0VHVmhJSk9ZYU1SOWVnS2dWMkdEK21yUlZh?=
 =?utf-8?B?bFBla2VMWHNOTjdwdFFzNXcwUldOc0poQzR1WFFMck05M0EwenVYY1ZkUWdK?=
 =?utf-8?B?K0hCY09iQjBmSjZoSUVMZVpGZzVFdEZGVUNQck1IUTdIWG1LM284Uk8vbmF1?=
 =?utf-8?B?SkVibkUvQ042cWNNQjZlVGF3RHQwOVpVMEhSYVBZT3pJbEgyY3pteC80M0M1?=
 =?utf-8?B?ZmgxZUx3cWFnaWdZZ0hCNE45NkVzWFNCZVg4dnNwWHVjRk0yYm9JM3YvTE9s?=
 =?utf-8?B?SmRFS2hxOXl5QWphWmhrdDNDZnR5TGNtNXRwZUl0aHNURlVkbFBVRjBFWjhJ?=
 =?utf-8?B?aWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fdd47ea1-806b-4431-64fc-08de161ca00a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 12:22:13.6483 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nW2RV3TtxmxZIPvGu12pS0EKnUJCvUX2KRN50c+0v4obaAVn6ff2CwldK5l3yzsqa5GnI4WfJN/bBhh8IC811cYpn6FUtaj3AOiHXCRmHwU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6474
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



On 10/28/2025 10:57 AM, Piotr Piórkowski wrote:
> Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pon [2025-paź-20 20:24:11 +0200]:
>> In the upcoming patch we would like to use this private helper
>> during preparation of the sysfs links. Promote it.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_pci_sriov.c | 37 ++++++++++++++++++++-----------
>>  drivers/gpu/drm/xe/xe_pci_sriov.h |  1 +
>>  2 files changed, 25 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
>> index 735f51effc7a..678e76703cd8 100644
>> --- a/drivers/gpu/drm/xe/xe_pci_sriov.c
>> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
>> @@ -30,18 +30,6 @@ static void pf_reset_vfs(struct xe_device *xe, unsigned int num_vfs)
>>  		xe_sriov_pf_control_reset_vf(xe, n);
>>  }
>>  
>> -static struct pci_dev *xe_pci_pf_get_vf_dev(struct xe_device *xe, unsigned int vf_id)
>> -{
>> -	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> -
>> -	xe_assert(xe, IS_SRIOV_PF(xe));
>> -
>> -	/* caller must use pci_dev_put() */
>> -	return pci_get_domain_bus_and_slot(pci_domain_nr(pdev->bus),
>> -			pdev->bus->number,
>> -			pci_iov_virtfn_devfn(pdev, vf_id));
>> -}
>> -
>>  static void pf_link_vfs(struct xe_device *xe, int num_vfs)
>>  {
>>  	struct pci_dev *pdev_pf = to_pci_dev(xe->drm.dev);
>> @@ -60,7 +48,7 @@ static void pf_link_vfs(struct xe_device *xe, int num_vfs)
>>  	 * enforce correct resume order.
>>  	 */
>>  	for (n = 1; n <= num_vfs; n++) {
>> -		pdev_vf = xe_pci_pf_get_vf_dev(xe, n - 1);
>> +		pdev_vf = xe_pci_sriov_get_vf_pdev(pdev_pf, n);
>>  
>>  		/* unlikely, something weird is happening, abort */
>>  		if (!pdev_vf) {
>> @@ -228,3 +216,26 @@ int xe_pci_sriov_configure(struct pci_dev *pdev, int num_vfs)
>>  
>>  	return ret;
>>  }
>> +
>> +/**
>> + * xe_pci_sriov_get_vf_pdev() - Lookup the VF's PCI device using the VF identifier.
>> + * @pdev: the PF's &pci_dev
>> + * @vfid: VF identifier (1-based)
>> + *
>> + * The caller must decrement the reference count by calling pci_dev_put().
>> + *
>> + * Return: the VF's &pci_dev or NULL if the VF device was not found.
>> + */
>> +struct pci_dev *xe_pci_sriov_get_vf_pdev(struct pci_dev *pdev, unsigned int vfid)
>> +{
>> +	struct xe_device *xe = pdev_to_xe_device(pdev);
>> +
>> +	xe_assert(xe, dev_is_pf(&pdev->dev));
>> +	xe_assert(xe, vfid);
>> +	xe_assert(xe, vfid <= pci_sriov_get_totalvfs(pdev));
>> +
> NIT: You already mentioned this in the docs above. I don't see the point in repeating it here.
>> +	/* caller must use pci_dev_put() */
>> +	return pci_get_domain_bus_and_slot(pci_domain_nr(pdev->bus),
>> +					   pdev->bus->number,
>> +					   pci_iov_virtfn_devfn(pdev, vfid - 1));
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.h b/drivers/gpu/drm/xe/xe_pci_sriov.h
>> index c76dd0d90495..b9105d71dbb1 100644
>> --- a/drivers/gpu/drm/xe/xe_pci_sriov.h
>> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.h
>> @@ -10,6 +10,7 @@ struct pci_dev;
>>  
>>  #ifdef CONFIG_PCI_IOV
>>  int xe_pci_sriov_configure(struct pci_dev *pdev, int num_vfs);
>> +struct pci_dev *xe_pci_sriov_get_vf_pdev(struct pci_dev *pdev, unsigned int vfid);
>>  #else
>>  static inline int xe_pci_sriov_configure(struct pci_dev *pdev, int num_vfs)
>>  {
> 
> Shouldn't you prepare a variant for case without CONFIG_PCI_IOV for the function
> xe_pci_sriov_get_vf_pdev ?

not really, as it will be only used by the PF code (which is already under
this config, and without PCI_IOV config this will not work anyway ;)

the only reason why xe_pci_sriov_configure() has it's stub is because
it is called from the core xe_pci.c (twice)

> 
> Thanks
> Piotr
>> -- 
>> 2.47.1
>>
> 


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A4AD3F081
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 15:56:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CBC410E2CE;
	Wed, 28 Jan 2026 15:56:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A2fJoqlx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B87A10E2CE
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jan 2026 15:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769615814; x=1801151814;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=fmCrI3N6n1wI5EXIEXWHaI/3wAfDH4AbIR7ZnnEVowQ=;
 b=A2fJoqlxP/ih+V4NVJHl8MW1ijMhfEh0AMh+9kKEaW1GZhK8uIZAi8Gd
 qi5XUO1sc0cMhuXwEbZTKQG+yFJYr13Y+T/R6bGmRxx/S3BpsgItwHYpw
 DvW86pD/Bl+CXEsKA/k7uViM2EHfair2nvgCtneN53IZ8JRw5Vk7vnQ2r
 bM+kS+EuywHl9lrMXZIR3JLEeR/j6XZY9aB9sWSebXx4ExCSWQHHomvts
 zvyFwHCE3PnkdLZ1KI1YNEPZCFe2EE78SO9U46/RCFDescANnMJWJaLZW
 hWbz6+ddEA/IRnyK9gu7KF10tv+fU584SU/3tnVOfh0GP8ctorfvwy80G w==;
X-CSE-ConnectionGUID: BALgCxGPTPyDnSNwqw59+Q==
X-CSE-MsgGUID: PY8oNTugTXCFRT+GzL2ghg==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70031257"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="70031257"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 07:56:54 -0800
X-CSE-ConnectionGUID: VBEy69ZUR8yHzBur2yht7w==
X-CSE-MsgGUID: JMNItfBJTNK5Xau3iOdjoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="208738312"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 07:56:54 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 07:56:53 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 28 Jan 2026 07:56:53 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.32) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 07:56:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LzTDi/rL4nJ25BoJ2A0GprRo8IXd4B1e3xg9mUROK9dM6xoYSdJq4Z5UzJ068NkjzwZYqinWSMYBuyoItcy2fsxKCVFMo253mhuOuEzUGPe77VNTzd8yTbcC06S72s4R23d7K9rsTQKRem2L3nI8f5vcJFJSCnIVWIU4da2TTn1mJGckopBjF7mMOSLDkMs8MU23kb3BcT6PEBu60Af+uSIvNJyZjIFIX395v/pNjaZQvJD7VF69rfi+DMC+qJPc8nu83IwM403Ygaom6+TnZ9ZrxT0ghKgOuGeGPLu+4UbN2Vj8JdK+fV231oNuMKYzmuaQVf9Zypj211iCz2PsOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F1VVFp5hwBQEzCUCIcjlLUjl8cuJJLszulRFLRwflLU=;
 b=PMh2uAsePNyhvBC+k2huOGmtnD1UMb3wYwPaqifuYkV9nY76gTWs99W3JqAuB+ZSJWBRTEbE8rKYZzkEhT/kfzbGshn53fpHw9S8r5iD7syikK++L3BlpZo8sCXrAq+e2XUU/SrKvFHJQwE60WASJVyIG/h9hvBPY3xtAhwauVdKmT8QfjGuf9xQsUQlNruB99QsqC49xl9whhn26xN1HmpOrq48PYhIreEm0DNJlWy6wXjcRbMqrd5wqIL7AAPL4H46IH+/siAevgNTDab+Ggemy59MeYfTxxcGslsT57LDoe0jDAUOR/G6XjyOQcDjOpq+FJ8M4dC/oyzGvHtksQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH8PR11MB6904.namprd11.prod.outlook.com (2603:10b6:510:227::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Wed, 28 Jan
 2026 15:56:51 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::efd5:501b:c890:26b0]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::efd5:501b:c890:26b0%5]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 15:56:51 +0000
Date: Wed, 28 Jan 2026 16:56:47 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 4/5] drm/xe/pf: Define admin_only as real flag
Message-ID: <20260128155647.ausmrdrtkfys75u2@intel.com>
References: <20260121214218.2817-5-michal.wajdeczko@intel.com>
 <20260127210501.794-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260127210501.794-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: VIYP296CA0010.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:29d::14) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH8PR11MB6904:EE_
X-MS-Office365-Filtering-Correlation-Id: 414aae9d-4e20-4ffc-7fcf-08de5e85d997
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZVlSVHZLUFYwS3hMS0s3T2MrTEZtcHVzRzNMWkYwd29tanhNekVmMmFDQ3RK?=
 =?utf-8?B?WjZyc09NUi8raVFBalZCVnd2TjM3T01oL2NLZXlmelMwb2pVM1RIUGRFSFUw?=
 =?utf-8?B?OUlnblhtRnVMclNiRVkvMmFCbmpnMjNjR1JQSTE0ZWdpcU5iQXJ2QjhLejRz?=
 =?utf-8?B?VnhBWFFucm55cE9uNmJYUTgvV0pMN3BKRzNkaGEwTU1KYVB0bm5wWER1aTdZ?=
 =?utf-8?B?WVoxaU42MWM5NUp3WFNOVlJrRmdLRU1iekZKTCtNRnRZaFlCRk9wUExEbUVG?=
 =?utf-8?B?Tm5wTFJZVVdLTTRqeVVubGNUYzJadmdyRytUckZydFdBRVVIZmFBYWtuVVV4?=
 =?utf-8?B?b1I4b2VNTHR3OTZzUG45ZUcyaisrNTJweW9qR21LUm5UQjNkLzZBdTdHdlNu?=
 =?utf-8?B?UVBVYXRZU0t2dFhYZmo3Q1Y4bWJOQmdqK3c5c1lVRXRLNnZOWEx4TTR1QlY0?=
 =?utf-8?B?cHVJSXhmdVJwSmVCelZIYTlmQVBoTG5rUDVLbzZleFF4aXhHWnZKaXEzMzUy?=
 =?utf-8?B?eWJ3OHZ6QkEwdUUyRjdiWGxBaUtXaEM2RFozV3hidHRISGh2NitEdVZBdGZh?=
 =?utf-8?B?Q0swTjBGbWk0cFVhbFlBN1RhelZTU2NDTTBSQVNZTTJzSFlGOXFnR1IyVWMr?=
 =?utf-8?B?MkZVc1lneVpaY3dyWEdCK2ZqR0x0cWU5VkFuMlZjTVNzSThvR1FaQWNld2xo?=
 =?utf-8?B?K0l2VVB4YjNVUFhGRW9KWHNhRHlSVW5nbnFNc0c0eUpDQWVSMmVWaTNlRU56?=
 =?utf-8?B?bzFES1BYekdUcUx1aGpOQ3NGQ1NmeGJqbEs0ZGdSMVNLeVlyazhYemllQ0hV?=
 =?utf-8?B?MnZjZDFRaEFyckdsd3c3TjJXV3dvMlk5MWhYYVhlL3loU3F1elhPOGtFRVZV?=
 =?utf-8?B?bEZnMFR1bjk2YnU0N1dGZmJmWTUwVGNiNU00Y2M5ZUtDU1NUcGE2bG5sMXpu?=
 =?utf-8?B?dCtwWjF6Y3MrZlJtOE03RkJsY2puRzVXQzYyc2dKU081ZXhVaW1ZQm15VFFo?=
 =?utf-8?B?U3AwaGhseUlpMVlMUXZhNDB4QlJOaUYvSmh1NWJPNmdaRFJlN2NFWlBxSzJX?=
 =?utf-8?B?OW5mNTA1bThBckdUL2VJQnBtR1JpODNTUC9YL1Y2Zkp0QnNPNkd6eVNieGwy?=
 =?utf-8?B?VEUzamE0eDh6cTl4djVWKzVCdEdYOHcyUkVnOE43OXVGYmZVQTJCS1hFeTR4?=
 =?utf-8?B?WTdFVUx1UXgzdm9JUHRqTGFRaVZIOHVpSXN3N2lydlFEc0lSdjNjTGpZdVdR?=
 =?utf-8?B?NVQweWF6QytVbjVPYzlLYThZV2YvbWxUWFpoQ3A4WWhUQ2lrRDZHeWtkbUd4?=
 =?utf-8?B?eHYwWHJnYjZoV0VMQ1pXd3VKNWRFRnh1YUpyVHgyQXN0MjJ6STBFL042ZHhr?=
 =?utf-8?B?dGNQai9qaFZWUVlIVXlsajFzY1ZQNkg0YWVUTUpMelhwZmhSN0lmTkxVNVUw?=
 =?utf-8?B?WWNZbFlEQTVsZDVGK0o3YXFDNm40Q3M2YzRFa2dMV2sxTkdicWZSZGJhOXBY?=
 =?utf-8?B?MkxMMFdEalVBRFplcStNZDlNWXptWWxocTBGZjNoQzVIczJXOWhuZkNOUWpD?=
 =?utf-8?B?RmdvMGo0ZTJtKzh2M2lqZ01NZW01WjhJSFNXMXdHQURaeThncXFoMWd3VHpN?=
 =?utf-8?B?UjNwYTE2RGcxellUbkVwTW0vRmtQWVZGbDkrZlVtb0JPOWJoT3ZQWEVJbm9s?=
 =?utf-8?B?NlZLL2F3U2wzcW14QndodFpxM3dDdFQyTko3Rytkck5PeEFCZ2JPZnhGVmEr?=
 =?utf-8?B?WlZLWVVreFJ2a1Q3QmJ6WWhCREJtZlVvQmV4ZnErclN5c0s4ekRxUkx6MVVM?=
 =?utf-8?B?dE9rOGFMb1ZweFh0aGdVUHhVcmNsSHFmenVwZ3FJMWZnbkIzeTBWcmxWdCsw?=
 =?utf-8?B?UllKc2thcVM4cTR2K2x2bXRGQVJSSk96R1grSEN6elY3TmcxcnBOT05LTGhw?=
 =?utf-8?B?V1NyNUF1UThnZllQU0FscU5uQkhQWmozYXhhWG5tSG02SWxqN1lwZzk1SEdS?=
 =?utf-8?B?U0RXUXRBVGhQaDQ1c0NwQUh3TFNYRnhXd3BHWGhJVml0MldyRWltTVJuOWF4?=
 =?utf-8?B?Z0VYNWhNZVpaeVlZOEhVSWN6LzlIUDk1MjRyeVlhdHphQ2RpNUc5OHNydUpM?=
 =?utf-8?Q?T7Js=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFN4R09kdDFGaitIMytmYnlrV0NwYzM2a05RR2YvWEJmNWFxcGp4L2hHOXBz?=
 =?utf-8?B?bllqdG9qaHVTa1RCZkUweWZxUDVpQ2lsL3ZqeWc1VzNDcURoWXY0dEVIZklO?=
 =?utf-8?B?QTZreXRoSEZIbW5zY1d0TlJZOGV0NGpNcXVEc2dOUDQwZEQ1cU54NjR0RFUy?=
 =?utf-8?B?WVBLZTRuRytNTWgzVzNQL1NwRldpaTh3RjhoNmZJaVJHMGxSd1FpUjhodnha?=
 =?utf-8?B?NnJnN1Bvb1I1dFZ4OEZqc1JwMmtRdlI5MXJmZXNTNS80QXFqZFJCRmVlNzgy?=
 =?utf-8?B?bEM2VWlaMElFUW5mZE12dFpMZ21kMHYxeCtrbnBYU2xCanNXOUxhZS81dHNK?=
 =?utf-8?B?b1RpZ1lXV1pSb1ludm1CWWY4eXBLbUNRUzRraFhlT2ZHVWdsKzVrMGdFZzdZ?=
 =?utf-8?B?WEs0S3czaE9jYWFkWWJkeUw2UnpDWmFUeW1RNW1vVThFQnA1bGtEa3ErakFX?=
 =?utf-8?B?STRyaFAvckwzU3UraG1qeU5XTGRQOS9keVl5SXdKcjduNmVuN0d5VVJueXk3?=
 =?utf-8?B?RE5QK3N5OGszZ3BMTVZwQTBpMlRjOHY4bjVwWWFtaytjN0thelQ5THByQW1k?=
 =?utf-8?B?dzRkMlI2bzFDM24rZW1RdzZWY1NXcWxiNlpxb1U3cngxUU1zN3RuUW5ZMXVR?=
 =?utf-8?B?VWx2RC9oNmFnWXZYNFhpY2k0dytOeDVROXFnbEdNTkEvMlRFS0VRNFUwd3Fp?=
 =?utf-8?B?bmpQSlY4eU9DMXJsWGNmZkdzaHlMZk11VmtxTTMxOENnUEIyNGkxckdOT3RL?=
 =?utf-8?B?MVNpdEwzcWliMlpsZTR4MFFOaGtSeHErdEdPZEZrYVJLVFNJRER2Z012dUdt?=
 =?utf-8?B?TDdManAvaUlNUEo3VlV3NHNIOGVnN09QVmxrRFNRSUEyZldVa1lpLythVEta?=
 =?utf-8?B?UFZzVERpZU9PMHYvaGhLU2VxaEorNFJWQjJGdklKbGdJakQzMXNGS3FvQUl1?=
 =?utf-8?B?TFY1Z0xNK0tWWjl1YXhyZWcxc3V6bmtzdTUvUEZmL0hyT3BSVDZSOThEWnBC?=
 =?utf-8?B?cmJ1QXNiNlh1VUVJNTNwQndmUFR1Tk5pTkg3c1B1cUFaNmF4MnZ2VmVLTGNE?=
 =?utf-8?B?UjRtbmpmdnMwTXBGNnYwRmM4Tm16MDNXd1VOWEVpY0FNMUtCZ3craE53bU4y?=
 =?utf-8?B?YzlGaE5nVXBIa2FhNmRDQlpGODhLSkZyYjVUTXFYd0lsc2sxZ1Y2STdnL2VY?=
 =?utf-8?B?NlZ0UytDWU5sL2NWVUMwempzWkNFS1FQTFJBMS8vTEtMT0pkMiswV0hZM0pU?=
 =?utf-8?B?SHJLVGYzT2FXSmFZUlZrTWRPcHFBaDlXTno5T1lpcTNwV1Z2N1daTlh5bVo0?=
 =?utf-8?B?bFZ0YnE4bWJ4Zzd0TUw4bUcwdXFlVzlvZFpJNVZxVmQ0cDg3OVd4VE95SldY?=
 =?utf-8?B?ME9wbjFWYS9KdHhOWDAxZVNJempmejNsYlJJTDZJMmJSaUovT21meFpVMVM4?=
 =?utf-8?B?Y2ttVmkvL0wva1pKaVdoSitVUGdQRjJlcTNjOFowUEVkQ3hFcWtLc3pJQlRZ?=
 =?utf-8?B?VWtEa2hweG81Q0dvZGt0eU9FRWdmdkNaNDFlY2gvTUZxMWIvMXhKeVIyaC9H?=
 =?utf-8?B?Rml3NE1nS2NVYXkwVlp1a2VveFJkQXh6NWpGTXg1MklnWUx5NzZvYW92WlI4?=
 =?utf-8?B?Q081YURoajgvZHZzUk1OMWdLM2hvMGhwWXI1OWRCWDk4MUc1ZXQxVHBpKzBJ?=
 =?utf-8?B?S0huWDYzbVhpdjkybEcxSExhOXlranZDVmM0STRuTERaN0NuVnMxbFZNbHhC?=
 =?utf-8?B?MVdyZHFoWWFOL2cweTBBT3VEdnV0ZENxNWtQMTZ4eFA3RjJsMEpBbDVOODF2?=
 =?utf-8?B?V3hLeDZLSmkyQVBsS2E5V3YvMklLK1ZHYm8wUm0xVkZmSU82ZUR1SHAxWUlV?=
 =?utf-8?B?VXJhWWxKYVRnTWF3Y2hJWnJ2VkNlcXZUUThCais1OU5BRDlVUVNxVE9NdEln?=
 =?utf-8?B?eDR1SVR0ZzB5Q1J4MmVNL1lBUU5tUXozRW02QWU4SGJQa2o4RTVyN0U2S01i?=
 =?utf-8?B?S2JlOFFQeHI1Qk01SnFEMlZpemVrdDR1RUpxMXl0VmcyUnZnaS9oeEhqM3ht?=
 =?utf-8?B?b1E4eU9SQjRtNTdrQ3QrUnFkWDJuV254akRDQUNwdkwrUEE0Y0xxcnZCblNH?=
 =?utf-8?B?R2FzVUtJRVEvb0lkbzRzZ05BVnNPK3VaKytLaEs4VUZGT1FWSU95UHBaaXhH?=
 =?utf-8?B?aFI4NWk0YmM5Z05QVi8rRStQb3V2WDY1REdnK0ZrbFhoczMyekpSdmhOMWMy?=
 =?utf-8?B?K3QvU2V5aWpZMlpNd3M3aTR5QVhDdU1mUUhOeGpncnAyeWlRbnAwTFNDbTQw?=
 =?utf-8?B?Z252eUhwd003WUpOL3VVZzVNOTNNMzZkRjBwSytqTkZJVGM4alRaVVlpTUZD?=
 =?utf-8?Q?LxmLBzFFFQpQq7CU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 414aae9d-4e20-4ffc-7fcf-08de5e85d997
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 15:56:50.9687 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZX2YzZD14TF/UV8EewoNxTmy0w1qmf70P1jmMmHXVpZpazKJpdqwXdNPZ26K8vSAC+oz/3m5swRn5G0pLnDq19MyFtA4fumJepXEQpSoIc0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6904
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on wto [2026-sty-27 22:05:01 +0100]:
> Instead of doing guesses each time during the runtime, set flag
> admin_only once during PF's initialization.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
> v2: update flag in kunit test (CI)
> ---
>  drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c | 2 +-
>  drivers/gpu/drm/xe/xe_sriov_pf.c                       | 6 ++++++
>  drivers/gpu/drm/xe/xe_sriov_pf_helpers.h               | 3 ++-
>  drivers/gpu/drm/xe/xe_sriov_pf_types.h                 | 3 +++
>  4 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
> index 42bfc4bcfbcf..3889dc3e49ca 100644
> --- a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
> +++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
> @@ -15,7 +15,7 @@
>  static void pf_set_admin_mode(struct xe_device *xe, bool enable)
>  {
>  	/* should match logic of xe_sriov_pf_admin_only() */
> -	xe->info.probe_display = !enable;
> +	xe->sriov.pf.admin_only = enable;
>  	KUNIT_EXPECT_EQ(kunit_get_current_test(), enable, xe_sriov_pf_admin_only(xe));
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
> index 33bd754d138f..919f176a19eb 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
> @@ -20,6 +20,11 @@
>  #include "xe_sriov_pf_sysfs.h"
>  #include "xe_sriov_printk.h"
>  
> +static bool wanted_admin_only(struct xe_device *xe)
> +{
> +	return !xe->info.probe_display;
> +}
> +
>  static unsigned int wanted_max_vfs(struct xe_device *xe)
>  {
>  	return xe_configfs_get_max_vfs(to_pci_dev(xe->drm.dev));
> @@ -74,6 +79,7 @@ bool xe_sriov_pf_readiness(struct xe_device *xe)
>  
>  	pf_reduce_totalvfs(xe, newlimit);
>  
> +	xe->sriov.pf.admin_only = wanted_admin_only(xe);
>  	xe->sriov.pf.device_total_vfs = totalvfs;
>  	xe->sriov.pf.driver_max_vfs = newlimit;
>  
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h b/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
> index 9054fdc34597..0fcc6cec4afc 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
> @@ -56,7 +56,8 @@ static inline unsigned int xe_sriov_pf_num_vfs(const struct xe_device *xe)
>   */
>  static inline bool xe_sriov_pf_admin_only(const struct xe_device *xe)
>  {
> -	return !xe->info.probe_display;
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +	return xe->sriov.pf.admin_only;
>  }
>  
>  static inline struct mutex *xe_sriov_pf_master_mutex(struct xe_device *xe)
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> index b0253e1ae5da..080cf10512f4 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> @@ -36,6 +36,9 @@ struct xe_sriov_metadata {
>   * @XE_SRIOV_MODE_PF mode.
>   */
>  struct xe_device_pf {
> +	/** @admin_only: PF functionality focused on VFs management only. */
> +	bool admin_only;
> +
>  	/** @device_total_vfs: Maximum number of VFs supported by the device. */
>  	u16 device_total_vfs;


LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
>  
> -- 
> 2.47.1
> 

-- 

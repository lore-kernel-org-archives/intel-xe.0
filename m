Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F81D116F1
	for <intel-xe@archiver.kernel.org>; Mon,  1 Dec 2025 09:26:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3480F10E346;
	Mon,  1 Dec 2025 09:26:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E5BlE8hv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62DBC10E119
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Dec 2025 09:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764581197; x=1796117197;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=DDFMNlmdm6Dj0Q+Dkp335LODfJzAz7HcXHUEUit1BfM=;
 b=E5BlE8hvR6K1E8lU6vvO2mYfqvI7V6D8olKSxATnnAXruG+qeI3mB+6D
 2k0rrQztrG8GPwqexqjLEdeiOfzJmQc11VzZfAEviTN27HhTbYRDDYCNL
 p1z6WQrc1fJ+Idpshw5XJSw+4/axcz9F2CxwAS7+icRtMSQSvawW5SOXV
 e6PMS9QwOo9XgAHbV2xwB3rOdCD8SnkVE8yWTSjmUctHnQ/VN7kOQX5fv
 COlVbtc+6gjAyz53xeEvV9n4Klc0cY4eqf8igKaA/DnzTgQaAoWUDep3q
 7PFsUISuLmllOb+lRinYG8koaMvS1TSKAG5/MKBHh6RIeF0Wgz/REN5mM Q==;
X-CSE-ConnectionGUID: x0uhvXJ4SF6h+Vg6PHIObQ==
X-CSE-MsgGUID: xfseLew5Qii3Y2RrYJn1Nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="66585648"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208,217";a="66585648"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 01:26:37 -0800
X-CSE-ConnectionGUID: XWIYdPk+Riyykj3zN83yWg==
X-CSE-MsgGUID: Q8ff0XESTJqL3PcnMd/Ijw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
 d="scan'208,217";a="193840126"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 01:26:39 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 01:26:38 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 01:26:38 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.6) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 01:26:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TKws0Ps6lbph179jgrMyV0DEhzDIiQh1szhFbyJhe3u/G++j/OJVR2LwcMTNKwXgbBsVn9U80qOR8b1SJj1DK9fux7ufW0j8PQreEec6MFg0gSnsYjeNISuVIIWJWS9UcDW/PBvohs9aK1i9c9WA84IDw1FRj5drC56eA8vsQanoSOHKOzgOg/eTGi+eJ8Ou6D+XtlMT3vIvTWTCNnasa8Q9e9qNY25N7r+kaUwAKsE4y+ebL5A/Hv/LIuREgNEVqIJ5LKlbBs9x/yDCzaGVgmFoqDj+sy7p9cxC1CfpgyiJwaUF6BapefdRfTBkV+2zHdozNKT214tlAK/VCx5TSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JRmtiDecUka8pqJjfzL2na6xs/BeO8jBN9BkCdaegm0=;
 b=p7Sd2bbKaGa2pu+bsvtv0kR6oewbZ+KdotGXHSh4cDWSUX3PhBUNuRvCmXmNL3Uo/XJo++djdBA3NfC1ErLG42877YWcn92NPyTuEPI80TURP9IiSOXnxm2gwVXYACAj5kc4uc/HwBQPKj74D0emv+hd9OFKIpy6Gbq2SZrqbItzW2+q4E9rqSuPTMVDoI+Vf/OdHtqDPG62bnldZfnUziPZQQIOi1ZKcLVjM7AmOB0P9fHD6AgM8coTxu5yFdmNsCAm+YQuA9I6rouhYBGZhifNRlvy7vAJ8aVEZr1zy1O6vfVAR2/guOy0EBckos6XfF5jOoAEEbRjibLSVmq40Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by PH3PPF248AC5624.namprd11.prod.outlook.com (2603:10b6:518:1::d0f)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 09:26:30 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%2]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 09:26:30 +0000
Content-Type: multipart/alternative;
 boundary="------------1kRDC3EBaNu2FkMAZN0Bt6sO"
Message-ID: <d2b1d486-0c1a-411d-b2a3-e3d11f35a716@intel.com>
Date: Mon, 1 Dec 2025 14:56:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/4] drm/xe/vf: Introduce RESFIX start marker support
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
References: <20251128133052.17120-6-satyanarayana.k.v.p@intel.com>
 <20251128133052.17120-8-satyanarayana.k.v.p@intel.com>
 <c0c71748-8dbc-4fdf-be83-176e5213bb17@intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <c0c71748-8dbc-4fdf-be83-176e5213bb17@intel.com>
X-ClientProxiedBy: MA5PR01CA0213.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b0::13) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|PH3PPF248AC5624:EE_
X-MS-Office365-Filtering-Correlation-Id: 62e0c5e6-fb16-4b8f-1ce7-08de30bbb5d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cmNNL2xvUXlQekhkU2JwYnlObXRXWDI4ODNidnphOUZvRU8wd0FLMVlpcWht?=
 =?utf-8?B?Y2tNVUZHRnpaY29GRnhxakNXTEJ3cTBuYnBNOXRUTW9zNkxMclJsL0htS3I5?=
 =?utf-8?B?RHNOdWgzMDhEMkR6Ym9CR2JPZGNjRDJFdUhWWUhROTNuNTZ4MFNkOFo5NEg2?=
 =?utf-8?B?SXVDQXBRMmtjbDBMWVRibHhGV09vRkdwZXovZjJrcFBWREI2UzRZY3lCU01m?=
 =?utf-8?B?NHdrL0xGckh4TXdIcDBHam95c01iL2VLQ0plTkxaeGpaSlQweHE0TktpVmQz?=
 =?utf-8?B?MXRlY2M4OW80cnZrNStKV3RjMmgrRWtZdHppT0FCODhTMitLUEVOanFRSDF4?=
 =?utf-8?B?WHNZelhEZmN0aE1JUHl5eGtXVVErL25oc1Rjd1g4Y09PTjNjR29HWGtYSGUy?=
 =?utf-8?B?aG1NNjk0Z2dMREg4VFNENDh5VkJGbk1tT0xmRC9CeEhRYjh5MWI4NkdIS1BR?=
 =?utf-8?B?QjhqZ1RIbjNMY2NNWjk4OXdDMFJmQnBONHNBQnJmQVlaOExoL2U3V0QwV1d0?=
 =?utf-8?B?ZWZNd0hrNHdkODBjTkpJdjQ2NzNma01NR1JCSmZQZ0U1M05oRDlDbTErTC9Q?=
 =?utf-8?B?bkdtT2hoelN4OW52bnRRMkJadG5hWEVoUDZUQXRyVldRUDAybWpxa3cvY0xQ?=
 =?utf-8?B?RVRMdy80Rmk1SEEyc2tGSERQMk1kcjE1b053SFJQVUI4NFdHMHg4WWxIbDhE?=
 =?utf-8?B?Vmc3MTNlRjFUUlBMZy9XTkJPZXZyV1hTcW1pM2VCN3JKY203c1BaOWtuZkxJ?=
 =?utf-8?B?NmJIMW91ak16N0twV3c5UjByc3QzZk9wVWNxZnlXOU1meXNkSjI4WTFwWnAw?=
 =?utf-8?B?emJGK2dYcTVadDFtZHRIOEVPT3BmaXcyRGUrVzhQcnNDcUo0dThvbjNoUG5B?=
 =?utf-8?B?ZVJwRGFWQVh1dCtXbnVRN3dYOEtsaHBrSVJWam5UbXdOVHVpcU5BbXZZaE1E?=
 =?utf-8?B?OTlGU0dsdDNjZ21BOCtQelBtQWNiUVg2dzJMd0x3cnpMdDByVTRFbEQ3OElh?=
 =?utf-8?B?em1rS0hFWC9HQnhuelNrRkRZYjZBK1E0NmEwdHRtM2ZOWURKNnlabWJ4UHhV?=
 =?utf-8?B?QkxPWVkreU5mY08vYlBFdlQ0ZTdqMi95Nlp2QjJvc3JmdU1MSWRjb0dTR3Vw?=
 =?utf-8?B?cithRHJrREttSmU0WGh6SGFrQVNKV3J1dFlqcmc1U1VPY1hFeGxVa29SaVp4?=
 =?utf-8?B?WC9LWUQ0ZmlEVG9aTHNranZGYXE1RmJWNWxlRWdRYVZ2UWYvRElRSHdGZkhF?=
 =?utf-8?B?MEVMSElKcklMZUxQdkFJYW5wdnhDZkVyTlRTd0NCblE1eEpzdWJzeHgyYzhv?=
 =?utf-8?B?Q2JzeXJEREwyeWlqcHNoVkdBcnVaMWFtbjV6Nlp5ZHVOQ1lNUEkreDNmeVhQ?=
 =?utf-8?B?c2QvZHVkZUw4aG1CWUxqQmdIY0t1a2dtaGNRNmc1bjVCZUdEaDVHMlcvY0g5?=
 =?utf-8?B?cG50K1hQNFhWdDhSckczMytpZ28wWTFhKy9TM0VCQko1OWdLRXJZVU0rTUFM?=
 =?utf-8?B?YzBOeGJkTlhPMlBITktMR0k4TktDcVQ5cm81TGt1czZvTmRFR3k4dmFrUEx3?=
 =?utf-8?B?YjZNQjJoY0tFUVRFamsvWFFyaUxEcnV5Qlc3ZWJKb2tWVldGZks0SFdJSXBZ?=
 =?utf-8?B?M0ZGZG1kZkdYclpPRndEclFxWkhzU3ZlZ0oyT0JUTElRUFM2SUk0d2xiQ3Zz?=
 =?utf-8?B?a2Z3encrN0kzallpMzdnci9UbmZLQmtjQVFrR1lkRUNTR2w5K0hmTkhLTCtn?=
 =?utf-8?B?L2hXY1hFMXlQL1U4YTM5aHo3aVcrSjhkZTk5MVUzYlB0Y0VmdXdKeTlaWFR3?=
 =?utf-8?B?blBJbW9GNzhnR3EvZVZ5cTJjVERaR3lBVVlNZittRDNlWThDZkJUQ1dnZllZ?=
 =?utf-8?B?OUpkdittQnZlVUJ1UjFXeGt3V25aYXlXd0hBQXJRQ2NZNEJzMHJIV3BGZEp1?=
 =?utf-8?Q?9g2srLS/DioOLHUEoojvGh01qxe2nl+C?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2hGQ1EraWxZZmpYSnVZWXdXTE50ckNLbkFveHhtZEdqQy92b211YlFWZkVm?=
 =?utf-8?B?RFFZell4NWdwL2NkdmxtakhJTHZYbTQ5dnRCdysrZHIzb1ZiL0gyRVo2TnNv?=
 =?utf-8?B?Um9iSmF3S2U1emtsbENnWkxyY0o3T3pzVDZxTEluSXhxTGQ3UzM3SC9ablFI?=
 =?utf-8?B?RlJhYzRtbTdSUzlKWnE0K2hJMTFDWG1iTytBcC92KzgxRnBMOC9hUU96TGpG?=
 =?utf-8?B?VVMxN3JBc1ZrY1FTT2M1bjJHTWtsV2xyaUNkeFQvYXgzaXJ3SkEydks2WURt?=
 =?utf-8?B?cmgrSDFlTjdvK2gzWGNLcnAvRW5pZGZFd1p6YkF6RzdyUnliYnpCVkhmRWhE?=
 =?utf-8?B?TkRtU1J0UkQ5ejJMKzlreVJpN1RxMmdIMGI4Z04ySUUvbjRMVkE3RDV6ck8r?=
 =?utf-8?B?Syt6bktDR1NWZVQ5WXU4R21PTU51Y3NITzJtL0Z3OGlKS25sczAwQkpqRmdH?=
 =?utf-8?B?Q29QcGpaR2lwYS83STV2QzNTd1VLQVIybWdUR09SV0tWVE1Ja3BvSjVlZWxE?=
 =?utf-8?B?Rk1xdW9XQWxNeGxyOW95WkNMRmVldWlIUmNtU1Nab0N5YUVJRkZ3VHUwVlln?=
 =?utf-8?B?cUkyZnpMQ2xBUFJZTndEd2xBcE43TDg3OUxLR1grdnZlR2hlZzFITDRBbjlS?=
 =?utf-8?B?S3hDL3N2TEt3WmQyMVdLUGE5Z0QrK1hqVW9CYzI5K1JON2tuVG5XZkhaMDVr?=
 =?utf-8?B?WGRJNXlndUlUUEtVUi9qTUFtbkN3MWpZeGRBajNsN0VwSWxrbVVZRTE5MVAv?=
 =?utf-8?B?N2ZWSjUza3I4cDhwQnEyZE9xSE5PSGZFUkRvRDQyaHNNTmV1ZzhIeHJ1bjhR?=
 =?utf-8?B?djNMMFZLN1hKUmJpeHNYbG1vVHo1bGNuR3FLTzJ6dTN0NG8zNlNPNkJFZlBO?=
 =?utf-8?B?MlBYYzB6ZmJoTFBWOE43a25XOUwyWTdpSnVDL1BrV2Q0RnZUWEZ4ZjNhNXl0?=
 =?utf-8?B?eVZlbXBFNHpmallySk9vSTJIbTQ1TSswMXFGaWhiSnN0Tmh3YVhaU210MnVh?=
 =?utf-8?B?cUkwR21KV1Q3MndUNExhVktJMmdKR1NBNmM2YVRMVklvQmpGK1c4TmcrdVFI?=
 =?utf-8?B?RVplMllmNENkU1BVZ0Z5MUVUQnJHNVJKSzRORzQwM3hYQkZjN1JkdVNXTGNL?=
 =?utf-8?B?Tk50VWhuYklpRXZXbEkyTVF4YUtYbkc4dlpLU0FIcGw3dDQ5MHB2VzVoWEhU?=
 =?utf-8?B?eDlxMHpmVzg2eEhBVVN2eW45cDhhekI0bWRnYjN3bkVSOExqemRCVEN3a3oy?=
 =?utf-8?B?dnJYTW1KbG9oNlVpTjF6bi94ZVQxbE1lYlR1bWlJTlRBR1Z6OENWazZQV2h2?=
 =?utf-8?B?N1dwUmR1RmNlWGY5YXR0dS9XR1N0UUJVSWFZYTVSd0NvK1BRRWljR292bVNp?=
 =?utf-8?B?blJ5cWFobkgzdlJRZWVnMm9CT1I2LzVZQTg5aFFhNHBhcWJNRzdTRmhuSGl0?=
 =?utf-8?B?RWNZYnMzNWFqYWtPZWhqUFhLOTRSck1mcjNpT0k5SG5jcDRwV3BwMi94TFp0?=
 =?utf-8?B?ZUQvdURQbkdXbG84ZHRobzZ6ME52UHVWU3FIN2Vpa1h3TDh6cVVVNjgxRGhR?=
 =?utf-8?B?TlltWkg3Y0dTdzl6WkE5czErMnR6N3RLNDBZQ0JBZlI0d0VENEt0WGNYbUIz?=
 =?utf-8?B?N0lGZHI4T0lwZWxrb014cldTMUlSSkdSTGVIcjdBeVBkQTRmWlJaRk85cGMw?=
 =?utf-8?B?SVgwQnJobUtIbGtCSVBaOHMwTkNJMzhubTNscW1zVVRTUVZheFhUM29BaFpr?=
 =?utf-8?B?UW9hY2dMWEdad0J4czNxRkEzVUNUUnVMSUZyTUZaV1k2eStMdFlLc09zU3lF?=
 =?utf-8?B?VmRVRTNaQTdjRnM1Y09RS1kvc3VsV2RIUHM2a0lKb0tneUxab1YydXFrQ1F4?=
 =?utf-8?B?WTBzZHlQbWhmNmNWVUEza2JYYk40VVpyNDFSQWoxUlM0NlVBK1NZenNGbkR6?=
 =?utf-8?B?RnUwRzlXU0FtNXVGT1dQMWxDbTNCTk45ZFl0M0FyZFkvYmxZMys4VGlxSVhl?=
 =?utf-8?B?bC9oN0x0RndsSzB2MkYxU1prUnBkQnZpWmJ6bGIxbHdrSTdYYmkxL3ZZNnph?=
 =?utf-8?B?M1pIUGZTUk42NFk3WTJWYi9RVlA0TXJjWEJhc2R5Q1UybXZRREFhUXZ1Rito?=
 =?utf-8?B?OE9QOW4yRTNPbkF1MXdtclpRUVF0SU5ZTUxNb2g1UWgyc005MHpvRllJZDV0?=
 =?utf-8?B?TGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 62e0c5e6-fb16-4b8f-1ce7-08de30bbb5d6
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 09:26:30.4825 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x8cQMl8G7S17dhD0l2sDgnai7OvYAYQknCwu17eor/a7GXoX5jNOUWV24AMKuC0BmXPVSA3wM3TumOe+ZdyKNig//wMU8Tn8rkIwrO8dzSo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF248AC5624
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

--------------1kRDC3EBaNu2FkMAZN0Bt6sO
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 30-Nov-25 1:31 AM, Michal Wajdeczko wrote:
>
> On 11/28/2025 2:30 PM, Satyanarayana K V P wrote:
>> In scenarios involving double migration, the VF KMD may encounter
>> situations where it is instructed to re-migrate before having the
>> opportunity to send RESFIX_DONE for the initial migration. This can occur
>> when the fix-up for the prior migration is still underway, but the VF KMD
>> is migrated again.
>>
>> Consequently, this may lead to the possibility of sending two migration
>> notifications (i.e., pending fix-up for the first migration and a second
>> notification for the new migration). Upon receiving the first RES_FIX
>> notification, the GuC will resume VF submission on the GPU, potentially
>> resulting in undefined behavior, such as system hangs or crashes.
>>
>> To avoid this, post migration, a marker is sent to the GUC prior to the
>> start of resource fixups to indicate start of resource fixups. The same
>> marker is sent along with RESFIX_DONE notification so that GUC can avoid
>> submitting jobs to HW in case of double migration.
>>
>> Signed-off-by: Satyanarayana K V P<satyanarayana.k.v.p@intel.com>
>> Cc: Michal Wajdeczko<michal.wajdeczko@intel.com>
>> Cc: Matthew Brost<matthew.brost@intel.com>
>> Cc: Tomasz Lis<tomasz.lis@intel.com>
>>
>> ---
>> V6 -> V7:
>> - Fixed review comments (Michal W).
>> - Made resfix_start marker width to u8.
>> - Removed XE_GUC_RESPONSE_VF_MIGRATED handling in xe_guc_mmio_send_recv()
>> function and moved to seperate patch.
>>
>> V5 -> V6:
>> - Fixed review comments (Michal W).
>> - Updated resfix_done and res_fix_start function names.
>> - Handled XE_GUC_RESPONSE_VF_MIGRATED error case received from GuC.
>> - Remove skip_resfix error when another migration is in queue.
>>
>> V4 -> V5:
>> - Fixed review comments (Michal W).
>> - Fixed minor debug log levels and documentation part.
>> - Moved complete marker logic to vf_post_migration_resfix_start_marker()
>>
>> V3 -> V4:
>> - Updated RESFIX_DONE action name and documenation part. (Michal W)
>> - Enable resfxi_start marked by default as sav/restore is gated on
>> Guc version 70.54.0
>>
>> V2 -> V3:
>> - Fixed review comments (Michal W).
>> - Updated commit message.
>> - Fixed CI.BAT issues.
>> - Added helper function to assert on unsupported GUC versions.
>> - Updated RESFIX_DONE action name and documenation part.
>>
>> V1 -> V2:
>> - Squashed "Enable RESFIX start marker only on supported GUC
>> versions" commit into a single commit. (Matt B)
>> ---
>>   .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    | 67 +++++++++++--
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c           | 94 ++++++++++++-------
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h     |  5 +
>>   drivers/gpu/drm/xe/xe_sriov_vf.c              | 64 ++++++++++++-
>>   4 files changed, 184 insertions(+), 46 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
>> index 0b28659d94e9..d9f21202e1a9 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
>> @@ -502,13 +502,17 @@
>>   #define VF2GUC_VF_RESET_RESPONSE_MSG_0_MBZ		GUC_HXG_RESPONSE_MSG_0_DATA0
>>   
>>   /**
>> - * DOC: VF2GUC_NOTIFY_RESFIX_DONE
>> + * DOC: VF2GUC_RESFIX_DONE
>>    *
>> - * This action is used by VF to notify the GuC that the VF KMD has completed
>> - * post-migration recovery steps.
>> + * This action is used by VF to inform the GuC that the VF KMD has completed
>> + * post-migration recovery steps. From GuC VF compatibility 1.27.0 onwards, it
>> + * shall only be sent after posting RESFIX_START and that both @MARKER fields
>> + * must match.
>>    *
>>    * This message must be sent as `MMIO HXG Message`_.
>>    *
>> + * Updated since GuC VF compatibility 1.27.0.
>> + *
>>    *  +---+-------+--------------------------------------------------------------+
>>    *  |   | Bits  | Description                                                  |
>>    *  +===+=======+==============================================================+
>> @@ -516,9 +520,11 @@
>>    *  |   +-------+--------------------------------------------------------------+
>>    *  |   | 30:28 | TYPE = GUC_HXG_TYPE_REQUEST_                                 |
>>    *  |   +-------+--------------------------------------------------------------+
>> - *  |   | 27:16 | DATA0 = MBZ                                                  |
>> + *  |   | 27:16 | DATA0 = MARKER = MBZ (only prior 1.27.0)                     |
>>    *  |   +-------+--------------------------------------------------------------+
>> - *  |   |  15:0 | ACTION = _`GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE` = 0x5508    |
>> + *  |   | 27:16 | DATA0 = MARKER - can't be zero (1.27.0+)                     |
>> + *  |   +-------+--------------------------------------------------------------+
>> + *  |   |  15:0 | ACTION = _`GUC_ACTION_VF2GUC_RESFIX_DONE` = 0x5508           |
>>    *  +---+-------+--------------------------------------------------------------+
>>    *
>>    *  +---+-------+--------------------------------------------------------------+
>> @@ -531,13 +537,13 @@
>>    *  |   |  27:0 | DATA0 = MBZ                                                  |
>>    *  +---+-------+--------------------------------------------------------------+
>>    */
>> -#define GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE		0x5508u
>> +#define GUC_ACTION_VF2GUC_RESFIX_DONE			0x5508u
>>   
>> -#define VF2GUC_NOTIFY_RESFIX_DONE_REQUEST_MSG_LEN	GUC_HXG_REQUEST_MSG_MIN_LEN
>> -#define VF2GUC_NOTIFY_RESFIX_DONE_REQUEST_MSG_0_MBZ	GUC_HXG_REQUEST_MSG_0_DATA0
>> +#define VF2GUC_RESFIX_DONE_REQUEST_MSG_LEN		GUC_HXG_REQUEST_MSG_MIN_LEN
>> +#define VF2GUC_RESFIX_DONE_REQUEST_MSG_0_MARKER		GUC_HXG_REQUEST_MSG_0_DATA0
>>   
>> -#define VF2GUC_NOTIFY_RESFIX_DONE_RESPONSE_MSG_LEN	GUC_HXG_RESPONSE_MSG_MIN_LEN
>> -#define VF2GUC_NOTIFY_RESFIX_DONE_RESPONSE_MSG_0_MBZ	GUC_HXG_RESPONSE_MSG_0_DATA0
>> +#define VF2GUC_RESFIX_DONE_RESPONSE_MSG_LEN		GUC_HXG_RESPONSE_MSG_MIN_LEN
>> +#define VF2GUC_RESFIX_DONE_RESPONSE_MSG_0_MBZ		GUC_HXG_RESPONSE_MSG_0_DATA0
>>   
>>   /**
>>    * DOC: VF2GUC_QUERY_SINGLE_KLV
>> @@ -656,4 +662,45 @@
>>   #define PF2GUC_SAVE_RESTORE_VF_RESPONSE_MSG_LEN		GUC_HXG_RESPONSE_MSG_MIN_LEN
>>   #define PF2GUC_SAVE_RESTORE_VF_RESPONSE_MSG_0_USED	GUC_HXG_RESPONSE_MSG_0_DATA0
>>   
>> +/**
>> + * DOC: VF2GUC_RESFIX_START
>> + *
>> + * This action is used by VF to inform the GuC that the VF KMD will be starting
>> + * post-migration recovery fixups. The @MARKER sent with this action must match
>> + * with the MARKER posted in the VF2GUC_RESFIX_DONE message.
>> + *
>> + * This message must be sent as `MMIO HXG Message`_.
>> + *
>> + * Available since GuC VF compatibility 1.27.0.
>> + *
>> + *  +---+-------+--------------------------------------------------------------+
>> + *  |   | Bits  | Description                                                  |
>> + *  +===+=======+==============================================================+
>> + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_HOST_                                |
>> + *  |   +-------+--------------------------------------------------------------+
>> + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_REQUEST_                                 |
>> + *  |   +-------+--------------------------------------------------------------+
>> + *  |   | 27:16 | DATA0 = MARKER - can't be zero                               |
>> + *  |   +-------+--------------------------------------------------------------+
>> + *  |   |  15:0 | ACTION = _`GUC_ACTION_VF2GUC_RESFIX_START` = 0x550F          |
>> + *  +---+-------+--------------------------------------------------------------+
>> + *
>> + *  +---+-------+--------------------------------------------------------------+
>> + *  |   | Bits  | Description                                                  |
>> + *  +===+=======+==============================================================+
>> + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_GUC_                                 |
>> + *  |   +-------+--------------------------------------------------------------+
>> + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_RESPONSE_SUCCESS_                        |
>> + *  |   +-------+--------------------------------------------------------------+
>> + *  |   |  27:0 | DATA0 = MBZ                                                  |
>> + *  +---+-------+--------------------------------------------------------------+
>> + */
>> +#define GUC_ACTION_VF2GUC_RESFIX_START			0x550Fu
>> +
>> +#define VF2GUC_RESFIX_START_REQUEST_MSG_LEN		GUC_HXG_REQUEST_MSG_MIN_LEN
>> +#define VF2GUC_RESFIX_START_REQUEST_MSG_0_MARKER	GUC_HXG_REQUEST_MSG_0_DATA0
>> +
>> +#define VF2GUC_RESFIX_START_RESPONSE_MSG_LEN		GUC_HXG_RESPONSE_MSG_MIN_LEN
>> +#define VF2GUC_RESFIX_START_RESPONSE_MSG_0_MBZ		GUC_HXG_RESPONSE_MSG_0_DATA0
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> index 97c29c55f885..fd7dd4a4739d 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> @@ -299,12 +299,13 @@ void xe_gt_sriov_vf_guc_versions(struct xe_gt *gt,
>>   		*found = gt->sriov.vf.guc_version;
>>   }
>>   
>> -static int guc_action_vf_notify_resfix_done(struct xe_guc *guc)
>> +static int guc_action_vf_resfix_start(struct xe_guc *guc, u16 marker)
>>   {
>>   	u32 request[GUC_HXG_REQUEST_MSG_MIN_LEN] = {
>>   		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
>>   		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
>> -		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE),
>> +		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_ACTION_VF2GUC_RESFIX_START) |
>> +		FIELD_PREP(VF2GUC_RESFIX_START_REQUEST_MSG_0_MARKER, marker),
>>   	};
>>   	int ret;
>>   
>> @@ -313,28 +314,41 @@ static int guc_action_vf_notify_resfix_done(struct xe_guc *guc)
>>   	return ret > 0 ? -EPROTO : ret;
>>   }
>>   
>> -/**
>> - * vf_notify_resfix_done - Notify GuC about resource fixups apply completed.
>> - * @gt: the &xe_gt struct instance linked to target GuC
>> - *
>> - * Returns: 0 if the operation completed successfully, or a negative error
>> - * code otherwise.
>> - */
>> -static int vf_notify_resfix_done(struct xe_gt *gt)
>> +static int vf_resfix_start(struct xe_gt *gt, u16 marker)
>>   {
>>   	struct xe_guc *guc = &gt->uc.guc;
>> -	int err;
>>   
>>   	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>   
>> -	err = guc_action_vf_notify_resfix_done(guc);
>> -	if (unlikely(err))
>> -		xe_gt_sriov_err(gt, "Failed to notify GuC about resource fixup done (%pe)\n",
>> -				ERR_PTR(err));
>> -	else
>> -		xe_gt_sriov_dbg_verbose(gt, "sent GuC resource fixup done\n");
>> +	xe_gt_sriov_dbg_verbose(gt, "Sending resfix start marker %u\n", marker);
>>   
>> -	return err;
>> +	return guc_action_vf_resfix_start(guc, marker);
>> +}
>> +
>> +static int guc_action_vf_resfix_done(struct xe_guc *guc, u16 marker)
>> +{
>> +	u32 request[GUC_HXG_REQUEST_MSG_MIN_LEN] = {
>> +		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
>> +		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
>> +		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_ACTION_VF2GUC_RESFIX_DONE) |
>> +		FIELD_PREP(VF2GUC_RESFIX_DONE_REQUEST_MSG_0_MARKER, marker),
>> +	};
>> +	int ret;
>> +
>> +	ret = xe_guc_mmio_send(guc, request, ARRAY_SIZE(request));
>> +
>> +	return ret > 0 ? -EPROTO : ret;
>> +}
>> +
>> +static int vf_resfix_done(struct xe_gt *gt, u16 marker)
>> +{
>> +	struct xe_guc *guc = &gt->uc.guc;
>> +
>> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>> +
>> +	xe_gt_sriov_dbg_verbose(gt, "Sending resfix done marker %u\n", marker);
>> +
>> +	return guc_action_vf_resfix_done(guc, marker);
>>   }
>>   
>>   static int guc_action_query_single_klv(struct xe_guc *guc, u32 key,
>> @@ -1183,22 +1197,15 @@ static void vf_post_migration_abort(struct xe_gt *gt)
>>   	xe_guc_submit_pause_abort(&gt->uc.guc);
>>   }
>>   
>> -static int vf_post_migration_notify_resfix_done(struct xe_gt *gt)
>> +static int vf_post_migration_resfix_done(struct xe_gt *gt, u16 marker)
>>   {
>> -	bool skip_resfix = false;
>> -
>>   	spin_lock_irq(&gt->sriov.vf.migration.lock);
>> -	if (gt->sriov.vf.migration.recovery_queued) {
>> -		skip_resfix = true;
>> -		xe_gt_sriov_dbg(gt, "another recovery imminent, resfix skipped\n");
>> -	} else {
>> +	if (gt->sriov.vf.migration.recovery_queued)
>> +		xe_gt_sriov_dbg(gt, "another recovery imminent\n");
> with this new flow, which includes sending both RESFIX_START/DONE messages,
> do we still need to track 'recovery_queued' flag separately and print info
> about the 'imminent' recovery?

Yes. It is still needed.  GT1 fixups must occur only after GT0 fixups 
are complete. If GT0 is in

|recovery_inprogress|, GT1 fixups are blocked. We use |recovery_queued| 
to check whether any

  additional fixups are still pending for GT0 or not.

>> +	else
>>   		WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, false);
>> -	}
>>   	spin_unlock_irq(&gt->sriov.vf.migration.lock);
>>   
>> -	if (skip_resfix)
>> -		return -EAGAIN;
>> -
>>   	/*
>>   	 * Make sure interrupts on the new HW are properly set. The GuC IRQ
>>   	 * must be working at this point, since the recovery did started,
>> @@ -1206,14 +1213,26 @@ static int vf_post_migration_notify_resfix_done(struct xe_gt *gt)
>>   	 */
>>   	xe_irq_resume(gt_to_xe(gt));
> hmm, shouldn't this IRQ re-enabling be part of the kickstart() step called later?
> then we will keep them off in case of failing at sending RESFIX_DONE
Moved to vf_post_migration_rearm() before we enable restart CTB.
>>   
>> -	return vf_notify_resfix_done(gt);
>> +	return vf_resfix_done(gt, marker);
>> +}
>> +
>> +static u16 vf_post_migration_resfix_start_marker(struct xe_gt *gt)
> nit: this is not just a 'start' marker, nor fixed value, so maybe:
>
> 	vf_post_migration_next_resfix_marker() ?
Fixed in new revision.
>
>> +{
>> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>> +
>> +	BUILD_BUG_ON(1 + ((typeof(gt->sriov.vf.migration.resfix_marker))~0) >
>> +		FIELD_MAX(VF2GUC_RESFIX_START_REQUEST_MSG_0_MARKER));
> is it correctly aligned?
Fixed in revision.
>> +
>> +	/* add 1 to avoid zero-marker */
>> +	return 1 + gt->sriov.vf.migration.resfix_marker++;
>>   }
>>   
>>   static void vf_post_migration_recovery(struct xe_gt *gt)
>>   {
>>   	struct xe_device *xe = gt_to_xe(gt);
>> -	int err;
>> +	u16 marker;
>>   	bool retry;
>> +	int err;
>>   
>>   	xe_gt_sriov_dbg(gt, "migration recovery in progress\n");
>>   
>> @@ -1227,14 +1246,23 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
>>   		goto fail;
>>   	}
>>   
>> +	marker = vf_post_migration_resfix_start_marker(gt);
>> +
>> +	err = vf_resfix_start(gt, marker);
> all private helpers called here have vf_post_migration prefix except this one
>
> so maybe this step should be called vf_post_migration_resfix_start() instead
> where you can call lower level helpers if needed
Fixed in revision.
>
>> +	if (unlikely(err)) {
>> +		xe_gt_sriov_err(gt, "Recovery failed at GuC RESFIX_START step (%pe)\n",
>> +				ERR_PTR(err));
>> +		goto fail;
>> +	}
>> +
>>   	err = vf_post_migration_fixups(gt);
>>   	if (err)
>>   		goto fail;
>>   
>>   	vf_post_migration_rearm(gt);
>>   
>> -	err = vf_post_migration_notify_resfix_done(gt);
>> -	if (err && err != -EAGAIN)
>> +	err = vf_post_migration_resfix_done(gt, marker);
>> +	if (err)
>>   		goto fail;
>>   
>>   	vf_post_migration_kickstart(gt);
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>> index 420b0e6089de..db2f8b3ed3e9 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>> @@ -52,6 +52,11 @@ struct xe_gt_sriov_vf_migration {
>>   	wait_queue_head_t wq;
>>   	/** @scratch: Scratch memory for VF recovery */
>>   	void *scratch;
>> +	/**
>> +	 * @resfix_marker: Marker sent on start and on end of post-migration
>> +	 * steps.
>> +	 */
>> +	u8 resfix_marker;
>>   	/** @recovery_teardown: VF post migration recovery is being torn down */
>>   	bool recovery_teardown;
>>   	/** @recovery_queued: VF post migration recovery in queued */
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> index d56b8cfea50b..1827d77852a4 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> @@ -49,11 +49,13 @@
>>    *
>>    * As soon as Virtual GPU of the VM starts, the VF driver within receives
>>    * the MIGRATED interrupt and schedules post-migration recovery worker.
>> - * That worker queries GuC for new provisioning (using MMIO communication),
>> + * That worker sends `VF2GUC_RESFIX_START` action along with non-zero
>> + * marker, queries GuC for new provisioning (using MMIO communication),
>>    * and applies fixups to any non-virtualized resources used by the VF.
>>    *
>>    * When the VF driver is ready to continue operation on the newly connected
>> - * hardware, it sends `VF2GUC_NOTIFY_RESFIX_DONE` which causes it to
>> + * hardware, it sends `VF2GUC_RESFIX_DONE` action along with the same
>> + * marker which was sent with `VF2GUC_RESFIX_START` which causes it to
>>    * enter the long awaited `VF_RUNNING` state, and therefore start handling
>>    * CTB messages and scheduling workloads from the VF::
>>    *
>> @@ -102,12 +104,17 @@
>>    *      |                              [ ]        new VF provisioning  [ ]
>>    *      |                              [ ]---------------------------> [ ]
>>    *      |                               |                              [ ]
>> + *      |                               |   VF2GUC_RESFIX_START        [ ]
>> + *      |                              [ ] <---------------------------[ ]
>> + *      |                              [ ]                             [ ]
>> + *      |                              [ ]                     success [ ]
>> + *      |                              [ ]---------------------------> [ ]
>>    *      |                               |       VF driver applies post [ ]
>>    *      |                               |      migration fixups -------[ ]
>>    *      |                               |                       |      [ ]
>>    *      |                               |                       -----> [ ]
>>    *      |                               |                              [ ]
>> - *      |                               |    VF2GUC_NOTIFY_RESFIX_DONE [ ]
>> + *      |                               |    VF2GUC_RESFIX_DONE        [ ]
>>    *      |                              [ ] <---------------------------[ ]
>>    *      |                              [ ]                             [ ]
>>    *      |                              [ ]  GuC sets new VF state to   [ ]
>> @@ -118,6 +125,57 @@
>>    *      |                              [ ]---------------------------> [ ]
>>    *      |                               |                               |
>>    *      |                               |                               |
>> + *
>> + * Handling of VF double migration flow is shown below::
>> + *
>> + *     GuC1                                             VF
>> + *      |                                               |
>> + *      |                                              [ ]<--- start fixups
>> + *      |                  VF2GUC_RESFIX_START(marker) [ ]
>> + *     [ ] <-------------------------------------------[ ]
>> + *     [ ]                                             [ ]
>> + *     [ ]---\                                         [ ]
>> + *     [ ]   store marker                              [ ]
>> + *     [ ]<--/                                         [ ]
>> + *     [ ]                                             [ ]
>> + *     [ ] success                                     [ ]
>> + *     [ ] ------------------------------------------> [ ]
>> + *      |                                              [ ]
>> + *      |                                              [ ]---\
>> + *      |                                              [ ]   do fixups
>> + *      |                                              [ ]<--/
>> + *      |                                              [ ]
>> + *      :                                               :
>> + *      -------------- VF paused / saved ----------------
> from here
>
>> + *      |                                               |
> (and lifeline for GuC1 shall end here)
>
>> + *
>> + *     GuC2
>> + *      |
>> + *      :                                               :
>> + *      ----------------- VF restored  ------------------
>> + *      |                                               |
>> + *     [ ]                                              |
>> + *     [ ]---\                                          |
>> + *     [ ]   reset marker                               |
>> + *     [ ]<--/                                          |
>> + *     [ ]                                              |
>> + *      ----------------- VF resumed  ------------------
> up to here, there should be no lifeline for the VF

Fixed in revision.

-Satya.

>
>> + *      |                                              [ ]
>> + *      |                                              [ ]
>> + *      |                   VF2GUC_RESFIX_DONE(marker) [ ]
>> + *     [ ] <-------------------------------------------[ ]
>> + *     [ ]                                             [ ]
>> + *     [ ]---\                                         [ ]
>> + *     [ ]   check marker                              [ ]
>> + *     [ ]   (mismatch)                                [ ]
>> + *     [ ]<--/                                         [ ]
>> + *     [ ]                                             [ ]
>> + *     [ ] RESPONSE_VF_MIGRATED                        [ ]
>> + *     [ ] ------------------------------------------> [ ]
>> + *      |                                              [ ]---\
>> + *      |                                              [ ]  reschedule fixups
>> + *      |                                              [ ]<--/
>> + *      |                                               |
>>    */
>>   
>>   /**
--------------1kRDC3EBaNu2FkMAZN0Bt6sO
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 30-Nov-25 1:31 AM, Michal Wajdeczko
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:c0c71748-8dbc-4fdf-be83-176e5213bb17@intel.com">
      <pre wrap="" class="moz-quote-pre">

On 11/28/2025 2:30 PM, Satyanarayana K V P wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">In scenarios involving double migration, the VF KMD may encounter
situations where it is instructed to re-migrate before having the
opportunity to send RESFIX_DONE for the initial migration. This can occur
when the fix-up for the prior migration is still underway, but the VF KMD
is migrated again.

Consequently, this may lead to the possibility of sending two migration
notifications (i.e., pending fix-up for the first migration and a second
notification for the new migration). Upon receiving the first RES_FIX
notification, the GuC will resume VF submission on the GPU, potentially
resulting in undefined behavior, such as system hangs or crashes.

To avoid this, post migration, a marker is sent to the GUC prior to the
start of resource fixups to indicate start of resource fixups. The same
marker is sent along with RESFIX_DONE notification so that GUC can avoid
submitting jobs to HW in case of double migration.

Signed-off-by: Satyanarayana K V P <a class="moz-txt-link-rfc2396E" href="mailto:satyanarayana.k.v.p@intel.com">&lt;satyanarayana.k.v.p@intel.com&gt;</a>
Cc: Michal Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
Cc: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
Cc: Tomasz Lis <a class="moz-txt-link-rfc2396E" href="mailto:tomasz.lis@intel.com">&lt;tomasz.lis@intel.com&gt;</a>

---
V6 -&gt; V7:
- Fixed review comments (Michal W).
- Made resfix_start marker width to u8.
- Removed XE_GUC_RESPONSE_VF_MIGRATED handling in xe_guc_mmio_send_recv()
function and moved to seperate patch.

V5 -&gt; V6:
- Fixed review comments (Michal W).
- Updated resfix_done and res_fix_start function names.
- Handled XE_GUC_RESPONSE_VF_MIGRATED error case received from GuC.
- Remove skip_resfix error when another migration is in queue.

V4 -&gt; V5:
- Fixed review comments (Michal W).
- Fixed minor debug log levels and documentation part.
- Moved complete marker logic to vf_post_migration_resfix_start_marker()

V3 -&gt; V4:
- Updated RESFIX_DONE action name and documenation part. (Michal W)
- Enable resfxi_start marked by default as sav/restore is gated on
Guc version 70.54.0

V2 -&gt; V3:
- Fixed review comments (Michal W).
- Updated commit message.
- Fixed CI.BAT issues.
- Added helper function to assert on unsupported GUC versions.
- Updated RESFIX_DONE action name and documenation part.

V1 -&gt; V2:
- Squashed &quot;Enable RESFIX start marker only on supported GUC
versions&quot; commit into a single commit. (Matt B)
---
 .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    | 67 +++++++++++--
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c           | 94 ++++++++++++-------
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h     |  5 +
 drivers/gpu/drm/xe/xe_sriov_vf.c              | 64 ++++++++++++-
 4 files changed, 184 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
index 0b28659d94e9..d9f21202e1a9 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
@@ -502,13 +502,17 @@
 #define VF2GUC_VF_RESET_RESPONSE_MSG_0_MBZ		GUC_HXG_RESPONSE_MSG_0_DATA0
 
 /**
- * DOC: VF2GUC_NOTIFY_RESFIX_DONE
+ * DOC: VF2GUC_RESFIX_DONE
  *
- * This action is used by VF to notify the GuC that the VF KMD has completed
- * post-migration recovery steps.
+ * This action is used by VF to inform the GuC that the VF KMD has completed
+ * post-migration recovery steps. From GuC VF compatibility 1.27.0 onwards, it
+ * shall only be sent after posting RESFIX_START and that both @MARKER fields
+ * must match.
  *
  * This message must be sent as `MMIO HXG Message`_.
  *
+ * Updated since GuC VF compatibility 1.27.0.
+ *
  *  +---+-------+--------------------------------------------------------------+
  *  |   | Bits  | Description                                                  |
  *  +===+=======+==============================================================+
@@ -516,9 +520,11 @@
  *  |   +-------+--------------------------------------------------------------+
  *  |   | 30:28 | TYPE = GUC_HXG_TYPE_REQUEST_                                 |
  *  |   +-------+--------------------------------------------------------------+
- *  |   | 27:16 | DATA0 = MBZ                                                  |
+ *  |   | 27:16 | DATA0 = MARKER = MBZ (only prior 1.27.0)                     |
  *  |   +-------+--------------------------------------------------------------+
- *  |   |  15:0 | ACTION = _`GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE` = 0x5508    |
+ *  |   | 27:16 | DATA0 = MARKER - can't be zero (1.27.0+)                     |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   |  15:0 | ACTION = _`GUC_ACTION_VF2GUC_RESFIX_DONE` = 0x5508           |
  *  +---+-------+--------------------------------------------------------------+
  *
  *  +---+-------+--------------------------------------------------------------+
@@ -531,13 +537,13 @@
  *  |   |  27:0 | DATA0 = MBZ                                                  |
  *  +---+-------+--------------------------------------------------------------+
  */
-#define GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE		0x5508u
+#define GUC_ACTION_VF2GUC_RESFIX_DONE			0x5508u
 
-#define VF2GUC_NOTIFY_RESFIX_DONE_REQUEST_MSG_LEN	GUC_HXG_REQUEST_MSG_MIN_LEN
-#define VF2GUC_NOTIFY_RESFIX_DONE_REQUEST_MSG_0_MBZ	GUC_HXG_REQUEST_MSG_0_DATA0
+#define VF2GUC_RESFIX_DONE_REQUEST_MSG_LEN		GUC_HXG_REQUEST_MSG_MIN_LEN
+#define VF2GUC_RESFIX_DONE_REQUEST_MSG_0_MARKER		GUC_HXG_REQUEST_MSG_0_DATA0
 
-#define VF2GUC_NOTIFY_RESFIX_DONE_RESPONSE_MSG_LEN	GUC_HXG_RESPONSE_MSG_MIN_LEN
-#define VF2GUC_NOTIFY_RESFIX_DONE_RESPONSE_MSG_0_MBZ	GUC_HXG_RESPONSE_MSG_0_DATA0
+#define VF2GUC_RESFIX_DONE_RESPONSE_MSG_LEN		GUC_HXG_RESPONSE_MSG_MIN_LEN
+#define VF2GUC_RESFIX_DONE_RESPONSE_MSG_0_MBZ		GUC_HXG_RESPONSE_MSG_0_DATA0
 
 /**
  * DOC: VF2GUC_QUERY_SINGLE_KLV
@@ -656,4 +662,45 @@
 #define PF2GUC_SAVE_RESTORE_VF_RESPONSE_MSG_LEN		GUC_HXG_RESPONSE_MSG_MIN_LEN
 #define PF2GUC_SAVE_RESTORE_VF_RESPONSE_MSG_0_USED	GUC_HXG_RESPONSE_MSG_0_DATA0
 
+/**
+ * DOC: VF2GUC_RESFIX_START
+ *
+ * This action is used by VF to inform the GuC that the VF KMD will be starting
+ * post-migration recovery fixups. The @MARKER sent with this action must match
+ * with the MARKER posted in the VF2GUC_RESFIX_DONE message.
+ *
+ * This message must be sent as `MMIO HXG Message`_.
+ *
+ * Available since GuC VF compatibility 1.27.0.
+ *
+ *  +---+-------+--------------------------------------------------------------+
+ *  |   | Bits  | Description                                                  |
+ *  +===+=======+==============================================================+
+ *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_HOST_                                |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   | 30:28 | TYPE = GUC_HXG_TYPE_REQUEST_                                 |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   | 27:16 | DATA0 = MARKER - can't be zero                               |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   |  15:0 | ACTION = _`GUC_ACTION_VF2GUC_RESFIX_START` = 0x550F          |
+ *  +---+-------+--------------------------------------------------------------+
+ *
+ *  +---+-------+--------------------------------------------------------------+
+ *  |   | Bits  | Description                                                  |
+ *  +===+=======+==============================================================+
+ *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_GUC_                                 |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   | 30:28 | TYPE = GUC_HXG_TYPE_RESPONSE_SUCCESS_                        |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   |  27:0 | DATA0 = MBZ                                                  |
+ *  +---+-------+--------------------------------------------------------------+
+ */
+#define GUC_ACTION_VF2GUC_RESFIX_START			0x550Fu
+
+#define VF2GUC_RESFIX_START_REQUEST_MSG_LEN		GUC_HXG_REQUEST_MSG_MIN_LEN
+#define VF2GUC_RESFIX_START_REQUEST_MSG_0_MARKER	GUC_HXG_REQUEST_MSG_0_DATA0
+
+#define VF2GUC_RESFIX_START_RESPONSE_MSG_LEN		GUC_HXG_RESPONSE_MSG_MIN_LEN
+#define VF2GUC_RESFIX_START_RESPONSE_MSG_0_MBZ		GUC_HXG_RESPONSE_MSG_0_DATA0
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 97c29c55f885..fd7dd4a4739d 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -299,12 +299,13 @@ void xe_gt_sriov_vf_guc_versions(struct xe_gt *gt,
 		*found = gt-&gt;sriov.vf.guc_version;
 }
 
-static int guc_action_vf_notify_resfix_done(struct xe_guc *guc)
+static int guc_action_vf_resfix_start(struct xe_guc *guc, u16 marker)
 {
 	u32 request[GUC_HXG_REQUEST_MSG_MIN_LEN] = {
 		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
 		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
-		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE),
+		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_ACTION_VF2GUC_RESFIX_START) |
+		FIELD_PREP(VF2GUC_RESFIX_START_REQUEST_MSG_0_MARKER, marker),
 	};
 	int ret;
 
@@ -313,28 +314,41 @@ static int guc_action_vf_notify_resfix_done(struct xe_guc *guc)
 	return ret &gt; 0 ? -EPROTO : ret;
 }
 
-/**
- * vf_notify_resfix_done - Notify GuC about resource fixups apply completed.
- * @gt: the &amp;xe_gt struct instance linked to target GuC
- *
- * Returns: 0 if the operation completed successfully, or a negative error
- * code otherwise.
- */
-static int vf_notify_resfix_done(struct xe_gt *gt)
+static int vf_resfix_start(struct xe_gt *gt, u16 marker)
 {
 	struct xe_guc *guc = &amp;gt-&gt;uc.guc;
-	int err;
 
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
 
-	err = guc_action_vf_notify_resfix_done(guc);
-	if (unlikely(err))
-		xe_gt_sriov_err(gt, &quot;Failed to notify GuC about resource fixup done (%pe)\n&quot;,
-				ERR_PTR(err));
-	else
-		xe_gt_sriov_dbg_verbose(gt, &quot;sent GuC resource fixup done\n&quot;);
+	xe_gt_sriov_dbg_verbose(gt, &quot;Sending resfix start marker %u\n&quot;, marker);
 
-	return err;
+	return guc_action_vf_resfix_start(guc, marker);
+}
+
+static int guc_action_vf_resfix_done(struct xe_guc *guc, u16 marker)
+{
+	u32 request[GUC_HXG_REQUEST_MSG_MIN_LEN] = {
+		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
+		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
+		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_ACTION_VF2GUC_RESFIX_DONE) |
+		FIELD_PREP(VF2GUC_RESFIX_DONE_REQUEST_MSG_0_MARKER, marker),
+	};
+	int ret;
+
+	ret = xe_guc_mmio_send(guc, request, ARRAY_SIZE(request));
+
+	return ret &gt; 0 ? -EPROTO : ret;
+}
+
+static int vf_resfix_done(struct xe_gt *gt, u16 marker)
+{
+	struct xe_guc *guc = &amp;gt-&gt;uc.guc;
+
+	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
+
+	xe_gt_sriov_dbg_verbose(gt, &quot;Sending resfix done marker %u\n&quot;, marker);
+
+	return guc_action_vf_resfix_done(guc, marker);
 }
 
 static int guc_action_query_single_klv(struct xe_guc *guc, u32 key,
@@ -1183,22 +1197,15 @@ static void vf_post_migration_abort(struct xe_gt *gt)
 	xe_guc_submit_pause_abort(&amp;gt-&gt;uc.guc);
 }
 
-static int vf_post_migration_notify_resfix_done(struct xe_gt *gt)
+static int vf_post_migration_resfix_done(struct xe_gt *gt, u16 marker)
 {
-	bool skip_resfix = false;
-
 	spin_lock_irq(&amp;gt-&gt;sriov.vf.migration.lock);
-	if (gt-&gt;sriov.vf.migration.recovery_queued) {
-		skip_resfix = true;
-		xe_gt_sriov_dbg(gt, &quot;another recovery imminent, resfix skipped\n&quot;);
-	} else {
+	if (gt-&gt;sriov.vf.migration.recovery_queued)
+		xe_gt_sriov_dbg(gt, &quot;another recovery imminent\n&quot;);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
with this new flow, which includes sending both RESFIX_START/DONE messages,
do we still need to track 'recovery_queued' flag separately and print info
about the 'imminent' recovery?</pre>
    </blockquote>
    <p>Yes. It is still needed.&nbsp;&nbsp;GT1 fixups must occur only after GT0
      fixups are complete. If GT0 is in&nbsp;</p>
    <p><code>recovery_inprogress</code>, GT1 fixups are blocked. We use
      <code>recovery_queued</code> to check whether any</p>
    <p>&nbsp;additional fixups are still pending for GT0 or not.</p>
    <blockquote type="cite" cite="mid:c0c71748-8dbc-4fdf-be83-176e5213bb17@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	else
 		WRITE_ONCE(gt-&gt;sriov.vf.migration.recovery_inprogress, false);
-	}
 	spin_unlock_irq(&amp;gt-&gt;sriov.vf.migration.lock);
 
-	if (skip_resfix)
-		return -EAGAIN;
-
 	/*
 	 * Make sure interrupts on the new HW are properly set. The GuC IRQ
 	 * must be working at this point, since the recovery did started,
@@ -1206,14 +1213,26 @@ static int vf_post_migration_notify_resfix_done(struct xe_gt *gt)
 	 */
 	xe_irq_resume(gt_to_xe(gt));
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
hmm, shouldn't this IRQ re-enabling be part of the kickstart() step called later?
then we will keep them off in case of failing at sending RESFIX_DONE</pre>
    </blockquote>
    Moved to vf_post_migration_rearm() before we enable restart CTB.
    <blockquote type="cite" cite="mid:c0c71748-8dbc-4fdf-be83-176e5213bb17@intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> 
-	return vf_notify_resfix_done(gt);
+	return vf_resfix_done(gt, marker);
+}
+
+static u16 vf_post_migration_resfix_start_marker(struct xe_gt *gt)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
nit: this is not just a 'start' marker, nor fixed value, so maybe:

	vf_post_migration_next_resfix_marker() ?</pre>
    </blockquote>
    Fixed in new revision.
    <blockquote type="cite" cite="mid:c0c71748-8dbc-4fdf-be83-176e5213bb17@intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+{
+	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
+
+	BUILD_BUG_ON(1 + ((typeof(gt-&gt;sriov.vf.migration.resfix_marker))~0) &gt;
+		FIELD_MAX(VF2GUC_RESFIX_START_REQUEST_MSG_0_MARKER));
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
is it correctly aligned?
</pre>
    </blockquote>
    Fixed in revision.
    <blockquote type="cite" cite="mid:c0c71748-8dbc-4fdf-be83-176e5213bb17@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+
+	/* add 1 to avoid zero-marker */
+	return 1 + gt-&gt;sriov.vf.migration.resfix_marker++;
 }
 
 static void vf_post_migration_recovery(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	int err;
+	u16 marker;
 	bool retry;
+	int err;
 
 	xe_gt_sriov_dbg(gt, &quot;migration recovery in progress\n&quot;);
 
@@ -1227,14 +1246,23 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
 		goto fail;
 	}
 
+	marker = vf_post_migration_resfix_start_marker(gt);
+
+	err = vf_resfix_start(gt, marker);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
all private helpers called here have vf_post_migration prefix except this one

so maybe this step should be called vf_post_migration_resfix_start() instead
where you can call lower level helpers if needed</pre>
    </blockquote>
    Fixed in revision.
    <blockquote type="cite" cite="mid:c0c71748-8dbc-4fdf-be83-176e5213bb17@intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	if (unlikely(err)) {
+		xe_gt_sriov_err(gt, &quot;Recovery failed at GuC RESFIX_START step (%pe)\n&quot;,
+				ERR_PTR(err));
+		goto fail;
+	}
+
 	err = vf_post_migration_fixups(gt);
 	if (err)
 		goto fail;
 
 	vf_post_migration_rearm(gt);
 
-	err = vf_post_migration_notify_resfix_done(gt);
-	if (err &amp;&amp; err != -EAGAIN)
+	err = vf_post_migration_resfix_done(gt, marker);
+	if (err)
 		goto fail;
 
 	vf_post_migration_kickstart(gt);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
index 420b0e6089de..db2f8b3ed3e9 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
@@ -52,6 +52,11 @@ struct xe_gt_sriov_vf_migration {
 	wait_queue_head_t wq;
 	/** @scratch: Scratch memory for VF recovery */
 	void *scratch;
+	/**
+	 * @resfix_marker: Marker sent on start and on end of post-migration
+	 * steps.
+	 */
+	u8 resfix_marker;
 	/** @recovery_teardown: VF post migration recovery is being torn down */
 	bool recovery_teardown;
 	/** @recovery_queued: VF post migration recovery in queued */
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index d56b8cfea50b..1827d77852a4 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -49,11 +49,13 @@
  *
  * As soon as Virtual GPU of the VM starts, the VF driver within receives
  * the MIGRATED interrupt and schedules post-migration recovery worker.
- * That worker queries GuC for new provisioning (using MMIO communication),
+ * That worker sends `VF2GUC_RESFIX_START` action along with non-zero
+ * marker, queries GuC for new provisioning (using MMIO communication),
  * and applies fixups to any non-virtualized resources used by the VF.
  *
  * When the VF driver is ready to continue operation on the newly connected
- * hardware, it sends `VF2GUC_NOTIFY_RESFIX_DONE` which causes it to
+ * hardware, it sends `VF2GUC_RESFIX_DONE` action along with the same
+ * marker which was sent with `VF2GUC_RESFIX_START` which causes it to
  * enter the long awaited `VF_RUNNING` state, and therefore start handling
  * CTB messages and scheduling workloads from the VF::
  *
@@ -102,12 +104,17 @@
  *      |                              [ ]        new VF provisioning  [ ]
  *      |                              [ ]---------------------------&gt; [ ]
  *      |                               |                              [ ]
+ *      |                               |   VF2GUC_RESFIX_START        [ ]
+ *      |                              [ ] &lt;---------------------------[ ]
+ *      |                              [ ]                             [ ]
+ *      |                              [ ]                     success [ ]
+ *      |                              [ ]---------------------------&gt; [ ]
  *      |                               |       VF driver applies post [ ]
  *      |                               |      migration fixups -------[ ]
  *      |                               |                       |      [ ]
  *      |                               |                       -----&gt; [ ]
  *      |                               |                              [ ]
- *      |                               |    VF2GUC_NOTIFY_RESFIX_DONE [ ]
+ *      |                               |    VF2GUC_RESFIX_DONE        [ ]
  *      |                              [ ] &lt;---------------------------[ ]
  *      |                              [ ]                             [ ]
  *      |                              [ ]  GuC sets new VF state to   [ ]
@@ -118,6 +125,57 @@
  *      |                              [ ]---------------------------&gt; [ ]
  *      |                               |                               |
  *      |                               |                               |
+ *
+ * Handling of VF double migration flow is shown below::
+ *
+ *     GuC1                                             VF
+ *      |                                               |
+ *      |                                              [ ]&lt;--- start fixups
+ *      |                  VF2GUC_RESFIX_START(marker) [ ]
+ *     [ ] &lt;-------------------------------------------[ ]
+ *     [ ]                                             [ ]
+ *     [ ]---\                                         [ ]
+ *     [ ]   store marker                              [ ]
+ *     [ ]&lt;--/                                         [ ]
+ *     [ ]                                             [ ]
+ *     [ ] success                                     [ ]
+ *     [ ] ------------------------------------------&gt; [ ]
+ *      |                                              [ ]
+ *      |                                              [ ]---\
+ *      |                                              [ ]   do fixups
+ *      |                                              [ ]&lt;--/
+ *      |                                              [ ]
+ *      :                                               :
+ *      -------------- VF paused / saved ----------------
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
from here

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+ *      |                                               |
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
(and lifeline for GuC1 shall end here)

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+ *
+ *     GuC2
+ *      |
+ *      :                                               :
+ *      ----------------- VF restored  ------------------
+ *      |                                               |
+ *     [ ]                                              |
+ *     [ ]---\                                          |
+ *     [ ]   reset marker                               |
+ *     [ ]&lt;--/                                          |
+ *     [ ]                                              |
+ *      ----------------- VF resumed  ------------------
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
up to here, there should be no lifeline for the VF</pre>
    </blockquote>
    <p>Fixed in revision.</p>
    <p>-Satya.</p>
    <blockquote type="cite" cite="mid:c0c71748-8dbc-4fdf-be83-176e5213bb17@intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+ *      |                                              [ ]
+ *      |                                              [ ]
+ *      |                   VF2GUC_RESFIX_DONE(marker) [ ]
+ *     [ ] &lt;-------------------------------------------[ ]
+ *     [ ]                                             [ ]
+ *     [ ]---\                                         [ ]
+ *     [ ]   check marker                              [ ]
+ *     [ ]   (mismatch)                                [ ]
+ *     [ ]&lt;--/                                         [ ]
+ *     [ ]                                             [ ]
+ *     [ ] RESPONSE_VF_MIGRATED                        [ ]
+ *     [ ] ------------------------------------------&gt; [ ]
+ *      |                                              [ ]---\
+ *      |                                              [ ]  reschedule fixups
+ *      |                                              [ ]&lt;--/
+ *      |                                               |
  */
 
 /**
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------1kRDC3EBaNu2FkMAZN0Bt6sO--

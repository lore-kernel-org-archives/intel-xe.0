Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5F14C52D6F
	for <intel-xe@archiver.kernel.org>; Tue,  6 Aug 2024 20:09:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 951E710E3F3;
	Tue,  6 Aug 2024 20:09:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JFx8/VC3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D89AE10E3F3
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Aug 2024 20:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722974944; x=1754510944;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UKh1RSaLj/ETkDGPwNx90GsoI2welv71CQD1wucmULg=;
 b=JFx8/VC3MVtUHzwb/y54QLEn8XBosyOg4e4DIld5S85a8Q4f+y1FWcT+
 XSlefsznGyt8OR2/edVX+HsWV8d2Juj/3PjmWhie7Ejq/v22foZc0xYco
 C2sR18X/tXj0Qt7amBGaODhh0TgGS+8DgLpe0ZVANe4GEyO7nzqmjlF9S
 +/NwsCt+7EACrWI0BcKOsgXLRPGsFnd+QWdWK0NZ0W4h1G3BpgDDy2a9i
 dlUJ0bd/OUHe7xwrn60ow2b6eFrn/IWQc0eNocc5vz9Qk8yGNfAoEhz58
 Nt1m81D4soCC11YkMOJQZD5HkQSGZTn7dqzUE+mu2ACHj3RW1g1n/pT6s Q==;
X-CSE-ConnectionGUID: F7lwT5b4Q5Stbz0SJDQT2A==
X-CSE-MsgGUID: Jtx18kKmQUG1M72ZcrF5mA==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="20591465"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="20591465"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 13:09:02 -0700
X-CSE-ConnectionGUID: /cwRoinGTDaemPpI9xNdCw==
X-CSE-MsgGUID: yx5ZWpTlRACA9UqmJ7xVLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="87557932"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Aug 2024 13:09:01 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 6 Aug 2024 13:08:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 6 Aug 2024 13:08:56 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 6 Aug 2024 13:08:56 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 6 Aug 2024 13:08:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pg1DMMx2n5buNWcBpP9YYB5mSNdu5o4JhHJYv7VAxv31/RpoZXzITC0EfUQm8zf35EDbVTCMe/+QYuPLO8w9H/qP/OF9surjdjbO16mCbc3YkzwQYJ/kxSHB0EpPbMhIMEGbhzv7nQRYf0BLL3aZyziljPawwEWv6Kwcz3l3a96CftQFbTMligKNmbY2DKEpWkbSrZLWd4kOxl+QIrdzFKrCR6kjY8Z10CKl1zCN5/WhWrObn3UvXmXuGz3408Kt/N+fBjI7GSMoYG9Sykg+T+skITVmBTwikLt28AYFhUTU78B5ihqdO5xOGa+Mgud6aJkESRv1V7IYqaxKTFlCrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jCoZARjqeZkbswMlqWVvL3PSY0bzZaXyG3UAqj/qWpY=;
 b=j6CEJVJPnWJr8HBGWlu6mw7KyLjlM6ZxWssNq/JpQdaiYzMT37iV+XBY3KcL7LyuGxE+oxxVnBaySu/zB/ZClWKdYxqf/qXE3L2RQZZsHzfZRkE5l7AgrW1x9gDbPJewAdAKalFda1llXQ/nDVRwh3CqraAtoOtmfP9w+VBGYkdMMR52t7Kl+Q4oo3xOSValPQvPBZ4tl88B0jfYjjRozi4rULt+3d4bJGria2rlYBtc0hJlY1CQYjZfHJ7134WclwBF7hN+1vQ+n4AxynABQdaIbFEygTsYxogktBmygAaA1STIMk4MK+azKgBhTx2Ro6Jf9f/r765ddiq8Np1AJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 PH0PR11MB7522.namprd11.prod.outlook.com (2603:10b6:510:289::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.25; Tue, 6 Aug 2024 20:08:54 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%5]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 20:08:53 +0000
Message-ID: <2a369a01-a793-424f-8e14-7776462f213b@intel.com>
Date: Tue, 6 Aug 2024 22:08:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/gt: Add APIs for printing stats over debugfs
To: <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
References: <20240806194510.13044-1-nirmoy.das@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <20240806194510.13044-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR0P278CA0146.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::7) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|PH0PR11MB7522:EE_
X-MS-Office365-Filtering-Correlation-Id: 541c3f33-5941-48e7-f536-08dcb6539870
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MlYybGtjZnladzNrZ1lCMGFSaEVrWDJHaFhzVStlUitESG9KNXNlZG1rUFk1?=
 =?utf-8?B?aFFiWW9XeE5Hb2lGamNRMStNRmdoNnJRRW5McUN5bVBYNWNydzk1MUUwSDY4?=
 =?utf-8?B?L1ZrRTR1ZS9PaUo1YlZ4YXdvWGYxa0NQU0p4OFpVR21SRFpML2o0VjNLbXNp?=
 =?utf-8?B?UWloS1ppbExLL0hDaWYwZzl5Zi9LaU0zaXhPV3VnS05oektWSGhoMHVOVnNS?=
 =?utf-8?B?OVpHUDNQVmdwR0YydDh0aEV0K3FXTU5UU0IzWUE1S2c5MENrNDNFNUVhQzEw?=
 =?utf-8?B?Sk9BV1lVT09xaE96a1FvMmJzNWVucWRoNHpxckJHS0FobWZTWGVVdXZ4Z2R3?=
 =?utf-8?B?cndaUHYzQm8wTlZBSjZ5MG15bURPY0gxcjhSajFmWEc1Sm91blNLVkliVE4r?=
 =?utf-8?B?bzBTb3RLK0RMR3Y0REFqaEJnSUFsdXV4MGlIdGF2eWs4N2hCemtndUZHU3hD?=
 =?utf-8?B?TWx3cFR0ZjZqU1hyMzFuREhOVDZ3djcwWlYzUVF6QlJNVG90M2NBWUNPUWdk?=
 =?utf-8?B?a3BsR0FyQUFGcVBvN2FQcVpmRFF5cXdyVWg3bEs3cFFQdXdzTnV4elNTaDYz?=
 =?utf-8?B?VDE2MjdrY3d5bEZmeUdQb0tBQnQ2Z0dXSk9jcFRYOXBMNUpqRVhGWHB4NDlB?=
 =?utf-8?B?UnlxNlZGcTNKWVJsTVRNdFhmNmpQQjdrZTlsbmVWQXpxNllNZ1BRM25EbWpw?=
 =?utf-8?B?RURPQXUxbzlqN1dKQXVHU2VlN2E2QnlGRlJXU3FSeXNvd0pOTExTNHVGbXY1?=
 =?utf-8?B?SzdkckN6Q3FiKzlJdnBvdXg5eUtpblFiK2ZiMVBjOS9DSzFwRTg2K0hXY1Jz?=
 =?utf-8?B?ckpaMkRLUmZocGJmVXpabGxJT0lYYnIvWUFSTk4wVytRUW9Rd0NDMkEzYnJz?=
 =?utf-8?B?ZFF1d3crelVEeG1kcXZIbXgzRVJsc3pGemZMQk0rZ013blZvVUFObU5ncGh3?=
 =?utf-8?B?YkwwWHdVZWFGd3VrTjJEQkJYaGltY3B5bm5NdVZHYWNpc0Rkd3kxVXFwUm5w?=
 =?utf-8?B?SzhaaDZUc3VNam43TjdEaUhiMUoveGQ5clkxUjh2L0dNcGkyYXZNWG9hWTVh?=
 =?utf-8?B?TldEbnc1UExUREYxMnBkOWxvNk9ESjgwRUtKN3puc2x1OTlLOVhjcWh3WktD?=
 =?utf-8?B?NTRwQy9HT2p6M3FiNmFJaVN3TEhRdjZxcnFjNlI1ZDU3RjdLVVNkM2g5U2xU?=
 =?utf-8?B?Y0d1R0xOVGJDd0IxNTRtOGJ2WFJDc3NpUUhqRGg4SkFURjN1Nm9oTnNUMXRC?=
 =?utf-8?B?RGJDTWJYMDFZd2piTS91VTVjMUc4ZE5qaVZscy9wSEoxZjFIdFh3ZjhtZytz?=
 =?utf-8?B?SjAvNEhtWHo0RkNDbUZiTEs4VllUWGFwcElTTExTR1Y5OWFNZjNHMHg1bE9h?=
 =?utf-8?B?K2VCUnIrRm1oclZlUG5Oa3VDVXY2WFZqRmordlUwZ1Y1dHk5UEh1WFFzRzE0?=
 =?utf-8?B?NmlPVHVVaVVFVUZqZWZzNVBXdjhUeUlDS2RNS1g5cC9YaGFsOFJPR0ZPRE0v?=
 =?utf-8?B?eldCVGVWS2s3M3kwbDgvT1o3OWhZVUc1SlpZSGxNUm9OSXFVU0VLdEw5Uis4?=
 =?utf-8?B?MVhnTFN3YUtxUU9sc1B3NU5lRlRIdzk5SHVHSGNSeU9CdkVJSm1YT1RZamZj?=
 =?utf-8?B?cU1HYXhhbGZid0dITVhTdWhPM3RQUU1uK05iYUZQZ3czaTVFSEx3dUZVUmZX?=
 =?utf-8?B?dDNpc2VrNUh3SWJoVTJvQjZ6SHU2RE02M2RoUEJVT0hROWg1eGV3NDU5OXND?=
 =?utf-8?B?SVBGZm9HUm9XQUpYeEFNRnBxTk9KTXJJMDFFZ0R5Y1ZtTk5Za3RSRTlnb29j?=
 =?utf-8?B?SU5Kelh5V281VndTaWNodz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXdSLzM1cG9tbVRrVHdEMVhoMDhsZGxHQUhBQThpY0pRSjd2QUNzcXdjWldG?=
 =?utf-8?B?ZVk1QVdSQ3JyZjkvWnc0c0JoQVg3QTNsWDk1azF0eGE0cmlQRzh4NkRwOWFz?=
 =?utf-8?B?RTFPMmxaN3NhejFkM3RlS3d1OUo4QWZsZ0gxOFJyMWJCTTMrY0IwTFBOZnRR?=
 =?utf-8?B?Y2RPSEtHQ2FKTXRkV1hZbzFKMUdacTJiQ2xtVkpyZkVQU3UvcEIvNXVVL0FL?=
 =?utf-8?B?RmYyOXF6ZWRmYjduMUZhV3d2UnhNVmpQbG5DMG5qK2JXOVFFRWRyZnk4UG0r?=
 =?utf-8?B?RHVOaTdSd21XaFVZR05RdjJJNmJSMStjL2l5V3lhMncycXNBQTVkUXBIK0dO?=
 =?utf-8?B?eUFtNXNOLzZ6R2JmblBLUER6citpRHh6VFl0Nks0bTNDSzlmNXlNc3MvcHVL?=
 =?utf-8?B?ZjlBVmlmeHBVMFN2N3RDNFFpbnFibEM0K25LdkdGMTQ3UnppYWUwQWhyeThn?=
 =?utf-8?B?c3hHVkpyeiswZ1FMdmJRT2dIemZHa3RFYW4xb2hLSmQvalJVWVBQQldrcmtk?=
 =?utf-8?B?WVg0QkFUa3pNVHNYcDNIc3dSRE91ZUJ6U3JFYkkwKzVMYjhteUtNK2FaeVZy?=
 =?utf-8?B?Q0xOcUpuc0NIeTh0M1hiVnRwcFlkVDlnMVBJOXYwOGY0UUcxbGFLK2ZqVXBi?=
 =?utf-8?B?dWVaT3pIVlkrV2JjcXBoSHJhblZxSkFuWjIwTFFXSWd2Ry9wMjdrVCtLbHVY?=
 =?utf-8?B?VzhRR0FWSXh6Wm5iaTgrOWtnajRpWmVzUU1xbHljRUs2d2Z0MXV5WWN3cmcw?=
 =?utf-8?B?QzA1QzJSZXFpcHVFZlFPU0ZteFd3bThyeG02eUFQZFdpVXYwZ0tQdisrcU0v?=
 =?utf-8?B?WElUSGYza01kOTdjQmRGVzNuOFhwSFlHYzNTUW1WL0FQM0RhT3F0RTgybXpH?=
 =?utf-8?B?a1F1Y3JrVkdVL21ORmkzQU5JTnEwbHpjRFNuZzFxQS90YjBUNWJwaFBrNXFH?=
 =?utf-8?B?U2I3eWpmNzV4RWhDYjVxblFYengxZU85a0RmWUN0Vk4xRXlQOU9xV2RiMjJP?=
 =?utf-8?B?cWpobWRMV1RjSVZyaTE0RFMzVVYxcnNha2lLMkJ2dWpPcDBzdDZrVkhBeWx0?=
 =?utf-8?B?RTB2WklHMGl1OS9BVitwdkNZNlFBUk5tMlBNYkxzTHhDUzJZb0Y4WlBFa3pz?=
 =?utf-8?B?dmhMeFJ0NjhCYjBLMzUzZXhma2pUb0JWRG9mV05OeEw5S2xCV2taanIzMHE0?=
 =?utf-8?B?NnhQaDAyR2tWZ0hJcy9vU3ErdXp0K0JLWnk3dHBpZ01XNFNwcFRVQWlPRUZs?=
 =?utf-8?B?d09qcVUwcWIrTXNPZVppYjJmbEhFN1N1VXU1MG9WeGdOWE52VThUR09tMXlJ?=
 =?utf-8?B?cDZBVXBJa1VlN1ZlMW93MXVkd21POGExMHpqekcyS0JOTXRFVWZQZ2I4UG9V?=
 =?utf-8?B?d1JzR0tHWE9ZSmhzU2hSRDNieXVWK0cwU1lvSlVyNWZmc0htN2xaMmRJYXRt?=
 =?utf-8?B?Y0xpamh5RWxESlNYRlE0UkF6MndoaloxMlRCUmNWQUNMZ3BhSllHSHc0WnJO?=
 =?utf-8?B?NVBWOERUNm5ZNThva1JMSlNDODZQYjJPR3grUm45QXFLZGlwY3lVWUVldytV?=
 =?utf-8?B?dnZ0YWVYUG1oUnkveGFuRHd4VVZidWlOTXRYYXdYUnA5Tmw4UlRjejN5cU8y?=
 =?utf-8?B?cTBNMTVLR3RNMFl0M3dEUHlza2Y1QlJJR2xUV1Z2aVJOdzN6Y3UwN3JDNHdP?=
 =?utf-8?B?bXJaUXM3VWR3YjZjNDhnc253a2RNaGx3WU5IUmZCN0g0WVlFZ3hjaHJ5Y0pQ?=
 =?utf-8?B?dW0wOUQwZlQxZWJOdnpkamNIWEM2bnRrL0tIUWVIMHV5OGZWb1l3OWkxYWpL?=
 =?utf-8?B?RUNrVVdWaXRHSUE5TGJEdHBmeXFSYUZqdkU4cVBKcHVBQ3cyMU9xUGRzL0Z0?=
 =?utf-8?B?THdwNmNXMisvTE1tOFU1SnlQVmx4U2Q5aS9JeHA1VWtXR2VlbUVPakRtKzRY?=
 =?utf-8?B?SDY4V01KVktmMTlhMkFLaU8wL2pFYTE2ejM2aHdnNFYxaks3cmx1OXZVVEwy?=
 =?utf-8?B?VVlLcnVGa3p2N0FmU2o2SUprTm1lYkhPcmhYb0dsZnB1eEZZUzRIc0FkdE5v?=
 =?utf-8?B?OGM4RlpiUUlNZ2sxdVNEdWVnSHYxSnFqSkM0Yy9GTEpNM2k4TFV0K3VLWlBh?=
 =?utf-8?Q?W1C5p+/pJABejpkTmNzoa6VXu?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 541c3f33-5941-48e7-f536-08dcb6539870
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 20:08:53.8044 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sEEg3UCBVAWPuT4xVQeJAfO3VumINgf+Vwndpcoo0NC5LhbS+SIS0P+/K64ytimSOpD5D8Gd/15vIIatWNRgFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7522
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

Looks like send this bit prematurely:

On 8/6/2024 9:45 PM, Nirmoy Das wrote:
> Add skeleton APIs for recording and printing various stats over
> debugfs. This currently only added counter types stats which is backed
> by atomic_t and wrapped with CONFIG_DRM_XE_STATS so this can be disabled
> on production system.
>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/xe/Kconfig.debug   | 11 +++++++++++
>   drivers/gpu/drm/xe/Makefile        |  2 ++
>   drivers/gpu/drm/xe/xe_gt_debugfs.c |  4 ++++
>   drivers/gpu/drm/xe/xe_gt_stats.c   | 30 +++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_gt_stats.h   | 31 ++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_gt_types.h   |  7 +++++++
>   6 files changed, 85 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_gt_stats.c
>   create mode 100644 drivers/gpu/drm/xe/xe_gt_stats.h
>
> diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
> index bc177368af6c..4db6d707c1af 100644
> --- a/drivers/gpu/drm/xe/Kconfig.debug
> +++ b/drivers/gpu/drm/xe/Kconfig.debug
> @@ -94,3 +94,14 @@ config DRM_XE_USERPTR_INVAL_INJECT
>   
>   	 Recomended for driver developers only.
>   	 If in doubt, say "N".
> +
> +config DRM_XE_STATS
> +	bool "Enable XE statistics"
> +	default n
> +	help
> +	  Choose this option to enable support for collecting and
> +	  displaying XE statistics as debugfs.
> +
> +	  Recommended for driver developers only.
> +
> +	  If in doubt, say "N".
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 1ff9602a52f6..b0bbb248f644 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -143,6 +143,8 @@ xe-$(CONFIG_PCI_IOV) += \
>   	xe_pci_sriov.o \
>   	xe_sriov_pf.o
>   
> +xe-$(CONFIG_DRM_XE_STATS) += xe_gt_stats.o
> +
>   # include helpers for tests even when XE is built-in
>   ifdef CONFIG_DRM_XE_KUNIT_TEST
>   xe-y += tests/xe_kunit_helpers.o
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index 5e7fd937917a..3765c04919dc 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -17,6 +17,7 @@
>   #include "xe_gt_mcr.h"
>   #include "xe_gt_sriov_pf_debugfs.h"
>   #include "xe_gt_sriov_vf_debugfs.h"
> +#include "xe_gt_stats.h"
>   #include "xe_gt_topology.h"
>   #include "xe_hw_engine.h"
>   #include "xe_lrc.h"
> @@ -286,6 +287,9 @@ static const struct drm_info_list debugfs_list[] = {
>   	{"default_lrc_bcs", .show = xe_gt_debugfs_simple_show, .data = bcs_default_lrc},
>   	{"default_lrc_vcs", .show = xe_gt_debugfs_simple_show, .data = vcs_default_lrc},
>   	{"default_lrc_vecs", .show = xe_gt_debugfs_simple_show, .data = vecs_default_lrc},
> +#if IS_ENABLED(CONFIG_DRM_XE_STATS)
> +	{"stats", .show = xe_gt_debugfs_simple_show, .data = xe_gt_stats_print_info},
> +#endif
>   };
>   
>   void xe_gt_debugfs_register(struct xe_gt *gt)
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
> new file mode 100644
> index 000000000000..cc69d748e8f6
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_stats.c
> @@ -0,0 +1,30 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include <linux/atomic.h>
> +
> +#include "xe_gt.h"
> +#include "xe_gt_stats.h"
> +
> +#ifdef CONFIG_DRM_XE_STATS
> +void xe_gt_stats_incr(struct xe_gt *gt, enum xe_gt_counter_stats id, int incr)
> +{
> +	atomic_add(incr, &gt->stats.counters[id]);
> +}
> +
> +static const char *const stat_description[] = {
> +};
> +
> +int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p)
> +{
> +	enum xe_gt_counter_stats id;
> +
> +	for (id = 0; id < XE_GT_COUNTER_STATS_NUM; ++id)
> +		drm_printf(p, "%s: %d\n", stat_description[id],
> +			   atomic_read(&gt->stats.counters[id]));
> +
> +	return 0;
> +}
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats.h b/drivers/gpu/drm/xe/xe_gt_stats.h
> new file mode 100644
> index 000000000000..e83155ab1fdb
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_stats.h
> @@ -0,0 +1,31 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _XE_GT_STATS_H_
> +#define _XE_GT_STATS_H_
> +
> +#include <drm/drm_print.h>
> +
> +struct xe_gt;
> +//struct drm_printer;

Forgot to remove this.


> +
> +enum xe_gt_counter_stats {
> +	XE_GT_COUNTER_STATS_NUM,
> +};
> +
> +#ifdef CONFIG_DRM_XE_STATS
> +int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p);
> +void xe_gt_stats_incr(struct xe_gt *gt, enum xe_gt_counter_stats stat, int incr);
> +#else
> +int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p)
> +{
> +}
> +
> +void xe_gt_stats_incr(struct xe_gt *gt, enum xe_gt_counter_stats stat, int incr)
> +{
> +}
> +
> +#endif /* CONFIG_DRM_XE_STATS */
> +#endif /* _XE_GT_STATS_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 631928258d71..0ded57b56628 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -10,6 +10,7 @@
>   #include "xe_gt_idle_types.h"
>   #include "xe_gt_sriov_pf_types.h"
>   #include "xe_gt_sriov_vf_types.h"
> +#include "xe_gt_stats.h"
>   #include "xe_hw_engine_types.h"
>   #include "xe_hw_fence_types.h"
>   #include "xe_oa.h"
> @@ -133,6 +134,12 @@ struct xe_gt {
>   		u8 has_indirect_ring_state:1;
>   	} info;
>   
> +#if IS_ENABLED(CONFIG_DRM_XE_STATS)
> +	struct {
> +		atomic_t counters[XE_GT_COUNTER_STATS_NUM];
> +	} stats;
> +#endif

I forgot to  add doc here. I will wait for reviews and resend with docs.


Regards,

Nirmoy

> +
>   	/**
>   	 * @mmio: mmio info for GT.  All GTs within a tile share the same
>   	 * register space, but have their own copy of GSI registers at a

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0849C02182
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jan 2025 18:36:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9F5010E143;
	Thu, 23 Jan 2025 18:36:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SWgalEU5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D9C910E143
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jan 2025 18:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737657392; x=1769193392;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=mzRk8i9ryMs8G4GtWBrpzEKVMtnMF2z2OdZui6JdFk0=;
 b=SWgalEU54oaTejnlS2VLMD4svLr/fD0JdRAzuHQk/l2XYRVPOliomKyX
 37GuzynuU84eKf4RDCJRZwLQ1xwHA0khEpXKH2R6wRJlxEok84t54Q7lV
 mBk1QeOAytHrWGBFcorQw6bYQaVlT0soq/I6Mr+C/PZXp1mMs5N7E7BYJ
 ubyLDABmC80X/SIINkJyeVUL1deWFZvNCdCt9PW0H+wcC6DkLVdeeVvLM
 4cZKgGHEKODLytJQ+I8HnJj6LpuA1qB7dDTu2gRICOsrpQkxZs0rHWJDq
 0HUrK8ZF46JFOtdERcAeMms4XA+hur1JLLDeQRejs8sM58bCJ9czWFkWk A==;
X-CSE-ConnectionGUID: 5ONNdOEPSiaLlvVfaHsbdg==
X-CSE-MsgGUID: x4Bdar6mSqyEz187x/Q9WQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="38206001"
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; d="scan'208";a="38206001"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 10:36:32 -0800
X-CSE-ConnectionGUID: dB+1ZLQrSgSi0UVasBFpbA==
X-CSE-MsgGUID: DZazEeciS42+rW7pBpZ2dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; d="scan'208";a="107547202"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2025 10:36:32 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 23 Jan 2025 10:36:31 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 23 Jan 2025 10:36:31 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 23 Jan 2025 10:36:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CNFYAkZ6yGP0msv2qLp1KkkjE3vxt9bzlpyS/I7inTppIq6UJTzNssQljr35d5MMDj0jlJ20MFvWGAt4289RtP3+QOUSdoEsqZCaEbGWGgb9aey+oLPuNQ1EhgbSwncR77UA3gVdhgPDeULh4VKRr40fh2CZXd5L115VZGsYdO9Cb223wKRYdB9H7Sd2JrQQQw7IUcZhgy3Ctl1UuN7FXiIblfUYDWrj+aYAICoIPF/9vJs3Oac8K7pBt3ydeZiWAH90FaKEKyYpO0W9PGKmBw0Zbwo43mUpleZF/cSniNVbs/ajJGl7/MDwrJdPcStcgOk/n0h4OnAmsNk5KSskXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hW9TMTwTh3pyNz8yMNxDCYMe0x8gbYyZe2M531cc5og=;
 b=xhmtceJGpQt92irZoZ5vmgefNk4+Dj3V3hfqY2aiiyGdyCdgb1Zse8JUEHxryoSrTxilZRo+NQHvPDRbMBwIHLebDPotUIV29BePQXRXrKyrhKceixAKYgLTRmEapVqmLE9/+GbV/n+ftUIjo69QdOoljovQqiEcBLadg3qyG1M4fTf0ijjc1vHPsmMoL1/pDNmF67a+0hZ48TO8IHcGfRTiacQxbnWUDLrlQ1ukqZwYulsSNGkV1IKgni/T7B9EA1xFl+tOfSQL1YSHAap3k4kDLqqZVxYXMg53AWQJtJHay/KSsDmFbgcIZ/D93Y+qEqCWSia3swa5tnJyMBPk4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB5190.namprd11.prod.outlook.com (2603:10b6:510:3c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Thu, 23 Jan
 2025 18:36:28 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8377.009; Thu, 23 Jan 2025
 18:36:28 +0000
Date: Thu, 23 Jan 2025 12:36:24 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Julia Filipchuk
 <julia.filipchuk@intel.com>, =?utf-8?B?Sm9zw6k=?= Roberto de Souza
 <jose.souza@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 <stable@vger.kernel.org>
Subject: Re: [PATCH 2/2] drm/xe: Fix and re-enable xe_print_blob_ascii85()
Message-ID: <jvwkscbbf7wlipsu7bura35aasbi6ter3avr7tv4ocwf3nsizp@gd6vuo4nutpz>
References: <20250123051112.1938193-1-lucas.demarchi@intel.com>
 <20250123051112.1938193-3-lucas.demarchi@intel.com>
 <1dd0e42d-0163-469e-8fd2-9c3b941c23bc@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1dd0e42d-0163-469e-8fd2-9c3b941c23bc@intel.com>
X-ClientProxiedBy: MW4PR02CA0011.namprd02.prod.outlook.com
 (2603:10b6:303:16d::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB5190:EE_
X-MS-Office365-Filtering-Correlation-Id: d15ac63c-ad08-4457-2be8-08dd3bdcd98a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?cciljbgW8EyaiUetJn94dT2fBVG8XjMtCwsetCh3PynHbz62SsoVgxktfI?=
 =?iso-8859-1?Q?puIG+/BUQU23FajQyKTL3KqfE2SiBGXtrpXWpMEgxxPsWaAoafFWxqnVii?=
 =?iso-8859-1?Q?bENaiHCrOZiHEf63ugRigl8dnpcyqci9+E6M3h/nkHKc6/iUdIQc9ckCHd?=
 =?iso-8859-1?Q?0vg2zVl3mdx4GOco0DN3+aK1KJOYVO8y0FBbSRqFfnFuKqonNI1Uy9YtdE?=
 =?iso-8859-1?Q?ltVrlcRz9qr07gNl//Bpo8f4Jtw2ZgFMiSn7WrUqmJClqvvQvokUISsKQj?=
 =?iso-8859-1?Q?AMMj9HyAKkoWHgWW0dbhDwimplhYnETsuORkMoR22DBRXWglbJXfIsCH6p?=
 =?iso-8859-1?Q?ATBo5VQzVg0+nO3VCZGIpcDqTVrD98YI7GmzqlyaE9Q5OHCS762sHgWda2?=
 =?iso-8859-1?Q?zZAezxD0RF/kpvuS389XXtRegHxgV4K1MAqcJoUAnzJ3FbwQm8vOtAg09u?=
 =?iso-8859-1?Q?Hb2NolUjHiZkkR4TnXNKk7cL/NIQEbsKfSOyZlT+DBLTuh429HrLBjEY3A?=
 =?iso-8859-1?Q?vvKJ/t9NSuVubecivLGD7LXR1eH8mvi4ud6bTXde3gbkDtsuCLW/jxwpAo?=
 =?iso-8859-1?Q?JfZbsWfI+6cx3Tr1bkKXP7HeprbNAwdj8doMcn/pqQyMbRyXQvJz0PEJ+I?=
 =?iso-8859-1?Q?NZ/yCr5GNtwp1oWn1nukFuu/Neck3VkZRdwVkTrTpjvF1Hn4CtEfASQ4nI?=
 =?iso-8859-1?Q?VRPGwnHAlnOOpRwY2HrHGR9fbR4VX5BG0z4iYlFO1966zLADt+Q7FlwpFz?=
 =?iso-8859-1?Q?R0Jnk0qA1cukxBWsGm5iOx4trhHV9xRsIJSGUAcdm7xMkLZKn74q8n4xCP?=
 =?iso-8859-1?Q?qlIVEMXoYwRU/1drlKhrWWFkT9q0ElE7FHEUW3woyXjRuI/80qdOz2cQL4?=
 =?iso-8859-1?Q?zsMy0B5KLd1WZriHbIti7CSY+2eik8iqEMxNkAG2aMQIsVUvdYoIyRs99/?=
 =?iso-8859-1?Q?wfrWKDmcGfEKgkAezYAkb7rGDzrrgiHDSklEEHeQhkM2DsR2ny8et5oIQM?=
 =?iso-8859-1?Q?XYWfVIX8BOTJ8g/iGciET0DPT/rxMA+1yf8zRH4mk46PpZAGl7WfbPG9jD?=
 =?iso-8859-1?Q?BmdG4+eBqjM2m40jFx5rNtTXsvbHTvChoG7x8w15hgkSkFj9BtS9SOw/Km?=
 =?iso-8859-1?Q?WAukLPiDEVu8Rtd4oIGuCvt6KkYzBedDV5cWU+2L6e9KSY9sj0hzcvKlu6?=
 =?iso-8859-1?Q?cYZ7aPhB7ao5jhKqPKW3YFEwODHBOnleb2SnGLl379wb2onF76urN3mRaW?=
 =?iso-8859-1?Q?kZiq+XQI9OgF3dKE6tyFdjxnP1tEKfxPYgYMup6qg/Orw97AUztkaCKZVa?=
 =?iso-8859-1?Q?dtLvJI60M71AKpplGCj/+Xp/z23qVMQ6mAc2yPxLXLp1DR/1LEyXr8VrJ2?=
 =?iso-8859-1?Q?4Bsd/QgHVKrsLGhUvvBcYnEXHdi4pf/1j4UxjbQskBbSqrmo9zB4QOyiVS?=
 =?iso-8859-1?Q?TA7iKQQJBaZhcgXw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?n5f2VKfPEVoXTPVwrpGe+5fzqCS4lj3GN9DKD5KqxNsMSP+qkNV8/J/91N?=
 =?iso-8859-1?Q?a+ztYbG0qSiNgbO4IpPp6IgJpBtgusQo+E0/QCUwQLGZlTYz4yZ+ZhpxWh?=
 =?iso-8859-1?Q?s3YKS6Z9zw9pxEAbp6YuPFJk7BKeBO14NWEX3ik9Vrmla7f3iDkWh6seBd?=
 =?iso-8859-1?Q?lDgiJjLFVlDtN9255tn70GlADPVZeWVEyLGq10AxEEm8E48lpB3mzFDHZC?=
 =?iso-8859-1?Q?3typsUNzUp+DJZK2J3AvXnkdv86lDnStfHe95G6sK6/ERO2TIiygWP0NxR?=
 =?iso-8859-1?Q?RbkUU4g7a/LqVh05RXeBZvUmnZIFncm27Zu11nCRvVNj54LBCjh6f3lAVD?=
 =?iso-8859-1?Q?0Di26tTFjxuhJ2K7l10sM9kJ/M/ggwcMaQxeaJ2W49R4gy/k8GQ3pBpYJa?=
 =?iso-8859-1?Q?eygcKPQwGMN7GLNLy0/E9DDOPLIpZ4BAq/dY27wtwuJsLrnYitBTM1qW5X?=
 =?iso-8859-1?Q?ZX7+ufvm4OcC3GMHQdbuP9myIxPSGha0FmswxCt3utghoq5DB3z3/1F1RT?=
 =?iso-8859-1?Q?8OmT8iGVSsLLgS9TWu6yTxW6yYUa1E2//6QgKZnxoCVnEUGz56fsKaxngu?=
 =?iso-8859-1?Q?+t2vmjQziYyZG6LUO8me16oNgkhfgrz7nGWWLWzp1FYKdT0gNVpkAeiXvw?=
 =?iso-8859-1?Q?kthvScuSEGbReB1HwBaqwan8zNZFKNNJ6n6iGK4arPuVRYEPtDZKj7vK8w?=
 =?iso-8859-1?Q?L+5k6LzSCwF6jHOlJVox0nvkyeYGVaanbiPrlyzhW1Mpylc3+wo9mGgKLi?=
 =?iso-8859-1?Q?kISf/ljLL4IInV9XEJ5y+Y3yM21RK51lsU9O4eMAt7XSb/Nn1FIE9w/65P?=
 =?iso-8859-1?Q?kDyXT2oHMaIB/5HksFhZbUIaY3e1WYhZPBW25+7Yk/Mwz0SHzjIMEYJXXv?=
 =?iso-8859-1?Q?cgU4Hhnf09YuM9qfm2MerlTT156IsOTLEutDmzREXL3cpNqCjsOXeLlj6O?=
 =?iso-8859-1?Q?ZTKBkGBVkbzUa8VPcinFmJGcO2phLyqMqNpsibTcmuB8wRqHGBkibDFVEK?=
 =?iso-8859-1?Q?YQeemFLJoEOLH7kwf0qug2iwfQEqe3O+2kI2a78xkgf54JX5Dsy4n145+J?=
 =?iso-8859-1?Q?mcOx5JH5+0RZFNq+bgNg5etAmx3Yr0xPhfiAcGE926cxYKmsVUoS9fJfRZ?=
 =?iso-8859-1?Q?ErLwEqsbmSJ20bLMcyKbUY5soe+XvWXQzXxd37ZNKjuu4Od+OjmNOJoG3T?=
 =?iso-8859-1?Q?b2g5YkDkgP91Aj5gpCg1/yy2VcQw0tGoibX/6tmC44Q8VtCmSpK4AydU9r?=
 =?iso-8859-1?Q?a3p4UtiJOvyqteSmmRKh4Hil0upBTlQFvF4dN2f9QF3aMMXz6IoSCs+4pK?=
 =?iso-8859-1?Q?iUZJ0eV9j1MmKivbQG0FBLfwEe0JNsytejUTs0CZcnoAXMwUBAk3B7o/Jf?=
 =?iso-8859-1?Q?x84VdBHAx4FJVF+WIRnEBePfXAQhNyEc2/nK/huxvdZIelFAOM8USqVlA7?=
 =?iso-8859-1?Q?byXomrUavTW+hlwfJOXloJ2pIRAikPSjGvpiwDJKlMl8cHwXRV1yKqKknT?=
 =?iso-8859-1?Q?b/4vT9JJ5wDISHCiL5SvQ4M42U0lbmsJJdc/sXDzSzyH7ajOBZE/ivxdpD?=
 =?iso-8859-1?Q?39YiGKn6ihp9iCUTjijlkY/Tkkt6BLH3ufK4XvPVL0o/xvMtqwuVQy/87O?=
 =?iso-8859-1?Q?r5pTjDUGjm/QfLUKYsZyf2yAx8Sdkxn+JjgKJ+RFPQUXJpG1RI27XbzA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d15ac63c-ad08-4457-2be8-08dd3bdcd98a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 18:36:28.7107 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oVfSBxvOgKGQACBH5HCz34/btOCyB/6p7MCbPs2DbeaqyVv80byqbwgx76/ARj1m6lG2ubcqExKZjbOlD9/MgAIjmOLxXknNws8+CvuC02E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5190
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

On Thu, Jan 23, 2025 at 10:25:13AM -0800, John Harrison wrote:
>On 1/22/2025 21:11, Lucas De Marchi wrote:
>>Commit 70fb86a85dc9 ("drm/xe: Revert some changes that break a mesa
>>debug tool") partially reverted some changes to workaround breakage
>>caused to mesa tools. However, in doing so it also broke fetching the
>>GuC log via debugfs since xe_print_blob_ascii85() simply bails out.
>>
>>The fix is to avoid the extra newlines: the devcoredump interface is
>>line-oriented and adding random newlines in the middle breaks it. If a
>>tool is able to parse it by looking at the data and checking for chars
>>that are out of the ascii85 space, it can still do so. A format change
>>that breaks the line-oriented output on devcoredump however needs better
>>coordination with existing tools.
>>
>>Cc: John Harrison <John.C.Harrison@Intel.com>
>>Cc: Julia Filipchuk <julia.filipchuk@intel.com>
>>Cc: José Roberto de Souza <jose.souza@intel.com>
>>Cc: stable@vger.kernel.org
>>Fixes: 70fb86a85dc9 ("drm/xe: Revert some changes that break a mesa debug tool")
>>Fixes: ec1455ce7e35 ("drm/xe/devcoredump: Add ASCII85 dump helper function")
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>>  drivers/gpu/drm/xe/xe_devcoredump.c | 30 +++++++++--------------------
>>  drivers/gpu/drm/xe/xe_devcoredump.h |  2 +-
>>  drivers/gpu/drm/xe/xe_guc_ct.c      |  3 ++-
>>  drivers/gpu/drm/xe/xe_guc_log.c     |  4 +++-
>>  4 files changed, 15 insertions(+), 24 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
>>index a7946a76777e7..d9b71bb690860 100644
>>--- a/drivers/gpu/drm/xe/xe_devcoredump.c
>>+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>>@@ -391,42 +391,30 @@ int xe_devcoredump_init(struct xe_device *xe)
>>  /**
>>   * xe_print_blob_ascii85 - print a BLOB to some useful location in ASCII85
>>   *
>>- * The output is split to multiple lines because some print targets, e.g. dmesg
>>- * cannot handle arbitrarily long lines. Note also that printing to dmesg in
>>- * piece-meal fashion is not possible, each separate call to drm_puts() has a
>>- * line-feed automatically added! Therefore, the entire output line must be
>>- * constructed in a local buffer first, then printed in one atomic output call.
>>+ * The output is split to multiple print calls because some print targets, e.g.
>>+ * dmesg cannot handle arbitrarily long lines. These targets may add newline
>>+ * between calls.
>Newlines between calls does not help.
>
>>   *
>>   * There is also a scheduler yield call to prevent the 'task has been stuck for
>>   * 120s' kernel hang check feature from firing when printing to a slow target
>>   * such as dmesg over a serial port.
>>   *
>>- * TODO: Add compression prior to the ASCII85 encoding to shrink huge buffers down.
>>- *
>>   * @p: the printer object to output to
>>   * @prefix: optional prefix to add to output string
>>   * @blob: the Binary Large OBject to dump out
>>   * @offset: offset in bytes to skip from the front of the BLOB, must be a multiple of sizeof(u32)
>>   * @size: the size in bytes of the BLOB, must be a multiple of sizeof(u32)
>>   */
>>-void xe_print_blob_ascii85(struct drm_printer *p, const char *prefix,
>>+void xe_print_blob_ascii85(struct drm_printer *p, const char *prefix, char suffix,
>>  			   const void *blob, size_t offset, size_t size)
>>  {
>>  	const u32 *blob32 = (const u32 *)blob;
>>  	char buff[ASCII85_BUFSZ], *line_buff;
>>  	size_t line_pos = 0;
>>-	/*
>>-	 * Splitting blobs across multiple lines is not compatible with the mesa
>>-	 * debug decoder tool. Note that even dropping the explicit '\n' below
>>-	 * doesn't help because the GuC log is so big some underlying implementation
>>-	 * still splits the lines at 512K characters. So just bail completely for
>>-	 * the moment.
>>-	 */
>>-	return;
>>-
>>  #define DMESG_MAX_LINE_LEN	800
>>-#define MIN_SPACE		(ASCII85_BUFSZ + 2)		/* 85 + "\n\0" */
>>+	/* Always leave space for the suffix char and the \0 */
>>+#define MIN_SPACE		(ASCII85_BUFSZ + 2)	/* 85 + "<suffix>\0" */
>>  	if (size & 3)
>>  		drm_printf(p, "Size not word aligned: %zu", size);
>>@@ -458,7 +446,6 @@ void xe_print_blob_ascii85(struct drm_printer *p, const char *prefix,
>>  		line_pos += strlen(line_buff + line_pos);
>>  		if ((line_pos + MIN_SPACE) >= DMESG_MAX_LINE_LEN) {
>>-			line_buff[line_pos++] = '\n';
>If you remove this then dmesg output is broken. It has to be wrapped 
>at less than the dmesg buffer size. Otherwise the line is truncated 
>and data is lost.

we broke everything because of the dump to dmesg. Let's restore
things in a way that works with guc_log via debugfs and devcoredump
rather than block it on dmesg.

Lucas De Marchi

>
>John.
>
>>  			line_buff[line_pos++] = 0;
>>  			drm_puts(p, line_buff);
>>@@ -470,10 +457,11 @@ void xe_print_blob_ascii85(struct drm_printer *p, const char *prefix,
>>  		}
>>  	}
>>+	if (suffix)
>>+		line_buff[line_pos++] = suffix;
>>+
>>  	if (line_pos) {
>>-		line_buff[line_pos++] = '\n';
>>  		line_buff[line_pos++] = 0;
>>-
>>  		drm_puts(p, line_buff);
>>  	}
>>diff --git a/drivers/gpu/drm/xe/xe_devcoredump.h b/drivers/gpu/drm/xe/xe_devcoredump.h
>>index 6a17e6d601022..5391a80a4d1ba 100644
>>--- a/drivers/gpu/drm/xe/xe_devcoredump.h
>>+++ b/drivers/gpu/drm/xe/xe_devcoredump.h
>>@@ -29,7 +29,7 @@ static inline int xe_devcoredump_init(struct xe_device *xe)
>>  }
>>  #endif
>>-void xe_print_blob_ascii85(struct drm_printer *p, const char *prefix,
>>+void xe_print_blob_ascii85(struct drm_printer *p, const char *prefix, char suffix,
>>  			   const void *blob, size_t offset, size_t size);
>>  #endif
>>diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>>index 8b65c5e959cc2..50c8076b51585 100644
>>--- a/drivers/gpu/drm/xe/xe_guc_ct.c
>>+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>>@@ -1724,7 +1724,8 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
>>  			   snapshot->g2h_outstanding);
>>  		if (snapshot->ctb)
>>-			xe_print_blob_ascii85(p, "CTB data", snapshot->ctb, 0, snapshot->ctb_size);
>>+			xe_print_blob_ascii85(p, "CTB data", '\n',
>>+					      snapshot->ctb, 0, snapshot->ctb_size);
>>  	} else {
>>  		drm_puts(p, "CT disabled\n");
>>  	}
>>diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
>>index 80151ff6a71f8..44482ea919924 100644
>>--- a/drivers/gpu/drm/xe/xe_guc_log.c
>>+++ b/drivers/gpu/drm/xe/xe_guc_log.c
>>@@ -207,8 +207,10 @@ void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_
>>  	remain = snapshot->size;
>>  	for (i = 0; i < snapshot->num_chunks; i++) {
>>  		size_t size = min(GUC_LOG_CHUNK_SIZE, remain);
>>+		const char *prefix = i ? NULL : "Log data";
>>+		char suffix = i == snapshot->num_chunks - 1 ? '\n' : 0;
>>-		xe_print_blob_ascii85(p, i ? NULL : "Log data", snapshot->copy[i], 0, size);
>>+		xe_print_blob_ascii85(p, prefix, suffix, snapshot->copy[i], 0, size);
>>  		remain -= size;
>>  	}
>>  }
>

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B9CC021BB
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 18:10:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABD9510E495;
	Mon, 24 Feb 2025 18:10:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d5vF5+Ua";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEA8710E495
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Feb 2025 18:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740420649; x=1771956649;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cND9o+5IIwKuHgElbq+8DrRCG5OhjL1UiBQ2MLY3pKI=;
 b=d5vF5+UaZJHYQ69q5X8MEoooHykrEJG4A4/TnK/Iz/YonoEgnk8rs/oN
 vGrxyjCvUg/kvkeU2cxD/0GJ9Tw7BmPfl9napm+EcAkMavD2yutX8eo0v
 yd1IVdpBl3Wwvss1AzIyPvr4SyDOA77jIIACpVBmVAjascIgCHPOSB4OO
 i0TzY2cn3T0slagTvrJHJ3CQRwKcFs1QjJr82kJUGp/NOY4B8vT3U2pHQ
 cLjL8C57s27eIiDBfM1Cjrx7gsMMzhAsWiq30LvVOUMacG+oEIJAXNjCt
 vwdJhSGnDbxwRkNszcCh56ENEoShrbsCltjQIEY264VBLBohe2Rci6kK3 Q==;
X-CSE-ConnectionGUID: mfWk65l6T5G0/avTB7OZ+w==
X-CSE-MsgGUID: Wk5MGgW5Qj+P9414GhX9aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="45101818"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="45101818"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 10:10:48 -0800
X-CSE-ConnectionGUID: ZWibKJVoT1KNvwvvOzDRPg==
X-CSE-MsgGUID: /vUb//T+RhyWI8NApQ7aNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="116119986"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 10:10:48 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 24 Feb 2025 10:10:47 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 24 Feb 2025 10:10:47 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Feb 2025 10:10:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oipysn3CGIfdl4lK33iV5aNgWPr2iz0LDnPuxTaPFJBR5JkODlYSBREwAOw8srgysTtHrJ8VmInC1q3QCEcJUov10HQuXBZQQqiYDEgFw/HBcRl+YTtnt61f93C9qfdvxU8t4W+SQFEH/Sgd0v9A8NiRbUb+G7jC6XpvVj09uekiQjJHlIIFYOXF4tW3EIdXWemsCGh3uFPK9JsJxo3B6hX0Bkpn+8+0Cuo7vShiXYFcbbRNl6HA0s7rr0N/HiexMxhF1Dhlpu7IZhzIPDOz48zQBxwM3JwiSWt3TynFf0Fo3wKbSEfNxtt6kz0w6iqe8w6hiuVwK6A67XJmNtILaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hA8MaA2KybwPcHwNL9fi/vELxOTXTnuWeeq0Xe99zdI=;
 b=x+ywmn27P3cYJq8cHwsYc4W75dd0fxWJpjOkTbe+xg/f5UUVrGHdRcxZ3/rPQPQpj22xAq+FPWfqr1ZXQ8FJhDT33Ww1Q7lbusqBYYt+i/n3a+BJ7KPyh+m+6z4n5lwTSQFwpY39ZdcpNAmP5jI+G3jpJzd7CWGmcdesd8TKIbXktn9KvIf4PH4jJBZwxmUgDAJKQh0QNKNSGA/je2DjEXHlSk1ioebcMkxaFUxHod5voA69l6oBcD3V4i03alhjdAq1Woxj74iBuNeYf0XqCvZCFwiavdQznPfxLkGhFuVMlRFH786so80ocV1PL4phl0VM4qQjRToaCssnvB33kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by PH7PR11MB5916.namprd11.prod.outlook.com (2603:10b6:510:13d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.18; Mon, 24 Feb
 2025 18:10:39 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2%7]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 18:10:38 +0000
Date: Mon, 24 Feb 2025 10:10:36 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v10 4/8] drm/xe/eustall: Add support to read() and poll()
 EU stall data
Message-ID: <Z7y2HIweXCyQEkQ5@intel.com>
References: <cover.1739906138.git.harish.chegondi@intel.com>
 <c55e994b413f069b4ffb60cd30e749caf3bb7223.1739906138.git.harish.chegondi@intel.com>
 <85tt8pol5z.wl-ashutosh.dixit@intel.com>
 <Z7Y0V0ArAEaTerzj@intel.com>
 <85pljdnlnu.wl-ashutosh.dixit@intel.com>
 <85o6ywo0l9.wl-ashutosh.dixit@intel.com>
 <85msego04t.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <85msego04t.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR13CA0077.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::22) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|PH7PR11MB5916:EE_
X-MS-Office365-Filtering-Correlation-Id: 75afbecb-0511-4e15-3375-08dd54fe8ab2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NXZ1T3E5R0VPYW1nWFNKZW1HSFZmNTV3aXAxRjkyazRKMHlzUlovSTVVamxa?=
 =?utf-8?B?NWlob1dVS0NBcHBpbVp0dERLOXBxbVlrTjJIWDRsZjdPYUh2WUJSTytFblNh?=
 =?utf-8?B?NURpMklEd0NGWGd3WWFkcEFGaU1XM2p5YnRKbGo0VEhoMDZmbFNjS0dVTzNl?=
 =?utf-8?B?STZEVUt6V2JjNWNqWjI2akVtMDNjUUx1cU4rUXJZcW5oRzN6OXl2MG91ZHZM?=
 =?utf-8?B?Z0VEUjVwZkgrV1RhRWxuekdQeUR4SHJGeDFSSDJVWHdxOEFzVHF1NTZEODZu?=
 =?utf-8?B?Z25kamtkT1QwMGI5ZjR2dW8yeE5uaWVJdk9udmlqS2pQU2MwU0YzOURzQmJo?=
 =?utf-8?B?OG1NTTBTWmEvVlZtelg0amw0OVNzbEV4S3IraXZuWWl6cEJvTU8xaVgycVJo?=
 =?utf-8?B?WWJ0dVpkZm53Qnl1MHhVRW82V2Q5UTBpZDVFd010Y3VJSWJYY3lmR3JqNGFw?=
 =?utf-8?B?QTExQUJ3Z2pwMnkva1Z1OVdmMkYyeUFSZWRaYWdBeUtoajV1ZWs5bmdqSFhz?=
 =?utf-8?B?WWNRSEpxU2JLZmtvY2NEbS9TTmZzRjFJSko0em5IL2E5d3d2RUFnZldYVnR6?=
 =?utf-8?B?aE5rd0ptbjNCQ3JUSndnazJ0RS9OSVVoUVA1QjA2QVByZi9JbTd5M3JyVXNm?=
 =?utf-8?B?YlBJREN2YzAzUHljM29qa1NFaVVEbU51ekVIYU1VMDlCM0tGRkl3YlIvQk80?=
 =?utf-8?B?T0dLS3dybURCV3VjMmE5N3VhWDR5YzJGWktGVnY0WTdVU0FNMEorUDBrMjlX?=
 =?utf-8?B?MmEzKzUrWisvUWxvbGtBaUM3TDNkQlMrdWMrTFJPUzFhOC8vTVFtQmpHRytp?=
 =?utf-8?B?VEdXalU1TVEzLzIvSXpvMHJHbjhETmxFQ1JXQUpJZEkveHN4d2I2TDFKQ2xq?=
 =?utf-8?B?bG1Wdzg2bVRTSjJKVnN6SEpZK04rZUIzZHdUOG5nejNXMU1INWFzYXZ4VWZz?=
 =?utf-8?B?M2lybzhYS1daSVlpUEtlbzhXWVdzUjQ0dXhmcmpRZXZOY3RuWFpSdmgyMGhx?=
 =?utf-8?B?OGczNDhOT1g2M0daRU50cWJEdTd1ODFNQkFZbWM3NThyVHNJTEIrZ3BXQjYv?=
 =?utf-8?B?RmlkSnFILzQ0cjBOZktqR2dTUFQxTU9FcG80MVlkMVEwT21iWlpYY3JDSmtM?=
 =?utf-8?B?aG80cWhNNEcyQzBuT1N2Wjd2cDdUc2JqQmphVDF2MGhUcTR4MHgrd0d5U0Ew?=
 =?utf-8?B?d1JzYWg0WUwyeFM2Y2hKYWFNZ1Q5K0pFcFRwYTgxZlBONE03VU1PTUhKcUEw?=
 =?utf-8?B?QU1RZzVrdGozTG9GZlJVci9jUkExbS91NlNsUnYyTS94ZGpZNk96MTZBRk9p?=
 =?utf-8?B?S0x0V1lrL0tPYk5jWU11eWUyNWk4Q2ZJbzFRSHNWeFBLMnZHNW9vNmpJLzdP?=
 =?utf-8?B?anZ0SWIyN0svZ0R1aWNmMUsrby8wZXNtK3FOT1A3cy9Wc1BVNnA4RXRhaklr?=
 =?utf-8?B?VzhiRm5ncE0za1Fwbi9HWFRiOVlBK0R2MkhDOTF0cXJwWnYwZi9QV3AxYjJ4?=
 =?utf-8?B?dUYwNCsrNDBoNDJZSHNsYWFUczB0anNkRTdQb3NXMENBUXUxVlNlb2VqUEh0?=
 =?utf-8?B?ckt3a0EvbmFBOCtPOVFPSnpNZ1BRZGd0SU1rRjQ5QTBzVzYxZGRaNHZYOEtm?=
 =?utf-8?B?aGVmK1dLeDNiTzl3UFh3OEJVSzFycmU3KzVaVTJYQm9QbnUxVHBCUHVCSXh0?=
 =?utf-8?B?TkJrcXNXeE1Wa3psSW4xOHk5anpOZVdxd1Bha1lVa0U0VTlEK1F1aEMzQjMv?=
 =?utf-8?B?QVgyNGZNcGpOaGJZRkt1ajBUaDBUNXJlVkxXcGMvc0c1eUhVR25PUDBKYWt1?=
 =?utf-8?B?WXpzV0hxTTQyU28vNmwzaDZYRURZWHFESERNanphU3MwSXVTVHkzZ0o5TU8y?=
 =?utf-8?Q?kk4y/XgtK1FB5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nkc3amFSMVE1YUhhYzhzQmVhQTloS2FRNU1jeEZpRG9Cdm9telloNTBodjRJ?=
 =?utf-8?B?ZmlYRVpjYVU1eFNLSndyd1k5cWY1SnozMU9hMlZJN201U0pveHdRMkxlTmQz?=
 =?utf-8?B?eWxOc2x6aE5KY0FscjRRNndHUmpLWDNzY3RRUVA1T3pzZHpJbEZnN2tyeks1?=
 =?utf-8?B?cjR4c25uWnFYUU1vSmw4c29LdjBMQVpzNHdjTGRBb3NyZ3hDL2lObC83MWpj?=
 =?utf-8?B?RHQyWEtyWDJudUIzMVN5MjdRd1RJbE9zVU92NDZUTEdFd1h0Q1R1OVVsdUxR?=
 =?utf-8?B?b1NrMHlYb1JTTFFVQUNNd3NDc1Z6RVNHWW1meHFEU3VYZDdEZ2R6dTBneHd6?=
 =?utf-8?B?dWlRL1o4YnJndUN6UHdtaGpkVVFrdVRZRkRqcVk3bkRSUXRqTUZobTQ0dENl?=
 =?utf-8?B?c3BkdnpVa3ZzQm1SNURQYUo0ZEJOOXRiamhXNjdQZmlrSVh0aDlVckM4Kzln?=
 =?utf-8?B?MEQxd2M2ZUloOGMzWDdIaFNjQTZNcGpxSjJqdStPa0UvVXhodjRmRmdJRk8v?=
 =?utf-8?B?SXl0OXZrd3FoNUZUL0dtb3NSZG5QZlRHRzNBSnhLcVRPM1p5dXhNZGxMMkNG?=
 =?utf-8?B?WXIyL2p4MDZXamovanEvamRtUmRIYWZud081eDIxUWxXalNpSkU3TFVvT1l5?=
 =?utf-8?B?ZUJoV2l2c1Jtc25nODZuTGh2R1Jac0RpOFpVbkFydlRqbjhwVEVTZTZ4elBK?=
 =?utf-8?B?aDdoem40RGxaUk5jTStOOFZMUDdsYVJmUDhQcDNKWXRzaGVLR3NOUElLenNw?=
 =?utf-8?B?b1ZQbVZmZUNDa25JRmRFbEdsRlZSd0QrZVEwMnZJcXFpTHlhdmxVOFBuK0hx?=
 =?utf-8?B?NWVEMWJ0TzU1YkRQM1pHZGhleVB2SWszNDVQRElkNldsRG4vNHQ0aThsQWhJ?=
 =?utf-8?B?WndNYUJuT25rVUhLNkZTb2hwcUVodGwxcnduemNEOVFoSHpyMWQzUE1XaHEv?=
 =?utf-8?B?VmVWNUhMMytWdmptZWVnenVUYnFkY2ZzNzRjOUM1T2hoTDIwOVJhV3RQY0hr?=
 =?utf-8?B?VmEwUFRUeTB3UXJzYS9tcnVVUHdWSjRjU05BeXJ4dVkxTk9jei9KYm13b2kv?=
 =?utf-8?B?Uy9pSUtRdVBlV1g2cWxjVTlmaWtjUTU1Q29HdDNUcldNc3RpUjI4cE4rMFp3?=
 =?utf-8?B?ejk5YTEwNCt0Wk1UN3hrRnpRT2YzQ1crSmtyZDc5MEFXTkoyc0dYSjRvUEhK?=
 =?utf-8?B?aHFIbWt2YkczakFDekJ6ZjdiL3lMQ3BvOXVybFUxR1ViNFRyc2o4MnZTOUJ3?=
 =?utf-8?B?eEpnSkM2cnRJUkIyNzR2YWt4WTY5RmVBRXJuVEpJeXdXMi9pSVJZVmFGNWg2?=
 =?utf-8?B?SmRpYVpwVVpjQnNma1RKa1R3VVU2N2I0dm5MQmpSUG9sWkpqeUZjeUI0SGY1?=
 =?utf-8?B?RHBzMlFHRGszSEVGRXo0L3FqaW84NFFTZWtSZTR6WTVYaHJEOTFjb3VOVmVk?=
 =?utf-8?B?cnlNaEdaa1RBSk0rNmd1MVRWSjE4QjFzYmlsejJhUis3dXp5SncwaWpIUGwy?=
 =?utf-8?B?YWtTckZKbzFvdGtCT3dBakhqbVFFdnVFbkZDMkhneWZ0MXpWNjRCVVl6aHRG?=
 =?utf-8?B?dXB1U1FvOFZqVVpUb0xZWUh5c0JXbmUxdC8xd1lWb0MySzZjMHU4TndUenNj?=
 =?utf-8?B?MElUR0NTYmw0dHZNZGR6RWExU1Y1K2R5K2cyOFlvTHdwUUgweVVpVW5VV2Uw?=
 =?utf-8?B?dzlWd0pTQVd0SDM0U1ExY1VPU2VwVXpvNjJaYUFRUzVFV3VIWDNkYWdVdUlI?=
 =?utf-8?B?Z0VucmxSNENCOUFWZVoxZkhzNXpWMHoyMUtFUWtSRGV0UXhNSjRpYjNiclo2?=
 =?utf-8?B?aXlVbzFWSE9HNnpsS3BrMmpJNlNLOS9HM0ZTcUw3K2E3UXkzcHkvQnlubytM?=
 =?utf-8?B?UFEzYlRjanBscVpBVDZqODBWZXJUTEhpZndINU16MUYrU3RmL2lVNTkwMXB6?=
 =?utf-8?B?bEpSVGVsb1FFUVkvTTNQalRnRVZYUThmMk1GRHFNZk1hZnVFaTM2UHV6OXQv?=
 =?utf-8?B?OHlJS01YUE1NMDZiV3pVcXlHZnhTaGR6Yk50S0ZOTnVIRlltbW50SW5aV05F?=
 =?utf-8?B?aGVoNVJUTVlEUllVS2JtTmZCL2ZzSTIrWVJiQmlYcDN4eE9aY1dPWkRZYzVI?=
 =?utf-8?B?ckVRSUJBSkxjdWtSOTlRZVIydXFMREt6QytFb25CSHBZYktMYWdJa1F2M2k5?=
 =?utf-8?B?MkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 75afbecb-0511-4e15-3375-08dd54fe8ab2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 18:10:38.3554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 630O25Qq/uEwpmoraSMGd9XJfGNzgK9BkHiB14QcvLSidqD48klQyere3Dl70rpyTL/XBfyKKjIDRSqpEMa8H/nkRdk/7880jBoFW/M9ndk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5916
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

On Thu, Feb 20, 2025 at 12:02:26PM -0800, Dixit, Ashutosh wrote:
> On Thu, 20 Feb 2025 11:52:34 -0800, Dixit, Ashutosh wrote:
> >
> > On Wed, 19 Feb 2025 23:02:45 -0800, Dixit, Ashutosh wrote:
> > >
> > > On Wed, 19 Feb 2025 11:43:19 -0800, Harish Chegondi wrote:
> > > >
> > >
> > > Hi Harish,
> > >
> > > > On Wed, Feb 19, 2025 at 10:15:52AM -0800, Dixit, Ashutosh wrote:
> > > > Hi Ashutosh,
> > > >
> > > > > On Tue, 18 Feb 2025 11:53:54 -0800, Harish Chegondi wrote:
> > > > > >
> > > > > > @@ -39,7 +40,9 @@ struct per_xecore_buf {
> > > > > >  };
> > > > > >
> > > > > >  struct xe_eu_stall_data_stream {
> > > > > > +	bool pollin;
> > > > > >	bool enabled;
> > > > > > +	wait_queue_head_t poll_wq;
> > > > > >	size_t data_record_size;
> > > > > >	size_t per_xecore_buf_size;
> > > > > >	unsigned int wait_num_reports;
> > > > > > @@ -47,7 +50,11 @@ struct xe_eu_stall_data_stream {
> > > > > >
> > > > > >	struct xe_gt *gt;
> > > > > >	struct xe_bo *bo;
> > > > > > +	/* Lock to protect xecore_buf */
> > > > > > +	struct mutex buf_lock;
> > > > >
> > > > > Why do we need this new lock? I thought we would just be able to use
> > > > > gt->eu_stall->stream_lock? stream_lock is already taken for read(), so we
> > > > > just need to take it for eu_stall_data_buf_poll()?
> > > >
> > > > I started off with using the gt->eu_stall->stream_lock. But I have seen
> > > > warnings in the dmesg log while testing indicating possible circular
> > > > locking dependency leading to a deadlock. Maybe I can spend more time
> > > > later to investigate further and eliminate the possible circular locking
> > > > dependency. But for now, I decided to use a new lock to eliminate the
> > > > per subslice lock. Here is the dmesg log that I saved from my testing to
> > > > investigate later.
> > > >
> > > > [17606.848776] ======================================================
> > > > [17606.848781] WARNING: possible circular locking dependency detected
> > > > [17606.848786] 6.13.0-upstream #3 Not tainted
> > > > [17606.848791] ------------------------------------------------------
> > > > [17606.848796] xe_eu_stall/21899 is trying to acquire lock:
> > > > [17606.848801] ffff88810daad948 ((wq_completion)xe_eu_stall){+.+.}-{0:0}, at: touch_wq_lockdep_map+0x21/0x80
> > > > [17606.848822]
> > > >                but task is already holding lock:
> > > > [17606.848827] ffff88810d0786a8 (&gt->eu_stall->stream_lock){+.+.}-{4:4}, at: xe_eu_stall_stream_close+0x27/0x70 [xe]
> > > > [17606.848903]
> > > >                which lock already depends on the new lock.
> > > >
> > > > [17606.848909]
> > > >                the existing dependency chain (in reverse order) is:
> > > > [17606.848915]
> > > >                -> #2 (&gt->eu_stall->stream_lock){+.+.}-{4:4}:
> > > > [17606.848915]
> > > >                -> #2 (&gt->eu_stall->stream_lock){+.+.}-{4:4}:
> > > > [17606.848925]        __mutex_lock+0xb4/0xeb0
> > > > [17606.848934]        eu_stall_data_buf_poll+0x42/0x180 [xe]
> > > > [17606.848989]        eu_stall_data_buf_poll_work_fn+0x15/0x60 [xe]
> > > > [17606.849042]        process_one_work+0x207/0x640
> > > > [17606.849051]        worker_thread+0x18c/0x330
> > > > [17606.849058]        kthread+0xeb/0x120
> > > > [17606.849065]        ret_from_fork+0x2c/0x50
> > > > [17606.849073]        ret_from_fork_asm+0x1a/0x30
> > > > [17606.849081]
> > > >                -> #1 ((work_completion)(&(&stream->buf_poll_work)->work)){+.+.}-{0:0}:
> > > > [17606.849092]        process_one_work+0x1e3/0x640
> > > > [17606.849100]        worker_thread+0x18c/0x330
> > > > [17606.849107]        kthread+0xeb/0x120
> > > > [17606.849113]        ret_from_fork+0x2c/0x50
> > > > [17606.849120]        ret_from_fork_asm+0x1a/0x30
> > > > [17606.849126]
> > > >                -> #0 ((wq_completion)xe_eu_stall){+.+.}-{0:0}:
> > > > [17606.849134]        __lock_acquire+0x167c/0x27d0
> > > > [17606.849141]        lock_acquire+0xd5/0x300
> > > > [17606.849148]        touch_wq_lockdep_map+0x36/0x80
> > > > [17606.849155]        __flush_workqueue+0x7e/0x4a0
> > > > [17606.849163]        drain_workqueue+0x92/0x130
> > > > [17606.849170]        destroy_workqueue+0x55/0x380
> > > > [17606.849177]        xe_eu_stall_data_buf_destroy+0x11/0x50 [xe]
> > > > [17606.849220]        xe_eu_stall_stream_close+0x37/0x70 [xe]
> > > > [17606.849259]        __fput+0xed/0x2b0
> > > > [17606.849264]        __x64_sys_close+0x37/0x80
> > > > [17606.849271]        do_syscall_64+0x68/0x140
> > > > [17606.849276]        entry_SYSCALL_64_after_hwframe+0x76/0x7e
> > > > [17606.849286]
> > > >                other info that might help us debug this:
> > > >
> > > > [17606.849294] Chain exists of:
> > > >                  (wq_completion)xe_eu_stall --> (work_completion)(&(&stream->buf_poll_work)->work) --> &gt->eu_stall->stream_lock
> > > >
> > > > [17606.849312]  Possible unsafe locking scenario:
> > > >
> > > > [17606.849318]        CPU0                    CPU1
> > > > [17606.849323]        ----                    ----
> > > > [17606.849328]   lock(&gt->eu_stall->stream_lock);
> > > > [17606.849334]                                lock((work_completion)(&(&stream->buf_poll_work)->work));
> > > > [17606.849344]                                lock(&gt->eu_stall->stream_lock);
> > > > [17606.849352]   lock((wq_completion)xe_eu_stall);
> > > > [17606.849359]
> > > >                 *** DEADLOCK ***
> > > >
> > > > [17606.849365] 1 lock held by xe_eu_stall/21899:
> > > > [17606.849371]  #0: ffff88810d0786a8 (&gt->eu_stall->stream_lock){+.+.}-{4:4}, at: xe_eu_stall_stream_close+0x27/0x70 [xe]
> > > > [17606.849430]
> > > >                stack backtrace:
> > > > [17606.849435] CPU: 3 UID: 0 PID: 21899 Comm: xe_eu_stall Not tainted 6.13.0-upstream #3
> > > > [17606.849445] Hardware name: Intel Corporation Lunar Lake Client Platform/LNL-M LP5 RVP1, BIOS LNLMFWI1.R00.3220.D89.2407012051 07/01/2024
> > > > [17606.849457] Call Trace:
> > > > [17606.849461]  <TASK>
> > > > [17606.849465]  dump_stack_lvl+0x82/0xd0
> > > > [17606.849473]  print_circular_bug+0x2d2/0x410
> > > > [17606.849473]  print_circular_bug+0x2d2/0x410
> > > > [17606.849482]  check_noncircular+0x15d/0x180
> > > > [17606.849492]  __lock_acquire+0x167c/0x27d0
> > > > [17606.849500]  lock_acquire+0xd5/0x300
> > > > [17606.849507]  ? touch_wq_lockdep_map+0x21/0x80
> > > > [17606.849515]  ? lockdep_init_map_type+0x4b/0x260
> > > > [17606.849522]  ? touch_wq_lockdep_map+0x21/0x80
> > > > [17606.849529]  touch_wq_lockdep_map+0x36/0x80
> > > > [17606.849536]  ? touch_wq_lockdep_map+0x21/0x80
> > > > [17606.849544]  __flush_workqueue+0x7e/0x4a0
> > > > [17606.849551]  ? find_held_lock+0x2b/0x80
> > > > [17606.849561]  drain_workqueue+0x92/0x130
> > > > [17606.849569]  destroy_workqueue+0x55/0x380
> > > > [17606.849577]  xe_eu_stall_data_buf_destroy+0x11/0x50 [xe]
> > > > [17606.849627]  xe_eu_stall_stream_close+0x37/0x70 [xe]
> > > > [17606.849678]  __fput+0xed/0x2b0
> > > > [17606.849683]  __x64_sys_close+0x37/0x80
> > > > [17606.849691]  do_syscall_64+0x68/0x140
> > > > [17606.849698]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> > > > [17606.849706] RIP: 0033:0x7fdc81b14f67
> > > > [17606.849712] Code: ff e8 0d 16 02 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 f3 0f 1e fa 64 8b 04 25 18 00 00 00 85 c0 75 10 b8 03 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 41 c3 48 83 ec 18 89 7c 24 0c e8 73 ba f7 ff
> > > > [17606.849728] RSP: 002b:00007fffd2bd7e58 EFLAGS: 00000246 ORIG_RAX: 0000000000000003
> > > > [17606.849738] RAX: ffffffffffffffda RBX: 0000559f7fa08100 RCX: 00007fdc81b14f67
> > > > [17606.849746] RDX: 0000000000000000 RSI: 0000000000006901 RDI: 0000000000000004
> > > > [17606.849754] RBP: 00007fdc7d40bc90 R08: 0000000000000000 R09: 000000007fffffff
> > > > [17606.849762] R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
> > > > [17606.849770] R13: 0000000000000000 R14: 0000000000000001 R15: 0000000000000000
> > > > [17606.849783]  </TASK>
> > >
> > > Could you try out this change in your patch (also just use
> > > gt->eu_stall->stream_lock, not stream->buf_lock) and see if it resolves
> > > this issue:
> > >
> > >	@@ -573,7 +573,6 @@ static void xe_eu_stall_stream_free(struct xe_eu_stall_data_stream *stream)
> > >
> > >	 static void xe_eu_stall_data_buf_destroy(struct xe_eu_stall_data_stream *stream)
> > >	 {
> > >	-       destroy_workqueue(stream->buf_poll_wq);
> > >		xe_bo_unpin_map_no_vm(stream->bo);
> > >		kfree(stream->xecore_buf);
> > >	 }
> > >	@@ -829,6 +828,8 @@ static int xe_eu_stall_stream_close(struct inode *inode, struct file *file)
> > >		xe_eu_stall_stream_free(stream);
> > >		mutex_unlock(&gt->eu_stall->stream_lock);
> > >
> > >	+       destroy_workqueue(stream->buf_poll_wq);
> > >	+
> > >		return 0;
> > >	 }
> > >
> > > Basically move destroy_workqueue outside gt->eu_stall->stream_lock.
> > >
> > > I will look more into this. But from the above trace it looks like the
> > > issue of lock order between two locks in different code paths. The two
> > > locks are stream_lock and something let's call wq_lock (associated with the
> > > workqueue or the work item).
> > >
> > > So this is what we see about the order of these two locks in these
> > > instances in the code (assuming we are only using stream_lock):
> > >
> > > 1. eu_stall_data_buf_poll_work_fn: wq_lock is taken first followed by
> > >    stream_lock inside eu_stall_data_buf_poll.
> > >
> > > 2. xe_eu_stall_disable_locked: stream_lock is taken first followed by
> > >    wq_lock when we do cancel_delayed_work_sync (if at all)
> > >
> > > 3. xe_eu_stall_stream_close: stream_lock is taken first followed by wq_lock
> > >    when we do destroy_workqueue.
> > >
> > > So looks like lockdep is complaining about the lock order reversal between
> > > 1. and 3. above. I am not sure if the order reversal between 1. and 2. is a
> > > problem or not (if lockdep complains about this or not). If it is, we could
> > > try moving cancel_delayed_work_sync also outside stream_lock. But we
> > > haven't seen a trace for the second case yet.
> > >
> > > So anyway, the first thing to try is the patch above and see if it fixes
> > > this issue.
> > >
> > > Another idea would be to move buf_poll_wq into gt->eu_stall (rather than
> > > the stream), so it does not have to be destroyed when the stream fd is
> > > closed.
> >
> > So I decided to do a quick POC to see if my suggestion above to get rid of
> > the circular locking dependency worked. And basically it does, with the
> > patch below (we have to ensure stream doesn't get freed and I haven't
> > deleted buf_lock), but you will get the idea. I reproduced the issue with
> > your kernel patches and IGT and made sure the patch below fixes it. So
> > buf_lock is not needed.
> >
> > So with the patch below the circular locking dependency is gone. So let's
> > go with something like this, if you agree:
> >
> > diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
> > index b94585bdf91c6..a3fc424b36665 100644
> > --- a/drivers/gpu/drm/xe/xe_eu_stall.c
> > +++ b/drivers/gpu/drm/xe/xe_eu_stall.c
> > @@ -365,7 +365,7 @@ static bool eu_stall_data_buf_poll(struct xe_eu_stall_data_stream *stream)
> >	u16 group, instance;
> >	unsigned int xecore;
> >
> > -	mutex_lock(&stream->buf_lock);
> > +	mutex_lock(&gt->eu_stall->stream_lock);
> >	for_each_dss_steering(xecore, gt, group, instance) {
> >		xecore_buf = &stream->xecore_buf[xecore];
> >		read_ptr = xecore_buf->read;
> > @@ -383,7 +383,7 @@ static bool eu_stall_data_buf_poll(struct xe_eu_stall_data_stream *stream)
> >			set_bit(xecore, stream->data_drop.mask);
> >		xecore_buf->write = write_ptr;
> >	}
> > -	mutex_unlock(&stream->buf_lock);
> > +	mutex_unlock(&gt->eu_stall->stream_lock);
> >
> >	return min_data_present;
> >  }
> > @@ -503,14 +503,12 @@ static ssize_t xe_eu_stall_stream_read_locked(struct xe_eu_stall_data_stream *st
> >		stream->data_drop.reported_to_user = false;
> >	}
> >
> > -	mutex_lock(&stream->buf_lock);
> >	for_each_dss_steering(xecore, gt, group, instance) {
> >		ret = xe_eu_stall_data_buf_read(stream, buf, count, &total_size,
> >						gt, group, instance, xecore);
> >		if (ret || count == total_size)
> >			break;
> >	}
> > -	mutex_unlock(&stream->buf_lock);
> >	return total_size ?: (ret ?: -EAGAIN);
> >  }
> >
> > @@ -573,7 +571,6 @@ static void xe_eu_stall_stream_free(struct xe_eu_stall_data_stream *stream)
> >
> >  static void xe_eu_stall_data_buf_destroy(struct xe_eu_stall_data_stream *stream)
> >  {
> > -	destroy_workqueue(stream->buf_poll_wq);
> >	xe_bo_unpin_map_no_vm(stream->bo);
> >	kfree(stream->xecore_buf);
> >  }
> > @@ -826,9 +823,12 @@ static int xe_eu_stall_stream_close(struct inode *inode, struct file *file)
> >	mutex_lock(&gt->eu_stall->stream_lock);
> >	xe_eu_stall_disable_locked(stream);
> >	xe_eu_stall_data_buf_destroy(stream);
> > -	xe_eu_stall_stream_free(stream);
> > +	gt->eu_stall->stream = NULL;
> >	mutex_unlock(&gt->eu_stall->stream_lock);
> >
> > +	destroy_workqueue(stream->buf_poll_wq);
> > +	kfree(stream);
> > +
> >	return 0;
> >  }
> 
> Maybe, as suggested above, move buf_poll_wq into gt->eu_stall (rather than
> the stream), so it does not have to be destroyed when the stream fd is
> closed. That way we can just call xe_eu_stall_stream_free() from
> xe_eu_stall_stream_close().
> 
> And we'll alloc the workqueue in xe_eu_stall_init() and destroy it in
> xe_eu_stall_fini(). This will minimize the changes.

If the workqueue is allocated in xe_eu_stall_init() and destroyed in
xe_eu_stall_fini(), there will be a EU stall workqueue even when EU
stall is not being used. Is that okay? I mean would an idle workqueue
consume any resources? Or would the code be more cleaner if we keep the
additional buf_lock?

Thank You
Harish.

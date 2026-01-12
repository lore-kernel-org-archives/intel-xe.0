Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F27D2503B
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jan 2026 07:05:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4165C10E00B;
	Mon, 12 Jan 2026 07:05:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ONv+TqQA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E329410E00B
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jan 2026 07:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768201531; x=1799737531;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AV33WHIFoBxMTBJhsOj5OgNU30p3QPdBJ3A7ZBktYE4=;
 b=ONv+TqQA3F1BCbtA/wpVlVEK9YzOO3ClyBK+UPyHV+xk039MSEGi9P2Z
 OHNGPKYxf2mWt8B8Wh5r6s04SLK6p04PUpsi1rcvhC/9zbr+1tidark4h
 sPniWcN8Gi9JQOB33eTq2xeETui2jzke/3M3c1sOu0kTaAL7D8moXIRRO
 CMf6iqLY0NMY5HxoNEehQIq1WlsfKWq8ZvBcLjRx0QWQ5ixKvIEqClkzU
 oK64BASmIOczr698SHFi42j3NPgkgVOk5jwdl+sWvTiqekQA2g3U6xpq9
 h585/yJAbKJLO5X8A1uYs4uBH0x7u9y+Bo6nuMJycn5snLsUahwLwGys/ w==;
X-CSE-ConnectionGUID: +RpZHpIgRQmjrqVbVK8k4A==
X-CSE-MsgGUID: COQsYMkcTDuJSzFMOGz71Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="73323272"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="73323272"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2026 23:05:26 -0800
X-CSE-ConnectionGUID: QjFq0jQQRr2RVMzkFckOvQ==
X-CSE-MsgGUID: LpxdT9GMQjWVCUtDFNXSMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="241548159"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2026 23:05:26 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 11 Jan 2026 23:05:25 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 11 Jan 2026 23:05:25 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.43) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 11 Jan 2026 23:05:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ao3n9bHVvi31LlWZkAh7aawx4MU9BKSyQVBs+YslD8H48jDSPUheWgLnSvrmx3ctgJAIuvnM6vVMn9NU7RbcH28272qlwOYe0GZpXNlNsSHmQTK26F6wTCa/pOL5fXNiSRtq4ZooevP+1+ztuK8+NEh3Uxiqc1isw1XDjhrDg71EOhSu9cTfflwVcKO++/fe3doNXCi8seZe7pkD7ou2NUzO3fSG9Qvx90ARyeDUZjFiyPHJSiktAQ2Cc2abDNFGVDiqM0c46iIiUabr3hMWQGmAD0PpTZOFjJp66mhX6CsKCxQvmIAyeDuIgRYdnEspP+sIfVB0MNwLV3egyWZHQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q5nDI7GAespEfa63ptDhrU9u9XcYX2s+D/dV7mDmOMQ=;
 b=m3jtSWdzZ6jbwgxa5Pa3JI9XqOUm+qgDqQTtiK4PPgGxth0qoQ3+PkFabi0W0WVJagLbgn+4Ng2keY6BIKZEG8Pg74x4oaZBdGiLWyhofMBCtOCIksdRVKvZgAn/res2h4uob6nazCqkkuCqnaRo7EkMAoKChjNL0Y7hTPKCSvB5OjXwqXoSlOhdCL4yh1Ul/FjjKyJBQ0rX8boUhNi9AlnhWAh40woRfLp8vrX9loAyUXdjkZiQuIU8JKA4TbqwTzfdiL7r3nCJHWLp0jbAGQYxj2iCzrjAgkamwhN1rBfZgtjuhFHH5QqP+EzP8WMTavw0Y1bB8n++fnEUmq1oPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by SA2PR11MB4939.namprd11.prod.outlook.com (2603:10b6:806:115::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 07:05:23 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%4]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 07:05:23 +0000
Message-ID: <40fb0473-719d-4258-a976-9de376255799@intel.com>
Date: Mon, 12 Jan 2026 12:35:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] drm/xe/hwmon: Expose GPU pcie temperature
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <rodrigo.vivi@intel.com>
References: <20260109201644.736483-1-karthik.poosa@intel.com>
 <20260109201644.736483-4-karthik.poosa@intel.com>
 <aWI0YuShzGJ5nfmu@black.igk.intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <aWI0YuShzGJ5nfmu@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0058.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b8::12) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|SA2PR11MB4939:EE_
X-MS-Office365-Filtering-Correlation-Id: a1eddb20-bb8c-40d9-ab0b-08de51a8f484
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q00yamlwK2t2WE5CMmFpd3dTOXNMQm42WUtDOUxnd2IxeXBUQkxNT0VHTjA1?=
 =?utf-8?B?WXA4MWp5MGhNQ0RYaTBlYmRIWHcxb0o5RFBmbDVvdXIwU212MTZNOTRuemkv?=
 =?utf-8?B?d3JxU0U3UE1Vcjd5STNVcUYyTjB6cGJxT0dnQVlNOHdZSk0zNm4yQkpjV1B3?=
 =?utf-8?B?Q3doODNpbjYvcnE1QlJRazZQcEdUR0kydUpYT0RYUUZwa0huTDlTSTNDMkJx?=
 =?utf-8?B?Z2drRTFudkYzN1JHeitpaVllVzFURjlZUG1sVXhVTnhpYnNsLzh4M2JNYVA2?=
 =?utf-8?B?Ty9kQnZLSS9KS1EwUFIvN2Q4LzlHRHZzbjcremlVTCtBNHpqc2JMdUgvWWY4?=
 =?utf-8?B?UWJvUWt2Sk11c0IwWDVaTjFYR0lXUzdGdTBXUE5VeG03UTBGTDVNMjFsOGhv?=
 =?utf-8?B?UzdscFpCVjJlLzJsdGRTcXBUcW5nRldtalc4NndleGlKb0M4V01RaUxiaGlC?=
 =?utf-8?B?dlo4OUd3VVg3MXFaRjlaTkpCRVR2OHRodXBYVTkyU0g4VVhDMmJ1WldUMVc0?=
 =?utf-8?B?Mm11aFhCRGt6SVE4OGlxbEljclBSMGlXNkRQaUZheklUVDg1WnkydzlXeFYw?=
 =?utf-8?B?VXh3RllTWmNySjMwb0FXajhmNzhlVnVsM3hISGNFL3hoOVJhZGZmbGlEMkg0?=
 =?utf-8?B?S3J3STA5TkY2Z1BmYStqRGhqSEkyTVU3bFE0NVlacVdxYUxOUUhqK3o2bE5S?=
 =?utf-8?B?a1F4cUk5WjVkRUw2bnZBaDNicWR6OEZUWFBiUTlKMTdDMEQyNWxWbm9LZXBt?=
 =?utf-8?B?bUUwR1NidzM0UnprNDcwUmM0QXZzN2NoenlwTXhkZzFBT3hPV3F5eE5PM01y?=
 =?utf-8?B?Q3RSMi9DalBvNU5ZdlJOM2Vqc3BMNEdVZHc3Z0d3V0tLZEZMdUVGZHZxbUlw?=
 =?utf-8?B?Y1piMWJYb2VGbjJqa3dobGNBM0ZqVitkbW5hRzE1SkRod2p6bCtGQ2VuR2Nk?=
 =?utf-8?B?L09mSFZHbUk0WmIxQ25FakJzU1hzZlk0UG5qYkQ1NmVPemFKY3BldjRGSlNB?=
 =?utf-8?B?UzhnSnlQV0ZCU1p4dUs5NU1mMjhCRkloQzBreEFjZmhZUUlaNEtUUU9CcTZQ?=
 =?utf-8?B?ZnpCNW9nOEEwOWZwdTVBR1U5RGUzaUhDYVh4QjFKM3M4VzQ4SGRxK2tKMjcr?=
 =?utf-8?B?TUFjU1A3eXQ2R3owcGNNUDdIemloOVBjSGY4RklSSjhSUCszeFZ1SGZqekV3?=
 =?utf-8?B?bVEvMlJPL2NpbCsrYWdaSXdHZWJPbFA2eDFYOUd2ekdvYnl0azFKdllYNTMr?=
 =?utf-8?B?V2JLVUFjckN5WndhR1NFcThOc1F6Ynk0dDRjOW03VTlFMEF5Y2RiemNvMS9F?=
 =?utf-8?B?NHo1Rk0vbUZXdi9WZUpvUGNZSTVBTFF4eG10cG5tdkpRWUo5MHNaVFVKZ2Nv?=
 =?utf-8?B?YmpodmI5WkR5cjg4amY3NnZYOUswc1BQbDcyaE1mdHpPeEh5MlRaMElMSlMy?=
 =?utf-8?B?ZEsyWFpsUFFHSWJ2cGhaTmtHblp4MThpTXlzZk4yOHppcmNoMFlySmxiYnN3?=
 =?utf-8?B?Qytkc3YyRUV1STI4RXJUTnduTFZjY0lUUGczS1FpcUkwYzJoKzZGS2xGeXNU?=
 =?utf-8?B?WHhNR3ZGcy91SXBJVnVGNVpGdW5kVW8yZ21kanNnSEd5KzBKenBIWjVUc0FL?=
 =?utf-8?B?Zm1kUUVNcnAzdXBFZnpMREU1cHM2ZWgwU3I1c3VlY3hpbW1TQ1FhdjE5cE0v?=
 =?utf-8?B?MFAranlXUTU5Ukw5WEsxbG9JTE9sVlBFdlNYVHpkZUFkN3c0RHk1dFBDV0Nm?=
 =?utf-8?B?dmhURkJXRTdGOG5VRjhjWlRTRVl2UVU2c1g4T3FmTGdFaU5yZ2xmbFM3WVFQ?=
 =?utf-8?B?aVBVNlBwVllyYkdNTDZtTEw4R2YxMUZQbEJxRFZlRnMxQXNDMHh3bFRpaE1u?=
 =?utf-8?B?WVRqWjFkZGQvbVJ3eTNzczdmQWlVSnkvTWc4a2VIRzhMeGtuMWpkT2FOcTVv?=
 =?utf-8?Q?4OEhB/ntAER41WnRIlW5gHRpYEK3xbLB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2JNU3d1cnduVXNHS0FlSk1jVGdjd081VFkrUjRnVXNJNldsQlYrZWRvdlhp?=
 =?utf-8?B?cFdES0FIMXVMdTQ2MjRjN2VndUg1Wjl0Q0tzY0RvQ2lkS29NYlRyUWdVV2NR?=
 =?utf-8?B?OEc5U3R1cDBQN3pxWnAvMmlGTjdiOXZuVFEvSVZKc09UcG54M2FVRkVjSkpQ?=
 =?utf-8?B?RmhxSzcxNU9TQTAzV3luT3NZWktpbUJid1c1Z2FCU3RELzYvMnF6ejRDTUNn?=
 =?utf-8?B?aFd1Qm1qT1FHdmtGemxJL2xHVlkzUGVsUTZpL202OGhCbGhYZkQ2ZW1EQTRm?=
 =?utf-8?B?dzRVeWY4UTd3ZWlBVjhESHZvTlV3Ty9qYlhlcVlNdStlZk5kTSs2dmQ3MzVC?=
 =?utf-8?B?T2oxb051VFQzUDQyNytoTzExNlM5bWY2T2FUTisxR0VORmN5M0h5TVNEME9J?=
 =?utf-8?B?ZllVYnM1Um1YRXFjQm1QUGZKSG00akVYUlVqWStLOUlPUXhQZy9xMFVpLzVG?=
 =?utf-8?B?ZHdheksrZzZQSUcxNE5xWTlVcVdKWDRGbUZXTUZCbTFJUFBtZ0NXUXBabGlT?=
 =?utf-8?B?dXlTQk12OUtob0x6VXdoZjgwNTFiZ3Z5WUJ4NkpFeXlIZXFLdG9ML2hCU080?=
 =?utf-8?B?b01UZ1hFbzhmQUhEdUVTVDdzazZjVC85KzZxbThpaXJEM0IyU1ZHdTJRS2dh?=
 =?utf-8?B?ZkY4TnVXWVpsOTdLM0xJRlh6bk16N1haVkRUTW8ycWtzdHppWnZ2R0J4YWJK?=
 =?utf-8?B?UXFFbzZlUGJaOUpIWHNlQkdoNklna0xQVDgrS0M0NjlXQWNWZFRBR2NiZVpt?=
 =?utf-8?B?MjV2K0ROOXYwRml0eWhaMURtWXg3d2NUNStZbVFyMzd4SVRydWRLeHF1RFhZ?=
 =?utf-8?B?c1h0R3lTZ0lJZE9vYTE2NU9tRTFwOHM1cXBVczAvV0xuTE9GT2pqVUV6M1dk?=
 =?utf-8?B?YkprZWdvaTA2N0JrclY1N0ZqTS9qVXpSN3dqUFkvL3R5a2svZkJtZjVuUFVl?=
 =?utf-8?B?SS9seWxNTlJ1UkpyeldUeGRPMnRKWDFvRkliV0IzSmhqVk8wd2cyejZ0ZXB5?=
 =?utf-8?B?OXlCTXBzcG8yNm9Gb2Y4VW5nczRLVFM3OVFVR3pLa3EwNS9IOEx5MFBDNnRx?=
 =?utf-8?B?OTRSZTQ2dTZ0ak11Yk9udVg4Vm5TVEFmM2loTzhMaVFrdEFKRHRjM2VVUzdV?=
 =?utf-8?B?MDVwTjl1MSsvTDA2Y2d1cGFYaGI0aDR0Z2pmOGRpclAyL2pFU1djSDduSytU?=
 =?utf-8?B?VFhldmxKQm8zUGdZME1nZ3NhRSt2WU9xMUxxb2JoRXdmQmxZYkZZaXlpOGxM?=
 =?utf-8?B?Z3YyMTZsekdPMTVMRlA4WTJaYjJJNldpWXNiZWpYelVXMEtlditaRUkwL2hD?=
 =?utf-8?B?blhPUVhMa2RuQ09EdDVhNXk4NHl2UzJQQzY1eUZ1aEwrV1FSUWRxWmVDVTdL?=
 =?utf-8?B?eERMbE00aS9iMVFMSGx2NlkxTEpudmpCQjVnTTFiMTlDUFhLUU9OemVNRFIz?=
 =?utf-8?B?cnFEVm14bEp1aytlSEIwVnN2N21meTJ2SXMrQ2VFaTFSN2gzbjZYY0F5VkdG?=
 =?utf-8?B?WWpFM09SYzdGWkJZRzJMWlhiSFlZajJFN0szS2FQS1lDRWJzdzhNSWV3YTFW?=
 =?utf-8?B?MEU5ekJuQWZTVExZUUFRYW9rZnd3ejZMSW5rU3JOYjVzVHRZend0ZVhyRUx4?=
 =?utf-8?B?Q09xQnU5aFVvM0xGc0RKc1hCM2pzRmFDUS9pcHpNQ0VmMER0YU1MdDRuZnpx?=
 =?utf-8?B?YWZhTUJWQWYwejVINWxBQVdOVW1VRTNaRHIvY2J4YkdDTEVWbmJEVnlBQ09D?=
 =?utf-8?B?dld6UElmd0loenJrYlpIS3BYRW5PTE5XcEZjbUI5NTJ6QmdTSjA3bThMcVhD?=
 =?utf-8?B?a1l6R054YlhTMHcvd0t4NEFJbDFRSTBNZi92RVNWZTRxN3I3aStGRXBhd0dm?=
 =?utf-8?B?V1NKdFEwK1oxcUNFcG5WRUcwdW5hMVRIOFcxQkVzM3RVNnM3ODRkWXd1VGQy?=
 =?utf-8?B?eHVNSTZTRVV6R2pKSTJSeEV6OXp0SHpMZFF5T205Z2REMWtBc1hJa0hqbENN?=
 =?utf-8?B?Z3ZyOUFsb01JMXY2S3ZtS2FtOGlYbFFFcXpIK25WYmg5cmwybmpKZy9pUFFm?=
 =?utf-8?B?NE4xTVJxQ0NYejcvL1hDVHRDR2ZPbDhxNENmbGRyRzhsUzgwUzQ4UUZoT0cv?=
 =?utf-8?B?amlrbFpHUDZ0ZXpMTFdCRWlMYUZJN2hhdGJiN1Y4dDRnTmtoblNnaC84aEpm?=
 =?utf-8?B?U3Zra1lCUlIreGRDN2h0V0ZHYktsRlQ0dmtSdGdGeFo4WlFkb05KWjNwU1ZM?=
 =?utf-8?B?NUpnYVpMSFZqMEdobzNGNGNmRHZvRG9TMDFUWXY5U2l1T2hGS0pDQXFoT1hq?=
 =?utf-8?B?aDdMTjdGN2ZqUGhjbmd2Y1d6UHhnTmpjam5iaER3Y0prK1Z5TmNWUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a1eddb20-bb8c-40d9-ab0b-08de51a8f484
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 07:05:23.5205 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: or0kOn7QdN0oLLhDOi3+/h43ZaOcYp9gk1DUIkski3s/2XqZpa4CU9tfsBr93ADUkgEZbYvQ+e3I1X1NfkcNMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4939
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


On 10-01-2026 16:43, Raag Jadav wrote:
> On Sat, Jan 10, 2026 at 01:46:43AM +0530, Karthik Poosa wrote:
>> Expose GPU PCIe average temperature and its limits via hwmon sysfs entry
> Please also use 'PCIe' with correct upper/lower case in patch subject.
>
> ...
PCIe is the right usage, changing it wherever needed.
>
>>   /* Index of memory controller in READ_THERMAL_DATA output */
>> -#define TEMP_INDEX_MCTRL	(2)
>> +#define TEMP_INDEX_MCTRL	2
> Unneeded churn. If you don't want braces, don't even introduce it in
> earlier patch.
Removing the parentheses in previous patch
>
>> +#define PCIE_SENSOR_GROUP_ID	0x2
> This is used as part of mailbox command ...
>
>> +#define PCIE_SENSOR_MASK	REG_GENMASK(31, 16)
> ... and these are output bitfields, so both should be in xe_pcode_api.h.
>
> ...
okay
>
>> +static int get_pcie_temp(struct xe_hwmon *hwmon, long *val)
>> +{
>> +	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>> +	int ret;
>> +	u32 data = 0;
> Use reverse xmas tree order.
ok
>
>> +	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA,
>> +						  PCIE_SENSOR_GROUP_ID), &data, NULL);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Sensor offset is different for G21 */
>> +	if (hwmon->xe->info.subplatform != XE_SUBPLATFORM_BATTLEMAGE_G21)
>> +		data = REG_FIELD_GET(PCIE_SENSOR_MASK, data);
>> +
>> +	data &= TEMP_MASK;
> Use REG_FIELD_GET() for consistency.
ok
>
>> +	*val = (s8)data * MILLIDEGREE_PER_DEGREE;
>> +
>> +	return 0;
>> +}
> Reviewed-by: Raag Jadav <raag.jadav@intel.com>

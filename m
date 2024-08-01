Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D81FEC3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 22:18:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FBB110E0DC;
	Thu,  1 Aug 2024 22:18:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RCaapVn6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AB9110E0DC
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Aug 2024 22:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722550695; x=1754086695;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=D8/wmQ2eMY4sz05J+st4C0yn7I+eNaQMzuuzgm+axEg=;
 b=RCaapVn6F0RgZvbHl5w7ICs3PlpTIWvxB5wxzVd2Y/N0VXarpUlSu650
 +Cbhu5CyJUFwnm9mWONKE8Lhd82aWm4IMDK62XnFZS4Lte5mXt+hfPXL4
 l9S6c8A1wS3oPO41p73DEKnmo2KFbZBKtDx0WKw9Vou7V2mM+tzgFBlR5
 86bpMRaW7uAUHK8CmpqrOB+PChP5cL3ixJZLC7tnAueeLaFf1TFXCwiPm
 hohFgFOvyVw+v4c7pnIirj31ZwTrWuHUQlxJ9Eutt5k8LGTTskA/j07VU
 SSeL3uxUeIkFQjsZ09kLqMFSXcXjpkPnW/omyg6Jezi7kFiNVv0oYZ+K9 w==;
X-CSE-ConnectionGUID: UxDVID41SyibMFx13yBtNw==
X-CSE-MsgGUID: Vr1y8lcQTrK72cpr7MlcIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="38051339"
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="38051339"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 15:18:15 -0700
X-CSE-ConnectionGUID: nFLktUvhQ4WGaaTFrDzCHg==
X-CSE-MsgGUID: hDOqHg7iSHCwLbSlO0F/Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="55138603"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Aug 2024 15:18:15 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 15:18:14 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 1 Aug 2024 15:18:14 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 1 Aug 2024 15:18:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bPUev+MqsGhKeitFay8O2bc5NaM7B7NtBrVPbN62EtbmrsWwrPUzugD2DKDW1dQJvwtu0VLle5NjtAnT6wKby2un8Xx3OlVJUDTfjXIjvE7jAkr+Yt8lD7K3+j5IYL/x4+fqUX/7MTTWTYJk2hJkKP6tSdJb11kyu0mNvBvUFJ3AhhfvuIznTKknlGalfCOQPWNQW5aa6iTPR3x7U9yhqFwOgyUWVd1rmBUF+WSGAnywTBE0D57Ob9Q21MTE3HhOv8ZivjlStVcBEegio3HVxE9dS/M3u9HrPY+sXFrrN55G6+BQOI318nok4da38nFOO9hbR9x5QzfPJnKXJSaCZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D8/wmQ2eMY4sz05J+st4C0yn7I+eNaQMzuuzgm+axEg=;
 b=djEa5jDDPGLgMSRkF+Cu24PstUAMF9K4nelaYSpIQ29OUGLWAIjIBHarzrr9Y4rslFLlS1piBjwEfe4J8cxmeFhtZ2o+nl+5fInOtzZgx/PgBV8P0ZbkHKBxUjflY3cq3FiLezxPuQ+l8I5xlg7L40+kDSLti9GxOgoYF+HWaN+7iKiQNtQ1RbdtroLACugOYekceHNd1RzMVzxdyKgGCPBJzwPym3xepQn51s/ipZXlA7eiGEateGjGG68V20r416VQUC2xCXTLOMeqPYYyztJNhbfloxU6F5ws0F75YCjPsStrOWj/gDL/xqYnnkenijJjwS53EfL/WSj+zdgAYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by MW3PR11MB4556.namprd11.prod.outlook.com (2603:10b6:303:5b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.32; Thu, 1 Aug
 2024 22:18:11 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0%5]) with mapi id 15.20.7828.021; Thu, 1 Aug 2024
 22:18:11 +0000
Message-ID: <1685c722-5da2-4195-a0ae-5d50fdcf43c1@intel.com>
Date: Thu, 1 Aug 2024 15:18:08 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] Revert "drm/xe/guc: Pre-release GuC firmware v70.24.0
 for LNL/BMG/PVC"
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20240801203341.3042386-1-julia.filipchuk@intel.com>
 <CH0PR11MB5444D0F6C383D3FC861FBE22E5B22@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <CH0PR11MB5444D0F6C383D3FC861FBE22E5B22@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::7) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|MW3PR11MB4556:EE_
X-MS-Office365-Filtering-Correlation-Id: addae7c9-afab-40ff-fd1b-08dcb277d470
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TWltVzlMQmx3RXFYQ0NYVFVLNk1KZTUzK2J5U2xsSUJXMW03WTFJZGMxYlk1?=
 =?utf-8?B?ZTN5ZktsVjIvSmVtTEVnTnhxL1Boa2xiVDkra1hrU0FWOW1UOGVoWTZoWlQw?=
 =?utf-8?B?dk11OEZMOUQwNERqOFVRWEg3eXBQUmczUW05a3QwMnRZNEZlQlA1RVV0WWh3?=
 =?utf-8?B?ZzNneHNaMmtKQ3VpRmFBT0x4cmp1eEtkc3JXSGU4Z09JZzNWSXI2YTZrZW5B?=
 =?utf-8?B?ZjBXUzRCQ2V5UE5Td0ZTZnBRNFZrQ0xDWXI0SWFaK2JWU1R1M3NkdEFoNkwy?=
 =?utf-8?B?cHhPUUpLay9WS3NpNWJsQ25jUEw3eElrM1N5eGUwMWh2WU1rWmxMMHhrK0Ft?=
 =?utf-8?B?ekRhN0FKMk9wNkxXRG8zUlVOY3dlM2F2c1A0dVBRNHZtejZiNDdpeWVSUUJ2?=
 =?utf-8?B?dFdFZml2RDlzbHJQWm1mTi8rVmwrdG54TWw3a1dNY0daVUJOcTZUSGlzeUIv?=
 =?utf-8?B?ZGgxVVFTSU5XbWFrQlUyTUxXT2xHR3ZUTHFpTzcyRHlTdmxCb1BGSGcrVXZW?=
 =?utf-8?B?VWgvcHJqdHRSUjg0VG5KSHR3K0JuampjSnFta0lkR3o3QzRzTmlwUWkvb2tK?=
 =?utf-8?B?VVB1Qmp6Ym5jTWRQcnZJeFcwNzBlODh5akpuT1k4ZkpyblE1N1dmaUY5Z2Q4?=
 =?utf-8?B?dFg4ZG9FTHpKRzhHSlQxMWRKYmZyK1ZrdW44dGYzd216VS9iOXpZbms3eXZy?=
 =?utf-8?B?Q2tGTlpVV2ZVclhwMkJNVXh6TDRrYjdiNjU2Y3BZRXd4UExMNjg2NUZMdTdN?=
 =?utf-8?B?Q20reS96VklmMm8wQ01XOVR2dFVyNDlBTmJxQWgyMnk1bWVtdXdaSWJ0MStu?=
 =?utf-8?B?L0NrV3l0N3BSaG04QUNGWVFpNnBCZDAyYThLaTNiRkRoek1HUzBzMTdSY3dE?=
 =?utf-8?B?bE1ublE0V0ZzN0srZW5HYW9JUDRVVUM4WXgrS2pTb1FJVW4xWkZ4aklzd2Jo?=
 =?utf-8?B?UGFsT3k2MThJU3M2ZVZiMm5ySnNZN0Z5Y2xpckFKNFBYc1paOUxGV0M3SFkr?=
 =?utf-8?B?T2Z6emlaWEMwWFpDQjBzclorL0hMV1JvZThJRy9Tc050YnRzZW5qVnFlRE5O?=
 =?utf-8?B?SnBkYTdGRkE2aVlHMlI0ME8yTUwyNWdjRWVVRzkwSG0zaEJVKzNhNDkwMWZC?=
 =?utf-8?B?WGZNTURSRktEZVlUR1Y5VW1neTVvUHhwa2pHZ1NkUmJXTXhhUzhQeFVHaUVz?=
 =?utf-8?B?S2h6dFBiRFRJV1FPYUorZVlqdDg2MzNqTzRsQ3hDYnJKcXZQajdzNVZlM0hJ?=
 =?utf-8?B?UjNwWVVvY28xbXNVQXpaMjZEYVFXbzZvdExJWjEwRGpNWTBkNC8vT0VRRENs?=
 =?utf-8?B?VGZjWGVZUGdTZ0M3V2lweW10NG1sMXlDcmdYa29vNElxYXZzZHV3N2k3b2Rk?=
 =?utf-8?B?NEFISG42WDdYSzBQc0RKM3NmMWxnaEdkZWk3SHhKZm9wTGVIRUx2TFNLSURK?=
 =?utf-8?B?YlZubmJhYlFZQ2NTNVZXZmRuSDBPQi84NlpuRHhUMVlrWWh1cVdIdEs1ckVR?=
 =?utf-8?B?WW9XZ2dNK2JnNThtZ0g2U0J3MU5KMHRvWnFhQmt2RFNDdVhJNG9Dd3ZHWmhv?=
 =?utf-8?B?Q3d6OWdBeG9LakkwVWhYN3crMkthNTFwZTZ6R3ZKNm81WXFkQ1h1ODVTeHVL?=
 =?utf-8?B?R2RmMnViZnpTdDdZVUpIQzZZbEZLVUYvbTg0TmtJOThOQndZekRXQ1ZlRmpz?=
 =?utf-8?B?UktIZDNhU0lzb1JOQ2V5RzRwLzg5Wk5iK2xGT2tBODg5U1lRaDZESFVtM0VG?=
 =?utf-8?B?ZVZmSmplWVNZcjNOcVh3WVRRb01tbnA5aThiaXdkVFVDbVZzZnhKWXpQdngv?=
 =?utf-8?B?WHdnR2xxbVQ1OU9oa1Z6Zz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aE1tYlJocDBMbVUvWTFIeTJnVUJnS21NUFFxL0RsUTRGRkdGT0VyMHFKWFU2?=
 =?utf-8?B?Ynk0LzArYkpUZ1IwNTFGSjNBODdvM01YQnpldXQxMjdjYXpKS2lKanFiOUJ0?=
 =?utf-8?B?VXQzNTNkU3lIaFJodXBydytWeVdOclRJR29FTi90QWpSV2s2cmNWdkNvY1NH?=
 =?utf-8?B?YTk0TyswODNnWWx0SjlpenYzMi9nNDBTNUMyQkQrU2tONi9odFJFYTA4YWpj?=
 =?utf-8?B?OEpGaFZRQXVGS0JNR1Azd0pDa2pMZmJVUGJVTFA4UlJrckgxOTEyK0djWUQv?=
 =?utf-8?B?WHRRUWx5eW05OXhYc2xEOGJlUDVibVVWMktEQVVMMUdKVkxPR3o4Ny9GU2RV?=
 =?utf-8?B?Ym4yYTBmbTV6cUdkd3JnejZYK0dYTlJ6Y0hLTlJyMWZ0QWY3RXZxWmw2eW9D?=
 =?utf-8?B?TFFwcHZVZHRWelNHVWo5REplL05JdGVGN2gvZk1UT2RybWl0dmFmMGg1R3Jn?=
 =?utf-8?B?THFra3U3NEhOeEJYVDd3TStQb25GVk5IOGZRM0k3cEZxQlp4VkJOd1FYL2Jx?=
 =?utf-8?B?MXZLYkdmdVRVSW53Y1ArZnBvamRqQUJla0UzKy9CakxISTRDUGthQkc3aG51?=
 =?utf-8?B?NWIvNjF4bml0TW5pWk5uZUllekVzR3ljY2YyWkFrTEEyaUhSL24zbU9QUUdU?=
 =?utf-8?B?MzhFaHhiT0FTTWV0Zi9CWTE4aE1QMXZVSmg0QURiL3g0MkFnNTByNFFLMHd3?=
 =?utf-8?B?amd5MUtCZjZlQjcxK0RWVzhEOWZFYmNQKzZ3ZFUzODVZR3BWSDRwUUFwbVZk?=
 =?utf-8?B?L1VURWVVTTNnVW1nZ3pBZzh1STd1SlBsTkFKT1I5YVB1cUNnY1g5RGRYakk0?=
 =?utf-8?B?UXlMZWFoc3liT1ZYbmVhYml3R3EwQUZ6L0JuV3h0Uk5WaS9BaU9ya3JrdGpO?=
 =?utf-8?B?SzBPbGNzR1ZOelV4OU5KU2k2dDZCalM3VUtNdldEZ2ZmeTZrR3VJL2NDZHY4?=
 =?utf-8?B?Zi90TXRBODRUSVJmN2RKbGdlWGx1SFdwcUk2MVB4T2RPMWFVMzErMmd3NXJE?=
 =?utf-8?B?T0IyZlZmWjZrL3dOamJvL2FRMWlGNWZHb0dkQmtUTjB1Uzh4WDg5SG9VTGpI?=
 =?utf-8?B?Z3AyVktPL0xzL2dFQmVQVjNWcSsvR2N0Y2FwVWpHNlVGK0tTTCtQRnRPNWl0?=
 =?utf-8?B?eWNQTEtpSmFTSjBsN1E3WC9BVm5EMERyM3hJc3IrL3VCLzkwNzY4dzA2YkZz?=
 =?utf-8?B?em5RbnB5eTRiejhrZ0RMWGc3ZHM0My94bW83VzFKVGRZSktydElmNWQ4WTlD?=
 =?utf-8?B?bUpSRW81TDg4RjhWbENCWitiNDA3WUFCSTBiWW05aklWemhPUFdiWXdiMDN6?=
 =?utf-8?B?ZER5aXI4TTIwY2o0M3NMVFNJL3RhY0ZwZHN2Y3hnVGpCSmZzV1ltWmZTWnNa?=
 =?utf-8?B?ZU1QSS9KdDRSZVJGTC9NcW9NakU2U3RmeFhWeEsrQ003YklMM0l0S3pyRmdt?=
 =?utf-8?B?Ry9CTklDSnRnNDR1R1JYaDhMUWVWenpnaUNxSnpKdS9BdTVtcmZiRzNNcG1I?=
 =?utf-8?B?WVpRYlJDUjRrNW1yeVd3UUxBa0ZxeWNHdWRMemI5ZnI0RXF2R0tZWnV1Qmpq?=
 =?utf-8?B?NERlU2tYUTA2T1RvcWJ2SGhXbE41SXlDUkhMNld4RjNseHlpSzNDdlIyOUI1?=
 =?utf-8?B?bFA5RndVYUlqNjN4V0hFeDJCLzNPOWUzWS84SUJkaDFQRUQ0Q3VJb0FtWWFG?=
 =?utf-8?B?b2tWeHFnUk00aGxyT3UvblNCeUFSODBsQVVBdUZ2RUhsemxNV1dTTVZQVDZU?=
 =?utf-8?B?TmFNNzg5NExidHJQelNmT09LN1NjSGMrU2hFZ3R3MTl0R0cyZ3FIM0pKRElu?=
 =?utf-8?B?ci92cWRrcGFRZGlGM25LaGlZYTMvd2FlM1dnVTJDMG9rSi8wUmJlRk5WUUFH?=
 =?utf-8?B?NlI1Zlp6SE1CNGpyc3B6eDdGcENFQ3JGMU5uaEJNVWZsNEJTUUpycytoc1RV?=
 =?utf-8?B?dmxkRkgreG5lMmI0alBXM2pPdU9tdTFKYWVyVUgvajZpcUxFc3gxR0hiN1Mw?=
 =?utf-8?B?Qm0yZHNqR0M0ckRsckFGaS85OUdOeVJPamVFTXhsd1Z6K2JoKzBxM1dhU1VJ?=
 =?utf-8?B?dzdnaGVnRWZseC9YQXpMQWVUQlFRejM0TVBNaTBHaVp1dVR1dXZJTEtkUjdk?=
 =?utf-8?B?WklQQjBLUHBDYnMyMnR0b3lwM0RSNGZEYWxhaDJubnhiUlB1U2ZRNkI1WXow?=
 =?utf-8?B?ZHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: addae7c9-afab-40ff-fd1b-08dcb277d470
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 22:18:11.6491 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gCIq2m46DAlT4Gx9T2rXZGGXvd2ZZcSR3yssg0dytD95jYWraAidFGxlbuIUkM2UNr1fC7wxrecmCpNkf1c2F0Yf4/z/+TQo+u1Ama80Xx0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4556
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

On 8/1/2024 1:43 PM, Cavitt, Jonathan wrote:
> Also, may I ask why this revert is needed?

This should create a cleaner merge lower into the drm-tip tree since the
drm-tip branch has changes merged for from the 'topic/xe-for-ci' and
this patch will by applied lower in the tree for upstream.

> ~/proj/drm-tip/drivers/gpu/drm/xe$ git log --oneline -10 origin/drm-tip
> acd846e309e2 (origin/drm-tip, drm-tip) drm-tip: 2024y-07m-30d-14h-17m-47s UTC integration manifest
> 9dda5c1164af Merge remote-tracking branch 'drm-xe/topic/xe-for-CI' into drm-tip
> 517168f6009b Merge remote-tracking branch 'drm-intel/topic/core-for-CI' into drm-tip
> 04dc9413c84e Merge remote-tracking branch 'drm-xe/drm-xe-next' into drm-tip


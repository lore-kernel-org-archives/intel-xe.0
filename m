Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB895C71136
	for <intel-xe@archiver.kernel.org>; Mon, 16 Jun 2025 18:47:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6925810E41A;
	Mon, 16 Jun 2025 18:47:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gbq1zOkS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC7F410E41A
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Jun 2025 18:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750099623; x=1781635623;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mPSIoyhAB6QOx3fv/E39c7vF1duJlj52SJ7xaVi3FxQ=;
 b=Gbq1zOkSnKPKu3uxqjy5GsMavHtO6L7ZkGwQeVIfwDRfD6+LRqrlwsCV
 5BSFkW9v9w+Xu1VHA4bCPtEJIDIESPF8E6Y+HwEzc7VC5yd0gDEcXL/sU
 PNhdbacb4msEqxmpSy5NGpvw8zbw4YsILLBC2EaIjcWP1+qvp1t5Tzb+z
 wzZ8o6aUoPBcdOlK6sbosp3hF+uogyglIcKsiCghWW5zE4Xz2Io1+NvbK
 XknTvL7qqdGyaSZZwymeIoRaNjn5DLH65Hd6E0L9gSFWXuM5INCt4ijEq
 b7+fSIH9Q0iGi9WAjIt9tyH/ztwQHiCPZUIDonQKqGjjIDw9vxbb/GQ6V Q==;
X-CSE-ConnectionGUID: IZr1aOmqTaeIWq4FvJ1eyw==
X-CSE-MsgGUID: nQ9xqu5FSgaGdeKdglOlPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="74789367"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="74789367"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 11:47:03 -0700
X-CSE-ConnectionGUID: LjzlJEdISkqP98wYldWacg==
X-CSE-MsgGUID: uypMTDipQL26WUVbhliJjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="153307507"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 11:47:03 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 11:47:01 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 16 Jun 2025 11:47:01 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.64)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 11:47:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ODDUsLfJZJPnGT2SVY3Uj/toAgbx+5i3mZw0eUjv6S3C6PdT/WrloCD5j79LU7vZUtwdDUe4RuEZDtzZJ1RdJ+7+b19ckn+oDN7WcE/pCEubwoeFGPzpVAXtxdsW/J+DXGtvFKCfLzB2TrPsxRE4ABEhmdWaHwxjR+7VUZegz84SKkCnaWTJWz97V6MP96F2qiJUNIbWFj0kTYVbxjBtP5zGU1gEpLYBe8Gxk1VGxN6sYLEjtbw1M62yn5yCdYZWcdMEnzPcoywYBcuOyL6vRuZ9j/Ovm74MhQ329nPIXDWcOOtW/00lGvz95lNFrWfnLIXVg520fqT+cEwHRqs2Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gncfoqGIVLgvnLC2zeVnxm64konKJYkknkFdF3hV58Q=;
 b=jMWe4ByA9AmpfAa9aoDy3jKUkUDKlmBY9K4mbP7s2NIh6BlrObfjd/h5MMPqY5N/jliF7niu/kPW+Vofd536LS5axG91oYw3K8nLgDNJAKa5P+CYObrpdfCemiY4AdUUJ07+rtvx5KfPZFwjt44J/RHYVBU0Z3w0xyw++rbEjOJXMHmsrb+eoo9VYTJHIYRldHhOC++ovYavjeOtizFaVfeMvcV/LNiIEC8g2Hza2vMqm1HoXcIQWj8YTazgsiD2jVn+uWexJHWyYhSwE3m64cFyQkWTw/PW5thD+9ruHN131EUd31u6hQytqtNUwQkVsCJXduEgCI+a2n03Li5dKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by IA4PR11MB9249.namprd11.prod.outlook.com (2603:10b6:208:55f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Mon, 16 Jun
 2025 18:46:59 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 18:46:59 +0000
Message-ID: <4ac790b0-5c9c-4c15-a073-9007b3624e23@intel.com>
Date: Mon, 16 Jun 2025 11:46:57 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/xe: Normalize default param values
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Michal Mrozek <michal.mrozek@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
References: <20250613-guc-log-level-v2-0-cb84a63e49fe@intel.com>
 <20250613-guc-log-level-v2-3-cb84a63e49fe@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250613-guc-log-level-v2-3-cb84a63e49fe@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0098.namprd04.prod.outlook.com
 (2603:10b6:303:83::13) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|IA4PR11MB9249:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d38e89a-6664-4897-f24c-08ddad062cd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VmMxNzdsTHp2VTlRcVoreEl3QU5sT3dHM3FWZ0gza2FqYmRIY05zL1VMZkd1?=
 =?utf-8?B?dGlXSHYxT3dCOWlJaWlaNnF4UWcvYjk0aHZCUEpJOVdsdWhIamFXbTlNVFQr?=
 =?utf-8?B?TjBwTmdZaUlXc2ZyM3dDczBpYjVObzh4QXZXZm0yazI3cmdkbGlOOTBlQzMv?=
 =?utf-8?B?V0U0OHdVdW12SUJPVjViQVBKaXMrRm41WXg2a2FHMnJZVmpUZzlndm9qSXpC?=
 =?utf-8?B?MkZQd3BoL1VvbS9MOGFFdXlwK3Nwa29mejdiZW1mNlcxZC9QaG1qQWx5QXZI?=
 =?utf-8?B?VmUzY0RYL2JlY0VnRHAzSlg4bENibmVySWlHWFJRL042T3V1ODBlV1FXQTFL?=
 =?utf-8?B?NGIwTHFGb0Q1Z1d0S01taHd2Q08vOHd4WnYzaHF5UUVJd1I0OVdudzZzN3g5?=
 =?utf-8?B?Q0hlQXI1NjdoUExWb2MyV0FtSXFEbFdkaFNXeUh6Y1p4djlXa096SDRRQ2NV?=
 =?utf-8?B?VWphVDJhUm1hbHpWUFVZanR4ZWVFWkhHQVR2L1Ric0Q5eXUrM2c2N2kxOFhy?=
 =?utf-8?B?cnZTbXlNSHBReVJFYzk3UlNic1haM1ZBbk9OUzEyTVdrUzh4cVhxRTVBT2FR?=
 =?utf-8?B?aHorQU5IeWJoUHM3d3l6M1VwWXA0dkhkY3o1WEVSVXlobk9HaGxpZzVQcy82?=
 =?utf-8?B?NG1YOTdaN1BmTllkUS9BQVg5VFR0WS9OYVp3eWszdnhPZDV1Rml5NlVyTjky?=
 =?utf-8?B?b200eW9XSXBYTWJMb1BwVDhoN29QakhReE5iUDhEakY0Z3YzSmcycW9NQkpu?=
 =?utf-8?B?TzNySnhlbFRuMFhEWTk3QmJKQklCZFQ4endZRjhOQ05zc3dUbzJ2cE5BWkZl?=
 =?utf-8?B?WVZxZ25rNDM0Q2c0OXB5bG55TFFzblNua3pPL2FqZ1daQ2wxY2c4YXVPVkho?=
 =?utf-8?B?WWVGV0xZcXgzMWxTWENtU05Uei9GM01yNlNWOFBweUVUY296UUZJWlhsemtH?=
 =?utf-8?B?NjMyeGJWc3dsVDZDRzdzMTc0SWRhdytpS0JLcnNkQlc1Y0JMSkxleCswU0J0?=
 =?utf-8?B?RkhLZWdGSk9RQWpGdGpYVTRVUHRkcDBUdkhqdHVHQTFUTDRDNjJJM3ZOdFNv?=
 =?utf-8?B?QUlaU3RmV254eHZPWUpidVd3c0o5VDhyMjVJK3lNc1IwbjZWaVBSekdLRll4?=
 =?utf-8?B?V3ZKN3FZSHpmWFVDTkcyeXg4OTZ4SnV3Z1BPVmN3MExOOUF5SityU0VtMlNN?=
 =?utf-8?B?MnF4cXJEdnJ4ZVc2dUxCajBjUWh0ZTNnamx5eDBVTXZPSTgvY2VXWXNHYTFU?=
 =?utf-8?B?WkF2WjZwUEVNZVhRekxBSERrWEpOVmdlZlhjcHhPVGFtR2RmV0g4TTB6Ly9u?=
 =?utf-8?B?YUhSU0E4L2I0WGRNZ1lxQ2ZreDBSb25nSTZaMWcrSVBPcVFRT21oclNQblI4?=
 =?utf-8?B?VUtDYXpnejZzaDJpS21XaEpqdEFNQTU3dGFUek92dUdiREZvVkNKSnFEUTU0?=
 =?utf-8?B?MEpoT1JJS1RseDZkekc4dW5GK0F6OHoxK3F2UkV2S3ZiY3hKRGROaWo1WW5w?=
 =?utf-8?B?RHFDV3VtZXVBYjh2eWhGcjNnWTFuZGVRVHJhMVdEYUh6VXRwNm9lRFZCLzcx?=
 =?utf-8?B?UHdjT3ZvRjJiempNTTFKdDNlOTl1T0R4aUZJVXhXOFZZTnpEeXBwQzZPOFNr?=
 =?utf-8?B?Z3ZRa24yRzJqeS9qeVowVmcwb0R2QmdpQ1lkYnlqbExkN1J2N0M0SE8wbmFF?=
 =?utf-8?B?eFFYYWJvTVA5NlMxVUlsN0htVnVwU1cyRVVGaGNDMXZxZEhNa0xrM3VwTDg2?=
 =?utf-8?B?dFhSTE9QZ3E2RERtOUlsSWpDc21EZ2hmaTF2VVBOcWtvdE52a2Vic0hsMGds?=
 =?utf-8?B?c2xzNmtCY2lWaG5odkdmdDRFb3gvMHBiOWszV3Q5MWlieVFQVC8zbkNFZWNV?=
 =?utf-8?B?b05XZUtlWU92anI4dWYxSXZFclorZER3M2hHN3BJNUh5azJlV3NxSHdscXQ1?=
 =?utf-8?Q?/HKFBy/rMaU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTN0bTNmVm9RMmh2cDd5aXEwOEswaUZpMnhQWDYwK3lvUmNIN2VPMlJockhk?=
 =?utf-8?B?Z2dSbDc2bXlTc25qbENNeU9pV2pnS2ladUZjaUlrdmkwbWtlc2IybUdoWStT?=
 =?utf-8?B?WHVBd0JuaWhFUCtGTzdESXVvdTBtV2VZM0VaU25JWWdxY1JyYmxaZmJtLytB?=
 =?utf-8?B?QXYrZVhXc05ZMUpOOUdtMGxxcUN6bEo5cnZISElNZk9peVFGRXJZejY4am9M?=
 =?utf-8?B?SHVBQVk4Qm9rWCtmcTc0Qm5XeE5VY2YwS0hicDhaYVAwWWhRZzFWbnpYYk8w?=
 =?utf-8?B?TWdQVGNpN2RZNEgrZHo3MFBab2tYdWsvVi9Lc2pVNlRtbXJDQU85eFo2a05q?=
 =?utf-8?B?WXlVYjVnNVhIalNhcWlQWDhSRzc0TllTL0s3S1NFU0J3RFJQaVFuZGVxTUZV?=
 =?utf-8?B?OUZleVE2eEJvSkZGamg5M2w5UmFlWUZScEtvREV4a1MrV0hoM05MZTB2U3Ri?=
 =?utf-8?B?NVgxdjNya2t0c1RUYUNFNWhRWXBicDNSUFJQUkZweDdIY2NJd1pwVHpNNVBD?=
 =?utf-8?B?cGdVNWNYMTRNN2dkbUZOZlVueE5CTHM5WjJvLzRwUlRMNUZWLzFqakFCNzh6?=
 =?utf-8?B?ZDdVQzluYklSdUtUMzlwUVNIWFlLYUEwb01FWWxjd3dtRlppdGdmZGFsRmpP?=
 =?utf-8?B?TWZWVVg5QlpaalF1K3VjSFBRbnp1OEpLRHE2bFJlQk8wQjZCOFd4MW5WUTFM?=
 =?utf-8?B?MWlvcWUvK04ycTdXV3lYUk10M0EvZTkycDE5d2F4SlFFT285bGg2STNESVJQ?=
 =?utf-8?B?OW45L2FYSjhBb0ZzdzcvdnBBMEVOYjg5bHlORUJQcUFCNkJYOGF4bGF3QXND?=
 =?utf-8?B?NFkrekhGRUs0d1V0dkJRaWNhYTlGNmhzVjNVL09iMVV6TlV4K2NVb21EUkJK?=
 =?utf-8?B?aElJOHJLYUJYMVhxTm94czNsTG83ZjJmQUZ1R2hON3pxYlFOSmR5MWZhTFVJ?=
 =?utf-8?B?V1lMRjNYNXAvTEw3Y1Z6TVlnSUVGa2JZS0VZZEE3TTFVMFF0c294TS9jQ3Vh?=
 =?utf-8?B?TCtPWTZ6WERjNnJxNjRSWTdMV2V6MzZzSm9iTTFBZGVKM0RmRjAwRnJOWmFs?=
 =?utf-8?B?Q094bUNSMUZJQm54MGR3Q3Y0azN1Uk9OUkpobUpUbWxsRGdjNWRXUWZnNXJp?=
 =?utf-8?B?MTdLTUVqdzBWbU03a2VGd1M3VEM0c0VsQ2pONjRNWnplL0FpNmF6OVdwdkhM?=
 =?utf-8?B?SUZwWSt1L3RySUlIcnhxYnVqbFlOSDU2WDBMQlE1ZGZLdWgxaEEyWklGNU9I?=
 =?utf-8?B?OS9DNWx5T3c1THU5QWZwODNnNzh4WWwyZFlmWnFJS05ZblZoN2FqUXozNi9D?=
 =?utf-8?B?YmZXSXNqUmZ4UmZxU01NYUhLQ2Fsc1ZvSEFMQ1VSM05UWDgxNE45YmFET0th?=
 =?utf-8?B?NUk5RnlRbVA4b3BtbUdjWWpVV3BwRloyV0tsMUg0MnVMT2prSmtXT00wUHEy?=
 =?utf-8?B?MEZ5bjl1YUZIaTErdlBudStINEZqaExxVGw1eHdsTTh5N001UWl5aVQ2aHcz?=
 =?utf-8?B?eEE0ZG13UXIrRHBuVTJUK1lUTFdTR3ZYN0kveG1RL2EzdEpzeHZzZHBwZU5F?=
 =?utf-8?B?NUkrMjZTUlFVcUpCckptczc4RyswSVhYMGplSFEwWWF3cTJaamNPK3N6cDZL?=
 =?utf-8?B?c3NkVForeDFaWGhYK0NZa2l5ZnZFeDJUVUlGYXRocXhmK2VGa20rRTB0cnlW?=
 =?utf-8?B?NzQ0MzlQUkpiTDVyQ3V1OFJrbkI1Z3pyZmtlSWdNenlCTHFHNkN6WTF2c0x6?=
 =?utf-8?B?dyttYkQ3aDJtT3hOYkRkUEYwRGpsNTFUNy96N3ByUjk1MTgxUEh1WTVoVlpu?=
 =?utf-8?B?ejVVRzE1TlZkOGpCdU9BNkJCZU9KZTB4NnZQKzgya3cvM0N3aHJqYU9Wd1NO?=
 =?utf-8?B?Q0s3Y0c2V1h2NEdHVlY2ZzNoM3FWclFLaFlpcGU2Tkc3QlBFMDY1NG1CZXpO?=
 =?utf-8?B?dlZXQXZLYVhPWjQzV3VIYTJFbWFIdkFaZnoyMlhINUxzVVNDNks1SDRYNXVy?=
 =?utf-8?B?VjI1YkVTYmliWUJYMEJjS1R1Y3c3Um91bkJkOS84bG1yZnFxaVJtcnVMaGR0?=
 =?utf-8?B?K0NnSERQY1RNUEJsaVN1T3VlZkJUQlVkN053Y3Z1ZjZWdHVHZ3g4bVppOGJt?=
 =?utf-8?B?OEJsOVZZNFdMVU9NdWJYZHY3RVhIMzg3SzJXTVU2WUR5dWJhcWZtTkpqN3lr?=
 =?utf-8?B?dFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d38e89a-6664-4897-f24c-08ddad062cd1
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 18:46:59.1943 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P4g+dYX1h7bDWZ1L8qBF1I4jkW5+fS7Dq2naCBeL0bnCHgfQLEZaWLFBXozD986QdvI09XOnhE6lowa0vbEUuhB2dGQsj7NjUfkw8+0clGg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9249
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

On 6/13/2025 1:00 PM, Lucas De Marchi wrote:
> Document xe module params with the default values following a similar
> strategy for all of them:
>
> 	1) Define a DEFAULT_* macro with the default value. When the
> 	   value can't be directly stringified, also define a *_STR
> 	   variant
> 	2) Use __stringify() or the _STR variant to make sure the
> 	   default value shows up in the param description
>
> This allows us to show the correct default according to the
> configuration. max_vfs for example was wrongly documented for
> CONFIG_DRM_XE_DEBUG and svm_notifier_size didn't have its default
> documented.
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_module.c | 44 +++++++++++++++++++++++++++---------------
>   1 file changed, 28 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index 192908fa074cb..2068c579d5c3b 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -19,34 +19,43 @@
>   #include "xe_sched_job.h"
>   
>   #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> -#define DEFAULT_GUC_LOG_LEVEL	3
> +#define DEFAULT_GUC_LOG_LEVEL		3
> +#define DEFAULT_MAX_VFS			~0
> +#define DEFAULT_MAX_VFS_STR		"unlimited"
>   #else
> -#define DEFAULT_GUC_LOG_LEVEL	1
> +#define DEFAULT_GUC_LOG_LEVEL		1
> +#define DEFAULT_MAX_VFS			0
> +#define DEFAULT_MAX_VFS_STR		"0"
Could be 'stringify(MAX_VFS)'.

>   #endif
>   
> +#define DEFAULT_PROBE_DISPLAY		true
> +#define DEFAULT_FORCE_PROBE		CONFIG_DRM_XE_FORCE_PROBE
> +#define DEFAULT_WEDGED_MODE		1
> +#define DEFAULT_SVM_NOTIFIER_SIZE	512
> +
>   struct xe_modparam xe_modparam = {
> -	.probe_display = true,
> -	.guc_log_level = DEFAULT_GUC_LOG_LEVEL,
> -	.force_probe = CONFIG_DRM_XE_FORCE_PROBE,
> -#ifdef CONFIG_PCI_IOV
This ifdef is lost from the new version?

> -	.max_vfs = IS_ENABLED(CONFIG_DRM_XE_DEBUG) ? ~0 : 0,
> -#endif
> -	.wedged_mode = 1,
> -	.svm_notifier_size = 512,
> +	.probe_display =	DEFAULT_PROBE_DISPLAY,
> +	.guc_log_level =	DEFAULT_GUC_LOG_LEVEL,
> +	.force_probe =		DEFAULT_FORCE_PROBE,
> +	.max_vfs =		DEFAULT_MAX_VFS,
> +	.wedged_mode =		DEFAULT_WEDGED_MODE,
> +	.svm_notifier_size =	DEFAULT_SVM_NOTIFIER_SIZE,
>   	/* the rest are 0 by default */
>   };
>   
>   module_param_named(svm_notifier_size, xe_modparam.svm_notifier_size, uint, 0600);
> -MODULE_PARM_DESC(svm_notifier_size, "Set the svm notifier size(in MiB), must be power of 2");
> +MODULE_PARM_DESC(svm_notifier_size, "Set the svm notifier size in MiB, must be power of 2 "
> +		 "[default=" __stringify(DEFAULT_SVM_NOTIFIER_SIZE) "]");
>   
>   module_param_named_unsafe(force_execlist, xe_modparam.force_execlist, bool, 0444);
>   MODULE_PARM_DESC(force_execlist, "Force Execlist submission");
>   
>   module_param_named(probe_display, xe_modparam.probe_display, bool, 0444);
> -MODULE_PARM_DESC(probe_display, "Probe display HW, otherwise it's left untouched (default: true)");
> +MODULE_PARM_DESC(probe_display, "Probe display HW, otherwise it's left untouched "
> +		 "[default=" __stringify(DEFAULT_PROBE_DISPLAY) "])");
>   
>   module_param_named(vram_bar_size, xe_modparam.force_vram_bar_size, int, 0600);
> -MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size (in MiB) - <0=disable-resize, 0=max-needed-size[default], >0=force-size");
> +MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size in MiB (<0=disable-resize, 0=max-needed-size, >0=force-size [default=0])");
Why leave this one as hard coded value rather than a define?

John.

>   
>   module_param_named(guc_log_level, xe_modparam.guc_log_level, int, 0600);
>   MODULE_PARM_DESC(guc_log_level, "GuC firmware logging level (0=disable, 1=normal, 2..5=verbose-levels "
> @@ -66,18 +75,21 @@ MODULE_PARM_DESC(gsc_firmware_path,
>   
>   module_param_named_unsafe(force_probe, xe_modparam.force_probe, charp, 0400);
>   MODULE_PARM_DESC(force_probe,
> -		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_PROBE for details.");
> +		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_PROBE for details "
> +		 "[default=" DEFAULT_FORCE_PROBE "])");
>   
>   #ifdef CONFIG_PCI_IOV
>   module_param_named(max_vfs, xe_modparam.max_vfs, uint, 0400);
>   MODULE_PARM_DESC(max_vfs,
>   		 "Limit number of Virtual Functions (VFs) that could be managed. "
> -		 "(0 = no VFs [default]; N = allow up to N VFs)");
> +		 "(0=no VFs; N=allow up to N VFs "
> +		 "[default=" DEFAULT_MAX_VFS_STR "])");
>   #endif
>   
>   module_param_named_unsafe(wedged_mode, xe_modparam.wedged_mode, int, 0600);
>   MODULE_PARM_DESC(wedged_mode,
> -		 "Module's default policy for the wedged mode - 0=never, 1=upon-critical-errors[default], 2=upon-any-hang");
> +		 "Module's default policy for the wedged mode (0=never, 1=upon-critical-errors, 2=upon-any-hang "
> +		 "[default=" __stringify(DEFAULT_WEDGED_MODE) "])");
>   
>   static int xe_check_nomodeset(void)
>   {
>


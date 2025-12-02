Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C53DD116F1
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 02:56:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B614D10E513;
	Tue,  2 Dec 2025 02:56:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="flgdSGp8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 867A610E513
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 02:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764644199; x=1796180199;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=v8+ZU6e/bIeAuIedyyVBHdtshoXQJ51h1JzzY6IIjzU=;
 b=flgdSGp8vTJgZyqQDhrFXNWVzMWE2DfhcqZ8q3H2ZUaZfHTPgEMQ2D0t
 dRAg5YUkR9OwLT4T7qsf4BfFSaq3DkqFGnNio0ps0z5pjUdOr8kdFx+lw
 HzEraKvx8nic3kzHlhFvwdAYYPgN0VV9njyjQRwHjVkyUn+qw3lPBaB8d
 8i/hyn3h5q4WuDwxLqIKMIpC8Ta4gWlJKbHNL4ek/toaos7PTOgKz0KEv
 4+3yqFqBJxuoCp89j8wdjzTO9njPLUWMfNDYgVbY/mX21IGf0L9doOT0t
 ArylUZk/zKfKW9bbPsHTuBQkUP0R2xV/lpfz1ZKvvUInPDCtIq1ohS8bD A==;
X-CSE-ConnectionGUID: GekpbGkhSEe/6gnph3sCvw==
X-CSE-MsgGUID: p+KIwwwjSm+p5ga5mTDmmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="70457220"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="70457220"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 18:56:39 -0800
X-CSE-ConnectionGUID: wNXqDNW6QpGH/K/ZEP5MpQ==
X-CSE-MsgGUID: 84d4kP9MSGO5OG0QLrliqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="193918862"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 18:56:39 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 18:56:38 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 18:56:38 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.55) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 18:56:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uiVTpFvu1petQxCibQuiV4a2GhP7i7BVJHRAL1FZZdtNWwXkv1X2Zymo5ym/Qab3Y2hrmMmV9WXxVGe90XWy1IYYDoDhOH99OGOqRPWT/8FA9tibkTdgexuq+3iWKcOA3MW35p7SHgPRHGwRT5h74k5CdzAHxCXtpuS9ONtzh9TugFK7lmXQ17RS3rNOvcfYmnpot8D+N8nguwo7bTHeLB+f4IUPqqyLtrDTlTLJP+nVCKndcQdL4j0SWCKn/r9OMpQ5GbiTBosxm7okuu/RyD2Xc9WVcg+NrMHFCVknWnhSMeBhkKBX5KbrBEs3Naq9a8TiStpsVXymfKAk79DdmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B9nWPL4GFZV1NzdYx4JBTw7FEfZNETKMlHJ4SE4IQu4=;
 b=yNUzHPVcMRGHgMjkuUcow2RR2fp6Mszrp1HvttOhoKumgV4/s3fvFc9Ph0oHIWTH0UnCfkGq6aIj5Oq3YI7GProLbcLjzDoJH1gxSSc7H8/mwA+7ZxCpeut4dVklkAE8vGX8qajP5rPG201ObE1OVX4wgSeg9VWZ/i/ZYn7TBzpxZuGg7SXOvtAgaWhxgd2Adk5b8MMY+Pl95ukIG80rsjOWv73366KsWRYt+4MTda3oVfcIy6M7422QsnPl8iaDJNPpxMaji1mbw8o5VVCBPXa9CC7XQnwk2zTVX5+rnFazHRSVhm6zJIkJKVFBRartKFvXFTZkfWCPsqIeFeflAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB3041.namprd11.prod.outlook.com (2603:10b6:208:32::17)
 by CH3PR11MB7252.namprd11.prod.outlook.com (2603:10b6:610:144::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 02:56:35 +0000
Received: from BL0PR11MB3041.namprd11.prod.outlook.com
 ([fe80::8f61:c439:8828:cbb3]) by BL0PR11MB3041.namprd11.prod.outlook.com
 ([fe80::8f61:c439:8828:cbb3%4]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 02:56:35 +0000
Message-ID: <18acb75f-84b5-465b-9ae9-e0c49f5bb0f1@intel.com>
Date: Tue, 2 Dec 2025 08:26:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 2/9] drm/xe/bo: Add purgeable bo state tracking and field
 madv to xe_bo
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pallavi.mishra@intel.com>
References: <20251201055309.854074-1-arvind.yadav@intel.com>
 <20251201055309.854074-3-arvind.yadav@intel.com>
 <aS4ekWE6xfeYUcOL@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <aS4ekWE6xfeYUcOL@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0089.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::15) To BL0PR11MB3041.namprd11.prod.outlook.com
 (2603:10b6:208:32::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB3041:EE_|CH3PR11MB7252:EE_
X-MS-Office365-Filtering-Correlation-Id: 288e0417-9bbd-40dc-c52b-08de314e67e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QVJDa0FsMTVydVZDMEVtNytSNXd0TXZNTmJwOGtaMUl6NVpubk9XVEpNT29K?=
 =?utf-8?B?T29KQzBjR0FRZUZUZ0FOQWJ5SUEwbzEvdTYzVGJVdVRCbDI0eFNUMXNjc3Zt?=
 =?utf-8?B?K0tWbk5nVk1VaTQrbEtaUzU1dWdGUU1yVGh1VlpMUWFkWWJSWC8yOHZ4VnYr?=
 =?utf-8?B?VUtLTDA0ZElXc1FmM3FPN01HbDFBdVNzdjF2UEpSWm1hY0dyUlZaVTJNSHlD?=
 =?utf-8?B?dmdrUmpYM2dqNk9WSFEzUU9FT2hNQ3ByQVVEakF3UDVXNnlwakhvZ1R6bE5D?=
 =?utf-8?B?TkZwUXpkWDdpcUZZYjZsTXN6cGFxS1hRMmVtdVc4S05Rcmh0a0ZXTEgxVTc3?=
 =?utf-8?B?OVkzMjFIdCtjcVdSbkdNY3h6QWtyd2UwT1JPTHM2MkR6TUJaYmRCZVRkRUkx?=
 =?utf-8?B?NWJ4OEREd0ozOVV6dE0zcGNQaUlvRHlhRXlWbXhRZUY1WEtqNW1RQ09sUGZG?=
 =?utf-8?B?S2d1WWFESkpWL0NEZ3o1NXJHSXRvNjA2dmpua0FtSUhRdlBhbklGNWFnYThp?=
 =?utf-8?B?UnpaTjAvbThXNFFxTUhyZVc0TzlSZ29EVkJEN0ZuRUUwd3Jad0t5Y1pUaXdB?=
 =?utf-8?B?M0VXT2FLNGFyOGxTeVJYNzI2N2g3QzNzc3pkYktkY2taK3hSNitTaE9QWWtN?=
 =?utf-8?B?UU5PdjRWYU9XdkQ2bTJCL3VLaVBMN09UWDhMd2VrR2FKRktJNi85ME4wMnVi?=
 =?utf-8?B?UzZrVFRhMFFxdEFBV3cxQk1PQ1lLeU9EQ3MxdEs3cmsxdkJ0LytwWUp5Mi95?=
 =?utf-8?B?SUl0Q3lZZlcyaTdtT3FReW1EUTJ0eUlkd0FyZXJ6SE5kL0Fhc1JrQk1yVFl3?=
 =?utf-8?B?cDhjSGtiRStLcWpWYUkyOTFaMDVoQWJlejc3Q3JoVDFhaytSYU94STFFWHNl?=
 =?utf-8?B?TDFrN25CZFJSNUU3cnNPQzdRMEdZNTI4OW9reGdqbDdObmVOQ2V1akhXUHVZ?=
 =?utf-8?B?SjE0RmxqdHlmL1JScEN4RTIzSTJHNFhnWVZOR0xJQzhkZjUvWlFmSVJvMUlP?=
 =?utf-8?B?WEs3elliMjFiSmk2OCs0OHpma0pUSlppaUhhL2hUeHIveXBBb0VYR0EwMnFn?=
 =?utf-8?B?YTEvbGlTcU9qOHVWU0hsVzZ0VDJUanNXeHJUMmtiV2g4dzF5NXR2SVlXTGhu?=
 =?utf-8?B?bHN6dHNTSGtaUVRXNjQxZloyM2gyZWhVY0tIUE1nU2owVm9iNmd5ZnRRbTJ0?=
 =?utf-8?B?RmJwbGJWQzNCMFd4c3doVmNlRkIwT1hOQ3BBZTJNc25DVTFjbVNsdFdJZnp5?=
 =?utf-8?B?OGYzMmhXQTM1TEVSYU55M3dYWHRnVS83ZXRDUTYrSEhKQWJRbkpvVmsvbHVn?=
 =?utf-8?B?Ums0WWIyaDV6OCtOZWVkYkNYZGtZNmRtRWd0aThIdDlHQXc1YkhBSC8xZFRv?=
 =?utf-8?B?U0g1Qkg4a3BESW9GUVQ1OXRQZlF4K1M3NEJzWXBXb3U0VFd2ay8yWG93Mlcz?=
 =?utf-8?B?RUNGK3pDRHBLTE1qdmM3UlR6Vk9CeThqd0pwMGQ5MDZlQUV2Um5neE5FanFi?=
 =?utf-8?B?cTU0MXFIRkNPclNMWkJLeUYwL1JZTFZVZGFEcnh4WXpJTCt3ektvaktsYzd2?=
 =?utf-8?B?YUY3dWRTUDVIMWNhbzVBWVVTaDhub0hMT2lFUnh0a09MODJGTi9zVzdzUEZZ?=
 =?utf-8?B?SzF1ZUYzblR0UTIxMXNReTRHOEorazN3Z0o1RUwyQlh0dkhrK0FMVUJHLzJL?=
 =?utf-8?B?QXEyeXUxTnpIbkQ0MllTSlhLWmtaUXRHYWJRc2pjd3I0SUJnTWxJNk80c0tp?=
 =?utf-8?B?c1FkNmU3ZEd4Y2JsVFVPbFo3S0FmR1pFYUdqeEUyTlpOVVVkMC9rV0crSGM4?=
 =?utf-8?B?SUJNTmkwVTgrYUw4N1pKajREUDdMZzJEeE1TQ1B4Tmc5cmVoemxnMFpraUd2?=
 =?utf-8?B?SnRXbExobmZqQVV3SEhpZGNidDlqa3FTRHZBUjJRUFovWDd4OC9CQm91WlBm?=
 =?utf-8?Q?ikMfmfgDDPBKXzCl10u+miX5KmkxOzUf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB3041.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UU01NDh4amQxSEplT1B3QWxvT0lpTk5ZdThtMnY3d3BoYnpqQjUyQnFndVhh?=
 =?utf-8?B?bEhObFhzNlRtYS91T2h2UGx4VHhOaGhkbmhqaGV0UHFYNFQyWnlUSjRqd25N?=
 =?utf-8?B?N1ZsRVRhRExHN21mdTdtWHlCNTRBWU9UakwxQmlrTWRocURXdkNyZXRSTjhI?=
 =?utf-8?B?Zmlvc0Q1eWFTZmtwdVB6MWhWcnpZWGVYanRobis3QWhyQURYUHJTQUR0U1VJ?=
 =?utf-8?B?bTQ5NzQ5K0cxYitydmVPWXdmSnBNYm0vekhkSzB3N3ZJZmtaNVFtNVVmeDlt?=
 =?utf-8?B?ZXA4dCtqRG0vbTlWSlgycEM3RGZtOWhvRVRrQTJUR2hwcUJLVnRKRkFBdkZD?=
 =?utf-8?B?SHNFUlZVQzN6Mm1LYmNIaVlFM2k5NHNuL1FobyttNFgyTk85ZSt0ZWR0RVhH?=
 =?utf-8?B?RTIxSk5zc0JGSUM3WGo2V01abUh1NDBvcElmbUE0cVFGdmFicDlDZ0tjYXFP?=
 =?utf-8?B?dlpWcmhrTVB2N3dGd3FoOW9sYmQ3SmN4VjhIdTdHeTZnOXBpT0V5WHk0ZUl0?=
 =?utf-8?B?a0YzdUp1OFNHNmhuSldoR1pKQWMrL3dpOC93UXQ4bUxoRk9icGV6M29yOU1G?=
 =?utf-8?B?U2REb1I3UmI3QzI5R3J1ZVVqUklmb0tsS3ppWU9PakJmMlMwbjRyOXlNZkto?=
 =?utf-8?B?SVZPTUFaNWp1MWdOcGtCcXJlMm9sUUVGaUgrR1Q3bXR2YmxUZGRqYnRtcTg2?=
 =?utf-8?B?cy9vL1ZobEZHVEVJS0sxTit2dHFuTlFHV0NyVmp0VmdEMkl2YXZSbWdJZXkr?=
 =?utf-8?B?b1lEN1JLSm56V3hMR3dwRnlxbTR4eFBrVzE3ZjlIenh4WHYvaVRZWllVaCsv?=
 =?utf-8?B?c0JKVkpTcTB3WlNIYk1PdTJ2ZlVJV1g5b1ozRkdEdWVsaXQxK0tUM3pFOXRq?=
 =?utf-8?B?enRBWlRHeVdZcEhmWlZUTCtjRUtKUU51MzkvbWZ0RUR4a2tyaE9OckJQdnVG?=
 =?utf-8?B?bUF0dG45Zmt1MWg4VWtDQjBONEVIek90bjFlK1BSbUsvOW9QU29RbzBOSWE0?=
 =?utf-8?B?TEk5dUhoTlVyKzB1NmZUNi9BQnFlNjZzZTEyd1huWEwvZzY0ZXNCRHk3YXJ3?=
 =?utf-8?B?bmZ2a1lHZmJyYVVyNE9aWVFCaUFXQmY0cFE0Ny9XcW9wYmFGbjZ1MGdSZmlw?=
 =?utf-8?B?YkxuTkdtZmxRa3BUbnRDNW9GWk0yKzFxWWQ2TDZFTVJ5K0xJSk5rU1RXS3o5?=
 =?utf-8?B?YWw5cUtPL2NYOG53b0JQM3BqTkhKMTdHckNoVFF2TXhnakRjb1BDZzE3TVNJ?=
 =?utf-8?B?MHd6UGo4ZnhXK1RhV292RXFxanpWVUFvMjM1NVBnTFNTNFBYcVBOQ3pWd0lF?=
 =?utf-8?B?S2t4Y3ExMFZFQURDc2NRNDhrL0hEU3htUWd1VEdBbnhRQ25KR0VGazZ1c0Jn?=
 =?utf-8?B?Y0JjcnEzcjhTZzZmRDZnK1ZLb2QrbVJ1Qk1YZUxYTHF2Y0g2SHJSQmZxQUI4?=
 =?utf-8?B?eHVVRVRSeXcwak0yNkwyRnpvbVVsb2pwNjJxZE1keitadmRXK1BWSFNTclJ4?=
 =?utf-8?B?VU5PWm1Ib0VnaUxLZFR5Q3NpRUxJQ0NwQ2ZOS3lNUFFNZkg4MzlDVjJMVCtU?=
 =?utf-8?B?QldGMG4xNE45T0g2cXlablg1V3laOVdvamlPUGdkV3h1V3luYzQxOGdadDhJ?=
 =?utf-8?B?MXppRGtOWEtzR0JHbno2dTc3VDlvTkZZVHNhamdHK0hpNTJObE8rNytKOXFq?=
 =?utf-8?B?eWhXMW1aSzQ3bmQvSnloMnFMUms0MWdwVVZBc20zYkhXaVI2cjRCNmNma0RN?=
 =?utf-8?B?ZGNYVE05Y0M4UTdoMWxkczZhMURoQWdoa01XNmdEUFNWVVVuOE5CakYzV2M3?=
 =?utf-8?B?NWZVMnNPaURpdi93R2p3aVZVRUpXOG40V1E3ZHpheGk1M0k3cnRHZ0F4WSti?=
 =?utf-8?B?cEw1clRUR2NmUDBTYy9obHFUY01ubkRNR0plWEIreWRwZjF1NVVOa05JdlMy?=
 =?utf-8?B?QS9UaGlXOVV2Wm1xUFVPNXc4OUxOeDJDNWc3MkptU2JZVUQrbFJPYkxzSmNT?=
 =?utf-8?B?Q1lnczN4MmIvdVpDMFJObXE4MVNTODlxTkJVR1JETFZLNEZ1NGJEWHpYSTMv?=
 =?utf-8?B?SS9SaWEzZHpETWhCTlVmU09DeEFUci9TVG01bURzVWhESy9mc2tUejFNejdD?=
 =?utf-8?B?MFdMRlNRcEtTNlFWQWo5eE51QnhOeU9SRzNjNVFINlF6TTBteHlzK013cTh6?=
 =?utf-8?B?N3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 288e0417-9bbd-40dc-c52b-08de314e67e6
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3041.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 02:56:35.6545 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bx0hrVYUFUgwL4Vbc5A8IZqnImGvc6jJpgC5ojQWiKxKjKX2K1qpM9jQ7o2l3fS+itNnv8r3GJkW8ITRrRufoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7252
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


On 02-12-2025 04:32, Matthew Brost wrote:
> On Mon, Dec 01, 2025 at 11:20:12AM +0530, Arvind Yadav wrote:
>> Add infrastructure for tracking purgeable state of buffer objects.
>> This includes:
>>
>> Introduce enum xe_madv_purgeable_state with three states:
>>     - XE_MADV_PURGEABLE_WILLNEED (0): BO is needed and should not be
>>       purged. This is the default state for all BOs.
>>
>>     - XE_MADV_PURGEABLE_DONTNEED (1): BO is not currently needed and
>>       can be purged by the kernel under memory pressure to reclaim
>>       resources. Only non-shared BOs can be marked as DONTNEED.
>>
>>     - XE_MADV_PURGEABLE_PURGED (2): BO has been purged by the kernel.
>>       Accessing a purged BO results in error. Follows i915 semantics
>>       where once purged, the BO remains permanently invalid ("once
>>       purged, always purged").
>>
>> Add atomic_t madv field to struct xe_bo for state tracking
>>    of purgeable state across concurrent access paths
>>
>> v2: Add xe_bo_is_purged() helper, improve state documentation
>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.h       | 27 +++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_bo_types.h |  3 +++
>>   2 files changed, 30 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
>> index 911d5b90461a..b0a31c77e612 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.h
>> +++ b/drivers/gpu/drm/xe/xe_bo.h
>> @@ -85,6 +85,28 @@
>>   
>>   #define XE_PCI_BARRIER_MMAP_OFFSET	(0x50 << XE_PTE_SHIFT)
>>   
>> +/**
>> + * enum xe_madv_purgeable_state - Buffer object purgeable state enumeration
>> + *
>> + * This enum defines the possible purgeable states for a buffer object,
>> + * allowing userspace to provide memory usage hints to the kernel for
>> + * better memory management under pressure.
>> + *
>> + * @XE_MADV_PURGEABLE_WILLNEED: The buffer object is needed and should not be purged.
>> + * This is the default state.
>> + * @XE_MADV_PURGEABLE_DONTNEED: The buffer object is not currently needed and can be
>> + * purged by the kernel under memory pressure.
>> + * @XE_MADV_PURGEABLE_PURGED: The buffer object has been purged by the kernel.
>> + *
>> + * Accessing a purged buffer will result in an error. Per i915 semantics,
>> + * once purged, a BO remains permanently invalid and must be destroyed and recreated.
>> + */
>> +enum xe_madv_purgeable_state {
>> +	XE_MADV_PURGEABLE_WILLNEED,
>> +	XE_MADV_PURGEABLE_DONTNEED,
>> +	XE_MADV_PURGEABLE_PURGED,
>> +};
>> +
>>   struct sg_table;
>>   
>>   struct xe_bo *xe_bo_alloc(void);
>> @@ -213,6 +235,11 @@ static inline bool xe_bo_is_protected(const struct xe_bo *bo)
>>   	return bo->pxp_key_instance;
>>   }
>>   
> Kernel doc.

Noted.

~Arvind

>
> Matt
>
>> +static inline bool xe_bo_is_purged(struct xe_bo *bo)
>> +{
>> +	return atomic_read(&bo->madv_purgeable) == XE_MADV_PURGEABLE_PURGED;
>> +}
>> +
>>   static inline void xe_bo_unpin_map_no_vm(struct xe_bo *bo)
>>   {
>>   	if (likely(bo)) {
>> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
>> index d4fe3c8dca5b..57b4dc7012e2 100644
>> --- a/drivers/gpu/drm/xe/xe_bo_types.h
>> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
>> @@ -108,6 +108,9 @@ struct xe_bo {
>>   	 * from default
>>   	 */
>>   	u64 min_align;
>> +
>> +	/** @madv_purgeable: user space advise on BO purgeability */
>> +	atomic_t madv_purgeable;
>>   };
>>   
>>   #endif
>> -- 
>> 2.43.0
>>

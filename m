Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD7B2EEA84E
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 17:16:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79F5710E841;
	Fri, 13 Feb 2026 17:16:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DTi5ZMPJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D9C410E2C6
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Feb 2026 17:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771003004; x=1802539004;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=WFIzZOqX6DtyaKHZUgicLRjje6no6pAMjqSrYIanN7Q=;
 b=DTi5ZMPJDH6IonyGaZtJCjQlVoA6tZM8DUMWV7ASJ9a+MUwn7hsqLUQU
 8sYtI8gDig0r9JOaWV5hNl/CKFQ1NyjOLWQrrFbDzVk/LbB3mLVQJVz7J
 lzHA//cIZN0B5puZ7TTj+LRQr5KpEaifvXnJS+XyIqzCezLL9rzWOZ7XZ
 DypsYVPx1a/gmqOLC7cATB8vpz0HEBFMqGHtc74uWmsOsmcznuuckh2BE
 ijn4hth4CmZcxwBJgUAa632V52VwTF44f8caFaJ6lQOfW1OSGUr+INMjZ
 byobj5n+CdErQSKo8OxCEO2HHdbSfsXmHxKpSbhLIRdcNxA9XLw042Tqz Q==;
X-CSE-ConnectionGUID: FgdWaVchS/2yB5LAkEQb9w==
X-CSE-MsgGUID: 9BK2gueERPKBkyjOecfngw==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="72085642"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="72085642"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 09:16:43 -0800
X-CSE-ConnectionGUID: +ZsfPKG1St6CgB0yKY+nmw==
X-CSE-MsgGUID: yGwMetIORcilQTHAI2c6JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="212806387"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 09:16:44 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 13 Feb 2026 09:16:43 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 13 Feb 2026 09:16:43 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.37) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 13 Feb 2026 09:16:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q+uAvRsAL4gSsWTOXB6dA2oVkP8G+1Xa5x0yge6Wdfj78c2Fwb3LazrKjtFPHcf7GVGWFlZ1uuW3dSM15Qdhs8bEh6qAE49eK680ucFjQdFDohrCtZ04jnCCmmNoHUz1knRI2rZnHAJi9RjSBpc7F+9XMt6IoRYVxv1rhAGgIpoaXuS6Ln6qtMWJTcGCsSAclNcSCiE71hlYBN4pDQsPLXIhZPs7eNO4FHGoWqExd31qXthlSUDhRFYxUH+gx2RraRRM0i4p0tDhCYqmjudMBZkWVcrqpdMMss7HnfngHXxS+XPW7hGblqWyRz5G4hypu0rtaXu1d2+JCin9b3KPDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+z+0qmsXM8gu2mFZ5vQeKAHnM8Cc9C9y0x24NPsxMJk=;
 b=dmnkXgXKwfk4/H+/C6z1+jKH4OPZdQgKgIZSdxAkYrZ6hyYiCwjTep8T4ZyApsOp1SX8DiVN8KRK0rmVn/dqhy/8FZz6SLjM2vfSyOeFH6aECKpCxtQl0/barrgLzRx+6X/wZx+ud+omYwAAMGWFWRCGYaC7p+fiZr7bUFAsDkPCoUDPDmsPoG+k3q9oj0GtCJFmerrL1kHz/ZwztQpDE9goAwU6mtRMZhcx5P80fUuzhfOww9yVzmSVKlU0I+UFyH/+KThIu583ax6JHSq0vYiQuujlRJswx1RAzdFa5vWmHJxNmDGptmAb3C15Iic09bfYbL8X4bsTbGO5nPXi3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB5941.namprd11.prod.outlook.com (2603:10b6:510:13d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.14; Fri, 13 Feb
 2026 17:16:40 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9611.012; Fri, 13 Feb 2026
 17:16:40 +0000
Date: Fri, 13 Feb 2026 09:16:38 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
CC: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Mrozek, Michal"
 <michal.mrozek@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Brost, Matthew" <matthew.brost@intel.com>, 
 "Auld, Matthew" <matthew.auld@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 1/3] drm/xe/xe3p_lpg: flush userptr/shrinker bo
 cachelines manually
Message-ID: <20260213171638.GC52346@mdroper-desk1.amr.corp.intel.com>
References: <20260210125120.1329411-5-tejas.upadhyay@intel.com>
 <20260210125120.1329411-6-tejas.upadhyay@intel.com>
 <20260210210525.GC4694@mdroper-desk1.amr.corp.intel.com>
 <aYvHCeTd5pOFo2p5@lstrano-desk.jf.intel.com>
 <SJ1PR11MB6204CD2B54AD51B175F96F298163A@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <20260211211125.GL4694@mdroper-desk1.amr.corp.intel.com>
 <SJ1PR11MB6204B6489254C702FB9A9D478161A@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <f57d25f0131d124bdee35411d15513739c7d17c3.camel@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f57d25f0131d124bdee35411d15513739c7d17c3.camel@intel.com>
X-ClientProxiedBy: BY3PR04CA0014.namprd04.prod.outlook.com
 (2603:10b6:a03:217::19) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB5941:EE_
X-MS-Office365-Filtering-Correlation-Id: ec6f908a-c5c8-4cf7-f2df-08de6b23a71e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cGFodHQ5ekQzWTFheVhRb2pheGlHdjRnanVnS1ZGZTdOVys0TjFaN1lEYkN3?=
 =?utf-8?B?ZkdiQ25tbE1Neis0RmhIUWxMQzRoSG5LaWRJMHBSQVJaaEh4RUJ4dkVDVkxx?=
 =?utf-8?B?WXJucXBIK1Q2MTB3aXZLUUJoeDhiaGt5eDRDRmtOenpFUmNUQldJU2s1aHp6?=
 =?utf-8?B?clRhenFNQXUxVUZrSmE2MmVvY1A1Vjd0U0N3OFpPTHdyR1JrbzFCS0FjWWUz?=
 =?utf-8?B?Y0EvMEtTMWxmR0k4d2JreUREYm9JckZoNkRzQzI5U0FjdEpIUmdaMTV6dUdk?=
 =?utf-8?B?Z3FoNFcwMmNJbG0vTGM2cFh0UGIrSGUvVjJ4ZkY0bm9JY01JRmIxaDMyL3Nu?=
 =?utf-8?B?Uk5QaTlBYXRaczBUeThwYmcrUEpLMUNVSUZtQTBTazl1ZVpXQ015YStkSWh5?=
 =?utf-8?B?K255bFNieGNXY05pOFFzeVpwNkVhNm5DQTRxUm03alAwUFNEdWdMMWV3a0Nh?=
 =?utf-8?B?eGxkUUluV2Q4VDRHdVZYRGRCc29aVnlhOFZYSWNuTW5hMmdVRFprYVFWTjkw?=
 =?utf-8?B?MWNRb2oxY1F5WWdhbi96Y1N2U2Zvei9ZanBlN3Z3ZmFOWGJOcjZHU3hSMEJM?=
 =?utf-8?B?V0pzN3UxK0s1Q00ycUJXbzEwL3d1TmJqdW1mVElJc3I2SzNoSERzQ3AzTHJt?=
 =?utf-8?B?amFhK2hBRWUvYk5DbnJtRzlEQUVYakdyZmE2ZkdhTGlIbzRRd1FDRFlpMzNS?=
 =?utf-8?B?OVgrbkZqQkg3aEtqTms3bUhaK0UxMlVLV3NqMEY3aGxEQks5V056bFZiRkhm?=
 =?utf-8?B?d1hURmgwbkxnNjJqRGRkMXBqazlpRWZuR0JmUm0yeTFWdzJienZMbzlXM0Rs?=
 =?utf-8?B?V1JFYlplb2wvaXI0SXFNb0pTTXhoT3BBRk1XN1Vyc0QwcUMwOUU2OUtOT1Na?=
 =?utf-8?B?Nm0yOFBPVnRyQS8yRm5CaTZrUjVoQi9BR0ptbU56NlpuS1RtaDFZRkpLMW4v?=
 =?utf-8?B?YUZlTmtTcVpZM2hoSGVVbmV6YmgvQ2pteFJEWUNFbFY3Z2R0U0pVVlB1c05G?=
 =?utf-8?B?MGJrWjg1SUJPSjJxL0F5cnZGSG54VGlaRExmRDNxMXVJbmhRZGtsd1pYU0Vk?=
 =?utf-8?B?OWF4aUIzNmZrMEhOL2Q0bEk2RXRIMEtsZ204OWRXSHF2NTFxamVJcGV1V2Yv?=
 =?utf-8?B?RWhMK21STjBTOUs2cFQzOFIySUUwdy9ITWZ0SEcrN3dzSUhEb0g3bGdlZzI3?=
 =?utf-8?B?VEVBYkJTWnpHcjdtMW03SFJvdkNpOStTN2E1ZmpvTm1zS2x1K0lyRWdwQW5x?=
 =?utf-8?B?eVJTT0lHaUZYQldnL0I3YThjbnRXTVpFMXpRNjNtK292R3dYQldZYk5GamhK?=
 =?utf-8?B?emRDdFBVbHZWSFp2V09SVlJhVWd4dHdwWjhRYno4Rng4dUM1ejdacWFyQUNI?=
 =?utf-8?B?a0l6QXpENDB2azQ5eXg3YnluT21ZZC84YmNGQ203dUNybkd6NDg3ME5PWm9Q?=
 =?utf-8?B?M0pPam9aRFp2L2E3SE5TTGVOU3hRVjNuVGNxMEkvb1BDTzNGaEQxdFdrS3RT?=
 =?utf-8?B?SERCd1F3OGtjd1ZxWTR3UktNaTQwaFhzTGg1RGNReGx2OS85UWlDRXpmbFBB?=
 =?utf-8?B?ZHZINmxnR0tHbHM4R1RlaHM0L0k1MHhHckRXZ1dRb0orSVZxc1VqdHBUQjRB?=
 =?utf-8?B?YU56NWo5cXZJTHlEMEtneHNmc0FvMG9oT3h2bWNXRVBMNnhyWkdwSEJMb0VL?=
 =?utf-8?B?YVNtdUVqNEU2MlhaU0hINklDN2U4V1ZCekpvQ2pHTE0wTzNvcUR6N05BVFMx?=
 =?utf-8?B?Nnk1enBvZ3pjbnQrRTJMSERBZGJMZFhCN1gwMFhvUWtRb1pQK2N6c1ZFSG9B?=
 =?utf-8?B?S1VjR3FoWEFLOGVhRHlvNy8rb1dvTWEvcEhad04wUGYvMzJWVkZMSkJzblJp?=
 =?utf-8?B?MnAxSFdUU3lLTjZkQVlzRlZzQ1VieFlHRkxISFJBWC9BcHhienZiNUN3OFRh?=
 =?utf-8?B?Qlh1c1QwUFFoZ0hBVzI2d0dhK2FzekdDU2xxcHN2clp4aFNUODd1eEdVYVJC?=
 =?utf-8?B?OVlKMkYvb0NtU3JBU3MzeDJVdE5ydmZIdGp6dmFIV3pscFl4Q2c4RVBBRVBi?=
 =?utf-8?B?WHErU01HTnVIRHlCVzlVOU9lUFQyZnJ6RVRJQzBZdzZndFp4VC9qVGltVjJD?=
 =?utf-8?Q?F5ho=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2ZFakU4TVV0cm1qNUNCQ2E3V3RmZ0FXQXErSHB6cGY1b2Y4c1dsVUlZaHhB?=
 =?utf-8?B?aDF4SW8wVTVXSTBQeHFyL2JhR2hva1llNnY5ZjhyM2FseTJYdDY0ZXBtc0tW?=
 =?utf-8?B?ZFFEYkpLbEhjOE50VVcrcUJHTDZPSDNNOXh6bnBUZ0VDTFh1ck96QkdRaisy?=
 =?utf-8?B?WjBTQ21pNUNrUEhtbUI3T0VjSTU5Vmw1YzlvdS8vOG1xdmRDRXF1TDJsYzcx?=
 =?utf-8?B?Y1JiUFhKRkcxbk9EK1ZwVGsvc2RrT3dMQ2FhMGpQUWFPZUJvaUNpdEp0Zk1T?=
 =?utf-8?B?aGhxTDcvZE03YW44OHZPZFpoTGkrUkdRWmdoSXJDS0JsUXIzSHpuKytoNlky?=
 =?utf-8?B?dUdKdi9xaDhWSHMzU2lKRWJEK291azdPOFFxTHdKQTJXNFJxQnd0QTdUSXJZ?=
 =?utf-8?B?OWNINHAweUhydWorMzUyZUdDdlVQT1NjMUUzZFNPbVUyK0FQczhIdUJURnZJ?=
 =?utf-8?B?anF2c2dXT2Mvc3lwTXdrN0JmQnp4N3BRbTE1WTUvVzQ1aWZ6czVKdzNoWW1j?=
 =?utf-8?B?em94OGNyU2hjU1VZZjdmU2RKTEhLUWVobElKOWN0eDR1aXF5MzBBZVd5TDFz?=
 =?utf-8?B?ZWFzWFluaWJTVFU0TlhZV0FNTGUyM0NuWmdxWEV2WGtJaEtPQXNMbzUyMVZL?=
 =?utf-8?B?M2tOQll2ZVphVTNaVFR6VUpBTUMwMEhQVWRaZ0VDRm9jWXVjODRwMnVNU0c4?=
 =?utf-8?B?NUh5UjM4NGJiSmVFUjJnR2dBWDZEb1FVU0h4K2pEUjVHYVA5YWFjOXZGWGt6?=
 =?utf-8?B?K3RVZHc1alg5UTM3dWljUjRmOC9pVjVLTFFZUXhkcFhtUlpIN0kwQWN4U3FK?=
 =?utf-8?B?bXVGbGhVZ0dXSDVGSVoxcFgxajFmcnMrRU42c0hab2FKZW05aUpGN0RBdmtx?=
 =?utf-8?B?Mkl0aTFjODFEc0JJZ0tJSHNrcEd1aUhXKzZnRFJsN3ZrV3dkTStobXBJWjVB?=
 =?utf-8?B?MG1LYkJjMGdIRWp0S2w3bFNZOXQ0elRFTlhiNjhqTE94dDBHOCtjYlZmdkRI?=
 =?utf-8?B?SXlPbXAzNHJEU2xqSkxyVHZEcUxhZVkreE1hTCtPUTNrenZrWG93ZXZUUmhy?=
 =?utf-8?B?aldLSEpTM2E5U2I2aUo5aXMzYW9pcVpna3RGNGNsQ2g0ayt6OHBRZ05kNWRF?=
 =?utf-8?B?U1Y1ZkNmdzh5eFRHRjZkRm9xN0g5aC9wMUMybE5mc0J5dGhZMlpwcmtiMFpF?=
 =?utf-8?B?Mk1PM2hDcFo0cDJPbTQ1R08zOVBFNHJ1akJZSlh6RHF3UVN2ZVY5eG1CRTMx?=
 =?utf-8?B?QUNGZmNpcTBZWS9zYkNxdG9wbHpGdk5ZSnpjR0p4RmVTZFU2dHNPdjZrL2xH?=
 =?utf-8?B?WUZSWDNpY3RNNlFBTFhEcFlxRDc2RkdJamlUSUVFRUhyR1djN0NrKytJZzZj?=
 =?utf-8?B?MStjaTlDV1piaGF3T01Ka2x1N0loU0cwUHR0R2pTWktzZkdVL0dwME4rQWs3?=
 =?utf-8?B?ZFo1TENyREJNcDdMY0F6ZDJiTG5CM3ppaFFUc0RvTGM2MEpwZXhKck95STRV?=
 =?utf-8?B?MTNNdjByVHVlZ1NmUThIdG5WQ0JlUWRHQWpyTlVEU3JXV2xUZnhEQytvUVpP?=
 =?utf-8?B?QmxLcGdWVnFUNTRwNVk2bjhSUDVJRDFBRTZ1dEt5L3lkMHQxWG1Zbys0SXow?=
 =?utf-8?B?ZHZ1cVRQUERHdXc0QmZDVGtSZlRLb1h1QUlFQmdPdndmRHY0RGp2WjMycjln?=
 =?utf-8?B?MlJJTFVNS3lJeWo2QnFpR05xK3JuaUNNZlczMGkxemtJcmplUGVBa2NUN3hE?=
 =?utf-8?B?YXA5ZVJiSm1VSmhBamtHUUlJQStud240azQ4Y0J2ekRZbkFaZWJBSmVJNi9M?=
 =?utf-8?B?VnczSWhFZEp3cGc3MFNtQThneGtrQ1RFU0Y0R3lxa3ZoUGxLOWxXV1F1RGE0?=
 =?utf-8?B?WFdxSjNMdFJJWSthQ1FpUUlsVWIwb3pxQzVEV0xjVmF6c2dWOEFQallFMlZV?=
 =?utf-8?B?WHlCSU1vVTAzd0xpRmZrNFR4S3VITkxiSERGdVdUaWhXVWx3eU1LZXk4bWJE?=
 =?utf-8?B?ZHBNSi9rWXA1K2IwdzEzYktoTWlzcUs0amJsV09FREFqNzNmaGFJamZ0dHJM?=
 =?utf-8?B?SGFpK1RsVmxWRVFMNGhwSVJYbktMdmdibHJXd0VGK1AyYUt5c2xjZkVTdFdY?=
 =?utf-8?B?RXZlRUNtdDcxYmg3V3RwVENYOUMxYjNmTzVDK0o4bW5kaTUwdDVFMW10WVpW?=
 =?utf-8?B?QkdmcG9vS20xemNoV3djb3JUbFhNS1c0Zis1RXFqeHdWR2RoVUZCcGh4YXhj?=
 =?utf-8?B?Q2k3K3pnU2lOalpaMndxekE5Q2ZvaCtlYUJDSkR6VFJGbGtDVFk3NUNta3RE?=
 =?utf-8?B?YjROQlp0T0s0RmxuZm4zdjJreUFIN2t5elVHQ0hkRVBQdGVJVytuS1d6Q0pT?=
 =?utf-8?Q?5TuEJg1vuSMxVvGY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ec6f908a-c5c8-4cf7-f2df-08de6b23a71e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 17:16:40.7140 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O3qUImOgScb7BmrEufFWBhe67t1iBS7OPWdjHr9WsUQewSG4XH7yxPsF4kWApfhBRbOFpqhuOx2DkcVNhCTGyBRtlvDTRZSZqLtoWI+sCgQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5941
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

On Fri, Feb 13, 2026 at 04:48:39PM +0000, Souza, Jose wrote:
> On Fri, 2026-02-13 at 16:23 +0000, Upadhyay, Tejas wrote:
> > 
> > 
> > > -----Original Message-----
> > > From: Roper, Matthew D <matthew.d.roper@intel.com>
> > > Sent: 12 February 2026 02:41
> > > To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> > > Cc: Brost, Matthew <matthew.brost@intel.com>; intel-
> > > xe@lists.freedesktop.org; Auld, Matthew <matthew.auld@intel.com>;
> > > thomas.hellstrom@linux.intel.com
> > > Subject: Re: [PATCH 1/3] drm/xe/xe3p_lpg: flush userptr/shrinker bo
> > > cachelines manually
> > > 
> > > On Wed, Feb 11, 2026 at 07:06:05PM +0000, Upadhyay, Tejas wrote:
> > > > 
> > > > 
> > > > > -----Original Message-----
> > > > > From: Brost, Matthew <matthew.brost@intel.com>
> > > > > Sent: 11 February 2026 05:32
> > > > > To: Roper, Matthew D <matthew.d.roper@intel.com>
> > > > > Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> > > > > xe@lists.freedesktop.org; Auld, Matthew
> > > > > <matthew.auld@intel.com>;
> > > > > thomas.hellstrom@linux.intel.com
> > > > > Subject: Re: [PATCH 1/3] drm/xe/xe3p_lpg: flush
> > > > > userptr/shrinker bo
> > > > > cachelines manually
> > > > > 
> > > > > On Tue, Feb 10, 2026 at 01:05:25PM -0800, Matt Roper wrote:
> > > > > > On Tue, Feb 10, 2026 at 06:21:22PM +0530, Tejas Upadhyay
> > > > > > wrote:
> > > > > > > "eXtended Architecture" (XA) tagged memory—memory shared
> > > between
> > > > > the
> > > > > > > CPU and GPU
> > > > > > 
> > > > > > I'm pretty sure this expansion of "XA" is wrong; where are
> > > > > > you
> > > > > > seeing this definition?  Everything in the bspec indicates
> > > > > > that XA
> > > > > > means "wb
> > > > > > - transient app" (similar to how "XD" is 'wb - transient
> > > > > > display").
> > > > > > I'm not sure why exactly they picked "X" to refer to
> > > > > > transient in
> > > > > > both of these cases, but I've never seen any documentation
> > > > > > that
> > > > > > refers to it as "extended."
> > > > > > 
> > > > > > > is treated differently from other GPU memory when the Media
> > > > > > > engine is
> > > > > power-gated.
> > > > > > > 
> > > > > > > XA is *always* flushed, like at the end-of-submssion (and
> > > > > > > maybe
> > > > > > > other
> > > > > > 
> > > > > > I assume you're referring to the fact that the driver
> > > > > > performs
> > > > > > flushes at the end of submission (via PIPE_CONTROL or
> > > > > > MI_FLUSH_DW), and that depending on other state/optimizations
> > > > > > in
> > > > > > the system, those flushes may flush the entire device cache,
> > > > > > or
> > > > > > may only flush the subset of cache data that is not marked as
> > > > > > transient.  The way you worded this was confusing since it
> > > > > > makes
> > > > > > it sound like cache flushes happen automatically somewhere in
> > > hardware/firmware.
> > > > > > 
> > > > > > > places), just that internally as an optimisation hw doesn't
> > > > > > > need
> > > > > > > to make that a full flush (which will also include XA) when
> > > > > > > Media is off/powergated, since it doesn't need to worry
> > > > > > > about GT
> > > > > > > caches vs Media coherency, and only CPU vs GPU coherency,
> > > > > > > so can
> > > > > > > make that flush a targeted XA flush, since stuff tagged
> > > > > > > with XA
> > > > > > > now means it's shared with the CPU. The main implication is
> > > > > > > that
> > > > > > > we now need to somehow flush non-XA before freeing system
> > > > > > > memory
> > > > > > > pages, otherwise dirty cachelines could be flushed after
> > > > > > > the
> > > > > > > free (like if Media suddenly turns on and does a full
> > > > > > > flush)
> > > > > > 
> > > > > > This description seems really confusing.  My understanding is
> > > > > > that
> > > > > > marking something as wb-transient-app indicates that it might
> > > > > > be
> > > > > > accessed by something other than our graphics/media IP (i.e.,
> > > > > > accessed from the CPU, exported to another device, etc.), so
> > > > > > transient data truly does need to be flushed at the points in
> > > > > > the
> > > > > > driver where a flush typically happens.
> > > > > > 
> > > > > > However when something is _not_ transient, then either:
> > > > > >  - it's "private" to the GPU and only our graphics/media IP
> > > > > > will be
> > > > > >    accessing it
> > > > > >  - it's bound with a coherent PAT index so that outside
> > > > > > observers like
> > > > > >    the CPU can snoop the device cache, even when the cache
> > > > > > hasn't been
> > > > > >    flushed
> > > > > > 
> > > > > > If media is not active, then there's really no need to
> > > > > > include
> > > > > > non-transient data when an device cache flush happens since
> > > > > > there's no real need for the data to get to RAM.  So that
> > > > > > enables
> > > > > > an optimization (which comes in your next patch), that allows
> > > > > > flushes to only operate on the subset of the device cache
> > > > > > tagged as
> > > "transient" if media is idle.
> > > > 
> > > > But what If we have stale non-XA marked pages for userptr, and
> > > > that
> > > > object moves out and at the same time media comes back, will end
> > > > up in
> > > > full flush and flush the stale entry to RAM.
> > > 
> > > What makes userptr special here?  During general, active usage,
> > > userptr would
> > > be data that's accessible by the CPU, so it needs to either be
> > > transient (so CPU
> > > can see the data in RAM after explicit flushes) or it needs to be
> > > using a
> > > coherent PAT (so that the CPU can just snoop the GPU cache).  If
> > > you marked
> > > userptr as both non-XA and non-coherent, then that sounds likely to
> > > be a
> > > userspace bug (and probably something we can catch and reject as an
> > > invalid
> > > case on any Xe3p or later platforms that support this) since the
> > > CPU wouldn't
> > > have any reliable way of seeing GPU updates.
> > 
> > Right. FYI @Mrozek, Michal @Souza, Jose
> > For userptr, as explained above, it needs to be either coherent or XA
> > pat index, or else KMD will reject as invalid case. 
> > 
> > 
> The coherency restriction is already in the uAPI:
> 
> "Note: For userptr and externally imported dma-buf the kernel expects
> either 1WAY or 2WAY for the @pat_index."
> 
> Using 1 way is enough as Xe KMD does a PIPE_CONTROL flushing GPU caches
> at the end of batch buffers.

But isn't that what we're discussing here?  1-way *won't* necessarily be
enough anymore because PIPE_CONTROL instructions don't flush the entire
cache anymore.  Whenever the GuC determines that media is inactive and
activates the optimization, PIPE_CONTROL, MI_FLUSH_DW, etc. change
behavior to only flush out the subset of data that was marked as
app-transient; anything not marked that way doesn't get flushed now.  So
there's a new requirement here that you ensure you're using an XA PAT
index, or you switch to use 2-way coherency which will allow the CPU to
snoop the GPU's caches.


Matt

> 
> > 
> > > 
> > > If something happens that changes the GTT mapping of an object,
> > > then
> > > doesn't that already trigger a TLB invalidation when necessary in
> > > the driver
> > > today?  It was my understanding that "heavy" TLB invalidations wait
> > > for data
> > > values to be globally observable before starting, so I think that
> > > would ensure
> > > that any non-XA data makes it to RAM before any binding changes,
> > > object,
> > > destruction, etc.?  Is there something special about userptr that
> > > makes that
> > > case more of a problem?
> > > 
> > > I just found bspec page 74635 which gives an overview of the
> > > various flush
> > > and invalidate cases, and I don't see anything there that makes it
> > > obvious to
> > > me that userptr would be special.
> > > 
> > > 
> > > > 
> > > > > > 
> > > > > > As you said, we eventually do want to force a flush of the
> > > > > > non-transient data as well once we're freeing the underlying
> > > > > > pages.
> > > > > > So how do we do that?  It's not clear to me how the changes
> > > > > > below
> > > > > > are accomplishing that.  Is there a way to explicitly request
> > > > > > a
> > > > > > full device cache flush (ignoring the transient vs non-
> > > > > > transient tagging)?
> > > > > > Since the GuC handles the optimization in the next patch
> > > > > > (toggling
> > > > > > whether flushes are full flushes vs non-transient flushes
> > > > > > depending on whether media is active), I thought there might
> > > > > > be
> > > > > > some kind of GuC interface to request "please do one full
> > > > > > flush now, even
> > > if media is idle."
> > > > > > 
> > > > > 
> > > > > I’m not an expert here by any means, but everything above from
> > > > > Matt
> > > > > seems like valid concerns. Thomas also raised some concerns in
> > > > > the
> > > > > two previous revisions; again I’m not an expert, but reading
> > > > > through
> > > > > those, it doesn’t really seem like he received proper answers
> > > > > to his
> > > questions.
> > > > 
> > > > Its forcing flush via tlb invalidation PPC flag under
> > > > xe_invalidate_vma( ).
> > > 
> > > By the way, what is "PPC?"  It seems like it's another new synonym
> > > for the
> > > device cache?  It's already really confusing that some of our
> > > hardware docs use
> > > a mix of both "L2" and "L3" to refer to the same device cache for
> > > historical
> > > reasons...
> > > 
> > > 
> > > Matt
> > > 
> > > > 
> > > > > 
> > > > > A couple of comments below.
> > > > > 
> > > > > > 
> > > > > > Matt
> > > > > > 
> > > > > > > 
> > > > > > > V2(MattA): Expand commit description
> > > > > > > 
> > > > > > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > > > > > ---
> > > > > > >  drivers/gpu/drm/xe/xe_bo.c      |  3 ++-
> > > > > > >  drivers/gpu/drm/xe/xe_device.c  | 23
> > > > > > > +++++++++++++++++++++++
> > > > > > > drivers/gpu/drm/xe/xe_device.h  |  1 +
> > > > > > > drivers/gpu/drm/xe/xe_userptr.c |  3 ++-
> > > > > > >  4 files changed, 28 insertions(+), 2 deletions(-)
> > > > > > > 
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > > > > > > b/drivers/gpu/drm/xe/xe_bo.c index
> > > > > > > e9180b01a4e4..4455886b211e
> > > > > > > 100644
> > > > > > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > > > > > @@ -689,7 +689,8 @@ static int xe_bo_trigger_rebind(struct
> > > > > > > xe_device *xe, struct xe_bo *bo,
> > > > > > > 
> > > > > > >  		if (!xe_vm_in_fault_mode(vm)) {
> > > > > > >  			drm_gpuvm_bo_evict(vm_bo, true);
> > > > > > > -			continue;
> > > > > > > +			if
> > > > > > > (!xe_device_needs_cache_flush(xe))
> > > > > > > +				continue;
> > 
> > Matt R,
> > This flush will be still needed as there can be non-xa buffers which
> > can be evicted while media was off and stale entries can be flushed
> > when media comes back on. Which was not case earlier as full flush
> > was happening at regular sync points and that’s where this feature is
> > bringing optimization now.
> > 
> > Tejas
> > 
> > > > > 
> > > > > This will trigger a TLB invalidation (and I assume a cache
> > > > > flush)
> > > > > every time we move or free memory in the 3D stack if it has a
> > > > > binding. It also performs a synchronous wait on the BO being
> > > > > idle.
> > > > > Both of these are very expensive operations. I can’t imagine
> > > > > the
> > > > > granularity we want here is to do this on every move/free with
> > > > > bindings.
> > > > > 
> > > > > Also, for LR compute with preempt fences, we would trigger the
> > > > > preempt fences during the wait, so a TLB invalidation after
> > > > > this
> > > > > seems unnecessary, though perhaps the cache flush is still
> > > > > required?
> > > > > 
> > > > > I think this needs a bit more explanation, because without
> > > > > knowing a
> > > > > lot about the exact requirements, the implementation does not
> > > > > look
> > > correct.
> > > > 
> > > > The thing is that we are trying to solve problem with userptr
> > > > with non-XA
> > > pat, consider if that BO got moved while media is not active. As
> > > soon as media
> > > will come back active, stale cached entries of that object will be
> > > flushed as part
> > > of full flush , which may corrupt things.
> > > > There was thinking that with this patch we would at least solve
> > > > the problem
> > > of corruption and later when page_reclamation feature comes in will
> > > help in
> > > performance as well. But now when page reclamation feature is
> > > merged earlier
> > > and it tightly coupled with bind/unbind some cases like discussed
> > > above
> > > (which are not doing unbind immediately on move/free) are missed in
> > > reclamation.
> > > > 
> > > > So thought was to let this solution go in with little perf hit
> > > > and discuss with
> > > page reclamation owner to come with cleaner solution together.
> > > > 
> > > > Tejas
> > > > > 
> > > > > > >  		}
> > > > > > > 
> > > > > > >  		if (!idle) {
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_device.c
> > > > > > > b/drivers/gpu/drm/xe/xe_device.c index
> > > > > > > 743c18e0c580..da2abed94bc0
> > > > > > > 100644
> > > > > > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > > > > > @@ -1097,6 +1097,29 @@ static void tdf_request_sync(struct
> > > > > > > xe_device
> > > > > *xe)
> > > > > > >  	}
> > > > > > >  }
> > > > > > > 
> > > > > > > +/**
> > > > > > > + * xe_device_needs_cache_flush - Whether the cache needs
> > > > > > > to be
> > > > > > > +flushed
> > > > > > > + * @xe: The device to check.
> > > > > > > + *
> > > > > > > + * Return: true if the device needs cache flush, false
> > > > > > > otherwise.
> > > > > > > + */
> > > > > > > +bool xe_device_needs_cache_flush(struct xe_device *xe) {
> > > > > > > +	/* XA is *always* flushed, like at the end-of-
> > > > > > > submssion (and
> > > > > > > +maybe
> > > > > other
> > > > > > > +	 * places), just that internally as an
> > > > > > > optimisation hw doesn't
> > > > > > > +need to
> > > > > make
> > > > > > > +	 * that a full flush (which will also include XA)
> > > > > > > when Media is
> > > > > > > +	 * off/powergated, since it doesn't need to worry
> > > > > > > about GT
> > > > > > > +caches vs
> > > > > Media
> > > > > > > +	 * coherency, and only CPU vs GPU coherency, so
> > > > > > > can make
> > > that
> > > > > > > +flush
> > > > > a
> > > > > > > +	 * targeted XA flush, since stuff tagged with XA
> > > > > > > now means
> > > > > > > +it's shared
> > > > > with
> > > > > > > +	 * the CPU. The main implication is that we now
> > > > > > > need to
> > > > > > > +somehow
> > > > > flush non-XA before
> > > > > > > +	 * freeing system memory pages, otherwise dirty
> > > > > > > cachelines
> > > > > > > +could be
> > > > > flushed after the free
> > > > > > > +	 * (like if Media suddenly turns on and does a
> > > > > > > full flush)
> > > > > > > +	 */
> > > > > > > +	if (GRAPHICS_VER(xe) >= 35 && !IS_DGFX(xe))
> > > > > > > +		return true;
> > > > > > > +	return false;
> > > > > > > +}
> > > > > > > +
> > > > > > >  void xe_device_l2_flush(struct xe_device *xe)  {
> > > > > > >  	struct xe_gt *gt;
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_device.h
> > > > > > > b/drivers/gpu/drm/xe/xe_device.h index
> > > > > > > 39464650533b..baf386e0e037
> > > > > > > 100644
> > > > > > > --- a/drivers/gpu/drm/xe/xe_device.h
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_device.h
> > > > > > > @@ -184,6 +184,7 @@ void xe_device_snapshot_print(struct
> > > > > > > xe_device *xe, struct drm_printer *p);
> > > > > > >  u64 xe_device_canonicalize_addr(struct xe_device *xe, u64
> > > > > > > address);
> > > > > > >  u64 xe_device_uncanonicalize_addr(struct xe_device *xe,
> > > > > > > u64
> > > > > > > address);
> > > > > > > 
> > > > > > > +bool xe_device_needs_cache_flush(struct xe_device *xe);
> > > > > > >  void xe_device_td_flush(struct xe_device *xe);  void
> > > > > > > xe_device_l2_flush(struct xe_device *xe);
> > > > > > > 
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_userptr.c
> > > > > > > b/drivers/gpu/drm/xe/xe_userptr.c index
> > > > > > > e120323c43bc..b435ea7f9b66
> > > > > > > 100644
> > > > > > > --- a/drivers/gpu/drm/xe/xe_userptr.c
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_userptr.c
> > > > > > > @@ -114,7 +114,8 @@ static void
> > > > > > > __vma_userptr_invalidate(struct
> > > > > > > xe_vm
> > > > > *vm, struct xe_userptr_vma *uv
> > > > > > >  				    false,
> > > > > > > MAX_SCHEDULE_TIMEOUT);
> > > > > > >  	XE_WARN_ON(err <= 0);
> > > > > > > 
> > > > > > > -	if (xe_vm_in_fault_mode(vm) && userptr-
> > > > > > > >initial_bind) {
> > > > > > > +	if ((xe_vm_in_fault_mode(vm) ||
> > > > > > > +xe_device_needs_cache_flush(vm-
> > > > > > xe)) &&
> > > > > > > +	    userptr->initial_bind) {
> > > > > 
> > > > > Same concern with the LR preempt fence as above — the hardware
> > > > > will
> > > > > be interrupted via preempt fences, so it doesn’t seem necessary
> > > > > to
> > > > > invalidate the TLBs but perhaps we need a cflush and TLB
> > > > > invalidation is the mechanism for that too?
> > > > > 
> > > > > Matt
> > > > > 
> > > > > > >  		err = xe_vm_invalidate_vma(vma);
> > > > > > >  		XE_WARN_ON(err);
> > > > > > >  	}
> > > > > > > --
> > > > > > > 2.52.0
> > > > > > > 
> > > > > > 
> > > > > > --
> > > > > > Matt Roper
> > > > > > Graphics Software Engineer
> > > > > > Linux GPU Platform Enablement
> > > > > > Intel Corporation
> > > 
> > > --
> > > Matt Roper
> > > Graphics Software Engineer
> > > Linux GPU Platform Enablement
> > > Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

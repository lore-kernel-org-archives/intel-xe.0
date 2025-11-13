Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD5FCD8CBD
	for <intel-xe@archiver.kernel.org>; Thu, 13 Nov 2025 18:31:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E85210E147;
	Thu, 13 Nov 2025 18:31:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CRxpxS27";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 559B610E147
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Nov 2025 18:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763058662; x=1794594662;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=9zQWYsOYz3Nv3jPiVoCtF3HX9qkc3rucMjEDochyqOA=;
 b=CRxpxS27qYGRH8tt+iOg+XhcbSAZe1ZLvyhc6pz6tWmrSbTPQbwZUOoq
 eMmtlubYuYu2FpMcGxb5ZtVEfXUJ5zUr4/mdNUcQTciugri9AGMYa13kY
 q7OvE6MK3aFZCjnTUycfON9NVpkufoyDm+8k0mcYUknryX4J2JIFyg9J0
 OQUCa0/jtqGGYAaMZGbkpnRa3R+6Bt4rIVka6qbYbSQP6gR/bwq6cYJ6C
 uBOnDJ6oxsvGtvWx0YF6Ni03HGnzsPSvBfdCJh25rZgP/wgefyOlMTwHN
 bNFwAnFdUmVFIflqWl7QOI41OBULezpeI797ahpe5J4mdHNGPnpdPlSw0 w==;
X-CSE-ConnectionGUID: D1nlag7rSCuywIgwwdsLKw==
X-CSE-MsgGUID: XZ1ky/8tS0ORhXpJz669cQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="64858610"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="64858610"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 10:31:02 -0800
X-CSE-ConnectionGUID: 0KxHRsenSf26VeMQKL+88Q==
X-CSE-MsgGUID: pD2HWkSTTfK2HUvkW4D8NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="188827065"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 10:31:02 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 10:31:01 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 13 Nov 2025 10:31:01 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.52) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 10:31:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PvZ5NF0A96TvK17QOVrW9guSMj1YfEuBdmYwlXCleIbDYxitXXmNSd0W5DxjIEyWK4Hu4cpKgqXfYYB/NWlRRvjVfBdXVC9g6VVhttX6WzT2nyrcgpmT78fOfaG/cZ4ff0rgTmfRXgMnvxoa5Iko1AhOAhSgX8StJQzzFIihkjdkQ2TjMSXltwzV7HUF0R9U1nYMAyvmKe06JeqU75vkP161GUdbWTmv+3kJNg0hVVFf8oZY8BGgpvivjFzTVXOCx9R+1nKysokBcs1At7qn7Q9kV8O7bwfSJ0ymdMcCTqabg6cpzcCnGKovOZ2UUtbZrJysFYabMkrL6hNX5hu1vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r1oNStNhRgqbftCRGG4E8YZ7T6kpSHFGUVmhufvN/tw=;
 b=WXOWSeoxHfyOpBb7yzIi5r9T6GrEc60copudPcqwnJo7+G6znG6LkvY2XIMnnlC8eRI6DsFN++Ih/ewkgY2YsjefWKCkqsSo2AxFmt9xPUlSu9FaTZZLRxBSpPiGUwmzGZARDtYzXIaVLhcOZiNSORQtdULRP0+8VlYdQFQ5DdTlTfLAvubrnL9uxQlVdPy8s9771RjOGDBuOvXEQCmJT1S1O5zQmx65RfzNEACAJ4a2UNJrH2oSbH3FlFCarMKWXE2XYu8KDAuYdgbF9IRpKYG1OvWeVZ2oHTzVL2cj7rgcx9K3fCafzGqundRVneDfBm97z1jiaPZvFfDNxuqyaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SA2PR11MB5097.namprd11.prod.outlook.com (2603:10b6:806:11a::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 18:30:59 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 18:30:59 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251110232017.1475869-62-matthew.d.roper@intel.com>
References: <20251110232017.1475869-32-matthew.d.roper@intel.com>
 <20251110232017.1475869-62-matthew.d.roper@intel.com>
Subject: Re: [PATCH v2 30/30] drm/xe/debugfs: Use scope-based runtime PM
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Thu, 13 Nov 2025 15:30:37 -0300
Message-ID: <176305863778.3698.18294858333278845310@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: BYAPR02CA0014.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::27) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SA2PR11MB5097:EE_
X-MS-Office365-Filtering-Correlation-Id: cb1851ac-7d63-48ba-2fdd-08de22e2cae9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V0hvbzFxSjRITUlUbVRzZHdBOGhhQndob2ZtLzBKcVVHdFMrd1VXSGt1VldH?=
 =?utf-8?B?bHBkM2JydFpnQjVwVTRkR2x1UlNVZFRQZk44Q1A0VFRhdW41WDhNYWl4d29B?=
 =?utf-8?B?alpWR3JqL0IyZlZVNEt5L0paeFU3ZFV3bzArdjhqVHBESDlNWGg1T3lqN0dk?=
 =?utf-8?B?dm5ua09NZnc0OGl6UE1YdXd5cWFaVHViMFkyQkJFL0VQUU5GcVgzRFlhNXJN?=
 =?utf-8?B?cnBoT1NGemFxNGp1RzhFcmlIVTFNZmZCSytST3MzaEZjdys1L3N1UkpUdXFV?=
 =?utf-8?B?L3ZxMElpazRVQUJvSUhscGhQZFdaQTRMeDFNbmVPYm9ZWXF3MG9lU3J0d0tr?=
 =?utf-8?B?RUlsQnl3eWVZUUE4Mm1acXptamhhRG1kR2ROMzJCSFJCR1pJaHF6MjU5WGRY?=
 =?utf-8?B?MUNpWm5ia3JqT0FKKzZpd08xUmtqZWtvLzhSaXNuSW1DNFdaMkF6S285Qy9s?=
 =?utf-8?B?dTZlcUFsRXFub05kRE5aQlhzWXlBQ0xTR1hmL082SFppS1VlaU4vanJpL3Ju?=
 =?utf-8?B?MkpyOGp2MXQzS1MyTEVnWVBXVWtyUEJzRHJxZlZrc0dzNUNySHN6TnRoQzJR?=
 =?utf-8?B?SS95SXFoeTV6MWNYZHNwRXBjdzZyOGprVFczb0hPUFptdzZJWGpyNzFxNmFz?=
 =?utf-8?B?bmJQcU1teHEyNGY3RVQyVElPeThLR1B2ekRNNGRqSzh3anNoMGF1U2t3Rzlm?=
 =?utf-8?B?ZU1OQjFsNjNCQU5PTEFJaC8wejcrdTE5b0g5ZTltTnBPdiszODU0QjZ4aEZN?=
 =?utf-8?B?VTFWbmNRZkRTUXViNzdGQ0dFbkxtL0c5NHpQakFUb1JjT1l4bkoxanpvOTFP?=
 =?utf-8?B?d28rNVhVTGVTYWlJbWZoc1loeFRmNjRIVGc0eWMyc0MxQTBLektVazBTb1FC?=
 =?utf-8?B?ZDZmdW9KdHVXZUdrY2FNNmYxZ2gxZXJES3ozMGgxYTRPMVg4S3kvWnFQK25S?=
 =?utf-8?B?dWI2ZkRjdmtyS1JLR2pjVTA2V3QxUlVFQ3lOOTQwSzBPZy9IUE5KOXhQaHVM?=
 =?utf-8?B?WTd0WW5BSlpXQkxMNUdKWGJxbnh1dThmMUZzamlOblIxRWdjMW1ZM05WTjNi?=
 =?utf-8?B?VGpJV3o4czEvOHRSbnpwQlhrV3F3LzJib3MycVZ2THdxZTNlUnJXRlg0RFc2?=
 =?utf-8?B?RmV4dklNQ0xXNktwZkpndkt3MWkxTmR4T3MranZPY29oTlFhQ3pLQzZ0dmty?=
 =?utf-8?B?ejhEVGk1RTQ1NlNDTnh2enNpSk44QmFNZXpHRHJQd3JyVWlua09ZSmdyTTFO?=
 =?utf-8?B?SCtkMThEV2pRQ2YzMFdlY3BDaUNaL1hieGwzRXNmWHZiWVZCU2RsSlgzdmhC?=
 =?utf-8?B?dnluQlpzZ2dWMFE0eUxsdFJQOU80UWlYOHM4MVpXYzlrclZIWHg3ZDJ5d2VZ?=
 =?utf-8?B?VTFuRWpxaUlnUmNtb0N0emt6MUk5d3ExdEpCYlo3NENEcWVkSEpBTnFGVXlB?=
 =?utf-8?B?ZXhSaEJNVWJmV2ZjWmtDYmF3N0Z1OFQzcjZqVzZMUnFKSHJtSm9NMndJR1Bt?=
 =?utf-8?B?aGpEN3JndGVsWCtIaU1VbzNNN29iRFlEeDZDa3ptdjdZY3BlMENUT2V4MG5V?=
 =?utf-8?B?eld1N3Ria0JkckJPbFhtN21Eay9KbURXYjBHNmJmb3pSa2NPa0kyWVd2TGp0?=
 =?utf-8?B?VE9iKzVlTkNqU2Npc3FKKzBPWmJCeGE4Rkk5a29JSGk4WmVaTndWMjF6QzlI?=
 =?utf-8?B?M29yZHRHZCtIYi9NMnhiR0l5amlWUjRZSzU3amJ1ZG1xTDd3WCtQOEt4TlFC?=
 =?utf-8?B?a0N4bEVGanU0RHhUOVc2a2ptZU5MWW92VEhUZUhZMk5YVmVYL2F5WlJJN05t?=
 =?utf-8?B?UlFaZHBZRU41TStkcE9CZHlvM1o3MEMrTzcxU0ZQYXNOWVVnQ0EzSGRZdnMz?=
 =?utf-8?B?MmF4Q0pHUEgzQjVuOWcvb3hYV2VWSUl0ZWRDdi9MV1ZOd2hUeFBydHNWa1BZ?=
 =?utf-8?Q?VrYIvs8Rzbvh66W7ML1efjg3AgBlHnwe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzBCMTFadmJrc0U3R25XbFROSTZDVkJZajIrLzNRVmNiWG11NnN1ejI0bUo3?=
 =?utf-8?B?RGIyQ29peGlJb25tVWs1Vk1WQTRpVENvZTVuSituOWpUWEY5MGhCVlcxYWJV?=
 =?utf-8?B?R2gwTFMxSkpQM2NNSXkzZXUrU2dYMjVOcm05RmVhSVRGSXB6bXFxSTZ0Smhp?=
 =?utf-8?B?RTlvbHA0eWdwRm9jaW9NYVR4U29ocHNGeGpyZzU5YzFnZjdVbkZNWlhnVVJ4?=
 =?utf-8?B?ZUZKQWtrdDFkNTVBL2djREQ4eUhvT0J6UjBZMzNLQy9JWC9kaDhrMXpLTVo5?=
 =?utf-8?B?Rm9uRDRZSjFaeGFvOVJ0SXB5cmZqdlFmTHRCQnJadndGdlZucTBGeTFCREZN?=
 =?utf-8?B?UXNycEsraytzOWtmWjJaWnVvM2NyMGljajVSUStBT3k2bFAvV0Q5Umo4QlhZ?=
 =?utf-8?B?STdhTDhtK0lVTUpna0hZaU0wWThmeGpQblZJTUlhTk1hNGZCeGV2R0gza3hZ?=
 =?utf-8?B?Yld2dFRlbVV2R244Q2NHbGx3M2x6bUYwY2swSDk0ZG9GdlRUbWVqVDBMSEcz?=
 =?utf-8?B?SlhCVFhOdlkwU1lTd1NuQ0VEOHJiRHBvcnRubUZQZzF0elMzSFNVMFpaRk44?=
 =?utf-8?B?RytTdU9hQ29wSnNBWjFlSVQrWXRZSktnOHVXVERuRzRGcEVESEZPSFNsY1dS?=
 =?utf-8?B?YitqK0Z1MlEzWmdVVjBVTDB0TFVjL0d4cUh5K21rem9EN0dhTEN1QlFzYVF3?=
 =?utf-8?B?amlycjhMeGRaTkZWVlJURWxVL1A0UUZJMnpVWUtpV01Kc0JEQmMzOGlFMm0r?=
 =?utf-8?B?UHZ3cW80MlhMYlEvZE5CMkNBL0NzOWcxdUZ5Q1RFVWc1ckFVcWtDVTlKT2F3?=
 =?utf-8?B?TDJ5T09WVnMrVDZmQmpramtRdGF1bUFjL1AyRWszRkh2QWdkNVhGYjdjMGhZ?=
 =?utf-8?B?eUdGWU96TmNzQURTWkpodnpOYUJ3SGJFL1FjS0hMdUZSN005RTR5TFZMNGtN?=
 =?utf-8?B?ZGdXZ1FhcERLUjZaVTJyQjRtVUhEb2J6NFY2U1FxQ2ZreTAwNTFMeU8yOFdQ?=
 =?utf-8?B?NHJzWWZqTzh3N3hkd1ZKWk9GMnNQU0RiU2VGbDZVTUh2S0J5ZzRXUFI0b3FK?=
 =?utf-8?B?OTdFT0Q1d3E2S2RONjhHZHZ3SzV0U2drUVlMcUc1VFRzNjJEYUlzNGdjcC9C?=
 =?utf-8?B?Wldac2RpN3hYL095Tm9iekdjdjdjYUdvWDdzWldPK0xEeXQwK1F4Tkx1SGNs?=
 =?utf-8?B?clhaQWJ5NC9vcCtVTkFEd0FPaUtqSWozZmlFUDNtMkZZcmJ1M2JMNnZXK1Vl?=
 =?utf-8?B?T1JXMUR0L3NZQ0g1RTZqOXFZQkUwQVZRZzJWUGpDeitSU2R4c05PWXZCOGNT?=
 =?utf-8?B?MFQybjRTcTJtOVRuL0FDbXhEN2FyYnN0OHZBeWJiTnJDVnBhRG94S1ZFT2lI?=
 =?utf-8?B?MS8rTmg4L29oYlBGaXNxRW1rWVIwcEY2RldIVXloVmhUKzBTVTJRWTZiUk1l?=
 =?utf-8?B?Z0UzOUE4Z21qSUgzOWFGYmdzcHVqaWcxVmJWMEQwclZRMGM5bHFLVGw0alFE?=
 =?utf-8?B?RWowUjRZdVE2TUNCRHlPaWEwQ1RTN3NGUVo2cWJKRHczT2lvZkJtSEVveEZh?=
 =?utf-8?B?bnRZWE1MVDBCbEd4eThUdHVCSWIxayttS216cmIxUGVGdE42NWlWUWZpMDFq?=
 =?utf-8?B?b21UYUdyS3pLM2xWeW5xNUgvMnFmemEzQWpQQy9xVm1QWU9jbkxkNCtRTjQ5?=
 =?utf-8?B?Y3FXaFprQ1JnZ01oTHF0RjhxYXkrQzFDeE44ZkcrVFFYQkkvVEpLYmlOR0Nj?=
 =?utf-8?B?Q1RENVlSR0dISXhYcmRPVW1qSTdMZ3pBN05FT1RiN2g4Q1hyRXcxU0o5amN2?=
 =?utf-8?B?UTY1MGhReFNxcEZlVUdWai9rVW44V0ViczYyZks4dktPM2t4ZUpVMCtZOHJT?=
 =?utf-8?B?QjlJVnNHMmdxSE5TbXh6VmVrOXNEcnJSQkpkeWt0WjYrTWdBcEF5OFNTaits?=
 =?utf-8?B?SHVaMUtRTlBjTkhOKzZxaU84MDFlVnI2dlAreWQvNm1aNnE3MFFGNExSUElJ?=
 =?utf-8?B?MXlEVDJOQVdxN1M1NHo0OW9yOHF3dUhRVnFrZEpTelhxcnBTSC9ZTEl3d3Zo?=
 =?utf-8?B?bU5temtZdXlROEVFQU5xRzlBTWNoT3BSYk1CUklPdXcyeGMraGpsZHJNb2FE?=
 =?utf-8?B?SGd0Q0d6L0pWOERLdlF6M3U1NHNNYjJQUGpSU0hTdTdCajdTNHd0bStVSWFm?=
 =?utf-8?B?aGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cb1851ac-7d63-48ba-2fdd-08de22e2cae9
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 18:30:59.6852 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a1M2QCLKVCE41AYs1RgITfbqSnra6jc1B4tGcJWuu41yafOqRcoHxd/KCm8Euez31U1ZKOk81yZvhpXTbeDu+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5097
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

Quoting Matt Roper (2025-11-10 20:20:48-03:00)
>Switch the debugfs code to use scope-based runtime PM where possible,
>for consistency with other parts of the driver.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

I think we can drop variable ret in functions:

* guc_debugfs_show()
* xe_tile_debugfs_show_with_rpm()

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/xe_debugfs.c             | 16 +++++-----------
> drivers/gpu/drm/xe/xe_gsc_debugfs.c         |  3 +--
> drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 12 ++++--------
> drivers/gpu/drm/xe/xe_guc_debugfs.c         |  3 +--
> drivers/gpu/drm/xe/xe_huc_debugfs.c         |  3 +--
> drivers/gpu/drm/xe/xe_tile_debugfs.c        |  3 +--
> 6 files changed, 13 insertions(+), 27 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debug=
fs.c
>index e91da9589c5f..1d5a2a43a9d7 100644
>--- a/drivers/gpu/drm/xe/xe_debugfs.c
>+++ b/drivers/gpu/drm/xe/xe_debugfs.c
>@@ -68,7 +68,7 @@ static int info(struct seq_file *m, void *data)
>         struct xe_gt *gt;
>         u8 id;
>=20
>-        xe_pm_runtime_get(xe);
>+        guard(xe_pm_runtime)(xe);
>=20
>         drm_printf(&p, "graphics_verx100 %d\n", xe->info.graphics_verx100=
);
>         drm_printf(&p, "media_verx100 %d\n", xe->info.media_verx100);
>@@ -95,7 +95,6 @@ static int info(struct seq_file *m, void *data)
>                            gt->info.engine_mask);
>         }
>=20
>-        xe_pm_runtime_put(xe);
>         return 0;
> }
>=20
>@@ -110,9 +109,8 @@ static int sriov_info(struct seq_file *m, void *data)
>=20
> static int workarounds(struct xe_device *xe, struct drm_printer *p)
> {
>-        xe_pm_runtime_get(xe);
>+        guard(xe_pm_runtime)(xe);
>         xe_wa_device_dump(xe, p);
>-        xe_pm_runtime_put(xe);
>=20
>         return 0;
> }
>@@ -134,7 +132,7 @@ static int dgfx_pkg_residencies_show(struct seq_file *=
m, void *data)
>=20
>         xe =3D node_to_xe(m->private);
>         p =3D drm_seq_file_printer(m);
>-        xe_pm_runtime_get(xe);
>+        guard(xe_pm_runtime)(xe);
>         mmio =3D xe_root_tile_mmio(xe);
>         static const struct {
>                 u32 offset;
>@@ -151,7 +149,6 @@ static int dgfx_pkg_residencies_show(struct seq_file *=
m, void *data)
>         for (int i =3D 0; i < ARRAY_SIZE(residencies); i++)
>                 read_residency_counter(xe, mmio, residencies[i].offset, r=
esidencies[i].name, &p);
>=20
>-        xe_pm_runtime_put(xe);
>         return 0;
> }
>=20
>@@ -163,7 +160,7 @@ static int dgfx_pcie_link_residencies_show(struct seq_=
file *m, void *data)
>=20
>         xe =3D node_to_xe(m->private);
>         p =3D drm_seq_file_printer(m);
>-        xe_pm_runtime_get(xe);
>+        guard(xe_pm_runtime)(xe);
>         mmio =3D xe_root_tile_mmio(xe);
>=20
>         static const struct {
>@@ -178,7 +175,6 @@ static int dgfx_pcie_link_residencies_show(struct seq_=
file *m, void *data)
>         for (int i =3D 0; i < ARRAY_SIZE(residencies); i++)
>                 read_residency_counter(xe, mmio, residencies[i].offset, r=
esidencies[i].name, &p);
>=20
>-        xe_pm_runtime_put(xe);
>         return 0;
> }
>=20
>@@ -277,16 +273,14 @@ static ssize_t wedged_mode_set(struct file *f, const=
 char __user *ubuf,
>=20
>         xe->wedged.mode =3D wedged_mode;
>=20
>-        xe_pm_runtime_get(xe);
>+        guard(xe_pm_runtime)(xe);
>         for_each_gt(gt, xe, id) {
>                 ret =3D xe_guc_ads_scheduler_policy_toggle_reset(&gt->uc.=
guc.ads);
>                 if (ret) {
>                         xe_gt_err(gt, "Failed to update GuC ADS scheduler=
 policy. GuC may still cause engine reset even with wedged_mode=3D2\n");
>-                        xe_pm_runtime_put(xe);
>                         return -EIO;
>                 }
>         }
>-        xe_pm_runtime_put(xe);
>=20
>         return size;
> }
>diff --git a/drivers/gpu/drm/xe/xe_gsc_debugfs.c b/drivers/gpu/drm/xe/xe_g=
sc_debugfs.c
>index 461d7e99c2b3..b13928b50eb9 100644
>--- a/drivers/gpu/drm/xe/xe_gsc_debugfs.c
>+++ b/drivers/gpu/drm/xe/xe_gsc_debugfs.c
>@@ -37,9 +37,8 @@ static int gsc_info(struct seq_file *m, void *data)
>         struct xe_device *xe =3D gsc_to_xe(gsc);
>         struct drm_printer p =3D drm_seq_file_printer(m);
>=20
>-        xe_pm_runtime_get(xe);
>+        guard(xe_pm_runtime)(xe);
>         xe_gsc_print_info(gsc, &p);
>-        xe_pm_runtime_put(xe);
>=20
>         return 0;
> }
>diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm=
/xe/xe_gt_sriov_pf_debugfs.c
>index 838beb7f6327..ddb64e78b988 100644
>--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>@@ -123,11 +123,10 @@ static int POLICY##_set(void *data, u64 val)        =
                                \
>         if (val > (TYPE)~0ull)                                           =
             \
>                 return -EOVERFLOW;                                       =
         \
>                                                                          =
       \
>-        xe_pm_runtime_get(xe);                                           =
             \
>+        guard(xe_pm_runtime)(xe);                                        =
                \
>         err =3D xe_gt_sriov_pf_policy_set_##POLICY(gt, val);             =
           \
>         if (!err)                                                        =
        \
>                 xe_sriov_pf_provision_set_custom_mode(xe);               =
         \
>-        xe_pm_runtime_put(xe);                                           =
             \
>                                                                          =
       \
>         return err;                                                      =
          \
> }                                                                        =
        \
>@@ -189,12 +188,11 @@ static int CONFIG##_set(void *data, u64 val)        =
                                \
>         if (val > (TYPE)~0ull)                                           =
             \
>                 return -EOVERFLOW;                                       =
         \
>                                                                          =
       \
>-        xe_pm_runtime_get(xe);                                           =
             \
>+        guard(xe_pm_runtime)(xe);                                        =
                \
>         err =3D xe_sriov_pf_wait_ready(xe) ?:                            =
            \
>               xe_gt_sriov_pf_config_set_##CONFIG(gt, vfid, val);         =
       \
>         if (!err)                                                        =
        \
>                 xe_sriov_pf_provision_set_custom_mode(xe);               =
         \
>-        xe_pm_runtime_put(xe);                                           =
             \
>                                                                          =
       \
>         return err;                                                      =
          \
> }                                                                        =
        \
>@@ -249,11 +247,10 @@ static int set_threshold(void *data, u64 val, enum x=
e_guc_klv_threshold_index in
>         if (val > (u32)~0ull)
>                 return -EOVERFLOW;
>=20
>-        xe_pm_runtime_get(xe);
>+        guard(xe_pm_runtime)(xe);
>         err =3D xe_gt_sriov_pf_config_set_threshold(gt, vfid, index, val)=
;
>         if (!err)
>                 xe_sriov_pf_provision_set_custom_mode(xe);
>-        xe_pm_runtime_put(xe);
>=20
>         return err;
> }
>@@ -361,9 +358,8 @@ static ssize_t control_write(struct file *file, const =
char __user *buf, size_t c
>                 xe_gt_assert(gt, sizeof(cmd) > strlen(control_cmds[n].cmd=
));
>=20
>                 if (sysfs_streq(cmd, control_cmds[n].cmd)) {
>-                        xe_pm_runtime_get(xe);
>+                        guard(xe_pm_runtime)(xe);
>                         ret =3D control_cmds[n].fn ? (*control_cmds[n].fn=
)(gt, vfid) : 0;
>-                        xe_pm_runtime_put(xe);
>                         break;
>                 }
>         }
>diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c b/drivers/gpu/drm/xe/xe_g=
uc_debugfs.c
>index 0b102ab46c4d..2198141526ae 100644
>--- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
>+++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
>@@ -72,9 +72,8 @@ static int guc_debugfs_show(struct seq_file *m, void *da=
ta)
>         int (*print)(struct xe_guc *, struct drm_printer *) =3D node->inf=
o_ent->data;
>         int ret;
>=20
>-        xe_pm_runtime_get(xe);
>+        guard(xe_pm_runtime)(xe);
>         ret =3D print(&gt->uc.guc, &p);
>-        xe_pm_runtime_put(xe);
>=20
>         return ret;
> }
>diff --git a/drivers/gpu/drm/xe/xe_huc_debugfs.c b/drivers/gpu/drm/xe/xe_h=
uc_debugfs.c
>index 3a888a40188b..df9c4d79b710 100644
>--- a/drivers/gpu/drm/xe/xe_huc_debugfs.c
>+++ b/drivers/gpu/drm/xe/xe_huc_debugfs.c
>@@ -37,9 +37,8 @@ static int huc_info(struct seq_file *m, void *data)
>         struct xe_device *xe =3D huc_to_xe(huc);
>         struct drm_printer p =3D drm_seq_file_printer(m);
>=20
>-        xe_pm_runtime_get(xe);
>+        guard(xe_pm_runtime)(xe);
>         xe_huc_print_info(huc, &p);
>-        xe_pm_runtime_put(xe);
>=20
>         return 0;
> }
>diff --git a/drivers/gpu/drm/xe/xe_tile_debugfs.c b/drivers/gpu/drm/xe/xe_=
tile_debugfs.c
>index fff242a5ae56..773d352da6de 100644
>--- a/drivers/gpu/drm/xe/xe_tile_debugfs.c
>+++ b/drivers/gpu/drm/xe/xe_tile_debugfs.c
>@@ -84,9 +84,8 @@ int xe_tile_debugfs_show_with_rpm(struct seq_file *m, vo=
id *data)
>         struct xe_device *xe =3D tile_to_xe(tile);
>         int ret;
>=20
>-        xe_pm_runtime_get(xe);
>+        guard(xe_pm_runtime)(xe);
>         ret =3D xe_tile_debugfs_simple_show(m, data);
>-        xe_pm_runtime_put(xe);
>=20
>         return ret;
> }
>--=20
>2.51.1
>

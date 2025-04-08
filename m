Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92383C36010
	for <intel-xe@archiver.kernel.org>; Tue,  8 Apr 2025 23:55:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E61610E79A;
	Tue,  8 Apr 2025 23:55:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YfeuFHZE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7BCB10E79A
 for <Intel-Xe@lists.freedesktop.org>; Tue,  8 Apr 2025 23:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744156499; x=1775692499;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=guj2PjlpgvrZGVwiVXq6x39+YaKasmhQJ7siXEz6bIE=;
 b=YfeuFHZE6EsiOCjguwON3a9xqObWNzoNbJdEjqhJ0fOkRWBVgx8gxn8g
 OZt0K4K2ejJEAJZ9H06u6ZiIJ01gWFlxgO5/xbolcnNkWUOvRhlukSWEE
 btrizPOY8dRf3KX0/vGUHH0IfMq0JNn76eotqhvXa7upjnGiR3UZlwpEU
 QIlUCcNPlPAMm3EA3WqECdQI3w1tjKhgK/aQ9v3T/eXiQFUNapJ5Mapw4
 KOL5UfqiTzsrVAkGW8zvxqHBY5aNzEP228KCAUm2rk3VuijRhg+E9X1Ne
 BMPtQexWSeiKW4uQQN1HjgTNqHYZ8Vrs3usAX9DnmT8MS3k+x5PWIfLtu A==;
X-CSE-ConnectionGUID: KxIqNz5eRqSPLE5Je75tjg==
X-CSE-MsgGUID: hh2wqGXIRp+DtmXp47QcUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45501354"
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; d="scan'208";a="45501354"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 16:54:59 -0700
X-CSE-ConnectionGUID: D9OQW5AZSNqQ6iYVJUfQQw==
X-CSE-MsgGUID: HSAujnoISS2sOvP4PWdbcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; d="scan'208";a="128275035"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 16:54:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 8 Apr 2025 16:54:57 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 8 Apr 2025 16:54:57 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 8 Apr 2025 16:54:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uU1QpMYsIwq3eqT3lkIi6gUwdGIIM35l2YQpAYmB6BOEYeBtSExjQOnT4XtexwelPkhOkIWI4fCrGbUmHiiOvoe0QtRFsLgbVaoe367LMcdkuwBB7wFesQpOWKXz09Yxe/TzDR+tlRuLA39SJHe5cBWvonheMEBDj4w1CA+fiiMt5EubPYyVrfx4TGUDu2X+YAKdhJP+6bS72EZYqWxDnSQdOa9ciZ++4Q8hikQEeeipXrNzwovN39eDK2YI9Ylaf2kukJ7/ChVAopBFRD1vrpN1gZ8TEJzHH1HuIGlG8oEnbfVfyYOQB9stRWMehji3Jw/mpCkcyxsj7i+H2WQMpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OI8G0nR84LqV3m1BHFHJduaZeegZOOjoTFqY1ml7h0I=;
 b=EZq12o/tKaEwrgZ4qoQ78mvAiiBwQ2QDSOZ3BqoQPEvzFVxUh7ZSLJlnbxg/2/womFbrCKeLkqSQTmgEC+7cudb/G90ef2QfyRvDN7+K4KOP4gazA/VKOaPqRKHptb1U4hdAtmchcvTYovfYGm2IjO3fgHtZMno8Jel01eUkL66T49zSRx9FZ/k/otNrrmwwySt/gJ9I+0my3lljXisW+z7M++wIa/kQkCxljYl5rnQ1TJBqcfz5GrVi6h3b/Z8SAUI2M7x5/7d2EjYiFZLAklsQrmGDKV1o02cNtWPF7hJyN+97ybTxIGRfuLYFWQBFVJXV+MbGvTJE2PDF6onN/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by MN0PR11MB6134.namprd11.prod.outlook.com (2603:10b6:208:3ca::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.21; Tue, 8 Apr
 2025 23:54:49 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%5]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 23:54:49 +0000
Message-ID: <5cb3a5f9-d97e-4927-a8b9-419eec61d885@intel.com>
Date: Tue, 8 Apr 2025 16:54:46 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] drm/xe/guc: Bump the recommended GuC version to
 70.44.1
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <Intel-Xe@Lists.FreeDesktop.Org>
References: <20250403185619.1555853-1-John.C.Harrison@Intel.com>
 <20250403185619.1555853-6-John.C.Harrison@Intel.com>
 <c7b270fc-42f7-4b2f-a0ec-f5c1cc58da28@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <c7b270fc-42f7-4b2f-a0ec-f5c1cc58da28@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0352.namprd04.prod.outlook.com
 (2603:10b6:303:8a::27) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|MN0PR11MB6134:EE_
X-MS-Office365-Filtering-Correlation-Id: f1e08f63-caf8-49b9-2af1-08dd76f8bf8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z3FYcWpFNFlGWDBrd2I4MkZCNFp5aVVGbFhKSHVBTDh5SnhmdzdkNm9oT2lN?=
 =?utf-8?B?bUh1dU1ISFNJalhQVEVKNnJFNzhHT0NUYkdQN1h5bk5jTDZIK2VWYzNmdFlX?=
 =?utf-8?B?dks5S3R4cGdTV0JqYzgxckpJTEVVSU4xODk3alpxOHZOS2JHUTMvTkdMT3Bj?=
 =?utf-8?B?bC9OZmdVS00wR0xGM3ZtaDF2UjlDdHM0MU5ZNG9GTkRQTDBjb1dadjlhZUh3?=
 =?utf-8?B?VEt0RXBjUXBoTUx5bnRyMmVUMDRUM3R1amE3VDhOQ0loM0JYTmd5Lzlxdzk4?=
 =?utf-8?B?azFKWWphMUN3Mk5MYm9YQkwwczFGdUxFVWRsVDY0TnViR3RTRVJQamRLQXZX?=
 =?utf-8?B?eHBOTjdydHE4Q044cUNERDJtOW5JdUVZVjd6T1BOVkN4V2J0OGZ5M0xMQWxC?=
 =?utf-8?B?RDBUNE90WVRuTDA3d25wakNGVkNpbi83SHRrWDFxeXE1T3BnNEFpcDE0elJH?=
 =?utf-8?B?MXZWa1g4enBtTk82WEw0c0JMeGNMRm9ZL1FWbFhISGVGaXB1bGpnaGIyQTIr?=
 =?utf-8?B?bmJqYTVFcVliNURXMTdwT1B4SU10NWFGaHJpallmSVN3Z3BwQzNNZGplYk1F?=
 =?utf-8?B?Mlg3aXhTWlZ4dmJVZXpyeEFBejhRK0Y3NlJPOWxvWmwvaW5SWnZoVy9ZMUwv?=
 =?utf-8?B?THlHNVQ4NllkaTdsdVdkV1oyeE5iYUtZdG1BTDBPbmVpREdJZlViOXdiclFK?=
 =?utf-8?B?UW90R09hWThaSTk1dTlVR1B1OVVEVnp5VXN1dDYvWHRmQ2JJd0Q3M3Bpd1N5?=
 =?utf-8?B?UmhySm1qeWthOFFKVmNRdlQvUisvNWQ2eHB0VGVVQyt0Nit0SGt1VFoxQzlC?=
 =?utf-8?B?VURLd1NTd1VYTlJlejFTVGVtcGs1dDBNU0ptNlBFc01HQmhxQWoycEZOb2dh?=
 =?utf-8?B?QXNrZGROUndKUDA5TVc4bHdqc1JkVXBpUEc4aGtTTUh0ZjB4UjUrNlFLRjNn?=
 =?utf-8?B?T3BWUzB1SFZjU2Z5YVMybTdicS9IYkxkZ0JrcWZuQWxRaUczTEFsS3B2c1JT?=
 =?utf-8?B?YWRUVldiYjFxVElUSERKWTQrVkk0QmRDSHRiSVN5RW9oTzFNTmJMbEV3NVp0?=
 =?utf-8?B?TXJ2UEZPRXNHRW1FYlhVR2lOMlFRN0RLdjlFTnNjUXI5ZkVvVlRSZ3RSeFk5?=
 =?utf-8?B?Wm1pdmRPVzMxTERnNUZWcTN1a2V4aVF2bHE4Y0liNUhOcG1qR2pIVzBPOVQ4?=
 =?utf-8?B?bXNoVHBuQ0trRzZ6QTZNaStLMGpNRDZEN2t4UkRzV2VlcGlBNWxiTVZjNWVB?=
 =?utf-8?B?Qm9RMWE5TXVZVStDREJMT1pxaXFtY1dIaEl5b0RkWXdkeFJlY0ZENHgrVXdS?=
 =?utf-8?B?SGJoQlZDY2I0aXVaUElIa0NQZ3I2c0NqdG10ZzZHeHJKL0JET0xXVXoyandN?=
 =?utf-8?B?MllQaXdHNkl6NWNqUlJib0VwWTFTSytzOWl6ckJGVFlmQnVDVG92c25WTlJ6?=
 =?utf-8?B?aTIrT3JjNDh4THVZT284Qjc5RTIvREN6KzFtZHNVNlJrZkhHTWhzZVU2U0NJ?=
 =?utf-8?B?QytKL2dCdmpWTzFpdmRNYnhXT2ppYTIvSWNPSnVna2ZKRUZ1bXMxclh2MTZr?=
 =?utf-8?B?STNqalBRRzJodFE5b3N1K2Y5SXNLS3FNbWRKcFRaMUkzckh5ZHFUMTd2MzhX?=
 =?utf-8?B?T2Z3b1Z1SmRTazREOW91eGVZWld4ZVptaVpBV01ISEZpb0gvSXFLYjEyVHpU?=
 =?utf-8?B?SnNCOUx1NFBiK2RyQWN1VUhvMndjVGZtOGxaTm5VSEJ0RVZuTmJJNndjMGtk?=
 =?utf-8?B?NVlrNUxRUkFyVkt6SWpVazBwR3EwWHNkaFpiV1JlZTVYeXZmcjdrSjZBanpx?=
 =?utf-8?B?SGZvMCtremJRUHMrL2RpUndMRGxldi9DVFVCNExrYWV5U1dCejhheGF1TVNB?=
 =?utf-8?Q?TYkALeBBx3zAE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFFTRXlsVGtDZU1sbG5IR3BRNjFsNzVhK2kydXZIYkJaVVFNYUdoVCthQWQv?=
 =?utf-8?B?TkJnUSszSlAxNkQ3RlQ5T3VRVGZReXBpZHNtalFFckhGcm1pdElxS0cxVmdD?=
 =?utf-8?B?Zi9RMjh1cDJ2ZkJEb1grSmtIN0UrVklSa0FTeGFlY1k2dGhnTVNZUzVqb3RL?=
 =?utf-8?B?QTdJdUpvT1JLTkg3SVNjeFlFY2tNbnRIV1RuREp4Wmc4VzU2ZkdLUTBoUmc0?=
 =?utf-8?B?MnJPL0ZUNXAvK3dJcUYxc3FmaXFwSmt6QzlHdkgyaTFWVWpzSmU3U0c3bmdV?=
 =?utf-8?B?YUp6TWZjbFJpSk1VNnBJdkpTK2ljdkhPdEhjT21PL0k3YzNqTHNISnFYeDAr?=
 =?utf-8?B?bnJWeXJ2WWFzaUVjL1JYU0ZmbmdYR2t5SnV4SEhOUjFMYUVMZnRmTU5PdS8y?=
 =?utf-8?B?OTlnZzV5SUE1dXAyTmxjY2huc3hsQ0l6ZVhGck5yRzczcmhSVUhwcnV0c2Vq?=
 =?utf-8?B?RUptYnQ1REttZWhRVVoyS1VrRUtqS3J4Sm1zUnZrM1FicGpqSUlFZ2x0WlJ4?=
 =?utf-8?B?eEtuM1M2bFJYakRTbExiNXhvejFnQjJiVU4zZGJTeHlKL0ZPblpKdFg2d3hz?=
 =?utf-8?B?WFFLb3k4SkkzL2hOMmFYanV1N010cjJpL1VoQXNLM0xxbWd1KzByRXdBeTZo?=
 =?utf-8?B?c2ZsQ2k5dUdtcTh4UWplMnlmOXdZQU1tZDlVSmhHeXh2RjFWWDMzaFd0Mkxo?=
 =?utf-8?B?bnNELzFhNjQrU0xlRUU1UDRRMTJia2xnbGUwcW9sWlpYa3l3TFJFUmtCbkx5?=
 =?utf-8?B?ZFBlc20zcVFGTkdvQ2lDc2ZLRkdxODFsbWdQdThDaW9Cc2h2YnpEN2hGWWpH?=
 =?utf-8?B?MnVocVh5eGU5NmIwWUVOb05DQUUxOVQ0ZGVhenFuSnNaM2FNVlVFSGRZODd6?=
 =?utf-8?B?cEFmTzhlZEVwVjhlbTJYRi9kbit2MFhVZkZTZlNReldoZGY3WlAvNVZ6WSts?=
 =?utf-8?B?QUxQMnIrYkZSMmhad2d2R1d0MWFqc1NFeFhKVU9lZndTVUdvOWx5N1ROR1hL?=
 =?utf-8?B?Qmo0R2lDbDJiUG11TWNlYXlVbkZDbEdoQUVVWXVWbW4zNmoxOU9JN0lDMFJ3?=
 =?utf-8?B?aUl1ZDRocVQ3K1oyM1JwSW00V0J6TzVQMGw4eFFic1lSVmlSU0Y5Z2llaHhL?=
 =?utf-8?B?YWJNSkt4bUhJekw4SldqU2xHUWJ5YWhUTXhRMTU2N3kxYld6M1hvS2x2VURn?=
 =?utf-8?B?emZORmFZTnFXVzRtUkRzeHNMQUgzZDIvell1V2VabXlnM0JDdWJmaDFidXJk?=
 =?utf-8?B?NTVoUWV6eFp4MXNlRWVuU25icUdKTTJjQmJTOUNpR2dVNEZkM1BtQXdVWEJl?=
 =?utf-8?B?OWEwSzdnV2djeHNWTDAzTEhWb0tKcEkzRFBiSndXTXV4R1FGdHRSVlZodXNW?=
 =?utf-8?B?cUxSQ01oOWpZRFZ2MnJML25HanBBeFZPaGpDUU5ocHozcXlFU0ZtMmVzQVlC?=
 =?utf-8?B?T29tREQzVm5HODAxWmJhczVMVUlCS2I0R0drcmk0THVITFRHdTNOenlQczVy?=
 =?utf-8?B?U25EMVdMbTB5V3JsRVNGS282S0JsNWN6NTdEaWovM1BQQnBkcHNRR3orS2pa?=
 =?utf-8?B?cFRlWlBhb25yS252OUFxV2lBWmtGSUVhRWk0NGluczgrcitqOTRrT1JtUHlU?=
 =?utf-8?B?MER2eC9BVks4QTBDdmlyblg3OUdkcjY1TWpBdUFVNE0vcCtjM3grN2VLKys0?=
 =?utf-8?B?aUk1TGg2QW1qK0NEdStmU3ZmSFROejB5dUZNdkp2TytxWFArYXNuMm1DV0lt?=
 =?utf-8?B?RGhBeXVmNGlPam5EV3ZLWGl1KytncjZLQmhMV3Jtc0NGSGxwR1ViZlNSbW4w?=
 =?utf-8?B?cTU2OGYyaXJlSTRnZy9ZSlU5RVhYdGgyWVJSQ3dnaFYxdmkxbVZoc093OFZH?=
 =?utf-8?B?TDN2ZEZacXdqN0hVRElrWldwMmZYQ2F3SlJudk9XY1BhVzZXUW5JSlAyczdO?=
 =?utf-8?B?NWFyN1ZiN0tlOExKZ2lyOFBDY2E4NmlWYjgydTI2QmJHNTNpRmY1eitkMElK?=
 =?utf-8?B?NG9GNDZHUEYySExNRVcxSTJ5elREVURYa2RtbkdhdDJ2OFR4MmlpOW5UbFZV?=
 =?utf-8?B?SEttcGZ6a3hwNmVCdXlRRUtKdDBxNCtuM3VFQ1Q3UmkvdHlVYks2YVlkUVVz?=
 =?utf-8?B?bk1LbnJTWGU1UzNVSjZ1czE4aGxBdGdHVTkyb3pNMlp3RVI0cCt0dEY0MUFv?=
 =?utf-8?B?d2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f1e08f63-caf8-49b9-2af1-08dd76f8bf8e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 23:54:49.5797 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LoTCzL9t5z8WIgKSykLdA7/s3OGgEldO/SbaCWKJOKYiiDkaF7XcjmlVkB8lt5GJ1jzIPg2BHE8hiWH7M/Nl6auZ3Z6YGdDcE0M4MAwvoiQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6134
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

On 4/8/2025 3:15 PM, Daniele Ceraolo Spurio wrote:
> On 4/3/2025 11:56 AM, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> A new workaround requires a newer GuC version. So, recommend that
>> users install it.
>
> The feature the WA is for is only officially supported for PTL+ 
> though, so users aren't really impacted on anything else; I'm not sure 
> if we should recommend the update everywhere.
It is unofficially supported on other platforms, though. And most of the 
platforms below are not officially supported by Xe at all, anyway. So 
'official' support isn't exactly a deciding factor. There are also 
various other minor improvements since 70.29.2. So it was agreed that 
now was a good time to just do a blanket update.

John.

>
> Daniele
>
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_uc_fw.c | 20 ++++++++++----------
>>   1 file changed, 10 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c 
>> b/drivers/gpu/drm/xe/xe_uc_fw.c
>> index 4a16d3c40ea9..2741849bbf4d 100644
>> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>> @@ -114,16 +114,16 @@ struct fw_blobs_by_type {
>>   #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
>>     #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, 
>> major_ver)                    \
>> -    fw_def(BATTLEMAGE,    GT_TYPE_ANY,    major_ver(xe, guc,    
>> bmg,    70, 29, 2))    \
>> -    fw_def(LUNARLAKE,    GT_TYPE_ANY,    major_ver(xe, guc,    
>> lnl,    70, 29, 2))    \
>> -    fw_def(METEORLAKE,    GT_TYPE_ANY,    major_ver(i915, guc,    
>> mtl,    70, 29, 2))    \
>> -    fw_def(DG2,        GT_TYPE_ANY,    major_ver(i915, guc,    
>> dg2,    70, 29, 2))    \
>> -    fw_def(DG1,        GT_TYPE_ANY,    major_ver(i915, guc,    
>> dg1,    70, 29, 2))    \
>> -    fw_def(ALDERLAKE_N,    GT_TYPE_ANY,    major_ver(i915, guc,    
>> tgl,    70, 29, 2))    \
>> -    fw_def(ALDERLAKE_P,    GT_TYPE_ANY,    major_ver(i915, guc,    
>> adlp,    70, 29, 2))    \
>> -    fw_def(ALDERLAKE_S,    GT_TYPE_ANY,    major_ver(i915, guc,    
>> tgl,    70, 29, 2))    \
>> -    fw_def(ROCKETLAKE,    GT_TYPE_ANY,    major_ver(i915, guc,    
>> tgl,    70, 29, 2))    \
>> -    fw_def(TIGERLAKE,    GT_TYPE_ANY,    major_ver(i915, guc,    
>> tgl,    70, 29, 2))
>> +    fw_def(BATTLEMAGE,    GT_TYPE_ANY,    major_ver(xe, guc,    
>> bmg,    70, 44, 1))    \
>> +    fw_def(LUNARLAKE,    GT_TYPE_ANY,    major_ver(xe, guc,    
>> lnl,    70, 44, 1))    \
>> +    fw_def(METEORLAKE,    GT_TYPE_ANY,    major_ver(i915, guc,    
>> mtl,    70, 44, 1))    \
>> +    fw_def(DG2,        GT_TYPE_ANY,    major_ver(i915, guc,    
>> dg2,    70, 44, 1))    \
>> +    fw_def(DG1,        GT_TYPE_ANY,    major_ver(i915, guc,    
>> dg1,    70, 44, 1))    \
>> +    fw_def(ALDERLAKE_N,    GT_TYPE_ANY,    major_ver(i915, guc,    
>> tgl,    70, 44, 1))    \
>> +    fw_def(ALDERLAKE_P,    GT_TYPE_ANY,    major_ver(i915, guc,    
>> adlp,    70, 44, 1))    \
>> +    fw_def(ALDERLAKE_S,    GT_TYPE_ANY,    major_ver(i915, guc,    
>> tgl,    70, 44, 1))    \
>> +    fw_def(ROCKETLAKE,    GT_TYPE_ANY,    major_ver(i915, guc,    
>> tgl,    70, 44, 1))    \
>> +    fw_def(TIGERLAKE,    GT_TYPE_ANY,    major_ver(i915, guc,    
>> tgl,    70, 44, 1))
>>     #define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver) \
>>       fw_def(BATTLEMAGE,    GT_TYPE_ANY,    no_ver(xe, huc,        
>> bmg))        \
>


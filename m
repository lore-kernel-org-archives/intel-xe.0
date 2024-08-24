Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF3B3C5321D
	for <intel-xe@archiver.kernel.org>; Sat, 24 Aug 2024 01:03:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69C5210E14A;
	Sat, 24 Aug 2024 01:03:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VCMuXXsK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 036B710E14A
 for <intel-xe@lists.freedesktop.org>; Sat, 24 Aug 2024 01:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724461379; x=1755997379;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=OgL0qZd9KXaoiu75n8nYVnAOMq1YoCGAgv4spPLP5u0=;
 b=VCMuXXsKFhuc0h50Rfm7UISOKxyQzVUwhzHiX9zJmWPhbwpo1luo/NY/
 Se52RsBwjyIZuKJN2Wx0HJtf7LdgMocyBGmN/Ffy82WveUHI+Ecp81jB0
 sRH+PBU4X9Fww+xV21Faw5PrVThCkoruIPtcoT412QBAW6zRG+nmlAdYe
 xBtd3Yfl4KqcniUHNe9ZdH2O038f6CJ2XN/MrwkLTAEHYWeEJ8AtWfSUD
 QoziwoSoJ6FscSCPup1bcF/ytnBUTymgg0SpBzbIwZGpc6Sf0E4JyhECV
 A1RCxNJGGLoTuPOKAclA71q2iEFoHbza790Du+VYGsU0UzJQ8Rx6pOLfP g==;
X-CSE-ConnectionGUID: aodw512dSkewh9uMs/wenQ==
X-CSE-MsgGUID: NgsoTzgGTPa8S+PFaJ4C4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11173"; a="23134690"
X-IronPort-AV: E=Sophos;i="6.10,171,1719903600"; d="scan'208";a="23134690"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 18:02:59 -0700
X-CSE-ConnectionGUID: cJuxGoK7TSiBiu+kVErILg==
X-CSE-MsgGUID: vLu+geVFTiW4cWhbmNKp9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,171,1719903600"; d="scan'208";a="92779875"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Aug 2024 18:02:58 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 23 Aug 2024 18:02:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 23 Aug 2024 18:02:57 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 23 Aug 2024 18:02:57 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 23 Aug 2024 18:02:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nx0AeIhQux/1pg3LUZx3qZWj+GBLWcSjbLf7bAtUNcdYFCbU5GJNz1tOHIUhZkK7TnTs7BiCmRWxkwWJGCJVCKChUG05WGKRt1B5hks1f2CFcdPUTGYEl8lAI3o+rhvhVHwU/qRuBDj+UeNyNZneUdiFDvf3Gu+Q7GT/qY7NVOo1wdLb+T9dP2zeaUVT2os4hyIxa66Y7s+I3hGF0D5WWpYS9r+UJ8s/Fnmqjnfh4dgRptdgNJ4bKgjzHmqBtBBu+JUVDfm9mRM+ViMCaBCawxEIBWjqAwQQDTj7krAgdNSGPE6oBDRiugWh8xbcKXnqAwWxlVuas1Pii3tXqc+BWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tnICzLaPZDb+aMP5q69lQhZRqNqV3R73Mf4rXAZYw3Y=;
 b=kcrwZbPGPMp8Mj/UFxaj5ZY9tjls4RfxGLu8fe8awFXwQizT854F3P+AOTFWA6avKhf1rHe7QsFCEifp2XbSKXzJl6cezI70sTy2h0FAHUd8hDs4ZlU8Tefs/woCDy4bBxJu1HuIlDRWVXDSEoICRyikHInzqBrp3Vtd7rU3PKitCoN4bui7W2ynCTrv+nNaO8JvlAhAWZXx0KZTQRKvtndrrgIc2wWChlt9ABkiJYzMwJ7mRx8bPeQ50ht/5SH+MCJq/X40FU7gS+/JZgz4ikHGvoJ3Ge0wTt9AGKvCa1v6d5WKOb3UK7OtBJ3womPFhehVGJxNRhWg6F4Z4lpOnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by BL3PR11MB6313.namprd11.prod.outlook.com (2603:10b6:208:3b0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Sat, 24 Aug
 2024 01:02:55 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0%5]) with mapi id 15.20.7875.023; Sat, 24 Aug 2024
 01:02:55 +0000
Message-ID: <2a8a0825-96e4-47ba-86ac-d9416c4d8e6a@intel.com>
Date: Fri, 23 Aug 2024 18:02:51 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/xe/gsc: Add debugfs to print GSC info
To: <intel-xe@lists.freedesktop.org>
References: <20240813231148.1663731-1-daniele.ceraolospurio@intel.com>
 <20240813231148.1663731-5-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <20240813231148.1663731-5-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0225.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::20) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|BL3PR11MB6313:EE_
X-MS-Office365-Filtering-Correlation-Id: abfbda20-43bb-47b4-21db-08dcc3d87cc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZE5JVzQ0OTR6TEhjOXFsRmMzaFh3MWJWb3Z2YmpTNUg4U3FhM1VjL2VvMzd3?=
 =?utf-8?B?bHBDandSQzJZdHNsa0M2OUpSOGRONnBZeWtqUk1TdVRLRE9iQ2Zwa01LS3Nq?=
 =?utf-8?B?c09LOVZIMERiYm5QdGRyWGI3N1MxMVJZYVhuL3ZVUlNROEI1cVA3aTRUTlU3?=
 =?utf-8?B?WERSWVh4T0xwT3NwbGxwVGZXb2lta0JyeFBEYndaMXd1K2ZRTk5KR2Fremxl?=
 =?utf-8?B?d3pub1QvNEU3cldhWEVKQ0NCSTljczJBaVNyQTY2bmQ4WjE2K2xtS1FNSDZv?=
 =?utf-8?B?UnBsWXFwUzlNM1hSN21DcytnVjhVSnIyYXdkeWdaVGFOV3p4R05JRHJNSlZN?=
 =?utf-8?B?K1I4aWJTQmJoRTB6NWdnYjZYeDlxZ2FTUjRZazd6bG1sZkhHeEJBUEV3YVY1?=
 =?utf-8?B?RXNGMTQ2MU0rTXBJSjI1VUZOMUxHemRaY2p3MG9KZlgzU0tGNi96WlZnVjIz?=
 =?utf-8?B?MzBYdUJZM2J5VFVLZnFqRTlGb3dHdlNORk00V0Q3SVpaaUxDU1JUTVFMYWxM?=
 =?utf-8?B?bVBWUjNWelRxckNXb3Fxa2R3aU1GUktQdC93aTY5SG1NZndMMHFDVWZCRDdI?=
 =?utf-8?B?dWZTMVU4YnZkMW5iYzNSV3dRRlRLOXZzTzE2amhwTnMwOVh5QUZLdHN1ak9W?=
 =?utf-8?B?MGtTVVExZ0plbzhOaWtmN2VWaE1TVVA5WGI1K1VrWjFtaU9rZ1l0RnRLUkV2?=
 =?utf-8?B?S0ZqTXpwV3Irbjd6L2VQdUlhRjZYRHJtVCs5Y3l2Z2N0Z0tTVk5uNERKMzEx?=
 =?utf-8?B?bDgzemtrQnZJNTJGNDkzMXpJL1o3TWp0R1h5N09TSk5uK0xOazUzaWVkaGxq?=
 =?utf-8?B?eDVQa28vU21MMStIRkgzSVhDQXJHNFo3aUh5VGtINldHVUdDamhkc09hbXUz?=
 =?utf-8?B?UzlZR1lGUVZzZ2xwOWRTMXpwWGovcXBYc20rZXdHYVducXk0eWRLQmtzNFRM?=
 =?utf-8?B?emlqRFJTNkdicjJIRnpSVDlBS3pSMERjRVQ3eWtibzdaL011b3RZak9VS0VP?=
 =?utf-8?B?WUlJZVJTZm5Ua0RJdzlONUlrYW1BQWsweE13L1RuZlNEY0YrR2pQcjZFWWth?=
 =?utf-8?B?cytiRzJMUGptV2U3Q28vaENlQ1RpK2kyRW12VUpwM2pXZWNaeDdHalliTFlY?=
 =?utf-8?B?TER1N1c1Z2grTG16SU50bEVZTDlEbEpORXZwYXRoYVZQWkRTVGNjakNrenln?=
 =?utf-8?B?bGVKRmx1T2plLy9PT0dGMXdXSXh6UFNRSGlYUmdFaUlUQjRrdUc2T3ExNnBs?=
 =?utf-8?B?YXp1OW14MmpWa2s5aDdtVlBEY3JPTWFVUjZpMm80cjdJdFg2N002aFplbDg2?=
 =?utf-8?B?RzM5WjZhRDdMUUNhcmZLbER2bUdLSWpFSm1TdFlhblQ3SmVhWVJublRWUDM3?=
 =?utf-8?B?MlVoVXpOZW1xMnlKNjFXalZsZndUOERxODBZNzd0WmNIZ0haTGpxUjZXQmJR?=
 =?utf-8?B?bDRCbEJsWlM2WFpHR2tGa2hiZWNxSGdpNzA4cHU2ZUl5UUpOWmIwQk13OURQ?=
 =?utf-8?B?dThxSjc0dmI2dFk3VTN1SkhZdCtYNzdqRTJsbm9kMllidTE1Rk9TelhmYWFJ?=
 =?utf-8?B?eUR3RWoxcVR4eE5kY1FFNzdMQTJQakVQZGJacEpYN2ZUdjZIUEw0MG1aaExB?=
 =?utf-8?B?U24yRHh5TzF2dnk1REZsd1FJa2xpdmIxTjM4TDFOTmxSQ2x5TXh1RlpQZ29D?=
 =?utf-8?B?WGZ3TlpncEptZ000WVN4NGV2QVBsT1oyQjBmNngzZ0YwZXlrNm1xUnpDczFY?=
 =?utf-8?B?TWFhK0JLWCtlYjhBNzVUOVRkdFNwTFpIRUR5bWxYMGVyUjJvQ1hFdk93VDdu?=
 =?utf-8?B?S2hMbUVuZmp5OVB3S1lKUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dENjT3RMdWRMVWVBc3hrWFZjamhvOE9xOVc2WkxvRGtSQmIrVDFuR2dOOXNx?=
 =?utf-8?B?NWdoY1NSNWhqaHNKWnN1dXIyZXZNYTZlRXNab3ovWmZzOWpQaUk5NUpOY0hF?=
 =?utf-8?B?UXBaN3U3Y1RSdUdnMG9ubmltazFxTjFuckpzdTFLcFhvVVlUMTRFbUtta0c1?=
 =?utf-8?B?a1dFdVVnc2p6OHFWUWEwSmF3Z0JQREJqSC9SbHJuTlBmQ0RBN1BhQjFOYnIz?=
 =?utf-8?B?bkpDQ3k2WlVjZ2IwdHNWVkZDb1M5V0xxa3ZNdmorNnorMStYV0wwV2xIUFJw?=
 =?utf-8?B?SmY3S0I5UkdQN2xxOGU4WDNiR0k3RVFnOUtQOFhkYkNreVVPSmJqRXdlWVI5?=
 =?utf-8?B?WnFrREI5K01QVlV2TFdKRXFFTXF1NzRaN1RVMHBCbUMyb29vQ29jYmh3Nm85?=
 =?utf-8?B?WUFVd1VieVhEaHdoMWFZUy9sV1o4eEx6NDZtR0dQb2JIOUc4V2hmZnUzMCto?=
 =?utf-8?B?bzdCUEdNN2RYblVTa1UzRVBYMUY3TGcwUEtOZzVNY2hRb0lZNzJZYzBLanVo?=
 =?utf-8?B?T0wvNmZDbkFKZll4MFJhWmo1T3Q1dng5bGcxWW80RVhMZ1EyUHdzUzJCSURL?=
 =?utf-8?B?ZTViVTJvMjBJTlQvNnVjVklOQ056TXgvMjR0OGdhK1cveXpVc3dGV2hJL1lx?=
 =?utf-8?B?QnlXY0RlWU9GOGhxWTB2NGM4YUIrZ01vTkdCWFpVOS90d1ozWGRTTjJDUEF4?=
 =?utf-8?B?Zkl5SWh5dnJJaHNUWlh5bnBaWVNxYlZtN0F3SFhnSkU4K3BvYVRPdXM0dVd0?=
 =?utf-8?B?bmZweXN1RHdqc0FXVGx1WnBrdlN5SDNvZXNIT2RQSy9Zc3lrNUJ1TXpFaUpU?=
 =?utf-8?B?Q3F0anhGcXlxbGgzUjU1aGwxTjZkMWVOTWI5bDZFcGlZT01aMS9qb2JhWFJG?=
 =?utf-8?B?cTBUVThPZ3RuM1RBUlJCbVJJS2dJaXFzTU1Ja2lQTEhLbllDOHArczdtbjNF?=
 =?utf-8?B?bjY4TEplQ3loQk5JcjdLTnNDdGZ4bHBWUjJxaWlSOFFRbU9aanhkREsxMW44?=
 =?utf-8?B?Tm1kK05HVjVzcm0vTlc5Rm9la1A1RHZ4VHJwS2JuLzlZYWFZQnFiOFo2ZHlS?=
 =?utf-8?B?U1dJZlpnYU5yNER5azAybE1kaTh4WE5FZzFmOEdZcEozODd5YUtkUEM3amZT?=
 =?utf-8?B?a2I4Y2Zhc2hYY211Y3ROZE5HWnJxNUttUWZTWWM4OWpjOC9adVhDTDREeHJB?=
 =?utf-8?B?ZnFqazlDTzRyaFEza0M2MGRQaTNjUUJtalo0TWpYVU83RUEwMmE5VGVPeERN?=
 =?utf-8?B?akg2S2NTQmNVZCtsdHRnempPVGMrTzRUMjM4cXlrZlEwZFVKWmh4Yi9hRHJu?=
 =?utf-8?B?NnkzUWI0NUx2MDQ3aTl2WHYxdEF5RCtScWxySlEwc3lDNkFaTlg3NDA3RWlH?=
 =?utf-8?B?TW1kdU04cG4zNEYxSjV0VEhKancxNGRPbDQ0MXI4dVcwajV4MFp6VXg4Sk1L?=
 =?utf-8?B?UmRjcWVlODlSVDh4MHg5S21jV2VBOVdsSkRBUGhVc3BnK2g3Q290bEZPTEJS?=
 =?utf-8?B?OHpta09hNE02MU1WZ3pPTGd3ck1PdVhoSHhuNFRmaktENENoVzFRS2FtUWg4?=
 =?utf-8?B?d0YybS92Uk43bjdiZ0ZzVVpTcVFPZ1c3VnlvVGtETUlwdGlpeVAvOVp6aHVM?=
 =?utf-8?B?MzlFMjFWaUU3ZWd6RjZCZDFtNVp2NEp0cjV2dmpnWGdPSGZlYWRMUkgrbnVv?=
 =?utf-8?B?RmovSGlJNmpsaUFNU2RzaXMwRy9CV1o2bmE2TWtSRHBENy9Bekl0RVZ0eVpK?=
 =?utf-8?B?TngrcThpOE1xazhGTFU3VlkxemFKTEdsVVppM2hkcDQ3NE1PekhPQ0QvYmJS?=
 =?utf-8?B?Uk1Jbm9YcTBYR2p4MkNnY2pLSCtmeFI1aVBJL0ZTdUw5eDBRc3gvN0VnS0l3?=
 =?utf-8?B?R2xndWJkSU01WUN4ajcvRUNlalF2aitHS3MraWVVMjMwbmNsRUpSYVAxcmpq?=
 =?utf-8?B?U2VWck50T1ZGbVRTQ2hJb3FqbElYc0xkQ1J4QnJjQXIrQ29PVFZzT3dJcXdz?=
 =?utf-8?B?cWk4dThGVUM1c0FaNzAvZC8vay93d091SVlNcnM5N1Bsb3dOZWl6bE9VbFFP?=
 =?utf-8?B?RlloTHpYWjNpMDNnNDE5d3diYy9vK0R0cjdRUkgwT1g2aDB6b2YxcTZkblJM?=
 =?utf-8?B?K3FJQThiVVAzTHhhcVNHT2daZ3hnc1BqYW5lMUduL1pMSUNvWkdDcVBRVVl1?=
 =?utf-8?B?VFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: abfbda20-43bb-47b4-21db-08dcc3d87cc4
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2024 01:02:55.5127 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sX+P9WtnVWbB7xpwXpa2chXz1vEhLUrZlMycqI3YYSpO/njJlSd30oRjgBUZ9vd7d5Jw2Za/WacNLUAavH0GjtTsWuKIfzl+o35G7PjNiXc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6313
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

LGTM

Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>

> +	for (i = 0; i < ARRAY_SIZE(debugfs_list); ++i)
> +		local[i].data = gsc;
Behavior looks correct. This array is length 1 here so the mapping
works. Would a manual assignment be more clear for intended mapping?

local[0].data = gsc;




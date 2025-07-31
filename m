Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E2BC87FCA
	for <intel-xe@archiver.kernel.org>; Thu, 31 Jul 2025 15:56:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA19710E7CD;
	Thu, 31 Jul 2025 15:56:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nhdFUXY4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83FD710E7CD
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Jul 2025 15:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753977374; x=1785513374;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hJOJwkm7qG22P8AR0FzLME/FgGKRWgQP51L05IEr57M=;
 b=nhdFUXY4ZI9FcKLqaDzDrKK0hDV37mrPvhBGigZiVY9heHOnpdBZmuAD
 yqD3nv76e8rstocAI9CJfteYt6oE1wWfX4CvUQdGIcDIOqK/BgFsfXX2t
 Rk3Kh6e1l/HZfl2hDoPt4SE3loub5Iit0D6Aip3w6/u6+4fLn/vHAj4mv
 ChTbmW/3h04AvDVPgI0JeKNUgrw9MHzR9L9zS+wwu+w8mQwzCFXMkJ5r9
 RF46atPcW9fkT5d04euYPL+j2+9PPXtng3xxetbhk98eyl5G6SLcwjxjh
 YRCw7BCqzq344FPMD15PDXhD78evh6cAsGP6rKtK/gmCw6uJEZ/JeQ4CB g==;
X-CSE-ConnectionGUID: CUml85FmQ+m1tc2spK4ZLg==
X-CSE-MsgGUID: CfqDPPRZSDKvARZMAlkbQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="78857229"
X-IronPort-AV: E=Sophos;i="6.17,254,1747724400"; d="scan'208";a="78857229"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 08:56:14 -0700
X-CSE-ConnectionGUID: t+UcFrR7Rt+If3IoioWqKQ==
X-CSE-MsgGUID: PLMqzQMQQ4e8r3xsrn6ApQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,254,1747724400"; d="scan'208";a="167777204"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 08:56:15 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 31 Jul 2025 08:56:13 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 31 Jul 2025 08:56:13 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.76)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 31 Jul 2025 08:56:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TDXCUFd8mU3voBmXUHiWlTSdIdhKW2PQyL1iDDSY6BvFJhGdoD30Fz9Cn511cg4TBWusy58Mq86hYUlHhAr6AwU+CJ3/hKdlWgbdMiL4kuE6xR2eATqQfJo+awl/Y9VXVtml7MvF2DB0IxQLuxCQPZaMr5Q/dI7euBxcjKK8p0UmV2W7+CgDQzqIksysKfwK3urmKs7wkHcp2B0uRurt1XOgYQL2ElVGd7S6Is4VT5j0rOOsPRt+EL1lmgb7sri/bda7MjNhT360teil3wmUc3XNCxbOSJFVHfFBz1QEK/naks2itUd2ktVHR33psY0L31nly/b8LBNzvNI+7Vkr5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9CTWz2787bPIViSOCIceMuBom8Tf0fVkyan6GbM2zuw=;
 b=HzUFllknOeplxwv9+7ejJcU12k/Qf/r5spUlRx/t+1uSF4zuP+qvvm4GxxIMvJLuMgpVPE2Fo1O6PU7y1yDM+6faQG65iTWqYrvDlZKEnkCm458P+ONm14J0Fm4u/pYYZDgbuewWO8YO1wvKU5Aum4ZOSvxLpUqi0I66PzUEOX7+bqhp0Zg2VTfhApPtg2y93haBpQYdFiwcoUaJ4HE6ofrsPLxgLoOkRaxLKGHS6V3ddp6gz1g0ULIOStULUoOxRh5Duc86cv5apBqM5IH/WTFfbYcl5IE5oYFvWdG02XypeSu7D9xzl/N+O14VLKQt156F8/rtdun+QpAuGQkiMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by IA4PR11MB8913.namprd11.prod.outlook.com (2603:10b6:208:565::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.27; Thu, 31 Jul
 2025 15:55:44 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%4]) with mapi id 15.20.8989.010; Thu, 31 Jul 2025
 15:55:44 +0000
Message-ID: <22af562c-0348-426f-8112-b747a503bdb5@intel.com>
Date: Thu, 31 Jul 2025 17:55:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/pm: Disable RPM for SR-IOV VFs with no PCIe PM
 capability
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>, =?UTF-8?Q?Micha=C5=82_Winiarski?=
 <michal.winiarski@intel.com>, Anshuman Gupta <anshuman.gupta@intel.com>
References: <20250731153251.18864-1-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250731153251.18864-1-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0011.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::23) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|IA4PR11MB8913:EE_
X-MS-Office365-Filtering-Correlation-Id: 41eb2ec5-275c-427a-11b1-08ddd04ab540
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UEE2Ui9odCtsY0N1TW9DakFnVnhtdzMwM3dkYzA1dll0NDRkUlA4RUFpT1VM?=
 =?utf-8?B?Tk1YR3hjUEZjSk9lWlVtS3RPc2grQnpTT0crS1I2R0UySDNUMGtPZG5CeGhv?=
 =?utf-8?B?cmZpcGJkZ3VJZHBlVHJaUUI5cFZQQkFLaHk1UlRzOTBsRndicHA4RFZNNDgv?=
 =?utf-8?B?TCtzbFRDY2kxcWRiTURFY1d6cHZXL2Y0NVFtZVpuaGVBS3VDbzdTTEkvUnEw?=
 =?utf-8?B?QWF1S1ZOUjg3azRic1Nma3ZueGRqV2FWaUVXc3huTER4aDZOeHpPK1RnUVVV?=
 =?utf-8?B?MGc1UGd6OXFRa3NUaENpV05JYTdkVS9QMUxUTWRqMEpyMVBHQjBxbEExZ25m?=
 =?utf-8?B?WWFkQ0QvZ3BpOGlWeTlWUStJdXRVSkhSVng0R1NEOUtVamRkOWZPSUsvcy9p?=
 =?utf-8?B?Q2hYOWEvd3hDUmlwaWp4djBWUjBZU2llb0FqQ0dFMkxuUEFsRkVYSElncmJY?=
 =?utf-8?B?cnRVY1BwdWNsb3RHdlBHSHlOYUE4QUFhQ3RYQzB1ZmQzZ3hzMll6NEZHcVVw?=
 =?utf-8?B?MlI1L0lsTW56bENUdHdBVDBpQVlPYmxqSkYvekg5SnVRSGxidCs4czF1UTVa?=
 =?utf-8?B?QjZEVllDVlJvZ1dzQzlOTjdCV0VpUHlpeFdIR1g3ZGJVYXkvMlFhOFRDMi9h?=
 =?utf-8?B?UnIwSnJDZGY2OHIyQ0l4UmZmVzhBSHZjcmVLSXVsR0RtOHUyZi9BcXhjNGpy?=
 =?utf-8?B?VVIxVWIxV0srd1ZyRXVuSlNyUHFkTmI4MjlraHczc3BtdmJFd2VpUE1mTkZs?=
 =?utf-8?B?U2ZhOVM3blN2OXJDMno0aUlEeWMwVFpXWjBzNTNBNFpEWXdpbFJVempPbmly?=
 =?utf-8?B?YnArRmJVcnRERy90YTNWVGlnQWh6b2IyYllqMkxXWGtKc0xtczhCaDQ2M3RJ?=
 =?utf-8?B?Z01TY1F2bThIdW5ndHlKRDFINUFGb2tIQnlGQmtiaVYvYTBuNStjVXcwUEZo?=
 =?utf-8?B?aW9OV2p2N1RDdUc4ek9lUkFxME1aY0NUUHI3RGVReUhXNThWVCtsQW5IYVJC?=
 =?utf-8?B?UlZBUHJkbHR0T2FzbFhyK2Zlb3dLOVhYSFduTkw0ZlZpcEg4UzMyN0YwTGVj?=
 =?utf-8?B?VGhPTGYzMk1GaFZ1ZHU2VldwSUVBcHVMa2s3MFFtTWowY09DU1pGczU3SHoy?=
 =?utf-8?B?MGZDWm05Q2FGVEFLTGRxYUN5VG5OeURlYTl3Y2xGQUlZYXBiWkZWMzhWSnE5?=
 =?utf-8?B?ZkM4MG1ob2NYRzhUL1lGZVNRQXUramlQY2xqNkZlL2loM2d0NmZkaWNmcTdP?=
 =?utf-8?B?UWRqNUw3Yi9sTE1QMEZzNFplQTMvM2xBZmgyVEtreDBWcSt6OHJzSUhTWXVO?=
 =?utf-8?B?S1h6UVBDTEN5ZkVkOWlrdDhKaDBBMzZDUWNmeDRVSEF6Nm9ZaXdlK0tyNjlG?=
 =?utf-8?B?azFQRi8xMmxNblNoQ1VlSmwveTJ2RHAvaTZIcHprV1ZwaDZGVndLTFFpbnNI?=
 =?utf-8?B?QlRiQ3pMTEZzSWhiNE1nTXl3STF0emh1T0NOTFlGanJ1VDVaQmwveWZ3ZXBy?=
 =?utf-8?B?Z1BadW9VU1R5TENjenBhUWV2NHFHcXE0VHlmZC9Wb1RPS2pNVUNmY1hxNDQ0?=
 =?utf-8?B?U1haUWlMNUNScTVwRnhLRDJwS3Ewak1KSDZnK3ROdkdUTml3NkY4RnBMd1Yz?=
 =?utf-8?B?akcyczh3UzdIM1lHbk9IMmVLUEJzcUp0ZktrMDZzZ3JWRzJ2SzYvL3VkVGVZ?=
 =?utf-8?B?M0VJV0kzS3ovTkxwZ3FrbDVGQWxyYkF4bkZDYjVQTlNrbGJsdHBBOEtFajVJ?=
 =?utf-8?B?bXI4WC9ZckEyQTZseGI1VURlMldNdXMrUEhEWXhGUlRNNzVKb1Z1VjlIam40?=
 =?utf-8?B?Q1JhSDk4dVF0WVNKNllMQVQvQ0ZWcjhvbnJtMHNjUlQ4SHhIY2FKRzMyTXZ0?=
 =?utf-8?B?VGZkZE5LWVlwdER0TUJmRmE2QlJUdFE5RHpmQzY5emJRbXF2aHpGVHRtbnJp?=
 =?utf-8?Q?bnyPYyuu/xA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkNlZ29zRStVamdGK0J0Qk90NUI4dWJkSnpLdG00d3NGU3lBUjE4c2JSTXdl?=
 =?utf-8?B?RkZiME9TQk9WM25kQVJ2SjRUelZZdG5zbW92NjNtSmpVbnpJTVRDQytKMHc0?=
 =?utf-8?B?ZVRoVnhma2ticVRTb1RMQkhZVTc5V2p5bERzdzZHRzJHM2dPa0c5cnJhbTZn?=
 =?utf-8?B?ZVVwVWtSVTN5ZUJzOWY2RlBsZnR2bFJNNTBhQmxaSlVjUmFvUmhubC9wQXVq?=
 =?utf-8?B?Skg0SXpIS3lCZlE5YnFoai8yalB6T0JnVDBVeHcxTXUyaE5wVithOTh3TGh1?=
 =?utf-8?B?M2xOT3VER2wvcW85QTVkN3ZFUGFKb2xpTkp4VWhOY1A2cHplS0RPK0E0Y2FQ?=
 =?utf-8?B?Wmw0ejZldUVwd3ZTWmF6ZmVjYzVGeTJsOHR0aHppQTZOeWNRVXRreWNXQ1k3?=
 =?utf-8?B?c3loMktrcDZVdjBvWW1wRUxscGZEQzNnRjJBZ2NmTGZoMG10TWtzeitvczNh?=
 =?utf-8?B?c1dGSENaY3pXMFozU1hueTZpbjVvKzZyVk1aaXl0bmsvUVpJZ0hBMThURzd0?=
 =?utf-8?B?QzZHNVNxUWtycm5IOVNDSEJoQkhDNkdqdWt4Mjh3MkZJRHduZDZaa1hXd0F3?=
 =?utf-8?B?c0VDQ1JqdTJXRU54bEdTZ1pBRjkyVWorTEh2VTJvb1UzeFhlQW1UdGlVeGV0?=
 =?utf-8?B?VlFZWUpaV0JkaWgwRmhYOUJqUjd0Z2pBWW44U2pSZVg2T1IzVkNXaktpOE9F?=
 =?utf-8?B?V0JybzdsdEdQbENIYjdaS2cwQ2Qzc08vVTE3SmxhVkc2MlhNOExoNitTVGtH?=
 =?utf-8?B?STNlVEJEWWdkajVpY0t5SWZ4TnpXWnllMmRaUUxid2RCWVpObitCMGk5Vkwr?=
 =?utf-8?B?WThLUnBLQXJ4bFUrL1daUUJRazdyTXRuK053VlNTRVdXMndoUzVyS0I5Yjhw?=
 =?utf-8?B?VW5wbmV2LytoVkJjbkJCR0xycG5BN1QzcVpPV3V1U01DNDg3Vnlab1piUHZ6?=
 =?utf-8?B?cDNZTWd5a0lIZUN0S2x0c20raEJoK0RERU5wS0Q0TDlycHJtMHo3eHlORFBV?=
 =?utf-8?B?MTZ2R25OdjFvRGdTcWlsWHBKaTlteStodmtJRk1VS3VqbEZFYXYzY3BCbkZ1?=
 =?utf-8?B?YkExb29qbTluMDZuNHd3Z2VMZjk1YXVqczZEQlQ1R2ZCbUNHN2FPL2NyOVBq?=
 =?utf-8?B?OHVVL0JWTXYwUU94MXBERFpOQnVhZXhHSVZRL3g3NUpyVXFEM1lvTDJHYTBt?=
 =?utf-8?B?dmc1U2dDcjFLRnBNWjZPdFcwOUszTTFmM1lCNkdSRGZkcndKTmQ2dGRYWHFL?=
 =?utf-8?B?YVFnaDVWTUdnVFU2MHVCWnB3TlhOY2FYRllDWlY0bUUwaVVLM1RlTFMrR3Mv?=
 =?utf-8?B?Q0lQeSs3aVh1NDYvVGJWSHF3WXJ4NlRaM04zWUJXcTBmVzJkQytXb3UzNXJO?=
 =?utf-8?B?ellnamR4S0ZtRmFhaDNIUDVmZnBPUGhLMzlMMC9UT21HSW9MTWlTQTBTbStz?=
 =?utf-8?B?RUY5VUhsb1FxV2prbGZCZUhhaTlzRWpnZ3lXM0RJSVNBSHFvQjM2blhYdVA5?=
 =?utf-8?B?OU9YUlhqRVlPN3lQWHBZVGw3WSs3V0VWRGZOdTJObTJwNWVjdk94UmtpS3pm?=
 =?utf-8?B?VE94Uk1kcHJsb0t1d2ZoWHZERVZaNHVRWHdRaGtwVVRyNnplU21ERnIvVXc0?=
 =?utf-8?B?c0VTandvWS9tUkNmUkFrMXhlcS9PREZhUit4WkFMeHkvYzdTUkxZK1RFRTh4?=
 =?utf-8?B?VGx6YlRHNHlSR056bnR5bDl4UUdpWTZVZ1JIcnJFV1RFT0dYTE9Kam9KWUoy?=
 =?utf-8?B?T1AySC9hSy90MUdaNTNKUFVLZnl0S3FSRDhxQ1RwamtHUjU5b29CeU4wRkZQ?=
 =?utf-8?B?THV3SUdYVzB5Wjd0b2taM1FYaE1Tem9VZUttY2o2SlpNNUY4bWRpdlUyOGZh?=
 =?utf-8?B?TUYrdWI3ckhSMUxSRy9LenpXMVM1NlFpRnhEbUhHQlpxUEZGOUcrcU5pcGhh?=
 =?utf-8?B?eVRQSlYwTFFtQThhdnNTN0tuSWY4Q2QvU0xMWFJraGpWWmhUWS81R1JTTkJj?=
 =?utf-8?B?Vjh0SGZnaDRTRXlvSUFudjkxME5MU0dKMXUydmNORW91RmlMbEErSmxuTDV5?=
 =?utf-8?B?NnFRZDh3Nlh0bGp3eVNCWERUU0luYlFmOVkzS1RIc2c5U3NoQ0xSNGt4OGhU?=
 =?utf-8?B?TUFNMUExVW5CMS9ROHhxRWUrdHVpM0JWL3k5UkR4b0MwRmp0MnByaXp2OURk?=
 =?utf-8?B?SFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 41eb2ec5-275c-427a-11b1-08ddd04ab540
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2025 15:55:44.6148 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jPDHSlaYaVdhzji+t+Y3GKU/5g3VxzfAfIlIw+2th5r8vpcHKCxcfAdOMLAso93o+ymL7VU7kSNskderydd5RUDoFDPEhnSqvOUcmZe+wgg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8913
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



On 7/31/2025 5:32 PM, Satyanarayana K V P wrote:
> Enable Runtime Power Management (RPM) for PCI Express devices by utilizing
> their native Power Management (PM) capabilities. The specification (as per
> section 5.10.1 in PCI Express® Base Specification Revision 7.0) mandates
> that Virtual Functions (VFs) without Power Management capability inherit
> their associated Physical Function's (PF) power state.
> 
> As per PCIe spec "If a VF does not implement the PCI Power Management
> Capability, then the VF behaves as if it had been programmed into the
> equivalent power state of its associated PF"
> 
> Since Intel GPU VFs lack PM capability implementations, VFs power behavior
> must mirror their PF's state. During VF creation, the PF remains active
> from the PCI subsystem perspective. To maintain consistency, explicitly
> disable RPM for VFs missing PM capability to ensure they follow their PF's
> power management status rather than entering low-power states
> independently.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> ---
> V1 -> V2:
> - Disable RPM only for VF devices when PM cap is not implemented.
> ---
>  drivers/gpu/drm/xe/xe_device_types.h | 2 ++
>  drivers/gpu/drm/xe/xe_pm.c           | 9 +++++++++
>  drivers/gpu/drm/xe/xe_pm.h           | 5 +++++
>  3 files changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 38c8329b4d2c..3bbfc46044a0 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -285,6 +285,8 @@ struct xe_device {
>  		 * pcode mailbox commands.
>  		 */
>  		u8 has_mbx_power_limits:1;
> +		/** @info.has_pm_capability: Device has PCI pm capability */
> +		u8 has_pm_capability:1;
>  		/** @info.has_pxp: Device has PXP support */
>  		u8 has_pxp:1;
>  		/** @info.has_range_tlb_invalidation: Has range based TLB invalidations */
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 44aaf154ddf7..5e6311964685 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -244,6 +244,9 @@ static void xe_pm_runtime_init(struct xe_device *xe)
>  {
>  	struct device *dev = xe->drm.dev;
>  

maybe we can put some comment here?

	/* enable RPM only if device has PCI PM capability */

> +	if (!IS_RPM_SUPPORTED(xe))
> +		return;
> +
>  	/*
>  	 * Disable the system suspend direct complete optimization.
>  	 * We need to ensure that the regular device suspend/resume functions
> @@ -265,6 +268,7 @@ static void xe_pm_runtime_init(struct xe_device *xe)
>  
>  int xe_pm_init_early(struct xe_device *xe)
>  {
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  	int err;
>  
>  	INIT_LIST_HEAD(&xe->mem_access.vram_userfault.list);
> @@ -278,6 +282,8 @@ int xe_pm_init_early(struct xe_device *xe)
>  		return err;
>  
>  	xe->d3cold.capable = xe_pm_pci_d3cold_capable(xe);
> +	xe->info.has_pm_capability = !!pdev->pm_cap;

if this cap is always available from pdev then there is
no need to cache it in xe->info

> +
>  	return 0;
>  }
>  ALLOW_ERROR_INJECTION(xe_pm_init_early, ERRNO); /* See xe_pci_probe() */
> @@ -364,6 +370,9 @@ static void xe_pm_runtime_fini(struct xe_device *xe)
>  {
>  	struct device *dev = xe->drm.dev;
>  
> +	if (!IS_RPM_SUPPORTED(xe))
> +		return;
> +
>  	pm_runtime_get_sync(dev);
>  	pm_runtime_forbid(dev);

I'm wondering if maybe we can get rid of this fini()
by using managed versions of the rpm functions like:

devm_pm_runtime_enable()

@Rodrigo ?


>  }
> diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
> index 59678b310e55..ec6291dad019 100644
> --- a/drivers/gpu/drm/xe/xe_pm.h
> +++ b/drivers/gpu/drm/xe/xe_pm.h
> @@ -9,6 +9,11 @@
>  #include <linux/pm_runtime.h>
>  
>  #define DEFAULT_VRAM_THRESHOLD 300 /* in MB */
> +#define IS_RPM_SUPPORTED(xe) ({ \
> +		struct xe_device *___xe = (xe); \
> +		___xe->info.has_pm_capability || \
> +		!IS_SRIOV_VF(___xe); \
> +		})

this seems overkill and unnecessary

>  
>  struct xe_device;
>  


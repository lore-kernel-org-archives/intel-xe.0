Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F59D73E83
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 18:57:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C99E610E275;
	Thu, 29 Jan 2026 18:57:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UIwCWOQv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5C1610E275
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jan 2026 18:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769713032; x=1801249032;
 h=message-id:date:subject:to:references:cc:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3n7WmTJAkg0PylIImTiJXKZ7lAEHsv9da5saADXocUY=;
 b=UIwCWOQvpFGYjQFiz6P1ooxgii5GJoAuravToYqi43tMZQCKSyCr60yV
 dtqESil625mWmRtXg6KKNR8s0Z/61piMD2t9u6QItHZaKZ2MlBv2/9YOH
 GdSlATwufmulsWxZgGAuo+SMPRkyode2j7jxiTcY+rOMp6zhDRmZsLv7T
 HWKRUP0OMDpyWLUpN8oKp+tURruz/R8eYjdv2WYuSawV+wn2yFqJpwjsc
 44WdqSayUGwskr/bp0u552AtMuZvPPQ1Ww+QPzW0ne1x1MNMv3+UxcPOt
 tUEq/QWn/Z1zQnnW8oLwmLgUZku4Fmxl/zhKQyyGk7iR7jeU+P33Y1YZP A==;
X-CSE-ConnectionGUID: UuFQMXWzTUWCsY3KClRUhw==
X-CSE-MsgGUID: LuQ5tDh0TiaXN9NDaeG4kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="82071678"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="82071678"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 10:57:12 -0800
X-CSE-ConnectionGUID: PcSzWQQ+QOmUV8UmITNgdA==
X-CSE-MsgGUID: PdUy+a+8RoSyJcTtWZNsDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="212740348"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 10:57:11 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 10:57:10 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 29 Jan 2026 10:57:10 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.53) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 10:57:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GE416+2miljPuPhKfuDAt06XjlNM8J4BihHCoOFNczcD1f2PWiN5oJFVuMDgV1BsR1GlG+IKKqcT6i8iEHMW20u+p9Zvq5O80SxFkr2NAxoeQrXzoX1kGKN40hdw7zOcVsPbnn2b9ByZI6dTm+xXNTZxZ5EYRfJFaZurO3J9j34pJxaNdvKHRQuUpsoJGUnoiqUHYKAkZ4TyfTULk5h1JRJJpQ6ok7qHjs2aZeise7C/nBUrHGwXW0yKP0e7IOa4zn8c6/1pvv/JK0N7HGLWXYHnX9eoORorMUOJdONK7uVhn/+x70XmqQCzVmKXc8HG+eK7haYogW5NikPKw4VINw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2AZCxPtL/LEe0yCIjPI7zb6Up9CNc+xjwNYjCNkLfHo=;
 b=HlVT1RJcAMMNLuTPVG7OtUduby7JV2zsYBYvi0Wn8rqK1P2+WdEgHMwVBjAcGGSBJ6IxUGn0EjQQR0UeQ21L40PVOvWvCCsdmxfyaasMqI+5SkcIH5AqLIIOnonJ11gLj7gA6AVE5hwuGHVuBD68dgygFedBTNiXm+1T1T+DzTPfj32hmWqdpsJVGBPcurYkf6tNDuSQSvj0vWqx5DI2kBFomfdpMuSx/cMMfYRO0MIkQuFHOisTaYqnlT7RfXAsC/Xwbz1N6EnzJJH7puH5Z+bhauQ3lu4KVTFmiND96D5uc9ZB5EtFIh/Jbng1iBWsQvZamOhMvNiyrHt6KUzUOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SJ0PR11MB4973.namprd11.prod.outlook.com (2603:10b6:a03:2de::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Thu, 29 Jan
 2026 18:57:07 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 18:57:07 +0000
Message-ID: <28cf2675-88ed-401d-a599-50ec5b16687a@intel.com>
Date: Thu, 29 Jan 2026 19:57:04 +0100
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/guc?=
 =?UTF-8?Q?=3A_Make_MMIO_communication_more_robust_=28rev2=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20260127193727.601-1-michal.wajdeczko@intel.com>
 <176956889595.198158.16853758417207901997@a3b018990fe9>
Content-Language: en-US
CC: Matthew Brost <matthew.brost@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <176956889595.198158.16853758417207901997@a3b018990fe9>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0023.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::10) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SJ0PR11MB4973:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fde8f2b-f60c-42c7-a100-08de5f68331e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bTAvb3R6ZTl4VjB6M3RaR3hHQWJ2eDhXZEpQc1YwY3BvUENhNVdrbkx2RXhX?=
 =?utf-8?B?ZEZjN01NWGJXd2JKRGo0ZFFjc2ExZFhoV0hLM2IwbU5EdWNSdjZoOWpSbjVj?=
 =?utf-8?B?MDlEamNDSCtjZVlTcXRsNFNPSXVGT2pqcFA1VDgwQm9LbkRkV3pxblFHTlJJ?=
 =?utf-8?B?SDM2d3hlOUJqWitQRG94TmtDeGExd3pjY25FYTZXUXI4MzYrQktYcEJLME9F?=
 =?utf-8?B?L0ZIbVloaitZKzJHYm5ra3BUSXdhSUplVjM5cWhBVE1KdlEvWjk0cXQ3SG03?=
 =?utf-8?B?N2tUSFNFQkpmUUllMlQwTVVJeStCdWE0cnVMK2pCOW1va1hCaTZOWDZwRCtB?=
 =?utf-8?B?SlI4QkEyZi9MR1NRcnhTeWh3RFZ6Sy81T2lSYVVYWkN5amczNm9MaW9yVHZE?=
 =?utf-8?B?WEE1dVBma1BDalAveVo5RHBVQ3p1NzI2Y2Q1SUpOVWFaa2VGMDVrUlRLaEtl?=
 =?utf-8?B?UzFNa0EzTEVOWDR2cXNaVEhEM1J5Wlk3RGVpUTRRZC9HTWFCeDlFTkhNczEx?=
 =?utf-8?B?clRvRXQyMUtBTWNhdGtLOVdNZEdnbC9TaFBUUHhlTHB5YWdGa2tnV09VYy9C?=
 =?utf-8?B?U0s2K0lvMlZVbFJhWktuN0tuQXhtbTU3bHpWcXBNdzdqcVN0K1dqNVRUdWpt?=
 =?utf-8?B?RDRLeHBXT2JTNEMxdXRvcWUzTW1lbzE0aC9ySm9DdXhDcDNyRjZneFZ1TVhK?=
 =?utf-8?B?TitGNDZ2b0dGZUo0U0JtdkI2Z3RUcmhXZ0R1M2krRjZuVnhkdWE4VUtJdkxX?=
 =?utf-8?B?TEpNS0h2eHdWbGhmclVFcWR5dkQyTHZGQkY1VFMvaEtGMHVadktQNG14SW8x?=
 =?utf-8?B?TE92UW9jK1NVenA1NHY0SUlmcDBtOXdPbGo2bUxtbDNLY05Ed25nSW5WaGIz?=
 =?utf-8?B?cTFIRHdNSnhSSU9vUXBXdFZHWUp0V1ZXUHhDS05rUTRUUmlwaGwrMk84dGJI?=
 =?utf-8?B?Vm1rZnhENlF0R0lhaW9yeUhEYW9EZHEycHh2YzBSSDFLenJGWU1LamthNWdR?=
 =?utf-8?B?NDBuVTZha3k2SmZjbFN2R0dLRXZJMGZ2a05EUExZRE5MQXU0c1VHTmlVZGxp?=
 =?utf-8?B?U2lncWVtb05TYUNpeDM1TWU5TkdZYjBPZW1JbWFDR0JlK2U1RWVrdFo3RUFs?=
 =?utf-8?B?TCtUWjVrQ09MMklXdklpT2R4RVAyMld5SWROUDNEdkVYc2NZTTZSZG9lajBC?=
 =?utf-8?B?bDdmQVJ4TnRESytDMVlEaFNZb0FITWVjb3VxVk1qWiszRjZLek5zbHFOYVh2?=
 =?utf-8?B?R0UwRHhUdFR0eEVuYStJOG9JUnk5NjdSRUlFU28yYkhjbzRiVkZpbVIyaVlv?=
 =?utf-8?B?YldsK1ZWdHdUeDg2bUJnV0tGU2FFeGc5dUd5S25xOWdDZTlJcmpzUlM4RVJw?=
 =?utf-8?B?TnBqZDI4QkFMT1owVituV09DUlk2SjZvc2tSV2o3bXVvbzNvbTQ2QkRPcHA3?=
 =?utf-8?B?WXYxMlBBbUs3dUNpR21tQ0tVNWVBZDJmZ2RHc3duVE52bUhZa1FtUWdKTW5w?=
 =?utf-8?B?bHNJeUtBa1ZmNFhONFh2SEpDaTFDbVAvb21RaXJvM1NXWTJzaGJ3YURBQW9w?=
 =?utf-8?B?V3RHZStKNW5ydUd4aGdxOFhXNVR4Z1YzZ2doM3RDdGFOSUFVbThuR0pXY1Yr?=
 =?utf-8?B?YWNwckUzK2U5OWs3ZVhSejFQYjJ5SG5ya2k5TlZmR1VKamJ4QS82clZVMmJw?=
 =?utf-8?B?N0hPcGZmZDFCQmRoOExrS2srelA5bGZBWVpTRktsV3lzbzB0RzcwYUxMWE1I?=
 =?utf-8?B?VHI2alByZVBGazR2cEJTZWh2MGthT1pBZmE0NmdGNWlUVERyckhoUEo2RlNa?=
 =?utf-8?B?S3k3ZXgyNG4xQm9PSVJkZWFueWhZd2Z4cW03L2tFNXRVVG9keHRuaHlrS0lR?=
 =?utf-8?B?VlpmcG5GdzRIVXgvR2crWVRwZDM0cDB5cW15RUhzTkFrWTNVaGFNdVBHa1Fp?=
 =?utf-8?B?RkdtMHVKWUJuTlhyL2IrVlhMbEpKMnEzL0poYlBvbk5YaTM2ZWJLdmlodW5X?=
 =?utf-8?B?MHFWVnFLRUdvMnpneXNKaE12eThYTnhqaWcwSERNK3Z5eEM1TWdSWTJIQnpt?=
 =?utf-8?Q?jMsbJK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QSt6dkZYSzVDcWhmK29QdWYrWE9Md2FvZXNYWDExdVIrWmdzTytVb0NZUGtG?=
 =?utf-8?B?dEhJNldUQ09UZk9CRFgyR3J6WDZLWU9RbU85NGNTYXp1Q1dTR0JQa2dYaEsv?=
 =?utf-8?B?TXlXbWI0dnN5bXZ1MHBubW83V2NPZzFWampRWmlJVlhNUzc3N2tEWU5oczRL?=
 =?utf-8?B?Q0VvUGFDekZWQ0pEZGVVbDlnVWhkTGErZk15a09iaHVrWjE0WW5XUkxPb1pV?=
 =?utf-8?B?RDkzQVBIWjA0dkx3T2wwNVgyMzJucEN2UUxXWWh2QVgvSDBRRGIzb3pwQys2?=
 =?utf-8?B?RzhLQ1ZOZ0ZiVDJwQ243ZzQ4L3ZUYzB0aVNsL2ZRLzlJQ3RMd1h1V3dVOG1V?=
 =?utf-8?B?V201SHprbFpuVzlBcG8wcHhXNE1rSHFjZW9sR25KNEwwOHFJVENpK0k1QmdU?=
 =?utf-8?B?TERMOGgwT2N4Q1pZKzdUZVVCbjdPV1NSQlZ5K2pqY0JoQ3VtbVBYcTExaFFZ?=
 =?utf-8?B?REZMV1Z3OHRFVXMzbmNPLzNxUG5kK3YvdmFPcnNiZGVSSUdrWjFHbDhMRHlp?=
 =?utf-8?B?WlBnT0ltUE5JT0htTXhrT1FNT2JRTEszRkhvNkVIbUJ6d09JbWlIc0p0Mm9G?=
 =?utf-8?B?WXV6TUw2dUhNYmt0bFdlMlgxcHpKTms1dzRCMzVFWHgvbWlWNGFzQmRnOFNN?=
 =?utf-8?B?YVp4aG1MZGxlcnZJOUY2S1pqY1lKQWsxb2h6VHBZQWFDQ2tvaUR4Y1drdGJa?=
 =?utf-8?B?N3VYb1RxWHVWTFVFMy8rOVl2UUVMckI5Q0RjVnRJUXNXT1d5SDlJUmRERGpE?=
 =?utf-8?B?dGtVZ2I4blJ1M3U2endzbHQ2d21CVlh5N1c5d0hxcmhlNDNWTHFMQkFRVmdF?=
 =?utf-8?B?aXZ0VWFrQlcrSTdHMWl6T05LTDBTSlBBeStndnU3U3BSWkd1d3g4VTA4QTh1?=
 =?utf-8?B?YXBnT2RYb01jeWovRWRTdUsweG1hL29xSXFXYkhNd0kyMkpEbkNvOGRuSjc4?=
 =?utf-8?B?K0JHc1dycnk3RUN2UE0ybDFYb1JMOFlTN29IeHBjUEtSc1NEU1ZQeDczcU1G?=
 =?utf-8?B?REpndncrVTNmNXZPS0xoTWgrSWxYRklCUm9lc1JPUEMxNS84YUxtQkVuNkYz?=
 =?utf-8?B?Tm9lR3FSbTZaSEhVNlNVR1N5RmJ4eTgraEJvRmYzcitwOW13UTA2UFFIdity?=
 =?utf-8?B?Q1o0TlVGNU8zVm83Q0tLNW9iWVFMZDQyWnlhUFFOTDFKd3ZBTWRsN2hzays1?=
 =?utf-8?B?anlyZUlXZUxFak4veTdOS1ZYb3JoT0dKeWJhSzdNcExHM2ptaHpRQzMwNTdG?=
 =?utf-8?B?Ly9CRXYyZU1IRzMxVEt5RkdCSVU2cTRwdXA2RlFpNGtLTUZnWDhYTEtNVUFl?=
 =?utf-8?B?TW5CaU0zYTRUWFNiRVA3RjFoelIrYWVQcHdRaVMreFlNVXhoSkZjV2hHV1hv?=
 =?utf-8?B?cHh6cmYyTWZEai9RREQxWHVzRE9ySC9zWHRyM1hIazQzay9lVXpjWk9TYXVy?=
 =?utf-8?B?WU9zbm9zTE9tNVZPdzR3cGl5dkhrMzBWUEl4MitZTVN6NmQ5U1lLVGJnTDY3?=
 =?utf-8?B?TkF4UFA1emtsSG9tYlFvM0IxODVTcE1rSk5TS1hmbGhBQWQ0UDVkcm5qayth?=
 =?utf-8?B?alBPNjdTNjFqWU5OSFUrL28xbXF4STJQSlVpdXVUUllWVi90UElzZ003RGVu?=
 =?utf-8?B?b3BqcEMrOVN1aUpjSGNVbDBOWjE4SGVRTDNpTjJEOGMwaXhMZllXVXUzUWIv?=
 =?utf-8?B?YXFXTXRYaGg3dUF4cTUvRStHRU0yTVIrbytzcmQyekNIUmNiTmRNVDdhaHpR?=
 =?utf-8?B?RmN6VVlmTnV4bGlrMHJkRWEvSExIQmJHOEpMWUY3WU1ZdGJNNFlWUXVET0xO?=
 =?utf-8?B?YkRrSS95emdPczhMelRrUklaZlc4MzVodWM5eG5MZVhSMmhpVnp6K2QzTDhE?=
 =?utf-8?B?azhrSjRoeC9wOUtHbU8xVWtHWU9hQ1ZtWkwvWmduMHlYOU1WYjAxL3ltUHIv?=
 =?utf-8?B?YlBiSVlTa0JNeW1OYWhEL2NzYUowaHo1UHlCSHJ0ZFZXczBuRXZ5TWMzTVYv?=
 =?utf-8?B?UFBuQm5OVXMzZDdDK2ZkM3NnS1Y3c3ZPTHdxaVN5Q0NsME8rYnJScGdNamh4?=
 =?utf-8?B?WTZEaVVQcmZnK2wwelQzUVBLS0lrY3o0aVRjWG1wZGgwSVdnd1NqU21sOFV0?=
 =?utf-8?B?SURUM01SVFFYc1BSTDJWcEtkOTZoa0JOYXljeUM3QmMwc2R4aTFUb1QzT21E?=
 =?utf-8?B?OGRDSDM1ZzNoSG0xclAzZm5nVUIwQjd4UDdvcmI1Y09XT3RvRUZoN2ljWFNN?=
 =?utf-8?B?b25LcGk5Ynloc2t1dk1OblhVdHZnK1lmY0J3eTRYa2xGRmdzOXJRTHBUNW9I?=
 =?utf-8?B?NkZXNjdjS1FkVno1clUwTVBCVnF4eXE5Mm12MmdYQUJnQzR1eUllb3BNOUp3?=
 =?utf-8?Q?Dkx4tJ4YqhfsWV8Y=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fde8f2b-f60c-42c7-a100-08de5f68331e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 18:57:07.4490 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l0uDURMUPiVi3gRK6GTzdFUAq8/2SwZvua/YJdBz84yeTIzttV84aQICu09Q8pvb6GqFY0oXddEBbK15BYJQGj4A+DOf6Pd3JMXvr9f+dYE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4973
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



On 1/28/2026 3:54 AM, Patchwork wrote:
> *Patch Details*
> *Series:*	drm/xe/guc: Make MMIO communication more robust (rev2)
> *URL:*	https://patchwork.freedesktop.org/series/160377/ <https://patchwork.freedesktop.org/series/160377/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160377v2/index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160377v2/index.html>
> 
> 
>   CI Bug Log - changes from xe-4456-e8c6d90736933d657ba897686e407f5b9a5058a8_FULL -> xe-pw-160377v2_FULL
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-160377v2_FULL absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-160377v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (2 -> 2)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe-pw-160377v2_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@xe_exec_basic@many-bindexecqueue-userptr@bcs0:
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4456-e8c6d90736933d657ba897686e407f5b9a5058a8/shard-bmg-3/igt@xe_exec_basic@many-bindexecqueue-userptr@bcs0.html> -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160377v2/shard-bmg-1/igt@xe_exec_basic@many-bindexecqueue-userptr@bcs0.html> +1 other test dmesg-fail

<4> [527.456421] xe 0000:03:00.0: [drm] Tile0: GT0: Check job timeout: seqno=4294967292, lrc_seqno=4294967292, guc_id=2, not started
<4> [532.575325] xe 0000:03:00.0: [drm] Tile0: GT0: Check job timeout: seqno=4294967292, lrc_seqno=4294967292, guc_id=2, not started
<4> [537.693881] xe 0000:03:00.0: [drm] Tile0: GT0: Check job timeout: seqno=4294967292, lrc_seqno=4294967292, guc_id=2, not started
<6> [538.335399] xe 0000:03:00.0: [drm] Tile0: GT0: Engine reset: engine_class=bcs, logical_mask: 0x1, guc_id=2, state=0x209
<5> [538.336026] xe 0000:03:00.0: [drm] Tile0: GT0: Timedout job: seqno=4294967292, lrc_seqno=4294967292, guc_id=2, flags=0x0 in xe_exec_basic [10427]
<6> [538.360634] xe 0000:03:00.0: [drm] Xe device coredump has been created

but I couldn't reproduce it locally, so lets rerun



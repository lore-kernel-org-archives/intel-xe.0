Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F385C3601E
	for <intel-xe@archiver.kernel.org>; Thu, 10 Apr 2025 22:40:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D1410E198;
	Thu, 10 Apr 2025 22:40:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eZv2RvwF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21F6210E198
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Apr 2025 22:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744324818; x=1775860818;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=pJazIyyb4gNmABTI97Oc6nGFRKwzo/rnQpqIstWSeg8=;
 b=eZv2RvwFLT1R4Ad07zJeECItEmbfmkN7pKckSrLrdPkdudxmrDiX93M8
 JJMAwBpwL52zf92BirluPWLD0j5LwIhrKW9Yzr/nh9gyuZkLhk58t27sU
 +OKljK/7zdzQsRTgl1lJzNLAXaCMNExhzmmGuM0+Qb8nR4s6e1MXz817j
 aqYyGq7RTdbrQQXIyPbJiMKp7J+XGLhG1NPzm+mZSemQAKmudJGF3/CBf
 /Okc5pUfTVGxzdrNf6AwdSsysOIsZCVT/guZBTuJpOABzm+Z4L3IYewR5
 OmMQtD+Sfq45x59xi5NhFaNtF8m/ohuh4iR3Zf5pg9AhF8BFQUkP3T1D0 A==;
X-CSE-ConnectionGUID: SX+W15wJR7O7rIp2ztxPuw==
X-CSE-MsgGUID: Mkfs5OA9Ru6R17oIHoZiRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45576635"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="45576635"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 15:40:17 -0700
X-CSE-ConnectionGUID: Q2C2fuY9RfCbGkJkM+TkTw==
X-CSE-MsgGUID: V4dNvo4IRD6+wyp7hYFY7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="129575586"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 15:40:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 10 Apr 2025 15:40:17 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 10 Apr 2025 15:40:17 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 10 Apr 2025 15:40:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zQOjedbK8NjYuLIHKIBU130yxTeZOMcC9lFwVKJoKsV2e473/RMvRE3r6RVodhFBl8Q5wKr0DqznixC0XwvCJZ+7IpbuC/pQbL0tSfwcpXBLuf+cVmtxeLBdv1Jq7P4wcwG/pg1mylnUmF2uWRBslxJdnR1wM/STuetOlgafGIEhpuFKOv8RV9ZgQUskwtFt9g4oBufxqSlRWcET7+r2Yaqw1dXw3cK61jlsdIjysxCu9ih556R83D471GtNenqI3tqPXUZwbzF17zqM1ZlP0Acl+ljd69AZECeYz8wLUYeWGpuzDeaTBf8htbzpi2IxJbtD+4g4BdEOlB4q6Jmh5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mqBt2x+L0FQGzX7qGO/sx1Rzuaa4bLL/xQaIZNKXQqM=;
 b=bm3iLVmP78/c3IuMfA9btPpXsIaRz5sCTqYEm/PsQrJ8JUc6PR5d8j/qVZpOIqBe4snRSl6+8S1DIS49XZWCSo/BK1Gedyeacc9H7VcFgq5VGy031mwSoV+51fe0Y58qFbwAmzQgjnJ/FcRzBSdP53UmDbUpwiiE+Unucj6UVki/EGIAHUR1fV/ccbkfFhMDgPFH+a8DE2Jo7PEn/8IjiwU1ExkXfYWPiYeOj4QBae8zDp3wd7h4oOHTNeCUT7mLsGMakLK0NbkaPcwNKlcjiVmLCkZL25Tl3BjGE3S1Df6i2vDlK56JZN87pbxvEnzcJsjLWRECiSQDc8iDb0oxcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH0PR11MB7423.namprd11.prod.outlook.com (2603:10b6:510:282::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.21; Thu, 10 Apr 2025 22:39:45 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%4]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 22:39:45 +0000
Date: Fri, 11 Apr 2025 00:39:40 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Allow to drop vram resizing
Message-ID: <qtuvmuvy72km4l4vf4vgzcmnhqyhej2rsif3m3yyqott53ekst@tsby77prowvu>
References: <20250409-bar-resize-param-v1-1-75bf4df38aa0@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250409-bar-resize-param-v1-1-75bf4df38aa0@intel.com>
X-ClientProxiedBy: WA2P291CA0021.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::29) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH0PR11MB7423:EE_
X-MS-Office365-Filtering-Correlation-Id: d37a247d-4ffc-4ea7-a63e-08dd78809685
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cWF0ODFGNng5dGxqRmhkREo0ZWpkcS9lK2RvSnNvUE8raWpibC9US3NXejVa?=
 =?utf-8?B?M3pUK0Zmb3B2N2FjZXRxelg5eUZSdVJ2S0NMdXo4TUxPbjlmektPdDBCSWJJ?=
 =?utf-8?B?d2NZRTlDTHlQcVVwblhUQWJEUTZWbFBNMzY2alJZUDQ5OFdqTGNjRkxQN2V0?=
 =?utf-8?B?NkplYktQREJtazdDUzFYVkFXL3hCVkZ5Y0dnTFVuRWhkcmpVcy95MHlGNUZE?=
 =?utf-8?B?V1FJMk9Ed1VtRVArWG5Dbkg1VCt6MVljVzNvT3l0a2RqT2pzOWtnUmtlNzFr?=
 =?utf-8?B?RGJXcjIzOU1OZDVpNlY5d1ZDQ2s4YmR2RGNnTlhNSjVJT1JXR3B2UzVjUXNU?=
 =?utf-8?B?VEFYbnVCMUF3R3RWdlFTeHR2RjRBc2pzNlFDSjVtaGQ2U2MzK0IrZEp3ZnY3?=
 =?utf-8?B?eEJKQ3F6VStINW5sSXc1ZkN2YzZnUElhejMzUmloR1cvZms0cDZoWTVjUEs0?=
 =?utf-8?B?M0lpeFFzbldpc2RYN0I5KzR0TmJDR2EzNHdHc2VWTm1SdnNVek5uNWR1OHMy?=
 =?utf-8?B?dnN1L0JGQURqcmdURmxLQ0MyaTZZR1ZKZzZ6QzA3MC8rbi9Pc2FOMUNDdjhI?=
 =?utf-8?B?ME1IQlR6Q2sySmRZSEhKUERzQkQ3N2JIUitabnFJREd2OHRDeWNsSnlobkNN?=
 =?utf-8?B?Yk5UeXNyNkhFQ0RVTEJPdzh1RE12ckQ2T1g1U3RONmM5QU54Zk9wMmQvT05H?=
 =?utf-8?B?SjVMcHp0UWNEaURoRFJoUGRkOTRoSTVNbGQxOCtRN1g0TEhEL3lRQWRDN1lE?=
 =?utf-8?B?djlEUnhSMHlUa2tVMUhZT0Q0WlcyV2RTQW5GOUMvQUlWZFY4WnlUWTFpM1dD?=
 =?utf-8?B?WVAzN2RLNEx0WENNaU5CcXVFL1k4dllKQTdtcnJlL2pOVnFWM1N2RWdRVytl?=
 =?utf-8?B?Rko0YVhLN0ZwWkcwdCszVm5hTjFhYzA5aFF6NE85a3c0Nm9wUFlBZHdZMmMx?=
 =?utf-8?B?ZHg5UFRPZ0NCSmZ3dXQxQ3FYKy9MVllpRFRXOG14Wk5BWFJhZ2lXVUFZRmZo?=
 =?utf-8?B?b2VGZVJEb1E3czNOUEZ0azlLSnYwengwVXdPeWtmNG1NR0x3MmVXdmljRjdo?=
 =?utf-8?B?ekd0YjdXOENYQ1B1NExyNDdEVnJRQWt3RmtaTEJzQjRsSGc4MCtYbHFYV1kw?=
 =?utf-8?B?eXFWRWtEejBZdUFTSEZmVzY5SnZPYTR0cC9scTZBQkluWDlQSW1YUEVmUjF3?=
 =?utf-8?B?cmN0TXV4K200ZzJHQ0RJdDZwNUNuOFdkSTRlUkJHaGN6elJEcFo2VUtocHVG?=
 =?utf-8?B?NHdZdVh1L3IrWUkwUC9JaWxRMHM5V0srbk5IT01nOUJCTVNwU0I2allrTVIx?=
 =?utf-8?B?MUt0WFozVVVsQ1BTa2dTTWNRK1krajdqalp3RlZGOXR3MXZaV0lqN0U4dGYr?=
 =?utf-8?B?THFkc2VNeEI0OThxN00vbTR0ODNibWNlZ2JwZ2dnM1dPeEwyUmpDNndyTFJt?=
 =?utf-8?B?UjNYQTh0WGd3LytYZXNFL2lYVUV3cUk4SEszQjU4ZWVER2ZuWU1Wc0J3bnhm?=
 =?utf-8?B?SHVObGdyY3BnRFFjbFk0R2JMM3RhZktuTW1sUU12NXkvelg5UHRsTU91S0Q0?=
 =?utf-8?B?L1Y4c2hXRGljWHFmVjIyd0RvSUNXWGRYRG05L2Y3SWgwN1dvR1RlemMvaE5r?=
 =?utf-8?B?SjhrNWNjeVZ1VDZUSmtqUGZqQ0tIN3h1Nkh0SWZFNWUzRm1EaGxTUmNkZ2RG?=
 =?utf-8?B?RHp3ZitrejZWWmRPV3Z0ek4yMkpRdWxsVHpBK2xIdFFYNllkYVh4Mnk1eTZj?=
 =?utf-8?B?eEdmSVJjODNZMzI3YVNMUGd3byt6RVI5QVlOQ0l5MW5iODhhMzVmRU9VZTZj?=
 =?utf-8?B?NXRocDNJR2U0b2dPdGQ1U3NFZm0zRjFMRjN0RTZ6Sm0vbEVRWDBHQThmalJz?=
 =?utf-8?B?Snp0MlNLOC9tSXVqSTFMYTJva0ZlQWJzU05GNFdhU0dCeVppdHZQRWk1S09y?=
 =?utf-8?Q?dywZLJfMJCA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UTZKV1U3dXRONkxyQm03WEUxK2taNUhzaGozMVNBRnFXd3dyck5Qc1ZleE81?=
 =?utf-8?B?aXJOUjFoYWNRdjErbXNLbVVLRVg4eS8vdU43cmJrb3dBNy82QkQyT29OdTdj?=
 =?utf-8?B?Qm4xKzJ0cXdhNWJNQklpbURSbjcxQm5qWUdIZzNVbitzTUlNSEUvalFyMHB0?=
 =?utf-8?B?SzVOTEhVY3hBdWpyeVc0K3RNUVdhVDh1N2RVSllGdnlCWXFqNDZDMFJLRTNv?=
 =?utf-8?B?MzNGc3pPY2pMalMwRVRrZSs3YytNMGFRa1AwSHVFU0hIQkk1dVh5dHhHaitl?=
 =?utf-8?B?bE80eGFwMWt5ZjZpeUdtcytaMnluNkR1d3lUV2ZzUW9Ra2hNNzAxUnpEVXAy?=
 =?utf-8?B?dXBFN3cxSTFBL3pRTVovRHArZzlPbFE5T0ZhNVpob05sMXRORVJIdzJYVzJy?=
 =?utf-8?B?MHZiRXFyKzA1YlR4WDFlM1VRcG9GV2pleGRpZ0dENlRBMXhvU0JMY3dXdzl6?=
 =?utf-8?B?RnN2aUtrZUZWQUZIZGs3djVOcklLaHRmaU1GekVBR2JaakdmaVRWWnhkV1pt?=
 =?utf-8?B?NmN1NVBwbit6NmxvUitBcFJwMklnTkNYemdtamdLaUNTL0I4dDg1VHlDNXYw?=
 =?utf-8?B?S2E3aVpPTVN4UzdLQ1pXZmc4WENoVjhhemZjTkdLYkJsRXZBZGU1WTJoUzJa?=
 =?utf-8?B?NGwxVHZ2MEE2dVhOQzNheU9FZ1B0Yms0SFBScmREeWV1cUJWOW5WT21HazZq?=
 =?utf-8?B?dnhZSmxnWUtKZTF4QWQ0TmJYanZHTnpWd2dnQnRSOHpEYkZsMHI5OGxreXhT?=
 =?utf-8?B?eXA3MFh5TlVtOVptbkdpVXFrdVhNbFREWHJrK3R1QklJVVV0Z0hMdE9uaWZX?=
 =?utf-8?B?d1hJRlZ1Ti9JcERINDJ6R0NZYXk2NTlLeExWQURHZHdUaU9rcHN6MU00MXU1?=
 =?utf-8?B?NmlBM3V3aHBRV1pNZEdGeWo4ZkM5YkRMNVRmUFF6ZFBKNjRmSStuUS9CeCtH?=
 =?utf-8?B?WVRXSjVaUGRURmptdEx2OUhTTVZlMnJ6UVcrQ3grZ3YyWk5oa1ZQTHZnMU5p?=
 =?utf-8?B?MDFrdW13M21qUjVJN3lmUkRvTHVTY0ZNLys3eEJmZENzSy9RTnYwV0NWV1RC?=
 =?utf-8?B?NWVNZGwxMGNXQytUTnArKy9PWUxUVlJKYXlzWDFIeUZUZzRuZitkRXZUcjNz?=
 =?utf-8?B?Uk5ndVgvNVJiejVZNkMxcjhUNCt4K2lWZjFXS1hBWUxpZ3JlZm1KWGpkMEti?=
 =?utf-8?B?Qkg2djZRb0F6VG80Q2YvMmpyOVo3WWo3K2p6ak4vM1ByNmdDM2VzU3VYTExt?=
 =?utf-8?B?Nk4wK29NR2JicDZpWXI2YS9MZGh1dU0zYVJiRjk5NHExMWRNRTk1TjJzTWV6?=
 =?utf-8?B?NVpBNXhNSWh1NUZiY1QyYmNIWXBrZm83NzFZTE1CYnNZeFNmQXc3QWtDS3NW?=
 =?utf-8?B?THdCL3VwNWtyams1WGhpeitVT2V0dWk4SG9PQi9BRW4zbkdJZlFueDFuMVVP?=
 =?utf-8?B?a0NlclBvUVU1Z05DR216V2M4d3gwWXd5MVZacExqcGNicDk2amhTMHVNL3hM?=
 =?utf-8?B?YldCalgxYmh3UHRoYkhna0JjTFl5YU1wSWNZdWloclJydGNydTlNczhiSFF6?=
 =?utf-8?B?bW1SaG9ZeTkrdGFYRk1uTnhBTUNnRWM3b2M3NFVBUmd6RUpmOEcwbUJFU05w?=
 =?utf-8?B?WDRhLzQ2ZGUrbVJFT0dIa0ZiYkNjUDZsYjVTWDRuVDV3eUJYZmVOb0lrSmxJ?=
 =?utf-8?B?aGdKOTY3QkdQcjRDbElSMUZtN091MUM3VERJdE51OFZ3aHRqOU5ZMGRiU1d1?=
 =?utf-8?B?NUhQaXF4QTVDckM1Rk4xTW1LQ29COEJ6VUh5ZGRuQjRxSFpSajhtdmJmclht?=
 =?utf-8?B?R3B4TW5SS0FNTEhFYkErT2J0OFlUMFBCYmczWExNMmtiYkJoQkphZUhDeitD?=
 =?utf-8?B?L284Y2plTWtSYUV0TGJaQVFGM3JRRVZXdXZFYVFSa2x5eWw1N1BTaWNYcTFB?=
 =?utf-8?B?a2FsMHkyVkdTQWZMbEprWHYxS1l0N2ZlbkJ6OHYwWnpYQ2RuVDlRdGtGcVdu?=
 =?utf-8?B?Zm9WMW03RGh4YUJpMnprNCt5QWlQbEt6SmhyZllRZENRK2lLWU5TS0RvYi85?=
 =?utf-8?B?NkdWWE53WHd5dkNoSmZRajUyRnVveW1iOFM5SFBFcW83SGU3Wm1PTGNCTGFV?=
 =?utf-8?B?VWVRMUczbVFiRzd6QytBNXV2U29mcXRxaGV5L0VidHAxL3pXbFIrK0NrS28y?=
 =?utf-8?B?VGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d37a247d-4ffc-4ea7-a63e-08dd78809685
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 22:39:45.0670 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h1ndZzYLk89nYPRUtXzwn5eFO88dBQ2xX97DjEmvrbOG24/UK7tkHDi3p2BEKe0xatUFaKWfqs0k8ZAE6qPELwLkzrAr44eLBQ3RhrRN8w8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7423
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

On Wed, Apr 09, 2025 at 07:09:56AM -0700, Lucas De Marchi wrote:
> The default behavior if the LMEMBAR doesn't match the maximum possible
> size is to try to resize it. However the user might want to keep, even
> for testing the behavior with small BAR, whatever size was set via
> sysfs. Change the module parameter to int and check for negative value.
> 
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

Thanks,
-Michał

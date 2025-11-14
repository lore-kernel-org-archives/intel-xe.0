Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B70CE7AFE
	for <intel-xe@archiver.kernel.org>; Fri, 14 Nov 2025 12:24:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BC0310E24A;
	Fri, 14 Nov 2025 12:24:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SMJZXBMH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBC2A10E24A
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Nov 2025 12:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763123039; x=1794659039;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=iM2miKwui6EH/wfMg3o5KmpKCBqvAnf+F3xxKDIQDX4=;
 b=SMJZXBMHyF6H1sfE55O06BcgelxnJ3hrEb+X9mgeGmlO7QrVTMdSOt2q
 QsW2UHVaJIwWZ0EGV95q/CK5Xs4N6+LzhjHMk6maR8Ws0NNDcorBKa0Df
 WOzvmzSpUtwR/nL9EQ+vJzAZIiIkxgU6hhHVuI8rMoMXNDm7xV02kjeJ7
 HDR47DCFRbyKvAJ/NumQ2MmaI1zs3umGM3xHf8xqQRRNI52ZmlZ7+FJms
 wx+cR9pobNBq1ioPquswyMSU0DRrBahtjiLKtsYykyyTPnow7fTzoITU4
 7/eqrVfmtaVbDFHW91qg24SNyHfewwa4bcPx6q/LxKW5ClLEAqCCzaV6q Q==;
X-CSE-ConnectionGUID: ncbkCjb0SXqnuzNsvY/v+A==
X-CSE-MsgGUID: hPvY6biNQxebYFPDjvaN5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="64923822"
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; d="scan'208";a="64923822"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 04:23:59 -0800
X-CSE-ConnectionGUID: 4WW8Z89iSL+KV7oTJMDZpw==
X-CSE-MsgGUID: NyYJEuW+S8i7T9bdww9i9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; d="scan'208";a="193876080"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 04:23:58 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 04:23:58 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 14 Nov 2025 04:23:58 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.23) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 04:23:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ghJI9bN+KPkPVM/InECZQgHmKTvsrtxMWS9iCIcC/DMPIzdAeXJLymSEGcjxMtQtYIQ/ptz16jwkeywH/ASGRkwROusXUqSPjTuSK/cAlFD+h90V4WhvsfQNzTLPEYTQthGfMUPflL2YJEuNrrx4pxdiNJmLe8r4VJdwc0IhA8XnrSvxCe1vIs//0jR6WWoGN2SZ0xuCajhCTK5UDM9jHppnJVEW5ghqmw9XNxLL4/Ld+Rxv27sDgtidFvREouphXtRI/C0mfSqw+8Wom7eAysZwWppUIqH2yRvxFRxeT7aIXUc+jaUsTMpBPmaouYkvpeFCHyPkNmOHBQCfuhuQag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H9hfVlVVGH4jZsODgXppXZQrBR61Mg0llo7oIMU+vfM=;
 b=cy36pDZJP/hQN/F3/Mb6jxgn1XJiZvmQhgYTAQJzc/FvNWleiWjS9te1BYs5RAwsE7eOLOw+wEsQ0ZTfH7qBAQGSlZlz+ksn6jfqBazoieEhDuGzMXri0RHJcvlU5EGl9e9shrgvOuv+hhEVVQQm6sewtkz8AUOVyPq6xjbGHiJeQPag7pQOPeE8r/z4WqrEum6PA8X1Vx7BOLC+H79emWBZY4n+NWkzxSz/Ipv2LnvsJKliHnDVLtIxiXoPv5jufh7z4RANP3AhDWxtaxFbM5F3FLIMLcXMYuBnxEp4f2S7gOOfdT3eh5/EBWDlRA4V4822vGulPWazzLDZpfaN/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CH3PR11MB8494.namprd11.prod.outlook.com (2603:10b6:610:1ae::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Fri, 14 Nov
 2025 12:23:55 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 12:23:55 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Lukasz Laguna <lukasz.laguna@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>, Matthew Auld
 <matthew.auld@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH] drm/xe/pf: Check for fence error on VRAM save/restore
Date: Fri, 14 Nov 2025 13:23:39 +0100
Message-ID: <20251114122339.1791026-1-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0022.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::24) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CH3PR11MB8494:EE_
X-MS-Office365-Filtering-Correlation-Id: 917e25da-c5f7-459c-fde8-08de2378adbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dS9RSEVKdkJtOWxnbUxyRzJZOTJKREIxZnhteXE5dXd4WUt4cS9PMEJxU1I2?=
 =?utf-8?B?QVlSbXJiSVlpcUJBUWVMY3lKeE9LcmFEMHJYd1Bqc0NaaEVpamNPckVLcnRi?=
 =?utf-8?B?OXkxbWJXL2ZPUUtXUzlFVXBweWNJc29UK3Z0bVVYRGg3aGorZjZ4ZmpJUE9E?=
 =?utf-8?B?cEMxMEJDQTFRQ09WSklTODB2YlJyd0lwZFh0QVBveXY3alovaE1DZ2lucC80?=
 =?utf-8?B?TnVOZWxjOC9XMmw1d0drMXNyUC9OdWZ6TzJUbmY4THNJY3ZoZXJFSkozb1lS?=
 =?utf-8?B?dkNsVGhiWWFwdTR4aTZFeThON0dSSkxtOCtsdDhjMFRVQnRXdjJXeXhoWmV1?=
 =?utf-8?B?Zy9PM3pVNU11RCtjbUhQM1dLZVJHMC9CeFBsVXFlRVdFNm83a1dZejRxdkVr?=
 =?utf-8?B?N2pDYk9CTFhRV3F5aFNBR1pDTDlRUUdqUGRWdXhnVGRWTGMzUnJkZnRhQk44?=
 =?utf-8?B?TVlMbFc4amFURmUxUDErclk3MDVjeFlGVDUwak80OHNoYkd1TjFwTTZTM3Jr?=
 =?utf-8?B?dXoxNEVWOXk0a1hQM2U3OHdrckUwY0o5bFdkS0FESU00WGlzQVIvZUordkU3?=
 =?utf-8?B?dnprd3hHL1AxYlF4VWZqbnlCbkEycHhvUFZtNWh1a3N0YkZiQm03VndJRnF0?=
 =?utf-8?B?M3VoQUZrRlU5WldyQ1NXRmJGd2hXMm1RdTJDV3BCSmZxcm9seVlqczY3REdI?=
 =?utf-8?B?OEpHeWczUnNhTmVNNjM3bHMxYVphLytMNkVXREtKR01zTUhMYlpFckRvOGhP?=
 =?utf-8?B?bkVUdkM1NHY2cW15U2hWSmJDNFpVVjR3Tnl0Y2F4aE4zOW9WSnpCOXZhQWxk?=
 =?utf-8?B?LzNYdHJoNzhXLzdKK084T3dsclFGckp4bzRGQjR3cGw3WmluNmtlN3Jrakwv?=
 =?utf-8?B?UVRScTZTTkJ4b0tNWUlXV24rRlZoTnE5ajc3WVYrNExSbno1Y2ZCdVdQMnRL?=
 =?utf-8?B?TVI5aVprM1dCOFVaZm8yYkN4RFhpYm9JSFdwQW95cFRrMDhneTdWTGFadGkv?=
 =?utf-8?B?SXVmc1Q0RlJNL2V2NWNvN09IbE5UdC9uanBzeExzbHhaaUgvbTRJQlhtaXFI?=
 =?utf-8?B?eGV6ZHVNSHV6UHoxeldXbmZuNXZLeHpmVWlvTFJFV1dueG42c1R4K0tFc1Rr?=
 =?utf-8?B?eVM5YXl0S3ZlMVVZWjNkREpDUC93S2R1WHNqM2p1ZHltdVFZWk1sR2VWdmpL?=
 =?utf-8?B?a3hXcWNlUWpIYTJ5NHA3VW1Deks2ODFzckc4Q3JOaUgyQXFiUlNlUG8xYnhM?=
 =?utf-8?B?ZDUxdTRKMVJDY2lzRGdKUnR5bE4za0I0b2ZOMWRhL2ZGYTB5ZzVlRE41MmRz?=
 =?utf-8?B?WWtNL3VPRGtLNUk5a2R5bVhmWmFSaHM5TzlKNWhWVVYzSXlCZld5RTNoVkZ0?=
 =?utf-8?B?c00zWTFjd3pmdzAvWjFhWXh3aFFXV2xZdkpIYU50d1J3T0R4cFUyNHovZlJs?=
 =?utf-8?B?UnR3Q2xZb2hsK1Y1c1hXTWJTMXh0MkNjUHAyYTFDZHFKTHNCWkZwWmlIaExz?=
 =?utf-8?B?YzY1aC9ERnAwdzhwOW8rWkJialBwUlkzTDVVQmdKamFDM3VJYWxDbnVVeHky?=
 =?utf-8?B?VFgzNFdPT3N4cVhTTjRjOWUycm9DU3dYaVlSR1VYT1BTcUhvcHdWSW5Kd3Ra?=
 =?utf-8?B?TnBQeXBBM2dUcFRrR012RWV5ajhnMTljQVhkek4xdjZHTHEyTnR6WWlsVTZK?=
 =?utf-8?B?TklWOENMSVdRSmptZFN0R0R3OUE4YW5YR2JpTUFlc1BYKzlxTmtlRmZmbXUx?=
 =?utf-8?B?R3YyWmN4Y2pVdUVyY1ZMMEVoT2trd2hJQjJlVzllbXltZFFuV1p2cmVtT3cz?=
 =?utf-8?B?WUltNFRZYVVqVUsyUzlYbkp3aXRLY0ZteXBIOWdhM3lqYXI5SU1yeVRRbDlx?=
 =?utf-8?B?VmFuKzMvYVB4aXVuN09Kd2M1aVg1dzNmcmdiZ2loeFlGMWV0aGhIU0NvbHJz?=
 =?utf-8?Q?1OtqYmoGpP+pSMOjhsXHU3PRybKCviBs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHZ5WGdiaWpDK0RJeVpwQWxFeXpEM0JKU2U4c2RHRlU1clBxZGVKN0t1UVFY?=
 =?utf-8?B?VTlvaHRYNkEzNXhEd2lkMzNBT1lCSkZJaFFreU5PRXZ0by9STkdnc0xpT1Vo?=
 =?utf-8?B?ZmZwVmVML1FYRlNLV2FvU0RWbVl3UHhwVjhGVzVoaStvbmF0N1hBL3hJYUt0?=
 =?utf-8?B?ZnZhWkp6NjJpWFpiOTBzSUhVU01uRGhkM2pmQzQxMFlOZDZ3N1RRTE9KNW5S?=
 =?utf-8?B?dDJ0Sno1dmp4aWY1TTNpZlNYV1IxTERJbWhTRVJ5UDJYbXRaRzMrdElOY1dt?=
 =?utf-8?B?Q2ZSa29YMlI4MFBoSTFzbHBWUkJzNE1VejlqaWRhWC9QRng5VG5xRTBhcEFm?=
 =?utf-8?B?ZEdKZjJWdlJPL2h2TzJNYUNZWDBZanZieDMwbWFUN3h4bFV0Nk1Vc3FNY3Jt?=
 =?utf-8?B?eVZDQ0VkVXo2VDkzV3d2YnJoSkFoVXJrOE5MNFNaNG1BeC9XaXJ5Z3B6eUU3?=
 =?utf-8?B?MkdzdStSdEhHZFFabW5kYjZsdFpkK0FmVmRCUEVra09hQTJCbkZ1WU9rNTI5?=
 =?utf-8?B?Wi9GUjM2QlR5SENIbzIxdjJCU2g3L0xPTWI1SnJUM2RjRU1hTm0yZ1lCaFd5?=
 =?utf-8?B?S1A5c041VVBHdHhxdHFpUEQzMGFxZU8xMy9Yb0JKSnM5cGRZUDVnWjJNdWd3?=
 =?utf-8?B?OHhkMVVyb1ZjMnkzOXk2amF1UjhIQXN2bzYrWFcrTUxNTDdaNFBpNVk4RTl3?=
 =?utf-8?B?NzJOdDFMeitGNkVNVE9kRlFjT2pFT1FaUWRXK3ZCeVM1K3QwdWdwUm8zeGRw?=
 =?utf-8?B?UU96TUxmV3lvTEF6cFd2TnJSZDdzNnpHK2ZBQzBUMHJtUzRHdFpMM2IwRG1E?=
 =?utf-8?B?N2Z0UGQrbUo0dkFycS9vaTl6STZTbEU2T1NjMzVRcGh1d2trS21SaFBkempM?=
 =?utf-8?B?YSs2Y3RXbzlxeU5nenB3OENiRDhRZEcyRS9uMjBnTVN3bjBpUjZsZHZIbzJq?=
 =?utf-8?B?a25EazhIelFpblZoVWM3aTc4RWlnNEF6OTJad0xzRk1qdDFOVk5JZzNHakx0?=
 =?utf-8?B?dDdvMVB4WnBQMmJBb0pMb1dBL3ROenBmSTVnN3BGelpCSlZ0MHNKNXlYVnlZ?=
 =?utf-8?B?eTIrTDYvWkFNMnIrL3lBbERzdWpTaTM4Y1BJT1R1MDh1WlNCSmdZOFlUTGJx?=
 =?utf-8?B?WURpSGg4ejhiRUxsdTVKWEltZmQvYkI3WCtvSjBJeTdKMkNORXgrSU5HTVFV?=
 =?utf-8?B?NGtLMnpWZ3c3cFFWbCt4a0FKazYvMkRZS3k5dFdDZjN0UGNwb2NmZE9pMlY2?=
 =?utf-8?B?bmZPTy9wcVVWc2sxWm1ORG9ld1Fzby9jWTR2MEVCSVVsNERsMWg4NDRmclQ5?=
 =?utf-8?B?V2EzSWViSFpzVURTMkI0SHJyRjRvVXBYTzFET28zNkRtZU9WOW42T09nMEw4?=
 =?utf-8?B?ZU9Vdk9ibnZoMzVrWUJkb2VWdEFwZnRzWnIxT1dKMEpSQnp3bmlhQXVVeGtJ?=
 =?utf-8?B?WXdqZ3FUTVlxL2Z5bGpiZ016VFdrUkVQck1JLzIzRTZWNE5uNXBFWjNWdGND?=
 =?utf-8?B?L2phbllVMmJtSHpuOFZITXJLN001a21mWG51SFNYSlpFNDhCZ1M3STg0VkFU?=
 =?utf-8?B?cnFmb1p0TlR0alF2d3cwNVdkemNTbmVmMEpCZUlnYnRVMU0yNk0vVCtTbDBS?=
 =?utf-8?B?RmRWbkI1MjlodVpyNFRWZStWckRWVU15UExXUXFUVjBFRVdmWGlyZWltdEE3?=
 =?utf-8?B?YzdCdVhhbDZNNmIzTURCc2ROOE1rQWpoMXVSTUUvK3FGVDB3L1hpU29weWw3?=
 =?utf-8?B?bnFjeEg0QXN6SWpOVHlNbjhRZE10Y3RRTC9VOUdUTTNscC9EQnU1QWI4RlJ3?=
 =?utf-8?B?OHYreU5CMDRXMEcrR3M3VE12Z3B2NlpiS0JYOE15WTJjbHdQT1JjajNia01p?=
 =?utf-8?B?a3c4ZmJUMjRuOUdGZ2RhbmVxSmhxQWN5bnpsbXRzT0ZZUStGcWhuNzhBd2Ru?=
 =?utf-8?B?SXdFM082RUN2WGdEcC9mLzlPczd5dWlWRkRWcTdIS0lENTFMSWR5d0dQQkcx?=
 =?utf-8?B?UmtubTAxSXVCSlF0N1RaNGJHNDdGaHNNZU9HcHJtVk1XT3IrY1FxMk5ra242?=
 =?utf-8?B?WHh6VU9Yam1tYUppSVJMUWlMa3JqWGRJTkMybmd4MlA0OWFjV0RaZlFOTkRR?=
 =?utf-8?B?a1NsZE1uRXBSWWVLVDlxdjVPbDBZMmEwQ1pPMm55MEg3NC8rMjllZGJlU3ZG?=
 =?utf-8?B?YUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 917e25da-c5f7-459c-fde8-08de2378adbd
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 12:23:55.2971 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KMxyEFPlSPQ7TA10BcKyFOHG5JwaKHwtz5y2EO0sxfoXgrxqsDWCR3jQTFPU6m/ai+zcSp1KmbregyFIBjy/mgNRlh9uhB73XnICQEPBqWA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8494
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

The code incorrectly assumes that the VRAM save/restore fence is valid.
Fix it by checking for error.

Fixes: 49cf1b9b609fe ("drm/xe/pf: Handle VRAM migration data as part of PF control")
Suggested-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index 6deb4835eb44f..037d48159dc87 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -572,6 +572,11 @@ static int pf_save_vram_chunk(struct xe_gt *gt, unsigned int vfid,
 	fence = __pf_save_restore_vram(gt, vfid,
 				       src_vram, src_vram_offset,
 				       data->bo, 0, size, true);
+	if (IS_ERR(fence)) {
+		ret = PTR_ERR(fence);
+		goto fail;
+	}
+
 
 	ret = dma_fence_wait_timeout(fence, false, PF_VRAM_SAVE_RESTORE_TIMEOUT);
 	dma_fence_put(fence);
@@ -655,6 +660,11 @@ static int pf_restore_vf_vram_mig_data(struct xe_gt *gt, unsigned int vfid,
 
 	fence = __pf_save_restore_vram(gt, vfid, vram, data->hdr.offset,
 				       data->bo, 0, data->hdr.size, false);
+	if (IS_ERR(fence)) {
+		ret = PTR_ERR(fence);
+		goto err;
+	}
+
 	ret = dma_fence_wait_timeout(fence, false, PF_VRAM_SAVE_RESTORE_TIMEOUT);
 	dma_fence_put(fence);
 	if (!ret) {
-- 
2.51.2


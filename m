Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A14DC5B549
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 07:48:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32B8D10E59B;
	Wed, 28 May 2025 07:48:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AL8MgF1v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62D5F10E599
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 07:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748418523; x=1779954523;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=6bCoYT/SiFMGh82WB+SWtZqc2WB/TI/Og8G5q23/cX0=;
 b=AL8MgF1v3CjD6Lz241ZgtLlCo7xT1NUVUqFoLRvWfQLZX3TUTF8qVZow
 Y+T8T2/3eeMK84piWw6ceb3dFWu6Ag61Edc2lUeOZyVVI6DXp04Kui4aM
 1omBsAGjhHIf+QXPQJpqhg9rawELFQ9ZOn52x9aJobE3BPx2G1PUVzLCu
 tx17/YROu1j73SNjeKdWC9S0TswgmjHKhqgrv/VNb8GSLz92ozAVSWufR
 63KCHFhk8Gm6JBOTpM8pCyLYqJU3XXthDQ/iUWnHzSkXVh4DEib0IB6XD
 KYL46afBKkLeIYlx9CjBVDl2KhL8iUVn/TqdTB0rXLyiYtZiNDGN5mNrU Q==;
X-CSE-ConnectionGUID: nmWjm1RlQ66/6dIO6gYt/g==
X-CSE-MsgGUID: yfYklePLSxyWsBfufCJJbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="60688488"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="60688488"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 00:48:40 -0700
X-CSE-ConnectionGUID: jKyvPYwBRLiM1NzWKGtg5Q==
X-CSE-MsgGUID: QJoR4NCTTlexxFi8AzKvmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="143512021"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 00:48:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 00:48:32 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 00:48:32 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.61)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 00:48:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dPPS9btNuoIv6+ckkEvEK6AaMm2rtSlnU5VQSQztox0c1P0Z+ovCadIZD4x40tLBv97vOOwcledT1++tN0Wapgrfc0zm3An6CxE2GYrDlFt3e9Wv8evy54vFvpyv5m/au+xS04rv/4cwL/7N1iprQ6Ro/Fv6hdYOK/md6ARVqhPGL02x9WlBmRiyScDgGIQqBj9V3Y7kYo41tmyNjc4rRVuuP5eL7mGDNsLfmh/e4VssVuoTVvTUaYjSv4kCtt5E3Zvmc+5q6bOS1Zpv5F/H1U7/u9uY6GNhSqCV+9RJ/CIdlCldfkYKKWoD9aRvSJhliOcq17xbG9VQ4pEYrmIcrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nbOkzANxrua66c4tTXuiRxCBFkZYW2TJ/WtcM066MJ8=;
 b=ru2CTIa/gnKihvxFmGB9DThG+Mgaw5i6kU1RDio4wnTz19C8cDcor4bcTKbcjSRBcywspUvDf4Pr0Sam7a31PyJVY5TuvmdlDH0oMR0AZQLjqI6Y9wHfc3eptOKYR3E+HFVM5Se6RB2VQKMHmuAstRtVjYMOp4CETJfAa+UGEenIvOcDiZzIa0J1Eou325rvpAYrP+S8PlpG/5Kf4D1G6QOM0Ba/t09j5uvFvww7US03FouCvKdkm9B//qXREnxtGnWkYvjvwA6YBKb56Ku90PJMJP94sMGFiFkFCEwgqAmMHiuVvrMzYUomjBgwtye9Pyhgk7boqKmfmyL+vnGVaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by IA0PR11MB7356.namprd11.prod.outlook.com (2603:10b6:208:432::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Wed, 28 May
 2025 07:48:00 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8769.022; Wed, 28 May 2025
 07:48:00 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Stuart
 Summers" <stuart.summers@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2 2/2] drm/xe: Unify the initialization of VRAM regions
Date: Wed, 28 May 2025 09:47:43 +0200
Message-ID: <20250528074743.2027563-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250528074743.2027563-1-piotr.piorkowski@intel.com>
References: <20250528074743.2027563-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0097.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::10) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|IA0PR11MB7356:EE_
X-MS-Office365-Filtering-Correlation-Id: 86db68f1-28fd-42e9-7307-08dd9dbbf836
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TGNxOGhndUJFMFJGR2txQmIrcHNkeWkvRDJRNUs5aHVTRDY1d21qUEJFYUU1?=
 =?utf-8?B?dEZFWmorRmdkT3VNczlrbTMyOWxoZjVtbnA3YnF4b3F5TnRMN0hTSWFENU5j?=
 =?utf-8?B?VUN0cGhlZnBpNkxnWmFGdm5Bd1lGUU1FaWt1Rm1VWnJOKzhwcS8ybWhITGNG?=
 =?utf-8?B?SG1iVy8xUzlheHRmb3VYdFdJUW14V09kOWdkd3hwSDZCL01NSGRhL25kajdY?=
 =?utf-8?B?Zkgyb0FPR3cyTlN2ZTlld0dIdTdlQ1BRK2dJb1JWMC92N0FCNko5YjVoZjhj?=
 =?utf-8?B?azlqZ2Mxc3lyeXFrZkUxeHVaMGRhZUxsdXNlMTNPdHdwdThSdFA4cEhDdTVx?=
 =?utf-8?B?bm1OSTFrNlJOcUNTN3FYdk9YTWNoY28rY3FuUEZKN2d1VmhWK0g4d2xzRWh1?=
 =?utf-8?B?QzAyVFNQSkkrMXpVZDZTejNHWXMzVzhZQlcxMjZ4M1Q1Q0RRTEtPbS9wWWpu?=
 =?utf-8?B?SGN5TU9qVElKeTBvOGtmaW9iWHhkTlV1Y1ltazc3N1ZuK00ydDJEQllRdmRQ?=
 =?utf-8?B?SnNLbkJzQmdGSHNrUDQ3NVoxVzFjZjNrZVR0R2Y5MDhEUVFnZmRPZE1nbXlL?=
 =?utf-8?B?OWJUbmVnQ0IvZzRQd28rdGJBcTFQMGU3MDh4cStPZTBVUjltSzBBaFpSY0dO?=
 =?utf-8?B?a2RPT1pOdDdGKzNKUzk3R2VaR3FPTHVXZ3RzeDFFcU9NVDNRL1NLQmpaODNY?=
 =?utf-8?B?MExxZHhuL1pGT1hRS1NwcmNYUlZBTDE3T096eGdGUzJ0dmdsMm0xaENnenZa?=
 =?utf-8?B?eUxQYndqWXNmajlUSEdvcHhFRVFsYmtuS3Y1eitWTXVvNW9neldaTXM3TEhJ?=
 =?utf-8?B?NXdZUERBbUtQcUtxV1llQnFjeHZKbTFiMjBOaFcyYi9lTlFxb21wRGtzOVJa?=
 =?utf-8?B?SDR4NkE1L2wyTlJoNDJneUZWc3dsRU1VeUduMWJ3ai90UlpwZUlpa3VwOFZ5?=
 =?utf-8?B?aitxOEZENEN3TkliZnpVb1BmT1ZtcExjeFc0VzNLNVlsRmpZUXFlTmVwbjdV?=
 =?utf-8?B?M080SmprR0poanFwTzBibXkyckpUV1dpeG5PY2VOS0tscHh1aG5Ha3NmKzRy?=
 =?utf-8?B?RWJQRWZkOFF2T1N5UGMwWGtIYU5yL0dON1lWZHpQQVdaRHIrSENkNVM4cno0?=
 =?utf-8?B?MmV0d1BTSVlFU3BZS3dFcndPZWg2UllQOE4zMHZEcndPS2pLWndFSW16VEhN?=
 =?utf-8?B?VWpLY29sc3U0OGRXVzN0RzZvd1JnTDFFb1dMVm4wVnBSdFRhcWkxSjZZSFRl?=
 =?utf-8?B?Z0kwZUEzcGxkRkZPQ3RRQ0Zub2RkT3NwS2FkbFVPVDJjcklRcWRnZUpTWVdZ?=
 =?utf-8?B?dVFiZkJJdjlTMS85WlNYdWNzWUhLYmtCeFFSajFZT3QwRnpoNm13bVEyalk2?=
 =?utf-8?B?UWQyaFZEVWJRTVI5VWtOcExpN3h3ZXNvYzBIc1NnbHd6NFZFZldmaWticHZD?=
 =?utf-8?B?T3RwSlo0cDZLSVNWeUpaNWJ1ZklNSnBRYzdRdXI3R3QzQ2pTaTVxeVdvb09z?=
 =?utf-8?B?NkEwaE9FNDFwL2lIM21YNGpaRytjdnAwNFVNOC9jbnVpbnhjdWoyMmlPQVFS?=
 =?utf-8?B?UkFjeDFDcEV1LzBLMHBSQTI0Y25UUW9IdVhhdUhjYXBKeXJrRnZqZTBSNGMw?=
 =?utf-8?B?SnJsNDRiZ1pUSmZGMC9FNU5DWmNuTkhQWDMzQkY0bzRId2psdzlSU1FNNzNy?=
 =?utf-8?B?M0JMNVUzTGJ5aXpFOGNEWjZVZ0QxOUdmNHNvSHFsZVBuL09Xa3RlSEpDQW9z?=
 =?utf-8?B?V2tzS2xIWVBqMGIyUzAyeE45RjcwWWJUczNNQkxEV1JYRVg4Nk54MnpEK01D?=
 =?utf-8?B?dGM1NXdJVnRCSVd6ZytabzZ4TWNsVjU2L05NcEJjK25QWGw0dXMzOVpsMksv?=
 =?utf-8?B?QmdOZ3Vsd0R2YkQ4UUYybXEydEREdndSUUZKUS9xWmNkSmw4ZWVMdXlLZ1BS?=
 =?utf-8?Q?s/BIF/AH6NM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFgxTGgzdmcvYXQrdWplT0I2UW91YUNyTm5VTzdDVzdVa3owMkhSU1k3am83?=
 =?utf-8?B?T2RUK2tzY0dDa0xHNmJZeS94eksvTDkrVmRTbUtmUFI5MldERWJVZ0FPRXh2?=
 =?utf-8?B?V1RqalExMkJuenhvdHgzZzNja1doTGFkdlN5VmFCT3UxZEZjY3dxZG14M2RX?=
 =?utf-8?B?L2pXVkZ3VUlqMTk2cGQzcG9qcURpb2JKc3NzMkdGQzg1SHA1OXFWUDdQOEps?=
 =?utf-8?B?ZkFJclJpa0dxUUF3SkRBTDZ1MWlMVHorU3YvTW1iSE9GckcyOUI2SmI1V0Nm?=
 =?utf-8?B?VkUyb2VTNTVNa1dlZi9VekVNNENIVzF1NjFDNE1YQThtckM0T0lVS2hKTkNp?=
 =?utf-8?B?ZEYvMnovYjY2Y0xLZUR6d2hDZzBCak1OcW5RTkxyeDNPUGZyZThlK01wKzMw?=
 =?utf-8?B?TDhLaVppR1RXZmxpUjJISUh2ZFk2MVhGSHgvc2pTQUFKRVVaVmk4aUU3a1BR?=
 =?utf-8?B?SFhodVRYTy96VWwxc3kydzI2dXBMaVRHQWFkWkZkbTNVd0RVWDdQUERnd3hB?=
 =?utf-8?B?YmM0UXJvUG5hWWhaMVhybzJTMUV4VWI3cE11YWlPbER6cjRXQm4wNVVOYXEr?=
 =?utf-8?B?NTlUK2hlWGJSNm5DRWY1amQ1T2NCR3VzZEVoaEUrbzlkb2FGYmtzSExPWU92?=
 =?utf-8?B?MThJZ0ZMN2grMUMwcmxUWnFZTFR1U3JyZzNXMjYrRkllNWFYVXRTcUxpR3Ry?=
 =?utf-8?B?NHhFWGVHVGZFYVVablp3V2ZhRHd5SThtYTBReDNPTXBLN2pTRXZuZnRmNkEx?=
 =?utf-8?B?K05aQ1hQM3NxYnhGWGcxcTk2Q1VQOHhRU0F3cXNUcmdVQ2hvTDhnNitQYkJz?=
 =?utf-8?B?TnBReFQvcXUrYU1ITWs0eWk3MjdtZjFRamtkaU9haWtOYktIZW1JRVlkTXQy?=
 =?utf-8?B?NEpWNGR5bnBnWGhWZlJEOGZnMEJDdEpyL2xuK3ZuTEE3SjYrWTFKZ1lhZk5B?=
 =?utf-8?B?Y3BXdGFOSXplclRTaUNjU2VPa1VwT3BmaXdwRGNDOUttSk0vbU1jd1ZpQkht?=
 =?utf-8?B?Sk13SnJGa1hjQXY2eHRVZWdnY3ViaEtoVmVsYjdPWTdtRlRXVy95ZjYyQ1ZD?=
 =?utf-8?B?d2I1anBkdjJQQ0s3dEsxTE5lV0RCVWpuNG9Cb2tiSFl0ZEd0aWVwbEE4WkFp?=
 =?utf-8?B?UjlET1RHZ3FXNzhiL0hwVk03dm90b2ptMWRybHlUNFFFOUhOREVKQUJ0TVNC?=
 =?utf-8?B?VSs0ZmhjbGpiY2VmM0FETVZGaHcwRVhkL0xoRVlqeHppci81bCtoeU1GNVlX?=
 =?utf-8?B?ZFFaOEM3ZlhaVm93K2JwbDEyOUlvMU1wanZ3M2FOZXo5LzFMMUxVZWhqT0ly?=
 =?utf-8?B?VWNrOHV4NHhxdzhwbEFkNFVtc2JYamxJcTRPT1VGNXBZM2dYcmZBVU0vd09p?=
 =?utf-8?B?TktRcmNpY0tkcnMvQmV2SlY0blIzb2l1UDlCNXZraG1yaU1HZWZYZ1ZNL3BN?=
 =?utf-8?B?djF6QXdIRVFOYTlYTlNLWWpPNjBUTWEvTmlaMDczZnVtTDdwbjJxNy9yS3R2?=
 =?utf-8?B?VmE4RVF0TmkrcjhKUTZTaUs0QTNzWVVtdkFNQ2xHVGdCejBpNDFFZkEzZndX?=
 =?utf-8?B?djhoVmlnK0VLZER4UGVLSWt2ekN1cmtBWU9JRXVkblJMU0FPMEVpQy9qZ0pP?=
 =?utf-8?B?U0xXQW1teVhQZm16akdHRklieGQ4cmNHUGxRSVE0NFRnRVpoSmp1NXQwVy9r?=
 =?utf-8?B?bjNuUGVtQzIxZ0JJczVFQXg0cnNHL2J0VHVzdEN2MHdRMlJMb2llMDdIeGFB?=
 =?utf-8?B?VUI0Nm54NDFZQnAyWTFvTWJXTkRERXJOY2sxaHBwYUdyKzh0ejRpZGxuM1Bk?=
 =?utf-8?B?S3BUbkY5WS9QZGEzdzh4S24xQ3FXNFVJMEU3cTUrZkxqdk1yRWVCTXZOcW52?=
 =?utf-8?B?aHp6dVNFS0dYVnpGZXhKZGNYVE9hK3JOS2tOUkZheTVjekp5Q1lNNkdHNjZD?=
 =?utf-8?B?M1dBQ0x0V1JMZGs5NWV6M3lUUHpFMURvUWVtdlU2eTAwajNoS3ZFOTZlT05F?=
 =?utf-8?B?UXQ0RDFIYlNZTGpqcy94N2Y4NFZwenhmU2IyVlVCTXU3aG03U2UyYlNxUmZX?=
 =?utf-8?B?ckxBelB0T2N1cGFvVWU3Y1VwV2ZhYkJlbWRqeDR5VmVMQUJqVkFPY3JMWkFO?=
 =?utf-8?B?c0JCOXFVSEZ2ekFhbFRzVzArZ0IyVGp1aWdUUFIyRklsRWRSc0hJMVVmV0h6?=
 =?utf-8?B?TXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 86db68f1-28fd-42e9-7307-08dd9dbbf836
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 07:48:00.7273 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uNscjHnX+3rBXbXrM9e4H7ijIPFLB1FL1wKiwOmtXvBwjpxYmD9HVcAOKMsNIiymfBofo7Tb/swTHj2vfJ2+KXYfwZi9PT3Cimsz1Ep6Z8k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7356
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Currently in the drivers we have defined VRAM regions per device and per
tile. Initialization of these regions is done in two completely different
ways. To simplify the logic of the code and make it easier to add new
regions in the future, let's unify the way we initialize VRAM regions.

v2:
- fix doc comments in struct xe_vram_region
- remove unnecessary includes (Jani)

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       |   4 +
 drivers/gpu/drm/xe/xe_device_types.h |   8 ++
 drivers/gpu/drm/xe/xe_gt_pagefault.c |   4 +-
 drivers/gpu/drm/xe/xe_query.c        |   2 +-
 drivers/gpu/drm/xe/xe_tile.c         |  30 +----
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c |  16 ++-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h |   3 +-
 drivers/gpu/drm/xe/xe_vram.c         | 175 ++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_vram.h         |   5 +
 9 files changed, 154 insertions(+), 93 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index a80e892d6959..9793f1a6dab8 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -862,6 +862,10 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
+	err = xe_vram_init_regions_managers(xe);
+	if (err)
+		return err;
+
 	for_each_tile(tile, xe, id) {
 		err = xe_tile_init_noalloc(tile);
 		if (err)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index cba1eed9ed6a..7af14c429684 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -74,6 +74,12 @@ struct xe_pxp;
 struct xe_vram_region {
 	/** @tile: Backpointer to tile */
 	struct xe_tile *tile;
+	/**
+	 * @id: VRAM region instance id
+	 *
+	 * The value should be unique for VRAM region.
+	 */
+	u8 id;
 	/** @io_start: IO start address of this VRAM instance */
 	resource_size_t io_start;
 	/**
@@ -106,6 +112,8 @@ struct xe_vram_region {
 	void __iomem *mapping;
 	/** @ttm: VRAM TTM manager */
 	struct xe_ttm_vram_mgr ttm;
+	/** @placement: TTM placement dedicated for this region */
+	u32 placement;
 #if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
 	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
 	struct dev_pagemap pagemap;
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 7a8f87709e39..51d88cdb693e 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -138,7 +138,7 @@ static int handle_vma_pagefault(struct xe_gt *gt, struct xe_vma *vma,
 	/* Lock VM and BOs dma-resv */
 	drm_exec_init(&exec, 0, 0);
 	drm_exec_until_all_locked(&exec) {
-		err = xe_pf_begin(&exec, vma, atomic, tile->id);
+		err = xe_pf_begin(&exec, vma, atomic, (tile->mem.vram) ? tile->mem.vram->id : 0);
 		drm_exec_retry_on_contention(&exec);
 		if (xe_vm_validate_should_retry(&exec, err, &end))
 			err = -EAGAIN;
@@ -575,7 +575,7 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
 	/* Lock VM and BOs dma-resv */
 	drm_exec_init(&exec, 0, 0);
 	drm_exec_until_all_locked(&exec) {
-		ret = xe_pf_begin(&exec, vma, true, tile->id);
+		ret = xe_pf_begin(&exec, vma, true, (tile->mem.vram) ? tile->mem.vram->id : 0);
 		drm_exec_retry_on_contention(&exec);
 		if (ret)
 			break;
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 99189d15d4a5..a3b59949e31e 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -409,7 +409,7 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
 			gt_list->gt_list[id].near_mem_regions = 0x1;
 		else
 			gt_list->gt_list[id].near_mem_regions =
-				BIT(gt_to_tile(gt)->id) << 1;
+				BIT(gt_to_tile(gt)->mem.vram->id) << 1;
 		gt_list->gt_list[id].far_mem_regions = xe->info.mem_region_mask ^
 			gt_list->gt_list[id].near_mem_regions;
 
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 8303ebd90099..7beb87124f3b 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -7,6 +7,7 @@
 
 #include <drm/drm_managed.h>
 
+#include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_ggtt.h"
 #include "xe_gt.h"
@@ -18,6 +19,7 @@
 #include "xe_tile_sysfs.h"
 #include "xe_ttm_vram_mgr.h"
 #include "xe_wa.h"
+#include "xe_vram.h"
 
 /**
  * DOC: Multi-tile Design
@@ -115,11 +117,9 @@ int xe_tile_alloc_vram(struct xe_tile *tile)
 	if (!IS_DGFX(xe))
 		return 0;
 
-	vram = drmm_kzalloc(&xe->drm, sizeof(*vram), GFP_KERNEL);
-	if (!vram)
-		return -ENOMEM;
-
-	vram->tile = tile;
+	vram = xe_vram_region_alloc(xe, tile->id, XE_PL_VRAM0 + tile->id);
+	if (IS_ERR(vram))
+		return PTR_ERR(vram);
 	tile->mem.vram = vram;
 
 	return 0;
@@ -157,21 +157,6 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
 }
 ALLOW_ERROR_INJECTION(xe_tile_init_early, ERRNO); /* See xe_pci_probe() */
 
-static int tile_ttm_mgr_init(struct xe_tile *tile)
-{
-	struct xe_device *xe = tile_to_xe(tile);
-	int err;
-
-	if (tile->mem.vram->usable_size) {
-		err = xe_ttm_vram_mgr_init(tile, &tile->mem.vram->ttm);
-		if (err)
-			return err;
-		xe->info.mem_region_mask |= BIT(tile->id) << 1;
-	}
-
-	return 0;
-}
-
 /**
  * xe_tile_init_noalloc - Init tile up to the point where allocations can happen.
  * @tile: The tile to initialize.
@@ -189,11 +174,6 @@ static int tile_ttm_mgr_init(struct xe_tile *tile)
 int xe_tile_init_noalloc(struct xe_tile *tile)
 {
 	struct xe_device *xe = tile_to_xe(tile);
-	int err;
-
-	err = tile_ttm_mgr_init(tile);
-	if (err)
-		return err;
 
 	xe_wa_apply_tile_workarounds(tile);
 
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index d9afe0e22071..3a9780d39c65 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -337,12 +337,18 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 	return drmm_add_action_or_reset(&xe->drm, ttm_vram_mgr_fini, mgr);
 }
 
-int xe_ttm_vram_mgr_init(struct xe_tile *tile, struct xe_ttm_vram_mgr *mgr)
+/**
+ * xe_ttm_vram_mgr_init - initialize TTM VRAM region
+ * @xe: pointer to Xe device
+ * @vram: pointer to xe_vram_region that contains the memory region attributes
+ *
+ * Initialize the Xe TTM for given @vram region using the given parameters.
+ *
+ * Returns 0 for success, negative error code otherwise.
+ */
+int xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_vram_region *vram)
 {
-	struct xe_device *xe = tile_to_xe(tile);
-	struct xe_vram_region *vram = tile->mem.vram;
-
-	return __xe_ttm_vram_mgr_init(xe, mgr, XE_PL_VRAM0 + tile->id,
+	return __xe_ttm_vram_mgr_init(xe, &vram->ttm, vram->placement,
 				      vram->usable_size, vram->io_size,
 				      PAGE_SIZE);
 }
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
index cc76050e376d..87b7fae5edba 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
@@ -11,11 +11,12 @@
 enum dma_data_direction;
 struct xe_device;
 struct xe_tile;
+struct xe_vram_region;
 
 int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 			   u32 mem_type, u64 size, u64 io_size,
 			   u64 default_page_size);
-int xe_ttm_vram_mgr_init(struct xe_tile *tile, struct xe_ttm_vram_mgr *mgr);
+int xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_vram_region *vram);
 int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
 			      struct ttm_resource *res,
 			      u64 offset, u64 length,
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index 18124a5fb291..5f68fe4d414a 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -19,6 +19,7 @@
 #include "xe_mmio.h"
 #include "xe_module.h"
 #include "xe_sriov.h"
+#include "xe_ttm_vram_mgr.h"
 #include "xe_vram.h"
 
 #define BAR_SIZE_SHIFT 20
@@ -136,7 +137,7 @@ static bool resource_is_valid(struct pci_dev *pdev, int bar)
 	return true;
 }
 
-static int determine_lmem_bar_size(struct xe_device *xe)
+static int determine_lmem_bar_size(struct xe_device *xe, struct xe_vram_region *lmem_bar)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 
@@ -147,16 +148,16 @@ static int determine_lmem_bar_size(struct xe_device *xe)
 
 	resize_vram_bar(xe);
 
-	xe->mem.vram->io_start = pci_resource_start(pdev, LMEM_BAR);
-	xe->mem.vram->io_size = pci_resource_len(pdev, LMEM_BAR);
-	if (!xe->mem.vram->io_size)
+	lmem_bar->io_start = pci_resource_start(pdev, LMEM_BAR);
+	lmem_bar->io_size = pci_resource_len(pdev, LMEM_BAR);
+	if (!lmem_bar->io_size)
 		return -EIO;
 
 	/* XXX: Need to change when xe link code is ready */
-	xe->mem.vram->dpa_base = 0;
+	lmem_bar->dpa_base = 0;
 
 	/* set up a map to the total memory area. */
-	xe->mem.vram->mapping = ioremap_wc(xe->mem.vram->io_start, xe->mem.vram->io_size);
+	lmem_bar->mapping = ioremap_wc(lmem_bar->io_start, lmem_bar->io_size);
 
 	return 0;
 }
@@ -287,6 +288,92 @@ static void vram_fini(void *arg)
 		tile->mem.vram->mapping = NULL;
 }
 
+struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id, u32 placement)
+{
+	struct xe_vram_region *vram;
+	struct drm_device *drm = &xe->drm;
+
+	xe_assert(xe, id < xe->info.tile_count);
+
+	vram = drmm_kzalloc(drm, sizeof(*vram), GFP_KERNEL);
+	if (!vram)
+		return NULL;
+
+	vram->id = id;
+	vram->placement = placement;
+	vram->tile = &xe->tiles[id];
+
+	return vram;
+}
+
+static void print_vram_region_info(struct xe_device *xe, struct xe_vram_region *vram)
+{
+	struct drm_device *drm = &xe->drm;
+
+	if (vram->io_size < vram->usable_size)
+		drm_info(drm, "Small BAR device\n");
+
+	drm_info(drm,
+		 "VRAM[%u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n",
+		 vram->id, &vram->actual_physical_size, &vram->usable_size, &vram->io_size);
+	drm_info(drm, "VRAM[%u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n",
+		 vram->id, &vram->dpa_base, vram->dpa_base + (u64)vram->actual_physical_size,
+		 &vram->io_start, vram->io_start + (u64)vram->io_size);
+}
+
+static int vram_region_init(struct xe_device *xe, struct xe_vram_region *vram,
+			    struct xe_vram_region *lmem_bar, u64 offset, u64 usable_size,
+			    u64 region_size, resource_size_t remain_io_size)
+{
+	/* Check if VRAM region is already initialized */
+	if (vram->mapping)
+		return 0;
+
+	vram->actual_physical_size = region_size;
+	vram->io_start = lmem_bar->io_start + offset;
+	vram->io_size = min_t(u64, usable_size, remain_io_size);
+
+	if (!vram->io_size) {
+		drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
+		return -ENODEV;
+	}
+
+	vram->dpa_base = lmem_bar->dpa_base + offset;
+	vram->mapping = lmem_bar->mapping + offset;
+	vram->usable_size = usable_size;
+
+	print_vram_region_info(xe, vram);
+
+	return 0;
+}
+
+/**
+ * xe_vram_init_regions_managers - Init all VRAM TTM managers.
+ * @xe: the &xe_device
+ *
+ * Return: 0 on success, error code on failure
+ */
+int xe_vram_init_regions_managers(struct xe_device *xe)
+{
+	struct xe_tile *tile;
+	u8 id;
+	int err;
+
+	if (!IS_DGFX(xe))
+		return 0;
+
+	for_each_tile(tile, xe, id) {
+		if (!ttm_resource_manager_used(&tile->mem.vram->ttm.manager)) {
+			err = xe_ttm_vram_mgr_init(xe, tile->mem.vram);
+			if (err)
+				return err;
+			xe->info.mem_region_mask |= BIT(tile->mem.vram->id) << 1;
+		}
+	}
+
+	return 0;
+}
+
 /**
  * xe_vram_probe() - Probe VRAM configuration
  * @xe: the &xe_device
@@ -298,82 +385,52 @@ static void vram_fini(void *arg)
 int xe_vram_probe(struct xe_device *xe)
 {
 	struct xe_tile *tile;
-	resource_size_t io_size;
+	struct xe_vram_region lmem_bar;
+	resource_size_t remain_io_size;
 	u64 available_size = 0;
 	u64 total_size = 0;
-	u64 tile_offset;
-	u64 tile_size;
-	u64 vram_size;
 	int err;
 	u8 id;
 
 	if (!IS_DGFX(xe))
 		return 0;
 
-	/* Get the size of the root tile's vram for later accessibility comparison */
-	tile = xe_device_get_root_tile(xe);
-	err = tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
+	err = determine_lmem_bar_size(xe, &lmem_bar);
 	if (err)
 		return err;
+	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &lmem_bar.io_start, &lmem_bar.io_size);
 
-	err = determine_lmem_bar_size(xe);
-	if (err)
-		return err;
+	remain_io_size = lmem_bar.io_size;
 
-	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
-		 &xe->mem.vram->io_size);
-
-	io_size = xe->mem.vram->io_size;
-
-	/* tile specific ranges */
 	for_each_tile(tile, xe, id) {
-		err = tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
+		u64 region_size;
+		u64 usable_size;
+		u64 tile_offset;
+
+		err = tile_vram_size(tile, &usable_size, &region_size, &tile_offset);
 		if (err)
 			return err;
 
-		tile->mem.vram->actual_physical_size = tile_size;
-		tile->mem.vram->io_start = xe->mem.vram->io_start + tile_offset;
-		tile->mem.vram->io_size = min_t(u64, vram_size, io_size);
+		total_size += region_size;
+		available_size += usable_size;
 
-		if (!tile->mem.vram->io_size) {
-			drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
-			return -ENODEV;
-		}
+		err = vram_region_init(xe, tile->mem.vram, &lmem_bar, tile_offset, usable_size,
+				       region_size, remain_io_size);
+		if (err)
+			return err;
 
-		tile->mem.vram->dpa_base = xe->mem.vram->dpa_base + tile_offset;
-		tile->mem.vram->usable_size = vram_size;
-		tile->mem.vram->mapping = xe->mem.vram->mapping + tile_offset;
-
-		if (tile->mem.vram->io_size < tile->mem.vram->usable_size)
-			drm_info(&xe->drm, "Small BAR device\n");
-		drm_info(&xe->drm,
-			 "VRAM[%u, %u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n",
-			 id, tile->id, &tile->mem.vram->actual_physical_size,
-			 &tile->mem.vram->usable_size, &tile->mem.vram->io_size);
-		drm_info(&xe->drm, "VRAM[%u, %u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n",
-			 id, tile->id, &tile->mem.vram->dpa_base,
-			 tile->mem.vram->dpa_base + (u64)tile->mem.vram->actual_physical_size,
-			 &tile->mem.vram->io_start,
-			 tile->mem.vram->io_start + (u64)tile->mem.vram->io_size);
-
-		/* calculate total size using tile size to get the correct HW sizing */
-		total_size += tile_size;
-		available_size += vram_size;
-
-		if (total_size > xe->mem.vram->io_size) {
+		if (total_size > lmem_bar.io_size) {
 			drm_info(&xe->drm, "VRAM: %pa is larger than resource %pa\n",
-				 &total_size, &xe->mem.vram->io_size);
+				 &total_size, &lmem_bar.io_size);
 		}
 
-		io_size -= min_t(u64, tile_size, io_size);
+		remain_io_size -= min_t(u64, tile->mem.vram->actual_physical_size, remain_io_size);
 	}
 
-	xe->mem.vram->actual_physical_size = total_size;
-
-	drm_info(&xe->drm, "Total VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
-		 &xe->mem.vram->actual_physical_size);
-	drm_info(&xe->drm, "Available VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
-		 &available_size);
+	err = vram_region_init(xe, xe->mem.vram, &lmem_bar, 0, available_size, total_size,
+			       lmem_bar.io_size);
+	if (err)
+		return err;
 
 	return devm_add_action_or_reset(xe->drm.dev, vram_fini, xe);
 }
diff --git a/drivers/gpu/drm/xe/xe_vram.h b/drivers/gpu/drm/xe/xe_vram.h
index e31cc04ec0db..4453d2ecc249 100644
--- a/drivers/gpu/drm/xe/xe_vram.h
+++ b/drivers/gpu/drm/xe/xe_vram.h
@@ -6,8 +6,13 @@
 #ifndef _XE_VRAM_H_
 #define _XE_VRAM_H_
 
+#include <linux/types.h>
+
 struct xe_device;
+struct xe_vram_region;
 
+struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id, u32 placement);
+int xe_vram_init_regions_managers(struct xe_device *xe);
 int xe_vram_probe(struct xe_device *xe);
 
 #endif
-- 
2.34.1


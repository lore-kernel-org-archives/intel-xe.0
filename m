Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D517BCCD1A2
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 23:11:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94F0A10E53B;
	Mon, 20 Oct 2025 23:11:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JwWf2VZ4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFBEF10E53B
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 23:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761001901; x=1792537901;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=LO8or/WpdQyc8BarXGsiS6CebgFWllKKoPFjfIRaR+0=;
 b=JwWf2VZ4+23qx5Eqcs+RGCOJxMvMqsCVaWIOdi0qgw4bpstHyPX3RvBm
 o5ZUlfio1e/TQysmve9A4i2o0KGg2u6IAhBneJhiRfY9N56fNR9hqlzeL
 n0Bvz58yPAarqmAslqKLQf5F1KC/XFSEnp4TT+DzT7Da/3mQd9BzVtEPs
 H4tuL0KYHooJYGS+dEDzvL7+bIDRAg2TfdIN3U/vGaBqHwIej5vPDwgwg
 PnpTLpBFK+4Os+YtRQEgmYlslKc/l1XLcT/gsoH2ExKXed+Kq+coBGY7Q
 mj3pK40jZLUC6armuZEYhZZj/1y0camzFmcJzjxV3ryvGf0pQhZohellm w==;
X-CSE-ConnectionGUID: sPCkWmbhThKvtdFhbS5qzA==
X-CSE-MsgGUID: EDCHHEAfRumtsTFA4UepVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62334508"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="62334508"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 16:11:40 -0700
X-CSE-ConnectionGUID: EF1+RZGjQCWMf07BCrendA==
X-CSE-MsgGUID: UwNtW5eYTE+7IXp3S8smTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="183925866"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 16:11:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 16:11:40 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 20 Oct 2025 16:11:40 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.50) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 16:11:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KHnDgaOe0yUP7FSAgwGM2l24PbgA7yrymuHCMENJJhUNzTKoKtVLJ03aGSNRqwuOoLu0JLlAaogF8s3zlGpAkxnXcPKxvHcBuhDZC9itLnRuo0PQSDKia6zwCZioC2/7yJsWva5jsL9lOPydL8+8jqCFrCuW9LoY4IOlcjOh4F4Wq4Jrg+ZUXPUZGKB8Sjvdsj11XjQorkn3O7SVjNX/lYE8moEKXMiz50nnvVEY66jD6wkOcD9nonmuR6d/q+uwQC5Cd6eBjFtAq6VATUzSFAXNvhgcp7WuezhWFdDROjaFtv8M3VbqUfN5b22bj4m3lmmV7j54ke8mkzUwJHHwUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8M8OEDdBgkLO75x4aO8sg6iO2eE0c40YeZAIpLXs3PY=;
 b=mz7bsOgNB7FrFwVOpeTIhuoDwB/rtXRnf/UA/0PDjdrQYvyXbZ/0NugMo6COBAx41N9I1cSHiTc8xNDYoidPHrIfx8LeJYgId911I7asON9qmncyD8+RJaD2G4kla/jt3P16icuBKFG3fhR8muysCihj7tHxHY+U25dhVW+VPRqSEnTbfBNtST+To6rmvn9SE8Nq+LQGXJE1N8W+VV4oPZS7bJZ9eWLBby/p7VqIddBogK82Ls7ziaSpMXQnEH1/BU5kRBO7REWlsIHxRv7tKVyW6L/F6Ibn+RcEriSxZrnnAm33DLr2SZKQ1QrcPWuMK+iPztcOEQngO7nHuvkPVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by CO1PR11MB4804.namprd11.prod.outlook.com (2603:10b6:303:6f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 23:11:37 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 23:11:37 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ac95442e-dff5-4390-8e2d-e09eaf0a56c2@intel.com>
References: <20251016-xe-kunit-dma_mask_size-va_bits-vm_max_level-v1-0-d0886d97121d@intel.com>
 <20251016-xe-kunit-dma_mask_size-va_bits-vm_max_level-v1-1-d0886d97121d@intel.com>
 <ac95442e-dff5-4390-8e2d-e09eaf0a56c2@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/tests/pci: Convert GT count check to general
 device check
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
Date: Mon, 20 Oct 2025 20:11:30 -0300
Message-ID: <176100189002.3231.12485030228821317627@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: SJ0PR13CA0043.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::18) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|CO1PR11MB4804:EE_
X-MS-Office365-Filtering-Correlation-Id: fa9e6d95-538a-477e-a249-08de102e04e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aXhtSENHenZCeklpemZPSG05aGthT2JiMTRpQ21ZZ1VZcHE4NU95Z21XK0RR?=
 =?utf-8?B?dTQ3ajRwOHRWcjZRYWpRWWlzeHR4aFN5enlJdTNkdUZEdjJFYlRiUTR6aGJI?=
 =?utf-8?B?NFp6eXM1U25hNTBKR1lRYTMwVkk5ODZsdjFmaXhxdDlRT0dCbTMxd0czeG12?=
 =?utf-8?B?SzM5QStyRXpWdnhWTFdzbFdONFdYRzV3MWpmejYzc2M5VHczVkUvSmZveHdq?=
 =?utf-8?B?Y04yYVhpajYxTSszem8yUUxPaXlYaCthKzdNSldpMWU0ZHd4blNraG5DWVg3?=
 =?utf-8?B?SlA0V3ZCam13TGZ0ZktPNy9nRDYrUE9qWHNKZlMwdXFGZENsREZCNGduZnF5?=
 =?utf-8?B?VWtPVTBLeE13eTNBT1MwRlQrd0lGWDhOYmFHT3dlMWltajMyMzIrRlNsOUo3?=
 =?utf-8?B?UzNSN2VGeHRXYWRpYmFQTmhLQWpsNW0rcUQ3VTRHWmRLYVJ4SUU1cUJHeEg0?=
 =?utf-8?B?ZG9rZzJKY2RreC9yMis5QkpSNmVmZStYR2Z1Tm80L1ZmVitTd2NLTmJpNG4y?=
 =?utf-8?B?d2JzdEYydTRiVjhOR2x4eTlBUnlHY0k0MmJlVmF6L3pGcHNPZmo1Z1dkTkgv?=
 =?utf-8?B?YUZmSjZoaWRuNmZoYnlkQ0djZ3RQdkM1ajZjVlJISGlwWUl2MXRhWE5jYlZJ?=
 =?utf-8?B?ejVRWDF6NFdSSXI4dmlDRnN2OUh5OHllZHFRamplbnpydlg5ZDkyS1p1Mlkv?=
 =?utf-8?B?aHBmeEgwbkh1YmpWd3NGa0JYQ2dTaG1VdEdySlA0czQ3amhQS1ZEamZVZ21G?=
 =?utf-8?B?VXFVd1czZ2xrNjlxa0xkK0JXZGlUMFNMSmJ0M3ZsQXpVYjkzYkQ2UHJkZUV2?=
 =?utf-8?B?TDQwZTN1bW1CWWp6c3p6OGFoR0tyZHlpTkwrZXRXeWFLdkpRcFdHbGNqVlYz?=
 =?utf-8?B?bm5uR3V1Zm1kU0U4WWJlKzFYQ0xFWU9xTW16SWloWnZzcXV1UnpnTHZsTXVl?=
 =?utf-8?B?Uithd0doNi9uT0xtMnBzWlZGbi9qdFEwZHdPcmI1U0JEaHBQOVEvZzVxUTFV?=
 =?utf-8?B?MU5hd1F4cnhNbXBTdTRaTi9DN0pJbktNaGcybnJQS1VqbU5FYUlzS0RWbnVn?=
 =?utf-8?B?c1ZSaWJzWkV4Y3BFU2M0amtjcnZoWFlUSVNpbkF5c2lJUUxKMjdrM2lGa0Vw?=
 =?utf-8?B?dXRvQlBldGtnejI0VDNUMzA0d1NlMHBjQUpoci9ORzlVRmEyZ2ViU2V5N2dv?=
 =?utf-8?B?YktYVHJCaVMzYXdlNlpDNThxb3hjTXdRUHhhbWRQL2V4MFord0RNS0laZkxq?=
 =?utf-8?B?NUk1TEZ1TEJPM0pNVDFsUXkvUjRjNE1EcW15TzgraFZ1NTdyanJPUTZXRmF2?=
 =?utf-8?B?TTRwcmU1QWRFTzdiQWxkWWo1bzlFSis0NklNZXhSU3JpcHFFUlRrQk90am5p?=
 =?utf-8?B?T3U0K1U1UTdVU0JILytiWjlWNzVKbURDUUZXY080WmxQSXFKLzNJUWlHRDNx?=
 =?utf-8?B?UXIrNTlLbXFhMG5abFdQanhvelJhUEIxM0s0WlJSVXpuSmV0VlF3ZU52Z0Vw?=
 =?utf-8?B?K2JEUlZwSU5oRk1sQUlNV2hOaGZodElVTjRXeVpQMzVxMFhRMDJQTUZ4Wlow?=
 =?utf-8?B?VmlrakYrZ1o0VGpUU1Izc0hUOTJRRmRRMFQ0SHRPcnU1ZGp1eUZkOXVEVk1X?=
 =?utf-8?B?UnkrdytNR3VBR2tpd1JsRHFqRXgrM050aW96SU94bW5vS3h3N0FGZGtJUkUy?=
 =?utf-8?B?UktiUmFpSEEwaEJkd3lrRjlBaVlnS0h2YTBxQ1B1Mml3c2ZaeFltMVFiQm1p?=
 =?utf-8?B?MGVPT3NxQkQrWWI2bnY3TmVyQ1p3ZDQ5YUFPMlBTcFdmUDh6TGZUZE5hZlgv?=
 =?utf-8?B?elp0QlVvSWhiTW0rZDZ0eUQrdVBoNHlrT0xNci91TTI1eTR5YmFtekdUVThr?=
 =?utf-8?B?NEFWR3Y3V3dkR2JSSmJTQ25ncGxGeDdIa1QyVlhqY1hEWDdpRGN5REdSY2gr?=
 =?utf-8?Q?XnZLU2Vm4urqc0y9eo7DIBIg4VG3vHtE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzR2cTE3bnZmclQvall2bVVYZUlYTkg0am9mV3FJcUlORzJnM1ZCNTRoQUxZ?=
 =?utf-8?B?SlNNeHM0bUNxeDE4aXNZbDVWaEwrV3ZUSnNFMGFyNzR1QkhiclRsSUsyQ0k4?=
 =?utf-8?B?bU94L2l6WnZsdTlyVCtoM3YyVXNabDVNZVJzV0lEWjNiOUw4VVVSRnh6ekVO?=
 =?utf-8?B?ZDlsa3JQTkdWWkQ5aERwYk1pV3llTTI0Ym8yVFVQWWJnQ1Nlbis2aldIbERF?=
 =?utf-8?B?K0o5RlFrU0R1bWs3V2l6aHQrTGFaT1g0T1E3L0phUndVV004QVZqTnpUSXNq?=
 =?utf-8?B?aDNEZFAzNDFUYWxjT1BiOUFxT3FiSHBmam1zKzE1eWtPRzVMQzdSaXJvQUdr?=
 =?utf-8?B?SXJiQkNFOGVmSVlLMkg0dDgzRVZPTUY0dWgvTTdaYVlPazJpazRIRnNCd1pw?=
 =?utf-8?B?akJ0dlAzM2xjZStuUjdoMEVPOXNqM0k3bGNqMlk0L3ZoaDZUblVuT0tjOE5V?=
 =?utf-8?B?VVNEY2MzcHo2VDRnY3I2NHBraCtjMCt4YThWSHZjbjhYR1dyS1NpRmlQaTdk?=
 =?utf-8?B?Q2QxVllKVFBxeVd0VDBJODZkbFlCK1lZcUFCdVlwVWlaK2hXTDRrUkphOThP?=
 =?utf-8?B?UEUrcldVQkszUW1mSDRVZmNpSGJ4eE9FT3dQdVcyZTg5aG1jWC9OV2NNQ2k2?=
 =?utf-8?B?NEZBL0c3VWxlMHp0bXVKUHhMbVE2NjNIZUk4RDNUaUZjUW5STlJTUTlZK2hk?=
 =?utf-8?B?V3JCaEloNmxmTGhTOWJrZ2p3ZER2Y1Fuck4reVIwR3lHcWJHejlwVzVzS01p?=
 =?utf-8?B?VjJPei83WVpQTVN2NVpZL05hYlBObTFuQng3cktzY2xyajR4Y1hjaXkvdXVa?=
 =?utf-8?B?WjNQOUZUb2ZnZ2ZPMzNJWW9LTFlKMGtkNFcxanpveXYrRjh6bGE0K0xiOXBk?=
 =?utf-8?B?eFAvSGptZUxmQU1XVDI1NU5YTHpnNmdrWkJFSGtuTDN6MDNWQ25YdlJ1S0dv?=
 =?utf-8?B?OWJVU0EraWZIaUN2cmkxMzBtVVkwS0ZpVEc5YTVoQi9Ld3hNcXVuVGJqeUs1?=
 =?utf-8?B?RGVqQ3JCei9keHhQZkFXczdnV2FxaUt0NGVpUVlsS2hzbjRhR1VDY3BEeEs3?=
 =?utf-8?B?NEdxZUNvWGRhSEEzaDdBSk1iaFAwNFp5bkpvbWVHUGxkeTNpUjk3M3VRcGtk?=
 =?utf-8?B?UEh0RXZXd3QzUlhIaDZWaXBST0pDZDIxdDlkckNLRXYzazZlNjcwZC9iYUc4?=
 =?utf-8?B?TEprdENxQngyZUxYd0V2Q2ZvSUdqMlVsR3M5NXdjUFhTdGpwUGExT00zSHNX?=
 =?utf-8?B?aWZ1VTY3RWplMlQ2SUZoRkMrNDBsL1R2NWRDcXQ5K0tMMmtsWFh0NmJDaEVM?=
 =?utf-8?B?bDhEK2NGRkZhKzVzYnNpcDkreGV2WUczSlNJUGltRUpNbFhGY0g5UFgzWDRu?=
 =?utf-8?B?YWlHS25HcUo3MFRjRU9IbkNwNzRxakpzMk9LUVB0R2ROZ2thTFlFN1lMRW82?=
 =?utf-8?B?RXJHWUp2YnlkakROZUN0V01qZ1VSQVkraTJYOTNwbDZPV29QMkNrYWRhdUFT?=
 =?utf-8?B?WkpFREFIV2VGUEtQaXNuNmxic2tNK3dFK2RUeVRCaWJJM1l2SS9iWkxmZ3Vz?=
 =?utf-8?B?WCtteTNyQ0x1OEdXL1lHaWY3RDRqaDlUcHdmNmUvQ280RUhScEUxVUVPSkJB?=
 =?utf-8?B?WnRWSytPSW40UkZYVllJVkRVajMxRjRJazdObVlsWlg2NWh1Qy85ZktSYzFG?=
 =?utf-8?B?UHU3UFRua2Y1U1Q3N3pOUmNZdHpDbmhtRG5iMnc4YTNkb2ErNHJFc1ZMeDcy?=
 =?utf-8?B?d1kvOHVlMU5lL2pCOWtXNDRVVzFueCtvR25XS1NOWTZhaWlQNlFTK3ZyZjVT?=
 =?utf-8?B?dGpBZThpdkl5M0tXZWxHcklNN2JFaGFKc0x3RUhqbVR0aGdKdHhPYmUyVkJr?=
 =?utf-8?B?MWZMajNrTXlHbVZpbjl3YVA3RXpzYVZTSll6THRjM2trczRBQ29wSXkzdkhs?=
 =?utf-8?B?YkN0eTdkNk0zNGZrc2l2UnRXWnZlNXRwN20xZk54ZXV2NFB6YWViMGVCUGIy?=
 =?utf-8?B?YWlDWUhIOVU5RGJIV011L1N5cVNjbVZaNjJzbDVJSEJPaGdnSmh1bHE1dWdV?=
 =?utf-8?B?bFZCN2Nqd296ZEczZnN4YTk0YXl6RTVGaXQzU3ViZ09CTitsZ1RoU25kOVVO?=
 =?utf-8?B?cSt6YmRmQUJZOWh6YUgzZ0twUytuY3RNRmJmUXpQY1dpTG1wSEh0QU9TYnEx?=
 =?utf-8?B?d1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fa9e6d95-538a-477e-a249-08de102e04e6
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 23:11:37.1419 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S+0xJhpgV33gw9OzQrWLz/inNmqlmL+ZyNwdeuFJIYUjw3nTsggNx+t3qBkOS8CsEtIFv4sqsOngC2a1eSDMjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4804
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

Quoting Michal Wajdeczko (2025-10-16 15:55:48-03:00)
>
>
>On 10/16/2025 7:49 PM, Gustavo Sousa wrote:
>> We already have check_graphics_ip() and check_media_ip() as general
>> functions to check the IP descriptors.  The check in
>> check_platform_gt_count() is simple enough such that we can convert the
>> function to a more general device check.  In an upcoming change, we will
>> also add some checks for other members of struct xe_device_desc.
>>=20
>> As such, rename check_platform_gt_count() to check_platform_desc().
>> While at it, use inline (int) casting of max_gt_per_tile to keeps checks
>> for each member localized.
>>=20
>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>> ---
>>  drivers/gpu/drm/xe/tests/xe_pci_test.c | 9 ++++-----
>>  1 file changed, 4 insertions(+), 5 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.c b/drivers/gpu/drm/xe=
/tests/xe_pci_test.c
>> index 37b344df2dc3..f09efb523b7e 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_pci_test.c
>> +++ b/drivers/gpu/drm/xe/tests/xe_pci_test.c
>> @@ -44,21 +44,20 @@ static void check_media_ip(struct kunit *test)
>>          KUNIT_ASSERT_EQ(test, mask, 0);
>>  }
>> =20
>> -static void check_platform_gt_count(struct kunit *test)
>> +static void check_platform_desc(struct kunit *test)
>>  {
>>          const struct pci_device_id *pci =3D test->param_value;
>>          const struct xe_device_desc *desc =3D
>>                  (const struct xe_device_desc *)pci->driver_data;
>> -        int max_gt =3D desc->max_gt_per_tile;
>> =20
>> -        KUNIT_ASSERT_GT(test, max_gt, 0);
>> -        KUNIT_ASSERT_LE(test, max_gt, XE_MAX_GT_PER_TILE);
>> +        KUNIT_ASSERT_GT(test, (int)desc->max_gt_per_tile, 0);
>> +        KUNIT_ASSERT_LE(test, (int)desc->max_gt_per_tile, XE_MAX_GT_PER=
_TILE);
>
>nit: maybe cast to (unsigned int) or just to (u8) since this is base type =
for this bitfield in the struct ?

Hm... Ok. Well, I think I'll go with (unsigned int) then.

>and maybe use KUNIT_EXPECT since there is no need to stop the test after f=
inding first bad field ?

Yeah, using the EXPECT variants is a good idea!

>
>anyway, LGTM
>
>Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Thanks!

--
Gustavo Sousa

>
>>  }
>> =20
>>  static struct kunit_case xe_pci_tests[] =3D {
>>          KUNIT_CASE_PARAM(check_graphics_ip, xe_pci_graphics_ip_gen_para=
m),
>>          KUNIT_CASE_PARAM(check_media_ip, xe_pci_media_ip_gen_param),
>> -        KUNIT_CASE_PARAM(check_platform_gt_count, xe_pci_id_gen_param),
>> +        KUNIT_CASE_PARAM(check_platform_desc, xe_pci_id_gen_param),
>>          {}
>>  };
>> =20
>>=20
>

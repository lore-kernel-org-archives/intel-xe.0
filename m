Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F08B2CCFA03
	for <intel-xe@archiver.kernel.org>; Thu,  6 Nov 2025 14:25:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 754CA10E0D4;
	Thu,  6 Nov 2025 14:25:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ftv+4N/Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0D3610E0D4
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Nov 2025 14:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762439103; x=1793975103;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=R4pY2UhSW7uXiwjHtzx+7u7obyIFLK5kH1AUCgWDhXQ=;
 b=Ftv+4N/QwXU2bpKmMsq1pokuyE9ObYa+f4fz1CwAzDftguQwoj5p3r8X
 hcPzNMlZnELpOouZqfPBURJiET5X+8SJ8C79LZiKumO2/BcQMUd7Jy78u
 Dqk5cK+ZcCseFUoRHvDz2ek7RibF5H4sR9fUjBzrWtUn4wdThCXurD7rT
 uD7P+KMOhXhOE5wyCRUxCwpAru4k9ZqLQUN8bfRYJmWf5iIlzQ6aO0fBL
 8TLfsZOZJuIa/n5j2eAg1G5XXv0sDHKVfu8sVGFXqWxpuwCpLakKSF/MU
 kvacz2EaeLb4GNdD2krhLOMHXhyb5hg9PFQKOvi2xgKZ8kBLkSK5y0Ro9 g==;
X-CSE-ConnectionGUID: rVxxEtzyS2a6xPqGQvSR9Q==
X-CSE-MsgGUID: x6yHqvw8SqSzy2Gn8U8ZVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="64273110"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="64273110"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 06:25:03 -0800
X-CSE-ConnectionGUID: c0oJut45RMGcRWMD8c/x7g==
X-CSE-MsgGUID: ATTafhgHTNW63ezhPmi62Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="218523159"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 06:25:02 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 06:25:01 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 6 Nov 2025 06:25:01 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.67) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 06:25:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lbBcl/NRHZ3tloEopjFBBcYRJnmfbeLvatteRFgveKHjDNo7gi4UDiFO60Ab/0ZHJs6xEDW0zdiATUkyeUZ2yDkkdctoxAYgr1efbEO9tMfWiii1Y3znBI98Ifoe8rcYt3hBIdyE0l0DDTtvwWyU1/M8/zoEtJxwxo051+ZjIc7q50g/j8+iHdrwXOfcQZ+tMjZ6PAEdXnQ2FH3nBBsyOqe7lad48LSTM2AHG2n17XbHyQrEgJbfq7L9bqiRnHb9KlzapBrsJNA/lqenn2JySswuLTCtVAC4sl2HqQcdQ2uo173//Gp7Bm3YjXNcC3JUgJC4YFw5/YvUEXYndoa9+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b5gEcm3ZvwAZ3fj4OsUQp2iaG2Nb6+jEd8oQJl3Bak0=;
 b=dMvSWJisnbPfNv4Jpdn3TN+jT8NWPaTKIYCeO/tCK/2Kc1h/GG57pA4C6Hr6hkEHo5VwJ1nGZHF0lz+7L3ehYVo6IWAaiEW4Ra478BWqF2kgl7v+//sTC2R32TB5NErqBLlmXQopoDYJqYngByrkiBAVW11r9CaxQ4eOnGfAIF0yxX1xTN/842uWXgiSJ6lYDQIjJTFukkzlurt6CFMEK97yPKnUQ7lKpKXeN7t8bmByGDk6XE+jwVvoaSKeNTDPcLn9yxUAW5ibe7MraeBtcF0T+mRxmzIAlpbWy7g3eWUYZJPX6z00FOO/pZUJOv82NKSqHCV0xr7t0P98IiMtVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SJ0PR11MB6574.namprd11.prod.outlook.com (2603:10b6:a03:44e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 14:24:58 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9298.007; Thu, 6 Nov 2025
 14:24:58 +0000
Date: Thu, 6 Nov 2025 15:24:55 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/xe/pf: Use migration-friendly context IDs
 auto-provisioning
Message-ID: <20251106142455.juyvarn3wqqa43ld@intel.com>
References: <20251105183253.863-1-michal.wajdeczko@intel.com>
 <20251105183253.863-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251105183253.863-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: DU2PR04CA0222.eurprd04.prod.outlook.com
 (2603:10a6:10:2b1::17) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SJ0PR11MB6574:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cb4dd01-62e6-43f7-39f5-08de1d4043b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cy9WSy80NzZlRGdyNWxJRFpldUhuODlPUFlGck5uZCtXbGpBMXEyOGp2dXd5?=
 =?utf-8?B?ZC9Zdm5ucDVrb1JIM0hlVUhPVko0TW5hVWR5ZWdYUm9EYzVsOVR4ZGwzS2xm?=
 =?utf-8?B?Rm0xVmlPcVZOQTM1d0Y5MnVLRUdjem9zUXIzNmNSK3Z2a3JsYkh3MXlCTXJX?=
 =?utf-8?B?NXVjLzZmWnh6RDRyekorMHlXcTVDWTV6b0lCNitObUFwUnBxSWtib0haOVFu?=
 =?utf-8?B?QlVVSmllT1NMZEN1R1BZRGp0bEltS3FsKytmOW9BbnQ2RFhTWFZlZXRqc2tS?=
 =?utf-8?B?WlBoOFVseXh3NmczR0pHdUMzMHh4TXBWK29FOTZRWklJUFpCdUptY0NNTTY5?=
 =?utf-8?B?aCtEdzFrcmxZd0MxV2w1VkZqYWhRU0o0Y25DZGVXaFYvTzkvbXFlME9NRThX?=
 =?utf-8?B?S24yY0M4TXdhdWJXNFh1RUd3RVZSbmlINWxzSTZmdGd3NnpET0lKRmhxeEhl?=
 =?utf-8?B?Z0xGVjNXZEZGS1UyeXZROVFTajNQVU85V0hONFJxazlzMlJhWGtLSjNhcGdJ?=
 =?utf-8?B?Q0xrdWZtcFF3TlM4MnhLNnNtRCtMR2lCNkRhYU5uME53c0N6MVp1R0p5L1R4?=
 =?utf-8?B?YTJWRi9lTEs0SUUzcGc2NlBkeXhCR1dQUGJFUFNoUS9lUXRHS1QxM3JNdEZD?=
 =?utf-8?B?RHA2VUhOK1hLa21QM0dQTmtHV1FXTGtnUUNmWWZsV3BBaGZkZURqMWRWUmRO?=
 =?utf-8?B?YjJGSmEvVm9wMDhoUlMxdjlBRDA5bnZkTjJWTkMrWlVXZDRoS1V3T3lMOW9R?=
 =?utf-8?B?aU1UYlhHaS9hb0xKTXFTaXRxbXJGUVRCaTZKWHNFcUFiZ1Q5NkNGQSs4Wjdr?=
 =?utf-8?B?bVh1L1M0YkV6K0xJb1NjTUpBTU1jbE02bllJTDlna1I1Z29ZeFZ3dE5uRkVa?=
 =?utf-8?B?cTB1OHZwcEZaZ3BiSW91R01UY29EUGM1MERhY1FuaUVVd2tqQmJYOTlFeUlN?=
 =?utf-8?B?V0MwelZETTdsRHRFeU00RUJIS2tic2dOQlp3OWorRkFoeE1pZWRVUE1OZU1C?=
 =?utf-8?B?Z3RZd3dNVWFLeTJrdUZvT1Q1UEZ3RHA2ci9xUXVtZjdKcnkwYWNRZlJFaTZI?=
 =?utf-8?B?bmpTUEdiSE9zVEtSdUxjeUQ1UzIwc1RZVVpFaWEzNDRkMGRXUm9YR2crYkNV?=
 =?utf-8?B?QUZxTDE2TjE3RVFHVktoOWNweDdxY1o3ZC9nQ0hiWGtZU3V2Q3VTQ0tWTVZp?=
 =?utf-8?B?ejRJMFpkUVdNWnEyS2liN1I3ZmtFd1FEZTFFU1VqSEFGNHRIUEhWMGlxMmZh?=
 =?utf-8?B?R3Yvb2Vta25ma3NCeWNBbVAzczcwc3c2aUZiRDJXMjhubzdnR0xzUXNsRzNJ?=
 =?utf-8?B?M0JyNnl2cm44VWdqM3pSenFoYW13NEVQNldJRGpUSVd5T0tvTEtVRVNxTGQw?=
 =?utf-8?B?UG5vajl1SE1sN2U0OUJpSWhFM0VCRENScFVDQUQrWTVRRkRYTjRTNjBrSGdJ?=
 =?utf-8?B?bVEwY1RHck5veW5tVFVUcXFMdWp2bThyaG9rcWZaRC9Qd0FLMTMyRDJWenBG?=
 =?utf-8?B?c1Q3b0FiYWRkU0gyVitUYzRSbU9SSVUwQmhsNFJCVzFrczdJcXFaMzBlR0Q3?=
 =?utf-8?B?YWRTbU82Nzh3RCtWeUFFTnBrL0I5NmJiY1lBckZzelJZVHlZTHI4V2t0cXQ0?=
 =?utf-8?B?ZzlHeXRZaEoxV3l2SEg4S2NWMFlSbWlXbk8xK1dZY2VLSjVFbERyN1NBdVVK?=
 =?utf-8?B?Z0ZXYmo4VHJuT2VyNUZpWWJTSzkzTG5ia3FmRkpzcDN2SEFMNXF3V3pIanlZ?=
 =?utf-8?B?VTFnb0M5NlBvWVg3VGQvSXdWNTVMY1l3bS92MlIxYmxWaUpOQ1J6MjZHVG9P?=
 =?utf-8?B?bzA2VllmOGZBUm12RmdsSU5iSm92L1h4Y0ZKYWM3emt6UFluc0tYYkE4TUhQ?=
 =?utf-8?B?N1RXVlVPSjkyWWpma09oNHhRbURzM0JnZVdldWgvLzRJZlRLYTNwTk9BRjFo?=
 =?utf-8?Q?qhMlYQiVNc6d32EtUDAhoqHCnpIvXrpE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlJDMEhLMnpXOTdHQm1sZG1zQ3pKcDNXS21VZVFZR3E3ZTlIOGVWd2RoaUJ2?=
 =?utf-8?B?dnc4MWc2MjRSbkJmT2RlUkVCcW9sN1FIM0RiQTMyN2g1b2xxNWJxK1lueTBK?=
 =?utf-8?B?ZzhWSDY1NW1VaDFRcHdIVk8rb0FrenRVZFFkS0R3alhXTC9LNGM1NTdpOUNS?=
 =?utf-8?B?Tk9hdGgwSXMyV1BlZzRlbjgrZHlnc0JrWEZkUnhZLzFCTTM4b1QzMVdyamZu?=
 =?utf-8?B?Q0k3dGtiRzNBUTcyMjNsSTJBdDN0QmQyRWhBRFRaMkZER3daK2lsWnJIRHdO?=
 =?utf-8?B?Rk55djRwNWhlblBYdk9KQy80V2VjMyt2RVRGdWp1NjBPb09BZVpPbE5ka3Uw?=
 =?utf-8?B?cGkvRGtZeDc5U3dsaFJJZk9IYVZmZVF5OU9KS1B2aHQ1Z1RVMFozbFBmRDJa?=
 =?utf-8?B?ODNjQVByWDh0ZVJCdndmUk5JTmpISGlNMDRXT2hveXFuRW5mdDNmamFudFYx?=
 =?utf-8?B?clRoZjVSNFVnTTQrai9vdTlWeFJIU21Gc1FXWUhkbU9HeXJJWUZsK3RhWG00?=
 =?utf-8?B?UEFvdmkxMEZTMW5FYW5UdkxaQ3FJcUN6bElSang1OExRQWZFUkd6L01JTFV2?=
 =?utf-8?B?MjMrZnV1aGxmTURBa1h4Zjh2NW9OTDRQNHdzcGVvS2dyWldjNmw0djdXV2Ns?=
 =?utf-8?B?ODRNVmZZV3BrSllMeFFBOHN6cjhjYVVYQXlGZmxzYU5Na2R6OU9vMUVJOXBq?=
 =?utf-8?B?MkdhR3JPRGsrWFNCREc3WGtFOEJVcjNTWTJJUUNXQVpFd2ZRaE10R2tNNUxF?=
 =?utf-8?B?cW5Tc0xFejQ4ajlXay96RFVhRS9uWGRqU2Z2OXZGV0JvaS9kMnkrdUdGVzA1?=
 =?utf-8?B?TUE0VVlBZUtSMFdaZTFxNzdVR0IySmlFVFVLQnRSWVZJa2tYQ0pjMzNuSjg0?=
 =?utf-8?B?VGhZSnFjb1IwQjU4RnJpNmtUS2dEYnFjeDhKTDRnYzVibldocDFqMW5zYmV3?=
 =?utf-8?B?Sk1pUFpGbWwwZ2tTME9URWc5TWxjMWpLM1RTZVNRakh2bG1rd2lxb3JrNWw2?=
 =?utf-8?B?RWxqV2QxZWtVTDFqcTdNa3R2ODYvLy9lb3YweDM2Y3FYSmhXQ0YyaFlSYWFS?=
 =?utf-8?B?OTVtaUJ3dFR6bXB5U1ZuZlU0cnBhbFM0K1BuZnYwREwvZUdmZ3pEVW1ObUtZ?=
 =?utf-8?B?UFlqTVlmaE1wUXVPSThZQzFTVWJ6MjBIbUVJdjZaY0N3a3p6di9Lc1B0Qlkx?=
 =?utf-8?B?b0pZcWJLaU1VUFg4ZUVhM0pqeWE2LzBaaXBVM1BYNUZPRE96Qy8zQlFkVURw?=
 =?utf-8?B?OWNicHQrSWlvTkRrcVM0aVZrTCs4Q1JTMUtIK0wxQUZhVlNTUGp2QTl1blRq?=
 =?utf-8?B?eWFmOS9rbGFSSGJXOFlZa3RLN1NCNVpSNEQwK3FUYnU5VERRdFBVT2VjUmgv?=
 =?utf-8?B?RW80MUVUOCtSNEM5STc2RUpPdDZwK3JDbXRlTDYwWnJQTVZ4WmlNbGN0YXRO?=
 =?utf-8?B?YThQY2Y3S2lUR0JCVGcycitnTGFnOEVTMDlKTU5qeC9TWlFKaUR2ajY0SWY1?=
 =?utf-8?B?aE9iVnMzSGZudldiZDloWi96RVVUMklIK0phZWFXWXJvajFxUndVY3diSHBV?=
 =?utf-8?B?RDFTaGorNXFXRFdIVThCMnhibjV6cHVLeG5sK29taXp6K3pVb3VNWVJNc0Nz?=
 =?utf-8?B?SXdZZWphZ1JZOThrS3hldjRQV1FlR1dYcVczb29QeE15c0xCNjVEOUlBMDgw?=
 =?utf-8?B?VDZ5TUUvZ0x3bGFLcW5Pczg5d0JMU1lKU1ZEa3RMRklVVGJIeCswdyttNDlh?=
 =?utf-8?B?NFpXbmNyZGpxVnliYU1nZ0V0bndUd3F4MER4U1AwT1dLeHV5cHNxTXp0aUxZ?=
 =?utf-8?B?b1VtZ2JqYTFXS3RFemxYWTFsUjBiWXRwNkNJNExTc2thQzJtUWp5Nkg5d0ZQ?=
 =?utf-8?B?cFJXcERZdk5qT3BtMnpoMjMzelpVSm4vZWJ5a0dqM0g5Rm5iSXhjc1ZlMHRP?=
 =?utf-8?B?L0JEL2VGY2xVcTNkNFhMd2tGVFNwVm12ZFQvSGNxcjZxb0lMQ1ZzUEtOQXVo?=
 =?utf-8?B?NzM3YWlydDNJWmxxYVozVXVnVC91NStoNVNoRTNCNTRZSGFOQ0NVYkw2NHV3?=
 =?utf-8?B?UUFJK3BqQnJFdEJaSlFZRDBzRjBqWG5DYnpCbUhDcWRTOE5sRVBLNGZId0FR?=
 =?utf-8?B?eXBVVndHT1VuNHlDOVlFZDdVSVNkTVB4aXJvL2QvNnlVRU1DUDdyOVNhNlFo?=
 =?utf-8?B?WkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cb4dd01-62e6-43f7-39f5-08de1d4043b8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 14:24:58.5607 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: brKRsKLIRyaw0aol2lA2isaEpx6WypKiQvqtnZgj/bUcdcWsnvXX7Ow/LiEZ6fQVFLcqcF3VLSXMEPaO+j28/C6j0plB83ihMD3UekHvQbs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6574
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on śro [2025-lis-05 19:32:50 +0100]:
> Instead of trying very hard to find the largest fair number of GuC
> context IDs that could be allocated for VFs on the current GT, pick
> some smaller rounded down to power-of-two value that is more likely
> to be provisioned in the same manner by the other PF instance:
> 
>  num VFs | num contexts
>  --------+-------------
>   63..32 | 1024
>   31..16 | 2048
>   15..8  | 4096
>    7..4  | 8192
>    3..2  | 16384
>       1  | 32768 (regular PF)
>       1  | 64512 (admin only PF)
> 
> Add also helper function to determine if the PF is admin-only,
> and for now use .probe_display flag for that.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 16 ++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_pf_helpers.h   | 11 +++++++++++
>  2 files changed, 27 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index d90261a7ab7c..14feda215d5b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -985,6 +985,16 @@ int xe_gt_sriov_pf_config_bulk_set_ctxs(struct xe_gt *gt, unsigned int vfid,
>  					   "GuC context IDs", no_unit, n, err);
>  }
>  
> +static u32 pf_profile_fair_ctxs(struct xe_gt *gt, unsigned int num_vfs)
> +{
> +	bool admin_only_pf = xe_sriov_pf_admin_only(gt_to_xe(gt));
> +
> +	if (admin_only_pf && num_vfs == 1)
> +		return ALIGN_DOWN(GUC_ID_MAX, SZ_1K);
> +
> +	return rounddown_pow_of_two(GUC_ID_MAX / num_vfs);
> +}
> +
>  static u32 pf_estimate_fair_ctxs(struct xe_gt *gt, unsigned int num_vfs)
>  {
>  	struct xe_guc_id_mgr *idm = &gt->uc.guc.submission_state.idm;
> @@ -1017,6 +1027,7 @@ static u32 pf_estimate_fair_ctxs(struct xe_gt *gt, unsigned int num_vfs)
>  int xe_gt_sriov_pf_config_set_fair_ctxs(struct xe_gt *gt, unsigned int vfid,
>  					unsigned int num_vfs)
>  {
> +	u32 profile = pf_profile_fair_ctxs(gt, num_vfs);
>  	u32 fair;
>  
>  	xe_gt_assert(gt, vfid);
> @@ -1029,6 +1040,11 @@ int xe_gt_sriov_pf_config_set_fair_ctxs(struct xe_gt *gt, unsigned int vfid,
>  	if (!fair)
>  		return -ENOSPC;
>  
> +	fair = min(fair, profile);
> +	if (fair < profile)
> +		xe_gt_sriov_info(gt, "Using non-profile provisioning (%s %u vs %u)\n",
> +				 "GuC context IDs", fair, profile);
> +
>  	return xe_gt_sriov_pf_config_bulk_set_ctxs(gt, vfid, num_vfs, fair);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h b/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
> index 4a4340fb633a..3ddeba4451cd 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
> @@ -48,6 +48,17 @@ static inline unsigned int xe_sriov_pf_num_vfs(const struct xe_device *xe)
>  	return pci_num_vf(to_pci_dev(xe->drm.dev));
>  }
>  
> +/**
> + * xe_sriov_pf_admin_only() - Check if PF is mainly used for VFs administration.
> + * @xe: the PF &xe_device
> + *
> + * Return: True if PF is mainly used for VFs administration.
> + */
> +static inline bool xe_sriov_pf_admin_only(const struct xe_device *xe)
> +{
> +	return !xe->info.probe_display;
> +}

Honestly, I'm not entirely convinced by this condition for pf_admin_only.
I wonder if we shouldn't set it up differently, e.g., through a dedicated
parameter. But for now, I don't think it bothers us too much:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> +
>  static inline struct mutex *xe_sriov_pf_master_mutex(struct xe_device *xe)
>  {
>  	xe_assert(xe, IS_SRIOV_PF(xe));
> -- 
> 2.47.1
> 

-- 

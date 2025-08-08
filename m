Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B16C87FD2
	for <intel-xe@archiver.kernel.org>; Fri,  8 Aug 2025 14:44:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8818310E06A;
	Fri,  8 Aug 2025 14:44:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C8ZaNBgK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E883210E06A
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Aug 2025 14:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754664259; x=1786200259;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=k6+ZHcXiyfjgFxF5NbF1+u7rWB9WltZ79eFw4y7sjN0=;
 b=C8ZaNBgKfNH8gNoz404QU1DTN25flBZ+nYG6KEEM4+1EJEWfaKKkqq2/
 gvcoFISSGESw7jTHW/AgCLlxKA9BzYLSQpCIDG+5RJjXUHH7sP+3nHKVJ
 qpv9AwlqVvq8Wma6tYLMjVW1rSdVPdMs0Bf8FaBVLs/1M5eFe/ki6+Gks
 H8yEVBEvCTcIK10MhRkbieHHIraU/YA4cxSdly9JrFpmyS/fdaBGxPkTY
 F7mTCsAkA2CvNUraebjI+7tuVCNrODLjLe0yqejSYiVl007vl9PedKi0d
 Z4xQq5bxlIh4mxdS+H/m84hqj0Umbap/eraHu3I42d9E69nmVODcm96rM A==;
X-CSE-ConnectionGUID: gkO11Y8DTRSBUtrFeEz2cg==
X-CSE-MsgGUID: 0kC9a0A2ToSgbohb9GpkFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="68469167"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="68469167"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 07:44:18 -0700
X-CSE-ConnectionGUID: lNklvTbpTuC7/3VrdVmNnQ==
X-CSE-MsgGUID: y8iC8j+VRWuqO9WB67jE+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="165756145"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 07:44:16 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 8 Aug 2025 07:44:15 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 8 Aug 2025 07:44:15 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.63)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 8 Aug 2025 07:44:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rLP9KuYUDvJ0OLPi1Y42pRyNfVCN7SryO4KpaBKnpuwIHmCf+LpUTI16liN2yEw9M3SN3Ll/snEal/MYxbFHT4stNBNpctujYRClQ8Up76paLIu/t9PUbu8SNMnff4NuhHw8/0X31DHcJAfXI35izZsjy+Gv9R57zc9QIa9bMalgNUJJ19LdG7Q+fY+FtocZrXemYnZvYhCRFkIfBRYc/ynigBe7GM8bfJa2NLqtsZ7SZP2As1LDVM7rt2lq6aFbPUbnqM3LcTxrOKnxJ1JbhJCRlzz9o6QT82erOPzFcyIiXc+vqtFYXsRV6g5xa+QzjJrY9W0zH/t+pxvRPUqG0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4o7D8trqDhAjMd48hs0hXVDqVc+OmtieOir1ABxnIjM=;
 b=bxrWVtHXEfmixmvkH9hyE96sFSUdz6RtnP8aReVaLifftqCpa9k5HqcFAS7lQtqIK1rw4pa3Nzj5HtrofYRfX/rjkl81WyXSZM/LtnGEtRf6LCOwXMtTiQEGPSDys+H2+Z0tHKppgFzVDh/udkDtRE20vi5P1KHdq8iDRWi2VbzpPs1t8M6vp6inNXxapXNynU4BPr/yHLLbWXFx3ZRIczGEzOWK3tu3WIxYGMWu0Ge0MaLZEbyqVCPEQ43Bi2kDccqp2dYfGlC/6DQhdJRfKpTVDkAA7p8dQKk5E4JXGXrBj5mbx+9MQD/IuFXF0XHmeNQlCsZor/nS5N/XRZ99IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by CO1PR11MB5124.namprd11.prod.outlook.com (2603:10b6:303:92::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 14:44:13 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.9009.017; Fri, 8 Aug 2025
 14:44:13 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Matthew
 Auld" <matthew.auld@intel.com>
Subject: [PATCH] drm/xe: Assign ioctl xe file handler to vm in xe_vm_create
Date: Fri, 8 Aug 2025 16:44:04 +0200
Message-ID: <20250808144404.1839829-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0100.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::8) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|CO1PR11MB5124:EE_
X-MS-Office365-Filtering-Correlation-Id: 31f7c4c7-8f7d-4aaa-98af-08ddd68a0ab9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WW5OZXFpdkpndWsrSWJ6aEtNa1kvL09YRGJQTVZxNjRiYWZyOGN4Z1NBQSs4?=
 =?utf-8?B?d3Ztc2tTTkptVXlaOW9vZmhlekhRU2xwYTVEUjFiNkdza0xRbm0vcURoNjl0?=
 =?utf-8?B?UTd2Q2NrNTFFZElKRVBFRkpRM3lrSVpseTJYVU03YnZiRkpKR2loWFVDUzR4?=
 =?utf-8?B?ZDJtUklVOVZ5QlhlaWZ6MGIxVUo5SEl6SG1IdWlITWpxMlkyVGI4WGhuaDZ0?=
 =?utf-8?B?KzNzOHd2Z3d1YlNPT0FQRkhTVUQ5K01vL2F4WDdqOFhDQjgyQzFWRDZ2Q2Ry?=
 =?utf-8?B?WTJEb1RTTGhYWndHaGpySHVETGRYanZNSHpRZmdiYU5PZXlCWklEcHUrQXlT?=
 =?utf-8?B?MEE5UDBEOXB6dG9RSjcyejZIQTlOT1VhVldUc0RKSjZFWVBLMXB3SXRTSlBY?=
 =?utf-8?B?TG9vUDRqM0R5bjIybFo3MjhBVUd5UGdHa1FUT3YwSkgrR3k3RG5wL01aYk5R?=
 =?utf-8?B?U1F4enEya2s5MW1oTnRsTXk2aFV6OVA1cklFdnI2T0tDOGduS0Z2ZUNYOWxx?=
 =?utf-8?B?eDRKNWw3TjNndkV1cnBkT0g5cWMvdUVuaGtxNkJtRWc2UW01SUNMKzNVcWU3?=
 =?utf-8?B?L2dVSEk5K05YanovdExnMVRkMnJ3ekJLaTdncXUrTmZKZU4rMXd1QWVSVm5J?=
 =?utf-8?B?Q1JaWHRYSWc2TjRTUHZwUFRtYlRsLytEUEJDYmpsbVhDVTEydFhTRkVqY1FC?=
 =?utf-8?B?QW44Rkk2bHZTeVlGV0l6ZWJYL3VVdEF6NWZjUUI0UzBFR3l1VW4rN2lOYll2?=
 =?utf-8?B?eUYwQXhWL2xRMDB5YW15Sk9tZGt6dElkMDA0YUEvNUI5Mm5YUWU2cjNGZTlE?=
 =?utf-8?B?TFZuYXIreUVaMzk4QjhnWnVHTzFsQksyeUJXdXRNZG9GMzZSclFmbXZEaEdC?=
 =?utf-8?B?VVJ4MHgyZWZST3cvRlNTYnc1Qm95dkU3bWJpMTRsSFdkVDI3OHh4QnRxRWRi?=
 =?utf-8?B?NzJNZTVYeDdOTHZYWnhIOU5rdzdJZk9XMU9PZzA1UXBML2NkVnBvaFhQYmwy?=
 =?utf-8?B?RTRGbzI1U2hoZEg0WFJ3WFVHSlNVeEQ1RWpTa0E1MFhJeVV5UHlWdy90bXNl?=
 =?utf-8?B?Y002a0pkTVJhc0xLZ25aY3VNTFE4U2FRN2JEK016azhmSTZOMDNmczFlUGtu?=
 =?utf-8?B?WlE3b2pheHh3R1lQMnJVOG9LTU9SWGU4RlNvT0hlK0c0am5OK05DRHlGRjZl?=
 =?utf-8?B?K2tZbkNLR0QyZjIxNGtlV3Q4UDhlWjBkUERzN2RkK1orTUg2WDBkQUlFTTlt?=
 =?utf-8?B?a0c1NUt6L1pld1BMWHFxUHJ0TjZaODFmb3JoS0lZVGl5TGcvL2pGNk84TXBS?=
 =?utf-8?B?N0phNk1jOTZJRkEyVytqQ0plTGR4cU44SGxEUjU5THQ4b2h3Rlp6YkxoL1Mz?=
 =?utf-8?B?VHB5NjNWM0YyNkZoRXdFT3o0Q2xnZ2JnczFxcE9Qd3A1Zk1kVjBEQXhLYURq?=
 =?utf-8?B?SUhTeDJrd0RvZEJyOEhMTjIvclQ3YlAzVVlzMDdRV0FSV2JCRVhZNDY4ZzIx?=
 =?utf-8?B?N2dwWUp0OER6eHR1b1AxRGZqdytNbVpFaTZyQUtCZ3VzUEpOVnQ1UkxPdmU4?=
 =?utf-8?B?TDg3U2ZoM1IzYW4rMUNxMWlJRTgxektta2hRNGJxdGE0enBJODBLL0F6QUY5?=
 =?utf-8?B?SFVtWURwYm9RcFNTeTVRM3d1azlPS2ZGaXFkL3VUN1NSMHhmSUJ6dVRHclYx?=
 =?utf-8?B?czRSdStWWmlxRVhENXh5SWkxK09IVEhtUHJZNk9tcnBCK3huSHBhNjY1ckdS?=
 =?utf-8?B?WnNyWlgrdU9JUXlpV09jS0xBaEZEckdpUkh0eFdFRVFZVkNPcHRaUXVEV29T?=
 =?utf-8?B?NWtMSmhuSCs5SEF4a3BJVllKSlpWejgxdlBoNEV0YXpDMHJmRW55K1lpb2J3?=
 =?utf-8?B?TjFQRHJhdU4vRUJkcWFLZXhsaldzMjhpcE8zVHdib1BVajBQUDdHUlBING5Z?=
 =?utf-8?Q?EVXEcxW7ZDM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3NjaHd2MjB1TkgvMEVnQk9NbllsaDZiblNQWkFqTFBHbkgwcUxocDRSTW5M?=
 =?utf-8?B?UEdINll2V0lqTWxvb0RvSzB2NDFTUXdwUlFSdGpRWVp6YWFzNjkzRzZ0MDRx?=
 =?utf-8?B?S3F0QzdnbStEV2VmalNPb3FSVTZDWHF0UTA2dnVocjFQU0xBOTZnemUwUSsv?=
 =?utf-8?B?SE5HVHhXYmRVNnJ4MVZHV3BTVm8rdGdkQlptNExrLzBRall6MXVmU1NGa0wv?=
 =?utf-8?B?VHg0UXlJSEVDWTBxcTB1QkJudk9zS3NKc1ZES09HTWYrZDVMNHRVaC9MNk9Y?=
 =?utf-8?B?MzQxN00wRlE2TW9zRitmK1NrcE1yNmZUb3EzMndrOURra2E2TjFZa2x4UDdw?=
 =?utf-8?B?em1UMHc4N1JVcUs0SjVua05UY0FhbStBMHVZeTVDdXFBNFlNVWhldlFJNmRw?=
 =?utf-8?B?NmgzK052L2FlLzUvWTdyNUVEendPR1Nnb1VkZnZCVE12T0ZGeU5qc3B3Umg3?=
 =?utf-8?B?NWlwS3VLdU05MUNGbWltWlZJR0ozZkRiR0dmMlpIdUdERCtxSXUrNzFTSGh3?=
 =?utf-8?B?bFg4bElMQW84M0xEc284ZHVmdk5CQ3ZORHgvMkliOXRuQzZQQ29EeW95YnpQ?=
 =?utf-8?B?dHIvY3Fkb2E0T3JsbHlxZnpmQmY2ZDI1MjNyQk5tRk9EckpIaFoyMCs2N25Y?=
 =?utf-8?B?enBvOGx6V1h6MVEvZis1RDU4S1dwWDJ0QjRPTHR4cUwyazJKSEp3QVlvSTlI?=
 =?utf-8?B?UmNxTTVENVVNaFNFeUw3dWZVUFBGSVFMa290STI1NkhnL1haSmtwakZ3eXpJ?=
 =?utf-8?B?Qng4WE1LL041THRlc0FCSmYxejBxWkxOVHpEUTJ1ZWdVWWorUjBVbjBkWjBz?=
 =?utf-8?B?Yzh1cVFaVzZqaktQWXBCYjNMYUR0VGpTZWxrOGJMeFY3eXBteC9ZSTgzTDF6?=
 =?utf-8?B?MG0rT0ZSdEZDTjBBa1lxSVRPMzBIWjdieC9hN01nOTJ4cStSWUZYMTFGYkt0?=
 =?utf-8?B?ZUk5Qyt4VWtBc3RoV0VncXBRY2ErNm9GUTltM0lIaDgwYlk1R2dQTTdqa0VQ?=
 =?utf-8?B?bU5COU5rYWRaUlZuWFVERlpCZ0dmclZwbXlXV09uVm1CcTBCbHFhVk1GZ082?=
 =?utf-8?B?bHRZY0YvVDYyTkRrTDRweDJYTXR3UXhOeStsR29hSVJDSDN4WjJzZnFRY3N5?=
 =?utf-8?B?Mzl4ZitPdFgwejN0V1N6WU80OVFNUCtnbmd6L2E5YmlQZDN5djVSdEpPeVZ5?=
 =?utf-8?B?cDJxRVVBK1pRVnljK3Y5elAvVXN5K3JUS2RycWFDVE1iWVJ3SlFvbDB6eFEv?=
 =?utf-8?B?bkEyQThDRWRaczBJMk83L09HRjJQcFM5QWtFNVYxazJHdTE5bVVlTjlTZlY1?=
 =?utf-8?B?OWx0ZlRXazZpZTNrYi9lZVR6M1lnYWlrV296SER0VjIzVis3N3lFNUlVRHBs?=
 =?utf-8?B?VmNYa3hLcWhCTGY5UmFCY2VUdkVnS2hnUVBxSjZFcUdheHpYV1Z3UEVyM0NJ?=
 =?utf-8?B?U1ZvVHJ0b1czUzI1WVZSNlR2Z0V1ajV3K2IvK1lhazZYcmdxKzNyb1lsSlBn?=
 =?utf-8?B?dk9meUVmMy9zWC9ubUJTWFdUeVBiMTM2Wi80bTdMTHZQYVhrQ2JPOGEvZUNX?=
 =?utf-8?B?cytubEl0N0tvZ2RtazVVTjcvSTNGVTlnajRzM21PdFhiejlXbEZpQXJPTmht?=
 =?utf-8?B?bFNveTJ6cWFLMDFucFRLV0NNTXlCRjN0TXpaZldDMFRTV0UwM3dVRmpaUE1R?=
 =?utf-8?B?MWFkT3UvWmgzb1RhaVVjK0VBQWM2ODVXaVc2eW96Y0ZOeC9saFc3UzVReDR6?=
 =?utf-8?B?WWRDdmgrKzM2ZFlzQjdHZUJCSXZmc2hFYVgrTVpWbmFwTlliOTA5U2VGaG4z?=
 =?utf-8?B?L21ta2VDU2pCOStUeVQ5UGpqMDdXSE9ZTUNiQy9rVnBXMU95Rmc1Rk5yRUxa?=
 =?utf-8?B?QWRWSHZDV2RIbUZUTW9iMzRPY0hzd2lqeHcyZ0o5RjhuYnFON0pKdTAvdXA1?=
 =?utf-8?B?YXpVYXdCVmJ2WWljYUZBSFQyRzBPOU5MYnNkR2oxQmw2N25LZXRML3dTSzVH?=
 =?utf-8?B?VDJhbHlzTmxtNkxkbmh6ZGEzUFdPVWtlSXJjRGE4YlBZWUtLRTBQcUFMTVR3?=
 =?utf-8?B?RkVibmlWR3QvNVo3ejlsRDJKMWtKNmJ4UCtYWmJRdGYzYU1wUEdxbkdDTWkr?=
 =?utf-8?B?ZE9ycDdTNFBGL1U5aVltZDVvUjBZczlZRElSUzdoeENWMDVBTE1TcFpXWFQv?=
 =?utf-8?B?VkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 31f7c4c7-8f7d-4aaa-98af-08ddd68a0ab9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 14:44:13.2898 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zL0JhUzVZNNtVCiL58oOwDJu/3jE1frhgodU7+9tDW79WKaV/vBqIh/sRZIPQ3WvdEMww5gcmHc7NPhDKIu+6JZs3/LhHjx/UkHCxLOodzk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5124
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

In several code paths, such as xe_pt_create(), the vm->xef field is used
to determine whether a VM originates from userspace or the kernel.

Previously, this handler was only assigned in xe_vm_create_ioctl(),
after the VM was created by xe_vm_create(). However, xe_vm_create()
triggers page table creation, and that function assumes vm->xef should
be already set. This could lead to incorrect origin detection.

To fix this problem and ensure consistency in the initialization of
the VM object, let's move the assignment of this handler to
xe_vm_create.

Fixes: 7f387e6012b6 ("drm/xe: add XE_BO_FLAG_PINNED_LATE_RESTORE")
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c    | 2 +-
 drivers/gpu/drm/xe/xe_pxp_submit.c | 2 +-
 drivers/gpu/drm/xe/xe_vm.c         | 8 +++-----
 drivers/gpu/drm/xe/xe_vm.h         | 2 +-
 4 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 4effe10d815b..990403ee3752 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -411,7 +411,7 @@ int xe_migrate_init(struct xe_migrate *m)
 
 	/* Special layout, prepared below.. */
 	vm = xe_vm_create(xe, XE_VM_FLAG_MIGRATION |
-			  XE_VM_FLAG_SET_TILE_ID(tile));
+			  XE_VM_FLAG_SET_TILE_ID(tile), NULL);
 	if (IS_ERR(vm))
 		return PTR_ERR(vm);
 
diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.c b/drivers/gpu/drm/xe/xe_pxp_submit.c
index d92ec0f515b0..ca95f2a4d4ef 100644
--- a/drivers/gpu/drm/xe/xe_pxp_submit.c
+++ b/drivers/gpu/drm/xe/xe_pxp_submit.c
@@ -101,7 +101,7 @@ static int allocate_gsc_client_resources(struct xe_gt *gt,
 	xe_assert(xe, hwe);
 
 	/* PXP instructions must be issued from PPGTT */
-	vm = xe_vm_create(xe, XE_VM_FLAG_GSC);
+	vm = xe_vm_create(xe, XE_VM_FLAG_GSC, NULL);
 	if (IS_ERR(vm))
 		return PTR_ERR(vm);
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 432ea325677d..26948eb6e283 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1640,7 +1640,7 @@ static void xe_vm_free_scratch(struct xe_vm *vm)
 	}
 }
 
-struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
+struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
 {
 	struct drm_gem_object *vm_resv_obj;
 	struct xe_vm *vm;
@@ -1660,8 +1660,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 
 	vm->xe = xe;
 
+	vm->xef = xe_file_get(xef);
 	vm->size = 1ull << xe->info.va_bits;
-
 	vm->flags = flags;
 
 	/**
@@ -2097,7 +2097,7 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 	if (args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE)
 		flags |= XE_VM_FLAG_FAULT_MODE;
 
-	vm = xe_vm_create(xe, flags);
+	vm = xe_vm_create(xe, flags, xef);
 	if (IS_ERR(vm))
 		return PTR_ERR(vm);
 
@@ -2113,8 +2113,6 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 		vm->usm.asid = asid;
 	}
 
-	vm->xef = xe_file_get(xef);
-
 	/* Record BO memory for VM pagetable created against client */
 	for_each_tile(tile, xe, id)
 		if (vm->pt_root[id])
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 3475a118f666..2f213737c7e5 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -26,7 +26,7 @@ struct xe_sync_entry;
 struct xe_svm_range;
 struct drm_exec;
 
-struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags);
+struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef);
 
 struct xe_vm *xe_vm_lookup(struct xe_file *xef, u32 id);
 int xe_vma_cmp_vma_cb(const void *key, const struct rb_node *node);
-- 
2.34.1


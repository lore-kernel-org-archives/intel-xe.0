Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C1B7C77B7C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Jul 2025 15:17:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E28210E87B;
	Thu,  3 Jul 2025 15:17:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D/8dytF9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A62F10E87B
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Jul 2025 15:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751555866; x=1783091866;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=aMRxkVHmZBTzAP1rulmkyl43qAr28e1cB3EzueefFHM=;
 b=D/8dytF9V39iw4eB86mFXOD7dJ4ft5oGGPidRAuf8X6P/py6XXUK8OA8
 OS98bhNlFM8AxMmAfjepWsnNLvGEwJg7X47XNcr/P73BjaYkjJTkRrQTj
 9ijo2Xe+0yWVW1S3ikun2Ulj3sKUQm/ULsW76xTtb85JhP/FhcBRVp8LR
 zoMwZaZLX7yE9MI4xfff3M8eFJZTBkGIfVL/KqG43PkC6EAyDk3Cbvr0m
 5LLVnt7xd+q9VRuzK83K4q43DenU3oIU5f8YluWZgKVXoEIZ1UD0Z44fx
 Dv6ssDsoLh8f5xOeE6RFy57IiJAXsIzz08wDVpGGSZsOnrffc+F17WsOu w==;
X-CSE-ConnectionGUID: 9DBmRn+ST2OPhhOtpeD68Q==
X-CSE-MsgGUID: QC/65EWMQnqQ22zK65+/LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="64580524"
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; d="scan'208";a="64580524"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 08:17:46 -0700
X-CSE-ConnectionGUID: O34RJhWMToWmSgxj7GNPGg==
X-CSE-MsgGUID: rqSrw528RfWVcky4T0dasw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; d="scan'208";a="185409301"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 08:17:46 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 08:17:45 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 3 Jul 2025 08:17:45 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.71)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 08:17:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F0yY2QWuGXm9yNa8A3Vcw161VsIj6XxR5naRYdY8eBw1AuqszfCHHoTUuSfW/zGrMVSfYVxpHRfLDPh+eIcitA1ouUeD4rFAJ1XC7tOHvrlGnfSNZylLgGtGwrc+GrELmMVVAn2WLLV7f9ooYEA6qx/vaM3mVH5rviaSkHVxoN/7YlxgTaRcRKv9GXdO3jUHmKT4vf740vHVswu566NwDwIaZyc8yLHxXgiRwjTV0ubJxrDb1kvZHGAhG2joVPZUX0NRcXF4K0tV9pFVkdlmxSWwHpEGnng68H7jNINYAqG8++/FuPaAH8EWyw9Ej9iXVI4LlKjc0ewBSlw7Gei49A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mSYc4F965cvYc+FMdSwq8d4fEqprB+67FtNznGKznjg=;
 b=Bhc3hz3NCMhRDbscJkjjr+tu+pYm+foPnCI9ZZxkAdM35r4hI1FDcRwKFSf2W/f4xSQhvda3DO7DtUUt986HS6WgwzNalxTyWS6G6/gLhpF9v7CyGFNBvDszSMggVzhLvS9N9+O1neJqAej0brrqrhjWqxpthT6Q9+j/Ji+CrQPMkpZ9MJPbvH+thzHq8nE2tKGA/hpAUHuWzz0JSFklxgZyQLNfX03tYTIUXC+kj/TJGFtVPHS2YoJjgmOn11NTFPQY9hP1EYZlpSNOrdf5NFCYdP+z+GLVFfuuhM5n8lVpUfa+RAkCvD9QK4DXupw51aXgsbglp9lwtBtNsEGVRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by IA1PR11MB8861.namprd11.prod.outlook.com (2603:10b6:208:59a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 15:17:40 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%5]) with mapi id 15.20.8880.027; Thu, 3 Jul 2025
 15:17:40 +0000
Message-ID: <db34b85b-e804-4175-b05a-9b29ffbb5046@intel.com>
Date: Thu, 3 Jul 2025 11:17:37 -0400
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBkcm0veGUvdWM6?=
 =?UTF-8?Q?_Disable_GuC_communication_on_hardware_initialization_error=2E_?=
 =?UTF-8?B?KHJldjUp?=
To: <intel-xe@lists.freedesktop.org>
References: <20250701021340.1597839-1-zhanjun.dong@intel.com>
 <175150042911.130139.17074166502144011349@1538d3639d33>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <175150042911.130139.17074166502144011349@1538d3639d33>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0378.namprd04.prod.outlook.com
 (2603:10b6:303:81::23) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|IA1PR11MB8861:EE_
X-MS-Office365-Filtering-Correlation-Id: 713c377c-a3c3-4d30-5767-08ddba44bffc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YlJRa3UvNEpUVW00eExRMXhSb1lqV0dRTEpYNEY0cmpjc0p6U0g5N2JSVkhp?=
 =?utf-8?B?QktRMi8ycW81ZnVaQ2tmZE1kcmJ6WUNXY1dmY0ZFQ21WQ2V4UnBsSGkwOHZQ?=
 =?utf-8?B?bGo4aTVCa1l4TDBGVVlFNzNBak5zWEpNaVVzWXFrTHp6djlsenVtdnN5bTRk?=
 =?utf-8?B?TnI3czRjcmhmaTB3d213MHJpcUZ4YlpOMGVFVG10TUJRWkdGRXdmWVZoOEdY?=
 =?utf-8?B?Tis5VnRyVHlyMy91WkNkMEs4Qm0xM0gxczBTRTFnY3ZhcmVtYmI1QVU0SkZO?=
 =?utf-8?B?L2hLVzZKL3Y1cGUvYTZjZVJ6RDY0RjZ4cWdNeENITmxoNDRKNi9MdnY3emF3?=
 =?utf-8?B?L2V6cWhLN3VlbnlVMUx0djFLaHVmU2FBaGxONXNqTFRUbnFrd1FNL0o3RUpi?=
 =?utf-8?B?NDJObUpLUjFITzNHNjFoN2FPQ1NjOTVPb29NL3VhckpsNXo2N3JEMGFDZHR3?=
 =?utf-8?B?UmpmM2JzUFpZNWhjampxWGVSSVlGVXBkZlpnNTFTeVFKZmV6TjBOelRVaXFk?=
 =?utf-8?B?N3ZjZ0ZiQjE0SnhoTFpOU3NsRUQ3L0VLcXRMR3loaDZEREIxODZFOTRaY3JL?=
 =?utf-8?B?YWRtNlhmUlYrd040bVJva0VPWEpLNHJ4N3drOEZLTEFjR2FoZkJ5QWRINkoz?=
 =?utf-8?B?c0FaU25CaGcwalVCWGtFODVhYVRNSkVvTHRZemVOQlYxeGk3RlZDY0pRY05z?=
 =?utf-8?B?ZmZtTzhMZGRkbDFOVUdja0I3cUFqSzVRVVN3SnM0Y0dlVmhIU2kvc2prS21h?=
 =?utf-8?B?TWVlbCtBMnJJR3pGSG9PUzd2OER5SGl2Z3p5V2Y2WFlvNytOUk5pWUY3ZFZz?=
 =?utf-8?B?azNtZk45anlFeTBFUWQ5SCt4NVlJTGsvY2FNaXZ1OHBqd01JRE9BUm9EbSts?=
 =?utf-8?B?Uk4rbFpvKzJnK2laRGZjMElITThidFR6SXczTTdMcnhMZk1waFZjTytuOTJP?=
 =?utf-8?B?VmxTN2dPZHZSV2Ixb1ZwTldFSWtWN1JsQkVmdms4a00vYXEwNWQrS2ZtenRS?=
 =?utf-8?B?bU0zT0huUUxLRXJQUGpPbGlsc1BaV2M5RUpiTDY4akhrVzd5R2FRcmtpU01i?=
 =?utf-8?B?ekZCTGVmME9sa3VYTUhBUnlBKzYzaEx3bzdLT3pwWlJWN25VazN0UVYzR3dw?=
 =?utf-8?B?clkvM0h2UW80eEhldUFpMXZURXNGb2RHZ1dBbkFCREFWTGpMUWMwU29iYmwx?=
 =?utf-8?B?TmpReXpOa1ltdWVlY1dkMlcvREozVGJCK2V3TUNBYThXMTZ3aUg4V2ZPdEdJ?=
 =?utf-8?B?VlhDS0tvQ2xrUER4TG5mc2RUWjJOWEV5b2I4d2tGSURFcjN5azlGRjdQMW5y?=
 =?utf-8?B?M0hFOGRvZjBYczN5RTF2cUJQS01NY1FkSlA0ZWRZdjRDbWdML0ZJZisvQmxa?=
 =?utf-8?B?TVpUMUM3UnRCUnhVeXM5NHpYdkZwKytEYjBkWnNLYllaN0M0RHJkd3pVcjVS?=
 =?utf-8?B?OGVKY09lcGRvRGoyVGNPcllDSjBCRXYydE5vZ2REaERPdUJqSys4ZE9FUjdS?=
 =?utf-8?B?Q0o4SHBhL0IvQjZ3S05aZzYzVHJXUmZBTEZuZDRUWXlPMk5URlRPTnAyM3Iw?=
 =?utf-8?B?V0VLejVKQmJ2TkFvdlVUbk5vMSt0aW9xSWhqS1ZZOEhna2F3N0pNdFpkNFNr?=
 =?utf-8?B?RlRKRzdSVWZ4NmNxZUhZSlVMU3J4cVovcThHZXB4bVVwdnUyUThJZjNLa2NE?=
 =?utf-8?B?YjZ6T2E2VnBhSWFCek4wbDJTalNSUmdVWDNBeFlieWM4SFRKQlZDWEU5YTY1?=
 =?utf-8?B?blRRRHpsVDFFcW1WMGFlNGFqSERGYzAvbzhkNnVyQ2tzbXlpUVJyNjF4NDJG?=
 =?utf-8?Q?YYOLq+XJAKXjyfl1cpQn3Aver6WdRWEqp8/PM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHNybHhQanBZR1pRYWpkaDh6WWo5UTQ3YUVFOTJzRC9TQjhsQk5mYXBnSzJO?=
 =?utf-8?B?NHJCQkZzdDIzSGlUUFc4RmhjUzZqSjg1RTlSeWJnWmtrclpxNlVCMDFmcWtF?=
 =?utf-8?B?eVFVUmpRSS9leitvT29ZUmdIQnNFNGpPRmJyWTRzai8yRDhubFlldGpqM1Zp?=
 =?utf-8?B?Zm1UWnN6WE5HWDJzYXd3amhQVXNScFRxWXRJei9MR0hlTTRoVGNGRFNMVHNq?=
 =?utf-8?B?RDhQK1RuMDNLMHZzV2djbk9KeUpWMlBsbE5LZy9GQmdidFpacFJtL1cxMWRF?=
 =?utf-8?B?WDNMSmN3QUlqanY1c2Zkb3RxMERLT1plUHZQK2RkWWlSdExYYTRZVUlINExq?=
 =?utf-8?B?ekcrZ2tGMTlpcEhvYjk0dTNUTG8vbTcvRDgxSUNXUGxQaHdvQ3FQelVNVWx3?=
 =?utf-8?B?MUNBMzFMZEtrRTRHelJ3TmhsVy9TN2Z3UkJzV2tVK3FVZzVJZVp1RkxxMEFr?=
 =?utf-8?B?MFFmaUZFSEFIK2l1QWFPVWtQSzJpQWhOVWpZKzJDUXZlUXllRXlZOEs0WE9x?=
 =?utf-8?B?Y3hoZTFSTjMwcGNZSzZFdVZhdTJUVVMvVXc0RFhZMERuMXBRT2lsV2dnQm45?=
 =?utf-8?B?Snl2WHluUDBSRTFUemdaZnNmTlVWRTQxSVdZU0F2QVR4MnBwZkRNZ2lUMGRZ?=
 =?utf-8?B?V1pWam9uNCtMUENHWXFUNXlVQTdhQ1ZoekhxSnZSM0pGaE0wcUJ1U1kwNXhY?=
 =?utf-8?B?eFdrZmEvQmNRZkorbVVhSFVnQVZXb0R5SlBpOENtek1lbnIvbFdLSXo3Tnlw?=
 =?utf-8?B?bXgrcmVrNDJjQUIwMk44SUhwWmlmaTJIajUrL2djZVM1U2pIRFNGL1ZUM29Z?=
 =?utf-8?B?NEVGbzh0cGRteitXM01haWw4L1o3SnZCUlpDdEtxYWx4d2YwVy9qaDVtZzRV?=
 =?utf-8?B?Q0VDUVRqZWJ6MGFYa0Ryd2Njd3c1VWRocFUvSE5xclluRGlkYWk3MVlQN1Bs?=
 =?utf-8?B?Ymh1TitSMDl5OG1zbGJmTTBWdjhrUlVHT1piOC9QQXllamdDWVNKRWRBKzVE?=
 =?utf-8?B?VXdvdE9PbUtjazJrRTNINVBsTHowWms4cG51YUc2bjBtMmt0c2FlaDY1Q2Qy?=
 =?utf-8?B?OEhVeDNGQWhrZ0xxS2xTZ01sRFhoNTVxMmU0YXppRzhzWFJoQ00xcEErOGdS?=
 =?utf-8?B?SFZCUys4cXpHZVhSd05QU1R0ck9ONldOS21pVFNEc0k4MFBJZGNuRUh6OXRU?=
 =?utf-8?B?MHFlY092N2MraXhGQUlNRmpYUDRzTnFjTTRkdThSVG80MFVyL1lVaFBTeDIw?=
 =?utf-8?B?WjBrZko5MWlwWUh1U1lXcjhkQk1IVERRN0tqN0Vlb0F0U2dXWWdnUGxRZEk4?=
 =?utf-8?B?YmlOUmR4eVJITGlYczNId1poZThCYzNhNnVweHF5ekh3YURFNHl0S2lyOHRM?=
 =?utf-8?B?NWNERE11VEtsK1hwcXkvRTNYaUVCam9NN3JQZXBuY2R6dE5YSlhLM0RCWFBX?=
 =?utf-8?B?VjY0MDljTFZPcEJudTFzZHFJbUhmOFpsN0lIOWVqYWVWNWFSejQvSTlYSVp5?=
 =?utf-8?B?VnhIWVF5bjdtemdvL0NjTHNUcjVvMWdrNnhDdHRvYzlkY3JOSXlVU2JJcG9z?=
 =?utf-8?B?YkVDTDJEcE9qNkFGdmc0akdMT09FNmNqN1g3aXB2YkRpRHIvN05pS1pMUmZD?=
 =?utf-8?B?STcrRVVKYkl3MFFMQlRySmlPZTN4MmhIRXBPRFdmTDJjVjFMdHFEMXIvWXRB?=
 =?utf-8?B?clpzTXRRMUdVZmlUR3FWYkRBQ2ErTmxabjE1UExoaVBrVlMycUV2MWV4em9Z?=
 =?utf-8?B?c1dTV01LTmhWOXhSSlRoclg0NmJyTzR5NXZKNENCS2JMMHFHTThsRCtBNVpn?=
 =?utf-8?B?MVgvVHVuQzFHSVd3UlpSTFEzU1c0WlFmYnY4NUFLaW9UT05OdWV1YWl5cFhx?=
 =?utf-8?B?K29OZk1yYjgxMWlUN09ZQ21nK05SQWtKR0pSOW0rWHFmek9kdFBBK2lKU2Ft?=
 =?utf-8?B?dWEydDNpZEdHYjI1RnRqOHhLOHFmMVpUSU1IVzhyZG5QR01jL2xlSmdhd1N3?=
 =?utf-8?B?MU5ONEhmOTNOd2thUnlFVTVnMkkvZjVFU01hRmsyZG80UWhPdkVPNmUzVCtI?=
 =?utf-8?B?Q0gvSG95TnBFTmMyOG51VVg0VUdld21EUElMNWEybW4zcU1BT0QvU2JsVmo2?=
 =?utf-8?B?aDY0em1SNjlnUE9sczZzN0Z6TlMrMERVcCs0dnUyTUpubFpGMldVQ1hKRUdF?=
 =?utf-8?B?alE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 713c377c-a3c3-4d30-5767-08ddba44bffc
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 15:17:39.9915 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5s3VisbzcMkdFTjJcVJfP8nbTFsTgQrQXfParECG1/Bf434WXL0/JCwp0bjqemDp5TiTrmG3+9DB95KFcFO3jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8861
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

All failures is not related to this patch.

Regards,
Zhanjun Dong

On 2025-07-02 7:53 p.m., Patchwork wrote:
> *Patch Details*
> *Series:*	drm/xe/uc: Disable GuC communication on hardware 
> initialization error. (rev5)
> *URL:*	https://patchwork.freedesktop.org/series/150488/ <https:// 
> patchwork.freedesktop.org/series/150488/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v5/ 
> index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v5/ 
> index.html>
> 
> 
>   CI Bug Log - changes from xe-3327-
>   e6e27e79a726f8bf333d13521aba32f6466035a8_FULL -> xe-pw-150488v5_FULL
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-150488v5_FULL absolutely need 
> to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-150488v5_FULL, please notify your bug team (I915-ci- 
> infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (4 -> 4)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe- 
> pw-150488v5_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@kms_cursor_crc@cursor-suspend:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-433/
>         igt@kms_cursor_crc@cursor-suspend.html> -> INCOMPLETE <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v5/shard-dg2-463/
>         igt@kms_cursor_crc@cursor-suspend.html> +1 other test incomplete
Not related to this patch.

>   *
> 
>     igt@kms_cursor_legacy@cursor-vs-flip-toggle:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-2/
>         igt@kms_cursor_legacy@cursor-vs-flip-toggle.html> -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v5/shard-
>         bmg-6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html>
Not related to this patch.>
> 
>     Known issues
> 
> Here are the changes found in xe-pw-150488v5_FULL that come from known 
> issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@kms_async_flips@invalid-async-flip-atomic:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v5/shard-lnl-7/igt@kms_async_flips@invalid-
>         async-flip-atomic.html> (Intel XE#3768 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3768>)
>   *
> 
>     igt@kms_big_fb@4-tiled-16bpp-rotate-90:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v5/shard-adlp-1/igt@kms_big_fb@4-
>         tiled-16bpp-rotate-90.html> (Intel XE#1124 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +1 other test
>         skip
>   *
> 
>     igt@kms_big_fb@x-tiled-64bpp-rotate-90:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v5/shard-adlp-1/igt@kms_big_fb@x-
>         tiled-64bpp-rotate-90.html> (Intel XE#316 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/316>)
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v5/shard-dg2-432/igt@kms_big_fb@y-
>         tiled-max-hw-stride-32bpp-rotate-180.html> (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +1
>         other test skip
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v5/shard-lnl-7/igt@kms_big_fb@y-tiled-max-
>         hw-stride-64bpp-rotate-0-async-flip.html> (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>)
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> 
>       o shard-adlp: NOTRUN -> DMESG-FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v5/shard-adlp-1/igt@kms_big_fb@y-
>         tiled-max-hw-stride-64bpp-rotate-0-hflip.html> (Intel XE#4543
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543>) +1
>         other test dmesg-fail
>   *
> 
>     igt@kms_bw@linear-tiling-2-displays-2560x1440p:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v5/shard-adlp-1/igt@kms_bw@linear-tiling-2-
>         displays-2560x1440p.html> (Intel XE#367 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>   *
> 
>     igt@kms_bw@linear-tiling-3-displays-2160x1440p:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v5/shard-dg2-432/igt@kms_bw@linear-
>         tiling-3-displays-2160x1440p.html> (Intel XE#367 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>   *
> 
>     igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v5/shard-bmg-7/igt@kms_ccs@bad-aux-stride-
>         y-tiled-gen12-rc-ccs-cc.html> (Intel XE#2887 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2887>)
>   *
> 
>     igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v5/shard-lnl-7/igt@kms_ccs@bad-pixel-
>         format-y-tiled-gen12-rc-ccs-cc.html> (Intel XE#2887 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +1 other test
>         skip
>   *
> 
>     igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v5/shard-bmg-7/igt@kms_ccs@bad-
>         rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html> (Intel XE#2652
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652> /
>         Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/787>) +7 other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v5/shard-adlp-1/igt@kms_ccs@crc-primary-
>         basic-4-tiled-bmg-ccs.html> (Intel XE#2907 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2907>)
>   *
> 
>     igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-c-hdmi-a-1:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v5/shard-adlp-1/igt@kms_ccs@crc-primary-
>         rotation-180-y-tiled-ccs@pipe-c-hdmi-a-1.html> (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +11
>         other tests skip
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v5/shard-adlp-1/igt@kms_ccs@crc-sprite-
>         planes-basic-y-tiled-gen12-mc-ccs.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +7
>         other tests skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-432/
>         igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html> ->
>         INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-150488v5/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-
>         dg2-rc-ccs-cc.html> (Intel XE#1727 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel
>         XE#2705 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2705> / Intel XE#3113 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3113> / Intel XE#4212 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4212> / Intel
>         XE#4522 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522>)
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> INCOMPLETE <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150488v5/shard-dg2-436/
>         igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-
>         dp-4.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1727> / Intel XE#2705 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2705> / Intel
>         XE#3113 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3113> / Intel XE#4212 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4212> / Intel XE#4522 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4522>)
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v5/shard-dg2-432/igt@kms_ccs@random-
>         ccs-data-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2.html> (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +139
>         other tests skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-d-dp-2:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v5/shard-dg2-432/igt@kms_ccs@random-
>         ccs-data-4-tiled-mtl-mc-ccs@pipe-d-dp-2.html> (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/787>) +21 other tests skip
>   *
> 
>     igt@kms_cdclk@mode-transition-all-outputs:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v5/shard-lnl-7/igt@kms_cdclk@mode-
>         transition-all-outputs.html> (Intel XE#4418 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4418>)
>   *
> 
>     igt@kms_cdclk@mode-transition@pipe-a-dp-2:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v5/shard-dg2-432/igt@kms_cdclk@mode-
>         transition@pipe-a-dp-2.html> (Intel XE#4417 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4417>) +3 other
>         tests skip
>   *
> 
>     igt@kms_chamelium_frames@dp-crc-fast:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v5/shard-lnl-7/igt@kms_chamelium_frames@dp-
>         crc-fast.html> (Intel XE#373 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/373>) +1 other test skip
>   *
> 
>     igt@kms_chamelium_hpd@hdmi-hpd:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v5/shard-dg2-433/
>         igt@kms_chamelium_hpd@hdmi-hpd.html> (Intel XE#373 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +3 other tests
>         skip
>   *
> 
>     igt@kms_content_protection@atomic-dpms:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v5/shard-lnl-7/
>         igt@kms_content_protection@atomic-dpms.html> (Intel XE#3278
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278>)
>   *
> 
>     igt@kms_content_protection@uevent@pipe-a-dp-2:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v5/shard-dg2-432/
>         igt@kms_content_protection@uevent@pipe-a-dp-2.html> (Intel
>         XE#1188 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188>)
>   *
> 
>     igt@kms_cursor_crc@cursor-offscreen-32x10:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v5/shard-adlp-1/igt@kms_cursor_crc@cursor-
>         offscreen-32x10.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455>)
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen-512x512:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v5/shard-dg2-433/
>         igt@kms_cursor_crc@cursor-onscreen-512x512.html> (Intel XE#308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>)
>   *
> 
>     igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v5/shard-lnl-7/
>         igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html> (Intel
>         XE#309 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>)
>   *
> 
>     igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-4/
>         igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html> ->
>         DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-150488v5/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipb-
>         varying-size.html> (Intel XE#5354 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5354>)
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-2/
>         igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-
>         varying-size.html> -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v5/shard-bmg-6/
>         igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-
>         varying-size.html> (Intel XE#2291 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2291>) +4 other
>         tests skip
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v5/shard-adlp-1/
>         igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html> (Intel
>         XE#309 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>)
>   *
> 
>     igt@kms_fbcon_fbt@psr:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v5/shard-bmg-7/igt@kms_fbcon_fbt@psr.html>
>         (Intel XE#776 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/776>)
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v5/shard-dg2-433/
>         igt@kms_fbcon_fbt@psr.html> (Intel XE#776 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/776>)
>   *
> 
>     igt@kms_feature_discovery@psr1:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v5/shard-dg2-432/
>         igt@kms_feature_discovery@psr1.html> (Intel XE#1135 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1135>)
>   *
> 
>     igt@kms_flip@2x-plain-flip:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v5/shard-lnl-7/igt@kms_flip@2x-plain-
>         flip.html> (Intel XE#1421 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1421>)
>   *
> 
>     igt@kms_flip@2x-plain-flip-fb-recreate:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-3/
>         igt@kms_flip@2x-plain-flip-fb-recreate.html> -> SKIP <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v5/shard-bmg-6/
>         igt@kms_flip@2x-plain-flip-fb-recreate.html> (Intel XE#2316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) +4
>         other tests skip
>   *
> 
>     igt@kms_flip@basic-flip-vs-wf_vblank:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-2/
>         igt@kms_flip@basic-flip-vs-wf_vblank.html> -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v5/shard-
>         bmg-7/igt@kms_flip@basic-flip-vs-wf_vblank.html> (Intel XE#2049
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049>) +1
>         other test incomplete
>   *
> 
>     igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-adlp-6/
>         igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1.html> ->
>         DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-150488v5/shard-adlp-4/igt@kms_flip@flip-vs-rmfb-
>         interruptible@b-hdmi-a1.html> (Intel XE#4543 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4543>) +2 other
>         tests dmesg-warn
>   *
> 
>     igt@kms_flip@plain-flip-ts-check:
> 
>       o shard-adlp: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v5/shard-adlp-1/igt@kms_flip@plain-
>         flip-ts-check.html> (Intel XE#4543 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4543>) +3 other
>         tests dmesg-warn
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
> 
>       o shard-adlp: NOTRUN -> DMESG-FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v5/shard-adlp-1/
>         igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-
>         downscaling.html> (Intel XE#4543 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4543> / Intel
>         XE#4921 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4921>) +1 other test dmesg-fail
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-adlp-4/
>         igt@kms_flip_tiling@flip-change-tiling.html> -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v5/shard-
>         adlp-3/igt@kms_flip_tiling@flip-change-tiling.html> (Intel
>         XE#4543 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4543>) +1 other test dmesg-fail
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-adlp-4/
>         igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-
>         y.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-150488v5/shard-adlp-3/igt@kms_flip_tiling@flip-change-
>         tiling@pipe-c-hdmi-a-1-x-to-y.html> (Intel XE#1874 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1874>)
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v5/shard-lnl-7/
>         igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-
>         blt.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/651>) +1 other test skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v5/shard-lnl-7/
>         igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-
>         blt.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/656>) +3 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v5/shard-adlp-1/
>         igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html> (Intel
>         XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v5/shard-bmg-7/
>         igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-
>         blt.html> (Intel XE#2311 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2311>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v5/shard-dg2-432/
>         igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-
>         blt.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/651>) +7 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v5/shard-adlp-1/
>         igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-
>         mmap-wc.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/653>) +2 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v5/shard-dg2-433/
>         igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-
>         blt.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/653>) +7 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v5/shard-adlp-1/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-
>         blt.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/656>) +2 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v5/shard-bmg-7/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-
>         onoff.html> (Intel XE#2313 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2313>) +1 other test skip
>   *
> 
>     igt@kms_hdr@static-swap:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-7/
>         igt@kms_hdr@static-swap.html> -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150488v5/shard-bmg-6/
>         igt@kms_hdr@static-swap.html> (Intel XE#1503 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1503>) +2 other
>         tests skip
>   *
> 
>     igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v5/shard-dg2-432/
>         igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256.html>
>         (Intel XE#616 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/616>) +2 other tests fail
>   *
> 
>     igt@kms_plane_multiple@2x-tiling-none:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v5/shard-lnl-7/igt@kms_plane_multiple@2x-
>         tiling-none.html> (Intel XE#4596 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4596>)
>   *
> 
>     igt@kms_plane_scaling@2x-scaler-multi-pipe:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-2/
>         igt@kms_plane_scaling@2x-scaler-multi-pipe.html> -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v5/shard-
>         bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html> (Intel
>         XE#2571 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571>)
>   *
> 
>     igt@kms_pm_backlight@brightness-with-dpms:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v5/shard-dg2-433/
>         igt@kms_pm_backlight@brightness-with-dpms.html> (Intel XE#2938
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938>)
>   *
> 
>     igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v5/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-
>         overlay-plane-update-sf-dmg-area.html> (Intel XE#2893 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2893> / Intel
>         XE#4608 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608>)
>   *
> 
>     igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-b-edp-1:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v5/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-
>         overlay-plane-update-sf-dmg-area@pipe-b-edp-1.html> (Intel
>         XE#4608 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608>)
>   *
> 
>     igt@kms_psr2_sf@pr-cursor-plane-update-sf:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v5/shard-dg2-432/igt@kms_psr2_sf@pr-
>         cursor-plane-update-sf.html> (Intel XE#1489 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +2 other
>         tests skip
>   *
> 
>     igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v5/shard-lnl-7/igt@kms_psr2_sf@pr-overlay-
>         primary-update-sf-dmg-area.html> (Intel XE#2893 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2893>)
>   *
> 
>     igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v5/shard-adlp-1/igt@kms_psr2_sf@psr2-
>         primary-plane-update-sf-dmg-area-big-fb.html> (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>)
>   *
> 
>     igt@kms_psr@fbc-psr-cursor-plane-onoff:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v5/shard-dg2-433/igt@kms_psr@fbc-psr-
>         cursor-plane-onoff.html> (Intel XE#2850 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +3
>         other tests skip
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v5/shard-bmg-7/igt@kms_psr@fbc-psr-cursor-
>         plane-onoff.html> (Intel XE#2234 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2234> / Intel
>         XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>)
>   *
> 
>     igt@kms_psr@pr-sprite-plane-onoff:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v5/shard-adlp-1/igt@kms_psr@pr-sprite-
>         plane-onoff.html> (Intel XE#2850 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +2
>         other tests skip
>   *
> 
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v5/shard-dg2-432/
>         igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html> (Intel
>         XE#3414 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414>)
>   *
> 
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v5/shard-adlp-1/
>         igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html> (Intel
>         XE#1127 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127>)
>   *
> 
>     igt@xe_eudebug@vma-ufence:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v5/shard-bmg-7/igt@xe_eudebug@vma-
>         ufence.html> (Intel XE#4837 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4837>)
>   *
> 
>     igt@xe_eudebug_online@pagefault-read:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v5/shard-adlp-1/
>         igt@xe_eudebug_online@pagefault-read.html> (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +1
>         other test skip
>   *
> 
>     igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v5/shard-dg2-432/
>         igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-
>         sram.html> (Intel XE#4837 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4837>) +3 other tests skip
>   *
> 
>     igt@xe_evict@evict-beng-small-external-cm:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v5/shard-lnl-7/igt@xe_evict@evict-beng-
>         small-external-cm.html> (Intel XE#688 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/688>)
>   *
> 
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-
>     userptr-rebind:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v5/shard-bmg-7/igt@xe_exec_basic@multigpu-
>         many-execqueues-many-vm-bindexecqueue-userptr-rebind.html>
>         (Intel XE#2322 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2322>)
>   *
> 
>     igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v5/shard-adlp-1/igt@xe_exec_basic@multigpu-
>         no-exec-basic-defer-bind.html> (Intel XE#1392 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1392>)
>   *
> 
>     igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-464/
>         igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html> -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v5/shard-
>         dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html>
>         (Intel XE#1392 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1392>) +5 other tests skip
>   *
> 
>     igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v5/shard-lnl-7/igt@xe_exec_basic@multigpu-
>         once-bindexecqueue-rebind.html> (Intel XE#1392 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1392>)
>   *
> 
>     igt@xe_exec_basic@multigpu-once-userptr-invalidate:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v5/shard-dg2-432/
>         igt@xe_exec_basic@multigpu-once-userptr-invalidate.html> (Intel
>         XE#1392 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>)
>   *
> 
>     igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v5/shard-adlp-1/
>         igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm.html>
>         (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/288>) +1 other test skip
>   *
> 
>     igt@xe_exec_fault_mode@once-bindexecqueue-rebind:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v5/shard-dg2-433/
>         igt@xe_exec_fault_mode@once-bindexecqueue-rebind.html> (Intel
>         XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/288>) +6 other tests skip
>   *
> 
>     igt@xe_exec_reset@parallel-gt-reset:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-8/
>         igt@xe_exec_reset@parallel-gt-reset.html> -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v5/shard-
>         bmg-3/igt@xe_exec_reset@parallel-gt-reset.html> (Intel XE#3876
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876>)
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-435/
>         igt@xe_exec_reset@parallel-gt-reset.html> -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v5/shard-
>         dg2-464/igt@xe_exec_reset@parallel-gt-reset.html> (Intel XE#3876
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876>)
>   *
> 
>     igt@xe_exec_sip_eudebug@breakpoint-waitsip:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v5/shard-lnl-7/
>         igt@xe_exec_sip_eudebug@breakpoint-waitsip.html> (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +1
>         other test skip
>   *
> 
>     igt@xe_exec_system_allocator@once-large-mmap-new-huge:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v5/shard-lnl-7/
>         igt@xe_exec_system_allocator@once-large-mmap-new-huge.html>
>         (Intel XE#4943 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4943>) +3 other tests skip
>   *
> 
>     igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v5/shard-adlp-1/
>         igt@xe_exec_system_allocator@threads-many-large-mmap-shared-
>         remap.html> (Intel XE#4915 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4915>) +36 other tests skip
>   *
> 
>     igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-
>     dontunmap-eocheck:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v5/shard-dg2-433/
>         igt@xe_exec_system_allocator@threads-many-large-mmap-shared-
>         remap-dontunmap-eocheck.html> (Intel XE#4915 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4915>) +56 other
>         tests skip
>   *
> 
>     igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
> 
>       o shard-adlp: NOTRUN -> ABORT <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v5/shard-adlp-1/
>         igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html>
>         (Intel XE#4917 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4917>)
>   *
> 
>     igt@xe_huc_copy@huc_copy:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v5/shard-dg2-432/
>         igt@xe_huc_copy@huc_copy.html> (Intel XE#255 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/255>)
>   *
> 
>     igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v5/shard-adlp-1/igt@xe_oa@oa-unit-
>         exclusive-stream-sample-oa.html> (Intel XE#2541 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2541> / Intel
>         XE#3573 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573>)
>   *
> 
>     igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v5/shard-dg2-463/
>         igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html>
>         (Intel XE#1173 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1173>)
>   *
> 
>     igt@xe_query@multigpu-query-config:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v5/shard-adlp-1/igt@xe_query@multigpu-
>         query-config.html> (Intel XE#944 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>   *
> 
>     igt@xe_query@multigpu-query-uc-fw-version-guc:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v5/shard-lnl-7/igt@xe_query@multigpu-query-
>         uc-fw-version-guc.html> (Intel XE#944 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-
>     edp-1:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-lnl-7/
>         igt@kms_async_flips@async-flip-with-page-flip-events-
>         linear@pipe-c-edp-1.html> (Intel XE#911 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/911>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v5/shard-
>         lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-
>         linear@pipe-c-edp-1.html> +3 other tests pass
>   *
> 
>     igt@kms_big_fb@linear-8bpp-rotate-0:
> 
>       o shard-lnl: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-lnl-3/
>         igt@kms_big_fb@linear-8bpp-rotate-0.html> -> PASS <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v5/shard-lnl-7/
>         igt@kms_big_fb@linear-8bpp-rotate-0.html>
>   *
> 
>     igt@kms_big_fb@linear-addfb:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-434/
>         igt@kms_big_fb@linear-addfb.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v5/shard-
>         dg2-464/igt@kms_big_fb@linear-addfb.html> +2 other tests pass
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
> 
>       o shard-adlp: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-
>         adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-
>         hflip-async-flip.html> (Intel XE#4543 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4543>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v5/shard-
>         adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-
>         hflip-async-flip.html> +1 other test pass
>   *
> 
>     igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-6/
>         igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html>
>         (Intel XE#2314 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2314> / Intel XE#2894 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2894>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150488v5/shard-bmg-7/
>         igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html>
>         +1 other test pass
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-
>         dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html>
>         (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1727> / Intel XE#3113 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3113> / Intel XE#3124 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3124> / Intel
>         XE#4345 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4345>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-150488v5/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-
>         tiled-dg2-rc-ccs.html>
>   *
> 
>     igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-6/
>         igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html> (Intel
>         XE#2291 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2291>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-150488v5/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-
>         flipb-toggle.html> +2 other tests pass
>   *
> 
>     igt@kms_display_modes@extended-mode-basic:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-6/
>         igt@kms_display_modes@extended-mode-basic.html> (Intel XE#4302
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v5/
>         shard-bmg-7/igt@kms_display_modes@extended-mode-basic.html>
>   *
> 
>     igt@kms_feature_discovery@display-2x:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-6/
>         igt@kms_feature_discovery@display-2x.html> (Intel XE#2373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v5/
>         shard-bmg-2/igt@kms_feature_discovery@display-2x.html>
>   *
> 
>     igt@kms_flip@2x-plain-flip-ts-check-interruptible:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-6/
>         igt@kms_flip@2x-plain-flip-ts-check-interruptible.html> (Intel
>         XE#2316 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2316>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-150488v5/shard-bmg-1/igt@kms_flip@2x-plain-flip-ts-
>         check-interruptible.html> +5 other tests pass
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-lnl-5/
>         igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html>
>         (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/301>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-150488v5/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-
>         interruptible@c-edp1.html>
>   *
> 
>     igt@kms_flip@flip-vs-rmfb@c-hdmi-a1:
> 
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-
>         adlp-2/igt@kms_flip@flip-vs-rmfb@c-hdmi-a1.html> (Intel XE#4543
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v5/
>         shard-adlp-6/igt@kms_flip@flip-vs-rmfb@c-hdmi-a1.html>
>   *
> 
>     igt@kms_hdr@invalid-hdr:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-436/
>         igt@kms_hdr@invalid-hdr.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v5/shard-
>         dg2-463/igt@kms_hdr@invalid-hdr.html>
>   *
> 
>     igt@kms_hdr@static-toggle:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-6/
>         igt@kms_hdr@static-toggle.html> (Intel XE#1503 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1503>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v5/shard-
>         bmg-7/igt@kms_hdr@static-toggle.html>
>   *
> 
>     igt@kms_pm_rpm@basic-pci-d3-state:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-435/
>         igt@kms_pm_rpm@basic-pci-d3-state.html> (Intel XE#4741 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4741>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v5/shard-
>         dg2-464/igt@kms_pm_rpm@basic-pci-d3-state.html>
>   *
> 
>     igt@kms_setmode@basic@pipe-b-edp-1:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-lnl-1/
>         igt@kms_setmode@basic@pipe-b-edp-1.html> (Intel XE#2883
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v5/
>         shard-lnl-1/igt@kms_setmode@basic@pipe-b-edp-1.html> +2 other
>         tests pass
>   *
> 
>     igt@xe_exec_basic@multigpu-once-rebind:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-432/
>         igt@xe_exec_basic@multigpu-once-rebind.html> (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v5/
>         shard-dg2-436/igt@xe_exec_basic@multigpu-once-rebind.html> +6
>         other tests pass
>   *
> 
>     igt@xe_exec_system_allocator@fault-threads-benchmark:
> 
>       o shard-bmg: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-3/
>         igt@xe_exec_system_allocator@fault-threads-benchmark.html>
>         (Intel XE#2594 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2594>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-150488v5/shard-bmg-7/
>         igt@xe_exec_system_allocator@fault-threads-benchmark.html>
>   *
> 
>     igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-
>     map-nomemset:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-lnl-8/
>         igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-
>         bo-map-nomemset.html> (Intel XE#5018 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5018>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v5/shard-
>         lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-large-
>         new-bo-map-nomemset.html>
>   *
> 
>     igt@xe_pm@s2idle-basic-exec:
> 
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-
>         adlp-6/igt@xe_pm@s2idle-basic-exec.html> (Intel XE#2953
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953> /
>         Intel XE#4173 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4173>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-150488v5/shard-adlp-4/igt@xe_pm@s2idle-basic-exec.html>
>         +4 other tests pass
>   *
> 
>     igt@xe_pmu@gt-frequency:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-435/
>         igt@xe_pmu@gt-frequency.html> (Intel XE#4819 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4819>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v5/shard-
>         dg2-433/igt@xe_pmu@gt-frequency.html> +1 other test pass
> 
> 
>         Warnings
> 
>   *
> 
>     igt@kms_big_fb@linear-64bpp-rotate-270:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-434/
>         igt@kms_big_fb@linear-64bpp-rotate-270.html> (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> /
>         Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-150488v5/shard-dg2-464/igt@kms_big_fb@linear-64bpp-
>         rotate-270.html> (Intel XE#316 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/316>)
>   *
> 
>     igt@kms_big_fb@x-tiled-8bpp-rotate-270:
> 
>       o shard-lnl: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-lnl-3/
>         igt@kms_big_fb@x-tiled-8bpp-rotate-270.html> (Intel XE#1407
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407>) ->
>         ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v5/
>         shard-lnl-1/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html> (Intel
>         XE#4760 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760>)
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-2/
>         igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html>
>         (Intel XE#2311 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2311>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-150488v5/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html>
>         (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2312>) +18 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-
>         mmap-wc.html> (Intel XE#2312 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2312>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150488v5/shard-bmg-7/
>         igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-
>         mmap-wc.html> (Intel XE#2311 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2311>) +12 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-
>         blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2312>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v5/shard-bmg-2/
>         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-
>         blt.html> (Intel XE#4141 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/4141>) +8 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-3/
>         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-
>         onoff.html> (Intel XE#4141 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4141>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v5/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-
>         onoff.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2312>) +3 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-
>         render.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2312>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v5/shard-bmg-1/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-
>         render.html> (Intel XE#2313 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2313>) +10 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-434/
>         igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-
>         blt.html> (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/4208>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v5/shard-dg2-464/
>         igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-
>         blt.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/653>)
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-3/
>         igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-
>         blt.html> (Intel XE#2313 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2313>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v5/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-
>         blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2312>) +14 other tests skip
>   *
> 
>     igt@xe_exec_system_allocator@once-malloc-race:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-434/
>         igt@xe_exec_system_allocator@once-malloc-race.html> (Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-150488v5/shard-dg2-464/
>         igt@xe_exec_system_allocator@once-malloc-race.html> (Intel
>         XE#4915 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4915>) +3 other tests skip
>   *
> 
>     igt@xe_peer2peer@read:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-432/
>         igt@xe_peer2peer@read.html> (Intel XE#1061 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1061>) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v5/shard-
>         dg2-463/igt@xe_peer2peer@read.html> (Intel XE#1173 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1173>)
>   *
> 
>     igt@xe_pm_residency@cpg-basic:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-434/
>         igt@xe_pm_residency@cpg-basic.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v5/shard-
>         dg2-464/igt@xe_pm_residency@cpg-basic.html> (Intel XE#3088
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3088>)
> 
> 
>     Build changes
> 
>   * Linux: xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8 -> xe-
>     pw-150488v5
> 
> IGT_8432: 4871829d8b7117553eb2dc1bdb9a0d18de428a98 @ https:// 
> gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8: 
> e6e27e79a726f8bf333d13521aba32f6466035a8
> xe-pw-150488v5: 150488v5
> 


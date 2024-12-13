Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3549AE77180
	for <intel-xe@archiver.kernel.org>; Fri, 13 Dec 2024 06:23:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01B7A10EF06;
	Fri, 13 Dec 2024 06:23:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tm7jz19z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C552D10EF06
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Dec 2024 06:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734070981; x=1765606981;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zv0wbAiDKj3gRONc1L0h5LMSu94RE30NuohacJhyr94=;
 b=Tm7jz19zpxlxPppYwqcN4ZSr6KnOFuceSgvwnYR46zMBkujmczNAmS+9
 a0l48aDAQLeDQjj6gR657ADFGnZA3vu1DpVrWt5SyUS+zU8PHD/LBu92+
 QY712b/GU9LlZA6zQXVmqmsa0/tKbGY48rGyUFOy8hUIb74ieSwUm54Ni
 SC/+m7iEdaNghSvTmeY54LY5Nq+FPkVEDe6hM+PJpZAbcHm7I0LT1EfS9
 9Yuo6UArx2HOP28utda89mHQez4S4qt6CEpst0FTyeTi9u+aVwkJcJwqx
 lbAL1BioEf52TsSAJndkNzT6yGb+dAhL4NW7cIkbu9CudqXegjUIx+kX4 w==;
X-CSE-ConnectionGUID: vZlAig6ET/ixBKzX2WMx5A==
X-CSE-MsgGUID: CPElHKjsQ6m1wDLEu2JR3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="34751003"
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; d="scan'208";a="34751003"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 22:23:01 -0800
X-CSE-ConnectionGUID: Hejae0Z1RBCnrC8GPhcVnA==
X-CSE-MsgGUID: L9Ugot7VRHOgERFJYVXHvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; d="scan'208";a="127257521"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Dec 2024 22:23:01 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 12 Dec 2024 22:23:00 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 12 Dec 2024 22:23:00 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 12 Dec 2024 22:23:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yp+EOknHXL+ZiZxGe+8dq8YRpjoQL+g1369fAIeJiEahGS8rWSwelzMgREz5+P4sha6f7yzYPhySjbLx/mjPscWGHwFuBYIjjweg021W5I4ukm9tuA2yzD54HDZfDQxVlhQnfbR3zYF2P9tNXL/vP8ck2djsy05hNN8zHB3VA4eEcqNXpvpsIuHX9c2eo46ZSHZHJdOZ3WyEsKrMXWwfK5CJkXLfBFQnddMOP4fcWNa9X0PMwss+dgbuvb1EO48xZUkG+riCZLfoK4IxY6MtAQsI2vBbeS+lVs5I1lbJJV/W38Wz7c98s1wx9Nh08HzNllxqZpI3V19dEoSWoysblA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ql3aqE1qLivrh4EgOctg1SpG0+4E+27P1czFFFrCzrQ=;
 b=DXrWsLV4F56ddobnERQ+HN4lsSHUGkc/mKV7+5B2jz7SIflYjkhzf3b1laHyeKNCPiEEZQqUEB3cNm9ENPMdmE01Xj1R2i8Mb4WsD15TKfKpxWsmyo4CiZOeafls7OdER8no1i7/MvT5VIKc++ti4Kv5jPuoXm658vm/T0lKz73Drbvao3JlybA0/Cge4nKh5cWdAmnG6IIfbqiCJwY0CVK7zRXZgjTYoRoxCLP9929YfEG3CiuRJ/k2mcZG72pH+oMrLiwPexdsCBmYIFgdjrbKLmv0Oy8GpFGvijyRxKJnkNoVFiJO9It5puyPY5cClBIryBYvXhSTWacYAY9ORw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7955.namprd11.prod.outlook.com (2603:10b6:208:3dd::6)
 by CH3PR11MB7676.namprd11.prod.outlook.com (2603:10b6:610:127::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.17; Fri, 13 Dec
 2024 06:22:45 +0000
Received: from IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::7265:46ae:19a8:b31d]) by IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::7265:46ae:19a8:b31d%4]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 06:22:44 +0000
Message-ID: <6e601899-3c93-40f7-ac51-b203fa33a778@intel.com>
Date: Fri, 13 Dec 2024 11:52:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] drm/xe: Add single engine busyness support
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <vinay.belgaumkar@intel.com>,
 <aravind.iddamsetty@intel.com>, <john.c.harrison@intel.com>,
 <ashutosh.dixit@intel.com>, <soham.purkait@intel.com>
References: <20241121063904.3033754-1-riana.tauro@intel.com>
 <20241121063904.3033754-6-riana.tauro@intel.com>
 <Z1t4EB0GwI3qINhe@orsosgc001>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <Z1t4EB0GwI3qINhe@orsosgc001>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PNYP287CA0039.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:23e::13) To IA0PR11MB7955.namprd11.prod.outlook.com
 (2603:10b6:208:3dd::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7955:EE_|CH3PR11MB7676:EE_
X-MS-Office365-Filtering-Correlation-Id: b74a4a8f-34cd-4ba0-84fd-08dd1b3e8e1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TzhZamRrbXFNUGo5N1c2eFBheGVIWHovMEtCVGNHR2cxMjV1UHhUMlFYK202?=
 =?utf-8?B?VXBJQkIxcDVtTzlZMW1Gd050VVduMFBtdHQ2S2d6bFh3aXZBc0Z6b2QwVUdC?=
 =?utf-8?B?cm1heWp1SUh1WDh3b2RJQ2VTbWhGQ1lCQUdENS80ZEJnb3pJY0tTZW9HekRR?=
 =?utf-8?B?RE5TNEsrNkZRcS9LVGtqWFhkc1RLYW1qN0JjRXE5bmNLTnZubVhMZzJMY3JX?=
 =?utf-8?B?a3RmSFNPcloxWDllK3AyOExuSmhwZDdmY25WLzV3VDFMdUFOLzBUeGhBdm5E?=
 =?utf-8?B?b3d0eEZiSXBHdDFUcUdmRVFqUEFCc0UxTWpHcFh6TFdlQW56RU0yaUo3K0lS?=
 =?utf-8?B?bDdFcSsvNkdmMTN2SXlBOXFZZTY1d3JaeHUwaGZmNlhubFgzNG9Ob0NncGxO?=
 =?utf-8?B?d3VFbEJmQ1ByYnNDdEh3Smp0NU5IaGI3anI2bDdMb0U5Vzg3bjJ2OE1yOUVM?=
 =?utf-8?B?N1A4UGpWbmNMRnZrQVhHeWxHeVdyaFBGTEVtSTdkZmhMZEEwZUZGOHVQdi9k?=
 =?utf-8?B?QzZpMmt4UmhrRnBNN3d5eDhRM2llcXJ0RkZHSHFYWHp1bitqZWpwdGxHOEw2?=
 =?utf-8?B?TkQyWVJBa1h5bzVvdGcyWjJGV3dmc3QySU02cXVsS1dzeFhqQUpyQkR4c3Zo?=
 =?utf-8?B?UGVtRDUweUNmWVk5ZXFmODg5K0ZKMkNlWGVOUDBERlVmekluOHVuS0NwN2FX?=
 =?utf-8?B?eDVtWXZxWnJpdi94aXRhZ3lFdEcyVFVIUUJMaXhycXFMSlB3b1dlc05WQWtZ?=
 =?utf-8?B?TForUlJQenJTb3RDSCsvNmVocFZuYTZLSm1LWjVlMGNpVUNLekdqODVoTjh4?=
 =?utf-8?B?SjRVbko4Z2crN2lRRzdzK1VoWVd0a0pSbERSUHJUL2hQN2dVTFM5UG1kbmQv?=
 =?utf-8?B?THN0cTljVFRuaytsdjU2aWxKZW8wWHhDSzlGWi9CbGJpRTkxVUtQV0Y2R1pk?=
 =?utf-8?B?VUhmMXpQU3ZySnlaZXFtaUxKRVR6QVlPM1VXRHR3T1RvcHdqNXFCNEZvVjFL?=
 =?utf-8?B?UkpzUVBTbVRNbTNiS3VZeDZVbUdxQ3R5ZXRTcTlLdlN3c1JhZDJIYlVvTVYv?=
 =?utf-8?B?dk0zSDFjOGxGRWxPbjhKa2dkQ0V4aFVaMElFTVpaS3Z0ZnplMVhQamZhRmM0?=
 =?utf-8?B?TlFMdzVkUWNLbk9tWWtXTnRQV1JXN0xJeWM0OWdUdDlPdXJ0NEtORXFlY3BE?=
 =?utf-8?B?eXFsWEFYRGZpNGlqbElYWlZKL3p4MHlnS0dpaWtYcThKSmw2R0ZwQ1NSbDBh?=
 =?utf-8?B?YkdpRWpKeCtXTmNadzcweS9QcGFNTjN3R01yaXpRTDZRcmQ5M3p6ZUNLOFRL?=
 =?utf-8?B?MGpPR0Q3dHJkcU81ZnNrNW1JUkR1L2NQVytlNnV6ZE95VGUvaTFqS0thbEhR?=
 =?utf-8?B?b2E0ZEdheEpYMGJ5S1JJOVVBdHg1ZTZuLzgzaTV1bHgwZjFneCsvR3NEOVdD?=
 =?utf-8?B?ekl0em8zbDdjbk9xMVpxRUxSOGVYV0Q3eERhZU5IS2hqT1hkSlZKbDRhaXBY?=
 =?utf-8?B?T20vM3ZIUTNqTlp1YncrZFVoQ0ZDSWVaekN3eEZxR05XZkNDVzU0MTNMbFFR?=
 =?utf-8?B?Mi9oVzZsQTBwMmgyL294Rlphd1ZReTBjbE5ub0xRSFpnVUkwWG8wNFFoV1Qr?=
 =?utf-8?B?SEdyK3VqYzRpa2hOY1g3U3ZPZjEzWHhEbzlhQ0ozMW5ZenlXK2d4UmpVRW05?=
 =?utf-8?B?NHRhNjV2cjFQUlovb3JsMWl1RVU4anV0anVNNzRnckZkS0d3VTJEQ09SSXlo?=
 =?utf-8?B?djVxU2Uxemo4Rlh2bzF5VWtnSUdEejV4TzZ3eVIyTGlPYnV0ZUQ1cVAwUUdI?=
 =?utf-8?B?dEF1V0ZmNm81U1FzN3kyUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7955.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1VJc0MxUWVMZzBuNURSSHM1Z3hmMDBLTGMvVUI2QWtaS2pTOENxRjBIbCtO?=
 =?utf-8?B?dlJNYXJVQlc3cDU4a3RCOEVBZ2NkQWlmVEd6WU5uRDdJRU1ZRmhNcEgwcE81?=
 =?utf-8?B?Mi9xMy9QMGRwT1Rzd042YWtQOHFkOUpFNHh3REs2N2xscWhLZEU3K28wNUp5?=
 =?utf-8?B?QkdJd24zLzJseWVFTVc2amdxZlk1eDVGcHBSWWJxaGRQZWZhSlF5SEhOK2lQ?=
 =?utf-8?B?dGpMSElWWWl0RzQxS0oyd3l4cFVGRHgzSUlxTTVHNDRMM2YvTkc4R3JqcDRV?=
 =?utf-8?B?SGxXUkZVeFRmSkZRWnBML3R1cFAvaGtHRjVzUi92VlV1bHRibmRxRUd3VU9N?=
 =?utf-8?B?cllVV0NMYXJZNnV4aFRyN0NzU0U0MW1kUG53SVo5dWtiSmt1bTI4THVEbGh3?=
 =?utf-8?B?bnZnb1F4OEEydEdEUEJtTGl0VkVCNVJVbE1kc0ZvVExYeHJwU0hvYVprVUlF?=
 =?utf-8?B?a0piZjRRKzlLcmdEdURMZ2JXVDZUYWJNeUdIZUhjN0N2UzVWaGJYSkdMYjZ2?=
 =?utf-8?B?Q0JTMnBlVU9GOEltbVdCY2ZmenpYVzJpZDd4QlU2dWtNSmdNYzhMdkZ1V1dn?=
 =?utf-8?B?RnpnME9mL3lHWk5rZGlKZ2c2TVdFUVptR21qU2l2MHgzU1JITEZ6Rmk5dWlm?=
 =?utf-8?B?Z0UvWUd3dVQraFlqRDVzVUhtanNtVlBFZ0lDUFhEbG5jdzI1empFUFdmVHE1?=
 =?utf-8?B?WlFRRldoY3l5MWtKQXAxd1EwdUtpYUJZNGxsRnRrTitJbXhvK0c4NURQRzBZ?=
 =?utf-8?B?d3JsVHRoMlFxSkc3RFlER2hQUUFWTTZCeWRsRnB2bWV4bGoxS2d4VUlOVFVw?=
 =?utf-8?B?dmFEWGg2bTNGMkliKzlXWUxsb21sbEI4Ykg4RTVoU1MzbHloSVozYjZoS3cw?=
 =?utf-8?B?dDJlK1VyWDBTdnloQ05FTFlMT2pxRWkzNkNqMFdLVVIvZnhxTUVkaGdYT1Fm?=
 =?utf-8?B?bXBsSDFqMTRhWDlxaGJhajNkcC9zcDZXTDhxYWJPOXVnYU5KVEVPL1N1WGMy?=
 =?utf-8?B?a05YcWc2QklEOFo5ZG5IZHA2UWZTMHY4eEc0TFlNOVJFeGRMT09BMy80anBO?=
 =?utf-8?B?d3ljSVNkOE1TSmJ1VnZzZ3EzTGlkSHU5SW9VY1AxU3FhVXRTRElMYjVZTmZW?=
 =?utf-8?B?VkE4YkV0emMxR3RYOVhzYjV2REdBL2h2VDdJam9rMHdaWGNqQ2JnUWY3cHg4?=
 =?utf-8?B?ejFsTHprVzNrZ0UwU0hXbUNnTlY1TkhJaGNJNzN3aDl4Sk5oeHVUWVczVnI5?=
 =?utf-8?B?L2l3S2l0ZVlnazZXWFJ0TzB3eFhIY1l4Zm1IemEyU1hmTmVFT0xKRnFlVEI3?=
 =?utf-8?B?R09EK1VnQjluVERZVGxYMlRTS1RVV3VMeEI3Qy9ZRjZCcEFYMFFFaGwyNmpJ?=
 =?utf-8?B?ZHpUc1lSTmdSUmdZYlUvVkVtT2owdWpxOWZGc0FGbjdUZGJIQnJBTXJycUc0?=
 =?utf-8?B?VDFBWHJ3a2pJVEEza25SM0ZvUXVENG9PdmpVTmd5ZzNyT2ZqbzFWVUlibjht?=
 =?utf-8?B?TlFGb0tFUkU2cDAvUTJQeHorak42M1VRVHZuOGpBS3NPUlpKc3l0QmRlYUdv?=
 =?utf-8?B?cm0vaUhUbmRSOUVKWmRVOWFJdFdrRExYSGVqVlpDajdiV0V1aXFxYS9aaHFV?=
 =?utf-8?B?SzR1VjdXRzhZZHAxM09xSnFvQitrU0ZNM1hzcE1hY0M2Q3JFL0ZlTnU4dmF1?=
 =?utf-8?B?SzBTcGRJVmtCb0QvdHdaRG14ZXJWL2hsRmJzZVJqUDZJOWZqejVTa0VTS3d2?=
 =?utf-8?B?ai9MSlpyWmlKZThCVG5meGordHA5ZC80MTZFQnpYd1Q5bTdOWFo3am4yTkpu?=
 =?utf-8?B?OTFVUW1Uem1mY29WSUtDUEtkWUEwQWh3c001SzE3blI3ckpTbVJ1SWVJTzV0?=
 =?utf-8?B?NjNsT1VYL09zcjU0QjdObmowWC95bEh5UmU2VWNrWWJER2RqVU9wTnhyRys2?=
 =?utf-8?B?S2I2dXpycXkxNFVhZWVpRzNQN2duRGNrMnluakFnR2JpY2ZVc0hSUjl0VWlR?=
 =?utf-8?B?Y3poRFVqbmRSaTVjMEpwbEhXV2s0ZUR0dm5NU21jcHNLblRaUkVTL080VXV5?=
 =?utf-8?B?REkxQXk3U0F2QklXMWFUR0V0RlB0cUZUd0RVWm0zcTc5K3V3RFhHcHhrZXRr?=
 =?utf-8?Q?qfPDyWw8Ij0Y3mUst+rsQqhBB?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b74a4a8f-34cd-4ba0-84fd-08dd1b3e8e1b
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7955.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 06:22:44.5801 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tgun+R6igDvBW8tNk6fgt+Ltd/N9uI+K7A0AL7NvS6QlYiRoS2+ATMyCUetKuuaLMmqmePbBbCyK45Y0HDQTtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7676
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



On 12/13/2024 5:26 AM, Umesh Nerlige Ramappa wrote:
> On Wed, Dec 11, 2024 at 04:44:17PM -0800, Umesh Nerlige Ramappa wrote:
> On Thu, Nov 21, 2024 at 12:09:01PM +0530, Riana Tauro wrote:
>> GuC provides support to read engine active counters to calculate the
>> engine utilization. KMD exposes two counters via the PMU interface to
>> calculate engine busyness
>>
>> Engine Active Ticks(<engine>-busy-ticks-gt<n>) - number of active ticks
>>                          for engine
>> Total Ticks (<engine>-total-ticks-gt<n>) - total ticks GT has been active
>>
>> Busyness percentage can be calculated as below
>> busyness % = (engine active ticks/total ticks) * 100.
>>
>> v2: fix cosmetic review comments
>>   add forcewake for gpm_ts (Umesh)
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> drivers/gpu/drm/xe/Makefile                   |   1 +
>> drivers/gpu/drm/xe/abi/guc_actions_abi.h      |   1 +
>> drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   2 +
>> drivers/gpu/drm/xe/xe_engine_activity.c       | 323 ++++++++++++++++++
>> drivers/gpu/drm/xe/xe_engine_activity.h       |  18 +
>> drivers/gpu/drm/xe/xe_engine_activity_types.h |  85 +++++
>> drivers/gpu/drm/xe/xe_guc_fwif.h              |  19 ++
>> drivers/gpu/drm/xe/xe_guc_types.h             |   4 +
>> 8 files changed, 453 insertions(+)
>> create mode 100644 drivers/gpu/drm/xe/xe_engine_activity.c
>> create mode 100644 drivers/gpu/drm/xe/xe_engine_activity.h
>> create mode 100644 drivers/gpu/drm/xe/xe_engine_activity_types.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index c231ecaf86b8..32473c609824 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -33,6 +33,7 @@ xe-y += xe_bb.o \
>>     xe_device_sysfs.o \
>>     xe_dma_buf.o \
>>     xe_drm_client.o \
>> +    xe_engine_activity.o \
>>     xe_exec.o \
>>     xe_execlist.o \
>>     xe_exec_queue.o \
>> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/ 
>> drm/xe/abi/guc_actions_abi.h
>> index b54fe40fc5a9..3a7834f7e421 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> @@ -138,6 +138,7 @@ enum xe_guc_action {
>>     XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC = 0x4601,
>>     XE_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
>>     XE_GUC_ACTION_SET_ENG_UTIL_BUFF = 0x550A,
>> +    XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER = 0x550C,
>>     XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR = 0x6000,
>>     XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC = 0x6002,
>>     XE_GUC_ACTION_PAGE_FAULT_RES_DESC = 0x6003,
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/ 
>> xe/regs/xe_gt_regs.h
>> index 0c9e4b2fafab..7a7283262673 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -355,6 +355,8 @@
>> #define   RENDER_AWAKE_STATUS            REG_BIT(1)
>> #define   MEDIA_SLICE0_AWAKE_STATUS        REG_BIT(0)
>>
>> +#define MISC_STATUS_0                XE_REG(0xa500)
>> +
>> #define FORCEWAKE_MEDIA_VDBOX(n)        XE_REG(0xa540 + (n) * 4)
>> #define FORCEWAKE_MEDIA_VEBOX(n)        XE_REG(0xa560 + (n) * 4)
>> #define FORCEWAKE_GSC                XE_REG(0xa618)
>> diff --git a/drivers/gpu/drm/xe/xe_engine_activity.c b/drivers/gpu/ 
>> drm/xe/xe_engine_activity.c
>> new file mode 100644
>> index 000000000000..464cb09933b5
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_engine_activity.c
>> @@ -0,0 +1,323 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +#include "xe_engine_activity.h"
>> +
>> +#include "abi/guc_actions_abi.h"
>> +#include "regs/xe_gt_regs.h"
>> +
>> +#include "xe_bo.h"
>> +#include "xe_force_wake.h"
>> +#include "xe_gt_printk.h"
>> +#include "xe_guc.h"
>> +#include "xe_guc_ct.h"
>> +#include "xe_hw_engine.h"
>> +#include "xe_map.h"
>> +#include "xe_mmio.h"
>> +
>> +#define TOTAL_QUANTA 0x8000
>> +
>> +static struct xe_guc *engine_busy_to_guc(struct xe_engine_activity 
>> *engine_busy)
>> +{
>> +    return container_of(engine_busy, struct xe_guc, engine_busy);
>> +}
>> +
>> +static struct iosys_map *activity_to_map(struct activity_buffer *buffer)
>> +{
>> +    return &buffer->activity->vmap;
>> +}
>> +
>> +static struct iosys_map *metadata_to_map(struct activity_buffer *buffer)
>> +{
>> +    return &buffer->metadata->vmap;
>> +}
>> +
>> +static int allocate_activity_group(struct xe_engine_activity 
>> *engine_busy)
>> +{
>> +    u32 num_activity_group = 1;
>> +
>> +    engine_busy->ag =  kmalloc_array(num_activity_group,
>> +                     sizeof(struct activity_group),
>> +                     GFP_KERNEL);
>> +
>> +    if (!engine_busy->ag)
>> +        return -ENOMEM;
>> +
>> +    memset(engine_busy->ag, 0, num_activity_group * sizeof(struct 
>> activity_group));
>> +    engine_busy->num_activity_group = num_activity_group;
>> +
>> +    return 0;
>> +}
>> +
>> +static int allocate_activity_buffers(struct xe_engine_activity 
>> *engine_busy)
>> +{
>> +    u32 metadata_size = sizeof(struct guc_engine_activity_metadata);
>> +    u32 size = sizeof(struct guc_engine_activity_data);
>> +    struct xe_guc *guc = engine_busy_to_guc(engine_busy);
>> +    struct activity_buffer *ab = &engine_busy->device_buffer;
>> +    struct xe_gt *gt = guc_to_gt(guc);
>> +    struct xe_tile *tile = gt_to_tile(gt);
>> +    struct xe_bo *bo, *metadata_bo;
>> +
>> +    metadata_bo = xe_managed_bo_create_pin_map(gt_to_xe(gt), tile, 
>> PAGE_ALIGN(metadata_size),
>> +                           XE_BO_FLAG_SYSTEM |
>> +                           XE_BO_FLAG_GGTT |
>> +                           XE_BO_FLAG_GGTT_INVALIDATE);
>> +    if (IS_ERR(metadata_bo))
>> +        return PTR_ERR(metadata_bo);
>> +
>> +    bo = xe_managed_bo_create_pin_map(gt_to_xe(gt), tile, 
>> PAGE_ALIGN(size),
>> +                      XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>> +                      XE_BO_FLAG_GGTT |
>> +                      XE_BO_FLAG_GGTT_INVALIDATE);
>> +
>> +    if (IS_ERR(bo))
>> +        return PTR_ERR(bo);
>> +
>> +    ab->metadata = metadata_bo;
>> +    ab->activity = bo;
>> +    return 0;
>> +}
>> +
>> +static struct engine_activity *hw_engine_to_engine_activity(struct 
>> xe_hw_engine *hwe)
>> +{
>> +    struct xe_guc *guc = &hwe->gt->uc.guc;
>> +    struct activity_group *ag = &guc->engine_busy.ag[0];
>> +    u16 guc_class = xe_engine_class_to_guc_class(hwe->class);
>> +
>> +    return &ag->engine[guc_class][hwe->logical_instance];
>> +}
>> +
>> +static u64 cpu_ns_to_guc_tsc_tick(ktime_t ns, u32 freq)
>> +{
>> +    return mul_u64_u32_div(ns, freq, NSEC_PER_SEC);
>> +}
>> +
>> +#define read_engine_activity_record(xe_, map_, field_) \
>> +    xe_map_rd_field(xe_, map_, 0, struct guc_engine_activity, field_)
>> +
>> +#define read_metadata_record(xe_, buffers_, field_) \
>> +    xe_map_rd_field(xe_, metadata_to_map(buffers_), \
>> +            0, struct guc_engine_activity_metadata, field_)
>> +
>> +static u64 get_engine_active_ticks(struct xe_guc *guc, struct 
>> xe_hw_engine *hwe)
>> +{
>> +    struct engine_activity *ea = hw_engine_to_engine_activity(hwe);
>> +    struct guc_engine_activity *cached_activity = &ea->activity;
>> +    struct guc_engine_activity_metadata *cached_metadata = &ea- 
>> >metadata;
>> +    struct xe_engine_activity *engine_busy = &guc->engine_busy;
>> +    struct activity_buffer *device_buffer = &engine_busy->device_buffer;
>> +    struct xe_device *xe =  guc_to_xe(guc);
>> +    struct xe_gt *gt = guc_to_gt(guc);
>> +
>> +    u16 guc_class = xe_engine_class_to_guc_class(hwe->class);
>> +    size_t offset = offsetof(struct guc_engine_activity_data,
>> +                 engine_activity[guc_class][hwe->logical_instance]);
>> +    struct iosys_map engine_activity_map = 
>> IOSYS_MAP_INIT_OFFSET(activity_to_map(device_buffer),
>> +                                     offset);
>> +    u32 last_update_tick, global_change_num;
>> +    u64 active_ticks, gpm_ts;
>> +    unsigned int fw_ref;
>> +    u16 change_num;
>> +
>> +    global_change_num = read_metadata_record(xe, device_buffer, 
>> global_change_num);
>> +
>> +    /* GuC has not initialized activity data yet, return 0 */
>> +    if (!global_change_num)
>> +        goto update;
>> +
>> +    if (global_change_num == cached_metadata->global_change_num)
>> +        goto update;
>> +    else
>> +        cached_metadata->global_change_num = global_change_num;
>> +
>> +    change_num = read_engine_activity_record(xe, 
>> &engine_activity_map, change_num);
>> +
>> +    if (!change_num || change_num == cached_activity->change_num)
>> +        goto update;
>> +
>> +    /* read engine activity values */
>> +    last_update_tick = read_engine_activity_record(xe, 
>> &engine_activity_map, last_update_tick);
>> +    active_ticks = read_engine_activity_record(xe, 
>> &engine_activity_map, active_ticks);
>> +
>> +    /* activity calculations */
>> +    ea->running = !!last_update_tick;
>> +    ea->total += active_ticks - cached_activity->active_ticks;
>> +    ea->active = 0;
>> +
>> +    /* cache the counter */
>> +    cached_activity->change_num = change_num;
>> +    cached_activity->last_update_tick = last_update_tick;
>> +    cached_activity->active_ticks = active_ticks;
>> +
>> +update:
>> +    if (ea->running) {
>> +        fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>> +        if (fw_ref) {
>> +            gpm_ts = xe_mmio_read64_2x32(&gt->mmio, MISC_STATUS_0) >>
>> +                 engine_busy->gpm_timestamp_shift;
>> +            ea->active = lower_32_bits(gpm_ts) - cached_activity- 
>> >last_update_tick;
>> +            xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>> +        }
>> +    }
>> +
>> +    return ea->total + ea->active;
>> +}
>> +
>> +static u64 get_engine_total_ticks(struct xe_guc *guc, struct 
>> xe_hw_engine *hwe)
>> +{
>> +    struct engine_activity *ea = hw_engine_to_engine_activity(hwe);
>> +    struct guc_engine_activity_metadata *cached_metadata = &ea- 
>> >metadata;
>> +    struct guc_engine_activity *cached_activity = &ea->activity;
>> +    struct xe_engine_activity *engine_busy = &guc->engine_busy;
>> +    struct activity_buffer *device_buffer = &engine_busy->device_buffer;
>> +    struct xe_device *xe =  guc_to_xe(guc);
>> +    u16 guc_class = xe_engine_class_to_guc_class(hwe->class);
>> +    size_t offset = offsetof(struct guc_engine_activity_data,
>> +                 engine_activity[guc_class][hwe->logical_instance]);
>> +    struct iosys_map engine_activity_map = 
>> IOSYS_MAP_INIT_OFFSET(activity_to_map(device_buffer),
>> +                                     offset);
>> +
>> +    ktime_t now, cpu_delta;
>> +    u64 numerator;
>> +    u16 quanta_ratio;
>> +
>> +    if (!cached_metadata->guc_tsc_frequency_hz)
>> +        cached_metadata->guc_tsc_frequency_hz = read_metadata_record(xe,
>> +                                         device_buffer,
>> +                                         guc_tsc_frequency_hz);
>> +
>> +    quanta_ratio = read_engine_activity_record(xe, 
>> &engine_activity_map, quanta_ratio);
>> +    cached_activity->quanta_ratio = quanta_ratio;
>> +
>> +    /* Total ticks calculations */
>> +    now = ktime_get();
>> +    cpu_delta = now - ea->last_cpu_ts;
>> +    ea->last_cpu_ts = now;
>> +    numerator = (ea->quanta_remainder_ns + cpu_delta) * 
>> cached_activity->quanta_ratio;
>> +    ea->quanta_ns += numerator / TOTAL_QUANTA;
>> +    ea->quanta_remainder_ns = numerator % TOTAL_QUANTA;
>> +    ea->quanta = cpu_ns_to_guc_tsc_tick(ea->quanta_ns, 
>> cached_metadata->guc_tsc_frequency_hz);
>> +
>> +    return ea->quanta;
>> +}
>> +
>> +static int enable_engine_activity_stats(struct xe_guc *guc)
>> +{
>> +    struct xe_engine_activity *engine_busy = &guc->engine_busy;
>> +    struct activity_buffer *buffer = &engine_busy->device_buffer;
>> +    u32 metadata_ggtt_addr = xe_bo_ggtt_addr(buffer->metadata);
>> +    u32 ggtt_addr = xe_bo_ggtt_addr(buffer->activity);
>> +    int len = 0;
>> +    u32 action[5];
>> +
>> +    action[len++] = XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER;
>> +    action[len++] = metadata_ggtt_addr;
>> +    action[len++] = 0;
>> +    action[len++] = ggtt_addr;
>> +    action[len++] = 0;
>> +
>> +    /* Blocking here to ensure the buffers are ready before reading 
>> them */
>> +    return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
>> +}
>> +
>> +static void engine_activity_set_cpu_ts(struct xe_guc *guc)
>> +{
>> +    struct xe_engine_activity *engine_busy = &guc->engine_busy;
>> +    struct activity_group *ag = engine_busy->ag;
>> +    int i, j;
>> +
>> +    for (i = 0; i < GUC_MAX_ENGINE_CLASSES; i++)
>> +        for (j = 0; j < GUC_MAX_INSTANCES_PER_CLASS; j++)
>> +            ag->engine[i][j].last_cpu_ts = ktime_get();
>> +}
>> +
>> +static u32 gpm_timestamp_shift(struct xe_gt *gt)
>> +{
>> +    u32 reg;
>> +
>> +    reg = xe_mmio_read32(&gt->mmio, RPM_CONFIG0);
>> +
>> +    return 3 - REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, reg);
>> +}
>> +
>> +/**
>> + * xe_engine_activity_get_active_ticks - Get engine active ticks
>> + * @hwe: The hw_engine object
>> + *
>> + * Return: accumulated ticks @hwe was busy since engine stats were 
>> enabled.
>> + */
>> +u64 xe_engine_activity_get_active_ticks(struct xe_hw_engine *hwe)
>> +{
>> +    struct xe_guc *guc =  &hwe->gt->uc.guc;
>> +
>> +    return get_engine_active_ticks(guc, hwe);
>> +}
>> +
>> +/**
>> + * xe_engine_activity_get_total_ticks - Get engine total ticks
>> + * @hwe: The hw_engine object
>> + *
>> + * Return: accumulated quanta of ticks allocated for the engine
>> + */
>> +u64 xe_engine_activity_get_total_ticks(struct xe_hw_engine *hwe)
>> +{
>> +    struct xe_guc *guc =  &hwe->gt->uc.guc;
>> +
>> +    return get_engine_total_ticks(guc, hwe);
>> +}
>> +
>> +/**
>> + * xe_engine_activity_enable_stats - Enable engine activity stats
>> + * @guc: The GuC object
>> + *
>> + * Enable engine activity stats and set initial timestamps
>> + */
>> +void xe_engine_activity_enable_stats(struct xe_guc *guc)
>> +{
>> +    int ret;
>> +
>> +    ret = enable_engine_activity_stats(guc);
>> +    if (ret)
>> +        xe_gt_err(guc_to_gt(guc), "failed to enable activity 
>> stats%d\n", ret);
>> +    else
>> +        engine_activity_set_cpu_ts(guc);
>> +}
>> +
>> +static void engine_activity_fini(void *arg)
>> +{
>> +    struct xe_engine_activity *engine_busy = arg;
>> +
>> +    kfree(engine_busy->ag);
>> +}
>> +
>> +/**
>> + * xe_engine_activity_init - Initialize the engine activity data
>> + * @guc: The GuC object
>> + *
>> + * Return: 0 on success, negative error code otherwise.
>> + */
>> +int xe_engine_activity_init(struct xe_guc *guc)
>> +{
>> +    struct xe_engine_activity *engine_busy = &guc->engine_busy;
>> +    struct xe_gt *gt = guc_to_gt(guc);
>> +    int ret;
>> +
>> +    ret = allocate_activity_group(engine_busy);
>> +    if (ret) {
>> +        xe_gt_err(gt, "failed to allocate activity group %d\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    ret = allocate_activity_buffers(engine_busy);
>> +    if (ret) {
>> +        xe_gt_err(gt, "failed to allocate activity buffers%d\n", ret);
>> +        kfree(engine_busy->ag);
>> +        return ret;
>> +    }
>> +
>> +    engine_busy->gpm_timestamp_shift = gpm_timestamp_shift(gt);
>> +
>> +    return devm_add_action_or_reset(gt_to_xe(gt)->drm.dev, 
>> engine_activity_fini, engine_busy);
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_engine_activity.h b/drivers/gpu/ 
>> drm/xe/xe_engine_activity.h
>> new file mode 100644
>> index 000000000000..d44ac3366bd0
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_engine_activity.h
>> @@ -0,0 +1,18 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_ENGINE_ACTIVITY_H_
>> +#define _XE_ENGINE_ACTIVITY_H_
>> +
>> +#include <linux/types.h>
>> +
>> +struct xe_hw_engine;
>> +struct xe_guc;
>> +
>> +int xe_engine_activity_init(struct xe_guc *guc);
>> +void xe_engine_activity_enable_stats(struct xe_guc *guc);
>> +u64 xe_engine_activity_get_active_ticks(struct xe_hw_engine *hwe);
>> +u64 xe_engine_activity_get_total_ticks(struct xe_hw_engine *hwe);
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_engine_activity_types.h b/drivers/ 
>> gpu/drm/xe/xe_engine_activity_types.h
>> new file mode 100644
>> index 000000000000..cad83aed3d0b
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_engine_activity_types.h
>> @@ -0,0 +1,85 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_ENGINE_ACTIVITY_TYPES_H_
>> +#define _XE_ENGINE_ACTIVITY_TYPES_H_
>> +
>> +#include <linux/types.h>
>> +
>> +#include "xe_guc_fwif.h"
>> +/**
>> + * struct engine_activity - Engine specific activity data
>> + *
>> + * Contains engine specific activity data and snapshot of the
>> + * structures from GuC
>> + */
>> +struct engine_activity {
>> +    /** @active: current activity */
>> +    u64 active;
>> +
>> +    /** @last_cpu_ts: cpu timestamp in nsec of previous sample */
>> +    u64 last_cpu_ts;
>> +
>> +    /** @quanta: total quanta used on HW */
>> +    u64 quanta;
>> +
>> +    /** @quanta_ns: total quanta_ns used on HW */
>> +    u64 quanta_ns;
>> +
>> +    /**
>> +     * @quanta_remainder_ns: remainder when the CPU time is scaled as
>> +     * per the quanta_ratio. This remainder is used in subsequent
>> +     * quanta calculations.
>> +     */
>> +    u64 quanta_remainder_ns;
>> +
>> +    /** @total: total engine activity */
>> +    u64 total;
>> +
>> +    /** @running: true if engine is running some work */
>> +    bool running;
>> +
>> +    /** @metadata: snapshot of engine activity metadata */
>> +    struct guc_engine_activity_metadata metadata;
>> +
>> +    /** @activity: snapshot of engine activity counter */
>> +    struct guc_engine_activity activity;
>> +};
>> +
>> +/**
>> + * struct activity_group - Busyness data for all engines
>> + */
>> +struct activity_group {
>> +    /** @engine: engine specific activity data */
>> +    struct engine_activity engine[GUC_MAX_ENGINE_CLASSES] 
>> [GUC_MAX_INSTANCES_PER_CLASS];
>> +};
>> +
>> +/**
>> + * struct activity_buffer - Activity buffers
>> + *
>> + * This contains the buffers allocated for metadata and activity data
>> + */
>> +struct activity_buffer {
>> +    /* @activity: object allocated to hold activity data */
>> +    struct xe_bo *activity;
> 
> nit: When comments are added, IMO, spaces between the members make it 
> more readable.
> 
>> +    /* @metadata: object allocated to hold activity metadata */
> 
> Please use /**. I see a mix in this header. I think the /** is for 
> kernel doc.
Fixing this in rev 3. Have missed @ and used the kernel-doc format wrong.

> 
>> +    struct xe_bo *metadata;
>> +};
>> +
>> +/**
>> + * struct xe_engine_activity - Data used by engine activity 
>> implementation
>> + */
>> +struct xe_engine_activity {
>> +    /* @gpm_timestamp_shift: Right shift value for the gpm timestamp */
>> +    u32 gpm_timestamp_shift;
>> +    /** num_activity_group: number of activity groups */
>> +    int num_activity_group;
>> +    /** @ag: holds the device level busyness data */
>> +    struct activity_group *ag;
>> +    /* @device_buffer: activity buffer object for global activity */
>> +    struct activity_buffer device_buffer;
>> +};
>> +#endif
>> +
>> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/ 
>> xe_guc_fwif.h
>> index 057153f89b30..8b336c15ef5b 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
>> @@ -208,6 +208,25 @@ struct guc_engine_usage {
>>     struct guc_engine_usage_record engines[GUC_MAX_ENGINE_CLASSES] 
>> [GUC_MAX_INSTANCES_PER_CLASS];
>> } __packed;
>>
>> +/* Engine usage stats - v3 */
>> +struct guc_engine_activity {
>> +    u16 change_num;
>> +    u16 quanta_ratio;
>> +    u32 last_update_tick;
>> +    u64 active_ticks;
>> +} __packed;
>> +
>> +struct guc_engine_activity_data {
>> +    struct guc_engine_activity 
>> engine_activity[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
>> +} __packed;
>> +
>> +struct guc_engine_activity_metadata {
>> +    u32 guc_tsc_frequency_hz;
>> +    u32 lag_latency_usec;
>> +    u32 global_change_num;
>> +    u32 reserved;
>> +} __packed;
>> +
>> /* This action will be programmed in C1BC - SOFT_SCRATCH_15_REG */
>> enum xe_guc_recv_message {
>>     XE_GUC_RECV_MSG_CRASH_DUMP_POSTED = BIT(1),
>> diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/ 
>> xe_guc_types.h
>> index fa75f57bf5da..3a89bfb18307 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_types.h
>> @@ -10,6 +10,7 @@
>> #include <linux/xarray.h>
>>
>> #include "regs/xe_reg_defs.h"
>> +#include "xe_engine_activity_types.h"
>> #include "xe_guc_ads_types.h"
>> #include "xe_guc_ct_types.h"
>> #include "xe_guc_fwif.h"
>> @@ -90,6 +91,9 @@ struct xe_guc {
>>     /** @relay: GuC Relay Communication used in SR-IOV */
>>     struct xe_guc_relay relay;
>>
>> +    /** @engine_busy: Device specific engine busyness */
>> +    struct xe_engine_activity engine_busy;
> 
> nit: Maybe we can do away with using busy/busyness in the Xe 
> implementation.  Use 'activity' everywhere. Thoughts?
Will use activity everywhere
> 
> Rest looks good. With kernel doc format fixed, this is
> 
> Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> 
Thanks for the review.

Thanks,
Riana

> Thanks,
> Umesh
> 
>> +
>>     /**
>>      * @notify_reg: Register which is written to notify GuC of H2G 
>> messages
>>      */
>> -- 
>> 2.40.0
>>


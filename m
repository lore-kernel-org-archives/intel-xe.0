Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F25BEE6BF10
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 21:56:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6C8A10E12D;
	Fri, 30 Jan 2026 21:56:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SEcrGDr7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C74E510E0FE
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Jan 2026 21:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769810214; x=1801346214;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=ZUua682tLXzVP4ajAlc1gMNBwwT1I2Ai8oWq9TLJBcU=;
 b=SEcrGDr7WBoQa9kmblII7FCOUsuKsviaFO08hbyBxccYR5jW7WsHhfAk
 TP+K1GADyMDnEKnna3onbODdHyYZB6k4+Ubs3clQ2G2ZnRjM1V4LRiVDE
 /qX5yGJaiqlsooaOgyKBnpnZvh8UD1PIa9hFy39yLdFS0FFUH3Z1/6Na7
 33AtmM8d+7Cwg6qWBYbguvXi4QAR3QbQMqrfihKWRMdx9FuSZB2nbMeGp
 N8qdPovl+pgJbhoEKVL41kcpZ+63QcXNCZYRqY8MYZWTAImDDBKol0xSj
 Wim20fmC4tGpBrJ3sziJGla90wmaro65d8K4YBB5Gm6jhEOZzzLU7Ws5K Q==;
X-CSE-ConnectionGUID: FYDkHLIhSSabuGEuq4rgCQ==
X-CSE-MsgGUID: Ebrn/h46TauaJrp1/hSB8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="71044158"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="71044158"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 13:56:53 -0800
X-CSE-ConnectionGUID: S2VSgMd+ROSklvgGZ49vjA==
X-CSE-MsgGUID: X4SOKGuuRyu6c2rNxfT9XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="209191149"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 13:56:51 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 13:56:52 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 30 Jan 2026 13:56:52 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.71) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 13:56:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tF81er2AodpHow+/+IhKBFVElII+/gX/5AO46cNkUJegbuqW/o26RkTY+K61dVdF5aoZtrQ8c02qHlTmgistIhIi8zgDL2HJEtYZ05Py4+vtRQKSDZ2izqxeKYt6Y22p1T/1Sdb9zmAIUBDXkpUjPqNNQGG9nFlip3vNevaDJse86iBlqYsHuJCNSjw5bxqBJ0VcctMAg3wqjwcbc69I1i+Ei9QsoTac5ujxFiQZkrRhwzdWIRfDlJVCFM+vaQZuJef00IBCV5xdC5mR16gPI+WHxveMX5/FEGwfjhKZAeWy0sMeZNwmxLUDMHzEMIp4vu1DIRWcPmiyuWCgf4qpqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sz+cY4Wjvpp4xTe6ywRRFaOfq+bQVpXiSxn/lU/cFBo=;
 b=waZ0TxXa2ZHexn0Ge9/owzZ/57/4TIzoanDXhLFRMXDBt/sDwXsycIqV7PT6n63ok0WINgzlGvG32uf56g9Tzlhv+eci6GI/95Ibc0xOY8KFENKIjeD4SUWs+9fppIkBdkNAyiac20z0iKSV0gFueEwlHGG29gLtukdeaG8GzJGT2IwS+CCvREJisFnrWeWR/wDJ7BbpdYZcy31BVceFfAvyLL9xGAWkmYCUrKGsHF8l0/mTbgHhG6V8NArmuOtG4QxE8K0z2WKHV7cD4USy0nV7Tl9W49RCnnl+ZrrxX6gqFeUCxUWFgaSN6GfK+yisDIb1NgJ4Iq0MGlzEOPMDBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB8132.namprd11.prod.outlook.com (2603:10b6:8:17e::13)
 by PH7PR11MB6426.namprd11.prod.outlook.com (2603:10b6:510:1f6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.12; Fri, 30 Jan
 2026 21:56:47 +0000
Received: from DM4PR11MB8132.namprd11.prod.outlook.com
 ([fe80::22f3:a01e:fb45:57ac]) by DM4PR11MB8132.namprd11.prod.outlook.com
 ([fe80::22f3:a01e:fb45:57ac%4]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 21:56:47 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: [PATCH] drm/xe/pf: Fix the address range assert in ggtt_get_pte helper
Date: Fri, 30 Jan 2026 22:56:24 +0100
Message-ID: <20260130215624.556099-1-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.52.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P190CA0025.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::38) To DM4PR11MB8132.namprd11.prod.outlook.com
 (2603:10b6:8:17e::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB8132:EE_|PH7PR11MB6426:EE_
X-MS-Office365-Filtering-Correlation-Id: 781f9e4e-10b3-4a27-fe04-08de604a76a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NHY0dURTeEtWcTA3WjNnZGgxOGQ0MGJxSDRtWkV6N2tVNlpWU2xib2ZhSmNQ?=
 =?utf-8?B?MHc5ZUI3WCt1dmdIQkFUYmdPUUNsNjJoczl5di93QkVXZjhFSW0vNkh2cEFT?=
 =?utf-8?B?K1BkNE5KUXJscGo0RDZXbnc2WGdBUVBtT3c0ZUowTk9QeDRGSmV5VjV4cVFU?=
 =?utf-8?B?eHhXclZWVStuS09KUE4vK1BGcW9hYmtQdGptUVJnV0RzNFB1bDZqWjFZMm5t?=
 =?utf-8?B?UWFUcWw0UzE0VFZXazU0c3ZZcS8yMG1NK09CV2Q0VEh4OWlzYUw2N01Ka0lX?=
 =?utf-8?B?WUpLUVhlVTEvOFNmV0NBUWZoUGpKNDg5MHRoOTliQ0RhRnF4cTZBREwyRkl4?=
 =?utf-8?B?TkVUaDM2ZFVMVkJ4ZThZLytpa0JRYkM4RzcrYWJVbEE3MXZOS0hVS2NHZVRa?=
 =?utf-8?B?UFRHTWxQekRnL0Vqbm56KzdEZ25UVjlBUHhGR2NIVzVpUm5xMlZ6U2ZWMkdU?=
 =?utf-8?B?bUpIOU96ejE3bjRUeS9KajJkSzlEWXlNMC9NUGl5SHRCN3RpS0M1d2FIVmxN?=
 =?utf-8?B?N2pqZWdKb09PdmdUTFhTRSs2anh4MURUUlRtbmRTMTdQWDNwc3cySEVaRmQ0?=
 =?utf-8?B?eXZXeW10d3JmSWNDQ0hza2RmRW5nclFOaXI0V2pyQkNicmg5MG4rTVZ5bERP?=
 =?utf-8?B?elNZOGt5VGxSTXcxMlV5bGloOTJrL0pUdUdnSmhGdWFIQ3d3bnhGeFhKZnBM?=
 =?utf-8?B?a0hNMHEzQ1JvL1Mxcy9lM3h0SWNCVndEMHk1WGozNDF1T1VIRjlZUEVzdGpS?=
 =?utf-8?B?RDRCaDZYU2hud3NRTHN6U0dDWWJPL0N3QVI3cEhMc3ZaQUtsNEVUcVpUN1c4?=
 =?utf-8?B?OGFmWk52bEtISE5UNDh0UXZpeUVQZDRjUEVyWXBRdUpDRk9PLytRT0kzb3Ey?=
 =?utf-8?B?cnhZeU5wMkkxOGh0RlV6T3BpYldrOXgyRmZXVVpscVlTMHg2VUtjOWRJMjFS?=
 =?utf-8?B?Wi9EaFoxYUx0R3lUMDZFZ3MvSnFrWDZ3N1FZRzJRMWMyY1hnekVTaWFCU1U4?=
 =?utf-8?B?ZDZkS2xsdWk2Q1ZuTGZjUmpseSt0cDJ0TE9ySFo4R3Z6SnJsYWRrK3ovbVRR?=
 =?utf-8?B?ZElNYWRnVGYwc0ZXT3hRcHNUZ3hQU2NJOTNJL3lyVlJPWFR2OXUwZGIvc0Q3?=
 =?utf-8?B?c3dPZ0RkUWJZRVVLaTVqV0RRbStDN3dqOTRpUnU5RjZrd3VQZ0ZvejRyUGNB?=
 =?utf-8?B?aHY2ZXdsN3FyWEFqb1dqUGwvZE1MWXNMNHNXZ3ZLNFBkeXNRcWhiU3cxV09Q?=
 =?utf-8?B?RHVxSG5MRU5UTzBzeldGUUt3eUNCK1VPWTRoQlVIak5jU1I3ckUyNjFQVWxF?=
 =?utf-8?B?TnVsQ2dpNm5MTzFKc0NNU1ZwUmRvNVdESFkzVXhYUjdYcGVFYU91T3F2MmtZ?=
 =?utf-8?B?YXpVLy8rdmxZYVYyREN2RUR3NjBhcjl4ZGFEK3p4eWVja3hLTWgzcjdGelVJ?=
 =?utf-8?B?ZTBSUVliNW1jcGJmUkQySnRzZEZwTUFmdTk5UmVjMTdUSEVzL1ovOUtMV3Uv?=
 =?utf-8?B?cU9meGk5bVhQOGVrM0VXYzM0dlNJdm01c1h5ZzdwV09Wclp0Vk5QbWhYNU90?=
 =?utf-8?B?Q0RTaS92L0JKVEl5OFY1aEM2UXFUSWdrODZkMW9WK0RwRFpWY2FUcHBZY3U0?=
 =?utf-8?B?d0R6ZWxKR0JwSVI5L0tLMThEaTUzUGI1S2lzbWRFV3dzdHozdTRrUXdxdUhD?=
 =?utf-8?B?OEk3MUNMQ0xFcEt5UkMrRWErblluZldvSzVwK3VwdXh1aFVnRFg3a2FJTHhs?=
 =?utf-8?B?YTMrQVk0UFhjbStMVmdhSXk0L0JQMWVqYkdzVnFLeUQ5UStSc0FDSDN6YzQx?=
 =?utf-8?B?RHFjVGozNDF0c1F6SkZTdG9uQitUUXo4dnBIKzRKanpCeE5IUGpRaHVKaDFk?=
 =?utf-8?B?dk9WZnlPNFBKN0t4SDA4NERjYkUxQURYRDROYzBqQXp6WktCN1ZZQnZZaUtx?=
 =?utf-8?B?RFo5UnNZRXVWc3pqcUJNQ25TQWdpZ3p6dFZHT3d4QnF5S2IvazV2NFE5TFlS?=
 =?utf-8?B?WmRIYnFpMU4zclJiVStYcW9keWNoWjZUQ1pNUkprZmt4aFh1eURPOTBnZlVp?=
 =?utf-8?B?SWhJRTJIWGpkZEZJSm5rc290SVNvUkhwSzJmSWJoT3NacGxiWUxrZmZETDdD?=
 =?utf-8?Q?dBX4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8132.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eEg0cWFVME5QcVNSRFNweUY4THFmb09VdFl5Q3BHR2NsSWJ0MW5uMFd6Mkxq?=
 =?utf-8?B?UTRCR3dyR0FjdnhpUzF4VXFWYTRNRWMvRHY1L2tRVlkrak45Yk1xbGFmT0dP?=
 =?utf-8?B?WjRNcWZFWkU0OWQxcUlVOWNBeTdFdUgvQ0wvNEloTUhZbitvc1Bna1dNY3hF?=
 =?utf-8?B?NTQzRFpUaXFuR3BQd2xYaktLSEgzODlIMVV5b1ZKS0gyU3NjVFMwQ0ZGSGxE?=
 =?utf-8?B?QU4zaElsanBXNkF1amJKb1d1a3Vkb1VTdW9vQ3RvVk5ueDRIUWpUdmRaWjJy?=
 =?utf-8?B?SHdKRUY0K1FIT2NlNEZMK2tjcmxRK1plKy9ubzVoRjY1N3FIRHZkQUJnL1E3?=
 =?utf-8?B?QXF5eHRjbkFlbTJXNW1rTGFvdEZNazNPMjM4OVJCc2ZjSlF2NjlrY1JySStI?=
 =?utf-8?B?eVdpTEpzV0RXWm9YaGdKOGJoeWswdTFRWldlT0gyZzl5M3gxREhTSnNhYnFk?=
 =?utf-8?B?QUVvN2RqQnI2K2xCQXJiQitMZk1iOWZuOXlBNEpGOGx1bzVockxIbk5aQk5m?=
 =?utf-8?B?N3ZuL0FRQmQ0Rm16Mzhsem9pQ0wrSDBXbjY4VXg2NHhlSDRzQVVKeXZWRlJU?=
 =?utf-8?B?UzU4bTlMNm5SWmlEWDlQeXRMRVBEUHJNSWlidHBkZVRtQnZOakgybXpJMDM1?=
 =?utf-8?B?ZHlzSnNIdXZuY2V3UGdpTi95YzM5MElJbkJ3VzV5Y1YzckNHTEdHYytZSnA1?=
 =?utf-8?B?d3pnNzVTcGV0UEd4eU5JTk14cDl1bmZJRHY5R1VkanRWQlYzblRWQkxESDB2?=
 =?utf-8?B?QmZXZUxTdm5ncUNHazU2b0JqT1BDN2pxQ1EyaXp4SHNUMGhtTmwwenRoZU1k?=
 =?utf-8?B?Q2V5b254c0N6QWZkMHFiR0tRNngrZ3Y0KzhXVk14MDR2S2hmclRFSStQNjM3?=
 =?utf-8?B?MlJWTnp0VmZqbEVKZE1nbTNVQmNZSEVOdmxabUQ5UTN1L2ZmS09JckdKQm9s?=
 =?utf-8?B?Z051ZHZXSVNzbkFsNE0xUFBZQStzR29ZN0plTFZVKzZpeWplaFdDbkpYR2NJ?=
 =?utf-8?B?ZGNpaHd2bGlteWoxclZpL0hadzFOaTlTZFFPS3F6RGVTNG1IaEdYb0Z3aW1L?=
 =?utf-8?B?MnYxcDY2TDlFb29xbllnQkJ4eEw5OUVoOHNyem1Sd3U0ZXFQUW8zR3dCbTBj?=
 =?utf-8?B?c2Z2U1JXQ2o5WTVqZFI1VkI4ck11MDFWMFYxUWZlNkpieVpjdVdreFp4REdw?=
 =?utf-8?B?L0kwUDZaZDhuWno5RjlLdHhPUVk0RmxsRzcxM3VubXRyQ3c4dE5lNm5Zb3Zi?=
 =?utf-8?B?SDFqYVZXVHB3V0R5TnhrdGJ6M2QveUxzdVgva3dVYUlSK2dxV0daVzRyd091?=
 =?utf-8?B?bElkbnBNWWhzeXBvb0xBN1RwT0ljQW41WHBucGpoNEJiandVeUxUVVRzLzIr?=
 =?utf-8?B?eWh0aFBVZDZlTVJEbmJDTzUvSitKTUNOOUpPbG1FR3V0dktBbWJxSjRIeUdt?=
 =?utf-8?B?MncxN08yajFwMklJNXlkRlpBNWZLR2dPdVVsd3ZNWFM0Nk9ZdzAwdU1ROEtO?=
 =?utf-8?B?VWZmMXJIelRoU1BVbExiOFNxck5Oc0ZuaEw0TDlTN3h5V2pJbk9MaXZrNmxm?=
 =?utf-8?B?VTViSDJEd0FzYis3eFlQamw3SDZsbGxwV2RhbnF4bDBlZEhONVU3QmF5KzN1?=
 =?utf-8?B?ZXdCUmphWlRUZkpaV1JRd05FNnNDTXMwMlIwZ0cyRHZmdFVoS0Rra1VnK2Zz?=
 =?utf-8?B?cFJzSTJNK0Q2eHlzRFRCS3Q2QkZJTkFNTDE3Z1duaTZPRkpYV0xVVXh0NFNw?=
 =?utf-8?B?K0h0SEFNNk9QdkU1ZjZrL01KNCtrTE81cnBBa29seUF1aDZMZTBlRDEyWE5t?=
 =?utf-8?B?aDhLQ2ZpU0VVZFAyZkVTbjdzTmRRbzVDNEJQZFlxcTVMcVZBZ1hrUXBaWFVR?=
 =?utf-8?B?blo1ditCWmVLemc0ZUdFbk1NMkVWeWd1a0c5ZHpLbE9haTVKMXRuT2NLU1Vi?=
 =?utf-8?B?TTJTQnVkMkZLTVRKcU55ZWtiMU9mOTRMeVA3c3pGQjNEU1hnN04zTXZMSy9r?=
 =?utf-8?B?WDdCb2FVRUtERG1STjgzY1g3NmF3ZEdzblZrZ0xlUGM3NDNUVjI4MFh3RndY?=
 =?utf-8?B?RlZQZkhoOFJZa0lBMTN0b2JuN1l0Slk1QytEdmVXdWlvU2pIS3NpRjk1MDRJ?=
 =?utf-8?B?bmVYU0tEOEhjdlRWem40VFl5bDd2MGtzTHhxUGtyTTArcUIrRWpmWCtLSEEx?=
 =?utf-8?B?ZlpCeU9jRmh1MFBYVnQyUEgySnlvUFY4bjdNbHIwUldkUW15Q0VQakJ6dzF6?=
 =?utf-8?B?VWV2Nk0zTlVNVjMxYnVTd0Q2cXpTZ0RyT1BuMUdhdkEzQjJXVjRCSWpOQklI?=
 =?utf-8?B?dmwxSndzQ1lrMjRqOSs2Wk4vTFhUZ0wvZ2dJWWdVMUIzWDB1eldwMUVrWFFw?=
 =?utf-8?Q?IX/4tJd2J86Znr4w=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 781f9e4e-10b3-4a27-fe04-08de604a76a2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8132.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 21:56:47.0487 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Btr5W27dAMQJP2hKyoY3kB2RdGPBYbfVcQRVCk3GzzoXtiJafvw/EGJRwPA8TCL7t+EZHeh7HAAysP3Stl7mUBvgR7pm4lydIWuzemBoK5A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6426
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

The ggtt_get_pte helper used for saving VF GGTT incorrectly assumes that
ggtt_size == ggtt_end.
Fix it to avoid triggering spurious asserts if VF GGTT object lands in
high GGTT range.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 60665ad1415be..10bbf7a86b487 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -193,7 +193,7 @@ static void xe_ggtt_set_pte_and_flush(struct xe_ggtt *ggtt, u64 addr, u64 pte)
 static u64 xe_ggtt_get_pte(struct xe_ggtt *ggtt, u64 addr)
 {
 	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
-	xe_tile_assert(ggtt->tile, addr < ggtt->size);
+	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->size);
 
 	return readq(&ggtt->gsm[addr >> XE_PTE_SHIFT]);
 }
-- 
2.52.0


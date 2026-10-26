Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E21C606A320
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 10:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EPFEIKzd
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1C5210EDCA;
	Mon, 26 Oct 2026 10:43:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B7B110EDD8
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Oct 2026 10:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793011379; x=1824547379;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=YaG07HeePXW4hlK8epbnnvUywhxUiXS1QZYc3lbeOzA=;
 b=EPFEIKzdMR/eX4WR0UahRPmMEAIVcgjXr4YQJ8YkA4/27/QdzMjRtAOe
 t6dXubY8biw4hz24idip/RlPMo/yPbmGJAa/5kNaDCK2jNT/k/C9TaL0n
 4LcZbGZbrFTb3zow91UJgdyk+7kwo7uEBzJ42z3tBr8IgQYhCsaTbZqx/
 wEPSppSiOuRF5jGCKSDAp/93oL/FnqKIl8PvHguG5AgTDj/AjqLr8W7Qa
 SwxXioCJMum7tqK8hS6qU6eUxsM8rRXqBsYDup1+GIY5N7Wjkyb4wgmI7
 GPNmeuvHSB67/fC1/q4aRewi5hwv7uBBUDgO5S5gIpyocZVNJiAXA6bxW A==;
X-CSE-ConnectionGUID: r7l2IOMyQSO/aNSOmQMPCA==
X-CSE-MsgGUID: fGV8amYkTXugkNVIzqceIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1695076"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1695076"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 03:42:59 -0700
X-CSE-ConnectionGUID: uXHgWEuUTXu/7KGPvBj2EQ==
X-CSE-MsgGUID: vdIBp2Q3Rq6j1nZfBY89ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="5986554"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 03:42:58 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 03:42:57 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 26 Oct 2026 03:42:57 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.47) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 03:42:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wn7YxvP4Ih7qcMVeco+Ebv+Re7RybEzw7mFge/ICRKHSjoN5v5rTQdpzjiuq5w66nyQ2Qaj8jBs88rN9d92+jltFMMhV9navRagHFhhWf8KGbwiBZFOr40VMkPUn/Qu+foEb1ju5lxVcAN//fry9ci87nEXuw+aAKC7FUpxstXTkCooioFJx4yuKdletAaN+j000/KfX2m4bnzQUAgqt39cNmS9Ag3UwBXNGVryfIwa8EUkkg8zLVRAayh2tOgMSbI8hw2sJVvVcuLDA+lcBDE8G2ychPpEAr2caO4+lz9W4wFNmkJXt/pJ2iicAlgGfUDmxmKv9orxA1+3f+dn4ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oh0Mq9jjsXkc/C/krpp9vkVhyhfuEO2ueSs0d7/+7Rc=;
 b=f/cXKfvifuFoJx1raTgUJX7DTzJ7II1i890KRPHDelGVWu5NJx9BZoVfjq32/RBbPImMe71gHOOBNrn8RzdCF273VX8gaPblvLdr6IVMXoJn1i6/2k4XIJBt1nHEgisMwWJSU+GtwRgE38uq6UfYjNHFEQOAO+TfgD67bQrc6EyZo6rlGQFv3ODQn5absijPlWX+oCkHPFcYrgLVwU9bLjNqaLCHLgzJ8OU9pfGlo+XPGwlkQEfggjBOGCFhmsTOX9KMXs7+4LX11djEVYEA6lDJwt3Kr/m0Xg1xzrrO2TYkZ1w7xA/jamYxLb61md4aqfl9AqpIhve2c1FyjR8kqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by PH8PR11MB8016.namprd11.prod.outlook.com (2603:10b6:510:250::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 10:42:54 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 10:42:54 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v1 4/4] drm/xe/pf: Explicitly use shareable GuC doorbells for
 VFs provisioning
Date: Mon, 26 Oct 2026 11:42:24 +0100
Message-ID: <20261026104224.1018993-5-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261026104224.1018993-1-piotr.piorkowski@intel.com>
References: <20261026104224.1018993-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL2P290CA0019.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::14) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|PH8PR11MB8016:EE_
X-MS-Office365-Filtering-Correlation-Id: 28dbbea3-325c-4329-4465-08df334de3ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|18002099003|22082099003|56012099006|11063799006|261021123027099003|10067099003|261009223027099003|261021121427099003|261022105027099003;
X-Microsoft-Antispam-Message-Info: HJ54wecKwSf2EmdN+LYjWM0A5R8G2pDwxkAR9S/GCA3B524BXcLxVpGg6lo8WXNVyuE9UzFeRpLWUQXQxQ59P/IikuRE9yjT4FPGcfPI6xU5OJOseag8iAV4TgigOOUe//M+1qOb7WyWaXdL9dUMcVndvXJqcRHiACHB3O5WoVNN1aXSQPT7kDFNyuVG7BvbVAP/DMlL+oiYpPIJbNKamkDI3vlM+1MJhCaAbe5ulne1ToHAf475rA4APPGmxyP3MfR0sjiul/HxN8u/VvMNUA2duAloLP49LyOVmk/oCyodZEWo/cZ1WmmE+5sNUJh7qU4CeChUkRK3zIw31DLO7IkU1nY04A5qp9DvCTnNqIxNMxNyFt39XVjmL7SOyOzGBLkFmafdxe1zEIFhx1R8/JJeTiv4FxX26MYm1SnMik7rPMUmJwzsX2+ZObp7DLJaUg+N8OxjQeQZ1pgAfvzk49Zo4LVZJt9jbTa+ojZPuyqUHM6VWOTmS7xPrTaIwobi+VcmFge/Pj8go6BjfDmFSotlXAIpJcnYfFUwlBI9jgUhTEgVH/vOY0kgcT+AXh8z1gbRXsw+Oy2nHTs+0afMUkuqAQNq98vuHp7WqYlft0F4lF5aXMv+wCgCgdzWr2tX9l9f1cE5aDsld55kdQUvSaYsalMO5zSZel/8gj8WG8A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099006)(11063799006)(261021123027099003)(10067099003)(261009223027099003)(261021121427099003)(261022105027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUtuQ2ZWaTN0ak10QWdKU1VNTElVN3BCK2NWVzMreUN6WGNLZWYwanFSU0R2?=
 =?utf-8?B?N2hha0JjVzg5UG1JeE8wZWd2TEdNWG1XcUlESlVJUmRVaDVXWnJoKzJLNUdS?=
 =?utf-8?B?UGF1c2ZXZEhVaFBVTCsvSXdqVzNrdDlEUXIzNzV6NGc5N3MyVW94LzBkbDhI?=
 =?utf-8?B?b0dxZHphSEo4S2VXNzBIT0FORWNUdUhRMWkwN043d0pzZjZqSXZTWVFUWnpO?=
 =?utf-8?B?VnZWbVREeWFIamt0SXA4ZURUcTFoSGpYcTg2bWNJMmpmN0xVcnFYNlZkUURE?=
 =?utf-8?B?eTBzd05VSUZmWUx1aGZvVmFGUkdmcWJ3dC9ZQlovZ2s4MkptYVp3SlRPSUk1?=
 =?utf-8?B?WkNoZmpvenFQdXJCVlNSMi9XSzc4RmsxS2NOdUVheFNGL0t1S0hzRjJzZ0hs?=
 =?utf-8?B?WDh5NGFQRHdKOFFLSDRXRHlTYUdiZnVtV1RUOTBHQmFPM1MxdDE3MW16d0pz?=
 =?utf-8?B?d0s0N1BPekNEaGFOMU8vaG5ySWdocGp3TEF1dUdCWjFGOWRPT1VycitidFc2?=
 =?utf-8?B?b0RKK0JETkdMNFlRZ0pqeDdLSnZiZzRKY0NwZHNaUEd0aUZ4bmZVRTFiWFF0?=
 =?utf-8?B?VnFCQWJXaitYWGpadStCbWhIUWNGQ2lYVTYrRGFkQzZ3NFRGQ284Nk4zV2Rj?=
 =?utf-8?B?b0RZRHVXMVhHb2JQTURzL1JXbVU2SHIzYnBtL1FnVnduRGZ0VnIrWDEyRExh?=
 =?utf-8?B?WlFSTzJzNnI5UXYzSzBLS0NXQTgrNVlSMzJuaVMramcvekZiV3VPbHAxQWdK?=
 =?utf-8?B?Sk40VG9wK2J6VlVWd1drRTNIR2paUStQdXdxS2hoVS9iRHVmTFMwa3pIU0lY?=
 =?utf-8?B?b2xGZE54K0hkd3dETkRJNUhaTWx5WnpFZUpJRGIrMDJ1eGpBVzI4aDFQdTFz?=
 =?utf-8?B?ZitRM1VucTNDemdXSkpPeUVCNkR0eno3YVRUVW1Ra0RRbTJTSVdHVVNXbnhI?=
 =?utf-8?B?YjUzem5ZVHVsVmt5U01iSWt1U201eTE5NVJnc2dGZnVtVDN5TmdnandEVnAw?=
 =?utf-8?B?WkxMeFpxeEEyS2lTdnYySjRzR1Rpc2YyNmpoNUlheHg2Wml2cFdXeE1tZy85?=
 =?utf-8?B?Zzk4TEo5TlE5dW40c1JDaDUxdnptUEdhZXJhWUpWcGU0QjMxYkQ2K3RXOGR0?=
 =?utf-8?B?Wmw5eDJURHo1RjZWVUNTN2ZzMXN3dFRUU0VDLzdvYVUvc2hZVUVML1BITSs5?=
 =?utf-8?B?VkE2di93cFlDMnE0eFEvNEorYVVWSXpCSmxZZU05bHM3cjFTWjR2dDM2dWxl?=
 =?utf-8?B?ZGhmSEJIeWp2ZXpQSUx3L0FtRXRVbHV0NGNBbjhqVmpiREFUemFyU0F0K3Vv?=
 =?utf-8?B?RlJ2VU1EazVhak1UbitpY3Z2NUVPcjlLMXkwamxqbDNqV2JuYXo5QmhMQUxU?=
 =?utf-8?B?RTM4ZERGdGsrbk1UeEZGbkNkN1E2RXordXZXeHhVVWNLbHg0OVgvYXJhNkxq?=
 =?utf-8?B?Wm5yekozblE2eXoyWFViZmlVdXhvTVpSSGpDYnd0anFHNTdTUG5tcU13Z2Jx?=
 =?utf-8?B?Tmk1NXN5T3pWMEFBdzQrYTZVbTF6MUdQc0ZiN0xQVmFOWi81UVFBTGFSYzJ5?=
 =?utf-8?B?VkorOVYwVkRIV1IyODBLdjBJaitxblB5cUhZQkJJQzVTaHFITWVQSTV1bjN1?=
 =?utf-8?B?RUlDZlluVXRDVFRqUmlsSXRIYzFwUGlOQjdIbDJhY0o5MGJlUG1NT3RqSHN0?=
 =?utf-8?B?NGtsbDNwZ21FeDFCTC9qL21tVHBTQ1ZtcUM0dE9RUDBCajVXaGhzdGlwMm1p?=
 =?utf-8?B?Y1M5RzR1S0hyZTZhWXJLYmdOMmRqNElheWhrSnIwaXRZdEZsUW5xUk1PQldp?=
 =?utf-8?B?dFBHWk1zM0s1QzFqYWlOQmtjM3BNMWdkRklUMDB3Uk5SQUZsRFMva29ZNmwz?=
 =?utf-8?B?Z2pMcExiK2NzakNMZUlHd25MRFFqM2NYUWptY3p6em1wUVcxbXZBbExFVHNi?=
 =?utf-8?B?RW15WmFSQ3hzbVdWbDFwTmNQK0srUDBaN2RjUWRZNWdoZkFkZUUrS094bkpq?=
 =?utf-8?B?WmZ5K1gwZHd5b1NJQVdwZ1pxakZFVy9SYXVxdnM5Y3hGWjIyUFl3aUhLYUth?=
 =?utf-8?B?RzFDaFdFTTlyWDhIZkNHdDhiellWdHhoMHZlNm0zL2ZJZ3Z0ZlFRbHd5a1ZK?=
 =?utf-8?B?dmtpR0ZsRVc3TU11NUVSVXg2NGUrVm1La3g0NUNMUm9SSXppQnpoNlVlQzcr?=
 =?utf-8?B?MUIveXplOHYzeXA3K3dlQm9oOEk5TTIzWDZ6ZFZDLzdKQW40NkZGUjVQTVBs?=
 =?utf-8?B?QStLOFJkTzEreHUvV01IcHBMRUpPM241d3JZcDY4UUxwMGY2cDNZVmF0bGFQ?=
 =?utf-8?B?UEhXOXBPOEl1ZW1YcENNbmZBUHlDZGdHVDk1VFhDUTFsRTV1TGpzMzhtWnFt?=
 =?utf-8?Q?JoSZgqNYGZ5CwRQ0=3D?=
X-Exchange-RoutingPolicyChecked: b8wTobB46mrjUGq0C15CEdjFrKpmsIRvyFdRs8Xkmilsfi/2SXpLbxlnbwbc3H2LVDD+zZMeTEujtEpm0DfUU9T5OWOtOmL2HFR9I3kfiqANhiAdjWnLrfPRQ8KxKenfGCBbhLn87iZeEeCKI8jD9exIZeaC5L/lgVAgXb1eg14Fl/RAKsoQx2cp3NYbuheFYLJIWoigxPIAfX1y3glKjesWmuIscCy5jXgVXmz2N+waWv5sNTg2gIWtbXUqDSC08dZTImyaOW+OR4yL0EsjFUDRv8Iv/vja4zvrQ+37nb7L/EKhEY0/cGso0sHk02J2JO8lxcCB1z3PLFtpzRT4Og==
X-MS-Exchange-CrossTenant-Network-Message-Id: 28dbbea3-325c-4329-4465-08df334de3ef
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 10:42:54.0539 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 11epuwZrwDFcYKn8PfGsileMkPiAmNsQyYCZguiLSVl7rZX7oyouNtwbeDbv4jnASOVyVGGCewc8cyCK7AvvNEP1blbkH27VREXPU/ofTD0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8016
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Switch PF VF-doorbells provisioning to explicitly reserve and release
doorbells from the dedicated shareable pool. Note that shareable
doorbells are now reserved starting from the end of the pool, the same
way as GuC context IDs, leaving the lower doorbells for the PF use.

Also, let's remove the legacy GuC doorbells reservation API now that all
VFs provisioning paths use the shareable helpers.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 .../xe/tests/xe_gt_sriov_pf_config_kunit.c    |  4 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 25 ++++--
 drivers/gpu/drm/xe/xe_guc_db_mgr.c            | 90 -------------------
 drivers/gpu/drm/xe/xe_guc_db_mgr.h            |  6 --
 4 files changed, 20 insertions(+), 105 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
index 4d72411cd570c..77e587f5b4af6 100644
--- a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
+++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
@@ -68,6 +68,7 @@ static int pf_gt_config_test_init(struct kunit *test)
 		.graphics_verx100 = 2001,
 	};
 	struct xe_vram_region *vram;
+	struct xe_guc_db_mgr *dbm;
 	struct xe_guc_id_mgr *idm;
 	struct xe_device *xe;
 	struct xe_gt *gt;
@@ -107,6 +108,9 @@ static int pf_gt_config_test_init(struct kunit *test)
 	mutex_init(&gt->uc.guc.submission_state.lock);
 	KUNIT_ASSERT_EQ(test, xe_guc_id_mgr_init_shared(idm), 0);
 
+	dbm = &gt->uc.guc.dbm;
+	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init_shared(dbm), 0);
+
 	/* more sanity checks */
 	KUNIT_EXPECT_EQ(test, GUC_ID_MAX + 1, SZ_64K);
 	KUNIT_EXPECT_EQ(test, GUC_NUM_DOORBELLS, SZ_256);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 0a47458e5bf20..69ad4fddfb855 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1261,7 +1261,7 @@ static int pf_set_spare_dbs(struct xe_gt *gt, u32 spare)
 	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
 	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
 
-	if (spare > GUC_NUM_DOORBELLS)
+	if (spare > xe_guc_db_mgr_max_shareable(&gt->uc.guc.dbm))
 		return -EINVAL;
 
 	if (spare && spare < pf_get_min_spare_dbs(gt))
@@ -1277,7 +1277,7 @@ static int pf_reserve_dbs(struct xe_gt *gt, u32 num)
 	struct xe_guc_db_mgr *dbm = &gt->uc.guc.dbm;
 	unsigned int spare = pf_get_spare_dbs(gt);
 
-	return xe_guc_db_mgr_reserve_range(dbm, num, spare);
+	return xe_guc_db_mgr_reserve_shareable(dbm, num, spare);
 }
 
 static void pf_release_dbs(struct xe_gt *gt, u32 start, u32 num)
@@ -1285,7 +1285,7 @@ static void pf_release_dbs(struct xe_gt *gt, u32 start, u32 num)
 	struct xe_guc_db_mgr *dbm = &gt->uc.guc.dbm;
 
 	if (num)
-		xe_guc_db_mgr_release_range(dbm, start, num);
+		xe_gt_WARN_ON(gt, xe_guc_db_mgr_release_shareable(dbm, start, num));
 }
 
 static void pf_release_config_dbs(struct xe_gt *gt, struct xe_gt_sriov_config *config)
@@ -1304,7 +1304,7 @@ static int pf_provision_vf_dbs(struct xe_gt *gt, unsigned int vfid, u32 num_dbs)
 
 	xe_gt_assert(gt, vfid);
 
-	if (num_dbs > GUC_NUM_DOORBELLS)
+	if (num_dbs > xe_guc_db_mgr_max_shareable(&gt->uc.guc.dbm))
 		return -EINVAL;
 
 	if (config->num_dbs) {
@@ -1458,27 +1458,34 @@ int xe_gt_sriov_pf_config_bulk_set_dbs(struct xe_gt *gt, unsigned int vfid,
 
 static u32 pf_profile_fair_dbs(struct xe_gt *gt, unsigned int num_vfs)
 {
+	u32 max_shareable = xe_guc_db_mgr_max_shareable(&gt->uc.guc.dbm);
 	bool admin_only_pf = xe_sriov_pf_admin_only(gt_to_xe(gt));
 
 	/* XXX: preliminary */
 	if (admin_only_pf && num_vfs == 1)
-		return GUC_NUM_DOORBELLS - SZ_16;
+		return max_shareable > SZ_16 ? max_shareable - SZ_16 : 0;
 
-	return rounddown_pow_of_two(GUC_NUM_DOORBELLS / (num_vfs + 1));
+	return rounddown_pow_of_two(max_shareable / (num_vfs + 1));
 }
 
 static u32 pf_estimate_fair_dbs(struct xe_gt *gt, unsigned int num_vfs)
 {
 	struct xe_guc_db_mgr *dbm = &gt->uc.guc.dbm;
+	u32 max_shareable = xe_guc_db_mgr_max_shareable(dbm);
 	u32 spare = pf_get_spare_dbs(gt);
-	u32 fair = (GUC_NUM_DOORBELLS - spare) / num_vfs;
+	u32 fair;
 	int ret;
 
+	if (max_shareable <= spare)
+		return 0;
+
+	fair = (max_shareable - spare) / num_vfs;
+
 	for (; fair; --fair) {
-		ret = xe_guc_db_mgr_reserve_range(dbm, fair * num_vfs, spare);
+		ret = xe_guc_db_mgr_reserve_shareable(dbm, fair * num_vfs, spare);
 		if (ret < 0)
 			continue;
-		xe_guc_db_mgr_release_range(dbm, ret, fair * num_vfs);
+		xe_gt_WARN_ON(gt, xe_guc_db_mgr_release_shareable(dbm, ret, fair * num_vfs));
 		break;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_guc_db_mgr.c b/drivers/gpu/drm/xe/xe_guc_db_mgr.c
index 7da37e838957b..c2cc63bc5f075 100644
--- a/drivers/gpu/drm/xe/xe_guc_db_mgr.c
+++ b/drivers/gpu/drm/xe/xe_guc_db_mgr.c
@@ -258,36 +258,6 @@ static int dbm_reserve_chunk_shareable_locked(struct xe_guc_db_mgr *dbm, unsigne
 	return id;
 }
 
-static int dbm_reserve_chunk_locked(struct xe_guc_db_mgr *dbm,
-				    unsigned int count, unsigned int spare)
-{
-	unsigned int total = dbm_total(dbm);
-	int index;
-
-	dbm_assert(dbm, count);
-	dbm_assert(dbm, count <= GUC_NUM_DOORBELLS);
-	lockdep_assert_held(dbm_mutex(dbm));
-
-	if (!total)
-		return -ENODATA;
-
-	if (spare) {
-		int err;
-
-		err = dbm_check_quota(bitmap_weight(dbm->bitmap, total), count, spare, total);
-		if (err)
-			return err;
-	}
-
-	index = bitmap_find_next_zero_area(dbm->bitmap, total, 0, count, 0);
-	if (index >= total)
-		return -ENOSPC;
-
-	bitmap_set(dbm->bitmap, index, count);
-
-	return index;
-}
-
 static void dbm_release_chunk_locked(struct xe_guc_db_mgr *dbm,
 				     unsigned int start, unsigned int count)
 {
@@ -364,66 +334,6 @@ int xe_guc_db_mgr_release_shareable(struct xe_guc_db_mgr *dbm, unsigned int id,
 						 dbm_shareable_start(dbm), dbm_total(dbm));
 }
 
-/**
- * xe_guc_db_mgr_reserve_id_locked() - Reserve a single GuC Doorbell ID.
- * @dbm: the &xe_guc_db_mgr
- *
- * This function expects that submission lock is already taken.
- *
- * Return: ID of the allocated GuC doorbell or a negative error code on failure.
- */
-int xe_guc_db_mgr_reserve_id_locked(struct xe_guc_db_mgr *dbm)
-{
-	return dbm_reserve_chunk_locked(dbm, 1, 0);
-}
-
-/**
- * xe_guc_db_mgr_release_id_locked() - Release a single GuC Doorbell ID.
- * @dbm: the &xe_guc_db_mgr
- * @id: the GuC Doorbell ID to release
- *
- * This function expects that submission lock is already taken.
- */
-void xe_guc_db_mgr_release_id_locked(struct xe_guc_db_mgr *dbm, unsigned int id)
-{
-	return dbm_release_chunk_locked(dbm, id, 1);
-}
-
-/**
- * xe_guc_db_mgr_reserve_range() - Reserve a range of GuC Doorbell IDs.
- * @dbm: the &xe_guc_db_mgr
- * @count: number of GuC doorbell IDs to reserve
- * @spare: number of GuC doorbell IDs to keep available
- *
- * This function is dedicated for the for use by the PF which expects that
- * allocated range for the VF will be contiguous and that there will be at
- * least &spare IDs still available for the PF use after this reservation.
- *
- * Return: starting ID of the allocated GuC doorbell ID range or
- *         a negative error code on failure.
- */
-int xe_guc_db_mgr_reserve_range(struct xe_guc_db_mgr *dbm,
-				unsigned int count, unsigned int spare)
-{
-	guard(mutex)(dbm_mutex(dbm));
-
-	return dbm_reserve_chunk_locked(dbm, count, spare);
-}
-
-/**
- * xe_guc_db_mgr_release_range() - Release a range of Doorbell IDs.
- * @dbm: the &xe_guc_db_mgr
- * @start: the starting ID of GuC doorbell ID range to release
- * @count: number of GuC doorbell IDs to release
- */
-void xe_guc_db_mgr_release_range(struct xe_guc_db_mgr *dbm,
-				 unsigned int start, unsigned int count)
-{
-	guard(mutex)(dbm_mutex(dbm));
-
-	dbm_release_chunk_locked(dbm, start, count);
-}
-
 static void dbm_print_range_locked(struct xe_guc_db_mgr *dbm,
 				   struct drm_printer *p,
 				   int indent,
diff --git a/drivers/gpu/drm/xe/xe_guc_db_mgr.h b/drivers/gpu/drm/xe/xe_guc_db_mgr.h
index ca62c6b86b273..9df4fdbde0db6 100644
--- a/drivers/gpu/drm/xe/xe_guc_db_mgr.h
+++ b/drivers/gpu/drm/xe/xe_guc_db_mgr.h
@@ -28,12 +28,6 @@ int xe_guc_db_mgr_reserve_shareable(struct xe_guc_db_mgr *dbm, unsigned int coun
 int xe_guc_db_mgr_release_shareable(struct xe_guc_db_mgr *dbm, unsigned int id,
 				    unsigned int count);
 
-int xe_guc_db_mgr_reserve_id_locked(struct xe_guc_db_mgr *dbm);
-void xe_guc_db_mgr_release_id_locked(struct xe_guc_db_mgr *dbm, unsigned int id);
-
-int xe_guc_db_mgr_reserve_range(struct xe_guc_db_mgr *dbm, unsigned int count, unsigned int spare);
-void xe_guc_db_mgr_release_range(struct xe_guc_db_mgr *dbm, unsigned int start, unsigned int count);
-
 void xe_guc_db_mgr_print(struct xe_guc_db_mgr *dbm, struct drm_printer *p, int indent);
 
 #endif
-- 
2.34.1


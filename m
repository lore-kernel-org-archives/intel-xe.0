Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68339D33981
	for <intel-xe@archiver.kernel.org>; Fri,  5 Dec 2025 16:09:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 256DE10EB5B;
	Fri,  5 Dec 2025 16:09:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KQmzcVay";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE13510EB5B
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Dec 2025 16:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764950994; x=1796486994;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=tFztWWZa8wH1yszmz6ikp8Gnc4y0vh/KLL0rGjNsQqg=;
 b=KQmzcVayV5djKg8Dm7YbDjFV3j/QUAgu3MrlobV9OKF2FRR9TsZd2zgq
 eo/OspBDEDxMk/lPb72Poj2TUw+auRfwmrZ8DIA+dM5kJ2sR/75QvRZKP
 pRuJPhwduELD+VluLH0gqinuiyvr1se+xrvdpvEqE3Xxde5Unqd0oMoWV
 yTiF/vx9W4lSkHdBlXXu2x7ZDfqZCriDgyCKn74que1Zd/wKsrqeVQZSw
 7auDbrDIwmMZvtJVcfKUN+aZUYd0H6/TJNVsgoEuV4SPRLNM47HbBwgvp
 uDmYej4EQo3THb+7y2/TiTBJo8UDeQDV0H0HMUnvwwF94TUmhqMGbSWcJ Q==;
X-CSE-ConnectionGUID: 0cj52mc+TmW3t+5f8cDQdA==
X-CSE-MsgGUID: hO08HOVxT9urhIV5WfCRoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="54533039"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="54533039"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 08:09:54 -0800
X-CSE-ConnectionGUID: eOnk8gFXSp6uhoc+J0Wu0g==
X-CSE-MsgGUID: 9iH6RqPCQSWPX6NJSsTfmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="195771878"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 08:09:54 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 08:09:52 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 5 Dec 2025 08:09:52 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.52) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 08:09:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JnMWDUJdMVNpxXRfdaNQ3aqBxG9CzH41UceTDp5wYV3cDZk0rZ8ibQCLy3nmY7B3Q2WDvzdT1HkqlRCWUpsabyCPQQSnNKSuYFWDTNdWZfrJq8rk7T0qPYbaV0oRMkFQLd/5F6d6owegGlp765CO/ORZu/cOfQdkqQPlLH3GRT2k39doHjfYdQbKP/DWX4IaIq3ay3ILNiOCMGH3ydQu8yhrgj7iZ/CZVMSj4I1e3jV/2PTVIAygOK93HovNZ12QZbiwS9ClyvuXGRhZPULZIMmkrOx55ETEQ/uP2gwEUSthK7/5nDlzdMXX05unWCln92oNuodFh9D6vdBLjViKCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zqYC5wND/Rus20GgMjb6+lj2hVVCNCJtyOgjoYPEX10=;
 b=BLroWC5sOdTffGIce6m4rIpjeWTjgRof3wqKYbeNZnSkPd5PoHnG5qevPqFIAZba6D+fkb8gyDMAqr3zR0zhRGxPKU9pUya8jC9mCnYPoDP+cHFulVGRzUm7Xvqkp0gvA3S2Td0pXXwuRxIZn1CKfw5a3Tjj1FiofCNV59QiXsBSrUUMmlbaQ6oGqszD9OxQ4OvURZ34kAHYulSnVSOiWsyjTiteFtZiop4dzRVMvbcApsVgt3tp/Gc6/LSz6ixuOw96VMF6oLjkpczLW7zphkMargr0dOOMRLEzBqA7vLH7lh2ii7OAKLhe10KzhC7QeM+gsSCYnHZrFqINN09G8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MN2PR11MB4599.namprd11.prod.outlook.com (2603:10b6:208:26d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 16:09:45 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9388.011; Fri, 5 Dec 2025
 16:09:45 +0000
Date: Fri, 5 Dec 2025 08:09:42 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Xin Wang <x.wang@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <shuicheng.lin@intel.com>,
 <alex.zuo@intel.com>, Jani Nikula <jani.nikula@intel.com>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH v6 2/2] drm/xe: expose PAT software config to debugfs
Message-ID: <20251205160942.GR4065316@mdroper-desk1.amr.corp.intel.com>
References: <20251203225355.24972-1-x.wang@intel.com>
 <20251205070220.27859-1-x.wang@intel.com>
 <20251205070220.27859-2-x.wang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251205070220.27859-2-x.wang@intel.com>
X-ClientProxiedBy: BYAPR04CA0009.namprd04.prod.outlook.com
 (2603:10b6:a03:40::22) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MN2PR11MB4599:EE_
X-MS-Office365-Filtering-Correlation-Id: 672116d1-0501-401c-b8bd-08de3418b4e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aXo3QjZOalZWa2w4Z3VPSHEzRkNXUU53b09nVVdoU1BZbW81UXYzSXRVWGpw?=
 =?utf-8?B?bmxUN01DZU9iWE5VRVU3YnEzNFRrM3QwbWFWMjlWTXd3dzBGcEZLd2dMMlVC?=
 =?utf-8?B?SHdMUlR3a2NUWEQ0TjJVU2p3M1hkRDRKL3FabFd0dlYzN2hmMFB6REcweW5K?=
 =?utf-8?B?SkRlMk8zQmlaQTBNcERibDVmQ0xERVoxZzIrbGRUVVhZcXg1LzgyYUZ1Sm5W?=
 =?utf-8?B?b0RXRDlWQ21xUFRKOG9CVWZGMVB1R21SZk83U2liSkR5ODlWWGp2RVdzenBu?=
 =?utf-8?B?elR6cG5zaFB0OWtQMXJja0hocUZKQ0tpMEltUTN4dWlFck40TS9IeXhJaS81?=
 =?utf-8?B?SmJBZE81ZnlEVXA2UzlsQUFiTm1EcTJ4MEZHOExVaXp4UnVDb3BQUFlMOU5L?=
 =?utf-8?B?Uk4yYTJ2SjZaeUlrU3lWVlBRc2UyOWFwMTdOaWswRWg2aWNSeXNzNGpRSkg0?=
 =?utf-8?B?OTE1YzJPT09oNW5Zd0JZbWl5M0hacVNkYW5yTjRsYnQ2QmYzMEVrWDIvbnpM?=
 =?utf-8?B?SSt3WmI3RTcvU29Xb25iMmQ5c2pIWi84WXc0bE1oUmVCK2NTcTFPZUlsQ2gr?=
 =?utf-8?B?dHFEa1FURHVTNk9GUlB2cVpDZkk2REtNNTR5L3NNYVJ1MEdVYXhyeTRDejlB?=
 =?utf-8?B?d2RqN1FQRVQzQ3AzU1hpMDBNaHZVOG9mM0FJS3FicUphZkJmRUh3QU9seDZo?=
 =?utf-8?B?WHdQb2Z0ZVMyRmxmR1VIaHQ3eHFCcE5EZkRJVFV4YTNkUVdzNWMrVXZpRGcy?=
 =?utf-8?B?cTRrYU1uV2RnQ1BGRXpwYTJ2QnlrYmFqZFpmME5HQXJpcUxtN0ZQODkwQTJs?=
 =?utf-8?B?cDdRR3VTMDhzdjNMeGdyY21lQmFkakVVMjZxWktRQ0c0V0NlYXdPdFZrNDBz?=
 =?utf-8?B?Y3I2T004WnRmamE0dU5nVzR4eXI2dTU5SkNJRzdJc04zbzBNaGtPL2F0UE1w?=
 =?utf-8?B?ZHE2QlVseHBoTURDV0dTVkxFdjJ5SkJXNTNqb0pOSWo1WjFrYnh0Rkx6Q3hV?=
 =?utf-8?B?ZG9BR0Z5TTlmNmRnZ0ZnSEtzU2dpaDBmcnUza3VVdU5hVTRnajBJSDdqY1lN?=
 =?utf-8?B?OFRKbUdEbExpYVkwUWtaSU1OUXFNcDZ2WEZtcE5vbG1TemNINUx3TDNaSVBn?=
 =?utf-8?B?SHFiZWk3ZWF2bE1NR1hVTVI0bml1blBCZlkrVW9IYkxzMXhHUzFZNVNIUXpM?=
 =?utf-8?B?eExpUG80bU92djRBR3A3TlRtMWR5TkFqR081YzFnYjJ0dEZQZEtoeE9zWmw0?=
 =?utf-8?B?ZTJDWENQMjRSdXdBUU5vS0ZGajNkUS92bEJ1aGVjaS9hWVNubmtxOFVJVEQw?=
 =?utf-8?B?cTRZRnpXS3BxaHY4K3Zxa0QxWkhlUFZRWTByQmJOUnhMRE9ZeHYyMnVDNXhZ?=
 =?utf-8?B?ZFNJdDRDdGRuNllheFJtL0dLVkV5Ti9VZWN5bU5mS05qYlFWczZvR1hKeXpS?=
 =?utf-8?B?dkFDc095Q0J2Q0RGTFdLUDJ6YnZ4aGJva2FCc1MzdGdCcjJyZXROa2FobnJh?=
 =?utf-8?B?ZU1hSmhFQ0JTRHBTUGc4aXYvem9ZeGlwOXpxWjczZzVVMlJtMko4UFRRTmZi?=
 =?utf-8?B?dEUzRmN5eDliVmluUGtlUFJxeXRUaVhvS1hlRUxuZGQyazd0dkNocWtVSXds?=
 =?utf-8?B?RFpORkhyMno2amJtQ1hqOE1rS3lGUTlEd09DN05jSkxjc0xhOUxDZ25xM1Jl?=
 =?utf-8?B?VVRiMXFyMHZHM2h6czFRcVhJb2J5QjdXVmhrYXg1ZTBKYzhjNTNzdVhFZUJv?=
 =?utf-8?B?UVdaM0lia0dZaW13SGNMZGFMenhwb3FhSm45WjgrRVE4RS9nTUNGQ2srMlpV?=
 =?utf-8?B?c3hGMys2TExpSDdsd0c4SE5JcnJGdkYwU3RacDZaWDhEL2Z6VXczWEdVc1JS?=
 =?utf-8?B?S3FYYXVDb2UyOVZsOGlzbVBDTHVmN1ZmOGROUmdoaXlqazNNMTdGQVI0b1ZS?=
 =?utf-8?Q?YnESy1vRsI0g6zIioMeeDMRxdot31kYT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1hIYUc1Y2FJY1gyVktZT05zL2t0VTJQclp0T2c4Ni9vWFBNWitBYWprZk9T?=
 =?utf-8?B?M055Mld2Q1FrTG4rWkQ5TmpSMFRXRXB2MlBQcVpyWEVHNkQ0QjBudGhodFZI?=
 =?utf-8?B?WWRwRXN4VkZwVlFmOG9rckdmZjRNZTRJYzh5V2hWSGJEQ3VmYXFFZXh3MTJG?=
 =?utf-8?B?ZE1sSkFQSnRlRVd6cHR1TWNSZmtXUUpTZy9IQXpqTS9uVzA2M1Z5cENKaC9P?=
 =?utf-8?B?cUhmSTBRLzc1emRMZ2wrS3M1V1JzWGxhUm5TTEQ5RTVNSnhiUEpTTjVQMmFS?=
 =?utf-8?B?cDg0cWd0cUxveFJVRGZtL0RVT00wK0REUjRHR0ZzMEJROHcwL1J5UTFPbllo?=
 =?utf-8?B?N0U1cjM2KzB1cThlK2tKT3k3T2JaSUlubFc0WTdLY09VYnNvaUJVU1BHZWV4?=
 =?utf-8?B?RnpjOU9Zd2lDUlRYeVRCRUNSc2h2ckZVTmhDdW13M084d2cyaVhLTnRDWmlq?=
 =?utf-8?B?V1ZkWTloenIzU2FuQy82clZRelM0Zjl1OEpMbGVuZGtXNGtvNmhOM0JNRVVW?=
 =?utf-8?B?dmpaT3I4Q20xb2orUGZFK1VQbDgzL0VVYXdwM2Q5ZjlFSUtWZERXVE1tblFN?=
 =?utf-8?B?TjdSL2RyUnR3RHBFU2MzcTVpVnRrQWViUXJnUmVTOFB5R0VKRXFocEdJRWFP?=
 =?utf-8?B?RDd5SEU1bVkveVJWOFFhcWlielJ0bUhHbFl1anN6MFZsNllrVGxIV1ZYTVlV?=
 =?utf-8?B?MTNoeEJPa1VCMm43S1RGRTdJNUtMblUzV2tFaVM5NHpOVURSS3FHNjVBZ1dl?=
 =?utf-8?B?Qndub3JTRTdESW1SRHJwSFhRQmZyalVlWTJPWVRyK2dLMTJHWUNkMkVLdXhK?=
 =?utf-8?B?amhxYWwwTTAxK1dQVWdFNHQ4bmR3REFpVjdxOUs1Mi8vbUR6L1ppRS91NWoy?=
 =?utf-8?B?cVhUL0xLT2VUamR4MHBmeStRZXBjNXc1Vkt4cHdENG11RXpBMnNkakRNemdP?=
 =?utf-8?B?VkdMRGMyZUxmYWVWeWZVNEYxb1NyREw4eTJ3WGcvS0NWMkM1QlQ2K0wxQWcw?=
 =?utf-8?B?NnJ3QmF6N1cxUC9HNFQyN1FSVWZUelRmdHlJanNDY2dqV2l4OVJHZjFJbHFy?=
 =?utf-8?B?TW5kOVVkbC80akRvczZ2dnplbEdOVk9RU2dySEh4dytVdU0rQ2dRdkF6cGg3?=
 =?utf-8?B?Y3hNL1M1Y2QrYVhnZ2pLcHFwTEg1cGpoRFgxTHpxU25kZlprblUrZ2V6WjRX?=
 =?utf-8?B?UE55cXo1TWRmY3NsUGFjL1ErSWpodjJFeWk1bXlCT2pGR0hFak5uZlU5TThL?=
 =?utf-8?B?QW81OEMrV2pHQlc4V3IwRVB5WEc0MEFlRlVRcDBtM0t4bzFoWlRTZEhWR1V4?=
 =?utf-8?B?bVhZMDBqL2ZVK0l5K3IzQk9PVEM4MTdLWlpEZnp4YUllQ1BjTWRubUF4QnV0?=
 =?utf-8?B?bkNUd0RHQmU1NVpzcFRkNDI4UndOVEFpeVhWYWNJUjRUQktsU3FZOERXNXdI?=
 =?utf-8?B?bG40RVdKQ2lkOTNZYnZOWkU3M0ZuNTV1TWpSdDJqejZFajA4T0lnWjV5YWNy?=
 =?utf-8?B?WmpwSkJjd0k1ZGFLci96TEJzV2VsOSs1YzZEK0YrZnNyNU9YYmVmck5ZRXFF?=
 =?utf-8?B?UnYxdENBMTl3SmtWQTNDYm1mc25uamdNZG50a3djV2NRK2hOSzRjdXhJREEy?=
 =?utf-8?B?c1ovMllnNXdqa01ML0E4WjdaemQ2OGorQTdQV25wM1lDRzZrQ0FPY3gvcFdN?=
 =?utf-8?B?dVRBaXhySzdicmY0M2t2ZnZMQVUvVnRLeUwxMnBSUmdqVXlUc0x0VTJIamlG?=
 =?utf-8?B?eHNNSTdVMU12UDdUVEJza3I5Nk05NzB1U1V0WkgwSnk4NGFENTRzc1ROdG5V?=
 =?utf-8?B?Y090WTBuYjdMVDlZeEpGbVpwbWZlQmNCT3VSdUZBeVRzMFhTT0U3bXpibGVn?=
 =?utf-8?B?bXB4MDFwWDdKbml0cDZkV2NxanpEV1pPTnRPOGVTTkxlSXdzdU5xaDFWS3JZ?=
 =?utf-8?B?QUM4YXN6V2R6WlFLVG8zZzh0Skw5dUtoZ3JlQlp0aFpxY0VoSU9uWTQzV2Fw?=
 =?utf-8?B?ZHZKOGtGUVBrK0pJa2tLbkozdkdmOEQzbFlRb3B5YzVWWWVYVSswbFY1cUdV?=
 =?utf-8?B?enY4REdrYjJFenA0QWhWbFJHMGVSVnZhbjZUR3l0bWlvdzd6RmVaZ1lSNHd1?=
 =?utf-8?B?aVUrVlB3cTU0UVZkeTlkOHp3Yk15N2hvaFVTTDdKZnlUdE5oTVVkRlpzSDVs?=
 =?utf-8?B?UWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 672116d1-0501-401c-b8bd-08de3418b4e5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 16:09:45.3953 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZyP5G04lBfH4RbWcbrs5FNUXNilbOJInFcFyUmw3Xy4GfY44SKrsuMD6bqpXoWyuYbTv9/fy1W9ktcqj9Ltug8WAyQxxYxRfbtIRAL4EWi0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4599
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

On Fri, Dec 05, 2025 at 07:02:20AM +0000, Xin Wang wrote:
> The existing "pat" debugfs node dumps the live PAT registers. Under
> SR-IOV the VF cannot touch those registers, so the file vanishes and
> users lose all PAT visibility. Add a VF-safe "pat_sw_config" entry to
> the VF-safe debugfs list. It prints the cached PAT table the driver
> programmed, rather than poking HW, so PF and VF instances present the
> same view.
> 
> This lets IGT and other tools query the PAT configuration without
> carrying platform-specific tables or mirroring kernel logic.
> 
> v2: (Jonathan)
> - Only append "(* = reserved entry)" to the PAT table header on Xe2+
>   platforms where it actually applies.
> - Deduplicate the PTA/ATS mode printing by introducing the small
>   drm_printf_pat_mode() helper macro.
> 
> v3: (Matt)
> - Print IDX[XE_CACHE_NONE_COMPRESSION] on every Xe2+ platform so the
>   dump always reflects the value the driver might use (even if it defaults
>   to 0) and future IP revisions don’t need extra condition tweaks.
> 
> v4:
> - Drop the drm_printf_pat_mode macro and introduce a real helper
>   xe2_pat_entry_dump(). (Jani)
> - Reuse the helper across all PTA/ATS/PAT dumps for xe2+ entries to keep
>   output format identical.
> 
> v5: (Matt)
> - Split the original patch into two: one for refactoring helpers, one for
>   the new debugfs entry.
> 
> CC: Jani Nikula <jani.nikula@intel.com>
> Suggested-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Xin Wang <x.wang@intel.com>
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_debugfs.c |  1 +
>  drivers/gpu/drm/xe/xe_pat.c        | 62 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_pat.h        |  1 +
>  3 files changed, 64 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index 7c3de6539044..e4f38b5150fc 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -209,6 +209,7 @@ static const struct drm_info_list vf_safe_debugfs_list[] = {
>  	{ "default_lrc_vcs", .show = xe_gt_debugfs_show_with_rpm, .data = vcs_default_lrc },
>  	{ "default_lrc_vecs", .show = xe_gt_debugfs_show_with_rpm, .data = vecs_default_lrc },
>  	{ "hwconfig", .show = xe_gt_debugfs_show_with_rpm, .data = hwconfig },
> +	{ "pat_sw_config", .show = xe_gt_debugfs_simple_show, .data = xe_pat_dump_sw_config },
>  };
>  
>  /* everything else should be added here */
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index beff250c7fa0..6f48d34711a6 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -592,3 +592,65 @@ int xe_pat_dump(struct xe_gt *gt, struct drm_printer *p)
>  
>  	return xe->pat.ops->dump(gt, p);
>  }
> +
> +/**
> + * xe_pat_dump_sw_config() - Dump the software-configured GT PAT table into a drm printer.
> + * @gt: the &xe_gt
> + * @p: the &drm_printer
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	char label[PAT_LABEL_LEN];
> +
> +	if (!xe->pat.table || !xe->pat.n_entries)
> +		return -EOPNOTSUPP;
> +
> +	drm_printf(p, "PAT table:%s\n", GRAPHICS_VER(xe) >= 20 ? " (* = reserved entry)" : "");
> +	for (u32 i = 0; i < xe->pat.n_entries; i++) {
> +		u32 pat = xe->pat.table[i].value;
> +
> +		if (GRAPHICS_VERx100(xe) == 3511) {
> +			xe_pat_index_label(label, sizeof(label), i);
> +			xe3p_xpc_pat_entry_dump(p, label, pat, !xe->pat.table[i].valid);
> +		} else if (GRAPHICS_VER(xe) == 30 || GRAPHICS_VER(xe) == 20) {
> +			xe_pat_index_label(label, sizeof(label), i);
> +			xe2_pat_entry_dump(p, label, pat, !xe->pat.table[i].valid);
> +		} else if (xe->info.platform == XE_METEORLAKE) {
> +			xelpg_pat_entry_dump(p, i, pat);
> +		} else if (xe->info.platform == XE_PVC) {
> +			xehpc_pat_entry_dump(p, i, pat);
> +		} else if (xe->info.platform == XE_DG2 || GRAPHICS_VERx100(xe) <= 1210) {
> +			xelp_pat_entry_dump(p, i, pat);
> +		} else {
> +			return -EOPNOTSUPP;
> +		}
> +	}
> +
> +	if (xe->pat.pat_pta) {
> +		u32 pat = xe->pat.pat_pta->value;
> +
> +		drm_printf(p, "Page Table Access:\n");
> +		xe2_pat_entry_dump(p, "PTA_MODE", pat, false);
> +	}
> +
> +	if (xe->pat.pat_ats) {
> +		u32 pat = xe->pat.pat_ats->value;
> +
> +		drm_printf(p, "PCIe ATS/PASID:\n");
> +		xe2_pat_entry_dump(p, "PAT_ATS ", pat, false);
> +	}
> +
> +	drm_printf(p, "Cache Level:\n");
> +	drm_printf(p, "IDX[XE_CACHE_NONE] = %d\n", xe->pat.idx[XE_CACHE_NONE]);
> +	drm_printf(p, "IDX[XE_CACHE_WT] = %d\n", xe->pat.idx[XE_CACHE_WT]);
> +	drm_printf(p, "IDX[XE_CACHE_WB] = %d\n", xe->pat.idx[XE_CACHE_WB]);
> +	if (GRAPHICS_VER(xe) >= 20) {
> +		drm_printf(p, "IDX[XE_CACHE_NONE_COMPRESSION] = %d\n",
> +			   xe->pat.idx[XE_CACHE_NONE_COMPRESSION]);
> +	}
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
> index b8559120989e..5749a488d9a9 100644
> --- a/drivers/gpu/drm/xe/xe_pat.h
> +++ b/drivers/gpu/drm/xe/xe_pat.h
> @@ -49,6 +49,7 @@ void xe_pat_init_early(struct xe_device *xe);
>  void xe_pat_init(struct xe_gt *gt);
>  
>  int xe_pat_dump(struct xe_gt *gt, struct drm_printer *p);
> +int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p);
>  
>  /**
>   * xe_pat_index_get_coh_mode - Extract the coherency mode for the given
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

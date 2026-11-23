Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73C2606A33A
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 09:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ck7ZxsQV;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=DoBr79aI
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A0C710E7A9;
	Mon, 23 Nov 2026 09:46:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFA0910EB64
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 09:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795427191; x=1826963191;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=35euz3jJHP2sHksIxGQlrEcMZFa1Lt89WuABNK0uF+0=;
 b=Ck7ZxsQVcX0ChYBJuvMSZhfv32b8OG06qlb06Af4CsaO83IEqJNtI59N
 UzOA6NKLYkIILmOPJKPlpi5PY9Wc62iO3yn+HFOTRhOTDu2svUotiYJs/
 6jjHjrH/iRruVjf6XEEs3NOoq/sZ6/LJCk/GRIeGLS/vKq1YGLPcjpN97
 ne8hAb94ii1FiA4bHOn48UrQ3iUzFZzgJp8uYm6fful63o+Gjt8cm0Ksq
 Y21S6CvViQ+dfj5SxFmTJPgFv4FgmoKORk50zISmBHxPQejgCIStX3odf
 ZirJ87oKlzpH5B0D+uyshkYCoZmtoy5pvHgksk6jsT8iIfnEZ/xez0Iv4 A==;
X-CSE-ConnectionGUID: RPhQp5ukTgmTMCo6waWilQ==
X-CSE-MsgGUID: t3wChxO6RWSISANUbqN+wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4137895"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4137895"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 01:46:31 -0800
X-CSE-ConnectionGUID: HqDLxwA/RyCvIEKbRzMtoA==
X-CSE-MsgGUID: 3NhrSakzTceuJPGA1oWlZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11271870"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 01:46:30 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 01:46:30 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 01:46:30 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.19) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 01:46:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J/iyvsJm3GIg83U2iKoV0Xa9YwptHBr2mr+9YDEJJdo3b2l4tHyUqFSCdu17d88DRL884xY/gbFoROPFmnqfOzF8JZVCrDooXMtQARQfEUpPzfl8nBLuYbEwlwgYNEvdQnDKUl3T6V0Znm80tsWPz1pdT1LVpvMU1qpFsNGTYysq78+YhHEKN/LGeEdDATtcvPoNOhZRJsvh8C3pfAI8n9wYVY1whs7BCnZeYFTUvBsAMHtfkQ8wNeaiVPVh8iqESb29AMcRrF2lE2JJ8r98UW8D7c8+APN9ZaZyybpZUyU5hC2bhq8ZuuYUqtM82QT9QEM1C0/iwKGHn1cvhJPHdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+zZA3TigS0J+xkJB2IvRn2+CptS1dTL0lYQqcBrMD9A=;
 b=NY44wE/bgjqF2XwioorMC2mBjYgOvl6bfeuxhhxOntR991gLhrcH+nu3oA+KoQofiHEvfU7fshz8UJu4ixcQciwL3vVJooBO41YU87y8kaLm/Umib/FxSXQmNBJwHYf+710LzMP/C1AR6CkdQN/FXGYEwRhuaP4B9xcKCmGOV2EYy4++rDCC1WHKfNX/6orDAtItBQMxWPvMubWENV8vaqALOZcXaIVlryCrKDmREl6cL346nFVveqk/SJRpAqCz98ava1jFhMJGZDd2EGA7X9YwVt2pwCttOGGnmHKXdwW8WN7NPRySMlL+taxz1NbAEZeKIoFVTxr2NiL7R1OvAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+zZA3TigS0J+xkJB2IvRn2+CptS1dTL0lYQqcBrMD9A=;
 b=DoBr79aI5sN6wevj0357ilv+7BBso2U5mPySp7I5JERNawP/0F0hrzYf8IX2lAMeHM2IP9XKHvBRAHc8jotGhYnfzFO4XyDJkqsZpjiT9Enpfo9Zld37DdQ2OY39P9ilTsoZnIsj7hLLgy5E69T61vtUzyw7Lw8RnOyuh6cjSV0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by SJ1PR11MB6084.namprd11.prod.outlook.com (2603:10b6:a03:489::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 09:46:28 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%3]) with mapi id 15.21.0615.012; Mon, 23 Nov 2026
 09:46:28 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v1 2/2] drm/xe/pf: Split VFs enabling into prepare and commit
 steps
Date: Mon, 23 Nov 2026 10:46:07 +0100
Message-Id: <20261123094607.3300722-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123094607.3300722-1-piotr.piorkowski@intel.com>
References: <20261123094607.3300722-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2PR04CA0216.eurprd04.prod.outlook.com
 (2603:10a6:10:2b1::11) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|SJ1PR11MB6084:EE_
X-MS-Office365-Filtering-Correlation-Id: ae014a99-f3ba-47ba-dd7c-08df4946a53d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|22082099003|18002099003|11063799006|56012099006|261026121527099003|261026140227099003|261102123227099003|261028144727099003|261021123027099003|261021121427099003|261022105027099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info: oUwJ0IvkvhztpigsIQE66Skj6zRDieQcS9YjqWG/yQHiNyVeEvnvpXtu+qlqdEL5IHSLyUgm0A7A+Ba2VvtlCW+mQ2KOKSs8LF8BFbH3vqW0zcUnUq9s8XSpID33p8fD7K9qsfVMNyl2k6Qvec2BMp4SmBuNOIDwH3lAYxeymHCZRp5Q9dn1DpIQRXTevao73uHw7WwB0rKy4TjeCEB+k6/0mQJQn6hh2v8fj2ZnXZRS9eWSawgjtV+DmPdqX8sBI+65nkuRkjF8UUm2OxOU6dspr+QjDjITSgbxnMIpIJf8tWvCfD7c0ur6MxvSVdlrPNqabol6/WDxBNhXrgg0bEx7UxswwpUAYbVSHOULW17FW2dZqyXBKOp1qj5EEz7rZmXM2cD9dLCljrtp7WqF0RAjGAYgtAOis6AL5L0wY10npV4zJy9Ph3bQe+V34IIXvKdCqF/iRr9NOd3isfUKN+zWEtF/mHZHRLJsrarxKkpBiQLv6U8Udy3WDvckODtwCdxI0c010IwKtNueu4mUvQy/WgnliG5j5STC7th40IN8dNLjFfp7aIU0P6ExIy1lKu51d+4L7hnY5edeUFJkl/oKNchJrxDMNCCoi3BenCtYwrZJmXUHMG01OgrYS6iuwL33+7eDJCGQt1QTo0+zETfZcPK6FXOvg9K6bdSFcb8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006)(261026121527099003)(261026140227099003)(261102123227099003)(261028144727099003)(261021123027099003)(261021121427099003)(261022105027099003)(261009223027099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFVmUnEzY2pSditTaUY5MFY5SGpCT0srY2RQellpZ25uK0J0YkpRcUJiU0lM?=
 =?utf-8?B?enRyYW5idE5HdTZkcDBWZExUYS9Lc0xBU05MMStLNlozUGE4VnVhRjZuY29L?=
 =?utf-8?B?NUhCdi8yaWNLWmlkTTE3dElyYzBUZkM3VE9HbUI2dFdyRmpoVE5NUXcvREtV?=
 =?utf-8?B?Slc1REJ4Z09CUTU5SkJzNTN0STB3eTZOUXdWWW5pVy9PTjBUU2MyZmxuWG5S?=
 =?utf-8?B?dzRBSWVvb0xtTTdJMlBkNEhQUXd5Vm1WMmF4dHQ2K2hkSWlvWHJhaTF2S0pW?=
 =?utf-8?B?c0VyaFVUNUp2aHJVQ0FJZXNQcXpZemxIa2x4L1U1b2tKblZvZGdjNXB3b1pt?=
 =?utf-8?B?dURGdDQ2dEhndVdqei9Bcy96aE9kS1JlYXAxTHpIVEV2c1RqelgxZm5oU1JC?=
 =?utf-8?B?L0p6d0M0RHRlckREcVhxMGFhNDN5OGdEY2FiQ1Z3NjVxeEJzd1R6dmdWMFFr?=
 =?utf-8?B?UDZqSGF6b3R3R2FlWS8rRTlmdGtLQWlPVWxZNmdmSjRZNm00eXlTRFp2SXhY?=
 =?utf-8?B?NzlQVllvdlFRT2I4ZWk3UWJmekZYWXdVTHdQV1BaQ1VKYTE2NVBlNit5bWFJ?=
 =?utf-8?B?R2xQcElZa2c2UFFoTmNobE1CaTZkcnNubm13ckxnUVVqY292UHZLalR6bnZr?=
 =?utf-8?B?dlppVkxjRGpwR0JhWlpaZTR2Z2RINkIrWGlOeitSR0hoTHdHQitNdWxSVUlI?=
 =?utf-8?B?Y1VGaGVmMWRseU9wOTlvVXBGbGZGdGVaTlFCaUpvMU1FRWxIaXZ0Mm5DaXdF?=
 =?utf-8?B?NVpURnZFL25iNWU3bEE5b1JSZVVRWDlOY01LcTdKRmg4eUQ2WWo5R0dwbmlT?=
 =?utf-8?B?OGQ4d1VXMktyc0FLdGJYM0k5VHgyYzN3WERWS2hiMVJXdGMzWk1CRTJXTGFn?=
 =?utf-8?B?YmRUM0hTekMvdXRPZXh1M0g1QVNRNVNhbDRjcG5jQWpNSWxNbzZNUmdMZkFn?=
 =?utf-8?B?cDA0OU5jRWRxVFdNc3BTZ2orQisxWnBCUmVHT3JnK0xJUC9kWmUwaERCWDdH?=
 =?utf-8?B?RDF6dFdEM0VQVDdYVWsyYjIvNFMzZkdtam5MbGFGZzNVTE5LR2hqK0I4SzJL?=
 =?utf-8?B?bUhaM1pocWg0SDZCcS94NTFaZHlGQnJmV3E0cmtSL0FROFd6ZS9ZK0NjT3JE?=
 =?utf-8?B?amtCQTVOVHRwN1FMYXlZUXMycDhIOFJOK291WVpzd0V0U1BycFpKNjJocHRs?=
 =?utf-8?B?bWpvazJ2ak9haWo5bDdhSE5kMEJwYm1zVkdjbG5wM01YbkdWSlFwR1JsTlVB?=
 =?utf-8?B?R0tIUDhPK2NiS2FoNWFFRmVsZEI3SUd6clZnRzVxMnpLQ1M2aFlnalAvQTZL?=
 =?utf-8?B?MXJJNEVtVUlYcTljNG5EVkZHaTZQaXhVbHRic3JrYmlHNVJ0Z0h1c2dRYjEw?=
 =?utf-8?B?cE9lMEd0VTluekEvL0FaNC8wd3VmdWRxUFUwSlZFeCtia3dNN0k4REQxc1VO?=
 =?utf-8?B?SHR0UTBKekROb01Fa1lsZkRGelVRY1RpZlZVNk5lUXR4akpLTFZNdkdKenlp?=
 =?utf-8?B?eXR0UFJ6UUFPY0RhL1NFeVIwSzB6OVBmM3M0eDFkaWRQcklqWEEvYkgwbUNB?=
 =?utf-8?B?aVlQS1VGR0toSTZhT1BPckVQcUxGMFltakVNOVJzU3ZsMmVCL1NRNTJhM3Fw?=
 =?utf-8?B?TjF3K1BXSE5URUQ4OUtsOGxKdkU3Uk45b3U3RE80cXU4TUFTTzFWQ1JxSUh1?=
 =?utf-8?B?RWU3SzZJb2I5Z0REcmtZaDcwRDBidkxFYVVBVzJHVEpXUkdrYzZWelNpMGcw?=
 =?utf-8?B?QWhpZy9zY0VkYXJFTFM1cVR1OTVOa1NuVWlvdy9vbE04MDZza2N4UmRlOFQ2?=
 =?utf-8?B?ZTMxWkFBL3JDM0JYNUhqc1paR1hiMXRoREJBbXA3U3BnQi8rRldOZlhFQk1z?=
 =?utf-8?B?M0kybFp6SloxZFRPUEp1YU9qZ3UyVlVnZ3p5bUFRVWFINGc1OWNkNVYvNmx3?=
 =?utf-8?B?U3FMS28wZlNXSUE4Q1c4UDV1Mm1STHo0MmxlUEh5Z0IwUCtTREVWTDNsbFhh?=
 =?utf-8?B?SWNFY0gzK2lqd3ZtVWRFbmVWL1dBNXNyWTJVNkdkRmN5YzdoK3B4UmIxdXVE?=
 =?utf-8?B?T3ljTHJFWWlVMjlEWDdoTXJaZTNkUElGbFZObzV5NStPVE92cDJTZnRKVmNC?=
 =?utf-8?B?QXQrajMzcWRLbDB3VGRUM3RJTVkxeVppaUMxTUN5anZLZGFSeXZFQjFWdHYv?=
 =?utf-8?B?TWptcnoxUU54Y2duSGhzdkd6Zkp2S0Z4N2RrL3N6ODFJa2dvL2VneGNlZGFD?=
 =?utf-8?B?QXV2Z3FCSGdZWmtRMzR3b2U5L2RCNnZHMHRHNTZpVllLSjVPUUthTURPdEhX?=
 =?utf-8?B?NDZra3REc0E5b1VibFNuOUNPM1lkelVGME1JbnBlcVFiS0o2N1hlU0VzMUk1?=
 =?utf-8?Q?uTCV/vVHtVtc8qyY=3D?=
X-Exchange-RoutingPolicyChecked: nQwPz664j2uvXNFXFRtkf6VGyFuWbZ8DIK1Y3SqE6quZMDHQL7ra9Eae94QwsNJBgC/S2uTfR3dt4c/VWipr57YL9lo0c5OcdyK8biF4FRMJ39M5AJhEyQwPnIFa3Zo5BwhdIFi4PxL0H1PwhTJQwn03EjHRznsuzFYCENXzocWPpIyM9ZvcEeKvKmeqt16G48n19iwMLm5R3sfiLDrCXJLoUJUCBj41GBLwt6Bu1w25dumvw4SOpQ1SXolLyvl7V8IUoHuBKvbAVIFnSKQcIbKl0/ginvMUBq2PrKgggtFJkuDE1W9gzpsCIV/gwLMlIqLu763hZxN7wZq+Q0Ou2g==
X-MS-Exchange-CrossTenant-Network-Message-Id: ae014a99-f3ba-47ba-dd7c-08df4946a53d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 09:46:27.9768 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9TfbsvdbnTlZXgjqqVwHktuQkA/qcAHZVYa0ht2IVtHodzFH2lPZ/7FLhIzXZD4rcASRKnG4ib9mHFk2YW4RxeUb/Dg96wtPeTh+ozOvJBQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6084
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Michal Wajdeczko <michal.wajdeczko@intel.com>

Split the pf_enable_vfs() into separate steps: prepare, which waits
for the PF readiness and takes the extra runtime PM reference, and
commit, which resizes VF VRAM BAR and actually enables the VFs.
The VFs provisioning is now done between those two steps.

This is a preparation for the upcoming VGPU profiles support, where
we will want to use a different provisioning step while keeping the
same prepare and commit steps.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_pci_sriov.c | 91 ++++++++++++++++++++-----------
 1 file changed, 58 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
index 6c839eff0db8..e91e75d64174 100644
--- a/drivers/gpu/drm/xe/xe_pci_sriov.c
+++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
@@ -125,36 +125,17 @@ static void pf_finish_vfs_enabling(struct xe_device *xe)
 	xe_sriov_pf_disarm_guard(xe, &xe->sriov.pf.guard_vfs_enabling, false, NULL);
 }
 
-static void pf_enable_vfs_revert(struct xe_device *xe, int num_vfs)
+static int pf_enable_vfs_prepare(struct xe_device *xe)
 {
-	pf_resize_vf_vram_bar(xe, xe->sriov.pf.device_total_vfs);
-
-	xe_sriov_pf_unprovision_vfs(xe, num_vfs);
-
-	/* Release additional PM reference obtained in pf_enable_vfs() */
-	xe_pm_runtime_put(xe);
-
-	pf_finish_vfs_enabling(xe);
-}
-
-static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
-{
-	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
-	int total_vfs = xe_sriov_pf_get_totalvfs(xe);
 	int err;
 
-	xe_assert(xe, IS_SRIOV_PF(xe));
-	xe_assert(xe, num_vfs > 0);
-	xe_assert(xe, num_vfs <= total_vfs);
-	xe_sriov_dbg(xe, "enabling %u VF%s\n", num_vfs, str_plural(num_vfs));
-
 	err = xe_sriov_pf_wait_ready(xe);
 	if (err)
-		goto out;
+		return err;
 
 	err = pf_prepare_vfs_enabling(xe);
 	if (err)
-		goto out;
+		return err;
 
 	/*
 	 * We must hold additional reference to the runtime PM to keep PF in D0
@@ -167,33 +148,77 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 	 */
 	xe_pm_runtime_get_noresume(xe);
 
-	err = xe_sriov_pf_provision_vfs(xe, num_vfs);
-	if (err < 0)
-		goto failed;
+	return 0;
+}
+
+static void pf_enable_vfs_revert(struct xe_device *xe, int num_vfs)
+{
+	pf_resize_vf_vram_bar(xe, xe->sriov.pf.device_total_vfs);
+
+	xe_sriov_pf_unprovision_vfs(xe, num_vfs);
+
+	/* Release additional PM reference obtained in pf_enable_vfs_prepare() */
+	xe_pm_runtime_put(xe);
+
+	pf_finish_vfs_enabling(xe);
+}
+
+static int pf_enable_vfs_commit(struct xe_device *xe, int num_vfs)
+{
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	int err;
+
+	xe_assert(xe, IS_SRIOV_PF(xe));
+	xe_assert(xe, num_vfs > 0);
+	xe_assert(xe, num_vfs <= xe_sriov_pf_get_totalvfs(xe));
 
 	pf_resize_vf_vram_bar(xe, num_vfs);
 
 	err = pci_enable_sriov(pdev, num_vfs);
 	if (err < 0)
-		goto failed;
+		return err;
 
 	pf_link_vfs(xe, num_vfs);
 
-	xe_sriov_info(xe, "Enabled %u of %u VF%s\n",
-		      num_vfs, total_vfs, str_plural(total_vfs));
-
 	xe_sriov_pf_sysfs_link_vfs(xe, num_vfs);
 
 	pf_engine_activity_stats(xe, num_vfs, true);
 
 	return num_vfs;
+}
 
-failed:
+static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
+{
+	int total_vfs = xe_sriov_pf_get_totalvfs(xe);
+	int ret;
+
+	xe_assert(xe, IS_SRIOV_PF(xe));
+	xe_assert(xe, num_vfs > 0);
+	xe_assert(xe, num_vfs <= total_vfs);
+	xe_sriov_dbg(xe, "enabling %u VF%s\n", num_vfs, str_plural(num_vfs));
+
+	ret = pf_enable_vfs_prepare(xe);
+	if (ret < 0)
+		goto failed;
+
+	ret = xe_sriov_pf_provision_vfs(xe, num_vfs);
+	if (ret < 0)
+		goto revert;
+
+	ret = pf_enable_vfs_commit(xe, num_vfs);
+	if (ret < 0)
+		goto revert;
+
+	xe_sriov_info(xe, "Enabled %u of %u VF%s\n",
+		      num_vfs, total_vfs, str_plural(total_vfs));
+	return num_vfs;
+
+revert:
 	pf_enable_vfs_revert(xe, num_vfs);
-out:
+failed:
 	xe_sriov_notice(xe, "Failed to enable %u VF%s (%pe)\n",
-			num_vfs, str_plural(num_vfs), ERR_PTR(err));
-	return err;
+			num_vfs, str_plural(num_vfs), ERR_PTR(ret));
+	return ret;
 }
 
 static int pf_disable_vfs(struct xe_device *xe)
-- 
2.34.1


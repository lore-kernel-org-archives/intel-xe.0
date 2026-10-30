Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC3D606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 07:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Thd+Yg96
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6FB3112673;
	Fri, 30 Oct 2026 07:33:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB6BA112673
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Oct 2026 07:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793345575; x=1824881575;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=wc8pTmUALRvSxMxRZ6DFfUd/drME9axOswI530GzysE=;
 b=Thd+Yg96PArxyMpfdlw5mXJzG5jqdSdgw9+KXNQiy3OBLhOmHToRysM/
 oZO045gMyh/p3ouyJ3SYjyAk6668MrUo/6pcujEh4YLSjdWADIXquUvpx
 LpRn9IiT5NdYZ1xEjIvwJM6foQmhDf9umdfGrLvUlG/pTT3jRJU6TuDv1
 d9MrSR5gxNODBOk2gmzxhERc8pZVM6fwDNIEaUbNbRPZTDXIQ0+3xIDA6
 ssQO+TisAu8bPq6+3+eLdQr8ffF/AslcYcZgWL5f66PdRUcq081a2j+Gs
 AGQZRmDQfw4isIggNZob35ExI/l17L9/TgPAp6bOg7+Adlzq7E+ld0/Ny w==;
X-CSE-ConnectionGUID: NR4BYoPQTyGyz6cuyPl8ag==
X-CSE-MsgGUID: JnJXPdhqRvanmwV0IQUCMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="1994748"
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="1994748"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 00:32:55 -0700
X-CSE-ConnectionGUID: cYtPvu5jTbeuzaswjdfMPw==
X-CSE-MsgGUID: o5xCEoaPR7qbuo53KG/dHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="7183586"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 00:32:55 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 00:32:54 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 30 Oct 2026 00:32:54 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.31) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 00:32:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vZmUIo82FMDFk1T86pkWSptdtGfF1BUSmQbXqF8EtZVPra1OWnODDf3QmEEzNizFss8gEllEO26CVQaGWzAEng38mw2bQpnZjZsf2sY5BnQcFkTNih/rEJ1EiiH6ph/I8Yco8mIcY06pkKhmlYc56r24LUBAQyy7dvzGlxg8CAuV2elEhC2muCxQ98RfddfFA25S5Sm+YDmdkuHv7qv/EeHi0w8vASjTm4IuUMeGvvhRDuY2eIRQ4peOdBjdXQtCJGJNAr6wQqFMRrLrepNzL+18x32bDUIFOUj4y0NwwlakmW+Lg5VjOLWOoPXWE9PPoCbPkRiVhkDy/falJDJPEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VG+oQrP3euJFXJWgCNix/LtOp2w28bJpfHStDt0oqL8=;
 b=Qbkph163pPP/rEv0T0nrQuxO0L52zMnzgvL4sZ2y2oetuRmBNMAau9G/7Nw1GhyhR4buxox28nbE4Haq0SI+wyHZu3Xr4V28+AiWzXmNwUmlzOlStQenz7QFR9eT+J4aI7637zxGA/OxSns9mh9h3N6HhShOLku80ZFYxWtiXrIJliiMNXqPRz0oq/AyOnQueCj0Acn7iLSAHg+HDfeItXby7QATiyLdpDyqj10fO0IphjDgMJwojLRheHM6SLjrivuXlb03Tqb38+A/oDlIEHkt9/OWNZLC10LU6UwsZo5ivgMCDZsWB/NwBVFE8/EBQvHkVd1v7yo+SPHZxfmEGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by CO1PR11MB4913.namprd11.prod.outlook.com (2603:10b6:303:9f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 07:32:46 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 07:32:46 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
Subject: [PATCH v1] drm/xe/vf: Move H2G CTB to VRAM on VF
Date: Fri, 30 Oct 2026 08:32:35 +0100
Message-ID: <20261030073235.1419433-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0006.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::18) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|CO1PR11MB4913:EE_
X-MS-Office365-Filtering-Correlation-Id: d53cdd3d-eb91-4036-fd21-08df3657fdd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|10067099003|5023799004|11063799006|56012099006|261009223027099003|261026140227099003|261028144727099003|261021135927099003|261022105027099003|261021121427099003|18002099003;
X-Microsoft-Antispam-Message-Info: Xuo2VJ5QJHOO03Gd/lj5iwLSD8/U5kOTtYsZ+HCCI0f2yMpQp52BaoC+cpGZh8jDkCx6yIv099YSJMRASkKatw3gjzpYEiFWqvLHmvrzmf76QrjLWRdWdMHCpSMgHdn8eKaqxRtHrC7H9/rVKtqp/w58QGOy2IaoORtiz7BE2X0SOcglLh5rS71a92KCOn7sM6u6lcF0bDj4O96qqLu13MB7iFMjjg/hUc6NmcxoH+6UBJtqTvehgnXoP9mV7SshZKnmTIcdlgndIzXIYkrQ/QwCFTKD7RyvJxWswp4Ejxaoj2+vM/sDJsi0ZFnvYaXTitN7HkGBOntTKqk7+D5H9LfTbdeF+ejQh3iGT7gEszzaOYbEH48g9F9eVLdNCLW+ZU8Y7AWSuqmySPpIYsjKC0QjyqYZP2Sddx0xDk2qIVsGCgmnlMSmfxach3wCjCI3EGkh4R3GBuVbT96kJnc1q2BqPJra9yi6Y5v+wE7oNybiee9qBeRk8UzXTXw9ETr8+8LKRb1yGSuK6+6QXaWAcbmbNljzKw278Y0q6XTRXcX5XgoAfLOIscxVVeETUiiB16oIMSgTByKsaAo9cZMI/KEWCHUdoQeW+C+dw7oFHsdQoRBz1Vkvt9S68dtVcW4DjahdnFEAdhXJrpUmW7LtKGbbEP71JKGZxyP9H1vucYM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(5023799004)(11063799006)(56012099006)(261009223027099003)(261026140227099003)(261028144727099003)(261021135927099003)(261022105027099003)(261021121427099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlFqNkQvSGZPTXZCMnZqQm5rWTc4M3hJQnZ2RTNVYXpUTS9NMnhaZnlNaXBt?=
 =?utf-8?B?aVkwY05WQk9XZ1pid0IrMDdwSlArK25wc3FRcEIvV3l2emw5SXIyMGc4K1FV?=
 =?utf-8?B?SnVxVG5lWEQrRHE1SHM3UVlEalFvNEcwNVI5ZmlQMFZoWUhXdlZLQ1hnNitE?=
 =?utf-8?B?b1RmQlljTWUyUWZ5Zjh6aVhHRHQxVlA0MDZIUXVNU1NmN05aeThmeHQ5REhK?=
 =?utf-8?B?RjRXalRINnFmRTZjNnVXL2FkZUFOdGZid1NIbmhKTS9UWTRZem5NME5FU0FD?=
 =?utf-8?B?ZjFTR01PMFZtTjZ5MDNSYmg1MGdsbVNQbTVzTGF5SW0yNjNSWlU5N1Y1V3Ay?=
 =?utf-8?B?UG1CVWVuNHMrUitkQjE4QWhSSVNJaUQvemVMalpMZ3IrWU9MdVkxZWkrdTBE?=
 =?utf-8?B?Sm1DSlBlcnZ1eG5sTE1PMVNoNTVBekpURTNFUTFJejgrZWxiYUdraUJNbHBF?=
 =?utf-8?B?N0RpdGNUSkUzUnVzSDZOSTVoY2FSaUZwVUIvdHQ2MVNOWkZqZ0NPRVQ1RjJ3?=
 =?utf-8?B?NVhZZ0RYV1NKSDM4YnE0V2Z0QVZ1TUFiQVpTRThxWVNXSGdaaXRzeTRpa3Mz?=
 =?utf-8?B?Tnl2L2RxbzhwaWVzcU5SV3AxemcwcnhyeGUzc1ZOQnlJbng0L1RleVpGUzMv?=
 =?utf-8?B?aWJCY0FUb1NvalhVUTZvbnM0SkFGY2thRDlydTNwY2tGQWgwWlN4WVkySngw?=
 =?utf-8?B?dWdJdDMvZGZLWjNBWGhJbXdMWE1IMmU1dzI2TmhVMGlPQWpLN0FRTG5yZWFR?=
 =?utf-8?B?a2VSZWtndlhFRnM4WWc1Y3pTd0hnREpTcVJsTkNyRjJvKzUydmxKbG1PdFJZ?=
 =?utf-8?B?dXZ5YmtoMUlrbHYzNnlrMS9FeTdENklyV3NuVFcvM0h5THlwbXN0RlhkNThr?=
 =?utf-8?B?N0haR1RLUmM3TCtZbGNlTEJ3aFJCbnc4bjYrY1MyTnV1WlhSM3NrUVlSMURw?=
 =?utf-8?B?N1lzcGN2YnNaK21zcUljb3Q0bTlLeVdldElqVmJITVdITUJQb0RnZDZZbmRT?=
 =?utf-8?B?VzNHNEowV1hBa1ozQnlwQmF3bk1RVjduK3VZK3JuSm5pMm1MZzBKQUJ3bDhz?=
 =?utf-8?B?OHN3ZXNkZlhrNVdOKzU1TFhQK1dJM3BsOWE4SVBJWEFwQjJUR2hUNzJnRi9R?=
 =?utf-8?B?M1RFWTFoNkdDcVlFcXRXKzFjUnFPMnJGM21tYlJoU0hHbjgwa2JSeVZzMFE1?=
 =?utf-8?B?MjhhQmF2Kzl2SnNROTh5M1J0cExWMk9wNE5paUJPNWVOL0lKSEVPemp3TGc3?=
 =?utf-8?B?MXNQOW5vaHdPMWNqRWI4VUJQUExPemJSSHpGTnVGWG1lUENDVkhCMUs4NW5N?=
 =?utf-8?B?NW5icjZyMjVOamhZTDVpUmVsUnp4djVrcmFHZmRNVnZ5aDlSZUk5dHdSWlRO?=
 =?utf-8?B?OWtmRCtCb043T3lmem5GTGp5R3dsUVhGTDF5VzNGbnpUWHRFdWxiY2tyOGxt?=
 =?utf-8?B?VlpBQVhPMERhOWVkSnYwWkhtT3FZRzZLTXd0NVVMaE5iVVBHNVVxb1EvNEJV?=
 =?utf-8?B?RElLckY4bmJ3c3ZyTUxnRmxDbTZLSTVjSG95V2Nmb09pdlVmWHhjRmw2STBL?=
 =?utf-8?B?VHkyM2xBbnR5Z0RwVE02SEFOZk9tOEVKbU9GRGdRYzM4cFBkWFRySHZNbnFw?=
 =?utf-8?B?OVBvSnYzNWNtZmlEVTJ0WTJic0UyNVhBV2h1Y1hycEs5WEw0WTlpbEVPODhr?=
 =?utf-8?B?UDdKWENiMjFYZU5XSzZ2VzBkdGlHUUFKWDZLK1Q0bDRrZXZ1VmRIMjVEdjly?=
 =?utf-8?B?Ri82MEdZMWd5RitKQ2tTWmhsZEdkMkdEaGhZRW9wZDdvektMRnNsTFZZeDI3?=
 =?utf-8?B?S2t3cEpsTkZtbmxuOTVTVWxTemJ2QUdOWXpzZG9FcEFocXlmVnRGc21tekt4?=
 =?utf-8?B?UXoxSzNsNm1iV0gxZ2ZIZlI5TDZPRWhrbkkxbmlRS1FqajREdzhkTExCd01V?=
 =?utf-8?B?cDZWbWp5VUZkZDl6NGIyRmNxVWo2TVh0WFE4TXlRbFZTc2NkUjR1QkttTTBX?=
 =?utf-8?B?SE9HTUZXRHhwLzR3RmtBMVFINTRvcWdwTzZCNFRWVUlPb0FQTmtnSUJ3NG9R?=
 =?utf-8?B?NHJDYlBSdzNLaDJuWmxwNmIxN3A3bXlJUmxFVTZNVWFkdE8rQXhoZGVxM3JP?=
 =?utf-8?B?c0RzWlJ4aXhGQit0aG5yUjY0QXUyaVF4RytxTjEvOVhnbXZmVDVHZVZ2Yjcx?=
 =?utf-8?B?ckVjNGdkWjJLekE4MHhnUHdvVDdCQXJMd1prbnZuS0Q0RWl5ZnpuUUhWN3Zw?=
 =?utf-8?B?NUhnTW9ISHZYZU9BUGJBUWEyT3o3UURkQjdHcHRSVUxYbnlxNGpqNWxvVmts?=
 =?utf-8?B?UEpMd3lONmFscEdUdE0yQW5tVmV4WHBxK3d3Q1JrZHFCc0VIc3NBNVhseDZt?=
 =?utf-8?Q?JDrb4Ta6S8QuugSI=3D?=
X-Exchange-RoutingPolicyChecked: WhPGVf88AY/B6y89+5OzGj+LIRiLsE2Gw5BqeRpxYEOctgc/wynsYvUHXta2RsgQT0iLFtjSM2pX6QJP/lNw093aas7GtRw4MvvHanhEtueaVEqCykWzezCL0bteILYmC5HzK0GIQz+G9Aws63u1/+4tPToOWf5rkWQDPt6G+loVrXAxupiQYMIZVWhYfYAgklr11/cFDKhUZyTOCjvAj4CwMR1bp97AlTvClA8ryTEgw6fb4Aqa3eUPYhV0/53/ZpaUrGorGPoP93IpMliZ6I7jbh92N0GnvMs3JVMVxFVxDFsQOvqWjdJ2ntc6Dqk7/tuwLxpBL+uBxWvEuTiGNg==
X-MS-Exchange-CrossTenant-Network-Message-Id: d53cdd3d-eb91-4036-fd21-08df3657fdd1
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 07:32:45.9482 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TNtDcrU7cNE3+zz1anqMTwhAPZv0zwusLzgxJydD+cq0DmxI0Nt0Rved1KF/9jUG711tsUTXnr/X/zv+ZtYDAXbG47JjjeY4qsur1mdlNmU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4913
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

On DGFX, the PF reallocates the H2G CTB into VRAM once VRAM becomes
available, as it is written by the CPU and read by the GuC, while the
G2H CTB stays in system memory. The VF never takes this path, since
xe_guc_init_post_hwconfig() returns early for VF, before calling
xe_guc_ct_init_post_hwconfig(). This early return was meant to skip
the PF-only GuC firmware, log and ADS reallocations, and the CTB was
skipped only because it used to be reallocated together with them.

Nothing prevents the VF from placing its H2G CTB in VRAM. VRAM is
already initialized at this point, the CT is disabled by the preceding
uC sanitize and the buffer is registered again with the GuC when
communication is re-enabled in vf_uc_load_hw().

Lets call xe_guc_ct_init_post_hwconfig() from vf_guc_init_post_hwconfig()
to use the same CTB placement on VF as on PF.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index b1f4e132fa0c..53893e9e3374 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -853,6 +853,10 @@ static int vf_guc_init_post_hwconfig(struct xe_guc *guc)
 {
 	int err;
 
+	err = xe_guc_ct_init_post_hwconfig(&guc->ct);
+	if (err)
+		return err;
+
 	err = xe_guc_submit_init(guc);
 	if (err)
 		return err;
-- 
2.34.1


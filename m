Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA35606A324
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 10:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jSfeQDQZ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 872D810EDCA;
	Mon, 26 Oct 2026 10:42:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A09A910EDCA
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Oct 2026 10:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793011361; x=1824547361;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=LEsS0FkenzB7gvcdGuxbMkeRvgADdTOMffzs7Dpu+sM=;
 b=jSfeQDQZTSKeVCQx/kstSaeCL7Cgy4YBanAbZqVkEtZprEiz7eOXtwgW
 KzuM0TNhuaJSVinlq12t1Ktte8dQBdut9pCPZXjcf48HK7TG+bk4zwv+t
 +087JYI+aTEeRDpwlzoHr9XXd+8U4uxtjJdjGDRGmEIi0S9dt8x4eH6t5
 phLLp7gRCnXiNi2kWUq5lR53Lq/uiJoxUD28UO1A/RPFPd9p3+j1nfyeE
 IzLjPDcCvOqRRyIyu4gCBw93Q/Vy0YmqIc/Z7qjpUVTbvyd81XdkxTBIY
 CFW7wc6Rm5IGKv6PgDHm3RCuj9T4N/PsDpXpIoH3nvp7ltFun0tDWB5Gq g==;
X-CSE-ConnectionGUID: VuN7ZDHIREqUqzblq7z2pQ==
X-CSE-MsgGUID: 9S/sCTkpTj6gLm0STZSpig==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1701270"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1701270"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 03:42:40 -0700
X-CSE-ConnectionGUID: XIqVvjnSSVC9F+eOYPPcMQ==
X-CSE-MsgGUID: 9BhWpfYXSDiXP4CnTRh1QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4179732"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 03:42:40 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 03:42:39 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 26 Oct 2026 03:42:39 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.33) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 03:42:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c886yT2slAqXpEDWpM+P/P49TwU5sumEZdGd55mQrU4llFs8enXCLbc9SwxfEfVrg5B5a5LeUvgMheX5p85KhT/CkJhfoPvtMvQQlavpu+lMbVwjpjGI4a+1hrz7sC0tiFeezY6hC+WpogeWeAsxG4EgDljWP4mR8CxMn4r/Bf/F87aWgIixhvW8fPI9gIqTQgmMDS6EWvjcILTiUokZuhm4f3aWCeTu7fdlptJiXBsuBMFxw2QXaJnjtjnJNMugaFqJDT5O6y1nOoD5piA9i9TydSli21BcnMyjMXdY/kN/pjUBc8ZbRuSc8ZYHKclLmz05MQAt8gwGVT8dq6mOPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NkfjvOSove1hajBlEf+aSISZQj6kWOEX8+euVxwdJsc=;
 b=ZEyAsoc/RGdGnWNDxzwRp2W68y2JKRi/2fapNpmAMoKyMw+ZZgfpV/FJzLQNd4aOBLvwOpGOFFBbBI2LPCKMew7JIKhCNfKoM2a7fFf5+KD0Xcfk5VssZ9Wcc9HFQPlwAptSztY7Nq9XIXQOMRBjrrsacCc9o8qoxJtdtFPbeqct6iqWjHDi7wJVpLo4wjucPRZJCLYg4B589sFeWv+ZkAO2WsAczKRQx9drMafORjRiRqTG8zZqJjj1j/HnrPTEQiCZ8+McxDDYfuUQBJKRllsHIeS50iw5sT7iYudoIPSL+4fCe+bn9x3kOu37BVW5Jz3s0jvHMKbWPGm2fXNcew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by DM4PR11MB8225.namprd11.prod.outlook.com (2603:10b6:8:188::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 10:42:32 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 10:42:32 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v1 0/4] Split GuC doorbells manager into usable and shareable
 pools
Date: Mon, 26 Oct 2026 11:42:20 +0100
Message-ID: <20261026104224.1018993-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL2P290CA0024.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:3::8)
 To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|DM4PR11MB8225:EE_
X-MS-Office365-Filtering-Correlation-Id: a71ceefa-d472-448e-0f67-08df334dd70a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|11063799006|56012099006|261009223027099003|261022105027099003|261021121427099003|261022075727099003|261021123027099003|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: y5SpRud+YL5x+RRr/ceOxi/r6YCQ0Ze9KKPlCMae1l/F0k0R/zgzirhyNvWy4I4VHGAtma8vtu3cRZTMa/XOnqlPVXnmBFAwoE+5mtXOJGvj4g+D19dSkFVJ0wWPzOPfc4V6NFa9NCJ7TH41tC/qQY1+XR2MEpwctexaTVanYlGZKCMLFbrwgPD0CdtmsKHi4jobwDwWgucbYLYP6mVxLFz+iuX6tnPyAApTNANhjHpXlEl8o+ad6b1NdMaa0U7/HQAyL7a1WCXHlFx0YpuZNjp8DFB0BgAo6upRNziuKoQBXpVp4f4O6EebXak2co2zcLjiRhXTBrHMBDp37SJdneoHFchseiZ4Owgi6WB2qWTF2oGQnbS8LtBtjcVfg3XSyR7yRcp6rAnMPmmDhCznYX6wMsH9BlsqXouAwrX0Vn2TxCc+iXTXgkIhibe5xoVyZCq1oIyCElQx/imjlaVDIIb5S8SiSxeBScSZlhSMGDABOXWvefoxPb4JnnaA8zZe7U787cJ1uREs/wZd1hjBogKYHiFhJPylksQqExKTwbU4EiFcibZPySeEvghPAkiaA2ldVVTj8dlANZD3k0wo9AbOwyh+fclcnlOm5hHfBHpqiIqRx7ywKpoDgjLsDpAuIHV6HacjPpyyjGRuW2wzECHn3LB7g494zow2YddcuTE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(11063799006)(56012099006)(261009223027099003)(261022105027099003)(261021121427099003)(261022075727099003)(261021123027099003)(10067099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUVzcklVR1piK2w4YjZJaXlzM3AyTTZmeVpnN1pzQ01Odjk1bDBhTnBsTDlD?=
 =?utf-8?B?WnQyV0ZENFBNL0p2VlhsU3VHT3BmTXdEdTB1cHd1bnFtREZyalZCT0owY1o1?=
 =?utf-8?B?RC9rNmFyVEJkRW51Qzl3R1QwZHFQaVIzV1d6R0ptTEtXMDROQzlGZURsRHln?=
 =?utf-8?B?Ni9zQzZwM0gxbXhFb2N2MkdvZFg3aXZjL1NTcWZST2U0L0JPK25CQTF4Zlgr?=
 =?utf-8?B?eEdycWF5NHlYZitHdVJvMjl4Q2JoRjlwd3dXV2dkWkZNTm9XMFRFRlB5aTNW?=
 =?utf-8?B?WjNTN2xqVnQya1BIREJ5N2NrT1dnUFVTRFpuc09vazNvWHFpTjdaUlluajMw?=
 =?utf-8?B?eFp1NUt3UU9uOUNqM2ZLUnJET0hqUVUrT2ErUXUwNm9TakVDMGhQVDFXaEd2?=
 =?utf-8?B?STNOTlJDZHBYdWhERnpOLzd3U2p3Q3BCQlZJRFRTdGRzZkl5TXl4RzhBNWl5?=
 =?utf-8?B?dGdaUWtwY0JJS1hnOWZwa0k1ZHFiMldzemx2RXhLQWNmUFZTZm5NdVR6czJ2?=
 =?utf-8?B?Y0xOQURUQjZnbDFibWI2cm1qaTJpRDExZmZxanpLd3FpNVVSWXplRG9GN0ZH?=
 =?utf-8?B?THdHdS9wL0pzRkpqa2xaUUVQRnNVUjljVjVSQ1BaMXR5K2JjMEViT3RiaTR3?=
 =?utf-8?B?YnVtTmNPbVlqY3A3WUJQSm1reHh2T2FqKzNoYUNDbmlqc3lNOGNLU2V5Uk9I?=
 =?utf-8?B?UTJsYmUvajgrYkVPRUc0bFBTRVVBalV5ckxGZXZHSFJyMkFTQkdQMktRSmVI?=
 =?utf-8?B?ODY5UDR1Y2Foa21oZnFITzF4ek5Hb25zbjNndnB5VmYzMWFETGxFUy9HZDVx?=
 =?utf-8?B?Vk1xZVBUVHFLTVo2MnJyMjdRRFR2WG95U2MzbWlNNW9USFQrcnkyK1psUHU5?=
 =?utf-8?B?TUkwbXlWZnI5allkTjA3NHlxTy9ySitjdnBpSkMvUklYOHo2S2NpNExEWmMx?=
 =?utf-8?B?ZTdONXBiYUl3U1ZENjE5bVdvRWtJclJESmdZbm16ZlNKTWdtcERqeUQ5VlFB?=
 =?utf-8?B?Tjlla2I4TExocXU5a3J2cTdPOE9pbzVkVlNtWEJzZDc0bHgvNFNzR09SaVFs?=
 =?utf-8?B?c2IzWnNpUjJyMWd0dDlUVkhabHltVzRUOUp6dXZ3eEgreU8xSnpLUFJTN2V1?=
 =?utf-8?B?a1BndjVQTE92RGxuNldHak1WTUJQM3l1RXk5TWxJdDFBS3dMTjRZOHo3RFJG?=
 =?utf-8?B?RjdHZTVOK3F0YWF2UnhGWmJTVUdoWGZEaHY5K1VHbTlzbWt5ZFBEQnZBK2dx?=
 =?utf-8?B?QzZyTWFzTStzbUYyS2VwZUI3MWdBWmtFY3JHY3U2T25OZmYwZ0ZrSWtzL1JU?=
 =?utf-8?B?a25KQkxwRmgwZy9IZVJKMUtUN1hnVUNxSy9HQjAxWDlDa0VYVXlOczBxSFF3?=
 =?utf-8?B?NEFWRTI5elFNMDFnOTIxVjFZRTAwMWphSzQvcHRtb05tOVIra0YzaDQ0Um1u?=
 =?utf-8?B?QzA3dXhjTzdCWThvaHhIbTJhN0lXUTBaZHR4TmZ5TmtUQnB5NjUxbzhva1pK?=
 =?utf-8?B?bXRTdW5zcVg4ZzRWSnVUTXV2akhSWVp0NGlpdE1NKzF5N2xlUTdpOTFUeGk4?=
 =?utf-8?B?Tis1dHlHK2lab3BSVVlCVklUNHFFcXMzRjBaTVBnbFN6NTljZzRYOC9hMU1v?=
 =?utf-8?B?UVphL2hYUzI2dlNaVmxpZGMyN28yTWZJN29nbzkyRFlHZjIwYnRRK3k5TGo2?=
 =?utf-8?B?WVo1cThud0dTY2RoQ0E1clVYUXdUanBlMlR2TG1hSGFEeWQxcmdGMHdYY1ZB?=
 =?utf-8?B?YnZJUGNCVzlnVitXcC9Wdmx3b0pFN3pYLzdlQU1GNVZvNWxsZXVKYmxZOUpB?=
 =?utf-8?B?TlNaZU5vQkl4eEk5bGNnUmZNN1lwdnR5N3IxVGJZVU90anBHUHZDc3krVkJ2?=
 =?utf-8?B?Q0dHcGRuRGorTE9UY1hLeW55WVJYSzg0K3QyS1lWbGNqakxkWXo4QndTOWg4?=
 =?utf-8?B?K2hTdEN3YUJaRFlYU0twNjZ4YWFVUzU0WlNCb2lzU3ZnUVBQSzJDT3ZXUHg3?=
 =?utf-8?B?WVY5YWZOZUZOcjdtRlFCVVpYeDJEVUg2U3BWMVNCcEwrbVo1b3NMVVVXR1dI?=
 =?utf-8?B?QVFDc1luNHpRenFRWjFBU3FEaVAzbmgwOFgwaUFpWXNnVVBiclVVYkNZNWp6?=
 =?utf-8?B?Nm5nQmZPakt5N2k2L1pYSSt5TVdHQW9ZOHZEdVY0cjFUcFpDWm84clVETWg2?=
 =?utf-8?B?WFJjY0hJd0JUbUY3ZTcvWll4QTk3YmY5bldFRFlDazhkNEJRRVZmQTN4Z0tF?=
 =?utf-8?B?eFhOMUljVEVWSlgwL1FwcldLZnFFN2d0VEZPajRpRGM3RkVGTXRsMzluT2RL?=
 =?utf-8?B?V0lnamVSM042VFRIQ0RpRzh0ajJtdnFsYlVLT1NxRCtuQUVGM3JweUNJb3Nw?=
 =?utf-8?Q?c7+EBEIzHXgi8E18=3D?=
X-Exchange-RoutingPolicyChecked: 3F2HMr+7PgMUih/DDS0kUJP6im8RzYOUFzQt6F/wYZUSJsAfLGRqKpyQI+HQ9udHFg4lij9L6WN6D4vuCHAzrc0EaBdmUWdxTJUeM1HV2n8L8Xgmh+dx81TvILKwW9C0PAS44HMVj61vMOm9TR1hWt5solkSTAYf/Z22SYaQLa+7iXtZtXP2HwBOC7xcvTMX+D4NfT5mRx61PuSnwwCuiycMbxi1Nh1pOAqbpfHTg+uUdbollaW9VnExiOG/OgXQ74yPQzwPscmQFee6919tJM0nhQSFjFLZ4343S9II4Lzmpo6BdEYFdotSRJUuCET+b5/6h1kpb7jgrqr4AHLxHA==
X-MS-Exchange-CrossTenant-Network-Message-Id: a71ceefa-d472-448e-0f67-08df334dd70a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 10:42:32.4538 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5K/4uXXTDSh6DrP6aVTG1AYOv82xRt+BszsxYJA/SL/T0MjwQKTM5qYxYkmFAslKRWNTLBxhDa6alnbej4I2vW3DIq6TpolBakn+wlJPDxM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8225
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
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

The GuC doorbells manager currently treats all GuC doorbells as a single
pool, from which the PF reserves doorbells for VFs provisioning.

This series introduces explicit separation between doorbells available
for the native or PF driver and doorbells that can be shared with VFs,
in the same way as it was done for the GuC ID manager. The doorbells
manager gains support for independent usable and shareable pools,
dedicated allocation interfaces, pool-specific accounting and
validation, and extended test coverage.

To preserve existing behaviour, both pools continue to map onto the same
GuC doorbells space. PF VFs provisioning is updated to explicitly reserve
and release doorbells from the shareable pool, while doorbells manager
initialization is adapted to expose the correct ranges for native and PF
operating modes.

Piotr Piórkowski (4):
  drm/xe/guc: Split GuC doorbells manager into usable and shareable
    pools
  drm/xe/kunit: Extend GuC doorbells manager split-pool coverage
  drm/xe/guc: Initialize GuC doorbells manager according to device mode
  drm/xe/pf: Explicitly use shareable GuC doorbells for VFs provisioning

 .../xe/tests/xe_gt_sriov_pf_config_kunit.c    |   4 +
 drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c | 807 ++++++++++++++++--
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |  25 +-
 drivers/gpu/drm/xe/xe_guc.c                   |  10 +-
 drivers/gpu/drm/xe/xe_guc_db_mgr.c            | 338 +++++---
 drivers/gpu/drm/xe/xe_guc_db_mgr.h            |  21 +-
 drivers/gpu/drm/xe/xe_guc_types.h             |   6 +-
 7 files changed, 1024 insertions(+), 187 deletions(-)

-- 
2.34.1


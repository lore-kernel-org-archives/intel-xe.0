Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0723606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 10:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eYapiQOu
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1D4110EDE0;
	Mon, 26 Oct 2026 10:42:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F4A410EDD8
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Oct 2026 10:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793011361; x=1824547361;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=J/BKXK+KmR6A73cK45lLjOfQ110QxxKWJglF7I6IN6w=;
 b=eYapiQOuoqhYbV0HZucGhT8+a03JMcOTiqDR1lrA4DUbil/S1xdGXPQf
 eAS9Np1YPPBKY0/AX6iUO9sttgC6lER9Ox/n0c9HWu9BimyVAV2uPsFZa
 9gxSP4z3E/TSMhUxn1/a5K4Ki783VkcV7hn/CbDnw7eLKNVjkrZGUps5n
 P+z//+1YnR7ysP8V1nRCI2DGWH0kG8QQru/2E+4wCwmK/wRz+D1dD2sEj
 wQNkcqICOqXq0eynf1mmRvjiNM11t75Xnoza0GMe2k8AYUvQLjzqufla3
 Or7w31xJBju6gLGPFMn9xYNma5br/mTsd8kSaOtX+pYhojEKKQJMVsn0o g==;
X-CSE-ConnectionGUID: MBYyFYcfRZWPxOn6B9XjtQ==
X-CSE-MsgGUID: +g16TJENRpKK+x1mn9VJcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1764708"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1764708"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 03:42:40 -0700
X-CSE-ConnectionGUID: PPQni3ZSQ2arFcummYb6Vg==
X-CSE-MsgGUID: HGG0IMVDRVSp2n0jXldm/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4245561"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 03:42:40 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 03:42:40 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 26 Oct 2026 03:42:40 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.33) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 03:42:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZpDg5Ms2kTTV1XS+TMO5haJJSoKz4xUWP3eAQfZWox4SEY51239U0yhDbVQj1mKUaoxu/ojjik5ZZcEWE+RYT42jsyMzOQ+y+g7et1ojjUelZa+3w83DBP4OUgMe+mU10jmir8TEkilljUrAM6SiftRlo2TwjGjdAgo58suIlLqnrkkT2GSDI+dki7wPH1lulwB60YpPtrHfS/yb8onsVvwAmZ5LXY9sYOl1N6A55ng06wup1BcD7UppzyHTI536furJA7Ue1QOgjf8+29eD1tOuTSeohUqQSRtergYdklMsSZfO0sN5MmeabaRpiyhegpqttZKV93gXO+VzgFjlYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HpBoEBtPS5nbV1V5bPMtJBFpJAhzsXPs7QX5BDQuVK0=;
 b=EQFnH4Z9e0T2qlaAmzXcy8uGX7lMqH5xHImKGhE6s8E5OeRzpW+X9VqT7+UCTnMVa5Zaw91Ekc7sNGY8Bp0QsCgijz3Sdy35gUxN8M68njEO7EWOo2v1wcc7YElqlcnP05eXrjUmkCU1Eu/r+IaHF8ekYl6q/YAnMIj8fZxqjeJgLCE3tqdoMGfGEhEPr6sj91s6WoFLWa+gGdpnlxifwZb8Kxo6gL7kujbkHW5y/3iO1p85KNKVnhW07QG/Ryr1JWfT0pG666G3HBNidrTCfOsc7w/N02ANYaFSuuLjUC/9VTZKBt7KPz2j36N+uC+rdmoaeVjcdGl5C8iuMWo4oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by DM4PR11MB8225.namprd11.prod.outlook.com (2603:10b6:8:188::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 10:42:38 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 10:42:37 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v1 1/4] drm/xe/guc: Split GuC doorbells manager into usable
 and shareable pools
Date: Mon, 26 Oct 2026 11:42:21 +0100
Message-ID: <20261026104224.1018993-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261026104224.1018993-1-piotr.piorkowski@intel.com>
References: <20261026104224.1018993-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL0P290CA0002.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:5::10) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|DM4PR11MB8225:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ca4f4e3-d6d4-4de9-09f8-08df334dda37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|11063799006|56012099006|261009223027099003|261022113327099003|261022105027099003|261021121427099003|261022075727099003|261021123027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: +/8eL4FNlerphu3fQCNIVPb2u8VaMhsm363Ea+lu8UIxOz2pzDUiYm9k1x73Y9eDMFexL2lZ0nJzCAhLhJQ+quIm8sCDfT/p8CDnJUFx8Db8bdLJpQ5tLuodi0stdVzwTjTopfPwWKac9rpXL0zf/IJ2m13aUtAmKoEq7kkHzCyyLRXEgHPAuI1eI4s0grmYXYPEDoyrA5PGYX5Lm6jSGZEERezlG7Nf3xEwg4sNB7Av8sHKV2P990+H1ECJqhulR/DePBA4NAa2xZrAMBOjsnlDzGJiO2YTTxY0I843JF09PnROaH5yyuNCaB6cksa4ZNTzoCfYZGtlrjUgNhGOg1JCkAAw502+VyADTj91xXWajLrJYKrX2HKOXYyEUKZ3f7FJwHfO1h86wwggjGj8Cr2IaO/1/di1RkkbDp3Dv2vaTzO0oYxmRyJ64jjRyaI7wsRjLSe/bi+Xx4gs8dxcfFfoBUM5dTEYmEhhoDh2WJTVacgxPBd05jvpcxqu7usxkle0XkWo/2lnG1virQ7U5+SKERw86mndsY4eZh9IauV17SOcni1iM4jFqnJ96yrDUYrc6EcYAY5pib8QwN+cz+YoCqvoLk/aNqxFXzCogT/lEgdGvIc7H/yfTn8n3ur9RLZs97wVrvC1w1Zf/lbJihDzb9m05m/ziOG+58tOIpA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(11063799006)(56012099006)(261009223027099003)(261022113327099003)(261022105027099003)(261021121427099003)(261022075727099003)(261021123027099003)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZldMa2gycDhJK2RzSEZScEg1ZWNIY09rc0pLOFNsQVR4ck14dFBYNnRmR2NI?=
 =?utf-8?B?dnRzU0tTUXFHR0pEbHZUclF3UzBpcUZFZFZ4Sk16YWhjR1FNVFM3VmM0Z1pX?=
 =?utf-8?B?V2VVRXJUekk4OFBIUkwvM3VyK21EYlJKOHl3RVZrUnEyQXk0Q2pKWjFMZk4x?=
 =?utf-8?B?QUVhd3BpVG13YVhnWjZoZks0OHphMGdwc0VEaGREKzFsNUU4WGRoOG5DVkcv?=
 =?utf-8?B?U0VUeFlXTm00V1crbkZCOWR5U3Zoc1YxWlB6aGhSL0J4YWNnaXJPV0t4c2dP?=
 =?utf-8?B?ZEh6bWZ2ZHR1aEUxaXBsM0lFeUFqeEZCTDU0UEVPeVBna1pjQUU2MTVUaTFu?=
 =?utf-8?B?WExzRGNTdzAxdWdRdkQ5dmhNbTZVWGxUazRnR2dsZVVYMElOcVIxUS9ZQ2t3?=
 =?utf-8?B?QnR2ZXIrSVRvTWtJQVlVTmM5NFdFRXdOM2R5Q0NDblMxQ2tGdnVQTVhvUXpL?=
 =?utf-8?B?RUJqcGFOMTFjYUpuUmx6MkpKaGdTZzF1QzZoTFpFY3JyTUg5SExLSUN6RS8w?=
 =?utf-8?B?Wlk2OW9aNmt1aUdlbkVic3p5OTcxbGtJT002bm4rRExlb0tBeDN1ajhqNUE0?=
 =?utf-8?B?UkljSTByMXBwMWxhUCtZN2pNdFJwMkN0bXhMaWFTWGF3T1l3VTBTckM4ZW0x?=
 =?utf-8?B?Z1M2SkljMWlIWlliMEYyWjh1NS9kd1Q2SzN6TWRNZXBwdmpPS3Foc1lVQTQ1?=
 =?utf-8?B?TFd4RVBVM0Ixd1hnUEFMbVVJUm9MYm9RUFlpOGkzd0NSQndFM2pDOE55Qlgy?=
 =?utf-8?B?ckdCSzRMK1U3d3FDTWFENlU0U3EzYUd3cENYVklNR3F1QWxSNUJPeVhqSGlu?=
 =?utf-8?B?SE5aUWoySU52SzM5eXNJQnlFencwc0ljN0N6STdvUEt2NythZU5IeXlhM0d3?=
 =?utf-8?B?OWlnNHZHQjFHYUdaVFYxczZWSzFjOEE1Zy9lRjR3QVVzSlVCakx1djNoelBl?=
 =?utf-8?B?Ui9qWW5ZUEJkUWZ5TGx5TzFQQ3VPRWpwWVJKdmdLMVNyREhjOTNLY2Qzd0xT?=
 =?utf-8?B?UlBFeTE2MGEwUnlsTkhBbklyZkROZXZvWkpTS1NHQWRnWXJYZ3RzSkVKWlhL?=
 =?utf-8?B?cmIxKytuTVZENzZlNXMrN1dDZStXR0lpOHg5djdmKzg0RWtrYStUa0RtVFVM?=
 =?utf-8?B?MTJ5MGM4QUdxWFJ2NS8rSlArVmQ3THZYYXV3SDcxbDVHZ1ZNUllkcjByY01B?=
 =?utf-8?B?cmY1WEg4d05wMHRPUW5KM3hrNkk4ckZJSGRoSEI2L0JRWkpFZ0w2OGg2NHg2?=
 =?utf-8?B?dSs1WSt4ZHBZczhUQ3N1TnJod2lpQkJCaytUeGk1M2hSckRUbVNCTkJQbk5M?=
 =?utf-8?B?aEkzMm5MYVB1S2NZc0N0NW96MTZTemV6bDdqQmtxTHp5SW8rYk9rZkp1Nk9M?=
 =?utf-8?B?WURHV2wxc0ZZVHU0SWx3UXZaM2F0U0FVbmNDaEtySnVRVmtUUDM3eEFZT3NC?=
 =?utf-8?B?cXRGdmhzbXVVWlM2eDJxdVlnZFdER1dTa2s1elVPalBEQUNaM2RJcExKQWNE?=
 =?utf-8?B?TGVkZE44L1cwRjd5ZnZ3Wlk1c1JpOEd6RENlL015UjJaaXdQZXFlR3BXZDRi?=
 =?utf-8?B?ZXNGSWh1OVNFdWZOd2NUWHc0N1JhN0U2Q0tZYWdGQ2VMMHNDR2RDOUpldDR1?=
 =?utf-8?B?RVFFOFZob0dFUDgzWDhpK0lIdWM0TEtlSGwyb3VHdTdRbmpSSW1weGZMbmFE?=
 =?utf-8?B?NXNOMHRtc0h2MDdmeE5jcWhKYWxUYVh3Q2VkQVUwYUFCTWlIMmk4Q1prQ096?=
 =?utf-8?B?a0MxblFRV1AvV2ozcGpBMUs4UXRwWlFSYlZVKzJickxqZmxzOHVlczgwcysw?=
 =?utf-8?B?dTFidUwvb0tsbUM1TWJEYTkzS1Rrcy8zSms4YnJLUFRzTXA4MTE4b01UOGZ0?=
 =?utf-8?B?RldRaUk3dSt3dFRoNVdlc2ZTYngwd3J6bUVhZnJaZnZ5b2NXd1REZ3p1ZGNM?=
 =?utf-8?B?M0VJb1hERmFIUkx4NEV6dHlTUllHY1pEejZzVUZvVHd6eUJtWHMvdHg2Z0I0?=
 =?utf-8?B?THZqa2Q3NERDOXRCSS8vT1lXbE5pWnp6Slc3ZGVJZHhHOE4xazNLV1ozZzZF?=
 =?utf-8?B?VlFrZnZuY2ZRYVJjeHlKV0hCSmxabCtNeGVRcitVQVRMUGNmcWR2WHI0ZDh1?=
 =?utf-8?B?cHZxRDE4SmRmbENlUWVsNUMrMW1JcHpIaEwrVDFITEdIRWZrU0tJVDFYL3l4?=
 =?utf-8?B?bmExcUJqWmpOZzlzdFZ4MGU2Tnd1WXNMVWp4OWwzeDRlc3pVWVRRb0hka2lV?=
 =?utf-8?B?N083VVNpNVE5K2FCQWpzWmJ1dWdxcFd0bFVHcDFERVR1WUlBOTJ5N0JWSnFL?=
 =?utf-8?B?bzBiMi9NVUxCSzBqWHJodStrUE9HejRxbGthWnY2MkRQb0tTSzg2eUlKU1lD?=
 =?utf-8?Q?X29zPxlzTQttPlSg=3D?=
X-Exchange-RoutingPolicyChecked: vHOQxCUcO31bo0U1RPJ4ycai7YiXyk6C0ccfaARZrq+IUaZMIBUhcYg1cTOhwP4WnNdreYdhYwNc4JlSmV0vxwY9otlxfAYPjoPk49Rdk7JXDTHABQO0tEB8sO5mj77BJdgZnJb8IndbOH9xJTw/RoRvekr+N5XuvOlsVhu4jcnKrm5WcRyI3Bg2Qia+lViypyCH9gMGACBN67sCSJVQT81QxpY3nCIbNyHEp7b0JcPoiXYknyMa40hZTKX0aos9A7TOhOQ3PAzuaaYpNQ5cslcddwkBEBU0O623u5vJ9rOZIL7FP76atbfJycvtTd9WWRo5ZRgmZi6W7mjA6WH18w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ca4f4e3-d6d4-4de9-09f8-08df334dda37
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 10:42:37.8861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kxt7PhIIU2c4cviirKW5e6R2vonOJIK3wo48E6JEHT3FOBU5u1MYgGkANnlRhSXWnfONiiDcA4dGbN8udD1I+pveP7l8csj52IsiGQZmZB0=
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Modify the GuC doorbells manager so that it distinguishes between
usable doorbells, available for the PF, and shareable doorbells, which
can be provisioned to VFs. Both pools are represented as a single
bitmap and may overlap.

Let's replace the single-pool accounting model with separate usable and
shareable pools, add helpers for pool accounting and limits, add API to
reserve and release shareable doorbells, and update debug reporting.

For now, let's keep the current allocation behaviour by mapping both pools
onto the same doorbells space. This prepares the doorbells manager for
separate management of PF and VF doorbells in following changes.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c |  36 +-
 drivers/gpu/drm/xe/xe_guc_db_mgr.c            | 316 ++++++++++++++----
 drivers/gpu/drm/xe/xe_guc_db_mgr.h            |   7 +
 drivers/gpu/drm/xe/xe_guc_types.h             |   6 +-
 4 files changed, 283 insertions(+), 82 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c b/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c
index a87a7b4b040a2..014f2dd6f3cc3 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c
@@ -25,7 +25,7 @@ static void test_empty(struct kunit *test)
 	struct xe_guc_db_mgr *dbm = test->priv;
 
 	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, 0), 0);
-	KUNIT_ASSERT_EQ(test, dbm->count, 0);
+	KUNIT_ASSERT_EQ(test, dbm_total(dbm), 0);
 
 	mutex_lock(dbm_mutex(dbm));
 	KUNIT_EXPECT_LT(test, xe_guc_db_mgr_reserve_id_locked(dbm), 0);
@@ -39,7 +39,7 @@ static void test_default(struct kunit *test)
 	struct xe_guc_db_mgr *dbm = test->priv;
 
 	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, ~0), 0);
-	KUNIT_ASSERT_EQ(test, dbm->count, GUC_NUM_DOORBELLS);
+	KUNIT_ASSERT_EQ(test, dbm_total(dbm), GUC_NUM_DOORBELLS);
 }
 
 static const unsigned int guc_dbm_params[] = {
@@ -64,12 +64,12 @@ static void test_size(struct kunit *test)
 	int id;
 
 	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, *p), 0);
-	KUNIT_ASSERT_EQ(test, dbm->count, *p);
+	KUNIT_ASSERT_EQ(test, dbm_total(dbm), *p);
 
 	mutex_lock(dbm_mutex(dbm));
 	for (n = 0; n < *p; n++) {
 		KUNIT_EXPECT_GE(test, id = xe_guc_db_mgr_reserve_id_locked(dbm), 0);
-		KUNIT_EXPECT_LT(test, id, dbm->count);
+		KUNIT_EXPECT_LT(test, id, dbm_total(dbm));
 	}
 	KUNIT_EXPECT_LT(test, xe_guc_db_mgr_reserve_id_locked(dbm), 0);
 	mutex_unlock(dbm_mutex(dbm));
@@ -116,17 +116,17 @@ static void test_range_overlap(struct kunit *test)
 	unsigned int n;
 
 	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, ~0), 0);
-	KUNIT_ASSERT_LE(test, *p, dbm->count);
+	KUNIT_ASSERT_LE(test, *p, dbm_total(dbm));
 
 	KUNIT_ASSERT_GE(test, id1 = xe_guc_db_mgr_reserve_range(dbm, *p, 0), 0);
-	for (n = 0; n < dbm->count - *p; n++) {
+	for (n = 0; n < dbm_total(dbm) - *p; n++) {
 		KUNIT_ASSERT_GE(test, id2 = xe_guc_db_mgr_reserve_range(dbm, 1, 0), 0);
 		KUNIT_ASSERT_NE(test, id2, id1);
 		KUNIT_ASSERT_NE_MSG(test, id2 < id1, id2 > id1 + *p - 1,
 				    "id1=%d id2=%d", id1, id2);
 	}
 	KUNIT_ASSERT_LT(test, xe_guc_db_mgr_reserve_range(dbm, 1, 0), 0);
-	xe_guc_db_mgr_release_range(dbm, 0, dbm->count);
+	xe_guc_db_mgr_release_range(dbm, 0, dbm_total(dbm));
 
 	if (*p >= 1) {
 		KUNIT_ASSERT_GE(test, id1 = xe_guc_db_mgr_reserve_range(dbm, 1, 0), 0);
@@ -134,7 +134,7 @@ static void test_range_overlap(struct kunit *test)
 		KUNIT_ASSERT_NE(test, id2, id1);
 		KUNIT_ASSERT_NE_MSG(test, id1 < id2, id1 > id2 + *p - 2,
 				    "id1=%d id2=%d", id1, id2);
-		for (n = 0; n < dbm->count - *p; n++) {
+		for (n = 0; n < dbm_total(dbm) - *p; n++) {
 			KUNIT_ASSERT_GE(test, id3 = xe_guc_db_mgr_reserve_range(dbm, 1, 0), 0);
 			KUNIT_ASSERT_NE(test, id3, id1);
 			KUNIT_ASSERT_NE(test, id3, id2);
@@ -142,7 +142,7 @@ static void test_range_overlap(struct kunit *test)
 					    "id3=%d id2=%d", id3, id2);
 		}
 		KUNIT_ASSERT_LT(test, xe_guc_db_mgr_reserve_range(dbm, 1, 0), 0);
-		xe_guc_db_mgr_release_range(dbm, 0, dbm->count);
+		xe_guc_db_mgr_release_range(dbm, 0, dbm_total(dbm));
 	}
 }
 
@@ -154,15 +154,15 @@ static void test_range_compact(struct kunit *test)
 
 	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, ~0), 0);
 	KUNIT_ASSERT_NE(test, *p, 0);
-	KUNIT_ASSERT_LE(test, *p, dbm->count);
-	if (dbm->count % *p)
+	KUNIT_ASSERT_LE(test, *p, dbm_total(dbm));
+	if (dbm_total(dbm) % *p)
 		kunit_skip(test, "must be divisible");
 
 	KUNIT_ASSERT_GE(test, xe_guc_db_mgr_reserve_range(dbm, *p, 0), 0);
-	for (n = 1; n < dbm->count / *p; n++)
+	for (n = 1; n < dbm_total(dbm) / *p; n++)
 		KUNIT_ASSERT_GE(test, xe_guc_db_mgr_reserve_range(dbm, *p, 0), 0);
 	KUNIT_ASSERT_LT(test, xe_guc_db_mgr_reserve_range(dbm, 1, 0), 0);
-	xe_guc_db_mgr_release_range(dbm, 0, dbm->count);
+	xe_guc_db_mgr_release_range(dbm, 0, dbm_total(dbm));
 }
 
 static void test_range_spare(struct kunit *test)
@@ -172,12 +172,12 @@ static void test_range_spare(struct kunit *test)
 	int id;
 
 	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, ~0), 0);
-	KUNIT_ASSERT_LE(test, *p, dbm->count);
+	KUNIT_ASSERT_LE(test, *p, dbm_total(dbm));
 
-	KUNIT_ASSERT_LT(test, xe_guc_db_mgr_reserve_range(dbm, *p, dbm->count), 0);
-	KUNIT_ASSERT_LT(test, xe_guc_db_mgr_reserve_range(dbm, *p, dbm->count - *p + 1), 0);
-	KUNIT_ASSERT_EQ(test, id = xe_guc_db_mgr_reserve_range(dbm, *p, dbm->count - *p), 0);
-	KUNIT_ASSERT_LT(test, xe_guc_db_mgr_reserve_range(dbm, 1, dbm->count - *p), 0);
+	KUNIT_ASSERT_LT(test, xe_guc_db_mgr_reserve_range(dbm, *p, dbm_total(dbm)), 0);
+	KUNIT_ASSERT_LT(test, xe_guc_db_mgr_reserve_range(dbm, *p, dbm_total(dbm) - *p + 1), 0);
+	KUNIT_ASSERT_EQ(test, id = xe_guc_db_mgr_reserve_range(dbm, *p, dbm_total(dbm) - *p), 0);
+	KUNIT_ASSERT_LT(test, xe_guc_db_mgr_reserve_range(dbm, 1, dbm_total(dbm) - *p), 0);
 	xe_guc_db_mgr_release_range(dbm, id, *p);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_db_mgr.c b/drivers/gpu/drm/xe/xe_guc_db_mgr.c
index 6767e8076e6b4..57b775847ac17 100644
--- a/drivers/gpu/drm/xe/xe_guc_db_mgr.c
+++ b/drivers/gpu/drm/xe/xe_guc_db_mgr.c
@@ -48,6 +48,34 @@ static struct xe_device *dbm_to_xe(struct xe_guc_db_mgr *dbm)
 
 static void dbm_print_locked(struct xe_guc_db_mgr *dbm, struct drm_printer *p, int indent);
 
+static unsigned int dbm_total(struct xe_guc_db_mgr *dbm)
+{
+	if (dbm->usable > GUC_NUM_DOORBELLS - dbm->shareable)
+		return GUC_NUM_DOORBELLS;
+
+	return dbm->usable + dbm->shareable;
+}
+
+static unsigned int dbm_shareable_start(struct xe_guc_db_mgr *dbm)
+{
+	return dbm_total(dbm) - dbm->shareable;
+}
+
+static unsigned int dbm_used_usable(struct xe_guc_db_mgr *dbm)
+{
+	lockdep_assert_held(dbm_mutex(dbm));
+
+	return bitmap_weight(dbm->bitmap, dbm->usable);
+}
+
+static unsigned int dbm_used_shareable(struct xe_guc_db_mgr *dbm)
+{
+	lockdep_assert_held(dbm_mutex(dbm));
+
+	return bitmap_weight(dbm->bitmap, dbm_total(dbm)) -
+	       bitmap_weight(dbm->bitmap, dbm_shareable_start(dbm));
+}
+
 static void __fini_dbm(struct drm_device *drm, void *arg)
 {
 	struct xe_guc_db_mgr *dbm = arg;
@@ -55,22 +83,56 @@ static void __fini_dbm(struct drm_device *drm, void *arg)
 
 	mutex_lock(dbm_mutex(dbm));
 
-	weight = bitmap_weight(dbm->bitmap, dbm->count);
+	weight = bitmap_weight(dbm->bitmap, dbm_total(dbm));
 	if (weight) {
 		struct drm_printer p = xe_gt_info_printer(dbm_to_gt(dbm));
 
 		xe_gt_err(dbm_to_gt(dbm), "GuC doorbells manager unclean (%u/%u)\n",
-			  weight, dbm->count);
+			  weight, dbm_total(dbm));
 		dbm_print_locked(dbm, &p, 1);
 	}
 
 	bitmap_free(dbm->bitmap);
 	dbm->bitmap = NULL;
-	dbm->count = 0;
+	dbm->usable = 0;
+	dbm->shareable = 0;
 
 	mutex_unlock(dbm_mutex(dbm));
 }
 
+static int dbm_init(struct xe_guc_db_mgr *dbm, unsigned int usable, unsigned int shareable)
+{
+	bool overlap = usable > GUC_NUM_DOORBELLS - shareable;
+	unsigned int total;
+	int ret;
+
+	if (usable > GUC_NUM_DOORBELLS || shareable > GUC_NUM_DOORBELLS)
+		return -ERANGE;
+
+	dbm_assert(dbm, !dbm->bitmap);
+	dbm_assert(dbm, !shareable || IS_SRIOV_PF(dbm_to_xe(dbm)));
+	total = overlap ? GUC_NUM_DOORBELLS : usable + shareable;
+
+	if (!total)
+		goto done;
+
+	dbm->bitmap = bitmap_zalloc(total, GFP_KERNEL);
+	if (!dbm->bitmap)
+		return -ENOMEM;
+
+	dbm->usable = usable;
+	dbm->shareable = shareable;
+
+	ret = drmm_add_action_or_reset(&dbm_to_xe(dbm)->drm, __fini_dbm, dbm);
+	if (ret)
+		return ret;
+done:
+	xe_gt_dbg(dbm_to_gt(dbm), "using %u doorbell%s, %u doorbell%s shareable with VFs\n",
+		  dbm->usable, str_plural(dbm->usable),
+		  dbm->shareable, str_plural(dbm->shareable));
+	return 0;
+}
+
 /**
  * xe_guc_db_mgr_init() - Initialize GuC Doorbells Manager.
  * @dbm: the &xe_guc_db_mgr to initialize
@@ -79,60 +141,124 @@ static void __fini_dbm(struct drm_device *drm, void *arg)
  * The bare-metal or PF driver can pass ~0 as &count to indicate that all
  * doorbells supported by the hardware are available for use.
  *
- * Only VF's drivers will have to provide explicit number of doorbells IDs
- * that they can use.
- *
  * Return: 0 on success or a negative error code on failure.
  */
 int xe_guc_db_mgr_init(struct xe_guc_db_mgr *dbm, unsigned int count)
 {
-	int ret;
-
 	if (count == ~0)
 		count = GUC_NUM_DOORBELLS;
 
-	dbm_assert(dbm, !dbm->bitmap);
-	dbm_assert(dbm, count <= GUC_NUM_DOORBELLS);
+	return dbm_init(dbm, count, 0);
+}
 
-	if (!count)
-		goto done;
+/**
+ * xe_guc_db_mgr_max_shareable() - Get maximum number of shareable GuC doorbells.
+ * @dbm: the &xe_guc_db_mgr to query
+ *
+ * Return: maximum number of GuC doorbells that can be shared with VFs.
+ */
+unsigned int xe_guc_db_mgr_max_shareable(struct xe_guc_db_mgr *dbm)
+{
+	return dbm->shareable;
+}
 
-	dbm->bitmap = bitmap_zalloc(count, GFP_KERNEL);
-	if (!dbm->bitmap)
-		return -ENOMEM;
-	dbm->count = count;
+static unsigned int dbm_find_last_zero_area_in_range(unsigned long *bitmap,
+						     unsigned int range_start,
+						     unsigned int range_end,
+						     unsigned int count)
+{
+	unsigned int found = range_end;
+	unsigned int rs, re;
 
-	ret = drmm_add_action_or_reset(&dbm_to_xe(dbm)->drm, __fini_dbm, dbm);
-	if (ret)
-		return ret;
-done:
-	xe_gt_dbg(dbm_to_gt(dbm), "using %u doorbell%s\n",
-		  dbm->count, str_plural(dbm->count));
-	return 0;
+	for_each_clear_bitrange(rs, re, bitmap, range_end) {
+		unsigned int start = max(rs, range_start);
+		unsigned int end = min(re, range_end);
+		unsigned int range;
+
+		if (start >= end)
+			continue;
+
+		range = end - start;
+		if (range < count)
+			continue;
+
+		found = start + (range - count);
+	}
+
+	return found;
+}
+
+static int dbm_check_quota(unsigned int used, unsigned int count,
+			   unsigned int spare, unsigned int limit)
+{
+	return used + count + spare > limit ? -EDQUOT : 0;
+}
+
+static int dbm_reserve_chunk_shareable_locked(struct xe_guc_db_mgr *dbm, unsigned int count,
+					      unsigned int spare)
+{
+	unsigned int shareable_start = dbm_shareable_start(dbm);
+	unsigned int total = dbm_total(dbm);
+	int id;
+
+	dbm_assert(dbm, count);
+	lockdep_assert_held(dbm_mutex(dbm));
+
+	if (!dbm->shareable)
+		return -ENODATA;
+
+	if (shareable_start < dbm->usable)
+		id = dbm_find_last_zero_area_in_range(dbm->bitmap, shareable_start, total, count);
+	else
+		id = bitmap_find_next_zero_area(dbm->bitmap, total, shareable_start, count, 0);
+
+	if (id >= total)
+		return -ENOSPC;
+
+	/*
+	 * Spare is meaningful only for doorbells that are shared between usable
+	 * and shareable pools. Only doorbells taken from the overlapping part
+	 * reduce PF usable capacity, so a chunk located entirely in the
+	 * VF-exclusive part (or any chunk from non-overlapping pools) is never
+	 * limited by the spare.
+	 */
+	if (spare && id < dbm->usable) {
+		unsigned int need_overlap = min(id + count, dbm->usable) - id;
+		int err;
+
+		err = dbm_check_quota(dbm_used_usable(dbm), need_overlap, spare, dbm->usable);
+		if (err)
+			return err;
+	}
+
+	bitmap_set(dbm->bitmap, id, count);
+
+	return id;
 }
 
 static int dbm_reserve_chunk_locked(struct xe_guc_db_mgr *dbm,
 				    unsigned int count, unsigned int spare)
 {
-	unsigned int used;
+	unsigned int total = dbm_total(dbm);
 	int index;
 
 	dbm_assert(dbm, count);
 	dbm_assert(dbm, count <= GUC_NUM_DOORBELLS);
-	dbm_assert(dbm, dbm->count <= GUC_NUM_DOORBELLS);
 	lockdep_assert_held(dbm_mutex(dbm));
 
-	if (!dbm->count)
+	if (!total)
 		return -ENODATA;
 
 	if (spare) {
-		used = bitmap_weight(dbm->bitmap, dbm->count);
-		if (used + count + spare > dbm->count)
-			return -EDQUOT;
+		int err;
+
+		err = dbm_check_quota(bitmap_weight(dbm->bitmap, total), count, spare, total);
+		if (err)
+			return err;
 	}
 
-	index = bitmap_find_next_zero_area(dbm->bitmap, dbm->count, 0, count, 0);
-	if (index >= dbm->count)
+	index = bitmap_find_next_zero_area(dbm->bitmap, total, 0, count, 0);
+	if (index >= total)
 		return -ENOSPC;
 
 	bitmap_set(dbm->bitmap, index, count);
@@ -144,9 +270,8 @@ static void dbm_release_chunk_locked(struct xe_guc_db_mgr *dbm,
 				     unsigned int start, unsigned int count)
 {
 	dbm_assert(dbm, count);
-	dbm_assert(dbm, count <= GUC_NUM_DOORBELLS);
-	dbm_assert(dbm, dbm->count);
-	dbm_assert(dbm, dbm->count <= GUC_NUM_DOORBELLS);
+	dbm_assert(dbm, start < dbm_total(dbm));
+	dbm_assert(dbm, start + count - 1 < dbm_total(dbm));
 	lockdep_assert_held(dbm_mutex(dbm));
 
 	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
@@ -158,6 +283,65 @@ static void dbm_release_chunk_locked(struct xe_guc_db_mgr *dbm,
 	bitmap_clear(dbm->bitmap, start, count);
 }
 
+static int dbm_release_chunk_in_range_locked(struct xe_guc_db_mgr *dbm,
+					     unsigned int start,
+					     unsigned int count,
+					     unsigned int range_start,
+					     unsigned int range_end)
+{
+	lockdep_assert_held(dbm_mutex(dbm));
+
+	if (!count)
+		return -EINVAL;
+
+	if (start < range_start || start >= range_end)
+		return -ERANGE;
+
+	if (count > range_end - start)
+		return -ERANGE;
+
+	dbm_release_chunk_locked(dbm, start, count);
+
+	return 0;
+}
+
+/**
+ * xe_guc_db_mgr_reserve_shareable() - Reserve one or more shareable GuC doorbells for VFs.
+ * @dbm: the &xe_guc_db_mgr
+ * @count: number of shareable GuC doorbells to reserve (can't be 0)
+ * @spare: number of usable doorbells to keep available for the PF
+ *
+ * This function is dedicated for use by the PF driver, which expects the
+ * reserved range of doorbells to be contiguous.
+ *
+ * Return: starting ID of the allocated GuC doorbell range or
+ *         a negative error code on failure.
+ */
+int xe_guc_db_mgr_reserve_shareable(struct xe_guc_db_mgr *dbm, unsigned int count,
+				    unsigned int spare)
+{
+	guard(mutex)(dbm_mutex(dbm));
+
+	return dbm_reserve_chunk_shareable_locked(dbm, count, spare);
+}
+
+/**
+ * xe_guc_db_mgr_release_shareable() - Release one or more shareable GuC doorbells.
+ * @dbm: the &xe_guc_db_mgr
+ * @id: the first shareable GuC doorbell to release
+ * @count: number of shareable GuC doorbells to release
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int xe_guc_db_mgr_release_shareable(struct xe_guc_db_mgr *dbm, unsigned int id,
+				    unsigned int count)
+{
+	guard(mutex)(dbm_mutex(dbm));
+
+	return dbm_release_chunk_in_range_locked(dbm, id, count,
+						 dbm_shareable_start(dbm), dbm_total(dbm));
+}
+
 /**
  * xe_guc_db_mgr_reserve_id_locked() - Reserve a single GuC Doorbell ID.
  * @dbm: the &xe_guc_db_mgr
@@ -199,13 +383,9 @@ void xe_guc_db_mgr_release_id_locked(struct xe_guc_db_mgr *dbm, unsigned int id)
 int xe_guc_db_mgr_reserve_range(struct xe_guc_db_mgr *dbm,
 				unsigned int count, unsigned int spare)
 {
-	int ret;
-
-	mutex_lock(dbm_mutex(dbm));
-	ret = dbm_reserve_chunk_locked(dbm, count, spare);
-	mutex_unlock(dbm_mutex(dbm));
+	guard(mutex)(dbm_mutex(dbm));
 
-	return ret;
+	return dbm_reserve_chunk_locked(dbm, count, spare);
 }
 
 /**
@@ -217,35 +397,48 @@ int xe_guc_db_mgr_reserve_range(struct xe_guc_db_mgr *dbm,
 void xe_guc_db_mgr_release_range(struct xe_guc_db_mgr *dbm,
 				 unsigned int start, unsigned int count)
 {
-	mutex_lock(dbm_mutex(dbm));
+	guard(mutex)(dbm_mutex(dbm));
+
 	dbm_release_chunk_locked(dbm, start, count);
-	mutex_unlock(dbm_mutex(dbm));
 }
 
-static void dbm_print_locked(struct xe_guc_db_mgr *dbm, struct drm_printer *p, int indent)
+static void dbm_print_range_locked(struct xe_guc_db_mgr *dbm,
+				   struct drm_printer *p,
+				   int indent,
+				   const char *name,
+				   unsigned int range_start,
+				   unsigned int range_end,
+				   unsigned int used)
 {
 	unsigned int rs, re;
-	unsigned int total;
 
-	drm_printf_indent(p, indent, "count: %u\n", dbm->count);
-	if (!dbm->bitmap)
-		return;
+	lockdep_assert_held(dbm_mutex(dbm));
 
-	total = 0;
-	for_each_clear_bitrange(rs, re, dbm->bitmap, dbm->count) {
-		drm_printf_indent(p, indent, "available range: %u..%u (%u)\n",
-				  rs, re - 1, re - rs);
-		total += re - rs;
-	}
-	drm_printf_indent(p, indent, "available total: %u\n", total);
+	drm_printf_indent(p, indent, "%s count: %u\n", name, range_end - range_start);
+	for_each_set_bitrange(rs, re, dbm->bitmap, range_end) {
+		rs = max(rs, range_start);
+		re = min(re, range_end);
 
-	total = 0;
-	for_each_set_bitrange(rs, re, dbm->bitmap, dbm->count) {
-		drm_printf_indent(p, indent, "reserved range: %u..%u (%u)\n",
-				  rs, re - 1, re - rs);
-		total += re - rs;
+		if (rs < re)
+			drm_printf_indent(p, indent, "%s reserved range: %u..%u (%u)\n",
+					  name, rs, re - 1, re - rs);
 	}
-	drm_printf_indent(p, indent, "reserved total: %u\n", total);
+	drm_printf_indent(p, indent, "%s reserved total: %u\n", name, used);
+}
+
+static void dbm_print_locked(struct xe_guc_db_mgr *dbm, struct drm_printer *p, int indent)
+{
+	lockdep_assert_held(dbm_mutex(dbm));
+
+	drm_printf_indent(p, indent, "count: %u\n", dbm_total(dbm));
+	if (!dbm->bitmap)
+		return;
+
+	dbm_print_range_locked(dbm, p, indent, "usable", 0, dbm->usable,
+			       dbm_used_usable(dbm));
+	dbm_print_range_locked(dbm, p, indent, "shareable",
+			       dbm_shareable_start(dbm), dbm_total(dbm),
+			       dbm_used_shareable(dbm));
 }
 
 /**
@@ -257,9 +450,8 @@ static void dbm_print_locked(struct xe_guc_db_mgr *dbm, struct drm_printer *p, i
 void xe_guc_db_mgr_print(struct xe_guc_db_mgr *dbm,
 			 struct drm_printer *p, int indent)
 {
-	mutex_lock(dbm_mutex(dbm));
+	guard(mutex)(dbm_mutex(dbm));
 	dbm_print_locked(dbm, p, indent);
-	mutex_unlock(dbm_mutex(dbm));
 }
 
 #if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
diff --git a/drivers/gpu/drm/xe/xe_guc_db_mgr.h b/drivers/gpu/drm/xe/xe_guc_db_mgr.h
index c250fa0ca9d63..9b611a29b1a9b 100644
--- a/drivers/gpu/drm/xe/xe_guc_db_mgr.h
+++ b/drivers/gpu/drm/xe/xe_guc_db_mgr.h
@@ -11,6 +11,13 @@ struct xe_guc_db_mgr;
 
 int xe_guc_db_mgr_init(struct xe_guc_db_mgr *dbm, unsigned int count);
 
+unsigned int xe_guc_db_mgr_max_shareable(struct xe_guc_db_mgr *dbm);
+
+int xe_guc_db_mgr_reserve_shareable(struct xe_guc_db_mgr *dbm, unsigned int count,
+				    unsigned int spare);
+int xe_guc_db_mgr_release_shareable(struct xe_guc_db_mgr *dbm, unsigned int id,
+				    unsigned int count);
+
 int xe_guc_db_mgr_reserve_id_locked(struct xe_guc_db_mgr *dbm);
 void xe_guc_db_mgr_release_id_locked(struct xe_guc_db_mgr *dbm, unsigned int id);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
index 6da43691e54c5..fa9e0bd296d66 100644
--- a/drivers/gpu/drm/xe/xe_guc_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_types.h
@@ -27,10 +27,12 @@
  * to protect its members.
  */
 struct xe_guc_db_mgr {
-	/** @count: number of doorbells to manage */
-	unsigned int count;
 	/** @bitmap: bitmap to track allocated doorbells */
 	unsigned long *bitmap;
+	/** @usable: number of doorbells available for the native or PF driver */
+	unsigned int usable;
+	/** @shareable: number of doorbells that can be shared with VFs */
+	unsigned int shareable;
 };
 
 /**
-- 
2.34.1


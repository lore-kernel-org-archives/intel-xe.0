Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E48606D808
	for <intel-xe@archiver.kernel.org>; Mon,  9 Nov 2026 08:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ctL67AMc
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1671210E21D;
	Mon,  9 Nov 2026 08:54:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B78A10E21D
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Nov 2026 08:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794214472; x=1825750472;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=X90yAvWtk9mSqAET9jj6thnf7MeldHIqo0/22fw/k1s=;
 b=ctL67AMcOgy7FaLVXCspw2OQLaLfWFClPfyrpUpWUx+dgtlM3oLtTXgJ
 VWawTpReqLfUhruRgb5yecMUl7S7nclqw93TL+HWDjO9TIbQzoMRf77Aq
 qON4lfr241B0QXoJ/LBIIsZnMwnCaZdri+U7CSgAU0Wl1hOC50D1/L8tR
 CJYSg1rqZlyOaXvYs5er7g/zMk7vF5y0ZgvRgelrdHpdwYeAHQ+T/wxDF
 kseXMlzUzPoPi0KT+zGbp6Fjw0yK6AI+N0UefjkutSbgHpSYTe9H08H4f
 xNk0n39w8CQRftdR21sM8DTXtv+IWGMeQ139xL6L6Ds0mj/qaosmC5jZ7 g==;
X-CSE-ConnectionGUID: AAGO8vuZRyGAUCSp+89ukA==
X-CSE-MsgGUID: Sn+WK9YETH+L67v1+eykTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2832179"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2832179"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 00:54:31 -0800
X-CSE-ConnectionGUID: hqotJ0lgRpWOmL7PUaeIPw==
X-CSE-MsgGUID: ZNgMmjw+TqeVkT90k2i51Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="7850504"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 00:54:31 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 00:54:30 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 9 Nov 2026 00:54:30 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.21)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 00:54:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DGDyEnWnXmm5M+g1tinRcyAg5GCUpjcrMOw57VDV6HpRUvYxmF+XqDHIbxSmU4tTBcBF5dfGJbgm+THfNDeTG6mf1PflCnElY90RVbB9LOeX+5mjM7mYtYUk3/uGWSHTDapxc8iEHIaFGWk1SIplGb7wHm37eCjIOMcRYHSS9L3BPJQWxDgKj05sAbh2TbXWISQz+aGsaVrOApsJDAn2vKzZMeHOGMLTY/PWSyYDggJKFW+xNEPhwyli/M6px6tmlwF5RQkabP/HCi+upmEODuDyJE/1q/K4ihaVRu4E4Evsn9x1TkAsDXsHSXXkhHvzUBEj1ylm3ACCzHmQf1EOAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=44WIvj61Zvsoov1mKUQrMw4e/xZuYq4fhjKsW7eU7WU=;
 b=HzsVZUoe2PSfry7A5jrmz1qz9LNnZJ6kLjKYmMojQi6fbRzDCurKMi0Pn390fc/A4pZFrhH9y6DAU79wPINZLMlHlkHLG3ho+AegUs8CP0zWpXPCye8R86Ln35NG149J9Kw84Bv7aqrtaHmkmHNLFZfJoje3HZu6DzRq/1fzt1jH9ehJh7noXboFA6eq2eVZ+6PR7bpbxjlqTuFEMT53d7jey+myQBCeiASgWo39WozOZxYiiku/MtvVsd2mRY60nPPnPuPrYl54xRzH4ejs8g8awuJKyraCjkAqHkRSwv47F1dXqIWYIGnnz1Q/0hTSoBaUDOSqKeZKJywG/KEGuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by MN6PR11MB8169.namprd11.prod.outlook.com (2603:10b6:208:47d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 08:54:23 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%3]) with mapi id 15.21.0592.012; Mon, 9 Nov 2026
 08:54:22 +0000
Date: Mon, 9 Nov 2026 09:54:16 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Maarten Lankhorst <dev@lankhorst.se>
Subject: Re: [PATCH v7 5/5] drm/xe/ggtt: Add KUnit tests for usable and
 shareable pools
Message-ID: <20261109085416.4bf46msdbavgb3dl@intel.com>
References: <20261021085716.709503-1-piotr.piorkowski@intel.com>
 <20261021085716.709503-6-piotr.piorkowski@intel.com>
 <af0830362243e3f3d7289e853b8d72856faf7419@intel.com>
 <20261029121233.pkbpd6sbbjwdemh6@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261029121233.pkbpd6sbbjwdemh6@intel.com>
X-ClientProxiedBy: TL2P290CA0029.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::19) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|MN6PR11MB8169:EE_
X-MS-Office365-Filtering-Correlation-Id: 0978620b-2e59-4221-78c0-08df3e3f0c7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|22082099003|18002099003|6133799003|4143699003|5023799004|11063799006|56012099006|10067099003|261028144727099003|261026121527099003|261102130727099003|261102123227099003|261022075727099003|261022105027099003|261021121427099003|261026140227099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: zLTpfKEJU8vhEwZDkSUfcyR1p2mc5vQd5DaJLfh4Vm3w76Ur5Sd5oVLsyan2ei3AOoJx6MAJBojL0HMmqHh1QC5ZmNorDFIFegMquABuYKxierIfdRb5vD1bUPCWkx8Quq/lGs+RwojI07lGn3WmCJf2zwUd+3SN545nJ+fHAvKqwOc1KHkVScz8ZKnuZtIpOin1cTlzQmUPep2I7OUc/3DPRMxSaYt9X7TDK4yAWXUJzkfWOOSKBgld3vQA+dRKsc9GFPu2JCJVK4m1ysYvVp9LOyinhPDU2UogFfq6f2FbcVkR6px1EkgzAf/y2skmqG9h1+xy+DzbJgYiR28FmsiTzQh9ly3p53bofK0Cfnv8/6RSKu1Na2oL9gzWw0QxhA6EsPsKtBj/UrcZs2bDtG7hbNb/bLxsLrI+Hv8aXVZkVBgCG/uI3oi17o3re0uQvOauvujTo+Hl5zNrxdahJf0YpKuWC3Y+PbXGBsEvb7N6yQLxUWycY0UevFIEZ6/SUJKaFCRWNg95Uo0eC0tXbtafpTn5tF8Hj+ZbG2LtGdK2lXazKWjOJfFJJQyv7tZgIvjFJzZGbMuQGtUCns2bosV4rsQm355pIuge1ztbirCoIRCgevxLBHAoW7fXYkljRaNDXWJrZg1z8Qk5HmtnT7iAVHlBRboIqbdFaHZX/G0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(22082099003)(18002099003)(6133799003)(4143699003)(5023799004)(11063799006)(56012099006)(10067099003)(261028144727099003)(261026121527099003)(261102130727099003)(261102123227099003)(261022075727099003)(261022105027099003)(261021121427099003)(261026140227099003)(261009223027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1JBM1grZUo0TnBrYmpac3N0aDdvbEtJSHF2S1l5QXdvT2pqQktxSGJhQlhZ?=
 =?utf-8?B?T3p5R3hPRDliM0tMTVNoQ2xPMlRTaFBDL3RTdkdzRnhzdDkvbzJlUXFzQTVX?=
 =?utf-8?B?REx4ak9KK1lqaU5XdmZZWGppdjFaRWVaYXJsQVREK0Rwdm51NTN5Z29hS1hL?=
 =?utf-8?B?bklGUWFtcWt0Q2h0MTRLaU1UZ1hWZDhTMmpyS0FvUEVtODN4UERkZklOanZy?=
 =?utf-8?B?c2pzeStNdDQwNjNFdmRQbnQ2YnNSZ3NIT1VoM05EN3pkREdUSDJ2RzFhQlJu?=
 =?utf-8?B?NXZUTldjT2pNeVJ2ZlQ0QkNvZk9lR3JDc0ZLTnRpajhtcE1XOGRXZklHN25K?=
 =?utf-8?B?VDk2cGI2cmx1VTJodWlTc0V5bVFGZGFTd0NEd1o5QnZZVXJteE1uamI5Z2ZG?=
 =?utf-8?B?R1hvdkdHZDFDMExGdkYrV3pNU2FRdnBQV0Y2ZEY5dlgvK1hUV1A4ZVN3N05p?=
 =?utf-8?B?Z1R4Y25LOS9tQ3hSM21TNm0vUm9RN2lyTVd6VjI0Mmdza2NFd25RTmwrZ3VE?=
 =?utf-8?B?QVhMT1M3MjBJTjhZVTBkR2FpUStUODZodm5RckRWZGNkbFp6blJGV1RIQk80?=
 =?utf-8?B?MGxLQUtRQjI3YWxxSXc3cjQ5d25qc201OC9OVTR6ektkQWJtcnNDZE5sT0FQ?=
 =?utf-8?B?UlRxSU04YnZLTDhVY09hcUtiQ25qZWcxVkR6Zlkzd2FSMGhuYmxla3JoUjMv?=
 =?utf-8?B?aUpBcm9hQy94RTQ4UWpGTnhEQ0lBWkxnOER1elVsdS9FN2Q3RXlIRWJRS2tV?=
 =?utf-8?B?NFhXL1J4SkxJVERZQWdnZWtqckM2ZjF1RStnM2ZodlgxVzl1dTZsQjFsZWNa?=
 =?utf-8?B?OUdFeWwrNk9ESjlqTEc1R3o3aDlVSWM0ZWlHMitnMEJIWERLWjhNMTBERHRG?=
 =?utf-8?B?UHdEQm5UUmd5UnNGWEJZZFhNUTF3cTQwK0hTczB3clArNjFDOU4xZkx0QnJ3?=
 =?utf-8?B?RWlYMy9oM0VvWlNjZlRBWGQrckxXYjc3QkxpYzcxWUNIVGZBZTdGNXduWUsy?=
 =?utf-8?B?Q0NLUUwyektLa3J3Q1psVTl1dit1clVSM0lnaW4rUEMrclFzRHZSK3IyY3ZN?=
 =?utf-8?B?ZmVHSnQxazlWVEIxV3E2NjVBT09oN2FLZ3lScTI3R1hiR1JucG1MZE9zRFdk?=
 =?utf-8?B?OXk0YUdnMDA5VGQwNTUySmJ1TzZvMmRMTm9rY25oOGhwL1pSY0hKVWNJRC9O?=
 =?utf-8?B?WUxSbUNmUC9BVmJNK3gwOFNKSXNsVTkrSzMwNzVNOGVOOTZaTkh6QnNVZ2lZ?=
 =?utf-8?B?L0RTaUlaWURzRjZLZi9YeEphZE5HTUhRY0FmUDlOYXBNZHQ2NDlpTVprYnY4?=
 =?utf-8?B?ai8vMUk0YTFTUmNQVmNFUFZJZTdQbTFHNFBRbS95WjdvRmdueXZxelJ1Umh2?=
 =?utf-8?B?djAvK2Y4UlBHZ1MwU0txTk5Ca0J0QzhlaHg2ME1RSjZEUFN5RGtjRnYyZkg2?=
 =?utf-8?B?aXZ3QzZWcHlWTy9TTEV6VU9DTzVHeEhjTHE0QXVQV1krbndqaXgxazN3SkVu?=
 =?utf-8?B?cXlUVDV4Y05yVDBnUmRoMnUwZnhGYXRVUXNYY3Z6REhhdGdzSDJrdERRT3p6?=
 =?utf-8?B?QllVV2Q4YzROMlZIZExaRTcrNEFZalNOMXNoNWZzMnFvcGZyNkZQay9GU29a?=
 =?utf-8?B?b242OUlSR0ZUdnJIT21PQVBtWG1SRkxFK25rcXpUQWVaK3VCc1RHSlQ5dXhO?=
 =?utf-8?B?S241R29UbzBiaGF0SWpYeFVYamFDbW05N1hVb2gzZURlTkhLM3pXb2F3MXUy?=
 =?utf-8?B?MWFPMWRpT2NmNGhPaC9wZVY3NTViR250RVRHNUxJNmhQTzJwZTJCVjgxT2ha?=
 =?utf-8?B?L213dWQxcUVlVWlYOU8zLzZUVWl5Z0tBY2ZPSE1SSms0bzk3SUk0UXFRVmlS?=
 =?utf-8?B?VEwwbXB4ZFpGSjhjamFydDVaN01DUnVvSnBYeDBRNllFSmlESy94L3NaVCtm?=
 =?utf-8?B?UjcrcmhwM3VQampnbGxOZjd5MEFmcHRTS0xodEQwQnZVTmRDVi9UL1M4c0tG?=
 =?utf-8?B?K044RTd2Z0FTQkFiYkhoZS8xVTczQzZQNU5kVkJoVHZQTndUcWFRNmI4N242?=
 =?utf-8?B?ZXBEdDlnM0hkUndUd2xIT2syREVYUVNKWjhJTm93d3ZQeHRBMTFHZFgwNSt0?=
 =?utf-8?B?N29iL0d5bmtCU0xXc1hSZXZqcHhLZTdWeUh6d3dGb2daMjBCbUsyZVl1ZjZ4?=
 =?utf-8?B?aFB6bnlPWm5XUk80Rld4Zkw5YlhqS2RwNkRHUTRLVHpKTEovdTlhUmpjMS82?=
 =?utf-8?B?Nnowcmx2a2lvbTVNUklVZ2RIRi8xalVUaURjbUtVdC84cXlvbG9OWlFlWEV0?=
 =?utf-8?B?QTRjSnd1Mlp5RzRlKzBZRzdXaHJrZlA4ZUhUVFhUUllzSG00K3dhcmRqL2h1?=
 =?utf-8?Q?8DRaMvedcGgLxHiM=3D?=
X-Exchange-RoutingPolicyChecked: 29lx4Gu+nHS3si0XkHt4k36yJpK/TIyZOvFs7FYgbDJGAsEWpXQbzZJfa8ojWUGp8PdqNI7PtXAqyvxn8XkU3GWXpTYVj5CGcy0ZeNakE1KVxpV9FdyRQ6xhmToREUCRU4V9M/5KERUJNjseLxQeXG80BVf4TZJ315ACfqC/YA9344XiOmdswWHpgs3EILXob89aQPHcfaEVsoszP7zXpL/lEbSpYiK/kLSQcKQGhwVkOmbi05rXaKQdZ4lVCEIlxQyU/hL4/fzW5CfxiFeqXYyq6owdTiAh0xtnU/Jog2Jeuy/olukW6D3y0ppRN5Q6u6cynDcgSlF2KqElfuuv6g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0978620b-2e59-4221-78c0-08df3e3f0c7d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 08:54:22.5274 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7WSi0i0jEIx+GhC8+IyLM8N8bJ1YGT6NMJlum9RsWkoCDBBpnQTn1BtYPXxgvMbz0tb4yFFo8Vc4a/TmC/xZFcJpFc+k+7HsaEtGq5w3nlc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8169
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Piotr Piórkowski <piotr.piorkowski@intel.com> wrote on czw [2026-paź-29 13:12:33 +0100]:
> Jani Nikula <jani.nikula@linux.intel.com> wrote on wto [2026-paź-27 18:31:53 +0200]:
> > On Wed, 21 Oct 2026, Piórkowski, Piotr <piotr.piorkowski@intel.com> wrote:
> > > diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> > > index b7e3d626e8cb8..3dd029bc76dfc 100644
> > > --- a/drivers/gpu/drm/xe/xe_ggtt.c
> > > +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> > > @@ -1395,3 +1395,7 @@ u64 xe_ggtt_node_size(const struct xe_ggtt_node *node)
> > >  {
> > >  	return node->base.size;
> > >  }
> > > +
> > > +#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
> > > +#include "tests/xe_ggtt_kunit.c"
> > > +#endif
> > 
> > Why IS_BUILTIN()?
> > 
> > It smells like a mistake.
> > 
> > 
> > BR,
> > Jani.
> Hello Jani,
> 
> I simply used a pattern that had already been used earlier in the other files — to be honest,
> I didn't give it any further thought.
> 
> List of files with #if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
> xe_lmtt.c
> xe_guc_db_mgr.c
> xe_guc_relay.c
> xe_guc_id_mgr.c
> xe_sriov_pf_service.c
> xe_guc_buf.c
> xe_gt_sriov_pf_config.c
> xe_guc_klv_helpers.c
> xe_sriov_packet.c
> xe_log.c
> 
> If we have to use IS_ENABLED In that case, I guess we'll have to fix that
> in the other places as well.
> 
> Thanks,
> Piotr

Hi Jani,

Sorry, my previous answer was too short. I looked into it more closely,
and I believe IS_BUILTIN() is the right choice for this kind of test.

xe_ggtt_kunit.c calls kunit_test_suites() directly. Because the file is
#included into xe_ggtt.c, that puts the suite array into the
.kunit_test_suites section of xe.ko itself. The module loader picks up
that section for every module, and the KUnit module notifier runs those
suites on MODULE_STATE_LIVE. In other words, they run on module load,
as documented in include/kunit/test.h.

So with CONFIG_DRM_XE=m and CONFIG_DRM_XE_KUNIT_TEST=m:

IS_ENABLED(): every "modprobe xe", even on real hardware, would also
run the xe_ggtt/xe_ggtt_iov suites and taint the kernel with
TAINT_TEST.

IS_BUILTIN(): these tests are only built with =y, which is the
configuration used by kunit.py with drivers/gpu/drm/xe/.kunitconfig.

With =y, both variants behave the same.

The xe files that use IS_ENABLED() (xe_bo.c, xe_mocs.c, xe_migrate.c,
...) follow a different pattern. Their included test file does not call
kunit_test_suites(). It only exports the suite with
EXPORT_SYMBOL_IF_KUNIT(), and the separate xe_live_test.ko module
registers it. Nothing runs on xe.ko load, so =m is safe there.

So IIUC the rule is:

kunit_test_suites() in a file #included into xe.ko -> IS_BUILTIN()
suite exported and registered from a separate test module -> IS_ENABLED()
The other files I listed (xe_lmtt.c, xe_guc_id_mgr.c, xe_guc_relay.c,
...) follow the first rule.

Thanks,
Piotr




> > 
> > 
> > -- 
> > Jani Nikula, Intel
> 
> -- 

-- 

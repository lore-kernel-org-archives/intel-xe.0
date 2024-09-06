Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92871E6FE49
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 21:08:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4040910E1B0;
	Fri,  6 Sep 2024 21:08:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LitVKH08";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C2E710E1B0
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 21:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725656916; x=1757192916;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=55svYLqFVxNfFTvklgvVaWE2c4YEbiYvQZLv9gCcxOg=;
 b=LitVKH08HBGFZ6arS9JVYzVUFV4PMjwT+vKBWGVANL9YA/Ijapf41EEJ
 T5fip/1sz/d47pwbsnTMlK4vBxzPIbRDwCn5BflPuf0ryxivWMSMvv2C1
 FaJO4dJVrxbb8aUx0PMQW/TzwohD236zLk1RSp0VakMkGDeGTy01+uTum
 Y0r39lq/iDUAE7RcvGopnSl24JuXEc8ZLLzjKaiJdz4tWLYS7onUv+yqt
 gQhSTrgljMwvh5c3mIJppINHvKz+lGnkGJjMzZST7xN7P2DgUBja5oF/F
 r0A/KXRofh4tGITUOCRPcBa08DqlPepmqV0ney2iu9quytQK0pdg+XWqa Q==;
X-CSE-ConnectionGUID: bfFU6lMCRfu7y+25O6BTMw==
X-CSE-MsgGUID: P9kW/g9WROiJSLXYmVmI2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="23986808"
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="23986808"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 14:08:35 -0700
X-CSE-ConnectionGUID: Uq/0jKOqRR+Mcp3bspDCIA==
X-CSE-MsgGUID: rtRbRxqjQ2yG5fEfMcCQ9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="66613135"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2024 14:08:36 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 14:08:34 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 14:08:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Sep 2024 14:08:34 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Sep 2024 14:08:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RljKgSgeGfA+YL5R1yx9KTvbtlROSpvJ9wSmC6k3cN1HblFVL8aWS6p3+CDuw3xUDQtdsjp5XZIMW87MhuSniqS7SdXLaJ7U16ZJo59BDH081VUBZe0Em70FO8kqYiPmlMjj/t3+qPzhRzoBnVQhIFRG3oWDol8QiZd5BvxpFsRFoX7UNTxk4dt/zG+1oZb7AfmWuibg+S2Ot/gaioQ/3MzflH5HjXMUsFlnWkKqVBP3nAW0Wqj+mpv9OnMgT+Kvij1jo/jEv37kJPHoL1BJQXRRFufOjcgy+C5SRcO5nsxFrigQAesOaz3jFOV1eCetsoE0ZxmbSfKDFisjmtQSlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=55svYLqFVxNfFTvklgvVaWE2c4YEbiYvQZLv9gCcxOg=;
 b=wnS/nDM43uXM5UvY//0PWhCOawblsCZkOwCXM23QdPNmFFZQayPBS1d9v3RjTEjA04oNaucK/VOxmVqmkUWkile0+jBETDJ/P3CGETKvKF9kgNcNLYA5aNsqU7T6pJALCJ6Uplh6QBZUxI++UfaQD1VC5nK8M5PxeSv420DH3ZFultE+QS1G9wpmWtDyhRypY7cIVuX2EvM6B3EVSIfUL3DOiz/81pBF0uK9ppYAcJJs0kwrWBr8iyCm7QDrQ3c3JDug+6ggJprJD+EfJK1XleR1t2oUnNvqp1P/sl1vShGT/cmQGvLs4dGcVvSq749GiUze4037KRsn0UhKN+LwxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by DM6PR11MB4577.namprd11.prod.outlook.com (2603:10b6:5:2a1::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Fri, 6 Sep
 2024 21:08:31 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%4]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 21:08:31 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/xe: Mark reserved engines in snapshot
Thread-Topic: [PATCH] drm/xe: Mark reserved engines in snapshot
Thread-Index: AQHbAJ89c7Y/gEF7u06+3YhSkqx5eLJLQJmA
Date: Fri, 6 Sep 2024 21:08:31 +0000
Message-ID: <91573885f8c5bd6bdd3568e82d687a709f024200.camel@intel.com>
References: <20240906205609.3131330-1-lucas.demarchi@intel.com>
In-Reply-To: <20240906205609.3131330-1-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|DM6PR11MB4577:EE_
x-ms-office365-filtering-correlation-id: bc94f793-3ea3-4996-57e6-08dcceb80fdc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?amdheU9udUFmeFNFVTBhTG9xcUJCVkxuQndiSTgzUXNkWEVRWDdhVnJpMDMz?=
 =?utf-8?B?SGM1MTE1Mlg4V2tIdUgrNlVVeVhPR2pmYjZjcEhtVUtyTkt4eVZJY2hNK1VJ?=
 =?utf-8?B?cG9yblJWTWkvWGpyaHdQMW1mOHlyczJabEZJUFE4Tkx2d1JUQ1lkdVRkbjQ0?=
 =?utf-8?B?UmlySE5USmlKeDBrNEZ5QURmcnZMd3dEMzRBTTVnN0c1VHlTSTBkMlpCK1hG?=
 =?utf-8?B?eUk2YU5VbDE2V3cxbHpwekhoaHFIR2gwbC8wdzQxWXFLaEdOVytDZVpIRllL?=
 =?utf-8?B?VksydUFqYXFPZ0o1TWhLcVUrM3FhUHlTc1NqS0pRQ3FxMnlqRjhnTDR6Ty9i?=
 =?utf-8?B?NERjMEY3OXlablAyd0QrQUZ1WlRBV1hQMXg3N3J0TUdIQ1puLzI0UDdxS2hH?=
 =?utf-8?B?cjFWK01reHdYa29PekFIWFZ1Yks3K2kvdFltWkY4RHRJR2Jma0ZIYU5ld09i?=
 =?utf-8?B?MmJLaXNOL3Fnc2NXWkVCUEhDTjVxMm1JTzZFK0FGbmhFa1RHU0M3MlhZWDlS?=
 =?utf-8?B?U1VuM3ZmYjRNQXF6Y1NjVWRXWTBsalo2WURTY2ordkhZZG5kQzUxL0w2MFZQ?=
 =?utf-8?B?N2J6c2ZIWFRUNjBkRUcrODN0QXh0UkRTaHY4Wm1BdDhxWmlRaDdCTTVmZ1dz?=
 =?utf-8?B?cVFXMXdCKzJCaXhyWmMxcFZXbkNncUtKSGpzd0tlK1dMRGpqclF1WTFhSGFz?=
 =?utf-8?B?MGRZZjR4TzdiRFBRL1hPQ2lQL3RUKzVLUnBVdUlsWCt1SXNxeHl5MW80b2xQ?=
 =?utf-8?B?aDAzalhIOTBaQ1RzUGNQL2xWaFMzb0F0amRZKzFib2JyeWl4TGVVUDA4dURq?=
 =?utf-8?B?NlE3NWRESlFVZnVhdXJ5NndtQm1id3VrQS9BQ0NQQm1Rc3kyZTBFTjlUUHdG?=
 =?utf-8?B?cnZQdXNtcGwzZEhJNVpwUExIdVcvUnhiMU9RRGFheVNiT216VXBpQ3lHUHJP?=
 =?utf-8?B?dlRZb0laWVh2WVZFWHJtTUxOQmJIWHpDanRDeUVYN3hpazRzSGkrWjgxd1VN?=
 =?utf-8?B?Nk9QQ1d4NytWNWdCREFJYkg4VElQVjRQTGlqcHlQTFlLYVBVaVpXVkxkNzBI?=
 =?utf-8?B?Vnl3ZGM2K0paWkpocXZ0RWpyWEdZZXhuN1dudHZ1QnIyMWY1Rk5OakZVNDNP?=
 =?utf-8?B?VkhmUzFwKzRTQzIwUG9RYnVSWEpESVVRY1dqMmdEQmxWQlpzZTBMaDZEazFa?=
 =?utf-8?B?cmlXVGZRSThLRTFnQzB5ekZHNk9zMko0Z0NmSmZDdS8wUElrUW8zaVBxN2g5?=
 =?utf-8?B?b1I1cGMrWEJPMkljaXUwd1loNlRCa0NicllOR1hZTFY2M1YrbDVyQTFJaW9l?=
 =?utf-8?B?Skoza2JaMUFSWG1qTlJ3MXZsRUY1L1NCdjJ0TUZQbWx0czQxOXRTbWZRZDRW?=
 =?utf-8?B?dkVHUnZ6dVFUc045Mzh0T3BuaGZxNFd6WHZsOGVGNERIaW1LTTNZRTFkTktj?=
 =?utf-8?B?WjhrTXY2akdLb2gwQ0psVWRGcjRjQWRTOUJQb1FlSUFxbEJMNyswTGVZTDV6?=
 =?utf-8?B?MzlTWXNQZnJ3NU9IdW5kaFYvWEVsNkdqNGw0bGYrT2ZCK1BxWXRPY2xXY1Ex?=
 =?utf-8?B?ZndKZDFKS0FSSHliY2Z3RlNhMmZjak9CdVAweUZIRUdBSkx0aFBUNDVhK1RR?=
 =?utf-8?B?TXl4M3JZWlY0dzVWcGQ3NjNSaDh0MUhvZC8yVXV1d0t1STBueDJCZXdsaThy?=
 =?utf-8?B?bEtTMWpCaE1ramEwaVA3R0lZM3ppQW5rQnFld0ZsekVRODREdzZkS1dhTmRV?=
 =?utf-8?B?bnlJOEYzQWlXakZMbnJMa2tKbDdVZEJYOFc1TnNzTUJ1UmMwY0dkcXRINzdF?=
 =?utf-8?B?b0s2N2FuQ1cyOG9mS2ZWQWpUWmVySHpWUjVKb1FNTDNGbjVnVlZscm40dEh3?=
 =?utf-8?B?ZXYxWDFoelBNWDJVWG55VFQrUk9UN3VDTEpHb3RPRUp3QUE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UEJVT3lVYTY2amlOcG9TbDZUVmZESzcwOXZ4S1hkWHJFMWFQQzg1bXB2bW1w?=
 =?utf-8?B?YU9hcVd4S2NsMzB1TlRKUzkvL0RXeGcyZjRlWExnQ0NXSUtTQ2lhWUJNSUZh?=
 =?utf-8?B?N0g1SmloNTBMOFZIRjlKVVo5Wjk2RWxzNC9kUG1vQWRKMzluSldNcFRPYVNG?=
 =?utf-8?B?UWNSUXNIQ3VZSXRVYnBsc2Iwc1dkcjQyZmFQbkRua0Y2by9UM0d1U3N2RFov?=
 =?utf-8?B?Y1dmTE50Uk9kVTJIT0F3NEdUMGQ3cFZaSjEyUy9IZlNrRVJjcCtmNnNadEhX?=
 =?utf-8?B?aFVWdW9xbE15dUs1eWRrSmxiVHdnaU55UHRBa28ybHRydHZKVkE2OXhlZ3Fz?=
 =?utf-8?B?RnRiTjV4WHE0TkRaay9TVGp5UkxtK1YvZWVNMzlrT1A1dk1KWHdRbkFDZi8z?=
 =?utf-8?B?VWlDc2p4MHAzSmk2WHVYemltNVljWjhQQWo4dHJYZk9wZzNKMkp6QzdTSXd1?=
 =?utf-8?B?ZldiMXBNQWtXb29ab29TMDQ4R0ZGTWZEMm1YbXd2YUhUMmNpenl2eWwyTi9B?=
 =?utf-8?B?T0ZMSVhnS25YdjMvbEU3RnBySjhTYjMzOUl1UDhBNnJ2Uks5T1YvdDg3TUVh?=
 =?utf-8?B?bmlIeWpkY2gvVmRDYmJ4VG16OGRzZzg1K2d3UjdNTEJiamhiQU1WbGsxWWF4?=
 =?utf-8?B?Z2x2eEZ4OHVhSGlEaFo4SjZoOGJCVkUvMERrcnVTdFkxYUNkVUtYWkFZclcv?=
 =?utf-8?B?QXJOVHE4U29uOWFHd3A1R1FpQUJDbVI4WFJxaG5HbmZuaUV3VHJDK3I2eEcv?=
 =?utf-8?B?UFIwM1BCRENTeW5ONm1scXhUTnFVTUlVcGhJYzdTWlFIdnZ4YUhha2NSa0NQ?=
 =?utf-8?B?L2NNMHFmcE1COUdvSTI3WnBZRWdZdUV4WnV0MmJGZ1Iyd0Zuck1UQ216QXRy?=
 =?utf-8?B?NVV2eUlYODg4ZDQrTUdTNWpwKyt0dG9qd1k3T3drWGhiVmg0ME5hbDdvS3hE?=
 =?utf-8?B?Nlp3R2QvL1VqL3dya0plazVEeWVZaXYvSnQ0MVFCcGY2a1RzUGRzQTl0ZmRH?=
 =?utf-8?B?TERVZjFtai9jREhYelBJOE5FNHY1V3AvNE0rbnRTQndYbk1jZDVVWW1Wc25j?=
 =?utf-8?B?WWtXSHNQcTJLbXZ0VlpLOUg5T3hKcENNMGZyMzlVa1lpaUg3QjRZVmlLMGZm?=
 =?utf-8?B?OEFyVlpCcjRJVHF5TjNuK2FqRlpxbG1GaFlXR3BMSW9pcS9KTFY3WEJQOHky?=
 =?utf-8?B?dDczQU1xUXJ4K2ltdEpxRGk1WkJpQVZFYkt0WXExeE12Q1IrWC9RNE0xdmFP?=
 =?utf-8?B?bFVrU05OTnZIMm5WeGZmZXlyb1B6WlNlUjVOTTZUcUN3bVZaMmRsdWFYMlB5?=
 =?utf-8?B?NGNza3VtRmZVYnVkU2lWZkpoOG9JSkNydFFZcU5jbzJPZFBIL1RVdEZQZmR0?=
 =?utf-8?B?Q1ZhZ0lhbTcyZXVYdGZURWc3S0k2bnQ5clVEcnNMUGNIdWZ5OVV6aXdQTm81?=
 =?utf-8?B?Q1ppTGNSZnh5MUMrWGkvUk9xMzNxVTFseG5KL1Y4aG56dWY3RXNCZGVqMjBy?=
 =?utf-8?B?Q1duQ1VVQ2xIcjdQU0kyK1RQTVNsem5lYlRxOVFCRWFZYXg5bFh2NzdZM0Jw?=
 =?utf-8?B?aWFod002Z3hyeldnT0kwYldkRGJjdVF5elNTUlBCRDVKRlBzUUQyUHpnRCtj?=
 =?utf-8?B?bWdjM0NSZ1Q5MDkrK0dZYTB4Tnc5WFFaYnRzVjl3V09udFMxTVByTEZJcXdp?=
 =?utf-8?B?U205emxRdGNKenNXYjkyTVc1S2h0ZXdOOWlPemFEM1RTbzc0UjRmYlBSOXFm?=
 =?utf-8?B?N3FpVzVKQ2s5c0V1eTBtaUFGYk9nYlJXQzVyQzlRa2FBL3B1Z0h5blRtVk5T?=
 =?utf-8?B?WDkwUDVaYmtNZ0RyY0VJMjRPd0Q0dHNEZnNJQ1R3cnh5T0wyWGhLMFIzTUw3?=
 =?utf-8?B?dWFJbnJwaDZJeTVBS0JvMm9BL1lwNXlJNU1BOVZZYlZSTUp2VGFUcDhYelE2?=
 =?utf-8?B?blM5YTRub3NEdFpmcjF3V2hnVWd1d25pb2pBcFZDK3dqcEZ4bmlNSlMwT1ZM?=
 =?utf-8?B?bWx0L2JoRWFzQzRoN3FVYTNzek1NdVdJUmNGL1Njc0ROYUtCYWUyamtmdXdq?=
 =?utf-8?B?OG1jM3RDbUYxeFZIS1JKSmk0WkZiU04rOU1rV3pObkwzYWUxTWpGcXJmMzVo?=
 =?utf-8?B?ZVdmOFhLM0huZ3VGRmtCTEZMZDRvSGtFTjVrTXRyTEtrazFBZG5aRkI1MkdT?=
 =?utf-8?B?RlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E14F015785D3BD4897D5C0E537CC711E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc94f793-3ea3-4996-57e6-08dcceb80fdc
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2024 21:08:31.5074 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zmfQkE2/wwX6RQQV5sSC8GV19ijscAki5+B0ugww/7Zo9pTm7+ASmcXwLXdbrA6WmcVRq97bElI5F+AcJ5ZMqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4577
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

T24gRnJpLCAyMDI0LTA5LTA2IGF0IDEzOjU2IC0wNzAwLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6
DQo+IFdoZW4gcHJpbnRpbmcgPGRlYnVmcz4vZ3QqL2h3X2VuZ2luZXMsIGl0J3MgdXNlZnVsIHRv
IG1hcmsNCj4gd2hhdCBlbmdpbmVzIGFyZSByZXNlcnZlZCBzbyBpdCBkb2Vzbid0IG1pc2xlYWQg
ZGV2ZWxvcGVycw0KPiB3aGlsZSBkZWJ1Z2dpbmcuDQo+IA0KDQpSZXZpZXdlZC1ieTogSm9zw6kg
Um9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+DQoNCj4gQ2M6IEpvc8OpIFJv
YmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBM
dWNhcyBEZSBNYXJjaGkgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2
ZXJzL2dwdS9kcm0veGUveGVfaHdfZW5naW5lLmMgICAgICAgfCAzICsrKw0KPiAgZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2h3X2VuZ2luZV90eXBlcy5oIHwgMiArKw0KPiAgMiBmaWxlcyBjaGFuZ2Vk
LCA1IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfaHdfZW5naW5lLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZW5naW5lLmMNCj4gaW5k
ZXggYzljM2JlYjNjZThkLi5jZTE4MGZhZjI1OTIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9od19lbmdpbmUuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfaHdf
ZW5naW5lLmMNCj4gQEAgLTkwMyw2ICs5MDMsNyBAQCB4ZV9od19lbmdpbmVfc25hcHNob3RfY2Fw
dHVyZShzdHJ1Y3QgeGVfaHdfZW5naW5lICpod2UpDQo+ICAJc25hcHNob3QtPmZvcmNld2FrZS5y
ZWYgPSB4ZV9mb3JjZV93YWtlX3JlZihndF90b19mdyhod2UtPmd0KSwNCj4gIAkJCQkJCSAgICBo
d2UtPmRvbWFpbik7DQo+ICAJc25hcHNob3QtPm1taW9fYmFzZSA9IGh3ZS0+bW1pb19iYXNlOw0K
PiArCXNuYXBzaG90LT5rZXJuZWxfcmVzZXJ2ZWQgPSB4ZV9od19lbmdpbmVfaXNfcmVzZXJ2ZWQo
aHdlKTsNCj4gIA0KPiAgCS8qIG5vIG1vcmUgVkYgYWNjZXNzaWJsZSBkYXRhIGJlbG93IHRoaXMg
cG9pbnQgKi8NCj4gIAlpZiAoSVNfU1JJT1ZfVkYoZ3RfdG9feGUoaHdlLT5ndCkpKQ0KPiBAQCAt
MTAyNSw2ICsxMDI2LDggQEAgdm9pZCB4ZV9od19lbmdpbmVfc25hcHNob3RfcHJpbnQoc3RydWN0
IHhlX2h3X2VuZ2luZV9zbmFwc2hvdCAqc25hcHNob3QsDQo+ICAJCSAgIHNuYXBzaG90LT5sb2dp
Y2FsX2luc3RhbmNlKTsNCj4gIAlkcm1fcHJpbnRmKHAsICJcdEZvcmNld2FrZTogZG9tYWluIDB4
JXgsIHJlZiAlZFxuIiwNCj4gIAkJICAgc25hcHNob3QtPmZvcmNld2FrZS5kb21haW4sIHNuYXBz
aG90LT5mb3JjZXdha2UucmVmKTsNCj4gKwlkcm1fcHJpbnRmKHAsICJcdFJlc2VydmVkOiAlc1xu
IiwNCj4gKwkJICAgc3RyX3llc19ubyhzbmFwc2hvdC0+a2VybmVsX3Jlc2VydmVkKSk7DQo+ICAJ
ZHJtX3ByaW50ZihwLCAiXHRIV1NUQU06IDB4JTA4eFxuIiwgc25hcHNob3QtPnJlZy5yaW5nX2h3
c3RhbSk7DQo+ICAJZHJtX3ByaW50ZihwLCAiXHRSSU5HX0hXU19QR0E6IDB4JTA4eFxuIiwgc25h
cHNob3QtPnJlZy5yaW5nX2h3c19wZ2EpOw0KPiAgCWRybV9wcmludGYocCwgIlx0UklOR19FWEVD
TElTVF9TVEFUVVM6IDB4JTAxNmxseFxuIiwNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9od19lbmdpbmVfdHlwZXMuaCBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdp
bmVfdHlwZXMuaA0KPiBpbmRleCA4YmU2ZDQyMGVjZTQuLmJlNjBlZGIzZTY3MyAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2VuZ2luZV90eXBlcy5oDQo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmVfdHlwZXMuaA0KPiBAQCAtMTczLDYgKzE3Myw4
IEBAIHN0cnVjdCB4ZV9od19lbmdpbmVfc25hcHNob3Qgew0KPiAgCX0gZm9yY2V3YWtlOw0KPiAg
CS8qKiBAbW1pb19iYXNlOiBNTUlPIGJhc2UgYWRkcmVzcyBvZiB0aGlzIGh3IGVuZ2luZSovDQo+
ICAJdTMyIG1taW9fYmFzZTsNCj4gKwkvKiogQGtlcm5lbF9yZXNlcnZlZDogRW5naW5lIHJlc2Vy
dmVkLCBjYW4ndCBiZSB1c2VkIGJ5IHVzZXJzcGFjZSAqLw0KPiArCWJvb2wga2VybmVsX3Jlc2Vy
dmVkOw0KPiAgCS8qKiBAcmVnOiBVc2VmdWwgTU1JTyByZWdpc3RlciBzbmFwc2hvdCAqLw0KPiAg
CXN0cnVjdCB7DQo+ICAJCS8qKiBAcmVnLnJpbmdfZXhlY2xpc3Rfc3RhdHVzOiBSSU5HX0VYRUNM
SVNUX1NUQVRVUyAqLw0KDQo=

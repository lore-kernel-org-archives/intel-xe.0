Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF6AE909D9
	for <intel-xe@archiver.kernel.org>; Tue, 17 Feb 2026 16:44:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D75510E51F;
	Tue, 17 Feb 2026 16:44:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JtxJpoJu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B05B10E518
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Feb 2026 16:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771346669; x=1802882669;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=R6j8MzldiWKXGQ5r6z9ibWF76sGPVJZKbGVZrJDkY6A=;
 b=JtxJpoJuJZ31/exwZqNi8xx4E/NrwSia31vzXR7OW7iAEXTRatxYajH4
 hVWHOmbP4cuYywgZ02Zgh/8iz8Vy81hIY5BG/vwCDk5d+p9jADeAuhkQj
 UnqzfT8tgEOMhk/IpE6vPD5jfrfamGmTrQ45+UaBwrRv3vyGDA+941sH9
 UH6fpIwdHJDBfEBXDwkEPpPxJ1alxEwX2M8vI6QRDsi9LzoVjOqhyC7NQ
 HLmUMcvihMlVi5rMqUmx1A0v7No5E1iIXqE6xOHJl0AVRFFNl2xc2t03D
 0DSZzqFeWByMMkv3ZEgnzNUDiZeD36d8eQ+1QQV65ia0/RU66CgM6jOru w==;
X-CSE-ConnectionGUID: bqw5njwUQhuzYcsJ/je65w==
X-CSE-MsgGUID: iu3iO0K4TBOCY5iqo5ZUFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="83520483"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; d="scan'208";a="83520483"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 08:44:28 -0800
X-CSE-ConnectionGUID: zAEeVy4RSJKQZ6BnZuioxQ==
X-CSE-MsgGUID: l97KDKy/SheYRf2d72Mcqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; d="scan'208";a="218934987"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 08:44:28 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 08:44:27 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 17 Feb 2026 08:44:27 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.66) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 08:44:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B/su/Ks3i3to/okOTO+ZD6ZeYgrivp6/vCmAhbJpDVgKISsmzp+ueP0uT70Ouc8cp5QjWarbGUfEXveCy7oJCsjxzjudEwWfpaTXD+ueFjz+ApOKNQTmUjqLhfHGJtIHPLbphraPmX2E/Z34z8I55MjUQ0xAb3Fy/E6SDQas6Bw9k/wbonod2caKGFXYEayAxeG7EAPltWHHyhzk2IfKsoIAUKMfUvpe6TtbFWVOACLaIvBCEpHZh8yBdMSRFLnGYP32RUEPqQpsqb76Ec2N+2mvwYbRy8y3NkCTLWqYuLkIBfG/43W5N7mvGG5c5rAh2IWC+XKomAKU53/f7uKXnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VjxZ99nw/EezWtYE+LKiPKN6MZz96J3RSTHdlv4qdvk=;
 b=b5W/oe3F0VbXAiNs+nNYZQ5Ujh6AKBVPJ4WHNitL2hzmdnvUaqfLffHp8oRJz1Br8WY8YQ8DTXn8b5RyaA5836wSs+FxAq4741ac+y5mw0ii8olz8Ln+XZa+KpG8RU5iaV7sczO2H3xZspsLxQUCRrC1MVu76YkwIhqMkDsriWE2zNg3MiC+Esn0cceWLBahBiLM0uC/xBXYw3lmB9mYoTcUMkwnBDfmGr1a0Wl82J6IJTRn6glUBghqteVd6Vq5X1oLbBJQRY6RdoRqEi3oxGupVJxoeAdXXYefN7Ussfpwkw3i5J1sZ1ASD5hk3bcuZeLonYIAYnuOSZ8vd5SuzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN2PR11MB4552.namprd11.prod.outlook.com (2603:10b6:208:263::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 16:44:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9611.013; Tue, 17 Feb 2026
 16:44:20 +0000
Date: Tue, 17 Feb 2026 08:44:18 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <francois.dugast@intel.com>,
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe: Split H2G and G2H into separate buffer
 objects
Message-ID: <aZSa4slBRwb6Hvmb@lstrano-desk.jf.intel.com>
References: <20260213211625.3117729-1-matthew.brost@intel.com>
 <20260213211625.3117729-2-matthew.brost@intel.com>
 <7da8eddd-9fe9-4e7d-9133-34b7ed9605a5@intel.com>
 <aY/H1RKHSPJBlw/w@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aY/H1RKHSPJBlw/w@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR04CA0147.namprd04.prod.outlook.com
 (2603:10b6:303:84::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN2PR11MB4552:EE_
X-MS-Office365-Filtering-Correlation-Id: 454cef29-6c75-48a3-e8da-08de6e43cc57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?LytOck52ejhXbkJUR2ZpenlCbDNiYTREUjZWbCs5d05MeUR2a0w3K2VianU1?=
 =?utf-8?B?Z0x2UHlES0k5U2xOeld4cnpzK2pDdjBzR3pDUU1NaVhpbEhydjkrUkxZNGJH?=
 =?utf-8?B?WSt0ZkhYMDJRazlsbWx5ZW5CejhoVEFQV0VucWY1U3p5RDJVSFloS3dJYkZx?=
 =?utf-8?B?Z2lCY0xjUU5XT2FLa1BhWG1xTUV0SUhnb3pvV1lCdGI0NnlkVDREMG8zSkpO?=
 =?utf-8?B?aEFtbDV1R0tIbEQrTXdZUzMrOWp1RnRERXQrUzl2ZlgyNWgrZjNKV282M2p3?=
 =?utf-8?B?bGErUkFBMHByMU9FZlpENkt3MFNkWkpkZE9Md200b2FHQ29SckYyNWpJM3lS?=
 =?utf-8?B?OXF6N3RmQ0lIV3ZjR1Fwa3VudUk4ZjJnZGpKK1UwaWlkR0NCTG9Pa1l4OFFy?=
 =?utf-8?B?QTdXbTcreEk5WFh2LzE0SmVaWGhSa1JKWFVLeGowZjhmRE9oZlcyaENLNWhN?=
 =?utf-8?B?bHk4L2pIazZpL05zajlaTktGSlgwSHZrQ1BXS1pYb2RuRkh2V3kwaENzL1hT?=
 =?utf-8?B?Vk0zRnVyK0MrUmIzSnNEYTU5eVVtaWg1ZWpwazBUQnUxdGtTbFFpMU1VK29J?=
 =?utf-8?B?Ry9ZTDg4V0FpY3p3OVRIM244ZzlXNVpkYWhXdWpvUmx0YjJNayttZTBKUXFy?=
 =?utf-8?B?cUxmelhibkRQNWt5dEw0bDhwQTliSWM1alZiaTV0MDArN2E0aEpnSDYvQmFt?=
 =?utf-8?B?R2tLRWFtV1FBMDFyOWJVV0puWkVPUDV0a1k2enllNHdwZzFkTk5penVpWDNU?=
 =?utf-8?B?Rzg5ZE9sV24xSUtCUVlPa1VFam05YTFaMHMwTnpzVnE4aWlqSi9VamJMMkhk?=
 =?utf-8?B?OGpyVlRlajl2QzNyR3Z3bTNMSmd6cHEvNWtzOHZXTG5GaFdveUhHL3BXLzVq?=
 =?utf-8?B?L1hnRzQ4SVdUei9PMWszcTIzUFYranVlcm5BejZOUGNUUEtqYUpGNktXcTBQ?=
 =?utf-8?B?Z3BTOCtoTGZyRGszU0RzUFY0RW5SS2kxMkcxeVZ3Qm9YVU9SRFp6a0xsWC9v?=
 =?utf-8?B?azNsYktnV1VEM1hHa1kxQy9IUlhEeWY2MCswYU9aa1JvamwxWmFvcmNJanlB?=
 =?utf-8?B?MEhrVjVSdC9iam9IRDlUbUJYa3hjS1JtYUU3QWtEQ0xSR2dhUVk3VE01c2hU?=
 =?utf-8?B?V0xGZmd6blh5SVc1VFgrYzNmRTRJS1dsZEIwUVcvRmRnbE13QTVJc01zeDdZ?=
 =?utf-8?B?S3ZOWjNhcDdINjJkKzVDRW9tdUtTeW5DTHhFZHdqYnZOUTI1RkZEWi9uM3lO?=
 =?utf-8?B?V1lXdTVRS1o5a0MrcmtZR21ZUEFmSytORXpMTUFnZ0lHRGkxaE14TGlOR1NQ?=
 =?utf-8?B?b2dQKzRHUmlTQXRjSWp6eEc1bWJjT0tFT3ByUXdZTUlJRDVLSXhpUDh3VkJF?=
 =?utf-8?B?UTc1eE0zSjdWM3dmZ3ZsUVk4OEp2S3puZVlvalJkc3h0aEg2akJBVnNPZlRQ?=
 =?utf-8?B?VUJjMlFSeTdpTkxmNU1vejJ3cmk4NVJVdHZLNmVuaDJhcEZObk14NVBKZ1hl?=
 =?utf-8?B?TnVaa1FzWVNQNFBEakg2UmE3cXBmV3pCSHBuZHhCNGdwN0xxSURuTmYzaDBR?=
 =?utf-8?B?QmExNUpLYTRlWnhSbFh5U2cxT1UvS2Rya3VSK1pGbDNBOE02WTg2dWJtaHlr?=
 =?utf-8?B?QlJvVEN3RnJJSWtUOVZOZWZ5VFFra1FIZWJ0MkVZRkdwUTZEMDJISU9PbGY3?=
 =?utf-8?B?UDlkb0VFWldSL3dOMFNQeXQvcGoySFRpbGg5Z3NHOW1TdkwxUzlzTC9NQjJj?=
 =?utf-8?B?V3FEa3ljSXI2SmdxcmlTd2JOL0hsUTV4SjF6L1FDN21DQzgyU0xIQ3BRSzIv?=
 =?utf-8?B?dDhrVXJva1RyNk9Sa0d3ajBERFRzU1RpRlpxRTJ0VHdJUndBVHh0UWJCWXg1?=
 =?utf-8?B?dkdPVXl2VUttYTBqR09vK1hIbCtTUFc3NjRsdEhCMmJiSi9lSzVjeVRzZDkx?=
 =?utf-8?B?aTVDWWRTWWFFdVhSNEtSRzFCUFZEOHV6clg4U2IrMTRIdkZrVmE5a2srMWdH?=
 =?utf-8?B?ZXpoOTB3RTZKaGs1RTlNTDU2SXowb1Exd0dVMGJseTBYRUtMZnlUUUtjenJh?=
 =?utf-8?B?N0UvUmFKcERPdDZneVJ2NFJpQUJ0cldVYWlET1lMekRoR25LRVFVSWY5WXR0?=
 =?utf-8?Q?Jr2s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2g1SnQ5MnBZcWtadWFSUEhGSGxkRk5Tc3QxR2RrRUtCV0dxVXBTVEJuV3hK?=
 =?utf-8?B?dFJiL1BGckQ0MjFlYWw3cEQvWUhqdGg0dzJMYndBZDNlRFlqM291bUNrZmV6?=
 =?utf-8?B?NmdlMndtV0ZMeDZsdUdkcTBnNFEwYVNPY0tEZGFhRkc4S0FmR3pacGc2VDh0?=
 =?utf-8?B?WkFEeDhwNFBnVllXQUdSOWZjbEIwUkNEdklNakRKMHNvb0R1STg1T3dHTjZw?=
 =?utf-8?B?WWRJQTNRL05CQVFZOHlVSlY2bUxQM3BqaElqb1BCTmJpQnIzWGcyTHpqTGtL?=
 =?utf-8?B?aFZoL1ZnMzI4dmFBR0NXN2oxRUVTZzZYeXU1QklxNzNScEpVdjM4Q3JldFhs?=
 =?utf-8?B?N2lQVnZadXppd3lnME44MjVodnduRkhlUU5yRDk4VC9JQm5pUFRiWFlLUzY0?=
 =?utf-8?B?M2xFYnYveUlkZWljRk5rL3BTOW5HSVdvMUdxQi9zZzlFdzFjd1dEZWc0RGph?=
 =?utf-8?B?T3FBTXc0L1VLUTZWTTdzVzFYRmVTak5rT24wdDR0and3SmRQVi9ZbWlRV2Jo?=
 =?utf-8?B?QUtTcDY3dWo0RXFNNjNlRUZOazhIckw5QVZYYzZta3ZYaGZ2cUNiekhlenYx?=
 =?utf-8?B?Y2JKdnhMcmdoNU1qS05PRnVqL1QxOTdjRWJFMVp2cWcxbnRQUk9SZUNNODJq?=
 =?utf-8?B?a0RPU3RCM0ZvbkE5eFRONUN4NDFoSjFTYzBZdmcxR2VvUndISTZlSUhwRi9O?=
 =?utf-8?B?REN3THIrcnRaNDBnVnQ5VmFESldOZERpVG1BQktzWDhuYW9GYU1tTlZmbnJ1?=
 =?utf-8?B?THRzeGk3RHhKbHd2SE1JV0JYN09lcW5uV3R1UWZQcTJsMWdYK3ZsSXNyZ2kr?=
 =?utf-8?B?N01PWm56U0Z0YmE4WFJ3bDBIZUpySmVxKzYrM3ZxT3Jhd1QzaDU0K0k1SEIw?=
 =?utf-8?B?QnQrcmtWSEZvSitwZDF1TzgvTzJJSCtDYStPNU5ValN4b0tmaWN1Yjc0NTdY?=
 =?utf-8?B?bEdHMjFhdXdweHhxTlhyN2R5YmN2azEvWWlHaGJWMHFyZ053Yng4UWJMMytm?=
 =?utf-8?B?QTYwMUlGcmkwQzRMVWFjNW9DZFlLRWxBZkVIMEVkdTQyWE9Jb2dhdnRaUlV1?=
 =?utf-8?B?V0pKZE16Y2tQUlFjOFp0TmNXTzNDTHdjbExYWWlnNDNjVTl0TEUzUEs2UFgy?=
 =?utf-8?B?YkUvQllLVHNzQ1pZNjNZOE1OWWlIbGJNKzRxTVE4dk95QW9PVEhiRzgzYlI1?=
 =?utf-8?B?WFdHbzMxWXpHZWw3YllGK2puS0ZCNWNuUm5lY2ZmS1YzRlZ1ei9mdU1lUlBT?=
 =?utf-8?B?RlhxblY3YU1vQnh1a204em9aY2tRemlPTlhQS3VaTzcrMjM2SjdJMVFDakcz?=
 =?utf-8?B?K3p4eXg0NW0vZ3FQQm4wMlloS0UyaENzU0RianVMWWZtTkNqZHBxSUh2cklR?=
 =?utf-8?B?NEJqS3R5TjVyT0wvd3U1Qm05YURVL3Fvd1hpK0Q1V21jM0ZyaVU3ODZkVUtk?=
 =?utf-8?B?OGlwZm5VTlNHWUt2Y1RLK0lWKzZNSTdTSnBzd28yNmI0QS9CRnNnKzBQdHJI?=
 =?utf-8?B?cUZVdU02dFZlVGNzSUEzL3dwTTBkVkU0Z1E2T1VCYzMrVzBtb1pLUXB2TFpr?=
 =?utf-8?B?dW5HS2FHcWVScTI3SFgwTHFhaEp4NzQ3OXpVNDFaT2Y0NGZlUjBsb0RSTjdE?=
 =?utf-8?B?NUJCaFprK3NBUVBYOEZCZXhyWGlGeGhhMkFUYzBaeWJpZjRXSVIyMitmd2Ju?=
 =?utf-8?B?N0dwU3NLRS9ETTdzdzFZU25mYnVoT1V4KzVjdWFkdWxtdUM5bERkSWI4U3A0?=
 =?utf-8?B?ZzkxVFViTjZ1RXVZZlhKS3BneTZRTXIrTTIyMm8ybzZZeE5WaFVvYzRGa1BM?=
 =?utf-8?B?Y2ZCNmZ0WFBvbEZCQkxKUTdXdHNUZVAvT25yUVpTc29uRFcwMUlEMnp6Sklv?=
 =?utf-8?B?Ukp3NnpLMTVkUUhOTXF6cy9PNklxcmZuUy9sRHBwVm9RYXF5YkRvWWlNRWtL?=
 =?utf-8?B?dTVGZ2ppbFBHUnYveHc4S1JUUjZvRi9qbkRYc0RuY3o1NlJhcmJZemhCRDV4?=
 =?utf-8?B?bWZPVDlkeXpRaUR3V2g4OHJjSU1Gb3VXOUV4TTlQUkdxMnVIUENXVmZTendD?=
 =?utf-8?B?M3RWTDlqMHhheUNIQWc3d0dwMFBJR2kzRGc4bzBuaTk3L3hzZzNCNXNFZmgx?=
 =?utf-8?B?SlBFZjZPSjlZOFF3ei9kdkQwdFlJbG1vdzVHL1hRWkVLMU0yS2w4ZTc2YjYx?=
 =?utf-8?B?Y2NIQms5dCtJR0xFVWFxUy9mcElhRm5SOWtQZElLRG82bVRlanFGaDU5U0dM?=
 =?utf-8?B?RlhmcGY4ZFNOUGVCa05MRnBSQ1hCdDJaRlMrcm5ZODVEVlRybjhYYjNIbFFq?=
 =?utf-8?B?b2VSOGlOZXBxNVpMTzhGYW5ra2J5c2FWZ2xURlp3VDcwOXhmdmpUdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 454cef29-6c75-48a3-e8da-08de6e43cc57
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 16:44:20.5455 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w90xzqaNeCK6ed1tmlIeJWVVTwundy8dTPwt7ge6sJFFeCsA9R4gUw560LnulFk5vyIeUvOz7JZCr4ZlwyA5Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4552
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

On Fri, Feb 13, 2026 at 04:54:45PM -0800, Matthew Brost wrote:
> On Fri, Feb 13, 2026 at 11:55:14PM +0100, Michal Wajdeczko wrote:
> > 
> > 
> > On 2/13/2026 10:16 PM, Matthew Brost wrote:
> > > H2G and G2H buffers have different access patterns (H2G is CPU-write,
> > > GuC-read, while G2H is GPU-write, CPU-read). On dGPU, these patterns
> > > benefit from different memory placements: H2G in VRAM and G2H in system
> > > memory. Split the CT buffer into two separate buffers—one for H2G and
> > > one for G2H—and select the optimal placement for each.
> > > 
> > > This provides a significant performance improvement on the G2H read
> > > path, reducing a single read from ~20 µs to under 1 µs on BMG.
> > > 
> > > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_guc_ct.c       | 66 ++++++++++++++++++----------
> > >  drivers/gpu/drm/xe/xe_guc_ct_types.h |  6 ++-
> > >  2 files changed, 48 insertions(+), 24 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > index 8a45573f8812..6a96bea40720 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > @@ -255,6 +255,7 @@ static bool g2h_fence_needs_alloc(struct g2h_fence *g2h_fence)
> > >  
> > >  #define CTB_DESC_SIZE		ALIGN(sizeof(struct guc_ct_buffer_desc), SZ_2K)
> > >  #define CTB_H2G_BUFFER_OFFSET	(CTB_DESC_SIZE * 2)
> > > +#define CTB_G2H_BUFFER_OFFSET	(CTB_DESC_SIZE * 2)
> > >  #define CTB_H2G_BUFFER_SIZE	(SZ_4K)
> > >  #define CTB_H2G_BUFFER_DWORDS	(CTB_H2G_BUFFER_SIZE / sizeof(u32))
> > >  #define CTB_G2H_BUFFER_SIZE	(SZ_128K)
> > > @@ -279,10 +280,14 @@ long xe_guc_ct_queue_proc_time_jiffies(struct xe_guc_ct *ct)
> > >  	return (CTB_H2G_BUFFER_SIZE / SZ_4K) * HZ;
> > >  }
> > >  
> > > -static size_t guc_ct_size(void)
> > > +static size_t guc_h2g_size(void)
> > >  {
> > > -	return CTB_H2G_BUFFER_OFFSET + CTB_H2G_BUFFER_SIZE +
> > > -		CTB_G2H_BUFFER_SIZE;
> > > +	return CTB_H2G_BUFFER_OFFSET + CTB_H2G_BUFFER_SIZE;
> > > +}
> > > +
> > > +static size_t guc_g2h_size(void)
> > > +{
> > > +	return CTB_G2H_BUFFER_OFFSET + CTB_G2H_BUFFER_SIZE;
> > >  }
> > >  
> > >  static void guc_ct_fini(struct drm_device *drm, void *arg)
> > > @@ -311,7 +316,8 @@ int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct)
> > >  	struct xe_gt *gt = ct_to_gt(ct);
> > >  	int err;
> > >  
> > > -	xe_gt_assert(gt, !(guc_ct_size() % PAGE_SIZE));
> > > +	xe_gt_assert(gt, !(guc_h2g_size() % PAGE_SIZE));
> > > +	xe_gt_assert(gt, !(guc_g2h_size() % PAGE_SIZE));
> > 
> > nit: maybe it's time to use SZ_4K here instead of PAGE_SIZE?
> > 
> 
> Not a nit actually, this is a correctness thing and SZ_4K is correct or
> XE_PAGE_SIZE. 
> 

On second thought - PAGE_SIZE is right here as these are CPU mapped.
There is an existing bug here for non-x86 CPUs with non-4k PAGE_SIZE
(currently unsupported). This a seperate issue and as this is a fixes,
I'd like to fix this up in follow up.

Matt 

> > >  
> > >  	err = drmm_mutex_init(&xe->drm, &ct->lock);
> > >  	if (err)
> > > @@ -356,7 +362,17 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
> > >  	struct xe_tile *tile = gt_to_tile(gt);
> > >  	struct xe_bo *bo;
> > 
> > nit: can we drop this local var and assign bo to ct struct members directly ?
> > 
> 
> Yes.
> 
> > >  
> > > -	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ct_size(),
> > > +	bo = xe_managed_bo_create_pin_map(xe, tile, guc_h2g_size(),
> > > +					  XE_BO_FLAG_SYSTEM |
> > > +					  XE_BO_FLAG_GGTT |
> > > +					  XE_BO_FLAG_GGTT_INVALIDATE |
> > > +					  XE_BO_FLAG_PINNED_NORESTORE);
> > > +	if (IS_ERR(bo))
> > > +		return PTR_ERR(bo);
> > > +
> > > +	ct->bo_h2g = bo;
> > > +
> > > +	bo = xe_managed_bo_create_pin_map(xe, tile, guc_g2h_size(),
> > >  					  XE_BO_FLAG_SYSTEM |
> > >  					  XE_BO_FLAG_GGTT |
> > >  					  XE_BO_FLAG_GGTT_INVALIDATE |
> > > @@ -364,7 +380,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
> > >  	if (IS_ERR(bo))
> > >  		return PTR_ERR(bo);
> > >  
> > > -	ct->bo = bo;
> > > +	ct->bo_g2h = bo;
> > >  
> > >  	return devm_add_action_or_reset(xe->drm.dev, guc_action_disable_ct, ct);
> > >  }
> > > @@ -389,7 +405,7 @@ int xe_guc_ct_init_post_hwconfig(struct xe_guc_ct *ct)
> > >  	xe_assert(xe, !xe_guc_ct_enabled(ct));
> > >  
> > >  	if (IS_DGFX(xe)) {
> > > -		ret = xe_managed_bo_reinit_in_vram(xe, tile, &ct->bo);
> > > +		ret = xe_managed_bo_reinit_in_vram(xe, tile, &ct->bo_h2g);
> > >  		if (ret)
> > >  			return ret;
> > >  	}
> > > @@ -439,8 +455,7 @@ static void guc_ct_ctb_g2h_init(struct xe_device *xe, struct guc_ctb *g2h,
> > >  	g2h->desc = IOSYS_MAP_INIT_OFFSET(map, CTB_DESC_SIZE);
> > >  	xe_map_memset(xe, &g2h->desc, 0, 0, sizeof(struct guc_ct_buffer_desc));
> > >  
> > > -	g2h->cmds = IOSYS_MAP_INIT_OFFSET(map, CTB_H2G_BUFFER_OFFSET +
> > > -					    CTB_H2G_BUFFER_SIZE);
> > > +	g2h->cmds = IOSYS_MAP_INIT_OFFSET(map, CTB_G2H_BUFFER_OFFSET);
> > >  }
> > >  
> > >  static int guc_ct_ctb_h2g_register(struct xe_guc_ct *ct)
> > > @@ -449,8 +464,8 @@ static int guc_ct_ctb_h2g_register(struct xe_guc_ct *ct)
> > >  	u32 desc_addr, ctb_addr, size;
> > >  	int err;
> > >  
> > > -	desc_addr = xe_bo_ggtt_addr(ct->bo);
> > > -	ctb_addr = xe_bo_ggtt_addr(ct->bo) + CTB_H2G_BUFFER_OFFSET;
> > > +	desc_addr = xe_bo_ggtt_addr(ct->bo_h2g);
> > > +	ctb_addr = xe_bo_ggtt_addr(ct->bo_h2g) + CTB_H2G_BUFFER_OFFSET;
> > >  	size = ct->ctbs.h2g.info.size * sizeof(u32);
> > >  
> > >  	err = xe_guc_self_cfg64(guc,
> > > @@ -476,9 +491,8 @@ static int guc_ct_ctb_g2h_register(struct xe_guc_ct *ct)
> > >  	u32 desc_addr, ctb_addr, size;
> > >  	int err;
> > >  
> > > -	desc_addr = xe_bo_ggtt_addr(ct->bo) + CTB_DESC_SIZE;
> > > -	ctb_addr = xe_bo_ggtt_addr(ct->bo) + CTB_H2G_BUFFER_OFFSET +
> > > -		CTB_H2G_BUFFER_SIZE;
> > > +	desc_addr = xe_bo_ggtt_addr(ct->bo_g2h) + CTB_DESC_SIZE;
> > > +	ctb_addr = xe_bo_ggtt_addr(ct->bo_g2h) + CTB_G2H_BUFFER_OFFSET;
> > >  	size = ct->ctbs.g2h.info.size * sizeof(u32);
> > >  
> > >  	err = xe_guc_self_cfg64(guc,
> > > @@ -605,9 +619,12 @@ static int __xe_guc_ct_start(struct xe_guc_ct *ct, bool needs_register)
> > >  	xe_gt_assert(gt, !xe_guc_ct_enabled(ct));
> > >  
> > >  	if (needs_register) {
> > > -		xe_map_memset(xe, &ct->bo->vmap, 0, 0, xe_bo_size(ct->bo));
> > > -		guc_ct_ctb_h2g_init(xe, &ct->ctbs.h2g, &ct->bo->vmap);
> > > -		guc_ct_ctb_g2h_init(xe, &ct->ctbs.g2h, &ct->bo->vmap);
> > > +		xe_map_memset(xe, &ct->bo_h2g->vmap, 0, 0,
> > > +			      xe_bo_size(ct->bo_h2g));
> > > +		xe_map_memset(xe, &ct->bo_g2h->vmap, 0, 0,
> > > +			      xe_bo_size(ct->bo_g2h));
> > > +		guc_ct_ctb_h2g_init(xe, &ct->ctbs.h2g, &ct->bo_h2g->vmap);
> > > +		guc_ct_ctb_g2h_init(xe, &ct->ctbs.g2h, &ct->bo_g2h->vmap);
> > >  
> > >  		err = guc_ct_ctb_h2g_register(ct);
> > >  		if (err)
> > > @@ -624,7 +641,7 @@ static int __xe_guc_ct_start(struct xe_guc_ct *ct, bool needs_register)
> > >  		ct->ctbs.h2g.info.broken = false;
> > >  		ct->ctbs.g2h.info.broken = false;
> > >  		/* Skip everything in H2G buffer */
> > > -		xe_map_memset(xe, &ct->bo->vmap, CTB_H2G_BUFFER_OFFSET, 0,
> > > +		xe_map_memset(xe, &ct->bo_h2g->vmap, CTB_H2G_BUFFER_OFFSET, 0,
> > >  			      CTB_H2G_BUFFER_SIZE);
> > >  	}
> > >  
> > > @@ -1963,8 +1980,9 @@ static struct xe_guc_ct_snapshot *guc_ct_snapshot_alloc(struct xe_guc_ct *ct, bo
> > >  	if (!snapshot)
> > >  		return NULL;
> > >  
> > > -	if (ct->bo && want_ctb) {
> > > -		snapshot->ctb_size = xe_bo_size(ct->bo);
> > > +	if (ct->bo_h2g && ct->bo_g2h && want_ctb) {
> > > +		snapshot->ctb_size = xe_bo_size(ct->bo_h2g) +
> > > +			xe_bo_size(ct->bo_g2h);
> > >  		snapshot->ctb = kmalloc(snapshot->ctb_size, atomic ? GFP_ATOMIC : GFP_KERNEL);
> > >  	}
> > >  
> > > @@ -2012,8 +2030,12 @@ static struct xe_guc_ct_snapshot *guc_ct_snapshot_capture(struct xe_guc_ct *ct,
> > >  		guc_ctb_snapshot_capture(xe, &ct->ctbs.g2h, &snapshot->g2h);
> > >  	}
> > >  
> > > -	if (ct->bo && snapshot->ctb)
> > > -		xe_map_memcpy_from(xe, snapshot->ctb, &ct->bo->vmap, 0, snapshot->ctb_size);
> > > +	if (ct->bo_h2g && ct->bo_g2h && snapshot->ctb) {
> > > +		xe_map_memcpy_from(xe, snapshot->ctb, &ct->bo_h2g->vmap, 0,
> > > +				   xe_bo_size(ct->bo_h2g));
> > > +		xe_map_memcpy_from(xe, snapshot->ctb + xe_bo_size(ct->bo_h2g),
> > > +				   &ct->bo_g2h->vmap, 0, xe_bo_size(ct->bo_g2h));
> > > +	}
> > >  
> > >  	return snapshot;
> > >  }
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> > > index 09d7ff1ef42a..385a607e4777 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> > > @@ -126,8 +126,10 @@ struct xe_fast_req_fence {
> > >   * for the H2G and G2H requests sent and received through the buffers.
> > >   */
> > >  struct xe_guc_ct {
> > > -	/** @bo: Xe BO for CT */
> > > -	struct xe_bo *bo;
> > > +	/** @bo_h2g: Xe BO for H2G */
> > > +	struct xe_bo *bo_h2g;
> > > +	/** @bo_g2h: Xe BO for G2H */
> > > +	struct xe_bo *bo_g2h;
> > 
> > since we already have h2g and g2h:
> > 
> > 	struct {
> > 		/** @ctbs.send: Host to GuC (H2G, send) channel */
> > 		struct guc_ctb h2g;
> > 		/** @ctbs.recv: GuC to Host (G2H, receive) channel */
> > 		struct guc_ctb g2h;
> > 	} ctbs;
> > 
> > maybe just add .bo member to struct guc_ctb?
> > 
> 
> I thought about this, was trying to keep the diff to minimum for fixes
> but moving it there is likely fine.
> 
> Matt
> 
> > 
> > >  	/** @lock: protects everything in CT layer */
> > >  	struct mutex lock;
> > >  	/** @fast_lock: protects G2H channel and credits */
> > 

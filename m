Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC6ABC83F26
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 20:11:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E91710E11D;
	Wed, 30 Jul 2025 20:11:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gu/qUf6U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6503510E11D
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 20:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753906266; x=1785442266;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SBLwf2ZSTja5Yb9fuQxs0BlGlPVQmY7hN+rmLemP7jI=;
 b=gu/qUf6U83k7koWKRoTLB9/vfsEvslde1q3sgwZF3WkuU6G2otL1gt2B
 3xbO2ZSsR3/xoa2yWEsuaPAd+y32Oh78gfJp9YL+sHPoeq2gFBxroi615
 CS9QxgVF9qP82dBC49L5luYDtsnG4EgogxhHTtPy6JFtMoDbdm+qFpald
 KzXZUPFcNFKyEEim7tMI1KM4w9xcifACeviVlzpszyA4wb5b88dxEBWum
 Q49kP4oOibZESKAi52CsHz1HQXVYlZMwTDNZToxcLIUPianwAE3OVxCos
 D0G37Z4X0yO1rexhJqMmyul+uWotA1T+1KCWS9q5EuITJiZBUZi7sbapq g==;
X-CSE-ConnectionGUID: SMJs53IrS8SeSeQnKayqiQ==
X-CSE-MsgGUID: TkWWUwDJQvm5QKTDIA7fjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="55921050"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="55921050"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 13:11:06 -0700
X-CSE-ConnectionGUID: ZdeQPwrsTVWHzoreBwiX9Q==
X-CSE-MsgGUID: AEsfiDINRNa9ysb8OaPecw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="162359712"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 13:11:06 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 13:11:05 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 30 Jul 2025 13:11:05 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.58)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 13:11:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CFVU6ygKO2apu8mWwqkyJXdSnQdEvWT2sh7FtX+FYnUQAdGRqmtfV+YwvZ3cW9x0z3SD9EvxhEWJiJGWC/qC3j577oSQ/CR8t02PVAl6m6b5dlqfq2RGyCQBVe3vSWJlmP7g04XOZxqaTWTppCK8DAZ/zfTNwxAxkxTi2USfoLPDX5BMWYbq+yEFud5mak3nYqQd8kLHYXx2uGyL2jaJ3neNLhkuXjkXyW3Te7V1cKca6ceeVEWThRURzOKQQxAtUHpaAdanPI79m6jiQhL+X3mATjlTj3lSYRGro1y8ZrGqf5cy0uISyUGQDhuuo0cfx9iKtwC9tmDeHX4fzW4lYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mUnQsVaiBymzCFNI18spCigaD9JdkuP2oEppAi/2mCA=;
 b=ByhED/CS64GeMU055sJImlNLFOrnZxzK9wC8UmzwnEafYflLPYHaDbM8u+/+4PqVtIOoWDti2gQrJuyZcDNzRwmvbifr+Cn184ezCmKgwwSHTxU+DmXxqN7q4Rmsep5zYhLEtM4Hm/vxm/tI6aKWNWUNN2osTZPAWDs/olmuLPyv6NWQvHj5cu/gPFUkIZ/2YHBzEwVaAdHyz7QnLCiD74GPgXuuELKKvJQJZdpfcmroe/o/qHtuLMrnLUcWMvfPZ6Bm6OW8gC4ZIH4fWu4BCltBccTQxuGnsuIyDm8zp7l+5r/jZabKuWZ1rice0cPHweawvejibyWV6ov5PBXAWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21)
 by PH3PPF179F31853.namprd11.prod.outlook.com (2603:10b6:518:1::d0b)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Wed, 30 Jul
 2025 20:11:01 +0000
Received: from CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2]) by CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2%7]) with mapi id 15.20.8964.026; Wed, 30 Jul 2025
 20:11:01 +0000
Message-ID: <63041a31-77ab-4b25-9978-a02c11c15950@intel.com>
Date: Wed, 30 Jul 2025 13:10:59 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/11] drm/xe/configfs: Only allow configurations for
 supported devices
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
References: <20250729114215.177586-1-michal.wajdeczko@intel.com>
 <20250729114215.177586-11-michal.wajdeczko@intel.com>
 <aIk_4BBGSuIp19WQ@intel.com> <311dc290-d5fe-4214-b332-96337f3c80a8@intel.com>
 <91cb7b75-3fbb-4749-b048-de55a9599ada@intel.com> <aIpIu4UdcmVDCzur@intel.com>
 <4f3a7559-985d-4212-a4b1-6f6386375ca9@intel.com> <aIpkWIw3EAKVglLU@intel.com>
 <e0b09023-128c-4ed0-a8c8-2d12fad11692@intel.com> <aIp7xMIBagfd0DtA@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <aIp7xMIBagfd0DtA@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0121.namprd03.prod.outlook.com
 (2603:10b6:303:8c::6) To CY5PR11MB6391.namprd11.prod.outlook.com
 (2603:10b6:930:38::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6391:EE_|PH3PPF179F31853:EE_
X-MS-Office365-Filtering-Correlation-Id: 15be92fb-1228-4b9e-2c18-08ddcfa53490
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SE9lVTM2K3MzSDF1NytBRE5iOTB2aXpnY243eEFRM0JFM21kTmRVZ0x3aGRm?=
 =?utf-8?B?OHlSWlBKRi82OGN4dEdqdDVLaEFUWHMzVDRQTWlGNU9Bbm9FcTAzWFJLcDc5?=
 =?utf-8?B?TlhqeGhiVTdtYzg5NjlnS3duS2Ixc3Z5ZTh3OGxBZlM3cURKeG5rNENlTHBD?=
 =?utf-8?B?eGpLRGFzc1F6bGxSbHhKRHlJZnVCeHZZNTBSajRkWVNhVVJRRWZzdGVxRnpW?=
 =?utf-8?B?MGRKNzlPL0pTQ3I3cDdKeTlSQUpwUVpaVWJlTEhFdFFVYXZobjJMY256OVNT?=
 =?utf-8?B?dllWNEZkVEJFSVVjSEo2SXVjN0xIZS9PVjQraGJ5R3NYVkU0QzM0NUw4SCtO?=
 =?utf-8?B?NnZ3S0lNYlBOMWl5NFVnVGp0cDlxSVMzQVQybTBpc2FRSFZoeDk1c2ZIazUr?=
 =?utf-8?B?TUg3SE5rYzRVdFVCWllyb0N3aHZENHVvRk0xczZqekRQVGhnVFppZm9IRWRO?=
 =?utf-8?B?L1dQUDIxSnp6N2Q1cmZpOVJBVGVHZFVSeForRGQ3OGx1ZGxQenZDeExjTEdR?=
 =?utf-8?B?WEZRUHJqb3FlNmx2aHA0Mld4OXdYbjhEK0llTnl5VkhOeWdZNHgrME5PbkRv?=
 =?utf-8?B?Vy9Rd2l4Z2NwTG4zaWxRMEFCL0c3Rk9GOUZ4dEFTdlZRdCtFSklvaXpSWWxH?=
 =?utf-8?B?UVcrVnFYNVA5WUwyWmZWbFAwNDMvWjF2dDVKbTRYcmZjbGxGRFFTV0JlWEpB?=
 =?utf-8?B?R3k4RDlZbWxwOTVnZXJNTkJPR1RieGpodzdKMlcyZlREakM5MWlGdWFZQThU?=
 =?utf-8?B?VGxQVG96MXVMbG5rWG9wRFNyRlQyMTBoSHRGbXNQVXgvdUxoVzRNSWkvcXRN?=
 =?utf-8?B?bHBCdURpVTlWT3grbGpIRWxCdXYxc0Jtai9lZlI0dzl2TityTTBrZGZ1QStW?=
 =?utf-8?B?QXJhVXRsdmEvZm42WDV5bUg4UXcyVUNZdjZRa1RlMlBGRWhQa0JJbE1hNTBD?=
 =?utf-8?B?Z2p6Ry9ZcEQyZzFDbzFjQnZDQnVjeCtuakJxZ3M1SVZYZDV6QTFUMTFuejRq?=
 =?utf-8?B?ZzRNZlZIZlU2Y2JUT1d0R0NCNzN1d1dHbDByNm94cTkxZ2M3UjdST2FZbzVp?=
 =?utf-8?B?TDkvNlJXWW4yb0doN0c1bEZ5S0dZUDFMKzIxWnhtSHdMZzN0OVA2MC9uZkxa?=
 =?utf-8?B?cVBMTVY3Yy9jbE9OSzF5YnZjMFhWWm5vYmo1YVVmSTJDRWFvWmEvenNqaWlO?=
 =?utf-8?B?Y01HTkxKTzl4TTNFeVpzL1BEeHNlZTUzRUJsdE1ZeVNUeWQvYWVhVmt2MUJy?=
 =?utf-8?B?bThXcE1XUzc1VWdxbUx6cUZZRXlsTm1raERUYlc2VE9tQmgwV1g3MWhRZ2ZI?=
 =?utf-8?B?TUNaYWNyN1ZMbWt0WkxkbDdKMm05c0tMNXVPdFcrc0lMTUVHbmFIWGp6TkFO?=
 =?utf-8?B?S09jZGswNjZ5Y3BrRDRwRTJUam45QXduU2YzV05oM3FwdFVNcE1aUlFBQlpF?=
 =?utf-8?B?RUkrS1Q3M1ZYWThiSDRockFPVFpjZ0ExR3pxR2R5V0w1QWRXZzRXMVFYbndl?=
 =?utf-8?B?WktCODhEUDhZRlZGbVBweWRTTEVEVEc4ZXVnN3VLVnU3V0VLTEZFQWx4MTh0?=
 =?utf-8?B?S0ZpckVqUWwrTjVGNzg5cnhDMGk1VC9UM0M4YlZ6ZW00alNKWE9iQ0ZpcXo1?=
 =?utf-8?B?SUZtV01kQm5vczBRWlRWZjA0NTg3YXhwM204RXF5bmlpUHh6QXpkTEJxNkd5?=
 =?utf-8?B?aDlRWDMzZGhNRk15czc5V3VNdUpidEs0V1dQemg0SSsyazc4a09icXpzMGFN?=
 =?utf-8?B?MEM4dVhRSUtTQXJMNFBPYjdkaXB3SnB3d0NWV3FtQjkyalgrQ2tCNlBIYWl1?=
 =?utf-8?B?Z1RDdjhxWDdBcW5VZzRXVnVxNU5ZY0EwU0prdkhnRDM2TXhhM2V1cWZGbXJS?=
 =?utf-8?B?WXdtZDVoOHZEWjBmM1J2SlNXRnkvZlB0RE5CRWFBem1JYUE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6391.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXd3VC9FZ2NLdDU4YXlGNFhFVWZBbjRJZ0VoSmxBZThiNmJKWmNmRGR2TDgr?=
 =?utf-8?B?aitqbUo1Qml5Zk5aYXFoemV4V0ZKSEYrZ3A3Ti9sNWVRbGZmUmoyVXlEZmxQ?=
 =?utf-8?B?M0NLWWw1RzZyVDBLSi9HZmxhNFlJd3pZTlA4cHQvMnp3VmpYVUZpaXNaU25m?=
 =?utf-8?B?N2hVYWFETHFkb1Q2RC8zUytoekpiLzBQRVpnZEQvSU5XTE5jTnl3bDB5SFpj?=
 =?utf-8?B?NDlZZS9EcGY1bmtqbTJJSUk5MWJuQ1N3TngzVGhEVEZFcGt6THhHK1RQK0Iv?=
 =?utf-8?B?eU96Y3pZSGV2TmJKTGFwU0ZTa2JFb3ltY2RXRU9XWU9zdExTU2dOK0RhNkxL?=
 =?utf-8?B?SzBJVU9sNGpDTjVNWk1YRGZHelI1aDNaSk1LM2gvQk96UVZIVE1vTW1SZHdJ?=
 =?utf-8?B?bzZNeVRaZ1p6Y1ZCb1R1b0pwcU9CTFFpVjFVeTdhOU4yLytyNmlVK1YrZnVm?=
 =?utf-8?B?a0JNaDdTVzZPLzZvbVRGTyt5bURtR3cyU3JLZisveWVxNFdrYXpYT1NPNiti?=
 =?utf-8?B?VU5OVGZUa3pyNzZHOGJoTkg0QTk2OXQ2aVA3N0dNYjNSSWFoeDU4WWhpYXJq?=
 =?utf-8?B?OExKV1l5ajlQTFdlOEQ1eTREbVY3WlNBRjJ4MmtjU29OVjVyUWRUZ1BBcmVX?=
 =?utf-8?B?TEtBT08yUys2NEhsS0dERWFvc25Kdi8ycmxJOFNUSTlnaU5yZmdlVUVqcXZz?=
 =?utf-8?B?MENXMnpxNzIzSHJWK3Fod2J1SUx4TnZQT3hCMEJoUU5INUdYSjM5V3Bia0I3?=
 =?utf-8?B?bHk4bklEU050NE9qOTF2WHdPT0U2OEFtNzJBczdDMTZvcXpmMUdwZyswZXBX?=
 =?utf-8?B?ZVJlRUgwYTAvcjd5UHJ2NUNHcUYxZGxuU2FlSENMMlQza1U0azZJa2JBVnJn?=
 =?utf-8?B?MGFkV1R4azVyU0ErSDhUcU54aWx3d1RQZjNndFRPazNMbWUvd0Y1RGVVd3lw?=
 =?utf-8?B?Znp5Ung5eXMwM2p3SW9PazMvYVRISWJqV3hLMk1zRzJOVUZQTExGbnRmRGZ5?=
 =?utf-8?B?Tm9wRVNEOXRNNURpSmRHT0NZUHNTbVVTQWdQSWg4dCtPWkZUTmpKQ2phS2dx?=
 =?utf-8?B?Uk1hL0NtMWtlRmNrQUZYMHc3SkM0d3dKdGJwRzV2MFpER3F1R3pPT2N2c3RD?=
 =?utf-8?B?eVhWYjl1a3FJeVFPcHNXV0lYUExJcTFCVHZXb0VCRTNYUWNoY3o0ejQzL0Rj?=
 =?utf-8?B?NG9ldU5KcndQMEM2RXltdTRFUTNQL05nbDFBNUZKellwdENYRzRsWmhUbFl4?=
 =?utf-8?B?MFBEZWpQNldRUS9aRnVqVDJVWGdiM0xTKzJmZDJHMCtRL2h0am50QUc3bi83?=
 =?utf-8?B?cDJiMU9wbm8vNE8xelNOU3M0Vjk5TEswNmNRRHN4MHFocDltU0lQdnMvV2ZK?=
 =?utf-8?B?blpiUVIrQmxLMzlrVlJRSkVKR0poQTJmVHJvMEJIbnJRWGtLMjZJcmUyeW4y?=
 =?utf-8?B?Y3dSNFpkblRMcVcwbDlIQ2JNVXFzT0tBY0EzYW9URUkyNmZuSlFHZlo2a09y?=
 =?utf-8?B?UlZoYmdBVkxUbzN5bmtaTHU2ZER4TDBRWWJjZFNXd2NFeldPMmQ1VkFTQ01I?=
 =?utf-8?B?a1NqQjFlVjlocmkyYnJ2MWx5TERPeGM2SVprQ2tmOHZROW94YStFWnl4Yktn?=
 =?utf-8?B?aCs4ZXZhMFlpTGhQZWtOS29qbW0rQThsZ1U2Z0VNL2ZieStib3Q2ZHprZEl5?=
 =?utf-8?B?UFVyRSsvZERnTURlK1ZYTjJOQ01VYkdIZkE1SUl6VmFFeURWOTYwMWVuUkor?=
 =?utf-8?B?dWFodFROV2RpdUdESzZFNXQ4NVIzdGIzMjBWUWlpMmMwUkhwd2Z6emV0SlJV?=
 =?utf-8?B?T3I3WHZITkdoUnl1cFlta0s4NHVYUUlMTjVWNy9UazB4VHhGSkRLNTAyRTUv?=
 =?utf-8?B?U1hKaW9qNHN3UjN6SFp3bVgveXBBdkJIeWxZQjN0dE03NWxnbzVrQk9TblNr?=
 =?utf-8?B?YjduQ2VhNFR3RGpPWTlwbW9QRlpGVjdtZExRcktTbWhNWEl0ejhrYUQyOWhv?=
 =?utf-8?B?enZsUERoc0orZ1RuY2NURnFpaDNHRmFmL21oWGc3bGpxTkl6M2ZVZjJsT0pZ?=
 =?utf-8?B?MHZuSndROEgxOXhwWGlLczFnUEhEbkdVRUs3cmxFa3c0M3hSeExoMnpYdGpo?=
 =?utf-8?B?U0k4NzZTTnk2RzFjNXBOZlI4WEw1eTNvTXpaOVRSdGFVSTNKV2xVNzZiMVFw?=
 =?utf-8?B?S2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 15be92fb-1228-4b9e-2c18-08ddcfa53490
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6391.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 20:11:01.6510 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k14+CUBvu21LKogPEyRHsvrcXbR5kuuLTRYwk0F/KB1n/d8N6fO8uJ8MPhCOPWKWcRzutQdDJFtbQUQvPHfk1cfzNpi3Dnn2VwtKhhjbQcw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF179F31853
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

On 7/30/2025 1:08 PM, Rodrigo Vivi wrote:
> On Wed, Jul 30, 2025 at 09:57:01PM +0200, Michal Wajdeczko wrote:
>> On 7/30/2025 8:28 PM, Rodrigo Vivi wrote:
>>> On Wed, Jul 30, 2025 at 10:12:06AM -0700, John Harrison wrote:
>>>> On 7/30/2025 9:30 AM, Rodrigo Vivi wrote:
>>>>> On Wed, Jul 30, 2025 at 10:23:22AM +0200, Michal Wajdeczko wrote:
>>>>>> On 7/30/2025 12:20 AM, John Harrison wrote:
>>>>>>> On 7/29/2025 2:40 PM, Rodrigo Vivi wrote:
>>>>>>>> On Tue, Jul 29, 2025 at 01:42:14PM +0200, Michal Wajdeczko wrote:
>>>>>>>>> Since we already lookup for the real PCI device before we allow
>>>>>>>>> to create its directory config, we might also check if the found
>>>>>>>>> device matches our driver PCI ID list. This will prevent creation
>>>>>>>>> of the directory configs for the unsupported devices.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>>>>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>>>>>> ---
>>>>>>>>> v2: rebased
>>>>>>>>> ---
>>>>>>>>>     drivers/gpu/drm/xe/xe_configfs.c | 17 +++++++++++++++++
>>>>>>>>>     1 file changed, 17 insertions(+)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>>>>>>>>> index 5f145ccdf535..766775772eef 100644
>>>>>>>>> --- a/drivers/gpu/drm/xe/xe_configfs.c
>>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_configfs.c
>>>>>>>>> @@ -275,11 +275,22 @@ static const struct config_item_type xe_config_device_type = {
>>>>>>>>>         .ct_owner    = THIS_MODULE,
>>>>>>>>>     };
>>>>>>>>>     +static const struct xe_device_desc *xe_match_desc(struct pci_dev *pdev)
>>>>>>>>> +{
>>>>>>>>> +    struct device_driver *driver = driver_find("xe", &pci_bus_type);
>>>>>>>>> +    struct pci_driver *drv = to_pci_driver(driver);
>>>>>>>>> +    const struct pci_device_id *ids = drv ? drv->id_table : NULL;
>>>>>>>>> +    const struct pci_device_id *found = pci_match_id(ids, pdev);
>>>>>>>>> +
>>>>>>>>> +    return found ? (const void *)found->driver_data : NULL;
>>>>>>>>> +}
>>>>>>>>> +
>>>>>>>>>     static struct config_group *xe_config_make_device_group(struct config_group *group,
>>>>>>>>>                                 const char *name)
>>>>>>>>>     {
>>>>>>>>>         unsigned int domain, bus, slot, function;
>>>>>>>>>         struct xe_config_group_device *dev;
>>>>>>>>> +    const struct xe_device_desc *match;
>>>>>>>>>         struct pci_dev *pdev;
>>>>>>>>>         char canonical[16];
>>>>>>>>>         int ret;
>>>>>>>>> @@ -297,8 +308,14 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
>>>>>>>>>         pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot, function));
>>>>>>>>>         if (!pdev)
>>>>>>>>>             return ERR_PTR(-ENODEV);
>>>>>>>>> +
>>>>>>>>> +    match = xe_match_desc(pdev);
>>>>>>>>> +
>>>>>>>>>         pci_dev_put(pdev);
>>>>>>>>>     +    if (!match)
>>>>>>>>> +        return ERR_PTR(-ECANCELED);
>>>>>>>> why ECANCELED instead of ENODEV?
>>>>>>> Or EINVAL? This is for when a user has created a directory for a PCI device that exists but it is not a Xe device? Seems like ENODEV is not the correct option given that the device does exist. But ECANCELED also seems odd.
>>>>>> we can always return -EINVAL but user will have no clue what went wrong
>>>>>>
>>>>>> so the idea was:
>>>>>>
>>>>>> -EINVAL     when config directory name is malformed
>>>>>> -ENODEV     config directory name is correct but
>>>>>>               there is no such device under such BDF
>>>>>> -ECANCELED  when device exists but it is not covered by Xe driver
>>>>>>
>>>>>> since you both don't like -ECANCELED for this case, what about:
>>>>>>
>>>>>> -ECONNREFUSED /* Connection refused */
>>>>>> -EOPNOTSUPP   /* Operation not supported on transport endpoint */
>>>>>> -ENXIO        /* No such device or address */
>>>>> What about -ENODEV, but with debug messages to differentiate the cases?
>>>>>
>>>>> Otherwise -ENXIO seems the best of the alternatives here.
>>>> I'm confused by what is wrong with EINVAL. Are there many other paths that
>>>> can return EINVAL for this operation? If not then how is any other return
>>>> code any different from a user confusion point of view? But yes, I think at
>>>> least a debug message to say "requested device is not supported by this
>>>> driver" would be good.
>>> to me it looks more like a 'no device' than 'invalid device', hence my
>>> thought on the enodev, but no strong/hard preference to be honest.
>>> and we are definitely on the same page that there
>>> shouldn't be nothing wrong with reusing the error code and printing the
>>> debug message like 'requested device is not supported by this driver'...
>> looking at pci/iov.c where some diag messages are given:
>>
>> 	/* is PF driver loaded */
>> 	if (!pdev->driver) {
>> 		pci_info(pdev, "no driver bound to device; cannot configure SR-IOV\n");
>> 		ret = -ENOENT;
>> 		goto exit;
>> 	}
>>
>> 	/* is PF driver loaded w/callback */
>> 	if (!pdev->driver->sriov_configure) {
>> 		pci_info(pdev, "driver does not support SR-IOV configuration via sysfs\n");
>> 		ret = -ENOENT;
>> 		goto exit;
>> 	}
>>
>> so maybe we should use -ENOENT
>>
>> $ sudo mkdir /sys/kernel/config/xe/0000:00:07.0
>> mkdir: cannot create directory ‘/sys/kernel/config/xe/0000:00:07.0’: No such file or directory
>>
>> and print message using pci_info() like this
>>
>> pcieport 0000:00:07.0: xe driver does not support configuration of this device
> works for me.
Likewise. Ship it.

John.

>
>
>>
>>>> John.
>>>>
>>>>
>>>>>>> John.
>>>>>>>
>>>>>>>>> +
>>>>>>>>>         dev = kzalloc(sizeof(*dev), GFP_KERNEL);
>>>>>>>>>         if (!dev)
>>>>>>>>>             return ERR_PTR(-ENOMEM);
>>>>>>>>> -- 
>>>>>>>>> 2.47.1
>>>>>>>>>

